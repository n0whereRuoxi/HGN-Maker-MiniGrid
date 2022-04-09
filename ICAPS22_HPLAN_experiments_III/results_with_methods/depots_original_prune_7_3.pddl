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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81126 - SURFACE
      ?auto_81127 - SURFACE
    )
    :vars
    (
      ?auto_81128 - HOIST
      ?auto_81129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81128 ?auto_81129 ) ( SURFACE-AT ?auto_81126 ?auto_81129 ) ( CLEAR ?auto_81126 ) ( LIFTING ?auto_81128 ?auto_81127 ) ( IS-CRATE ?auto_81127 ) ( not ( = ?auto_81126 ?auto_81127 ) ) )
    :subtasks
    ( ( !DROP ?auto_81128 ?auto_81127 ?auto_81126 ?auto_81129 )
      ( MAKE-1CRATE-VERIFY ?auto_81126 ?auto_81127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81130 - SURFACE
      ?auto_81131 - SURFACE
    )
    :vars
    (
      ?auto_81133 - HOIST
      ?auto_81132 - PLACE
      ?auto_81134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81133 ?auto_81132 ) ( SURFACE-AT ?auto_81130 ?auto_81132 ) ( CLEAR ?auto_81130 ) ( IS-CRATE ?auto_81131 ) ( not ( = ?auto_81130 ?auto_81131 ) ) ( TRUCK-AT ?auto_81134 ?auto_81132 ) ( AVAILABLE ?auto_81133 ) ( IN ?auto_81131 ?auto_81134 ) )
    :subtasks
    ( ( !UNLOAD ?auto_81133 ?auto_81131 ?auto_81134 ?auto_81132 )
      ( MAKE-1CRATE ?auto_81130 ?auto_81131 )
      ( MAKE-1CRATE-VERIFY ?auto_81130 ?auto_81131 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81135 - SURFACE
      ?auto_81136 - SURFACE
    )
    :vars
    (
      ?auto_81137 - HOIST
      ?auto_81138 - PLACE
      ?auto_81139 - TRUCK
      ?auto_81140 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81137 ?auto_81138 ) ( SURFACE-AT ?auto_81135 ?auto_81138 ) ( CLEAR ?auto_81135 ) ( IS-CRATE ?auto_81136 ) ( not ( = ?auto_81135 ?auto_81136 ) ) ( AVAILABLE ?auto_81137 ) ( IN ?auto_81136 ?auto_81139 ) ( TRUCK-AT ?auto_81139 ?auto_81140 ) ( not ( = ?auto_81140 ?auto_81138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81139 ?auto_81140 ?auto_81138 )
      ( MAKE-1CRATE ?auto_81135 ?auto_81136 )
      ( MAKE-1CRATE-VERIFY ?auto_81135 ?auto_81136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81141 - SURFACE
      ?auto_81142 - SURFACE
    )
    :vars
    (
      ?auto_81143 - HOIST
      ?auto_81144 - PLACE
      ?auto_81146 - TRUCK
      ?auto_81145 - PLACE
      ?auto_81147 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81143 ?auto_81144 ) ( SURFACE-AT ?auto_81141 ?auto_81144 ) ( CLEAR ?auto_81141 ) ( IS-CRATE ?auto_81142 ) ( not ( = ?auto_81141 ?auto_81142 ) ) ( AVAILABLE ?auto_81143 ) ( TRUCK-AT ?auto_81146 ?auto_81145 ) ( not ( = ?auto_81145 ?auto_81144 ) ) ( HOIST-AT ?auto_81147 ?auto_81145 ) ( LIFTING ?auto_81147 ?auto_81142 ) ( not ( = ?auto_81143 ?auto_81147 ) ) )
    :subtasks
    ( ( !LOAD ?auto_81147 ?auto_81142 ?auto_81146 ?auto_81145 )
      ( MAKE-1CRATE ?auto_81141 ?auto_81142 )
      ( MAKE-1CRATE-VERIFY ?auto_81141 ?auto_81142 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81148 - SURFACE
      ?auto_81149 - SURFACE
    )
    :vars
    (
      ?auto_81150 - HOIST
      ?auto_81152 - PLACE
      ?auto_81154 - TRUCK
      ?auto_81151 - PLACE
      ?auto_81153 - HOIST
      ?auto_81155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81150 ?auto_81152 ) ( SURFACE-AT ?auto_81148 ?auto_81152 ) ( CLEAR ?auto_81148 ) ( IS-CRATE ?auto_81149 ) ( not ( = ?auto_81148 ?auto_81149 ) ) ( AVAILABLE ?auto_81150 ) ( TRUCK-AT ?auto_81154 ?auto_81151 ) ( not ( = ?auto_81151 ?auto_81152 ) ) ( HOIST-AT ?auto_81153 ?auto_81151 ) ( not ( = ?auto_81150 ?auto_81153 ) ) ( AVAILABLE ?auto_81153 ) ( SURFACE-AT ?auto_81149 ?auto_81151 ) ( ON ?auto_81149 ?auto_81155 ) ( CLEAR ?auto_81149 ) ( not ( = ?auto_81148 ?auto_81155 ) ) ( not ( = ?auto_81149 ?auto_81155 ) ) )
    :subtasks
    ( ( !LIFT ?auto_81153 ?auto_81149 ?auto_81155 ?auto_81151 )
      ( MAKE-1CRATE ?auto_81148 ?auto_81149 )
      ( MAKE-1CRATE-VERIFY ?auto_81148 ?auto_81149 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81156 - SURFACE
      ?auto_81157 - SURFACE
    )
    :vars
    (
      ?auto_81160 - HOIST
      ?auto_81163 - PLACE
      ?auto_81159 - PLACE
      ?auto_81162 - HOIST
      ?auto_81161 - SURFACE
      ?auto_81158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81160 ?auto_81163 ) ( SURFACE-AT ?auto_81156 ?auto_81163 ) ( CLEAR ?auto_81156 ) ( IS-CRATE ?auto_81157 ) ( not ( = ?auto_81156 ?auto_81157 ) ) ( AVAILABLE ?auto_81160 ) ( not ( = ?auto_81159 ?auto_81163 ) ) ( HOIST-AT ?auto_81162 ?auto_81159 ) ( not ( = ?auto_81160 ?auto_81162 ) ) ( AVAILABLE ?auto_81162 ) ( SURFACE-AT ?auto_81157 ?auto_81159 ) ( ON ?auto_81157 ?auto_81161 ) ( CLEAR ?auto_81157 ) ( not ( = ?auto_81156 ?auto_81161 ) ) ( not ( = ?auto_81157 ?auto_81161 ) ) ( TRUCK-AT ?auto_81158 ?auto_81163 ) )
    :subtasks
    ( ( !DRIVE ?auto_81158 ?auto_81163 ?auto_81159 )
      ( MAKE-1CRATE ?auto_81156 ?auto_81157 )
      ( MAKE-1CRATE-VERIFY ?auto_81156 ?auto_81157 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81173 - SURFACE
      ?auto_81174 - SURFACE
      ?auto_81175 - SURFACE
    )
    :vars
    (
      ?auto_81176 - HOIST
      ?auto_81177 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81176 ?auto_81177 ) ( SURFACE-AT ?auto_81174 ?auto_81177 ) ( CLEAR ?auto_81174 ) ( LIFTING ?auto_81176 ?auto_81175 ) ( IS-CRATE ?auto_81175 ) ( not ( = ?auto_81174 ?auto_81175 ) ) ( ON ?auto_81174 ?auto_81173 ) ( not ( = ?auto_81173 ?auto_81174 ) ) ( not ( = ?auto_81173 ?auto_81175 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81174 ?auto_81175 )
      ( MAKE-2CRATE-VERIFY ?auto_81173 ?auto_81174 ?auto_81175 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81183 - SURFACE
      ?auto_81184 - SURFACE
      ?auto_81185 - SURFACE
    )
    :vars
    (
      ?auto_81188 - HOIST
      ?auto_81186 - PLACE
      ?auto_81187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81188 ?auto_81186 ) ( SURFACE-AT ?auto_81184 ?auto_81186 ) ( CLEAR ?auto_81184 ) ( IS-CRATE ?auto_81185 ) ( not ( = ?auto_81184 ?auto_81185 ) ) ( TRUCK-AT ?auto_81187 ?auto_81186 ) ( AVAILABLE ?auto_81188 ) ( IN ?auto_81185 ?auto_81187 ) ( ON ?auto_81184 ?auto_81183 ) ( not ( = ?auto_81183 ?auto_81184 ) ) ( not ( = ?auto_81183 ?auto_81185 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81184 ?auto_81185 )
      ( MAKE-2CRATE-VERIFY ?auto_81183 ?auto_81184 ?auto_81185 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81189 - SURFACE
      ?auto_81190 - SURFACE
    )
    :vars
    (
      ?auto_81192 - HOIST
      ?auto_81193 - PLACE
      ?auto_81194 - TRUCK
      ?auto_81191 - SURFACE
      ?auto_81195 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81192 ?auto_81193 ) ( SURFACE-AT ?auto_81189 ?auto_81193 ) ( CLEAR ?auto_81189 ) ( IS-CRATE ?auto_81190 ) ( not ( = ?auto_81189 ?auto_81190 ) ) ( AVAILABLE ?auto_81192 ) ( IN ?auto_81190 ?auto_81194 ) ( ON ?auto_81189 ?auto_81191 ) ( not ( = ?auto_81191 ?auto_81189 ) ) ( not ( = ?auto_81191 ?auto_81190 ) ) ( TRUCK-AT ?auto_81194 ?auto_81195 ) ( not ( = ?auto_81195 ?auto_81193 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81194 ?auto_81195 ?auto_81193 )
      ( MAKE-2CRATE ?auto_81191 ?auto_81189 ?auto_81190 )
      ( MAKE-1CRATE-VERIFY ?auto_81189 ?auto_81190 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81196 - SURFACE
      ?auto_81197 - SURFACE
      ?auto_81198 - SURFACE
    )
    :vars
    (
      ?auto_81201 - HOIST
      ?auto_81200 - PLACE
      ?auto_81202 - TRUCK
      ?auto_81199 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81201 ?auto_81200 ) ( SURFACE-AT ?auto_81197 ?auto_81200 ) ( CLEAR ?auto_81197 ) ( IS-CRATE ?auto_81198 ) ( not ( = ?auto_81197 ?auto_81198 ) ) ( AVAILABLE ?auto_81201 ) ( IN ?auto_81198 ?auto_81202 ) ( ON ?auto_81197 ?auto_81196 ) ( not ( = ?auto_81196 ?auto_81197 ) ) ( not ( = ?auto_81196 ?auto_81198 ) ) ( TRUCK-AT ?auto_81202 ?auto_81199 ) ( not ( = ?auto_81199 ?auto_81200 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81197 ?auto_81198 )
      ( MAKE-2CRATE-VERIFY ?auto_81196 ?auto_81197 ?auto_81198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81203 - SURFACE
      ?auto_81204 - SURFACE
    )
    :vars
    (
      ?auto_81207 - HOIST
      ?auto_81209 - PLACE
      ?auto_81205 - SURFACE
      ?auto_81206 - TRUCK
      ?auto_81208 - PLACE
      ?auto_81210 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81207 ?auto_81209 ) ( SURFACE-AT ?auto_81203 ?auto_81209 ) ( CLEAR ?auto_81203 ) ( IS-CRATE ?auto_81204 ) ( not ( = ?auto_81203 ?auto_81204 ) ) ( AVAILABLE ?auto_81207 ) ( ON ?auto_81203 ?auto_81205 ) ( not ( = ?auto_81205 ?auto_81203 ) ) ( not ( = ?auto_81205 ?auto_81204 ) ) ( TRUCK-AT ?auto_81206 ?auto_81208 ) ( not ( = ?auto_81208 ?auto_81209 ) ) ( HOIST-AT ?auto_81210 ?auto_81208 ) ( LIFTING ?auto_81210 ?auto_81204 ) ( not ( = ?auto_81207 ?auto_81210 ) ) )
    :subtasks
    ( ( !LOAD ?auto_81210 ?auto_81204 ?auto_81206 ?auto_81208 )
      ( MAKE-2CRATE ?auto_81205 ?auto_81203 ?auto_81204 )
      ( MAKE-1CRATE-VERIFY ?auto_81203 ?auto_81204 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81211 - SURFACE
      ?auto_81212 - SURFACE
      ?auto_81213 - SURFACE
    )
    :vars
    (
      ?auto_81216 - HOIST
      ?auto_81218 - PLACE
      ?auto_81215 - TRUCK
      ?auto_81217 - PLACE
      ?auto_81214 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81216 ?auto_81218 ) ( SURFACE-AT ?auto_81212 ?auto_81218 ) ( CLEAR ?auto_81212 ) ( IS-CRATE ?auto_81213 ) ( not ( = ?auto_81212 ?auto_81213 ) ) ( AVAILABLE ?auto_81216 ) ( ON ?auto_81212 ?auto_81211 ) ( not ( = ?auto_81211 ?auto_81212 ) ) ( not ( = ?auto_81211 ?auto_81213 ) ) ( TRUCK-AT ?auto_81215 ?auto_81217 ) ( not ( = ?auto_81217 ?auto_81218 ) ) ( HOIST-AT ?auto_81214 ?auto_81217 ) ( LIFTING ?auto_81214 ?auto_81213 ) ( not ( = ?auto_81216 ?auto_81214 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81212 ?auto_81213 )
      ( MAKE-2CRATE-VERIFY ?auto_81211 ?auto_81212 ?auto_81213 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81219 - SURFACE
      ?auto_81220 - SURFACE
    )
    :vars
    (
      ?auto_81225 - HOIST
      ?auto_81226 - PLACE
      ?auto_81224 - SURFACE
      ?auto_81223 - TRUCK
      ?auto_81222 - PLACE
      ?auto_81221 - HOIST
      ?auto_81227 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81225 ?auto_81226 ) ( SURFACE-AT ?auto_81219 ?auto_81226 ) ( CLEAR ?auto_81219 ) ( IS-CRATE ?auto_81220 ) ( not ( = ?auto_81219 ?auto_81220 ) ) ( AVAILABLE ?auto_81225 ) ( ON ?auto_81219 ?auto_81224 ) ( not ( = ?auto_81224 ?auto_81219 ) ) ( not ( = ?auto_81224 ?auto_81220 ) ) ( TRUCK-AT ?auto_81223 ?auto_81222 ) ( not ( = ?auto_81222 ?auto_81226 ) ) ( HOIST-AT ?auto_81221 ?auto_81222 ) ( not ( = ?auto_81225 ?auto_81221 ) ) ( AVAILABLE ?auto_81221 ) ( SURFACE-AT ?auto_81220 ?auto_81222 ) ( ON ?auto_81220 ?auto_81227 ) ( CLEAR ?auto_81220 ) ( not ( = ?auto_81219 ?auto_81227 ) ) ( not ( = ?auto_81220 ?auto_81227 ) ) ( not ( = ?auto_81224 ?auto_81227 ) ) )
    :subtasks
    ( ( !LIFT ?auto_81221 ?auto_81220 ?auto_81227 ?auto_81222 )
      ( MAKE-2CRATE ?auto_81224 ?auto_81219 ?auto_81220 )
      ( MAKE-1CRATE-VERIFY ?auto_81219 ?auto_81220 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81228 - SURFACE
      ?auto_81229 - SURFACE
      ?auto_81230 - SURFACE
    )
    :vars
    (
      ?auto_81235 - HOIST
      ?auto_81232 - PLACE
      ?auto_81233 - TRUCK
      ?auto_81231 - PLACE
      ?auto_81234 - HOIST
      ?auto_81236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81235 ?auto_81232 ) ( SURFACE-AT ?auto_81229 ?auto_81232 ) ( CLEAR ?auto_81229 ) ( IS-CRATE ?auto_81230 ) ( not ( = ?auto_81229 ?auto_81230 ) ) ( AVAILABLE ?auto_81235 ) ( ON ?auto_81229 ?auto_81228 ) ( not ( = ?auto_81228 ?auto_81229 ) ) ( not ( = ?auto_81228 ?auto_81230 ) ) ( TRUCK-AT ?auto_81233 ?auto_81231 ) ( not ( = ?auto_81231 ?auto_81232 ) ) ( HOIST-AT ?auto_81234 ?auto_81231 ) ( not ( = ?auto_81235 ?auto_81234 ) ) ( AVAILABLE ?auto_81234 ) ( SURFACE-AT ?auto_81230 ?auto_81231 ) ( ON ?auto_81230 ?auto_81236 ) ( CLEAR ?auto_81230 ) ( not ( = ?auto_81229 ?auto_81236 ) ) ( not ( = ?auto_81230 ?auto_81236 ) ) ( not ( = ?auto_81228 ?auto_81236 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81229 ?auto_81230 )
      ( MAKE-2CRATE-VERIFY ?auto_81228 ?auto_81229 ?auto_81230 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81237 - SURFACE
      ?auto_81238 - SURFACE
    )
    :vars
    (
      ?auto_81245 - HOIST
      ?auto_81243 - PLACE
      ?auto_81244 - SURFACE
      ?auto_81240 - PLACE
      ?auto_81241 - HOIST
      ?auto_81242 - SURFACE
      ?auto_81239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81245 ?auto_81243 ) ( SURFACE-AT ?auto_81237 ?auto_81243 ) ( CLEAR ?auto_81237 ) ( IS-CRATE ?auto_81238 ) ( not ( = ?auto_81237 ?auto_81238 ) ) ( AVAILABLE ?auto_81245 ) ( ON ?auto_81237 ?auto_81244 ) ( not ( = ?auto_81244 ?auto_81237 ) ) ( not ( = ?auto_81244 ?auto_81238 ) ) ( not ( = ?auto_81240 ?auto_81243 ) ) ( HOIST-AT ?auto_81241 ?auto_81240 ) ( not ( = ?auto_81245 ?auto_81241 ) ) ( AVAILABLE ?auto_81241 ) ( SURFACE-AT ?auto_81238 ?auto_81240 ) ( ON ?auto_81238 ?auto_81242 ) ( CLEAR ?auto_81238 ) ( not ( = ?auto_81237 ?auto_81242 ) ) ( not ( = ?auto_81238 ?auto_81242 ) ) ( not ( = ?auto_81244 ?auto_81242 ) ) ( TRUCK-AT ?auto_81239 ?auto_81243 ) )
    :subtasks
    ( ( !DRIVE ?auto_81239 ?auto_81243 ?auto_81240 )
      ( MAKE-2CRATE ?auto_81244 ?auto_81237 ?auto_81238 )
      ( MAKE-1CRATE-VERIFY ?auto_81237 ?auto_81238 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81246 - SURFACE
      ?auto_81247 - SURFACE
      ?auto_81248 - SURFACE
    )
    :vars
    (
      ?auto_81251 - HOIST
      ?auto_81253 - PLACE
      ?auto_81252 - PLACE
      ?auto_81249 - HOIST
      ?auto_81250 - SURFACE
      ?auto_81254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81251 ?auto_81253 ) ( SURFACE-AT ?auto_81247 ?auto_81253 ) ( CLEAR ?auto_81247 ) ( IS-CRATE ?auto_81248 ) ( not ( = ?auto_81247 ?auto_81248 ) ) ( AVAILABLE ?auto_81251 ) ( ON ?auto_81247 ?auto_81246 ) ( not ( = ?auto_81246 ?auto_81247 ) ) ( not ( = ?auto_81246 ?auto_81248 ) ) ( not ( = ?auto_81252 ?auto_81253 ) ) ( HOIST-AT ?auto_81249 ?auto_81252 ) ( not ( = ?auto_81251 ?auto_81249 ) ) ( AVAILABLE ?auto_81249 ) ( SURFACE-AT ?auto_81248 ?auto_81252 ) ( ON ?auto_81248 ?auto_81250 ) ( CLEAR ?auto_81248 ) ( not ( = ?auto_81247 ?auto_81250 ) ) ( not ( = ?auto_81248 ?auto_81250 ) ) ( not ( = ?auto_81246 ?auto_81250 ) ) ( TRUCK-AT ?auto_81254 ?auto_81253 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81247 ?auto_81248 )
      ( MAKE-2CRATE-VERIFY ?auto_81246 ?auto_81247 ?auto_81248 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81255 - SURFACE
      ?auto_81256 - SURFACE
    )
    :vars
    (
      ?auto_81259 - HOIST
      ?auto_81258 - PLACE
      ?auto_81263 - SURFACE
      ?auto_81257 - PLACE
      ?auto_81261 - HOIST
      ?auto_81260 - SURFACE
      ?auto_81262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81259 ?auto_81258 ) ( IS-CRATE ?auto_81256 ) ( not ( = ?auto_81255 ?auto_81256 ) ) ( not ( = ?auto_81263 ?auto_81255 ) ) ( not ( = ?auto_81263 ?auto_81256 ) ) ( not ( = ?auto_81257 ?auto_81258 ) ) ( HOIST-AT ?auto_81261 ?auto_81257 ) ( not ( = ?auto_81259 ?auto_81261 ) ) ( AVAILABLE ?auto_81261 ) ( SURFACE-AT ?auto_81256 ?auto_81257 ) ( ON ?auto_81256 ?auto_81260 ) ( CLEAR ?auto_81256 ) ( not ( = ?auto_81255 ?auto_81260 ) ) ( not ( = ?auto_81256 ?auto_81260 ) ) ( not ( = ?auto_81263 ?auto_81260 ) ) ( TRUCK-AT ?auto_81262 ?auto_81258 ) ( SURFACE-AT ?auto_81263 ?auto_81258 ) ( CLEAR ?auto_81263 ) ( LIFTING ?auto_81259 ?auto_81255 ) ( IS-CRATE ?auto_81255 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81263 ?auto_81255 )
      ( MAKE-2CRATE ?auto_81263 ?auto_81255 ?auto_81256 )
      ( MAKE-1CRATE-VERIFY ?auto_81255 ?auto_81256 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81264 - SURFACE
      ?auto_81265 - SURFACE
      ?auto_81266 - SURFACE
    )
    :vars
    (
      ?auto_81272 - HOIST
      ?auto_81267 - PLACE
      ?auto_81268 - PLACE
      ?auto_81271 - HOIST
      ?auto_81270 - SURFACE
      ?auto_81269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81272 ?auto_81267 ) ( IS-CRATE ?auto_81266 ) ( not ( = ?auto_81265 ?auto_81266 ) ) ( not ( = ?auto_81264 ?auto_81265 ) ) ( not ( = ?auto_81264 ?auto_81266 ) ) ( not ( = ?auto_81268 ?auto_81267 ) ) ( HOIST-AT ?auto_81271 ?auto_81268 ) ( not ( = ?auto_81272 ?auto_81271 ) ) ( AVAILABLE ?auto_81271 ) ( SURFACE-AT ?auto_81266 ?auto_81268 ) ( ON ?auto_81266 ?auto_81270 ) ( CLEAR ?auto_81266 ) ( not ( = ?auto_81265 ?auto_81270 ) ) ( not ( = ?auto_81266 ?auto_81270 ) ) ( not ( = ?auto_81264 ?auto_81270 ) ) ( TRUCK-AT ?auto_81269 ?auto_81267 ) ( SURFACE-AT ?auto_81264 ?auto_81267 ) ( CLEAR ?auto_81264 ) ( LIFTING ?auto_81272 ?auto_81265 ) ( IS-CRATE ?auto_81265 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81265 ?auto_81266 )
      ( MAKE-2CRATE-VERIFY ?auto_81264 ?auto_81265 ?auto_81266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81273 - SURFACE
      ?auto_81274 - SURFACE
    )
    :vars
    (
      ?auto_81276 - HOIST
      ?auto_81275 - PLACE
      ?auto_81277 - SURFACE
      ?auto_81280 - PLACE
      ?auto_81281 - HOIST
      ?auto_81278 - SURFACE
      ?auto_81279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81276 ?auto_81275 ) ( IS-CRATE ?auto_81274 ) ( not ( = ?auto_81273 ?auto_81274 ) ) ( not ( = ?auto_81277 ?auto_81273 ) ) ( not ( = ?auto_81277 ?auto_81274 ) ) ( not ( = ?auto_81280 ?auto_81275 ) ) ( HOIST-AT ?auto_81281 ?auto_81280 ) ( not ( = ?auto_81276 ?auto_81281 ) ) ( AVAILABLE ?auto_81281 ) ( SURFACE-AT ?auto_81274 ?auto_81280 ) ( ON ?auto_81274 ?auto_81278 ) ( CLEAR ?auto_81274 ) ( not ( = ?auto_81273 ?auto_81278 ) ) ( not ( = ?auto_81274 ?auto_81278 ) ) ( not ( = ?auto_81277 ?auto_81278 ) ) ( TRUCK-AT ?auto_81279 ?auto_81275 ) ( SURFACE-AT ?auto_81277 ?auto_81275 ) ( CLEAR ?auto_81277 ) ( IS-CRATE ?auto_81273 ) ( AVAILABLE ?auto_81276 ) ( IN ?auto_81273 ?auto_81279 ) )
    :subtasks
    ( ( !UNLOAD ?auto_81276 ?auto_81273 ?auto_81279 ?auto_81275 )
      ( MAKE-2CRATE ?auto_81277 ?auto_81273 ?auto_81274 )
      ( MAKE-1CRATE-VERIFY ?auto_81273 ?auto_81274 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81282 - SURFACE
      ?auto_81283 - SURFACE
      ?auto_81284 - SURFACE
    )
    :vars
    (
      ?auto_81288 - HOIST
      ?auto_81289 - PLACE
      ?auto_81290 - PLACE
      ?auto_81285 - HOIST
      ?auto_81286 - SURFACE
      ?auto_81287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81288 ?auto_81289 ) ( IS-CRATE ?auto_81284 ) ( not ( = ?auto_81283 ?auto_81284 ) ) ( not ( = ?auto_81282 ?auto_81283 ) ) ( not ( = ?auto_81282 ?auto_81284 ) ) ( not ( = ?auto_81290 ?auto_81289 ) ) ( HOIST-AT ?auto_81285 ?auto_81290 ) ( not ( = ?auto_81288 ?auto_81285 ) ) ( AVAILABLE ?auto_81285 ) ( SURFACE-AT ?auto_81284 ?auto_81290 ) ( ON ?auto_81284 ?auto_81286 ) ( CLEAR ?auto_81284 ) ( not ( = ?auto_81283 ?auto_81286 ) ) ( not ( = ?auto_81284 ?auto_81286 ) ) ( not ( = ?auto_81282 ?auto_81286 ) ) ( TRUCK-AT ?auto_81287 ?auto_81289 ) ( SURFACE-AT ?auto_81282 ?auto_81289 ) ( CLEAR ?auto_81282 ) ( IS-CRATE ?auto_81283 ) ( AVAILABLE ?auto_81288 ) ( IN ?auto_81283 ?auto_81287 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81283 ?auto_81284 )
      ( MAKE-2CRATE-VERIFY ?auto_81282 ?auto_81283 ?auto_81284 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81327 - SURFACE
      ?auto_81328 - SURFACE
    )
    :vars
    (
      ?auto_81332 - HOIST
      ?auto_81330 - PLACE
      ?auto_81333 - SURFACE
      ?auto_81335 - PLACE
      ?auto_81331 - HOIST
      ?auto_81334 - SURFACE
      ?auto_81329 - TRUCK
      ?auto_81336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81332 ?auto_81330 ) ( SURFACE-AT ?auto_81327 ?auto_81330 ) ( CLEAR ?auto_81327 ) ( IS-CRATE ?auto_81328 ) ( not ( = ?auto_81327 ?auto_81328 ) ) ( AVAILABLE ?auto_81332 ) ( ON ?auto_81327 ?auto_81333 ) ( not ( = ?auto_81333 ?auto_81327 ) ) ( not ( = ?auto_81333 ?auto_81328 ) ) ( not ( = ?auto_81335 ?auto_81330 ) ) ( HOIST-AT ?auto_81331 ?auto_81335 ) ( not ( = ?auto_81332 ?auto_81331 ) ) ( AVAILABLE ?auto_81331 ) ( SURFACE-AT ?auto_81328 ?auto_81335 ) ( ON ?auto_81328 ?auto_81334 ) ( CLEAR ?auto_81328 ) ( not ( = ?auto_81327 ?auto_81334 ) ) ( not ( = ?auto_81328 ?auto_81334 ) ) ( not ( = ?auto_81333 ?auto_81334 ) ) ( TRUCK-AT ?auto_81329 ?auto_81336 ) ( not ( = ?auto_81336 ?auto_81330 ) ) ( not ( = ?auto_81335 ?auto_81336 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81329 ?auto_81336 ?auto_81330 )
      ( MAKE-1CRATE ?auto_81327 ?auto_81328 )
      ( MAKE-1CRATE-VERIFY ?auto_81327 ?auto_81328 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81366 - SURFACE
      ?auto_81367 - SURFACE
      ?auto_81368 - SURFACE
      ?auto_81369 - SURFACE
    )
    :vars
    (
      ?auto_81370 - HOIST
      ?auto_81371 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81370 ?auto_81371 ) ( SURFACE-AT ?auto_81368 ?auto_81371 ) ( CLEAR ?auto_81368 ) ( LIFTING ?auto_81370 ?auto_81369 ) ( IS-CRATE ?auto_81369 ) ( not ( = ?auto_81368 ?auto_81369 ) ) ( ON ?auto_81367 ?auto_81366 ) ( ON ?auto_81368 ?auto_81367 ) ( not ( = ?auto_81366 ?auto_81367 ) ) ( not ( = ?auto_81366 ?auto_81368 ) ) ( not ( = ?auto_81366 ?auto_81369 ) ) ( not ( = ?auto_81367 ?auto_81368 ) ) ( not ( = ?auto_81367 ?auto_81369 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81368 ?auto_81369 )
      ( MAKE-3CRATE-VERIFY ?auto_81366 ?auto_81367 ?auto_81368 ?auto_81369 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81383 - SURFACE
      ?auto_81384 - SURFACE
      ?auto_81385 - SURFACE
      ?auto_81386 - SURFACE
    )
    :vars
    (
      ?auto_81388 - HOIST
      ?auto_81389 - PLACE
      ?auto_81387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81388 ?auto_81389 ) ( SURFACE-AT ?auto_81385 ?auto_81389 ) ( CLEAR ?auto_81385 ) ( IS-CRATE ?auto_81386 ) ( not ( = ?auto_81385 ?auto_81386 ) ) ( TRUCK-AT ?auto_81387 ?auto_81389 ) ( AVAILABLE ?auto_81388 ) ( IN ?auto_81386 ?auto_81387 ) ( ON ?auto_81385 ?auto_81384 ) ( not ( = ?auto_81384 ?auto_81385 ) ) ( not ( = ?auto_81384 ?auto_81386 ) ) ( ON ?auto_81384 ?auto_81383 ) ( not ( = ?auto_81383 ?auto_81384 ) ) ( not ( = ?auto_81383 ?auto_81385 ) ) ( not ( = ?auto_81383 ?auto_81386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81384 ?auto_81385 ?auto_81386 )
      ( MAKE-3CRATE-VERIFY ?auto_81383 ?auto_81384 ?auto_81385 ?auto_81386 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81404 - SURFACE
      ?auto_81405 - SURFACE
      ?auto_81406 - SURFACE
      ?auto_81407 - SURFACE
    )
    :vars
    (
      ?auto_81411 - HOIST
      ?auto_81410 - PLACE
      ?auto_81408 - TRUCK
      ?auto_81409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81411 ?auto_81410 ) ( SURFACE-AT ?auto_81406 ?auto_81410 ) ( CLEAR ?auto_81406 ) ( IS-CRATE ?auto_81407 ) ( not ( = ?auto_81406 ?auto_81407 ) ) ( AVAILABLE ?auto_81411 ) ( IN ?auto_81407 ?auto_81408 ) ( ON ?auto_81406 ?auto_81405 ) ( not ( = ?auto_81405 ?auto_81406 ) ) ( not ( = ?auto_81405 ?auto_81407 ) ) ( TRUCK-AT ?auto_81408 ?auto_81409 ) ( not ( = ?auto_81409 ?auto_81410 ) ) ( ON ?auto_81405 ?auto_81404 ) ( not ( = ?auto_81404 ?auto_81405 ) ) ( not ( = ?auto_81404 ?auto_81406 ) ) ( not ( = ?auto_81404 ?auto_81407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81405 ?auto_81406 ?auto_81407 )
      ( MAKE-3CRATE-VERIFY ?auto_81404 ?auto_81405 ?auto_81406 ?auto_81407 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81428 - SURFACE
      ?auto_81429 - SURFACE
      ?auto_81430 - SURFACE
      ?auto_81431 - SURFACE
    )
    :vars
    (
      ?auto_81435 - HOIST
      ?auto_81432 - PLACE
      ?auto_81433 - TRUCK
      ?auto_81436 - PLACE
      ?auto_81434 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81435 ?auto_81432 ) ( SURFACE-AT ?auto_81430 ?auto_81432 ) ( CLEAR ?auto_81430 ) ( IS-CRATE ?auto_81431 ) ( not ( = ?auto_81430 ?auto_81431 ) ) ( AVAILABLE ?auto_81435 ) ( ON ?auto_81430 ?auto_81429 ) ( not ( = ?auto_81429 ?auto_81430 ) ) ( not ( = ?auto_81429 ?auto_81431 ) ) ( TRUCK-AT ?auto_81433 ?auto_81436 ) ( not ( = ?auto_81436 ?auto_81432 ) ) ( HOIST-AT ?auto_81434 ?auto_81436 ) ( LIFTING ?auto_81434 ?auto_81431 ) ( not ( = ?auto_81435 ?auto_81434 ) ) ( ON ?auto_81429 ?auto_81428 ) ( not ( = ?auto_81428 ?auto_81429 ) ) ( not ( = ?auto_81428 ?auto_81430 ) ) ( not ( = ?auto_81428 ?auto_81431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81429 ?auto_81430 ?auto_81431 )
      ( MAKE-3CRATE-VERIFY ?auto_81428 ?auto_81429 ?auto_81430 ?auto_81431 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81455 - SURFACE
      ?auto_81456 - SURFACE
      ?auto_81457 - SURFACE
      ?auto_81458 - SURFACE
    )
    :vars
    (
      ?auto_81460 - HOIST
      ?auto_81463 - PLACE
      ?auto_81461 - TRUCK
      ?auto_81462 - PLACE
      ?auto_81459 - HOIST
      ?auto_81464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81460 ?auto_81463 ) ( SURFACE-AT ?auto_81457 ?auto_81463 ) ( CLEAR ?auto_81457 ) ( IS-CRATE ?auto_81458 ) ( not ( = ?auto_81457 ?auto_81458 ) ) ( AVAILABLE ?auto_81460 ) ( ON ?auto_81457 ?auto_81456 ) ( not ( = ?auto_81456 ?auto_81457 ) ) ( not ( = ?auto_81456 ?auto_81458 ) ) ( TRUCK-AT ?auto_81461 ?auto_81462 ) ( not ( = ?auto_81462 ?auto_81463 ) ) ( HOIST-AT ?auto_81459 ?auto_81462 ) ( not ( = ?auto_81460 ?auto_81459 ) ) ( AVAILABLE ?auto_81459 ) ( SURFACE-AT ?auto_81458 ?auto_81462 ) ( ON ?auto_81458 ?auto_81464 ) ( CLEAR ?auto_81458 ) ( not ( = ?auto_81457 ?auto_81464 ) ) ( not ( = ?auto_81458 ?auto_81464 ) ) ( not ( = ?auto_81456 ?auto_81464 ) ) ( ON ?auto_81456 ?auto_81455 ) ( not ( = ?auto_81455 ?auto_81456 ) ) ( not ( = ?auto_81455 ?auto_81457 ) ) ( not ( = ?auto_81455 ?auto_81458 ) ) ( not ( = ?auto_81455 ?auto_81464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81456 ?auto_81457 ?auto_81458 )
      ( MAKE-3CRATE-VERIFY ?auto_81455 ?auto_81456 ?auto_81457 ?auto_81458 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81483 - SURFACE
      ?auto_81484 - SURFACE
      ?auto_81485 - SURFACE
      ?auto_81486 - SURFACE
    )
    :vars
    (
      ?auto_81492 - HOIST
      ?auto_81491 - PLACE
      ?auto_81489 - PLACE
      ?auto_81488 - HOIST
      ?auto_81487 - SURFACE
      ?auto_81490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81492 ?auto_81491 ) ( SURFACE-AT ?auto_81485 ?auto_81491 ) ( CLEAR ?auto_81485 ) ( IS-CRATE ?auto_81486 ) ( not ( = ?auto_81485 ?auto_81486 ) ) ( AVAILABLE ?auto_81492 ) ( ON ?auto_81485 ?auto_81484 ) ( not ( = ?auto_81484 ?auto_81485 ) ) ( not ( = ?auto_81484 ?auto_81486 ) ) ( not ( = ?auto_81489 ?auto_81491 ) ) ( HOIST-AT ?auto_81488 ?auto_81489 ) ( not ( = ?auto_81492 ?auto_81488 ) ) ( AVAILABLE ?auto_81488 ) ( SURFACE-AT ?auto_81486 ?auto_81489 ) ( ON ?auto_81486 ?auto_81487 ) ( CLEAR ?auto_81486 ) ( not ( = ?auto_81485 ?auto_81487 ) ) ( not ( = ?auto_81486 ?auto_81487 ) ) ( not ( = ?auto_81484 ?auto_81487 ) ) ( TRUCK-AT ?auto_81490 ?auto_81491 ) ( ON ?auto_81484 ?auto_81483 ) ( not ( = ?auto_81483 ?auto_81484 ) ) ( not ( = ?auto_81483 ?auto_81485 ) ) ( not ( = ?auto_81483 ?auto_81486 ) ) ( not ( = ?auto_81483 ?auto_81487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81484 ?auto_81485 ?auto_81486 )
      ( MAKE-3CRATE-VERIFY ?auto_81483 ?auto_81484 ?auto_81485 ?auto_81486 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81511 - SURFACE
      ?auto_81512 - SURFACE
      ?auto_81513 - SURFACE
      ?auto_81514 - SURFACE
    )
    :vars
    (
      ?auto_81518 - HOIST
      ?auto_81516 - PLACE
      ?auto_81520 - PLACE
      ?auto_81519 - HOIST
      ?auto_81517 - SURFACE
      ?auto_81515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81518 ?auto_81516 ) ( IS-CRATE ?auto_81514 ) ( not ( = ?auto_81513 ?auto_81514 ) ) ( not ( = ?auto_81512 ?auto_81513 ) ) ( not ( = ?auto_81512 ?auto_81514 ) ) ( not ( = ?auto_81520 ?auto_81516 ) ) ( HOIST-AT ?auto_81519 ?auto_81520 ) ( not ( = ?auto_81518 ?auto_81519 ) ) ( AVAILABLE ?auto_81519 ) ( SURFACE-AT ?auto_81514 ?auto_81520 ) ( ON ?auto_81514 ?auto_81517 ) ( CLEAR ?auto_81514 ) ( not ( = ?auto_81513 ?auto_81517 ) ) ( not ( = ?auto_81514 ?auto_81517 ) ) ( not ( = ?auto_81512 ?auto_81517 ) ) ( TRUCK-AT ?auto_81515 ?auto_81516 ) ( SURFACE-AT ?auto_81512 ?auto_81516 ) ( CLEAR ?auto_81512 ) ( LIFTING ?auto_81518 ?auto_81513 ) ( IS-CRATE ?auto_81513 ) ( ON ?auto_81512 ?auto_81511 ) ( not ( = ?auto_81511 ?auto_81512 ) ) ( not ( = ?auto_81511 ?auto_81513 ) ) ( not ( = ?auto_81511 ?auto_81514 ) ) ( not ( = ?auto_81511 ?auto_81517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81512 ?auto_81513 ?auto_81514 )
      ( MAKE-3CRATE-VERIFY ?auto_81511 ?auto_81512 ?auto_81513 ?auto_81514 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81539 - SURFACE
      ?auto_81540 - SURFACE
      ?auto_81541 - SURFACE
      ?auto_81542 - SURFACE
    )
    :vars
    (
      ?auto_81547 - HOIST
      ?auto_81544 - PLACE
      ?auto_81548 - PLACE
      ?auto_81546 - HOIST
      ?auto_81545 - SURFACE
      ?auto_81543 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81547 ?auto_81544 ) ( IS-CRATE ?auto_81542 ) ( not ( = ?auto_81541 ?auto_81542 ) ) ( not ( = ?auto_81540 ?auto_81541 ) ) ( not ( = ?auto_81540 ?auto_81542 ) ) ( not ( = ?auto_81548 ?auto_81544 ) ) ( HOIST-AT ?auto_81546 ?auto_81548 ) ( not ( = ?auto_81547 ?auto_81546 ) ) ( AVAILABLE ?auto_81546 ) ( SURFACE-AT ?auto_81542 ?auto_81548 ) ( ON ?auto_81542 ?auto_81545 ) ( CLEAR ?auto_81542 ) ( not ( = ?auto_81541 ?auto_81545 ) ) ( not ( = ?auto_81542 ?auto_81545 ) ) ( not ( = ?auto_81540 ?auto_81545 ) ) ( TRUCK-AT ?auto_81543 ?auto_81544 ) ( SURFACE-AT ?auto_81540 ?auto_81544 ) ( CLEAR ?auto_81540 ) ( IS-CRATE ?auto_81541 ) ( AVAILABLE ?auto_81547 ) ( IN ?auto_81541 ?auto_81543 ) ( ON ?auto_81540 ?auto_81539 ) ( not ( = ?auto_81539 ?auto_81540 ) ) ( not ( = ?auto_81539 ?auto_81541 ) ) ( not ( = ?auto_81539 ?auto_81542 ) ) ( not ( = ?auto_81539 ?auto_81545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81540 ?auto_81541 ?auto_81542 )
      ( MAKE-3CRATE-VERIFY ?auto_81539 ?auto_81540 ?auto_81541 ?auto_81542 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_81830 - SURFACE
      ?auto_81831 - SURFACE
      ?auto_81832 - SURFACE
      ?auto_81834 - SURFACE
      ?auto_81833 - SURFACE
    )
    :vars
    (
      ?auto_81836 - HOIST
      ?auto_81835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81836 ?auto_81835 ) ( SURFACE-AT ?auto_81834 ?auto_81835 ) ( CLEAR ?auto_81834 ) ( LIFTING ?auto_81836 ?auto_81833 ) ( IS-CRATE ?auto_81833 ) ( not ( = ?auto_81834 ?auto_81833 ) ) ( ON ?auto_81831 ?auto_81830 ) ( ON ?auto_81832 ?auto_81831 ) ( ON ?auto_81834 ?auto_81832 ) ( not ( = ?auto_81830 ?auto_81831 ) ) ( not ( = ?auto_81830 ?auto_81832 ) ) ( not ( = ?auto_81830 ?auto_81834 ) ) ( not ( = ?auto_81830 ?auto_81833 ) ) ( not ( = ?auto_81831 ?auto_81832 ) ) ( not ( = ?auto_81831 ?auto_81834 ) ) ( not ( = ?auto_81831 ?auto_81833 ) ) ( not ( = ?auto_81832 ?auto_81834 ) ) ( not ( = ?auto_81832 ?auto_81833 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81834 ?auto_81833 )
      ( MAKE-4CRATE-VERIFY ?auto_81830 ?auto_81831 ?auto_81832 ?auto_81834 ?auto_81833 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_81855 - SURFACE
      ?auto_81856 - SURFACE
      ?auto_81857 - SURFACE
      ?auto_81859 - SURFACE
      ?auto_81858 - SURFACE
    )
    :vars
    (
      ?auto_81860 - HOIST
      ?auto_81862 - PLACE
      ?auto_81861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81860 ?auto_81862 ) ( SURFACE-AT ?auto_81859 ?auto_81862 ) ( CLEAR ?auto_81859 ) ( IS-CRATE ?auto_81858 ) ( not ( = ?auto_81859 ?auto_81858 ) ) ( TRUCK-AT ?auto_81861 ?auto_81862 ) ( AVAILABLE ?auto_81860 ) ( IN ?auto_81858 ?auto_81861 ) ( ON ?auto_81859 ?auto_81857 ) ( not ( = ?auto_81857 ?auto_81859 ) ) ( not ( = ?auto_81857 ?auto_81858 ) ) ( ON ?auto_81856 ?auto_81855 ) ( ON ?auto_81857 ?auto_81856 ) ( not ( = ?auto_81855 ?auto_81856 ) ) ( not ( = ?auto_81855 ?auto_81857 ) ) ( not ( = ?auto_81855 ?auto_81859 ) ) ( not ( = ?auto_81855 ?auto_81858 ) ) ( not ( = ?auto_81856 ?auto_81857 ) ) ( not ( = ?auto_81856 ?auto_81859 ) ) ( not ( = ?auto_81856 ?auto_81858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81857 ?auto_81859 ?auto_81858 )
      ( MAKE-4CRATE-VERIFY ?auto_81855 ?auto_81856 ?auto_81857 ?auto_81859 ?auto_81858 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_81885 - SURFACE
      ?auto_81886 - SURFACE
      ?auto_81887 - SURFACE
      ?auto_81889 - SURFACE
      ?auto_81888 - SURFACE
    )
    :vars
    (
      ?auto_81891 - HOIST
      ?auto_81890 - PLACE
      ?auto_81893 - TRUCK
      ?auto_81892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81891 ?auto_81890 ) ( SURFACE-AT ?auto_81889 ?auto_81890 ) ( CLEAR ?auto_81889 ) ( IS-CRATE ?auto_81888 ) ( not ( = ?auto_81889 ?auto_81888 ) ) ( AVAILABLE ?auto_81891 ) ( IN ?auto_81888 ?auto_81893 ) ( ON ?auto_81889 ?auto_81887 ) ( not ( = ?auto_81887 ?auto_81889 ) ) ( not ( = ?auto_81887 ?auto_81888 ) ) ( TRUCK-AT ?auto_81893 ?auto_81892 ) ( not ( = ?auto_81892 ?auto_81890 ) ) ( ON ?auto_81886 ?auto_81885 ) ( ON ?auto_81887 ?auto_81886 ) ( not ( = ?auto_81885 ?auto_81886 ) ) ( not ( = ?auto_81885 ?auto_81887 ) ) ( not ( = ?auto_81885 ?auto_81889 ) ) ( not ( = ?auto_81885 ?auto_81888 ) ) ( not ( = ?auto_81886 ?auto_81887 ) ) ( not ( = ?auto_81886 ?auto_81889 ) ) ( not ( = ?auto_81886 ?auto_81888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81887 ?auto_81889 ?auto_81888 )
      ( MAKE-4CRATE-VERIFY ?auto_81885 ?auto_81886 ?auto_81887 ?auto_81889 ?auto_81888 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_81919 - SURFACE
      ?auto_81920 - SURFACE
      ?auto_81921 - SURFACE
      ?auto_81923 - SURFACE
      ?auto_81922 - SURFACE
    )
    :vars
    (
      ?auto_81925 - HOIST
      ?auto_81927 - PLACE
      ?auto_81924 - TRUCK
      ?auto_81928 - PLACE
      ?auto_81926 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81925 ?auto_81927 ) ( SURFACE-AT ?auto_81923 ?auto_81927 ) ( CLEAR ?auto_81923 ) ( IS-CRATE ?auto_81922 ) ( not ( = ?auto_81923 ?auto_81922 ) ) ( AVAILABLE ?auto_81925 ) ( ON ?auto_81923 ?auto_81921 ) ( not ( = ?auto_81921 ?auto_81923 ) ) ( not ( = ?auto_81921 ?auto_81922 ) ) ( TRUCK-AT ?auto_81924 ?auto_81928 ) ( not ( = ?auto_81928 ?auto_81927 ) ) ( HOIST-AT ?auto_81926 ?auto_81928 ) ( LIFTING ?auto_81926 ?auto_81922 ) ( not ( = ?auto_81925 ?auto_81926 ) ) ( ON ?auto_81920 ?auto_81919 ) ( ON ?auto_81921 ?auto_81920 ) ( not ( = ?auto_81919 ?auto_81920 ) ) ( not ( = ?auto_81919 ?auto_81921 ) ) ( not ( = ?auto_81919 ?auto_81923 ) ) ( not ( = ?auto_81919 ?auto_81922 ) ) ( not ( = ?auto_81920 ?auto_81921 ) ) ( not ( = ?auto_81920 ?auto_81923 ) ) ( not ( = ?auto_81920 ?auto_81922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81921 ?auto_81923 ?auto_81922 )
      ( MAKE-4CRATE-VERIFY ?auto_81919 ?auto_81920 ?auto_81921 ?auto_81923 ?auto_81922 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_81957 - SURFACE
      ?auto_81958 - SURFACE
      ?auto_81959 - SURFACE
      ?auto_81961 - SURFACE
      ?auto_81960 - SURFACE
    )
    :vars
    (
      ?auto_81963 - HOIST
      ?auto_81964 - PLACE
      ?auto_81966 - TRUCK
      ?auto_81962 - PLACE
      ?auto_81965 - HOIST
      ?auto_81967 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81963 ?auto_81964 ) ( SURFACE-AT ?auto_81961 ?auto_81964 ) ( CLEAR ?auto_81961 ) ( IS-CRATE ?auto_81960 ) ( not ( = ?auto_81961 ?auto_81960 ) ) ( AVAILABLE ?auto_81963 ) ( ON ?auto_81961 ?auto_81959 ) ( not ( = ?auto_81959 ?auto_81961 ) ) ( not ( = ?auto_81959 ?auto_81960 ) ) ( TRUCK-AT ?auto_81966 ?auto_81962 ) ( not ( = ?auto_81962 ?auto_81964 ) ) ( HOIST-AT ?auto_81965 ?auto_81962 ) ( not ( = ?auto_81963 ?auto_81965 ) ) ( AVAILABLE ?auto_81965 ) ( SURFACE-AT ?auto_81960 ?auto_81962 ) ( ON ?auto_81960 ?auto_81967 ) ( CLEAR ?auto_81960 ) ( not ( = ?auto_81961 ?auto_81967 ) ) ( not ( = ?auto_81960 ?auto_81967 ) ) ( not ( = ?auto_81959 ?auto_81967 ) ) ( ON ?auto_81958 ?auto_81957 ) ( ON ?auto_81959 ?auto_81958 ) ( not ( = ?auto_81957 ?auto_81958 ) ) ( not ( = ?auto_81957 ?auto_81959 ) ) ( not ( = ?auto_81957 ?auto_81961 ) ) ( not ( = ?auto_81957 ?auto_81960 ) ) ( not ( = ?auto_81957 ?auto_81967 ) ) ( not ( = ?auto_81958 ?auto_81959 ) ) ( not ( = ?auto_81958 ?auto_81961 ) ) ( not ( = ?auto_81958 ?auto_81960 ) ) ( not ( = ?auto_81958 ?auto_81967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81959 ?auto_81961 ?auto_81960 )
      ( MAKE-4CRATE-VERIFY ?auto_81957 ?auto_81958 ?auto_81959 ?auto_81961 ?auto_81960 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_81996 - SURFACE
      ?auto_81997 - SURFACE
      ?auto_81998 - SURFACE
      ?auto_82000 - SURFACE
      ?auto_81999 - SURFACE
    )
    :vars
    (
      ?auto_82005 - HOIST
      ?auto_82006 - PLACE
      ?auto_82001 - PLACE
      ?auto_82004 - HOIST
      ?auto_82003 - SURFACE
      ?auto_82002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82005 ?auto_82006 ) ( SURFACE-AT ?auto_82000 ?auto_82006 ) ( CLEAR ?auto_82000 ) ( IS-CRATE ?auto_81999 ) ( not ( = ?auto_82000 ?auto_81999 ) ) ( AVAILABLE ?auto_82005 ) ( ON ?auto_82000 ?auto_81998 ) ( not ( = ?auto_81998 ?auto_82000 ) ) ( not ( = ?auto_81998 ?auto_81999 ) ) ( not ( = ?auto_82001 ?auto_82006 ) ) ( HOIST-AT ?auto_82004 ?auto_82001 ) ( not ( = ?auto_82005 ?auto_82004 ) ) ( AVAILABLE ?auto_82004 ) ( SURFACE-AT ?auto_81999 ?auto_82001 ) ( ON ?auto_81999 ?auto_82003 ) ( CLEAR ?auto_81999 ) ( not ( = ?auto_82000 ?auto_82003 ) ) ( not ( = ?auto_81999 ?auto_82003 ) ) ( not ( = ?auto_81998 ?auto_82003 ) ) ( TRUCK-AT ?auto_82002 ?auto_82006 ) ( ON ?auto_81997 ?auto_81996 ) ( ON ?auto_81998 ?auto_81997 ) ( not ( = ?auto_81996 ?auto_81997 ) ) ( not ( = ?auto_81996 ?auto_81998 ) ) ( not ( = ?auto_81996 ?auto_82000 ) ) ( not ( = ?auto_81996 ?auto_81999 ) ) ( not ( = ?auto_81996 ?auto_82003 ) ) ( not ( = ?auto_81997 ?auto_81998 ) ) ( not ( = ?auto_81997 ?auto_82000 ) ) ( not ( = ?auto_81997 ?auto_81999 ) ) ( not ( = ?auto_81997 ?auto_82003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81998 ?auto_82000 ?auto_81999 )
      ( MAKE-4CRATE-VERIFY ?auto_81996 ?auto_81997 ?auto_81998 ?auto_82000 ?auto_81999 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82035 - SURFACE
      ?auto_82036 - SURFACE
      ?auto_82037 - SURFACE
      ?auto_82039 - SURFACE
      ?auto_82038 - SURFACE
    )
    :vars
    (
      ?auto_82044 - HOIST
      ?auto_82042 - PLACE
      ?auto_82045 - PLACE
      ?auto_82041 - HOIST
      ?auto_82040 - SURFACE
      ?auto_82043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82044 ?auto_82042 ) ( IS-CRATE ?auto_82038 ) ( not ( = ?auto_82039 ?auto_82038 ) ) ( not ( = ?auto_82037 ?auto_82039 ) ) ( not ( = ?auto_82037 ?auto_82038 ) ) ( not ( = ?auto_82045 ?auto_82042 ) ) ( HOIST-AT ?auto_82041 ?auto_82045 ) ( not ( = ?auto_82044 ?auto_82041 ) ) ( AVAILABLE ?auto_82041 ) ( SURFACE-AT ?auto_82038 ?auto_82045 ) ( ON ?auto_82038 ?auto_82040 ) ( CLEAR ?auto_82038 ) ( not ( = ?auto_82039 ?auto_82040 ) ) ( not ( = ?auto_82038 ?auto_82040 ) ) ( not ( = ?auto_82037 ?auto_82040 ) ) ( TRUCK-AT ?auto_82043 ?auto_82042 ) ( SURFACE-AT ?auto_82037 ?auto_82042 ) ( CLEAR ?auto_82037 ) ( LIFTING ?auto_82044 ?auto_82039 ) ( IS-CRATE ?auto_82039 ) ( ON ?auto_82036 ?auto_82035 ) ( ON ?auto_82037 ?auto_82036 ) ( not ( = ?auto_82035 ?auto_82036 ) ) ( not ( = ?auto_82035 ?auto_82037 ) ) ( not ( = ?auto_82035 ?auto_82039 ) ) ( not ( = ?auto_82035 ?auto_82038 ) ) ( not ( = ?auto_82035 ?auto_82040 ) ) ( not ( = ?auto_82036 ?auto_82037 ) ) ( not ( = ?auto_82036 ?auto_82039 ) ) ( not ( = ?auto_82036 ?auto_82038 ) ) ( not ( = ?auto_82036 ?auto_82040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82037 ?auto_82039 ?auto_82038 )
      ( MAKE-4CRATE-VERIFY ?auto_82035 ?auto_82036 ?auto_82037 ?auto_82039 ?auto_82038 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82074 - SURFACE
      ?auto_82075 - SURFACE
      ?auto_82076 - SURFACE
      ?auto_82078 - SURFACE
      ?auto_82077 - SURFACE
    )
    :vars
    (
      ?auto_82082 - HOIST
      ?auto_82080 - PLACE
      ?auto_82079 - PLACE
      ?auto_82084 - HOIST
      ?auto_82081 - SURFACE
      ?auto_82083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82082 ?auto_82080 ) ( IS-CRATE ?auto_82077 ) ( not ( = ?auto_82078 ?auto_82077 ) ) ( not ( = ?auto_82076 ?auto_82078 ) ) ( not ( = ?auto_82076 ?auto_82077 ) ) ( not ( = ?auto_82079 ?auto_82080 ) ) ( HOIST-AT ?auto_82084 ?auto_82079 ) ( not ( = ?auto_82082 ?auto_82084 ) ) ( AVAILABLE ?auto_82084 ) ( SURFACE-AT ?auto_82077 ?auto_82079 ) ( ON ?auto_82077 ?auto_82081 ) ( CLEAR ?auto_82077 ) ( not ( = ?auto_82078 ?auto_82081 ) ) ( not ( = ?auto_82077 ?auto_82081 ) ) ( not ( = ?auto_82076 ?auto_82081 ) ) ( TRUCK-AT ?auto_82083 ?auto_82080 ) ( SURFACE-AT ?auto_82076 ?auto_82080 ) ( CLEAR ?auto_82076 ) ( IS-CRATE ?auto_82078 ) ( AVAILABLE ?auto_82082 ) ( IN ?auto_82078 ?auto_82083 ) ( ON ?auto_82075 ?auto_82074 ) ( ON ?auto_82076 ?auto_82075 ) ( not ( = ?auto_82074 ?auto_82075 ) ) ( not ( = ?auto_82074 ?auto_82076 ) ) ( not ( = ?auto_82074 ?auto_82078 ) ) ( not ( = ?auto_82074 ?auto_82077 ) ) ( not ( = ?auto_82074 ?auto_82081 ) ) ( not ( = ?auto_82075 ?auto_82076 ) ) ( not ( = ?auto_82075 ?auto_82078 ) ) ( not ( = ?auto_82075 ?auto_82077 ) ) ( not ( = ?auto_82075 ?auto_82081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82076 ?auto_82078 ?auto_82077 )
      ( MAKE-4CRATE-VERIFY ?auto_82074 ?auto_82075 ?auto_82076 ?auto_82078 ?auto_82077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_82575 - SURFACE
      ?auto_82576 - SURFACE
    )
    :vars
    (
      ?auto_82583 - HOIST
      ?auto_82578 - PLACE
      ?auto_82581 - SURFACE
      ?auto_82579 - TRUCK
      ?auto_82582 - PLACE
      ?auto_82577 - HOIST
      ?auto_82580 - SURFACE
      ?auto_82584 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82583 ?auto_82578 ) ( SURFACE-AT ?auto_82575 ?auto_82578 ) ( CLEAR ?auto_82575 ) ( IS-CRATE ?auto_82576 ) ( not ( = ?auto_82575 ?auto_82576 ) ) ( AVAILABLE ?auto_82583 ) ( ON ?auto_82575 ?auto_82581 ) ( not ( = ?auto_82581 ?auto_82575 ) ) ( not ( = ?auto_82581 ?auto_82576 ) ) ( TRUCK-AT ?auto_82579 ?auto_82582 ) ( not ( = ?auto_82582 ?auto_82578 ) ) ( HOIST-AT ?auto_82577 ?auto_82582 ) ( not ( = ?auto_82583 ?auto_82577 ) ) ( SURFACE-AT ?auto_82576 ?auto_82582 ) ( ON ?auto_82576 ?auto_82580 ) ( CLEAR ?auto_82576 ) ( not ( = ?auto_82575 ?auto_82580 ) ) ( not ( = ?auto_82576 ?auto_82580 ) ) ( not ( = ?auto_82581 ?auto_82580 ) ) ( LIFTING ?auto_82577 ?auto_82584 ) ( IS-CRATE ?auto_82584 ) ( not ( = ?auto_82575 ?auto_82584 ) ) ( not ( = ?auto_82576 ?auto_82584 ) ) ( not ( = ?auto_82581 ?auto_82584 ) ) ( not ( = ?auto_82580 ?auto_82584 ) ) )
    :subtasks
    ( ( !LOAD ?auto_82577 ?auto_82584 ?auto_82579 ?auto_82582 )
      ( MAKE-1CRATE ?auto_82575 ?auto_82576 )
      ( MAKE-1CRATE-VERIFY ?auto_82575 ?auto_82576 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82734 - SURFACE
      ?auto_82735 - SURFACE
      ?auto_82736 - SURFACE
      ?auto_82738 - SURFACE
      ?auto_82737 - SURFACE
      ?auto_82739 - SURFACE
    )
    :vars
    (
      ?auto_82741 - HOIST
      ?auto_82740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82741 ?auto_82740 ) ( SURFACE-AT ?auto_82737 ?auto_82740 ) ( CLEAR ?auto_82737 ) ( LIFTING ?auto_82741 ?auto_82739 ) ( IS-CRATE ?auto_82739 ) ( not ( = ?auto_82737 ?auto_82739 ) ) ( ON ?auto_82735 ?auto_82734 ) ( ON ?auto_82736 ?auto_82735 ) ( ON ?auto_82738 ?auto_82736 ) ( ON ?auto_82737 ?auto_82738 ) ( not ( = ?auto_82734 ?auto_82735 ) ) ( not ( = ?auto_82734 ?auto_82736 ) ) ( not ( = ?auto_82734 ?auto_82738 ) ) ( not ( = ?auto_82734 ?auto_82737 ) ) ( not ( = ?auto_82734 ?auto_82739 ) ) ( not ( = ?auto_82735 ?auto_82736 ) ) ( not ( = ?auto_82735 ?auto_82738 ) ) ( not ( = ?auto_82735 ?auto_82737 ) ) ( not ( = ?auto_82735 ?auto_82739 ) ) ( not ( = ?auto_82736 ?auto_82738 ) ) ( not ( = ?auto_82736 ?auto_82737 ) ) ( not ( = ?auto_82736 ?auto_82739 ) ) ( not ( = ?auto_82738 ?auto_82737 ) ) ( not ( = ?auto_82738 ?auto_82739 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_82737 ?auto_82739 )
      ( MAKE-5CRATE-VERIFY ?auto_82734 ?auto_82735 ?auto_82736 ?auto_82738 ?auto_82737 ?auto_82739 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82768 - SURFACE
      ?auto_82769 - SURFACE
      ?auto_82770 - SURFACE
      ?auto_82772 - SURFACE
      ?auto_82771 - SURFACE
      ?auto_82773 - SURFACE
    )
    :vars
    (
      ?auto_82775 - HOIST
      ?auto_82776 - PLACE
      ?auto_82774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82775 ?auto_82776 ) ( SURFACE-AT ?auto_82771 ?auto_82776 ) ( CLEAR ?auto_82771 ) ( IS-CRATE ?auto_82773 ) ( not ( = ?auto_82771 ?auto_82773 ) ) ( TRUCK-AT ?auto_82774 ?auto_82776 ) ( AVAILABLE ?auto_82775 ) ( IN ?auto_82773 ?auto_82774 ) ( ON ?auto_82771 ?auto_82772 ) ( not ( = ?auto_82772 ?auto_82771 ) ) ( not ( = ?auto_82772 ?auto_82773 ) ) ( ON ?auto_82769 ?auto_82768 ) ( ON ?auto_82770 ?auto_82769 ) ( ON ?auto_82772 ?auto_82770 ) ( not ( = ?auto_82768 ?auto_82769 ) ) ( not ( = ?auto_82768 ?auto_82770 ) ) ( not ( = ?auto_82768 ?auto_82772 ) ) ( not ( = ?auto_82768 ?auto_82771 ) ) ( not ( = ?auto_82768 ?auto_82773 ) ) ( not ( = ?auto_82769 ?auto_82770 ) ) ( not ( = ?auto_82769 ?auto_82772 ) ) ( not ( = ?auto_82769 ?auto_82771 ) ) ( not ( = ?auto_82769 ?auto_82773 ) ) ( not ( = ?auto_82770 ?auto_82772 ) ) ( not ( = ?auto_82770 ?auto_82771 ) ) ( not ( = ?auto_82770 ?auto_82773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82772 ?auto_82771 ?auto_82773 )
      ( MAKE-5CRATE-VERIFY ?auto_82768 ?auto_82769 ?auto_82770 ?auto_82772 ?auto_82771 ?auto_82773 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82808 - SURFACE
      ?auto_82809 - SURFACE
      ?auto_82810 - SURFACE
      ?auto_82812 - SURFACE
      ?auto_82811 - SURFACE
      ?auto_82813 - SURFACE
    )
    :vars
    (
      ?auto_82814 - HOIST
      ?auto_82815 - PLACE
      ?auto_82816 - TRUCK
      ?auto_82817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82814 ?auto_82815 ) ( SURFACE-AT ?auto_82811 ?auto_82815 ) ( CLEAR ?auto_82811 ) ( IS-CRATE ?auto_82813 ) ( not ( = ?auto_82811 ?auto_82813 ) ) ( AVAILABLE ?auto_82814 ) ( IN ?auto_82813 ?auto_82816 ) ( ON ?auto_82811 ?auto_82812 ) ( not ( = ?auto_82812 ?auto_82811 ) ) ( not ( = ?auto_82812 ?auto_82813 ) ) ( TRUCK-AT ?auto_82816 ?auto_82817 ) ( not ( = ?auto_82817 ?auto_82815 ) ) ( ON ?auto_82809 ?auto_82808 ) ( ON ?auto_82810 ?auto_82809 ) ( ON ?auto_82812 ?auto_82810 ) ( not ( = ?auto_82808 ?auto_82809 ) ) ( not ( = ?auto_82808 ?auto_82810 ) ) ( not ( = ?auto_82808 ?auto_82812 ) ) ( not ( = ?auto_82808 ?auto_82811 ) ) ( not ( = ?auto_82808 ?auto_82813 ) ) ( not ( = ?auto_82809 ?auto_82810 ) ) ( not ( = ?auto_82809 ?auto_82812 ) ) ( not ( = ?auto_82809 ?auto_82811 ) ) ( not ( = ?auto_82809 ?auto_82813 ) ) ( not ( = ?auto_82810 ?auto_82812 ) ) ( not ( = ?auto_82810 ?auto_82811 ) ) ( not ( = ?auto_82810 ?auto_82813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82812 ?auto_82811 ?auto_82813 )
      ( MAKE-5CRATE-VERIFY ?auto_82808 ?auto_82809 ?auto_82810 ?auto_82812 ?auto_82811 ?auto_82813 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82853 - SURFACE
      ?auto_82854 - SURFACE
      ?auto_82855 - SURFACE
      ?auto_82857 - SURFACE
      ?auto_82856 - SURFACE
      ?auto_82858 - SURFACE
    )
    :vars
    (
      ?auto_82860 - HOIST
      ?auto_82861 - PLACE
      ?auto_82862 - TRUCK
      ?auto_82859 - PLACE
      ?auto_82863 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_82860 ?auto_82861 ) ( SURFACE-AT ?auto_82856 ?auto_82861 ) ( CLEAR ?auto_82856 ) ( IS-CRATE ?auto_82858 ) ( not ( = ?auto_82856 ?auto_82858 ) ) ( AVAILABLE ?auto_82860 ) ( ON ?auto_82856 ?auto_82857 ) ( not ( = ?auto_82857 ?auto_82856 ) ) ( not ( = ?auto_82857 ?auto_82858 ) ) ( TRUCK-AT ?auto_82862 ?auto_82859 ) ( not ( = ?auto_82859 ?auto_82861 ) ) ( HOIST-AT ?auto_82863 ?auto_82859 ) ( LIFTING ?auto_82863 ?auto_82858 ) ( not ( = ?auto_82860 ?auto_82863 ) ) ( ON ?auto_82854 ?auto_82853 ) ( ON ?auto_82855 ?auto_82854 ) ( ON ?auto_82857 ?auto_82855 ) ( not ( = ?auto_82853 ?auto_82854 ) ) ( not ( = ?auto_82853 ?auto_82855 ) ) ( not ( = ?auto_82853 ?auto_82857 ) ) ( not ( = ?auto_82853 ?auto_82856 ) ) ( not ( = ?auto_82853 ?auto_82858 ) ) ( not ( = ?auto_82854 ?auto_82855 ) ) ( not ( = ?auto_82854 ?auto_82857 ) ) ( not ( = ?auto_82854 ?auto_82856 ) ) ( not ( = ?auto_82854 ?auto_82858 ) ) ( not ( = ?auto_82855 ?auto_82857 ) ) ( not ( = ?auto_82855 ?auto_82856 ) ) ( not ( = ?auto_82855 ?auto_82858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82857 ?auto_82856 ?auto_82858 )
      ( MAKE-5CRATE-VERIFY ?auto_82853 ?auto_82854 ?auto_82855 ?auto_82857 ?auto_82856 ?auto_82858 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82903 - SURFACE
      ?auto_82904 - SURFACE
      ?auto_82905 - SURFACE
      ?auto_82907 - SURFACE
      ?auto_82906 - SURFACE
      ?auto_82908 - SURFACE
    )
    :vars
    (
      ?auto_82912 - HOIST
      ?auto_82911 - PLACE
      ?auto_82909 - TRUCK
      ?auto_82913 - PLACE
      ?auto_82914 - HOIST
      ?auto_82910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82912 ?auto_82911 ) ( SURFACE-AT ?auto_82906 ?auto_82911 ) ( CLEAR ?auto_82906 ) ( IS-CRATE ?auto_82908 ) ( not ( = ?auto_82906 ?auto_82908 ) ) ( AVAILABLE ?auto_82912 ) ( ON ?auto_82906 ?auto_82907 ) ( not ( = ?auto_82907 ?auto_82906 ) ) ( not ( = ?auto_82907 ?auto_82908 ) ) ( TRUCK-AT ?auto_82909 ?auto_82913 ) ( not ( = ?auto_82913 ?auto_82911 ) ) ( HOIST-AT ?auto_82914 ?auto_82913 ) ( not ( = ?auto_82912 ?auto_82914 ) ) ( AVAILABLE ?auto_82914 ) ( SURFACE-AT ?auto_82908 ?auto_82913 ) ( ON ?auto_82908 ?auto_82910 ) ( CLEAR ?auto_82908 ) ( not ( = ?auto_82906 ?auto_82910 ) ) ( not ( = ?auto_82908 ?auto_82910 ) ) ( not ( = ?auto_82907 ?auto_82910 ) ) ( ON ?auto_82904 ?auto_82903 ) ( ON ?auto_82905 ?auto_82904 ) ( ON ?auto_82907 ?auto_82905 ) ( not ( = ?auto_82903 ?auto_82904 ) ) ( not ( = ?auto_82903 ?auto_82905 ) ) ( not ( = ?auto_82903 ?auto_82907 ) ) ( not ( = ?auto_82903 ?auto_82906 ) ) ( not ( = ?auto_82903 ?auto_82908 ) ) ( not ( = ?auto_82903 ?auto_82910 ) ) ( not ( = ?auto_82904 ?auto_82905 ) ) ( not ( = ?auto_82904 ?auto_82907 ) ) ( not ( = ?auto_82904 ?auto_82906 ) ) ( not ( = ?auto_82904 ?auto_82908 ) ) ( not ( = ?auto_82904 ?auto_82910 ) ) ( not ( = ?auto_82905 ?auto_82907 ) ) ( not ( = ?auto_82905 ?auto_82906 ) ) ( not ( = ?auto_82905 ?auto_82908 ) ) ( not ( = ?auto_82905 ?auto_82910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82907 ?auto_82906 ?auto_82908 )
      ( MAKE-5CRATE-VERIFY ?auto_82903 ?auto_82904 ?auto_82905 ?auto_82907 ?auto_82906 ?auto_82908 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82954 - SURFACE
      ?auto_82955 - SURFACE
      ?auto_82956 - SURFACE
      ?auto_82958 - SURFACE
      ?auto_82957 - SURFACE
      ?auto_82959 - SURFACE
    )
    :vars
    (
      ?auto_82960 - HOIST
      ?auto_82962 - PLACE
      ?auto_82964 - PLACE
      ?auto_82965 - HOIST
      ?auto_82963 - SURFACE
      ?auto_82961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82960 ?auto_82962 ) ( SURFACE-AT ?auto_82957 ?auto_82962 ) ( CLEAR ?auto_82957 ) ( IS-CRATE ?auto_82959 ) ( not ( = ?auto_82957 ?auto_82959 ) ) ( AVAILABLE ?auto_82960 ) ( ON ?auto_82957 ?auto_82958 ) ( not ( = ?auto_82958 ?auto_82957 ) ) ( not ( = ?auto_82958 ?auto_82959 ) ) ( not ( = ?auto_82964 ?auto_82962 ) ) ( HOIST-AT ?auto_82965 ?auto_82964 ) ( not ( = ?auto_82960 ?auto_82965 ) ) ( AVAILABLE ?auto_82965 ) ( SURFACE-AT ?auto_82959 ?auto_82964 ) ( ON ?auto_82959 ?auto_82963 ) ( CLEAR ?auto_82959 ) ( not ( = ?auto_82957 ?auto_82963 ) ) ( not ( = ?auto_82959 ?auto_82963 ) ) ( not ( = ?auto_82958 ?auto_82963 ) ) ( TRUCK-AT ?auto_82961 ?auto_82962 ) ( ON ?auto_82955 ?auto_82954 ) ( ON ?auto_82956 ?auto_82955 ) ( ON ?auto_82958 ?auto_82956 ) ( not ( = ?auto_82954 ?auto_82955 ) ) ( not ( = ?auto_82954 ?auto_82956 ) ) ( not ( = ?auto_82954 ?auto_82958 ) ) ( not ( = ?auto_82954 ?auto_82957 ) ) ( not ( = ?auto_82954 ?auto_82959 ) ) ( not ( = ?auto_82954 ?auto_82963 ) ) ( not ( = ?auto_82955 ?auto_82956 ) ) ( not ( = ?auto_82955 ?auto_82958 ) ) ( not ( = ?auto_82955 ?auto_82957 ) ) ( not ( = ?auto_82955 ?auto_82959 ) ) ( not ( = ?auto_82955 ?auto_82963 ) ) ( not ( = ?auto_82956 ?auto_82958 ) ) ( not ( = ?auto_82956 ?auto_82957 ) ) ( not ( = ?auto_82956 ?auto_82959 ) ) ( not ( = ?auto_82956 ?auto_82963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82958 ?auto_82957 ?auto_82959 )
      ( MAKE-5CRATE-VERIFY ?auto_82954 ?auto_82955 ?auto_82956 ?auto_82958 ?auto_82957 ?auto_82959 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83005 - SURFACE
      ?auto_83006 - SURFACE
      ?auto_83007 - SURFACE
      ?auto_83009 - SURFACE
      ?auto_83008 - SURFACE
      ?auto_83010 - SURFACE
    )
    :vars
    (
      ?auto_83013 - HOIST
      ?auto_83015 - PLACE
      ?auto_83014 - PLACE
      ?auto_83016 - HOIST
      ?auto_83011 - SURFACE
      ?auto_83012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_83013 ?auto_83015 ) ( IS-CRATE ?auto_83010 ) ( not ( = ?auto_83008 ?auto_83010 ) ) ( not ( = ?auto_83009 ?auto_83008 ) ) ( not ( = ?auto_83009 ?auto_83010 ) ) ( not ( = ?auto_83014 ?auto_83015 ) ) ( HOIST-AT ?auto_83016 ?auto_83014 ) ( not ( = ?auto_83013 ?auto_83016 ) ) ( AVAILABLE ?auto_83016 ) ( SURFACE-AT ?auto_83010 ?auto_83014 ) ( ON ?auto_83010 ?auto_83011 ) ( CLEAR ?auto_83010 ) ( not ( = ?auto_83008 ?auto_83011 ) ) ( not ( = ?auto_83010 ?auto_83011 ) ) ( not ( = ?auto_83009 ?auto_83011 ) ) ( TRUCK-AT ?auto_83012 ?auto_83015 ) ( SURFACE-AT ?auto_83009 ?auto_83015 ) ( CLEAR ?auto_83009 ) ( LIFTING ?auto_83013 ?auto_83008 ) ( IS-CRATE ?auto_83008 ) ( ON ?auto_83006 ?auto_83005 ) ( ON ?auto_83007 ?auto_83006 ) ( ON ?auto_83009 ?auto_83007 ) ( not ( = ?auto_83005 ?auto_83006 ) ) ( not ( = ?auto_83005 ?auto_83007 ) ) ( not ( = ?auto_83005 ?auto_83009 ) ) ( not ( = ?auto_83005 ?auto_83008 ) ) ( not ( = ?auto_83005 ?auto_83010 ) ) ( not ( = ?auto_83005 ?auto_83011 ) ) ( not ( = ?auto_83006 ?auto_83007 ) ) ( not ( = ?auto_83006 ?auto_83009 ) ) ( not ( = ?auto_83006 ?auto_83008 ) ) ( not ( = ?auto_83006 ?auto_83010 ) ) ( not ( = ?auto_83006 ?auto_83011 ) ) ( not ( = ?auto_83007 ?auto_83009 ) ) ( not ( = ?auto_83007 ?auto_83008 ) ) ( not ( = ?auto_83007 ?auto_83010 ) ) ( not ( = ?auto_83007 ?auto_83011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83009 ?auto_83008 ?auto_83010 )
      ( MAKE-5CRATE-VERIFY ?auto_83005 ?auto_83006 ?auto_83007 ?auto_83009 ?auto_83008 ?auto_83010 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83056 - SURFACE
      ?auto_83057 - SURFACE
      ?auto_83058 - SURFACE
      ?auto_83060 - SURFACE
      ?auto_83059 - SURFACE
      ?auto_83061 - SURFACE
    )
    :vars
    (
      ?auto_83062 - HOIST
      ?auto_83063 - PLACE
      ?auto_83066 - PLACE
      ?auto_83064 - HOIST
      ?auto_83065 - SURFACE
      ?auto_83067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_83062 ?auto_83063 ) ( IS-CRATE ?auto_83061 ) ( not ( = ?auto_83059 ?auto_83061 ) ) ( not ( = ?auto_83060 ?auto_83059 ) ) ( not ( = ?auto_83060 ?auto_83061 ) ) ( not ( = ?auto_83066 ?auto_83063 ) ) ( HOIST-AT ?auto_83064 ?auto_83066 ) ( not ( = ?auto_83062 ?auto_83064 ) ) ( AVAILABLE ?auto_83064 ) ( SURFACE-AT ?auto_83061 ?auto_83066 ) ( ON ?auto_83061 ?auto_83065 ) ( CLEAR ?auto_83061 ) ( not ( = ?auto_83059 ?auto_83065 ) ) ( not ( = ?auto_83061 ?auto_83065 ) ) ( not ( = ?auto_83060 ?auto_83065 ) ) ( TRUCK-AT ?auto_83067 ?auto_83063 ) ( SURFACE-AT ?auto_83060 ?auto_83063 ) ( CLEAR ?auto_83060 ) ( IS-CRATE ?auto_83059 ) ( AVAILABLE ?auto_83062 ) ( IN ?auto_83059 ?auto_83067 ) ( ON ?auto_83057 ?auto_83056 ) ( ON ?auto_83058 ?auto_83057 ) ( ON ?auto_83060 ?auto_83058 ) ( not ( = ?auto_83056 ?auto_83057 ) ) ( not ( = ?auto_83056 ?auto_83058 ) ) ( not ( = ?auto_83056 ?auto_83060 ) ) ( not ( = ?auto_83056 ?auto_83059 ) ) ( not ( = ?auto_83056 ?auto_83061 ) ) ( not ( = ?auto_83056 ?auto_83065 ) ) ( not ( = ?auto_83057 ?auto_83058 ) ) ( not ( = ?auto_83057 ?auto_83060 ) ) ( not ( = ?auto_83057 ?auto_83059 ) ) ( not ( = ?auto_83057 ?auto_83061 ) ) ( not ( = ?auto_83057 ?auto_83065 ) ) ( not ( = ?auto_83058 ?auto_83060 ) ) ( not ( = ?auto_83058 ?auto_83059 ) ) ( not ( = ?auto_83058 ?auto_83061 ) ) ( not ( = ?auto_83058 ?auto_83065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83060 ?auto_83059 ?auto_83061 )
      ( MAKE-5CRATE-VERIFY ?auto_83056 ?auto_83057 ?auto_83058 ?auto_83060 ?auto_83059 ?auto_83061 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_84048 - SURFACE
      ?auto_84049 - SURFACE
    )
    :vars
    (
      ?auto_84055 - HOIST
      ?auto_84052 - PLACE
      ?auto_84050 - SURFACE
      ?auto_84051 - PLACE
      ?auto_84054 - HOIST
      ?auto_84053 - SURFACE
      ?auto_84056 - TRUCK
      ?auto_84057 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84055 ?auto_84052 ) ( SURFACE-AT ?auto_84048 ?auto_84052 ) ( CLEAR ?auto_84048 ) ( IS-CRATE ?auto_84049 ) ( not ( = ?auto_84048 ?auto_84049 ) ) ( ON ?auto_84048 ?auto_84050 ) ( not ( = ?auto_84050 ?auto_84048 ) ) ( not ( = ?auto_84050 ?auto_84049 ) ) ( not ( = ?auto_84051 ?auto_84052 ) ) ( HOIST-AT ?auto_84054 ?auto_84051 ) ( not ( = ?auto_84055 ?auto_84054 ) ) ( AVAILABLE ?auto_84054 ) ( SURFACE-AT ?auto_84049 ?auto_84051 ) ( ON ?auto_84049 ?auto_84053 ) ( CLEAR ?auto_84049 ) ( not ( = ?auto_84048 ?auto_84053 ) ) ( not ( = ?auto_84049 ?auto_84053 ) ) ( not ( = ?auto_84050 ?auto_84053 ) ) ( TRUCK-AT ?auto_84056 ?auto_84052 ) ( LIFTING ?auto_84055 ?auto_84057 ) ( IS-CRATE ?auto_84057 ) ( not ( = ?auto_84048 ?auto_84057 ) ) ( not ( = ?auto_84049 ?auto_84057 ) ) ( not ( = ?auto_84050 ?auto_84057 ) ) ( not ( = ?auto_84053 ?auto_84057 ) ) )
    :subtasks
    ( ( !LOAD ?auto_84055 ?auto_84057 ?auto_84056 ?auto_84052 )
      ( MAKE-1CRATE ?auto_84048 ?auto_84049 )
      ( MAKE-1CRATE-VERIFY ?auto_84048 ?auto_84049 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84263 - SURFACE
      ?auto_84264 - SURFACE
      ?auto_84265 - SURFACE
      ?auto_84267 - SURFACE
      ?auto_84266 - SURFACE
      ?auto_84268 - SURFACE
      ?auto_84269 - SURFACE
    )
    :vars
    (
      ?auto_84271 - HOIST
      ?auto_84270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84271 ?auto_84270 ) ( SURFACE-AT ?auto_84268 ?auto_84270 ) ( CLEAR ?auto_84268 ) ( LIFTING ?auto_84271 ?auto_84269 ) ( IS-CRATE ?auto_84269 ) ( not ( = ?auto_84268 ?auto_84269 ) ) ( ON ?auto_84264 ?auto_84263 ) ( ON ?auto_84265 ?auto_84264 ) ( ON ?auto_84267 ?auto_84265 ) ( ON ?auto_84266 ?auto_84267 ) ( ON ?auto_84268 ?auto_84266 ) ( not ( = ?auto_84263 ?auto_84264 ) ) ( not ( = ?auto_84263 ?auto_84265 ) ) ( not ( = ?auto_84263 ?auto_84267 ) ) ( not ( = ?auto_84263 ?auto_84266 ) ) ( not ( = ?auto_84263 ?auto_84268 ) ) ( not ( = ?auto_84263 ?auto_84269 ) ) ( not ( = ?auto_84264 ?auto_84265 ) ) ( not ( = ?auto_84264 ?auto_84267 ) ) ( not ( = ?auto_84264 ?auto_84266 ) ) ( not ( = ?auto_84264 ?auto_84268 ) ) ( not ( = ?auto_84264 ?auto_84269 ) ) ( not ( = ?auto_84265 ?auto_84267 ) ) ( not ( = ?auto_84265 ?auto_84266 ) ) ( not ( = ?auto_84265 ?auto_84268 ) ) ( not ( = ?auto_84265 ?auto_84269 ) ) ( not ( = ?auto_84267 ?auto_84266 ) ) ( not ( = ?auto_84267 ?auto_84268 ) ) ( not ( = ?auto_84267 ?auto_84269 ) ) ( not ( = ?auto_84266 ?auto_84268 ) ) ( not ( = ?auto_84266 ?auto_84269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_84268 ?auto_84269 )
      ( MAKE-6CRATE-VERIFY ?auto_84263 ?auto_84264 ?auto_84265 ?auto_84267 ?auto_84266 ?auto_84268 ?auto_84269 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84307 - SURFACE
      ?auto_84308 - SURFACE
      ?auto_84309 - SURFACE
      ?auto_84311 - SURFACE
      ?auto_84310 - SURFACE
      ?auto_84312 - SURFACE
      ?auto_84313 - SURFACE
    )
    :vars
    (
      ?auto_84316 - HOIST
      ?auto_84315 - PLACE
      ?auto_84314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84316 ?auto_84315 ) ( SURFACE-AT ?auto_84312 ?auto_84315 ) ( CLEAR ?auto_84312 ) ( IS-CRATE ?auto_84313 ) ( not ( = ?auto_84312 ?auto_84313 ) ) ( TRUCK-AT ?auto_84314 ?auto_84315 ) ( AVAILABLE ?auto_84316 ) ( IN ?auto_84313 ?auto_84314 ) ( ON ?auto_84312 ?auto_84310 ) ( not ( = ?auto_84310 ?auto_84312 ) ) ( not ( = ?auto_84310 ?auto_84313 ) ) ( ON ?auto_84308 ?auto_84307 ) ( ON ?auto_84309 ?auto_84308 ) ( ON ?auto_84311 ?auto_84309 ) ( ON ?auto_84310 ?auto_84311 ) ( not ( = ?auto_84307 ?auto_84308 ) ) ( not ( = ?auto_84307 ?auto_84309 ) ) ( not ( = ?auto_84307 ?auto_84311 ) ) ( not ( = ?auto_84307 ?auto_84310 ) ) ( not ( = ?auto_84307 ?auto_84312 ) ) ( not ( = ?auto_84307 ?auto_84313 ) ) ( not ( = ?auto_84308 ?auto_84309 ) ) ( not ( = ?auto_84308 ?auto_84311 ) ) ( not ( = ?auto_84308 ?auto_84310 ) ) ( not ( = ?auto_84308 ?auto_84312 ) ) ( not ( = ?auto_84308 ?auto_84313 ) ) ( not ( = ?auto_84309 ?auto_84311 ) ) ( not ( = ?auto_84309 ?auto_84310 ) ) ( not ( = ?auto_84309 ?auto_84312 ) ) ( not ( = ?auto_84309 ?auto_84313 ) ) ( not ( = ?auto_84311 ?auto_84310 ) ) ( not ( = ?auto_84311 ?auto_84312 ) ) ( not ( = ?auto_84311 ?auto_84313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84310 ?auto_84312 ?auto_84313 )
      ( MAKE-6CRATE-VERIFY ?auto_84307 ?auto_84308 ?auto_84309 ?auto_84311 ?auto_84310 ?auto_84312 ?auto_84313 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84358 - SURFACE
      ?auto_84359 - SURFACE
      ?auto_84360 - SURFACE
      ?auto_84362 - SURFACE
      ?auto_84361 - SURFACE
      ?auto_84363 - SURFACE
      ?auto_84364 - SURFACE
    )
    :vars
    (
      ?auto_84368 - HOIST
      ?auto_84366 - PLACE
      ?auto_84367 - TRUCK
      ?auto_84365 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84368 ?auto_84366 ) ( SURFACE-AT ?auto_84363 ?auto_84366 ) ( CLEAR ?auto_84363 ) ( IS-CRATE ?auto_84364 ) ( not ( = ?auto_84363 ?auto_84364 ) ) ( AVAILABLE ?auto_84368 ) ( IN ?auto_84364 ?auto_84367 ) ( ON ?auto_84363 ?auto_84361 ) ( not ( = ?auto_84361 ?auto_84363 ) ) ( not ( = ?auto_84361 ?auto_84364 ) ) ( TRUCK-AT ?auto_84367 ?auto_84365 ) ( not ( = ?auto_84365 ?auto_84366 ) ) ( ON ?auto_84359 ?auto_84358 ) ( ON ?auto_84360 ?auto_84359 ) ( ON ?auto_84362 ?auto_84360 ) ( ON ?auto_84361 ?auto_84362 ) ( not ( = ?auto_84358 ?auto_84359 ) ) ( not ( = ?auto_84358 ?auto_84360 ) ) ( not ( = ?auto_84358 ?auto_84362 ) ) ( not ( = ?auto_84358 ?auto_84361 ) ) ( not ( = ?auto_84358 ?auto_84363 ) ) ( not ( = ?auto_84358 ?auto_84364 ) ) ( not ( = ?auto_84359 ?auto_84360 ) ) ( not ( = ?auto_84359 ?auto_84362 ) ) ( not ( = ?auto_84359 ?auto_84361 ) ) ( not ( = ?auto_84359 ?auto_84363 ) ) ( not ( = ?auto_84359 ?auto_84364 ) ) ( not ( = ?auto_84360 ?auto_84362 ) ) ( not ( = ?auto_84360 ?auto_84361 ) ) ( not ( = ?auto_84360 ?auto_84363 ) ) ( not ( = ?auto_84360 ?auto_84364 ) ) ( not ( = ?auto_84362 ?auto_84361 ) ) ( not ( = ?auto_84362 ?auto_84363 ) ) ( not ( = ?auto_84362 ?auto_84364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84361 ?auto_84363 ?auto_84364 )
      ( MAKE-6CRATE-VERIFY ?auto_84358 ?auto_84359 ?auto_84360 ?auto_84362 ?auto_84361 ?auto_84363 ?auto_84364 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84415 - SURFACE
      ?auto_84416 - SURFACE
      ?auto_84417 - SURFACE
      ?auto_84419 - SURFACE
      ?auto_84418 - SURFACE
      ?auto_84420 - SURFACE
      ?auto_84421 - SURFACE
    )
    :vars
    (
      ?auto_84423 - HOIST
      ?auto_84422 - PLACE
      ?auto_84426 - TRUCK
      ?auto_84425 - PLACE
      ?auto_84424 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_84423 ?auto_84422 ) ( SURFACE-AT ?auto_84420 ?auto_84422 ) ( CLEAR ?auto_84420 ) ( IS-CRATE ?auto_84421 ) ( not ( = ?auto_84420 ?auto_84421 ) ) ( AVAILABLE ?auto_84423 ) ( ON ?auto_84420 ?auto_84418 ) ( not ( = ?auto_84418 ?auto_84420 ) ) ( not ( = ?auto_84418 ?auto_84421 ) ) ( TRUCK-AT ?auto_84426 ?auto_84425 ) ( not ( = ?auto_84425 ?auto_84422 ) ) ( HOIST-AT ?auto_84424 ?auto_84425 ) ( LIFTING ?auto_84424 ?auto_84421 ) ( not ( = ?auto_84423 ?auto_84424 ) ) ( ON ?auto_84416 ?auto_84415 ) ( ON ?auto_84417 ?auto_84416 ) ( ON ?auto_84419 ?auto_84417 ) ( ON ?auto_84418 ?auto_84419 ) ( not ( = ?auto_84415 ?auto_84416 ) ) ( not ( = ?auto_84415 ?auto_84417 ) ) ( not ( = ?auto_84415 ?auto_84419 ) ) ( not ( = ?auto_84415 ?auto_84418 ) ) ( not ( = ?auto_84415 ?auto_84420 ) ) ( not ( = ?auto_84415 ?auto_84421 ) ) ( not ( = ?auto_84416 ?auto_84417 ) ) ( not ( = ?auto_84416 ?auto_84419 ) ) ( not ( = ?auto_84416 ?auto_84418 ) ) ( not ( = ?auto_84416 ?auto_84420 ) ) ( not ( = ?auto_84416 ?auto_84421 ) ) ( not ( = ?auto_84417 ?auto_84419 ) ) ( not ( = ?auto_84417 ?auto_84418 ) ) ( not ( = ?auto_84417 ?auto_84420 ) ) ( not ( = ?auto_84417 ?auto_84421 ) ) ( not ( = ?auto_84419 ?auto_84418 ) ) ( not ( = ?auto_84419 ?auto_84420 ) ) ( not ( = ?auto_84419 ?auto_84421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84418 ?auto_84420 ?auto_84421 )
      ( MAKE-6CRATE-VERIFY ?auto_84415 ?auto_84416 ?auto_84417 ?auto_84419 ?auto_84418 ?auto_84420 ?auto_84421 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84478 - SURFACE
      ?auto_84479 - SURFACE
      ?auto_84480 - SURFACE
      ?auto_84482 - SURFACE
      ?auto_84481 - SURFACE
      ?auto_84483 - SURFACE
      ?auto_84484 - SURFACE
    )
    :vars
    (
      ?auto_84489 - HOIST
      ?auto_84485 - PLACE
      ?auto_84490 - TRUCK
      ?auto_84486 - PLACE
      ?auto_84488 - HOIST
      ?auto_84487 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84489 ?auto_84485 ) ( SURFACE-AT ?auto_84483 ?auto_84485 ) ( CLEAR ?auto_84483 ) ( IS-CRATE ?auto_84484 ) ( not ( = ?auto_84483 ?auto_84484 ) ) ( AVAILABLE ?auto_84489 ) ( ON ?auto_84483 ?auto_84481 ) ( not ( = ?auto_84481 ?auto_84483 ) ) ( not ( = ?auto_84481 ?auto_84484 ) ) ( TRUCK-AT ?auto_84490 ?auto_84486 ) ( not ( = ?auto_84486 ?auto_84485 ) ) ( HOIST-AT ?auto_84488 ?auto_84486 ) ( not ( = ?auto_84489 ?auto_84488 ) ) ( AVAILABLE ?auto_84488 ) ( SURFACE-AT ?auto_84484 ?auto_84486 ) ( ON ?auto_84484 ?auto_84487 ) ( CLEAR ?auto_84484 ) ( not ( = ?auto_84483 ?auto_84487 ) ) ( not ( = ?auto_84484 ?auto_84487 ) ) ( not ( = ?auto_84481 ?auto_84487 ) ) ( ON ?auto_84479 ?auto_84478 ) ( ON ?auto_84480 ?auto_84479 ) ( ON ?auto_84482 ?auto_84480 ) ( ON ?auto_84481 ?auto_84482 ) ( not ( = ?auto_84478 ?auto_84479 ) ) ( not ( = ?auto_84478 ?auto_84480 ) ) ( not ( = ?auto_84478 ?auto_84482 ) ) ( not ( = ?auto_84478 ?auto_84481 ) ) ( not ( = ?auto_84478 ?auto_84483 ) ) ( not ( = ?auto_84478 ?auto_84484 ) ) ( not ( = ?auto_84478 ?auto_84487 ) ) ( not ( = ?auto_84479 ?auto_84480 ) ) ( not ( = ?auto_84479 ?auto_84482 ) ) ( not ( = ?auto_84479 ?auto_84481 ) ) ( not ( = ?auto_84479 ?auto_84483 ) ) ( not ( = ?auto_84479 ?auto_84484 ) ) ( not ( = ?auto_84479 ?auto_84487 ) ) ( not ( = ?auto_84480 ?auto_84482 ) ) ( not ( = ?auto_84480 ?auto_84481 ) ) ( not ( = ?auto_84480 ?auto_84483 ) ) ( not ( = ?auto_84480 ?auto_84484 ) ) ( not ( = ?auto_84480 ?auto_84487 ) ) ( not ( = ?auto_84482 ?auto_84481 ) ) ( not ( = ?auto_84482 ?auto_84483 ) ) ( not ( = ?auto_84482 ?auto_84484 ) ) ( not ( = ?auto_84482 ?auto_84487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84481 ?auto_84483 ?auto_84484 )
      ( MAKE-6CRATE-VERIFY ?auto_84478 ?auto_84479 ?auto_84480 ?auto_84482 ?auto_84481 ?auto_84483 ?auto_84484 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84542 - SURFACE
      ?auto_84543 - SURFACE
      ?auto_84544 - SURFACE
      ?auto_84546 - SURFACE
      ?auto_84545 - SURFACE
      ?auto_84547 - SURFACE
      ?auto_84548 - SURFACE
    )
    :vars
    (
      ?auto_84551 - HOIST
      ?auto_84549 - PLACE
      ?auto_84554 - PLACE
      ?auto_84550 - HOIST
      ?auto_84552 - SURFACE
      ?auto_84553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84551 ?auto_84549 ) ( SURFACE-AT ?auto_84547 ?auto_84549 ) ( CLEAR ?auto_84547 ) ( IS-CRATE ?auto_84548 ) ( not ( = ?auto_84547 ?auto_84548 ) ) ( AVAILABLE ?auto_84551 ) ( ON ?auto_84547 ?auto_84545 ) ( not ( = ?auto_84545 ?auto_84547 ) ) ( not ( = ?auto_84545 ?auto_84548 ) ) ( not ( = ?auto_84554 ?auto_84549 ) ) ( HOIST-AT ?auto_84550 ?auto_84554 ) ( not ( = ?auto_84551 ?auto_84550 ) ) ( AVAILABLE ?auto_84550 ) ( SURFACE-AT ?auto_84548 ?auto_84554 ) ( ON ?auto_84548 ?auto_84552 ) ( CLEAR ?auto_84548 ) ( not ( = ?auto_84547 ?auto_84552 ) ) ( not ( = ?auto_84548 ?auto_84552 ) ) ( not ( = ?auto_84545 ?auto_84552 ) ) ( TRUCK-AT ?auto_84553 ?auto_84549 ) ( ON ?auto_84543 ?auto_84542 ) ( ON ?auto_84544 ?auto_84543 ) ( ON ?auto_84546 ?auto_84544 ) ( ON ?auto_84545 ?auto_84546 ) ( not ( = ?auto_84542 ?auto_84543 ) ) ( not ( = ?auto_84542 ?auto_84544 ) ) ( not ( = ?auto_84542 ?auto_84546 ) ) ( not ( = ?auto_84542 ?auto_84545 ) ) ( not ( = ?auto_84542 ?auto_84547 ) ) ( not ( = ?auto_84542 ?auto_84548 ) ) ( not ( = ?auto_84542 ?auto_84552 ) ) ( not ( = ?auto_84543 ?auto_84544 ) ) ( not ( = ?auto_84543 ?auto_84546 ) ) ( not ( = ?auto_84543 ?auto_84545 ) ) ( not ( = ?auto_84543 ?auto_84547 ) ) ( not ( = ?auto_84543 ?auto_84548 ) ) ( not ( = ?auto_84543 ?auto_84552 ) ) ( not ( = ?auto_84544 ?auto_84546 ) ) ( not ( = ?auto_84544 ?auto_84545 ) ) ( not ( = ?auto_84544 ?auto_84547 ) ) ( not ( = ?auto_84544 ?auto_84548 ) ) ( not ( = ?auto_84544 ?auto_84552 ) ) ( not ( = ?auto_84546 ?auto_84545 ) ) ( not ( = ?auto_84546 ?auto_84547 ) ) ( not ( = ?auto_84546 ?auto_84548 ) ) ( not ( = ?auto_84546 ?auto_84552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84545 ?auto_84547 ?auto_84548 )
      ( MAKE-6CRATE-VERIFY ?auto_84542 ?auto_84543 ?auto_84544 ?auto_84546 ?auto_84545 ?auto_84547 ?auto_84548 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84606 - SURFACE
      ?auto_84607 - SURFACE
      ?auto_84608 - SURFACE
      ?auto_84610 - SURFACE
      ?auto_84609 - SURFACE
      ?auto_84611 - SURFACE
      ?auto_84612 - SURFACE
    )
    :vars
    (
      ?auto_84613 - HOIST
      ?auto_84614 - PLACE
      ?auto_84616 - PLACE
      ?auto_84617 - HOIST
      ?auto_84618 - SURFACE
      ?auto_84615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84613 ?auto_84614 ) ( IS-CRATE ?auto_84612 ) ( not ( = ?auto_84611 ?auto_84612 ) ) ( not ( = ?auto_84609 ?auto_84611 ) ) ( not ( = ?auto_84609 ?auto_84612 ) ) ( not ( = ?auto_84616 ?auto_84614 ) ) ( HOIST-AT ?auto_84617 ?auto_84616 ) ( not ( = ?auto_84613 ?auto_84617 ) ) ( AVAILABLE ?auto_84617 ) ( SURFACE-AT ?auto_84612 ?auto_84616 ) ( ON ?auto_84612 ?auto_84618 ) ( CLEAR ?auto_84612 ) ( not ( = ?auto_84611 ?auto_84618 ) ) ( not ( = ?auto_84612 ?auto_84618 ) ) ( not ( = ?auto_84609 ?auto_84618 ) ) ( TRUCK-AT ?auto_84615 ?auto_84614 ) ( SURFACE-AT ?auto_84609 ?auto_84614 ) ( CLEAR ?auto_84609 ) ( LIFTING ?auto_84613 ?auto_84611 ) ( IS-CRATE ?auto_84611 ) ( ON ?auto_84607 ?auto_84606 ) ( ON ?auto_84608 ?auto_84607 ) ( ON ?auto_84610 ?auto_84608 ) ( ON ?auto_84609 ?auto_84610 ) ( not ( = ?auto_84606 ?auto_84607 ) ) ( not ( = ?auto_84606 ?auto_84608 ) ) ( not ( = ?auto_84606 ?auto_84610 ) ) ( not ( = ?auto_84606 ?auto_84609 ) ) ( not ( = ?auto_84606 ?auto_84611 ) ) ( not ( = ?auto_84606 ?auto_84612 ) ) ( not ( = ?auto_84606 ?auto_84618 ) ) ( not ( = ?auto_84607 ?auto_84608 ) ) ( not ( = ?auto_84607 ?auto_84610 ) ) ( not ( = ?auto_84607 ?auto_84609 ) ) ( not ( = ?auto_84607 ?auto_84611 ) ) ( not ( = ?auto_84607 ?auto_84612 ) ) ( not ( = ?auto_84607 ?auto_84618 ) ) ( not ( = ?auto_84608 ?auto_84610 ) ) ( not ( = ?auto_84608 ?auto_84609 ) ) ( not ( = ?auto_84608 ?auto_84611 ) ) ( not ( = ?auto_84608 ?auto_84612 ) ) ( not ( = ?auto_84608 ?auto_84618 ) ) ( not ( = ?auto_84610 ?auto_84609 ) ) ( not ( = ?auto_84610 ?auto_84611 ) ) ( not ( = ?auto_84610 ?auto_84612 ) ) ( not ( = ?auto_84610 ?auto_84618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84609 ?auto_84611 ?auto_84612 )
      ( MAKE-6CRATE-VERIFY ?auto_84606 ?auto_84607 ?auto_84608 ?auto_84610 ?auto_84609 ?auto_84611 ?auto_84612 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84670 - SURFACE
      ?auto_84671 - SURFACE
      ?auto_84672 - SURFACE
      ?auto_84674 - SURFACE
      ?auto_84673 - SURFACE
      ?auto_84675 - SURFACE
      ?auto_84676 - SURFACE
    )
    :vars
    (
      ?auto_84677 - HOIST
      ?auto_84679 - PLACE
      ?auto_84681 - PLACE
      ?auto_84680 - HOIST
      ?auto_84678 - SURFACE
      ?auto_84682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84677 ?auto_84679 ) ( IS-CRATE ?auto_84676 ) ( not ( = ?auto_84675 ?auto_84676 ) ) ( not ( = ?auto_84673 ?auto_84675 ) ) ( not ( = ?auto_84673 ?auto_84676 ) ) ( not ( = ?auto_84681 ?auto_84679 ) ) ( HOIST-AT ?auto_84680 ?auto_84681 ) ( not ( = ?auto_84677 ?auto_84680 ) ) ( AVAILABLE ?auto_84680 ) ( SURFACE-AT ?auto_84676 ?auto_84681 ) ( ON ?auto_84676 ?auto_84678 ) ( CLEAR ?auto_84676 ) ( not ( = ?auto_84675 ?auto_84678 ) ) ( not ( = ?auto_84676 ?auto_84678 ) ) ( not ( = ?auto_84673 ?auto_84678 ) ) ( TRUCK-AT ?auto_84682 ?auto_84679 ) ( SURFACE-AT ?auto_84673 ?auto_84679 ) ( CLEAR ?auto_84673 ) ( IS-CRATE ?auto_84675 ) ( AVAILABLE ?auto_84677 ) ( IN ?auto_84675 ?auto_84682 ) ( ON ?auto_84671 ?auto_84670 ) ( ON ?auto_84672 ?auto_84671 ) ( ON ?auto_84674 ?auto_84672 ) ( ON ?auto_84673 ?auto_84674 ) ( not ( = ?auto_84670 ?auto_84671 ) ) ( not ( = ?auto_84670 ?auto_84672 ) ) ( not ( = ?auto_84670 ?auto_84674 ) ) ( not ( = ?auto_84670 ?auto_84673 ) ) ( not ( = ?auto_84670 ?auto_84675 ) ) ( not ( = ?auto_84670 ?auto_84676 ) ) ( not ( = ?auto_84670 ?auto_84678 ) ) ( not ( = ?auto_84671 ?auto_84672 ) ) ( not ( = ?auto_84671 ?auto_84674 ) ) ( not ( = ?auto_84671 ?auto_84673 ) ) ( not ( = ?auto_84671 ?auto_84675 ) ) ( not ( = ?auto_84671 ?auto_84676 ) ) ( not ( = ?auto_84671 ?auto_84678 ) ) ( not ( = ?auto_84672 ?auto_84674 ) ) ( not ( = ?auto_84672 ?auto_84673 ) ) ( not ( = ?auto_84672 ?auto_84675 ) ) ( not ( = ?auto_84672 ?auto_84676 ) ) ( not ( = ?auto_84672 ?auto_84678 ) ) ( not ( = ?auto_84674 ?auto_84673 ) ) ( not ( = ?auto_84674 ?auto_84675 ) ) ( not ( = ?auto_84674 ?auto_84676 ) ) ( not ( = ?auto_84674 ?auto_84678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84673 ?auto_84675 ?auto_84676 )
      ( MAKE-6CRATE-VERIFY ?auto_84670 ?auto_84671 ?auto_84672 ?auto_84674 ?auto_84673 ?auto_84675 ?auto_84676 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86626 - SURFACE
      ?auto_86627 - SURFACE
      ?auto_86628 - SURFACE
      ?auto_86630 - SURFACE
      ?auto_86629 - SURFACE
      ?auto_86631 - SURFACE
      ?auto_86632 - SURFACE
      ?auto_86633 - SURFACE
    )
    :vars
    (
      ?auto_86635 - HOIST
      ?auto_86634 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_86635 ?auto_86634 ) ( SURFACE-AT ?auto_86632 ?auto_86634 ) ( CLEAR ?auto_86632 ) ( LIFTING ?auto_86635 ?auto_86633 ) ( IS-CRATE ?auto_86633 ) ( not ( = ?auto_86632 ?auto_86633 ) ) ( ON ?auto_86627 ?auto_86626 ) ( ON ?auto_86628 ?auto_86627 ) ( ON ?auto_86630 ?auto_86628 ) ( ON ?auto_86629 ?auto_86630 ) ( ON ?auto_86631 ?auto_86629 ) ( ON ?auto_86632 ?auto_86631 ) ( not ( = ?auto_86626 ?auto_86627 ) ) ( not ( = ?auto_86626 ?auto_86628 ) ) ( not ( = ?auto_86626 ?auto_86630 ) ) ( not ( = ?auto_86626 ?auto_86629 ) ) ( not ( = ?auto_86626 ?auto_86631 ) ) ( not ( = ?auto_86626 ?auto_86632 ) ) ( not ( = ?auto_86626 ?auto_86633 ) ) ( not ( = ?auto_86627 ?auto_86628 ) ) ( not ( = ?auto_86627 ?auto_86630 ) ) ( not ( = ?auto_86627 ?auto_86629 ) ) ( not ( = ?auto_86627 ?auto_86631 ) ) ( not ( = ?auto_86627 ?auto_86632 ) ) ( not ( = ?auto_86627 ?auto_86633 ) ) ( not ( = ?auto_86628 ?auto_86630 ) ) ( not ( = ?auto_86628 ?auto_86629 ) ) ( not ( = ?auto_86628 ?auto_86631 ) ) ( not ( = ?auto_86628 ?auto_86632 ) ) ( not ( = ?auto_86628 ?auto_86633 ) ) ( not ( = ?auto_86630 ?auto_86629 ) ) ( not ( = ?auto_86630 ?auto_86631 ) ) ( not ( = ?auto_86630 ?auto_86632 ) ) ( not ( = ?auto_86630 ?auto_86633 ) ) ( not ( = ?auto_86629 ?auto_86631 ) ) ( not ( = ?auto_86629 ?auto_86632 ) ) ( not ( = ?auto_86629 ?auto_86633 ) ) ( not ( = ?auto_86631 ?auto_86632 ) ) ( not ( = ?auto_86631 ?auto_86633 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_86632 ?auto_86633 )
      ( MAKE-7CRATE-VERIFY ?auto_86626 ?auto_86627 ?auto_86628 ?auto_86630 ?auto_86629 ?auto_86631 ?auto_86632 ?auto_86633 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86681 - SURFACE
      ?auto_86682 - SURFACE
      ?auto_86683 - SURFACE
      ?auto_86685 - SURFACE
      ?auto_86684 - SURFACE
      ?auto_86686 - SURFACE
      ?auto_86687 - SURFACE
      ?auto_86688 - SURFACE
    )
    :vars
    (
      ?auto_86689 - HOIST
      ?auto_86690 - PLACE
      ?auto_86691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_86689 ?auto_86690 ) ( SURFACE-AT ?auto_86687 ?auto_86690 ) ( CLEAR ?auto_86687 ) ( IS-CRATE ?auto_86688 ) ( not ( = ?auto_86687 ?auto_86688 ) ) ( TRUCK-AT ?auto_86691 ?auto_86690 ) ( AVAILABLE ?auto_86689 ) ( IN ?auto_86688 ?auto_86691 ) ( ON ?auto_86687 ?auto_86686 ) ( not ( = ?auto_86686 ?auto_86687 ) ) ( not ( = ?auto_86686 ?auto_86688 ) ) ( ON ?auto_86682 ?auto_86681 ) ( ON ?auto_86683 ?auto_86682 ) ( ON ?auto_86685 ?auto_86683 ) ( ON ?auto_86684 ?auto_86685 ) ( ON ?auto_86686 ?auto_86684 ) ( not ( = ?auto_86681 ?auto_86682 ) ) ( not ( = ?auto_86681 ?auto_86683 ) ) ( not ( = ?auto_86681 ?auto_86685 ) ) ( not ( = ?auto_86681 ?auto_86684 ) ) ( not ( = ?auto_86681 ?auto_86686 ) ) ( not ( = ?auto_86681 ?auto_86687 ) ) ( not ( = ?auto_86681 ?auto_86688 ) ) ( not ( = ?auto_86682 ?auto_86683 ) ) ( not ( = ?auto_86682 ?auto_86685 ) ) ( not ( = ?auto_86682 ?auto_86684 ) ) ( not ( = ?auto_86682 ?auto_86686 ) ) ( not ( = ?auto_86682 ?auto_86687 ) ) ( not ( = ?auto_86682 ?auto_86688 ) ) ( not ( = ?auto_86683 ?auto_86685 ) ) ( not ( = ?auto_86683 ?auto_86684 ) ) ( not ( = ?auto_86683 ?auto_86686 ) ) ( not ( = ?auto_86683 ?auto_86687 ) ) ( not ( = ?auto_86683 ?auto_86688 ) ) ( not ( = ?auto_86685 ?auto_86684 ) ) ( not ( = ?auto_86685 ?auto_86686 ) ) ( not ( = ?auto_86685 ?auto_86687 ) ) ( not ( = ?auto_86685 ?auto_86688 ) ) ( not ( = ?auto_86684 ?auto_86686 ) ) ( not ( = ?auto_86684 ?auto_86687 ) ) ( not ( = ?auto_86684 ?auto_86688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86686 ?auto_86687 ?auto_86688 )
      ( MAKE-7CRATE-VERIFY ?auto_86681 ?auto_86682 ?auto_86683 ?auto_86685 ?auto_86684 ?auto_86686 ?auto_86687 ?auto_86688 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86744 - SURFACE
      ?auto_86745 - SURFACE
      ?auto_86746 - SURFACE
      ?auto_86748 - SURFACE
      ?auto_86747 - SURFACE
      ?auto_86749 - SURFACE
      ?auto_86750 - SURFACE
      ?auto_86751 - SURFACE
    )
    :vars
    (
      ?auto_86753 - HOIST
      ?auto_86755 - PLACE
      ?auto_86754 - TRUCK
      ?auto_86752 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_86753 ?auto_86755 ) ( SURFACE-AT ?auto_86750 ?auto_86755 ) ( CLEAR ?auto_86750 ) ( IS-CRATE ?auto_86751 ) ( not ( = ?auto_86750 ?auto_86751 ) ) ( AVAILABLE ?auto_86753 ) ( IN ?auto_86751 ?auto_86754 ) ( ON ?auto_86750 ?auto_86749 ) ( not ( = ?auto_86749 ?auto_86750 ) ) ( not ( = ?auto_86749 ?auto_86751 ) ) ( TRUCK-AT ?auto_86754 ?auto_86752 ) ( not ( = ?auto_86752 ?auto_86755 ) ) ( ON ?auto_86745 ?auto_86744 ) ( ON ?auto_86746 ?auto_86745 ) ( ON ?auto_86748 ?auto_86746 ) ( ON ?auto_86747 ?auto_86748 ) ( ON ?auto_86749 ?auto_86747 ) ( not ( = ?auto_86744 ?auto_86745 ) ) ( not ( = ?auto_86744 ?auto_86746 ) ) ( not ( = ?auto_86744 ?auto_86748 ) ) ( not ( = ?auto_86744 ?auto_86747 ) ) ( not ( = ?auto_86744 ?auto_86749 ) ) ( not ( = ?auto_86744 ?auto_86750 ) ) ( not ( = ?auto_86744 ?auto_86751 ) ) ( not ( = ?auto_86745 ?auto_86746 ) ) ( not ( = ?auto_86745 ?auto_86748 ) ) ( not ( = ?auto_86745 ?auto_86747 ) ) ( not ( = ?auto_86745 ?auto_86749 ) ) ( not ( = ?auto_86745 ?auto_86750 ) ) ( not ( = ?auto_86745 ?auto_86751 ) ) ( not ( = ?auto_86746 ?auto_86748 ) ) ( not ( = ?auto_86746 ?auto_86747 ) ) ( not ( = ?auto_86746 ?auto_86749 ) ) ( not ( = ?auto_86746 ?auto_86750 ) ) ( not ( = ?auto_86746 ?auto_86751 ) ) ( not ( = ?auto_86748 ?auto_86747 ) ) ( not ( = ?auto_86748 ?auto_86749 ) ) ( not ( = ?auto_86748 ?auto_86750 ) ) ( not ( = ?auto_86748 ?auto_86751 ) ) ( not ( = ?auto_86747 ?auto_86749 ) ) ( not ( = ?auto_86747 ?auto_86750 ) ) ( not ( = ?auto_86747 ?auto_86751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86749 ?auto_86750 ?auto_86751 )
      ( MAKE-7CRATE-VERIFY ?auto_86744 ?auto_86745 ?auto_86746 ?auto_86748 ?auto_86747 ?auto_86749 ?auto_86750 ?auto_86751 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86814 - SURFACE
      ?auto_86815 - SURFACE
      ?auto_86816 - SURFACE
      ?auto_86818 - SURFACE
      ?auto_86817 - SURFACE
      ?auto_86819 - SURFACE
      ?auto_86820 - SURFACE
      ?auto_86821 - SURFACE
    )
    :vars
    (
      ?auto_86826 - HOIST
      ?auto_86823 - PLACE
      ?auto_86822 - TRUCK
      ?auto_86825 - PLACE
      ?auto_86824 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_86826 ?auto_86823 ) ( SURFACE-AT ?auto_86820 ?auto_86823 ) ( CLEAR ?auto_86820 ) ( IS-CRATE ?auto_86821 ) ( not ( = ?auto_86820 ?auto_86821 ) ) ( AVAILABLE ?auto_86826 ) ( ON ?auto_86820 ?auto_86819 ) ( not ( = ?auto_86819 ?auto_86820 ) ) ( not ( = ?auto_86819 ?auto_86821 ) ) ( TRUCK-AT ?auto_86822 ?auto_86825 ) ( not ( = ?auto_86825 ?auto_86823 ) ) ( HOIST-AT ?auto_86824 ?auto_86825 ) ( LIFTING ?auto_86824 ?auto_86821 ) ( not ( = ?auto_86826 ?auto_86824 ) ) ( ON ?auto_86815 ?auto_86814 ) ( ON ?auto_86816 ?auto_86815 ) ( ON ?auto_86818 ?auto_86816 ) ( ON ?auto_86817 ?auto_86818 ) ( ON ?auto_86819 ?auto_86817 ) ( not ( = ?auto_86814 ?auto_86815 ) ) ( not ( = ?auto_86814 ?auto_86816 ) ) ( not ( = ?auto_86814 ?auto_86818 ) ) ( not ( = ?auto_86814 ?auto_86817 ) ) ( not ( = ?auto_86814 ?auto_86819 ) ) ( not ( = ?auto_86814 ?auto_86820 ) ) ( not ( = ?auto_86814 ?auto_86821 ) ) ( not ( = ?auto_86815 ?auto_86816 ) ) ( not ( = ?auto_86815 ?auto_86818 ) ) ( not ( = ?auto_86815 ?auto_86817 ) ) ( not ( = ?auto_86815 ?auto_86819 ) ) ( not ( = ?auto_86815 ?auto_86820 ) ) ( not ( = ?auto_86815 ?auto_86821 ) ) ( not ( = ?auto_86816 ?auto_86818 ) ) ( not ( = ?auto_86816 ?auto_86817 ) ) ( not ( = ?auto_86816 ?auto_86819 ) ) ( not ( = ?auto_86816 ?auto_86820 ) ) ( not ( = ?auto_86816 ?auto_86821 ) ) ( not ( = ?auto_86818 ?auto_86817 ) ) ( not ( = ?auto_86818 ?auto_86819 ) ) ( not ( = ?auto_86818 ?auto_86820 ) ) ( not ( = ?auto_86818 ?auto_86821 ) ) ( not ( = ?auto_86817 ?auto_86819 ) ) ( not ( = ?auto_86817 ?auto_86820 ) ) ( not ( = ?auto_86817 ?auto_86821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86819 ?auto_86820 ?auto_86821 )
      ( MAKE-7CRATE-VERIFY ?auto_86814 ?auto_86815 ?auto_86816 ?auto_86818 ?auto_86817 ?auto_86819 ?auto_86820 ?auto_86821 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86891 - SURFACE
      ?auto_86892 - SURFACE
      ?auto_86893 - SURFACE
      ?auto_86895 - SURFACE
      ?auto_86894 - SURFACE
      ?auto_86896 - SURFACE
      ?auto_86897 - SURFACE
      ?auto_86898 - SURFACE
    )
    :vars
    (
      ?auto_86903 - HOIST
      ?auto_86901 - PLACE
      ?auto_86904 - TRUCK
      ?auto_86899 - PLACE
      ?auto_86900 - HOIST
      ?auto_86902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_86903 ?auto_86901 ) ( SURFACE-AT ?auto_86897 ?auto_86901 ) ( CLEAR ?auto_86897 ) ( IS-CRATE ?auto_86898 ) ( not ( = ?auto_86897 ?auto_86898 ) ) ( AVAILABLE ?auto_86903 ) ( ON ?auto_86897 ?auto_86896 ) ( not ( = ?auto_86896 ?auto_86897 ) ) ( not ( = ?auto_86896 ?auto_86898 ) ) ( TRUCK-AT ?auto_86904 ?auto_86899 ) ( not ( = ?auto_86899 ?auto_86901 ) ) ( HOIST-AT ?auto_86900 ?auto_86899 ) ( not ( = ?auto_86903 ?auto_86900 ) ) ( AVAILABLE ?auto_86900 ) ( SURFACE-AT ?auto_86898 ?auto_86899 ) ( ON ?auto_86898 ?auto_86902 ) ( CLEAR ?auto_86898 ) ( not ( = ?auto_86897 ?auto_86902 ) ) ( not ( = ?auto_86898 ?auto_86902 ) ) ( not ( = ?auto_86896 ?auto_86902 ) ) ( ON ?auto_86892 ?auto_86891 ) ( ON ?auto_86893 ?auto_86892 ) ( ON ?auto_86895 ?auto_86893 ) ( ON ?auto_86894 ?auto_86895 ) ( ON ?auto_86896 ?auto_86894 ) ( not ( = ?auto_86891 ?auto_86892 ) ) ( not ( = ?auto_86891 ?auto_86893 ) ) ( not ( = ?auto_86891 ?auto_86895 ) ) ( not ( = ?auto_86891 ?auto_86894 ) ) ( not ( = ?auto_86891 ?auto_86896 ) ) ( not ( = ?auto_86891 ?auto_86897 ) ) ( not ( = ?auto_86891 ?auto_86898 ) ) ( not ( = ?auto_86891 ?auto_86902 ) ) ( not ( = ?auto_86892 ?auto_86893 ) ) ( not ( = ?auto_86892 ?auto_86895 ) ) ( not ( = ?auto_86892 ?auto_86894 ) ) ( not ( = ?auto_86892 ?auto_86896 ) ) ( not ( = ?auto_86892 ?auto_86897 ) ) ( not ( = ?auto_86892 ?auto_86898 ) ) ( not ( = ?auto_86892 ?auto_86902 ) ) ( not ( = ?auto_86893 ?auto_86895 ) ) ( not ( = ?auto_86893 ?auto_86894 ) ) ( not ( = ?auto_86893 ?auto_86896 ) ) ( not ( = ?auto_86893 ?auto_86897 ) ) ( not ( = ?auto_86893 ?auto_86898 ) ) ( not ( = ?auto_86893 ?auto_86902 ) ) ( not ( = ?auto_86895 ?auto_86894 ) ) ( not ( = ?auto_86895 ?auto_86896 ) ) ( not ( = ?auto_86895 ?auto_86897 ) ) ( not ( = ?auto_86895 ?auto_86898 ) ) ( not ( = ?auto_86895 ?auto_86902 ) ) ( not ( = ?auto_86894 ?auto_86896 ) ) ( not ( = ?auto_86894 ?auto_86897 ) ) ( not ( = ?auto_86894 ?auto_86898 ) ) ( not ( = ?auto_86894 ?auto_86902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86896 ?auto_86897 ?auto_86898 )
      ( MAKE-7CRATE-VERIFY ?auto_86891 ?auto_86892 ?auto_86893 ?auto_86895 ?auto_86894 ?auto_86896 ?auto_86897 ?auto_86898 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86969 - SURFACE
      ?auto_86970 - SURFACE
      ?auto_86971 - SURFACE
      ?auto_86973 - SURFACE
      ?auto_86972 - SURFACE
      ?auto_86974 - SURFACE
      ?auto_86975 - SURFACE
      ?auto_86976 - SURFACE
    )
    :vars
    (
      ?auto_86980 - HOIST
      ?auto_86981 - PLACE
      ?auto_86978 - PLACE
      ?auto_86977 - HOIST
      ?auto_86979 - SURFACE
      ?auto_86982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_86980 ?auto_86981 ) ( SURFACE-AT ?auto_86975 ?auto_86981 ) ( CLEAR ?auto_86975 ) ( IS-CRATE ?auto_86976 ) ( not ( = ?auto_86975 ?auto_86976 ) ) ( AVAILABLE ?auto_86980 ) ( ON ?auto_86975 ?auto_86974 ) ( not ( = ?auto_86974 ?auto_86975 ) ) ( not ( = ?auto_86974 ?auto_86976 ) ) ( not ( = ?auto_86978 ?auto_86981 ) ) ( HOIST-AT ?auto_86977 ?auto_86978 ) ( not ( = ?auto_86980 ?auto_86977 ) ) ( AVAILABLE ?auto_86977 ) ( SURFACE-AT ?auto_86976 ?auto_86978 ) ( ON ?auto_86976 ?auto_86979 ) ( CLEAR ?auto_86976 ) ( not ( = ?auto_86975 ?auto_86979 ) ) ( not ( = ?auto_86976 ?auto_86979 ) ) ( not ( = ?auto_86974 ?auto_86979 ) ) ( TRUCK-AT ?auto_86982 ?auto_86981 ) ( ON ?auto_86970 ?auto_86969 ) ( ON ?auto_86971 ?auto_86970 ) ( ON ?auto_86973 ?auto_86971 ) ( ON ?auto_86972 ?auto_86973 ) ( ON ?auto_86974 ?auto_86972 ) ( not ( = ?auto_86969 ?auto_86970 ) ) ( not ( = ?auto_86969 ?auto_86971 ) ) ( not ( = ?auto_86969 ?auto_86973 ) ) ( not ( = ?auto_86969 ?auto_86972 ) ) ( not ( = ?auto_86969 ?auto_86974 ) ) ( not ( = ?auto_86969 ?auto_86975 ) ) ( not ( = ?auto_86969 ?auto_86976 ) ) ( not ( = ?auto_86969 ?auto_86979 ) ) ( not ( = ?auto_86970 ?auto_86971 ) ) ( not ( = ?auto_86970 ?auto_86973 ) ) ( not ( = ?auto_86970 ?auto_86972 ) ) ( not ( = ?auto_86970 ?auto_86974 ) ) ( not ( = ?auto_86970 ?auto_86975 ) ) ( not ( = ?auto_86970 ?auto_86976 ) ) ( not ( = ?auto_86970 ?auto_86979 ) ) ( not ( = ?auto_86971 ?auto_86973 ) ) ( not ( = ?auto_86971 ?auto_86972 ) ) ( not ( = ?auto_86971 ?auto_86974 ) ) ( not ( = ?auto_86971 ?auto_86975 ) ) ( not ( = ?auto_86971 ?auto_86976 ) ) ( not ( = ?auto_86971 ?auto_86979 ) ) ( not ( = ?auto_86973 ?auto_86972 ) ) ( not ( = ?auto_86973 ?auto_86974 ) ) ( not ( = ?auto_86973 ?auto_86975 ) ) ( not ( = ?auto_86973 ?auto_86976 ) ) ( not ( = ?auto_86973 ?auto_86979 ) ) ( not ( = ?auto_86972 ?auto_86974 ) ) ( not ( = ?auto_86972 ?auto_86975 ) ) ( not ( = ?auto_86972 ?auto_86976 ) ) ( not ( = ?auto_86972 ?auto_86979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86974 ?auto_86975 ?auto_86976 )
      ( MAKE-7CRATE-VERIFY ?auto_86969 ?auto_86970 ?auto_86971 ?auto_86973 ?auto_86972 ?auto_86974 ?auto_86975 ?auto_86976 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87047 - SURFACE
      ?auto_87048 - SURFACE
      ?auto_87049 - SURFACE
      ?auto_87051 - SURFACE
      ?auto_87050 - SURFACE
      ?auto_87052 - SURFACE
      ?auto_87053 - SURFACE
      ?auto_87054 - SURFACE
    )
    :vars
    (
      ?auto_87056 - HOIST
      ?auto_87058 - PLACE
      ?auto_87059 - PLACE
      ?auto_87055 - HOIST
      ?auto_87057 - SURFACE
      ?auto_87060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_87056 ?auto_87058 ) ( IS-CRATE ?auto_87054 ) ( not ( = ?auto_87053 ?auto_87054 ) ) ( not ( = ?auto_87052 ?auto_87053 ) ) ( not ( = ?auto_87052 ?auto_87054 ) ) ( not ( = ?auto_87059 ?auto_87058 ) ) ( HOIST-AT ?auto_87055 ?auto_87059 ) ( not ( = ?auto_87056 ?auto_87055 ) ) ( AVAILABLE ?auto_87055 ) ( SURFACE-AT ?auto_87054 ?auto_87059 ) ( ON ?auto_87054 ?auto_87057 ) ( CLEAR ?auto_87054 ) ( not ( = ?auto_87053 ?auto_87057 ) ) ( not ( = ?auto_87054 ?auto_87057 ) ) ( not ( = ?auto_87052 ?auto_87057 ) ) ( TRUCK-AT ?auto_87060 ?auto_87058 ) ( SURFACE-AT ?auto_87052 ?auto_87058 ) ( CLEAR ?auto_87052 ) ( LIFTING ?auto_87056 ?auto_87053 ) ( IS-CRATE ?auto_87053 ) ( ON ?auto_87048 ?auto_87047 ) ( ON ?auto_87049 ?auto_87048 ) ( ON ?auto_87051 ?auto_87049 ) ( ON ?auto_87050 ?auto_87051 ) ( ON ?auto_87052 ?auto_87050 ) ( not ( = ?auto_87047 ?auto_87048 ) ) ( not ( = ?auto_87047 ?auto_87049 ) ) ( not ( = ?auto_87047 ?auto_87051 ) ) ( not ( = ?auto_87047 ?auto_87050 ) ) ( not ( = ?auto_87047 ?auto_87052 ) ) ( not ( = ?auto_87047 ?auto_87053 ) ) ( not ( = ?auto_87047 ?auto_87054 ) ) ( not ( = ?auto_87047 ?auto_87057 ) ) ( not ( = ?auto_87048 ?auto_87049 ) ) ( not ( = ?auto_87048 ?auto_87051 ) ) ( not ( = ?auto_87048 ?auto_87050 ) ) ( not ( = ?auto_87048 ?auto_87052 ) ) ( not ( = ?auto_87048 ?auto_87053 ) ) ( not ( = ?auto_87048 ?auto_87054 ) ) ( not ( = ?auto_87048 ?auto_87057 ) ) ( not ( = ?auto_87049 ?auto_87051 ) ) ( not ( = ?auto_87049 ?auto_87050 ) ) ( not ( = ?auto_87049 ?auto_87052 ) ) ( not ( = ?auto_87049 ?auto_87053 ) ) ( not ( = ?auto_87049 ?auto_87054 ) ) ( not ( = ?auto_87049 ?auto_87057 ) ) ( not ( = ?auto_87051 ?auto_87050 ) ) ( not ( = ?auto_87051 ?auto_87052 ) ) ( not ( = ?auto_87051 ?auto_87053 ) ) ( not ( = ?auto_87051 ?auto_87054 ) ) ( not ( = ?auto_87051 ?auto_87057 ) ) ( not ( = ?auto_87050 ?auto_87052 ) ) ( not ( = ?auto_87050 ?auto_87053 ) ) ( not ( = ?auto_87050 ?auto_87054 ) ) ( not ( = ?auto_87050 ?auto_87057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87052 ?auto_87053 ?auto_87054 )
      ( MAKE-7CRATE-VERIFY ?auto_87047 ?auto_87048 ?auto_87049 ?auto_87051 ?auto_87050 ?auto_87052 ?auto_87053 ?auto_87054 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87125 - SURFACE
      ?auto_87126 - SURFACE
      ?auto_87127 - SURFACE
      ?auto_87129 - SURFACE
      ?auto_87128 - SURFACE
      ?auto_87130 - SURFACE
      ?auto_87131 - SURFACE
      ?auto_87132 - SURFACE
    )
    :vars
    (
      ?auto_87133 - HOIST
      ?auto_87138 - PLACE
      ?auto_87136 - PLACE
      ?auto_87135 - HOIST
      ?auto_87137 - SURFACE
      ?auto_87134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_87133 ?auto_87138 ) ( IS-CRATE ?auto_87132 ) ( not ( = ?auto_87131 ?auto_87132 ) ) ( not ( = ?auto_87130 ?auto_87131 ) ) ( not ( = ?auto_87130 ?auto_87132 ) ) ( not ( = ?auto_87136 ?auto_87138 ) ) ( HOIST-AT ?auto_87135 ?auto_87136 ) ( not ( = ?auto_87133 ?auto_87135 ) ) ( AVAILABLE ?auto_87135 ) ( SURFACE-AT ?auto_87132 ?auto_87136 ) ( ON ?auto_87132 ?auto_87137 ) ( CLEAR ?auto_87132 ) ( not ( = ?auto_87131 ?auto_87137 ) ) ( not ( = ?auto_87132 ?auto_87137 ) ) ( not ( = ?auto_87130 ?auto_87137 ) ) ( TRUCK-AT ?auto_87134 ?auto_87138 ) ( SURFACE-AT ?auto_87130 ?auto_87138 ) ( CLEAR ?auto_87130 ) ( IS-CRATE ?auto_87131 ) ( AVAILABLE ?auto_87133 ) ( IN ?auto_87131 ?auto_87134 ) ( ON ?auto_87126 ?auto_87125 ) ( ON ?auto_87127 ?auto_87126 ) ( ON ?auto_87129 ?auto_87127 ) ( ON ?auto_87128 ?auto_87129 ) ( ON ?auto_87130 ?auto_87128 ) ( not ( = ?auto_87125 ?auto_87126 ) ) ( not ( = ?auto_87125 ?auto_87127 ) ) ( not ( = ?auto_87125 ?auto_87129 ) ) ( not ( = ?auto_87125 ?auto_87128 ) ) ( not ( = ?auto_87125 ?auto_87130 ) ) ( not ( = ?auto_87125 ?auto_87131 ) ) ( not ( = ?auto_87125 ?auto_87132 ) ) ( not ( = ?auto_87125 ?auto_87137 ) ) ( not ( = ?auto_87126 ?auto_87127 ) ) ( not ( = ?auto_87126 ?auto_87129 ) ) ( not ( = ?auto_87126 ?auto_87128 ) ) ( not ( = ?auto_87126 ?auto_87130 ) ) ( not ( = ?auto_87126 ?auto_87131 ) ) ( not ( = ?auto_87126 ?auto_87132 ) ) ( not ( = ?auto_87126 ?auto_87137 ) ) ( not ( = ?auto_87127 ?auto_87129 ) ) ( not ( = ?auto_87127 ?auto_87128 ) ) ( not ( = ?auto_87127 ?auto_87130 ) ) ( not ( = ?auto_87127 ?auto_87131 ) ) ( not ( = ?auto_87127 ?auto_87132 ) ) ( not ( = ?auto_87127 ?auto_87137 ) ) ( not ( = ?auto_87129 ?auto_87128 ) ) ( not ( = ?auto_87129 ?auto_87130 ) ) ( not ( = ?auto_87129 ?auto_87131 ) ) ( not ( = ?auto_87129 ?auto_87132 ) ) ( not ( = ?auto_87129 ?auto_87137 ) ) ( not ( = ?auto_87128 ?auto_87130 ) ) ( not ( = ?auto_87128 ?auto_87131 ) ) ( not ( = ?auto_87128 ?auto_87132 ) ) ( not ( = ?auto_87128 ?auto_87137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87130 ?auto_87131 ?auto_87132 )
      ( MAKE-7CRATE-VERIFY ?auto_87125 ?auto_87126 ?auto_87127 ?auto_87129 ?auto_87128 ?auto_87130 ?auto_87131 ?auto_87132 ) )
  )

)

