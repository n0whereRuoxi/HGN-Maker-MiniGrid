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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32075 - SURFACE
      ?auto_32076 - SURFACE
    )
    :vars
    (
      ?auto_32077 - HOIST
      ?auto_32078 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32077 ?auto_32078 ) ( SURFACE-AT ?auto_32075 ?auto_32078 ) ( CLEAR ?auto_32075 ) ( LIFTING ?auto_32077 ?auto_32076 ) ( IS-CRATE ?auto_32076 ) ( not ( = ?auto_32075 ?auto_32076 ) ) )
    :subtasks
    ( ( !DROP ?auto_32077 ?auto_32076 ?auto_32075 ?auto_32078 )
      ( MAKE-1CRATE-VERIFY ?auto_32075 ?auto_32076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32079 - SURFACE
      ?auto_32080 - SURFACE
    )
    :vars
    (
      ?auto_32081 - HOIST
      ?auto_32082 - PLACE
      ?auto_32083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32081 ?auto_32082 ) ( SURFACE-AT ?auto_32079 ?auto_32082 ) ( CLEAR ?auto_32079 ) ( IS-CRATE ?auto_32080 ) ( not ( = ?auto_32079 ?auto_32080 ) ) ( TRUCK-AT ?auto_32083 ?auto_32082 ) ( AVAILABLE ?auto_32081 ) ( IN ?auto_32080 ?auto_32083 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32081 ?auto_32080 ?auto_32083 ?auto_32082 )
      ( MAKE-1CRATE ?auto_32079 ?auto_32080 )
      ( MAKE-1CRATE-VERIFY ?auto_32079 ?auto_32080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32084 - SURFACE
      ?auto_32085 - SURFACE
    )
    :vars
    (
      ?auto_32087 - HOIST
      ?auto_32088 - PLACE
      ?auto_32086 - TRUCK
      ?auto_32089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32087 ?auto_32088 ) ( SURFACE-AT ?auto_32084 ?auto_32088 ) ( CLEAR ?auto_32084 ) ( IS-CRATE ?auto_32085 ) ( not ( = ?auto_32084 ?auto_32085 ) ) ( AVAILABLE ?auto_32087 ) ( IN ?auto_32085 ?auto_32086 ) ( TRUCK-AT ?auto_32086 ?auto_32089 ) ( not ( = ?auto_32089 ?auto_32088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32086 ?auto_32089 ?auto_32088 )
      ( MAKE-1CRATE ?auto_32084 ?auto_32085 )
      ( MAKE-1CRATE-VERIFY ?auto_32084 ?auto_32085 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32090 - SURFACE
      ?auto_32091 - SURFACE
    )
    :vars
    (
      ?auto_32095 - HOIST
      ?auto_32092 - PLACE
      ?auto_32093 - TRUCK
      ?auto_32094 - PLACE
      ?auto_32096 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32095 ?auto_32092 ) ( SURFACE-AT ?auto_32090 ?auto_32092 ) ( CLEAR ?auto_32090 ) ( IS-CRATE ?auto_32091 ) ( not ( = ?auto_32090 ?auto_32091 ) ) ( AVAILABLE ?auto_32095 ) ( TRUCK-AT ?auto_32093 ?auto_32094 ) ( not ( = ?auto_32094 ?auto_32092 ) ) ( HOIST-AT ?auto_32096 ?auto_32094 ) ( LIFTING ?auto_32096 ?auto_32091 ) ( not ( = ?auto_32095 ?auto_32096 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32096 ?auto_32091 ?auto_32093 ?auto_32094 )
      ( MAKE-1CRATE ?auto_32090 ?auto_32091 )
      ( MAKE-1CRATE-VERIFY ?auto_32090 ?auto_32091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32097 - SURFACE
      ?auto_32098 - SURFACE
    )
    :vars
    (
      ?auto_32101 - HOIST
      ?auto_32099 - PLACE
      ?auto_32100 - TRUCK
      ?auto_32103 - PLACE
      ?auto_32102 - HOIST
      ?auto_32104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32101 ?auto_32099 ) ( SURFACE-AT ?auto_32097 ?auto_32099 ) ( CLEAR ?auto_32097 ) ( IS-CRATE ?auto_32098 ) ( not ( = ?auto_32097 ?auto_32098 ) ) ( AVAILABLE ?auto_32101 ) ( TRUCK-AT ?auto_32100 ?auto_32103 ) ( not ( = ?auto_32103 ?auto_32099 ) ) ( HOIST-AT ?auto_32102 ?auto_32103 ) ( not ( = ?auto_32101 ?auto_32102 ) ) ( AVAILABLE ?auto_32102 ) ( SURFACE-AT ?auto_32098 ?auto_32103 ) ( ON ?auto_32098 ?auto_32104 ) ( CLEAR ?auto_32098 ) ( not ( = ?auto_32097 ?auto_32104 ) ) ( not ( = ?auto_32098 ?auto_32104 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32102 ?auto_32098 ?auto_32104 ?auto_32103 )
      ( MAKE-1CRATE ?auto_32097 ?auto_32098 )
      ( MAKE-1CRATE-VERIFY ?auto_32097 ?auto_32098 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32105 - SURFACE
      ?auto_32106 - SURFACE
    )
    :vars
    (
      ?auto_32111 - HOIST
      ?auto_32110 - PLACE
      ?auto_32107 - PLACE
      ?auto_32109 - HOIST
      ?auto_32108 - SURFACE
      ?auto_32112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32111 ?auto_32110 ) ( SURFACE-AT ?auto_32105 ?auto_32110 ) ( CLEAR ?auto_32105 ) ( IS-CRATE ?auto_32106 ) ( not ( = ?auto_32105 ?auto_32106 ) ) ( AVAILABLE ?auto_32111 ) ( not ( = ?auto_32107 ?auto_32110 ) ) ( HOIST-AT ?auto_32109 ?auto_32107 ) ( not ( = ?auto_32111 ?auto_32109 ) ) ( AVAILABLE ?auto_32109 ) ( SURFACE-AT ?auto_32106 ?auto_32107 ) ( ON ?auto_32106 ?auto_32108 ) ( CLEAR ?auto_32106 ) ( not ( = ?auto_32105 ?auto_32108 ) ) ( not ( = ?auto_32106 ?auto_32108 ) ) ( TRUCK-AT ?auto_32112 ?auto_32110 ) )
    :subtasks
    ( ( !DRIVE ?auto_32112 ?auto_32110 ?auto_32107 )
      ( MAKE-1CRATE ?auto_32105 ?auto_32106 )
      ( MAKE-1CRATE-VERIFY ?auto_32105 ?auto_32106 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32118 - SURFACE
      ?auto_32119 - SURFACE
    )
    :vars
    (
      ?auto_32120 - HOIST
      ?auto_32121 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32120 ?auto_32121 ) ( SURFACE-AT ?auto_32118 ?auto_32121 ) ( CLEAR ?auto_32118 ) ( LIFTING ?auto_32120 ?auto_32119 ) ( IS-CRATE ?auto_32119 ) ( not ( = ?auto_32118 ?auto_32119 ) ) )
    :subtasks
    ( ( !DROP ?auto_32120 ?auto_32119 ?auto_32118 ?auto_32121 )
      ( MAKE-1CRATE-VERIFY ?auto_32118 ?auto_32119 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32122 - SURFACE
      ?auto_32123 - SURFACE
      ?auto_32124 - SURFACE
    )
    :vars
    (
      ?auto_32126 - HOIST
      ?auto_32125 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32126 ?auto_32125 ) ( SURFACE-AT ?auto_32123 ?auto_32125 ) ( CLEAR ?auto_32123 ) ( LIFTING ?auto_32126 ?auto_32124 ) ( IS-CRATE ?auto_32124 ) ( not ( = ?auto_32123 ?auto_32124 ) ) ( ON ?auto_32123 ?auto_32122 ) ( not ( = ?auto_32122 ?auto_32123 ) ) ( not ( = ?auto_32122 ?auto_32124 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32123 ?auto_32124 )
      ( MAKE-2CRATE-VERIFY ?auto_32122 ?auto_32123 ?auto_32124 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32127 - SURFACE
      ?auto_32128 - SURFACE
    )
    :vars
    (
      ?auto_32130 - HOIST
      ?auto_32129 - PLACE
      ?auto_32131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32130 ?auto_32129 ) ( SURFACE-AT ?auto_32127 ?auto_32129 ) ( CLEAR ?auto_32127 ) ( IS-CRATE ?auto_32128 ) ( not ( = ?auto_32127 ?auto_32128 ) ) ( TRUCK-AT ?auto_32131 ?auto_32129 ) ( AVAILABLE ?auto_32130 ) ( IN ?auto_32128 ?auto_32131 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32130 ?auto_32128 ?auto_32131 ?auto_32129 )
      ( MAKE-1CRATE ?auto_32127 ?auto_32128 )
      ( MAKE-1CRATE-VERIFY ?auto_32127 ?auto_32128 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32132 - SURFACE
      ?auto_32133 - SURFACE
      ?auto_32134 - SURFACE
    )
    :vars
    (
      ?auto_32136 - HOIST
      ?auto_32137 - PLACE
      ?auto_32135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32136 ?auto_32137 ) ( SURFACE-AT ?auto_32133 ?auto_32137 ) ( CLEAR ?auto_32133 ) ( IS-CRATE ?auto_32134 ) ( not ( = ?auto_32133 ?auto_32134 ) ) ( TRUCK-AT ?auto_32135 ?auto_32137 ) ( AVAILABLE ?auto_32136 ) ( IN ?auto_32134 ?auto_32135 ) ( ON ?auto_32133 ?auto_32132 ) ( not ( = ?auto_32132 ?auto_32133 ) ) ( not ( = ?auto_32132 ?auto_32134 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32133 ?auto_32134 )
      ( MAKE-2CRATE-VERIFY ?auto_32132 ?auto_32133 ?auto_32134 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32138 - SURFACE
      ?auto_32139 - SURFACE
    )
    :vars
    (
      ?auto_32142 - HOIST
      ?auto_32141 - PLACE
      ?auto_32143 - TRUCK
      ?auto_32140 - SURFACE
      ?auto_32144 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32142 ?auto_32141 ) ( SURFACE-AT ?auto_32138 ?auto_32141 ) ( CLEAR ?auto_32138 ) ( IS-CRATE ?auto_32139 ) ( not ( = ?auto_32138 ?auto_32139 ) ) ( AVAILABLE ?auto_32142 ) ( IN ?auto_32139 ?auto_32143 ) ( ON ?auto_32138 ?auto_32140 ) ( not ( = ?auto_32140 ?auto_32138 ) ) ( not ( = ?auto_32140 ?auto_32139 ) ) ( TRUCK-AT ?auto_32143 ?auto_32144 ) ( not ( = ?auto_32144 ?auto_32141 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32143 ?auto_32144 ?auto_32141 )
      ( MAKE-2CRATE ?auto_32140 ?auto_32138 ?auto_32139 )
      ( MAKE-1CRATE-VERIFY ?auto_32138 ?auto_32139 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32145 - SURFACE
      ?auto_32146 - SURFACE
      ?auto_32147 - SURFACE
    )
    :vars
    (
      ?auto_32148 - HOIST
      ?auto_32151 - PLACE
      ?auto_32149 - TRUCK
      ?auto_32150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32148 ?auto_32151 ) ( SURFACE-AT ?auto_32146 ?auto_32151 ) ( CLEAR ?auto_32146 ) ( IS-CRATE ?auto_32147 ) ( not ( = ?auto_32146 ?auto_32147 ) ) ( AVAILABLE ?auto_32148 ) ( IN ?auto_32147 ?auto_32149 ) ( ON ?auto_32146 ?auto_32145 ) ( not ( = ?auto_32145 ?auto_32146 ) ) ( not ( = ?auto_32145 ?auto_32147 ) ) ( TRUCK-AT ?auto_32149 ?auto_32150 ) ( not ( = ?auto_32150 ?auto_32151 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32146 ?auto_32147 )
      ( MAKE-2CRATE-VERIFY ?auto_32145 ?auto_32146 ?auto_32147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32152 - SURFACE
      ?auto_32153 - SURFACE
    )
    :vars
    (
      ?auto_32158 - HOIST
      ?auto_32157 - PLACE
      ?auto_32155 - SURFACE
      ?auto_32154 - TRUCK
      ?auto_32156 - PLACE
      ?auto_32159 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32158 ?auto_32157 ) ( SURFACE-AT ?auto_32152 ?auto_32157 ) ( CLEAR ?auto_32152 ) ( IS-CRATE ?auto_32153 ) ( not ( = ?auto_32152 ?auto_32153 ) ) ( AVAILABLE ?auto_32158 ) ( ON ?auto_32152 ?auto_32155 ) ( not ( = ?auto_32155 ?auto_32152 ) ) ( not ( = ?auto_32155 ?auto_32153 ) ) ( TRUCK-AT ?auto_32154 ?auto_32156 ) ( not ( = ?auto_32156 ?auto_32157 ) ) ( HOIST-AT ?auto_32159 ?auto_32156 ) ( LIFTING ?auto_32159 ?auto_32153 ) ( not ( = ?auto_32158 ?auto_32159 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32159 ?auto_32153 ?auto_32154 ?auto_32156 )
      ( MAKE-2CRATE ?auto_32155 ?auto_32152 ?auto_32153 )
      ( MAKE-1CRATE-VERIFY ?auto_32152 ?auto_32153 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32160 - SURFACE
      ?auto_32161 - SURFACE
      ?auto_32162 - SURFACE
    )
    :vars
    (
      ?auto_32163 - HOIST
      ?auto_32167 - PLACE
      ?auto_32164 - TRUCK
      ?auto_32166 - PLACE
      ?auto_32165 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32163 ?auto_32167 ) ( SURFACE-AT ?auto_32161 ?auto_32167 ) ( CLEAR ?auto_32161 ) ( IS-CRATE ?auto_32162 ) ( not ( = ?auto_32161 ?auto_32162 ) ) ( AVAILABLE ?auto_32163 ) ( ON ?auto_32161 ?auto_32160 ) ( not ( = ?auto_32160 ?auto_32161 ) ) ( not ( = ?auto_32160 ?auto_32162 ) ) ( TRUCK-AT ?auto_32164 ?auto_32166 ) ( not ( = ?auto_32166 ?auto_32167 ) ) ( HOIST-AT ?auto_32165 ?auto_32166 ) ( LIFTING ?auto_32165 ?auto_32162 ) ( not ( = ?auto_32163 ?auto_32165 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32161 ?auto_32162 )
      ( MAKE-2CRATE-VERIFY ?auto_32160 ?auto_32161 ?auto_32162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32168 - SURFACE
      ?auto_32169 - SURFACE
    )
    :vars
    (
      ?auto_32175 - HOIST
      ?auto_32173 - PLACE
      ?auto_32171 - SURFACE
      ?auto_32170 - TRUCK
      ?auto_32172 - PLACE
      ?auto_32174 - HOIST
      ?auto_32176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32175 ?auto_32173 ) ( SURFACE-AT ?auto_32168 ?auto_32173 ) ( CLEAR ?auto_32168 ) ( IS-CRATE ?auto_32169 ) ( not ( = ?auto_32168 ?auto_32169 ) ) ( AVAILABLE ?auto_32175 ) ( ON ?auto_32168 ?auto_32171 ) ( not ( = ?auto_32171 ?auto_32168 ) ) ( not ( = ?auto_32171 ?auto_32169 ) ) ( TRUCK-AT ?auto_32170 ?auto_32172 ) ( not ( = ?auto_32172 ?auto_32173 ) ) ( HOIST-AT ?auto_32174 ?auto_32172 ) ( not ( = ?auto_32175 ?auto_32174 ) ) ( AVAILABLE ?auto_32174 ) ( SURFACE-AT ?auto_32169 ?auto_32172 ) ( ON ?auto_32169 ?auto_32176 ) ( CLEAR ?auto_32169 ) ( not ( = ?auto_32168 ?auto_32176 ) ) ( not ( = ?auto_32169 ?auto_32176 ) ) ( not ( = ?auto_32171 ?auto_32176 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32174 ?auto_32169 ?auto_32176 ?auto_32172 )
      ( MAKE-2CRATE ?auto_32171 ?auto_32168 ?auto_32169 )
      ( MAKE-1CRATE-VERIFY ?auto_32168 ?auto_32169 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32177 - SURFACE
      ?auto_32178 - SURFACE
      ?auto_32179 - SURFACE
    )
    :vars
    (
      ?auto_32180 - HOIST
      ?auto_32181 - PLACE
      ?auto_32184 - TRUCK
      ?auto_32185 - PLACE
      ?auto_32182 - HOIST
      ?auto_32183 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32180 ?auto_32181 ) ( SURFACE-AT ?auto_32178 ?auto_32181 ) ( CLEAR ?auto_32178 ) ( IS-CRATE ?auto_32179 ) ( not ( = ?auto_32178 ?auto_32179 ) ) ( AVAILABLE ?auto_32180 ) ( ON ?auto_32178 ?auto_32177 ) ( not ( = ?auto_32177 ?auto_32178 ) ) ( not ( = ?auto_32177 ?auto_32179 ) ) ( TRUCK-AT ?auto_32184 ?auto_32185 ) ( not ( = ?auto_32185 ?auto_32181 ) ) ( HOIST-AT ?auto_32182 ?auto_32185 ) ( not ( = ?auto_32180 ?auto_32182 ) ) ( AVAILABLE ?auto_32182 ) ( SURFACE-AT ?auto_32179 ?auto_32185 ) ( ON ?auto_32179 ?auto_32183 ) ( CLEAR ?auto_32179 ) ( not ( = ?auto_32178 ?auto_32183 ) ) ( not ( = ?auto_32179 ?auto_32183 ) ) ( not ( = ?auto_32177 ?auto_32183 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32178 ?auto_32179 )
      ( MAKE-2CRATE-VERIFY ?auto_32177 ?auto_32178 ?auto_32179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32186 - SURFACE
      ?auto_32187 - SURFACE
    )
    :vars
    (
      ?auto_32191 - HOIST
      ?auto_32189 - PLACE
      ?auto_32190 - SURFACE
      ?auto_32192 - PLACE
      ?auto_32188 - HOIST
      ?auto_32193 - SURFACE
      ?auto_32194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32191 ?auto_32189 ) ( SURFACE-AT ?auto_32186 ?auto_32189 ) ( CLEAR ?auto_32186 ) ( IS-CRATE ?auto_32187 ) ( not ( = ?auto_32186 ?auto_32187 ) ) ( AVAILABLE ?auto_32191 ) ( ON ?auto_32186 ?auto_32190 ) ( not ( = ?auto_32190 ?auto_32186 ) ) ( not ( = ?auto_32190 ?auto_32187 ) ) ( not ( = ?auto_32192 ?auto_32189 ) ) ( HOIST-AT ?auto_32188 ?auto_32192 ) ( not ( = ?auto_32191 ?auto_32188 ) ) ( AVAILABLE ?auto_32188 ) ( SURFACE-AT ?auto_32187 ?auto_32192 ) ( ON ?auto_32187 ?auto_32193 ) ( CLEAR ?auto_32187 ) ( not ( = ?auto_32186 ?auto_32193 ) ) ( not ( = ?auto_32187 ?auto_32193 ) ) ( not ( = ?auto_32190 ?auto_32193 ) ) ( TRUCK-AT ?auto_32194 ?auto_32189 ) )
    :subtasks
    ( ( !DRIVE ?auto_32194 ?auto_32189 ?auto_32192 )
      ( MAKE-2CRATE ?auto_32190 ?auto_32186 ?auto_32187 )
      ( MAKE-1CRATE-VERIFY ?auto_32186 ?auto_32187 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32195 - SURFACE
      ?auto_32196 - SURFACE
      ?auto_32197 - SURFACE
    )
    :vars
    (
      ?auto_32199 - HOIST
      ?auto_32201 - PLACE
      ?auto_32200 - PLACE
      ?auto_32203 - HOIST
      ?auto_32198 - SURFACE
      ?auto_32202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32199 ?auto_32201 ) ( SURFACE-AT ?auto_32196 ?auto_32201 ) ( CLEAR ?auto_32196 ) ( IS-CRATE ?auto_32197 ) ( not ( = ?auto_32196 ?auto_32197 ) ) ( AVAILABLE ?auto_32199 ) ( ON ?auto_32196 ?auto_32195 ) ( not ( = ?auto_32195 ?auto_32196 ) ) ( not ( = ?auto_32195 ?auto_32197 ) ) ( not ( = ?auto_32200 ?auto_32201 ) ) ( HOIST-AT ?auto_32203 ?auto_32200 ) ( not ( = ?auto_32199 ?auto_32203 ) ) ( AVAILABLE ?auto_32203 ) ( SURFACE-AT ?auto_32197 ?auto_32200 ) ( ON ?auto_32197 ?auto_32198 ) ( CLEAR ?auto_32197 ) ( not ( = ?auto_32196 ?auto_32198 ) ) ( not ( = ?auto_32197 ?auto_32198 ) ) ( not ( = ?auto_32195 ?auto_32198 ) ) ( TRUCK-AT ?auto_32202 ?auto_32201 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32196 ?auto_32197 )
      ( MAKE-2CRATE-VERIFY ?auto_32195 ?auto_32196 ?auto_32197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32204 - SURFACE
      ?auto_32205 - SURFACE
    )
    :vars
    (
      ?auto_32208 - HOIST
      ?auto_32207 - PLACE
      ?auto_32209 - SURFACE
      ?auto_32211 - PLACE
      ?auto_32210 - HOIST
      ?auto_32212 - SURFACE
      ?auto_32206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32208 ?auto_32207 ) ( IS-CRATE ?auto_32205 ) ( not ( = ?auto_32204 ?auto_32205 ) ) ( not ( = ?auto_32209 ?auto_32204 ) ) ( not ( = ?auto_32209 ?auto_32205 ) ) ( not ( = ?auto_32211 ?auto_32207 ) ) ( HOIST-AT ?auto_32210 ?auto_32211 ) ( not ( = ?auto_32208 ?auto_32210 ) ) ( AVAILABLE ?auto_32210 ) ( SURFACE-AT ?auto_32205 ?auto_32211 ) ( ON ?auto_32205 ?auto_32212 ) ( CLEAR ?auto_32205 ) ( not ( = ?auto_32204 ?auto_32212 ) ) ( not ( = ?auto_32205 ?auto_32212 ) ) ( not ( = ?auto_32209 ?auto_32212 ) ) ( TRUCK-AT ?auto_32206 ?auto_32207 ) ( SURFACE-AT ?auto_32209 ?auto_32207 ) ( CLEAR ?auto_32209 ) ( LIFTING ?auto_32208 ?auto_32204 ) ( IS-CRATE ?auto_32204 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32209 ?auto_32204 )
      ( MAKE-2CRATE ?auto_32209 ?auto_32204 ?auto_32205 )
      ( MAKE-1CRATE-VERIFY ?auto_32204 ?auto_32205 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32213 - SURFACE
      ?auto_32214 - SURFACE
      ?auto_32215 - SURFACE
    )
    :vars
    (
      ?auto_32220 - HOIST
      ?auto_32219 - PLACE
      ?auto_32218 - PLACE
      ?auto_32221 - HOIST
      ?auto_32217 - SURFACE
      ?auto_32216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32220 ?auto_32219 ) ( IS-CRATE ?auto_32215 ) ( not ( = ?auto_32214 ?auto_32215 ) ) ( not ( = ?auto_32213 ?auto_32214 ) ) ( not ( = ?auto_32213 ?auto_32215 ) ) ( not ( = ?auto_32218 ?auto_32219 ) ) ( HOIST-AT ?auto_32221 ?auto_32218 ) ( not ( = ?auto_32220 ?auto_32221 ) ) ( AVAILABLE ?auto_32221 ) ( SURFACE-AT ?auto_32215 ?auto_32218 ) ( ON ?auto_32215 ?auto_32217 ) ( CLEAR ?auto_32215 ) ( not ( = ?auto_32214 ?auto_32217 ) ) ( not ( = ?auto_32215 ?auto_32217 ) ) ( not ( = ?auto_32213 ?auto_32217 ) ) ( TRUCK-AT ?auto_32216 ?auto_32219 ) ( SURFACE-AT ?auto_32213 ?auto_32219 ) ( CLEAR ?auto_32213 ) ( LIFTING ?auto_32220 ?auto_32214 ) ( IS-CRATE ?auto_32214 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32214 ?auto_32215 )
      ( MAKE-2CRATE-VERIFY ?auto_32213 ?auto_32214 ?auto_32215 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32222 - SURFACE
      ?auto_32223 - SURFACE
    )
    :vars
    (
      ?auto_32227 - HOIST
      ?auto_32229 - PLACE
      ?auto_32226 - SURFACE
      ?auto_32230 - PLACE
      ?auto_32224 - HOIST
      ?auto_32225 - SURFACE
      ?auto_32228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32227 ?auto_32229 ) ( IS-CRATE ?auto_32223 ) ( not ( = ?auto_32222 ?auto_32223 ) ) ( not ( = ?auto_32226 ?auto_32222 ) ) ( not ( = ?auto_32226 ?auto_32223 ) ) ( not ( = ?auto_32230 ?auto_32229 ) ) ( HOIST-AT ?auto_32224 ?auto_32230 ) ( not ( = ?auto_32227 ?auto_32224 ) ) ( AVAILABLE ?auto_32224 ) ( SURFACE-AT ?auto_32223 ?auto_32230 ) ( ON ?auto_32223 ?auto_32225 ) ( CLEAR ?auto_32223 ) ( not ( = ?auto_32222 ?auto_32225 ) ) ( not ( = ?auto_32223 ?auto_32225 ) ) ( not ( = ?auto_32226 ?auto_32225 ) ) ( TRUCK-AT ?auto_32228 ?auto_32229 ) ( SURFACE-AT ?auto_32226 ?auto_32229 ) ( CLEAR ?auto_32226 ) ( IS-CRATE ?auto_32222 ) ( AVAILABLE ?auto_32227 ) ( IN ?auto_32222 ?auto_32228 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32227 ?auto_32222 ?auto_32228 ?auto_32229 )
      ( MAKE-2CRATE ?auto_32226 ?auto_32222 ?auto_32223 )
      ( MAKE-1CRATE-VERIFY ?auto_32222 ?auto_32223 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32231 - SURFACE
      ?auto_32232 - SURFACE
      ?auto_32233 - SURFACE
    )
    :vars
    (
      ?auto_32235 - HOIST
      ?auto_32234 - PLACE
      ?auto_32237 - PLACE
      ?auto_32236 - HOIST
      ?auto_32239 - SURFACE
      ?auto_32238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32235 ?auto_32234 ) ( IS-CRATE ?auto_32233 ) ( not ( = ?auto_32232 ?auto_32233 ) ) ( not ( = ?auto_32231 ?auto_32232 ) ) ( not ( = ?auto_32231 ?auto_32233 ) ) ( not ( = ?auto_32237 ?auto_32234 ) ) ( HOIST-AT ?auto_32236 ?auto_32237 ) ( not ( = ?auto_32235 ?auto_32236 ) ) ( AVAILABLE ?auto_32236 ) ( SURFACE-AT ?auto_32233 ?auto_32237 ) ( ON ?auto_32233 ?auto_32239 ) ( CLEAR ?auto_32233 ) ( not ( = ?auto_32232 ?auto_32239 ) ) ( not ( = ?auto_32233 ?auto_32239 ) ) ( not ( = ?auto_32231 ?auto_32239 ) ) ( TRUCK-AT ?auto_32238 ?auto_32234 ) ( SURFACE-AT ?auto_32231 ?auto_32234 ) ( CLEAR ?auto_32231 ) ( IS-CRATE ?auto_32232 ) ( AVAILABLE ?auto_32235 ) ( IN ?auto_32232 ?auto_32238 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32232 ?auto_32233 )
      ( MAKE-2CRATE-VERIFY ?auto_32231 ?auto_32232 ?auto_32233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32240 - SURFACE
      ?auto_32241 - SURFACE
    )
    :vars
    (
      ?auto_32243 - HOIST
      ?auto_32247 - PLACE
      ?auto_32245 - SURFACE
      ?auto_32248 - PLACE
      ?auto_32242 - HOIST
      ?auto_32246 - SURFACE
      ?auto_32244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32243 ?auto_32247 ) ( IS-CRATE ?auto_32241 ) ( not ( = ?auto_32240 ?auto_32241 ) ) ( not ( = ?auto_32245 ?auto_32240 ) ) ( not ( = ?auto_32245 ?auto_32241 ) ) ( not ( = ?auto_32248 ?auto_32247 ) ) ( HOIST-AT ?auto_32242 ?auto_32248 ) ( not ( = ?auto_32243 ?auto_32242 ) ) ( AVAILABLE ?auto_32242 ) ( SURFACE-AT ?auto_32241 ?auto_32248 ) ( ON ?auto_32241 ?auto_32246 ) ( CLEAR ?auto_32241 ) ( not ( = ?auto_32240 ?auto_32246 ) ) ( not ( = ?auto_32241 ?auto_32246 ) ) ( not ( = ?auto_32245 ?auto_32246 ) ) ( SURFACE-AT ?auto_32245 ?auto_32247 ) ( CLEAR ?auto_32245 ) ( IS-CRATE ?auto_32240 ) ( AVAILABLE ?auto_32243 ) ( IN ?auto_32240 ?auto_32244 ) ( TRUCK-AT ?auto_32244 ?auto_32248 ) )
    :subtasks
    ( ( !DRIVE ?auto_32244 ?auto_32248 ?auto_32247 )
      ( MAKE-2CRATE ?auto_32245 ?auto_32240 ?auto_32241 )
      ( MAKE-1CRATE-VERIFY ?auto_32240 ?auto_32241 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32249 - SURFACE
      ?auto_32250 - SURFACE
      ?auto_32251 - SURFACE
    )
    :vars
    (
      ?auto_32257 - HOIST
      ?auto_32256 - PLACE
      ?auto_32253 - PLACE
      ?auto_32254 - HOIST
      ?auto_32255 - SURFACE
      ?auto_32252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32257 ?auto_32256 ) ( IS-CRATE ?auto_32251 ) ( not ( = ?auto_32250 ?auto_32251 ) ) ( not ( = ?auto_32249 ?auto_32250 ) ) ( not ( = ?auto_32249 ?auto_32251 ) ) ( not ( = ?auto_32253 ?auto_32256 ) ) ( HOIST-AT ?auto_32254 ?auto_32253 ) ( not ( = ?auto_32257 ?auto_32254 ) ) ( AVAILABLE ?auto_32254 ) ( SURFACE-AT ?auto_32251 ?auto_32253 ) ( ON ?auto_32251 ?auto_32255 ) ( CLEAR ?auto_32251 ) ( not ( = ?auto_32250 ?auto_32255 ) ) ( not ( = ?auto_32251 ?auto_32255 ) ) ( not ( = ?auto_32249 ?auto_32255 ) ) ( SURFACE-AT ?auto_32249 ?auto_32256 ) ( CLEAR ?auto_32249 ) ( IS-CRATE ?auto_32250 ) ( AVAILABLE ?auto_32257 ) ( IN ?auto_32250 ?auto_32252 ) ( TRUCK-AT ?auto_32252 ?auto_32253 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32250 ?auto_32251 )
      ( MAKE-2CRATE-VERIFY ?auto_32249 ?auto_32250 ?auto_32251 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32258 - SURFACE
      ?auto_32259 - SURFACE
    )
    :vars
    (
      ?auto_32265 - HOIST
      ?auto_32263 - PLACE
      ?auto_32264 - SURFACE
      ?auto_32261 - PLACE
      ?auto_32266 - HOIST
      ?auto_32260 - SURFACE
      ?auto_32262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32265 ?auto_32263 ) ( IS-CRATE ?auto_32259 ) ( not ( = ?auto_32258 ?auto_32259 ) ) ( not ( = ?auto_32264 ?auto_32258 ) ) ( not ( = ?auto_32264 ?auto_32259 ) ) ( not ( = ?auto_32261 ?auto_32263 ) ) ( HOIST-AT ?auto_32266 ?auto_32261 ) ( not ( = ?auto_32265 ?auto_32266 ) ) ( SURFACE-AT ?auto_32259 ?auto_32261 ) ( ON ?auto_32259 ?auto_32260 ) ( CLEAR ?auto_32259 ) ( not ( = ?auto_32258 ?auto_32260 ) ) ( not ( = ?auto_32259 ?auto_32260 ) ) ( not ( = ?auto_32264 ?auto_32260 ) ) ( SURFACE-AT ?auto_32264 ?auto_32263 ) ( CLEAR ?auto_32264 ) ( IS-CRATE ?auto_32258 ) ( AVAILABLE ?auto_32265 ) ( TRUCK-AT ?auto_32262 ?auto_32261 ) ( LIFTING ?auto_32266 ?auto_32258 ) )
    :subtasks
    ( ( !LOAD ?auto_32266 ?auto_32258 ?auto_32262 ?auto_32261 )
      ( MAKE-2CRATE ?auto_32264 ?auto_32258 ?auto_32259 )
      ( MAKE-1CRATE-VERIFY ?auto_32258 ?auto_32259 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32267 - SURFACE
      ?auto_32268 - SURFACE
      ?auto_32269 - SURFACE
    )
    :vars
    (
      ?auto_32271 - HOIST
      ?auto_32272 - PLACE
      ?auto_32275 - PLACE
      ?auto_32274 - HOIST
      ?auto_32270 - SURFACE
      ?auto_32273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32271 ?auto_32272 ) ( IS-CRATE ?auto_32269 ) ( not ( = ?auto_32268 ?auto_32269 ) ) ( not ( = ?auto_32267 ?auto_32268 ) ) ( not ( = ?auto_32267 ?auto_32269 ) ) ( not ( = ?auto_32275 ?auto_32272 ) ) ( HOIST-AT ?auto_32274 ?auto_32275 ) ( not ( = ?auto_32271 ?auto_32274 ) ) ( SURFACE-AT ?auto_32269 ?auto_32275 ) ( ON ?auto_32269 ?auto_32270 ) ( CLEAR ?auto_32269 ) ( not ( = ?auto_32268 ?auto_32270 ) ) ( not ( = ?auto_32269 ?auto_32270 ) ) ( not ( = ?auto_32267 ?auto_32270 ) ) ( SURFACE-AT ?auto_32267 ?auto_32272 ) ( CLEAR ?auto_32267 ) ( IS-CRATE ?auto_32268 ) ( AVAILABLE ?auto_32271 ) ( TRUCK-AT ?auto_32273 ?auto_32275 ) ( LIFTING ?auto_32274 ?auto_32268 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32268 ?auto_32269 )
      ( MAKE-2CRATE-VERIFY ?auto_32267 ?auto_32268 ?auto_32269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32276 - SURFACE
      ?auto_32277 - SURFACE
    )
    :vars
    (
      ?auto_32283 - HOIST
      ?auto_32280 - PLACE
      ?auto_32281 - SURFACE
      ?auto_32284 - PLACE
      ?auto_32278 - HOIST
      ?auto_32279 - SURFACE
      ?auto_32282 - TRUCK
      ?auto_32285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32283 ?auto_32280 ) ( IS-CRATE ?auto_32277 ) ( not ( = ?auto_32276 ?auto_32277 ) ) ( not ( = ?auto_32281 ?auto_32276 ) ) ( not ( = ?auto_32281 ?auto_32277 ) ) ( not ( = ?auto_32284 ?auto_32280 ) ) ( HOIST-AT ?auto_32278 ?auto_32284 ) ( not ( = ?auto_32283 ?auto_32278 ) ) ( SURFACE-AT ?auto_32277 ?auto_32284 ) ( ON ?auto_32277 ?auto_32279 ) ( CLEAR ?auto_32277 ) ( not ( = ?auto_32276 ?auto_32279 ) ) ( not ( = ?auto_32277 ?auto_32279 ) ) ( not ( = ?auto_32281 ?auto_32279 ) ) ( SURFACE-AT ?auto_32281 ?auto_32280 ) ( CLEAR ?auto_32281 ) ( IS-CRATE ?auto_32276 ) ( AVAILABLE ?auto_32283 ) ( TRUCK-AT ?auto_32282 ?auto_32284 ) ( AVAILABLE ?auto_32278 ) ( SURFACE-AT ?auto_32276 ?auto_32284 ) ( ON ?auto_32276 ?auto_32285 ) ( CLEAR ?auto_32276 ) ( not ( = ?auto_32276 ?auto_32285 ) ) ( not ( = ?auto_32277 ?auto_32285 ) ) ( not ( = ?auto_32281 ?auto_32285 ) ) ( not ( = ?auto_32279 ?auto_32285 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32278 ?auto_32276 ?auto_32285 ?auto_32284 )
      ( MAKE-2CRATE ?auto_32281 ?auto_32276 ?auto_32277 )
      ( MAKE-1CRATE-VERIFY ?auto_32276 ?auto_32277 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32286 - SURFACE
      ?auto_32287 - SURFACE
      ?auto_32288 - SURFACE
    )
    :vars
    (
      ?auto_32295 - HOIST
      ?auto_32291 - PLACE
      ?auto_32290 - PLACE
      ?auto_32293 - HOIST
      ?auto_32292 - SURFACE
      ?auto_32289 - TRUCK
      ?auto_32294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32295 ?auto_32291 ) ( IS-CRATE ?auto_32288 ) ( not ( = ?auto_32287 ?auto_32288 ) ) ( not ( = ?auto_32286 ?auto_32287 ) ) ( not ( = ?auto_32286 ?auto_32288 ) ) ( not ( = ?auto_32290 ?auto_32291 ) ) ( HOIST-AT ?auto_32293 ?auto_32290 ) ( not ( = ?auto_32295 ?auto_32293 ) ) ( SURFACE-AT ?auto_32288 ?auto_32290 ) ( ON ?auto_32288 ?auto_32292 ) ( CLEAR ?auto_32288 ) ( not ( = ?auto_32287 ?auto_32292 ) ) ( not ( = ?auto_32288 ?auto_32292 ) ) ( not ( = ?auto_32286 ?auto_32292 ) ) ( SURFACE-AT ?auto_32286 ?auto_32291 ) ( CLEAR ?auto_32286 ) ( IS-CRATE ?auto_32287 ) ( AVAILABLE ?auto_32295 ) ( TRUCK-AT ?auto_32289 ?auto_32290 ) ( AVAILABLE ?auto_32293 ) ( SURFACE-AT ?auto_32287 ?auto_32290 ) ( ON ?auto_32287 ?auto_32294 ) ( CLEAR ?auto_32287 ) ( not ( = ?auto_32287 ?auto_32294 ) ) ( not ( = ?auto_32288 ?auto_32294 ) ) ( not ( = ?auto_32286 ?auto_32294 ) ) ( not ( = ?auto_32292 ?auto_32294 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32287 ?auto_32288 )
      ( MAKE-2CRATE-VERIFY ?auto_32286 ?auto_32287 ?auto_32288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32296 - SURFACE
      ?auto_32297 - SURFACE
    )
    :vars
    (
      ?auto_32302 - HOIST
      ?auto_32301 - PLACE
      ?auto_32303 - SURFACE
      ?auto_32300 - PLACE
      ?auto_32299 - HOIST
      ?auto_32305 - SURFACE
      ?auto_32298 - SURFACE
      ?auto_32304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32302 ?auto_32301 ) ( IS-CRATE ?auto_32297 ) ( not ( = ?auto_32296 ?auto_32297 ) ) ( not ( = ?auto_32303 ?auto_32296 ) ) ( not ( = ?auto_32303 ?auto_32297 ) ) ( not ( = ?auto_32300 ?auto_32301 ) ) ( HOIST-AT ?auto_32299 ?auto_32300 ) ( not ( = ?auto_32302 ?auto_32299 ) ) ( SURFACE-AT ?auto_32297 ?auto_32300 ) ( ON ?auto_32297 ?auto_32305 ) ( CLEAR ?auto_32297 ) ( not ( = ?auto_32296 ?auto_32305 ) ) ( not ( = ?auto_32297 ?auto_32305 ) ) ( not ( = ?auto_32303 ?auto_32305 ) ) ( SURFACE-AT ?auto_32303 ?auto_32301 ) ( CLEAR ?auto_32303 ) ( IS-CRATE ?auto_32296 ) ( AVAILABLE ?auto_32302 ) ( AVAILABLE ?auto_32299 ) ( SURFACE-AT ?auto_32296 ?auto_32300 ) ( ON ?auto_32296 ?auto_32298 ) ( CLEAR ?auto_32296 ) ( not ( = ?auto_32296 ?auto_32298 ) ) ( not ( = ?auto_32297 ?auto_32298 ) ) ( not ( = ?auto_32303 ?auto_32298 ) ) ( not ( = ?auto_32305 ?auto_32298 ) ) ( TRUCK-AT ?auto_32304 ?auto_32301 ) )
    :subtasks
    ( ( !DRIVE ?auto_32304 ?auto_32301 ?auto_32300 )
      ( MAKE-2CRATE ?auto_32303 ?auto_32296 ?auto_32297 )
      ( MAKE-1CRATE-VERIFY ?auto_32296 ?auto_32297 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32306 - SURFACE
      ?auto_32307 - SURFACE
      ?auto_32308 - SURFACE
    )
    :vars
    (
      ?auto_32312 - HOIST
      ?auto_32309 - PLACE
      ?auto_32310 - PLACE
      ?auto_32314 - HOIST
      ?auto_32313 - SURFACE
      ?auto_32315 - SURFACE
      ?auto_32311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32312 ?auto_32309 ) ( IS-CRATE ?auto_32308 ) ( not ( = ?auto_32307 ?auto_32308 ) ) ( not ( = ?auto_32306 ?auto_32307 ) ) ( not ( = ?auto_32306 ?auto_32308 ) ) ( not ( = ?auto_32310 ?auto_32309 ) ) ( HOIST-AT ?auto_32314 ?auto_32310 ) ( not ( = ?auto_32312 ?auto_32314 ) ) ( SURFACE-AT ?auto_32308 ?auto_32310 ) ( ON ?auto_32308 ?auto_32313 ) ( CLEAR ?auto_32308 ) ( not ( = ?auto_32307 ?auto_32313 ) ) ( not ( = ?auto_32308 ?auto_32313 ) ) ( not ( = ?auto_32306 ?auto_32313 ) ) ( SURFACE-AT ?auto_32306 ?auto_32309 ) ( CLEAR ?auto_32306 ) ( IS-CRATE ?auto_32307 ) ( AVAILABLE ?auto_32312 ) ( AVAILABLE ?auto_32314 ) ( SURFACE-AT ?auto_32307 ?auto_32310 ) ( ON ?auto_32307 ?auto_32315 ) ( CLEAR ?auto_32307 ) ( not ( = ?auto_32307 ?auto_32315 ) ) ( not ( = ?auto_32308 ?auto_32315 ) ) ( not ( = ?auto_32306 ?auto_32315 ) ) ( not ( = ?auto_32313 ?auto_32315 ) ) ( TRUCK-AT ?auto_32311 ?auto_32309 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32307 ?auto_32308 )
      ( MAKE-2CRATE-VERIFY ?auto_32306 ?auto_32307 ?auto_32308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32325 - SURFACE
      ?auto_32326 - SURFACE
    )
    :vars
    (
      ?auto_32327 - HOIST
      ?auto_32328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32327 ?auto_32328 ) ( SURFACE-AT ?auto_32325 ?auto_32328 ) ( CLEAR ?auto_32325 ) ( LIFTING ?auto_32327 ?auto_32326 ) ( IS-CRATE ?auto_32326 ) ( not ( = ?auto_32325 ?auto_32326 ) ) )
    :subtasks
    ( ( !DROP ?auto_32327 ?auto_32326 ?auto_32325 ?auto_32328 )
      ( MAKE-1CRATE-VERIFY ?auto_32325 ?auto_32326 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32329 - SURFACE
      ?auto_32330 - SURFACE
      ?auto_32331 - SURFACE
    )
    :vars
    (
      ?auto_32332 - HOIST
      ?auto_32333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32332 ?auto_32333 ) ( SURFACE-AT ?auto_32330 ?auto_32333 ) ( CLEAR ?auto_32330 ) ( LIFTING ?auto_32332 ?auto_32331 ) ( IS-CRATE ?auto_32331 ) ( not ( = ?auto_32330 ?auto_32331 ) ) ( ON ?auto_32330 ?auto_32329 ) ( not ( = ?auto_32329 ?auto_32330 ) ) ( not ( = ?auto_32329 ?auto_32331 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32330 ?auto_32331 )
      ( MAKE-2CRATE-VERIFY ?auto_32329 ?auto_32330 ?auto_32331 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32334 - SURFACE
      ?auto_32335 - SURFACE
      ?auto_32336 - SURFACE
      ?auto_32337 - SURFACE
    )
    :vars
    (
      ?auto_32338 - HOIST
      ?auto_32339 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32338 ?auto_32339 ) ( SURFACE-AT ?auto_32336 ?auto_32339 ) ( CLEAR ?auto_32336 ) ( LIFTING ?auto_32338 ?auto_32337 ) ( IS-CRATE ?auto_32337 ) ( not ( = ?auto_32336 ?auto_32337 ) ) ( ON ?auto_32335 ?auto_32334 ) ( ON ?auto_32336 ?auto_32335 ) ( not ( = ?auto_32334 ?auto_32335 ) ) ( not ( = ?auto_32334 ?auto_32336 ) ) ( not ( = ?auto_32334 ?auto_32337 ) ) ( not ( = ?auto_32335 ?auto_32336 ) ) ( not ( = ?auto_32335 ?auto_32337 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32336 ?auto_32337 )
      ( MAKE-3CRATE-VERIFY ?auto_32334 ?auto_32335 ?auto_32336 ?auto_32337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32340 - SURFACE
      ?auto_32341 - SURFACE
    )
    :vars
    (
      ?auto_32342 - HOIST
      ?auto_32343 - PLACE
      ?auto_32344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32342 ?auto_32343 ) ( SURFACE-AT ?auto_32340 ?auto_32343 ) ( CLEAR ?auto_32340 ) ( IS-CRATE ?auto_32341 ) ( not ( = ?auto_32340 ?auto_32341 ) ) ( TRUCK-AT ?auto_32344 ?auto_32343 ) ( AVAILABLE ?auto_32342 ) ( IN ?auto_32341 ?auto_32344 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32342 ?auto_32341 ?auto_32344 ?auto_32343 )
      ( MAKE-1CRATE ?auto_32340 ?auto_32341 )
      ( MAKE-1CRATE-VERIFY ?auto_32340 ?auto_32341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32345 - SURFACE
      ?auto_32346 - SURFACE
      ?auto_32347 - SURFACE
    )
    :vars
    (
      ?auto_32348 - HOIST
      ?auto_32350 - PLACE
      ?auto_32349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32348 ?auto_32350 ) ( SURFACE-AT ?auto_32346 ?auto_32350 ) ( CLEAR ?auto_32346 ) ( IS-CRATE ?auto_32347 ) ( not ( = ?auto_32346 ?auto_32347 ) ) ( TRUCK-AT ?auto_32349 ?auto_32350 ) ( AVAILABLE ?auto_32348 ) ( IN ?auto_32347 ?auto_32349 ) ( ON ?auto_32346 ?auto_32345 ) ( not ( = ?auto_32345 ?auto_32346 ) ) ( not ( = ?auto_32345 ?auto_32347 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32346 ?auto_32347 )
      ( MAKE-2CRATE-VERIFY ?auto_32345 ?auto_32346 ?auto_32347 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32351 - SURFACE
      ?auto_32352 - SURFACE
      ?auto_32353 - SURFACE
      ?auto_32354 - SURFACE
    )
    :vars
    (
      ?auto_32357 - HOIST
      ?auto_32356 - PLACE
      ?auto_32355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32357 ?auto_32356 ) ( SURFACE-AT ?auto_32353 ?auto_32356 ) ( CLEAR ?auto_32353 ) ( IS-CRATE ?auto_32354 ) ( not ( = ?auto_32353 ?auto_32354 ) ) ( TRUCK-AT ?auto_32355 ?auto_32356 ) ( AVAILABLE ?auto_32357 ) ( IN ?auto_32354 ?auto_32355 ) ( ON ?auto_32353 ?auto_32352 ) ( not ( = ?auto_32352 ?auto_32353 ) ) ( not ( = ?auto_32352 ?auto_32354 ) ) ( ON ?auto_32352 ?auto_32351 ) ( not ( = ?auto_32351 ?auto_32352 ) ) ( not ( = ?auto_32351 ?auto_32353 ) ) ( not ( = ?auto_32351 ?auto_32354 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32352 ?auto_32353 ?auto_32354 )
      ( MAKE-3CRATE-VERIFY ?auto_32351 ?auto_32352 ?auto_32353 ?auto_32354 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32358 - SURFACE
      ?auto_32359 - SURFACE
    )
    :vars
    (
      ?auto_32363 - HOIST
      ?auto_32362 - PLACE
      ?auto_32360 - TRUCK
      ?auto_32361 - SURFACE
      ?auto_32364 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32363 ?auto_32362 ) ( SURFACE-AT ?auto_32358 ?auto_32362 ) ( CLEAR ?auto_32358 ) ( IS-CRATE ?auto_32359 ) ( not ( = ?auto_32358 ?auto_32359 ) ) ( AVAILABLE ?auto_32363 ) ( IN ?auto_32359 ?auto_32360 ) ( ON ?auto_32358 ?auto_32361 ) ( not ( = ?auto_32361 ?auto_32358 ) ) ( not ( = ?auto_32361 ?auto_32359 ) ) ( TRUCK-AT ?auto_32360 ?auto_32364 ) ( not ( = ?auto_32364 ?auto_32362 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32360 ?auto_32364 ?auto_32362 )
      ( MAKE-2CRATE ?auto_32361 ?auto_32358 ?auto_32359 )
      ( MAKE-1CRATE-VERIFY ?auto_32358 ?auto_32359 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32365 - SURFACE
      ?auto_32366 - SURFACE
      ?auto_32367 - SURFACE
    )
    :vars
    (
      ?auto_32371 - HOIST
      ?auto_32368 - PLACE
      ?auto_32369 - TRUCK
      ?auto_32370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32371 ?auto_32368 ) ( SURFACE-AT ?auto_32366 ?auto_32368 ) ( CLEAR ?auto_32366 ) ( IS-CRATE ?auto_32367 ) ( not ( = ?auto_32366 ?auto_32367 ) ) ( AVAILABLE ?auto_32371 ) ( IN ?auto_32367 ?auto_32369 ) ( ON ?auto_32366 ?auto_32365 ) ( not ( = ?auto_32365 ?auto_32366 ) ) ( not ( = ?auto_32365 ?auto_32367 ) ) ( TRUCK-AT ?auto_32369 ?auto_32370 ) ( not ( = ?auto_32370 ?auto_32368 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32366 ?auto_32367 )
      ( MAKE-2CRATE-VERIFY ?auto_32365 ?auto_32366 ?auto_32367 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32372 - SURFACE
      ?auto_32373 - SURFACE
      ?auto_32374 - SURFACE
      ?auto_32375 - SURFACE
    )
    :vars
    (
      ?auto_32376 - HOIST
      ?auto_32379 - PLACE
      ?auto_32378 - TRUCK
      ?auto_32377 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32376 ?auto_32379 ) ( SURFACE-AT ?auto_32374 ?auto_32379 ) ( CLEAR ?auto_32374 ) ( IS-CRATE ?auto_32375 ) ( not ( = ?auto_32374 ?auto_32375 ) ) ( AVAILABLE ?auto_32376 ) ( IN ?auto_32375 ?auto_32378 ) ( ON ?auto_32374 ?auto_32373 ) ( not ( = ?auto_32373 ?auto_32374 ) ) ( not ( = ?auto_32373 ?auto_32375 ) ) ( TRUCK-AT ?auto_32378 ?auto_32377 ) ( not ( = ?auto_32377 ?auto_32379 ) ) ( ON ?auto_32373 ?auto_32372 ) ( not ( = ?auto_32372 ?auto_32373 ) ) ( not ( = ?auto_32372 ?auto_32374 ) ) ( not ( = ?auto_32372 ?auto_32375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32373 ?auto_32374 ?auto_32375 )
      ( MAKE-3CRATE-VERIFY ?auto_32372 ?auto_32373 ?auto_32374 ?auto_32375 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32380 - SURFACE
      ?auto_32381 - SURFACE
    )
    :vars
    (
      ?auto_32382 - HOIST
      ?auto_32386 - PLACE
      ?auto_32383 - SURFACE
      ?auto_32385 - TRUCK
      ?auto_32384 - PLACE
      ?auto_32387 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32382 ?auto_32386 ) ( SURFACE-AT ?auto_32380 ?auto_32386 ) ( CLEAR ?auto_32380 ) ( IS-CRATE ?auto_32381 ) ( not ( = ?auto_32380 ?auto_32381 ) ) ( AVAILABLE ?auto_32382 ) ( ON ?auto_32380 ?auto_32383 ) ( not ( = ?auto_32383 ?auto_32380 ) ) ( not ( = ?auto_32383 ?auto_32381 ) ) ( TRUCK-AT ?auto_32385 ?auto_32384 ) ( not ( = ?auto_32384 ?auto_32386 ) ) ( HOIST-AT ?auto_32387 ?auto_32384 ) ( LIFTING ?auto_32387 ?auto_32381 ) ( not ( = ?auto_32382 ?auto_32387 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32387 ?auto_32381 ?auto_32385 ?auto_32384 )
      ( MAKE-2CRATE ?auto_32383 ?auto_32380 ?auto_32381 )
      ( MAKE-1CRATE-VERIFY ?auto_32380 ?auto_32381 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32388 - SURFACE
      ?auto_32389 - SURFACE
      ?auto_32390 - SURFACE
    )
    :vars
    (
      ?auto_32393 - HOIST
      ?auto_32394 - PLACE
      ?auto_32391 - TRUCK
      ?auto_32392 - PLACE
      ?auto_32395 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32393 ?auto_32394 ) ( SURFACE-AT ?auto_32389 ?auto_32394 ) ( CLEAR ?auto_32389 ) ( IS-CRATE ?auto_32390 ) ( not ( = ?auto_32389 ?auto_32390 ) ) ( AVAILABLE ?auto_32393 ) ( ON ?auto_32389 ?auto_32388 ) ( not ( = ?auto_32388 ?auto_32389 ) ) ( not ( = ?auto_32388 ?auto_32390 ) ) ( TRUCK-AT ?auto_32391 ?auto_32392 ) ( not ( = ?auto_32392 ?auto_32394 ) ) ( HOIST-AT ?auto_32395 ?auto_32392 ) ( LIFTING ?auto_32395 ?auto_32390 ) ( not ( = ?auto_32393 ?auto_32395 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32389 ?auto_32390 )
      ( MAKE-2CRATE-VERIFY ?auto_32388 ?auto_32389 ?auto_32390 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32396 - SURFACE
      ?auto_32397 - SURFACE
      ?auto_32398 - SURFACE
      ?auto_32399 - SURFACE
    )
    :vars
    (
      ?auto_32402 - HOIST
      ?auto_32401 - PLACE
      ?auto_32404 - TRUCK
      ?auto_32403 - PLACE
      ?auto_32400 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32402 ?auto_32401 ) ( SURFACE-AT ?auto_32398 ?auto_32401 ) ( CLEAR ?auto_32398 ) ( IS-CRATE ?auto_32399 ) ( not ( = ?auto_32398 ?auto_32399 ) ) ( AVAILABLE ?auto_32402 ) ( ON ?auto_32398 ?auto_32397 ) ( not ( = ?auto_32397 ?auto_32398 ) ) ( not ( = ?auto_32397 ?auto_32399 ) ) ( TRUCK-AT ?auto_32404 ?auto_32403 ) ( not ( = ?auto_32403 ?auto_32401 ) ) ( HOIST-AT ?auto_32400 ?auto_32403 ) ( LIFTING ?auto_32400 ?auto_32399 ) ( not ( = ?auto_32402 ?auto_32400 ) ) ( ON ?auto_32397 ?auto_32396 ) ( not ( = ?auto_32396 ?auto_32397 ) ) ( not ( = ?auto_32396 ?auto_32398 ) ) ( not ( = ?auto_32396 ?auto_32399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32397 ?auto_32398 ?auto_32399 )
      ( MAKE-3CRATE-VERIFY ?auto_32396 ?auto_32397 ?auto_32398 ?auto_32399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32405 - SURFACE
      ?auto_32406 - SURFACE
    )
    :vars
    (
      ?auto_32409 - HOIST
      ?auto_32408 - PLACE
      ?auto_32411 - SURFACE
      ?auto_32412 - TRUCK
      ?auto_32410 - PLACE
      ?auto_32407 - HOIST
      ?auto_32413 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32409 ?auto_32408 ) ( SURFACE-AT ?auto_32405 ?auto_32408 ) ( CLEAR ?auto_32405 ) ( IS-CRATE ?auto_32406 ) ( not ( = ?auto_32405 ?auto_32406 ) ) ( AVAILABLE ?auto_32409 ) ( ON ?auto_32405 ?auto_32411 ) ( not ( = ?auto_32411 ?auto_32405 ) ) ( not ( = ?auto_32411 ?auto_32406 ) ) ( TRUCK-AT ?auto_32412 ?auto_32410 ) ( not ( = ?auto_32410 ?auto_32408 ) ) ( HOIST-AT ?auto_32407 ?auto_32410 ) ( not ( = ?auto_32409 ?auto_32407 ) ) ( AVAILABLE ?auto_32407 ) ( SURFACE-AT ?auto_32406 ?auto_32410 ) ( ON ?auto_32406 ?auto_32413 ) ( CLEAR ?auto_32406 ) ( not ( = ?auto_32405 ?auto_32413 ) ) ( not ( = ?auto_32406 ?auto_32413 ) ) ( not ( = ?auto_32411 ?auto_32413 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32407 ?auto_32406 ?auto_32413 ?auto_32410 )
      ( MAKE-2CRATE ?auto_32411 ?auto_32405 ?auto_32406 )
      ( MAKE-1CRATE-VERIFY ?auto_32405 ?auto_32406 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32414 - SURFACE
      ?auto_32415 - SURFACE
      ?auto_32416 - SURFACE
    )
    :vars
    (
      ?auto_32422 - HOIST
      ?auto_32421 - PLACE
      ?auto_32417 - TRUCK
      ?auto_32420 - PLACE
      ?auto_32419 - HOIST
      ?auto_32418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32422 ?auto_32421 ) ( SURFACE-AT ?auto_32415 ?auto_32421 ) ( CLEAR ?auto_32415 ) ( IS-CRATE ?auto_32416 ) ( not ( = ?auto_32415 ?auto_32416 ) ) ( AVAILABLE ?auto_32422 ) ( ON ?auto_32415 ?auto_32414 ) ( not ( = ?auto_32414 ?auto_32415 ) ) ( not ( = ?auto_32414 ?auto_32416 ) ) ( TRUCK-AT ?auto_32417 ?auto_32420 ) ( not ( = ?auto_32420 ?auto_32421 ) ) ( HOIST-AT ?auto_32419 ?auto_32420 ) ( not ( = ?auto_32422 ?auto_32419 ) ) ( AVAILABLE ?auto_32419 ) ( SURFACE-AT ?auto_32416 ?auto_32420 ) ( ON ?auto_32416 ?auto_32418 ) ( CLEAR ?auto_32416 ) ( not ( = ?auto_32415 ?auto_32418 ) ) ( not ( = ?auto_32416 ?auto_32418 ) ) ( not ( = ?auto_32414 ?auto_32418 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32415 ?auto_32416 )
      ( MAKE-2CRATE-VERIFY ?auto_32414 ?auto_32415 ?auto_32416 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32423 - SURFACE
      ?auto_32424 - SURFACE
      ?auto_32425 - SURFACE
      ?auto_32426 - SURFACE
    )
    :vars
    (
      ?auto_32430 - HOIST
      ?auto_32428 - PLACE
      ?auto_32429 - TRUCK
      ?auto_32432 - PLACE
      ?auto_32431 - HOIST
      ?auto_32427 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32430 ?auto_32428 ) ( SURFACE-AT ?auto_32425 ?auto_32428 ) ( CLEAR ?auto_32425 ) ( IS-CRATE ?auto_32426 ) ( not ( = ?auto_32425 ?auto_32426 ) ) ( AVAILABLE ?auto_32430 ) ( ON ?auto_32425 ?auto_32424 ) ( not ( = ?auto_32424 ?auto_32425 ) ) ( not ( = ?auto_32424 ?auto_32426 ) ) ( TRUCK-AT ?auto_32429 ?auto_32432 ) ( not ( = ?auto_32432 ?auto_32428 ) ) ( HOIST-AT ?auto_32431 ?auto_32432 ) ( not ( = ?auto_32430 ?auto_32431 ) ) ( AVAILABLE ?auto_32431 ) ( SURFACE-AT ?auto_32426 ?auto_32432 ) ( ON ?auto_32426 ?auto_32427 ) ( CLEAR ?auto_32426 ) ( not ( = ?auto_32425 ?auto_32427 ) ) ( not ( = ?auto_32426 ?auto_32427 ) ) ( not ( = ?auto_32424 ?auto_32427 ) ) ( ON ?auto_32424 ?auto_32423 ) ( not ( = ?auto_32423 ?auto_32424 ) ) ( not ( = ?auto_32423 ?auto_32425 ) ) ( not ( = ?auto_32423 ?auto_32426 ) ) ( not ( = ?auto_32423 ?auto_32427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32424 ?auto_32425 ?auto_32426 )
      ( MAKE-3CRATE-VERIFY ?auto_32423 ?auto_32424 ?auto_32425 ?auto_32426 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32433 - SURFACE
      ?auto_32434 - SURFACE
    )
    :vars
    (
      ?auto_32439 - HOIST
      ?auto_32436 - PLACE
      ?auto_32437 - SURFACE
      ?auto_32441 - PLACE
      ?auto_32440 - HOIST
      ?auto_32435 - SURFACE
      ?auto_32438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32439 ?auto_32436 ) ( SURFACE-AT ?auto_32433 ?auto_32436 ) ( CLEAR ?auto_32433 ) ( IS-CRATE ?auto_32434 ) ( not ( = ?auto_32433 ?auto_32434 ) ) ( AVAILABLE ?auto_32439 ) ( ON ?auto_32433 ?auto_32437 ) ( not ( = ?auto_32437 ?auto_32433 ) ) ( not ( = ?auto_32437 ?auto_32434 ) ) ( not ( = ?auto_32441 ?auto_32436 ) ) ( HOIST-AT ?auto_32440 ?auto_32441 ) ( not ( = ?auto_32439 ?auto_32440 ) ) ( AVAILABLE ?auto_32440 ) ( SURFACE-AT ?auto_32434 ?auto_32441 ) ( ON ?auto_32434 ?auto_32435 ) ( CLEAR ?auto_32434 ) ( not ( = ?auto_32433 ?auto_32435 ) ) ( not ( = ?auto_32434 ?auto_32435 ) ) ( not ( = ?auto_32437 ?auto_32435 ) ) ( TRUCK-AT ?auto_32438 ?auto_32436 ) )
    :subtasks
    ( ( !DRIVE ?auto_32438 ?auto_32436 ?auto_32441 )
      ( MAKE-2CRATE ?auto_32437 ?auto_32433 ?auto_32434 )
      ( MAKE-1CRATE-VERIFY ?auto_32433 ?auto_32434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32442 - SURFACE
      ?auto_32443 - SURFACE
      ?auto_32444 - SURFACE
    )
    :vars
    (
      ?auto_32450 - HOIST
      ?auto_32448 - PLACE
      ?auto_32446 - PLACE
      ?auto_32447 - HOIST
      ?auto_32445 - SURFACE
      ?auto_32449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32450 ?auto_32448 ) ( SURFACE-AT ?auto_32443 ?auto_32448 ) ( CLEAR ?auto_32443 ) ( IS-CRATE ?auto_32444 ) ( not ( = ?auto_32443 ?auto_32444 ) ) ( AVAILABLE ?auto_32450 ) ( ON ?auto_32443 ?auto_32442 ) ( not ( = ?auto_32442 ?auto_32443 ) ) ( not ( = ?auto_32442 ?auto_32444 ) ) ( not ( = ?auto_32446 ?auto_32448 ) ) ( HOIST-AT ?auto_32447 ?auto_32446 ) ( not ( = ?auto_32450 ?auto_32447 ) ) ( AVAILABLE ?auto_32447 ) ( SURFACE-AT ?auto_32444 ?auto_32446 ) ( ON ?auto_32444 ?auto_32445 ) ( CLEAR ?auto_32444 ) ( not ( = ?auto_32443 ?auto_32445 ) ) ( not ( = ?auto_32444 ?auto_32445 ) ) ( not ( = ?auto_32442 ?auto_32445 ) ) ( TRUCK-AT ?auto_32449 ?auto_32448 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32443 ?auto_32444 )
      ( MAKE-2CRATE-VERIFY ?auto_32442 ?auto_32443 ?auto_32444 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32451 - SURFACE
      ?auto_32452 - SURFACE
      ?auto_32453 - SURFACE
      ?auto_32454 - SURFACE
    )
    :vars
    (
      ?auto_32457 - HOIST
      ?auto_32458 - PLACE
      ?auto_32456 - PLACE
      ?auto_32460 - HOIST
      ?auto_32455 - SURFACE
      ?auto_32459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32457 ?auto_32458 ) ( SURFACE-AT ?auto_32453 ?auto_32458 ) ( CLEAR ?auto_32453 ) ( IS-CRATE ?auto_32454 ) ( not ( = ?auto_32453 ?auto_32454 ) ) ( AVAILABLE ?auto_32457 ) ( ON ?auto_32453 ?auto_32452 ) ( not ( = ?auto_32452 ?auto_32453 ) ) ( not ( = ?auto_32452 ?auto_32454 ) ) ( not ( = ?auto_32456 ?auto_32458 ) ) ( HOIST-AT ?auto_32460 ?auto_32456 ) ( not ( = ?auto_32457 ?auto_32460 ) ) ( AVAILABLE ?auto_32460 ) ( SURFACE-AT ?auto_32454 ?auto_32456 ) ( ON ?auto_32454 ?auto_32455 ) ( CLEAR ?auto_32454 ) ( not ( = ?auto_32453 ?auto_32455 ) ) ( not ( = ?auto_32454 ?auto_32455 ) ) ( not ( = ?auto_32452 ?auto_32455 ) ) ( TRUCK-AT ?auto_32459 ?auto_32458 ) ( ON ?auto_32452 ?auto_32451 ) ( not ( = ?auto_32451 ?auto_32452 ) ) ( not ( = ?auto_32451 ?auto_32453 ) ) ( not ( = ?auto_32451 ?auto_32454 ) ) ( not ( = ?auto_32451 ?auto_32455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32452 ?auto_32453 ?auto_32454 )
      ( MAKE-3CRATE-VERIFY ?auto_32451 ?auto_32452 ?auto_32453 ?auto_32454 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32461 - SURFACE
      ?auto_32462 - SURFACE
    )
    :vars
    (
      ?auto_32465 - HOIST
      ?auto_32466 - PLACE
      ?auto_32467 - SURFACE
      ?auto_32464 - PLACE
      ?auto_32469 - HOIST
      ?auto_32463 - SURFACE
      ?auto_32468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32465 ?auto_32466 ) ( IS-CRATE ?auto_32462 ) ( not ( = ?auto_32461 ?auto_32462 ) ) ( not ( = ?auto_32467 ?auto_32461 ) ) ( not ( = ?auto_32467 ?auto_32462 ) ) ( not ( = ?auto_32464 ?auto_32466 ) ) ( HOIST-AT ?auto_32469 ?auto_32464 ) ( not ( = ?auto_32465 ?auto_32469 ) ) ( AVAILABLE ?auto_32469 ) ( SURFACE-AT ?auto_32462 ?auto_32464 ) ( ON ?auto_32462 ?auto_32463 ) ( CLEAR ?auto_32462 ) ( not ( = ?auto_32461 ?auto_32463 ) ) ( not ( = ?auto_32462 ?auto_32463 ) ) ( not ( = ?auto_32467 ?auto_32463 ) ) ( TRUCK-AT ?auto_32468 ?auto_32466 ) ( SURFACE-AT ?auto_32467 ?auto_32466 ) ( CLEAR ?auto_32467 ) ( LIFTING ?auto_32465 ?auto_32461 ) ( IS-CRATE ?auto_32461 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32467 ?auto_32461 )
      ( MAKE-2CRATE ?auto_32467 ?auto_32461 ?auto_32462 )
      ( MAKE-1CRATE-VERIFY ?auto_32461 ?auto_32462 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32470 - SURFACE
      ?auto_32471 - SURFACE
      ?auto_32472 - SURFACE
    )
    :vars
    (
      ?auto_32475 - HOIST
      ?auto_32476 - PLACE
      ?auto_32474 - PLACE
      ?auto_32477 - HOIST
      ?auto_32478 - SURFACE
      ?auto_32473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32475 ?auto_32476 ) ( IS-CRATE ?auto_32472 ) ( not ( = ?auto_32471 ?auto_32472 ) ) ( not ( = ?auto_32470 ?auto_32471 ) ) ( not ( = ?auto_32470 ?auto_32472 ) ) ( not ( = ?auto_32474 ?auto_32476 ) ) ( HOIST-AT ?auto_32477 ?auto_32474 ) ( not ( = ?auto_32475 ?auto_32477 ) ) ( AVAILABLE ?auto_32477 ) ( SURFACE-AT ?auto_32472 ?auto_32474 ) ( ON ?auto_32472 ?auto_32478 ) ( CLEAR ?auto_32472 ) ( not ( = ?auto_32471 ?auto_32478 ) ) ( not ( = ?auto_32472 ?auto_32478 ) ) ( not ( = ?auto_32470 ?auto_32478 ) ) ( TRUCK-AT ?auto_32473 ?auto_32476 ) ( SURFACE-AT ?auto_32470 ?auto_32476 ) ( CLEAR ?auto_32470 ) ( LIFTING ?auto_32475 ?auto_32471 ) ( IS-CRATE ?auto_32471 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32471 ?auto_32472 )
      ( MAKE-2CRATE-VERIFY ?auto_32470 ?auto_32471 ?auto_32472 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32479 - SURFACE
      ?auto_32480 - SURFACE
      ?auto_32481 - SURFACE
      ?auto_32482 - SURFACE
    )
    :vars
    (
      ?auto_32488 - HOIST
      ?auto_32485 - PLACE
      ?auto_32486 - PLACE
      ?auto_32487 - HOIST
      ?auto_32483 - SURFACE
      ?auto_32484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32488 ?auto_32485 ) ( IS-CRATE ?auto_32482 ) ( not ( = ?auto_32481 ?auto_32482 ) ) ( not ( = ?auto_32480 ?auto_32481 ) ) ( not ( = ?auto_32480 ?auto_32482 ) ) ( not ( = ?auto_32486 ?auto_32485 ) ) ( HOIST-AT ?auto_32487 ?auto_32486 ) ( not ( = ?auto_32488 ?auto_32487 ) ) ( AVAILABLE ?auto_32487 ) ( SURFACE-AT ?auto_32482 ?auto_32486 ) ( ON ?auto_32482 ?auto_32483 ) ( CLEAR ?auto_32482 ) ( not ( = ?auto_32481 ?auto_32483 ) ) ( not ( = ?auto_32482 ?auto_32483 ) ) ( not ( = ?auto_32480 ?auto_32483 ) ) ( TRUCK-AT ?auto_32484 ?auto_32485 ) ( SURFACE-AT ?auto_32480 ?auto_32485 ) ( CLEAR ?auto_32480 ) ( LIFTING ?auto_32488 ?auto_32481 ) ( IS-CRATE ?auto_32481 ) ( ON ?auto_32480 ?auto_32479 ) ( not ( = ?auto_32479 ?auto_32480 ) ) ( not ( = ?auto_32479 ?auto_32481 ) ) ( not ( = ?auto_32479 ?auto_32482 ) ) ( not ( = ?auto_32479 ?auto_32483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32480 ?auto_32481 ?auto_32482 )
      ( MAKE-3CRATE-VERIFY ?auto_32479 ?auto_32480 ?auto_32481 ?auto_32482 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32489 - SURFACE
      ?auto_32490 - SURFACE
    )
    :vars
    (
      ?auto_32496 - HOIST
      ?auto_32493 - PLACE
      ?auto_32497 - SURFACE
      ?auto_32494 - PLACE
      ?auto_32495 - HOIST
      ?auto_32491 - SURFACE
      ?auto_32492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32496 ?auto_32493 ) ( IS-CRATE ?auto_32490 ) ( not ( = ?auto_32489 ?auto_32490 ) ) ( not ( = ?auto_32497 ?auto_32489 ) ) ( not ( = ?auto_32497 ?auto_32490 ) ) ( not ( = ?auto_32494 ?auto_32493 ) ) ( HOIST-AT ?auto_32495 ?auto_32494 ) ( not ( = ?auto_32496 ?auto_32495 ) ) ( AVAILABLE ?auto_32495 ) ( SURFACE-AT ?auto_32490 ?auto_32494 ) ( ON ?auto_32490 ?auto_32491 ) ( CLEAR ?auto_32490 ) ( not ( = ?auto_32489 ?auto_32491 ) ) ( not ( = ?auto_32490 ?auto_32491 ) ) ( not ( = ?auto_32497 ?auto_32491 ) ) ( TRUCK-AT ?auto_32492 ?auto_32493 ) ( SURFACE-AT ?auto_32497 ?auto_32493 ) ( CLEAR ?auto_32497 ) ( IS-CRATE ?auto_32489 ) ( AVAILABLE ?auto_32496 ) ( IN ?auto_32489 ?auto_32492 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32496 ?auto_32489 ?auto_32492 ?auto_32493 )
      ( MAKE-2CRATE ?auto_32497 ?auto_32489 ?auto_32490 )
      ( MAKE-1CRATE-VERIFY ?auto_32489 ?auto_32490 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32498 - SURFACE
      ?auto_32499 - SURFACE
      ?auto_32500 - SURFACE
    )
    :vars
    (
      ?auto_32501 - HOIST
      ?auto_32504 - PLACE
      ?auto_32505 - PLACE
      ?auto_32503 - HOIST
      ?auto_32506 - SURFACE
      ?auto_32502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32501 ?auto_32504 ) ( IS-CRATE ?auto_32500 ) ( not ( = ?auto_32499 ?auto_32500 ) ) ( not ( = ?auto_32498 ?auto_32499 ) ) ( not ( = ?auto_32498 ?auto_32500 ) ) ( not ( = ?auto_32505 ?auto_32504 ) ) ( HOIST-AT ?auto_32503 ?auto_32505 ) ( not ( = ?auto_32501 ?auto_32503 ) ) ( AVAILABLE ?auto_32503 ) ( SURFACE-AT ?auto_32500 ?auto_32505 ) ( ON ?auto_32500 ?auto_32506 ) ( CLEAR ?auto_32500 ) ( not ( = ?auto_32499 ?auto_32506 ) ) ( not ( = ?auto_32500 ?auto_32506 ) ) ( not ( = ?auto_32498 ?auto_32506 ) ) ( TRUCK-AT ?auto_32502 ?auto_32504 ) ( SURFACE-AT ?auto_32498 ?auto_32504 ) ( CLEAR ?auto_32498 ) ( IS-CRATE ?auto_32499 ) ( AVAILABLE ?auto_32501 ) ( IN ?auto_32499 ?auto_32502 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32499 ?auto_32500 )
      ( MAKE-2CRATE-VERIFY ?auto_32498 ?auto_32499 ?auto_32500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32507 - SURFACE
      ?auto_32508 - SURFACE
      ?auto_32509 - SURFACE
      ?auto_32510 - SURFACE
    )
    :vars
    (
      ?auto_32512 - HOIST
      ?auto_32516 - PLACE
      ?auto_32511 - PLACE
      ?auto_32515 - HOIST
      ?auto_32514 - SURFACE
      ?auto_32513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32512 ?auto_32516 ) ( IS-CRATE ?auto_32510 ) ( not ( = ?auto_32509 ?auto_32510 ) ) ( not ( = ?auto_32508 ?auto_32509 ) ) ( not ( = ?auto_32508 ?auto_32510 ) ) ( not ( = ?auto_32511 ?auto_32516 ) ) ( HOIST-AT ?auto_32515 ?auto_32511 ) ( not ( = ?auto_32512 ?auto_32515 ) ) ( AVAILABLE ?auto_32515 ) ( SURFACE-AT ?auto_32510 ?auto_32511 ) ( ON ?auto_32510 ?auto_32514 ) ( CLEAR ?auto_32510 ) ( not ( = ?auto_32509 ?auto_32514 ) ) ( not ( = ?auto_32510 ?auto_32514 ) ) ( not ( = ?auto_32508 ?auto_32514 ) ) ( TRUCK-AT ?auto_32513 ?auto_32516 ) ( SURFACE-AT ?auto_32508 ?auto_32516 ) ( CLEAR ?auto_32508 ) ( IS-CRATE ?auto_32509 ) ( AVAILABLE ?auto_32512 ) ( IN ?auto_32509 ?auto_32513 ) ( ON ?auto_32508 ?auto_32507 ) ( not ( = ?auto_32507 ?auto_32508 ) ) ( not ( = ?auto_32507 ?auto_32509 ) ) ( not ( = ?auto_32507 ?auto_32510 ) ) ( not ( = ?auto_32507 ?auto_32514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32508 ?auto_32509 ?auto_32510 )
      ( MAKE-3CRATE-VERIFY ?auto_32507 ?auto_32508 ?auto_32509 ?auto_32510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32517 - SURFACE
      ?auto_32518 - SURFACE
    )
    :vars
    (
      ?auto_32520 - HOIST
      ?auto_32525 - PLACE
      ?auto_32523 - SURFACE
      ?auto_32519 - PLACE
      ?auto_32524 - HOIST
      ?auto_32522 - SURFACE
      ?auto_32521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32520 ?auto_32525 ) ( IS-CRATE ?auto_32518 ) ( not ( = ?auto_32517 ?auto_32518 ) ) ( not ( = ?auto_32523 ?auto_32517 ) ) ( not ( = ?auto_32523 ?auto_32518 ) ) ( not ( = ?auto_32519 ?auto_32525 ) ) ( HOIST-AT ?auto_32524 ?auto_32519 ) ( not ( = ?auto_32520 ?auto_32524 ) ) ( AVAILABLE ?auto_32524 ) ( SURFACE-AT ?auto_32518 ?auto_32519 ) ( ON ?auto_32518 ?auto_32522 ) ( CLEAR ?auto_32518 ) ( not ( = ?auto_32517 ?auto_32522 ) ) ( not ( = ?auto_32518 ?auto_32522 ) ) ( not ( = ?auto_32523 ?auto_32522 ) ) ( SURFACE-AT ?auto_32523 ?auto_32525 ) ( CLEAR ?auto_32523 ) ( IS-CRATE ?auto_32517 ) ( AVAILABLE ?auto_32520 ) ( IN ?auto_32517 ?auto_32521 ) ( TRUCK-AT ?auto_32521 ?auto_32519 ) )
    :subtasks
    ( ( !DRIVE ?auto_32521 ?auto_32519 ?auto_32525 )
      ( MAKE-2CRATE ?auto_32523 ?auto_32517 ?auto_32518 )
      ( MAKE-1CRATE-VERIFY ?auto_32517 ?auto_32518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32526 - SURFACE
      ?auto_32527 - SURFACE
      ?auto_32528 - SURFACE
    )
    :vars
    (
      ?auto_32529 - HOIST
      ?auto_32532 - PLACE
      ?auto_32530 - PLACE
      ?auto_32531 - HOIST
      ?auto_32533 - SURFACE
      ?auto_32534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32529 ?auto_32532 ) ( IS-CRATE ?auto_32528 ) ( not ( = ?auto_32527 ?auto_32528 ) ) ( not ( = ?auto_32526 ?auto_32527 ) ) ( not ( = ?auto_32526 ?auto_32528 ) ) ( not ( = ?auto_32530 ?auto_32532 ) ) ( HOIST-AT ?auto_32531 ?auto_32530 ) ( not ( = ?auto_32529 ?auto_32531 ) ) ( AVAILABLE ?auto_32531 ) ( SURFACE-AT ?auto_32528 ?auto_32530 ) ( ON ?auto_32528 ?auto_32533 ) ( CLEAR ?auto_32528 ) ( not ( = ?auto_32527 ?auto_32533 ) ) ( not ( = ?auto_32528 ?auto_32533 ) ) ( not ( = ?auto_32526 ?auto_32533 ) ) ( SURFACE-AT ?auto_32526 ?auto_32532 ) ( CLEAR ?auto_32526 ) ( IS-CRATE ?auto_32527 ) ( AVAILABLE ?auto_32529 ) ( IN ?auto_32527 ?auto_32534 ) ( TRUCK-AT ?auto_32534 ?auto_32530 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32527 ?auto_32528 )
      ( MAKE-2CRATE-VERIFY ?auto_32526 ?auto_32527 ?auto_32528 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32535 - SURFACE
      ?auto_32536 - SURFACE
      ?auto_32537 - SURFACE
      ?auto_32538 - SURFACE
    )
    :vars
    (
      ?auto_32543 - HOIST
      ?auto_32542 - PLACE
      ?auto_32544 - PLACE
      ?auto_32539 - HOIST
      ?auto_32541 - SURFACE
      ?auto_32540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32543 ?auto_32542 ) ( IS-CRATE ?auto_32538 ) ( not ( = ?auto_32537 ?auto_32538 ) ) ( not ( = ?auto_32536 ?auto_32537 ) ) ( not ( = ?auto_32536 ?auto_32538 ) ) ( not ( = ?auto_32544 ?auto_32542 ) ) ( HOIST-AT ?auto_32539 ?auto_32544 ) ( not ( = ?auto_32543 ?auto_32539 ) ) ( AVAILABLE ?auto_32539 ) ( SURFACE-AT ?auto_32538 ?auto_32544 ) ( ON ?auto_32538 ?auto_32541 ) ( CLEAR ?auto_32538 ) ( not ( = ?auto_32537 ?auto_32541 ) ) ( not ( = ?auto_32538 ?auto_32541 ) ) ( not ( = ?auto_32536 ?auto_32541 ) ) ( SURFACE-AT ?auto_32536 ?auto_32542 ) ( CLEAR ?auto_32536 ) ( IS-CRATE ?auto_32537 ) ( AVAILABLE ?auto_32543 ) ( IN ?auto_32537 ?auto_32540 ) ( TRUCK-AT ?auto_32540 ?auto_32544 ) ( ON ?auto_32536 ?auto_32535 ) ( not ( = ?auto_32535 ?auto_32536 ) ) ( not ( = ?auto_32535 ?auto_32537 ) ) ( not ( = ?auto_32535 ?auto_32538 ) ) ( not ( = ?auto_32535 ?auto_32541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32536 ?auto_32537 ?auto_32538 )
      ( MAKE-3CRATE-VERIFY ?auto_32535 ?auto_32536 ?auto_32537 ?auto_32538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32545 - SURFACE
      ?auto_32546 - SURFACE
    )
    :vars
    (
      ?auto_32552 - HOIST
      ?auto_32551 - PLACE
      ?auto_32548 - SURFACE
      ?auto_32553 - PLACE
      ?auto_32547 - HOIST
      ?auto_32550 - SURFACE
      ?auto_32549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32552 ?auto_32551 ) ( IS-CRATE ?auto_32546 ) ( not ( = ?auto_32545 ?auto_32546 ) ) ( not ( = ?auto_32548 ?auto_32545 ) ) ( not ( = ?auto_32548 ?auto_32546 ) ) ( not ( = ?auto_32553 ?auto_32551 ) ) ( HOIST-AT ?auto_32547 ?auto_32553 ) ( not ( = ?auto_32552 ?auto_32547 ) ) ( SURFACE-AT ?auto_32546 ?auto_32553 ) ( ON ?auto_32546 ?auto_32550 ) ( CLEAR ?auto_32546 ) ( not ( = ?auto_32545 ?auto_32550 ) ) ( not ( = ?auto_32546 ?auto_32550 ) ) ( not ( = ?auto_32548 ?auto_32550 ) ) ( SURFACE-AT ?auto_32548 ?auto_32551 ) ( CLEAR ?auto_32548 ) ( IS-CRATE ?auto_32545 ) ( AVAILABLE ?auto_32552 ) ( TRUCK-AT ?auto_32549 ?auto_32553 ) ( LIFTING ?auto_32547 ?auto_32545 ) )
    :subtasks
    ( ( !LOAD ?auto_32547 ?auto_32545 ?auto_32549 ?auto_32553 )
      ( MAKE-2CRATE ?auto_32548 ?auto_32545 ?auto_32546 )
      ( MAKE-1CRATE-VERIFY ?auto_32545 ?auto_32546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32554 - SURFACE
      ?auto_32555 - SURFACE
      ?auto_32556 - SURFACE
    )
    :vars
    (
      ?auto_32560 - HOIST
      ?auto_32562 - PLACE
      ?auto_32559 - PLACE
      ?auto_32557 - HOIST
      ?auto_32558 - SURFACE
      ?auto_32561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32560 ?auto_32562 ) ( IS-CRATE ?auto_32556 ) ( not ( = ?auto_32555 ?auto_32556 ) ) ( not ( = ?auto_32554 ?auto_32555 ) ) ( not ( = ?auto_32554 ?auto_32556 ) ) ( not ( = ?auto_32559 ?auto_32562 ) ) ( HOIST-AT ?auto_32557 ?auto_32559 ) ( not ( = ?auto_32560 ?auto_32557 ) ) ( SURFACE-AT ?auto_32556 ?auto_32559 ) ( ON ?auto_32556 ?auto_32558 ) ( CLEAR ?auto_32556 ) ( not ( = ?auto_32555 ?auto_32558 ) ) ( not ( = ?auto_32556 ?auto_32558 ) ) ( not ( = ?auto_32554 ?auto_32558 ) ) ( SURFACE-AT ?auto_32554 ?auto_32562 ) ( CLEAR ?auto_32554 ) ( IS-CRATE ?auto_32555 ) ( AVAILABLE ?auto_32560 ) ( TRUCK-AT ?auto_32561 ?auto_32559 ) ( LIFTING ?auto_32557 ?auto_32555 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32555 ?auto_32556 )
      ( MAKE-2CRATE-VERIFY ?auto_32554 ?auto_32555 ?auto_32556 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32563 - SURFACE
      ?auto_32564 - SURFACE
      ?auto_32565 - SURFACE
      ?auto_32566 - SURFACE
    )
    :vars
    (
      ?auto_32572 - HOIST
      ?auto_32567 - PLACE
      ?auto_32571 - PLACE
      ?auto_32568 - HOIST
      ?auto_32569 - SURFACE
      ?auto_32570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32572 ?auto_32567 ) ( IS-CRATE ?auto_32566 ) ( not ( = ?auto_32565 ?auto_32566 ) ) ( not ( = ?auto_32564 ?auto_32565 ) ) ( not ( = ?auto_32564 ?auto_32566 ) ) ( not ( = ?auto_32571 ?auto_32567 ) ) ( HOIST-AT ?auto_32568 ?auto_32571 ) ( not ( = ?auto_32572 ?auto_32568 ) ) ( SURFACE-AT ?auto_32566 ?auto_32571 ) ( ON ?auto_32566 ?auto_32569 ) ( CLEAR ?auto_32566 ) ( not ( = ?auto_32565 ?auto_32569 ) ) ( not ( = ?auto_32566 ?auto_32569 ) ) ( not ( = ?auto_32564 ?auto_32569 ) ) ( SURFACE-AT ?auto_32564 ?auto_32567 ) ( CLEAR ?auto_32564 ) ( IS-CRATE ?auto_32565 ) ( AVAILABLE ?auto_32572 ) ( TRUCK-AT ?auto_32570 ?auto_32571 ) ( LIFTING ?auto_32568 ?auto_32565 ) ( ON ?auto_32564 ?auto_32563 ) ( not ( = ?auto_32563 ?auto_32564 ) ) ( not ( = ?auto_32563 ?auto_32565 ) ) ( not ( = ?auto_32563 ?auto_32566 ) ) ( not ( = ?auto_32563 ?auto_32569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32564 ?auto_32565 ?auto_32566 )
      ( MAKE-3CRATE-VERIFY ?auto_32563 ?auto_32564 ?auto_32565 ?auto_32566 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32573 - SURFACE
      ?auto_32574 - SURFACE
    )
    :vars
    (
      ?auto_32581 - HOIST
      ?auto_32575 - PLACE
      ?auto_32580 - SURFACE
      ?auto_32579 - PLACE
      ?auto_32576 - HOIST
      ?auto_32577 - SURFACE
      ?auto_32578 - TRUCK
      ?auto_32582 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32581 ?auto_32575 ) ( IS-CRATE ?auto_32574 ) ( not ( = ?auto_32573 ?auto_32574 ) ) ( not ( = ?auto_32580 ?auto_32573 ) ) ( not ( = ?auto_32580 ?auto_32574 ) ) ( not ( = ?auto_32579 ?auto_32575 ) ) ( HOIST-AT ?auto_32576 ?auto_32579 ) ( not ( = ?auto_32581 ?auto_32576 ) ) ( SURFACE-AT ?auto_32574 ?auto_32579 ) ( ON ?auto_32574 ?auto_32577 ) ( CLEAR ?auto_32574 ) ( not ( = ?auto_32573 ?auto_32577 ) ) ( not ( = ?auto_32574 ?auto_32577 ) ) ( not ( = ?auto_32580 ?auto_32577 ) ) ( SURFACE-AT ?auto_32580 ?auto_32575 ) ( CLEAR ?auto_32580 ) ( IS-CRATE ?auto_32573 ) ( AVAILABLE ?auto_32581 ) ( TRUCK-AT ?auto_32578 ?auto_32579 ) ( AVAILABLE ?auto_32576 ) ( SURFACE-AT ?auto_32573 ?auto_32579 ) ( ON ?auto_32573 ?auto_32582 ) ( CLEAR ?auto_32573 ) ( not ( = ?auto_32573 ?auto_32582 ) ) ( not ( = ?auto_32574 ?auto_32582 ) ) ( not ( = ?auto_32580 ?auto_32582 ) ) ( not ( = ?auto_32577 ?auto_32582 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32576 ?auto_32573 ?auto_32582 ?auto_32579 )
      ( MAKE-2CRATE ?auto_32580 ?auto_32573 ?auto_32574 )
      ( MAKE-1CRATE-VERIFY ?auto_32573 ?auto_32574 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32583 - SURFACE
      ?auto_32584 - SURFACE
      ?auto_32585 - SURFACE
    )
    :vars
    (
      ?auto_32591 - HOIST
      ?auto_32592 - PLACE
      ?auto_32588 - PLACE
      ?auto_32586 - HOIST
      ?auto_32587 - SURFACE
      ?auto_32590 - TRUCK
      ?auto_32589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32591 ?auto_32592 ) ( IS-CRATE ?auto_32585 ) ( not ( = ?auto_32584 ?auto_32585 ) ) ( not ( = ?auto_32583 ?auto_32584 ) ) ( not ( = ?auto_32583 ?auto_32585 ) ) ( not ( = ?auto_32588 ?auto_32592 ) ) ( HOIST-AT ?auto_32586 ?auto_32588 ) ( not ( = ?auto_32591 ?auto_32586 ) ) ( SURFACE-AT ?auto_32585 ?auto_32588 ) ( ON ?auto_32585 ?auto_32587 ) ( CLEAR ?auto_32585 ) ( not ( = ?auto_32584 ?auto_32587 ) ) ( not ( = ?auto_32585 ?auto_32587 ) ) ( not ( = ?auto_32583 ?auto_32587 ) ) ( SURFACE-AT ?auto_32583 ?auto_32592 ) ( CLEAR ?auto_32583 ) ( IS-CRATE ?auto_32584 ) ( AVAILABLE ?auto_32591 ) ( TRUCK-AT ?auto_32590 ?auto_32588 ) ( AVAILABLE ?auto_32586 ) ( SURFACE-AT ?auto_32584 ?auto_32588 ) ( ON ?auto_32584 ?auto_32589 ) ( CLEAR ?auto_32584 ) ( not ( = ?auto_32584 ?auto_32589 ) ) ( not ( = ?auto_32585 ?auto_32589 ) ) ( not ( = ?auto_32583 ?auto_32589 ) ) ( not ( = ?auto_32587 ?auto_32589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32584 ?auto_32585 )
      ( MAKE-2CRATE-VERIFY ?auto_32583 ?auto_32584 ?auto_32585 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32593 - SURFACE
      ?auto_32594 - SURFACE
      ?auto_32595 - SURFACE
      ?auto_32596 - SURFACE
    )
    :vars
    (
      ?auto_32601 - HOIST
      ?auto_32599 - PLACE
      ?auto_32598 - PLACE
      ?auto_32600 - HOIST
      ?auto_32603 - SURFACE
      ?auto_32602 - TRUCK
      ?auto_32597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32601 ?auto_32599 ) ( IS-CRATE ?auto_32596 ) ( not ( = ?auto_32595 ?auto_32596 ) ) ( not ( = ?auto_32594 ?auto_32595 ) ) ( not ( = ?auto_32594 ?auto_32596 ) ) ( not ( = ?auto_32598 ?auto_32599 ) ) ( HOIST-AT ?auto_32600 ?auto_32598 ) ( not ( = ?auto_32601 ?auto_32600 ) ) ( SURFACE-AT ?auto_32596 ?auto_32598 ) ( ON ?auto_32596 ?auto_32603 ) ( CLEAR ?auto_32596 ) ( not ( = ?auto_32595 ?auto_32603 ) ) ( not ( = ?auto_32596 ?auto_32603 ) ) ( not ( = ?auto_32594 ?auto_32603 ) ) ( SURFACE-AT ?auto_32594 ?auto_32599 ) ( CLEAR ?auto_32594 ) ( IS-CRATE ?auto_32595 ) ( AVAILABLE ?auto_32601 ) ( TRUCK-AT ?auto_32602 ?auto_32598 ) ( AVAILABLE ?auto_32600 ) ( SURFACE-AT ?auto_32595 ?auto_32598 ) ( ON ?auto_32595 ?auto_32597 ) ( CLEAR ?auto_32595 ) ( not ( = ?auto_32595 ?auto_32597 ) ) ( not ( = ?auto_32596 ?auto_32597 ) ) ( not ( = ?auto_32594 ?auto_32597 ) ) ( not ( = ?auto_32603 ?auto_32597 ) ) ( ON ?auto_32594 ?auto_32593 ) ( not ( = ?auto_32593 ?auto_32594 ) ) ( not ( = ?auto_32593 ?auto_32595 ) ) ( not ( = ?auto_32593 ?auto_32596 ) ) ( not ( = ?auto_32593 ?auto_32603 ) ) ( not ( = ?auto_32593 ?auto_32597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32594 ?auto_32595 ?auto_32596 )
      ( MAKE-3CRATE-VERIFY ?auto_32593 ?auto_32594 ?auto_32595 ?auto_32596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32604 - SURFACE
      ?auto_32605 - SURFACE
    )
    :vars
    (
      ?auto_32611 - HOIST
      ?auto_32609 - PLACE
      ?auto_32607 - SURFACE
      ?auto_32608 - PLACE
      ?auto_32610 - HOIST
      ?auto_32613 - SURFACE
      ?auto_32606 - SURFACE
      ?auto_32612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32611 ?auto_32609 ) ( IS-CRATE ?auto_32605 ) ( not ( = ?auto_32604 ?auto_32605 ) ) ( not ( = ?auto_32607 ?auto_32604 ) ) ( not ( = ?auto_32607 ?auto_32605 ) ) ( not ( = ?auto_32608 ?auto_32609 ) ) ( HOIST-AT ?auto_32610 ?auto_32608 ) ( not ( = ?auto_32611 ?auto_32610 ) ) ( SURFACE-AT ?auto_32605 ?auto_32608 ) ( ON ?auto_32605 ?auto_32613 ) ( CLEAR ?auto_32605 ) ( not ( = ?auto_32604 ?auto_32613 ) ) ( not ( = ?auto_32605 ?auto_32613 ) ) ( not ( = ?auto_32607 ?auto_32613 ) ) ( SURFACE-AT ?auto_32607 ?auto_32609 ) ( CLEAR ?auto_32607 ) ( IS-CRATE ?auto_32604 ) ( AVAILABLE ?auto_32611 ) ( AVAILABLE ?auto_32610 ) ( SURFACE-AT ?auto_32604 ?auto_32608 ) ( ON ?auto_32604 ?auto_32606 ) ( CLEAR ?auto_32604 ) ( not ( = ?auto_32604 ?auto_32606 ) ) ( not ( = ?auto_32605 ?auto_32606 ) ) ( not ( = ?auto_32607 ?auto_32606 ) ) ( not ( = ?auto_32613 ?auto_32606 ) ) ( TRUCK-AT ?auto_32612 ?auto_32609 ) )
    :subtasks
    ( ( !DRIVE ?auto_32612 ?auto_32609 ?auto_32608 )
      ( MAKE-2CRATE ?auto_32607 ?auto_32604 ?auto_32605 )
      ( MAKE-1CRATE-VERIFY ?auto_32604 ?auto_32605 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32614 - SURFACE
      ?auto_32615 - SURFACE
      ?auto_32616 - SURFACE
    )
    :vars
    (
      ?auto_32619 - HOIST
      ?auto_32623 - PLACE
      ?auto_32620 - PLACE
      ?auto_32622 - HOIST
      ?auto_32618 - SURFACE
      ?auto_32621 - SURFACE
      ?auto_32617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32619 ?auto_32623 ) ( IS-CRATE ?auto_32616 ) ( not ( = ?auto_32615 ?auto_32616 ) ) ( not ( = ?auto_32614 ?auto_32615 ) ) ( not ( = ?auto_32614 ?auto_32616 ) ) ( not ( = ?auto_32620 ?auto_32623 ) ) ( HOIST-AT ?auto_32622 ?auto_32620 ) ( not ( = ?auto_32619 ?auto_32622 ) ) ( SURFACE-AT ?auto_32616 ?auto_32620 ) ( ON ?auto_32616 ?auto_32618 ) ( CLEAR ?auto_32616 ) ( not ( = ?auto_32615 ?auto_32618 ) ) ( not ( = ?auto_32616 ?auto_32618 ) ) ( not ( = ?auto_32614 ?auto_32618 ) ) ( SURFACE-AT ?auto_32614 ?auto_32623 ) ( CLEAR ?auto_32614 ) ( IS-CRATE ?auto_32615 ) ( AVAILABLE ?auto_32619 ) ( AVAILABLE ?auto_32622 ) ( SURFACE-AT ?auto_32615 ?auto_32620 ) ( ON ?auto_32615 ?auto_32621 ) ( CLEAR ?auto_32615 ) ( not ( = ?auto_32615 ?auto_32621 ) ) ( not ( = ?auto_32616 ?auto_32621 ) ) ( not ( = ?auto_32614 ?auto_32621 ) ) ( not ( = ?auto_32618 ?auto_32621 ) ) ( TRUCK-AT ?auto_32617 ?auto_32623 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32615 ?auto_32616 )
      ( MAKE-2CRATE-VERIFY ?auto_32614 ?auto_32615 ?auto_32616 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32624 - SURFACE
      ?auto_32625 - SURFACE
      ?auto_32626 - SURFACE
      ?auto_32627 - SURFACE
    )
    :vars
    (
      ?auto_32632 - HOIST
      ?auto_32633 - PLACE
      ?auto_32631 - PLACE
      ?auto_32634 - HOIST
      ?auto_32628 - SURFACE
      ?auto_32629 - SURFACE
      ?auto_32630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32632 ?auto_32633 ) ( IS-CRATE ?auto_32627 ) ( not ( = ?auto_32626 ?auto_32627 ) ) ( not ( = ?auto_32625 ?auto_32626 ) ) ( not ( = ?auto_32625 ?auto_32627 ) ) ( not ( = ?auto_32631 ?auto_32633 ) ) ( HOIST-AT ?auto_32634 ?auto_32631 ) ( not ( = ?auto_32632 ?auto_32634 ) ) ( SURFACE-AT ?auto_32627 ?auto_32631 ) ( ON ?auto_32627 ?auto_32628 ) ( CLEAR ?auto_32627 ) ( not ( = ?auto_32626 ?auto_32628 ) ) ( not ( = ?auto_32627 ?auto_32628 ) ) ( not ( = ?auto_32625 ?auto_32628 ) ) ( SURFACE-AT ?auto_32625 ?auto_32633 ) ( CLEAR ?auto_32625 ) ( IS-CRATE ?auto_32626 ) ( AVAILABLE ?auto_32632 ) ( AVAILABLE ?auto_32634 ) ( SURFACE-AT ?auto_32626 ?auto_32631 ) ( ON ?auto_32626 ?auto_32629 ) ( CLEAR ?auto_32626 ) ( not ( = ?auto_32626 ?auto_32629 ) ) ( not ( = ?auto_32627 ?auto_32629 ) ) ( not ( = ?auto_32625 ?auto_32629 ) ) ( not ( = ?auto_32628 ?auto_32629 ) ) ( TRUCK-AT ?auto_32630 ?auto_32633 ) ( ON ?auto_32625 ?auto_32624 ) ( not ( = ?auto_32624 ?auto_32625 ) ) ( not ( = ?auto_32624 ?auto_32626 ) ) ( not ( = ?auto_32624 ?auto_32627 ) ) ( not ( = ?auto_32624 ?auto_32628 ) ) ( not ( = ?auto_32624 ?auto_32629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32625 ?auto_32626 ?auto_32627 )
      ( MAKE-3CRATE-VERIFY ?auto_32624 ?auto_32625 ?auto_32626 ?auto_32627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32635 - SURFACE
      ?auto_32636 - SURFACE
    )
    :vars
    (
      ?auto_32641 - HOIST
      ?auto_32643 - PLACE
      ?auto_32642 - SURFACE
      ?auto_32640 - PLACE
      ?auto_32644 - HOIST
      ?auto_32637 - SURFACE
      ?auto_32638 - SURFACE
      ?auto_32639 - TRUCK
      ?auto_32645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32641 ?auto_32643 ) ( IS-CRATE ?auto_32636 ) ( not ( = ?auto_32635 ?auto_32636 ) ) ( not ( = ?auto_32642 ?auto_32635 ) ) ( not ( = ?auto_32642 ?auto_32636 ) ) ( not ( = ?auto_32640 ?auto_32643 ) ) ( HOIST-AT ?auto_32644 ?auto_32640 ) ( not ( = ?auto_32641 ?auto_32644 ) ) ( SURFACE-AT ?auto_32636 ?auto_32640 ) ( ON ?auto_32636 ?auto_32637 ) ( CLEAR ?auto_32636 ) ( not ( = ?auto_32635 ?auto_32637 ) ) ( not ( = ?auto_32636 ?auto_32637 ) ) ( not ( = ?auto_32642 ?auto_32637 ) ) ( IS-CRATE ?auto_32635 ) ( AVAILABLE ?auto_32644 ) ( SURFACE-AT ?auto_32635 ?auto_32640 ) ( ON ?auto_32635 ?auto_32638 ) ( CLEAR ?auto_32635 ) ( not ( = ?auto_32635 ?auto_32638 ) ) ( not ( = ?auto_32636 ?auto_32638 ) ) ( not ( = ?auto_32642 ?auto_32638 ) ) ( not ( = ?auto_32637 ?auto_32638 ) ) ( TRUCK-AT ?auto_32639 ?auto_32643 ) ( SURFACE-AT ?auto_32645 ?auto_32643 ) ( CLEAR ?auto_32645 ) ( LIFTING ?auto_32641 ?auto_32642 ) ( IS-CRATE ?auto_32642 ) ( not ( = ?auto_32645 ?auto_32642 ) ) ( not ( = ?auto_32635 ?auto_32645 ) ) ( not ( = ?auto_32636 ?auto_32645 ) ) ( not ( = ?auto_32637 ?auto_32645 ) ) ( not ( = ?auto_32638 ?auto_32645 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32645 ?auto_32642 )
      ( MAKE-2CRATE ?auto_32642 ?auto_32635 ?auto_32636 )
      ( MAKE-1CRATE-VERIFY ?auto_32635 ?auto_32636 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32646 - SURFACE
      ?auto_32647 - SURFACE
      ?auto_32648 - SURFACE
    )
    :vars
    (
      ?auto_32654 - HOIST
      ?auto_32651 - PLACE
      ?auto_32656 - PLACE
      ?auto_32650 - HOIST
      ?auto_32652 - SURFACE
      ?auto_32655 - SURFACE
      ?auto_32653 - TRUCK
      ?auto_32649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32654 ?auto_32651 ) ( IS-CRATE ?auto_32648 ) ( not ( = ?auto_32647 ?auto_32648 ) ) ( not ( = ?auto_32646 ?auto_32647 ) ) ( not ( = ?auto_32646 ?auto_32648 ) ) ( not ( = ?auto_32656 ?auto_32651 ) ) ( HOIST-AT ?auto_32650 ?auto_32656 ) ( not ( = ?auto_32654 ?auto_32650 ) ) ( SURFACE-AT ?auto_32648 ?auto_32656 ) ( ON ?auto_32648 ?auto_32652 ) ( CLEAR ?auto_32648 ) ( not ( = ?auto_32647 ?auto_32652 ) ) ( not ( = ?auto_32648 ?auto_32652 ) ) ( not ( = ?auto_32646 ?auto_32652 ) ) ( IS-CRATE ?auto_32647 ) ( AVAILABLE ?auto_32650 ) ( SURFACE-AT ?auto_32647 ?auto_32656 ) ( ON ?auto_32647 ?auto_32655 ) ( CLEAR ?auto_32647 ) ( not ( = ?auto_32647 ?auto_32655 ) ) ( not ( = ?auto_32648 ?auto_32655 ) ) ( not ( = ?auto_32646 ?auto_32655 ) ) ( not ( = ?auto_32652 ?auto_32655 ) ) ( TRUCK-AT ?auto_32653 ?auto_32651 ) ( SURFACE-AT ?auto_32649 ?auto_32651 ) ( CLEAR ?auto_32649 ) ( LIFTING ?auto_32654 ?auto_32646 ) ( IS-CRATE ?auto_32646 ) ( not ( = ?auto_32649 ?auto_32646 ) ) ( not ( = ?auto_32647 ?auto_32649 ) ) ( not ( = ?auto_32648 ?auto_32649 ) ) ( not ( = ?auto_32652 ?auto_32649 ) ) ( not ( = ?auto_32655 ?auto_32649 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32647 ?auto_32648 )
      ( MAKE-2CRATE-VERIFY ?auto_32646 ?auto_32647 ?auto_32648 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32657 - SURFACE
      ?auto_32658 - SURFACE
      ?auto_32659 - SURFACE
      ?auto_32660 - SURFACE
    )
    :vars
    (
      ?auto_32665 - HOIST
      ?auto_32664 - PLACE
      ?auto_32667 - PLACE
      ?auto_32666 - HOIST
      ?auto_32663 - SURFACE
      ?auto_32661 - SURFACE
      ?auto_32662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32665 ?auto_32664 ) ( IS-CRATE ?auto_32660 ) ( not ( = ?auto_32659 ?auto_32660 ) ) ( not ( = ?auto_32658 ?auto_32659 ) ) ( not ( = ?auto_32658 ?auto_32660 ) ) ( not ( = ?auto_32667 ?auto_32664 ) ) ( HOIST-AT ?auto_32666 ?auto_32667 ) ( not ( = ?auto_32665 ?auto_32666 ) ) ( SURFACE-AT ?auto_32660 ?auto_32667 ) ( ON ?auto_32660 ?auto_32663 ) ( CLEAR ?auto_32660 ) ( not ( = ?auto_32659 ?auto_32663 ) ) ( not ( = ?auto_32660 ?auto_32663 ) ) ( not ( = ?auto_32658 ?auto_32663 ) ) ( IS-CRATE ?auto_32659 ) ( AVAILABLE ?auto_32666 ) ( SURFACE-AT ?auto_32659 ?auto_32667 ) ( ON ?auto_32659 ?auto_32661 ) ( CLEAR ?auto_32659 ) ( not ( = ?auto_32659 ?auto_32661 ) ) ( not ( = ?auto_32660 ?auto_32661 ) ) ( not ( = ?auto_32658 ?auto_32661 ) ) ( not ( = ?auto_32663 ?auto_32661 ) ) ( TRUCK-AT ?auto_32662 ?auto_32664 ) ( SURFACE-AT ?auto_32657 ?auto_32664 ) ( CLEAR ?auto_32657 ) ( LIFTING ?auto_32665 ?auto_32658 ) ( IS-CRATE ?auto_32658 ) ( not ( = ?auto_32657 ?auto_32658 ) ) ( not ( = ?auto_32659 ?auto_32657 ) ) ( not ( = ?auto_32660 ?auto_32657 ) ) ( not ( = ?auto_32663 ?auto_32657 ) ) ( not ( = ?auto_32661 ?auto_32657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32658 ?auto_32659 ?auto_32660 )
      ( MAKE-3CRATE-VERIFY ?auto_32657 ?auto_32658 ?auto_32659 ?auto_32660 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32668 - SURFACE
      ?auto_32669 - SURFACE
    )
    :vars
    (
      ?auto_32676 - HOIST
      ?auto_32675 - PLACE
      ?auto_32671 - SURFACE
      ?auto_32678 - PLACE
      ?auto_32677 - HOIST
      ?auto_32673 - SURFACE
      ?auto_32670 - SURFACE
      ?auto_32672 - TRUCK
      ?auto_32674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32676 ?auto_32675 ) ( IS-CRATE ?auto_32669 ) ( not ( = ?auto_32668 ?auto_32669 ) ) ( not ( = ?auto_32671 ?auto_32668 ) ) ( not ( = ?auto_32671 ?auto_32669 ) ) ( not ( = ?auto_32678 ?auto_32675 ) ) ( HOIST-AT ?auto_32677 ?auto_32678 ) ( not ( = ?auto_32676 ?auto_32677 ) ) ( SURFACE-AT ?auto_32669 ?auto_32678 ) ( ON ?auto_32669 ?auto_32673 ) ( CLEAR ?auto_32669 ) ( not ( = ?auto_32668 ?auto_32673 ) ) ( not ( = ?auto_32669 ?auto_32673 ) ) ( not ( = ?auto_32671 ?auto_32673 ) ) ( IS-CRATE ?auto_32668 ) ( AVAILABLE ?auto_32677 ) ( SURFACE-AT ?auto_32668 ?auto_32678 ) ( ON ?auto_32668 ?auto_32670 ) ( CLEAR ?auto_32668 ) ( not ( = ?auto_32668 ?auto_32670 ) ) ( not ( = ?auto_32669 ?auto_32670 ) ) ( not ( = ?auto_32671 ?auto_32670 ) ) ( not ( = ?auto_32673 ?auto_32670 ) ) ( TRUCK-AT ?auto_32672 ?auto_32675 ) ( SURFACE-AT ?auto_32674 ?auto_32675 ) ( CLEAR ?auto_32674 ) ( IS-CRATE ?auto_32671 ) ( not ( = ?auto_32674 ?auto_32671 ) ) ( not ( = ?auto_32668 ?auto_32674 ) ) ( not ( = ?auto_32669 ?auto_32674 ) ) ( not ( = ?auto_32673 ?auto_32674 ) ) ( not ( = ?auto_32670 ?auto_32674 ) ) ( AVAILABLE ?auto_32676 ) ( IN ?auto_32671 ?auto_32672 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32676 ?auto_32671 ?auto_32672 ?auto_32675 )
      ( MAKE-2CRATE ?auto_32671 ?auto_32668 ?auto_32669 )
      ( MAKE-1CRATE-VERIFY ?auto_32668 ?auto_32669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32679 - SURFACE
      ?auto_32680 - SURFACE
      ?auto_32681 - SURFACE
    )
    :vars
    (
      ?auto_32686 - HOIST
      ?auto_32687 - PLACE
      ?auto_32685 - PLACE
      ?auto_32682 - HOIST
      ?auto_32684 - SURFACE
      ?auto_32689 - SURFACE
      ?auto_32683 - TRUCK
      ?auto_32688 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32686 ?auto_32687 ) ( IS-CRATE ?auto_32681 ) ( not ( = ?auto_32680 ?auto_32681 ) ) ( not ( = ?auto_32679 ?auto_32680 ) ) ( not ( = ?auto_32679 ?auto_32681 ) ) ( not ( = ?auto_32685 ?auto_32687 ) ) ( HOIST-AT ?auto_32682 ?auto_32685 ) ( not ( = ?auto_32686 ?auto_32682 ) ) ( SURFACE-AT ?auto_32681 ?auto_32685 ) ( ON ?auto_32681 ?auto_32684 ) ( CLEAR ?auto_32681 ) ( not ( = ?auto_32680 ?auto_32684 ) ) ( not ( = ?auto_32681 ?auto_32684 ) ) ( not ( = ?auto_32679 ?auto_32684 ) ) ( IS-CRATE ?auto_32680 ) ( AVAILABLE ?auto_32682 ) ( SURFACE-AT ?auto_32680 ?auto_32685 ) ( ON ?auto_32680 ?auto_32689 ) ( CLEAR ?auto_32680 ) ( not ( = ?auto_32680 ?auto_32689 ) ) ( not ( = ?auto_32681 ?auto_32689 ) ) ( not ( = ?auto_32679 ?auto_32689 ) ) ( not ( = ?auto_32684 ?auto_32689 ) ) ( TRUCK-AT ?auto_32683 ?auto_32687 ) ( SURFACE-AT ?auto_32688 ?auto_32687 ) ( CLEAR ?auto_32688 ) ( IS-CRATE ?auto_32679 ) ( not ( = ?auto_32688 ?auto_32679 ) ) ( not ( = ?auto_32680 ?auto_32688 ) ) ( not ( = ?auto_32681 ?auto_32688 ) ) ( not ( = ?auto_32684 ?auto_32688 ) ) ( not ( = ?auto_32689 ?auto_32688 ) ) ( AVAILABLE ?auto_32686 ) ( IN ?auto_32679 ?auto_32683 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32680 ?auto_32681 )
      ( MAKE-2CRATE-VERIFY ?auto_32679 ?auto_32680 ?auto_32681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32690 - SURFACE
      ?auto_32691 - SURFACE
      ?auto_32692 - SURFACE
      ?auto_32693 - SURFACE
    )
    :vars
    (
      ?auto_32699 - HOIST
      ?auto_32695 - PLACE
      ?auto_32696 - PLACE
      ?auto_32698 - HOIST
      ?auto_32694 - SURFACE
      ?auto_32700 - SURFACE
      ?auto_32697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32699 ?auto_32695 ) ( IS-CRATE ?auto_32693 ) ( not ( = ?auto_32692 ?auto_32693 ) ) ( not ( = ?auto_32691 ?auto_32692 ) ) ( not ( = ?auto_32691 ?auto_32693 ) ) ( not ( = ?auto_32696 ?auto_32695 ) ) ( HOIST-AT ?auto_32698 ?auto_32696 ) ( not ( = ?auto_32699 ?auto_32698 ) ) ( SURFACE-AT ?auto_32693 ?auto_32696 ) ( ON ?auto_32693 ?auto_32694 ) ( CLEAR ?auto_32693 ) ( not ( = ?auto_32692 ?auto_32694 ) ) ( not ( = ?auto_32693 ?auto_32694 ) ) ( not ( = ?auto_32691 ?auto_32694 ) ) ( IS-CRATE ?auto_32692 ) ( AVAILABLE ?auto_32698 ) ( SURFACE-AT ?auto_32692 ?auto_32696 ) ( ON ?auto_32692 ?auto_32700 ) ( CLEAR ?auto_32692 ) ( not ( = ?auto_32692 ?auto_32700 ) ) ( not ( = ?auto_32693 ?auto_32700 ) ) ( not ( = ?auto_32691 ?auto_32700 ) ) ( not ( = ?auto_32694 ?auto_32700 ) ) ( TRUCK-AT ?auto_32697 ?auto_32695 ) ( SURFACE-AT ?auto_32690 ?auto_32695 ) ( CLEAR ?auto_32690 ) ( IS-CRATE ?auto_32691 ) ( not ( = ?auto_32690 ?auto_32691 ) ) ( not ( = ?auto_32692 ?auto_32690 ) ) ( not ( = ?auto_32693 ?auto_32690 ) ) ( not ( = ?auto_32694 ?auto_32690 ) ) ( not ( = ?auto_32700 ?auto_32690 ) ) ( AVAILABLE ?auto_32699 ) ( IN ?auto_32691 ?auto_32697 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32691 ?auto_32692 ?auto_32693 )
      ( MAKE-3CRATE-VERIFY ?auto_32690 ?auto_32691 ?auto_32692 ?auto_32693 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32701 - SURFACE
      ?auto_32702 - SURFACE
    )
    :vars
    (
      ?auto_32709 - HOIST
      ?auto_32704 - PLACE
      ?auto_32708 - SURFACE
      ?auto_32705 - PLACE
      ?auto_32707 - HOIST
      ?auto_32703 - SURFACE
      ?auto_32710 - SURFACE
      ?auto_32711 - SURFACE
      ?auto_32706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32709 ?auto_32704 ) ( IS-CRATE ?auto_32702 ) ( not ( = ?auto_32701 ?auto_32702 ) ) ( not ( = ?auto_32708 ?auto_32701 ) ) ( not ( = ?auto_32708 ?auto_32702 ) ) ( not ( = ?auto_32705 ?auto_32704 ) ) ( HOIST-AT ?auto_32707 ?auto_32705 ) ( not ( = ?auto_32709 ?auto_32707 ) ) ( SURFACE-AT ?auto_32702 ?auto_32705 ) ( ON ?auto_32702 ?auto_32703 ) ( CLEAR ?auto_32702 ) ( not ( = ?auto_32701 ?auto_32703 ) ) ( not ( = ?auto_32702 ?auto_32703 ) ) ( not ( = ?auto_32708 ?auto_32703 ) ) ( IS-CRATE ?auto_32701 ) ( AVAILABLE ?auto_32707 ) ( SURFACE-AT ?auto_32701 ?auto_32705 ) ( ON ?auto_32701 ?auto_32710 ) ( CLEAR ?auto_32701 ) ( not ( = ?auto_32701 ?auto_32710 ) ) ( not ( = ?auto_32702 ?auto_32710 ) ) ( not ( = ?auto_32708 ?auto_32710 ) ) ( not ( = ?auto_32703 ?auto_32710 ) ) ( SURFACE-AT ?auto_32711 ?auto_32704 ) ( CLEAR ?auto_32711 ) ( IS-CRATE ?auto_32708 ) ( not ( = ?auto_32711 ?auto_32708 ) ) ( not ( = ?auto_32701 ?auto_32711 ) ) ( not ( = ?auto_32702 ?auto_32711 ) ) ( not ( = ?auto_32703 ?auto_32711 ) ) ( not ( = ?auto_32710 ?auto_32711 ) ) ( AVAILABLE ?auto_32709 ) ( IN ?auto_32708 ?auto_32706 ) ( TRUCK-AT ?auto_32706 ?auto_32705 ) )
    :subtasks
    ( ( !DRIVE ?auto_32706 ?auto_32705 ?auto_32704 )
      ( MAKE-2CRATE ?auto_32708 ?auto_32701 ?auto_32702 )
      ( MAKE-1CRATE-VERIFY ?auto_32701 ?auto_32702 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32712 - SURFACE
      ?auto_32713 - SURFACE
      ?auto_32714 - SURFACE
    )
    :vars
    (
      ?auto_32720 - HOIST
      ?auto_32718 - PLACE
      ?auto_32719 - PLACE
      ?auto_32715 - HOIST
      ?auto_32721 - SURFACE
      ?auto_32722 - SURFACE
      ?auto_32717 - SURFACE
      ?auto_32716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32720 ?auto_32718 ) ( IS-CRATE ?auto_32714 ) ( not ( = ?auto_32713 ?auto_32714 ) ) ( not ( = ?auto_32712 ?auto_32713 ) ) ( not ( = ?auto_32712 ?auto_32714 ) ) ( not ( = ?auto_32719 ?auto_32718 ) ) ( HOIST-AT ?auto_32715 ?auto_32719 ) ( not ( = ?auto_32720 ?auto_32715 ) ) ( SURFACE-AT ?auto_32714 ?auto_32719 ) ( ON ?auto_32714 ?auto_32721 ) ( CLEAR ?auto_32714 ) ( not ( = ?auto_32713 ?auto_32721 ) ) ( not ( = ?auto_32714 ?auto_32721 ) ) ( not ( = ?auto_32712 ?auto_32721 ) ) ( IS-CRATE ?auto_32713 ) ( AVAILABLE ?auto_32715 ) ( SURFACE-AT ?auto_32713 ?auto_32719 ) ( ON ?auto_32713 ?auto_32722 ) ( CLEAR ?auto_32713 ) ( not ( = ?auto_32713 ?auto_32722 ) ) ( not ( = ?auto_32714 ?auto_32722 ) ) ( not ( = ?auto_32712 ?auto_32722 ) ) ( not ( = ?auto_32721 ?auto_32722 ) ) ( SURFACE-AT ?auto_32717 ?auto_32718 ) ( CLEAR ?auto_32717 ) ( IS-CRATE ?auto_32712 ) ( not ( = ?auto_32717 ?auto_32712 ) ) ( not ( = ?auto_32713 ?auto_32717 ) ) ( not ( = ?auto_32714 ?auto_32717 ) ) ( not ( = ?auto_32721 ?auto_32717 ) ) ( not ( = ?auto_32722 ?auto_32717 ) ) ( AVAILABLE ?auto_32720 ) ( IN ?auto_32712 ?auto_32716 ) ( TRUCK-AT ?auto_32716 ?auto_32719 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32713 ?auto_32714 )
      ( MAKE-2CRATE-VERIFY ?auto_32712 ?auto_32713 ?auto_32714 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32723 - SURFACE
      ?auto_32724 - SURFACE
      ?auto_32725 - SURFACE
      ?auto_32726 - SURFACE
    )
    :vars
    (
      ?auto_32733 - HOIST
      ?auto_32730 - PLACE
      ?auto_32727 - PLACE
      ?auto_32732 - HOIST
      ?auto_32728 - SURFACE
      ?auto_32729 - SURFACE
      ?auto_32731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32733 ?auto_32730 ) ( IS-CRATE ?auto_32726 ) ( not ( = ?auto_32725 ?auto_32726 ) ) ( not ( = ?auto_32724 ?auto_32725 ) ) ( not ( = ?auto_32724 ?auto_32726 ) ) ( not ( = ?auto_32727 ?auto_32730 ) ) ( HOIST-AT ?auto_32732 ?auto_32727 ) ( not ( = ?auto_32733 ?auto_32732 ) ) ( SURFACE-AT ?auto_32726 ?auto_32727 ) ( ON ?auto_32726 ?auto_32728 ) ( CLEAR ?auto_32726 ) ( not ( = ?auto_32725 ?auto_32728 ) ) ( not ( = ?auto_32726 ?auto_32728 ) ) ( not ( = ?auto_32724 ?auto_32728 ) ) ( IS-CRATE ?auto_32725 ) ( AVAILABLE ?auto_32732 ) ( SURFACE-AT ?auto_32725 ?auto_32727 ) ( ON ?auto_32725 ?auto_32729 ) ( CLEAR ?auto_32725 ) ( not ( = ?auto_32725 ?auto_32729 ) ) ( not ( = ?auto_32726 ?auto_32729 ) ) ( not ( = ?auto_32724 ?auto_32729 ) ) ( not ( = ?auto_32728 ?auto_32729 ) ) ( SURFACE-AT ?auto_32723 ?auto_32730 ) ( CLEAR ?auto_32723 ) ( IS-CRATE ?auto_32724 ) ( not ( = ?auto_32723 ?auto_32724 ) ) ( not ( = ?auto_32725 ?auto_32723 ) ) ( not ( = ?auto_32726 ?auto_32723 ) ) ( not ( = ?auto_32728 ?auto_32723 ) ) ( not ( = ?auto_32729 ?auto_32723 ) ) ( AVAILABLE ?auto_32733 ) ( IN ?auto_32724 ?auto_32731 ) ( TRUCK-AT ?auto_32731 ?auto_32727 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32724 ?auto_32725 ?auto_32726 )
      ( MAKE-3CRATE-VERIFY ?auto_32723 ?auto_32724 ?auto_32725 ?auto_32726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32734 - SURFACE
      ?auto_32735 - SURFACE
    )
    :vars
    (
      ?auto_32743 - HOIST
      ?auto_32739 - PLACE
      ?auto_32744 - SURFACE
      ?auto_32736 - PLACE
      ?auto_32741 - HOIST
      ?auto_32737 - SURFACE
      ?auto_32738 - SURFACE
      ?auto_32742 - SURFACE
      ?auto_32740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32743 ?auto_32739 ) ( IS-CRATE ?auto_32735 ) ( not ( = ?auto_32734 ?auto_32735 ) ) ( not ( = ?auto_32744 ?auto_32734 ) ) ( not ( = ?auto_32744 ?auto_32735 ) ) ( not ( = ?auto_32736 ?auto_32739 ) ) ( HOIST-AT ?auto_32741 ?auto_32736 ) ( not ( = ?auto_32743 ?auto_32741 ) ) ( SURFACE-AT ?auto_32735 ?auto_32736 ) ( ON ?auto_32735 ?auto_32737 ) ( CLEAR ?auto_32735 ) ( not ( = ?auto_32734 ?auto_32737 ) ) ( not ( = ?auto_32735 ?auto_32737 ) ) ( not ( = ?auto_32744 ?auto_32737 ) ) ( IS-CRATE ?auto_32734 ) ( SURFACE-AT ?auto_32734 ?auto_32736 ) ( ON ?auto_32734 ?auto_32738 ) ( CLEAR ?auto_32734 ) ( not ( = ?auto_32734 ?auto_32738 ) ) ( not ( = ?auto_32735 ?auto_32738 ) ) ( not ( = ?auto_32744 ?auto_32738 ) ) ( not ( = ?auto_32737 ?auto_32738 ) ) ( SURFACE-AT ?auto_32742 ?auto_32739 ) ( CLEAR ?auto_32742 ) ( IS-CRATE ?auto_32744 ) ( not ( = ?auto_32742 ?auto_32744 ) ) ( not ( = ?auto_32734 ?auto_32742 ) ) ( not ( = ?auto_32735 ?auto_32742 ) ) ( not ( = ?auto_32737 ?auto_32742 ) ) ( not ( = ?auto_32738 ?auto_32742 ) ) ( AVAILABLE ?auto_32743 ) ( TRUCK-AT ?auto_32740 ?auto_32736 ) ( LIFTING ?auto_32741 ?auto_32744 ) )
    :subtasks
    ( ( !LOAD ?auto_32741 ?auto_32744 ?auto_32740 ?auto_32736 )
      ( MAKE-2CRATE ?auto_32744 ?auto_32734 ?auto_32735 )
      ( MAKE-1CRATE-VERIFY ?auto_32734 ?auto_32735 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32745 - SURFACE
      ?auto_32746 - SURFACE
      ?auto_32747 - SURFACE
    )
    :vars
    (
      ?auto_32755 - HOIST
      ?auto_32754 - PLACE
      ?auto_32749 - PLACE
      ?auto_32752 - HOIST
      ?auto_32748 - SURFACE
      ?auto_32750 - SURFACE
      ?auto_32751 - SURFACE
      ?auto_32753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32755 ?auto_32754 ) ( IS-CRATE ?auto_32747 ) ( not ( = ?auto_32746 ?auto_32747 ) ) ( not ( = ?auto_32745 ?auto_32746 ) ) ( not ( = ?auto_32745 ?auto_32747 ) ) ( not ( = ?auto_32749 ?auto_32754 ) ) ( HOIST-AT ?auto_32752 ?auto_32749 ) ( not ( = ?auto_32755 ?auto_32752 ) ) ( SURFACE-AT ?auto_32747 ?auto_32749 ) ( ON ?auto_32747 ?auto_32748 ) ( CLEAR ?auto_32747 ) ( not ( = ?auto_32746 ?auto_32748 ) ) ( not ( = ?auto_32747 ?auto_32748 ) ) ( not ( = ?auto_32745 ?auto_32748 ) ) ( IS-CRATE ?auto_32746 ) ( SURFACE-AT ?auto_32746 ?auto_32749 ) ( ON ?auto_32746 ?auto_32750 ) ( CLEAR ?auto_32746 ) ( not ( = ?auto_32746 ?auto_32750 ) ) ( not ( = ?auto_32747 ?auto_32750 ) ) ( not ( = ?auto_32745 ?auto_32750 ) ) ( not ( = ?auto_32748 ?auto_32750 ) ) ( SURFACE-AT ?auto_32751 ?auto_32754 ) ( CLEAR ?auto_32751 ) ( IS-CRATE ?auto_32745 ) ( not ( = ?auto_32751 ?auto_32745 ) ) ( not ( = ?auto_32746 ?auto_32751 ) ) ( not ( = ?auto_32747 ?auto_32751 ) ) ( not ( = ?auto_32748 ?auto_32751 ) ) ( not ( = ?auto_32750 ?auto_32751 ) ) ( AVAILABLE ?auto_32755 ) ( TRUCK-AT ?auto_32753 ?auto_32749 ) ( LIFTING ?auto_32752 ?auto_32745 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32746 ?auto_32747 )
      ( MAKE-2CRATE-VERIFY ?auto_32745 ?auto_32746 ?auto_32747 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32756 - SURFACE
      ?auto_32757 - SURFACE
      ?auto_32758 - SURFACE
      ?auto_32759 - SURFACE
    )
    :vars
    (
      ?auto_32763 - HOIST
      ?auto_32761 - PLACE
      ?auto_32765 - PLACE
      ?auto_32762 - HOIST
      ?auto_32764 - SURFACE
      ?auto_32766 - SURFACE
      ?auto_32760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32763 ?auto_32761 ) ( IS-CRATE ?auto_32759 ) ( not ( = ?auto_32758 ?auto_32759 ) ) ( not ( = ?auto_32757 ?auto_32758 ) ) ( not ( = ?auto_32757 ?auto_32759 ) ) ( not ( = ?auto_32765 ?auto_32761 ) ) ( HOIST-AT ?auto_32762 ?auto_32765 ) ( not ( = ?auto_32763 ?auto_32762 ) ) ( SURFACE-AT ?auto_32759 ?auto_32765 ) ( ON ?auto_32759 ?auto_32764 ) ( CLEAR ?auto_32759 ) ( not ( = ?auto_32758 ?auto_32764 ) ) ( not ( = ?auto_32759 ?auto_32764 ) ) ( not ( = ?auto_32757 ?auto_32764 ) ) ( IS-CRATE ?auto_32758 ) ( SURFACE-AT ?auto_32758 ?auto_32765 ) ( ON ?auto_32758 ?auto_32766 ) ( CLEAR ?auto_32758 ) ( not ( = ?auto_32758 ?auto_32766 ) ) ( not ( = ?auto_32759 ?auto_32766 ) ) ( not ( = ?auto_32757 ?auto_32766 ) ) ( not ( = ?auto_32764 ?auto_32766 ) ) ( SURFACE-AT ?auto_32756 ?auto_32761 ) ( CLEAR ?auto_32756 ) ( IS-CRATE ?auto_32757 ) ( not ( = ?auto_32756 ?auto_32757 ) ) ( not ( = ?auto_32758 ?auto_32756 ) ) ( not ( = ?auto_32759 ?auto_32756 ) ) ( not ( = ?auto_32764 ?auto_32756 ) ) ( not ( = ?auto_32766 ?auto_32756 ) ) ( AVAILABLE ?auto_32763 ) ( TRUCK-AT ?auto_32760 ?auto_32765 ) ( LIFTING ?auto_32762 ?auto_32757 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32757 ?auto_32758 ?auto_32759 )
      ( MAKE-3CRATE-VERIFY ?auto_32756 ?auto_32757 ?auto_32758 ?auto_32759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32767 - SURFACE
      ?auto_32768 - SURFACE
    )
    :vars
    (
      ?auto_32773 - HOIST
      ?auto_32771 - PLACE
      ?auto_32774 - SURFACE
      ?auto_32776 - PLACE
      ?auto_32772 - HOIST
      ?auto_32775 - SURFACE
      ?auto_32777 - SURFACE
      ?auto_32769 - SURFACE
      ?auto_32770 - TRUCK
      ?auto_32778 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32773 ?auto_32771 ) ( IS-CRATE ?auto_32768 ) ( not ( = ?auto_32767 ?auto_32768 ) ) ( not ( = ?auto_32774 ?auto_32767 ) ) ( not ( = ?auto_32774 ?auto_32768 ) ) ( not ( = ?auto_32776 ?auto_32771 ) ) ( HOIST-AT ?auto_32772 ?auto_32776 ) ( not ( = ?auto_32773 ?auto_32772 ) ) ( SURFACE-AT ?auto_32768 ?auto_32776 ) ( ON ?auto_32768 ?auto_32775 ) ( CLEAR ?auto_32768 ) ( not ( = ?auto_32767 ?auto_32775 ) ) ( not ( = ?auto_32768 ?auto_32775 ) ) ( not ( = ?auto_32774 ?auto_32775 ) ) ( IS-CRATE ?auto_32767 ) ( SURFACE-AT ?auto_32767 ?auto_32776 ) ( ON ?auto_32767 ?auto_32777 ) ( CLEAR ?auto_32767 ) ( not ( = ?auto_32767 ?auto_32777 ) ) ( not ( = ?auto_32768 ?auto_32777 ) ) ( not ( = ?auto_32774 ?auto_32777 ) ) ( not ( = ?auto_32775 ?auto_32777 ) ) ( SURFACE-AT ?auto_32769 ?auto_32771 ) ( CLEAR ?auto_32769 ) ( IS-CRATE ?auto_32774 ) ( not ( = ?auto_32769 ?auto_32774 ) ) ( not ( = ?auto_32767 ?auto_32769 ) ) ( not ( = ?auto_32768 ?auto_32769 ) ) ( not ( = ?auto_32775 ?auto_32769 ) ) ( not ( = ?auto_32777 ?auto_32769 ) ) ( AVAILABLE ?auto_32773 ) ( TRUCK-AT ?auto_32770 ?auto_32776 ) ( AVAILABLE ?auto_32772 ) ( SURFACE-AT ?auto_32774 ?auto_32776 ) ( ON ?auto_32774 ?auto_32778 ) ( CLEAR ?auto_32774 ) ( not ( = ?auto_32767 ?auto_32778 ) ) ( not ( = ?auto_32768 ?auto_32778 ) ) ( not ( = ?auto_32774 ?auto_32778 ) ) ( not ( = ?auto_32775 ?auto_32778 ) ) ( not ( = ?auto_32777 ?auto_32778 ) ) ( not ( = ?auto_32769 ?auto_32778 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32772 ?auto_32774 ?auto_32778 ?auto_32776 )
      ( MAKE-2CRATE ?auto_32774 ?auto_32767 ?auto_32768 )
      ( MAKE-1CRATE-VERIFY ?auto_32767 ?auto_32768 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32779 - SURFACE
      ?auto_32780 - SURFACE
      ?auto_32781 - SURFACE
    )
    :vars
    (
      ?auto_32789 - HOIST
      ?auto_32783 - PLACE
      ?auto_32790 - PLACE
      ?auto_32785 - HOIST
      ?auto_32782 - SURFACE
      ?auto_32788 - SURFACE
      ?auto_32784 - SURFACE
      ?auto_32786 - TRUCK
      ?auto_32787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32789 ?auto_32783 ) ( IS-CRATE ?auto_32781 ) ( not ( = ?auto_32780 ?auto_32781 ) ) ( not ( = ?auto_32779 ?auto_32780 ) ) ( not ( = ?auto_32779 ?auto_32781 ) ) ( not ( = ?auto_32790 ?auto_32783 ) ) ( HOIST-AT ?auto_32785 ?auto_32790 ) ( not ( = ?auto_32789 ?auto_32785 ) ) ( SURFACE-AT ?auto_32781 ?auto_32790 ) ( ON ?auto_32781 ?auto_32782 ) ( CLEAR ?auto_32781 ) ( not ( = ?auto_32780 ?auto_32782 ) ) ( not ( = ?auto_32781 ?auto_32782 ) ) ( not ( = ?auto_32779 ?auto_32782 ) ) ( IS-CRATE ?auto_32780 ) ( SURFACE-AT ?auto_32780 ?auto_32790 ) ( ON ?auto_32780 ?auto_32788 ) ( CLEAR ?auto_32780 ) ( not ( = ?auto_32780 ?auto_32788 ) ) ( not ( = ?auto_32781 ?auto_32788 ) ) ( not ( = ?auto_32779 ?auto_32788 ) ) ( not ( = ?auto_32782 ?auto_32788 ) ) ( SURFACE-AT ?auto_32784 ?auto_32783 ) ( CLEAR ?auto_32784 ) ( IS-CRATE ?auto_32779 ) ( not ( = ?auto_32784 ?auto_32779 ) ) ( not ( = ?auto_32780 ?auto_32784 ) ) ( not ( = ?auto_32781 ?auto_32784 ) ) ( not ( = ?auto_32782 ?auto_32784 ) ) ( not ( = ?auto_32788 ?auto_32784 ) ) ( AVAILABLE ?auto_32789 ) ( TRUCK-AT ?auto_32786 ?auto_32790 ) ( AVAILABLE ?auto_32785 ) ( SURFACE-AT ?auto_32779 ?auto_32790 ) ( ON ?auto_32779 ?auto_32787 ) ( CLEAR ?auto_32779 ) ( not ( = ?auto_32780 ?auto_32787 ) ) ( not ( = ?auto_32781 ?auto_32787 ) ) ( not ( = ?auto_32779 ?auto_32787 ) ) ( not ( = ?auto_32782 ?auto_32787 ) ) ( not ( = ?auto_32788 ?auto_32787 ) ) ( not ( = ?auto_32784 ?auto_32787 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32780 ?auto_32781 )
      ( MAKE-2CRATE-VERIFY ?auto_32779 ?auto_32780 ?auto_32781 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32791 - SURFACE
      ?auto_32792 - SURFACE
      ?auto_32793 - SURFACE
      ?auto_32794 - SURFACE
    )
    :vars
    (
      ?auto_32798 - HOIST
      ?auto_32796 - PLACE
      ?auto_32795 - PLACE
      ?auto_32801 - HOIST
      ?auto_32797 - SURFACE
      ?auto_32799 - SURFACE
      ?auto_32800 - TRUCK
      ?auto_32802 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32798 ?auto_32796 ) ( IS-CRATE ?auto_32794 ) ( not ( = ?auto_32793 ?auto_32794 ) ) ( not ( = ?auto_32792 ?auto_32793 ) ) ( not ( = ?auto_32792 ?auto_32794 ) ) ( not ( = ?auto_32795 ?auto_32796 ) ) ( HOIST-AT ?auto_32801 ?auto_32795 ) ( not ( = ?auto_32798 ?auto_32801 ) ) ( SURFACE-AT ?auto_32794 ?auto_32795 ) ( ON ?auto_32794 ?auto_32797 ) ( CLEAR ?auto_32794 ) ( not ( = ?auto_32793 ?auto_32797 ) ) ( not ( = ?auto_32794 ?auto_32797 ) ) ( not ( = ?auto_32792 ?auto_32797 ) ) ( IS-CRATE ?auto_32793 ) ( SURFACE-AT ?auto_32793 ?auto_32795 ) ( ON ?auto_32793 ?auto_32799 ) ( CLEAR ?auto_32793 ) ( not ( = ?auto_32793 ?auto_32799 ) ) ( not ( = ?auto_32794 ?auto_32799 ) ) ( not ( = ?auto_32792 ?auto_32799 ) ) ( not ( = ?auto_32797 ?auto_32799 ) ) ( SURFACE-AT ?auto_32791 ?auto_32796 ) ( CLEAR ?auto_32791 ) ( IS-CRATE ?auto_32792 ) ( not ( = ?auto_32791 ?auto_32792 ) ) ( not ( = ?auto_32793 ?auto_32791 ) ) ( not ( = ?auto_32794 ?auto_32791 ) ) ( not ( = ?auto_32797 ?auto_32791 ) ) ( not ( = ?auto_32799 ?auto_32791 ) ) ( AVAILABLE ?auto_32798 ) ( TRUCK-AT ?auto_32800 ?auto_32795 ) ( AVAILABLE ?auto_32801 ) ( SURFACE-AT ?auto_32792 ?auto_32795 ) ( ON ?auto_32792 ?auto_32802 ) ( CLEAR ?auto_32792 ) ( not ( = ?auto_32793 ?auto_32802 ) ) ( not ( = ?auto_32794 ?auto_32802 ) ) ( not ( = ?auto_32792 ?auto_32802 ) ) ( not ( = ?auto_32797 ?auto_32802 ) ) ( not ( = ?auto_32799 ?auto_32802 ) ) ( not ( = ?auto_32791 ?auto_32802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32792 ?auto_32793 ?auto_32794 )
      ( MAKE-3CRATE-VERIFY ?auto_32791 ?auto_32792 ?auto_32793 ?auto_32794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32803 - SURFACE
      ?auto_32804 - SURFACE
    )
    :vars
    (
      ?auto_32808 - HOIST
      ?auto_32806 - PLACE
      ?auto_32812 - SURFACE
      ?auto_32805 - PLACE
      ?auto_32813 - HOIST
      ?auto_32807 - SURFACE
      ?auto_32810 - SURFACE
      ?auto_32809 - SURFACE
      ?auto_32814 - SURFACE
      ?auto_32811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32808 ?auto_32806 ) ( IS-CRATE ?auto_32804 ) ( not ( = ?auto_32803 ?auto_32804 ) ) ( not ( = ?auto_32812 ?auto_32803 ) ) ( not ( = ?auto_32812 ?auto_32804 ) ) ( not ( = ?auto_32805 ?auto_32806 ) ) ( HOIST-AT ?auto_32813 ?auto_32805 ) ( not ( = ?auto_32808 ?auto_32813 ) ) ( SURFACE-AT ?auto_32804 ?auto_32805 ) ( ON ?auto_32804 ?auto_32807 ) ( CLEAR ?auto_32804 ) ( not ( = ?auto_32803 ?auto_32807 ) ) ( not ( = ?auto_32804 ?auto_32807 ) ) ( not ( = ?auto_32812 ?auto_32807 ) ) ( IS-CRATE ?auto_32803 ) ( SURFACE-AT ?auto_32803 ?auto_32805 ) ( ON ?auto_32803 ?auto_32810 ) ( CLEAR ?auto_32803 ) ( not ( = ?auto_32803 ?auto_32810 ) ) ( not ( = ?auto_32804 ?auto_32810 ) ) ( not ( = ?auto_32812 ?auto_32810 ) ) ( not ( = ?auto_32807 ?auto_32810 ) ) ( SURFACE-AT ?auto_32809 ?auto_32806 ) ( CLEAR ?auto_32809 ) ( IS-CRATE ?auto_32812 ) ( not ( = ?auto_32809 ?auto_32812 ) ) ( not ( = ?auto_32803 ?auto_32809 ) ) ( not ( = ?auto_32804 ?auto_32809 ) ) ( not ( = ?auto_32807 ?auto_32809 ) ) ( not ( = ?auto_32810 ?auto_32809 ) ) ( AVAILABLE ?auto_32808 ) ( AVAILABLE ?auto_32813 ) ( SURFACE-AT ?auto_32812 ?auto_32805 ) ( ON ?auto_32812 ?auto_32814 ) ( CLEAR ?auto_32812 ) ( not ( = ?auto_32803 ?auto_32814 ) ) ( not ( = ?auto_32804 ?auto_32814 ) ) ( not ( = ?auto_32812 ?auto_32814 ) ) ( not ( = ?auto_32807 ?auto_32814 ) ) ( not ( = ?auto_32810 ?auto_32814 ) ) ( not ( = ?auto_32809 ?auto_32814 ) ) ( TRUCK-AT ?auto_32811 ?auto_32806 ) )
    :subtasks
    ( ( !DRIVE ?auto_32811 ?auto_32806 ?auto_32805 )
      ( MAKE-2CRATE ?auto_32812 ?auto_32803 ?auto_32804 )
      ( MAKE-1CRATE-VERIFY ?auto_32803 ?auto_32804 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32815 - SURFACE
      ?auto_32816 - SURFACE
      ?auto_32817 - SURFACE
    )
    :vars
    (
      ?auto_32820 - HOIST
      ?auto_32818 - PLACE
      ?auto_32824 - PLACE
      ?auto_32823 - HOIST
      ?auto_32819 - SURFACE
      ?auto_32826 - SURFACE
      ?auto_32821 - SURFACE
      ?auto_32825 - SURFACE
      ?auto_32822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32820 ?auto_32818 ) ( IS-CRATE ?auto_32817 ) ( not ( = ?auto_32816 ?auto_32817 ) ) ( not ( = ?auto_32815 ?auto_32816 ) ) ( not ( = ?auto_32815 ?auto_32817 ) ) ( not ( = ?auto_32824 ?auto_32818 ) ) ( HOIST-AT ?auto_32823 ?auto_32824 ) ( not ( = ?auto_32820 ?auto_32823 ) ) ( SURFACE-AT ?auto_32817 ?auto_32824 ) ( ON ?auto_32817 ?auto_32819 ) ( CLEAR ?auto_32817 ) ( not ( = ?auto_32816 ?auto_32819 ) ) ( not ( = ?auto_32817 ?auto_32819 ) ) ( not ( = ?auto_32815 ?auto_32819 ) ) ( IS-CRATE ?auto_32816 ) ( SURFACE-AT ?auto_32816 ?auto_32824 ) ( ON ?auto_32816 ?auto_32826 ) ( CLEAR ?auto_32816 ) ( not ( = ?auto_32816 ?auto_32826 ) ) ( not ( = ?auto_32817 ?auto_32826 ) ) ( not ( = ?auto_32815 ?auto_32826 ) ) ( not ( = ?auto_32819 ?auto_32826 ) ) ( SURFACE-AT ?auto_32821 ?auto_32818 ) ( CLEAR ?auto_32821 ) ( IS-CRATE ?auto_32815 ) ( not ( = ?auto_32821 ?auto_32815 ) ) ( not ( = ?auto_32816 ?auto_32821 ) ) ( not ( = ?auto_32817 ?auto_32821 ) ) ( not ( = ?auto_32819 ?auto_32821 ) ) ( not ( = ?auto_32826 ?auto_32821 ) ) ( AVAILABLE ?auto_32820 ) ( AVAILABLE ?auto_32823 ) ( SURFACE-AT ?auto_32815 ?auto_32824 ) ( ON ?auto_32815 ?auto_32825 ) ( CLEAR ?auto_32815 ) ( not ( = ?auto_32816 ?auto_32825 ) ) ( not ( = ?auto_32817 ?auto_32825 ) ) ( not ( = ?auto_32815 ?auto_32825 ) ) ( not ( = ?auto_32819 ?auto_32825 ) ) ( not ( = ?auto_32826 ?auto_32825 ) ) ( not ( = ?auto_32821 ?auto_32825 ) ) ( TRUCK-AT ?auto_32822 ?auto_32818 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32816 ?auto_32817 )
      ( MAKE-2CRATE-VERIFY ?auto_32815 ?auto_32816 ?auto_32817 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32827 - SURFACE
      ?auto_32828 - SURFACE
      ?auto_32829 - SURFACE
      ?auto_32830 - SURFACE
    )
    :vars
    (
      ?auto_32838 - HOIST
      ?auto_32834 - PLACE
      ?auto_32833 - PLACE
      ?auto_32837 - HOIST
      ?auto_32835 - SURFACE
      ?auto_32832 - SURFACE
      ?auto_32831 - SURFACE
      ?auto_32836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32838 ?auto_32834 ) ( IS-CRATE ?auto_32830 ) ( not ( = ?auto_32829 ?auto_32830 ) ) ( not ( = ?auto_32828 ?auto_32829 ) ) ( not ( = ?auto_32828 ?auto_32830 ) ) ( not ( = ?auto_32833 ?auto_32834 ) ) ( HOIST-AT ?auto_32837 ?auto_32833 ) ( not ( = ?auto_32838 ?auto_32837 ) ) ( SURFACE-AT ?auto_32830 ?auto_32833 ) ( ON ?auto_32830 ?auto_32835 ) ( CLEAR ?auto_32830 ) ( not ( = ?auto_32829 ?auto_32835 ) ) ( not ( = ?auto_32830 ?auto_32835 ) ) ( not ( = ?auto_32828 ?auto_32835 ) ) ( IS-CRATE ?auto_32829 ) ( SURFACE-AT ?auto_32829 ?auto_32833 ) ( ON ?auto_32829 ?auto_32832 ) ( CLEAR ?auto_32829 ) ( not ( = ?auto_32829 ?auto_32832 ) ) ( not ( = ?auto_32830 ?auto_32832 ) ) ( not ( = ?auto_32828 ?auto_32832 ) ) ( not ( = ?auto_32835 ?auto_32832 ) ) ( SURFACE-AT ?auto_32827 ?auto_32834 ) ( CLEAR ?auto_32827 ) ( IS-CRATE ?auto_32828 ) ( not ( = ?auto_32827 ?auto_32828 ) ) ( not ( = ?auto_32829 ?auto_32827 ) ) ( not ( = ?auto_32830 ?auto_32827 ) ) ( not ( = ?auto_32835 ?auto_32827 ) ) ( not ( = ?auto_32832 ?auto_32827 ) ) ( AVAILABLE ?auto_32838 ) ( AVAILABLE ?auto_32837 ) ( SURFACE-AT ?auto_32828 ?auto_32833 ) ( ON ?auto_32828 ?auto_32831 ) ( CLEAR ?auto_32828 ) ( not ( = ?auto_32829 ?auto_32831 ) ) ( not ( = ?auto_32830 ?auto_32831 ) ) ( not ( = ?auto_32828 ?auto_32831 ) ) ( not ( = ?auto_32835 ?auto_32831 ) ) ( not ( = ?auto_32832 ?auto_32831 ) ) ( not ( = ?auto_32827 ?auto_32831 ) ) ( TRUCK-AT ?auto_32836 ?auto_32834 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32828 ?auto_32829 ?auto_32830 )
      ( MAKE-3CRATE-VERIFY ?auto_32827 ?auto_32828 ?auto_32829 ?auto_32830 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32853 - SURFACE
      ?auto_32854 - SURFACE
    )
    :vars
    (
      ?auto_32855 - HOIST
      ?auto_32856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32855 ?auto_32856 ) ( SURFACE-AT ?auto_32853 ?auto_32856 ) ( CLEAR ?auto_32853 ) ( LIFTING ?auto_32855 ?auto_32854 ) ( IS-CRATE ?auto_32854 ) ( not ( = ?auto_32853 ?auto_32854 ) ) )
    :subtasks
    ( ( !DROP ?auto_32855 ?auto_32854 ?auto_32853 ?auto_32856 )
      ( MAKE-1CRATE-VERIFY ?auto_32853 ?auto_32854 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32857 - SURFACE
      ?auto_32858 - SURFACE
      ?auto_32859 - SURFACE
    )
    :vars
    (
      ?auto_32860 - HOIST
      ?auto_32861 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32860 ?auto_32861 ) ( SURFACE-AT ?auto_32858 ?auto_32861 ) ( CLEAR ?auto_32858 ) ( LIFTING ?auto_32860 ?auto_32859 ) ( IS-CRATE ?auto_32859 ) ( not ( = ?auto_32858 ?auto_32859 ) ) ( ON ?auto_32858 ?auto_32857 ) ( not ( = ?auto_32857 ?auto_32858 ) ) ( not ( = ?auto_32857 ?auto_32859 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32858 ?auto_32859 )
      ( MAKE-2CRATE-VERIFY ?auto_32857 ?auto_32858 ?auto_32859 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32862 - SURFACE
      ?auto_32863 - SURFACE
      ?auto_32864 - SURFACE
      ?auto_32865 - SURFACE
    )
    :vars
    (
      ?auto_32866 - HOIST
      ?auto_32867 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32866 ?auto_32867 ) ( SURFACE-AT ?auto_32864 ?auto_32867 ) ( CLEAR ?auto_32864 ) ( LIFTING ?auto_32866 ?auto_32865 ) ( IS-CRATE ?auto_32865 ) ( not ( = ?auto_32864 ?auto_32865 ) ) ( ON ?auto_32863 ?auto_32862 ) ( ON ?auto_32864 ?auto_32863 ) ( not ( = ?auto_32862 ?auto_32863 ) ) ( not ( = ?auto_32862 ?auto_32864 ) ) ( not ( = ?auto_32862 ?auto_32865 ) ) ( not ( = ?auto_32863 ?auto_32864 ) ) ( not ( = ?auto_32863 ?auto_32865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32864 ?auto_32865 )
      ( MAKE-3CRATE-VERIFY ?auto_32862 ?auto_32863 ?auto_32864 ?auto_32865 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32868 - SURFACE
      ?auto_32869 - SURFACE
      ?auto_32870 - SURFACE
      ?auto_32871 - SURFACE
      ?auto_32872 - SURFACE
    )
    :vars
    (
      ?auto_32873 - HOIST
      ?auto_32874 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32873 ?auto_32874 ) ( SURFACE-AT ?auto_32871 ?auto_32874 ) ( CLEAR ?auto_32871 ) ( LIFTING ?auto_32873 ?auto_32872 ) ( IS-CRATE ?auto_32872 ) ( not ( = ?auto_32871 ?auto_32872 ) ) ( ON ?auto_32869 ?auto_32868 ) ( ON ?auto_32870 ?auto_32869 ) ( ON ?auto_32871 ?auto_32870 ) ( not ( = ?auto_32868 ?auto_32869 ) ) ( not ( = ?auto_32868 ?auto_32870 ) ) ( not ( = ?auto_32868 ?auto_32871 ) ) ( not ( = ?auto_32868 ?auto_32872 ) ) ( not ( = ?auto_32869 ?auto_32870 ) ) ( not ( = ?auto_32869 ?auto_32871 ) ) ( not ( = ?auto_32869 ?auto_32872 ) ) ( not ( = ?auto_32870 ?auto_32871 ) ) ( not ( = ?auto_32870 ?auto_32872 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32871 ?auto_32872 )
      ( MAKE-4CRATE-VERIFY ?auto_32868 ?auto_32869 ?auto_32870 ?auto_32871 ?auto_32872 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32875 - SURFACE
      ?auto_32876 - SURFACE
    )
    :vars
    (
      ?auto_32877 - HOIST
      ?auto_32878 - PLACE
      ?auto_32879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32877 ?auto_32878 ) ( SURFACE-AT ?auto_32875 ?auto_32878 ) ( CLEAR ?auto_32875 ) ( IS-CRATE ?auto_32876 ) ( not ( = ?auto_32875 ?auto_32876 ) ) ( TRUCK-AT ?auto_32879 ?auto_32878 ) ( AVAILABLE ?auto_32877 ) ( IN ?auto_32876 ?auto_32879 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32877 ?auto_32876 ?auto_32879 ?auto_32878 )
      ( MAKE-1CRATE ?auto_32875 ?auto_32876 )
      ( MAKE-1CRATE-VERIFY ?auto_32875 ?auto_32876 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32880 - SURFACE
      ?auto_32881 - SURFACE
      ?auto_32882 - SURFACE
    )
    :vars
    (
      ?auto_32885 - HOIST
      ?auto_32884 - PLACE
      ?auto_32883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32885 ?auto_32884 ) ( SURFACE-AT ?auto_32881 ?auto_32884 ) ( CLEAR ?auto_32881 ) ( IS-CRATE ?auto_32882 ) ( not ( = ?auto_32881 ?auto_32882 ) ) ( TRUCK-AT ?auto_32883 ?auto_32884 ) ( AVAILABLE ?auto_32885 ) ( IN ?auto_32882 ?auto_32883 ) ( ON ?auto_32881 ?auto_32880 ) ( not ( = ?auto_32880 ?auto_32881 ) ) ( not ( = ?auto_32880 ?auto_32882 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32881 ?auto_32882 )
      ( MAKE-2CRATE-VERIFY ?auto_32880 ?auto_32881 ?auto_32882 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32886 - SURFACE
      ?auto_32887 - SURFACE
      ?auto_32888 - SURFACE
      ?auto_32889 - SURFACE
    )
    :vars
    (
      ?auto_32892 - HOIST
      ?auto_32891 - PLACE
      ?auto_32890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32892 ?auto_32891 ) ( SURFACE-AT ?auto_32888 ?auto_32891 ) ( CLEAR ?auto_32888 ) ( IS-CRATE ?auto_32889 ) ( not ( = ?auto_32888 ?auto_32889 ) ) ( TRUCK-AT ?auto_32890 ?auto_32891 ) ( AVAILABLE ?auto_32892 ) ( IN ?auto_32889 ?auto_32890 ) ( ON ?auto_32888 ?auto_32887 ) ( not ( = ?auto_32887 ?auto_32888 ) ) ( not ( = ?auto_32887 ?auto_32889 ) ) ( ON ?auto_32887 ?auto_32886 ) ( not ( = ?auto_32886 ?auto_32887 ) ) ( not ( = ?auto_32886 ?auto_32888 ) ) ( not ( = ?auto_32886 ?auto_32889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32887 ?auto_32888 ?auto_32889 )
      ( MAKE-3CRATE-VERIFY ?auto_32886 ?auto_32887 ?auto_32888 ?auto_32889 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32893 - SURFACE
      ?auto_32894 - SURFACE
      ?auto_32895 - SURFACE
      ?auto_32896 - SURFACE
      ?auto_32897 - SURFACE
    )
    :vars
    (
      ?auto_32900 - HOIST
      ?auto_32899 - PLACE
      ?auto_32898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32900 ?auto_32899 ) ( SURFACE-AT ?auto_32896 ?auto_32899 ) ( CLEAR ?auto_32896 ) ( IS-CRATE ?auto_32897 ) ( not ( = ?auto_32896 ?auto_32897 ) ) ( TRUCK-AT ?auto_32898 ?auto_32899 ) ( AVAILABLE ?auto_32900 ) ( IN ?auto_32897 ?auto_32898 ) ( ON ?auto_32896 ?auto_32895 ) ( not ( = ?auto_32895 ?auto_32896 ) ) ( not ( = ?auto_32895 ?auto_32897 ) ) ( ON ?auto_32894 ?auto_32893 ) ( ON ?auto_32895 ?auto_32894 ) ( not ( = ?auto_32893 ?auto_32894 ) ) ( not ( = ?auto_32893 ?auto_32895 ) ) ( not ( = ?auto_32893 ?auto_32896 ) ) ( not ( = ?auto_32893 ?auto_32897 ) ) ( not ( = ?auto_32894 ?auto_32895 ) ) ( not ( = ?auto_32894 ?auto_32896 ) ) ( not ( = ?auto_32894 ?auto_32897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32895 ?auto_32896 ?auto_32897 )
      ( MAKE-4CRATE-VERIFY ?auto_32893 ?auto_32894 ?auto_32895 ?auto_32896 ?auto_32897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32901 - SURFACE
      ?auto_32902 - SURFACE
    )
    :vars
    (
      ?auto_32905 - HOIST
      ?auto_32904 - PLACE
      ?auto_32903 - TRUCK
      ?auto_32906 - SURFACE
      ?auto_32907 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32905 ?auto_32904 ) ( SURFACE-AT ?auto_32901 ?auto_32904 ) ( CLEAR ?auto_32901 ) ( IS-CRATE ?auto_32902 ) ( not ( = ?auto_32901 ?auto_32902 ) ) ( AVAILABLE ?auto_32905 ) ( IN ?auto_32902 ?auto_32903 ) ( ON ?auto_32901 ?auto_32906 ) ( not ( = ?auto_32906 ?auto_32901 ) ) ( not ( = ?auto_32906 ?auto_32902 ) ) ( TRUCK-AT ?auto_32903 ?auto_32907 ) ( not ( = ?auto_32907 ?auto_32904 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32903 ?auto_32907 ?auto_32904 )
      ( MAKE-2CRATE ?auto_32906 ?auto_32901 ?auto_32902 )
      ( MAKE-1CRATE-VERIFY ?auto_32901 ?auto_32902 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32908 - SURFACE
      ?auto_32909 - SURFACE
      ?auto_32910 - SURFACE
    )
    :vars
    (
      ?auto_32912 - HOIST
      ?auto_32913 - PLACE
      ?auto_32914 - TRUCK
      ?auto_32911 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32912 ?auto_32913 ) ( SURFACE-AT ?auto_32909 ?auto_32913 ) ( CLEAR ?auto_32909 ) ( IS-CRATE ?auto_32910 ) ( not ( = ?auto_32909 ?auto_32910 ) ) ( AVAILABLE ?auto_32912 ) ( IN ?auto_32910 ?auto_32914 ) ( ON ?auto_32909 ?auto_32908 ) ( not ( = ?auto_32908 ?auto_32909 ) ) ( not ( = ?auto_32908 ?auto_32910 ) ) ( TRUCK-AT ?auto_32914 ?auto_32911 ) ( not ( = ?auto_32911 ?auto_32913 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32909 ?auto_32910 )
      ( MAKE-2CRATE-VERIFY ?auto_32908 ?auto_32909 ?auto_32910 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32915 - SURFACE
      ?auto_32916 - SURFACE
      ?auto_32917 - SURFACE
      ?auto_32918 - SURFACE
    )
    :vars
    (
      ?auto_32922 - HOIST
      ?auto_32921 - PLACE
      ?auto_32920 - TRUCK
      ?auto_32919 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32922 ?auto_32921 ) ( SURFACE-AT ?auto_32917 ?auto_32921 ) ( CLEAR ?auto_32917 ) ( IS-CRATE ?auto_32918 ) ( not ( = ?auto_32917 ?auto_32918 ) ) ( AVAILABLE ?auto_32922 ) ( IN ?auto_32918 ?auto_32920 ) ( ON ?auto_32917 ?auto_32916 ) ( not ( = ?auto_32916 ?auto_32917 ) ) ( not ( = ?auto_32916 ?auto_32918 ) ) ( TRUCK-AT ?auto_32920 ?auto_32919 ) ( not ( = ?auto_32919 ?auto_32921 ) ) ( ON ?auto_32916 ?auto_32915 ) ( not ( = ?auto_32915 ?auto_32916 ) ) ( not ( = ?auto_32915 ?auto_32917 ) ) ( not ( = ?auto_32915 ?auto_32918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32916 ?auto_32917 ?auto_32918 )
      ( MAKE-3CRATE-VERIFY ?auto_32915 ?auto_32916 ?auto_32917 ?auto_32918 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32923 - SURFACE
      ?auto_32924 - SURFACE
      ?auto_32925 - SURFACE
      ?auto_32926 - SURFACE
      ?auto_32927 - SURFACE
    )
    :vars
    (
      ?auto_32931 - HOIST
      ?auto_32930 - PLACE
      ?auto_32929 - TRUCK
      ?auto_32928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32931 ?auto_32930 ) ( SURFACE-AT ?auto_32926 ?auto_32930 ) ( CLEAR ?auto_32926 ) ( IS-CRATE ?auto_32927 ) ( not ( = ?auto_32926 ?auto_32927 ) ) ( AVAILABLE ?auto_32931 ) ( IN ?auto_32927 ?auto_32929 ) ( ON ?auto_32926 ?auto_32925 ) ( not ( = ?auto_32925 ?auto_32926 ) ) ( not ( = ?auto_32925 ?auto_32927 ) ) ( TRUCK-AT ?auto_32929 ?auto_32928 ) ( not ( = ?auto_32928 ?auto_32930 ) ) ( ON ?auto_32924 ?auto_32923 ) ( ON ?auto_32925 ?auto_32924 ) ( not ( = ?auto_32923 ?auto_32924 ) ) ( not ( = ?auto_32923 ?auto_32925 ) ) ( not ( = ?auto_32923 ?auto_32926 ) ) ( not ( = ?auto_32923 ?auto_32927 ) ) ( not ( = ?auto_32924 ?auto_32925 ) ) ( not ( = ?auto_32924 ?auto_32926 ) ) ( not ( = ?auto_32924 ?auto_32927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32925 ?auto_32926 ?auto_32927 )
      ( MAKE-4CRATE-VERIFY ?auto_32923 ?auto_32924 ?auto_32925 ?auto_32926 ?auto_32927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32932 - SURFACE
      ?auto_32933 - SURFACE
    )
    :vars
    (
      ?auto_32938 - HOIST
      ?auto_32936 - PLACE
      ?auto_32937 - SURFACE
      ?auto_32935 - TRUCK
      ?auto_32934 - PLACE
      ?auto_32939 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32938 ?auto_32936 ) ( SURFACE-AT ?auto_32932 ?auto_32936 ) ( CLEAR ?auto_32932 ) ( IS-CRATE ?auto_32933 ) ( not ( = ?auto_32932 ?auto_32933 ) ) ( AVAILABLE ?auto_32938 ) ( ON ?auto_32932 ?auto_32937 ) ( not ( = ?auto_32937 ?auto_32932 ) ) ( not ( = ?auto_32937 ?auto_32933 ) ) ( TRUCK-AT ?auto_32935 ?auto_32934 ) ( not ( = ?auto_32934 ?auto_32936 ) ) ( HOIST-AT ?auto_32939 ?auto_32934 ) ( LIFTING ?auto_32939 ?auto_32933 ) ( not ( = ?auto_32938 ?auto_32939 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32939 ?auto_32933 ?auto_32935 ?auto_32934 )
      ( MAKE-2CRATE ?auto_32937 ?auto_32932 ?auto_32933 )
      ( MAKE-1CRATE-VERIFY ?auto_32932 ?auto_32933 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32940 - SURFACE
      ?auto_32941 - SURFACE
      ?auto_32942 - SURFACE
    )
    :vars
    (
      ?auto_32944 - HOIST
      ?auto_32943 - PLACE
      ?auto_32946 - TRUCK
      ?auto_32945 - PLACE
      ?auto_32947 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32944 ?auto_32943 ) ( SURFACE-AT ?auto_32941 ?auto_32943 ) ( CLEAR ?auto_32941 ) ( IS-CRATE ?auto_32942 ) ( not ( = ?auto_32941 ?auto_32942 ) ) ( AVAILABLE ?auto_32944 ) ( ON ?auto_32941 ?auto_32940 ) ( not ( = ?auto_32940 ?auto_32941 ) ) ( not ( = ?auto_32940 ?auto_32942 ) ) ( TRUCK-AT ?auto_32946 ?auto_32945 ) ( not ( = ?auto_32945 ?auto_32943 ) ) ( HOIST-AT ?auto_32947 ?auto_32945 ) ( LIFTING ?auto_32947 ?auto_32942 ) ( not ( = ?auto_32944 ?auto_32947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32941 ?auto_32942 )
      ( MAKE-2CRATE-VERIFY ?auto_32940 ?auto_32941 ?auto_32942 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32948 - SURFACE
      ?auto_32949 - SURFACE
      ?auto_32950 - SURFACE
      ?auto_32951 - SURFACE
    )
    :vars
    (
      ?auto_32956 - HOIST
      ?auto_32953 - PLACE
      ?auto_32955 - TRUCK
      ?auto_32952 - PLACE
      ?auto_32954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32956 ?auto_32953 ) ( SURFACE-AT ?auto_32950 ?auto_32953 ) ( CLEAR ?auto_32950 ) ( IS-CRATE ?auto_32951 ) ( not ( = ?auto_32950 ?auto_32951 ) ) ( AVAILABLE ?auto_32956 ) ( ON ?auto_32950 ?auto_32949 ) ( not ( = ?auto_32949 ?auto_32950 ) ) ( not ( = ?auto_32949 ?auto_32951 ) ) ( TRUCK-AT ?auto_32955 ?auto_32952 ) ( not ( = ?auto_32952 ?auto_32953 ) ) ( HOIST-AT ?auto_32954 ?auto_32952 ) ( LIFTING ?auto_32954 ?auto_32951 ) ( not ( = ?auto_32956 ?auto_32954 ) ) ( ON ?auto_32949 ?auto_32948 ) ( not ( = ?auto_32948 ?auto_32949 ) ) ( not ( = ?auto_32948 ?auto_32950 ) ) ( not ( = ?auto_32948 ?auto_32951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32949 ?auto_32950 ?auto_32951 )
      ( MAKE-3CRATE-VERIFY ?auto_32948 ?auto_32949 ?auto_32950 ?auto_32951 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32957 - SURFACE
      ?auto_32958 - SURFACE
      ?auto_32959 - SURFACE
      ?auto_32960 - SURFACE
      ?auto_32961 - SURFACE
    )
    :vars
    (
      ?auto_32966 - HOIST
      ?auto_32963 - PLACE
      ?auto_32965 - TRUCK
      ?auto_32962 - PLACE
      ?auto_32964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32966 ?auto_32963 ) ( SURFACE-AT ?auto_32960 ?auto_32963 ) ( CLEAR ?auto_32960 ) ( IS-CRATE ?auto_32961 ) ( not ( = ?auto_32960 ?auto_32961 ) ) ( AVAILABLE ?auto_32966 ) ( ON ?auto_32960 ?auto_32959 ) ( not ( = ?auto_32959 ?auto_32960 ) ) ( not ( = ?auto_32959 ?auto_32961 ) ) ( TRUCK-AT ?auto_32965 ?auto_32962 ) ( not ( = ?auto_32962 ?auto_32963 ) ) ( HOIST-AT ?auto_32964 ?auto_32962 ) ( LIFTING ?auto_32964 ?auto_32961 ) ( not ( = ?auto_32966 ?auto_32964 ) ) ( ON ?auto_32958 ?auto_32957 ) ( ON ?auto_32959 ?auto_32958 ) ( not ( = ?auto_32957 ?auto_32958 ) ) ( not ( = ?auto_32957 ?auto_32959 ) ) ( not ( = ?auto_32957 ?auto_32960 ) ) ( not ( = ?auto_32957 ?auto_32961 ) ) ( not ( = ?auto_32958 ?auto_32959 ) ) ( not ( = ?auto_32958 ?auto_32960 ) ) ( not ( = ?auto_32958 ?auto_32961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32959 ?auto_32960 ?auto_32961 )
      ( MAKE-4CRATE-VERIFY ?auto_32957 ?auto_32958 ?auto_32959 ?auto_32960 ?auto_32961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32967 - SURFACE
      ?auto_32968 - SURFACE
    )
    :vars
    (
      ?auto_32974 - HOIST
      ?auto_32970 - PLACE
      ?auto_32972 - SURFACE
      ?auto_32973 - TRUCK
      ?auto_32969 - PLACE
      ?auto_32971 - HOIST
      ?auto_32975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32974 ?auto_32970 ) ( SURFACE-AT ?auto_32967 ?auto_32970 ) ( CLEAR ?auto_32967 ) ( IS-CRATE ?auto_32968 ) ( not ( = ?auto_32967 ?auto_32968 ) ) ( AVAILABLE ?auto_32974 ) ( ON ?auto_32967 ?auto_32972 ) ( not ( = ?auto_32972 ?auto_32967 ) ) ( not ( = ?auto_32972 ?auto_32968 ) ) ( TRUCK-AT ?auto_32973 ?auto_32969 ) ( not ( = ?auto_32969 ?auto_32970 ) ) ( HOIST-AT ?auto_32971 ?auto_32969 ) ( not ( = ?auto_32974 ?auto_32971 ) ) ( AVAILABLE ?auto_32971 ) ( SURFACE-AT ?auto_32968 ?auto_32969 ) ( ON ?auto_32968 ?auto_32975 ) ( CLEAR ?auto_32968 ) ( not ( = ?auto_32967 ?auto_32975 ) ) ( not ( = ?auto_32968 ?auto_32975 ) ) ( not ( = ?auto_32972 ?auto_32975 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32971 ?auto_32968 ?auto_32975 ?auto_32969 )
      ( MAKE-2CRATE ?auto_32972 ?auto_32967 ?auto_32968 )
      ( MAKE-1CRATE-VERIFY ?auto_32967 ?auto_32968 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32976 - SURFACE
      ?auto_32977 - SURFACE
      ?auto_32978 - SURFACE
    )
    :vars
    (
      ?auto_32980 - HOIST
      ?auto_32979 - PLACE
      ?auto_32984 - TRUCK
      ?auto_32981 - PLACE
      ?auto_32982 - HOIST
      ?auto_32983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32980 ?auto_32979 ) ( SURFACE-AT ?auto_32977 ?auto_32979 ) ( CLEAR ?auto_32977 ) ( IS-CRATE ?auto_32978 ) ( not ( = ?auto_32977 ?auto_32978 ) ) ( AVAILABLE ?auto_32980 ) ( ON ?auto_32977 ?auto_32976 ) ( not ( = ?auto_32976 ?auto_32977 ) ) ( not ( = ?auto_32976 ?auto_32978 ) ) ( TRUCK-AT ?auto_32984 ?auto_32981 ) ( not ( = ?auto_32981 ?auto_32979 ) ) ( HOIST-AT ?auto_32982 ?auto_32981 ) ( not ( = ?auto_32980 ?auto_32982 ) ) ( AVAILABLE ?auto_32982 ) ( SURFACE-AT ?auto_32978 ?auto_32981 ) ( ON ?auto_32978 ?auto_32983 ) ( CLEAR ?auto_32978 ) ( not ( = ?auto_32977 ?auto_32983 ) ) ( not ( = ?auto_32978 ?auto_32983 ) ) ( not ( = ?auto_32976 ?auto_32983 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32977 ?auto_32978 )
      ( MAKE-2CRATE-VERIFY ?auto_32976 ?auto_32977 ?auto_32978 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32985 - SURFACE
      ?auto_32986 - SURFACE
      ?auto_32987 - SURFACE
      ?auto_32988 - SURFACE
    )
    :vars
    (
      ?auto_32994 - HOIST
      ?auto_32989 - PLACE
      ?auto_32992 - TRUCK
      ?auto_32993 - PLACE
      ?auto_32991 - HOIST
      ?auto_32990 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32994 ?auto_32989 ) ( SURFACE-AT ?auto_32987 ?auto_32989 ) ( CLEAR ?auto_32987 ) ( IS-CRATE ?auto_32988 ) ( not ( = ?auto_32987 ?auto_32988 ) ) ( AVAILABLE ?auto_32994 ) ( ON ?auto_32987 ?auto_32986 ) ( not ( = ?auto_32986 ?auto_32987 ) ) ( not ( = ?auto_32986 ?auto_32988 ) ) ( TRUCK-AT ?auto_32992 ?auto_32993 ) ( not ( = ?auto_32993 ?auto_32989 ) ) ( HOIST-AT ?auto_32991 ?auto_32993 ) ( not ( = ?auto_32994 ?auto_32991 ) ) ( AVAILABLE ?auto_32991 ) ( SURFACE-AT ?auto_32988 ?auto_32993 ) ( ON ?auto_32988 ?auto_32990 ) ( CLEAR ?auto_32988 ) ( not ( = ?auto_32987 ?auto_32990 ) ) ( not ( = ?auto_32988 ?auto_32990 ) ) ( not ( = ?auto_32986 ?auto_32990 ) ) ( ON ?auto_32986 ?auto_32985 ) ( not ( = ?auto_32985 ?auto_32986 ) ) ( not ( = ?auto_32985 ?auto_32987 ) ) ( not ( = ?auto_32985 ?auto_32988 ) ) ( not ( = ?auto_32985 ?auto_32990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32986 ?auto_32987 ?auto_32988 )
      ( MAKE-3CRATE-VERIFY ?auto_32985 ?auto_32986 ?auto_32987 ?auto_32988 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_32995 - SURFACE
      ?auto_32996 - SURFACE
      ?auto_32997 - SURFACE
      ?auto_32998 - SURFACE
      ?auto_32999 - SURFACE
    )
    :vars
    (
      ?auto_33005 - HOIST
      ?auto_33000 - PLACE
      ?auto_33003 - TRUCK
      ?auto_33004 - PLACE
      ?auto_33002 - HOIST
      ?auto_33001 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33005 ?auto_33000 ) ( SURFACE-AT ?auto_32998 ?auto_33000 ) ( CLEAR ?auto_32998 ) ( IS-CRATE ?auto_32999 ) ( not ( = ?auto_32998 ?auto_32999 ) ) ( AVAILABLE ?auto_33005 ) ( ON ?auto_32998 ?auto_32997 ) ( not ( = ?auto_32997 ?auto_32998 ) ) ( not ( = ?auto_32997 ?auto_32999 ) ) ( TRUCK-AT ?auto_33003 ?auto_33004 ) ( not ( = ?auto_33004 ?auto_33000 ) ) ( HOIST-AT ?auto_33002 ?auto_33004 ) ( not ( = ?auto_33005 ?auto_33002 ) ) ( AVAILABLE ?auto_33002 ) ( SURFACE-AT ?auto_32999 ?auto_33004 ) ( ON ?auto_32999 ?auto_33001 ) ( CLEAR ?auto_32999 ) ( not ( = ?auto_32998 ?auto_33001 ) ) ( not ( = ?auto_32999 ?auto_33001 ) ) ( not ( = ?auto_32997 ?auto_33001 ) ) ( ON ?auto_32996 ?auto_32995 ) ( ON ?auto_32997 ?auto_32996 ) ( not ( = ?auto_32995 ?auto_32996 ) ) ( not ( = ?auto_32995 ?auto_32997 ) ) ( not ( = ?auto_32995 ?auto_32998 ) ) ( not ( = ?auto_32995 ?auto_32999 ) ) ( not ( = ?auto_32995 ?auto_33001 ) ) ( not ( = ?auto_32996 ?auto_32997 ) ) ( not ( = ?auto_32996 ?auto_32998 ) ) ( not ( = ?auto_32996 ?auto_32999 ) ) ( not ( = ?auto_32996 ?auto_33001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32997 ?auto_32998 ?auto_32999 )
      ( MAKE-4CRATE-VERIFY ?auto_32995 ?auto_32996 ?auto_32997 ?auto_32998 ?auto_32999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33006 - SURFACE
      ?auto_33007 - SURFACE
    )
    :vars
    (
      ?auto_33014 - HOIST
      ?auto_33009 - PLACE
      ?auto_33008 - SURFACE
      ?auto_33013 - PLACE
      ?auto_33011 - HOIST
      ?auto_33010 - SURFACE
      ?auto_33012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33014 ?auto_33009 ) ( SURFACE-AT ?auto_33006 ?auto_33009 ) ( CLEAR ?auto_33006 ) ( IS-CRATE ?auto_33007 ) ( not ( = ?auto_33006 ?auto_33007 ) ) ( AVAILABLE ?auto_33014 ) ( ON ?auto_33006 ?auto_33008 ) ( not ( = ?auto_33008 ?auto_33006 ) ) ( not ( = ?auto_33008 ?auto_33007 ) ) ( not ( = ?auto_33013 ?auto_33009 ) ) ( HOIST-AT ?auto_33011 ?auto_33013 ) ( not ( = ?auto_33014 ?auto_33011 ) ) ( AVAILABLE ?auto_33011 ) ( SURFACE-AT ?auto_33007 ?auto_33013 ) ( ON ?auto_33007 ?auto_33010 ) ( CLEAR ?auto_33007 ) ( not ( = ?auto_33006 ?auto_33010 ) ) ( not ( = ?auto_33007 ?auto_33010 ) ) ( not ( = ?auto_33008 ?auto_33010 ) ) ( TRUCK-AT ?auto_33012 ?auto_33009 ) )
    :subtasks
    ( ( !DRIVE ?auto_33012 ?auto_33009 ?auto_33013 )
      ( MAKE-2CRATE ?auto_33008 ?auto_33006 ?auto_33007 )
      ( MAKE-1CRATE-VERIFY ?auto_33006 ?auto_33007 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33015 - SURFACE
      ?auto_33016 - SURFACE
      ?auto_33017 - SURFACE
    )
    :vars
    (
      ?auto_33021 - HOIST
      ?auto_33018 - PLACE
      ?auto_33022 - PLACE
      ?auto_33019 - HOIST
      ?auto_33023 - SURFACE
      ?auto_33020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33021 ?auto_33018 ) ( SURFACE-AT ?auto_33016 ?auto_33018 ) ( CLEAR ?auto_33016 ) ( IS-CRATE ?auto_33017 ) ( not ( = ?auto_33016 ?auto_33017 ) ) ( AVAILABLE ?auto_33021 ) ( ON ?auto_33016 ?auto_33015 ) ( not ( = ?auto_33015 ?auto_33016 ) ) ( not ( = ?auto_33015 ?auto_33017 ) ) ( not ( = ?auto_33022 ?auto_33018 ) ) ( HOIST-AT ?auto_33019 ?auto_33022 ) ( not ( = ?auto_33021 ?auto_33019 ) ) ( AVAILABLE ?auto_33019 ) ( SURFACE-AT ?auto_33017 ?auto_33022 ) ( ON ?auto_33017 ?auto_33023 ) ( CLEAR ?auto_33017 ) ( not ( = ?auto_33016 ?auto_33023 ) ) ( not ( = ?auto_33017 ?auto_33023 ) ) ( not ( = ?auto_33015 ?auto_33023 ) ) ( TRUCK-AT ?auto_33020 ?auto_33018 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33016 ?auto_33017 )
      ( MAKE-2CRATE-VERIFY ?auto_33015 ?auto_33016 ?auto_33017 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33024 - SURFACE
      ?auto_33025 - SURFACE
      ?auto_33026 - SURFACE
      ?auto_33027 - SURFACE
    )
    :vars
    (
      ?auto_33032 - HOIST
      ?auto_33028 - PLACE
      ?auto_33030 - PLACE
      ?auto_33033 - HOIST
      ?auto_33031 - SURFACE
      ?auto_33029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33032 ?auto_33028 ) ( SURFACE-AT ?auto_33026 ?auto_33028 ) ( CLEAR ?auto_33026 ) ( IS-CRATE ?auto_33027 ) ( not ( = ?auto_33026 ?auto_33027 ) ) ( AVAILABLE ?auto_33032 ) ( ON ?auto_33026 ?auto_33025 ) ( not ( = ?auto_33025 ?auto_33026 ) ) ( not ( = ?auto_33025 ?auto_33027 ) ) ( not ( = ?auto_33030 ?auto_33028 ) ) ( HOIST-AT ?auto_33033 ?auto_33030 ) ( not ( = ?auto_33032 ?auto_33033 ) ) ( AVAILABLE ?auto_33033 ) ( SURFACE-AT ?auto_33027 ?auto_33030 ) ( ON ?auto_33027 ?auto_33031 ) ( CLEAR ?auto_33027 ) ( not ( = ?auto_33026 ?auto_33031 ) ) ( not ( = ?auto_33027 ?auto_33031 ) ) ( not ( = ?auto_33025 ?auto_33031 ) ) ( TRUCK-AT ?auto_33029 ?auto_33028 ) ( ON ?auto_33025 ?auto_33024 ) ( not ( = ?auto_33024 ?auto_33025 ) ) ( not ( = ?auto_33024 ?auto_33026 ) ) ( not ( = ?auto_33024 ?auto_33027 ) ) ( not ( = ?auto_33024 ?auto_33031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33025 ?auto_33026 ?auto_33027 )
      ( MAKE-3CRATE-VERIFY ?auto_33024 ?auto_33025 ?auto_33026 ?auto_33027 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33034 - SURFACE
      ?auto_33035 - SURFACE
      ?auto_33036 - SURFACE
      ?auto_33037 - SURFACE
      ?auto_33038 - SURFACE
    )
    :vars
    (
      ?auto_33043 - HOIST
      ?auto_33039 - PLACE
      ?auto_33041 - PLACE
      ?auto_33044 - HOIST
      ?auto_33042 - SURFACE
      ?auto_33040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33043 ?auto_33039 ) ( SURFACE-AT ?auto_33037 ?auto_33039 ) ( CLEAR ?auto_33037 ) ( IS-CRATE ?auto_33038 ) ( not ( = ?auto_33037 ?auto_33038 ) ) ( AVAILABLE ?auto_33043 ) ( ON ?auto_33037 ?auto_33036 ) ( not ( = ?auto_33036 ?auto_33037 ) ) ( not ( = ?auto_33036 ?auto_33038 ) ) ( not ( = ?auto_33041 ?auto_33039 ) ) ( HOIST-AT ?auto_33044 ?auto_33041 ) ( not ( = ?auto_33043 ?auto_33044 ) ) ( AVAILABLE ?auto_33044 ) ( SURFACE-AT ?auto_33038 ?auto_33041 ) ( ON ?auto_33038 ?auto_33042 ) ( CLEAR ?auto_33038 ) ( not ( = ?auto_33037 ?auto_33042 ) ) ( not ( = ?auto_33038 ?auto_33042 ) ) ( not ( = ?auto_33036 ?auto_33042 ) ) ( TRUCK-AT ?auto_33040 ?auto_33039 ) ( ON ?auto_33035 ?auto_33034 ) ( ON ?auto_33036 ?auto_33035 ) ( not ( = ?auto_33034 ?auto_33035 ) ) ( not ( = ?auto_33034 ?auto_33036 ) ) ( not ( = ?auto_33034 ?auto_33037 ) ) ( not ( = ?auto_33034 ?auto_33038 ) ) ( not ( = ?auto_33034 ?auto_33042 ) ) ( not ( = ?auto_33035 ?auto_33036 ) ) ( not ( = ?auto_33035 ?auto_33037 ) ) ( not ( = ?auto_33035 ?auto_33038 ) ) ( not ( = ?auto_33035 ?auto_33042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33036 ?auto_33037 ?auto_33038 )
      ( MAKE-4CRATE-VERIFY ?auto_33034 ?auto_33035 ?auto_33036 ?auto_33037 ?auto_33038 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33045 - SURFACE
      ?auto_33046 - SURFACE
    )
    :vars
    (
      ?auto_33052 - HOIST
      ?auto_33047 - PLACE
      ?auto_33050 - SURFACE
      ?auto_33049 - PLACE
      ?auto_33053 - HOIST
      ?auto_33051 - SURFACE
      ?auto_33048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33052 ?auto_33047 ) ( IS-CRATE ?auto_33046 ) ( not ( = ?auto_33045 ?auto_33046 ) ) ( not ( = ?auto_33050 ?auto_33045 ) ) ( not ( = ?auto_33050 ?auto_33046 ) ) ( not ( = ?auto_33049 ?auto_33047 ) ) ( HOIST-AT ?auto_33053 ?auto_33049 ) ( not ( = ?auto_33052 ?auto_33053 ) ) ( AVAILABLE ?auto_33053 ) ( SURFACE-AT ?auto_33046 ?auto_33049 ) ( ON ?auto_33046 ?auto_33051 ) ( CLEAR ?auto_33046 ) ( not ( = ?auto_33045 ?auto_33051 ) ) ( not ( = ?auto_33046 ?auto_33051 ) ) ( not ( = ?auto_33050 ?auto_33051 ) ) ( TRUCK-AT ?auto_33048 ?auto_33047 ) ( SURFACE-AT ?auto_33050 ?auto_33047 ) ( CLEAR ?auto_33050 ) ( LIFTING ?auto_33052 ?auto_33045 ) ( IS-CRATE ?auto_33045 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33050 ?auto_33045 )
      ( MAKE-2CRATE ?auto_33050 ?auto_33045 ?auto_33046 )
      ( MAKE-1CRATE-VERIFY ?auto_33045 ?auto_33046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33054 - SURFACE
      ?auto_33055 - SURFACE
      ?auto_33056 - SURFACE
    )
    :vars
    (
      ?auto_33062 - HOIST
      ?auto_33057 - PLACE
      ?auto_33058 - PLACE
      ?auto_33061 - HOIST
      ?auto_33059 - SURFACE
      ?auto_33060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33062 ?auto_33057 ) ( IS-CRATE ?auto_33056 ) ( not ( = ?auto_33055 ?auto_33056 ) ) ( not ( = ?auto_33054 ?auto_33055 ) ) ( not ( = ?auto_33054 ?auto_33056 ) ) ( not ( = ?auto_33058 ?auto_33057 ) ) ( HOIST-AT ?auto_33061 ?auto_33058 ) ( not ( = ?auto_33062 ?auto_33061 ) ) ( AVAILABLE ?auto_33061 ) ( SURFACE-AT ?auto_33056 ?auto_33058 ) ( ON ?auto_33056 ?auto_33059 ) ( CLEAR ?auto_33056 ) ( not ( = ?auto_33055 ?auto_33059 ) ) ( not ( = ?auto_33056 ?auto_33059 ) ) ( not ( = ?auto_33054 ?auto_33059 ) ) ( TRUCK-AT ?auto_33060 ?auto_33057 ) ( SURFACE-AT ?auto_33054 ?auto_33057 ) ( CLEAR ?auto_33054 ) ( LIFTING ?auto_33062 ?auto_33055 ) ( IS-CRATE ?auto_33055 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33055 ?auto_33056 )
      ( MAKE-2CRATE-VERIFY ?auto_33054 ?auto_33055 ?auto_33056 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33063 - SURFACE
      ?auto_33064 - SURFACE
      ?auto_33065 - SURFACE
      ?auto_33066 - SURFACE
    )
    :vars
    (
      ?auto_33071 - HOIST
      ?auto_33072 - PLACE
      ?auto_33067 - PLACE
      ?auto_33070 - HOIST
      ?auto_33068 - SURFACE
      ?auto_33069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33071 ?auto_33072 ) ( IS-CRATE ?auto_33066 ) ( not ( = ?auto_33065 ?auto_33066 ) ) ( not ( = ?auto_33064 ?auto_33065 ) ) ( not ( = ?auto_33064 ?auto_33066 ) ) ( not ( = ?auto_33067 ?auto_33072 ) ) ( HOIST-AT ?auto_33070 ?auto_33067 ) ( not ( = ?auto_33071 ?auto_33070 ) ) ( AVAILABLE ?auto_33070 ) ( SURFACE-AT ?auto_33066 ?auto_33067 ) ( ON ?auto_33066 ?auto_33068 ) ( CLEAR ?auto_33066 ) ( not ( = ?auto_33065 ?auto_33068 ) ) ( not ( = ?auto_33066 ?auto_33068 ) ) ( not ( = ?auto_33064 ?auto_33068 ) ) ( TRUCK-AT ?auto_33069 ?auto_33072 ) ( SURFACE-AT ?auto_33064 ?auto_33072 ) ( CLEAR ?auto_33064 ) ( LIFTING ?auto_33071 ?auto_33065 ) ( IS-CRATE ?auto_33065 ) ( ON ?auto_33064 ?auto_33063 ) ( not ( = ?auto_33063 ?auto_33064 ) ) ( not ( = ?auto_33063 ?auto_33065 ) ) ( not ( = ?auto_33063 ?auto_33066 ) ) ( not ( = ?auto_33063 ?auto_33068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33064 ?auto_33065 ?auto_33066 )
      ( MAKE-3CRATE-VERIFY ?auto_33063 ?auto_33064 ?auto_33065 ?auto_33066 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33073 - SURFACE
      ?auto_33074 - SURFACE
      ?auto_33075 - SURFACE
      ?auto_33076 - SURFACE
      ?auto_33077 - SURFACE
    )
    :vars
    (
      ?auto_33082 - HOIST
      ?auto_33083 - PLACE
      ?auto_33078 - PLACE
      ?auto_33081 - HOIST
      ?auto_33079 - SURFACE
      ?auto_33080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33082 ?auto_33083 ) ( IS-CRATE ?auto_33077 ) ( not ( = ?auto_33076 ?auto_33077 ) ) ( not ( = ?auto_33075 ?auto_33076 ) ) ( not ( = ?auto_33075 ?auto_33077 ) ) ( not ( = ?auto_33078 ?auto_33083 ) ) ( HOIST-AT ?auto_33081 ?auto_33078 ) ( not ( = ?auto_33082 ?auto_33081 ) ) ( AVAILABLE ?auto_33081 ) ( SURFACE-AT ?auto_33077 ?auto_33078 ) ( ON ?auto_33077 ?auto_33079 ) ( CLEAR ?auto_33077 ) ( not ( = ?auto_33076 ?auto_33079 ) ) ( not ( = ?auto_33077 ?auto_33079 ) ) ( not ( = ?auto_33075 ?auto_33079 ) ) ( TRUCK-AT ?auto_33080 ?auto_33083 ) ( SURFACE-AT ?auto_33075 ?auto_33083 ) ( CLEAR ?auto_33075 ) ( LIFTING ?auto_33082 ?auto_33076 ) ( IS-CRATE ?auto_33076 ) ( ON ?auto_33074 ?auto_33073 ) ( ON ?auto_33075 ?auto_33074 ) ( not ( = ?auto_33073 ?auto_33074 ) ) ( not ( = ?auto_33073 ?auto_33075 ) ) ( not ( = ?auto_33073 ?auto_33076 ) ) ( not ( = ?auto_33073 ?auto_33077 ) ) ( not ( = ?auto_33073 ?auto_33079 ) ) ( not ( = ?auto_33074 ?auto_33075 ) ) ( not ( = ?auto_33074 ?auto_33076 ) ) ( not ( = ?auto_33074 ?auto_33077 ) ) ( not ( = ?auto_33074 ?auto_33079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33075 ?auto_33076 ?auto_33077 )
      ( MAKE-4CRATE-VERIFY ?auto_33073 ?auto_33074 ?auto_33075 ?auto_33076 ?auto_33077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33084 - SURFACE
      ?auto_33085 - SURFACE
    )
    :vars
    (
      ?auto_33090 - HOIST
      ?auto_33092 - PLACE
      ?auto_33091 - SURFACE
      ?auto_33086 - PLACE
      ?auto_33089 - HOIST
      ?auto_33087 - SURFACE
      ?auto_33088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33090 ?auto_33092 ) ( IS-CRATE ?auto_33085 ) ( not ( = ?auto_33084 ?auto_33085 ) ) ( not ( = ?auto_33091 ?auto_33084 ) ) ( not ( = ?auto_33091 ?auto_33085 ) ) ( not ( = ?auto_33086 ?auto_33092 ) ) ( HOIST-AT ?auto_33089 ?auto_33086 ) ( not ( = ?auto_33090 ?auto_33089 ) ) ( AVAILABLE ?auto_33089 ) ( SURFACE-AT ?auto_33085 ?auto_33086 ) ( ON ?auto_33085 ?auto_33087 ) ( CLEAR ?auto_33085 ) ( not ( = ?auto_33084 ?auto_33087 ) ) ( not ( = ?auto_33085 ?auto_33087 ) ) ( not ( = ?auto_33091 ?auto_33087 ) ) ( TRUCK-AT ?auto_33088 ?auto_33092 ) ( SURFACE-AT ?auto_33091 ?auto_33092 ) ( CLEAR ?auto_33091 ) ( IS-CRATE ?auto_33084 ) ( AVAILABLE ?auto_33090 ) ( IN ?auto_33084 ?auto_33088 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33090 ?auto_33084 ?auto_33088 ?auto_33092 )
      ( MAKE-2CRATE ?auto_33091 ?auto_33084 ?auto_33085 )
      ( MAKE-1CRATE-VERIFY ?auto_33084 ?auto_33085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33093 - SURFACE
      ?auto_33094 - SURFACE
      ?auto_33095 - SURFACE
    )
    :vars
    (
      ?auto_33098 - HOIST
      ?auto_33101 - PLACE
      ?auto_33099 - PLACE
      ?auto_33100 - HOIST
      ?auto_33096 - SURFACE
      ?auto_33097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33098 ?auto_33101 ) ( IS-CRATE ?auto_33095 ) ( not ( = ?auto_33094 ?auto_33095 ) ) ( not ( = ?auto_33093 ?auto_33094 ) ) ( not ( = ?auto_33093 ?auto_33095 ) ) ( not ( = ?auto_33099 ?auto_33101 ) ) ( HOIST-AT ?auto_33100 ?auto_33099 ) ( not ( = ?auto_33098 ?auto_33100 ) ) ( AVAILABLE ?auto_33100 ) ( SURFACE-AT ?auto_33095 ?auto_33099 ) ( ON ?auto_33095 ?auto_33096 ) ( CLEAR ?auto_33095 ) ( not ( = ?auto_33094 ?auto_33096 ) ) ( not ( = ?auto_33095 ?auto_33096 ) ) ( not ( = ?auto_33093 ?auto_33096 ) ) ( TRUCK-AT ?auto_33097 ?auto_33101 ) ( SURFACE-AT ?auto_33093 ?auto_33101 ) ( CLEAR ?auto_33093 ) ( IS-CRATE ?auto_33094 ) ( AVAILABLE ?auto_33098 ) ( IN ?auto_33094 ?auto_33097 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33094 ?auto_33095 )
      ( MAKE-2CRATE-VERIFY ?auto_33093 ?auto_33094 ?auto_33095 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33102 - SURFACE
      ?auto_33103 - SURFACE
      ?auto_33104 - SURFACE
      ?auto_33105 - SURFACE
    )
    :vars
    (
      ?auto_33106 - HOIST
      ?auto_33110 - PLACE
      ?auto_33111 - PLACE
      ?auto_33109 - HOIST
      ?auto_33107 - SURFACE
      ?auto_33108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33106 ?auto_33110 ) ( IS-CRATE ?auto_33105 ) ( not ( = ?auto_33104 ?auto_33105 ) ) ( not ( = ?auto_33103 ?auto_33104 ) ) ( not ( = ?auto_33103 ?auto_33105 ) ) ( not ( = ?auto_33111 ?auto_33110 ) ) ( HOIST-AT ?auto_33109 ?auto_33111 ) ( not ( = ?auto_33106 ?auto_33109 ) ) ( AVAILABLE ?auto_33109 ) ( SURFACE-AT ?auto_33105 ?auto_33111 ) ( ON ?auto_33105 ?auto_33107 ) ( CLEAR ?auto_33105 ) ( not ( = ?auto_33104 ?auto_33107 ) ) ( not ( = ?auto_33105 ?auto_33107 ) ) ( not ( = ?auto_33103 ?auto_33107 ) ) ( TRUCK-AT ?auto_33108 ?auto_33110 ) ( SURFACE-AT ?auto_33103 ?auto_33110 ) ( CLEAR ?auto_33103 ) ( IS-CRATE ?auto_33104 ) ( AVAILABLE ?auto_33106 ) ( IN ?auto_33104 ?auto_33108 ) ( ON ?auto_33103 ?auto_33102 ) ( not ( = ?auto_33102 ?auto_33103 ) ) ( not ( = ?auto_33102 ?auto_33104 ) ) ( not ( = ?auto_33102 ?auto_33105 ) ) ( not ( = ?auto_33102 ?auto_33107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33103 ?auto_33104 ?auto_33105 )
      ( MAKE-3CRATE-VERIFY ?auto_33102 ?auto_33103 ?auto_33104 ?auto_33105 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33112 - SURFACE
      ?auto_33113 - SURFACE
      ?auto_33114 - SURFACE
      ?auto_33115 - SURFACE
      ?auto_33116 - SURFACE
    )
    :vars
    (
      ?auto_33117 - HOIST
      ?auto_33121 - PLACE
      ?auto_33122 - PLACE
      ?auto_33120 - HOIST
      ?auto_33118 - SURFACE
      ?auto_33119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33117 ?auto_33121 ) ( IS-CRATE ?auto_33116 ) ( not ( = ?auto_33115 ?auto_33116 ) ) ( not ( = ?auto_33114 ?auto_33115 ) ) ( not ( = ?auto_33114 ?auto_33116 ) ) ( not ( = ?auto_33122 ?auto_33121 ) ) ( HOIST-AT ?auto_33120 ?auto_33122 ) ( not ( = ?auto_33117 ?auto_33120 ) ) ( AVAILABLE ?auto_33120 ) ( SURFACE-AT ?auto_33116 ?auto_33122 ) ( ON ?auto_33116 ?auto_33118 ) ( CLEAR ?auto_33116 ) ( not ( = ?auto_33115 ?auto_33118 ) ) ( not ( = ?auto_33116 ?auto_33118 ) ) ( not ( = ?auto_33114 ?auto_33118 ) ) ( TRUCK-AT ?auto_33119 ?auto_33121 ) ( SURFACE-AT ?auto_33114 ?auto_33121 ) ( CLEAR ?auto_33114 ) ( IS-CRATE ?auto_33115 ) ( AVAILABLE ?auto_33117 ) ( IN ?auto_33115 ?auto_33119 ) ( ON ?auto_33113 ?auto_33112 ) ( ON ?auto_33114 ?auto_33113 ) ( not ( = ?auto_33112 ?auto_33113 ) ) ( not ( = ?auto_33112 ?auto_33114 ) ) ( not ( = ?auto_33112 ?auto_33115 ) ) ( not ( = ?auto_33112 ?auto_33116 ) ) ( not ( = ?auto_33112 ?auto_33118 ) ) ( not ( = ?auto_33113 ?auto_33114 ) ) ( not ( = ?auto_33113 ?auto_33115 ) ) ( not ( = ?auto_33113 ?auto_33116 ) ) ( not ( = ?auto_33113 ?auto_33118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33114 ?auto_33115 ?auto_33116 )
      ( MAKE-4CRATE-VERIFY ?auto_33112 ?auto_33113 ?auto_33114 ?auto_33115 ?auto_33116 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33123 - SURFACE
      ?auto_33124 - SURFACE
    )
    :vars
    (
      ?auto_33125 - HOIST
      ?auto_33130 - PLACE
      ?auto_33128 - SURFACE
      ?auto_33131 - PLACE
      ?auto_33129 - HOIST
      ?auto_33126 - SURFACE
      ?auto_33127 - TRUCK
      ?auto_33132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33125 ?auto_33130 ) ( IS-CRATE ?auto_33124 ) ( not ( = ?auto_33123 ?auto_33124 ) ) ( not ( = ?auto_33128 ?auto_33123 ) ) ( not ( = ?auto_33128 ?auto_33124 ) ) ( not ( = ?auto_33131 ?auto_33130 ) ) ( HOIST-AT ?auto_33129 ?auto_33131 ) ( not ( = ?auto_33125 ?auto_33129 ) ) ( AVAILABLE ?auto_33129 ) ( SURFACE-AT ?auto_33124 ?auto_33131 ) ( ON ?auto_33124 ?auto_33126 ) ( CLEAR ?auto_33124 ) ( not ( = ?auto_33123 ?auto_33126 ) ) ( not ( = ?auto_33124 ?auto_33126 ) ) ( not ( = ?auto_33128 ?auto_33126 ) ) ( SURFACE-AT ?auto_33128 ?auto_33130 ) ( CLEAR ?auto_33128 ) ( IS-CRATE ?auto_33123 ) ( AVAILABLE ?auto_33125 ) ( IN ?auto_33123 ?auto_33127 ) ( TRUCK-AT ?auto_33127 ?auto_33132 ) ( not ( = ?auto_33132 ?auto_33130 ) ) ( not ( = ?auto_33131 ?auto_33132 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33127 ?auto_33132 ?auto_33130 )
      ( MAKE-2CRATE ?auto_33128 ?auto_33123 ?auto_33124 )
      ( MAKE-1CRATE-VERIFY ?auto_33123 ?auto_33124 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33133 - SURFACE
      ?auto_33134 - SURFACE
      ?auto_33135 - SURFACE
    )
    :vars
    (
      ?auto_33141 - HOIST
      ?auto_33136 - PLACE
      ?auto_33137 - PLACE
      ?auto_33142 - HOIST
      ?auto_33140 - SURFACE
      ?auto_33138 - TRUCK
      ?auto_33139 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33141 ?auto_33136 ) ( IS-CRATE ?auto_33135 ) ( not ( = ?auto_33134 ?auto_33135 ) ) ( not ( = ?auto_33133 ?auto_33134 ) ) ( not ( = ?auto_33133 ?auto_33135 ) ) ( not ( = ?auto_33137 ?auto_33136 ) ) ( HOIST-AT ?auto_33142 ?auto_33137 ) ( not ( = ?auto_33141 ?auto_33142 ) ) ( AVAILABLE ?auto_33142 ) ( SURFACE-AT ?auto_33135 ?auto_33137 ) ( ON ?auto_33135 ?auto_33140 ) ( CLEAR ?auto_33135 ) ( not ( = ?auto_33134 ?auto_33140 ) ) ( not ( = ?auto_33135 ?auto_33140 ) ) ( not ( = ?auto_33133 ?auto_33140 ) ) ( SURFACE-AT ?auto_33133 ?auto_33136 ) ( CLEAR ?auto_33133 ) ( IS-CRATE ?auto_33134 ) ( AVAILABLE ?auto_33141 ) ( IN ?auto_33134 ?auto_33138 ) ( TRUCK-AT ?auto_33138 ?auto_33139 ) ( not ( = ?auto_33139 ?auto_33136 ) ) ( not ( = ?auto_33137 ?auto_33139 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33134 ?auto_33135 )
      ( MAKE-2CRATE-VERIFY ?auto_33133 ?auto_33134 ?auto_33135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33143 - SURFACE
      ?auto_33144 - SURFACE
      ?auto_33145 - SURFACE
      ?auto_33146 - SURFACE
    )
    :vars
    (
      ?auto_33149 - HOIST
      ?auto_33151 - PLACE
      ?auto_33150 - PLACE
      ?auto_33147 - HOIST
      ?auto_33153 - SURFACE
      ?auto_33152 - TRUCK
      ?auto_33148 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33149 ?auto_33151 ) ( IS-CRATE ?auto_33146 ) ( not ( = ?auto_33145 ?auto_33146 ) ) ( not ( = ?auto_33144 ?auto_33145 ) ) ( not ( = ?auto_33144 ?auto_33146 ) ) ( not ( = ?auto_33150 ?auto_33151 ) ) ( HOIST-AT ?auto_33147 ?auto_33150 ) ( not ( = ?auto_33149 ?auto_33147 ) ) ( AVAILABLE ?auto_33147 ) ( SURFACE-AT ?auto_33146 ?auto_33150 ) ( ON ?auto_33146 ?auto_33153 ) ( CLEAR ?auto_33146 ) ( not ( = ?auto_33145 ?auto_33153 ) ) ( not ( = ?auto_33146 ?auto_33153 ) ) ( not ( = ?auto_33144 ?auto_33153 ) ) ( SURFACE-AT ?auto_33144 ?auto_33151 ) ( CLEAR ?auto_33144 ) ( IS-CRATE ?auto_33145 ) ( AVAILABLE ?auto_33149 ) ( IN ?auto_33145 ?auto_33152 ) ( TRUCK-AT ?auto_33152 ?auto_33148 ) ( not ( = ?auto_33148 ?auto_33151 ) ) ( not ( = ?auto_33150 ?auto_33148 ) ) ( ON ?auto_33144 ?auto_33143 ) ( not ( = ?auto_33143 ?auto_33144 ) ) ( not ( = ?auto_33143 ?auto_33145 ) ) ( not ( = ?auto_33143 ?auto_33146 ) ) ( not ( = ?auto_33143 ?auto_33153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33144 ?auto_33145 ?auto_33146 )
      ( MAKE-3CRATE-VERIFY ?auto_33143 ?auto_33144 ?auto_33145 ?auto_33146 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33154 - SURFACE
      ?auto_33155 - SURFACE
      ?auto_33156 - SURFACE
      ?auto_33157 - SURFACE
      ?auto_33158 - SURFACE
    )
    :vars
    (
      ?auto_33161 - HOIST
      ?auto_33163 - PLACE
      ?auto_33162 - PLACE
      ?auto_33159 - HOIST
      ?auto_33165 - SURFACE
      ?auto_33164 - TRUCK
      ?auto_33160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33161 ?auto_33163 ) ( IS-CRATE ?auto_33158 ) ( not ( = ?auto_33157 ?auto_33158 ) ) ( not ( = ?auto_33156 ?auto_33157 ) ) ( not ( = ?auto_33156 ?auto_33158 ) ) ( not ( = ?auto_33162 ?auto_33163 ) ) ( HOIST-AT ?auto_33159 ?auto_33162 ) ( not ( = ?auto_33161 ?auto_33159 ) ) ( AVAILABLE ?auto_33159 ) ( SURFACE-AT ?auto_33158 ?auto_33162 ) ( ON ?auto_33158 ?auto_33165 ) ( CLEAR ?auto_33158 ) ( not ( = ?auto_33157 ?auto_33165 ) ) ( not ( = ?auto_33158 ?auto_33165 ) ) ( not ( = ?auto_33156 ?auto_33165 ) ) ( SURFACE-AT ?auto_33156 ?auto_33163 ) ( CLEAR ?auto_33156 ) ( IS-CRATE ?auto_33157 ) ( AVAILABLE ?auto_33161 ) ( IN ?auto_33157 ?auto_33164 ) ( TRUCK-AT ?auto_33164 ?auto_33160 ) ( not ( = ?auto_33160 ?auto_33163 ) ) ( not ( = ?auto_33162 ?auto_33160 ) ) ( ON ?auto_33155 ?auto_33154 ) ( ON ?auto_33156 ?auto_33155 ) ( not ( = ?auto_33154 ?auto_33155 ) ) ( not ( = ?auto_33154 ?auto_33156 ) ) ( not ( = ?auto_33154 ?auto_33157 ) ) ( not ( = ?auto_33154 ?auto_33158 ) ) ( not ( = ?auto_33154 ?auto_33165 ) ) ( not ( = ?auto_33155 ?auto_33156 ) ) ( not ( = ?auto_33155 ?auto_33157 ) ) ( not ( = ?auto_33155 ?auto_33158 ) ) ( not ( = ?auto_33155 ?auto_33165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33156 ?auto_33157 ?auto_33158 )
      ( MAKE-4CRATE-VERIFY ?auto_33154 ?auto_33155 ?auto_33156 ?auto_33157 ?auto_33158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33166 - SURFACE
      ?auto_33167 - SURFACE
    )
    :vars
    (
      ?auto_33170 - HOIST
      ?auto_33172 - PLACE
      ?auto_33175 - SURFACE
      ?auto_33171 - PLACE
      ?auto_33168 - HOIST
      ?auto_33174 - SURFACE
      ?auto_33173 - TRUCK
      ?auto_33169 - PLACE
      ?auto_33176 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33170 ?auto_33172 ) ( IS-CRATE ?auto_33167 ) ( not ( = ?auto_33166 ?auto_33167 ) ) ( not ( = ?auto_33175 ?auto_33166 ) ) ( not ( = ?auto_33175 ?auto_33167 ) ) ( not ( = ?auto_33171 ?auto_33172 ) ) ( HOIST-AT ?auto_33168 ?auto_33171 ) ( not ( = ?auto_33170 ?auto_33168 ) ) ( AVAILABLE ?auto_33168 ) ( SURFACE-AT ?auto_33167 ?auto_33171 ) ( ON ?auto_33167 ?auto_33174 ) ( CLEAR ?auto_33167 ) ( not ( = ?auto_33166 ?auto_33174 ) ) ( not ( = ?auto_33167 ?auto_33174 ) ) ( not ( = ?auto_33175 ?auto_33174 ) ) ( SURFACE-AT ?auto_33175 ?auto_33172 ) ( CLEAR ?auto_33175 ) ( IS-CRATE ?auto_33166 ) ( AVAILABLE ?auto_33170 ) ( TRUCK-AT ?auto_33173 ?auto_33169 ) ( not ( = ?auto_33169 ?auto_33172 ) ) ( not ( = ?auto_33171 ?auto_33169 ) ) ( HOIST-AT ?auto_33176 ?auto_33169 ) ( LIFTING ?auto_33176 ?auto_33166 ) ( not ( = ?auto_33170 ?auto_33176 ) ) ( not ( = ?auto_33168 ?auto_33176 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33176 ?auto_33166 ?auto_33173 ?auto_33169 )
      ( MAKE-2CRATE ?auto_33175 ?auto_33166 ?auto_33167 )
      ( MAKE-1CRATE-VERIFY ?auto_33166 ?auto_33167 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33177 - SURFACE
      ?auto_33178 - SURFACE
      ?auto_33179 - SURFACE
    )
    :vars
    (
      ?auto_33185 - HOIST
      ?auto_33182 - PLACE
      ?auto_33187 - PLACE
      ?auto_33180 - HOIST
      ?auto_33181 - SURFACE
      ?auto_33183 - TRUCK
      ?auto_33186 - PLACE
      ?auto_33184 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33185 ?auto_33182 ) ( IS-CRATE ?auto_33179 ) ( not ( = ?auto_33178 ?auto_33179 ) ) ( not ( = ?auto_33177 ?auto_33178 ) ) ( not ( = ?auto_33177 ?auto_33179 ) ) ( not ( = ?auto_33187 ?auto_33182 ) ) ( HOIST-AT ?auto_33180 ?auto_33187 ) ( not ( = ?auto_33185 ?auto_33180 ) ) ( AVAILABLE ?auto_33180 ) ( SURFACE-AT ?auto_33179 ?auto_33187 ) ( ON ?auto_33179 ?auto_33181 ) ( CLEAR ?auto_33179 ) ( not ( = ?auto_33178 ?auto_33181 ) ) ( not ( = ?auto_33179 ?auto_33181 ) ) ( not ( = ?auto_33177 ?auto_33181 ) ) ( SURFACE-AT ?auto_33177 ?auto_33182 ) ( CLEAR ?auto_33177 ) ( IS-CRATE ?auto_33178 ) ( AVAILABLE ?auto_33185 ) ( TRUCK-AT ?auto_33183 ?auto_33186 ) ( not ( = ?auto_33186 ?auto_33182 ) ) ( not ( = ?auto_33187 ?auto_33186 ) ) ( HOIST-AT ?auto_33184 ?auto_33186 ) ( LIFTING ?auto_33184 ?auto_33178 ) ( not ( = ?auto_33185 ?auto_33184 ) ) ( not ( = ?auto_33180 ?auto_33184 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33178 ?auto_33179 )
      ( MAKE-2CRATE-VERIFY ?auto_33177 ?auto_33178 ?auto_33179 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33188 - SURFACE
      ?auto_33189 - SURFACE
      ?auto_33190 - SURFACE
      ?auto_33191 - SURFACE
    )
    :vars
    (
      ?auto_33198 - HOIST
      ?auto_33197 - PLACE
      ?auto_33194 - PLACE
      ?auto_33195 - HOIST
      ?auto_33199 - SURFACE
      ?auto_33193 - TRUCK
      ?auto_33192 - PLACE
      ?auto_33196 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33198 ?auto_33197 ) ( IS-CRATE ?auto_33191 ) ( not ( = ?auto_33190 ?auto_33191 ) ) ( not ( = ?auto_33189 ?auto_33190 ) ) ( not ( = ?auto_33189 ?auto_33191 ) ) ( not ( = ?auto_33194 ?auto_33197 ) ) ( HOIST-AT ?auto_33195 ?auto_33194 ) ( not ( = ?auto_33198 ?auto_33195 ) ) ( AVAILABLE ?auto_33195 ) ( SURFACE-AT ?auto_33191 ?auto_33194 ) ( ON ?auto_33191 ?auto_33199 ) ( CLEAR ?auto_33191 ) ( not ( = ?auto_33190 ?auto_33199 ) ) ( not ( = ?auto_33191 ?auto_33199 ) ) ( not ( = ?auto_33189 ?auto_33199 ) ) ( SURFACE-AT ?auto_33189 ?auto_33197 ) ( CLEAR ?auto_33189 ) ( IS-CRATE ?auto_33190 ) ( AVAILABLE ?auto_33198 ) ( TRUCK-AT ?auto_33193 ?auto_33192 ) ( not ( = ?auto_33192 ?auto_33197 ) ) ( not ( = ?auto_33194 ?auto_33192 ) ) ( HOIST-AT ?auto_33196 ?auto_33192 ) ( LIFTING ?auto_33196 ?auto_33190 ) ( not ( = ?auto_33198 ?auto_33196 ) ) ( not ( = ?auto_33195 ?auto_33196 ) ) ( ON ?auto_33189 ?auto_33188 ) ( not ( = ?auto_33188 ?auto_33189 ) ) ( not ( = ?auto_33188 ?auto_33190 ) ) ( not ( = ?auto_33188 ?auto_33191 ) ) ( not ( = ?auto_33188 ?auto_33199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33189 ?auto_33190 ?auto_33191 )
      ( MAKE-3CRATE-VERIFY ?auto_33188 ?auto_33189 ?auto_33190 ?auto_33191 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33200 - SURFACE
      ?auto_33201 - SURFACE
      ?auto_33202 - SURFACE
      ?auto_33203 - SURFACE
      ?auto_33204 - SURFACE
    )
    :vars
    (
      ?auto_33211 - HOIST
      ?auto_33210 - PLACE
      ?auto_33207 - PLACE
      ?auto_33208 - HOIST
      ?auto_33212 - SURFACE
      ?auto_33206 - TRUCK
      ?auto_33205 - PLACE
      ?auto_33209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33211 ?auto_33210 ) ( IS-CRATE ?auto_33204 ) ( not ( = ?auto_33203 ?auto_33204 ) ) ( not ( = ?auto_33202 ?auto_33203 ) ) ( not ( = ?auto_33202 ?auto_33204 ) ) ( not ( = ?auto_33207 ?auto_33210 ) ) ( HOIST-AT ?auto_33208 ?auto_33207 ) ( not ( = ?auto_33211 ?auto_33208 ) ) ( AVAILABLE ?auto_33208 ) ( SURFACE-AT ?auto_33204 ?auto_33207 ) ( ON ?auto_33204 ?auto_33212 ) ( CLEAR ?auto_33204 ) ( not ( = ?auto_33203 ?auto_33212 ) ) ( not ( = ?auto_33204 ?auto_33212 ) ) ( not ( = ?auto_33202 ?auto_33212 ) ) ( SURFACE-AT ?auto_33202 ?auto_33210 ) ( CLEAR ?auto_33202 ) ( IS-CRATE ?auto_33203 ) ( AVAILABLE ?auto_33211 ) ( TRUCK-AT ?auto_33206 ?auto_33205 ) ( not ( = ?auto_33205 ?auto_33210 ) ) ( not ( = ?auto_33207 ?auto_33205 ) ) ( HOIST-AT ?auto_33209 ?auto_33205 ) ( LIFTING ?auto_33209 ?auto_33203 ) ( not ( = ?auto_33211 ?auto_33209 ) ) ( not ( = ?auto_33208 ?auto_33209 ) ) ( ON ?auto_33201 ?auto_33200 ) ( ON ?auto_33202 ?auto_33201 ) ( not ( = ?auto_33200 ?auto_33201 ) ) ( not ( = ?auto_33200 ?auto_33202 ) ) ( not ( = ?auto_33200 ?auto_33203 ) ) ( not ( = ?auto_33200 ?auto_33204 ) ) ( not ( = ?auto_33200 ?auto_33212 ) ) ( not ( = ?auto_33201 ?auto_33202 ) ) ( not ( = ?auto_33201 ?auto_33203 ) ) ( not ( = ?auto_33201 ?auto_33204 ) ) ( not ( = ?auto_33201 ?auto_33212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33202 ?auto_33203 ?auto_33204 )
      ( MAKE-4CRATE-VERIFY ?auto_33200 ?auto_33201 ?auto_33202 ?auto_33203 ?auto_33204 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33213 - SURFACE
      ?auto_33214 - SURFACE
    )
    :vars
    (
      ?auto_33221 - HOIST
      ?auto_33220 - PLACE
      ?auto_33223 - SURFACE
      ?auto_33217 - PLACE
      ?auto_33218 - HOIST
      ?auto_33222 - SURFACE
      ?auto_33216 - TRUCK
      ?auto_33215 - PLACE
      ?auto_33219 - HOIST
      ?auto_33224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33221 ?auto_33220 ) ( IS-CRATE ?auto_33214 ) ( not ( = ?auto_33213 ?auto_33214 ) ) ( not ( = ?auto_33223 ?auto_33213 ) ) ( not ( = ?auto_33223 ?auto_33214 ) ) ( not ( = ?auto_33217 ?auto_33220 ) ) ( HOIST-AT ?auto_33218 ?auto_33217 ) ( not ( = ?auto_33221 ?auto_33218 ) ) ( AVAILABLE ?auto_33218 ) ( SURFACE-AT ?auto_33214 ?auto_33217 ) ( ON ?auto_33214 ?auto_33222 ) ( CLEAR ?auto_33214 ) ( not ( = ?auto_33213 ?auto_33222 ) ) ( not ( = ?auto_33214 ?auto_33222 ) ) ( not ( = ?auto_33223 ?auto_33222 ) ) ( SURFACE-AT ?auto_33223 ?auto_33220 ) ( CLEAR ?auto_33223 ) ( IS-CRATE ?auto_33213 ) ( AVAILABLE ?auto_33221 ) ( TRUCK-AT ?auto_33216 ?auto_33215 ) ( not ( = ?auto_33215 ?auto_33220 ) ) ( not ( = ?auto_33217 ?auto_33215 ) ) ( HOIST-AT ?auto_33219 ?auto_33215 ) ( not ( = ?auto_33221 ?auto_33219 ) ) ( not ( = ?auto_33218 ?auto_33219 ) ) ( AVAILABLE ?auto_33219 ) ( SURFACE-AT ?auto_33213 ?auto_33215 ) ( ON ?auto_33213 ?auto_33224 ) ( CLEAR ?auto_33213 ) ( not ( = ?auto_33213 ?auto_33224 ) ) ( not ( = ?auto_33214 ?auto_33224 ) ) ( not ( = ?auto_33223 ?auto_33224 ) ) ( not ( = ?auto_33222 ?auto_33224 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33219 ?auto_33213 ?auto_33224 ?auto_33215 )
      ( MAKE-2CRATE ?auto_33223 ?auto_33213 ?auto_33214 )
      ( MAKE-1CRATE-VERIFY ?auto_33213 ?auto_33214 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33225 - SURFACE
      ?auto_33226 - SURFACE
      ?auto_33227 - SURFACE
    )
    :vars
    (
      ?auto_33233 - HOIST
      ?auto_33228 - PLACE
      ?auto_33234 - PLACE
      ?auto_33230 - HOIST
      ?auto_33236 - SURFACE
      ?auto_33229 - TRUCK
      ?auto_33231 - PLACE
      ?auto_33235 - HOIST
      ?auto_33232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33233 ?auto_33228 ) ( IS-CRATE ?auto_33227 ) ( not ( = ?auto_33226 ?auto_33227 ) ) ( not ( = ?auto_33225 ?auto_33226 ) ) ( not ( = ?auto_33225 ?auto_33227 ) ) ( not ( = ?auto_33234 ?auto_33228 ) ) ( HOIST-AT ?auto_33230 ?auto_33234 ) ( not ( = ?auto_33233 ?auto_33230 ) ) ( AVAILABLE ?auto_33230 ) ( SURFACE-AT ?auto_33227 ?auto_33234 ) ( ON ?auto_33227 ?auto_33236 ) ( CLEAR ?auto_33227 ) ( not ( = ?auto_33226 ?auto_33236 ) ) ( not ( = ?auto_33227 ?auto_33236 ) ) ( not ( = ?auto_33225 ?auto_33236 ) ) ( SURFACE-AT ?auto_33225 ?auto_33228 ) ( CLEAR ?auto_33225 ) ( IS-CRATE ?auto_33226 ) ( AVAILABLE ?auto_33233 ) ( TRUCK-AT ?auto_33229 ?auto_33231 ) ( not ( = ?auto_33231 ?auto_33228 ) ) ( not ( = ?auto_33234 ?auto_33231 ) ) ( HOIST-AT ?auto_33235 ?auto_33231 ) ( not ( = ?auto_33233 ?auto_33235 ) ) ( not ( = ?auto_33230 ?auto_33235 ) ) ( AVAILABLE ?auto_33235 ) ( SURFACE-AT ?auto_33226 ?auto_33231 ) ( ON ?auto_33226 ?auto_33232 ) ( CLEAR ?auto_33226 ) ( not ( = ?auto_33226 ?auto_33232 ) ) ( not ( = ?auto_33227 ?auto_33232 ) ) ( not ( = ?auto_33225 ?auto_33232 ) ) ( not ( = ?auto_33236 ?auto_33232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33226 ?auto_33227 )
      ( MAKE-2CRATE-VERIFY ?auto_33225 ?auto_33226 ?auto_33227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33237 - SURFACE
      ?auto_33238 - SURFACE
      ?auto_33239 - SURFACE
      ?auto_33240 - SURFACE
    )
    :vars
    (
      ?auto_33248 - HOIST
      ?auto_33243 - PLACE
      ?auto_33244 - PLACE
      ?auto_33242 - HOIST
      ?auto_33249 - SURFACE
      ?auto_33246 - TRUCK
      ?auto_33247 - PLACE
      ?auto_33241 - HOIST
      ?auto_33245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33248 ?auto_33243 ) ( IS-CRATE ?auto_33240 ) ( not ( = ?auto_33239 ?auto_33240 ) ) ( not ( = ?auto_33238 ?auto_33239 ) ) ( not ( = ?auto_33238 ?auto_33240 ) ) ( not ( = ?auto_33244 ?auto_33243 ) ) ( HOIST-AT ?auto_33242 ?auto_33244 ) ( not ( = ?auto_33248 ?auto_33242 ) ) ( AVAILABLE ?auto_33242 ) ( SURFACE-AT ?auto_33240 ?auto_33244 ) ( ON ?auto_33240 ?auto_33249 ) ( CLEAR ?auto_33240 ) ( not ( = ?auto_33239 ?auto_33249 ) ) ( not ( = ?auto_33240 ?auto_33249 ) ) ( not ( = ?auto_33238 ?auto_33249 ) ) ( SURFACE-AT ?auto_33238 ?auto_33243 ) ( CLEAR ?auto_33238 ) ( IS-CRATE ?auto_33239 ) ( AVAILABLE ?auto_33248 ) ( TRUCK-AT ?auto_33246 ?auto_33247 ) ( not ( = ?auto_33247 ?auto_33243 ) ) ( not ( = ?auto_33244 ?auto_33247 ) ) ( HOIST-AT ?auto_33241 ?auto_33247 ) ( not ( = ?auto_33248 ?auto_33241 ) ) ( not ( = ?auto_33242 ?auto_33241 ) ) ( AVAILABLE ?auto_33241 ) ( SURFACE-AT ?auto_33239 ?auto_33247 ) ( ON ?auto_33239 ?auto_33245 ) ( CLEAR ?auto_33239 ) ( not ( = ?auto_33239 ?auto_33245 ) ) ( not ( = ?auto_33240 ?auto_33245 ) ) ( not ( = ?auto_33238 ?auto_33245 ) ) ( not ( = ?auto_33249 ?auto_33245 ) ) ( ON ?auto_33238 ?auto_33237 ) ( not ( = ?auto_33237 ?auto_33238 ) ) ( not ( = ?auto_33237 ?auto_33239 ) ) ( not ( = ?auto_33237 ?auto_33240 ) ) ( not ( = ?auto_33237 ?auto_33249 ) ) ( not ( = ?auto_33237 ?auto_33245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33238 ?auto_33239 ?auto_33240 )
      ( MAKE-3CRATE-VERIFY ?auto_33237 ?auto_33238 ?auto_33239 ?auto_33240 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33250 - SURFACE
      ?auto_33251 - SURFACE
      ?auto_33252 - SURFACE
      ?auto_33253 - SURFACE
      ?auto_33254 - SURFACE
    )
    :vars
    (
      ?auto_33262 - HOIST
      ?auto_33257 - PLACE
      ?auto_33258 - PLACE
      ?auto_33256 - HOIST
      ?auto_33263 - SURFACE
      ?auto_33260 - TRUCK
      ?auto_33261 - PLACE
      ?auto_33255 - HOIST
      ?auto_33259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33262 ?auto_33257 ) ( IS-CRATE ?auto_33254 ) ( not ( = ?auto_33253 ?auto_33254 ) ) ( not ( = ?auto_33252 ?auto_33253 ) ) ( not ( = ?auto_33252 ?auto_33254 ) ) ( not ( = ?auto_33258 ?auto_33257 ) ) ( HOIST-AT ?auto_33256 ?auto_33258 ) ( not ( = ?auto_33262 ?auto_33256 ) ) ( AVAILABLE ?auto_33256 ) ( SURFACE-AT ?auto_33254 ?auto_33258 ) ( ON ?auto_33254 ?auto_33263 ) ( CLEAR ?auto_33254 ) ( not ( = ?auto_33253 ?auto_33263 ) ) ( not ( = ?auto_33254 ?auto_33263 ) ) ( not ( = ?auto_33252 ?auto_33263 ) ) ( SURFACE-AT ?auto_33252 ?auto_33257 ) ( CLEAR ?auto_33252 ) ( IS-CRATE ?auto_33253 ) ( AVAILABLE ?auto_33262 ) ( TRUCK-AT ?auto_33260 ?auto_33261 ) ( not ( = ?auto_33261 ?auto_33257 ) ) ( not ( = ?auto_33258 ?auto_33261 ) ) ( HOIST-AT ?auto_33255 ?auto_33261 ) ( not ( = ?auto_33262 ?auto_33255 ) ) ( not ( = ?auto_33256 ?auto_33255 ) ) ( AVAILABLE ?auto_33255 ) ( SURFACE-AT ?auto_33253 ?auto_33261 ) ( ON ?auto_33253 ?auto_33259 ) ( CLEAR ?auto_33253 ) ( not ( = ?auto_33253 ?auto_33259 ) ) ( not ( = ?auto_33254 ?auto_33259 ) ) ( not ( = ?auto_33252 ?auto_33259 ) ) ( not ( = ?auto_33263 ?auto_33259 ) ) ( ON ?auto_33251 ?auto_33250 ) ( ON ?auto_33252 ?auto_33251 ) ( not ( = ?auto_33250 ?auto_33251 ) ) ( not ( = ?auto_33250 ?auto_33252 ) ) ( not ( = ?auto_33250 ?auto_33253 ) ) ( not ( = ?auto_33250 ?auto_33254 ) ) ( not ( = ?auto_33250 ?auto_33263 ) ) ( not ( = ?auto_33250 ?auto_33259 ) ) ( not ( = ?auto_33251 ?auto_33252 ) ) ( not ( = ?auto_33251 ?auto_33253 ) ) ( not ( = ?auto_33251 ?auto_33254 ) ) ( not ( = ?auto_33251 ?auto_33263 ) ) ( not ( = ?auto_33251 ?auto_33259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33252 ?auto_33253 ?auto_33254 )
      ( MAKE-4CRATE-VERIFY ?auto_33250 ?auto_33251 ?auto_33252 ?auto_33253 ?auto_33254 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33264 - SURFACE
      ?auto_33265 - SURFACE
    )
    :vars
    (
      ?auto_33274 - HOIST
      ?auto_33268 - PLACE
      ?auto_33272 - SURFACE
      ?auto_33269 - PLACE
      ?auto_33267 - HOIST
      ?auto_33275 - SURFACE
      ?auto_33273 - PLACE
      ?auto_33266 - HOIST
      ?auto_33270 - SURFACE
      ?auto_33271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33274 ?auto_33268 ) ( IS-CRATE ?auto_33265 ) ( not ( = ?auto_33264 ?auto_33265 ) ) ( not ( = ?auto_33272 ?auto_33264 ) ) ( not ( = ?auto_33272 ?auto_33265 ) ) ( not ( = ?auto_33269 ?auto_33268 ) ) ( HOIST-AT ?auto_33267 ?auto_33269 ) ( not ( = ?auto_33274 ?auto_33267 ) ) ( AVAILABLE ?auto_33267 ) ( SURFACE-AT ?auto_33265 ?auto_33269 ) ( ON ?auto_33265 ?auto_33275 ) ( CLEAR ?auto_33265 ) ( not ( = ?auto_33264 ?auto_33275 ) ) ( not ( = ?auto_33265 ?auto_33275 ) ) ( not ( = ?auto_33272 ?auto_33275 ) ) ( SURFACE-AT ?auto_33272 ?auto_33268 ) ( CLEAR ?auto_33272 ) ( IS-CRATE ?auto_33264 ) ( AVAILABLE ?auto_33274 ) ( not ( = ?auto_33273 ?auto_33268 ) ) ( not ( = ?auto_33269 ?auto_33273 ) ) ( HOIST-AT ?auto_33266 ?auto_33273 ) ( not ( = ?auto_33274 ?auto_33266 ) ) ( not ( = ?auto_33267 ?auto_33266 ) ) ( AVAILABLE ?auto_33266 ) ( SURFACE-AT ?auto_33264 ?auto_33273 ) ( ON ?auto_33264 ?auto_33270 ) ( CLEAR ?auto_33264 ) ( not ( = ?auto_33264 ?auto_33270 ) ) ( not ( = ?auto_33265 ?auto_33270 ) ) ( not ( = ?auto_33272 ?auto_33270 ) ) ( not ( = ?auto_33275 ?auto_33270 ) ) ( TRUCK-AT ?auto_33271 ?auto_33268 ) )
    :subtasks
    ( ( !DRIVE ?auto_33271 ?auto_33268 ?auto_33273 )
      ( MAKE-2CRATE ?auto_33272 ?auto_33264 ?auto_33265 )
      ( MAKE-1CRATE-VERIFY ?auto_33264 ?auto_33265 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33276 - SURFACE
      ?auto_33277 - SURFACE
      ?auto_33278 - SURFACE
    )
    :vars
    (
      ?auto_33287 - HOIST
      ?auto_33283 - PLACE
      ?auto_33286 - PLACE
      ?auto_33282 - HOIST
      ?auto_33285 - SURFACE
      ?auto_33280 - PLACE
      ?auto_33281 - HOIST
      ?auto_33284 - SURFACE
      ?auto_33279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33287 ?auto_33283 ) ( IS-CRATE ?auto_33278 ) ( not ( = ?auto_33277 ?auto_33278 ) ) ( not ( = ?auto_33276 ?auto_33277 ) ) ( not ( = ?auto_33276 ?auto_33278 ) ) ( not ( = ?auto_33286 ?auto_33283 ) ) ( HOIST-AT ?auto_33282 ?auto_33286 ) ( not ( = ?auto_33287 ?auto_33282 ) ) ( AVAILABLE ?auto_33282 ) ( SURFACE-AT ?auto_33278 ?auto_33286 ) ( ON ?auto_33278 ?auto_33285 ) ( CLEAR ?auto_33278 ) ( not ( = ?auto_33277 ?auto_33285 ) ) ( not ( = ?auto_33278 ?auto_33285 ) ) ( not ( = ?auto_33276 ?auto_33285 ) ) ( SURFACE-AT ?auto_33276 ?auto_33283 ) ( CLEAR ?auto_33276 ) ( IS-CRATE ?auto_33277 ) ( AVAILABLE ?auto_33287 ) ( not ( = ?auto_33280 ?auto_33283 ) ) ( not ( = ?auto_33286 ?auto_33280 ) ) ( HOIST-AT ?auto_33281 ?auto_33280 ) ( not ( = ?auto_33287 ?auto_33281 ) ) ( not ( = ?auto_33282 ?auto_33281 ) ) ( AVAILABLE ?auto_33281 ) ( SURFACE-AT ?auto_33277 ?auto_33280 ) ( ON ?auto_33277 ?auto_33284 ) ( CLEAR ?auto_33277 ) ( not ( = ?auto_33277 ?auto_33284 ) ) ( not ( = ?auto_33278 ?auto_33284 ) ) ( not ( = ?auto_33276 ?auto_33284 ) ) ( not ( = ?auto_33285 ?auto_33284 ) ) ( TRUCK-AT ?auto_33279 ?auto_33283 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33277 ?auto_33278 )
      ( MAKE-2CRATE-VERIFY ?auto_33276 ?auto_33277 ?auto_33278 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33288 - SURFACE
      ?auto_33289 - SURFACE
      ?auto_33290 - SURFACE
      ?auto_33291 - SURFACE
    )
    :vars
    (
      ?auto_33293 - HOIST
      ?auto_33296 - PLACE
      ?auto_33298 - PLACE
      ?auto_33295 - HOIST
      ?auto_33300 - SURFACE
      ?auto_33294 - PLACE
      ?auto_33299 - HOIST
      ?auto_33292 - SURFACE
      ?auto_33297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33293 ?auto_33296 ) ( IS-CRATE ?auto_33291 ) ( not ( = ?auto_33290 ?auto_33291 ) ) ( not ( = ?auto_33289 ?auto_33290 ) ) ( not ( = ?auto_33289 ?auto_33291 ) ) ( not ( = ?auto_33298 ?auto_33296 ) ) ( HOIST-AT ?auto_33295 ?auto_33298 ) ( not ( = ?auto_33293 ?auto_33295 ) ) ( AVAILABLE ?auto_33295 ) ( SURFACE-AT ?auto_33291 ?auto_33298 ) ( ON ?auto_33291 ?auto_33300 ) ( CLEAR ?auto_33291 ) ( not ( = ?auto_33290 ?auto_33300 ) ) ( not ( = ?auto_33291 ?auto_33300 ) ) ( not ( = ?auto_33289 ?auto_33300 ) ) ( SURFACE-AT ?auto_33289 ?auto_33296 ) ( CLEAR ?auto_33289 ) ( IS-CRATE ?auto_33290 ) ( AVAILABLE ?auto_33293 ) ( not ( = ?auto_33294 ?auto_33296 ) ) ( not ( = ?auto_33298 ?auto_33294 ) ) ( HOIST-AT ?auto_33299 ?auto_33294 ) ( not ( = ?auto_33293 ?auto_33299 ) ) ( not ( = ?auto_33295 ?auto_33299 ) ) ( AVAILABLE ?auto_33299 ) ( SURFACE-AT ?auto_33290 ?auto_33294 ) ( ON ?auto_33290 ?auto_33292 ) ( CLEAR ?auto_33290 ) ( not ( = ?auto_33290 ?auto_33292 ) ) ( not ( = ?auto_33291 ?auto_33292 ) ) ( not ( = ?auto_33289 ?auto_33292 ) ) ( not ( = ?auto_33300 ?auto_33292 ) ) ( TRUCK-AT ?auto_33297 ?auto_33296 ) ( ON ?auto_33289 ?auto_33288 ) ( not ( = ?auto_33288 ?auto_33289 ) ) ( not ( = ?auto_33288 ?auto_33290 ) ) ( not ( = ?auto_33288 ?auto_33291 ) ) ( not ( = ?auto_33288 ?auto_33300 ) ) ( not ( = ?auto_33288 ?auto_33292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33289 ?auto_33290 ?auto_33291 )
      ( MAKE-3CRATE-VERIFY ?auto_33288 ?auto_33289 ?auto_33290 ?auto_33291 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33301 - SURFACE
      ?auto_33302 - SURFACE
      ?auto_33303 - SURFACE
      ?auto_33304 - SURFACE
      ?auto_33305 - SURFACE
    )
    :vars
    (
      ?auto_33307 - HOIST
      ?auto_33310 - PLACE
      ?auto_33312 - PLACE
      ?auto_33309 - HOIST
      ?auto_33314 - SURFACE
      ?auto_33308 - PLACE
      ?auto_33313 - HOIST
      ?auto_33306 - SURFACE
      ?auto_33311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33307 ?auto_33310 ) ( IS-CRATE ?auto_33305 ) ( not ( = ?auto_33304 ?auto_33305 ) ) ( not ( = ?auto_33303 ?auto_33304 ) ) ( not ( = ?auto_33303 ?auto_33305 ) ) ( not ( = ?auto_33312 ?auto_33310 ) ) ( HOIST-AT ?auto_33309 ?auto_33312 ) ( not ( = ?auto_33307 ?auto_33309 ) ) ( AVAILABLE ?auto_33309 ) ( SURFACE-AT ?auto_33305 ?auto_33312 ) ( ON ?auto_33305 ?auto_33314 ) ( CLEAR ?auto_33305 ) ( not ( = ?auto_33304 ?auto_33314 ) ) ( not ( = ?auto_33305 ?auto_33314 ) ) ( not ( = ?auto_33303 ?auto_33314 ) ) ( SURFACE-AT ?auto_33303 ?auto_33310 ) ( CLEAR ?auto_33303 ) ( IS-CRATE ?auto_33304 ) ( AVAILABLE ?auto_33307 ) ( not ( = ?auto_33308 ?auto_33310 ) ) ( not ( = ?auto_33312 ?auto_33308 ) ) ( HOIST-AT ?auto_33313 ?auto_33308 ) ( not ( = ?auto_33307 ?auto_33313 ) ) ( not ( = ?auto_33309 ?auto_33313 ) ) ( AVAILABLE ?auto_33313 ) ( SURFACE-AT ?auto_33304 ?auto_33308 ) ( ON ?auto_33304 ?auto_33306 ) ( CLEAR ?auto_33304 ) ( not ( = ?auto_33304 ?auto_33306 ) ) ( not ( = ?auto_33305 ?auto_33306 ) ) ( not ( = ?auto_33303 ?auto_33306 ) ) ( not ( = ?auto_33314 ?auto_33306 ) ) ( TRUCK-AT ?auto_33311 ?auto_33310 ) ( ON ?auto_33302 ?auto_33301 ) ( ON ?auto_33303 ?auto_33302 ) ( not ( = ?auto_33301 ?auto_33302 ) ) ( not ( = ?auto_33301 ?auto_33303 ) ) ( not ( = ?auto_33301 ?auto_33304 ) ) ( not ( = ?auto_33301 ?auto_33305 ) ) ( not ( = ?auto_33301 ?auto_33314 ) ) ( not ( = ?auto_33301 ?auto_33306 ) ) ( not ( = ?auto_33302 ?auto_33303 ) ) ( not ( = ?auto_33302 ?auto_33304 ) ) ( not ( = ?auto_33302 ?auto_33305 ) ) ( not ( = ?auto_33302 ?auto_33314 ) ) ( not ( = ?auto_33302 ?auto_33306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33303 ?auto_33304 ?auto_33305 )
      ( MAKE-4CRATE-VERIFY ?auto_33301 ?auto_33302 ?auto_33303 ?auto_33304 ?auto_33305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33315 - SURFACE
      ?auto_33316 - SURFACE
    )
    :vars
    (
      ?auto_33318 - HOIST
      ?auto_33321 - PLACE
      ?auto_33322 - SURFACE
      ?auto_33324 - PLACE
      ?auto_33320 - HOIST
      ?auto_33326 - SURFACE
      ?auto_33319 - PLACE
      ?auto_33325 - HOIST
      ?auto_33317 - SURFACE
      ?auto_33323 - TRUCK
      ?auto_33327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33318 ?auto_33321 ) ( IS-CRATE ?auto_33316 ) ( not ( = ?auto_33315 ?auto_33316 ) ) ( not ( = ?auto_33322 ?auto_33315 ) ) ( not ( = ?auto_33322 ?auto_33316 ) ) ( not ( = ?auto_33324 ?auto_33321 ) ) ( HOIST-AT ?auto_33320 ?auto_33324 ) ( not ( = ?auto_33318 ?auto_33320 ) ) ( AVAILABLE ?auto_33320 ) ( SURFACE-AT ?auto_33316 ?auto_33324 ) ( ON ?auto_33316 ?auto_33326 ) ( CLEAR ?auto_33316 ) ( not ( = ?auto_33315 ?auto_33326 ) ) ( not ( = ?auto_33316 ?auto_33326 ) ) ( not ( = ?auto_33322 ?auto_33326 ) ) ( IS-CRATE ?auto_33315 ) ( not ( = ?auto_33319 ?auto_33321 ) ) ( not ( = ?auto_33324 ?auto_33319 ) ) ( HOIST-AT ?auto_33325 ?auto_33319 ) ( not ( = ?auto_33318 ?auto_33325 ) ) ( not ( = ?auto_33320 ?auto_33325 ) ) ( AVAILABLE ?auto_33325 ) ( SURFACE-AT ?auto_33315 ?auto_33319 ) ( ON ?auto_33315 ?auto_33317 ) ( CLEAR ?auto_33315 ) ( not ( = ?auto_33315 ?auto_33317 ) ) ( not ( = ?auto_33316 ?auto_33317 ) ) ( not ( = ?auto_33322 ?auto_33317 ) ) ( not ( = ?auto_33326 ?auto_33317 ) ) ( TRUCK-AT ?auto_33323 ?auto_33321 ) ( SURFACE-AT ?auto_33327 ?auto_33321 ) ( CLEAR ?auto_33327 ) ( LIFTING ?auto_33318 ?auto_33322 ) ( IS-CRATE ?auto_33322 ) ( not ( = ?auto_33327 ?auto_33322 ) ) ( not ( = ?auto_33315 ?auto_33327 ) ) ( not ( = ?auto_33316 ?auto_33327 ) ) ( not ( = ?auto_33326 ?auto_33327 ) ) ( not ( = ?auto_33317 ?auto_33327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33327 ?auto_33322 )
      ( MAKE-2CRATE ?auto_33322 ?auto_33315 ?auto_33316 )
      ( MAKE-1CRATE-VERIFY ?auto_33315 ?auto_33316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33328 - SURFACE
      ?auto_33329 - SURFACE
      ?auto_33330 - SURFACE
    )
    :vars
    (
      ?auto_33336 - HOIST
      ?auto_33340 - PLACE
      ?auto_33337 - PLACE
      ?auto_33331 - HOIST
      ?auto_33333 - SURFACE
      ?auto_33335 - PLACE
      ?auto_33339 - HOIST
      ?auto_33338 - SURFACE
      ?auto_33334 - TRUCK
      ?auto_33332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33336 ?auto_33340 ) ( IS-CRATE ?auto_33330 ) ( not ( = ?auto_33329 ?auto_33330 ) ) ( not ( = ?auto_33328 ?auto_33329 ) ) ( not ( = ?auto_33328 ?auto_33330 ) ) ( not ( = ?auto_33337 ?auto_33340 ) ) ( HOIST-AT ?auto_33331 ?auto_33337 ) ( not ( = ?auto_33336 ?auto_33331 ) ) ( AVAILABLE ?auto_33331 ) ( SURFACE-AT ?auto_33330 ?auto_33337 ) ( ON ?auto_33330 ?auto_33333 ) ( CLEAR ?auto_33330 ) ( not ( = ?auto_33329 ?auto_33333 ) ) ( not ( = ?auto_33330 ?auto_33333 ) ) ( not ( = ?auto_33328 ?auto_33333 ) ) ( IS-CRATE ?auto_33329 ) ( not ( = ?auto_33335 ?auto_33340 ) ) ( not ( = ?auto_33337 ?auto_33335 ) ) ( HOIST-AT ?auto_33339 ?auto_33335 ) ( not ( = ?auto_33336 ?auto_33339 ) ) ( not ( = ?auto_33331 ?auto_33339 ) ) ( AVAILABLE ?auto_33339 ) ( SURFACE-AT ?auto_33329 ?auto_33335 ) ( ON ?auto_33329 ?auto_33338 ) ( CLEAR ?auto_33329 ) ( not ( = ?auto_33329 ?auto_33338 ) ) ( not ( = ?auto_33330 ?auto_33338 ) ) ( not ( = ?auto_33328 ?auto_33338 ) ) ( not ( = ?auto_33333 ?auto_33338 ) ) ( TRUCK-AT ?auto_33334 ?auto_33340 ) ( SURFACE-AT ?auto_33332 ?auto_33340 ) ( CLEAR ?auto_33332 ) ( LIFTING ?auto_33336 ?auto_33328 ) ( IS-CRATE ?auto_33328 ) ( not ( = ?auto_33332 ?auto_33328 ) ) ( not ( = ?auto_33329 ?auto_33332 ) ) ( not ( = ?auto_33330 ?auto_33332 ) ) ( not ( = ?auto_33333 ?auto_33332 ) ) ( not ( = ?auto_33338 ?auto_33332 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33329 ?auto_33330 )
      ( MAKE-2CRATE-VERIFY ?auto_33328 ?auto_33329 ?auto_33330 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33341 - SURFACE
      ?auto_33342 - SURFACE
      ?auto_33343 - SURFACE
      ?auto_33344 - SURFACE
    )
    :vars
    (
      ?auto_33352 - HOIST
      ?auto_33353 - PLACE
      ?auto_33348 - PLACE
      ?auto_33346 - HOIST
      ?auto_33347 - SURFACE
      ?auto_33351 - PLACE
      ?auto_33350 - HOIST
      ?auto_33345 - SURFACE
      ?auto_33349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33352 ?auto_33353 ) ( IS-CRATE ?auto_33344 ) ( not ( = ?auto_33343 ?auto_33344 ) ) ( not ( = ?auto_33342 ?auto_33343 ) ) ( not ( = ?auto_33342 ?auto_33344 ) ) ( not ( = ?auto_33348 ?auto_33353 ) ) ( HOIST-AT ?auto_33346 ?auto_33348 ) ( not ( = ?auto_33352 ?auto_33346 ) ) ( AVAILABLE ?auto_33346 ) ( SURFACE-AT ?auto_33344 ?auto_33348 ) ( ON ?auto_33344 ?auto_33347 ) ( CLEAR ?auto_33344 ) ( not ( = ?auto_33343 ?auto_33347 ) ) ( not ( = ?auto_33344 ?auto_33347 ) ) ( not ( = ?auto_33342 ?auto_33347 ) ) ( IS-CRATE ?auto_33343 ) ( not ( = ?auto_33351 ?auto_33353 ) ) ( not ( = ?auto_33348 ?auto_33351 ) ) ( HOIST-AT ?auto_33350 ?auto_33351 ) ( not ( = ?auto_33352 ?auto_33350 ) ) ( not ( = ?auto_33346 ?auto_33350 ) ) ( AVAILABLE ?auto_33350 ) ( SURFACE-AT ?auto_33343 ?auto_33351 ) ( ON ?auto_33343 ?auto_33345 ) ( CLEAR ?auto_33343 ) ( not ( = ?auto_33343 ?auto_33345 ) ) ( not ( = ?auto_33344 ?auto_33345 ) ) ( not ( = ?auto_33342 ?auto_33345 ) ) ( not ( = ?auto_33347 ?auto_33345 ) ) ( TRUCK-AT ?auto_33349 ?auto_33353 ) ( SURFACE-AT ?auto_33341 ?auto_33353 ) ( CLEAR ?auto_33341 ) ( LIFTING ?auto_33352 ?auto_33342 ) ( IS-CRATE ?auto_33342 ) ( not ( = ?auto_33341 ?auto_33342 ) ) ( not ( = ?auto_33343 ?auto_33341 ) ) ( not ( = ?auto_33344 ?auto_33341 ) ) ( not ( = ?auto_33347 ?auto_33341 ) ) ( not ( = ?auto_33345 ?auto_33341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33342 ?auto_33343 ?auto_33344 )
      ( MAKE-3CRATE-VERIFY ?auto_33341 ?auto_33342 ?auto_33343 ?auto_33344 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33354 - SURFACE
      ?auto_33355 - SURFACE
      ?auto_33356 - SURFACE
      ?auto_33357 - SURFACE
      ?auto_33358 - SURFACE
    )
    :vars
    (
      ?auto_33366 - HOIST
      ?auto_33367 - PLACE
      ?auto_33362 - PLACE
      ?auto_33360 - HOIST
      ?auto_33361 - SURFACE
      ?auto_33365 - PLACE
      ?auto_33364 - HOIST
      ?auto_33359 - SURFACE
      ?auto_33363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33366 ?auto_33367 ) ( IS-CRATE ?auto_33358 ) ( not ( = ?auto_33357 ?auto_33358 ) ) ( not ( = ?auto_33356 ?auto_33357 ) ) ( not ( = ?auto_33356 ?auto_33358 ) ) ( not ( = ?auto_33362 ?auto_33367 ) ) ( HOIST-AT ?auto_33360 ?auto_33362 ) ( not ( = ?auto_33366 ?auto_33360 ) ) ( AVAILABLE ?auto_33360 ) ( SURFACE-AT ?auto_33358 ?auto_33362 ) ( ON ?auto_33358 ?auto_33361 ) ( CLEAR ?auto_33358 ) ( not ( = ?auto_33357 ?auto_33361 ) ) ( not ( = ?auto_33358 ?auto_33361 ) ) ( not ( = ?auto_33356 ?auto_33361 ) ) ( IS-CRATE ?auto_33357 ) ( not ( = ?auto_33365 ?auto_33367 ) ) ( not ( = ?auto_33362 ?auto_33365 ) ) ( HOIST-AT ?auto_33364 ?auto_33365 ) ( not ( = ?auto_33366 ?auto_33364 ) ) ( not ( = ?auto_33360 ?auto_33364 ) ) ( AVAILABLE ?auto_33364 ) ( SURFACE-AT ?auto_33357 ?auto_33365 ) ( ON ?auto_33357 ?auto_33359 ) ( CLEAR ?auto_33357 ) ( not ( = ?auto_33357 ?auto_33359 ) ) ( not ( = ?auto_33358 ?auto_33359 ) ) ( not ( = ?auto_33356 ?auto_33359 ) ) ( not ( = ?auto_33361 ?auto_33359 ) ) ( TRUCK-AT ?auto_33363 ?auto_33367 ) ( SURFACE-AT ?auto_33355 ?auto_33367 ) ( CLEAR ?auto_33355 ) ( LIFTING ?auto_33366 ?auto_33356 ) ( IS-CRATE ?auto_33356 ) ( not ( = ?auto_33355 ?auto_33356 ) ) ( not ( = ?auto_33357 ?auto_33355 ) ) ( not ( = ?auto_33358 ?auto_33355 ) ) ( not ( = ?auto_33361 ?auto_33355 ) ) ( not ( = ?auto_33359 ?auto_33355 ) ) ( ON ?auto_33355 ?auto_33354 ) ( not ( = ?auto_33354 ?auto_33355 ) ) ( not ( = ?auto_33354 ?auto_33356 ) ) ( not ( = ?auto_33354 ?auto_33357 ) ) ( not ( = ?auto_33354 ?auto_33358 ) ) ( not ( = ?auto_33354 ?auto_33361 ) ) ( not ( = ?auto_33354 ?auto_33359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33356 ?auto_33357 ?auto_33358 )
      ( MAKE-4CRATE-VERIFY ?auto_33354 ?auto_33355 ?auto_33356 ?auto_33357 ?auto_33358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33368 - SURFACE
      ?auto_33369 - SURFACE
    )
    :vars
    (
      ?auto_33379 - HOIST
      ?auto_33380 - PLACE
      ?auto_33378 - SURFACE
      ?auto_33373 - PLACE
      ?auto_33371 - HOIST
      ?auto_33372 - SURFACE
      ?auto_33377 - PLACE
      ?auto_33375 - HOIST
      ?auto_33370 - SURFACE
      ?auto_33374 - TRUCK
      ?auto_33376 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33379 ?auto_33380 ) ( IS-CRATE ?auto_33369 ) ( not ( = ?auto_33368 ?auto_33369 ) ) ( not ( = ?auto_33378 ?auto_33368 ) ) ( not ( = ?auto_33378 ?auto_33369 ) ) ( not ( = ?auto_33373 ?auto_33380 ) ) ( HOIST-AT ?auto_33371 ?auto_33373 ) ( not ( = ?auto_33379 ?auto_33371 ) ) ( AVAILABLE ?auto_33371 ) ( SURFACE-AT ?auto_33369 ?auto_33373 ) ( ON ?auto_33369 ?auto_33372 ) ( CLEAR ?auto_33369 ) ( not ( = ?auto_33368 ?auto_33372 ) ) ( not ( = ?auto_33369 ?auto_33372 ) ) ( not ( = ?auto_33378 ?auto_33372 ) ) ( IS-CRATE ?auto_33368 ) ( not ( = ?auto_33377 ?auto_33380 ) ) ( not ( = ?auto_33373 ?auto_33377 ) ) ( HOIST-AT ?auto_33375 ?auto_33377 ) ( not ( = ?auto_33379 ?auto_33375 ) ) ( not ( = ?auto_33371 ?auto_33375 ) ) ( AVAILABLE ?auto_33375 ) ( SURFACE-AT ?auto_33368 ?auto_33377 ) ( ON ?auto_33368 ?auto_33370 ) ( CLEAR ?auto_33368 ) ( not ( = ?auto_33368 ?auto_33370 ) ) ( not ( = ?auto_33369 ?auto_33370 ) ) ( not ( = ?auto_33378 ?auto_33370 ) ) ( not ( = ?auto_33372 ?auto_33370 ) ) ( TRUCK-AT ?auto_33374 ?auto_33380 ) ( SURFACE-AT ?auto_33376 ?auto_33380 ) ( CLEAR ?auto_33376 ) ( IS-CRATE ?auto_33378 ) ( not ( = ?auto_33376 ?auto_33378 ) ) ( not ( = ?auto_33368 ?auto_33376 ) ) ( not ( = ?auto_33369 ?auto_33376 ) ) ( not ( = ?auto_33372 ?auto_33376 ) ) ( not ( = ?auto_33370 ?auto_33376 ) ) ( AVAILABLE ?auto_33379 ) ( IN ?auto_33378 ?auto_33374 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33379 ?auto_33378 ?auto_33374 ?auto_33380 )
      ( MAKE-2CRATE ?auto_33378 ?auto_33368 ?auto_33369 )
      ( MAKE-1CRATE-VERIFY ?auto_33368 ?auto_33369 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33381 - SURFACE
      ?auto_33382 - SURFACE
      ?auto_33383 - SURFACE
    )
    :vars
    (
      ?auto_33386 - HOIST
      ?auto_33390 - PLACE
      ?auto_33389 - PLACE
      ?auto_33392 - HOIST
      ?auto_33385 - SURFACE
      ?auto_33387 - PLACE
      ?auto_33393 - HOIST
      ?auto_33391 - SURFACE
      ?auto_33384 - TRUCK
      ?auto_33388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33386 ?auto_33390 ) ( IS-CRATE ?auto_33383 ) ( not ( = ?auto_33382 ?auto_33383 ) ) ( not ( = ?auto_33381 ?auto_33382 ) ) ( not ( = ?auto_33381 ?auto_33383 ) ) ( not ( = ?auto_33389 ?auto_33390 ) ) ( HOIST-AT ?auto_33392 ?auto_33389 ) ( not ( = ?auto_33386 ?auto_33392 ) ) ( AVAILABLE ?auto_33392 ) ( SURFACE-AT ?auto_33383 ?auto_33389 ) ( ON ?auto_33383 ?auto_33385 ) ( CLEAR ?auto_33383 ) ( not ( = ?auto_33382 ?auto_33385 ) ) ( not ( = ?auto_33383 ?auto_33385 ) ) ( not ( = ?auto_33381 ?auto_33385 ) ) ( IS-CRATE ?auto_33382 ) ( not ( = ?auto_33387 ?auto_33390 ) ) ( not ( = ?auto_33389 ?auto_33387 ) ) ( HOIST-AT ?auto_33393 ?auto_33387 ) ( not ( = ?auto_33386 ?auto_33393 ) ) ( not ( = ?auto_33392 ?auto_33393 ) ) ( AVAILABLE ?auto_33393 ) ( SURFACE-AT ?auto_33382 ?auto_33387 ) ( ON ?auto_33382 ?auto_33391 ) ( CLEAR ?auto_33382 ) ( not ( = ?auto_33382 ?auto_33391 ) ) ( not ( = ?auto_33383 ?auto_33391 ) ) ( not ( = ?auto_33381 ?auto_33391 ) ) ( not ( = ?auto_33385 ?auto_33391 ) ) ( TRUCK-AT ?auto_33384 ?auto_33390 ) ( SURFACE-AT ?auto_33388 ?auto_33390 ) ( CLEAR ?auto_33388 ) ( IS-CRATE ?auto_33381 ) ( not ( = ?auto_33388 ?auto_33381 ) ) ( not ( = ?auto_33382 ?auto_33388 ) ) ( not ( = ?auto_33383 ?auto_33388 ) ) ( not ( = ?auto_33385 ?auto_33388 ) ) ( not ( = ?auto_33391 ?auto_33388 ) ) ( AVAILABLE ?auto_33386 ) ( IN ?auto_33381 ?auto_33384 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33382 ?auto_33383 )
      ( MAKE-2CRATE-VERIFY ?auto_33381 ?auto_33382 ?auto_33383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33394 - SURFACE
      ?auto_33395 - SURFACE
      ?auto_33396 - SURFACE
      ?auto_33397 - SURFACE
    )
    :vars
    (
      ?auto_33399 - HOIST
      ?auto_33401 - PLACE
      ?auto_33403 - PLACE
      ?auto_33400 - HOIST
      ?auto_33406 - SURFACE
      ?auto_33404 - PLACE
      ?auto_33398 - HOIST
      ?auto_33405 - SURFACE
      ?auto_33402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33399 ?auto_33401 ) ( IS-CRATE ?auto_33397 ) ( not ( = ?auto_33396 ?auto_33397 ) ) ( not ( = ?auto_33395 ?auto_33396 ) ) ( not ( = ?auto_33395 ?auto_33397 ) ) ( not ( = ?auto_33403 ?auto_33401 ) ) ( HOIST-AT ?auto_33400 ?auto_33403 ) ( not ( = ?auto_33399 ?auto_33400 ) ) ( AVAILABLE ?auto_33400 ) ( SURFACE-AT ?auto_33397 ?auto_33403 ) ( ON ?auto_33397 ?auto_33406 ) ( CLEAR ?auto_33397 ) ( not ( = ?auto_33396 ?auto_33406 ) ) ( not ( = ?auto_33397 ?auto_33406 ) ) ( not ( = ?auto_33395 ?auto_33406 ) ) ( IS-CRATE ?auto_33396 ) ( not ( = ?auto_33404 ?auto_33401 ) ) ( not ( = ?auto_33403 ?auto_33404 ) ) ( HOIST-AT ?auto_33398 ?auto_33404 ) ( not ( = ?auto_33399 ?auto_33398 ) ) ( not ( = ?auto_33400 ?auto_33398 ) ) ( AVAILABLE ?auto_33398 ) ( SURFACE-AT ?auto_33396 ?auto_33404 ) ( ON ?auto_33396 ?auto_33405 ) ( CLEAR ?auto_33396 ) ( not ( = ?auto_33396 ?auto_33405 ) ) ( not ( = ?auto_33397 ?auto_33405 ) ) ( not ( = ?auto_33395 ?auto_33405 ) ) ( not ( = ?auto_33406 ?auto_33405 ) ) ( TRUCK-AT ?auto_33402 ?auto_33401 ) ( SURFACE-AT ?auto_33394 ?auto_33401 ) ( CLEAR ?auto_33394 ) ( IS-CRATE ?auto_33395 ) ( not ( = ?auto_33394 ?auto_33395 ) ) ( not ( = ?auto_33396 ?auto_33394 ) ) ( not ( = ?auto_33397 ?auto_33394 ) ) ( not ( = ?auto_33406 ?auto_33394 ) ) ( not ( = ?auto_33405 ?auto_33394 ) ) ( AVAILABLE ?auto_33399 ) ( IN ?auto_33395 ?auto_33402 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33395 ?auto_33396 ?auto_33397 )
      ( MAKE-3CRATE-VERIFY ?auto_33394 ?auto_33395 ?auto_33396 ?auto_33397 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33407 - SURFACE
      ?auto_33408 - SURFACE
      ?auto_33409 - SURFACE
      ?auto_33410 - SURFACE
      ?auto_33411 - SURFACE
    )
    :vars
    (
      ?auto_33413 - HOIST
      ?auto_33415 - PLACE
      ?auto_33417 - PLACE
      ?auto_33414 - HOIST
      ?auto_33420 - SURFACE
      ?auto_33418 - PLACE
      ?auto_33412 - HOIST
      ?auto_33419 - SURFACE
      ?auto_33416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33413 ?auto_33415 ) ( IS-CRATE ?auto_33411 ) ( not ( = ?auto_33410 ?auto_33411 ) ) ( not ( = ?auto_33409 ?auto_33410 ) ) ( not ( = ?auto_33409 ?auto_33411 ) ) ( not ( = ?auto_33417 ?auto_33415 ) ) ( HOIST-AT ?auto_33414 ?auto_33417 ) ( not ( = ?auto_33413 ?auto_33414 ) ) ( AVAILABLE ?auto_33414 ) ( SURFACE-AT ?auto_33411 ?auto_33417 ) ( ON ?auto_33411 ?auto_33420 ) ( CLEAR ?auto_33411 ) ( not ( = ?auto_33410 ?auto_33420 ) ) ( not ( = ?auto_33411 ?auto_33420 ) ) ( not ( = ?auto_33409 ?auto_33420 ) ) ( IS-CRATE ?auto_33410 ) ( not ( = ?auto_33418 ?auto_33415 ) ) ( not ( = ?auto_33417 ?auto_33418 ) ) ( HOIST-AT ?auto_33412 ?auto_33418 ) ( not ( = ?auto_33413 ?auto_33412 ) ) ( not ( = ?auto_33414 ?auto_33412 ) ) ( AVAILABLE ?auto_33412 ) ( SURFACE-AT ?auto_33410 ?auto_33418 ) ( ON ?auto_33410 ?auto_33419 ) ( CLEAR ?auto_33410 ) ( not ( = ?auto_33410 ?auto_33419 ) ) ( not ( = ?auto_33411 ?auto_33419 ) ) ( not ( = ?auto_33409 ?auto_33419 ) ) ( not ( = ?auto_33420 ?auto_33419 ) ) ( TRUCK-AT ?auto_33416 ?auto_33415 ) ( SURFACE-AT ?auto_33408 ?auto_33415 ) ( CLEAR ?auto_33408 ) ( IS-CRATE ?auto_33409 ) ( not ( = ?auto_33408 ?auto_33409 ) ) ( not ( = ?auto_33410 ?auto_33408 ) ) ( not ( = ?auto_33411 ?auto_33408 ) ) ( not ( = ?auto_33420 ?auto_33408 ) ) ( not ( = ?auto_33419 ?auto_33408 ) ) ( AVAILABLE ?auto_33413 ) ( IN ?auto_33409 ?auto_33416 ) ( ON ?auto_33408 ?auto_33407 ) ( not ( = ?auto_33407 ?auto_33408 ) ) ( not ( = ?auto_33407 ?auto_33409 ) ) ( not ( = ?auto_33407 ?auto_33410 ) ) ( not ( = ?auto_33407 ?auto_33411 ) ) ( not ( = ?auto_33407 ?auto_33420 ) ) ( not ( = ?auto_33407 ?auto_33419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33409 ?auto_33410 ?auto_33411 )
      ( MAKE-4CRATE-VERIFY ?auto_33407 ?auto_33408 ?auto_33409 ?auto_33410 ?auto_33411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33421 - SURFACE
      ?auto_33422 - SURFACE
    )
    :vars
    (
      ?auto_33424 - HOIST
      ?auto_33426 - PLACE
      ?auto_33428 - SURFACE
      ?auto_33429 - PLACE
      ?auto_33425 - HOIST
      ?auto_33433 - SURFACE
      ?auto_33430 - PLACE
      ?auto_33423 - HOIST
      ?auto_33431 - SURFACE
      ?auto_33432 - SURFACE
      ?auto_33427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33424 ?auto_33426 ) ( IS-CRATE ?auto_33422 ) ( not ( = ?auto_33421 ?auto_33422 ) ) ( not ( = ?auto_33428 ?auto_33421 ) ) ( not ( = ?auto_33428 ?auto_33422 ) ) ( not ( = ?auto_33429 ?auto_33426 ) ) ( HOIST-AT ?auto_33425 ?auto_33429 ) ( not ( = ?auto_33424 ?auto_33425 ) ) ( AVAILABLE ?auto_33425 ) ( SURFACE-AT ?auto_33422 ?auto_33429 ) ( ON ?auto_33422 ?auto_33433 ) ( CLEAR ?auto_33422 ) ( not ( = ?auto_33421 ?auto_33433 ) ) ( not ( = ?auto_33422 ?auto_33433 ) ) ( not ( = ?auto_33428 ?auto_33433 ) ) ( IS-CRATE ?auto_33421 ) ( not ( = ?auto_33430 ?auto_33426 ) ) ( not ( = ?auto_33429 ?auto_33430 ) ) ( HOIST-AT ?auto_33423 ?auto_33430 ) ( not ( = ?auto_33424 ?auto_33423 ) ) ( not ( = ?auto_33425 ?auto_33423 ) ) ( AVAILABLE ?auto_33423 ) ( SURFACE-AT ?auto_33421 ?auto_33430 ) ( ON ?auto_33421 ?auto_33431 ) ( CLEAR ?auto_33421 ) ( not ( = ?auto_33421 ?auto_33431 ) ) ( not ( = ?auto_33422 ?auto_33431 ) ) ( not ( = ?auto_33428 ?auto_33431 ) ) ( not ( = ?auto_33433 ?auto_33431 ) ) ( SURFACE-AT ?auto_33432 ?auto_33426 ) ( CLEAR ?auto_33432 ) ( IS-CRATE ?auto_33428 ) ( not ( = ?auto_33432 ?auto_33428 ) ) ( not ( = ?auto_33421 ?auto_33432 ) ) ( not ( = ?auto_33422 ?auto_33432 ) ) ( not ( = ?auto_33433 ?auto_33432 ) ) ( not ( = ?auto_33431 ?auto_33432 ) ) ( AVAILABLE ?auto_33424 ) ( IN ?auto_33428 ?auto_33427 ) ( TRUCK-AT ?auto_33427 ?auto_33430 ) )
    :subtasks
    ( ( !DRIVE ?auto_33427 ?auto_33430 ?auto_33426 )
      ( MAKE-2CRATE ?auto_33428 ?auto_33421 ?auto_33422 )
      ( MAKE-1CRATE-VERIFY ?auto_33421 ?auto_33422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33434 - SURFACE
      ?auto_33435 - SURFACE
      ?auto_33436 - SURFACE
    )
    :vars
    (
      ?auto_33442 - HOIST
      ?auto_33439 - PLACE
      ?auto_33440 - PLACE
      ?auto_33441 - HOIST
      ?auto_33446 - SURFACE
      ?auto_33438 - PLACE
      ?auto_33445 - HOIST
      ?auto_33437 - SURFACE
      ?auto_33443 - SURFACE
      ?auto_33444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33442 ?auto_33439 ) ( IS-CRATE ?auto_33436 ) ( not ( = ?auto_33435 ?auto_33436 ) ) ( not ( = ?auto_33434 ?auto_33435 ) ) ( not ( = ?auto_33434 ?auto_33436 ) ) ( not ( = ?auto_33440 ?auto_33439 ) ) ( HOIST-AT ?auto_33441 ?auto_33440 ) ( not ( = ?auto_33442 ?auto_33441 ) ) ( AVAILABLE ?auto_33441 ) ( SURFACE-AT ?auto_33436 ?auto_33440 ) ( ON ?auto_33436 ?auto_33446 ) ( CLEAR ?auto_33436 ) ( not ( = ?auto_33435 ?auto_33446 ) ) ( not ( = ?auto_33436 ?auto_33446 ) ) ( not ( = ?auto_33434 ?auto_33446 ) ) ( IS-CRATE ?auto_33435 ) ( not ( = ?auto_33438 ?auto_33439 ) ) ( not ( = ?auto_33440 ?auto_33438 ) ) ( HOIST-AT ?auto_33445 ?auto_33438 ) ( not ( = ?auto_33442 ?auto_33445 ) ) ( not ( = ?auto_33441 ?auto_33445 ) ) ( AVAILABLE ?auto_33445 ) ( SURFACE-AT ?auto_33435 ?auto_33438 ) ( ON ?auto_33435 ?auto_33437 ) ( CLEAR ?auto_33435 ) ( not ( = ?auto_33435 ?auto_33437 ) ) ( not ( = ?auto_33436 ?auto_33437 ) ) ( not ( = ?auto_33434 ?auto_33437 ) ) ( not ( = ?auto_33446 ?auto_33437 ) ) ( SURFACE-AT ?auto_33443 ?auto_33439 ) ( CLEAR ?auto_33443 ) ( IS-CRATE ?auto_33434 ) ( not ( = ?auto_33443 ?auto_33434 ) ) ( not ( = ?auto_33435 ?auto_33443 ) ) ( not ( = ?auto_33436 ?auto_33443 ) ) ( not ( = ?auto_33446 ?auto_33443 ) ) ( not ( = ?auto_33437 ?auto_33443 ) ) ( AVAILABLE ?auto_33442 ) ( IN ?auto_33434 ?auto_33444 ) ( TRUCK-AT ?auto_33444 ?auto_33438 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33435 ?auto_33436 )
      ( MAKE-2CRATE-VERIFY ?auto_33434 ?auto_33435 ?auto_33436 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33447 - SURFACE
      ?auto_33448 - SURFACE
      ?auto_33449 - SURFACE
      ?auto_33450 - SURFACE
    )
    :vars
    (
      ?auto_33454 - HOIST
      ?auto_33458 - PLACE
      ?auto_33457 - PLACE
      ?auto_33459 - HOIST
      ?auto_33455 - SURFACE
      ?auto_33452 - PLACE
      ?auto_33451 - HOIST
      ?auto_33456 - SURFACE
      ?auto_33453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33454 ?auto_33458 ) ( IS-CRATE ?auto_33450 ) ( not ( = ?auto_33449 ?auto_33450 ) ) ( not ( = ?auto_33448 ?auto_33449 ) ) ( not ( = ?auto_33448 ?auto_33450 ) ) ( not ( = ?auto_33457 ?auto_33458 ) ) ( HOIST-AT ?auto_33459 ?auto_33457 ) ( not ( = ?auto_33454 ?auto_33459 ) ) ( AVAILABLE ?auto_33459 ) ( SURFACE-AT ?auto_33450 ?auto_33457 ) ( ON ?auto_33450 ?auto_33455 ) ( CLEAR ?auto_33450 ) ( not ( = ?auto_33449 ?auto_33455 ) ) ( not ( = ?auto_33450 ?auto_33455 ) ) ( not ( = ?auto_33448 ?auto_33455 ) ) ( IS-CRATE ?auto_33449 ) ( not ( = ?auto_33452 ?auto_33458 ) ) ( not ( = ?auto_33457 ?auto_33452 ) ) ( HOIST-AT ?auto_33451 ?auto_33452 ) ( not ( = ?auto_33454 ?auto_33451 ) ) ( not ( = ?auto_33459 ?auto_33451 ) ) ( AVAILABLE ?auto_33451 ) ( SURFACE-AT ?auto_33449 ?auto_33452 ) ( ON ?auto_33449 ?auto_33456 ) ( CLEAR ?auto_33449 ) ( not ( = ?auto_33449 ?auto_33456 ) ) ( not ( = ?auto_33450 ?auto_33456 ) ) ( not ( = ?auto_33448 ?auto_33456 ) ) ( not ( = ?auto_33455 ?auto_33456 ) ) ( SURFACE-AT ?auto_33447 ?auto_33458 ) ( CLEAR ?auto_33447 ) ( IS-CRATE ?auto_33448 ) ( not ( = ?auto_33447 ?auto_33448 ) ) ( not ( = ?auto_33449 ?auto_33447 ) ) ( not ( = ?auto_33450 ?auto_33447 ) ) ( not ( = ?auto_33455 ?auto_33447 ) ) ( not ( = ?auto_33456 ?auto_33447 ) ) ( AVAILABLE ?auto_33454 ) ( IN ?auto_33448 ?auto_33453 ) ( TRUCK-AT ?auto_33453 ?auto_33452 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33448 ?auto_33449 ?auto_33450 )
      ( MAKE-3CRATE-VERIFY ?auto_33447 ?auto_33448 ?auto_33449 ?auto_33450 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33460 - SURFACE
      ?auto_33461 - SURFACE
      ?auto_33462 - SURFACE
      ?auto_33463 - SURFACE
      ?auto_33464 - SURFACE
    )
    :vars
    (
      ?auto_33468 - HOIST
      ?auto_33472 - PLACE
      ?auto_33471 - PLACE
      ?auto_33473 - HOIST
      ?auto_33469 - SURFACE
      ?auto_33466 - PLACE
      ?auto_33465 - HOIST
      ?auto_33470 - SURFACE
      ?auto_33467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33468 ?auto_33472 ) ( IS-CRATE ?auto_33464 ) ( not ( = ?auto_33463 ?auto_33464 ) ) ( not ( = ?auto_33462 ?auto_33463 ) ) ( not ( = ?auto_33462 ?auto_33464 ) ) ( not ( = ?auto_33471 ?auto_33472 ) ) ( HOIST-AT ?auto_33473 ?auto_33471 ) ( not ( = ?auto_33468 ?auto_33473 ) ) ( AVAILABLE ?auto_33473 ) ( SURFACE-AT ?auto_33464 ?auto_33471 ) ( ON ?auto_33464 ?auto_33469 ) ( CLEAR ?auto_33464 ) ( not ( = ?auto_33463 ?auto_33469 ) ) ( not ( = ?auto_33464 ?auto_33469 ) ) ( not ( = ?auto_33462 ?auto_33469 ) ) ( IS-CRATE ?auto_33463 ) ( not ( = ?auto_33466 ?auto_33472 ) ) ( not ( = ?auto_33471 ?auto_33466 ) ) ( HOIST-AT ?auto_33465 ?auto_33466 ) ( not ( = ?auto_33468 ?auto_33465 ) ) ( not ( = ?auto_33473 ?auto_33465 ) ) ( AVAILABLE ?auto_33465 ) ( SURFACE-AT ?auto_33463 ?auto_33466 ) ( ON ?auto_33463 ?auto_33470 ) ( CLEAR ?auto_33463 ) ( not ( = ?auto_33463 ?auto_33470 ) ) ( not ( = ?auto_33464 ?auto_33470 ) ) ( not ( = ?auto_33462 ?auto_33470 ) ) ( not ( = ?auto_33469 ?auto_33470 ) ) ( SURFACE-AT ?auto_33461 ?auto_33472 ) ( CLEAR ?auto_33461 ) ( IS-CRATE ?auto_33462 ) ( not ( = ?auto_33461 ?auto_33462 ) ) ( not ( = ?auto_33463 ?auto_33461 ) ) ( not ( = ?auto_33464 ?auto_33461 ) ) ( not ( = ?auto_33469 ?auto_33461 ) ) ( not ( = ?auto_33470 ?auto_33461 ) ) ( AVAILABLE ?auto_33468 ) ( IN ?auto_33462 ?auto_33467 ) ( TRUCK-AT ?auto_33467 ?auto_33466 ) ( ON ?auto_33461 ?auto_33460 ) ( not ( = ?auto_33460 ?auto_33461 ) ) ( not ( = ?auto_33460 ?auto_33462 ) ) ( not ( = ?auto_33460 ?auto_33463 ) ) ( not ( = ?auto_33460 ?auto_33464 ) ) ( not ( = ?auto_33460 ?auto_33469 ) ) ( not ( = ?auto_33460 ?auto_33470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33462 ?auto_33463 ?auto_33464 )
      ( MAKE-4CRATE-VERIFY ?auto_33460 ?auto_33461 ?auto_33462 ?auto_33463 ?auto_33464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33474 - SURFACE
      ?auto_33475 - SURFACE
    )
    :vars
    (
      ?auto_33480 - HOIST
      ?auto_33485 - PLACE
      ?auto_33478 - SURFACE
      ?auto_33484 - PLACE
      ?auto_33486 - HOIST
      ?auto_33481 - SURFACE
      ?auto_33477 - PLACE
      ?auto_33476 - HOIST
      ?auto_33483 - SURFACE
      ?auto_33482 - SURFACE
      ?auto_33479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33480 ?auto_33485 ) ( IS-CRATE ?auto_33475 ) ( not ( = ?auto_33474 ?auto_33475 ) ) ( not ( = ?auto_33478 ?auto_33474 ) ) ( not ( = ?auto_33478 ?auto_33475 ) ) ( not ( = ?auto_33484 ?auto_33485 ) ) ( HOIST-AT ?auto_33486 ?auto_33484 ) ( not ( = ?auto_33480 ?auto_33486 ) ) ( AVAILABLE ?auto_33486 ) ( SURFACE-AT ?auto_33475 ?auto_33484 ) ( ON ?auto_33475 ?auto_33481 ) ( CLEAR ?auto_33475 ) ( not ( = ?auto_33474 ?auto_33481 ) ) ( not ( = ?auto_33475 ?auto_33481 ) ) ( not ( = ?auto_33478 ?auto_33481 ) ) ( IS-CRATE ?auto_33474 ) ( not ( = ?auto_33477 ?auto_33485 ) ) ( not ( = ?auto_33484 ?auto_33477 ) ) ( HOIST-AT ?auto_33476 ?auto_33477 ) ( not ( = ?auto_33480 ?auto_33476 ) ) ( not ( = ?auto_33486 ?auto_33476 ) ) ( SURFACE-AT ?auto_33474 ?auto_33477 ) ( ON ?auto_33474 ?auto_33483 ) ( CLEAR ?auto_33474 ) ( not ( = ?auto_33474 ?auto_33483 ) ) ( not ( = ?auto_33475 ?auto_33483 ) ) ( not ( = ?auto_33478 ?auto_33483 ) ) ( not ( = ?auto_33481 ?auto_33483 ) ) ( SURFACE-AT ?auto_33482 ?auto_33485 ) ( CLEAR ?auto_33482 ) ( IS-CRATE ?auto_33478 ) ( not ( = ?auto_33482 ?auto_33478 ) ) ( not ( = ?auto_33474 ?auto_33482 ) ) ( not ( = ?auto_33475 ?auto_33482 ) ) ( not ( = ?auto_33481 ?auto_33482 ) ) ( not ( = ?auto_33483 ?auto_33482 ) ) ( AVAILABLE ?auto_33480 ) ( TRUCK-AT ?auto_33479 ?auto_33477 ) ( LIFTING ?auto_33476 ?auto_33478 ) )
    :subtasks
    ( ( !LOAD ?auto_33476 ?auto_33478 ?auto_33479 ?auto_33477 )
      ( MAKE-2CRATE ?auto_33478 ?auto_33474 ?auto_33475 )
      ( MAKE-1CRATE-VERIFY ?auto_33474 ?auto_33475 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33487 - SURFACE
      ?auto_33488 - SURFACE
      ?auto_33489 - SURFACE
    )
    :vars
    (
      ?auto_33499 - HOIST
      ?auto_33492 - PLACE
      ?auto_33493 - PLACE
      ?auto_33496 - HOIST
      ?auto_33490 - SURFACE
      ?auto_33494 - PLACE
      ?auto_33491 - HOIST
      ?auto_33495 - SURFACE
      ?auto_33498 - SURFACE
      ?auto_33497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33499 ?auto_33492 ) ( IS-CRATE ?auto_33489 ) ( not ( = ?auto_33488 ?auto_33489 ) ) ( not ( = ?auto_33487 ?auto_33488 ) ) ( not ( = ?auto_33487 ?auto_33489 ) ) ( not ( = ?auto_33493 ?auto_33492 ) ) ( HOIST-AT ?auto_33496 ?auto_33493 ) ( not ( = ?auto_33499 ?auto_33496 ) ) ( AVAILABLE ?auto_33496 ) ( SURFACE-AT ?auto_33489 ?auto_33493 ) ( ON ?auto_33489 ?auto_33490 ) ( CLEAR ?auto_33489 ) ( not ( = ?auto_33488 ?auto_33490 ) ) ( not ( = ?auto_33489 ?auto_33490 ) ) ( not ( = ?auto_33487 ?auto_33490 ) ) ( IS-CRATE ?auto_33488 ) ( not ( = ?auto_33494 ?auto_33492 ) ) ( not ( = ?auto_33493 ?auto_33494 ) ) ( HOIST-AT ?auto_33491 ?auto_33494 ) ( not ( = ?auto_33499 ?auto_33491 ) ) ( not ( = ?auto_33496 ?auto_33491 ) ) ( SURFACE-AT ?auto_33488 ?auto_33494 ) ( ON ?auto_33488 ?auto_33495 ) ( CLEAR ?auto_33488 ) ( not ( = ?auto_33488 ?auto_33495 ) ) ( not ( = ?auto_33489 ?auto_33495 ) ) ( not ( = ?auto_33487 ?auto_33495 ) ) ( not ( = ?auto_33490 ?auto_33495 ) ) ( SURFACE-AT ?auto_33498 ?auto_33492 ) ( CLEAR ?auto_33498 ) ( IS-CRATE ?auto_33487 ) ( not ( = ?auto_33498 ?auto_33487 ) ) ( not ( = ?auto_33488 ?auto_33498 ) ) ( not ( = ?auto_33489 ?auto_33498 ) ) ( not ( = ?auto_33490 ?auto_33498 ) ) ( not ( = ?auto_33495 ?auto_33498 ) ) ( AVAILABLE ?auto_33499 ) ( TRUCK-AT ?auto_33497 ?auto_33494 ) ( LIFTING ?auto_33491 ?auto_33487 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33488 ?auto_33489 )
      ( MAKE-2CRATE-VERIFY ?auto_33487 ?auto_33488 ?auto_33489 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33500 - SURFACE
      ?auto_33501 - SURFACE
      ?auto_33502 - SURFACE
      ?auto_33503 - SURFACE
    )
    :vars
    (
      ?auto_33506 - HOIST
      ?auto_33508 - PLACE
      ?auto_33504 - PLACE
      ?auto_33510 - HOIST
      ?auto_33511 - SURFACE
      ?auto_33512 - PLACE
      ?auto_33507 - HOIST
      ?auto_33505 - SURFACE
      ?auto_33509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33506 ?auto_33508 ) ( IS-CRATE ?auto_33503 ) ( not ( = ?auto_33502 ?auto_33503 ) ) ( not ( = ?auto_33501 ?auto_33502 ) ) ( not ( = ?auto_33501 ?auto_33503 ) ) ( not ( = ?auto_33504 ?auto_33508 ) ) ( HOIST-AT ?auto_33510 ?auto_33504 ) ( not ( = ?auto_33506 ?auto_33510 ) ) ( AVAILABLE ?auto_33510 ) ( SURFACE-AT ?auto_33503 ?auto_33504 ) ( ON ?auto_33503 ?auto_33511 ) ( CLEAR ?auto_33503 ) ( not ( = ?auto_33502 ?auto_33511 ) ) ( not ( = ?auto_33503 ?auto_33511 ) ) ( not ( = ?auto_33501 ?auto_33511 ) ) ( IS-CRATE ?auto_33502 ) ( not ( = ?auto_33512 ?auto_33508 ) ) ( not ( = ?auto_33504 ?auto_33512 ) ) ( HOIST-AT ?auto_33507 ?auto_33512 ) ( not ( = ?auto_33506 ?auto_33507 ) ) ( not ( = ?auto_33510 ?auto_33507 ) ) ( SURFACE-AT ?auto_33502 ?auto_33512 ) ( ON ?auto_33502 ?auto_33505 ) ( CLEAR ?auto_33502 ) ( not ( = ?auto_33502 ?auto_33505 ) ) ( not ( = ?auto_33503 ?auto_33505 ) ) ( not ( = ?auto_33501 ?auto_33505 ) ) ( not ( = ?auto_33511 ?auto_33505 ) ) ( SURFACE-AT ?auto_33500 ?auto_33508 ) ( CLEAR ?auto_33500 ) ( IS-CRATE ?auto_33501 ) ( not ( = ?auto_33500 ?auto_33501 ) ) ( not ( = ?auto_33502 ?auto_33500 ) ) ( not ( = ?auto_33503 ?auto_33500 ) ) ( not ( = ?auto_33511 ?auto_33500 ) ) ( not ( = ?auto_33505 ?auto_33500 ) ) ( AVAILABLE ?auto_33506 ) ( TRUCK-AT ?auto_33509 ?auto_33512 ) ( LIFTING ?auto_33507 ?auto_33501 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33501 ?auto_33502 ?auto_33503 )
      ( MAKE-3CRATE-VERIFY ?auto_33500 ?auto_33501 ?auto_33502 ?auto_33503 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33513 - SURFACE
      ?auto_33514 - SURFACE
      ?auto_33515 - SURFACE
      ?auto_33516 - SURFACE
      ?auto_33517 - SURFACE
    )
    :vars
    (
      ?auto_33520 - HOIST
      ?auto_33522 - PLACE
      ?auto_33518 - PLACE
      ?auto_33524 - HOIST
      ?auto_33525 - SURFACE
      ?auto_33526 - PLACE
      ?auto_33521 - HOIST
      ?auto_33519 - SURFACE
      ?auto_33523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33520 ?auto_33522 ) ( IS-CRATE ?auto_33517 ) ( not ( = ?auto_33516 ?auto_33517 ) ) ( not ( = ?auto_33515 ?auto_33516 ) ) ( not ( = ?auto_33515 ?auto_33517 ) ) ( not ( = ?auto_33518 ?auto_33522 ) ) ( HOIST-AT ?auto_33524 ?auto_33518 ) ( not ( = ?auto_33520 ?auto_33524 ) ) ( AVAILABLE ?auto_33524 ) ( SURFACE-AT ?auto_33517 ?auto_33518 ) ( ON ?auto_33517 ?auto_33525 ) ( CLEAR ?auto_33517 ) ( not ( = ?auto_33516 ?auto_33525 ) ) ( not ( = ?auto_33517 ?auto_33525 ) ) ( not ( = ?auto_33515 ?auto_33525 ) ) ( IS-CRATE ?auto_33516 ) ( not ( = ?auto_33526 ?auto_33522 ) ) ( not ( = ?auto_33518 ?auto_33526 ) ) ( HOIST-AT ?auto_33521 ?auto_33526 ) ( not ( = ?auto_33520 ?auto_33521 ) ) ( not ( = ?auto_33524 ?auto_33521 ) ) ( SURFACE-AT ?auto_33516 ?auto_33526 ) ( ON ?auto_33516 ?auto_33519 ) ( CLEAR ?auto_33516 ) ( not ( = ?auto_33516 ?auto_33519 ) ) ( not ( = ?auto_33517 ?auto_33519 ) ) ( not ( = ?auto_33515 ?auto_33519 ) ) ( not ( = ?auto_33525 ?auto_33519 ) ) ( SURFACE-AT ?auto_33514 ?auto_33522 ) ( CLEAR ?auto_33514 ) ( IS-CRATE ?auto_33515 ) ( not ( = ?auto_33514 ?auto_33515 ) ) ( not ( = ?auto_33516 ?auto_33514 ) ) ( not ( = ?auto_33517 ?auto_33514 ) ) ( not ( = ?auto_33525 ?auto_33514 ) ) ( not ( = ?auto_33519 ?auto_33514 ) ) ( AVAILABLE ?auto_33520 ) ( TRUCK-AT ?auto_33523 ?auto_33526 ) ( LIFTING ?auto_33521 ?auto_33515 ) ( ON ?auto_33514 ?auto_33513 ) ( not ( = ?auto_33513 ?auto_33514 ) ) ( not ( = ?auto_33513 ?auto_33515 ) ) ( not ( = ?auto_33513 ?auto_33516 ) ) ( not ( = ?auto_33513 ?auto_33517 ) ) ( not ( = ?auto_33513 ?auto_33525 ) ) ( not ( = ?auto_33513 ?auto_33519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33515 ?auto_33516 ?auto_33517 )
      ( MAKE-4CRATE-VERIFY ?auto_33513 ?auto_33514 ?auto_33515 ?auto_33516 ?auto_33517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33527 - SURFACE
      ?auto_33528 - SURFACE
    )
    :vars
    (
      ?auto_33531 - HOIST
      ?auto_33535 - PLACE
      ?auto_33532 - SURFACE
      ?auto_33529 - PLACE
      ?auto_33537 - HOIST
      ?auto_33538 - SURFACE
      ?auto_33539 - PLACE
      ?auto_33533 - HOIST
      ?auto_33530 - SURFACE
      ?auto_33534 - SURFACE
      ?auto_33536 - TRUCK
      ?auto_33540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33531 ?auto_33535 ) ( IS-CRATE ?auto_33528 ) ( not ( = ?auto_33527 ?auto_33528 ) ) ( not ( = ?auto_33532 ?auto_33527 ) ) ( not ( = ?auto_33532 ?auto_33528 ) ) ( not ( = ?auto_33529 ?auto_33535 ) ) ( HOIST-AT ?auto_33537 ?auto_33529 ) ( not ( = ?auto_33531 ?auto_33537 ) ) ( AVAILABLE ?auto_33537 ) ( SURFACE-AT ?auto_33528 ?auto_33529 ) ( ON ?auto_33528 ?auto_33538 ) ( CLEAR ?auto_33528 ) ( not ( = ?auto_33527 ?auto_33538 ) ) ( not ( = ?auto_33528 ?auto_33538 ) ) ( not ( = ?auto_33532 ?auto_33538 ) ) ( IS-CRATE ?auto_33527 ) ( not ( = ?auto_33539 ?auto_33535 ) ) ( not ( = ?auto_33529 ?auto_33539 ) ) ( HOIST-AT ?auto_33533 ?auto_33539 ) ( not ( = ?auto_33531 ?auto_33533 ) ) ( not ( = ?auto_33537 ?auto_33533 ) ) ( SURFACE-AT ?auto_33527 ?auto_33539 ) ( ON ?auto_33527 ?auto_33530 ) ( CLEAR ?auto_33527 ) ( not ( = ?auto_33527 ?auto_33530 ) ) ( not ( = ?auto_33528 ?auto_33530 ) ) ( not ( = ?auto_33532 ?auto_33530 ) ) ( not ( = ?auto_33538 ?auto_33530 ) ) ( SURFACE-AT ?auto_33534 ?auto_33535 ) ( CLEAR ?auto_33534 ) ( IS-CRATE ?auto_33532 ) ( not ( = ?auto_33534 ?auto_33532 ) ) ( not ( = ?auto_33527 ?auto_33534 ) ) ( not ( = ?auto_33528 ?auto_33534 ) ) ( not ( = ?auto_33538 ?auto_33534 ) ) ( not ( = ?auto_33530 ?auto_33534 ) ) ( AVAILABLE ?auto_33531 ) ( TRUCK-AT ?auto_33536 ?auto_33539 ) ( AVAILABLE ?auto_33533 ) ( SURFACE-AT ?auto_33532 ?auto_33539 ) ( ON ?auto_33532 ?auto_33540 ) ( CLEAR ?auto_33532 ) ( not ( = ?auto_33527 ?auto_33540 ) ) ( not ( = ?auto_33528 ?auto_33540 ) ) ( not ( = ?auto_33532 ?auto_33540 ) ) ( not ( = ?auto_33538 ?auto_33540 ) ) ( not ( = ?auto_33530 ?auto_33540 ) ) ( not ( = ?auto_33534 ?auto_33540 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33533 ?auto_33532 ?auto_33540 ?auto_33539 )
      ( MAKE-2CRATE ?auto_33532 ?auto_33527 ?auto_33528 )
      ( MAKE-1CRATE-VERIFY ?auto_33527 ?auto_33528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33541 - SURFACE
      ?auto_33542 - SURFACE
      ?auto_33543 - SURFACE
    )
    :vars
    (
      ?auto_33547 - HOIST
      ?auto_33553 - PLACE
      ?auto_33550 - PLACE
      ?auto_33551 - HOIST
      ?auto_33549 - SURFACE
      ?auto_33552 - PLACE
      ?auto_33544 - HOIST
      ?auto_33545 - SURFACE
      ?auto_33554 - SURFACE
      ?auto_33548 - TRUCK
      ?auto_33546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33547 ?auto_33553 ) ( IS-CRATE ?auto_33543 ) ( not ( = ?auto_33542 ?auto_33543 ) ) ( not ( = ?auto_33541 ?auto_33542 ) ) ( not ( = ?auto_33541 ?auto_33543 ) ) ( not ( = ?auto_33550 ?auto_33553 ) ) ( HOIST-AT ?auto_33551 ?auto_33550 ) ( not ( = ?auto_33547 ?auto_33551 ) ) ( AVAILABLE ?auto_33551 ) ( SURFACE-AT ?auto_33543 ?auto_33550 ) ( ON ?auto_33543 ?auto_33549 ) ( CLEAR ?auto_33543 ) ( not ( = ?auto_33542 ?auto_33549 ) ) ( not ( = ?auto_33543 ?auto_33549 ) ) ( not ( = ?auto_33541 ?auto_33549 ) ) ( IS-CRATE ?auto_33542 ) ( not ( = ?auto_33552 ?auto_33553 ) ) ( not ( = ?auto_33550 ?auto_33552 ) ) ( HOIST-AT ?auto_33544 ?auto_33552 ) ( not ( = ?auto_33547 ?auto_33544 ) ) ( not ( = ?auto_33551 ?auto_33544 ) ) ( SURFACE-AT ?auto_33542 ?auto_33552 ) ( ON ?auto_33542 ?auto_33545 ) ( CLEAR ?auto_33542 ) ( not ( = ?auto_33542 ?auto_33545 ) ) ( not ( = ?auto_33543 ?auto_33545 ) ) ( not ( = ?auto_33541 ?auto_33545 ) ) ( not ( = ?auto_33549 ?auto_33545 ) ) ( SURFACE-AT ?auto_33554 ?auto_33553 ) ( CLEAR ?auto_33554 ) ( IS-CRATE ?auto_33541 ) ( not ( = ?auto_33554 ?auto_33541 ) ) ( not ( = ?auto_33542 ?auto_33554 ) ) ( not ( = ?auto_33543 ?auto_33554 ) ) ( not ( = ?auto_33549 ?auto_33554 ) ) ( not ( = ?auto_33545 ?auto_33554 ) ) ( AVAILABLE ?auto_33547 ) ( TRUCK-AT ?auto_33548 ?auto_33552 ) ( AVAILABLE ?auto_33544 ) ( SURFACE-AT ?auto_33541 ?auto_33552 ) ( ON ?auto_33541 ?auto_33546 ) ( CLEAR ?auto_33541 ) ( not ( = ?auto_33542 ?auto_33546 ) ) ( not ( = ?auto_33543 ?auto_33546 ) ) ( not ( = ?auto_33541 ?auto_33546 ) ) ( not ( = ?auto_33549 ?auto_33546 ) ) ( not ( = ?auto_33545 ?auto_33546 ) ) ( not ( = ?auto_33554 ?auto_33546 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33542 ?auto_33543 )
      ( MAKE-2CRATE-VERIFY ?auto_33541 ?auto_33542 ?auto_33543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33555 - SURFACE
      ?auto_33556 - SURFACE
      ?auto_33557 - SURFACE
      ?auto_33558 - SURFACE
    )
    :vars
    (
      ?auto_33564 - HOIST
      ?auto_33565 - PLACE
      ?auto_33562 - PLACE
      ?auto_33559 - HOIST
      ?auto_33566 - SURFACE
      ?auto_33560 - PLACE
      ?auto_33568 - HOIST
      ?auto_33561 - SURFACE
      ?auto_33563 - TRUCK
      ?auto_33567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33564 ?auto_33565 ) ( IS-CRATE ?auto_33558 ) ( not ( = ?auto_33557 ?auto_33558 ) ) ( not ( = ?auto_33556 ?auto_33557 ) ) ( not ( = ?auto_33556 ?auto_33558 ) ) ( not ( = ?auto_33562 ?auto_33565 ) ) ( HOIST-AT ?auto_33559 ?auto_33562 ) ( not ( = ?auto_33564 ?auto_33559 ) ) ( AVAILABLE ?auto_33559 ) ( SURFACE-AT ?auto_33558 ?auto_33562 ) ( ON ?auto_33558 ?auto_33566 ) ( CLEAR ?auto_33558 ) ( not ( = ?auto_33557 ?auto_33566 ) ) ( not ( = ?auto_33558 ?auto_33566 ) ) ( not ( = ?auto_33556 ?auto_33566 ) ) ( IS-CRATE ?auto_33557 ) ( not ( = ?auto_33560 ?auto_33565 ) ) ( not ( = ?auto_33562 ?auto_33560 ) ) ( HOIST-AT ?auto_33568 ?auto_33560 ) ( not ( = ?auto_33564 ?auto_33568 ) ) ( not ( = ?auto_33559 ?auto_33568 ) ) ( SURFACE-AT ?auto_33557 ?auto_33560 ) ( ON ?auto_33557 ?auto_33561 ) ( CLEAR ?auto_33557 ) ( not ( = ?auto_33557 ?auto_33561 ) ) ( not ( = ?auto_33558 ?auto_33561 ) ) ( not ( = ?auto_33556 ?auto_33561 ) ) ( not ( = ?auto_33566 ?auto_33561 ) ) ( SURFACE-AT ?auto_33555 ?auto_33565 ) ( CLEAR ?auto_33555 ) ( IS-CRATE ?auto_33556 ) ( not ( = ?auto_33555 ?auto_33556 ) ) ( not ( = ?auto_33557 ?auto_33555 ) ) ( not ( = ?auto_33558 ?auto_33555 ) ) ( not ( = ?auto_33566 ?auto_33555 ) ) ( not ( = ?auto_33561 ?auto_33555 ) ) ( AVAILABLE ?auto_33564 ) ( TRUCK-AT ?auto_33563 ?auto_33560 ) ( AVAILABLE ?auto_33568 ) ( SURFACE-AT ?auto_33556 ?auto_33560 ) ( ON ?auto_33556 ?auto_33567 ) ( CLEAR ?auto_33556 ) ( not ( = ?auto_33557 ?auto_33567 ) ) ( not ( = ?auto_33558 ?auto_33567 ) ) ( not ( = ?auto_33556 ?auto_33567 ) ) ( not ( = ?auto_33566 ?auto_33567 ) ) ( not ( = ?auto_33561 ?auto_33567 ) ) ( not ( = ?auto_33555 ?auto_33567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33556 ?auto_33557 ?auto_33558 )
      ( MAKE-3CRATE-VERIFY ?auto_33555 ?auto_33556 ?auto_33557 ?auto_33558 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33569 - SURFACE
      ?auto_33570 - SURFACE
      ?auto_33571 - SURFACE
      ?auto_33572 - SURFACE
      ?auto_33573 - SURFACE
    )
    :vars
    (
      ?auto_33579 - HOIST
      ?auto_33580 - PLACE
      ?auto_33577 - PLACE
      ?auto_33574 - HOIST
      ?auto_33581 - SURFACE
      ?auto_33575 - PLACE
      ?auto_33583 - HOIST
      ?auto_33576 - SURFACE
      ?auto_33578 - TRUCK
      ?auto_33582 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33579 ?auto_33580 ) ( IS-CRATE ?auto_33573 ) ( not ( = ?auto_33572 ?auto_33573 ) ) ( not ( = ?auto_33571 ?auto_33572 ) ) ( not ( = ?auto_33571 ?auto_33573 ) ) ( not ( = ?auto_33577 ?auto_33580 ) ) ( HOIST-AT ?auto_33574 ?auto_33577 ) ( not ( = ?auto_33579 ?auto_33574 ) ) ( AVAILABLE ?auto_33574 ) ( SURFACE-AT ?auto_33573 ?auto_33577 ) ( ON ?auto_33573 ?auto_33581 ) ( CLEAR ?auto_33573 ) ( not ( = ?auto_33572 ?auto_33581 ) ) ( not ( = ?auto_33573 ?auto_33581 ) ) ( not ( = ?auto_33571 ?auto_33581 ) ) ( IS-CRATE ?auto_33572 ) ( not ( = ?auto_33575 ?auto_33580 ) ) ( not ( = ?auto_33577 ?auto_33575 ) ) ( HOIST-AT ?auto_33583 ?auto_33575 ) ( not ( = ?auto_33579 ?auto_33583 ) ) ( not ( = ?auto_33574 ?auto_33583 ) ) ( SURFACE-AT ?auto_33572 ?auto_33575 ) ( ON ?auto_33572 ?auto_33576 ) ( CLEAR ?auto_33572 ) ( not ( = ?auto_33572 ?auto_33576 ) ) ( not ( = ?auto_33573 ?auto_33576 ) ) ( not ( = ?auto_33571 ?auto_33576 ) ) ( not ( = ?auto_33581 ?auto_33576 ) ) ( SURFACE-AT ?auto_33570 ?auto_33580 ) ( CLEAR ?auto_33570 ) ( IS-CRATE ?auto_33571 ) ( not ( = ?auto_33570 ?auto_33571 ) ) ( not ( = ?auto_33572 ?auto_33570 ) ) ( not ( = ?auto_33573 ?auto_33570 ) ) ( not ( = ?auto_33581 ?auto_33570 ) ) ( not ( = ?auto_33576 ?auto_33570 ) ) ( AVAILABLE ?auto_33579 ) ( TRUCK-AT ?auto_33578 ?auto_33575 ) ( AVAILABLE ?auto_33583 ) ( SURFACE-AT ?auto_33571 ?auto_33575 ) ( ON ?auto_33571 ?auto_33582 ) ( CLEAR ?auto_33571 ) ( not ( = ?auto_33572 ?auto_33582 ) ) ( not ( = ?auto_33573 ?auto_33582 ) ) ( not ( = ?auto_33571 ?auto_33582 ) ) ( not ( = ?auto_33581 ?auto_33582 ) ) ( not ( = ?auto_33576 ?auto_33582 ) ) ( not ( = ?auto_33570 ?auto_33582 ) ) ( ON ?auto_33570 ?auto_33569 ) ( not ( = ?auto_33569 ?auto_33570 ) ) ( not ( = ?auto_33569 ?auto_33571 ) ) ( not ( = ?auto_33569 ?auto_33572 ) ) ( not ( = ?auto_33569 ?auto_33573 ) ) ( not ( = ?auto_33569 ?auto_33581 ) ) ( not ( = ?auto_33569 ?auto_33576 ) ) ( not ( = ?auto_33569 ?auto_33582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33571 ?auto_33572 ?auto_33573 )
      ( MAKE-4CRATE-VERIFY ?auto_33569 ?auto_33570 ?auto_33571 ?auto_33572 ?auto_33573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33584 - SURFACE
      ?auto_33585 - SURFACE
    )
    :vars
    (
      ?auto_33591 - HOIST
      ?auto_33593 - PLACE
      ?auto_33592 - SURFACE
      ?auto_33589 - PLACE
      ?auto_33586 - HOIST
      ?auto_33595 - SURFACE
      ?auto_33587 - PLACE
      ?auto_33597 - HOIST
      ?auto_33588 - SURFACE
      ?auto_33594 - SURFACE
      ?auto_33596 - SURFACE
      ?auto_33590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33591 ?auto_33593 ) ( IS-CRATE ?auto_33585 ) ( not ( = ?auto_33584 ?auto_33585 ) ) ( not ( = ?auto_33592 ?auto_33584 ) ) ( not ( = ?auto_33592 ?auto_33585 ) ) ( not ( = ?auto_33589 ?auto_33593 ) ) ( HOIST-AT ?auto_33586 ?auto_33589 ) ( not ( = ?auto_33591 ?auto_33586 ) ) ( AVAILABLE ?auto_33586 ) ( SURFACE-AT ?auto_33585 ?auto_33589 ) ( ON ?auto_33585 ?auto_33595 ) ( CLEAR ?auto_33585 ) ( not ( = ?auto_33584 ?auto_33595 ) ) ( not ( = ?auto_33585 ?auto_33595 ) ) ( not ( = ?auto_33592 ?auto_33595 ) ) ( IS-CRATE ?auto_33584 ) ( not ( = ?auto_33587 ?auto_33593 ) ) ( not ( = ?auto_33589 ?auto_33587 ) ) ( HOIST-AT ?auto_33597 ?auto_33587 ) ( not ( = ?auto_33591 ?auto_33597 ) ) ( not ( = ?auto_33586 ?auto_33597 ) ) ( SURFACE-AT ?auto_33584 ?auto_33587 ) ( ON ?auto_33584 ?auto_33588 ) ( CLEAR ?auto_33584 ) ( not ( = ?auto_33584 ?auto_33588 ) ) ( not ( = ?auto_33585 ?auto_33588 ) ) ( not ( = ?auto_33592 ?auto_33588 ) ) ( not ( = ?auto_33595 ?auto_33588 ) ) ( SURFACE-AT ?auto_33594 ?auto_33593 ) ( CLEAR ?auto_33594 ) ( IS-CRATE ?auto_33592 ) ( not ( = ?auto_33594 ?auto_33592 ) ) ( not ( = ?auto_33584 ?auto_33594 ) ) ( not ( = ?auto_33585 ?auto_33594 ) ) ( not ( = ?auto_33595 ?auto_33594 ) ) ( not ( = ?auto_33588 ?auto_33594 ) ) ( AVAILABLE ?auto_33591 ) ( AVAILABLE ?auto_33597 ) ( SURFACE-AT ?auto_33592 ?auto_33587 ) ( ON ?auto_33592 ?auto_33596 ) ( CLEAR ?auto_33592 ) ( not ( = ?auto_33584 ?auto_33596 ) ) ( not ( = ?auto_33585 ?auto_33596 ) ) ( not ( = ?auto_33592 ?auto_33596 ) ) ( not ( = ?auto_33595 ?auto_33596 ) ) ( not ( = ?auto_33588 ?auto_33596 ) ) ( not ( = ?auto_33594 ?auto_33596 ) ) ( TRUCK-AT ?auto_33590 ?auto_33593 ) )
    :subtasks
    ( ( !DRIVE ?auto_33590 ?auto_33593 ?auto_33587 )
      ( MAKE-2CRATE ?auto_33592 ?auto_33584 ?auto_33585 )
      ( MAKE-1CRATE-VERIFY ?auto_33584 ?auto_33585 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33598 - SURFACE
      ?auto_33599 - SURFACE
      ?auto_33600 - SURFACE
    )
    :vars
    (
      ?auto_33602 - HOIST
      ?auto_33604 - PLACE
      ?auto_33607 - PLACE
      ?auto_33605 - HOIST
      ?auto_33611 - SURFACE
      ?auto_33609 - PLACE
      ?auto_33601 - HOIST
      ?auto_33610 - SURFACE
      ?auto_33608 - SURFACE
      ?auto_33603 - SURFACE
      ?auto_33606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33602 ?auto_33604 ) ( IS-CRATE ?auto_33600 ) ( not ( = ?auto_33599 ?auto_33600 ) ) ( not ( = ?auto_33598 ?auto_33599 ) ) ( not ( = ?auto_33598 ?auto_33600 ) ) ( not ( = ?auto_33607 ?auto_33604 ) ) ( HOIST-AT ?auto_33605 ?auto_33607 ) ( not ( = ?auto_33602 ?auto_33605 ) ) ( AVAILABLE ?auto_33605 ) ( SURFACE-AT ?auto_33600 ?auto_33607 ) ( ON ?auto_33600 ?auto_33611 ) ( CLEAR ?auto_33600 ) ( not ( = ?auto_33599 ?auto_33611 ) ) ( not ( = ?auto_33600 ?auto_33611 ) ) ( not ( = ?auto_33598 ?auto_33611 ) ) ( IS-CRATE ?auto_33599 ) ( not ( = ?auto_33609 ?auto_33604 ) ) ( not ( = ?auto_33607 ?auto_33609 ) ) ( HOIST-AT ?auto_33601 ?auto_33609 ) ( not ( = ?auto_33602 ?auto_33601 ) ) ( not ( = ?auto_33605 ?auto_33601 ) ) ( SURFACE-AT ?auto_33599 ?auto_33609 ) ( ON ?auto_33599 ?auto_33610 ) ( CLEAR ?auto_33599 ) ( not ( = ?auto_33599 ?auto_33610 ) ) ( not ( = ?auto_33600 ?auto_33610 ) ) ( not ( = ?auto_33598 ?auto_33610 ) ) ( not ( = ?auto_33611 ?auto_33610 ) ) ( SURFACE-AT ?auto_33608 ?auto_33604 ) ( CLEAR ?auto_33608 ) ( IS-CRATE ?auto_33598 ) ( not ( = ?auto_33608 ?auto_33598 ) ) ( not ( = ?auto_33599 ?auto_33608 ) ) ( not ( = ?auto_33600 ?auto_33608 ) ) ( not ( = ?auto_33611 ?auto_33608 ) ) ( not ( = ?auto_33610 ?auto_33608 ) ) ( AVAILABLE ?auto_33602 ) ( AVAILABLE ?auto_33601 ) ( SURFACE-AT ?auto_33598 ?auto_33609 ) ( ON ?auto_33598 ?auto_33603 ) ( CLEAR ?auto_33598 ) ( not ( = ?auto_33599 ?auto_33603 ) ) ( not ( = ?auto_33600 ?auto_33603 ) ) ( not ( = ?auto_33598 ?auto_33603 ) ) ( not ( = ?auto_33611 ?auto_33603 ) ) ( not ( = ?auto_33610 ?auto_33603 ) ) ( not ( = ?auto_33608 ?auto_33603 ) ) ( TRUCK-AT ?auto_33606 ?auto_33604 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33599 ?auto_33600 )
      ( MAKE-2CRATE-VERIFY ?auto_33598 ?auto_33599 ?auto_33600 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33612 - SURFACE
      ?auto_33613 - SURFACE
      ?auto_33614 - SURFACE
      ?auto_33615 - SURFACE
    )
    :vars
    (
      ?auto_33619 - HOIST
      ?auto_33618 - PLACE
      ?auto_33617 - PLACE
      ?auto_33616 - HOIST
      ?auto_33621 - SURFACE
      ?auto_33620 - PLACE
      ?auto_33623 - HOIST
      ?auto_33625 - SURFACE
      ?auto_33622 - SURFACE
      ?auto_33624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33619 ?auto_33618 ) ( IS-CRATE ?auto_33615 ) ( not ( = ?auto_33614 ?auto_33615 ) ) ( not ( = ?auto_33613 ?auto_33614 ) ) ( not ( = ?auto_33613 ?auto_33615 ) ) ( not ( = ?auto_33617 ?auto_33618 ) ) ( HOIST-AT ?auto_33616 ?auto_33617 ) ( not ( = ?auto_33619 ?auto_33616 ) ) ( AVAILABLE ?auto_33616 ) ( SURFACE-AT ?auto_33615 ?auto_33617 ) ( ON ?auto_33615 ?auto_33621 ) ( CLEAR ?auto_33615 ) ( not ( = ?auto_33614 ?auto_33621 ) ) ( not ( = ?auto_33615 ?auto_33621 ) ) ( not ( = ?auto_33613 ?auto_33621 ) ) ( IS-CRATE ?auto_33614 ) ( not ( = ?auto_33620 ?auto_33618 ) ) ( not ( = ?auto_33617 ?auto_33620 ) ) ( HOIST-AT ?auto_33623 ?auto_33620 ) ( not ( = ?auto_33619 ?auto_33623 ) ) ( not ( = ?auto_33616 ?auto_33623 ) ) ( SURFACE-AT ?auto_33614 ?auto_33620 ) ( ON ?auto_33614 ?auto_33625 ) ( CLEAR ?auto_33614 ) ( not ( = ?auto_33614 ?auto_33625 ) ) ( not ( = ?auto_33615 ?auto_33625 ) ) ( not ( = ?auto_33613 ?auto_33625 ) ) ( not ( = ?auto_33621 ?auto_33625 ) ) ( SURFACE-AT ?auto_33612 ?auto_33618 ) ( CLEAR ?auto_33612 ) ( IS-CRATE ?auto_33613 ) ( not ( = ?auto_33612 ?auto_33613 ) ) ( not ( = ?auto_33614 ?auto_33612 ) ) ( not ( = ?auto_33615 ?auto_33612 ) ) ( not ( = ?auto_33621 ?auto_33612 ) ) ( not ( = ?auto_33625 ?auto_33612 ) ) ( AVAILABLE ?auto_33619 ) ( AVAILABLE ?auto_33623 ) ( SURFACE-AT ?auto_33613 ?auto_33620 ) ( ON ?auto_33613 ?auto_33622 ) ( CLEAR ?auto_33613 ) ( not ( = ?auto_33614 ?auto_33622 ) ) ( not ( = ?auto_33615 ?auto_33622 ) ) ( not ( = ?auto_33613 ?auto_33622 ) ) ( not ( = ?auto_33621 ?auto_33622 ) ) ( not ( = ?auto_33625 ?auto_33622 ) ) ( not ( = ?auto_33612 ?auto_33622 ) ) ( TRUCK-AT ?auto_33624 ?auto_33618 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33613 ?auto_33614 ?auto_33615 )
      ( MAKE-3CRATE-VERIFY ?auto_33612 ?auto_33613 ?auto_33614 ?auto_33615 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33626 - SURFACE
      ?auto_33627 - SURFACE
      ?auto_33628 - SURFACE
      ?auto_33629 - SURFACE
      ?auto_33630 - SURFACE
    )
    :vars
    (
      ?auto_33634 - HOIST
      ?auto_33633 - PLACE
      ?auto_33632 - PLACE
      ?auto_33631 - HOIST
      ?auto_33636 - SURFACE
      ?auto_33635 - PLACE
      ?auto_33638 - HOIST
      ?auto_33640 - SURFACE
      ?auto_33637 - SURFACE
      ?auto_33639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33634 ?auto_33633 ) ( IS-CRATE ?auto_33630 ) ( not ( = ?auto_33629 ?auto_33630 ) ) ( not ( = ?auto_33628 ?auto_33629 ) ) ( not ( = ?auto_33628 ?auto_33630 ) ) ( not ( = ?auto_33632 ?auto_33633 ) ) ( HOIST-AT ?auto_33631 ?auto_33632 ) ( not ( = ?auto_33634 ?auto_33631 ) ) ( AVAILABLE ?auto_33631 ) ( SURFACE-AT ?auto_33630 ?auto_33632 ) ( ON ?auto_33630 ?auto_33636 ) ( CLEAR ?auto_33630 ) ( not ( = ?auto_33629 ?auto_33636 ) ) ( not ( = ?auto_33630 ?auto_33636 ) ) ( not ( = ?auto_33628 ?auto_33636 ) ) ( IS-CRATE ?auto_33629 ) ( not ( = ?auto_33635 ?auto_33633 ) ) ( not ( = ?auto_33632 ?auto_33635 ) ) ( HOIST-AT ?auto_33638 ?auto_33635 ) ( not ( = ?auto_33634 ?auto_33638 ) ) ( not ( = ?auto_33631 ?auto_33638 ) ) ( SURFACE-AT ?auto_33629 ?auto_33635 ) ( ON ?auto_33629 ?auto_33640 ) ( CLEAR ?auto_33629 ) ( not ( = ?auto_33629 ?auto_33640 ) ) ( not ( = ?auto_33630 ?auto_33640 ) ) ( not ( = ?auto_33628 ?auto_33640 ) ) ( not ( = ?auto_33636 ?auto_33640 ) ) ( SURFACE-AT ?auto_33627 ?auto_33633 ) ( CLEAR ?auto_33627 ) ( IS-CRATE ?auto_33628 ) ( not ( = ?auto_33627 ?auto_33628 ) ) ( not ( = ?auto_33629 ?auto_33627 ) ) ( not ( = ?auto_33630 ?auto_33627 ) ) ( not ( = ?auto_33636 ?auto_33627 ) ) ( not ( = ?auto_33640 ?auto_33627 ) ) ( AVAILABLE ?auto_33634 ) ( AVAILABLE ?auto_33638 ) ( SURFACE-AT ?auto_33628 ?auto_33635 ) ( ON ?auto_33628 ?auto_33637 ) ( CLEAR ?auto_33628 ) ( not ( = ?auto_33629 ?auto_33637 ) ) ( not ( = ?auto_33630 ?auto_33637 ) ) ( not ( = ?auto_33628 ?auto_33637 ) ) ( not ( = ?auto_33636 ?auto_33637 ) ) ( not ( = ?auto_33640 ?auto_33637 ) ) ( not ( = ?auto_33627 ?auto_33637 ) ) ( TRUCK-AT ?auto_33639 ?auto_33633 ) ( ON ?auto_33627 ?auto_33626 ) ( not ( = ?auto_33626 ?auto_33627 ) ) ( not ( = ?auto_33626 ?auto_33628 ) ) ( not ( = ?auto_33626 ?auto_33629 ) ) ( not ( = ?auto_33626 ?auto_33630 ) ) ( not ( = ?auto_33626 ?auto_33636 ) ) ( not ( = ?auto_33626 ?auto_33640 ) ) ( not ( = ?auto_33626 ?auto_33637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33628 ?auto_33629 ?auto_33630 )
      ( MAKE-4CRATE-VERIFY ?auto_33626 ?auto_33627 ?auto_33628 ?auto_33629 ?auto_33630 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33641 - SURFACE
      ?auto_33642 - SURFACE
    )
    :vars
    (
      ?auto_33647 - HOIST
      ?auto_33646 - PLACE
      ?auto_33644 - SURFACE
      ?auto_33645 - PLACE
      ?auto_33643 - HOIST
      ?auto_33650 - SURFACE
      ?auto_33649 - PLACE
      ?auto_33652 - HOIST
      ?auto_33654 - SURFACE
      ?auto_33648 - SURFACE
      ?auto_33651 - SURFACE
      ?auto_33653 - TRUCK
      ?auto_33655 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33647 ?auto_33646 ) ( IS-CRATE ?auto_33642 ) ( not ( = ?auto_33641 ?auto_33642 ) ) ( not ( = ?auto_33644 ?auto_33641 ) ) ( not ( = ?auto_33644 ?auto_33642 ) ) ( not ( = ?auto_33645 ?auto_33646 ) ) ( HOIST-AT ?auto_33643 ?auto_33645 ) ( not ( = ?auto_33647 ?auto_33643 ) ) ( AVAILABLE ?auto_33643 ) ( SURFACE-AT ?auto_33642 ?auto_33645 ) ( ON ?auto_33642 ?auto_33650 ) ( CLEAR ?auto_33642 ) ( not ( = ?auto_33641 ?auto_33650 ) ) ( not ( = ?auto_33642 ?auto_33650 ) ) ( not ( = ?auto_33644 ?auto_33650 ) ) ( IS-CRATE ?auto_33641 ) ( not ( = ?auto_33649 ?auto_33646 ) ) ( not ( = ?auto_33645 ?auto_33649 ) ) ( HOIST-AT ?auto_33652 ?auto_33649 ) ( not ( = ?auto_33647 ?auto_33652 ) ) ( not ( = ?auto_33643 ?auto_33652 ) ) ( SURFACE-AT ?auto_33641 ?auto_33649 ) ( ON ?auto_33641 ?auto_33654 ) ( CLEAR ?auto_33641 ) ( not ( = ?auto_33641 ?auto_33654 ) ) ( not ( = ?auto_33642 ?auto_33654 ) ) ( not ( = ?auto_33644 ?auto_33654 ) ) ( not ( = ?auto_33650 ?auto_33654 ) ) ( IS-CRATE ?auto_33644 ) ( not ( = ?auto_33648 ?auto_33644 ) ) ( not ( = ?auto_33641 ?auto_33648 ) ) ( not ( = ?auto_33642 ?auto_33648 ) ) ( not ( = ?auto_33650 ?auto_33648 ) ) ( not ( = ?auto_33654 ?auto_33648 ) ) ( AVAILABLE ?auto_33652 ) ( SURFACE-AT ?auto_33644 ?auto_33649 ) ( ON ?auto_33644 ?auto_33651 ) ( CLEAR ?auto_33644 ) ( not ( = ?auto_33641 ?auto_33651 ) ) ( not ( = ?auto_33642 ?auto_33651 ) ) ( not ( = ?auto_33644 ?auto_33651 ) ) ( not ( = ?auto_33650 ?auto_33651 ) ) ( not ( = ?auto_33654 ?auto_33651 ) ) ( not ( = ?auto_33648 ?auto_33651 ) ) ( TRUCK-AT ?auto_33653 ?auto_33646 ) ( SURFACE-AT ?auto_33655 ?auto_33646 ) ( CLEAR ?auto_33655 ) ( LIFTING ?auto_33647 ?auto_33648 ) ( IS-CRATE ?auto_33648 ) ( not ( = ?auto_33655 ?auto_33648 ) ) ( not ( = ?auto_33641 ?auto_33655 ) ) ( not ( = ?auto_33642 ?auto_33655 ) ) ( not ( = ?auto_33644 ?auto_33655 ) ) ( not ( = ?auto_33650 ?auto_33655 ) ) ( not ( = ?auto_33654 ?auto_33655 ) ) ( not ( = ?auto_33651 ?auto_33655 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33655 ?auto_33648 )
      ( MAKE-2CRATE ?auto_33644 ?auto_33641 ?auto_33642 )
      ( MAKE-1CRATE-VERIFY ?auto_33641 ?auto_33642 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33656 - SURFACE
      ?auto_33657 - SURFACE
      ?auto_33658 - SURFACE
    )
    :vars
    (
      ?auto_33668 - HOIST
      ?auto_33665 - PLACE
      ?auto_33659 - PLACE
      ?auto_33664 - HOIST
      ?auto_33663 - SURFACE
      ?auto_33661 - PLACE
      ?auto_33670 - HOIST
      ?auto_33666 - SURFACE
      ?auto_33660 - SURFACE
      ?auto_33669 - SURFACE
      ?auto_33662 - TRUCK
      ?auto_33667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33668 ?auto_33665 ) ( IS-CRATE ?auto_33658 ) ( not ( = ?auto_33657 ?auto_33658 ) ) ( not ( = ?auto_33656 ?auto_33657 ) ) ( not ( = ?auto_33656 ?auto_33658 ) ) ( not ( = ?auto_33659 ?auto_33665 ) ) ( HOIST-AT ?auto_33664 ?auto_33659 ) ( not ( = ?auto_33668 ?auto_33664 ) ) ( AVAILABLE ?auto_33664 ) ( SURFACE-AT ?auto_33658 ?auto_33659 ) ( ON ?auto_33658 ?auto_33663 ) ( CLEAR ?auto_33658 ) ( not ( = ?auto_33657 ?auto_33663 ) ) ( not ( = ?auto_33658 ?auto_33663 ) ) ( not ( = ?auto_33656 ?auto_33663 ) ) ( IS-CRATE ?auto_33657 ) ( not ( = ?auto_33661 ?auto_33665 ) ) ( not ( = ?auto_33659 ?auto_33661 ) ) ( HOIST-AT ?auto_33670 ?auto_33661 ) ( not ( = ?auto_33668 ?auto_33670 ) ) ( not ( = ?auto_33664 ?auto_33670 ) ) ( SURFACE-AT ?auto_33657 ?auto_33661 ) ( ON ?auto_33657 ?auto_33666 ) ( CLEAR ?auto_33657 ) ( not ( = ?auto_33657 ?auto_33666 ) ) ( not ( = ?auto_33658 ?auto_33666 ) ) ( not ( = ?auto_33656 ?auto_33666 ) ) ( not ( = ?auto_33663 ?auto_33666 ) ) ( IS-CRATE ?auto_33656 ) ( not ( = ?auto_33660 ?auto_33656 ) ) ( not ( = ?auto_33657 ?auto_33660 ) ) ( not ( = ?auto_33658 ?auto_33660 ) ) ( not ( = ?auto_33663 ?auto_33660 ) ) ( not ( = ?auto_33666 ?auto_33660 ) ) ( AVAILABLE ?auto_33670 ) ( SURFACE-AT ?auto_33656 ?auto_33661 ) ( ON ?auto_33656 ?auto_33669 ) ( CLEAR ?auto_33656 ) ( not ( = ?auto_33657 ?auto_33669 ) ) ( not ( = ?auto_33658 ?auto_33669 ) ) ( not ( = ?auto_33656 ?auto_33669 ) ) ( not ( = ?auto_33663 ?auto_33669 ) ) ( not ( = ?auto_33666 ?auto_33669 ) ) ( not ( = ?auto_33660 ?auto_33669 ) ) ( TRUCK-AT ?auto_33662 ?auto_33665 ) ( SURFACE-AT ?auto_33667 ?auto_33665 ) ( CLEAR ?auto_33667 ) ( LIFTING ?auto_33668 ?auto_33660 ) ( IS-CRATE ?auto_33660 ) ( not ( = ?auto_33667 ?auto_33660 ) ) ( not ( = ?auto_33657 ?auto_33667 ) ) ( not ( = ?auto_33658 ?auto_33667 ) ) ( not ( = ?auto_33656 ?auto_33667 ) ) ( not ( = ?auto_33663 ?auto_33667 ) ) ( not ( = ?auto_33666 ?auto_33667 ) ) ( not ( = ?auto_33669 ?auto_33667 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33657 ?auto_33658 )
      ( MAKE-2CRATE-VERIFY ?auto_33656 ?auto_33657 ?auto_33658 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33671 - SURFACE
      ?auto_33672 - SURFACE
      ?auto_33673 - SURFACE
      ?auto_33674 - SURFACE
    )
    :vars
    (
      ?auto_33684 - HOIST
      ?auto_33679 - PLACE
      ?auto_33685 - PLACE
      ?auto_33680 - HOIST
      ?auto_33676 - SURFACE
      ?auto_33682 - PLACE
      ?auto_33677 - HOIST
      ?auto_33683 - SURFACE
      ?auto_33678 - SURFACE
      ?auto_33681 - TRUCK
      ?auto_33675 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33684 ?auto_33679 ) ( IS-CRATE ?auto_33674 ) ( not ( = ?auto_33673 ?auto_33674 ) ) ( not ( = ?auto_33672 ?auto_33673 ) ) ( not ( = ?auto_33672 ?auto_33674 ) ) ( not ( = ?auto_33685 ?auto_33679 ) ) ( HOIST-AT ?auto_33680 ?auto_33685 ) ( not ( = ?auto_33684 ?auto_33680 ) ) ( AVAILABLE ?auto_33680 ) ( SURFACE-AT ?auto_33674 ?auto_33685 ) ( ON ?auto_33674 ?auto_33676 ) ( CLEAR ?auto_33674 ) ( not ( = ?auto_33673 ?auto_33676 ) ) ( not ( = ?auto_33674 ?auto_33676 ) ) ( not ( = ?auto_33672 ?auto_33676 ) ) ( IS-CRATE ?auto_33673 ) ( not ( = ?auto_33682 ?auto_33679 ) ) ( not ( = ?auto_33685 ?auto_33682 ) ) ( HOIST-AT ?auto_33677 ?auto_33682 ) ( not ( = ?auto_33684 ?auto_33677 ) ) ( not ( = ?auto_33680 ?auto_33677 ) ) ( SURFACE-AT ?auto_33673 ?auto_33682 ) ( ON ?auto_33673 ?auto_33683 ) ( CLEAR ?auto_33673 ) ( not ( = ?auto_33673 ?auto_33683 ) ) ( not ( = ?auto_33674 ?auto_33683 ) ) ( not ( = ?auto_33672 ?auto_33683 ) ) ( not ( = ?auto_33676 ?auto_33683 ) ) ( IS-CRATE ?auto_33672 ) ( not ( = ?auto_33671 ?auto_33672 ) ) ( not ( = ?auto_33673 ?auto_33671 ) ) ( not ( = ?auto_33674 ?auto_33671 ) ) ( not ( = ?auto_33676 ?auto_33671 ) ) ( not ( = ?auto_33683 ?auto_33671 ) ) ( AVAILABLE ?auto_33677 ) ( SURFACE-AT ?auto_33672 ?auto_33682 ) ( ON ?auto_33672 ?auto_33678 ) ( CLEAR ?auto_33672 ) ( not ( = ?auto_33673 ?auto_33678 ) ) ( not ( = ?auto_33674 ?auto_33678 ) ) ( not ( = ?auto_33672 ?auto_33678 ) ) ( not ( = ?auto_33676 ?auto_33678 ) ) ( not ( = ?auto_33683 ?auto_33678 ) ) ( not ( = ?auto_33671 ?auto_33678 ) ) ( TRUCK-AT ?auto_33681 ?auto_33679 ) ( SURFACE-AT ?auto_33675 ?auto_33679 ) ( CLEAR ?auto_33675 ) ( LIFTING ?auto_33684 ?auto_33671 ) ( IS-CRATE ?auto_33671 ) ( not ( = ?auto_33675 ?auto_33671 ) ) ( not ( = ?auto_33673 ?auto_33675 ) ) ( not ( = ?auto_33674 ?auto_33675 ) ) ( not ( = ?auto_33672 ?auto_33675 ) ) ( not ( = ?auto_33676 ?auto_33675 ) ) ( not ( = ?auto_33683 ?auto_33675 ) ) ( not ( = ?auto_33678 ?auto_33675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33672 ?auto_33673 ?auto_33674 )
      ( MAKE-3CRATE-VERIFY ?auto_33671 ?auto_33672 ?auto_33673 ?auto_33674 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33686 - SURFACE
      ?auto_33687 - SURFACE
      ?auto_33688 - SURFACE
      ?auto_33689 - SURFACE
      ?auto_33690 - SURFACE
    )
    :vars
    (
      ?auto_33699 - HOIST
      ?auto_33694 - PLACE
      ?auto_33700 - PLACE
      ?auto_33695 - HOIST
      ?auto_33691 - SURFACE
      ?auto_33697 - PLACE
      ?auto_33692 - HOIST
      ?auto_33698 - SURFACE
      ?auto_33693 - SURFACE
      ?auto_33696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33699 ?auto_33694 ) ( IS-CRATE ?auto_33690 ) ( not ( = ?auto_33689 ?auto_33690 ) ) ( not ( = ?auto_33688 ?auto_33689 ) ) ( not ( = ?auto_33688 ?auto_33690 ) ) ( not ( = ?auto_33700 ?auto_33694 ) ) ( HOIST-AT ?auto_33695 ?auto_33700 ) ( not ( = ?auto_33699 ?auto_33695 ) ) ( AVAILABLE ?auto_33695 ) ( SURFACE-AT ?auto_33690 ?auto_33700 ) ( ON ?auto_33690 ?auto_33691 ) ( CLEAR ?auto_33690 ) ( not ( = ?auto_33689 ?auto_33691 ) ) ( not ( = ?auto_33690 ?auto_33691 ) ) ( not ( = ?auto_33688 ?auto_33691 ) ) ( IS-CRATE ?auto_33689 ) ( not ( = ?auto_33697 ?auto_33694 ) ) ( not ( = ?auto_33700 ?auto_33697 ) ) ( HOIST-AT ?auto_33692 ?auto_33697 ) ( not ( = ?auto_33699 ?auto_33692 ) ) ( not ( = ?auto_33695 ?auto_33692 ) ) ( SURFACE-AT ?auto_33689 ?auto_33697 ) ( ON ?auto_33689 ?auto_33698 ) ( CLEAR ?auto_33689 ) ( not ( = ?auto_33689 ?auto_33698 ) ) ( not ( = ?auto_33690 ?auto_33698 ) ) ( not ( = ?auto_33688 ?auto_33698 ) ) ( not ( = ?auto_33691 ?auto_33698 ) ) ( IS-CRATE ?auto_33688 ) ( not ( = ?auto_33687 ?auto_33688 ) ) ( not ( = ?auto_33689 ?auto_33687 ) ) ( not ( = ?auto_33690 ?auto_33687 ) ) ( not ( = ?auto_33691 ?auto_33687 ) ) ( not ( = ?auto_33698 ?auto_33687 ) ) ( AVAILABLE ?auto_33692 ) ( SURFACE-AT ?auto_33688 ?auto_33697 ) ( ON ?auto_33688 ?auto_33693 ) ( CLEAR ?auto_33688 ) ( not ( = ?auto_33689 ?auto_33693 ) ) ( not ( = ?auto_33690 ?auto_33693 ) ) ( not ( = ?auto_33688 ?auto_33693 ) ) ( not ( = ?auto_33691 ?auto_33693 ) ) ( not ( = ?auto_33698 ?auto_33693 ) ) ( not ( = ?auto_33687 ?auto_33693 ) ) ( TRUCK-AT ?auto_33696 ?auto_33694 ) ( SURFACE-AT ?auto_33686 ?auto_33694 ) ( CLEAR ?auto_33686 ) ( LIFTING ?auto_33699 ?auto_33687 ) ( IS-CRATE ?auto_33687 ) ( not ( = ?auto_33686 ?auto_33687 ) ) ( not ( = ?auto_33689 ?auto_33686 ) ) ( not ( = ?auto_33690 ?auto_33686 ) ) ( not ( = ?auto_33688 ?auto_33686 ) ) ( not ( = ?auto_33691 ?auto_33686 ) ) ( not ( = ?auto_33698 ?auto_33686 ) ) ( not ( = ?auto_33693 ?auto_33686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33688 ?auto_33689 ?auto_33690 )
      ( MAKE-4CRATE-VERIFY ?auto_33686 ?auto_33687 ?auto_33688 ?auto_33689 ?auto_33690 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33701 - SURFACE
      ?auto_33702 - SURFACE
    )
    :vars
    (
      ?auto_33713 - HOIST
      ?auto_33707 - PLACE
      ?auto_33710 - SURFACE
      ?auto_33715 - PLACE
      ?auto_33708 - HOIST
      ?auto_33704 - SURFACE
      ?auto_33711 - PLACE
      ?auto_33705 - HOIST
      ?auto_33712 - SURFACE
      ?auto_33714 - SURFACE
      ?auto_33706 - SURFACE
      ?auto_33709 - TRUCK
      ?auto_33703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33713 ?auto_33707 ) ( IS-CRATE ?auto_33702 ) ( not ( = ?auto_33701 ?auto_33702 ) ) ( not ( = ?auto_33710 ?auto_33701 ) ) ( not ( = ?auto_33710 ?auto_33702 ) ) ( not ( = ?auto_33715 ?auto_33707 ) ) ( HOIST-AT ?auto_33708 ?auto_33715 ) ( not ( = ?auto_33713 ?auto_33708 ) ) ( AVAILABLE ?auto_33708 ) ( SURFACE-AT ?auto_33702 ?auto_33715 ) ( ON ?auto_33702 ?auto_33704 ) ( CLEAR ?auto_33702 ) ( not ( = ?auto_33701 ?auto_33704 ) ) ( not ( = ?auto_33702 ?auto_33704 ) ) ( not ( = ?auto_33710 ?auto_33704 ) ) ( IS-CRATE ?auto_33701 ) ( not ( = ?auto_33711 ?auto_33707 ) ) ( not ( = ?auto_33715 ?auto_33711 ) ) ( HOIST-AT ?auto_33705 ?auto_33711 ) ( not ( = ?auto_33713 ?auto_33705 ) ) ( not ( = ?auto_33708 ?auto_33705 ) ) ( SURFACE-AT ?auto_33701 ?auto_33711 ) ( ON ?auto_33701 ?auto_33712 ) ( CLEAR ?auto_33701 ) ( not ( = ?auto_33701 ?auto_33712 ) ) ( not ( = ?auto_33702 ?auto_33712 ) ) ( not ( = ?auto_33710 ?auto_33712 ) ) ( not ( = ?auto_33704 ?auto_33712 ) ) ( IS-CRATE ?auto_33710 ) ( not ( = ?auto_33714 ?auto_33710 ) ) ( not ( = ?auto_33701 ?auto_33714 ) ) ( not ( = ?auto_33702 ?auto_33714 ) ) ( not ( = ?auto_33704 ?auto_33714 ) ) ( not ( = ?auto_33712 ?auto_33714 ) ) ( AVAILABLE ?auto_33705 ) ( SURFACE-AT ?auto_33710 ?auto_33711 ) ( ON ?auto_33710 ?auto_33706 ) ( CLEAR ?auto_33710 ) ( not ( = ?auto_33701 ?auto_33706 ) ) ( not ( = ?auto_33702 ?auto_33706 ) ) ( not ( = ?auto_33710 ?auto_33706 ) ) ( not ( = ?auto_33704 ?auto_33706 ) ) ( not ( = ?auto_33712 ?auto_33706 ) ) ( not ( = ?auto_33714 ?auto_33706 ) ) ( TRUCK-AT ?auto_33709 ?auto_33707 ) ( SURFACE-AT ?auto_33703 ?auto_33707 ) ( CLEAR ?auto_33703 ) ( IS-CRATE ?auto_33714 ) ( not ( = ?auto_33703 ?auto_33714 ) ) ( not ( = ?auto_33701 ?auto_33703 ) ) ( not ( = ?auto_33702 ?auto_33703 ) ) ( not ( = ?auto_33710 ?auto_33703 ) ) ( not ( = ?auto_33704 ?auto_33703 ) ) ( not ( = ?auto_33712 ?auto_33703 ) ) ( not ( = ?auto_33706 ?auto_33703 ) ) ( AVAILABLE ?auto_33713 ) ( IN ?auto_33714 ?auto_33709 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33713 ?auto_33714 ?auto_33709 ?auto_33707 )
      ( MAKE-2CRATE ?auto_33710 ?auto_33701 ?auto_33702 )
      ( MAKE-1CRATE-VERIFY ?auto_33701 ?auto_33702 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33716 - SURFACE
      ?auto_33717 - SURFACE
      ?auto_33718 - SURFACE
    )
    :vars
    (
      ?auto_33724 - HOIST
      ?auto_33722 - PLACE
      ?auto_33729 - PLACE
      ?auto_33726 - HOIST
      ?auto_33719 - SURFACE
      ?auto_33728 - PLACE
      ?auto_33725 - HOIST
      ?auto_33721 - SURFACE
      ?auto_33720 - SURFACE
      ?auto_33727 - SURFACE
      ?auto_33730 - TRUCK
      ?auto_33723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33724 ?auto_33722 ) ( IS-CRATE ?auto_33718 ) ( not ( = ?auto_33717 ?auto_33718 ) ) ( not ( = ?auto_33716 ?auto_33717 ) ) ( not ( = ?auto_33716 ?auto_33718 ) ) ( not ( = ?auto_33729 ?auto_33722 ) ) ( HOIST-AT ?auto_33726 ?auto_33729 ) ( not ( = ?auto_33724 ?auto_33726 ) ) ( AVAILABLE ?auto_33726 ) ( SURFACE-AT ?auto_33718 ?auto_33729 ) ( ON ?auto_33718 ?auto_33719 ) ( CLEAR ?auto_33718 ) ( not ( = ?auto_33717 ?auto_33719 ) ) ( not ( = ?auto_33718 ?auto_33719 ) ) ( not ( = ?auto_33716 ?auto_33719 ) ) ( IS-CRATE ?auto_33717 ) ( not ( = ?auto_33728 ?auto_33722 ) ) ( not ( = ?auto_33729 ?auto_33728 ) ) ( HOIST-AT ?auto_33725 ?auto_33728 ) ( not ( = ?auto_33724 ?auto_33725 ) ) ( not ( = ?auto_33726 ?auto_33725 ) ) ( SURFACE-AT ?auto_33717 ?auto_33728 ) ( ON ?auto_33717 ?auto_33721 ) ( CLEAR ?auto_33717 ) ( not ( = ?auto_33717 ?auto_33721 ) ) ( not ( = ?auto_33718 ?auto_33721 ) ) ( not ( = ?auto_33716 ?auto_33721 ) ) ( not ( = ?auto_33719 ?auto_33721 ) ) ( IS-CRATE ?auto_33716 ) ( not ( = ?auto_33720 ?auto_33716 ) ) ( not ( = ?auto_33717 ?auto_33720 ) ) ( not ( = ?auto_33718 ?auto_33720 ) ) ( not ( = ?auto_33719 ?auto_33720 ) ) ( not ( = ?auto_33721 ?auto_33720 ) ) ( AVAILABLE ?auto_33725 ) ( SURFACE-AT ?auto_33716 ?auto_33728 ) ( ON ?auto_33716 ?auto_33727 ) ( CLEAR ?auto_33716 ) ( not ( = ?auto_33717 ?auto_33727 ) ) ( not ( = ?auto_33718 ?auto_33727 ) ) ( not ( = ?auto_33716 ?auto_33727 ) ) ( not ( = ?auto_33719 ?auto_33727 ) ) ( not ( = ?auto_33721 ?auto_33727 ) ) ( not ( = ?auto_33720 ?auto_33727 ) ) ( TRUCK-AT ?auto_33730 ?auto_33722 ) ( SURFACE-AT ?auto_33723 ?auto_33722 ) ( CLEAR ?auto_33723 ) ( IS-CRATE ?auto_33720 ) ( not ( = ?auto_33723 ?auto_33720 ) ) ( not ( = ?auto_33717 ?auto_33723 ) ) ( not ( = ?auto_33718 ?auto_33723 ) ) ( not ( = ?auto_33716 ?auto_33723 ) ) ( not ( = ?auto_33719 ?auto_33723 ) ) ( not ( = ?auto_33721 ?auto_33723 ) ) ( not ( = ?auto_33727 ?auto_33723 ) ) ( AVAILABLE ?auto_33724 ) ( IN ?auto_33720 ?auto_33730 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33717 ?auto_33718 )
      ( MAKE-2CRATE-VERIFY ?auto_33716 ?auto_33717 ?auto_33718 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33731 - SURFACE
      ?auto_33732 - SURFACE
      ?auto_33733 - SURFACE
      ?auto_33734 - SURFACE
    )
    :vars
    (
      ?auto_33741 - HOIST
      ?auto_33745 - PLACE
      ?auto_33738 - PLACE
      ?auto_33743 - HOIST
      ?auto_33735 - SURFACE
      ?auto_33739 - PLACE
      ?auto_33742 - HOIST
      ?auto_33744 - SURFACE
      ?auto_33740 - SURFACE
      ?auto_33736 - TRUCK
      ?auto_33737 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33741 ?auto_33745 ) ( IS-CRATE ?auto_33734 ) ( not ( = ?auto_33733 ?auto_33734 ) ) ( not ( = ?auto_33732 ?auto_33733 ) ) ( not ( = ?auto_33732 ?auto_33734 ) ) ( not ( = ?auto_33738 ?auto_33745 ) ) ( HOIST-AT ?auto_33743 ?auto_33738 ) ( not ( = ?auto_33741 ?auto_33743 ) ) ( AVAILABLE ?auto_33743 ) ( SURFACE-AT ?auto_33734 ?auto_33738 ) ( ON ?auto_33734 ?auto_33735 ) ( CLEAR ?auto_33734 ) ( not ( = ?auto_33733 ?auto_33735 ) ) ( not ( = ?auto_33734 ?auto_33735 ) ) ( not ( = ?auto_33732 ?auto_33735 ) ) ( IS-CRATE ?auto_33733 ) ( not ( = ?auto_33739 ?auto_33745 ) ) ( not ( = ?auto_33738 ?auto_33739 ) ) ( HOIST-AT ?auto_33742 ?auto_33739 ) ( not ( = ?auto_33741 ?auto_33742 ) ) ( not ( = ?auto_33743 ?auto_33742 ) ) ( SURFACE-AT ?auto_33733 ?auto_33739 ) ( ON ?auto_33733 ?auto_33744 ) ( CLEAR ?auto_33733 ) ( not ( = ?auto_33733 ?auto_33744 ) ) ( not ( = ?auto_33734 ?auto_33744 ) ) ( not ( = ?auto_33732 ?auto_33744 ) ) ( not ( = ?auto_33735 ?auto_33744 ) ) ( IS-CRATE ?auto_33732 ) ( not ( = ?auto_33731 ?auto_33732 ) ) ( not ( = ?auto_33733 ?auto_33731 ) ) ( not ( = ?auto_33734 ?auto_33731 ) ) ( not ( = ?auto_33735 ?auto_33731 ) ) ( not ( = ?auto_33744 ?auto_33731 ) ) ( AVAILABLE ?auto_33742 ) ( SURFACE-AT ?auto_33732 ?auto_33739 ) ( ON ?auto_33732 ?auto_33740 ) ( CLEAR ?auto_33732 ) ( not ( = ?auto_33733 ?auto_33740 ) ) ( not ( = ?auto_33734 ?auto_33740 ) ) ( not ( = ?auto_33732 ?auto_33740 ) ) ( not ( = ?auto_33735 ?auto_33740 ) ) ( not ( = ?auto_33744 ?auto_33740 ) ) ( not ( = ?auto_33731 ?auto_33740 ) ) ( TRUCK-AT ?auto_33736 ?auto_33745 ) ( SURFACE-AT ?auto_33737 ?auto_33745 ) ( CLEAR ?auto_33737 ) ( IS-CRATE ?auto_33731 ) ( not ( = ?auto_33737 ?auto_33731 ) ) ( not ( = ?auto_33733 ?auto_33737 ) ) ( not ( = ?auto_33734 ?auto_33737 ) ) ( not ( = ?auto_33732 ?auto_33737 ) ) ( not ( = ?auto_33735 ?auto_33737 ) ) ( not ( = ?auto_33744 ?auto_33737 ) ) ( not ( = ?auto_33740 ?auto_33737 ) ) ( AVAILABLE ?auto_33741 ) ( IN ?auto_33731 ?auto_33736 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33732 ?auto_33733 ?auto_33734 )
      ( MAKE-3CRATE-VERIFY ?auto_33731 ?auto_33732 ?auto_33733 ?auto_33734 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33746 - SURFACE
      ?auto_33747 - SURFACE
      ?auto_33748 - SURFACE
      ?auto_33749 - SURFACE
      ?auto_33750 - SURFACE
    )
    :vars
    (
      ?auto_33756 - HOIST
      ?auto_33760 - PLACE
      ?auto_33753 - PLACE
      ?auto_33758 - HOIST
      ?auto_33751 - SURFACE
      ?auto_33754 - PLACE
      ?auto_33757 - HOIST
      ?auto_33759 - SURFACE
      ?auto_33755 - SURFACE
      ?auto_33752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33756 ?auto_33760 ) ( IS-CRATE ?auto_33750 ) ( not ( = ?auto_33749 ?auto_33750 ) ) ( not ( = ?auto_33748 ?auto_33749 ) ) ( not ( = ?auto_33748 ?auto_33750 ) ) ( not ( = ?auto_33753 ?auto_33760 ) ) ( HOIST-AT ?auto_33758 ?auto_33753 ) ( not ( = ?auto_33756 ?auto_33758 ) ) ( AVAILABLE ?auto_33758 ) ( SURFACE-AT ?auto_33750 ?auto_33753 ) ( ON ?auto_33750 ?auto_33751 ) ( CLEAR ?auto_33750 ) ( not ( = ?auto_33749 ?auto_33751 ) ) ( not ( = ?auto_33750 ?auto_33751 ) ) ( not ( = ?auto_33748 ?auto_33751 ) ) ( IS-CRATE ?auto_33749 ) ( not ( = ?auto_33754 ?auto_33760 ) ) ( not ( = ?auto_33753 ?auto_33754 ) ) ( HOIST-AT ?auto_33757 ?auto_33754 ) ( not ( = ?auto_33756 ?auto_33757 ) ) ( not ( = ?auto_33758 ?auto_33757 ) ) ( SURFACE-AT ?auto_33749 ?auto_33754 ) ( ON ?auto_33749 ?auto_33759 ) ( CLEAR ?auto_33749 ) ( not ( = ?auto_33749 ?auto_33759 ) ) ( not ( = ?auto_33750 ?auto_33759 ) ) ( not ( = ?auto_33748 ?auto_33759 ) ) ( not ( = ?auto_33751 ?auto_33759 ) ) ( IS-CRATE ?auto_33748 ) ( not ( = ?auto_33747 ?auto_33748 ) ) ( not ( = ?auto_33749 ?auto_33747 ) ) ( not ( = ?auto_33750 ?auto_33747 ) ) ( not ( = ?auto_33751 ?auto_33747 ) ) ( not ( = ?auto_33759 ?auto_33747 ) ) ( AVAILABLE ?auto_33757 ) ( SURFACE-AT ?auto_33748 ?auto_33754 ) ( ON ?auto_33748 ?auto_33755 ) ( CLEAR ?auto_33748 ) ( not ( = ?auto_33749 ?auto_33755 ) ) ( not ( = ?auto_33750 ?auto_33755 ) ) ( not ( = ?auto_33748 ?auto_33755 ) ) ( not ( = ?auto_33751 ?auto_33755 ) ) ( not ( = ?auto_33759 ?auto_33755 ) ) ( not ( = ?auto_33747 ?auto_33755 ) ) ( TRUCK-AT ?auto_33752 ?auto_33760 ) ( SURFACE-AT ?auto_33746 ?auto_33760 ) ( CLEAR ?auto_33746 ) ( IS-CRATE ?auto_33747 ) ( not ( = ?auto_33746 ?auto_33747 ) ) ( not ( = ?auto_33749 ?auto_33746 ) ) ( not ( = ?auto_33750 ?auto_33746 ) ) ( not ( = ?auto_33748 ?auto_33746 ) ) ( not ( = ?auto_33751 ?auto_33746 ) ) ( not ( = ?auto_33759 ?auto_33746 ) ) ( not ( = ?auto_33755 ?auto_33746 ) ) ( AVAILABLE ?auto_33756 ) ( IN ?auto_33747 ?auto_33752 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33748 ?auto_33749 ?auto_33750 )
      ( MAKE-4CRATE-VERIFY ?auto_33746 ?auto_33747 ?auto_33748 ?auto_33749 ?auto_33750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33761 - SURFACE
      ?auto_33762 - SURFACE
    )
    :vars
    (
      ?auto_33770 - HOIST
      ?auto_33774 - PLACE
      ?auto_33775 - SURFACE
      ?auto_33767 - PLACE
      ?auto_33772 - HOIST
      ?auto_33764 - SURFACE
      ?auto_33768 - PLACE
      ?auto_33771 - HOIST
      ?auto_33773 - SURFACE
      ?auto_33763 - SURFACE
      ?auto_33769 - SURFACE
      ?auto_33766 - SURFACE
      ?auto_33765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33770 ?auto_33774 ) ( IS-CRATE ?auto_33762 ) ( not ( = ?auto_33761 ?auto_33762 ) ) ( not ( = ?auto_33775 ?auto_33761 ) ) ( not ( = ?auto_33775 ?auto_33762 ) ) ( not ( = ?auto_33767 ?auto_33774 ) ) ( HOIST-AT ?auto_33772 ?auto_33767 ) ( not ( = ?auto_33770 ?auto_33772 ) ) ( AVAILABLE ?auto_33772 ) ( SURFACE-AT ?auto_33762 ?auto_33767 ) ( ON ?auto_33762 ?auto_33764 ) ( CLEAR ?auto_33762 ) ( not ( = ?auto_33761 ?auto_33764 ) ) ( not ( = ?auto_33762 ?auto_33764 ) ) ( not ( = ?auto_33775 ?auto_33764 ) ) ( IS-CRATE ?auto_33761 ) ( not ( = ?auto_33768 ?auto_33774 ) ) ( not ( = ?auto_33767 ?auto_33768 ) ) ( HOIST-AT ?auto_33771 ?auto_33768 ) ( not ( = ?auto_33770 ?auto_33771 ) ) ( not ( = ?auto_33772 ?auto_33771 ) ) ( SURFACE-AT ?auto_33761 ?auto_33768 ) ( ON ?auto_33761 ?auto_33773 ) ( CLEAR ?auto_33761 ) ( not ( = ?auto_33761 ?auto_33773 ) ) ( not ( = ?auto_33762 ?auto_33773 ) ) ( not ( = ?auto_33775 ?auto_33773 ) ) ( not ( = ?auto_33764 ?auto_33773 ) ) ( IS-CRATE ?auto_33775 ) ( not ( = ?auto_33763 ?auto_33775 ) ) ( not ( = ?auto_33761 ?auto_33763 ) ) ( not ( = ?auto_33762 ?auto_33763 ) ) ( not ( = ?auto_33764 ?auto_33763 ) ) ( not ( = ?auto_33773 ?auto_33763 ) ) ( AVAILABLE ?auto_33771 ) ( SURFACE-AT ?auto_33775 ?auto_33768 ) ( ON ?auto_33775 ?auto_33769 ) ( CLEAR ?auto_33775 ) ( not ( = ?auto_33761 ?auto_33769 ) ) ( not ( = ?auto_33762 ?auto_33769 ) ) ( not ( = ?auto_33775 ?auto_33769 ) ) ( not ( = ?auto_33764 ?auto_33769 ) ) ( not ( = ?auto_33773 ?auto_33769 ) ) ( not ( = ?auto_33763 ?auto_33769 ) ) ( SURFACE-AT ?auto_33766 ?auto_33774 ) ( CLEAR ?auto_33766 ) ( IS-CRATE ?auto_33763 ) ( not ( = ?auto_33766 ?auto_33763 ) ) ( not ( = ?auto_33761 ?auto_33766 ) ) ( not ( = ?auto_33762 ?auto_33766 ) ) ( not ( = ?auto_33775 ?auto_33766 ) ) ( not ( = ?auto_33764 ?auto_33766 ) ) ( not ( = ?auto_33773 ?auto_33766 ) ) ( not ( = ?auto_33769 ?auto_33766 ) ) ( AVAILABLE ?auto_33770 ) ( IN ?auto_33763 ?auto_33765 ) ( TRUCK-AT ?auto_33765 ?auto_33768 ) )
    :subtasks
    ( ( !DRIVE ?auto_33765 ?auto_33768 ?auto_33774 )
      ( MAKE-2CRATE ?auto_33775 ?auto_33761 ?auto_33762 )
      ( MAKE-1CRATE-VERIFY ?auto_33761 ?auto_33762 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33776 - SURFACE
      ?auto_33777 - SURFACE
      ?auto_33778 - SURFACE
    )
    :vars
    (
      ?auto_33788 - HOIST
      ?auto_33787 - PLACE
      ?auto_33780 - PLACE
      ?auto_33789 - HOIST
      ?auto_33781 - SURFACE
      ?auto_33785 - PLACE
      ?auto_33786 - HOIST
      ?auto_33790 - SURFACE
      ?auto_33779 - SURFACE
      ?auto_33784 - SURFACE
      ?auto_33783 - SURFACE
      ?auto_33782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33788 ?auto_33787 ) ( IS-CRATE ?auto_33778 ) ( not ( = ?auto_33777 ?auto_33778 ) ) ( not ( = ?auto_33776 ?auto_33777 ) ) ( not ( = ?auto_33776 ?auto_33778 ) ) ( not ( = ?auto_33780 ?auto_33787 ) ) ( HOIST-AT ?auto_33789 ?auto_33780 ) ( not ( = ?auto_33788 ?auto_33789 ) ) ( AVAILABLE ?auto_33789 ) ( SURFACE-AT ?auto_33778 ?auto_33780 ) ( ON ?auto_33778 ?auto_33781 ) ( CLEAR ?auto_33778 ) ( not ( = ?auto_33777 ?auto_33781 ) ) ( not ( = ?auto_33778 ?auto_33781 ) ) ( not ( = ?auto_33776 ?auto_33781 ) ) ( IS-CRATE ?auto_33777 ) ( not ( = ?auto_33785 ?auto_33787 ) ) ( not ( = ?auto_33780 ?auto_33785 ) ) ( HOIST-AT ?auto_33786 ?auto_33785 ) ( not ( = ?auto_33788 ?auto_33786 ) ) ( not ( = ?auto_33789 ?auto_33786 ) ) ( SURFACE-AT ?auto_33777 ?auto_33785 ) ( ON ?auto_33777 ?auto_33790 ) ( CLEAR ?auto_33777 ) ( not ( = ?auto_33777 ?auto_33790 ) ) ( not ( = ?auto_33778 ?auto_33790 ) ) ( not ( = ?auto_33776 ?auto_33790 ) ) ( not ( = ?auto_33781 ?auto_33790 ) ) ( IS-CRATE ?auto_33776 ) ( not ( = ?auto_33779 ?auto_33776 ) ) ( not ( = ?auto_33777 ?auto_33779 ) ) ( not ( = ?auto_33778 ?auto_33779 ) ) ( not ( = ?auto_33781 ?auto_33779 ) ) ( not ( = ?auto_33790 ?auto_33779 ) ) ( AVAILABLE ?auto_33786 ) ( SURFACE-AT ?auto_33776 ?auto_33785 ) ( ON ?auto_33776 ?auto_33784 ) ( CLEAR ?auto_33776 ) ( not ( = ?auto_33777 ?auto_33784 ) ) ( not ( = ?auto_33778 ?auto_33784 ) ) ( not ( = ?auto_33776 ?auto_33784 ) ) ( not ( = ?auto_33781 ?auto_33784 ) ) ( not ( = ?auto_33790 ?auto_33784 ) ) ( not ( = ?auto_33779 ?auto_33784 ) ) ( SURFACE-AT ?auto_33783 ?auto_33787 ) ( CLEAR ?auto_33783 ) ( IS-CRATE ?auto_33779 ) ( not ( = ?auto_33783 ?auto_33779 ) ) ( not ( = ?auto_33777 ?auto_33783 ) ) ( not ( = ?auto_33778 ?auto_33783 ) ) ( not ( = ?auto_33776 ?auto_33783 ) ) ( not ( = ?auto_33781 ?auto_33783 ) ) ( not ( = ?auto_33790 ?auto_33783 ) ) ( not ( = ?auto_33784 ?auto_33783 ) ) ( AVAILABLE ?auto_33788 ) ( IN ?auto_33779 ?auto_33782 ) ( TRUCK-AT ?auto_33782 ?auto_33785 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33777 ?auto_33778 )
      ( MAKE-2CRATE-VERIFY ?auto_33776 ?auto_33777 ?auto_33778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33791 - SURFACE
      ?auto_33792 - SURFACE
      ?auto_33793 - SURFACE
      ?auto_33794 - SURFACE
    )
    :vars
    (
      ?auto_33795 - HOIST
      ?auto_33801 - PLACE
      ?auto_33798 - PLACE
      ?auto_33796 - HOIST
      ?auto_33803 - SURFACE
      ?auto_33799 - PLACE
      ?auto_33802 - HOIST
      ?auto_33797 - SURFACE
      ?auto_33800 - SURFACE
      ?auto_33805 - SURFACE
      ?auto_33804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33795 ?auto_33801 ) ( IS-CRATE ?auto_33794 ) ( not ( = ?auto_33793 ?auto_33794 ) ) ( not ( = ?auto_33792 ?auto_33793 ) ) ( not ( = ?auto_33792 ?auto_33794 ) ) ( not ( = ?auto_33798 ?auto_33801 ) ) ( HOIST-AT ?auto_33796 ?auto_33798 ) ( not ( = ?auto_33795 ?auto_33796 ) ) ( AVAILABLE ?auto_33796 ) ( SURFACE-AT ?auto_33794 ?auto_33798 ) ( ON ?auto_33794 ?auto_33803 ) ( CLEAR ?auto_33794 ) ( not ( = ?auto_33793 ?auto_33803 ) ) ( not ( = ?auto_33794 ?auto_33803 ) ) ( not ( = ?auto_33792 ?auto_33803 ) ) ( IS-CRATE ?auto_33793 ) ( not ( = ?auto_33799 ?auto_33801 ) ) ( not ( = ?auto_33798 ?auto_33799 ) ) ( HOIST-AT ?auto_33802 ?auto_33799 ) ( not ( = ?auto_33795 ?auto_33802 ) ) ( not ( = ?auto_33796 ?auto_33802 ) ) ( SURFACE-AT ?auto_33793 ?auto_33799 ) ( ON ?auto_33793 ?auto_33797 ) ( CLEAR ?auto_33793 ) ( not ( = ?auto_33793 ?auto_33797 ) ) ( not ( = ?auto_33794 ?auto_33797 ) ) ( not ( = ?auto_33792 ?auto_33797 ) ) ( not ( = ?auto_33803 ?auto_33797 ) ) ( IS-CRATE ?auto_33792 ) ( not ( = ?auto_33791 ?auto_33792 ) ) ( not ( = ?auto_33793 ?auto_33791 ) ) ( not ( = ?auto_33794 ?auto_33791 ) ) ( not ( = ?auto_33803 ?auto_33791 ) ) ( not ( = ?auto_33797 ?auto_33791 ) ) ( AVAILABLE ?auto_33802 ) ( SURFACE-AT ?auto_33792 ?auto_33799 ) ( ON ?auto_33792 ?auto_33800 ) ( CLEAR ?auto_33792 ) ( not ( = ?auto_33793 ?auto_33800 ) ) ( not ( = ?auto_33794 ?auto_33800 ) ) ( not ( = ?auto_33792 ?auto_33800 ) ) ( not ( = ?auto_33803 ?auto_33800 ) ) ( not ( = ?auto_33797 ?auto_33800 ) ) ( not ( = ?auto_33791 ?auto_33800 ) ) ( SURFACE-AT ?auto_33805 ?auto_33801 ) ( CLEAR ?auto_33805 ) ( IS-CRATE ?auto_33791 ) ( not ( = ?auto_33805 ?auto_33791 ) ) ( not ( = ?auto_33793 ?auto_33805 ) ) ( not ( = ?auto_33794 ?auto_33805 ) ) ( not ( = ?auto_33792 ?auto_33805 ) ) ( not ( = ?auto_33803 ?auto_33805 ) ) ( not ( = ?auto_33797 ?auto_33805 ) ) ( not ( = ?auto_33800 ?auto_33805 ) ) ( AVAILABLE ?auto_33795 ) ( IN ?auto_33791 ?auto_33804 ) ( TRUCK-AT ?auto_33804 ?auto_33799 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33792 ?auto_33793 ?auto_33794 )
      ( MAKE-3CRATE-VERIFY ?auto_33791 ?auto_33792 ?auto_33793 ?auto_33794 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33806 - SURFACE
      ?auto_33807 - SURFACE
      ?auto_33808 - SURFACE
      ?auto_33809 - SURFACE
      ?auto_33810 - SURFACE
    )
    :vars
    (
      ?auto_33811 - HOIST
      ?auto_33817 - PLACE
      ?auto_33814 - PLACE
      ?auto_33812 - HOIST
      ?auto_33819 - SURFACE
      ?auto_33815 - PLACE
      ?auto_33818 - HOIST
      ?auto_33813 - SURFACE
      ?auto_33816 - SURFACE
      ?auto_33820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33811 ?auto_33817 ) ( IS-CRATE ?auto_33810 ) ( not ( = ?auto_33809 ?auto_33810 ) ) ( not ( = ?auto_33808 ?auto_33809 ) ) ( not ( = ?auto_33808 ?auto_33810 ) ) ( not ( = ?auto_33814 ?auto_33817 ) ) ( HOIST-AT ?auto_33812 ?auto_33814 ) ( not ( = ?auto_33811 ?auto_33812 ) ) ( AVAILABLE ?auto_33812 ) ( SURFACE-AT ?auto_33810 ?auto_33814 ) ( ON ?auto_33810 ?auto_33819 ) ( CLEAR ?auto_33810 ) ( not ( = ?auto_33809 ?auto_33819 ) ) ( not ( = ?auto_33810 ?auto_33819 ) ) ( not ( = ?auto_33808 ?auto_33819 ) ) ( IS-CRATE ?auto_33809 ) ( not ( = ?auto_33815 ?auto_33817 ) ) ( not ( = ?auto_33814 ?auto_33815 ) ) ( HOIST-AT ?auto_33818 ?auto_33815 ) ( not ( = ?auto_33811 ?auto_33818 ) ) ( not ( = ?auto_33812 ?auto_33818 ) ) ( SURFACE-AT ?auto_33809 ?auto_33815 ) ( ON ?auto_33809 ?auto_33813 ) ( CLEAR ?auto_33809 ) ( not ( = ?auto_33809 ?auto_33813 ) ) ( not ( = ?auto_33810 ?auto_33813 ) ) ( not ( = ?auto_33808 ?auto_33813 ) ) ( not ( = ?auto_33819 ?auto_33813 ) ) ( IS-CRATE ?auto_33808 ) ( not ( = ?auto_33807 ?auto_33808 ) ) ( not ( = ?auto_33809 ?auto_33807 ) ) ( not ( = ?auto_33810 ?auto_33807 ) ) ( not ( = ?auto_33819 ?auto_33807 ) ) ( not ( = ?auto_33813 ?auto_33807 ) ) ( AVAILABLE ?auto_33818 ) ( SURFACE-AT ?auto_33808 ?auto_33815 ) ( ON ?auto_33808 ?auto_33816 ) ( CLEAR ?auto_33808 ) ( not ( = ?auto_33809 ?auto_33816 ) ) ( not ( = ?auto_33810 ?auto_33816 ) ) ( not ( = ?auto_33808 ?auto_33816 ) ) ( not ( = ?auto_33819 ?auto_33816 ) ) ( not ( = ?auto_33813 ?auto_33816 ) ) ( not ( = ?auto_33807 ?auto_33816 ) ) ( SURFACE-AT ?auto_33806 ?auto_33817 ) ( CLEAR ?auto_33806 ) ( IS-CRATE ?auto_33807 ) ( not ( = ?auto_33806 ?auto_33807 ) ) ( not ( = ?auto_33809 ?auto_33806 ) ) ( not ( = ?auto_33810 ?auto_33806 ) ) ( not ( = ?auto_33808 ?auto_33806 ) ) ( not ( = ?auto_33819 ?auto_33806 ) ) ( not ( = ?auto_33813 ?auto_33806 ) ) ( not ( = ?auto_33816 ?auto_33806 ) ) ( AVAILABLE ?auto_33811 ) ( IN ?auto_33807 ?auto_33820 ) ( TRUCK-AT ?auto_33820 ?auto_33815 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33808 ?auto_33809 ?auto_33810 )
      ( MAKE-4CRATE-VERIFY ?auto_33806 ?auto_33807 ?auto_33808 ?auto_33809 ?auto_33810 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33821 - SURFACE
      ?auto_33822 - SURFACE
    )
    :vars
    (
      ?auto_33823 - HOIST
      ?auto_33829 - PLACE
      ?auto_33831 - SURFACE
      ?auto_33826 - PLACE
      ?auto_33824 - HOIST
      ?auto_33833 - SURFACE
      ?auto_33827 - PLACE
      ?auto_33830 - HOIST
      ?auto_33825 - SURFACE
      ?auto_33832 - SURFACE
      ?auto_33828 - SURFACE
      ?auto_33835 - SURFACE
      ?auto_33834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33823 ?auto_33829 ) ( IS-CRATE ?auto_33822 ) ( not ( = ?auto_33821 ?auto_33822 ) ) ( not ( = ?auto_33831 ?auto_33821 ) ) ( not ( = ?auto_33831 ?auto_33822 ) ) ( not ( = ?auto_33826 ?auto_33829 ) ) ( HOIST-AT ?auto_33824 ?auto_33826 ) ( not ( = ?auto_33823 ?auto_33824 ) ) ( AVAILABLE ?auto_33824 ) ( SURFACE-AT ?auto_33822 ?auto_33826 ) ( ON ?auto_33822 ?auto_33833 ) ( CLEAR ?auto_33822 ) ( not ( = ?auto_33821 ?auto_33833 ) ) ( not ( = ?auto_33822 ?auto_33833 ) ) ( not ( = ?auto_33831 ?auto_33833 ) ) ( IS-CRATE ?auto_33821 ) ( not ( = ?auto_33827 ?auto_33829 ) ) ( not ( = ?auto_33826 ?auto_33827 ) ) ( HOIST-AT ?auto_33830 ?auto_33827 ) ( not ( = ?auto_33823 ?auto_33830 ) ) ( not ( = ?auto_33824 ?auto_33830 ) ) ( SURFACE-AT ?auto_33821 ?auto_33827 ) ( ON ?auto_33821 ?auto_33825 ) ( CLEAR ?auto_33821 ) ( not ( = ?auto_33821 ?auto_33825 ) ) ( not ( = ?auto_33822 ?auto_33825 ) ) ( not ( = ?auto_33831 ?auto_33825 ) ) ( not ( = ?auto_33833 ?auto_33825 ) ) ( IS-CRATE ?auto_33831 ) ( not ( = ?auto_33832 ?auto_33831 ) ) ( not ( = ?auto_33821 ?auto_33832 ) ) ( not ( = ?auto_33822 ?auto_33832 ) ) ( not ( = ?auto_33833 ?auto_33832 ) ) ( not ( = ?auto_33825 ?auto_33832 ) ) ( SURFACE-AT ?auto_33831 ?auto_33827 ) ( ON ?auto_33831 ?auto_33828 ) ( CLEAR ?auto_33831 ) ( not ( = ?auto_33821 ?auto_33828 ) ) ( not ( = ?auto_33822 ?auto_33828 ) ) ( not ( = ?auto_33831 ?auto_33828 ) ) ( not ( = ?auto_33833 ?auto_33828 ) ) ( not ( = ?auto_33825 ?auto_33828 ) ) ( not ( = ?auto_33832 ?auto_33828 ) ) ( SURFACE-AT ?auto_33835 ?auto_33829 ) ( CLEAR ?auto_33835 ) ( IS-CRATE ?auto_33832 ) ( not ( = ?auto_33835 ?auto_33832 ) ) ( not ( = ?auto_33821 ?auto_33835 ) ) ( not ( = ?auto_33822 ?auto_33835 ) ) ( not ( = ?auto_33831 ?auto_33835 ) ) ( not ( = ?auto_33833 ?auto_33835 ) ) ( not ( = ?auto_33825 ?auto_33835 ) ) ( not ( = ?auto_33828 ?auto_33835 ) ) ( AVAILABLE ?auto_33823 ) ( TRUCK-AT ?auto_33834 ?auto_33827 ) ( LIFTING ?auto_33830 ?auto_33832 ) )
    :subtasks
    ( ( !LOAD ?auto_33830 ?auto_33832 ?auto_33834 ?auto_33827 )
      ( MAKE-2CRATE ?auto_33831 ?auto_33821 ?auto_33822 )
      ( MAKE-1CRATE-VERIFY ?auto_33821 ?auto_33822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33836 - SURFACE
      ?auto_33837 - SURFACE
      ?auto_33838 - SURFACE
    )
    :vars
    (
      ?auto_33842 - HOIST
      ?auto_33839 - PLACE
      ?auto_33841 - PLACE
      ?auto_33850 - HOIST
      ?auto_33845 - SURFACE
      ?auto_33847 - PLACE
      ?auto_33844 - HOIST
      ?auto_33848 - SURFACE
      ?auto_33843 - SURFACE
      ?auto_33846 - SURFACE
      ?auto_33840 - SURFACE
      ?auto_33849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33842 ?auto_33839 ) ( IS-CRATE ?auto_33838 ) ( not ( = ?auto_33837 ?auto_33838 ) ) ( not ( = ?auto_33836 ?auto_33837 ) ) ( not ( = ?auto_33836 ?auto_33838 ) ) ( not ( = ?auto_33841 ?auto_33839 ) ) ( HOIST-AT ?auto_33850 ?auto_33841 ) ( not ( = ?auto_33842 ?auto_33850 ) ) ( AVAILABLE ?auto_33850 ) ( SURFACE-AT ?auto_33838 ?auto_33841 ) ( ON ?auto_33838 ?auto_33845 ) ( CLEAR ?auto_33838 ) ( not ( = ?auto_33837 ?auto_33845 ) ) ( not ( = ?auto_33838 ?auto_33845 ) ) ( not ( = ?auto_33836 ?auto_33845 ) ) ( IS-CRATE ?auto_33837 ) ( not ( = ?auto_33847 ?auto_33839 ) ) ( not ( = ?auto_33841 ?auto_33847 ) ) ( HOIST-AT ?auto_33844 ?auto_33847 ) ( not ( = ?auto_33842 ?auto_33844 ) ) ( not ( = ?auto_33850 ?auto_33844 ) ) ( SURFACE-AT ?auto_33837 ?auto_33847 ) ( ON ?auto_33837 ?auto_33848 ) ( CLEAR ?auto_33837 ) ( not ( = ?auto_33837 ?auto_33848 ) ) ( not ( = ?auto_33838 ?auto_33848 ) ) ( not ( = ?auto_33836 ?auto_33848 ) ) ( not ( = ?auto_33845 ?auto_33848 ) ) ( IS-CRATE ?auto_33836 ) ( not ( = ?auto_33843 ?auto_33836 ) ) ( not ( = ?auto_33837 ?auto_33843 ) ) ( not ( = ?auto_33838 ?auto_33843 ) ) ( not ( = ?auto_33845 ?auto_33843 ) ) ( not ( = ?auto_33848 ?auto_33843 ) ) ( SURFACE-AT ?auto_33836 ?auto_33847 ) ( ON ?auto_33836 ?auto_33846 ) ( CLEAR ?auto_33836 ) ( not ( = ?auto_33837 ?auto_33846 ) ) ( not ( = ?auto_33838 ?auto_33846 ) ) ( not ( = ?auto_33836 ?auto_33846 ) ) ( not ( = ?auto_33845 ?auto_33846 ) ) ( not ( = ?auto_33848 ?auto_33846 ) ) ( not ( = ?auto_33843 ?auto_33846 ) ) ( SURFACE-AT ?auto_33840 ?auto_33839 ) ( CLEAR ?auto_33840 ) ( IS-CRATE ?auto_33843 ) ( not ( = ?auto_33840 ?auto_33843 ) ) ( not ( = ?auto_33837 ?auto_33840 ) ) ( not ( = ?auto_33838 ?auto_33840 ) ) ( not ( = ?auto_33836 ?auto_33840 ) ) ( not ( = ?auto_33845 ?auto_33840 ) ) ( not ( = ?auto_33848 ?auto_33840 ) ) ( not ( = ?auto_33846 ?auto_33840 ) ) ( AVAILABLE ?auto_33842 ) ( TRUCK-AT ?auto_33849 ?auto_33847 ) ( LIFTING ?auto_33844 ?auto_33843 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33837 ?auto_33838 )
      ( MAKE-2CRATE-VERIFY ?auto_33836 ?auto_33837 ?auto_33838 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33851 - SURFACE
      ?auto_33852 - SURFACE
      ?auto_33853 - SURFACE
      ?auto_33854 - SURFACE
    )
    :vars
    (
      ?auto_33858 - HOIST
      ?auto_33865 - PLACE
      ?auto_33864 - PLACE
      ?auto_33859 - HOIST
      ?auto_33856 - SURFACE
      ?auto_33855 - PLACE
      ?auto_33857 - HOIST
      ?auto_33860 - SURFACE
      ?auto_33863 - SURFACE
      ?auto_33862 - SURFACE
      ?auto_33861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33858 ?auto_33865 ) ( IS-CRATE ?auto_33854 ) ( not ( = ?auto_33853 ?auto_33854 ) ) ( not ( = ?auto_33852 ?auto_33853 ) ) ( not ( = ?auto_33852 ?auto_33854 ) ) ( not ( = ?auto_33864 ?auto_33865 ) ) ( HOIST-AT ?auto_33859 ?auto_33864 ) ( not ( = ?auto_33858 ?auto_33859 ) ) ( AVAILABLE ?auto_33859 ) ( SURFACE-AT ?auto_33854 ?auto_33864 ) ( ON ?auto_33854 ?auto_33856 ) ( CLEAR ?auto_33854 ) ( not ( = ?auto_33853 ?auto_33856 ) ) ( not ( = ?auto_33854 ?auto_33856 ) ) ( not ( = ?auto_33852 ?auto_33856 ) ) ( IS-CRATE ?auto_33853 ) ( not ( = ?auto_33855 ?auto_33865 ) ) ( not ( = ?auto_33864 ?auto_33855 ) ) ( HOIST-AT ?auto_33857 ?auto_33855 ) ( not ( = ?auto_33858 ?auto_33857 ) ) ( not ( = ?auto_33859 ?auto_33857 ) ) ( SURFACE-AT ?auto_33853 ?auto_33855 ) ( ON ?auto_33853 ?auto_33860 ) ( CLEAR ?auto_33853 ) ( not ( = ?auto_33853 ?auto_33860 ) ) ( not ( = ?auto_33854 ?auto_33860 ) ) ( not ( = ?auto_33852 ?auto_33860 ) ) ( not ( = ?auto_33856 ?auto_33860 ) ) ( IS-CRATE ?auto_33852 ) ( not ( = ?auto_33851 ?auto_33852 ) ) ( not ( = ?auto_33853 ?auto_33851 ) ) ( not ( = ?auto_33854 ?auto_33851 ) ) ( not ( = ?auto_33856 ?auto_33851 ) ) ( not ( = ?auto_33860 ?auto_33851 ) ) ( SURFACE-AT ?auto_33852 ?auto_33855 ) ( ON ?auto_33852 ?auto_33863 ) ( CLEAR ?auto_33852 ) ( not ( = ?auto_33853 ?auto_33863 ) ) ( not ( = ?auto_33854 ?auto_33863 ) ) ( not ( = ?auto_33852 ?auto_33863 ) ) ( not ( = ?auto_33856 ?auto_33863 ) ) ( not ( = ?auto_33860 ?auto_33863 ) ) ( not ( = ?auto_33851 ?auto_33863 ) ) ( SURFACE-AT ?auto_33862 ?auto_33865 ) ( CLEAR ?auto_33862 ) ( IS-CRATE ?auto_33851 ) ( not ( = ?auto_33862 ?auto_33851 ) ) ( not ( = ?auto_33853 ?auto_33862 ) ) ( not ( = ?auto_33854 ?auto_33862 ) ) ( not ( = ?auto_33852 ?auto_33862 ) ) ( not ( = ?auto_33856 ?auto_33862 ) ) ( not ( = ?auto_33860 ?auto_33862 ) ) ( not ( = ?auto_33863 ?auto_33862 ) ) ( AVAILABLE ?auto_33858 ) ( TRUCK-AT ?auto_33861 ?auto_33855 ) ( LIFTING ?auto_33857 ?auto_33851 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33852 ?auto_33853 ?auto_33854 )
      ( MAKE-3CRATE-VERIFY ?auto_33851 ?auto_33852 ?auto_33853 ?auto_33854 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33866 - SURFACE
      ?auto_33867 - SURFACE
      ?auto_33868 - SURFACE
      ?auto_33869 - SURFACE
      ?auto_33870 - SURFACE
    )
    :vars
    (
      ?auto_33874 - HOIST
      ?auto_33880 - PLACE
      ?auto_33879 - PLACE
      ?auto_33875 - HOIST
      ?auto_33872 - SURFACE
      ?auto_33871 - PLACE
      ?auto_33873 - HOIST
      ?auto_33876 - SURFACE
      ?auto_33878 - SURFACE
      ?auto_33877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33874 ?auto_33880 ) ( IS-CRATE ?auto_33870 ) ( not ( = ?auto_33869 ?auto_33870 ) ) ( not ( = ?auto_33868 ?auto_33869 ) ) ( not ( = ?auto_33868 ?auto_33870 ) ) ( not ( = ?auto_33879 ?auto_33880 ) ) ( HOIST-AT ?auto_33875 ?auto_33879 ) ( not ( = ?auto_33874 ?auto_33875 ) ) ( AVAILABLE ?auto_33875 ) ( SURFACE-AT ?auto_33870 ?auto_33879 ) ( ON ?auto_33870 ?auto_33872 ) ( CLEAR ?auto_33870 ) ( not ( = ?auto_33869 ?auto_33872 ) ) ( not ( = ?auto_33870 ?auto_33872 ) ) ( not ( = ?auto_33868 ?auto_33872 ) ) ( IS-CRATE ?auto_33869 ) ( not ( = ?auto_33871 ?auto_33880 ) ) ( not ( = ?auto_33879 ?auto_33871 ) ) ( HOIST-AT ?auto_33873 ?auto_33871 ) ( not ( = ?auto_33874 ?auto_33873 ) ) ( not ( = ?auto_33875 ?auto_33873 ) ) ( SURFACE-AT ?auto_33869 ?auto_33871 ) ( ON ?auto_33869 ?auto_33876 ) ( CLEAR ?auto_33869 ) ( not ( = ?auto_33869 ?auto_33876 ) ) ( not ( = ?auto_33870 ?auto_33876 ) ) ( not ( = ?auto_33868 ?auto_33876 ) ) ( not ( = ?auto_33872 ?auto_33876 ) ) ( IS-CRATE ?auto_33868 ) ( not ( = ?auto_33867 ?auto_33868 ) ) ( not ( = ?auto_33869 ?auto_33867 ) ) ( not ( = ?auto_33870 ?auto_33867 ) ) ( not ( = ?auto_33872 ?auto_33867 ) ) ( not ( = ?auto_33876 ?auto_33867 ) ) ( SURFACE-AT ?auto_33868 ?auto_33871 ) ( ON ?auto_33868 ?auto_33878 ) ( CLEAR ?auto_33868 ) ( not ( = ?auto_33869 ?auto_33878 ) ) ( not ( = ?auto_33870 ?auto_33878 ) ) ( not ( = ?auto_33868 ?auto_33878 ) ) ( not ( = ?auto_33872 ?auto_33878 ) ) ( not ( = ?auto_33876 ?auto_33878 ) ) ( not ( = ?auto_33867 ?auto_33878 ) ) ( SURFACE-AT ?auto_33866 ?auto_33880 ) ( CLEAR ?auto_33866 ) ( IS-CRATE ?auto_33867 ) ( not ( = ?auto_33866 ?auto_33867 ) ) ( not ( = ?auto_33869 ?auto_33866 ) ) ( not ( = ?auto_33870 ?auto_33866 ) ) ( not ( = ?auto_33868 ?auto_33866 ) ) ( not ( = ?auto_33872 ?auto_33866 ) ) ( not ( = ?auto_33876 ?auto_33866 ) ) ( not ( = ?auto_33878 ?auto_33866 ) ) ( AVAILABLE ?auto_33874 ) ( TRUCK-AT ?auto_33877 ?auto_33871 ) ( LIFTING ?auto_33873 ?auto_33867 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33868 ?auto_33869 ?auto_33870 )
      ( MAKE-4CRATE-VERIFY ?auto_33866 ?auto_33867 ?auto_33868 ?auto_33869 ?auto_33870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33881 - SURFACE
      ?auto_33882 - SURFACE
    )
    :vars
    (
      ?auto_33887 - HOIST
      ?auto_33895 - PLACE
      ?auto_33892 - SURFACE
      ?auto_33894 - PLACE
      ?auto_33888 - HOIST
      ?auto_33885 - SURFACE
      ?auto_33884 - PLACE
      ?auto_33886 - HOIST
      ?auto_33889 - SURFACE
      ?auto_33883 - SURFACE
      ?auto_33893 - SURFACE
      ?auto_33891 - SURFACE
      ?auto_33890 - TRUCK
      ?auto_33896 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33887 ?auto_33895 ) ( IS-CRATE ?auto_33882 ) ( not ( = ?auto_33881 ?auto_33882 ) ) ( not ( = ?auto_33892 ?auto_33881 ) ) ( not ( = ?auto_33892 ?auto_33882 ) ) ( not ( = ?auto_33894 ?auto_33895 ) ) ( HOIST-AT ?auto_33888 ?auto_33894 ) ( not ( = ?auto_33887 ?auto_33888 ) ) ( AVAILABLE ?auto_33888 ) ( SURFACE-AT ?auto_33882 ?auto_33894 ) ( ON ?auto_33882 ?auto_33885 ) ( CLEAR ?auto_33882 ) ( not ( = ?auto_33881 ?auto_33885 ) ) ( not ( = ?auto_33882 ?auto_33885 ) ) ( not ( = ?auto_33892 ?auto_33885 ) ) ( IS-CRATE ?auto_33881 ) ( not ( = ?auto_33884 ?auto_33895 ) ) ( not ( = ?auto_33894 ?auto_33884 ) ) ( HOIST-AT ?auto_33886 ?auto_33884 ) ( not ( = ?auto_33887 ?auto_33886 ) ) ( not ( = ?auto_33888 ?auto_33886 ) ) ( SURFACE-AT ?auto_33881 ?auto_33884 ) ( ON ?auto_33881 ?auto_33889 ) ( CLEAR ?auto_33881 ) ( not ( = ?auto_33881 ?auto_33889 ) ) ( not ( = ?auto_33882 ?auto_33889 ) ) ( not ( = ?auto_33892 ?auto_33889 ) ) ( not ( = ?auto_33885 ?auto_33889 ) ) ( IS-CRATE ?auto_33892 ) ( not ( = ?auto_33883 ?auto_33892 ) ) ( not ( = ?auto_33881 ?auto_33883 ) ) ( not ( = ?auto_33882 ?auto_33883 ) ) ( not ( = ?auto_33885 ?auto_33883 ) ) ( not ( = ?auto_33889 ?auto_33883 ) ) ( SURFACE-AT ?auto_33892 ?auto_33884 ) ( ON ?auto_33892 ?auto_33893 ) ( CLEAR ?auto_33892 ) ( not ( = ?auto_33881 ?auto_33893 ) ) ( not ( = ?auto_33882 ?auto_33893 ) ) ( not ( = ?auto_33892 ?auto_33893 ) ) ( not ( = ?auto_33885 ?auto_33893 ) ) ( not ( = ?auto_33889 ?auto_33893 ) ) ( not ( = ?auto_33883 ?auto_33893 ) ) ( SURFACE-AT ?auto_33891 ?auto_33895 ) ( CLEAR ?auto_33891 ) ( IS-CRATE ?auto_33883 ) ( not ( = ?auto_33891 ?auto_33883 ) ) ( not ( = ?auto_33881 ?auto_33891 ) ) ( not ( = ?auto_33882 ?auto_33891 ) ) ( not ( = ?auto_33892 ?auto_33891 ) ) ( not ( = ?auto_33885 ?auto_33891 ) ) ( not ( = ?auto_33889 ?auto_33891 ) ) ( not ( = ?auto_33893 ?auto_33891 ) ) ( AVAILABLE ?auto_33887 ) ( TRUCK-AT ?auto_33890 ?auto_33884 ) ( AVAILABLE ?auto_33886 ) ( SURFACE-AT ?auto_33883 ?auto_33884 ) ( ON ?auto_33883 ?auto_33896 ) ( CLEAR ?auto_33883 ) ( not ( = ?auto_33881 ?auto_33896 ) ) ( not ( = ?auto_33882 ?auto_33896 ) ) ( not ( = ?auto_33892 ?auto_33896 ) ) ( not ( = ?auto_33885 ?auto_33896 ) ) ( not ( = ?auto_33889 ?auto_33896 ) ) ( not ( = ?auto_33883 ?auto_33896 ) ) ( not ( = ?auto_33893 ?auto_33896 ) ) ( not ( = ?auto_33891 ?auto_33896 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33886 ?auto_33883 ?auto_33896 ?auto_33884 )
      ( MAKE-2CRATE ?auto_33892 ?auto_33881 ?auto_33882 )
      ( MAKE-1CRATE-VERIFY ?auto_33881 ?auto_33882 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33897 - SURFACE
      ?auto_33898 - SURFACE
      ?auto_33899 - SURFACE
    )
    :vars
    (
      ?auto_33904 - HOIST
      ?auto_33903 - PLACE
      ?auto_33911 - PLACE
      ?auto_33902 - HOIST
      ?auto_33910 - SURFACE
      ?auto_33901 - PLACE
      ?auto_33908 - HOIST
      ?auto_33906 - SURFACE
      ?auto_33909 - SURFACE
      ?auto_33907 - SURFACE
      ?auto_33905 - SURFACE
      ?auto_33900 - TRUCK
      ?auto_33912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33904 ?auto_33903 ) ( IS-CRATE ?auto_33899 ) ( not ( = ?auto_33898 ?auto_33899 ) ) ( not ( = ?auto_33897 ?auto_33898 ) ) ( not ( = ?auto_33897 ?auto_33899 ) ) ( not ( = ?auto_33911 ?auto_33903 ) ) ( HOIST-AT ?auto_33902 ?auto_33911 ) ( not ( = ?auto_33904 ?auto_33902 ) ) ( AVAILABLE ?auto_33902 ) ( SURFACE-AT ?auto_33899 ?auto_33911 ) ( ON ?auto_33899 ?auto_33910 ) ( CLEAR ?auto_33899 ) ( not ( = ?auto_33898 ?auto_33910 ) ) ( not ( = ?auto_33899 ?auto_33910 ) ) ( not ( = ?auto_33897 ?auto_33910 ) ) ( IS-CRATE ?auto_33898 ) ( not ( = ?auto_33901 ?auto_33903 ) ) ( not ( = ?auto_33911 ?auto_33901 ) ) ( HOIST-AT ?auto_33908 ?auto_33901 ) ( not ( = ?auto_33904 ?auto_33908 ) ) ( not ( = ?auto_33902 ?auto_33908 ) ) ( SURFACE-AT ?auto_33898 ?auto_33901 ) ( ON ?auto_33898 ?auto_33906 ) ( CLEAR ?auto_33898 ) ( not ( = ?auto_33898 ?auto_33906 ) ) ( not ( = ?auto_33899 ?auto_33906 ) ) ( not ( = ?auto_33897 ?auto_33906 ) ) ( not ( = ?auto_33910 ?auto_33906 ) ) ( IS-CRATE ?auto_33897 ) ( not ( = ?auto_33909 ?auto_33897 ) ) ( not ( = ?auto_33898 ?auto_33909 ) ) ( not ( = ?auto_33899 ?auto_33909 ) ) ( not ( = ?auto_33910 ?auto_33909 ) ) ( not ( = ?auto_33906 ?auto_33909 ) ) ( SURFACE-AT ?auto_33897 ?auto_33901 ) ( ON ?auto_33897 ?auto_33907 ) ( CLEAR ?auto_33897 ) ( not ( = ?auto_33898 ?auto_33907 ) ) ( not ( = ?auto_33899 ?auto_33907 ) ) ( not ( = ?auto_33897 ?auto_33907 ) ) ( not ( = ?auto_33910 ?auto_33907 ) ) ( not ( = ?auto_33906 ?auto_33907 ) ) ( not ( = ?auto_33909 ?auto_33907 ) ) ( SURFACE-AT ?auto_33905 ?auto_33903 ) ( CLEAR ?auto_33905 ) ( IS-CRATE ?auto_33909 ) ( not ( = ?auto_33905 ?auto_33909 ) ) ( not ( = ?auto_33898 ?auto_33905 ) ) ( not ( = ?auto_33899 ?auto_33905 ) ) ( not ( = ?auto_33897 ?auto_33905 ) ) ( not ( = ?auto_33910 ?auto_33905 ) ) ( not ( = ?auto_33906 ?auto_33905 ) ) ( not ( = ?auto_33907 ?auto_33905 ) ) ( AVAILABLE ?auto_33904 ) ( TRUCK-AT ?auto_33900 ?auto_33901 ) ( AVAILABLE ?auto_33908 ) ( SURFACE-AT ?auto_33909 ?auto_33901 ) ( ON ?auto_33909 ?auto_33912 ) ( CLEAR ?auto_33909 ) ( not ( = ?auto_33898 ?auto_33912 ) ) ( not ( = ?auto_33899 ?auto_33912 ) ) ( not ( = ?auto_33897 ?auto_33912 ) ) ( not ( = ?auto_33910 ?auto_33912 ) ) ( not ( = ?auto_33906 ?auto_33912 ) ) ( not ( = ?auto_33909 ?auto_33912 ) ) ( not ( = ?auto_33907 ?auto_33912 ) ) ( not ( = ?auto_33905 ?auto_33912 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33898 ?auto_33899 )
      ( MAKE-2CRATE-VERIFY ?auto_33897 ?auto_33898 ?auto_33899 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33913 - SURFACE
      ?auto_33914 - SURFACE
      ?auto_33915 - SURFACE
      ?auto_33916 - SURFACE
    )
    :vars
    (
      ?auto_33917 - HOIST
      ?auto_33921 - PLACE
      ?auto_33920 - PLACE
      ?auto_33918 - HOIST
      ?auto_33927 - SURFACE
      ?auto_33925 - PLACE
      ?auto_33919 - HOIST
      ?auto_33923 - SURFACE
      ?auto_33922 - SURFACE
      ?auto_33928 - SURFACE
      ?auto_33926 - TRUCK
      ?auto_33924 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33917 ?auto_33921 ) ( IS-CRATE ?auto_33916 ) ( not ( = ?auto_33915 ?auto_33916 ) ) ( not ( = ?auto_33914 ?auto_33915 ) ) ( not ( = ?auto_33914 ?auto_33916 ) ) ( not ( = ?auto_33920 ?auto_33921 ) ) ( HOIST-AT ?auto_33918 ?auto_33920 ) ( not ( = ?auto_33917 ?auto_33918 ) ) ( AVAILABLE ?auto_33918 ) ( SURFACE-AT ?auto_33916 ?auto_33920 ) ( ON ?auto_33916 ?auto_33927 ) ( CLEAR ?auto_33916 ) ( not ( = ?auto_33915 ?auto_33927 ) ) ( not ( = ?auto_33916 ?auto_33927 ) ) ( not ( = ?auto_33914 ?auto_33927 ) ) ( IS-CRATE ?auto_33915 ) ( not ( = ?auto_33925 ?auto_33921 ) ) ( not ( = ?auto_33920 ?auto_33925 ) ) ( HOIST-AT ?auto_33919 ?auto_33925 ) ( not ( = ?auto_33917 ?auto_33919 ) ) ( not ( = ?auto_33918 ?auto_33919 ) ) ( SURFACE-AT ?auto_33915 ?auto_33925 ) ( ON ?auto_33915 ?auto_33923 ) ( CLEAR ?auto_33915 ) ( not ( = ?auto_33915 ?auto_33923 ) ) ( not ( = ?auto_33916 ?auto_33923 ) ) ( not ( = ?auto_33914 ?auto_33923 ) ) ( not ( = ?auto_33927 ?auto_33923 ) ) ( IS-CRATE ?auto_33914 ) ( not ( = ?auto_33913 ?auto_33914 ) ) ( not ( = ?auto_33915 ?auto_33913 ) ) ( not ( = ?auto_33916 ?auto_33913 ) ) ( not ( = ?auto_33927 ?auto_33913 ) ) ( not ( = ?auto_33923 ?auto_33913 ) ) ( SURFACE-AT ?auto_33914 ?auto_33925 ) ( ON ?auto_33914 ?auto_33922 ) ( CLEAR ?auto_33914 ) ( not ( = ?auto_33915 ?auto_33922 ) ) ( not ( = ?auto_33916 ?auto_33922 ) ) ( not ( = ?auto_33914 ?auto_33922 ) ) ( not ( = ?auto_33927 ?auto_33922 ) ) ( not ( = ?auto_33923 ?auto_33922 ) ) ( not ( = ?auto_33913 ?auto_33922 ) ) ( SURFACE-AT ?auto_33928 ?auto_33921 ) ( CLEAR ?auto_33928 ) ( IS-CRATE ?auto_33913 ) ( not ( = ?auto_33928 ?auto_33913 ) ) ( not ( = ?auto_33915 ?auto_33928 ) ) ( not ( = ?auto_33916 ?auto_33928 ) ) ( not ( = ?auto_33914 ?auto_33928 ) ) ( not ( = ?auto_33927 ?auto_33928 ) ) ( not ( = ?auto_33923 ?auto_33928 ) ) ( not ( = ?auto_33922 ?auto_33928 ) ) ( AVAILABLE ?auto_33917 ) ( TRUCK-AT ?auto_33926 ?auto_33925 ) ( AVAILABLE ?auto_33919 ) ( SURFACE-AT ?auto_33913 ?auto_33925 ) ( ON ?auto_33913 ?auto_33924 ) ( CLEAR ?auto_33913 ) ( not ( = ?auto_33915 ?auto_33924 ) ) ( not ( = ?auto_33916 ?auto_33924 ) ) ( not ( = ?auto_33914 ?auto_33924 ) ) ( not ( = ?auto_33927 ?auto_33924 ) ) ( not ( = ?auto_33923 ?auto_33924 ) ) ( not ( = ?auto_33913 ?auto_33924 ) ) ( not ( = ?auto_33922 ?auto_33924 ) ) ( not ( = ?auto_33928 ?auto_33924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33914 ?auto_33915 ?auto_33916 )
      ( MAKE-3CRATE-VERIFY ?auto_33913 ?auto_33914 ?auto_33915 ?auto_33916 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33929 - SURFACE
      ?auto_33930 - SURFACE
      ?auto_33931 - SURFACE
      ?auto_33932 - SURFACE
      ?auto_33933 - SURFACE
    )
    :vars
    (
      ?auto_33934 - HOIST
      ?auto_33938 - PLACE
      ?auto_33937 - PLACE
      ?auto_33935 - HOIST
      ?auto_33944 - SURFACE
      ?auto_33942 - PLACE
      ?auto_33936 - HOIST
      ?auto_33940 - SURFACE
      ?auto_33939 - SURFACE
      ?auto_33943 - TRUCK
      ?auto_33941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33934 ?auto_33938 ) ( IS-CRATE ?auto_33933 ) ( not ( = ?auto_33932 ?auto_33933 ) ) ( not ( = ?auto_33931 ?auto_33932 ) ) ( not ( = ?auto_33931 ?auto_33933 ) ) ( not ( = ?auto_33937 ?auto_33938 ) ) ( HOIST-AT ?auto_33935 ?auto_33937 ) ( not ( = ?auto_33934 ?auto_33935 ) ) ( AVAILABLE ?auto_33935 ) ( SURFACE-AT ?auto_33933 ?auto_33937 ) ( ON ?auto_33933 ?auto_33944 ) ( CLEAR ?auto_33933 ) ( not ( = ?auto_33932 ?auto_33944 ) ) ( not ( = ?auto_33933 ?auto_33944 ) ) ( not ( = ?auto_33931 ?auto_33944 ) ) ( IS-CRATE ?auto_33932 ) ( not ( = ?auto_33942 ?auto_33938 ) ) ( not ( = ?auto_33937 ?auto_33942 ) ) ( HOIST-AT ?auto_33936 ?auto_33942 ) ( not ( = ?auto_33934 ?auto_33936 ) ) ( not ( = ?auto_33935 ?auto_33936 ) ) ( SURFACE-AT ?auto_33932 ?auto_33942 ) ( ON ?auto_33932 ?auto_33940 ) ( CLEAR ?auto_33932 ) ( not ( = ?auto_33932 ?auto_33940 ) ) ( not ( = ?auto_33933 ?auto_33940 ) ) ( not ( = ?auto_33931 ?auto_33940 ) ) ( not ( = ?auto_33944 ?auto_33940 ) ) ( IS-CRATE ?auto_33931 ) ( not ( = ?auto_33930 ?auto_33931 ) ) ( not ( = ?auto_33932 ?auto_33930 ) ) ( not ( = ?auto_33933 ?auto_33930 ) ) ( not ( = ?auto_33944 ?auto_33930 ) ) ( not ( = ?auto_33940 ?auto_33930 ) ) ( SURFACE-AT ?auto_33931 ?auto_33942 ) ( ON ?auto_33931 ?auto_33939 ) ( CLEAR ?auto_33931 ) ( not ( = ?auto_33932 ?auto_33939 ) ) ( not ( = ?auto_33933 ?auto_33939 ) ) ( not ( = ?auto_33931 ?auto_33939 ) ) ( not ( = ?auto_33944 ?auto_33939 ) ) ( not ( = ?auto_33940 ?auto_33939 ) ) ( not ( = ?auto_33930 ?auto_33939 ) ) ( SURFACE-AT ?auto_33929 ?auto_33938 ) ( CLEAR ?auto_33929 ) ( IS-CRATE ?auto_33930 ) ( not ( = ?auto_33929 ?auto_33930 ) ) ( not ( = ?auto_33932 ?auto_33929 ) ) ( not ( = ?auto_33933 ?auto_33929 ) ) ( not ( = ?auto_33931 ?auto_33929 ) ) ( not ( = ?auto_33944 ?auto_33929 ) ) ( not ( = ?auto_33940 ?auto_33929 ) ) ( not ( = ?auto_33939 ?auto_33929 ) ) ( AVAILABLE ?auto_33934 ) ( TRUCK-AT ?auto_33943 ?auto_33942 ) ( AVAILABLE ?auto_33936 ) ( SURFACE-AT ?auto_33930 ?auto_33942 ) ( ON ?auto_33930 ?auto_33941 ) ( CLEAR ?auto_33930 ) ( not ( = ?auto_33932 ?auto_33941 ) ) ( not ( = ?auto_33933 ?auto_33941 ) ) ( not ( = ?auto_33931 ?auto_33941 ) ) ( not ( = ?auto_33944 ?auto_33941 ) ) ( not ( = ?auto_33940 ?auto_33941 ) ) ( not ( = ?auto_33930 ?auto_33941 ) ) ( not ( = ?auto_33939 ?auto_33941 ) ) ( not ( = ?auto_33929 ?auto_33941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33931 ?auto_33932 ?auto_33933 )
      ( MAKE-4CRATE-VERIFY ?auto_33929 ?auto_33930 ?auto_33931 ?auto_33932 ?auto_33933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33945 - SURFACE
      ?auto_33946 - SURFACE
    )
    :vars
    (
      ?auto_33947 - HOIST
      ?auto_33951 - PLACE
      ?auto_33953 - SURFACE
      ?auto_33950 - PLACE
      ?auto_33948 - HOIST
      ?auto_33959 - SURFACE
      ?auto_33957 - PLACE
      ?auto_33949 - HOIST
      ?auto_33955 - SURFACE
      ?auto_33952 - SURFACE
      ?auto_33954 - SURFACE
      ?auto_33960 - SURFACE
      ?auto_33956 - SURFACE
      ?auto_33958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33947 ?auto_33951 ) ( IS-CRATE ?auto_33946 ) ( not ( = ?auto_33945 ?auto_33946 ) ) ( not ( = ?auto_33953 ?auto_33945 ) ) ( not ( = ?auto_33953 ?auto_33946 ) ) ( not ( = ?auto_33950 ?auto_33951 ) ) ( HOIST-AT ?auto_33948 ?auto_33950 ) ( not ( = ?auto_33947 ?auto_33948 ) ) ( AVAILABLE ?auto_33948 ) ( SURFACE-AT ?auto_33946 ?auto_33950 ) ( ON ?auto_33946 ?auto_33959 ) ( CLEAR ?auto_33946 ) ( not ( = ?auto_33945 ?auto_33959 ) ) ( not ( = ?auto_33946 ?auto_33959 ) ) ( not ( = ?auto_33953 ?auto_33959 ) ) ( IS-CRATE ?auto_33945 ) ( not ( = ?auto_33957 ?auto_33951 ) ) ( not ( = ?auto_33950 ?auto_33957 ) ) ( HOIST-AT ?auto_33949 ?auto_33957 ) ( not ( = ?auto_33947 ?auto_33949 ) ) ( not ( = ?auto_33948 ?auto_33949 ) ) ( SURFACE-AT ?auto_33945 ?auto_33957 ) ( ON ?auto_33945 ?auto_33955 ) ( CLEAR ?auto_33945 ) ( not ( = ?auto_33945 ?auto_33955 ) ) ( not ( = ?auto_33946 ?auto_33955 ) ) ( not ( = ?auto_33953 ?auto_33955 ) ) ( not ( = ?auto_33959 ?auto_33955 ) ) ( IS-CRATE ?auto_33953 ) ( not ( = ?auto_33952 ?auto_33953 ) ) ( not ( = ?auto_33945 ?auto_33952 ) ) ( not ( = ?auto_33946 ?auto_33952 ) ) ( not ( = ?auto_33959 ?auto_33952 ) ) ( not ( = ?auto_33955 ?auto_33952 ) ) ( SURFACE-AT ?auto_33953 ?auto_33957 ) ( ON ?auto_33953 ?auto_33954 ) ( CLEAR ?auto_33953 ) ( not ( = ?auto_33945 ?auto_33954 ) ) ( not ( = ?auto_33946 ?auto_33954 ) ) ( not ( = ?auto_33953 ?auto_33954 ) ) ( not ( = ?auto_33959 ?auto_33954 ) ) ( not ( = ?auto_33955 ?auto_33954 ) ) ( not ( = ?auto_33952 ?auto_33954 ) ) ( SURFACE-AT ?auto_33960 ?auto_33951 ) ( CLEAR ?auto_33960 ) ( IS-CRATE ?auto_33952 ) ( not ( = ?auto_33960 ?auto_33952 ) ) ( not ( = ?auto_33945 ?auto_33960 ) ) ( not ( = ?auto_33946 ?auto_33960 ) ) ( not ( = ?auto_33953 ?auto_33960 ) ) ( not ( = ?auto_33959 ?auto_33960 ) ) ( not ( = ?auto_33955 ?auto_33960 ) ) ( not ( = ?auto_33954 ?auto_33960 ) ) ( AVAILABLE ?auto_33947 ) ( AVAILABLE ?auto_33949 ) ( SURFACE-AT ?auto_33952 ?auto_33957 ) ( ON ?auto_33952 ?auto_33956 ) ( CLEAR ?auto_33952 ) ( not ( = ?auto_33945 ?auto_33956 ) ) ( not ( = ?auto_33946 ?auto_33956 ) ) ( not ( = ?auto_33953 ?auto_33956 ) ) ( not ( = ?auto_33959 ?auto_33956 ) ) ( not ( = ?auto_33955 ?auto_33956 ) ) ( not ( = ?auto_33952 ?auto_33956 ) ) ( not ( = ?auto_33954 ?auto_33956 ) ) ( not ( = ?auto_33960 ?auto_33956 ) ) ( TRUCK-AT ?auto_33958 ?auto_33951 ) )
    :subtasks
    ( ( !DRIVE ?auto_33958 ?auto_33951 ?auto_33957 )
      ( MAKE-2CRATE ?auto_33953 ?auto_33945 ?auto_33946 )
      ( MAKE-1CRATE-VERIFY ?auto_33945 ?auto_33946 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33961 - SURFACE
      ?auto_33962 - SURFACE
      ?auto_33963 - SURFACE
    )
    :vars
    (
      ?auto_33970 - HOIST
      ?auto_33971 - PLACE
      ?auto_33976 - PLACE
      ?auto_33965 - HOIST
      ?auto_33974 - SURFACE
      ?auto_33975 - PLACE
      ?auto_33972 - HOIST
      ?auto_33968 - SURFACE
      ?auto_33966 - SURFACE
      ?auto_33973 - SURFACE
      ?auto_33967 - SURFACE
      ?auto_33964 - SURFACE
      ?auto_33969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33970 ?auto_33971 ) ( IS-CRATE ?auto_33963 ) ( not ( = ?auto_33962 ?auto_33963 ) ) ( not ( = ?auto_33961 ?auto_33962 ) ) ( not ( = ?auto_33961 ?auto_33963 ) ) ( not ( = ?auto_33976 ?auto_33971 ) ) ( HOIST-AT ?auto_33965 ?auto_33976 ) ( not ( = ?auto_33970 ?auto_33965 ) ) ( AVAILABLE ?auto_33965 ) ( SURFACE-AT ?auto_33963 ?auto_33976 ) ( ON ?auto_33963 ?auto_33974 ) ( CLEAR ?auto_33963 ) ( not ( = ?auto_33962 ?auto_33974 ) ) ( not ( = ?auto_33963 ?auto_33974 ) ) ( not ( = ?auto_33961 ?auto_33974 ) ) ( IS-CRATE ?auto_33962 ) ( not ( = ?auto_33975 ?auto_33971 ) ) ( not ( = ?auto_33976 ?auto_33975 ) ) ( HOIST-AT ?auto_33972 ?auto_33975 ) ( not ( = ?auto_33970 ?auto_33972 ) ) ( not ( = ?auto_33965 ?auto_33972 ) ) ( SURFACE-AT ?auto_33962 ?auto_33975 ) ( ON ?auto_33962 ?auto_33968 ) ( CLEAR ?auto_33962 ) ( not ( = ?auto_33962 ?auto_33968 ) ) ( not ( = ?auto_33963 ?auto_33968 ) ) ( not ( = ?auto_33961 ?auto_33968 ) ) ( not ( = ?auto_33974 ?auto_33968 ) ) ( IS-CRATE ?auto_33961 ) ( not ( = ?auto_33966 ?auto_33961 ) ) ( not ( = ?auto_33962 ?auto_33966 ) ) ( not ( = ?auto_33963 ?auto_33966 ) ) ( not ( = ?auto_33974 ?auto_33966 ) ) ( not ( = ?auto_33968 ?auto_33966 ) ) ( SURFACE-AT ?auto_33961 ?auto_33975 ) ( ON ?auto_33961 ?auto_33973 ) ( CLEAR ?auto_33961 ) ( not ( = ?auto_33962 ?auto_33973 ) ) ( not ( = ?auto_33963 ?auto_33973 ) ) ( not ( = ?auto_33961 ?auto_33973 ) ) ( not ( = ?auto_33974 ?auto_33973 ) ) ( not ( = ?auto_33968 ?auto_33973 ) ) ( not ( = ?auto_33966 ?auto_33973 ) ) ( SURFACE-AT ?auto_33967 ?auto_33971 ) ( CLEAR ?auto_33967 ) ( IS-CRATE ?auto_33966 ) ( not ( = ?auto_33967 ?auto_33966 ) ) ( not ( = ?auto_33962 ?auto_33967 ) ) ( not ( = ?auto_33963 ?auto_33967 ) ) ( not ( = ?auto_33961 ?auto_33967 ) ) ( not ( = ?auto_33974 ?auto_33967 ) ) ( not ( = ?auto_33968 ?auto_33967 ) ) ( not ( = ?auto_33973 ?auto_33967 ) ) ( AVAILABLE ?auto_33970 ) ( AVAILABLE ?auto_33972 ) ( SURFACE-AT ?auto_33966 ?auto_33975 ) ( ON ?auto_33966 ?auto_33964 ) ( CLEAR ?auto_33966 ) ( not ( = ?auto_33962 ?auto_33964 ) ) ( not ( = ?auto_33963 ?auto_33964 ) ) ( not ( = ?auto_33961 ?auto_33964 ) ) ( not ( = ?auto_33974 ?auto_33964 ) ) ( not ( = ?auto_33968 ?auto_33964 ) ) ( not ( = ?auto_33966 ?auto_33964 ) ) ( not ( = ?auto_33973 ?auto_33964 ) ) ( not ( = ?auto_33967 ?auto_33964 ) ) ( TRUCK-AT ?auto_33969 ?auto_33971 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33962 ?auto_33963 )
      ( MAKE-2CRATE-VERIFY ?auto_33961 ?auto_33962 ?auto_33963 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33977 - SURFACE
      ?auto_33978 - SURFACE
      ?auto_33979 - SURFACE
      ?auto_33980 - SURFACE
    )
    :vars
    (
      ?auto_33992 - HOIST
      ?auto_33982 - PLACE
      ?auto_33988 - PLACE
      ?auto_33981 - HOIST
      ?auto_33989 - SURFACE
      ?auto_33991 - PLACE
      ?auto_33985 - HOIST
      ?auto_33986 - SURFACE
      ?auto_33983 - SURFACE
      ?auto_33984 - SURFACE
      ?auto_33987 - SURFACE
      ?auto_33990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33992 ?auto_33982 ) ( IS-CRATE ?auto_33980 ) ( not ( = ?auto_33979 ?auto_33980 ) ) ( not ( = ?auto_33978 ?auto_33979 ) ) ( not ( = ?auto_33978 ?auto_33980 ) ) ( not ( = ?auto_33988 ?auto_33982 ) ) ( HOIST-AT ?auto_33981 ?auto_33988 ) ( not ( = ?auto_33992 ?auto_33981 ) ) ( AVAILABLE ?auto_33981 ) ( SURFACE-AT ?auto_33980 ?auto_33988 ) ( ON ?auto_33980 ?auto_33989 ) ( CLEAR ?auto_33980 ) ( not ( = ?auto_33979 ?auto_33989 ) ) ( not ( = ?auto_33980 ?auto_33989 ) ) ( not ( = ?auto_33978 ?auto_33989 ) ) ( IS-CRATE ?auto_33979 ) ( not ( = ?auto_33991 ?auto_33982 ) ) ( not ( = ?auto_33988 ?auto_33991 ) ) ( HOIST-AT ?auto_33985 ?auto_33991 ) ( not ( = ?auto_33992 ?auto_33985 ) ) ( not ( = ?auto_33981 ?auto_33985 ) ) ( SURFACE-AT ?auto_33979 ?auto_33991 ) ( ON ?auto_33979 ?auto_33986 ) ( CLEAR ?auto_33979 ) ( not ( = ?auto_33979 ?auto_33986 ) ) ( not ( = ?auto_33980 ?auto_33986 ) ) ( not ( = ?auto_33978 ?auto_33986 ) ) ( not ( = ?auto_33989 ?auto_33986 ) ) ( IS-CRATE ?auto_33978 ) ( not ( = ?auto_33977 ?auto_33978 ) ) ( not ( = ?auto_33979 ?auto_33977 ) ) ( not ( = ?auto_33980 ?auto_33977 ) ) ( not ( = ?auto_33989 ?auto_33977 ) ) ( not ( = ?auto_33986 ?auto_33977 ) ) ( SURFACE-AT ?auto_33978 ?auto_33991 ) ( ON ?auto_33978 ?auto_33983 ) ( CLEAR ?auto_33978 ) ( not ( = ?auto_33979 ?auto_33983 ) ) ( not ( = ?auto_33980 ?auto_33983 ) ) ( not ( = ?auto_33978 ?auto_33983 ) ) ( not ( = ?auto_33989 ?auto_33983 ) ) ( not ( = ?auto_33986 ?auto_33983 ) ) ( not ( = ?auto_33977 ?auto_33983 ) ) ( SURFACE-AT ?auto_33984 ?auto_33982 ) ( CLEAR ?auto_33984 ) ( IS-CRATE ?auto_33977 ) ( not ( = ?auto_33984 ?auto_33977 ) ) ( not ( = ?auto_33979 ?auto_33984 ) ) ( not ( = ?auto_33980 ?auto_33984 ) ) ( not ( = ?auto_33978 ?auto_33984 ) ) ( not ( = ?auto_33989 ?auto_33984 ) ) ( not ( = ?auto_33986 ?auto_33984 ) ) ( not ( = ?auto_33983 ?auto_33984 ) ) ( AVAILABLE ?auto_33992 ) ( AVAILABLE ?auto_33985 ) ( SURFACE-AT ?auto_33977 ?auto_33991 ) ( ON ?auto_33977 ?auto_33987 ) ( CLEAR ?auto_33977 ) ( not ( = ?auto_33979 ?auto_33987 ) ) ( not ( = ?auto_33980 ?auto_33987 ) ) ( not ( = ?auto_33978 ?auto_33987 ) ) ( not ( = ?auto_33989 ?auto_33987 ) ) ( not ( = ?auto_33986 ?auto_33987 ) ) ( not ( = ?auto_33977 ?auto_33987 ) ) ( not ( = ?auto_33983 ?auto_33987 ) ) ( not ( = ?auto_33984 ?auto_33987 ) ) ( TRUCK-AT ?auto_33990 ?auto_33982 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33978 ?auto_33979 ?auto_33980 )
      ( MAKE-3CRATE-VERIFY ?auto_33977 ?auto_33978 ?auto_33979 ?auto_33980 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33993 - SURFACE
      ?auto_33994 - SURFACE
      ?auto_33995 - SURFACE
      ?auto_33996 - SURFACE
      ?auto_33997 - SURFACE
    )
    :vars
    (
      ?auto_34008 - HOIST
      ?auto_33999 - PLACE
      ?auto_34004 - PLACE
      ?auto_33998 - HOIST
      ?auto_34005 - SURFACE
      ?auto_34007 - PLACE
      ?auto_34001 - HOIST
      ?auto_34002 - SURFACE
      ?auto_34000 - SURFACE
      ?auto_34003 - SURFACE
      ?auto_34006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34008 ?auto_33999 ) ( IS-CRATE ?auto_33997 ) ( not ( = ?auto_33996 ?auto_33997 ) ) ( not ( = ?auto_33995 ?auto_33996 ) ) ( not ( = ?auto_33995 ?auto_33997 ) ) ( not ( = ?auto_34004 ?auto_33999 ) ) ( HOIST-AT ?auto_33998 ?auto_34004 ) ( not ( = ?auto_34008 ?auto_33998 ) ) ( AVAILABLE ?auto_33998 ) ( SURFACE-AT ?auto_33997 ?auto_34004 ) ( ON ?auto_33997 ?auto_34005 ) ( CLEAR ?auto_33997 ) ( not ( = ?auto_33996 ?auto_34005 ) ) ( not ( = ?auto_33997 ?auto_34005 ) ) ( not ( = ?auto_33995 ?auto_34005 ) ) ( IS-CRATE ?auto_33996 ) ( not ( = ?auto_34007 ?auto_33999 ) ) ( not ( = ?auto_34004 ?auto_34007 ) ) ( HOIST-AT ?auto_34001 ?auto_34007 ) ( not ( = ?auto_34008 ?auto_34001 ) ) ( not ( = ?auto_33998 ?auto_34001 ) ) ( SURFACE-AT ?auto_33996 ?auto_34007 ) ( ON ?auto_33996 ?auto_34002 ) ( CLEAR ?auto_33996 ) ( not ( = ?auto_33996 ?auto_34002 ) ) ( not ( = ?auto_33997 ?auto_34002 ) ) ( not ( = ?auto_33995 ?auto_34002 ) ) ( not ( = ?auto_34005 ?auto_34002 ) ) ( IS-CRATE ?auto_33995 ) ( not ( = ?auto_33994 ?auto_33995 ) ) ( not ( = ?auto_33996 ?auto_33994 ) ) ( not ( = ?auto_33997 ?auto_33994 ) ) ( not ( = ?auto_34005 ?auto_33994 ) ) ( not ( = ?auto_34002 ?auto_33994 ) ) ( SURFACE-AT ?auto_33995 ?auto_34007 ) ( ON ?auto_33995 ?auto_34000 ) ( CLEAR ?auto_33995 ) ( not ( = ?auto_33996 ?auto_34000 ) ) ( not ( = ?auto_33997 ?auto_34000 ) ) ( not ( = ?auto_33995 ?auto_34000 ) ) ( not ( = ?auto_34005 ?auto_34000 ) ) ( not ( = ?auto_34002 ?auto_34000 ) ) ( not ( = ?auto_33994 ?auto_34000 ) ) ( SURFACE-AT ?auto_33993 ?auto_33999 ) ( CLEAR ?auto_33993 ) ( IS-CRATE ?auto_33994 ) ( not ( = ?auto_33993 ?auto_33994 ) ) ( not ( = ?auto_33996 ?auto_33993 ) ) ( not ( = ?auto_33997 ?auto_33993 ) ) ( not ( = ?auto_33995 ?auto_33993 ) ) ( not ( = ?auto_34005 ?auto_33993 ) ) ( not ( = ?auto_34002 ?auto_33993 ) ) ( not ( = ?auto_34000 ?auto_33993 ) ) ( AVAILABLE ?auto_34008 ) ( AVAILABLE ?auto_34001 ) ( SURFACE-AT ?auto_33994 ?auto_34007 ) ( ON ?auto_33994 ?auto_34003 ) ( CLEAR ?auto_33994 ) ( not ( = ?auto_33996 ?auto_34003 ) ) ( not ( = ?auto_33997 ?auto_34003 ) ) ( not ( = ?auto_33995 ?auto_34003 ) ) ( not ( = ?auto_34005 ?auto_34003 ) ) ( not ( = ?auto_34002 ?auto_34003 ) ) ( not ( = ?auto_33994 ?auto_34003 ) ) ( not ( = ?auto_34000 ?auto_34003 ) ) ( not ( = ?auto_33993 ?auto_34003 ) ) ( TRUCK-AT ?auto_34006 ?auto_33999 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33995 ?auto_33996 ?auto_33997 )
      ( MAKE-4CRATE-VERIFY ?auto_33993 ?auto_33994 ?auto_33995 ?auto_33996 ?auto_33997 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34029 - SURFACE
      ?auto_34030 - SURFACE
    )
    :vars
    (
      ?auto_34031 - HOIST
      ?auto_34032 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34031 ?auto_34032 ) ( SURFACE-AT ?auto_34029 ?auto_34032 ) ( CLEAR ?auto_34029 ) ( LIFTING ?auto_34031 ?auto_34030 ) ( IS-CRATE ?auto_34030 ) ( not ( = ?auto_34029 ?auto_34030 ) ) )
    :subtasks
    ( ( !DROP ?auto_34031 ?auto_34030 ?auto_34029 ?auto_34032 )
      ( MAKE-1CRATE-VERIFY ?auto_34029 ?auto_34030 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34033 - SURFACE
      ?auto_34034 - SURFACE
      ?auto_34035 - SURFACE
    )
    :vars
    (
      ?auto_34037 - HOIST
      ?auto_34036 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34037 ?auto_34036 ) ( SURFACE-AT ?auto_34034 ?auto_34036 ) ( CLEAR ?auto_34034 ) ( LIFTING ?auto_34037 ?auto_34035 ) ( IS-CRATE ?auto_34035 ) ( not ( = ?auto_34034 ?auto_34035 ) ) ( ON ?auto_34034 ?auto_34033 ) ( not ( = ?auto_34033 ?auto_34034 ) ) ( not ( = ?auto_34033 ?auto_34035 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34034 ?auto_34035 )
      ( MAKE-2CRATE-VERIFY ?auto_34033 ?auto_34034 ?auto_34035 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34038 - SURFACE
      ?auto_34039 - SURFACE
      ?auto_34040 - SURFACE
      ?auto_34041 - SURFACE
    )
    :vars
    (
      ?auto_34043 - HOIST
      ?auto_34042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34043 ?auto_34042 ) ( SURFACE-AT ?auto_34040 ?auto_34042 ) ( CLEAR ?auto_34040 ) ( LIFTING ?auto_34043 ?auto_34041 ) ( IS-CRATE ?auto_34041 ) ( not ( = ?auto_34040 ?auto_34041 ) ) ( ON ?auto_34039 ?auto_34038 ) ( ON ?auto_34040 ?auto_34039 ) ( not ( = ?auto_34038 ?auto_34039 ) ) ( not ( = ?auto_34038 ?auto_34040 ) ) ( not ( = ?auto_34038 ?auto_34041 ) ) ( not ( = ?auto_34039 ?auto_34040 ) ) ( not ( = ?auto_34039 ?auto_34041 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34040 ?auto_34041 )
      ( MAKE-3CRATE-VERIFY ?auto_34038 ?auto_34039 ?auto_34040 ?auto_34041 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34044 - SURFACE
      ?auto_34045 - SURFACE
      ?auto_34046 - SURFACE
      ?auto_34047 - SURFACE
      ?auto_34048 - SURFACE
    )
    :vars
    (
      ?auto_34050 - HOIST
      ?auto_34049 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34050 ?auto_34049 ) ( SURFACE-AT ?auto_34047 ?auto_34049 ) ( CLEAR ?auto_34047 ) ( LIFTING ?auto_34050 ?auto_34048 ) ( IS-CRATE ?auto_34048 ) ( not ( = ?auto_34047 ?auto_34048 ) ) ( ON ?auto_34045 ?auto_34044 ) ( ON ?auto_34046 ?auto_34045 ) ( ON ?auto_34047 ?auto_34046 ) ( not ( = ?auto_34044 ?auto_34045 ) ) ( not ( = ?auto_34044 ?auto_34046 ) ) ( not ( = ?auto_34044 ?auto_34047 ) ) ( not ( = ?auto_34044 ?auto_34048 ) ) ( not ( = ?auto_34045 ?auto_34046 ) ) ( not ( = ?auto_34045 ?auto_34047 ) ) ( not ( = ?auto_34045 ?auto_34048 ) ) ( not ( = ?auto_34046 ?auto_34047 ) ) ( not ( = ?auto_34046 ?auto_34048 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34047 ?auto_34048 )
      ( MAKE-4CRATE-VERIFY ?auto_34044 ?auto_34045 ?auto_34046 ?auto_34047 ?auto_34048 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34051 - SURFACE
      ?auto_34052 - SURFACE
      ?auto_34053 - SURFACE
      ?auto_34054 - SURFACE
      ?auto_34055 - SURFACE
      ?auto_34056 - SURFACE
    )
    :vars
    (
      ?auto_34058 - HOIST
      ?auto_34057 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34058 ?auto_34057 ) ( SURFACE-AT ?auto_34055 ?auto_34057 ) ( CLEAR ?auto_34055 ) ( LIFTING ?auto_34058 ?auto_34056 ) ( IS-CRATE ?auto_34056 ) ( not ( = ?auto_34055 ?auto_34056 ) ) ( ON ?auto_34052 ?auto_34051 ) ( ON ?auto_34053 ?auto_34052 ) ( ON ?auto_34054 ?auto_34053 ) ( ON ?auto_34055 ?auto_34054 ) ( not ( = ?auto_34051 ?auto_34052 ) ) ( not ( = ?auto_34051 ?auto_34053 ) ) ( not ( = ?auto_34051 ?auto_34054 ) ) ( not ( = ?auto_34051 ?auto_34055 ) ) ( not ( = ?auto_34051 ?auto_34056 ) ) ( not ( = ?auto_34052 ?auto_34053 ) ) ( not ( = ?auto_34052 ?auto_34054 ) ) ( not ( = ?auto_34052 ?auto_34055 ) ) ( not ( = ?auto_34052 ?auto_34056 ) ) ( not ( = ?auto_34053 ?auto_34054 ) ) ( not ( = ?auto_34053 ?auto_34055 ) ) ( not ( = ?auto_34053 ?auto_34056 ) ) ( not ( = ?auto_34054 ?auto_34055 ) ) ( not ( = ?auto_34054 ?auto_34056 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34055 ?auto_34056 )
      ( MAKE-5CRATE-VERIFY ?auto_34051 ?auto_34052 ?auto_34053 ?auto_34054 ?auto_34055 ?auto_34056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34059 - SURFACE
      ?auto_34060 - SURFACE
    )
    :vars
    (
      ?auto_34062 - HOIST
      ?auto_34061 - PLACE
      ?auto_34063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34062 ?auto_34061 ) ( SURFACE-AT ?auto_34059 ?auto_34061 ) ( CLEAR ?auto_34059 ) ( IS-CRATE ?auto_34060 ) ( not ( = ?auto_34059 ?auto_34060 ) ) ( TRUCK-AT ?auto_34063 ?auto_34061 ) ( AVAILABLE ?auto_34062 ) ( IN ?auto_34060 ?auto_34063 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34062 ?auto_34060 ?auto_34063 ?auto_34061 )
      ( MAKE-1CRATE ?auto_34059 ?auto_34060 )
      ( MAKE-1CRATE-VERIFY ?auto_34059 ?auto_34060 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34064 - SURFACE
      ?auto_34065 - SURFACE
      ?auto_34066 - SURFACE
    )
    :vars
    (
      ?auto_34068 - HOIST
      ?auto_34069 - PLACE
      ?auto_34067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34068 ?auto_34069 ) ( SURFACE-AT ?auto_34065 ?auto_34069 ) ( CLEAR ?auto_34065 ) ( IS-CRATE ?auto_34066 ) ( not ( = ?auto_34065 ?auto_34066 ) ) ( TRUCK-AT ?auto_34067 ?auto_34069 ) ( AVAILABLE ?auto_34068 ) ( IN ?auto_34066 ?auto_34067 ) ( ON ?auto_34065 ?auto_34064 ) ( not ( = ?auto_34064 ?auto_34065 ) ) ( not ( = ?auto_34064 ?auto_34066 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34065 ?auto_34066 )
      ( MAKE-2CRATE-VERIFY ?auto_34064 ?auto_34065 ?auto_34066 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34070 - SURFACE
      ?auto_34071 - SURFACE
      ?auto_34072 - SURFACE
      ?auto_34073 - SURFACE
    )
    :vars
    (
      ?auto_34074 - HOIST
      ?auto_34075 - PLACE
      ?auto_34076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34074 ?auto_34075 ) ( SURFACE-AT ?auto_34072 ?auto_34075 ) ( CLEAR ?auto_34072 ) ( IS-CRATE ?auto_34073 ) ( not ( = ?auto_34072 ?auto_34073 ) ) ( TRUCK-AT ?auto_34076 ?auto_34075 ) ( AVAILABLE ?auto_34074 ) ( IN ?auto_34073 ?auto_34076 ) ( ON ?auto_34072 ?auto_34071 ) ( not ( = ?auto_34071 ?auto_34072 ) ) ( not ( = ?auto_34071 ?auto_34073 ) ) ( ON ?auto_34071 ?auto_34070 ) ( not ( = ?auto_34070 ?auto_34071 ) ) ( not ( = ?auto_34070 ?auto_34072 ) ) ( not ( = ?auto_34070 ?auto_34073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34071 ?auto_34072 ?auto_34073 )
      ( MAKE-3CRATE-VERIFY ?auto_34070 ?auto_34071 ?auto_34072 ?auto_34073 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34077 - SURFACE
      ?auto_34078 - SURFACE
      ?auto_34079 - SURFACE
      ?auto_34080 - SURFACE
      ?auto_34081 - SURFACE
    )
    :vars
    (
      ?auto_34082 - HOIST
      ?auto_34083 - PLACE
      ?auto_34084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34082 ?auto_34083 ) ( SURFACE-AT ?auto_34080 ?auto_34083 ) ( CLEAR ?auto_34080 ) ( IS-CRATE ?auto_34081 ) ( not ( = ?auto_34080 ?auto_34081 ) ) ( TRUCK-AT ?auto_34084 ?auto_34083 ) ( AVAILABLE ?auto_34082 ) ( IN ?auto_34081 ?auto_34084 ) ( ON ?auto_34080 ?auto_34079 ) ( not ( = ?auto_34079 ?auto_34080 ) ) ( not ( = ?auto_34079 ?auto_34081 ) ) ( ON ?auto_34078 ?auto_34077 ) ( ON ?auto_34079 ?auto_34078 ) ( not ( = ?auto_34077 ?auto_34078 ) ) ( not ( = ?auto_34077 ?auto_34079 ) ) ( not ( = ?auto_34077 ?auto_34080 ) ) ( not ( = ?auto_34077 ?auto_34081 ) ) ( not ( = ?auto_34078 ?auto_34079 ) ) ( not ( = ?auto_34078 ?auto_34080 ) ) ( not ( = ?auto_34078 ?auto_34081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34079 ?auto_34080 ?auto_34081 )
      ( MAKE-4CRATE-VERIFY ?auto_34077 ?auto_34078 ?auto_34079 ?auto_34080 ?auto_34081 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34085 - SURFACE
      ?auto_34086 - SURFACE
      ?auto_34087 - SURFACE
      ?auto_34088 - SURFACE
      ?auto_34089 - SURFACE
      ?auto_34090 - SURFACE
    )
    :vars
    (
      ?auto_34091 - HOIST
      ?auto_34092 - PLACE
      ?auto_34093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34091 ?auto_34092 ) ( SURFACE-AT ?auto_34089 ?auto_34092 ) ( CLEAR ?auto_34089 ) ( IS-CRATE ?auto_34090 ) ( not ( = ?auto_34089 ?auto_34090 ) ) ( TRUCK-AT ?auto_34093 ?auto_34092 ) ( AVAILABLE ?auto_34091 ) ( IN ?auto_34090 ?auto_34093 ) ( ON ?auto_34089 ?auto_34088 ) ( not ( = ?auto_34088 ?auto_34089 ) ) ( not ( = ?auto_34088 ?auto_34090 ) ) ( ON ?auto_34086 ?auto_34085 ) ( ON ?auto_34087 ?auto_34086 ) ( ON ?auto_34088 ?auto_34087 ) ( not ( = ?auto_34085 ?auto_34086 ) ) ( not ( = ?auto_34085 ?auto_34087 ) ) ( not ( = ?auto_34085 ?auto_34088 ) ) ( not ( = ?auto_34085 ?auto_34089 ) ) ( not ( = ?auto_34085 ?auto_34090 ) ) ( not ( = ?auto_34086 ?auto_34087 ) ) ( not ( = ?auto_34086 ?auto_34088 ) ) ( not ( = ?auto_34086 ?auto_34089 ) ) ( not ( = ?auto_34086 ?auto_34090 ) ) ( not ( = ?auto_34087 ?auto_34088 ) ) ( not ( = ?auto_34087 ?auto_34089 ) ) ( not ( = ?auto_34087 ?auto_34090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34088 ?auto_34089 ?auto_34090 )
      ( MAKE-5CRATE-VERIFY ?auto_34085 ?auto_34086 ?auto_34087 ?auto_34088 ?auto_34089 ?auto_34090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34094 - SURFACE
      ?auto_34095 - SURFACE
    )
    :vars
    (
      ?auto_34096 - HOIST
      ?auto_34098 - PLACE
      ?auto_34099 - TRUCK
      ?auto_34097 - SURFACE
      ?auto_34100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34096 ?auto_34098 ) ( SURFACE-AT ?auto_34094 ?auto_34098 ) ( CLEAR ?auto_34094 ) ( IS-CRATE ?auto_34095 ) ( not ( = ?auto_34094 ?auto_34095 ) ) ( AVAILABLE ?auto_34096 ) ( IN ?auto_34095 ?auto_34099 ) ( ON ?auto_34094 ?auto_34097 ) ( not ( = ?auto_34097 ?auto_34094 ) ) ( not ( = ?auto_34097 ?auto_34095 ) ) ( TRUCK-AT ?auto_34099 ?auto_34100 ) ( not ( = ?auto_34100 ?auto_34098 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34099 ?auto_34100 ?auto_34098 )
      ( MAKE-2CRATE ?auto_34097 ?auto_34094 ?auto_34095 )
      ( MAKE-1CRATE-VERIFY ?auto_34094 ?auto_34095 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34101 - SURFACE
      ?auto_34102 - SURFACE
      ?auto_34103 - SURFACE
    )
    :vars
    (
      ?auto_34105 - HOIST
      ?auto_34106 - PLACE
      ?auto_34104 - TRUCK
      ?auto_34107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34105 ?auto_34106 ) ( SURFACE-AT ?auto_34102 ?auto_34106 ) ( CLEAR ?auto_34102 ) ( IS-CRATE ?auto_34103 ) ( not ( = ?auto_34102 ?auto_34103 ) ) ( AVAILABLE ?auto_34105 ) ( IN ?auto_34103 ?auto_34104 ) ( ON ?auto_34102 ?auto_34101 ) ( not ( = ?auto_34101 ?auto_34102 ) ) ( not ( = ?auto_34101 ?auto_34103 ) ) ( TRUCK-AT ?auto_34104 ?auto_34107 ) ( not ( = ?auto_34107 ?auto_34106 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34102 ?auto_34103 )
      ( MAKE-2CRATE-VERIFY ?auto_34101 ?auto_34102 ?auto_34103 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34108 - SURFACE
      ?auto_34109 - SURFACE
      ?auto_34110 - SURFACE
      ?auto_34111 - SURFACE
    )
    :vars
    (
      ?auto_34113 - HOIST
      ?auto_34114 - PLACE
      ?auto_34115 - TRUCK
      ?auto_34112 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34113 ?auto_34114 ) ( SURFACE-AT ?auto_34110 ?auto_34114 ) ( CLEAR ?auto_34110 ) ( IS-CRATE ?auto_34111 ) ( not ( = ?auto_34110 ?auto_34111 ) ) ( AVAILABLE ?auto_34113 ) ( IN ?auto_34111 ?auto_34115 ) ( ON ?auto_34110 ?auto_34109 ) ( not ( = ?auto_34109 ?auto_34110 ) ) ( not ( = ?auto_34109 ?auto_34111 ) ) ( TRUCK-AT ?auto_34115 ?auto_34112 ) ( not ( = ?auto_34112 ?auto_34114 ) ) ( ON ?auto_34109 ?auto_34108 ) ( not ( = ?auto_34108 ?auto_34109 ) ) ( not ( = ?auto_34108 ?auto_34110 ) ) ( not ( = ?auto_34108 ?auto_34111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34109 ?auto_34110 ?auto_34111 )
      ( MAKE-3CRATE-VERIFY ?auto_34108 ?auto_34109 ?auto_34110 ?auto_34111 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34116 - SURFACE
      ?auto_34117 - SURFACE
      ?auto_34118 - SURFACE
      ?auto_34119 - SURFACE
      ?auto_34120 - SURFACE
    )
    :vars
    (
      ?auto_34122 - HOIST
      ?auto_34123 - PLACE
      ?auto_34124 - TRUCK
      ?auto_34121 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34122 ?auto_34123 ) ( SURFACE-AT ?auto_34119 ?auto_34123 ) ( CLEAR ?auto_34119 ) ( IS-CRATE ?auto_34120 ) ( not ( = ?auto_34119 ?auto_34120 ) ) ( AVAILABLE ?auto_34122 ) ( IN ?auto_34120 ?auto_34124 ) ( ON ?auto_34119 ?auto_34118 ) ( not ( = ?auto_34118 ?auto_34119 ) ) ( not ( = ?auto_34118 ?auto_34120 ) ) ( TRUCK-AT ?auto_34124 ?auto_34121 ) ( not ( = ?auto_34121 ?auto_34123 ) ) ( ON ?auto_34117 ?auto_34116 ) ( ON ?auto_34118 ?auto_34117 ) ( not ( = ?auto_34116 ?auto_34117 ) ) ( not ( = ?auto_34116 ?auto_34118 ) ) ( not ( = ?auto_34116 ?auto_34119 ) ) ( not ( = ?auto_34116 ?auto_34120 ) ) ( not ( = ?auto_34117 ?auto_34118 ) ) ( not ( = ?auto_34117 ?auto_34119 ) ) ( not ( = ?auto_34117 ?auto_34120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34118 ?auto_34119 ?auto_34120 )
      ( MAKE-4CRATE-VERIFY ?auto_34116 ?auto_34117 ?auto_34118 ?auto_34119 ?auto_34120 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34125 - SURFACE
      ?auto_34126 - SURFACE
      ?auto_34127 - SURFACE
      ?auto_34128 - SURFACE
      ?auto_34129 - SURFACE
      ?auto_34130 - SURFACE
    )
    :vars
    (
      ?auto_34132 - HOIST
      ?auto_34133 - PLACE
      ?auto_34134 - TRUCK
      ?auto_34131 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34132 ?auto_34133 ) ( SURFACE-AT ?auto_34129 ?auto_34133 ) ( CLEAR ?auto_34129 ) ( IS-CRATE ?auto_34130 ) ( not ( = ?auto_34129 ?auto_34130 ) ) ( AVAILABLE ?auto_34132 ) ( IN ?auto_34130 ?auto_34134 ) ( ON ?auto_34129 ?auto_34128 ) ( not ( = ?auto_34128 ?auto_34129 ) ) ( not ( = ?auto_34128 ?auto_34130 ) ) ( TRUCK-AT ?auto_34134 ?auto_34131 ) ( not ( = ?auto_34131 ?auto_34133 ) ) ( ON ?auto_34126 ?auto_34125 ) ( ON ?auto_34127 ?auto_34126 ) ( ON ?auto_34128 ?auto_34127 ) ( not ( = ?auto_34125 ?auto_34126 ) ) ( not ( = ?auto_34125 ?auto_34127 ) ) ( not ( = ?auto_34125 ?auto_34128 ) ) ( not ( = ?auto_34125 ?auto_34129 ) ) ( not ( = ?auto_34125 ?auto_34130 ) ) ( not ( = ?auto_34126 ?auto_34127 ) ) ( not ( = ?auto_34126 ?auto_34128 ) ) ( not ( = ?auto_34126 ?auto_34129 ) ) ( not ( = ?auto_34126 ?auto_34130 ) ) ( not ( = ?auto_34127 ?auto_34128 ) ) ( not ( = ?auto_34127 ?auto_34129 ) ) ( not ( = ?auto_34127 ?auto_34130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34128 ?auto_34129 ?auto_34130 )
      ( MAKE-5CRATE-VERIFY ?auto_34125 ?auto_34126 ?auto_34127 ?auto_34128 ?auto_34129 ?auto_34130 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34135 - SURFACE
      ?auto_34136 - SURFACE
    )
    :vars
    (
      ?auto_34138 - HOIST
      ?auto_34139 - PLACE
      ?auto_34140 - SURFACE
      ?auto_34141 - TRUCK
      ?auto_34137 - PLACE
      ?auto_34142 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34138 ?auto_34139 ) ( SURFACE-AT ?auto_34135 ?auto_34139 ) ( CLEAR ?auto_34135 ) ( IS-CRATE ?auto_34136 ) ( not ( = ?auto_34135 ?auto_34136 ) ) ( AVAILABLE ?auto_34138 ) ( ON ?auto_34135 ?auto_34140 ) ( not ( = ?auto_34140 ?auto_34135 ) ) ( not ( = ?auto_34140 ?auto_34136 ) ) ( TRUCK-AT ?auto_34141 ?auto_34137 ) ( not ( = ?auto_34137 ?auto_34139 ) ) ( HOIST-AT ?auto_34142 ?auto_34137 ) ( LIFTING ?auto_34142 ?auto_34136 ) ( not ( = ?auto_34138 ?auto_34142 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34142 ?auto_34136 ?auto_34141 ?auto_34137 )
      ( MAKE-2CRATE ?auto_34140 ?auto_34135 ?auto_34136 )
      ( MAKE-1CRATE-VERIFY ?auto_34135 ?auto_34136 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34143 - SURFACE
      ?auto_34144 - SURFACE
      ?auto_34145 - SURFACE
    )
    :vars
    (
      ?auto_34150 - HOIST
      ?auto_34149 - PLACE
      ?auto_34146 - TRUCK
      ?auto_34147 - PLACE
      ?auto_34148 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34150 ?auto_34149 ) ( SURFACE-AT ?auto_34144 ?auto_34149 ) ( CLEAR ?auto_34144 ) ( IS-CRATE ?auto_34145 ) ( not ( = ?auto_34144 ?auto_34145 ) ) ( AVAILABLE ?auto_34150 ) ( ON ?auto_34144 ?auto_34143 ) ( not ( = ?auto_34143 ?auto_34144 ) ) ( not ( = ?auto_34143 ?auto_34145 ) ) ( TRUCK-AT ?auto_34146 ?auto_34147 ) ( not ( = ?auto_34147 ?auto_34149 ) ) ( HOIST-AT ?auto_34148 ?auto_34147 ) ( LIFTING ?auto_34148 ?auto_34145 ) ( not ( = ?auto_34150 ?auto_34148 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34144 ?auto_34145 )
      ( MAKE-2CRATE-VERIFY ?auto_34143 ?auto_34144 ?auto_34145 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34151 - SURFACE
      ?auto_34152 - SURFACE
      ?auto_34153 - SURFACE
      ?auto_34154 - SURFACE
    )
    :vars
    (
      ?auto_34157 - HOIST
      ?auto_34159 - PLACE
      ?auto_34156 - TRUCK
      ?auto_34158 - PLACE
      ?auto_34155 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34157 ?auto_34159 ) ( SURFACE-AT ?auto_34153 ?auto_34159 ) ( CLEAR ?auto_34153 ) ( IS-CRATE ?auto_34154 ) ( not ( = ?auto_34153 ?auto_34154 ) ) ( AVAILABLE ?auto_34157 ) ( ON ?auto_34153 ?auto_34152 ) ( not ( = ?auto_34152 ?auto_34153 ) ) ( not ( = ?auto_34152 ?auto_34154 ) ) ( TRUCK-AT ?auto_34156 ?auto_34158 ) ( not ( = ?auto_34158 ?auto_34159 ) ) ( HOIST-AT ?auto_34155 ?auto_34158 ) ( LIFTING ?auto_34155 ?auto_34154 ) ( not ( = ?auto_34157 ?auto_34155 ) ) ( ON ?auto_34152 ?auto_34151 ) ( not ( = ?auto_34151 ?auto_34152 ) ) ( not ( = ?auto_34151 ?auto_34153 ) ) ( not ( = ?auto_34151 ?auto_34154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34152 ?auto_34153 ?auto_34154 )
      ( MAKE-3CRATE-VERIFY ?auto_34151 ?auto_34152 ?auto_34153 ?auto_34154 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34160 - SURFACE
      ?auto_34161 - SURFACE
      ?auto_34162 - SURFACE
      ?auto_34163 - SURFACE
      ?auto_34164 - SURFACE
    )
    :vars
    (
      ?auto_34167 - HOIST
      ?auto_34169 - PLACE
      ?auto_34166 - TRUCK
      ?auto_34168 - PLACE
      ?auto_34165 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34167 ?auto_34169 ) ( SURFACE-AT ?auto_34163 ?auto_34169 ) ( CLEAR ?auto_34163 ) ( IS-CRATE ?auto_34164 ) ( not ( = ?auto_34163 ?auto_34164 ) ) ( AVAILABLE ?auto_34167 ) ( ON ?auto_34163 ?auto_34162 ) ( not ( = ?auto_34162 ?auto_34163 ) ) ( not ( = ?auto_34162 ?auto_34164 ) ) ( TRUCK-AT ?auto_34166 ?auto_34168 ) ( not ( = ?auto_34168 ?auto_34169 ) ) ( HOIST-AT ?auto_34165 ?auto_34168 ) ( LIFTING ?auto_34165 ?auto_34164 ) ( not ( = ?auto_34167 ?auto_34165 ) ) ( ON ?auto_34161 ?auto_34160 ) ( ON ?auto_34162 ?auto_34161 ) ( not ( = ?auto_34160 ?auto_34161 ) ) ( not ( = ?auto_34160 ?auto_34162 ) ) ( not ( = ?auto_34160 ?auto_34163 ) ) ( not ( = ?auto_34160 ?auto_34164 ) ) ( not ( = ?auto_34161 ?auto_34162 ) ) ( not ( = ?auto_34161 ?auto_34163 ) ) ( not ( = ?auto_34161 ?auto_34164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34162 ?auto_34163 ?auto_34164 )
      ( MAKE-4CRATE-VERIFY ?auto_34160 ?auto_34161 ?auto_34162 ?auto_34163 ?auto_34164 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34170 - SURFACE
      ?auto_34171 - SURFACE
      ?auto_34172 - SURFACE
      ?auto_34173 - SURFACE
      ?auto_34174 - SURFACE
      ?auto_34175 - SURFACE
    )
    :vars
    (
      ?auto_34178 - HOIST
      ?auto_34180 - PLACE
      ?auto_34177 - TRUCK
      ?auto_34179 - PLACE
      ?auto_34176 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34178 ?auto_34180 ) ( SURFACE-AT ?auto_34174 ?auto_34180 ) ( CLEAR ?auto_34174 ) ( IS-CRATE ?auto_34175 ) ( not ( = ?auto_34174 ?auto_34175 ) ) ( AVAILABLE ?auto_34178 ) ( ON ?auto_34174 ?auto_34173 ) ( not ( = ?auto_34173 ?auto_34174 ) ) ( not ( = ?auto_34173 ?auto_34175 ) ) ( TRUCK-AT ?auto_34177 ?auto_34179 ) ( not ( = ?auto_34179 ?auto_34180 ) ) ( HOIST-AT ?auto_34176 ?auto_34179 ) ( LIFTING ?auto_34176 ?auto_34175 ) ( not ( = ?auto_34178 ?auto_34176 ) ) ( ON ?auto_34171 ?auto_34170 ) ( ON ?auto_34172 ?auto_34171 ) ( ON ?auto_34173 ?auto_34172 ) ( not ( = ?auto_34170 ?auto_34171 ) ) ( not ( = ?auto_34170 ?auto_34172 ) ) ( not ( = ?auto_34170 ?auto_34173 ) ) ( not ( = ?auto_34170 ?auto_34174 ) ) ( not ( = ?auto_34170 ?auto_34175 ) ) ( not ( = ?auto_34171 ?auto_34172 ) ) ( not ( = ?auto_34171 ?auto_34173 ) ) ( not ( = ?auto_34171 ?auto_34174 ) ) ( not ( = ?auto_34171 ?auto_34175 ) ) ( not ( = ?auto_34172 ?auto_34173 ) ) ( not ( = ?auto_34172 ?auto_34174 ) ) ( not ( = ?auto_34172 ?auto_34175 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34173 ?auto_34174 ?auto_34175 )
      ( MAKE-5CRATE-VERIFY ?auto_34170 ?auto_34171 ?auto_34172 ?auto_34173 ?auto_34174 ?auto_34175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34181 - SURFACE
      ?auto_34182 - SURFACE
    )
    :vars
    (
      ?auto_34186 - HOIST
      ?auto_34188 - PLACE
      ?auto_34183 - SURFACE
      ?auto_34185 - TRUCK
      ?auto_34187 - PLACE
      ?auto_34184 - HOIST
      ?auto_34189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34186 ?auto_34188 ) ( SURFACE-AT ?auto_34181 ?auto_34188 ) ( CLEAR ?auto_34181 ) ( IS-CRATE ?auto_34182 ) ( not ( = ?auto_34181 ?auto_34182 ) ) ( AVAILABLE ?auto_34186 ) ( ON ?auto_34181 ?auto_34183 ) ( not ( = ?auto_34183 ?auto_34181 ) ) ( not ( = ?auto_34183 ?auto_34182 ) ) ( TRUCK-AT ?auto_34185 ?auto_34187 ) ( not ( = ?auto_34187 ?auto_34188 ) ) ( HOIST-AT ?auto_34184 ?auto_34187 ) ( not ( = ?auto_34186 ?auto_34184 ) ) ( AVAILABLE ?auto_34184 ) ( SURFACE-AT ?auto_34182 ?auto_34187 ) ( ON ?auto_34182 ?auto_34189 ) ( CLEAR ?auto_34182 ) ( not ( = ?auto_34181 ?auto_34189 ) ) ( not ( = ?auto_34182 ?auto_34189 ) ) ( not ( = ?auto_34183 ?auto_34189 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34184 ?auto_34182 ?auto_34189 ?auto_34187 )
      ( MAKE-2CRATE ?auto_34183 ?auto_34181 ?auto_34182 )
      ( MAKE-1CRATE-VERIFY ?auto_34181 ?auto_34182 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34190 - SURFACE
      ?auto_34191 - SURFACE
      ?auto_34192 - SURFACE
    )
    :vars
    (
      ?auto_34193 - HOIST
      ?auto_34195 - PLACE
      ?auto_34194 - TRUCK
      ?auto_34197 - PLACE
      ?auto_34196 - HOIST
      ?auto_34198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34193 ?auto_34195 ) ( SURFACE-AT ?auto_34191 ?auto_34195 ) ( CLEAR ?auto_34191 ) ( IS-CRATE ?auto_34192 ) ( not ( = ?auto_34191 ?auto_34192 ) ) ( AVAILABLE ?auto_34193 ) ( ON ?auto_34191 ?auto_34190 ) ( not ( = ?auto_34190 ?auto_34191 ) ) ( not ( = ?auto_34190 ?auto_34192 ) ) ( TRUCK-AT ?auto_34194 ?auto_34197 ) ( not ( = ?auto_34197 ?auto_34195 ) ) ( HOIST-AT ?auto_34196 ?auto_34197 ) ( not ( = ?auto_34193 ?auto_34196 ) ) ( AVAILABLE ?auto_34196 ) ( SURFACE-AT ?auto_34192 ?auto_34197 ) ( ON ?auto_34192 ?auto_34198 ) ( CLEAR ?auto_34192 ) ( not ( = ?auto_34191 ?auto_34198 ) ) ( not ( = ?auto_34192 ?auto_34198 ) ) ( not ( = ?auto_34190 ?auto_34198 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34191 ?auto_34192 )
      ( MAKE-2CRATE-VERIFY ?auto_34190 ?auto_34191 ?auto_34192 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34199 - SURFACE
      ?auto_34200 - SURFACE
      ?auto_34201 - SURFACE
      ?auto_34202 - SURFACE
    )
    :vars
    (
      ?auto_34206 - HOIST
      ?auto_34204 - PLACE
      ?auto_34203 - TRUCK
      ?auto_34208 - PLACE
      ?auto_34207 - HOIST
      ?auto_34205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34206 ?auto_34204 ) ( SURFACE-AT ?auto_34201 ?auto_34204 ) ( CLEAR ?auto_34201 ) ( IS-CRATE ?auto_34202 ) ( not ( = ?auto_34201 ?auto_34202 ) ) ( AVAILABLE ?auto_34206 ) ( ON ?auto_34201 ?auto_34200 ) ( not ( = ?auto_34200 ?auto_34201 ) ) ( not ( = ?auto_34200 ?auto_34202 ) ) ( TRUCK-AT ?auto_34203 ?auto_34208 ) ( not ( = ?auto_34208 ?auto_34204 ) ) ( HOIST-AT ?auto_34207 ?auto_34208 ) ( not ( = ?auto_34206 ?auto_34207 ) ) ( AVAILABLE ?auto_34207 ) ( SURFACE-AT ?auto_34202 ?auto_34208 ) ( ON ?auto_34202 ?auto_34205 ) ( CLEAR ?auto_34202 ) ( not ( = ?auto_34201 ?auto_34205 ) ) ( not ( = ?auto_34202 ?auto_34205 ) ) ( not ( = ?auto_34200 ?auto_34205 ) ) ( ON ?auto_34200 ?auto_34199 ) ( not ( = ?auto_34199 ?auto_34200 ) ) ( not ( = ?auto_34199 ?auto_34201 ) ) ( not ( = ?auto_34199 ?auto_34202 ) ) ( not ( = ?auto_34199 ?auto_34205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34200 ?auto_34201 ?auto_34202 )
      ( MAKE-3CRATE-VERIFY ?auto_34199 ?auto_34200 ?auto_34201 ?auto_34202 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34209 - SURFACE
      ?auto_34210 - SURFACE
      ?auto_34211 - SURFACE
      ?auto_34212 - SURFACE
      ?auto_34213 - SURFACE
    )
    :vars
    (
      ?auto_34217 - HOIST
      ?auto_34215 - PLACE
      ?auto_34214 - TRUCK
      ?auto_34219 - PLACE
      ?auto_34218 - HOIST
      ?auto_34216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34217 ?auto_34215 ) ( SURFACE-AT ?auto_34212 ?auto_34215 ) ( CLEAR ?auto_34212 ) ( IS-CRATE ?auto_34213 ) ( not ( = ?auto_34212 ?auto_34213 ) ) ( AVAILABLE ?auto_34217 ) ( ON ?auto_34212 ?auto_34211 ) ( not ( = ?auto_34211 ?auto_34212 ) ) ( not ( = ?auto_34211 ?auto_34213 ) ) ( TRUCK-AT ?auto_34214 ?auto_34219 ) ( not ( = ?auto_34219 ?auto_34215 ) ) ( HOIST-AT ?auto_34218 ?auto_34219 ) ( not ( = ?auto_34217 ?auto_34218 ) ) ( AVAILABLE ?auto_34218 ) ( SURFACE-AT ?auto_34213 ?auto_34219 ) ( ON ?auto_34213 ?auto_34216 ) ( CLEAR ?auto_34213 ) ( not ( = ?auto_34212 ?auto_34216 ) ) ( not ( = ?auto_34213 ?auto_34216 ) ) ( not ( = ?auto_34211 ?auto_34216 ) ) ( ON ?auto_34210 ?auto_34209 ) ( ON ?auto_34211 ?auto_34210 ) ( not ( = ?auto_34209 ?auto_34210 ) ) ( not ( = ?auto_34209 ?auto_34211 ) ) ( not ( = ?auto_34209 ?auto_34212 ) ) ( not ( = ?auto_34209 ?auto_34213 ) ) ( not ( = ?auto_34209 ?auto_34216 ) ) ( not ( = ?auto_34210 ?auto_34211 ) ) ( not ( = ?auto_34210 ?auto_34212 ) ) ( not ( = ?auto_34210 ?auto_34213 ) ) ( not ( = ?auto_34210 ?auto_34216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34211 ?auto_34212 ?auto_34213 )
      ( MAKE-4CRATE-VERIFY ?auto_34209 ?auto_34210 ?auto_34211 ?auto_34212 ?auto_34213 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34220 - SURFACE
      ?auto_34221 - SURFACE
      ?auto_34222 - SURFACE
      ?auto_34223 - SURFACE
      ?auto_34224 - SURFACE
      ?auto_34225 - SURFACE
    )
    :vars
    (
      ?auto_34229 - HOIST
      ?auto_34227 - PLACE
      ?auto_34226 - TRUCK
      ?auto_34231 - PLACE
      ?auto_34230 - HOIST
      ?auto_34228 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34229 ?auto_34227 ) ( SURFACE-AT ?auto_34224 ?auto_34227 ) ( CLEAR ?auto_34224 ) ( IS-CRATE ?auto_34225 ) ( not ( = ?auto_34224 ?auto_34225 ) ) ( AVAILABLE ?auto_34229 ) ( ON ?auto_34224 ?auto_34223 ) ( not ( = ?auto_34223 ?auto_34224 ) ) ( not ( = ?auto_34223 ?auto_34225 ) ) ( TRUCK-AT ?auto_34226 ?auto_34231 ) ( not ( = ?auto_34231 ?auto_34227 ) ) ( HOIST-AT ?auto_34230 ?auto_34231 ) ( not ( = ?auto_34229 ?auto_34230 ) ) ( AVAILABLE ?auto_34230 ) ( SURFACE-AT ?auto_34225 ?auto_34231 ) ( ON ?auto_34225 ?auto_34228 ) ( CLEAR ?auto_34225 ) ( not ( = ?auto_34224 ?auto_34228 ) ) ( not ( = ?auto_34225 ?auto_34228 ) ) ( not ( = ?auto_34223 ?auto_34228 ) ) ( ON ?auto_34221 ?auto_34220 ) ( ON ?auto_34222 ?auto_34221 ) ( ON ?auto_34223 ?auto_34222 ) ( not ( = ?auto_34220 ?auto_34221 ) ) ( not ( = ?auto_34220 ?auto_34222 ) ) ( not ( = ?auto_34220 ?auto_34223 ) ) ( not ( = ?auto_34220 ?auto_34224 ) ) ( not ( = ?auto_34220 ?auto_34225 ) ) ( not ( = ?auto_34220 ?auto_34228 ) ) ( not ( = ?auto_34221 ?auto_34222 ) ) ( not ( = ?auto_34221 ?auto_34223 ) ) ( not ( = ?auto_34221 ?auto_34224 ) ) ( not ( = ?auto_34221 ?auto_34225 ) ) ( not ( = ?auto_34221 ?auto_34228 ) ) ( not ( = ?auto_34222 ?auto_34223 ) ) ( not ( = ?auto_34222 ?auto_34224 ) ) ( not ( = ?auto_34222 ?auto_34225 ) ) ( not ( = ?auto_34222 ?auto_34228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34223 ?auto_34224 ?auto_34225 )
      ( MAKE-5CRATE-VERIFY ?auto_34220 ?auto_34221 ?auto_34222 ?auto_34223 ?auto_34224 ?auto_34225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34232 - SURFACE
      ?auto_34233 - SURFACE
    )
    :vars
    (
      ?auto_34237 - HOIST
      ?auto_34235 - PLACE
      ?auto_34240 - SURFACE
      ?auto_34239 - PLACE
      ?auto_34238 - HOIST
      ?auto_34236 - SURFACE
      ?auto_34234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34237 ?auto_34235 ) ( SURFACE-AT ?auto_34232 ?auto_34235 ) ( CLEAR ?auto_34232 ) ( IS-CRATE ?auto_34233 ) ( not ( = ?auto_34232 ?auto_34233 ) ) ( AVAILABLE ?auto_34237 ) ( ON ?auto_34232 ?auto_34240 ) ( not ( = ?auto_34240 ?auto_34232 ) ) ( not ( = ?auto_34240 ?auto_34233 ) ) ( not ( = ?auto_34239 ?auto_34235 ) ) ( HOIST-AT ?auto_34238 ?auto_34239 ) ( not ( = ?auto_34237 ?auto_34238 ) ) ( AVAILABLE ?auto_34238 ) ( SURFACE-AT ?auto_34233 ?auto_34239 ) ( ON ?auto_34233 ?auto_34236 ) ( CLEAR ?auto_34233 ) ( not ( = ?auto_34232 ?auto_34236 ) ) ( not ( = ?auto_34233 ?auto_34236 ) ) ( not ( = ?auto_34240 ?auto_34236 ) ) ( TRUCK-AT ?auto_34234 ?auto_34235 ) )
    :subtasks
    ( ( !DRIVE ?auto_34234 ?auto_34235 ?auto_34239 )
      ( MAKE-2CRATE ?auto_34240 ?auto_34232 ?auto_34233 )
      ( MAKE-1CRATE-VERIFY ?auto_34232 ?auto_34233 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34241 - SURFACE
      ?auto_34242 - SURFACE
      ?auto_34243 - SURFACE
    )
    :vars
    (
      ?auto_34245 - HOIST
      ?auto_34244 - PLACE
      ?auto_34246 - PLACE
      ?auto_34248 - HOIST
      ?auto_34249 - SURFACE
      ?auto_34247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34245 ?auto_34244 ) ( SURFACE-AT ?auto_34242 ?auto_34244 ) ( CLEAR ?auto_34242 ) ( IS-CRATE ?auto_34243 ) ( not ( = ?auto_34242 ?auto_34243 ) ) ( AVAILABLE ?auto_34245 ) ( ON ?auto_34242 ?auto_34241 ) ( not ( = ?auto_34241 ?auto_34242 ) ) ( not ( = ?auto_34241 ?auto_34243 ) ) ( not ( = ?auto_34246 ?auto_34244 ) ) ( HOIST-AT ?auto_34248 ?auto_34246 ) ( not ( = ?auto_34245 ?auto_34248 ) ) ( AVAILABLE ?auto_34248 ) ( SURFACE-AT ?auto_34243 ?auto_34246 ) ( ON ?auto_34243 ?auto_34249 ) ( CLEAR ?auto_34243 ) ( not ( = ?auto_34242 ?auto_34249 ) ) ( not ( = ?auto_34243 ?auto_34249 ) ) ( not ( = ?auto_34241 ?auto_34249 ) ) ( TRUCK-AT ?auto_34247 ?auto_34244 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34242 ?auto_34243 )
      ( MAKE-2CRATE-VERIFY ?auto_34241 ?auto_34242 ?auto_34243 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34250 - SURFACE
      ?auto_34251 - SURFACE
      ?auto_34252 - SURFACE
      ?auto_34253 - SURFACE
    )
    :vars
    (
      ?auto_34259 - HOIST
      ?auto_34258 - PLACE
      ?auto_34257 - PLACE
      ?auto_34256 - HOIST
      ?auto_34254 - SURFACE
      ?auto_34255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34259 ?auto_34258 ) ( SURFACE-AT ?auto_34252 ?auto_34258 ) ( CLEAR ?auto_34252 ) ( IS-CRATE ?auto_34253 ) ( not ( = ?auto_34252 ?auto_34253 ) ) ( AVAILABLE ?auto_34259 ) ( ON ?auto_34252 ?auto_34251 ) ( not ( = ?auto_34251 ?auto_34252 ) ) ( not ( = ?auto_34251 ?auto_34253 ) ) ( not ( = ?auto_34257 ?auto_34258 ) ) ( HOIST-AT ?auto_34256 ?auto_34257 ) ( not ( = ?auto_34259 ?auto_34256 ) ) ( AVAILABLE ?auto_34256 ) ( SURFACE-AT ?auto_34253 ?auto_34257 ) ( ON ?auto_34253 ?auto_34254 ) ( CLEAR ?auto_34253 ) ( not ( = ?auto_34252 ?auto_34254 ) ) ( not ( = ?auto_34253 ?auto_34254 ) ) ( not ( = ?auto_34251 ?auto_34254 ) ) ( TRUCK-AT ?auto_34255 ?auto_34258 ) ( ON ?auto_34251 ?auto_34250 ) ( not ( = ?auto_34250 ?auto_34251 ) ) ( not ( = ?auto_34250 ?auto_34252 ) ) ( not ( = ?auto_34250 ?auto_34253 ) ) ( not ( = ?auto_34250 ?auto_34254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34251 ?auto_34252 ?auto_34253 )
      ( MAKE-3CRATE-VERIFY ?auto_34250 ?auto_34251 ?auto_34252 ?auto_34253 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34260 - SURFACE
      ?auto_34261 - SURFACE
      ?auto_34262 - SURFACE
      ?auto_34263 - SURFACE
      ?auto_34264 - SURFACE
    )
    :vars
    (
      ?auto_34270 - HOIST
      ?auto_34269 - PLACE
      ?auto_34268 - PLACE
      ?auto_34267 - HOIST
      ?auto_34265 - SURFACE
      ?auto_34266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34270 ?auto_34269 ) ( SURFACE-AT ?auto_34263 ?auto_34269 ) ( CLEAR ?auto_34263 ) ( IS-CRATE ?auto_34264 ) ( not ( = ?auto_34263 ?auto_34264 ) ) ( AVAILABLE ?auto_34270 ) ( ON ?auto_34263 ?auto_34262 ) ( not ( = ?auto_34262 ?auto_34263 ) ) ( not ( = ?auto_34262 ?auto_34264 ) ) ( not ( = ?auto_34268 ?auto_34269 ) ) ( HOIST-AT ?auto_34267 ?auto_34268 ) ( not ( = ?auto_34270 ?auto_34267 ) ) ( AVAILABLE ?auto_34267 ) ( SURFACE-AT ?auto_34264 ?auto_34268 ) ( ON ?auto_34264 ?auto_34265 ) ( CLEAR ?auto_34264 ) ( not ( = ?auto_34263 ?auto_34265 ) ) ( not ( = ?auto_34264 ?auto_34265 ) ) ( not ( = ?auto_34262 ?auto_34265 ) ) ( TRUCK-AT ?auto_34266 ?auto_34269 ) ( ON ?auto_34261 ?auto_34260 ) ( ON ?auto_34262 ?auto_34261 ) ( not ( = ?auto_34260 ?auto_34261 ) ) ( not ( = ?auto_34260 ?auto_34262 ) ) ( not ( = ?auto_34260 ?auto_34263 ) ) ( not ( = ?auto_34260 ?auto_34264 ) ) ( not ( = ?auto_34260 ?auto_34265 ) ) ( not ( = ?auto_34261 ?auto_34262 ) ) ( not ( = ?auto_34261 ?auto_34263 ) ) ( not ( = ?auto_34261 ?auto_34264 ) ) ( not ( = ?auto_34261 ?auto_34265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34262 ?auto_34263 ?auto_34264 )
      ( MAKE-4CRATE-VERIFY ?auto_34260 ?auto_34261 ?auto_34262 ?auto_34263 ?auto_34264 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34271 - SURFACE
      ?auto_34272 - SURFACE
      ?auto_34273 - SURFACE
      ?auto_34274 - SURFACE
      ?auto_34275 - SURFACE
      ?auto_34276 - SURFACE
    )
    :vars
    (
      ?auto_34282 - HOIST
      ?auto_34281 - PLACE
      ?auto_34280 - PLACE
      ?auto_34279 - HOIST
      ?auto_34277 - SURFACE
      ?auto_34278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34282 ?auto_34281 ) ( SURFACE-AT ?auto_34275 ?auto_34281 ) ( CLEAR ?auto_34275 ) ( IS-CRATE ?auto_34276 ) ( not ( = ?auto_34275 ?auto_34276 ) ) ( AVAILABLE ?auto_34282 ) ( ON ?auto_34275 ?auto_34274 ) ( not ( = ?auto_34274 ?auto_34275 ) ) ( not ( = ?auto_34274 ?auto_34276 ) ) ( not ( = ?auto_34280 ?auto_34281 ) ) ( HOIST-AT ?auto_34279 ?auto_34280 ) ( not ( = ?auto_34282 ?auto_34279 ) ) ( AVAILABLE ?auto_34279 ) ( SURFACE-AT ?auto_34276 ?auto_34280 ) ( ON ?auto_34276 ?auto_34277 ) ( CLEAR ?auto_34276 ) ( not ( = ?auto_34275 ?auto_34277 ) ) ( not ( = ?auto_34276 ?auto_34277 ) ) ( not ( = ?auto_34274 ?auto_34277 ) ) ( TRUCK-AT ?auto_34278 ?auto_34281 ) ( ON ?auto_34272 ?auto_34271 ) ( ON ?auto_34273 ?auto_34272 ) ( ON ?auto_34274 ?auto_34273 ) ( not ( = ?auto_34271 ?auto_34272 ) ) ( not ( = ?auto_34271 ?auto_34273 ) ) ( not ( = ?auto_34271 ?auto_34274 ) ) ( not ( = ?auto_34271 ?auto_34275 ) ) ( not ( = ?auto_34271 ?auto_34276 ) ) ( not ( = ?auto_34271 ?auto_34277 ) ) ( not ( = ?auto_34272 ?auto_34273 ) ) ( not ( = ?auto_34272 ?auto_34274 ) ) ( not ( = ?auto_34272 ?auto_34275 ) ) ( not ( = ?auto_34272 ?auto_34276 ) ) ( not ( = ?auto_34272 ?auto_34277 ) ) ( not ( = ?auto_34273 ?auto_34274 ) ) ( not ( = ?auto_34273 ?auto_34275 ) ) ( not ( = ?auto_34273 ?auto_34276 ) ) ( not ( = ?auto_34273 ?auto_34277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34274 ?auto_34275 ?auto_34276 )
      ( MAKE-5CRATE-VERIFY ?auto_34271 ?auto_34272 ?auto_34273 ?auto_34274 ?auto_34275 ?auto_34276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34283 - SURFACE
      ?auto_34284 - SURFACE
    )
    :vars
    (
      ?auto_34291 - HOIST
      ?auto_34290 - PLACE
      ?auto_34285 - SURFACE
      ?auto_34289 - PLACE
      ?auto_34288 - HOIST
      ?auto_34286 - SURFACE
      ?auto_34287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34291 ?auto_34290 ) ( IS-CRATE ?auto_34284 ) ( not ( = ?auto_34283 ?auto_34284 ) ) ( not ( = ?auto_34285 ?auto_34283 ) ) ( not ( = ?auto_34285 ?auto_34284 ) ) ( not ( = ?auto_34289 ?auto_34290 ) ) ( HOIST-AT ?auto_34288 ?auto_34289 ) ( not ( = ?auto_34291 ?auto_34288 ) ) ( AVAILABLE ?auto_34288 ) ( SURFACE-AT ?auto_34284 ?auto_34289 ) ( ON ?auto_34284 ?auto_34286 ) ( CLEAR ?auto_34284 ) ( not ( = ?auto_34283 ?auto_34286 ) ) ( not ( = ?auto_34284 ?auto_34286 ) ) ( not ( = ?auto_34285 ?auto_34286 ) ) ( TRUCK-AT ?auto_34287 ?auto_34290 ) ( SURFACE-AT ?auto_34285 ?auto_34290 ) ( CLEAR ?auto_34285 ) ( LIFTING ?auto_34291 ?auto_34283 ) ( IS-CRATE ?auto_34283 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34285 ?auto_34283 )
      ( MAKE-2CRATE ?auto_34285 ?auto_34283 ?auto_34284 )
      ( MAKE-1CRATE-VERIFY ?auto_34283 ?auto_34284 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34292 - SURFACE
      ?auto_34293 - SURFACE
      ?auto_34294 - SURFACE
    )
    :vars
    (
      ?auto_34300 - HOIST
      ?auto_34295 - PLACE
      ?auto_34298 - PLACE
      ?auto_34297 - HOIST
      ?auto_34299 - SURFACE
      ?auto_34296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34300 ?auto_34295 ) ( IS-CRATE ?auto_34294 ) ( not ( = ?auto_34293 ?auto_34294 ) ) ( not ( = ?auto_34292 ?auto_34293 ) ) ( not ( = ?auto_34292 ?auto_34294 ) ) ( not ( = ?auto_34298 ?auto_34295 ) ) ( HOIST-AT ?auto_34297 ?auto_34298 ) ( not ( = ?auto_34300 ?auto_34297 ) ) ( AVAILABLE ?auto_34297 ) ( SURFACE-AT ?auto_34294 ?auto_34298 ) ( ON ?auto_34294 ?auto_34299 ) ( CLEAR ?auto_34294 ) ( not ( = ?auto_34293 ?auto_34299 ) ) ( not ( = ?auto_34294 ?auto_34299 ) ) ( not ( = ?auto_34292 ?auto_34299 ) ) ( TRUCK-AT ?auto_34296 ?auto_34295 ) ( SURFACE-AT ?auto_34292 ?auto_34295 ) ( CLEAR ?auto_34292 ) ( LIFTING ?auto_34300 ?auto_34293 ) ( IS-CRATE ?auto_34293 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34293 ?auto_34294 )
      ( MAKE-2CRATE-VERIFY ?auto_34292 ?auto_34293 ?auto_34294 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34301 - SURFACE
      ?auto_34302 - SURFACE
      ?auto_34303 - SURFACE
      ?auto_34304 - SURFACE
    )
    :vars
    (
      ?auto_34307 - HOIST
      ?auto_34306 - PLACE
      ?auto_34309 - PLACE
      ?auto_34310 - HOIST
      ?auto_34308 - SURFACE
      ?auto_34305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34307 ?auto_34306 ) ( IS-CRATE ?auto_34304 ) ( not ( = ?auto_34303 ?auto_34304 ) ) ( not ( = ?auto_34302 ?auto_34303 ) ) ( not ( = ?auto_34302 ?auto_34304 ) ) ( not ( = ?auto_34309 ?auto_34306 ) ) ( HOIST-AT ?auto_34310 ?auto_34309 ) ( not ( = ?auto_34307 ?auto_34310 ) ) ( AVAILABLE ?auto_34310 ) ( SURFACE-AT ?auto_34304 ?auto_34309 ) ( ON ?auto_34304 ?auto_34308 ) ( CLEAR ?auto_34304 ) ( not ( = ?auto_34303 ?auto_34308 ) ) ( not ( = ?auto_34304 ?auto_34308 ) ) ( not ( = ?auto_34302 ?auto_34308 ) ) ( TRUCK-AT ?auto_34305 ?auto_34306 ) ( SURFACE-AT ?auto_34302 ?auto_34306 ) ( CLEAR ?auto_34302 ) ( LIFTING ?auto_34307 ?auto_34303 ) ( IS-CRATE ?auto_34303 ) ( ON ?auto_34302 ?auto_34301 ) ( not ( = ?auto_34301 ?auto_34302 ) ) ( not ( = ?auto_34301 ?auto_34303 ) ) ( not ( = ?auto_34301 ?auto_34304 ) ) ( not ( = ?auto_34301 ?auto_34308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34302 ?auto_34303 ?auto_34304 )
      ( MAKE-3CRATE-VERIFY ?auto_34301 ?auto_34302 ?auto_34303 ?auto_34304 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34311 - SURFACE
      ?auto_34312 - SURFACE
      ?auto_34313 - SURFACE
      ?auto_34314 - SURFACE
      ?auto_34315 - SURFACE
    )
    :vars
    (
      ?auto_34318 - HOIST
      ?auto_34317 - PLACE
      ?auto_34320 - PLACE
      ?auto_34321 - HOIST
      ?auto_34319 - SURFACE
      ?auto_34316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34318 ?auto_34317 ) ( IS-CRATE ?auto_34315 ) ( not ( = ?auto_34314 ?auto_34315 ) ) ( not ( = ?auto_34313 ?auto_34314 ) ) ( not ( = ?auto_34313 ?auto_34315 ) ) ( not ( = ?auto_34320 ?auto_34317 ) ) ( HOIST-AT ?auto_34321 ?auto_34320 ) ( not ( = ?auto_34318 ?auto_34321 ) ) ( AVAILABLE ?auto_34321 ) ( SURFACE-AT ?auto_34315 ?auto_34320 ) ( ON ?auto_34315 ?auto_34319 ) ( CLEAR ?auto_34315 ) ( not ( = ?auto_34314 ?auto_34319 ) ) ( not ( = ?auto_34315 ?auto_34319 ) ) ( not ( = ?auto_34313 ?auto_34319 ) ) ( TRUCK-AT ?auto_34316 ?auto_34317 ) ( SURFACE-AT ?auto_34313 ?auto_34317 ) ( CLEAR ?auto_34313 ) ( LIFTING ?auto_34318 ?auto_34314 ) ( IS-CRATE ?auto_34314 ) ( ON ?auto_34312 ?auto_34311 ) ( ON ?auto_34313 ?auto_34312 ) ( not ( = ?auto_34311 ?auto_34312 ) ) ( not ( = ?auto_34311 ?auto_34313 ) ) ( not ( = ?auto_34311 ?auto_34314 ) ) ( not ( = ?auto_34311 ?auto_34315 ) ) ( not ( = ?auto_34311 ?auto_34319 ) ) ( not ( = ?auto_34312 ?auto_34313 ) ) ( not ( = ?auto_34312 ?auto_34314 ) ) ( not ( = ?auto_34312 ?auto_34315 ) ) ( not ( = ?auto_34312 ?auto_34319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34313 ?auto_34314 ?auto_34315 )
      ( MAKE-4CRATE-VERIFY ?auto_34311 ?auto_34312 ?auto_34313 ?auto_34314 ?auto_34315 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34322 - SURFACE
      ?auto_34323 - SURFACE
      ?auto_34324 - SURFACE
      ?auto_34325 - SURFACE
      ?auto_34326 - SURFACE
      ?auto_34327 - SURFACE
    )
    :vars
    (
      ?auto_34330 - HOIST
      ?auto_34329 - PLACE
      ?auto_34332 - PLACE
      ?auto_34333 - HOIST
      ?auto_34331 - SURFACE
      ?auto_34328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34330 ?auto_34329 ) ( IS-CRATE ?auto_34327 ) ( not ( = ?auto_34326 ?auto_34327 ) ) ( not ( = ?auto_34325 ?auto_34326 ) ) ( not ( = ?auto_34325 ?auto_34327 ) ) ( not ( = ?auto_34332 ?auto_34329 ) ) ( HOIST-AT ?auto_34333 ?auto_34332 ) ( not ( = ?auto_34330 ?auto_34333 ) ) ( AVAILABLE ?auto_34333 ) ( SURFACE-AT ?auto_34327 ?auto_34332 ) ( ON ?auto_34327 ?auto_34331 ) ( CLEAR ?auto_34327 ) ( not ( = ?auto_34326 ?auto_34331 ) ) ( not ( = ?auto_34327 ?auto_34331 ) ) ( not ( = ?auto_34325 ?auto_34331 ) ) ( TRUCK-AT ?auto_34328 ?auto_34329 ) ( SURFACE-AT ?auto_34325 ?auto_34329 ) ( CLEAR ?auto_34325 ) ( LIFTING ?auto_34330 ?auto_34326 ) ( IS-CRATE ?auto_34326 ) ( ON ?auto_34323 ?auto_34322 ) ( ON ?auto_34324 ?auto_34323 ) ( ON ?auto_34325 ?auto_34324 ) ( not ( = ?auto_34322 ?auto_34323 ) ) ( not ( = ?auto_34322 ?auto_34324 ) ) ( not ( = ?auto_34322 ?auto_34325 ) ) ( not ( = ?auto_34322 ?auto_34326 ) ) ( not ( = ?auto_34322 ?auto_34327 ) ) ( not ( = ?auto_34322 ?auto_34331 ) ) ( not ( = ?auto_34323 ?auto_34324 ) ) ( not ( = ?auto_34323 ?auto_34325 ) ) ( not ( = ?auto_34323 ?auto_34326 ) ) ( not ( = ?auto_34323 ?auto_34327 ) ) ( not ( = ?auto_34323 ?auto_34331 ) ) ( not ( = ?auto_34324 ?auto_34325 ) ) ( not ( = ?auto_34324 ?auto_34326 ) ) ( not ( = ?auto_34324 ?auto_34327 ) ) ( not ( = ?auto_34324 ?auto_34331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34325 ?auto_34326 ?auto_34327 )
      ( MAKE-5CRATE-VERIFY ?auto_34322 ?auto_34323 ?auto_34324 ?auto_34325 ?auto_34326 ?auto_34327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34334 - SURFACE
      ?auto_34335 - SURFACE
    )
    :vars
    (
      ?auto_34338 - HOIST
      ?auto_34337 - PLACE
      ?auto_34340 - SURFACE
      ?auto_34341 - PLACE
      ?auto_34342 - HOIST
      ?auto_34339 - SURFACE
      ?auto_34336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34338 ?auto_34337 ) ( IS-CRATE ?auto_34335 ) ( not ( = ?auto_34334 ?auto_34335 ) ) ( not ( = ?auto_34340 ?auto_34334 ) ) ( not ( = ?auto_34340 ?auto_34335 ) ) ( not ( = ?auto_34341 ?auto_34337 ) ) ( HOIST-AT ?auto_34342 ?auto_34341 ) ( not ( = ?auto_34338 ?auto_34342 ) ) ( AVAILABLE ?auto_34342 ) ( SURFACE-AT ?auto_34335 ?auto_34341 ) ( ON ?auto_34335 ?auto_34339 ) ( CLEAR ?auto_34335 ) ( not ( = ?auto_34334 ?auto_34339 ) ) ( not ( = ?auto_34335 ?auto_34339 ) ) ( not ( = ?auto_34340 ?auto_34339 ) ) ( TRUCK-AT ?auto_34336 ?auto_34337 ) ( SURFACE-AT ?auto_34340 ?auto_34337 ) ( CLEAR ?auto_34340 ) ( IS-CRATE ?auto_34334 ) ( AVAILABLE ?auto_34338 ) ( IN ?auto_34334 ?auto_34336 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34338 ?auto_34334 ?auto_34336 ?auto_34337 )
      ( MAKE-2CRATE ?auto_34340 ?auto_34334 ?auto_34335 )
      ( MAKE-1CRATE-VERIFY ?auto_34334 ?auto_34335 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34343 - SURFACE
      ?auto_34344 - SURFACE
      ?auto_34345 - SURFACE
    )
    :vars
    (
      ?auto_34351 - HOIST
      ?auto_34348 - PLACE
      ?auto_34346 - PLACE
      ?auto_34349 - HOIST
      ?auto_34350 - SURFACE
      ?auto_34347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34351 ?auto_34348 ) ( IS-CRATE ?auto_34345 ) ( not ( = ?auto_34344 ?auto_34345 ) ) ( not ( = ?auto_34343 ?auto_34344 ) ) ( not ( = ?auto_34343 ?auto_34345 ) ) ( not ( = ?auto_34346 ?auto_34348 ) ) ( HOIST-AT ?auto_34349 ?auto_34346 ) ( not ( = ?auto_34351 ?auto_34349 ) ) ( AVAILABLE ?auto_34349 ) ( SURFACE-AT ?auto_34345 ?auto_34346 ) ( ON ?auto_34345 ?auto_34350 ) ( CLEAR ?auto_34345 ) ( not ( = ?auto_34344 ?auto_34350 ) ) ( not ( = ?auto_34345 ?auto_34350 ) ) ( not ( = ?auto_34343 ?auto_34350 ) ) ( TRUCK-AT ?auto_34347 ?auto_34348 ) ( SURFACE-AT ?auto_34343 ?auto_34348 ) ( CLEAR ?auto_34343 ) ( IS-CRATE ?auto_34344 ) ( AVAILABLE ?auto_34351 ) ( IN ?auto_34344 ?auto_34347 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34344 ?auto_34345 )
      ( MAKE-2CRATE-VERIFY ?auto_34343 ?auto_34344 ?auto_34345 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34352 - SURFACE
      ?auto_34353 - SURFACE
      ?auto_34354 - SURFACE
      ?auto_34355 - SURFACE
    )
    :vars
    (
      ?auto_34360 - HOIST
      ?auto_34361 - PLACE
      ?auto_34359 - PLACE
      ?auto_34357 - HOIST
      ?auto_34356 - SURFACE
      ?auto_34358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34360 ?auto_34361 ) ( IS-CRATE ?auto_34355 ) ( not ( = ?auto_34354 ?auto_34355 ) ) ( not ( = ?auto_34353 ?auto_34354 ) ) ( not ( = ?auto_34353 ?auto_34355 ) ) ( not ( = ?auto_34359 ?auto_34361 ) ) ( HOIST-AT ?auto_34357 ?auto_34359 ) ( not ( = ?auto_34360 ?auto_34357 ) ) ( AVAILABLE ?auto_34357 ) ( SURFACE-AT ?auto_34355 ?auto_34359 ) ( ON ?auto_34355 ?auto_34356 ) ( CLEAR ?auto_34355 ) ( not ( = ?auto_34354 ?auto_34356 ) ) ( not ( = ?auto_34355 ?auto_34356 ) ) ( not ( = ?auto_34353 ?auto_34356 ) ) ( TRUCK-AT ?auto_34358 ?auto_34361 ) ( SURFACE-AT ?auto_34353 ?auto_34361 ) ( CLEAR ?auto_34353 ) ( IS-CRATE ?auto_34354 ) ( AVAILABLE ?auto_34360 ) ( IN ?auto_34354 ?auto_34358 ) ( ON ?auto_34353 ?auto_34352 ) ( not ( = ?auto_34352 ?auto_34353 ) ) ( not ( = ?auto_34352 ?auto_34354 ) ) ( not ( = ?auto_34352 ?auto_34355 ) ) ( not ( = ?auto_34352 ?auto_34356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34353 ?auto_34354 ?auto_34355 )
      ( MAKE-3CRATE-VERIFY ?auto_34352 ?auto_34353 ?auto_34354 ?auto_34355 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34362 - SURFACE
      ?auto_34363 - SURFACE
      ?auto_34364 - SURFACE
      ?auto_34365 - SURFACE
      ?auto_34366 - SURFACE
    )
    :vars
    (
      ?auto_34371 - HOIST
      ?auto_34372 - PLACE
      ?auto_34370 - PLACE
      ?auto_34368 - HOIST
      ?auto_34367 - SURFACE
      ?auto_34369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34371 ?auto_34372 ) ( IS-CRATE ?auto_34366 ) ( not ( = ?auto_34365 ?auto_34366 ) ) ( not ( = ?auto_34364 ?auto_34365 ) ) ( not ( = ?auto_34364 ?auto_34366 ) ) ( not ( = ?auto_34370 ?auto_34372 ) ) ( HOIST-AT ?auto_34368 ?auto_34370 ) ( not ( = ?auto_34371 ?auto_34368 ) ) ( AVAILABLE ?auto_34368 ) ( SURFACE-AT ?auto_34366 ?auto_34370 ) ( ON ?auto_34366 ?auto_34367 ) ( CLEAR ?auto_34366 ) ( not ( = ?auto_34365 ?auto_34367 ) ) ( not ( = ?auto_34366 ?auto_34367 ) ) ( not ( = ?auto_34364 ?auto_34367 ) ) ( TRUCK-AT ?auto_34369 ?auto_34372 ) ( SURFACE-AT ?auto_34364 ?auto_34372 ) ( CLEAR ?auto_34364 ) ( IS-CRATE ?auto_34365 ) ( AVAILABLE ?auto_34371 ) ( IN ?auto_34365 ?auto_34369 ) ( ON ?auto_34363 ?auto_34362 ) ( ON ?auto_34364 ?auto_34363 ) ( not ( = ?auto_34362 ?auto_34363 ) ) ( not ( = ?auto_34362 ?auto_34364 ) ) ( not ( = ?auto_34362 ?auto_34365 ) ) ( not ( = ?auto_34362 ?auto_34366 ) ) ( not ( = ?auto_34362 ?auto_34367 ) ) ( not ( = ?auto_34363 ?auto_34364 ) ) ( not ( = ?auto_34363 ?auto_34365 ) ) ( not ( = ?auto_34363 ?auto_34366 ) ) ( not ( = ?auto_34363 ?auto_34367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34364 ?auto_34365 ?auto_34366 )
      ( MAKE-4CRATE-VERIFY ?auto_34362 ?auto_34363 ?auto_34364 ?auto_34365 ?auto_34366 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34373 - SURFACE
      ?auto_34374 - SURFACE
      ?auto_34375 - SURFACE
      ?auto_34376 - SURFACE
      ?auto_34377 - SURFACE
      ?auto_34378 - SURFACE
    )
    :vars
    (
      ?auto_34383 - HOIST
      ?auto_34384 - PLACE
      ?auto_34382 - PLACE
      ?auto_34380 - HOIST
      ?auto_34379 - SURFACE
      ?auto_34381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34383 ?auto_34384 ) ( IS-CRATE ?auto_34378 ) ( not ( = ?auto_34377 ?auto_34378 ) ) ( not ( = ?auto_34376 ?auto_34377 ) ) ( not ( = ?auto_34376 ?auto_34378 ) ) ( not ( = ?auto_34382 ?auto_34384 ) ) ( HOIST-AT ?auto_34380 ?auto_34382 ) ( not ( = ?auto_34383 ?auto_34380 ) ) ( AVAILABLE ?auto_34380 ) ( SURFACE-AT ?auto_34378 ?auto_34382 ) ( ON ?auto_34378 ?auto_34379 ) ( CLEAR ?auto_34378 ) ( not ( = ?auto_34377 ?auto_34379 ) ) ( not ( = ?auto_34378 ?auto_34379 ) ) ( not ( = ?auto_34376 ?auto_34379 ) ) ( TRUCK-AT ?auto_34381 ?auto_34384 ) ( SURFACE-AT ?auto_34376 ?auto_34384 ) ( CLEAR ?auto_34376 ) ( IS-CRATE ?auto_34377 ) ( AVAILABLE ?auto_34383 ) ( IN ?auto_34377 ?auto_34381 ) ( ON ?auto_34374 ?auto_34373 ) ( ON ?auto_34375 ?auto_34374 ) ( ON ?auto_34376 ?auto_34375 ) ( not ( = ?auto_34373 ?auto_34374 ) ) ( not ( = ?auto_34373 ?auto_34375 ) ) ( not ( = ?auto_34373 ?auto_34376 ) ) ( not ( = ?auto_34373 ?auto_34377 ) ) ( not ( = ?auto_34373 ?auto_34378 ) ) ( not ( = ?auto_34373 ?auto_34379 ) ) ( not ( = ?auto_34374 ?auto_34375 ) ) ( not ( = ?auto_34374 ?auto_34376 ) ) ( not ( = ?auto_34374 ?auto_34377 ) ) ( not ( = ?auto_34374 ?auto_34378 ) ) ( not ( = ?auto_34374 ?auto_34379 ) ) ( not ( = ?auto_34375 ?auto_34376 ) ) ( not ( = ?auto_34375 ?auto_34377 ) ) ( not ( = ?auto_34375 ?auto_34378 ) ) ( not ( = ?auto_34375 ?auto_34379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34376 ?auto_34377 ?auto_34378 )
      ( MAKE-5CRATE-VERIFY ?auto_34373 ?auto_34374 ?auto_34375 ?auto_34376 ?auto_34377 ?auto_34378 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34385 - SURFACE
      ?auto_34386 - SURFACE
    )
    :vars
    (
      ?auto_34392 - HOIST
      ?auto_34393 - PLACE
      ?auto_34387 - SURFACE
      ?auto_34391 - PLACE
      ?auto_34389 - HOIST
      ?auto_34388 - SURFACE
      ?auto_34390 - TRUCK
      ?auto_34394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34392 ?auto_34393 ) ( IS-CRATE ?auto_34386 ) ( not ( = ?auto_34385 ?auto_34386 ) ) ( not ( = ?auto_34387 ?auto_34385 ) ) ( not ( = ?auto_34387 ?auto_34386 ) ) ( not ( = ?auto_34391 ?auto_34393 ) ) ( HOIST-AT ?auto_34389 ?auto_34391 ) ( not ( = ?auto_34392 ?auto_34389 ) ) ( AVAILABLE ?auto_34389 ) ( SURFACE-AT ?auto_34386 ?auto_34391 ) ( ON ?auto_34386 ?auto_34388 ) ( CLEAR ?auto_34386 ) ( not ( = ?auto_34385 ?auto_34388 ) ) ( not ( = ?auto_34386 ?auto_34388 ) ) ( not ( = ?auto_34387 ?auto_34388 ) ) ( SURFACE-AT ?auto_34387 ?auto_34393 ) ( CLEAR ?auto_34387 ) ( IS-CRATE ?auto_34385 ) ( AVAILABLE ?auto_34392 ) ( IN ?auto_34385 ?auto_34390 ) ( TRUCK-AT ?auto_34390 ?auto_34394 ) ( not ( = ?auto_34394 ?auto_34393 ) ) ( not ( = ?auto_34391 ?auto_34394 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34390 ?auto_34394 ?auto_34393 )
      ( MAKE-2CRATE ?auto_34387 ?auto_34385 ?auto_34386 )
      ( MAKE-1CRATE-VERIFY ?auto_34385 ?auto_34386 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34395 - SURFACE
      ?auto_34396 - SURFACE
      ?auto_34397 - SURFACE
    )
    :vars
    (
      ?auto_34400 - HOIST
      ?auto_34399 - PLACE
      ?auto_34403 - PLACE
      ?auto_34402 - HOIST
      ?auto_34398 - SURFACE
      ?auto_34401 - TRUCK
      ?auto_34404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34400 ?auto_34399 ) ( IS-CRATE ?auto_34397 ) ( not ( = ?auto_34396 ?auto_34397 ) ) ( not ( = ?auto_34395 ?auto_34396 ) ) ( not ( = ?auto_34395 ?auto_34397 ) ) ( not ( = ?auto_34403 ?auto_34399 ) ) ( HOIST-AT ?auto_34402 ?auto_34403 ) ( not ( = ?auto_34400 ?auto_34402 ) ) ( AVAILABLE ?auto_34402 ) ( SURFACE-AT ?auto_34397 ?auto_34403 ) ( ON ?auto_34397 ?auto_34398 ) ( CLEAR ?auto_34397 ) ( not ( = ?auto_34396 ?auto_34398 ) ) ( not ( = ?auto_34397 ?auto_34398 ) ) ( not ( = ?auto_34395 ?auto_34398 ) ) ( SURFACE-AT ?auto_34395 ?auto_34399 ) ( CLEAR ?auto_34395 ) ( IS-CRATE ?auto_34396 ) ( AVAILABLE ?auto_34400 ) ( IN ?auto_34396 ?auto_34401 ) ( TRUCK-AT ?auto_34401 ?auto_34404 ) ( not ( = ?auto_34404 ?auto_34399 ) ) ( not ( = ?auto_34403 ?auto_34404 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34396 ?auto_34397 )
      ( MAKE-2CRATE-VERIFY ?auto_34395 ?auto_34396 ?auto_34397 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34405 - SURFACE
      ?auto_34406 - SURFACE
      ?auto_34407 - SURFACE
      ?auto_34408 - SURFACE
    )
    :vars
    (
      ?auto_34414 - HOIST
      ?auto_34410 - PLACE
      ?auto_34415 - PLACE
      ?auto_34409 - HOIST
      ?auto_34413 - SURFACE
      ?auto_34412 - TRUCK
      ?auto_34411 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34414 ?auto_34410 ) ( IS-CRATE ?auto_34408 ) ( not ( = ?auto_34407 ?auto_34408 ) ) ( not ( = ?auto_34406 ?auto_34407 ) ) ( not ( = ?auto_34406 ?auto_34408 ) ) ( not ( = ?auto_34415 ?auto_34410 ) ) ( HOIST-AT ?auto_34409 ?auto_34415 ) ( not ( = ?auto_34414 ?auto_34409 ) ) ( AVAILABLE ?auto_34409 ) ( SURFACE-AT ?auto_34408 ?auto_34415 ) ( ON ?auto_34408 ?auto_34413 ) ( CLEAR ?auto_34408 ) ( not ( = ?auto_34407 ?auto_34413 ) ) ( not ( = ?auto_34408 ?auto_34413 ) ) ( not ( = ?auto_34406 ?auto_34413 ) ) ( SURFACE-AT ?auto_34406 ?auto_34410 ) ( CLEAR ?auto_34406 ) ( IS-CRATE ?auto_34407 ) ( AVAILABLE ?auto_34414 ) ( IN ?auto_34407 ?auto_34412 ) ( TRUCK-AT ?auto_34412 ?auto_34411 ) ( not ( = ?auto_34411 ?auto_34410 ) ) ( not ( = ?auto_34415 ?auto_34411 ) ) ( ON ?auto_34406 ?auto_34405 ) ( not ( = ?auto_34405 ?auto_34406 ) ) ( not ( = ?auto_34405 ?auto_34407 ) ) ( not ( = ?auto_34405 ?auto_34408 ) ) ( not ( = ?auto_34405 ?auto_34413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34406 ?auto_34407 ?auto_34408 )
      ( MAKE-3CRATE-VERIFY ?auto_34405 ?auto_34406 ?auto_34407 ?auto_34408 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34416 - SURFACE
      ?auto_34417 - SURFACE
      ?auto_34418 - SURFACE
      ?auto_34419 - SURFACE
      ?auto_34420 - SURFACE
    )
    :vars
    (
      ?auto_34426 - HOIST
      ?auto_34422 - PLACE
      ?auto_34427 - PLACE
      ?auto_34421 - HOIST
      ?auto_34425 - SURFACE
      ?auto_34424 - TRUCK
      ?auto_34423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34426 ?auto_34422 ) ( IS-CRATE ?auto_34420 ) ( not ( = ?auto_34419 ?auto_34420 ) ) ( not ( = ?auto_34418 ?auto_34419 ) ) ( not ( = ?auto_34418 ?auto_34420 ) ) ( not ( = ?auto_34427 ?auto_34422 ) ) ( HOIST-AT ?auto_34421 ?auto_34427 ) ( not ( = ?auto_34426 ?auto_34421 ) ) ( AVAILABLE ?auto_34421 ) ( SURFACE-AT ?auto_34420 ?auto_34427 ) ( ON ?auto_34420 ?auto_34425 ) ( CLEAR ?auto_34420 ) ( not ( = ?auto_34419 ?auto_34425 ) ) ( not ( = ?auto_34420 ?auto_34425 ) ) ( not ( = ?auto_34418 ?auto_34425 ) ) ( SURFACE-AT ?auto_34418 ?auto_34422 ) ( CLEAR ?auto_34418 ) ( IS-CRATE ?auto_34419 ) ( AVAILABLE ?auto_34426 ) ( IN ?auto_34419 ?auto_34424 ) ( TRUCK-AT ?auto_34424 ?auto_34423 ) ( not ( = ?auto_34423 ?auto_34422 ) ) ( not ( = ?auto_34427 ?auto_34423 ) ) ( ON ?auto_34417 ?auto_34416 ) ( ON ?auto_34418 ?auto_34417 ) ( not ( = ?auto_34416 ?auto_34417 ) ) ( not ( = ?auto_34416 ?auto_34418 ) ) ( not ( = ?auto_34416 ?auto_34419 ) ) ( not ( = ?auto_34416 ?auto_34420 ) ) ( not ( = ?auto_34416 ?auto_34425 ) ) ( not ( = ?auto_34417 ?auto_34418 ) ) ( not ( = ?auto_34417 ?auto_34419 ) ) ( not ( = ?auto_34417 ?auto_34420 ) ) ( not ( = ?auto_34417 ?auto_34425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34418 ?auto_34419 ?auto_34420 )
      ( MAKE-4CRATE-VERIFY ?auto_34416 ?auto_34417 ?auto_34418 ?auto_34419 ?auto_34420 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34428 - SURFACE
      ?auto_34429 - SURFACE
      ?auto_34430 - SURFACE
      ?auto_34431 - SURFACE
      ?auto_34432 - SURFACE
      ?auto_34433 - SURFACE
    )
    :vars
    (
      ?auto_34439 - HOIST
      ?auto_34435 - PLACE
      ?auto_34440 - PLACE
      ?auto_34434 - HOIST
      ?auto_34438 - SURFACE
      ?auto_34437 - TRUCK
      ?auto_34436 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34439 ?auto_34435 ) ( IS-CRATE ?auto_34433 ) ( not ( = ?auto_34432 ?auto_34433 ) ) ( not ( = ?auto_34431 ?auto_34432 ) ) ( not ( = ?auto_34431 ?auto_34433 ) ) ( not ( = ?auto_34440 ?auto_34435 ) ) ( HOIST-AT ?auto_34434 ?auto_34440 ) ( not ( = ?auto_34439 ?auto_34434 ) ) ( AVAILABLE ?auto_34434 ) ( SURFACE-AT ?auto_34433 ?auto_34440 ) ( ON ?auto_34433 ?auto_34438 ) ( CLEAR ?auto_34433 ) ( not ( = ?auto_34432 ?auto_34438 ) ) ( not ( = ?auto_34433 ?auto_34438 ) ) ( not ( = ?auto_34431 ?auto_34438 ) ) ( SURFACE-AT ?auto_34431 ?auto_34435 ) ( CLEAR ?auto_34431 ) ( IS-CRATE ?auto_34432 ) ( AVAILABLE ?auto_34439 ) ( IN ?auto_34432 ?auto_34437 ) ( TRUCK-AT ?auto_34437 ?auto_34436 ) ( not ( = ?auto_34436 ?auto_34435 ) ) ( not ( = ?auto_34440 ?auto_34436 ) ) ( ON ?auto_34429 ?auto_34428 ) ( ON ?auto_34430 ?auto_34429 ) ( ON ?auto_34431 ?auto_34430 ) ( not ( = ?auto_34428 ?auto_34429 ) ) ( not ( = ?auto_34428 ?auto_34430 ) ) ( not ( = ?auto_34428 ?auto_34431 ) ) ( not ( = ?auto_34428 ?auto_34432 ) ) ( not ( = ?auto_34428 ?auto_34433 ) ) ( not ( = ?auto_34428 ?auto_34438 ) ) ( not ( = ?auto_34429 ?auto_34430 ) ) ( not ( = ?auto_34429 ?auto_34431 ) ) ( not ( = ?auto_34429 ?auto_34432 ) ) ( not ( = ?auto_34429 ?auto_34433 ) ) ( not ( = ?auto_34429 ?auto_34438 ) ) ( not ( = ?auto_34430 ?auto_34431 ) ) ( not ( = ?auto_34430 ?auto_34432 ) ) ( not ( = ?auto_34430 ?auto_34433 ) ) ( not ( = ?auto_34430 ?auto_34438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34431 ?auto_34432 ?auto_34433 )
      ( MAKE-5CRATE-VERIFY ?auto_34428 ?auto_34429 ?auto_34430 ?auto_34431 ?auto_34432 ?auto_34433 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34441 - SURFACE
      ?auto_34442 - SURFACE
    )
    :vars
    (
      ?auto_34449 - HOIST
      ?auto_34444 - PLACE
      ?auto_34448 - SURFACE
      ?auto_34450 - PLACE
      ?auto_34443 - HOIST
      ?auto_34447 - SURFACE
      ?auto_34446 - TRUCK
      ?auto_34445 - PLACE
      ?auto_34451 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34449 ?auto_34444 ) ( IS-CRATE ?auto_34442 ) ( not ( = ?auto_34441 ?auto_34442 ) ) ( not ( = ?auto_34448 ?auto_34441 ) ) ( not ( = ?auto_34448 ?auto_34442 ) ) ( not ( = ?auto_34450 ?auto_34444 ) ) ( HOIST-AT ?auto_34443 ?auto_34450 ) ( not ( = ?auto_34449 ?auto_34443 ) ) ( AVAILABLE ?auto_34443 ) ( SURFACE-AT ?auto_34442 ?auto_34450 ) ( ON ?auto_34442 ?auto_34447 ) ( CLEAR ?auto_34442 ) ( not ( = ?auto_34441 ?auto_34447 ) ) ( not ( = ?auto_34442 ?auto_34447 ) ) ( not ( = ?auto_34448 ?auto_34447 ) ) ( SURFACE-AT ?auto_34448 ?auto_34444 ) ( CLEAR ?auto_34448 ) ( IS-CRATE ?auto_34441 ) ( AVAILABLE ?auto_34449 ) ( TRUCK-AT ?auto_34446 ?auto_34445 ) ( not ( = ?auto_34445 ?auto_34444 ) ) ( not ( = ?auto_34450 ?auto_34445 ) ) ( HOIST-AT ?auto_34451 ?auto_34445 ) ( LIFTING ?auto_34451 ?auto_34441 ) ( not ( = ?auto_34449 ?auto_34451 ) ) ( not ( = ?auto_34443 ?auto_34451 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34451 ?auto_34441 ?auto_34446 ?auto_34445 )
      ( MAKE-2CRATE ?auto_34448 ?auto_34441 ?auto_34442 )
      ( MAKE-1CRATE-VERIFY ?auto_34441 ?auto_34442 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34452 - SURFACE
      ?auto_34453 - SURFACE
      ?auto_34454 - SURFACE
    )
    :vars
    (
      ?auto_34459 - HOIST
      ?auto_34456 - PLACE
      ?auto_34461 - PLACE
      ?auto_34462 - HOIST
      ?auto_34460 - SURFACE
      ?auto_34455 - TRUCK
      ?auto_34458 - PLACE
      ?auto_34457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34459 ?auto_34456 ) ( IS-CRATE ?auto_34454 ) ( not ( = ?auto_34453 ?auto_34454 ) ) ( not ( = ?auto_34452 ?auto_34453 ) ) ( not ( = ?auto_34452 ?auto_34454 ) ) ( not ( = ?auto_34461 ?auto_34456 ) ) ( HOIST-AT ?auto_34462 ?auto_34461 ) ( not ( = ?auto_34459 ?auto_34462 ) ) ( AVAILABLE ?auto_34462 ) ( SURFACE-AT ?auto_34454 ?auto_34461 ) ( ON ?auto_34454 ?auto_34460 ) ( CLEAR ?auto_34454 ) ( not ( = ?auto_34453 ?auto_34460 ) ) ( not ( = ?auto_34454 ?auto_34460 ) ) ( not ( = ?auto_34452 ?auto_34460 ) ) ( SURFACE-AT ?auto_34452 ?auto_34456 ) ( CLEAR ?auto_34452 ) ( IS-CRATE ?auto_34453 ) ( AVAILABLE ?auto_34459 ) ( TRUCK-AT ?auto_34455 ?auto_34458 ) ( not ( = ?auto_34458 ?auto_34456 ) ) ( not ( = ?auto_34461 ?auto_34458 ) ) ( HOIST-AT ?auto_34457 ?auto_34458 ) ( LIFTING ?auto_34457 ?auto_34453 ) ( not ( = ?auto_34459 ?auto_34457 ) ) ( not ( = ?auto_34462 ?auto_34457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34453 ?auto_34454 )
      ( MAKE-2CRATE-VERIFY ?auto_34452 ?auto_34453 ?auto_34454 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34463 - SURFACE
      ?auto_34464 - SURFACE
      ?auto_34465 - SURFACE
      ?auto_34466 - SURFACE
    )
    :vars
    (
      ?auto_34473 - HOIST
      ?auto_34468 - PLACE
      ?auto_34469 - PLACE
      ?auto_34470 - HOIST
      ?auto_34471 - SURFACE
      ?auto_34467 - TRUCK
      ?auto_34472 - PLACE
      ?auto_34474 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34473 ?auto_34468 ) ( IS-CRATE ?auto_34466 ) ( not ( = ?auto_34465 ?auto_34466 ) ) ( not ( = ?auto_34464 ?auto_34465 ) ) ( not ( = ?auto_34464 ?auto_34466 ) ) ( not ( = ?auto_34469 ?auto_34468 ) ) ( HOIST-AT ?auto_34470 ?auto_34469 ) ( not ( = ?auto_34473 ?auto_34470 ) ) ( AVAILABLE ?auto_34470 ) ( SURFACE-AT ?auto_34466 ?auto_34469 ) ( ON ?auto_34466 ?auto_34471 ) ( CLEAR ?auto_34466 ) ( not ( = ?auto_34465 ?auto_34471 ) ) ( not ( = ?auto_34466 ?auto_34471 ) ) ( not ( = ?auto_34464 ?auto_34471 ) ) ( SURFACE-AT ?auto_34464 ?auto_34468 ) ( CLEAR ?auto_34464 ) ( IS-CRATE ?auto_34465 ) ( AVAILABLE ?auto_34473 ) ( TRUCK-AT ?auto_34467 ?auto_34472 ) ( not ( = ?auto_34472 ?auto_34468 ) ) ( not ( = ?auto_34469 ?auto_34472 ) ) ( HOIST-AT ?auto_34474 ?auto_34472 ) ( LIFTING ?auto_34474 ?auto_34465 ) ( not ( = ?auto_34473 ?auto_34474 ) ) ( not ( = ?auto_34470 ?auto_34474 ) ) ( ON ?auto_34464 ?auto_34463 ) ( not ( = ?auto_34463 ?auto_34464 ) ) ( not ( = ?auto_34463 ?auto_34465 ) ) ( not ( = ?auto_34463 ?auto_34466 ) ) ( not ( = ?auto_34463 ?auto_34471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34464 ?auto_34465 ?auto_34466 )
      ( MAKE-3CRATE-VERIFY ?auto_34463 ?auto_34464 ?auto_34465 ?auto_34466 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34475 - SURFACE
      ?auto_34476 - SURFACE
      ?auto_34477 - SURFACE
      ?auto_34478 - SURFACE
      ?auto_34479 - SURFACE
    )
    :vars
    (
      ?auto_34486 - HOIST
      ?auto_34481 - PLACE
      ?auto_34482 - PLACE
      ?auto_34483 - HOIST
      ?auto_34484 - SURFACE
      ?auto_34480 - TRUCK
      ?auto_34485 - PLACE
      ?auto_34487 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34486 ?auto_34481 ) ( IS-CRATE ?auto_34479 ) ( not ( = ?auto_34478 ?auto_34479 ) ) ( not ( = ?auto_34477 ?auto_34478 ) ) ( not ( = ?auto_34477 ?auto_34479 ) ) ( not ( = ?auto_34482 ?auto_34481 ) ) ( HOIST-AT ?auto_34483 ?auto_34482 ) ( not ( = ?auto_34486 ?auto_34483 ) ) ( AVAILABLE ?auto_34483 ) ( SURFACE-AT ?auto_34479 ?auto_34482 ) ( ON ?auto_34479 ?auto_34484 ) ( CLEAR ?auto_34479 ) ( not ( = ?auto_34478 ?auto_34484 ) ) ( not ( = ?auto_34479 ?auto_34484 ) ) ( not ( = ?auto_34477 ?auto_34484 ) ) ( SURFACE-AT ?auto_34477 ?auto_34481 ) ( CLEAR ?auto_34477 ) ( IS-CRATE ?auto_34478 ) ( AVAILABLE ?auto_34486 ) ( TRUCK-AT ?auto_34480 ?auto_34485 ) ( not ( = ?auto_34485 ?auto_34481 ) ) ( not ( = ?auto_34482 ?auto_34485 ) ) ( HOIST-AT ?auto_34487 ?auto_34485 ) ( LIFTING ?auto_34487 ?auto_34478 ) ( not ( = ?auto_34486 ?auto_34487 ) ) ( not ( = ?auto_34483 ?auto_34487 ) ) ( ON ?auto_34476 ?auto_34475 ) ( ON ?auto_34477 ?auto_34476 ) ( not ( = ?auto_34475 ?auto_34476 ) ) ( not ( = ?auto_34475 ?auto_34477 ) ) ( not ( = ?auto_34475 ?auto_34478 ) ) ( not ( = ?auto_34475 ?auto_34479 ) ) ( not ( = ?auto_34475 ?auto_34484 ) ) ( not ( = ?auto_34476 ?auto_34477 ) ) ( not ( = ?auto_34476 ?auto_34478 ) ) ( not ( = ?auto_34476 ?auto_34479 ) ) ( not ( = ?auto_34476 ?auto_34484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34477 ?auto_34478 ?auto_34479 )
      ( MAKE-4CRATE-VERIFY ?auto_34475 ?auto_34476 ?auto_34477 ?auto_34478 ?auto_34479 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34488 - SURFACE
      ?auto_34489 - SURFACE
      ?auto_34490 - SURFACE
      ?auto_34491 - SURFACE
      ?auto_34492 - SURFACE
      ?auto_34493 - SURFACE
    )
    :vars
    (
      ?auto_34500 - HOIST
      ?auto_34495 - PLACE
      ?auto_34496 - PLACE
      ?auto_34497 - HOIST
      ?auto_34498 - SURFACE
      ?auto_34494 - TRUCK
      ?auto_34499 - PLACE
      ?auto_34501 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34500 ?auto_34495 ) ( IS-CRATE ?auto_34493 ) ( not ( = ?auto_34492 ?auto_34493 ) ) ( not ( = ?auto_34491 ?auto_34492 ) ) ( not ( = ?auto_34491 ?auto_34493 ) ) ( not ( = ?auto_34496 ?auto_34495 ) ) ( HOIST-AT ?auto_34497 ?auto_34496 ) ( not ( = ?auto_34500 ?auto_34497 ) ) ( AVAILABLE ?auto_34497 ) ( SURFACE-AT ?auto_34493 ?auto_34496 ) ( ON ?auto_34493 ?auto_34498 ) ( CLEAR ?auto_34493 ) ( not ( = ?auto_34492 ?auto_34498 ) ) ( not ( = ?auto_34493 ?auto_34498 ) ) ( not ( = ?auto_34491 ?auto_34498 ) ) ( SURFACE-AT ?auto_34491 ?auto_34495 ) ( CLEAR ?auto_34491 ) ( IS-CRATE ?auto_34492 ) ( AVAILABLE ?auto_34500 ) ( TRUCK-AT ?auto_34494 ?auto_34499 ) ( not ( = ?auto_34499 ?auto_34495 ) ) ( not ( = ?auto_34496 ?auto_34499 ) ) ( HOIST-AT ?auto_34501 ?auto_34499 ) ( LIFTING ?auto_34501 ?auto_34492 ) ( not ( = ?auto_34500 ?auto_34501 ) ) ( not ( = ?auto_34497 ?auto_34501 ) ) ( ON ?auto_34489 ?auto_34488 ) ( ON ?auto_34490 ?auto_34489 ) ( ON ?auto_34491 ?auto_34490 ) ( not ( = ?auto_34488 ?auto_34489 ) ) ( not ( = ?auto_34488 ?auto_34490 ) ) ( not ( = ?auto_34488 ?auto_34491 ) ) ( not ( = ?auto_34488 ?auto_34492 ) ) ( not ( = ?auto_34488 ?auto_34493 ) ) ( not ( = ?auto_34488 ?auto_34498 ) ) ( not ( = ?auto_34489 ?auto_34490 ) ) ( not ( = ?auto_34489 ?auto_34491 ) ) ( not ( = ?auto_34489 ?auto_34492 ) ) ( not ( = ?auto_34489 ?auto_34493 ) ) ( not ( = ?auto_34489 ?auto_34498 ) ) ( not ( = ?auto_34490 ?auto_34491 ) ) ( not ( = ?auto_34490 ?auto_34492 ) ) ( not ( = ?auto_34490 ?auto_34493 ) ) ( not ( = ?auto_34490 ?auto_34498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34491 ?auto_34492 ?auto_34493 )
      ( MAKE-5CRATE-VERIFY ?auto_34488 ?auto_34489 ?auto_34490 ?auto_34491 ?auto_34492 ?auto_34493 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34502 - SURFACE
      ?auto_34503 - SURFACE
    )
    :vars
    (
      ?auto_34511 - HOIST
      ?auto_34505 - PLACE
      ?auto_34509 - SURFACE
      ?auto_34506 - PLACE
      ?auto_34507 - HOIST
      ?auto_34508 - SURFACE
      ?auto_34504 - TRUCK
      ?auto_34510 - PLACE
      ?auto_34512 - HOIST
      ?auto_34513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34511 ?auto_34505 ) ( IS-CRATE ?auto_34503 ) ( not ( = ?auto_34502 ?auto_34503 ) ) ( not ( = ?auto_34509 ?auto_34502 ) ) ( not ( = ?auto_34509 ?auto_34503 ) ) ( not ( = ?auto_34506 ?auto_34505 ) ) ( HOIST-AT ?auto_34507 ?auto_34506 ) ( not ( = ?auto_34511 ?auto_34507 ) ) ( AVAILABLE ?auto_34507 ) ( SURFACE-AT ?auto_34503 ?auto_34506 ) ( ON ?auto_34503 ?auto_34508 ) ( CLEAR ?auto_34503 ) ( not ( = ?auto_34502 ?auto_34508 ) ) ( not ( = ?auto_34503 ?auto_34508 ) ) ( not ( = ?auto_34509 ?auto_34508 ) ) ( SURFACE-AT ?auto_34509 ?auto_34505 ) ( CLEAR ?auto_34509 ) ( IS-CRATE ?auto_34502 ) ( AVAILABLE ?auto_34511 ) ( TRUCK-AT ?auto_34504 ?auto_34510 ) ( not ( = ?auto_34510 ?auto_34505 ) ) ( not ( = ?auto_34506 ?auto_34510 ) ) ( HOIST-AT ?auto_34512 ?auto_34510 ) ( not ( = ?auto_34511 ?auto_34512 ) ) ( not ( = ?auto_34507 ?auto_34512 ) ) ( AVAILABLE ?auto_34512 ) ( SURFACE-AT ?auto_34502 ?auto_34510 ) ( ON ?auto_34502 ?auto_34513 ) ( CLEAR ?auto_34502 ) ( not ( = ?auto_34502 ?auto_34513 ) ) ( not ( = ?auto_34503 ?auto_34513 ) ) ( not ( = ?auto_34509 ?auto_34513 ) ) ( not ( = ?auto_34508 ?auto_34513 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34512 ?auto_34502 ?auto_34513 ?auto_34510 )
      ( MAKE-2CRATE ?auto_34509 ?auto_34502 ?auto_34503 )
      ( MAKE-1CRATE-VERIFY ?auto_34502 ?auto_34503 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34514 - SURFACE
      ?auto_34515 - SURFACE
      ?auto_34516 - SURFACE
    )
    :vars
    (
      ?auto_34522 - HOIST
      ?auto_34520 - PLACE
      ?auto_34521 - PLACE
      ?auto_34524 - HOIST
      ?auto_34518 - SURFACE
      ?auto_34517 - TRUCK
      ?auto_34523 - PLACE
      ?auto_34519 - HOIST
      ?auto_34525 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34522 ?auto_34520 ) ( IS-CRATE ?auto_34516 ) ( not ( = ?auto_34515 ?auto_34516 ) ) ( not ( = ?auto_34514 ?auto_34515 ) ) ( not ( = ?auto_34514 ?auto_34516 ) ) ( not ( = ?auto_34521 ?auto_34520 ) ) ( HOIST-AT ?auto_34524 ?auto_34521 ) ( not ( = ?auto_34522 ?auto_34524 ) ) ( AVAILABLE ?auto_34524 ) ( SURFACE-AT ?auto_34516 ?auto_34521 ) ( ON ?auto_34516 ?auto_34518 ) ( CLEAR ?auto_34516 ) ( not ( = ?auto_34515 ?auto_34518 ) ) ( not ( = ?auto_34516 ?auto_34518 ) ) ( not ( = ?auto_34514 ?auto_34518 ) ) ( SURFACE-AT ?auto_34514 ?auto_34520 ) ( CLEAR ?auto_34514 ) ( IS-CRATE ?auto_34515 ) ( AVAILABLE ?auto_34522 ) ( TRUCK-AT ?auto_34517 ?auto_34523 ) ( not ( = ?auto_34523 ?auto_34520 ) ) ( not ( = ?auto_34521 ?auto_34523 ) ) ( HOIST-AT ?auto_34519 ?auto_34523 ) ( not ( = ?auto_34522 ?auto_34519 ) ) ( not ( = ?auto_34524 ?auto_34519 ) ) ( AVAILABLE ?auto_34519 ) ( SURFACE-AT ?auto_34515 ?auto_34523 ) ( ON ?auto_34515 ?auto_34525 ) ( CLEAR ?auto_34515 ) ( not ( = ?auto_34515 ?auto_34525 ) ) ( not ( = ?auto_34516 ?auto_34525 ) ) ( not ( = ?auto_34514 ?auto_34525 ) ) ( not ( = ?auto_34518 ?auto_34525 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34515 ?auto_34516 )
      ( MAKE-2CRATE-VERIFY ?auto_34514 ?auto_34515 ?auto_34516 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34526 - SURFACE
      ?auto_34527 - SURFACE
      ?auto_34528 - SURFACE
      ?auto_34529 - SURFACE
    )
    :vars
    (
      ?auto_34533 - HOIST
      ?auto_34536 - PLACE
      ?auto_34535 - PLACE
      ?auto_34532 - HOIST
      ?auto_34538 - SURFACE
      ?auto_34534 - TRUCK
      ?auto_34537 - PLACE
      ?auto_34530 - HOIST
      ?auto_34531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34533 ?auto_34536 ) ( IS-CRATE ?auto_34529 ) ( not ( = ?auto_34528 ?auto_34529 ) ) ( not ( = ?auto_34527 ?auto_34528 ) ) ( not ( = ?auto_34527 ?auto_34529 ) ) ( not ( = ?auto_34535 ?auto_34536 ) ) ( HOIST-AT ?auto_34532 ?auto_34535 ) ( not ( = ?auto_34533 ?auto_34532 ) ) ( AVAILABLE ?auto_34532 ) ( SURFACE-AT ?auto_34529 ?auto_34535 ) ( ON ?auto_34529 ?auto_34538 ) ( CLEAR ?auto_34529 ) ( not ( = ?auto_34528 ?auto_34538 ) ) ( not ( = ?auto_34529 ?auto_34538 ) ) ( not ( = ?auto_34527 ?auto_34538 ) ) ( SURFACE-AT ?auto_34527 ?auto_34536 ) ( CLEAR ?auto_34527 ) ( IS-CRATE ?auto_34528 ) ( AVAILABLE ?auto_34533 ) ( TRUCK-AT ?auto_34534 ?auto_34537 ) ( not ( = ?auto_34537 ?auto_34536 ) ) ( not ( = ?auto_34535 ?auto_34537 ) ) ( HOIST-AT ?auto_34530 ?auto_34537 ) ( not ( = ?auto_34533 ?auto_34530 ) ) ( not ( = ?auto_34532 ?auto_34530 ) ) ( AVAILABLE ?auto_34530 ) ( SURFACE-AT ?auto_34528 ?auto_34537 ) ( ON ?auto_34528 ?auto_34531 ) ( CLEAR ?auto_34528 ) ( not ( = ?auto_34528 ?auto_34531 ) ) ( not ( = ?auto_34529 ?auto_34531 ) ) ( not ( = ?auto_34527 ?auto_34531 ) ) ( not ( = ?auto_34538 ?auto_34531 ) ) ( ON ?auto_34527 ?auto_34526 ) ( not ( = ?auto_34526 ?auto_34527 ) ) ( not ( = ?auto_34526 ?auto_34528 ) ) ( not ( = ?auto_34526 ?auto_34529 ) ) ( not ( = ?auto_34526 ?auto_34538 ) ) ( not ( = ?auto_34526 ?auto_34531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34527 ?auto_34528 ?auto_34529 )
      ( MAKE-3CRATE-VERIFY ?auto_34526 ?auto_34527 ?auto_34528 ?auto_34529 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34539 - SURFACE
      ?auto_34540 - SURFACE
      ?auto_34541 - SURFACE
      ?auto_34542 - SURFACE
      ?auto_34543 - SURFACE
    )
    :vars
    (
      ?auto_34547 - HOIST
      ?auto_34550 - PLACE
      ?auto_34549 - PLACE
      ?auto_34546 - HOIST
      ?auto_34552 - SURFACE
      ?auto_34548 - TRUCK
      ?auto_34551 - PLACE
      ?auto_34544 - HOIST
      ?auto_34545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34547 ?auto_34550 ) ( IS-CRATE ?auto_34543 ) ( not ( = ?auto_34542 ?auto_34543 ) ) ( not ( = ?auto_34541 ?auto_34542 ) ) ( not ( = ?auto_34541 ?auto_34543 ) ) ( not ( = ?auto_34549 ?auto_34550 ) ) ( HOIST-AT ?auto_34546 ?auto_34549 ) ( not ( = ?auto_34547 ?auto_34546 ) ) ( AVAILABLE ?auto_34546 ) ( SURFACE-AT ?auto_34543 ?auto_34549 ) ( ON ?auto_34543 ?auto_34552 ) ( CLEAR ?auto_34543 ) ( not ( = ?auto_34542 ?auto_34552 ) ) ( not ( = ?auto_34543 ?auto_34552 ) ) ( not ( = ?auto_34541 ?auto_34552 ) ) ( SURFACE-AT ?auto_34541 ?auto_34550 ) ( CLEAR ?auto_34541 ) ( IS-CRATE ?auto_34542 ) ( AVAILABLE ?auto_34547 ) ( TRUCK-AT ?auto_34548 ?auto_34551 ) ( not ( = ?auto_34551 ?auto_34550 ) ) ( not ( = ?auto_34549 ?auto_34551 ) ) ( HOIST-AT ?auto_34544 ?auto_34551 ) ( not ( = ?auto_34547 ?auto_34544 ) ) ( not ( = ?auto_34546 ?auto_34544 ) ) ( AVAILABLE ?auto_34544 ) ( SURFACE-AT ?auto_34542 ?auto_34551 ) ( ON ?auto_34542 ?auto_34545 ) ( CLEAR ?auto_34542 ) ( not ( = ?auto_34542 ?auto_34545 ) ) ( not ( = ?auto_34543 ?auto_34545 ) ) ( not ( = ?auto_34541 ?auto_34545 ) ) ( not ( = ?auto_34552 ?auto_34545 ) ) ( ON ?auto_34540 ?auto_34539 ) ( ON ?auto_34541 ?auto_34540 ) ( not ( = ?auto_34539 ?auto_34540 ) ) ( not ( = ?auto_34539 ?auto_34541 ) ) ( not ( = ?auto_34539 ?auto_34542 ) ) ( not ( = ?auto_34539 ?auto_34543 ) ) ( not ( = ?auto_34539 ?auto_34552 ) ) ( not ( = ?auto_34539 ?auto_34545 ) ) ( not ( = ?auto_34540 ?auto_34541 ) ) ( not ( = ?auto_34540 ?auto_34542 ) ) ( not ( = ?auto_34540 ?auto_34543 ) ) ( not ( = ?auto_34540 ?auto_34552 ) ) ( not ( = ?auto_34540 ?auto_34545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34541 ?auto_34542 ?auto_34543 )
      ( MAKE-4CRATE-VERIFY ?auto_34539 ?auto_34540 ?auto_34541 ?auto_34542 ?auto_34543 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34553 - SURFACE
      ?auto_34554 - SURFACE
      ?auto_34555 - SURFACE
      ?auto_34556 - SURFACE
      ?auto_34557 - SURFACE
      ?auto_34558 - SURFACE
    )
    :vars
    (
      ?auto_34562 - HOIST
      ?auto_34565 - PLACE
      ?auto_34564 - PLACE
      ?auto_34561 - HOIST
      ?auto_34567 - SURFACE
      ?auto_34563 - TRUCK
      ?auto_34566 - PLACE
      ?auto_34559 - HOIST
      ?auto_34560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34562 ?auto_34565 ) ( IS-CRATE ?auto_34558 ) ( not ( = ?auto_34557 ?auto_34558 ) ) ( not ( = ?auto_34556 ?auto_34557 ) ) ( not ( = ?auto_34556 ?auto_34558 ) ) ( not ( = ?auto_34564 ?auto_34565 ) ) ( HOIST-AT ?auto_34561 ?auto_34564 ) ( not ( = ?auto_34562 ?auto_34561 ) ) ( AVAILABLE ?auto_34561 ) ( SURFACE-AT ?auto_34558 ?auto_34564 ) ( ON ?auto_34558 ?auto_34567 ) ( CLEAR ?auto_34558 ) ( not ( = ?auto_34557 ?auto_34567 ) ) ( not ( = ?auto_34558 ?auto_34567 ) ) ( not ( = ?auto_34556 ?auto_34567 ) ) ( SURFACE-AT ?auto_34556 ?auto_34565 ) ( CLEAR ?auto_34556 ) ( IS-CRATE ?auto_34557 ) ( AVAILABLE ?auto_34562 ) ( TRUCK-AT ?auto_34563 ?auto_34566 ) ( not ( = ?auto_34566 ?auto_34565 ) ) ( not ( = ?auto_34564 ?auto_34566 ) ) ( HOIST-AT ?auto_34559 ?auto_34566 ) ( not ( = ?auto_34562 ?auto_34559 ) ) ( not ( = ?auto_34561 ?auto_34559 ) ) ( AVAILABLE ?auto_34559 ) ( SURFACE-AT ?auto_34557 ?auto_34566 ) ( ON ?auto_34557 ?auto_34560 ) ( CLEAR ?auto_34557 ) ( not ( = ?auto_34557 ?auto_34560 ) ) ( not ( = ?auto_34558 ?auto_34560 ) ) ( not ( = ?auto_34556 ?auto_34560 ) ) ( not ( = ?auto_34567 ?auto_34560 ) ) ( ON ?auto_34554 ?auto_34553 ) ( ON ?auto_34555 ?auto_34554 ) ( ON ?auto_34556 ?auto_34555 ) ( not ( = ?auto_34553 ?auto_34554 ) ) ( not ( = ?auto_34553 ?auto_34555 ) ) ( not ( = ?auto_34553 ?auto_34556 ) ) ( not ( = ?auto_34553 ?auto_34557 ) ) ( not ( = ?auto_34553 ?auto_34558 ) ) ( not ( = ?auto_34553 ?auto_34567 ) ) ( not ( = ?auto_34553 ?auto_34560 ) ) ( not ( = ?auto_34554 ?auto_34555 ) ) ( not ( = ?auto_34554 ?auto_34556 ) ) ( not ( = ?auto_34554 ?auto_34557 ) ) ( not ( = ?auto_34554 ?auto_34558 ) ) ( not ( = ?auto_34554 ?auto_34567 ) ) ( not ( = ?auto_34554 ?auto_34560 ) ) ( not ( = ?auto_34555 ?auto_34556 ) ) ( not ( = ?auto_34555 ?auto_34557 ) ) ( not ( = ?auto_34555 ?auto_34558 ) ) ( not ( = ?auto_34555 ?auto_34567 ) ) ( not ( = ?auto_34555 ?auto_34560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34556 ?auto_34557 ?auto_34558 )
      ( MAKE-5CRATE-VERIFY ?auto_34553 ?auto_34554 ?auto_34555 ?auto_34556 ?auto_34557 ?auto_34558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34568 - SURFACE
      ?auto_34569 - SURFACE
    )
    :vars
    (
      ?auto_34574 - HOIST
      ?auto_34577 - PLACE
      ?auto_34570 - SURFACE
      ?auto_34576 - PLACE
      ?auto_34573 - HOIST
      ?auto_34579 - SURFACE
      ?auto_34578 - PLACE
      ?auto_34571 - HOIST
      ?auto_34572 - SURFACE
      ?auto_34575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34574 ?auto_34577 ) ( IS-CRATE ?auto_34569 ) ( not ( = ?auto_34568 ?auto_34569 ) ) ( not ( = ?auto_34570 ?auto_34568 ) ) ( not ( = ?auto_34570 ?auto_34569 ) ) ( not ( = ?auto_34576 ?auto_34577 ) ) ( HOIST-AT ?auto_34573 ?auto_34576 ) ( not ( = ?auto_34574 ?auto_34573 ) ) ( AVAILABLE ?auto_34573 ) ( SURFACE-AT ?auto_34569 ?auto_34576 ) ( ON ?auto_34569 ?auto_34579 ) ( CLEAR ?auto_34569 ) ( not ( = ?auto_34568 ?auto_34579 ) ) ( not ( = ?auto_34569 ?auto_34579 ) ) ( not ( = ?auto_34570 ?auto_34579 ) ) ( SURFACE-AT ?auto_34570 ?auto_34577 ) ( CLEAR ?auto_34570 ) ( IS-CRATE ?auto_34568 ) ( AVAILABLE ?auto_34574 ) ( not ( = ?auto_34578 ?auto_34577 ) ) ( not ( = ?auto_34576 ?auto_34578 ) ) ( HOIST-AT ?auto_34571 ?auto_34578 ) ( not ( = ?auto_34574 ?auto_34571 ) ) ( not ( = ?auto_34573 ?auto_34571 ) ) ( AVAILABLE ?auto_34571 ) ( SURFACE-AT ?auto_34568 ?auto_34578 ) ( ON ?auto_34568 ?auto_34572 ) ( CLEAR ?auto_34568 ) ( not ( = ?auto_34568 ?auto_34572 ) ) ( not ( = ?auto_34569 ?auto_34572 ) ) ( not ( = ?auto_34570 ?auto_34572 ) ) ( not ( = ?auto_34579 ?auto_34572 ) ) ( TRUCK-AT ?auto_34575 ?auto_34577 ) )
    :subtasks
    ( ( !DRIVE ?auto_34575 ?auto_34577 ?auto_34578 )
      ( MAKE-2CRATE ?auto_34570 ?auto_34568 ?auto_34569 )
      ( MAKE-1CRATE-VERIFY ?auto_34568 ?auto_34569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34580 - SURFACE
      ?auto_34581 - SURFACE
      ?auto_34582 - SURFACE
    )
    :vars
    (
      ?auto_34586 - HOIST
      ?auto_34589 - PLACE
      ?auto_34588 - PLACE
      ?auto_34590 - HOIST
      ?auto_34587 - SURFACE
      ?auto_34584 - PLACE
      ?auto_34585 - HOIST
      ?auto_34583 - SURFACE
      ?auto_34591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34586 ?auto_34589 ) ( IS-CRATE ?auto_34582 ) ( not ( = ?auto_34581 ?auto_34582 ) ) ( not ( = ?auto_34580 ?auto_34581 ) ) ( not ( = ?auto_34580 ?auto_34582 ) ) ( not ( = ?auto_34588 ?auto_34589 ) ) ( HOIST-AT ?auto_34590 ?auto_34588 ) ( not ( = ?auto_34586 ?auto_34590 ) ) ( AVAILABLE ?auto_34590 ) ( SURFACE-AT ?auto_34582 ?auto_34588 ) ( ON ?auto_34582 ?auto_34587 ) ( CLEAR ?auto_34582 ) ( not ( = ?auto_34581 ?auto_34587 ) ) ( not ( = ?auto_34582 ?auto_34587 ) ) ( not ( = ?auto_34580 ?auto_34587 ) ) ( SURFACE-AT ?auto_34580 ?auto_34589 ) ( CLEAR ?auto_34580 ) ( IS-CRATE ?auto_34581 ) ( AVAILABLE ?auto_34586 ) ( not ( = ?auto_34584 ?auto_34589 ) ) ( not ( = ?auto_34588 ?auto_34584 ) ) ( HOIST-AT ?auto_34585 ?auto_34584 ) ( not ( = ?auto_34586 ?auto_34585 ) ) ( not ( = ?auto_34590 ?auto_34585 ) ) ( AVAILABLE ?auto_34585 ) ( SURFACE-AT ?auto_34581 ?auto_34584 ) ( ON ?auto_34581 ?auto_34583 ) ( CLEAR ?auto_34581 ) ( not ( = ?auto_34581 ?auto_34583 ) ) ( not ( = ?auto_34582 ?auto_34583 ) ) ( not ( = ?auto_34580 ?auto_34583 ) ) ( not ( = ?auto_34587 ?auto_34583 ) ) ( TRUCK-AT ?auto_34591 ?auto_34589 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34581 ?auto_34582 )
      ( MAKE-2CRATE-VERIFY ?auto_34580 ?auto_34581 ?auto_34582 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34592 - SURFACE
      ?auto_34593 - SURFACE
      ?auto_34594 - SURFACE
      ?auto_34595 - SURFACE
    )
    :vars
    (
      ?auto_34603 - HOIST
      ?auto_34602 - PLACE
      ?auto_34600 - PLACE
      ?auto_34604 - HOIST
      ?auto_34601 - SURFACE
      ?auto_34598 - PLACE
      ?auto_34597 - HOIST
      ?auto_34599 - SURFACE
      ?auto_34596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34603 ?auto_34602 ) ( IS-CRATE ?auto_34595 ) ( not ( = ?auto_34594 ?auto_34595 ) ) ( not ( = ?auto_34593 ?auto_34594 ) ) ( not ( = ?auto_34593 ?auto_34595 ) ) ( not ( = ?auto_34600 ?auto_34602 ) ) ( HOIST-AT ?auto_34604 ?auto_34600 ) ( not ( = ?auto_34603 ?auto_34604 ) ) ( AVAILABLE ?auto_34604 ) ( SURFACE-AT ?auto_34595 ?auto_34600 ) ( ON ?auto_34595 ?auto_34601 ) ( CLEAR ?auto_34595 ) ( not ( = ?auto_34594 ?auto_34601 ) ) ( not ( = ?auto_34595 ?auto_34601 ) ) ( not ( = ?auto_34593 ?auto_34601 ) ) ( SURFACE-AT ?auto_34593 ?auto_34602 ) ( CLEAR ?auto_34593 ) ( IS-CRATE ?auto_34594 ) ( AVAILABLE ?auto_34603 ) ( not ( = ?auto_34598 ?auto_34602 ) ) ( not ( = ?auto_34600 ?auto_34598 ) ) ( HOIST-AT ?auto_34597 ?auto_34598 ) ( not ( = ?auto_34603 ?auto_34597 ) ) ( not ( = ?auto_34604 ?auto_34597 ) ) ( AVAILABLE ?auto_34597 ) ( SURFACE-AT ?auto_34594 ?auto_34598 ) ( ON ?auto_34594 ?auto_34599 ) ( CLEAR ?auto_34594 ) ( not ( = ?auto_34594 ?auto_34599 ) ) ( not ( = ?auto_34595 ?auto_34599 ) ) ( not ( = ?auto_34593 ?auto_34599 ) ) ( not ( = ?auto_34601 ?auto_34599 ) ) ( TRUCK-AT ?auto_34596 ?auto_34602 ) ( ON ?auto_34593 ?auto_34592 ) ( not ( = ?auto_34592 ?auto_34593 ) ) ( not ( = ?auto_34592 ?auto_34594 ) ) ( not ( = ?auto_34592 ?auto_34595 ) ) ( not ( = ?auto_34592 ?auto_34601 ) ) ( not ( = ?auto_34592 ?auto_34599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34593 ?auto_34594 ?auto_34595 )
      ( MAKE-3CRATE-VERIFY ?auto_34592 ?auto_34593 ?auto_34594 ?auto_34595 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34605 - SURFACE
      ?auto_34606 - SURFACE
      ?auto_34607 - SURFACE
      ?auto_34608 - SURFACE
      ?auto_34609 - SURFACE
    )
    :vars
    (
      ?auto_34617 - HOIST
      ?auto_34616 - PLACE
      ?auto_34614 - PLACE
      ?auto_34618 - HOIST
      ?auto_34615 - SURFACE
      ?auto_34612 - PLACE
      ?auto_34611 - HOIST
      ?auto_34613 - SURFACE
      ?auto_34610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34617 ?auto_34616 ) ( IS-CRATE ?auto_34609 ) ( not ( = ?auto_34608 ?auto_34609 ) ) ( not ( = ?auto_34607 ?auto_34608 ) ) ( not ( = ?auto_34607 ?auto_34609 ) ) ( not ( = ?auto_34614 ?auto_34616 ) ) ( HOIST-AT ?auto_34618 ?auto_34614 ) ( not ( = ?auto_34617 ?auto_34618 ) ) ( AVAILABLE ?auto_34618 ) ( SURFACE-AT ?auto_34609 ?auto_34614 ) ( ON ?auto_34609 ?auto_34615 ) ( CLEAR ?auto_34609 ) ( not ( = ?auto_34608 ?auto_34615 ) ) ( not ( = ?auto_34609 ?auto_34615 ) ) ( not ( = ?auto_34607 ?auto_34615 ) ) ( SURFACE-AT ?auto_34607 ?auto_34616 ) ( CLEAR ?auto_34607 ) ( IS-CRATE ?auto_34608 ) ( AVAILABLE ?auto_34617 ) ( not ( = ?auto_34612 ?auto_34616 ) ) ( not ( = ?auto_34614 ?auto_34612 ) ) ( HOIST-AT ?auto_34611 ?auto_34612 ) ( not ( = ?auto_34617 ?auto_34611 ) ) ( not ( = ?auto_34618 ?auto_34611 ) ) ( AVAILABLE ?auto_34611 ) ( SURFACE-AT ?auto_34608 ?auto_34612 ) ( ON ?auto_34608 ?auto_34613 ) ( CLEAR ?auto_34608 ) ( not ( = ?auto_34608 ?auto_34613 ) ) ( not ( = ?auto_34609 ?auto_34613 ) ) ( not ( = ?auto_34607 ?auto_34613 ) ) ( not ( = ?auto_34615 ?auto_34613 ) ) ( TRUCK-AT ?auto_34610 ?auto_34616 ) ( ON ?auto_34606 ?auto_34605 ) ( ON ?auto_34607 ?auto_34606 ) ( not ( = ?auto_34605 ?auto_34606 ) ) ( not ( = ?auto_34605 ?auto_34607 ) ) ( not ( = ?auto_34605 ?auto_34608 ) ) ( not ( = ?auto_34605 ?auto_34609 ) ) ( not ( = ?auto_34605 ?auto_34615 ) ) ( not ( = ?auto_34605 ?auto_34613 ) ) ( not ( = ?auto_34606 ?auto_34607 ) ) ( not ( = ?auto_34606 ?auto_34608 ) ) ( not ( = ?auto_34606 ?auto_34609 ) ) ( not ( = ?auto_34606 ?auto_34615 ) ) ( not ( = ?auto_34606 ?auto_34613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34607 ?auto_34608 ?auto_34609 )
      ( MAKE-4CRATE-VERIFY ?auto_34605 ?auto_34606 ?auto_34607 ?auto_34608 ?auto_34609 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34619 - SURFACE
      ?auto_34620 - SURFACE
      ?auto_34621 - SURFACE
      ?auto_34622 - SURFACE
      ?auto_34623 - SURFACE
      ?auto_34624 - SURFACE
    )
    :vars
    (
      ?auto_34632 - HOIST
      ?auto_34631 - PLACE
      ?auto_34629 - PLACE
      ?auto_34633 - HOIST
      ?auto_34630 - SURFACE
      ?auto_34627 - PLACE
      ?auto_34626 - HOIST
      ?auto_34628 - SURFACE
      ?auto_34625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34632 ?auto_34631 ) ( IS-CRATE ?auto_34624 ) ( not ( = ?auto_34623 ?auto_34624 ) ) ( not ( = ?auto_34622 ?auto_34623 ) ) ( not ( = ?auto_34622 ?auto_34624 ) ) ( not ( = ?auto_34629 ?auto_34631 ) ) ( HOIST-AT ?auto_34633 ?auto_34629 ) ( not ( = ?auto_34632 ?auto_34633 ) ) ( AVAILABLE ?auto_34633 ) ( SURFACE-AT ?auto_34624 ?auto_34629 ) ( ON ?auto_34624 ?auto_34630 ) ( CLEAR ?auto_34624 ) ( not ( = ?auto_34623 ?auto_34630 ) ) ( not ( = ?auto_34624 ?auto_34630 ) ) ( not ( = ?auto_34622 ?auto_34630 ) ) ( SURFACE-AT ?auto_34622 ?auto_34631 ) ( CLEAR ?auto_34622 ) ( IS-CRATE ?auto_34623 ) ( AVAILABLE ?auto_34632 ) ( not ( = ?auto_34627 ?auto_34631 ) ) ( not ( = ?auto_34629 ?auto_34627 ) ) ( HOIST-AT ?auto_34626 ?auto_34627 ) ( not ( = ?auto_34632 ?auto_34626 ) ) ( not ( = ?auto_34633 ?auto_34626 ) ) ( AVAILABLE ?auto_34626 ) ( SURFACE-AT ?auto_34623 ?auto_34627 ) ( ON ?auto_34623 ?auto_34628 ) ( CLEAR ?auto_34623 ) ( not ( = ?auto_34623 ?auto_34628 ) ) ( not ( = ?auto_34624 ?auto_34628 ) ) ( not ( = ?auto_34622 ?auto_34628 ) ) ( not ( = ?auto_34630 ?auto_34628 ) ) ( TRUCK-AT ?auto_34625 ?auto_34631 ) ( ON ?auto_34620 ?auto_34619 ) ( ON ?auto_34621 ?auto_34620 ) ( ON ?auto_34622 ?auto_34621 ) ( not ( = ?auto_34619 ?auto_34620 ) ) ( not ( = ?auto_34619 ?auto_34621 ) ) ( not ( = ?auto_34619 ?auto_34622 ) ) ( not ( = ?auto_34619 ?auto_34623 ) ) ( not ( = ?auto_34619 ?auto_34624 ) ) ( not ( = ?auto_34619 ?auto_34630 ) ) ( not ( = ?auto_34619 ?auto_34628 ) ) ( not ( = ?auto_34620 ?auto_34621 ) ) ( not ( = ?auto_34620 ?auto_34622 ) ) ( not ( = ?auto_34620 ?auto_34623 ) ) ( not ( = ?auto_34620 ?auto_34624 ) ) ( not ( = ?auto_34620 ?auto_34630 ) ) ( not ( = ?auto_34620 ?auto_34628 ) ) ( not ( = ?auto_34621 ?auto_34622 ) ) ( not ( = ?auto_34621 ?auto_34623 ) ) ( not ( = ?auto_34621 ?auto_34624 ) ) ( not ( = ?auto_34621 ?auto_34630 ) ) ( not ( = ?auto_34621 ?auto_34628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34622 ?auto_34623 ?auto_34624 )
      ( MAKE-5CRATE-VERIFY ?auto_34619 ?auto_34620 ?auto_34621 ?auto_34622 ?auto_34623 ?auto_34624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34634 - SURFACE
      ?auto_34635 - SURFACE
    )
    :vars
    (
      ?auto_34644 - HOIST
      ?auto_34643 - PLACE
      ?auto_34639 - SURFACE
      ?auto_34641 - PLACE
      ?auto_34645 - HOIST
      ?auto_34642 - SURFACE
      ?auto_34638 - PLACE
      ?auto_34637 - HOIST
      ?auto_34640 - SURFACE
      ?auto_34636 - TRUCK
      ?auto_34646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34644 ?auto_34643 ) ( IS-CRATE ?auto_34635 ) ( not ( = ?auto_34634 ?auto_34635 ) ) ( not ( = ?auto_34639 ?auto_34634 ) ) ( not ( = ?auto_34639 ?auto_34635 ) ) ( not ( = ?auto_34641 ?auto_34643 ) ) ( HOIST-AT ?auto_34645 ?auto_34641 ) ( not ( = ?auto_34644 ?auto_34645 ) ) ( AVAILABLE ?auto_34645 ) ( SURFACE-AT ?auto_34635 ?auto_34641 ) ( ON ?auto_34635 ?auto_34642 ) ( CLEAR ?auto_34635 ) ( not ( = ?auto_34634 ?auto_34642 ) ) ( not ( = ?auto_34635 ?auto_34642 ) ) ( not ( = ?auto_34639 ?auto_34642 ) ) ( IS-CRATE ?auto_34634 ) ( not ( = ?auto_34638 ?auto_34643 ) ) ( not ( = ?auto_34641 ?auto_34638 ) ) ( HOIST-AT ?auto_34637 ?auto_34638 ) ( not ( = ?auto_34644 ?auto_34637 ) ) ( not ( = ?auto_34645 ?auto_34637 ) ) ( AVAILABLE ?auto_34637 ) ( SURFACE-AT ?auto_34634 ?auto_34638 ) ( ON ?auto_34634 ?auto_34640 ) ( CLEAR ?auto_34634 ) ( not ( = ?auto_34634 ?auto_34640 ) ) ( not ( = ?auto_34635 ?auto_34640 ) ) ( not ( = ?auto_34639 ?auto_34640 ) ) ( not ( = ?auto_34642 ?auto_34640 ) ) ( TRUCK-AT ?auto_34636 ?auto_34643 ) ( SURFACE-AT ?auto_34646 ?auto_34643 ) ( CLEAR ?auto_34646 ) ( LIFTING ?auto_34644 ?auto_34639 ) ( IS-CRATE ?auto_34639 ) ( not ( = ?auto_34646 ?auto_34639 ) ) ( not ( = ?auto_34634 ?auto_34646 ) ) ( not ( = ?auto_34635 ?auto_34646 ) ) ( not ( = ?auto_34642 ?auto_34646 ) ) ( not ( = ?auto_34640 ?auto_34646 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34646 ?auto_34639 )
      ( MAKE-2CRATE ?auto_34639 ?auto_34634 ?auto_34635 )
      ( MAKE-1CRATE-VERIFY ?auto_34634 ?auto_34635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34647 - SURFACE
      ?auto_34648 - SURFACE
      ?auto_34649 - SURFACE
    )
    :vars
    (
      ?auto_34651 - HOIST
      ?auto_34654 - PLACE
      ?auto_34655 - PLACE
      ?auto_34657 - HOIST
      ?auto_34653 - SURFACE
      ?auto_34652 - PLACE
      ?auto_34650 - HOIST
      ?auto_34656 - SURFACE
      ?auto_34658 - TRUCK
      ?auto_34659 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34651 ?auto_34654 ) ( IS-CRATE ?auto_34649 ) ( not ( = ?auto_34648 ?auto_34649 ) ) ( not ( = ?auto_34647 ?auto_34648 ) ) ( not ( = ?auto_34647 ?auto_34649 ) ) ( not ( = ?auto_34655 ?auto_34654 ) ) ( HOIST-AT ?auto_34657 ?auto_34655 ) ( not ( = ?auto_34651 ?auto_34657 ) ) ( AVAILABLE ?auto_34657 ) ( SURFACE-AT ?auto_34649 ?auto_34655 ) ( ON ?auto_34649 ?auto_34653 ) ( CLEAR ?auto_34649 ) ( not ( = ?auto_34648 ?auto_34653 ) ) ( not ( = ?auto_34649 ?auto_34653 ) ) ( not ( = ?auto_34647 ?auto_34653 ) ) ( IS-CRATE ?auto_34648 ) ( not ( = ?auto_34652 ?auto_34654 ) ) ( not ( = ?auto_34655 ?auto_34652 ) ) ( HOIST-AT ?auto_34650 ?auto_34652 ) ( not ( = ?auto_34651 ?auto_34650 ) ) ( not ( = ?auto_34657 ?auto_34650 ) ) ( AVAILABLE ?auto_34650 ) ( SURFACE-AT ?auto_34648 ?auto_34652 ) ( ON ?auto_34648 ?auto_34656 ) ( CLEAR ?auto_34648 ) ( not ( = ?auto_34648 ?auto_34656 ) ) ( not ( = ?auto_34649 ?auto_34656 ) ) ( not ( = ?auto_34647 ?auto_34656 ) ) ( not ( = ?auto_34653 ?auto_34656 ) ) ( TRUCK-AT ?auto_34658 ?auto_34654 ) ( SURFACE-AT ?auto_34659 ?auto_34654 ) ( CLEAR ?auto_34659 ) ( LIFTING ?auto_34651 ?auto_34647 ) ( IS-CRATE ?auto_34647 ) ( not ( = ?auto_34659 ?auto_34647 ) ) ( not ( = ?auto_34648 ?auto_34659 ) ) ( not ( = ?auto_34649 ?auto_34659 ) ) ( not ( = ?auto_34653 ?auto_34659 ) ) ( not ( = ?auto_34656 ?auto_34659 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34648 ?auto_34649 )
      ( MAKE-2CRATE-VERIFY ?auto_34647 ?auto_34648 ?auto_34649 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34660 - SURFACE
      ?auto_34661 - SURFACE
      ?auto_34662 - SURFACE
      ?auto_34663 - SURFACE
    )
    :vars
    (
      ?auto_34671 - HOIST
      ?auto_34668 - PLACE
      ?auto_34666 - PLACE
      ?auto_34664 - HOIST
      ?auto_34670 - SURFACE
      ?auto_34672 - PLACE
      ?auto_34669 - HOIST
      ?auto_34667 - SURFACE
      ?auto_34665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34671 ?auto_34668 ) ( IS-CRATE ?auto_34663 ) ( not ( = ?auto_34662 ?auto_34663 ) ) ( not ( = ?auto_34661 ?auto_34662 ) ) ( not ( = ?auto_34661 ?auto_34663 ) ) ( not ( = ?auto_34666 ?auto_34668 ) ) ( HOIST-AT ?auto_34664 ?auto_34666 ) ( not ( = ?auto_34671 ?auto_34664 ) ) ( AVAILABLE ?auto_34664 ) ( SURFACE-AT ?auto_34663 ?auto_34666 ) ( ON ?auto_34663 ?auto_34670 ) ( CLEAR ?auto_34663 ) ( not ( = ?auto_34662 ?auto_34670 ) ) ( not ( = ?auto_34663 ?auto_34670 ) ) ( not ( = ?auto_34661 ?auto_34670 ) ) ( IS-CRATE ?auto_34662 ) ( not ( = ?auto_34672 ?auto_34668 ) ) ( not ( = ?auto_34666 ?auto_34672 ) ) ( HOIST-AT ?auto_34669 ?auto_34672 ) ( not ( = ?auto_34671 ?auto_34669 ) ) ( not ( = ?auto_34664 ?auto_34669 ) ) ( AVAILABLE ?auto_34669 ) ( SURFACE-AT ?auto_34662 ?auto_34672 ) ( ON ?auto_34662 ?auto_34667 ) ( CLEAR ?auto_34662 ) ( not ( = ?auto_34662 ?auto_34667 ) ) ( not ( = ?auto_34663 ?auto_34667 ) ) ( not ( = ?auto_34661 ?auto_34667 ) ) ( not ( = ?auto_34670 ?auto_34667 ) ) ( TRUCK-AT ?auto_34665 ?auto_34668 ) ( SURFACE-AT ?auto_34660 ?auto_34668 ) ( CLEAR ?auto_34660 ) ( LIFTING ?auto_34671 ?auto_34661 ) ( IS-CRATE ?auto_34661 ) ( not ( = ?auto_34660 ?auto_34661 ) ) ( not ( = ?auto_34662 ?auto_34660 ) ) ( not ( = ?auto_34663 ?auto_34660 ) ) ( not ( = ?auto_34670 ?auto_34660 ) ) ( not ( = ?auto_34667 ?auto_34660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34661 ?auto_34662 ?auto_34663 )
      ( MAKE-3CRATE-VERIFY ?auto_34660 ?auto_34661 ?auto_34662 ?auto_34663 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34673 - SURFACE
      ?auto_34674 - SURFACE
      ?auto_34675 - SURFACE
      ?auto_34676 - SURFACE
      ?auto_34677 - SURFACE
    )
    :vars
    (
      ?auto_34685 - HOIST
      ?auto_34682 - PLACE
      ?auto_34680 - PLACE
      ?auto_34678 - HOIST
      ?auto_34684 - SURFACE
      ?auto_34686 - PLACE
      ?auto_34683 - HOIST
      ?auto_34681 - SURFACE
      ?auto_34679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34685 ?auto_34682 ) ( IS-CRATE ?auto_34677 ) ( not ( = ?auto_34676 ?auto_34677 ) ) ( not ( = ?auto_34675 ?auto_34676 ) ) ( not ( = ?auto_34675 ?auto_34677 ) ) ( not ( = ?auto_34680 ?auto_34682 ) ) ( HOIST-AT ?auto_34678 ?auto_34680 ) ( not ( = ?auto_34685 ?auto_34678 ) ) ( AVAILABLE ?auto_34678 ) ( SURFACE-AT ?auto_34677 ?auto_34680 ) ( ON ?auto_34677 ?auto_34684 ) ( CLEAR ?auto_34677 ) ( not ( = ?auto_34676 ?auto_34684 ) ) ( not ( = ?auto_34677 ?auto_34684 ) ) ( not ( = ?auto_34675 ?auto_34684 ) ) ( IS-CRATE ?auto_34676 ) ( not ( = ?auto_34686 ?auto_34682 ) ) ( not ( = ?auto_34680 ?auto_34686 ) ) ( HOIST-AT ?auto_34683 ?auto_34686 ) ( not ( = ?auto_34685 ?auto_34683 ) ) ( not ( = ?auto_34678 ?auto_34683 ) ) ( AVAILABLE ?auto_34683 ) ( SURFACE-AT ?auto_34676 ?auto_34686 ) ( ON ?auto_34676 ?auto_34681 ) ( CLEAR ?auto_34676 ) ( not ( = ?auto_34676 ?auto_34681 ) ) ( not ( = ?auto_34677 ?auto_34681 ) ) ( not ( = ?auto_34675 ?auto_34681 ) ) ( not ( = ?auto_34684 ?auto_34681 ) ) ( TRUCK-AT ?auto_34679 ?auto_34682 ) ( SURFACE-AT ?auto_34674 ?auto_34682 ) ( CLEAR ?auto_34674 ) ( LIFTING ?auto_34685 ?auto_34675 ) ( IS-CRATE ?auto_34675 ) ( not ( = ?auto_34674 ?auto_34675 ) ) ( not ( = ?auto_34676 ?auto_34674 ) ) ( not ( = ?auto_34677 ?auto_34674 ) ) ( not ( = ?auto_34684 ?auto_34674 ) ) ( not ( = ?auto_34681 ?auto_34674 ) ) ( ON ?auto_34674 ?auto_34673 ) ( not ( = ?auto_34673 ?auto_34674 ) ) ( not ( = ?auto_34673 ?auto_34675 ) ) ( not ( = ?auto_34673 ?auto_34676 ) ) ( not ( = ?auto_34673 ?auto_34677 ) ) ( not ( = ?auto_34673 ?auto_34684 ) ) ( not ( = ?auto_34673 ?auto_34681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34675 ?auto_34676 ?auto_34677 )
      ( MAKE-4CRATE-VERIFY ?auto_34673 ?auto_34674 ?auto_34675 ?auto_34676 ?auto_34677 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34687 - SURFACE
      ?auto_34688 - SURFACE
      ?auto_34689 - SURFACE
      ?auto_34690 - SURFACE
      ?auto_34691 - SURFACE
      ?auto_34692 - SURFACE
    )
    :vars
    (
      ?auto_34700 - HOIST
      ?auto_34697 - PLACE
      ?auto_34695 - PLACE
      ?auto_34693 - HOIST
      ?auto_34699 - SURFACE
      ?auto_34701 - PLACE
      ?auto_34698 - HOIST
      ?auto_34696 - SURFACE
      ?auto_34694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34700 ?auto_34697 ) ( IS-CRATE ?auto_34692 ) ( not ( = ?auto_34691 ?auto_34692 ) ) ( not ( = ?auto_34690 ?auto_34691 ) ) ( not ( = ?auto_34690 ?auto_34692 ) ) ( not ( = ?auto_34695 ?auto_34697 ) ) ( HOIST-AT ?auto_34693 ?auto_34695 ) ( not ( = ?auto_34700 ?auto_34693 ) ) ( AVAILABLE ?auto_34693 ) ( SURFACE-AT ?auto_34692 ?auto_34695 ) ( ON ?auto_34692 ?auto_34699 ) ( CLEAR ?auto_34692 ) ( not ( = ?auto_34691 ?auto_34699 ) ) ( not ( = ?auto_34692 ?auto_34699 ) ) ( not ( = ?auto_34690 ?auto_34699 ) ) ( IS-CRATE ?auto_34691 ) ( not ( = ?auto_34701 ?auto_34697 ) ) ( not ( = ?auto_34695 ?auto_34701 ) ) ( HOIST-AT ?auto_34698 ?auto_34701 ) ( not ( = ?auto_34700 ?auto_34698 ) ) ( not ( = ?auto_34693 ?auto_34698 ) ) ( AVAILABLE ?auto_34698 ) ( SURFACE-AT ?auto_34691 ?auto_34701 ) ( ON ?auto_34691 ?auto_34696 ) ( CLEAR ?auto_34691 ) ( not ( = ?auto_34691 ?auto_34696 ) ) ( not ( = ?auto_34692 ?auto_34696 ) ) ( not ( = ?auto_34690 ?auto_34696 ) ) ( not ( = ?auto_34699 ?auto_34696 ) ) ( TRUCK-AT ?auto_34694 ?auto_34697 ) ( SURFACE-AT ?auto_34689 ?auto_34697 ) ( CLEAR ?auto_34689 ) ( LIFTING ?auto_34700 ?auto_34690 ) ( IS-CRATE ?auto_34690 ) ( not ( = ?auto_34689 ?auto_34690 ) ) ( not ( = ?auto_34691 ?auto_34689 ) ) ( not ( = ?auto_34692 ?auto_34689 ) ) ( not ( = ?auto_34699 ?auto_34689 ) ) ( not ( = ?auto_34696 ?auto_34689 ) ) ( ON ?auto_34688 ?auto_34687 ) ( ON ?auto_34689 ?auto_34688 ) ( not ( = ?auto_34687 ?auto_34688 ) ) ( not ( = ?auto_34687 ?auto_34689 ) ) ( not ( = ?auto_34687 ?auto_34690 ) ) ( not ( = ?auto_34687 ?auto_34691 ) ) ( not ( = ?auto_34687 ?auto_34692 ) ) ( not ( = ?auto_34687 ?auto_34699 ) ) ( not ( = ?auto_34687 ?auto_34696 ) ) ( not ( = ?auto_34688 ?auto_34689 ) ) ( not ( = ?auto_34688 ?auto_34690 ) ) ( not ( = ?auto_34688 ?auto_34691 ) ) ( not ( = ?auto_34688 ?auto_34692 ) ) ( not ( = ?auto_34688 ?auto_34699 ) ) ( not ( = ?auto_34688 ?auto_34696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34690 ?auto_34691 ?auto_34692 )
      ( MAKE-5CRATE-VERIFY ?auto_34687 ?auto_34688 ?auto_34689 ?auto_34690 ?auto_34691 ?auto_34692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34702 - SURFACE
      ?auto_34703 - SURFACE
    )
    :vars
    (
      ?auto_34713 - HOIST
      ?auto_34710 - PLACE
      ?auto_34704 - SURFACE
      ?auto_34708 - PLACE
      ?auto_34706 - HOIST
      ?auto_34712 - SURFACE
      ?auto_34714 - PLACE
      ?auto_34711 - HOIST
      ?auto_34709 - SURFACE
      ?auto_34707 - TRUCK
      ?auto_34705 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34713 ?auto_34710 ) ( IS-CRATE ?auto_34703 ) ( not ( = ?auto_34702 ?auto_34703 ) ) ( not ( = ?auto_34704 ?auto_34702 ) ) ( not ( = ?auto_34704 ?auto_34703 ) ) ( not ( = ?auto_34708 ?auto_34710 ) ) ( HOIST-AT ?auto_34706 ?auto_34708 ) ( not ( = ?auto_34713 ?auto_34706 ) ) ( AVAILABLE ?auto_34706 ) ( SURFACE-AT ?auto_34703 ?auto_34708 ) ( ON ?auto_34703 ?auto_34712 ) ( CLEAR ?auto_34703 ) ( not ( = ?auto_34702 ?auto_34712 ) ) ( not ( = ?auto_34703 ?auto_34712 ) ) ( not ( = ?auto_34704 ?auto_34712 ) ) ( IS-CRATE ?auto_34702 ) ( not ( = ?auto_34714 ?auto_34710 ) ) ( not ( = ?auto_34708 ?auto_34714 ) ) ( HOIST-AT ?auto_34711 ?auto_34714 ) ( not ( = ?auto_34713 ?auto_34711 ) ) ( not ( = ?auto_34706 ?auto_34711 ) ) ( AVAILABLE ?auto_34711 ) ( SURFACE-AT ?auto_34702 ?auto_34714 ) ( ON ?auto_34702 ?auto_34709 ) ( CLEAR ?auto_34702 ) ( not ( = ?auto_34702 ?auto_34709 ) ) ( not ( = ?auto_34703 ?auto_34709 ) ) ( not ( = ?auto_34704 ?auto_34709 ) ) ( not ( = ?auto_34712 ?auto_34709 ) ) ( TRUCK-AT ?auto_34707 ?auto_34710 ) ( SURFACE-AT ?auto_34705 ?auto_34710 ) ( CLEAR ?auto_34705 ) ( IS-CRATE ?auto_34704 ) ( not ( = ?auto_34705 ?auto_34704 ) ) ( not ( = ?auto_34702 ?auto_34705 ) ) ( not ( = ?auto_34703 ?auto_34705 ) ) ( not ( = ?auto_34712 ?auto_34705 ) ) ( not ( = ?auto_34709 ?auto_34705 ) ) ( AVAILABLE ?auto_34713 ) ( IN ?auto_34704 ?auto_34707 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34713 ?auto_34704 ?auto_34707 ?auto_34710 )
      ( MAKE-2CRATE ?auto_34704 ?auto_34702 ?auto_34703 )
      ( MAKE-1CRATE-VERIFY ?auto_34702 ?auto_34703 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34715 - SURFACE
      ?auto_34716 - SURFACE
      ?auto_34717 - SURFACE
    )
    :vars
    (
      ?auto_34722 - HOIST
      ?auto_34721 - PLACE
      ?auto_34725 - PLACE
      ?auto_34726 - HOIST
      ?auto_34720 - SURFACE
      ?auto_34727 - PLACE
      ?auto_34719 - HOIST
      ?auto_34723 - SURFACE
      ?auto_34718 - TRUCK
      ?auto_34724 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34722 ?auto_34721 ) ( IS-CRATE ?auto_34717 ) ( not ( = ?auto_34716 ?auto_34717 ) ) ( not ( = ?auto_34715 ?auto_34716 ) ) ( not ( = ?auto_34715 ?auto_34717 ) ) ( not ( = ?auto_34725 ?auto_34721 ) ) ( HOIST-AT ?auto_34726 ?auto_34725 ) ( not ( = ?auto_34722 ?auto_34726 ) ) ( AVAILABLE ?auto_34726 ) ( SURFACE-AT ?auto_34717 ?auto_34725 ) ( ON ?auto_34717 ?auto_34720 ) ( CLEAR ?auto_34717 ) ( not ( = ?auto_34716 ?auto_34720 ) ) ( not ( = ?auto_34717 ?auto_34720 ) ) ( not ( = ?auto_34715 ?auto_34720 ) ) ( IS-CRATE ?auto_34716 ) ( not ( = ?auto_34727 ?auto_34721 ) ) ( not ( = ?auto_34725 ?auto_34727 ) ) ( HOIST-AT ?auto_34719 ?auto_34727 ) ( not ( = ?auto_34722 ?auto_34719 ) ) ( not ( = ?auto_34726 ?auto_34719 ) ) ( AVAILABLE ?auto_34719 ) ( SURFACE-AT ?auto_34716 ?auto_34727 ) ( ON ?auto_34716 ?auto_34723 ) ( CLEAR ?auto_34716 ) ( not ( = ?auto_34716 ?auto_34723 ) ) ( not ( = ?auto_34717 ?auto_34723 ) ) ( not ( = ?auto_34715 ?auto_34723 ) ) ( not ( = ?auto_34720 ?auto_34723 ) ) ( TRUCK-AT ?auto_34718 ?auto_34721 ) ( SURFACE-AT ?auto_34724 ?auto_34721 ) ( CLEAR ?auto_34724 ) ( IS-CRATE ?auto_34715 ) ( not ( = ?auto_34724 ?auto_34715 ) ) ( not ( = ?auto_34716 ?auto_34724 ) ) ( not ( = ?auto_34717 ?auto_34724 ) ) ( not ( = ?auto_34720 ?auto_34724 ) ) ( not ( = ?auto_34723 ?auto_34724 ) ) ( AVAILABLE ?auto_34722 ) ( IN ?auto_34715 ?auto_34718 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34716 ?auto_34717 )
      ( MAKE-2CRATE-VERIFY ?auto_34715 ?auto_34716 ?auto_34717 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34728 - SURFACE
      ?auto_34729 - SURFACE
      ?auto_34730 - SURFACE
      ?auto_34731 - SURFACE
    )
    :vars
    (
      ?auto_34735 - HOIST
      ?auto_34736 - PLACE
      ?auto_34738 - PLACE
      ?auto_34732 - HOIST
      ?auto_34734 - SURFACE
      ?auto_34733 - PLACE
      ?auto_34740 - HOIST
      ?auto_34737 - SURFACE
      ?auto_34739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34735 ?auto_34736 ) ( IS-CRATE ?auto_34731 ) ( not ( = ?auto_34730 ?auto_34731 ) ) ( not ( = ?auto_34729 ?auto_34730 ) ) ( not ( = ?auto_34729 ?auto_34731 ) ) ( not ( = ?auto_34738 ?auto_34736 ) ) ( HOIST-AT ?auto_34732 ?auto_34738 ) ( not ( = ?auto_34735 ?auto_34732 ) ) ( AVAILABLE ?auto_34732 ) ( SURFACE-AT ?auto_34731 ?auto_34738 ) ( ON ?auto_34731 ?auto_34734 ) ( CLEAR ?auto_34731 ) ( not ( = ?auto_34730 ?auto_34734 ) ) ( not ( = ?auto_34731 ?auto_34734 ) ) ( not ( = ?auto_34729 ?auto_34734 ) ) ( IS-CRATE ?auto_34730 ) ( not ( = ?auto_34733 ?auto_34736 ) ) ( not ( = ?auto_34738 ?auto_34733 ) ) ( HOIST-AT ?auto_34740 ?auto_34733 ) ( not ( = ?auto_34735 ?auto_34740 ) ) ( not ( = ?auto_34732 ?auto_34740 ) ) ( AVAILABLE ?auto_34740 ) ( SURFACE-AT ?auto_34730 ?auto_34733 ) ( ON ?auto_34730 ?auto_34737 ) ( CLEAR ?auto_34730 ) ( not ( = ?auto_34730 ?auto_34737 ) ) ( not ( = ?auto_34731 ?auto_34737 ) ) ( not ( = ?auto_34729 ?auto_34737 ) ) ( not ( = ?auto_34734 ?auto_34737 ) ) ( TRUCK-AT ?auto_34739 ?auto_34736 ) ( SURFACE-AT ?auto_34728 ?auto_34736 ) ( CLEAR ?auto_34728 ) ( IS-CRATE ?auto_34729 ) ( not ( = ?auto_34728 ?auto_34729 ) ) ( not ( = ?auto_34730 ?auto_34728 ) ) ( not ( = ?auto_34731 ?auto_34728 ) ) ( not ( = ?auto_34734 ?auto_34728 ) ) ( not ( = ?auto_34737 ?auto_34728 ) ) ( AVAILABLE ?auto_34735 ) ( IN ?auto_34729 ?auto_34739 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34729 ?auto_34730 ?auto_34731 )
      ( MAKE-3CRATE-VERIFY ?auto_34728 ?auto_34729 ?auto_34730 ?auto_34731 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34741 - SURFACE
      ?auto_34742 - SURFACE
      ?auto_34743 - SURFACE
      ?auto_34744 - SURFACE
      ?auto_34745 - SURFACE
    )
    :vars
    (
      ?auto_34749 - HOIST
      ?auto_34750 - PLACE
      ?auto_34752 - PLACE
      ?auto_34746 - HOIST
      ?auto_34748 - SURFACE
      ?auto_34747 - PLACE
      ?auto_34754 - HOIST
      ?auto_34751 - SURFACE
      ?auto_34753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34749 ?auto_34750 ) ( IS-CRATE ?auto_34745 ) ( not ( = ?auto_34744 ?auto_34745 ) ) ( not ( = ?auto_34743 ?auto_34744 ) ) ( not ( = ?auto_34743 ?auto_34745 ) ) ( not ( = ?auto_34752 ?auto_34750 ) ) ( HOIST-AT ?auto_34746 ?auto_34752 ) ( not ( = ?auto_34749 ?auto_34746 ) ) ( AVAILABLE ?auto_34746 ) ( SURFACE-AT ?auto_34745 ?auto_34752 ) ( ON ?auto_34745 ?auto_34748 ) ( CLEAR ?auto_34745 ) ( not ( = ?auto_34744 ?auto_34748 ) ) ( not ( = ?auto_34745 ?auto_34748 ) ) ( not ( = ?auto_34743 ?auto_34748 ) ) ( IS-CRATE ?auto_34744 ) ( not ( = ?auto_34747 ?auto_34750 ) ) ( not ( = ?auto_34752 ?auto_34747 ) ) ( HOIST-AT ?auto_34754 ?auto_34747 ) ( not ( = ?auto_34749 ?auto_34754 ) ) ( not ( = ?auto_34746 ?auto_34754 ) ) ( AVAILABLE ?auto_34754 ) ( SURFACE-AT ?auto_34744 ?auto_34747 ) ( ON ?auto_34744 ?auto_34751 ) ( CLEAR ?auto_34744 ) ( not ( = ?auto_34744 ?auto_34751 ) ) ( not ( = ?auto_34745 ?auto_34751 ) ) ( not ( = ?auto_34743 ?auto_34751 ) ) ( not ( = ?auto_34748 ?auto_34751 ) ) ( TRUCK-AT ?auto_34753 ?auto_34750 ) ( SURFACE-AT ?auto_34742 ?auto_34750 ) ( CLEAR ?auto_34742 ) ( IS-CRATE ?auto_34743 ) ( not ( = ?auto_34742 ?auto_34743 ) ) ( not ( = ?auto_34744 ?auto_34742 ) ) ( not ( = ?auto_34745 ?auto_34742 ) ) ( not ( = ?auto_34748 ?auto_34742 ) ) ( not ( = ?auto_34751 ?auto_34742 ) ) ( AVAILABLE ?auto_34749 ) ( IN ?auto_34743 ?auto_34753 ) ( ON ?auto_34742 ?auto_34741 ) ( not ( = ?auto_34741 ?auto_34742 ) ) ( not ( = ?auto_34741 ?auto_34743 ) ) ( not ( = ?auto_34741 ?auto_34744 ) ) ( not ( = ?auto_34741 ?auto_34745 ) ) ( not ( = ?auto_34741 ?auto_34748 ) ) ( not ( = ?auto_34741 ?auto_34751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34743 ?auto_34744 ?auto_34745 )
      ( MAKE-4CRATE-VERIFY ?auto_34741 ?auto_34742 ?auto_34743 ?auto_34744 ?auto_34745 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34755 - SURFACE
      ?auto_34756 - SURFACE
      ?auto_34757 - SURFACE
      ?auto_34758 - SURFACE
      ?auto_34759 - SURFACE
      ?auto_34760 - SURFACE
    )
    :vars
    (
      ?auto_34764 - HOIST
      ?auto_34765 - PLACE
      ?auto_34767 - PLACE
      ?auto_34761 - HOIST
      ?auto_34763 - SURFACE
      ?auto_34762 - PLACE
      ?auto_34769 - HOIST
      ?auto_34766 - SURFACE
      ?auto_34768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34764 ?auto_34765 ) ( IS-CRATE ?auto_34760 ) ( not ( = ?auto_34759 ?auto_34760 ) ) ( not ( = ?auto_34758 ?auto_34759 ) ) ( not ( = ?auto_34758 ?auto_34760 ) ) ( not ( = ?auto_34767 ?auto_34765 ) ) ( HOIST-AT ?auto_34761 ?auto_34767 ) ( not ( = ?auto_34764 ?auto_34761 ) ) ( AVAILABLE ?auto_34761 ) ( SURFACE-AT ?auto_34760 ?auto_34767 ) ( ON ?auto_34760 ?auto_34763 ) ( CLEAR ?auto_34760 ) ( not ( = ?auto_34759 ?auto_34763 ) ) ( not ( = ?auto_34760 ?auto_34763 ) ) ( not ( = ?auto_34758 ?auto_34763 ) ) ( IS-CRATE ?auto_34759 ) ( not ( = ?auto_34762 ?auto_34765 ) ) ( not ( = ?auto_34767 ?auto_34762 ) ) ( HOIST-AT ?auto_34769 ?auto_34762 ) ( not ( = ?auto_34764 ?auto_34769 ) ) ( not ( = ?auto_34761 ?auto_34769 ) ) ( AVAILABLE ?auto_34769 ) ( SURFACE-AT ?auto_34759 ?auto_34762 ) ( ON ?auto_34759 ?auto_34766 ) ( CLEAR ?auto_34759 ) ( not ( = ?auto_34759 ?auto_34766 ) ) ( not ( = ?auto_34760 ?auto_34766 ) ) ( not ( = ?auto_34758 ?auto_34766 ) ) ( not ( = ?auto_34763 ?auto_34766 ) ) ( TRUCK-AT ?auto_34768 ?auto_34765 ) ( SURFACE-AT ?auto_34757 ?auto_34765 ) ( CLEAR ?auto_34757 ) ( IS-CRATE ?auto_34758 ) ( not ( = ?auto_34757 ?auto_34758 ) ) ( not ( = ?auto_34759 ?auto_34757 ) ) ( not ( = ?auto_34760 ?auto_34757 ) ) ( not ( = ?auto_34763 ?auto_34757 ) ) ( not ( = ?auto_34766 ?auto_34757 ) ) ( AVAILABLE ?auto_34764 ) ( IN ?auto_34758 ?auto_34768 ) ( ON ?auto_34756 ?auto_34755 ) ( ON ?auto_34757 ?auto_34756 ) ( not ( = ?auto_34755 ?auto_34756 ) ) ( not ( = ?auto_34755 ?auto_34757 ) ) ( not ( = ?auto_34755 ?auto_34758 ) ) ( not ( = ?auto_34755 ?auto_34759 ) ) ( not ( = ?auto_34755 ?auto_34760 ) ) ( not ( = ?auto_34755 ?auto_34763 ) ) ( not ( = ?auto_34755 ?auto_34766 ) ) ( not ( = ?auto_34756 ?auto_34757 ) ) ( not ( = ?auto_34756 ?auto_34758 ) ) ( not ( = ?auto_34756 ?auto_34759 ) ) ( not ( = ?auto_34756 ?auto_34760 ) ) ( not ( = ?auto_34756 ?auto_34763 ) ) ( not ( = ?auto_34756 ?auto_34766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34758 ?auto_34759 ?auto_34760 )
      ( MAKE-5CRATE-VERIFY ?auto_34755 ?auto_34756 ?auto_34757 ?auto_34758 ?auto_34759 ?auto_34760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34770 - SURFACE
      ?auto_34771 - SURFACE
    )
    :vars
    (
      ?auto_34777 - HOIST
      ?auto_34778 - PLACE
      ?auto_34773 - SURFACE
      ?auto_34780 - PLACE
      ?auto_34774 - HOIST
      ?auto_34776 - SURFACE
      ?auto_34775 - PLACE
      ?auto_34782 - HOIST
      ?auto_34779 - SURFACE
      ?auto_34772 - SURFACE
      ?auto_34781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34777 ?auto_34778 ) ( IS-CRATE ?auto_34771 ) ( not ( = ?auto_34770 ?auto_34771 ) ) ( not ( = ?auto_34773 ?auto_34770 ) ) ( not ( = ?auto_34773 ?auto_34771 ) ) ( not ( = ?auto_34780 ?auto_34778 ) ) ( HOIST-AT ?auto_34774 ?auto_34780 ) ( not ( = ?auto_34777 ?auto_34774 ) ) ( AVAILABLE ?auto_34774 ) ( SURFACE-AT ?auto_34771 ?auto_34780 ) ( ON ?auto_34771 ?auto_34776 ) ( CLEAR ?auto_34771 ) ( not ( = ?auto_34770 ?auto_34776 ) ) ( not ( = ?auto_34771 ?auto_34776 ) ) ( not ( = ?auto_34773 ?auto_34776 ) ) ( IS-CRATE ?auto_34770 ) ( not ( = ?auto_34775 ?auto_34778 ) ) ( not ( = ?auto_34780 ?auto_34775 ) ) ( HOIST-AT ?auto_34782 ?auto_34775 ) ( not ( = ?auto_34777 ?auto_34782 ) ) ( not ( = ?auto_34774 ?auto_34782 ) ) ( AVAILABLE ?auto_34782 ) ( SURFACE-AT ?auto_34770 ?auto_34775 ) ( ON ?auto_34770 ?auto_34779 ) ( CLEAR ?auto_34770 ) ( not ( = ?auto_34770 ?auto_34779 ) ) ( not ( = ?auto_34771 ?auto_34779 ) ) ( not ( = ?auto_34773 ?auto_34779 ) ) ( not ( = ?auto_34776 ?auto_34779 ) ) ( SURFACE-AT ?auto_34772 ?auto_34778 ) ( CLEAR ?auto_34772 ) ( IS-CRATE ?auto_34773 ) ( not ( = ?auto_34772 ?auto_34773 ) ) ( not ( = ?auto_34770 ?auto_34772 ) ) ( not ( = ?auto_34771 ?auto_34772 ) ) ( not ( = ?auto_34776 ?auto_34772 ) ) ( not ( = ?auto_34779 ?auto_34772 ) ) ( AVAILABLE ?auto_34777 ) ( IN ?auto_34773 ?auto_34781 ) ( TRUCK-AT ?auto_34781 ?auto_34780 ) )
    :subtasks
    ( ( !DRIVE ?auto_34781 ?auto_34780 ?auto_34778 )
      ( MAKE-2CRATE ?auto_34773 ?auto_34770 ?auto_34771 )
      ( MAKE-1CRATE-VERIFY ?auto_34770 ?auto_34771 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34783 - SURFACE
      ?auto_34784 - SURFACE
      ?auto_34785 - SURFACE
    )
    :vars
    (
      ?auto_34789 - HOIST
      ?auto_34786 - PLACE
      ?auto_34791 - PLACE
      ?auto_34788 - HOIST
      ?auto_34790 - SURFACE
      ?auto_34787 - PLACE
      ?auto_34792 - HOIST
      ?auto_34795 - SURFACE
      ?auto_34793 - SURFACE
      ?auto_34794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34789 ?auto_34786 ) ( IS-CRATE ?auto_34785 ) ( not ( = ?auto_34784 ?auto_34785 ) ) ( not ( = ?auto_34783 ?auto_34784 ) ) ( not ( = ?auto_34783 ?auto_34785 ) ) ( not ( = ?auto_34791 ?auto_34786 ) ) ( HOIST-AT ?auto_34788 ?auto_34791 ) ( not ( = ?auto_34789 ?auto_34788 ) ) ( AVAILABLE ?auto_34788 ) ( SURFACE-AT ?auto_34785 ?auto_34791 ) ( ON ?auto_34785 ?auto_34790 ) ( CLEAR ?auto_34785 ) ( not ( = ?auto_34784 ?auto_34790 ) ) ( not ( = ?auto_34785 ?auto_34790 ) ) ( not ( = ?auto_34783 ?auto_34790 ) ) ( IS-CRATE ?auto_34784 ) ( not ( = ?auto_34787 ?auto_34786 ) ) ( not ( = ?auto_34791 ?auto_34787 ) ) ( HOIST-AT ?auto_34792 ?auto_34787 ) ( not ( = ?auto_34789 ?auto_34792 ) ) ( not ( = ?auto_34788 ?auto_34792 ) ) ( AVAILABLE ?auto_34792 ) ( SURFACE-AT ?auto_34784 ?auto_34787 ) ( ON ?auto_34784 ?auto_34795 ) ( CLEAR ?auto_34784 ) ( not ( = ?auto_34784 ?auto_34795 ) ) ( not ( = ?auto_34785 ?auto_34795 ) ) ( not ( = ?auto_34783 ?auto_34795 ) ) ( not ( = ?auto_34790 ?auto_34795 ) ) ( SURFACE-AT ?auto_34793 ?auto_34786 ) ( CLEAR ?auto_34793 ) ( IS-CRATE ?auto_34783 ) ( not ( = ?auto_34793 ?auto_34783 ) ) ( not ( = ?auto_34784 ?auto_34793 ) ) ( not ( = ?auto_34785 ?auto_34793 ) ) ( not ( = ?auto_34790 ?auto_34793 ) ) ( not ( = ?auto_34795 ?auto_34793 ) ) ( AVAILABLE ?auto_34789 ) ( IN ?auto_34783 ?auto_34794 ) ( TRUCK-AT ?auto_34794 ?auto_34791 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34784 ?auto_34785 )
      ( MAKE-2CRATE-VERIFY ?auto_34783 ?auto_34784 ?auto_34785 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34796 - SURFACE
      ?auto_34797 - SURFACE
      ?auto_34798 - SURFACE
      ?auto_34799 - SURFACE
    )
    :vars
    (
      ?auto_34800 - HOIST
      ?auto_34802 - PLACE
      ?auto_34804 - PLACE
      ?auto_34808 - HOIST
      ?auto_34805 - SURFACE
      ?auto_34803 - PLACE
      ?auto_34806 - HOIST
      ?auto_34807 - SURFACE
      ?auto_34801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34800 ?auto_34802 ) ( IS-CRATE ?auto_34799 ) ( not ( = ?auto_34798 ?auto_34799 ) ) ( not ( = ?auto_34797 ?auto_34798 ) ) ( not ( = ?auto_34797 ?auto_34799 ) ) ( not ( = ?auto_34804 ?auto_34802 ) ) ( HOIST-AT ?auto_34808 ?auto_34804 ) ( not ( = ?auto_34800 ?auto_34808 ) ) ( AVAILABLE ?auto_34808 ) ( SURFACE-AT ?auto_34799 ?auto_34804 ) ( ON ?auto_34799 ?auto_34805 ) ( CLEAR ?auto_34799 ) ( not ( = ?auto_34798 ?auto_34805 ) ) ( not ( = ?auto_34799 ?auto_34805 ) ) ( not ( = ?auto_34797 ?auto_34805 ) ) ( IS-CRATE ?auto_34798 ) ( not ( = ?auto_34803 ?auto_34802 ) ) ( not ( = ?auto_34804 ?auto_34803 ) ) ( HOIST-AT ?auto_34806 ?auto_34803 ) ( not ( = ?auto_34800 ?auto_34806 ) ) ( not ( = ?auto_34808 ?auto_34806 ) ) ( AVAILABLE ?auto_34806 ) ( SURFACE-AT ?auto_34798 ?auto_34803 ) ( ON ?auto_34798 ?auto_34807 ) ( CLEAR ?auto_34798 ) ( not ( = ?auto_34798 ?auto_34807 ) ) ( not ( = ?auto_34799 ?auto_34807 ) ) ( not ( = ?auto_34797 ?auto_34807 ) ) ( not ( = ?auto_34805 ?auto_34807 ) ) ( SURFACE-AT ?auto_34796 ?auto_34802 ) ( CLEAR ?auto_34796 ) ( IS-CRATE ?auto_34797 ) ( not ( = ?auto_34796 ?auto_34797 ) ) ( not ( = ?auto_34798 ?auto_34796 ) ) ( not ( = ?auto_34799 ?auto_34796 ) ) ( not ( = ?auto_34805 ?auto_34796 ) ) ( not ( = ?auto_34807 ?auto_34796 ) ) ( AVAILABLE ?auto_34800 ) ( IN ?auto_34797 ?auto_34801 ) ( TRUCK-AT ?auto_34801 ?auto_34804 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34797 ?auto_34798 ?auto_34799 )
      ( MAKE-3CRATE-VERIFY ?auto_34796 ?auto_34797 ?auto_34798 ?auto_34799 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34809 - SURFACE
      ?auto_34810 - SURFACE
      ?auto_34811 - SURFACE
      ?auto_34812 - SURFACE
      ?auto_34813 - SURFACE
    )
    :vars
    (
      ?auto_34814 - HOIST
      ?auto_34816 - PLACE
      ?auto_34818 - PLACE
      ?auto_34822 - HOIST
      ?auto_34819 - SURFACE
      ?auto_34817 - PLACE
      ?auto_34820 - HOIST
      ?auto_34821 - SURFACE
      ?auto_34815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34814 ?auto_34816 ) ( IS-CRATE ?auto_34813 ) ( not ( = ?auto_34812 ?auto_34813 ) ) ( not ( = ?auto_34811 ?auto_34812 ) ) ( not ( = ?auto_34811 ?auto_34813 ) ) ( not ( = ?auto_34818 ?auto_34816 ) ) ( HOIST-AT ?auto_34822 ?auto_34818 ) ( not ( = ?auto_34814 ?auto_34822 ) ) ( AVAILABLE ?auto_34822 ) ( SURFACE-AT ?auto_34813 ?auto_34818 ) ( ON ?auto_34813 ?auto_34819 ) ( CLEAR ?auto_34813 ) ( not ( = ?auto_34812 ?auto_34819 ) ) ( not ( = ?auto_34813 ?auto_34819 ) ) ( not ( = ?auto_34811 ?auto_34819 ) ) ( IS-CRATE ?auto_34812 ) ( not ( = ?auto_34817 ?auto_34816 ) ) ( not ( = ?auto_34818 ?auto_34817 ) ) ( HOIST-AT ?auto_34820 ?auto_34817 ) ( not ( = ?auto_34814 ?auto_34820 ) ) ( not ( = ?auto_34822 ?auto_34820 ) ) ( AVAILABLE ?auto_34820 ) ( SURFACE-AT ?auto_34812 ?auto_34817 ) ( ON ?auto_34812 ?auto_34821 ) ( CLEAR ?auto_34812 ) ( not ( = ?auto_34812 ?auto_34821 ) ) ( not ( = ?auto_34813 ?auto_34821 ) ) ( not ( = ?auto_34811 ?auto_34821 ) ) ( not ( = ?auto_34819 ?auto_34821 ) ) ( SURFACE-AT ?auto_34810 ?auto_34816 ) ( CLEAR ?auto_34810 ) ( IS-CRATE ?auto_34811 ) ( not ( = ?auto_34810 ?auto_34811 ) ) ( not ( = ?auto_34812 ?auto_34810 ) ) ( not ( = ?auto_34813 ?auto_34810 ) ) ( not ( = ?auto_34819 ?auto_34810 ) ) ( not ( = ?auto_34821 ?auto_34810 ) ) ( AVAILABLE ?auto_34814 ) ( IN ?auto_34811 ?auto_34815 ) ( TRUCK-AT ?auto_34815 ?auto_34818 ) ( ON ?auto_34810 ?auto_34809 ) ( not ( = ?auto_34809 ?auto_34810 ) ) ( not ( = ?auto_34809 ?auto_34811 ) ) ( not ( = ?auto_34809 ?auto_34812 ) ) ( not ( = ?auto_34809 ?auto_34813 ) ) ( not ( = ?auto_34809 ?auto_34819 ) ) ( not ( = ?auto_34809 ?auto_34821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34811 ?auto_34812 ?auto_34813 )
      ( MAKE-4CRATE-VERIFY ?auto_34809 ?auto_34810 ?auto_34811 ?auto_34812 ?auto_34813 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34823 - SURFACE
      ?auto_34824 - SURFACE
      ?auto_34825 - SURFACE
      ?auto_34826 - SURFACE
      ?auto_34827 - SURFACE
      ?auto_34828 - SURFACE
    )
    :vars
    (
      ?auto_34829 - HOIST
      ?auto_34831 - PLACE
      ?auto_34833 - PLACE
      ?auto_34837 - HOIST
      ?auto_34834 - SURFACE
      ?auto_34832 - PLACE
      ?auto_34835 - HOIST
      ?auto_34836 - SURFACE
      ?auto_34830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34829 ?auto_34831 ) ( IS-CRATE ?auto_34828 ) ( not ( = ?auto_34827 ?auto_34828 ) ) ( not ( = ?auto_34826 ?auto_34827 ) ) ( not ( = ?auto_34826 ?auto_34828 ) ) ( not ( = ?auto_34833 ?auto_34831 ) ) ( HOIST-AT ?auto_34837 ?auto_34833 ) ( not ( = ?auto_34829 ?auto_34837 ) ) ( AVAILABLE ?auto_34837 ) ( SURFACE-AT ?auto_34828 ?auto_34833 ) ( ON ?auto_34828 ?auto_34834 ) ( CLEAR ?auto_34828 ) ( not ( = ?auto_34827 ?auto_34834 ) ) ( not ( = ?auto_34828 ?auto_34834 ) ) ( not ( = ?auto_34826 ?auto_34834 ) ) ( IS-CRATE ?auto_34827 ) ( not ( = ?auto_34832 ?auto_34831 ) ) ( not ( = ?auto_34833 ?auto_34832 ) ) ( HOIST-AT ?auto_34835 ?auto_34832 ) ( not ( = ?auto_34829 ?auto_34835 ) ) ( not ( = ?auto_34837 ?auto_34835 ) ) ( AVAILABLE ?auto_34835 ) ( SURFACE-AT ?auto_34827 ?auto_34832 ) ( ON ?auto_34827 ?auto_34836 ) ( CLEAR ?auto_34827 ) ( not ( = ?auto_34827 ?auto_34836 ) ) ( not ( = ?auto_34828 ?auto_34836 ) ) ( not ( = ?auto_34826 ?auto_34836 ) ) ( not ( = ?auto_34834 ?auto_34836 ) ) ( SURFACE-AT ?auto_34825 ?auto_34831 ) ( CLEAR ?auto_34825 ) ( IS-CRATE ?auto_34826 ) ( not ( = ?auto_34825 ?auto_34826 ) ) ( not ( = ?auto_34827 ?auto_34825 ) ) ( not ( = ?auto_34828 ?auto_34825 ) ) ( not ( = ?auto_34834 ?auto_34825 ) ) ( not ( = ?auto_34836 ?auto_34825 ) ) ( AVAILABLE ?auto_34829 ) ( IN ?auto_34826 ?auto_34830 ) ( TRUCK-AT ?auto_34830 ?auto_34833 ) ( ON ?auto_34824 ?auto_34823 ) ( ON ?auto_34825 ?auto_34824 ) ( not ( = ?auto_34823 ?auto_34824 ) ) ( not ( = ?auto_34823 ?auto_34825 ) ) ( not ( = ?auto_34823 ?auto_34826 ) ) ( not ( = ?auto_34823 ?auto_34827 ) ) ( not ( = ?auto_34823 ?auto_34828 ) ) ( not ( = ?auto_34823 ?auto_34834 ) ) ( not ( = ?auto_34823 ?auto_34836 ) ) ( not ( = ?auto_34824 ?auto_34825 ) ) ( not ( = ?auto_34824 ?auto_34826 ) ) ( not ( = ?auto_34824 ?auto_34827 ) ) ( not ( = ?auto_34824 ?auto_34828 ) ) ( not ( = ?auto_34824 ?auto_34834 ) ) ( not ( = ?auto_34824 ?auto_34836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34826 ?auto_34827 ?auto_34828 )
      ( MAKE-5CRATE-VERIFY ?auto_34823 ?auto_34824 ?auto_34825 ?auto_34826 ?auto_34827 ?auto_34828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34838 - SURFACE
      ?auto_34839 - SURFACE
    )
    :vars
    (
      ?auto_34840 - HOIST
      ?auto_34842 - PLACE
      ?auto_34843 - SURFACE
      ?auto_34845 - PLACE
      ?auto_34850 - HOIST
      ?auto_34846 - SURFACE
      ?auto_34844 - PLACE
      ?auto_34847 - HOIST
      ?auto_34848 - SURFACE
      ?auto_34849 - SURFACE
      ?auto_34841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34840 ?auto_34842 ) ( IS-CRATE ?auto_34839 ) ( not ( = ?auto_34838 ?auto_34839 ) ) ( not ( = ?auto_34843 ?auto_34838 ) ) ( not ( = ?auto_34843 ?auto_34839 ) ) ( not ( = ?auto_34845 ?auto_34842 ) ) ( HOIST-AT ?auto_34850 ?auto_34845 ) ( not ( = ?auto_34840 ?auto_34850 ) ) ( SURFACE-AT ?auto_34839 ?auto_34845 ) ( ON ?auto_34839 ?auto_34846 ) ( CLEAR ?auto_34839 ) ( not ( = ?auto_34838 ?auto_34846 ) ) ( not ( = ?auto_34839 ?auto_34846 ) ) ( not ( = ?auto_34843 ?auto_34846 ) ) ( IS-CRATE ?auto_34838 ) ( not ( = ?auto_34844 ?auto_34842 ) ) ( not ( = ?auto_34845 ?auto_34844 ) ) ( HOIST-AT ?auto_34847 ?auto_34844 ) ( not ( = ?auto_34840 ?auto_34847 ) ) ( not ( = ?auto_34850 ?auto_34847 ) ) ( AVAILABLE ?auto_34847 ) ( SURFACE-AT ?auto_34838 ?auto_34844 ) ( ON ?auto_34838 ?auto_34848 ) ( CLEAR ?auto_34838 ) ( not ( = ?auto_34838 ?auto_34848 ) ) ( not ( = ?auto_34839 ?auto_34848 ) ) ( not ( = ?auto_34843 ?auto_34848 ) ) ( not ( = ?auto_34846 ?auto_34848 ) ) ( SURFACE-AT ?auto_34849 ?auto_34842 ) ( CLEAR ?auto_34849 ) ( IS-CRATE ?auto_34843 ) ( not ( = ?auto_34849 ?auto_34843 ) ) ( not ( = ?auto_34838 ?auto_34849 ) ) ( not ( = ?auto_34839 ?auto_34849 ) ) ( not ( = ?auto_34846 ?auto_34849 ) ) ( not ( = ?auto_34848 ?auto_34849 ) ) ( AVAILABLE ?auto_34840 ) ( TRUCK-AT ?auto_34841 ?auto_34845 ) ( LIFTING ?auto_34850 ?auto_34843 ) )
    :subtasks
    ( ( !LOAD ?auto_34850 ?auto_34843 ?auto_34841 ?auto_34845 )
      ( MAKE-2CRATE ?auto_34843 ?auto_34838 ?auto_34839 )
      ( MAKE-1CRATE-VERIFY ?auto_34838 ?auto_34839 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34851 - SURFACE
      ?auto_34852 - SURFACE
      ?auto_34853 - SURFACE
    )
    :vars
    (
      ?auto_34860 - HOIST
      ?auto_34858 - PLACE
      ?auto_34857 - PLACE
      ?auto_34854 - HOIST
      ?auto_34855 - SURFACE
      ?auto_34856 - PLACE
      ?auto_34859 - HOIST
      ?auto_34862 - SURFACE
      ?auto_34861 - SURFACE
      ?auto_34863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34860 ?auto_34858 ) ( IS-CRATE ?auto_34853 ) ( not ( = ?auto_34852 ?auto_34853 ) ) ( not ( = ?auto_34851 ?auto_34852 ) ) ( not ( = ?auto_34851 ?auto_34853 ) ) ( not ( = ?auto_34857 ?auto_34858 ) ) ( HOIST-AT ?auto_34854 ?auto_34857 ) ( not ( = ?auto_34860 ?auto_34854 ) ) ( SURFACE-AT ?auto_34853 ?auto_34857 ) ( ON ?auto_34853 ?auto_34855 ) ( CLEAR ?auto_34853 ) ( not ( = ?auto_34852 ?auto_34855 ) ) ( not ( = ?auto_34853 ?auto_34855 ) ) ( not ( = ?auto_34851 ?auto_34855 ) ) ( IS-CRATE ?auto_34852 ) ( not ( = ?auto_34856 ?auto_34858 ) ) ( not ( = ?auto_34857 ?auto_34856 ) ) ( HOIST-AT ?auto_34859 ?auto_34856 ) ( not ( = ?auto_34860 ?auto_34859 ) ) ( not ( = ?auto_34854 ?auto_34859 ) ) ( AVAILABLE ?auto_34859 ) ( SURFACE-AT ?auto_34852 ?auto_34856 ) ( ON ?auto_34852 ?auto_34862 ) ( CLEAR ?auto_34852 ) ( not ( = ?auto_34852 ?auto_34862 ) ) ( not ( = ?auto_34853 ?auto_34862 ) ) ( not ( = ?auto_34851 ?auto_34862 ) ) ( not ( = ?auto_34855 ?auto_34862 ) ) ( SURFACE-AT ?auto_34861 ?auto_34858 ) ( CLEAR ?auto_34861 ) ( IS-CRATE ?auto_34851 ) ( not ( = ?auto_34861 ?auto_34851 ) ) ( not ( = ?auto_34852 ?auto_34861 ) ) ( not ( = ?auto_34853 ?auto_34861 ) ) ( not ( = ?auto_34855 ?auto_34861 ) ) ( not ( = ?auto_34862 ?auto_34861 ) ) ( AVAILABLE ?auto_34860 ) ( TRUCK-AT ?auto_34863 ?auto_34857 ) ( LIFTING ?auto_34854 ?auto_34851 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34852 ?auto_34853 )
      ( MAKE-2CRATE-VERIFY ?auto_34851 ?auto_34852 ?auto_34853 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34864 - SURFACE
      ?auto_34865 - SURFACE
      ?auto_34866 - SURFACE
      ?auto_34867 - SURFACE
    )
    :vars
    (
      ?auto_34871 - HOIST
      ?auto_34873 - PLACE
      ?auto_34869 - PLACE
      ?auto_34874 - HOIST
      ?auto_34876 - SURFACE
      ?auto_34872 - PLACE
      ?auto_34870 - HOIST
      ?auto_34868 - SURFACE
      ?auto_34875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34871 ?auto_34873 ) ( IS-CRATE ?auto_34867 ) ( not ( = ?auto_34866 ?auto_34867 ) ) ( not ( = ?auto_34865 ?auto_34866 ) ) ( not ( = ?auto_34865 ?auto_34867 ) ) ( not ( = ?auto_34869 ?auto_34873 ) ) ( HOIST-AT ?auto_34874 ?auto_34869 ) ( not ( = ?auto_34871 ?auto_34874 ) ) ( SURFACE-AT ?auto_34867 ?auto_34869 ) ( ON ?auto_34867 ?auto_34876 ) ( CLEAR ?auto_34867 ) ( not ( = ?auto_34866 ?auto_34876 ) ) ( not ( = ?auto_34867 ?auto_34876 ) ) ( not ( = ?auto_34865 ?auto_34876 ) ) ( IS-CRATE ?auto_34866 ) ( not ( = ?auto_34872 ?auto_34873 ) ) ( not ( = ?auto_34869 ?auto_34872 ) ) ( HOIST-AT ?auto_34870 ?auto_34872 ) ( not ( = ?auto_34871 ?auto_34870 ) ) ( not ( = ?auto_34874 ?auto_34870 ) ) ( AVAILABLE ?auto_34870 ) ( SURFACE-AT ?auto_34866 ?auto_34872 ) ( ON ?auto_34866 ?auto_34868 ) ( CLEAR ?auto_34866 ) ( not ( = ?auto_34866 ?auto_34868 ) ) ( not ( = ?auto_34867 ?auto_34868 ) ) ( not ( = ?auto_34865 ?auto_34868 ) ) ( not ( = ?auto_34876 ?auto_34868 ) ) ( SURFACE-AT ?auto_34864 ?auto_34873 ) ( CLEAR ?auto_34864 ) ( IS-CRATE ?auto_34865 ) ( not ( = ?auto_34864 ?auto_34865 ) ) ( not ( = ?auto_34866 ?auto_34864 ) ) ( not ( = ?auto_34867 ?auto_34864 ) ) ( not ( = ?auto_34876 ?auto_34864 ) ) ( not ( = ?auto_34868 ?auto_34864 ) ) ( AVAILABLE ?auto_34871 ) ( TRUCK-AT ?auto_34875 ?auto_34869 ) ( LIFTING ?auto_34874 ?auto_34865 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34865 ?auto_34866 ?auto_34867 )
      ( MAKE-3CRATE-VERIFY ?auto_34864 ?auto_34865 ?auto_34866 ?auto_34867 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34877 - SURFACE
      ?auto_34878 - SURFACE
      ?auto_34879 - SURFACE
      ?auto_34880 - SURFACE
      ?auto_34881 - SURFACE
    )
    :vars
    (
      ?auto_34885 - HOIST
      ?auto_34887 - PLACE
      ?auto_34883 - PLACE
      ?auto_34888 - HOIST
      ?auto_34890 - SURFACE
      ?auto_34886 - PLACE
      ?auto_34884 - HOIST
      ?auto_34882 - SURFACE
      ?auto_34889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34885 ?auto_34887 ) ( IS-CRATE ?auto_34881 ) ( not ( = ?auto_34880 ?auto_34881 ) ) ( not ( = ?auto_34879 ?auto_34880 ) ) ( not ( = ?auto_34879 ?auto_34881 ) ) ( not ( = ?auto_34883 ?auto_34887 ) ) ( HOIST-AT ?auto_34888 ?auto_34883 ) ( not ( = ?auto_34885 ?auto_34888 ) ) ( SURFACE-AT ?auto_34881 ?auto_34883 ) ( ON ?auto_34881 ?auto_34890 ) ( CLEAR ?auto_34881 ) ( not ( = ?auto_34880 ?auto_34890 ) ) ( not ( = ?auto_34881 ?auto_34890 ) ) ( not ( = ?auto_34879 ?auto_34890 ) ) ( IS-CRATE ?auto_34880 ) ( not ( = ?auto_34886 ?auto_34887 ) ) ( not ( = ?auto_34883 ?auto_34886 ) ) ( HOIST-AT ?auto_34884 ?auto_34886 ) ( not ( = ?auto_34885 ?auto_34884 ) ) ( not ( = ?auto_34888 ?auto_34884 ) ) ( AVAILABLE ?auto_34884 ) ( SURFACE-AT ?auto_34880 ?auto_34886 ) ( ON ?auto_34880 ?auto_34882 ) ( CLEAR ?auto_34880 ) ( not ( = ?auto_34880 ?auto_34882 ) ) ( not ( = ?auto_34881 ?auto_34882 ) ) ( not ( = ?auto_34879 ?auto_34882 ) ) ( not ( = ?auto_34890 ?auto_34882 ) ) ( SURFACE-AT ?auto_34878 ?auto_34887 ) ( CLEAR ?auto_34878 ) ( IS-CRATE ?auto_34879 ) ( not ( = ?auto_34878 ?auto_34879 ) ) ( not ( = ?auto_34880 ?auto_34878 ) ) ( not ( = ?auto_34881 ?auto_34878 ) ) ( not ( = ?auto_34890 ?auto_34878 ) ) ( not ( = ?auto_34882 ?auto_34878 ) ) ( AVAILABLE ?auto_34885 ) ( TRUCK-AT ?auto_34889 ?auto_34883 ) ( LIFTING ?auto_34888 ?auto_34879 ) ( ON ?auto_34878 ?auto_34877 ) ( not ( = ?auto_34877 ?auto_34878 ) ) ( not ( = ?auto_34877 ?auto_34879 ) ) ( not ( = ?auto_34877 ?auto_34880 ) ) ( not ( = ?auto_34877 ?auto_34881 ) ) ( not ( = ?auto_34877 ?auto_34890 ) ) ( not ( = ?auto_34877 ?auto_34882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34879 ?auto_34880 ?auto_34881 )
      ( MAKE-4CRATE-VERIFY ?auto_34877 ?auto_34878 ?auto_34879 ?auto_34880 ?auto_34881 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34891 - SURFACE
      ?auto_34892 - SURFACE
      ?auto_34893 - SURFACE
      ?auto_34894 - SURFACE
      ?auto_34895 - SURFACE
      ?auto_34896 - SURFACE
    )
    :vars
    (
      ?auto_34900 - HOIST
      ?auto_34902 - PLACE
      ?auto_34898 - PLACE
      ?auto_34903 - HOIST
      ?auto_34905 - SURFACE
      ?auto_34901 - PLACE
      ?auto_34899 - HOIST
      ?auto_34897 - SURFACE
      ?auto_34904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34900 ?auto_34902 ) ( IS-CRATE ?auto_34896 ) ( not ( = ?auto_34895 ?auto_34896 ) ) ( not ( = ?auto_34894 ?auto_34895 ) ) ( not ( = ?auto_34894 ?auto_34896 ) ) ( not ( = ?auto_34898 ?auto_34902 ) ) ( HOIST-AT ?auto_34903 ?auto_34898 ) ( not ( = ?auto_34900 ?auto_34903 ) ) ( SURFACE-AT ?auto_34896 ?auto_34898 ) ( ON ?auto_34896 ?auto_34905 ) ( CLEAR ?auto_34896 ) ( not ( = ?auto_34895 ?auto_34905 ) ) ( not ( = ?auto_34896 ?auto_34905 ) ) ( not ( = ?auto_34894 ?auto_34905 ) ) ( IS-CRATE ?auto_34895 ) ( not ( = ?auto_34901 ?auto_34902 ) ) ( not ( = ?auto_34898 ?auto_34901 ) ) ( HOIST-AT ?auto_34899 ?auto_34901 ) ( not ( = ?auto_34900 ?auto_34899 ) ) ( not ( = ?auto_34903 ?auto_34899 ) ) ( AVAILABLE ?auto_34899 ) ( SURFACE-AT ?auto_34895 ?auto_34901 ) ( ON ?auto_34895 ?auto_34897 ) ( CLEAR ?auto_34895 ) ( not ( = ?auto_34895 ?auto_34897 ) ) ( not ( = ?auto_34896 ?auto_34897 ) ) ( not ( = ?auto_34894 ?auto_34897 ) ) ( not ( = ?auto_34905 ?auto_34897 ) ) ( SURFACE-AT ?auto_34893 ?auto_34902 ) ( CLEAR ?auto_34893 ) ( IS-CRATE ?auto_34894 ) ( not ( = ?auto_34893 ?auto_34894 ) ) ( not ( = ?auto_34895 ?auto_34893 ) ) ( not ( = ?auto_34896 ?auto_34893 ) ) ( not ( = ?auto_34905 ?auto_34893 ) ) ( not ( = ?auto_34897 ?auto_34893 ) ) ( AVAILABLE ?auto_34900 ) ( TRUCK-AT ?auto_34904 ?auto_34898 ) ( LIFTING ?auto_34903 ?auto_34894 ) ( ON ?auto_34892 ?auto_34891 ) ( ON ?auto_34893 ?auto_34892 ) ( not ( = ?auto_34891 ?auto_34892 ) ) ( not ( = ?auto_34891 ?auto_34893 ) ) ( not ( = ?auto_34891 ?auto_34894 ) ) ( not ( = ?auto_34891 ?auto_34895 ) ) ( not ( = ?auto_34891 ?auto_34896 ) ) ( not ( = ?auto_34891 ?auto_34905 ) ) ( not ( = ?auto_34891 ?auto_34897 ) ) ( not ( = ?auto_34892 ?auto_34893 ) ) ( not ( = ?auto_34892 ?auto_34894 ) ) ( not ( = ?auto_34892 ?auto_34895 ) ) ( not ( = ?auto_34892 ?auto_34896 ) ) ( not ( = ?auto_34892 ?auto_34905 ) ) ( not ( = ?auto_34892 ?auto_34897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34894 ?auto_34895 ?auto_34896 )
      ( MAKE-5CRATE-VERIFY ?auto_34891 ?auto_34892 ?auto_34893 ?auto_34894 ?auto_34895 ?auto_34896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34906 - SURFACE
      ?auto_34907 - SURFACE
    )
    :vars
    (
      ?auto_34913 - HOIST
      ?auto_34915 - PLACE
      ?auto_34910 - SURFACE
      ?auto_34909 - PLACE
      ?auto_34916 - HOIST
      ?auto_34918 - SURFACE
      ?auto_34914 - PLACE
      ?auto_34911 - HOIST
      ?auto_34908 - SURFACE
      ?auto_34912 - SURFACE
      ?auto_34917 - TRUCK
      ?auto_34919 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34913 ?auto_34915 ) ( IS-CRATE ?auto_34907 ) ( not ( = ?auto_34906 ?auto_34907 ) ) ( not ( = ?auto_34910 ?auto_34906 ) ) ( not ( = ?auto_34910 ?auto_34907 ) ) ( not ( = ?auto_34909 ?auto_34915 ) ) ( HOIST-AT ?auto_34916 ?auto_34909 ) ( not ( = ?auto_34913 ?auto_34916 ) ) ( SURFACE-AT ?auto_34907 ?auto_34909 ) ( ON ?auto_34907 ?auto_34918 ) ( CLEAR ?auto_34907 ) ( not ( = ?auto_34906 ?auto_34918 ) ) ( not ( = ?auto_34907 ?auto_34918 ) ) ( not ( = ?auto_34910 ?auto_34918 ) ) ( IS-CRATE ?auto_34906 ) ( not ( = ?auto_34914 ?auto_34915 ) ) ( not ( = ?auto_34909 ?auto_34914 ) ) ( HOIST-AT ?auto_34911 ?auto_34914 ) ( not ( = ?auto_34913 ?auto_34911 ) ) ( not ( = ?auto_34916 ?auto_34911 ) ) ( AVAILABLE ?auto_34911 ) ( SURFACE-AT ?auto_34906 ?auto_34914 ) ( ON ?auto_34906 ?auto_34908 ) ( CLEAR ?auto_34906 ) ( not ( = ?auto_34906 ?auto_34908 ) ) ( not ( = ?auto_34907 ?auto_34908 ) ) ( not ( = ?auto_34910 ?auto_34908 ) ) ( not ( = ?auto_34918 ?auto_34908 ) ) ( SURFACE-AT ?auto_34912 ?auto_34915 ) ( CLEAR ?auto_34912 ) ( IS-CRATE ?auto_34910 ) ( not ( = ?auto_34912 ?auto_34910 ) ) ( not ( = ?auto_34906 ?auto_34912 ) ) ( not ( = ?auto_34907 ?auto_34912 ) ) ( not ( = ?auto_34918 ?auto_34912 ) ) ( not ( = ?auto_34908 ?auto_34912 ) ) ( AVAILABLE ?auto_34913 ) ( TRUCK-AT ?auto_34917 ?auto_34909 ) ( AVAILABLE ?auto_34916 ) ( SURFACE-AT ?auto_34910 ?auto_34909 ) ( ON ?auto_34910 ?auto_34919 ) ( CLEAR ?auto_34910 ) ( not ( = ?auto_34906 ?auto_34919 ) ) ( not ( = ?auto_34907 ?auto_34919 ) ) ( not ( = ?auto_34910 ?auto_34919 ) ) ( not ( = ?auto_34918 ?auto_34919 ) ) ( not ( = ?auto_34908 ?auto_34919 ) ) ( not ( = ?auto_34912 ?auto_34919 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34916 ?auto_34910 ?auto_34919 ?auto_34909 )
      ( MAKE-2CRATE ?auto_34910 ?auto_34906 ?auto_34907 )
      ( MAKE-1CRATE-VERIFY ?auto_34906 ?auto_34907 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34920 - SURFACE
      ?auto_34921 - SURFACE
      ?auto_34922 - SURFACE
    )
    :vars
    (
      ?auto_34923 - HOIST
      ?auto_34932 - PLACE
      ?auto_34924 - PLACE
      ?auto_34928 - HOIST
      ?auto_34931 - SURFACE
      ?auto_34933 - PLACE
      ?auto_34926 - HOIST
      ?auto_34929 - SURFACE
      ?auto_34927 - SURFACE
      ?auto_34930 - TRUCK
      ?auto_34925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34923 ?auto_34932 ) ( IS-CRATE ?auto_34922 ) ( not ( = ?auto_34921 ?auto_34922 ) ) ( not ( = ?auto_34920 ?auto_34921 ) ) ( not ( = ?auto_34920 ?auto_34922 ) ) ( not ( = ?auto_34924 ?auto_34932 ) ) ( HOIST-AT ?auto_34928 ?auto_34924 ) ( not ( = ?auto_34923 ?auto_34928 ) ) ( SURFACE-AT ?auto_34922 ?auto_34924 ) ( ON ?auto_34922 ?auto_34931 ) ( CLEAR ?auto_34922 ) ( not ( = ?auto_34921 ?auto_34931 ) ) ( not ( = ?auto_34922 ?auto_34931 ) ) ( not ( = ?auto_34920 ?auto_34931 ) ) ( IS-CRATE ?auto_34921 ) ( not ( = ?auto_34933 ?auto_34932 ) ) ( not ( = ?auto_34924 ?auto_34933 ) ) ( HOIST-AT ?auto_34926 ?auto_34933 ) ( not ( = ?auto_34923 ?auto_34926 ) ) ( not ( = ?auto_34928 ?auto_34926 ) ) ( AVAILABLE ?auto_34926 ) ( SURFACE-AT ?auto_34921 ?auto_34933 ) ( ON ?auto_34921 ?auto_34929 ) ( CLEAR ?auto_34921 ) ( not ( = ?auto_34921 ?auto_34929 ) ) ( not ( = ?auto_34922 ?auto_34929 ) ) ( not ( = ?auto_34920 ?auto_34929 ) ) ( not ( = ?auto_34931 ?auto_34929 ) ) ( SURFACE-AT ?auto_34927 ?auto_34932 ) ( CLEAR ?auto_34927 ) ( IS-CRATE ?auto_34920 ) ( not ( = ?auto_34927 ?auto_34920 ) ) ( not ( = ?auto_34921 ?auto_34927 ) ) ( not ( = ?auto_34922 ?auto_34927 ) ) ( not ( = ?auto_34931 ?auto_34927 ) ) ( not ( = ?auto_34929 ?auto_34927 ) ) ( AVAILABLE ?auto_34923 ) ( TRUCK-AT ?auto_34930 ?auto_34924 ) ( AVAILABLE ?auto_34928 ) ( SURFACE-AT ?auto_34920 ?auto_34924 ) ( ON ?auto_34920 ?auto_34925 ) ( CLEAR ?auto_34920 ) ( not ( = ?auto_34921 ?auto_34925 ) ) ( not ( = ?auto_34922 ?auto_34925 ) ) ( not ( = ?auto_34920 ?auto_34925 ) ) ( not ( = ?auto_34931 ?auto_34925 ) ) ( not ( = ?auto_34929 ?auto_34925 ) ) ( not ( = ?auto_34927 ?auto_34925 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34921 ?auto_34922 )
      ( MAKE-2CRATE-VERIFY ?auto_34920 ?auto_34921 ?auto_34922 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34934 - SURFACE
      ?auto_34935 - SURFACE
      ?auto_34936 - SURFACE
      ?auto_34937 - SURFACE
    )
    :vars
    (
      ?auto_34942 - HOIST
      ?auto_34938 - PLACE
      ?auto_34945 - PLACE
      ?auto_34939 - HOIST
      ?auto_34940 - SURFACE
      ?auto_34946 - PLACE
      ?auto_34943 - HOIST
      ?auto_34944 - SURFACE
      ?auto_34947 - TRUCK
      ?auto_34941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34942 ?auto_34938 ) ( IS-CRATE ?auto_34937 ) ( not ( = ?auto_34936 ?auto_34937 ) ) ( not ( = ?auto_34935 ?auto_34936 ) ) ( not ( = ?auto_34935 ?auto_34937 ) ) ( not ( = ?auto_34945 ?auto_34938 ) ) ( HOIST-AT ?auto_34939 ?auto_34945 ) ( not ( = ?auto_34942 ?auto_34939 ) ) ( SURFACE-AT ?auto_34937 ?auto_34945 ) ( ON ?auto_34937 ?auto_34940 ) ( CLEAR ?auto_34937 ) ( not ( = ?auto_34936 ?auto_34940 ) ) ( not ( = ?auto_34937 ?auto_34940 ) ) ( not ( = ?auto_34935 ?auto_34940 ) ) ( IS-CRATE ?auto_34936 ) ( not ( = ?auto_34946 ?auto_34938 ) ) ( not ( = ?auto_34945 ?auto_34946 ) ) ( HOIST-AT ?auto_34943 ?auto_34946 ) ( not ( = ?auto_34942 ?auto_34943 ) ) ( not ( = ?auto_34939 ?auto_34943 ) ) ( AVAILABLE ?auto_34943 ) ( SURFACE-AT ?auto_34936 ?auto_34946 ) ( ON ?auto_34936 ?auto_34944 ) ( CLEAR ?auto_34936 ) ( not ( = ?auto_34936 ?auto_34944 ) ) ( not ( = ?auto_34937 ?auto_34944 ) ) ( not ( = ?auto_34935 ?auto_34944 ) ) ( not ( = ?auto_34940 ?auto_34944 ) ) ( SURFACE-AT ?auto_34934 ?auto_34938 ) ( CLEAR ?auto_34934 ) ( IS-CRATE ?auto_34935 ) ( not ( = ?auto_34934 ?auto_34935 ) ) ( not ( = ?auto_34936 ?auto_34934 ) ) ( not ( = ?auto_34937 ?auto_34934 ) ) ( not ( = ?auto_34940 ?auto_34934 ) ) ( not ( = ?auto_34944 ?auto_34934 ) ) ( AVAILABLE ?auto_34942 ) ( TRUCK-AT ?auto_34947 ?auto_34945 ) ( AVAILABLE ?auto_34939 ) ( SURFACE-AT ?auto_34935 ?auto_34945 ) ( ON ?auto_34935 ?auto_34941 ) ( CLEAR ?auto_34935 ) ( not ( = ?auto_34936 ?auto_34941 ) ) ( not ( = ?auto_34937 ?auto_34941 ) ) ( not ( = ?auto_34935 ?auto_34941 ) ) ( not ( = ?auto_34940 ?auto_34941 ) ) ( not ( = ?auto_34944 ?auto_34941 ) ) ( not ( = ?auto_34934 ?auto_34941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34935 ?auto_34936 ?auto_34937 )
      ( MAKE-3CRATE-VERIFY ?auto_34934 ?auto_34935 ?auto_34936 ?auto_34937 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34948 - SURFACE
      ?auto_34949 - SURFACE
      ?auto_34950 - SURFACE
      ?auto_34951 - SURFACE
      ?auto_34952 - SURFACE
    )
    :vars
    (
      ?auto_34957 - HOIST
      ?auto_34953 - PLACE
      ?auto_34960 - PLACE
      ?auto_34954 - HOIST
      ?auto_34955 - SURFACE
      ?auto_34961 - PLACE
      ?auto_34958 - HOIST
      ?auto_34959 - SURFACE
      ?auto_34962 - TRUCK
      ?auto_34956 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34957 ?auto_34953 ) ( IS-CRATE ?auto_34952 ) ( not ( = ?auto_34951 ?auto_34952 ) ) ( not ( = ?auto_34950 ?auto_34951 ) ) ( not ( = ?auto_34950 ?auto_34952 ) ) ( not ( = ?auto_34960 ?auto_34953 ) ) ( HOIST-AT ?auto_34954 ?auto_34960 ) ( not ( = ?auto_34957 ?auto_34954 ) ) ( SURFACE-AT ?auto_34952 ?auto_34960 ) ( ON ?auto_34952 ?auto_34955 ) ( CLEAR ?auto_34952 ) ( not ( = ?auto_34951 ?auto_34955 ) ) ( not ( = ?auto_34952 ?auto_34955 ) ) ( not ( = ?auto_34950 ?auto_34955 ) ) ( IS-CRATE ?auto_34951 ) ( not ( = ?auto_34961 ?auto_34953 ) ) ( not ( = ?auto_34960 ?auto_34961 ) ) ( HOIST-AT ?auto_34958 ?auto_34961 ) ( not ( = ?auto_34957 ?auto_34958 ) ) ( not ( = ?auto_34954 ?auto_34958 ) ) ( AVAILABLE ?auto_34958 ) ( SURFACE-AT ?auto_34951 ?auto_34961 ) ( ON ?auto_34951 ?auto_34959 ) ( CLEAR ?auto_34951 ) ( not ( = ?auto_34951 ?auto_34959 ) ) ( not ( = ?auto_34952 ?auto_34959 ) ) ( not ( = ?auto_34950 ?auto_34959 ) ) ( not ( = ?auto_34955 ?auto_34959 ) ) ( SURFACE-AT ?auto_34949 ?auto_34953 ) ( CLEAR ?auto_34949 ) ( IS-CRATE ?auto_34950 ) ( not ( = ?auto_34949 ?auto_34950 ) ) ( not ( = ?auto_34951 ?auto_34949 ) ) ( not ( = ?auto_34952 ?auto_34949 ) ) ( not ( = ?auto_34955 ?auto_34949 ) ) ( not ( = ?auto_34959 ?auto_34949 ) ) ( AVAILABLE ?auto_34957 ) ( TRUCK-AT ?auto_34962 ?auto_34960 ) ( AVAILABLE ?auto_34954 ) ( SURFACE-AT ?auto_34950 ?auto_34960 ) ( ON ?auto_34950 ?auto_34956 ) ( CLEAR ?auto_34950 ) ( not ( = ?auto_34951 ?auto_34956 ) ) ( not ( = ?auto_34952 ?auto_34956 ) ) ( not ( = ?auto_34950 ?auto_34956 ) ) ( not ( = ?auto_34955 ?auto_34956 ) ) ( not ( = ?auto_34959 ?auto_34956 ) ) ( not ( = ?auto_34949 ?auto_34956 ) ) ( ON ?auto_34949 ?auto_34948 ) ( not ( = ?auto_34948 ?auto_34949 ) ) ( not ( = ?auto_34948 ?auto_34950 ) ) ( not ( = ?auto_34948 ?auto_34951 ) ) ( not ( = ?auto_34948 ?auto_34952 ) ) ( not ( = ?auto_34948 ?auto_34955 ) ) ( not ( = ?auto_34948 ?auto_34959 ) ) ( not ( = ?auto_34948 ?auto_34956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34950 ?auto_34951 ?auto_34952 )
      ( MAKE-4CRATE-VERIFY ?auto_34948 ?auto_34949 ?auto_34950 ?auto_34951 ?auto_34952 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34963 - SURFACE
      ?auto_34964 - SURFACE
      ?auto_34965 - SURFACE
      ?auto_34966 - SURFACE
      ?auto_34967 - SURFACE
      ?auto_34968 - SURFACE
    )
    :vars
    (
      ?auto_34973 - HOIST
      ?auto_34969 - PLACE
      ?auto_34976 - PLACE
      ?auto_34970 - HOIST
      ?auto_34971 - SURFACE
      ?auto_34977 - PLACE
      ?auto_34974 - HOIST
      ?auto_34975 - SURFACE
      ?auto_34978 - TRUCK
      ?auto_34972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34973 ?auto_34969 ) ( IS-CRATE ?auto_34968 ) ( not ( = ?auto_34967 ?auto_34968 ) ) ( not ( = ?auto_34966 ?auto_34967 ) ) ( not ( = ?auto_34966 ?auto_34968 ) ) ( not ( = ?auto_34976 ?auto_34969 ) ) ( HOIST-AT ?auto_34970 ?auto_34976 ) ( not ( = ?auto_34973 ?auto_34970 ) ) ( SURFACE-AT ?auto_34968 ?auto_34976 ) ( ON ?auto_34968 ?auto_34971 ) ( CLEAR ?auto_34968 ) ( not ( = ?auto_34967 ?auto_34971 ) ) ( not ( = ?auto_34968 ?auto_34971 ) ) ( not ( = ?auto_34966 ?auto_34971 ) ) ( IS-CRATE ?auto_34967 ) ( not ( = ?auto_34977 ?auto_34969 ) ) ( not ( = ?auto_34976 ?auto_34977 ) ) ( HOIST-AT ?auto_34974 ?auto_34977 ) ( not ( = ?auto_34973 ?auto_34974 ) ) ( not ( = ?auto_34970 ?auto_34974 ) ) ( AVAILABLE ?auto_34974 ) ( SURFACE-AT ?auto_34967 ?auto_34977 ) ( ON ?auto_34967 ?auto_34975 ) ( CLEAR ?auto_34967 ) ( not ( = ?auto_34967 ?auto_34975 ) ) ( not ( = ?auto_34968 ?auto_34975 ) ) ( not ( = ?auto_34966 ?auto_34975 ) ) ( not ( = ?auto_34971 ?auto_34975 ) ) ( SURFACE-AT ?auto_34965 ?auto_34969 ) ( CLEAR ?auto_34965 ) ( IS-CRATE ?auto_34966 ) ( not ( = ?auto_34965 ?auto_34966 ) ) ( not ( = ?auto_34967 ?auto_34965 ) ) ( not ( = ?auto_34968 ?auto_34965 ) ) ( not ( = ?auto_34971 ?auto_34965 ) ) ( not ( = ?auto_34975 ?auto_34965 ) ) ( AVAILABLE ?auto_34973 ) ( TRUCK-AT ?auto_34978 ?auto_34976 ) ( AVAILABLE ?auto_34970 ) ( SURFACE-AT ?auto_34966 ?auto_34976 ) ( ON ?auto_34966 ?auto_34972 ) ( CLEAR ?auto_34966 ) ( not ( = ?auto_34967 ?auto_34972 ) ) ( not ( = ?auto_34968 ?auto_34972 ) ) ( not ( = ?auto_34966 ?auto_34972 ) ) ( not ( = ?auto_34971 ?auto_34972 ) ) ( not ( = ?auto_34975 ?auto_34972 ) ) ( not ( = ?auto_34965 ?auto_34972 ) ) ( ON ?auto_34964 ?auto_34963 ) ( ON ?auto_34965 ?auto_34964 ) ( not ( = ?auto_34963 ?auto_34964 ) ) ( not ( = ?auto_34963 ?auto_34965 ) ) ( not ( = ?auto_34963 ?auto_34966 ) ) ( not ( = ?auto_34963 ?auto_34967 ) ) ( not ( = ?auto_34963 ?auto_34968 ) ) ( not ( = ?auto_34963 ?auto_34971 ) ) ( not ( = ?auto_34963 ?auto_34975 ) ) ( not ( = ?auto_34963 ?auto_34972 ) ) ( not ( = ?auto_34964 ?auto_34965 ) ) ( not ( = ?auto_34964 ?auto_34966 ) ) ( not ( = ?auto_34964 ?auto_34967 ) ) ( not ( = ?auto_34964 ?auto_34968 ) ) ( not ( = ?auto_34964 ?auto_34971 ) ) ( not ( = ?auto_34964 ?auto_34975 ) ) ( not ( = ?auto_34964 ?auto_34972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34966 ?auto_34967 ?auto_34968 )
      ( MAKE-5CRATE-VERIFY ?auto_34963 ?auto_34964 ?auto_34965 ?auto_34966 ?auto_34967 ?auto_34968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34979 - SURFACE
      ?auto_34980 - SURFACE
    )
    :vars
    (
      ?auto_34985 - HOIST
      ?auto_34981 - PLACE
      ?auto_34989 - SURFACE
      ?auto_34990 - PLACE
      ?auto_34982 - HOIST
      ?auto_34983 - SURFACE
      ?auto_34991 - PLACE
      ?auto_34986 - HOIST
      ?auto_34988 - SURFACE
      ?auto_34987 - SURFACE
      ?auto_34984 - SURFACE
      ?auto_34992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34985 ?auto_34981 ) ( IS-CRATE ?auto_34980 ) ( not ( = ?auto_34979 ?auto_34980 ) ) ( not ( = ?auto_34989 ?auto_34979 ) ) ( not ( = ?auto_34989 ?auto_34980 ) ) ( not ( = ?auto_34990 ?auto_34981 ) ) ( HOIST-AT ?auto_34982 ?auto_34990 ) ( not ( = ?auto_34985 ?auto_34982 ) ) ( SURFACE-AT ?auto_34980 ?auto_34990 ) ( ON ?auto_34980 ?auto_34983 ) ( CLEAR ?auto_34980 ) ( not ( = ?auto_34979 ?auto_34983 ) ) ( not ( = ?auto_34980 ?auto_34983 ) ) ( not ( = ?auto_34989 ?auto_34983 ) ) ( IS-CRATE ?auto_34979 ) ( not ( = ?auto_34991 ?auto_34981 ) ) ( not ( = ?auto_34990 ?auto_34991 ) ) ( HOIST-AT ?auto_34986 ?auto_34991 ) ( not ( = ?auto_34985 ?auto_34986 ) ) ( not ( = ?auto_34982 ?auto_34986 ) ) ( AVAILABLE ?auto_34986 ) ( SURFACE-AT ?auto_34979 ?auto_34991 ) ( ON ?auto_34979 ?auto_34988 ) ( CLEAR ?auto_34979 ) ( not ( = ?auto_34979 ?auto_34988 ) ) ( not ( = ?auto_34980 ?auto_34988 ) ) ( not ( = ?auto_34989 ?auto_34988 ) ) ( not ( = ?auto_34983 ?auto_34988 ) ) ( SURFACE-AT ?auto_34987 ?auto_34981 ) ( CLEAR ?auto_34987 ) ( IS-CRATE ?auto_34989 ) ( not ( = ?auto_34987 ?auto_34989 ) ) ( not ( = ?auto_34979 ?auto_34987 ) ) ( not ( = ?auto_34980 ?auto_34987 ) ) ( not ( = ?auto_34983 ?auto_34987 ) ) ( not ( = ?auto_34988 ?auto_34987 ) ) ( AVAILABLE ?auto_34985 ) ( AVAILABLE ?auto_34982 ) ( SURFACE-AT ?auto_34989 ?auto_34990 ) ( ON ?auto_34989 ?auto_34984 ) ( CLEAR ?auto_34989 ) ( not ( = ?auto_34979 ?auto_34984 ) ) ( not ( = ?auto_34980 ?auto_34984 ) ) ( not ( = ?auto_34989 ?auto_34984 ) ) ( not ( = ?auto_34983 ?auto_34984 ) ) ( not ( = ?auto_34988 ?auto_34984 ) ) ( not ( = ?auto_34987 ?auto_34984 ) ) ( TRUCK-AT ?auto_34992 ?auto_34981 ) )
    :subtasks
    ( ( !DRIVE ?auto_34992 ?auto_34981 ?auto_34990 )
      ( MAKE-2CRATE ?auto_34989 ?auto_34979 ?auto_34980 )
      ( MAKE-1CRATE-VERIFY ?auto_34979 ?auto_34980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34993 - SURFACE
      ?auto_34994 - SURFACE
      ?auto_34995 - SURFACE
    )
    :vars
    (
      ?auto_35001 - HOIST
      ?auto_35003 - PLACE
      ?auto_34998 - PLACE
      ?auto_34996 - HOIST
      ?auto_35000 - SURFACE
      ?auto_35005 - PLACE
      ?auto_35006 - HOIST
      ?auto_34997 - SURFACE
      ?auto_35002 - SURFACE
      ?auto_35004 - SURFACE
      ?auto_34999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35001 ?auto_35003 ) ( IS-CRATE ?auto_34995 ) ( not ( = ?auto_34994 ?auto_34995 ) ) ( not ( = ?auto_34993 ?auto_34994 ) ) ( not ( = ?auto_34993 ?auto_34995 ) ) ( not ( = ?auto_34998 ?auto_35003 ) ) ( HOIST-AT ?auto_34996 ?auto_34998 ) ( not ( = ?auto_35001 ?auto_34996 ) ) ( SURFACE-AT ?auto_34995 ?auto_34998 ) ( ON ?auto_34995 ?auto_35000 ) ( CLEAR ?auto_34995 ) ( not ( = ?auto_34994 ?auto_35000 ) ) ( not ( = ?auto_34995 ?auto_35000 ) ) ( not ( = ?auto_34993 ?auto_35000 ) ) ( IS-CRATE ?auto_34994 ) ( not ( = ?auto_35005 ?auto_35003 ) ) ( not ( = ?auto_34998 ?auto_35005 ) ) ( HOIST-AT ?auto_35006 ?auto_35005 ) ( not ( = ?auto_35001 ?auto_35006 ) ) ( not ( = ?auto_34996 ?auto_35006 ) ) ( AVAILABLE ?auto_35006 ) ( SURFACE-AT ?auto_34994 ?auto_35005 ) ( ON ?auto_34994 ?auto_34997 ) ( CLEAR ?auto_34994 ) ( not ( = ?auto_34994 ?auto_34997 ) ) ( not ( = ?auto_34995 ?auto_34997 ) ) ( not ( = ?auto_34993 ?auto_34997 ) ) ( not ( = ?auto_35000 ?auto_34997 ) ) ( SURFACE-AT ?auto_35002 ?auto_35003 ) ( CLEAR ?auto_35002 ) ( IS-CRATE ?auto_34993 ) ( not ( = ?auto_35002 ?auto_34993 ) ) ( not ( = ?auto_34994 ?auto_35002 ) ) ( not ( = ?auto_34995 ?auto_35002 ) ) ( not ( = ?auto_35000 ?auto_35002 ) ) ( not ( = ?auto_34997 ?auto_35002 ) ) ( AVAILABLE ?auto_35001 ) ( AVAILABLE ?auto_34996 ) ( SURFACE-AT ?auto_34993 ?auto_34998 ) ( ON ?auto_34993 ?auto_35004 ) ( CLEAR ?auto_34993 ) ( not ( = ?auto_34994 ?auto_35004 ) ) ( not ( = ?auto_34995 ?auto_35004 ) ) ( not ( = ?auto_34993 ?auto_35004 ) ) ( not ( = ?auto_35000 ?auto_35004 ) ) ( not ( = ?auto_34997 ?auto_35004 ) ) ( not ( = ?auto_35002 ?auto_35004 ) ) ( TRUCK-AT ?auto_34999 ?auto_35003 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34994 ?auto_34995 )
      ( MAKE-2CRATE-VERIFY ?auto_34993 ?auto_34994 ?auto_34995 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35007 - SURFACE
      ?auto_35008 - SURFACE
      ?auto_35009 - SURFACE
      ?auto_35010 - SURFACE
    )
    :vars
    (
      ?auto_35012 - HOIST
      ?auto_35011 - PLACE
      ?auto_35014 - PLACE
      ?auto_35013 - HOIST
      ?auto_35019 - SURFACE
      ?auto_35017 - PLACE
      ?auto_35016 - HOIST
      ?auto_35020 - SURFACE
      ?auto_35015 - SURFACE
      ?auto_35018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35012 ?auto_35011 ) ( IS-CRATE ?auto_35010 ) ( not ( = ?auto_35009 ?auto_35010 ) ) ( not ( = ?auto_35008 ?auto_35009 ) ) ( not ( = ?auto_35008 ?auto_35010 ) ) ( not ( = ?auto_35014 ?auto_35011 ) ) ( HOIST-AT ?auto_35013 ?auto_35014 ) ( not ( = ?auto_35012 ?auto_35013 ) ) ( SURFACE-AT ?auto_35010 ?auto_35014 ) ( ON ?auto_35010 ?auto_35019 ) ( CLEAR ?auto_35010 ) ( not ( = ?auto_35009 ?auto_35019 ) ) ( not ( = ?auto_35010 ?auto_35019 ) ) ( not ( = ?auto_35008 ?auto_35019 ) ) ( IS-CRATE ?auto_35009 ) ( not ( = ?auto_35017 ?auto_35011 ) ) ( not ( = ?auto_35014 ?auto_35017 ) ) ( HOIST-AT ?auto_35016 ?auto_35017 ) ( not ( = ?auto_35012 ?auto_35016 ) ) ( not ( = ?auto_35013 ?auto_35016 ) ) ( AVAILABLE ?auto_35016 ) ( SURFACE-AT ?auto_35009 ?auto_35017 ) ( ON ?auto_35009 ?auto_35020 ) ( CLEAR ?auto_35009 ) ( not ( = ?auto_35009 ?auto_35020 ) ) ( not ( = ?auto_35010 ?auto_35020 ) ) ( not ( = ?auto_35008 ?auto_35020 ) ) ( not ( = ?auto_35019 ?auto_35020 ) ) ( SURFACE-AT ?auto_35007 ?auto_35011 ) ( CLEAR ?auto_35007 ) ( IS-CRATE ?auto_35008 ) ( not ( = ?auto_35007 ?auto_35008 ) ) ( not ( = ?auto_35009 ?auto_35007 ) ) ( not ( = ?auto_35010 ?auto_35007 ) ) ( not ( = ?auto_35019 ?auto_35007 ) ) ( not ( = ?auto_35020 ?auto_35007 ) ) ( AVAILABLE ?auto_35012 ) ( AVAILABLE ?auto_35013 ) ( SURFACE-AT ?auto_35008 ?auto_35014 ) ( ON ?auto_35008 ?auto_35015 ) ( CLEAR ?auto_35008 ) ( not ( = ?auto_35009 ?auto_35015 ) ) ( not ( = ?auto_35010 ?auto_35015 ) ) ( not ( = ?auto_35008 ?auto_35015 ) ) ( not ( = ?auto_35019 ?auto_35015 ) ) ( not ( = ?auto_35020 ?auto_35015 ) ) ( not ( = ?auto_35007 ?auto_35015 ) ) ( TRUCK-AT ?auto_35018 ?auto_35011 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35008 ?auto_35009 ?auto_35010 )
      ( MAKE-3CRATE-VERIFY ?auto_35007 ?auto_35008 ?auto_35009 ?auto_35010 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35021 - SURFACE
      ?auto_35022 - SURFACE
      ?auto_35023 - SURFACE
      ?auto_35024 - SURFACE
      ?auto_35025 - SURFACE
    )
    :vars
    (
      ?auto_35027 - HOIST
      ?auto_35026 - PLACE
      ?auto_35029 - PLACE
      ?auto_35028 - HOIST
      ?auto_35034 - SURFACE
      ?auto_35032 - PLACE
      ?auto_35031 - HOIST
      ?auto_35035 - SURFACE
      ?auto_35030 - SURFACE
      ?auto_35033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35027 ?auto_35026 ) ( IS-CRATE ?auto_35025 ) ( not ( = ?auto_35024 ?auto_35025 ) ) ( not ( = ?auto_35023 ?auto_35024 ) ) ( not ( = ?auto_35023 ?auto_35025 ) ) ( not ( = ?auto_35029 ?auto_35026 ) ) ( HOIST-AT ?auto_35028 ?auto_35029 ) ( not ( = ?auto_35027 ?auto_35028 ) ) ( SURFACE-AT ?auto_35025 ?auto_35029 ) ( ON ?auto_35025 ?auto_35034 ) ( CLEAR ?auto_35025 ) ( not ( = ?auto_35024 ?auto_35034 ) ) ( not ( = ?auto_35025 ?auto_35034 ) ) ( not ( = ?auto_35023 ?auto_35034 ) ) ( IS-CRATE ?auto_35024 ) ( not ( = ?auto_35032 ?auto_35026 ) ) ( not ( = ?auto_35029 ?auto_35032 ) ) ( HOIST-AT ?auto_35031 ?auto_35032 ) ( not ( = ?auto_35027 ?auto_35031 ) ) ( not ( = ?auto_35028 ?auto_35031 ) ) ( AVAILABLE ?auto_35031 ) ( SURFACE-AT ?auto_35024 ?auto_35032 ) ( ON ?auto_35024 ?auto_35035 ) ( CLEAR ?auto_35024 ) ( not ( = ?auto_35024 ?auto_35035 ) ) ( not ( = ?auto_35025 ?auto_35035 ) ) ( not ( = ?auto_35023 ?auto_35035 ) ) ( not ( = ?auto_35034 ?auto_35035 ) ) ( SURFACE-AT ?auto_35022 ?auto_35026 ) ( CLEAR ?auto_35022 ) ( IS-CRATE ?auto_35023 ) ( not ( = ?auto_35022 ?auto_35023 ) ) ( not ( = ?auto_35024 ?auto_35022 ) ) ( not ( = ?auto_35025 ?auto_35022 ) ) ( not ( = ?auto_35034 ?auto_35022 ) ) ( not ( = ?auto_35035 ?auto_35022 ) ) ( AVAILABLE ?auto_35027 ) ( AVAILABLE ?auto_35028 ) ( SURFACE-AT ?auto_35023 ?auto_35029 ) ( ON ?auto_35023 ?auto_35030 ) ( CLEAR ?auto_35023 ) ( not ( = ?auto_35024 ?auto_35030 ) ) ( not ( = ?auto_35025 ?auto_35030 ) ) ( not ( = ?auto_35023 ?auto_35030 ) ) ( not ( = ?auto_35034 ?auto_35030 ) ) ( not ( = ?auto_35035 ?auto_35030 ) ) ( not ( = ?auto_35022 ?auto_35030 ) ) ( TRUCK-AT ?auto_35033 ?auto_35026 ) ( ON ?auto_35022 ?auto_35021 ) ( not ( = ?auto_35021 ?auto_35022 ) ) ( not ( = ?auto_35021 ?auto_35023 ) ) ( not ( = ?auto_35021 ?auto_35024 ) ) ( not ( = ?auto_35021 ?auto_35025 ) ) ( not ( = ?auto_35021 ?auto_35034 ) ) ( not ( = ?auto_35021 ?auto_35035 ) ) ( not ( = ?auto_35021 ?auto_35030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35023 ?auto_35024 ?auto_35025 )
      ( MAKE-4CRATE-VERIFY ?auto_35021 ?auto_35022 ?auto_35023 ?auto_35024 ?auto_35025 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35036 - SURFACE
      ?auto_35037 - SURFACE
      ?auto_35038 - SURFACE
      ?auto_35039 - SURFACE
      ?auto_35040 - SURFACE
      ?auto_35041 - SURFACE
    )
    :vars
    (
      ?auto_35043 - HOIST
      ?auto_35042 - PLACE
      ?auto_35045 - PLACE
      ?auto_35044 - HOIST
      ?auto_35050 - SURFACE
      ?auto_35048 - PLACE
      ?auto_35047 - HOIST
      ?auto_35051 - SURFACE
      ?auto_35046 - SURFACE
      ?auto_35049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35043 ?auto_35042 ) ( IS-CRATE ?auto_35041 ) ( not ( = ?auto_35040 ?auto_35041 ) ) ( not ( = ?auto_35039 ?auto_35040 ) ) ( not ( = ?auto_35039 ?auto_35041 ) ) ( not ( = ?auto_35045 ?auto_35042 ) ) ( HOIST-AT ?auto_35044 ?auto_35045 ) ( not ( = ?auto_35043 ?auto_35044 ) ) ( SURFACE-AT ?auto_35041 ?auto_35045 ) ( ON ?auto_35041 ?auto_35050 ) ( CLEAR ?auto_35041 ) ( not ( = ?auto_35040 ?auto_35050 ) ) ( not ( = ?auto_35041 ?auto_35050 ) ) ( not ( = ?auto_35039 ?auto_35050 ) ) ( IS-CRATE ?auto_35040 ) ( not ( = ?auto_35048 ?auto_35042 ) ) ( not ( = ?auto_35045 ?auto_35048 ) ) ( HOIST-AT ?auto_35047 ?auto_35048 ) ( not ( = ?auto_35043 ?auto_35047 ) ) ( not ( = ?auto_35044 ?auto_35047 ) ) ( AVAILABLE ?auto_35047 ) ( SURFACE-AT ?auto_35040 ?auto_35048 ) ( ON ?auto_35040 ?auto_35051 ) ( CLEAR ?auto_35040 ) ( not ( = ?auto_35040 ?auto_35051 ) ) ( not ( = ?auto_35041 ?auto_35051 ) ) ( not ( = ?auto_35039 ?auto_35051 ) ) ( not ( = ?auto_35050 ?auto_35051 ) ) ( SURFACE-AT ?auto_35038 ?auto_35042 ) ( CLEAR ?auto_35038 ) ( IS-CRATE ?auto_35039 ) ( not ( = ?auto_35038 ?auto_35039 ) ) ( not ( = ?auto_35040 ?auto_35038 ) ) ( not ( = ?auto_35041 ?auto_35038 ) ) ( not ( = ?auto_35050 ?auto_35038 ) ) ( not ( = ?auto_35051 ?auto_35038 ) ) ( AVAILABLE ?auto_35043 ) ( AVAILABLE ?auto_35044 ) ( SURFACE-AT ?auto_35039 ?auto_35045 ) ( ON ?auto_35039 ?auto_35046 ) ( CLEAR ?auto_35039 ) ( not ( = ?auto_35040 ?auto_35046 ) ) ( not ( = ?auto_35041 ?auto_35046 ) ) ( not ( = ?auto_35039 ?auto_35046 ) ) ( not ( = ?auto_35050 ?auto_35046 ) ) ( not ( = ?auto_35051 ?auto_35046 ) ) ( not ( = ?auto_35038 ?auto_35046 ) ) ( TRUCK-AT ?auto_35049 ?auto_35042 ) ( ON ?auto_35037 ?auto_35036 ) ( ON ?auto_35038 ?auto_35037 ) ( not ( = ?auto_35036 ?auto_35037 ) ) ( not ( = ?auto_35036 ?auto_35038 ) ) ( not ( = ?auto_35036 ?auto_35039 ) ) ( not ( = ?auto_35036 ?auto_35040 ) ) ( not ( = ?auto_35036 ?auto_35041 ) ) ( not ( = ?auto_35036 ?auto_35050 ) ) ( not ( = ?auto_35036 ?auto_35051 ) ) ( not ( = ?auto_35036 ?auto_35046 ) ) ( not ( = ?auto_35037 ?auto_35038 ) ) ( not ( = ?auto_35037 ?auto_35039 ) ) ( not ( = ?auto_35037 ?auto_35040 ) ) ( not ( = ?auto_35037 ?auto_35041 ) ) ( not ( = ?auto_35037 ?auto_35050 ) ) ( not ( = ?auto_35037 ?auto_35051 ) ) ( not ( = ?auto_35037 ?auto_35046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35039 ?auto_35040 ?auto_35041 )
      ( MAKE-5CRATE-VERIFY ?auto_35036 ?auto_35037 ?auto_35038 ?auto_35039 ?auto_35040 ?auto_35041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35052 - SURFACE
      ?auto_35053 - SURFACE
    )
    :vars
    (
      ?auto_35055 - HOIST
      ?auto_35054 - PLACE
      ?auto_35064 - SURFACE
      ?auto_35057 - PLACE
      ?auto_35056 - HOIST
      ?auto_35063 - SURFACE
      ?auto_35060 - PLACE
      ?auto_35059 - HOIST
      ?auto_35065 - SURFACE
      ?auto_35061 - SURFACE
      ?auto_35058 - SURFACE
      ?auto_35062 - TRUCK
      ?auto_35066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35055 ?auto_35054 ) ( IS-CRATE ?auto_35053 ) ( not ( = ?auto_35052 ?auto_35053 ) ) ( not ( = ?auto_35064 ?auto_35052 ) ) ( not ( = ?auto_35064 ?auto_35053 ) ) ( not ( = ?auto_35057 ?auto_35054 ) ) ( HOIST-AT ?auto_35056 ?auto_35057 ) ( not ( = ?auto_35055 ?auto_35056 ) ) ( SURFACE-AT ?auto_35053 ?auto_35057 ) ( ON ?auto_35053 ?auto_35063 ) ( CLEAR ?auto_35053 ) ( not ( = ?auto_35052 ?auto_35063 ) ) ( not ( = ?auto_35053 ?auto_35063 ) ) ( not ( = ?auto_35064 ?auto_35063 ) ) ( IS-CRATE ?auto_35052 ) ( not ( = ?auto_35060 ?auto_35054 ) ) ( not ( = ?auto_35057 ?auto_35060 ) ) ( HOIST-AT ?auto_35059 ?auto_35060 ) ( not ( = ?auto_35055 ?auto_35059 ) ) ( not ( = ?auto_35056 ?auto_35059 ) ) ( AVAILABLE ?auto_35059 ) ( SURFACE-AT ?auto_35052 ?auto_35060 ) ( ON ?auto_35052 ?auto_35065 ) ( CLEAR ?auto_35052 ) ( not ( = ?auto_35052 ?auto_35065 ) ) ( not ( = ?auto_35053 ?auto_35065 ) ) ( not ( = ?auto_35064 ?auto_35065 ) ) ( not ( = ?auto_35063 ?auto_35065 ) ) ( IS-CRATE ?auto_35064 ) ( not ( = ?auto_35061 ?auto_35064 ) ) ( not ( = ?auto_35052 ?auto_35061 ) ) ( not ( = ?auto_35053 ?auto_35061 ) ) ( not ( = ?auto_35063 ?auto_35061 ) ) ( not ( = ?auto_35065 ?auto_35061 ) ) ( AVAILABLE ?auto_35056 ) ( SURFACE-AT ?auto_35064 ?auto_35057 ) ( ON ?auto_35064 ?auto_35058 ) ( CLEAR ?auto_35064 ) ( not ( = ?auto_35052 ?auto_35058 ) ) ( not ( = ?auto_35053 ?auto_35058 ) ) ( not ( = ?auto_35064 ?auto_35058 ) ) ( not ( = ?auto_35063 ?auto_35058 ) ) ( not ( = ?auto_35065 ?auto_35058 ) ) ( not ( = ?auto_35061 ?auto_35058 ) ) ( TRUCK-AT ?auto_35062 ?auto_35054 ) ( SURFACE-AT ?auto_35066 ?auto_35054 ) ( CLEAR ?auto_35066 ) ( LIFTING ?auto_35055 ?auto_35061 ) ( IS-CRATE ?auto_35061 ) ( not ( = ?auto_35066 ?auto_35061 ) ) ( not ( = ?auto_35052 ?auto_35066 ) ) ( not ( = ?auto_35053 ?auto_35066 ) ) ( not ( = ?auto_35064 ?auto_35066 ) ) ( not ( = ?auto_35063 ?auto_35066 ) ) ( not ( = ?auto_35065 ?auto_35066 ) ) ( not ( = ?auto_35058 ?auto_35066 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35066 ?auto_35061 )
      ( MAKE-2CRATE ?auto_35064 ?auto_35052 ?auto_35053 )
      ( MAKE-1CRATE-VERIFY ?auto_35052 ?auto_35053 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35067 - SURFACE
      ?auto_35068 - SURFACE
      ?auto_35069 - SURFACE
    )
    :vars
    (
      ?auto_35075 - HOIST
      ?auto_35077 - PLACE
      ?auto_35070 - PLACE
      ?auto_35072 - HOIST
      ?auto_35078 - SURFACE
      ?auto_35071 - PLACE
      ?auto_35081 - HOIST
      ?auto_35074 - SURFACE
      ?auto_35079 - SURFACE
      ?auto_35080 - SURFACE
      ?auto_35076 - TRUCK
      ?auto_35073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35075 ?auto_35077 ) ( IS-CRATE ?auto_35069 ) ( not ( = ?auto_35068 ?auto_35069 ) ) ( not ( = ?auto_35067 ?auto_35068 ) ) ( not ( = ?auto_35067 ?auto_35069 ) ) ( not ( = ?auto_35070 ?auto_35077 ) ) ( HOIST-AT ?auto_35072 ?auto_35070 ) ( not ( = ?auto_35075 ?auto_35072 ) ) ( SURFACE-AT ?auto_35069 ?auto_35070 ) ( ON ?auto_35069 ?auto_35078 ) ( CLEAR ?auto_35069 ) ( not ( = ?auto_35068 ?auto_35078 ) ) ( not ( = ?auto_35069 ?auto_35078 ) ) ( not ( = ?auto_35067 ?auto_35078 ) ) ( IS-CRATE ?auto_35068 ) ( not ( = ?auto_35071 ?auto_35077 ) ) ( not ( = ?auto_35070 ?auto_35071 ) ) ( HOIST-AT ?auto_35081 ?auto_35071 ) ( not ( = ?auto_35075 ?auto_35081 ) ) ( not ( = ?auto_35072 ?auto_35081 ) ) ( AVAILABLE ?auto_35081 ) ( SURFACE-AT ?auto_35068 ?auto_35071 ) ( ON ?auto_35068 ?auto_35074 ) ( CLEAR ?auto_35068 ) ( not ( = ?auto_35068 ?auto_35074 ) ) ( not ( = ?auto_35069 ?auto_35074 ) ) ( not ( = ?auto_35067 ?auto_35074 ) ) ( not ( = ?auto_35078 ?auto_35074 ) ) ( IS-CRATE ?auto_35067 ) ( not ( = ?auto_35079 ?auto_35067 ) ) ( not ( = ?auto_35068 ?auto_35079 ) ) ( not ( = ?auto_35069 ?auto_35079 ) ) ( not ( = ?auto_35078 ?auto_35079 ) ) ( not ( = ?auto_35074 ?auto_35079 ) ) ( AVAILABLE ?auto_35072 ) ( SURFACE-AT ?auto_35067 ?auto_35070 ) ( ON ?auto_35067 ?auto_35080 ) ( CLEAR ?auto_35067 ) ( not ( = ?auto_35068 ?auto_35080 ) ) ( not ( = ?auto_35069 ?auto_35080 ) ) ( not ( = ?auto_35067 ?auto_35080 ) ) ( not ( = ?auto_35078 ?auto_35080 ) ) ( not ( = ?auto_35074 ?auto_35080 ) ) ( not ( = ?auto_35079 ?auto_35080 ) ) ( TRUCK-AT ?auto_35076 ?auto_35077 ) ( SURFACE-AT ?auto_35073 ?auto_35077 ) ( CLEAR ?auto_35073 ) ( LIFTING ?auto_35075 ?auto_35079 ) ( IS-CRATE ?auto_35079 ) ( not ( = ?auto_35073 ?auto_35079 ) ) ( not ( = ?auto_35068 ?auto_35073 ) ) ( not ( = ?auto_35069 ?auto_35073 ) ) ( not ( = ?auto_35067 ?auto_35073 ) ) ( not ( = ?auto_35078 ?auto_35073 ) ) ( not ( = ?auto_35074 ?auto_35073 ) ) ( not ( = ?auto_35080 ?auto_35073 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35068 ?auto_35069 )
      ( MAKE-2CRATE-VERIFY ?auto_35067 ?auto_35068 ?auto_35069 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35082 - SURFACE
      ?auto_35083 - SURFACE
      ?auto_35084 - SURFACE
      ?auto_35085 - SURFACE
    )
    :vars
    (
      ?auto_35093 - HOIST
      ?auto_35088 - PLACE
      ?auto_35089 - PLACE
      ?auto_35094 - HOIST
      ?auto_35086 - SURFACE
      ?auto_35092 - PLACE
      ?auto_35096 - HOIST
      ?auto_35090 - SURFACE
      ?auto_35095 - SURFACE
      ?auto_35091 - TRUCK
      ?auto_35087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35093 ?auto_35088 ) ( IS-CRATE ?auto_35085 ) ( not ( = ?auto_35084 ?auto_35085 ) ) ( not ( = ?auto_35083 ?auto_35084 ) ) ( not ( = ?auto_35083 ?auto_35085 ) ) ( not ( = ?auto_35089 ?auto_35088 ) ) ( HOIST-AT ?auto_35094 ?auto_35089 ) ( not ( = ?auto_35093 ?auto_35094 ) ) ( SURFACE-AT ?auto_35085 ?auto_35089 ) ( ON ?auto_35085 ?auto_35086 ) ( CLEAR ?auto_35085 ) ( not ( = ?auto_35084 ?auto_35086 ) ) ( not ( = ?auto_35085 ?auto_35086 ) ) ( not ( = ?auto_35083 ?auto_35086 ) ) ( IS-CRATE ?auto_35084 ) ( not ( = ?auto_35092 ?auto_35088 ) ) ( not ( = ?auto_35089 ?auto_35092 ) ) ( HOIST-AT ?auto_35096 ?auto_35092 ) ( not ( = ?auto_35093 ?auto_35096 ) ) ( not ( = ?auto_35094 ?auto_35096 ) ) ( AVAILABLE ?auto_35096 ) ( SURFACE-AT ?auto_35084 ?auto_35092 ) ( ON ?auto_35084 ?auto_35090 ) ( CLEAR ?auto_35084 ) ( not ( = ?auto_35084 ?auto_35090 ) ) ( not ( = ?auto_35085 ?auto_35090 ) ) ( not ( = ?auto_35083 ?auto_35090 ) ) ( not ( = ?auto_35086 ?auto_35090 ) ) ( IS-CRATE ?auto_35083 ) ( not ( = ?auto_35082 ?auto_35083 ) ) ( not ( = ?auto_35084 ?auto_35082 ) ) ( not ( = ?auto_35085 ?auto_35082 ) ) ( not ( = ?auto_35086 ?auto_35082 ) ) ( not ( = ?auto_35090 ?auto_35082 ) ) ( AVAILABLE ?auto_35094 ) ( SURFACE-AT ?auto_35083 ?auto_35089 ) ( ON ?auto_35083 ?auto_35095 ) ( CLEAR ?auto_35083 ) ( not ( = ?auto_35084 ?auto_35095 ) ) ( not ( = ?auto_35085 ?auto_35095 ) ) ( not ( = ?auto_35083 ?auto_35095 ) ) ( not ( = ?auto_35086 ?auto_35095 ) ) ( not ( = ?auto_35090 ?auto_35095 ) ) ( not ( = ?auto_35082 ?auto_35095 ) ) ( TRUCK-AT ?auto_35091 ?auto_35088 ) ( SURFACE-AT ?auto_35087 ?auto_35088 ) ( CLEAR ?auto_35087 ) ( LIFTING ?auto_35093 ?auto_35082 ) ( IS-CRATE ?auto_35082 ) ( not ( = ?auto_35087 ?auto_35082 ) ) ( not ( = ?auto_35084 ?auto_35087 ) ) ( not ( = ?auto_35085 ?auto_35087 ) ) ( not ( = ?auto_35083 ?auto_35087 ) ) ( not ( = ?auto_35086 ?auto_35087 ) ) ( not ( = ?auto_35090 ?auto_35087 ) ) ( not ( = ?auto_35095 ?auto_35087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35083 ?auto_35084 ?auto_35085 )
      ( MAKE-3CRATE-VERIFY ?auto_35082 ?auto_35083 ?auto_35084 ?auto_35085 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35097 - SURFACE
      ?auto_35098 - SURFACE
      ?auto_35099 - SURFACE
      ?auto_35100 - SURFACE
      ?auto_35101 - SURFACE
    )
    :vars
    (
      ?auto_35108 - HOIST
      ?auto_35103 - PLACE
      ?auto_35104 - PLACE
      ?auto_35109 - HOIST
      ?auto_35102 - SURFACE
      ?auto_35107 - PLACE
      ?auto_35111 - HOIST
      ?auto_35105 - SURFACE
      ?auto_35110 - SURFACE
      ?auto_35106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35108 ?auto_35103 ) ( IS-CRATE ?auto_35101 ) ( not ( = ?auto_35100 ?auto_35101 ) ) ( not ( = ?auto_35099 ?auto_35100 ) ) ( not ( = ?auto_35099 ?auto_35101 ) ) ( not ( = ?auto_35104 ?auto_35103 ) ) ( HOIST-AT ?auto_35109 ?auto_35104 ) ( not ( = ?auto_35108 ?auto_35109 ) ) ( SURFACE-AT ?auto_35101 ?auto_35104 ) ( ON ?auto_35101 ?auto_35102 ) ( CLEAR ?auto_35101 ) ( not ( = ?auto_35100 ?auto_35102 ) ) ( not ( = ?auto_35101 ?auto_35102 ) ) ( not ( = ?auto_35099 ?auto_35102 ) ) ( IS-CRATE ?auto_35100 ) ( not ( = ?auto_35107 ?auto_35103 ) ) ( not ( = ?auto_35104 ?auto_35107 ) ) ( HOIST-AT ?auto_35111 ?auto_35107 ) ( not ( = ?auto_35108 ?auto_35111 ) ) ( not ( = ?auto_35109 ?auto_35111 ) ) ( AVAILABLE ?auto_35111 ) ( SURFACE-AT ?auto_35100 ?auto_35107 ) ( ON ?auto_35100 ?auto_35105 ) ( CLEAR ?auto_35100 ) ( not ( = ?auto_35100 ?auto_35105 ) ) ( not ( = ?auto_35101 ?auto_35105 ) ) ( not ( = ?auto_35099 ?auto_35105 ) ) ( not ( = ?auto_35102 ?auto_35105 ) ) ( IS-CRATE ?auto_35099 ) ( not ( = ?auto_35098 ?auto_35099 ) ) ( not ( = ?auto_35100 ?auto_35098 ) ) ( not ( = ?auto_35101 ?auto_35098 ) ) ( not ( = ?auto_35102 ?auto_35098 ) ) ( not ( = ?auto_35105 ?auto_35098 ) ) ( AVAILABLE ?auto_35109 ) ( SURFACE-AT ?auto_35099 ?auto_35104 ) ( ON ?auto_35099 ?auto_35110 ) ( CLEAR ?auto_35099 ) ( not ( = ?auto_35100 ?auto_35110 ) ) ( not ( = ?auto_35101 ?auto_35110 ) ) ( not ( = ?auto_35099 ?auto_35110 ) ) ( not ( = ?auto_35102 ?auto_35110 ) ) ( not ( = ?auto_35105 ?auto_35110 ) ) ( not ( = ?auto_35098 ?auto_35110 ) ) ( TRUCK-AT ?auto_35106 ?auto_35103 ) ( SURFACE-AT ?auto_35097 ?auto_35103 ) ( CLEAR ?auto_35097 ) ( LIFTING ?auto_35108 ?auto_35098 ) ( IS-CRATE ?auto_35098 ) ( not ( = ?auto_35097 ?auto_35098 ) ) ( not ( = ?auto_35100 ?auto_35097 ) ) ( not ( = ?auto_35101 ?auto_35097 ) ) ( not ( = ?auto_35099 ?auto_35097 ) ) ( not ( = ?auto_35102 ?auto_35097 ) ) ( not ( = ?auto_35105 ?auto_35097 ) ) ( not ( = ?auto_35110 ?auto_35097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35099 ?auto_35100 ?auto_35101 )
      ( MAKE-4CRATE-VERIFY ?auto_35097 ?auto_35098 ?auto_35099 ?auto_35100 ?auto_35101 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35112 - SURFACE
      ?auto_35113 - SURFACE
      ?auto_35114 - SURFACE
      ?auto_35115 - SURFACE
      ?auto_35116 - SURFACE
      ?auto_35117 - SURFACE
    )
    :vars
    (
      ?auto_35124 - HOIST
      ?auto_35119 - PLACE
      ?auto_35120 - PLACE
      ?auto_35125 - HOIST
      ?auto_35118 - SURFACE
      ?auto_35123 - PLACE
      ?auto_35127 - HOIST
      ?auto_35121 - SURFACE
      ?auto_35126 - SURFACE
      ?auto_35122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35124 ?auto_35119 ) ( IS-CRATE ?auto_35117 ) ( not ( = ?auto_35116 ?auto_35117 ) ) ( not ( = ?auto_35115 ?auto_35116 ) ) ( not ( = ?auto_35115 ?auto_35117 ) ) ( not ( = ?auto_35120 ?auto_35119 ) ) ( HOIST-AT ?auto_35125 ?auto_35120 ) ( not ( = ?auto_35124 ?auto_35125 ) ) ( SURFACE-AT ?auto_35117 ?auto_35120 ) ( ON ?auto_35117 ?auto_35118 ) ( CLEAR ?auto_35117 ) ( not ( = ?auto_35116 ?auto_35118 ) ) ( not ( = ?auto_35117 ?auto_35118 ) ) ( not ( = ?auto_35115 ?auto_35118 ) ) ( IS-CRATE ?auto_35116 ) ( not ( = ?auto_35123 ?auto_35119 ) ) ( not ( = ?auto_35120 ?auto_35123 ) ) ( HOIST-AT ?auto_35127 ?auto_35123 ) ( not ( = ?auto_35124 ?auto_35127 ) ) ( not ( = ?auto_35125 ?auto_35127 ) ) ( AVAILABLE ?auto_35127 ) ( SURFACE-AT ?auto_35116 ?auto_35123 ) ( ON ?auto_35116 ?auto_35121 ) ( CLEAR ?auto_35116 ) ( not ( = ?auto_35116 ?auto_35121 ) ) ( not ( = ?auto_35117 ?auto_35121 ) ) ( not ( = ?auto_35115 ?auto_35121 ) ) ( not ( = ?auto_35118 ?auto_35121 ) ) ( IS-CRATE ?auto_35115 ) ( not ( = ?auto_35114 ?auto_35115 ) ) ( not ( = ?auto_35116 ?auto_35114 ) ) ( not ( = ?auto_35117 ?auto_35114 ) ) ( not ( = ?auto_35118 ?auto_35114 ) ) ( not ( = ?auto_35121 ?auto_35114 ) ) ( AVAILABLE ?auto_35125 ) ( SURFACE-AT ?auto_35115 ?auto_35120 ) ( ON ?auto_35115 ?auto_35126 ) ( CLEAR ?auto_35115 ) ( not ( = ?auto_35116 ?auto_35126 ) ) ( not ( = ?auto_35117 ?auto_35126 ) ) ( not ( = ?auto_35115 ?auto_35126 ) ) ( not ( = ?auto_35118 ?auto_35126 ) ) ( not ( = ?auto_35121 ?auto_35126 ) ) ( not ( = ?auto_35114 ?auto_35126 ) ) ( TRUCK-AT ?auto_35122 ?auto_35119 ) ( SURFACE-AT ?auto_35113 ?auto_35119 ) ( CLEAR ?auto_35113 ) ( LIFTING ?auto_35124 ?auto_35114 ) ( IS-CRATE ?auto_35114 ) ( not ( = ?auto_35113 ?auto_35114 ) ) ( not ( = ?auto_35116 ?auto_35113 ) ) ( not ( = ?auto_35117 ?auto_35113 ) ) ( not ( = ?auto_35115 ?auto_35113 ) ) ( not ( = ?auto_35118 ?auto_35113 ) ) ( not ( = ?auto_35121 ?auto_35113 ) ) ( not ( = ?auto_35126 ?auto_35113 ) ) ( ON ?auto_35113 ?auto_35112 ) ( not ( = ?auto_35112 ?auto_35113 ) ) ( not ( = ?auto_35112 ?auto_35114 ) ) ( not ( = ?auto_35112 ?auto_35115 ) ) ( not ( = ?auto_35112 ?auto_35116 ) ) ( not ( = ?auto_35112 ?auto_35117 ) ) ( not ( = ?auto_35112 ?auto_35118 ) ) ( not ( = ?auto_35112 ?auto_35121 ) ) ( not ( = ?auto_35112 ?auto_35126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35115 ?auto_35116 ?auto_35117 )
      ( MAKE-5CRATE-VERIFY ?auto_35112 ?auto_35113 ?auto_35114 ?auto_35115 ?auto_35116 ?auto_35117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35128 - SURFACE
      ?auto_35129 - SURFACE
    )
    :vars
    (
      ?auto_35138 - HOIST
      ?auto_35133 - PLACE
      ?auto_35142 - SURFACE
      ?auto_35134 - PLACE
      ?auto_35139 - HOIST
      ?auto_35131 - SURFACE
      ?auto_35137 - PLACE
      ?auto_35141 - HOIST
      ?auto_35135 - SURFACE
      ?auto_35130 - SURFACE
      ?auto_35140 - SURFACE
      ?auto_35136 - TRUCK
      ?auto_35132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35138 ?auto_35133 ) ( IS-CRATE ?auto_35129 ) ( not ( = ?auto_35128 ?auto_35129 ) ) ( not ( = ?auto_35142 ?auto_35128 ) ) ( not ( = ?auto_35142 ?auto_35129 ) ) ( not ( = ?auto_35134 ?auto_35133 ) ) ( HOIST-AT ?auto_35139 ?auto_35134 ) ( not ( = ?auto_35138 ?auto_35139 ) ) ( SURFACE-AT ?auto_35129 ?auto_35134 ) ( ON ?auto_35129 ?auto_35131 ) ( CLEAR ?auto_35129 ) ( not ( = ?auto_35128 ?auto_35131 ) ) ( not ( = ?auto_35129 ?auto_35131 ) ) ( not ( = ?auto_35142 ?auto_35131 ) ) ( IS-CRATE ?auto_35128 ) ( not ( = ?auto_35137 ?auto_35133 ) ) ( not ( = ?auto_35134 ?auto_35137 ) ) ( HOIST-AT ?auto_35141 ?auto_35137 ) ( not ( = ?auto_35138 ?auto_35141 ) ) ( not ( = ?auto_35139 ?auto_35141 ) ) ( AVAILABLE ?auto_35141 ) ( SURFACE-AT ?auto_35128 ?auto_35137 ) ( ON ?auto_35128 ?auto_35135 ) ( CLEAR ?auto_35128 ) ( not ( = ?auto_35128 ?auto_35135 ) ) ( not ( = ?auto_35129 ?auto_35135 ) ) ( not ( = ?auto_35142 ?auto_35135 ) ) ( not ( = ?auto_35131 ?auto_35135 ) ) ( IS-CRATE ?auto_35142 ) ( not ( = ?auto_35130 ?auto_35142 ) ) ( not ( = ?auto_35128 ?auto_35130 ) ) ( not ( = ?auto_35129 ?auto_35130 ) ) ( not ( = ?auto_35131 ?auto_35130 ) ) ( not ( = ?auto_35135 ?auto_35130 ) ) ( AVAILABLE ?auto_35139 ) ( SURFACE-AT ?auto_35142 ?auto_35134 ) ( ON ?auto_35142 ?auto_35140 ) ( CLEAR ?auto_35142 ) ( not ( = ?auto_35128 ?auto_35140 ) ) ( not ( = ?auto_35129 ?auto_35140 ) ) ( not ( = ?auto_35142 ?auto_35140 ) ) ( not ( = ?auto_35131 ?auto_35140 ) ) ( not ( = ?auto_35135 ?auto_35140 ) ) ( not ( = ?auto_35130 ?auto_35140 ) ) ( TRUCK-AT ?auto_35136 ?auto_35133 ) ( SURFACE-AT ?auto_35132 ?auto_35133 ) ( CLEAR ?auto_35132 ) ( IS-CRATE ?auto_35130 ) ( not ( = ?auto_35132 ?auto_35130 ) ) ( not ( = ?auto_35128 ?auto_35132 ) ) ( not ( = ?auto_35129 ?auto_35132 ) ) ( not ( = ?auto_35142 ?auto_35132 ) ) ( not ( = ?auto_35131 ?auto_35132 ) ) ( not ( = ?auto_35135 ?auto_35132 ) ) ( not ( = ?auto_35140 ?auto_35132 ) ) ( AVAILABLE ?auto_35138 ) ( IN ?auto_35130 ?auto_35136 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35138 ?auto_35130 ?auto_35136 ?auto_35133 )
      ( MAKE-2CRATE ?auto_35142 ?auto_35128 ?auto_35129 )
      ( MAKE-1CRATE-VERIFY ?auto_35128 ?auto_35129 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35143 - SURFACE
      ?auto_35144 - SURFACE
      ?auto_35145 - SURFACE
    )
    :vars
    (
      ?auto_35150 - HOIST
      ?auto_35147 - PLACE
      ?auto_35148 - PLACE
      ?auto_35153 - HOIST
      ?auto_35151 - SURFACE
      ?auto_35155 - PLACE
      ?auto_35154 - HOIST
      ?auto_35146 - SURFACE
      ?auto_35149 - SURFACE
      ?auto_35157 - SURFACE
      ?auto_35156 - TRUCK
      ?auto_35152 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35150 ?auto_35147 ) ( IS-CRATE ?auto_35145 ) ( not ( = ?auto_35144 ?auto_35145 ) ) ( not ( = ?auto_35143 ?auto_35144 ) ) ( not ( = ?auto_35143 ?auto_35145 ) ) ( not ( = ?auto_35148 ?auto_35147 ) ) ( HOIST-AT ?auto_35153 ?auto_35148 ) ( not ( = ?auto_35150 ?auto_35153 ) ) ( SURFACE-AT ?auto_35145 ?auto_35148 ) ( ON ?auto_35145 ?auto_35151 ) ( CLEAR ?auto_35145 ) ( not ( = ?auto_35144 ?auto_35151 ) ) ( not ( = ?auto_35145 ?auto_35151 ) ) ( not ( = ?auto_35143 ?auto_35151 ) ) ( IS-CRATE ?auto_35144 ) ( not ( = ?auto_35155 ?auto_35147 ) ) ( not ( = ?auto_35148 ?auto_35155 ) ) ( HOIST-AT ?auto_35154 ?auto_35155 ) ( not ( = ?auto_35150 ?auto_35154 ) ) ( not ( = ?auto_35153 ?auto_35154 ) ) ( AVAILABLE ?auto_35154 ) ( SURFACE-AT ?auto_35144 ?auto_35155 ) ( ON ?auto_35144 ?auto_35146 ) ( CLEAR ?auto_35144 ) ( not ( = ?auto_35144 ?auto_35146 ) ) ( not ( = ?auto_35145 ?auto_35146 ) ) ( not ( = ?auto_35143 ?auto_35146 ) ) ( not ( = ?auto_35151 ?auto_35146 ) ) ( IS-CRATE ?auto_35143 ) ( not ( = ?auto_35149 ?auto_35143 ) ) ( not ( = ?auto_35144 ?auto_35149 ) ) ( not ( = ?auto_35145 ?auto_35149 ) ) ( not ( = ?auto_35151 ?auto_35149 ) ) ( not ( = ?auto_35146 ?auto_35149 ) ) ( AVAILABLE ?auto_35153 ) ( SURFACE-AT ?auto_35143 ?auto_35148 ) ( ON ?auto_35143 ?auto_35157 ) ( CLEAR ?auto_35143 ) ( not ( = ?auto_35144 ?auto_35157 ) ) ( not ( = ?auto_35145 ?auto_35157 ) ) ( not ( = ?auto_35143 ?auto_35157 ) ) ( not ( = ?auto_35151 ?auto_35157 ) ) ( not ( = ?auto_35146 ?auto_35157 ) ) ( not ( = ?auto_35149 ?auto_35157 ) ) ( TRUCK-AT ?auto_35156 ?auto_35147 ) ( SURFACE-AT ?auto_35152 ?auto_35147 ) ( CLEAR ?auto_35152 ) ( IS-CRATE ?auto_35149 ) ( not ( = ?auto_35152 ?auto_35149 ) ) ( not ( = ?auto_35144 ?auto_35152 ) ) ( not ( = ?auto_35145 ?auto_35152 ) ) ( not ( = ?auto_35143 ?auto_35152 ) ) ( not ( = ?auto_35151 ?auto_35152 ) ) ( not ( = ?auto_35146 ?auto_35152 ) ) ( not ( = ?auto_35157 ?auto_35152 ) ) ( AVAILABLE ?auto_35150 ) ( IN ?auto_35149 ?auto_35156 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35144 ?auto_35145 )
      ( MAKE-2CRATE-VERIFY ?auto_35143 ?auto_35144 ?auto_35145 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35158 - SURFACE
      ?auto_35159 - SURFACE
      ?auto_35160 - SURFACE
      ?auto_35161 - SURFACE
    )
    :vars
    (
      ?auto_35168 - HOIST
      ?auto_35162 - PLACE
      ?auto_35163 - PLACE
      ?auto_35171 - HOIST
      ?auto_35166 - SURFACE
      ?auto_35167 - PLACE
      ?auto_35170 - HOIST
      ?auto_35165 - SURFACE
      ?auto_35169 - SURFACE
      ?auto_35164 - TRUCK
      ?auto_35172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35168 ?auto_35162 ) ( IS-CRATE ?auto_35161 ) ( not ( = ?auto_35160 ?auto_35161 ) ) ( not ( = ?auto_35159 ?auto_35160 ) ) ( not ( = ?auto_35159 ?auto_35161 ) ) ( not ( = ?auto_35163 ?auto_35162 ) ) ( HOIST-AT ?auto_35171 ?auto_35163 ) ( not ( = ?auto_35168 ?auto_35171 ) ) ( SURFACE-AT ?auto_35161 ?auto_35163 ) ( ON ?auto_35161 ?auto_35166 ) ( CLEAR ?auto_35161 ) ( not ( = ?auto_35160 ?auto_35166 ) ) ( not ( = ?auto_35161 ?auto_35166 ) ) ( not ( = ?auto_35159 ?auto_35166 ) ) ( IS-CRATE ?auto_35160 ) ( not ( = ?auto_35167 ?auto_35162 ) ) ( not ( = ?auto_35163 ?auto_35167 ) ) ( HOIST-AT ?auto_35170 ?auto_35167 ) ( not ( = ?auto_35168 ?auto_35170 ) ) ( not ( = ?auto_35171 ?auto_35170 ) ) ( AVAILABLE ?auto_35170 ) ( SURFACE-AT ?auto_35160 ?auto_35167 ) ( ON ?auto_35160 ?auto_35165 ) ( CLEAR ?auto_35160 ) ( not ( = ?auto_35160 ?auto_35165 ) ) ( not ( = ?auto_35161 ?auto_35165 ) ) ( not ( = ?auto_35159 ?auto_35165 ) ) ( not ( = ?auto_35166 ?auto_35165 ) ) ( IS-CRATE ?auto_35159 ) ( not ( = ?auto_35158 ?auto_35159 ) ) ( not ( = ?auto_35160 ?auto_35158 ) ) ( not ( = ?auto_35161 ?auto_35158 ) ) ( not ( = ?auto_35166 ?auto_35158 ) ) ( not ( = ?auto_35165 ?auto_35158 ) ) ( AVAILABLE ?auto_35171 ) ( SURFACE-AT ?auto_35159 ?auto_35163 ) ( ON ?auto_35159 ?auto_35169 ) ( CLEAR ?auto_35159 ) ( not ( = ?auto_35160 ?auto_35169 ) ) ( not ( = ?auto_35161 ?auto_35169 ) ) ( not ( = ?auto_35159 ?auto_35169 ) ) ( not ( = ?auto_35166 ?auto_35169 ) ) ( not ( = ?auto_35165 ?auto_35169 ) ) ( not ( = ?auto_35158 ?auto_35169 ) ) ( TRUCK-AT ?auto_35164 ?auto_35162 ) ( SURFACE-AT ?auto_35172 ?auto_35162 ) ( CLEAR ?auto_35172 ) ( IS-CRATE ?auto_35158 ) ( not ( = ?auto_35172 ?auto_35158 ) ) ( not ( = ?auto_35160 ?auto_35172 ) ) ( not ( = ?auto_35161 ?auto_35172 ) ) ( not ( = ?auto_35159 ?auto_35172 ) ) ( not ( = ?auto_35166 ?auto_35172 ) ) ( not ( = ?auto_35165 ?auto_35172 ) ) ( not ( = ?auto_35169 ?auto_35172 ) ) ( AVAILABLE ?auto_35168 ) ( IN ?auto_35158 ?auto_35164 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35159 ?auto_35160 ?auto_35161 )
      ( MAKE-3CRATE-VERIFY ?auto_35158 ?auto_35159 ?auto_35160 ?auto_35161 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35173 - SURFACE
      ?auto_35174 - SURFACE
      ?auto_35175 - SURFACE
      ?auto_35176 - SURFACE
      ?auto_35177 - SURFACE
    )
    :vars
    (
      ?auto_35184 - HOIST
      ?auto_35178 - PLACE
      ?auto_35179 - PLACE
      ?auto_35187 - HOIST
      ?auto_35182 - SURFACE
      ?auto_35183 - PLACE
      ?auto_35186 - HOIST
      ?auto_35181 - SURFACE
      ?auto_35185 - SURFACE
      ?auto_35180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35184 ?auto_35178 ) ( IS-CRATE ?auto_35177 ) ( not ( = ?auto_35176 ?auto_35177 ) ) ( not ( = ?auto_35175 ?auto_35176 ) ) ( not ( = ?auto_35175 ?auto_35177 ) ) ( not ( = ?auto_35179 ?auto_35178 ) ) ( HOIST-AT ?auto_35187 ?auto_35179 ) ( not ( = ?auto_35184 ?auto_35187 ) ) ( SURFACE-AT ?auto_35177 ?auto_35179 ) ( ON ?auto_35177 ?auto_35182 ) ( CLEAR ?auto_35177 ) ( not ( = ?auto_35176 ?auto_35182 ) ) ( not ( = ?auto_35177 ?auto_35182 ) ) ( not ( = ?auto_35175 ?auto_35182 ) ) ( IS-CRATE ?auto_35176 ) ( not ( = ?auto_35183 ?auto_35178 ) ) ( not ( = ?auto_35179 ?auto_35183 ) ) ( HOIST-AT ?auto_35186 ?auto_35183 ) ( not ( = ?auto_35184 ?auto_35186 ) ) ( not ( = ?auto_35187 ?auto_35186 ) ) ( AVAILABLE ?auto_35186 ) ( SURFACE-AT ?auto_35176 ?auto_35183 ) ( ON ?auto_35176 ?auto_35181 ) ( CLEAR ?auto_35176 ) ( not ( = ?auto_35176 ?auto_35181 ) ) ( not ( = ?auto_35177 ?auto_35181 ) ) ( not ( = ?auto_35175 ?auto_35181 ) ) ( not ( = ?auto_35182 ?auto_35181 ) ) ( IS-CRATE ?auto_35175 ) ( not ( = ?auto_35174 ?auto_35175 ) ) ( not ( = ?auto_35176 ?auto_35174 ) ) ( not ( = ?auto_35177 ?auto_35174 ) ) ( not ( = ?auto_35182 ?auto_35174 ) ) ( not ( = ?auto_35181 ?auto_35174 ) ) ( AVAILABLE ?auto_35187 ) ( SURFACE-AT ?auto_35175 ?auto_35179 ) ( ON ?auto_35175 ?auto_35185 ) ( CLEAR ?auto_35175 ) ( not ( = ?auto_35176 ?auto_35185 ) ) ( not ( = ?auto_35177 ?auto_35185 ) ) ( not ( = ?auto_35175 ?auto_35185 ) ) ( not ( = ?auto_35182 ?auto_35185 ) ) ( not ( = ?auto_35181 ?auto_35185 ) ) ( not ( = ?auto_35174 ?auto_35185 ) ) ( TRUCK-AT ?auto_35180 ?auto_35178 ) ( SURFACE-AT ?auto_35173 ?auto_35178 ) ( CLEAR ?auto_35173 ) ( IS-CRATE ?auto_35174 ) ( not ( = ?auto_35173 ?auto_35174 ) ) ( not ( = ?auto_35176 ?auto_35173 ) ) ( not ( = ?auto_35177 ?auto_35173 ) ) ( not ( = ?auto_35175 ?auto_35173 ) ) ( not ( = ?auto_35182 ?auto_35173 ) ) ( not ( = ?auto_35181 ?auto_35173 ) ) ( not ( = ?auto_35185 ?auto_35173 ) ) ( AVAILABLE ?auto_35184 ) ( IN ?auto_35174 ?auto_35180 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35175 ?auto_35176 ?auto_35177 )
      ( MAKE-4CRATE-VERIFY ?auto_35173 ?auto_35174 ?auto_35175 ?auto_35176 ?auto_35177 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35188 - SURFACE
      ?auto_35189 - SURFACE
      ?auto_35190 - SURFACE
      ?auto_35191 - SURFACE
      ?auto_35192 - SURFACE
      ?auto_35193 - SURFACE
    )
    :vars
    (
      ?auto_35200 - HOIST
      ?auto_35194 - PLACE
      ?auto_35195 - PLACE
      ?auto_35203 - HOIST
      ?auto_35198 - SURFACE
      ?auto_35199 - PLACE
      ?auto_35202 - HOIST
      ?auto_35197 - SURFACE
      ?auto_35201 - SURFACE
      ?auto_35196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35200 ?auto_35194 ) ( IS-CRATE ?auto_35193 ) ( not ( = ?auto_35192 ?auto_35193 ) ) ( not ( = ?auto_35191 ?auto_35192 ) ) ( not ( = ?auto_35191 ?auto_35193 ) ) ( not ( = ?auto_35195 ?auto_35194 ) ) ( HOIST-AT ?auto_35203 ?auto_35195 ) ( not ( = ?auto_35200 ?auto_35203 ) ) ( SURFACE-AT ?auto_35193 ?auto_35195 ) ( ON ?auto_35193 ?auto_35198 ) ( CLEAR ?auto_35193 ) ( not ( = ?auto_35192 ?auto_35198 ) ) ( not ( = ?auto_35193 ?auto_35198 ) ) ( not ( = ?auto_35191 ?auto_35198 ) ) ( IS-CRATE ?auto_35192 ) ( not ( = ?auto_35199 ?auto_35194 ) ) ( not ( = ?auto_35195 ?auto_35199 ) ) ( HOIST-AT ?auto_35202 ?auto_35199 ) ( not ( = ?auto_35200 ?auto_35202 ) ) ( not ( = ?auto_35203 ?auto_35202 ) ) ( AVAILABLE ?auto_35202 ) ( SURFACE-AT ?auto_35192 ?auto_35199 ) ( ON ?auto_35192 ?auto_35197 ) ( CLEAR ?auto_35192 ) ( not ( = ?auto_35192 ?auto_35197 ) ) ( not ( = ?auto_35193 ?auto_35197 ) ) ( not ( = ?auto_35191 ?auto_35197 ) ) ( not ( = ?auto_35198 ?auto_35197 ) ) ( IS-CRATE ?auto_35191 ) ( not ( = ?auto_35190 ?auto_35191 ) ) ( not ( = ?auto_35192 ?auto_35190 ) ) ( not ( = ?auto_35193 ?auto_35190 ) ) ( not ( = ?auto_35198 ?auto_35190 ) ) ( not ( = ?auto_35197 ?auto_35190 ) ) ( AVAILABLE ?auto_35203 ) ( SURFACE-AT ?auto_35191 ?auto_35195 ) ( ON ?auto_35191 ?auto_35201 ) ( CLEAR ?auto_35191 ) ( not ( = ?auto_35192 ?auto_35201 ) ) ( not ( = ?auto_35193 ?auto_35201 ) ) ( not ( = ?auto_35191 ?auto_35201 ) ) ( not ( = ?auto_35198 ?auto_35201 ) ) ( not ( = ?auto_35197 ?auto_35201 ) ) ( not ( = ?auto_35190 ?auto_35201 ) ) ( TRUCK-AT ?auto_35196 ?auto_35194 ) ( SURFACE-AT ?auto_35189 ?auto_35194 ) ( CLEAR ?auto_35189 ) ( IS-CRATE ?auto_35190 ) ( not ( = ?auto_35189 ?auto_35190 ) ) ( not ( = ?auto_35192 ?auto_35189 ) ) ( not ( = ?auto_35193 ?auto_35189 ) ) ( not ( = ?auto_35191 ?auto_35189 ) ) ( not ( = ?auto_35198 ?auto_35189 ) ) ( not ( = ?auto_35197 ?auto_35189 ) ) ( not ( = ?auto_35201 ?auto_35189 ) ) ( AVAILABLE ?auto_35200 ) ( IN ?auto_35190 ?auto_35196 ) ( ON ?auto_35189 ?auto_35188 ) ( not ( = ?auto_35188 ?auto_35189 ) ) ( not ( = ?auto_35188 ?auto_35190 ) ) ( not ( = ?auto_35188 ?auto_35191 ) ) ( not ( = ?auto_35188 ?auto_35192 ) ) ( not ( = ?auto_35188 ?auto_35193 ) ) ( not ( = ?auto_35188 ?auto_35198 ) ) ( not ( = ?auto_35188 ?auto_35197 ) ) ( not ( = ?auto_35188 ?auto_35201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35191 ?auto_35192 ?auto_35193 )
      ( MAKE-5CRATE-VERIFY ?auto_35188 ?auto_35189 ?auto_35190 ?auto_35191 ?auto_35192 ?auto_35193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35204 - SURFACE
      ?auto_35205 - SURFACE
    )
    :vars
    (
      ?auto_35214 - HOIST
      ?auto_35207 - PLACE
      ?auto_35208 - SURFACE
      ?auto_35209 - PLACE
      ?auto_35217 - HOIST
      ?auto_35212 - SURFACE
      ?auto_35213 - PLACE
      ?auto_35216 - HOIST
      ?auto_35211 - SURFACE
      ?auto_35206 - SURFACE
      ?auto_35215 - SURFACE
      ?auto_35218 - SURFACE
      ?auto_35210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35214 ?auto_35207 ) ( IS-CRATE ?auto_35205 ) ( not ( = ?auto_35204 ?auto_35205 ) ) ( not ( = ?auto_35208 ?auto_35204 ) ) ( not ( = ?auto_35208 ?auto_35205 ) ) ( not ( = ?auto_35209 ?auto_35207 ) ) ( HOIST-AT ?auto_35217 ?auto_35209 ) ( not ( = ?auto_35214 ?auto_35217 ) ) ( SURFACE-AT ?auto_35205 ?auto_35209 ) ( ON ?auto_35205 ?auto_35212 ) ( CLEAR ?auto_35205 ) ( not ( = ?auto_35204 ?auto_35212 ) ) ( not ( = ?auto_35205 ?auto_35212 ) ) ( not ( = ?auto_35208 ?auto_35212 ) ) ( IS-CRATE ?auto_35204 ) ( not ( = ?auto_35213 ?auto_35207 ) ) ( not ( = ?auto_35209 ?auto_35213 ) ) ( HOIST-AT ?auto_35216 ?auto_35213 ) ( not ( = ?auto_35214 ?auto_35216 ) ) ( not ( = ?auto_35217 ?auto_35216 ) ) ( AVAILABLE ?auto_35216 ) ( SURFACE-AT ?auto_35204 ?auto_35213 ) ( ON ?auto_35204 ?auto_35211 ) ( CLEAR ?auto_35204 ) ( not ( = ?auto_35204 ?auto_35211 ) ) ( not ( = ?auto_35205 ?auto_35211 ) ) ( not ( = ?auto_35208 ?auto_35211 ) ) ( not ( = ?auto_35212 ?auto_35211 ) ) ( IS-CRATE ?auto_35208 ) ( not ( = ?auto_35206 ?auto_35208 ) ) ( not ( = ?auto_35204 ?auto_35206 ) ) ( not ( = ?auto_35205 ?auto_35206 ) ) ( not ( = ?auto_35212 ?auto_35206 ) ) ( not ( = ?auto_35211 ?auto_35206 ) ) ( AVAILABLE ?auto_35217 ) ( SURFACE-AT ?auto_35208 ?auto_35209 ) ( ON ?auto_35208 ?auto_35215 ) ( CLEAR ?auto_35208 ) ( not ( = ?auto_35204 ?auto_35215 ) ) ( not ( = ?auto_35205 ?auto_35215 ) ) ( not ( = ?auto_35208 ?auto_35215 ) ) ( not ( = ?auto_35212 ?auto_35215 ) ) ( not ( = ?auto_35211 ?auto_35215 ) ) ( not ( = ?auto_35206 ?auto_35215 ) ) ( SURFACE-AT ?auto_35218 ?auto_35207 ) ( CLEAR ?auto_35218 ) ( IS-CRATE ?auto_35206 ) ( not ( = ?auto_35218 ?auto_35206 ) ) ( not ( = ?auto_35204 ?auto_35218 ) ) ( not ( = ?auto_35205 ?auto_35218 ) ) ( not ( = ?auto_35208 ?auto_35218 ) ) ( not ( = ?auto_35212 ?auto_35218 ) ) ( not ( = ?auto_35211 ?auto_35218 ) ) ( not ( = ?auto_35215 ?auto_35218 ) ) ( AVAILABLE ?auto_35214 ) ( IN ?auto_35206 ?auto_35210 ) ( TRUCK-AT ?auto_35210 ?auto_35209 ) )
    :subtasks
    ( ( !DRIVE ?auto_35210 ?auto_35209 ?auto_35207 )
      ( MAKE-2CRATE ?auto_35208 ?auto_35204 ?auto_35205 )
      ( MAKE-1CRATE-VERIFY ?auto_35204 ?auto_35205 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35219 - SURFACE
      ?auto_35220 - SURFACE
      ?auto_35221 - SURFACE
    )
    :vars
    (
      ?auto_35231 - HOIST
      ?auto_35230 - PLACE
      ?auto_35225 - PLACE
      ?auto_35229 - HOIST
      ?auto_35226 - SURFACE
      ?auto_35227 - PLACE
      ?auto_35223 - HOIST
      ?auto_35232 - SURFACE
      ?auto_35228 - SURFACE
      ?auto_35222 - SURFACE
      ?auto_35224 - SURFACE
      ?auto_35233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35231 ?auto_35230 ) ( IS-CRATE ?auto_35221 ) ( not ( = ?auto_35220 ?auto_35221 ) ) ( not ( = ?auto_35219 ?auto_35220 ) ) ( not ( = ?auto_35219 ?auto_35221 ) ) ( not ( = ?auto_35225 ?auto_35230 ) ) ( HOIST-AT ?auto_35229 ?auto_35225 ) ( not ( = ?auto_35231 ?auto_35229 ) ) ( SURFACE-AT ?auto_35221 ?auto_35225 ) ( ON ?auto_35221 ?auto_35226 ) ( CLEAR ?auto_35221 ) ( not ( = ?auto_35220 ?auto_35226 ) ) ( not ( = ?auto_35221 ?auto_35226 ) ) ( not ( = ?auto_35219 ?auto_35226 ) ) ( IS-CRATE ?auto_35220 ) ( not ( = ?auto_35227 ?auto_35230 ) ) ( not ( = ?auto_35225 ?auto_35227 ) ) ( HOIST-AT ?auto_35223 ?auto_35227 ) ( not ( = ?auto_35231 ?auto_35223 ) ) ( not ( = ?auto_35229 ?auto_35223 ) ) ( AVAILABLE ?auto_35223 ) ( SURFACE-AT ?auto_35220 ?auto_35227 ) ( ON ?auto_35220 ?auto_35232 ) ( CLEAR ?auto_35220 ) ( not ( = ?auto_35220 ?auto_35232 ) ) ( not ( = ?auto_35221 ?auto_35232 ) ) ( not ( = ?auto_35219 ?auto_35232 ) ) ( not ( = ?auto_35226 ?auto_35232 ) ) ( IS-CRATE ?auto_35219 ) ( not ( = ?auto_35228 ?auto_35219 ) ) ( not ( = ?auto_35220 ?auto_35228 ) ) ( not ( = ?auto_35221 ?auto_35228 ) ) ( not ( = ?auto_35226 ?auto_35228 ) ) ( not ( = ?auto_35232 ?auto_35228 ) ) ( AVAILABLE ?auto_35229 ) ( SURFACE-AT ?auto_35219 ?auto_35225 ) ( ON ?auto_35219 ?auto_35222 ) ( CLEAR ?auto_35219 ) ( not ( = ?auto_35220 ?auto_35222 ) ) ( not ( = ?auto_35221 ?auto_35222 ) ) ( not ( = ?auto_35219 ?auto_35222 ) ) ( not ( = ?auto_35226 ?auto_35222 ) ) ( not ( = ?auto_35232 ?auto_35222 ) ) ( not ( = ?auto_35228 ?auto_35222 ) ) ( SURFACE-AT ?auto_35224 ?auto_35230 ) ( CLEAR ?auto_35224 ) ( IS-CRATE ?auto_35228 ) ( not ( = ?auto_35224 ?auto_35228 ) ) ( not ( = ?auto_35220 ?auto_35224 ) ) ( not ( = ?auto_35221 ?auto_35224 ) ) ( not ( = ?auto_35219 ?auto_35224 ) ) ( not ( = ?auto_35226 ?auto_35224 ) ) ( not ( = ?auto_35232 ?auto_35224 ) ) ( not ( = ?auto_35222 ?auto_35224 ) ) ( AVAILABLE ?auto_35231 ) ( IN ?auto_35228 ?auto_35233 ) ( TRUCK-AT ?auto_35233 ?auto_35225 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35220 ?auto_35221 )
      ( MAKE-2CRATE-VERIFY ?auto_35219 ?auto_35220 ?auto_35221 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35234 - SURFACE
      ?auto_35235 - SURFACE
      ?auto_35236 - SURFACE
      ?auto_35237 - SURFACE
    )
    :vars
    (
      ?auto_35239 - HOIST
      ?auto_35245 - PLACE
      ?auto_35243 - PLACE
      ?auto_35247 - HOIST
      ?auto_35240 - SURFACE
      ?auto_35244 - PLACE
      ?auto_35246 - HOIST
      ?auto_35242 - SURFACE
      ?auto_35238 - SURFACE
      ?auto_35248 - SURFACE
      ?auto_35241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35239 ?auto_35245 ) ( IS-CRATE ?auto_35237 ) ( not ( = ?auto_35236 ?auto_35237 ) ) ( not ( = ?auto_35235 ?auto_35236 ) ) ( not ( = ?auto_35235 ?auto_35237 ) ) ( not ( = ?auto_35243 ?auto_35245 ) ) ( HOIST-AT ?auto_35247 ?auto_35243 ) ( not ( = ?auto_35239 ?auto_35247 ) ) ( SURFACE-AT ?auto_35237 ?auto_35243 ) ( ON ?auto_35237 ?auto_35240 ) ( CLEAR ?auto_35237 ) ( not ( = ?auto_35236 ?auto_35240 ) ) ( not ( = ?auto_35237 ?auto_35240 ) ) ( not ( = ?auto_35235 ?auto_35240 ) ) ( IS-CRATE ?auto_35236 ) ( not ( = ?auto_35244 ?auto_35245 ) ) ( not ( = ?auto_35243 ?auto_35244 ) ) ( HOIST-AT ?auto_35246 ?auto_35244 ) ( not ( = ?auto_35239 ?auto_35246 ) ) ( not ( = ?auto_35247 ?auto_35246 ) ) ( AVAILABLE ?auto_35246 ) ( SURFACE-AT ?auto_35236 ?auto_35244 ) ( ON ?auto_35236 ?auto_35242 ) ( CLEAR ?auto_35236 ) ( not ( = ?auto_35236 ?auto_35242 ) ) ( not ( = ?auto_35237 ?auto_35242 ) ) ( not ( = ?auto_35235 ?auto_35242 ) ) ( not ( = ?auto_35240 ?auto_35242 ) ) ( IS-CRATE ?auto_35235 ) ( not ( = ?auto_35234 ?auto_35235 ) ) ( not ( = ?auto_35236 ?auto_35234 ) ) ( not ( = ?auto_35237 ?auto_35234 ) ) ( not ( = ?auto_35240 ?auto_35234 ) ) ( not ( = ?auto_35242 ?auto_35234 ) ) ( AVAILABLE ?auto_35247 ) ( SURFACE-AT ?auto_35235 ?auto_35243 ) ( ON ?auto_35235 ?auto_35238 ) ( CLEAR ?auto_35235 ) ( not ( = ?auto_35236 ?auto_35238 ) ) ( not ( = ?auto_35237 ?auto_35238 ) ) ( not ( = ?auto_35235 ?auto_35238 ) ) ( not ( = ?auto_35240 ?auto_35238 ) ) ( not ( = ?auto_35242 ?auto_35238 ) ) ( not ( = ?auto_35234 ?auto_35238 ) ) ( SURFACE-AT ?auto_35248 ?auto_35245 ) ( CLEAR ?auto_35248 ) ( IS-CRATE ?auto_35234 ) ( not ( = ?auto_35248 ?auto_35234 ) ) ( not ( = ?auto_35236 ?auto_35248 ) ) ( not ( = ?auto_35237 ?auto_35248 ) ) ( not ( = ?auto_35235 ?auto_35248 ) ) ( not ( = ?auto_35240 ?auto_35248 ) ) ( not ( = ?auto_35242 ?auto_35248 ) ) ( not ( = ?auto_35238 ?auto_35248 ) ) ( AVAILABLE ?auto_35239 ) ( IN ?auto_35234 ?auto_35241 ) ( TRUCK-AT ?auto_35241 ?auto_35243 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35235 ?auto_35236 ?auto_35237 )
      ( MAKE-3CRATE-VERIFY ?auto_35234 ?auto_35235 ?auto_35236 ?auto_35237 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35249 - SURFACE
      ?auto_35250 - SURFACE
      ?auto_35251 - SURFACE
      ?auto_35252 - SURFACE
      ?auto_35253 - SURFACE
    )
    :vars
    (
      ?auto_35255 - HOIST
      ?auto_35261 - PLACE
      ?auto_35259 - PLACE
      ?auto_35263 - HOIST
      ?auto_35256 - SURFACE
      ?auto_35260 - PLACE
      ?auto_35262 - HOIST
      ?auto_35258 - SURFACE
      ?auto_35254 - SURFACE
      ?auto_35257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35255 ?auto_35261 ) ( IS-CRATE ?auto_35253 ) ( not ( = ?auto_35252 ?auto_35253 ) ) ( not ( = ?auto_35251 ?auto_35252 ) ) ( not ( = ?auto_35251 ?auto_35253 ) ) ( not ( = ?auto_35259 ?auto_35261 ) ) ( HOIST-AT ?auto_35263 ?auto_35259 ) ( not ( = ?auto_35255 ?auto_35263 ) ) ( SURFACE-AT ?auto_35253 ?auto_35259 ) ( ON ?auto_35253 ?auto_35256 ) ( CLEAR ?auto_35253 ) ( not ( = ?auto_35252 ?auto_35256 ) ) ( not ( = ?auto_35253 ?auto_35256 ) ) ( not ( = ?auto_35251 ?auto_35256 ) ) ( IS-CRATE ?auto_35252 ) ( not ( = ?auto_35260 ?auto_35261 ) ) ( not ( = ?auto_35259 ?auto_35260 ) ) ( HOIST-AT ?auto_35262 ?auto_35260 ) ( not ( = ?auto_35255 ?auto_35262 ) ) ( not ( = ?auto_35263 ?auto_35262 ) ) ( AVAILABLE ?auto_35262 ) ( SURFACE-AT ?auto_35252 ?auto_35260 ) ( ON ?auto_35252 ?auto_35258 ) ( CLEAR ?auto_35252 ) ( not ( = ?auto_35252 ?auto_35258 ) ) ( not ( = ?auto_35253 ?auto_35258 ) ) ( not ( = ?auto_35251 ?auto_35258 ) ) ( not ( = ?auto_35256 ?auto_35258 ) ) ( IS-CRATE ?auto_35251 ) ( not ( = ?auto_35250 ?auto_35251 ) ) ( not ( = ?auto_35252 ?auto_35250 ) ) ( not ( = ?auto_35253 ?auto_35250 ) ) ( not ( = ?auto_35256 ?auto_35250 ) ) ( not ( = ?auto_35258 ?auto_35250 ) ) ( AVAILABLE ?auto_35263 ) ( SURFACE-AT ?auto_35251 ?auto_35259 ) ( ON ?auto_35251 ?auto_35254 ) ( CLEAR ?auto_35251 ) ( not ( = ?auto_35252 ?auto_35254 ) ) ( not ( = ?auto_35253 ?auto_35254 ) ) ( not ( = ?auto_35251 ?auto_35254 ) ) ( not ( = ?auto_35256 ?auto_35254 ) ) ( not ( = ?auto_35258 ?auto_35254 ) ) ( not ( = ?auto_35250 ?auto_35254 ) ) ( SURFACE-AT ?auto_35249 ?auto_35261 ) ( CLEAR ?auto_35249 ) ( IS-CRATE ?auto_35250 ) ( not ( = ?auto_35249 ?auto_35250 ) ) ( not ( = ?auto_35252 ?auto_35249 ) ) ( not ( = ?auto_35253 ?auto_35249 ) ) ( not ( = ?auto_35251 ?auto_35249 ) ) ( not ( = ?auto_35256 ?auto_35249 ) ) ( not ( = ?auto_35258 ?auto_35249 ) ) ( not ( = ?auto_35254 ?auto_35249 ) ) ( AVAILABLE ?auto_35255 ) ( IN ?auto_35250 ?auto_35257 ) ( TRUCK-AT ?auto_35257 ?auto_35259 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35251 ?auto_35252 ?auto_35253 )
      ( MAKE-4CRATE-VERIFY ?auto_35249 ?auto_35250 ?auto_35251 ?auto_35252 ?auto_35253 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35264 - SURFACE
      ?auto_35265 - SURFACE
      ?auto_35266 - SURFACE
      ?auto_35267 - SURFACE
      ?auto_35268 - SURFACE
      ?auto_35269 - SURFACE
    )
    :vars
    (
      ?auto_35271 - HOIST
      ?auto_35277 - PLACE
      ?auto_35275 - PLACE
      ?auto_35279 - HOIST
      ?auto_35272 - SURFACE
      ?auto_35276 - PLACE
      ?auto_35278 - HOIST
      ?auto_35274 - SURFACE
      ?auto_35270 - SURFACE
      ?auto_35273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35271 ?auto_35277 ) ( IS-CRATE ?auto_35269 ) ( not ( = ?auto_35268 ?auto_35269 ) ) ( not ( = ?auto_35267 ?auto_35268 ) ) ( not ( = ?auto_35267 ?auto_35269 ) ) ( not ( = ?auto_35275 ?auto_35277 ) ) ( HOIST-AT ?auto_35279 ?auto_35275 ) ( not ( = ?auto_35271 ?auto_35279 ) ) ( SURFACE-AT ?auto_35269 ?auto_35275 ) ( ON ?auto_35269 ?auto_35272 ) ( CLEAR ?auto_35269 ) ( not ( = ?auto_35268 ?auto_35272 ) ) ( not ( = ?auto_35269 ?auto_35272 ) ) ( not ( = ?auto_35267 ?auto_35272 ) ) ( IS-CRATE ?auto_35268 ) ( not ( = ?auto_35276 ?auto_35277 ) ) ( not ( = ?auto_35275 ?auto_35276 ) ) ( HOIST-AT ?auto_35278 ?auto_35276 ) ( not ( = ?auto_35271 ?auto_35278 ) ) ( not ( = ?auto_35279 ?auto_35278 ) ) ( AVAILABLE ?auto_35278 ) ( SURFACE-AT ?auto_35268 ?auto_35276 ) ( ON ?auto_35268 ?auto_35274 ) ( CLEAR ?auto_35268 ) ( not ( = ?auto_35268 ?auto_35274 ) ) ( not ( = ?auto_35269 ?auto_35274 ) ) ( not ( = ?auto_35267 ?auto_35274 ) ) ( not ( = ?auto_35272 ?auto_35274 ) ) ( IS-CRATE ?auto_35267 ) ( not ( = ?auto_35266 ?auto_35267 ) ) ( not ( = ?auto_35268 ?auto_35266 ) ) ( not ( = ?auto_35269 ?auto_35266 ) ) ( not ( = ?auto_35272 ?auto_35266 ) ) ( not ( = ?auto_35274 ?auto_35266 ) ) ( AVAILABLE ?auto_35279 ) ( SURFACE-AT ?auto_35267 ?auto_35275 ) ( ON ?auto_35267 ?auto_35270 ) ( CLEAR ?auto_35267 ) ( not ( = ?auto_35268 ?auto_35270 ) ) ( not ( = ?auto_35269 ?auto_35270 ) ) ( not ( = ?auto_35267 ?auto_35270 ) ) ( not ( = ?auto_35272 ?auto_35270 ) ) ( not ( = ?auto_35274 ?auto_35270 ) ) ( not ( = ?auto_35266 ?auto_35270 ) ) ( SURFACE-AT ?auto_35265 ?auto_35277 ) ( CLEAR ?auto_35265 ) ( IS-CRATE ?auto_35266 ) ( not ( = ?auto_35265 ?auto_35266 ) ) ( not ( = ?auto_35268 ?auto_35265 ) ) ( not ( = ?auto_35269 ?auto_35265 ) ) ( not ( = ?auto_35267 ?auto_35265 ) ) ( not ( = ?auto_35272 ?auto_35265 ) ) ( not ( = ?auto_35274 ?auto_35265 ) ) ( not ( = ?auto_35270 ?auto_35265 ) ) ( AVAILABLE ?auto_35271 ) ( IN ?auto_35266 ?auto_35273 ) ( TRUCK-AT ?auto_35273 ?auto_35275 ) ( ON ?auto_35265 ?auto_35264 ) ( not ( = ?auto_35264 ?auto_35265 ) ) ( not ( = ?auto_35264 ?auto_35266 ) ) ( not ( = ?auto_35264 ?auto_35267 ) ) ( not ( = ?auto_35264 ?auto_35268 ) ) ( not ( = ?auto_35264 ?auto_35269 ) ) ( not ( = ?auto_35264 ?auto_35272 ) ) ( not ( = ?auto_35264 ?auto_35274 ) ) ( not ( = ?auto_35264 ?auto_35270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35267 ?auto_35268 ?auto_35269 )
      ( MAKE-5CRATE-VERIFY ?auto_35264 ?auto_35265 ?auto_35266 ?auto_35267 ?auto_35268 ?auto_35269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35280 - SURFACE
      ?auto_35281 - SURFACE
    )
    :vars
    (
      ?auto_35283 - HOIST
      ?auto_35290 - PLACE
      ?auto_35294 - SURFACE
      ?auto_35288 - PLACE
      ?auto_35292 - HOIST
      ?auto_35284 - SURFACE
      ?auto_35289 - PLACE
      ?auto_35291 - HOIST
      ?auto_35286 - SURFACE
      ?auto_35287 - SURFACE
      ?auto_35282 - SURFACE
      ?auto_35293 - SURFACE
      ?auto_35285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35283 ?auto_35290 ) ( IS-CRATE ?auto_35281 ) ( not ( = ?auto_35280 ?auto_35281 ) ) ( not ( = ?auto_35294 ?auto_35280 ) ) ( not ( = ?auto_35294 ?auto_35281 ) ) ( not ( = ?auto_35288 ?auto_35290 ) ) ( HOIST-AT ?auto_35292 ?auto_35288 ) ( not ( = ?auto_35283 ?auto_35292 ) ) ( SURFACE-AT ?auto_35281 ?auto_35288 ) ( ON ?auto_35281 ?auto_35284 ) ( CLEAR ?auto_35281 ) ( not ( = ?auto_35280 ?auto_35284 ) ) ( not ( = ?auto_35281 ?auto_35284 ) ) ( not ( = ?auto_35294 ?auto_35284 ) ) ( IS-CRATE ?auto_35280 ) ( not ( = ?auto_35289 ?auto_35290 ) ) ( not ( = ?auto_35288 ?auto_35289 ) ) ( HOIST-AT ?auto_35291 ?auto_35289 ) ( not ( = ?auto_35283 ?auto_35291 ) ) ( not ( = ?auto_35292 ?auto_35291 ) ) ( AVAILABLE ?auto_35291 ) ( SURFACE-AT ?auto_35280 ?auto_35289 ) ( ON ?auto_35280 ?auto_35286 ) ( CLEAR ?auto_35280 ) ( not ( = ?auto_35280 ?auto_35286 ) ) ( not ( = ?auto_35281 ?auto_35286 ) ) ( not ( = ?auto_35294 ?auto_35286 ) ) ( not ( = ?auto_35284 ?auto_35286 ) ) ( IS-CRATE ?auto_35294 ) ( not ( = ?auto_35287 ?auto_35294 ) ) ( not ( = ?auto_35280 ?auto_35287 ) ) ( not ( = ?auto_35281 ?auto_35287 ) ) ( not ( = ?auto_35284 ?auto_35287 ) ) ( not ( = ?auto_35286 ?auto_35287 ) ) ( SURFACE-AT ?auto_35294 ?auto_35288 ) ( ON ?auto_35294 ?auto_35282 ) ( CLEAR ?auto_35294 ) ( not ( = ?auto_35280 ?auto_35282 ) ) ( not ( = ?auto_35281 ?auto_35282 ) ) ( not ( = ?auto_35294 ?auto_35282 ) ) ( not ( = ?auto_35284 ?auto_35282 ) ) ( not ( = ?auto_35286 ?auto_35282 ) ) ( not ( = ?auto_35287 ?auto_35282 ) ) ( SURFACE-AT ?auto_35293 ?auto_35290 ) ( CLEAR ?auto_35293 ) ( IS-CRATE ?auto_35287 ) ( not ( = ?auto_35293 ?auto_35287 ) ) ( not ( = ?auto_35280 ?auto_35293 ) ) ( not ( = ?auto_35281 ?auto_35293 ) ) ( not ( = ?auto_35294 ?auto_35293 ) ) ( not ( = ?auto_35284 ?auto_35293 ) ) ( not ( = ?auto_35286 ?auto_35293 ) ) ( not ( = ?auto_35282 ?auto_35293 ) ) ( AVAILABLE ?auto_35283 ) ( TRUCK-AT ?auto_35285 ?auto_35288 ) ( LIFTING ?auto_35292 ?auto_35287 ) )
    :subtasks
    ( ( !LOAD ?auto_35292 ?auto_35287 ?auto_35285 ?auto_35288 )
      ( MAKE-2CRATE ?auto_35294 ?auto_35280 ?auto_35281 )
      ( MAKE-1CRATE-VERIFY ?auto_35280 ?auto_35281 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35295 - SURFACE
      ?auto_35296 - SURFACE
      ?auto_35297 - SURFACE
    )
    :vars
    (
      ?auto_35301 - HOIST
      ?auto_35304 - PLACE
      ?auto_35298 - PLACE
      ?auto_35302 - HOIST
      ?auto_35307 - SURFACE
      ?auto_35303 - PLACE
      ?auto_35299 - HOIST
      ?auto_35306 - SURFACE
      ?auto_35308 - SURFACE
      ?auto_35305 - SURFACE
      ?auto_35309 - SURFACE
      ?auto_35300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35301 ?auto_35304 ) ( IS-CRATE ?auto_35297 ) ( not ( = ?auto_35296 ?auto_35297 ) ) ( not ( = ?auto_35295 ?auto_35296 ) ) ( not ( = ?auto_35295 ?auto_35297 ) ) ( not ( = ?auto_35298 ?auto_35304 ) ) ( HOIST-AT ?auto_35302 ?auto_35298 ) ( not ( = ?auto_35301 ?auto_35302 ) ) ( SURFACE-AT ?auto_35297 ?auto_35298 ) ( ON ?auto_35297 ?auto_35307 ) ( CLEAR ?auto_35297 ) ( not ( = ?auto_35296 ?auto_35307 ) ) ( not ( = ?auto_35297 ?auto_35307 ) ) ( not ( = ?auto_35295 ?auto_35307 ) ) ( IS-CRATE ?auto_35296 ) ( not ( = ?auto_35303 ?auto_35304 ) ) ( not ( = ?auto_35298 ?auto_35303 ) ) ( HOIST-AT ?auto_35299 ?auto_35303 ) ( not ( = ?auto_35301 ?auto_35299 ) ) ( not ( = ?auto_35302 ?auto_35299 ) ) ( AVAILABLE ?auto_35299 ) ( SURFACE-AT ?auto_35296 ?auto_35303 ) ( ON ?auto_35296 ?auto_35306 ) ( CLEAR ?auto_35296 ) ( not ( = ?auto_35296 ?auto_35306 ) ) ( not ( = ?auto_35297 ?auto_35306 ) ) ( not ( = ?auto_35295 ?auto_35306 ) ) ( not ( = ?auto_35307 ?auto_35306 ) ) ( IS-CRATE ?auto_35295 ) ( not ( = ?auto_35308 ?auto_35295 ) ) ( not ( = ?auto_35296 ?auto_35308 ) ) ( not ( = ?auto_35297 ?auto_35308 ) ) ( not ( = ?auto_35307 ?auto_35308 ) ) ( not ( = ?auto_35306 ?auto_35308 ) ) ( SURFACE-AT ?auto_35295 ?auto_35298 ) ( ON ?auto_35295 ?auto_35305 ) ( CLEAR ?auto_35295 ) ( not ( = ?auto_35296 ?auto_35305 ) ) ( not ( = ?auto_35297 ?auto_35305 ) ) ( not ( = ?auto_35295 ?auto_35305 ) ) ( not ( = ?auto_35307 ?auto_35305 ) ) ( not ( = ?auto_35306 ?auto_35305 ) ) ( not ( = ?auto_35308 ?auto_35305 ) ) ( SURFACE-AT ?auto_35309 ?auto_35304 ) ( CLEAR ?auto_35309 ) ( IS-CRATE ?auto_35308 ) ( not ( = ?auto_35309 ?auto_35308 ) ) ( not ( = ?auto_35296 ?auto_35309 ) ) ( not ( = ?auto_35297 ?auto_35309 ) ) ( not ( = ?auto_35295 ?auto_35309 ) ) ( not ( = ?auto_35307 ?auto_35309 ) ) ( not ( = ?auto_35306 ?auto_35309 ) ) ( not ( = ?auto_35305 ?auto_35309 ) ) ( AVAILABLE ?auto_35301 ) ( TRUCK-AT ?auto_35300 ?auto_35298 ) ( LIFTING ?auto_35302 ?auto_35308 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35296 ?auto_35297 )
      ( MAKE-2CRATE-VERIFY ?auto_35295 ?auto_35296 ?auto_35297 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35310 - SURFACE
      ?auto_35311 - SURFACE
      ?auto_35312 - SURFACE
      ?auto_35313 - SURFACE
    )
    :vars
    (
      ?auto_35323 - HOIST
      ?auto_35314 - PLACE
      ?auto_35322 - PLACE
      ?auto_35320 - HOIST
      ?auto_35319 - SURFACE
      ?auto_35321 - PLACE
      ?auto_35317 - HOIST
      ?auto_35324 - SURFACE
      ?auto_35315 - SURFACE
      ?auto_35316 - SURFACE
      ?auto_35318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35323 ?auto_35314 ) ( IS-CRATE ?auto_35313 ) ( not ( = ?auto_35312 ?auto_35313 ) ) ( not ( = ?auto_35311 ?auto_35312 ) ) ( not ( = ?auto_35311 ?auto_35313 ) ) ( not ( = ?auto_35322 ?auto_35314 ) ) ( HOIST-AT ?auto_35320 ?auto_35322 ) ( not ( = ?auto_35323 ?auto_35320 ) ) ( SURFACE-AT ?auto_35313 ?auto_35322 ) ( ON ?auto_35313 ?auto_35319 ) ( CLEAR ?auto_35313 ) ( not ( = ?auto_35312 ?auto_35319 ) ) ( not ( = ?auto_35313 ?auto_35319 ) ) ( not ( = ?auto_35311 ?auto_35319 ) ) ( IS-CRATE ?auto_35312 ) ( not ( = ?auto_35321 ?auto_35314 ) ) ( not ( = ?auto_35322 ?auto_35321 ) ) ( HOIST-AT ?auto_35317 ?auto_35321 ) ( not ( = ?auto_35323 ?auto_35317 ) ) ( not ( = ?auto_35320 ?auto_35317 ) ) ( AVAILABLE ?auto_35317 ) ( SURFACE-AT ?auto_35312 ?auto_35321 ) ( ON ?auto_35312 ?auto_35324 ) ( CLEAR ?auto_35312 ) ( not ( = ?auto_35312 ?auto_35324 ) ) ( not ( = ?auto_35313 ?auto_35324 ) ) ( not ( = ?auto_35311 ?auto_35324 ) ) ( not ( = ?auto_35319 ?auto_35324 ) ) ( IS-CRATE ?auto_35311 ) ( not ( = ?auto_35310 ?auto_35311 ) ) ( not ( = ?auto_35312 ?auto_35310 ) ) ( not ( = ?auto_35313 ?auto_35310 ) ) ( not ( = ?auto_35319 ?auto_35310 ) ) ( not ( = ?auto_35324 ?auto_35310 ) ) ( SURFACE-AT ?auto_35311 ?auto_35322 ) ( ON ?auto_35311 ?auto_35315 ) ( CLEAR ?auto_35311 ) ( not ( = ?auto_35312 ?auto_35315 ) ) ( not ( = ?auto_35313 ?auto_35315 ) ) ( not ( = ?auto_35311 ?auto_35315 ) ) ( not ( = ?auto_35319 ?auto_35315 ) ) ( not ( = ?auto_35324 ?auto_35315 ) ) ( not ( = ?auto_35310 ?auto_35315 ) ) ( SURFACE-AT ?auto_35316 ?auto_35314 ) ( CLEAR ?auto_35316 ) ( IS-CRATE ?auto_35310 ) ( not ( = ?auto_35316 ?auto_35310 ) ) ( not ( = ?auto_35312 ?auto_35316 ) ) ( not ( = ?auto_35313 ?auto_35316 ) ) ( not ( = ?auto_35311 ?auto_35316 ) ) ( not ( = ?auto_35319 ?auto_35316 ) ) ( not ( = ?auto_35324 ?auto_35316 ) ) ( not ( = ?auto_35315 ?auto_35316 ) ) ( AVAILABLE ?auto_35323 ) ( TRUCK-AT ?auto_35318 ?auto_35322 ) ( LIFTING ?auto_35320 ?auto_35310 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35311 ?auto_35312 ?auto_35313 )
      ( MAKE-3CRATE-VERIFY ?auto_35310 ?auto_35311 ?auto_35312 ?auto_35313 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35325 - SURFACE
      ?auto_35326 - SURFACE
      ?auto_35327 - SURFACE
      ?auto_35328 - SURFACE
      ?auto_35329 - SURFACE
    )
    :vars
    (
      ?auto_35338 - HOIST
      ?auto_35330 - PLACE
      ?auto_35337 - PLACE
      ?auto_35335 - HOIST
      ?auto_35334 - SURFACE
      ?auto_35336 - PLACE
      ?auto_35332 - HOIST
      ?auto_35339 - SURFACE
      ?auto_35331 - SURFACE
      ?auto_35333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35338 ?auto_35330 ) ( IS-CRATE ?auto_35329 ) ( not ( = ?auto_35328 ?auto_35329 ) ) ( not ( = ?auto_35327 ?auto_35328 ) ) ( not ( = ?auto_35327 ?auto_35329 ) ) ( not ( = ?auto_35337 ?auto_35330 ) ) ( HOIST-AT ?auto_35335 ?auto_35337 ) ( not ( = ?auto_35338 ?auto_35335 ) ) ( SURFACE-AT ?auto_35329 ?auto_35337 ) ( ON ?auto_35329 ?auto_35334 ) ( CLEAR ?auto_35329 ) ( not ( = ?auto_35328 ?auto_35334 ) ) ( not ( = ?auto_35329 ?auto_35334 ) ) ( not ( = ?auto_35327 ?auto_35334 ) ) ( IS-CRATE ?auto_35328 ) ( not ( = ?auto_35336 ?auto_35330 ) ) ( not ( = ?auto_35337 ?auto_35336 ) ) ( HOIST-AT ?auto_35332 ?auto_35336 ) ( not ( = ?auto_35338 ?auto_35332 ) ) ( not ( = ?auto_35335 ?auto_35332 ) ) ( AVAILABLE ?auto_35332 ) ( SURFACE-AT ?auto_35328 ?auto_35336 ) ( ON ?auto_35328 ?auto_35339 ) ( CLEAR ?auto_35328 ) ( not ( = ?auto_35328 ?auto_35339 ) ) ( not ( = ?auto_35329 ?auto_35339 ) ) ( not ( = ?auto_35327 ?auto_35339 ) ) ( not ( = ?auto_35334 ?auto_35339 ) ) ( IS-CRATE ?auto_35327 ) ( not ( = ?auto_35326 ?auto_35327 ) ) ( not ( = ?auto_35328 ?auto_35326 ) ) ( not ( = ?auto_35329 ?auto_35326 ) ) ( not ( = ?auto_35334 ?auto_35326 ) ) ( not ( = ?auto_35339 ?auto_35326 ) ) ( SURFACE-AT ?auto_35327 ?auto_35337 ) ( ON ?auto_35327 ?auto_35331 ) ( CLEAR ?auto_35327 ) ( not ( = ?auto_35328 ?auto_35331 ) ) ( not ( = ?auto_35329 ?auto_35331 ) ) ( not ( = ?auto_35327 ?auto_35331 ) ) ( not ( = ?auto_35334 ?auto_35331 ) ) ( not ( = ?auto_35339 ?auto_35331 ) ) ( not ( = ?auto_35326 ?auto_35331 ) ) ( SURFACE-AT ?auto_35325 ?auto_35330 ) ( CLEAR ?auto_35325 ) ( IS-CRATE ?auto_35326 ) ( not ( = ?auto_35325 ?auto_35326 ) ) ( not ( = ?auto_35328 ?auto_35325 ) ) ( not ( = ?auto_35329 ?auto_35325 ) ) ( not ( = ?auto_35327 ?auto_35325 ) ) ( not ( = ?auto_35334 ?auto_35325 ) ) ( not ( = ?auto_35339 ?auto_35325 ) ) ( not ( = ?auto_35331 ?auto_35325 ) ) ( AVAILABLE ?auto_35338 ) ( TRUCK-AT ?auto_35333 ?auto_35337 ) ( LIFTING ?auto_35335 ?auto_35326 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35327 ?auto_35328 ?auto_35329 )
      ( MAKE-4CRATE-VERIFY ?auto_35325 ?auto_35326 ?auto_35327 ?auto_35328 ?auto_35329 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35340 - SURFACE
      ?auto_35341 - SURFACE
      ?auto_35342 - SURFACE
      ?auto_35343 - SURFACE
      ?auto_35344 - SURFACE
      ?auto_35345 - SURFACE
    )
    :vars
    (
      ?auto_35354 - HOIST
      ?auto_35346 - PLACE
      ?auto_35353 - PLACE
      ?auto_35351 - HOIST
      ?auto_35350 - SURFACE
      ?auto_35352 - PLACE
      ?auto_35348 - HOIST
      ?auto_35355 - SURFACE
      ?auto_35347 - SURFACE
      ?auto_35349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35354 ?auto_35346 ) ( IS-CRATE ?auto_35345 ) ( not ( = ?auto_35344 ?auto_35345 ) ) ( not ( = ?auto_35343 ?auto_35344 ) ) ( not ( = ?auto_35343 ?auto_35345 ) ) ( not ( = ?auto_35353 ?auto_35346 ) ) ( HOIST-AT ?auto_35351 ?auto_35353 ) ( not ( = ?auto_35354 ?auto_35351 ) ) ( SURFACE-AT ?auto_35345 ?auto_35353 ) ( ON ?auto_35345 ?auto_35350 ) ( CLEAR ?auto_35345 ) ( not ( = ?auto_35344 ?auto_35350 ) ) ( not ( = ?auto_35345 ?auto_35350 ) ) ( not ( = ?auto_35343 ?auto_35350 ) ) ( IS-CRATE ?auto_35344 ) ( not ( = ?auto_35352 ?auto_35346 ) ) ( not ( = ?auto_35353 ?auto_35352 ) ) ( HOIST-AT ?auto_35348 ?auto_35352 ) ( not ( = ?auto_35354 ?auto_35348 ) ) ( not ( = ?auto_35351 ?auto_35348 ) ) ( AVAILABLE ?auto_35348 ) ( SURFACE-AT ?auto_35344 ?auto_35352 ) ( ON ?auto_35344 ?auto_35355 ) ( CLEAR ?auto_35344 ) ( not ( = ?auto_35344 ?auto_35355 ) ) ( not ( = ?auto_35345 ?auto_35355 ) ) ( not ( = ?auto_35343 ?auto_35355 ) ) ( not ( = ?auto_35350 ?auto_35355 ) ) ( IS-CRATE ?auto_35343 ) ( not ( = ?auto_35342 ?auto_35343 ) ) ( not ( = ?auto_35344 ?auto_35342 ) ) ( not ( = ?auto_35345 ?auto_35342 ) ) ( not ( = ?auto_35350 ?auto_35342 ) ) ( not ( = ?auto_35355 ?auto_35342 ) ) ( SURFACE-AT ?auto_35343 ?auto_35353 ) ( ON ?auto_35343 ?auto_35347 ) ( CLEAR ?auto_35343 ) ( not ( = ?auto_35344 ?auto_35347 ) ) ( not ( = ?auto_35345 ?auto_35347 ) ) ( not ( = ?auto_35343 ?auto_35347 ) ) ( not ( = ?auto_35350 ?auto_35347 ) ) ( not ( = ?auto_35355 ?auto_35347 ) ) ( not ( = ?auto_35342 ?auto_35347 ) ) ( SURFACE-AT ?auto_35341 ?auto_35346 ) ( CLEAR ?auto_35341 ) ( IS-CRATE ?auto_35342 ) ( not ( = ?auto_35341 ?auto_35342 ) ) ( not ( = ?auto_35344 ?auto_35341 ) ) ( not ( = ?auto_35345 ?auto_35341 ) ) ( not ( = ?auto_35343 ?auto_35341 ) ) ( not ( = ?auto_35350 ?auto_35341 ) ) ( not ( = ?auto_35355 ?auto_35341 ) ) ( not ( = ?auto_35347 ?auto_35341 ) ) ( AVAILABLE ?auto_35354 ) ( TRUCK-AT ?auto_35349 ?auto_35353 ) ( LIFTING ?auto_35351 ?auto_35342 ) ( ON ?auto_35341 ?auto_35340 ) ( not ( = ?auto_35340 ?auto_35341 ) ) ( not ( = ?auto_35340 ?auto_35342 ) ) ( not ( = ?auto_35340 ?auto_35343 ) ) ( not ( = ?auto_35340 ?auto_35344 ) ) ( not ( = ?auto_35340 ?auto_35345 ) ) ( not ( = ?auto_35340 ?auto_35350 ) ) ( not ( = ?auto_35340 ?auto_35355 ) ) ( not ( = ?auto_35340 ?auto_35347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35343 ?auto_35344 ?auto_35345 )
      ( MAKE-5CRATE-VERIFY ?auto_35340 ?auto_35341 ?auto_35342 ?auto_35343 ?auto_35344 ?auto_35345 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35356 - SURFACE
      ?auto_35357 - SURFACE
    )
    :vars
    (
      ?auto_35369 - HOIST
      ?auto_35358 - PLACE
      ?auto_35362 - SURFACE
      ?auto_35368 - PLACE
      ?auto_35366 - HOIST
      ?auto_35365 - SURFACE
      ?auto_35367 - PLACE
      ?auto_35363 - HOIST
      ?auto_35370 - SURFACE
      ?auto_35360 - SURFACE
      ?auto_35359 - SURFACE
      ?auto_35361 - SURFACE
      ?auto_35364 - TRUCK
      ?auto_35371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35369 ?auto_35358 ) ( IS-CRATE ?auto_35357 ) ( not ( = ?auto_35356 ?auto_35357 ) ) ( not ( = ?auto_35362 ?auto_35356 ) ) ( not ( = ?auto_35362 ?auto_35357 ) ) ( not ( = ?auto_35368 ?auto_35358 ) ) ( HOIST-AT ?auto_35366 ?auto_35368 ) ( not ( = ?auto_35369 ?auto_35366 ) ) ( SURFACE-AT ?auto_35357 ?auto_35368 ) ( ON ?auto_35357 ?auto_35365 ) ( CLEAR ?auto_35357 ) ( not ( = ?auto_35356 ?auto_35365 ) ) ( not ( = ?auto_35357 ?auto_35365 ) ) ( not ( = ?auto_35362 ?auto_35365 ) ) ( IS-CRATE ?auto_35356 ) ( not ( = ?auto_35367 ?auto_35358 ) ) ( not ( = ?auto_35368 ?auto_35367 ) ) ( HOIST-AT ?auto_35363 ?auto_35367 ) ( not ( = ?auto_35369 ?auto_35363 ) ) ( not ( = ?auto_35366 ?auto_35363 ) ) ( AVAILABLE ?auto_35363 ) ( SURFACE-AT ?auto_35356 ?auto_35367 ) ( ON ?auto_35356 ?auto_35370 ) ( CLEAR ?auto_35356 ) ( not ( = ?auto_35356 ?auto_35370 ) ) ( not ( = ?auto_35357 ?auto_35370 ) ) ( not ( = ?auto_35362 ?auto_35370 ) ) ( not ( = ?auto_35365 ?auto_35370 ) ) ( IS-CRATE ?auto_35362 ) ( not ( = ?auto_35360 ?auto_35362 ) ) ( not ( = ?auto_35356 ?auto_35360 ) ) ( not ( = ?auto_35357 ?auto_35360 ) ) ( not ( = ?auto_35365 ?auto_35360 ) ) ( not ( = ?auto_35370 ?auto_35360 ) ) ( SURFACE-AT ?auto_35362 ?auto_35368 ) ( ON ?auto_35362 ?auto_35359 ) ( CLEAR ?auto_35362 ) ( not ( = ?auto_35356 ?auto_35359 ) ) ( not ( = ?auto_35357 ?auto_35359 ) ) ( not ( = ?auto_35362 ?auto_35359 ) ) ( not ( = ?auto_35365 ?auto_35359 ) ) ( not ( = ?auto_35370 ?auto_35359 ) ) ( not ( = ?auto_35360 ?auto_35359 ) ) ( SURFACE-AT ?auto_35361 ?auto_35358 ) ( CLEAR ?auto_35361 ) ( IS-CRATE ?auto_35360 ) ( not ( = ?auto_35361 ?auto_35360 ) ) ( not ( = ?auto_35356 ?auto_35361 ) ) ( not ( = ?auto_35357 ?auto_35361 ) ) ( not ( = ?auto_35362 ?auto_35361 ) ) ( not ( = ?auto_35365 ?auto_35361 ) ) ( not ( = ?auto_35370 ?auto_35361 ) ) ( not ( = ?auto_35359 ?auto_35361 ) ) ( AVAILABLE ?auto_35369 ) ( TRUCK-AT ?auto_35364 ?auto_35368 ) ( AVAILABLE ?auto_35366 ) ( SURFACE-AT ?auto_35360 ?auto_35368 ) ( ON ?auto_35360 ?auto_35371 ) ( CLEAR ?auto_35360 ) ( not ( = ?auto_35356 ?auto_35371 ) ) ( not ( = ?auto_35357 ?auto_35371 ) ) ( not ( = ?auto_35362 ?auto_35371 ) ) ( not ( = ?auto_35365 ?auto_35371 ) ) ( not ( = ?auto_35370 ?auto_35371 ) ) ( not ( = ?auto_35360 ?auto_35371 ) ) ( not ( = ?auto_35359 ?auto_35371 ) ) ( not ( = ?auto_35361 ?auto_35371 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35366 ?auto_35360 ?auto_35371 ?auto_35368 )
      ( MAKE-2CRATE ?auto_35362 ?auto_35356 ?auto_35357 )
      ( MAKE-1CRATE-VERIFY ?auto_35356 ?auto_35357 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35372 - SURFACE
      ?auto_35373 - SURFACE
      ?auto_35374 - SURFACE
    )
    :vars
    (
      ?auto_35384 - HOIST
      ?auto_35382 - PLACE
      ?auto_35379 - PLACE
      ?auto_35375 - HOIST
      ?auto_35378 - SURFACE
      ?auto_35383 - PLACE
      ?auto_35386 - HOIST
      ?auto_35385 - SURFACE
      ?auto_35376 - SURFACE
      ?auto_35387 - SURFACE
      ?auto_35377 - SURFACE
      ?auto_35381 - TRUCK
      ?auto_35380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35384 ?auto_35382 ) ( IS-CRATE ?auto_35374 ) ( not ( = ?auto_35373 ?auto_35374 ) ) ( not ( = ?auto_35372 ?auto_35373 ) ) ( not ( = ?auto_35372 ?auto_35374 ) ) ( not ( = ?auto_35379 ?auto_35382 ) ) ( HOIST-AT ?auto_35375 ?auto_35379 ) ( not ( = ?auto_35384 ?auto_35375 ) ) ( SURFACE-AT ?auto_35374 ?auto_35379 ) ( ON ?auto_35374 ?auto_35378 ) ( CLEAR ?auto_35374 ) ( not ( = ?auto_35373 ?auto_35378 ) ) ( not ( = ?auto_35374 ?auto_35378 ) ) ( not ( = ?auto_35372 ?auto_35378 ) ) ( IS-CRATE ?auto_35373 ) ( not ( = ?auto_35383 ?auto_35382 ) ) ( not ( = ?auto_35379 ?auto_35383 ) ) ( HOIST-AT ?auto_35386 ?auto_35383 ) ( not ( = ?auto_35384 ?auto_35386 ) ) ( not ( = ?auto_35375 ?auto_35386 ) ) ( AVAILABLE ?auto_35386 ) ( SURFACE-AT ?auto_35373 ?auto_35383 ) ( ON ?auto_35373 ?auto_35385 ) ( CLEAR ?auto_35373 ) ( not ( = ?auto_35373 ?auto_35385 ) ) ( not ( = ?auto_35374 ?auto_35385 ) ) ( not ( = ?auto_35372 ?auto_35385 ) ) ( not ( = ?auto_35378 ?auto_35385 ) ) ( IS-CRATE ?auto_35372 ) ( not ( = ?auto_35376 ?auto_35372 ) ) ( not ( = ?auto_35373 ?auto_35376 ) ) ( not ( = ?auto_35374 ?auto_35376 ) ) ( not ( = ?auto_35378 ?auto_35376 ) ) ( not ( = ?auto_35385 ?auto_35376 ) ) ( SURFACE-AT ?auto_35372 ?auto_35379 ) ( ON ?auto_35372 ?auto_35387 ) ( CLEAR ?auto_35372 ) ( not ( = ?auto_35373 ?auto_35387 ) ) ( not ( = ?auto_35374 ?auto_35387 ) ) ( not ( = ?auto_35372 ?auto_35387 ) ) ( not ( = ?auto_35378 ?auto_35387 ) ) ( not ( = ?auto_35385 ?auto_35387 ) ) ( not ( = ?auto_35376 ?auto_35387 ) ) ( SURFACE-AT ?auto_35377 ?auto_35382 ) ( CLEAR ?auto_35377 ) ( IS-CRATE ?auto_35376 ) ( not ( = ?auto_35377 ?auto_35376 ) ) ( not ( = ?auto_35373 ?auto_35377 ) ) ( not ( = ?auto_35374 ?auto_35377 ) ) ( not ( = ?auto_35372 ?auto_35377 ) ) ( not ( = ?auto_35378 ?auto_35377 ) ) ( not ( = ?auto_35385 ?auto_35377 ) ) ( not ( = ?auto_35387 ?auto_35377 ) ) ( AVAILABLE ?auto_35384 ) ( TRUCK-AT ?auto_35381 ?auto_35379 ) ( AVAILABLE ?auto_35375 ) ( SURFACE-AT ?auto_35376 ?auto_35379 ) ( ON ?auto_35376 ?auto_35380 ) ( CLEAR ?auto_35376 ) ( not ( = ?auto_35373 ?auto_35380 ) ) ( not ( = ?auto_35374 ?auto_35380 ) ) ( not ( = ?auto_35372 ?auto_35380 ) ) ( not ( = ?auto_35378 ?auto_35380 ) ) ( not ( = ?auto_35385 ?auto_35380 ) ) ( not ( = ?auto_35376 ?auto_35380 ) ) ( not ( = ?auto_35387 ?auto_35380 ) ) ( not ( = ?auto_35377 ?auto_35380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35373 ?auto_35374 )
      ( MAKE-2CRATE-VERIFY ?auto_35372 ?auto_35373 ?auto_35374 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35388 - SURFACE
      ?auto_35389 - SURFACE
      ?auto_35390 - SURFACE
      ?auto_35391 - SURFACE
    )
    :vars
    (
      ?auto_35397 - HOIST
      ?auto_35400 - PLACE
      ?auto_35395 - PLACE
      ?auto_35403 - HOIST
      ?auto_35399 - SURFACE
      ?auto_35398 - PLACE
      ?auto_35392 - HOIST
      ?auto_35393 - SURFACE
      ?auto_35402 - SURFACE
      ?auto_35396 - SURFACE
      ?auto_35394 - TRUCK
      ?auto_35401 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35397 ?auto_35400 ) ( IS-CRATE ?auto_35391 ) ( not ( = ?auto_35390 ?auto_35391 ) ) ( not ( = ?auto_35389 ?auto_35390 ) ) ( not ( = ?auto_35389 ?auto_35391 ) ) ( not ( = ?auto_35395 ?auto_35400 ) ) ( HOIST-AT ?auto_35403 ?auto_35395 ) ( not ( = ?auto_35397 ?auto_35403 ) ) ( SURFACE-AT ?auto_35391 ?auto_35395 ) ( ON ?auto_35391 ?auto_35399 ) ( CLEAR ?auto_35391 ) ( not ( = ?auto_35390 ?auto_35399 ) ) ( not ( = ?auto_35391 ?auto_35399 ) ) ( not ( = ?auto_35389 ?auto_35399 ) ) ( IS-CRATE ?auto_35390 ) ( not ( = ?auto_35398 ?auto_35400 ) ) ( not ( = ?auto_35395 ?auto_35398 ) ) ( HOIST-AT ?auto_35392 ?auto_35398 ) ( not ( = ?auto_35397 ?auto_35392 ) ) ( not ( = ?auto_35403 ?auto_35392 ) ) ( AVAILABLE ?auto_35392 ) ( SURFACE-AT ?auto_35390 ?auto_35398 ) ( ON ?auto_35390 ?auto_35393 ) ( CLEAR ?auto_35390 ) ( not ( = ?auto_35390 ?auto_35393 ) ) ( not ( = ?auto_35391 ?auto_35393 ) ) ( not ( = ?auto_35389 ?auto_35393 ) ) ( not ( = ?auto_35399 ?auto_35393 ) ) ( IS-CRATE ?auto_35389 ) ( not ( = ?auto_35388 ?auto_35389 ) ) ( not ( = ?auto_35390 ?auto_35388 ) ) ( not ( = ?auto_35391 ?auto_35388 ) ) ( not ( = ?auto_35399 ?auto_35388 ) ) ( not ( = ?auto_35393 ?auto_35388 ) ) ( SURFACE-AT ?auto_35389 ?auto_35395 ) ( ON ?auto_35389 ?auto_35402 ) ( CLEAR ?auto_35389 ) ( not ( = ?auto_35390 ?auto_35402 ) ) ( not ( = ?auto_35391 ?auto_35402 ) ) ( not ( = ?auto_35389 ?auto_35402 ) ) ( not ( = ?auto_35399 ?auto_35402 ) ) ( not ( = ?auto_35393 ?auto_35402 ) ) ( not ( = ?auto_35388 ?auto_35402 ) ) ( SURFACE-AT ?auto_35396 ?auto_35400 ) ( CLEAR ?auto_35396 ) ( IS-CRATE ?auto_35388 ) ( not ( = ?auto_35396 ?auto_35388 ) ) ( not ( = ?auto_35390 ?auto_35396 ) ) ( not ( = ?auto_35391 ?auto_35396 ) ) ( not ( = ?auto_35389 ?auto_35396 ) ) ( not ( = ?auto_35399 ?auto_35396 ) ) ( not ( = ?auto_35393 ?auto_35396 ) ) ( not ( = ?auto_35402 ?auto_35396 ) ) ( AVAILABLE ?auto_35397 ) ( TRUCK-AT ?auto_35394 ?auto_35395 ) ( AVAILABLE ?auto_35403 ) ( SURFACE-AT ?auto_35388 ?auto_35395 ) ( ON ?auto_35388 ?auto_35401 ) ( CLEAR ?auto_35388 ) ( not ( = ?auto_35390 ?auto_35401 ) ) ( not ( = ?auto_35391 ?auto_35401 ) ) ( not ( = ?auto_35389 ?auto_35401 ) ) ( not ( = ?auto_35399 ?auto_35401 ) ) ( not ( = ?auto_35393 ?auto_35401 ) ) ( not ( = ?auto_35388 ?auto_35401 ) ) ( not ( = ?auto_35402 ?auto_35401 ) ) ( not ( = ?auto_35396 ?auto_35401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35389 ?auto_35390 ?auto_35391 )
      ( MAKE-3CRATE-VERIFY ?auto_35388 ?auto_35389 ?auto_35390 ?auto_35391 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35404 - SURFACE
      ?auto_35405 - SURFACE
      ?auto_35406 - SURFACE
      ?auto_35407 - SURFACE
      ?auto_35408 - SURFACE
    )
    :vars
    (
      ?auto_35413 - HOIST
      ?auto_35416 - PLACE
      ?auto_35412 - PLACE
      ?auto_35419 - HOIST
      ?auto_35415 - SURFACE
      ?auto_35414 - PLACE
      ?auto_35409 - HOIST
      ?auto_35410 - SURFACE
      ?auto_35418 - SURFACE
      ?auto_35411 - TRUCK
      ?auto_35417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35413 ?auto_35416 ) ( IS-CRATE ?auto_35408 ) ( not ( = ?auto_35407 ?auto_35408 ) ) ( not ( = ?auto_35406 ?auto_35407 ) ) ( not ( = ?auto_35406 ?auto_35408 ) ) ( not ( = ?auto_35412 ?auto_35416 ) ) ( HOIST-AT ?auto_35419 ?auto_35412 ) ( not ( = ?auto_35413 ?auto_35419 ) ) ( SURFACE-AT ?auto_35408 ?auto_35412 ) ( ON ?auto_35408 ?auto_35415 ) ( CLEAR ?auto_35408 ) ( not ( = ?auto_35407 ?auto_35415 ) ) ( not ( = ?auto_35408 ?auto_35415 ) ) ( not ( = ?auto_35406 ?auto_35415 ) ) ( IS-CRATE ?auto_35407 ) ( not ( = ?auto_35414 ?auto_35416 ) ) ( not ( = ?auto_35412 ?auto_35414 ) ) ( HOIST-AT ?auto_35409 ?auto_35414 ) ( not ( = ?auto_35413 ?auto_35409 ) ) ( not ( = ?auto_35419 ?auto_35409 ) ) ( AVAILABLE ?auto_35409 ) ( SURFACE-AT ?auto_35407 ?auto_35414 ) ( ON ?auto_35407 ?auto_35410 ) ( CLEAR ?auto_35407 ) ( not ( = ?auto_35407 ?auto_35410 ) ) ( not ( = ?auto_35408 ?auto_35410 ) ) ( not ( = ?auto_35406 ?auto_35410 ) ) ( not ( = ?auto_35415 ?auto_35410 ) ) ( IS-CRATE ?auto_35406 ) ( not ( = ?auto_35405 ?auto_35406 ) ) ( not ( = ?auto_35407 ?auto_35405 ) ) ( not ( = ?auto_35408 ?auto_35405 ) ) ( not ( = ?auto_35415 ?auto_35405 ) ) ( not ( = ?auto_35410 ?auto_35405 ) ) ( SURFACE-AT ?auto_35406 ?auto_35412 ) ( ON ?auto_35406 ?auto_35418 ) ( CLEAR ?auto_35406 ) ( not ( = ?auto_35407 ?auto_35418 ) ) ( not ( = ?auto_35408 ?auto_35418 ) ) ( not ( = ?auto_35406 ?auto_35418 ) ) ( not ( = ?auto_35415 ?auto_35418 ) ) ( not ( = ?auto_35410 ?auto_35418 ) ) ( not ( = ?auto_35405 ?auto_35418 ) ) ( SURFACE-AT ?auto_35404 ?auto_35416 ) ( CLEAR ?auto_35404 ) ( IS-CRATE ?auto_35405 ) ( not ( = ?auto_35404 ?auto_35405 ) ) ( not ( = ?auto_35407 ?auto_35404 ) ) ( not ( = ?auto_35408 ?auto_35404 ) ) ( not ( = ?auto_35406 ?auto_35404 ) ) ( not ( = ?auto_35415 ?auto_35404 ) ) ( not ( = ?auto_35410 ?auto_35404 ) ) ( not ( = ?auto_35418 ?auto_35404 ) ) ( AVAILABLE ?auto_35413 ) ( TRUCK-AT ?auto_35411 ?auto_35412 ) ( AVAILABLE ?auto_35419 ) ( SURFACE-AT ?auto_35405 ?auto_35412 ) ( ON ?auto_35405 ?auto_35417 ) ( CLEAR ?auto_35405 ) ( not ( = ?auto_35407 ?auto_35417 ) ) ( not ( = ?auto_35408 ?auto_35417 ) ) ( not ( = ?auto_35406 ?auto_35417 ) ) ( not ( = ?auto_35415 ?auto_35417 ) ) ( not ( = ?auto_35410 ?auto_35417 ) ) ( not ( = ?auto_35405 ?auto_35417 ) ) ( not ( = ?auto_35418 ?auto_35417 ) ) ( not ( = ?auto_35404 ?auto_35417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35406 ?auto_35407 ?auto_35408 )
      ( MAKE-4CRATE-VERIFY ?auto_35404 ?auto_35405 ?auto_35406 ?auto_35407 ?auto_35408 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35420 - SURFACE
      ?auto_35421 - SURFACE
      ?auto_35422 - SURFACE
      ?auto_35423 - SURFACE
      ?auto_35424 - SURFACE
      ?auto_35425 - SURFACE
    )
    :vars
    (
      ?auto_35430 - HOIST
      ?auto_35433 - PLACE
      ?auto_35429 - PLACE
      ?auto_35436 - HOIST
      ?auto_35432 - SURFACE
      ?auto_35431 - PLACE
      ?auto_35426 - HOIST
      ?auto_35427 - SURFACE
      ?auto_35435 - SURFACE
      ?auto_35428 - TRUCK
      ?auto_35434 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35430 ?auto_35433 ) ( IS-CRATE ?auto_35425 ) ( not ( = ?auto_35424 ?auto_35425 ) ) ( not ( = ?auto_35423 ?auto_35424 ) ) ( not ( = ?auto_35423 ?auto_35425 ) ) ( not ( = ?auto_35429 ?auto_35433 ) ) ( HOIST-AT ?auto_35436 ?auto_35429 ) ( not ( = ?auto_35430 ?auto_35436 ) ) ( SURFACE-AT ?auto_35425 ?auto_35429 ) ( ON ?auto_35425 ?auto_35432 ) ( CLEAR ?auto_35425 ) ( not ( = ?auto_35424 ?auto_35432 ) ) ( not ( = ?auto_35425 ?auto_35432 ) ) ( not ( = ?auto_35423 ?auto_35432 ) ) ( IS-CRATE ?auto_35424 ) ( not ( = ?auto_35431 ?auto_35433 ) ) ( not ( = ?auto_35429 ?auto_35431 ) ) ( HOIST-AT ?auto_35426 ?auto_35431 ) ( not ( = ?auto_35430 ?auto_35426 ) ) ( not ( = ?auto_35436 ?auto_35426 ) ) ( AVAILABLE ?auto_35426 ) ( SURFACE-AT ?auto_35424 ?auto_35431 ) ( ON ?auto_35424 ?auto_35427 ) ( CLEAR ?auto_35424 ) ( not ( = ?auto_35424 ?auto_35427 ) ) ( not ( = ?auto_35425 ?auto_35427 ) ) ( not ( = ?auto_35423 ?auto_35427 ) ) ( not ( = ?auto_35432 ?auto_35427 ) ) ( IS-CRATE ?auto_35423 ) ( not ( = ?auto_35422 ?auto_35423 ) ) ( not ( = ?auto_35424 ?auto_35422 ) ) ( not ( = ?auto_35425 ?auto_35422 ) ) ( not ( = ?auto_35432 ?auto_35422 ) ) ( not ( = ?auto_35427 ?auto_35422 ) ) ( SURFACE-AT ?auto_35423 ?auto_35429 ) ( ON ?auto_35423 ?auto_35435 ) ( CLEAR ?auto_35423 ) ( not ( = ?auto_35424 ?auto_35435 ) ) ( not ( = ?auto_35425 ?auto_35435 ) ) ( not ( = ?auto_35423 ?auto_35435 ) ) ( not ( = ?auto_35432 ?auto_35435 ) ) ( not ( = ?auto_35427 ?auto_35435 ) ) ( not ( = ?auto_35422 ?auto_35435 ) ) ( SURFACE-AT ?auto_35421 ?auto_35433 ) ( CLEAR ?auto_35421 ) ( IS-CRATE ?auto_35422 ) ( not ( = ?auto_35421 ?auto_35422 ) ) ( not ( = ?auto_35424 ?auto_35421 ) ) ( not ( = ?auto_35425 ?auto_35421 ) ) ( not ( = ?auto_35423 ?auto_35421 ) ) ( not ( = ?auto_35432 ?auto_35421 ) ) ( not ( = ?auto_35427 ?auto_35421 ) ) ( not ( = ?auto_35435 ?auto_35421 ) ) ( AVAILABLE ?auto_35430 ) ( TRUCK-AT ?auto_35428 ?auto_35429 ) ( AVAILABLE ?auto_35436 ) ( SURFACE-AT ?auto_35422 ?auto_35429 ) ( ON ?auto_35422 ?auto_35434 ) ( CLEAR ?auto_35422 ) ( not ( = ?auto_35424 ?auto_35434 ) ) ( not ( = ?auto_35425 ?auto_35434 ) ) ( not ( = ?auto_35423 ?auto_35434 ) ) ( not ( = ?auto_35432 ?auto_35434 ) ) ( not ( = ?auto_35427 ?auto_35434 ) ) ( not ( = ?auto_35422 ?auto_35434 ) ) ( not ( = ?auto_35435 ?auto_35434 ) ) ( not ( = ?auto_35421 ?auto_35434 ) ) ( ON ?auto_35421 ?auto_35420 ) ( not ( = ?auto_35420 ?auto_35421 ) ) ( not ( = ?auto_35420 ?auto_35422 ) ) ( not ( = ?auto_35420 ?auto_35423 ) ) ( not ( = ?auto_35420 ?auto_35424 ) ) ( not ( = ?auto_35420 ?auto_35425 ) ) ( not ( = ?auto_35420 ?auto_35432 ) ) ( not ( = ?auto_35420 ?auto_35427 ) ) ( not ( = ?auto_35420 ?auto_35435 ) ) ( not ( = ?auto_35420 ?auto_35434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35423 ?auto_35424 ?auto_35425 )
      ( MAKE-5CRATE-VERIFY ?auto_35420 ?auto_35421 ?auto_35422 ?auto_35423 ?auto_35424 ?auto_35425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35437 - SURFACE
      ?auto_35438 - SURFACE
    )
    :vars
    (
      ?auto_35446 - HOIST
      ?auto_35449 - PLACE
      ?auto_35443 - SURFACE
      ?auto_35444 - PLACE
      ?auto_35452 - HOIST
      ?auto_35448 - SURFACE
      ?auto_35447 - PLACE
      ?auto_35439 - HOIST
      ?auto_35440 - SURFACE
      ?auto_35441 - SURFACE
      ?auto_35451 - SURFACE
      ?auto_35445 - SURFACE
      ?auto_35450 - SURFACE
      ?auto_35442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35446 ?auto_35449 ) ( IS-CRATE ?auto_35438 ) ( not ( = ?auto_35437 ?auto_35438 ) ) ( not ( = ?auto_35443 ?auto_35437 ) ) ( not ( = ?auto_35443 ?auto_35438 ) ) ( not ( = ?auto_35444 ?auto_35449 ) ) ( HOIST-AT ?auto_35452 ?auto_35444 ) ( not ( = ?auto_35446 ?auto_35452 ) ) ( SURFACE-AT ?auto_35438 ?auto_35444 ) ( ON ?auto_35438 ?auto_35448 ) ( CLEAR ?auto_35438 ) ( not ( = ?auto_35437 ?auto_35448 ) ) ( not ( = ?auto_35438 ?auto_35448 ) ) ( not ( = ?auto_35443 ?auto_35448 ) ) ( IS-CRATE ?auto_35437 ) ( not ( = ?auto_35447 ?auto_35449 ) ) ( not ( = ?auto_35444 ?auto_35447 ) ) ( HOIST-AT ?auto_35439 ?auto_35447 ) ( not ( = ?auto_35446 ?auto_35439 ) ) ( not ( = ?auto_35452 ?auto_35439 ) ) ( AVAILABLE ?auto_35439 ) ( SURFACE-AT ?auto_35437 ?auto_35447 ) ( ON ?auto_35437 ?auto_35440 ) ( CLEAR ?auto_35437 ) ( not ( = ?auto_35437 ?auto_35440 ) ) ( not ( = ?auto_35438 ?auto_35440 ) ) ( not ( = ?auto_35443 ?auto_35440 ) ) ( not ( = ?auto_35448 ?auto_35440 ) ) ( IS-CRATE ?auto_35443 ) ( not ( = ?auto_35441 ?auto_35443 ) ) ( not ( = ?auto_35437 ?auto_35441 ) ) ( not ( = ?auto_35438 ?auto_35441 ) ) ( not ( = ?auto_35448 ?auto_35441 ) ) ( not ( = ?auto_35440 ?auto_35441 ) ) ( SURFACE-AT ?auto_35443 ?auto_35444 ) ( ON ?auto_35443 ?auto_35451 ) ( CLEAR ?auto_35443 ) ( not ( = ?auto_35437 ?auto_35451 ) ) ( not ( = ?auto_35438 ?auto_35451 ) ) ( not ( = ?auto_35443 ?auto_35451 ) ) ( not ( = ?auto_35448 ?auto_35451 ) ) ( not ( = ?auto_35440 ?auto_35451 ) ) ( not ( = ?auto_35441 ?auto_35451 ) ) ( SURFACE-AT ?auto_35445 ?auto_35449 ) ( CLEAR ?auto_35445 ) ( IS-CRATE ?auto_35441 ) ( not ( = ?auto_35445 ?auto_35441 ) ) ( not ( = ?auto_35437 ?auto_35445 ) ) ( not ( = ?auto_35438 ?auto_35445 ) ) ( not ( = ?auto_35443 ?auto_35445 ) ) ( not ( = ?auto_35448 ?auto_35445 ) ) ( not ( = ?auto_35440 ?auto_35445 ) ) ( not ( = ?auto_35451 ?auto_35445 ) ) ( AVAILABLE ?auto_35446 ) ( AVAILABLE ?auto_35452 ) ( SURFACE-AT ?auto_35441 ?auto_35444 ) ( ON ?auto_35441 ?auto_35450 ) ( CLEAR ?auto_35441 ) ( not ( = ?auto_35437 ?auto_35450 ) ) ( not ( = ?auto_35438 ?auto_35450 ) ) ( not ( = ?auto_35443 ?auto_35450 ) ) ( not ( = ?auto_35448 ?auto_35450 ) ) ( not ( = ?auto_35440 ?auto_35450 ) ) ( not ( = ?auto_35441 ?auto_35450 ) ) ( not ( = ?auto_35451 ?auto_35450 ) ) ( not ( = ?auto_35445 ?auto_35450 ) ) ( TRUCK-AT ?auto_35442 ?auto_35449 ) )
    :subtasks
    ( ( !DRIVE ?auto_35442 ?auto_35449 ?auto_35444 )
      ( MAKE-2CRATE ?auto_35443 ?auto_35437 ?auto_35438 )
      ( MAKE-1CRATE-VERIFY ?auto_35437 ?auto_35438 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35453 - SURFACE
      ?auto_35454 - SURFACE
      ?auto_35455 - SURFACE
    )
    :vars
    (
      ?auto_35465 - HOIST
      ?auto_35459 - PLACE
      ?auto_35456 - PLACE
      ?auto_35463 - HOIST
      ?auto_35462 - SURFACE
      ?auto_35458 - PLACE
      ?auto_35460 - HOIST
      ?auto_35457 - SURFACE
      ?auto_35467 - SURFACE
      ?auto_35464 - SURFACE
      ?auto_35461 - SURFACE
      ?auto_35466 - SURFACE
      ?auto_35468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35465 ?auto_35459 ) ( IS-CRATE ?auto_35455 ) ( not ( = ?auto_35454 ?auto_35455 ) ) ( not ( = ?auto_35453 ?auto_35454 ) ) ( not ( = ?auto_35453 ?auto_35455 ) ) ( not ( = ?auto_35456 ?auto_35459 ) ) ( HOIST-AT ?auto_35463 ?auto_35456 ) ( not ( = ?auto_35465 ?auto_35463 ) ) ( SURFACE-AT ?auto_35455 ?auto_35456 ) ( ON ?auto_35455 ?auto_35462 ) ( CLEAR ?auto_35455 ) ( not ( = ?auto_35454 ?auto_35462 ) ) ( not ( = ?auto_35455 ?auto_35462 ) ) ( not ( = ?auto_35453 ?auto_35462 ) ) ( IS-CRATE ?auto_35454 ) ( not ( = ?auto_35458 ?auto_35459 ) ) ( not ( = ?auto_35456 ?auto_35458 ) ) ( HOIST-AT ?auto_35460 ?auto_35458 ) ( not ( = ?auto_35465 ?auto_35460 ) ) ( not ( = ?auto_35463 ?auto_35460 ) ) ( AVAILABLE ?auto_35460 ) ( SURFACE-AT ?auto_35454 ?auto_35458 ) ( ON ?auto_35454 ?auto_35457 ) ( CLEAR ?auto_35454 ) ( not ( = ?auto_35454 ?auto_35457 ) ) ( not ( = ?auto_35455 ?auto_35457 ) ) ( not ( = ?auto_35453 ?auto_35457 ) ) ( not ( = ?auto_35462 ?auto_35457 ) ) ( IS-CRATE ?auto_35453 ) ( not ( = ?auto_35467 ?auto_35453 ) ) ( not ( = ?auto_35454 ?auto_35467 ) ) ( not ( = ?auto_35455 ?auto_35467 ) ) ( not ( = ?auto_35462 ?auto_35467 ) ) ( not ( = ?auto_35457 ?auto_35467 ) ) ( SURFACE-AT ?auto_35453 ?auto_35456 ) ( ON ?auto_35453 ?auto_35464 ) ( CLEAR ?auto_35453 ) ( not ( = ?auto_35454 ?auto_35464 ) ) ( not ( = ?auto_35455 ?auto_35464 ) ) ( not ( = ?auto_35453 ?auto_35464 ) ) ( not ( = ?auto_35462 ?auto_35464 ) ) ( not ( = ?auto_35457 ?auto_35464 ) ) ( not ( = ?auto_35467 ?auto_35464 ) ) ( SURFACE-AT ?auto_35461 ?auto_35459 ) ( CLEAR ?auto_35461 ) ( IS-CRATE ?auto_35467 ) ( not ( = ?auto_35461 ?auto_35467 ) ) ( not ( = ?auto_35454 ?auto_35461 ) ) ( not ( = ?auto_35455 ?auto_35461 ) ) ( not ( = ?auto_35453 ?auto_35461 ) ) ( not ( = ?auto_35462 ?auto_35461 ) ) ( not ( = ?auto_35457 ?auto_35461 ) ) ( not ( = ?auto_35464 ?auto_35461 ) ) ( AVAILABLE ?auto_35465 ) ( AVAILABLE ?auto_35463 ) ( SURFACE-AT ?auto_35467 ?auto_35456 ) ( ON ?auto_35467 ?auto_35466 ) ( CLEAR ?auto_35467 ) ( not ( = ?auto_35454 ?auto_35466 ) ) ( not ( = ?auto_35455 ?auto_35466 ) ) ( not ( = ?auto_35453 ?auto_35466 ) ) ( not ( = ?auto_35462 ?auto_35466 ) ) ( not ( = ?auto_35457 ?auto_35466 ) ) ( not ( = ?auto_35467 ?auto_35466 ) ) ( not ( = ?auto_35464 ?auto_35466 ) ) ( not ( = ?auto_35461 ?auto_35466 ) ) ( TRUCK-AT ?auto_35468 ?auto_35459 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35454 ?auto_35455 )
      ( MAKE-2CRATE-VERIFY ?auto_35453 ?auto_35454 ?auto_35455 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35469 - SURFACE
      ?auto_35470 - SURFACE
      ?auto_35471 - SURFACE
      ?auto_35472 - SURFACE
    )
    :vars
    (
      ?auto_35482 - HOIST
      ?auto_35478 - PLACE
      ?auto_35477 - PLACE
      ?auto_35480 - HOIST
      ?auto_35479 - SURFACE
      ?auto_35475 - PLACE
      ?auto_35484 - HOIST
      ?auto_35476 - SURFACE
      ?auto_35481 - SURFACE
      ?auto_35473 - SURFACE
      ?auto_35483 - SURFACE
      ?auto_35474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35482 ?auto_35478 ) ( IS-CRATE ?auto_35472 ) ( not ( = ?auto_35471 ?auto_35472 ) ) ( not ( = ?auto_35470 ?auto_35471 ) ) ( not ( = ?auto_35470 ?auto_35472 ) ) ( not ( = ?auto_35477 ?auto_35478 ) ) ( HOIST-AT ?auto_35480 ?auto_35477 ) ( not ( = ?auto_35482 ?auto_35480 ) ) ( SURFACE-AT ?auto_35472 ?auto_35477 ) ( ON ?auto_35472 ?auto_35479 ) ( CLEAR ?auto_35472 ) ( not ( = ?auto_35471 ?auto_35479 ) ) ( not ( = ?auto_35472 ?auto_35479 ) ) ( not ( = ?auto_35470 ?auto_35479 ) ) ( IS-CRATE ?auto_35471 ) ( not ( = ?auto_35475 ?auto_35478 ) ) ( not ( = ?auto_35477 ?auto_35475 ) ) ( HOIST-AT ?auto_35484 ?auto_35475 ) ( not ( = ?auto_35482 ?auto_35484 ) ) ( not ( = ?auto_35480 ?auto_35484 ) ) ( AVAILABLE ?auto_35484 ) ( SURFACE-AT ?auto_35471 ?auto_35475 ) ( ON ?auto_35471 ?auto_35476 ) ( CLEAR ?auto_35471 ) ( not ( = ?auto_35471 ?auto_35476 ) ) ( not ( = ?auto_35472 ?auto_35476 ) ) ( not ( = ?auto_35470 ?auto_35476 ) ) ( not ( = ?auto_35479 ?auto_35476 ) ) ( IS-CRATE ?auto_35470 ) ( not ( = ?auto_35469 ?auto_35470 ) ) ( not ( = ?auto_35471 ?auto_35469 ) ) ( not ( = ?auto_35472 ?auto_35469 ) ) ( not ( = ?auto_35479 ?auto_35469 ) ) ( not ( = ?auto_35476 ?auto_35469 ) ) ( SURFACE-AT ?auto_35470 ?auto_35477 ) ( ON ?auto_35470 ?auto_35481 ) ( CLEAR ?auto_35470 ) ( not ( = ?auto_35471 ?auto_35481 ) ) ( not ( = ?auto_35472 ?auto_35481 ) ) ( not ( = ?auto_35470 ?auto_35481 ) ) ( not ( = ?auto_35479 ?auto_35481 ) ) ( not ( = ?auto_35476 ?auto_35481 ) ) ( not ( = ?auto_35469 ?auto_35481 ) ) ( SURFACE-AT ?auto_35473 ?auto_35478 ) ( CLEAR ?auto_35473 ) ( IS-CRATE ?auto_35469 ) ( not ( = ?auto_35473 ?auto_35469 ) ) ( not ( = ?auto_35471 ?auto_35473 ) ) ( not ( = ?auto_35472 ?auto_35473 ) ) ( not ( = ?auto_35470 ?auto_35473 ) ) ( not ( = ?auto_35479 ?auto_35473 ) ) ( not ( = ?auto_35476 ?auto_35473 ) ) ( not ( = ?auto_35481 ?auto_35473 ) ) ( AVAILABLE ?auto_35482 ) ( AVAILABLE ?auto_35480 ) ( SURFACE-AT ?auto_35469 ?auto_35477 ) ( ON ?auto_35469 ?auto_35483 ) ( CLEAR ?auto_35469 ) ( not ( = ?auto_35471 ?auto_35483 ) ) ( not ( = ?auto_35472 ?auto_35483 ) ) ( not ( = ?auto_35470 ?auto_35483 ) ) ( not ( = ?auto_35479 ?auto_35483 ) ) ( not ( = ?auto_35476 ?auto_35483 ) ) ( not ( = ?auto_35469 ?auto_35483 ) ) ( not ( = ?auto_35481 ?auto_35483 ) ) ( not ( = ?auto_35473 ?auto_35483 ) ) ( TRUCK-AT ?auto_35474 ?auto_35478 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35470 ?auto_35471 ?auto_35472 )
      ( MAKE-3CRATE-VERIFY ?auto_35469 ?auto_35470 ?auto_35471 ?auto_35472 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35485 - SURFACE
      ?auto_35486 - SURFACE
      ?auto_35487 - SURFACE
      ?auto_35488 - SURFACE
      ?auto_35489 - SURFACE
    )
    :vars
    (
      ?auto_35498 - HOIST
      ?auto_35494 - PLACE
      ?auto_35493 - PLACE
      ?auto_35496 - HOIST
      ?auto_35495 - SURFACE
      ?auto_35491 - PLACE
      ?auto_35500 - HOIST
      ?auto_35492 - SURFACE
      ?auto_35497 - SURFACE
      ?auto_35499 - SURFACE
      ?auto_35490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35498 ?auto_35494 ) ( IS-CRATE ?auto_35489 ) ( not ( = ?auto_35488 ?auto_35489 ) ) ( not ( = ?auto_35487 ?auto_35488 ) ) ( not ( = ?auto_35487 ?auto_35489 ) ) ( not ( = ?auto_35493 ?auto_35494 ) ) ( HOIST-AT ?auto_35496 ?auto_35493 ) ( not ( = ?auto_35498 ?auto_35496 ) ) ( SURFACE-AT ?auto_35489 ?auto_35493 ) ( ON ?auto_35489 ?auto_35495 ) ( CLEAR ?auto_35489 ) ( not ( = ?auto_35488 ?auto_35495 ) ) ( not ( = ?auto_35489 ?auto_35495 ) ) ( not ( = ?auto_35487 ?auto_35495 ) ) ( IS-CRATE ?auto_35488 ) ( not ( = ?auto_35491 ?auto_35494 ) ) ( not ( = ?auto_35493 ?auto_35491 ) ) ( HOIST-AT ?auto_35500 ?auto_35491 ) ( not ( = ?auto_35498 ?auto_35500 ) ) ( not ( = ?auto_35496 ?auto_35500 ) ) ( AVAILABLE ?auto_35500 ) ( SURFACE-AT ?auto_35488 ?auto_35491 ) ( ON ?auto_35488 ?auto_35492 ) ( CLEAR ?auto_35488 ) ( not ( = ?auto_35488 ?auto_35492 ) ) ( not ( = ?auto_35489 ?auto_35492 ) ) ( not ( = ?auto_35487 ?auto_35492 ) ) ( not ( = ?auto_35495 ?auto_35492 ) ) ( IS-CRATE ?auto_35487 ) ( not ( = ?auto_35486 ?auto_35487 ) ) ( not ( = ?auto_35488 ?auto_35486 ) ) ( not ( = ?auto_35489 ?auto_35486 ) ) ( not ( = ?auto_35495 ?auto_35486 ) ) ( not ( = ?auto_35492 ?auto_35486 ) ) ( SURFACE-AT ?auto_35487 ?auto_35493 ) ( ON ?auto_35487 ?auto_35497 ) ( CLEAR ?auto_35487 ) ( not ( = ?auto_35488 ?auto_35497 ) ) ( not ( = ?auto_35489 ?auto_35497 ) ) ( not ( = ?auto_35487 ?auto_35497 ) ) ( not ( = ?auto_35495 ?auto_35497 ) ) ( not ( = ?auto_35492 ?auto_35497 ) ) ( not ( = ?auto_35486 ?auto_35497 ) ) ( SURFACE-AT ?auto_35485 ?auto_35494 ) ( CLEAR ?auto_35485 ) ( IS-CRATE ?auto_35486 ) ( not ( = ?auto_35485 ?auto_35486 ) ) ( not ( = ?auto_35488 ?auto_35485 ) ) ( not ( = ?auto_35489 ?auto_35485 ) ) ( not ( = ?auto_35487 ?auto_35485 ) ) ( not ( = ?auto_35495 ?auto_35485 ) ) ( not ( = ?auto_35492 ?auto_35485 ) ) ( not ( = ?auto_35497 ?auto_35485 ) ) ( AVAILABLE ?auto_35498 ) ( AVAILABLE ?auto_35496 ) ( SURFACE-AT ?auto_35486 ?auto_35493 ) ( ON ?auto_35486 ?auto_35499 ) ( CLEAR ?auto_35486 ) ( not ( = ?auto_35488 ?auto_35499 ) ) ( not ( = ?auto_35489 ?auto_35499 ) ) ( not ( = ?auto_35487 ?auto_35499 ) ) ( not ( = ?auto_35495 ?auto_35499 ) ) ( not ( = ?auto_35492 ?auto_35499 ) ) ( not ( = ?auto_35486 ?auto_35499 ) ) ( not ( = ?auto_35497 ?auto_35499 ) ) ( not ( = ?auto_35485 ?auto_35499 ) ) ( TRUCK-AT ?auto_35490 ?auto_35494 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35487 ?auto_35488 ?auto_35489 )
      ( MAKE-4CRATE-VERIFY ?auto_35485 ?auto_35486 ?auto_35487 ?auto_35488 ?auto_35489 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35501 - SURFACE
      ?auto_35502 - SURFACE
      ?auto_35503 - SURFACE
      ?auto_35504 - SURFACE
      ?auto_35505 - SURFACE
      ?auto_35506 - SURFACE
    )
    :vars
    (
      ?auto_35515 - HOIST
      ?auto_35511 - PLACE
      ?auto_35510 - PLACE
      ?auto_35513 - HOIST
      ?auto_35512 - SURFACE
      ?auto_35508 - PLACE
      ?auto_35517 - HOIST
      ?auto_35509 - SURFACE
      ?auto_35514 - SURFACE
      ?auto_35516 - SURFACE
      ?auto_35507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35515 ?auto_35511 ) ( IS-CRATE ?auto_35506 ) ( not ( = ?auto_35505 ?auto_35506 ) ) ( not ( = ?auto_35504 ?auto_35505 ) ) ( not ( = ?auto_35504 ?auto_35506 ) ) ( not ( = ?auto_35510 ?auto_35511 ) ) ( HOIST-AT ?auto_35513 ?auto_35510 ) ( not ( = ?auto_35515 ?auto_35513 ) ) ( SURFACE-AT ?auto_35506 ?auto_35510 ) ( ON ?auto_35506 ?auto_35512 ) ( CLEAR ?auto_35506 ) ( not ( = ?auto_35505 ?auto_35512 ) ) ( not ( = ?auto_35506 ?auto_35512 ) ) ( not ( = ?auto_35504 ?auto_35512 ) ) ( IS-CRATE ?auto_35505 ) ( not ( = ?auto_35508 ?auto_35511 ) ) ( not ( = ?auto_35510 ?auto_35508 ) ) ( HOIST-AT ?auto_35517 ?auto_35508 ) ( not ( = ?auto_35515 ?auto_35517 ) ) ( not ( = ?auto_35513 ?auto_35517 ) ) ( AVAILABLE ?auto_35517 ) ( SURFACE-AT ?auto_35505 ?auto_35508 ) ( ON ?auto_35505 ?auto_35509 ) ( CLEAR ?auto_35505 ) ( not ( = ?auto_35505 ?auto_35509 ) ) ( not ( = ?auto_35506 ?auto_35509 ) ) ( not ( = ?auto_35504 ?auto_35509 ) ) ( not ( = ?auto_35512 ?auto_35509 ) ) ( IS-CRATE ?auto_35504 ) ( not ( = ?auto_35503 ?auto_35504 ) ) ( not ( = ?auto_35505 ?auto_35503 ) ) ( not ( = ?auto_35506 ?auto_35503 ) ) ( not ( = ?auto_35512 ?auto_35503 ) ) ( not ( = ?auto_35509 ?auto_35503 ) ) ( SURFACE-AT ?auto_35504 ?auto_35510 ) ( ON ?auto_35504 ?auto_35514 ) ( CLEAR ?auto_35504 ) ( not ( = ?auto_35505 ?auto_35514 ) ) ( not ( = ?auto_35506 ?auto_35514 ) ) ( not ( = ?auto_35504 ?auto_35514 ) ) ( not ( = ?auto_35512 ?auto_35514 ) ) ( not ( = ?auto_35509 ?auto_35514 ) ) ( not ( = ?auto_35503 ?auto_35514 ) ) ( SURFACE-AT ?auto_35502 ?auto_35511 ) ( CLEAR ?auto_35502 ) ( IS-CRATE ?auto_35503 ) ( not ( = ?auto_35502 ?auto_35503 ) ) ( not ( = ?auto_35505 ?auto_35502 ) ) ( not ( = ?auto_35506 ?auto_35502 ) ) ( not ( = ?auto_35504 ?auto_35502 ) ) ( not ( = ?auto_35512 ?auto_35502 ) ) ( not ( = ?auto_35509 ?auto_35502 ) ) ( not ( = ?auto_35514 ?auto_35502 ) ) ( AVAILABLE ?auto_35515 ) ( AVAILABLE ?auto_35513 ) ( SURFACE-AT ?auto_35503 ?auto_35510 ) ( ON ?auto_35503 ?auto_35516 ) ( CLEAR ?auto_35503 ) ( not ( = ?auto_35505 ?auto_35516 ) ) ( not ( = ?auto_35506 ?auto_35516 ) ) ( not ( = ?auto_35504 ?auto_35516 ) ) ( not ( = ?auto_35512 ?auto_35516 ) ) ( not ( = ?auto_35509 ?auto_35516 ) ) ( not ( = ?auto_35503 ?auto_35516 ) ) ( not ( = ?auto_35514 ?auto_35516 ) ) ( not ( = ?auto_35502 ?auto_35516 ) ) ( TRUCK-AT ?auto_35507 ?auto_35511 ) ( ON ?auto_35502 ?auto_35501 ) ( not ( = ?auto_35501 ?auto_35502 ) ) ( not ( = ?auto_35501 ?auto_35503 ) ) ( not ( = ?auto_35501 ?auto_35504 ) ) ( not ( = ?auto_35501 ?auto_35505 ) ) ( not ( = ?auto_35501 ?auto_35506 ) ) ( not ( = ?auto_35501 ?auto_35512 ) ) ( not ( = ?auto_35501 ?auto_35509 ) ) ( not ( = ?auto_35501 ?auto_35514 ) ) ( not ( = ?auto_35501 ?auto_35516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35504 ?auto_35505 ?auto_35506 )
      ( MAKE-5CRATE-VERIFY ?auto_35501 ?auto_35502 ?auto_35503 ?auto_35504 ?auto_35505 ?auto_35506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35518 - SURFACE
      ?auto_35519 - SURFACE
    )
    :vars
    (
      ?auto_35531 - HOIST
      ?auto_35527 - PLACE
      ?auto_35520 - SURFACE
      ?auto_35526 - PLACE
      ?auto_35529 - HOIST
      ?auto_35528 - SURFACE
      ?auto_35524 - PLACE
      ?auto_35533 - HOIST
      ?auto_35525 - SURFACE
      ?auto_35523 - SURFACE
      ?auto_35530 - SURFACE
      ?auto_35521 - SURFACE
      ?auto_35532 - SURFACE
      ?auto_35522 - TRUCK
      ?auto_35534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35531 ?auto_35527 ) ( IS-CRATE ?auto_35519 ) ( not ( = ?auto_35518 ?auto_35519 ) ) ( not ( = ?auto_35520 ?auto_35518 ) ) ( not ( = ?auto_35520 ?auto_35519 ) ) ( not ( = ?auto_35526 ?auto_35527 ) ) ( HOIST-AT ?auto_35529 ?auto_35526 ) ( not ( = ?auto_35531 ?auto_35529 ) ) ( SURFACE-AT ?auto_35519 ?auto_35526 ) ( ON ?auto_35519 ?auto_35528 ) ( CLEAR ?auto_35519 ) ( not ( = ?auto_35518 ?auto_35528 ) ) ( not ( = ?auto_35519 ?auto_35528 ) ) ( not ( = ?auto_35520 ?auto_35528 ) ) ( IS-CRATE ?auto_35518 ) ( not ( = ?auto_35524 ?auto_35527 ) ) ( not ( = ?auto_35526 ?auto_35524 ) ) ( HOIST-AT ?auto_35533 ?auto_35524 ) ( not ( = ?auto_35531 ?auto_35533 ) ) ( not ( = ?auto_35529 ?auto_35533 ) ) ( AVAILABLE ?auto_35533 ) ( SURFACE-AT ?auto_35518 ?auto_35524 ) ( ON ?auto_35518 ?auto_35525 ) ( CLEAR ?auto_35518 ) ( not ( = ?auto_35518 ?auto_35525 ) ) ( not ( = ?auto_35519 ?auto_35525 ) ) ( not ( = ?auto_35520 ?auto_35525 ) ) ( not ( = ?auto_35528 ?auto_35525 ) ) ( IS-CRATE ?auto_35520 ) ( not ( = ?auto_35523 ?auto_35520 ) ) ( not ( = ?auto_35518 ?auto_35523 ) ) ( not ( = ?auto_35519 ?auto_35523 ) ) ( not ( = ?auto_35528 ?auto_35523 ) ) ( not ( = ?auto_35525 ?auto_35523 ) ) ( SURFACE-AT ?auto_35520 ?auto_35526 ) ( ON ?auto_35520 ?auto_35530 ) ( CLEAR ?auto_35520 ) ( not ( = ?auto_35518 ?auto_35530 ) ) ( not ( = ?auto_35519 ?auto_35530 ) ) ( not ( = ?auto_35520 ?auto_35530 ) ) ( not ( = ?auto_35528 ?auto_35530 ) ) ( not ( = ?auto_35525 ?auto_35530 ) ) ( not ( = ?auto_35523 ?auto_35530 ) ) ( IS-CRATE ?auto_35523 ) ( not ( = ?auto_35521 ?auto_35523 ) ) ( not ( = ?auto_35518 ?auto_35521 ) ) ( not ( = ?auto_35519 ?auto_35521 ) ) ( not ( = ?auto_35520 ?auto_35521 ) ) ( not ( = ?auto_35528 ?auto_35521 ) ) ( not ( = ?auto_35525 ?auto_35521 ) ) ( not ( = ?auto_35530 ?auto_35521 ) ) ( AVAILABLE ?auto_35529 ) ( SURFACE-AT ?auto_35523 ?auto_35526 ) ( ON ?auto_35523 ?auto_35532 ) ( CLEAR ?auto_35523 ) ( not ( = ?auto_35518 ?auto_35532 ) ) ( not ( = ?auto_35519 ?auto_35532 ) ) ( not ( = ?auto_35520 ?auto_35532 ) ) ( not ( = ?auto_35528 ?auto_35532 ) ) ( not ( = ?auto_35525 ?auto_35532 ) ) ( not ( = ?auto_35523 ?auto_35532 ) ) ( not ( = ?auto_35530 ?auto_35532 ) ) ( not ( = ?auto_35521 ?auto_35532 ) ) ( TRUCK-AT ?auto_35522 ?auto_35527 ) ( SURFACE-AT ?auto_35534 ?auto_35527 ) ( CLEAR ?auto_35534 ) ( LIFTING ?auto_35531 ?auto_35521 ) ( IS-CRATE ?auto_35521 ) ( not ( = ?auto_35534 ?auto_35521 ) ) ( not ( = ?auto_35518 ?auto_35534 ) ) ( not ( = ?auto_35519 ?auto_35534 ) ) ( not ( = ?auto_35520 ?auto_35534 ) ) ( not ( = ?auto_35528 ?auto_35534 ) ) ( not ( = ?auto_35525 ?auto_35534 ) ) ( not ( = ?auto_35523 ?auto_35534 ) ) ( not ( = ?auto_35530 ?auto_35534 ) ) ( not ( = ?auto_35532 ?auto_35534 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35534 ?auto_35521 )
      ( MAKE-2CRATE ?auto_35520 ?auto_35518 ?auto_35519 )
      ( MAKE-1CRATE-VERIFY ?auto_35518 ?auto_35519 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35535 - SURFACE
      ?auto_35536 - SURFACE
      ?auto_35537 - SURFACE
    )
    :vars
    (
      ?auto_35540 - HOIST
      ?auto_35551 - PLACE
      ?auto_35548 - PLACE
      ?auto_35544 - HOIST
      ?auto_35541 - SURFACE
      ?auto_35550 - PLACE
      ?auto_35542 - HOIST
      ?auto_35546 - SURFACE
      ?auto_35538 - SURFACE
      ?auto_35539 - SURFACE
      ?auto_35543 - SURFACE
      ?auto_35547 - SURFACE
      ?auto_35545 - TRUCK
      ?auto_35549 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35540 ?auto_35551 ) ( IS-CRATE ?auto_35537 ) ( not ( = ?auto_35536 ?auto_35537 ) ) ( not ( = ?auto_35535 ?auto_35536 ) ) ( not ( = ?auto_35535 ?auto_35537 ) ) ( not ( = ?auto_35548 ?auto_35551 ) ) ( HOIST-AT ?auto_35544 ?auto_35548 ) ( not ( = ?auto_35540 ?auto_35544 ) ) ( SURFACE-AT ?auto_35537 ?auto_35548 ) ( ON ?auto_35537 ?auto_35541 ) ( CLEAR ?auto_35537 ) ( not ( = ?auto_35536 ?auto_35541 ) ) ( not ( = ?auto_35537 ?auto_35541 ) ) ( not ( = ?auto_35535 ?auto_35541 ) ) ( IS-CRATE ?auto_35536 ) ( not ( = ?auto_35550 ?auto_35551 ) ) ( not ( = ?auto_35548 ?auto_35550 ) ) ( HOIST-AT ?auto_35542 ?auto_35550 ) ( not ( = ?auto_35540 ?auto_35542 ) ) ( not ( = ?auto_35544 ?auto_35542 ) ) ( AVAILABLE ?auto_35542 ) ( SURFACE-AT ?auto_35536 ?auto_35550 ) ( ON ?auto_35536 ?auto_35546 ) ( CLEAR ?auto_35536 ) ( not ( = ?auto_35536 ?auto_35546 ) ) ( not ( = ?auto_35537 ?auto_35546 ) ) ( not ( = ?auto_35535 ?auto_35546 ) ) ( not ( = ?auto_35541 ?auto_35546 ) ) ( IS-CRATE ?auto_35535 ) ( not ( = ?auto_35538 ?auto_35535 ) ) ( not ( = ?auto_35536 ?auto_35538 ) ) ( not ( = ?auto_35537 ?auto_35538 ) ) ( not ( = ?auto_35541 ?auto_35538 ) ) ( not ( = ?auto_35546 ?auto_35538 ) ) ( SURFACE-AT ?auto_35535 ?auto_35548 ) ( ON ?auto_35535 ?auto_35539 ) ( CLEAR ?auto_35535 ) ( not ( = ?auto_35536 ?auto_35539 ) ) ( not ( = ?auto_35537 ?auto_35539 ) ) ( not ( = ?auto_35535 ?auto_35539 ) ) ( not ( = ?auto_35541 ?auto_35539 ) ) ( not ( = ?auto_35546 ?auto_35539 ) ) ( not ( = ?auto_35538 ?auto_35539 ) ) ( IS-CRATE ?auto_35538 ) ( not ( = ?auto_35543 ?auto_35538 ) ) ( not ( = ?auto_35536 ?auto_35543 ) ) ( not ( = ?auto_35537 ?auto_35543 ) ) ( not ( = ?auto_35535 ?auto_35543 ) ) ( not ( = ?auto_35541 ?auto_35543 ) ) ( not ( = ?auto_35546 ?auto_35543 ) ) ( not ( = ?auto_35539 ?auto_35543 ) ) ( AVAILABLE ?auto_35544 ) ( SURFACE-AT ?auto_35538 ?auto_35548 ) ( ON ?auto_35538 ?auto_35547 ) ( CLEAR ?auto_35538 ) ( not ( = ?auto_35536 ?auto_35547 ) ) ( not ( = ?auto_35537 ?auto_35547 ) ) ( not ( = ?auto_35535 ?auto_35547 ) ) ( not ( = ?auto_35541 ?auto_35547 ) ) ( not ( = ?auto_35546 ?auto_35547 ) ) ( not ( = ?auto_35538 ?auto_35547 ) ) ( not ( = ?auto_35539 ?auto_35547 ) ) ( not ( = ?auto_35543 ?auto_35547 ) ) ( TRUCK-AT ?auto_35545 ?auto_35551 ) ( SURFACE-AT ?auto_35549 ?auto_35551 ) ( CLEAR ?auto_35549 ) ( LIFTING ?auto_35540 ?auto_35543 ) ( IS-CRATE ?auto_35543 ) ( not ( = ?auto_35549 ?auto_35543 ) ) ( not ( = ?auto_35536 ?auto_35549 ) ) ( not ( = ?auto_35537 ?auto_35549 ) ) ( not ( = ?auto_35535 ?auto_35549 ) ) ( not ( = ?auto_35541 ?auto_35549 ) ) ( not ( = ?auto_35546 ?auto_35549 ) ) ( not ( = ?auto_35538 ?auto_35549 ) ) ( not ( = ?auto_35539 ?auto_35549 ) ) ( not ( = ?auto_35547 ?auto_35549 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35536 ?auto_35537 )
      ( MAKE-2CRATE-VERIFY ?auto_35535 ?auto_35536 ?auto_35537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35552 - SURFACE
      ?auto_35553 - SURFACE
      ?auto_35554 - SURFACE
      ?auto_35555 - SURFACE
    )
    :vars
    (
      ?auto_35567 - HOIST
      ?auto_35563 - PLACE
      ?auto_35558 - PLACE
      ?auto_35556 - HOIST
      ?auto_35564 - SURFACE
      ?auto_35560 - PLACE
      ?auto_35565 - HOIST
      ?auto_35562 - SURFACE
      ?auto_35568 - SURFACE
      ?auto_35566 - SURFACE
      ?auto_35557 - SURFACE
      ?auto_35559 - TRUCK
      ?auto_35561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35567 ?auto_35563 ) ( IS-CRATE ?auto_35555 ) ( not ( = ?auto_35554 ?auto_35555 ) ) ( not ( = ?auto_35553 ?auto_35554 ) ) ( not ( = ?auto_35553 ?auto_35555 ) ) ( not ( = ?auto_35558 ?auto_35563 ) ) ( HOIST-AT ?auto_35556 ?auto_35558 ) ( not ( = ?auto_35567 ?auto_35556 ) ) ( SURFACE-AT ?auto_35555 ?auto_35558 ) ( ON ?auto_35555 ?auto_35564 ) ( CLEAR ?auto_35555 ) ( not ( = ?auto_35554 ?auto_35564 ) ) ( not ( = ?auto_35555 ?auto_35564 ) ) ( not ( = ?auto_35553 ?auto_35564 ) ) ( IS-CRATE ?auto_35554 ) ( not ( = ?auto_35560 ?auto_35563 ) ) ( not ( = ?auto_35558 ?auto_35560 ) ) ( HOIST-AT ?auto_35565 ?auto_35560 ) ( not ( = ?auto_35567 ?auto_35565 ) ) ( not ( = ?auto_35556 ?auto_35565 ) ) ( AVAILABLE ?auto_35565 ) ( SURFACE-AT ?auto_35554 ?auto_35560 ) ( ON ?auto_35554 ?auto_35562 ) ( CLEAR ?auto_35554 ) ( not ( = ?auto_35554 ?auto_35562 ) ) ( not ( = ?auto_35555 ?auto_35562 ) ) ( not ( = ?auto_35553 ?auto_35562 ) ) ( not ( = ?auto_35564 ?auto_35562 ) ) ( IS-CRATE ?auto_35553 ) ( not ( = ?auto_35552 ?auto_35553 ) ) ( not ( = ?auto_35554 ?auto_35552 ) ) ( not ( = ?auto_35555 ?auto_35552 ) ) ( not ( = ?auto_35564 ?auto_35552 ) ) ( not ( = ?auto_35562 ?auto_35552 ) ) ( SURFACE-AT ?auto_35553 ?auto_35558 ) ( ON ?auto_35553 ?auto_35568 ) ( CLEAR ?auto_35553 ) ( not ( = ?auto_35554 ?auto_35568 ) ) ( not ( = ?auto_35555 ?auto_35568 ) ) ( not ( = ?auto_35553 ?auto_35568 ) ) ( not ( = ?auto_35564 ?auto_35568 ) ) ( not ( = ?auto_35562 ?auto_35568 ) ) ( not ( = ?auto_35552 ?auto_35568 ) ) ( IS-CRATE ?auto_35552 ) ( not ( = ?auto_35566 ?auto_35552 ) ) ( not ( = ?auto_35554 ?auto_35566 ) ) ( not ( = ?auto_35555 ?auto_35566 ) ) ( not ( = ?auto_35553 ?auto_35566 ) ) ( not ( = ?auto_35564 ?auto_35566 ) ) ( not ( = ?auto_35562 ?auto_35566 ) ) ( not ( = ?auto_35568 ?auto_35566 ) ) ( AVAILABLE ?auto_35556 ) ( SURFACE-AT ?auto_35552 ?auto_35558 ) ( ON ?auto_35552 ?auto_35557 ) ( CLEAR ?auto_35552 ) ( not ( = ?auto_35554 ?auto_35557 ) ) ( not ( = ?auto_35555 ?auto_35557 ) ) ( not ( = ?auto_35553 ?auto_35557 ) ) ( not ( = ?auto_35564 ?auto_35557 ) ) ( not ( = ?auto_35562 ?auto_35557 ) ) ( not ( = ?auto_35552 ?auto_35557 ) ) ( not ( = ?auto_35568 ?auto_35557 ) ) ( not ( = ?auto_35566 ?auto_35557 ) ) ( TRUCK-AT ?auto_35559 ?auto_35563 ) ( SURFACE-AT ?auto_35561 ?auto_35563 ) ( CLEAR ?auto_35561 ) ( LIFTING ?auto_35567 ?auto_35566 ) ( IS-CRATE ?auto_35566 ) ( not ( = ?auto_35561 ?auto_35566 ) ) ( not ( = ?auto_35554 ?auto_35561 ) ) ( not ( = ?auto_35555 ?auto_35561 ) ) ( not ( = ?auto_35553 ?auto_35561 ) ) ( not ( = ?auto_35564 ?auto_35561 ) ) ( not ( = ?auto_35562 ?auto_35561 ) ) ( not ( = ?auto_35552 ?auto_35561 ) ) ( not ( = ?auto_35568 ?auto_35561 ) ) ( not ( = ?auto_35557 ?auto_35561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35553 ?auto_35554 ?auto_35555 )
      ( MAKE-3CRATE-VERIFY ?auto_35552 ?auto_35553 ?auto_35554 ?auto_35555 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35569 - SURFACE
      ?auto_35570 - SURFACE
      ?auto_35571 - SURFACE
      ?auto_35572 - SURFACE
      ?auto_35573 - SURFACE
    )
    :vars
    (
      ?auto_35584 - HOIST
      ?auto_35581 - PLACE
      ?auto_35576 - PLACE
      ?auto_35574 - HOIST
      ?auto_35582 - SURFACE
      ?auto_35578 - PLACE
      ?auto_35583 - HOIST
      ?auto_35580 - SURFACE
      ?auto_35585 - SURFACE
      ?auto_35575 - SURFACE
      ?auto_35577 - TRUCK
      ?auto_35579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35584 ?auto_35581 ) ( IS-CRATE ?auto_35573 ) ( not ( = ?auto_35572 ?auto_35573 ) ) ( not ( = ?auto_35571 ?auto_35572 ) ) ( not ( = ?auto_35571 ?auto_35573 ) ) ( not ( = ?auto_35576 ?auto_35581 ) ) ( HOIST-AT ?auto_35574 ?auto_35576 ) ( not ( = ?auto_35584 ?auto_35574 ) ) ( SURFACE-AT ?auto_35573 ?auto_35576 ) ( ON ?auto_35573 ?auto_35582 ) ( CLEAR ?auto_35573 ) ( not ( = ?auto_35572 ?auto_35582 ) ) ( not ( = ?auto_35573 ?auto_35582 ) ) ( not ( = ?auto_35571 ?auto_35582 ) ) ( IS-CRATE ?auto_35572 ) ( not ( = ?auto_35578 ?auto_35581 ) ) ( not ( = ?auto_35576 ?auto_35578 ) ) ( HOIST-AT ?auto_35583 ?auto_35578 ) ( not ( = ?auto_35584 ?auto_35583 ) ) ( not ( = ?auto_35574 ?auto_35583 ) ) ( AVAILABLE ?auto_35583 ) ( SURFACE-AT ?auto_35572 ?auto_35578 ) ( ON ?auto_35572 ?auto_35580 ) ( CLEAR ?auto_35572 ) ( not ( = ?auto_35572 ?auto_35580 ) ) ( not ( = ?auto_35573 ?auto_35580 ) ) ( not ( = ?auto_35571 ?auto_35580 ) ) ( not ( = ?auto_35582 ?auto_35580 ) ) ( IS-CRATE ?auto_35571 ) ( not ( = ?auto_35570 ?auto_35571 ) ) ( not ( = ?auto_35572 ?auto_35570 ) ) ( not ( = ?auto_35573 ?auto_35570 ) ) ( not ( = ?auto_35582 ?auto_35570 ) ) ( not ( = ?auto_35580 ?auto_35570 ) ) ( SURFACE-AT ?auto_35571 ?auto_35576 ) ( ON ?auto_35571 ?auto_35585 ) ( CLEAR ?auto_35571 ) ( not ( = ?auto_35572 ?auto_35585 ) ) ( not ( = ?auto_35573 ?auto_35585 ) ) ( not ( = ?auto_35571 ?auto_35585 ) ) ( not ( = ?auto_35582 ?auto_35585 ) ) ( not ( = ?auto_35580 ?auto_35585 ) ) ( not ( = ?auto_35570 ?auto_35585 ) ) ( IS-CRATE ?auto_35570 ) ( not ( = ?auto_35569 ?auto_35570 ) ) ( not ( = ?auto_35572 ?auto_35569 ) ) ( not ( = ?auto_35573 ?auto_35569 ) ) ( not ( = ?auto_35571 ?auto_35569 ) ) ( not ( = ?auto_35582 ?auto_35569 ) ) ( not ( = ?auto_35580 ?auto_35569 ) ) ( not ( = ?auto_35585 ?auto_35569 ) ) ( AVAILABLE ?auto_35574 ) ( SURFACE-AT ?auto_35570 ?auto_35576 ) ( ON ?auto_35570 ?auto_35575 ) ( CLEAR ?auto_35570 ) ( not ( = ?auto_35572 ?auto_35575 ) ) ( not ( = ?auto_35573 ?auto_35575 ) ) ( not ( = ?auto_35571 ?auto_35575 ) ) ( not ( = ?auto_35582 ?auto_35575 ) ) ( not ( = ?auto_35580 ?auto_35575 ) ) ( not ( = ?auto_35570 ?auto_35575 ) ) ( not ( = ?auto_35585 ?auto_35575 ) ) ( not ( = ?auto_35569 ?auto_35575 ) ) ( TRUCK-AT ?auto_35577 ?auto_35581 ) ( SURFACE-AT ?auto_35579 ?auto_35581 ) ( CLEAR ?auto_35579 ) ( LIFTING ?auto_35584 ?auto_35569 ) ( IS-CRATE ?auto_35569 ) ( not ( = ?auto_35579 ?auto_35569 ) ) ( not ( = ?auto_35572 ?auto_35579 ) ) ( not ( = ?auto_35573 ?auto_35579 ) ) ( not ( = ?auto_35571 ?auto_35579 ) ) ( not ( = ?auto_35582 ?auto_35579 ) ) ( not ( = ?auto_35580 ?auto_35579 ) ) ( not ( = ?auto_35570 ?auto_35579 ) ) ( not ( = ?auto_35585 ?auto_35579 ) ) ( not ( = ?auto_35575 ?auto_35579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35571 ?auto_35572 ?auto_35573 )
      ( MAKE-4CRATE-VERIFY ?auto_35569 ?auto_35570 ?auto_35571 ?auto_35572 ?auto_35573 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35586 - SURFACE
      ?auto_35587 - SURFACE
      ?auto_35588 - SURFACE
      ?auto_35589 - SURFACE
      ?auto_35590 - SURFACE
      ?auto_35591 - SURFACE
    )
    :vars
    (
      ?auto_35601 - HOIST
      ?auto_35598 - PLACE
      ?auto_35594 - PLACE
      ?auto_35592 - HOIST
      ?auto_35599 - SURFACE
      ?auto_35596 - PLACE
      ?auto_35600 - HOIST
      ?auto_35597 - SURFACE
      ?auto_35602 - SURFACE
      ?auto_35593 - SURFACE
      ?auto_35595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35601 ?auto_35598 ) ( IS-CRATE ?auto_35591 ) ( not ( = ?auto_35590 ?auto_35591 ) ) ( not ( = ?auto_35589 ?auto_35590 ) ) ( not ( = ?auto_35589 ?auto_35591 ) ) ( not ( = ?auto_35594 ?auto_35598 ) ) ( HOIST-AT ?auto_35592 ?auto_35594 ) ( not ( = ?auto_35601 ?auto_35592 ) ) ( SURFACE-AT ?auto_35591 ?auto_35594 ) ( ON ?auto_35591 ?auto_35599 ) ( CLEAR ?auto_35591 ) ( not ( = ?auto_35590 ?auto_35599 ) ) ( not ( = ?auto_35591 ?auto_35599 ) ) ( not ( = ?auto_35589 ?auto_35599 ) ) ( IS-CRATE ?auto_35590 ) ( not ( = ?auto_35596 ?auto_35598 ) ) ( not ( = ?auto_35594 ?auto_35596 ) ) ( HOIST-AT ?auto_35600 ?auto_35596 ) ( not ( = ?auto_35601 ?auto_35600 ) ) ( not ( = ?auto_35592 ?auto_35600 ) ) ( AVAILABLE ?auto_35600 ) ( SURFACE-AT ?auto_35590 ?auto_35596 ) ( ON ?auto_35590 ?auto_35597 ) ( CLEAR ?auto_35590 ) ( not ( = ?auto_35590 ?auto_35597 ) ) ( not ( = ?auto_35591 ?auto_35597 ) ) ( not ( = ?auto_35589 ?auto_35597 ) ) ( not ( = ?auto_35599 ?auto_35597 ) ) ( IS-CRATE ?auto_35589 ) ( not ( = ?auto_35588 ?auto_35589 ) ) ( not ( = ?auto_35590 ?auto_35588 ) ) ( not ( = ?auto_35591 ?auto_35588 ) ) ( not ( = ?auto_35599 ?auto_35588 ) ) ( not ( = ?auto_35597 ?auto_35588 ) ) ( SURFACE-AT ?auto_35589 ?auto_35594 ) ( ON ?auto_35589 ?auto_35602 ) ( CLEAR ?auto_35589 ) ( not ( = ?auto_35590 ?auto_35602 ) ) ( not ( = ?auto_35591 ?auto_35602 ) ) ( not ( = ?auto_35589 ?auto_35602 ) ) ( not ( = ?auto_35599 ?auto_35602 ) ) ( not ( = ?auto_35597 ?auto_35602 ) ) ( not ( = ?auto_35588 ?auto_35602 ) ) ( IS-CRATE ?auto_35588 ) ( not ( = ?auto_35587 ?auto_35588 ) ) ( not ( = ?auto_35590 ?auto_35587 ) ) ( not ( = ?auto_35591 ?auto_35587 ) ) ( not ( = ?auto_35589 ?auto_35587 ) ) ( not ( = ?auto_35599 ?auto_35587 ) ) ( not ( = ?auto_35597 ?auto_35587 ) ) ( not ( = ?auto_35602 ?auto_35587 ) ) ( AVAILABLE ?auto_35592 ) ( SURFACE-AT ?auto_35588 ?auto_35594 ) ( ON ?auto_35588 ?auto_35593 ) ( CLEAR ?auto_35588 ) ( not ( = ?auto_35590 ?auto_35593 ) ) ( not ( = ?auto_35591 ?auto_35593 ) ) ( not ( = ?auto_35589 ?auto_35593 ) ) ( not ( = ?auto_35599 ?auto_35593 ) ) ( not ( = ?auto_35597 ?auto_35593 ) ) ( not ( = ?auto_35588 ?auto_35593 ) ) ( not ( = ?auto_35602 ?auto_35593 ) ) ( not ( = ?auto_35587 ?auto_35593 ) ) ( TRUCK-AT ?auto_35595 ?auto_35598 ) ( SURFACE-AT ?auto_35586 ?auto_35598 ) ( CLEAR ?auto_35586 ) ( LIFTING ?auto_35601 ?auto_35587 ) ( IS-CRATE ?auto_35587 ) ( not ( = ?auto_35586 ?auto_35587 ) ) ( not ( = ?auto_35590 ?auto_35586 ) ) ( not ( = ?auto_35591 ?auto_35586 ) ) ( not ( = ?auto_35589 ?auto_35586 ) ) ( not ( = ?auto_35599 ?auto_35586 ) ) ( not ( = ?auto_35597 ?auto_35586 ) ) ( not ( = ?auto_35588 ?auto_35586 ) ) ( not ( = ?auto_35602 ?auto_35586 ) ) ( not ( = ?auto_35593 ?auto_35586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35589 ?auto_35590 ?auto_35591 )
      ( MAKE-5CRATE-VERIFY ?auto_35586 ?auto_35587 ?auto_35588 ?auto_35589 ?auto_35590 ?auto_35591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35603 - SURFACE
      ?auto_35604 - SURFACE
    )
    :vars
    (
      ?auto_35617 - HOIST
      ?auto_35613 - PLACE
      ?auto_35619 - SURFACE
      ?auto_35608 - PLACE
      ?auto_35606 - HOIST
      ?auto_35614 - SURFACE
      ?auto_35610 - PLACE
      ?auto_35615 - HOIST
      ?auto_35612 - SURFACE
      ?auto_35605 - SURFACE
      ?auto_35618 - SURFACE
      ?auto_35616 - SURFACE
      ?auto_35607 - SURFACE
      ?auto_35609 - TRUCK
      ?auto_35611 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35617 ?auto_35613 ) ( IS-CRATE ?auto_35604 ) ( not ( = ?auto_35603 ?auto_35604 ) ) ( not ( = ?auto_35619 ?auto_35603 ) ) ( not ( = ?auto_35619 ?auto_35604 ) ) ( not ( = ?auto_35608 ?auto_35613 ) ) ( HOIST-AT ?auto_35606 ?auto_35608 ) ( not ( = ?auto_35617 ?auto_35606 ) ) ( SURFACE-AT ?auto_35604 ?auto_35608 ) ( ON ?auto_35604 ?auto_35614 ) ( CLEAR ?auto_35604 ) ( not ( = ?auto_35603 ?auto_35614 ) ) ( not ( = ?auto_35604 ?auto_35614 ) ) ( not ( = ?auto_35619 ?auto_35614 ) ) ( IS-CRATE ?auto_35603 ) ( not ( = ?auto_35610 ?auto_35613 ) ) ( not ( = ?auto_35608 ?auto_35610 ) ) ( HOIST-AT ?auto_35615 ?auto_35610 ) ( not ( = ?auto_35617 ?auto_35615 ) ) ( not ( = ?auto_35606 ?auto_35615 ) ) ( AVAILABLE ?auto_35615 ) ( SURFACE-AT ?auto_35603 ?auto_35610 ) ( ON ?auto_35603 ?auto_35612 ) ( CLEAR ?auto_35603 ) ( not ( = ?auto_35603 ?auto_35612 ) ) ( not ( = ?auto_35604 ?auto_35612 ) ) ( not ( = ?auto_35619 ?auto_35612 ) ) ( not ( = ?auto_35614 ?auto_35612 ) ) ( IS-CRATE ?auto_35619 ) ( not ( = ?auto_35605 ?auto_35619 ) ) ( not ( = ?auto_35603 ?auto_35605 ) ) ( not ( = ?auto_35604 ?auto_35605 ) ) ( not ( = ?auto_35614 ?auto_35605 ) ) ( not ( = ?auto_35612 ?auto_35605 ) ) ( SURFACE-AT ?auto_35619 ?auto_35608 ) ( ON ?auto_35619 ?auto_35618 ) ( CLEAR ?auto_35619 ) ( not ( = ?auto_35603 ?auto_35618 ) ) ( not ( = ?auto_35604 ?auto_35618 ) ) ( not ( = ?auto_35619 ?auto_35618 ) ) ( not ( = ?auto_35614 ?auto_35618 ) ) ( not ( = ?auto_35612 ?auto_35618 ) ) ( not ( = ?auto_35605 ?auto_35618 ) ) ( IS-CRATE ?auto_35605 ) ( not ( = ?auto_35616 ?auto_35605 ) ) ( not ( = ?auto_35603 ?auto_35616 ) ) ( not ( = ?auto_35604 ?auto_35616 ) ) ( not ( = ?auto_35619 ?auto_35616 ) ) ( not ( = ?auto_35614 ?auto_35616 ) ) ( not ( = ?auto_35612 ?auto_35616 ) ) ( not ( = ?auto_35618 ?auto_35616 ) ) ( AVAILABLE ?auto_35606 ) ( SURFACE-AT ?auto_35605 ?auto_35608 ) ( ON ?auto_35605 ?auto_35607 ) ( CLEAR ?auto_35605 ) ( not ( = ?auto_35603 ?auto_35607 ) ) ( not ( = ?auto_35604 ?auto_35607 ) ) ( not ( = ?auto_35619 ?auto_35607 ) ) ( not ( = ?auto_35614 ?auto_35607 ) ) ( not ( = ?auto_35612 ?auto_35607 ) ) ( not ( = ?auto_35605 ?auto_35607 ) ) ( not ( = ?auto_35618 ?auto_35607 ) ) ( not ( = ?auto_35616 ?auto_35607 ) ) ( TRUCK-AT ?auto_35609 ?auto_35613 ) ( SURFACE-AT ?auto_35611 ?auto_35613 ) ( CLEAR ?auto_35611 ) ( IS-CRATE ?auto_35616 ) ( not ( = ?auto_35611 ?auto_35616 ) ) ( not ( = ?auto_35603 ?auto_35611 ) ) ( not ( = ?auto_35604 ?auto_35611 ) ) ( not ( = ?auto_35619 ?auto_35611 ) ) ( not ( = ?auto_35614 ?auto_35611 ) ) ( not ( = ?auto_35612 ?auto_35611 ) ) ( not ( = ?auto_35605 ?auto_35611 ) ) ( not ( = ?auto_35618 ?auto_35611 ) ) ( not ( = ?auto_35607 ?auto_35611 ) ) ( AVAILABLE ?auto_35617 ) ( IN ?auto_35616 ?auto_35609 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35617 ?auto_35616 ?auto_35609 ?auto_35613 )
      ( MAKE-2CRATE ?auto_35619 ?auto_35603 ?auto_35604 )
      ( MAKE-1CRATE-VERIFY ?auto_35603 ?auto_35604 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35620 - SURFACE
      ?auto_35621 - SURFACE
      ?auto_35622 - SURFACE
    )
    :vars
    (
      ?auto_35633 - HOIST
      ?auto_35634 - PLACE
      ?auto_35624 - PLACE
      ?auto_35627 - HOIST
      ?auto_35626 - SURFACE
      ?auto_35630 - PLACE
      ?auto_35625 - HOIST
      ?auto_35623 - SURFACE
      ?auto_35628 - SURFACE
      ?auto_35629 - SURFACE
      ?auto_35636 - SURFACE
      ?auto_35635 - SURFACE
      ?auto_35632 - TRUCK
      ?auto_35631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35633 ?auto_35634 ) ( IS-CRATE ?auto_35622 ) ( not ( = ?auto_35621 ?auto_35622 ) ) ( not ( = ?auto_35620 ?auto_35621 ) ) ( not ( = ?auto_35620 ?auto_35622 ) ) ( not ( = ?auto_35624 ?auto_35634 ) ) ( HOIST-AT ?auto_35627 ?auto_35624 ) ( not ( = ?auto_35633 ?auto_35627 ) ) ( SURFACE-AT ?auto_35622 ?auto_35624 ) ( ON ?auto_35622 ?auto_35626 ) ( CLEAR ?auto_35622 ) ( not ( = ?auto_35621 ?auto_35626 ) ) ( not ( = ?auto_35622 ?auto_35626 ) ) ( not ( = ?auto_35620 ?auto_35626 ) ) ( IS-CRATE ?auto_35621 ) ( not ( = ?auto_35630 ?auto_35634 ) ) ( not ( = ?auto_35624 ?auto_35630 ) ) ( HOIST-AT ?auto_35625 ?auto_35630 ) ( not ( = ?auto_35633 ?auto_35625 ) ) ( not ( = ?auto_35627 ?auto_35625 ) ) ( AVAILABLE ?auto_35625 ) ( SURFACE-AT ?auto_35621 ?auto_35630 ) ( ON ?auto_35621 ?auto_35623 ) ( CLEAR ?auto_35621 ) ( not ( = ?auto_35621 ?auto_35623 ) ) ( not ( = ?auto_35622 ?auto_35623 ) ) ( not ( = ?auto_35620 ?auto_35623 ) ) ( not ( = ?auto_35626 ?auto_35623 ) ) ( IS-CRATE ?auto_35620 ) ( not ( = ?auto_35628 ?auto_35620 ) ) ( not ( = ?auto_35621 ?auto_35628 ) ) ( not ( = ?auto_35622 ?auto_35628 ) ) ( not ( = ?auto_35626 ?auto_35628 ) ) ( not ( = ?auto_35623 ?auto_35628 ) ) ( SURFACE-AT ?auto_35620 ?auto_35624 ) ( ON ?auto_35620 ?auto_35629 ) ( CLEAR ?auto_35620 ) ( not ( = ?auto_35621 ?auto_35629 ) ) ( not ( = ?auto_35622 ?auto_35629 ) ) ( not ( = ?auto_35620 ?auto_35629 ) ) ( not ( = ?auto_35626 ?auto_35629 ) ) ( not ( = ?auto_35623 ?auto_35629 ) ) ( not ( = ?auto_35628 ?auto_35629 ) ) ( IS-CRATE ?auto_35628 ) ( not ( = ?auto_35636 ?auto_35628 ) ) ( not ( = ?auto_35621 ?auto_35636 ) ) ( not ( = ?auto_35622 ?auto_35636 ) ) ( not ( = ?auto_35620 ?auto_35636 ) ) ( not ( = ?auto_35626 ?auto_35636 ) ) ( not ( = ?auto_35623 ?auto_35636 ) ) ( not ( = ?auto_35629 ?auto_35636 ) ) ( AVAILABLE ?auto_35627 ) ( SURFACE-AT ?auto_35628 ?auto_35624 ) ( ON ?auto_35628 ?auto_35635 ) ( CLEAR ?auto_35628 ) ( not ( = ?auto_35621 ?auto_35635 ) ) ( not ( = ?auto_35622 ?auto_35635 ) ) ( not ( = ?auto_35620 ?auto_35635 ) ) ( not ( = ?auto_35626 ?auto_35635 ) ) ( not ( = ?auto_35623 ?auto_35635 ) ) ( not ( = ?auto_35628 ?auto_35635 ) ) ( not ( = ?auto_35629 ?auto_35635 ) ) ( not ( = ?auto_35636 ?auto_35635 ) ) ( TRUCK-AT ?auto_35632 ?auto_35634 ) ( SURFACE-AT ?auto_35631 ?auto_35634 ) ( CLEAR ?auto_35631 ) ( IS-CRATE ?auto_35636 ) ( not ( = ?auto_35631 ?auto_35636 ) ) ( not ( = ?auto_35621 ?auto_35631 ) ) ( not ( = ?auto_35622 ?auto_35631 ) ) ( not ( = ?auto_35620 ?auto_35631 ) ) ( not ( = ?auto_35626 ?auto_35631 ) ) ( not ( = ?auto_35623 ?auto_35631 ) ) ( not ( = ?auto_35628 ?auto_35631 ) ) ( not ( = ?auto_35629 ?auto_35631 ) ) ( not ( = ?auto_35635 ?auto_35631 ) ) ( AVAILABLE ?auto_35633 ) ( IN ?auto_35636 ?auto_35632 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35621 ?auto_35622 )
      ( MAKE-2CRATE-VERIFY ?auto_35620 ?auto_35621 ?auto_35622 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35637 - SURFACE
      ?auto_35638 - SURFACE
      ?auto_35639 - SURFACE
      ?auto_35640 - SURFACE
    )
    :vars
    (
      ?auto_35652 - HOIST
      ?auto_35647 - PLACE
      ?auto_35641 - PLACE
      ?auto_35645 - HOIST
      ?auto_35651 - SURFACE
      ?auto_35650 - PLACE
      ?auto_35643 - HOIST
      ?auto_35644 - SURFACE
      ?auto_35646 - SURFACE
      ?auto_35642 - SURFACE
      ?auto_35648 - SURFACE
      ?auto_35653 - TRUCK
      ?auto_35649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35652 ?auto_35647 ) ( IS-CRATE ?auto_35640 ) ( not ( = ?auto_35639 ?auto_35640 ) ) ( not ( = ?auto_35638 ?auto_35639 ) ) ( not ( = ?auto_35638 ?auto_35640 ) ) ( not ( = ?auto_35641 ?auto_35647 ) ) ( HOIST-AT ?auto_35645 ?auto_35641 ) ( not ( = ?auto_35652 ?auto_35645 ) ) ( SURFACE-AT ?auto_35640 ?auto_35641 ) ( ON ?auto_35640 ?auto_35651 ) ( CLEAR ?auto_35640 ) ( not ( = ?auto_35639 ?auto_35651 ) ) ( not ( = ?auto_35640 ?auto_35651 ) ) ( not ( = ?auto_35638 ?auto_35651 ) ) ( IS-CRATE ?auto_35639 ) ( not ( = ?auto_35650 ?auto_35647 ) ) ( not ( = ?auto_35641 ?auto_35650 ) ) ( HOIST-AT ?auto_35643 ?auto_35650 ) ( not ( = ?auto_35652 ?auto_35643 ) ) ( not ( = ?auto_35645 ?auto_35643 ) ) ( AVAILABLE ?auto_35643 ) ( SURFACE-AT ?auto_35639 ?auto_35650 ) ( ON ?auto_35639 ?auto_35644 ) ( CLEAR ?auto_35639 ) ( not ( = ?auto_35639 ?auto_35644 ) ) ( not ( = ?auto_35640 ?auto_35644 ) ) ( not ( = ?auto_35638 ?auto_35644 ) ) ( not ( = ?auto_35651 ?auto_35644 ) ) ( IS-CRATE ?auto_35638 ) ( not ( = ?auto_35637 ?auto_35638 ) ) ( not ( = ?auto_35639 ?auto_35637 ) ) ( not ( = ?auto_35640 ?auto_35637 ) ) ( not ( = ?auto_35651 ?auto_35637 ) ) ( not ( = ?auto_35644 ?auto_35637 ) ) ( SURFACE-AT ?auto_35638 ?auto_35641 ) ( ON ?auto_35638 ?auto_35646 ) ( CLEAR ?auto_35638 ) ( not ( = ?auto_35639 ?auto_35646 ) ) ( not ( = ?auto_35640 ?auto_35646 ) ) ( not ( = ?auto_35638 ?auto_35646 ) ) ( not ( = ?auto_35651 ?auto_35646 ) ) ( not ( = ?auto_35644 ?auto_35646 ) ) ( not ( = ?auto_35637 ?auto_35646 ) ) ( IS-CRATE ?auto_35637 ) ( not ( = ?auto_35642 ?auto_35637 ) ) ( not ( = ?auto_35639 ?auto_35642 ) ) ( not ( = ?auto_35640 ?auto_35642 ) ) ( not ( = ?auto_35638 ?auto_35642 ) ) ( not ( = ?auto_35651 ?auto_35642 ) ) ( not ( = ?auto_35644 ?auto_35642 ) ) ( not ( = ?auto_35646 ?auto_35642 ) ) ( AVAILABLE ?auto_35645 ) ( SURFACE-AT ?auto_35637 ?auto_35641 ) ( ON ?auto_35637 ?auto_35648 ) ( CLEAR ?auto_35637 ) ( not ( = ?auto_35639 ?auto_35648 ) ) ( not ( = ?auto_35640 ?auto_35648 ) ) ( not ( = ?auto_35638 ?auto_35648 ) ) ( not ( = ?auto_35651 ?auto_35648 ) ) ( not ( = ?auto_35644 ?auto_35648 ) ) ( not ( = ?auto_35637 ?auto_35648 ) ) ( not ( = ?auto_35646 ?auto_35648 ) ) ( not ( = ?auto_35642 ?auto_35648 ) ) ( TRUCK-AT ?auto_35653 ?auto_35647 ) ( SURFACE-AT ?auto_35649 ?auto_35647 ) ( CLEAR ?auto_35649 ) ( IS-CRATE ?auto_35642 ) ( not ( = ?auto_35649 ?auto_35642 ) ) ( not ( = ?auto_35639 ?auto_35649 ) ) ( not ( = ?auto_35640 ?auto_35649 ) ) ( not ( = ?auto_35638 ?auto_35649 ) ) ( not ( = ?auto_35651 ?auto_35649 ) ) ( not ( = ?auto_35644 ?auto_35649 ) ) ( not ( = ?auto_35637 ?auto_35649 ) ) ( not ( = ?auto_35646 ?auto_35649 ) ) ( not ( = ?auto_35648 ?auto_35649 ) ) ( AVAILABLE ?auto_35652 ) ( IN ?auto_35642 ?auto_35653 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35638 ?auto_35639 ?auto_35640 )
      ( MAKE-3CRATE-VERIFY ?auto_35637 ?auto_35638 ?auto_35639 ?auto_35640 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35654 - SURFACE
      ?auto_35655 - SURFACE
      ?auto_35656 - SURFACE
      ?auto_35657 - SURFACE
      ?auto_35658 - SURFACE
    )
    :vars
    (
      ?auto_35669 - HOIST
      ?auto_35664 - PLACE
      ?auto_35659 - PLACE
      ?auto_35662 - HOIST
      ?auto_35668 - SURFACE
      ?auto_35667 - PLACE
      ?auto_35660 - HOIST
      ?auto_35661 - SURFACE
      ?auto_35663 - SURFACE
      ?auto_35665 - SURFACE
      ?auto_35670 - TRUCK
      ?auto_35666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35669 ?auto_35664 ) ( IS-CRATE ?auto_35658 ) ( not ( = ?auto_35657 ?auto_35658 ) ) ( not ( = ?auto_35656 ?auto_35657 ) ) ( not ( = ?auto_35656 ?auto_35658 ) ) ( not ( = ?auto_35659 ?auto_35664 ) ) ( HOIST-AT ?auto_35662 ?auto_35659 ) ( not ( = ?auto_35669 ?auto_35662 ) ) ( SURFACE-AT ?auto_35658 ?auto_35659 ) ( ON ?auto_35658 ?auto_35668 ) ( CLEAR ?auto_35658 ) ( not ( = ?auto_35657 ?auto_35668 ) ) ( not ( = ?auto_35658 ?auto_35668 ) ) ( not ( = ?auto_35656 ?auto_35668 ) ) ( IS-CRATE ?auto_35657 ) ( not ( = ?auto_35667 ?auto_35664 ) ) ( not ( = ?auto_35659 ?auto_35667 ) ) ( HOIST-AT ?auto_35660 ?auto_35667 ) ( not ( = ?auto_35669 ?auto_35660 ) ) ( not ( = ?auto_35662 ?auto_35660 ) ) ( AVAILABLE ?auto_35660 ) ( SURFACE-AT ?auto_35657 ?auto_35667 ) ( ON ?auto_35657 ?auto_35661 ) ( CLEAR ?auto_35657 ) ( not ( = ?auto_35657 ?auto_35661 ) ) ( not ( = ?auto_35658 ?auto_35661 ) ) ( not ( = ?auto_35656 ?auto_35661 ) ) ( not ( = ?auto_35668 ?auto_35661 ) ) ( IS-CRATE ?auto_35656 ) ( not ( = ?auto_35655 ?auto_35656 ) ) ( not ( = ?auto_35657 ?auto_35655 ) ) ( not ( = ?auto_35658 ?auto_35655 ) ) ( not ( = ?auto_35668 ?auto_35655 ) ) ( not ( = ?auto_35661 ?auto_35655 ) ) ( SURFACE-AT ?auto_35656 ?auto_35659 ) ( ON ?auto_35656 ?auto_35663 ) ( CLEAR ?auto_35656 ) ( not ( = ?auto_35657 ?auto_35663 ) ) ( not ( = ?auto_35658 ?auto_35663 ) ) ( not ( = ?auto_35656 ?auto_35663 ) ) ( not ( = ?auto_35668 ?auto_35663 ) ) ( not ( = ?auto_35661 ?auto_35663 ) ) ( not ( = ?auto_35655 ?auto_35663 ) ) ( IS-CRATE ?auto_35655 ) ( not ( = ?auto_35654 ?auto_35655 ) ) ( not ( = ?auto_35657 ?auto_35654 ) ) ( not ( = ?auto_35658 ?auto_35654 ) ) ( not ( = ?auto_35656 ?auto_35654 ) ) ( not ( = ?auto_35668 ?auto_35654 ) ) ( not ( = ?auto_35661 ?auto_35654 ) ) ( not ( = ?auto_35663 ?auto_35654 ) ) ( AVAILABLE ?auto_35662 ) ( SURFACE-AT ?auto_35655 ?auto_35659 ) ( ON ?auto_35655 ?auto_35665 ) ( CLEAR ?auto_35655 ) ( not ( = ?auto_35657 ?auto_35665 ) ) ( not ( = ?auto_35658 ?auto_35665 ) ) ( not ( = ?auto_35656 ?auto_35665 ) ) ( not ( = ?auto_35668 ?auto_35665 ) ) ( not ( = ?auto_35661 ?auto_35665 ) ) ( not ( = ?auto_35655 ?auto_35665 ) ) ( not ( = ?auto_35663 ?auto_35665 ) ) ( not ( = ?auto_35654 ?auto_35665 ) ) ( TRUCK-AT ?auto_35670 ?auto_35664 ) ( SURFACE-AT ?auto_35666 ?auto_35664 ) ( CLEAR ?auto_35666 ) ( IS-CRATE ?auto_35654 ) ( not ( = ?auto_35666 ?auto_35654 ) ) ( not ( = ?auto_35657 ?auto_35666 ) ) ( not ( = ?auto_35658 ?auto_35666 ) ) ( not ( = ?auto_35656 ?auto_35666 ) ) ( not ( = ?auto_35668 ?auto_35666 ) ) ( not ( = ?auto_35661 ?auto_35666 ) ) ( not ( = ?auto_35655 ?auto_35666 ) ) ( not ( = ?auto_35663 ?auto_35666 ) ) ( not ( = ?auto_35665 ?auto_35666 ) ) ( AVAILABLE ?auto_35669 ) ( IN ?auto_35654 ?auto_35670 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35656 ?auto_35657 ?auto_35658 )
      ( MAKE-4CRATE-VERIFY ?auto_35654 ?auto_35655 ?auto_35656 ?auto_35657 ?auto_35658 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35671 - SURFACE
      ?auto_35672 - SURFACE
      ?auto_35673 - SURFACE
      ?auto_35674 - SURFACE
      ?auto_35675 - SURFACE
      ?auto_35676 - SURFACE
    )
    :vars
    (
      ?auto_35686 - HOIST
      ?auto_35682 - PLACE
      ?auto_35677 - PLACE
      ?auto_35680 - HOIST
      ?auto_35685 - SURFACE
      ?auto_35684 - PLACE
      ?auto_35678 - HOIST
      ?auto_35679 - SURFACE
      ?auto_35681 - SURFACE
      ?auto_35683 - SURFACE
      ?auto_35687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35686 ?auto_35682 ) ( IS-CRATE ?auto_35676 ) ( not ( = ?auto_35675 ?auto_35676 ) ) ( not ( = ?auto_35674 ?auto_35675 ) ) ( not ( = ?auto_35674 ?auto_35676 ) ) ( not ( = ?auto_35677 ?auto_35682 ) ) ( HOIST-AT ?auto_35680 ?auto_35677 ) ( not ( = ?auto_35686 ?auto_35680 ) ) ( SURFACE-AT ?auto_35676 ?auto_35677 ) ( ON ?auto_35676 ?auto_35685 ) ( CLEAR ?auto_35676 ) ( not ( = ?auto_35675 ?auto_35685 ) ) ( not ( = ?auto_35676 ?auto_35685 ) ) ( not ( = ?auto_35674 ?auto_35685 ) ) ( IS-CRATE ?auto_35675 ) ( not ( = ?auto_35684 ?auto_35682 ) ) ( not ( = ?auto_35677 ?auto_35684 ) ) ( HOIST-AT ?auto_35678 ?auto_35684 ) ( not ( = ?auto_35686 ?auto_35678 ) ) ( not ( = ?auto_35680 ?auto_35678 ) ) ( AVAILABLE ?auto_35678 ) ( SURFACE-AT ?auto_35675 ?auto_35684 ) ( ON ?auto_35675 ?auto_35679 ) ( CLEAR ?auto_35675 ) ( not ( = ?auto_35675 ?auto_35679 ) ) ( not ( = ?auto_35676 ?auto_35679 ) ) ( not ( = ?auto_35674 ?auto_35679 ) ) ( not ( = ?auto_35685 ?auto_35679 ) ) ( IS-CRATE ?auto_35674 ) ( not ( = ?auto_35673 ?auto_35674 ) ) ( not ( = ?auto_35675 ?auto_35673 ) ) ( not ( = ?auto_35676 ?auto_35673 ) ) ( not ( = ?auto_35685 ?auto_35673 ) ) ( not ( = ?auto_35679 ?auto_35673 ) ) ( SURFACE-AT ?auto_35674 ?auto_35677 ) ( ON ?auto_35674 ?auto_35681 ) ( CLEAR ?auto_35674 ) ( not ( = ?auto_35675 ?auto_35681 ) ) ( not ( = ?auto_35676 ?auto_35681 ) ) ( not ( = ?auto_35674 ?auto_35681 ) ) ( not ( = ?auto_35685 ?auto_35681 ) ) ( not ( = ?auto_35679 ?auto_35681 ) ) ( not ( = ?auto_35673 ?auto_35681 ) ) ( IS-CRATE ?auto_35673 ) ( not ( = ?auto_35672 ?auto_35673 ) ) ( not ( = ?auto_35675 ?auto_35672 ) ) ( not ( = ?auto_35676 ?auto_35672 ) ) ( not ( = ?auto_35674 ?auto_35672 ) ) ( not ( = ?auto_35685 ?auto_35672 ) ) ( not ( = ?auto_35679 ?auto_35672 ) ) ( not ( = ?auto_35681 ?auto_35672 ) ) ( AVAILABLE ?auto_35680 ) ( SURFACE-AT ?auto_35673 ?auto_35677 ) ( ON ?auto_35673 ?auto_35683 ) ( CLEAR ?auto_35673 ) ( not ( = ?auto_35675 ?auto_35683 ) ) ( not ( = ?auto_35676 ?auto_35683 ) ) ( not ( = ?auto_35674 ?auto_35683 ) ) ( not ( = ?auto_35685 ?auto_35683 ) ) ( not ( = ?auto_35679 ?auto_35683 ) ) ( not ( = ?auto_35673 ?auto_35683 ) ) ( not ( = ?auto_35681 ?auto_35683 ) ) ( not ( = ?auto_35672 ?auto_35683 ) ) ( TRUCK-AT ?auto_35687 ?auto_35682 ) ( SURFACE-AT ?auto_35671 ?auto_35682 ) ( CLEAR ?auto_35671 ) ( IS-CRATE ?auto_35672 ) ( not ( = ?auto_35671 ?auto_35672 ) ) ( not ( = ?auto_35675 ?auto_35671 ) ) ( not ( = ?auto_35676 ?auto_35671 ) ) ( not ( = ?auto_35674 ?auto_35671 ) ) ( not ( = ?auto_35685 ?auto_35671 ) ) ( not ( = ?auto_35679 ?auto_35671 ) ) ( not ( = ?auto_35673 ?auto_35671 ) ) ( not ( = ?auto_35681 ?auto_35671 ) ) ( not ( = ?auto_35683 ?auto_35671 ) ) ( AVAILABLE ?auto_35686 ) ( IN ?auto_35672 ?auto_35687 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35674 ?auto_35675 ?auto_35676 )
      ( MAKE-5CRATE-VERIFY ?auto_35671 ?auto_35672 ?auto_35673 ?auto_35674 ?auto_35675 ?auto_35676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35688 - SURFACE
      ?auto_35689 - SURFACE
    )
    :vars
    (
      ?auto_35703 - HOIST
      ?auto_35697 - PLACE
      ?auto_35702 - SURFACE
      ?auto_35691 - PLACE
      ?auto_35695 - HOIST
      ?auto_35701 - SURFACE
      ?auto_35700 - PLACE
      ?auto_35693 - HOIST
      ?auto_35694 - SURFACE
      ?auto_35690 - SURFACE
      ?auto_35696 - SURFACE
      ?auto_35692 - SURFACE
      ?auto_35698 - SURFACE
      ?auto_35699 - SURFACE
      ?auto_35704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35703 ?auto_35697 ) ( IS-CRATE ?auto_35689 ) ( not ( = ?auto_35688 ?auto_35689 ) ) ( not ( = ?auto_35702 ?auto_35688 ) ) ( not ( = ?auto_35702 ?auto_35689 ) ) ( not ( = ?auto_35691 ?auto_35697 ) ) ( HOIST-AT ?auto_35695 ?auto_35691 ) ( not ( = ?auto_35703 ?auto_35695 ) ) ( SURFACE-AT ?auto_35689 ?auto_35691 ) ( ON ?auto_35689 ?auto_35701 ) ( CLEAR ?auto_35689 ) ( not ( = ?auto_35688 ?auto_35701 ) ) ( not ( = ?auto_35689 ?auto_35701 ) ) ( not ( = ?auto_35702 ?auto_35701 ) ) ( IS-CRATE ?auto_35688 ) ( not ( = ?auto_35700 ?auto_35697 ) ) ( not ( = ?auto_35691 ?auto_35700 ) ) ( HOIST-AT ?auto_35693 ?auto_35700 ) ( not ( = ?auto_35703 ?auto_35693 ) ) ( not ( = ?auto_35695 ?auto_35693 ) ) ( AVAILABLE ?auto_35693 ) ( SURFACE-AT ?auto_35688 ?auto_35700 ) ( ON ?auto_35688 ?auto_35694 ) ( CLEAR ?auto_35688 ) ( not ( = ?auto_35688 ?auto_35694 ) ) ( not ( = ?auto_35689 ?auto_35694 ) ) ( not ( = ?auto_35702 ?auto_35694 ) ) ( not ( = ?auto_35701 ?auto_35694 ) ) ( IS-CRATE ?auto_35702 ) ( not ( = ?auto_35690 ?auto_35702 ) ) ( not ( = ?auto_35688 ?auto_35690 ) ) ( not ( = ?auto_35689 ?auto_35690 ) ) ( not ( = ?auto_35701 ?auto_35690 ) ) ( not ( = ?auto_35694 ?auto_35690 ) ) ( SURFACE-AT ?auto_35702 ?auto_35691 ) ( ON ?auto_35702 ?auto_35696 ) ( CLEAR ?auto_35702 ) ( not ( = ?auto_35688 ?auto_35696 ) ) ( not ( = ?auto_35689 ?auto_35696 ) ) ( not ( = ?auto_35702 ?auto_35696 ) ) ( not ( = ?auto_35701 ?auto_35696 ) ) ( not ( = ?auto_35694 ?auto_35696 ) ) ( not ( = ?auto_35690 ?auto_35696 ) ) ( IS-CRATE ?auto_35690 ) ( not ( = ?auto_35692 ?auto_35690 ) ) ( not ( = ?auto_35688 ?auto_35692 ) ) ( not ( = ?auto_35689 ?auto_35692 ) ) ( not ( = ?auto_35702 ?auto_35692 ) ) ( not ( = ?auto_35701 ?auto_35692 ) ) ( not ( = ?auto_35694 ?auto_35692 ) ) ( not ( = ?auto_35696 ?auto_35692 ) ) ( AVAILABLE ?auto_35695 ) ( SURFACE-AT ?auto_35690 ?auto_35691 ) ( ON ?auto_35690 ?auto_35698 ) ( CLEAR ?auto_35690 ) ( not ( = ?auto_35688 ?auto_35698 ) ) ( not ( = ?auto_35689 ?auto_35698 ) ) ( not ( = ?auto_35702 ?auto_35698 ) ) ( not ( = ?auto_35701 ?auto_35698 ) ) ( not ( = ?auto_35694 ?auto_35698 ) ) ( not ( = ?auto_35690 ?auto_35698 ) ) ( not ( = ?auto_35696 ?auto_35698 ) ) ( not ( = ?auto_35692 ?auto_35698 ) ) ( SURFACE-AT ?auto_35699 ?auto_35697 ) ( CLEAR ?auto_35699 ) ( IS-CRATE ?auto_35692 ) ( not ( = ?auto_35699 ?auto_35692 ) ) ( not ( = ?auto_35688 ?auto_35699 ) ) ( not ( = ?auto_35689 ?auto_35699 ) ) ( not ( = ?auto_35702 ?auto_35699 ) ) ( not ( = ?auto_35701 ?auto_35699 ) ) ( not ( = ?auto_35694 ?auto_35699 ) ) ( not ( = ?auto_35690 ?auto_35699 ) ) ( not ( = ?auto_35696 ?auto_35699 ) ) ( not ( = ?auto_35698 ?auto_35699 ) ) ( AVAILABLE ?auto_35703 ) ( IN ?auto_35692 ?auto_35704 ) ( TRUCK-AT ?auto_35704 ?auto_35691 ) )
    :subtasks
    ( ( !DRIVE ?auto_35704 ?auto_35691 ?auto_35697 )
      ( MAKE-2CRATE ?auto_35702 ?auto_35688 ?auto_35689 )
      ( MAKE-1CRATE-VERIFY ?auto_35688 ?auto_35689 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35705 - SURFACE
      ?auto_35706 - SURFACE
      ?auto_35707 - SURFACE
    )
    :vars
    (
      ?auto_35719 - HOIST
      ?auto_35708 - PLACE
      ?auto_35714 - PLACE
      ?auto_35718 - HOIST
      ?auto_35710 - SURFACE
      ?auto_35717 - PLACE
      ?auto_35716 - HOIST
      ?auto_35721 - SURFACE
      ?auto_35711 - SURFACE
      ?auto_35712 - SURFACE
      ?auto_35715 - SURFACE
      ?auto_35713 - SURFACE
      ?auto_35709 - SURFACE
      ?auto_35720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35719 ?auto_35708 ) ( IS-CRATE ?auto_35707 ) ( not ( = ?auto_35706 ?auto_35707 ) ) ( not ( = ?auto_35705 ?auto_35706 ) ) ( not ( = ?auto_35705 ?auto_35707 ) ) ( not ( = ?auto_35714 ?auto_35708 ) ) ( HOIST-AT ?auto_35718 ?auto_35714 ) ( not ( = ?auto_35719 ?auto_35718 ) ) ( SURFACE-AT ?auto_35707 ?auto_35714 ) ( ON ?auto_35707 ?auto_35710 ) ( CLEAR ?auto_35707 ) ( not ( = ?auto_35706 ?auto_35710 ) ) ( not ( = ?auto_35707 ?auto_35710 ) ) ( not ( = ?auto_35705 ?auto_35710 ) ) ( IS-CRATE ?auto_35706 ) ( not ( = ?auto_35717 ?auto_35708 ) ) ( not ( = ?auto_35714 ?auto_35717 ) ) ( HOIST-AT ?auto_35716 ?auto_35717 ) ( not ( = ?auto_35719 ?auto_35716 ) ) ( not ( = ?auto_35718 ?auto_35716 ) ) ( AVAILABLE ?auto_35716 ) ( SURFACE-AT ?auto_35706 ?auto_35717 ) ( ON ?auto_35706 ?auto_35721 ) ( CLEAR ?auto_35706 ) ( not ( = ?auto_35706 ?auto_35721 ) ) ( not ( = ?auto_35707 ?auto_35721 ) ) ( not ( = ?auto_35705 ?auto_35721 ) ) ( not ( = ?auto_35710 ?auto_35721 ) ) ( IS-CRATE ?auto_35705 ) ( not ( = ?auto_35711 ?auto_35705 ) ) ( not ( = ?auto_35706 ?auto_35711 ) ) ( not ( = ?auto_35707 ?auto_35711 ) ) ( not ( = ?auto_35710 ?auto_35711 ) ) ( not ( = ?auto_35721 ?auto_35711 ) ) ( SURFACE-AT ?auto_35705 ?auto_35714 ) ( ON ?auto_35705 ?auto_35712 ) ( CLEAR ?auto_35705 ) ( not ( = ?auto_35706 ?auto_35712 ) ) ( not ( = ?auto_35707 ?auto_35712 ) ) ( not ( = ?auto_35705 ?auto_35712 ) ) ( not ( = ?auto_35710 ?auto_35712 ) ) ( not ( = ?auto_35721 ?auto_35712 ) ) ( not ( = ?auto_35711 ?auto_35712 ) ) ( IS-CRATE ?auto_35711 ) ( not ( = ?auto_35715 ?auto_35711 ) ) ( not ( = ?auto_35706 ?auto_35715 ) ) ( not ( = ?auto_35707 ?auto_35715 ) ) ( not ( = ?auto_35705 ?auto_35715 ) ) ( not ( = ?auto_35710 ?auto_35715 ) ) ( not ( = ?auto_35721 ?auto_35715 ) ) ( not ( = ?auto_35712 ?auto_35715 ) ) ( AVAILABLE ?auto_35718 ) ( SURFACE-AT ?auto_35711 ?auto_35714 ) ( ON ?auto_35711 ?auto_35713 ) ( CLEAR ?auto_35711 ) ( not ( = ?auto_35706 ?auto_35713 ) ) ( not ( = ?auto_35707 ?auto_35713 ) ) ( not ( = ?auto_35705 ?auto_35713 ) ) ( not ( = ?auto_35710 ?auto_35713 ) ) ( not ( = ?auto_35721 ?auto_35713 ) ) ( not ( = ?auto_35711 ?auto_35713 ) ) ( not ( = ?auto_35712 ?auto_35713 ) ) ( not ( = ?auto_35715 ?auto_35713 ) ) ( SURFACE-AT ?auto_35709 ?auto_35708 ) ( CLEAR ?auto_35709 ) ( IS-CRATE ?auto_35715 ) ( not ( = ?auto_35709 ?auto_35715 ) ) ( not ( = ?auto_35706 ?auto_35709 ) ) ( not ( = ?auto_35707 ?auto_35709 ) ) ( not ( = ?auto_35705 ?auto_35709 ) ) ( not ( = ?auto_35710 ?auto_35709 ) ) ( not ( = ?auto_35721 ?auto_35709 ) ) ( not ( = ?auto_35711 ?auto_35709 ) ) ( not ( = ?auto_35712 ?auto_35709 ) ) ( not ( = ?auto_35713 ?auto_35709 ) ) ( AVAILABLE ?auto_35719 ) ( IN ?auto_35715 ?auto_35720 ) ( TRUCK-AT ?auto_35720 ?auto_35714 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35706 ?auto_35707 )
      ( MAKE-2CRATE-VERIFY ?auto_35705 ?auto_35706 ?auto_35707 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35722 - SURFACE
      ?auto_35723 - SURFACE
      ?auto_35724 - SURFACE
      ?auto_35725 - SURFACE
    )
    :vars
    (
      ?auto_35730 - HOIST
      ?auto_35736 - PLACE
      ?auto_35735 - PLACE
      ?auto_35728 - HOIST
      ?auto_35726 - SURFACE
      ?auto_35734 - PLACE
      ?auto_35733 - HOIST
      ?auto_35727 - SURFACE
      ?auto_35738 - SURFACE
      ?auto_35729 - SURFACE
      ?auto_35732 - SURFACE
      ?auto_35737 - SURFACE
      ?auto_35731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35730 ?auto_35736 ) ( IS-CRATE ?auto_35725 ) ( not ( = ?auto_35724 ?auto_35725 ) ) ( not ( = ?auto_35723 ?auto_35724 ) ) ( not ( = ?auto_35723 ?auto_35725 ) ) ( not ( = ?auto_35735 ?auto_35736 ) ) ( HOIST-AT ?auto_35728 ?auto_35735 ) ( not ( = ?auto_35730 ?auto_35728 ) ) ( SURFACE-AT ?auto_35725 ?auto_35735 ) ( ON ?auto_35725 ?auto_35726 ) ( CLEAR ?auto_35725 ) ( not ( = ?auto_35724 ?auto_35726 ) ) ( not ( = ?auto_35725 ?auto_35726 ) ) ( not ( = ?auto_35723 ?auto_35726 ) ) ( IS-CRATE ?auto_35724 ) ( not ( = ?auto_35734 ?auto_35736 ) ) ( not ( = ?auto_35735 ?auto_35734 ) ) ( HOIST-AT ?auto_35733 ?auto_35734 ) ( not ( = ?auto_35730 ?auto_35733 ) ) ( not ( = ?auto_35728 ?auto_35733 ) ) ( AVAILABLE ?auto_35733 ) ( SURFACE-AT ?auto_35724 ?auto_35734 ) ( ON ?auto_35724 ?auto_35727 ) ( CLEAR ?auto_35724 ) ( not ( = ?auto_35724 ?auto_35727 ) ) ( not ( = ?auto_35725 ?auto_35727 ) ) ( not ( = ?auto_35723 ?auto_35727 ) ) ( not ( = ?auto_35726 ?auto_35727 ) ) ( IS-CRATE ?auto_35723 ) ( not ( = ?auto_35722 ?auto_35723 ) ) ( not ( = ?auto_35724 ?auto_35722 ) ) ( not ( = ?auto_35725 ?auto_35722 ) ) ( not ( = ?auto_35726 ?auto_35722 ) ) ( not ( = ?auto_35727 ?auto_35722 ) ) ( SURFACE-AT ?auto_35723 ?auto_35735 ) ( ON ?auto_35723 ?auto_35738 ) ( CLEAR ?auto_35723 ) ( not ( = ?auto_35724 ?auto_35738 ) ) ( not ( = ?auto_35725 ?auto_35738 ) ) ( not ( = ?auto_35723 ?auto_35738 ) ) ( not ( = ?auto_35726 ?auto_35738 ) ) ( not ( = ?auto_35727 ?auto_35738 ) ) ( not ( = ?auto_35722 ?auto_35738 ) ) ( IS-CRATE ?auto_35722 ) ( not ( = ?auto_35729 ?auto_35722 ) ) ( not ( = ?auto_35724 ?auto_35729 ) ) ( not ( = ?auto_35725 ?auto_35729 ) ) ( not ( = ?auto_35723 ?auto_35729 ) ) ( not ( = ?auto_35726 ?auto_35729 ) ) ( not ( = ?auto_35727 ?auto_35729 ) ) ( not ( = ?auto_35738 ?auto_35729 ) ) ( AVAILABLE ?auto_35728 ) ( SURFACE-AT ?auto_35722 ?auto_35735 ) ( ON ?auto_35722 ?auto_35732 ) ( CLEAR ?auto_35722 ) ( not ( = ?auto_35724 ?auto_35732 ) ) ( not ( = ?auto_35725 ?auto_35732 ) ) ( not ( = ?auto_35723 ?auto_35732 ) ) ( not ( = ?auto_35726 ?auto_35732 ) ) ( not ( = ?auto_35727 ?auto_35732 ) ) ( not ( = ?auto_35722 ?auto_35732 ) ) ( not ( = ?auto_35738 ?auto_35732 ) ) ( not ( = ?auto_35729 ?auto_35732 ) ) ( SURFACE-AT ?auto_35737 ?auto_35736 ) ( CLEAR ?auto_35737 ) ( IS-CRATE ?auto_35729 ) ( not ( = ?auto_35737 ?auto_35729 ) ) ( not ( = ?auto_35724 ?auto_35737 ) ) ( not ( = ?auto_35725 ?auto_35737 ) ) ( not ( = ?auto_35723 ?auto_35737 ) ) ( not ( = ?auto_35726 ?auto_35737 ) ) ( not ( = ?auto_35727 ?auto_35737 ) ) ( not ( = ?auto_35722 ?auto_35737 ) ) ( not ( = ?auto_35738 ?auto_35737 ) ) ( not ( = ?auto_35732 ?auto_35737 ) ) ( AVAILABLE ?auto_35730 ) ( IN ?auto_35729 ?auto_35731 ) ( TRUCK-AT ?auto_35731 ?auto_35735 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35723 ?auto_35724 ?auto_35725 )
      ( MAKE-3CRATE-VERIFY ?auto_35722 ?auto_35723 ?auto_35724 ?auto_35725 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35739 - SURFACE
      ?auto_35740 - SURFACE
      ?auto_35741 - SURFACE
      ?auto_35742 - SURFACE
      ?auto_35743 - SURFACE
    )
    :vars
    (
      ?auto_35747 - HOIST
      ?auto_35753 - PLACE
      ?auto_35752 - PLACE
      ?auto_35746 - HOIST
      ?auto_35744 - SURFACE
      ?auto_35751 - PLACE
      ?auto_35750 - HOIST
      ?auto_35745 - SURFACE
      ?auto_35755 - SURFACE
      ?auto_35749 - SURFACE
      ?auto_35754 - SURFACE
      ?auto_35748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35747 ?auto_35753 ) ( IS-CRATE ?auto_35743 ) ( not ( = ?auto_35742 ?auto_35743 ) ) ( not ( = ?auto_35741 ?auto_35742 ) ) ( not ( = ?auto_35741 ?auto_35743 ) ) ( not ( = ?auto_35752 ?auto_35753 ) ) ( HOIST-AT ?auto_35746 ?auto_35752 ) ( not ( = ?auto_35747 ?auto_35746 ) ) ( SURFACE-AT ?auto_35743 ?auto_35752 ) ( ON ?auto_35743 ?auto_35744 ) ( CLEAR ?auto_35743 ) ( not ( = ?auto_35742 ?auto_35744 ) ) ( not ( = ?auto_35743 ?auto_35744 ) ) ( not ( = ?auto_35741 ?auto_35744 ) ) ( IS-CRATE ?auto_35742 ) ( not ( = ?auto_35751 ?auto_35753 ) ) ( not ( = ?auto_35752 ?auto_35751 ) ) ( HOIST-AT ?auto_35750 ?auto_35751 ) ( not ( = ?auto_35747 ?auto_35750 ) ) ( not ( = ?auto_35746 ?auto_35750 ) ) ( AVAILABLE ?auto_35750 ) ( SURFACE-AT ?auto_35742 ?auto_35751 ) ( ON ?auto_35742 ?auto_35745 ) ( CLEAR ?auto_35742 ) ( not ( = ?auto_35742 ?auto_35745 ) ) ( not ( = ?auto_35743 ?auto_35745 ) ) ( not ( = ?auto_35741 ?auto_35745 ) ) ( not ( = ?auto_35744 ?auto_35745 ) ) ( IS-CRATE ?auto_35741 ) ( not ( = ?auto_35740 ?auto_35741 ) ) ( not ( = ?auto_35742 ?auto_35740 ) ) ( not ( = ?auto_35743 ?auto_35740 ) ) ( not ( = ?auto_35744 ?auto_35740 ) ) ( not ( = ?auto_35745 ?auto_35740 ) ) ( SURFACE-AT ?auto_35741 ?auto_35752 ) ( ON ?auto_35741 ?auto_35755 ) ( CLEAR ?auto_35741 ) ( not ( = ?auto_35742 ?auto_35755 ) ) ( not ( = ?auto_35743 ?auto_35755 ) ) ( not ( = ?auto_35741 ?auto_35755 ) ) ( not ( = ?auto_35744 ?auto_35755 ) ) ( not ( = ?auto_35745 ?auto_35755 ) ) ( not ( = ?auto_35740 ?auto_35755 ) ) ( IS-CRATE ?auto_35740 ) ( not ( = ?auto_35739 ?auto_35740 ) ) ( not ( = ?auto_35742 ?auto_35739 ) ) ( not ( = ?auto_35743 ?auto_35739 ) ) ( not ( = ?auto_35741 ?auto_35739 ) ) ( not ( = ?auto_35744 ?auto_35739 ) ) ( not ( = ?auto_35745 ?auto_35739 ) ) ( not ( = ?auto_35755 ?auto_35739 ) ) ( AVAILABLE ?auto_35746 ) ( SURFACE-AT ?auto_35740 ?auto_35752 ) ( ON ?auto_35740 ?auto_35749 ) ( CLEAR ?auto_35740 ) ( not ( = ?auto_35742 ?auto_35749 ) ) ( not ( = ?auto_35743 ?auto_35749 ) ) ( not ( = ?auto_35741 ?auto_35749 ) ) ( not ( = ?auto_35744 ?auto_35749 ) ) ( not ( = ?auto_35745 ?auto_35749 ) ) ( not ( = ?auto_35740 ?auto_35749 ) ) ( not ( = ?auto_35755 ?auto_35749 ) ) ( not ( = ?auto_35739 ?auto_35749 ) ) ( SURFACE-AT ?auto_35754 ?auto_35753 ) ( CLEAR ?auto_35754 ) ( IS-CRATE ?auto_35739 ) ( not ( = ?auto_35754 ?auto_35739 ) ) ( not ( = ?auto_35742 ?auto_35754 ) ) ( not ( = ?auto_35743 ?auto_35754 ) ) ( not ( = ?auto_35741 ?auto_35754 ) ) ( not ( = ?auto_35744 ?auto_35754 ) ) ( not ( = ?auto_35745 ?auto_35754 ) ) ( not ( = ?auto_35740 ?auto_35754 ) ) ( not ( = ?auto_35755 ?auto_35754 ) ) ( not ( = ?auto_35749 ?auto_35754 ) ) ( AVAILABLE ?auto_35747 ) ( IN ?auto_35739 ?auto_35748 ) ( TRUCK-AT ?auto_35748 ?auto_35752 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35741 ?auto_35742 ?auto_35743 )
      ( MAKE-4CRATE-VERIFY ?auto_35739 ?auto_35740 ?auto_35741 ?auto_35742 ?auto_35743 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35756 - SURFACE
      ?auto_35757 - SURFACE
      ?auto_35758 - SURFACE
      ?auto_35759 - SURFACE
      ?auto_35760 - SURFACE
      ?auto_35761 - SURFACE
    )
    :vars
    (
      ?auto_35765 - HOIST
      ?auto_35771 - PLACE
      ?auto_35770 - PLACE
      ?auto_35764 - HOIST
      ?auto_35762 - SURFACE
      ?auto_35769 - PLACE
      ?auto_35768 - HOIST
      ?auto_35763 - SURFACE
      ?auto_35772 - SURFACE
      ?auto_35767 - SURFACE
      ?auto_35766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35765 ?auto_35771 ) ( IS-CRATE ?auto_35761 ) ( not ( = ?auto_35760 ?auto_35761 ) ) ( not ( = ?auto_35759 ?auto_35760 ) ) ( not ( = ?auto_35759 ?auto_35761 ) ) ( not ( = ?auto_35770 ?auto_35771 ) ) ( HOIST-AT ?auto_35764 ?auto_35770 ) ( not ( = ?auto_35765 ?auto_35764 ) ) ( SURFACE-AT ?auto_35761 ?auto_35770 ) ( ON ?auto_35761 ?auto_35762 ) ( CLEAR ?auto_35761 ) ( not ( = ?auto_35760 ?auto_35762 ) ) ( not ( = ?auto_35761 ?auto_35762 ) ) ( not ( = ?auto_35759 ?auto_35762 ) ) ( IS-CRATE ?auto_35760 ) ( not ( = ?auto_35769 ?auto_35771 ) ) ( not ( = ?auto_35770 ?auto_35769 ) ) ( HOIST-AT ?auto_35768 ?auto_35769 ) ( not ( = ?auto_35765 ?auto_35768 ) ) ( not ( = ?auto_35764 ?auto_35768 ) ) ( AVAILABLE ?auto_35768 ) ( SURFACE-AT ?auto_35760 ?auto_35769 ) ( ON ?auto_35760 ?auto_35763 ) ( CLEAR ?auto_35760 ) ( not ( = ?auto_35760 ?auto_35763 ) ) ( not ( = ?auto_35761 ?auto_35763 ) ) ( not ( = ?auto_35759 ?auto_35763 ) ) ( not ( = ?auto_35762 ?auto_35763 ) ) ( IS-CRATE ?auto_35759 ) ( not ( = ?auto_35758 ?auto_35759 ) ) ( not ( = ?auto_35760 ?auto_35758 ) ) ( not ( = ?auto_35761 ?auto_35758 ) ) ( not ( = ?auto_35762 ?auto_35758 ) ) ( not ( = ?auto_35763 ?auto_35758 ) ) ( SURFACE-AT ?auto_35759 ?auto_35770 ) ( ON ?auto_35759 ?auto_35772 ) ( CLEAR ?auto_35759 ) ( not ( = ?auto_35760 ?auto_35772 ) ) ( not ( = ?auto_35761 ?auto_35772 ) ) ( not ( = ?auto_35759 ?auto_35772 ) ) ( not ( = ?auto_35762 ?auto_35772 ) ) ( not ( = ?auto_35763 ?auto_35772 ) ) ( not ( = ?auto_35758 ?auto_35772 ) ) ( IS-CRATE ?auto_35758 ) ( not ( = ?auto_35757 ?auto_35758 ) ) ( not ( = ?auto_35760 ?auto_35757 ) ) ( not ( = ?auto_35761 ?auto_35757 ) ) ( not ( = ?auto_35759 ?auto_35757 ) ) ( not ( = ?auto_35762 ?auto_35757 ) ) ( not ( = ?auto_35763 ?auto_35757 ) ) ( not ( = ?auto_35772 ?auto_35757 ) ) ( AVAILABLE ?auto_35764 ) ( SURFACE-AT ?auto_35758 ?auto_35770 ) ( ON ?auto_35758 ?auto_35767 ) ( CLEAR ?auto_35758 ) ( not ( = ?auto_35760 ?auto_35767 ) ) ( not ( = ?auto_35761 ?auto_35767 ) ) ( not ( = ?auto_35759 ?auto_35767 ) ) ( not ( = ?auto_35762 ?auto_35767 ) ) ( not ( = ?auto_35763 ?auto_35767 ) ) ( not ( = ?auto_35758 ?auto_35767 ) ) ( not ( = ?auto_35772 ?auto_35767 ) ) ( not ( = ?auto_35757 ?auto_35767 ) ) ( SURFACE-AT ?auto_35756 ?auto_35771 ) ( CLEAR ?auto_35756 ) ( IS-CRATE ?auto_35757 ) ( not ( = ?auto_35756 ?auto_35757 ) ) ( not ( = ?auto_35760 ?auto_35756 ) ) ( not ( = ?auto_35761 ?auto_35756 ) ) ( not ( = ?auto_35759 ?auto_35756 ) ) ( not ( = ?auto_35762 ?auto_35756 ) ) ( not ( = ?auto_35763 ?auto_35756 ) ) ( not ( = ?auto_35758 ?auto_35756 ) ) ( not ( = ?auto_35772 ?auto_35756 ) ) ( not ( = ?auto_35767 ?auto_35756 ) ) ( AVAILABLE ?auto_35765 ) ( IN ?auto_35757 ?auto_35766 ) ( TRUCK-AT ?auto_35766 ?auto_35770 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35759 ?auto_35760 ?auto_35761 )
      ( MAKE-5CRATE-VERIFY ?auto_35756 ?auto_35757 ?auto_35758 ?auto_35759 ?auto_35760 ?auto_35761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35773 - SURFACE
      ?auto_35774 - SURFACE
    )
    :vars
    (
      ?auto_35779 - HOIST
      ?auto_35785 - PLACE
      ?auto_35788 - SURFACE
      ?auto_35784 - PLACE
      ?auto_35777 - HOIST
      ?auto_35775 - SURFACE
      ?auto_35783 - PLACE
      ?auto_35782 - HOIST
      ?auto_35776 - SURFACE
      ?auto_35787 - SURFACE
      ?auto_35789 - SURFACE
      ?auto_35778 - SURFACE
      ?auto_35781 - SURFACE
      ?auto_35786 - SURFACE
      ?auto_35780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35779 ?auto_35785 ) ( IS-CRATE ?auto_35774 ) ( not ( = ?auto_35773 ?auto_35774 ) ) ( not ( = ?auto_35788 ?auto_35773 ) ) ( not ( = ?auto_35788 ?auto_35774 ) ) ( not ( = ?auto_35784 ?auto_35785 ) ) ( HOIST-AT ?auto_35777 ?auto_35784 ) ( not ( = ?auto_35779 ?auto_35777 ) ) ( SURFACE-AT ?auto_35774 ?auto_35784 ) ( ON ?auto_35774 ?auto_35775 ) ( CLEAR ?auto_35774 ) ( not ( = ?auto_35773 ?auto_35775 ) ) ( not ( = ?auto_35774 ?auto_35775 ) ) ( not ( = ?auto_35788 ?auto_35775 ) ) ( IS-CRATE ?auto_35773 ) ( not ( = ?auto_35783 ?auto_35785 ) ) ( not ( = ?auto_35784 ?auto_35783 ) ) ( HOIST-AT ?auto_35782 ?auto_35783 ) ( not ( = ?auto_35779 ?auto_35782 ) ) ( not ( = ?auto_35777 ?auto_35782 ) ) ( AVAILABLE ?auto_35782 ) ( SURFACE-AT ?auto_35773 ?auto_35783 ) ( ON ?auto_35773 ?auto_35776 ) ( CLEAR ?auto_35773 ) ( not ( = ?auto_35773 ?auto_35776 ) ) ( not ( = ?auto_35774 ?auto_35776 ) ) ( not ( = ?auto_35788 ?auto_35776 ) ) ( not ( = ?auto_35775 ?auto_35776 ) ) ( IS-CRATE ?auto_35788 ) ( not ( = ?auto_35787 ?auto_35788 ) ) ( not ( = ?auto_35773 ?auto_35787 ) ) ( not ( = ?auto_35774 ?auto_35787 ) ) ( not ( = ?auto_35775 ?auto_35787 ) ) ( not ( = ?auto_35776 ?auto_35787 ) ) ( SURFACE-AT ?auto_35788 ?auto_35784 ) ( ON ?auto_35788 ?auto_35789 ) ( CLEAR ?auto_35788 ) ( not ( = ?auto_35773 ?auto_35789 ) ) ( not ( = ?auto_35774 ?auto_35789 ) ) ( not ( = ?auto_35788 ?auto_35789 ) ) ( not ( = ?auto_35775 ?auto_35789 ) ) ( not ( = ?auto_35776 ?auto_35789 ) ) ( not ( = ?auto_35787 ?auto_35789 ) ) ( IS-CRATE ?auto_35787 ) ( not ( = ?auto_35778 ?auto_35787 ) ) ( not ( = ?auto_35773 ?auto_35778 ) ) ( not ( = ?auto_35774 ?auto_35778 ) ) ( not ( = ?auto_35788 ?auto_35778 ) ) ( not ( = ?auto_35775 ?auto_35778 ) ) ( not ( = ?auto_35776 ?auto_35778 ) ) ( not ( = ?auto_35789 ?auto_35778 ) ) ( SURFACE-AT ?auto_35787 ?auto_35784 ) ( ON ?auto_35787 ?auto_35781 ) ( CLEAR ?auto_35787 ) ( not ( = ?auto_35773 ?auto_35781 ) ) ( not ( = ?auto_35774 ?auto_35781 ) ) ( not ( = ?auto_35788 ?auto_35781 ) ) ( not ( = ?auto_35775 ?auto_35781 ) ) ( not ( = ?auto_35776 ?auto_35781 ) ) ( not ( = ?auto_35787 ?auto_35781 ) ) ( not ( = ?auto_35789 ?auto_35781 ) ) ( not ( = ?auto_35778 ?auto_35781 ) ) ( SURFACE-AT ?auto_35786 ?auto_35785 ) ( CLEAR ?auto_35786 ) ( IS-CRATE ?auto_35778 ) ( not ( = ?auto_35786 ?auto_35778 ) ) ( not ( = ?auto_35773 ?auto_35786 ) ) ( not ( = ?auto_35774 ?auto_35786 ) ) ( not ( = ?auto_35788 ?auto_35786 ) ) ( not ( = ?auto_35775 ?auto_35786 ) ) ( not ( = ?auto_35776 ?auto_35786 ) ) ( not ( = ?auto_35787 ?auto_35786 ) ) ( not ( = ?auto_35789 ?auto_35786 ) ) ( not ( = ?auto_35781 ?auto_35786 ) ) ( AVAILABLE ?auto_35779 ) ( TRUCK-AT ?auto_35780 ?auto_35784 ) ( LIFTING ?auto_35777 ?auto_35778 ) )
    :subtasks
    ( ( !LOAD ?auto_35777 ?auto_35778 ?auto_35780 ?auto_35784 )
      ( MAKE-2CRATE ?auto_35788 ?auto_35773 ?auto_35774 )
      ( MAKE-1CRATE-VERIFY ?auto_35773 ?auto_35774 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35790 - SURFACE
      ?auto_35791 - SURFACE
      ?auto_35792 - SURFACE
    )
    :vars
    (
      ?auto_35805 - HOIST
      ?auto_35795 - PLACE
      ?auto_35793 - PLACE
      ?auto_35794 - HOIST
      ?auto_35802 - SURFACE
      ?auto_35803 - PLACE
      ?auto_35800 - HOIST
      ?auto_35801 - SURFACE
      ?auto_35799 - SURFACE
      ?auto_35797 - SURFACE
      ?auto_35798 - SURFACE
      ?auto_35804 - SURFACE
      ?auto_35796 - SURFACE
      ?auto_35806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35805 ?auto_35795 ) ( IS-CRATE ?auto_35792 ) ( not ( = ?auto_35791 ?auto_35792 ) ) ( not ( = ?auto_35790 ?auto_35791 ) ) ( not ( = ?auto_35790 ?auto_35792 ) ) ( not ( = ?auto_35793 ?auto_35795 ) ) ( HOIST-AT ?auto_35794 ?auto_35793 ) ( not ( = ?auto_35805 ?auto_35794 ) ) ( SURFACE-AT ?auto_35792 ?auto_35793 ) ( ON ?auto_35792 ?auto_35802 ) ( CLEAR ?auto_35792 ) ( not ( = ?auto_35791 ?auto_35802 ) ) ( not ( = ?auto_35792 ?auto_35802 ) ) ( not ( = ?auto_35790 ?auto_35802 ) ) ( IS-CRATE ?auto_35791 ) ( not ( = ?auto_35803 ?auto_35795 ) ) ( not ( = ?auto_35793 ?auto_35803 ) ) ( HOIST-AT ?auto_35800 ?auto_35803 ) ( not ( = ?auto_35805 ?auto_35800 ) ) ( not ( = ?auto_35794 ?auto_35800 ) ) ( AVAILABLE ?auto_35800 ) ( SURFACE-AT ?auto_35791 ?auto_35803 ) ( ON ?auto_35791 ?auto_35801 ) ( CLEAR ?auto_35791 ) ( not ( = ?auto_35791 ?auto_35801 ) ) ( not ( = ?auto_35792 ?auto_35801 ) ) ( not ( = ?auto_35790 ?auto_35801 ) ) ( not ( = ?auto_35802 ?auto_35801 ) ) ( IS-CRATE ?auto_35790 ) ( not ( = ?auto_35799 ?auto_35790 ) ) ( not ( = ?auto_35791 ?auto_35799 ) ) ( not ( = ?auto_35792 ?auto_35799 ) ) ( not ( = ?auto_35802 ?auto_35799 ) ) ( not ( = ?auto_35801 ?auto_35799 ) ) ( SURFACE-AT ?auto_35790 ?auto_35793 ) ( ON ?auto_35790 ?auto_35797 ) ( CLEAR ?auto_35790 ) ( not ( = ?auto_35791 ?auto_35797 ) ) ( not ( = ?auto_35792 ?auto_35797 ) ) ( not ( = ?auto_35790 ?auto_35797 ) ) ( not ( = ?auto_35802 ?auto_35797 ) ) ( not ( = ?auto_35801 ?auto_35797 ) ) ( not ( = ?auto_35799 ?auto_35797 ) ) ( IS-CRATE ?auto_35799 ) ( not ( = ?auto_35798 ?auto_35799 ) ) ( not ( = ?auto_35791 ?auto_35798 ) ) ( not ( = ?auto_35792 ?auto_35798 ) ) ( not ( = ?auto_35790 ?auto_35798 ) ) ( not ( = ?auto_35802 ?auto_35798 ) ) ( not ( = ?auto_35801 ?auto_35798 ) ) ( not ( = ?auto_35797 ?auto_35798 ) ) ( SURFACE-AT ?auto_35799 ?auto_35793 ) ( ON ?auto_35799 ?auto_35804 ) ( CLEAR ?auto_35799 ) ( not ( = ?auto_35791 ?auto_35804 ) ) ( not ( = ?auto_35792 ?auto_35804 ) ) ( not ( = ?auto_35790 ?auto_35804 ) ) ( not ( = ?auto_35802 ?auto_35804 ) ) ( not ( = ?auto_35801 ?auto_35804 ) ) ( not ( = ?auto_35799 ?auto_35804 ) ) ( not ( = ?auto_35797 ?auto_35804 ) ) ( not ( = ?auto_35798 ?auto_35804 ) ) ( SURFACE-AT ?auto_35796 ?auto_35795 ) ( CLEAR ?auto_35796 ) ( IS-CRATE ?auto_35798 ) ( not ( = ?auto_35796 ?auto_35798 ) ) ( not ( = ?auto_35791 ?auto_35796 ) ) ( not ( = ?auto_35792 ?auto_35796 ) ) ( not ( = ?auto_35790 ?auto_35796 ) ) ( not ( = ?auto_35802 ?auto_35796 ) ) ( not ( = ?auto_35801 ?auto_35796 ) ) ( not ( = ?auto_35799 ?auto_35796 ) ) ( not ( = ?auto_35797 ?auto_35796 ) ) ( not ( = ?auto_35804 ?auto_35796 ) ) ( AVAILABLE ?auto_35805 ) ( TRUCK-AT ?auto_35806 ?auto_35793 ) ( LIFTING ?auto_35794 ?auto_35798 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35791 ?auto_35792 )
      ( MAKE-2CRATE-VERIFY ?auto_35790 ?auto_35791 ?auto_35792 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35807 - SURFACE
      ?auto_35808 - SURFACE
      ?auto_35809 - SURFACE
      ?auto_35810 - SURFACE
    )
    :vars
    (
      ?auto_35823 - HOIST
      ?auto_35814 - PLACE
      ?auto_35820 - PLACE
      ?auto_35812 - HOIST
      ?auto_35819 - SURFACE
      ?auto_35822 - PLACE
      ?auto_35815 - HOIST
      ?auto_35816 - SURFACE
      ?auto_35817 - SURFACE
      ?auto_35821 - SURFACE
      ?auto_35813 - SURFACE
      ?auto_35818 - SURFACE
      ?auto_35811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35823 ?auto_35814 ) ( IS-CRATE ?auto_35810 ) ( not ( = ?auto_35809 ?auto_35810 ) ) ( not ( = ?auto_35808 ?auto_35809 ) ) ( not ( = ?auto_35808 ?auto_35810 ) ) ( not ( = ?auto_35820 ?auto_35814 ) ) ( HOIST-AT ?auto_35812 ?auto_35820 ) ( not ( = ?auto_35823 ?auto_35812 ) ) ( SURFACE-AT ?auto_35810 ?auto_35820 ) ( ON ?auto_35810 ?auto_35819 ) ( CLEAR ?auto_35810 ) ( not ( = ?auto_35809 ?auto_35819 ) ) ( not ( = ?auto_35810 ?auto_35819 ) ) ( not ( = ?auto_35808 ?auto_35819 ) ) ( IS-CRATE ?auto_35809 ) ( not ( = ?auto_35822 ?auto_35814 ) ) ( not ( = ?auto_35820 ?auto_35822 ) ) ( HOIST-AT ?auto_35815 ?auto_35822 ) ( not ( = ?auto_35823 ?auto_35815 ) ) ( not ( = ?auto_35812 ?auto_35815 ) ) ( AVAILABLE ?auto_35815 ) ( SURFACE-AT ?auto_35809 ?auto_35822 ) ( ON ?auto_35809 ?auto_35816 ) ( CLEAR ?auto_35809 ) ( not ( = ?auto_35809 ?auto_35816 ) ) ( not ( = ?auto_35810 ?auto_35816 ) ) ( not ( = ?auto_35808 ?auto_35816 ) ) ( not ( = ?auto_35819 ?auto_35816 ) ) ( IS-CRATE ?auto_35808 ) ( not ( = ?auto_35807 ?auto_35808 ) ) ( not ( = ?auto_35809 ?auto_35807 ) ) ( not ( = ?auto_35810 ?auto_35807 ) ) ( not ( = ?auto_35819 ?auto_35807 ) ) ( not ( = ?auto_35816 ?auto_35807 ) ) ( SURFACE-AT ?auto_35808 ?auto_35820 ) ( ON ?auto_35808 ?auto_35817 ) ( CLEAR ?auto_35808 ) ( not ( = ?auto_35809 ?auto_35817 ) ) ( not ( = ?auto_35810 ?auto_35817 ) ) ( not ( = ?auto_35808 ?auto_35817 ) ) ( not ( = ?auto_35819 ?auto_35817 ) ) ( not ( = ?auto_35816 ?auto_35817 ) ) ( not ( = ?auto_35807 ?auto_35817 ) ) ( IS-CRATE ?auto_35807 ) ( not ( = ?auto_35821 ?auto_35807 ) ) ( not ( = ?auto_35809 ?auto_35821 ) ) ( not ( = ?auto_35810 ?auto_35821 ) ) ( not ( = ?auto_35808 ?auto_35821 ) ) ( not ( = ?auto_35819 ?auto_35821 ) ) ( not ( = ?auto_35816 ?auto_35821 ) ) ( not ( = ?auto_35817 ?auto_35821 ) ) ( SURFACE-AT ?auto_35807 ?auto_35820 ) ( ON ?auto_35807 ?auto_35813 ) ( CLEAR ?auto_35807 ) ( not ( = ?auto_35809 ?auto_35813 ) ) ( not ( = ?auto_35810 ?auto_35813 ) ) ( not ( = ?auto_35808 ?auto_35813 ) ) ( not ( = ?auto_35819 ?auto_35813 ) ) ( not ( = ?auto_35816 ?auto_35813 ) ) ( not ( = ?auto_35807 ?auto_35813 ) ) ( not ( = ?auto_35817 ?auto_35813 ) ) ( not ( = ?auto_35821 ?auto_35813 ) ) ( SURFACE-AT ?auto_35818 ?auto_35814 ) ( CLEAR ?auto_35818 ) ( IS-CRATE ?auto_35821 ) ( not ( = ?auto_35818 ?auto_35821 ) ) ( not ( = ?auto_35809 ?auto_35818 ) ) ( not ( = ?auto_35810 ?auto_35818 ) ) ( not ( = ?auto_35808 ?auto_35818 ) ) ( not ( = ?auto_35819 ?auto_35818 ) ) ( not ( = ?auto_35816 ?auto_35818 ) ) ( not ( = ?auto_35807 ?auto_35818 ) ) ( not ( = ?auto_35817 ?auto_35818 ) ) ( not ( = ?auto_35813 ?auto_35818 ) ) ( AVAILABLE ?auto_35823 ) ( TRUCK-AT ?auto_35811 ?auto_35820 ) ( LIFTING ?auto_35812 ?auto_35821 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35808 ?auto_35809 ?auto_35810 )
      ( MAKE-3CRATE-VERIFY ?auto_35807 ?auto_35808 ?auto_35809 ?auto_35810 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35824 - SURFACE
      ?auto_35825 - SURFACE
      ?auto_35826 - SURFACE
      ?auto_35827 - SURFACE
      ?auto_35828 - SURFACE
    )
    :vars
    (
      ?auto_35840 - HOIST
      ?auto_35832 - PLACE
      ?auto_35838 - PLACE
      ?auto_35830 - HOIST
      ?auto_35837 - SURFACE
      ?auto_35839 - PLACE
      ?auto_35833 - HOIST
      ?auto_35834 - SURFACE
      ?auto_35835 - SURFACE
      ?auto_35831 - SURFACE
      ?auto_35836 - SURFACE
      ?auto_35829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35840 ?auto_35832 ) ( IS-CRATE ?auto_35828 ) ( not ( = ?auto_35827 ?auto_35828 ) ) ( not ( = ?auto_35826 ?auto_35827 ) ) ( not ( = ?auto_35826 ?auto_35828 ) ) ( not ( = ?auto_35838 ?auto_35832 ) ) ( HOIST-AT ?auto_35830 ?auto_35838 ) ( not ( = ?auto_35840 ?auto_35830 ) ) ( SURFACE-AT ?auto_35828 ?auto_35838 ) ( ON ?auto_35828 ?auto_35837 ) ( CLEAR ?auto_35828 ) ( not ( = ?auto_35827 ?auto_35837 ) ) ( not ( = ?auto_35828 ?auto_35837 ) ) ( not ( = ?auto_35826 ?auto_35837 ) ) ( IS-CRATE ?auto_35827 ) ( not ( = ?auto_35839 ?auto_35832 ) ) ( not ( = ?auto_35838 ?auto_35839 ) ) ( HOIST-AT ?auto_35833 ?auto_35839 ) ( not ( = ?auto_35840 ?auto_35833 ) ) ( not ( = ?auto_35830 ?auto_35833 ) ) ( AVAILABLE ?auto_35833 ) ( SURFACE-AT ?auto_35827 ?auto_35839 ) ( ON ?auto_35827 ?auto_35834 ) ( CLEAR ?auto_35827 ) ( not ( = ?auto_35827 ?auto_35834 ) ) ( not ( = ?auto_35828 ?auto_35834 ) ) ( not ( = ?auto_35826 ?auto_35834 ) ) ( not ( = ?auto_35837 ?auto_35834 ) ) ( IS-CRATE ?auto_35826 ) ( not ( = ?auto_35825 ?auto_35826 ) ) ( not ( = ?auto_35827 ?auto_35825 ) ) ( not ( = ?auto_35828 ?auto_35825 ) ) ( not ( = ?auto_35837 ?auto_35825 ) ) ( not ( = ?auto_35834 ?auto_35825 ) ) ( SURFACE-AT ?auto_35826 ?auto_35838 ) ( ON ?auto_35826 ?auto_35835 ) ( CLEAR ?auto_35826 ) ( not ( = ?auto_35827 ?auto_35835 ) ) ( not ( = ?auto_35828 ?auto_35835 ) ) ( not ( = ?auto_35826 ?auto_35835 ) ) ( not ( = ?auto_35837 ?auto_35835 ) ) ( not ( = ?auto_35834 ?auto_35835 ) ) ( not ( = ?auto_35825 ?auto_35835 ) ) ( IS-CRATE ?auto_35825 ) ( not ( = ?auto_35824 ?auto_35825 ) ) ( not ( = ?auto_35827 ?auto_35824 ) ) ( not ( = ?auto_35828 ?auto_35824 ) ) ( not ( = ?auto_35826 ?auto_35824 ) ) ( not ( = ?auto_35837 ?auto_35824 ) ) ( not ( = ?auto_35834 ?auto_35824 ) ) ( not ( = ?auto_35835 ?auto_35824 ) ) ( SURFACE-AT ?auto_35825 ?auto_35838 ) ( ON ?auto_35825 ?auto_35831 ) ( CLEAR ?auto_35825 ) ( not ( = ?auto_35827 ?auto_35831 ) ) ( not ( = ?auto_35828 ?auto_35831 ) ) ( not ( = ?auto_35826 ?auto_35831 ) ) ( not ( = ?auto_35837 ?auto_35831 ) ) ( not ( = ?auto_35834 ?auto_35831 ) ) ( not ( = ?auto_35825 ?auto_35831 ) ) ( not ( = ?auto_35835 ?auto_35831 ) ) ( not ( = ?auto_35824 ?auto_35831 ) ) ( SURFACE-AT ?auto_35836 ?auto_35832 ) ( CLEAR ?auto_35836 ) ( IS-CRATE ?auto_35824 ) ( not ( = ?auto_35836 ?auto_35824 ) ) ( not ( = ?auto_35827 ?auto_35836 ) ) ( not ( = ?auto_35828 ?auto_35836 ) ) ( not ( = ?auto_35826 ?auto_35836 ) ) ( not ( = ?auto_35837 ?auto_35836 ) ) ( not ( = ?auto_35834 ?auto_35836 ) ) ( not ( = ?auto_35825 ?auto_35836 ) ) ( not ( = ?auto_35835 ?auto_35836 ) ) ( not ( = ?auto_35831 ?auto_35836 ) ) ( AVAILABLE ?auto_35840 ) ( TRUCK-AT ?auto_35829 ?auto_35838 ) ( LIFTING ?auto_35830 ?auto_35824 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35826 ?auto_35827 ?auto_35828 )
      ( MAKE-4CRATE-VERIFY ?auto_35824 ?auto_35825 ?auto_35826 ?auto_35827 ?auto_35828 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35841 - SURFACE
      ?auto_35842 - SURFACE
      ?auto_35843 - SURFACE
      ?auto_35844 - SURFACE
      ?auto_35845 - SURFACE
      ?auto_35846 - SURFACE
    )
    :vars
    (
      ?auto_35857 - HOIST
      ?auto_35850 - PLACE
      ?auto_35855 - PLACE
      ?auto_35848 - HOIST
      ?auto_35854 - SURFACE
      ?auto_35856 - PLACE
      ?auto_35851 - HOIST
      ?auto_35852 - SURFACE
      ?auto_35853 - SURFACE
      ?auto_35849 - SURFACE
      ?auto_35847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35857 ?auto_35850 ) ( IS-CRATE ?auto_35846 ) ( not ( = ?auto_35845 ?auto_35846 ) ) ( not ( = ?auto_35844 ?auto_35845 ) ) ( not ( = ?auto_35844 ?auto_35846 ) ) ( not ( = ?auto_35855 ?auto_35850 ) ) ( HOIST-AT ?auto_35848 ?auto_35855 ) ( not ( = ?auto_35857 ?auto_35848 ) ) ( SURFACE-AT ?auto_35846 ?auto_35855 ) ( ON ?auto_35846 ?auto_35854 ) ( CLEAR ?auto_35846 ) ( not ( = ?auto_35845 ?auto_35854 ) ) ( not ( = ?auto_35846 ?auto_35854 ) ) ( not ( = ?auto_35844 ?auto_35854 ) ) ( IS-CRATE ?auto_35845 ) ( not ( = ?auto_35856 ?auto_35850 ) ) ( not ( = ?auto_35855 ?auto_35856 ) ) ( HOIST-AT ?auto_35851 ?auto_35856 ) ( not ( = ?auto_35857 ?auto_35851 ) ) ( not ( = ?auto_35848 ?auto_35851 ) ) ( AVAILABLE ?auto_35851 ) ( SURFACE-AT ?auto_35845 ?auto_35856 ) ( ON ?auto_35845 ?auto_35852 ) ( CLEAR ?auto_35845 ) ( not ( = ?auto_35845 ?auto_35852 ) ) ( not ( = ?auto_35846 ?auto_35852 ) ) ( not ( = ?auto_35844 ?auto_35852 ) ) ( not ( = ?auto_35854 ?auto_35852 ) ) ( IS-CRATE ?auto_35844 ) ( not ( = ?auto_35843 ?auto_35844 ) ) ( not ( = ?auto_35845 ?auto_35843 ) ) ( not ( = ?auto_35846 ?auto_35843 ) ) ( not ( = ?auto_35854 ?auto_35843 ) ) ( not ( = ?auto_35852 ?auto_35843 ) ) ( SURFACE-AT ?auto_35844 ?auto_35855 ) ( ON ?auto_35844 ?auto_35853 ) ( CLEAR ?auto_35844 ) ( not ( = ?auto_35845 ?auto_35853 ) ) ( not ( = ?auto_35846 ?auto_35853 ) ) ( not ( = ?auto_35844 ?auto_35853 ) ) ( not ( = ?auto_35854 ?auto_35853 ) ) ( not ( = ?auto_35852 ?auto_35853 ) ) ( not ( = ?auto_35843 ?auto_35853 ) ) ( IS-CRATE ?auto_35843 ) ( not ( = ?auto_35842 ?auto_35843 ) ) ( not ( = ?auto_35845 ?auto_35842 ) ) ( not ( = ?auto_35846 ?auto_35842 ) ) ( not ( = ?auto_35844 ?auto_35842 ) ) ( not ( = ?auto_35854 ?auto_35842 ) ) ( not ( = ?auto_35852 ?auto_35842 ) ) ( not ( = ?auto_35853 ?auto_35842 ) ) ( SURFACE-AT ?auto_35843 ?auto_35855 ) ( ON ?auto_35843 ?auto_35849 ) ( CLEAR ?auto_35843 ) ( not ( = ?auto_35845 ?auto_35849 ) ) ( not ( = ?auto_35846 ?auto_35849 ) ) ( not ( = ?auto_35844 ?auto_35849 ) ) ( not ( = ?auto_35854 ?auto_35849 ) ) ( not ( = ?auto_35852 ?auto_35849 ) ) ( not ( = ?auto_35843 ?auto_35849 ) ) ( not ( = ?auto_35853 ?auto_35849 ) ) ( not ( = ?auto_35842 ?auto_35849 ) ) ( SURFACE-AT ?auto_35841 ?auto_35850 ) ( CLEAR ?auto_35841 ) ( IS-CRATE ?auto_35842 ) ( not ( = ?auto_35841 ?auto_35842 ) ) ( not ( = ?auto_35845 ?auto_35841 ) ) ( not ( = ?auto_35846 ?auto_35841 ) ) ( not ( = ?auto_35844 ?auto_35841 ) ) ( not ( = ?auto_35854 ?auto_35841 ) ) ( not ( = ?auto_35852 ?auto_35841 ) ) ( not ( = ?auto_35843 ?auto_35841 ) ) ( not ( = ?auto_35853 ?auto_35841 ) ) ( not ( = ?auto_35849 ?auto_35841 ) ) ( AVAILABLE ?auto_35857 ) ( TRUCK-AT ?auto_35847 ?auto_35855 ) ( LIFTING ?auto_35848 ?auto_35842 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35844 ?auto_35845 ?auto_35846 )
      ( MAKE-5CRATE-VERIFY ?auto_35841 ?auto_35842 ?auto_35843 ?auto_35844 ?auto_35845 ?auto_35846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35858 - SURFACE
      ?auto_35859 - SURFACE
    )
    :vars
    (
      ?auto_35874 - HOIST
      ?auto_35863 - PLACE
      ?auto_35873 - SURFACE
      ?auto_35870 - PLACE
      ?auto_35861 - HOIST
      ?auto_35869 - SURFACE
      ?auto_35872 - PLACE
      ?auto_35865 - HOIST
      ?auto_35866 - SURFACE
      ?auto_35864 - SURFACE
      ?auto_35867 - SURFACE
      ?auto_35871 - SURFACE
      ?auto_35862 - SURFACE
      ?auto_35868 - SURFACE
      ?auto_35860 - TRUCK
      ?auto_35875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35874 ?auto_35863 ) ( IS-CRATE ?auto_35859 ) ( not ( = ?auto_35858 ?auto_35859 ) ) ( not ( = ?auto_35873 ?auto_35858 ) ) ( not ( = ?auto_35873 ?auto_35859 ) ) ( not ( = ?auto_35870 ?auto_35863 ) ) ( HOIST-AT ?auto_35861 ?auto_35870 ) ( not ( = ?auto_35874 ?auto_35861 ) ) ( SURFACE-AT ?auto_35859 ?auto_35870 ) ( ON ?auto_35859 ?auto_35869 ) ( CLEAR ?auto_35859 ) ( not ( = ?auto_35858 ?auto_35869 ) ) ( not ( = ?auto_35859 ?auto_35869 ) ) ( not ( = ?auto_35873 ?auto_35869 ) ) ( IS-CRATE ?auto_35858 ) ( not ( = ?auto_35872 ?auto_35863 ) ) ( not ( = ?auto_35870 ?auto_35872 ) ) ( HOIST-AT ?auto_35865 ?auto_35872 ) ( not ( = ?auto_35874 ?auto_35865 ) ) ( not ( = ?auto_35861 ?auto_35865 ) ) ( AVAILABLE ?auto_35865 ) ( SURFACE-AT ?auto_35858 ?auto_35872 ) ( ON ?auto_35858 ?auto_35866 ) ( CLEAR ?auto_35858 ) ( not ( = ?auto_35858 ?auto_35866 ) ) ( not ( = ?auto_35859 ?auto_35866 ) ) ( not ( = ?auto_35873 ?auto_35866 ) ) ( not ( = ?auto_35869 ?auto_35866 ) ) ( IS-CRATE ?auto_35873 ) ( not ( = ?auto_35864 ?auto_35873 ) ) ( not ( = ?auto_35858 ?auto_35864 ) ) ( not ( = ?auto_35859 ?auto_35864 ) ) ( not ( = ?auto_35869 ?auto_35864 ) ) ( not ( = ?auto_35866 ?auto_35864 ) ) ( SURFACE-AT ?auto_35873 ?auto_35870 ) ( ON ?auto_35873 ?auto_35867 ) ( CLEAR ?auto_35873 ) ( not ( = ?auto_35858 ?auto_35867 ) ) ( not ( = ?auto_35859 ?auto_35867 ) ) ( not ( = ?auto_35873 ?auto_35867 ) ) ( not ( = ?auto_35869 ?auto_35867 ) ) ( not ( = ?auto_35866 ?auto_35867 ) ) ( not ( = ?auto_35864 ?auto_35867 ) ) ( IS-CRATE ?auto_35864 ) ( not ( = ?auto_35871 ?auto_35864 ) ) ( not ( = ?auto_35858 ?auto_35871 ) ) ( not ( = ?auto_35859 ?auto_35871 ) ) ( not ( = ?auto_35873 ?auto_35871 ) ) ( not ( = ?auto_35869 ?auto_35871 ) ) ( not ( = ?auto_35866 ?auto_35871 ) ) ( not ( = ?auto_35867 ?auto_35871 ) ) ( SURFACE-AT ?auto_35864 ?auto_35870 ) ( ON ?auto_35864 ?auto_35862 ) ( CLEAR ?auto_35864 ) ( not ( = ?auto_35858 ?auto_35862 ) ) ( not ( = ?auto_35859 ?auto_35862 ) ) ( not ( = ?auto_35873 ?auto_35862 ) ) ( not ( = ?auto_35869 ?auto_35862 ) ) ( not ( = ?auto_35866 ?auto_35862 ) ) ( not ( = ?auto_35864 ?auto_35862 ) ) ( not ( = ?auto_35867 ?auto_35862 ) ) ( not ( = ?auto_35871 ?auto_35862 ) ) ( SURFACE-AT ?auto_35868 ?auto_35863 ) ( CLEAR ?auto_35868 ) ( IS-CRATE ?auto_35871 ) ( not ( = ?auto_35868 ?auto_35871 ) ) ( not ( = ?auto_35858 ?auto_35868 ) ) ( not ( = ?auto_35859 ?auto_35868 ) ) ( not ( = ?auto_35873 ?auto_35868 ) ) ( not ( = ?auto_35869 ?auto_35868 ) ) ( not ( = ?auto_35866 ?auto_35868 ) ) ( not ( = ?auto_35864 ?auto_35868 ) ) ( not ( = ?auto_35867 ?auto_35868 ) ) ( not ( = ?auto_35862 ?auto_35868 ) ) ( AVAILABLE ?auto_35874 ) ( TRUCK-AT ?auto_35860 ?auto_35870 ) ( AVAILABLE ?auto_35861 ) ( SURFACE-AT ?auto_35871 ?auto_35870 ) ( ON ?auto_35871 ?auto_35875 ) ( CLEAR ?auto_35871 ) ( not ( = ?auto_35858 ?auto_35875 ) ) ( not ( = ?auto_35859 ?auto_35875 ) ) ( not ( = ?auto_35873 ?auto_35875 ) ) ( not ( = ?auto_35869 ?auto_35875 ) ) ( not ( = ?auto_35866 ?auto_35875 ) ) ( not ( = ?auto_35864 ?auto_35875 ) ) ( not ( = ?auto_35867 ?auto_35875 ) ) ( not ( = ?auto_35871 ?auto_35875 ) ) ( not ( = ?auto_35862 ?auto_35875 ) ) ( not ( = ?auto_35868 ?auto_35875 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35861 ?auto_35871 ?auto_35875 ?auto_35870 )
      ( MAKE-2CRATE ?auto_35873 ?auto_35858 ?auto_35859 )
      ( MAKE-1CRATE-VERIFY ?auto_35858 ?auto_35859 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35876 - SURFACE
      ?auto_35877 - SURFACE
      ?auto_35878 - SURFACE
    )
    :vars
    (
      ?auto_35884 - HOIST
      ?auto_35891 - PLACE
      ?auto_35890 - PLACE
      ?auto_35886 - HOIST
      ?auto_35879 - SURFACE
      ?auto_35880 - PLACE
      ?auto_35883 - HOIST
      ?auto_35889 - SURFACE
      ?auto_35885 - SURFACE
      ?auto_35887 - SURFACE
      ?auto_35882 - SURFACE
      ?auto_35888 - SURFACE
      ?auto_35881 - SURFACE
      ?auto_35892 - TRUCK
      ?auto_35893 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35884 ?auto_35891 ) ( IS-CRATE ?auto_35878 ) ( not ( = ?auto_35877 ?auto_35878 ) ) ( not ( = ?auto_35876 ?auto_35877 ) ) ( not ( = ?auto_35876 ?auto_35878 ) ) ( not ( = ?auto_35890 ?auto_35891 ) ) ( HOIST-AT ?auto_35886 ?auto_35890 ) ( not ( = ?auto_35884 ?auto_35886 ) ) ( SURFACE-AT ?auto_35878 ?auto_35890 ) ( ON ?auto_35878 ?auto_35879 ) ( CLEAR ?auto_35878 ) ( not ( = ?auto_35877 ?auto_35879 ) ) ( not ( = ?auto_35878 ?auto_35879 ) ) ( not ( = ?auto_35876 ?auto_35879 ) ) ( IS-CRATE ?auto_35877 ) ( not ( = ?auto_35880 ?auto_35891 ) ) ( not ( = ?auto_35890 ?auto_35880 ) ) ( HOIST-AT ?auto_35883 ?auto_35880 ) ( not ( = ?auto_35884 ?auto_35883 ) ) ( not ( = ?auto_35886 ?auto_35883 ) ) ( AVAILABLE ?auto_35883 ) ( SURFACE-AT ?auto_35877 ?auto_35880 ) ( ON ?auto_35877 ?auto_35889 ) ( CLEAR ?auto_35877 ) ( not ( = ?auto_35877 ?auto_35889 ) ) ( not ( = ?auto_35878 ?auto_35889 ) ) ( not ( = ?auto_35876 ?auto_35889 ) ) ( not ( = ?auto_35879 ?auto_35889 ) ) ( IS-CRATE ?auto_35876 ) ( not ( = ?auto_35885 ?auto_35876 ) ) ( not ( = ?auto_35877 ?auto_35885 ) ) ( not ( = ?auto_35878 ?auto_35885 ) ) ( not ( = ?auto_35879 ?auto_35885 ) ) ( not ( = ?auto_35889 ?auto_35885 ) ) ( SURFACE-AT ?auto_35876 ?auto_35890 ) ( ON ?auto_35876 ?auto_35887 ) ( CLEAR ?auto_35876 ) ( not ( = ?auto_35877 ?auto_35887 ) ) ( not ( = ?auto_35878 ?auto_35887 ) ) ( not ( = ?auto_35876 ?auto_35887 ) ) ( not ( = ?auto_35879 ?auto_35887 ) ) ( not ( = ?auto_35889 ?auto_35887 ) ) ( not ( = ?auto_35885 ?auto_35887 ) ) ( IS-CRATE ?auto_35885 ) ( not ( = ?auto_35882 ?auto_35885 ) ) ( not ( = ?auto_35877 ?auto_35882 ) ) ( not ( = ?auto_35878 ?auto_35882 ) ) ( not ( = ?auto_35876 ?auto_35882 ) ) ( not ( = ?auto_35879 ?auto_35882 ) ) ( not ( = ?auto_35889 ?auto_35882 ) ) ( not ( = ?auto_35887 ?auto_35882 ) ) ( SURFACE-AT ?auto_35885 ?auto_35890 ) ( ON ?auto_35885 ?auto_35888 ) ( CLEAR ?auto_35885 ) ( not ( = ?auto_35877 ?auto_35888 ) ) ( not ( = ?auto_35878 ?auto_35888 ) ) ( not ( = ?auto_35876 ?auto_35888 ) ) ( not ( = ?auto_35879 ?auto_35888 ) ) ( not ( = ?auto_35889 ?auto_35888 ) ) ( not ( = ?auto_35885 ?auto_35888 ) ) ( not ( = ?auto_35887 ?auto_35888 ) ) ( not ( = ?auto_35882 ?auto_35888 ) ) ( SURFACE-AT ?auto_35881 ?auto_35891 ) ( CLEAR ?auto_35881 ) ( IS-CRATE ?auto_35882 ) ( not ( = ?auto_35881 ?auto_35882 ) ) ( not ( = ?auto_35877 ?auto_35881 ) ) ( not ( = ?auto_35878 ?auto_35881 ) ) ( not ( = ?auto_35876 ?auto_35881 ) ) ( not ( = ?auto_35879 ?auto_35881 ) ) ( not ( = ?auto_35889 ?auto_35881 ) ) ( not ( = ?auto_35885 ?auto_35881 ) ) ( not ( = ?auto_35887 ?auto_35881 ) ) ( not ( = ?auto_35888 ?auto_35881 ) ) ( AVAILABLE ?auto_35884 ) ( TRUCK-AT ?auto_35892 ?auto_35890 ) ( AVAILABLE ?auto_35886 ) ( SURFACE-AT ?auto_35882 ?auto_35890 ) ( ON ?auto_35882 ?auto_35893 ) ( CLEAR ?auto_35882 ) ( not ( = ?auto_35877 ?auto_35893 ) ) ( not ( = ?auto_35878 ?auto_35893 ) ) ( not ( = ?auto_35876 ?auto_35893 ) ) ( not ( = ?auto_35879 ?auto_35893 ) ) ( not ( = ?auto_35889 ?auto_35893 ) ) ( not ( = ?auto_35885 ?auto_35893 ) ) ( not ( = ?auto_35887 ?auto_35893 ) ) ( not ( = ?auto_35882 ?auto_35893 ) ) ( not ( = ?auto_35888 ?auto_35893 ) ) ( not ( = ?auto_35881 ?auto_35893 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35877 ?auto_35878 )
      ( MAKE-2CRATE-VERIFY ?auto_35876 ?auto_35877 ?auto_35878 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35894 - SURFACE
      ?auto_35895 - SURFACE
      ?auto_35896 - SURFACE
      ?auto_35897 - SURFACE
    )
    :vars
    (
      ?auto_35899 - HOIST
      ?auto_35906 - PLACE
      ?auto_35905 - PLACE
      ?auto_35911 - HOIST
      ?auto_35900 - SURFACE
      ?auto_35903 - PLACE
      ?auto_35901 - HOIST
      ?auto_35902 - SURFACE
      ?auto_35907 - SURFACE
      ?auto_35909 - SURFACE
      ?auto_35908 - SURFACE
      ?auto_35898 - SURFACE
      ?auto_35904 - TRUCK
      ?auto_35910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35899 ?auto_35906 ) ( IS-CRATE ?auto_35897 ) ( not ( = ?auto_35896 ?auto_35897 ) ) ( not ( = ?auto_35895 ?auto_35896 ) ) ( not ( = ?auto_35895 ?auto_35897 ) ) ( not ( = ?auto_35905 ?auto_35906 ) ) ( HOIST-AT ?auto_35911 ?auto_35905 ) ( not ( = ?auto_35899 ?auto_35911 ) ) ( SURFACE-AT ?auto_35897 ?auto_35905 ) ( ON ?auto_35897 ?auto_35900 ) ( CLEAR ?auto_35897 ) ( not ( = ?auto_35896 ?auto_35900 ) ) ( not ( = ?auto_35897 ?auto_35900 ) ) ( not ( = ?auto_35895 ?auto_35900 ) ) ( IS-CRATE ?auto_35896 ) ( not ( = ?auto_35903 ?auto_35906 ) ) ( not ( = ?auto_35905 ?auto_35903 ) ) ( HOIST-AT ?auto_35901 ?auto_35903 ) ( not ( = ?auto_35899 ?auto_35901 ) ) ( not ( = ?auto_35911 ?auto_35901 ) ) ( AVAILABLE ?auto_35901 ) ( SURFACE-AT ?auto_35896 ?auto_35903 ) ( ON ?auto_35896 ?auto_35902 ) ( CLEAR ?auto_35896 ) ( not ( = ?auto_35896 ?auto_35902 ) ) ( not ( = ?auto_35897 ?auto_35902 ) ) ( not ( = ?auto_35895 ?auto_35902 ) ) ( not ( = ?auto_35900 ?auto_35902 ) ) ( IS-CRATE ?auto_35895 ) ( not ( = ?auto_35894 ?auto_35895 ) ) ( not ( = ?auto_35896 ?auto_35894 ) ) ( not ( = ?auto_35897 ?auto_35894 ) ) ( not ( = ?auto_35900 ?auto_35894 ) ) ( not ( = ?auto_35902 ?auto_35894 ) ) ( SURFACE-AT ?auto_35895 ?auto_35905 ) ( ON ?auto_35895 ?auto_35907 ) ( CLEAR ?auto_35895 ) ( not ( = ?auto_35896 ?auto_35907 ) ) ( not ( = ?auto_35897 ?auto_35907 ) ) ( not ( = ?auto_35895 ?auto_35907 ) ) ( not ( = ?auto_35900 ?auto_35907 ) ) ( not ( = ?auto_35902 ?auto_35907 ) ) ( not ( = ?auto_35894 ?auto_35907 ) ) ( IS-CRATE ?auto_35894 ) ( not ( = ?auto_35909 ?auto_35894 ) ) ( not ( = ?auto_35896 ?auto_35909 ) ) ( not ( = ?auto_35897 ?auto_35909 ) ) ( not ( = ?auto_35895 ?auto_35909 ) ) ( not ( = ?auto_35900 ?auto_35909 ) ) ( not ( = ?auto_35902 ?auto_35909 ) ) ( not ( = ?auto_35907 ?auto_35909 ) ) ( SURFACE-AT ?auto_35894 ?auto_35905 ) ( ON ?auto_35894 ?auto_35908 ) ( CLEAR ?auto_35894 ) ( not ( = ?auto_35896 ?auto_35908 ) ) ( not ( = ?auto_35897 ?auto_35908 ) ) ( not ( = ?auto_35895 ?auto_35908 ) ) ( not ( = ?auto_35900 ?auto_35908 ) ) ( not ( = ?auto_35902 ?auto_35908 ) ) ( not ( = ?auto_35894 ?auto_35908 ) ) ( not ( = ?auto_35907 ?auto_35908 ) ) ( not ( = ?auto_35909 ?auto_35908 ) ) ( SURFACE-AT ?auto_35898 ?auto_35906 ) ( CLEAR ?auto_35898 ) ( IS-CRATE ?auto_35909 ) ( not ( = ?auto_35898 ?auto_35909 ) ) ( not ( = ?auto_35896 ?auto_35898 ) ) ( not ( = ?auto_35897 ?auto_35898 ) ) ( not ( = ?auto_35895 ?auto_35898 ) ) ( not ( = ?auto_35900 ?auto_35898 ) ) ( not ( = ?auto_35902 ?auto_35898 ) ) ( not ( = ?auto_35894 ?auto_35898 ) ) ( not ( = ?auto_35907 ?auto_35898 ) ) ( not ( = ?auto_35908 ?auto_35898 ) ) ( AVAILABLE ?auto_35899 ) ( TRUCK-AT ?auto_35904 ?auto_35905 ) ( AVAILABLE ?auto_35911 ) ( SURFACE-AT ?auto_35909 ?auto_35905 ) ( ON ?auto_35909 ?auto_35910 ) ( CLEAR ?auto_35909 ) ( not ( = ?auto_35896 ?auto_35910 ) ) ( not ( = ?auto_35897 ?auto_35910 ) ) ( not ( = ?auto_35895 ?auto_35910 ) ) ( not ( = ?auto_35900 ?auto_35910 ) ) ( not ( = ?auto_35902 ?auto_35910 ) ) ( not ( = ?auto_35894 ?auto_35910 ) ) ( not ( = ?auto_35907 ?auto_35910 ) ) ( not ( = ?auto_35909 ?auto_35910 ) ) ( not ( = ?auto_35908 ?auto_35910 ) ) ( not ( = ?auto_35898 ?auto_35910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35895 ?auto_35896 ?auto_35897 )
      ( MAKE-3CRATE-VERIFY ?auto_35894 ?auto_35895 ?auto_35896 ?auto_35897 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35912 - SURFACE
      ?auto_35913 - SURFACE
      ?auto_35914 - SURFACE
      ?auto_35915 - SURFACE
      ?auto_35916 - SURFACE
    )
    :vars
    (
      ?auto_35918 - HOIST
      ?auto_35925 - PLACE
      ?auto_35924 - PLACE
      ?auto_35929 - HOIST
      ?auto_35919 - SURFACE
      ?auto_35922 - PLACE
      ?auto_35920 - HOIST
      ?auto_35921 - SURFACE
      ?auto_35926 - SURFACE
      ?auto_35927 - SURFACE
      ?auto_35917 - SURFACE
      ?auto_35923 - TRUCK
      ?auto_35928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35918 ?auto_35925 ) ( IS-CRATE ?auto_35916 ) ( not ( = ?auto_35915 ?auto_35916 ) ) ( not ( = ?auto_35914 ?auto_35915 ) ) ( not ( = ?auto_35914 ?auto_35916 ) ) ( not ( = ?auto_35924 ?auto_35925 ) ) ( HOIST-AT ?auto_35929 ?auto_35924 ) ( not ( = ?auto_35918 ?auto_35929 ) ) ( SURFACE-AT ?auto_35916 ?auto_35924 ) ( ON ?auto_35916 ?auto_35919 ) ( CLEAR ?auto_35916 ) ( not ( = ?auto_35915 ?auto_35919 ) ) ( not ( = ?auto_35916 ?auto_35919 ) ) ( not ( = ?auto_35914 ?auto_35919 ) ) ( IS-CRATE ?auto_35915 ) ( not ( = ?auto_35922 ?auto_35925 ) ) ( not ( = ?auto_35924 ?auto_35922 ) ) ( HOIST-AT ?auto_35920 ?auto_35922 ) ( not ( = ?auto_35918 ?auto_35920 ) ) ( not ( = ?auto_35929 ?auto_35920 ) ) ( AVAILABLE ?auto_35920 ) ( SURFACE-AT ?auto_35915 ?auto_35922 ) ( ON ?auto_35915 ?auto_35921 ) ( CLEAR ?auto_35915 ) ( not ( = ?auto_35915 ?auto_35921 ) ) ( not ( = ?auto_35916 ?auto_35921 ) ) ( not ( = ?auto_35914 ?auto_35921 ) ) ( not ( = ?auto_35919 ?auto_35921 ) ) ( IS-CRATE ?auto_35914 ) ( not ( = ?auto_35913 ?auto_35914 ) ) ( not ( = ?auto_35915 ?auto_35913 ) ) ( not ( = ?auto_35916 ?auto_35913 ) ) ( not ( = ?auto_35919 ?auto_35913 ) ) ( not ( = ?auto_35921 ?auto_35913 ) ) ( SURFACE-AT ?auto_35914 ?auto_35924 ) ( ON ?auto_35914 ?auto_35926 ) ( CLEAR ?auto_35914 ) ( not ( = ?auto_35915 ?auto_35926 ) ) ( not ( = ?auto_35916 ?auto_35926 ) ) ( not ( = ?auto_35914 ?auto_35926 ) ) ( not ( = ?auto_35919 ?auto_35926 ) ) ( not ( = ?auto_35921 ?auto_35926 ) ) ( not ( = ?auto_35913 ?auto_35926 ) ) ( IS-CRATE ?auto_35913 ) ( not ( = ?auto_35912 ?auto_35913 ) ) ( not ( = ?auto_35915 ?auto_35912 ) ) ( not ( = ?auto_35916 ?auto_35912 ) ) ( not ( = ?auto_35914 ?auto_35912 ) ) ( not ( = ?auto_35919 ?auto_35912 ) ) ( not ( = ?auto_35921 ?auto_35912 ) ) ( not ( = ?auto_35926 ?auto_35912 ) ) ( SURFACE-AT ?auto_35913 ?auto_35924 ) ( ON ?auto_35913 ?auto_35927 ) ( CLEAR ?auto_35913 ) ( not ( = ?auto_35915 ?auto_35927 ) ) ( not ( = ?auto_35916 ?auto_35927 ) ) ( not ( = ?auto_35914 ?auto_35927 ) ) ( not ( = ?auto_35919 ?auto_35927 ) ) ( not ( = ?auto_35921 ?auto_35927 ) ) ( not ( = ?auto_35913 ?auto_35927 ) ) ( not ( = ?auto_35926 ?auto_35927 ) ) ( not ( = ?auto_35912 ?auto_35927 ) ) ( SURFACE-AT ?auto_35917 ?auto_35925 ) ( CLEAR ?auto_35917 ) ( IS-CRATE ?auto_35912 ) ( not ( = ?auto_35917 ?auto_35912 ) ) ( not ( = ?auto_35915 ?auto_35917 ) ) ( not ( = ?auto_35916 ?auto_35917 ) ) ( not ( = ?auto_35914 ?auto_35917 ) ) ( not ( = ?auto_35919 ?auto_35917 ) ) ( not ( = ?auto_35921 ?auto_35917 ) ) ( not ( = ?auto_35913 ?auto_35917 ) ) ( not ( = ?auto_35926 ?auto_35917 ) ) ( not ( = ?auto_35927 ?auto_35917 ) ) ( AVAILABLE ?auto_35918 ) ( TRUCK-AT ?auto_35923 ?auto_35924 ) ( AVAILABLE ?auto_35929 ) ( SURFACE-AT ?auto_35912 ?auto_35924 ) ( ON ?auto_35912 ?auto_35928 ) ( CLEAR ?auto_35912 ) ( not ( = ?auto_35915 ?auto_35928 ) ) ( not ( = ?auto_35916 ?auto_35928 ) ) ( not ( = ?auto_35914 ?auto_35928 ) ) ( not ( = ?auto_35919 ?auto_35928 ) ) ( not ( = ?auto_35921 ?auto_35928 ) ) ( not ( = ?auto_35913 ?auto_35928 ) ) ( not ( = ?auto_35926 ?auto_35928 ) ) ( not ( = ?auto_35912 ?auto_35928 ) ) ( not ( = ?auto_35927 ?auto_35928 ) ) ( not ( = ?auto_35917 ?auto_35928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35914 ?auto_35915 ?auto_35916 )
      ( MAKE-4CRATE-VERIFY ?auto_35912 ?auto_35913 ?auto_35914 ?auto_35915 ?auto_35916 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35930 - SURFACE
      ?auto_35931 - SURFACE
      ?auto_35932 - SURFACE
      ?auto_35933 - SURFACE
      ?auto_35934 - SURFACE
      ?auto_35935 - SURFACE
    )
    :vars
    (
      ?auto_35936 - HOIST
      ?auto_35943 - PLACE
      ?auto_35942 - PLACE
      ?auto_35947 - HOIST
      ?auto_35937 - SURFACE
      ?auto_35940 - PLACE
      ?auto_35938 - HOIST
      ?auto_35939 - SURFACE
      ?auto_35944 - SURFACE
      ?auto_35945 - SURFACE
      ?auto_35941 - TRUCK
      ?auto_35946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35936 ?auto_35943 ) ( IS-CRATE ?auto_35935 ) ( not ( = ?auto_35934 ?auto_35935 ) ) ( not ( = ?auto_35933 ?auto_35934 ) ) ( not ( = ?auto_35933 ?auto_35935 ) ) ( not ( = ?auto_35942 ?auto_35943 ) ) ( HOIST-AT ?auto_35947 ?auto_35942 ) ( not ( = ?auto_35936 ?auto_35947 ) ) ( SURFACE-AT ?auto_35935 ?auto_35942 ) ( ON ?auto_35935 ?auto_35937 ) ( CLEAR ?auto_35935 ) ( not ( = ?auto_35934 ?auto_35937 ) ) ( not ( = ?auto_35935 ?auto_35937 ) ) ( not ( = ?auto_35933 ?auto_35937 ) ) ( IS-CRATE ?auto_35934 ) ( not ( = ?auto_35940 ?auto_35943 ) ) ( not ( = ?auto_35942 ?auto_35940 ) ) ( HOIST-AT ?auto_35938 ?auto_35940 ) ( not ( = ?auto_35936 ?auto_35938 ) ) ( not ( = ?auto_35947 ?auto_35938 ) ) ( AVAILABLE ?auto_35938 ) ( SURFACE-AT ?auto_35934 ?auto_35940 ) ( ON ?auto_35934 ?auto_35939 ) ( CLEAR ?auto_35934 ) ( not ( = ?auto_35934 ?auto_35939 ) ) ( not ( = ?auto_35935 ?auto_35939 ) ) ( not ( = ?auto_35933 ?auto_35939 ) ) ( not ( = ?auto_35937 ?auto_35939 ) ) ( IS-CRATE ?auto_35933 ) ( not ( = ?auto_35932 ?auto_35933 ) ) ( not ( = ?auto_35934 ?auto_35932 ) ) ( not ( = ?auto_35935 ?auto_35932 ) ) ( not ( = ?auto_35937 ?auto_35932 ) ) ( not ( = ?auto_35939 ?auto_35932 ) ) ( SURFACE-AT ?auto_35933 ?auto_35942 ) ( ON ?auto_35933 ?auto_35944 ) ( CLEAR ?auto_35933 ) ( not ( = ?auto_35934 ?auto_35944 ) ) ( not ( = ?auto_35935 ?auto_35944 ) ) ( not ( = ?auto_35933 ?auto_35944 ) ) ( not ( = ?auto_35937 ?auto_35944 ) ) ( not ( = ?auto_35939 ?auto_35944 ) ) ( not ( = ?auto_35932 ?auto_35944 ) ) ( IS-CRATE ?auto_35932 ) ( not ( = ?auto_35931 ?auto_35932 ) ) ( not ( = ?auto_35934 ?auto_35931 ) ) ( not ( = ?auto_35935 ?auto_35931 ) ) ( not ( = ?auto_35933 ?auto_35931 ) ) ( not ( = ?auto_35937 ?auto_35931 ) ) ( not ( = ?auto_35939 ?auto_35931 ) ) ( not ( = ?auto_35944 ?auto_35931 ) ) ( SURFACE-AT ?auto_35932 ?auto_35942 ) ( ON ?auto_35932 ?auto_35945 ) ( CLEAR ?auto_35932 ) ( not ( = ?auto_35934 ?auto_35945 ) ) ( not ( = ?auto_35935 ?auto_35945 ) ) ( not ( = ?auto_35933 ?auto_35945 ) ) ( not ( = ?auto_35937 ?auto_35945 ) ) ( not ( = ?auto_35939 ?auto_35945 ) ) ( not ( = ?auto_35932 ?auto_35945 ) ) ( not ( = ?auto_35944 ?auto_35945 ) ) ( not ( = ?auto_35931 ?auto_35945 ) ) ( SURFACE-AT ?auto_35930 ?auto_35943 ) ( CLEAR ?auto_35930 ) ( IS-CRATE ?auto_35931 ) ( not ( = ?auto_35930 ?auto_35931 ) ) ( not ( = ?auto_35934 ?auto_35930 ) ) ( not ( = ?auto_35935 ?auto_35930 ) ) ( not ( = ?auto_35933 ?auto_35930 ) ) ( not ( = ?auto_35937 ?auto_35930 ) ) ( not ( = ?auto_35939 ?auto_35930 ) ) ( not ( = ?auto_35932 ?auto_35930 ) ) ( not ( = ?auto_35944 ?auto_35930 ) ) ( not ( = ?auto_35945 ?auto_35930 ) ) ( AVAILABLE ?auto_35936 ) ( TRUCK-AT ?auto_35941 ?auto_35942 ) ( AVAILABLE ?auto_35947 ) ( SURFACE-AT ?auto_35931 ?auto_35942 ) ( ON ?auto_35931 ?auto_35946 ) ( CLEAR ?auto_35931 ) ( not ( = ?auto_35934 ?auto_35946 ) ) ( not ( = ?auto_35935 ?auto_35946 ) ) ( not ( = ?auto_35933 ?auto_35946 ) ) ( not ( = ?auto_35937 ?auto_35946 ) ) ( not ( = ?auto_35939 ?auto_35946 ) ) ( not ( = ?auto_35932 ?auto_35946 ) ) ( not ( = ?auto_35944 ?auto_35946 ) ) ( not ( = ?auto_35931 ?auto_35946 ) ) ( not ( = ?auto_35945 ?auto_35946 ) ) ( not ( = ?auto_35930 ?auto_35946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35933 ?auto_35934 ?auto_35935 )
      ( MAKE-5CRATE-VERIFY ?auto_35930 ?auto_35931 ?auto_35932 ?auto_35933 ?auto_35934 ?auto_35935 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35948 - SURFACE
      ?auto_35949 - SURFACE
    )
    :vars
    (
      ?auto_35951 - HOIST
      ?auto_35959 - PLACE
      ?auto_35958 - SURFACE
      ?auto_35957 - PLACE
      ?auto_35965 - HOIST
      ?auto_35952 - SURFACE
      ?auto_35955 - PLACE
      ?auto_35953 - HOIST
      ?auto_35954 - SURFACE
      ?auto_35962 - SURFACE
      ?auto_35960 - SURFACE
      ?auto_35963 - SURFACE
      ?auto_35961 - SURFACE
      ?auto_35950 - SURFACE
      ?auto_35964 - SURFACE
      ?auto_35956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35951 ?auto_35959 ) ( IS-CRATE ?auto_35949 ) ( not ( = ?auto_35948 ?auto_35949 ) ) ( not ( = ?auto_35958 ?auto_35948 ) ) ( not ( = ?auto_35958 ?auto_35949 ) ) ( not ( = ?auto_35957 ?auto_35959 ) ) ( HOIST-AT ?auto_35965 ?auto_35957 ) ( not ( = ?auto_35951 ?auto_35965 ) ) ( SURFACE-AT ?auto_35949 ?auto_35957 ) ( ON ?auto_35949 ?auto_35952 ) ( CLEAR ?auto_35949 ) ( not ( = ?auto_35948 ?auto_35952 ) ) ( not ( = ?auto_35949 ?auto_35952 ) ) ( not ( = ?auto_35958 ?auto_35952 ) ) ( IS-CRATE ?auto_35948 ) ( not ( = ?auto_35955 ?auto_35959 ) ) ( not ( = ?auto_35957 ?auto_35955 ) ) ( HOIST-AT ?auto_35953 ?auto_35955 ) ( not ( = ?auto_35951 ?auto_35953 ) ) ( not ( = ?auto_35965 ?auto_35953 ) ) ( AVAILABLE ?auto_35953 ) ( SURFACE-AT ?auto_35948 ?auto_35955 ) ( ON ?auto_35948 ?auto_35954 ) ( CLEAR ?auto_35948 ) ( not ( = ?auto_35948 ?auto_35954 ) ) ( not ( = ?auto_35949 ?auto_35954 ) ) ( not ( = ?auto_35958 ?auto_35954 ) ) ( not ( = ?auto_35952 ?auto_35954 ) ) ( IS-CRATE ?auto_35958 ) ( not ( = ?auto_35962 ?auto_35958 ) ) ( not ( = ?auto_35948 ?auto_35962 ) ) ( not ( = ?auto_35949 ?auto_35962 ) ) ( not ( = ?auto_35952 ?auto_35962 ) ) ( not ( = ?auto_35954 ?auto_35962 ) ) ( SURFACE-AT ?auto_35958 ?auto_35957 ) ( ON ?auto_35958 ?auto_35960 ) ( CLEAR ?auto_35958 ) ( not ( = ?auto_35948 ?auto_35960 ) ) ( not ( = ?auto_35949 ?auto_35960 ) ) ( not ( = ?auto_35958 ?auto_35960 ) ) ( not ( = ?auto_35952 ?auto_35960 ) ) ( not ( = ?auto_35954 ?auto_35960 ) ) ( not ( = ?auto_35962 ?auto_35960 ) ) ( IS-CRATE ?auto_35962 ) ( not ( = ?auto_35963 ?auto_35962 ) ) ( not ( = ?auto_35948 ?auto_35963 ) ) ( not ( = ?auto_35949 ?auto_35963 ) ) ( not ( = ?auto_35958 ?auto_35963 ) ) ( not ( = ?auto_35952 ?auto_35963 ) ) ( not ( = ?auto_35954 ?auto_35963 ) ) ( not ( = ?auto_35960 ?auto_35963 ) ) ( SURFACE-AT ?auto_35962 ?auto_35957 ) ( ON ?auto_35962 ?auto_35961 ) ( CLEAR ?auto_35962 ) ( not ( = ?auto_35948 ?auto_35961 ) ) ( not ( = ?auto_35949 ?auto_35961 ) ) ( not ( = ?auto_35958 ?auto_35961 ) ) ( not ( = ?auto_35952 ?auto_35961 ) ) ( not ( = ?auto_35954 ?auto_35961 ) ) ( not ( = ?auto_35962 ?auto_35961 ) ) ( not ( = ?auto_35960 ?auto_35961 ) ) ( not ( = ?auto_35963 ?auto_35961 ) ) ( SURFACE-AT ?auto_35950 ?auto_35959 ) ( CLEAR ?auto_35950 ) ( IS-CRATE ?auto_35963 ) ( not ( = ?auto_35950 ?auto_35963 ) ) ( not ( = ?auto_35948 ?auto_35950 ) ) ( not ( = ?auto_35949 ?auto_35950 ) ) ( not ( = ?auto_35958 ?auto_35950 ) ) ( not ( = ?auto_35952 ?auto_35950 ) ) ( not ( = ?auto_35954 ?auto_35950 ) ) ( not ( = ?auto_35962 ?auto_35950 ) ) ( not ( = ?auto_35960 ?auto_35950 ) ) ( not ( = ?auto_35961 ?auto_35950 ) ) ( AVAILABLE ?auto_35951 ) ( AVAILABLE ?auto_35965 ) ( SURFACE-AT ?auto_35963 ?auto_35957 ) ( ON ?auto_35963 ?auto_35964 ) ( CLEAR ?auto_35963 ) ( not ( = ?auto_35948 ?auto_35964 ) ) ( not ( = ?auto_35949 ?auto_35964 ) ) ( not ( = ?auto_35958 ?auto_35964 ) ) ( not ( = ?auto_35952 ?auto_35964 ) ) ( not ( = ?auto_35954 ?auto_35964 ) ) ( not ( = ?auto_35962 ?auto_35964 ) ) ( not ( = ?auto_35960 ?auto_35964 ) ) ( not ( = ?auto_35963 ?auto_35964 ) ) ( not ( = ?auto_35961 ?auto_35964 ) ) ( not ( = ?auto_35950 ?auto_35964 ) ) ( TRUCK-AT ?auto_35956 ?auto_35959 ) )
    :subtasks
    ( ( !DRIVE ?auto_35956 ?auto_35959 ?auto_35957 )
      ( MAKE-2CRATE ?auto_35958 ?auto_35948 ?auto_35949 )
      ( MAKE-1CRATE-VERIFY ?auto_35948 ?auto_35949 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35966 - SURFACE
      ?auto_35967 - SURFACE
      ?auto_35968 - SURFACE
    )
    :vars
    (
      ?auto_35980 - HOIST
      ?auto_35976 - PLACE
      ?auto_35975 - PLACE
      ?auto_35970 - HOIST
      ?auto_35972 - SURFACE
      ?auto_35969 - PLACE
      ?auto_35974 - HOIST
      ?auto_35977 - SURFACE
      ?auto_35979 - SURFACE
      ?auto_35971 - SURFACE
      ?auto_35973 - SURFACE
      ?auto_35983 - SURFACE
      ?auto_35981 - SURFACE
      ?auto_35982 - SURFACE
      ?auto_35978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35980 ?auto_35976 ) ( IS-CRATE ?auto_35968 ) ( not ( = ?auto_35967 ?auto_35968 ) ) ( not ( = ?auto_35966 ?auto_35967 ) ) ( not ( = ?auto_35966 ?auto_35968 ) ) ( not ( = ?auto_35975 ?auto_35976 ) ) ( HOIST-AT ?auto_35970 ?auto_35975 ) ( not ( = ?auto_35980 ?auto_35970 ) ) ( SURFACE-AT ?auto_35968 ?auto_35975 ) ( ON ?auto_35968 ?auto_35972 ) ( CLEAR ?auto_35968 ) ( not ( = ?auto_35967 ?auto_35972 ) ) ( not ( = ?auto_35968 ?auto_35972 ) ) ( not ( = ?auto_35966 ?auto_35972 ) ) ( IS-CRATE ?auto_35967 ) ( not ( = ?auto_35969 ?auto_35976 ) ) ( not ( = ?auto_35975 ?auto_35969 ) ) ( HOIST-AT ?auto_35974 ?auto_35969 ) ( not ( = ?auto_35980 ?auto_35974 ) ) ( not ( = ?auto_35970 ?auto_35974 ) ) ( AVAILABLE ?auto_35974 ) ( SURFACE-AT ?auto_35967 ?auto_35969 ) ( ON ?auto_35967 ?auto_35977 ) ( CLEAR ?auto_35967 ) ( not ( = ?auto_35967 ?auto_35977 ) ) ( not ( = ?auto_35968 ?auto_35977 ) ) ( not ( = ?auto_35966 ?auto_35977 ) ) ( not ( = ?auto_35972 ?auto_35977 ) ) ( IS-CRATE ?auto_35966 ) ( not ( = ?auto_35979 ?auto_35966 ) ) ( not ( = ?auto_35967 ?auto_35979 ) ) ( not ( = ?auto_35968 ?auto_35979 ) ) ( not ( = ?auto_35972 ?auto_35979 ) ) ( not ( = ?auto_35977 ?auto_35979 ) ) ( SURFACE-AT ?auto_35966 ?auto_35975 ) ( ON ?auto_35966 ?auto_35971 ) ( CLEAR ?auto_35966 ) ( not ( = ?auto_35967 ?auto_35971 ) ) ( not ( = ?auto_35968 ?auto_35971 ) ) ( not ( = ?auto_35966 ?auto_35971 ) ) ( not ( = ?auto_35972 ?auto_35971 ) ) ( not ( = ?auto_35977 ?auto_35971 ) ) ( not ( = ?auto_35979 ?auto_35971 ) ) ( IS-CRATE ?auto_35979 ) ( not ( = ?auto_35973 ?auto_35979 ) ) ( not ( = ?auto_35967 ?auto_35973 ) ) ( not ( = ?auto_35968 ?auto_35973 ) ) ( not ( = ?auto_35966 ?auto_35973 ) ) ( not ( = ?auto_35972 ?auto_35973 ) ) ( not ( = ?auto_35977 ?auto_35973 ) ) ( not ( = ?auto_35971 ?auto_35973 ) ) ( SURFACE-AT ?auto_35979 ?auto_35975 ) ( ON ?auto_35979 ?auto_35983 ) ( CLEAR ?auto_35979 ) ( not ( = ?auto_35967 ?auto_35983 ) ) ( not ( = ?auto_35968 ?auto_35983 ) ) ( not ( = ?auto_35966 ?auto_35983 ) ) ( not ( = ?auto_35972 ?auto_35983 ) ) ( not ( = ?auto_35977 ?auto_35983 ) ) ( not ( = ?auto_35979 ?auto_35983 ) ) ( not ( = ?auto_35971 ?auto_35983 ) ) ( not ( = ?auto_35973 ?auto_35983 ) ) ( SURFACE-AT ?auto_35981 ?auto_35976 ) ( CLEAR ?auto_35981 ) ( IS-CRATE ?auto_35973 ) ( not ( = ?auto_35981 ?auto_35973 ) ) ( not ( = ?auto_35967 ?auto_35981 ) ) ( not ( = ?auto_35968 ?auto_35981 ) ) ( not ( = ?auto_35966 ?auto_35981 ) ) ( not ( = ?auto_35972 ?auto_35981 ) ) ( not ( = ?auto_35977 ?auto_35981 ) ) ( not ( = ?auto_35979 ?auto_35981 ) ) ( not ( = ?auto_35971 ?auto_35981 ) ) ( not ( = ?auto_35983 ?auto_35981 ) ) ( AVAILABLE ?auto_35980 ) ( AVAILABLE ?auto_35970 ) ( SURFACE-AT ?auto_35973 ?auto_35975 ) ( ON ?auto_35973 ?auto_35982 ) ( CLEAR ?auto_35973 ) ( not ( = ?auto_35967 ?auto_35982 ) ) ( not ( = ?auto_35968 ?auto_35982 ) ) ( not ( = ?auto_35966 ?auto_35982 ) ) ( not ( = ?auto_35972 ?auto_35982 ) ) ( not ( = ?auto_35977 ?auto_35982 ) ) ( not ( = ?auto_35979 ?auto_35982 ) ) ( not ( = ?auto_35971 ?auto_35982 ) ) ( not ( = ?auto_35973 ?auto_35982 ) ) ( not ( = ?auto_35983 ?auto_35982 ) ) ( not ( = ?auto_35981 ?auto_35982 ) ) ( TRUCK-AT ?auto_35978 ?auto_35976 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35967 ?auto_35968 )
      ( MAKE-2CRATE-VERIFY ?auto_35966 ?auto_35967 ?auto_35968 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35984 - SURFACE
      ?auto_35985 - SURFACE
      ?auto_35986 - SURFACE
      ?auto_35987 - SURFACE
    )
    :vars
    (
      ?auto_35994 - HOIST
      ?auto_35990 - PLACE
      ?auto_35995 - PLACE
      ?auto_35999 - HOIST
      ?auto_36001 - SURFACE
      ?auto_36000 - PLACE
      ?auto_35998 - HOIST
      ?auto_35989 - SURFACE
      ?auto_35991 - SURFACE
      ?auto_35997 - SURFACE
      ?auto_35992 - SURFACE
      ?auto_35996 - SURFACE
      ?auto_35993 - SURFACE
      ?auto_35988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35994 ?auto_35990 ) ( IS-CRATE ?auto_35987 ) ( not ( = ?auto_35986 ?auto_35987 ) ) ( not ( = ?auto_35985 ?auto_35986 ) ) ( not ( = ?auto_35985 ?auto_35987 ) ) ( not ( = ?auto_35995 ?auto_35990 ) ) ( HOIST-AT ?auto_35999 ?auto_35995 ) ( not ( = ?auto_35994 ?auto_35999 ) ) ( SURFACE-AT ?auto_35987 ?auto_35995 ) ( ON ?auto_35987 ?auto_36001 ) ( CLEAR ?auto_35987 ) ( not ( = ?auto_35986 ?auto_36001 ) ) ( not ( = ?auto_35987 ?auto_36001 ) ) ( not ( = ?auto_35985 ?auto_36001 ) ) ( IS-CRATE ?auto_35986 ) ( not ( = ?auto_36000 ?auto_35990 ) ) ( not ( = ?auto_35995 ?auto_36000 ) ) ( HOIST-AT ?auto_35998 ?auto_36000 ) ( not ( = ?auto_35994 ?auto_35998 ) ) ( not ( = ?auto_35999 ?auto_35998 ) ) ( AVAILABLE ?auto_35998 ) ( SURFACE-AT ?auto_35986 ?auto_36000 ) ( ON ?auto_35986 ?auto_35989 ) ( CLEAR ?auto_35986 ) ( not ( = ?auto_35986 ?auto_35989 ) ) ( not ( = ?auto_35987 ?auto_35989 ) ) ( not ( = ?auto_35985 ?auto_35989 ) ) ( not ( = ?auto_36001 ?auto_35989 ) ) ( IS-CRATE ?auto_35985 ) ( not ( = ?auto_35984 ?auto_35985 ) ) ( not ( = ?auto_35986 ?auto_35984 ) ) ( not ( = ?auto_35987 ?auto_35984 ) ) ( not ( = ?auto_36001 ?auto_35984 ) ) ( not ( = ?auto_35989 ?auto_35984 ) ) ( SURFACE-AT ?auto_35985 ?auto_35995 ) ( ON ?auto_35985 ?auto_35991 ) ( CLEAR ?auto_35985 ) ( not ( = ?auto_35986 ?auto_35991 ) ) ( not ( = ?auto_35987 ?auto_35991 ) ) ( not ( = ?auto_35985 ?auto_35991 ) ) ( not ( = ?auto_36001 ?auto_35991 ) ) ( not ( = ?auto_35989 ?auto_35991 ) ) ( not ( = ?auto_35984 ?auto_35991 ) ) ( IS-CRATE ?auto_35984 ) ( not ( = ?auto_35997 ?auto_35984 ) ) ( not ( = ?auto_35986 ?auto_35997 ) ) ( not ( = ?auto_35987 ?auto_35997 ) ) ( not ( = ?auto_35985 ?auto_35997 ) ) ( not ( = ?auto_36001 ?auto_35997 ) ) ( not ( = ?auto_35989 ?auto_35997 ) ) ( not ( = ?auto_35991 ?auto_35997 ) ) ( SURFACE-AT ?auto_35984 ?auto_35995 ) ( ON ?auto_35984 ?auto_35992 ) ( CLEAR ?auto_35984 ) ( not ( = ?auto_35986 ?auto_35992 ) ) ( not ( = ?auto_35987 ?auto_35992 ) ) ( not ( = ?auto_35985 ?auto_35992 ) ) ( not ( = ?auto_36001 ?auto_35992 ) ) ( not ( = ?auto_35989 ?auto_35992 ) ) ( not ( = ?auto_35984 ?auto_35992 ) ) ( not ( = ?auto_35991 ?auto_35992 ) ) ( not ( = ?auto_35997 ?auto_35992 ) ) ( SURFACE-AT ?auto_35996 ?auto_35990 ) ( CLEAR ?auto_35996 ) ( IS-CRATE ?auto_35997 ) ( not ( = ?auto_35996 ?auto_35997 ) ) ( not ( = ?auto_35986 ?auto_35996 ) ) ( not ( = ?auto_35987 ?auto_35996 ) ) ( not ( = ?auto_35985 ?auto_35996 ) ) ( not ( = ?auto_36001 ?auto_35996 ) ) ( not ( = ?auto_35989 ?auto_35996 ) ) ( not ( = ?auto_35984 ?auto_35996 ) ) ( not ( = ?auto_35991 ?auto_35996 ) ) ( not ( = ?auto_35992 ?auto_35996 ) ) ( AVAILABLE ?auto_35994 ) ( AVAILABLE ?auto_35999 ) ( SURFACE-AT ?auto_35997 ?auto_35995 ) ( ON ?auto_35997 ?auto_35993 ) ( CLEAR ?auto_35997 ) ( not ( = ?auto_35986 ?auto_35993 ) ) ( not ( = ?auto_35987 ?auto_35993 ) ) ( not ( = ?auto_35985 ?auto_35993 ) ) ( not ( = ?auto_36001 ?auto_35993 ) ) ( not ( = ?auto_35989 ?auto_35993 ) ) ( not ( = ?auto_35984 ?auto_35993 ) ) ( not ( = ?auto_35991 ?auto_35993 ) ) ( not ( = ?auto_35997 ?auto_35993 ) ) ( not ( = ?auto_35992 ?auto_35993 ) ) ( not ( = ?auto_35996 ?auto_35993 ) ) ( TRUCK-AT ?auto_35988 ?auto_35990 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35985 ?auto_35986 ?auto_35987 )
      ( MAKE-3CRATE-VERIFY ?auto_35984 ?auto_35985 ?auto_35986 ?auto_35987 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36002 - SURFACE
      ?auto_36003 - SURFACE
      ?auto_36004 - SURFACE
      ?auto_36005 - SURFACE
      ?auto_36006 - SURFACE
    )
    :vars
    (
      ?auto_36013 - HOIST
      ?auto_36009 - PLACE
      ?auto_36014 - PLACE
      ?auto_36017 - HOIST
      ?auto_36019 - SURFACE
      ?auto_36018 - PLACE
      ?auto_36016 - HOIST
      ?auto_36008 - SURFACE
      ?auto_36010 - SURFACE
      ?auto_36011 - SURFACE
      ?auto_36015 - SURFACE
      ?auto_36012 - SURFACE
      ?auto_36007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36013 ?auto_36009 ) ( IS-CRATE ?auto_36006 ) ( not ( = ?auto_36005 ?auto_36006 ) ) ( not ( = ?auto_36004 ?auto_36005 ) ) ( not ( = ?auto_36004 ?auto_36006 ) ) ( not ( = ?auto_36014 ?auto_36009 ) ) ( HOIST-AT ?auto_36017 ?auto_36014 ) ( not ( = ?auto_36013 ?auto_36017 ) ) ( SURFACE-AT ?auto_36006 ?auto_36014 ) ( ON ?auto_36006 ?auto_36019 ) ( CLEAR ?auto_36006 ) ( not ( = ?auto_36005 ?auto_36019 ) ) ( not ( = ?auto_36006 ?auto_36019 ) ) ( not ( = ?auto_36004 ?auto_36019 ) ) ( IS-CRATE ?auto_36005 ) ( not ( = ?auto_36018 ?auto_36009 ) ) ( not ( = ?auto_36014 ?auto_36018 ) ) ( HOIST-AT ?auto_36016 ?auto_36018 ) ( not ( = ?auto_36013 ?auto_36016 ) ) ( not ( = ?auto_36017 ?auto_36016 ) ) ( AVAILABLE ?auto_36016 ) ( SURFACE-AT ?auto_36005 ?auto_36018 ) ( ON ?auto_36005 ?auto_36008 ) ( CLEAR ?auto_36005 ) ( not ( = ?auto_36005 ?auto_36008 ) ) ( not ( = ?auto_36006 ?auto_36008 ) ) ( not ( = ?auto_36004 ?auto_36008 ) ) ( not ( = ?auto_36019 ?auto_36008 ) ) ( IS-CRATE ?auto_36004 ) ( not ( = ?auto_36003 ?auto_36004 ) ) ( not ( = ?auto_36005 ?auto_36003 ) ) ( not ( = ?auto_36006 ?auto_36003 ) ) ( not ( = ?auto_36019 ?auto_36003 ) ) ( not ( = ?auto_36008 ?auto_36003 ) ) ( SURFACE-AT ?auto_36004 ?auto_36014 ) ( ON ?auto_36004 ?auto_36010 ) ( CLEAR ?auto_36004 ) ( not ( = ?auto_36005 ?auto_36010 ) ) ( not ( = ?auto_36006 ?auto_36010 ) ) ( not ( = ?auto_36004 ?auto_36010 ) ) ( not ( = ?auto_36019 ?auto_36010 ) ) ( not ( = ?auto_36008 ?auto_36010 ) ) ( not ( = ?auto_36003 ?auto_36010 ) ) ( IS-CRATE ?auto_36003 ) ( not ( = ?auto_36002 ?auto_36003 ) ) ( not ( = ?auto_36005 ?auto_36002 ) ) ( not ( = ?auto_36006 ?auto_36002 ) ) ( not ( = ?auto_36004 ?auto_36002 ) ) ( not ( = ?auto_36019 ?auto_36002 ) ) ( not ( = ?auto_36008 ?auto_36002 ) ) ( not ( = ?auto_36010 ?auto_36002 ) ) ( SURFACE-AT ?auto_36003 ?auto_36014 ) ( ON ?auto_36003 ?auto_36011 ) ( CLEAR ?auto_36003 ) ( not ( = ?auto_36005 ?auto_36011 ) ) ( not ( = ?auto_36006 ?auto_36011 ) ) ( not ( = ?auto_36004 ?auto_36011 ) ) ( not ( = ?auto_36019 ?auto_36011 ) ) ( not ( = ?auto_36008 ?auto_36011 ) ) ( not ( = ?auto_36003 ?auto_36011 ) ) ( not ( = ?auto_36010 ?auto_36011 ) ) ( not ( = ?auto_36002 ?auto_36011 ) ) ( SURFACE-AT ?auto_36015 ?auto_36009 ) ( CLEAR ?auto_36015 ) ( IS-CRATE ?auto_36002 ) ( not ( = ?auto_36015 ?auto_36002 ) ) ( not ( = ?auto_36005 ?auto_36015 ) ) ( not ( = ?auto_36006 ?auto_36015 ) ) ( not ( = ?auto_36004 ?auto_36015 ) ) ( not ( = ?auto_36019 ?auto_36015 ) ) ( not ( = ?auto_36008 ?auto_36015 ) ) ( not ( = ?auto_36003 ?auto_36015 ) ) ( not ( = ?auto_36010 ?auto_36015 ) ) ( not ( = ?auto_36011 ?auto_36015 ) ) ( AVAILABLE ?auto_36013 ) ( AVAILABLE ?auto_36017 ) ( SURFACE-AT ?auto_36002 ?auto_36014 ) ( ON ?auto_36002 ?auto_36012 ) ( CLEAR ?auto_36002 ) ( not ( = ?auto_36005 ?auto_36012 ) ) ( not ( = ?auto_36006 ?auto_36012 ) ) ( not ( = ?auto_36004 ?auto_36012 ) ) ( not ( = ?auto_36019 ?auto_36012 ) ) ( not ( = ?auto_36008 ?auto_36012 ) ) ( not ( = ?auto_36003 ?auto_36012 ) ) ( not ( = ?auto_36010 ?auto_36012 ) ) ( not ( = ?auto_36002 ?auto_36012 ) ) ( not ( = ?auto_36011 ?auto_36012 ) ) ( not ( = ?auto_36015 ?auto_36012 ) ) ( TRUCK-AT ?auto_36007 ?auto_36009 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36004 ?auto_36005 ?auto_36006 )
      ( MAKE-4CRATE-VERIFY ?auto_36002 ?auto_36003 ?auto_36004 ?auto_36005 ?auto_36006 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36020 - SURFACE
      ?auto_36021 - SURFACE
      ?auto_36022 - SURFACE
      ?auto_36023 - SURFACE
      ?auto_36024 - SURFACE
      ?auto_36025 - SURFACE
    )
    :vars
    (
      ?auto_36032 - HOIST
      ?auto_36028 - PLACE
      ?auto_36033 - PLACE
      ?auto_36035 - HOIST
      ?auto_36037 - SURFACE
      ?auto_36036 - PLACE
      ?auto_36034 - HOIST
      ?auto_36027 - SURFACE
      ?auto_36029 - SURFACE
      ?auto_36030 - SURFACE
      ?auto_36031 - SURFACE
      ?auto_36026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36032 ?auto_36028 ) ( IS-CRATE ?auto_36025 ) ( not ( = ?auto_36024 ?auto_36025 ) ) ( not ( = ?auto_36023 ?auto_36024 ) ) ( not ( = ?auto_36023 ?auto_36025 ) ) ( not ( = ?auto_36033 ?auto_36028 ) ) ( HOIST-AT ?auto_36035 ?auto_36033 ) ( not ( = ?auto_36032 ?auto_36035 ) ) ( SURFACE-AT ?auto_36025 ?auto_36033 ) ( ON ?auto_36025 ?auto_36037 ) ( CLEAR ?auto_36025 ) ( not ( = ?auto_36024 ?auto_36037 ) ) ( not ( = ?auto_36025 ?auto_36037 ) ) ( not ( = ?auto_36023 ?auto_36037 ) ) ( IS-CRATE ?auto_36024 ) ( not ( = ?auto_36036 ?auto_36028 ) ) ( not ( = ?auto_36033 ?auto_36036 ) ) ( HOIST-AT ?auto_36034 ?auto_36036 ) ( not ( = ?auto_36032 ?auto_36034 ) ) ( not ( = ?auto_36035 ?auto_36034 ) ) ( AVAILABLE ?auto_36034 ) ( SURFACE-AT ?auto_36024 ?auto_36036 ) ( ON ?auto_36024 ?auto_36027 ) ( CLEAR ?auto_36024 ) ( not ( = ?auto_36024 ?auto_36027 ) ) ( not ( = ?auto_36025 ?auto_36027 ) ) ( not ( = ?auto_36023 ?auto_36027 ) ) ( not ( = ?auto_36037 ?auto_36027 ) ) ( IS-CRATE ?auto_36023 ) ( not ( = ?auto_36022 ?auto_36023 ) ) ( not ( = ?auto_36024 ?auto_36022 ) ) ( not ( = ?auto_36025 ?auto_36022 ) ) ( not ( = ?auto_36037 ?auto_36022 ) ) ( not ( = ?auto_36027 ?auto_36022 ) ) ( SURFACE-AT ?auto_36023 ?auto_36033 ) ( ON ?auto_36023 ?auto_36029 ) ( CLEAR ?auto_36023 ) ( not ( = ?auto_36024 ?auto_36029 ) ) ( not ( = ?auto_36025 ?auto_36029 ) ) ( not ( = ?auto_36023 ?auto_36029 ) ) ( not ( = ?auto_36037 ?auto_36029 ) ) ( not ( = ?auto_36027 ?auto_36029 ) ) ( not ( = ?auto_36022 ?auto_36029 ) ) ( IS-CRATE ?auto_36022 ) ( not ( = ?auto_36021 ?auto_36022 ) ) ( not ( = ?auto_36024 ?auto_36021 ) ) ( not ( = ?auto_36025 ?auto_36021 ) ) ( not ( = ?auto_36023 ?auto_36021 ) ) ( not ( = ?auto_36037 ?auto_36021 ) ) ( not ( = ?auto_36027 ?auto_36021 ) ) ( not ( = ?auto_36029 ?auto_36021 ) ) ( SURFACE-AT ?auto_36022 ?auto_36033 ) ( ON ?auto_36022 ?auto_36030 ) ( CLEAR ?auto_36022 ) ( not ( = ?auto_36024 ?auto_36030 ) ) ( not ( = ?auto_36025 ?auto_36030 ) ) ( not ( = ?auto_36023 ?auto_36030 ) ) ( not ( = ?auto_36037 ?auto_36030 ) ) ( not ( = ?auto_36027 ?auto_36030 ) ) ( not ( = ?auto_36022 ?auto_36030 ) ) ( not ( = ?auto_36029 ?auto_36030 ) ) ( not ( = ?auto_36021 ?auto_36030 ) ) ( SURFACE-AT ?auto_36020 ?auto_36028 ) ( CLEAR ?auto_36020 ) ( IS-CRATE ?auto_36021 ) ( not ( = ?auto_36020 ?auto_36021 ) ) ( not ( = ?auto_36024 ?auto_36020 ) ) ( not ( = ?auto_36025 ?auto_36020 ) ) ( not ( = ?auto_36023 ?auto_36020 ) ) ( not ( = ?auto_36037 ?auto_36020 ) ) ( not ( = ?auto_36027 ?auto_36020 ) ) ( not ( = ?auto_36022 ?auto_36020 ) ) ( not ( = ?auto_36029 ?auto_36020 ) ) ( not ( = ?auto_36030 ?auto_36020 ) ) ( AVAILABLE ?auto_36032 ) ( AVAILABLE ?auto_36035 ) ( SURFACE-AT ?auto_36021 ?auto_36033 ) ( ON ?auto_36021 ?auto_36031 ) ( CLEAR ?auto_36021 ) ( not ( = ?auto_36024 ?auto_36031 ) ) ( not ( = ?auto_36025 ?auto_36031 ) ) ( not ( = ?auto_36023 ?auto_36031 ) ) ( not ( = ?auto_36037 ?auto_36031 ) ) ( not ( = ?auto_36027 ?auto_36031 ) ) ( not ( = ?auto_36022 ?auto_36031 ) ) ( not ( = ?auto_36029 ?auto_36031 ) ) ( not ( = ?auto_36021 ?auto_36031 ) ) ( not ( = ?auto_36030 ?auto_36031 ) ) ( not ( = ?auto_36020 ?auto_36031 ) ) ( TRUCK-AT ?auto_36026 ?auto_36028 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36023 ?auto_36024 ?auto_36025 )
      ( MAKE-5CRATE-VERIFY ?auto_36020 ?auto_36021 ?auto_36022 ?auto_36023 ?auto_36024 ?auto_36025 ) )
  )

)

