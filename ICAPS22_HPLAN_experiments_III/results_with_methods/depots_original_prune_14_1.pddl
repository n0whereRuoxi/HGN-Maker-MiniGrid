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

  ( :method MAKE-14CRATE-VERIFY
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
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258080 - SURFACE
      ?auto_1258081 - SURFACE
    )
    :vars
    (
      ?auto_1258082 - HOIST
      ?auto_1258083 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258082 ?auto_1258083 ) ( SURFACE-AT ?auto_1258080 ?auto_1258083 ) ( CLEAR ?auto_1258080 ) ( LIFTING ?auto_1258082 ?auto_1258081 ) ( IS-CRATE ?auto_1258081 ) ( not ( = ?auto_1258080 ?auto_1258081 ) ) )
    :subtasks
    ( ( !DROP ?auto_1258082 ?auto_1258081 ?auto_1258080 ?auto_1258083 )
      ( MAKE-1CRATE-VERIFY ?auto_1258080 ?auto_1258081 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258084 - SURFACE
      ?auto_1258085 - SURFACE
    )
    :vars
    (
      ?auto_1258087 - HOIST
      ?auto_1258086 - PLACE
      ?auto_1258088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258087 ?auto_1258086 ) ( SURFACE-AT ?auto_1258084 ?auto_1258086 ) ( CLEAR ?auto_1258084 ) ( IS-CRATE ?auto_1258085 ) ( not ( = ?auto_1258084 ?auto_1258085 ) ) ( TRUCK-AT ?auto_1258088 ?auto_1258086 ) ( AVAILABLE ?auto_1258087 ) ( IN ?auto_1258085 ?auto_1258088 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1258087 ?auto_1258085 ?auto_1258088 ?auto_1258086 )
      ( MAKE-1CRATE ?auto_1258084 ?auto_1258085 )
      ( MAKE-1CRATE-VERIFY ?auto_1258084 ?auto_1258085 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258089 - SURFACE
      ?auto_1258090 - SURFACE
    )
    :vars
    (
      ?auto_1258091 - HOIST
      ?auto_1258093 - PLACE
      ?auto_1258092 - TRUCK
      ?auto_1258094 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258091 ?auto_1258093 ) ( SURFACE-AT ?auto_1258089 ?auto_1258093 ) ( CLEAR ?auto_1258089 ) ( IS-CRATE ?auto_1258090 ) ( not ( = ?auto_1258089 ?auto_1258090 ) ) ( AVAILABLE ?auto_1258091 ) ( IN ?auto_1258090 ?auto_1258092 ) ( TRUCK-AT ?auto_1258092 ?auto_1258094 ) ( not ( = ?auto_1258094 ?auto_1258093 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1258092 ?auto_1258094 ?auto_1258093 )
      ( MAKE-1CRATE ?auto_1258089 ?auto_1258090 )
      ( MAKE-1CRATE-VERIFY ?auto_1258089 ?auto_1258090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258095 - SURFACE
      ?auto_1258096 - SURFACE
    )
    :vars
    (
      ?auto_1258099 - HOIST
      ?auto_1258100 - PLACE
      ?auto_1258097 - TRUCK
      ?auto_1258098 - PLACE
      ?auto_1258101 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258099 ?auto_1258100 ) ( SURFACE-AT ?auto_1258095 ?auto_1258100 ) ( CLEAR ?auto_1258095 ) ( IS-CRATE ?auto_1258096 ) ( not ( = ?auto_1258095 ?auto_1258096 ) ) ( AVAILABLE ?auto_1258099 ) ( TRUCK-AT ?auto_1258097 ?auto_1258098 ) ( not ( = ?auto_1258098 ?auto_1258100 ) ) ( HOIST-AT ?auto_1258101 ?auto_1258098 ) ( LIFTING ?auto_1258101 ?auto_1258096 ) ( not ( = ?auto_1258099 ?auto_1258101 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1258101 ?auto_1258096 ?auto_1258097 ?auto_1258098 )
      ( MAKE-1CRATE ?auto_1258095 ?auto_1258096 )
      ( MAKE-1CRATE-VERIFY ?auto_1258095 ?auto_1258096 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258102 - SURFACE
      ?auto_1258103 - SURFACE
    )
    :vars
    (
      ?auto_1258104 - HOIST
      ?auto_1258107 - PLACE
      ?auto_1258106 - TRUCK
      ?auto_1258108 - PLACE
      ?auto_1258105 - HOIST
      ?auto_1258109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258104 ?auto_1258107 ) ( SURFACE-AT ?auto_1258102 ?auto_1258107 ) ( CLEAR ?auto_1258102 ) ( IS-CRATE ?auto_1258103 ) ( not ( = ?auto_1258102 ?auto_1258103 ) ) ( AVAILABLE ?auto_1258104 ) ( TRUCK-AT ?auto_1258106 ?auto_1258108 ) ( not ( = ?auto_1258108 ?auto_1258107 ) ) ( HOIST-AT ?auto_1258105 ?auto_1258108 ) ( not ( = ?auto_1258104 ?auto_1258105 ) ) ( AVAILABLE ?auto_1258105 ) ( SURFACE-AT ?auto_1258103 ?auto_1258108 ) ( ON ?auto_1258103 ?auto_1258109 ) ( CLEAR ?auto_1258103 ) ( not ( = ?auto_1258102 ?auto_1258109 ) ) ( not ( = ?auto_1258103 ?auto_1258109 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1258105 ?auto_1258103 ?auto_1258109 ?auto_1258108 )
      ( MAKE-1CRATE ?auto_1258102 ?auto_1258103 )
      ( MAKE-1CRATE-VERIFY ?auto_1258102 ?auto_1258103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258110 - SURFACE
      ?auto_1258111 - SURFACE
    )
    :vars
    (
      ?auto_1258117 - HOIST
      ?auto_1258113 - PLACE
      ?auto_1258116 - PLACE
      ?auto_1258112 - HOIST
      ?auto_1258115 - SURFACE
      ?auto_1258114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258117 ?auto_1258113 ) ( SURFACE-AT ?auto_1258110 ?auto_1258113 ) ( CLEAR ?auto_1258110 ) ( IS-CRATE ?auto_1258111 ) ( not ( = ?auto_1258110 ?auto_1258111 ) ) ( AVAILABLE ?auto_1258117 ) ( not ( = ?auto_1258116 ?auto_1258113 ) ) ( HOIST-AT ?auto_1258112 ?auto_1258116 ) ( not ( = ?auto_1258117 ?auto_1258112 ) ) ( AVAILABLE ?auto_1258112 ) ( SURFACE-AT ?auto_1258111 ?auto_1258116 ) ( ON ?auto_1258111 ?auto_1258115 ) ( CLEAR ?auto_1258111 ) ( not ( = ?auto_1258110 ?auto_1258115 ) ) ( not ( = ?auto_1258111 ?auto_1258115 ) ) ( TRUCK-AT ?auto_1258114 ?auto_1258113 ) )
    :subtasks
    ( ( !DRIVE ?auto_1258114 ?auto_1258113 ?auto_1258116 )
      ( MAKE-1CRATE ?auto_1258110 ?auto_1258111 )
      ( MAKE-1CRATE-VERIFY ?auto_1258110 ?auto_1258111 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1258127 - SURFACE
      ?auto_1258128 - SURFACE
      ?auto_1258129 - SURFACE
    )
    :vars
    (
      ?auto_1258131 - HOIST
      ?auto_1258130 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258131 ?auto_1258130 ) ( SURFACE-AT ?auto_1258128 ?auto_1258130 ) ( CLEAR ?auto_1258128 ) ( LIFTING ?auto_1258131 ?auto_1258129 ) ( IS-CRATE ?auto_1258129 ) ( not ( = ?auto_1258128 ?auto_1258129 ) ) ( ON ?auto_1258128 ?auto_1258127 ) ( not ( = ?auto_1258127 ?auto_1258128 ) ) ( not ( = ?auto_1258127 ?auto_1258129 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258128 ?auto_1258129 )
      ( MAKE-2CRATE-VERIFY ?auto_1258127 ?auto_1258128 ?auto_1258129 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1258137 - SURFACE
      ?auto_1258138 - SURFACE
      ?auto_1258139 - SURFACE
    )
    :vars
    (
      ?auto_1258140 - HOIST
      ?auto_1258141 - PLACE
      ?auto_1258142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258140 ?auto_1258141 ) ( SURFACE-AT ?auto_1258138 ?auto_1258141 ) ( CLEAR ?auto_1258138 ) ( IS-CRATE ?auto_1258139 ) ( not ( = ?auto_1258138 ?auto_1258139 ) ) ( TRUCK-AT ?auto_1258142 ?auto_1258141 ) ( AVAILABLE ?auto_1258140 ) ( IN ?auto_1258139 ?auto_1258142 ) ( ON ?auto_1258138 ?auto_1258137 ) ( not ( = ?auto_1258137 ?auto_1258138 ) ) ( not ( = ?auto_1258137 ?auto_1258139 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258138 ?auto_1258139 )
      ( MAKE-2CRATE-VERIFY ?auto_1258137 ?auto_1258138 ?auto_1258139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258143 - SURFACE
      ?auto_1258144 - SURFACE
    )
    :vars
    (
      ?auto_1258147 - HOIST
      ?auto_1258145 - PLACE
      ?auto_1258148 - TRUCK
      ?auto_1258146 - SURFACE
      ?auto_1258149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258147 ?auto_1258145 ) ( SURFACE-AT ?auto_1258143 ?auto_1258145 ) ( CLEAR ?auto_1258143 ) ( IS-CRATE ?auto_1258144 ) ( not ( = ?auto_1258143 ?auto_1258144 ) ) ( AVAILABLE ?auto_1258147 ) ( IN ?auto_1258144 ?auto_1258148 ) ( ON ?auto_1258143 ?auto_1258146 ) ( not ( = ?auto_1258146 ?auto_1258143 ) ) ( not ( = ?auto_1258146 ?auto_1258144 ) ) ( TRUCK-AT ?auto_1258148 ?auto_1258149 ) ( not ( = ?auto_1258149 ?auto_1258145 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1258148 ?auto_1258149 ?auto_1258145 )
      ( MAKE-2CRATE ?auto_1258146 ?auto_1258143 ?auto_1258144 )
      ( MAKE-1CRATE-VERIFY ?auto_1258143 ?auto_1258144 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1258150 - SURFACE
      ?auto_1258151 - SURFACE
      ?auto_1258152 - SURFACE
    )
    :vars
    (
      ?auto_1258154 - HOIST
      ?auto_1258153 - PLACE
      ?auto_1258155 - TRUCK
      ?auto_1258156 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258154 ?auto_1258153 ) ( SURFACE-AT ?auto_1258151 ?auto_1258153 ) ( CLEAR ?auto_1258151 ) ( IS-CRATE ?auto_1258152 ) ( not ( = ?auto_1258151 ?auto_1258152 ) ) ( AVAILABLE ?auto_1258154 ) ( IN ?auto_1258152 ?auto_1258155 ) ( ON ?auto_1258151 ?auto_1258150 ) ( not ( = ?auto_1258150 ?auto_1258151 ) ) ( not ( = ?auto_1258150 ?auto_1258152 ) ) ( TRUCK-AT ?auto_1258155 ?auto_1258156 ) ( not ( = ?auto_1258156 ?auto_1258153 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258151 ?auto_1258152 )
      ( MAKE-2CRATE-VERIFY ?auto_1258150 ?auto_1258151 ?auto_1258152 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258157 - SURFACE
      ?auto_1258158 - SURFACE
    )
    :vars
    (
      ?auto_1258162 - HOIST
      ?auto_1258159 - PLACE
      ?auto_1258163 - SURFACE
      ?auto_1258161 - TRUCK
      ?auto_1258160 - PLACE
      ?auto_1258164 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258162 ?auto_1258159 ) ( SURFACE-AT ?auto_1258157 ?auto_1258159 ) ( CLEAR ?auto_1258157 ) ( IS-CRATE ?auto_1258158 ) ( not ( = ?auto_1258157 ?auto_1258158 ) ) ( AVAILABLE ?auto_1258162 ) ( ON ?auto_1258157 ?auto_1258163 ) ( not ( = ?auto_1258163 ?auto_1258157 ) ) ( not ( = ?auto_1258163 ?auto_1258158 ) ) ( TRUCK-AT ?auto_1258161 ?auto_1258160 ) ( not ( = ?auto_1258160 ?auto_1258159 ) ) ( HOIST-AT ?auto_1258164 ?auto_1258160 ) ( LIFTING ?auto_1258164 ?auto_1258158 ) ( not ( = ?auto_1258162 ?auto_1258164 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1258164 ?auto_1258158 ?auto_1258161 ?auto_1258160 )
      ( MAKE-2CRATE ?auto_1258163 ?auto_1258157 ?auto_1258158 )
      ( MAKE-1CRATE-VERIFY ?auto_1258157 ?auto_1258158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1258165 - SURFACE
      ?auto_1258166 - SURFACE
      ?auto_1258167 - SURFACE
    )
    :vars
    (
      ?auto_1258170 - HOIST
      ?auto_1258169 - PLACE
      ?auto_1258172 - TRUCK
      ?auto_1258171 - PLACE
      ?auto_1258168 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258170 ?auto_1258169 ) ( SURFACE-AT ?auto_1258166 ?auto_1258169 ) ( CLEAR ?auto_1258166 ) ( IS-CRATE ?auto_1258167 ) ( not ( = ?auto_1258166 ?auto_1258167 ) ) ( AVAILABLE ?auto_1258170 ) ( ON ?auto_1258166 ?auto_1258165 ) ( not ( = ?auto_1258165 ?auto_1258166 ) ) ( not ( = ?auto_1258165 ?auto_1258167 ) ) ( TRUCK-AT ?auto_1258172 ?auto_1258171 ) ( not ( = ?auto_1258171 ?auto_1258169 ) ) ( HOIST-AT ?auto_1258168 ?auto_1258171 ) ( LIFTING ?auto_1258168 ?auto_1258167 ) ( not ( = ?auto_1258170 ?auto_1258168 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258166 ?auto_1258167 )
      ( MAKE-2CRATE-VERIFY ?auto_1258165 ?auto_1258166 ?auto_1258167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258173 - SURFACE
      ?auto_1258174 - SURFACE
    )
    :vars
    (
      ?auto_1258178 - HOIST
      ?auto_1258180 - PLACE
      ?auto_1258175 - SURFACE
      ?auto_1258179 - TRUCK
      ?auto_1258176 - PLACE
      ?auto_1258177 - HOIST
      ?auto_1258181 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258178 ?auto_1258180 ) ( SURFACE-AT ?auto_1258173 ?auto_1258180 ) ( CLEAR ?auto_1258173 ) ( IS-CRATE ?auto_1258174 ) ( not ( = ?auto_1258173 ?auto_1258174 ) ) ( AVAILABLE ?auto_1258178 ) ( ON ?auto_1258173 ?auto_1258175 ) ( not ( = ?auto_1258175 ?auto_1258173 ) ) ( not ( = ?auto_1258175 ?auto_1258174 ) ) ( TRUCK-AT ?auto_1258179 ?auto_1258176 ) ( not ( = ?auto_1258176 ?auto_1258180 ) ) ( HOIST-AT ?auto_1258177 ?auto_1258176 ) ( not ( = ?auto_1258178 ?auto_1258177 ) ) ( AVAILABLE ?auto_1258177 ) ( SURFACE-AT ?auto_1258174 ?auto_1258176 ) ( ON ?auto_1258174 ?auto_1258181 ) ( CLEAR ?auto_1258174 ) ( not ( = ?auto_1258173 ?auto_1258181 ) ) ( not ( = ?auto_1258174 ?auto_1258181 ) ) ( not ( = ?auto_1258175 ?auto_1258181 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1258177 ?auto_1258174 ?auto_1258181 ?auto_1258176 )
      ( MAKE-2CRATE ?auto_1258175 ?auto_1258173 ?auto_1258174 )
      ( MAKE-1CRATE-VERIFY ?auto_1258173 ?auto_1258174 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1258182 - SURFACE
      ?auto_1258183 - SURFACE
      ?auto_1258184 - SURFACE
    )
    :vars
    (
      ?auto_1258186 - HOIST
      ?auto_1258185 - PLACE
      ?auto_1258189 - TRUCK
      ?auto_1258190 - PLACE
      ?auto_1258187 - HOIST
      ?auto_1258188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258186 ?auto_1258185 ) ( SURFACE-AT ?auto_1258183 ?auto_1258185 ) ( CLEAR ?auto_1258183 ) ( IS-CRATE ?auto_1258184 ) ( not ( = ?auto_1258183 ?auto_1258184 ) ) ( AVAILABLE ?auto_1258186 ) ( ON ?auto_1258183 ?auto_1258182 ) ( not ( = ?auto_1258182 ?auto_1258183 ) ) ( not ( = ?auto_1258182 ?auto_1258184 ) ) ( TRUCK-AT ?auto_1258189 ?auto_1258190 ) ( not ( = ?auto_1258190 ?auto_1258185 ) ) ( HOIST-AT ?auto_1258187 ?auto_1258190 ) ( not ( = ?auto_1258186 ?auto_1258187 ) ) ( AVAILABLE ?auto_1258187 ) ( SURFACE-AT ?auto_1258184 ?auto_1258190 ) ( ON ?auto_1258184 ?auto_1258188 ) ( CLEAR ?auto_1258184 ) ( not ( = ?auto_1258183 ?auto_1258188 ) ) ( not ( = ?auto_1258184 ?auto_1258188 ) ) ( not ( = ?auto_1258182 ?auto_1258188 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258183 ?auto_1258184 )
      ( MAKE-2CRATE-VERIFY ?auto_1258182 ?auto_1258183 ?auto_1258184 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258191 - SURFACE
      ?auto_1258192 - SURFACE
    )
    :vars
    (
      ?auto_1258199 - HOIST
      ?auto_1258194 - PLACE
      ?auto_1258198 - SURFACE
      ?auto_1258195 - PLACE
      ?auto_1258196 - HOIST
      ?auto_1258193 - SURFACE
      ?auto_1258197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258199 ?auto_1258194 ) ( SURFACE-AT ?auto_1258191 ?auto_1258194 ) ( CLEAR ?auto_1258191 ) ( IS-CRATE ?auto_1258192 ) ( not ( = ?auto_1258191 ?auto_1258192 ) ) ( AVAILABLE ?auto_1258199 ) ( ON ?auto_1258191 ?auto_1258198 ) ( not ( = ?auto_1258198 ?auto_1258191 ) ) ( not ( = ?auto_1258198 ?auto_1258192 ) ) ( not ( = ?auto_1258195 ?auto_1258194 ) ) ( HOIST-AT ?auto_1258196 ?auto_1258195 ) ( not ( = ?auto_1258199 ?auto_1258196 ) ) ( AVAILABLE ?auto_1258196 ) ( SURFACE-AT ?auto_1258192 ?auto_1258195 ) ( ON ?auto_1258192 ?auto_1258193 ) ( CLEAR ?auto_1258192 ) ( not ( = ?auto_1258191 ?auto_1258193 ) ) ( not ( = ?auto_1258192 ?auto_1258193 ) ) ( not ( = ?auto_1258198 ?auto_1258193 ) ) ( TRUCK-AT ?auto_1258197 ?auto_1258194 ) )
    :subtasks
    ( ( !DRIVE ?auto_1258197 ?auto_1258194 ?auto_1258195 )
      ( MAKE-2CRATE ?auto_1258198 ?auto_1258191 ?auto_1258192 )
      ( MAKE-1CRATE-VERIFY ?auto_1258191 ?auto_1258192 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1258200 - SURFACE
      ?auto_1258201 - SURFACE
      ?auto_1258202 - SURFACE
    )
    :vars
    (
      ?auto_1258204 - HOIST
      ?auto_1258205 - PLACE
      ?auto_1258206 - PLACE
      ?auto_1258203 - HOIST
      ?auto_1258207 - SURFACE
      ?auto_1258208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258204 ?auto_1258205 ) ( SURFACE-AT ?auto_1258201 ?auto_1258205 ) ( CLEAR ?auto_1258201 ) ( IS-CRATE ?auto_1258202 ) ( not ( = ?auto_1258201 ?auto_1258202 ) ) ( AVAILABLE ?auto_1258204 ) ( ON ?auto_1258201 ?auto_1258200 ) ( not ( = ?auto_1258200 ?auto_1258201 ) ) ( not ( = ?auto_1258200 ?auto_1258202 ) ) ( not ( = ?auto_1258206 ?auto_1258205 ) ) ( HOIST-AT ?auto_1258203 ?auto_1258206 ) ( not ( = ?auto_1258204 ?auto_1258203 ) ) ( AVAILABLE ?auto_1258203 ) ( SURFACE-AT ?auto_1258202 ?auto_1258206 ) ( ON ?auto_1258202 ?auto_1258207 ) ( CLEAR ?auto_1258202 ) ( not ( = ?auto_1258201 ?auto_1258207 ) ) ( not ( = ?auto_1258202 ?auto_1258207 ) ) ( not ( = ?auto_1258200 ?auto_1258207 ) ) ( TRUCK-AT ?auto_1258208 ?auto_1258205 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258201 ?auto_1258202 )
      ( MAKE-2CRATE-VERIFY ?auto_1258200 ?auto_1258201 ?auto_1258202 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258209 - SURFACE
      ?auto_1258210 - SURFACE
    )
    :vars
    (
      ?auto_1258212 - HOIST
      ?auto_1258214 - PLACE
      ?auto_1258217 - SURFACE
      ?auto_1258213 - PLACE
      ?auto_1258211 - HOIST
      ?auto_1258216 - SURFACE
      ?auto_1258215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258212 ?auto_1258214 ) ( IS-CRATE ?auto_1258210 ) ( not ( = ?auto_1258209 ?auto_1258210 ) ) ( not ( = ?auto_1258217 ?auto_1258209 ) ) ( not ( = ?auto_1258217 ?auto_1258210 ) ) ( not ( = ?auto_1258213 ?auto_1258214 ) ) ( HOIST-AT ?auto_1258211 ?auto_1258213 ) ( not ( = ?auto_1258212 ?auto_1258211 ) ) ( AVAILABLE ?auto_1258211 ) ( SURFACE-AT ?auto_1258210 ?auto_1258213 ) ( ON ?auto_1258210 ?auto_1258216 ) ( CLEAR ?auto_1258210 ) ( not ( = ?auto_1258209 ?auto_1258216 ) ) ( not ( = ?auto_1258210 ?auto_1258216 ) ) ( not ( = ?auto_1258217 ?auto_1258216 ) ) ( TRUCK-AT ?auto_1258215 ?auto_1258214 ) ( SURFACE-AT ?auto_1258217 ?auto_1258214 ) ( CLEAR ?auto_1258217 ) ( LIFTING ?auto_1258212 ?auto_1258209 ) ( IS-CRATE ?auto_1258209 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258217 ?auto_1258209 )
      ( MAKE-2CRATE ?auto_1258217 ?auto_1258209 ?auto_1258210 )
      ( MAKE-1CRATE-VERIFY ?auto_1258209 ?auto_1258210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1258218 - SURFACE
      ?auto_1258219 - SURFACE
      ?auto_1258220 - SURFACE
    )
    :vars
    (
      ?auto_1258226 - HOIST
      ?auto_1258224 - PLACE
      ?auto_1258221 - PLACE
      ?auto_1258223 - HOIST
      ?auto_1258225 - SURFACE
      ?auto_1258222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258226 ?auto_1258224 ) ( IS-CRATE ?auto_1258220 ) ( not ( = ?auto_1258219 ?auto_1258220 ) ) ( not ( = ?auto_1258218 ?auto_1258219 ) ) ( not ( = ?auto_1258218 ?auto_1258220 ) ) ( not ( = ?auto_1258221 ?auto_1258224 ) ) ( HOIST-AT ?auto_1258223 ?auto_1258221 ) ( not ( = ?auto_1258226 ?auto_1258223 ) ) ( AVAILABLE ?auto_1258223 ) ( SURFACE-AT ?auto_1258220 ?auto_1258221 ) ( ON ?auto_1258220 ?auto_1258225 ) ( CLEAR ?auto_1258220 ) ( not ( = ?auto_1258219 ?auto_1258225 ) ) ( not ( = ?auto_1258220 ?auto_1258225 ) ) ( not ( = ?auto_1258218 ?auto_1258225 ) ) ( TRUCK-AT ?auto_1258222 ?auto_1258224 ) ( SURFACE-AT ?auto_1258218 ?auto_1258224 ) ( CLEAR ?auto_1258218 ) ( LIFTING ?auto_1258226 ?auto_1258219 ) ( IS-CRATE ?auto_1258219 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258219 ?auto_1258220 )
      ( MAKE-2CRATE-VERIFY ?auto_1258218 ?auto_1258219 ?auto_1258220 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258227 - SURFACE
      ?auto_1258228 - SURFACE
    )
    :vars
    (
      ?auto_1258232 - HOIST
      ?auto_1258230 - PLACE
      ?auto_1258229 - SURFACE
      ?auto_1258231 - PLACE
      ?auto_1258233 - HOIST
      ?auto_1258234 - SURFACE
      ?auto_1258235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258232 ?auto_1258230 ) ( IS-CRATE ?auto_1258228 ) ( not ( = ?auto_1258227 ?auto_1258228 ) ) ( not ( = ?auto_1258229 ?auto_1258227 ) ) ( not ( = ?auto_1258229 ?auto_1258228 ) ) ( not ( = ?auto_1258231 ?auto_1258230 ) ) ( HOIST-AT ?auto_1258233 ?auto_1258231 ) ( not ( = ?auto_1258232 ?auto_1258233 ) ) ( AVAILABLE ?auto_1258233 ) ( SURFACE-AT ?auto_1258228 ?auto_1258231 ) ( ON ?auto_1258228 ?auto_1258234 ) ( CLEAR ?auto_1258228 ) ( not ( = ?auto_1258227 ?auto_1258234 ) ) ( not ( = ?auto_1258228 ?auto_1258234 ) ) ( not ( = ?auto_1258229 ?auto_1258234 ) ) ( TRUCK-AT ?auto_1258235 ?auto_1258230 ) ( SURFACE-AT ?auto_1258229 ?auto_1258230 ) ( CLEAR ?auto_1258229 ) ( IS-CRATE ?auto_1258227 ) ( AVAILABLE ?auto_1258232 ) ( IN ?auto_1258227 ?auto_1258235 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1258232 ?auto_1258227 ?auto_1258235 ?auto_1258230 )
      ( MAKE-2CRATE ?auto_1258229 ?auto_1258227 ?auto_1258228 )
      ( MAKE-1CRATE-VERIFY ?auto_1258227 ?auto_1258228 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1258236 - SURFACE
      ?auto_1258237 - SURFACE
      ?auto_1258238 - SURFACE
    )
    :vars
    (
      ?auto_1258243 - HOIST
      ?auto_1258241 - PLACE
      ?auto_1258242 - PLACE
      ?auto_1258240 - HOIST
      ?auto_1258244 - SURFACE
      ?auto_1258239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258243 ?auto_1258241 ) ( IS-CRATE ?auto_1258238 ) ( not ( = ?auto_1258237 ?auto_1258238 ) ) ( not ( = ?auto_1258236 ?auto_1258237 ) ) ( not ( = ?auto_1258236 ?auto_1258238 ) ) ( not ( = ?auto_1258242 ?auto_1258241 ) ) ( HOIST-AT ?auto_1258240 ?auto_1258242 ) ( not ( = ?auto_1258243 ?auto_1258240 ) ) ( AVAILABLE ?auto_1258240 ) ( SURFACE-AT ?auto_1258238 ?auto_1258242 ) ( ON ?auto_1258238 ?auto_1258244 ) ( CLEAR ?auto_1258238 ) ( not ( = ?auto_1258237 ?auto_1258244 ) ) ( not ( = ?auto_1258238 ?auto_1258244 ) ) ( not ( = ?auto_1258236 ?auto_1258244 ) ) ( TRUCK-AT ?auto_1258239 ?auto_1258241 ) ( SURFACE-AT ?auto_1258236 ?auto_1258241 ) ( CLEAR ?auto_1258236 ) ( IS-CRATE ?auto_1258237 ) ( AVAILABLE ?auto_1258243 ) ( IN ?auto_1258237 ?auto_1258239 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258237 ?auto_1258238 )
      ( MAKE-2CRATE-VERIFY ?auto_1258236 ?auto_1258237 ?auto_1258238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258281 - SURFACE
      ?auto_1258282 - SURFACE
    )
    :vars
    (
      ?auto_1258283 - HOIST
      ?auto_1258284 - PLACE
      ?auto_1258288 - SURFACE
      ?auto_1258285 - PLACE
      ?auto_1258287 - HOIST
      ?auto_1258286 - SURFACE
      ?auto_1258289 - TRUCK
      ?auto_1258290 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258283 ?auto_1258284 ) ( SURFACE-AT ?auto_1258281 ?auto_1258284 ) ( CLEAR ?auto_1258281 ) ( IS-CRATE ?auto_1258282 ) ( not ( = ?auto_1258281 ?auto_1258282 ) ) ( AVAILABLE ?auto_1258283 ) ( ON ?auto_1258281 ?auto_1258288 ) ( not ( = ?auto_1258288 ?auto_1258281 ) ) ( not ( = ?auto_1258288 ?auto_1258282 ) ) ( not ( = ?auto_1258285 ?auto_1258284 ) ) ( HOIST-AT ?auto_1258287 ?auto_1258285 ) ( not ( = ?auto_1258283 ?auto_1258287 ) ) ( AVAILABLE ?auto_1258287 ) ( SURFACE-AT ?auto_1258282 ?auto_1258285 ) ( ON ?auto_1258282 ?auto_1258286 ) ( CLEAR ?auto_1258282 ) ( not ( = ?auto_1258281 ?auto_1258286 ) ) ( not ( = ?auto_1258282 ?auto_1258286 ) ) ( not ( = ?auto_1258288 ?auto_1258286 ) ) ( TRUCK-AT ?auto_1258289 ?auto_1258290 ) ( not ( = ?auto_1258290 ?auto_1258284 ) ) ( not ( = ?auto_1258285 ?auto_1258290 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1258289 ?auto_1258290 ?auto_1258284 )
      ( MAKE-1CRATE ?auto_1258281 ?auto_1258282 )
      ( MAKE-1CRATE-VERIFY ?auto_1258281 ?auto_1258282 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1258320 - SURFACE
      ?auto_1258321 - SURFACE
      ?auto_1258322 - SURFACE
      ?auto_1258323 - SURFACE
    )
    :vars
    (
      ?auto_1258325 - HOIST
      ?auto_1258324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258325 ?auto_1258324 ) ( SURFACE-AT ?auto_1258322 ?auto_1258324 ) ( CLEAR ?auto_1258322 ) ( LIFTING ?auto_1258325 ?auto_1258323 ) ( IS-CRATE ?auto_1258323 ) ( not ( = ?auto_1258322 ?auto_1258323 ) ) ( ON ?auto_1258321 ?auto_1258320 ) ( ON ?auto_1258322 ?auto_1258321 ) ( not ( = ?auto_1258320 ?auto_1258321 ) ) ( not ( = ?auto_1258320 ?auto_1258322 ) ) ( not ( = ?auto_1258320 ?auto_1258323 ) ) ( not ( = ?auto_1258321 ?auto_1258322 ) ) ( not ( = ?auto_1258321 ?auto_1258323 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258322 ?auto_1258323 )
      ( MAKE-3CRATE-VERIFY ?auto_1258320 ?auto_1258321 ?auto_1258322 ?auto_1258323 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1258337 - SURFACE
      ?auto_1258338 - SURFACE
      ?auto_1258339 - SURFACE
      ?auto_1258340 - SURFACE
    )
    :vars
    (
      ?auto_1258342 - HOIST
      ?auto_1258343 - PLACE
      ?auto_1258341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258342 ?auto_1258343 ) ( SURFACE-AT ?auto_1258339 ?auto_1258343 ) ( CLEAR ?auto_1258339 ) ( IS-CRATE ?auto_1258340 ) ( not ( = ?auto_1258339 ?auto_1258340 ) ) ( TRUCK-AT ?auto_1258341 ?auto_1258343 ) ( AVAILABLE ?auto_1258342 ) ( IN ?auto_1258340 ?auto_1258341 ) ( ON ?auto_1258339 ?auto_1258338 ) ( not ( = ?auto_1258338 ?auto_1258339 ) ) ( not ( = ?auto_1258338 ?auto_1258340 ) ) ( ON ?auto_1258338 ?auto_1258337 ) ( not ( = ?auto_1258337 ?auto_1258338 ) ) ( not ( = ?auto_1258337 ?auto_1258339 ) ) ( not ( = ?auto_1258337 ?auto_1258340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258338 ?auto_1258339 ?auto_1258340 )
      ( MAKE-3CRATE-VERIFY ?auto_1258337 ?auto_1258338 ?auto_1258339 ?auto_1258340 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1258358 - SURFACE
      ?auto_1258359 - SURFACE
      ?auto_1258360 - SURFACE
      ?auto_1258361 - SURFACE
    )
    :vars
    (
      ?auto_1258364 - HOIST
      ?auto_1258365 - PLACE
      ?auto_1258362 - TRUCK
      ?auto_1258363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258364 ?auto_1258365 ) ( SURFACE-AT ?auto_1258360 ?auto_1258365 ) ( CLEAR ?auto_1258360 ) ( IS-CRATE ?auto_1258361 ) ( not ( = ?auto_1258360 ?auto_1258361 ) ) ( AVAILABLE ?auto_1258364 ) ( IN ?auto_1258361 ?auto_1258362 ) ( ON ?auto_1258360 ?auto_1258359 ) ( not ( = ?auto_1258359 ?auto_1258360 ) ) ( not ( = ?auto_1258359 ?auto_1258361 ) ) ( TRUCK-AT ?auto_1258362 ?auto_1258363 ) ( not ( = ?auto_1258363 ?auto_1258365 ) ) ( ON ?auto_1258359 ?auto_1258358 ) ( not ( = ?auto_1258358 ?auto_1258359 ) ) ( not ( = ?auto_1258358 ?auto_1258360 ) ) ( not ( = ?auto_1258358 ?auto_1258361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258359 ?auto_1258360 ?auto_1258361 )
      ( MAKE-3CRATE-VERIFY ?auto_1258358 ?auto_1258359 ?auto_1258360 ?auto_1258361 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1258382 - SURFACE
      ?auto_1258383 - SURFACE
      ?auto_1258384 - SURFACE
      ?auto_1258385 - SURFACE
    )
    :vars
    (
      ?auto_1258387 - HOIST
      ?auto_1258389 - PLACE
      ?auto_1258386 - TRUCK
      ?auto_1258388 - PLACE
      ?auto_1258390 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258387 ?auto_1258389 ) ( SURFACE-AT ?auto_1258384 ?auto_1258389 ) ( CLEAR ?auto_1258384 ) ( IS-CRATE ?auto_1258385 ) ( not ( = ?auto_1258384 ?auto_1258385 ) ) ( AVAILABLE ?auto_1258387 ) ( ON ?auto_1258384 ?auto_1258383 ) ( not ( = ?auto_1258383 ?auto_1258384 ) ) ( not ( = ?auto_1258383 ?auto_1258385 ) ) ( TRUCK-AT ?auto_1258386 ?auto_1258388 ) ( not ( = ?auto_1258388 ?auto_1258389 ) ) ( HOIST-AT ?auto_1258390 ?auto_1258388 ) ( LIFTING ?auto_1258390 ?auto_1258385 ) ( not ( = ?auto_1258387 ?auto_1258390 ) ) ( ON ?auto_1258383 ?auto_1258382 ) ( not ( = ?auto_1258382 ?auto_1258383 ) ) ( not ( = ?auto_1258382 ?auto_1258384 ) ) ( not ( = ?auto_1258382 ?auto_1258385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258383 ?auto_1258384 ?auto_1258385 )
      ( MAKE-3CRATE-VERIFY ?auto_1258382 ?auto_1258383 ?auto_1258384 ?auto_1258385 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1258409 - SURFACE
      ?auto_1258410 - SURFACE
      ?auto_1258411 - SURFACE
      ?auto_1258412 - SURFACE
    )
    :vars
    (
      ?auto_1258418 - HOIST
      ?auto_1258414 - PLACE
      ?auto_1258416 - TRUCK
      ?auto_1258415 - PLACE
      ?auto_1258413 - HOIST
      ?auto_1258417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258418 ?auto_1258414 ) ( SURFACE-AT ?auto_1258411 ?auto_1258414 ) ( CLEAR ?auto_1258411 ) ( IS-CRATE ?auto_1258412 ) ( not ( = ?auto_1258411 ?auto_1258412 ) ) ( AVAILABLE ?auto_1258418 ) ( ON ?auto_1258411 ?auto_1258410 ) ( not ( = ?auto_1258410 ?auto_1258411 ) ) ( not ( = ?auto_1258410 ?auto_1258412 ) ) ( TRUCK-AT ?auto_1258416 ?auto_1258415 ) ( not ( = ?auto_1258415 ?auto_1258414 ) ) ( HOIST-AT ?auto_1258413 ?auto_1258415 ) ( not ( = ?auto_1258418 ?auto_1258413 ) ) ( AVAILABLE ?auto_1258413 ) ( SURFACE-AT ?auto_1258412 ?auto_1258415 ) ( ON ?auto_1258412 ?auto_1258417 ) ( CLEAR ?auto_1258412 ) ( not ( = ?auto_1258411 ?auto_1258417 ) ) ( not ( = ?auto_1258412 ?auto_1258417 ) ) ( not ( = ?auto_1258410 ?auto_1258417 ) ) ( ON ?auto_1258410 ?auto_1258409 ) ( not ( = ?auto_1258409 ?auto_1258410 ) ) ( not ( = ?auto_1258409 ?auto_1258411 ) ) ( not ( = ?auto_1258409 ?auto_1258412 ) ) ( not ( = ?auto_1258409 ?auto_1258417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258410 ?auto_1258411 ?auto_1258412 )
      ( MAKE-3CRATE-VERIFY ?auto_1258409 ?auto_1258410 ?auto_1258411 ?auto_1258412 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1258437 - SURFACE
      ?auto_1258438 - SURFACE
      ?auto_1258439 - SURFACE
      ?auto_1258440 - SURFACE
    )
    :vars
    (
      ?auto_1258444 - HOIST
      ?auto_1258442 - PLACE
      ?auto_1258445 - PLACE
      ?auto_1258446 - HOIST
      ?auto_1258443 - SURFACE
      ?auto_1258441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258444 ?auto_1258442 ) ( SURFACE-AT ?auto_1258439 ?auto_1258442 ) ( CLEAR ?auto_1258439 ) ( IS-CRATE ?auto_1258440 ) ( not ( = ?auto_1258439 ?auto_1258440 ) ) ( AVAILABLE ?auto_1258444 ) ( ON ?auto_1258439 ?auto_1258438 ) ( not ( = ?auto_1258438 ?auto_1258439 ) ) ( not ( = ?auto_1258438 ?auto_1258440 ) ) ( not ( = ?auto_1258445 ?auto_1258442 ) ) ( HOIST-AT ?auto_1258446 ?auto_1258445 ) ( not ( = ?auto_1258444 ?auto_1258446 ) ) ( AVAILABLE ?auto_1258446 ) ( SURFACE-AT ?auto_1258440 ?auto_1258445 ) ( ON ?auto_1258440 ?auto_1258443 ) ( CLEAR ?auto_1258440 ) ( not ( = ?auto_1258439 ?auto_1258443 ) ) ( not ( = ?auto_1258440 ?auto_1258443 ) ) ( not ( = ?auto_1258438 ?auto_1258443 ) ) ( TRUCK-AT ?auto_1258441 ?auto_1258442 ) ( ON ?auto_1258438 ?auto_1258437 ) ( not ( = ?auto_1258437 ?auto_1258438 ) ) ( not ( = ?auto_1258437 ?auto_1258439 ) ) ( not ( = ?auto_1258437 ?auto_1258440 ) ) ( not ( = ?auto_1258437 ?auto_1258443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258438 ?auto_1258439 ?auto_1258440 )
      ( MAKE-3CRATE-VERIFY ?auto_1258437 ?auto_1258438 ?auto_1258439 ?auto_1258440 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1258465 - SURFACE
      ?auto_1258466 - SURFACE
      ?auto_1258467 - SURFACE
      ?auto_1258468 - SURFACE
    )
    :vars
    (
      ?auto_1258474 - HOIST
      ?auto_1258469 - PLACE
      ?auto_1258470 - PLACE
      ?auto_1258471 - HOIST
      ?auto_1258473 - SURFACE
      ?auto_1258472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258474 ?auto_1258469 ) ( IS-CRATE ?auto_1258468 ) ( not ( = ?auto_1258467 ?auto_1258468 ) ) ( not ( = ?auto_1258466 ?auto_1258467 ) ) ( not ( = ?auto_1258466 ?auto_1258468 ) ) ( not ( = ?auto_1258470 ?auto_1258469 ) ) ( HOIST-AT ?auto_1258471 ?auto_1258470 ) ( not ( = ?auto_1258474 ?auto_1258471 ) ) ( AVAILABLE ?auto_1258471 ) ( SURFACE-AT ?auto_1258468 ?auto_1258470 ) ( ON ?auto_1258468 ?auto_1258473 ) ( CLEAR ?auto_1258468 ) ( not ( = ?auto_1258467 ?auto_1258473 ) ) ( not ( = ?auto_1258468 ?auto_1258473 ) ) ( not ( = ?auto_1258466 ?auto_1258473 ) ) ( TRUCK-AT ?auto_1258472 ?auto_1258469 ) ( SURFACE-AT ?auto_1258466 ?auto_1258469 ) ( CLEAR ?auto_1258466 ) ( LIFTING ?auto_1258474 ?auto_1258467 ) ( IS-CRATE ?auto_1258467 ) ( ON ?auto_1258466 ?auto_1258465 ) ( not ( = ?auto_1258465 ?auto_1258466 ) ) ( not ( = ?auto_1258465 ?auto_1258467 ) ) ( not ( = ?auto_1258465 ?auto_1258468 ) ) ( not ( = ?auto_1258465 ?auto_1258473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258466 ?auto_1258467 ?auto_1258468 )
      ( MAKE-3CRATE-VERIFY ?auto_1258465 ?auto_1258466 ?auto_1258467 ?auto_1258468 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1258493 - SURFACE
      ?auto_1258494 - SURFACE
      ?auto_1258495 - SURFACE
      ?auto_1258496 - SURFACE
    )
    :vars
    (
      ?auto_1258500 - HOIST
      ?auto_1258501 - PLACE
      ?auto_1258498 - PLACE
      ?auto_1258499 - HOIST
      ?auto_1258497 - SURFACE
      ?auto_1258502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258500 ?auto_1258501 ) ( IS-CRATE ?auto_1258496 ) ( not ( = ?auto_1258495 ?auto_1258496 ) ) ( not ( = ?auto_1258494 ?auto_1258495 ) ) ( not ( = ?auto_1258494 ?auto_1258496 ) ) ( not ( = ?auto_1258498 ?auto_1258501 ) ) ( HOIST-AT ?auto_1258499 ?auto_1258498 ) ( not ( = ?auto_1258500 ?auto_1258499 ) ) ( AVAILABLE ?auto_1258499 ) ( SURFACE-AT ?auto_1258496 ?auto_1258498 ) ( ON ?auto_1258496 ?auto_1258497 ) ( CLEAR ?auto_1258496 ) ( not ( = ?auto_1258495 ?auto_1258497 ) ) ( not ( = ?auto_1258496 ?auto_1258497 ) ) ( not ( = ?auto_1258494 ?auto_1258497 ) ) ( TRUCK-AT ?auto_1258502 ?auto_1258501 ) ( SURFACE-AT ?auto_1258494 ?auto_1258501 ) ( CLEAR ?auto_1258494 ) ( IS-CRATE ?auto_1258495 ) ( AVAILABLE ?auto_1258500 ) ( IN ?auto_1258495 ?auto_1258502 ) ( ON ?auto_1258494 ?auto_1258493 ) ( not ( = ?auto_1258493 ?auto_1258494 ) ) ( not ( = ?auto_1258493 ?auto_1258495 ) ) ( not ( = ?auto_1258493 ?auto_1258496 ) ) ( not ( = ?auto_1258493 ?auto_1258497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258494 ?auto_1258495 ?auto_1258496 )
      ( MAKE-3CRATE-VERIFY ?auto_1258493 ?auto_1258494 ?auto_1258495 ?auto_1258496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1258678 - SURFACE
      ?auto_1258679 - SURFACE
    )
    :vars
    (
      ?auto_1258684 - HOIST
      ?auto_1258685 - PLACE
      ?auto_1258686 - SURFACE
      ?auto_1258680 - TRUCK
      ?auto_1258681 - PLACE
      ?auto_1258682 - HOIST
      ?auto_1258683 - SURFACE
      ?auto_1258687 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258684 ?auto_1258685 ) ( SURFACE-AT ?auto_1258678 ?auto_1258685 ) ( CLEAR ?auto_1258678 ) ( IS-CRATE ?auto_1258679 ) ( not ( = ?auto_1258678 ?auto_1258679 ) ) ( AVAILABLE ?auto_1258684 ) ( ON ?auto_1258678 ?auto_1258686 ) ( not ( = ?auto_1258686 ?auto_1258678 ) ) ( not ( = ?auto_1258686 ?auto_1258679 ) ) ( TRUCK-AT ?auto_1258680 ?auto_1258681 ) ( not ( = ?auto_1258681 ?auto_1258685 ) ) ( HOIST-AT ?auto_1258682 ?auto_1258681 ) ( not ( = ?auto_1258684 ?auto_1258682 ) ) ( SURFACE-AT ?auto_1258679 ?auto_1258681 ) ( ON ?auto_1258679 ?auto_1258683 ) ( CLEAR ?auto_1258679 ) ( not ( = ?auto_1258678 ?auto_1258683 ) ) ( not ( = ?auto_1258679 ?auto_1258683 ) ) ( not ( = ?auto_1258686 ?auto_1258683 ) ) ( LIFTING ?auto_1258682 ?auto_1258687 ) ( IS-CRATE ?auto_1258687 ) ( not ( = ?auto_1258678 ?auto_1258687 ) ) ( not ( = ?auto_1258679 ?auto_1258687 ) ) ( not ( = ?auto_1258686 ?auto_1258687 ) ) ( not ( = ?auto_1258683 ?auto_1258687 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1258682 ?auto_1258687 ?auto_1258680 ?auto_1258681 )
      ( MAKE-1CRATE ?auto_1258678 ?auto_1258679 )
      ( MAKE-1CRATE-VERIFY ?auto_1258678 ?auto_1258679 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1258786 - SURFACE
      ?auto_1258787 - SURFACE
      ?auto_1258788 - SURFACE
      ?auto_1258790 - SURFACE
      ?auto_1258789 - SURFACE
    )
    :vars
    (
      ?auto_1258791 - HOIST
      ?auto_1258792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258791 ?auto_1258792 ) ( SURFACE-AT ?auto_1258790 ?auto_1258792 ) ( CLEAR ?auto_1258790 ) ( LIFTING ?auto_1258791 ?auto_1258789 ) ( IS-CRATE ?auto_1258789 ) ( not ( = ?auto_1258790 ?auto_1258789 ) ) ( ON ?auto_1258787 ?auto_1258786 ) ( ON ?auto_1258788 ?auto_1258787 ) ( ON ?auto_1258790 ?auto_1258788 ) ( not ( = ?auto_1258786 ?auto_1258787 ) ) ( not ( = ?auto_1258786 ?auto_1258788 ) ) ( not ( = ?auto_1258786 ?auto_1258790 ) ) ( not ( = ?auto_1258786 ?auto_1258789 ) ) ( not ( = ?auto_1258787 ?auto_1258788 ) ) ( not ( = ?auto_1258787 ?auto_1258790 ) ) ( not ( = ?auto_1258787 ?auto_1258789 ) ) ( not ( = ?auto_1258788 ?auto_1258790 ) ) ( not ( = ?auto_1258788 ?auto_1258789 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1258790 ?auto_1258789 )
      ( MAKE-4CRATE-VERIFY ?auto_1258786 ?auto_1258787 ?auto_1258788 ?auto_1258790 ?auto_1258789 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1258811 - SURFACE
      ?auto_1258812 - SURFACE
      ?auto_1258813 - SURFACE
      ?auto_1258815 - SURFACE
      ?auto_1258814 - SURFACE
    )
    :vars
    (
      ?auto_1258816 - HOIST
      ?auto_1258818 - PLACE
      ?auto_1258817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258816 ?auto_1258818 ) ( SURFACE-AT ?auto_1258815 ?auto_1258818 ) ( CLEAR ?auto_1258815 ) ( IS-CRATE ?auto_1258814 ) ( not ( = ?auto_1258815 ?auto_1258814 ) ) ( TRUCK-AT ?auto_1258817 ?auto_1258818 ) ( AVAILABLE ?auto_1258816 ) ( IN ?auto_1258814 ?auto_1258817 ) ( ON ?auto_1258815 ?auto_1258813 ) ( not ( = ?auto_1258813 ?auto_1258815 ) ) ( not ( = ?auto_1258813 ?auto_1258814 ) ) ( ON ?auto_1258812 ?auto_1258811 ) ( ON ?auto_1258813 ?auto_1258812 ) ( not ( = ?auto_1258811 ?auto_1258812 ) ) ( not ( = ?auto_1258811 ?auto_1258813 ) ) ( not ( = ?auto_1258811 ?auto_1258815 ) ) ( not ( = ?auto_1258811 ?auto_1258814 ) ) ( not ( = ?auto_1258812 ?auto_1258813 ) ) ( not ( = ?auto_1258812 ?auto_1258815 ) ) ( not ( = ?auto_1258812 ?auto_1258814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258813 ?auto_1258815 ?auto_1258814 )
      ( MAKE-4CRATE-VERIFY ?auto_1258811 ?auto_1258812 ?auto_1258813 ?auto_1258815 ?auto_1258814 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1258841 - SURFACE
      ?auto_1258842 - SURFACE
      ?auto_1258843 - SURFACE
      ?auto_1258845 - SURFACE
      ?auto_1258844 - SURFACE
    )
    :vars
    (
      ?auto_1258846 - HOIST
      ?auto_1258847 - PLACE
      ?auto_1258848 - TRUCK
      ?auto_1258849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258846 ?auto_1258847 ) ( SURFACE-AT ?auto_1258845 ?auto_1258847 ) ( CLEAR ?auto_1258845 ) ( IS-CRATE ?auto_1258844 ) ( not ( = ?auto_1258845 ?auto_1258844 ) ) ( AVAILABLE ?auto_1258846 ) ( IN ?auto_1258844 ?auto_1258848 ) ( ON ?auto_1258845 ?auto_1258843 ) ( not ( = ?auto_1258843 ?auto_1258845 ) ) ( not ( = ?auto_1258843 ?auto_1258844 ) ) ( TRUCK-AT ?auto_1258848 ?auto_1258849 ) ( not ( = ?auto_1258849 ?auto_1258847 ) ) ( ON ?auto_1258842 ?auto_1258841 ) ( ON ?auto_1258843 ?auto_1258842 ) ( not ( = ?auto_1258841 ?auto_1258842 ) ) ( not ( = ?auto_1258841 ?auto_1258843 ) ) ( not ( = ?auto_1258841 ?auto_1258845 ) ) ( not ( = ?auto_1258841 ?auto_1258844 ) ) ( not ( = ?auto_1258842 ?auto_1258843 ) ) ( not ( = ?auto_1258842 ?auto_1258845 ) ) ( not ( = ?auto_1258842 ?auto_1258844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258843 ?auto_1258845 ?auto_1258844 )
      ( MAKE-4CRATE-VERIFY ?auto_1258841 ?auto_1258842 ?auto_1258843 ?auto_1258845 ?auto_1258844 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1258875 - SURFACE
      ?auto_1258876 - SURFACE
      ?auto_1258877 - SURFACE
      ?auto_1258879 - SURFACE
      ?auto_1258878 - SURFACE
    )
    :vars
    (
      ?auto_1258881 - HOIST
      ?auto_1258880 - PLACE
      ?auto_1258883 - TRUCK
      ?auto_1258884 - PLACE
      ?auto_1258882 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258881 ?auto_1258880 ) ( SURFACE-AT ?auto_1258879 ?auto_1258880 ) ( CLEAR ?auto_1258879 ) ( IS-CRATE ?auto_1258878 ) ( not ( = ?auto_1258879 ?auto_1258878 ) ) ( AVAILABLE ?auto_1258881 ) ( ON ?auto_1258879 ?auto_1258877 ) ( not ( = ?auto_1258877 ?auto_1258879 ) ) ( not ( = ?auto_1258877 ?auto_1258878 ) ) ( TRUCK-AT ?auto_1258883 ?auto_1258884 ) ( not ( = ?auto_1258884 ?auto_1258880 ) ) ( HOIST-AT ?auto_1258882 ?auto_1258884 ) ( LIFTING ?auto_1258882 ?auto_1258878 ) ( not ( = ?auto_1258881 ?auto_1258882 ) ) ( ON ?auto_1258876 ?auto_1258875 ) ( ON ?auto_1258877 ?auto_1258876 ) ( not ( = ?auto_1258875 ?auto_1258876 ) ) ( not ( = ?auto_1258875 ?auto_1258877 ) ) ( not ( = ?auto_1258875 ?auto_1258879 ) ) ( not ( = ?auto_1258875 ?auto_1258878 ) ) ( not ( = ?auto_1258876 ?auto_1258877 ) ) ( not ( = ?auto_1258876 ?auto_1258879 ) ) ( not ( = ?auto_1258876 ?auto_1258878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258877 ?auto_1258879 ?auto_1258878 )
      ( MAKE-4CRATE-VERIFY ?auto_1258875 ?auto_1258876 ?auto_1258877 ?auto_1258879 ?auto_1258878 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1258913 - SURFACE
      ?auto_1258914 - SURFACE
      ?auto_1258915 - SURFACE
      ?auto_1258917 - SURFACE
      ?auto_1258916 - SURFACE
    )
    :vars
    (
      ?auto_1258921 - HOIST
      ?auto_1258919 - PLACE
      ?auto_1258922 - TRUCK
      ?auto_1258918 - PLACE
      ?auto_1258923 - HOIST
      ?auto_1258920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258921 ?auto_1258919 ) ( SURFACE-AT ?auto_1258917 ?auto_1258919 ) ( CLEAR ?auto_1258917 ) ( IS-CRATE ?auto_1258916 ) ( not ( = ?auto_1258917 ?auto_1258916 ) ) ( AVAILABLE ?auto_1258921 ) ( ON ?auto_1258917 ?auto_1258915 ) ( not ( = ?auto_1258915 ?auto_1258917 ) ) ( not ( = ?auto_1258915 ?auto_1258916 ) ) ( TRUCK-AT ?auto_1258922 ?auto_1258918 ) ( not ( = ?auto_1258918 ?auto_1258919 ) ) ( HOIST-AT ?auto_1258923 ?auto_1258918 ) ( not ( = ?auto_1258921 ?auto_1258923 ) ) ( AVAILABLE ?auto_1258923 ) ( SURFACE-AT ?auto_1258916 ?auto_1258918 ) ( ON ?auto_1258916 ?auto_1258920 ) ( CLEAR ?auto_1258916 ) ( not ( = ?auto_1258917 ?auto_1258920 ) ) ( not ( = ?auto_1258916 ?auto_1258920 ) ) ( not ( = ?auto_1258915 ?auto_1258920 ) ) ( ON ?auto_1258914 ?auto_1258913 ) ( ON ?auto_1258915 ?auto_1258914 ) ( not ( = ?auto_1258913 ?auto_1258914 ) ) ( not ( = ?auto_1258913 ?auto_1258915 ) ) ( not ( = ?auto_1258913 ?auto_1258917 ) ) ( not ( = ?auto_1258913 ?auto_1258916 ) ) ( not ( = ?auto_1258913 ?auto_1258920 ) ) ( not ( = ?auto_1258914 ?auto_1258915 ) ) ( not ( = ?auto_1258914 ?auto_1258917 ) ) ( not ( = ?auto_1258914 ?auto_1258916 ) ) ( not ( = ?auto_1258914 ?auto_1258920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258915 ?auto_1258917 ?auto_1258916 )
      ( MAKE-4CRATE-VERIFY ?auto_1258913 ?auto_1258914 ?auto_1258915 ?auto_1258917 ?auto_1258916 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1258952 - SURFACE
      ?auto_1258953 - SURFACE
      ?auto_1258954 - SURFACE
      ?auto_1258956 - SURFACE
      ?auto_1258955 - SURFACE
    )
    :vars
    (
      ?auto_1258960 - HOIST
      ?auto_1258959 - PLACE
      ?auto_1258957 - PLACE
      ?auto_1258962 - HOIST
      ?auto_1258958 - SURFACE
      ?auto_1258961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258960 ?auto_1258959 ) ( SURFACE-AT ?auto_1258956 ?auto_1258959 ) ( CLEAR ?auto_1258956 ) ( IS-CRATE ?auto_1258955 ) ( not ( = ?auto_1258956 ?auto_1258955 ) ) ( AVAILABLE ?auto_1258960 ) ( ON ?auto_1258956 ?auto_1258954 ) ( not ( = ?auto_1258954 ?auto_1258956 ) ) ( not ( = ?auto_1258954 ?auto_1258955 ) ) ( not ( = ?auto_1258957 ?auto_1258959 ) ) ( HOIST-AT ?auto_1258962 ?auto_1258957 ) ( not ( = ?auto_1258960 ?auto_1258962 ) ) ( AVAILABLE ?auto_1258962 ) ( SURFACE-AT ?auto_1258955 ?auto_1258957 ) ( ON ?auto_1258955 ?auto_1258958 ) ( CLEAR ?auto_1258955 ) ( not ( = ?auto_1258956 ?auto_1258958 ) ) ( not ( = ?auto_1258955 ?auto_1258958 ) ) ( not ( = ?auto_1258954 ?auto_1258958 ) ) ( TRUCK-AT ?auto_1258961 ?auto_1258959 ) ( ON ?auto_1258953 ?auto_1258952 ) ( ON ?auto_1258954 ?auto_1258953 ) ( not ( = ?auto_1258952 ?auto_1258953 ) ) ( not ( = ?auto_1258952 ?auto_1258954 ) ) ( not ( = ?auto_1258952 ?auto_1258956 ) ) ( not ( = ?auto_1258952 ?auto_1258955 ) ) ( not ( = ?auto_1258952 ?auto_1258958 ) ) ( not ( = ?auto_1258953 ?auto_1258954 ) ) ( not ( = ?auto_1258953 ?auto_1258956 ) ) ( not ( = ?auto_1258953 ?auto_1258955 ) ) ( not ( = ?auto_1258953 ?auto_1258958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258954 ?auto_1258956 ?auto_1258955 )
      ( MAKE-4CRATE-VERIFY ?auto_1258952 ?auto_1258953 ?auto_1258954 ?auto_1258956 ?auto_1258955 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1258991 - SURFACE
      ?auto_1258992 - SURFACE
      ?auto_1258993 - SURFACE
      ?auto_1258995 - SURFACE
      ?auto_1258994 - SURFACE
    )
    :vars
    (
      ?auto_1258998 - HOIST
      ?auto_1259000 - PLACE
      ?auto_1259001 - PLACE
      ?auto_1258996 - HOIST
      ?auto_1258997 - SURFACE
      ?auto_1258999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1258998 ?auto_1259000 ) ( IS-CRATE ?auto_1258994 ) ( not ( = ?auto_1258995 ?auto_1258994 ) ) ( not ( = ?auto_1258993 ?auto_1258995 ) ) ( not ( = ?auto_1258993 ?auto_1258994 ) ) ( not ( = ?auto_1259001 ?auto_1259000 ) ) ( HOIST-AT ?auto_1258996 ?auto_1259001 ) ( not ( = ?auto_1258998 ?auto_1258996 ) ) ( AVAILABLE ?auto_1258996 ) ( SURFACE-AT ?auto_1258994 ?auto_1259001 ) ( ON ?auto_1258994 ?auto_1258997 ) ( CLEAR ?auto_1258994 ) ( not ( = ?auto_1258995 ?auto_1258997 ) ) ( not ( = ?auto_1258994 ?auto_1258997 ) ) ( not ( = ?auto_1258993 ?auto_1258997 ) ) ( TRUCK-AT ?auto_1258999 ?auto_1259000 ) ( SURFACE-AT ?auto_1258993 ?auto_1259000 ) ( CLEAR ?auto_1258993 ) ( LIFTING ?auto_1258998 ?auto_1258995 ) ( IS-CRATE ?auto_1258995 ) ( ON ?auto_1258992 ?auto_1258991 ) ( ON ?auto_1258993 ?auto_1258992 ) ( not ( = ?auto_1258991 ?auto_1258992 ) ) ( not ( = ?auto_1258991 ?auto_1258993 ) ) ( not ( = ?auto_1258991 ?auto_1258995 ) ) ( not ( = ?auto_1258991 ?auto_1258994 ) ) ( not ( = ?auto_1258991 ?auto_1258997 ) ) ( not ( = ?auto_1258992 ?auto_1258993 ) ) ( not ( = ?auto_1258992 ?auto_1258995 ) ) ( not ( = ?auto_1258992 ?auto_1258994 ) ) ( not ( = ?auto_1258992 ?auto_1258997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1258993 ?auto_1258995 ?auto_1258994 )
      ( MAKE-4CRATE-VERIFY ?auto_1258991 ?auto_1258992 ?auto_1258993 ?auto_1258995 ?auto_1258994 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1259030 - SURFACE
      ?auto_1259031 - SURFACE
      ?auto_1259032 - SURFACE
      ?auto_1259034 - SURFACE
      ?auto_1259033 - SURFACE
    )
    :vars
    (
      ?auto_1259036 - HOIST
      ?auto_1259038 - PLACE
      ?auto_1259040 - PLACE
      ?auto_1259035 - HOIST
      ?auto_1259037 - SURFACE
      ?auto_1259039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259036 ?auto_1259038 ) ( IS-CRATE ?auto_1259033 ) ( not ( = ?auto_1259034 ?auto_1259033 ) ) ( not ( = ?auto_1259032 ?auto_1259034 ) ) ( not ( = ?auto_1259032 ?auto_1259033 ) ) ( not ( = ?auto_1259040 ?auto_1259038 ) ) ( HOIST-AT ?auto_1259035 ?auto_1259040 ) ( not ( = ?auto_1259036 ?auto_1259035 ) ) ( AVAILABLE ?auto_1259035 ) ( SURFACE-AT ?auto_1259033 ?auto_1259040 ) ( ON ?auto_1259033 ?auto_1259037 ) ( CLEAR ?auto_1259033 ) ( not ( = ?auto_1259034 ?auto_1259037 ) ) ( not ( = ?auto_1259033 ?auto_1259037 ) ) ( not ( = ?auto_1259032 ?auto_1259037 ) ) ( TRUCK-AT ?auto_1259039 ?auto_1259038 ) ( SURFACE-AT ?auto_1259032 ?auto_1259038 ) ( CLEAR ?auto_1259032 ) ( IS-CRATE ?auto_1259034 ) ( AVAILABLE ?auto_1259036 ) ( IN ?auto_1259034 ?auto_1259039 ) ( ON ?auto_1259031 ?auto_1259030 ) ( ON ?auto_1259032 ?auto_1259031 ) ( not ( = ?auto_1259030 ?auto_1259031 ) ) ( not ( = ?auto_1259030 ?auto_1259032 ) ) ( not ( = ?auto_1259030 ?auto_1259034 ) ) ( not ( = ?auto_1259030 ?auto_1259033 ) ) ( not ( = ?auto_1259030 ?auto_1259037 ) ) ( not ( = ?auto_1259031 ?auto_1259032 ) ) ( not ( = ?auto_1259031 ?auto_1259034 ) ) ( not ( = ?auto_1259031 ?auto_1259033 ) ) ( not ( = ?auto_1259031 ?auto_1259037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259032 ?auto_1259034 ?auto_1259033 )
      ( MAKE-4CRATE-VERIFY ?auto_1259030 ?auto_1259031 ?auto_1259032 ?auto_1259034 ?auto_1259033 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1259531 - SURFACE
      ?auto_1259532 - SURFACE
    )
    :vars
    (
      ?auto_1259539 - HOIST
      ?auto_1259538 - PLACE
      ?auto_1259533 - SURFACE
      ?auto_1259536 - PLACE
      ?auto_1259535 - HOIST
      ?auto_1259537 - SURFACE
      ?auto_1259534 - TRUCK
      ?auto_1259540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259539 ?auto_1259538 ) ( SURFACE-AT ?auto_1259531 ?auto_1259538 ) ( CLEAR ?auto_1259531 ) ( IS-CRATE ?auto_1259532 ) ( not ( = ?auto_1259531 ?auto_1259532 ) ) ( ON ?auto_1259531 ?auto_1259533 ) ( not ( = ?auto_1259533 ?auto_1259531 ) ) ( not ( = ?auto_1259533 ?auto_1259532 ) ) ( not ( = ?auto_1259536 ?auto_1259538 ) ) ( HOIST-AT ?auto_1259535 ?auto_1259536 ) ( not ( = ?auto_1259539 ?auto_1259535 ) ) ( AVAILABLE ?auto_1259535 ) ( SURFACE-AT ?auto_1259532 ?auto_1259536 ) ( ON ?auto_1259532 ?auto_1259537 ) ( CLEAR ?auto_1259532 ) ( not ( = ?auto_1259531 ?auto_1259537 ) ) ( not ( = ?auto_1259532 ?auto_1259537 ) ) ( not ( = ?auto_1259533 ?auto_1259537 ) ) ( TRUCK-AT ?auto_1259534 ?auto_1259538 ) ( LIFTING ?auto_1259539 ?auto_1259540 ) ( IS-CRATE ?auto_1259540 ) ( not ( = ?auto_1259531 ?auto_1259540 ) ) ( not ( = ?auto_1259532 ?auto_1259540 ) ) ( not ( = ?auto_1259533 ?auto_1259540 ) ) ( not ( = ?auto_1259537 ?auto_1259540 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1259539 ?auto_1259540 ?auto_1259534 ?auto_1259538 )
      ( MAKE-1CRATE ?auto_1259531 ?auto_1259532 )
      ( MAKE-1CRATE-VERIFY ?auto_1259531 ?auto_1259532 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1259690 - SURFACE
      ?auto_1259691 - SURFACE
      ?auto_1259692 - SURFACE
      ?auto_1259694 - SURFACE
      ?auto_1259693 - SURFACE
      ?auto_1259695 - SURFACE
    )
    :vars
    (
      ?auto_1259697 - HOIST
      ?auto_1259696 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259697 ?auto_1259696 ) ( SURFACE-AT ?auto_1259693 ?auto_1259696 ) ( CLEAR ?auto_1259693 ) ( LIFTING ?auto_1259697 ?auto_1259695 ) ( IS-CRATE ?auto_1259695 ) ( not ( = ?auto_1259693 ?auto_1259695 ) ) ( ON ?auto_1259691 ?auto_1259690 ) ( ON ?auto_1259692 ?auto_1259691 ) ( ON ?auto_1259694 ?auto_1259692 ) ( ON ?auto_1259693 ?auto_1259694 ) ( not ( = ?auto_1259690 ?auto_1259691 ) ) ( not ( = ?auto_1259690 ?auto_1259692 ) ) ( not ( = ?auto_1259690 ?auto_1259694 ) ) ( not ( = ?auto_1259690 ?auto_1259693 ) ) ( not ( = ?auto_1259690 ?auto_1259695 ) ) ( not ( = ?auto_1259691 ?auto_1259692 ) ) ( not ( = ?auto_1259691 ?auto_1259694 ) ) ( not ( = ?auto_1259691 ?auto_1259693 ) ) ( not ( = ?auto_1259691 ?auto_1259695 ) ) ( not ( = ?auto_1259692 ?auto_1259694 ) ) ( not ( = ?auto_1259692 ?auto_1259693 ) ) ( not ( = ?auto_1259692 ?auto_1259695 ) ) ( not ( = ?auto_1259694 ?auto_1259693 ) ) ( not ( = ?auto_1259694 ?auto_1259695 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1259693 ?auto_1259695 )
      ( MAKE-5CRATE-VERIFY ?auto_1259690 ?auto_1259691 ?auto_1259692 ?auto_1259694 ?auto_1259693 ?auto_1259695 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1259724 - SURFACE
      ?auto_1259725 - SURFACE
      ?auto_1259726 - SURFACE
      ?auto_1259728 - SURFACE
      ?auto_1259727 - SURFACE
      ?auto_1259729 - SURFACE
    )
    :vars
    (
      ?auto_1259730 - HOIST
      ?auto_1259732 - PLACE
      ?auto_1259731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259730 ?auto_1259732 ) ( SURFACE-AT ?auto_1259727 ?auto_1259732 ) ( CLEAR ?auto_1259727 ) ( IS-CRATE ?auto_1259729 ) ( not ( = ?auto_1259727 ?auto_1259729 ) ) ( TRUCK-AT ?auto_1259731 ?auto_1259732 ) ( AVAILABLE ?auto_1259730 ) ( IN ?auto_1259729 ?auto_1259731 ) ( ON ?auto_1259727 ?auto_1259728 ) ( not ( = ?auto_1259728 ?auto_1259727 ) ) ( not ( = ?auto_1259728 ?auto_1259729 ) ) ( ON ?auto_1259725 ?auto_1259724 ) ( ON ?auto_1259726 ?auto_1259725 ) ( ON ?auto_1259728 ?auto_1259726 ) ( not ( = ?auto_1259724 ?auto_1259725 ) ) ( not ( = ?auto_1259724 ?auto_1259726 ) ) ( not ( = ?auto_1259724 ?auto_1259728 ) ) ( not ( = ?auto_1259724 ?auto_1259727 ) ) ( not ( = ?auto_1259724 ?auto_1259729 ) ) ( not ( = ?auto_1259725 ?auto_1259726 ) ) ( not ( = ?auto_1259725 ?auto_1259728 ) ) ( not ( = ?auto_1259725 ?auto_1259727 ) ) ( not ( = ?auto_1259725 ?auto_1259729 ) ) ( not ( = ?auto_1259726 ?auto_1259728 ) ) ( not ( = ?auto_1259726 ?auto_1259727 ) ) ( not ( = ?auto_1259726 ?auto_1259729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259728 ?auto_1259727 ?auto_1259729 )
      ( MAKE-5CRATE-VERIFY ?auto_1259724 ?auto_1259725 ?auto_1259726 ?auto_1259728 ?auto_1259727 ?auto_1259729 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1259764 - SURFACE
      ?auto_1259765 - SURFACE
      ?auto_1259766 - SURFACE
      ?auto_1259768 - SURFACE
      ?auto_1259767 - SURFACE
      ?auto_1259769 - SURFACE
    )
    :vars
    (
      ?auto_1259771 - HOIST
      ?auto_1259772 - PLACE
      ?auto_1259773 - TRUCK
      ?auto_1259770 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259771 ?auto_1259772 ) ( SURFACE-AT ?auto_1259767 ?auto_1259772 ) ( CLEAR ?auto_1259767 ) ( IS-CRATE ?auto_1259769 ) ( not ( = ?auto_1259767 ?auto_1259769 ) ) ( AVAILABLE ?auto_1259771 ) ( IN ?auto_1259769 ?auto_1259773 ) ( ON ?auto_1259767 ?auto_1259768 ) ( not ( = ?auto_1259768 ?auto_1259767 ) ) ( not ( = ?auto_1259768 ?auto_1259769 ) ) ( TRUCK-AT ?auto_1259773 ?auto_1259770 ) ( not ( = ?auto_1259770 ?auto_1259772 ) ) ( ON ?auto_1259765 ?auto_1259764 ) ( ON ?auto_1259766 ?auto_1259765 ) ( ON ?auto_1259768 ?auto_1259766 ) ( not ( = ?auto_1259764 ?auto_1259765 ) ) ( not ( = ?auto_1259764 ?auto_1259766 ) ) ( not ( = ?auto_1259764 ?auto_1259768 ) ) ( not ( = ?auto_1259764 ?auto_1259767 ) ) ( not ( = ?auto_1259764 ?auto_1259769 ) ) ( not ( = ?auto_1259765 ?auto_1259766 ) ) ( not ( = ?auto_1259765 ?auto_1259768 ) ) ( not ( = ?auto_1259765 ?auto_1259767 ) ) ( not ( = ?auto_1259765 ?auto_1259769 ) ) ( not ( = ?auto_1259766 ?auto_1259768 ) ) ( not ( = ?auto_1259766 ?auto_1259767 ) ) ( not ( = ?auto_1259766 ?auto_1259769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259768 ?auto_1259767 ?auto_1259769 )
      ( MAKE-5CRATE-VERIFY ?auto_1259764 ?auto_1259765 ?auto_1259766 ?auto_1259768 ?auto_1259767 ?auto_1259769 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1259809 - SURFACE
      ?auto_1259810 - SURFACE
      ?auto_1259811 - SURFACE
      ?auto_1259813 - SURFACE
      ?auto_1259812 - SURFACE
      ?auto_1259814 - SURFACE
    )
    :vars
    (
      ?auto_1259816 - HOIST
      ?auto_1259819 - PLACE
      ?auto_1259817 - TRUCK
      ?auto_1259818 - PLACE
      ?auto_1259815 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259816 ?auto_1259819 ) ( SURFACE-AT ?auto_1259812 ?auto_1259819 ) ( CLEAR ?auto_1259812 ) ( IS-CRATE ?auto_1259814 ) ( not ( = ?auto_1259812 ?auto_1259814 ) ) ( AVAILABLE ?auto_1259816 ) ( ON ?auto_1259812 ?auto_1259813 ) ( not ( = ?auto_1259813 ?auto_1259812 ) ) ( not ( = ?auto_1259813 ?auto_1259814 ) ) ( TRUCK-AT ?auto_1259817 ?auto_1259818 ) ( not ( = ?auto_1259818 ?auto_1259819 ) ) ( HOIST-AT ?auto_1259815 ?auto_1259818 ) ( LIFTING ?auto_1259815 ?auto_1259814 ) ( not ( = ?auto_1259816 ?auto_1259815 ) ) ( ON ?auto_1259810 ?auto_1259809 ) ( ON ?auto_1259811 ?auto_1259810 ) ( ON ?auto_1259813 ?auto_1259811 ) ( not ( = ?auto_1259809 ?auto_1259810 ) ) ( not ( = ?auto_1259809 ?auto_1259811 ) ) ( not ( = ?auto_1259809 ?auto_1259813 ) ) ( not ( = ?auto_1259809 ?auto_1259812 ) ) ( not ( = ?auto_1259809 ?auto_1259814 ) ) ( not ( = ?auto_1259810 ?auto_1259811 ) ) ( not ( = ?auto_1259810 ?auto_1259813 ) ) ( not ( = ?auto_1259810 ?auto_1259812 ) ) ( not ( = ?auto_1259810 ?auto_1259814 ) ) ( not ( = ?auto_1259811 ?auto_1259813 ) ) ( not ( = ?auto_1259811 ?auto_1259812 ) ) ( not ( = ?auto_1259811 ?auto_1259814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259813 ?auto_1259812 ?auto_1259814 )
      ( MAKE-5CRATE-VERIFY ?auto_1259809 ?auto_1259810 ?auto_1259811 ?auto_1259813 ?auto_1259812 ?auto_1259814 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1259859 - SURFACE
      ?auto_1259860 - SURFACE
      ?auto_1259861 - SURFACE
      ?auto_1259863 - SURFACE
      ?auto_1259862 - SURFACE
      ?auto_1259864 - SURFACE
    )
    :vars
    (
      ?auto_1259868 - HOIST
      ?auto_1259866 - PLACE
      ?auto_1259867 - TRUCK
      ?auto_1259865 - PLACE
      ?auto_1259869 - HOIST
      ?auto_1259870 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259868 ?auto_1259866 ) ( SURFACE-AT ?auto_1259862 ?auto_1259866 ) ( CLEAR ?auto_1259862 ) ( IS-CRATE ?auto_1259864 ) ( not ( = ?auto_1259862 ?auto_1259864 ) ) ( AVAILABLE ?auto_1259868 ) ( ON ?auto_1259862 ?auto_1259863 ) ( not ( = ?auto_1259863 ?auto_1259862 ) ) ( not ( = ?auto_1259863 ?auto_1259864 ) ) ( TRUCK-AT ?auto_1259867 ?auto_1259865 ) ( not ( = ?auto_1259865 ?auto_1259866 ) ) ( HOIST-AT ?auto_1259869 ?auto_1259865 ) ( not ( = ?auto_1259868 ?auto_1259869 ) ) ( AVAILABLE ?auto_1259869 ) ( SURFACE-AT ?auto_1259864 ?auto_1259865 ) ( ON ?auto_1259864 ?auto_1259870 ) ( CLEAR ?auto_1259864 ) ( not ( = ?auto_1259862 ?auto_1259870 ) ) ( not ( = ?auto_1259864 ?auto_1259870 ) ) ( not ( = ?auto_1259863 ?auto_1259870 ) ) ( ON ?auto_1259860 ?auto_1259859 ) ( ON ?auto_1259861 ?auto_1259860 ) ( ON ?auto_1259863 ?auto_1259861 ) ( not ( = ?auto_1259859 ?auto_1259860 ) ) ( not ( = ?auto_1259859 ?auto_1259861 ) ) ( not ( = ?auto_1259859 ?auto_1259863 ) ) ( not ( = ?auto_1259859 ?auto_1259862 ) ) ( not ( = ?auto_1259859 ?auto_1259864 ) ) ( not ( = ?auto_1259859 ?auto_1259870 ) ) ( not ( = ?auto_1259860 ?auto_1259861 ) ) ( not ( = ?auto_1259860 ?auto_1259863 ) ) ( not ( = ?auto_1259860 ?auto_1259862 ) ) ( not ( = ?auto_1259860 ?auto_1259864 ) ) ( not ( = ?auto_1259860 ?auto_1259870 ) ) ( not ( = ?auto_1259861 ?auto_1259863 ) ) ( not ( = ?auto_1259861 ?auto_1259862 ) ) ( not ( = ?auto_1259861 ?auto_1259864 ) ) ( not ( = ?auto_1259861 ?auto_1259870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259863 ?auto_1259862 ?auto_1259864 )
      ( MAKE-5CRATE-VERIFY ?auto_1259859 ?auto_1259860 ?auto_1259861 ?auto_1259863 ?auto_1259862 ?auto_1259864 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1259910 - SURFACE
      ?auto_1259911 - SURFACE
      ?auto_1259912 - SURFACE
      ?auto_1259914 - SURFACE
      ?auto_1259913 - SURFACE
      ?auto_1259915 - SURFACE
    )
    :vars
    (
      ?auto_1259917 - HOIST
      ?auto_1259916 - PLACE
      ?auto_1259918 - PLACE
      ?auto_1259921 - HOIST
      ?auto_1259919 - SURFACE
      ?auto_1259920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259917 ?auto_1259916 ) ( SURFACE-AT ?auto_1259913 ?auto_1259916 ) ( CLEAR ?auto_1259913 ) ( IS-CRATE ?auto_1259915 ) ( not ( = ?auto_1259913 ?auto_1259915 ) ) ( AVAILABLE ?auto_1259917 ) ( ON ?auto_1259913 ?auto_1259914 ) ( not ( = ?auto_1259914 ?auto_1259913 ) ) ( not ( = ?auto_1259914 ?auto_1259915 ) ) ( not ( = ?auto_1259918 ?auto_1259916 ) ) ( HOIST-AT ?auto_1259921 ?auto_1259918 ) ( not ( = ?auto_1259917 ?auto_1259921 ) ) ( AVAILABLE ?auto_1259921 ) ( SURFACE-AT ?auto_1259915 ?auto_1259918 ) ( ON ?auto_1259915 ?auto_1259919 ) ( CLEAR ?auto_1259915 ) ( not ( = ?auto_1259913 ?auto_1259919 ) ) ( not ( = ?auto_1259915 ?auto_1259919 ) ) ( not ( = ?auto_1259914 ?auto_1259919 ) ) ( TRUCK-AT ?auto_1259920 ?auto_1259916 ) ( ON ?auto_1259911 ?auto_1259910 ) ( ON ?auto_1259912 ?auto_1259911 ) ( ON ?auto_1259914 ?auto_1259912 ) ( not ( = ?auto_1259910 ?auto_1259911 ) ) ( not ( = ?auto_1259910 ?auto_1259912 ) ) ( not ( = ?auto_1259910 ?auto_1259914 ) ) ( not ( = ?auto_1259910 ?auto_1259913 ) ) ( not ( = ?auto_1259910 ?auto_1259915 ) ) ( not ( = ?auto_1259910 ?auto_1259919 ) ) ( not ( = ?auto_1259911 ?auto_1259912 ) ) ( not ( = ?auto_1259911 ?auto_1259914 ) ) ( not ( = ?auto_1259911 ?auto_1259913 ) ) ( not ( = ?auto_1259911 ?auto_1259915 ) ) ( not ( = ?auto_1259911 ?auto_1259919 ) ) ( not ( = ?auto_1259912 ?auto_1259914 ) ) ( not ( = ?auto_1259912 ?auto_1259913 ) ) ( not ( = ?auto_1259912 ?auto_1259915 ) ) ( not ( = ?auto_1259912 ?auto_1259919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259914 ?auto_1259913 ?auto_1259915 )
      ( MAKE-5CRATE-VERIFY ?auto_1259910 ?auto_1259911 ?auto_1259912 ?auto_1259914 ?auto_1259913 ?auto_1259915 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1259961 - SURFACE
      ?auto_1259962 - SURFACE
      ?auto_1259963 - SURFACE
      ?auto_1259965 - SURFACE
      ?auto_1259964 - SURFACE
      ?auto_1259966 - SURFACE
    )
    :vars
    (
      ?auto_1259971 - HOIST
      ?auto_1259969 - PLACE
      ?auto_1259968 - PLACE
      ?auto_1259967 - HOIST
      ?auto_1259972 - SURFACE
      ?auto_1259970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1259971 ?auto_1259969 ) ( IS-CRATE ?auto_1259966 ) ( not ( = ?auto_1259964 ?auto_1259966 ) ) ( not ( = ?auto_1259965 ?auto_1259964 ) ) ( not ( = ?auto_1259965 ?auto_1259966 ) ) ( not ( = ?auto_1259968 ?auto_1259969 ) ) ( HOIST-AT ?auto_1259967 ?auto_1259968 ) ( not ( = ?auto_1259971 ?auto_1259967 ) ) ( AVAILABLE ?auto_1259967 ) ( SURFACE-AT ?auto_1259966 ?auto_1259968 ) ( ON ?auto_1259966 ?auto_1259972 ) ( CLEAR ?auto_1259966 ) ( not ( = ?auto_1259964 ?auto_1259972 ) ) ( not ( = ?auto_1259966 ?auto_1259972 ) ) ( not ( = ?auto_1259965 ?auto_1259972 ) ) ( TRUCK-AT ?auto_1259970 ?auto_1259969 ) ( SURFACE-AT ?auto_1259965 ?auto_1259969 ) ( CLEAR ?auto_1259965 ) ( LIFTING ?auto_1259971 ?auto_1259964 ) ( IS-CRATE ?auto_1259964 ) ( ON ?auto_1259962 ?auto_1259961 ) ( ON ?auto_1259963 ?auto_1259962 ) ( ON ?auto_1259965 ?auto_1259963 ) ( not ( = ?auto_1259961 ?auto_1259962 ) ) ( not ( = ?auto_1259961 ?auto_1259963 ) ) ( not ( = ?auto_1259961 ?auto_1259965 ) ) ( not ( = ?auto_1259961 ?auto_1259964 ) ) ( not ( = ?auto_1259961 ?auto_1259966 ) ) ( not ( = ?auto_1259961 ?auto_1259972 ) ) ( not ( = ?auto_1259962 ?auto_1259963 ) ) ( not ( = ?auto_1259962 ?auto_1259965 ) ) ( not ( = ?auto_1259962 ?auto_1259964 ) ) ( not ( = ?auto_1259962 ?auto_1259966 ) ) ( not ( = ?auto_1259962 ?auto_1259972 ) ) ( not ( = ?auto_1259963 ?auto_1259965 ) ) ( not ( = ?auto_1259963 ?auto_1259964 ) ) ( not ( = ?auto_1259963 ?auto_1259966 ) ) ( not ( = ?auto_1259963 ?auto_1259972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1259965 ?auto_1259964 ?auto_1259966 )
      ( MAKE-5CRATE-VERIFY ?auto_1259961 ?auto_1259962 ?auto_1259963 ?auto_1259965 ?auto_1259964 ?auto_1259966 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1260012 - SURFACE
      ?auto_1260013 - SURFACE
      ?auto_1260014 - SURFACE
      ?auto_1260016 - SURFACE
      ?auto_1260015 - SURFACE
      ?auto_1260017 - SURFACE
    )
    :vars
    (
      ?auto_1260018 - HOIST
      ?auto_1260021 - PLACE
      ?auto_1260019 - PLACE
      ?auto_1260020 - HOIST
      ?auto_1260023 - SURFACE
      ?auto_1260022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260018 ?auto_1260021 ) ( IS-CRATE ?auto_1260017 ) ( not ( = ?auto_1260015 ?auto_1260017 ) ) ( not ( = ?auto_1260016 ?auto_1260015 ) ) ( not ( = ?auto_1260016 ?auto_1260017 ) ) ( not ( = ?auto_1260019 ?auto_1260021 ) ) ( HOIST-AT ?auto_1260020 ?auto_1260019 ) ( not ( = ?auto_1260018 ?auto_1260020 ) ) ( AVAILABLE ?auto_1260020 ) ( SURFACE-AT ?auto_1260017 ?auto_1260019 ) ( ON ?auto_1260017 ?auto_1260023 ) ( CLEAR ?auto_1260017 ) ( not ( = ?auto_1260015 ?auto_1260023 ) ) ( not ( = ?auto_1260017 ?auto_1260023 ) ) ( not ( = ?auto_1260016 ?auto_1260023 ) ) ( TRUCK-AT ?auto_1260022 ?auto_1260021 ) ( SURFACE-AT ?auto_1260016 ?auto_1260021 ) ( CLEAR ?auto_1260016 ) ( IS-CRATE ?auto_1260015 ) ( AVAILABLE ?auto_1260018 ) ( IN ?auto_1260015 ?auto_1260022 ) ( ON ?auto_1260013 ?auto_1260012 ) ( ON ?auto_1260014 ?auto_1260013 ) ( ON ?auto_1260016 ?auto_1260014 ) ( not ( = ?auto_1260012 ?auto_1260013 ) ) ( not ( = ?auto_1260012 ?auto_1260014 ) ) ( not ( = ?auto_1260012 ?auto_1260016 ) ) ( not ( = ?auto_1260012 ?auto_1260015 ) ) ( not ( = ?auto_1260012 ?auto_1260017 ) ) ( not ( = ?auto_1260012 ?auto_1260023 ) ) ( not ( = ?auto_1260013 ?auto_1260014 ) ) ( not ( = ?auto_1260013 ?auto_1260016 ) ) ( not ( = ?auto_1260013 ?auto_1260015 ) ) ( not ( = ?auto_1260013 ?auto_1260017 ) ) ( not ( = ?auto_1260013 ?auto_1260023 ) ) ( not ( = ?auto_1260014 ?auto_1260016 ) ) ( not ( = ?auto_1260014 ?auto_1260015 ) ) ( not ( = ?auto_1260014 ?auto_1260017 ) ) ( not ( = ?auto_1260014 ?auto_1260023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1260016 ?auto_1260015 ?auto_1260017 )
      ( MAKE-5CRATE-VERIFY ?auto_1260012 ?auto_1260013 ?auto_1260014 ?auto_1260016 ?auto_1260015 ?auto_1260017 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1261221 - SURFACE
      ?auto_1261222 - SURFACE
      ?auto_1261223 - SURFACE
      ?auto_1261225 - SURFACE
      ?auto_1261224 - SURFACE
      ?auto_1261226 - SURFACE
      ?auto_1261227 - SURFACE
    )
    :vars
    (
      ?auto_1261228 - HOIST
      ?auto_1261229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261228 ?auto_1261229 ) ( SURFACE-AT ?auto_1261226 ?auto_1261229 ) ( CLEAR ?auto_1261226 ) ( LIFTING ?auto_1261228 ?auto_1261227 ) ( IS-CRATE ?auto_1261227 ) ( not ( = ?auto_1261226 ?auto_1261227 ) ) ( ON ?auto_1261222 ?auto_1261221 ) ( ON ?auto_1261223 ?auto_1261222 ) ( ON ?auto_1261225 ?auto_1261223 ) ( ON ?auto_1261224 ?auto_1261225 ) ( ON ?auto_1261226 ?auto_1261224 ) ( not ( = ?auto_1261221 ?auto_1261222 ) ) ( not ( = ?auto_1261221 ?auto_1261223 ) ) ( not ( = ?auto_1261221 ?auto_1261225 ) ) ( not ( = ?auto_1261221 ?auto_1261224 ) ) ( not ( = ?auto_1261221 ?auto_1261226 ) ) ( not ( = ?auto_1261221 ?auto_1261227 ) ) ( not ( = ?auto_1261222 ?auto_1261223 ) ) ( not ( = ?auto_1261222 ?auto_1261225 ) ) ( not ( = ?auto_1261222 ?auto_1261224 ) ) ( not ( = ?auto_1261222 ?auto_1261226 ) ) ( not ( = ?auto_1261222 ?auto_1261227 ) ) ( not ( = ?auto_1261223 ?auto_1261225 ) ) ( not ( = ?auto_1261223 ?auto_1261224 ) ) ( not ( = ?auto_1261223 ?auto_1261226 ) ) ( not ( = ?auto_1261223 ?auto_1261227 ) ) ( not ( = ?auto_1261225 ?auto_1261224 ) ) ( not ( = ?auto_1261225 ?auto_1261226 ) ) ( not ( = ?auto_1261225 ?auto_1261227 ) ) ( not ( = ?auto_1261224 ?auto_1261226 ) ) ( not ( = ?auto_1261224 ?auto_1261227 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1261226 ?auto_1261227 )
      ( MAKE-6CRATE-VERIFY ?auto_1261221 ?auto_1261222 ?auto_1261223 ?auto_1261225 ?auto_1261224 ?auto_1261226 ?auto_1261227 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1261265 - SURFACE
      ?auto_1261266 - SURFACE
      ?auto_1261267 - SURFACE
      ?auto_1261269 - SURFACE
      ?auto_1261268 - SURFACE
      ?auto_1261270 - SURFACE
      ?auto_1261271 - SURFACE
    )
    :vars
    (
      ?auto_1261272 - HOIST
      ?auto_1261274 - PLACE
      ?auto_1261273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261272 ?auto_1261274 ) ( SURFACE-AT ?auto_1261270 ?auto_1261274 ) ( CLEAR ?auto_1261270 ) ( IS-CRATE ?auto_1261271 ) ( not ( = ?auto_1261270 ?auto_1261271 ) ) ( TRUCK-AT ?auto_1261273 ?auto_1261274 ) ( AVAILABLE ?auto_1261272 ) ( IN ?auto_1261271 ?auto_1261273 ) ( ON ?auto_1261270 ?auto_1261268 ) ( not ( = ?auto_1261268 ?auto_1261270 ) ) ( not ( = ?auto_1261268 ?auto_1261271 ) ) ( ON ?auto_1261266 ?auto_1261265 ) ( ON ?auto_1261267 ?auto_1261266 ) ( ON ?auto_1261269 ?auto_1261267 ) ( ON ?auto_1261268 ?auto_1261269 ) ( not ( = ?auto_1261265 ?auto_1261266 ) ) ( not ( = ?auto_1261265 ?auto_1261267 ) ) ( not ( = ?auto_1261265 ?auto_1261269 ) ) ( not ( = ?auto_1261265 ?auto_1261268 ) ) ( not ( = ?auto_1261265 ?auto_1261270 ) ) ( not ( = ?auto_1261265 ?auto_1261271 ) ) ( not ( = ?auto_1261266 ?auto_1261267 ) ) ( not ( = ?auto_1261266 ?auto_1261269 ) ) ( not ( = ?auto_1261266 ?auto_1261268 ) ) ( not ( = ?auto_1261266 ?auto_1261270 ) ) ( not ( = ?auto_1261266 ?auto_1261271 ) ) ( not ( = ?auto_1261267 ?auto_1261269 ) ) ( not ( = ?auto_1261267 ?auto_1261268 ) ) ( not ( = ?auto_1261267 ?auto_1261270 ) ) ( not ( = ?auto_1261267 ?auto_1261271 ) ) ( not ( = ?auto_1261269 ?auto_1261268 ) ) ( not ( = ?auto_1261269 ?auto_1261270 ) ) ( not ( = ?auto_1261269 ?auto_1261271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261268 ?auto_1261270 ?auto_1261271 )
      ( MAKE-6CRATE-VERIFY ?auto_1261265 ?auto_1261266 ?auto_1261267 ?auto_1261269 ?auto_1261268 ?auto_1261270 ?auto_1261271 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1261316 - SURFACE
      ?auto_1261317 - SURFACE
      ?auto_1261318 - SURFACE
      ?auto_1261320 - SURFACE
      ?auto_1261319 - SURFACE
      ?auto_1261321 - SURFACE
      ?auto_1261322 - SURFACE
    )
    :vars
    (
      ?auto_1261325 - HOIST
      ?auto_1261324 - PLACE
      ?auto_1261323 - TRUCK
      ?auto_1261326 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261325 ?auto_1261324 ) ( SURFACE-AT ?auto_1261321 ?auto_1261324 ) ( CLEAR ?auto_1261321 ) ( IS-CRATE ?auto_1261322 ) ( not ( = ?auto_1261321 ?auto_1261322 ) ) ( AVAILABLE ?auto_1261325 ) ( IN ?auto_1261322 ?auto_1261323 ) ( ON ?auto_1261321 ?auto_1261319 ) ( not ( = ?auto_1261319 ?auto_1261321 ) ) ( not ( = ?auto_1261319 ?auto_1261322 ) ) ( TRUCK-AT ?auto_1261323 ?auto_1261326 ) ( not ( = ?auto_1261326 ?auto_1261324 ) ) ( ON ?auto_1261317 ?auto_1261316 ) ( ON ?auto_1261318 ?auto_1261317 ) ( ON ?auto_1261320 ?auto_1261318 ) ( ON ?auto_1261319 ?auto_1261320 ) ( not ( = ?auto_1261316 ?auto_1261317 ) ) ( not ( = ?auto_1261316 ?auto_1261318 ) ) ( not ( = ?auto_1261316 ?auto_1261320 ) ) ( not ( = ?auto_1261316 ?auto_1261319 ) ) ( not ( = ?auto_1261316 ?auto_1261321 ) ) ( not ( = ?auto_1261316 ?auto_1261322 ) ) ( not ( = ?auto_1261317 ?auto_1261318 ) ) ( not ( = ?auto_1261317 ?auto_1261320 ) ) ( not ( = ?auto_1261317 ?auto_1261319 ) ) ( not ( = ?auto_1261317 ?auto_1261321 ) ) ( not ( = ?auto_1261317 ?auto_1261322 ) ) ( not ( = ?auto_1261318 ?auto_1261320 ) ) ( not ( = ?auto_1261318 ?auto_1261319 ) ) ( not ( = ?auto_1261318 ?auto_1261321 ) ) ( not ( = ?auto_1261318 ?auto_1261322 ) ) ( not ( = ?auto_1261320 ?auto_1261319 ) ) ( not ( = ?auto_1261320 ?auto_1261321 ) ) ( not ( = ?auto_1261320 ?auto_1261322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261319 ?auto_1261321 ?auto_1261322 )
      ( MAKE-6CRATE-VERIFY ?auto_1261316 ?auto_1261317 ?auto_1261318 ?auto_1261320 ?auto_1261319 ?auto_1261321 ?auto_1261322 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1261373 - SURFACE
      ?auto_1261374 - SURFACE
      ?auto_1261375 - SURFACE
      ?auto_1261377 - SURFACE
      ?auto_1261376 - SURFACE
      ?auto_1261378 - SURFACE
      ?auto_1261379 - SURFACE
    )
    :vars
    (
      ?auto_1261383 - HOIST
      ?auto_1261384 - PLACE
      ?auto_1261380 - TRUCK
      ?auto_1261382 - PLACE
      ?auto_1261381 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261383 ?auto_1261384 ) ( SURFACE-AT ?auto_1261378 ?auto_1261384 ) ( CLEAR ?auto_1261378 ) ( IS-CRATE ?auto_1261379 ) ( not ( = ?auto_1261378 ?auto_1261379 ) ) ( AVAILABLE ?auto_1261383 ) ( ON ?auto_1261378 ?auto_1261376 ) ( not ( = ?auto_1261376 ?auto_1261378 ) ) ( not ( = ?auto_1261376 ?auto_1261379 ) ) ( TRUCK-AT ?auto_1261380 ?auto_1261382 ) ( not ( = ?auto_1261382 ?auto_1261384 ) ) ( HOIST-AT ?auto_1261381 ?auto_1261382 ) ( LIFTING ?auto_1261381 ?auto_1261379 ) ( not ( = ?auto_1261383 ?auto_1261381 ) ) ( ON ?auto_1261374 ?auto_1261373 ) ( ON ?auto_1261375 ?auto_1261374 ) ( ON ?auto_1261377 ?auto_1261375 ) ( ON ?auto_1261376 ?auto_1261377 ) ( not ( = ?auto_1261373 ?auto_1261374 ) ) ( not ( = ?auto_1261373 ?auto_1261375 ) ) ( not ( = ?auto_1261373 ?auto_1261377 ) ) ( not ( = ?auto_1261373 ?auto_1261376 ) ) ( not ( = ?auto_1261373 ?auto_1261378 ) ) ( not ( = ?auto_1261373 ?auto_1261379 ) ) ( not ( = ?auto_1261374 ?auto_1261375 ) ) ( not ( = ?auto_1261374 ?auto_1261377 ) ) ( not ( = ?auto_1261374 ?auto_1261376 ) ) ( not ( = ?auto_1261374 ?auto_1261378 ) ) ( not ( = ?auto_1261374 ?auto_1261379 ) ) ( not ( = ?auto_1261375 ?auto_1261377 ) ) ( not ( = ?auto_1261375 ?auto_1261376 ) ) ( not ( = ?auto_1261375 ?auto_1261378 ) ) ( not ( = ?auto_1261375 ?auto_1261379 ) ) ( not ( = ?auto_1261377 ?auto_1261376 ) ) ( not ( = ?auto_1261377 ?auto_1261378 ) ) ( not ( = ?auto_1261377 ?auto_1261379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261376 ?auto_1261378 ?auto_1261379 )
      ( MAKE-6CRATE-VERIFY ?auto_1261373 ?auto_1261374 ?auto_1261375 ?auto_1261377 ?auto_1261376 ?auto_1261378 ?auto_1261379 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1261436 - SURFACE
      ?auto_1261437 - SURFACE
      ?auto_1261438 - SURFACE
      ?auto_1261440 - SURFACE
      ?auto_1261439 - SURFACE
      ?auto_1261441 - SURFACE
      ?auto_1261442 - SURFACE
    )
    :vars
    (
      ?auto_1261448 - HOIST
      ?auto_1261443 - PLACE
      ?auto_1261445 - TRUCK
      ?auto_1261447 - PLACE
      ?auto_1261446 - HOIST
      ?auto_1261444 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261448 ?auto_1261443 ) ( SURFACE-AT ?auto_1261441 ?auto_1261443 ) ( CLEAR ?auto_1261441 ) ( IS-CRATE ?auto_1261442 ) ( not ( = ?auto_1261441 ?auto_1261442 ) ) ( AVAILABLE ?auto_1261448 ) ( ON ?auto_1261441 ?auto_1261439 ) ( not ( = ?auto_1261439 ?auto_1261441 ) ) ( not ( = ?auto_1261439 ?auto_1261442 ) ) ( TRUCK-AT ?auto_1261445 ?auto_1261447 ) ( not ( = ?auto_1261447 ?auto_1261443 ) ) ( HOIST-AT ?auto_1261446 ?auto_1261447 ) ( not ( = ?auto_1261448 ?auto_1261446 ) ) ( AVAILABLE ?auto_1261446 ) ( SURFACE-AT ?auto_1261442 ?auto_1261447 ) ( ON ?auto_1261442 ?auto_1261444 ) ( CLEAR ?auto_1261442 ) ( not ( = ?auto_1261441 ?auto_1261444 ) ) ( not ( = ?auto_1261442 ?auto_1261444 ) ) ( not ( = ?auto_1261439 ?auto_1261444 ) ) ( ON ?auto_1261437 ?auto_1261436 ) ( ON ?auto_1261438 ?auto_1261437 ) ( ON ?auto_1261440 ?auto_1261438 ) ( ON ?auto_1261439 ?auto_1261440 ) ( not ( = ?auto_1261436 ?auto_1261437 ) ) ( not ( = ?auto_1261436 ?auto_1261438 ) ) ( not ( = ?auto_1261436 ?auto_1261440 ) ) ( not ( = ?auto_1261436 ?auto_1261439 ) ) ( not ( = ?auto_1261436 ?auto_1261441 ) ) ( not ( = ?auto_1261436 ?auto_1261442 ) ) ( not ( = ?auto_1261436 ?auto_1261444 ) ) ( not ( = ?auto_1261437 ?auto_1261438 ) ) ( not ( = ?auto_1261437 ?auto_1261440 ) ) ( not ( = ?auto_1261437 ?auto_1261439 ) ) ( not ( = ?auto_1261437 ?auto_1261441 ) ) ( not ( = ?auto_1261437 ?auto_1261442 ) ) ( not ( = ?auto_1261437 ?auto_1261444 ) ) ( not ( = ?auto_1261438 ?auto_1261440 ) ) ( not ( = ?auto_1261438 ?auto_1261439 ) ) ( not ( = ?auto_1261438 ?auto_1261441 ) ) ( not ( = ?auto_1261438 ?auto_1261442 ) ) ( not ( = ?auto_1261438 ?auto_1261444 ) ) ( not ( = ?auto_1261440 ?auto_1261439 ) ) ( not ( = ?auto_1261440 ?auto_1261441 ) ) ( not ( = ?auto_1261440 ?auto_1261442 ) ) ( not ( = ?auto_1261440 ?auto_1261444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261439 ?auto_1261441 ?auto_1261442 )
      ( MAKE-6CRATE-VERIFY ?auto_1261436 ?auto_1261437 ?auto_1261438 ?auto_1261440 ?auto_1261439 ?auto_1261441 ?auto_1261442 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1261500 - SURFACE
      ?auto_1261501 - SURFACE
      ?auto_1261502 - SURFACE
      ?auto_1261504 - SURFACE
      ?auto_1261503 - SURFACE
      ?auto_1261505 - SURFACE
      ?auto_1261506 - SURFACE
    )
    :vars
    (
      ?auto_1261507 - HOIST
      ?auto_1261509 - PLACE
      ?auto_1261511 - PLACE
      ?auto_1261508 - HOIST
      ?auto_1261512 - SURFACE
      ?auto_1261510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261507 ?auto_1261509 ) ( SURFACE-AT ?auto_1261505 ?auto_1261509 ) ( CLEAR ?auto_1261505 ) ( IS-CRATE ?auto_1261506 ) ( not ( = ?auto_1261505 ?auto_1261506 ) ) ( AVAILABLE ?auto_1261507 ) ( ON ?auto_1261505 ?auto_1261503 ) ( not ( = ?auto_1261503 ?auto_1261505 ) ) ( not ( = ?auto_1261503 ?auto_1261506 ) ) ( not ( = ?auto_1261511 ?auto_1261509 ) ) ( HOIST-AT ?auto_1261508 ?auto_1261511 ) ( not ( = ?auto_1261507 ?auto_1261508 ) ) ( AVAILABLE ?auto_1261508 ) ( SURFACE-AT ?auto_1261506 ?auto_1261511 ) ( ON ?auto_1261506 ?auto_1261512 ) ( CLEAR ?auto_1261506 ) ( not ( = ?auto_1261505 ?auto_1261512 ) ) ( not ( = ?auto_1261506 ?auto_1261512 ) ) ( not ( = ?auto_1261503 ?auto_1261512 ) ) ( TRUCK-AT ?auto_1261510 ?auto_1261509 ) ( ON ?auto_1261501 ?auto_1261500 ) ( ON ?auto_1261502 ?auto_1261501 ) ( ON ?auto_1261504 ?auto_1261502 ) ( ON ?auto_1261503 ?auto_1261504 ) ( not ( = ?auto_1261500 ?auto_1261501 ) ) ( not ( = ?auto_1261500 ?auto_1261502 ) ) ( not ( = ?auto_1261500 ?auto_1261504 ) ) ( not ( = ?auto_1261500 ?auto_1261503 ) ) ( not ( = ?auto_1261500 ?auto_1261505 ) ) ( not ( = ?auto_1261500 ?auto_1261506 ) ) ( not ( = ?auto_1261500 ?auto_1261512 ) ) ( not ( = ?auto_1261501 ?auto_1261502 ) ) ( not ( = ?auto_1261501 ?auto_1261504 ) ) ( not ( = ?auto_1261501 ?auto_1261503 ) ) ( not ( = ?auto_1261501 ?auto_1261505 ) ) ( not ( = ?auto_1261501 ?auto_1261506 ) ) ( not ( = ?auto_1261501 ?auto_1261512 ) ) ( not ( = ?auto_1261502 ?auto_1261504 ) ) ( not ( = ?auto_1261502 ?auto_1261503 ) ) ( not ( = ?auto_1261502 ?auto_1261505 ) ) ( not ( = ?auto_1261502 ?auto_1261506 ) ) ( not ( = ?auto_1261502 ?auto_1261512 ) ) ( not ( = ?auto_1261504 ?auto_1261503 ) ) ( not ( = ?auto_1261504 ?auto_1261505 ) ) ( not ( = ?auto_1261504 ?auto_1261506 ) ) ( not ( = ?auto_1261504 ?auto_1261512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261503 ?auto_1261505 ?auto_1261506 )
      ( MAKE-6CRATE-VERIFY ?auto_1261500 ?auto_1261501 ?auto_1261502 ?auto_1261504 ?auto_1261503 ?auto_1261505 ?auto_1261506 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1261564 - SURFACE
      ?auto_1261565 - SURFACE
      ?auto_1261566 - SURFACE
      ?auto_1261568 - SURFACE
      ?auto_1261567 - SURFACE
      ?auto_1261569 - SURFACE
      ?auto_1261570 - SURFACE
    )
    :vars
    (
      ?auto_1261572 - HOIST
      ?auto_1261574 - PLACE
      ?auto_1261575 - PLACE
      ?auto_1261576 - HOIST
      ?auto_1261573 - SURFACE
      ?auto_1261571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261572 ?auto_1261574 ) ( IS-CRATE ?auto_1261570 ) ( not ( = ?auto_1261569 ?auto_1261570 ) ) ( not ( = ?auto_1261567 ?auto_1261569 ) ) ( not ( = ?auto_1261567 ?auto_1261570 ) ) ( not ( = ?auto_1261575 ?auto_1261574 ) ) ( HOIST-AT ?auto_1261576 ?auto_1261575 ) ( not ( = ?auto_1261572 ?auto_1261576 ) ) ( AVAILABLE ?auto_1261576 ) ( SURFACE-AT ?auto_1261570 ?auto_1261575 ) ( ON ?auto_1261570 ?auto_1261573 ) ( CLEAR ?auto_1261570 ) ( not ( = ?auto_1261569 ?auto_1261573 ) ) ( not ( = ?auto_1261570 ?auto_1261573 ) ) ( not ( = ?auto_1261567 ?auto_1261573 ) ) ( TRUCK-AT ?auto_1261571 ?auto_1261574 ) ( SURFACE-AT ?auto_1261567 ?auto_1261574 ) ( CLEAR ?auto_1261567 ) ( LIFTING ?auto_1261572 ?auto_1261569 ) ( IS-CRATE ?auto_1261569 ) ( ON ?auto_1261565 ?auto_1261564 ) ( ON ?auto_1261566 ?auto_1261565 ) ( ON ?auto_1261568 ?auto_1261566 ) ( ON ?auto_1261567 ?auto_1261568 ) ( not ( = ?auto_1261564 ?auto_1261565 ) ) ( not ( = ?auto_1261564 ?auto_1261566 ) ) ( not ( = ?auto_1261564 ?auto_1261568 ) ) ( not ( = ?auto_1261564 ?auto_1261567 ) ) ( not ( = ?auto_1261564 ?auto_1261569 ) ) ( not ( = ?auto_1261564 ?auto_1261570 ) ) ( not ( = ?auto_1261564 ?auto_1261573 ) ) ( not ( = ?auto_1261565 ?auto_1261566 ) ) ( not ( = ?auto_1261565 ?auto_1261568 ) ) ( not ( = ?auto_1261565 ?auto_1261567 ) ) ( not ( = ?auto_1261565 ?auto_1261569 ) ) ( not ( = ?auto_1261565 ?auto_1261570 ) ) ( not ( = ?auto_1261565 ?auto_1261573 ) ) ( not ( = ?auto_1261566 ?auto_1261568 ) ) ( not ( = ?auto_1261566 ?auto_1261567 ) ) ( not ( = ?auto_1261566 ?auto_1261569 ) ) ( not ( = ?auto_1261566 ?auto_1261570 ) ) ( not ( = ?auto_1261566 ?auto_1261573 ) ) ( not ( = ?auto_1261568 ?auto_1261567 ) ) ( not ( = ?auto_1261568 ?auto_1261569 ) ) ( not ( = ?auto_1261568 ?auto_1261570 ) ) ( not ( = ?auto_1261568 ?auto_1261573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261567 ?auto_1261569 ?auto_1261570 )
      ( MAKE-6CRATE-VERIFY ?auto_1261564 ?auto_1261565 ?auto_1261566 ?auto_1261568 ?auto_1261567 ?auto_1261569 ?auto_1261570 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1261628 - SURFACE
      ?auto_1261629 - SURFACE
      ?auto_1261630 - SURFACE
      ?auto_1261632 - SURFACE
      ?auto_1261631 - SURFACE
      ?auto_1261633 - SURFACE
      ?auto_1261634 - SURFACE
    )
    :vars
    (
      ?auto_1261639 - HOIST
      ?auto_1261638 - PLACE
      ?auto_1261636 - PLACE
      ?auto_1261635 - HOIST
      ?auto_1261640 - SURFACE
      ?auto_1261637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1261639 ?auto_1261638 ) ( IS-CRATE ?auto_1261634 ) ( not ( = ?auto_1261633 ?auto_1261634 ) ) ( not ( = ?auto_1261631 ?auto_1261633 ) ) ( not ( = ?auto_1261631 ?auto_1261634 ) ) ( not ( = ?auto_1261636 ?auto_1261638 ) ) ( HOIST-AT ?auto_1261635 ?auto_1261636 ) ( not ( = ?auto_1261639 ?auto_1261635 ) ) ( AVAILABLE ?auto_1261635 ) ( SURFACE-AT ?auto_1261634 ?auto_1261636 ) ( ON ?auto_1261634 ?auto_1261640 ) ( CLEAR ?auto_1261634 ) ( not ( = ?auto_1261633 ?auto_1261640 ) ) ( not ( = ?auto_1261634 ?auto_1261640 ) ) ( not ( = ?auto_1261631 ?auto_1261640 ) ) ( TRUCK-AT ?auto_1261637 ?auto_1261638 ) ( SURFACE-AT ?auto_1261631 ?auto_1261638 ) ( CLEAR ?auto_1261631 ) ( IS-CRATE ?auto_1261633 ) ( AVAILABLE ?auto_1261639 ) ( IN ?auto_1261633 ?auto_1261637 ) ( ON ?auto_1261629 ?auto_1261628 ) ( ON ?auto_1261630 ?auto_1261629 ) ( ON ?auto_1261632 ?auto_1261630 ) ( ON ?auto_1261631 ?auto_1261632 ) ( not ( = ?auto_1261628 ?auto_1261629 ) ) ( not ( = ?auto_1261628 ?auto_1261630 ) ) ( not ( = ?auto_1261628 ?auto_1261632 ) ) ( not ( = ?auto_1261628 ?auto_1261631 ) ) ( not ( = ?auto_1261628 ?auto_1261633 ) ) ( not ( = ?auto_1261628 ?auto_1261634 ) ) ( not ( = ?auto_1261628 ?auto_1261640 ) ) ( not ( = ?auto_1261629 ?auto_1261630 ) ) ( not ( = ?auto_1261629 ?auto_1261632 ) ) ( not ( = ?auto_1261629 ?auto_1261631 ) ) ( not ( = ?auto_1261629 ?auto_1261633 ) ) ( not ( = ?auto_1261629 ?auto_1261634 ) ) ( not ( = ?auto_1261629 ?auto_1261640 ) ) ( not ( = ?auto_1261630 ?auto_1261632 ) ) ( not ( = ?auto_1261630 ?auto_1261631 ) ) ( not ( = ?auto_1261630 ?auto_1261633 ) ) ( not ( = ?auto_1261630 ?auto_1261634 ) ) ( not ( = ?auto_1261630 ?auto_1261640 ) ) ( not ( = ?auto_1261632 ?auto_1261631 ) ) ( not ( = ?auto_1261632 ?auto_1261633 ) ) ( not ( = ?auto_1261632 ?auto_1261634 ) ) ( not ( = ?auto_1261632 ?auto_1261640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1261631 ?auto_1261633 ?auto_1261634 )
      ( MAKE-6CRATE-VERIFY ?auto_1261628 ?auto_1261629 ?auto_1261630 ?auto_1261632 ?auto_1261631 ?auto_1261633 ?auto_1261634 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1263584 - SURFACE
      ?auto_1263585 - SURFACE
      ?auto_1263586 - SURFACE
      ?auto_1263588 - SURFACE
      ?auto_1263587 - SURFACE
      ?auto_1263589 - SURFACE
      ?auto_1263590 - SURFACE
      ?auto_1263591 - SURFACE
    )
    :vars
    (
      ?auto_1263592 - HOIST
      ?auto_1263593 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1263592 ?auto_1263593 ) ( SURFACE-AT ?auto_1263590 ?auto_1263593 ) ( CLEAR ?auto_1263590 ) ( LIFTING ?auto_1263592 ?auto_1263591 ) ( IS-CRATE ?auto_1263591 ) ( not ( = ?auto_1263590 ?auto_1263591 ) ) ( ON ?auto_1263585 ?auto_1263584 ) ( ON ?auto_1263586 ?auto_1263585 ) ( ON ?auto_1263588 ?auto_1263586 ) ( ON ?auto_1263587 ?auto_1263588 ) ( ON ?auto_1263589 ?auto_1263587 ) ( ON ?auto_1263590 ?auto_1263589 ) ( not ( = ?auto_1263584 ?auto_1263585 ) ) ( not ( = ?auto_1263584 ?auto_1263586 ) ) ( not ( = ?auto_1263584 ?auto_1263588 ) ) ( not ( = ?auto_1263584 ?auto_1263587 ) ) ( not ( = ?auto_1263584 ?auto_1263589 ) ) ( not ( = ?auto_1263584 ?auto_1263590 ) ) ( not ( = ?auto_1263584 ?auto_1263591 ) ) ( not ( = ?auto_1263585 ?auto_1263586 ) ) ( not ( = ?auto_1263585 ?auto_1263588 ) ) ( not ( = ?auto_1263585 ?auto_1263587 ) ) ( not ( = ?auto_1263585 ?auto_1263589 ) ) ( not ( = ?auto_1263585 ?auto_1263590 ) ) ( not ( = ?auto_1263585 ?auto_1263591 ) ) ( not ( = ?auto_1263586 ?auto_1263588 ) ) ( not ( = ?auto_1263586 ?auto_1263587 ) ) ( not ( = ?auto_1263586 ?auto_1263589 ) ) ( not ( = ?auto_1263586 ?auto_1263590 ) ) ( not ( = ?auto_1263586 ?auto_1263591 ) ) ( not ( = ?auto_1263588 ?auto_1263587 ) ) ( not ( = ?auto_1263588 ?auto_1263589 ) ) ( not ( = ?auto_1263588 ?auto_1263590 ) ) ( not ( = ?auto_1263588 ?auto_1263591 ) ) ( not ( = ?auto_1263587 ?auto_1263589 ) ) ( not ( = ?auto_1263587 ?auto_1263590 ) ) ( not ( = ?auto_1263587 ?auto_1263591 ) ) ( not ( = ?auto_1263589 ?auto_1263590 ) ) ( not ( = ?auto_1263589 ?auto_1263591 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1263590 ?auto_1263591 )
      ( MAKE-7CRATE-VERIFY ?auto_1263584 ?auto_1263585 ?auto_1263586 ?auto_1263588 ?auto_1263587 ?auto_1263589 ?auto_1263590 ?auto_1263591 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1263639 - SURFACE
      ?auto_1263640 - SURFACE
      ?auto_1263641 - SURFACE
      ?auto_1263643 - SURFACE
      ?auto_1263642 - SURFACE
      ?auto_1263644 - SURFACE
      ?auto_1263645 - SURFACE
      ?auto_1263646 - SURFACE
    )
    :vars
    (
      ?auto_1263649 - HOIST
      ?auto_1263648 - PLACE
      ?auto_1263647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1263649 ?auto_1263648 ) ( SURFACE-AT ?auto_1263645 ?auto_1263648 ) ( CLEAR ?auto_1263645 ) ( IS-CRATE ?auto_1263646 ) ( not ( = ?auto_1263645 ?auto_1263646 ) ) ( TRUCK-AT ?auto_1263647 ?auto_1263648 ) ( AVAILABLE ?auto_1263649 ) ( IN ?auto_1263646 ?auto_1263647 ) ( ON ?auto_1263645 ?auto_1263644 ) ( not ( = ?auto_1263644 ?auto_1263645 ) ) ( not ( = ?auto_1263644 ?auto_1263646 ) ) ( ON ?auto_1263640 ?auto_1263639 ) ( ON ?auto_1263641 ?auto_1263640 ) ( ON ?auto_1263643 ?auto_1263641 ) ( ON ?auto_1263642 ?auto_1263643 ) ( ON ?auto_1263644 ?auto_1263642 ) ( not ( = ?auto_1263639 ?auto_1263640 ) ) ( not ( = ?auto_1263639 ?auto_1263641 ) ) ( not ( = ?auto_1263639 ?auto_1263643 ) ) ( not ( = ?auto_1263639 ?auto_1263642 ) ) ( not ( = ?auto_1263639 ?auto_1263644 ) ) ( not ( = ?auto_1263639 ?auto_1263645 ) ) ( not ( = ?auto_1263639 ?auto_1263646 ) ) ( not ( = ?auto_1263640 ?auto_1263641 ) ) ( not ( = ?auto_1263640 ?auto_1263643 ) ) ( not ( = ?auto_1263640 ?auto_1263642 ) ) ( not ( = ?auto_1263640 ?auto_1263644 ) ) ( not ( = ?auto_1263640 ?auto_1263645 ) ) ( not ( = ?auto_1263640 ?auto_1263646 ) ) ( not ( = ?auto_1263641 ?auto_1263643 ) ) ( not ( = ?auto_1263641 ?auto_1263642 ) ) ( not ( = ?auto_1263641 ?auto_1263644 ) ) ( not ( = ?auto_1263641 ?auto_1263645 ) ) ( not ( = ?auto_1263641 ?auto_1263646 ) ) ( not ( = ?auto_1263643 ?auto_1263642 ) ) ( not ( = ?auto_1263643 ?auto_1263644 ) ) ( not ( = ?auto_1263643 ?auto_1263645 ) ) ( not ( = ?auto_1263643 ?auto_1263646 ) ) ( not ( = ?auto_1263642 ?auto_1263644 ) ) ( not ( = ?auto_1263642 ?auto_1263645 ) ) ( not ( = ?auto_1263642 ?auto_1263646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1263644 ?auto_1263645 ?auto_1263646 )
      ( MAKE-7CRATE-VERIFY ?auto_1263639 ?auto_1263640 ?auto_1263641 ?auto_1263643 ?auto_1263642 ?auto_1263644 ?auto_1263645 ?auto_1263646 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1263702 - SURFACE
      ?auto_1263703 - SURFACE
      ?auto_1263704 - SURFACE
      ?auto_1263706 - SURFACE
      ?auto_1263705 - SURFACE
      ?auto_1263707 - SURFACE
      ?auto_1263708 - SURFACE
      ?auto_1263709 - SURFACE
    )
    :vars
    (
      ?auto_1263711 - HOIST
      ?auto_1263712 - PLACE
      ?auto_1263710 - TRUCK
      ?auto_1263713 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1263711 ?auto_1263712 ) ( SURFACE-AT ?auto_1263708 ?auto_1263712 ) ( CLEAR ?auto_1263708 ) ( IS-CRATE ?auto_1263709 ) ( not ( = ?auto_1263708 ?auto_1263709 ) ) ( AVAILABLE ?auto_1263711 ) ( IN ?auto_1263709 ?auto_1263710 ) ( ON ?auto_1263708 ?auto_1263707 ) ( not ( = ?auto_1263707 ?auto_1263708 ) ) ( not ( = ?auto_1263707 ?auto_1263709 ) ) ( TRUCK-AT ?auto_1263710 ?auto_1263713 ) ( not ( = ?auto_1263713 ?auto_1263712 ) ) ( ON ?auto_1263703 ?auto_1263702 ) ( ON ?auto_1263704 ?auto_1263703 ) ( ON ?auto_1263706 ?auto_1263704 ) ( ON ?auto_1263705 ?auto_1263706 ) ( ON ?auto_1263707 ?auto_1263705 ) ( not ( = ?auto_1263702 ?auto_1263703 ) ) ( not ( = ?auto_1263702 ?auto_1263704 ) ) ( not ( = ?auto_1263702 ?auto_1263706 ) ) ( not ( = ?auto_1263702 ?auto_1263705 ) ) ( not ( = ?auto_1263702 ?auto_1263707 ) ) ( not ( = ?auto_1263702 ?auto_1263708 ) ) ( not ( = ?auto_1263702 ?auto_1263709 ) ) ( not ( = ?auto_1263703 ?auto_1263704 ) ) ( not ( = ?auto_1263703 ?auto_1263706 ) ) ( not ( = ?auto_1263703 ?auto_1263705 ) ) ( not ( = ?auto_1263703 ?auto_1263707 ) ) ( not ( = ?auto_1263703 ?auto_1263708 ) ) ( not ( = ?auto_1263703 ?auto_1263709 ) ) ( not ( = ?auto_1263704 ?auto_1263706 ) ) ( not ( = ?auto_1263704 ?auto_1263705 ) ) ( not ( = ?auto_1263704 ?auto_1263707 ) ) ( not ( = ?auto_1263704 ?auto_1263708 ) ) ( not ( = ?auto_1263704 ?auto_1263709 ) ) ( not ( = ?auto_1263706 ?auto_1263705 ) ) ( not ( = ?auto_1263706 ?auto_1263707 ) ) ( not ( = ?auto_1263706 ?auto_1263708 ) ) ( not ( = ?auto_1263706 ?auto_1263709 ) ) ( not ( = ?auto_1263705 ?auto_1263707 ) ) ( not ( = ?auto_1263705 ?auto_1263708 ) ) ( not ( = ?auto_1263705 ?auto_1263709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1263707 ?auto_1263708 ?auto_1263709 )
      ( MAKE-7CRATE-VERIFY ?auto_1263702 ?auto_1263703 ?auto_1263704 ?auto_1263706 ?auto_1263705 ?auto_1263707 ?auto_1263708 ?auto_1263709 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1263772 - SURFACE
      ?auto_1263773 - SURFACE
      ?auto_1263774 - SURFACE
      ?auto_1263776 - SURFACE
      ?auto_1263775 - SURFACE
      ?auto_1263777 - SURFACE
      ?auto_1263778 - SURFACE
      ?auto_1263779 - SURFACE
    )
    :vars
    (
      ?auto_1263782 - HOIST
      ?auto_1263783 - PLACE
      ?auto_1263784 - TRUCK
      ?auto_1263780 - PLACE
      ?auto_1263781 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1263782 ?auto_1263783 ) ( SURFACE-AT ?auto_1263778 ?auto_1263783 ) ( CLEAR ?auto_1263778 ) ( IS-CRATE ?auto_1263779 ) ( not ( = ?auto_1263778 ?auto_1263779 ) ) ( AVAILABLE ?auto_1263782 ) ( ON ?auto_1263778 ?auto_1263777 ) ( not ( = ?auto_1263777 ?auto_1263778 ) ) ( not ( = ?auto_1263777 ?auto_1263779 ) ) ( TRUCK-AT ?auto_1263784 ?auto_1263780 ) ( not ( = ?auto_1263780 ?auto_1263783 ) ) ( HOIST-AT ?auto_1263781 ?auto_1263780 ) ( LIFTING ?auto_1263781 ?auto_1263779 ) ( not ( = ?auto_1263782 ?auto_1263781 ) ) ( ON ?auto_1263773 ?auto_1263772 ) ( ON ?auto_1263774 ?auto_1263773 ) ( ON ?auto_1263776 ?auto_1263774 ) ( ON ?auto_1263775 ?auto_1263776 ) ( ON ?auto_1263777 ?auto_1263775 ) ( not ( = ?auto_1263772 ?auto_1263773 ) ) ( not ( = ?auto_1263772 ?auto_1263774 ) ) ( not ( = ?auto_1263772 ?auto_1263776 ) ) ( not ( = ?auto_1263772 ?auto_1263775 ) ) ( not ( = ?auto_1263772 ?auto_1263777 ) ) ( not ( = ?auto_1263772 ?auto_1263778 ) ) ( not ( = ?auto_1263772 ?auto_1263779 ) ) ( not ( = ?auto_1263773 ?auto_1263774 ) ) ( not ( = ?auto_1263773 ?auto_1263776 ) ) ( not ( = ?auto_1263773 ?auto_1263775 ) ) ( not ( = ?auto_1263773 ?auto_1263777 ) ) ( not ( = ?auto_1263773 ?auto_1263778 ) ) ( not ( = ?auto_1263773 ?auto_1263779 ) ) ( not ( = ?auto_1263774 ?auto_1263776 ) ) ( not ( = ?auto_1263774 ?auto_1263775 ) ) ( not ( = ?auto_1263774 ?auto_1263777 ) ) ( not ( = ?auto_1263774 ?auto_1263778 ) ) ( not ( = ?auto_1263774 ?auto_1263779 ) ) ( not ( = ?auto_1263776 ?auto_1263775 ) ) ( not ( = ?auto_1263776 ?auto_1263777 ) ) ( not ( = ?auto_1263776 ?auto_1263778 ) ) ( not ( = ?auto_1263776 ?auto_1263779 ) ) ( not ( = ?auto_1263775 ?auto_1263777 ) ) ( not ( = ?auto_1263775 ?auto_1263778 ) ) ( not ( = ?auto_1263775 ?auto_1263779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1263777 ?auto_1263778 ?auto_1263779 )
      ( MAKE-7CRATE-VERIFY ?auto_1263772 ?auto_1263773 ?auto_1263774 ?auto_1263776 ?auto_1263775 ?auto_1263777 ?auto_1263778 ?auto_1263779 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1263849 - SURFACE
      ?auto_1263850 - SURFACE
      ?auto_1263851 - SURFACE
      ?auto_1263853 - SURFACE
      ?auto_1263852 - SURFACE
      ?auto_1263854 - SURFACE
      ?auto_1263855 - SURFACE
      ?auto_1263856 - SURFACE
    )
    :vars
    (
      ?auto_1263859 - HOIST
      ?auto_1263862 - PLACE
      ?auto_1263861 - TRUCK
      ?auto_1263860 - PLACE
      ?auto_1263857 - HOIST
      ?auto_1263858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1263859 ?auto_1263862 ) ( SURFACE-AT ?auto_1263855 ?auto_1263862 ) ( CLEAR ?auto_1263855 ) ( IS-CRATE ?auto_1263856 ) ( not ( = ?auto_1263855 ?auto_1263856 ) ) ( AVAILABLE ?auto_1263859 ) ( ON ?auto_1263855 ?auto_1263854 ) ( not ( = ?auto_1263854 ?auto_1263855 ) ) ( not ( = ?auto_1263854 ?auto_1263856 ) ) ( TRUCK-AT ?auto_1263861 ?auto_1263860 ) ( not ( = ?auto_1263860 ?auto_1263862 ) ) ( HOIST-AT ?auto_1263857 ?auto_1263860 ) ( not ( = ?auto_1263859 ?auto_1263857 ) ) ( AVAILABLE ?auto_1263857 ) ( SURFACE-AT ?auto_1263856 ?auto_1263860 ) ( ON ?auto_1263856 ?auto_1263858 ) ( CLEAR ?auto_1263856 ) ( not ( = ?auto_1263855 ?auto_1263858 ) ) ( not ( = ?auto_1263856 ?auto_1263858 ) ) ( not ( = ?auto_1263854 ?auto_1263858 ) ) ( ON ?auto_1263850 ?auto_1263849 ) ( ON ?auto_1263851 ?auto_1263850 ) ( ON ?auto_1263853 ?auto_1263851 ) ( ON ?auto_1263852 ?auto_1263853 ) ( ON ?auto_1263854 ?auto_1263852 ) ( not ( = ?auto_1263849 ?auto_1263850 ) ) ( not ( = ?auto_1263849 ?auto_1263851 ) ) ( not ( = ?auto_1263849 ?auto_1263853 ) ) ( not ( = ?auto_1263849 ?auto_1263852 ) ) ( not ( = ?auto_1263849 ?auto_1263854 ) ) ( not ( = ?auto_1263849 ?auto_1263855 ) ) ( not ( = ?auto_1263849 ?auto_1263856 ) ) ( not ( = ?auto_1263849 ?auto_1263858 ) ) ( not ( = ?auto_1263850 ?auto_1263851 ) ) ( not ( = ?auto_1263850 ?auto_1263853 ) ) ( not ( = ?auto_1263850 ?auto_1263852 ) ) ( not ( = ?auto_1263850 ?auto_1263854 ) ) ( not ( = ?auto_1263850 ?auto_1263855 ) ) ( not ( = ?auto_1263850 ?auto_1263856 ) ) ( not ( = ?auto_1263850 ?auto_1263858 ) ) ( not ( = ?auto_1263851 ?auto_1263853 ) ) ( not ( = ?auto_1263851 ?auto_1263852 ) ) ( not ( = ?auto_1263851 ?auto_1263854 ) ) ( not ( = ?auto_1263851 ?auto_1263855 ) ) ( not ( = ?auto_1263851 ?auto_1263856 ) ) ( not ( = ?auto_1263851 ?auto_1263858 ) ) ( not ( = ?auto_1263853 ?auto_1263852 ) ) ( not ( = ?auto_1263853 ?auto_1263854 ) ) ( not ( = ?auto_1263853 ?auto_1263855 ) ) ( not ( = ?auto_1263853 ?auto_1263856 ) ) ( not ( = ?auto_1263853 ?auto_1263858 ) ) ( not ( = ?auto_1263852 ?auto_1263854 ) ) ( not ( = ?auto_1263852 ?auto_1263855 ) ) ( not ( = ?auto_1263852 ?auto_1263856 ) ) ( not ( = ?auto_1263852 ?auto_1263858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1263854 ?auto_1263855 ?auto_1263856 )
      ( MAKE-7CRATE-VERIFY ?auto_1263849 ?auto_1263850 ?auto_1263851 ?auto_1263853 ?auto_1263852 ?auto_1263854 ?auto_1263855 ?auto_1263856 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1263927 - SURFACE
      ?auto_1263928 - SURFACE
      ?auto_1263929 - SURFACE
      ?auto_1263931 - SURFACE
      ?auto_1263930 - SURFACE
      ?auto_1263932 - SURFACE
      ?auto_1263933 - SURFACE
      ?auto_1263934 - SURFACE
    )
    :vars
    (
      ?auto_1263938 - HOIST
      ?auto_1263939 - PLACE
      ?auto_1263936 - PLACE
      ?auto_1263940 - HOIST
      ?auto_1263935 - SURFACE
      ?auto_1263937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1263938 ?auto_1263939 ) ( SURFACE-AT ?auto_1263933 ?auto_1263939 ) ( CLEAR ?auto_1263933 ) ( IS-CRATE ?auto_1263934 ) ( not ( = ?auto_1263933 ?auto_1263934 ) ) ( AVAILABLE ?auto_1263938 ) ( ON ?auto_1263933 ?auto_1263932 ) ( not ( = ?auto_1263932 ?auto_1263933 ) ) ( not ( = ?auto_1263932 ?auto_1263934 ) ) ( not ( = ?auto_1263936 ?auto_1263939 ) ) ( HOIST-AT ?auto_1263940 ?auto_1263936 ) ( not ( = ?auto_1263938 ?auto_1263940 ) ) ( AVAILABLE ?auto_1263940 ) ( SURFACE-AT ?auto_1263934 ?auto_1263936 ) ( ON ?auto_1263934 ?auto_1263935 ) ( CLEAR ?auto_1263934 ) ( not ( = ?auto_1263933 ?auto_1263935 ) ) ( not ( = ?auto_1263934 ?auto_1263935 ) ) ( not ( = ?auto_1263932 ?auto_1263935 ) ) ( TRUCK-AT ?auto_1263937 ?auto_1263939 ) ( ON ?auto_1263928 ?auto_1263927 ) ( ON ?auto_1263929 ?auto_1263928 ) ( ON ?auto_1263931 ?auto_1263929 ) ( ON ?auto_1263930 ?auto_1263931 ) ( ON ?auto_1263932 ?auto_1263930 ) ( not ( = ?auto_1263927 ?auto_1263928 ) ) ( not ( = ?auto_1263927 ?auto_1263929 ) ) ( not ( = ?auto_1263927 ?auto_1263931 ) ) ( not ( = ?auto_1263927 ?auto_1263930 ) ) ( not ( = ?auto_1263927 ?auto_1263932 ) ) ( not ( = ?auto_1263927 ?auto_1263933 ) ) ( not ( = ?auto_1263927 ?auto_1263934 ) ) ( not ( = ?auto_1263927 ?auto_1263935 ) ) ( not ( = ?auto_1263928 ?auto_1263929 ) ) ( not ( = ?auto_1263928 ?auto_1263931 ) ) ( not ( = ?auto_1263928 ?auto_1263930 ) ) ( not ( = ?auto_1263928 ?auto_1263932 ) ) ( not ( = ?auto_1263928 ?auto_1263933 ) ) ( not ( = ?auto_1263928 ?auto_1263934 ) ) ( not ( = ?auto_1263928 ?auto_1263935 ) ) ( not ( = ?auto_1263929 ?auto_1263931 ) ) ( not ( = ?auto_1263929 ?auto_1263930 ) ) ( not ( = ?auto_1263929 ?auto_1263932 ) ) ( not ( = ?auto_1263929 ?auto_1263933 ) ) ( not ( = ?auto_1263929 ?auto_1263934 ) ) ( not ( = ?auto_1263929 ?auto_1263935 ) ) ( not ( = ?auto_1263931 ?auto_1263930 ) ) ( not ( = ?auto_1263931 ?auto_1263932 ) ) ( not ( = ?auto_1263931 ?auto_1263933 ) ) ( not ( = ?auto_1263931 ?auto_1263934 ) ) ( not ( = ?auto_1263931 ?auto_1263935 ) ) ( not ( = ?auto_1263930 ?auto_1263932 ) ) ( not ( = ?auto_1263930 ?auto_1263933 ) ) ( not ( = ?auto_1263930 ?auto_1263934 ) ) ( not ( = ?auto_1263930 ?auto_1263935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1263932 ?auto_1263933 ?auto_1263934 )
      ( MAKE-7CRATE-VERIFY ?auto_1263927 ?auto_1263928 ?auto_1263929 ?auto_1263931 ?auto_1263930 ?auto_1263932 ?auto_1263933 ?auto_1263934 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264005 - SURFACE
      ?auto_1264006 - SURFACE
      ?auto_1264007 - SURFACE
      ?auto_1264009 - SURFACE
      ?auto_1264008 - SURFACE
      ?auto_1264010 - SURFACE
      ?auto_1264011 - SURFACE
      ?auto_1264012 - SURFACE
    )
    :vars
    (
      ?auto_1264015 - HOIST
      ?auto_1264013 - PLACE
      ?auto_1264014 - PLACE
      ?auto_1264016 - HOIST
      ?auto_1264018 - SURFACE
      ?auto_1264017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264015 ?auto_1264013 ) ( IS-CRATE ?auto_1264012 ) ( not ( = ?auto_1264011 ?auto_1264012 ) ) ( not ( = ?auto_1264010 ?auto_1264011 ) ) ( not ( = ?auto_1264010 ?auto_1264012 ) ) ( not ( = ?auto_1264014 ?auto_1264013 ) ) ( HOIST-AT ?auto_1264016 ?auto_1264014 ) ( not ( = ?auto_1264015 ?auto_1264016 ) ) ( AVAILABLE ?auto_1264016 ) ( SURFACE-AT ?auto_1264012 ?auto_1264014 ) ( ON ?auto_1264012 ?auto_1264018 ) ( CLEAR ?auto_1264012 ) ( not ( = ?auto_1264011 ?auto_1264018 ) ) ( not ( = ?auto_1264012 ?auto_1264018 ) ) ( not ( = ?auto_1264010 ?auto_1264018 ) ) ( TRUCK-AT ?auto_1264017 ?auto_1264013 ) ( SURFACE-AT ?auto_1264010 ?auto_1264013 ) ( CLEAR ?auto_1264010 ) ( LIFTING ?auto_1264015 ?auto_1264011 ) ( IS-CRATE ?auto_1264011 ) ( ON ?auto_1264006 ?auto_1264005 ) ( ON ?auto_1264007 ?auto_1264006 ) ( ON ?auto_1264009 ?auto_1264007 ) ( ON ?auto_1264008 ?auto_1264009 ) ( ON ?auto_1264010 ?auto_1264008 ) ( not ( = ?auto_1264005 ?auto_1264006 ) ) ( not ( = ?auto_1264005 ?auto_1264007 ) ) ( not ( = ?auto_1264005 ?auto_1264009 ) ) ( not ( = ?auto_1264005 ?auto_1264008 ) ) ( not ( = ?auto_1264005 ?auto_1264010 ) ) ( not ( = ?auto_1264005 ?auto_1264011 ) ) ( not ( = ?auto_1264005 ?auto_1264012 ) ) ( not ( = ?auto_1264005 ?auto_1264018 ) ) ( not ( = ?auto_1264006 ?auto_1264007 ) ) ( not ( = ?auto_1264006 ?auto_1264009 ) ) ( not ( = ?auto_1264006 ?auto_1264008 ) ) ( not ( = ?auto_1264006 ?auto_1264010 ) ) ( not ( = ?auto_1264006 ?auto_1264011 ) ) ( not ( = ?auto_1264006 ?auto_1264012 ) ) ( not ( = ?auto_1264006 ?auto_1264018 ) ) ( not ( = ?auto_1264007 ?auto_1264009 ) ) ( not ( = ?auto_1264007 ?auto_1264008 ) ) ( not ( = ?auto_1264007 ?auto_1264010 ) ) ( not ( = ?auto_1264007 ?auto_1264011 ) ) ( not ( = ?auto_1264007 ?auto_1264012 ) ) ( not ( = ?auto_1264007 ?auto_1264018 ) ) ( not ( = ?auto_1264009 ?auto_1264008 ) ) ( not ( = ?auto_1264009 ?auto_1264010 ) ) ( not ( = ?auto_1264009 ?auto_1264011 ) ) ( not ( = ?auto_1264009 ?auto_1264012 ) ) ( not ( = ?auto_1264009 ?auto_1264018 ) ) ( not ( = ?auto_1264008 ?auto_1264010 ) ) ( not ( = ?auto_1264008 ?auto_1264011 ) ) ( not ( = ?auto_1264008 ?auto_1264012 ) ) ( not ( = ?auto_1264008 ?auto_1264018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1264010 ?auto_1264011 ?auto_1264012 )
      ( MAKE-7CRATE-VERIFY ?auto_1264005 ?auto_1264006 ?auto_1264007 ?auto_1264009 ?auto_1264008 ?auto_1264010 ?auto_1264011 ?auto_1264012 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1264083 - SURFACE
      ?auto_1264084 - SURFACE
      ?auto_1264085 - SURFACE
      ?auto_1264087 - SURFACE
      ?auto_1264086 - SURFACE
      ?auto_1264088 - SURFACE
      ?auto_1264089 - SURFACE
      ?auto_1264090 - SURFACE
    )
    :vars
    (
      ?auto_1264092 - HOIST
      ?auto_1264094 - PLACE
      ?auto_1264091 - PLACE
      ?auto_1264095 - HOIST
      ?auto_1264093 - SURFACE
      ?auto_1264096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1264092 ?auto_1264094 ) ( IS-CRATE ?auto_1264090 ) ( not ( = ?auto_1264089 ?auto_1264090 ) ) ( not ( = ?auto_1264088 ?auto_1264089 ) ) ( not ( = ?auto_1264088 ?auto_1264090 ) ) ( not ( = ?auto_1264091 ?auto_1264094 ) ) ( HOIST-AT ?auto_1264095 ?auto_1264091 ) ( not ( = ?auto_1264092 ?auto_1264095 ) ) ( AVAILABLE ?auto_1264095 ) ( SURFACE-AT ?auto_1264090 ?auto_1264091 ) ( ON ?auto_1264090 ?auto_1264093 ) ( CLEAR ?auto_1264090 ) ( not ( = ?auto_1264089 ?auto_1264093 ) ) ( not ( = ?auto_1264090 ?auto_1264093 ) ) ( not ( = ?auto_1264088 ?auto_1264093 ) ) ( TRUCK-AT ?auto_1264096 ?auto_1264094 ) ( SURFACE-AT ?auto_1264088 ?auto_1264094 ) ( CLEAR ?auto_1264088 ) ( IS-CRATE ?auto_1264089 ) ( AVAILABLE ?auto_1264092 ) ( IN ?auto_1264089 ?auto_1264096 ) ( ON ?auto_1264084 ?auto_1264083 ) ( ON ?auto_1264085 ?auto_1264084 ) ( ON ?auto_1264087 ?auto_1264085 ) ( ON ?auto_1264086 ?auto_1264087 ) ( ON ?auto_1264088 ?auto_1264086 ) ( not ( = ?auto_1264083 ?auto_1264084 ) ) ( not ( = ?auto_1264083 ?auto_1264085 ) ) ( not ( = ?auto_1264083 ?auto_1264087 ) ) ( not ( = ?auto_1264083 ?auto_1264086 ) ) ( not ( = ?auto_1264083 ?auto_1264088 ) ) ( not ( = ?auto_1264083 ?auto_1264089 ) ) ( not ( = ?auto_1264083 ?auto_1264090 ) ) ( not ( = ?auto_1264083 ?auto_1264093 ) ) ( not ( = ?auto_1264084 ?auto_1264085 ) ) ( not ( = ?auto_1264084 ?auto_1264087 ) ) ( not ( = ?auto_1264084 ?auto_1264086 ) ) ( not ( = ?auto_1264084 ?auto_1264088 ) ) ( not ( = ?auto_1264084 ?auto_1264089 ) ) ( not ( = ?auto_1264084 ?auto_1264090 ) ) ( not ( = ?auto_1264084 ?auto_1264093 ) ) ( not ( = ?auto_1264085 ?auto_1264087 ) ) ( not ( = ?auto_1264085 ?auto_1264086 ) ) ( not ( = ?auto_1264085 ?auto_1264088 ) ) ( not ( = ?auto_1264085 ?auto_1264089 ) ) ( not ( = ?auto_1264085 ?auto_1264090 ) ) ( not ( = ?auto_1264085 ?auto_1264093 ) ) ( not ( = ?auto_1264087 ?auto_1264086 ) ) ( not ( = ?auto_1264087 ?auto_1264088 ) ) ( not ( = ?auto_1264087 ?auto_1264089 ) ) ( not ( = ?auto_1264087 ?auto_1264090 ) ) ( not ( = ?auto_1264087 ?auto_1264093 ) ) ( not ( = ?auto_1264086 ?auto_1264088 ) ) ( not ( = ?auto_1264086 ?auto_1264089 ) ) ( not ( = ?auto_1264086 ?auto_1264090 ) ) ( not ( = ?auto_1264086 ?auto_1264093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1264088 ?auto_1264089 ?auto_1264090 )
      ( MAKE-7CRATE-VERIFY ?auto_1264083 ?auto_1264084 ?auto_1264085 ?auto_1264087 ?auto_1264086 ?auto_1264088 ?auto_1264089 ?auto_1264090 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1267002 - SURFACE
      ?auto_1267003 - SURFACE
      ?auto_1267004 - SURFACE
      ?auto_1267006 - SURFACE
      ?auto_1267005 - SURFACE
      ?auto_1267007 - SURFACE
      ?auto_1267008 - SURFACE
      ?auto_1267009 - SURFACE
      ?auto_1267010 - SURFACE
    )
    :vars
    (
      ?auto_1267012 - HOIST
      ?auto_1267011 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267012 ?auto_1267011 ) ( SURFACE-AT ?auto_1267009 ?auto_1267011 ) ( CLEAR ?auto_1267009 ) ( LIFTING ?auto_1267012 ?auto_1267010 ) ( IS-CRATE ?auto_1267010 ) ( not ( = ?auto_1267009 ?auto_1267010 ) ) ( ON ?auto_1267003 ?auto_1267002 ) ( ON ?auto_1267004 ?auto_1267003 ) ( ON ?auto_1267006 ?auto_1267004 ) ( ON ?auto_1267005 ?auto_1267006 ) ( ON ?auto_1267007 ?auto_1267005 ) ( ON ?auto_1267008 ?auto_1267007 ) ( ON ?auto_1267009 ?auto_1267008 ) ( not ( = ?auto_1267002 ?auto_1267003 ) ) ( not ( = ?auto_1267002 ?auto_1267004 ) ) ( not ( = ?auto_1267002 ?auto_1267006 ) ) ( not ( = ?auto_1267002 ?auto_1267005 ) ) ( not ( = ?auto_1267002 ?auto_1267007 ) ) ( not ( = ?auto_1267002 ?auto_1267008 ) ) ( not ( = ?auto_1267002 ?auto_1267009 ) ) ( not ( = ?auto_1267002 ?auto_1267010 ) ) ( not ( = ?auto_1267003 ?auto_1267004 ) ) ( not ( = ?auto_1267003 ?auto_1267006 ) ) ( not ( = ?auto_1267003 ?auto_1267005 ) ) ( not ( = ?auto_1267003 ?auto_1267007 ) ) ( not ( = ?auto_1267003 ?auto_1267008 ) ) ( not ( = ?auto_1267003 ?auto_1267009 ) ) ( not ( = ?auto_1267003 ?auto_1267010 ) ) ( not ( = ?auto_1267004 ?auto_1267006 ) ) ( not ( = ?auto_1267004 ?auto_1267005 ) ) ( not ( = ?auto_1267004 ?auto_1267007 ) ) ( not ( = ?auto_1267004 ?auto_1267008 ) ) ( not ( = ?auto_1267004 ?auto_1267009 ) ) ( not ( = ?auto_1267004 ?auto_1267010 ) ) ( not ( = ?auto_1267006 ?auto_1267005 ) ) ( not ( = ?auto_1267006 ?auto_1267007 ) ) ( not ( = ?auto_1267006 ?auto_1267008 ) ) ( not ( = ?auto_1267006 ?auto_1267009 ) ) ( not ( = ?auto_1267006 ?auto_1267010 ) ) ( not ( = ?auto_1267005 ?auto_1267007 ) ) ( not ( = ?auto_1267005 ?auto_1267008 ) ) ( not ( = ?auto_1267005 ?auto_1267009 ) ) ( not ( = ?auto_1267005 ?auto_1267010 ) ) ( not ( = ?auto_1267007 ?auto_1267008 ) ) ( not ( = ?auto_1267007 ?auto_1267009 ) ) ( not ( = ?auto_1267007 ?auto_1267010 ) ) ( not ( = ?auto_1267008 ?auto_1267009 ) ) ( not ( = ?auto_1267008 ?auto_1267010 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1267009 ?auto_1267010 )
      ( MAKE-8CRATE-VERIFY ?auto_1267002 ?auto_1267003 ?auto_1267004 ?auto_1267006 ?auto_1267005 ?auto_1267007 ?auto_1267008 ?auto_1267009 ?auto_1267010 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1267069 - SURFACE
      ?auto_1267070 - SURFACE
      ?auto_1267071 - SURFACE
      ?auto_1267073 - SURFACE
      ?auto_1267072 - SURFACE
      ?auto_1267074 - SURFACE
      ?auto_1267075 - SURFACE
      ?auto_1267076 - SURFACE
      ?auto_1267077 - SURFACE
    )
    :vars
    (
      ?auto_1267080 - HOIST
      ?auto_1267079 - PLACE
      ?auto_1267078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267080 ?auto_1267079 ) ( SURFACE-AT ?auto_1267076 ?auto_1267079 ) ( CLEAR ?auto_1267076 ) ( IS-CRATE ?auto_1267077 ) ( not ( = ?auto_1267076 ?auto_1267077 ) ) ( TRUCK-AT ?auto_1267078 ?auto_1267079 ) ( AVAILABLE ?auto_1267080 ) ( IN ?auto_1267077 ?auto_1267078 ) ( ON ?auto_1267076 ?auto_1267075 ) ( not ( = ?auto_1267075 ?auto_1267076 ) ) ( not ( = ?auto_1267075 ?auto_1267077 ) ) ( ON ?auto_1267070 ?auto_1267069 ) ( ON ?auto_1267071 ?auto_1267070 ) ( ON ?auto_1267073 ?auto_1267071 ) ( ON ?auto_1267072 ?auto_1267073 ) ( ON ?auto_1267074 ?auto_1267072 ) ( ON ?auto_1267075 ?auto_1267074 ) ( not ( = ?auto_1267069 ?auto_1267070 ) ) ( not ( = ?auto_1267069 ?auto_1267071 ) ) ( not ( = ?auto_1267069 ?auto_1267073 ) ) ( not ( = ?auto_1267069 ?auto_1267072 ) ) ( not ( = ?auto_1267069 ?auto_1267074 ) ) ( not ( = ?auto_1267069 ?auto_1267075 ) ) ( not ( = ?auto_1267069 ?auto_1267076 ) ) ( not ( = ?auto_1267069 ?auto_1267077 ) ) ( not ( = ?auto_1267070 ?auto_1267071 ) ) ( not ( = ?auto_1267070 ?auto_1267073 ) ) ( not ( = ?auto_1267070 ?auto_1267072 ) ) ( not ( = ?auto_1267070 ?auto_1267074 ) ) ( not ( = ?auto_1267070 ?auto_1267075 ) ) ( not ( = ?auto_1267070 ?auto_1267076 ) ) ( not ( = ?auto_1267070 ?auto_1267077 ) ) ( not ( = ?auto_1267071 ?auto_1267073 ) ) ( not ( = ?auto_1267071 ?auto_1267072 ) ) ( not ( = ?auto_1267071 ?auto_1267074 ) ) ( not ( = ?auto_1267071 ?auto_1267075 ) ) ( not ( = ?auto_1267071 ?auto_1267076 ) ) ( not ( = ?auto_1267071 ?auto_1267077 ) ) ( not ( = ?auto_1267073 ?auto_1267072 ) ) ( not ( = ?auto_1267073 ?auto_1267074 ) ) ( not ( = ?auto_1267073 ?auto_1267075 ) ) ( not ( = ?auto_1267073 ?auto_1267076 ) ) ( not ( = ?auto_1267073 ?auto_1267077 ) ) ( not ( = ?auto_1267072 ?auto_1267074 ) ) ( not ( = ?auto_1267072 ?auto_1267075 ) ) ( not ( = ?auto_1267072 ?auto_1267076 ) ) ( not ( = ?auto_1267072 ?auto_1267077 ) ) ( not ( = ?auto_1267074 ?auto_1267075 ) ) ( not ( = ?auto_1267074 ?auto_1267076 ) ) ( not ( = ?auto_1267074 ?auto_1267077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1267075 ?auto_1267076 ?auto_1267077 )
      ( MAKE-8CRATE-VERIFY ?auto_1267069 ?auto_1267070 ?auto_1267071 ?auto_1267073 ?auto_1267072 ?auto_1267074 ?auto_1267075 ?auto_1267076 ?auto_1267077 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1267145 - SURFACE
      ?auto_1267146 - SURFACE
      ?auto_1267147 - SURFACE
      ?auto_1267149 - SURFACE
      ?auto_1267148 - SURFACE
      ?auto_1267150 - SURFACE
      ?auto_1267151 - SURFACE
      ?auto_1267152 - SURFACE
      ?auto_1267153 - SURFACE
    )
    :vars
    (
      ?auto_1267155 - HOIST
      ?auto_1267156 - PLACE
      ?auto_1267157 - TRUCK
      ?auto_1267154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267155 ?auto_1267156 ) ( SURFACE-AT ?auto_1267152 ?auto_1267156 ) ( CLEAR ?auto_1267152 ) ( IS-CRATE ?auto_1267153 ) ( not ( = ?auto_1267152 ?auto_1267153 ) ) ( AVAILABLE ?auto_1267155 ) ( IN ?auto_1267153 ?auto_1267157 ) ( ON ?auto_1267152 ?auto_1267151 ) ( not ( = ?auto_1267151 ?auto_1267152 ) ) ( not ( = ?auto_1267151 ?auto_1267153 ) ) ( TRUCK-AT ?auto_1267157 ?auto_1267154 ) ( not ( = ?auto_1267154 ?auto_1267156 ) ) ( ON ?auto_1267146 ?auto_1267145 ) ( ON ?auto_1267147 ?auto_1267146 ) ( ON ?auto_1267149 ?auto_1267147 ) ( ON ?auto_1267148 ?auto_1267149 ) ( ON ?auto_1267150 ?auto_1267148 ) ( ON ?auto_1267151 ?auto_1267150 ) ( not ( = ?auto_1267145 ?auto_1267146 ) ) ( not ( = ?auto_1267145 ?auto_1267147 ) ) ( not ( = ?auto_1267145 ?auto_1267149 ) ) ( not ( = ?auto_1267145 ?auto_1267148 ) ) ( not ( = ?auto_1267145 ?auto_1267150 ) ) ( not ( = ?auto_1267145 ?auto_1267151 ) ) ( not ( = ?auto_1267145 ?auto_1267152 ) ) ( not ( = ?auto_1267145 ?auto_1267153 ) ) ( not ( = ?auto_1267146 ?auto_1267147 ) ) ( not ( = ?auto_1267146 ?auto_1267149 ) ) ( not ( = ?auto_1267146 ?auto_1267148 ) ) ( not ( = ?auto_1267146 ?auto_1267150 ) ) ( not ( = ?auto_1267146 ?auto_1267151 ) ) ( not ( = ?auto_1267146 ?auto_1267152 ) ) ( not ( = ?auto_1267146 ?auto_1267153 ) ) ( not ( = ?auto_1267147 ?auto_1267149 ) ) ( not ( = ?auto_1267147 ?auto_1267148 ) ) ( not ( = ?auto_1267147 ?auto_1267150 ) ) ( not ( = ?auto_1267147 ?auto_1267151 ) ) ( not ( = ?auto_1267147 ?auto_1267152 ) ) ( not ( = ?auto_1267147 ?auto_1267153 ) ) ( not ( = ?auto_1267149 ?auto_1267148 ) ) ( not ( = ?auto_1267149 ?auto_1267150 ) ) ( not ( = ?auto_1267149 ?auto_1267151 ) ) ( not ( = ?auto_1267149 ?auto_1267152 ) ) ( not ( = ?auto_1267149 ?auto_1267153 ) ) ( not ( = ?auto_1267148 ?auto_1267150 ) ) ( not ( = ?auto_1267148 ?auto_1267151 ) ) ( not ( = ?auto_1267148 ?auto_1267152 ) ) ( not ( = ?auto_1267148 ?auto_1267153 ) ) ( not ( = ?auto_1267150 ?auto_1267151 ) ) ( not ( = ?auto_1267150 ?auto_1267152 ) ) ( not ( = ?auto_1267150 ?auto_1267153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1267151 ?auto_1267152 ?auto_1267153 )
      ( MAKE-8CRATE-VERIFY ?auto_1267145 ?auto_1267146 ?auto_1267147 ?auto_1267149 ?auto_1267148 ?auto_1267150 ?auto_1267151 ?auto_1267152 ?auto_1267153 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1267229 - SURFACE
      ?auto_1267230 - SURFACE
      ?auto_1267231 - SURFACE
      ?auto_1267233 - SURFACE
      ?auto_1267232 - SURFACE
      ?auto_1267234 - SURFACE
      ?auto_1267235 - SURFACE
      ?auto_1267236 - SURFACE
      ?auto_1267237 - SURFACE
    )
    :vars
    (
      ?auto_1267240 - HOIST
      ?auto_1267241 - PLACE
      ?auto_1267242 - TRUCK
      ?auto_1267238 - PLACE
      ?auto_1267239 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267240 ?auto_1267241 ) ( SURFACE-AT ?auto_1267236 ?auto_1267241 ) ( CLEAR ?auto_1267236 ) ( IS-CRATE ?auto_1267237 ) ( not ( = ?auto_1267236 ?auto_1267237 ) ) ( AVAILABLE ?auto_1267240 ) ( ON ?auto_1267236 ?auto_1267235 ) ( not ( = ?auto_1267235 ?auto_1267236 ) ) ( not ( = ?auto_1267235 ?auto_1267237 ) ) ( TRUCK-AT ?auto_1267242 ?auto_1267238 ) ( not ( = ?auto_1267238 ?auto_1267241 ) ) ( HOIST-AT ?auto_1267239 ?auto_1267238 ) ( LIFTING ?auto_1267239 ?auto_1267237 ) ( not ( = ?auto_1267240 ?auto_1267239 ) ) ( ON ?auto_1267230 ?auto_1267229 ) ( ON ?auto_1267231 ?auto_1267230 ) ( ON ?auto_1267233 ?auto_1267231 ) ( ON ?auto_1267232 ?auto_1267233 ) ( ON ?auto_1267234 ?auto_1267232 ) ( ON ?auto_1267235 ?auto_1267234 ) ( not ( = ?auto_1267229 ?auto_1267230 ) ) ( not ( = ?auto_1267229 ?auto_1267231 ) ) ( not ( = ?auto_1267229 ?auto_1267233 ) ) ( not ( = ?auto_1267229 ?auto_1267232 ) ) ( not ( = ?auto_1267229 ?auto_1267234 ) ) ( not ( = ?auto_1267229 ?auto_1267235 ) ) ( not ( = ?auto_1267229 ?auto_1267236 ) ) ( not ( = ?auto_1267229 ?auto_1267237 ) ) ( not ( = ?auto_1267230 ?auto_1267231 ) ) ( not ( = ?auto_1267230 ?auto_1267233 ) ) ( not ( = ?auto_1267230 ?auto_1267232 ) ) ( not ( = ?auto_1267230 ?auto_1267234 ) ) ( not ( = ?auto_1267230 ?auto_1267235 ) ) ( not ( = ?auto_1267230 ?auto_1267236 ) ) ( not ( = ?auto_1267230 ?auto_1267237 ) ) ( not ( = ?auto_1267231 ?auto_1267233 ) ) ( not ( = ?auto_1267231 ?auto_1267232 ) ) ( not ( = ?auto_1267231 ?auto_1267234 ) ) ( not ( = ?auto_1267231 ?auto_1267235 ) ) ( not ( = ?auto_1267231 ?auto_1267236 ) ) ( not ( = ?auto_1267231 ?auto_1267237 ) ) ( not ( = ?auto_1267233 ?auto_1267232 ) ) ( not ( = ?auto_1267233 ?auto_1267234 ) ) ( not ( = ?auto_1267233 ?auto_1267235 ) ) ( not ( = ?auto_1267233 ?auto_1267236 ) ) ( not ( = ?auto_1267233 ?auto_1267237 ) ) ( not ( = ?auto_1267232 ?auto_1267234 ) ) ( not ( = ?auto_1267232 ?auto_1267235 ) ) ( not ( = ?auto_1267232 ?auto_1267236 ) ) ( not ( = ?auto_1267232 ?auto_1267237 ) ) ( not ( = ?auto_1267234 ?auto_1267235 ) ) ( not ( = ?auto_1267234 ?auto_1267236 ) ) ( not ( = ?auto_1267234 ?auto_1267237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1267235 ?auto_1267236 ?auto_1267237 )
      ( MAKE-8CRATE-VERIFY ?auto_1267229 ?auto_1267230 ?auto_1267231 ?auto_1267233 ?auto_1267232 ?auto_1267234 ?auto_1267235 ?auto_1267236 ?auto_1267237 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1267321 - SURFACE
      ?auto_1267322 - SURFACE
      ?auto_1267323 - SURFACE
      ?auto_1267325 - SURFACE
      ?auto_1267324 - SURFACE
      ?auto_1267326 - SURFACE
      ?auto_1267327 - SURFACE
      ?auto_1267328 - SURFACE
      ?auto_1267329 - SURFACE
    )
    :vars
    (
      ?auto_1267335 - HOIST
      ?auto_1267330 - PLACE
      ?auto_1267332 - TRUCK
      ?auto_1267331 - PLACE
      ?auto_1267334 - HOIST
      ?auto_1267333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267335 ?auto_1267330 ) ( SURFACE-AT ?auto_1267328 ?auto_1267330 ) ( CLEAR ?auto_1267328 ) ( IS-CRATE ?auto_1267329 ) ( not ( = ?auto_1267328 ?auto_1267329 ) ) ( AVAILABLE ?auto_1267335 ) ( ON ?auto_1267328 ?auto_1267327 ) ( not ( = ?auto_1267327 ?auto_1267328 ) ) ( not ( = ?auto_1267327 ?auto_1267329 ) ) ( TRUCK-AT ?auto_1267332 ?auto_1267331 ) ( not ( = ?auto_1267331 ?auto_1267330 ) ) ( HOIST-AT ?auto_1267334 ?auto_1267331 ) ( not ( = ?auto_1267335 ?auto_1267334 ) ) ( AVAILABLE ?auto_1267334 ) ( SURFACE-AT ?auto_1267329 ?auto_1267331 ) ( ON ?auto_1267329 ?auto_1267333 ) ( CLEAR ?auto_1267329 ) ( not ( = ?auto_1267328 ?auto_1267333 ) ) ( not ( = ?auto_1267329 ?auto_1267333 ) ) ( not ( = ?auto_1267327 ?auto_1267333 ) ) ( ON ?auto_1267322 ?auto_1267321 ) ( ON ?auto_1267323 ?auto_1267322 ) ( ON ?auto_1267325 ?auto_1267323 ) ( ON ?auto_1267324 ?auto_1267325 ) ( ON ?auto_1267326 ?auto_1267324 ) ( ON ?auto_1267327 ?auto_1267326 ) ( not ( = ?auto_1267321 ?auto_1267322 ) ) ( not ( = ?auto_1267321 ?auto_1267323 ) ) ( not ( = ?auto_1267321 ?auto_1267325 ) ) ( not ( = ?auto_1267321 ?auto_1267324 ) ) ( not ( = ?auto_1267321 ?auto_1267326 ) ) ( not ( = ?auto_1267321 ?auto_1267327 ) ) ( not ( = ?auto_1267321 ?auto_1267328 ) ) ( not ( = ?auto_1267321 ?auto_1267329 ) ) ( not ( = ?auto_1267321 ?auto_1267333 ) ) ( not ( = ?auto_1267322 ?auto_1267323 ) ) ( not ( = ?auto_1267322 ?auto_1267325 ) ) ( not ( = ?auto_1267322 ?auto_1267324 ) ) ( not ( = ?auto_1267322 ?auto_1267326 ) ) ( not ( = ?auto_1267322 ?auto_1267327 ) ) ( not ( = ?auto_1267322 ?auto_1267328 ) ) ( not ( = ?auto_1267322 ?auto_1267329 ) ) ( not ( = ?auto_1267322 ?auto_1267333 ) ) ( not ( = ?auto_1267323 ?auto_1267325 ) ) ( not ( = ?auto_1267323 ?auto_1267324 ) ) ( not ( = ?auto_1267323 ?auto_1267326 ) ) ( not ( = ?auto_1267323 ?auto_1267327 ) ) ( not ( = ?auto_1267323 ?auto_1267328 ) ) ( not ( = ?auto_1267323 ?auto_1267329 ) ) ( not ( = ?auto_1267323 ?auto_1267333 ) ) ( not ( = ?auto_1267325 ?auto_1267324 ) ) ( not ( = ?auto_1267325 ?auto_1267326 ) ) ( not ( = ?auto_1267325 ?auto_1267327 ) ) ( not ( = ?auto_1267325 ?auto_1267328 ) ) ( not ( = ?auto_1267325 ?auto_1267329 ) ) ( not ( = ?auto_1267325 ?auto_1267333 ) ) ( not ( = ?auto_1267324 ?auto_1267326 ) ) ( not ( = ?auto_1267324 ?auto_1267327 ) ) ( not ( = ?auto_1267324 ?auto_1267328 ) ) ( not ( = ?auto_1267324 ?auto_1267329 ) ) ( not ( = ?auto_1267324 ?auto_1267333 ) ) ( not ( = ?auto_1267326 ?auto_1267327 ) ) ( not ( = ?auto_1267326 ?auto_1267328 ) ) ( not ( = ?auto_1267326 ?auto_1267329 ) ) ( not ( = ?auto_1267326 ?auto_1267333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1267327 ?auto_1267328 ?auto_1267329 )
      ( MAKE-8CRATE-VERIFY ?auto_1267321 ?auto_1267322 ?auto_1267323 ?auto_1267325 ?auto_1267324 ?auto_1267326 ?auto_1267327 ?auto_1267328 ?auto_1267329 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1267414 - SURFACE
      ?auto_1267415 - SURFACE
      ?auto_1267416 - SURFACE
      ?auto_1267418 - SURFACE
      ?auto_1267417 - SURFACE
      ?auto_1267419 - SURFACE
      ?auto_1267420 - SURFACE
      ?auto_1267421 - SURFACE
      ?auto_1267422 - SURFACE
    )
    :vars
    (
      ?auto_1267428 - HOIST
      ?auto_1267423 - PLACE
      ?auto_1267424 - PLACE
      ?auto_1267425 - HOIST
      ?auto_1267427 - SURFACE
      ?auto_1267426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267428 ?auto_1267423 ) ( SURFACE-AT ?auto_1267421 ?auto_1267423 ) ( CLEAR ?auto_1267421 ) ( IS-CRATE ?auto_1267422 ) ( not ( = ?auto_1267421 ?auto_1267422 ) ) ( AVAILABLE ?auto_1267428 ) ( ON ?auto_1267421 ?auto_1267420 ) ( not ( = ?auto_1267420 ?auto_1267421 ) ) ( not ( = ?auto_1267420 ?auto_1267422 ) ) ( not ( = ?auto_1267424 ?auto_1267423 ) ) ( HOIST-AT ?auto_1267425 ?auto_1267424 ) ( not ( = ?auto_1267428 ?auto_1267425 ) ) ( AVAILABLE ?auto_1267425 ) ( SURFACE-AT ?auto_1267422 ?auto_1267424 ) ( ON ?auto_1267422 ?auto_1267427 ) ( CLEAR ?auto_1267422 ) ( not ( = ?auto_1267421 ?auto_1267427 ) ) ( not ( = ?auto_1267422 ?auto_1267427 ) ) ( not ( = ?auto_1267420 ?auto_1267427 ) ) ( TRUCK-AT ?auto_1267426 ?auto_1267423 ) ( ON ?auto_1267415 ?auto_1267414 ) ( ON ?auto_1267416 ?auto_1267415 ) ( ON ?auto_1267418 ?auto_1267416 ) ( ON ?auto_1267417 ?auto_1267418 ) ( ON ?auto_1267419 ?auto_1267417 ) ( ON ?auto_1267420 ?auto_1267419 ) ( not ( = ?auto_1267414 ?auto_1267415 ) ) ( not ( = ?auto_1267414 ?auto_1267416 ) ) ( not ( = ?auto_1267414 ?auto_1267418 ) ) ( not ( = ?auto_1267414 ?auto_1267417 ) ) ( not ( = ?auto_1267414 ?auto_1267419 ) ) ( not ( = ?auto_1267414 ?auto_1267420 ) ) ( not ( = ?auto_1267414 ?auto_1267421 ) ) ( not ( = ?auto_1267414 ?auto_1267422 ) ) ( not ( = ?auto_1267414 ?auto_1267427 ) ) ( not ( = ?auto_1267415 ?auto_1267416 ) ) ( not ( = ?auto_1267415 ?auto_1267418 ) ) ( not ( = ?auto_1267415 ?auto_1267417 ) ) ( not ( = ?auto_1267415 ?auto_1267419 ) ) ( not ( = ?auto_1267415 ?auto_1267420 ) ) ( not ( = ?auto_1267415 ?auto_1267421 ) ) ( not ( = ?auto_1267415 ?auto_1267422 ) ) ( not ( = ?auto_1267415 ?auto_1267427 ) ) ( not ( = ?auto_1267416 ?auto_1267418 ) ) ( not ( = ?auto_1267416 ?auto_1267417 ) ) ( not ( = ?auto_1267416 ?auto_1267419 ) ) ( not ( = ?auto_1267416 ?auto_1267420 ) ) ( not ( = ?auto_1267416 ?auto_1267421 ) ) ( not ( = ?auto_1267416 ?auto_1267422 ) ) ( not ( = ?auto_1267416 ?auto_1267427 ) ) ( not ( = ?auto_1267418 ?auto_1267417 ) ) ( not ( = ?auto_1267418 ?auto_1267419 ) ) ( not ( = ?auto_1267418 ?auto_1267420 ) ) ( not ( = ?auto_1267418 ?auto_1267421 ) ) ( not ( = ?auto_1267418 ?auto_1267422 ) ) ( not ( = ?auto_1267418 ?auto_1267427 ) ) ( not ( = ?auto_1267417 ?auto_1267419 ) ) ( not ( = ?auto_1267417 ?auto_1267420 ) ) ( not ( = ?auto_1267417 ?auto_1267421 ) ) ( not ( = ?auto_1267417 ?auto_1267422 ) ) ( not ( = ?auto_1267417 ?auto_1267427 ) ) ( not ( = ?auto_1267419 ?auto_1267420 ) ) ( not ( = ?auto_1267419 ?auto_1267421 ) ) ( not ( = ?auto_1267419 ?auto_1267422 ) ) ( not ( = ?auto_1267419 ?auto_1267427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1267420 ?auto_1267421 ?auto_1267422 )
      ( MAKE-8CRATE-VERIFY ?auto_1267414 ?auto_1267415 ?auto_1267416 ?auto_1267418 ?auto_1267417 ?auto_1267419 ?auto_1267420 ?auto_1267421 ?auto_1267422 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1267507 - SURFACE
      ?auto_1267508 - SURFACE
      ?auto_1267509 - SURFACE
      ?auto_1267511 - SURFACE
      ?auto_1267510 - SURFACE
      ?auto_1267512 - SURFACE
      ?auto_1267513 - SURFACE
      ?auto_1267514 - SURFACE
      ?auto_1267515 - SURFACE
    )
    :vars
    (
      ?auto_1267518 - HOIST
      ?auto_1267519 - PLACE
      ?auto_1267520 - PLACE
      ?auto_1267521 - HOIST
      ?auto_1267517 - SURFACE
      ?auto_1267516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267518 ?auto_1267519 ) ( IS-CRATE ?auto_1267515 ) ( not ( = ?auto_1267514 ?auto_1267515 ) ) ( not ( = ?auto_1267513 ?auto_1267514 ) ) ( not ( = ?auto_1267513 ?auto_1267515 ) ) ( not ( = ?auto_1267520 ?auto_1267519 ) ) ( HOIST-AT ?auto_1267521 ?auto_1267520 ) ( not ( = ?auto_1267518 ?auto_1267521 ) ) ( AVAILABLE ?auto_1267521 ) ( SURFACE-AT ?auto_1267515 ?auto_1267520 ) ( ON ?auto_1267515 ?auto_1267517 ) ( CLEAR ?auto_1267515 ) ( not ( = ?auto_1267514 ?auto_1267517 ) ) ( not ( = ?auto_1267515 ?auto_1267517 ) ) ( not ( = ?auto_1267513 ?auto_1267517 ) ) ( TRUCK-AT ?auto_1267516 ?auto_1267519 ) ( SURFACE-AT ?auto_1267513 ?auto_1267519 ) ( CLEAR ?auto_1267513 ) ( LIFTING ?auto_1267518 ?auto_1267514 ) ( IS-CRATE ?auto_1267514 ) ( ON ?auto_1267508 ?auto_1267507 ) ( ON ?auto_1267509 ?auto_1267508 ) ( ON ?auto_1267511 ?auto_1267509 ) ( ON ?auto_1267510 ?auto_1267511 ) ( ON ?auto_1267512 ?auto_1267510 ) ( ON ?auto_1267513 ?auto_1267512 ) ( not ( = ?auto_1267507 ?auto_1267508 ) ) ( not ( = ?auto_1267507 ?auto_1267509 ) ) ( not ( = ?auto_1267507 ?auto_1267511 ) ) ( not ( = ?auto_1267507 ?auto_1267510 ) ) ( not ( = ?auto_1267507 ?auto_1267512 ) ) ( not ( = ?auto_1267507 ?auto_1267513 ) ) ( not ( = ?auto_1267507 ?auto_1267514 ) ) ( not ( = ?auto_1267507 ?auto_1267515 ) ) ( not ( = ?auto_1267507 ?auto_1267517 ) ) ( not ( = ?auto_1267508 ?auto_1267509 ) ) ( not ( = ?auto_1267508 ?auto_1267511 ) ) ( not ( = ?auto_1267508 ?auto_1267510 ) ) ( not ( = ?auto_1267508 ?auto_1267512 ) ) ( not ( = ?auto_1267508 ?auto_1267513 ) ) ( not ( = ?auto_1267508 ?auto_1267514 ) ) ( not ( = ?auto_1267508 ?auto_1267515 ) ) ( not ( = ?auto_1267508 ?auto_1267517 ) ) ( not ( = ?auto_1267509 ?auto_1267511 ) ) ( not ( = ?auto_1267509 ?auto_1267510 ) ) ( not ( = ?auto_1267509 ?auto_1267512 ) ) ( not ( = ?auto_1267509 ?auto_1267513 ) ) ( not ( = ?auto_1267509 ?auto_1267514 ) ) ( not ( = ?auto_1267509 ?auto_1267515 ) ) ( not ( = ?auto_1267509 ?auto_1267517 ) ) ( not ( = ?auto_1267511 ?auto_1267510 ) ) ( not ( = ?auto_1267511 ?auto_1267512 ) ) ( not ( = ?auto_1267511 ?auto_1267513 ) ) ( not ( = ?auto_1267511 ?auto_1267514 ) ) ( not ( = ?auto_1267511 ?auto_1267515 ) ) ( not ( = ?auto_1267511 ?auto_1267517 ) ) ( not ( = ?auto_1267510 ?auto_1267512 ) ) ( not ( = ?auto_1267510 ?auto_1267513 ) ) ( not ( = ?auto_1267510 ?auto_1267514 ) ) ( not ( = ?auto_1267510 ?auto_1267515 ) ) ( not ( = ?auto_1267510 ?auto_1267517 ) ) ( not ( = ?auto_1267512 ?auto_1267513 ) ) ( not ( = ?auto_1267512 ?auto_1267514 ) ) ( not ( = ?auto_1267512 ?auto_1267515 ) ) ( not ( = ?auto_1267512 ?auto_1267517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1267513 ?auto_1267514 ?auto_1267515 )
      ( MAKE-8CRATE-VERIFY ?auto_1267507 ?auto_1267508 ?auto_1267509 ?auto_1267511 ?auto_1267510 ?auto_1267512 ?auto_1267513 ?auto_1267514 ?auto_1267515 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1267600 - SURFACE
      ?auto_1267601 - SURFACE
      ?auto_1267602 - SURFACE
      ?auto_1267604 - SURFACE
      ?auto_1267603 - SURFACE
      ?auto_1267605 - SURFACE
      ?auto_1267606 - SURFACE
      ?auto_1267607 - SURFACE
      ?auto_1267608 - SURFACE
    )
    :vars
    (
      ?auto_1267613 - HOIST
      ?auto_1267611 - PLACE
      ?auto_1267612 - PLACE
      ?auto_1267610 - HOIST
      ?auto_1267614 - SURFACE
      ?auto_1267609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267613 ?auto_1267611 ) ( IS-CRATE ?auto_1267608 ) ( not ( = ?auto_1267607 ?auto_1267608 ) ) ( not ( = ?auto_1267606 ?auto_1267607 ) ) ( not ( = ?auto_1267606 ?auto_1267608 ) ) ( not ( = ?auto_1267612 ?auto_1267611 ) ) ( HOIST-AT ?auto_1267610 ?auto_1267612 ) ( not ( = ?auto_1267613 ?auto_1267610 ) ) ( AVAILABLE ?auto_1267610 ) ( SURFACE-AT ?auto_1267608 ?auto_1267612 ) ( ON ?auto_1267608 ?auto_1267614 ) ( CLEAR ?auto_1267608 ) ( not ( = ?auto_1267607 ?auto_1267614 ) ) ( not ( = ?auto_1267608 ?auto_1267614 ) ) ( not ( = ?auto_1267606 ?auto_1267614 ) ) ( TRUCK-AT ?auto_1267609 ?auto_1267611 ) ( SURFACE-AT ?auto_1267606 ?auto_1267611 ) ( CLEAR ?auto_1267606 ) ( IS-CRATE ?auto_1267607 ) ( AVAILABLE ?auto_1267613 ) ( IN ?auto_1267607 ?auto_1267609 ) ( ON ?auto_1267601 ?auto_1267600 ) ( ON ?auto_1267602 ?auto_1267601 ) ( ON ?auto_1267604 ?auto_1267602 ) ( ON ?auto_1267603 ?auto_1267604 ) ( ON ?auto_1267605 ?auto_1267603 ) ( ON ?auto_1267606 ?auto_1267605 ) ( not ( = ?auto_1267600 ?auto_1267601 ) ) ( not ( = ?auto_1267600 ?auto_1267602 ) ) ( not ( = ?auto_1267600 ?auto_1267604 ) ) ( not ( = ?auto_1267600 ?auto_1267603 ) ) ( not ( = ?auto_1267600 ?auto_1267605 ) ) ( not ( = ?auto_1267600 ?auto_1267606 ) ) ( not ( = ?auto_1267600 ?auto_1267607 ) ) ( not ( = ?auto_1267600 ?auto_1267608 ) ) ( not ( = ?auto_1267600 ?auto_1267614 ) ) ( not ( = ?auto_1267601 ?auto_1267602 ) ) ( not ( = ?auto_1267601 ?auto_1267604 ) ) ( not ( = ?auto_1267601 ?auto_1267603 ) ) ( not ( = ?auto_1267601 ?auto_1267605 ) ) ( not ( = ?auto_1267601 ?auto_1267606 ) ) ( not ( = ?auto_1267601 ?auto_1267607 ) ) ( not ( = ?auto_1267601 ?auto_1267608 ) ) ( not ( = ?auto_1267601 ?auto_1267614 ) ) ( not ( = ?auto_1267602 ?auto_1267604 ) ) ( not ( = ?auto_1267602 ?auto_1267603 ) ) ( not ( = ?auto_1267602 ?auto_1267605 ) ) ( not ( = ?auto_1267602 ?auto_1267606 ) ) ( not ( = ?auto_1267602 ?auto_1267607 ) ) ( not ( = ?auto_1267602 ?auto_1267608 ) ) ( not ( = ?auto_1267602 ?auto_1267614 ) ) ( not ( = ?auto_1267604 ?auto_1267603 ) ) ( not ( = ?auto_1267604 ?auto_1267605 ) ) ( not ( = ?auto_1267604 ?auto_1267606 ) ) ( not ( = ?auto_1267604 ?auto_1267607 ) ) ( not ( = ?auto_1267604 ?auto_1267608 ) ) ( not ( = ?auto_1267604 ?auto_1267614 ) ) ( not ( = ?auto_1267603 ?auto_1267605 ) ) ( not ( = ?auto_1267603 ?auto_1267606 ) ) ( not ( = ?auto_1267603 ?auto_1267607 ) ) ( not ( = ?auto_1267603 ?auto_1267608 ) ) ( not ( = ?auto_1267603 ?auto_1267614 ) ) ( not ( = ?auto_1267605 ?auto_1267606 ) ) ( not ( = ?auto_1267605 ?auto_1267607 ) ) ( not ( = ?auto_1267605 ?auto_1267608 ) ) ( not ( = ?auto_1267605 ?auto_1267614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1267606 ?auto_1267607 ?auto_1267608 )
      ( MAKE-8CRATE-VERIFY ?auto_1267600 ?auto_1267601 ?auto_1267602 ?auto_1267604 ?auto_1267603 ?auto_1267605 ?auto_1267606 ?auto_1267607 ?auto_1267608 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1271716 - SURFACE
      ?auto_1271717 - SURFACE
      ?auto_1271718 - SURFACE
      ?auto_1271720 - SURFACE
      ?auto_1271719 - SURFACE
      ?auto_1271721 - SURFACE
      ?auto_1271722 - SURFACE
      ?auto_1271723 - SURFACE
      ?auto_1271724 - SURFACE
      ?auto_1271725 - SURFACE
    )
    :vars
    (
      ?auto_1271726 - HOIST
      ?auto_1271727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1271726 ?auto_1271727 ) ( SURFACE-AT ?auto_1271724 ?auto_1271727 ) ( CLEAR ?auto_1271724 ) ( LIFTING ?auto_1271726 ?auto_1271725 ) ( IS-CRATE ?auto_1271725 ) ( not ( = ?auto_1271724 ?auto_1271725 ) ) ( ON ?auto_1271717 ?auto_1271716 ) ( ON ?auto_1271718 ?auto_1271717 ) ( ON ?auto_1271720 ?auto_1271718 ) ( ON ?auto_1271719 ?auto_1271720 ) ( ON ?auto_1271721 ?auto_1271719 ) ( ON ?auto_1271722 ?auto_1271721 ) ( ON ?auto_1271723 ?auto_1271722 ) ( ON ?auto_1271724 ?auto_1271723 ) ( not ( = ?auto_1271716 ?auto_1271717 ) ) ( not ( = ?auto_1271716 ?auto_1271718 ) ) ( not ( = ?auto_1271716 ?auto_1271720 ) ) ( not ( = ?auto_1271716 ?auto_1271719 ) ) ( not ( = ?auto_1271716 ?auto_1271721 ) ) ( not ( = ?auto_1271716 ?auto_1271722 ) ) ( not ( = ?auto_1271716 ?auto_1271723 ) ) ( not ( = ?auto_1271716 ?auto_1271724 ) ) ( not ( = ?auto_1271716 ?auto_1271725 ) ) ( not ( = ?auto_1271717 ?auto_1271718 ) ) ( not ( = ?auto_1271717 ?auto_1271720 ) ) ( not ( = ?auto_1271717 ?auto_1271719 ) ) ( not ( = ?auto_1271717 ?auto_1271721 ) ) ( not ( = ?auto_1271717 ?auto_1271722 ) ) ( not ( = ?auto_1271717 ?auto_1271723 ) ) ( not ( = ?auto_1271717 ?auto_1271724 ) ) ( not ( = ?auto_1271717 ?auto_1271725 ) ) ( not ( = ?auto_1271718 ?auto_1271720 ) ) ( not ( = ?auto_1271718 ?auto_1271719 ) ) ( not ( = ?auto_1271718 ?auto_1271721 ) ) ( not ( = ?auto_1271718 ?auto_1271722 ) ) ( not ( = ?auto_1271718 ?auto_1271723 ) ) ( not ( = ?auto_1271718 ?auto_1271724 ) ) ( not ( = ?auto_1271718 ?auto_1271725 ) ) ( not ( = ?auto_1271720 ?auto_1271719 ) ) ( not ( = ?auto_1271720 ?auto_1271721 ) ) ( not ( = ?auto_1271720 ?auto_1271722 ) ) ( not ( = ?auto_1271720 ?auto_1271723 ) ) ( not ( = ?auto_1271720 ?auto_1271724 ) ) ( not ( = ?auto_1271720 ?auto_1271725 ) ) ( not ( = ?auto_1271719 ?auto_1271721 ) ) ( not ( = ?auto_1271719 ?auto_1271722 ) ) ( not ( = ?auto_1271719 ?auto_1271723 ) ) ( not ( = ?auto_1271719 ?auto_1271724 ) ) ( not ( = ?auto_1271719 ?auto_1271725 ) ) ( not ( = ?auto_1271721 ?auto_1271722 ) ) ( not ( = ?auto_1271721 ?auto_1271723 ) ) ( not ( = ?auto_1271721 ?auto_1271724 ) ) ( not ( = ?auto_1271721 ?auto_1271725 ) ) ( not ( = ?auto_1271722 ?auto_1271723 ) ) ( not ( = ?auto_1271722 ?auto_1271724 ) ) ( not ( = ?auto_1271722 ?auto_1271725 ) ) ( not ( = ?auto_1271723 ?auto_1271724 ) ) ( not ( = ?auto_1271723 ?auto_1271725 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1271724 ?auto_1271725 )
      ( MAKE-9CRATE-VERIFY ?auto_1271716 ?auto_1271717 ?auto_1271718 ?auto_1271720 ?auto_1271719 ?auto_1271721 ?auto_1271722 ?auto_1271723 ?auto_1271724 ?auto_1271725 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1271796 - SURFACE
      ?auto_1271797 - SURFACE
      ?auto_1271798 - SURFACE
      ?auto_1271800 - SURFACE
      ?auto_1271799 - SURFACE
      ?auto_1271801 - SURFACE
      ?auto_1271802 - SURFACE
      ?auto_1271803 - SURFACE
      ?auto_1271804 - SURFACE
      ?auto_1271805 - SURFACE
    )
    :vars
    (
      ?auto_1271806 - HOIST
      ?auto_1271807 - PLACE
      ?auto_1271808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1271806 ?auto_1271807 ) ( SURFACE-AT ?auto_1271804 ?auto_1271807 ) ( CLEAR ?auto_1271804 ) ( IS-CRATE ?auto_1271805 ) ( not ( = ?auto_1271804 ?auto_1271805 ) ) ( TRUCK-AT ?auto_1271808 ?auto_1271807 ) ( AVAILABLE ?auto_1271806 ) ( IN ?auto_1271805 ?auto_1271808 ) ( ON ?auto_1271804 ?auto_1271803 ) ( not ( = ?auto_1271803 ?auto_1271804 ) ) ( not ( = ?auto_1271803 ?auto_1271805 ) ) ( ON ?auto_1271797 ?auto_1271796 ) ( ON ?auto_1271798 ?auto_1271797 ) ( ON ?auto_1271800 ?auto_1271798 ) ( ON ?auto_1271799 ?auto_1271800 ) ( ON ?auto_1271801 ?auto_1271799 ) ( ON ?auto_1271802 ?auto_1271801 ) ( ON ?auto_1271803 ?auto_1271802 ) ( not ( = ?auto_1271796 ?auto_1271797 ) ) ( not ( = ?auto_1271796 ?auto_1271798 ) ) ( not ( = ?auto_1271796 ?auto_1271800 ) ) ( not ( = ?auto_1271796 ?auto_1271799 ) ) ( not ( = ?auto_1271796 ?auto_1271801 ) ) ( not ( = ?auto_1271796 ?auto_1271802 ) ) ( not ( = ?auto_1271796 ?auto_1271803 ) ) ( not ( = ?auto_1271796 ?auto_1271804 ) ) ( not ( = ?auto_1271796 ?auto_1271805 ) ) ( not ( = ?auto_1271797 ?auto_1271798 ) ) ( not ( = ?auto_1271797 ?auto_1271800 ) ) ( not ( = ?auto_1271797 ?auto_1271799 ) ) ( not ( = ?auto_1271797 ?auto_1271801 ) ) ( not ( = ?auto_1271797 ?auto_1271802 ) ) ( not ( = ?auto_1271797 ?auto_1271803 ) ) ( not ( = ?auto_1271797 ?auto_1271804 ) ) ( not ( = ?auto_1271797 ?auto_1271805 ) ) ( not ( = ?auto_1271798 ?auto_1271800 ) ) ( not ( = ?auto_1271798 ?auto_1271799 ) ) ( not ( = ?auto_1271798 ?auto_1271801 ) ) ( not ( = ?auto_1271798 ?auto_1271802 ) ) ( not ( = ?auto_1271798 ?auto_1271803 ) ) ( not ( = ?auto_1271798 ?auto_1271804 ) ) ( not ( = ?auto_1271798 ?auto_1271805 ) ) ( not ( = ?auto_1271800 ?auto_1271799 ) ) ( not ( = ?auto_1271800 ?auto_1271801 ) ) ( not ( = ?auto_1271800 ?auto_1271802 ) ) ( not ( = ?auto_1271800 ?auto_1271803 ) ) ( not ( = ?auto_1271800 ?auto_1271804 ) ) ( not ( = ?auto_1271800 ?auto_1271805 ) ) ( not ( = ?auto_1271799 ?auto_1271801 ) ) ( not ( = ?auto_1271799 ?auto_1271802 ) ) ( not ( = ?auto_1271799 ?auto_1271803 ) ) ( not ( = ?auto_1271799 ?auto_1271804 ) ) ( not ( = ?auto_1271799 ?auto_1271805 ) ) ( not ( = ?auto_1271801 ?auto_1271802 ) ) ( not ( = ?auto_1271801 ?auto_1271803 ) ) ( not ( = ?auto_1271801 ?auto_1271804 ) ) ( not ( = ?auto_1271801 ?auto_1271805 ) ) ( not ( = ?auto_1271802 ?auto_1271803 ) ) ( not ( = ?auto_1271802 ?auto_1271804 ) ) ( not ( = ?auto_1271802 ?auto_1271805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1271803 ?auto_1271804 ?auto_1271805 )
      ( MAKE-9CRATE-VERIFY ?auto_1271796 ?auto_1271797 ?auto_1271798 ?auto_1271800 ?auto_1271799 ?auto_1271801 ?auto_1271802 ?auto_1271803 ?auto_1271804 ?auto_1271805 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1271886 - SURFACE
      ?auto_1271887 - SURFACE
      ?auto_1271888 - SURFACE
      ?auto_1271890 - SURFACE
      ?auto_1271889 - SURFACE
      ?auto_1271891 - SURFACE
      ?auto_1271892 - SURFACE
      ?auto_1271893 - SURFACE
      ?auto_1271894 - SURFACE
      ?auto_1271895 - SURFACE
    )
    :vars
    (
      ?auto_1271899 - HOIST
      ?auto_1271898 - PLACE
      ?auto_1271897 - TRUCK
      ?auto_1271896 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1271899 ?auto_1271898 ) ( SURFACE-AT ?auto_1271894 ?auto_1271898 ) ( CLEAR ?auto_1271894 ) ( IS-CRATE ?auto_1271895 ) ( not ( = ?auto_1271894 ?auto_1271895 ) ) ( AVAILABLE ?auto_1271899 ) ( IN ?auto_1271895 ?auto_1271897 ) ( ON ?auto_1271894 ?auto_1271893 ) ( not ( = ?auto_1271893 ?auto_1271894 ) ) ( not ( = ?auto_1271893 ?auto_1271895 ) ) ( TRUCK-AT ?auto_1271897 ?auto_1271896 ) ( not ( = ?auto_1271896 ?auto_1271898 ) ) ( ON ?auto_1271887 ?auto_1271886 ) ( ON ?auto_1271888 ?auto_1271887 ) ( ON ?auto_1271890 ?auto_1271888 ) ( ON ?auto_1271889 ?auto_1271890 ) ( ON ?auto_1271891 ?auto_1271889 ) ( ON ?auto_1271892 ?auto_1271891 ) ( ON ?auto_1271893 ?auto_1271892 ) ( not ( = ?auto_1271886 ?auto_1271887 ) ) ( not ( = ?auto_1271886 ?auto_1271888 ) ) ( not ( = ?auto_1271886 ?auto_1271890 ) ) ( not ( = ?auto_1271886 ?auto_1271889 ) ) ( not ( = ?auto_1271886 ?auto_1271891 ) ) ( not ( = ?auto_1271886 ?auto_1271892 ) ) ( not ( = ?auto_1271886 ?auto_1271893 ) ) ( not ( = ?auto_1271886 ?auto_1271894 ) ) ( not ( = ?auto_1271886 ?auto_1271895 ) ) ( not ( = ?auto_1271887 ?auto_1271888 ) ) ( not ( = ?auto_1271887 ?auto_1271890 ) ) ( not ( = ?auto_1271887 ?auto_1271889 ) ) ( not ( = ?auto_1271887 ?auto_1271891 ) ) ( not ( = ?auto_1271887 ?auto_1271892 ) ) ( not ( = ?auto_1271887 ?auto_1271893 ) ) ( not ( = ?auto_1271887 ?auto_1271894 ) ) ( not ( = ?auto_1271887 ?auto_1271895 ) ) ( not ( = ?auto_1271888 ?auto_1271890 ) ) ( not ( = ?auto_1271888 ?auto_1271889 ) ) ( not ( = ?auto_1271888 ?auto_1271891 ) ) ( not ( = ?auto_1271888 ?auto_1271892 ) ) ( not ( = ?auto_1271888 ?auto_1271893 ) ) ( not ( = ?auto_1271888 ?auto_1271894 ) ) ( not ( = ?auto_1271888 ?auto_1271895 ) ) ( not ( = ?auto_1271890 ?auto_1271889 ) ) ( not ( = ?auto_1271890 ?auto_1271891 ) ) ( not ( = ?auto_1271890 ?auto_1271892 ) ) ( not ( = ?auto_1271890 ?auto_1271893 ) ) ( not ( = ?auto_1271890 ?auto_1271894 ) ) ( not ( = ?auto_1271890 ?auto_1271895 ) ) ( not ( = ?auto_1271889 ?auto_1271891 ) ) ( not ( = ?auto_1271889 ?auto_1271892 ) ) ( not ( = ?auto_1271889 ?auto_1271893 ) ) ( not ( = ?auto_1271889 ?auto_1271894 ) ) ( not ( = ?auto_1271889 ?auto_1271895 ) ) ( not ( = ?auto_1271891 ?auto_1271892 ) ) ( not ( = ?auto_1271891 ?auto_1271893 ) ) ( not ( = ?auto_1271891 ?auto_1271894 ) ) ( not ( = ?auto_1271891 ?auto_1271895 ) ) ( not ( = ?auto_1271892 ?auto_1271893 ) ) ( not ( = ?auto_1271892 ?auto_1271894 ) ) ( not ( = ?auto_1271892 ?auto_1271895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1271893 ?auto_1271894 ?auto_1271895 )
      ( MAKE-9CRATE-VERIFY ?auto_1271886 ?auto_1271887 ?auto_1271888 ?auto_1271890 ?auto_1271889 ?auto_1271891 ?auto_1271892 ?auto_1271893 ?auto_1271894 ?auto_1271895 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1271985 - SURFACE
      ?auto_1271986 - SURFACE
      ?auto_1271987 - SURFACE
      ?auto_1271989 - SURFACE
      ?auto_1271988 - SURFACE
      ?auto_1271990 - SURFACE
      ?auto_1271991 - SURFACE
      ?auto_1271992 - SURFACE
      ?auto_1271993 - SURFACE
      ?auto_1271994 - SURFACE
    )
    :vars
    (
      ?auto_1271995 - HOIST
      ?auto_1271997 - PLACE
      ?auto_1271996 - TRUCK
      ?auto_1271999 - PLACE
      ?auto_1271998 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1271995 ?auto_1271997 ) ( SURFACE-AT ?auto_1271993 ?auto_1271997 ) ( CLEAR ?auto_1271993 ) ( IS-CRATE ?auto_1271994 ) ( not ( = ?auto_1271993 ?auto_1271994 ) ) ( AVAILABLE ?auto_1271995 ) ( ON ?auto_1271993 ?auto_1271992 ) ( not ( = ?auto_1271992 ?auto_1271993 ) ) ( not ( = ?auto_1271992 ?auto_1271994 ) ) ( TRUCK-AT ?auto_1271996 ?auto_1271999 ) ( not ( = ?auto_1271999 ?auto_1271997 ) ) ( HOIST-AT ?auto_1271998 ?auto_1271999 ) ( LIFTING ?auto_1271998 ?auto_1271994 ) ( not ( = ?auto_1271995 ?auto_1271998 ) ) ( ON ?auto_1271986 ?auto_1271985 ) ( ON ?auto_1271987 ?auto_1271986 ) ( ON ?auto_1271989 ?auto_1271987 ) ( ON ?auto_1271988 ?auto_1271989 ) ( ON ?auto_1271990 ?auto_1271988 ) ( ON ?auto_1271991 ?auto_1271990 ) ( ON ?auto_1271992 ?auto_1271991 ) ( not ( = ?auto_1271985 ?auto_1271986 ) ) ( not ( = ?auto_1271985 ?auto_1271987 ) ) ( not ( = ?auto_1271985 ?auto_1271989 ) ) ( not ( = ?auto_1271985 ?auto_1271988 ) ) ( not ( = ?auto_1271985 ?auto_1271990 ) ) ( not ( = ?auto_1271985 ?auto_1271991 ) ) ( not ( = ?auto_1271985 ?auto_1271992 ) ) ( not ( = ?auto_1271985 ?auto_1271993 ) ) ( not ( = ?auto_1271985 ?auto_1271994 ) ) ( not ( = ?auto_1271986 ?auto_1271987 ) ) ( not ( = ?auto_1271986 ?auto_1271989 ) ) ( not ( = ?auto_1271986 ?auto_1271988 ) ) ( not ( = ?auto_1271986 ?auto_1271990 ) ) ( not ( = ?auto_1271986 ?auto_1271991 ) ) ( not ( = ?auto_1271986 ?auto_1271992 ) ) ( not ( = ?auto_1271986 ?auto_1271993 ) ) ( not ( = ?auto_1271986 ?auto_1271994 ) ) ( not ( = ?auto_1271987 ?auto_1271989 ) ) ( not ( = ?auto_1271987 ?auto_1271988 ) ) ( not ( = ?auto_1271987 ?auto_1271990 ) ) ( not ( = ?auto_1271987 ?auto_1271991 ) ) ( not ( = ?auto_1271987 ?auto_1271992 ) ) ( not ( = ?auto_1271987 ?auto_1271993 ) ) ( not ( = ?auto_1271987 ?auto_1271994 ) ) ( not ( = ?auto_1271989 ?auto_1271988 ) ) ( not ( = ?auto_1271989 ?auto_1271990 ) ) ( not ( = ?auto_1271989 ?auto_1271991 ) ) ( not ( = ?auto_1271989 ?auto_1271992 ) ) ( not ( = ?auto_1271989 ?auto_1271993 ) ) ( not ( = ?auto_1271989 ?auto_1271994 ) ) ( not ( = ?auto_1271988 ?auto_1271990 ) ) ( not ( = ?auto_1271988 ?auto_1271991 ) ) ( not ( = ?auto_1271988 ?auto_1271992 ) ) ( not ( = ?auto_1271988 ?auto_1271993 ) ) ( not ( = ?auto_1271988 ?auto_1271994 ) ) ( not ( = ?auto_1271990 ?auto_1271991 ) ) ( not ( = ?auto_1271990 ?auto_1271992 ) ) ( not ( = ?auto_1271990 ?auto_1271993 ) ) ( not ( = ?auto_1271990 ?auto_1271994 ) ) ( not ( = ?auto_1271991 ?auto_1271992 ) ) ( not ( = ?auto_1271991 ?auto_1271993 ) ) ( not ( = ?auto_1271991 ?auto_1271994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1271992 ?auto_1271993 ?auto_1271994 )
      ( MAKE-9CRATE-VERIFY ?auto_1271985 ?auto_1271986 ?auto_1271987 ?auto_1271989 ?auto_1271988 ?auto_1271990 ?auto_1271991 ?auto_1271992 ?auto_1271993 ?auto_1271994 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1272093 - SURFACE
      ?auto_1272094 - SURFACE
      ?auto_1272095 - SURFACE
      ?auto_1272097 - SURFACE
      ?auto_1272096 - SURFACE
      ?auto_1272098 - SURFACE
      ?auto_1272099 - SURFACE
      ?auto_1272100 - SURFACE
      ?auto_1272101 - SURFACE
      ?auto_1272102 - SURFACE
    )
    :vars
    (
      ?auto_1272108 - HOIST
      ?auto_1272105 - PLACE
      ?auto_1272106 - TRUCK
      ?auto_1272103 - PLACE
      ?auto_1272107 - HOIST
      ?auto_1272104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1272108 ?auto_1272105 ) ( SURFACE-AT ?auto_1272101 ?auto_1272105 ) ( CLEAR ?auto_1272101 ) ( IS-CRATE ?auto_1272102 ) ( not ( = ?auto_1272101 ?auto_1272102 ) ) ( AVAILABLE ?auto_1272108 ) ( ON ?auto_1272101 ?auto_1272100 ) ( not ( = ?auto_1272100 ?auto_1272101 ) ) ( not ( = ?auto_1272100 ?auto_1272102 ) ) ( TRUCK-AT ?auto_1272106 ?auto_1272103 ) ( not ( = ?auto_1272103 ?auto_1272105 ) ) ( HOIST-AT ?auto_1272107 ?auto_1272103 ) ( not ( = ?auto_1272108 ?auto_1272107 ) ) ( AVAILABLE ?auto_1272107 ) ( SURFACE-AT ?auto_1272102 ?auto_1272103 ) ( ON ?auto_1272102 ?auto_1272104 ) ( CLEAR ?auto_1272102 ) ( not ( = ?auto_1272101 ?auto_1272104 ) ) ( not ( = ?auto_1272102 ?auto_1272104 ) ) ( not ( = ?auto_1272100 ?auto_1272104 ) ) ( ON ?auto_1272094 ?auto_1272093 ) ( ON ?auto_1272095 ?auto_1272094 ) ( ON ?auto_1272097 ?auto_1272095 ) ( ON ?auto_1272096 ?auto_1272097 ) ( ON ?auto_1272098 ?auto_1272096 ) ( ON ?auto_1272099 ?auto_1272098 ) ( ON ?auto_1272100 ?auto_1272099 ) ( not ( = ?auto_1272093 ?auto_1272094 ) ) ( not ( = ?auto_1272093 ?auto_1272095 ) ) ( not ( = ?auto_1272093 ?auto_1272097 ) ) ( not ( = ?auto_1272093 ?auto_1272096 ) ) ( not ( = ?auto_1272093 ?auto_1272098 ) ) ( not ( = ?auto_1272093 ?auto_1272099 ) ) ( not ( = ?auto_1272093 ?auto_1272100 ) ) ( not ( = ?auto_1272093 ?auto_1272101 ) ) ( not ( = ?auto_1272093 ?auto_1272102 ) ) ( not ( = ?auto_1272093 ?auto_1272104 ) ) ( not ( = ?auto_1272094 ?auto_1272095 ) ) ( not ( = ?auto_1272094 ?auto_1272097 ) ) ( not ( = ?auto_1272094 ?auto_1272096 ) ) ( not ( = ?auto_1272094 ?auto_1272098 ) ) ( not ( = ?auto_1272094 ?auto_1272099 ) ) ( not ( = ?auto_1272094 ?auto_1272100 ) ) ( not ( = ?auto_1272094 ?auto_1272101 ) ) ( not ( = ?auto_1272094 ?auto_1272102 ) ) ( not ( = ?auto_1272094 ?auto_1272104 ) ) ( not ( = ?auto_1272095 ?auto_1272097 ) ) ( not ( = ?auto_1272095 ?auto_1272096 ) ) ( not ( = ?auto_1272095 ?auto_1272098 ) ) ( not ( = ?auto_1272095 ?auto_1272099 ) ) ( not ( = ?auto_1272095 ?auto_1272100 ) ) ( not ( = ?auto_1272095 ?auto_1272101 ) ) ( not ( = ?auto_1272095 ?auto_1272102 ) ) ( not ( = ?auto_1272095 ?auto_1272104 ) ) ( not ( = ?auto_1272097 ?auto_1272096 ) ) ( not ( = ?auto_1272097 ?auto_1272098 ) ) ( not ( = ?auto_1272097 ?auto_1272099 ) ) ( not ( = ?auto_1272097 ?auto_1272100 ) ) ( not ( = ?auto_1272097 ?auto_1272101 ) ) ( not ( = ?auto_1272097 ?auto_1272102 ) ) ( not ( = ?auto_1272097 ?auto_1272104 ) ) ( not ( = ?auto_1272096 ?auto_1272098 ) ) ( not ( = ?auto_1272096 ?auto_1272099 ) ) ( not ( = ?auto_1272096 ?auto_1272100 ) ) ( not ( = ?auto_1272096 ?auto_1272101 ) ) ( not ( = ?auto_1272096 ?auto_1272102 ) ) ( not ( = ?auto_1272096 ?auto_1272104 ) ) ( not ( = ?auto_1272098 ?auto_1272099 ) ) ( not ( = ?auto_1272098 ?auto_1272100 ) ) ( not ( = ?auto_1272098 ?auto_1272101 ) ) ( not ( = ?auto_1272098 ?auto_1272102 ) ) ( not ( = ?auto_1272098 ?auto_1272104 ) ) ( not ( = ?auto_1272099 ?auto_1272100 ) ) ( not ( = ?auto_1272099 ?auto_1272101 ) ) ( not ( = ?auto_1272099 ?auto_1272102 ) ) ( not ( = ?auto_1272099 ?auto_1272104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1272100 ?auto_1272101 ?auto_1272102 )
      ( MAKE-9CRATE-VERIFY ?auto_1272093 ?auto_1272094 ?auto_1272095 ?auto_1272097 ?auto_1272096 ?auto_1272098 ?auto_1272099 ?auto_1272100 ?auto_1272101 ?auto_1272102 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1272202 - SURFACE
      ?auto_1272203 - SURFACE
      ?auto_1272204 - SURFACE
      ?auto_1272206 - SURFACE
      ?auto_1272205 - SURFACE
      ?auto_1272207 - SURFACE
      ?auto_1272208 - SURFACE
      ?auto_1272209 - SURFACE
      ?auto_1272210 - SURFACE
      ?auto_1272211 - SURFACE
    )
    :vars
    (
      ?auto_1272212 - HOIST
      ?auto_1272214 - PLACE
      ?auto_1272216 - PLACE
      ?auto_1272213 - HOIST
      ?auto_1272215 - SURFACE
      ?auto_1272217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1272212 ?auto_1272214 ) ( SURFACE-AT ?auto_1272210 ?auto_1272214 ) ( CLEAR ?auto_1272210 ) ( IS-CRATE ?auto_1272211 ) ( not ( = ?auto_1272210 ?auto_1272211 ) ) ( AVAILABLE ?auto_1272212 ) ( ON ?auto_1272210 ?auto_1272209 ) ( not ( = ?auto_1272209 ?auto_1272210 ) ) ( not ( = ?auto_1272209 ?auto_1272211 ) ) ( not ( = ?auto_1272216 ?auto_1272214 ) ) ( HOIST-AT ?auto_1272213 ?auto_1272216 ) ( not ( = ?auto_1272212 ?auto_1272213 ) ) ( AVAILABLE ?auto_1272213 ) ( SURFACE-AT ?auto_1272211 ?auto_1272216 ) ( ON ?auto_1272211 ?auto_1272215 ) ( CLEAR ?auto_1272211 ) ( not ( = ?auto_1272210 ?auto_1272215 ) ) ( not ( = ?auto_1272211 ?auto_1272215 ) ) ( not ( = ?auto_1272209 ?auto_1272215 ) ) ( TRUCK-AT ?auto_1272217 ?auto_1272214 ) ( ON ?auto_1272203 ?auto_1272202 ) ( ON ?auto_1272204 ?auto_1272203 ) ( ON ?auto_1272206 ?auto_1272204 ) ( ON ?auto_1272205 ?auto_1272206 ) ( ON ?auto_1272207 ?auto_1272205 ) ( ON ?auto_1272208 ?auto_1272207 ) ( ON ?auto_1272209 ?auto_1272208 ) ( not ( = ?auto_1272202 ?auto_1272203 ) ) ( not ( = ?auto_1272202 ?auto_1272204 ) ) ( not ( = ?auto_1272202 ?auto_1272206 ) ) ( not ( = ?auto_1272202 ?auto_1272205 ) ) ( not ( = ?auto_1272202 ?auto_1272207 ) ) ( not ( = ?auto_1272202 ?auto_1272208 ) ) ( not ( = ?auto_1272202 ?auto_1272209 ) ) ( not ( = ?auto_1272202 ?auto_1272210 ) ) ( not ( = ?auto_1272202 ?auto_1272211 ) ) ( not ( = ?auto_1272202 ?auto_1272215 ) ) ( not ( = ?auto_1272203 ?auto_1272204 ) ) ( not ( = ?auto_1272203 ?auto_1272206 ) ) ( not ( = ?auto_1272203 ?auto_1272205 ) ) ( not ( = ?auto_1272203 ?auto_1272207 ) ) ( not ( = ?auto_1272203 ?auto_1272208 ) ) ( not ( = ?auto_1272203 ?auto_1272209 ) ) ( not ( = ?auto_1272203 ?auto_1272210 ) ) ( not ( = ?auto_1272203 ?auto_1272211 ) ) ( not ( = ?auto_1272203 ?auto_1272215 ) ) ( not ( = ?auto_1272204 ?auto_1272206 ) ) ( not ( = ?auto_1272204 ?auto_1272205 ) ) ( not ( = ?auto_1272204 ?auto_1272207 ) ) ( not ( = ?auto_1272204 ?auto_1272208 ) ) ( not ( = ?auto_1272204 ?auto_1272209 ) ) ( not ( = ?auto_1272204 ?auto_1272210 ) ) ( not ( = ?auto_1272204 ?auto_1272211 ) ) ( not ( = ?auto_1272204 ?auto_1272215 ) ) ( not ( = ?auto_1272206 ?auto_1272205 ) ) ( not ( = ?auto_1272206 ?auto_1272207 ) ) ( not ( = ?auto_1272206 ?auto_1272208 ) ) ( not ( = ?auto_1272206 ?auto_1272209 ) ) ( not ( = ?auto_1272206 ?auto_1272210 ) ) ( not ( = ?auto_1272206 ?auto_1272211 ) ) ( not ( = ?auto_1272206 ?auto_1272215 ) ) ( not ( = ?auto_1272205 ?auto_1272207 ) ) ( not ( = ?auto_1272205 ?auto_1272208 ) ) ( not ( = ?auto_1272205 ?auto_1272209 ) ) ( not ( = ?auto_1272205 ?auto_1272210 ) ) ( not ( = ?auto_1272205 ?auto_1272211 ) ) ( not ( = ?auto_1272205 ?auto_1272215 ) ) ( not ( = ?auto_1272207 ?auto_1272208 ) ) ( not ( = ?auto_1272207 ?auto_1272209 ) ) ( not ( = ?auto_1272207 ?auto_1272210 ) ) ( not ( = ?auto_1272207 ?auto_1272211 ) ) ( not ( = ?auto_1272207 ?auto_1272215 ) ) ( not ( = ?auto_1272208 ?auto_1272209 ) ) ( not ( = ?auto_1272208 ?auto_1272210 ) ) ( not ( = ?auto_1272208 ?auto_1272211 ) ) ( not ( = ?auto_1272208 ?auto_1272215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1272209 ?auto_1272210 ?auto_1272211 )
      ( MAKE-9CRATE-VERIFY ?auto_1272202 ?auto_1272203 ?auto_1272204 ?auto_1272206 ?auto_1272205 ?auto_1272207 ?auto_1272208 ?auto_1272209 ?auto_1272210 ?auto_1272211 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1272311 - SURFACE
      ?auto_1272312 - SURFACE
      ?auto_1272313 - SURFACE
      ?auto_1272315 - SURFACE
      ?auto_1272314 - SURFACE
      ?auto_1272316 - SURFACE
      ?auto_1272317 - SURFACE
      ?auto_1272318 - SURFACE
      ?auto_1272319 - SURFACE
      ?auto_1272320 - SURFACE
    )
    :vars
    (
      ?auto_1272323 - HOIST
      ?auto_1272325 - PLACE
      ?auto_1272326 - PLACE
      ?auto_1272321 - HOIST
      ?auto_1272322 - SURFACE
      ?auto_1272324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1272323 ?auto_1272325 ) ( IS-CRATE ?auto_1272320 ) ( not ( = ?auto_1272319 ?auto_1272320 ) ) ( not ( = ?auto_1272318 ?auto_1272319 ) ) ( not ( = ?auto_1272318 ?auto_1272320 ) ) ( not ( = ?auto_1272326 ?auto_1272325 ) ) ( HOIST-AT ?auto_1272321 ?auto_1272326 ) ( not ( = ?auto_1272323 ?auto_1272321 ) ) ( AVAILABLE ?auto_1272321 ) ( SURFACE-AT ?auto_1272320 ?auto_1272326 ) ( ON ?auto_1272320 ?auto_1272322 ) ( CLEAR ?auto_1272320 ) ( not ( = ?auto_1272319 ?auto_1272322 ) ) ( not ( = ?auto_1272320 ?auto_1272322 ) ) ( not ( = ?auto_1272318 ?auto_1272322 ) ) ( TRUCK-AT ?auto_1272324 ?auto_1272325 ) ( SURFACE-AT ?auto_1272318 ?auto_1272325 ) ( CLEAR ?auto_1272318 ) ( LIFTING ?auto_1272323 ?auto_1272319 ) ( IS-CRATE ?auto_1272319 ) ( ON ?auto_1272312 ?auto_1272311 ) ( ON ?auto_1272313 ?auto_1272312 ) ( ON ?auto_1272315 ?auto_1272313 ) ( ON ?auto_1272314 ?auto_1272315 ) ( ON ?auto_1272316 ?auto_1272314 ) ( ON ?auto_1272317 ?auto_1272316 ) ( ON ?auto_1272318 ?auto_1272317 ) ( not ( = ?auto_1272311 ?auto_1272312 ) ) ( not ( = ?auto_1272311 ?auto_1272313 ) ) ( not ( = ?auto_1272311 ?auto_1272315 ) ) ( not ( = ?auto_1272311 ?auto_1272314 ) ) ( not ( = ?auto_1272311 ?auto_1272316 ) ) ( not ( = ?auto_1272311 ?auto_1272317 ) ) ( not ( = ?auto_1272311 ?auto_1272318 ) ) ( not ( = ?auto_1272311 ?auto_1272319 ) ) ( not ( = ?auto_1272311 ?auto_1272320 ) ) ( not ( = ?auto_1272311 ?auto_1272322 ) ) ( not ( = ?auto_1272312 ?auto_1272313 ) ) ( not ( = ?auto_1272312 ?auto_1272315 ) ) ( not ( = ?auto_1272312 ?auto_1272314 ) ) ( not ( = ?auto_1272312 ?auto_1272316 ) ) ( not ( = ?auto_1272312 ?auto_1272317 ) ) ( not ( = ?auto_1272312 ?auto_1272318 ) ) ( not ( = ?auto_1272312 ?auto_1272319 ) ) ( not ( = ?auto_1272312 ?auto_1272320 ) ) ( not ( = ?auto_1272312 ?auto_1272322 ) ) ( not ( = ?auto_1272313 ?auto_1272315 ) ) ( not ( = ?auto_1272313 ?auto_1272314 ) ) ( not ( = ?auto_1272313 ?auto_1272316 ) ) ( not ( = ?auto_1272313 ?auto_1272317 ) ) ( not ( = ?auto_1272313 ?auto_1272318 ) ) ( not ( = ?auto_1272313 ?auto_1272319 ) ) ( not ( = ?auto_1272313 ?auto_1272320 ) ) ( not ( = ?auto_1272313 ?auto_1272322 ) ) ( not ( = ?auto_1272315 ?auto_1272314 ) ) ( not ( = ?auto_1272315 ?auto_1272316 ) ) ( not ( = ?auto_1272315 ?auto_1272317 ) ) ( not ( = ?auto_1272315 ?auto_1272318 ) ) ( not ( = ?auto_1272315 ?auto_1272319 ) ) ( not ( = ?auto_1272315 ?auto_1272320 ) ) ( not ( = ?auto_1272315 ?auto_1272322 ) ) ( not ( = ?auto_1272314 ?auto_1272316 ) ) ( not ( = ?auto_1272314 ?auto_1272317 ) ) ( not ( = ?auto_1272314 ?auto_1272318 ) ) ( not ( = ?auto_1272314 ?auto_1272319 ) ) ( not ( = ?auto_1272314 ?auto_1272320 ) ) ( not ( = ?auto_1272314 ?auto_1272322 ) ) ( not ( = ?auto_1272316 ?auto_1272317 ) ) ( not ( = ?auto_1272316 ?auto_1272318 ) ) ( not ( = ?auto_1272316 ?auto_1272319 ) ) ( not ( = ?auto_1272316 ?auto_1272320 ) ) ( not ( = ?auto_1272316 ?auto_1272322 ) ) ( not ( = ?auto_1272317 ?auto_1272318 ) ) ( not ( = ?auto_1272317 ?auto_1272319 ) ) ( not ( = ?auto_1272317 ?auto_1272320 ) ) ( not ( = ?auto_1272317 ?auto_1272322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1272318 ?auto_1272319 ?auto_1272320 )
      ( MAKE-9CRATE-VERIFY ?auto_1272311 ?auto_1272312 ?auto_1272313 ?auto_1272315 ?auto_1272314 ?auto_1272316 ?auto_1272317 ?auto_1272318 ?auto_1272319 ?auto_1272320 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1272420 - SURFACE
      ?auto_1272421 - SURFACE
      ?auto_1272422 - SURFACE
      ?auto_1272424 - SURFACE
      ?auto_1272423 - SURFACE
      ?auto_1272425 - SURFACE
      ?auto_1272426 - SURFACE
      ?auto_1272427 - SURFACE
      ?auto_1272428 - SURFACE
      ?auto_1272429 - SURFACE
    )
    :vars
    (
      ?auto_1272432 - HOIST
      ?auto_1272430 - PLACE
      ?auto_1272435 - PLACE
      ?auto_1272433 - HOIST
      ?auto_1272434 - SURFACE
      ?auto_1272431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1272432 ?auto_1272430 ) ( IS-CRATE ?auto_1272429 ) ( not ( = ?auto_1272428 ?auto_1272429 ) ) ( not ( = ?auto_1272427 ?auto_1272428 ) ) ( not ( = ?auto_1272427 ?auto_1272429 ) ) ( not ( = ?auto_1272435 ?auto_1272430 ) ) ( HOIST-AT ?auto_1272433 ?auto_1272435 ) ( not ( = ?auto_1272432 ?auto_1272433 ) ) ( AVAILABLE ?auto_1272433 ) ( SURFACE-AT ?auto_1272429 ?auto_1272435 ) ( ON ?auto_1272429 ?auto_1272434 ) ( CLEAR ?auto_1272429 ) ( not ( = ?auto_1272428 ?auto_1272434 ) ) ( not ( = ?auto_1272429 ?auto_1272434 ) ) ( not ( = ?auto_1272427 ?auto_1272434 ) ) ( TRUCK-AT ?auto_1272431 ?auto_1272430 ) ( SURFACE-AT ?auto_1272427 ?auto_1272430 ) ( CLEAR ?auto_1272427 ) ( IS-CRATE ?auto_1272428 ) ( AVAILABLE ?auto_1272432 ) ( IN ?auto_1272428 ?auto_1272431 ) ( ON ?auto_1272421 ?auto_1272420 ) ( ON ?auto_1272422 ?auto_1272421 ) ( ON ?auto_1272424 ?auto_1272422 ) ( ON ?auto_1272423 ?auto_1272424 ) ( ON ?auto_1272425 ?auto_1272423 ) ( ON ?auto_1272426 ?auto_1272425 ) ( ON ?auto_1272427 ?auto_1272426 ) ( not ( = ?auto_1272420 ?auto_1272421 ) ) ( not ( = ?auto_1272420 ?auto_1272422 ) ) ( not ( = ?auto_1272420 ?auto_1272424 ) ) ( not ( = ?auto_1272420 ?auto_1272423 ) ) ( not ( = ?auto_1272420 ?auto_1272425 ) ) ( not ( = ?auto_1272420 ?auto_1272426 ) ) ( not ( = ?auto_1272420 ?auto_1272427 ) ) ( not ( = ?auto_1272420 ?auto_1272428 ) ) ( not ( = ?auto_1272420 ?auto_1272429 ) ) ( not ( = ?auto_1272420 ?auto_1272434 ) ) ( not ( = ?auto_1272421 ?auto_1272422 ) ) ( not ( = ?auto_1272421 ?auto_1272424 ) ) ( not ( = ?auto_1272421 ?auto_1272423 ) ) ( not ( = ?auto_1272421 ?auto_1272425 ) ) ( not ( = ?auto_1272421 ?auto_1272426 ) ) ( not ( = ?auto_1272421 ?auto_1272427 ) ) ( not ( = ?auto_1272421 ?auto_1272428 ) ) ( not ( = ?auto_1272421 ?auto_1272429 ) ) ( not ( = ?auto_1272421 ?auto_1272434 ) ) ( not ( = ?auto_1272422 ?auto_1272424 ) ) ( not ( = ?auto_1272422 ?auto_1272423 ) ) ( not ( = ?auto_1272422 ?auto_1272425 ) ) ( not ( = ?auto_1272422 ?auto_1272426 ) ) ( not ( = ?auto_1272422 ?auto_1272427 ) ) ( not ( = ?auto_1272422 ?auto_1272428 ) ) ( not ( = ?auto_1272422 ?auto_1272429 ) ) ( not ( = ?auto_1272422 ?auto_1272434 ) ) ( not ( = ?auto_1272424 ?auto_1272423 ) ) ( not ( = ?auto_1272424 ?auto_1272425 ) ) ( not ( = ?auto_1272424 ?auto_1272426 ) ) ( not ( = ?auto_1272424 ?auto_1272427 ) ) ( not ( = ?auto_1272424 ?auto_1272428 ) ) ( not ( = ?auto_1272424 ?auto_1272429 ) ) ( not ( = ?auto_1272424 ?auto_1272434 ) ) ( not ( = ?auto_1272423 ?auto_1272425 ) ) ( not ( = ?auto_1272423 ?auto_1272426 ) ) ( not ( = ?auto_1272423 ?auto_1272427 ) ) ( not ( = ?auto_1272423 ?auto_1272428 ) ) ( not ( = ?auto_1272423 ?auto_1272429 ) ) ( not ( = ?auto_1272423 ?auto_1272434 ) ) ( not ( = ?auto_1272425 ?auto_1272426 ) ) ( not ( = ?auto_1272425 ?auto_1272427 ) ) ( not ( = ?auto_1272425 ?auto_1272428 ) ) ( not ( = ?auto_1272425 ?auto_1272429 ) ) ( not ( = ?auto_1272425 ?auto_1272434 ) ) ( not ( = ?auto_1272426 ?auto_1272427 ) ) ( not ( = ?auto_1272426 ?auto_1272428 ) ) ( not ( = ?auto_1272426 ?auto_1272429 ) ) ( not ( = ?auto_1272426 ?auto_1272434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1272427 ?auto_1272428 ?auto_1272429 )
      ( MAKE-9CRATE-VERIFY ?auto_1272420 ?auto_1272421 ?auto_1272422 ?auto_1272424 ?auto_1272423 ?auto_1272425 ?auto_1272426 ?auto_1272427 ?auto_1272428 ?auto_1272429 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1277985 - SURFACE
      ?auto_1277986 - SURFACE
      ?auto_1277987 - SURFACE
      ?auto_1277989 - SURFACE
      ?auto_1277988 - SURFACE
      ?auto_1277990 - SURFACE
      ?auto_1277991 - SURFACE
      ?auto_1277992 - SURFACE
      ?auto_1277993 - SURFACE
      ?auto_1277994 - SURFACE
      ?auto_1277995 - SURFACE
    )
    :vars
    (
      ?auto_1277996 - HOIST
      ?auto_1277997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1277996 ?auto_1277997 ) ( SURFACE-AT ?auto_1277994 ?auto_1277997 ) ( CLEAR ?auto_1277994 ) ( LIFTING ?auto_1277996 ?auto_1277995 ) ( IS-CRATE ?auto_1277995 ) ( not ( = ?auto_1277994 ?auto_1277995 ) ) ( ON ?auto_1277986 ?auto_1277985 ) ( ON ?auto_1277987 ?auto_1277986 ) ( ON ?auto_1277989 ?auto_1277987 ) ( ON ?auto_1277988 ?auto_1277989 ) ( ON ?auto_1277990 ?auto_1277988 ) ( ON ?auto_1277991 ?auto_1277990 ) ( ON ?auto_1277992 ?auto_1277991 ) ( ON ?auto_1277993 ?auto_1277992 ) ( ON ?auto_1277994 ?auto_1277993 ) ( not ( = ?auto_1277985 ?auto_1277986 ) ) ( not ( = ?auto_1277985 ?auto_1277987 ) ) ( not ( = ?auto_1277985 ?auto_1277989 ) ) ( not ( = ?auto_1277985 ?auto_1277988 ) ) ( not ( = ?auto_1277985 ?auto_1277990 ) ) ( not ( = ?auto_1277985 ?auto_1277991 ) ) ( not ( = ?auto_1277985 ?auto_1277992 ) ) ( not ( = ?auto_1277985 ?auto_1277993 ) ) ( not ( = ?auto_1277985 ?auto_1277994 ) ) ( not ( = ?auto_1277985 ?auto_1277995 ) ) ( not ( = ?auto_1277986 ?auto_1277987 ) ) ( not ( = ?auto_1277986 ?auto_1277989 ) ) ( not ( = ?auto_1277986 ?auto_1277988 ) ) ( not ( = ?auto_1277986 ?auto_1277990 ) ) ( not ( = ?auto_1277986 ?auto_1277991 ) ) ( not ( = ?auto_1277986 ?auto_1277992 ) ) ( not ( = ?auto_1277986 ?auto_1277993 ) ) ( not ( = ?auto_1277986 ?auto_1277994 ) ) ( not ( = ?auto_1277986 ?auto_1277995 ) ) ( not ( = ?auto_1277987 ?auto_1277989 ) ) ( not ( = ?auto_1277987 ?auto_1277988 ) ) ( not ( = ?auto_1277987 ?auto_1277990 ) ) ( not ( = ?auto_1277987 ?auto_1277991 ) ) ( not ( = ?auto_1277987 ?auto_1277992 ) ) ( not ( = ?auto_1277987 ?auto_1277993 ) ) ( not ( = ?auto_1277987 ?auto_1277994 ) ) ( not ( = ?auto_1277987 ?auto_1277995 ) ) ( not ( = ?auto_1277989 ?auto_1277988 ) ) ( not ( = ?auto_1277989 ?auto_1277990 ) ) ( not ( = ?auto_1277989 ?auto_1277991 ) ) ( not ( = ?auto_1277989 ?auto_1277992 ) ) ( not ( = ?auto_1277989 ?auto_1277993 ) ) ( not ( = ?auto_1277989 ?auto_1277994 ) ) ( not ( = ?auto_1277989 ?auto_1277995 ) ) ( not ( = ?auto_1277988 ?auto_1277990 ) ) ( not ( = ?auto_1277988 ?auto_1277991 ) ) ( not ( = ?auto_1277988 ?auto_1277992 ) ) ( not ( = ?auto_1277988 ?auto_1277993 ) ) ( not ( = ?auto_1277988 ?auto_1277994 ) ) ( not ( = ?auto_1277988 ?auto_1277995 ) ) ( not ( = ?auto_1277990 ?auto_1277991 ) ) ( not ( = ?auto_1277990 ?auto_1277992 ) ) ( not ( = ?auto_1277990 ?auto_1277993 ) ) ( not ( = ?auto_1277990 ?auto_1277994 ) ) ( not ( = ?auto_1277990 ?auto_1277995 ) ) ( not ( = ?auto_1277991 ?auto_1277992 ) ) ( not ( = ?auto_1277991 ?auto_1277993 ) ) ( not ( = ?auto_1277991 ?auto_1277994 ) ) ( not ( = ?auto_1277991 ?auto_1277995 ) ) ( not ( = ?auto_1277992 ?auto_1277993 ) ) ( not ( = ?auto_1277992 ?auto_1277994 ) ) ( not ( = ?auto_1277992 ?auto_1277995 ) ) ( not ( = ?auto_1277993 ?auto_1277994 ) ) ( not ( = ?auto_1277993 ?auto_1277995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1277994 ?auto_1277995 )
      ( MAKE-10CRATE-VERIFY ?auto_1277985 ?auto_1277986 ?auto_1277987 ?auto_1277989 ?auto_1277988 ?auto_1277990 ?auto_1277991 ?auto_1277992 ?auto_1277993 ?auto_1277994 ?auto_1277995 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1278079 - SURFACE
      ?auto_1278080 - SURFACE
      ?auto_1278081 - SURFACE
      ?auto_1278083 - SURFACE
      ?auto_1278082 - SURFACE
      ?auto_1278084 - SURFACE
      ?auto_1278085 - SURFACE
      ?auto_1278086 - SURFACE
      ?auto_1278087 - SURFACE
      ?auto_1278088 - SURFACE
      ?auto_1278089 - SURFACE
    )
    :vars
    (
      ?auto_1278091 - HOIST
      ?auto_1278092 - PLACE
      ?auto_1278090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1278091 ?auto_1278092 ) ( SURFACE-AT ?auto_1278088 ?auto_1278092 ) ( CLEAR ?auto_1278088 ) ( IS-CRATE ?auto_1278089 ) ( not ( = ?auto_1278088 ?auto_1278089 ) ) ( TRUCK-AT ?auto_1278090 ?auto_1278092 ) ( AVAILABLE ?auto_1278091 ) ( IN ?auto_1278089 ?auto_1278090 ) ( ON ?auto_1278088 ?auto_1278087 ) ( not ( = ?auto_1278087 ?auto_1278088 ) ) ( not ( = ?auto_1278087 ?auto_1278089 ) ) ( ON ?auto_1278080 ?auto_1278079 ) ( ON ?auto_1278081 ?auto_1278080 ) ( ON ?auto_1278083 ?auto_1278081 ) ( ON ?auto_1278082 ?auto_1278083 ) ( ON ?auto_1278084 ?auto_1278082 ) ( ON ?auto_1278085 ?auto_1278084 ) ( ON ?auto_1278086 ?auto_1278085 ) ( ON ?auto_1278087 ?auto_1278086 ) ( not ( = ?auto_1278079 ?auto_1278080 ) ) ( not ( = ?auto_1278079 ?auto_1278081 ) ) ( not ( = ?auto_1278079 ?auto_1278083 ) ) ( not ( = ?auto_1278079 ?auto_1278082 ) ) ( not ( = ?auto_1278079 ?auto_1278084 ) ) ( not ( = ?auto_1278079 ?auto_1278085 ) ) ( not ( = ?auto_1278079 ?auto_1278086 ) ) ( not ( = ?auto_1278079 ?auto_1278087 ) ) ( not ( = ?auto_1278079 ?auto_1278088 ) ) ( not ( = ?auto_1278079 ?auto_1278089 ) ) ( not ( = ?auto_1278080 ?auto_1278081 ) ) ( not ( = ?auto_1278080 ?auto_1278083 ) ) ( not ( = ?auto_1278080 ?auto_1278082 ) ) ( not ( = ?auto_1278080 ?auto_1278084 ) ) ( not ( = ?auto_1278080 ?auto_1278085 ) ) ( not ( = ?auto_1278080 ?auto_1278086 ) ) ( not ( = ?auto_1278080 ?auto_1278087 ) ) ( not ( = ?auto_1278080 ?auto_1278088 ) ) ( not ( = ?auto_1278080 ?auto_1278089 ) ) ( not ( = ?auto_1278081 ?auto_1278083 ) ) ( not ( = ?auto_1278081 ?auto_1278082 ) ) ( not ( = ?auto_1278081 ?auto_1278084 ) ) ( not ( = ?auto_1278081 ?auto_1278085 ) ) ( not ( = ?auto_1278081 ?auto_1278086 ) ) ( not ( = ?auto_1278081 ?auto_1278087 ) ) ( not ( = ?auto_1278081 ?auto_1278088 ) ) ( not ( = ?auto_1278081 ?auto_1278089 ) ) ( not ( = ?auto_1278083 ?auto_1278082 ) ) ( not ( = ?auto_1278083 ?auto_1278084 ) ) ( not ( = ?auto_1278083 ?auto_1278085 ) ) ( not ( = ?auto_1278083 ?auto_1278086 ) ) ( not ( = ?auto_1278083 ?auto_1278087 ) ) ( not ( = ?auto_1278083 ?auto_1278088 ) ) ( not ( = ?auto_1278083 ?auto_1278089 ) ) ( not ( = ?auto_1278082 ?auto_1278084 ) ) ( not ( = ?auto_1278082 ?auto_1278085 ) ) ( not ( = ?auto_1278082 ?auto_1278086 ) ) ( not ( = ?auto_1278082 ?auto_1278087 ) ) ( not ( = ?auto_1278082 ?auto_1278088 ) ) ( not ( = ?auto_1278082 ?auto_1278089 ) ) ( not ( = ?auto_1278084 ?auto_1278085 ) ) ( not ( = ?auto_1278084 ?auto_1278086 ) ) ( not ( = ?auto_1278084 ?auto_1278087 ) ) ( not ( = ?auto_1278084 ?auto_1278088 ) ) ( not ( = ?auto_1278084 ?auto_1278089 ) ) ( not ( = ?auto_1278085 ?auto_1278086 ) ) ( not ( = ?auto_1278085 ?auto_1278087 ) ) ( not ( = ?auto_1278085 ?auto_1278088 ) ) ( not ( = ?auto_1278085 ?auto_1278089 ) ) ( not ( = ?auto_1278086 ?auto_1278087 ) ) ( not ( = ?auto_1278086 ?auto_1278088 ) ) ( not ( = ?auto_1278086 ?auto_1278089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1278087 ?auto_1278088 ?auto_1278089 )
      ( MAKE-10CRATE-VERIFY ?auto_1278079 ?auto_1278080 ?auto_1278081 ?auto_1278083 ?auto_1278082 ?auto_1278084 ?auto_1278085 ?auto_1278086 ?auto_1278087 ?auto_1278088 ?auto_1278089 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1278184 - SURFACE
      ?auto_1278185 - SURFACE
      ?auto_1278186 - SURFACE
      ?auto_1278188 - SURFACE
      ?auto_1278187 - SURFACE
      ?auto_1278189 - SURFACE
      ?auto_1278190 - SURFACE
      ?auto_1278191 - SURFACE
      ?auto_1278192 - SURFACE
      ?auto_1278193 - SURFACE
      ?auto_1278194 - SURFACE
    )
    :vars
    (
      ?auto_1278197 - HOIST
      ?auto_1278198 - PLACE
      ?auto_1278195 - TRUCK
      ?auto_1278196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1278197 ?auto_1278198 ) ( SURFACE-AT ?auto_1278193 ?auto_1278198 ) ( CLEAR ?auto_1278193 ) ( IS-CRATE ?auto_1278194 ) ( not ( = ?auto_1278193 ?auto_1278194 ) ) ( AVAILABLE ?auto_1278197 ) ( IN ?auto_1278194 ?auto_1278195 ) ( ON ?auto_1278193 ?auto_1278192 ) ( not ( = ?auto_1278192 ?auto_1278193 ) ) ( not ( = ?auto_1278192 ?auto_1278194 ) ) ( TRUCK-AT ?auto_1278195 ?auto_1278196 ) ( not ( = ?auto_1278196 ?auto_1278198 ) ) ( ON ?auto_1278185 ?auto_1278184 ) ( ON ?auto_1278186 ?auto_1278185 ) ( ON ?auto_1278188 ?auto_1278186 ) ( ON ?auto_1278187 ?auto_1278188 ) ( ON ?auto_1278189 ?auto_1278187 ) ( ON ?auto_1278190 ?auto_1278189 ) ( ON ?auto_1278191 ?auto_1278190 ) ( ON ?auto_1278192 ?auto_1278191 ) ( not ( = ?auto_1278184 ?auto_1278185 ) ) ( not ( = ?auto_1278184 ?auto_1278186 ) ) ( not ( = ?auto_1278184 ?auto_1278188 ) ) ( not ( = ?auto_1278184 ?auto_1278187 ) ) ( not ( = ?auto_1278184 ?auto_1278189 ) ) ( not ( = ?auto_1278184 ?auto_1278190 ) ) ( not ( = ?auto_1278184 ?auto_1278191 ) ) ( not ( = ?auto_1278184 ?auto_1278192 ) ) ( not ( = ?auto_1278184 ?auto_1278193 ) ) ( not ( = ?auto_1278184 ?auto_1278194 ) ) ( not ( = ?auto_1278185 ?auto_1278186 ) ) ( not ( = ?auto_1278185 ?auto_1278188 ) ) ( not ( = ?auto_1278185 ?auto_1278187 ) ) ( not ( = ?auto_1278185 ?auto_1278189 ) ) ( not ( = ?auto_1278185 ?auto_1278190 ) ) ( not ( = ?auto_1278185 ?auto_1278191 ) ) ( not ( = ?auto_1278185 ?auto_1278192 ) ) ( not ( = ?auto_1278185 ?auto_1278193 ) ) ( not ( = ?auto_1278185 ?auto_1278194 ) ) ( not ( = ?auto_1278186 ?auto_1278188 ) ) ( not ( = ?auto_1278186 ?auto_1278187 ) ) ( not ( = ?auto_1278186 ?auto_1278189 ) ) ( not ( = ?auto_1278186 ?auto_1278190 ) ) ( not ( = ?auto_1278186 ?auto_1278191 ) ) ( not ( = ?auto_1278186 ?auto_1278192 ) ) ( not ( = ?auto_1278186 ?auto_1278193 ) ) ( not ( = ?auto_1278186 ?auto_1278194 ) ) ( not ( = ?auto_1278188 ?auto_1278187 ) ) ( not ( = ?auto_1278188 ?auto_1278189 ) ) ( not ( = ?auto_1278188 ?auto_1278190 ) ) ( not ( = ?auto_1278188 ?auto_1278191 ) ) ( not ( = ?auto_1278188 ?auto_1278192 ) ) ( not ( = ?auto_1278188 ?auto_1278193 ) ) ( not ( = ?auto_1278188 ?auto_1278194 ) ) ( not ( = ?auto_1278187 ?auto_1278189 ) ) ( not ( = ?auto_1278187 ?auto_1278190 ) ) ( not ( = ?auto_1278187 ?auto_1278191 ) ) ( not ( = ?auto_1278187 ?auto_1278192 ) ) ( not ( = ?auto_1278187 ?auto_1278193 ) ) ( not ( = ?auto_1278187 ?auto_1278194 ) ) ( not ( = ?auto_1278189 ?auto_1278190 ) ) ( not ( = ?auto_1278189 ?auto_1278191 ) ) ( not ( = ?auto_1278189 ?auto_1278192 ) ) ( not ( = ?auto_1278189 ?auto_1278193 ) ) ( not ( = ?auto_1278189 ?auto_1278194 ) ) ( not ( = ?auto_1278190 ?auto_1278191 ) ) ( not ( = ?auto_1278190 ?auto_1278192 ) ) ( not ( = ?auto_1278190 ?auto_1278193 ) ) ( not ( = ?auto_1278190 ?auto_1278194 ) ) ( not ( = ?auto_1278191 ?auto_1278192 ) ) ( not ( = ?auto_1278191 ?auto_1278193 ) ) ( not ( = ?auto_1278191 ?auto_1278194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1278192 ?auto_1278193 ?auto_1278194 )
      ( MAKE-10CRATE-VERIFY ?auto_1278184 ?auto_1278185 ?auto_1278186 ?auto_1278188 ?auto_1278187 ?auto_1278189 ?auto_1278190 ?auto_1278191 ?auto_1278192 ?auto_1278193 ?auto_1278194 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1278299 - SURFACE
      ?auto_1278300 - SURFACE
      ?auto_1278301 - SURFACE
      ?auto_1278303 - SURFACE
      ?auto_1278302 - SURFACE
      ?auto_1278304 - SURFACE
      ?auto_1278305 - SURFACE
      ?auto_1278306 - SURFACE
      ?auto_1278307 - SURFACE
      ?auto_1278308 - SURFACE
      ?auto_1278309 - SURFACE
    )
    :vars
    (
      ?auto_1278314 - HOIST
      ?auto_1278312 - PLACE
      ?auto_1278311 - TRUCK
      ?auto_1278310 - PLACE
      ?auto_1278313 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1278314 ?auto_1278312 ) ( SURFACE-AT ?auto_1278308 ?auto_1278312 ) ( CLEAR ?auto_1278308 ) ( IS-CRATE ?auto_1278309 ) ( not ( = ?auto_1278308 ?auto_1278309 ) ) ( AVAILABLE ?auto_1278314 ) ( ON ?auto_1278308 ?auto_1278307 ) ( not ( = ?auto_1278307 ?auto_1278308 ) ) ( not ( = ?auto_1278307 ?auto_1278309 ) ) ( TRUCK-AT ?auto_1278311 ?auto_1278310 ) ( not ( = ?auto_1278310 ?auto_1278312 ) ) ( HOIST-AT ?auto_1278313 ?auto_1278310 ) ( LIFTING ?auto_1278313 ?auto_1278309 ) ( not ( = ?auto_1278314 ?auto_1278313 ) ) ( ON ?auto_1278300 ?auto_1278299 ) ( ON ?auto_1278301 ?auto_1278300 ) ( ON ?auto_1278303 ?auto_1278301 ) ( ON ?auto_1278302 ?auto_1278303 ) ( ON ?auto_1278304 ?auto_1278302 ) ( ON ?auto_1278305 ?auto_1278304 ) ( ON ?auto_1278306 ?auto_1278305 ) ( ON ?auto_1278307 ?auto_1278306 ) ( not ( = ?auto_1278299 ?auto_1278300 ) ) ( not ( = ?auto_1278299 ?auto_1278301 ) ) ( not ( = ?auto_1278299 ?auto_1278303 ) ) ( not ( = ?auto_1278299 ?auto_1278302 ) ) ( not ( = ?auto_1278299 ?auto_1278304 ) ) ( not ( = ?auto_1278299 ?auto_1278305 ) ) ( not ( = ?auto_1278299 ?auto_1278306 ) ) ( not ( = ?auto_1278299 ?auto_1278307 ) ) ( not ( = ?auto_1278299 ?auto_1278308 ) ) ( not ( = ?auto_1278299 ?auto_1278309 ) ) ( not ( = ?auto_1278300 ?auto_1278301 ) ) ( not ( = ?auto_1278300 ?auto_1278303 ) ) ( not ( = ?auto_1278300 ?auto_1278302 ) ) ( not ( = ?auto_1278300 ?auto_1278304 ) ) ( not ( = ?auto_1278300 ?auto_1278305 ) ) ( not ( = ?auto_1278300 ?auto_1278306 ) ) ( not ( = ?auto_1278300 ?auto_1278307 ) ) ( not ( = ?auto_1278300 ?auto_1278308 ) ) ( not ( = ?auto_1278300 ?auto_1278309 ) ) ( not ( = ?auto_1278301 ?auto_1278303 ) ) ( not ( = ?auto_1278301 ?auto_1278302 ) ) ( not ( = ?auto_1278301 ?auto_1278304 ) ) ( not ( = ?auto_1278301 ?auto_1278305 ) ) ( not ( = ?auto_1278301 ?auto_1278306 ) ) ( not ( = ?auto_1278301 ?auto_1278307 ) ) ( not ( = ?auto_1278301 ?auto_1278308 ) ) ( not ( = ?auto_1278301 ?auto_1278309 ) ) ( not ( = ?auto_1278303 ?auto_1278302 ) ) ( not ( = ?auto_1278303 ?auto_1278304 ) ) ( not ( = ?auto_1278303 ?auto_1278305 ) ) ( not ( = ?auto_1278303 ?auto_1278306 ) ) ( not ( = ?auto_1278303 ?auto_1278307 ) ) ( not ( = ?auto_1278303 ?auto_1278308 ) ) ( not ( = ?auto_1278303 ?auto_1278309 ) ) ( not ( = ?auto_1278302 ?auto_1278304 ) ) ( not ( = ?auto_1278302 ?auto_1278305 ) ) ( not ( = ?auto_1278302 ?auto_1278306 ) ) ( not ( = ?auto_1278302 ?auto_1278307 ) ) ( not ( = ?auto_1278302 ?auto_1278308 ) ) ( not ( = ?auto_1278302 ?auto_1278309 ) ) ( not ( = ?auto_1278304 ?auto_1278305 ) ) ( not ( = ?auto_1278304 ?auto_1278306 ) ) ( not ( = ?auto_1278304 ?auto_1278307 ) ) ( not ( = ?auto_1278304 ?auto_1278308 ) ) ( not ( = ?auto_1278304 ?auto_1278309 ) ) ( not ( = ?auto_1278305 ?auto_1278306 ) ) ( not ( = ?auto_1278305 ?auto_1278307 ) ) ( not ( = ?auto_1278305 ?auto_1278308 ) ) ( not ( = ?auto_1278305 ?auto_1278309 ) ) ( not ( = ?auto_1278306 ?auto_1278307 ) ) ( not ( = ?auto_1278306 ?auto_1278308 ) ) ( not ( = ?auto_1278306 ?auto_1278309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1278307 ?auto_1278308 ?auto_1278309 )
      ( MAKE-10CRATE-VERIFY ?auto_1278299 ?auto_1278300 ?auto_1278301 ?auto_1278303 ?auto_1278302 ?auto_1278304 ?auto_1278305 ?auto_1278306 ?auto_1278307 ?auto_1278308 ?auto_1278309 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1278424 - SURFACE
      ?auto_1278425 - SURFACE
      ?auto_1278426 - SURFACE
      ?auto_1278428 - SURFACE
      ?auto_1278427 - SURFACE
      ?auto_1278429 - SURFACE
      ?auto_1278430 - SURFACE
      ?auto_1278431 - SURFACE
      ?auto_1278432 - SURFACE
      ?auto_1278433 - SURFACE
      ?auto_1278434 - SURFACE
    )
    :vars
    (
      ?auto_1278439 - HOIST
      ?auto_1278435 - PLACE
      ?auto_1278436 - TRUCK
      ?auto_1278437 - PLACE
      ?auto_1278440 - HOIST
      ?auto_1278438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1278439 ?auto_1278435 ) ( SURFACE-AT ?auto_1278433 ?auto_1278435 ) ( CLEAR ?auto_1278433 ) ( IS-CRATE ?auto_1278434 ) ( not ( = ?auto_1278433 ?auto_1278434 ) ) ( AVAILABLE ?auto_1278439 ) ( ON ?auto_1278433 ?auto_1278432 ) ( not ( = ?auto_1278432 ?auto_1278433 ) ) ( not ( = ?auto_1278432 ?auto_1278434 ) ) ( TRUCK-AT ?auto_1278436 ?auto_1278437 ) ( not ( = ?auto_1278437 ?auto_1278435 ) ) ( HOIST-AT ?auto_1278440 ?auto_1278437 ) ( not ( = ?auto_1278439 ?auto_1278440 ) ) ( AVAILABLE ?auto_1278440 ) ( SURFACE-AT ?auto_1278434 ?auto_1278437 ) ( ON ?auto_1278434 ?auto_1278438 ) ( CLEAR ?auto_1278434 ) ( not ( = ?auto_1278433 ?auto_1278438 ) ) ( not ( = ?auto_1278434 ?auto_1278438 ) ) ( not ( = ?auto_1278432 ?auto_1278438 ) ) ( ON ?auto_1278425 ?auto_1278424 ) ( ON ?auto_1278426 ?auto_1278425 ) ( ON ?auto_1278428 ?auto_1278426 ) ( ON ?auto_1278427 ?auto_1278428 ) ( ON ?auto_1278429 ?auto_1278427 ) ( ON ?auto_1278430 ?auto_1278429 ) ( ON ?auto_1278431 ?auto_1278430 ) ( ON ?auto_1278432 ?auto_1278431 ) ( not ( = ?auto_1278424 ?auto_1278425 ) ) ( not ( = ?auto_1278424 ?auto_1278426 ) ) ( not ( = ?auto_1278424 ?auto_1278428 ) ) ( not ( = ?auto_1278424 ?auto_1278427 ) ) ( not ( = ?auto_1278424 ?auto_1278429 ) ) ( not ( = ?auto_1278424 ?auto_1278430 ) ) ( not ( = ?auto_1278424 ?auto_1278431 ) ) ( not ( = ?auto_1278424 ?auto_1278432 ) ) ( not ( = ?auto_1278424 ?auto_1278433 ) ) ( not ( = ?auto_1278424 ?auto_1278434 ) ) ( not ( = ?auto_1278424 ?auto_1278438 ) ) ( not ( = ?auto_1278425 ?auto_1278426 ) ) ( not ( = ?auto_1278425 ?auto_1278428 ) ) ( not ( = ?auto_1278425 ?auto_1278427 ) ) ( not ( = ?auto_1278425 ?auto_1278429 ) ) ( not ( = ?auto_1278425 ?auto_1278430 ) ) ( not ( = ?auto_1278425 ?auto_1278431 ) ) ( not ( = ?auto_1278425 ?auto_1278432 ) ) ( not ( = ?auto_1278425 ?auto_1278433 ) ) ( not ( = ?auto_1278425 ?auto_1278434 ) ) ( not ( = ?auto_1278425 ?auto_1278438 ) ) ( not ( = ?auto_1278426 ?auto_1278428 ) ) ( not ( = ?auto_1278426 ?auto_1278427 ) ) ( not ( = ?auto_1278426 ?auto_1278429 ) ) ( not ( = ?auto_1278426 ?auto_1278430 ) ) ( not ( = ?auto_1278426 ?auto_1278431 ) ) ( not ( = ?auto_1278426 ?auto_1278432 ) ) ( not ( = ?auto_1278426 ?auto_1278433 ) ) ( not ( = ?auto_1278426 ?auto_1278434 ) ) ( not ( = ?auto_1278426 ?auto_1278438 ) ) ( not ( = ?auto_1278428 ?auto_1278427 ) ) ( not ( = ?auto_1278428 ?auto_1278429 ) ) ( not ( = ?auto_1278428 ?auto_1278430 ) ) ( not ( = ?auto_1278428 ?auto_1278431 ) ) ( not ( = ?auto_1278428 ?auto_1278432 ) ) ( not ( = ?auto_1278428 ?auto_1278433 ) ) ( not ( = ?auto_1278428 ?auto_1278434 ) ) ( not ( = ?auto_1278428 ?auto_1278438 ) ) ( not ( = ?auto_1278427 ?auto_1278429 ) ) ( not ( = ?auto_1278427 ?auto_1278430 ) ) ( not ( = ?auto_1278427 ?auto_1278431 ) ) ( not ( = ?auto_1278427 ?auto_1278432 ) ) ( not ( = ?auto_1278427 ?auto_1278433 ) ) ( not ( = ?auto_1278427 ?auto_1278434 ) ) ( not ( = ?auto_1278427 ?auto_1278438 ) ) ( not ( = ?auto_1278429 ?auto_1278430 ) ) ( not ( = ?auto_1278429 ?auto_1278431 ) ) ( not ( = ?auto_1278429 ?auto_1278432 ) ) ( not ( = ?auto_1278429 ?auto_1278433 ) ) ( not ( = ?auto_1278429 ?auto_1278434 ) ) ( not ( = ?auto_1278429 ?auto_1278438 ) ) ( not ( = ?auto_1278430 ?auto_1278431 ) ) ( not ( = ?auto_1278430 ?auto_1278432 ) ) ( not ( = ?auto_1278430 ?auto_1278433 ) ) ( not ( = ?auto_1278430 ?auto_1278434 ) ) ( not ( = ?auto_1278430 ?auto_1278438 ) ) ( not ( = ?auto_1278431 ?auto_1278432 ) ) ( not ( = ?auto_1278431 ?auto_1278433 ) ) ( not ( = ?auto_1278431 ?auto_1278434 ) ) ( not ( = ?auto_1278431 ?auto_1278438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1278432 ?auto_1278433 ?auto_1278434 )
      ( MAKE-10CRATE-VERIFY ?auto_1278424 ?auto_1278425 ?auto_1278426 ?auto_1278428 ?auto_1278427 ?auto_1278429 ?auto_1278430 ?auto_1278431 ?auto_1278432 ?auto_1278433 ?auto_1278434 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1278550 - SURFACE
      ?auto_1278551 - SURFACE
      ?auto_1278552 - SURFACE
      ?auto_1278554 - SURFACE
      ?auto_1278553 - SURFACE
      ?auto_1278555 - SURFACE
      ?auto_1278556 - SURFACE
      ?auto_1278557 - SURFACE
      ?auto_1278558 - SURFACE
      ?auto_1278559 - SURFACE
      ?auto_1278560 - SURFACE
    )
    :vars
    (
      ?auto_1278561 - HOIST
      ?auto_1278566 - PLACE
      ?auto_1278564 - PLACE
      ?auto_1278563 - HOIST
      ?auto_1278565 - SURFACE
      ?auto_1278562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1278561 ?auto_1278566 ) ( SURFACE-AT ?auto_1278559 ?auto_1278566 ) ( CLEAR ?auto_1278559 ) ( IS-CRATE ?auto_1278560 ) ( not ( = ?auto_1278559 ?auto_1278560 ) ) ( AVAILABLE ?auto_1278561 ) ( ON ?auto_1278559 ?auto_1278558 ) ( not ( = ?auto_1278558 ?auto_1278559 ) ) ( not ( = ?auto_1278558 ?auto_1278560 ) ) ( not ( = ?auto_1278564 ?auto_1278566 ) ) ( HOIST-AT ?auto_1278563 ?auto_1278564 ) ( not ( = ?auto_1278561 ?auto_1278563 ) ) ( AVAILABLE ?auto_1278563 ) ( SURFACE-AT ?auto_1278560 ?auto_1278564 ) ( ON ?auto_1278560 ?auto_1278565 ) ( CLEAR ?auto_1278560 ) ( not ( = ?auto_1278559 ?auto_1278565 ) ) ( not ( = ?auto_1278560 ?auto_1278565 ) ) ( not ( = ?auto_1278558 ?auto_1278565 ) ) ( TRUCK-AT ?auto_1278562 ?auto_1278566 ) ( ON ?auto_1278551 ?auto_1278550 ) ( ON ?auto_1278552 ?auto_1278551 ) ( ON ?auto_1278554 ?auto_1278552 ) ( ON ?auto_1278553 ?auto_1278554 ) ( ON ?auto_1278555 ?auto_1278553 ) ( ON ?auto_1278556 ?auto_1278555 ) ( ON ?auto_1278557 ?auto_1278556 ) ( ON ?auto_1278558 ?auto_1278557 ) ( not ( = ?auto_1278550 ?auto_1278551 ) ) ( not ( = ?auto_1278550 ?auto_1278552 ) ) ( not ( = ?auto_1278550 ?auto_1278554 ) ) ( not ( = ?auto_1278550 ?auto_1278553 ) ) ( not ( = ?auto_1278550 ?auto_1278555 ) ) ( not ( = ?auto_1278550 ?auto_1278556 ) ) ( not ( = ?auto_1278550 ?auto_1278557 ) ) ( not ( = ?auto_1278550 ?auto_1278558 ) ) ( not ( = ?auto_1278550 ?auto_1278559 ) ) ( not ( = ?auto_1278550 ?auto_1278560 ) ) ( not ( = ?auto_1278550 ?auto_1278565 ) ) ( not ( = ?auto_1278551 ?auto_1278552 ) ) ( not ( = ?auto_1278551 ?auto_1278554 ) ) ( not ( = ?auto_1278551 ?auto_1278553 ) ) ( not ( = ?auto_1278551 ?auto_1278555 ) ) ( not ( = ?auto_1278551 ?auto_1278556 ) ) ( not ( = ?auto_1278551 ?auto_1278557 ) ) ( not ( = ?auto_1278551 ?auto_1278558 ) ) ( not ( = ?auto_1278551 ?auto_1278559 ) ) ( not ( = ?auto_1278551 ?auto_1278560 ) ) ( not ( = ?auto_1278551 ?auto_1278565 ) ) ( not ( = ?auto_1278552 ?auto_1278554 ) ) ( not ( = ?auto_1278552 ?auto_1278553 ) ) ( not ( = ?auto_1278552 ?auto_1278555 ) ) ( not ( = ?auto_1278552 ?auto_1278556 ) ) ( not ( = ?auto_1278552 ?auto_1278557 ) ) ( not ( = ?auto_1278552 ?auto_1278558 ) ) ( not ( = ?auto_1278552 ?auto_1278559 ) ) ( not ( = ?auto_1278552 ?auto_1278560 ) ) ( not ( = ?auto_1278552 ?auto_1278565 ) ) ( not ( = ?auto_1278554 ?auto_1278553 ) ) ( not ( = ?auto_1278554 ?auto_1278555 ) ) ( not ( = ?auto_1278554 ?auto_1278556 ) ) ( not ( = ?auto_1278554 ?auto_1278557 ) ) ( not ( = ?auto_1278554 ?auto_1278558 ) ) ( not ( = ?auto_1278554 ?auto_1278559 ) ) ( not ( = ?auto_1278554 ?auto_1278560 ) ) ( not ( = ?auto_1278554 ?auto_1278565 ) ) ( not ( = ?auto_1278553 ?auto_1278555 ) ) ( not ( = ?auto_1278553 ?auto_1278556 ) ) ( not ( = ?auto_1278553 ?auto_1278557 ) ) ( not ( = ?auto_1278553 ?auto_1278558 ) ) ( not ( = ?auto_1278553 ?auto_1278559 ) ) ( not ( = ?auto_1278553 ?auto_1278560 ) ) ( not ( = ?auto_1278553 ?auto_1278565 ) ) ( not ( = ?auto_1278555 ?auto_1278556 ) ) ( not ( = ?auto_1278555 ?auto_1278557 ) ) ( not ( = ?auto_1278555 ?auto_1278558 ) ) ( not ( = ?auto_1278555 ?auto_1278559 ) ) ( not ( = ?auto_1278555 ?auto_1278560 ) ) ( not ( = ?auto_1278555 ?auto_1278565 ) ) ( not ( = ?auto_1278556 ?auto_1278557 ) ) ( not ( = ?auto_1278556 ?auto_1278558 ) ) ( not ( = ?auto_1278556 ?auto_1278559 ) ) ( not ( = ?auto_1278556 ?auto_1278560 ) ) ( not ( = ?auto_1278556 ?auto_1278565 ) ) ( not ( = ?auto_1278557 ?auto_1278558 ) ) ( not ( = ?auto_1278557 ?auto_1278559 ) ) ( not ( = ?auto_1278557 ?auto_1278560 ) ) ( not ( = ?auto_1278557 ?auto_1278565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1278558 ?auto_1278559 ?auto_1278560 )
      ( MAKE-10CRATE-VERIFY ?auto_1278550 ?auto_1278551 ?auto_1278552 ?auto_1278554 ?auto_1278553 ?auto_1278555 ?auto_1278556 ?auto_1278557 ?auto_1278558 ?auto_1278559 ?auto_1278560 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1278676 - SURFACE
      ?auto_1278677 - SURFACE
      ?auto_1278678 - SURFACE
      ?auto_1278680 - SURFACE
      ?auto_1278679 - SURFACE
      ?auto_1278681 - SURFACE
      ?auto_1278682 - SURFACE
      ?auto_1278683 - SURFACE
      ?auto_1278684 - SURFACE
      ?auto_1278685 - SURFACE
      ?auto_1278686 - SURFACE
    )
    :vars
    (
      ?auto_1278687 - HOIST
      ?auto_1278691 - PLACE
      ?auto_1278692 - PLACE
      ?auto_1278688 - HOIST
      ?auto_1278689 - SURFACE
      ?auto_1278690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1278687 ?auto_1278691 ) ( IS-CRATE ?auto_1278686 ) ( not ( = ?auto_1278685 ?auto_1278686 ) ) ( not ( = ?auto_1278684 ?auto_1278685 ) ) ( not ( = ?auto_1278684 ?auto_1278686 ) ) ( not ( = ?auto_1278692 ?auto_1278691 ) ) ( HOIST-AT ?auto_1278688 ?auto_1278692 ) ( not ( = ?auto_1278687 ?auto_1278688 ) ) ( AVAILABLE ?auto_1278688 ) ( SURFACE-AT ?auto_1278686 ?auto_1278692 ) ( ON ?auto_1278686 ?auto_1278689 ) ( CLEAR ?auto_1278686 ) ( not ( = ?auto_1278685 ?auto_1278689 ) ) ( not ( = ?auto_1278686 ?auto_1278689 ) ) ( not ( = ?auto_1278684 ?auto_1278689 ) ) ( TRUCK-AT ?auto_1278690 ?auto_1278691 ) ( SURFACE-AT ?auto_1278684 ?auto_1278691 ) ( CLEAR ?auto_1278684 ) ( LIFTING ?auto_1278687 ?auto_1278685 ) ( IS-CRATE ?auto_1278685 ) ( ON ?auto_1278677 ?auto_1278676 ) ( ON ?auto_1278678 ?auto_1278677 ) ( ON ?auto_1278680 ?auto_1278678 ) ( ON ?auto_1278679 ?auto_1278680 ) ( ON ?auto_1278681 ?auto_1278679 ) ( ON ?auto_1278682 ?auto_1278681 ) ( ON ?auto_1278683 ?auto_1278682 ) ( ON ?auto_1278684 ?auto_1278683 ) ( not ( = ?auto_1278676 ?auto_1278677 ) ) ( not ( = ?auto_1278676 ?auto_1278678 ) ) ( not ( = ?auto_1278676 ?auto_1278680 ) ) ( not ( = ?auto_1278676 ?auto_1278679 ) ) ( not ( = ?auto_1278676 ?auto_1278681 ) ) ( not ( = ?auto_1278676 ?auto_1278682 ) ) ( not ( = ?auto_1278676 ?auto_1278683 ) ) ( not ( = ?auto_1278676 ?auto_1278684 ) ) ( not ( = ?auto_1278676 ?auto_1278685 ) ) ( not ( = ?auto_1278676 ?auto_1278686 ) ) ( not ( = ?auto_1278676 ?auto_1278689 ) ) ( not ( = ?auto_1278677 ?auto_1278678 ) ) ( not ( = ?auto_1278677 ?auto_1278680 ) ) ( not ( = ?auto_1278677 ?auto_1278679 ) ) ( not ( = ?auto_1278677 ?auto_1278681 ) ) ( not ( = ?auto_1278677 ?auto_1278682 ) ) ( not ( = ?auto_1278677 ?auto_1278683 ) ) ( not ( = ?auto_1278677 ?auto_1278684 ) ) ( not ( = ?auto_1278677 ?auto_1278685 ) ) ( not ( = ?auto_1278677 ?auto_1278686 ) ) ( not ( = ?auto_1278677 ?auto_1278689 ) ) ( not ( = ?auto_1278678 ?auto_1278680 ) ) ( not ( = ?auto_1278678 ?auto_1278679 ) ) ( not ( = ?auto_1278678 ?auto_1278681 ) ) ( not ( = ?auto_1278678 ?auto_1278682 ) ) ( not ( = ?auto_1278678 ?auto_1278683 ) ) ( not ( = ?auto_1278678 ?auto_1278684 ) ) ( not ( = ?auto_1278678 ?auto_1278685 ) ) ( not ( = ?auto_1278678 ?auto_1278686 ) ) ( not ( = ?auto_1278678 ?auto_1278689 ) ) ( not ( = ?auto_1278680 ?auto_1278679 ) ) ( not ( = ?auto_1278680 ?auto_1278681 ) ) ( not ( = ?auto_1278680 ?auto_1278682 ) ) ( not ( = ?auto_1278680 ?auto_1278683 ) ) ( not ( = ?auto_1278680 ?auto_1278684 ) ) ( not ( = ?auto_1278680 ?auto_1278685 ) ) ( not ( = ?auto_1278680 ?auto_1278686 ) ) ( not ( = ?auto_1278680 ?auto_1278689 ) ) ( not ( = ?auto_1278679 ?auto_1278681 ) ) ( not ( = ?auto_1278679 ?auto_1278682 ) ) ( not ( = ?auto_1278679 ?auto_1278683 ) ) ( not ( = ?auto_1278679 ?auto_1278684 ) ) ( not ( = ?auto_1278679 ?auto_1278685 ) ) ( not ( = ?auto_1278679 ?auto_1278686 ) ) ( not ( = ?auto_1278679 ?auto_1278689 ) ) ( not ( = ?auto_1278681 ?auto_1278682 ) ) ( not ( = ?auto_1278681 ?auto_1278683 ) ) ( not ( = ?auto_1278681 ?auto_1278684 ) ) ( not ( = ?auto_1278681 ?auto_1278685 ) ) ( not ( = ?auto_1278681 ?auto_1278686 ) ) ( not ( = ?auto_1278681 ?auto_1278689 ) ) ( not ( = ?auto_1278682 ?auto_1278683 ) ) ( not ( = ?auto_1278682 ?auto_1278684 ) ) ( not ( = ?auto_1278682 ?auto_1278685 ) ) ( not ( = ?auto_1278682 ?auto_1278686 ) ) ( not ( = ?auto_1278682 ?auto_1278689 ) ) ( not ( = ?auto_1278683 ?auto_1278684 ) ) ( not ( = ?auto_1278683 ?auto_1278685 ) ) ( not ( = ?auto_1278683 ?auto_1278686 ) ) ( not ( = ?auto_1278683 ?auto_1278689 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1278684 ?auto_1278685 ?auto_1278686 )
      ( MAKE-10CRATE-VERIFY ?auto_1278676 ?auto_1278677 ?auto_1278678 ?auto_1278680 ?auto_1278679 ?auto_1278681 ?auto_1278682 ?auto_1278683 ?auto_1278684 ?auto_1278685 ?auto_1278686 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1278802 - SURFACE
      ?auto_1278803 - SURFACE
      ?auto_1278804 - SURFACE
      ?auto_1278806 - SURFACE
      ?auto_1278805 - SURFACE
      ?auto_1278807 - SURFACE
      ?auto_1278808 - SURFACE
      ?auto_1278809 - SURFACE
      ?auto_1278810 - SURFACE
      ?auto_1278811 - SURFACE
      ?auto_1278812 - SURFACE
    )
    :vars
    (
      ?auto_1278818 - HOIST
      ?auto_1278817 - PLACE
      ?auto_1278815 - PLACE
      ?auto_1278814 - HOIST
      ?auto_1278813 - SURFACE
      ?auto_1278816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1278818 ?auto_1278817 ) ( IS-CRATE ?auto_1278812 ) ( not ( = ?auto_1278811 ?auto_1278812 ) ) ( not ( = ?auto_1278810 ?auto_1278811 ) ) ( not ( = ?auto_1278810 ?auto_1278812 ) ) ( not ( = ?auto_1278815 ?auto_1278817 ) ) ( HOIST-AT ?auto_1278814 ?auto_1278815 ) ( not ( = ?auto_1278818 ?auto_1278814 ) ) ( AVAILABLE ?auto_1278814 ) ( SURFACE-AT ?auto_1278812 ?auto_1278815 ) ( ON ?auto_1278812 ?auto_1278813 ) ( CLEAR ?auto_1278812 ) ( not ( = ?auto_1278811 ?auto_1278813 ) ) ( not ( = ?auto_1278812 ?auto_1278813 ) ) ( not ( = ?auto_1278810 ?auto_1278813 ) ) ( TRUCK-AT ?auto_1278816 ?auto_1278817 ) ( SURFACE-AT ?auto_1278810 ?auto_1278817 ) ( CLEAR ?auto_1278810 ) ( IS-CRATE ?auto_1278811 ) ( AVAILABLE ?auto_1278818 ) ( IN ?auto_1278811 ?auto_1278816 ) ( ON ?auto_1278803 ?auto_1278802 ) ( ON ?auto_1278804 ?auto_1278803 ) ( ON ?auto_1278806 ?auto_1278804 ) ( ON ?auto_1278805 ?auto_1278806 ) ( ON ?auto_1278807 ?auto_1278805 ) ( ON ?auto_1278808 ?auto_1278807 ) ( ON ?auto_1278809 ?auto_1278808 ) ( ON ?auto_1278810 ?auto_1278809 ) ( not ( = ?auto_1278802 ?auto_1278803 ) ) ( not ( = ?auto_1278802 ?auto_1278804 ) ) ( not ( = ?auto_1278802 ?auto_1278806 ) ) ( not ( = ?auto_1278802 ?auto_1278805 ) ) ( not ( = ?auto_1278802 ?auto_1278807 ) ) ( not ( = ?auto_1278802 ?auto_1278808 ) ) ( not ( = ?auto_1278802 ?auto_1278809 ) ) ( not ( = ?auto_1278802 ?auto_1278810 ) ) ( not ( = ?auto_1278802 ?auto_1278811 ) ) ( not ( = ?auto_1278802 ?auto_1278812 ) ) ( not ( = ?auto_1278802 ?auto_1278813 ) ) ( not ( = ?auto_1278803 ?auto_1278804 ) ) ( not ( = ?auto_1278803 ?auto_1278806 ) ) ( not ( = ?auto_1278803 ?auto_1278805 ) ) ( not ( = ?auto_1278803 ?auto_1278807 ) ) ( not ( = ?auto_1278803 ?auto_1278808 ) ) ( not ( = ?auto_1278803 ?auto_1278809 ) ) ( not ( = ?auto_1278803 ?auto_1278810 ) ) ( not ( = ?auto_1278803 ?auto_1278811 ) ) ( not ( = ?auto_1278803 ?auto_1278812 ) ) ( not ( = ?auto_1278803 ?auto_1278813 ) ) ( not ( = ?auto_1278804 ?auto_1278806 ) ) ( not ( = ?auto_1278804 ?auto_1278805 ) ) ( not ( = ?auto_1278804 ?auto_1278807 ) ) ( not ( = ?auto_1278804 ?auto_1278808 ) ) ( not ( = ?auto_1278804 ?auto_1278809 ) ) ( not ( = ?auto_1278804 ?auto_1278810 ) ) ( not ( = ?auto_1278804 ?auto_1278811 ) ) ( not ( = ?auto_1278804 ?auto_1278812 ) ) ( not ( = ?auto_1278804 ?auto_1278813 ) ) ( not ( = ?auto_1278806 ?auto_1278805 ) ) ( not ( = ?auto_1278806 ?auto_1278807 ) ) ( not ( = ?auto_1278806 ?auto_1278808 ) ) ( not ( = ?auto_1278806 ?auto_1278809 ) ) ( not ( = ?auto_1278806 ?auto_1278810 ) ) ( not ( = ?auto_1278806 ?auto_1278811 ) ) ( not ( = ?auto_1278806 ?auto_1278812 ) ) ( not ( = ?auto_1278806 ?auto_1278813 ) ) ( not ( = ?auto_1278805 ?auto_1278807 ) ) ( not ( = ?auto_1278805 ?auto_1278808 ) ) ( not ( = ?auto_1278805 ?auto_1278809 ) ) ( not ( = ?auto_1278805 ?auto_1278810 ) ) ( not ( = ?auto_1278805 ?auto_1278811 ) ) ( not ( = ?auto_1278805 ?auto_1278812 ) ) ( not ( = ?auto_1278805 ?auto_1278813 ) ) ( not ( = ?auto_1278807 ?auto_1278808 ) ) ( not ( = ?auto_1278807 ?auto_1278809 ) ) ( not ( = ?auto_1278807 ?auto_1278810 ) ) ( not ( = ?auto_1278807 ?auto_1278811 ) ) ( not ( = ?auto_1278807 ?auto_1278812 ) ) ( not ( = ?auto_1278807 ?auto_1278813 ) ) ( not ( = ?auto_1278808 ?auto_1278809 ) ) ( not ( = ?auto_1278808 ?auto_1278810 ) ) ( not ( = ?auto_1278808 ?auto_1278811 ) ) ( not ( = ?auto_1278808 ?auto_1278812 ) ) ( not ( = ?auto_1278808 ?auto_1278813 ) ) ( not ( = ?auto_1278809 ?auto_1278810 ) ) ( not ( = ?auto_1278809 ?auto_1278811 ) ) ( not ( = ?auto_1278809 ?auto_1278812 ) ) ( not ( = ?auto_1278809 ?auto_1278813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1278810 ?auto_1278811 ?auto_1278812 )
      ( MAKE-10CRATE-VERIFY ?auto_1278802 ?auto_1278803 ?auto_1278804 ?auto_1278806 ?auto_1278805 ?auto_1278807 ?auto_1278808 ?auto_1278809 ?auto_1278810 ?auto_1278811 ?auto_1278812 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1286086 - SURFACE
      ?auto_1286087 - SURFACE
      ?auto_1286088 - SURFACE
      ?auto_1286090 - SURFACE
      ?auto_1286089 - SURFACE
      ?auto_1286091 - SURFACE
      ?auto_1286092 - SURFACE
      ?auto_1286093 - SURFACE
      ?auto_1286094 - SURFACE
      ?auto_1286095 - SURFACE
      ?auto_1286096 - SURFACE
      ?auto_1286097 - SURFACE
    )
    :vars
    (
      ?auto_1286099 - HOIST
      ?auto_1286098 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286099 ?auto_1286098 ) ( SURFACE-AT ?auto_1286096 ?auto_1286098 ) ( CLEAR ?auto_1286096 ) ( LIFTING ?auto_1286099 ?auto_1286097 ) ( IS-CRATE ?auto_1286097 ) ( not ( = ?auto_1286096 ?auto_1286097 ) ) ( ON ?auto_1286087 ?auto_1286086 ) ( ON ?auto_1286088 ?auto_1286087 ) ( ON ?auto_1286090 ?auto_1286088 ) ( ON ?auto_1286089 ?auto_1286090 ) ( ON ?auto_1286091 ?auto_1286089 ) ( ON ?auto_1286092 ?auto_1286091 ) ( ON ?auto_1286093 ?auto_1286092 ) ( ON ?auto_1286094 ?auto_1286093 ) ( ON ?auto_1286095 ?auto_1286094 ) ( ON ?auto_1286096 ?auto_1286095 ) ( not ( = ?auto_1286086 ?auto_1286087 ) ) ( not ( = ?auto_1286086 ?auto_1286088 ) ) ( not ( = ?auto_1286086 ?auto_1286090 ) ) ( not ( = ?auto_1286086 ?auto_1286089 ) ) ( not ( = ?auto_1286086 ?auto_1286091 ) ) ( not ( = ?auto_1286086 ?auto_1286092 ) ) ( not ( = ?auto_1286086 ?auto_1286093 ) ) ( not ( = ?auto_1286086 ?auto_1286094 ) ) ( not ( = ?auto_1286086 ?auto_1286095 ) ) ( not ( = ?auto_1286086 ?auto_1286096 ) ) ( not ( = ?auto_1286086 ?auto_1286097 ) ) ( not ( = ?auto_1286087 ?auto_1286088 ) ) ( not ( = ?auto_1286087 ?auto_1286090 ) ) ( not ( = ?auto_1286087 ?auto_1286089 ) ) ( not ( = ?auto_1286087 ?auto_1286091 ) ) ( not ( = ?auto_1286087 ?auto_1286092 ) ) ( not ( = ?auto_1286087 ?auto_1286093 ) ) ( not ( = ?auto_1286087 ?auto_1286094 ) ) ( not ( = ?auto_1286087 ?auto_1286095 ) ) ( not ( = ?auto_1286087 ?auto_1286096 ) ) ( not ( = ?auto_1286087 ?auto_1286097 ) ) ( not ( = ?auto_1286088 ?auto_1286090 ) ) ( not ( = ?auto_1286088 ?auto_1286089 ) ) ( not ( = ?auto_1286088 ?auto_1286091 ) ) ( not ( = ?auto_1286088 ?auto_1286092 ) ) ( not ( = ?auto_1286088 ?auto_1286093 ) ) ( not ( = ?auto_1286088 ?auto_1286094 ) ) ( not ( = ?auto_1286088 ?auto_1286095 ) ) ( not ( = ?auto_1286088 ?auto_1286096 ) ) ( not ( = ?auto_1286088 ?auto_1286097 ) ) ( not ( = ?auto_1286090 ?auto_1286089 ) ) ( not ( = ?auto_1286090 ?auto_1286091 ) ) ( not ( = ?auto_1286090 ?auto_1286092 ) ) ( not ( = ?auto_1286090 ?auto_1286093 ) ) ( not ( = ?auto_1286090 ?auto_1286094 ) ) ( not ( = ?auto_1286090 ?auto_1286095 ) ) ( not ( = ?auto_1286090 ?auto_1286096 ) ) ( not ( = ?auto_1286090 ?auto_1286097 ) ) ( not ( = ?auto_1286089 ?auto_1286091 ) ) ( not ( = ?auto_1286089 ?auto_1286092 ) ) ( not ( = ?auto_1286089 ?auto_1286093 ) ) ( not ( = ?auto_1286089 ?auto_1286094 ) ) ( not ( = ?auto_1286089 ?auto_1286095 ) ) ( not ( = ?auto_1286089 ?auto_1286096 ) ) ( not ( = ?auto_1286089 ?auto_1286097 ) ) ( not ( = ?auto_1286091 ?auto_1286092 ) ) ( not ( = ?auto_1286091 ?auto_1286093 ) ) ( not ( = ?auto_1286091 ?auto_1286094 ) ) ( not ( = ?auto_1286091 ?auto_1286095 ) ) ( not ( = ?auto_1286091 ?auto_1286096 ) ) ( not ( = ?auto_1286091 ?auto_1286097 ) ) ( not ( = ?auto_1286092 ?auto_1286093 ) ) ( not ( = ?auto_1286092 ?auto_1286094 ) ) ( not ( = ?auto_1286092 ?auto_1286095 ) ) ( not ( = ?auto_1286092 ?auto_1286096 ) ) ( not ( = ?auto_1286092 ?auto_1286097 ) ) ( not ( = ?auto_1286093 ?auto_1286094 ) ) ( not ( = ?auto_1286093 ?auto_1286095 ) ) ( not ( = ?auto_1286093 ?auto_1286096 ) ) ( not ( = ?auto_1286093 ?auto_1286097 ) ) ( not ( = ?auto_1286094 ?auto_1286095 ) ) ( not ( = ?auto_1286094 ?auto_1286096 ) ) ( not ( = ?auto_1286094 ?auto_1286097 ) ) ( not ( = ?auto_1286095 ?auto_1286096 ) ) ( not ( = ?auto_1286095 ?auto_1286097 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1286096 ?auto_1286097 )
      ( MAKE-11CRATE-VERIFY ?auto_1286086 ?auto_1286087 ?auto_1286088 ?auto_1286090 ?auto_1286089 ?auto_1286091 ?auto_1286092 ?auto_1286093 ?auto_1286094 ?auto_1286095 ?auto_1286096 ?auto_1286097 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1286195 - SURFACE
      ?auto_1286196 - SURFACE
      ?auto_1286197 - SURFACE
      ?auto_1286199 - SURFACE
      ?auto_1286198 - SURFACE
      ?auto_1286200 - SURFACE
      ?auto_1286201 - SURFACE
      ?auto_1286202 - SURFACE
      ?auto_1286203 - SURFACE
      ?auto_1286204 - SURFACE
      ?auto_1286205 - SURFACE
      ?auto_1286206 - SURFACE
    )
    :vars
    (
      ?auto_1286209 - HOIST
      ?auto_1286207 - PLACE
      ?auto_1286208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286209 ?auto_1286207 ) ( SURFACE-AT ?auto_1286205 ?auto_1286207 ) ( CLEAR ?auto_1286205 ) ( IS-CRATE ?auto_1286206 ) ( not ( = ?auto_1286205 ?auto_1286206 ) ) ( TRUCK-AT ?auto_1286208 ?auto_1286207 ) ( AVAILABLE ?auto_1286209 ) ( IN ?auto_1286206 ?auto_1286208 ) ( ON ?auto_1286205 ?auto_1286204 ) ( not ( = ?auto_1286204 ?auto_1286205 ) ) ( not ( = ?auto_1286204 ?auto_1286206 ) ) ( ON ?auto_1286196 ?auto_1286195 ) ( ON ?auto_1286197 ?auto_1286196 ) ( ON ?auto_1286199 ?auto_1286197 ) ( ON ?auto_1286198 ?auto_1286199 ) ( ON ?auto_1286200 ?auto_1286198 ) ( ON ?auto_1286201 ?auto_1286200 ) ( ON ?auto_1286202 ?auto_1286201 ) ( ON ?auto_1286203 ?auto_1286202 ) ( ON ?auto_1286204 ?auto_1286203 ) ( not ( = ?auto_1286195 ?auto_1286196 ) ) ( not ( = ?auto_1286195 ?auto_1286197 ) ) ( not ( = ?auto_1286195 ?auto_1286199 ) ) ( not ( = ?auto_1286195 ?auto_1286198 ) ) ( not ( = ?auto_1286195 ?auto_1286200 ) ) ( not ( = ?auto_1286195 ?auto_1286201 ) ) ( not ( = ?auto_1286195 ?auto_1286202 ) ) ( not ( = ?auto_1286195 ?auto_1286203 ) ) ( not ( = ?auto_1286195 ?auto_1286204 ) ) ( not ( = ?auto_1286195 ?auto_1286205 ) ) ( not ( = ?auto_1286195 ?auto_1286206 ) ) ( not ( = ?auto_1286196 ?auto_1286197 ) ) ( not ( = ?auto_1286196 ?auto_1286199 ) ) ( not ( = ?auto_1286196 ?auto_1286198 ) ) ( not ( = ?auto_1286196 ?auto_1286200 ) ) ( not ( = ?auto_1286196 ?auto_1286201 ) ) ( not ( = ?auto_1286196 ?auto_1286202 ) ) ( not ( = ?auto_1286196 ?auto_1286203 ) ) ( not ( = ?auto_1286196 ?auto_1286204 ) ) ( not ( = ?auto_1286196 ?auto_1286205 ) ) ( not ( = ?auto_1286196 ?auto_1286206 ) ) ( not ( = ?auto_1286197 ?auto_1286199 ) ) ( not ( = ?auto_1286197 ?auto_1286198 ) ) ( not ( = ?auto_1286197 ?auto_1286200 ) ) ( not ( = ?auto_1286197 ?auto_1286201 ) ) ( not ( = ?auto_1286197 ?auto_1286202 ) ) ( not ( = ?auto_1286197 ?auto_1286203 ) ) ( not ( = ?auto_1286197 ?auto_1286204 ) ) ( not ( = ?auto_1286197 ?auto_1286205 ) ) ( not ( = ?auto_1286197 ?auto_1286206 ) ) ( not ( = ?auto_1286199 ?auto_1286198 ) ) ( not ( = ?auto_1286199 ?auto_1286200 ) ) ( not ( = ?auto_1286199 ?auto_1286201 ) ) ( not ( = ?auto_1286199 ?auto_1286202 ) ) ( not ( = ?auto_1286199 ?auto_1286203 ) ) ( not ( = ?auto_1286199 ?auto_1286204 ) ) ( not ( = ?auto_1286199 ?auto_1286205 ) ) ( not ( = ?auto_1286199 ?auto_1286206 ) ) ( not ( = ?auto_1286198 ?auto_1286200 ) ) ( not ( = ?auto_1286198 ?auto_1286201 ) ) ( not ( = ?auto_1286198 ?auto_1286202 ) ) ( not ( = ?auto_1286198 ?auto_1286203 ) ) ( not ( = ?auto_1286198 ?auto_1286204 ) ) ( not ( = ?auto_1286198 ?auto_1286205 ) ) ( not ( = ?auto_1286198 ?auto_1286206 ) ) ( not ( = ?auto_1286200 ?auto_1286201 ) ) ( not ( = ?auto_1286200 ?auto_1286202 ) ) ( not ( = ?auto_1286200 ?auto_1286203 ) ) ( not ( = ?auto_1286200 ?auto_1286204 ) ) ( not ( = ?auto_1286200 ?auto_1286205 ) ) ( not ( = ?auto_1286200 ?auto_1286206 ) ) ( not ( = ?auto_1286201 ?auto_1286202 ) ) ( not ( = ?auto_1286201 ?auto_1286203 ) ) ( not ( = ?auto_1286201 ?auto_1286204 ) ) ( not ( = ?auto_1286201 ?auto_1286205 ) ) ( not ( = ?auto_1286201 ?auto_1286206 ) ) ( not ( = ?auto_1286202 ?auto_1286203 ) ) ( not ( = ?auto_1286202 ?auto_1286204 ) ) ( not ( = ?auto_1286202 ?auto_1286205 ) ) ( not ( = ?auto_1286202 ?auto_1286206 ) ) ( not ( = ?auto_1286203 ?auto_1286204 ) ) ( not ( = ?auto_1286203 ?auto_1286205 ) ) ( not ( = ?auto_1286203 ?auto_1286206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1286204 ?auto_1286205 ?auto_1286206 )
      ( MAKE-11CRATE-VERIFY ?auto_1286195 ?auto_1286196 ?auto_1286197 ?auto_1286199 ?auto_1286198 ?auto_1286200 ?auto_1286201 ?auto_1286202 ?auto_1286203 ?auto_1286204 ?auto_1286205 ?auto_1286206 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1286316 - SURFACE
      ?auto_1286317 - SURFACE
      ?auto_1286318 - SURFACE
      ?auto_1286320 - SURFACE
      ?auto_1286319 - SURFACE
      ?auto_1286321 - SURFACE
      ?auto_1286322 - SURFACE
      ?auto_1286323 - SURFACE
      ?auto_1286324 - SURFACE
      ?auto_1286325 - SURFACE
      ?auto_1286326 - SURFACE
      ?auto_1286327 - SURFACE
    )
    :vars
    (
      ?auto_1286331 - HOIST
      ?auto_1286328 - PLACE
      ?auto_1286329 - TRUCK
      ?auto_1286330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286331 ?auto_1286328 ) ( SURFACE-AT ?auto_1286326 ?auto_1286328 ) ( CLEAR ?auto_1286326 ) ( IS-CRATE ?auto_1286327 ) ( not ( = ?auto_1286326 ?auto_1286327 ) ) ( AVAILABLE ?auto_1286331 ) ( IN ?auto_1286327 ?auto_1286329 ) ( ON ?auto_1286326 ?auto_1286325 ) ( not ( = ?auto_1286325 ?auto_1286326 ) ) ( not ( = ?auto_1286325 ?auto_1286327 ) ) ( TRUCK-AT ?auto_1286329 ?auto_1286330 ) ( not ( = ?auto_1286330 ?auto_1286328 ) ) ( ON ?auto_1286317 ?auto_1286316 ) ( ON ?auto_1286318 ?auto_1286317 ) ( ON ?auto_1286320 ?auto_1286318 ) ( ON ?auto_1286319 ?auto_1286320 ) ( ON ?auto_1286321 ?auto_1286319 ) ( ON ?auto_1286322 ?auto_1286321 ) ( ON ?auto_1286323 ?auto_1286322 ) ( ON ?auto_1286324 ?auto_1286323 ) ( ON ?auto_1286325 ?auto_1286324 ) ( not ( = ?auto_1286316 ?auto_1286317 ) ) ( not ( = ?auto_1286316 ?auto_1286318 ) ) ( not ( = ?auto_1286316 ?auto_1286320 ) ) ( not ( = ?auto_1286316 ?auto_1286319 ) ) ( not ( = ?auto_1286316 ?auto_1286321 ) ) ( not ( = ?auto_1286316 ?auto_1286322 ) ) ( not ( = ?auto_1286316 ?auto_1286323 ) ) ( not ( = ?auto_1286316 ?auto_1286324 ) ) ( not ( = ?auto_1286316 ?auto_1286325 ) ) ( not ( = ?auto_1286316 ?auto_1286326 ) ) ( not ( = ?auto_1286316 ?auto_1286327 ) ) ( not ( = ?auto_1286317 ?auto_1286318 ) ) ( not ( = ?auto_1286317 ?auto_1286320 ) ) ( not ( = ?auto_1286317 ?auto_1286319 ) ) ( not ( = ?auto_1286317 ?auto_1286321 ) ) ( not ( = ?auto_1286317 ?auto_1286322 ) ) ( not ( = ?auto_1286317 ?auto_1286323 ) ) ( not ( = ?auto_1286317 ?auto_1286324 ) ) ( not ( = ?auto_1286317 ?auto_1286325 ) ) ( not ( = ?auto_1286317 ?auto_1286326 ) ) ( not ( = ?auto_1286317 ?auto_1286327 ) ) ( not ( = ?auto_1286318 ?auto_1286320 ) ) ( not ( = ?auto_1286318 ?auto_1286319 ) ) ( not ( = ?auto_1286318 ?auto_1286321 ) ) ( not ( = ?auto_1286318 ?auto_1286322 ) ) ( not ( = ?auto_1286318 ?auto_1286323 ) ) ( not ( = ?auto_1286318 ?auto_1286324 ) ) ( not ( = ?auto_1286318 ?auto_1286325 ) ) ( not ( = ?auto_1286318 ?auto_1286326 ) ) ( not ( = ?auto_1286318 ?auto_1286327 ) ) ( not ( = ?auto_1286320 ?auto_1286319 ) ) ( not ( = ?auto_1286320 ?auto_1286321 ) ) ( not ( = ?auto_1286320 ?auto_1286322 ) ) ( not ( = ?auto_1286320 ?auto_1286323 ) ) ( not ( = ?auto_1286320 ?auto_1286324 ) ) ( not ( = ?auto_1286320 ?auto_1286325 ) ) ( not ( = ?auto_1286320 ?auto_1286326 ) ) ( not ( = ?auto_1286320 ?auto_1286327 ) ) ( not ( = ?auto_1286319 ?auto_1286321 ) ) ( not ( = ?auto_1286319 ?auto_1286322 ) ) ( not ( = ?auto_1286319 ?auto_1286323 ) ) ( not ( = ?auto_1286319 ?auto_1286324 ) ) ( not ( = ?auto_1286319 ?auto_1286325 ) ) ( not ( = ?auto_1286319 ?auto_1286326 ) ) ( not ( = ?auto_1286319 ?auto_1286327 ) ) ( not ( = ?auto_1286321 ?auto_1286322 ) ) ( not ( = ?auto_1286321 ?auto_1286323 ) ) ( not ( = ?auto_1286321 ?auto_1286324 ) ) ( not ( = ?auto_1286321 ?auto_1286325 ) ) ( not ( = ?auto_1286321 ?auto_1286326 ) ) ( not ( = ?auto_1286321 ?auto_1286327 ) ) ( not ( = ?auto_1286322 ?auto_1286323 ) ) ( not ( = ?auto_1286322 ?auto_1286324 ) ) ( not ( = ?auto_1286322 ?auto_1286325 ) ) ( not ( = ?auto_1286322 ?auto_1286326 ) ) ( not ( = ?auto_1286322 ?auto_1286327 ) ) ( not ( = ?auto_1286323 ?auto_1286324 ) ) ( not ( = ?auto_1286323 ?auto_1286325 ) ) ( not ( = ?auto_1286323 ?auto_1286326 ) ) ( not ( = ?auto_1286323 ?auto_1286327 ) ) ( not ( = ?auto_1286324 ?auto_1286325 ) ) ( not ( = ?auto_1286324 ?auto_1286326 ) ) ( not ( = ?auto_1286324 ?auto_1286327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1286325 ?auto_1286326 ?auto_1286327 )
      ( MAKE-11CRATE-VERIFY ?auto_1286316 ?auto_1286317 ?auto_1286318 ?auto_1286320 ?auto_1286319 ?auto_1286321 ?auto_1286322 ?auto_1286323 ?auto_1286324 ?auto_1286325 ?auto_1286326 ?auto_1286327 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1286448 - SURFACE
      ?auto_1286449 - SURFACE
      ?auto_1286450 - SURFACE
      ?auto_1286452 - SURFACE
      ?auto_1286451 - SURFACE
      ?auto_1286453 - SURFACE
      ?auto_1286454 - SURFACE
      ?auto_1286455 - SURFACE
      ?auto_1286456 - SURFACE
      ?auto_1286457 - SURFACE
      ?auto_1286458 - SURFACE
      ?auto_1286459 - SURFACE
    )
    :vars
    (
      ?auto_1286463 - HOIST
      ?auto_1286460 - PLACE
      ?auto_1286464 - TRUCK
      ?auto_1286461 - PLACE
      ?auto_1286462 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286463 ?auto_1286460 ) ( SURFACE-AT ?auto_1286458 ?auto_1286460 ) ( CLEAR ?auto_1286458 ) ( IS-CRATE ?auto_1286459 ) ( not ( = ?auto_1286458 ?auto_1286459 ) ) ( AVAILABLE ?auto_1286463 ) ( ON ?auto_1286458 ?auto_1286457 ) ( not ( = ?auto_1286457 ?auto_1286458 ) ) ( not ( = ?auto_1286457 ?auto_1286459 ) ) ( TRUCK-AT ?auto_1286464 ?auto_1286461 ) ( not ( = ?auto_1286461 ?auto_1286460 ) ) ( HOIST-AT ?auto_1286462 ?auto_1286461 ) ( LIFTING ?auto_1286462 ?auto_1286459 ) ( not ( = ?auto_1286463 ?auto_1286462 ) ) ( ON ?auto_1286449 ?auto_1286448 ) ( ON ?auto_1286450 ?auto_1286449 ) ( ON ?auto_1286452 ?auto_1286450 ) ( ON ?auto_1286451 ?auto_1286452 ) ( ON ?auto_1286453 ?auto_1286451 ) ( ON ?auto_1286454 ?auto_1286453 ) ( ON ?auto_1286455 ?auto_1286454 ) ( ON ?auto_1286456 ?auto_1286455 ) ( ON ?auto_1286457 ?auto_1286456 ) ( not ( = ?auto_1286448 ?auto_1286449 ) ) ( not ( = ?auto_1286448 ?auto_1286450 ) ) ( not ( = ?auto_1286448 ?auto_1286452 ) ) ( not ( = ?auto_1286448 ?auto_1286451 ) ) ( not ( = ?auto_1286448 ?auto_1286453 ) ) ( not ( = ?auto_1286448 ?auto_1286454 ) ) ( not ( = ?auto_1286448 ?auto_1286455 ) ) ( not ( = ?auto_1286448 ?auto_1286456 ) ) ( not ( = ?auto_1286448 ?auto_1286457 ) ) ( not ( = ?auto_1286448 ?auto_1286458 ) ) ( not ( = ?auto_1286448 ?auto_1286459 ) ) ( not ( = ?auto_1286449 ?auto_1286450 ) ) ( not ( = ?auto_1286449 ?auto_1286452 ) ) ( not ( = ?auto_1286449 ?auto_1286451 ) ) ( not ( = ?auto_1286449 ?auto_1286453 ) ) ( not ( = ?auto_1286449 ?auto_1286454 ) ) ( not ( = ?auto_1286449 ?auto_1286455 ) ) ( not ( = ?auto_1286449 ?auto_1286456 ) ) ( not ( = ?auto_1286449 ?auto_1286457 ) ) ( not ( = ?auto_1286449 ?auto_1286458 ) ) ( not ( = ?auto_1286449 ?auto_1286459 ) ) ( not ( = ?auto_1286450 ?auto_1286452 ) ) ( not ( = ?auto_1286450 ?auto_1286451 ) ) ( not ( = ?auto_1286450 ?auto_1286453 ) ) ( not ( = ?auto_1286450 ?auto_1286454 ) ) ( not ( = ?auto_1286450 ?auto_1286455 ) ) ( not ( = ?auto_1286450 ?auto_1286456 ) ) ( not ( = ?auto_1286450 ?auto_1286457 ) ) ( not ( = ?auto_1286450 ?auto_1286458 ) ) ( not ( = ?auto_1286450 ?auto_1286459 ) ) ( not ( = ?auto_1286452 ?auto_1286451 ) ) ( not ( = ?auto_1286452 ?auto_1286453 ) ) ( not ( = ?auto_1286452 ?auto_1286454 ) ) ( not ( = ?auto_1286452 ?auto_1286455 ) ) ( not ( = ?auto_1286452 ?auto_1286456 ) ) ( not ( = ?auto_1286452 ?auto_1286457 ) ) ( not ( = ?auto_1286452 ?auto_1286458 ) ) ( not ( = ?auto_1286452 ?auto_1286459 ) ) ( not ( = ?auto_1286451 ?auto_1286453 ) ) ( not ( = ?auto_1286451 ?auto_1286454 ) ) ( not ( = ?auto_1286451 ?auto_1286455 ) ) ( not ( = ?auto_1286451 ?auto_1286456 ) ) ( not ( = ?auto_1286451 ?auto_1286457 ) ) ( not ( = ?auto_1286451 ?auto_1286458 ) ) ( not ( = ?auto_1286451 ?auto_1286459 ) ) ( not ( = ?auto_1286453 ?auto_1286454 ) ) ( not ( = ?auto_1286453 ?auto_1286455 ) ) ( not ( = ?auto_1286453 ?auto_1286456 ) ) ( not ( = ?auto_1286453 ?auto_1286457 ) ) ( not ( = ?auto_1286453 ?auto_1286458 ) ) ( not ( = ?auto_1286453 ?auto_1286459 ) ) ( not ( = ?auto_1286454 ?auto_1286455 ) ) ( not ( = ?auto_1286454 ?auto_1286456 ) ) ( not ( = ?auto_1286454 ?auto_1286457 ) ) ( not ( = ?auto_1286454 ?auto_1286458 ) ) ( not ( = ?auto_1286454 ?auto_1286459 ) ) ( not ( = ?auto_1286455 ?auto_1286456 ) ) ( not ( = ?auto_1286455 ?auto_1286457 ) ) ( not ( = ?auto_1286455 ?auto_1286458 ) ) ( not ( = ?auto_1286455 ?auto_1286459 ) ) ( not ( = ?auto_1286456 ?auto_1286457 ) ) ( not ( = ?auto_1286456 ?auto_1286458 ) ) ( not ( = ?auto_1286456 ?auto_1286459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1286457 ?auto_1286458 ?auto_1286459 )
      ( MAKE-11CRATE-VERIFY ?auto_1286448 ?auto_1286449 ?auto_1286450 ?auto_1286452 ?auto_1286451 ?auto_1286453 ?auto_1286454 ?auto_1286455 ?auto_1286456 ?auto_1286457 ?auto_1286458 ?auto_1286459 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1286591 - SURFACE
      ?auto_1286592 - SURFACE
      ?auto_1286593 - SURFACE
      ?auto_1286595 - SURFACE
      ?auto_1286594 - SURFACE
      ?auto_1286596 - SURFACE
      ?auto_1286597 - SURFACE
      ?auto_1286598 - SURFACE
      ?auto_1286599 - SURFACE
      ?auto_1286600 - SURFACE
      ?auto_1286601 - SURFACE
      ?auto_1286602 - SURFACE
    )
    :vars
    (
      ?auto_1286606 - HOIST
      ?auto_1286608 - PLACE
      ?auto_1286605 - TRUCK
      ?auto_1286607 - PLACE
      ?auto_1286603 - HOIST
      ?auto_1286604 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286606 ?auto_1286608 ) ( SURFACE-AT ?auto_1286601 ?auto_1286608 ) ( CLEAR ?auto_1286601 ) ( IS-CRATE ?auto_1286602 ) ( not ( = ?auto_1286601 ?auto_1286602 ) ) ( AVAILABLE ?auto_1286606 ) ( ON ?auto_1286601 ?auto_1286600 ) ( not ( = ?auto_1286600 ?auto_1286601 ) ) ( not ( = ?auto_1286600 ?auto_1286602 ) ) ( TRUCK-AT ?auto_1286605 ?auto_1286607 ) ( not ( = ?auto_1286607 ?auto_1286608 ) ) ( HOIST-AT ?auto_1286603 ?auto_1286607 ) ( not ( = ?auto_1286606 ?auto_1286603 ) ) ( AVAILABLE ?auto_1286603 ) ( SURFACE-AT ?auto_1286602 ?auto_1286607 ) ( ON ?auto_1286602 ?auto_1286604 ) ( CLEAR ?auto_1286602 ) ( not ( = ?auto_1286601 ?auto_1286604 ) ) ( not ( = ?auto_1286602 ?auto_1286604 ) ) ( not ( = ?auto_1286600 ?auto_1286604 ) ) ( ON ?auto_1286592 ?auto_1286591 ) ( ON ?auto_1286593 ?auto_1286592 ) ( ON ?auto_1286595 ?auto_1286593 ) ( ON ?auto_1286594 ?auto_1286595 ) ( ON ?auto_1286596 ?auto_1286594 ) ( ON ?auto_1286597 ?auto_1286596 ) ( ON ?auto_1286598 ?auto_1286597 ) ( ON ?auto_1286599 ?auto_1286598 ) ( ON ?auto_1286600 ?auto_1286599 ) ( not ( = ?auto_1286591 ?auto_1286592 ) ) ( not ( = ?auto_1286591 ?auto_1286593 ) ) ( not ( = ?auto_1286591 ?auto_1286595 ) ) ( not ( = ?auto_1286591 ?auto_1286594 ) ) ( not ( = ?auto_1286591 ?auto_1286596 ) ) ( not ( = ?auto_1286591 ?auto_1286597 ) ) ( not ( = ?auto_1286591 ?auto_1286598 ) ) ( not ( = ?auto_1286591 ?auto_1286599 ) ) ( not ( = ?auto_1286591 ?auto_1286600 ) ) ( not ( = ?auto_1286591 ?auto_1286601 ) ) ( not ( = ?auto_1286591 ?auto_1286602 ) ) ( not ( = ?auto_1286591 ?auto_1286604 ) ) ( not ( = ?auto_1286592 ?auto_1286593 ) ) ( not ( = ?auto_1286592 ?auto_1286595 ) ) ( not ( = ?auto_1286592 ?auto_1286594 ) ) ( not ( = ?auto_1286592 ?auto_1286596 ) ) ( not ( = ?auto_1286592 ?auto_1286597 ) ) ( not ( = ?auto_1286592 ?auto_1286598 ) ) ( not ( = ?auto_1286592 ?auto_1286599 ) ) ( not ( = ?auto_1286592 ?auto_1286600 ) ) ( not ( = ?auto_1286592 ?auto_1286601 ) ) ( not ( = ?auto_1286592 ?auto_1286602 ) ) ( not ( = ?auto_1286592 ?auto_1286604 ) ) ( not ( = ?auto_1286593 ?auto_1286595 ) ) ( not ( = ?auto_1286593 ?auto_1286594 ) ) ( not ( = ?auto_1286593 ?auto_1286596 ) ) ( not ( = ?auto_1286593 ?auto_1286597 ) ) ( not ( = ?auto_1286593 ?auto_1286598 ) ) ( not ( = ?auto_1286593 ?auto_1286599 ) ) ( not ( = ?auto_1286593 ?auto_1286600 ) ) ( not ( = ?auto_1286593 ?auto_1286601 ) ) ( not ( = ?auto_1286593 ?auto_1286602 ) ) ( not ( = ?auto_1286593 ?auto_1286604 ) ) ( not ( = ?auto_1286595 ?auto_1286594 ) ) ( not ( = ?auto_1286595 ?auto_1286596 ) ) ( not ( = ?auto_1286595 ?auto_1286597 ) ) ( not ( = ?auto_1286595 ?auto_1286598 ) ) ( not ( = ?auto_1286595 ?auto_1286599 ) ) ( not ( = ?auto_1286595 ?auto_1286600 ) ) ( not ( = ?auto_1286595 ?auto_1286601 ) ) ( not ( = ?auto_1286595 ?auto_1286602 ) ) ( not ( = ?auto_1286595 ?auto_1286604 ) ) ( not ( = ?auto_1286594 ?auto_1286596 ) ) ( not ( = ?auto_1286594 ?auto_1286597 ) ) ( not ( = ?auto_1286594 ?auto_1286598 ) ) ( not ( = ?auto_1286594 ?auto_1286599 ) ) ( not ( = ?auto_1286594 ?auto_1286600 ) ) ( not ( = ?auto_1286594 ?auto_1286601 ) ) ( not ( = ?auto_1286594 ?auto_1286602 ) ) ( not ( = ?auto_1286594 ?auto_1286604 ) ) ( not ( = ?auto_1286596 ?auto_1286597 ) ) ( not ( = ?auto_1286596 ?auto_1286598 ) ) ( not ( = ?auto_1286596 ?auto_1286599 ) ) ( not ( = ?auto_1286596 ?auto_1286600 ) ) ( not ( = ?auto_1286596 ?auto_1286601 ) ) ( not ( = ?auto_1286596 ?auto_1286602 ) ) ( not ( = ?auto_1286596 ?auto_1286604 ) ) ( not ( = ?auto_1286597 ?auto_1286598 ) ) ( not ( = ?auto_1286597 ?auto_1286599 ) ) ( not ( = ?auto_1286597 ?auto_1286600 ) ) ( not ( = ?auto_1286597 ?auto_1286601 ) ) ( not ( = ?auto_1286597 ?auto_1286602 ) ) ( not ( = ?auto_1286597 ?auto_1286604 ) ) ( not ( = ?auto_1286598 ?auto_1286599 ) ) ( not ( = ?auto_1286598 ?auto_1286600 ) ) ( not ( = ?auto_1286598 ?auto_1286601 ) ) ( not ( = ?auto_1286598 ?auto_1286602 ) ) ( not ( = ?auto_1286598 ?auto_1286604 ) ) ( not ( = ?auto_1286599 ?auto_1286600 ) ) ( not ( = ?auto_1286599 ?auto_1286601 ) ) ( not ( = ?auto_1286599 ?auto_1286602 ) ) ( not ( = ?auto_1286599 ?auto_1286604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1286600 ?auto_1286601 ?auto_1286602 )
      ( MAKE-11CRATE-VERIFY ?auto_1286591 ?auto_1286592 ?auto_1286593 ?auto_1286595 ?auto_1286594 ?auto_1286596 ?auto_1286597 ?auto_1286598 ?auto_1286599 ?auto_1286600 ?auto_1286601 ?auto_1286602 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1286735 - SURFACE
      ?auto_1286736 - SURFACE
      ?auto_1286737 - SURFACE
      ?auto_1286739 - SURFACE
      ?auto_1286738 - SURFACE
      ?auto_1286740 - SURFACE
      ?auto_1286741 - SURFACE
      ?auto_1286742 - SURFACE
      ?auto_1286743 - SURFACE
      ?auto_1286744 - SURFACE
      ?auto_1286745 - SURFACE
      ?auto_1286746 - SURFACE
    )
    :vars
    (
      ?auto_1286750 - HOIST
      ?auto_1286749 - PLACE
      ?auto_1286752 - PLACE
      ?auto_1286748 - HOIST
      ?auto_1286751 - SURFACE
      ?auto_1286747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286750 ?auto_1286749 ) ( SURFACE-AT ?auto_1286745 ?auto_1286749 ) ( CLEAR ?auto_1286745 ) ( IS-CRATE ?auto_1286746 ) ( not ( = ?auto_1286745 ?auto_1286746 ) ) ( AVAILABLE ?auto_1286750 ) ( ON ?auto_1286745 ?auto_1286744 ) ( not ( = ?auto_1286744 ?auto_1286745 ) ) ( not ( = ?auto_1286744 ?auto_1286746 ) ) ( not ( = ?auto_1286752 ?auto_1286749 ) ) ( HOIST-AT ?auto_1286748 ?auto_1286752 ) ( not ( = ?auto_1286750 ?auto_1286748 ) ) ( AVAILABLE ?auto_1286748 ) ( SURFACE-AT ?auto_1286746 ?auto_1286752 ) ( ON ?auto_1286746 ?auto_1286751 ) ( CLEAR ?auto_1286746 ) ( not ( = ?auto_1286745 ?auto_1286751 ) ) ( not ( = ?auto_1286746 ?auto_1286751 ) ) ( not ( = ?auto_1286744 ?auto_1286751 ) ) ( TRUCK-AT ?auto_1286747 ?auto_1286749 ) ( ON ?auto_1286736 ?auto_1286735 ) ( ON ?auto_1286737 ?auto_1286736 ) ( ON ?auto_1286739 ?auto_1286737 ) ( ON ?auto_1286738 ?auto_1286739 ) ( ON ?auto_1286740 ?auto_1286738 ) ( ON ?auto_1286741 ?auto_1286740 ) ( ON ?auto_1286742 ?auto_1286741 ) ( ON ?auto_1286743 ?auto_1286742 ) ( ON ?auto_1286744 ?auto_1286743 ) ( not ( = ?auto_1286735 ?auto_1286736 ) ) ( not ( = ?auto_1286735 ?auto_1286737 ) ) ( not ( = ?auto_1286735 ?auto_1286739 ) ) ( not ( = ?auto_1286735 ?auto_1286738 ) ) ( not ( = ?auto_1286735 ?auto_1286740 ) ) ( not ( = ?auto_1286735 ?auto_1286741 ) ) ( not ( = ?auto_1286735 ?auto_1286742 ) ) ( not ( = ?auto_1286735 ?auto_1286743 ) ) ( not ( = ?auto_1286735 ?auto_1286744 ) ) ( not ( = ?auto_1286735 ?auto_1286745 ) ) ( not ( = ?auto_1286735 ?auto_1286746 ) ) ( not ( = ?auto_1286735 ?auto_1286751 ) ) ( not ( = ?auto_1286736 ?auto_1286737 ) ) ( not ( = ?auto_1286736 ?auto_1286739 ) ) ( not ( = ?auto_1286736 ?auto_1286738 ) ) ( not ( = ?auto_1286736 ?auto_1286740 ) ) ( not ( = ?auto_1286736 ?auto_1286741 ) ) ( not ( = ?auto_1286736 ?auto_1286742 ) ) ( not ( = ?auto_1286736 ?auto_1286743 ) ) ( not ( = ?auto_1286736 ?auto_1286744 ) ) ( not ( = ?auto_1286736 ?auto_1286745 ) ) ( not ( = ?auto_1286736 ?auto_1286746 ) ) ( not ( = ?auto_1286736 ?auto_1286751 ) ) ( not ( = ?auto_1286737 ?auto_1286739 ) ) ( not ( = ?auto_1286737 ?auto_1286738 ) ) ( not ( = ?auto_1286737 ?auto_1286740 ) ) ( not ( = ?auto_1286737 ?auto_1286741 ) ) ( not ( = ?auto_1286737 ?auto_1286742 ) ) ( not ( = ?auto_1286737 ?auto_1286743 ) ) ( not ( = ?auto_1286737 ?auto_1286744 ) ) ( not ( = ?auto_1286737 ?auto_1286745 ) ) ( not ( = ?auto_1286737 ?auto_1286746 ) ) ( not ( = ?auto_1286737 ?auto_1286751 ) ) ( not ( = ?auto_1286739 ?auto_1286738 ) ) ( not ( = ?auto_1286739 ?auto_1286740 ) ) ( not ( = ?auto_1286739 ?auto_1286741 ) ) ( not ( = ?auto_1286739 ?auto_1286742 ) ) ( not ( = ?auto_1286739 ?auto_1286743 ) ) ( not ( = ?auto_1286739 ?auto_1286744 ) ) ( not ( = ?auto_1286739 ?auto_1286745 ) ) ( not ( = ?auto_1286739 ?auto_1286746 ) ) ( not ( = ?auto_1286739 ?auto_1286751 ) ) ( not ( = ?auto_1286738 ?auto_1286740 ) ) ( not ( = ?auto_1286738 ?auto_1286741 ) ) ( not ( = ?auto_1286738 ?auto_1286742 ) ) ( not ( = ?auto_1286738 ?auto_1286743 ) ) ( not ( = ?auto_1286738 ?auto_1286744 ) ) ( not ( = ?auto_1286738 ?auto_1286745 ) ) ( not ( = ?auto_1286738 ?auto_1286746 ) ) ( not ( = ?auto_1286738 ?auto_1286751 ) ) ( not ( = ?auto_1286740 ?auto_1286741 ) ) ( not ( = ?auto_1286740 ?auto_1286742 ) ) ( not ( = ?auto_1286740 ?auto_1286743 ) ) ( not ( = ?auto_1286740 ?auto_1286744 ) ) ( not ( = ?auto_1286740 ?auto_1286745 ) ) ( not ( = ?auto_1286740 ?auto_1286746 ) ) ( not ( = ?auto_1286740 ?auto_1286751 ) ) ( not ( = ?auto_1286741 ?auto_1286742 ) ) ( not ( = ?auto_1286741 ?auto_1286743 ) ) ( not ( = ?auto_1286741 ?auto_1286744 ) ) ( not ( = ?auto_1286741 ?auto_1286745 ) ) ( not ( = ?auto_1286741 ?auto_1286746 ) ) ( not ( = ?auto_1286741 ?auto_1286751 ) ) ( not ( = ?auto_1286742 ?auto_1286743 ) ) ( not ( = ?auto_1286742 ?auto_1286744 ) ) ( not ( = ?auto_1286742 ?auto_1286745 ) ) ( not ( = ?auto_1286742 ?auto_1286746 ) ) ( not ( = ?auto_1286742 ?auto_1286751 ) ) ( not ( = ?auto_1286743 ?auto_1286744 ) ) ( not ( = ?auto_1286743 ?auto_1286745 ) ) ( not ( = ?auto_1286743 ?auto_1286746 ) ) ( not ( = ?auto_1286743 ?auto_1286751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1286744 ?auto_1286745 ?auto_1286746 )
      ( MAKE-11CRATE-VERIFY ?auto_1286735 ?auto_1286736 ?auto_1286737 ?auto_1286739 ?auto_1286738 ?auto_1286740 ?auto_1286741 ?auto_1286742 ?auto_1286743 ?auto_1286744 ?auto_1286745 ?auto_1286746 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1286879 - SURFACE
      ?auto_1286880 - SURFACE
      ?auto_1286881 - SURFACE
      ?auto_1286883 - SURFACE
      ?auto_1286882 - SURFACE
      ?auto_1286884 - SURFACE
      ?auto_1286885 - SURFACE
      ?auto_1286886 - SURFACE
      ?auto_1286887 - SURFACE
      ?auto_1286888 - SURFACE
      ?auto_1286889 - SURFACE
      ?auto_1286890 - SURFACE
    )
    :vars
    (
      ?auto_1286893 - HOIST
      ?auto_1286896 - PLACE
      ?auto_1286895 - PLACE
      ?auto_1286892 - HOIST
      ?auto_1286891 - SURFACE
      ?auto_1286894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1286893 ?auto_1286896 ) ( IS-CRATE ?auto_1286890 ) ( not ( = ?auto_1286889 ?auto_1286890 ) ) ( not ( = ?auto_1286888 ?auto_1286889 ) ) ( not ( = ?auto_1286888 ?auto_1286890 ) ) ( not ( = ?auto_1286895 ?auto_1286896 ) ) ( HOIST-AT ?auto_1286892 ?auto_1286895 ) ( not ( = ?auto_1286893 ?auto_1286892 ) ) ( AVAILABLE ?auto_1286892 ) ( SURFACE-AT ?auto_1286890 ?auto_1286895 ) ( ON ?auto_1286890 ?auto_1286891 ) ( CLEAR ?auto_1286890 ) ( not ( = ?auto_1286889 ?auto_1286891 ) ) ( not ( = ?auto_1286890 ?auto_1286891 ) ) ( not ( = ?auto_1286888 ?auto_1286891 ) ) ( TRUCK-AT ?auto_1286894 ?auto_1286896 ) ( SURFACE-AT ?auto_1286888 ?auto_1286896 ) ( CLEAR ?auto_1286888 ) ( LIFTING ?auto_1286893 ?auto_1286889 ) ( IS-CRATE ?auto_1286889 ) ( ON ?auto_1286880 ?auto_1286879 ) ( ON ?auto_1286881 ?auto_1286880 ) ( ON ?auto_1286883 ?auto_1286881 ) ( ON ?auto_1286882 ?auto_1286883 ) ( ON ?auto_1286884 ?auto_1286882 ) ( ON ?auto_1286885 ?auto_1286884 ) ( ON ?auto_1286886 ?auto_1286885 ) ( ON ?auto_1286887 ?auto_1286886 ) ( ON ?auto_1286888 ?auto_1286887 ) ( not ( = ?auto_1286879 ?auto_1286880 ) ) ( not ( = ?auto_1286879 ?auto_1286881 ) ) ( not ( = ?auto_1286879 ?auto_1286883 ) ) ( not ( = ?auto_1286879 ?auto_1286882 ) ) ( not ( = ?auto_1286879 ?auto_1286884 ) ) ( not ( = ?auto_1286879 ?auto_1286885 ) ) ( not ( = ?auto_1286879 ?auto_1286886 ) ) ( not ( = ?auto_1286879 ?auto_1286887 ) ) ( not ( = ?auto_1286879 ?auto_1286888 ) ) ( not ( = ?auto_1286879 ?auto_1286889 ) ) ( not ( = ?auto_1286879 ?auto_1286890 ) ) ( not ( = ?auto_1286879 ?auto_1286891 ) ) ( not ( = ?auto_1286880 ?auto_1286881 ) ) ( not ( = ?auto_1286880 ?auto_1286883 ) ) ( not ( = ?auto_1286880 ?auto_1286882 ) ) ( not ( = ?auto_1286880 ?auto_1286884 ) ) ( not ( = ?auto_1286880 ?auto_1286885 ) ) ( not ( = ?auto_1286880 ?auto_1286886 ) ) ( not ( = ?auto_1286880 ?auto_1286887 ) ) ( not ( = ?auto_1286880 ?auto_1286888 ) ) ( not ( = ?auto_1286880 ?auto_1286889 ) ) ( not ( = ?auto_1286880 ?auto_1286890 ) ) ( not ( = ?auto_1286880 ?auto_1286891 ) ) ( not ( = ?auto_1286881 ?auto_1286883 ) ) ( not ( = ?auto_1286881 ?auto_1286882 ) ) ( not ( = ?auto_1286881 ?auto_1286884 ) ) ( not ( = ?auto_1286881 ?auto_1286885 ) ) ( not ( = ?auto_1286881 ?auto_1286886 ) ) ( not ( = ?auto_1286881 ?auto_1286887 ) ) ( not ( = ?auto_1286881 ?auto_1286888 ) ) ( not ( = ?auto_1286881 ?auto_1286889 ) ) ( not ( = ?auto_1286881 ?auto_1286890 ) ) ( not ( = ?auto_1286881 ?auto_1286891 ) ) ( not ( = ?auto_1286883 ?auto_1286882 ) ) ( not ( = ?auto_1286883 ?auto_1286884 ) ) ( not ( = ?auto_1286883 ?auto_1286885 ) ) ( not ( = ?auto_1286883 ?auto_1286886 ) ) ( not ( = ?auto_1286883 ?auto_1286887 ) ) ( not ( = ?auto_1286883 ?auto_1286888 ) ) ( not ( = ?auto_1286883 ?auto_1286889 ) ) ( not ( = ?auto_1286883 ?auto_1286890 ) ) ( not ( = ?auto_1286883 ?auto_1286891 ) ) ( not ( = ?auto_1286882 ?auto_1286884 ) ) ( not ( = ?auto_1286882 ?auto_1286885 ) ) ( not ( = ?auto_1286882 ?auto_1286886 ) ) ( not ( = ?auto_1286882 ?auto_1286887 ) ) ( not ( = ?auto_1286882 ?auto_1286888 ) ) ( not ( = ?auto_1286882 ?auto_1286889 ) ) ( not ( = ?auto_1286882 ?auto_1286890 ) ) ( not ( = ?auto_1286882 ?auto_1286891 ) ) ( not ( = ?auto_1286884 ?auto_1286885 ) ) ( not ( = ?auto_1286884 ?auto_1286886 ) ) ( not ( = ?auto_1286884 ?auto_1286887 ) ) ( not ( = ?auto_1286884 ?auto_1286888 ) ) ( not ( = ?auto_1286884 ?auto_1286889 ) ) ( not ( = ?auto_1286884 ?auto_1286890 ) ) ( not ( = ?auto_1286884 ?auto_1286891 ) ) ( not ( = ?auto_1286885 ?auto_1286886 ) ) ( not ( = ?auto_1286885 ?auto_1286887 ) ) ( not ( = ?auto_1286885 ?auto_1286888 ) ) ( not ( = ?auto_1286885 ?auto_1286889 ) ) ( not ( = ?auto_1286885 ?auto_1286890 ) ) ( not ( = ?auto_1286885 ?auto_1286891 ) ) ( not ( = ?auto_1286886 ?auto_1286887 ) ) ( not ( = ?auto_1286886 ?auto_1286888 ) ) ( not ( = ?auto_1286886 ?auto_1286889 ) ) ( not ( = ?auto_1286886 ?auto_1286890 ) ) ( not ( = ?auto_1286886 ?auto_1286891 ) ) ( not ( = ?auto_1286887 ?auto_1286888 ) ) ( not ( = ?auto_1286887 ?auto_1286889 ) ) ( not ( = ?auto_1286887 ?auto_1286890 ) ) ( not ( = ?auto_1286887 ?auto_1286891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1286888 ?auto_1286889 ?auto_1286890 )
      ( MAKE-11CRATE-VERIFY ?auto_1286879 ?auto_1286880 ?auto_1286881 ?auto_1286883 ?auto_1286882 ?auto_1286884 ?auto_1286885 ?auto_1286886 ?auto_1286887 ?auto_1286888 ?auto_1286889 ?auto_1286890 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1287023 - SURFACE
      ?auto_1287024 - SURFACE
      ?auto_1287025 - SURFACE
      ?auto_1287027 - SURFACE
      ?auto_1287026 - SURFACE
      ?auto_1287028 - SURFACE
      ?auto_1287029 - SURFACE
      ?auto_1287030 - SURFACE
      ?auto_1287031 - SURFACE
      ?auto_1287032 - SURFACE
      ?auto_1287033 - SURFACE
      ?auto_1287034 - SURFACE
    )
    :vars
    (
      ?auto_1287040 - HOIST
      ?auto_1287036 - PLACE
      ?auto_1287039 - PLACE
      ?auto_1287035 - HOIST
      ?auto_1287037 - SURFACE
      ?auto_1287038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1287040 ?auto_1287036 ) ( IS-CRATE ?auto_1287034 ) ( not ( = ?auto_1287033 ?auto_1287034 ) ) ( not ( = ?auto_1287032 ?auto_1287033 ) ) ( not ( = ?auto_1287032 ?auto_1287034 ) ) ( not ( = ?auto_1287039 ?auto_1287036 ) ) ( HOIST-AT ?auto_1287035 ?auto_1287039 ) ( not ( = ?auto_1287040 ?auto_1287035 ) ) ( AVAILABLE ?auto_1287035 ) ( SURFACE-AT ?auto_1287034 ?auto_1287039 ) ( ON ?auto_1287034 ?auto_1287037 ) ( CLEAR ?auto_1287034 ) ( not ( = ?auto_1287033 ?auto_1287037 ) ) ( not ( = ?auto_1287034 ?auto_1287037 ) ) ( not ( = ?auto_1287032 ?auto_1287037 ) ) ( TRUCK-AT ?auto_1287038 ?auto_1287036 ) ( SURFACE-AT ?auto_1287032 ?auto_1287036 ) ( CLEAR ?auto_1287032 ) ( IS-CRATE ?auto_1287033 ) ( AVAILABLE ?auto_1287040 ) ( IN ?auto_1287033 ?auto_1287038 ) ( ON ?auto_1287024 ?auto_1287023 ) ( ON ?auto_1287025 ?auto_1287024 ) ( ON ?auto_1287027 ?auto_1287025 ) ( ON ?auto_1287026 ?auto_1287027 ) ( ON ?auto_1287028 ?auto_1287026 ) ( ON ?auto_1287029 ?auto_1287028 ) ( ON ?auto_1287030 ?auto_1287029 ) ( ON ?auto_1287031 ?auto_1287030 ) ( ON ?auto_1287032 ?auto_1287031 ) ( not ( = ?auto_1287023 ?auto_1287024 ) ) ( not ( = ?auto_1287023 ?auto_1287025 ) ) ( not ( = ?auto_1287023 ?auto_1287027 ) ) ( not ( = ?auto_1287023 ?auto_1287026 ) ) ( not ( = ?auto_1287023 ?auto_1287028 ) ) ( not ( = ?auto_1287023 ?auto_1287029 ) ) ( not ( = ?auto_1287023 ?auto_1287030 ) ) ( not ( = ?auto_1287023 ?auto_1287031 ) ) ( not ( = ?auto_1287023 ?auto_1287032 ) ) ( not ( = ?auto_1287023 ?auto_1287033 ) ) ( not ( = ?auto_1287023 ?auto_1287034 ) ) ( not ( = ?auto_1287023 ?auto_1287037 ) ) ( not ( = ?auto_1287024 ?auto_1287025 ) ) ( not ( = ?auto_1287024 ?auto_1287027 ) ) ( not ( = ?auto_1287024 ?auto_1287026 ) ) ( not ( = ?auto_1287024 ?auto_1287028 ) ) ( not ( = ?auto_1287024 ?auto_1287029 ) ) ( not ( = ?auto_1287024 ?auto_1287030 ) ) ( not ( = ?auto_1287024 ?auto_1287031 ) ) ( not ( = ?auto_1287024 ?auto_1287032 ) ) ( not ( = ?auto_1287024 ?auto_1287033 ) ) ( not ( = ?auto_1287024 ?auto_1287034 ) ) ( not ( = ?auto_1287024 ?auto_1287037 ) ) ( not ( = ?auto_1287025 ?auto_1287027 ) ) ( not ( = ?auto_1287025 ?auto_1287026 ) ) ( not ( = ?auto_1287025 ?auto_1287028 ) ) ( not ( = ?auto_1287025 ?auto_1287029 ) ) ( not ( = ?auto_1287025 ?auto_1287030 ) ) ( not ( = ?auto_1287025 ?auto_1287031 ) ) ( not ( = ?auto_1287025 ?auto_1287032 ) ) ( not ( = ?auto_1287025 ?auto_1287033 ) ) ( not ( = ?auto_1287025 ?auto_1287034 ) ) ( not ( = ?auto_1287025 ?auto_1287037 ) ) ( not ( = ?auto_1287027 ?auto_1287026 ) ) ( not ( = ?auto_1287027 ?auto_1287028 ) ) ( not ( = ?auto_1287027 ?auto_1287029 ) ) ( not ( = ?auto_1287027 ?auto_1287030 ) ) ( not ( = ?auto_1287027 ?auto_1287031 ) ) ( not ( = ?auto_1287027 ?auto_1287032 ) ) ( not ( = ?auto_1287027 ?auto_1287033 ) ) ( not ( = ?auto_1287027 ?auto_1287034 ) ) ( not ( = ?auto_1287027 ?auto_1287037 ) ) ( not ( = ?auto_1287026 ?auto_1287028 ) ) ( not ( = ?auto_1287026 ?auto_1287029 ) ) ( not ( = ?auto_1287026 ?auto_1287030 ) ) ( not ( = ?auto_1287026 ?auto_1287031 ) ) ( not ( = ?auto_1287026 ?auto_1287032 ) ) ( not ( = ?auto_1287026 ?auto_1287033 ) ) ( not ( = ?auto_1287026 ?auto_1287034 ) ) ( not ( = ?auto_1287026 ?auto_1287037 ) ) ( not ( = ?auto_1287028 ?auto_1287029 ) ) ( not ( = ?auto_1287028 ?auto_1287030 ) ) ( not ( = ?auto_1287028 ?auto_1287031 ) ) ( not ( = ?auto_1287028 ?auto_1287032 ) ) ( not ( = ?auto_1287028 ?auto_1287033 ) ) ( not ( = ?auto_1287028 ?auto_1287034 ) ) ( not ( = ?auto_1287028 ?auto_1287037 ) ) ( not ( = ?auto_1287029 ?auto_1287030 ) ) ( not ( = ?auto_1287029 ?auto_1287031 ) ) ( not ( = ?auto_1287029 ?auto_1287032 ) ) ( not ( = ?auto_1287029 ?auto_1287033 ) ) ( not ( = ?auto_1287029 ?auto_1287034 ) ) ( not ( = ?auto_1287029 ?auto_1287037 ) ) ( not ( = ?auto_1287030 ?auto_1287031 ) ) ( not ( = ?auto_1287030 ?auto_1287032 ) ) ( not ( = ?auto_1287030 ?auto_1287033 ) ) ( not ( = ?auto_1287030 ?auto_1287034 ) ) ( not ( = ?auto_1287030 ?auto_1287037 ) ) ( not ( = ?auto_1287031 ?auto_1287032 ) ) ( not ( = ?auto_1287031 ?auto_1287033 ) ) ( not ( = ?auto_1287031 ?auto_1287034 ) ) ( not ( = ?auto_1287031 ?auto_1287037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1287032 ?auto_1287033 ?auto_1287034 )
      ( MAKE-11CRATE-VERIFY ?auto_1287023 ?auto_1287024 ?auto_1287025 ?auto_1287027 ?auto_1287026 ?auto_1287028 ?auto_1287029 ?auto_1287030 ?auto_1287031 ?auto_1287032 ?auto_1287033 ?auto_1287034 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1296314 - SURFACE
      ?auto_1296315 - SURFACE
      ?auto_1296316 - SURFACE
      ?auto_1296318 - SURFACE
      ?auto_1296317 - SURFACE
      ?auto_1296319 - SURFACE
      ?auto_1296320 - SURFACE
      ?auto_1296321 - SURFACE
      ?auto_1296322 - SURFACE
      ?auto_1296323 - SURFACE
      ?auto_1296324 - SURFACE
      ?auto_1296325 - SURFACE
      ?auto_1296326 - SURFACE
    )
    :vars
    (
      ?auto_1296327 - HOIST
      ?auto_1296328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1296327 ?auto_1296328 ) ( SURFACE-AT ?auto_1296325 ?auto_1296328 ) ( CLEAR ?auto_1296325 ) ( LIFTING ?auto_1296327 ?auto_1296326 ) ( IS-CRATE ?auto_1296326 ) ( not ( = ?auto_1296325 ?auto_1296326 ) ) ( ON ?auto_1296315 ?auto_1296314 ) ( ON ?auto_1296316 ?auto_1296315 ) ( ON ?auto_1296318 ?auto_1296316 ) ( ON ?auto_1296317 ?auto_1296318 ) ( ON ?auto_1296319 ?auto_1296317 ) ( ON ?auto_1296320 ?auto_1296319 ) ( ON ?auto_1296321 ?auto_1296320 ) ( ON ?auto_1296322 ?auto_1296321 ) ( ON ?auto_1296323 ?auto_1296322 ) ( ON ?auto_1296324 ?auto_1296323 ) ( ON ?auto_1296325 ?auto_1296324 ) ( not ( = ?auto_1296314 ?auto_1296315 ) ) ( not ( = ?auto_1296314 ?auto_1296316 ) ) ( not ( = ?auto_1296314 ?auto_1296318 ) ) ( not ( = ?auto_1296314 ?auto_1296317 ) ) ( not ( = ?auto_1296314 ?auto_1296319 ) ) ( not ( = ?auto_1296314 ?auto_1296320 ) ) ( not ( = ?auto_1296314 ?auto_1296321 ) ) ( not ( = ?auto_1296314 ?auto_1296322 ) ) ( not ( = ?auto_1296314 ?auto_1296323 ) ) ( not ( = ?auto_1296314 ?auto_1296324 ) ) ( not ( = ?auto_1296314 ?auto_1296325 ) ) ( not ( = ?auto_1296314 ?auto_1296326 ) ) ( not ( = ?auto_1296315 ?auto_1296316 ) ) ( not ( = ?auto_1296315 ?auto_1296318 ) ) ( not ( = ?auto_1296315 ?auto_1296317 ) ) ( not ( = ?auto_1296315 ?auto_1296319 ) ) ( not ( = ?auto_1296315 ?auto_1296320 ) ) ( not ( = ?auto_1296315 ?auto_1296321 ) ) ( not ( = ?auto_1296315 ?auto_1296322 ) ) ( not ( = ?auto_1296315 ?auto_1296323 ) ) ( not ( = ?auto_1296315 ?auto_1296324 ) ) ( not ( = ?auto_1296315 ?auto_1296325 ) ) ( not ( = ?auto_1296315 ?auto_1296326 ) ) ( not ( = ?auto_1296316 ?auto_1296318 ) ) ( not ( = ?auto_1296316 ?auto_1296317 ) ) ( not ( = ?auto_1296316 ?auto_1296319 ) ) ( not ( = ?auto_1296316 ?auto_1296320 ) ) ( not ( = ?auto_1296316 ?auto_1296321 ) ) ( not ( = ?auto_1296316 ?auto_1296322 ) ) ( not ( = ?auto_1296316 ?auto_1296323 ) ) ( not ( = ?auto_1296316 ?auto_1296324 ) ) ( not ( = ?auto_1296316 ?auto_1296325 ) ) ( not ( = ?auto_1296316 ?auto_1296326 ) ) ( not ( = ?auto_1296318 ?auto_1296317 ) ) ( not ( = ?auto_1296318 ?auto_1296319 ) ) ( not ( = ?auto_1296318 ?auto_1296320 ) ) ( not ( = ?auto_1296318 ?auto_1296321 ) ) ( not ( = ?auto_1296318 ?auto_1296322 ) ) ( not ( = ?auto_1296318 ?auto_1296323 ) ) ( not ( = ?auto_1296318 ?auto_1296324 ) ) ( not ( = ?auto_1296318 ?auto_1296325 ) ) ( not ( = ?auto_1296318 ?auto_1296326 ) ) ( not ( = ?auto_1296317 ?auto_1296319 ) ) ( not ( = ?auto_1296317 ?auto_1296320 ) ) ( not ( = ?auto_1296317 ?auto_1296321 ) ) ( not ( = ?auto_1296317 ?auto_1296322 ) ) ( not ( = ?auto_1296317 ?auto_1296323 ) ) ( not ( = ?auto_1296317 ?auto_1296324 ) ) ( not ( = ?auto_1296317 ?auto_1296325 ) ) ( not ( = ?auto_1296317 ?auto_1296326 ) ) ( not ( = ?auto_1296319 ?auto_1296320 ) ) ( not ( = ?auto_1296319 ?auto_1296321 ) ) ( not ( = ?auto_1296319 ?auto_1296322 ) ) ( not ( = ?auto_1296319 ?auto_1296323 ) ) ( not ( = ?auto_1296319 ?auto_1296324 ) ) ( not ( = ?auto_1296319 ?auto_1296325 ) ) ( not ( = ?auto_1296319 ?auto_1296326 ) ) ( not ( = ?auto_1296320 ?auto_1296321 ) ) ( not ( = ?auto_1296320 ?auto_1296322 ) ) ( not ( = ?auto_1296320 ?auto_1296323 ) ) ( not ( = ?auto_1296320 ?auto_1296324 ) ) ( not ( = ?auto_1296320 ?auto_1296325 ) ) ( not ( = ?auto_1296320 ?auto_1296326 ) ) ( not ( = ?auto_1296321 ?auto_1296322 ) ) ( not ( = ?auto_1296321 ?auto_1296323 ) ) ( not ( = ?auto_1296321 ?auto_1296324 ) ) ( not ( = ?auto_1296321 ?auto_1296325 ) ) ( not ( = ?auto_1296321 ?auto_1296326 ) ) ( not ( = ?auto_1296322 ?auto_1296323 ) ) ( not ( = ?auto_1296322 ?auto_1296324 ) ) ( not ( = ?auto_1296322 ?auto_1296325 ) ) ( not ( = ?auto_1296322 ?auto_1296326 ) ) ( not ( = ?auto_1296323 ?auto_1296324 ) ) ( not ( = ?auto_1296323 ?auto_1296325 ) ) ( not ( = ?auto_1296323 ?auto_1296326 ) ) ( not ( = ?auto_1296324 ?auto_1296325 ) ) ( not ( = ?auto_1296324 ?auto_1296326 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1296325 ?auto_1296326 )
      ( MAKE-12CRATE-VERIFY ?auto_1296314 ?auto_1296315 ?auto_1296316 ?auto_1296318 ?auto_1296317 ?auto_1296319 ?auto_1296320 ?auto_1296321 ?auto_1296322 ?auto_1296323 ?auto_1296324 ?auto_1296325 ?auto_1296326 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1296439 - SURFACE
      ?auto_1296440 - SURFACE
      ?auto_1296441 - SURFACE
      ?auto_1296443 - SURFACE
      ?auto_1296442 - SURFACE
      ?auto_1296444 - SURFACE
      ?auto_1296445 - SURFACE
      ?auto_1296446 - SURFACE
      ?auto_1296447 - SURFACE
      ?auto_1296448 - SURFACE
      ?auto_1296449 - SURFACE
      ?auto_1296450 - SURFACE
      ?auto_1296451 - SURFACE
    )
    :vars
    (
      ?auto_1296452 - HOIST
      ?auto_1296453 - PLACE
      ?auto_1296454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1296452 ?auto_1296453 ) ( SURFACE-AT ?auto_1296450 ?auto_1296453 ) ( CLEAR ?auto_1296450 ) ( IS-CRATE ?auto_1296451 ) ( not ( = ?auto_1296450 ?auto_1296451 ) ) ( TRUCK-AT ?auto_1296454 ?auto_1296453 ) ( AVAILABLE ?auto_1296452 ) ( IN ?auto_1296451 ?auto_1296454 ) ( ON ?auto_1296450 ?auto_1296449 ) ( not ( = ?auto_1296449 ?auto_1296450 ) ) ( not ( = ?auto_1296449 ?auto_1296451 ) ) ( ON ?auto_1296440 ?auto_1296439 ) ( ON ?auto_1296441 ?auto_1296440 ) ( ON ?auto_1296443 ?auto_1296441 ) ( ON ?auto_1296442 ?auto_1296443 ) ( ON ?auto_1296444 ?auto_1296442 ) ( ON ?auto_1296445 ?auto_1296444 ) ( ON ?auto_1296446 ?auto_1296445 ) ( ON ?auto_1296447 ?auto_1296446 ) ( ON ?auto_1296448 ?auto_1296447 ) ( ON ?auto_1296449 ?auto_1296448 ) ( not ( = ?auto_1296439 ?auto_1296440 ) ) ( not ( = ?auto_1296439 ?auto_1296441 ) ) ( not ( = ?auto_1296439 ?auto_1296443 ) ) ( not ( = ?auto_1296439 ?auto_1296442 ) ) ( not ( = ?auto_1296439 ?auto_1296444 ) ) ( not ( = ?auto_1296439 ?auto_1296445 ) ) ( not ( = ?auto_1296439 ?auto_1296446 ) ) ( not ( = ?auto_1296439 ?auto_1296447 ) ) ( not ( = ?auto_1296439 ?auto_1296448 ) ) ( not ( = ?auto_1296439 ?auto_1296449 ) ) ( not ( = ?auto_1296439 ?auto_1296450 ) ) ( not ( = ?auto_1296439 ?auto_1296451 ) ) ( not ( = ?auto_1296440 ?auto_1296441 ) ) ( not ( = ?auto_1296440 ?auto_1296443 ) ) ( not ( = ?auto_1296440 ?auto_1296442 ) ) ( not ( = ?auto_1296440 ?auto_1296444 ) ) ( not ( = ?auto_1296440 ?auto_1296445 ) ) ( not ( = ?auto_1296440 ?auto_1296446 ) ) ( not ( = ?auto_1296440 ?auto_1296447 ) ) ( not ( = ?auto_1296440 ?auto_1296448 ) ) ( not ( = ?auto_1296440 ?auto_1296449 ) ) ( not ( = ?auto_1296440 ?auto_1296450 ) ) ( not ( = ?auto_1296440 ?auto_1296451 ) ) ( not ( = ?auto_1296441 ?auto_1296443 ) ) ( not ( = ?auto_1296441 ?auto_1296442 ) ) ( not ( = ?auto_1296441 ?auto_1296444 ) ) ( not ( = ?auto_1296441 ?auto_1296445 ) ) ( not ( = ?auto_1296441 ?auto_1296446 ) ) ( not ( = ?auto_1296441 ?auto_1296447 ) ) ( not ( = ?auto_1296441 ?auto_1296448 ) ) ( not ( = ?auto_1296441 ?auto_1296449 ) ) ( not ( = ?auto_1296441 ?auto_1296450 ) ) ( not ( = ?auto_1296441 ?auto_1296451 ) ) ( not ( = ?auto_1296443 ?auto_1296442 ) ) ( not ( = ?auto_1296443 ?auto_1296444 ) ) ( not ( = ?auto_1296443 ?auto_1296445 ) ) ( not ( = ?auto_1296443 ?auto_1296446 ) ) ( not ( = ?auto_1296443 ?auto_1296447 ) ) ( not ( = ?auto_1296443 ?auto_1296448 ) ) ( not ( = ?auto_1296443 ?auto_1296449 ) ) ( not ( = ?auto_1296443 ?auto_1296450 ) ) ( not ( = ?auto_1296443 ?auto_1296451 ) ) ( not ( = ?auto_1296442 ?auto_1296444 ) ) ( not ( = ?auto_1296442 ?auto_1296445 ) ) ( not ( = ?auto_1296442 ?auto_1296446 ) ) ( not ( = ?auto_1296442 ?auto_1296447 ) ) ( not ( = ?auto_1296442 ?auto_1296448 ) ) ( not ( = ?auto_1296442 ?auto_1296449 ) ) ( not ( = ?auto_1296442 ?auto_1296450 ) ) ( not ( = ?auto_1296442 ?auto_1296451 ) ) ( not ( = ?auto_1296444 ?auto_1296445 ) ) ( not ( = ?auto_1296444 ?auto_1296446 ) ) ( not ( = ?auto_1296444 ?auto_1296447 ) ) ( not ( = ?auto_1296444 ?auto_1296448 ) ) ( not ( = ?auto_1296444 ?auto_1296449 ) ) ( not ( = ?auto_1296444 ?auto_1296450 ) ) ( not ( = ?auto_1296444 ?auto_1296451 ) ) ( not ( = ?auto_1296445 ?auto_1296446 ) ) ( not ( = ?auto_1296445 ?auto_1296447 ) ) ( not ( = ?auto_1296445 ?auto_1296448 ) ) ( not ( = ?auto_1296445 ?auto_1296449 ) ) ( not ( = ?auto_1296445 ?auto_1296450 ) ) ( not ( = ?auto_1296445 ?auto_1296451 ) ) ( not ( = ?auto_1296446 ?auto_1296447 ) ) ( not ( = ?auto_1296446 ?auto_1296448 ) ) ( not ( = ?auto_1296446 ?auto_1296449 ) ) ( not ( = ?auto_1296446 ?auto_1296450 ) ) ( not ( = ?auto_1296446 ?auto_1296451 ) ) ( not ( = ?auto_1296447 ?auto_1296448 ) ) ( not ( = ?auto_1296447 ?auto_1296449 ) ) ( not ( = ?auto_1296447 ?auto_1296450 ) ) ( not ( = ?auto_1296447 ?auto_1296451 ) ) ( not ( = ?auto_1296448 ?auto_1296449 ) ) ( not ( = ?auto_1296448 ?auto_1296450 ) ) ( not ( = ?auto_1296448 ?auto_1296451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1296449 ?auto_1296450 ?auto_1296451 )
      ( MAKE-12CRATE-VERIFY ?auto_1296439 ?auto_1296440 ?auto_1296441 ?auto_1296443 ?auto_1296442 ?auto_1296444 ?auto_1296445 ?auto_1296446 ?auto_1296447 ?auto_1296448 ?auto_1296449 ?auto_1296450 ?auto_1296451 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1296577 - SURFACE
      ?auto_1296578 - SURFACE
      ?auto_1296579 - SURFACE
      ?auto_1296581 - SURFACE
      ?auto_1296580 - SURFACE
      ?auto_1296582 - SURFACE
      ?auto_1296583 - SURFACE
      ?auto_1296584 - SURFACE
      ?auto_1296585 - SURFACE
      ?auto_1296586 - SURFACE
      ?auto_1296587 - SURFACE
      ?auto_1296588 - SURFACE
      ?auto_1296589 - SURFACE
    )
    :vars
    (
      ?auto_1296592 - HOIST
      ?auto_1296593 - PLACE
      ?auto_1296590 - TRUCK
      ?auto_1296591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1296592 ?auto_1296593 ) ( SURFACE-AT ?auto_1296588 ?auto_1296593 ) ( CLEAR ?auto_1296588 ) ( IS-CRATE ?auto_1296589 ) ( not ( = ?auto_1296588 ?auto_1296589 ) ) ( AVAILABLE ?auto_1296592 ) ( IN ?auto_1296589 ?auto_1296590 ) ( ON ?auto_1296588 ?auto_1296587 ) ( not ( = ?auto_1296587 ?auto_1296588 ) ) ( not ( = ?auto_1296587 ?auto_1296589 ) ) ( TRUCK-AT ?auto_1296590 ?auto_1296591 ) ( not ( = ?auto_1296591 ?auto_1296593 ) ) ( ON ?auto_1296578 ?auto_1296577 ) ( ON ?auto_1296579 ?auto_1296578 ) ( ON ?auto_1296581 ?auto_1296579 ) ( ON ?auto_1296580 ?auto_1296581 ) ( ON ?auto_1296582 ?auto_1296580 ) ( ON ?auto_1296583 ?auto_1296582 ) ( ON ?auto_1296584 ?auto_1296583 ) ( ON ?auto_1296585 ?auto_1296584 ) ( ON ?auto_1296586 ?auto_1296585 ) ( ON ?auto_1296587 ?auto_1296586 ) ( not ( = ?auto_1296577 ?auto_1296578 ) ) ( not ( = ?auto_1296577 ?auto_1296579 ) ) ( not ( = ?auto_1296577 ?auto_1296581 ) ) ( not ( = ?auto_1296577 ?auto_1296580 ) ) ( not ( = ?auto_1296577 ?auto_1296582 ) ) ( not ( = ?auto_1296577 ?auto_1296583 ) ) ( not ( = ?auto_1296577 ?auto_1296584 ) ) ( not ( = ?auto_1296577 ?auto_1296585 ) ) ( not ( = ?auto_1296577 ?auto_1296586 ) ) ( not ( = ?auto_1296577 ?auto_1296587 ) ) ( not ( = ?auto_1296577 ?auto_1296588 ) ) ( not ( = ?auto_1296577 ?auto_1296589 ) ) ( not ( = ?auto_1296578 ?auto_1296579 ) ) ( not ( = ?auto_1296578 ?auto_1296581 ) ) ( not ( = ?auto_1296578 ?auto_1296580 ) ) ( not ( = ?auto_1296578 ?auto_1296582 ) ) ( not ( = ?auto_1296578 ?auto_1296583 ) ) ( not ( = ?auto_1296578 ?auto_1296584 ) ) ( not ( = ?auto_1296578 ?auto_1296585 ) ) ( not ( = ?auto_1296578 ?auto_1296586 ) ) ( not ( = ?auto_1296578 ?auto_1296587 ) ) ( not ( = ?auto_1296578 ?auto_1296588 ) ) ( not ( = ?auto_1296578 ?auto_1296589 ) ) ( not ( = ?auto_1296579 ?auto_1296581 ) ) ( not ( = ?auto_1296579 ?auto_1296580 ) ) ( not ( = ?auto_1296579 ?auto_1296582 ) ) ( not ( = ?auto_1296579 ?auto_1296583 ) ) ( not ( = ?auto_1296579 ?auto_1296584 ) ) ( not ( = ?auto_1296579 ?auto_1296585 ) ) ( not ( = ?auto_1296579 ?auto_1296586 ) ) ( not ( = ?auto_1296579 ?auto_1296587 ) ) ( not ( = ?auto_1296579 ?auto_1296588 ) ) ( not ( = ?auto_1296579 ?auto_1296589 ) ) ( not ( = ?auto_1296581 ?auto_1296580 ) ) ( not ( = ?auto_1296581 ?auto_1296582 ) ) ( not ( = ?auto_1296581 ?auto_1296583 ) ) ( not ( = ?auto_1296581 ?auto_1296584 ) ) ( not ( = ?auto_1296581 ?auto_1296585 ) ) ( not ( = ?auto_1296581 ?auto_1296586 ) ) ( not ( = ?auto_1296581 ?auto_1296587 ) ) ( not ( = ?auto_1296581 ?auto_1296588 ) ) ( not ( = ?auto_1296581 ?auto_1296589 ) ) ( not ( = ?auto_1296580 ?auto_1296582 ) ) ( not ( = ?auto_1296580 ?auto_1296583 ) ) ( not ( = ?auto_1296580 ?auto_1296584 ) ) ( not ( = ?auto_1296580 ?auto_1296585 ) ) ( not ( = ?auto_1296580 ?auto_1296586 ) ) ( not ( = ?auto_1296580 ?auto_1296587 ) ) ( not ( = ?auto_1296580 ?auto_1296588 ) ) ( not ( = ?auto_1296580 ?auto_1296589 ) ) ( not ( = ?auto_1296582 ?auto_1296583 ) ) ( not ( = ?auto_1296582 ?auto_1296584 ) ) ( not ( = ?auto_1296582 ?auto_1296585 ) ) ( not ( = ?auto_1296582 ?auto_1296586 ) ) ( not ( = ?auto_1296582 ?auto_1296587 ) ) ( not ( = ?auto_1296582 ?auto_1296588 ) ) ( not ( = ?auto_1296582 ?auto_1296589 ) ) ( not ( = ?auto_1296583 ?auto_1296584 ) ) ( not ( = ?auto_1296583 ?auto_1296585 ) ) ( not ( = ?auto_1296583 ?auto_1296586 ) ) ( not ( = ?auto_1296583 ?auto_1296587 ) ) ( not ( = ?auto_1296583 ?auto_1296588 ) ) ( not ( = ?auto_1296583 ?auto_1296589 ) ) ( not ( = ?auto_1296584 ?auto_1296585 ) ) ( not ( = ?auto_1296584 ?auto_1296586 ) ) ( not ( = ?auto_1296584 ?auto_1296587 ) ) ( not ( = ?auto_1296584 ?auto_1296588 ) ) ( not ( = ?auto_1296584 ?auto_1296589 ) ) ( not ( = ?auto_1296585 ?auto_1296586 ) ) ( not ( = ?auto_1296585 ?auto_1296587 ) ) ( not ( = ?auto_1296585 ?auto_1296588 ) ) ( not ( = ?auto_1296585 ?auto_1296589 ) ) ( not ( = ?auto_1296586 ?auto_1296587 ) ) ( not ( = ?auto_1296586 ?auto_1296588 ) ) ( not ( = ?auto_1296586 ?auto_1296589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1296587 ?auto_1296588 ?auto_1296589 )
      ( MAKE-12CRATE-VERIFY ?auto_1296577 ?auto_1296578 ?auto_1296579 ?auto_1296581 ?auto_1296580 ?auto_1296582 ?auto_1296583 ?auto_1296584 ?auto_1296585 ?auto_1296586 ?auto_1296587 ?auto_1296588 ?auto_1296589 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1296727 - SURFACE
      ?auto_1296728 - SURFACE
      ?auto_1296729 - SURFACE
      ?auto_1296731 - SURFACE
      ?auto_1296730 - SURFACE
      ?auto_1296732 - SURFACE
      ?auto_1296733 - SURFACE
      ?auto_1296734 - SURFACE
      ?auto_1296735 - SURFACE
      ?auto_1296736 - SURFACE
      ?auto_1296737 - SURFACE
      ?auto_1296738 - SURFACE
      ?auto_1296739 - SURFACE
    )
    :vars
    (
      ?auto_1296740 - HOIST
      ?auto_1296744 - PLACE
      ?auto_1296743 - TRUCK
      ?auto_1296742 - PLACE
      ?auto_1296741 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1296740 ?auto_1296744 ) ( SURFACE-AT ?auto_1296738 ?auto_1296744 ) ( CLEAR ?auto_1296738 ) ( IS-CRATE ?auto_1296739 ) ( not ( = ?auto_1296738 ?auto_1296739 ) ) ( AVAILABLE ?auto_1296740 ) ( ON ?auto_1296738 ?auto_1296737 ) ( not ( = ?auto_1296737 ?auto_1296738 ) ) ( not ( = ?auto_1296737 ?auto_1296739 ) ) ( TRUCK-AT ?auto_1296743 ?auto_1296742 ) ( not ( = ?auto_1296742 ?auto_1296744 ) ) ( HOIST-AT ?auto_1296741 ?auto_1296742 ) ( LIFTING ?auto_1296741 ?auto_1296739 ) ( not ( = ?auto_1296740 ?auto_1296741 ) ) ( ON ?auto_1296728 ?auto_1296727 ) ( ON ?auto_1296729 ?auto_1296728 ) ( ON ?auto_1296731 ?auto_1296729 ) ( ON ?auto_1296730 ?auto_1296731 ) ( ON ?auto_1296732 ?auto_1296730 ) ( ON ?auto_1296733 ?auto_1296732 ) ( ON ?auto_1296734 ?auto_1296733 ) ( ON ?auto_1296735 ?auto_1296734 ) ( ON ?auto_1296736 ?auto_1296735 ) ( ON ?auto_1296737 ?auto_1296736 ) ( not ( = ?auto_1296727 ?auto_1296728 ) ) ( not ( = ?auto_1296727 ?auto_1296729 ) ) ( not ( = ?auto_1296727 ?auto_1296731 ) ) ( not ( = ?auto_1296727 ?auto_1296730 ) ) ( not ( = ?auto_1296727 ?auto_1296732 ) ) ( not ( = ?auto_1296727 ?auto_1296733 ) ) ( not ( = ?auto_1296727 ?auto_1296734 ) ) ( not ( = ?auto_1296727 ?auto_1296735 ) ) ( not ( = ?auto_1296727 ?auto_1296736 ) ) ( not ( = ?auto_1296727 ?auto_1296737 ) ) ( not ( = ?auto_1296727 ?auto_1296738 ) ) ( not ( = ?auto_1296727 ?auto_1296739 ) ) ( not ( = ?auto_1296728 ?auto_1296729 ) ) ( not ( = ?auto_1296728 ?auto_1296731 ) ) ( not ( = ?auto_1296728 ?auto_1296730 ) ) ( not ( = ?auto_1296728 ?auto_1296732 ) ) ( not ( = ?auto_1296728 ?auto_1296733 ) ) ( not ( = ?auto_1296728 ?auto_1296734 ) ) ( not ( = ?auto_1296728 ?auto_1296735 ) ) ( not ( = ?auto_1296728 ?auto_1296736 ) ) ( not ( = ?auto_1296728 ?auto_1296737 ) ) ( not ( = ?auto_1296728 ?auto_1296738 ) ) ( not ( = ?auto_1296728 ?auto_1296739 ) ) ( not ( = ?auto_1296729 ?auto_1296731 ) ) ( not ( = ?auto_1296729 ?auto_1296730 ) ) ( not ( = ?auto_1296729 ?auto_1296732 ) ) ( not ( = ?auto_1296729 ?auto_1296733 ) ) ( not ( = ?auto_1296729 ?auto_1296734 ) ) ( not ( = ?auto_1296729 ?auto_1296735 ) ) ( not ( = ?auto_1296729 ?auto_1296736 ) ) ( not ( = ?auto_1296729 ?auto_1296737 ) ) ( not ( = ?auto_1296729 ?auto_1296738 ) ) ( not ( = ?auto_1296729 ?auto_1296739 ) ) ( not ( = ?auto_1296731 ?auto_1296730 ) ) ( not ( = ?auto_1296731 ?auto_1296732 ) ) ( not ( = ?auto_1296731 ?auto_1296733 ) ) ( not ( = ?auto_1296731 ?auto_1296734 ) ) ( not ( = ?auto_1296731 ?auto_1296735 ) ) ( not ( = ?auto_1296731 ?auto_1296736 ) ) ( not ( = ?auto_1296731 ?auto_1296737 ) ) ( not ( = ?auto_1296731 ?auto_1296738 ) ) ( not ( = ?auto_1296731 ?auto_1296739 ) ) ( not ( = ?auto_1296730 ?auto_1296732 ) ) ( not ( = ?auto_1296730 ?auto_1296733 ) ) ( not ( = ?auto_1296730 ?auto_1296734 ) ) ( not ( = ?auto_1296730 ?auto_1296735 ) ) ( not ( = ?auto_1296730 ?auto_1296736 ) ) ( not ( = ?auto_1296730 ?auto_1296737 ) ) ( not ( = ?auto_1296730 ?auto_1296738 ) ) ( not ( = ?auto_1296730 ?auto_1296739 ) ) ( not ( = ?auto_1296732 ?auto_1296733 ) ) ( not ( = ?auto_1296732 ?auto_1296734 ) ) ( not ( = ?auto_1296732 ?auto_1296735 ) ) ( not ( = ?auto_1296732 ?auto_1296736 ) ) ( not ( = ?auto_1296732 ?auto_1296737 ) ) ( not ( = ?auto_1296732 ?auto_1296738 ) ) ( not ( = ?auto_1296732 ?auto_1296739 ) ) ( not ( = ?auto_1296733 ?auto_1296734 ) ) ( not ( = ?auto_1296733 ?auto_1296735 ) ) ( not ( = ?auto_1296733 ?auto_1296736 ) ) ( not ( = ?auto_1296733 ?auto_1296737 ) ) ( not ( = ?auto_1296733 ?auto_1296738 ) ) ( not ( = ?auto_1296733 ?auto_1296739 ) ) ( not ( = ?auto_1296734 ?auto_1296735 ) ) ( not ( = ?auto_1296734 ?auto_1296736 ) ) ( not ( = ?auto_1296734 ?auto_1296737 ) ) ( not ( = ?auto_1296734 ?auto_1296738 ) ) ( not ( = ?auto_1296734 ?auto_1296739 ) ) ( not ( = ?auto_1296735 ?auto_1296736 ) ) ( not ( = ?auto_1296735 ?auto_1296737 ) ) ( not ( = ?auto_1296735 ?auto_1296738 ) ) ( not ( = ?auto_1296735 ?auto_1296739 ) ) ( not ( = ?auto_1296736 ?auto_1296737 ) ) ( not ( = ?auto_1296736 ?auto_1296738 ) ) ( not ( = ?auto_1296736 ?auto_1296739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1296737 ?auto_1296738 ?auto_1296739 )
      ( MAKE-12CRATE-VERIFY ?auto_1296727 ?auto_1296728 ?auto_1296729 ?auto_1296731 ?auto_1296730 ?auto_1296732 ?auto_1296733 ?auto_1296734 ?auto_1296735 ?auto_1296736 ?auto_1296737 ?auto_1296738 ?auto_1296739 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1296889 - SURFACE
      ?auto_1296890 - SURFACE
      ?auto_1296891 - SURFACE
      ?auto_1296893 - SURFACE
      ?auto_1296892 - SURFACE
      ?auto_1296894 - SURFACE
      ?auto_1296895 - SURFACE
      ?auto_1296896 - SURFACE
      ?auto_1296897 - SURFACE
      ?auto_1296898 - SURFACE
      ?auto_1296899 - SURFACE
      ?auto_1296900 - SURFACE
      ?auto_1296901 - SURFACE
    )
    :vars
    (
      ?auto_1296905 - HOIST
      ?auto_1296904 - PLACE
      ?auto_1296906 - TRUCK
      ?auto_1296902 - PLACE
      ?auto_1296903 - HOIST
      ?auto_1296907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1296905 ?auto_1296904 ) ( SURFACE-AT ?auto_1296900 ?auto_1296904 ) ( CLEAR ?auto_1296900 ) ( IS-CRATE ?auto_1296901 ) ( not ( = ?auto_1296900 ?auto_1296901 ) ) ( AVAILABLE ?auto_1296905 ) ( ON ?auto_1296900 ?auto_1296899 ) ( not ( = ?auto_1296899 ?auto_1296900 ) ) ( not ( = ?auto_1296899 ?auto_1296901 ) ) ( TRUCK-AT ?auto_1296906 ?auto_1296902 ) ( not ( = ?auto_1296902 ?auto_1296904 ) ) ( HOIST-AT ?auto_1296903 ?auto_1296902 ) ( not ( = ?auto_1296905 ?auto_1296903 ) ) ( AVAILABLE ?auto_1296903 ) ( SURFACE-AT ?auto_1296901 ?auto_1296902 ) ( ON ?auto_1296901 ?auto_1296907 ) ( CLEAR ?auto_1296901 ) ( not ( = ?auto_1296900 ?auto_1296907 ) ) ( not ( = ?auto_1296901 ?auto_1296907 ) ) ( not ( = ?auto_1296899 ?auto_1296907 ) ) ( ON ?auto_1296890 ?auto_1296889 ) ( ON ?auto_1296891 ?auto_1296890 ) ( ON ?auto_1296893 ?auto_1296891 ) ( ON ?auto_1296892 ?auto_1296893 ) ( ON ?auto_1296894 ?auto_1296892 ) ( ON ?auto_1296895 ?auto_1296894 ) ( ON ?auto_1296896 ?auto_1296895 ) ( ON ?auto_1296897 ?auto_1296896 ) ( ON ?auto_1296898 ?auto_1296897 ) ( ON ?auto_1296899 ?auto_1296898 ) ( not ( = ?auto_1296889 ?auto_1296890 ) ) ( not ( = ?auto_1296889 ?auto_1296891 ) ) ( not ( = ?auto_1296889 ?auto_1296893 ) ) ( not ( = ?auto_1296889 ?auto_1296892 ) ) ( not ( = ?auto_1296889 ?auto_1296894 ) ) ( not ( = ?auto_1296889 ?auto_1296895 ) ) ( not ( = ?auto_1296889 ?auto_1296896 ) ) ( not ( = ?auto_1296889 ?auto_1296897 ) ) ( not ( = ?auto_1296889 ?auto_1296898 ) ) ( not ( = ?auto_1296889 ?auto_1296899 ) ) ( not ( = ?auto_1296889 ?auto_1296900 ) ) ( not ( = ?auto_1296889 ?auto_1296901 ) ) ( not ( = ?auto_1296889 ?auto_1296907 ) ) ( not ( = ?auto_1296890 ?auto_1296891 ) ) ( not ( = ?auto_1296890 ?auto_1296893 ) ) ( not ( = ?auto_1296890 ?auto_1296892 ) ) ( not ( = ?auto_1296890 ?auto_1296894 ) ) ( not ( = ?auto_1296890 ?auto_1296895 ) ) ( not ( = ?auto_1296890 ?auto_1296896 ) ) ( not ( = ?auto_1296890 ?auto_1296897 ) ) ( not ( = ?auto_1296890 ?auto_1296898 ) ) ( not ( = ?auto_1296890 ?auto_1296899 ) ) ( not ( = ?auto_1296890 ?auto_1296900 ) ) ( not ( = ?auto_1296890 ?auto_1296901 ) ) ( not ( = ?auto_1296890 ?auto_1296907 ) ) ( not ( = ?auto_1296891 ?auto_1296893 ) ) ( not ( = ?auto_1296891 ?auto_1296892 ) ) ( not ( = ?auto_1296891 ?auto_1296894 ) ) ( not ( = ?auto_1296891 ?auto_1296895 ) ) ( not ( = ?auto_1296891 ?auto_1296896 ) ) ( not ( = ?auto_1296891 ?auto_1296897 ) ) ( not ( = ?auto_1296891 ?auto_1296898 ) ) ( not ( = ?auto_1296891 ?auto_1296899 ) ) ( not ( = ?auto_1296891 ?auto_1296900 ) ) ( not ( = ?auto_1296891 ?auto_1296901 ) ) ( not ( = ?auto_1296891 ?auto_1296907 ) ) ( not ( = ?auto_1296893 ?auto_1296892 ) ) ( not ( = ?auto_1296893 ?auto_1296894 ) ) ( not ( = ?auto_1296893 ?auto_1296895 ) ) ( not ( = ?auto_1296893 ?auto_1296896 ) ) ( not ( = ?auto_1296893 ?auto_1296897 ) ) ( not ( = ?auto_1296893 ?auto_1296898 ) ) ( not ( = ?auto_1296893 ?auto_1296899 ) ) ( not ( = ?auto_1296893 ?auto_1296900 ) ) ( not ( = ?auto_1296893 ?auto_1296901 ) ) ( not ( = ?auto_1296893 ?auto_1296907 ) ) ( not ( = ?auto_1296892 ?auto_1296894 ) ) ( not ( = ?auto_1296892 ?auto_1296895 ) ) ( not ( = ?auto_1296892 ?auto_1296896 ) ) ( not ( = ?auto_1296892 ?auto_1296897 ) ) ( not ( = ?auto_1296892 ?auto_1296898 ) ) ( not ( = ?auto_1296892 ?auto_1296899 ) ) ( not ( = ?auto_1296892 ?auto_1296900 ) ) ( not ( = ?auto_1296892 ?auto_1296901 ) ) ( not ( = ?auto_1296892 ?auto_1296907 ) ) ( not ( = ?auto_1296894 ?auto_1296895 ) ) ( not ( = ?auto_1296894 ?auto_1296896 ) ) ( not ( = ?auto_1296894 ?auto_1296897 ) ) ( not ( = ?auto_1296894 ?auto_1296898 ) ) ( not ( = ?auto_1296894 ?auto_1296899 ) ) ( not ( = ?auto_1296894 ?auto_1296900 ) ) ( not ( = ?auto_1296894 ?auto_1296901 ) ) ( not ( = ?auto_1296894 ?auto_1296907 ) ) ( not ( = ?auto_1296895 ?auto_1296896 ) ) ( not ( = ?auto_1296895 ?auto_1296897 ) ) ( not ( = ?auto_1296895 ?auto_1296898 ) ) ( not ( = ?auto_1296895 ?auto_1296899 ) ) ( not ( = ?auto_1296895 ?auto_1296900 ) ) ( not ( = ?auto_1296895 ?auto_1296901 ) ) ( not ( = ?auto_1296895 ?auto_1296907 ) ) ( not ( = ?auto_1296896 ?auto_1296897 ) ) ( not ( = ?auto_1296896 ?auto_1296898 ) ) ( not ( = ?auto_1296896 ?auto_1296899 ) ) ( not ( = ?auto_1296896 ?auto_1296900 ) ) ( not ( = ?auto_1296896 ?auto_1296901 ) ) ( not ( = ?auto_1296896 ?auto_1296907 ) ) ( not ( = ?auto_1296897 ?auto_1296898 ) ) ( not ( = ?auto_1296897 ?auto_1296899 ) ) ( not ( = ?auto_1296897 ?auto_1296900 ) ) ( not ( = ?auto_1296897 ?auto_1296901 ) ) ( not ( = ?auto_1296897 ?auto_1296907 ) ) ( not ( = ?auto_1296898 ?auto_1296899 ) ) ( not ( = ?auto_1296898 ?auto_1296900 ) ) ( not ( = ?auto_1296898 ?auto_1296901 ) ) ( not ( = ?auto_1296898 ?auto_1296907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1296899 ?auto_1296900 ?auto_1296901 )
      ( MAKE-12CRATE-VERIFY ?auto_1296889 ?auto_1296890 ?auto_1296891 ?auto_1296893 ?auto_1296892 ?auto_1296894 ?auto_1296895 ?auto_1296896 ?auto_1296897 ?auto_1296898 ?auto_1296899 ?auto_1296900 ?auto_1296901 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297052 - SURFACE
      ?auto_1297053 - SURFACE
      ?auto_1297054 - SURFACE
      ?auto_1297056 - SURFACE
      ?auto_1297055 - SURFACE
      ?auto_1297057 - SURFACE
      ?auto_1297058 - SURFACE
      ?auto_1297059 - SURFACE
      ?auto_1297060 - SURFACE
      ?auto_1297061 - SURFACE
      ?auto_1297062 - SURFACE
      ?auto_1297063 - SURFACE
      ?auto_1297064 - SURFACE
    )
    :vars
    (
      ?auto_1297068 - HOIST
      ?auto_1297065 - PLACE
      ?auto_1297067 - PLACE
      ?auto_1297070 - HOIST
      ?auto_1297069 - SURFACE
      ?auto_1297066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297068 ?auto_1297065 ) ( SURFACE-AT ?auto_1297063 ?auto_1297065 ) ( CLEAR ?auto_1297063 ) ( IS-CRATE ?auto_1297064 ) ( not ( = ?auto_1297063 ?auto_1297064 ) ) ( AVAILABLE ?auto_1297068 ) ( ON ?auto_1297063 ?auto_1297062 ) ( not ( = ?auto_1297062 ?auto_1297063 ) ) ( not ( = ?auto_1297062 ?auto_1297064 ) ) ( not ( = ?auto_1297067 ?auto_1297065 ) ) ( HOIST-AT ?auto_1297070 ?auto_1297067 ) ( not ( = ?auto_1297068 ?auto_1297070 ) ) ( AVAILABLE ?auto_1297070 ) ( SURFACE-AT ?auto_1297064 ?auto_1297067 ) ( ON ?auto_1297064 ?auto_1297069 ) ( CLEAR ?auto_1297064 ) ( not ( = ?auto_1297063 ?auto_1297069 ) ) ( not ( = ?auto_1297064 ?auto_1297069 ) ) ( not ( = ?auto_1297062 ?auto_1297069 ) ) ( TRUCK-AT ?auto_1297066 ?auto_1297065 ) ( ON ?auto_1297053 ?auto_1297052 ) ( ON ?auto_1297054 ?auto_1297053 ) ( ON ?auto_1297056 ?auto_1297054 ) ( ON ?auto_1297055 ?auto_1297056 ) ( ON ?auto_1297057 ?auto_1297055 ) ( ON ?auto_1297058 ?auto_1297057 ) ( ON ?auto_1297059 ?auto_1297058 ) ( ON ?auto_1297060 ?auto_1297059 ) ( ON ?auto_1297061 ?auto_1297060 ) ( ON ?auto_1297062 ?auto_1297061 ) ( not ( = ?auto_1297052 ?auto_1297053 ) ) ( not ( = ?auto_1297052 ?auto_1297054 ) ) ( not ( = ?auto_1297052 ?auto_1297056 ) ) ( not ( = ?auto_1297052 ?auto_1297055 ) ) ( not ( = ?auto_1297052 ?auto_1297057 ) ) ( not ( = ?auto_1297052 ?auto_1297058 ) ) ( not ( = ?auto_1297052 ?auto_1297059 ) ) ( not ( = ?auto_1297052 ?auto_1297060 ) ) ( not ( = ?auto_1297052 ?auto_1297061 ) ) ( not ( = ?auto_1297052 ?auto_1297062 ) ) ( not ( = ?auto_1297052 ?auto_1297063 ) ) ( not ( = ?auto_1297052 ?auto_1297064 ) ) ( not ( = ?auto_1297052 ?auto_1297069 ) ) ( not ( = ?auto_1297053 ?auto_1297054 ) ) ( not ( = ?auto_1297053 ?auto_1297056 ) ) ( not ( = ?auto_1297053 ?auto_1297055 ) ) ( not ( = ?auto_1297053 ?auto_1297057 ) ) ( not ( = ?auto_1297053 ?auto_1297058 ) ) ( not ( = ?auto_1297053 ?auto_1297059 ) ) ( not ( = ?auto_1297053 ?auto_1297060 ) ) ( not ( = ?auto_1297053 ?auto_1297061 ) ) ( not ( = ?auto_1297053 ?auto_1297062 ) ) ( not ( = ?auto_1297053 ?auto_1297063 ) ) ( not ( = ?auto_1297053 ?auto_1297064 ) ) ( not ( = ?auto_1297053 ?auto_1297069 ) ) ( not ( = ?auto_1297054 ?auto_1297056 ) ) ( not ( = ?auto_1297054 ?auto_1297055 ) ) ( not ( = ?auto_1297054 ?auto_1297057 ) ) ( not ( = ?auto_1297054 ?auto_1297058 ) ) ( not ( = ?auto_1297054 ?auto_1297059 ) ) ( not ( = ?auto_1297054 ?auto_1297060 ) ) ( not ( = ?auto_1297054 ?auto_1297061 ) ) ( not ( = ?auto_1297054 ?auto_1297062 ) ) ( not ( = ?auto_1297054 ?auto_1297063 ) ) ( not ( = ?auto_1297054 ?auto_1297064 ) ) ( not ( = ?auto_1297054 ?auto_1297069 ) ) ( not ( = ?auto_1297056 ?auto_1297055 ) ) ( not ( = ?auto_1297056 ?auto_1297057 ) ) ( not ( = ?auto_1297056 ?auto_1297058 ) ) ( not ( = ?auto_1297056 ?auto_1297059 ) ) ( not ( = ?auto_1297056 ?auto_1297060 ) ) ( not ( = ?auto_1297056 ?auto_1297061 ) ) ( not ( = ?auto_1297056 ?auto_1297062 ) ) ( not ( = ?auto_1297056 ?auto_1297063 ) ) ( not ( = ?auto_1297056 ?auto_1297064 ) ) ( not ( = ?auto_1297056 ?auto_1297069 ) ) ( not ( = ?auto_1297055 ?auto_1297057 ) ) ( not ( = ?auto_1297055 ?auto_1297058 ) ) ( not ( = ?auto_1297055 ?auto_1297059 ) ) ( not ( = ?auto_1297055 ?auto_1297060 ) ) ( not ( = ?auto_1297055 ?auto_1297061 ) ) ( not ( = ?auto_1297055 ?auto_1297062 ) ) ( not ( = ?auto_1297055 ?auto_1297063 ) ) ( not ( = ?auto_1297055 ?auto_1297064 ) ) ( not ( = ?auto_1297055 ?auto_1297069 ) ) ( not ( = ?auto_1297057 ?auto_1297058 ) ) ( not ( = ?auto_1297057 ?auto_1297059 ) ) ( not ( = ?auto_1297057 ?auto_1297060 ) ) ( not ( = ?auto_1297057 ?auto_1297061 ) ) ( not ( = ?auto_1297057 ?auto_1297062 ) ) ( not ( = ?auto_1297057 ?auto_1297063 ) ) ( not ( = ?auto_1297057 ?auto_1297064 ) ) ( not ( = ?auto_1297057 ?auto_1297069 ) ) ( not ( = ?auto_1297058 ?auto_1297059 ) ) ( not ( = ?auto_1297058 ?auto_1297060 ) ) ( not ( = ?auto_1297058 ?auto_1297061 ) ) ( not ( = ?auto_1297058 ?auto_1297062 ) ) ( not ( = ?auto_1297058 ?auto_1297063 ) ) ( not ( = ?auto_1297058 ?auto_1297064 ) ) ( not ( = ?auto_1297058 ?auto_1297069 ) ) ( not ( = ?auto_1297059 ?auto_1297060 ) ) ( not ( = ?auto_1297059 ?auto_1297061 ) ) ( not ( = ?auto_1297059 ?auto_1297062 ) ) ( not ( = ?auto_1297059 ?auto_1297063 ) ) ( not ( = ?auto_1297059 ?auto_1297064 ) ) ( not ( = ?auto_1297059 ?auto_1297069 ) ) ( not ( = ?auto_1297060 ?auto_1297061 ) ) ( not ( = ?auto_1297060 ?auto_1297062 ) ) ( not ( = ?auto_1297060 ?auto_1297063 ) ) ( not ( = ?auto_1297060 ?auto_1297064 ) ) ( not ( = ?auto_1297060 ?auto_1297069 ) ) ( not ( = ?auto_1297061 ?auto_1297062 ) ) ( not ( = ?auto_1297061 ?auto_1297063 ) ) ( not ( = ?auto_1297061 ?auto_1297064 ) ) ( not ( = ?auto_1297061 ?auto_1297069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297062 ?auto_1297063 ?auto_1297064 )
      ( MAKE-12CRATE-VERIFY ?auto_1297052 ?auto_1297053 ?auto_1297054 ?auto_1297056 ?auto_1297055 ?auto_1297057 ?auto_1297058 ?auto_1297059 ?auto_1297060 ?auto_1297061 ?auto_1297062 ?auto_1297063 ?auto_1297064 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297215 - SURFACE
      ?auto_1297216 - SURFACE
      ?auto_1297217 - SURFACE
      ?auto_1297219 - SURFACE
      ?auto_1297218 - SURFACE
      ?auto_1297220 - SURFACE
      ?auto_1297221 - SURFACE
      ?auto_1297222 - SURFACE
      ?auto_1297223 - SURFACE
      ?auto_1297224 - SURFACE
      ?auto_1297225 - SURFACE
      ?auto_1297226 - SURFACE
      ?auto_1297227 - SURFACE
    )
    :vars
    (
      ?auto_1297229 - HOIST
      ?auto_1297231 - PLACE
      ?auto_1297233 - PLACE
      ?auto_1297228 - HOIST
      ?auto_1297230 - SURFACE
      ?auto_1297232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297229 ?auto_1297231 ) ( IS-CRATE ?auto_1297227 ) ( not ( = ?auto_1297226 ?auto_1297227 ) ) ( not ( = ?auto_1297225 ?auto_1297226 ) ) ( not ( = ?auto_1297225 ?auto_1297227 ) ) ( not ( = ?auto_1297233 ?auto_1297231 ) ) ( HOIST-AT ?auto_1297228 ?auto_1297233 ) ( not ( = ?auto_1297229 ?auto_1297228 ) ) ( AVAILABLE ?auto_1297228 ) ( SURFACE-AT ?auto_1297227 ?auto_1297233 ) ( ON ?auto_1297227 ?auto_1297230 ) ( CLEAR ?auto_1297227 ) ( not ( = ?auto_1297226 ?auto_1297230 ) ) ( not ( = ?auto_1297227 ?auto_1297230 ) ) ( not ( = ?auto_1297225 ?auto_1297230 ) ) ( TRUCK-AT ?auto_1297232 ?auto_1297231 ) ( SURFACE-AT ?auto_1297225 ?auto_1297231 ) ( CLEAR ?auto_1297225 ) ( LIFTING ?auto_1297229 ?auto_1297226 ) ( IS-CRATE ?auto_1297226 ) ( ON ?auto_1297216 ?auto_1297215 ) ( ON ?auto_1297217 ?auto_1297216 ) ( ON ?auto_1297219 ?auto_1297217 ) ( ON ?auto_1297218 ?auto_1297219 ) ( ON ?auto_1297220 ?auto_1297218 ) ( ON ?auto_1297221 ?auto_1297220 ) ( ON ?auto_1297222 ?auto_1297221 ) ( ON ?auto_1297223 ?auto_1297222 ) ( ON ?auto_1297224 ?auto_1297223 ) ( ON ?auto_1297225 ?auto_1297224 ) ( not ( = ?auto_1297215 ?auto_1297216 ) ) ( not ( = ?auto_1297215 ?auto_1297217 ) ) ( not ( = ?auto_1297215 ?auto_1297219 ) ) ( not ( = ?auto_1297215 ?auto_1297218 ) ) ( not ( = ?auto_1297215 ?auto_1297220 ) ) ( not ( = ?auto_1297215 ?auto_1297221 ) ) ( not ( = ?auto_1297215 ?auto_1297222 ) ) ( not ( = ?auto_1297215 ?auto_1297223 ) ) ( not ( = ?auto_1297215 ?auto_1297224 ) ) ( not ( = ?auto_1297215 ?auto_1297225 ) ) ( not ( = ?auto_1297215 ?auto_1297226 ) ) ( not ( = ?auto_1297215 ?auto_1297227 ) ) ( not ( = ?auto_1297215 ?auto_1297230 ) ) ( not ( = ?auto_1297216 ?auto_1297217 ) ) ( not ( = ?auto_1297216 ?auto_1297219 ) ) ( not ( = ?auto_1297216 ?auto_1297218 ) ) ( not ( = ?auto_1297216 ?auto_1297220 ) ) ( not ( = ?auto_1297216 ?auto_1297221 ) ) ( not ( = ?auto_1297216 ?auto_1297222 ) ) ( not ( = ?auto_1297216 ?auto_1297223 ) ) ( not ( = ?auto_1297216 ?auto_1297224 ) ) ( not ( = ?auto_1297216 ?auto_1297225 ) ) ( not ( = ?auto_1297216 ?auto_1297226 ) ) ( not ( = ?auto_1297216 ?auto_1297227 ) ) ( not ( = ?auto_1297216 ?auto_1297230 ) ) ( not ( = ?auto_1297217 ?auto_1297219 ) ) ( not ( = ?auto_1297217 ?auto_1297218 ) ) ( not ( = ?auto_1297217 ?auto_1297220 ) ) ( not ( = ?auto_1297217 ?auto_1297221 ) ) ( not ( = ?auto_1297217 ?auto_1297222 ) ) ( not ( = ?auto_1297217 ?auto_1297223 ) ) ( not ( = ?auto_1297217 ?auto_1297224 ) ) ( not ( = ?auto_1297217 ?auto_1297225 ) ) ( not ( = ?auto_1297217 ?auto_1297226 ) ) ( not ( = ?auto_1297217 ?auto_1297227 ) ) ( not ( = ?auto_1297217 ?auto_1297230 ) ) ( not ( = ?auto_1297219 ?auto_1297218 ) ) ( not ( = ?auto_1297219 ?auto_1297220 ) ) ( not ( = ?auto_1297219 ?auto_1297221 ) ) ( not ( = ?auto_1297219 ?auto_1297222 ) ) ( not ( = ?auto_1297219 ?auto_1297223 ) ) ( not ( = ?auto_1297219 ?auto_1297224 ) ) ( not ( = ?auto_1297219 ?auto_1297225 ) ) ( not ( = ?auto_1297219 ?auto_1297226 ) ) ( not ( = ?auto_1297219 ?auto_1297227 ) ) ( not ( = ?auto_1297219 ?auto_1297230 ) ) ( not ( = ?auto_1297218 ?auto_1297220 ) ) ( not ( = ?auto_1297218 ?auto_1297221 ) ) ( not ( = ?auto_1297218 ?auto_1297222 ) ) ( not ( = ?auto_1297218 ?auto_1297223 ) ) ( not ( = ?auto_1297218 ?auto_1297224 ) ) ( not ( = ?auto_1297218 ?auto_1297225 ) ) ( not ( = ?auto_1297218 ?auto_1297226 ) ) ( not ( = ?auto_1297218 ?auto_1297227 ) ) ( not ( = ?auto_1297218 ?auto_1297230 ) ) ( not ( = ?auto_1297220 ?auto_1297221 ) ) ( not ( = ?auto_1297220 ?auto_1297222 ) ) ( not ( = ?auto_1297220 ?auto_1297223 ) ) ( not ( = ?auto_1297220 ?auto_1297224 ) ) ( not ( = ?auto_1297220 ?auto_1297225 ) ) ( not ( = ?auto_1297220 ?auto_1297226 ) ) ( not ( = ?auto_1297220 ?auto_1297227 ) ) ( not ( = ?auto_1297220 ?auto_1297230 ) ) ( not ( = ?auto_1297221 ?auto_1297222 ) ) ( not ( = ?auto_1297221 ?auto_1297223 ) ) ( not ( = ?auto_1297221 ?auto_1297224 ) ) ( not ( = ?auto_1297221 ?auto_1297225 ) ) ( not ( = ?auto_1297221 ?auto_1297226 ) ) ( not ( = ?auto_1297221 ?auto_1297227 ) ) ( not ( = ?auto_1297221 ?auto_1297230 ) ) ( not ( = ?auto_1297222 ?auto_1297223 ) ) ( not ( = ?auto_1297222 ?auto_1297224 ) ) ( not ( = ?auto_1297222 ?auto_1297225 ) ) ( not ( = ?auto_1297222 ?auto_1297226 ) ) ( not ( = ?auto_1297222 ?auto_1297227 ) ) ( not ( = ?auto_1297222 ?auto_1297230 ) ) ( not ( = ?auto_1297223 ?auto_1297224 ) ) ( not ( = ?auto_1297223 ?auto_1297225 ) ) ( not ( = ?auto_1297223 ?auto_1297226 ) ) ( not ( = ?auto_1297223 ?auto_1297227 ) ) ( not ( = ?auto_1297223 ?auto_1297230 ) ) ( not ( = ?auto_1297224 ?auto_1297225 ) ) ( not ( = ?auto_1297224 ?auto_1297226 ) ) ( not ( = ?auto_1297224 ?auto_1297227 ) ) ( not ( = ?auto_1297224 ?auto_1297230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297225 ?auto_1297226 ?auto_1297227 )
      ( MAKE-12CRATE-VERIFY ?auto_1297215 ?auto_1297216 ?auto_1297217 ?auto_1297219 ?auto_1297218 ?auto_1297220 ?auto_1297221 ?auto_1297222 ?auto_1297223 ?auto_1297224 ?auto_1297225 ?auto_1297226 ?auto_1297227 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1297378 - SURFACE
      ?auto_1297379 - SURFACE
      ?auto_1297380 - SURFACE
      ?auto_1297382 - SURFACE
      ?auto_1297381 - SURFACE
      ?auto_1297383 - SURFACE
      ?auto_1297384 - SURFACE
      ?auto_1297385 - SURFACE
      ?auto_1297386 - SURFACE
      ?auto_1297387 - SURFACE
      ?auto_1297388 - SURFACE
      ?auto_1297389 - SURFACE
      ?auto_1297390 - SURFACE
    )
    :vars
    (
      ?auto_1297392 - HOIST
      ?auto_1297396 - PLACE
      ?auto_1297393 - PLACE
      ?auto_1297395 - HOIST
      ?auto_1297391 - SURFACE
      ?auto_1297394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1297392 ?auto_1297396 ) ( IS-CRATE ?auto_1297390 ) ( not ( = ?auto_1297389 ?auto_1297390 ) ) ( not ( = ?auto_1297388 ?auto_1297389 ) ) ( not ( = ?auto_1297388 ?auto_1297390 ) ) ( not ( = ?auto_1297393 ?auto_1297396 ) ) ( HOIST-AT ?auto_1297395 ?auto_1297393 ) ( not ( = ?auto_1297392 ?auto_1297395 ) ) ( AVAILABLE ?auto_1297395 ) ( SURFACE-AT ?auto_1297390 ?auto_1297393 ) ( ON ?auto_1297390 ?auto_1297391 ) ( CLEAR ?auto_1297390 ) ( not ( = ?auto_1297389 ?auto_1297391 ) ) ( not ( = ?auto_1297390 ?auto_1297391 ) ) ( not ( = ?auto_1297388 ?auto_1297391 ) ) ( TRUCK-AT ?auto_1297394 ?auto_1297396 ) ( SURFACE-AT ?auto_1297388 ?auto_1297396 ) ( CLEAR ?auto_1297388 ) ( IS-CRATE ?auto_1297389 ) ( AVAILABLE ?auto_1297392 ) ( IN ?auto_1297389 ?auto_1297394 ) ( ON ?auto_1297379 ?auto_1297378 ) ( ON ?auto_1297380 ?auto_1297379 ) ( ON ?auto_1297382 ?auto_1297380 ) ( ON ?auto_1297381 ?auto_1297382 ) ( ON ?auto_1297383 ?auto_1297381 ) ( ON ?auto_1297384 ?auto_1297383 ) ( ON ?auto_1297385 ?auto_1297384 ) ( ON ?auto_1297386 ?auto_1297385 ) ( ON ?auto_1297387 ?auto_1297386 ) ( ON ?auto_1297388 ?auto_1297387 ) ( not ( = ?auto_1297378 ?auto_1297379 ) ) ( not ( = ?auto_1297378 ?auto_1297380 ) ) ( not ( = ?auto_1297378 ?auto_1297382 ) ) ( not ( = ?auto_1297378 ?auto_1297381 ) ) ( not ( = ?auto_1297378 ?auto_1297383 ) ) ( not ( = ?auto_1297378 ?auto_1297384 ) ) ( not ( = ?auto_1297378 ?auto_1297385 ) ) ( not ( = ?auto_1297378 ?auto_1297386 ) ) ( not ( = ?auto_1297378 ?auto_1297387 ) ) ( not ( = ?auto_1297378 ?auto_1297388 ) ) ( not ( = ?auto_1297378 ?auto_1297389 ) ) ( not ( = ?auto_1297378 ?auto_1297390 ) ) ( not ( = ?auto_1297378 ?auto_1297391 ) ) ( not ( = ?auto_1297379 ?auto_1297380 ) ) ( not ( = ?auto_1297379 ?auto_1297382 ) ) ( not ( = ?auto_1297379 ?auto_1297381 ) ) ( not ( = ?auto_1297379 ?auto_1297383 ) ) ( not ( = ?auto_1297379 ?auto_1297384 ) ) ( not ( = ?auto_1297379 ?auto_1297385 ) ) ( not ( = ?auto_1297379 ?auto_1297386 ) ) ( not ( = ?auto_1297379 ?auto_1297387 ) ) ( not ( = ?auto_1297379 ?auto_1297388 ) ) ( not ( = ?auto_1297379 ?auto_1297389 ) ) ( not ( = ?auto_1297379 ?auto_1297390 ) ) ( not ( = ?auto_1297379 ?auto_1297391 ) ) ( not ( = ?auto_1297380 ?auto_1297382 ) ) ( not ( = ?auto_1297380 ?auto_1297381 ) ) ( not ( = ?auto_1297380 ?auto_1297383 ) ) ( not ( = ?auto_1297380 ?auto_1297384 ) ) ( not ( = ?auto_1297380 ?auto_1297385 ) ) ( not ( = ?auto_1297380 ?auto_1297386 ) ) ( not ( = ?auto_1297380 ?auto_1297387 ) ) ( not ( = ?auto_1297380 ?auto_1297388 ) ) ( not ( = ?auto_1297380 ?auto_1297389 ) ) ( not ( = ?auto_1297380 ?auto_1297390 ) ) ( not ( = ?auto_1297380 ?auto_1297391 ) ) ( not ( = ?auto_1297382 ?auto_1297381 ) ) ( not ( = ?auto_1297382 ?auto_1297383 ) ) ( not ( = ?auto_1297382 ?auto_1297384 ) ) ( not ( = ?auto_1297382 ?auto_1297385 ) ) ( not ( = ?auto_1297382 ?auto_1297386 ) ) ( not ( = ?auto_1297382 ?auto_1297387 ) ) ( not ( = ?auto_1297382 ?auto_1297388 ) ) ( not ( = ?auto_1297382 ?auto_1297389 ) ) ( not ( = ?auto_1297382 ?auto_1297390 ) ) ( not ( = ?auto_1297382 ?auto_1297391 ) ) ( not ( = ?auto_1297381 ?auto_1297383 ) ) ( not ( = ?auto_1297381 ?auto_1297384 ) ) ( not ( = ?auto_1297381 ?auto_1297385 ) ) ( not ( = ?auto_1297381 ?auto_1297386 ) ) ( not ( = ?auto_1297381 ?auto_1297387 ) ) ( not ( = ?auto_1297381 ?auto_1297388 ) ) ( not ( = ?auto_1297381 ?auto_1297389 ) ) ( not ( = ?auto_1297381 ?auto_1297390 ) ) ( not ( = ?auto_1297381 ?auto_1297391 ) ) ( not ( = ?auto_1297383 ?auto_1297384 ) ) ( not ( = ?auto_1297383 ?auto_1297385 ) ) ( not ( = ?auto_1297383 ?auto_1297386 ) ) ( not ( = ?auto_1297383 ?auto_1297387 ) ) ( not ( = ?auto_1297383 ?auto_1297388 ) ) ( not ( = ?auto_1297383 ?auto_1297389 ) ) ( not ( = ?auto_1297383 ?auto_1297390 ) ) ( not ( = ?auto_1297383 ?auto_1297391 ) ) ( not ( = ?auto_1297384 ?auto_1297385 ) ) ( not ( = ?auto_1297384 ?auto_1297386 ) ) ( not ( = ?auto_1297384 ?auto_1297387 ) ) ( not ( = ?auto_1297384 ?auto_1297388 ) ) ( not ( = ?auto_1297384 ?auto_1297389 ) ) ( not ( = ?auto_1297384 ?auto_1297390 ) ) ( not ( = ?auto_1297384 ?auto_1297391 ) ) ( not ( = ?auto_1297385 ?auto_1297386 ) ) ( not ( = ?auto_1297385 ?auto_1297387 ) ) ( not ( = ?auto_1297385 ?auto_1297388 ) ) ( not ( = ?auto_1297385 ?auto_1297389 ) ) ( not ( = ?auto_1297385 ?auto_1297390 ) ) ( not ( = ?auto_1297385 ?auto_1297391 ) ) ( not ( = ?auto_1297386 ?auto_1297387 ) ) ( not ( = ?auto_1297386 ?auto_1297388 ) ) ( not ( = ?auto_1297386 ?auto_1297389 ) ) ( not ( = ?auto_1297386 ?auto_1297390 ) ) ( not ( = ?auto_1297386 ?auto_1297391 ) ) ( not ( = ?auto_1297387 ?auto_1297388 ) ) ( not ( = ?auto_1297387 ?auto_1297389 ) ) ( not ( = ?auto_1297387 ?auto_1297390 ) ) ( not ( = ?auto_1297387 ?auto_1297391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1297388 ?auto_1297389 ?auto_1297390 )
      ( MAKE-12CRATE-VERIFY ?auto_1297378 ?auto_1297379 ?auto_1297380 ?auto_1297382 ?auto_1297381 ?auto_1297383 ?auto_1297384 ?auto_1297385 ?auto_1297386 ?auto_1297387 ?auto_1297388 ?auto_1297389 ?auto_1297390 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1308982 - SURFACE
      ?auto_1308983 - SURFACE
      ?auto_1308984 - SURFACE
      ?auto_1308986 - SURFACE
      ?auto_1308985 - SURFACE
      ?auto_1308987 - SURFACE
      ?auto_1308988 - SURFACE
      ?auto_1308989 - SURFACE
      ?auto_1308990 - SURFACE
      ?auto_1308991 - SURFACE
      ?auto_1308992 - SURFACE
      ?auto_1308993 - SURFACE
      ?auto_1308994 - SURFACE
      ?auto_1308995 - SURFACE
    )
    :vars
    (
      ?auto_1308996 - HOIST
      ?auto_1308997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1308996 ?auto_1308997 ) ( SURFACE-AT ?auto_1308994 ?auto_1308997 ) ( CLEAR ?auto_1308994 ) ( LIFTING ?auto_1308996 ?auto_1308995 ) ( IS-CRATE ?auto_1308995 ) ( not ( = ?auto_1308994 ?auto_1308995 ) ) ( ON ?auto_1308983 ?auto_1308982 ) ( ON ?auto_1308984 ?auto_1308983 ) ( ON ?auto_1308986 ?auto_1308984 ) ( ON ?auto_1308985 ?auto_1308986 ) ( ON ?auto_1308987 ?auto_1308985 ) ( ON ?auto_1308988 ?auto_1308987 ) ( ON ?auto_1308989 ?auto_1308988 ) ( ON ?auto_1308990 ?auto_1308989 ) ( ON ?auto_1308991 ?auto_1308990 ) ( ON ?auto_1308992 ?auto_1308991 ) ( ON ?auto_1308993 ?auto_1308992 ) ( ON ?auto_1308994 ?auto_1308993 ) ( not ( = ?auto_1308982 ?auto_1308983 ) ) ( not ( = ?auto_1308982 ?auto_1308984 ) ) ( not ( = ?auto_1308982 ?auto_1308986 ) ) ( not ( = ?auto_1308982 ?auto_1308985 ) ) ( not ( = ?auto_1308982 ?auto_1308987 ) ) ( not ( = ?auto_1308982 ?auto_1308988 ) ) ( not ( = ?auto_1308982 ?auto_1308989 ) ) ( not ( = ?auto_1308982 ?auto_1308990 ) ) ( not ( = ?auto_1308982 ?auto_1308991 ) ) ( not ( = ?auto_1308982 ?auto_1308992 ) ) ( not ( = ?auto_1308982 ?auto_1308993 ) ) ( not ( = ?auto_1308982 ?auto_1308994 ) ) ( not ( = ?auto_1308982 ?auto_1308995 ) ) ( not ( = ?auto_1308983 ?auto_1308984 ) ) ( not ( = ?auto_1308983 ?auto_1308986 ) ) ( not ( = ?auto_1308983 ?auto_1308985 ) ) ( not ( = ?auto_1308983 ?auto_1308987 ) ) ( not ( = ?auto_1308983 ?auto_1308988 ) ) ( not ( = ?auto_1308983 ?auto_1308989 ) ) ( not ( = ?auto_1308983 ?auto_1308990 ) ) ( not ( = ?auto_1308983 ?auto_1308991 ) ) ( not ( = ?auto_1308983 ?auto_1308992 ) ) ( not ( = ?auto_1308983 ?auto_1308993 ) ) ( not ( = ?auto_1308983 ?auto_1308994 ) ) ( not ( = ?auto_1308983 ?auto_1308995 ) ) ( not ( = ?auto_1308984 ?auto_1308986 ) ) ( not ( = ?auto_1308984 ?auto_1308985 ) ) ( not ( = ?auto_1308984 ?auto_1308987 ) ) ( not ( = ?auto_1308984 ?auto_1308988 ) ) ( not ( = ?auto_1308984 ?auto_1308989 ) ) ( not ( = ?auto_1308984 ?auto_1308990 ) ) ( not ( = ?auto_1308984 ?auto_1308991 ) ) ( not ( = ?auto_1308984 ?auto_1308992 ) ) ( not ( = ?auto_1308984 ?auto_1308993 ) ) ( not ( = ?auto_1308984 ?auto_1308994 ) ) ( not ( = ?auto_1308984 ?auto_1308995 ) ) ( not ( = ?auto_1308986 ?auto_1308985 ) ) ( not ( = ?auto_1308986 ?auto_1308987 ) ) ( not ( = ?auto_1308986 ?auto_1308988 ) ) ( not ( = ?auto_1308986 ?auto_1308989 ) ) ( not ( = ?auto_1308986 ?auto_1308990 ) ) ( not ( = ?auto_1308986 ?auto_1308991 ) ) ( not ( = ?auto_1308986 ?auto_1308992 ) ) ( not ( = ?auto_1308986 ?auto_1308993 ) ) ( not ( = ?auto_1308986 ?auto_1308994 ) ) ( not ( = ?auto_1308986 ?auto_1308995 ) ) ( not ( = ?auto_1308985 ?auto_1308987 ) ) ( not ( = ?auto_1308985 ?auto_1308988 ) ) ( not ( = ?auto_1308985 ?auto_1308989 ) ) ( not ( = ?auto_1308985 ?auto_1308990 ) ) ( not ( = ?auto_1308985 ?auto_1308991 ) ) ( not ( = ?auto_1308985 ?auto_1308992 ) ) ( not ( = ?auto_1308985 ?auto_1308993 ) ) ( not ( = ?auto_1308985 ?auto_1308994 ) ) ( not ( = ?auto_1308985 ?auto_1308995 ) ) ( not ( = ?auto_1308987 ?auto_1308988 ) ) ( not ( = ?auto_1308987 ?auto_1308989 ) ) ( not ( = ?auto_1308987 ?auto_1308990 ) ) ( not ( = ?auto_1308987 ?auto_1308991 ) ) ( not ( = ?auto_1308987 ?auto_1308992 ) ) ( not ( = ?auto_1308987 ?auto_1308993 ) ) ( not ( = ?auto_1308987 ?auto_1308994 ) ) ( not ( = ?auto_1308987 ?auto_1308995 ) ) ( not ( = ?auto_1308988 ?auto_1308989 ) ) ( not ( = ?auto_1308988 ?auto_1308990 ) ) ( not ( = ?auto_1308988 ?auto_1308991 ) ) ( not ( = ?auto_1308988 ?auto_1308992 ) ) ( not ( = ?auto_1308988 ?auto_1308993 ) ) ( not ( = ?auto_1308988 ?auto_1308994 ) ) ( not ( = ?auto_1308988 ?auto_1308995 ) ) ( not ( = ?auto_1308989 ?auto_1308990 ) ) ( not ( = ?auto_1308989 ?auto_1308991 ) ) ( not ( = ?auto_1308989 ?auto_1308992 ) ) ( not ( = ?auto_1308989 ?auto_1308993 ) ) ( not ( = ?auto_1308989 ?auto_1308994 ) ) ( not ( = ?auto_1308989 ?auto_1308995 ) ) ( not ( = ?auto_1308990 ?auto_1308991 ) ) ( not ( = ?auto_1308990 ?auto_1308992 ) ) ( not ( = ?auto_1308990 ?auto_1308993 ) ) ( not ( = ?auto_1308990 ?auto_1308994 ) ) ( not ( = ?auto_1308990 ?auto_1308995 ) ) ( not ( = ?auto_1308991 ?auto_1308992 ) ) ( not ( = ?auto_1308991 ?auto_1308993 ) ) ( not ( = ?auto_1308991 ?auto_1308994 ) ) ( not ( = ?auto_1308991 ?auto_1308995 ) ) ( not ( = ?auto_1308992 ?auto_1308993 ) ) ( not ( = ?auto_1308992 ?auto_1308994 ) ) ( not ( = ?auto_1308992 ?auto_1308995 ) ) ( not ( = ?auto_1308993 ?auto_1308994 ) ) ( not ( = ?auto_1308993 ?auto_1308995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1308994 ?auto_1308995 )
      ( MAKE-13CRATE-VERIFY ?auto_1308982 ?auto_1308983 ?auto_1308984 ?auto_1308986 ?auto_1308985 ?auto_1308987 ?auto_1308988 ?auto_1308989 ?auto_1308990 ?auto_1308991 ?auto_1308992 ?auto_1308993 ?auto_1308994 ?auto_1308995 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1309124 - SURFACE
      ?auto_1309125 - SURFACE
      ?auto_1309126 - SURFACE
      ?auto_1309128 - SURFACE
      ?auto_1309127 - SURFACE
      ?auto_1309129 - SURFACE
      ?auto_1309130 - SURFACE
      ?auto_1309131 - SURFACE
      ?auto_1309132 - SURFACE
      ?auto_1309133 - SURFACE
      ?auto_1309134 - SURFACE
      ?auto_1309135 - SURFACE
      ?auto_1309136 - SURFACE
      ?auto_1309137 - SURFACE
    )
    :vars
    (
      ?auto_1309138 - HOIST
      ?auto_1309140 - PLACE
      ?auto_1309139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1309138 ?auto_1309140 ) ( SURFACE-AT ?auto_1309136 ?auto_1309140 ) ( CLEAR ?auto_1309136 ) ( IS-CRATE ?auto_1309137 ) ( not ( = ?auto_1309136 ?auto_1309137 ) ) ( TRUCK-AT ?auto_1309139 ?auto_1309140 ) ( AVAILABLE ?auto_1309138 ) ( IN ?auto_1309137 ?auto_1309139 ) ( ON ?auto_1309136 ?auto_1309135 ) ( not ( = ?auto_1309135 ?auto_1309136 ) ) ( not ( = ?auto_1309135 ?auto_1309137 ) ) ( ON ?auto_1309125 ?auto_1309124 ) ( ON ?auto_1309126 ?auto_1309125 ) ( ON ?auto_1309128 ?auto_1309126 ) ( ON ?auto_1309127 ?auto_1309128 ) ( ON ?auto_1309129 ?auto_1309127 ) ( ON ?auto_1309130 ?auto_1309129 ) ( ON ?auto_1309131 ?auto_1309130 ) ( ON ?auto_1309132 ?auto_1309131 ) ( ON ?auto_1309133 ?auto_1309132 ) ( ON ?auto_1309134 ?auto_1309133 ) ( ON ?auto_1309135 ?auto_1309134 ) ( not ( = ?auto_1309124 ?auto_1309125 ) ) ( not ( = ?auto_1309124 ?auto_1309126 ) ) ( not ( = ?auto_1309124 ?auto_1309128 ) ) ( not ( = ?auto_1309124 ?auto_1309127 ) ) ( not ( = ?auto_1309124 ?auto_1309129 ) ) ( not ( = ?auto_1309124 ?auto_1309130 ) ) ( not ( = ?auto_1309124 ?auto_1309131 ) ) ( not ( = ?auto_1309124 ?auto_1309132 ) ) ( not ( = ?auto_1309124 ?auto_1309133 ) ) ( not ( = ?auto_1309124 ?auto_1309134 ) ) ( not ( = ?auto_1309124 ?auto_1309135 ) ) ( not ( = ?auto_1309124 ?auto_1309136 ) ) ( not ( = ?auto_1309124 ?auto_1309137 ) ) ( not ( = ?auto_1309125 ?auto_1309126 ) ) ( not ( = ?auto_1309125 ?auto_1309128 ) ) ( not ( = ?auto_1309125 ?auto_1309127 ) ) ( not ( = ?auto_1309125 ?auto_1309129 ) ) ( not ( = ?auto_1309125 ?auto_1309130 ) ) ( not ( = ?auto_1309125 ?auto_1309131 ) ) ( not ( = ?auto_1309125 ?auto_1309132 ) ) ( not ( = ?auto_1309125 ?auto_1309133 ) ) ( not ( = ?auto_1309125 ?auto_1309134 ) ) ( not ( = ?auto_1309125 ?auto_1309135 ) ) ( not ( = ?auto_1309125 ?auto_1309136 ) ) ( not ( = ?auto_1309125 ?auto_1309137 ) ) ( not ( = ?auto_1309126 ?auto_1309128 ) ) ( not ( = ?auto_1309126 ?auto_1309127 ) ) ( not ( = ?auto_1309126 ?auto_1309129 ) ) ( not ( = ?auto_1309126 ?auto_1309130 ) ) ( not ( = ?auto_1309126 ?auto_1309131 ) ) ( not ( = ?auto_1309126 ?auto_1309132 ) ) ( not ( = ?auto_1309126 ?auto_1309133 ) ) ( not ( = ?auto_1309126 ?auto_1309134 ) ) ( not ( = ?auto_1309126 ?auto_1309135 ) ) ( not ( = ?auto_1309126 ?auto_1309136 ) ) ( not ( = ?auto_1309126 ?auto_1309137 ) ) ( not ( = ?auto_1309128 ?auto_1309127 ) ) ( not ( = ?auto_1309128 ?auto_1309129 ) ) ( not ( = ?auto_1309128 ?auto_1309130 ) ) ( not ( = ?auto_1309128 ?auto_1309131 ) ) ( not ( = ?auto_1309128 ?auto_1309132 ) ) ( not ( = ?auto_1309128 ?auto_1309133 ) ) ( not ( = ?auto_1309128 ?auto_1309134 ) ) ( not ( = ?auto_1309128 ?auto_1309135 ) ) ( not ( = ?auto_1309128 ?auto_1309136 ) ) ( not ( = ?auto_1309128 ?auto_1309137 ) ) ( not ( = ?auto_1309127 ?auto_1309129 ) ) ( not ( = ?auto_1309127 ?auto_1309130 ) ) ( not ( = ?auto_1309127 ?auto_1309131 ) ) ( not ( = ?auto_1309127 ?auto_1309132 ) ) ( not ( = ?auto_1309127 ?auto_1309133 ) ) ( not ( = ?auto_1309127 ?auto_1309134 ) ) ( not ( = ?auto_1309127 ?auto_1309135 ) ) ( not ( = ?auto_1309127 ?auto_1309136 ) ) ( not ( = ?auto_1309127 ?auto_1309137 ) ) ( not ( = ?auto_1309129 ?auto_1309130 ) ) ( not ( = ?auto_1309129 ?auto_1309131 ) ) ( not ( = ?auto_1309129 ?auto_1309132 ) ) ( not ( = ?auto_1309129 ?auto_1309133 ) ) ( not ( = ?auto_1309129 ?auto_1309134 ) ) ( not ( = ?auto_1309129 ?auto_1309135 ) ) ( not ( = ?auto_1309129 ?auto_1309136 ) ) ( not ( = ?auto_1309129 ?auto_1309137 ) ) ( not ( = ?auto_1309130 ?auto_1309131 ) ) ( not ( = ?auto_1309130 ?auto_1309132 ) ) ( not ( = ?auto_1309130 ?auto_1309133 ) ) ( not ( = ?auto_1309130 ?auto_1309134 ) ) ( not ( = ?auto_1309130 ?auto_1309135 ) ) ( not ( = ?auto_1309130 ?auto_1309136 ) ) ( not ( = ?auto_1309130 ?auto_1309137 ) ) ( not ( = ?auto_1309131 ?auto_1309132 ) ) ( not ( = ?auto_1309131 ?auto_1309133 ) ) ( not ( = ?auto_1309131 ?auto_1309134 ) ) ( not ( = ?auto_1309131 ?auto_1309135 ) ) ( not ( = ?auto_1309131 ?auto_1309136 ) ) ( not ( = ?auto_1309131 ?auto_1309137 ) ) ( not ( = ?auto_1309132 ?auto_1309133 ) ) ( not ( = ?auto_1309132 ?auto_1309134 ) ) ( not ( = ?auto_1309132 ?auto_1309135 ) ) ( not ( = ?auto_1309132 ?auto_1309136 ) ) ( not ( = ?auto_1309132 ?auto_1309137 ) ) ( not ( = ?auto_1309133 ?auto_1309134 ) ) ( not ( = ?auto_1309133 ?auto_1309135 ) ) ( not ( = ?auto_1309133 ?auto_1309136 ) ) ( not ( = ?auto_1309133 ?auto_1309137 ) ) ( not ( = ?auto_1309134 ?auto_1309135 ) ) ( not ( = ?auto_1309134 ?auto_1309136 ) ) ( not ( = ?auto_1309134 ?auto_1309137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1309135 ?auto_1309136 ?auto_1309137 )
      ( MAKE-13CRATE-VERIFY ?auto_1309124 ?auto_1309125 ?auto_1309126 ?auto_1309128 ?auto_1309127 ?auto_1309129 ?auto_1309130 ?auto_1309131 ?auto_1309132 ?auto_1309133 ?auto_1309134 ?auto_1309135 ?auto_1309136 ?auto_1309137 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1309280 - SURFACE
      ?auto_1309281 - SURFACE
      ?auto_1309282 - SURFACE
      ?auto_1309284 - SURFACE
      ?auto_1309283 - SURFACE
      ?auto_1309285 - SURFACE
      ?auto_1309286 - SURFACE
      ?auto_1309287 - SURFACE
      ?auto_1309288 - SURFACE
      ?auto_1309289 - SURFACE
      ?auto_1309290 - SURFACE
      ?auto_1309291 - SURFACE
      ?auto_1309292 - SURFACE
      ?auto_1309293 - SURFACE
    )
    :vars
    (
      ?auto_1309295 - HOIST
      ?auto_1309297 - PLACE
      ?auto_1309296 - TRUCK
      ?auto_1309294 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1309295 ?auto_1309297 ) ( SURFACE-AT ?auto_1309292 ?auto_1309297 ) ( CLEAR ?auto_1309292 ) ( IS-CRATE ?auto_1309293 ) ( not ( = ?auto_1309292 ?auto_1309293 ) ) ( AVAILABLE ?auto_1309295 ) ( IN ?auto_1309293 ?auto_1309296 ) ( ON ?auto_1309292 ?auto_1309291 ) ( not ( = ?auto_1309291 ?auto_1309292 ) ) ( not ( = ?auto_1309291 ?auto_1309293 ) ) ( TRUCK-AT ?auto_1309296 ?auto_1309294 ) ( not ( = ?auto_1309294 ?auto_1309297 ) ) ( ON ?auto_1309281 ?auto_1309280 ) ( ON ?auto_1309282 ?auto_1309281 ) ( ON ?auto_1309284 ?auto_1309282 ) ( ON ?auto_1309283 ?auto_1309284 ) ( ON ?auto_1309285 ?auto_1309283 ) ( ON ?auto_1309286 ?auto_1309285 ) ( ON ?auto_1309287 ?auto_1309286 ) ( ON ?auto_1309288 ?auto_1309287 ) ( ON ?auto_1309289 ?auto_1309288 ) ( ON ?auto_1309290 ?auto_1309289 ) ( ON ?auto_1309291 ?auto_1309290 ) ( not ( = ?auto_1309280 ?auto_1309281 ) ) ( not ( = ?auto_1309280 ?auto_1309282 ) ) ( not ( = ?auto_1309280 ?auto_1309284 ) ) ( not ( = ?auto_1309280 ?auto_1309283 ) ) ( not ( = ?auto_1309280 ?auto_1309285 ) ) ( not ( = ?auto_1309280 ?auto_1309286 ) ) ( not ( = ?auto_1309280 ?auto_1309287 ) ) ( not ( = ?auto_1309280 ?auto_1309288 ) ) ( not ( = ?auto_1309280 ?auto_1309289 ) ) ( not ( = ?auto_1309280 ?auto_1309290 ) ) ( not ( = ?auto_1309280 ?auto_1309291 ) ) ( not ( = ?auto_1309280 ?auto_1309292 ) ) ( not ( = ?auto_1309280 ?auto_1309293 ) ) ( not ( = ?auto_1309281 ?auto_1309282 ) ) ( not ( = ?auto_1309281 ?auto_1309284 ) ) ( not ( = ?auto_1309281 ?auto_1309283 ) ) ( not ( = ?auto_1309281 ?auto_1309285 ) ) ( not ( = ?auto_1309281 ?auto_1309286 ) ) ( not ( = ?auto_1309281 ?auto_1309287 ) ) ( not ( = ?auto_1309281 ?auto_1309288 ) ) ( not ( = ?auto_1309281 ?auto_1309289 ) ) ( not ( = ?auto_1309281 ?auto_1309290 ) ) ( not ( = ?auto_1309281 ?auto_1309291 ) ) ( not ( = ?auto_1309281 ?auto_1309292 ) ) ( not ( = ?auto_1309281 ?auto_1309293 ) ) ( not ( = ?auto_1309282 ?auto_1309284 ) ) ( not ( = ?auto_1309282 ?auto_1309283 ) ) ( not ( = ?auto_1309282 ?auto_1309285 ) ) ( not ( = ?auto_1309282 ?auto_1309286 ) ) ( not ( = ?auto_1309282 ?auto_1309287 ) ) ( not ( = ?auto_1309282 ?auto_1309288 ) ) ( not ( = ?auto_1309282 ?auto_1309289 ) ) ( not ( = ?auto_1309282 ?auto_1309290 ) ) ( not ( = ?auto_1309282 ?auto_1309291 ) ) ( not ( = ?auto_1309282 ?auto_1309292 ) ) ( not ( = ?auto_1309282 ?auto_1309293 ) ) ( not ( = ?auto_1309284 ?auto_1309283 ) ) ( not ( = ?auto_1309284 ?auto_1309285 ) ) ( not ( = ?auto_1309284 ?auto_1309286 ) ) ( not ( = ?auto_1309284 ?auto_1309287 ) ) ( not ( = ?auto_1309284 ?auto_1309288 ) ) ( not ( = ?auto_1309284 ?auto_1309289 ) ) ( not ( = ?auto_1309284 ?auto_1309290 ) ) ( not ( = ?auto_1309284 ?auto_1309291 ) ) ( not ( = ?auto_1309284 ?auto_1309292 ) ) ( not ( = ?auto_1309284 ?auto_1309293 ) ) ( not ( = ?auto_1309283 ?auto_1309285 ) ) ( not ( = ?auto_1309283 ?auto_1309286 ) ) ( not ( = ?auto_1309283 ?auto_1309287 ) ) ( not ( = ?auto_1309283 ?auto_1309288 ) ) ( not ( = ?auto_1309283 ?auto_1309289 ) ) ( not ( = ?auto_1309283 ?auto_1309290 ) ) ( not ( = ?auto_1309283 ?auto_1309291 ) ) ( not ( = ?auto_1309283 ?auto_1309292 ) ) ( not ( = ?auto_1309283 ?auto_1309293 ) ) ( not ( = ?auto_1309285 ?auto_1309286 ) ) ( not ( = ?auto_1309285 ?auto_1309287 ) ) ( not ( = ?auto_1309285 ?auto_1309288 ) ) ( not ( = ?auto_1309285 ?auto_1309289 ) ) ( not ( = ?auto_1309285 ?auto_1309290 ) ) ( not ( = ?auto_1309285 ?auto_1309291 ) ) ( not ( = ?auto_1309285 ?auto_1309292 ) ) ( not ( = ?auto_1309285 ?auto_1309293 ) ) ( not ( = ?auto_1309286 ?auto_1309287 ) ) ( not ( = ?auto_1309286 ?auto_1309288 ) ) ( not ( = ?auto_1309286 ?auto_1309289 ) ) ( not ( = ?auto_1309286 ?auto_1309290 ) ) ( not ( = ?auto_1309286 ?auto_1309291 ) ) ( not ( = ?auto_1309286 ?auto_1309292 ) ) ( not ( = ?auto_1309286 ?auto_1309293 ) ) ( not ( = ?auto_1309287 ?auto_1309288 ) ) ( not ( = ?auto_1309287 ?auto_1309289 ) ) ( not ( = ?auto_1309287 ?auto_1309290 ) ) ( not ( = ?auto_1309287 ?auto_1309291 ) ) ( not ( = ?auto_1309287 ?auto_1309292 ) ) ( not ( = ?auto_1309287 ?auto_1309293 ) ) ( not ( = ?auto_1309288 ?auto_1309289 ) ) ( not ( = ?auto_1309288 ?auto_1309290 ) ) ( not ( = ?auto_1309288 ?auto_1309291 ) ) ( not ( = ?auto_1309288 ?auto_1309292 ) ) ( not ( = ?auto_1309288 ?auto_1309293 ) ) ( not ( = ?auto_1309289 ?auto_1309290 ) ) ( not ( = ?auto_1309289 ?auto_1309291 ) ) ( not ( = ?auto_1309289 ?auto_1309292 ) ) ( not ( = ?auto_1309289 ?auto_1309293 ) ) ( not ( = ?auto_1309290 ?auto_1309291 ) ) ( not ( = ?auto_1309290 ?auto_1309292 ) ) ( not ( = ?auto_1309290 ?auto_1309293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1309291 ?auto_1309292 ?auto_1309293 )
      ( MAKE-13CRATE-VERIFY ?auto_1309280 ?auto_1309281 ?auto_1309282 ?auto_1309284 ?auto_1309283 ?auto_1309285 ?auto_1309286 ?auto_1309287 ?auto_1309288 ?auto_1309289 ?auto_1309290 ?auto_1309291 ?auto_1309292 ?auto_1309293 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1309449 - SURFACE
      ?auto_1309450 - SURFACE
      ?auto_1309451 - SURFACE
      ?auto_1309453 - SURFACE
      ?auto_1309452 - SURFACE
      ?auto_1309454 - SURFACE
      ?auto_1309455 - SURFACE
      ?auto_1309456 - SURFACE
      ?auto_1309457 - SURFACE
      ?auto_1309458 - SURFACE
      ?auto_1309459 - SURFACE
      ?auto_1309460 - SURFACE
      ?auto_1309461 - SURFACE
      ?auto_1309462 - SURFACE
    )
    :vars
    (
      ?auto_1309463 - HOIST
      ?auto_1309465 - PLACE
      ?auto_1309467 - TRUCK
      ?auto_1309466 - PLACE
      ?auto_1309464 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1309463 ?auto_1309465 ) ( SURFACE-AT ?auto_1309461 ?auto_1309465 ) ( CLEAR ?auto_1309461 ) ( IS-CRATE ?auto_1309462 ) ( not ( = ?auto_1309461 ?auto_1309462 ) ) ( AVAILABLE ?auto_1309463 ) ( ON ?auto_1309461 ?auto_1309460 ) ( not ( = ?auto_1309460 ?auto_1309461 ) ) ( not ( = ?auto_1309460 ?auto_1309462 ) ) ( TRUCK-AT ?auto_1309467 ?auto_1309466 ) ( not ( = ?auto_1309466 ?auto_1309465 ) ) ( HOIST-AT ?auto_1309464 ?auto_1309466 ) ( LIFTING ?auto_1309464 ?auto_1309462 ) ( not ( = ?auto_1309463 ?auto_1309464 ) ) ( ON ?auto_1309450 ?auto_1309449 ) ( ON ?auto_1309451 ?auto_1309450 ) ( ON ?auto_1309453 ?auto_1309451 ) ( ON ?auto_1309452 ?auto_1309453 ) ( ON ?auto_1309454 ?auto_1309452 ) ( ON ?auto_1309455 ?auto_1309454 ) ( ON ?auto_1309456 ?auto_1309455 ) ( ON ?auto_1309457 ?auto_1309456 ) ( ON ?auto_1309458 ?auto_1309457 ) ( ON ?auto_1309459 ?auto_1309458 ) ( ON ?auto_1309460 ?auto_1309459 ) ( not ( = ?auto_1309449 ?auto_1309450 ) ) ( not ( = ?auto_1309449 ?auto_1309451 ) ) ( not ( = ?auto_1309449 ?auto_1309453 ) ) ( not ( = ?auto_1309449 ?auto_1309452 ) ) ( not ( = ?auto_1309449 ?auto_1309454 ) ) ( not ( = ?auto_1309449 ?auto_1309455 ) ) ( not ( = ?auto_1309449 ?auto_1309456 ) ) ( not ( = ?auto_1309449 ?auto_1309457 ) ) ( not ( = ?auto_1309449 ?auto_1309458 ) ) ( not ( = ?auto_1309449 ?auto_1309459 ) ) ( not ( = ?auto_1309449 ?auto_1309460 ) ) ( not ( = ?auto_1309449 ?auto_1309461 ) ) ( not ( = ?auto_1309449 ?auto_1309462 ) ) ( not ( = ?auto_1309450 ?auto_1309451 ) ) ( not ( = ?auto_1309450 ?auto_1309453 ) ) ( not ( = ?auto_1309450 ?auto_1309452 ) ) ( not ( = ?auto_1309450 ?auto_1309454 ) ) ( not ( = ?auto_1309450 ?auto_1309455 ) ) ( not ( = ?auto_1309450 ?auto_1309456 ) ) ( not ( = ?auto_1309450 ?auto_1309457 ) ) ( not ( = ?auto_1309450 ?auto_1309458 ) ) ( not ( = ?auto_1309450 ?auto_1309459 ) ) ( not ( = ?auto_1309450 ?auto_1309460 ) ) ( not ( = ?auto_1309450 ?auto_1309461 ) ) ( not ( = ?auto_1309450 ?auto_1309462 ) ) ( not ( = ?auto_1309451 ?auto_1309453 ) ) ( not ( = ?auto_1309451 ?auto_1309452 ) ) ( not ( = ?auto_1309451 ?auto_1309454 ) ) ( not ( = ?auto_1309451 ?auto_1309455 ) ) ( not ( = ?auto_1309451 ?auto_1309456 ) ) ( not ( = ?auto_1309451 ?auto_1309457 ) ) ( not ( = ?auto_1309451 ?auto_1309458 ) ) ( not ( = ?auto_1309451 ?auto_1309459 ) ) ( not ( = ?auto_1309451 ?auto_1309460 ) ) ( not ( = ?auto_1309451 ?auto_1309461 ) ) ( not ( = ?auto_1309451 ?auto_1309462 ) ) ( not ( = ?auto_1309453 ?auto_1309452 ) ) ( not ( = ?auto_1309453 ?auto_1309454 ) ) ( not ( = ?auto_1309453 ?auto_1309455 ) ) ( not ( = ?auto_1309453 ?auto_1309456 ) ) ( not ( = ?auto_1309453 ?auto_1309457 ) ) ( not ( = ?auto_1309453 ?auto_1309458 ) ) ( not ( = ?auto_1309453 ?auto_1309459 ) ) ( not ( = ?auto_1309453 ?auto_1309460 ) ) ( not ( = ?auto_1309453 ?auto_1309461 ) ) ( not ( = ?auto_1309453 ?auto_1309462 ) ) ( not ( = ?auto_1309452 ?auto_1309454 ) ) ( not ( = ?auto_1309452 ?auto_1309455 ) ) ( not ( = ?auto_1309452 ?auto_1309456 ) ) ( not ( = ?auto_1309452 ?auto_1309457 ) ) ( not ( = ?auto_1309452 ?auto_1309458 ) ) ( not ( = ?auto_1309452 ?auto_1309459 ) ) ( not ( = ?auto_1309452 ?auto_1309460 ) ) ( not ( = ?auto_1309452 ?auto_1309461 ) ) ( not ( = ?auto_1309452 ?auto_1309462 ) ) ( not ( = ?auto_1309454 ?auto_1309455 ) ) ( not ( = ?auto_1309454 ?auto_1309456 ) ) ( not ( = ?auto_1309454 ?auto_1309457 ) ) ( not ( = ?auto_1309454 ?auto_1309458 ) ) ( not ( = ?auto_1309454 ?auto_1309459 ) ) ( not ( = ?auto_1309454 ?auto_1309460 ) ) ( not ( = ?auto_1309454 ?auto_1309461 ) ) ( not ( = ?auto_1309454 ?auto_1309462 ) ) ( not ( = ?auto_1309455 ?auto_1309456 ) ) ( not ( = ?auto_1309455 ?auto_1309457 ) ) ( not ( = ?auto_1309455 ?auto_1309458 ) ) ( not ( = ?auto_1309455 ?auto_1309459 ) ) ( not ( = ?auto_1309455 ?auto_1309460 ) ) ( not ( = ?auto_1309455 ?auto_1309461 ) ) ( not ( = ?auto_1309455 ?auto_1309462 ) ) ( not ( = ?auto_1309456 ?auto_1309457 ) ) ( not ( = ?auto_1309456 ?auto_1309458 ) ) ( not ( = ?auto_1309456 ?auto_1309459 ) ) ( not ( = ?auto_1309456 ?auto_1309460 ) ) ( not ( = ?auto_1309456 ?auto_1309461 ) ) ( not ( = ?auto_1309456 ?auto_1309462 ) ) ( not ( = ?auto_1309457 ?auto_1309458 ) ) ( not ( = ?auto_1309457 ?auto_1309459 ) ) ( not ( = ?auto_1309457 ?auto_1309460 ) ) ( not ( = ?auto_1309457 ?auto_1309461 ) ) ( not ( = ?auto_1309457 ?auto_1309462 ) ) ( not ( = ?auto_1309458 ?auto_1309459 ) ) ( not ( = ?auto_1309458 ?auto_1309460 ) ) ( not ( = ?auto_1309458 ?auto_1309461 ) ) ( not ( = ?auto_1309458 ?auto_1309462 ) ) ( not ( = ?auto_1309459 ?auto_1309460 ) ) ( not ( = ?auto_1309459 ?auto_1309461 ) ) ( not ( = ?auto_1309459 ?auto_1309462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1309460 ?auto_1309461 ?auto_1309462 )
      ( MAKE-13CRATE-VERIFY ?auto_1309449 ?auto_1309450 ?auto_1309451 ?auto_1309453 ?auto_1309452 ?auto_1309454 ?auto_1309455 ?auto_1309456 ?auto_1309457 ?auto_1309458 ?auto_1309459 ?auto_1309460 ?auto_1309461 ?auto_1309462 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1309631 - SURFACE
      ?auto_1309632 - SURFACE
      ?auto_1309633 - SURFACE
      ?auto_1309635 - SURFACE
      ?auto_1309634 - SURFACE
      ?auto_1309636 - SURFACE
      ?auto_1309637 - SURFACE
      ?auto_1309638 - SURFACE
      ?auto_1309639 - SURFACE
      ?auto_1309640 - SURFACE
      ?auto_1309641 - SURFACE
      ?auto_1309642 - SURFACE
      ?auto_1309643 - SURFACE
      ?auto_1309644 - SURFACE
    )
    :vars
    (
      ?auto_1309645 - HOIST
      ?auto_1309650 - PLACE
      ?auto_1309646 - TRUCK
      ?auto_1309648 - PLACE
      ?auto_1309647 - HOIST
      ?auto_1309649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1309645 ?auto_1309650 ) ( SURFACE-AT ?auto_1309643 ?auto_1309650 ) ( CLEAR ?auto_1309643 ) ( IS-CRATE ?auto_1309644 ) ( not ( = ?auto_1309643 ?auto_1309644 ) ) ( AVAILABLE ?auto_1309645 ) ( ON ?auto_1309643 ?auto_1309642 ) ( not ( = ?auto_1309642 ?auto_1309643 ) ) ( not ( = ?auto_1309642 ?auto_1309644 ) ) ( TRUCK-AT ?auto_1309646 ?auto_1309648 ) ( not ( = ?auto_1309648 ?auto_1309650 ) ) ( HOIST-AT ?auto_1309647 ?auto_1309648 ) ( not ( = ?auto_1309645 ?auto_1309647 ) ) ( AVAILABLE ?auto_1309647 ) ( SURFACE-AT ?auto_1309644 ?auto_1309648 ) ( ON ?auto_1309644 ?auto_1309649 ) ( CLEAR ?auto_1309644 ) ( not ( = ?auto_1309643 ?auto_1309649 ) ) ( not ( = ?auto_1309644 ?auto_1309649 ) ) ( not ( = ?auto_1309642 ?auto_1309649 ) ) ( ON ?auto_1309632 ?auto_1309631 ) ( ON ?auto_1309633 ?auto_1309632 ) ( ON ?auto_1309635 ?auto_1309633 ) ( ON ?auto_1309634 ?auto_1309635 ) ( ON ?auto_1309636 ?auto_1309634 ) ( ON ?auto_1309637 ?auto_1309636 ) ( ON ?auto_1309638 ?auto_1309637 ) ( ON ?auto_1309639 ?auto_1309638 ) ( ON ?auto_1309640 ?auto_1309639 ) ( ON ?auto_1309641 ?auto_1309640 ) ( ON ?auto_1309642 ?auto_1309641 ) ( not ( = ?auto_1309631 ?auto_1309632 ) ) ( not ( = ?auto_1309631 ?auto_1309633 ) ) ( not ( = ?auto_1309631 ?auto_1309635 ) ) ( not ( = ?auto_1309631 ?auto_1309634 ) ) ( not ( = ?auto_1309631 ?auto_1309636 ) ) ( not ( = ?auto_1309631 ?auto_1309637 ) ) ( not ( = ?auto_1309631 ?auto_1309638 ) ) ( not ( = ?auto_1309631 ?auto_1309639 ) ) ( not ( = ?auto_1309631 ?auto_1309640 ) ) ( not ( = ?auto_1309631 ?auto_1309641 ) ) ( not ( = ?auto_1309631 ?auto_1309642 ) ) ( not ( = ?auto_1309631 ?auto_1309643 ) ) ( not ( = ?auto_1309631 ?auto_1309644 ) ) ( not ( = ?auto_1309631 ?auto_1309649 ) ) ( not ( = ?auto_1309632 ?auto_1309633 ) ) ( not ( = ?auto_1309632 ?auto_1309635 ) ) ( not ( = ?auto_1309632 ?auto_1309634 ) ) ( not ( = ?auto_1309632 ?auto_1309636 ) ) ( not ( = ?auto_1309632 ?auto_1309637 ) ) ( not ( = ?auto_1309632 ?auto_1309638 ) ) ( not ( = ?auto_1309632 ?auto_1309639 ) ) ( not ( = ?auto_1309632 ?auto_1309640 ) ) ( not ( = ?auto_1309632 ?auto_1309641 ) ) ( not ( = ?auto_1309632 ?auto_1309642 ) ) ( not ( = ?auto_1309632 ?auto_1309643 ) ) ( not ( = ?auto_1309632 ?auto_1309644 ) ) ( not ( = ?auto_1309632 ?auto_1309649 ) ) ( not ( = ?auto_1309633 ?auto_1309635 ) ) ( not ( = ?auto_1309633 ?auto_1309634 ) ) ( not ( = ?auto_1309633 ?auto_1309636 ) ) ( not ( = ?auto_1309633 ?auto_1309637 ) ) ( not ( = ?auto_1309633 ?auto_1309638 ) ) ( not ( = ?auto_1309633 ?auto_1309639 ) ) ( not ( = ?auto_1309633 ?auto_1309640 ) ) ( not ( = ?auto_1309633 ?auto_1309641 ) ) ( not ( = ?auto_1309633 ?auto_1309642 ) ) ( not ( = ?auto_1309633 ?auto_1309643 ) ) ( not ( = ?auto_1309633 ?auto_1309644 ) ) ( not ( = ?auto_1309633 ?auto_1309649 ) ) ( not ( = ?auto_1309635 ?auto_1309634 ) ) ( not ( = ?auto_1309635 ?auto_1309636 ) ) ( not ( = ?auto_1309635 ?auto_1309637 ) ) ( not ( = ?auto_1309635 ?auto_1309638 ) ) ( not ( = ?auto_1309635 ?auto_1309639 ) ) ( not ( = ?auto_1309635 ?auto_1309640 ) ) ( not ( = ?auto_1309635 ?auto_1309641 ) ) ( not ( = ?auto_1309635 ?auto_1309642 ) ) ( not ( = ?auto_1309635 ?auto_1309643 ) ) ( not ( = ?auto_1309635 ?auto_1309644 ) ) ( not ( = ?auto_1309635 ?auto_1309649 ) ) ( not ( = ?auto_1309634 ?auto_1309636 ) ) ( not ( = ?auto_1309634 ?auto_1309637 ) ) ( not ( = ?auto_1309634 ?auto_1309638 ) ) ( not ( = ?auto_1309634 ?auto_1309639 ) ) ( not ( = ?auto_1309634 ?auto_1309640 ) ) ( not ( = ?auto_1309634 ?auto_1309641 ) ) ( not ( = ?auto_1309634 ?auto_1309642 ) ) ( not ( = ?auto_1309634 ?auto_1309643 ) ) ( not ( = ?auto_1309634 ?auto_1309644 ) ) ( not ( = ?auto_1309634 ?auto_1309649 ) ) ( not ( = ?auto_1309636 ?auto_1309637 ) ) ( not ( = ?auto_1309636 ?auto_1309638 ) ) ( not ( = ?auto_1309636 ?auto_1309639 ) ) ( not ( = ?auto_1309636 ?auto_1309640 ) ) ( not ( = ?auto_1309636 ?auto_1309641 ) ) ( not ( = ?auto_1309636 ?auto_1309642 ) ) ( not ( = ?auto_1309636 ?auto_1309643 ) ) ( not ( = ?auto_1309636 ?auto_1309644 ) ) ( not ( = ?auto_1309636 ?auto_1309649 ) ) ( not ( = ?auto_1309637 ?auto_1309638 ) ) ( not ( = ?auto_1309637 ?auto_1309639 ) ) ( not ( = ?auto_1309637 ?auto_1309640 ) ) ( not ( = ?auto_1309637 ?auto_1309641 ) ) ( not ( = ?auto_1309637 ?auto_1309642 ) ) ( not ( = ?auto_1309637 ?auto_1309643 ) ) ( not ( = ?auto_1309637 ?auto_1309644 ) ) ( not ( = ?auto_1309637 ?auto_1309649 ) ) ( not ( = ?auto_1309638 ?auto_1309639 ) ) ( not ( = ?auto_1309638 ?auto_1309640 ) ) ( not ( = ?auto_1309638 ?auto_1309641 ) ) ( not ( = ?auto_1309638 ?auto_1309642 ) ) ( not ( = ?auto_1309638 ?auto_1309643 ) ) ( not ( = ?auto_1309638 ?auto_1309644 ) ) ( not ( = ?auto_1309638 ?auto_1309649 ) ) ( not ( = ?auto_1309639 ?auto_1309640 ) ) ( not ( = ?auto_1309639 ?auto_1309641 ) ) ( not ( = ?auto_1309639 ?auto_1309642 ) ) ( not ( = ?auto_1309639 ?auto_1309643 ) ) ( not ( = ?auto_1309639 ?auto_1309644 ) ) ( not ( = ?auto_1309639 ?auto_1309649 ) ) ( not ( = ?auto_1309640 ?auto_1309641 ) ) ( not ( = ?auto_1309640 ?auto_1309642 ) ) ( not ( = ?auto_1309640 ?auto_1309643 ) ) ( not ( = ?auto_1309640 ?auto_1309644 ) ) ( not ( = ?auto_1309640 ?auto_1309649 ) ) ( not ( = ?auto_1309641 ?auto_1309642 ) ) ( not ( = ?auto_1309641 ?auto_1309643 ) ) ( not ( = ?auto_1309641 ?auto_1309644 ) ) ( not ( = ?auto_1309641 ?auto_1309649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1309642 ?auto_1309643 ?auto_1309644 )
      ( MAKE-13CRATE-VERIFY ?auto_1309631 ?auto_1309632 ?auto_1309633 ?auto_1309635 ?auto_1309634 ?auto_1309636 ?auto_1309637 ?auto_1309638 ?auto_1309639 ?auto_1309640 ?auto_1309641 ?auto_1309642 ?auto_1309643 ?auto_1309644 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1309814 - SURFACE
      ?auto_1309815 - SURFACE
      ?auto_1309816 - SURFACE
      ?auto_1309818 - SURFACE
      ?auto_1309817 - SURFACE
      ?auto_1309819 - SURFACE
      ?auto_1309820 - SURFACE
      ?auto_1309821 - SURFACE
      ?auto_1309822 - SURFACE
      ?auto_1309823 - SURFACE
      ?auto_1309824 - SURFACE
      ?auto_1309825 - SURFACE
      ?auto_1309826 - SURFACE
      ?auto_1309827 - SURFACE
    )
    :vars
    (
      ?auto_1309831 - HOIST
      ?auto_1309829 - PLACE
      ?auto_1309832 - PLACE
      ?auto_1309830 - HOIST
      ?auto_1309828 - SURFACE
      ?auto_1309833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1309831 ?auto_1309829 ) ( SURFACE-AT ?auto_1309826 ?auto_1309829 ) ( CLEAR ?auto_1309826 ) ( IS-CRATE ?auto_1309827 ) ( not ( = ?auto_1309826 ?auto_1309827 ) ) ( AVAILABLE ?auto_1309831 ) ( ON ?auto_1309826 ?auto_1309825 ) ( not ( = ?auto_1309825 ?auto_1309826 ) ) ( not ( = ?auto_1309825 ?auto_1309827 ) ) ( not ( = ?auto_1309832 ?auto_1309829 ) ) ( HOIST-AT ?auto_1309830 ?auto_1309832 ) ( not ( = ?auto_1309831 ?auto_1309830 ) ) ( AVAILABLE ?auto_1309830 ) ( SURFACE-AT ?auto_1309827 ?auto_1309832 ) ( ON ?auto_1309827 ?auto_1309828 ) ( CLEAR ?auto_1309827 ) ( not ( = ?auto_1309826 ?auto_1309828 ) ) ( not ( = ?auto_1309827 ?auto_1309828 ) ) ( not ( = ?auto_1309825 ?auto_1309828 ) ) ( TRUCK-AT ?auto_1309833 ?auto_1309829 ) ( ON ?auto_1309815 ?auto_1309814 ) ( ON ?auto_1309816 ?auto_1309815 ) ( ON ?auto_1309818 ?auto_1309816 ) ( ON ?auto_1309817 ?auto_1309818 ) ( ON ?auto_1309819 ?auto_1309817 ) ( ON ?auto_1309820 ?auto_1309819 ) ( ON ?auto_1309821 ?auto_1309820 ) ( ON ?auto_1309822 ?auto_1309821 ) ( ON ?auto_1309823 ?auto_1309822 ) ( ON ?auto_1309824 ?auto_1309823 ) ( ON ?auto_1309825 ?auto_1309824 ) ( not ( = ?auto_1309814 ?auto_1309815 ) ) ( not ( = ?auto_1309814 ?auto_1309816 ) ) ( not ( = ?auto_1309814 ?auto_1309818 ) ) ( not ( = ?auto_1309814 ?auto_1309817 ) ) ( not ( = ?auto_1309814 ?auto_1309819 ) ) ( not ( = ?auto_1309814 ?auto_1309820 ) ) ( not ( = ?auto_1309814 ?auto_1309821 ) ) ( not ( = ?auto_1309814 ?auto_1309822 ) ) ( not ( = ?auto_1309814 ?auto_1309823 ) ) ( not ( = ?auto_1309814 ?auto_1309824 ) ) ( not ( = ?auto_1309814 ?auto_1309825 ) ) ( not ( = ?auto_1309814 ?auto_1309826 ) ) ( not ( = ?auto_1309814 ?auto_1309827 ) ) ( not ( = ?auto_1309814 ?auto_1309828 ) ) ( not ( = ?auto_1309815 ?auto_1309816 ) ) ( not ( = ?auto_1309815 ?auto_1309818 ) ) ( not ( = ?auto_1309815 ?auto_1309817 ) ) ( not ( = ?auto_1309815 ?auto_1309819 ) ) ( not ( = ?auto_1309815 ?auto_1309820 ) ) ( not ( = ?auto_1309815 ?auto_1309821 ) ) ( not ( = ?auto_1309815 ?auto_1309822 ) ) ( not ( = ?auto_1309815 ?auto_1309823 ) ) ( not ( = ?auto_1309815 ?auto_1309824 ) ) ( not ( = ?auto_1309815 ?auto_1309825 ) ) ( not ( = ?auto_1309815 ?auto_1309826 ) ) ( not ( = ?auto_1309815 ?auto_1309827 ) ) ( not ( = ?auto_1309815 ?auto_1309828 ) ) ( not ( = ?auto_1309816 ?auto_1309818 ) ) ( not ( = ?auto_1309816 ?auto_1309817 ) ) ( not ( = ?auto_1309816 ?auto_1309819 ) ) ( not ( = ?auto_1309816 ?auto_1309820 ) ) ( not ( = ?auto_1309816 ?auto_1309821 ) ) ( not ( = ?auto_1309816 ?auto_1309822 ) ) ( not ( = ?auto_1309816 ?auto_1309823 ) ) ( not ( = ?auto_1309816 ?auto_1309824 ) ) ( not ( = ?auto_1309816 ?auto_1309825 ) ) ( not ( = ?auto_1309816 ?auto_1309826 ) ) ( not ( = ?auto_1309816 ?auto_1309827 ) ) ( not ( = ?auto_1309816 ?auto_1309828 ) ) ( not ( = ?auto_1309818 ?auto_1309817 ) ) ( not ( = ?auto_1309818 ?auto_1309819 ) ) ( not ( = ?auto_1309818 ?auto_1309820 ) ) ( not ( = ?auto_1309818 ?auto_1309821 ) ) ( not ( = ?auto_1309818 ?auto_1309822 ) ) ( not ( = ?auto_1309818 ?auto_1309823 ) ) ( not ( = ?auto_1309818 ?auto_1309824 ) ) ( not ( = ?auto_1309818 ?auto_1309825 ) ) ( not ( = ?auto_1309818 ?auto_1309826 ) ) ( not ( = ?auto_1309818 ?auto_1309827 ) ) ( not ( = ?auto_1309818 ?auto_1309828 ) ) ( not ( = ?auto_1309817 ?auto_1309819 ) ) ( not ( = ?auto_1309817 ?auto_1309820 ) ) ( not ( = ?auto_1309817 ?auto_1309821 ) ) ( not ( = ?auto_1309817 ?auto_1309822 ) ) ( not ( = ?auto_1309817 ?auto_1309823 ) ) ( not ( = ?auto_1309817 ?auto_1309824 ) ) ( not ( = ?auto_1309817 ?auto_1309825 ) ) ( not ( = ?auto_1309817 ?auto_1309826 ) ) ( not ( = ?auto_1309817 ?auto_1309827 ) ) ( not ( = ?auto_1309817 ?auto_1309828 ) ) ( not ( = ?auto_1309819 ?auto_1309820 ) ) ( not ( = ?auto_1309819 ?auto_1309821 ) ) ( not ( = ?auto_1309819 ?auto_1309822 ) ) ( not ( = ?auto_1309819 ?auto_1309823 ) ) ( not ( = ?auto_1309819 ?auto_1309824 ) ) ( not ( = ?auto_1309819 ?auto_1309825 ) ) ( not ( = ?auto_1309819 ?auto_1309826 ) ) ( not ( = ?auto_1309819 ?auto_1309827 ) ) ( not ( = ?auto_1309819 ?auto_1309828 ) ) ( not ( = ?auto_1309820 ?auto_1309821 ) ) ( not ( = ?auto_1309820 ?auto_1309822 ) ) ( not ( = ?auto_1309820 ?auto_1309823 ) ) ( not ( = ?auto_1309820 ?auto_1309824 ) ) ( not ( = ?auto_1309820 ?auto_1309825 ) ) ( not ( = ?auto_1309820 ?auto_1309826 ) ) ( not ( = ?auto_1309820 ?auto_1309827 ) ) ( not ( = ?auto_1309820 ?auto_1309828 ) ) ( not ( = ?auto_1309821 ?auto_1309822 ) ) ( not ( = ?auto_1309821 ?auto_1309823 ) ) ( not ( = ?auto_1309821 ?auto_1309824 ) ) ( not ( = ?auto_1309821 ?auto_1309825 ) ) ( not ( = ?auto_1309821 ?auto_1309826 ) ) ( not ( = ?auto_1309821 ?auto_1309827 ) ) ( not ( = ?auto_1309821 ?auto_1309828 ) ) ( not ( = ?auto_1309822 ?auto_1309823 ) ) ( not ( = ?auto_1309822 ?auto_1309824 ) ) ( not ( = ?auto_1309822 ?auto_1309825 ) ) ( not ( = ?auto_1309822 ?auto_1309826 ) ) ( not ( = ?auto_1309822 ?auto_1309827 ) ) ( not ( = ?auto_1309822 ?auto_1309828 ) ) ( not ( = ?auto_1309823 ?auto_1309824 ) ) ( not ( = ?auto_1309823 ?auto_1309825 ) ) ( not ( = ?auto_1309823 ?auto_1309826 ) ) ( not ( = ?auto_1309823 ?auto_1309827 ) ) ( not ( = ?auto_1309823 ?auto_1309828 ) ) ( not ( = ?auto_1309824 ?auto_1309825 ) ) ( not ( = ?auto_1309824 ?auto_1309826 ) ) ( not ( = ?auto_1309824 ?auto_1309827 ) ) ( not ( = ?auto_1309824 ?auto_1309828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1309825 ?auto_1309826 ?auto_1309827 )
      ( MAKE-13CRATE-VERIFY ?auto_1309814 ?auto_1309815 ?auto_1309816 ?auto_1309818 ?auto_1309817 ?auto_1309819 ?auto_1309820 ?auto_1309821 ?auto_1309822 ?auto_1309823 ?auto_1309824 ?auto_1309825 ?auto_1309826 ?auto_1309827 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1309997 - SURFACE
      ?auto_1309998 - SURFACE
      ?auto_1309999 - SURFACE
      ?auto_1310001 - SURFACE
      ?auto_1310000 - SURFACE
      ?auto_1310002 - SURFACE
      ?auto_1310003 - SURFACE
      ?auto_1310004 - SURFACE
      ?auto_1310005 - SURFACE
      ?auto_1310006 - SURFACE
      ?auto_1310007 - SURFACE
      ?auto_1310008 - SURFACE
      ?auto_1310009 - SURFACE
      ?auto_1310010 - SURFACE
    )
    :vars
    (
      ?auto_1310011 - HOIST
      ?auto_1310012 - PLACE
      ?auto_1310013 - PLACE
      ?auto_1310014 - HOIST
      ?auto_1310016 - SURFACE
      ?auto_1310015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310011 ?auto_1310012 ) ( IS-CRATE ?auto_1310010 ) ( not ( = ?auto_1310009 ?auto_1310010 ) ) ( not ( = ?auto_1310008 ?auto_1310009 ) ) ( not ( = ?auto_1310008 ?auto_1310010 ) ) ( not ( = ?auto_1310013 ?auto_1310012 ) ) ( HOIST-AT ?auto_1310014 ?auto_1310013 ) ( not ( = ?auto_1310011 ?auto_1310014 ) ) ( AVAILABLE ?auto_1310014 ) ( SURFACE-AT ?auto_1310010 ?auto_1310013 ) ( ON ?auto_1310010 ?auto_1310016 ) ( CLEAR ?auto_1310010 ) ( not ( = ?auto_1310009 ?auto_1310016 ) ) ( not ( = ?auto_1310010 ?auto_1310016 ) ) ( not ( = ?auto_1310008 ?auto_1310016 ) ) ( TRUCK-AT ?auto_1310015 ?auto_1310012 ) ( SURFACE-AT ?auto_1310008 ?auto_1310012 ) ( CLEAR ?auto_1310008 ) ( LIFTING ?auto_1310011 ?auto_1310009 ) ( IS-CRATE ?auto_1310009 ) ( ON ?auto_1309998 ?auto_1309997 ) ( ON ?auto_1309999 ?auto_1309998 ) ( ON ?auto_1310001 ?auto_1309999 ) ( ON ?auto_1310000 ?auto_1310001 ) ( ON ?auto_1310002 ?auto_1310000 ) ( ON ?auto_1310003 ?auto_1310002 ) ( ON ?auto_1310004 ?auto_1310003 ) ( ON ?auto_1310005 ?auto_1310004 ) ( ON ?auto_1310006 ?auto_1310005 ) ( ON ?auto_1310007 ?auto_1310006 ) ( ON ?auto_1310008 ?auto_1310007 ) ( not ( = ?auto_1309997 ?auto_1309998 ) ) ( not ( = ?auto_1309997 ?auto_1309999 ) ) ( not ( = ?auto_1309997 ?auto_1310001 ) ) ( not ( = ?auto_1309997 ?auto_1310000 ) ) ( not ( = ?auto_1309997 ?auto_1310002 ) ) ( not ( = ?auto_1309997 ?auto_1310003 ) ) ( not ( = ?auto_1309997 ?auto_1310004 ) ) ( not ( = ?auto_1309997 ?auto_1310005 ) ) ( not ( = ?auto_1309997 ?auto_1310006 ) ) ( not ( = ?auto_1309997 ?auto_1310007 ) ) ( not ( = ?auto_1309997 ?auto_1310008 ) ) ( not ( = ?auto_1309997 ?auto_1310009 ) ) ( not ( = ?auto_1309997 ?auto_1310010 ) ) ( not ( = ?auto_1309997 ?auto_1310016 ) ) ( not ( = ?auto_1309998 ?auto_1309999 ) ) ( not ( = ?auto_1309998 ?auto_1310001 ) ) ( not ( = ?auto_1309998 ?auto_1310000 ) ) ( not ( = ?auto_1309998 ?auto_1310002 ) ) ( not ( = ?auto_1309998 ?auto_1310003 ) ) ( not ( = ?auto_1309998 ?auto_1310004 ) ) ( not ( = ?auto_1309998 ?auto_1310005 ) ) ( not ( = ?auto_1309998 ?auto_1310006 ) ) ( not ( = ?auto_1309998 ?auto_1310007 ) ) ( not ( = ?auto_1309998 ?auto_1310008 ) ) ( not ( = ?auto_1309998 ?auto_1310009 ) ) ( not ( = ?auto_1309998 ?auto_1310010 ) ) ( not ( = ?auto_1309998 ?auto_1310016 ) ) ( not ( = ?auto_1309999 ?auto_1310001 ) ) ( not ( = ?auto_1309999 ?auto_1310000 ) ) ( not ( = ?auto_1309999 ?auto_1310002 ) ) ( not ( = ?auto_1309999 ?auto_1310003 ) ) ( not ( = ?auto_1309999 ?auto_1310004 ) ) ( not ( = ?auto_1309999 ?auto_1310005 ) ) ( not ( = ?auto_1309999 ?auto_1310006 ) ) ( not ( = ?auto_1309999 ?auto_1310007 ) ) ( not ( = ?auto_1309999 ?auto_1310008 ) ) ( not ( = ?auto_1309999 ?auto_1310009 ) ) ( not ( = ?auto_1309999 ?auto_1310010 ) ) ( not ( = ?auto_1309999 ?auto_1310016 ) ) ( not ( = ?auto_1310001 ?auto_1310000 ) ) ( not ( = ?auto_1310001 ?auto_1310002 ) ) ( not ( = ?auto_1310001 ?auto_1310003 ) ) ( not ( = ?auto_1310001 ?auto_1310004 ) ) ( not ( = ?auto_1310001 ?auto_1310005 ) ) ( not ( = ?auto_1310001 ?auto_1310006 ) ) ( not ( = ?auto_1310001 ?auto_1310007 ) ) ( not ( = ?auto_1310001 ?auto_1310008 ) ) ( not ( = ?auto_1310001 ?auto_1310009 ) ) ( not ( = ?auto_1310001 ?auto_1310010 ) ) ( not ( = ?auto_1310001 ?auto_1310016 ) ) ( not ( = ?auto_1310000 ?auto_1310002 ) ) ( not ( = ?auto_1310000 ?auto_1310003 ) ) ( not ( = ?auto_1310000 ?auto_1310004 ) ) ( not ( = ?auto_1310000 ?auto_1310005 ) ) ( not ( = ?auto_1310000 ?auto_1310006 ) ) ( not ( = ?auto_1310000 ?auto_1310007 ) ) ( not ( = ?auto_1310000 ?auto_1310008 ) ) ( not ( = ?auto_1310000 ?auto_1310009 ) ) ( not ( = ?auto_1310000 ?auto_1310010 ) ) ( not ( = ?auto_1310000 ?auto_1310016 ) ) ( not ( = ?auto_1310002 ?auto_1310003 ) ) ( not ( = ?auto_1310002 ?auto_1310004 ) ) ( not ( = ?auto_1310002 ?auto_1310005 ) ) ( not ( = ?auto_1310002 ?auto_1310006 ) ) ( not ( = ?auto_1310002 ?auto_1310007 ) ) ( not ( = ?auto_1310002 ?auto_1310008 ) ) ( not ( = ?auto_1310002 ?auto_1310009 ) ) ( not ( = ?auto_1310002 ?auto_1310010 ) ) ( not ( = ?auto_1310002 ?auto_1310016 ) ) ( not ( = ?auto_1310003 ?auto_1310004 ) ) ( not ( = ?auto_1310003 ?auto_1310005 ) ) ( not ( = ?auto_1310003 ?auto_1310006 ) ) ( not ( = ?auto_1310003 ?auto_1310007 ) ) ( not ( = ?auto_1310003 ?auto_1310008 ) ) ( not ( = ?auto_1310003 ?auto_1310009 ) ) ( not ( = ?auto_1310003 ?auto_1310010 ) ) ( not ( = ?auto_1310003 ?auto_1310016 ) ) ( not ( = ?auto_1310004 ?auto_1310005 ) ) ( not ( = ?auto_1310004 ?auto_1310006 ) ) ( not ( = ?auto_1310004 ?auto_1310007 ) ) ( not ( = ?auto_1310004 ?auto_1310008 ) ) ( not ( = ?auto_1310004 ?auto_1310009 ) ) ( not ( = ?auto_1310004 ?auto_1310010 ) ) ( not ( = ?auto_1310004 ?auto_1310016 ) ) ( not ( = ?auto_1310005 ?auto_1310006 ) ) ( not ( = ?auto_1310005 ?auto_1310007 ) ) ( not ( = ?auto_1310005 ?auto_1310008 ) ) ( not ( = ?auto_1310005 ?auto_1310009 ) ) ( not ( = ?auto_1310005 ?auto_1310010 ) ) ( not ( = ?auto_1310005 ?auto_1310016 ) ) ( not ( = ?auto_1310006 ?auto_1310007 ) ) ( not ( = ?auto_1310006 ?auto_1310008 ) ) ( not ( = ?auto_1310006 ?auto_1310009 ) ) ( not ( = ?auto_1310006 ?auto_1310010 ) ) ( not ( = ?auto_1310006 ?auto_1310016 ) ) ( not ( = ?auto_1310007 ?auto_1310008 ) ) ( not ( = ?auto_1310007 ?auto_1310009 ) ) ( not ( = ?auto_1310007 ?auto_1310010 ) ) ( not ( = ?auto_1310007 ?auto_1310016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310008 ?auto_1310009 ?auto_1310010 )
      ( MAKE-13CRATE-VERIFY ?auto_1309997 ?auto_1309998 ?auto_1309999 ?auto_1310001 ?auto_1310000 ?auto_1310002 ?auto_1310003 ?auto_1310004 ?auto_1310005 ?auto_1310006 ?auto_1310007 ?auto_1310008 ?auto_1310009 ?auto_1310010 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1310180 - SURFACE
      ?auto_1310181 - SURFACE
      ?auto_1310182 - SURFACE
      ?auto_1310184 - SURFACE
      ?auto_1310183 - SURFACE
      ?auto_1310185 - SURFACE
      ?auto_1310186 - SURFACE
      ?auto_1310187 - SURFACE
      ?auto_1310188 - SURFACE
      ?auto_1310189 - SURFACE
      ?auto_1310190 - SURFACE
      ?auto_1310191 - SURFACE
      ?auto_1310192 - SURFACE
      ?auto_1310193 - SURFACE
    )
    :vars
    (
      ?auto_1310199 - HOIST
      ?auto_1310196 - PLACE
      ?auto_1310198 - PLACE
      ?auto_1310195 - HOIST
      ?auto_1310194 - SURFACE
      ?auto_1310197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1310199 ?auto_1310196 ) ( IS-CRATE ?auto_1310193 ) ( not ( = ?auto_1310192 ?auto_1310193 ) ) ( not ( = ?auto_1310191 ?auto_1310192 ) ) ( not ( = ?auto_1310191 ?auto_1310193 ) ) ( not ( = ?auto_1310198 ?auto_1310196 ) ) ( HOIST-AT ?auto_1310195 ?auto_1310198 ) ( not ( = ?auto_1310199 ?auto_1310195 ) ) ( AVAILABLE ?auto_1310195 ) ( SURFACE-AT ?auto_1310193 ?auto_1310198 ) ( ON ?auto_1310193 ?auto_1310194 ) ( CLEAR ?auto_1310193 ) ( not ( = ?auto_1310192 ?auto_1310194 ) ) ( not ( = ?auto_1310193 ?auto_1310194 ) ) ( not ( = ?auto_1310191 ?auto_1310194 ) ) ( TRUCK-AT ?auto_1310197 ?auto_1310196 ) ( SURFACE-AT ?auto_1310191 ?auto_1310196 ) ( CLEAR ?auto_1310191 ) ( IS-CRATE ?auto_1310192 ) ( AVAILABLE ?auto_1310199 ) ( IN ?auto_1310192 ?auto_1310197 ) ( ON ?auto_1310181 ?auto_1310180 ) ( ON ?auto_1310182 ?auto_1310181 ) ( ON ?auto_1310184 ?auto_1310182 ) ( ON ?auto_1310183 ?auto_1310184 ) ( ON ?auto_1310185 ?auto_1310183 ) ( ON ?auto_1310186 ?auto_1310185 ) ( ON ?auto_1310187 ?auto_1310186 ) ( ON ?auto_1310188 ?auto_1310187 ) ( ON ?auto_1310189 ?auto_1310188 ) ( ON ?auto_1310190 ?auto_1310189 ) ( ON ?auto_1310191 ?auto_1310190 ) ( not ( = ?auto_1310180 ?auto_1310181 ) ) ( not ( = ?auto_1310180 ?auto_1310182 ) ) ( not ( = ?auto_1310180 ?auto_1310184 ) ) ( not ( = ?auto_1310180 ?auto_1310183 ) ) ( not ( = ?auto_1310180 ?auto_1310185 ) ) ( not ( = ?auto_1310180 ?auto_1310186 ) ) ( not ( = ?auto_1310180 ?auto_1310187 ) ) ( not ( = ?auto_1310180 ?auto_1310188 ) ) ( not ( = ?auto_1310180 ?auto_1310189 ) ) ( not ( = ?auto_1310180 ?auto_1310190 ) ) ( not ( = ?auto_1310180 ?auto_1310191 ) ) ( not ( = ?auto_1310180 ?auto_1310192 ) ) ( not ( = ?auto_1310180 ?auto_1310193 ) ) ( not ( = ?auto_1310180 ?auto_1310194 ) ) ( not ( = ?auto_1310181 ?auto_1310182 ) ) ( not ( = ?auto_1310181 ?auto_1310184 ) ) ( not ( = ?auto_1310181 ?auto_1310183 ) ) ( not ( = ?auto_1310181 ?auto_1310185 ) ) ( not ( = ?auto_1310181 ?auto_1310186 ) ) ( not ( = ?auto_1310181 ?auto_1310187 ) ) ( not ( = ?auto_1310181 ?auto_1310188 ) ) ( not ( = ?auto_1310181 ?auto_1310189 ) ) ( not ( = ?auto_1310181 ?auto_1310190 ) ) ( not ( = ?auto_1310181 ?auto_1310191 ) ) ( not ( = ?auto_1310181 ?auto_1310192 ) ) ( not ( = ?auto_1310181 ?auto_1310193 ) ) ( not ( = ?auto_1310181 ?auto_1310194 ) ) ( not ( = ?auto_1310182 ?auto_1310184 ) ) ( not ( = ?auto_1310182 ?auto_1310183 ) ) ( not ( = ?auto_1310182 ?auto_1310185 ) ) ( not ( = ?auto_1310182 ?auto_1310186 ) ) ( not ( = ?auto_1310182 ?auto_1310187 ) ) ( not ( = ?auto_1310182 ?auto_1310188 ) ) ( not ( = ?auto_1310182 ?auto_1310189 ) ) ( not ( = ?auto_1310182 ?auto_1310190 ) ) ( not ( = ?auto_1310182 ?auto_1310191 ) ) ( not ( = ?auto_1310182 ?auto_1310192 ) ) ( not ( = ?auto_1310182 ?auto_1310193 ) ) ( not ( = ?auto_1310182 ?auto_1310194 ) ) ( not ( = ?auto_1310184 ?auto_1310183 ) ) ( not ( = ?auto_1310184 ?auto_1310185 ) ) ( not ( = ?auto_1310184 ?auto_1310186 ) ) ( not ( = ?auto_1310184 ?auto_1310187 ) ) ( not ( = ?auto_1310184 ?auto_1310188 ) ) ( not ( = ?auto_1310184 ?auto_1310189 ) ) ( not ( = ?auto_1310184 ?auto_1310190 ) ) ( not ( = ?auto_1310184 ?auto_1310191 ) ) ( not ( = ?auto_1310184 ?auto_1310192 ) ) ( not ( = ?auto_1310184 ?auto_1310193 ) ) ( not ( = ?auto_1310184 ?auto_1310194 ) ) ( not ( = ?auto_1310183 ?auto_1310185 ) ) ( not ( = ?auto_1310183 ?auto_1310186 ) ) ( not ( = ?auto_1310183 ?auto_1310187 ) ) ( not ( = ?auto_1310183 ?auto_1310188 ) ) ( not ( = ?auto_1310183 ?auto_1310189 ) ) ( not ( = ?auto_1310183 ?auto_1310190 ) ) ( not ( = ?auto_1310183 ?auto_1310191 ) ) ( not ( = ?auto_1310183 ?auto_1310192 ) ) ( not ( = ?auto_1310183 ?auto_1310193 ) ) ( not ( = ?auto_1310183 ?auto_1310194 ) ) ( not ( = ?auto_1310185 ?auto_1310186 ) ) ( not ( = ?auto_1310185 ?auto_1310187 ) ) ( not ( = ?auto_1310185 ?auto_1310188 ) ) ( not ( = ?auto_1310185 ?auto_1310189 ) ) ( not ( = ?auto_1310185 ?auto_1310190 ) ) ( not ( = ?auto_1310185 ?auto_1310191 ) ) ( not ( = ?auto_1310185 ?auto_1310192 ) ) ( not ( = ?auto_1310185 ?auto_1310193 ) ) ( not ( = ?auto_1310185 ?auto_1310194 ) ) ( not ( = ?auto_1310186 ?auto_1310187 ) ) ( not ( = ?auto_1310186 ?auto_1310188 ) ) ( not ( = ?auto_1310186 ?auto_1310189 ) ) ( not ( = ?auto_1310186 ?auto_1310190 ) ) ( not ( = ?auto_1310186 ?auto_1310191 ) ) ( not ( = ?auto_1310186 ?auto_1310192 ) ) ( not ( = ?auto_1310186 ?auto_1310193 ) ) ( not ( = ?auto_1310186 ?auto_1310194 ) ) ( not ( = ?auto_1310187 ?auto_1310188 ) ) ( not ( = ?auto_1310187 ?auto_1310189 ) ) ( not ( = ?auto_1310187 ?auto_1310190 ) ) ( not ( = ?auto_1310187 ?auto_1310191 ) ) ( not ( = ?auto_1310187 ?auto_1310192 ) ) ( not ( = ?auto_1310187 ?auto_1310193 ) ) ( not ( = ?auto_1310187 ?auto_1310194 ) ) ( not ( = ?auto_1310188 ?auto_1310189 ) ) ( not ( = ?auto_1310188 ?auto_1310190 ) ) ( not ( = ?auto_1310188 ?auto_1310191 ) ) ( not ( = ?auto_1310188 ?auto_1310192 ) ) ( not ( = ?auto_1310188 ?auto_1310193 ) ) ( not ( = ?auto_1310188 ?auto_1310194 ) ) ( not ( = ?auto_1310189 ?auto_1310190 ) ) ( not ( = ?auto_1310189 ?auto_1310191 ) ) ( not ( = ?auto_1310189 ?auto_1310192 ) ) ( not ( = ?auto_1310189 ?auto_1310193 ) ) ( not ( = ?auto_1310189 ?auto_1310194 ) ) ( not ( = ?auto_1310190 ?auto_1310191 ) ) ( not ( = ?auto_1310190 ?auto_1310192 ) ) ( not ( = ?auto_1310190 ?auto_1310193 ) ) ( not ( = ?auto_1310190 ?auto_1310194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1310191 ?auto_1310192 ?auto_1310193 )
      ( MAKE-13CRATE-VERIFY ?auto_1310180 ?auto_1310181 ?auto_1310182 ?auto_1310184 ?auto_1310183 ?auto_1310185 ?auto_1310186 ?auto_1310187 ?auto_1310188 ?auto_1310189 ?auto_1310190 ?auto_1310191 ?auto_1310192 ?auto_1310193 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1324396 - SURFACE
      ?auto_1324397 - SURFACE
      ?auto_1324398 - SURFACE
      ?auto_1324400 - SURFACE
      ?auto_1324399 - SURFACE
      ?auto_1324401 - SURFACE
      ?auto_1324402 - SURFACE
      ?auto_1324403 - SURFACE
      ?auto_1324404 - SURFACE
      ?auto_1324405 - SURFACE
      ?auto_1324406 - SURFACE
      ?auto_1324407 - SURFACE
      ?auto_1324408 - SURFACE
      ?auto_1324409 - SURFACE
      ?auto_1324410 - SURFACE
    )
    :vars
    (
      ?auto_1324412 - HOIST
      ?auto_1324411 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1324412 ?auto_1324411 ) ( SURFACE-AT ?auto_1324409 ?auto_1324411 ) ( CLEAR ?auto_1324409 ) ( LIFTING ?auto_1324412 ?auto_1324410 ) ( IS-CRATE ?auto_1324410 ) ( not ( = ?auto_1324409 ?auto_1324410 ) ) ( ON ?auto_1324397 ?auto_1324396 ) ( ON ?auto_1324398 ?auto_1324397 ) ( ON ?auto_1324400 ?auto_1324398 ) ( ON ?auto_1324399 ?auto_1324400 ) ( ON ?auto_1324401 ?auto_1324399 ) ( ON ?auto_1324402 ?auto_1324401 ) ( ON ?auto_1324403 ?auto_1324402 ) ( ON ?auto_1324404 ?auto_1324403 ) ( ON ?auto_1324405 ?auto_1324404 ) ( ON ?auto_1324406 ?auto_1324405 ) ( ON ?auto_1324407 ?auto_1324406 ) ( ON ?auto_1324408 ?auto_1324407 ) ( ON ?auto_1324409 ?auto_1324408 ) ( not ( = ?auto_1324396 ?auto_1324397 ) ) ( not ( = ?auto_1324396 ?auto_1324398 ) ) ( not ( = ?auto_1324396 ?auto_1324400 ) ) ( not ( = ?auto_1324396 ?auto_1324399 ) ) ( not ( = ?auto_1324396 ?auto_1324401 ) ) ( not ( = ?auto_1324396 ?auto_1324402 ) ) ( not ( = ?auto_1324396 ?auto_1324403 ) ) ( not ( = ?auto_1324396 ?auto_1324404 ) ) ( not ( = ?auto_1324396 ?auto_1324405 ) ) ( not ( = ?auto_1324396 ?auto_1324406 ) ) ( not ( = ?auto_1324396 ?auto_1324407 ) ) ( not ( = ?auto_1324396 ?auto_1324408 ) ) ( not ( = ?auto_1324396 ?auto_1324409 ) ) ( not ( = ?auto_1324396 ?auto_1324410 ) ) ( not ( = ?auto_1324397 ?auto_1324398 ) ) ( not ( = ?auto_1324397 ?auto_1324400 ) ) ( not ( = ?auto_1324397 ?auto_1324399 ) ) ( not ( = ?auto_1324397 ?auto_1324401 ) ) ( not ( = ?auto_1324397 ?auto_1324402 ) ) ( not ( = ?auto_1324397 ?auto_1324403 ) ) ( not ( = ?auto_1324397 ?auto_1324404 ) ) ( not ( = ?auto_1324397 ?auto_1324405 ) ) ( not ( = ?auto_1324397 ?auto_1324406 ) ) ( not ( = ?auto_1324397 ?auto_1324407 ) ) ( not ( = ?auto_1324397 ?auto_1324408 ) ) ( not ( = ?auto_1324397 ?auto_1324409 ) ) ( not ( = ?auto_1324397 ?auto_1324410 ) ) ( not ( = ?auto_1324398 ?auto_1324400 ) ) ( not ( = ?auto_1324398 ?auto_1324399 ) ) ( not ( = ?auto_1324398 ?auto_1324401 ) ) ( not ( = ?auto_1324398 ?auto_1324402 ) ) ( not ( = ?auto_1324398 ?auto_1324403 ) ) ( not ( = ?auto_1324398 ?auto_1324404 ) ) ( not ( = ?auto_1324398 ?auto_1324405 ) ) ( not ( = ?auto_1324398 ?auto_1324406 ) ) ( not ( = ?auto_1324398 ?auto_1324407 ) ) ( not ( = ?auto_1324398 ?auto_1324408 ) ) ( not ( = ?auto_1324398 ?auto_1324409 ) ) ( not ( = ?auto_1324398 ?auto_1324410 ) ) ( not ( = ?auto_1324400 ?auto_1324399 ) ) ( not ( = ?auto_1324400 ?auto_1324401 ) ) ( not ( = ?auto_1324400 ?auto_1324402 ) ) ( not ( = ?auto_1324400 ?auto_1324403 ) ) ( not ( = ?auto_1324400 ?auto_1324404 ) ) ( not ( = ?auto_1324400 ?auto_1324405 ) ) ( not ( = ?auto_1324400 ?auto_1324406 ) ) ( not ( = ?auto_1324400 ?auto_1324407 ) ) ( not ( = ?auto_1324400 ?auto_1324408 ) ) ( not ( = ?auto_1324400 ?auto_1324409 ) ) ( not ( = ?auto_1324400 ?auto_1324410 ) ) ( not ( = ?auto_1324399 ?auto_1324401 ) ) ( not ( = ?auto_1324399 ?auto_1324402 ) ) ( not ( = ?auto_1324399 ?auto_1324403 ) ) ( not ( = ?auto_1324399 ?auto_1324404 ) ) ( not ( = ?auto_1324399 ?auto_1324405 ) ) ( not ( = ?auto_1324399 ?auto_1324406 ) ) ( not ( = ?auto_1324399 ?auto_1324407 ) ) ( not ( = ?auto_1324399 ?auto_1324408 ) ) ( not ( = ?auto_1324399 ?auto_1324409 ) ) ( not ( = ?auto_1324399 ?auto_1324410 ) ) ( not ( = ?auto_1324401 ?auto_1324402 ) ) ( not ( = ?auto_1324401 ?auto_1324403 ) ) ( not ( = ?auto_1324401 ?auto_1324404 ) ) ( not ( = ?auto_1324401 ?auto_1324405 ) ) ( not ( = ?auto_1324401 ?auto_1324406 ) ) ( not ( = ?auto_1324401 ?auto_1324407 ) ) ( not ( = ?auto_1324401 ?auto_1324408 ) ) ( not ( = ?auto_1324401 ?auto_1324409 ) ) ( not ( = ?auto_1324401 ?auto_1324410 ) ) ( not ( = ?auto_1324402 ?auto_1324403 ) ) ( not ( = ?auto_1324402 ?auto_1324404 ) ) ( not ( = ?auto_1324402 ?auto_1324405 ) ) ( not ( = ?auto_1324402 ?auto_1324406 ) ) ( not ( = ?auto_1324402 ?auto_1324407 ) ) ( not ( = ?auto_1324402 ?auto_1324408 ) ) ( not ( = ?auto_1324402 ?auto_1324409 ) ) ( not ( = ?auto_1324402 ?auto_1324410 ) ) ( not ( = ?auto_1324403 ?auto_1324404 ) ) ( not ( = ?auto_1324403 ?auto_1324405 ) ) ( not ( = ?auto_1324403 ?auto_1324406 ) ) ( not ( = ?auto_1324403 ?auto_1324407 ) ) ( not ( = ?auto_1324403 ?auto_1324408 ) ) ( not ( = ?auto_1324403 ?auto_1324409 ) ) ( not ( = ?auto_1324403 ?auto_1324410 ) ) ( not ( = ?auto_1324404 ?auto_1324405 ) ) ( not ( = ?auto_1324404 ?auto_1324406 ) ) ( not ( = ?auto_1324404 ?auto_1324407 ) ) ( not ( = ?auto_1324404 ?auto_1324408 ) ) ( not ( = ?auto_1324404 ?auto_1324409 ) ) ( not ( = ?auto_1324404 ?auto_1324410 ) ) ( not ( = ?auto_1324405 ?auto_1324406 ) ) ( not ( = ?auto_1324405 ?auto_1324407 ) ) ( not ( = ?auto_1324405 ?auto_1324408 ) ) ( not ( = ?auto_1324405 ?auto_1324409 ) ) ( not ( = ?auto_1324405 ?auto_1324410 ) ) ( not ( = ?auto_1324406 ?auto_1324407 ) ) ( not ( = ?auto_1324406 ?auto_1324408 ) ) ( not ( = ?auto_1324406 ?auto_1324409 ) ) ( not ( = ?auto_1324406 ?auto_1324410 ) ) ( not ( = ?auto_1324407 ?auto_1324408 ) ) ( not ( = ?auto_1324407 ?auto_1324409 ) ) ( not ( = ?auto_1324407 ?auto_1324410 ) ) ( not ( = ?auto_1324408 ?auto_1324409 ) ) ( not ( = ?auto_1324408 ?auto_1324410 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1324409 ?auto_1324410 )
      ( MAKE-14CRATE-VERIFY ?auto_1324396 ?auto_1324397 ?auto_1324398 ?auto_1324400 ?auto_1324399 ?auto_1324401 ?auto_1324402 ?auto_1324403 ?auto_1324404 ?auto_1324405 ?auto_1324406 ?auto_1324407 ?auto_1324408 ?auto_1324409 ?auto_1324410 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1324556 - SURFACE
      ?auto_1324557 - SURFACE
      ?auto_1324558 - SURFACE
      ?auto_1324560 - SURFACE
      ?auto_1324559 - SURFACE
      ?auto_1324561 - SURFACE
      ?auto_1324562 - SURFACE
      ?auto_1324563 - SURFACE
      ?auto_1324564 - SURFACE
      ?auto_1324565 - SURFACE
      ?auto_1324566 - SURFACE
      ?auto_1324567 - SURFACE
      ?auto_1324568 - SURFACE
      ?auto_1324569 - SURFACE
      ?auto_1324570 - SURFACE
    )
    :vars
    (
      ?auto_1324572 - HOIST
      ?auto_1324571 - PLACE
      ?auto_1324573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1324572 ?auto_1324571 ) ( SURFACE-AT ?auto_1324569 ?auto_1324571 ) ( CLEAR ?auto_1324569 ) ( IS-CRATE ?auto_1324570 ) ( not ( = ?auto_1324569 ?auto_1324570 ) ) ( TRUCK-AT ?auto_1324573 ?auto_1324571 ) ( AVAILABLE ?auto_1324572 ) ( IN ?auto_1324570 ?auto_1324573 ) ( ON ?auto_1324569 ?auto_1324568 ) ( not ( = ?auto_1324568 ?auto_1324569 ) ) ( not ( = ?auto_1324568 ?auto_1324570 ) ) ( ON ?auto_1324557 ?auto_1324556 ) ( ON ?auto_1324558 ?auto_1324557 ) ( ON ?auto_1324560 ?auto_1324558 ) ( ON ?auto_1324559 ?auto_1324560 ) ( ON ?auto_1324561 ?auto_1324559 ) ( ON ?auto_1324562 ?auto_1324561 ) ( ON ?auto_1324563 ?auto_1324562 ) ( ON ?auto_1324564 ?auto_1324563 ) ( ON ?auto_1324565 ?auto_1324564 ) ( ON ?auto_1324566 ?auto_1324565 ) ( ON ?auto_1324567 ?auto_1324566 ) ( ON ?auto_1324568 ?auto_1324567 ) ( not ( = ?auto_1324556 ?auto_1324557 ) ) ( not ( = ?auto_1324556 ?auto_1324558 ) ) ( not ( = ?auto_1324556 ?auto_1324560 ) ) ( not ( = ?auto_1324556 ?auto_1324559 ) ) ( not ( = ?auto_1324556 ?auto_1324561 ) ) ( not ( = ?auto_1324556 ?auto_1324562 ) ) ( not ( = ?auto_1324556 ?auto_1324563 ) ) ( not ( = ?auto_1324556 ?auto_1324564 ) ) ( not ( = ?auto_1324556 ?auto_1324565 ) ) ( not ( = ?auto_1324556 ?auto_1324566 ) ) ( not ( = ?auto_1324556 ?auto_1324567 ) ) ( not ( = ?auto_1324556 ?auto_1324568 ) ) ( not ( = ?auto_1324556 ?auto_1324569 ) ) ( not ( = ?auto_1324556 ?auto_1324570 ) ) ( not ( = ?auto_1324557 ?auto_1324558 ) ) ( not ( = ?auto_1324557 ?auto_1324560 ) ) ( not ( = ?auto_1324557 ?auto_1324559 ) ) ( not ( = ?auto_1324557 ?auto_1324561 ) ) ( not ( = ?auto_1324557 ?auto_1324562 ) ) ( not ( = ?auto_1324557 ?auto_1324563 ) ) ( not ( = ?auto_1324557 ?auto_1324564 ) ) ( not ( = ?auto_1324557 ?auto_1324565 ) ) ( not ( = ?auto_1324557 ?auto_1324566 ) ) ( not ( = ?auto_1324557 ?auto_1324567 ) ) ( not ( = ?auto_1324557 ?auto_1324568 ) ) ( not ( = ?auto_1324557 ?auto_1324569 ) ) ( not ( = ?auto_1324557 ?auto_1324570 ) ) ( not ( = ?auto_1324558 ?auto_1324560 ) ) ( not ( = ?auto_1324558 ?auto_1324559 ) ) ( not ( = ?auto_1324558 ?auto_1324561 ) ) ( not ( = ?auto_1324558 ?auto_1324562 ) ) ( not ( = ?auto_1324558 ?auto_1324563 ) ) ( not ( = ?auto_1324558 ?auto_1324564 ) ) ( not ( = ?auto_1324558 ?auto_1324565 ) ) ( not ( = ?auto_1324558 ?auto_1324566 ) ) ( not ( = ?auto_1324558 ?auto_1324567 ) ) ( not ( = ?auto_1324558 ?auto_1324568 ) ) ( not ( = ?auto_1324558 ?auto_1324569 ) ) ( not ( = ?auto_1324558 ?auto_1324570 ) ) ( not ( = ?auto_1324560 ?auto_1324559 ) ) ( not ( = ?auto_1324560 ?auto_1324561 ) ) ( not ( = ?auto_1324560 ?auto_1324562 ) ) ( not ( = ?auto_1324560 ?auto_1324563 ) ) ( not ( = ?auto_1324560 ?auto_1324564 ) ) ( not ( = ?auto_1324560 ?auto_1324565 ) ) ( not ( = ?auto_1324560 ?auto_1324566 ) ) ( not ( = ?auto_1324560 ?auto_1324567 ) ) ( not ( = ?auto_1324560 ?auto_1324568 ) ) ( not ( = ?auto_1324560 ?auto_1324569 ) ) ( not ( = ?auto_1324560 ?auto_1324570 ) ) ( not ( = ?auto_1324559 ?auto_1324561 ) ) ( not ( = ?auto_1324559 ?auto_1324562 ) ) ( not ( = ?auto_1324559 ?auto_1324563 ) ) ( not ( = ?auto_1324559 ?auto_1324564 ) ) ( not ( = ?auto_1324559 ?auto_1324565 ) ) ( not ( = ?auto_1324559 ?auto_1324566 ) ) ( not ( = ?auto_1324559 ?auto_1324567 ) ) ( not ( = ?auto_1324559 ?auto_1324568 ) ) ( not ( = ?auto_1324559 ?auto_1324569 ) ) ( not ( = ?auto_1324559 ?auto_1324570 ) ) ( not ( = ?auto_1324561 ?auto_1324562 ) ) ( not ( = ?auto_1324561 ?auto_1324563 ) ) ( not ( = ?auto_1324561 ?auto_1324564 ) ) ( not ( = ?auto_1324561 ?auto_1324565 ) ) ( not ( = ?auto_1324561 ?auto_1324566 ) ) ( not ( = ?auto_1324561 ?auto_1324567 ) ) ( not ( = ?auto_1324561 ?auto_1324568 ) ) ( not ( = ?auto_1324561 ?auto_1324569 ) ) ( not ( = ?auto_1324561 ?auto_1324570 ) ) ( not ( = ?auto_1324562 ?auto_1324563 ) ) ( not ( = ?auto_1324562 ?auto_1324564 ) ) ( not ( = ?auto_1324562 ?auto_1324565 ) ) ( not ( = ?auto_1324562 ?auto_1324566 ) ) ( not ( = ?auto_1324562 ?auto_1324567 ) ) ( not ( = ?auto_1324562 ?auto_1324568 ) ) ( not ( = ?auto_1324562 ?auto_1324569 ) ) ( not ( = ?auto_1324562 ?auto_1324570 ) ) ( not ( = ?auto_1324563 ?auto_1324564 ) ) ( not ( = ?auto_1324563 ?auto_1324565 ) ) ( not ( = ?auto_1324563 ?auto_1324566 ) ) ( not ( = ?auto_1324563 ?auto_1324567 ) ) ( not ( = ?auto_1324563 ?auto_1324568 ) ) ( not ( = ?auto_1324563 ?auto_1324569 ) ) ( not ( = ?auto_1324563 ?auto_1324570 ) ) ( not ( = ?auto_1324564 ?auto_1324565 ) ) ( not ( = ?auto_1324564 ?auto_1324566 ) ) ( not ( = ?auto_1324564 ?auto_1324567 ) ) ( not ( = ?auto_1324564 ?auto_1324568 ) ) ( not ( = ?auto_1324564 ?auto_1324569 ) ) ( not ( = ?auto_1324564 ?auto_1324570 ) ) ( not ( = ?auto_1324565 ?auto_1324566 ) ) ( not ( = ?auto_1324565 ?auto_1324567 ) ) ( not ( = ?auto_1324565 ?auto_1324568 ) ) ( not ( = ?auto_1324565 ?auto_1324569 ) ) ( not ( = ?auto_1324565 ?auto_1324570 ) ) ( not ( = ?auto_1324566 ?auto_1324567 ) ) ( not ( = ?auto_1324566 ?auto_1324568 ) ) ( not ( = ?auto_1324566 ?auto_1324569 ) ) ( not ( = ?auto_1324566 ?auto_1324570 ) ) ( not ( = ?auto_1324567 ?auto_1324568 ) ) ( not ( = ?auto_1324567 ?auto_1324569 ) ) ( not ( = ?auto_1324567 ?auto_1324570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1324568 ?auto_1324569 ?auto_1324570 )
      ( MAKE-14CRATE-VERIFY ?auto_1324556 ?auto_1324557 ?auto_1324558 ?auto_1324560 ?auto_1324559 ?auto_1324561 ?auto_1324562 ?auto_1324563 ?auto_1324564 ?auto_1324565 ?auto_1324566 ?auto_1324567 ?auto_1324568 ?auto_1324569 ?auto_1324570 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1324731 - SURFACE
      ?auto_1324732 - SURFACE
      ?auto_1324733 - SURFACE
      ?auto_1324735 - SURFACE
      ?auto_1324734 - SURFACE
      ?auto_1324736 - SURFACE
      ?auto_1324737 - SURFACE
      ?auto_1324738 - SURFACE
      ?auto_1324739 - SURFACE
      ?auto_1324740 - SURFACE
      ?auto_1324741 - SURFACE
      ?auto_1324742 - SURFACE
      ?auto_1324743 - SURFACE
      ?auto_1324744 - SURFACE
      ?auto_1324745 - SURFACE
    )
    :vars
    (
      ?auto_1324748 - HOIST
      ?auto_1324747 - PLACE
      ?auto_1324746 - TRUCK
      ?auto_1324749 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1324748 ?auto_1324747 ) ( SURFACE-AT ?auto_1324744 ?auto_1324747 ) ( CLEAR ?auto_1324744 ) ( IS-CRATE ?auto_1324745 ) ( not ( = ?auto_1324744 ?auto_1324745 ) ) ( AVAILABLE ?auto_1324748 ) ( IN ?auto_1324745 ?auto_1324746 ) ( ON ?auto_1324744 ?auto_1324743 ) ( not ( = ?auto_1324743 ?auto_1324744 ) ) ( not ( = ?auto_1324743 ?auto_1324745 ) ) ( TRUCK-AT ?auto_1324746 ?auto_1324749 ) ( not ( = ?auto_1324749 ?auto_1324747 ) ) ( ON ?auto_1324732 ?auto_1324731 ) ( ON ?auto_1324733 ?auto_1324732 ) ( ON ?auto_1324735 ?auto_1324733 ) ( ON ?auto_1324734 ?auto_1324735 ) ( ON ?auto_1324736 ?auto_1324734 ) ( ON ?auto_1324737 ?auto_1324736 ) ( ON ?auto_1324738 ?auto_1324737 ) ( ON ?auto_1324739 ?auto_1324738 ) ( ON ?auto_1324740 ?auto_1324739 ) ( ON ?auto_1324741 ?auto_1324740 ) ( ON ?auto_1324742 ?auto_1324741 ) ( ON ?auto_1324743 ?auto_1324742 ) ( not ( = ?auto_1324731 ?auto_1324732 ) ) ( not ( = ?auto_1324731 ?auto_1324733 ) ) ( not ( = ?auto_1324731 ?auto_1324735 ) ) ( not ( = ?auto_1324731 ?auto_1324734 ) ) ( not ( = ?auto_1324731 ?auto_1324736 ) ) ( not ( = ?auto_1324731 ?auto_1324737 ) ) ( not ( = ?auto_1324731 ?auto_1324738 ) ) ( not ( = ?auto_1324731 ?auto_1324739 ) ) ( not ( = ?auto_1324731 ?auto_1324740 ) ) ( not ( = ?auto_1324731 ?auto_1324741 ) ) ( not ( = ?auto_1324731 ?auto_1324742 ) ) ( not ( = ?auto_1324731 ?auto_1324743 ) ) ( not ( = ?auto_1324731 ?auto_1324744 ) ) ( not ( = ?auto_1324731 ?auto_1324745 ) ) ( not ( = ?auto_1324732 ?auto_1324733 ) ) ( not ( = ?auto_1324732 ?auto_1324735 ) ) ( not ( = ?auto_1324732 ?auto_1324734 ) ) ( not ( = ?auto_1324732 ?auto_1324736 ) ) ( not ( = ?auto_1324732 ?auto_1324737 ) ) ( not ( = ?auto_1324732 ?auto_1324738 ) ) ( not ( = ?auto_1324732 ?auto_1324739 ) ) ( not ( = ?auto_1324732 ?auto_1324740 ) ) ( not ( = ?auto_1324732 ?auto_1324741 ) ) ( not ( = ?auto_1324732 ?auto_1324742 ) ) ( not ( = ?auto_1324732 ?auto_1324743 ) ) ( not ( = ?auto_1324732 ?auto_1324744 ) ) ( not ( = ?auto_1324732 ?auto_1324745 ) ) ( not ( = ?auto_1324733 ?auto_1324735 ) ) ( not ( = ?auto_1324733 ?auto_1324734 ) ) ( not ( = ?auto_1324733 ?auto_1324736 ) ) ( not ( = ?auto_1324733 ?auto_1324737 ) ) ( not ( = ?auto_1324733 ?auto_1324738 ) ) ( not ( = ?auto_1324733 ?auto_1324739 ) ) ( not ( = ?auto_1324733 ?auto_1324740 ) ) ( not ( = ?auto_1324733 ?auto_1324741 ) ) ( not ( = ?auto_1324733 ?auto_1324742 ) ) ( not ( = ?auto_1324733 ?auto_1324743 ) ) ( not ( = ?auto_1324733 ?auto_1324744 ) ) ( not ( = ?auto_1324733 ?auto_1324745 ) ) ( not ( = ?auto_1324735 ?auto_1324734 ) ) ( not ( = ?auto_1324735 ?auto_1324736 ) ) ( not ( = ?auto_1324735 ?auto_1324737 ) ) ( not ( = ?auto_1324735 ?auto_1324738 ) ) ( not ( = ?auto_1324735 ?auto_1324739 ) ) ( not ( = ?auto_1324735 ?auto_1324740 ) ) ( not ( = ?auto_1324735 ?auto_1324741 ) ) ( not ( = ?auto_1324735 ?auto_1324742 ) ) ( not ( = ?auto_1324735 ?auto_1324743 ) ) ( not ( = ?auto_1324735 ?auto_1324744 ) ) ( not ( = ?auto_1324735 ?auto_1324745 ) ) ( not ( = ?auto_1324734 ?auto_1324736 ) ) ( not ( = ?auto_1324734 ?auto_1324737 ) ) ( not ( = ?auto_1324734 ?auto_1324738 ) ) ( not ( = ?auto_1324734 ?auto_1324739 ) ) ( not ( = ?auto_1324734 ?auto_1324740 ) ) ( not ( = ?auto_1324734 ?auto_1324741 ) ) ( not ( = ?auto_1324734 ?auto_1324742 ) ) ( not ( = ?auto_1324734 ?auto_1324743 ) ) ( not ( = ?auto_1324734 ?auto_1324744 ) ) ( not ( = ?auto_1324734 ?auto_1324745 ) ) ( not ( = ?auto_1324736 ?auto_1324737 ) ) ( not ( = ?auto_1324736 ?auto_1324738 ) ) ( not ( = ?auto_1324736 ?auto_1324739 ) ) ( not ( = ?auto_1324736 ?auto_1324740 ) ) ( not ( = ?auto_1324736 ?auto_1324741 ) ) ( not ( = ?auto_1324736 ?auto_1324742 ) ) ( not ( = ?auto_1324736 ?auto_1324743 ) ) ( not ( = ?auto_1324736 ?auto_1324744 ) ) ( not ( = ?auto_1324736 ?auto_1324745 ) ) ( not ( = ?auto_1324737 ?auto_1324738 ) ) ( not ( = ?auto_1324737 ?auto_1324739 ) ) ( not ( = ?auto_1324737 ?auto_1324740 ) ) ( not ( = ?auto_1324737 ?auto_1324741 ) ) ( not ( = ?auto_1324737 ?auto_1324742 ) ) ( not ( = ?auto_1324737 ?auto_1324743 ) ) ( not ( = ?auto_1324737 ?auto_1324744 ) ) ( not ( = ?auto_1324737 ?auto_1324745 ) ) ( not ( = ?auto_1324738 ?auto_1324739 ) ) ( not ( = ?auto_1324738 ?auto_1324740 ) ) ( not ( = ?auto_1324738 ?auto_1324741 ) ) ( not ( = ?auto_1324738 ?auto_1324742 ) ) ( not ( = ?auto_1324738 ?auto_1324743 ) ) ( not ( = ?auto_1324738 ?auto_1324744 ) ) ( not ( = ?auto_1324738 ?auto_1324745 ) ) ( not ( = ?auto_1324739 ?auto_1324740 ) ) ( not ( = ?auto_1324739 ?auto_1324741 ) ) ( not ( = ?auto_1324739 ?auto_1324742 ) ) ( not ( = ?auto_1324739 ?auto_1324743 ) ) ( not ( = ?auto_1324739 ?auto_1324744 ) ) ( not ( = ?auto_1324739 ?auto_1324745 ) ) ( not ( = ?auto_1324740 ?auto_1324741 ) ) ( not ( = ?auto_1324740 ?auto_1324742 ) ) ( not ( = ?auto_1324740 ?auto_1324743 ) ) ( not ( = ?auto_1324740 ?auto_1324744 ) ) ( not ( = ?auto_1324740 ?auto_1324745 ) ) ( not ( = ?auto_1324741 ?auto_1324742 ) ) ( not ( = ?auto_1324741 ?auto_1324743 ) ) ( not ( = ?auto_1324741 ?auto_1324744 ) ) ( not ( = ?auto_1324741 ?auto_1324745 ) ) ( not ( = ?auto_1324742 ?auto_1324743 ) ) ( not ( = ?auto_1324742 ?auto_1324744 ) ) ( not ( = ?auto_1324742 ?auto_1324745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1324743 ?auto_1324744 ?auto_1324745 )
      ( MAKE-14CRATE-VERIFY ?auto_1324731 ?auto_1324732 ?auto_1324733 ?auto_1324735 ?auto_1324734 ?auto_1324736 ?auto_1324737 ?auto_1324738 ?auto_1324739 ?auto_1324740 ?auto_1324741 ?auto_1324742 ?auto_1324743 ?auto_1324744 ?auto_1324745 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1324920 - SURFACE
      ?auto_1324921 - SURFACE
      ?auto_1324922 - SURFACE
      ?auto_1324924 - SURFACE
      ?auto_1324923 - SURFACE
      ?auto_1324925 - SURFACE
      ?auto_1324926 - SURFACE
      ?auto_1324927 - SURFACE
      ?auto_1324928 - SURFACE
      ?auto_1324929 - SURFACE
      ?auto_1324930 - SURFACE
      ?auto_1324931 - SURFACE
      ?auto_1324932 - SURFACE
      ?auto_1324933 - SURFACE
      ?auto_1324934 - SURFACE
    )
    :vars
    (
      ?auto_1324935 - HOIST
      ?auto_1324938 - PLACE
      ?auto_1324939 - TRUCK
      ?auto_1324937 - PLACE
      ?auto_1324936 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1324935 ?auto_1324938 ) ( SURFACE-AT ?auto_1324933 ?auto_1324938 ) ( CLEAR ?auto_1324933 ) ( IS-CRATE ?auto_1324934 ) ( not ( = ?auto_1324933 ?auto_1324934 ) ) ( AVAILABLE ?auto_1324935 ) ( ON ?auto_1324933 ?auto_1324932 ) ( not ( = ?auto_1324932 ?auto_1324933 ) ) ( not ( = ?auto_1324932 ?auto_1324934 ) ) ( TRUCK-AT ?auto_1324939 ?auto_1324937 ) ( not ( = ?auto_1324937 ?auto_1324938 ) ) ( HOIST-AT ?auto_1324936 ?auto_1324937 ) ( LIFTING ?auto_1324936 ?auto_1324934 ) ( not ( = ?auto_1324935 ?auto_1324936 ) ) ( ON ?auto_1324921 ?auto_1324920 ) ( ON ?auto_1324922 ?auto_1324921 ) ( ON ?auto_1324924 ?auto_1324922 ) ( ON ?auto_1324923 ?auto_1324924 ) ( ON ?auto_1324925 ?auto_1324923 ) ( ON ?auto_1324926 ?auto_1324925 ) ( ON ?auto_1324927 ?auto_1324926 ) ( ON ?auto_1324928 ?auto_1324927 ) ( ON ?auto_1324929 ?auto_1324928 ) ( ON ?auto_1324930 ?auto_1324929 ) ( ON ?auto_1324931 ?auto_1324930 ) ( ON ?auto_1324932 ?auto_1324931 ) ( not ( = ?auto_1324920 ?auto_1324921 ) ) ( not ( = ?auto_1324920 ?auto_1324922 ) ) ( not ( = ?auto_1324920 ?auto_1324924 ) ) ( not ( = ?auto_1324920 ?auto_1324923 ) ) ( not ( = ?auto_1324920 ?auto_1324925 ) ) ( not ( = ?auto_1324920 ?auto_1324926 ) ) ( not ( = ?auto_1324920 ?auto_1324927 ) ) ( not ( = ?auto_1324920 ?auto_1324928 ) ) ( not ( = ?auto_1324920 ?auto_1324929 ) ) ( not ( = ?auto_1324920 ?auto_1324930 ) ) ( not ( = ?auto_1324920 ?auto_1324931 ) ) ( not ( = ?auto_1324920 ?auto_1324932 ) ) ( not ( = ?auto_1324920 ?auto_1324933 ) ) ( not ( = ?auto_1324920 ?auto_1324934 ) ) ( not ( = ?auto_1324921 ?auto_1324922 ) ) ( not ( = ?auto_1324921 ?auto_1324924 ) ) ( not ( = ?auto_1324921 ?auto_1324923 ) ) ( not ( = ?auto_1324921 ?auto_1324925 ) ) ( not ( = ?auto_1324921 ?auto_1324926 ) ) ( not ( = ?auto_1324921 ?auto_1324927 ) ) ( not ( = ?auto_1324921 ?auto_1324928 ) ) ( not ( = ?auto_1324921 ?auto_1324929 ) ) ( not ( = ?auto_1324921 ?auto_1324930 ) ) ( not ( = ?auto_1324921 ?auto_1324931 ) ) ( not ( = ?auto_1324921 ?auto_1324932 ) ) ( not ( = ?auto_1324921 ?auto_1324933 ) ) ( not ( = ?auto_1324921 ?auto_1324934 ) ) ( not ( = ?auto_1324922 ?auto_1324924 ) ) ( not ( = ?auto_1324922 ?auto_1324923 ) ) ( not ( = ?auto_1324922 ?auto_1324925 ) ) ( not ( = ?auto_1324922 ?auto_1324926 ) ) ( not ( = ?auto_1324922 ?auto_1324927 ) ) ( not ( = ?auto_1324922 ?auto_1324928 ) ) ( not ( = ?auto_1324922 ?auto_1324929 ) ) ( not ( = ?auto_1324922 ?auto_1324930 ) ) ( not ( = ?auto_1324922 ?auto_1324931 ) ) ( not ( = ?auto_1324922 ?auto_1324932 ) ) ( not ( = ?auto_1324922 ?auto_1324933 ) ) ( not ( = ?auto_1324922 ?auto_1324934 ) ) ( not ( = ?auto_1324924 ?auto_1324923 ) ) ( not ( = ?auto_1324924 ?auto_1324925 ) ) ( not ( = ?auto_1324924 ?auto_1324926 ) ) ( not ( = ?auto_1324924 ?auto_1324927 ) ) ( not ( = ?auto_1324924 ?auto_1324928 ) ) ( not ( = ?auto_1324924 ?auto_1324929 ) ) ( not ( = ?auto_1324924 ?auto_1324930 ) ) ( not ( = ?auto_1324924 ?auto_1324931 ) ) ( not ( = ?auto_1324924 ?auto_1324932 ) ) ( not ( = ?auto_1324924 ?auto_1324933 ) ) ( not ( = ?auto_1324924 ?auto_1324934 ) ) ( not ( = ?auto_1324923 ?auto_1324925 ) ) ( not ( = ?auto_1324923 ?auto_1324926 ) ) ( not ( = ?auto_1324923 ?auto_1324927 ) ) ( not ( = ?auto_1324923 ?auto_1324928 ) ) ( not ( = ?auto_1324923 ?auto_1324929 ) ) ( not ( = ?auto_1324923 ?auto_1324930 ) ) ( not ( = ?auto_1324923 ?auto_1324931 ) ) ( not ( = ?auto_1324923 ?auto_1324932 ) ) ( not ( = ?auto_1324923 ?auto_1324933 ) ) ( not ( = ?auto_1324923 ?auto_1324934 ) ) ( not ( = ?auto_1324925 ?auto_1324926 ) ) ( not ( = ?auto_1324925 ?auto_1324927 ) ) ( not ( = ?auto_1324925 ?auto_1324928 ) ) ( not ( = ?auto_1324925 ?auto_1324929 ) ) ( not ( = ?auto_1324925 ?auto_1324930 ) ) ( not ( = ?auto_1324925 ?auto_1324931 ) ) ( not ( = ?auto_1324925 ?auto_1324932 ) ) ( not ( = ?auto_1324925 ?auto_1324933 ) ) ( not ( = ?auto_1324925 ?auto_1324934 ) ) ( not ( = ?auto_1324926 ?auto_1324927 ) ) ( not ( = ?auto_1324926 ?auto_1324928 ) ) ( not ( = ?auto_1324926 ?auto_1324929 ) ) ( not ( = ?auto_1324926 ?auto_1324930 ) ) ( not ( = ?auto_1324926 ?auto_1324931 ) ) ( not ( = ?auto_1324926 ?auto_1324932 ) ) ( not ( = ?auto_1324926 ?auto_1324933 ) ) ( not ( = ?auto_1324926 ?auto_1324934 ) ) ( not ( = ?auto_1324927 ?auto_1324928 ) ) ( not ( = ?auto_1324927 ?auto_1324929 ) ) ( not ( = ?auto_1324927 ?auto_1324930 ) ) ( not ( = ?auto_1324927 ?auto_1324931 ) ) ( not ( = ?auto_1324927 ?auto_1324932 ) ) ( not ( = ?auto_1324927 ?auto_1324933 ) ) ( not ( = ?auto_1324927 ?auto_1324934 ) ) ( not ( = ?auto_1324928 ?auto_1324929 ) ) ( not ( = ?auto_1324928 ?auto_1324930 ) ) ( not ( = ?auto_1324928 ?auto_1324931 ) ) ( not ( = ?auto_1324928 ?auto_1324932 ) ) ( not ( = ?auto_1324928 ?auto_1324933 ) ) ( not ( = ?auto_1324928 ?auto_1324934 ) ) ( not ( = ?auto_1324929 ?auto_1324930 ) ) ( not ( = ?auto_1324929 ?auto_1324931 ) ) ( not ( = ?auto_1324929 ?auto_1324932 ) ) ( not ( = ?auto_1324929 ?auto_1324933 ) ) ( not ( = ?auto_1324929 ?auto_1324934 ) ) ( not ( = ?auto_1324930 ?auto_1324931 ) ) ( not ( = ?auto_1324930 ?auto_1324932 ) ) ( not ( = ?auto_1324930 ?auto_1324933 ) ) ( not ( = ?auto_1324930 ?auto_1324934 ) ) ( not ( = ?auto_1324931 ?auto_1324932 ) ) ( not ( = ?auto_1324931 ?auto_1324933 ) ) ( not ( = ?auto_1324931 ?auto_1324934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1324932 ?auto_1324933 ?auto_1324934 )
      ( MAKE-14CRATE-VERIFY ?auto_1324920 ?auto_1324921 ?auto_1324922 ?auto_1324924 ?auto_1324923 ?auto_1324925 ?auto_1324926 ?auto_1324927 ?auto_1324928 ?auto_1324929 ?auto_1324930 ?auto_1324931 ?auto_1324932 ?auto_1324933 ?auto_1324934 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325123 - SURFACE
      ?auto_1325124 - SURFACE
      ?auto_1325125 - SURFACE
      ?auto_1325127 - SURFACE
      ?auto_1325126 - SURFACE
      ?auto_1325128 - SURFACE
      ?auto_1325129 - SURFACE
      ?auto_1325130 - SURFACE
      ?auto_1325131 - SURFACE
      ?auto_1325132 - SURFACE
      ?auto_1325133 - SURFACE
      ?auto_1325134 - SURFACE
      ?auto_1325135 - SURFACE
      ?auto_1325136 - SURFACE
      ?auto_1325137 - SURFACE
    )
    :vars
    (
      ?auto_1325143 - HOIST
      ?auto_1325141 - PLACE
      ?auto_1325138 - TRUCK
      ?auto_1325139 - PLACE
      ?auto_1325142 - HOIST
      ?auto_1325140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325143 ?auto_1325141 ) ( SURFACE-AT ?auto_1325136 ?auto_1325141 ) ( CLEAR ?auto_1325136 ) ( IS-CRATE ?auto_1325137 ) ( not ( = ?auto_1325136 ?auto_1325137 ) ) ( AVAILABLE ?auto_1325143 ) ( ON ?auto_1325136 ?auto_1325135 ) ( not ( = ?auto_1325135 ?auto_1325136 ) ) ( not ( = ?auto_1325135 ?auto_1325137 ) ) ( TRUCK-AT ?auto_1325138 ?auto_1325139 ) ( not ( = ?auto_1325139 ?auto_1325141 ) ) ( HOIST-AT ?auto_1325142 ?auto_1325139 ) ( not ( = ?auto_1325143 ?auto_1325142 ) ) ( AVAILABLE ?auto_1325142 ) ( SURFACE-AT ?auto_1325137 ?auto_1325139 ) ( ON ?auto_1325137 ?auto_1325140 ) ( CLEAR ?auto_1325137 ) ( not ( = ?auto_1325136 ?auto_1325140 ) ) ( not ( = ?auto_1325137 ?auto_1325140 ) ) ( not ( = ?auto_1325135 ?auto_1325140 ) ) ( ON ?auto_1325124 ?auto_1325123 ) ( ON ?auto_1325125 ?auto_1325124 ) ( ON ?auto_1325127 ?auto_1325125 ) ( ON ?auto_1325126 ?auto_1325127 ) ( ON ?auto_1325128 ?auto_1325126 ) ( ON ?auto_1325129 ?auto_1325128 ) ( ON ?auto_1325130 ?auto_1325129 ) ( ON ?auto_1325131 ?auto_1325130 ) ( ON ?auto_1325132 ?auto_1325131 ) ( ON ?auto_1325133 ?auto_1325132 ) ( ON ?auto_1325134 ?auto_1325133 ) ( ON ?auto_1325135 ?auto_1325134 ) ( not ( = ?auto_1325123 ?auto_1325124 ) ) ( not ( = ?auto_1325123 ?auto_1325125 ) ) ( not ( = ?auto_1325123 ?auto_1325127 ) ) ( not ( = ?auto_1325123 ?auto_1325126 ) ) ( not ( = ?auto_1325123 ?auto_1325128 ) ) ( not ( = ?auto_1325123 ?auto_1325129 ) ) ( not ( = ?auto_1325123 ?auto_1325130 ) ) ( not ( = ?auto_1325123 ?auto_1325131 ) ) ( not ( = ?auto_1325123 ?auto_1325132 ) ) ( not ( = ?auto_1325123 ?auto_1325133 ) ) ( not ( = ?auto_1325123 ?auto_1325134 ) ) ( not ( = ?auto_1325123 ?auto_1325135 ) ) ( not ( = ?auto_1325123 ?auto_1325136 ) ) ( not ( = ?auto_1325123 ?auto_1325137 ) ) ( not ( = ?auto_1325123 ?auto_1325140 ) ) ( not ( = ?auto_1325124 ?auto_1325125 ) ) ( not ( = ?auto_1325124 ?auto_1325127 ) ) ( not ( = ?auto_1325124 ?auto_1325126 ) ) ( not ( = ?auto_1325124 ?auto_1325128 ) ) ( not ( = ?auto_1325124 ?auto_1325129 ) ) ( not ( = ?auto_1325124 ?auto_1325130 ) ) ( not ( = ?auto_1325124 ?auto_1325131 ) ) ( not ( = ?auto_1325124 ?auto_1325132 ) ) ( not ( = ?auto_1325124 ?auto_1325133 ) ) ( not ( = ?auto_1325124 ?auto_1325134 ) ) ( not ( = ?auto_1325124 ?auto_1325135 ) ) ( not ( = ?auto_1325124 ?auto_1325136 ) ) ( not ( = ?auto_1325124 ?auto_1325137 ) ) ( not ( = ?auto_1325124 ?auto_1325140 ) ) ( not ( = ?auto_1325125 ?auto_1325127 ) ) ( not ( = ?auto_1325125 ?auto_1325126 ) ) ( not ( = ?auto_1325125 ?auto_1325128 ) ) ( not ( = ?auto_1325125 ?auto_1325129 ) ) ( not ( = ?auto_1325125 ?auto_1325130 ) ) ( not ( = ?auto_1325125 ?auto_1325131 ) ) ( not ( = ?auto_1325125 ?auto_1325132 ) ) ( not ( = ?auto_1325125 ?auto_1325133 ) ) ( not ( = ?auto_1325125 ?auto_1325134 ) ) ( not ( = ?auto_1325125 ?auto_1325135 ) ) ( not ( = ?auto_1325125 ?auto_1325136 ) ) ( not ( = ?auto_1325125 ?auto_1325137 ) ) ( not ( = ?auto_1325125 ?auto_1325140 ) ) ( not ( = ?auto_1325127 ?auto_1325126 ) ) ( not ( = ?auto_1325127 ?auto_1325128 ) ) ( not ( = ?auto_1325127 ?auto_1325129 ) ) ( not ( = ?auto_1325127 ?auto_1325130 ) ) ( not ( = ?auto_1325127 ?auto_1325131 ) ) ( not ( = ?auto_1325127 ?auto_1325132 ) ) ( not ( = ?auto_1325127 ?auto_1325133 ) ) ( not ( = ?auto_1325127 ?auto_1325134 ) ) ( not ( = ?auto_1325127 ?auto_1325135 ) ) ( not ( = ?auto_1325127 ?auto_1325136 ) ) ( not ( = ?auto_1325127 ?auto_1325137 ) ) ( not ( = ?auto_1325127 ?auto_1325140 ) ) ( not ( = ?auto_1325126 ?auto_1325128 ) ) ( not ( = ?auto_1325126 ?auto_1325129 ) ) ( not ( = ?auto_1325126 ?auto_1325130 ) ) ( not ( = ?auto_1325126 ?auto_1325131 ) ) ( not ( = ?auto_1325126 ?auto_1325132 ) ) ( not ( = ?auto_1325126 ?auto_1325133 ) ) ( not ( = ?auto_1325126 ?auto_1325134 ) ) ( not ( = ?auto_1325126 ?auto_1325135 ) ) ( not ( = ?auto_1325126 ?auto_1325136 ) ) ( not ( = ?auto_1325126 ?auto_1325137 ) ) ( not ( = ?auto_1325126 ?auto_1325140 ) ) ( not ( = ?auto_1325128 ?auto_1325129 ) ) ( not ( = ?auto_1325128 ?auto_1325130 ) ) ( not ( = ?auto_1325128 ?auto_1325131 ) ) ( not ( = ?auto_1325128 ?auto_1325132 ) ) ( not ( = ?auto_1325128 ?auto_1325133 ) ) ( not ( = ?auto_1325128 ?auto_1325134 ) ) ( not ( = ?auto_1325128 ?auto_1325135 ) ) ( not ( = ?auto_1325128 ?auto_1325136 ) ) ( not ( = ?auto_1325128 ?auto_1325137 ) ) ( not ( = ?auto_1325128 ?auto_1325140 ) ) ( not ( = ?auto_1325129 ?auto_1325130 ) ) ( not ( = ?auto_1325129 ?auto_1325131 ) ) ( not ( = ?auto_1325129 ?auto_1325132 ) ) ( not ( = ?auto_1325129 ?auto_1325133 ) ) ( not ( = ?auto_1325129 ?auto_1325134 ) ) ( not ( = ?auto_1325129 ?auto_1325135 ) ) ( not ( = ?auto_1325129 ?auto_1325136 ) ) ( not ( = ?auto_1325129 ?auto_1325137 ) ) ( not ( = ?auto_1325129 ?auto_1325140 ) ) ( not ( = ?auto_1325130 ?auto_1325131 ) ) ( not ( = ?auto_1325130 ?auto_1325132 ) ) ( not ( = ?auto_1325130 ?auto_1325133 ) ) ( not ( = ?auto_1325130 ?auto_1325134 ) ) ( not ( = ?auto_1325130 ?auto_1325135 ) ) ( not ( = ?auto_1325130 ?auto_1325136 ) ) ( not ( = ?auto_1325130 ?auto_1325137 ) ) ( not ( = ?auto_1325130 ?auto_1325140 ) ) ( not ( = ?auto_1325131 ?auto_1325132 ) ) ( not ( = ?auto_1325131 ?auto_1325133 ) ) ( not ( = ?auto_1325131 ?auto_1325134 ) ) ( not ( = ?auto_1325131 ?auto_1325135 ) ) ( not ( = ?auto_1325131 ?auto_1325136 ) ) ( not ( = ?auto_1325131 ?auto_1325137 ) ) ( not ( = ?auto_1325131 ?auto_1325140 ) ) ( not ( = ?auto_1325132 ?auto_1325133 ) ) ( not ( = ?auto_1325132 ?auto_1325134 ) ) ( not ( = ?auto_1325132 ?auto_1325135 ) ) ( not ( = ?auto_1325132 ?auto_1325136 ) ) ( not ( = ?auto_1325132 ?auto_1325137 ) ) ( not ( = ?auto_1325132 ?auto_1325140 ) ) ( not ( = ?auto_1325133 ?auto_1325134 ) ) ( not ( = ?auto_1325133 ?auto_1325135 ) ) ( not ( = ?auto_1325133 ?auto_1325136 ) ) ( not ( = ?auto_1325133 ?auto_1325137 ) ) ( not ( = ?auto_1325133 ?auto_1325140 ) ) ( not ( = ?auto_1325134 ?auto_1325135 ) ) ( not ( = ?auto_1325134 ?auto_1325136 ) ) ( not ( = ?auto_1325134 ?auto_1325137 ) ) ( not ( = ?auto_1325134 ?auto_1325140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325135 ?auto_1325136 ?auto_1325137 )
      ( MAKE-14CRATE-VERIFY ?auto_1325123 ?auto_1325124 ?auto_1325125 ?auto_1325127 ?auto_1325126 ?auto_1325128 ?auto_1325129 ?auto_1325130 ?auto_1325131 ?auto_1325132 ?auto_1325133 ?auto_1325134 ?auto_1325135 ?auto_1325136 ?auto_1325137 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325327 - SURFACE
      ?auto_1325328 - SURFACE
      ?auto_1325329 - SURFACE
      ?auto_1325331 - SURFACE
      ?auto_1325330 - SURFACE
      ?auto_1325332 - SURFACE
      ?auto_1325333 - SURFACE
      ?auto_1325334 - SURFACE
      ?auto_1325335 - SURFACE
      ?auto_1325336 - SURFACE
      ?auto_1325337 - SURFACE
      ?auto_1325338 - SURFACE
      ?auto_1325339 - SURFACE
      ?auto_1325340 - SURFACE
      ?auto_1325341 - SURFACE
    )
    :vars
    (
      ?auto_1325347 - HOIST
      ?auto_1325344 - PLACE
      ?auto_1325343 - PLACE
      ?auto_1325345 - HOIST
      ?auto_1325346 - SURFACE
      ?auto_1325342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325347 ?auto_1325344 ) ( SURFACE-AT ?auto_1325340 ?auto_1325344 ) ( CLEAR ?auto_1325340 ) ( IS-CRATE ?auto_1325341 ) ( not ( = ?auto_1325340 ?auto_1325341 ) ) ( AVAILABLE ?auto_1325347 ) ( ON ?auto_1325340 ?auto_1325339 ) ( not ( = ?auto_1325339 ?auto_1325340 ) ) ( not ( = ?auto_1325339 ?auto_1325341 ) ) ( not ( = ?auto_1325343 ?auto_1325344 ) ) ( HOIST-AT ?auto_1325345 ?auto_1325343 ) ( not ( = ?auto_1325347 ?auto_1325345 ) ) ( AVAILABLE ?auto_1325345 ) ( SURFACE-AT ?auto_1325341 ?auto_1325343 ) ( ON ?auto_1325341 ?auto_1325346 ) ( CLEAR ?auto_1325341 ) ( not ( = ?auto_1325340 ?auto_1325346 ) ) ( not ( = ?auto_1325341 ?auto_1325346 ) ) ( not ( = ?auto_1325339 ?auto_1325346 ) ) ( TRUCK-AT ?auto_1325342 ?auto_1325344 ) ( ON ?auto_1325328 ?auto_1325327 ) ( ON ?auto_1325329 ?auto_1325328 ) ( ON ?auto_1325331 ?auto_1325329 ) ( ON ?auto_1325330 ?auto_1325331 ) ( ON ?auto_1325332 ?auto_1325330 ) ( ON ?auto_1325333 ?auto_1325332 ) ( ON ?auto_1325334 ?auto_1325333 ) ( ON ?auto_1325335 ?auto_1325334 ) ( ON ?auto_1325336 ?auto_1325335 ) ( ON ?auto_1325337 ?auto_1325336 ) ( ON ?auto_1325338 ?auto_1325337 ) ( ON ?auto_1325339 ?auto_1325338 ) ( not ( = ?auto_1325327 ?auto_1325328 ) ) ( not ( = ?auto_1325327 ?auto_1325329 ) ) ( not ( = ?auto_1325327 ?auto_1325331 ) ) ( not ( = ?auto_1325327 ?auto_1325330 ) ) ( not ( = ?auto_1325327 ?auto_1325332 ) ) ( not ( = ?auto_1325327 ?auto_1325333 ) ) ( not ( = ?auto_1325327 ?auto_1325334 ) ) ( not ( = ?auto_1325327 ?auto_1325335 ) ) ( not ( = ?auto_1325327 ?auto_1325336 ) ) ( not ( = ?auto_1325327 ?auto_1325337 ) ) ( not ( = ?auto_1325327 ?auto_1325338 ) ) ( not ( = ?auto_1325327 ?auto_1325339 ) ) ( not ( = ?auto_1325327 ?auto_1325340 ) ) ( not ( = ?auto_1325327 ?auto_1325341 ) ) ( not ( = ?auto_1325327 ?auto_1325346 ) ) ( not ( = ?auto_1325328 ?auto_1325329 ) ) ( not ( = ?auto_1325328 ?auto_1325331 ) ) ( not ( = ?auto_1325328 ?auto_1325330 ) ) ( not ( = ?auto_1325328 ?auto_1325332 ) ) ( not ( = ?auto_1325328 ?auto_1325333 ) ) ( not ( = ?auto_1325328 ?auto_1325334 ) ) ( not ( = ?auto_1325328 ?auto_1325335 ) ) ( not ( = ?auto_1325328 ?auto_1325336 ) ) ( not ( = ?auto_1325328 ?auto_1325337 ) ) ( not ( = ?auto_1325328 ?auto_1325338 ) ) ( not ( = ?auto_1325328 ?auto_1325339 ) ) ( not ( = ?auto_1325328 ?auto_1325340 ) ) ( not ( = ?auto_1325328 ?auto_1325341 ) ) ( not ( = ?auto_1325328 ?auto_1325346 ) ) ( not ( = ?auto_1325329 ?auto_1325331 ) ) ( not ( = ?auto_1325329 ?auto_1325330 ) ) ( not ( = ?auto_1325329 ?auto_1325332 ) ) ( not ( = ?auto_1325329 ?auto_1325333 ) ) ( not ( = ?auto_1325329 ?auto_1325334 ) ) ( not ( = ?auto_1325329 ?auto_1325335 ) ) ( not ( = ?auto_1325329 ?auto_1325336 ) ) ( not ( = ?auto_1325329 ?auto_1325337 ) ) ( not ( = ?auto_1325329 ?auto_1325338 ) ) ( not ( = ?auto_1325329 ?auto_1325339 ) ) ( not ( = ?auto_1325329 ?auto_1325340 ) ) ( not ( = ?auto_1325329 ?auto_1325341 ) ) ( not ( = ?auto_1325329 ?auto_1325346 ) ) ( not ( = ?auto_1325331 ?auto_1325330 ) ) ( not ( = ?auto_1325331 ?auto_1325332 ) ) ( not ( = ?auto_1325331 ?auto_1325333 ) ) ( not ( = ?auto_1325331 ?auto_1325334 ) ) ( not ( = ?auto_1325331 ?auto_1325335 ) ) ( not ( = ?auto_1325331 ?auto_1325336 ) ) ( not ( = ?auto_1325331 ?auto_1325337 ) ) ( not ( = ?auto_1325331 ?auto_1325338 ) ) ( not ( = ?auto_1325331 ?auto_1325339 ) ) ( not ( = ?auto_1325331 ?auto_1325340 ) ) ( not ( = ?auto_1325331 ?auto_1325341 ) ) ( not ( = ?auto_1325331 ?auto_1325346 ) ) ( not ( = ?auto_1325330 ?auto_1325332 ) ) ( not ( = ?auto_1325330 ?auto_1325333 ) ) ( not ( = ?auto_1325330 ?auto_1325334 ) ) ( not ( = ?auto_1325330 ?auto_1325335 ) ) ( not ( = ?auto_1325330 ?auto_1325336 ) ) ( not ( = ?auto_1325330 ?auto_1325337 ) ) ( not ( = ?auto_1325330 ?auto_1325338 ) ) ( not ( = ?auto_1325330 ?auto_1325339 ) ) ( not ( = ?auto_1325330 ?auto_1325340 ) ) ( not ( = ?auto_1325330 ?auto_1325341 ) ) ( not ( = ?auto_1325330 ?auto_1325346 ) ) ( not ( = ?auto_1325332 ?auto_1325333 ) ) ( not ( = ?auto_1325332 ?auto_1325334 ) ) ( not ( = ?auto_1325332 ?auto_1325335 ) ) ( not ( = ?auto_1325332 ?auto_1325336 ) ) ( not ( = ?auto_1325332 ?auto_1325337 ) ) ( not ( = ?auto_1325332 ?auto_1325338 ) ) ( not ( = ?auto_1325332 ?auto_1325339 ) ) ( not ( = ?auto_1325332 ?auto_1325340 ) ) ( not ( = ?auto_1325332 ?auto_1325341 ) ) ( not ( = ?auto_1325332 ?auto_1325346 ) ) ( not ( = ?auto_1325333 ?auto_1325334 ) ) ( not ( = ?auto_1325333 ?auto_1325335 ) ) ( not ( = ?auto_1325333 ?auto_1325336 ) ) ( not ( = ?auto_1325333 ?auto_1325337 ) ) ( not ( = ?auto_1325333 ?auto_1325338 ) ) ( not ( = ?auto_1325333 ?auto_1325339 ) ) ( not ( = ?auto_1325333 ?auto_1325340 ) ) ( not ( = ?auto_1325333 ?auto_1325341 ) ) ( not ( = ?auto_1325333 ?auto_1325346 ) ) ( not ( = ?auto_1325334 ?auto_1325335 ) ) ( not ( = ?auto_1325334 ?auto_1325336 ) ) ( not ( = ?auto_1325334 ?auto_1325337 ) ) ( not ( = ?auto_1325334 ?auto_1325338 ) ) ( not ( = ?auto_1325334 ?auto_1325339 ) ) ( not ( = ?auto_1325334 ?auto_1325340 ) ) ( not ( = ?auto_1325334 ?auto_1325341 ) ) ( not ( = ?auto_1325334 ?auto_1325346 ) ) ( not ( = ?auto_1325335 ?auto_1325336 ) ) ( not ( = ?auto_1325335 ?auto_1325337 ) ) ( not ( = ?auto_1325335 ?auto_1325338 ) ) ( not ( = ?auto_1325335 ?auto_1325339 ) ) ( not ( = ?auto_1325335 ?auto_1325340 ) ) ( not ( = ?auto_1325335 ?auto_1325341 ) ) ( not ( = ?auto_1325335 ?auto_1325346 ) ) ( not ( = ?auto_1325336 ?auto_1325337 ) ) ( not ( = ?auto_1325336 ?auto_1325338 ) ) ( not ( = ?auto_1325336 ?auto_1325339 ) ) ( not ( = ?auto_1325336 ?auto_1325340 ) ) ( not ( = ?auto_1325336 ?auto_1325341 ) ) ( not ( = ?auto_1325336 ?auto_1325346 ) ) ( not ( = ?auto_1325337 ?auto_1325338 ) ) ( not ( = ?auto_1325337 ?auto_1325339 ) ) ( not ( = ?auto_1325337 ?auto_1325340 ) ) ( not ( = ?auto_1325337 ?auto_1325341 ) ) ( not ( = ?auto_1325337 ?auto_1325346 ) ) ( not ( = ?auto_1325338 ?auto_1325339 ) ) ( not ( = ?auto_1325338 ?auto_1325340 ) ) ( not ( = ?auto_1325338 ?auto_1325341 ) ) ( not ( = ?auto_1325338 ?auto_1325346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325339 ?auto_1325340 ?auto_1325341 )
      ( MAKE-14CRATE-VERIFY ?auto_1325327 ?auto_1325328 ?auto_1325329 ?auto_1325331 ?auto_1325330 ?auto_1325332 ?auto_1325333 ?auto_1325334 ?auto_1325335 ?auto_1325336 ?auto_1325337 ?auto_1325338 ?auto_1325339 ?auto_1325340 ?auto_1325341 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325531 - SURFACE
      ?auto_1325532 - SURFACE
      ?auto_1325533 - SURFACE
      ?auto_1325535 - SURFACE
      ?auto_1325534 - SURFACE
      ?auto_1325536 - SURFACE
      ?auto_1325537 - SURFACE
      ?auto_1325538 - SURFACE
      ?auto_1325539 - SURFACE
      ?auto_1325540 - SURFACE
      ?auto_1325541 - SURFACE
      ?auto_1325542 - SURFACE
      ?auto_1325543 - SURFACE
      ?auto_1325544 - SURFACE
      ?auto_1325545 - SURFACE
    )
    :vars
    (
      ?auto_1325548 - HOIST
      ?auto_1325546 - PLACE
      ?auto_1325547 - PLACE
      ?auto_1325549 - HOIST
      ?auto_1325550 - SURFACE
      ?auto_1325551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325548 ?auto_1325546 ) ( IS-CRATE ?auto_1325545 ) ( not ( = ?auto_1325544 ?auto_1325545 ) ) ( not ( = ?auto_1325543 ?auto_1325544 ) ) ( not ( = ?auto_1325543 ?auto_1325545 ) ) ( not ( = ?auto_1325547 ?auto_1325546 ) ) ( HOIST-AT ?auto_1325549 ?auto_1325547 ) ( not ( = ?auto_1325548 ?auto_1325549 ) ) ( AVAILABLE ?auto_1325549 ) ( SURFACE-AT ?auto_1325545 ?auto_1325547 ) ( ON ?auto_1325545 ?auto_1325550 ) ( CLEAR ?auto_1325545 ) ( not ( = ?auto_1325544 ?auto_1325550 ) ) ( not ( = ?auto_1325545 ?auto_1325550 ) ) ( not ( = ?auto_1325543 ?auto_1325550 ) ) ( TRUCK-AT ?auto_1325551 ?auto_1325546 ) ( SURFACE-AT ?auto_1325543 ?auto_1325546 ) ( CLEAR ?auto_1325543 ) ( LIFTING ?auto_1325548 ?auto_1325544 ) ( IS-CRATE ?auto_1325544 ) ( ON ?auto_1325532 ?auto_1325531 ) ( ON ?auto_1325533 ?auto_1325532 ) ( ON ?auto_1325535 ?auto_1325533 ) ( ON ?auto_1325534 ?auto_1325535 ) ( ON ?auto_1325536 ?auto_1325534 ) ( ON ?auto_1325537 ?auto_1325536 ) ( ON ?auto_1325538 ?auto_1325537 ) ( ON ?auto_1325539 ?auto_1325538 ) ( ON ?auto_1325540 ?auto_1325539 ) ( ON ?auto_1325541 ?auto_1325540 ) ( ON ?auto_1325542 ?auto_1325541 ) ( ON ?auto_1325543 ?auto_1325542 ) ( not ( = ?auto_1325531 ?auto_1325532 ) ) ( not ( = ?auto_1325531 ?auto_1325533 ) ) ( not ( = ?auto_1325531 ?auto_1325535 ) ) ( not ( = ?auto_1325531 ?auto_1325534 ) ) ( not ( = ?auto_1325531 ?auto_1325536 ) ) ( not ( = ?auto_1325531 ?auto_1325537 ) ) ( not ( = ?auto_1325531 ?auto_1325538 ) ) ( not ( = ?auto_1325531 ?auto_1325539 ) ) ( not ( = ?auto_1325531 ?auto_1325540 ) ) ( not ( = ?auto_1325531 ?auto_1325541 ) ) ( not ( = ?auto_1325531 ?auto_1325542 ) ) ( not ( = ?auto_1325531 ?auto_1325543 ) ) ( not ( = ?auto_1325531 ?auto_1325544 ) ) ( not ( = ?auto_1325531 ?auto_1325545 ) ) ( not ( = ?auto_1325531 ?auto_1325550 ) ) ( not ( = ?auto_1325532 ?auto_1325533 ) ) ( not ( = ?auto_1325532 ?auto_1325535 ) ) ( not ( = ?auto_1325532 ?auto_1325534 ) ) ( not ( = ?auto_1325532 ?auto_1325536 ) ) ( not ( = ?auto_1325532 ?auto_1325537 ) ) ( not ( = ?auto_1325532 ?auto_1325538 ) ) ( not ( = ?auto_1325532 ?auto_1325539 ) ) ( not ( = ?auto_1325532 ?auto_1325540 ) ) ( not ( = ?auto_1325532 ?auto_1325541 ) ) ( not ( = ?auto_1325532 ?auto_1325542 ) ) ( not ( = ?auto_1325532 ?auto_1325543 ) ) ( not ( = ?auto_1325532 ?auto_1325544 ) ) ( not ( = ?auto_1325532 ?auto_1325545 ) ) ( not ( = ?auto_1325532 ?auto_1325550 ) ) ( not ( = ?auto_1325533 ?auto_1325535 ) ) ( not ( = ?auto_1325533 ?auto_1325534 ) ) ( not ( = ?auto_1325533 ?auto_1325536 ) ) ( not ( = ?auto_1325533 ?auto_1325537 ) ) ( not ( = ?auto_1325533 ?auto_1325538 ) ) ( not ( = ?auto_1325533 ?auto_1325539 ) ) ( not ( = ?auto_1325533 ?auto_1325540 ) ) ( not ( = ?auto_1325533 ?auto_1325541 ) ) ( not ( = ?auto_1325533 ?auto_1325542 ) ) ( not ( = ?auto_1325533 ?auto_1325543 ) ) ( not ( = ?auto_1325533 ?auto_1325544 ) ) ( not ( = ?auto_1325533 ?auto_1325545 ) ) ( not ( = ?auto_1325533 ?auto_1325550 ) ) ( not ( = ?auto_1325535 ?auto_1325534 ) ) ( not ( = ?auto_1325535 ?auto_1325536 ) ) ( not ( = ?auto_1325535 ?auto_1325537 ) ) ( not ( = ?auto_1325535 ?auto_1325538 ) ) ( not ( = ?auto_1325535 ?auto_1325539 ) ) ( not ( = ?auto_1325535 ?auto_1325540 ) ) ( not ( = ?auto_1325535 ?auto_1325541 ) ) ( not ( = ?auto_1325535 ?auto_1325542 ) ) ( not ( = ?auto_1325535 ?auto_1325543 ) ) ( not ( = ?auto_1325535 ?auto_1325544 ) ) ( not ( = ?auto_1325535 ?auto_1325545 ) ) ( not ( = ?auto_1325535 ?auto_1325550 ) ) ( not ( = ?auto_1325534 ?auto_1325536 ) ) ( not ( = ?auto_1325534 ?auto_1325537 ) ) ( not ( = ?auto_1325534 ?auto_1325538 ) ) ( not ( = ?auto_1325534 ?auto_1325539 ) ) ( not ( = ?auto_1325534 ?auto_1325540 ) ) ( not ( = ?auto_1325534 ?auto_1325541 ) ) ( not ( = ?auto_1325534 ?auto_1325542 ) ) ( not ( = ?auto_1325534 ?auto_1325543 ) ) ( not ( = ?auto_1325534 ?auto_1325544 ) ) ( not ( = ?auto_1325534 ?auto_1325545 ) ) ( not ( = ?auto_1325534 ?auto_1325550 ) ) ( not ( = ?auto_1325536 ?auto_1325537 ) ) ( not ( = ?auto_1325536 ?auto_1325538 ) ) ( not ( = ?auto_1325536 ?auto_1325539 ) ) ( not ( = ?auto_1325536 ?auto_1325540 ) ) ( not ( = ?auto_1325536 ?auto_1325541 ) ) ( not ( = ?auto_1325536 ?auto_1325542 ) ) ( not ( = ?auto_1325536 ?auto_1325543 ) ) ( not ( = ?auto_1325536 ?auto_1325544 ) ) ( not ( = ?auto_1325536 ?auto_1325545 ) ) ( not ( = ?auto_1325536 ?auto_1325550 ) ) ( not ( = ?auto_1325537 ?auto_1325538 ) ) ( not ( = ?auto_1325537 ?auto_1325539 ) ) ( not ( = ?auto_1325537 ?auto_1325540 ) ) ( not ( = ?auto_1325537 ?auto_1325541 ) ) ( not ( = ?auto_1325537 ?auto_1325542 ) ) ( not ( = ?auto_1325537 ?auto_1325543 ) ) ( not ( = ?auto_1325537 ?auto_1325544 ) ) ( not ( = ?auto_1325537 ?auto_1325545 ) ) ( not ( = ?auto_1325537 ?auto_1325550 ) ) ( not ( = ?auto_1325538 ?auto_1325539 ) ) ( not ( = ?auto_1325538 ?auto_1325540 ) ) ( not ( = ?auto_1325538 ?auto_1325541 ) ) ( not ( = ?auto_1325538 ?auto_1325542 ) ) ( not ( = ?auto_1325538 ?auto_1325543 ) ) ( not ( = ?auto_1325538 ?auto_1325544 ) ) ( not ( = ?auto_1325538 ?auto_1325545 ) ) ( not ( = ?auto_1325538 ?auto_1325550 ) ) ( not ( = ?auto_1325539 ?auto_1325540 ) ) ( not ( = ?auto_1325539 ?auto_1325541 ) ) ( not ( = ?auto_1325539 ?auto_1325542 ) ) ( not ( = ?auto_1325539 ?auto_1325543 ) ) ( not ( = ?auto_1325539 ?auto_1325544 ) ) ( not ( = ?auto_1325539 ?auto_1325545 ) ) ( not ( = ?auto_1325539 ?auto_1325550 ) ) ( not ( = ?auto_1325540 ?auto_1325541 ) ) ( not ( = ?auto_1325540 ?auto_1325542 ) ) ( not ( = ?auto_1325540 ?auto_1325543 ) ) ( not ( = ?auto_1325540 ?auto_1325544 ) ) ( not ( = ?auto_1325540 ?auto_1325545 ) ) ( not ( = ?auto_1325540 ?auto_1325550 ) ) ( not ( = ?auto_1325541 ?auto_1325542 ) ) ( not ( = ?auto_1325541 ?auto_1325543 ) ) ( not ( = ?auto_1325541 ?auto_1325544 ) ) ( not ( = ?auto_1325541 ?auto_1325545 ) ) ( not ( = ?auto_1325541 ?auto_1325550 ) ) ( not ( = ?auto_1325542 ?auto_1325543 ) ) ( not ( = ?auto_1325542 ?auto_1325544 ) ) ( not ( = ?auto_1325542 ?auto_1325545 ) ) ( not ( = ?auto_1325542 ?auto_1325550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325543 ?auto_1325544 ?auto_1325545 )
      ( MAKE-14CRATE-VERIFY ?auto_1325531 ?auto_1325532 ?auto_1325533 ?auto_1325535 ?auto_1325534 ?auto_1325536 ?auto_1325537 ?auto_1325538 ?auto_1325539 ?auto_1325540 ?auto_1325541 ?auto_1325542 ?auto_1325543 ?auto_1325544 ?auto_1325545 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1325735 - SURFACE
      ?auto_1325736 - SURFACE
      ?auto_1325737 - SURFACE
      ?auto_1325739 - SURFACE
      ?auto_1325738 - SURFACE
      ?auto_1325740 - SURFACE
      ?auto_1325741 - SURFACE
      ?auto_1325742 - SURFACE
      ?auto_1325743 - SURFACE
      ?auto_1325744 - SURFACE
      ?auto_1325745 - SURFACE
      ?auto_1325746 - SURFACE
      ?auto_1325747 - SURFACE
      ?auto_1325748 - SURFACE
      ?auto_1325749 - SURFACE
    )
    :vars
    (
      ?auto_1325750 - HOIST
      ?auto_1325754 - PLACE
      ?auto_1325752 - PLACE
      ?auto_1325751 - HOIST
      ?auto_1325753 - SURFACE
      ?auto_1325755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1325750 ?auto_1325754 ) ( IS-CRATE ?auto_1325749 ) ( not ( = ?auto_1325748 ?auto_1325749 ) ) ( not ( = ?auto_1325747 ?auto_1325748 ) ) ( not ( = ?auto_1325747 ?auto_1325749 ) ) ( not ( = ?auto_1325752 ?auto_1325754 ) ) ( HOIST-AT ?auto_1325751 ?auto_1325752 ) ( not ( = ?auto_1325750 ?auto_1325751 ) ) ( AVAILABLE ?auto_1325751 ) ( SURFACE-AT ?auto_1325749 ?auto_1325752 ) ( ON ?auto_1325749 ?auto_1325753 ) ( CLEAR ?auto_1325749 ) ( not ( = ?auto_1325748 ?auto_1325753 ) ) ( not ( = ?auto_1325749 ?auto_1325753 ) ) ( not ( = ?auto_1325747 ?auto_1325753 ) ) ( TRUCK-AT ?auto_1325755 ?auto_1325754 ) ( SURFACE-AT ?auto_1325747 ?auto_1325754 ) ( CLEAR ?auto_1325747 ) ( IS-CRATE ?auto_1325748 ) ( AVAILABLE ?auto_1325750 ) ( IN ?auto_1325748 ?auto_1325755 ) ( ON ?auto_1325736 ?auto_1325735 ) ( ON ?auto_1325737 ?auto_1325736 ) ( ON ?auto_1325739 ?auto_1325737 ) ( ON ?auto_1325738 ?auto_1325739 ) ( ON ?auto_1325740 ?auto_1325738 ) ( ON ?auto_1325741 ?auto_1325740 ) ( ON ?auto_1325742 ?auto_1325741 ) ( ON ?auto_1325743 ?auto_1325742 ) ( ON ?auto_1325744 ?auto_1325743 ) ( ON ?auto_1325745 ?auto_1325744 ) ( ON ?auto_1325746 ?auto_1325745 ) ( ON ?auto_1325747 ?auto_1325746 ) ( not ( = ?auto_1325735 ?auto_1325736 ) ) ( not ( = ?auto_1325735 ?auto_1325737 ) ) ( not ( = ?auto_1325735 ?auto_1325739 ) ) ( not ( = ?auto_1325735 ?auto_1325738 ) ) ( not ( = ?auto_1325735 ?auto_1325740 ) ) ( not ( = ?auto_1325735 ?auto_1325741 ) ) ( not ( = ?auto_1325735 ?auto_1325742 ) ) ( not ( = ?auto_1325735 ?auto_1325743 ) ) ( not ( = ?auto_1325735 ?auto_1325744 ) ) ( not ( = ?auto_1325735 ?auto_1325745 ) ) ( not ( = ?auto_1325735 ?auto_1325746 ) ) ( not ( = ?auto_1325735 ?auto_1325747 ) ) ( not ( = ?auto_1325735 ?auto_1325748 ) ) ( not ( = ?auto_1325735 ?auto_1325749 ) ) ( not ( = ?auto_1325735 ?auto_1325753 ) ) ( not ( = ?auto_1325736 ?auto_1325737 ) ) ( not ( = ?auto_1325736 ?auto_1325739 ) ) ( not ( = ?auto_1325736 ?auto_1325738 ) ) ( not ( = ?auto_1325736 ?auto_1325740 ) ) ( not ( = ?auto_1325736 ?auto_1325741 ) ) ( not ( = ?auto_1325736 ?auto_1325742 ) ) ( not ( = ?auto_1325736 ?auto_1325743 ) ) ( not ( = ?auto_1325736 ?auto_1325744 ) ) ( not ( = ?auto_1325736 ?auto_1325745 ) ) ( not ( = ?auto_1325736 ?auto_1325746 ) ) ( not ( = ?auto_1325736 ?auto_1325747 ) ) ( not ( = ?auto_1325736 ?auto_1325748 ) ) ( not ( = ?auto_1325736 ?auto_1325749 ) ) ( not ( = ?auto_1325736 ?auto_1325753 ) ) ( not ( = ?auto_1325737 ?auto_1325739 ) ) ( not ( = ?auto_1325737 ?auto_1325738 ) ) ( not ( = ?auto_1325737 ?auto_1325740 ) ) ( not ( = ?auto_1325737 ?auto_1325741 ) ) ( not ( = ?auto_1325737 ?auto_1325742 ) ) ( not ( = ?auto_1325737 ?auto_1325743 ) ) ( not ( = ?auto_1325737 ?auto_1325744 ) ) ( not ( = ?auto_1325737 ?auto_1325745 ) ) ( not ( = ?auto_1325737 ?auto_1325746 ) ) ( not ( = ?auto_1325737 ?auto_1325747 ) ) ( not ( = ?auto_1325737 ?auto_1325748 ) ) ( not ( = ?auto_1325737 ?auto_1325749 ) ) ( not ( = ?auto_1325737 ?auto_1325753 ) ) ( not ( = ?auto_1325739 ?auto_1325738 ) ) ( not ( = ?auto_1325739 ?auto_1325740 ) ) ( not ( = ?auto_1325739 ?auto_1325741 ) ) ( not ( = ?auto_1325739 ?auto_1325742 ) ) ( not ( = ?auto_1325739 ?auto_1325743 ) ) ( not ( = ?auto_1325739 ?auto_1325744 ) ) ( not ( = ?auto_1325739 ?auto_1325745 ) ) ( not ( = ?auto_1325739 ?auto_1325746 ) ) ( not ( = ?auto_1325739 ?auto_1325747 ) ) ( not ( = ?auto_1325739 ?auto_1325748 ) ) ( not ( = ?auto_1325739 ?auto_1325749 ) ) ( not ( = ?auto_1325739 ?auto_1325753 ) ) ( not ( = ?auto_1325738 ?auto_1325740 ) ) ( not ( = ?auto_1325738 ?auto_1325741 ) ) ( not ( = ?auto_1325738 ?auto_1325742 ) ) ( not ( = ?auto_1325738 ?auto_1325743 ) ) ( not ( = ?auto_1325738 ?auto_1325744 ) ) ( not ( = ?auto_1325738 ?auto_1325745 ) ) ( not ( = ?auto_1325738 ?auto_1325746 ) ) ( not ( = ?auto_1325738 ?auto_1325747 ) ) ( not ( = ?auto_1325738 ?auto_1325748 ) ) ( not ( = ?auto_1325738 ?auto_1325749 ) ) ( not ( = ?auto_1325738 ?auto_1325753 ) ) ( not ( = ?auto_1325740 ?auto_1325741 ) ) ( not ( = ?auto_1325740 ?auto_1325742 ) ) ( not ( = ?auto_1325740 ?auto_1325743 ) ) ( not ( = ?auto_1325740 ?auto_1325744 ) ) ( not ( = ?auto_1325740 ?auto_1325745 ) ) ( not ( = ?auto_1325740 ?auto_1325746 ) ) ( not ( = ?auto_1325740 ?auto_1325747 ) ) ( not ( = ?auto_1325740 ?auto_1325748 ) ) ( not ( = ?auto_1325740 ?auto_1325749 ) ) ( not ( = ?auto_1325740 ?auto_1325753 ) ) ( not ( = ?auto_1325741 ?auto_1325742 ) ) ( not ( = ?auto_1325741 ?auto_1325743 ) ) ( not ( = ?auto_1325741 ?auto_1325744 ) ) ( not ( = ?auto_1325741 ?auto_1325745 ) ) ( not ( = ?auto_1325741 ?auto_1325746 ) ) ( not ( = ?auto_1325741 ?auto_1325747 ) ) ( not ( = ?auto_1325741 ?auto_1325748 ) ) ( not ( = ?auto_1325741 ?auto_1325749 ) ) ( not ( = ?auto_1325741 ?auto_1325753 ) ) ( not ( = ?auto_1325742 ?auto_1325743 ) ) ( not ( = ?auto_1325742 ?auto_1325744 ) ) ( not ( = ?auto_1325742 ?auto_1325745 ) ) ( not ( = ?auto_1325742 ?auto_1325746 ) ) ( not ( = ?auto_1325742 ?auto_1325747 ) ) ( not ( = ?auto_1325742 ?auto_1325748 ) ) ( not ( = ?auto_1325742 ?auto_1325749 ) ) ( not ( = ?auto_1325742 ?auto_1325753 ) ) ( not ( = ?auto_1325743 ?auto_1325744 ) ) ( not ( = ?auto_1325743 ?auto_1325745 ) ) ( not ( = ?auto_1325743 ?auto_1325746 ) ) ( not ( = ?auto_1325743 ?auto_1325747 ) ) ( not ( = ?auto_1325743 ?auto_1325748 ) ) ( not ( = ?auto_1325743 ?auto_1325749 ) ) ( not ( = ?auto_1325743 ?auto_1325753 ) ) ( not ( = ?auto_1325744 ?auto_1325745 ) ) ( not ( = ?auto_1325744 ?auto_1325746 ) ) ( not ( = ?auto_1325744 ?auto_1325747 ) ) ( not ( = ?auto_1325744 ?auto_1325748 ) ) ( not ( = ?auto_1325744 ?auto_1325749 ) ) ( not ( = ?auto_1325744 ?auto_1325753 ) ) ( not ( = ?auto_1325745 ?auto_1325746 ) ) ( not ( = ?auto_1325745 ?auto_1325747 ) ) ( not ( = ?auto_1325745 ?auto_1325748 ) ) ( not ( = ?auto_1325745 ?auto_1325749 ) ) ( not ( = ?auto_1325745 ?auto_1325753 ) ) ( not ( = ?auto_1325746 ?auto_1325747 ) ) ( not ( = ?auto_1325746 ?auto_1325748 ) ) ( not ( = ?auto_1325746 ?auto_1325749 ) ) ( not ( = ?auto_1325746 ?auto_1325753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1325747 ?auto_1325748 ?auto_1325749 )
      ( MAKE-14CRATE-VERIFY ?auto_1325735 ?auto_1325736 ?auto_1325737 ?auto_1325739 ?auto_1325738 ?auto_1325740 ?auto_1325741 ?auto_1325742 ?auto_1325743 ?auto_1325744 ?auto_1325745 ?auto_1325746 ?auto_1325747 ?auto_1325748 ?auto_1325749 ) )
  )

)

