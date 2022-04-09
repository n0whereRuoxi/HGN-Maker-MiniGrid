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
      ?auto_225046 - SURFACE
      ?auto_225047 - SURFACE
    )
    :vars
    (
      ?auto_225048 - HOIST
      ?auto_225049 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225048 ?auto_225049 ) ( SURFACE-AT ?auto_225046 ?auto_225049 ) ( CLEAR ?auto_225046 ) ( LIFTING ?auto_225048 ?auto_225047 ) ( IS-CRATE ?auto_225047 ) ( not ( = ?auto_225046 ?auto_225047 ) ) )
    :subtasks
    ( ( !DROP ?auto_225048 ?auto_225047 ?auto_225046 ?auto_225049 )
      ( MAKE-1CRATE-VERIFY ?auto_225046 ?auto_225047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225050 - SURFACE
      ?auto_225051 - SURFACE
    )
    :vars
    (
      ?auto_225053 - HOIST
      ?auto_225052 - PLACE
      ?auto_225054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225053 ?auto_225052 ) ( SURFACE-AT ?auto_225050 ?auto_225052 ) ( CLEAR ?auto_225050 ) ( IS-CRATE ?auto_225051 ) ( not ( = ?auto_225050 ?auto_225051 ) ) ( TRUCK-AT ?auto_225054 ?auto_225052 ) ( AVAILABLE ?auto_225053 ) ( IN ?auto_225051 ?auto_225054 ) )
    :subtasks
    ( ( !UNLOAD ?auto_225053 ?auto_225051 ?auto_225054 ?auto_225052 )
      ( MAKE-1CRATE ?auto_225050 ?auto_225051 )
      ( MAKE-1CRATE-VERIFY ?auto_225050 ?auto_225051 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225055 - SURFACE
      ?auto_225056 - SURFACE
    )
    :vars
    (
      ?auto_225058 - HOIST
      ?auto_225059 - PLACE
      ?auto_225057 - TRUCK
      ?auto_225060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225058 ?auto_225059 ) ( SURFACE-AT ?auto_225055 ?auto_225059 ) ( CLEAR ?auto_225055 ) ( IS-CRATE ?auto_225056 ) ( not ( = ?auto_225055 ?auto_225056 ) ) ( AVAILABLE ?auto_225058 ) ( IN ?auto_225056 ?auto_225057 ) ( TRUCK-AT ?auto_225057 ?auto_225060 ) ( not ( = ?auto_225060 ?auto_225059 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_225057 ?auto_225060 ?auto_225059 )
      ( MAKE-1CRATE ?auto_225055 ?auto_225056 )
      ( MAKE-1CRATE-VERIFY ?auto_225055 ?auto_225056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225061 - SURFACE
      ?auto_225062 - SURFACE
    )
    :vars
    (
      ?auto_225065 - HOIST
      ?auto_225064 - PLACE
      ?auto_225063 - TRUCK
      ?auto_225066 - PLACE
      ?auto_225067 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225065 ?auto_225064 ) ( SURFACE-AT ?auto_225061 ?auto_225064 ) ( CLEAR ?auto_225061 ) ( IS-CRATE ?auto_225062 ) ( not ( = ?auto_225061 ?auto_225062 ) ) ( AVAILABLE ?auto_225065 ) ( TRUCK-AT ?auto_225063 ?auto_225066 ) ( not ( = ?auto_225066 ?auto_225064 ) ) ( HOIST-AT ?auto_225067 ?auto_225066 ) ( LIFTING ?auto_225067 ?auto_225062 ) ( not ( = ?auto_225065 ?auto_225067 ) ) )
    :subtasks
    ( ( !LOAD ?auto_225067 ?auto_225062 ?auto_225063 ?auto_225066 )
      ( MAKE-1CRATE ?auto_225061 ?auto_225062 )
      ( MAKE-1CRATE-VERIFY ?auto_225061 ?auto_225062 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225068 - SURFACE
      ?auto_225069 - SURFACE
    )
    :vars
    (
      ?auto_225073 - HOIST
      ?auto_225072 - PLACE
      ?auto_225071 - TRUCK
      ?auto_225070 - PLACE
      ?auto_225074 - HOIST
      ?auto_225075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225073 ?auto_225072 ) ( SURFACE-AT ?auto_225068 ?auto_225072 ) ( CLEAR ?auto_225068 ) ( IS-CRATE ?auto_225069 ) ( not ( = ?auto_225068 ?auto_225069 ) ) ( AVAILABLE ?auto_225073 ) ( TRUCK-AT ?auto_225071 ?auto_225070 ) ( not ( = ?auto_225070 ?auto_225072 ) ) ( HOIST-AT ?auto_225074 ?auto_225070 ) ( not ( = ?auto_225073 ?auto_225074 ) ) ( AVAILABLE ?auto_225074 ) ( SURFACE-AT ?auto_225069 ?auto_225070 ) ( ON ?auto_225069 ?auto_225075 ) ( CLEAR ?auto_225069 ) ( not ( = ?auto_225068 ?auto_225075 ) ) ( not ( = ?auto_225069 ?auto_225075 ) ) )
    :subtasks
    ( ( !LIFT ?auto_225074 ?auto_225069 ?auto_225075 ?auto_225070 )
      ( MAKE-1CRATE ?auto_225068 ?auto_225069 )
      ( MAKE-1CRATE-VERIFY ?auto_225068 ?auto_225069 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225076 - SURFACE
      ?auto_225077 - SURFACE
    )
    :vars
    (
      ?auto_225078 - HOIST
      ?auto_225082 - PLACE
      ?auto_225083 - PLACE
      ?auto_225080 - HOIST
      ?auto_225079 - SURFACE
      ?auto_225081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225078 ?auto_225082 ) ( SURFACE-AT ?auto_225076 ?auto_225082 ) ( CLEAR ?auto_225076 ) ( IS-CRATE ?auto_225077 ) ( not ( = ?auto_225076 ?auto_225077 ) ) ( AVAILABLE ?auto_225078 ) ( not ( = ?auto_225083 ?auto_225082 ) ) ( HOIST-AT ?auto_225080 ?auto_225083 ) ( not ( = ?auto_225078 ?auto_225080 ) ) ( AVAILABLE ?auto_225080 ) ( SURFACE-AT ?auto_225077 ?auto_225083 ) ( ON ?auto_225077 ?auto_225079 ) ( CLEAR ?auto_225077 ) ( not ( = ?auto_225076 ?auto_225079 ) ) ( not ( = ?auto_225077 ?auto_225079 ) ) ( TRUCK-AT ?auto_225081 ?auto_225082 ) )
    :subtasks
    ( ( !DRIVE ?auto_225081 ?auto_225082 ?auto_225083 )
      ( MAKE-1CRATE ?auto_225076 ?auto_225077 )
      ( MAKE-1CRATE-VERIFY ?auto_225076 ?auto_225077 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225093 - SURFACE
      ?auto_225094 - SURFACE
      ?auto_225095 - SURFACE
    )
    :vars
    (
      ?auto_225097 - HOIST
      ?auto_225096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225097 ?auto_225096 ) ( SURFACE-AT ?auto_225094 ?auto_225096 ) ( CLEAR ?auto_225094 ) ( LIFTING ?auto_225097 ?auto_225095 ) ( IS-CRATE ?auto_225095 ) ( not ( = ?auto_225094 ?auto_225095 ) ) ( ON ?auto_225094 ?auto_225093 ) ( not ( = ?auto_225093 ?auto_225094 ) ) ( not ( = ?auto_225093 ?auto_225095 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225094 ?auto_225095 )
      ( MAKE-2CRATE-VERIFY ?auto_225093 ?auto_225094 ?auto_225095 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225103 - SURFACE
      ?auto_225104 - SURFACE
      ?auto_225105 - SURFACE
    )
    :vars
    (
      ?auto_225108 - HOIST
      ?auto_225107 - PLACE
      ?auto_225106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225108 ?auto_225107 ) ( SURFACE-AT ?auto_225104 ?auto_225107 ) ( CLEAR ?auto_225104 ) ( IS-CRATE ?auto_225105 ) ( not ( = ?auto_225104 ?auto_225105 ) ) ( TRUCK-AT ?auto_225106 ?auto_225107 ) ( AVAILABLE ?auto_225108 ) ( IN ?auto_225105 ?auto_225106 ) ( ON ?auto_225104 ?auto_225103 ) ( not ( = ?auto_225103 ?auto_225104 ) ) ( not ( = ?auto_225103 ?auto_225105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225104 ?auto_225105 )
      ( MAKE-2CRATE-VERIFY ?auto_225103 ?auto_225104 ?auto_225105 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225109 - SURFACE
      ?auto_225110 - SURFACE
    )
    :vars
    (
      ?auto_225111 - HOIST
      ?auto_225113 - PLACE
      ?auto_225114 - TRUCK
      ?auto_225112 - SURFACE
      ?auto_225115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225111 ?auto_225113 ) ( SURFACE-AT ?auto_225109 ?auto_225113 ) ( CLEAR ?auto_225109 ) ( IS-CRATE ?auto_225110 ) ( not ( = ?auto_225109 ?auto_225110 ) ) ( AVAILABLE ?auto_225111 ) ( IN ?auto_225110 ?auto_225114 ) ( ON ?auto_225109 ?auto_225112 ) ( not ( = ?auto_225112 ?auto_225109 ) ) ( not ( = ?auto_225112 ?auto_225110 ) ) ( TRUCK-AT ?auto_225114 ?auto_225115 ) ( not ( = ?auto_225115 ?auto_225113 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_225114 ?auto_225115 ?auto_225113 )
      ( MAKE-2CRATE ?auto_225112 ?auto_225109 ?auto_225110 )
      ( MAKE-1CRATE-VERIFY ?auto_225109 ?auto_225110 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225116 - SURFACE
      ?auto_225117 - SURFACE
      ?auto_225118 - SURFACE
    )
    :vars
    (
      ?auto_225120 - HOIST
      ?auto_225119 - PLACE
      ?auto_225122 - TRUCK
      ?auto_225121 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225120 ?auto_225119 ) ( SURFACE-AT ?auto_225117 ?auto_225119 ) ( CLEAR ?auto_225117 ) ( IS-CRATE ?auto_225118 ) ( not ( = ?auto_225117 ?auto_225118 ) ) ( AVAILABLE ?auto_225120 ) ( IN ?auto_225118 ?auto_225122 ) ( ON ?auto_225117 ?auto_225116 ) ( not ( = ?auto_225116 ?auto_225117 ) ) ( not ( = ?auto_225116 ?auto_225118 ) ) ( TRUCK-AT ?auto_225122 ?auto_225121 ) ( not ( = ?auto_225121 ?auto_225119 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225117 ?auto_225118 )
      ( MAKE-2CRATE-VERIFY ?auto_225116 ?auto_225117 ?auto_225118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225123 - SURFACE
      ?auto_225124 - SURFACE
    )
    :vars
    (
      ?auto_225127 - HOIST
      ?auto_225129 - PLACE
      ?auto_225126 - SURFACE
      ?auto_225128 - TRUCK
      ?auto_225125 - PLACE
      ?auto_225130 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225127 ?auto_225129 ) ( SURFACE-AT ?auto_225123 ?auto_225129 ) ( CLEAR ?auto_225123 ) ( IS-CRATE ?auto_225124 ) ( not ( = ?auto_225123 ?auto_225124 ) ) ( AVAILABLE ?auto_225127 ) ( ON ?auto_225123 ?auto_225126 ) ( not ( = ?auto_225126 ?auto_225123 ) ) ( not ( = ?auto_225126 ?auto_225124 ) ) ( TRUCK-AT ?auto_225128 ?auto_225125 ) ( not ( = ?auto_225125 ?auto_225129 ) ) ( HOIST-AT ?auto_225130 ?auto_225125 ) ( LIFTING ?auto_225130 ?auto_225124 ) ( not ( = ?auto_225127 ?auto_225130 ) ) )
    :subtasks
    ( ( !LOAD ?auto_225130 ?auto_225124 ?auto_225128 ?auto_225125 )
      ( MAKE-2CRATE ?auto_225126 ?auto_225123 ?auto_225124 )
      ( MAKE-1CRATE-VERIFY ?auto_225123 ?auto_225124 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225131 - SURFACE
      ?auto_225132 - SURFACE
      ?auto_225133 - SURFACE
    )
    :vars
    (
      ?auto_225137 - HOIST
      ?auto_225134 - PLACE
      ?auto_225138 - TRUCK
      ?auto_225136 - PLACE
      ?auto_225135 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225137 ?auto_225134 ) ( SURFACE-AT ?auto_225132 ?auto_225134 ) ( CLEAR ?auto_225132 ) ( IS-CRATE ?auto_225133 ) ( not ( = ?auto_225132 ?auto_225133 ) ) ( AVAILABLE ?auto_225137 ) ( ON ?auto_225132 ?auto_225131 ) ( not ( = ?auto_225131 ?auto_225132 ) ) ( not ( = ?auto_225131 ?auto_225133 ) ) ( TRUCK-AT ?auto_225138 ?auto_225136 ) ( not ( = ?auto_225136 ?auto_225134 ) ) ( HOIST-AT ?auto_225135 ?auto_225136 ) ( LIFTING ?auto_225135 ?auto_225133 ) ( not ( = ?auto_225137 ?auto_225135 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225132 ?auto_225133 )
      ( MAKE-2CRATE-VERIFY ?auto_225131 ?auto_225132 ?auto_225133 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225139 - SURFACE
      ?auto_225140 - SURFACE
    )
    :vars
    (
      ?auto_225144 - HOIST
      ?auto_225146 - PLACE
      ?auto_225141 - SURFACE
      ?auto_225142 - TRUCK
      ?auto_225143 - PLACE
      ?auto_225145 - HOIST
      ?auto_225147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225144 ?auto_225146 ) ( SURFACE-AT ?auto_225139 ?auto_225146 ) ( CLEAR ?auto_225139 ) ( IS-CRATE ?auto_225140 ) ( not ( = ?auto_225139 ?auto_225140 ) ) ( AVAILABLE ?auto_225144 ) ( ON ?auto_225139 ?auto_225141 ) ( not ( = ?auto_225141 ?auto_225139 ) ) ( not ( = ?auto_225141 ?auto_225140 ) ) ( TRUCK-AT ?auto_225142 ?auto_225143 ) ( not ( = ?auto_225143 ?auto_225146 ) ) ( HOIST-AT ?auto_225145 ?auto_225143 ) ( not ( = ?auto_225144 ?auto_225145 ) ) ( AVAILABLE ?auto_225145 ) ( SURFACE-AT ?auto_225140 ?auto_225143 ) ( ON ?auto_225140 ?auto_225147 ) ( CLEAR ?auto_225140 ) ( not ( = ?auto_225139 ?auto_225147 ) ) ( not ( = ?auto_225140 ?auto_225147 ) ) ( not ( = ?auto_225141 ?auto_225147 ) ) )
    :subtasks
    ( ( !LIFT ?auto_225145 ?auto_225140 ?auto_225147 ?auto_225143 )
      ( MAKE-2CRATE ?auto_225141 ?auto_225139 ?auto_225140 )
      ( MAKE-1CRATE-VERIFY ?auto_225139 ?auto_225140 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225148 - SURFACE
      ?auto_225149 - SURFACE
      ?auto_225150 - SURFACE
    )
    :vars
    (
      ?auto_225154 - HOIST
      ?auto_225152 - PLACE
      ?auto_225151 - TRUCK
      ?auto_225153 - PLACE
      ?auto_225156 - HOIST
      ?auto_225155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225154 ?auto_225152 ) ( SURFACE-AT ?auto_225149 ?auto_225152 ) ( CLEAR ?auto_225149 ) ( IS-CRATE ?auto_225150 ) ( not ( = ?auto_225149 ?auto_225150 ) ) ( AVAILABLE ?auto_225154 ) ( ON ?auto_225149 ?auto_225148 ) ( not ( = ?auto_225148 ?auto_225149 ) ) ( not ( = ?auto_225148 ?auto_225150 ) ) ( TRUCK-AT ?auto_225151 ?auto_225153 ) ( not ( = ?auto_225153 ?auto_225152 ) ) ( HOIST-AT ?auto_225156 ?auto_225153 ) ( not ( = ?auto_225154 ?auto_225156 ) ) ( AVAILABLE ?auto_225156 ) ( SURFACE-AT ?auto_225150 ?auto_225153 ) ( ON ?auto_225150 ?auto_225155 ) ( CLEAR ?auto_225150 ) ( not ( = ?auto_225149 ?auto_225155 ) ) ( not ( = ?auto_225150 ?auto_225155 ) ) ( not ( = ?auto_225148 ?auto_225155 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225149 ?auto_225150 )
      ( MAKE-2CRATE-VERIFY ?auto_225148 ?auto_225149 ?auto_225150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225157 - SURFACE
      ?auto_225158 - SURFACE
    )
    :vars
    (
      ?auto_225165 - HOIST
      ?auto_225160 - PLACE
      ?auto_225163 - SURFACE
      ?auto_225161 - PLACE
      ?auto_225164 - HOIST
      ?auto_225159 - SURFACE
      ?auto_225162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225165 ?auto_225160 ) ( SURFACE-AT ?auto_225157 ?auto_225160 ) ( CLEAR ?auto_225157 ) ( IS-CRATE ?auto_225158 ) ( not ( = ?auto_225157 ?auto_225158 ) ) ( AVAILABLE ?auto_225165 ) ( ON ?auto_225157 ?auto_225163 ) ( not ( = ?auto_225163 ?auto_225157 ) ) ( not ( = ?auto_225163 ?auto_225158 ) ) ( not ( = ?auto_225161 ?auto_225160 ) ) ( HOIST-AT ?auto_225164 ?auto_225161 ) ( not ( = ?auto_225165 ?auto_225164 ) ) ( AVAILABLE ?auto_225164 ) ( SURFACE-AT ?auto_225158 ?auto_225161 ) ( ON ?auto_225158 ?auto_225159 ) ( CLEAR ?auto_225158 ) ( not ( = ?auto_225157 ?auto_225159 ) ) ( not ( = ?auto_225158 ?auto_225159 ) ) ( not ( = ?auto_225163 ?auto_225159 ) ) ( TRUCK-AT ?auto_225162 ?auto_225160 ) )
    :subtasks
    ( ( !DRIVE ?auto_225162 ?auto_225160 ?auto_225161 )
      ( MAKE-2CRATE ?auto_225163 ?auto_225157 ?auto_225158 )
      ( MAKE-1CRATE-VERIFY ?auto_225157 ?auto_225158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225166 - SURFACE
      ?auto_225167 - SURFACE
      ?auto_225168 - SURFACE
    )
    :vars
    (
      ?auto_225171 - HOIST
      ?auto_225174 - PLACE
      ?auto_225169 - PLACE
      ?auto_225172 - HOIST
      ?auto_225173 - SURFACE
      ?auto_225170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225171 ?auto_225174 ) ( SURFACE-AT ?auto_225167 ?auto_225174 ) ( CLEAR ?auto_225167 ) ( IS-CRATE ?auto_225168 ) ( not ( = ?auto_225167 ?auto_225168 ) ) ( AVAILABLE ?auto_225171 ) ( ON ?auto_225167 ?auto_225166 ) ( not ( = ?auto_225166 ?auto_225167 ) ) ( not ( = ?auto_225166 ?auto_225168 ) ) ( not ( = ?auto_225169 ?auto_225174 ) ) ( HOIST-AT ?auto_225172 ?auto_225169 ) ( not ( = ?auto_225171 ?auto_225172 ) ) ( AVAILABLE ?auto_225172 ) ( SURFACE-AT ?auto_225168 ?auto_225169 ) ( ON ?auto_225168 ?auto_225173 ) ( CLEAR ?auto_225168 ) ( not ( = ?auto_225167 ?auto_225173 ) ) ( not ( = ?auto_225168 ?auto_225173 ) ) ( not ( = ?auto_225166 ?auto_225173 ) ) ( TRUCK-AT ?auto_225170 ?auto_225174 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225167 ?auto_225168 )
      ( MAKE-2CRATE-VERIFY ?auto_225166 ?auto_225167 ?auto_225168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225175 - SURFACE
      ?auto_225176 - SURFACE
    )
    :vars
    (
      ?auto_225181 - HOIST
      ?auto_225179 - PLACE
      ?auto_225182 - SURFACE
      ?auto_225183 - PLACE
      ?auto_225178 - HOIST
      ?auto_225180 - SURFACE
      ?auto_225177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225181 ?auto_225179 ) ( IS-CRATE ?auto_225176 ) ( not ( = ?auto_225175 ?auto_225176 ) ) ( not ( = ?auto_225182 ?auto_225175 ) ) ( not ( = ?auto_225182 ?auto_225176 ) ) ( not ( = ?auto_225183 ?auto_225179 ) ) ( HOIST-AT ?auto_225178 ?auto_225183 ) ( not ( = ?auto_225181 ?auto_225178 ) ) ( AVAILABLE ?auto_225178 ) ( SURFACE-AT ?auto_225176 ?auto_225183 ) ( ON ?auto_225176 ?auto_225180 ) ( CLEAR ?auto_225176 ) ( not ( = ?auto_225175 ?auto_225180 ) ) ( not ( = ?auto_225176 ?auto_225180 ) ) ( not ( = ?auto_225182 ?auto_225180 ) ) ( TRUCK-AT ?auto_225177 ?auto_225179 ) ( SURFACE-AT ?auto_225182 ?auto_225179 ) ( CLEAR ?auto_225182 ) ( LIFTING ?auto_225181 ?auto_225175 ) ( IS-CRATE ?auto_225175 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225182 ?auto_225175 )
      ( MAKE-2CRATE ?auto_225182 ?auto_225175 ?auto_225176 )
      ( MAKE-1CRATE-VERIFY ?auto_225175 ?auto_225176 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225184 - SURFACE
      ?auto_225185 - SURFACE
      ?auto_225186 - SURFACE
    )
    :vars
    (
      ?auto_225190 - HOIST
      ?auto_225189 - PLACE
      ?auto_225192 - PLACE
      ?auto_225191 - HOIST
      ?auto_225187 - SURFACE
      ?auto_225188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225190 ?auto_225189 ) ( IS-CRATE ?auto_225186 ) ( not ( = ?auto_225185 ?auto_225186 ) ) ( not ( = ?auto_225184 ?auto_225185 ) ) ( not ( = ?auto_225184 ?auto_225186 ) ) ( not ( = ?auto_225192 ?auto_225189 ) ) ( HOIST-AT ?auto_225191 ?auto_225192 ) ( not ( = ?auto_225190 ?auto_225191 ) ) ( AVAILABLE ?auto_225191 ) ( SURFACE-AT ?auto_225186 ?auto_225192 ) ( ON ?auto_225186 ?auto_225187 ) ( CLEAR ?auto_225186 ) ( not ( = ?auto_225185 ?auto_225187 ) ) ( not ( = ?auto_225186 ?auto_225187 ) ) ( not ( = ?auto_225184 ?auto_225187 ) ) ( TRUCK-AT ?auto_225188 ?auto_225189 ) ( SURFACE-AT ?auto_225184 ?auto_225189 ) ( CLEAR ?auto_225184 ) ( LIFTING ?auto_225190 ?auto_225185 ) ( IS-CRATE ?auto_225185 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225185 ?auto_225186 )
      ( MAKE-2CRATE-VERIFY ?auto_225184 ?auto_225185 ?auto_225186 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225193 - SURFACE
      ?auto_225194 - SURFACE
    )
    :vars
    (
      ?auto_225200 - HOIST
      ?auto_225196 - PLACE
      ?auto_225198 - SURFACE
      ?auto_225201 - PLACE
      ?auto_225197 - HOIST
      ?auto_225195 - SURFACE
      ?auto_225199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225200 ?auto_225196 ) ( IS-CRATE ?auto_225194 ) ( not ( = ?auto_225193 ?auto_225194 ) ) ( not ( = ?auto_225198 ?auto_225193 ) ) ( not ( = ?auto_225198 ?auto_225194 ) ) ( not ( = ?auto_225201 ?auto_225196 ) ) ( HOIST-AT ?auto_225197 ?auto_225201 ) ( not ( = ?auto_225200 ?auto_225197 ) ) ( AVAILABLE ?auto_225197 ) ( SURFACE-AT ?auto_225194 ?auto_225201 ) ( ON ?auto_225194 ?auto_225195 ) ( CLEAR ?auto_225194 ) ( not ( = ?auto_225193 ?auto_225195 ) ) ( not ( = ?auto_225194 ?auto_225195 ) ) ( not ( = ?auto_225198 ?auto_225195 ) ) ( TRUCK-AT ?auto_225199 ?auto_225196 ) ( SURFACE-AT ?auto_225198 ?auto_225196 ) ( CLEAR ?auto_225198 ) ( IS-CRATE ?auto_225193 ) ( AVAILABLE ?auto_225200 ) ( IN ?auto_225193 ?auto_225199 ) )
    :subtasks
    ( ( !UNLOAD ?auto_225200 ?auto_225193 ?auto_225199 ?auto_225196 )
      ( MAKE-2CRATE ?auto_225198 ?auto_225193 ?auto_225194 )
      ( MAKE-1CRATE-VERIFY ?auto_225193 ?auto_225194 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225202 - SURFACE
      ?auto_225203 - SURFACE
      ?auto_225204 - SURFACE
    )
    :vars
    (
      ?auto_225209 - HOIST
      ?auto_225205 - PLACE
      ?auto_225206 - PLACE
      ?auto_225210 - HOIST
      ?auto_225207 - SURFACE
      ?auto_225208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225209 ?auto_225205 ) ( IS-CRATE ?auto_225204 ) ( not ( = ?auto_225203 ?auto_225204 ) ) ( not ( = ?auto_225202 ?auto_225203 ) ) ( not ( = ?auto_225202 ?auto_225204 ) ) ( not ( = ?auto_225206 ?auto_225205 ) ) ( HOIST-AT ?auto_225210 ?auto_225206 ) ( not ( = ?auto_225209 ?auto_225210 ) ) ( AVAILABLE ?auto_225210 ) ( SURFACE-AT ?auto_225204 ?auto_225206 ) ( ON ?auto_225204 ?auto_225207 ) ( CLEAR ?auto_225204 ) ( not ( = ?auto_225203 ?auto_225207 ) ) ( not ( = ?auto_225204 ?auto_225207 ) ) ( not ( = ?auto_225202 ?auto_225207 ) ) ( TRUCK-AT ?auto_225208 ?auto_225205 ) ( SURFACE-AT ?auto_225202 ?auto_225205 ) ( CLEAR ?auto_225202 ) ( IS-CRATE ?auto_225203 ) ( AVAILABLE ?auto_225209 ) ( IN ?auto_225203 ?auto_225208 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225203 ?auto_225204 )
      ( MAKE-2CRATE-VERIFY ?auto_225202 ?auto_225203 ?auto_225204 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225247 - SURFACE
      ?auto_225248 - SURFACE
    )
    :vars
    (
      ?auto_225250 - HOIST
      ?auto_225249 - PLACE
      ?auto_225251 - SURFACE
      ?auto_225255 - PLACE
      ?auto_225252 - HOIST
      ?auto_225254 - SURFACE
      ?auto_225253 - TRUCK
      ?auto_225256 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225250 ?auto_225249 ) ( SURFACE-AT ?auto_225247 ?auto_225249 ) ( CLEAR ?auto_225247 ) ( IS-CRATE ?auto_225248 ) ( not ( = ?auto_225247 ?auto_225248 ) ) ( AVAILABLE ?auto_225250 ) ( ON ?auto_225247 ?auto_225251 ) ( not ( = ?auto_225251 ?auto_225247 ) ) ( not ( = ?auto_225251 ?auto_225248 ) ) ( not ( = ?auto_225255 ?auto_225249 ) ) ( HOIST-AT ?auto_225252 ?auto_225255 ) ( not ( = ?auto_225250 ?auto_225252 ) ) ( AVAILABLE ?auto_225252 ) ( SURFACE-AT ?auto_225248 ?auto_225255 ) ( ON ?auto_225248 ?auto_225254 ) ( CLEAR ?auto_225248 ) ( not ( = ?auto_225247 ?auto_225254 ) ) ( not ( = ?auto_225248 ?auto_225254 ) ) ( not ( = ?auto_225251 ?auto_225254 ) ) ( TRUCK-AT ?auto_225253 ?auto_225256 ) ( not ( = ?auto_225256 ?auto_225249 ) ) ( not ( = ?auto_225255 ?auto_225256 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_225253 ?auto_225256 ?auto_225249 )
      ( MAKE-1CRATE ?auto_225247 ?auto_225248 )
      ( MAKE-1CRATE-VERIFY ?auto_225247 ?auto_225248 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225286 - SURFACE
      ?auto_225287 - SURFACE
      ?auto_225288 - SURFACE
      ?auto_225289 - SURFACE
    )
    :vars
    (
      ?auto_225291 - HOIST
      ?auto_225290 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225291 ?auto_225290 ) ( SURFACE-AT ?auto_225288 ?auto_225290 ) ( CLEAR ?auto_225288 ) ( LIFTING ?auto_225291 ?auto_225289 ) ( IS-CRATE ?auto_225289 ) ( not ( = ?auto_225288 ?auto_225289 ) ) ( ON ?auto_225287 ?auto_225286 ) ( ON ?auto_225288 ?auto_225287 ) ( not ( = ?auto_225286 ?auto_225287 ) ) ( not ( = ?auto_225286 ?auto_225288 ) ) ( not ( = ?auto_225286 ?auto_225289 ) ) ( not ( = ?auto_225287 ?auto_225288 ) ) ( not ( = ?auto_225287 ?auto_225289 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225288 ?auto_225289 )
      ( MAKE-3CRATE-VERIFY ?auto_225286 ?auto_225287 ?auto_225288 ?auto_225289 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225303 - SURFACE
      ?auto_225304 - SURFACE
      ?auto_225305 - SURFACE
      ?auto_225306 - SURFACE
    )
    :vars
    (
      ?auto_225307 - HOIST
      ?auto_225308 - PLACE
      ?auto_225309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225307 ?auto_225308 ) ( SURFACE-AT ?auto_225305 ?auto_225308 ) ( CLEAR ?auto_225305 ) ( IS-CRATE ?auto_225306 ) ( not ( = ?auto_225305 ?auto_225306 ) ) ( TRUCK-AT ?auto_225309 ?auto_225308 ) ( AVAILABLE ?auto_225307 ) ( IN ?auto_225306 ?auto_225309 ) ( ON ?auto_225305 ?auto_225304 ) ( not ( = ?auto_225304 ?auto_225305 ) ) ( not ( = ?auto_225304 ?auto_225306 ) ) ( ON ?auto_225304 ?auto_225303 ) ( not ( = ?auto_225303 ?auto_225304 ) ) ( not ( = ?auto_225303 ?auto_225305 ) ) ( not ( = ?auto_225303 ?auto_225306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225304 ?auto_225305 ?auto_225306 )
      ( MAKE-3CRATE-VERIFY ?auto_225303 ?auto_225304 ?auto_225305 ?auto_225306 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225324 - SURFACE
      ?auto_225325 - SURFACE
      ?auto_225326 - SURFACE
      ?auto_225327 - SURFACE
    )
    :vars
    (
      ?auto_225328 - HOIST
      ?auto_225330 - PLACE
      ?auto_225331 - TRUCK
      ?auto_225329 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225328 ?auto_225330 ) ( SURFACE-AT ?auto_225326 ?auto_225330 ) ( CLEAR ?auto_225326 ) ( IS-CRATE ?auto_225327 ) ( not ( = ?auto_225326 ?auto_225327 ) ) ( AVAILABLE ?auto_225328 ) ( IN ?auto_225327 ?auto_225331 ) ( ON ?auto_225326 ?auto_225325 ) ( not ( = ?auto_225325 ?auto_225326 ) ) ( not ( = ?auto_225325 ?auto_225327 ) ) ( TRUCK-AT ?auto_225331 ?auto_225329 ) ( not ( = ?auto_225329 ?auto_225330 ) ) ( ON ?auto_225325 ?auto_225324 ) ( not ( = ?auto_225324 ?auto_225325 ) ) ( not ( = ?auto_225324 ?auto_225326 ) ) ( not ( = ?auto_225324 ?auto_225327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225325 ?auto_225326 ?auto_225327 )
      ( MAKE-3CRATE-VERIFY ?auto_225324 ?auto_225325 ?auto_225326 ?auto_225327 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225348 - SURFACE
      ?auto_225349 - SURFACE
      ?auto_225350 - SURFACE
      ?auto_225351 - SURFACE
    )
    :vars
    (
      ?auto_225352 - HOIST
      ?auto_225354 - PLACE
      ?auto_225356 - TRUCK
      ?auto_225353 - PLACE
      ?auto_225355 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225352 ?auto_225354 ) ( SURFACE-AT ?auto_225350 ?auto_225354 ) ( CLEAR ?auto_225350 ) ( IS-CRATE ?auto_225351 ) ( not ( = ?auto_225350 ?auto_225351 ) ) ( AVAILABLE ?auto_225352 ) ( ON ?auto_225350 ?auto_225349 ) ( not ( = ?auto_225349 ?auto_225350 ) ) ( not ( = ?auto_225349 ?auto_225351 ) ) ( TRUCK-AT ?auto_225356 ?auto_225353 ) ( not ( = ?auto_225353 ?auto_225354 ) ) ( HOIST-AT ?auto_225355 ?auto_225353 ) ( LIFTING ?auto_225355 ?auto_225351 ) ( not ( = ?auto_225352 ?auto_225355 ) ) ( ON ?auto_225349 ?auto_225348 ) ( not ( = ?auto_225348 ?auto_225349 ) ) ( not ( = ?auto_225348 ?auto_225350 ) ) ( not ( = ?auto_225348 ?auto_225351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225349 ?auto_225350 ?auto_225351 )
      ( MAKE-3CRATE-VERIFY ?auto_225348 ?auto_225349 ?auto_225350 ?auto_225351 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225375 - SURFACE
      ?auto_225376 - SURFACE
      ?auto_225377 - SURFACE
      ?auto_225378 - SURFACE
    )
    :vars
    (
      ?auto_225380 - HOIST
      ?auto_225382 - PLACE
      ?auto_225383 - TRUCK
      ?auto_225379 - PLACE
      ?auto_225381 - HOIST
      ?auto_225384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225380 ?auto_225382 ) ( SURFACE-AT ?auto_225377 ?auto_225382 ) ( CLEAR ?auto_225377 ) ( IS-CRATE ?auto_225378 ) ( not ( = ?auto_225377 ?auto_225378 ) ) ( AVAILABLE ?auto_225380 ) ( ON ?auto_225377 ?auto_225376 ) ( not ( = ?auto_225376 ?auto_225377 ) ) ( not ( = ?auto_225376 ?auto_225378 ) ) ( TRUCK-AT ?auto_225383 ?auto_225379 ) ( not ( = ?auto_225379 ?auto_225382 ) ) ( HOIST-AT ?auto_225381 ?auto_225379 ) ( not ( = ?auto_225380 ?auto_225381 ) ) ( AVAILABLE ?auto_225381 ) ( SURFACE-AT ?auto_225378 ?auto_225379 ) ( ON ?auto_225378 ?auto_225384 ) ( CLEAR ?auto_225378 ) ( not ( = ?auto_225377 ?auto_225384 ) ) ( not ( = ?auto_225378 ?auto_225384 ) ) ( not ( = ?auto_225376 ?auto_225384 ) ) ( ON ?auto_225376 ?auto_225375 ) ( not ( = ?auto_225375 ?auto_225376 ) ) ( not ( = ?auto_225375 ?auto_225377 ) ) ( not ( = ?auto_225375 ?auto_225378 ) ) ( not ( = ?auto_225375 ?auto_225384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225376 ?auto_225377 ?auto_225378 )
      ( MAKE-3CRATE-VERIFY ?auto_225375 ?auto_225376 ?auto_225377 ?auto_225378 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225403 - SURFACE
      ?auto_225404 - SURFACE
      ?auto_225405 - SURFACE
      ?auto_225406 - SURFACE
    )
    :vars
    (
      ?auto_225408 - HOIST
      ?auto_225411 - PLACE
      ?auto_225412 - PLACE
      ?auto_225410 - HOIST
      ?auto_225407 - SURFACE
      ?auto_225409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225408 ?auto_225411 ) ( SURFACE-AT ?auto_225405 ?auto_225411 ) ( CLEAR ?auto_225405 ) ( IS-CRATE ?auto_225406 ) ( not ( = ?auto_225405 ?auto_225406 ) ) ( AVAILABLE ?auto_225408 ) ( ON ?auto_225405 ?auto_225404 ) ( not ( = ?auto_225404 ?auto_225405 ) ) ( not ( = ?auto_225404 ?auto_225406 ) ) ( not ( = ?auto_225412 ?auto_225411 ) ) ( HOIST-AT ?auto_225410 ?auto_225412 ) ( not ( = ?auto_225408 ?auto_225410 ) ) ( AVAILABLE ?auto_225410 ) ( SURFACE-AT ?auto_225406 ?auto_225412 ) ( ON ?auto_225406 ?auto_225407 ) ( CLEAR ?auto_225406 ) ( not ( = ?auto_225405 ?auto_225407 ) ) ( not ( = ?auto_225406 ?auto_225407 ) ) ( not ( = ?auto_225404 ?auto_225407 ) ) ( TRUCK-AT ?auto_225409 ?auto_225411 ) ( ON ?auto_225404 ?auto_225403 ) ( not ( = ?auto_225403 ?auto_225404 ) ) ( not ( = ?auto_225403 ?auto_225405 ) ) ( not ( = ?auto_225403 ?auto_225406 ) ) ( not ( = ?auto_225403 ?auto_225407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225404 ?auto_225405 ?auto_225406 )
      ( MAKE-3CRATE-VERIFY ?auto_225403 ?auto_225404 ?auto_225405 ?auto_225406 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225431 - SURFACE
      ?auto_225432 - SURFACE
      ?auto_225433 - SURFACE
      ?auto_225434 - SURFACE
    )
    :vars
    (
      ?auto_225435 - HOIST
      ?auto_225436 - PLACE
      ?auto_225438 - PLACE
      ?auto_225437 - HOIST
      ?auto_225439 - SURFACE
      ?auto_225440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225435 ?auto_225436 ) ( IS-CRATE ?auto_225434 ) ( not ( = ?auto_225433 ?auto_225434 ) ) ( not ( = ?auto_225432 ?auto_225433 ) ) ( not ( = ?auto_225432 ?auto_225434 ) ) ( not ( = ?auto_225438 ?auto_225436 ) ) ( HOIST-AT ?auto_225437 ?auto_225438 ) ( not ( = ?auto_225435 ?auto_225437 ) ) ( AVAILABLE ?auto_225437 ) ( SURFACE-AT ?auto_225434 ?auto_225438 ) ( ON ?auto_225434 ?auto_225439 ) ( CLEAR ?auto_225434 ) ( not ( = ?auto_225433 ?auto_225439 ) ) ( not ( = ?auto_225434 ?auto_225439 ) ) ( not ( = ?auto_225432 ?auto_225439 ) ) ( TRUCK-AT ?auto_225440 ?auto_225436 ) ( SURFACE-AT ?auto_225432 ?auto_225436 ) ( CLEAR ?auto_225432 ) ( LIFTING ?auto_225435 ?auto_225433 ) ( IS-CRATE ?auto_225433 ) ( ON ?auto_225432 ?auto_225431 ) ( not ( = ?auto_225431 ?auto_225432 ) ) ( not ( = ?auto_225431 ?auto_225433 ) ) ( not ( = ?auto_225431 ?auto_225434 ) ) ( not ( = ?auto_225431 ?auto_225439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225432 ?auto_225433 ?auto_225434 )
      ( MAKE-3CRATE-VERIFY ?auto_225431 ?auto_225432 ?auto_225433 ?auto_225434 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225459 - SURFACE
      ?auto_225460 - SURFACE
      ?auto_225461 - SURFACE
      ?auto_225462 - SURFACE
    )
    :vars
    (
      ?auto_225467 - HOIST
      ?auto_225464 - PLACE
      ?auto_225463 - PLACE
      ?auto_225466 - HOIST
      ?auto_225468 - SURFACE
      ?auto_225465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225467 ?auto_225464 ) ( IS-CRATE ?auto_225462 ) ( not ( = ?auto_225461 ?auto_225462 ) ) ( not ( = ?auto_225460 ?auto_225461 ) ) ( not ( = ?auto_225460 ?auto_225462 ) ) ( not ( = ?auto_225463 ?auto_225464 ) ) ( HOIST-AT ?auto_225466 ?auto_225463 ) ( not ( = ?auto_225467 ?auto_225466 ) ) ( AVAILABLE ?auto_225466 ) ( SURFACE-AT ?auto_225462 ?auto_225463 ) ( ON ?auto_225462 ?auto_225468 ) ( CLEAR ?auto_225462 ) ( not ( = ?auto_225461 ?auto_225468 ) ) ( not ( = ?auto_225462 ?auto_225468 ) ) ( not ( = ?auto_225460 ?auto_225468 ) ) ( TRUCK-AT ?auto_225465 ?auto_225464 ) ( SURFACE-AT ?auto_225460 ?auto_225464 ) ( CLEAR ?auto_225460 ) ( IS-CRATE ?auto_225461 ) ( AVAILABLE ?auto_225467 ) ( IN ?auto_225461 ?auto_225465 ) ( ON ?auto_225460 ?auto_225459 ) ( not ( = ?auto_225459 ?auto_225460 ) ) ( not ( = ?auto_225459 ?auto_225461 ) ) ( not ( = ?auto_225459 ?auto_225462 ) ) ( not ( = ?auto_225459 ?auto_225468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225460 ?auto_225461 ?auto_225462 )
      ( MAKE-3CRATE-VERIFY ?auto_225459 ?auto_225460 ?auto_225461 ?auto_225462 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225469 - SURFACE
      ?auto_225470 - SURFACE
    )
    :vars
    (
      ?auto_225475 - HOIST
      ?auto_225472 - PLACE
      ?auto_225477 - SURFACE
      ?auto_225471 - PLACE
      ?auto_225474 - HOIST
      ?auto_225476 - SURFACE
      ?auto_225473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225475 ?auto_225472 ) ( IS-CRATE ?auto_225470 ) ( not ( = ?auto_225469 ?auto_225470 ) ) ( not ( = ?auto_225477 ?auto_225469 ) ) ( not ( = ?auto_225477 ?auto_225470 ) ) ( not ( = ?auto_225471 ?auto_225472 ) ) ( HOIST-AT ?auto_225474 ?auto_225471 ) ( not ( = ?auto_225475 ?auto_225474 ) ) ( AVAILABLE ?auto_225474 ) ( SURFACE-AT ?auto_225470 ?auto_225471 ) ( ON ?auto_225470 ?auto_225476 ) ( CLEAR ?auto_225470 ) ( not ( = ?auto_225469 ?auto_225476 ) ) ( not ( = ?auto_225470 ?auto_225476 ) ) ( not ( = ?auto_225477 ?auto_225476 ) ) ( SURFACE-AT ?auto_225477 ?auto_225472 ) ( CLEAR ?auto_225477 ) ( IS-CRATE ?auto_225469 ) ( AVAILABLE ?auto_225475 ) ( IN ?auto_225469 ?auto_225473 ) ( TRUCK-AT ?auto_225473 ?auto_225471 ) )
    :subtasks
    ( ( !DRIVE ?auto_225473 ?auto_225471 ?auto_225472 )
      ( MAKE-2CRATE ?auto_225477 ?auto_225469 ?auto_225470 )
      ( MAKE-1CRATE-VERIFY ?auto_225469 ?auto_225470 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225478 - SURFACE
      ?auto_225479 - SURFACE
      ?auto_225480 - SURFACE
    )
    :vars
    (
      ?auto_225481 - HOIST
      ?auto_225484 - PLACE
      ?auto_225485 - PLACE
      ?auto_225482 - HOIST
      ?auto_225486 - SURFACE
      ?auto_225483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225481 ?auto_225484 ) ( IS-CRATE ?auto_225480 ) ( not ( = ?auto_225479 ?auto_225480 ) ) ( not ( = ?auto_225478 ?auto_225479 ) ) ( not ( = ?auto_225478 ?auto_225480 ) ) ( not ( = ?auto_225485 ?auto_225484 ) ) ( HOIST-AT ?auto_225482 ?auto_225485 ) ( not ( = ?auto_225481 ?auto_225482 ) ) ( AVAILABLE ?auto_225482 ) ( SURFACE-AT ?auto_225480 ?auto_225485 ) ( ON ?auto_225480 ?auto_225486 ) ( CLEAR ?auto_225480 ) ( not ( = ?auto_225479 ?auto_225486 ) ) ( not ( = ?auto_225480 ?auto_225486 ) ) ( not ( = ?auto_225478 ?auto_225486 ) ) ( SURFACE-AT ?auto_225478 ?auto_225484 ) ( CLEAR ?auto_225478 ) ( IS-CRATE ?auto_225479 ) ( AVAILABLE ?auto_225481 ) ( IN ?auto_225479 ?auto_225483 ) ( TRUCK-AT ?auto_225483 ?auto_225485 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225479 ?auto_225480 )
      ( MAKE-2CRATE-VERIFY ?auto_225478 ?auto_225479 ?auto_225480 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225487 - SURFACE
      ?auto_225488 - SURFACE
      ?auto_225489 - SURFACE
      ?auto_225490 - SURFACE
    )
    :vars
    (
      ?auto_225496 - HOIST
      ?auto_225491 - PLACE
      ?auto_225492 - PLACE
      ?auto_225495 - HOIST
      ?auto_225494 - SURFACE
      ?auto_225493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225496 ?auto_225491 ) ( IS-CRATE ?auto_225490 ) ( not ( = ?auto_225489 ?auto_225490 ) ) ( not ( = ?auto_225488 ?auto_225489 ) ) ( not ( = ?auto_225488 ?auto_225490 ) ) ( not ( = ?auto_225492 ?auto_225491 ) ) ( HOIST-AT ?auto_225495 ?auto_225492 ) ( not ( = ?auto_225496 ?auto_225495 ) ) ( AVAILABLE ?auto_225495 ) ( SURFACE-AT ?auto_225490 ?auto_225492 ) ( ON ?auto_225490 ?auto_225494 ) ( CLEAR ?auto_225490 ) ( not ( = ?auto_225489 ?auto_225494 ) ) ( not ( = ?auto_225490 ?auto_225494 ) ) ( not ( = ?auto_225488 ?auto_225494 ) ) ( SURFACE-AT ?auto_225488 ?auto_225491 ) ( CLEAR ?auto_225488 ) ( IS-CRATE ?auto_225489 ) ( AVAILABLE ?auto_225496 ) ( IN ?auto_225489 ?auto_225493 ) ( TRUCK-AT ?auto_225493 ?auto_225492 ) ( ON ?auto_225488 ?auto_225487 ) ( not ( = ?auto_225487 ?auto_225488 ) ) ( not ( = ?auto_225487 ?auto_225489 ) ) ( not ( = ?auto_225487 ?auto_225490 ) ) ( not ( = ?auto_225487 ?auto_225494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225488 ?auto_225489 ?auto_225490 )
      ( MAKE-3CRATE-VERIFY ?auto_225487 ?auto_225488 ?auto_225489 ?auto_225490 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225497 - SURFACE
      ?auto_225498 - SURFACE
    )
    :vars
    (
      ?auto_225505 - HOIST
      ?auto_225499 - PLACE
      ?auto_225504 - SURFACE
      ?auto_225500 - PLACE
      ?auto_225503 - HOIST
      ?auto_225502 - SURFACE
      ?auto_225501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225505 ?auto_225499 ) ( IS-CRATE ?auto_225498 ) ( not ( = ?auto_225497 ?auto_225498 ) ) ( not ( = ?auto_225504 ?auto_225497 ) ) ( not ( = ?auto_225504 ?auto_225498 ) ) ( not ( = ?auto_225500 ?auto_225499 ) ) ( HOIST-AT ?auto_225503 ?auto_225500 ) ( not ( = ?auto_225505 ?auto_225503 ) ) ( SURFACE-AT ?auto_225498 ?auto_225500 ) ( ON ?auto_225498 ?auto_225502 ) ( CLEAR ?auto_225498 ) ( not ( = ?auto_225497 ?auto_225502 ) ) ( not ( = ?auto_225498 ?auto_225502 ) ) ( not ( = ?auto_225504 ?auto_225502 ) ) ( SURFACE-AT ?auto_225504 ?auto_225499 ) ( CLEAR ?auto_225504 ) ( IS-CRATE ?auto_225497 ) ( AVAILABLE ?auto_225505 ) ( TRUCK-AT ?auto_225501 ?auto_225500 ) ( LIFTING ?auto_225503 ?auto_225497 ) )
    :subtasks
    ( ( !LOAD ?auto_225503 ?auto_225497 ?auto_225501 ?auto_225500 )
      ( MAKE-2CRATE ?auto_225504 ?auto_225497 ?auto_225498 )
      ( MAKE-1CRATE-VERIFY ?auto_225497 ?auto_225498 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225506 - SURFACE
      ?auto_225507 - SURFACE
      ?auto_225508 - SURFACE
    )
    :vars
    (
      ?auto_225513 - HOIST
      ?auto_225511 - PLACE
      ?auto_225512 - PLACE
      ?auto_225509 - HOIST
      ?auto_225514 - SURFACE
      ?auto_225510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225513 ?auto_225511 ) ( IS-CRATE ?auto_225508 ) ( not ( = ?auto_225507 ?auto_225508 ) ) ( not ( = ?auto_225506 ?auto_225507 ) ) ( not ( = ?auto_225506 ?auto_225508 ) ) ( not ( = ?auto_225512 ?auto_225511 ) ) ( HOIST-AT ?auto_225509 ?auto_225512 ) ( not ( = ?auto_225513 ?auto_225509 ) ) ( SURFACE-AT ?auto_225508 ?auto_225512 ) ( ON ?auto_225508 ?auto_225514 ) ( CLEAR ?auto_225508 ) ( not ( = ?auto_225507 ?auto_225514 ) ) ( not ( = ?auto_225508 ?auto_225514 ) ) ( not ( = ?auto_225506 ?auto_225514 ) ) ( SURFACE-AT ?auto_225506 ?auto_225511 ) ( CLEAR ?auto_225506 ) ( IS-CRATE ?auto_225507 ) ( AVAILABLE ?auto_225513 ) ( TRUCK-AT ?auto_225510 ?auto_225512 ) ( LIFTING ?auto_225509 ?auto_225507 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225507 ?auto_225508 )
      ( MAKE-2CRATE-VERIFY ?auto_225506 ?auto_225507 ?auto_225508 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225515 - SURFACE
      ?auto_225516 - SURFACE
      ?auto_225517 - SURFACE
      ?auto_225518 - SURFACE
    )
    :vars
    (
      ?auto_225523 - HOIST
      ?auto_225524 - PLACE
      ?auto_225522 - PLACE
      ?auto_225521 - HOIST
      ?auto_225519 - SURFACE
      ?auto_225520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225523 ?auto_225524 ) ( IS-CRATE ?auto_225518 ) ( not ( = ?auto_225517 ?auto_225518 ) ) ( not ( = ?auto_225516 ?auto_225517 ) ) ( not ( = ?auto_225516 ?auto_225518 ) ) ( not ( = ?auto_225522 ?auto_225524 ) ) ( HOIST-AT ?auto_225521 ?auto_225522 ) ( not ( = ?auto_225523 ?auto_225521 ) ) ( SURFACE-AT ?auto_225518 ?auto_225522 ) ( ON ?auto_225518 ?auto_225519 ) ( CLEAR ?auto_225518 ) ( not ( = ?auto_225517 ?auto_225519 ) ) ( not ( = ?auto_225518 ?auto_225519 ) ) ( not ( = ?auto_225516 ?auto_225519 ) ) ( SURFACE-AT ?auto_225516 ?auto_225524 ) ( CLEAR ?auto_225516 ) ( IS-CRATE ?auto_225517 ) ( AVAILABLE ?auto_225523 ) ( TRUCK-AT ?auto_225520 ?auto_225522 ) ( LIFTING ?auto_225521 ?auto_225517 ) ( ON ?auto_225516 ?auto_225515 ) ( not ( = ?auto_225515 ?auto_225516 ) ) ( not ( = ?auto_225515 ?auto_225517 ) ) ( not ( = ?auto_225515 ?auto_225518 ) ) ( not ( = ?auto_225515 ?auto_225519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225516 ?auto_225517 ?auto_225518 )
      ( MAKE-3CRATE-VERIFY ?auto_225515 ?auto_225516 ?auto_225517 ?auto_225518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225525 - SURFACE
      ?auto_225526 - SURFACE
    )
    :vars
    (
      ?auto_225532 - HOIST
      ?auto_225533 - PLACE
      ?auto_225527 - SURFACE
      ?auto_225531 - PLACE
      ?auto_225530 - HOIST
      ?auto_225528 - SURFACE
      ?auto_225529 - TRUCK
      ?auto_225534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225532 ?auto_225533 ) ( IS-CRATE ?auto_225526 ) ( not ( = ?auto_225525 ?auto_225526 ) ) ( not ( = ?auto_225527 ?auto_225525 ) ) ( not ( = ?auto_225527 ?auto_225526 ) ) ( not ( = ?auto_225531 ?auto_225533 ) ) ( HOIST-AT ?auto_225530 ?auto_225531 ) ( not ( = ?auto_225532 ?auto_225530 ) ) ( SURFACE-AT ?auto_225526 ?auto_225531 ) ( ON ?auto_225526 ?auto_225528 ) ( CLEAR ?auto_225526 ) ( not ( = ?auto_225525 ?auto_225528 ) ) ( not ( = ?auto_225526 ?auto_225528 ) ) ( not ( = ?auto_225527 ?auto_225528 ) ) ( SURFACE-AT ?auto_225527 ?auto_225533 ) ( CLEAR ?auto_225527 ) ( IS-CRATE ?auto_225525 ) ( AVAILABLE ?auto_225532 ) ( TRUCK-AT ?auto_225529 ?auto_225531 ) ( AVAILABLE ?auto_225530 ) ( SURFACE-AT ?auto_225525 ?auto_225531 ) ( ON ?auto_225525 ?auto_225534 ) ( CLEAR ?auto_225525 ) ( not ( = ?auto_225525 ?auto_225534 ) ) ( not ( = ?auto_225526 ?auto_225534 ) ) ( not ( = ?auto_225527 ?auto_225534 ) ) ( not ( = ?auto_225528 ?auto_225534 ) ) )
    :subtasks
    ( ( !LIFT ?auto_225530 ?auto_225525 ?auto_225534 ?auto_225531 )
      ( MAKE-2CRATE ?auto_225527 ?auto_225525 ?auto_225526 )
      ( MAKE-1CRATE-VERIFY ?auto_225525 ?auto_225526 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225535 - SURFACE
      ?auto_225536 - SURFACE
      ?auto_225537 - SURFACE
    )
    :vars
    (
      ?auto_225538 - HOIST
      ?auto_225541 - PLACE
      ?auto_225543 - PLACE
      ?auto_225544 - HOIST
      ?auto_225542 - SURFACE
      ?auto_225540 - TRUCK
      ?auto_225539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225538 ?auto_225541 ) ( IS-CRATE ?auto_225537 ) ( not ( = ?auto_225536 ?auto_225537 ) ) ( not ( = ?auto_225535 ?auto_225536 ) ) ( not ( = ?auto_225535 ?auto_225537 ) ) ( not ( = ?auto_225543 ?auto_225541 ) ) ( HOIST-AT ?auto_225544 ?auto_225543 ) ( not ( = ?auto_225538 ?auto_225544 ) ) ( SURFACE-AT ?auto_225537 ?auto_225543 ) ( ON ?auto_225537 ?auto_225542 ) ( CLEAR ?auto_225537 ) ( not ( = ?auto_225536 ?auto_225542 ) ) ( not ( = ?auto_225537 ?auto_225542 ) ) ( not ( = ?auto_225535 ?auto_225542 ) ) ( SURFACE-AT ?auto_225535 ?auto_225541 ) ( CLEAR ?auto_225535 ) ( IS-CRATE ?auto_225536 ) ( AVAILABLE ?auto_225538 ) ( TRUCK-AT ?auto_225540 ?auto_225543 ) ( AVAILABLE ?auto_225544 ) ( SURFACE-AT ?auto_225536 ?auto_225543 ) ( ON ?auto_225536 ?auto_225539 ) ( CLEAR ?auto_225536 ) ( not ( = ?auto_225536 ?auto_225539 ) ) ( not ( = ?auto_225537 ?auto_225539 ) ) ( not ( = ?auto_225535 ?auto_225539 ) ) ( not ( = ?auto_225542 ?auto_225539 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225536 ?auto_225537 )
      ( MAKE-2CRATE-VERIFY ?auto_225535 ?auto_225536 ?auto_225537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225545 - SURFACE
      ?auto_225546 - SURFACE
      ?auto_225547 - SURFACE
      ?auto_225548 - SURFACE
    )
    :vars
    (
      ?auto_225554 - HOIST
      ?auto_225555 - PLACE
      ?auto_225553 - PLACE
      ?auto_225549 - HOIST
      ?auto_225550 - SURFACE
      ?auto_225552 - TRUCK
      ?auto_225551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225554 ?auto_225555 ) ( IS-CRATE ?auto_225548 ) ( not ( = ?auto_225547 ?auto_225548 ) ) ( not ( = ?auto_225546 ?auto_225547 ) ) ( not ( = ?auto_225546 ?auto_225548 ) ) ( not ( = ?auto_225553 ?auto_225555 ) ) ( HOIST-AT ?auto_225549 ?auto_225553 ) ( not ( = ?auto_225554 ?auto_225549 ) ) ( SURFACE-AT ?auto_225548 ?auto_225553 ) ( ON ?auto_225548 ?auto_225550 ) ( CLEAR ?auto_225548 ) ( not ( = ?auto_225547 ?auto_225550 ) ) ( not ( = ?auto_225548 ?auto_225550 ) ) ( not ( = ?auto_225546 ?auto_225550 ) ) ( SURFACE-AT ?auto_225546 ?auto_225555 ) ( CLEAR ?auto_225546 ) ( IS-CRATE ?auto_225547 ) ( AVAILABLE ?auto_225554 ) ( TRUCK-AT ?auto_225552 ?auto_225553 ) ( AVAILABLE ?auto_225549 ) ( SURFACE-AT ?auto_225547 ?auto_225553 ) ( ON ?auto_225547 ?auto_225551 ) ( CLEAR ?auto_225547 ) ( not ( = ?auto_225547 ?auto_225551 ) ) ( not ( = ?auto_225548 ?auto_225551 ) ) ( not ( = ?auto_225546 ?auto_225551 ) ) ( not ( = ?auto_225550 ?auto_225551 ) ) ( ON ?auto_225546 ?auto_225545 ) ( not ( = ?auto_225545 ?auto_225546 ) ) ( not ( = ?auto_225545 ?auto_225547 ) ) ( not ( = ?auto_225545 ?auto_225548 ) ) ( not ( = ?auto_225545 ?auto_225550 ) ) ( not ( = ?auto_225545 ?auto_225551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225546 ?auto_225547 ?auto_225548 )
      ( MAKE-3CRATE-VERIFY ?auto_225545 ?auto_225546 ?auto_225547 ?auto_225548 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225556 - SURFACE
      ?auto_225557 - SURFACE
    )
    :vars
    (
      ?auto_225564 - HOIST
      ?auto_225565 - PLACE
      ?auto_225558 - SURFACE
      ?auto_225563 - PLACE
      ?auto_225559 - HOIST
      ?auto_225560 - SURFACE
      ?auto_225561 - SURFACE
      ?auto_225562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225564 ?auto_225565 ) ( IS-CRATE ?auto_225557 ) ( not ( = ?auto_225556 ?auto_225557 ) ) ( not ( = ?auto_225558 ?auto_225556 ) ) ( not ( = ?auto_225558 ?auto_225557 ) ) ( not ( = ?auto_225563 ?auto_225565 ) ) ( HOIST-AT ?auto_225559 ?auto_225563 ) ( not ( = ?auto_225564 ?auto_225559 ) ) ( SURFACE-AT ?auto_225557 ?auto_225563 ) ( ON ?auto_225557 ?auto_225560 ) ( CLEAR ?auto_225557 ) ( not ( = ?auto_225556 ?auto_225560 ) ) ( not ( = ?auto_225557 ?auto_225560 ) ) ( not ( = ?auto_225558 ?auto_225560 ) ) ( SURFACE-AT ?auto_225558 ?auto_225565 ) ( CLEAR ?auto_225558 ) ( IS-CRATE ?auto_225556 ) ( AVAILABLE ?auto_225564 ) ( AVAILABLE ?auto_225559 ) ( SURFACE-AT ?auto_225556 ?auto_225563 ) ( ON ?auto_225556 ?auto_225561 ) ( CLEAR ?auto_225556 ) ( not ( = ?auto_225556 ?auto_225561 ) ) ( not ( = ?auto_225557 ?auto_225561 ) ) ( not ( = ?auto_225558 ?auto_225561 ) ) ( not ( = ?auto_225560 ?auto_225561 ) ) ( TRUCK-AT ?auto_225562 ?auto_225565 ) )
    :subtasks
    ( ( !DRIVE ?auto_225562 ?auto_225565 ?auto_225563 )
      ( MAKE-2CRATE ?auto_225558 ?auto_225556 ?auto_225557 )
      ( MAKE-1CRATE-VERIFY ?auto_225556 ?auto_225557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225566 - SURFACE
      ?auto_225567 - SURFACE
      ?auto_225568 - SURFACE
    )
    :vars
    (
      ?auto_225570 - HOIST
      ?auto_225571 - PLACE
      ?auto_225575 - PLACE
      ?auto_225572 - HOIST
      ?auto_225573 - SURFACE
      ?auto_225569 - SURFACE
      ?auto_225574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225570 ?auto_225571 ) ( IS-CRATE ?auto_225568 ) ( not ( = ?auto_225567 ?auto_225568 ) ) ( not ( = ?auto_225566 ?auto_225567 ) ) ( not ( = ?auto_225566 ?auto_225568 ) ) ( not ( = ?auto_225575 ?auto_225571 ) ) ( HOIST-AT ?auto_225572 ?auto_225575 ) ( not ( = ?auto_225570 ?auto_225572 ) ) ( SURFACE-AT ?auto_225568 ?auto_225575 ) ( ON ?auto_225568 ?auto_225573 ) ( CLEAR ?auto_225568 ) ( not ( = ?auto_225567 ?auto_225573 ) ) ( not ( = ?auto_225568 ?auto_225573 ) ) ( not ( = ?auto_225566 ?auto_225573 ) ) ( SURFACE-AT ?auto_225566 ?auto_225571 ) ( CLEAR ?auto_225566 ) ( IS-CRATE ?auto_225567 ) ( AVAILABLE ?auto_225570 ) ( AVAILABLE ?auto_225572 ) ( SURFACE-AT ?auto_225567 ?auto_225575 ) ( ON ?auto_225567 ?auto_225569 ) ( CLEAR ?auto_225567 ) ( not ( = ?auto_225567 ?auto_225569 ) ) ( not ( = ?auto_225568 ?auto_225569 ) ) ( not ( = ?auto_225566 ?auto_225569 ) ) ( not ( = ?auto_225573 ?auto_225569 ) ) ( TRUCK-AT ?auto_225574 ?auto_225571 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225567 ?auto_225568 )
      ( MAKE-2CRATE-VERIFY ?auto_225566 ?auto_225567 ?auto_225568 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225576 - SURFACE
      ?auto_225577 - SURFACE
      ?auto_225578 - SURFACE
      ?auto_225579 - SURFACE
    )
    :vars
    (
      ?auto_225586 - HOIST
      ?auto_225581 - PLACE
      ?auto_225583 - PLACE
      ?auto_225582 - HOIST
      ?auto_225584 - SURFACE
      ?auto_225585 - SURFACE
      ?auto_225580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225586 ?auto_225581 ) ( IS-CRATE ?auto_225579 ) ( not ( = ?auto_225578 ?auto_225579 ) ) ( not ( = ?auto_225577 ?auto_225578 ) ) ( not ( = ?auto_225577 ?auto_225579 ) ) ( not ( = ?auto_225583 ?auto_225581 ) ) ( HOIST-AT ?auto_225582 ?auto_225583 ) ( not ( = ?auto_225586 ?auto_225582 ) ) ( SURFACE-AT ?auto_225579 ?auto_225583 ) ( ON ?auto_225579 ?auto_225584 ) ( CLEAR ?auto_225579 ) ( not ( = ?auto_225578 ?auto_225584 ) ) ( not ( = ?auto_225579 ?auto_225584 ) ) ( not ( = ?auto_225577 ?auto_225584 ) ) ( SURFACE-AT ?auto_225577 ?auto_225581 ) ( CLEAR ?auto_225577 ) ( IS-CRATE ?auto_225578 ) ( AVAILABLE ?auto_225586 ) ( AVAILABLE ?auto_225582 ) ( SURFACE-AT ?auto_225578 ?auto_225583 ) ( ON ?auto_225578 ?auto_225585 ) ( CLEAR ?auto_225578 ) ( not ( = ?auto_225578 ?auto_225585 ) ) ( not ( = ?auto_225579 ?auto_225585 ) ) ( not ( = ?auto_225577 ?auto_225585 ) ) ( not ( = ?auto_225584 ?auto_225585 ) ) ( TRUCK-AT ?auto_225580 ?auto_225581 ) ( ON ?auto_225577 ?auto_225576 ) ( not ( = ?auto_225576 ?auto_225577 ) ) ( not ( = ?auto_225576 ?auto_225578 ) ) ( not ( = ?auto_225576 ?auto_225579 ) ) ( not ( = ?auto_225576 ?auto_225584 ) ) ( not ( = ?auto_225576 ?auto_225585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225577 ?auto_225578 ?auto_225579 )
      ( MAKE-3CRATE-VERIFY ?auto_225576 ?auto_225577 ?auto_225578 ?auto_225579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225587 - SURFACE
      ?auto_225588 - SURFACE
    )
    :vars
    (
      ?auto_225596 - HOIST
      ?auto_225591 - PLACE
      ?auto_225589 - SURFACE
      ?auto_225593 - PLACE
      ?auto_225592 - HOIST
      ?auto_225594 - SURFACE
      ?auto_225595 - SURFACE
      ?auto_225590 - TRUCK
      ?auto_225597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225596 ?auto_225591 ) ( IS-CRATE ?auto_225588 ) ( not ( = ?auto_225587 ?auto_225588 ) ) ( not ( = ?auto_225589 ?auto_225587 ) ) ( not ( = ?auto_225589 ?auto_225588 ) ) ( not ( = ?auto_225593 ?auto_225591 ) ) ( HOIST-AT ?auto_225592 ?auto_225593 ) ( not ( = ?auto_225596 ?auto_225592 ) ) ( SURFACE-AT ?auto_225588 ?auto_225593 ) ( ON ?auto_225588 ?auto_225594 ) ( CLEAR ?auto_225588 ) ( not ( = ?auto_225587 ?auto_225594 ) ) ( not ( = ?auto_225588 ?auto_225594 ) ) ( not ( = ?auto_225589 ?auto_225594 ) ) ( IS-CRATE ?auto_225587 ) ( AVAILABLE ?auto_225592 ) ( SURFACE-AT ?auto_225587 ?auto_225593 ) ( ON ?auto_225587 ?auto_225595 ) ( CLEAR ?auto_225587 ) ( not ( = ?auto_225587 ?auto_225595 ) ) ( not ( = ?auto_225588 ?auto_225595 ) ) ( not ( = ?auto_225589 ?auto_225595 ) ) ( not ( = ?auto_225594 ?auto_225595 ) ) ( TRUCK-AT ?auto_225590 ?auto_225591 ) ( SURFACE-AT ?auto_225597 ?auto_225591 ) ( CLEAR ?auto_225597 ) ( LIFTING ?auto_225596 ?auto_225589 ) ( IS-CRATE ?auto_225589 ) ( not ( = ?auto_225597 ?auto_225589 ) ) ( not ( = ?auto_225587 ?auto_225597 ) ) ( not ( = ?auto_225588 ?auto_225597 ) ) ( not ( = ?auto_225594 ?auto_225597 ) ) ( not ( = ?auto_225595 ?auto_225597 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225597 ?auto_225589 )
      ( MAKE-2CRATE ?auto_225589 ?auto_225587 ?auto_225588 )
      ( MAKE-1CRATE-VERIFY ?auto_225587 ?auto_225588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225598 - SURFACE
      ?auto_225599 - SURFACE
      ?auto_225600 - SURFACE
    )
    :vars
    (
      ?auto_225604 - HOIST
      ?auto_225608 - PLACE
      ?auto_225601 - PLACE
      ?auto_225603 - HOIST
      ?auto_225607 - SURFACE
      ?auto_225605 - SURFACE
      ?auto_225602 - TRUCK
      ?auto_225606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225604 ?auto_225608 ) ( IS-CRATE ?auto_225600 ) ( not ( = ?auto_225599 ?auto_225600 ) ) ( not ( = ?auto_225598 ?auto_225599 ) ) ( not ( = ?auto_225598 ?auto_225600 ) ) ( not ( = ?auto_225601 ?auto_225608 ) ) ( HOIST-AT ?auto_225603 ?auto_225601 ) ( not ( = ?auto_225604 ?auto_225603 ) ) ( SURFACE-AT ?auto_225600 ?auto_225601 ) ( ON ?auto_225600 ?auto_225607 ) ( CLEAR ?auto_225600 ) ( not ( = ?auto_225599 ?auto_225607 ) ) ( not ( = ?auto_225600 ?auto_225607 ) ) ( not ( = ?auto_225598 ?auto_225607 ) ) ( IS-CRATE ?auto_225599 ) ( AVAILABLE ?auto_225603 ) ( SURFACE-AT ?auto_225599 ?auto_225601 ) ( ON ?auto_225599 ?auto_225605 ) ( CLEAR ?auto_225599 ) ( not ( = ?auto_225599 ?auto_225605 ) ) ( not ( = ?auto_225600 ?auto_225605 ) ) ( not ( = ?auto_225598 ?auto_225605 ) ) ( not ( = ?auto_225607 ?auto_225605 ) ) ( TRUCK-AT ?auto_225602 ?auto_225608 ) ( SURFACE-AT ?auto_225606 ?auto_225608 ) ( CLEAR ?auto_225606 ) ( LIFTING ?auto_225604 ?auto_225598 ) ( IS-CRATE ?auto_225598 ) ( not ( = ?auto_225606 ?auto_225598 ) ) ( not ( = ?auto_225599 ?auto_225606 ) ) ( not ( = ?auto_225600 ?auto_225606 ) ) ( not ( = ?auto_225607 ?auto_225606 ) ) ( not ( = ?auto_225605 ?auto_225606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225599 ?auto_225600 )
      ( MAKE-2CRATE-VERIFY ?auto_225598 ?auto_225599 ?auto_225600 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225609 - SURFACE
      ?auto_225610 - SURFACE
      ?auto_225611 - SURFACE
      ?auto_225612 - SURFACE
    )
    :vars
    (
      ?auto_225616 - HOIST
      ?auto_225614 - PLACE
      ?auto_225617 - PLACE
      ?auto_225615 - HOIST
      ?auto_225619 - SURFACE
      ?auto_225618 - SURFACE
      ?auto_225613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225616 ?auto_225614 ) ( IS-CRATE ?auto_225612 ) ( not ( = ?auto_225611 ?auto_225612 ) ) ( not ( = ?auto_225610 ?auto_225611 ) ) ( not ( = ?auto_225610 ?auto_225612 ) ) ( not ( = ?auto_225617 ?auto_225614 ) ) ( HOIST-AT ?auto_225615 ?auto_225617 ) ( not ( = ?auto_225616 ?auto_225615 ) ) ( SURFACE-AT ?auto_225612 ?auto_225617 ) ( ON ?auto_225612 ?auto_225619 ) ( CLEAR ?auto_225612 ) ( not ( = ?auto_225611 ?auto_225619 ) ) ( not ( = ?auto_225612 ?auto_225619 ) ) ( not ( = ?auto_225610 ?auto_225619 ) ) ( IS-CRATE ?auto_225611 ) ( AVAILABLE ?auto_225615 ) ( SURFACE-AT ?auto_225611 ?auto_225617 ) ( ON ?auto_225611 ?auto_225618 ) ( CLEAR ?auto_225611 ) ( not ( = ?auto_225611 ?auto_225618 ) ) ( not ( = ?auto_225612 ?auto_225618 ) ) ( not ( = ?auto_225610 ?auto_225618 ) ) ( not ( = ?auto_225619 ?auto_225618 ) ) ( TRUCK-AT ?auto_225613 ?auto_225614 ) ( SURFACE-AT ?auto_225609 ?auto_225614 ) ( CLEAR ?auto_225609 ) ( LIFTING ?auto_225616 ?auto_225610 ) ( IS-CRATE ?auto_225610 ) ( not ( = ?auto_225609 ?auto_225610 ) ) ( not ( = ?auto_225611 ?auto_225609 ) ) ( not ( = ?auto_225612 ?auto_225609 ) ) ( not ( = ?auto_225619 ?auto_225609 ) ) ( not ( = ?auto_225618 ?auto_225609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225610 ?auto_225611 ?auto_225612 )
      ( MAKE-3CRATE-VERIFY ?auto_225609 ?auto_225610 ?auto_225611 ?auto_225612 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225755 - SURFACE
      ?auto_225756 - SURFACE
      ?auto_225757 - SURFACE
      ?auto_225759 - SURFACE
      ?auto_225758 - SURFACE
    )
    :vars
    (
      ?auto_225761 - HOIST
      ?auto_225760 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225761 ?auto_225760 ) ( SURFACE-AT ?auto_225759 ?auto_225760 ) ( CLEAR ?auto_225759 ) ( LIFTING ?auto_225761 ?auto_225758 ) ( IS-CRATE ?auto_225758 ) ( not ( = ?auto_225759 ?auto_225758 ) ) ( ON ?auto_225756 ?auto_225755 ) ( ON ?auto_225757 ?auto_225756 ) ( ON ?auto_225759 ?auto_225757 ) ( not ( = ?auto_225755 ?auto_225756 ) ) ( not ( = ?auto_225755 ?auto_225757 ) ) ( not ( = ?auto_225755 ?auto_225759 ) ) ( not ( = ?auto_225755 ?auto_225758 ) ) ( not ( = ?auto_225756 ?auto_225757 ) ) ( not ( = ?auto_225756 ?auto_225759 ) ) ( not ( = ?auto_225756 ?auto_225758 ) ) ( not ( = ?auto_225757 ?auto_225759 ) ) ( not ( = ?auto_225757 ?auto_225758 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225759 ?auto_225758 )
      ( MAKE-4CRATE-VERIFY ?auto_225755 ?auto_225756 ?auto_225757 ?auto_225759 ?auto_225758 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225780 - SURFACE
      ?auto_225781 - SURFACE
      ?auto_225782 - SURFACE
      ?auto_225784 - SURFACE
      ?auto_225783 - SURFACE
    )
    :vars
    (
      ?auto_225786 - HOIST
      ?auto_225785 - PLACE
      ?auto_225787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225786 ?auto_225785 ) ( SURFACE-AT ?auto_225784 ?auto_225785 ) ( CLEAR ?auto_225784 ) ( IS-CRATE ?auto_225783 ) ( not ( = ?auto_225784 ?auto_225783 ) ) ( TRUCK-AT ?auto_225787 ?auto_225785 ) ( AVAILABLE ?auto_225786 ) ( IN ?auto_225783 ?auto_225787 ) ( ON ?auto_225784 ?auto_225782 ) ( not ( = ?auto_225782 ?auto_225784 ) ) ( not ( = ?auto_225782 ?auto_225783 ) ) ( ON ?auto_225781 ?auto_225780 ) ( ON ?auto_225782 ?auto_225781 ) ( not ( = ?auto_225780 ?auto_225781 ) ) ( not ( = ?auto_225780 ?auto_225782 ) ) ( not ( = ?auto_225780 ?auto_225784 ) ) ( not ( = ?auto_225780 ?auto_225783 ) ) ( not ( = ?auto_225781 ?auto_225782 ) ) ( not ( = ?auto_225781 ?auto_225784 ) ) ( not ( = ?auto_225781 ?auto_225783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225782 ?auto_225784 ?auto_225783 )
      ( MAKE-4CRATE-VERIFY ?auto_225780 ?auto_225781 ?auto_225782 ?auto_225784 ?auto_225783 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225810 - SURFACE
      ?auto_225811 - SURFACE
      ?auto_225812 - SURFACE
      ?auto_225814 - SURFACE
      ?auto_225813 - SURFACE
    )
    :vars
    (
      ?auto_225817 - HOIST
      ?auto_225816 - PLACE
      ?auto_225815 - TRUCK
      ?auto_225818 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225817 ?auto_225816 ) ( SURFACE-AT ?auto_225814 ?auto_225816 ) ( CLEAR ?auto_225814 ) ( IS-CRATE ?auto_225813 ) ( not ( = ?auto_225814 ?auto_225813 ) ) ( AVAILABLE ?auto_225817 ) ( IN ?auto_225813 ?auto_225815 ) ( ON ?auto_225814 ?auto_225812 ) ( not ( = ?auto_225812 ?auto_225814 ) ) ( not ( = ?auto_225812 ?auto_225813 ) ) ( TRUCK-AT ?auto_225815 ?auto_225818 ) ( not ( = ?auto_225818 ?auto_225816 ) ) ( ON ?auto_225811 ?auto_225810 ) ( ON ?auto_225812 ?auto_225811 ) ( not ( = ?auto_225810 ?auto_225811 ) ) ( not ( = ?auto_225810 ?auto_225812 ) ) ( not ( = ?auto_225810 ?auto_225814 ) ) ( not ( = ?auto_225810 ?auto_225813 ) ) ( not ( = ?auto_225811 ?auto_225812 ) ) ( not ( = ?auto_225811 ?auto_225814 ) ) ( not ( = ?auto_225811 ?auto_225813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225812 ?auto_225814 ?auto_225813 )
      ( MAKE-4CRATE-VERIFY ?auto_225810 ?auto_225811 ?auto_225812 ?auto_225814 ?auto_225813 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225844 - SURFACE
      ?auto_225845 - SURFACE
      ?auto_225846 - SURFACE
      ?auto_225848 - SURFACE
      ?auto_225847 - SURFACE
    )
    :vars
    (
      ?auto_225852 - HOIST
      ?auto_225853 - PLACE
      ?auto_225850 - TRUCK
      ?auto_225851 - PLACE
      ?auto_225849 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225852 ?auto_225853 ) ( SURFACE-AT ?auto_225848 ?auto_225853 ) ( CLEAR ?auto_225848 ) ( IS-CRATE ?auto_225847 ) ( not ( = ?auto_225848 ?auto_225847 ) ) ( AVAILABLE ?auto_225852 ) ( ON ?auto_225848 ?auto_225846 ) ( not ( = ?auto_225846 ?auto_225848 ) ) ( not ( = ?auto_225846 ?auto_225847 ) ) ( TRUCK-AT ?auto_225850 ?auto_225851 ) ( not ( = ?auto_225851 ?auto_225853 ) ) ( HOIST-AT ?auto_225849 ?auto_225851 ) ( LIFTING ?auto_225849 ?auto_225847 ) ( not ( = ?auto_225852 ?auto_225849 ) ) ( ON ?auto_225845 ?auto_225844 ) ( ON ?auto_225846 ?auto_225845 ) ( not ( = ?auto_225844 ?auto_225845 ) ) ( not ( = ?auto_225844 ?auto_225846 ) ) ( not ( = ?auto_225844 ?auto_225848 ) ) ( not ( = ?auto_225844 ?auto_225847 ) ) ( not ( = ?auto_225845 ?auto_225846 ) ) ( not ( = ?auto_225845 ?auto_225848 ) ) ( not ( = ?auto_225845 ?auto_225847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225846 ?auto_225848 ?auto_225847 )
      ( MAKE-4CRATE-VERIFY ?auto_225844 ?auto_225845 ?auto_225846 ?auto_225848 ?auto_225847 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225882 - SURFACE
      ?auto_225883 - SURFACE
      ?auto_225884 - SURFACE
      ?auto_225886 - SURFACE
      ?auto_225885 - SURFACE
    )
    :vars
    (
      ?auto_225890 - HOIST
      ?auto_225891 - PLACE
      ?auto_225889 - TRUCK
      ?auto_225887 - PLACE
      ?auto_225892 - HOIST
      ?auto_225888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225890 ?auto_225891 ) ( SURFACE-AT ?auto_225886 ?auto_225891 ) ( CLEAR ?auto_225886 ) ( IS-CRATE ?auto_225885 ) ( not ( = ?auto_225886 ?auto_225885 ) ) ( AVAILABLE ?auto_225890 ) ( ON ?auto_225886 ?auto_225884 ) ( not ( = ?auto_225884 ?auto_225886 ) ) ( not ( = ?auto_225884 ?auto_225885 ) ) ( TRUCK-AT ?auto_225889 ?auto_225887 ) ( not ( = ?auto_225887 ?auto_225891 ) ) ( HOIST-AT ?auto_225892 ?auto_225887 ) ( not ( = ?auto_225890 ?auto_225892 ) ) ( AVAILABLE ?auto_225892 ) ( SURFACE-AT ?auto_225885 ?auto_225887 ) ( ON ?auto_225885 ?auto_225888 ) ( CLEAR ?auto_225885 ) ( not ( = ?auto_225886 ?auto_225888 ) ) ( not ( = ?auto_225885 ?auto_225888 ) ) ( not ( = ?auto_225884 ?auto_225888 ) ) ( ON ?auto_225883 ?auto_225882 ) ( ON ?auto_225884 ?auto_225883 ) ( not ( = ?auto_225882 ?auto_225883 ) ) ( not ( = ?auto_225882 ?auto_225884 ) ) ( not ( = ?auto_225882 ?auto_225886 ) ) ( not ( = ?auto_225882 ?auto_225885 ) ) ( not ( = ?auto_225882 ?auto_225888 ) ) ( not ( = ?auto_225883 ?auto_225884 ) ) ( not ( = ?auto_225883 ?auto_225886 ) ) ( not ( = ?auto_225883 ?auto_225885 ) ) ( not ( = ?auto_225883 ?auto_225888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225884 ?auto_225886 ?auto_225885 )
      ( MAKE-4CRATE-VERIFY ?auto_225882 ?auto_225883 ?auto_225884 ?auto_225886 ?auto_225885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225921 - SURFACE
      ?auto_225922 - SURFACE
      ?auto_225923 - SURFACE
      ?auto_225925 - SURFACE
      ?auto_225924 - SURFACE
    )
    :vars
    (
      ?auto_225926 - HOIST
      ?auto_225928 - PLACE
      ?auto_225931 - PLACE
      ?auto_225930 - HOIST
      ?auto_225929 - SURFACE
      ?auto_225927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225926 ?auto_225928 ) ( SURFACE-AT ?auto_225925 ?auto_225928 ) ( CLEAR ?auto_225925 ) ( IS-CRATE ?auto_225924 ) ( not ( = ?auto_225925 ?auto_225924 ) ) ( AVAILABLE ?auto_225926 ) ( ON ?auto_225925 ?auto_225923 ) ( not ( = ?auto_225923 ?auto_225925 ) ) ( not ( = ?auto_225923 ?auto_225924 ) ) ( not ( = ?auto_225931 ?auto_225928 ) ) ( HOIST-AT ?auto_225930 ?auto_225931 ) ( not ( = ?auto_225926 ?auto_225930 ) ) ( AVAILABLE ?auto_225930 ) ( SURFACE-AT ?auto_225924 ?auto_225931 ) ( ON ?auto_225924 ?auto_225929 ) ( CLEAR ?auto_225924 ) ( not ( = ?auto_225925 ?auto_225929 ) ) ( not ( = ?auto_225924 ?auto_225929 ) ) ( not ( = ?auto_225923 ?auto_225929 ) ) ( TRUCK-AT ?auto_225927 ?auto_225928 ) ( ON ?auto_225922 ?auto_225921 ) ( ON ?auto_225923 ?auto_225922 ) ( not ( = ?auto_225921 ?auto_225922 ) ) ( not ( = ?auto_225921 ?auto_225923 ) ) ( not ( = ?auto_225921 ?auto_225925 ) ) ( not ( = ?auto_225921 ?auto_225924 ) ) ( not ( = ?auto_225921 ?auto_225929 ) ) ( not ( = ?auto_225922 ?auto_225923 ) ) ( not ( = ?auto_225922 ?auto_225925 ) ) ( not ( = ?auto_225922 ?auto_225924 ) ) ( not ( = ?auto_225922 ?auto_225929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225923 ?auto_225925 ?auto_225924 )
      ( MAKE-4CRATE-VERIFY ?auto_225921 ?auto_225922 ?auto_225923 ?auto_225925 ?auto_225924 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225960 - SURFACE
      ?auto_225961 - SURFACE
      ?auto_225962 - SURFACE
      ?auto_225964 - SURFACE
      ?auto_225963 - SURFACE
    )
    :vars
    (
      ?auto_225966 - HOIST
      ?auto_225968 - PLACE
      ?auto_225970 - PLACE
      ?auto_225969 - HOIST
      ?auto_225965 - SURFACE
      ?auto_225967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225966 ?auto_225968 ) ( IS-CRATE ?auto_225963 ) ( not ( = ?auto_225964 ?auto_225963 ) ) ( not ( = ?auto_225962 ?auto_225964 ) ) ( not ( = ?auto_225962 ?auto_225963 ) ) ( not ( = ?auto_225970 ?auto_225968 ) ) ( HOIST-AT ?auto_225969 ?auto_225970 ) ( not ( = ?auto_225966 ?auto_225969 ) ) ( AVAILABLE ?auto_225969 ) ( SURFACE-AT ?auto_225963 ?auto_225970 ) ( ON ?auto_225963 ?auto_225965 ) ( CLEAR ?auto_225963 ) ( not ( = ?auto_225964 ?auto_225965 ) ) ( not ( = ?auto_225963 ?auto_225965 ) ) ( not ( = ?auto_225962 ?auto_225965 ) ) ( TRUCK-AT ?auto_225967 ?auto_225968 ) ( SURFACE-AT ?auto_225962 ?auto_225968 ) ( CLEAR ?auto_225962 ) ( LIFTING ?auto_225966 ?auto_225964 ) ( IS-CRATE ?auto_225964 ) ( ON ?auto_225961 ?auto_225960 ) ( ON ?auto_225962 ?auto_225961 ) ( not ( = ?auto_225960 ?auto_225961 ) ) ( not ( = ?auto_225960 ?auto_225962 ) ) ( not ( = ?auto_225960 ?auto_225964 ) ) ( not ( = ?auto_225960 ?auto_225963 ) ) ( not ( = ?auto_225960 ?auto_225965 ) ) ( not ( = ?auto_225961 ?auto_225962 ) ) ( not ( = ?auto_225961 ?auto_225964 ) ) ( not ( = ?auto_225961 ?auto_225963 ) ) ( not ( = ?auto_225961 ?auto_225965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225962 ?auto_225964 ?auto_225963 )
      ( MAKE-4CRATE-VERIFY ?auto_225960 ?auto_225961 ?auto_225962 ?auto_225964 ?auto_225963 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225999 - SURFACE
      ?auto_226000 - SURFACE
      ?auto_226001 - SURFACE
      ?auto_226003 - SURFACE
      ?auto_226002 - SURFACE
    )
    :vars
    (
      ?auto_226008 - HOIST
      ?auto_226006 - PLACE
      ?auto_226009 - PLACE
      ?auto_226007 - HOIST
      ?auto_226005 - SURFACE
      ?auto_226004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226008 ?auto_226006 ) ( IS-CRATE ?auto_226002 ) ( not ( = ?auto_226003 ?auto_226002 ) ) ( not ( = ?auto_226001 ?auto_226003 ) ) ( not ( = ?auto_226001 ?auto_226002 ) ) ( not ( = ?auto_226009 ?auto_226006 ) ) ( HOIST-AT ?auto_226007 ?auto_226009 ) ( not ( = ?auto_226008 ?auto_226007 ) ) ( AVAILABLE ?auto_226007 ) ( SURFACE-AT ?auto_226002 ?auto_226009 ) ( ON ?auto_226002 ?auto_226005 ) ( CLEAR ?auto_226002 ) ( not ( = ?auto_226003 ?auto_226005 ) ) ( not ( = ?auto_226002 ?auto_226005 ) ) ( not ( = ?auto_226001 ?auto_226005 ) ) ( TRUCK-AT ?auto_226004 ?auto_226006 ) ( SURFACE-AT ?auto_226001 ?auto_226006 ) ( CLEAR ?auto_226001 ) ( IS-CRATE ?auto_226003 ) ( AVAILABLE ?auto_226008 ) ( IN ?auto_226003 ?auto_226004 ) ( ON ?auto_226000 ?auto_225999 ) ( ON ?auto_226001 ?auto_226000 ) ( not ( = ?auto_225999 ?auto_226000 ) ) ( not ( = ?auto_225999 ?auto_226001 ) ) ( not ( = ?auto_225999 ?auto_226003 ) ) ( not ( = ?auto_225999 ?auto_226002 ) ) ( not ( = ?auto_225999 ?auto_226005 ) ) ( not ( = ?auto_226000 ?auto_226001 ) ) ( not ( = ?auto_226000 ?auto_226003 ) ) ( not ( = ?auto_226000 ?auto_226002 ) ) ( not ( = ?auto_226000 ?auto_226005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226001 ?auto_226003 ?auto_226002 )
      ( MAKE-4CRATE-VERIFY ?auto_225999 ?auto_226000 ?auto_226001 ?auto_226003 ?auto_226002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226272 - SURFACE
      ?auto_226273 - SURFACE
    )
    :vars
    (
      ?auto_226275 - HOIST
      ?auto_226279 - PLACE
      ?auto_226277 - SURFACE
      ?auto_226280 - PLACE
      ?auto_226278 - HOIST
      ?auto_226274 - SURFACE
      ?auto_226276 - TRUCK
      ?auto_226281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226275 ?auto_226279 ) ( SURFACE-AT ?auto_226272 ?auto_226279 ) ( CLEAR ?auto_226272 ) ( IS-CRATE ?auto_226273 ) ( not ( = ?auto_226272 ?auto_226273 ) ) ( ON ?auto_226272 ?auto_226277 ) ( not ( = ?auto_226277 ?auto_226272 ) ) ( not ( = ?auto_226277 ?auto_226273 ) ) ( not ( = ?auto_226280 ?auto_226279 ) ) ( HOIST-AT ?auto_226278 ?auto_226280 ) ( not ( = ?auto_226275 ?auto_226278 ) ) ( AVAILABLE ?auto_226278 ) ( SURFACE-AT ?auto_226273 ?auto_226280 ) ( ON ?auto_226273 ?auto_226274 ) ( CLEAR ?auto_226273 ) ( not ( = ?auto_226272 ?auto_226274 ) ) ( not ( = ?auto_226273 ?auto_226274 ) ) ( not ( = ?auto_226277 ?auto_226274 ) ) ( TRUCK-AT ?auto_226276 ?auto_226279 ) ( LIFTING ?auto_226275 ?auto_226281 ) ( IS-CRATE ?auto_226281 ) ( not ( = ?auto_226272 ?auto_226281 ) ) ( not ( = ?auto_226273 ?auto_226281 ) ) ( not ( = ?auto_226277 ?auto_226281 ) ) ( not ( = ?auto_226274 ?auto_226281 ) ) )
    :subtasks
    ( ( !LOAD ?auto_226275 ?auto_226281 ?auto_226276 ?auto_226279 )
      ( MAKE-1CRATE ?auto_226272 ?auto_226273 )
      ( MAKE-1CRATE-VERIFY ?auto_226272 ?auto_226273 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226658 - SURFACE
      ?auto_226659 - SURFACE
      ?auto_226660 - SURFACE
      ?auto_226662 - SURFACE
      ?auto_226661 - SURFACE
      ?auto_226663 - SURFACE
    )
    :vars
    (
      ?auto_226664 - HOIST
      ?auto_226665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226664 ?auto_226665 ) ( SURFACE-AT ?auto_226661 ?auto_226665 ) ( CLEAR ?auto_226661 ) ( LIFTING ?auto_226664 ?auto_226663 ) ( IS-CRATE ?auto_226663 ) ( not ( = ?auto_226661 ?auto_226663 ) ) ( ON ?auto_226659 ?auto_226658 ) ( ON ?auto_226660 ?auto_226659 ) ( ON ?auto_226662 ?auto_226660 ) ( ON ?auto_226661 ?auto_226662 ) ( not ( = ?auto_226658 ?auto_226659 ) ) ( not ( = ?auto_226658 ?auto_226660 ) ) ( not ( = ?auto_226658 ?auto_226662 ) ) ( not ( = ?auto_226658 ?auto_226661 ) ) ( not ( = ?auto_226658 ?auto_226663 ) ) ( not ( = ?auto_226659 ?auto_226660 ) ) ( not ( = ?auto_226659 ?auto_226662 ) ) ( not ( = ?auto_226659 ?auto_226661 ) ) ( not ( = ?auto_226659 ?auto_226663 ) ) ( not ( = ?auto_226660 ?auto_226662 ) ) ( not ( = ?auto_226660 ?auto_226661 ) ) ( not ( = ?auto_226660 ?auto_226663 ) ) ( not ( = ?auto_226662 ?auto_226661 ) ) ( not ( = ?auto_226662 ?auto_226663 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226661 ?auto_226663 )
      ( MAKE-5CRATE-VERIFY ?auto_226658 ?auto_226659 ?auto_226660 ?auto_226662 ?auto_226661 ?auto_226663 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226692 - SURFACE
      ?auto_226693 - SURFACE
      ?auto_226694 - SURFACE
      ?auto_226696 - SURFACE
      ?auto_226695 - SURFACE
      ?auto_226697 - SURFACE
    )
    :vars
    (
      ?auto_226699 - HOIST
      ?auto_226700 - PLACE
      ?auto_226698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226699 ?auto_226700 ) ( SURFACE-AT ?auto_226695 ?auto_226700 ) ( CLEAR ?auto_226695 ) ( IS-CRATE ?auto_226697 ) ( not ( = ?auto_226695 ?auto_226697 ) ) ( TRUCK-AT ?auto_226698 ?auto_226700 ) ( AVAILABLE ?auto_226699 ) ( IN ?auto_226697 ?auto_226698 ) ( ON ?auto_226695 ?auto_226696 ) ( not ( = ?auto_226696 ?auto_226695 ) ) ( not ( = ?auto_226696 ?auto_226697 ) ) ( ON ?auto_226693 ?auto_226692 ) ( ON ?auto_226694 ?auto_226693 ) ( ON ?auto_226696 ?auto_226694 ) ( not ( = ?auto_226692 ?auto_226693 ) ) ( not ( = ?auto_226692 ?auto_226694 ) ) ( not ( = ?auto_226692 ?auto_226696 ) ) ( not ( = ?auto_226692 ?auto_226695 ) ) ( not ( = ?auto_226692 ?auto_226697 ) ) ( not ( = ?auto_226693 ?auto_226694 ) ) ( not ( = ?auto_226693 ?auto_226696 ) ) ( not ( = ?auto_226693 ?auto_226695 ) ) ( not ( = ?auto_226693 ?auto_226697 ) ) ( not ( = ?auto_226694 ?auto_226696 ) ) ( not ( = ?auto_226694 ?auto_226695 ) ) ( not ( = ?auto_226694 ?auto_226697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226696 ?auto_226695 ?auto_226697 )
      ( MAKE-5CRATE-VERIFY ?auto_226692 ?auto_226693 ?auto_226694 ?auto_226696 ?auto_226695 ?auto_226697 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226732 - SURFACE
      ?auto_226733 - SURFACE
      ?auto_226734 - SURFACE
      ?auto_226736 - SURFACE
      ?auto_226735 - SURFACE
      ?auto_226737 - SURFACE
    )
    :vars
    (
      ?auto_226741 - HOIST
      ?auto_226738 - PLACE
      ?auto_226740 - TRUCK
      ?auto_226739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226741 ?auto_226738 ) ( SURFACE-AT ?auto_226735 ?auto_226738 ) ( CLEAR ?auto_226735 ) ( IS-CRATE ?auto_226737 ) ( not ( = ?auto_226735 ?auto_226737 ) ) ( AVAILABLE ?auto_226741 ) ( IN ?auto_226737 ?auto_226740 ) ( ON ?auto_226735 ?auto_226736 ) ( not ( = ?auto_226736 ?auto_226735 ) ) ( not ( = ?auto_226736 ?auto_226737 ) ) ( TRUCK-AT ?auto_226740 ?auto_226739 ) ( not ( = ?auto_226739 ?auto_226738 ) ) ( ON ?auto_226733 ?auto_226732 ) ( ON ?auto_226734 ?auto_226733 ) ( ON ?auto_226736 ?auto_226734 ) ( not ( = ?auto_226732 ?auto_226733 ) ) ( not ( = ?auto_226732 ?auto_226734 ) ) ( not ( = ?auto_226732 ?auto_226736 ) ) ( not ( = ?auto_226732 ?auto_226735 ) ) ( not ( = ?auto_226732 ?auto_226737 ) ) ( not ( = ?auto_226733 ?auto_226734 ) ) ( not ( = ?auto_226733 ?auto_226736 ) ) ( not ( = ?auto_226733 ?auto_226735 ) ) ( not ( = ?auto_226733 ?auto_226737 ) ) ( not ( = ?auto_226734 ?auto_226736 ) ) ( not ( = ?auto_226734 ?auto_226735 ) ) ( not ( = ?auto_226734 ?auto_226737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226736 ?auto_226735 ?auto_226737 )
      ( MAKE-5CRATE-VERIFY ?auto_226732 ?auto_226733 ?auto_226734 ?auto_226736 ?auto_226735 ?auto_226737 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226777 - SURFACE
      ?auto_226778 - SURFACE
      ?auto_226779 - SURFACE
      ?auto_226781 - SURFACE
      ?auto_226780 - SURFACE
      ?auto_226782 - SURFACE
    )
    :vars
    (
      ?auto_226785 - HOIST
      ?auto_226787 - PLACE
      ?auto_226784 - TRUCK
      ?auto_226786 - PLACE
      ?auto_226783 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_226785 ?auto_226787 ) ( SURFACE-AT ?auto_226780 ?auto_226787 ) ( CLEAR ?auto_226780 ) ( IS-CRATE ?auto_226782 ) ( not ( = ?auto_226780 ?auto_226782 ) ) ( AVAILABLE ?auto_226785 ) ( ON ?auto_226780 ?auto_226781 ) ( not ( = ?auto_226781 ?auto_226780 ) ) ( not ( = ?auto_226781 ?auto_226782 ) ) ( TRUCK-AT ?auto_226784 ?auto_226786 ) ( not ( = ?auto_226786 ?auto_226787 ) ) ( HOIST-AT ?auto_226783 ?auto_226786 ) ( LIFTING ?auto_226783 ?auto_226782 ) ( not ( = ?auto_226785 ?auto_226783 ) ) ( ON ?auto_226778 ?auto_226777 ) ( ON ?auto_226779 ?auto_226778 ) ( ON ?auto_226781 ?auto_226779 ) ( not ( = ?auto_226777 ?auto_226778 ) ) ( not ( = ?auto_226777 ?auto_226779 ) ) ( not ( = ?auto_226777 ?auto_226781 ) ) ( not ( = ?auto_226777 ?auto_226780 ) ) ( not ( = ?auto_226777 ?auto_226782 ) ) ( not ( = ?auto_226778 ?auto_226779 ) ) ( not ( = ?auto_226778 ?auto_226781 ) ) ( not ( = ?auto_226778 ?auto_226780 ) ) ( not ( = ?auto_226778 ?auto_226782 ) ) ( not ( = ?auto_226779 ?auto_226781 ) ) ( not ( = ?auto_226779 ?auto_226780 ) ) ( not ( = ?auto_226779 ?auto_226782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226781 ?auto_226780 ?auto_226782 )
      ( MAKE-5CRATE-VERIFY ?auto_226777 ?auto_226778 ?auto_226779 ?auto_226781 ?auto_226780 ?auto_226782 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226827 - SURFACE
      ?auto_226828 - SURFACE
      ?auto_226829 - SURFACE
      ?auto_226831 - SURFACE
      ?auto_226830 - SURFACE
      ?auto_226832 - SURFACE
    )
    :vars
    (
      ?auto_226836 - HOIST
      ?auto_226833 - PLACE
      ?auto_226837 - TRUCK
      ?auto_226835 - PLACE
      ?auto_226838 - HOIST
      ?auto_226834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226836 ?auto_226833 ) ( SURFACE-AT ?auto_226830 ?auto_226833 ) ( CLEAR ?auto_226830 ) ( IS-CRATE ?auto_226832 ) ( not ( = ?auto_226830 ?auto_226832 ) ) ( AVAILABLE ?auto_226836 ) ( ON ?auto_226830 ?auto_226831 ) ( not ( = ?auto_226831 ?auto_226830 ) ) ( not ( = ?auto_226831 ?auto_226832 ) ) ( TRUCK-AT ?auto_226837 ?auto_226835 ) ( not ( = ?auto_226835 ?auto_226833 ) ) ( HOIST-AT ?auto_226838 ?auto_226835 ) ( not ( = ?auto_226836 ?auto_226838 ) ) ( AVAILABLE ?auto_226838 ) ( SURFACE-AT ?auto_226832 ?auto_226835 ) ( ON ?auto_226832 ?auto_226834 ) ( CLEAR ?auto_226832 ) ( not ( = ?auto_226830 ?auto_226834 ) ) ( not ( = ?auto_226832 ?auto_226834 ) ) ( not ( = ?auto_226831 ?auto_226834 ) ) ( ON ?auto_226828 ?auto_226827 ) ( ON ?auto_226829 ?auto_226828 ) ( ON ?auto_226831 ?auto_226829 ) ( not ( = ?auto_226827 ?auto_226828 ) ) ( not ( = ?auto_226827 ?auto_226829 ) ) ( not ( = ?auto_226827 ?auto_226831 ) ) ( not ( = ?auto_226827 ?auto_226830 ) ) ( not ( = ?auto_226827 ?auto_226832 ) ) ( not ( = ?auto_226827 ?auto_226834 ) ) ( not ( = ?auto_226828 ?auto_226829 ) ) ( not ( = ?auto_226828 ?auto_226831 ) ) ( not ( = ?auto_226828 ?auto_226830 ) ) ( not ( = ?auto_226828 ?auto_226832 ) ) ( not ( = ?auto_226828 ?auto_226834 ) ) ( not ( = ?auto_226829 ?auto_226831 ) ) ( not ( = ?auto_226829 ?auto_226830 ) ) ( not ( = ?auto_226829 ?auto_226832 ) ) ( not ( = ?auto_226829 ?auto_226834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226831 ?auto_226830 ?auto_226832 )
      ( MAKE-5CRATE-VERIFY ?auto_226827 ?auto_226828 ?auto_226829 ?auto_226831 ?auto_226830 ?auto_226832 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226878 - SURFACE
      ?auto_226879 - SURFACE
      ?auto_226880 - SURFACE
      ?auto_226882 - SURFACE
      ?auto_226881 - SURFACE
      ?auto_226883 - SURFACE
    )
    :vars
    (
      ?auto_226885 - HOIST
      ?auto_226887 - PLACE
      ?auto_226886 - PLACE
      ?auto_226884 - HOIST
      ?auto_226888 - SURFACE
      ?auto_226889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226885 ?auto_226887 ) ( SURFACE-AT ?auto_226881 ?auto_226887 ) ( CLEAR ?auto_226881 ) ( IS-CRATE ?auto_226883 ) ( not ( = ?auto_226881 ?auto_226883 ) ) ( AVAILABLE ?auto_226885 ) ( ON ?auto_226881 ?auto_226882 ) ( not ( = ?auto_226882 ?auto_226881 ) ) ( not ( = ?auto_226882 ?auto_226883 ) ) ( not ( = ?auto_226886 ?auto_226887 ) ) ( HOIST-AT ?auto_226884 ?auto_226886 ) ( not ( = ?auto_226885 ?auto_226884 ) ) ( AVAILABLE ?auto_226884 ) ( SURFACE-AT ?auto_226883 ?auto_226886 ) ( ON ?auto_226883 ?auto_226888 ) ( CLEAR ?auto_226883 ) ( not ( = ?auto_226881 ?auto_226888 ) ) ( not ( = ?auto_226883 ?auto_226888 ) ) ( not ( = ?auto_226882 ?auto_226888 ) ) ( TRUCK-AT ?auto_226889 ?auto_226887 ) ( ON ?auto_226879 ?auto_226878 ) ( ON ?auto_226880 ?auto_226879 ) ( ON ?auto_226882 ?auto_226880 ) ( not ( = ?auto_226878 ?auto_226879 ) ) ( not ( = ?auto_226878 ?auto_226880 ) ) ( not ( = ?auto_226878 ?auto_226882 ) ) ( not ( = ?auto_226878 ?auto_226881 ) ) ( not ( = ?auto_226878 ?auto_226883 ) ) ( not ( = ?auto_226878 ?auto_226888 ) ) ( not ( = ?auto_226879 ?auto_226880 ) ) ( not ( = ?auto_226879 ?auto_226882 ) ) ( not ( = ?auto_226879 ?auto_226881 ) ) ( not ( = ?auto_226879 ?auto_226883 ) ) ( not ( = ?auto_226879 ?auto_226888 ) ) ( not ( = ?auto_226880 ?auto_226882 ) ) ( not ( = ?auto_226880 ?auto_226881 ) ) ( not ( = ?auto_226880 ?auto_226883 ) ) ( not ( = ?auto_226880 ?auto_226888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226882 ?auto_226881 ?auto_226883 )
      ( MAKE-5CRATE-VERIFY ?auto_226878 ?auto_226879 ?auto_226880 ?auto_226882 ?auto_226881 ?auto_226883 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226929 - SURFACE
      ?auto_226930 - SURFACE
      ?auto_226931 - SURFACE
      ?auto_226933 - SURFACE
      ?auto_226932 - SURFACE
      ?auto_226934 - SURFACE
    )
    :vars
    (
      ?auto_226939 - HOIST
      ?auto_226937 - PLACE
      ?auto_226938 - PLACE
      ?auto_226940 - HOIST
      ?auto_226936 - SURFACE
      ?auto_226935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226939 ?auto_226937 ) ( IS-CRATE ?auto_226934 ) ( not ( = ?auto_226932 ?auto_226934 ) ) ( not ( = ?auto_226933 ?auto_226932 ) ) ( not ( = ?auto_226933 ?auto_226934 ) ) ( not ( = ?auto_226938 ?auto_226937 ) ) ( HOIST-AT ?auto_226940 ?auto_226938 ) ( not ( = ?auto_226939 ?auto_226940 ) ) ( AVAILABLE ?auto_226940 ) ( SURFACE-AT ?auto_226934 ?auto_226938 ) ( ON ?auto_226934 ?auto_226936 ) ( CLEAR ?auto_226934 ) ( not ( = ?auto_226932 ?auto_226936 ) ) ( not ( = ?auto_226934 ?auto_226936 ) ) ( not ( = ?auto_226933 ?auto_226936 ) ) ( TRUCK-AT ?auto_226935 ?auto_226937 ) ( SURFACE-AT ?auto_226933 ?auto_226937 ) ( CLEAR ?auto_226933 ) ( LIFTING ?auto_226939 ?auto_226932 ) ( IS-CRATE ?auto_226932 ) ( ON ?auto_226930 ?auto_226929 ) ( ON ?auto_226931 ?auto_226930 ) ( ON ?auto_226933 ?auto_226931 ) ( not ( = ?auto_226929 ?auto_226930 ) ) ( not ( = ?auto_226929 ?auto_226931 ) ) ( not ( = ?auto_226929 ?auto_226933 ) ) ( not ( = ?auto_226929 ?auto_226932 ) ) ( not ( = ?auto_226929 ?auto_226934 ) ) ( not ( = ?auto_226929 ?auto_226936 ) ) ( not ( = ?auto_226930 ?auto_226931 ) ) ( not ( = ?auto_226930 ?auto_226933 ) ) ( not ( = ?auto_226930 ?auto_226932 ) ) ( not ( = ?auto_226930 ?auto_226934 ) ) ( not ( = ?auto_226930 ?auto_226936 ) ) ( not ( = ?auto_226931 ?auto_226933 ) ) ( not ( = ?auto_226931 ?auto_226932 ) ) ( not ( = ?auto_226931 ?auto_226934 ) ) ( not ( = ?auto_226931 ?auto_226936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226933 ?auto_226932 ?auto_226934 )
      ( MAKE-5CRATE-VERIFY ?auto_226929 ?auto_226930 ?auto_226931 ?auto_226933 ?auto_226932 ?auto_226934 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226980 - SURFACE
      ?auto_226981 - SURFACE
      ?auto_226982 - SURFACE
      ?auto_226984 - SURFACE
      ?auto_226983 - SURFACE
      ?auto_226985 - SURFACE
    )
    :vars
    (
      ?auto_226986 - HOIST
      ?auto_226989 - PLACE
      ?auto_226988 - PLACE
      ?auto_226987 - HOIST
      ?auto_226991 - SURFACE
      ?auto_226990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226986 ?auto_226989 ) ( IS-CRATE ?auto_226985 ) ( not ( = ?auto_226983 ?auto_226985 ) ) ( not ( = ?auto_226984 ?auto_226983 ) ) ( not ( = ?auto_226984 ?auto_226985 ) ) ( not ( = ?auto_226988 ?auto_226989 ) ) ( HOIST-AT ?auto_226987 ?auto_226988 ) ( not ( = ?auto_226986 ?auto_226987 ) ) ( AVAILABLE ?auto_226987 ) ( SURFACE-AT ?auto_226985 ?auto_226988 ) ( ON ?auto_226985 ?auto_226991 ) ( CLEAR ?auto_226985 ) ( not ( = ?auto_226983 ?auto_226991 ) ) ( not ( = ?auto_226985 ?auto_226991 ) ) ( not ( = ?auto_226984 ?auto_226991 ) ) ( TRUCK-AT ?auto_226990 ?auto_226989 ) ( SURFACE-AT ?auto_226984 ?auto_226989 ) ( CLEAR ?auto_226984 ) ( IS-CRATE ?auto_226983 ) ( AVAILABLE ?auto_226986 ) ( IN ?auto_226983 ?auto_226990 ) ( ON ?auto_226981 ?auto_226980 ) ( ON ?auto_226982 ?auto_226981 ) ( ON ?auto_226984 ?auto_226982 ) ( not ( = ?auto_226980 ?auto_226981 ) ) ( not ( = ?auto_226980 ?auto_226982 ) ) ( not ( = ?auto_226980 ?auto_226984 ) ) ( not ( = ?auto_226980 ?auto_226983 ) ) ( not ( = ?auto_226980 ?auto_226985 ) ) ( not ( = ?auto_226980 ?auto_226991 ) ) ( not ( = ?auto_226981 ?auto_226982 ) ) ( not ( = ?auto_226981 ?auto_226984 ) ) ( not ( = ?auto_226981 ?auto_226983 ) ) ( not ( = ?auto_226981 ?auto_226985 ) ) ( not ( = ?auto_226981 ?auto_226991 ) ) ( not ( = ?auto_226982 ?auto_226984 ) ) ( not ( = ?auto_226982 ?auto_226983 ) ) ( not ( = ?auto_226982 ?auto_226985 ) ) ( not ( = ?auto_226982 ?auto_226991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226984 ?auto_226983 ?auto_226985 )
      ( MAKE-5CRATE-VERIFY ?auto_226980 ?auto_226981 ?auto_226982 ?auto_226984 ?auto_226983 ?auto_226985 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228189 - SURFACE
      ?auto_228190 - SURFACE
      ?auto_228191 - SURFACE
      ?auto_228193 - SURFACE
      ?auto_228192 - SURFACE
      ?auto_228194 - SURFACE
      ?auto_228195 - SURFACE
    )
    :vars
    (
      ?auto_228196 - HOIST
      ?auto_228197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228196 ?auto_228197 ) ( SURFACE-AT ?auto_228194 ?auto_228197 ) ( CLEAR ?auto_228194 ) ( LIFTING ?auto_228196 ?auto_228195 ) ( IS-CRATE ?auto_228195 ) ( not ( = ?auto_228194 ?auto_228195 ) ) ( ON ?auto_228190 ?auto_228189 ) ( ON ?auto_228191 ?auto_228190 ) ( ON ?auto_228193 ?auto_228191 ) ( ON ?auto_228192 ?auto_228193 ) ( ON ?auto_228194 ?auto_228192 ) ( not ( = ?auto_228189 ?auto_228190 ) ) ( not ( = ?auto_228189 ?auto_228191 ) ) ( not ( = ?auto_228189 ?auto_228193 ) ) ( not ( = ?auto_228189 ?auto_228192 ) ) ( not ( = ?auto_228189 ?auto_228194 ) ) ( not ( = ?auto_228189 ?auto_228195 ) ) ( not ( = ?auto_228190 ?auto_228191 ) ) ( not ( = ?auto_228190 ?auto_228193 ) ) ( not ( = ?auto_228190 ?auto_228192 ) ) ( not ( = ?auto_228190 ?auto_228194 ) ) ( not ( = ?auto_228190 ?auto_228195 ) ) ( not ( = ?auto_228191 ?auto_228193 ) ) ( not ( = ?auto_228191 ?auto_228192 ) ) ( not ( = ?auto_228191 ?auto_228194 ) ) ( not ( = ?auto_228191 ?auto_228195 ) ) ( not ( = ?auto_228193 ?auto_228192 ) ) ( not ( = ?auto_228193 ?auto_228194 ) ) ( not ( = ?auto_228193 ?auto_228195 ) ) ( not ( = ?auto_228192 ?auto_228194 ) ) ( not ( = ?auto_228192 ?auto_228195 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_228194 ?auto_228195 )
      ( MAKE-6CRATE-VERIFY ?auto_228189 ?auto_228190 ?auto_228191 ?auto_228193 ?auto_228192 ?auto_228194 ?auto_228195 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228233 - SURFACE
      ?auto_228234 - SURFACE
      ?auto_228235 - SURFACE
      ?auto_228237 - SURFACE
      ?auto_228236 - SURFACE
      ?auto_228238 - SURFACE
      ?auto_228239 - SURFACE
    )
    :vars
    (
      ?auto_228240 - HOIST
      ?auto_228242 - PLACE
      ?auto_228241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228240 ?auto_228242 ) ( SURFACE-AT ?auto_228238 ?auto_228242 ) ( CLEAR ?auto_228238 ) ( IS-CRATE ?auto_228239 ) ( not ( = ?auto_228238 ?auto_228239 ) ) ( TRUCK-AT ?auto_228241 ?auto_228242 ) ( AVAILABLE ?auto_228240 ) ( IN ?auto_228239 ?auto_228241 ) ( ON ?auto_228238 ?auto_228236 ) ( not ( = ?auto_228236 ?auto_228238 ) ) ( not ( = ?auto_228236 ?auto_228239 ) ) ( ON ?auto_228234 ?auto_228233 ) ( ON ?auto_228235 ?auto_228234 ) ( ON ?auto_228237 ?auto_228235 ) ( ON ?auto_228236 ?auto_228237 ) ( not ( = ?auto_228233 ?auto_228234 ) ) ( not ( = ?auto_228233 ?auto_228235 ) ) ( not ( = ?auto_228233 ?auto_228237 ) ) ( not ( = ?auto_228233 ?auto_228236 ) ) ( not ( = ?auto_228233 ?auto_228238 ) ) ( not ( = ?auto_228233 ?auto_228239 ) ) ( not ( = ?auto_228234 ?auto_228235 ) ) ( not ( = ?auto_228234 ?auto_228237 ) ) ( not ( = ?auto_228234 ?auto_228236 ) ) ( not ( = ?auto_228234 ?auto_228238 ) ) ( not ( = ?auto_228234 ?auto_228239 ) ) ( not ( = ?auto_228235 ?auto_228237 ) ) ( not ( = ?auto_228235 ?auto_228236 ) ) ( not ( = ?auto_228235 ?auto_228238 ) ) ( not ( = ?auto_228235 ?auto_228239 ) ) ( not ( = ?auto_228237 ?auto_228236 ) ) ( not ( = ?auto_228237 ?auto_228238 ) ) ( not ( = ?auto_228237 ?auto_228239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228236 ?auto_228238 ?auto_228239 )
      ( MAKE-6CRATE-VERIFY ?auto_228233 ?auto_228234 ?auto_228235 ?auto_228237 ?auto_228236 ?auto_228238 ?auto_228239 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228284 - SURFACE
      ?auto_228285 - SURFACE
      ?auto_228286 - SURFACE
      ?auto_228288 - SURFACE
      ?auto_228287 - SURFACE
      ?auto_228289 - SURFACE
      ?auto_228290 - SURFACE
    )
    :vars
    (
      ?auto_228292 - HOIST
      ?auto_228294 - PLACE
      ?auto_228291 - TRUCK
      ?auto_228293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228292 ?auto_228294 ) ( SURFACE-AT ?auto_228289 ?auto_228294 ) ( CLEAR ?auto_228289 ) ( IS-CRATE ?auto_228290 ) ( not ( = ?auto_228289 ?auto_228290 ) ) ( AVAILABLE ?auto_228292 ) ( IN ?auto_228290 ?auto_228291 ) ( ON ?auto_228289 ?auto_228287 ) ( not ( = ?auto_228287 ?auto_228289 ) ) ( not ( = ?auto_228287 ?auto_228290 ) ) ( TRUCK-AT ?auto_228291 ?auto_228293 ) ( not ( = ?auto_228293 ?auto_228294 ) ) ( ON ?auto_228285 ?auto_228284 ) ( ON ?auto_228286 ?auto_228285 ) ( ON ?auto_228288 ?auto_228286 ) ( ON ?auto_228287 ?auto_228288 ) ( not ( = ?auto_228284 ?auto_228285 ) ) ( not ( = ?auto_228284 ?auto_228286 ) ) ( not ( = ?auto_228284 ?auto_228288 ) ) ( not ( = ?auto_228284 ?auto_228287 ) ) ( not ( = ?auto_228284 ?auto_228289 ) ) ( not ( = ?auto_228284 ?auto_228290 ) ) ( not ( = ?auto_228285 ?auto_228286 ) ) ( not ( = ?auto_228285 ?auto_228288 ) ) ( not ( = ?auto_228285 ?auto_228287 ) ) ( not ( = ?auto_228285 ?auto_228289 ) ) ( not ( = ?auto_228285 ?auto_228290 ) ) ( not ( = ?auto_228286 ?auto_228288 ) ) ( not ( = ?auto_228286 ?auto_228287 ) ) ( not ( = ?auto_228286 ?auto_228289 ) ) ( not ( = ?auto_228286 ?auto_228290 ) ) ( not ( = ?auto_228288 ?auto_228287 ) ) ( not ( = ?auto_228288 ?auto_228289 ) ) ( not ( = ?auto_228288 ?auto_228290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228287 ?auto_228289 ?auto_228290 )
      ( MAKE-6CRATE-VERIFY ?auto_228284 ?auto_228285 ?auto_228286 ?auto_228288 ?auto_228287 ?auto_228289 ?auto_228290 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228341 - SURFACE
      ?auto_228342 - SURFACE
      ?auto_228343 - SURFACE
      ?auto_228345 - SURFACE
      ?auto_228344 - SURFACE
      ?auto_228346 - SURFACE
      ?auto_228347 - SURFACE
    )
    :vars
    (
      ?auto_228352 - HOIST
      ?auto_228350 - PLACE
      ?auto_228349 - TRUCK
      ?auto_228351 - PLACE
      ?auto_228348 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_228352 ?auto_228350 ) ( SURFACE-AT ?auto_228346 ?auto_228350 ) ( CLEAR ?auto_228346 ) ( IS-CRATE ?auto_228347 ) ( not ( = ?auto_228346 ?auto_228347 ) ) ( AVAILABLE ?auto_228352 ) ( ON ?auto_228346 ?auto_228344 ) ( not ( = ?auto_228344 ?auto_228346 ) ) ( not ( = ?auto_228344 ?auto_228347 ) ) ( TRUCK-AT ?auto_228349 ?auto_228351 ) ( not ( = ?auto_228351 ?auto_228350 ) ) ( HOIST-AT ?auto_228348 ?auto_228351 ) ( LIFTING ?auto_228348 ?auto_228347 ) ( not ( = ?auto_228352 ?auto_228348 ) ) ( ON ?auto_228342 ?auto_228341 ) ( ON ?auto_228343 ?auto_228342 ) ( ON ?auto_228345 ?auto_228343 ) ( ON ?auto_228344 ?auto_228345 ) ( not ( = ?auto_228341 ?auto_228342 ) ) ( not ( = ?auto_228341 ?auto_228343 ) ) ( not ( = ?auto_228341 ?auto_228345 ) ) ( not ( = ?auto_228341 ?auto_228344 ) ) ( not ( = ?auto_228341 ?auto_228346 ) ) ( not ( = ?auto_228341 ?auto_228347 ) ) ( not ( = ?auto_228342 ?auto_228343 ) ) ( not ( = ?auto_228342 ?auto_228345 ) ) ( not ( = ?auto_228342 ?auto_228344 ) ) ( not ( = ?auto_228342 ?auto_228346 ) ) ( not ( = ?auto_228342 ?auto_228347 ) ) ( not ( = ?auto_228343 ?auto_228345 ) ) ( not ( = ?auto_228343 ?auto_228344 ) ) ( not ( = ?auto_228343 ?auto_228346 ) ) ( not ( = ?auto_228343 ?auto_228347 ) ) ( not ( = ?auto_228345 ?auto_228344 ) ) ( not ( = ?auto_228345 ?auto_228346 ) ) ( not ( = ?auto_228345 ?auto_228347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228344 ?auto_228346 ?auto_228347 )
      ( MAKE-6CRATE-VERIFY ?auto_228341 ?auto_228342 ?auto_228343 ?auto_228345 ?auto_228344 ?auto_228346 ?auto_228347 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228404 - SURFACE
      ?auto_228405 - SURFACE
      ?auto_228406 - SURFACE
      ?auto_228408 - SURFACE
      ?auto_228407 - SURFACE
      ?auto_228409 - SURFACE
      ?auto_228410 - SURFACE
    )
    :vars
    (
      ?auto_228413 - HOIST
      ?auto_228412 - PLACE
      ?auto_228415 - TRUCK
      ?auto_228414 - PLACE
      ?auto_228416 - HOIST
      ?auto_228411 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228413 ?auto_228412 ) ( SURFACE-AT ?auto_228409 ?auto_228412 ) ( CLEAR ?auto_228409 ) ( IS-CRATE ?auto_228410 ) ( not ( = ?auto_228409 ?auto_228410 ) ) ( AVAILABLE ?auto_228413 ) ( ON ?auto_228409 ?auto_228407 ) ( not ( = ?auto_228407 ?auto_228409 ) ) ( not ( = ?auto_228407 ?auto_228410 ) ) ( TRUCK-AT ?auto_228415 ?auto_228414 ) ( not ( = ?auto_228414 ?auto_228412 ) ) ( HOIST-AT ?auto_228416 ?auto_228414 ) ( not ( = ?auto_228413 ?auto_228416 ) ) ( AVAILABLE ?auto_228416 ) ( SURFACE-AT ?auto_228410 ?auto_228414 ) ( ON ?auto_228410 ?auto_228411 ) ( CLEAR ?auto_228410 ) ( not ( = ?auto_228409 ?auto_228411 ) ) ( not ( = ?auto_228410 ?auto_228411 ) ) ( not ( = ?auto_228407 ?auto_228411 ) ) ( ON ?auto_228405 ?auto_228404 ) ( ON ?auto_228406 ?auto_228405 ) ( ON ?auto_228408 ?auto_228406 ) ( ON ?auto_228407 ?auto_228408 ) ( not ( = ?auto_228404 ?auto_228405 ) ) ( not ( = ?auto_228404 ?auto_228406 ) ) ( not ( = ?auto_228404 ?auto_228408 ) ) ( not ( = ?auto_228404 ?auto_228407 ) ) ( not ( = ?auto_228404 ?auto_228409 ) ) ( not ( = ?auto_228404 ?auto_228410 ) ) ( not ( = ?auto_228404 ?auto_228411 ) ) ( not ( = ?auto_228405 ?auto_228406 ) ) ( not ( = ?auto_228405 ?auto_228408 ) ) ( not ( = ?auto_228405 ?auto_228407 ) ) ( not ( = ?auto_228405 ?auto_228409 ) ) ( not ( = ?auto_228405 ?auto_228410 ) ) ( not ( = ?auto_228405 ?auto_228411 ) ) ( not ( = ?auto_228406 ?auto_228408 ) ) ( not ( = ?auto_228406 ?auto_228407 ) ) ( not ( = ?auto_228406 ?auto_228409 ) ) ( not ( = ?auto_228406 ?auto_228410 ) ) ( not ( = ?auto_228406 ?auto_228411 ) ) ( not ( = ?auto_228408 ?auto_228407 ) ) ( not ( = ?auto_228408 ?auto_228409 ) ) ( not ( = ?auto_228408 ?auto_228410 ) ) ( not ( = ?auto_228408 ?auto_228411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228407 ?auto_228409 ?auto_228410 )
      ( MAKE-6CRATE-VERIFY ?auto_228404 ?auto_228405 ?auto_228406 ?auto_228408 ?auto_228407 ?auto_228409 ?auto_228410 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228468 - SURFACE
      ?auto_228469 - SURFACE
      ?auto_228470 - SURFACE
      ?auto_228472 - SURFACE
      ?auto_228471 - SURFACE
      ?auto_228473 - SURFACE
      ?auto_228474 - SURFACE
    )
    :vars
    (
      ?auto_228475 - HOIST
      ?auto_228476 - PLACE
      ?auto_228479 - PLACE
      ?auto_228478 - HOIST
      ?auto_228477 - SURFACE
      ?auto_228480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228475 ?auto_228476 ) ( SURFACE-AT ?auto_228473 ?auto_228476 ) ( CLEAR ?auto_228473 ) ( IS-CRATE ?auto_228474 ) ( not ( = ?auto_228473 ?auto_228474 ) ) ( AVAILABLE ?auto_228475 ) ( ON ?auto_228473 ?auto_228471 ) ( not ( = ?auto_228471 ?auto_228473 ) ) ( not ( = ?auto_228471 ?auto_228474 ) ) ( not ( = ?auto_228479 ?auto_228476 ) ) ( HOIST-AT ?auto_228478 ?auto_228479 ) ( not ( = ?auto_228475 ?auto_228478 ) ) ( AVAILABLE ?auto_228478 ) ( SURFACE-AT ?auto_228474 ?auto_228479 ) ( ON ?auto_228474 ?auto_228477 ) ( CLEAR ?auto_228474 ) ( not ( = ?auto_228473 ?auto_228477 ) ) ( not ( = ?auto_228474 ?auto_228477 ) ) ( not ( = ?auto_228471 ?auto_228477 ) ) ( TRUCK-AT ?auto_228480 ?auto_228476 ) ( ON ?auto_228469 ?auto_228468 ) ( ON ?auto_228470 ?auto_228469 ) ( ON ?auto_228472 ?auto_228470 ) ( ON ?auto_228471 ?auto_228472 ) ( not ( = ?auto_228468 ?auto_228469 ) ) ( not ( = ?auto_228468 ?auto_228470 ) ) ( not ( = ?auto_228468 ?auto_228472 ) ) ( not ( = ?auto_228468 ?auto_228471 ) ) ( not ( = ?auto_228468 ?auto_228473 ) ) ( not ( = ?auto_228468 ?auto_228474 ) ) ( not ( = ?auto_228468 ?auto_228477 ) ) ( not ( = ?auto_228469 ?auto_228470 ) ) ( not ( = ?auto_228469 ?auto_228472 ) ) ( not ( = ?auto_228469 ?auto_228471 ) ) ( not ( = ?auto_228469 ?auto_228473 ) ) ( not ( = ?auto_228469 ?auto_228474 ) ) ( not ( = ?auto_228469 ?auto_228477 ) ) ( not ( = ?auto_228470 ?auto_228472 ) ) ( not ( = ?auto_228470 ?auto_228471 ) ) ( not ( = ?auto_228470 ?auto_228473 ) ) ( not ( = ?auto_228470 ?auto_228474 ) ) ( not ( = ?auto_228470 ?auto_228477 ) ) ( not ( = ?auto_228472 ?auto_228471 ) ) ( not ( = ?auto_228472 ?auto_228473 ) ) ( not ( = ?auto_228472 ?auto_228474 ) ) ( not ( = ?auto_228472 ?auto_228477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228471 ?auto_228473 ?auto_228474 )
      ( MAKE-6CRATE-VERIFY ?auto_228468 ?auto_228469 ?auto_228470 ?auto_228472 ?auto_228471 ?auto_228473 ?auto_228474 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228532 - SURFACE
      ?auto_228533 - SURFACE
      ?auto_228534 - SURFACE
      ?auto_228536 - SURFACE
      ?auto_228535 - SURFACE
      ?auto_228537 - SURFACE
      ?auto_228538 - SURFACE
    )
    :vars
    (
      ?auto_228543 - HOIST
      ?auto_228542 - PLACE
      ?auto_228544 - PLACE
      ?auto_228540 - HOIST
      ?auto_228541 - SURFACE
      ?auto_228539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228543 ?auto_228542 ) ( IS-CRATE ?auto_228538 ) ( not ( = ?auto_228537 ?auto_228538 ) ) ( not ( = ?auto_228535 ?auto_228537 ) ) ( not ( = ?auto_228535 ?auto_228538 ) ) ( not ( = ?auto_228544 ?auto_228542 ) ) ( HOIST-AT ?auto_228540 ?auto_228544 ) ( not ( = ?auto_228543 ?auto_228540 ) ) ( AVAILABLE ?auto_228540 ) ( SURFACE-AT ?auto_228538 ?auto_228544 ) ( ON ?auto_228538 ?auto_228541 ) ( CLEAR ?auto_228538 ) ( not ( = ?auto_228537 ?auto_228541 ) ) ( not ( = ?auto_228538 ?auto_228541 ) ) ( not ( = ?auto_228535 ?auto_228541 ) ) ( TRUCK-AT ?auto_228539 ?auto_228542 ) ( SURFACE-AT ?auto_228535 ?auto_228542 ) ( CLEAR ?auto_228535 ) ( LIFTING ?auto_228543 ?auto_228537 ) ( IS-CRATE ?auto_228537 ) ( ON ?auto_228533 ?auto_228532 ) ( ON ?auto_228534 ?auto_228533 ) ( ON ?auto_228536 ?auto_228534 ) ( ON ?auto_228535 ?auto_228536 ) ( not ( = ?auto_228532 ?auto_228533 ) ) ( not ( = ?auto_228532 ?auto_228534 ) ) ( not ( = ?auto_228532 ?auto_228536 ) ) ( not ( = ?auto_228532 ?auto_228535 ) ) ( not ( = ?auto_228532 ?auto_228537 ) ) ( not ( = ?auto_228532 ?auto_228538 ) ) ( not ( = ?auto_228532 ?auto_228541 ) ) ( not ( = ?auto_228533 ?auto_228534 ) ) ( not ( = ?auto_228533 ?auto_228536 ) ) ( not ( = ?auto_228533 ?auto_228535 ) ) ( not ( = ?auto_228533 ?auto_228537 ) ) ( not ( = ?auto_228533 ?auto_228538 ) ) ( not ( = ?auto_228533 ?auto_228541 ) ) ( not ( = ?auto_228534 ?auto_228536 ) ) ( not ( = ?auto_228534 ?auto_228535 ) ) ( not ( = ?auto_228534 ?auto_228537 ) ) ( not ( = ?auto_228534 ?auto_228538 ) ) ( not ( = ?auto_228534 ?auto_228541 ) ) ( not ( = ?auto_228536 ?auto_228535 ) ) ( not ( = ?auto_228536 ?auto_228537 ) ) ( not ( = ?auto_228536 ?auto_228538 ) ) ( not ( = ?auto_228536 ?auto_228541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228535 ?auto_228537 ?auto_228538 )
      ( MAKE-6CRATE-VERIFY ?auto_228532 ?auto_228533 ?auto_228534 ?auto_228536 ?auto_228535 ?auto_228537 ?auto_228538 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228596 - SURFACE
      ?auto_228597 - SURFACE
      ?auto_228598 - SURFACE
      ?auto_228600 - SURFACE
      ?auto_228599 - SURFACE
      ?auto_228601 - SURFACE
      ?auto_228602 - SURFACE
    )
    :vars
    (
      ?auto_228607 - HOIST
      ?auto_228608 - PLACE
      ?auto_228606 - PLACE
      ?auto_228603 - HOIST
      ?auto_228605 - SURFACE
      ?auto_228604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228607 ?auto_228608 ) ( IS-CRATE ?auto_228602 ) ( not ( = ?auto_228601 ?auto_228602 ) ) ( not ( = ?auto_228599 ?auto_228601 ) ) ( not ( = ?auto_228599 ?auto_228602 ) ) ( not ( = ?auto_228606 ?auto_228608 ) ) ( HOIST-AT ?auto_228603 ?auto_228606 ) ( not ( = ?auto_228607 ?auto_228603 ) ) ( AVAILABLE ?auto_228603 ) ( SURFACE-AT ?auto_228602 ?auto_228606 ) ( ON ?auto_228602 ?auto_228605 ) ( CLEAR ?auto_228602 ) ( not ( = ?auto_228601 ?auto_228605 ) ) ( not ( = ?auto_228602 ?auto_228605 ) ) ( not ( = ?auto_228599 ?auto_228605 ) ) ( TRUCK-AT ?auto_228604 ?auto_228608 ) ( SURFACE-AT ?auto_228599 ?auto_228608 ) ( CLEAR ?auto_228599 ) ( IS-CRATE ?auto_228601 ) ( AVAILABLE ?auto_228607 ) ( IN ?auto_228601 ?auto_228604 ) ( ON ?auto_228597 ?auto_228596 ) ( ON ?auto_228598 ?auto_228597 ) ( ON ?auto_228600 ?auto_228598 ) ( ON ?auto_228599 ?auto_228600 ) ( not ( = ?auto_228596 ?auto_228597 ) ) ( not ( = ?auto_228596 ?auto_228598 ) ) ( not ( = ?auto_228596 ?auto_228600 ) ) ( not ( = ?auto_228596 ?auto_228599 ) ) ( not ( = ?auto_228596 ?auto_228601 ) ) ( not ( = ?auto_228596 ?auto_228602 ) ) ( not ( = ?auto_228596 ?auto_228605 ) ) ( not ( = ?auto_228597 ?auto_228598 ) ) ( not ( = ?auto_228597 ?auto_228600 ) ) ( not ( = ?auto_228597 ?auto_228599 ) ) ( not ( = ?auto_228597 ?auto_228601 ) ) ( not ( = ?auto_228597 ?auto_228602 ) ) ( not ( = ?auto_228597 ?auto_228605 ) ) ( not ( = ?auto_228598 ?auto_228600 ) ) ( not ( = ?auto_228598 ?auto_228599 ) ) ( not ( = ?auto_228598 ?auto_228601 ) ) ( not ( = ?auto_228598 ?auto_228602 ) ) ( not ( = ?auto_228598 ?auto_228605 ) ) ( not ( = ?auto_228600 ?auto_228599 ) ) ( not ( = ?auto_228600 ?auto_228601 ) ) ( not ( = ?auto_228600 ?auto_228602 ) ) ( not ( = ?auto_228600 ?auto_228605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228599 ?auto_228601 ?auto_228602 )
      ( MAKE-6CRATE-VERIFY ?auto_228596 ?auto_228597 ?auto_228598 ?auto_228600 ?auto_228599 ?auto_228601 ?auto_228602 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230552 - SURFACE
      ?auto_230553 - SURFACE
      ?auto_230554 - SURFACE
      ?auto_230556 - SURFACE
      ?auto_230555 - SURFACE
      ?auto_230557 - SURFACE
      ?auto_230558 - SURFACE
      ?auto_230559 - SURFACE
    )
    :vars
    (
      ?auto_230561 - HOIST
      ?auto_230560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_230561 ?auto_230560 ) ( SURFACE-AT ?auto_230558 ?auto_230560 ) ( CLEAR ?auto_230558 ) ( LIFTING ?auto_230561 ?auto_230559 ) ( IS-CRATE ?auto_230559 ) ( not ( = ?auto_230558 ?auto_230559 ) ) ( ON ?auto_230553 ?auto_230552 ) ( ON ?auto_230554 ?auto_230553 ) ( ON ?auto_230556 ?auto_230554 ) ( ON ?auto_230555 ?auto_230556 ) ( ON ?auto_230557 ?auto_230555 ) ( ON ?auto_230558 ?auto_230557 ) ( not ( = ?auto_230552 ?auto_230553 ) ) ( not ( = ?auto_230552 ?auto_230554 ) ) ( not ( = ?auto_230552 ?auto_230556 ) ) ( not ( = ?auto_230552 ?auto_230555 ) ) ( not ( = ?auto_230552 ?auto_230557 ) ) ( not ( = ?auto_230552 ?auto_230558 ) ) ( not ( = ?auto_230552 ?auto_230559 ) ) ( not ( = ?auto_230553 ?auto_230554 ) ) ( not ( = ?auto_230553 ?auto_230556 ) ) ( not ( = ?auto_230553 ?auto_230555 ) ) ( not ( = ?auto_230553 ?auto_230557 ) ) ( not ( = ?auto_230553 ?auto_230558 ) ) ( not ( = ?auto_230553 ?auto_230559 ) ) ( not ( = ?auto_230554 ?auto_230556 ) ) ( not ( = ?auto_230554 ?auto_230555 ) ) ( not ( = ?auto_230554 ?auto_230557 ) ) ( not ( = ?auto_230554 ?auto_230558 ) ) ( not ( = ?auto_230554 ?auto_230559 ) ) ( not ( = ?auto_230556 ?auto_230555 ) ) ( not ( = ?auto_230556 ?auto_230557 ) ) ( not ( = ?auto_230556 ?auto_230558 ) ) ( not ( = ?auto_230556 ?auto_230559 ) ) ( not ( = ?auto_230555 ?auto_230557 ) ) ( not ( = ?auto_230555 ?auto_230558 ) ) ( not ( = ?auto_230555 ?auto_230559 ) ) ( not ( = ?auto_230557 ?auto_230558 ) ) ( not ( = ?auto_230557 ?auto_230559 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_230558 ?auto_230559 )
      ( MAKE-7CRATE-VERIFY ?auto_230552 ?auto_230553 ?auto_230554 ?auto_230556 ?auto_230555 ?auto_230557 ?auto_230558 ?auto_230559 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230607 - SURFACE
      ?auto_230608 - SURFACE
      ?auto_230609 - SURFACE
      ?auto_230611 - SURFACE
      ?auto_230610 - SURFACE
      ?auto_230612 - SURFACE
      ?auto_230613 - SURFACE
      ?auto_230614 - SURFACE
    )
    :vars
    (
      ?auto_230616 - HOIST
      ?auto_230615 - PLACE
      ?auto_230617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_230616 ?auto_230615 ) ( SURFACE-AT ?auto_230613 ?auto_230615 ) ( CLEAR ?auto_230613 ) ( IS-CRATE ?auto_230614 ) ( not ( = ?auto_230613 ?auto_230614 ) ) ( TRUCK-AT ?auto_230617 ?auto_230615 ) ( AVAILABLE ?auto_230616 ) ( IN ?auto_230614 ?auto_230617 ) ( ON ?auto_230613 ?auto_230612 ) ( not ( = ?auto_230612 ?auto_230613 ) ) ( not ( = ?auto_230612 ?auto_230614 ) ) ( ON ?auto_230608 ?auto_230607 ) ( ON ?auto_230609 ?auto_230608 ) ( ON ?auto_230611 ?auto_230609 ) ( ON ?auto_230610 ?auto_230611 ) ( ON ?auto_230612 ?auto_230610 ) ( not ( = ?auto_230607 ?auto_230608 ) ) ( not ( = ?auto_230607 ?auto_230609 ) ) ( not ( = ?auto_230607 ?auto_230611 ) ) ( not ( = ?auto_230607 ?auto_230610 ) ) ( not ( = ?auto_230607 ?auto_230612 ) ) ( not ( = ?auto_230607 ?auto_230613 ) ) ( not ( = ?auto_230607 ?auto_230614 ) ) ( not ( = ?auto_230608 ?auto_230609 ) ) ( not ( = ?auto_230608 ?auto_230611 ) ) ( not ( = ?auto_230608 ?auto_230610 ) ) ( not ( = ?auto_230608 ?auto_230612 ) ) ( not ( = ?auto_230608 ?auto_230613 ) ) ( not ( = ?auto_230608 ?auto_230614 ) ) ( not ( = ?auto_230609 ?auto_230611 ) ) ( not ( = ?auto_230609 ?auto_230610 ) ) ( not ( = ?auto_230609 ?auto_230612 ) ) ( not ( = ?auto_230609 ?auto_230613 ) ) ( not ( = ?auto_230609 ?auto_230614 ) ) ( not ( = ?auto_230611 ?auto_230610 ) ) ( not ( = ?auto_230611 ?auto_230612 ) ) ( not ( = ?auto_230611 ?auto_230613 ) ) ( not ( = ?auto_230611 ?auto_230614 ) ) ( not ( = ?auto_230610 ?auto_230612 ) ) ( not ( = ?auto_230610 ?auto_230613 ) ) ( not ( = ?auto_230610 ?auto_230614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230612 ?auto_230613 ?auto_230614 )
      ( MAKE-7CRATE-VERIFY ?auto_230607 ?auto_230608 ?auto_230609 ?auto_230611 ?auto_230610 ?auto_230612 ?auto_230613 ?auto_230614 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230670 - SURFACE
      ?auto_230671 - SURFACE
      ?auto_230672 - SURFACE
      ?auto_230674 - SURFACE
      ?auto_230673 - SURFACE
      ?auto_230675 - SURFACE
      ?auto_230676 - SURFACE
      ?auto_230677 - SURFACE
    )
    :vars
    (
      ?auto_230678 - HOIST
      ?auto_230681 - PLACE
      ?auto_230679 - TRUCK
      ?auto_230680 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_230678 ?auto_230681 ) ( SURFACE-AT ?auto_230676 ?auto_230681 ) ( CLEAR ?auto_230676 ) ( IS-CRATE ?auto_230677 ) ( not ( = ?auto_230676 ?auto_230677 ) ) ( AVAILABLE ?auto_230678 ) ( IN ?auto_230677 ?auto_230679 ) ( ON ?auto_230676 ?auto_230675 ) ( not ( = ?auto_230675 ?auto_230676 ) ) ( not ( = ?auto_230675 ?auto_230677 ) ) ( TRUCK-AT ?auto_230679 ?auto_230680 ) ( not ( = ?auto_230680 ?auto_230681 ) ) ( ON ?auto_230671 ?auto_230670 ) ( ON ?auto_230672 ?auto_230671 ) ( ON ?auto_230674 ?auto_230672 ) ( ON ?auto_230673 ?auto_230674 ) ( ON ?auto_230675 ?auto_230673 ) ( not ( = ?auto_230670 ?auto_230671 ) ) ( not ( = ?auto_230670 ?auto_230672 ) ) ( not ( = ?auto_230670 ?auto_230674 ) ) ( not ( = ?auto_230670 ?auto_230673 ) ) ( not ( = ?auto_230670 ?auto_230675 ) ) ( not ( = ?auto_230670 ?auto_230676 ) ) ( not ( = ?auto_230670 ?auto_230677 ) ) ( not ( = ?auto_230671 ?auto_230672 ) ) ( not ( = ?auto_230671 ?auto_230674 ) ) ( not ( = ?auto_230671 ?auto_230673 ) ) ( not ( = ?auto_230671 ?auto_230675 ) ) ( not ( = ?auto_230671 ?auto_230676 ) ) ( not ( = ?auto_230671 ?auto_230677 ) ) ( not ( = ?auto_230672 ?auto_230674 ) ) ( not ( = ?auto_230672 ?auto_230673 ) ) ( not ( = ?auto_230672 ?auto_230675 ) ) ( not ( = ?auto_230672 ?auto_230676 ) ) ( not ( = ?auto_230672 ?auto_230677 ) ) ( not ( = ?auto_230674 ?auto_230673 ) ) ( not ( = ?auto_230674 ?auto_230675 ) ) ( not ( = ?auto_230674 ?auto_230676 ) ) ( not ( = ?auto_230674 ?auto_230677 ) ) ( not ( = ?auto_230673 ?auto_230675 ) ) ( not ( = ?auto_230673 ?auto_230676 ) ) ( not ( = ?auto_230673 ?auto_230677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230675 ?auto_230676 ?auto_230677 )
      ( MAKE-7CRATE-VERIFY ?auto_230670 ?auto_230671 ?auto_230672 ?auto_230674 ?auto_230673 ?auto_230675 ?auto_230676 ?auto_230677 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230740 - SURFACE
      ?auto_230741 - SURFACE
      ?auto_230742 - SURFACE
      ?auto_230744 - SURFACE
      ?auto_230743 - SURFACE
      ?auto_230745 - SURFACE
      ?auto_230746 - SURFACE
      ?auto_230747 - SURFACE
    )
    :vars
    (
      ?auto_230749 - HOIST
      ?auto_230748 - PLACE
      ?auto_230751 - TRUCK
      ?auto_230752 - PLACE
      ?auto_230750 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_230749 ?auto_230748 ) ( SURFACE-AT ?auto_230746 ?auto_230748 ) ( CLEAR ?auto_230746 ) ( IS-CRATE ?auto_230747 ) ( not ( = ?auto_230746 ?auto_230747 ) ) ( AVAILABLE ?auto_230749 ) ( ON ?auto_230746 ?auto_230745 ) ( not ( = ?auto_230745 ?auto_230746 ) ) ( not ( = ?auto_230745 ?auto_230747 ) ) ( TRUCK-AT ?auto_230751 ?auto_230752 ) ( not ( = ?auto_230752 ?auto_230748 ) ) ( HOIST-AT ?auto_230750 ?auto_230752 ) ( LIFTING ?auto_230750 ?auto_230747 ) ( not ( = ?auto_230749 ?auto_230750 ) ) ( ON ?auto_230741 ?auto_230740 ) ( ON ?auto_230742 ?auto_230741 ) ( ON ?auto_230744 ?auto_230742 ) ( ON ?auto_230743 ?auto_230744 ) ( ON ?auto_230745 ?auto_230743 ) ( not ( = ?auto_230740 ?auto_230741 ) ) ( not ( = ?auto_230740 ?auto_230742 ) ) ( not ( = ?auto_230740 ?auto_230744 ) ) ( not ( = ?auto_230740 ?auto_230743 ) ) ( not ( = ?auto_230740 ?auto_230745 ) ) ( not ( = ?auto_230740 ?auto_230746 ) ) ( not ( = ?auto_230740 ?auto_230747 ) ) ( not ( = ?auto_230741 ?auto_230742 ) ) ( not ( = ?auto_230741 ?auto_230744 ) ) ( not ( = ?auto_230741 ?auto_230743 ) ) ( not ( = ?auto_230741 ?auto_230745 ) ) ( not ( = ?auto_230741 ?auto_230746 ) ) ( not ( = ?auto_230741 ?auto_230747 ) ) ( not ( = ?auto_230742 ?auto_230744 ) ) ( not ( = ?auto_230742 ?auto_230743 ) ) ( not ( = ?auto_230742 ?auto_230745 ) ) ( not ( = ?auto_230742 ?auto_230746 ) ) ( not ( = ?auto_230742 ?auto_230747 ) ) ( not ( = ?auto_230744 ?auto_230743 ) ) ( not ( = ?auto_230744 ?auto_230745 ) ) ( not ( = ?auto_230744 ?auto_230746 ) ) ( not ( = ?auto_230744 ?auto_230747 ) ) ( not ( = ?auto_230743 ?auto_230745 ) ) ( not ( = ?auto_230743 ?auto_230746 ) ) ( not ( = ?auto_230743 ?auto_230747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230745 ?auto_230746 ?auto_230747 )
      ( MAKE-7CRATE-VERIFY ?auto_230740 ?auto_230741 ?auto_230742 ?auto_230744 ?auto_230743 ?auto_230745 ?auto_230746 ?auto_230747 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230817 - SURFACE
      ?auto_230818 - SURFACE
      ?auto_230819 - SURFACE
      ?auto_230821 - SURFACE
      ?auto_230820 - SURFACE
      ?auto_230822 - SURFACE
      ?auto_230823 - SURFACE
      ?auto_230824 - SURFACE
    )
    :vars
    (
      ?auto_230827 - HOIST
      ?auto_230829 - PLACE
      ?auto_230826 - TRUCK
      ?auto_230825 - PLACE
      ?auto_230828 - HOIST
      ?auto_230830 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_230827 ?auto_230829 ) ( SURFACE-AT ?auto_230823 ?auto_230829 ) ( CLEAR ?auto_230823 ) ( IS-CRATE ?auto_230824 ) ( not ( = ?auto_230823 ?auto_230824 ) ) ( AVAILABLE ?auto_230827 ) ( ON ?auto_230823 ?auto_230822 ) ( not ( = ?auto_230822 ?auto_230823 ) ) ( not ( = ?auto_230822 ?auto_230824 ) ) ( TRUCK-AT ?auto_230826 ?auto_230825 ) ( not ( = ?auto_230825 ?auto_230829 ) ) ( HOIST-AT ?auto_230828 ?auto_230825 ) ( not ( = ?auto_230827 ?auto_230828 ) ) ( AVAILABLE ?auto_230828 ) ( SURFACE-AT ?auto_230824 ?auto_230825 ) ( ON ?auto_230824 ?auto_230830 ) ( CLEAR ?auto_230824 ) ( not ( = ?auto_230823 ?auto_230830 ) ) ( not ( = ?auto_230824 ?auto_230830 ) ) ( not ( = ?auto_230822 ?auto_230830 ) ) ( ON ?auto_230818 ?auto_230817 ) ( ON ?auto_230819 ?auto_230818 ) ( ON ?auto_230821 ?auto_230819 ) ( ON ?auto_230820 ?auto_230821 ) ( ON ?auto_230822 ?auto_230820 ) ( not ( = ?auto_230817 ?auto_230818 ) ) ( not ( = ?auto_230817 ?auto_230819 ) ) ( not ( = ?auto_230817 ?auto_230821 ) ) ( not ( = ?auto_230817 ?auto_230820 ) ) ( not ( = ?auto_230817 ?auto_230822 ) ) ( not ( = ?auto_230817 ?auto_230823 ) ) ( not ( = ?auto_230817 ?auto_230824 ) ) ( not ( = ?auto_230817 ?auto_230830 ) ) ( not ( = ?auto_230818 ?auto_230819 ) ) ( not ( = ?auto_230818 ?auto_230821 ) ) ( not ( = ?auto_230818 ?auto_230820 ) ) ( not ( = ?auto_230818 ?auto_230822 ) ) ( not ( = ?auto_230818 ?auto_230823 ) ) ( not ( = ?auto_230818 ?auto_230824 ) ) ( not ( = ?auto_230818 ?auto_230830 ) ) ( not ( = ?auto_230819 ?auto_230821 ) ) ( not ( = ?auto_230819 ?auto_230820 ) ) ( not ( = ?auto_230819 ?auto_230822 ) ) ( not ( = ?auto_230819 ?auto_230823 ) ) ( not ( = ?auto_230819 ?auto_230824 ) ) ( not ( = ?auto_230819 ?auto_230830 ) ) ( not ( = ?auto_230821 ?auto_230820 ) ) ( not ( = ?auto_230821 ?auto_230822 ) ) ( not ( = ?auto_230821 ?auto_230823 ) ) ( not ( = ?auto_230821 ?auto_230824 ) ) ( not ( = ?auto_230821 ?auto_230830 ) ) ( not ( = ?auto_230820 ?auto_230822 ) ) ( not ( = ?auto_230820 ?auto_230823 ) ) ( not ( = ?auto_230820 ?auto_230824 ) ) ( not ( = ?auto_230820 ?auto_230830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230822 ?auto_230823 ?auto_230824 )
      ( MAKE-7CRATE-VERIFY ?auto_230817 ?auto_230818 ?auto_230819 ?auto_230821 ?auto_230820 ?auto_230822 ?auto_230823 ?auto_230824 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230895 - SURFACE
      ?auto_230896 - SURFACE
      ?auto_230897 - SURFACE
      ?auto_230899 - SURFACE
      ?auto_230898 - SURFACE
      ?auto_230900 - SURFACE
      ?auto_230901 - SURFACE
      ?auto_230902 - SURFACE
    )
    :vars
    (
      ?auto_230906 - HOIST
      ?auto_230903 - PLACE
      ?auto_230904 - PLACE
      ?auto_230905 - HOIST
      ?auto_230908 - SURFACE
      ?auto_230907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_230906 ?auto_230903 ) ( SURFACE-AT ?auto_230901 ?auto_230903 ) ( CLEAR ?auto_230901 ) ( IS-CRATE ?auto_230902 ) ( not ( = ?auto_230901 ?auto_230902 ) ) ( AVAILABLE ?auto_230906 ) ( ON ?auto_230901 ?auto_230900 ) ( not ( = ?auto_230900 ?auto_230901 ) ) ( not ( = ?auto_230900 ?auto_230902 ) ) ( not ( = ?auto_230904 ?auto_230903 ) ) ( HOIST-AT ?auto_230905 ?auto_230904 ) ( not ( = ?auto_230906 ?auto_230905 ) ) ( AVAILABLE ?auto_230905 ) ( SURFACE-AT ?auto_230902 ?auto_230904 ) ( ON ?auto_230902 ?auto_230908 ) ( CLEAR ?auto_230902 ) ( not ( = ?auto_230901 ?auto_230908 ) ) ( not ( = ?auto_230902 ?auto_230908 ) ) ( not ( = ?auto_230900 ?auto_230908 ) ) ( TRUCK-AT ?auto_230907 ?auto_230903 ) ( ON ?auto_230896 ?auto_230895 ) ( ON ?auto_230897 ?auto_230896 ) ( ON ?auto_230899 ?auto_230897 ) ( ON ?auto_230898 ?auto_230899 ) ( ON ?auto_230900 ?auto_230898 ) ( not ( = ?auto_230895 ?auto_230896 ) ) ( not ( = ?auto_230895 ?auto_230897 ) ) ( not ( = ?auto_230895 ?auto_230899 ) ) ( not ( = ?auto_230895 ?auto_230898 ) ) ( not ( = ?auto_230895 ?auto_230900 ) ) ( not ( = ?auto_230895 ?auto_230901 ) ) ( not ( = ?auto_230895 ?auto_230902 ) ) ( not ( = ?auto_230895 ?auto_230908 ) ) ( not ( = ?auto_230896 ?auto_230897 ) ) ( not ( = ?auto_230896 ?auto_230899 ) ) ( not ( = ?auto_230896 ?auto_230898 ) ) ( not ( = ?auto_230896 ?auto_230900 ) ) ( not ( = ?auto_230896 ?auto_230901 ) ) ( not ( = ?auto_230896 ?auto_230902 ) ) ( not ( = ?auto_230896 ?auto_230908 ) ) ( not ( = ?auto_230897 ?auto_230899 ) ) ( not ( = ?auto_230897 ?auto_230898 ) ) ( not ( = ?auto_230897 ?auto_230900 ) ) ( not ( = ?auto_230897 ?auto_230901 ) ) ( not ( = ?auto_230897 ?auto_230902 ) ) ( not ( = ?auto_230897 ?auto_230908 ) ) ( not ( = ?auto_230899 ?auto_230898 ) ) ( not ( = ?auto_230899 ?auto_230900 ) ) ( not ( = ?auto_230899 ?auto_230901 ) ) ( not ( = ?auto_230899 ?auto_230902 ) ) ( not ( = ?auto_230899 ?auto_230908 ) ) ( not ( = ?auto_230898 ?auto_230900 ) ) ( not ( = ?auto_230898 ?auto_230901 ) ) ( not ( = ?auto_230898 ?auto_230902 ) ) ( not ( = ?auto_230898 ?auto_230908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230900 ?auto_230901 ?auto_230902 )
      ( MAKE-7CRATE-VERIFY ?auto_230895 ?auto_230896 ?auto_230897 ?auto_230899 ?auto_230898 ?auto_230900 ?auto_230901 ?auto_230902 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230973 - SURFACE
      ?auto_230974 - SURFACE
      ?auto_230975 - SURFACE
      ?auto_230977 - SURFACE
      ?auto_230976 - SURFACE
      ?auto_230978 - SURFACE
      ?auto_230979 - SURFACE
      ?auto_230980 - SURFACE
    )
    :vars
    (
      ?auto_230982 - HOIST
      ?auto_230985 - PLACE
      ?auto_230984 - PLACE
      ?auto_230986 - HOIST
      ?auto_230983 - SURFACE
      ?auto_230981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_230982 ?auto_230985 ) ( IS-CRATE ?auto_230980 ) ( not ( = ?auto_230979 ?auto_230980 ) ) ( not ( = ?auto_230978 ?auto_230979 ) ) ( not ( = ?auto_230978 ?auto_230980 ) ) ( not ( = ?auto_230984 ?auto_230985 ) ) ( HOIST-AT ?auto_230986 ?auto_230984 ) ( not ( = ?auto_230982 ?auto_230986 ) ) ( AVAILABLE ?auto_230986 ) ( SURFACE-AT ?auto_230980 ?auto_230984 ) ( ON ?auto_230980 ?auto_230983 ) ( CLEAR ?auto_230980 ) ( not ( = ?auto_230979 ?auto_230983 ) ) ( not ( = ?auto_230980 ?auto_230983 ) ) ( not ( = ?auto_230978 ?auto_230983 ) ) ( TRUCK-AT ?auto_230981 ?auto_230985 ) ( SURFACE-AT ?auto_230978 ?auto_230985 ) ( CLEAR ?auto_230978 ) ( LIFTING ?auto_230982 ?auto_230979 ) ( IS-CRATE ?auto_230979 ) ( ON ?auto_230974 ?auto_230973 ) ( ON ?auto_230975 ?auto_230974 ) ( ON ?auto_230977 ?auto_230975 ) ( ON ?auto_230976 ?auto_230977 ) ( ON ?auto_230978 ?auto_230976 ) ( not ( = ?auto_230973 ?auto_230974 ) ) ( not ( = ?auto_230973 ?auto_230975 ) ) ( not ( = ?auto_230973 ?auto_230977 ) ) ( not ( = ?auto_230973 ?auto_230976 ) ) ( not ( = ?auto_230973 ?auto_230978 ) ) ( not ( = ?auto_230973 ?auto_230979 ) ) ( not ( = ?auto_230973 ?auto_230980 ) ) ( not ( = ?auto_230973 ?auto_230983 ) ) ( not ( = ?auto_230974 ?auto_230975 ) ) ( not ( = ?auto_230974 ?auto_230977 ) ) ( not ( = ?auto_230974 ?auto_230976 ) ) ( not ( = ?auto_230974 ?auto_230978 ) ) ( not ( = ?auto_230974 ?auto_230979 ) ) ( not ( = ?auto_230974 ?auto_230980 ) ) ( not ( = ?auto_230974 ?auto_230983 ) ) ( not ( = ?auto_230975 ?auto_230977 ) ) ( not ( = ?auto_230975 ?auto_230976 ) ) ( not ( = ?auto_230975 ?auto_230978 ) ) ( not ( = ?auto_230975 ?auto_230979 ) ) ( not ( = ?auto_230975 ?auto_230980 ) ) ( not ( = ?auto_230975 ?auto_230983 ) ) ( not ( = ?auto_230977 ?auto_230976 ) ) ( not ( = ?auto_230977 ?auto_230978 ) ) ( not ( = ?auto_230977 ?auto_230979 ) ) ( not ( = ?auto_230977 ?auto_230980 ) ) ( not ( = ?auto_230977 ?auto_230983 ) ) ( not ( = ?auto_230976 ?auto_230978 ) ) ( not ( = ?auto_230976 ?auto_230979 ) ) ( not ( = ?auto_230976 ?auto_230980 ) ) ( not ( = ?auto_230976 ?auto_230983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230978 ?auto_230979 ?auto_230980 )
      ( MAKE-7CRATE-VERIFY ?auto_230973 ?auto_230974 ?auto_230975 ?auto_230977 ?auto_230976 ?auto_230978 ?auto_230979 ?auto_230980 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231051 - SURFACE
      ?auto_231052 - SURFACE
      ?auto_231053 - SURFACE
      ?auto_231055 - SURFACE
      ?auto_231054 - SURFACE
      ?auto_231056 - SURFACE
      ?auto_231057 - SURFACE
      ?auto_231058 - SURFACE
    )
    :vars
    (
      ?auto_231063 - HOIST
      ?auto_231061 - PLACE
      ?auto_231060 - PLACE
      ?auto_231064 - HOIST
      ?auto_231062 - SURFACE
      ?auto_231059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_231063 ?auto_231061 ) ( IS-CRATE ?auto_231058 ) ( not ( = ?auto_231057 ?auto_231058 ) ) ( not ( = ?auto_231056 ?auto_231057 ) ) ( not ( = ?auto_231056 ?auto_231058 ) ) ( not ( = ?auto_231060 ?auto_231061 ) ) ( HOIST-AT ?auto_231064 ?auto_231060 ) ( not ( = ?auto_231063 ?auto_231064 ) ) ( AVAILABLE ?auto_231064 ) ( SURFACE-AT ?auto_231058 ?auto_231060 ) ( ON ?auto_231058 ?auto_231062 ) ( CLEAR ?auto_231058 ) ( not ( = ?auto_231057 ?auto_231062 ) ) ( not ( = ?auto_231058 ?auto_231062 ) ) ( not ( = ?auto_231056 ?auto_231062 ) ) ( TRUCK-AT ?auto_231059 ?auto_231061 ) ( SURFACE-AT ?auto_231056 ?auto_231061 ) ( CLEAR ?auto_231056 ) ( IS-CRATE ?auto_231057 ) ( AVAILABLE ?auto_231063 ) ( IN ?auto_231057 ?auto_231059 ) ( ON ?auto_231052 ?auto_231051 ) ( ON ?auto_231053 ?auto_231052 ) ( ON ?auto_231055 ?auto_231053 ) ( ON ?auto_231054 ?auto_231055 ) ( ON ?auto_231056 ?auto_231054 ) ( not ( = ?auto_231051 ?auto_231052 ) ) ( not ( = ?auto_231051 ?auto_231053 ) ) ( not ( = ?auto_231051 ?auto_231055 ) ) ( not ( = ?auto_231051 ?auto_231054 ) ) ( not ( = ?auto_231051 ?auto_231056 ) ) ( not ( = ?auto_231051 ?auto_231057 ) ) ( not ( = ?auto_231051 ?auto_231058 ) ) ( not ( = ?auto_231051 ?auto_231062 ) ) ( not ( = ?auto_231052 ?auto_231053 ) ) ( not ( = ?auto_231052 ?auto_231055 ) ) ( not ( = ?auto_231052 ?auto_231054 ) ) ( not ( = ?auto_231052 ?auto_231056 ) ) ( not ( = ?auto_231052 ?auto_231057 ) ) ( not ( = ?auto_231052 ?auto_231058 ) ) ( not ( = ?auto_231052 ?auto_231062 ) ) ( not ( = ?auto_231053 ?auto_231055 ) ) ( not ( = ?auto_231053 ?auto_231054 ) ) ( not ( = ?auto_231053 ?auto_231056 ) ) ( not ( = ?auto_231053 ?auto_231057 ) ) ( not ( = ?auto_231053 ?auto_231058 ) ) ( not ( = ?auto_231053 ?auto_231062 ) ) ( not ( = ?auto_231055 ?auto_231054 ) ) ( not ( = ?auto_231055 ?auto_231056 ) ) ( not ( = ?auto_231055 ?auto_231057 ) ) ( not ( = ?auto_231055 ?auto_231058 ) ) ( not ( = ?auto_231055 ?auto_231062 ) ) ( not ( = ?auto_231054 ?auto_231056 ) ) ( not ( = ?auto_231054 ?auto_231057 ) ) ( not ( = ?auto_231054 ?auto_231058 ) ) ( not ( = ?auto_231054 ?auto_231062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231056 ?auto_231057 ?auto_231058 )
      ( MAKE-7CRATE-VERIFY ?auto_231051 ?auto_231052 ?auto_231053 ?auto_231055 ?auto_231054 ?auto_231056 ?auto_231057 ?auto_231058 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_233970 - SURFACE
      ?auto_233971 - SURFACE
      ?auto_233972 - SURFACE
      ?auto_233974 - SURFACE
      ?auto_233973 - SURFACE
      ?auto_233975 - SURFACE
      ?auto_233976 - SURFACE
      ?auto_233977 - SURFACE
      ?auto_233978 - SURFACE
    )
    :vars
    (
      ?auto_233980 - HOIST
      ?auto_233979 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_233980 ?auto_233979 ) ( SURFACE-AT ?auto_233977 ?auto_233979 ) ( CLEAR ?auto_233977 ) ( LIFTING ?auto_233980 ?auto_233978 ) ( IS-CRATE ?auto_233978 ) ( not ( = ?auto_233977 ?auto_233978 ) ) ( ON ?auto_233971 ?auto_233970 ) ( ON ?auto_233972 ?auto_233971 ) ( ON ?auto_233974 ?auto_233972 ) ( ON ?auto_233973 ?auto_233974 ) ( ON ?auto_233975 ?auto_233973 ) ( ON ?auto_233976 ?auto_233975 ) ( ON ?auto_233977 ?auto_233976 ) ( not ( = ?auto_233970 ?auto_233971 ) ) ( not ( = ?auto_233970 ?auto_233972 ) ) ( not ( = ?auto_233970 ?auto_233974 ) ) ( not ( = ?auto_233970 ?auto_233973 ) ) ( not ( = ?auto_233970 ?auto_233975 ) ) ( not ( = ?auto_233970 ?auto_233976 ) ) ( not ( = ?auto_233970 ?auto_233977 ) ) ( not ( = ?auto_233970 ?auto_233978 ) ) ( not ( = ?auto_233971 ?auto_233972 ) ) ( not ( = ?auto_233971 ?auto_233974 ) ) ( not ( = ?auto_233971 ?auto_233973 ) ) ( not ( = ?auto_233971 ?auto_233975 ) ) ( not ( = ?auto_233971 ?auto_233976 ) ) ( not ( = ?auto_233971 ?auto_233977 ) ) ( not ( = ?auto_233971 ?auto_233978 ) ) ( not ( = ?auto_233972 ?auto_233974 ) ) ( not ( = ?auto_233972 ?auto_233973 ) ) ( not ( = ?auto_233972 ?auto_233975 ) ) ( not ( = ?auto_233972 ?auto_233976 ) ) ( not ( = ?auto_233972 ?auto_233977 ) ) ( not ( = ?auto_233972 ?auto_233978 ) ) ( not ( = ?auto_233974 ?auto_233973 ) ) ( not ( = ?auto_233974 ?auto_233975 ) ) ( not ( = ?auto_233974 ?auto_233976 ) ) ( not ( = ?auto_233974 ?auto_233977 ) ) ( not ( = ?auto_233974 ?auto_233978 ) ) ( not ( = ?auto_233973 ?auto_233975 ) ) ( not ( = ?auto_233973 ?auto_233976 ) ) ( not ( = ?auto_233973 ?auto_233977 ) ) ( not ( = ?auto_233973 ?auto_233978 ) ) ( not ( = ?auto_233975 ?auto_233976 ) ) ( not ( = ?auto_233975 ?auto_233977 ) ) ( not ( = ?auto_233975 ?auto_233978 ) ) ( not ( = ?auto_233976 ?auto_233977 ) ) ( not ( = ?auto_233976 ?auto_233978 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_233977 ?auto_233978 )
      ( MAKE-8CRATE-VERIFY ?auto_233970 ?auto_233971 ?auto_233972 ?auto_233974 ?auto_233973 ?auto_233975 ?auto_233976 ?auto_233977 ?auto_233978 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234037 - SURFACE
      ?auto_234038 - SURFACE
      ?auto_234039 - SURFACE
      ?auto_234041 - SURFACE
      ?auto_234040 - SURFACE
      ?auto_234042 - SURFACE
      ?auto_234043 - SURFACE
      ?auto_234044 - SURFACE
      ?auto_234045 - SURFACE
    )
    :vars
    (
      ?auto_234047 - HOIST
      ?auto_234048 - PLACE
      ?auto_234046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234047 ?auto_234048 ) ( SURFACE-AT ?auto_234044 ?auto_234048 ) ( CLEAR ?auto_234044 ) ( IS-CRATE ?auto_234045 ) ( not ( = ?auto_234044 ?auto_234045 ) ) ( TRUCK-AT ?auto_234046 ?auto_234048 ) ( AVAILABLE ?auto_234047 ) ( IN ?auto_234045 ?auto_234046 ) ( ON ?auto_234044 ?auto_234043 ) ( not ( = ?auto_234043 ?auto_234044 ) ) ( not ( = ?auto_234043 ?auto_234045 ) ) ( ON ?auto_234038 ?auto_234037 ) ( ON ?auto_234039 ?auto_234038 ) ( ON ?auto_234041 ?auto_234039 ) ( ON ?auto_234040 ?auto_234041 ) ( ON ?auto_234042 ?auto_234040 ) ( ON ?auto_234043 ?auto_234042 ) ( not ( = ?auto_234037 ?auto_234038 ) ) ( not ( = ?auto_234037 ?auto_234039 ) ) ( not ( = ?auto_234037 ?auto_234041 ) ) ( not ( = ?auto_234037 ?auto_234040 ) ) ( not ( = ?auto_234037 ?auto_234042 ) ) ( not ( = ?auto_234037 ?auto_234043 ) ) ( not ( = ?auto_234037 ?auto_234044 ) ) ( not ( = ?auto_234037 ?auto_234045 ) ) ( not ( = ?auto_234038 ?auto_234039 ) ) ( not ( = ?auto_234038 ?auto_234041 ) ) ( not ( = ?auto_234038 ?auto_234040 ) ) ( not ( = ?auto_234038 ?auto_234042 ) ) ( not ( = ?auto_234038 ?auto_234043 ) ) ( not ( = ?auto_234038 ?auto_234044 ) ) ( not ( = ?auto_234038 ?auto_234045 ) ) ( not ( = ?auto_234039 ?auto_234041 ) ) ( not ( = ?auto_234039 ?auto_234040 ) ) ( not ( = ?auto_234039 ?auto_234042 ) ) ( not ( = ?auto_234039 ?auto_234043 ) ) ( not ( = ?auto_234039 ?auto_234044 ) ) ( not ( = ?auto_234039 ?auto_234045 ) ) ( not ( = ?auto_234041 ?auto_234040 ) ) ( not ( = ?auto_234041 ?auto_234042 ) ) ( not ( = ?auto_234041 ?auto_234043 ) ) ( not ( = ?auto_234041 ?auto_234044 ) ) ( not ( = ?auto_234041 ?auto_234045 ) ) ( not ( = ?auto_234040 ?auto_234042 ) ) ( not ( = ?auto_234040 ?auto_234043 ) ) ( not ( = ?auto_234040 ?auto_234044 ) ) ( not ( = ?auto_234040 ?auto_234045 ) ) ( not ( = ?auto_234042 ?auto_234043 ) ) ( not ( = ?auto_234042 ?auto_234044 ) ) ( not ( = ?auto_234042 ?auto_234045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234043 ?auto_234044 ?auto_234045 )
      ( MAKE-8CRATE-VERIFY ?auto_234037 ?auto_234038 ?auto_234039 ?auto_234041 ?auto_234040 ?auto_234042 ?auto_234043 ?auto_234044 ?auto_234045 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234113 - SURFACE
      ?auto_234114 - SURFACE
      ?auto_234115 - SURFACE
      ?auto_234117 - SURFACE
      ?auto_234116 - SURFACE
      ?auto_234118 - SURFACE
      ?auto_234119 - SURFACE
      ?auto_234120 - SURFACE
      ?auto_234121 - SURFACE
    )
    :vars
    (
      ?auto_234122 - HOIST
      ?auto_234125 - PLACE
      ?auto_234123 - TRUCK
      ?auto_234124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234122 ?auto_234125 ) ( SURFACE-AT ?auto_234120 ?auto_234125 ) ( CLEAR ?auto_234120 ) ( IS-CRATE ?auto_234121 ) ( not ( = ?auto_234120 ?auto_234121 ) ) ( AVAILABLE ?auto_234122 ) ( IN ?auto_234121 ?auto_234123 ) ( ON ?auto_234120 ?auto_234119 ) ( not ( = ?auto_234119 ?auto_234120 ) ) ( not ( = ?auto_234119 ?auto_234121 ) ) ( TRUCK-AT ?auto_234123 ?auto_234124 ) ( not ( = ?auto_234124 ?auto_234125 ) ) ( ON ?auto_234114 ?auto_234113 ) ( ON ?auto_234115 ?auto_234114 ) ( ON ?auto_234117 ?auto_234115 ) ( ON ?auto_234116 ?auto_234117 ) ( ON ?auto_234118 ?auto_234116 ) ( ON ?auto_234119 ?auto_234118 ) ( not ( = ?auto_234113 ?auto_234114 ) ) ( not ( = ?auto_234113 ?auto_234115 ) ) ( not ( = ?auto_234113 ?auto_234117 ) ) ( not ( = ?auto_234113 ?auto_234116 ) ) ( not ( = ?auto_234113 ?auto_234118 ) ) ( not ( = ?auto_234113 ?auto_234119 ) ) ( not ( = ?auto_234113 ?auto_234120 ) ) ( not ( = ?auto_234113 ?auto_234121 ) ) ( not ( = ?auto_234114 ?auto_234115 ) ) ( not ( = ?auto_234114 ?auto_234117 ) ) ( not ( = ?auto_234114 ?auto_234116 ) ) ( not ( = ?auto_234114 ?auto_234118 ) ) ( not ( = ?auto_234114 ?auto_234119 ) ) ( not ( = ?auto_234114 ?auto_234120 ) ) ( not ( = ?auto_234114 ?auto_234121 ) ) ( not ( = ?auto_234115 ?auto_234117 ) ) ( not ( = ?auto_234115 ?auto_234116 ) ) ( not ( = ?auto_234115 ?auto_234118 ) ) ( not ( = ?auto_234115 ?auto_234119 ) ) ( not ( = ?auto_234115 ?auto_234120 ) ) ( not ( = ?auto_234115 ?auto_234121 ) ) ( not ( = ?auto_234117 ?auto_234116 ) ) ( not ( = ?auto_234117 ?auto_234118 ) ) ( not ( = ?auto_234117 ?auto_234119 ) ) ( not ( = ?auto_234117 ?auto_234120 ) ) ( not ( = ?auto_234117 ?auto_234121 ) ) ( not ( = ?auto_234116 ?auto_234118 ) ) ( not ( = ?auto_234116 ?auto_234119 ) ) ( not ( = ?auto_234116 ?auto_234120 ) ) ( not ( = ?auto_234116 ?auto_234121 ) ) ( not ( = ?auto_234118 ?auto_234119 ) ) ( not ( = ?auto_234118 ?auto_234120 ) ) ( not ( = ?auto_234118 ?auto_234121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234119 ?auto_234120 ?auto_234121 )
      ( MAKE-8CRATE-VERIFY ?auto_234113 ?auto_234114 ?auto_234115 ?auto_234117 ?auto_234116 ?auto_234118 ?auto_234119 ?auto_234120 ?auto_234121 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234197 - SURFACE
      ?auto_234198 - SURFACE
      ?auto_234199 - SURFACE
      ?auto_234201 - SURFACE
      ?auto_234200 - SURFACE
      ?auto_234202 - SURFACE
      ?auto_234203 - SURFACE
      ?auto_234204 - SURFACE
      ?auto_234205 - SURFACE
    )
    :vars
    (
      ?auto_234210 - HOIST
      ?auto_234207 - PLACE
      ?auto_234206 - TRUCK
      ?auto_234209 - PLACE
      ?auto_234208 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_234210 ?auto_234207 ) ( SURFACE-AT ?auto_234204 ?auto_234207 ) ( CLEAR ?auto_234204 ) ( IS-CRATE ?auto_234205 ) ( not ( = ?auto_234204 ?auto_234205 ) ) ( AVAILABLE ?auto_234210 ) ( ON ?auto_234204 ?auto_234203 ) ( not ( = ?auto_234203 ?auto_234204 ) ) ( not ( = ?auto_234203 ?auto_234205 ) ) ( TRUCK-AT ?auto_234206 ?auto_234209 ) ( not ( = ?auto_234209 ?auto_234207 ) ) ( HOIST-AT ?auto_234208 ?auto_234209 ) ( LIFTING ?auto_234208 ?auto_234205 ) ( not ( = ?auto_234210 ?auto_234208 ) ) ( ON ?auto_234198 ?auto_234197 ) ( ON ?auto_234199 ?auto_234198 ) ( ON ?auto_234201 ?auto_234199 ) ( ON ?auto_234200 ?auto_234201 ) ( ON ?auto_234202 ?auto_234200 ) ( ON ?auto_234203 ?auto_234202 ) ( not ( = ?auto_234197 ?auto_234198 ) ) ( not ( = ?auto_234197 ?auto_234199 ) ) ( not ( = ?auto_234197 ?auto_234201 ) ) ( not ( = ?auto_234197 ?auto_234200 ) ) ( not ( = ?auto_234197 ?auto_234202 ) ) ( not ( = ?auto_234197 ?auto_234203 ) ) ( not ( = ?auto_234197 ?auto_234204 ) ) ( not ( = ?auto_234197 ?auto_234205 ) ) ( not ( = ?auto_234198 ?auto_234199 ) ) ( not ( = ?auto_234198 ?auto_234201 ) ) ( not ( = ?auto_234198 ?auto_234200 ) ) ( not ( = ?auto_234198 ?auto_234202 ) ) ( not ( = ?auto_234198 ?auto_234203 ) ) ( not ( = ?auto_234198 ?auto_234204 ) ) ( not ( = ?auto_234198 ?auto_234205 ) ) ( not ( = ?auto_234199 ?auto_234201 ) ) ( not ( = ?auto_234199 ?auto_234200 ) ) ( not ( = ?auto_234199 ?auto_234202 ) ) ( not ( = ?auto_234199 ?auto_234203 ) ) ( not ( = ?auto_234199 ?auto_234204 ) ) ( not ( = ?auto_234199 ?auto_234205 ) ) ( not ( = ?auto_234201 ?auto_234200 ) ) ( not ( = ?auto_234201 ?auto_234202 ) ) ( not ( = ?auto_234201 ?auto_234203 ) ) ( not ( = ?auto_234201 ?auto_234204 ) ) ( not ( = ?auto_234201 ?auto_234205 ) ) ( not ( = ?auto_234200 ?auto_234202 ) ) ( not ( = ?auto_234200 ?auto_234203 ) ) ( not ( = ?auto_234200 ?auto_234204 ) ) ( not ( = ?auto_234200 ?auto_234205 ) ) ( not ( = ?auto_234202 ?auto_234203 ) ) ( not ( = ?auto_234202 ?auto_234204 ) ) ( not ( = ?auto_234202 ?auto_234205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234203 ?auto_234204 ?auto_234205 )
      ( MAKE-8CRATE-VERIFY ?auto_234197 ?auto_234198 ?auto_234199 ?auto_234201 ?auto_234200 ?auto_234202 ?auto_234203 ?auto_234204 ?auto_234205 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234289 - SURFACE
      ?auto_234290 - SURFACE
      ?auto_234291 - SURFACE
      ?auto_234293 - SURFACE
      ?auto_234292 - SURFACE
      ?auto_234294 - SURFACE
      ?auto_234295 - SURFACE
      ?auto_234296 - SURFACE
      ?auto_234297 - SURFACE
    )
    :vars
    (
      ?auto_234301 - HOIST
      ?auto_234303 - PLACE
      ?auto_234302 - TRUCK
      ?auto_234298 - PLACE
      ?auto_234299 - HOIST
      ?auto_234300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234301 ?auto_234303 ) ( SURFACE-AT ?auto_234296 ?auto_234303 ) ( CLEAR ?auto_234296 ) ( IS-CRATE ?auto_234297 ) ( not ( = ?auto_234296 ?auto_234297 ) ) ( AVAILABLE ?auto_234301 ) ( ON ?auto_234296 ?auto_234295 ) ( not ( = ?auto_234295 ?auto_234296 ) ) ( not ( = ?auto_234295 ?auto_234297 ) ) ( TRUCK-AT ?auto_234302 ?auto_234298 ) ( not ( = ?auto_234298 ?auto_234303 ) ) ( HOIST-AT ?auto_234299 ?auto_234298 ) ( not ( = ?auto_234301 ?auto_234299 ) ) ( AVAILABLE ?auto_234299 ) ( SURFACE-AT ?auto_234297 ?auto_234298 ) ( ON ?auto_234297 ?auto_234300 ) ( CLEAR ?auto_234297 ) ( not ( = ?auto_234296 ?auto_234300 ) ) ( not ( = ?auto_234297 ?auto_234300 ) ) ( not ( = ?auto_234295 ?auto_234300 ) ) ( ON ?auto_234290 ?auto_234289 ) ( ON ?auto_234291 ?auto_234290 ) ( ON ?auto_234293 ?auto_234291 ) ( ON ?auto_234292 ?auto_234293 ) ( ON ?auto_234294 ?auto_234292 ) ( ON ?auto_234295 ?auto_234294 ) ( not ( = ?auto_234289 ?auto_234290 ) ) ( not ( = ?auto_234289 ?auto_234291 ) ) ( not ( = ?auto_234289 ?auto_234293 ) ) ( not ( = ?auto_234289 ?auto_234292 ) ) ( not ( = ?auto_234289 ?auto_234294 ) ) ( not ( = ?auto_234289 ?auto_234295 ) ) ( not ( = ?auto_234289 ?auto_234296 ) ) ( not ( = ?auto_234289 ?auto_234297 ) ) ( not ( = ?auto_234289 ?auto_234300 ) ) ( not ( = ?auto_234290 ?auto_234291 ) ) ( not ( = ?auto_234290 ?auto_234293 ) ) ( not ( = ?auto_234290 ?auto_234292 ) ) ( not ( = ?auto_234290 ?auto_234294 ) ) ( not ( = ?auto_234290 ?auto_234295 ) ) ( not ( = ?auto_234290 ?auto_234296 ) ) ( not ( = ?auto_234290 ?auto_234297 ) ) ( not ( = ?auto_234290 ?auto_234300 ) ) ( not ( = ?auto_234291 ?auto_234293 ) ) ( not ( = ?auto_234291 ?auto_234292 ) ) ( not ( = ?auto_234291 ?auto_234294 ) ) ( not ( = ?auto_234291 ?auto_234295 ) ) ( not ( = ?auto_234291 ?auto_234296 ) ) ( not ( = ?auto_234291 ?auto_234297 ) ) ( not ( = ?auto_234291 ?auto_234300 ) ) ( not ( = ?auto_234293 ?auto_234292 ) ) ( not ( = ?auto_234293 ?auto_234294 ) ) ( not ( = ?auto_234293 ?auto_234295 ) ) ( not ( = ?auto_234293 ?auto_234296 ) ) ( not ( = ?auto_234293 ?auto_234297 ) ) ( not ( = ?auto_234293 ?auto_234300 ) ) ( not ( = ?auto_234292 ?auto_234294 ) ) ( not ( = ?auto_234292 ?auto_234295 ) ) ( not ( = ?auto_234292 ?auto_234296 ) ) ( not ( = ?auto_234292 ?auto_234297 ) ) ( not ( = ?auto_234292 ?auto_234300 ) ) ( not ( = ?auto_234294 ?auto_234295 ) ) ( not ( = ?auto_234294 ?auto_234296 ) ) ( not ( = ?auto_234294 ?auto_234297 ) ) ( not ( = ?auto_234294 ?auto_234300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234295 ?auto_234296 ?auto_234297 )
      ( MAKE-8CRATE-VERIFY ?auto_234289 ?auto_234290 ?auto_234291 ?auto_234293 ?auto_234292 ?auto_234294 ?auto_234295 ?auto_234296 ?auto_234297 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234382 - SURFACE
      ?auto_234383 - SURFACE
      ?auto_234384 - SURFACE
      ?auto_234386 - SURFACE
      ?auto_234385 - SURFACE
      ?auto_234387 - SURFACE
      ?auto_234388 - SURFACE
      ?auto_234389 - SURFACE
      ?auto_234390 - SURFACE
    )
    :vars
    (
      ?auto_234393 - HOIST
      ?auto_234391 - PLACE
      ?auto_234394 - PLACE
      ?auto_234395 - HOIST
      ?auto_234392 - SURFACE
      ?auto_234396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234393 ?auto_234391 ) ( SURFACE-AT ?auto_234389 ?auto_234391 ) ( CLEAR ?auto_234389 ) ( IS-CRATE ?auto_234390 ) ( not ( = ?auto_234389 ?auto_234390 ) ) ( AVAILABLE ?auto_234393 ) ( ON ?auto_234389 ?auto_234388 ) ( not ( = ?auto_234388 ?auto_234389 ) ) ( not ( = ?auto_234388 ?auto_234390 ) ) ( not ( = ?auto_234394 ?auto_234391 ) ) ( HOIST-AT ?auto_234395 ?auto_234394 ) ( not ( = ?auto_234393 ?auto_234395 ) ) ( AVAILABLE ?auto_234395 ) ( SURFACE-AT ?auto_234390 ?auto_234394 ) ( ON ?auto_234390 ?auto_234392 ) ( CLEAR ?auto_234390 ) ( not ( = ?auto_234389 ?auto_234392 ) ) ( not ( = ?auto_234390 ?auto_234392 ) ) ( not ( = ?auto_234388 ?auto_234392 ) ) ( TRUCK-AT ?auto_234396 ?auto_234391 ) ( ON ?auto_234383 ?auto_234382 ) ( ON ?auto_234384 ?auto_234383 ) ( ON ?auto_234386 ?auto_234384 ) ( ON ?auto_234385 ?auto_234386 ) ( ON ?auto_234387 ?auto_234385 ) ( ON ?auto_234388 ?auto_234387 ) ( not ( = ?auto_234382 ?auto_234383 ) ) ( not ( = ?auto_234382 ?auto_234384 ) ) ( not ( = ?auto_234382 ?auto_234386 ) ) ( not ( = ?auto_234382 ?auto_234385 ) ) ( not ( = ?auto_234382 ?auto_234387 ) ) ( not ( = ?auto_234382 ?auto_234388 ) ) ( not ( = ?auto_234382 ?auto_234389 ) ) ( not ( = ?auto_234382 ?auto_234390 ) ) ( not ( = ?auto_234382 ?auto_234392 ) ) ( not ( = ?auto_234383 ?auto_234384 ) ) ( not ( = ?auto_234383 ?auto_234386 ) ) ( not ( = ?auto_234383 ?auto_234385 ) ) ( not ( = ?auto_234383 ?auto_234387 ) ) ( not ( = ?auto_234383 ?auto_234388 ) ) ( not ( = ?auto_234383 ?auto_234389 ) ) ( not ( = ?auto_234383 ?auto_234390 ) ) ( not ( = ?auto_234383 ?auto_234392 ) ) ( not ( = ?auto_234384 ?auto_234386 ) ) ( not ( = ?auto_234384 ?auto_234385 ) ) ( not ( = ?auto_234384 ?auto_234387 ) ) ( not ( = ?auto_234384 ?auto_234388 ) ) ( not ( = ?auto_234384 ?auto_234389 ) ) ( not ( = ?auto_234384 ?auto_234390 ) ) ( not ( = ?auto_234384 ?auto_234392 ) ) ( not ( = ?auto_234386 ?auto_234385 ) ) ( not ( = ?auto_234386 ?auto_234387 ) ) ( not ( = ?auto_234386 ?auto_234388 ) ) ( not ( = ?auto_234386 ?auto_234389 ) ) ( not ( = ?auto_234386 ?auto_234390 ) ) ( not ( = ?auto_234386 ?auto_234392 ) ) ( not ( = ?auto_234385 ?auto_234387 ) ) ( not ( = ?auto_234385 ?auto_234388 ) ) ( not ( = ?auto_234385 ?auto_234389 ) ) ( not ( = ?auto_234385 ?auto_234390 ) ) ( not ( = ?auto_234385 ?auto_234392 ) ) ( not ( = ?auto_234387 ?auto_234388 ) ) ( not ( = ?auto_234387 ?auto_234389 ) ) ( not ( = ?auto_234387 ?auto_234390 ) ) ( not ( = ?auto_234387 ?auto_234392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234388 ?auto_234389 ?auto_234390 )
      ( MAKE-8CRATE-VERIFY ?auto_234382 ?auto_234383 ?auto_234384 ?auto_234386 ?auto_234385 ?auto_234387 ?auto_234388 ?auto_234389 ?auto_234390 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234475 - SURFACE
      ?auto_234476 - SURFACE
      ?auto_234477 - SURFACE
      ?auto_234479 - SURFACE
      ?auto_234478 - SURFACE
      ?auto_234480 - SURFACE
      ?auto_234481 - SURFACE
      ?auto_234482 - SURFACE
      ?auto_234483 - SURFACE
    )
    :vars
    (
      ?auto_234487 - HOIST
      ?auto_234485 - PLACE
      ?auto_234488 - PLACE
      ?auto_234489 - HOIST
      ?auto_234486 - SURFACE
      ?auto_234484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234487 ?auto_234485 ) ( IS-CRATE ?auto_234483 ) ( not ( = ?auto_234482 ?auto_234483 ) ) ( not ( = ?auto_234481 ?auto_234482 ) ) ( not ( = ?auto_234481 ?auto_234483 ) ) ( not ( = ?auto_234488 ?auto_234485 ) ) ( HOIST-AT ?auto_234489 ?auto_234488 ) ( not ( = ?auto_234487 ?auto_234489 ) ) ( AVAILABLE ?auto_234489 ) ( SURFACE-AT ?auto_234483 ?auto_234488 ) ( ON ?auto_234483 ?auto_234486 ) ( CLEAR ?auto_234483 ) ( not ( = ?auto_234482 ?auto_234486 ) ) ( not ( = ?auto_234483 ?auto_234486 ) ) ( not ( = ?auto_234481 ?auto_234486 ) ) ( TRUCK-AT ?auto_234484 ?auto_234485 ) ( SURFACE-AT ?auto_234481 ?auto_234485 ) ( CLEAR ?auto_234481 ) ( LIFTING ?auto_234487 ?auto_234482 ) ( IS-CRATE ?auto_234482 ) ( ON ?auto_234476 ?auto_234475 ) ( ON ?auto_234477 ?auto_234476 ) ( ON ?auto_234479 ?auto_234477 ) ( ON ?auto_234478 ?auto_234479 ) ( ON ?auto_234480 ?auto_234478 ) ( ON ?auto_234481 ?auto_234480 ) ( not ( = ?auto_234475 ?auto_234476 ) ) ( not ( = ?auto_234475 ?auto_234477 ) ) ( not ( = ?auto_234475 ?auto_234479 ) ) ( not ( = ?auto_234475 ?auto_234478 ) ) ( not ( = ?auto_234475 ?auto_234480 ) ) ( not ( = ?auto_234475 ?auto_234481 ) ) ( not ( = ?auto_234475 ?auto_234482 ) ) ( not ( = ?auto_234475 ?auto_234483 ) ) ( not ( = ?auto_234475 ?auto_234486 ) ) ( not ( = ?auto_234476 ?auto_234477 ) ) ( not ( = ?auto_234476 ?auto_234479 ) ) ( not ( = ?auto_234476 ?auto_234478 ) ) ( not ( = ?auto_234476 ?auto_234480 ) ) ( not ( = ?auto_234476 ?auto_234481 ) ) ( not ( = ?auto_234476 ?auto_234482 ) ) ( not ( = ?auto_234476 ?auto_234483 ) ) ( not ( = ?auto_234476 ?auto_234486 ) ) ( not ( = ?auto_234477 ?auto_234479 ) ) ( not ( = ?auto_234477 ?auto_234478 ) ) ( not ( = ?auto_234477 ?auto_234480 ) ) ( not ( = ?auto_234477 ?auto_234481 ) ) ( not ( = ?auto_234477 ?auto_234482 ) ) ( not ( = ?auto_234477 ?auto_234483 ) ) ( not ( = ?auto_234477 ?auto_234486 ) ) ( not ( = ?auto_234479 ?auto_234478 ) ) ( not ( = ?auto_234479 ?auto_234480 ) ) ( not ( = ?auto_234479 ?auto_234481 ) ) ( not ( = ?auto_234479 ?auto_234482 ) ) ( not ( = ?auto_234479 ?auto_234483 ) ) ( not ( = ?auto_234479 ?auto_234486 ) ) ( not ( = ?auto_234478 ?auto_234480 ) ) ( not ( = ?auto_234478 ?auto_234481 ) ) ( not ( = ?auto_234478 ?auto_234482 ) ) ( not ( = ?auto_234478 ?auto_234483 ) ) ( not ( = ?auto_234478 ?auto_234486 ) ) ( not ( = ?auto_234480 ?auto_234481 ) ) ( not ( = ?auto_234480 ?auto_234482 ) ) ( not ( = ?auto_234480 ?auto_234483 ) ) ( not ( = ?auto_234480 ?auto_234486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234481 ?auto_234482 ?auto_234483 )
      ( MAKE-8CRATE-VERIFY ?auto_234475 ?auto_234476 ?auto_234477 ?auto_234479 ?auto_234478 ?auto_234480 ?auto_234481 ?auto_234482 ?auto_234483 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234568 - SURFACE
      ?auto_234569 - SURFACE
      ?auto_234570 - SURFACE
      ?auto_234572 - SURFACE
      ?auto_234571 - SURFACE
      ?auto_234573 - SURFACE
      ?auto_234574 - SURFACE
      ?auto_234575 - SURFACE
      ?auto_234576 - SURFACE
    )
    :vars
    (
      ?auto_234581 - HOIST
      ?auto_234577 - PLACE
      ?auto_234579 - PLACE
      ?auto_234580 - HOIST
      ?auto_234578 - SURFACE
      ?auto_234582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234581 ?auto_234577 ) ( IS-CRATE ?auto_234576 ) ( not ( = ?auto_234575 ?auto_234576 ) ) ( not ( = ?auto_234574 ?auto_234575 ) ) ( not ( = ?auto_234574 ?auto_234576 ) ) ( not ( = ?auto_234579 ?auto_234577 ) ) ( HOIST-AT ?auto_234580 ?auto_234579 ) ( not ( = ?auto_234581 ?auto_234580 ) ) ( AVAILABLE ?auto_234580 ) ( SURFACE-AT ?auto_234576 ?auto_234579 ) ( ON ?auto_234576 ?auto_234578 ) ( CLEAR ?auto_234576 ) ( not ( = ?auto_234575 ?auto_234578 ) ) ( not ( = ?auto_234576 ?auto_234578 ) ) ( not ( = ?auto_234574 ?auto_234578 ) ) ( TRUCK-AT ?auto_234582 ?auto_234577 ) ( SURFACE-AT ?auto_234574 ?auto_234577 ) ( CLEAR ?auto_234574 ) ( IS-CRATE ?auto_234575 ) ( AVAILABLE ?auto_234581 ) ( IN ?auto_234575 ?auto_234582 ) ( ON ?auto_234569 ?auto_234568 ) ( ON ?auto_234570 ?auto_234569 ) ( ON ?auto_234572 ?auto_234570 ) ( ON ?auto_234571 ?auto_234572 ) ( ON ?auto_234573 ?auto_234571 ) ( ON ?auto_234574 ?auto_234573 ) ( not ( = ?auto_234568 ?auto_234569 ) ) ( not ( = ?auto_234568 ?auto_234570 ) ) ( not ( = ?auto_234568 ?auto_234572 ) ) ( not ( = ?auto_234568 ?auto_234571 ) ) ( not ( = ?auto_234568 ?auto_234573 ) ) ( not ( = ?auto_234568 ?auto_234574 ) ) ( not ( = ?auto_234568 ?auto_234575 ) ) ( not ( = ?auto_234568 ?auto_234576 ) ) ( not ( = ?auto_234568 ?auto_234578 ) ) ( not ( = ?auto_234569 ?auto_234570 ) ) ( not ( = ?auto_234569 ?auto_234572 ) ) ( not ( = ?auto_234569 ?auto_234571 ) ) ( not ( = ?auto_234569 ?auto_234573 ) ) ( not ( = ?auto_234569 ?auto_234574 ) ) ( not ( = ?auto_234569 ?auto_234575 ) ) ( not ( = ?auto_234569 ?auto_234576 ) ) ( not ( = ?auto_234569 ?auto_234578 ) ) ( not ( = ?auto_234570 ?auto_234572 ) ) ( not ( = ?auto_234570 ?auto_234571 ) ) ( not ( = ?auto_234570 ?auto_234573 ) ) ( not ( = ?auto_234570 ?auto_234574 ) ) ( not ( = ?auto_234570 ?auto_234575 ) ) ( not ( = ?auto_234570 ?auto_234576 ) ) ( not ( = ?auto_234570 ?auto_234578 ) ) ( not ( = ?auto_234572 ?auto_234571 ) ) ( not ( = ?auto_234572 ?auto_234573 ) ) ( not ( = ?auto_234572 ?auto_234574 ) ) ( not ( = ?auto_234572 ?auto_234575 ) ) ( not ( = ?auto_234572 ?auto_234576 ) ) ( not ( = ?auto_234572 ?auto_234578 ) ) ( not ( = ?auto_234571 ?auto_234573 ) ) ( not ( = ?auto_234571 ?auto_234574 ) ) ( not ( = ?auto_234571 ?auto_234575 ) ) ( not ( = ?auto_234571 ?auto_234576 ) ) ( not ( = ?auto_234571 ?auto_234578 ) ) ( not ( = ?auto_234573 ?auto_234574 ) ) ( not ( = ?auto_234573 ?auto_234575 ) ) ( not ( = ?auto_234573 ?auto_234576 ) ) ( not ( = ?auto_234573 ?auto_234578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234574 ?auto_234575 ?auto_234576 )
      ( MAKE-8CRATE-VERIFY ?auto_234568 ?auto_234569 ?auto_234570 ?auto_234572 ?auto_234571 ?auto_234573 ?auto_234574 ?auto_234575 ?auto_234576 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_234611 - SURFACE
      ?auto_234612 - SURFACE
      ?auto_234613 - SURFACE
      ?auto_234615 - SURFACE
      ?auto_234614 - SURFACE
    )
    :vars
    (
      ?auto_234619 - HOIST
      ?auto_234617 - PLACE
      ?auto_234616 - PLACE
      ?auto_234618 - HOIST
      ?auto_234621 - SURFACE
      ?auto_234620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234619 ?auto_234617 ) ( IS-CRATE ?auto_234614 ) ( not ( = ?auto_234615 ?auto_234614 ) ) ( not ( = ?auto_234613 ?auto_234615 ) ) ( not ( = ?auto_234613 ?auto_234614 ) ) ( not ( = ?auto_234616 ?auto_234617 ) ) ( HOIST-AT ?auto_234618 ?auto_234616 ) ( not ( = ?auto_234619 ?auto_234618 ) ) ( AVAILABLE ?auto_234618 ) ( SURFACE-AT ?auto_234614 ?auto_234616 ) ( ON ?auto_234614 ?auto_234621 ) ( CLEAR ?auto_234614 ) ( not ( = ?auto_234615 ?auto_234621 ) ) ( not ( = ?auto_234614 ?auto_234621 ) ) ( not ( = ?auto_234613 ?auto_234621 ) ) ( SURFACE-AT ?auto_234613 ?auto_234617 ) ( CLEAR ?auto_234613 ) ( IS-CRATE ?auto_234615 ) ( AVAILABLE ?auto_234619 ) ( IN ?auto_234615 ?auto_234620 ) ( TRUCK-AT ?auto_234620 ?auto_234616 ) ( ON ?auto_234612 ?auto_234611 ) ( ON ?auto_234613 ?auto_234612 ) ( not ( = ?auto_234611 ?auto_234612 ) ) ( not ( = ?auto_234611 ?auto_234613 ) ) ( not ( = ?auto_234611 ?auto_234615 ) ) ( not ( = ?auto_234611 ?auto_234614 ) ) ( not ( = ?auto_234611 ?auto_234621 ) ) ( not ( = ?auto_234612 ?auto_234613 ) ) ( not ( = ?auto_234612 ?auto_234615 ) ) ( not ( = ?auto_234612 ?auto_234614 ) ) ( not ( = ?auto_234612 ?auto_234621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234613 ?auto_234615 ?auto_234614 )
      ( MAKE-4CRATE-VERIFY ?auto_234611 ?auto_234612 ?auto_234613 ?auto_234615 ?auto_234614 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_234622 - SURFACE
      ?auto_234623 - SURFACE
      ?auto_234624 - SURFACE
      ?auto_234626 - SURFACE
      ?auto_234625 - SURFACE
      ?auto_234627 - SURFACE
    )
    :vars
    (
      ?auto_234631 - HOIST
      ?auto_234629 - PLACE
      ?auto_234628 - PLACE
      ?auto_234630 - HOIST
      ?auto_234633 - SURFACE
      ?auto_234632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234631 ?auto_234629 ) ( IS-CRATE ?auto_234627 ) ( not ( = ?auto_234625 ?auto_234627 ) ) ( not ( = ?auto_234626 ?auto_234625 ) ) ( not ( = ?auto_234626 ?auto_234627 ) ) ( not ( = ?auto_234628 ?auto_234629 ) ) ( HOIST-AT ?auto_234630 ?auto_234628 ) ( not ( = ?auto_234631 ?auto_234630 ) ) ( AVAILABLE ?auto_234630 ) ( SURFACE-AT ?auto_234627 ?auto_234628 ) ( ON ?auto_234627 ?auto_234633 ) ( CLEAR ?auto_234627 ) ( not ( = ?auto_234625 ?auto_234633 ) ) ( not ( = ?auto_234627 ?auto_234633 ) ) ( not ( = ?auto_234626 ?auto_234633 ) ) ( SURFACE-AT ?auto_234626 ?auto_234629 ) ( CLEAR ?auto_234626 ) ( IS-CRATE ?auto_234625 ) ( AVAILABLE ?auto_234631 ) ( IN ?auto_234625 ?auto_234632 ) ( TRUCK-AT ?auto_234632 ?auto_234628 ) ( ON ?auto_234623 ?auto_234622 ) ( ON ?auto_234624 ?auto_234623 ) ( ON ?auto_234626 ?auto_234624 ) ( not ( = ?auto_234622 ?auto_234623 ) ) ( not ( = ?auto_234622 ?auto_234624 ) ) ( not ( = ?auto_234622 ?auto_234626 ) ) ( not ( = ?auto_234622 ?auto_234625 ) ) ( not ( = ?auto_234622 ?auto_234627 ) ) ( not ( = ?auto_234622 ?auto_234633 ) ) ( not ( = ?auto_234623 ?auto_234624 ) ) ( not ( = ?auto_234623 ?auto_234626 ) ) ( not ( = ?auto_234623 ?auto_234625 ) ) ( not ( = ?auto_234623 ?auto_234627 ) ) ( not ( = ?auto_234623 ?auto_234633 ) ) ( not ( = ?auto_234624 ?auto_234626 ) ) ( not ( = ?auto_234624 ?auto_234625 ) ) ( not ( = ?auto_234624 ?auto_234627 ) ) ( not ( = ?auto_234624 ?auto_234633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234626 ?auto_234625 ?auto_234627 )
      ( MAKE-5CRATE-VERIFY ?auto_234622 ?auto_234623 ?auto_234624 ?auto_234626 ?auto_234625 ?auto_234627 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_234634 - SURFACE
      ?auto_234635 - SURFACE
      ?auto_234636 - SURFACE
      ?auto_234638 - SURFACE
      ?auto_234637 - SURFACE
      ?auto_234639 - SURFACE
      ?auto_234640 - SURFACE
    )
    :vars
    (
      ?auto_234644 - HOIST
      ?auto_234642 - PLACE
      ?auto_234641 - PLACE
      ?auto_234643 - HOIST
      ?auto_234646 - SURFACE
      ?auto_234645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234644 ?auto_234642 ) ( IS-CRATE ?auto_234640 ) ( not ( = ?auto_234639 ?auto_234640 ) ) ( not ( = ?auto_234637 ?auto_234639 ) ) ( not ( = ?auto_234637 ?auto_234640 ) ) ( not ( = ?auto_234641 ?auto_234642 ) ) ( HOIST-AT ?auto_234643 ?auto_234641 ) ( not ( = ?auto_234644 ?auto_234643 ) ) ( AVAILABLE ?auto_234643 ) ( SURFACE-AT ?auto_234640 ?auto_234641 ) ( ON ?auto_234640 ?auto_234646 ) ( CLEAR ?auto_234640 ) ( not ( = ?auto_234639 ?auto_234646 ) ) ( not ( = ?auto_234640 ?auto_234646 ) ) ( not ( = ?auto_234637 ?auto_234646 ) ) ( SURFACE-AT ?auto_234637 ?auto_234642 ) ( CLEAR ?auto_234637 ) ( IS-CRATE ?auto_234639 ) ( AVAILABLE ?auto_234644 ) ( IN ?auto_234639 ?auto_234645 ) ( TRUCK-AT ?auto_234645 ?auto_234641 ) ( ON ?auto_234635 ?auto_234634 ) ( ON ?auto_234636 ?auto_234635 ) ( ON ?auto_234638 ?auto_234636 ) ( ON ?auto_234637 ?auto_234638 ) ( not ( = ?auto_234634 ?auto_234635 ) ) ( not ( = ?auto_234634 ?auto_234636 ) ) ( not ( = ?auto_234634 ?auto_234638 ) ) ( not ( = ?auto_234634 ?auto_234637 ) ) ( not ( = ?auto_234634 ?auto_234639 ) ) ( not ( = ?auto_234634 ?auto_234640 ) ) ( not ( = ?auto_234634 ?auto_234646 ) ) ( not ( = ?auto_234635 ?auto_234636 ) ) ( not ( = ?auto_234635 ?auto_234638 ) ) ( not ( = ?auto_234635 ?auto_234637 ) ) ( not ( = ?auto_234635 ?auto_234639 ) ) ( not ( = ?auto_234635 ?auto_234640 ) ) ( not ( = ?auto_234635 ?auto_234646 ) ) ( not ( = ?auto_234636 ?auto_234638 ) ) ( not ( = ?auto_234636 ?auto_234637 ) ) ( not ( = ?auto_234636 ?auto_234639 ) ) ( not ( = ?auto_234636 ?auto_234640 ) ) ( not ( = ?auto_234636 ?auto_234646 ) ) ( not ( = ?auto_234638 ?auto_234637 ) ) ( not ( = ?auto_234638 ?auto_234639 ) ) ( not ( = ?auto_234638 ?auto_234640 ) ) ( not ( = ?auto_234638 ?auto_234646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234637 ?auto_234639 ?auto_234640 )
      ( MAKE-6CRATE-VERIFY ?auto_234634 ?auto_234635 ?auto_234636 ?auto_234638 ?auto_234637 ?auto_234639 ?auto_234640 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_234647 - SURFACE
      ?auto_234648 - SURFACE
      ?auto_234649 - SURFACE
      ?auto_234651 - SURFACE
      ?auto_234650 - SURFACE
      ?auto_234652 - SURFACE
      ?auto_234653 - SURFACE
      ?auto_234654 - SURFACE
    )
    :vars
    (
      ?auto_234658 - HOIST
      ?auto_234656 - PLACE
      ?auto_234655 - PLACE
      ?auto_234657 - HOIST
      ?auto_234660 - SURFACE
      ?auto_234659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234658 ?auto_234656 ) ( IS-CRATE ?auto_234654 ) ( not ( = ?auto_234653 ?auto_234654 ) ) ( not ( = ?auto_234652 ?auto_234653 ) ) ( not ( = ?auto_234652 ?auto_234654 ) ) ( not ( = ?auto_234655 ?auto_234656 ) ) ( HOIST-AT ?auto_234657 ?auto_234655 ) ( not ( = ?auto_234658 ?auto_234657 ) ) ( AVAILABLE ?auto_234657 ) ( SURFACE-AT ?auto_234654 ?auto_234655 ) ( ON ?auto_234654 ?auto_234660 ) ( CLEAR ?auto_234654 ) ( not ( = ?auto_234653 ?auto_234660 ) ) ( not ( = ?auto_234654 ?auto_234660 ) ) ( not ( = ?auto_234652 ?auto_234660 ) ) ( SURFACE-AT ?auto_234652 ?auto_234656 ) ( CLEAR ?auto_234652 ) ( IS-CRATE ?auto_234653 ) ( AVAILABLE ?auto_234658 ) ( IN ?auto_234653 ?auto_234659 ) ( TRUCK-AT ?auto_234659 ?auto_234655 ) ( ON ?auto_234648 ?auto_234647 ) ( ON ?auto_234649 ?auto_234648 ) ( ON ?auto_234651 ?auto_234649 ) ( ON ?auto_234650 ?auto_234651 ) ( ON ?auto_234652 ?auto_234650 ) ( not ( = ?auto_234647 ?auto_234648 ) ) ( not ( = ?auto_234647 ?auto_234649 ) ) ( not ( = ?auto_234647 ?auto_234651 ) ) ( not ( = ?auto_234647 ?auto_234650 ) ) ( not ( = ?auto_234647 ?auto_234652 ) ) ( not ( = ?auto_234647 ?auto_234653 ) ) ( not ( = ?auto_234647 ?auto_234654 ) ) ( not ( = ?auto_234647 ?auto_234660 ) ) ( not ( = ?auto_234648 ?auto_234649 ) ) ( not ( = ?auto_234648 ?auto_234651 ) ) ( not ( = ?auto_234648 ?auto_234650 ) ) ( not ( = ?auto_234648 ?auto_234652 ) ) ( not ( = ?auto_234648 ?auto_234653 ) ) ( not ( = ?auto_234648 ?auto_234654 ) ) ( not ( = ?auto_234648 ?auto_234660 ) ) ( not ( = ?auto_234649 ?auto_234651 ) ) ( not ( = ?auto_234649 ?auto_234650 ) ) ( not ( = ?auto_234649 ?auto_234652 ) ) ( not ( = ?auto_234649 ?auto_234653 ) ) ( not ( = ?auto_234649 ?auto_234654 ) ) ( not ( = ?auto_234649 ?auto_234660 ) ) ( not ( = ?auto_234651 ?auto_234650 ) ) ( not ( = ?auto_234651 ?auto_234652 ) ) ( not ( = ?auto_234651 ?auto_234653 ) ) ( not ( = ?auto_234651 ?auto_234654 ) ) ( not ( = ?auto_234651 ?auto_234660 ) ) ( not ( = ?auto_234650 ?auto_234652 ) ) ( not ( = ?auto_234650 ?auto_234653 ) ) ( not ( = ?auto_234650 ?auto_234654 ) ) ( not ( = ?auto_234650 ?auto_234660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234652 ?auto_234653 ?auto_234654 )
      ( MAKE-7CRATE-VERIFY ?auto_234647 ?auto_234648 ?auto_234649 ?auto_234651 ?auto_234650 ?auto_234652 ?auto_234653 ?auto_234654 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234661 - SURFACE
      ?auto_234662 - SURFACE
      ?auto_234663 - SURFACE
      ?auto_234665 - SURFACE
      ?auto_234664 - SURFACE
      ?auto_234666 - SURFACE
      ?auto_234667 - SURFACE
      ?auto_234668 - SURFACE
      ?auto_234669 - SURFACE
    )
    :vars
    (
      ?auto_234673 - HOIST
      ?auto_234671 - PLACE
      ?auto_234670 - PLACE
      ?auto_234672 - HOIST
      ?auto_234675 - SURFACE
      ?auto_234674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234673 ?auto_234671 ) ( IS-CRATE ?auto_234669 ) ( not ( = ?auto_234668 ?auto_234669 ) ) ( not ( = ?auto_234667 ?auto_234668 ) ) ( not ( = ?auto_234667 ?auto_234669 ) ) ( not ( = ?auto_234670 ?auto_234671 ) ) ( HOIST-AT ?auto_234672 ?auto_234670 ) ( not ( = ?auto_234673 ?auto_234672 ) ) ( AVAILABLE ?auto_234672 ) ( SURFACE-AT ?auto_234669 ?auto_234670 ) ( ON ?auto_234669 ?auto_234675 ) ( CLEAR ?auto_234669 ) ( not ( = ?auto_234668 ?auto_234675 ) ) ( not ( = ?auto_234669 ?auto_234675 ) ) ( not ( = ?auto_234667 ?auto_234675 ) ) ( SURFACE-AT ?auto_234667 ?auto_234671 ) ( CLEAR ?auto_234667 ) ( IS-CRATE ?auto_234668 ) ( AVAILABLE ?auto_234673 ) ( IN ?auto_234668 ?auto_234674 ) ( TRUCK-AT ?auto_234674 ?auto_234670 ) ( ON ?auto_234662 ?auto_234661 ) ( ON ?auto_234663 ?auto_234662 ) ( ON ?auto_234665 ?auto_234663 ) ( ON ?auto_234664 ?auto_234665 ) ( ON ?auto_234666 ?auto_234664 ) ( ON ?auto_234667 ?auto_234666 ) ( not ( = ?auto_234661 ?auto_234662 ) ) ( not ( = ?auto_234661 ?auto_234663 ) ) ( not ( = ?auto_234661 ?auto_234665 ) ) ( not ( = ?auto_234661 ?auto_234664 ) ) ( not ( = ?auto_234661 ?auto_234666 ) ) ( not ( = ?auto_234661 ?auto_234667 ) ) ( not ( = ?auto_234661 ?auto_234668 ) ) ( not ( = ?auto_234661 ?auto_234669 ) ) ( not ( = ?auto_234661 ?auto_234675 ) ) ( not ( = ?auto_234662 ?auto_234663 ) ) ( not ( = ?auto_234662 ?auto_234665 ) ) ( not ( = ?auto_234662 ?auto_234664 ) ) ( not ( = ?auto_234662 ?auto_234666 ) ) ( not ( = ?auto_234662 ?auto_234667 ) ) ( not ( = ?auto_234662 ?auto_234668 ) ) ( not ( = ?auto_234662 ?auto_234669 ) ) ( not ( = ?auto_234662 ?auto_234675 ) ) ( not ( = ?auto_234663 ?auto_234665 ) ) ( not ( = ?auto_234663 ?auto_234664 ) ) ( not ( = ?auto_234663 ?auto_234666 ) ) ( not ( = ?auto_234663 ?auto_234667 ) ) ( not ( = ?auto_234663 ?auto_234668 ) ) ( not ( = ?auto_234663 ?auto_234669 ) ) ( not ( = ?auto_234663 ?auto_234675 ) ) ( not ( = ?auto_234665 ?auto_234664 ) ) ( not ( = ?auto_234665 ?auto_234666 ) ) ( not ( = ?auto_234665 ?auto_234667 ) ) ( not ( = ?auto_234665 ?auto_234668 ) ) ( not ( = ?auto_234665 ?auto_234669 ) ) ( not ( = ?auto_234665 ?auto_234675 ) ) ( not ( = ?auto_234664 ?auto_234666 ) ) ( not ( = ?auto_234664 ?auto_234667 ) ) ( not ( = ?auto_234664 ?auto_234668 ) ) ( not ( = ?auto_234664 ?auto_234669 ) ) ( not ( = ?auto_234664 ?auto_234675 ) ) ( not ( = ?auto_234666 ?auto_234667 ) ) ( not ( = ?auto_234666 ?auto_234668 ) ) ( not ( = ?auto_234666 ?auto_234669 ) ) ( not ( = ?auto_234666 ?auto_234675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234667 ?auto_234668 ?auto_234669 )
      ( MAKE-8CRATE-VERIFY ?auto_234661 ?auto_234662 ?auto_234663 ?auto_234665 ?auto_234664 ?auto_234666 ?auto_234667 ?auto_234668 ?auto_234669 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_234704 - SURFACE
      ?auto_234705 - SURFACE
      ?auto_234706 - SURFACE
      ?auto_234708 - SURFACE
      ?auto_234707 - SURFACE
    )
    :vars
    (
      ?auto_234711 - HOIST
      ?auto_234712 - PLACE
      ?auto_234709 - PLACE
      ?auto_234710 - HOIST
      ?auto_234714 - SURFACE
      ?auto_234713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234711 ?auto_234712 ) ( IS-CRATE ?auto_234707 ) ( not ( = ?auto_234708 ?auto_234707 ) ) ( not ( = ?auto_234706 ?auto_234708 ) ) ( not ( = ?auto_234706 ?auto_234707 ) ) ( not ( = ?auto_234709 ?auto_234712 ) ) ( HOIST-AT ?auto_234710 ?auto_234709 ) ( not ( = ?auto_234711 ?auto_234710 ) ) ( SURFACE-AT ?auto_234707 ?auto_234709 ) ( ON ?auto_234707 ?auto_234714 ) ( CLEAR ?auto_234707 ) ( not ( = ?auto_234708 ?auto_234714 ) ) ( not ( = ?auto_234707 ?auto_234714 ) ) ( not ( = ?auto_234706 ?auto_234714 ) ) ( SURFACE-AT ?auto_234706 ?auto_234712 ) ( CLEAR ?auto_234706 ) ( IS-CRATE ?auto_234708 ) ( AVAILABLE ?auto_234711 ) ( TRUCK-AT ?auto_234713 ?auto_234709 ) ( LIFTING ?auto_234710 ?auto_234708 ) ( ON ?auto_234705 ?auto_234704 ) ( ON ?auto_234706 ?auto_234705 ) ( not ( = ?auto_234704 ?auto_234705 ) ) ( not ( = ?auto_234704 ?auto_234706 ) ) ( not ( = ?auto_234704 ?auto_234708 ) ) ( not ( = ?auto_234704 ?auto_234707 ) ) ( not ( = ?auto_234704 ?auto_234714 ) ) ( not ( = ?auto_234705 ?auto_234706 ) ) ( not ( = ?auto_234705 ?auto_234708 ) ) ( not ( = ?auto_234705 ?auto_234707 ) ) ( not ( = ?auto_234705 ?auto_234714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234706 ?auto_234708 ?auto_234707 )
      ( MAKE-4CRATE-VERIFY ?auto_234704 ?auto_234705 ?auto_234706 ?auto_234708 ?auto_234707 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_234715 - SURFACE
      ?auto_234716 - SURFACE
      ?auto_234717 - SURFACE
      ?auto_234719 - SURFACE
      ?auto_234718 - SURFACE
      ?auto_234720 - SURFACE
    )
    :vars
    (
      ?auto_234723 - HOIST
      ?auto_234724 - PLACE
      ?auto_234721 - PLACE
      ?auto_234722 - HOIST
      ?auto_234726 - SURFACE
      ?auto_234725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234723 ?auto_234724 ) ( IS-CRATE ?auto_234720 ) ( not ( = ?auto_234718 ?auto_234720 ) ) ( not ( = ?auto_234719 ?auto_234718 ) ) ( not ( = ?auto_234719 ?auto_234720 ) ) ( not ( = ?auto_234721 ?auto_234724 ) ) ( HOIST-AT ?auto_234722 ?auto_234721 ) ( not ( = ?auto_234723 ?auto_234722 ) ) ( SURFACE-AT ?auto_234720 ?auto_234721 ) ( ON ?auto_234720 ?auto_234726 ) ( CLEAR ?auto_234720 ) ( not ( = ?auto_234718 ?auto_234726 ) ) ( not ( = ?auto_234720 ?auto_234726 ) ) ( not ( = ?auto_234719 ?auto_234726 ) ) ( SURFACE-AT ?auto_234719 ?auto_234724 ) ( CLEAR ?auto_234719 ) ( IS-CRATE ?auto_234718 ) ( AVAILABLE ?auto_234723 ) ( TRUCK-AT ?auto_234725 ?auto_234721 ) ( LIFTING ?auto_234722 ?auto_234718 ) ( ON ?auto_234716 ?auto_234715 ) ( ON ?auto_234717 ?auto_234716 ) ( ON ?auto_234719 ?auto_234717 ) ( not ( = ?auto_234715 ?auto_234716 ) ) ( not ( = ?auto_234715 ?auto_234717 ) ) ( not ( = ?auto_234715 ?auto_234719 ) ) ( not ( = ?auto_234715 ?auto_234718 ) ) ( not ( = ?auto_234715 ?auto_234720 ) ) ( not ( = ?auto_234715 ?auto_234726 ) ) ( not ( = ?auto_234716 ?auto_234717 ) ) ( not ( = ?auto_234716 ?auto_234719 ) ) ( not ( = ?auto_234716 ?auto_234718 ) ) ( not ( = ?auto_234716 ?auto_234720 ) ) ( not ( = ?auto_234716 ?auto_234726 ) ) ( not ( = ?auto_234717 ?auto_234719 ) ) ( not ( = ?auto_234717 ?auto_234718 ) ) ( not ( = ?auto_234717 ?auto_234720 ) ) ( not ( = ?auto_234717 ?auto_234726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234719 ?auto_234718 ?auto_234720 )
      ( MAKE-5CRATE-VERIFY ?auto_234715 ?auto_234716 ?auto_234717 ?auto_234719 ?auto_234718 ?auto_234720 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_234727 - SURFACE
      ?auto_234728 - SURFACE
      ?auto_234729 - SURFACE
      ?auto_234731 - SURFACE
      ?auto_234730 - SURFACE
      ?auto_234732 - SURFACE
      ?auto_234733 - SURFACE
    )
    :vars
    (
      ?auto_234736 - HOIST
      ?auto_234737 - PLACE
      ?auto_234734 - PLACE
      ?auto_234735 - HOIST
      ?auto_234739 - SURFACE
      ?auto_234738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234736 ?auto_234737 ) ( IS-CRATE ?auto_234733 ) ( not ( = ?auto_234732 ?auto_234733 ) ) ( not ( = ?auto_234730 ?auto_234732 ) ) ( not ( = ?auto_234730 ?auto_234733 ) ) ( not ( = ?auto_234734 ?auto_234737 ) ) ( HOIST-AT ?auto_234735 ?auto_234734 ) ( not ( = ?auto_234736 ?auto_234735 ) ) ( SURFACE-AT ?auto_234733 ?auto_234734 ) ( ON ?auto_234733 ?auto_234739 ) ( CLEAR ?auto_234733 ) ( not ( = ?auto_234732 ?auto_234739 ) ) ( not ( = ?auto_234733 ?auto_234739 ) ) ( not ( = ?auto_234730 ?auto_234739 ) ) ( SURFACE-AT ?auto_234730 ?auto_234737 ) ( CLEAR ?auto_234730 ) ( IS-CRATE ?auto_234732 ) ( AVAILABLE ?auto_234736 ) ( TRUCK-AT ?auto_234738 ?auto_234734 ) ( LIFTING ?auto_234735 ?auto_234732 ) ( ON ?auto_234728 ?auto_234727 ) ( ON ?auto_234729 ?auto_234728 ) ( ON ?auto_234731 ?auto_234729 ) ( ON ?auto_234730 ?auto_234731 ) ( not ( = ?auto_234727 ?auto_234728 ) ) ( not ( = ?auto_234727 ?auto_234729 ) ) ( not ( = ?auto_234727 ?auto_234731 ) ) ( not ( = ?auto_234727 ?auto_234730 ) ) ( not ( = ?auto_234727 ?auto_234732 ) ) ( not ( = ?auto_234727 ?auto_234733 ) ) ( not ( = ?auto_234727 ?auto_234739 ) ) ( not ( = ?auto_234728 ?auto_234729 ) ) ( not ( = ?auto_234728 ?auto_234731 ) ) ( not ( = ?auto_234728 ?auto_234730 ) ) ( not ( = ?auto_234728 ?auto_234732 ) ) ( not ( = ?auto_234728 ?auto_234733 ) ) ( not ( = ?auto_234728 ?auto_234739 ) ) ( not ( = ?auto_234729 ?auto_234731 ) ) ( not ( = ?auto_234729 ?auto_234730 ) ) ( not ( = ?auto_234729 ?auto_234732 ) ) ( not ( = ?auto_234729 ?auto_234733 ) ) ( not ( = ?auto_234729 ?auto_234739 ) ) ( not ( = ?auto_234731 ?auto_234730 ) ) ( not ( = ?auto_234731 ?auto_234732 ) ) ( not ( = ?auto_234731 ?auto_234733 ) ) ( not ( = ?auto_234731 ?auto_234739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234730 ?auto_234732 ?auto_234733 )
      ( MAKE-6CRATE-VERIFY ?auto_234727 ?auto_234728 ?auto_234729 ?auto_234731 ?auto_234730 ?auto_234732 ?auto_234733 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_234740 - SURFACE
      ?auto_234741 - SURFACE
      ?auto_234742 - SURFACE
      ?auto_234744 - SURFACE
      ?auto_234743 - SURFACE
      ?auto_234745 - SURFACE
      ?auto_234746 - SURFACE
      ?auto_234747 - SURFACE
    )
    :vars
    (
      ?auto_234750 - HOIST
      ?auto_234751 - PLACE
      ?auto_234748 - PLACE
      ?auto_234749 - HOIST
      ?auto_234753 - SURFACE
      ?auto_234752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234750 ?auto_234751 ) ( IS-CRATE ?auto_234747 ) ( not ( = ?auto_234746 ?auto_234747 ) ) ( not ( = ?auto_234745 ?auto_234746 ) ) ( not ( = ?auto_234745 ?auto_234747 ) ) ( not ( = ?auto_234748 ?auto_234751 ) ) ( HOIST-AT ?auto_234749 ?auto_234748 ) ( not ( = ?auto_234750 ?auto_234749 ) ) ( SURFACE-AT ?auto_234747 ?auto_234748 ) ( ON ?auto_234747 ?auto_234753 ) ( CLEAR ?auto_234747 ) ( not ( = ?auto_234746 ?auto_234753 ) ) ( not ( = ?auto_234747 ?auto_234753 ) ) ( not ( = ?auto_234745 ?auto_234753 ) ) ( SURFACE-AT ?auto_234745 ?auto_234751 ) ( CLEAR ?auto_234745 ) ( IS-CRATE ?auto_234746 ) ( AVAILABLE ?auto_234750 ) ( TRUCK-AT ?auto_234752 ?auto_234748 ) ( LIFTING ?auto_234749 ?auto_234746 ) ( ON ?auto_234741 ?auto_234740 ) ( ON ?auto_234742 ?auto_234741 ) ( ON ?auto_234744 ?auto_234742 ) ( ON ?auto_234743 ?auto_234744 ) ( ON ?auto_234745 ?auto_234743 ) ( not ( = ?auto_234740 ?auto_234741 ) ) ( not ( = ?auto_234740 ?auto_234742 ) ) ( not ( = ?auto_234740 ?auto_234744 ) ) ( not ( = ?auto_234740 ?auto_234743 ) ) ( not ( = ?auto_234740 ?auto_234745 ) ) ( not ( = ?auto_234740 ?auto_234746 ) ) ( not ( = ?auto_234740 ?auto_234747 ) ) ( not ( = ?auto_234740 ?auto_234753 ) ) ( not ( = ?auto_234741 ?auto_234742 ) ) ( not ( = ?auto_234741 ?auto_234744 ) ) ( not ( = ?auto_234741 ?auto_234743 ) ) ( not ( = ?auto_234741 ?auto_234745 ) ) ( not ( = ?auto_234741 ?auto_234746 ) ) ( not ( = ?auto_234741 ?auto_234747 ) ) ( not ( = ?auto_234741 ?auto_234753 ) ) ( not ( = ?auto_234742 ?auto_234744 ) ) ( not ( = ?auto_234742 ?auto_234743 ) ) ( not ( = ?auto_234742 ?auto_234745 ) ) ( not ( = ?auto_234742 ?auto_234746 ) ) ( not ( = ?auto_234742 ?auto_234747 ) ) ( not ( = ?auto_234742 ?auto_234753 ) ) ( not ( = ?auto_234744 ?auto_234743 ) ) ( not ( = ?auto_234744 ?auto_234745 ) ) ( not ( = ?auto_234744 ?auto_234746 ) ) ( not ( = ?auto_234744 ?auto_234747 ) ) ( not ( = ?auto_234744 ?auto_234753 ) ) ( not ( = ?auto_234743 ?auto_234745 ) ) ( not ( = ?auto_234743 ?auto_234746 ) ) ( not ( = ?auto_234743 ?auto_234747 ) ) ( not ( = ?auto_234743 ?auto_234753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234745 ?auto_234746 ?auto_234747 )
      ( MAKE-7CRATE-VERIFY ?auto_234740 ?auto_234741 ?auto_234742 ?auto_234744 ?auto_234743 ?auto_234745 ?auto_234746 ?auto_234747 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234754 - SURFACE
      ?auto_234755 - SURFACE
      ?auto_234756 - SURFACE
      ?auto_234758 - SURFACE
      ?auto_234757 - SURFACE
      ?auto_234759 - SURFACE
      ?auto_234760 - SURFACE
      ?auto_234761 - SURFACE
      ?auto_234762 - SURFACE
    )
    :vars
    (
      ?auto_234765 - HOIST
      ?auto_234766 - PLACE
      ?auto_234763 - PLACE
      ?auto_234764 - HOIST
      ?auto_234768 - SURFACE
      ?auto_234767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234765 ?auto_234766 ) ( IS-CRATE ?auto_234762 ) ( not ( = ?auto_234761 ?auto_234762 ) ) ( not ( = ?auto_234760 ?auto_234761 ) ) ( not ( = ?auto_234760 ?auto_234762 ) ) ( not ( = ?auto_234763 ?auto_234766 ) ) ( HOIST-AT ?auto_234764 ?auto_234763 ) ( not ( = ?auto_234765 ?auto_234764 ) ) ( SURFACE-AT ?auto_234762 ?auto_234763 ) ( ON ?auto_234762 ?auto_234768 ) ( CLEAR ?auto_234762 ) ( not ( = ?auto_234761 ?auto_234768 ) ) ( not ( = ?auto_234762 ?auto_234768 ) ) ( not ( = ?auto_234760 ?auto_234768 ) ) ( SURFACE-AT ?auto_234760 ?auto_234766 ) ( CLEAR ?auto_234760 ) ( IS-CRATE ?auto_234761 ) ( AVAILABLE ?auto_234765 ) ( TRUCK-AT ?auto_234767 ?auto_234763 ) ( LIFTING ?auto_234764 ?auto_234761 ) ( ON ?auto_234755 ?auto_234754 ) ( ON ?auto_234756 ?auto_234755 ) ( ON ?auto_234758 ?auto_234756 ) ( ON ?auto_234757 ?auto_234758 ) ( ON ?auto_234759 ?auto_234757 ) ( ON ?auto_234760 ?auto_234759 ) ( not ( = ?auto_234754 ?auto_234755 ) ) ( not ( = ?auto_234754 ?auto_234756 ) ) ( not ( = ?auto_234754 ?auto_234758 ) ) ( not ( = ?auto_234754 ?auto_234757 ) ) ( not ( = ?auto_234754 ?auto_234759 ) ) ( not ( = ?auto_234754 ?auto_234760 ) ) ( not ( = ?auto_234754 ?auto_234761 ) ) ( not ( = ?auto_234754 ?auto_234762 ) ) ( not ( = ?auto_234754 ?auto_234768 ) ) ( not ( = ?auto_234755 ?auto_234756 ) ) ( not ( = ?auto_234755 ?auto_234758 ) ) ( not ( = ?auto_234755 ?auto_234757 ) ) ( not ( = ?auto_234755 ?auto_234759 ) ) ( not ( = ?auto_234755 ?auto_234760 ) ) ( not ( = ?auto_234755 ?auto_234761 ) ) ( not ( = ?auto_234755 ?auto_234762 ) ) ( not ( = ?auto_234755 ?auto_234768 ) ) ( not ( = ?auto_234756 ?auto_234758 ) ) ( not ( = ?auto_234756 ?auto_234757 ) ) ( not ( = ?auto_234756 ?auto_234759 ) ) ( not ( = ?auto_234756 ?auto_234760 ) ) ( not ( = ?auto_234756 ?auto_234761 ) ) ( not ( = ?auto_234756 ?auto_234762 ) ) ( not ( = ?auto_234756 ?auto_234768 ) ) ( not ( = ?auto_234758 ?auto_234757 ) ) ( not ( = ?auto_234758 ?auto_234759 ) ) ( not ( = ?auto_234758 ?auto_234760 ) ) ( not ( = ?auto_234758 ?auto_234761 ) ) ( not ( = ?auto_234758 ?auto_234762 ) ) ( not ( = ?auto_234758 ?auto_234768 ) ) ( not ( = ?auto_234757 ?auto_234759 ) ) ( not ( = ?auto_234757 ?auto_234760 ) ) ( not ( = ?auto_234757 ?auto_234761 ) ) ( not ( = ?auto_234757 ?auto_234762 ) ) ( not ( = ?auto_234757 ?auto_234768 ) ) ( not ( = ?auto_234759 ?auto_234760 ) ) ( not ( = ?auto_234759 ?auto_234761 ) ) ( not ( = ?auto_234759 ?auto_234762 ) ) ( not ( = ?auto_234759 ?auto_234768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234760 ?auto_234761 ?auto_234762 )
      ( MAKE-8CRATE-VERIFY ?auto_234754 ?auto_234755 ?auto_234756 ?auto_234758 ?auto_234757 ?auto_234759 ?auto_234760 ?auto_234761 ?auto_234762 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_234800 - SURFACE
      ?auto_234801 - SURFACE
      ?auto_234802 - SURFACE
      ?auto_234804 - SURFACE
      ?auto_234803 - SURFACE
    )
    :vars
    (
      ?auto_234811 - HOIST
      ?auto_234806 - PLACE
      ?auto_234808 - PLACE
      ?auto_234809 - HOIST
      ?auto_234805 - SURFACE
      ?auto_234810 - TRUCK
      ?auto_234807 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234811 ?auto_234806 ) ( IS-CRATE ?auto_234803 ) ( not ( = ?auto_234804 ?auto_234803 ) ) ( not ( = ?auto_234802 ?auto_234804 ) ) ( not ( = ?auto_234802 ?auto_234803 ) ) ( not ( = ?auto_234808 ?auto_234806 ) ) ( HOIST-AT ?auto_234809 ?auto_234808 ) ( not ( = ?auto_234811 ?auto_234809 ) ) ( SURFACE-AT ?auto_234803 ?auto_234808 ) ( ON ?auto_234803 ?auto_234805 ) ( CLEAR ?auto_234803 ) ( not ( = ?auto_234804 ?auto_234805 ) ) ( not ( = ?auto_234803 ?auto_234805 ) ) ( not ( = ?auto_234802 ?auto_234805 ) ) ( SURFACE-AT ?auto_234802 ?auto_234806 ) ( CLEAR ?auto_234802 ) ( IS-CRATE ?auto_234804 ) ( AVAILABLE ?auto_234811 ) ( TRUCK-AT ?auto_234810 ?auto_234808 ) ( AVAILABLE ?auto_234809 ) ( SURFACE-AT ?auto_234804 ?auto_234808 ) ( ON ?auto_234804 ?auto_234807 ) ( CLEAR ?auto_234804 ) ( not ( = ?auto_234804 ?auto_234807 ) ) ( not ( = ?auto_234803 ?auto_234807 ) ) ( not ( = ?auto_234802 ?auto_234807 ) ) ( not ( = ?auto_234805 ?auto_234807 ) ) ( ON ?auto_234801 ?auto_234800 ) ( ON ?auto_234802 ?auto_234801 ) ( not ( = ?auto_234800 ?auto_234801 ) ) ( not ( = ?auto_234800 ?auto_234802 ) ) ( not ( = ?auto_234800 ?auto_234804 ) ) ( not ( = ?auto_234800 ?auto_234803 ) ) ( not ( = ?auto_234800 ?auto_234805 ) ) ( not ( = ?auto_234800 ?auto_234807 ) ) ( not ( = ?auto_234801 ?auto_234802 ) ) ( not ( = ?auto_234801 ?auto_234804 ) ) ( not ( = ?auto_234801 ?auto_234803 ) ) ( not ( = ?auto_234801 ?auto_234805 ) ) ( not ( = ?auto_234801 ?auto_234807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234802 ?auto_234804 ?auto_234803 )
      ( MAKE-4CRATE-VERIFY ?auto_234800 ?auto_234801 ?auto_234802 ?auto_234804 ?auto_234803 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_234812 - SURFACE
      ?auto_234813 - SURFACE
      ?auto_234814 - SURFACE
      ?auto_234816 - SURFACE
      ?auto_234815 - SURFACE
      ?auto_234817 - SURFACE
    )
    :vars
    (
      ?auto_234824 - HOIST
      ?auto_234819 - PLACE
      ?auto_234821 - PLACE
      ?auto_234822 - HOIST
      ?auto_234818 - SURFACE
      ?auto_234823 - TRUCK
      ?auto_234820 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234824 ?auto_234819 ) ( IS-CRATE ?auto_234817 ) ( not ( = ?auto_234815 ?auto_234817 ) ) ( not ( = ?auto_234816 ?auto_234815 ) ) ( not ( = ?auto_234816 ?auto_234817 ) ) ( not ( = ?auto_234821 ?auto_234819 ) ) ( HOIST-AT ?auto_234822 ?auto_234821 ) ( not ( = ?auto_234824 ?auto_234822 ) ) ( SURFACE-AT ?auto_234817 ?auto_234821 ) ( ON ?auto_234817 ?auto_234818 ) ( CLEAR ?auto_234817 ) ( not ( = ?auto_234815 ?auto_234818 ) ) ( not ( = ?auto_234817 ?auto_234818 ) ) ( not ( = ?auto_234816 ?auto_234818 ) ) ( SURFACE-AT ?auto_234816 ?auto_234819 ) ( CLEAR ?auto_234816 ) ( IS-CRATE ?auto_234815 ) ( AVAILABLE ?auto_234824 ) ( TRUCK-AT ?auto_234823 ?auto_234821 ) ( AVAILABLE ?auto_234822 ) ( SURFACE-AT ?auto_234815 ?auto_234821 ) ( ON ?auto_234815 ?auto_234820 ) ( CLEAR ?auto_234815 ) ( not ( = ?auto_234815 ?auto_234820 ) ) ( not ( = ?auto_234817 ?auto_234820 ) ) ( not ( = ?auto_234816 ?auto_234820 ) ) ( not ( = ?auto_234818 ?auto_234820 ) ) ( ON ?auto_234813 ?auto_234812 ) ( ON ?auto_234814 ?auto_234813 ) ( ON ?auto_234816 ?auto_234814 ) ( not ( = ?auto_234812 ?auto_234813 ) ) ( not ( = ?auto_234812 ?auto_234814 ) ) ( not ( = ?auto_234812 ?auto_234816 ) ) ( not ( = ?auto_234812 ?auto_234815 ) ) ( not ( = ?auto_234812 ?auto_234817 ) ) ( not ( = ?auto_234812 ?auto_234818 ) ) ( not ( = ?auto_234812 ?auto_234820 ) ) ( not ( = ?auto_234813 ?auto_234814 ) ) ( not ( = ?auto_234813 ?auto_234816 ) ) ( not ( = ?auto_234813 ?auto_234815 ) ) ( not ( = ?auto_234813 ?auto_234817 ) ) ( not ( = ?auto_234813 ?auto_234818 ) ) ( not ( = ?auto_234813 ?auto_234820 ) ) ( not ( = ?auto_234814 ?auto_234816 ) ) ( not ( = ?auto_234814 ?auto_234815 ) ) ( not ( = ?auto_234814 ?auto_234817 ) ) ( not ( = ?auto_234814 ?auto_234818 ) ) ( not ( = ?auto_234814 ?auto_234820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234816 ?auto_234815 ?auto_234817 )
      ( MAKE-5CRATE-VERIFY ?auto_234812 ?auto_234813 ?auto_234814 ?auto_234816 ?auto_234815 ?auto_234817 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_234825 - SURFACE
      ?auto_234826 - SURFACE
      ?auto_234827 - SURFACE
      ?auto_234829 - SURFACE
      ?auto_234828 - SURFACE
      ?auto_234830 - SURFACE
      ?auto_234831 - SURFACE
    )
    :vars
    (
      ?auto_234838 - HOIST
      ?auto_234833 - PLACE
      ?auto_234835 - PLACE
      ?auto_234836 - HOIST
      ?auto_234832 - SURFACE
      ?auto_234837 - TRUCK
      ?auto_234834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234838 ?auto_234833 ) ( IS-CRATE ?auto_234831 ) ( not ( = ?auto_234830 ?auto_234831 ) ) ( not ( = ?auto_234828 ?auto_234830 ) ) ( not ( = ?auto_234828 ?auto_234831 ) ) ( not ( = ?auto_234835 ?auto_234833 ) ) ( HOIST-AT ?auto_234836 ?auto_234835 ) ( not ( = ?auto_234838 ?auto_234836 ) ) ( SURFACE-AT ?auto_234831 ?auto_234835 ) ( ON ?auto_234831 ?auto_234832 ) ( CLEAR ?auto_234831 ) ( not ( = ?auto_234830 ?auto_234832 ) ) ( not ( = ?auto_234831 ?auto_234832 ) ) ( not ( = ?auto_234828 ?auto_234832 ) ) ( SURFACE-AT ?auto_234828 ?auto_234833 ) ( CLEAR ?auto_234828 ) ( IS-CRATE ?auto_234830 ) ( AVAILABLE ?auto_234838 ) ( TRUCK-AT ?auto_234837 ?auto_234835 ) ( AVAILABLE ?auto_234836 ) ( SURFACE-AT ?auto_234830 ?auto_234835 ) ( ON ?auto_234830 ?auto_234834 ) ( CLEAR ?auto_234830 ) ( not ( = ?auto_234830 ?auto_234834 ) ) ( not ( = ?auto_234831 ?auto_234834 ) ) ( not ( = ?auto_234828 ?auto_234834 ) ) ( not ( = ?auto_234832 ?auto_234834 ) ) ( ON ?auto_234826 ?auto_234825 ) ( ON ?auto_234827 ?auto_234826 ) ( ON ?auto_234829 ?auto_234827 ) ( ON ?auto_234828 ?auto_234829 ) ( not ( = ?auto_234825 ?auto_234826 ) ) ( not ( = ?auto_234825 ?auto_234827 ) ) ( not ( = ?auto_234825 ?auto_234829 ) ) ( not ( = ?auto_234825 ?auto_234828 ) ) ( not ( = ?auto_234825 ?auto_234830 ) ) ( not ( = ?auto_234825 ?auto_234831 ) ) ( not ( = ?auto_234825 ?auto_234832 ) ) ( not ( = ?auto_234825 ?auto_234834 ) ) ( not ( = ?auto_234826 ?auto_234827 ) ) ( not ( = ?auto_234826 ?auto_234829 ) ) ( not ( = ?auto_234826 ?auto_234828 ) ) ( not ( = ?auto_234826 ?auto_234830 ) ) ( not ( = ?auto_234826 ?auto_234831 ) ) ( not ( = ?auto_234826 ?auto_234832 ) ) ( not ( = ?auto_234826 ?auto_234834 ) ) ( not ( = ?auto_234827 ?auto_234829 ) ) ( not ( = ?auto_234827 ?auto_234828 ) ) ( not ( = ?auto_234827 ?auto_234830 ) ) ( not ( = ?auto_234827 ?auto_234831 ) ) ( not ( = ?auto_234827 ?auto_234832 ) ) ( not ( = ?auto_234827 ?auto_234834 ) ) ( not ( = ?auto_234829 ?auto_234828 ) ) ( not ( = ?auto_234829 ?auto_234830 ) ) ( not ( = ?auto_234829 ?auto_234831 ) ) ( not ( = ?auto_234829 ?auto_234832 ) ) ( not ( = ?auto_234829 ?auto_234834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234828 ?auto_234830 ?auto_234831 )
      ( MAKE-6CRATE-VERIFY ?auto_234825 ?auto_234826 ?auto_234827 ?auto_234829 ?auto_234828 ?auto_234830 ?auto_234831 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_234839 - SURFACE
      ?auto_234840 - SURFACE
      ?auto_234841 - SURFACE
      ?auto_234843 - SURFACE
      ?auto_234842 - SURFACE
      ?auto_234844 - SURFACE
      ?auto_234845 - SURFACE
      ?auto_234846 - SURFACE
    )
    :vars
    (
      ?auto_234853 - HOIST
      ?auto_234848 - PLACE
      ?auto_234850 - PLACE
      ?auto_234851 - HOIST
      ?auto_234847 - SURFACE
      ?auto_234852 - TRUCK
      ?auto_234849 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234853 ?auto_234848 ) ( IS-CRATE ?auto_234846 ) ( not ( = ?auto_234845 ?auto_234846 ) ) ( not ( = ?auto_234844 ?auto_234845 ) ) ( not ( = ?auto_234844 ?auto_234846 ) ) ( not ( = ?auto_234850 ?auto_234848 ) ) ( HOIST-AT ?auto_234851 ?auto_234850 ) ( not ( = ?auto_234853 ?auto_234851 ) ) ( SURFACE-AT ?auto_234846 ?auto_234850 ) ( ON ?auto_234846 ?auto_234847 ) ( CLEAR ?auto_234846 ) ( not ( = ?auto_234845 ?auto_234847 ) ) ( not ( = ?auto_234846 ?auto_234847 ) ) ( not ( = ?auto_234844 ?auto_234847 ) ) ( SURFACE-AT ?auto_234844 ?auto_234848 ) ( CLEAR ?auto_234844 ) ( IS-CRATE ?auto_234845 ) ( AVAILABLE ?auto_234853 ) ( TRUCK-AT ?auto_234852 ?auto_234850 ) ( AVAILABLE ?auto_234851 ) ( SURFACE-AT ?auto_234845 ?auto_234850 ) ( ON ?auto_234845 ?auto_234849 ) ( CLEAR ?auto_234845 ) ( not ( = ?auto_234845 ?auto_234849 ) ) ( not ( = ?auto_234846 ?auto_234849 ) ) ( not ( = ?auto_234844 ?auto_234849 ) ) ( not ( = ?auto_234847 ?auto_234849 ) ) ( ON ?auto_234840 ?auto_234839 ) ( ON ?auto_234841 ?auto_234840 ) ( ON ?auto_234843 ?auto_234841 ) ( ON ?auto_234842 ?auto_234843 ) ( ON ?auto_234844 ?auto_234842 ) ( not ( = ?auto_234839 ?auto_234840 ) ) ( not ( = ?auto_234839 ?auto_234841 ) ) ( not ( = ?auto_234839 ?auto_234843 ) ) ( not ( = ?auto_234839 ?auto_234842 ) ) ( not ( = ?auto_234839 ?auto_234844 ) ) ( not ( = ?auto_234839 ?auto_234845 ) ) ( not ( = ?auto_234839 ?auto_234846 ) ) ( not ( = ?auto_234839 ?auto_234847 ) ) ( not ( = ?auto_234839 ?auto_234849 ) ) ( not ( = ?auto_234840 ?auto_234841 ) ) ( not ( = ?auto_234840 ?auto_234843 ) ) ( not ( = ?auto_234840 ?auto_234842 ) ) ( not ( = ?auto_234840 ?auto_234844 ) ) ( not ( = ?auto_234840 ?auto_234845 ) ) ( not ( = ?auto_234840 ?auto_234846 ) ) ( not ( = ?auto_234840 ?auto_234847 ) ) ( not ( = ?auto_234840 ?auto_234849 ) ) ( not ( = ?auto_234841 ?auto_234843 ) ) ( not ( = ?auto_234841 ?auto_234842 ) ) ( not ( = ?auto_234841 ?auto_234844 ) ) ( not ( = ?auto_234841 ?auto_234845 ) ) ( not ( = ?auto_234841 ?auto_234846 ) ) ( not ( = ?auto_234841 ?auto_234847 ) ) ( not ( = ?auto_234841 ?auto_234849 ) ) ( not ( = ?auto_234843 ?auto_234842 ) ) ( not ( = ?auto_234843 ?auto_234844 ) ) ( not ( = ?auto_234843 ?auto_234845 ) ) ( not ( = ?auto_234843 ?auto_234846 ) ) ( not ( = ?auto_234843 ?auto_234847 ) ) ( not ( = ?auto_234843 ?auto_234849 ) ) ( not ( = ?auto_234842 ?auto_234844 ) ) ( not ( = ?auto_234842 ?auto_234845 ) ) ( not ( = ?auto_234842 ?auto_234846 ) ) ( not ( = ?auto_234842 ?auto_234847 ) ) ( not ( = ?auto_234842 ?auto_234849 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234844 ?auto_234845 ?auto_234846 )
      ( MAKE-7CRATE-VERIFY ?auto_234839 ?auto_234840 ?auto_234841 ?auto_234843 ?auto_234842 ?auto_234844 ?auto_234845 ?auto_234846 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234854 - SURFACE
      ?auto_234855 - SURFACE
      ?auto_234856 - SURFACE
      ?auto_234858 - SURFACE
      ?auto_234857 - SURFACE
      ?auto_234859 - SURFACE
      ?auto_234860 - SURFACE
      ?auto_234861 - SURFACE
      ?auto_234862 - SURFACE
    )
    :vars
    (
      ?auto_234869 - HOIST
      ?auto_234864 - PLACE
      ?auto_234866 - PLACE
      ?auto_234867 - HOIST
      ?auto_234863 - SURFACE
      ?auto_234868 - TRUCK
      ?auto_234865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234869 ?auto_234864 ) ( IS-CRATE ?auto_234862 ) ( not ( = ?auto_234861 ?auto_234862 ) ) ( not ( = ?auto_234860 ?auto_234861 ) ) ( not ( = ?auto_234860 ?auto_234862 ) ) ( not ( = ?auto_234866 ?auto_234864 ) ) ( HOIST-AT ?auto_234867 ?auto_234866 ) ( not ( = ?auto_234869 ?auto_234867 ) ) ( SURFACE-AT ?auto_234862 ?auto_234866 ) ( ON ?auto_234862 ?auto_234863 ) ( CLEAR ?auto_234862 ) ( not ( = ?auto_234861 ?auto_234863 ) ) ( not ( = ?auto_234862 ?auto_234863 ) ) ( not ( = ?auto_234860 ?auto_234863 ) ) ( SURFACE-AT ?auto_234860 ?auto_234864 ) ( CLEAR ?auto_234860 ) ( IS-CRATE ?auto_234861 ) ( AVAILABLE ?auto_234869 ) ( TRUCK-AT ?auto_234868 ?auto_234866 ) ( AVAILABLE ?auto_234867 ) ( SURFACE-AT ?auto_234861 ?auto_234866 ) ( ON ?auto_234861 ?auto_234865 ) ( CLEAR ?auto_234861 ) ( not ( = ?auto_234861 ?auto_234865 ) ) ( not ( = ?auto_234862 ?auto_234865 ) ) ( not ( = ?auto_234860 ?auto_234865 ) ) ( not ( = ?auto_234863 ?auto_234865 ) ) ( ON ?auto_234855 ?auto_234854 ) ( ON ?auto_234856 ?auto_234855 ) ( ON ?auto_234858 ?auto_234856 ) ( ON ?auto_234857 ?auto_234858 ) ( ON ?auto_234859 ?auto_234857 ) ( ON ?auto_234860 ?auto_234859 ) ( not ( = ?auto_234854 ?auto_234855 ) ) ( not ( = ?auto_234854 ?auto_234856 ) ) ( not ( = ?auto_234854 ?auto_234858 ) ) ( not ( = ?auto_234854 ?auto_234857 ) ) ( not ( = ?auto_234854 ?auto_234859 ) ) ( not ( = ?auto_234854 ?auto_234860 ) ) ( not ( = ?auto_234854 ?auto_234861 ) ) ( not ( = ?auto_234854 ?auto_234862 ) ) ( not ( = ?auto_234854 ?auto_234863 ) ) ( not ( = ?auto_234854 ?auto_234865 ) ) ( not ( = ?auto_234855 ?auto_234856 ) ) ( not ( = ?auto_234855 ?auto_234858 ) ) ( not ( = ?auto_234855 ?auto_234857 ) ) ( not ( = ?auto_234855 ?auto_234859 ) ) ( not ( = ?auto_234855 ?auto_234860 ) ) ( not ( = ?auto_234855 ?auto_234861 ) ) ( not ( = ?auto_234855 ?auto_234862 ) ) ( not ( = ?auto_234855 ?auto_234863 ) ) ( not ( = ?auto_234855 ?auto_234865 ) ) ( not ( = ?auto_234856 ?auto_234858 ) ) ( not ( = ?auto_234856 ?auto_234857 ) ) ( not ( = ?auto_234856 ?auto_234859 ) ) ( not ( = ?auto_234856 ?auto_234860 ) ) ( not ( = ?auto_234856 ?auto_234861 ) ) ( not ( = ?auto_234856 ?auto_234862 ) ) ( not ( = ?auto_234856 ?auto_234863 ) ) ( not ( = ?auto_234856 ?auto_234865 ) ) ( not ( = ?auto_234858 ?auto_234857 ) ) ( not ( = ?auto_234858 ?auto_234859 ) ) ( not ( = ?auto_234858 ?auto_234860 ) ) ( not ( = ?auto_234858 ?auto_234861 ) ) ( not ( = ?auto_234858 ?auto_234862 ) ) ( not ( = ?auto_234858 ?auto_234863 ) ) ( not ( = ?auto_234858 ?auto_234865 ) ) ( not ( = ?auto_234857 ?auto_234859 ) ) ( not ( = ?auto_234857 ?auto_234860 ) ) ( not ( = ?auto_234857 ?auto_234861 ) ) ( not ( = ?auto_234857 ?auto_234862 ) ) ( not ( = ?auto_234857 ?auto_234863 ) ) ( not ( = ?auto_234857 ?auto_234865 ) ) ( not ( = ?auto_234859 ?auto_234860 ) ) ( not ( = ?auto_234859 ?auto_234861 ) ) ( not ( = ?auto_234859 ?auto_234862 ) ) ( not ( = ?auto_234859 ?auto_234863 ) ) ( not ( = ?auto_234859 ?auto_234865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234860 ?auto_234861 ?auto_234862 )
      ( MAKE-8CRATE-VERIFY ?auto_234854 ?auto_234855 ?auto_234856 ?auto_234858 ?auto_234857 ?auto_234859 ?auto_234860 ?auto_234861 ?auto_234862 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_234901 - SURFACE
      ?auto_234902 - SURFACE
      ?auto_234903 - SURFACE
      ?auto_234905 - SURFACE
      ?auto_234904 - SURFACE
    )
    :vars
    (
      ?auto_234906 - HOIST
      ?auto_234912 - PLACE
      ?auto_234910 - PLACE
      ?auto_234911 - HOIST
      ?auto_234909 - SURFACE
      ?auto_234908 - SURFACE
      ?auto_234907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234906 ?auto_234912 ) ( IS-CRATE ?auto_234904 ) ( not ( = ?auto_234905 ?auto_234904 ) ) ( not ( = ?auto_234903 ?auto_234905 ) ) ( not ( = ?auto_234903 ?auto_234904 ) ) ( not ( = ?auto_234910 ?auto_234912 ) ) ( HOIST-AT ?auto_234911 ?auto_234910 ) ( not ( = ?auto_234906 ?auto_234911 ) ) ( SURFACE-AT ?auto_234904 ?auto_234910 ) ( ON ?auto_234904 ?auto_234909 ) ( CLEAR ?auto_234904 ) ( not ( = ?auto_234905 ?auto_234909 ) ) ( not ( = ?auto_234904 ?auto_234909 ) ) ( not ( = ?auto_234903 ?auto_234909 ) ) ( SURFACE-AT ?auto_234903 ?auto_234912 ) ( CLEAR ?auto_234903 ) ( IS-CRATE ?auto_234905 ) ( AVAILABLE ?auto_234906 ) ( AVAILABLE ?auto_234911 ) ( SURFACE-AT ?auto_234905 ?auto_234910 ) ( ON ?auto_234905 ?auto_234908 ) ( CLEAR ?auto_234905 ) ( not ( = ?auto_234905 ?auto_234908 ) ) ( not ( = ?auto_234904 ?auto_234908 ) ) ( not ( = ?auto_234903 ?auto_234908 ) ) ( not ( = ?auto_234909 ?auto_234908 ) ) ( TRUCK-AT ?auto_234907 ?auto_234912 ) ( ON ?auto_234902 ?auto_234901 ) ( ON ?auto_234903 ?auto_234902 ) ( not ( = ?auto_234901 ?auto_234902 ) ) ( not ( = ?auto_234901 ?auto_234903 ) ) ( not ( = ?auto_234901 ?auto_234905 ) ) ( not ( = ?auto_234901 ?auto_234904 ) ) ( not ( = ?auto_234901 ?auto_234909 ) ) ( not ( = ?auto_234901 ?auto_234908 ) ) ( not ( = ?auto_234902 ?auto_234903 ) ) ( not ( = ?auto_234902 ?auto_234905 ) ) ( not ( = ?auto_234902 ?auto_234904 ) ) ( not ( = ?auto_234902 ?auto_234909 ) ) ( not ( = ?auto_234902 ?auto_234908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234903 ?auto_234905 ?auto_234904 )
      ( MAKE-4CRATE-VERIFY ?auto_234901 ?auto_234902 ?auto_234903 ?auto_234905 ?auto_234904 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_234913 - SURFACE
      ?auto_234914 - SURFACE
      ?auto_234915 - SURFACE
      ?auto_234917 - SURFACE
      ?auto_234916 - SURFACE
      ?auto_234918 - SURFACE
    )
    :vars
    (
      ?auto_234919 - HOIST
      ?auto_234925 - PLACE
      ?auto_234923 - PLACE
      ?auto_234924 - HOIST
      ?auto_234922 - SURFACE
      ?auto_234921 - SURFACE
      ?auto_234920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234919 ?auto_234925 ) ( IS-CRATE ?auto_234918 ) ( not ( = ?auto_234916 ?auto_234918 ) ) ( not ( = ?auto_234917 ?auto_234916 ) ) ( not ( = ?auto_234917 ?auto_234918 ) ) ( not ( = ?auto_234923 ?auto_234925 ) ) ( HOIST-AT ?auto_234924 ?auto_234923 ) ( not ( = ?auto_234919 ?auto_234924 ) ) ( SURFACE-AT ?auto_234918 ?auto_234923 ) ( ON ?auto_234918 ?auto_234922 ) ( CLEAR ?auto_234918 ) ( not ( = ?auto_234916 ?auto_234922 ) ) ( not ( = ?auto_234918 ?auto_234922 ) ) ( not ( = ?auto_234917 ?auto_234922 ) ) ( SURFACE-AT ?auto_234917 ?auto_234925 ) ( CLEAR ?auto_234917 ) ( IS-CRATE ?auto_234916 ) ( AVAILABLE ?auto_234919 ) ( AVAILABLE ?auto_234924 ) ( SURFACE-AT ?auto_234916 ?auto_234923 ) ( ON ?auto_234916 ?auto_234921 ) ( CLEAR ?auto_234916 ) ( not ( = ?auto_234916 ?auto_234921 ) ) ( not ( = ?auto_234918 ?auto_234921 ) ) ( not ( = ?auto_234917 ?auto_234921 ) ) ( not ( = ?auto_234922 ?auto_234921 ) ) ( TRUCK-AT ?auto_234920 ?auto_234925 ) ( ON ?auto_234914 ?auto_234913 ) ( ON ?auto_234915 ?auto_234914 ) ( ON ?auto_234917 ?auto_234915 ) ( not ( = ?auto_234913 ?auto_234914 ) ) ( not ( = ?auto_234913 ?auto_234915 ) ) ( not ( = ?auto_234913 ?auto_234917 ) ) ( not ( = ?auto_234913 ?auto_234916 ) ) ( not ( = ?auto_234913 ?auto_234918 ) ) ( not ( = ?auto_234913 ?auto_234922 ) ) ( not ( = ?auto_234913 ?auto_234921 ) ) ( not ( = ?auto_234914 ?auto_234915 ) ) ( not ( = ?auto_234914 ?auto_234917 ) ) ( not ( = ?auto_234914 ?auto_234916 ) ) ( not ( = ?auto_234914 ?auto_234918 ) ) ( not ( = ?auto_234914 ?auto_234922 ) ) ( not ( = ?auto_234914 ?auto_234921 ) ) ( not ( = ?auto_234915 ?auto_234917 ) ) ( not ( = ?auto_234915 ?auto_234916 ) ) ( not ( = ?auto_234915 ?auto_234918 ) ) ( not ( = ?auto_234915 ?auto_234922 ) ) ( not ( = ?auto_234915 ?auto_234921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234917 ?auto_234916 ?auto_234918 )
      ( MAKE-5CRATE-VERIFY ?auto_234913 ?auto_234914 ?auto_234915 ?auto_234917 ?auto_234916 ?auto_234918 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_234926 - SURFACE
      ?auto_234927 - SURFACE
      ?auto_234928 - SURFACE
      ?auto_234930 - SURFACE
      ?auto_234929 - SURFACE
      ?auto_234931 - SURFACE
      ?auto_234932 - SURFACE
    )
    :vars
    (
      ?auto_234933 - HOIST
      ?auto_234939 - PLACE
      ?auto_234937 - PLACE
      ?auto_234938 - HOIST
      ?auto_234936 - SURFACE
      ?auto_234935 - SURFACE
      ?auto_234934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234933 ?auto_234939 ) ( IS-CRATE ?auto_234932 ) ( not ( = ?auto_234931 ?auto_234932 ) ) ( not ( = ?auto_234929 ?auto_234931 ) ) ( not ( = ?auto_234929 ?auto_234932 ) ) ( not ( = ?auto_234937 ?auto_234939 ) ) ( HOIST-AT ?auto_234938 ?auto_234937 ) ( not ( = ?auto_234933 ?auto_234938 ) ) ( SURFACE-AT ?auto_234932 ?auto_234937 ) ( ON ?auto_234932 ?auto_234936 ) ( CLEAR ?auto_234932 ) ( not ( = ?auto_234931 ?auto_234936 ) ) ( not ( = ?auto_234932 ?auto_234936 ) ) ( not ( = ?auto_234929 ?auto_234936 ) ) ( SURFACE-AT ?auto_234929 ?auto_234939 ) ( CLEAR ?auto_234929 ) ( IS-CRATE ?auto_234931 ) ( AVAILABLE ?auto_234933 ) ( AVAILABLE ?auto_234938 ) ( SURFACE-AT ?auto_234931 ?auto_234937 ) ( ON ?auto_234931 ?auto_234935 ) ( CLEAR ?auto_234931 ) ( not ( = ?auto_234931 ?auto_234935 ) ) ( not ( = ?auto_234932 ?auto_234935 ) ) ( not ( = ?auto_234929 ?auto_234935 ) ) ( not ( = ?auto_234936 ?auto_234935 ) ) ( TRUCK-AT ?auto_234934 ?auto_234939 ) ( ON ?auto_234927 ?auto_234926 ) ( ON ?auto_234928 ?auto_234927 ) ( ON ?auto_234930 ?auto_234928 ) ( ON ?auto_234929 ?auto_234930 ) ( not ( = ?auto_234926 ?auto_234927 ) ) ( not ( = ?auto_234926 ?auto_234928 ) ) ( not ( = ?auto_234926 ?auto_234930 ) ) ( not ( = ?auto_234926 ?auto_234929 ) ) ( not ( = ?auto_234926 ?auto_234931 ) ) ( not ( = ?auto_234926 ?auto_234932 ) ) ( not ( = ?auto_234926 ?auto_234936 ) ) ( not ( = ?auto_234926 ?auto_234935 ) ) ( not ( = ?auto_234927 ?auto_234928 ) ) ( not ( = ?auto_234927 ?auto_234930 ) ) ( not ( = ?auto_234927 ?auto_234929 ) ) ( not ( = ?auto_234927 ?auto_234931 ) ) ( not ( = ?auto_234927 ?auto_234932 ) ) ( not ( = ?auto_234927 ?auto_234936 ) ) ( not ( = ?auto_234927 ?auto_234935 ) ) ( not ( = ?auto_234928 ?auto_234930 ) ) ( not ( = ?auto_234928 ?auto_234929 ) ) ( not ( = ?auto_234928 ?auto_234931 ) ) ( not ( = ?auto_234928 ?auto_234932 ) ) ( not ( = ?auto_234928 ?auto_234936 ) ) ( not ( = ?auto_234928 ?auto_234935 ) ) ( not ( = ?auto_234930 ?auto_234929 ) ) ( not ( = ?auto_234930 ?auto_234931 ) ) ( not ( = ?auto_234930 ?auto_234932 ) ) ( not ( = ?auto_234930 ?auto_234936 ) ) ( not ( = ?auto_234930 ?auto_234935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234929 ?auto_234931 ?auto_234932 )
      ( MAKE-6CRATE-VERIFY ?auto_234926 ?auto_234927 ?auto_234928 ?auto_234930 ?auto_234929 ?auto_234931 ?auto_234932 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_234940 - SURFACE
      ?auto_234941 - SURFACE
      ?auto_234942 - SURFACE
      ?auto_234944 - SURFACE
      ?auto_234943 - SURFACE
      ?auto_234945 - SURFACE
      ?auto_234946 - SURFACE
      ?auto_234947 - SURFACE
    )
    :vars
    (
      ?auto_234948 - HOIST
      ?auto_234954 - PLACE
      ?auto_234952 - PLACE
      ?auto_234953 - HOIST
      ?auto_234951 - SURFACE
      ?auto_234950 - SURFACE
      ?auto_234949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234948 ?auto_234954 ) ( IS-CRATE ?auto_234947 ) ( not ( = ?auto_234946 ?auto_234947 ) ) ( not ( = ?auto_234945 ?auto_234946 ) ) ( not ( = ?auto_234945 ?auto_234947 ) ) ( not ( = ?auto_234952 ?auto_234954 ) ) ( HOIST-AT ?auto_234953 ?auto_234952 ) ( not ( = ?auto_234948 ?auto_234953 ) ) ( SURFACE-AT ?auto_234947 ?auto_234952 ) ( ON ?auto_234947 ?auto_234951 ) ( CLEAR ?auto_234947 ) ( not ( = ?auto_234946 ?auto_234951 ) ) ( not ( = ?auto_234947 ?auto_234951 ) ) ( not ( = ?auto_234945 ?auto_234951 ) ) ( SURFACE-AT ?auto_234945 ?auto_234954 ) ( CLEAR ?auto_234945 ) ( IS-CRATE ?auto_234946 ) ( AVAILABLE ?auto_234948 ) ( AVAILABLE ?auto_234953 ) ( SURFACE-AT ?auto_234946 ?auto_234952 ) ( ON ?auto_234946 ?auto_234950 ) ( CLEAR ?auto_234946 ) ( not ( = ?auto_234946 ?auto_234950 ) ) ( not ( = ?auto_234947 ?auto_234950 ) ) ( not ( = ?auto_234945 ?auto_234950 ) ) ( not ( = ?auto_234951 ?auto_234950 ) ) ( TRUCK-AT ?auto_234949 ?auto_234954 ) ( ON ?auto_234941 ?auto_234940 ) ( ON ?auto_234942 ?auto_234941 ) ( ON ?auto_234944 ?auto_234942 ) ( ON ?auto_234943 ?auto_234944 ) ( ON ?auto_234945 ?auto_234943 ) ( not ( = ?auto_234940 ?auto_234941 ) ) ( not ( = ?auto_234940 ?auto_234942 ) ) ( not ( = ?auto_234940 ?auto_234944 ) ) ( not ( = ?auto_234940 ?auto_234943 ) ) ( not ( = ?auto_234940 ?auto_234945 ) ) ( not ( = ?auto_234940 ?auto_234946 ) ) ( not ( = ?auto_234940 ?auto_234947 ) ) ( not ( = ?auto_234940 ?auto_234951 ) ) ( not ( = ?auto_234940 ?auto_234950 ) ) ( not ( = ?auto_234941 ?auto_234942 ) ) ( not ( = ?auto_234941 ?auto_234944 ) ) ( not ( = ?auto_234941 ?auto_234943 ) ) ( not ( = ?auto_234941 ?auto_234945 ) ) ( not ( = ?auto_234941 ?auto_234946 ) ) ( not ( = ?auto_234941 ?auto_234947 ) ) ( not ( = ?auto_234941 ?auto_234951 ) ) ( not ( = ?auto_234941 ?auto_234950 ) ) ( not ( = ?auto_234942 ?auto_234944 ) ) ( not ( = ?auto_234942 ?auto_234943 ) ) ( not ( = ?auto_234942 ?auto_234945 ) ) ( not ( = ?auto_234942 ?auto_234946 ) ) ( not ( = ?auto_234942 ?auto_234947 ) ) ( not ( = ?auto_234942 ?auto_234951 ) ) ( not ( = ?auto_234942 ?auto_234950 ) ) ( not ( = ?auto_234944 ?auto_234943 ) ) ( not ( = ?auto_234944 ?auto_234945 ) ) ( not ( = ?auto_234944 ?auto_234946 ) ) ( not ( = ?auto_234944 ?auto_234947 ) ) ( not ( = ?auto_234944 ?auto_234951 ) ) ( not ( = ?auto_234944 ?auto_234950 ) ) ( not ( = ?auto_234943 ?auto_234945 ) ) ( not ( = ?auto_234943 ?auto_234946 ) ) ( not ( = ?auto_234943 ?auto_234947 ) ) ( not ( = ?auto_234943 ?auto_234951 ) ) ( not ( = ?auto_234943 ?auto_234950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234945 ?auto_234946 ?auto_234947 )
      ( MAKE-7CRATE-VERIFY ?auto_234940 ?auto_234941 ?auto_234942 ?auto_234944 ?auto_234943 ?auto_234945 ?auto_234946 ?auto_234947 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234955 - SURFACE
      ?auto_234956 - SURFACE
      ?auto_234957 - SURFACE
      ?auto_234959 - SURFACE
      ?auto_234958 - SURFACE
      ?auto_234960 - SURFACE
      ?auto_234961 - SURFACE
      ?auto_234962 - SURFACE
      ?auto_234963 - SURFACE
    )
    :vars
    (
      ?auto_234964 - HOIST
      ?auto_234970 - PLACE
      ?auto_234968 - PLACE
      ?auto_234969 - HOIST
      ?auto_234967 - SURFACE
      ?auto_234966 - SURFACE
      ?auto_234965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234964 ?auto_234970 ) ( IS-CRATE ?auto_234963 ) ( not ( = ?auto_234962 ?auto_234963 ) ) ( not ( = ?auto_234961 ?auto_234962 ) ) ( not ( = ?auto_234961 ?auto_234963 ) ) ( not ( = ?auto_234968 ?auto_234970 ) ) ( HOIST-AT ?auto_234969 ?auto_234968 ) ( not ( = ?auto_234964 ?auto_234969 ) ) ( SURFACE-AT ?auto_234963 ?auto_234968 ) ( ON ?auto_234963 ?auto_234967 ) ( CLEAR ?auto_234963 ) ( not ( = ?auto_234962 ?auto_234967 ) ) ( not ( = ?auto_234963 ?auto_234967 ) ) ( not ( = ?auto_234961 ?auto_234967 ) ) ( SURFACE-AT ?auto_234961 ?auto_234970 ) ( CLEAR ?auto_234961 ) ( IS-CRATE ?auto_234962 ) ( AVAILABLE ?auto_234964 ) ( AVAILABLE ?auto_234969 ) ( SURFACE-AT ?auto_234962 ?auto_234968 ) ( ON ?auto_234962 ?auto_234966 ) ( CLEAR ?auto_234962 ) ( not ( = ?auto_234962 ?auto_234966 ) ) ( not ( = ?auto_234963 ?auto_234966 ) ) ( not ( = ?auto_234961 ?auto_234966 ) ) ( not ( = ?auto_234967 ?auto_234966 ) ) ( TRUCK-AT ?auto_234965 ?auto_234970 ) ( ON ?auto_234956 ?auto_234955 ) ( ON ?auto_234957 ?auto_234956 ) ( ON ?auto_234959 ?auto_234957 ) ( ON ?auto_234958 ?auto_234959 ) ( ON ?auto_234960 ?auto_234958 ) ( ON ?auto_234961 ?auto_234960 ) ( not ( = ?auto_234955 ?auto_234956 ) ) ( not ( = ?auto_234955 ?auto_234957 ) ) ( not ( = ?auto_234955 ?auto_234959 ) ) ( not ( = ?auto_234955 ?auto_234958 ) ) ( not ( = ?auto_234955 ?auto_234960 ) ) ( not ( = ?auto_234955 ?auto_234961 ) ) ( not ( = ?auto_234955 ?auto_234962 ) ) ( not ( = ?auto_234955 ?auto_234963 ) ) ( not ( = ?auto_234955 ?auto_234967 ) ) ( not ( = ?auto_234955 ?auto_234966 ) ) ( not ( = ?auto_234956 ?auto_234957 ) ) ( not ( = ?auto_234956 ?auto_234959 ) ) ( not ( = ?auto_234956 ?auto_234958 ) ) ( not ( = ?auto_234956 ?auto_234960 ) ) ( not ( = ?auto_234956 ?auto_234961 ) ) ( not ( = ?auto_234956 ?auto_234962 ) ) ( not ( = ?auto_234956 ?auto_234963 ) ) ( not ( = ?auto_234956 ?auto_234967 ) ) ( not ( = ?auto_234956 ?auto_234966 ) ) ( not ( = ?auto_234957 ?auto_234959 ) ) ( not ( = ?auto_234957 ?auto_234958 ) ) ( not ( = ?auto_234957 ?auto_234960 ) ) ( not ( = ?auto_234957 ?auto_234961 ) ) ( not ( = ?auto_234957 ?auto_234962 ) ) ( not ( = ?auto_234957 ?auto_234963 ) ) ( not ( = ?auto_234957 ?auto_234967 ) ) ( not ( = ?auto_234957 ?auto_234966 ) ) ( not ( = ?auto_234959 ?auto_234958 ) ) ( not ( = ?auto_234959 ?auto_234960 ) ) ( not ( = ?auto_234959 ?auto_234961 ) ) ( not ( = ?auto_234959 ?auto_234962 ) ) ( not ( = ?auto_234959 ?auto_234963 ) ) ( not ( = ?auto_234959 ?auto_234967 ) ) ( not ( = ?auto_234959 ?auto_234966 ) ) ( not ( = ?auto_234958 ?auto_234960 ) ) ( not ( = ?auto_234958 ?auto_234961 ) ) ( not ( = ?auto_234958 ?auto_234962 ) ) ( not ( = ?auto_234958 ?auto_234963 ) ) ( not ( = ?auto_234958 ?auto_234967 ) ) ( not ( = ?auto_234958 ?auto_234966 ) ) ( not ( = ?auto_234960 ?auto_234961 ) ) ( not ( = ?auto_234960 ?auto_234962 ) ) ( not ( = ?auto_234960 ?auto_234963 ) ) ( not ( = ?auto_234960 ?auto_234967 ) ) ( not ( = ?auto_234960 ?auto_234966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234961 ?auto_234962 ?auto_234963 )
      ( MAKE-8CRATE-VERIFY ?auto_234955 ?auto_234956 ?auto_234957 ?auto_234959 ?auto_234958 ?auto_234960 ?auto_234961 ?auto_234962 ?auto_234963 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_235004 - SURFACE
      ?auto_235005 - SURFACE
      ?auto_235006 - SURFACE
      ?auto_235008 - SURFACE
      ?auto_235007 - SURFACE
    )
    :vars
    (
      ?auto_235012 - HOIST
      ?auto_235015 - PLACE
      ?auto_235014 - PLACE
      ?auto_235009 - HOIST
      ?auto_235010 - SURFACE
      ?auto_235011 - SURFACE
      ?auto_235013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_235012 ?auto_235015 ) ( IS-CRATE ?auto_235007 ) ( not ( = ?auto_235008 ?auto_235007 ) ) ( not ( = ?auto_235006 ?auto_235008 ) ) ( not ( = ?auto_235006 ?auto_235007 ) ) ( not ( = ?auto_235014 ?auto_235015 ) ) ( HOIST-AT ?auto_235009 ?auto_235014 ) ( not ( = ?auto_235012 ?auto_235009 ) ) ( SURFACE-AT ?auto_235007 ?auto_235014 ) ( ON ?auto_235007 ?auto_235010 ) ( CLEAR ?auto_235007 ) ( not ( = ?auto_235008 ?auto_235010 ) ) ( not ( = ?auto_235007 ?auto_235010 ) ) ( not ( = ?auto_235006 ?auto_235010 ) ) ( IS-CRATE ?auto_235008 ) ( AVAILABLE ?auto_235009 ) ( SURFACE-AT ?auto_235008 ?auto_235014 ) ( ON ?auto_235008 ?auto_235011 ) ( CLEAR ?auto_235008 ) ( not ( = ?auto_235008 ?auto_235011 ) ) ( not ( = ?auto_235007 ?auto_235011 ) ) ( not ( = ?auto_235006 ?auto_235011 ) ) ( not ( = ?auto_235010 ?auto_235011 ) ) ( TRUCK-AT ?auto_235013 ?auto_235015 ) ( SURFACE-AT ?auto_235005 ?auto_235015 ) ( CLEAR ?auto_235005 ) ( LIFTING ?auto_235012 ?auto_235006 ) ( IS-CRATE ?auto_235006 ) ( not ( = ?auto_235005 ?auto_235006 ) ) ( not ( = ?auto_235008 ?auto_235005 ) ) ( not ( = ?auto_235007 ?auto_235005 ) ) ( not ( = ?auto_235010 ?auto_235005 ) ) ( not ( = ?auto_235011 ?auto_235005 ) ) ( ON ?auto_235005 ?auto_235004 ) ( not ( = ?auto_235004 ?auto_235005 ) ) ( not ( = ?auto_235004 ?auto_235006 ) ) ( not ( = ?auto_235004 ?auto_235008 ) ) ( not ( = ?auto_235004 ?auto_235007 ) ) ( not ( = ?auto_235004 ?auto_235010 ) ) ( not ( = ?auto_235004 ?auto_235011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_235006 ?auto_235008 ?auto_235007 )
      ( MAKE-4CRATE-VERIFY ?auto_235004 ?auto_235005 ?auto_235006 ?auto_235008 ?auto_235007 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_235016 - SURFACE
      ?auto_235017 - SURFACE
      ?auto_235018 - SURFACE
      ?auto_235020 - SURFACE
      ?auto_235019 - SURFACE
      ?auto_235021 - SURFACE
    )
    :vars
    (
      ?auto_235025 - HOIST
      ?auto_235028 - PLACE
      ?auto_235027 - PLACE
      ?auto_235022 - HOIST
      ?auto_235023 - SURFACE
      ?auto_235024 - SURFACE
      ?auto_235026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_235025 ?auto_235028 ) ( IS-CRATE ?auto_235021 ) ( not ( = ?auto_235019 ?auto_235021 ) ) ( not ( = ?auto_235020 ?auto_235019 ) ) ( not ( = ?auto_235020 ?auto_235021 ) ) ( not ( = ?auto_235027 ?auto_235028 ) ) ( HOIST-AT ?auto_235022 ?auto_235027 ) ( not ( = ?auto_235025 ?auto_235022 ) ) ( SURFACE-AT ?auto_235021 ?auto_235027 ) ( ON ?auto_235021 ?auto_235023 ) ( CLEAR ?auto_235021 ) ( not ( = ?auto_235019 ?auto_235023 ) ) ( not ( = ?auto_235021 ?auto_235023 ) ) ( not ( = ?auto_235020 ?auto_235023 ) ) ( IS-CRATE ?auto_235019 ) ( AVAILABLE ?auto_235022 ) ( SURFACE-AT ?auto_235019 ?auto_235027 ) ( ON ?auto_235019 ?auto_235024 ) ( CLEAR ?auto_235019 ) ( not ( = ?auto_235019 ?auto_235024 ) ) ( not ( = ?auto_235021 ?auto_235024 ) ) ( not ( = ?auto_235020 ?auto_235024 ) ) ( not ( = ?auto_235023 ?auto_235024 ) ) ( TRUCK-AT ?auto_235026 ?auto_235028 ) ( SURFACE-AT ?auto_235018 ?auto_235028 ) ( CLEAR ?auto_235018 ) ( LIFTING ?auto_235025 ?auto_235020 ) ( IS-CRATE ?auto_235020 ) ( not ( = ?auto_235018 ?auto_235020 ) ) ( not ( = ?auto_235019 ?auto_235018 ) ) ( not ( = ?auto_235021 ?auto_235018 ) ) ( not ( = ?auto_235023 ?auto_235018 ) ) ( not ( = ?auto_235024 ?auto_235018 ) ) ( ON ?auto_235017 ?auto_235016 ) ( ON ?auto_235018 ?auto_235017 ) ( not ( = ?auto_235016 ?auto_235017 ) ) ( not ( = ?auto_235016 ?auto_235018 ) ) ( not ( = ?auto_235016 ?auto_235020 ) ) ( not ( = ?auto_235016 ?auto_235019 ) ) ( not ( = ?auto_235016 ?auto_235021 ) ) ( not ( = ?auto_235016 ?auto_235023 ) ) ( not ( = ?auto_235016 ?auto_235024 ) ) ( not ( = ?auto_235017 ?auto_235018 ) ) ( not ( = ?auto_235017 ?auto_235020 ) ) ( not ( = ?auto_235017 ?auto_235019 ) ) ( not ( = ?auto_235017 ?auto_235021 ) ) ( not ( = ?auto_235017 ?auto_235023 ) ) ( not ( = ?auto_235017 ?auto_235024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_235020 ?auto_235019 ?auto_235021 )
      ( MAKE-5CRATE-VERIFY ?auto_235016 ?auto_235017 ?auto_235018 ?auto_235020 ?auto_235019 ?auto_235021 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_235029 - SURFACE
      ?auto_235030 - SURFACE
      ?auto_235031 - SURFACE
      ?auto_235033 - SURFACE
      ?auto_235032 - SURFACE
      ?auto_235034 - SURFACE
      ?auto_235035 - SURFACE
    )
    :vars
    (
      ?auto_235039 - HOIST
      ?auto_235042 - PLACE
      ?auto_235041 - PLACE
      ?auto_235036 - HOIST
      ?auto_235037 - SURFACE
      ?auto_235038 - SURFACE
      ?auto_235040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_235039 ?auto_235042 ) ( IS-CRATE ?auto_235035 ) ( not ( = ?auto_235034 ?auto_235035 ) ) ( not ( = ?auto_235032 ?auto_235034 ) ) ( not ( = ?auto_235032 ?auto_235035 ) ) ( not ( = ?auto_235041 ?auto_235042 ) ) ( HOIST-AT ?auto_235036 ?auto_235041 ) ( not ( = ?auto_235039 ?auto_235036 ) ) ( SURFACE-AT ?auto_235035 ?auto_235041 ) ( ON ?auto_235035 ?auto_235037 ) ( CLEAR ?auto_235035 ) ( not ( = ?auto_235034 ?auto_235037 ) ) ( not ( = ?auto_235035 ?auto_235037 ) ) ( not ( = ?auto_235032 ?auto_235037 ) ) ( IS-CRATE ?auto_235034 ) ( AVAILABLE ?auto_235036 ) ( SURFACE-AT ?auto_235034 ?auto_235041 ) ( ON ?auto_235034 ?auto_235038 ) ( CLEAR ?auto_235034 ) ( not ( = ?auto_235034 ?auto_235038 ) ) ( not ( = ?auto_235035 ?auto_235038 ) ) ( not ( = ?auto_235032 ?auto_235038 ) ) ( not ( = ?auto_235037 ?auto_235038 ) ) ( TRUCK-AT ?auto_235040 ?auto_235042 ) ( SURFACE-AT ?auto_235033 ?auto_235042 ) ( CLEAR ?auto_235033 ) ( LIFTING ?auto_235039 ?auto_235032 ) ( IS-CRATE ?auto_235032 ) ( not ( = ?auto_235033 ?auto_235032 ) ) ( not ( = ?auto_235034 ?auto_235033 ) ) ( not ( = ?auto_235035 ?auto_235033 ) ) ( not ( = ?auto_235037 ?auto_235033 ) ) ( not ( = ?auto_235038 ?auto_235033 ) ) ( ON ?auto_235030 ?auto_235029 ) ( ON ?auto_235031 ?auto_235030 ) ( ON ?auto_235033 ?auto_235031 ) ( not ( = ?auto_235029 ?auto_235030 ) ) ( not ( = ?auto_235029 ?auto_235031 ) ) ( not ( = ?auto_235029 ?auto_235033 ) ) ( not ( = ?auto_235029 ?auto_235032 ) ) ( not ( = ?auto_235029 ?auto_235034 ) ) ( not ( = ?auto_235029 ?auto_235035 ) ) ( not ( = ?auto_235029 ?auto_235037 ) ) ( not ( = ?auto_235029 ?auto_235038 ) ) ( not ( = ?auto_235030 ?auto_235031 ) ) ( not ( = ?auto_235030 ?auto_235033 ) ) ( not ( = ?auto_235030 ?auto_235032 ) ) ( not ( = ?auto_235030 ?auto_235034 ) ) ( not ( = ?auto_235030 ?auto_235035 ) ) ( not ( = ?auto_235030 ?auto_235037 ) ) ( not ( = ?auto_235030 ?auto_235038 ) ) ( not ( = ?auto_235031 ?auto_235033 ) ) ( not ( = ?auto_235031 ?auto_235032 ) ) ( not ( = ?auto_235031 ?auto_235034 ) ) ( not ( = ?auto_235031 ?auto_235035 ) ) ( not ( = ?auto_235031 ?auto_235037 ) ) ( not ( = ?auto_235031 ?auto_235038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_235032 ?auto_235034 ?auto_235035 )
      ( MAKE-6CRATE-VERIFY ?auto_235029 ?auto_235030 ?auto_235031 ?auto_235033 ?auto_235032 ?auto_235034 ?auto_235035 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_235043 - SURFACE
      ?auto_235044 - SURFACE
      ?auto_235045 - SURFACE
      ?auto_235047 - SURFACE
      ?auto_235046 - SURFACE
      ?auto_235048 - SURFACE
      ?auto_235049 - SURFACE
      ?auto_235050 - SURFACE
    )
    :vars
    (
      ?auto_235054 - HOIST
      ?auto_235057 - PLACE
      ?auto_235056 - PLACE
      ?auto_235051 - HOIST
      ?auto_235052 - SURFACE
      ?auto_235053 - SURFACE
      ?auto_235055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_235054 ?auto_235057 ) ( IS-CRATE ?auto_235050 ) ( not ( = ?auto_235049 ?auto_235050 ) ) ( not ( = ?auto_235048 ?auto_235049 ) ) ( not ( = ?auto_235048 ?auto_235050 ) ) ( not ( = ?auto_235056 ?auto_235057 ) ) ( HOIST-AT ?auto_235051 ?auto_235056 ) ( not ( = ?auto_235054 ?auto_235051 ) ) ( SURFACE-AT ?auto_235050 ?auto_235056 ) ( ON ?auto_235050 ?auto_235052 ) ( CLEAR ?auto_235050 ) ( not ( = ?auto_235049 ?auto_235052 ) ) ( not ( = ?auto_235050 ?auto_235052 ) ) ( not ( = ?auto_235048 ?auto_235052 ) ) ( IS-CRATE ?auto_235049 ) ( AVAILABLE ?auto_235051 ) ( SURFACE-AT ?auto_235049 ?auto_235056 ) ( ON ?auto_235049 ?auto_235053 ) ( CLEAR ?auto_235049 ) ( not ( = ?auto_235049 ?auto_235053 ) ) ( not ( = ?auto_235050 ?auto_235053 ) ) ( not ( = ?auto_235048 ?auto_235053 ) ) ( not ( = ?auto_235052 ?auto_235053 ) ) ( TRUCK-AT ?auto_235055 ?auto_235057 ) ( SURFACE-AT ?auto_235046 ?auto_235057 ) ( CLEAR ?auto_235046 ) ( LIFTING ?auto_235054 ?auto_235048 ) ( IS-CRATE ?auto_235048 ) ( not ( = ?auto_235046 ?auto_235048 ) ) ( not ( = ?auto_235049 ?auto_235046 ) ) ( not ( = ?auto_235050 ?auto_235046 ) ) ( not ( = ?auto_235052 ?auto_235046 ) ) ( not ( = ?auto_235053 ?auto_235046 ) ) ( ON ?auto_235044 ?auto_235043 ) ( ON ?auto_235045 ?auto_235044 ) ( ON ?auto_235047 ?auto_235045 ) ( ON ?auto_235046 ?auto_235047 ) ( not ( = ?auto_235043 ?auto_235044 ) ) ( not ( = ?auto_235043 ?auto_235045 ) ) ( not ( = ?auto_235043 ?auto_235047 ) ) ( not ( = ?auto_235043 ?auto_235046 ) ) ( not ( = ?auto_235043 ?auto_235048 ) ) ( not ( = ?auto_235043 ?auto_235049 ) ) ( not ( = ?auto_235043 ?auto_235050 ) ) ( not ( = ?auto_235043 ?auto_235052 ) ) ( not ( = ?auto_235043 ?auto_235053 ) ) ( not ( = ?auto_235044 ?auto_235045 ) ) ( not ( = ?auto_235044 ?auto_235047 ) ) ( not ( = ?auto_235044 ?auto_235046 ) ) ( not ( = ?auto_235044 ?auto_235048 ) ) ( not ( = ?auto_235044 ?auto_235049 ) ) ( not ( = ?auto_235044 ?auto_235050 ) ) ( not ( = ?auto_235044 ?auto_235052 ) ) ( not ( = ?auto_235044 ?auto_235053 ) ) ( not ( = ?auto_235045 ?auto_235047 ) ) ( not ( = ?auto_235045 ?auto_235046 ) ) ( not ( = ?auto_235045 ?auto_235048 ) ) ( not ( = ?auto_235045 ?auto_235049 ) ) ( not ( = ?auto_235045 ?auto_235050 ) ) ( not ( = ?auto_235045 ?auto_235052 ) ) ( not ( = ?auto_235045 ?auto_235053 ) ) ( not ( = ?auto_235047 ?auto_235046 ) ) ( not ( = ?auto_235047 ?auto_235048 ) ) ( not ( = ?auto_235047 ?auto_235049 ) ) ( not ( = ?auto_235047 ?auto_235050 ) ) ( not ( = ?auto_235047 ?auto_235052 ) ) ( not ( = ?auto_235047 ?auto_235053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_235048 ?auto_235049 ?auto_235050 )
      ( MAKE-7CRATE-VERIFY ?auto_235043 ?auto_235044 ?auto_235045 ?auto_235047 ?auto_235046 ?auto_235048 ?auto_235049 ?auto_235050 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_235058 - SURFACE
      ?auto_235059 - SURFACE
      ?auto_235060 - SURFACE
      ?auto_235062 - SURFACE
      ?auto_235061 - SURFACE
      ?auto_235063 - SURFACE
      ?auto_235064 - SURFACE
      ?auto_235065 - SURFACE
      ?auto_235066 - SURFACE
    )
    :vars
    (
      ?auto_235070 - HOIST
      ?auto_235073 - PLACE
      ?auto_235072 - PLACE
      ?auto_235067 - HOIST
      ?auto_235068 - SURFACE
      ?auto_235069 - SURFACE
      ?auto_235071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_235070 ?auto_235073 ) ( IS-CRATE ?auto_235066 ) ( not ( = ?auto_235065 ?auto_235066 ) ) ( not ( = ?auto_235064 ?auto_235065 ) ) ( not ( = ?auto_235064 ?auto_235066 ) ) ( not ( = ?auto_235072 ?auto_235073 ) ) ( HOIST-AT ?auto_235067 ?auto_235072 ) ( not ( = ?auto_235070 ?auto_235067 ) ) ( SURFACE-AT ?auto_235066 ?auto_235072 ) ( ON ?auto_235066 ?auto_235068 ) ( CLEAR ?auto_235066 ) ( not ( = ?auto_235065 ?auto_235068 ) ) ( not ( = ?auto_235066 ?auto_235068 ) ) ( not ( = ?auto_235064 ?auto_235068 ) ) ( IS-CRATE ?auto_235065 ) ( AVAILABLE ?auto_235067 ) ( SURFACE-AT ?auto_235065 ?auto_235072 ) ( ON ?auto_235065 ?auto_235069 ) ( CLEAR ?auto_235065 ) ( not ( = ?auto_235065 ?auto_235069 ) ) ( not ( = ?auto_235066 ?auto_235069 ) ) ( not ( = ?auto_235064 ?auto_235069 ) ) ( not ( = ?auto_235068 ?auto_235069 ) ) ( TRUCK-AT ?auto_235071 ?auto_235073 ) ( SURFACE-AT ?auto_235063 ?auto_235073 ) ( CLEAR ?auto_235063 ) ( LIFTING ?auto_235070 ?auto_235064 ) ( IS-CRATE ?auto_235064 ) ( not ( = ?auto_235063 ?auto_235064 ) ) ( not ( = ?auto_235065 ?auto_235063 ) ) ( not ( = ?auto_235066 ?auto_235063 ) ) ( not ( = ?auto_235068 ?auto_235063 ) ) ( not ( = ?auto_235069 ?auto_235063 ) ) ( ON ?auto_235059 ?auto_235058 ) ( ON ?auto_235060 ?auto_235059 ) ( ON ?auto_235062 ?auto_235060 ) ( ON ?auto_235061 ?auto_235062 ) ( ON ?auto_235063 ?auto_235061 ) ( not ( = ?auto_235058 ?auto_235059 ) ) ( not ( = ?auto_235058 ?auto_235060 ) ) ( not ( = ?auto_235058 ?auto_235062 ) ) ( not ( = ?auto_235058 ?auto_235061 ) ) ( not ( = ?auto_235058 ?auto_235063 ) ) ( not ( = ?auto_235058 ?auto_235064 ) ) ( not ( = ?auto_235058 ?auto_235065 ) ) ( not ( = ?auto_235058 ?auto_235066 ) ) ( not ( = ?auto_235058 ?auto_235068 ) ) ( not ( = ?auto_235058 ?auto_235069 ) ) ( not ( = ?auto_235059 ?auto_235060 ) ) ( not ( = ?auto_235059 ?auto_235062 ) ) ( not ( = ?auto_235059 ?auto_235061 ) ) ( not ( = ?auto_235059 ?auto_235063 ) ) ( not ( = ?auto_235059 ?auto_235064 ) ) ( not ( = ?auto_235059 ?auto_235065 ) ) ( not ( = ?auto_235059 ?auto_235066 ) ) ( not ( = ?auto_235059 ?auto_235068 ) ) ( not ( = ?auto_235059 ?auto_235069 ) ) ( not ( = ?auto_235060 ?auto_235062 ) ) ( not ( = ?auto_235060 ?auto_235061 ) ) ( not ( = ?auto_235060 ?auto_235063 ) ) ( not ( = ?auto_235060 ?auto_235064 ) ) ( not ( = ?auto_235060 ?auto_235065 ) ) ( not ( = ?auto_235060 ?auto_235066 ) ) ( not ( = ?auto_235060 ?auto_235068 ) ) ( not ( = ?auto_235060 ?auto_235069 ) ) ( not ( = ?auto_235062 ?auto_235061 ) ) ( not ( = ?auto_235062 ?auto_235063 ) ) ( not ( = ?auto_235062 ?auto_235064 ) ) ( not ( = ?auto_235062 ?auto_235065 ) ) ( not ( = ?auto_235062 ?auto_235066 ) ) ( not ( = ?auto_235062 ?auto_235068 ) ) ( not ( = ?auto_235062 ?auto_235069 ) ) ( not ( = ?auto_235061 ?auto_235063 ) ) ( not ( = ?auto_235061 ?auto_235064 ) ) ( not ( = ?auto_235061 ?auto_235065 ) ) ( not ( = ?auto_235061 ?auto_235066 ) ) ( not ( = ?auto_235061 ?auto_235068 ) ) ( not ( = ?auto_235061 ?auto_235069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_235064 ?auto_235065 ?auto_235066 )
      ( MAKE-8CRATE-VERIFY ?auto_235058 ?auto_235059 ?auto_235060 ?auto_235062 ?auto_235061 ?auto_235063 ?auto_235064 ?auto_235065 ?auto_235066 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_238623 - SURFACE
      ?auto_238624 - SURFACE
      ?auto_238625 - SURFACE
      ?auto_238627 - SURFACE
      ?auto_238626 - SURFACE
      ?auto_238628 - SURFACE
      ?auto_238629 - SURFACE
      ?auto_238630 - SURFACE
      ?auto_238631 - SURFACE
      ?auto_238632 - SURFACE
    )
    :vars
    (
      ?auto_238634 - HOIST
      ?auto_238633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_238634 ?auto_238633 ) ( SURFACE-AT ?auto_238631 ?auto_238633 ) ( CLEAR ?auto_238631 ) ( LIFTING ?auto_238634 ?auto_238632 ) ( IS-CRATE ?auto_238632 ) ( not ( = ?auto_238631 ?auto_238632 ) ) ( ON ?auto_238624 ?auto_238623 ) ( ON ?auto_238625 ?auto_238624 ) ( ON ?auto_238627 ?auto_238625 ) ( ON ?auto_238626 ?auto_238627 ) ( ON ?auto_238628 ?auto_238626 ) ( ON ?auto_238629 ?auto_238628 ) ( ON ?auto_238630 ?auto_238629 ) ( ON ?auto_238631 ?auto_238630 ) ( not ( = ?auto_238623 ?auto_238624 ) ) ( not ( = ?auto_238623 ?auto_238625 ) ) ( not ( = ?auto_238623 ?auto_238627 ) ) ( not ( = ?auto_238623 ?auto_238626 ) ) ( not ( = ?auto_238623 ?auto_238628 ) ) ( not ( = ?auto_238623 ?auto_238629 ) ) ( not ( = ?auto_238623 ?auto_238630 ) ) ( not ( = ?auto_238623 ?auto_238631 ) ) ( not ( = ?auto_238623 ?auto_238632 ) ) ( not ( = ?auto_238624 ?auto_238625 ) ) ( not ( = ?auto_238624 ?auto_238627 ) ) ( not ( = ?auto_238624 ?auto_238626 ) ) ( not ( = ?auto_238624 ?auto_238628 ) ) ( not ( = ?auto_238624 ?auto_238629 ) ) ( not ( = ?auto_238624 ?auto_238630 ) ) ( not ( = ?auto_238624 ?auto_238631 ) ) ( not ( = ?auto_238624 ?auto_238632 ) ) ( not ( = ?auto_238625 ?auto_238627 ) ) ( not ( = ?auto_238625 ?auto_238626 ) ) ( not ( = ?auto_238625 ?auto_238628 ) ) ( not ( = ?auto_238625 ?auto_238629 ) ) ( not ( = ?auto_238625 ?auto_238630 ) ) ( not ( = ?auto_238625 ?auto_238631 ) ) ( not ( = ?auto_238625 ?auto_238632 ) ) ( not ( = ?auto_238627 ?auto_238626 ) ) ( not ( = ?auto_238627 ?auto_238628 ) ) ( not ( = ?auto_238627 ?auto_238629 ) ) ( not ( = ?auto_238627 ?auto_238630 ) ) ( not ( = ?auto_238627 ?auto_238631 ) ) ( not ( = ?auto_238627 ?auto_238632 ) ) ( not ( = ?auto_238626 ?auto_238628 ) ) ( not ( = ?auto_238626 ?auto_238629 ) ) ( not ( = ?auto_238626 ?auto_238630 ) ) ( not ( = ?auto_238626 ?auto_238631 ) ) ( not ( = ?auto_238626 ?auto_238632 ) ) ( not ( = ?auto_238628 ?auto_238629 ) ) ( not ( = ?auto_238628 ?auto_238630 ) ) ( not ( = ?auto_238628 ?auto_238631 ) ) ( not ( = ?auto_238628 ?auto_238632 ) ) ( not ( = ?auto_238629 ?auto_238630 ) ) ( not ( = ?auto_238629 ?auto_238631 ) ) ( not ( = ?auto_238629 ?auto_238632 ) ) ( not ( = ?auto_238630 ?auto_238631 ) ) ( not ( = ?auto_238630 ?auto_238632 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_238631 ?auto_238632 )
      ( MAKE-9CRATE-VERIFY ?auto_238623 ?auto_238624 ?auto_238625 ?auto_238627 ?auto_238626 ?auto_238628 ?auto_238629 ?auto_238630 ?auto_238631 ?auto_238632 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_238703 - SURFACE
      ?auto_238704 - SURFACE
      ?auto_238705 - SURFACE
      ?auto_238707 - SURFACE
      ?auto_238706 - SURFACE
      ?auto_238708 - SURFACE
      ?auto_238709 - SURFACE
      ?auto_238710 - SURFACE
      ?auto_238711 - SURFACE
      ?auto_238712 - SURFACE
    )
    :vars
    (
      ?auto_238714 - HOIST
      ?auto_238715 - PLACE
      ?auto_238713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_238714 ?auto_238715 ) ( SURFACE-AT ?auto_238711 ?auto_238715 ) ( CLEAR ?auto_238711 ) ( IS-CRATE ?auto_238712 ) ( not ( = ?auto_238711 ?auto_238712 ) ) ( TRUCK-AT ?auto_238713 ?auto_238715 ) ( AVAILABLE ?auto_238714 ) ( IN ?auto_238712 ?auto_238713 ) ( ON ?auto_238711 ?auto_238710 ) ( not ( = ?auto_238710 ?auto_238711 ) ) ( not ( = ?auto_238710 ?auto_238712 ) ) ( ON ?auto_238704 ?auto_238703 ) ( ON ?auto_238705 ?auto_238704 ) ( ON ?auto_238707 ?auto_238705 ) ( ON ?auto_238706 ?auto_238707 ) ( ON ?auto_238708 ?auto_238706 ) ( ON ?auto_238709 ?auto_238708 ) ( ON ?auto_238710 ?auto_238709 ) ( not ( = ?auto_238703 ?auto_238704 ) ) ( not ( = ?auto_238703 ?auto_238705 ) ) ( not ( = ?auto_238703 ?auto_238707 ) ) ( not ( = ?auto_238703 ?auto_238706 ) ) ( not ( = ?auto_238703 ?auto_238708 ) ) ( not ( = ?auto_238703 ?auto_238709 ) ) ( not ( = ?auto_238703 ?auto_238710 ) ) ( not ( = ?auto_238703 ?auto_238711 ) ) ( not ( = ?auto_238703 ?auto_238712 ) ) ( not ( = ?auto_238704 ?auto_238705 ) ) ( not ( = ?auto_238704 ?auto_238707 ) ) ( not ( = ?auto_238704 ?auto_238706 ) ) ( not ( = ?auto_238704 ?auto_238708 ) ) ( not ( = ?auto_238704 ?auto_238709 ) ) ( not ( = ?auto_238704 ?auto_238710 ) ) ( not ( = ?auto_238704 ?auto_238711 ) ) ( not ( = ?auto_238704 ?auto_238712 ) ) ( not ( = ?auto_238705 ?auto_238707 ) ) ( not ( = ?auto_238705 ?auto_238706 ) ) ( not ( = ?auto_238705 ?auto_238708 ) ) ( not ( = ?auto_238705 ?auto_238709 ) ) ( not ( = ?auto_238705 ?auto_238710 ) ) ( not ( = ?auto_238705 ?auto_238711 ) ) ( not ( = ?auto_238705 ?auto_238712 ) ) ( not ( = ?auto_238707 ?auto_238706 ) ) ( not ( = ?auto_238707 ?auto_238708 ) ) ( not ( = ?auto_238707 ?auto_238709 ) ) ( not ( = ?auto_238707 ?auto_238710 ) ) ( not ( = ?auto_238707 ?auto_238711 ) ) ( not ( = ?auto_238707 ?auto_238712 ) ) ( not ( = ?auto_238706 ?auto_238708 ) ) ( not ( = ?auto_238706 ?auto_238709 ) ) ( not ( = ?auto_238706 ?auto_238710 ) ) ( not ( = ?auto_238706 ?auto_238711 ) ) ( not ( = ?auto_238706 ?auto_238712 ) ) ( not ( = ?auto_238708 ?auto_238709 ) ) ( not ( = ?auto_238708 ?auto_238710 ) ) ( not ( = ?auto_238708 ?auto_238711 ) ) ( not ( = ?auto_238708 ?auto_238712 ) ) ( not ( = ?auto_238709 ?auto_238710 ) ) ( not ( = ?auto_238709 ?auto_238711 ) ) ( not ( = ?auto_238709 ?auto_238712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_238710 ?auto_238711 ?auto_238712 )
      ( MAKE-9CRATE-VERIFY ?auto_238703 ?auto_238704 ?auto_238705 ?auto_238707 ?auto_238706 ?auto_238708 ?auto_238709 ?auto_238710 ?auto_238711 ?auto_238712 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_238793 - SURFACE
      ?auto_238794 - SURFACE
      ?auto_238795 - SURFACE
      ?auto_238797 - SURFACE
      ?auto_238796 - SURFACE
      ?auto_238798 - SURFACE
      ?auto_238799 - SURFACE
      ?auto_238800 - SURFACE
      ?auto_238801 - SURFACE
      ?auto_238802 - SURFACE
    )
    :vars
    (
      ?auto_238806 - HOIST
      ?auto_238803 - PLACE
      ?auto_238805 - TRUCK
      ?auto_238804 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_238806 ?auto_238803 ) ( SURFACE-AT ?auto_238801 ?auto_238803 ) ( CLEAR ?auto_238801 ) ( IS-CRATE ?auto_238802 ) ( not ( = ?auto_238801 ?auto_238802 ) ) ( AVAILABLE ?auto_238806 ) ( IN ?auto_238802 ?auto_238805 ) ( ON ?auto_238801 ?auto_238800 ) ( not ( = ?auto_238800 ?auto_238801 ) ) ( not ( = ?auto_238800 ?auto_238802 ) ) ( TRUCK-AT ?auto_238805 ?auto_238804 ) ( not ( = ?auto_238804 ?auto_238803 ) ) ( ON ?auto_238794 ?auto_238793 ) ( ON ?auto_238795 ?auto_238794 ) ( ON ?auto_238797 ?auto_238795 ) ( ON ?auto_238796 ?auto_238797 ) ( ON ?auto_238798 ?auto_238796 ) ( ON ?auto_238799 ?auto_238798 ) ( ON ?auto_238800 ?auto_238799 ) ( not ( = ?auto_238793 ?auto_238794 ) ) ( not ( = ?auto_238793 ?auto_238795 ) ) ( not ( = ?auto_238793 ?auto_238797 ) ) ( not ( = ?auto_238793 ?auto_238796 ) ) ( not ( = ?auto_238793 ?auto_238798 ) ) ( not ( = ?auto_238793 ?auto_238799 ) ) ( not ( = ?auto_238793 ?auto_238800 ) ) ( not ( = ?auto_238793 ?auto_238801 ) ) ( not ( = ?auto_238793 ?auto_238802 ) ) ( not ( = ?auto_238794 ?auto_238795 ) ) ( not ( = ?auto_238794 ?auto_238797 ) ) ( not ( = ?auto_238794 ?auto_238796 ) ) ( not ( = ?auto_238794 ?auto_238798 ) ) ( not ( = ?auto_238794 ?auto_238799 ) ) ( not ( = ?auto_238794 ?auto_238800 ) ) ( not ( = ?auto_238794 ?auto_238801 ) ) ( not ( = ?auto_238794 ?auto_238802 ) ) ( not ( = ?auto_238795 ?auto_238797 ) ) ( not ( = ?auto_238795 ?auto_238796 ) ) ( not ( = ?auto_238795 ?auto_238798 ) ) ( not ( = ?auto_238795 ?auto_238799 ) ) ( not ( = ?auto_238795 ?auto_238800 ) ) ( not ( = ?auto_238795 ?auto_238801 ) ) ( not ( = ?auto_238795 ?auto_238802 ) ) ( not ( = ?auto_238797 ?auto_238796 ) ) ( not ( = ?auto_238797 ?auto_238798 ) ) ( not ( = ?auto_238797 ?auto_238799 ) ) ( not ( = ?auto_238797 ?auto_238800 ) ) ( not ( = ?auto_238797 ?auto_238801 ) ) ( not ( = ?auto_238797 ?auto_238802 ) ) ( not ( = ?auto_238796 ?auto_238798 ) ) ( not ( = ?auto_238796 ?auto_238799 ) ) ( not ( = ?auto_238796 ?auto_238800 ) ) ( not ( = ?auto_238796 ?auto_238801 ) ) ( not ( = ?auto_238796 ?auto_238802 ) ) ( not ( = ?auto_238798 ?auto_238799 ) ) ( not ( = ?auto_238798 ?auto_238800 ) ) ( not ( = ?auto_238798 ?auto_238801 ) ) ( not ( = ?auto_238798 ?auto_238802 ) ) ( not ( = ?auto_238799 ?auto_238800 ) ) ( not ( = ?auto_238799 ?auto_238801 ) ) ( not ( = ?auto_238799 ?auto_238802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_238800 ?auto_238801 ?auto_238802 )
      ( MAKE-9CRATE-VERIFY ?auto_238793 ?auto_238794 ?auto_238795 ?auto_238797 ?auto_238796 ?auto_238798 ?auto_238799 ?auto_238800 ?auto_238801 ?auto_238802 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_238892 - SURFACE
      ?auto_238893 - SURFACE
      ?auto_238894 - SURFACE
      ?auto_238896 - SURFACE
      ?auto_238895 - SURFACE
      ?auto_238897 - SURFACE
      ?auto_238898 - SURFACE
      ?auto_238899 - SURFACE
      ?auto_238900 - SURFACE
      ?auto_238901 - SURFACE
    )
    :vars
    (
      ?auto_238905 - HOIST
      ?auto_238906 - PLACE
      ?auto_238904 - TRUCK
      ?auto_238903 - PLACE
      ?auto_238902 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_238905 ?auto_238906 ) ( SURFACE-AT ?auto_238900 ?auto_238906 ) ( CLEAR ?auto_238900 ) ( IS-CRATE ?auto_238901 ) ( not ( = ?auto_238900 ?auto_238901 ) ) ( AVAILABLE ?auto_238905 ) ( ON ?auto_238900 ?auto_238899 ) ( not ( = ?auto_238899 ?auto_238900 ) ) ( not ( = ?auto_238899 ?auto_238901 ) ) ( TRUCK-AT ?auto_238904 ?auto_238903 ) ( not ( = ?auto_238903 ?auto_238906 ) ) ( HOIST-AT ?auto_238902 ?auto_238903 ) ( LIFTING ?auto_238902 ?auto_238901 ) ( not ( = ?auto_238905 ?auto_238902 ) ) ( ON ?auto_238893 ?auto_238892 ) ( ON ?auto_238894 ?auto_238893 ) ( ON ?auto_238896 ?auto_238894 ) ( ON ?auto_238895 ?auto_238896 ) ( ON ?auto_238897 ?auto_238895 ) ( ON ?auto_238898 ?auto_238897 ) ( ON ?auto_238899 ?auto_238898 ) ( not ( = ?auto_238892 ?auto_238893 ) ) ( not ( = ?auto_238892 ?auto_238894 ) ) ( not ( = ?auto_238892 ?auto_238896 ) ) ( not ( = ?auto_238892 ?auto_238895 ) ) ( not ( = ?auto_238892 ?auto_238897 ) ) ( not ( = ?auto_238892 ?auto_238898 ) ) ( not ( = ?auto_238892 ?auto_238899 ) ) ( not ( = ?auto_238892 ?auto_238900 ) ) ( not ( = ?auto_238892 ?auto_238901 ) ) ( not ( = ?auto_238893 ?auto_238894 ) ) ( not ( = ?auto_238893 ?auto_238896 ) ) ( not ( = ?auto_238893 ?auto_238895 ) ) ( not ( = ?auto_238893 ?auto_238897 ) ) ( not ( = ?auto_238893 ?auto_238898 ) ) ( not ( = ?auto_238893 ?auto_238899 ) ) ( not ( = ?auto_238893 ?auto_238900 ) ) ( not ( = ?auto_238893 ?auto_238901 ) ) ( not ( = ?auto_238894 ?auto_238896 ) ) ( not ( = ?auto_238894 ?auto_238895 ) ) ( not ( = ?auto_238894 ?auto_238897 ) ) ( not ( = ?auto_238894 ?auto_238898 ) ) ( not ( = ?auto_238894 ?auto_238899 ) ) ( not ( = ?auto_238894 ?auto_238900 ) ) ( not ( = ?auto_238894 ?auto_238901 ) ) ( not ( = ?auto_238896 ?auto_238895 ) ) ( not ( = ?auto_238896 ?auto_238897 ) ) ( not ( = ?auto_238896 ?auto_238898 ) ) ( not ( = ?auto_238896 ?auto_238899 ) ) ( not ( = ?auto_238896 ?auto_238900 ) ) ( not ( = ?auto_238896 ?auto_238901 ) ) ( not ( = ?auto_238895 ?auto_238897 ) ) ( not ( = ?auto_238895 ?auto_238898 ) ) ( not ( = ?auto_238895 ?auto_238899 ) ) ( not ( = ?auto_238895 ?auto_238900 ) ) ( not ( = ?auto_238895 ?auto_238901 ) ) ( not ( = ?auto_238897 ?auto_238898 ) ) ( not ( = ?auto_238897 ?auto_238899 ) ) ( not ( = ?auto_238897 ?auto_238900 ) ) ( not ( = ?auto_238897 ?auto_238901 ) ) ( not ( = ?auto_238898 ?auto_238899 ) ) ( not ( = ?auto_238898 ?auto_238900 ) ) ( not ( = ?auto_238898 ?auto_238901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_238899 ?auto_238900 ?auto_238901 )
      ( MAKE-9CRATE-VERIFY ?auto_238892 ?auto_238893 ?auto_238894 ?auto_238896 ?auto_238895 ?auto_238897 ?auto_238898 ?auto_238899 ?auto_238900 ?auto_238901 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239000 - SURFACE
      ?auto_239001 - SURFACE
      ?auto_239002 - SURFACE
      ?auto_239004 - SURFACE
      ?auto_239003 - SURFACE
      ?auto_239005 - SURFACE
      ?auto_239006 - SURFACE
      ?auto_239007 - SURFACE
      ?auto_239008 - SURFACE
      ?auto_239009 - SURFACE
    )
    :vars
    (
      ?auto_239012 - HOIST
      ?auto_239015 - PLACE
      ?auto_239013 - TRUCK
      ?auto_239010 - PLACE
      ?auto_239014 - HOIST
      ?auto_239011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239012 ?auto_239015 ) ( SURFACE-AT ?auto_239008 ?auto_239015 ) ( CLEAR ?auto_239008 ) ( IS-CRATE ?auto_239009 ) ( not ( = ?auto_239008 ?auto_239009 ) ) ( AVAILABLE ?auto_239012 ) ( ON ?auto_239008 ?auto_239007 ) ( not ( = ?auto_239007 ?auto_239008 ) ) ( not ( = ?auto_239007 ?auto_239009 ) ) ( TRUCK-AT ?auto_239013 ?auto_239010 ) ( not ( = ?auto_239010 ?auto_239015 ) ) ( HOIST-AT ?auto_239014 ?auto_239010 ) ( not ( = ?auto_239012 ?auto_239014 ) ) ( AVAILABLE ?auto_239014 ) ( SURFACE-AT ?auto_239009 ?auto_239010 ) ( ON ?auto_239009 ?auto_239011 ) ( CLEAR ?auto_239009 ) ( not ( = ?auto_239008 ?auto_239011 ) ) ( not ( = ?auto_239009 ?auto_239011 ) ) ( not ( = ?auto_239007 ?auto_239011 ) ) ( ON ?auto_239001 ?auto_239000 ) ( ON ?auto_239002 ?auto_239001 ) ( ON ?auto_239004 ?auto_239002 ) ( ON ?auto_239003 ?auto_239004 ) ( ON ?auto_239005 ?auto_239003 ) ( ON ?auto_239006 ?auto_239005 ) ( ON ?auto_239007 ?auto_239006 ) ( not ( = ?auto_239000 ?auto_239001 ) ) ( not ( = ?auto_239000 ?auto_239002 ) ) ( not ( = ?auto_239000 ?auto_239004 ) ) ( not ( = ?auto_239000 ?auto_239003 ) ) ( not ( = ?auto_239000 ?auto_239005 ) ) ( not ( = ?auto_239000 ?auto_239006 ) ) ( not ( = ?auto_239000 ?auto_239007 ) ) ( not ( = ?auto_239000 ?auto_239008 ) ) ( not ( = ?auto_239000 ?auto_239009 ) ) ( not ( = ?auto_239000 ?auto_239011 ) ) ( not ( = ?auto_239001 ?auto_239002 ) ) ( not ( = ?auto_239001 ?auto_239004 ) ) ( not ( = ?auto_239001 ?auto_239003 ) ) ( not ( = ?auto_239001 ?auto_239005 ) ) ( not ( = ?auto_239001 ?auto_239006 ) ) ( not ( = ?auto_239001 ?auto_239007 ) ) ( not ( = ?auto_239001 ?auto_239008 ) ) ( not ( = ?auto_239001 ?auto_239009 ) ) ( not ( = ?auto_239001 ?auto_239011 ) ) ( not ( = ?auto_239002 ?auto_239004 ) ) ( not ( = ?auto_239002 ?auto_239003 ) ) ( not ( = ?auto_239002 ?auto_239005 ) ) ( not ( = ?auto_239002 ?auto_239006 ) ) ( not ( = ?auto_239002 ?auto_239007 ) ) ( not ( = ?auto_239002 ?auto_239008 ) ) ( not ( = ?auto_239002 ?auto_239009 ) ) ( not ( = ?auto_239002 ?auto_239011 ) ) ( not ( = ?auto_239004 ?auto_239003 ) ) ( not ( = ?auto_239004 ?auto_239005 ) ) ( not ( = ?auto_239004 ?auto_239006 ) ) ( not ( = ?auto_239004 ?auto_239007 ) ) ( not ( = ?auto_239004 ?auto_239008 ) ) ( not ( = ?auto_239004 ?auto_239009 ) ) ( not ( = ?auto_239004 ?auto_239011 ) ) ( not ( = ?auto_239003 ?auto_239005 ) ) ( not ( = ?auto_239003 ?auto_239006 ) ) ( not ( = ?auto_239003 ?auto_239007 ) ) ( not ( = ?auto_239003 ?auto_239008 ) ) ( not ( = ?auto_239003 ?auto_239009 ) ) ( not ( = ?auto_239003 ?auto_239011 ) ) ( not ( = ?auto_239005 ?auto_239006 ) ) ( not ( = ?auto_239005 ?auto_239007 ) ) ( not ( = ?auto_239005 ?auto_239008 ) ) ( not ( = ?auto_239005 ?auto_239009 ) ) ( not ( = ?auto_239005 ?auto_239011 ) ) ( not ( = ?auto_239006 ?auto_239007 ) ) ( not ( = ?auto_239006 ?auto_239008 ) ) ( not ( = ?auto_239006 ?auto_239009 ) ) ( not ( = ?auto_239006 ?auto_239011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239007 ?auto_239008 ?auto_239009 )
      ( MAKE-9CRATE-VERIFY ?auto_239000 ?auto_239001 ?auto_239002 ?auto_239004 ?auto_239003 ?auto_239005 ?auto_239006 ?auto_239007 ?auto_239008 ?auto_239009 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239109 - SURFACE
      ?auto_239110 - SURFACE
      ?auto_239111 - SURFACE
      ?auto_239113 - SURFACE
      ?auto_239112 - SURFACE
      ?auto_239114 - SURFACE
      ?auto_239115 - SURFACE
      ?auto_239116 - SURFACE
      ?auto_239117 - SURFACE
      ?auto_239118 - SURFACE
    )
    :vars
    (
      ?auto_239120 - HOIST
      ?auto_239119 - PLACE
      ?auto_239121 - PLACE
      ?auto_239124 - HOIST
      ?auto_239123 - SURFACE
      ?auto_239122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239120 ?auto_239119 ) ( SURFACE-AT ?auto_239117 ?auto_239119 ) ( CLEAR ?auto_239117 ) ( IS-CRATE ?auto_239118 ) ( not ( = ?auto_239117 ?auto_239118 ) ) ( AVAILABLE ?auto_239120 ) ( ON ?auto_239117 ?auto_239116 ) ( not ( = ?auto_239116 ?auto_239117 ) ) ( not ( = ?auto_239116 ?auto_239118 ) ) ( not ( = ?auto_239121 ?auto_239119 ) ) ( HOIST-AT ?auto_239124 ?auto_239121 ) ( not ( = ?auto_239120 ?auto_239124 ) ) ( AVAILABLE ?auto_239124 ) ( SURFACE-AT ?auto_239118 ?auto_239121 ) ( ON ?auto_239118 ?auto_239123 ) ( CLEAR ?auto_239118 ) ( not ( = ?auto_239117 ?auto_239123 ) ) ( not ( = ?auto_239118 ?auto_239123 ) ) ( not ( = ?auto_239116 ?auto_239123 ) ) ( TRUCK-AT ?auto_239122 ?auto_239119 ) ( ON ?auto_239110 ?auto_239109 ) ( ON ?auto_239111 ?auto_239110 ) ( ON ?auto_239113 ?auto_239111 ) ( ON ?auto_239112 ?auto_239113 ) ( ON ?auto_239114 ?auto_239112 ) ( ON ?auto_239115 ?auto_239114 ) ( ON ?auto_239116 ?auto_239115 ) ( not ( = ?auto_239109 ?auto_239110 ) ) ( not ( = ?auto_239109 ?auto_239111 ) ) ( not ( = ?auto_239109 ?auto_239113 ) ) ( not ( = ?auto_239109 ?auto_239112 ) ) ( not ( = ?auto_239109 ?auto_239114 ) ) ( not ( = ?auto_239109 ?auto_239115 ) ) ( not ( = ?auto_239109 ?auto_239116 ) ) ( not ( = ?auto_239109 ?auto_239117 ) ) ( not ( = ?auto_239109 ?auto_239118 ) ) ( not ( = ?auto_239109 ?auto_239123 ) ) ( not ( = ?auto_239110 ?auto_239111 ) ) ( not ( = ?auto_239110 ?auto_239113 ) ) ( not ( = ?auto_239110 ?auto_239112 ) ) ( not ( = ?auto_239110 ?auto_239114 ) ) ( not ( = ?auto_239110 ?auto_239115 ) ) ( not ( = ?auto_239110 ?auto_239116 ) ) ( not ( = ?auto_239110 ?auto_239117 ) ) ( not ( = ?auto_239110 ?auto_239118 ) ) ( not ( = ?auto_239110 ?auto_239123 ) ) ( not ( = ?auto_239111 ?auto_239113 ) ) ( not ( = ?auto_239111 ?auto_239112 ) ) ( not ( = ?auto_239111 ?auto_239114 ) ) ( not ( = ?auto_239111 ?auto_239115 ) ) ( not ( = ?auto_239111 ?auto_239116 ) ) ( not ( = ?auto_239111 ?auto_239117 ) ) ( not ( = ?auto_239111 ?auto_239118 ) ) ( not ( = ?auto_239111 ?auto_239123 ) ) ( not ( = ?auto_239113 ?auto_239112 ) ) ( not ( = ?auto_239113 ?auto_239114 ) ) ( not ( = ?auto_239113 ?auto_239115 ) ) ( not ( = ?auto_239113 ?auto_239116 ) ) ( not ( = ?auto_239113 ?auto_239117 ) ) ( not ( = ?auto_239113 ?auto_239118 ) ) ( not ( = ?auto_239113 ?auto_239123 ) ) ( not ( = ?auto_239112 ?auto_239114 ) ) ( not ( = ?auto_239112 ?auto_239115 ) ) ( not ( = ?auto_239112 ?auto_239116 ) ) ( not ( = ?auto_239112 ?auto_239117 ) ) ( not ( = ?auto_239112 ?auto_239118 ) ) ( not ( = ?auto_239112 ?auto_239123 ) ) ( not ( = ?auto_239114 ?auto_239115 ) ) ( not ( = ?auto_239114 ?auto_239116 ) ) ( not ( = ?auto_239114 ?auto_239117 ) ) ( not ( = ?auto_239114 ?auto_239118 ) ) ( not ( = ?auto_239114 ?auto_239123 ) ) ( not ( = ?auto_239115 ?auto_239116 ) ) ( not ( = ?auto_239115 ?auto_239117 ) ) ( not ( = ?auto_239115 ?auto_239118 ) ) ( not ( = ?auto_239115 ?auto_239123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239116 ?auto_239117 ?auto_239118 )
      ( MAKE-9CRATE-VERIFY ?auto_239109 ?auto_239110 ?auto_239111 ?auto_239113 ?auto_239112 ?auto_239114 ?auto_239115 ?auto_239116 ?auto_239117 ?auto_239118 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239218 - SURFACE
      ?auto_239219 - SURFACE
      ?auto_239220 - SURFACE
      ?auto_239222 - SURFACE
      ?auto_239221 - SURFACE
      ?auto_239223 - SURFACE
      ?auto_239224 - SURFACE
      ?auto_239225 - SURFACE
      ?auto_239226 - SURFACE
      ?auto_239227 - SURFACE
    )
    :vars
    (
      ?auto_239232 - HOIST
      ?auto_239229 - PLACE
      ?auto_239230 - PLACE
      ?auto_239228 - HOIST
      ?auto_239233 - SURFACE
      ?auto_239231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239232 ?auto_239229 ) ( IS-CRATE ?auto_239227 ) ( not ( = ?auto_239226 ?auto_239227 ) ) ( not ( = ?auto_239225 ?auto_239226 ) ) ( not ( = ?auto_239225 ?auto_239227 ) ) ( not ( = ?auto_239230 ?auto_239229 ) ) ( HOIST-AT ?auto_239228 ?auto_239230 ) ( not ( = ?auto_239232 ?auto_239228 ) ) ( AVAILABLE ?auto_239228 ) ( SURFACE-AT ?auto_239227 ?auto_239230 ) ( ON ?auto_239227 ?auto_239233 ) ( CLEAR ?auto_239227 ) ( not ( = ?auto_239226 ?auto_239233 ) ) ( not ( = ?auto_239227 ?auto_239233 ) ) ( not ( = ?auto_239225 ?auto_239233 ) ) ( TRUCK-AT ?auto_239231 ?auto_239229 ) ( SURFACE-AT ?auto_239225 ?auto_239229 ) ( CLEAR ?auto_239225 ) ( LIFTING ?auto_239232 ?auto_239226 ) ( IS-CRATE ?auto_239226 ) ( ON ?auto_239219 ?auto_239218 ) ( ON ?auto_239220 ?auto_239219 ) ( ON ?auto_239222 ?auto_239220 ) ( ON ?auto_239221 ?auto_239222 ) ( ON ?auto_239223 ?auto_239221 ) ( ON ?auto_239224 ?auto_239223 ) ( ON ?auto_239225 ?auto_239224 ) ( not ( = ?auto_239218 ?auto_239219 ) ) ( not ( = ?auto_239218 ?auto_239220 ) ) ( not ( = ?auto_239218 ?auto_239222 ) ) ( not ( = ?auto_239218 ?auto_239221 ) ) ( not ( = ?auto_239218 ?auto_239223 ) ) ( not ( = ?auto_239218 ?auto_239224 ) ) ( not ( = ?auto_239218 ?auto_239225 ) ) ( not ( = ?auto_239218 ?auto_239226 ) ) ( not ( = ?auto_239218 ?auto_239227 ) ) ( not ( = ?auto_239218 ?auto_239233 ) ) ( not ( = ?auto_239219 ?auto_239220 ) ) ( not ( = ?auto_239219 ?auto_239222 ) ) ( not ( = ?auto_239219 ?auto_239221 ) ) ( not ( = ?auto_239219 ?auto_239223 ) ) ( not ( = ?auto_239219 ?auto_239224 ) ) ( not ( = ?auto_239219 ?auto_239225 ) ) ( not ( = ?auto_239219 ?auto_239226 ) ) ( not ( = ?auto_239219 ?auto_239227 ) ) ( not ( = ?auto_239219 ?auto_239233 ) ) ( not ( = ?auto_239220 ?auto_239222 ) ) ( not ( = ?auto_239220 ?auto_239221 ) ) ( not ( = ?auto_239220 ?auto_239223 ) ) ( not ( = ?auto_239220 ?auto_239224 ) ) ( not ( = ?auto_239220 ?auto_239225 ) ) ( not ( = ?auto_239220 ?auto_239226 ) ) ( not ( = ?auto_239220 ?auto_239227 ) ) ( not ( = ?auto_239220 ?auto_239233 ) ) ( not ( = ?auto_239222 ?auto_239221 ) ) ( not ( = ?auto_239222 ?auto_239223 ) ) ( not ( = ?auto_239222 ?auto_239224 ) ) ( not ( = ?auto_239222 ?auto_239225 ) ) ( not ( = ?auto_239222 ?auto_239226 ) ) ( not ( = ?auto_239222 ?auto_239227 ) ) ( not ( = ?auto_239222 ?auto_239233 ) ) ( not ( = ?auto_239221 ?auto_239223 ) ) ( not ( = ?auto_239221 ?auto_239224 ) ) ( not ( = ?auto_239221 ?auto_239225 ) ) ( not ( = ?auto_239221 ?auto_239226 ) ) ( not ( = ?auto_239221 ?auto_239227 ) ) ( not ( = ?auto_239221 ?auto_239233 ) ) ( not ( = ?auto_239223 ?auto_239224 ) ) ( not ( = ?auto_239223 ?auto_239225 ) ) ( not ( = ?auto_239223 ?auto_239226 ) ) ( not ( = ?auto_239223 ?auto_239227 ) ) ( not ( = ?auto_239223 ?auto_239233 ) ) ( not ( = ?auto_239224 ?auto_239225 ) ) ( not ( = ?auto_239224 ?auto_239226 ) ) ( not ( = ?auto_239224 ?auto_239227 ) ) ( not ( = ?auto_239224 ?auto_239233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239225 ?auto_239226 ?auto_239227 )
      ( MAKE-9CRATE-VERIFY ?auto_239218 ?auto_239219 ?auto_239220 ?auto_239222 ?auto_239221 ?auto_239223 ?auto_239224 ?auto_239225 ?auto_239226 ?auto_239227 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239327 - SURFACE
      ?auto_239328 - SURFACE
      ?auto_239329 - SURFACE
      ?auto_239331 - SURFACE
      ?auto_239330 - SURFACE
      ?auto_239332 - SURFACE
      ?auto_239333 - SURFACE
      ?auto_239334 - SURFACE
      ?auto_239335 - SURFACE
      ?auto_239336 - SURFACE
    )
    :vars
    (
      ?auto_239342 - HOIST
      ?auto_239337 - PLACE
      ?auto_239340 - PLACE
      ?auto_239341 - HOIST
      ?auto_239339 - SURFACE
      ?auto_239338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239342 ?auto_239337 ) ( IS-CRATE ?auto_239336 ) ( not ( = ?auto_239335 ?auto_239336 ) ) ( not ( = ?auto_239334 ?auto_239335 ) ) ( not ( = ?auto_239334 ?auto_239336 ) ) ( not ( = ?auto_239340 ?auto_239337 ) ) ( HOIST-AT ?auto_239341 ?auto_239340 ) ( not ( = ?auto_239342 ?auto_239341 ) ) ( AVAILABLE ?auto_239341 ) ( SURFACE-AT ?auto_239336 ?auto_239340 ) ( ON ?auto_239336 ?auto_239339 ) ( CLEAR ?auto_239336 ) ( not ( = ?auto_239335 ?auto_239339 ) ) ( not ( = ?auto_239336 ?auto_239339 ) ) ( not ( = ?auto_239334 ?auto_239339 ) ) ( TRUCK-AT ?auto_239338 ?auto_239337 ) ( SURFACE-AT ?auto_239334 ?auto_239337 ) ( CLEAR ?auto_239334 ) ( IS-CRATE ?auto_239335 ) ( AVAILABLE ?auto_239342 ) ( IN ?auto_239335 ?auto_239338 ) ( ON ?auto_239328 ?auto_239327 ) ( ON ?auto_239329 ?auto_239328 ) ( ON ?auto_239331 ?auto_239329 ) ( ON ?auto_239330 ?auto_239331 ) ( ON ?auto_239332 ?auto_239330 ) ( ON ?auto_239333 ?auto_239332 ) ( ON ?auto_239334 ?auto_239333 ) ( not ( = ?auto_239327 ?auto_239328 ) ) ( not ( = ?auto_239327 ?auto_239329 ) ) ( not ( = ?auto_239327 ?auto_239331 ) ) ( not ( = ?auto_239327 ?auto_239330 ) ) ( not ( = ?auto_239327 ?auto_239332 ) ) ( not ( = ?auto_239327 ?auto_239333 ) ) ( not ( = ?auto_239327 ?auto_239334 ) ) ( not ( = ?auto_239327 ?auto_239335 ) ) ( not ( = ?auto_239327 ?auto_239336 ) ) ( not ( = ?auto_239327 ?auto_239339 ) ) ( not ( = ?auto_239328 ?auto_239329 ) ) ( not ( = ?auto_239328 ?auto_239331 ) ) ( not ( = ?auto_239328 ?auto_239330 ) ) ( not ( = ?auto_239328 ?auto_239332 ) ) ( not ( = ?auto_239328 ?auto_239333 ) ) ( not ( = ?auto_239328 ?auto_239334 ) ) ( not ( = ?auto_239328 ?auto_239335 ) ) ( not ( = ?auto_239328 ?auto_239336 ) ) ( not ( = ?auto_239328 ?auto_239339 ) ) ( not ( = ?auto_239329 ?auto_239331 ) ) ( not ( = ?auto_239329 ?auto_239330 ) ) ( not ( = ?auto_239329 ?auto_239332 ) ) ( not ( = ?auto_239329 ?auto_239333 ) ) ( not ( = ?auto_239329 ?auto_239334 ) ) ( not ( = ?auto_239329 ?auto_239335 ) ) ( not ( = ?auto_239329 ?auto_239336 ) ) ( not ( = ?auto_239329 ?auto_239339 ) ) ( not ( = ?auto_239331 ?auto_239330 ) ) ( not ( = ?auto_239331 ?auto_239332 ) ) ( not ( = ?auto_239331 ?auto_239333 ) ) ( not ( = ?auto_239331 ?auto_239334 ) ) ( not ( = ?auto_239331 ?auto_239335 ) ) ( not ( = ?auto_239331 ?auto_239336 ) ) ( not ( = ?auto_239331 ?auto_239339 ) ) ( not ( = ?auto_239330 ?auto_239332 ) ) ( not ( = ?auto_239330 ?auto_239333 ) ) ( not ( = ?auto_239330 ?auto_239334 ) ) ( not ( = ?auto_239330 ?auto_239335 ) ) ( not ( = ?auto_239330 ?auto_239336 ) ) ( not ( = ?auto_239330 ?auto_239339 ) ) ( not ( = ?auto_239332 ?auto_239333 ) ) ( not ( = ?auto_239332 ?auto_239334 ) ) ( not ( = ?auto_239332 ?auto_239335 ) ) ( not ( = ?auto_239332 ?auto_239336 ) ) ( not ( = ?auto_239332 ?auto_239339 ) ) ( not ( = ?auto_239333 ?auto_239334 ) ) ( not ( = ?auto_239333 ?auto_239335 ) ) ( not ( = ?auto_239333 ?auto_239336 ) ) ( not ( = ?auto_239333 ?auto_239339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239334 ?auto_239335 ?auto_239336 )
      ( MAKE-9CRATE-VERIFY ?auto_239327 ?auto_239328 ?auto_239329 ?auto_239331 ?auto_239330 ?auto_239332 ?auto_239333 ?auto_239334 ?auto_239335 ?auto_239336 ) )
  )

)

