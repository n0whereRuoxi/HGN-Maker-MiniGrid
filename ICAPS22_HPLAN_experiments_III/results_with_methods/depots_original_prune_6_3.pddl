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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44097 - SURFACE
      ?auto_44098 - SURFACE
    )
    :vars
    (
      ?auto_44099 - HOIST
      ?auto_44100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44099 ?auto_44100 ) ( SURFACE-AT ?auto_44097 ?auto_44100 ) ( CLEAR ?auto_44097 ) ( LIFTING ?auto_44099 ?auto_44098 ) ( IS-CRATE ?auto_44098 ) ( not ( = ?auto_44097 ?auto_44098 ) ) )
    :subtasks
    ( ( !DROP ?auto_44099 ?auto_44098 ?auto_44097 ?auto_44100 )
      ( MAKE-1CRATE-VERIFY ?auto_44097 ?auto_44098 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44101 - SURFACE
      ?auto_44102 - SURFACE
    )
    :vars
    (
      ?auto_44103 - HOIST
      ?auto_44104 - PLACE
      ?auto_44105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44103 ?auto_44104 ) ( SURFACE-AT ?auto_44101 ?auto_44104 ) ( CLEAR ?auto_44101 ) ( IS-CRATE ?auto_44102 ) ( not ( = ?auto_44101 ?auto_44102 ) ) ( TRUCK-AT ?auto_44105 ?auto_44104 ) ( AVAILABLE ?auto_44103 ) ( IN ?auto_44102 ?auto_44105 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44103 ?auto_44102 ?auto_44105 ?auto_44104 )
      ( MAKE-1CRATE ?auto_44101 ?auto_44102 )
      ( MAKE-1CRATE-VERIFY ?auto_44101 ?auto_44102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44106 - SURFACE
      ?auto_44107 - SURFACE
    )
    :vars
    (
      ?auto_44110 - HOIST
      ?auto_44108 - PLACE
      ?auto_44109 - TRUCK
      ?auto_44111 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44110 ?auto_44108 ) ( SURFACE-AT ?auto_44106 ?auto_44108 ) ( CLEAR ?auto_44106 ) ( IS-CRATE ?auto_44107 ) ( not ( = ?auto_44106 ?auto_44107 ) ) ( AVAILABLE ?auto_44110 ) ( IN ?auto_44107 ?auto_44109 ) ( TRUCK-AT ?auto_44109 ?auto_44111 ) ( not ( = ?auto_44111 ?auto_44108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44109 ?auto_44111 ?auto_44108 )
      ( MAKE-1CRATE ?auto_44106 ?auto_44107 )
      ( MAKE-1CRATE-VERIFY ?auto_44106 ?auto_44107 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44112 - SURFACE
      ?auto_44113 - SURFACE
    )
    :vars
    (
      ?auto_44114 - HOIST
      ?auto_44115 - PLACE
      ?auto_44116 - TRUCK
      ?auto_44117 - PLACE
      ?auto_44118 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44114 ?auto_44115 ) ( SURFACE-AT ?auto_44112 ?auto_44115 ) ( CLEAR ?auto_44112 ) ( IS-CRATE ?auto_44113 ) ( not ( = ?auto_44112 ?auto_44113 ) ) ( AVAILABLE ?auto_44114 ) ( TRUCK-AT ?auto_44116 ?auto_44117 ) ( not ( = ?auto_44117 ?auto_44115 ) ) ( HOIST-AT ?auto_44118 ?auto_44117 ) ( LIFTING ?auto_44118 ?auto_44113 ) ( not ( = ?auto_44114 ?auto_44118 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44118 ?auto_44113 ?auto_44116 ?auto_44117 )
      ( MAKE-1CRATE ?auto_44112 ?auto_44113 )
      ( MAKE-1CRATE-VERIFY ?auto_44112 ?auto_44113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44119 - SURFACE
      ?auto_44120 - SURFACE
    )
    :vars
    (
      ?auto_44124 - HOIST
      ?auto_44123 - PLACE
      ?auto_44121 - TRUCK
      ?auto_44122 - PLACE
      ?auto_44125 - HOIST
      ?auto_44126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44124 ?auto_44123 ) ( SURFACE-AT ?auto_44119 ?auto_44123 ) ( CLEAR ?auto_44119 ) ( IS-CRATE ?auto_44120 ) ( not ( = ?auto_44119 ?auto_44120 ) ) ( AVAILABLE ?auto_44124 ) ( TRUCK-AT ?auto_44121 ?auto_44122 ) ( not ( = ?auto_44122 ?auto_44123 ) ) ( HOIST-AT ?auto_44125 ?auto_44122 ) ( not ( = ?auto_44124 ?auto_44125 ) ) ( AVAILABLE ?auto_44125 ) ( SURFACE-AT ?auto_44120 ?auto_44122 ) ( ON ?auto_44120 ?auto_44126 ) ( CLEAR ?auto_44120 ) ( not ( = ?auto_44119 ?auto_44126 ) ) ( not ( = ?auto_44120 ?auto_44126 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44125 ?auto_44120 ?auto_44126 ?auto_44122 )
      ( MAKE-1CRATE ?auto_44119 ?auto_44120 )
      ( MAKE-1CRATE-VERIFY ?auto_44119 ?auto_44120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44127 - SURFACE
      ?auto_44128 - SURFACE
    )
    :vars
    (
      ?auto_44130 - HOIST
      ?auto_44134 - PLACE
      ?auto_44133 - PLACE
      ?auto_44132 - HOIST
      ?auto_44131 - SURFACE
      ?auto_44129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44130 ?auto_44134 ) ( SURFACE-AT ?auto_44127 ?auto_44134 ) ( CLEAR ?auto_44127 ) ( IS-CRATE ?auto_44128 ) ( not ( = ?auto_44127 ?auto_44128 ) ) ( AVAILABLE ?auto_44130 ) ( not ( = ?auto_44133 ?auto_44134 ) ) ( HOIST-AT ?auto_44132 ?auto_44133 ) ( not ( = ?auto_44130 ?auto_44132 ) ) ( AVAILABLE ?auto_44132 ) ( SURFACE-AT ?auto_44128 ?auto_44133 ) ( ON ?auto_44128 ?auto_44131 ) ( CLEAR ?auto_44128 ) ( not ( = ?auto_44127 ?auto_44131 ) ) ( not ( = ?auto_44128 ?auto_44131 ) ) ( TRUCK-AT ?auto_44129 ?auto_44134 ) )
    :subtasks
    ( ( !DRIVE ?auto_44129 ?auto_44134 ?auto_44133 )
      ( MAKE-1CRATE ?auto_44127 ?auto_44128 )
      ( MAKE-1CRATE-VERIFY ?auto_44127 ?auto_44128 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44144 - SURFACE
      ?auto_44145 - SURFACE
      ?auto_44146 - SURFACE
    )
    :vars
    (
      ?auto_44147 - HOIST
      ?auto_44148 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44147 ?auto_44148 ) ( SURFACE-AT ?auto_44145 ?auto_44148 ) ( CLEAR ?auto_44145 ) ( LIFTING ?auto_44147 ?auto_44146 ) ( IS-CRATE ?auto_44146 ) ( not ( = ?auto_44145 ?auto_44146 ) ) ( ON ?auto_44145 ?auto_44144 ) ( not ( = ?auto_44144 ?auto_44145 ) ) ( not ( = ?auto_44144 ?auto_44146 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44145 ?auto_44146 )
      ( MAKE-2CRATE-VERIFY ?auto_44144 ?auto_44145 ?auto_44146 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44154 - SURFACE
      ?auto_44155 - SURFACE
      ?auto_44156 - SURFACE
    )
    :vars
    (
      ?auto_44157 - HOIST
      ?auto_44159 - PLACE
      ?auto_44158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44157 ?auto_44159 ) ( SURFACE-AT ?auto_44155 ?auto_44159 ) ( CLEAR ?auto_44155 ) ( IS-CRATE ?auto_44156 ) ( not ( = ?auto_44155 ?auto_44156 ) ) ( TRUCK-AT ?auto_44158 ?auto_44159 ) ( AVAILABLE ?auto_44157 ) ( IN ?auto_44156 ?auto_44158 ) ( ON ?auto_44155 ?auto_44154 ) ( not ( = ?auto_44154 ?auto_44155 ) ) ( not ( = ?auto_44154 ?auto_44156 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44155 ?auto_44156 )
      ( MAKE-2CRATE-VERIFY ?auto_44154 ?auto_44155 ?auto_44156 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44160 - SURFACE
      ?auto_44161 - SURFACE
    )
    :vars
    (
      ?auto_44163 - HOIST
      ?auto_44165 - PLACE
      ?auto_44164 - TRUCK
      ?auto_44162 - SURFACE
      ?auto_44166 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44163 ?auto_44165 ) ( SURFACE-AT ?auto_44160 ?auto_44165 ) ( CLEAR ?auto_44160 ) ( IS-CRATE ?auto_44161 ) ( not ( = ?auto_44160 ?auto_44161 ) ) ( AVAILABLE ?auto_44163 ) ( IN ?auto_44161 ?auto_44164 ) ( ON ?auto_44160 ?auto_44162 ) ( not ( = ?auto_44162 ?auto_44160 ) ) ( not ( = ?auto_44162 ?auto_44161 ) ) ( TRUCK-AT ?auto_44164 ?auto_44166 ) ( not ( = ?auto_44166 ?auto_44165 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44164 ?auto_44166 ?auto_44165 )
      ( MAKE-2CRATE ?auto_44162 ?auto_44160 ?auto_44161 )
      ( MAKE-1CRATE-VERIFY ?auto_44160 ?auto_44161 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44167 - SURFACE
      ?auto_44168 - SURFACE
      ?auto_44169 - SURFACE
    )
    :vars
    (
      ?auto_44172 - HOIST
      ?auto_44170 - PLACE
      ?auto_44171 - TRUCK
      ?auto_44173 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44172 ?auto_44170 ) ( SURFACE-AT ?auto_44168 ?auto_44170 ) ( CLEAR ?auto_44168 ) ( IS-CRATE ?auto_44169 ) ( not ( = ?auto_44168 ?auto_44169 ) ) ( AVAILABLE ?auto_44172 ) ( IN ?auto_44169 ?auto_44171 ) ( ON ?auto_44168 ?auto_44167 ) ( not ( = ?auto_44167 ?auto_44168 ) ) ( not ( = ?auto_44167 ?auto_44169 ) ) ( TRUCK-AT ?auto_44171 ?auto_44173 ) ( not ( = ?auto_44173 ?auto_44170 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44168 ?auto_44169 )
      ( MAKE-2CRATE-VERIFY ?auto_44167 ?auto_44168 ?auto_44169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44174 - SURFACE
      ?auto_44175 - SURFACE
    )
    :vars
    (
      ?auto_44179 - HOIST
      ?auto_44180 - PLACE
      ?auto_44177 - SURFACE
      ?auto_44178 - TRUCK
      ?auto_44176 - PLACE
      ?auto_44181 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44179 ?auto_44180 ) ( SURFACE-AT ?auto_44174 ?auto_44180 ) ( CLEAR ?auto_44174 ) ( IS-CRATE ?auto_44175 ) ( not ( = ?auto_44174 ?auto_44175 ) ) ( AVAILABLE ?auto_44179 ) ( ON ?auto_44174 ?auto_44177 ) ( not ( = ?auto_44177 ?auto_44174 ) ) ( not ( = ?auto_44177 ?auto_44175 ) ) ( TRUCK-AT ?auto_44178 ?auto_44176 ) ( not ( = ?auto_44176 ?auto_44180 ) ) ( HOIST-AT ?auto_44181 ?auto_44176 ) ( LIFTING ?auto_44181 ?auto_44175 ) ( not ( = ?auto_44179 ?auto_44181 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44181 ?auto_44175 ?auto_44178 ?auto_44176 )
      ( MAKE-2CRATE ?auto_44177 ?auto_44174 ?auto_44175 )
      ( MAKE-1CRATE-VERIFY ?auto_44174 ?auto_44175 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44182 - SURFACE
      ?auto_44183 - SURFACE
      ?auto_44184 - SURFACE
    )
    :vars
    (
      ?auto_44188 - HOIST
      ?auto_44185 - PLACE
      ?auto_44187 - TRUCK
      ?auto_44189 - PLACE
      ?auto_44186 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44188 ?auto_44185 ) ( SURFACE-AT ?auto_44183 ?auto_44185 ) ( CLEAR ?auto_44183 ) ( IS-CRATE ?auto_44184 ) ( not ( = ?auto_44183 ?auto_44184 ) ) ( AVAILABLE ?auto_44188 ) ( ON ?auto_44183 ?auto_44182 ) ( not ( = ?auto_44182 ?auto_44183 ) ) ( not ( = ?auto_44182 ?auto_44184 ) ) ( TRUCK-AT ?auto_44187 ?auto_44189 ) ( not ( = ?auto_44189 ?auto_44185 ) ) ( HOIST-AT ?auto_44186 ?auto_44189 ) ( LIFTING ?auto_44186 ?auto_44184 ) ( not ( = ?auto_44188 ?auto_44186 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44183 ?auto_44184 )
      ( MAKE-2CRATE-VERIFY ?auto_44182 ?auto_44183 ?auto_44184 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44190 - SURFACE
      ?auto_44191 - SURFACE
    )
    :vars
    (
      ?auto_44197 - HOIST
      ?auto_44193 - PLACE
      ?auto_44192 - SURFACE
      ?auto_44195 - TRUCK
      ?auto_44196 - PLACE
      ?auto_44194 - HOIST
      ?auto_44198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44197 ?auto_44193 ) ( SURFACE-AT ?auto_44190 ?auto_44193 ) ( CLEAR ?auto_44190 ) ( IS-CRATE ?auto_44191 ) ( not ( = ?auto_44190 ?auto_44191 ) ) ( AVAILABLE ?auto_44197 ) ( ON ?auto_44190 ?auto_44192 ) ( not ( = ?auto_44192 ?auto_44190 ) ) ( not ( = ?auto_44192 ?auto_44191 ) ) ( TRUCK-AT ?auto_44195 ?auto_44196 ) ( not ( = ?auto_44196 ?auto_44193 ) ) ( HOIST-AT ?auto_44194 ?auto_44196 ) ( not ( = ?auto_44197 ?auto_44194 ) ) ( AVAILABLE ?auto_44194 ) ( SURFACE-AT ?auto_44191 ?auto_44196 ) ( ON ?auto_44191 ?auto_44198 ) ( CLEAR ?auto_44191 ) ( not ( = ?auto_44190 ?auto_44198 ) ) ( not ( = ?auto_44191 ?auto_44198 ) ) ( not ( = ?auto_44192 ?auto_44198 ) ) )
    :subtasks
    ( ( !LIFT ?auto_44194 ?auto_44191 ?auto_44198 ?auto_44196 )
      ( MAKE-2CRATE ?auto_44192 ?auto_44190 ?auto_44191 )
      ( MAKE-1CRATE-VERIFY ?auto_44190 ?auto_44191 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44199 - SURFACE
      ?auto_44200 - SURFACE
      ?auto_44201 - SURFACE
    )
    :vars
    (
      ?auto_44206 - HOIST
      ?auto_44207 - PLACE
      ?auto_44205 - TRUCK
      ?auto_44202 - PLACE
      ?auto_44204 - HOIST
      ?auto_44203 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44206 ?auto_44207 ) ( SURFACE-AT ?auto_44200 ?auto_44207 ) ( CLEAR ?auto_44200 ) ( IS-CRATE ?auto_44201 ) ( not ( = ?auto_44200 ?auto_44201 ) ) ( AVAILABLE ?auto_44206 ) ( ON ?auto_44200 ?auto_44199 ) ( not ( = ?auto_44199 ?auto_44200 ) ) ( not ( = ?auto_44199 ?auto_44201 ) ) ( TRUCK-AT ?auto_44205 ?auto_44202 ) ( not ( = ?auto_44202 ?auto_44207 ) ) ( HOIST-AT ?auto_44204 ?auto_44202 ) ( not ( = ?auto_44206 ?auto_44204 ) ) ( AVAILABLE ?auto_44204 ) ( SURFACE-AT ?auto_44201 ?auto_44202 ) ( ON ?auto_44201 ?auto_44203 ) ( CLEAR ?auto_44201 ) ( not ( = ?auto_44200 ?auto_44203 ) ) ( not ( = ?auto_44201 ?auto_44203 ) ) ( not ( = ?auto_44199 ?auto_44203 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44200 ?auto_44201 )
      ( MAKE-2CRATE-VERIFY ?auto_44199 ?auto_44200 ?auto_44201 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44208 - SURFACE
      ?auto_44209 - SURFACE
    )
    :vars
    (
      ?auto_44210 - HOIST
      ?auto_44213 - PLACE
      ?auto_44212 - SURFACE
      ?auto_44215 - PLACE
      ?auto_44211 - HOIST
      ?auto_44216 - SURFACE
      ?auto_44214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44210 ?auto_44213 ) ( SURFACE-AT ?auto_44208 ?auto_44213 ) ( CLEAR ?auto_44208 ) ( IS-CRATE ?auto_44209 ) ( not ( = ?auto_44208 ?auto_44209 ) ) ( AVAILABLE ?auto_44210 ) ( ON ?auto_44208 ?auto_44212 ) ( not ( = ?auto_44212 ?auto_44208 ) ) ( not ( = ?auto_44212 ?auto_44209 ) ) ( not ( = ?auto_44215 ?auto_44213 ) ) ( HOIST-AT ?auto_44211 ?auto_44215 ) ( not ( = ?auto_44210 ?auto_44211 ) ) ( AVAILABLE ?auto_44211 ) ( SURFACE-AT ?auto_44209 ?auto_44215 ) ( ON ?auto_44209 ?auto_44216 ) ( CLEAR ?auto_44209 ) ( not ( = ?auto_44208 ?auto_44216 ) ) ( not ( = ?auto_44209 ?auto_44216 ) ) ( not ( = ?auto_44212 ?auto_44216 ) ) ( TRUCK-AT ?auto_44214 ?auto_44213 ) )
    :subtasks
    ( ( !DRIVE ?auto_44214 ?auto_44213 ?auto_44215 )
      ( MAKE-2CRATE ?auto_44212 ?auto_44208 ?auto_44209 )
      ( MAKE-1CRATE-VERIFY ?auto_44208 ?auto_44209 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44217 - SURFACE
      ?auto_44218 - SURFACE
      ?auto_44219 - SURFACE
    )
    :vars
    (
      ?auto_44221 - HOIST
      ?auto_44225 - PLACE
      ?auto_44220 - PLACE
      ?auto_44222 - HOIST
      ?auto_44223 - SURFACE
      ?auto_44224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44221 ?auto_44225 ) ( SURFACE-AT ?auto_44218 ?auto_44225 ) ( CLEAR ?auto_44218 ) ( IS-CRATE ?auto_44219 ) ( not ( = ?auto_44218 ?auto_44219 ) ) ( AVAILABLE ?auto_44221 ) ( ON ?auto_44218 ?auto_44217 ) ( not ( = ?auto_44217 ?auto_44218 ) ) ( not ( = ?auto_44217 ?auto_44219 ) ) ( not ( = ?auto_44220 ?auto_44225 ) ) ( HOIST-AT ?auto_44222 ?auto_44220 ) ( not ( = ?auto_44221 ?auto_44222 ) ) ( AVAILABLE ?auto_44222 ) ( SURFACE-AT ?auto_44219 ?auto_44220 ) ( ON ?auto_44219 ?auto_44223 ) ( CLEAR ?auto_44219 ) ( not ( = ?auto_44218 ?auto_44223 ) ) ( not ( = ?auto_44219 ?auto_44223 ) ) ( not ( = ?auto_44217 ?auto_44223 ) ) ( TRUCK-AT ?auto_44224 ?auto_44225 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44218 ?auto_44219 )
      ( MAKE-2CRATE-VERIFY ?auto_44217 ?auto_44218 ?auto_44219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44226 - SURFACE
      ?auto_44227 - SURFACE
    )
    :vars
    (
      ?auto_44233 - HOIST
      ?auto_44231 - PLACE
      ?auto_44232 - SURFACE
      ?auto_44234 - PLACE
      ?auto_44228 - HOIST
      ?auto_44229 - SURFACE
      ?auto_44230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44233 ?auto_44231 ) ( IS-CRATE ?auto_44227 ) ( not ( = ?auto_44226 ?auto_44227 ) ) ( not ( = ?auto_44232 ?auto_44226 ) ) ( not ( = ?auto_44232 ?auto_44227 ) ) ( not ( = ?auto_44234 ?auto_44231 ) ) ( HOIST-AT ?auto_44228 ?auto_44234 ) ( not ( = ?auto_44233 ?auto_44228 ) ) ( AVAILABLE ?auto_44228 ) ( SURFACE-AT ?auto_44227 ?auto_44234 ) ( ON ?auto_44227 ?auto_44229 ) ( CLEAR ?auto_44227 ) ( not ( = ?auto_44226 ?auto_44229 ) ) ( not ( = ?auto_44227 ?auto_44229 ) ) ( not ( = ?auto_44232 ?auto_44229 ) ) ( TRUCK-AT ?auto_44230 ?auto_44231 ) ( SURFACE-AT ?auto_44232 ?auto_44231 ) ( CLEAR ?auto_44232 ) ( LIFTING ?auto_44233 ?auto_44226 ) ( IS-CRATE ?auto_44226 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44232 ?auto_44226 )
      ( MAKE-2CRATE ?auto_44232 ?auto_44226 ?auto_44227 )
      ( MAKE-1CRATE-VERIFY ?auto_44226 ?auto_44227 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44235 - SURFACE
      ?auto_44236 - SURFACE
      ?auto_44237 - SURFACE
    )
    :vars
    (
      ?auto_44241 - HOIST
      ?auto_44239 - PLACE
      ?auto_44238 - PLACE
      ?auto_44240 - HOIST
      ?auto_44242 - SURFACE
      ?auto_44243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44241 ?auto_44239 ) ( IS-CRATE ?auto_44237 ) ( not ( = ?auto_44236 ?auto_44237 ) ) ( not ( = ?auto_44235 ?auto_44236 ) ) ( not ( = ?auto_44235 ?auto_44237 ) ) ( not ( = ?auto_44238 ?auto_44239 ) ) ( HOIST-AT ?auto_44240 ?auto_44238 ) ( not ( = ?auto_44241 ?auto_44240 ) ) ( AVAILABLE ?auto_44240 ) ( SURFACE-AT ?auto_44237 ?auto_44238 ) ( ON ?auto_44237 ?auto_44242 ) ( CLEAR ?auto_44237 ) ( not ( = ?auto_44236 ?auto_44242 ) ) ( not ( = ?auto_44237 ?auto_44242 ) ) ( not ( = ?auto_44235 ?auto_44242 ) ) ( TRUCK-AT ?auto_44243 ?auto_44239 ) ( SURFACE-AT ?auto_44235 ?auto_44239 ) ( CLEAR ?auto_44235 ) ( LIFTING ?auto_44241 ?auto_44236 ) ( IS-CRATE ?auto_44236 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44236 ?auto_44237 )
      ( MAKE-2CRATE-VERIFY ?auto_44235 ?auto_44236 ?auto_44237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44244 - SURFACE
      ?auto_44245 - SURFACE
    )
    :vars
    (
      ?auto_44251 - HOIST
      ?auto_44247 - PLACE
      ?auto_44250 - SURFACE
      ?auto_44249 - PLACE
      ?auto_44248 - HOIST
      ?auto_44252 - SURFACE
      ?auto_44246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44251 ?auto_44247 ) ( IS-CRATE ?auto_44245 ) ( not ( = ?auto_44244 ?auto_44245 ) ) ( not ( = ?auto_44250 ?auto_44244 ) ) ( not ( = ?auto_44250 ?auto_44245 ) ) ( not ( = ?auto_44249 ?auto_44247 ) ) ( HOIST-AT ?auto_44248 ?auto_44249 ) ( not ( = ?auto_44251 ?auto_44248 ) ) ( AVAILABLE ?auto_44248 ) ( SURFACE-AT ?auto_44245 ?auto_44249 ) ( ON ?auto_44245 ?auto_44252 ) ( CLEAR ?auto_44245 ) ( not ( = ?auto_44244 ?auto_44252 ) ) ( not ( = ?auto_44245 ?auto_44252 ) ) ( not ( = ?auto_44250 ?auto_44252 ) ) ( TRUCK-AT ?auto_44246 ?auto_44247 ) ( SURFACE-AT ?auto_44250 ?auto_44247 ) ( CLEAR ?auto_44250 ) ( IS-CRATE ?auto_44244 ) ( AVAILABLE ?auto_44251 ) ( IN ?auto_44244 ?auto_44246 ) )
    :subtasks
    ( ( !UNLOAD ?auto_44251 ?auto_44244 ?auto_44246 ?auto_44247 )
      ( MAKE-2CRATE ?auto_44250 ?auto_44244 ?auto_44245 )
      ( MAKE-1CRATE-VERIFY ?auto_44244 ?auto_44245 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_44253 - SURFACE
      ?auto_44254 - SURFACE
      ?auto_44255 - SURFACE
    )
    :vars
    (
      ?auto_44259 - HOIST
      ?auto_44256 - PLACE
      ?auto_44260 - PLACE
      ?auto_44257 - HOIST
      ?auto_44258 - SURFACE
      ?auto_44261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44259 ?auto_44256 ) ( IS-CRATE ?auto_44255 ) ( not ( = ?auto_44254 ?auto_44255 ) ) ( not ( = ?auto_44253 ?auto_44254 ) ) ( not ( = ?auto_44253 ?auto_44255 ) ) ( not ( = ?auto_44260 ?auto_44256 ) ) ( HOIST-AT ?auto_44257 ?auto_44260 ) ( not ( = ?auto_44259 ?auto_44257 ) ) ( AVAILABLE ?auto_44257 ) ( SURFACE-AT ?auto_44255 ?auto_44260 ) ( ON ?auto_44255 ?auto_44258 ) ( CLEAR ?auto_44255 ) ( not ( = ?auto_44254 ?auto_44258 ) ) ( not ( = ?auto_44255 ?auto_44258 ) ) ( not ( = ?auto_44253 ?auto_44258 ) ) ( TRUCK-AT ?auto_44261 ?auto_44256 ) ( SURFACE-AT ?auto_44253 ?auto_44256 ) ( CLEAR ?auto_44253 ) ( IS-CRATE ?auto_44254 ) ( AVAILABLE ?auto_44259 ) ( IN ?auto_44254 ?auto_44261 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44254 ?auto_44255 )
      ( MAKE-2CRATE-VERIFY ?auto_44253 ?auto_44254 ?auto_44255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_44298 - SURFACE
      ?auto_44299 - SURFACE
    )
    :vars
    (
      ?auto_44304 - HOIST
      ?auto_44305 - PLACE
      ?auto_44306 - SURFACE
      ?auto_44303 - PLACE
      ?auto_44300 - HOIST
      ?auto_44301 - SURFACE
      ?auto_44302 - TRUCK
      ?auto_44307 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44304 ?auto_44305 ) ( SURFACE-AT ?auto_44298 ?auto_44305 ) ( CLEAR ?auto_44298 ) ( IS-CRATE ?auto_44299 ) ( not ( = ?auto_44298 ?auto_44299 ) ) ( AVAILABLE ?auto_44304 ) ( ON ?auto_44298 ?auto_44306 ) ( not ( = ?auto_44306 ?auto_44298 ) ) ( not ( = ?auto_44306 ?auto_44299 ) ) ( not ( = ?auto_44303 ?auto_44305 ) ) ( HOIST-AT ?auto_44300 ?auto_44303 ) ( not ( = ?auto_44304 ?auto_44300 ) ) ( AVAILABLE ?auto_44300 ) ( SURFACE-AT ?auto_44299 ?auto_44303 ) ( ON ?auto_44299 ?auto_44301 ) ( CLEAR ?auto_44299 ) ( not ( = ?auto_44298 ?auto_44301 ) ) ( not ( = ?auto_44299 ?auto_44301 ) ) ( not ( = ?auto_44306 ?auto_44301 ) ) ( TRUCK-AT ?auto_44302 ?auto_44307 ) ( not ( = ?auto_44307 ?auto_44305 ) ) ( not ( = ?auto_44303 ?auto_44307 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_44302 ?auto_44307 ?auto_44305 )
      ( MAKE-1CRATE ?auto_44298 ?auto_44299 )
      ( MAKE-1CRATE-VERIFY ?auto_44298 ?auto_44299 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44337 - SURFACE
      ?auto_44338 - SURFACE
      ?auto_44339 - SURFACE
      ?auto_44340 - SURFACE
    )
    :vars
    (
      ?auto_44341 - HOIST
      ?auto_44342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44341 ?auto_44342 ) ( SURFACE-AT ?auto_44339 ?auto_44342 ) ( CLEAR ?auto_44339 ) ( LIFTING ?auto_44341 ?auto_44340 ) ( IS-CRATE ?auto_44340 ) ( not ( = ?auto_44339 ?auto_44340 ) ) ( ON ?auto_44338 ?auto_44337 ) ( ON ?auto_44339 ?auto_44338 ) ( not ( = ?auto_44337 ?auto_44338 ) ) ( not ( = ?auto_44337 ?auto_44339 ) ) ( not ( = ?auto_44337 ?auto_44340 ) ) ( not ( = ?auto_44338 ?auto_44339 ) ) ( not ( = ?auto_44338 ?auto_44340 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44339 ?auto_44340 )
      ( MAKE-3CRATE-VERIFY ?auto_44337 ?auto_44338 ?auto_44339 ?auto_44340 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44354 - SURFACE
      ?auto_44355 - SURFACE
      ?auto_44356 - SURFACE
      ?auto_44357 - SURFACE
    )
    :vars
    (
      ?auto_44359 - HOIST
      ?auto_44360 - PLACE
      ?auto_44358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44359 ?auto_44360 ) ( SURFACE-AT ?auto_44356 ?auto_44360 ) ( CLEAR ?auto_44356 ) ( IS-CRATE ?auto_44357 ) ( not ( = ?auto_44356 ?auto_44357 ) ) ( TRUCK-AT ?auto_44358 ?auto_44360 ) ( AVAILABLE ?auto_44359 ) ( IN ?auto_44357 ?auto_44358 ) ( ON ?auto_44356 ?auto_44355 ) ( not ( = ?auto_44355 ?auto_44356 ) ) ( not ( = ?auto_44355 ?auto_44357 ) ) ( ON ?auto_44355 ?auto_44354 ) ( not ( = ?auto_44354 ?auto_44355 ) ) ( not ( = ?auto_44354 ?auto_44356 ) ) ( not ( = ?auto_44354 ?auto_44357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44355 ?auto_44356 ?auto_44357 )
      ( MAKE-3CRATE-VERIFY ?auto_44354 ?auto_44355 ?auto_44356 ?auto_44357 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44375 - SURFACE
      ?auto_44376 - SURFACE
      ?auto_44377 - SURFACE
      ?auto_44378 - SURFACE
    )
    :vars
    (
      ?auto_44381 - HOIST
      ?auto_44382 - PLACE
      ?auto_44380 - TRUCK
      ?auto_44379 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44381 ?auto_44382 ) ( SURFACE-AT ?auto_44377 ?auto_44382 ) ( CLEAR ?auto_44377 ) ( IS-CRATE ?auto_44378 ) ( not ( = ?auto_44377 ?auto_44378 ) ) ( AVAILABLE ?auto_44381 ) ( IN ?auto_44378 ?auto_44380 ) ( ON ?auto_44377 ?auto_44376 ) ( not ( = ?auto_44376 ?auto_44377 ) ) ( not ( = ?auto_44376 ?auto_44378 ) ) ( TRUCK-AT ?auto_44380 ?auto_44379 ) ( not ( = ?auto_44379 ?auto_44382 ) ) ( ON ?auto_44376 ?auto_44375 ) ( not ( = ?auto_44375 ?auto_44376 ) ) ( not ( = ?auto_44375 ?auto_44377 ) ) ( not ( = ?auto_44375 ?auto_44378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44376 ?auto_44377 ?auto_44378 )
      ( MAKE-3CRATE-VERIFY ?auto_44375 ?auto_44376 ?auto_44377 ?auto_44378 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44399 - SURFACE
      ?auto_44400 - SURFACE
      ?auto_44401 - SURFACE
      ?auto_44402 - SURFACE
    )
    :vars
    (
      ?auto_44403 - HOIST
      ?auto_44405 - PLACE
      ?auto_44407 - TRUCK
      ?auto_44406 - PLACE
      ?auto_44404 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44403 ?auto_44405 ) ( SURFACE-AT ?auto_44401 ?auto_44405 ) ( CLEAR ?auto_44401 ) ( IS-CRATE ?auto_44402 ) ( not ( = ?auto_44401 ?auto_44402 ) ) ( AVAILABLE ?auto_44403 ) ( ON ?auto_44401 ?auto_44400 ) ( not ( = ?auto_44400 ?auto_44401 ) ) ( not ( = ?auto_44400 ?auto_44402 ) ) ( TRUCK-AT ?auto_44407 ?auto_44406 ) ( not ( = ?auto_44406 ?auto_44405 ) ) ( HOIST-AT ?auto_44404 ?auto_44406 ) ( LIFTING ?auto_44404 ?auto_44402 ) ( not ( = ?auto_44403 ?auto_44404 ) ) ( ON ?auto_44400 ?auto_44399 ) ( not ( = ?auto_44399 ?auto_44400 ) ) ( not ( = ?auto_44399 ?auto_44401 ) ) ( not ( = ?auto_44399 ?auto_44402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44400 ?auto_44401 ?auto_44402 )
      ( MAKE-3CRATE-VERIFY ?auto_44399 ?auto_44400 ?auto_44401 ?auto_44402 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44426 - SURFACE
      ?auto_44427 - SURFACE
      ?auto_44428 - SURFACE
      ?auto_44429 - SURFACE
    )
    :vars
    (
      ?auto_44432 - HOIST
      ?auto_44435 - PLACE
      ?auto_44430 - TRUCK
      ?auto_44434 - PLACE
      ?auto_44431 - HOIST
      ?auto_44433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44432 ?auto_44435 ) ( SURFACE-AT ?auto_44428 ?auto_44435 ) ( CLEAR ?auto_44428 ) ( IS-CRATE ?auto_44429 ) ( not ( = ?auto_44428 ?auto_44429 ) ) ( AVAILABLE ?auto_44432 ) ( ON ?auto_44428 ?auto_44427 ) ( not ( = ?auto_44427 ?auto_44428 ) ) ( not ( = ?auto_44427 ?auto_44429 ) ) ( TRUCK-AT ?auto_44430 ?auto_44434 ) ( not ( = ?auto_44434 ?auto_44435 ) ) ( HOIST-AT ?auto_44431 ?auto_44434 ) ( not ( = ?auto_44432 ?auto_44431 ) ) ( AVAILABLE ?auto_44431 ) ( SURFACE-AT ?auto_44429 ?auto_44434 ) ( ON ?auto_44429 ?auto_44433 ) ( CLEAR ?auto_44429 ) ( not ( = ?auto_44428 ?auto_44433 ) ) ( not ( = ?auto_44429 ?auto_44433 ) ) ( not ( = ?auto_44427 ?auto_44433 ) ) ( ON ?auto_44427 ?auto_44426 ) ( not ( = ?auto_44426 ?auto_44427 ) ) ( not ( = ?auto_44426 ?auto_44428 ) ) ( not ( = ?auto_44426 ?auto_44429 ) ) ( not ( = ?auto_44426 ?auto_44433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44427 ?auto_44428 ?auto_44429 )
      ( MAKE-3CRATE-VERIFY ?auto_44426 ?auto_44427 ?auto_44428 ?auto_44429 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44454 - SURFACE
      ?auto_44455 - SURFACE
      ?auto_44456 - SURFACE
      ?auto_44457 - SURFACE
    )
    :vars
    (
      ?auto_44458 - HOIST
      ?auto_44462 - PLACE
      ?auto_44461 - PLACE
      ?auto_44459 - HOIST
      ?auto_44460 - SURFACE
      ?auto_44463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44458 ?auto_44462 ) ( SURFACE-AT ?auto_44456 ?auto_44462 ) ( CLEAR ?auto_44456 ) ( IS-CRATE ?auto_44457 ) ( not ( = ?auto_44456 ?auto_44457 ) ) ( AVAILABLE ?auto_44458 ) ( ON ?auto_44456 ?auto_44455 ) ( not ( = ?auto_44455 ?auto_44456 ) ) ( not ( = ?auto_44455 ?auto_44457 ) ) ( not ( = ?auto_44461 ?auto_44462 ) ) ( HOIST-AT ?auto_44459 ?auto_44461 ) ( not ( = ?auto_44458 ?auto_44459 ) ) ( AVAILABLE ?auto_44459 ) ( SURFACE-AT ?auto_44457 ?auto_44461 ) ( ON ?auto_44457 ?auto_44460 ) ( CLEAR ?auto_44457 ) ( not ( = ?auto_44456 ?auto_44460 ) ) ( not ( = ?auto_44457 ?auto_44460 ) ) ( not ( = ?auto_44455 ?auto_44460 ) ) ( TRUCK-AT ?auto_44463 ?auto_44462 ) ( ON ?auto_44455 ?auto_44454 ) ( not ( = ?auto_44454 ?auto_44455 ) ) ( not ( = ?auto_44454 ?auto_44456 ) ) ( not ( = ?auto_44454 ?auto_44457 ) ) ( not ( = ?auto_44454 ?auto_44460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44455 ?auto_44456 ?auto_44457 )
      ( MAKE-3CRATE-VERIFY ?auto_44454 ?auto_44455 ?auto_44456 ?auto_44457 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44482 - SURFACE
      ?auto_44483 - SURFACE
      ?auto_44484 - SURFACE
      ?auto_44485 - SURFACE
    )
    :vars
    (
      ?auto_44491 - HOIST
      ?auto_44488 - PLACE
      ?auto_44489 - PLACE
      ?auto_44490 - HOIST
      ?auto_44486 - SURFACE
      ?auto_44487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44491 ?auto_44488 ) ( IS-CRATE ?auto_44485 ) ( not ( = ?auto_44484 ?auto_44485 ) ) ( not ( = ?auto_44483 ?auto_44484 ) ) ( not ( = ?auto_44483 ?auto_44485 ) ) ( not ( = ?auto_44489 ?auto_44488 ) ) ( HOIST-AT ?auto_44490 ?auto_44489 ) ( not ( = ?auto_44491 ?auto_44490 ) ) ( AVAILABLE ?auto_44490 ) ( SURFACE-AT ?auto_44485 ?auto_44489 ) ( ON ?auto_44485 ?auto_44486 ) ( CLEAR ?auto_44485 ) ( not ( = ?auto_44484 ?auto_44486 ) ) ( not ( = ?auto_44485 ?auto_44486 ) ) ( not ( = ?auto_44483 ?auto_44486 ) ) ( TRUCK-AT ?auto_44487 ?auto_44488 ) ( SURFACE-AT ?auto_44483 ?auto_44488 ) ( CLEAR ?auto_44483 ) ( LIFTING ?auto_44491 ?auto_44484 ) ( IS-CRATE ?auto_44484 ) ( ON ?auto_44483 ?auto_44482 ) ( not ( = ?auto_44482 ?auto_44483 ) ) ( not ( = ?auto_44482 ?auto_44484 ) ) ( not ( = ?auto_44482 ?auto_44485 ) ) ( not ( = ?auto_44482 ?auto_44486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44483 ?auto_44484 ?auto_44485 )
      ( MAKE-3CRATE-VERIFY ?auto_44482 ?auto_44483 ?auto_44484 ?auto_44485 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_44510 - SURFACE
      ?auto_44511 - SURFACE
      ?auto_44512 - SURFACE
      ?auto_44513 - SURFACE
    )
    :vars
    (
      ?auto_44515 - HOIST
      ?auto_44519 - PLACE
      ?auto_44517 - PLACE
      ?auto_44518 - HOIST
      ?auto_44516 - SURFACE
      ?auto_44514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44515 ?auto_44519 ) ( IS-CRATE ?auto_44513 ) ( not ( = ?auto_44512 ?auto_44513 ) ) ( not ( = ?auto_44511 ?auto_44512 ) ) ( not ( = ?auto_44511 ?auto_44513 ) ) ( not ( = ?auto_44517 ?auto_44519 ) ) ( HOIST-AT ?auto_44518 ?auto_44517 ) ( not ( = ?auto_44515 ?auto_44518 ) ) ( AVAILABLE ?auto_44518 ) ( SURFACE-AT ?auto_44513 ?auto_44517 ) ( ON ?auto_44513 ?auto_44516 ) ( CLEAR ?auto_44513 ) ( not ( = ?auto_44512 ?auto_44516 ) ) ( not ( = ?auto_44513 ?auto_44516 ) ) ( not ( = ?auto_44511 ?auto_44516 ) ) ( TRUCK-AT ?auto_44514 ?auto_44519 ) ( SURFACE-AT ?auto_44511 ?auto_44519 ) ( CLEAR ?auto_44511 ) ( IS-CRATE ?auto_44512 ) ( AVAILABLE ?auto_44515 ) ( IN ?auto_44512 ?auto_44514 ) ( ON ?auto_44511 ?auto_44510 ) ( not ( = ?auto_44510 ?auto_44511 ) ) ( not ( = ?auto_44510 ?auto_44512 ) ) ( not ( = ?auto_44510 ?auto_44513 ) ) ( not ( = ?auto_44510 ?auto_44516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44511 ?auto_44512 ?auto_44513 )
      ( MAKE-3CRATE-VERIFY ?auto_44510 ?auto_44511 ?auto_44512 ?auto_44513 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44801 - SURFACE
      ?auto_44802 - SURFACE
      ?auto_44803 - SURFACE
      ?auto_44804 - SURFACE
      ?auto_44805 - SURFACE
    )
    :vars
    (
      ?auto_44807 - HOIST
      ?auto_44806 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44807 ?auto_44806 ) ( SURFACE-AT ?auto_44804 ?auto_44806 ) ( CLEAR ?auto_44804 ) ( LIFTING ?auto_44807 ?auto_44805 ) ( IS-CRATE ?auto_44805 ) ( not ( = ?auto_44804 ?auto_44805 ) ) ( ON ?auto_44802 ?auto_44801 ) ( ON ?auto_44803 ?auto_44802 ) ( ON ?auto_44804 ?auto_44803 ) ( not ( = ?auto_44801 ?auto_44802 ) ) ( not ( = ?auto_44801 ?auto_44803 ) ) ( not ( = ?auto_44801 ?auto_44804 ) ) ( not ( = ?auto_44801 ?auto_44805 ) ) ( not ( = ?auto_44802 ?auto_44803 ) ) ( not ( = ?auto_44802 ?auto_44804 ) ) ( not ( = ?auto_44802 ?auto_44805 ) ) ( not ( = ?auto_44803 ?auto_44804 ) ) ( not ( = ?auto_44803 ?auto_44805 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_44804 ?auto_44805 )
      ( MAKE-4CRATE-VERIFY ?auto_44801 ?auto_44802 ?auto_44803 ?auto_44804 ?auto_44805 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44826 - SURFACE
      ?auto_44827 - SURFACE
      ?auto_44828 - SURFACE
      ?auto_44829 - SURFACE
      ?auto_44830 - SURFACE
    )
    :vars
    (
      ?auto_44831 - HOIST
      ?auto_44832 - PLACE
      ?auto_44833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44831 ?auto_44832 ) ( SURFACE-AT ?auto_44829 ?auto_44832 ) ( CLEAR ?auto_44829 ) ( IS-CRATE ?auto_44830 ) ( not ( = ?auto_44829 ?auto_44830 ) ) ( TRUCK-AT ?auto_44833 ?auto_44832 ) ( AVAILABLE ?auto_44831 ) ( IN ?auto_44830 ?auto_44833 ) ( ON ?auto_44829 ?auto_44828 ) ( not ( = ?auto_44828 ?auto_44829 ) ) ( not ( = ?auto_44828 ?auto_44830 ) ) ( ON ?auto_44827 ?auto_44826 ) ( ON ?auto_44828 ?auto_44827 ) ( not ( = ?auto_44826 ?auto_44827 ) ) ( not ( = ?auto_44826 ?auto_44828 ) ) ( not ( = ?auto_44826 ?auto_44829 ) ) ( not ( = ?auto_44826 ?auto_44830 ) ) ( not ( = ?auto_44827 ?auto_44828 ) ) ( not ( = ?auto_44827 ?auto_44829 ) ) ( not ( = ?auto_44827 ?auto_44830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44828 ?auto_44829 ?auto_44830 )
      ( MAKE-4CRATE-VERIFY ?auto_44826 ?auto_44827 ?auto_44828 ?auto_44829 ?auto_44830 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44856 - SURFACE
      ?auto_44857 - SURFACE
      ?auto_44858 - SURFACE
      ?auto_44859 - SURFACE
      ?auto_44860 - SURFACE
    )
    :vars
    (
      ?auto_44863 - HOIST
      ?auto_44861 - PLACE
      ?auto_44862 - TRUCK
      ?auto_44864 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44863 ?auto_44861 ) ( SURFACE-AT ?auto_44859 ?auto_44861 ) ( CLEAR ?auto_44859 ) ( IS-CRATE ?auto_44860 ) ( not ( = ?auto_44859 ?auto_44860 ) ) ( AVAILABLE ?auto_44863 ) ( IN ?auto_44860 ?auto_44862 ) ( ON ?auto_44859 ?auto_44858 ) ( not ( = ?auto_44858 ?auto_44859 ) ) ( not ( = ?auto_44858 ?auto_44860 ) ) ( TRUCK-AT ?auto_44862 ?auto_44864 ) ( not ( = ?auto_44864 ?auto_44861 ) ) ( ON ?auto_44857 ?auto_44856 ) ( ON ?auto_44858 ?auto_44857 ) ( not ( = ?auto_44856 ?auto_44857 ) ) ( not ( = ?auto_44856 ?auto_44858 ) ) ( not ( = ?auto_44856 ?auto_44859 ) ) ( not ( = ?auto_44856 ?auto_44860 ) ) ( not ( = ?auto_44857 ?auto_44858 ) ) ( not ( = ?auto_44857 ?auto_44859 ) ) ( not ( = ?auto_44857 ?auto_44860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44858 ?auto_44859 ?auto_44860 )
      ( MAKE-4CRATE-VERIFY ?auto_44856 ?auto_44857 ?auto_44858 ?auto_44859 ?auto_44860 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44890 - SURFACE
      ?auto_44891 - SURFACE
      ?auto_44892 - SURFACE
      ?auto_44893 - SURFACE
      ?auto_44894 - SURFACE
    )
    :vars
    (
      ?auto_44897 - HOIST
      ?auto_44895 - PLACE
      ?auto_44898 - TRUCK
      ?auto_44896 - PLACE
      ?auto_44899 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_44897 ?auto_44895 ) ( SURFACE-AT ?auto_44893 ?auto_44895 ) ( CLEAR ?auto_44893 ) ( IS-CRATE ?auto_44894 ) ( not ( = ?auto_44893 ?auto_44894 ) ) ( AVAILABLE ?auto_44897 ) ( ON ?auto_44893 ?auto_44892 ) ( not ( = ?auto_44892 ?auto_44893 ) ) ( not ( = ?auto_44892 ?auto_44894 ) ) ( TRUCK-AT ?auto_44898 ?auto_44896 ) ( not ( = ?auto_44896 ?auto_44895 ) ) ( HOIST-AT ?auto_44899 ?auto_44896 ) ( LIFTING ?auto_44899 ?auto_44894 ) ( not ( = ?auto_44897 ?auto_44899 ) ) ( ON ?auto_44891 ?auto_44890 ) ( ON ?auto_44892 ?auto_44891 ) ( not ( = ?auto_44890 ?auto_44891 ) ) ( not ( = ?auto_44890 ?auto_44892 ) ) ( not ( = ?auto_44890 ?auto_44893 ) ) ( not ( = ?auto_44890 ?auto_44894 ) ) ( not ( = ?auto_44891 ?auto_44892 ) ) ( not ( = ?auto_44891 ?auto_44893 ) ) ( not ( = ?auto_44891 ?auto_44894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44892 ?auto_44893 ?auto_44894 )
      ( MAKE-4CRATE-VERIFY ?auto_44890 ?auto_44891 ?auto_44892 ?auto_44893 ?auto_44894 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44928 - SURFACE
      ?auto_44929 - SURFACE
      ?auto_44930 - SURFACE
      ?auto_44931 - SURFACE
      ?auto_44932 - SURFACE
    )
    :vars
    (
      ?auto_44933 - HOIST
      ?auto_44936 - PLACE
      ?auto_44937 - TRUCK
      ?auto_44935 - PLACE
      ?auto_44934 - HOIST
      ?auto_44938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44933 ?auto_44936 ) ( SURFACE-AT ?auto_44931 ?auto_44936 ) ( CLEAR ?auto_44931 ) ( IS-CRATE ?auto_44932 ) ( not ( = ?auto_44931 ?auto_44932 ) ) ( AVAILABLE ?auto_44933 ) ( ON ?auto_44931 ?auto_44930 ) ( not ( = ?auto_44930 ?auto_44931 ) ) ( not ( = ?auto_44930 ?auto_44932 ) ) ( TRUCK-AT ?auto_44937 ?auto_44935 ) ( not ( = ?auto_44935 ?auto_44936 ) ) ( HOIST-AT ?auto_44934 ?auto_44935 ) ( not ( = ?auto_44933 ?auto_44934 ) ) ( AVAILABLE ?auto_44934 ) ( SURFACE-AT ?auto_44932 ?auto_44935 ) ( ON ?auto_44932 ?auto_44938 ) ( CLEAR ?auto_44932 ) ( not ( = ?auto_44931 ?auto_44938 ) ) ( not ( = ?auto_44932 ?auto_44938 ) ) ( not ( = ?auto_44930 ?auto_44938 ) ) ( ON ?auto_44929 ?auto_44928 ) ( ON ?auto_44930 ?auto_44929 ) ( not ( = ?auto_44928 ?auto_44929 ) ) ( not ( = ?auto_44928 ?auto_44930 ) ) ( not ( = ?auto_44928 ?auto_44931 ) ) ( not ( = ?auto_44928 ?auto_44932 ) ) ( not ( = ?auto_44928 ?auto_44938 ) ) ( not ( = ?auto_44929 ?auto_44930 ) ) ( not ( = ?auto_44929 ?auto_44931 ) ) ( not ( = ?auto_44929 ?auto_44932 ) ) ( not ( = ?auto_44929 ?auto_44938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44930 ?auto_44931 ?auto_44932 )
      ( MAKE-4CRATE-VERIFY ?auto_44928 ?auto_44929 ?auto_44930 ?auto_44931 ?auto_44932 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_44967 - SURFACE
      ?auto_44968 - SURFACE
      ?auto_44969 - SURFACE
      ?auto_44970 - SURFACE
      ?auto_44971 - SURFACE
    )
    :vars
    (
      ?auto_44977 - HOIST
      ?auto_44976 - PLACE
      ?auto_44975 - PLACE
      ?auto_44974 - HOIST
      ?auto_44973 - SURFACE
      ?auto_44972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44977 ?auto_44976 ) ( SURFACE-AT ?auto_44970 ?auto_44976 ) ( CLEAR ?auto_44970 ) ( IS-CRATE ?auto_44971 ) ( not ( = ?auto_44970 ?auto_44971 ) ) ( AVAILABLE ?auto_44977 ) ( ON ?auto_44970 ?auto_44969 ) ( not ( = ?auto_44969 ?auto_44970 ) ) ( not ( = ?auto_44969 ?auto_44971 ) ) ( not ( = ?auto_44975 ?auto_44976 ) ) ( HOIST-AT ?auto_44974 ?auto_44975 ) ( not ( = ?auto_44977 ?auto_44974 ) ) ( AVAILABLE ?auto_44974 ) ( SURFACE-AT ?auto_44971 ?auto_44975 ) ( ON ?auto_44971 ?auto_44973 ) ( CLEAR ?auto_44971 ) ( not ( = ?auto_44970 ?auto_44973 ) ) ( not ( = ?auto_44971 ?auto_44973 ) ) ( not ( = ?auto_44969 ?auto_44973 ) ) ( TRUCK-AT ?auto_44972 ?auto_44976 ) ( ON ?auto_44968 ?auto_44967 ) ( ON ?auto_44969 ?auto_44968 ) ( not ( = ?auto_44967 ?auto_44968 ) ) ( not ( = ?auto_44967 ?auto_44969 ) ) ( not ( = ?auto_44967 ?auto_44970 ) ) ( not ( = ?auto_44967 ?auto_44971 ) ) ( not ( = ?auto_44967 ?auto_44973 ) ) ( not ( = ?auto_44968 ?auto_44969 ) ) ( not ( = ?auto_44968 ?auto_44970 ) ) ( not ( = ?auto_44968 ?auto_44971 ) ) ( not ( = ?auto_44968 ?auto_44973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_44969 ?auto_44970 ?auto_44971 )
      ( MAKE-4CRATE-VERIFY ?auto_44967 ?auto_44968 ?auto_44969 ?auto_44970 ?auto_44971 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_45006 - SURFACE
      ?auto_45007 - SURFACE
      ?auto_45008 - SURFACE
      ?auto_45009 - SURFACE
      ?auto_45010 - SURFACE
    )
    :vars
    (
      ?auto_45015 - HOIST
      ?auto_45012 - PLACE
      ?auto_45016 - PLACE
      ?auto_45013 - HOIST
      ?auto_45011 - SURFACE
      ?auto_45014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45015 ?auto_45012 ) ( IS-CRATE ?auto_45010 ) ( not ( = ?auto_45009 ?auto_45010 ) ) ( not ( = ?auto_45008 ?auto_45009 ) ) ( not ( = ?auto_45008 ?auto_45010 ) ) ( not ( = ?auto_45016 ?auto_45012 ) ) ( HOIST-AT ?auto_45013 ?auto_45016 ) ( not ( = ?auto_45015 ?auto_45013 ) ) ( AVAILABLE ?auto_45013 ) ( SURFACE-AT ?auto_45010 ?auto_45016 ) ( ON ?auto_45010 ?auto_45011 ) ( CLEAR ?auto_45010 ) ( not ( = ?auto_45009 ?auto_45011 ) ) ( not ( = ?auto_45010 ?auto_45011 ) ) ( not ( = ?auto_45008 ?auto_45011 ) ) ( TRUCK-AT ?auto_45014 ?auto_45012 ) ( SURFACE-AT ?auto_45008 ?auto_45012 ) ( CLEAR ?auto_45008 ) ( LIFTING ?auto_45015 ?auto_45009 ) ( IS-CRATE ?auto_45009 ) ( ON ?auto_45007 ?auto_45006 ) ( ON ?auto_45008 ?auto_45007 ) ( not ( = ?auto_45006 ?auto_45007 ) ) ( not ( = ?auto_45006 ?auto_45008 ) ) ( not ( = ?auto_45006 ?auto_45009 ) ) ( not ( = ?auto_45006 ?auto_45010 ) ) ( not ( = ?auto_45006 ?auto_45011 ) ) ( not ( = ?auto_45007 ?auto_45008 ) ) ( not ( = ?auto_45007 ?auto_45009 ) ) ( not ( = ?auto_45007 ?auto_45010 ) ) ( not ( = ?auto_45007 ?auto_45011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45008 ?auto_45009 ?auto_45010 )
      ( MAKE-4CRATE-VERIFY ?auto_45006 ?auto_45007 ?auto_45008 ?auto_45009 ?auto_45010 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_45045 - SURFACE
      ?auto_45046 - SURFACE
      ?auto_45047 - SURFACE
      ?auto_45048 - SURFACE
      ?auto_45049 - SURFACE
    )
    :vars
    (
      ?auto_45051 - HOIST
      ?auto_45055 - PLACE
      ?auto_45054 - PLACE
      ?auto_45052 - HOIST
      ?auto_45053 - SURFACE
      ?auto_45050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45051 ?auto_45055 ) ( IS-CRATE ?auto_45049 ) ( not ( = ?auto_45048 ?auto_45049 ) ) ( not ( = ?auto_45047 ?auto_45048 ) ) ( not ( = ?auto_45047 ?auto_45049 ) ) ( not ( = ?auto_45054 ?auto_45055 ) ) ( HOIST-AT ?auto_45052 ?auto_45054 ) ( not ( = ?auto_45051 ?auto_45052 ) ) ( AVAILABLE ?auto_45052 ) ( SURFACE-AT ?auto_45049 ?auto_45054 ) ( ON ?auto_45049 ?auto_45053 ) ( CLEAR ?auto_45049 ) ( not ( = ?auto_45048 ?auto_45053 ) ) ( not ( = ?auto_45049 ?auto_45053 ) ) ( not ( = ?auto_45047 ?auto_45053 ) ) ( TRUCK-AT ?auto_45050 ?auto_45055 ) ( SURFACE-AT ?auto_45047 ?auto_45055 ) ( CLEAR ?auto_45047 ) ( IS-CRATE ?auto_45048 ) ( AVAILABLE ?auto_45051 ) ( IN ?auto_45048 ?auto_45050 ) ( ON ?auto_45046 ?auto_45045 ) ( ON ?auto_45047 ?auto_45046 ) ( not ( = ?auto_45045 ?auto_45046 ) ) ( not ( = ?auto_45045 ?auto_45047 ) ) ( not ( = ?auto_45045 ?auto_45048 ) ) ( not ( = ?auto_45045 ?auto_45049 ) ) ( not ( = ?auto_45045 ?auto_45053 ) ) ( not ( = ?auto_45046 ?auto_45047 ) ) ( not ( = ?auto_45046 ?auto_45048 ) ) ( not ( = ?auto_45046 ?auto_45049 ) ) ( not ( = ?auto_45046 ?auto_45053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45047 ?auto_45048 ?auto_45049 )
      ( MAKE-4CRATE-VERIFY ?auto_45045 ?auto_45046 ?auto_45047 ?auto_45048 ?auto_45049 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45705 - SURFACE
      ?auto_45706 - SURFACE
      ?auto_45707 - SURFACE
      ?auto_45708 - SURFACE
      ?auto_45709 - SURFACE
      ?auto_45710 - SURFACE
    )
    :vars
    (
      ?auto_45711 - HOIST
      ?auto_45712 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45711 ?auto_45712 ) ( SURFACE-AT ?auto_45709 ?auto_45712 ) ( CLEAR ?auto_45709 ) ( LIFTING ?auto_45711 ?auto_45710 ) ( IS-CRATE ?auto_45710 ) ( not ( = ?auto_45709 ?auto_45710 ) ) ( ON ?auto_45706 ?auto_45705 ) ( ON ?auto_45707 ?auto_45706 ) ( ON ?auto_45708 ?auto_45707 ) ( ON ?auto_45709 ?auto_45708 ) ( not ( = ?auto_45705 ?auto_45706 ) ) ( not ( = ?auto_45705 ?auto_45707 ) ) ( not ( = ?auto_45705 ?auto_45708 ) ) ( not ( = ?auto_45705 ?auto_45709 ) ) ( not ( = ?auto_45705 ?auto_45710 ) ) ( not ( = ?auto_45706 ?auto_45707 ) ) ( not ( = ?auto_45706 ?auto_45708 ) ) ( not ( = ?auto_45706 ?auto_45709 ) ) ( not ( = ?auto_45706 ?auto_45710 ) ) ( not ( = ?auto_45707 ?auto_45708 ) ) ( not ( = ?auto_45707 ?auto_45709 ) ) ( not ( = ?auto_45707 ?auto_45710 ) ) ( not ( = ?auto_45708 ?auto_45709 ) ) ( not ( = ?auto_45708 ?auto_45710 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_45709 ?auto_45710 )
      ( MAKE-5CRATE-VERIFY ?auto_45705 ?auto_45706 ?auto_45707 ?auto_45708 ?auto_45709 ?auto_45710 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45739 - SURFACE
      ?auto_45740 - SURFACE
      ?auto_45741 - SURFACE
      ?auto_45742 - SURFACE
      ?auto_45743 - SURFACE
      ?auto_45744 - SURFACE
    )
    :vars
    (
      ?auto_45747 - HOIST
      ?auto_45745 - PLACE
      ?auto_45746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45747 ?auto_45745 ) ( SURFACE-AT ?auto_45743 ?auto_45745 ) ( CLEAR ?auto_45743 ) ( IS-CRATE ?auto_45744 ) ( not ( = ?auto_45743 ?auto_45744 ) ) ( TRUCK-AT ?auto_45746 ?auto_45745 ) ( AVAILABLE ?auto_45747 ) ( IN ?auto_45744 ?auto_45746 ) ( ON ?auto_45743 ?auto_45742 ) ( not ( = ?auto_45742 ?auto_45743 ) ) ( not ( = ?auto_45742 ?auto_45744 ) ) ( ON ?auto_45740 ?auto_45739 ) ( ON ?auto_45741 ?auto_45740 ) ( ON ?auto_45742 ?auto_45741 ) ( not ( = ?auto_45739 ?auto_45740 ) ) ( not ( = ?auto_45739 ?auto_45741 ) ) ( not ( = ?auto_45739 ?auto_45742 ) ) ( not ( = ?auto_45739 ?auto_45743 ) ) ( not ( = ?auto_45739 ?auto_45744 ) ) ( not ( = ?auto_45740 ?auto_45741 ) ) ( not ( = ?auto_45740 ?auto_45742 ) ) ( not ( = ?auto_45740 ?auto_45743 ) ) ( not ( = ?auto_45740 ?auto_45744 ) ) ( not ( = ?auto_45741 ?auto_45742 ) ) ( not ( = ?auto_45741 ?auto_45743 ) ) ( not ( = ?auto_45741 ?auto_45744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45742 ?auto_45743 ?auto_45744 )
      ( MAKE-5CRATE-VERIFY ?auto_45739 ?auto_45740 ?auto_45741 ?auto_45742 ?auto_45743 ?auto_45744 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45779 - SURFACE
      ?auto_45780 - SURFACE
      ?auto_45781 - SURFACE
      ?auto_45782 - SURFACE
      ?auto_45783 - SURFACE
      ?auto_45784 - SURFACE
    )
    :vars
    (
      ?auto_45787 - HOIST
      ?auto_45788 - PLACE
      ?auto_45786 - TRUCK
      ?auto_45785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45787 ?auto_45788 ) ( SURFACE-AT ?auto_45783 ?auto_45788 ) ( CLEAR ?auto_45783 ) ( IS-CRATE ?auto_45784 ) ( not ( = ?auto_45783 ?auto_45784 ) ) ( AVAILABLE ?auto_45787 ) ( IN ?auto_45784 ?auto_45786 ) ( ON ?auto_45783 ?auto_45782 ) ( not ( = ?auto_45782 ?auto_45783 ) ) ( not ( = ?auto_45782 ?auto_45784 ) ) ( TRUCK-AT ?auto_45786 ?auto_45785 ) ( not ( = ?auto_45785 ?auto_45788 ) ) ( ON ?auto_45780 ?auto_45779 ) ( ON ?auto_45781 ?auto_45780 ) ( ON ?auto_45782 ?auto_45781 ) ( not ( = ?auto_45779 ?auto_45780 ) ) ( not ( = ?auto_45779 ?auto_45781 ) ) ( not ( = ?auto_45779 ?auto_45782 ) ) ( not ( = ?auto_45779 ?auto_45783 ) ) ( not ( = ?auto_45779 ?auto_45784 ) ) ( not ( = ?auto_45780 ?auto_45781 ) ) ( not ( = ?auto_45780 ?auto_45782 ) ) ( not ( = ?auto_45780 ?auto_45783 ) ) ( not ( = ?auto_45780 ?auto_45784 ) ) ( not ( = ?auto_45781 ?auto_45782 ) ) ( not ( = ?auto_45781 ?auto_45783 ) ) ( not ( = ?auto_45781 ?auto_45784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45782 ?auto_45783 ?auto_45784 )
      ( MAKE-5CRATE-VERIFY ?auto_45779 ?auto_45780 ?auto_45781 ?auto_45782 ?auto_45783 ?auto_45784 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45824 - SURFACE
      ?auto_45825 - SURFACE
      ?auto_45826 - SURFACE
      ?auto_45827 - SURFACE
      ?auto_45828 - SURFACE
      ?auto_45829 - SURFACE
    )
    :vars
    (
      ?auto_45833 - HOIST
      ?auto_45831 - PLACE
      ?auto_45830 - TRUCK
      ?auto_45834 - PLACE
      ?auto_45832 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_45833 ?auto_45831 ) ( SURFACE-AT ?auto_45828 ?auto_45831 ) ( CLEAR ?auto_45828 ) ( IS-CRATE ?auto_45829 ) ( not ( = ?auto_45828 ?auto_45829 ) ) ( AVAILABLE ?auto_45833 ) ( ON ?auto_45828 ?auto_45827 ) ( not ( = ?auto_45827 ?auto_45828 ) ) ( not ( = ?auto_45827 ?auto_45829 ) ) ( TRUCK-AT ?auto_45830 ?auto_45834 ) ( not ( = ?auto_45834 ?auto_45831 ) ) ( HOIST-AT ?auto_45832 ?auto_45834 ) ( LIFTING ?auto_45832 ?auto_45829 ) ( not ( = ?auto_45833 ?auto_45832 ) ) ( ON ?auto_45825 ?auto_45824 ) ( ON ?auto_45826 ?auto_45825 ) ( ON ?auto_45827 ?auto_45826 ) ( not ( = ?auto_45824 ?auto_45825 ) ) ( not ( = ?auto_45824 ?auto_45826 ) ) ( not ( = ?auto_45824 ?auto_45827 ) ) ( not ( = ?auto_45824 ?auto_45828 ) ) ( not ( = ?auto_45824 ?auto_45829 ) ) ( not ( = ?auto_45825 ?auto_45826 ) ) ( not ( = ?auto_45825 ?auto_45827 ) ) ( not ( = ?auto_45825 ?auto_45828 ) ) ( not ( = ?auto_45825 ?auto_45829 ) ) ( not ( = ?auto_45826 ?auto_45827 ) ) ( not ( = ?auto_45826 ?auto_45828 ) ) ( not ( = ?auto_45826 ?auto_45829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45827 ?auto_45828 ?auto_45829 )
      ( MAKE-5CRATE-VERIFY ?auto_45824 ?auto_45825 ?auto_45826 ?auto_45827 ?auto_45828 ?auto_45829 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45874 - SURFACE
      ?auto_45875 - SURFACE
      ?auto_45876 - SURFACE
      ?auto_45877 - SURFACE
      ?auto_45878 - SURFACE
      ?auto_45879 - SURFACE
    )
    :vars
    (
      ?auto_45883 - HOIST
      ?auto_45882 - PLACE
      ?auto_45885 - TRUCK
      ?auto_45881 - PLACE
      ?auto_45880 - HOIST
      ?auto_45884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_45883 ?auto_45882 ) ( SURFACE-AT ?auto_45878 ?auto_45882 ) ( CLEAR ?auto_45878 ) ( IS-CRATE ?auto_45879 ) ( not ( = ?auto_45878 ?auto_45879 ) ) ( AVAILABLE ?auto_45883 ) ( ON ?auto_45878 ?auto_45877 ) ( not ( = ?auto_45877 ?auto_45878 ) ) ( not ( = ?auto_45877 ?auto_45879 ) ) ( TRUCK-AT ?auto_45885 ?auto_45881 ) ( not ( = ?auto_45881 ?auto_45882 ) ) ( HOIST-AT ?auto_45880 ?auto_45881 ) ( not ( = ?auto_45883 ?auto_45880 ) ) ( AVAILABLE ?auto_45880 ) ( SURFACE-AT ?auto_45879 ?auto_45881 ) ( ON ?auto_45879 ?auto_45884 ) ( CLEAR ?auto_45879 ) ( not ( = ?auto_45878 ?auto_45884 ) ) ( not ( = ?auto_45879 ?auto_45884 ) ) ( not ( = ?auto_45877 ?auto_45884 ) ) ( ON ?auto_45875 ?auto_45874 ) ( ON ?auto_45876 ?auto_45875 ) ( ON ?auto_45877 ?auto_45876 ) ( not ( = ?auto_45874 ?auto_45875 ) ) ( not ( = ?auto_45874 ?auto_45876 ) ) ( not ( = ?auto_45874 ?auto_45877 ) ) ( not ( = ?auto_45874 ?auto_45878 ) ) ( not ( = ?auto_45874 ?auto_45879 ) ) ( not ( = ?auto_45874 ?auto_45884 ) ) ( not ( = ?auto_45875 ?auto_45876 ) ) ( not ( = ?auto_45875 ?auto_45877 ) ) ( not ( = ?auto_45875 ?auto_45878 ) ) ( not ( = ?auto_45875 ?auto_45879 ) ) ( not ( = ?auto_45875 ?auto_45884 ) ) ( not ( = ?auto_45876 ?auto_45877 ) ) ( not ( = ?auto_45876 ?auto_45878 ) ) ( not ( = ?auto_45876 ?auto_45879 ) ) ( not ( = ?auto_45876 ?auto_45884 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45877 ?auto_45878 ?auto_45879 )
      ( MAKE-5CRATE-VERIFY ?auto_45874 ?auto_45875 ?auto_45876 ?auto_45877 ?auto_45878 ?auto_45879 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45925 - SURFACE
      ?auto_45926 - SURFACE
      ?auto_45927 - SURFACE
      ?auto_45928 - SURFACE
      ?auto_45929 - SURFACE
      ?auto_45930 - SURFACE
    )
    :vars
    (
      ?auto_45936 - HOIST
      ?auto_45935 - PLACE
      ?auto_45934 - PLACE
      ?auto_45931 - HOIST
      ?auto_45932 - SURFACE
      ?auto_45933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45936 ?auto_45935 ) ( SURFACE-AT ?auto_45929 ?auto_45935 ) ( CLEAR ?auto_45929 ) ( IS-CRATE ?auto_45930 ) ( not ( = ?auto_45929 ?auto_45930 ) ) ( AVAILABLE ?auto_45936 ) ( ON ?auto_45929 ?auto_45928 ) ( not ( = ?auto_45928 ?auto_45929 ) ) ( not ( = ?auto_45928 ?auto_45930 ) ) ( not ( = ?auto_45934 ?auto_45935 ) ) ( HOIST-AT ?auto_45931 ?auto_45934 ) ( not ( = ?auto_45936 ?auto_45931 ) ) ( AVAILABLE ?auto_45931 ) ( SURFACE-AT ?auto_45930 ?auto_45934 ) ( ON ?auto_45930 ?auto_45932 ) ( CLEAR ?auto_45930 ) ( not ( = ?auto_45929 ?auto_45932 ) ) ( not ( = ?auto_45930 ?auto_45932 ) ) ( not ( = ?auto_45928 ?auto_45932 ) ) ( TRUCK-AT ?auto_45933 ?auto_45935 ) ( ON ?auto_45926 ?auto_45925 ) ( ON ?auto_45927 ?auto_45926 ) ( ON ?auto_45928 ?auto_45927 ) ( not ( = ?auto_45925 ?auto_45926 ) ) ( not ( = ?auto_45925 ?auto_45927 ) ) ( not ( = ?auto_45925 ?auto_45928 ) ) ( not ( = ?auto_45925 ?auto_45929 ) ) ( not ( = ?auto_45925 ?auto_45930 ) ) ( not ( = ?auto_45925 ?auto_45932 ) ) ( not ( = ?auto_45926 ?auto_45927 ) ) ( not ( = ?auto_45926 ?auto_45928 ) ) ( not ( = ?auto_45926 ?auto_45929 ) ) ( not ( = ?auto_45926 ?auto_45930 ) ) ( not ( = ?auto_45926 ?auto_45932 ) ) ( not ( = ?auto_45927 ?auto_45928 ) ) ( not ( = ?auto_45927 ?auto_45929 ) ) ( not ( = ?auto_45927 ?auto_45930 ) ) ( not ( = ?auto_45927 ?auto_45932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45928 ?auto_45929 ?auto_45930 )
      ( MAKE-5CRATE-VERIFY ?auto_45925 ?auto_45926 ?auto_45927 ?auto_45928 ?auto_45929 ?auto_45930 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_45976 - SURFACE
      ?auto_45977 - SURFACE
      ?auto_45978 - SURFACE
      ?auto_45979 - SURFACE
      ?auto_45980 - SURFACE
      ?auto_45981 - SURFACE
    )
    :vars
    (
      ?auto_45986 - HOIST
      ?auto_45982 - PLACE
      ?auto_45984 - PLACE
      ?auto_45985 - HOIST
      ?auto_45987 - SURFACE
      ?auto_45983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_45986 ?auto_45982 ) ( IS-CRATE ?auto_45981 ) ( not ( = ?auto_45980 ?auto_45981 ) ) ( not ( = ?auto_45979 ?auto_45980 ) ) ( not ( = ?auto_45979 ?auto_45981 ) ) ( not ( = ?auto_45984 ?auto_45982 ) ) ( HOIST-AT ?auto_45985 ?auto_45984 ) ( not ( = ?auto_45986 ?auto_45985 ) ) ( AVAILABLE ?auto_45985 ) ( SURFACE-AT ?auto_45981 ?auto_45984 ) ( ON ?auto_45981 ?auto_45987 ) ( CLEAR ?auto_45981 ) ( not ( = ?auto_45980 ?auto_45987 ) ) ( not ( = ?auto_45981 ?auto_45987 ) ) ( not ( = ?auto_45979 ?auto_45987 ) ) ( TRUCK-AT ?auto_45983 ?auto_45982 ) ( SURFACE-AT ?auto_45979 ?auto_45982 ) ( CLEAR ?auto_45979 ) ( LIFTING ?auto_45986 ?auto_45980 ) ( IS-CRATE ?auto_45980 ) ( ON ?auto_45977 ?auto_45976 ) ( ON ?auto_45978 ?auto_45977 ) ( ON ?auto_45979 ?auto_45978 ) ( not ( = ?auto_45976 ?auto_45977 ) ) ( not ( = ?auto_45976 ?auto_45978 ) ) ( not ( = ?auto_45976 ?auto_45979 ) ) ( not ( = ?auto_45976 ?auto_45980 ) ) ( not ( = ?auto_45976 ?auto_45981 ) ) ( not ( = ?auto_45976 ?auto_45987 ) ) ( not ( = ?auto_45977 ?auto_45978 ) ) ( not ( = ?auto_45977 ?auto_45979 ) ) ( not ( = ?auto_45977 ?auto_45980 ) ) ( not ( = ?auto_45977 ?auto_45981 ) ) ( not ( = ?auto_45977 ?auto_45987 ) ) ( not ( = ?auto_45978 ?auto_45979 ) ) ( not ( = ?auto_45978 ?auto_45980 ) ) ( not ( = ?auto_45978 ?auto_45981 ) ) ( not ( = ?auto_45978 ?auto_45987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_45979 ?auto_45980 ?auto_45981 )
      ( MAKE-5CRATE-VERIFY ?auto_45976 ?auto_45977 ?auto_45978 ?auto_45979 ?auto_45980 ?auto_45981 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_46027 - SURFACE
      ?auto_46028 - SURFACE
      ?auto_46029 - SURFACE
      ?auto_46030 - SURFACE
      ?auto_46031 - SURFACE
      ?auto_46032 - SURFACE
    )
    :vars
    (
      ?auto_46036 - HOIST
      ?auto_46035 - PLACE
      ?auto_46034 - PLACE
      ?auto_46033 - HOIST
      ?auto_46038 - SURFACE
      ?auto_46037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_46036 ?auto_46035 ) ( IS-CRATE ?auto_46032 ) ( not ( = ?auto_46031 ?auto_46032 ) ) ( not ( = ?auto_46030 ?auto_46031 ) ) ( not ( = ?auto_46030 ?auto_46032 ) ) ( not ( = ?auto_46034 ?auto_46035 ) ) ( HOIST-AT ?auto_46033 ?auto_46034 ) ( not ( = ?auto_46036 ?auto_46033 ) ) ( AVAILABLE ?auto_46033 ) ( SURFACE-AT ?auto_46032 ?auto_46034 ) ( ON ?auto_46032 ?auto_46038 ) ( CLEAR ?auto_46032 ) ( not ( = ?auto_46031 ?auto_46038 ) ) ( not ( = ?auto_46032 ?auto_46038 ) ) ( not ( = ?auto_46030 ?auto_46038 ) ) ( TRUCK-AT ?auto_46037 ?auto_46035 ) ( SURFACE-AT ?auto_46030 ?auto_46035 ) ( CLEAR ?auto_46030 ) ( IS-CRATE ?auto_46031 ) ( AVAILABLE ?auto_46036 ) ( IN ?auto_46031 ?auto_46037 ) ( ON ?auto_46028 ?auto_46027 ) ( ON ?auto_46029 ?auto_46028 ) ( ON ?auto_46030 ?auto_46029 ) ( not ( = ?auto_46027 ?auto_46028 ) ) ( not ( = ?auto_46027 ?auto_46029 ) ) ( not ( = ?auto_46027 ?auto_46030 ) ) ( not ( = ?auto_46027 ?auto_46031 ) ) ( not ( = ?auto_46027 ?auto_46032 ) ) ( not ( = ?auto_46027 ?auto_46038 ) ) ( not ( = ?auto_46028 ?auto_46029 ) ) ( not ( = ?auto_46028 ?auto_46030 ) ) ( not ( = ?auto_46028 ?auto_46031 ) ) ( not ( = ?auto_46028 ?auto_46032 ) ) ( not ( = ?auto_46028 ?auto_46038 ) ) ( not ( = ?auto_46029 ?auto_46030 ) ) ( not ( = ?auto_46029 ?auto_46031 ) ) ( not ( = ?auto_46029 ?auto_46032 ) ) ( not ( = ?auto_46029 ?auto_46038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_46030 ?auto_46031 ?auto_46032 )
      ( MAKE-5CRATE-VERIFY ?auto_46027 ?auto_46028 ?auto_46029 ?auto_46030 ?auto_46031 ?auto_46032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_46395 - SURFACE
      ?auto_46396 - SURFACE
    )
    :vars
    (
      ?auto_46401 - HOIST
      ?auto_46398 - PLACE
      ?auto_46399 - SURFACE
      ?auto_46400 - TRUCK
      ?auto_46397 - PLACE
      ?auto_46402 - HOIST
      ?auto_46403 - SURFACE
      ?auto_46404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_46401 ?auto_46398 ) ( SURFACE-AT ?auto_46395 ?auto_46398 ) ( CLEAR ?auto_46395 ) ( IS-CRATE ?auto_46396 ) ( not ( = ?auto_46395 ?auto_46396 ) ) ( AVAILABLE ?auto_46401 ) ( ON ?auto_46395 ?auto_46399 ) ( not ( = ?auto_46399 ?auto_46395 ) ) ( not ( = ?auto_46399 ?auto_46396 ) ) ( TRUCK-AT ?auto_46400 ?auto_46397 ) ( not ( = ?auto_46397 ?auto_46398 ) ) ( HOIST-AT ?auto_46402 ?auto_46397 ) ( not ( = ?auto_46401 ?auto_46402 ) ) ( SURFACE-AT ?auto_46396 ?auto_46397 ) ( ON ?auto_46396 ?auto_46403 ) ( CLEAR ?auto_46396 ) ( not ( = ?auto_46395 ?auto_46403 ) ) ( not ( = ?auto_46396 ?auto_46403 ) ) ( not ( = ?auto_46399 ?auto_46403 ) ) ( LIFTING ?auto_46402 ?auto_46404 ) ( IS-CRATE ?auto_46404 ) ( not ( = ?auto_46395 ?auto_46404 ) ) ( not ( = ?auto_46396 ?auto_46404 ) ) ( not ( = ?auto_46399 ?auto_46404 ) ) ( not ( = ?auto_46403 ?auto_46404 ) ) )
    :subtasks
    ( ( !LOAD ?auto_46402 ?auto_46404 ?auto_46400 ?auto_46397 )
      ( MAKE-1CRATE ?auto_46395 ?auto_46396 )
      ( MAKE-1CRATE-VERIFY ?auto_46395 ?auto_46396 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47232 - SURFACE
      ?auto_47233 - SURFACE
      ?auto_47234 - SURFACE
      ?auto_47235 - SURFACE
      ?auto_47236 - SURFACE
      ?auto_47237 - SURFACE
      ?auto_47238 - SURFACE
    )
    :vars
    (
      ?auto_47240 - HOIST
      ?auto_47239 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47240 ?auto_47239 ) ( SURFACE-AT ?auto_47237 ?auto_47239 ) ( CLEAR ?auto_47237 ) ( LIFTING ?auto_47240 ?auto_47238 ) ( IS-CRATE ?auto_47238 ) ( not ( = ?auto_47237 ?auto_47238 ) ) ( ON ?auto_47233 ?auto_47232 ) ( ON ?auto_47234 ?auto_47233 ) ( ON ?auto_47235 ?auto_47234 ) ( ON ?auto_47236 ?auto_47235 ) ( ON ?auto_47237 ?auto_47236 ) ( not ( = ?auto_47232 ?auto_47233 ) ) ( not ( = ?auto_47232 ?auto_47234 ) ) ( not ( = ?auto_47232 ?auto_47235 ) ) ( not ( = ?auto_47232 ?auto_47236 ) ) ( not ( = ?auto_47232 ?auto_47237 ) ) ( not ( = ?auto_47232 ?auto_47238 ) ) ( not ( = ?auto_47233 ?auto_47234 ) ) ( not ( = ?auto_47233 ?auto_47235 ) ) ( not ( = ?auto_47233 ?auto_47236 ) ) ( not ( = ?auto_47233 ?auto_47237 ) ) ( not ( = ?auto_47233 ?auto_47238 ) ) ( not ( = ?auto_47234 ?auto_47235 ) ) ( not ( = ?auto_47234 ?auto_47236 ) ) ( not ( = ?auto_47234 ?auto_47237 ) ) ( not ( = ?auto_47234 ?auto_47238 ) ) ( not ( = ?auto_47235 ?auto_47236 ) ) ( not ( = ?auto_47235 ?auto_47237 ) ) ( not ( = ?auto_47235 ?auto_47238 ) ) ( not ( = ?auto_47236 ?auto_47237 ) ) ( not ( = ?auto_47236 ?auto_47238 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_47237 ?auto_47238 )
      ( MAKE-6CRATE-VERIFY ?auto_47232 ?auto_47233 ?auto_47234 ?auto_47235 ?auto_47236 ?auto_47237 ?auto_47238 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47276 - SURFACE
      ?auto_47277 - SURFACE
      ?auto_47278 - SURFACE
      ?auto_47279 - SURFACE
      ?auto_47280 - SURFACE
      ?auto_47281 - SURFACE
      ?auto_47282 - SURFACE
    )
    :vars
    (
      ?auto_47284 - HOIST
      ?auto_47283 - PLACE
      ?auto_47285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47284 ?auto_47283 ) ( SURFACE-AT ?auto_47281 ?auto_47283 ) ( CLEAR ?auto_47281 ) ( IS-CRATE ?auto_47282 ) ( not ( = ?auto_47281 ?auto_47282 ) ) ( TRUCK-AT ?auto_47285 ?auto_47283 ) ( AVAILABLE ?auto_47284 ) ( IN ?auto_47282 ?auto_47285 ) ( ON ?auto_47281 ?auto_47280 ) ( not ( = ?auto_47280 ?auto_47281 ) ) ( not ( = ?auto_47280 ?auto_47282 ) ) ( ON ?auto_47277 ?auto_47276 ) ( ON ?auto_47278 ?auto_47277 ) ( ON ?auto_47279 ?auto_47278 ) ( ON ?auto_47280 ?auto_47279 ) ( not ( = ?auto_47276 ?auto_47277 ) ) ( not ( = ?auto_47276 ?auto_47278 ) ) ( not ( = ?auto_47276 ?auto_47279 ) ) ( not ( = ?auto_47276 ?auto_47280 ) ) ( not ( = ?auto_47276 ?auto_47281 ) ) ( not ( = ?auto_47276 ?auto_47282 ) ) ( not ( = ?auto_47277 ?auto_47278 ) ) ( not ( = ?auto_47277 ?auto_47279 ) ) ( not ( = ?auto_47277 ?auto_47280 ) ) ( not ( = ?auto_47277 ?auto_47281 ) ) ( not ( = ?auto_47277 ?auto_47282 ) ) ( not ( = ?auto_47278 ?auto_47279 ) ) ( not ( = ?auto_47278 ?auto_47280 ) ) ( not ( = ?auto_47278 ?auto_47281 ) ) ( not ( = ?auto_47278 ?auto_47282 ) ) ( not ( = ?auto_47279 ?auto_47280 ) ) ( not ( = ?auto_47279 ?auto_47281 ) ) ( not ( = ?auto_47279 ?auto_47282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47280 ?auto_47281 ?auto_47282 )
      ( MAKE-6CRATE-VERIFY ?auto_47276 ?auto_47277 ?auto_47278 ?auto_47279 ?auto_47280 ?auto_47281 ?auto_47282 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47327 - SURFACE
      ?auto_47328 - SURFACE
      ?auto_47329 - SURFACE
      ?auto_47330 - SURFACE
      ?auto_47331 - SURFACE
      ?auto_47332 - SURFACE
      ?auto_47333 - SURFACE
    )
    :vars
    (
      ?auto_47335 - HOIST
      ?auto_47337 - PLACE
      ?auto_47336 - TRUCK
      ?auto_47334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47335 ?auto_47337 ) ( SURFACE-AT ?auto_47332 ?auto_47337 ) ( CLEAR ?auto_47332 ) ( IS-CRATE ?auto_47333 ) ( not ( = ?auto_47332 ?auto_47333 ) ) ( AVAILABLE ?auto_47335 ) ( IN ?auto_47333 ?auto_47336 ) ( ON ?auto_47332 ?auto_47331 ) ( not ( = ?auto_47331 ?auto_47332 ) ) ( not ( = ?auto_47331 ?auto_47333 ) ) ( TRUCK-AT ?auto_47336 ?auto_47334 ) ( not ( = ?auto_47334 ?auto_47337 ) ) ( ON ?auto_47328 ?auto_47327 ) ( ON ?auto_47329 ?auto_47328 ) ( ON ?auto_47330 ?auto_47329 ) ( ON ?auto_47331 ?auto_47330 ) ( not ( = ?auto_47327 ?auto_47328 ) ) ( not ( = ?auto_47327 ?auto_47329 ) ) ( not ( = ?auto_47327 ?auto_47330 ) ) ( not ( = ?auto_47327 ?auto_47331 ) ) ( not ( = ?auto_47327 ?auto_47332 ) ) ( not ( = ?auto_47327 ?auto_47333 ) ) ( not ( = ?auto_47328 ?auto_47329 ) ) ( not ( = ?auto_47328 ?auto_47330 ) ) ( not ( = ?auto_47328 ?auto_47331 ) ) ( not ( = ?auto_47328 ?auto_47332 ) ) ( not ( = ?auto_47328 ?auto_47333 ) ) ( not ( = ?auto_47329 ?auto_47330 ) ) ( not ( = ?auto_47329 ?auto_47331 ) ) ( not ( = ?auto_47329 ?auto_47332 ) ) ( not ( = ?auto_47329 ?auto_47333 ) ) ( not ( = ?auto_47330 ?auto_47331 ) ) ( not ( = ?auto_47330 ?auto_47332 ) ) ( not ( = ?auto_47330 ?auto_47333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47331 ?auto_47332 ?auto_47333 )
      ( MAKE-6CRATE-VERIFY ?auto_47327 ?auto_47328 ?auto_47329 ?auto_47330 ?auto_47331 ?auto_47332 ?auto_47333 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47384 - SURFACE
      ?auto_47385 - SURFACE
      ?auto_47386 - SURFACE
      ?auto_47387 - SURFACE
      ?auto_47388 - SURFACE
      ?auto_47389 - SURFACE
      ?auto_47390 - SURFACE
    )
    :vars
    (
      ?auto_47393 - HOIST
      ?auto_47391 - PLACE
      ?auto_47395 - TRUCK
      ?auto_47394 - PLACE
      ?auto_47392 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_47393 ?auto_47391 ) ( SURFACE-AT ?auto_47389 ?auto_47391 ) ( CLEAR ?auto_47389 ) ( IS-CRATE ?auto_47390 ) ( not ( = ?auto_47389 ?auto_47390 ) ) ( AVAILABLE ?auto_47393 ) ( ON ?auto_47389 ?auto_47388 ) ( not ( = ?auto_47388 ?auto_47389 ) ) ( not ( = ?auto_47388 ?auto_47390 ) ) ( TRUCK-AT ?auto_47395 ?auto_47394 ) ( not ( = ?auto_47394 ?auto_47391 ) ) ( HOIST-AT ?auto_47392 ?auto_47394 ) ( LIFTING ?auto_47392 ?auto_47390 ) ( not ( = ?auto_47393 ?auto_47392 ) ) ( ON ?auto_47385 ?auto_47384 ) ( ON ?auto_47386 ?auto_47385 ) ( ON ?auto_47387 ?auto_47386 ) ( ON ?auto_47388 ?auto_47387 ) ( not ( = ?auto_47384 ?auto_47385 ) ) ( not ( = ?auto_47384 ?auto_47386 ) ) ( not ( = ?auto_47384 ?auto_47387 ) ) ( not ( = ?auto_47384 ?auto_47388 ) ) ( not ( = ?auto_47384 ?auto_47389 ) ) ( not ( = ?auto_47384 ?auto_47390 ) ) ( not ( = ?auto_47385 ?auto_47386 ) ) ( not ( = ?auto_47385 ?auto_47387 ) ) ( not ( = ?auto_47385 ?auto_47388 ) ) ( not ( = ?auto_47385 ?auto_47389 ) ) ( not ( = ?auto_47385 ?auto_47390 ) ) ( not ( = ?auto_47386 ?auto_47387 ) ) ( not ( = ?auto_47386 ?auto_47388 ) ) ( not ( = ?auto_47386 ?auto_47389 ) ) ( not ( = ?auto_47386 ?auto_47390 ) ) ( not ( = ?auto_47387 ?auto_47388 ) ) ( not ( = ?auto_47387 ?auto_47389 ) ) ( not ( = ?auto_47387 ?auto_47390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47388 ?auto_47389 ?auto_47390 )
      ( MAKE-6CRATE-VERIFY ?auto_47384 ?auto_47385 ?auto_47386 ?auto_47387 ?auto_47388 ?auto_47389 ?auto_47390 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47447 - SURFACE
      ?auto_47448 - SURFACE
      ?auto_47449 - SURFACE
      ?auto_47450 - SURFACE
      ?auto_47451 - SURFACE
      ?auto_47452 - SURFACE
      ?auto_47453 - SURFACE
    )
    :vars
    (
      ?auto_47456 - HOIST
      ?auto_47458 - PLACE
      ?auto_47457 - TRUCK
      ?auto_47455 - PLACE
      ?auto_47454 - HOIST
      ?auto_47459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47456 ?auto_47458 ) ( SURFACE-AT ?auto_47452 ?auto_47458 ) ( CLEAR ?auto_47452 ) ( IS-CRATE ?auto_47453 ) ( not ( = ?auto_47452 ?auto_47453 ) ) ( AVAILABLE ?auto_47456 ) ( ON ?auto_47452 ?auto_47451 ) ( not ( = ?auto_47451 ?auto_47452 ) ) ( not ( = ?auto_47451 ?auto_47453 ) ) ( TRUCK-AT ?auto_47457 ?auto_47455 ) ( not ( = ?auto_47455 ?auto_47458 ) ) ( HOIST-AT ?auto_47454 ?auto_47455 ) ( not ( = ?auto_47456 ?auto_47454 ) ) ( AVAILABLE ?auto_47454 ) ( SURFACE-AT ?auto_47453 ?auto_47455 ) ( ON ?auto_47453 ?auto_47459 ) ( CLEAR ?auto_47453 ) ( not ( = ?auto_47452 ?auto_47459 ) ) ( not ( = ?auto_47453 ?auto_47459 ) ) ( not ( = ?auto_47451 ?auto_47459 ) ) ( ON ?auto_47448 ?auto_47447 ) ( ON ?auto_47449 ?auto_47448 ) ( ON ?auto_47450 ?auto_47449 ) ( ON ?auto_47451 ?auto_47450 ) ( not ( = ?auto_47447 ?auto_47448 ) ) ( not ( = ?auto_47447 ?auto_47449 ) ) ( not ( = ?auto_47447 ?auto_47450 ) ) ( not ( = ?auto_47447 ?auto_47451 ) ) ( not ( = ?auto_47447 ?auto_47452 ) ) ( not ( = ?auto_47447 ?auto_47453 ) ) ( not ( = ?auto_47447 ?auto_47459 ) ) ( not ( = ?auto_47448 ?auto_47449 ) ) ( not ( = ?auto_47448 ?auto_47450 ) ) ( not ( = ?auto_47448 ?auto_47451 ) ) ( not ( = ?auto_47448 ?auto_47452 ) ) ( not ( = ?auto_47448 ?auto_47453 ) ) ( not ( = ?auto_47448 ?auto_47459 ) ) ( not ( = ?auto_47449 ?auto_47450 ) ) ( not ( = ?auto_47449 ?auto_47451 ) ) ( not ( = ?auto_47449 ?auto_47452 ) ) ( not ( = ?auto_47449 ?auto_47453 ) ) ( not ( = ?auto_47449 ?auto_47459 ) ) ( not ( = ?auto_47450 ?auto_47451 ) ) ( not ( = ?auto_47450 ?auto_47452 ) ) ( not ( = ?auto_47450 ?auto_47453 ) ) ( not ( = ?auto_47450 ?auto_47459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47451 ?auto_47452 ?auto_47453 )
      ( MAKE-6CRATE-VERIFY ?auto_47447 ?auto_47448 ?auto_47449 ?auto_47450 ?auto_47451 ?auto_47452 ?auto_47453 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47511 - SURFACE
      ?auto_47512 - SURFACE
      ?auto_47513 - SURFACE
      ?auto_47514 - SURFACE
      ?auto_47515 - SURFACE
      ?auto_47516 - SURFACE
      ?auto_47517 - SURFACE
    )
    :vars
    (
      ?auto_47522 - HOIST
      ?auto_47520 - PLACE
      ?auto_47519 - PLACE
      ?auto_47518 - HOIST
      ?auto_47523 - SURFACE
      ?auto_47521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47522 ?auto_47520 ) ( SURFACE-AT ?auto_47516 ?auto_47520 ) ( CLEAR ?auto_47516 ) ( IS-CRATE ?auto_47517 ) ( not ( = ?auto_47516 ?auto_47517 ) ) ( AVAILABLE ?auto_47522 ) ( ON ?auto_47516 ?auto_47515 ) ( not ( = ?auto_47515 ?auto_47516 ) ) ( not ( = ?auto_47515 ?auto_47517 ) ) ( not ( = ?auto_47519 ?auto_47520 ) ) ( HOIST-AT ?auto_47518 ?auto_47519 ) ( not ( = ?auto_47522 ?auto_47518 ) ) ( AVAILABLE ?auto_47518 ) ( SURFACE-AT ?auto_47517 ?auto_47519 ) ( ON ?auto_47517 ?auto_47523 ) ( CLEAR ?auto_47517 ) ( not ( = ?auto_47516 ?auto_47523 ) ) ( not ( = ?auto_47517 ?auto_47523 ) ) ( not ( = ?auto_47515 ?auto_47523 ) ) ( TRUCK-AT ?auto_47521 ?auto_47520 ) ( ON ?auto_47512 ?auto_47511 ) ( ON ?auto_47513 ?auto_47512 ) ( ON ?auto_47514 ?auto_47513 ) ( ON ?auto_47515 ?auto_47514 ) ( not ( = ?auto_47511 ?auto_47512 ) ) ( not ( = ?auto_47511 ?auto_47513 ) ) ( not ( = ?auto_47511 ?auto_47514 ) ) ( not ( = ?auto_47511 ?auto_47515 ) ) ( not ( = ?auto_47511 ?auto_47516 ) ) ( not ( = ?auto_47511 ?auto_47517 ) ) ( not ( = ?auto_47511 ?auto_47523 ) ) ( not ( = ?auto_47512 ?auto_47513 ) ) ( not ( = ?auto_47512 ?auto_47514 ) ) ( not ( = ?auto_47512 ?auto_47515 ) ) ( not ( = ?auto_47512 ?auto_47516 ) ) ( not ( = ?auto_47512 ?auto_47517 ) ) ( not ( = ?auto_47512 ?auto_47523 ) ) ( not ( = ?auto_47513 ?auto_47514 ) ) ( not ( = ?auto_47513 ?auto_47515 ) ) ( not ( = ?auto_47513 ?auto_47516 ) ) ( not ( = ?auto_47513 ?auto_47517 ) ) ( not ( = ?auto_47513 ?auto_47523 ) ) ( not ( = ?auto_47514 ?auto_47515 ) ) ( not ( = ?auto_47514 ?auto_47516 ) ) ( not ( = ?auto_47514 ?auto_47517 ) ) ( not ( = ?auto_47514 ?auto_47523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47515 ?auto_47516 ?auto_47517 )
      ( MAKE-6CRATE-VERIFY ?auto_47511 ?auto_47512 ?auto_47513 ?auto_47514 ?auto_47515 ?auto_47516 ?auto_47517 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47575 - SURFACE
      ?auto_47576 - SURFACE
      ?auto_47577 - SURFACE
      ?auto_47578 - SURFACE
      ?auto_47579 - SURFACE
      ?auto_47580 - SURFACE
      ?auto_47581 - SURFACE
    )
    :vars
    (
      ?auto_47582 - HOIST
      ?auto_47586 - PLACE
      ?auto_47584 - PLACE
      ?auto_47583 - HOIST
      ?auto_47587 - SURFACE
      ?auto_47585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47582 ?auto_47586 ) ( IS-CRATE ?auto_47581 ) ( not ( = ?auto_47580 ?auto_47581 ) ) ( not ( = ?auto_47579 ?auto_47580 ) ) ( not ( = ?auto_47579 ?auto_47581 ) ) ( not ( = ?auto_47584 ?auto_47586 ) ) ( HOIST-AT ?auto_47583 ?auto_47584 ) ( not ( = ?auto_47582 ?auto_47583 ) ) ( AVAILABLE ?auto_47583 ) ( SURFACE-AT ?auto_47581 ?auto_47584 ) ( ON ?auto_47581 ?auto_47587 ) ( CLEAR ?auto_47581 ) ( not ( = ?auto_47580 ?auto_47587 ) ) ( not ( = ?auto_47581 ?auto_47587 ) ) ( not ( = ?auto_47579 ?auto_47587 ) ) ( TRUCK-AT ?auto_47585 ?auto_47586 ) ( SURFACE-AT ?auto_47579 ?auto_47586 ) ( CLEAR ?auto_47579 ) ( LIFTING ?auto_47582 ?auto_47580 ) ( IS-CRATE ?auto_47580 ) ( ON ?auto_47576 ?auto_47575 ) ( ON ?auto_47577 ?auto_47576 ) ( ON ?auto_47578 ?auto_47577 ) ( ON ?auto_47579 ?auto_47578 ) ( not ( = ?auto_47575 ?auto_47576 ) ) ( not ( = ?auto_47575 ?auto_47577 ) ) ( not ( = ?auto_47575 ?auto_47578 ) ) ( not ( = ?auto_47575 ?auto_47579 ) ) ( not ( = ?auto_47575 ?auto_47580 ) ) ( not ( = ?auto_47575 ?auto_47581 ) ) ( not ( = ?auto_47575 ?auto_47587 ) ) ( not ( = ?auto_47576 ?auto_47577 ) ) ( not ( = ?auto_47576 ?auto_47578 ) ) ( not ( = ?auto_47576 ?auto_47579 ) ) ( not ( = ?auto_47576 ?auto_47580 ) ) ( not ( = ?auto_47576 ?auto_47581 ) ) ( not ( = ?auto_47576 ?auto_47587 ) ) ( not ( = ?auto_47577 ?auto_47578 ) ) ( not ( = ?auto_47577 ?auto_47579 ) ) ( not ( = ?auto_47577 ?auto_47580 ) ) ( not ( = ?auto_47577 ?auto_47581 ) ) ( not ( = ?auto_47577 ?auto_47587 ) ) ( not ( = ?auto_47578 ?auto_47579 ) ) ( not ( = ?auto_47578 ?auto_47580 ) ) ( not ( = ?auto_47578 ?auto_47581 ) ) ( not ( = ?auto_47578 ?auto_47587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47579 ?auto_47580 ?auto_47581 )
      ( MAKE-6CRATE-VERIFY ?auto_47575 ?auto_47576 ?auto_47577 ?auto_47578 ?auto_47579 ?auto_47580 ?auto_47581 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_47639 - SURFACE
      ?auto_47640 - SURFACE
      ?auto_47641 - SURFACE
      ?auto_47642 - SURFACE
      ?auto_47643 - SURFACE
      ?auto_47644 - SURFACE
      ?auto_47645 - SURFACE
    )
    :vars
    (
      ?auto_47646 - HOIST
      ?auto_47650 - PLACE
      ?auto_47649 - PLACE
      ?auto_47648 - HOIST
      ?auto_47647 - SURFACE
      ?auto_47651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47646 ?auto_47650 ) ( IS-CRATE ?auto_47645 ) ( not ( = ?auto_47644 ?auto_47645 ) ) ( not ( = ?auto_47643 ?auto_47644 ) ) ( not ( = ?auto_47643 ?auto_47645 ) ) ( not ( = ?auto_47649 ?auto_47650 ) ) ( HOIST-AT ?auto_47648 ?auto_47649 ) ( not ( = ?auto_47646 ?auto_47648 ) ) ( AVAILABLE ?auto_47648 ) ( SURFACE-AT ?auto_47645 ?auto_47649 ) ( ON ?auto_47645 ?auto_47647 ) ( CLEAR ?auto_47645 ) ( not ( = ?auto_47644 ?auto_47647 ) ) ( not ( = ?auto_47645 ?auto_47647 ) ) ( not ( = ?auto_47643 ?auto_47647 ) ) ( TRUCK-AT ?auto_47651 ?auto_47650 ) ( SURFACE-AT ?auto_47643 ?auto_47650 ) ( CLEAR ?auto_47643 ) ( IS-CRATE ?auto_47644 ) ( AVAILABLE ?auto_47646 ) ( IN ?auto_47644 ?auto_47651 ) ( ON ?auto_47640 ?auto_47639 ) ( ON ?auto_47641 ?auto_47640 ) ( ON ?auto_47642 ?auto_47641 ) ( ON ?auto_47643 ?auto_47642 ) ( not ( = ?auto_47639 ?auto_47640 ) ) ( not ( = ?auto_47639 ?auto_47641 ) ) ( not ( = ?auto_47639 ?auto_47642 ) ) ( not ( = ?auto_47639 ?auto_47643 ) ) ( not ( = ?auto_47639 ?auto_47644 ) ) ( not ( = ?auto_47639 ?auto_47645 ) ) ( not ( = ?auto_47639 ?auto_47647 ) ) ( not ( = ?auto_47640 ?auto_47641 ) ) ( not ( = ?auto_47640 ?auto_47642 ) ) ( not ( = ?auto_47640 ?auto_47643 ) ) ( not ( = ?auto_47640 ?auto_47644 ) ) ( not ( = ?auto_47640 ?auto_47645 ) ) ( not ( = ?auto_47640 ?auto_47647 ) ) ( not ( = ?auto_47641 ?auto_47642 ) ) ( not ( = ?auto_47641 ?auto_47643 ) ) ( not ( = ?auto_47641 ?auto_47644 ) ) ( not ( = ?auto_47641 ?auto_47645 ) ) ( not ( = ?auto_47641 ?auto_47647 ) ) ( not ( = ?auto_47642 ?auto_47643 ) ) ( not ( = ?auto_47642 ?auto_47644 ) ) ( not ( = ?auto_47642 ?auto_47645 ) ) ( not ( = ?auto_47642 ?auto_47647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_47643 ?auto_47644 ?auto_47645 )
      ( MAKE-6CRATE-VERIFY ?auto_47639 ?auto_47640 ?auto_47641 ?auto_47642 ?auto_47643 ?auto_47644 ?auto_47645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_48511 - SURFACE
      ?auto_48512 - SURFACE
    )
    :vars
    (
      ?auto_48515 - HOIST
      ?auto_48518 - PLACE
      ?auto_48514 - SURFACE
      ?auto_48517 - PLACE
      ?auto_48519 - HOIST
      ?auto_48516 - SURFACE
      ?auto_48513 - TRUCK
      ?auto_48520 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48515 ?auto_48518 ) ( SURFACE-AT ?auto_48511 ?auto_48518 ) ( CLEAR ?auto_48511 ) ( IS-CRATE ?auto_48512 ) ( not ( = ?auto_48511 ?auto_48512 ) ) ( ON ?auto_48511 ?auto_48514 ) ( not ( = ?auto_48514 ?auto_48511 ) ) ( not ( = ?auto_48514 ?auto_48512 ) ) ( not ( = ?auto_48517 ?auto_48518 ) ) ( HOIST-AT ?auto_48519 ?auto_48517 ) ( not ( = ?auto_48515 ?auto_48519 ) ) ( AVAILABLE ?auto_48519 ) ( SURFACE-AT ?auto_48512 ?auto_48517 ) ( ON ?auto_48512 ?auto_48516 ) ( CLEAR ?auto_48512 ) ( not ( = ?auto_48511 ?auto_48516 ) ) ( not ( = ?auto_48512 ?auto_48516 ) ) ( not ( = ?auto_48514 ?auto_48516 ) ) ( TRUCK-AT ?auto_48513 ?auto_48518 ) ( LIFTING ?auto_48515 ?auto_48520 ) ( IS-CRATE ?auto_48520 ) ( not ( = ?auto_48511 ?auto_48520 ) ) ( not ( = ?auto_48512 ?auto_48520 ) ) ( not ( = ?auto_48514 ?auto_48520 ) ) ( not ( = ?auto_48516 ?auto_48520 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48515 ?auto_48520 ?auto_48513 ?auto_48518 )
      ( MAKE-1CRATE ?auto_48511 ?auto_48512 )
      ( MAKE-1CRATE-VERIFY ?auto_48511 ?auto_48512 ) )
  )

)

