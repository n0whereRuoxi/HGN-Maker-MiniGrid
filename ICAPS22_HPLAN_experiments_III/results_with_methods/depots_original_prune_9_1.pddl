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
      ?auto_186161 - SURFACE
      ?auto_186162 - SURFACE
    )
    :vars
    (
      ?auto_186163 - HOIST
      ?auto_186164 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186163 ?auto_186164 ) ( SURFACE-AT ?auto_186161 ?auto_186164 ) ( CLEAR ?auto_186161 ) ( LIFTING ?auto_186163 ?auto_186162 ) ( IS-CRATE ?auto_186162 ) ( not ( = ?auto_186161 ?auto_186162 ) ) )
    :subtasks
    ( ( !DROP ?auto_186163 ?auto_186162 ?auto_186161 ?auto_186164 )
      ( MAKE-1CRATE-VERIFY ?auto_186161 ?auto_186162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186165 - SURFACE
      ?auto_186166 - SURFACE
    )
    :vars
    (
      ?auto_186167 - HOIST
      ?auto_186168 - PLACE
      ?auto_186169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186167 ?auto_186168 ) ( SURFACE-AT ?auto_186165 ?auto_186168 ) ( CLEAR ?auto_186165 ) ( IS-CRATE ?auto_186166 ) ( not ( = ?auto_186165 ?auto_186166 ) ) ( TRUCK-AT ?auto_186169 ?auto_186168 ) ( AVAILABLE ?auto_186167 ) ( IN ?auto_186166 ?auto_186169 ) )
    :subtasks
    ( ( !UNLOAD ?auto_186167 ?auto_186166 ?auto_186169 ?auto_186168 )
      ( MAKE-1CRATE ?auto_186165 ?auto_186166 )
      ( MAKE-1CRATE-VERIFY ?auto_186165 ?auto_186166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186170 - SURFACE
      ?auto_186171 - SURFACE
    )
    :vars
    (
      ?auto_186172 - HOIST
      ?auto_186173 - PLACE
      ?auto_186174 - TRUCK
      ?auto_186175 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186172 ?auto_186173 ) ( SURFACE-AT ?auto_186170 ?auto_186173 ) ( CLEAR ?auto_186170 ) ( IS-CRATE ?auto_186171 ) ( not ( = ?auto_186170 ?auto_186171 ) ) ( AVAILABLE ?auto_186172 ) ( IN ?auto_186171 ?auto_186174 ) ( TRUCK-AT ?auto_186174 ?auto_186175 ) ( not ( = ?auto_186175 ?auto_186173 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_186174 ?auto_186175 ?auto_186173 )
      ( MAKE-1CRATE ?auto_186170 ?auto_186171 )
      ( MAKE-1CRATE-VERIFY ?auto_186170 ?auto_186171 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186176 - SURFACE
      ?auto_186177 - SURFACE
    )
    :vars
    (
      ?auto_186180 - HOIST
      ?auto_186178 - PLACE
      ?auto_186179 - TRUCK
      ?auto_186181 - PLACE
      ?auto_186182 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186180 ?auto_186178 ) ( SURFACE-AT ?auto_186176 ?auto_186178 ) ( CLEAR ?auto_186176 ) ( IS-CRATE ?auto_186177 ) ( not ( = ?auto_186176 ?auto_186177 ) ) ( AVAILABLE ?auto_186180 ) ( TRUCK-AT ?auto_186179 ?auto_186181 ) ( not ( = ?auto_186181 ?auto_186178 ) ) ( HOIST-AT ?auto_186182 ?auto_186181 ) ( LIFTING ?auto_186182 ?auto_186177 ) ( not ( = ?auto_186180 ?auto_186182 ) ) )
    :subtasks
    ( ( !LOAD ?auto_186182 ?auto_186177 ?auto_186179 ?auto_186181 )
      ( MAKE-1CRATE ?auto_186176 ?auto_186177 )
      ( MAKE-1CRATE-VERIFY ?auto_186176 ?auto_186177 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186183 - SURFACE
      ?auto_186184 - SURFACE
    )
    :vars
    (
      ?auto_186189 - HOIST
      ?auto_186188 - PLACE
      ?auto_186186 - TRUCK
      ?auto_186185 - PLACE
      ?auto_186187 - HOIST
      ?auto_186190 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186189 ?auto_186188 ) ( SURFACE-AT ?auto_186183 ?auto_186188 ) ( CLEAR ?auto_186183 ) ( IS-CRATE ?auto_186184 ) ( not ( = ?auto_186183 ?auto_186184 ) ) ( AVAILABLE ?auto_186189 ) ( TRUCK-AT ?auto_186186 ?auto_186185 ) ( not ( = ?auto_186185 ?auto_186188 ) ) ( HOIST-AT ?auto_186187 ?auto_186185 ) ( not ( = ?auto_186189 ?auto_186187 ) ) ( AVAILABLE ?auto_186187 ) ( SURFACE-AT ?auto_186184 ?auto_186185 ) ( ON ?auto_186184 ?auto_186190 ) ( CLEAR ?auto_186184 ) ( not ( = ?auto_186183 ?auto_186190 ) ) ( not ( = ?auto_186184 ?auto_186190 ) ) )
    :subtasks
    ( ( !LIFT ?auto_186187 ?auto_186184 ?auto_186190 ?auto_186185 )
      ( MAKE-1CRATE ?auto_186183 ?auto_186184 )
      ( MAKE-1CRATE-VERIFY ?auto_186183 ?auto_186184 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186191 - SURFACE
      ?auto_186192 - SURFACE
    )
    :vars
    (
      ?auto_186194 - HOIST
      ?auto_186193 - PLACE
      ?auto_186195 - PLACE
      ?auto_186196 - HOIST
      ?auto_186198 - SURFACE
      ?auto_186197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186194 ?auto_186193 ) ( SURFACE-AT ?auto_186191 ?auto_186193 ) ( CLEAR ?auto_186191 ) ( IS-CRATE ?auto_186192 ) ( not ( = ?auto_186191 ?auto_186192 ) ) ( AVAILABLE ?auto_186194 ) ( not ( = ?auto_186195 ?auto_186193 ) ) ( HOIST-AT ?auto_186196 ?auto_186195 ) ( not ( = ?auto_186194 ?auto_186196 ) ) ( AVAILABLE ?auto_186196 ) ( SURFACE-AT ?auto_186192 ?auto_186195 ) ( ON ?auto_186192 ?auto_186198 ) ( CLEAR ?auto_186192 ) ( not ( = ?auto_186191 ?auto_186198 ) ) ( not ( = ?auto_186192 ?auto_186198 ) ) ( TRUCK-AT ?auto_186197 ?auto_186193 ) )
    :subtasks
    ( ( !DRIVE ?auto_186197 ?auto_186193 ?auto_186195 )
      ( MAKE-1CRATE ?auto_186191 ?auto_186192 )
      ( MAKE-1CRATE-VERIFY ?auto_186191 ?auto_186192 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186208 - SURFACE
      ?auto_186209 - SURFACE
      ?auto_186210 - SURFACE
    )
    :vars
    (
      ?auto_186211 - HOIST
      ?auto_186212 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186211 ?auto_186212 ) ( SURFACE-AT ?auto_186209 ?auto_186212 ) ( CLEAR ?auto_186209 ) ( LIFTING ?auto_186211 ?auto_186210 ) ( IS-CRATE ?auto_186210 ) ( not ( = ?auto_186209 ?auto_186210 ) ) ( ON ?auto_186209 ?auto_186208 ) ( not ( = ?auto_186208 ?auto_186209 ) ) ( not ( = ?auto_186208 ?auto_186210 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186209 ?auto_186210 )
      ( MAKE-2CRATE-VERIFY ?auto_186208 ?auto_186209 ?auto_186210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186218 - SURFACE
      ?auto_186219 - SURFACE
      ?auto_186220 - SURFACE
    )
    :vars
    (
      ?auto_186222 - HOIST
      ?auto_186223 - PLACE
      ?auto_186221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186222 ?auto_186223 ) ( SURFACE-AT ?auto_186219 ?auto_186223 ) ( CLEAR ?auto_186219 ) ( IS-CRATE ?auto_186220 ) ( not ( = ?auto_186219 ?auto_186220 ) ) ( TRUCK-AT ?auto_186221 ?auto_186223 ) ( AVAILABLE ?auto_186222 ) ( IN ?auto_186220 ?auto_186221 ) ( ON ?auto_186219 ?auto_186218 ) ( not ( = ?auto_186218 ?auto_186219 ) ) ( not ( = ?auto_186218 ?auto_186220 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186219 ?auto_186220 )
      ( MAKE-2CRATE-VERIFY ?auto_186218 ?auto_186219 ?auto_186220 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186224 - SURFACE
      ?auto_186225 - SURFACE
    )
    :vars
    (
      ?auto_186229 - HOIST
      ?auto_186227 - PLACE
      ?auto_186228 - TRUCK
      ?auto_186226 - SURFACE
      ?auto_186230 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186229 ?auto_186227 ) ( SURFACE-AT ?auto_186224 ?auto_186227 ) ( CLEAR ?auto_186224 ) ( IS-CRATE ?auto_186225 ) ( not ( = ?auto_186224 ?auto_186225 ) ) ( AVAILABLE ?auto_186229 ) ( IN ?auto_186225 ?auto_186228 ) ( ON ?auto_186224 ?auto_186226 ) ( not ( = ?auto_186226 ?auto_186224 ) ) ( not ( = ?auto_186226 ?auto_186225 ) ) ( TRUCK-AT ?auto_186228 ?auto_186230 ) ( not ( = ?auto_186230 ?auto_186227 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_186228 ?auto_186230 ?auto_186227 )
      ( MAKE-2CRATE ?auto_186226 ?auto_186224 ?auto_186225 )
      ( MAKE-1CRATE-VERIFY ?auto_186224 ?auto_186225 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186231 - SURFACE
      ?auto_186232 - SURFACE
      ?auto_186233 - SURFACE
    )
    :vars
    (
      ?auto_186236 - HOIST
      ?auto_186237 - PLACE
      ?auto_186234 - TRUCK
      ?auto_186235 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186236 ?auto_186237 ) ( SURFACE-AT ?auto_186232 ?auto_186237 ) ( CLEAR ?auto_186232 ) ( IS-CRATE ?auto_186233 ) ( not ( = ?auto_186232 ?auto_186233 ) ) ( AVAILABLE ?auto_186236 ) ( IN ?auto_186233 ?auto_186234 ) ( ON ?auto_186232 ?auto_186231 ) ( not ( = ?auto_186231 ?auto_186232 ) ) ( not ( = ?auto_186231 ?auto_186233 ) ) ( TRUCK-AT ?auto_186234 ?auto_186235 ) ( not ( = ?auto_186235 ?auto_186237 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186232 ?auto_186233 )
      ( MAKE-2CRATE-VERIFY ?auto_186231 ?auto_186232 ?auto_186233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186238 - SURFACE
      ?auto_186239 - SURFACE
    )
    :vars
    (
      ?auto_186244 - HOIST
      ?auto_186242 - PLACE
      ?auto_186240 - SURFACE
      ?auto_186241 - TRUCK
      ?auto_186243 - PLACE
      ?auto_186245 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186244 ?auto_186242 ) ( SURFACE-AT ?auto_186238 ?auto_186242 ) ( CLEAR ?auto_186238 ) ( IS-CRATE ?auto_186239 ) ( not ( = ?auto_186238 ?auto_186239 ) ) ( AVAILABLE ?auto_186244 ) ( ON ?auto_186238 ?auto_186240 ) ( not ( = ?auto_186240 ?auto_186238 ) ) ( not ( = ?auto_186240 ?auto_186239 ) ) ( TRUCK-AT ?auto_186241 ?auto_186243 ) ( not ( = ?auto_186243 ?auto_186242 ) ) ( HOIST-AT ?auto_186245 ?auto_186243 ) ( LIFTING ?auto_186245 ?auto_186239 ) ( not ( = ?auto_186244 ?auto_186245 ) ) )
    :subtasks
    ( ( !LOAD ?auto_186245 ?auto_186239 ?auto_186241 ?auto_186243 )
      ( MAKE-2CRATE ?auto_186240 ?auto_186238 ?auto_186239 )
      ( MAKE-1CRATE-VERIFY ?auto_186238 ?auto_186239 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186246 - SURFACE
      ?auto_186247 - SURFACE
      ?auto_186248 - SURFACE
    )
    :vars
    (
      ?auto_186251 - HOIST
      ?auto_186253 - PLACE
      ?auto_186250 - TRUCK
      ?auto_186252 - PLACE
      ?auto_186249 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186251 ?auto_186253 ) ( SURFACE-AT ?auto_186247 ?auto_186253 ) ( CLEAR ?auto_186247 ) ( IS-CRATE ?auto_186248 ) ( not ( = ?auto_186247 ?auto_186248 ) ) ( AVAILABLE ?auto_186251 ) ( ON ?auto_186247 ?auto_186246 ) ( not ( = ?auto_186246 ?auto_186247 ) ) ( not ( = ?auto_186246 ?auto_186248 ) ) ( TRUCK-AT ?auto_186250 ?auto_186252 ) ( not ( = ?auto_186252 ?auto_186253 ) ) ( HOIST-AT ?auto_186249 ?auto_186252 ) ( LIFTING ?auto_186249 ?auto_186248 ) ( not ( = ?auto_186251 ?auto_186249 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186247 ?auto_186248 )
      ( MAKE-2CRATE-VERIFY ?auto_186246 ?auto_186247 ?auto_186248 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186254 - SURFACE
      ?auto_186255 - SURFACE
    )
    :vars
    (
      ?auto_186261 - HOIST
      ?auto_186256 - PLACE
      ?auto_186259 - SURFACE
      ?auto_186258 - TRUCK
      ?auto_186257 - PLACE
      ?auto_186260 - HOIST
      ?auto_186262 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186261 ?auto_186256 ) ( SURFACE-AT ?auto_186254 ?auto_186256 ) ( CLEAR ?auto_186254 ) ( IS-CRATE ?auto_186255 ) ( not ( = ?auto_186254 ?auto_186255 ) ) ( AVAILABLE ?auto_186261 ) ( ON ?auto_186254 ?auto_186259 ) ( not ( = ?auto_186259 ?auto_186254 ) ) ( not ( = ?auto_186259 ?auto_186255 ) ) ( TRUCK-AT ?auto_186258 ?auto_186257 ) ( not ( = ?auto_186257 ?auto_186256 ) ) ( HOIST-AT ?auto_186260 ?auto_186257 ) ( not ( = ?auto_186261 ?auto_186260 ) ) ( AVAILABLE ?auto_186260 ) ( SURFACE-AT ?auto_186255 ?auto_186257 ) ( ON ?auto_186255 ?auto_186262 ) ( CLEAR ?auto_186255 ) ( not ( = ?auto_186254 ?auto_186262 ) ) ( not ( = ?auto_186255 ?auto_186262 ) ) ( not ( = ?auto_186259 ?auto_186262 ) ) )
    :subtasks
    ( ( !LIFT ?auto_186260 ?auto_186255 ?auto_186262 ?auto_186257 )
      ( MAKE-2CRATE ?auto_186259 ?auto_186254 ?auto_186255 )
      ( MAKE-1CRATE-VERIFY ?auto_186254 ?auto_186255 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186263 - SURFACE
      ?auto_186264 - SURFACE
      ?auto_186265 - SURFACE
    )
    :vars
    (
      ?auto_186271 - HOIST
      ?auto_186266 - PLACE
      ?auto_186270 - TRUCK
      ?auto_186269 - PLACE
      ?auto_186268 - HOIST
      ?auto_186267 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186271 ?auto_186266 ) ( SURFACE-AT ?auto_186264 ?auto_186266 ) ( CLEAR ?auto_186264 ) ( IS-CRATE ?auto_186265 ) ( not ( = ?auto_186264 ?auto_186265 ) ) ( AVAILABLE ?auto_186271 ) ( ON ?auto_186264 ?auto_186263 ) ( not ( = ?auto_186263 ?auto_186264 ) ) ( not ( = ?auto_186263 ?auto_186265 ) ) ( TRUCK-AT ?auto_186270 ?auto_186269 ) ( not ( = ?auto_186269 ?auto_186266 ) ) ( HOIST-AT ?auto_186268 ?auto_186269 ) ( not ( = ?auto_186271 ?auto_186268 ) ) ( AVAILABLE ?auto_186268 ) ( SURFACE-AT ?auto_186265 ?auto_186269 ) ( ON ?auto_186265 ?auto_186267 ) ( CLEAR ?auto_186265 ) ( not ( = ?auto_186264 ?auto_186267 ) ) ( not ( = ?auto_186265 ?auto_186267 ) ) ( not ( = ?auto_186263 ?auto_186267 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186264 ?auto_186265 )
      ( MAKE-2CRATE-VERIFY ?auto_186263 ?auto_186264 ?auto_186265 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186272 - SURFACE
      ?auto_186273 - SURFACE
    )
    :vars
    (
      ?auto_186274 - HOIST
      ?auto_186280 - PLACE
      ?auto_186275 - SURFACE
      ?auto_186279 - PLACE
      ?auto_186278 - HOIST
      ?auto_186277 - SURFACE
      ?auto_186276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186274 ?auto_186280 ) ( SURFACE-AT ?auto_186272 ?auto_186280 ) ( CLEAR ?auto_186272 ) ( IS-CRATE ?auto_186273 ) ( not ( = ?auto_186272 ?auto_186273 ) ) ( AVAILABLE ?auto_186274 ) ( ON ?auto_186272 ?auto_186275 ) ( not ( = ?auto_186275 ?auto_186272 ) ) ( not ( = ?auto_186275 ?auto_186273 ) ) ( not ( = ?auto_186279 ?auto_186280 ) ) ( HOIST-AT ?auto_186278 ?auto_186279 ) ( not ( = ?auto_186274 ?auto_186278 ) ) ( AVAILABLE ?auto_186278 ) ( SURFACE-AT ?auto_186273 ?auto_186279 ) ( ON ?auto_186273 ?auto_186277 ) ( CLEAR ?auto_186273 ) ( not ( = ?auto_186272 ?auto_186277 ) ) ( not ( = ?auto_186273 ?auto_186277 ) ) ( not ( = ?auto_186275 ?auto_186277 ) ) ( TRUCK-AT ?auto_186276 ?auto_186280 ) )
    :subtasks
    ( ( !DRIVE ?auto_186276 ?auto_186280 ?auto_186279 )
      ( MAKE-2CRATE ?auto_186275 ?auto_186272 ?auto_186273 )
      ( MAKE-1CRATE-VERIFY ?auto_186272 ?auto_186273 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186281 - SURFACE
      ?auto_186282 - SURFACE
      ?auto_186283 - SURFACE
    )
    :vars
    (
      ?auto_186287 - HOIST
      ?auto_186284 - PLACE
      ?auto_186286 - PLACE
      ?auto_186289 - HOIST
      ?auto_186285 - SURFACE
      ?auto_186288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186287 ?auto_186284 ) ( SURFACE-AT ?auto_186282 ?auto_186284 ) ( CLEAR ?auto_186282 ) ( IS-CRATE ?auto_186283 ) ( not ( = ?auto_186282 ?auto_186283 ) ) ( AVAILABLE ?auto_186287 ) ( ON ?auto_186282 ?auto_186281 ) ( not ( = ?auto_186281 ?auto_186282 ) ) ( not ( = ?auto_186281 ?auto_186283 ) ) ( not ( = ?auto_186286 ?auto_186284 ) ) ( HOIST-AT ?auto_186289 ?auto_186286 ) ( not ( = ?auto_186287 ?auto_186289 ) ) ( AVAILABLE ?auto_186289 ) ( SURFACE-AT ?auto_186283 ?auto_186286 ) ( ON ?auto_186283 ?auto_186285 ) ( CLEAR ?auto_186283 ) ( not ( = ?auto_186282 ?auto_186285 ) ) ( not ( = ?auto_186283 ?auto_186285 ) ) ( not ( = ?auto_186281 ?auto_186285 ) ) ( TRUCK-AT ?auto_186288 ?auto_186284 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186282 ?auto_186283 )
      ( MAKE-2CRATE-VERIFY ?auto_186281 ?auto_186282 ?auto_186283 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186290 - SURFACE
      ?auto_186291 - SURFACE
    )
    :vars
    (
      ?auto_186297 - HOIST
      ?auto_186296 - PLACE
      ?auto_186295 - SURFACE
      ?auto_186292 - PLACE
      ?auto_186298 - HOIST
      ?auto_186293 - SURFACE
      ?auto_186294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186297 ?auto_186296 ) ( IS-CRATE ?auto_186291 ) ( not ( = ?auto_186290 ?auto_186291 ) ) ( not ( = ?auto_186295 ?auto_186290 ) ) ( not ( = ?auto_186295 ?auto_186291 ) ) ( not ( = ?auto_186292 ?auto_186296 ) ) ( HOIST-AT ?auto_186298 ?auto_186292 ) ( not ( = ?auto_186297 ?auto_186298 ) ) ( AVAILABLE ?auto_186298 ) ( SURFACE-AT ?auto_186291 ?auto_186292 ) ( ON ?auto_186291 ?auto_186293 ) ( CLEAR ?auto_186291 ) ( not ( = ?auto_186290 ?auto_186293 ) ) ( not ( = ?auto_186291 ?auto_186293 ) ) ( not ( = ?auto_186295 ?auto_186293 ) ) ( TRUCK-AT ?auto_186294 ?auto_186296 ) ( SURFACE-AT ?auto_186295 ?auto_186296 ) ( CLEAR ?auto_186295 ) ( LIFTING ?auto_186297 ?auto_186290 ) ( IS-CRATE ?auto_186290 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186295 ?auto_186290 )
      ( MAKE-2CRATE ?auto_186295 ?auto_186290 ?auto_186291 )
      ( MAKE-1CRATE-VERIFY ?auto_186290 ?auto_186291 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186299 - SURFACE
      ?auto_186300 - SURFACE
      ?auto_186301 - SURFACE
    )
    :vars
    (
      ?auto_186304 - HOIST
      ?auto_186306 - PLACE
      ?auto_186307 - PLACE
      ?auto_186305 - HOIST
      ?auto_186302 - SURFACE
      ?auto_186303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186304 ?auto_186306 ) ( IS-CRATE ?auto_186301 ) ( not ( = ?auto_186300 ?auto_186301 ) ) ( not ( = ?auto_186299 ?auto_186300 ) ) ( not ( = ?auto_186299 ?auto_186301 ) ) ( not ( = ?auto_186307 ?auto_186306 ) ) ( HOIST-AT ?auto_186305 ?auto_186307 ) ( not ( = ?auto_186304 ?auto_186305 ) ) ( AVAILABLE ?auto_186305 ) ( SURFACE-AT ?auto_186301 ?auto_186307 ) ( ON ?auto_186301 ?auto_186302 ) ( CLEAR ?auto_186301 ) ( not ( = ?auto_186300 ?auto_186302 ) ) ( not ( = ?auto_186301 ?auto_186302 ) ) ( not ( = ?auto_186299 ?auto_186302 ) ) ( TRUCK-AT ?auto_186303 ?auto_186306 ) ( SURFACE-AT ?auto_186299 ?auto_186306 ) ( CLEAR ?auto_186299 ) ( LIFTING ?auto_186304 ?auto_186300 ) ( IS-CRATE ?auto_186300 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186300 ?auto_186301 )
      ( MAKE-2CRATE-VERIFY ?auto_186299 ?auto_186300 ?auto_186301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186308 - SURFACE
      ?auto_186309 - SURFACE
    )
    :vars
    (
      ?auto_186315 - HOIST
      ?auto_186314 - PLACE
      ?auto_186311 - SURFACE
      ?auto_186310 - PLACE
      ?auto_186316 - HOIST
      ?auto_186313 - SURFACE
      ?auto_186312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186315 ?auto_186314 ) ( IS-CRATE ?auto_186309 ) ( not ( = ?auto_186308 ?auto_186309 ) ) ( not ( = ?auto_186311 ?auto_186308 ) ) ( not ( = ?auto_186311 ?auto_186309 ) ) ( not ( = ?auto_186310 ?auto_186314 ) ) ( HOIST-AT ?auto_186316 ?auto_186310 ) ( not ( = ?auto_186315 ?auto_186316 ) ) ( AVAILABLE ?auto_186316 ) ( SURFACE-AT ?auto_186309 ?auto_186310 ) ( ON ?auto_186309 ?auto_186313 ) ( CLEAR ?auto_186309 ) ( not ( = ?auto_186308 ?auto_186313 ) ) ( not ( = ?auto_186309 ?auto_186313 ) ) ( not ( = ?auto_186311 ?auto_186313 ) ) ( TRUCK-AT ?auto_186312 ?auto_186314 ) ( SURFACE-AT ?auto_186311 ?auto_186314 ) ( CLEAR ?auto_186311 ) ( IS-CRATE ?auto_186308 ) ( AVAILABLE ?auto_186315 ) ( IN ?auto_186308 ?auto_186312 ) )
    :subtasks
    ( ( !UNLOAD ?auto_186315 ?auto_186308 ?auto_186312 ?auto_186314 )
      ( MAKE-2CRATE ?auto_186311 ?auto_186308 ?auto_186309 )
      ( MAKE-1CRATE-VERIFY ?auto_186308 ?auto_186309 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186317 - SURFACE
      ?auto_186318 - SURFACE
      ?auto_186319 - SURFACE
    )
    :vars
    (
      ?auto_186325 - HOIST
      ?auto_186324 - PLACE
      ?auto_186321 - PLACE
      ?auto_186322 - HOIST
      ?auto_186320 - SURFACE
      ?auto_186323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186325 ?auto_186324 ) ( IS-CRATE ?auto_186319 ) ( not ( = ?auto_186318 ?auto_186319 ) ) ( not ( = ?auto_186317 ?auto_186318 ) ) ( not ( = ?auto_186317 ?auto_186319 ) ) ( not ( = ?auto_186321 ?auto_186324 ) ) ( HOIST-AT ?auto_186322 ?auto_186321 ) ( not ( = ?auto_186325 ?auto_186322 ) ) ( AVAILABLE ?auto_186322 ) ( SURFACE-AT ?auto_186319 ?auto_186321 ) ( ON ?auto_186319 ?auto_186320 ) ( CLEAR ?auto_186319 ) ( not ( = ?auto_186318 ?auto_186320 ) ) ( not ( = ?auto_186319 ?auto_186320 ) ) ( not ( = ?auto_186317 ?auto_186320 ) ) ( TRUCK-AT ?auto_186323 ?auto_186324 ) ( SURFACE-AT ?auto_186317 ?auto_186324 ) ( CLEAR ?auto_186317 ) ( IS-CRATE ?auto_186318 ) ( AVAILABLE ?auto_186325 ) ( IN ?auto_186318 ?auto_186323 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186318 ?auto_186319 )
      ( MAKE-2CRATE-VERIFY ?auto_186317 ?auto_186318 ?auto_186319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186326 - SURFACE
      ?auto_186327 - SURFACE
    )
    :vars
    (
      ?auto_186332 - HOIST
      ?auto_186334 - PLACE
      ?auto_186330 - SURFACE
      ?auto_186333 - PLACE
      ?auto_186329 - HOIST
      ?auto_186328 - SURFACE
      ?auto_186331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186332 ?auto_186334 ) ( IS-CRATE ?auto_186327 ) ( not ( = ?auto_186326 ?auto_186327 ) ) ( not ( = ?auto_186330 ?auto_186326 ) ) ( not ( = ?auto_186330 ?auto_186327 ) ) ( not ( = ?auto_186333 ?auto_186334 ) ) ( HOIST-AT ?auto_186329 ?auto_186333 ) ( not ( = ?auto_186332 ?auto_186329 ) ) ( AVAILABLE ?auto_186329 ) ( SURFACE-AT ?auto_186327 ?auto_186333 ) ( ON ?auto_186327 ?auto_186328 ) ( CLEAR ?auto_186327 ) ( not ( = ?auto_186326 ?auto_186328 ) ) ( not ( = ?auto_186327 ?auto_186328 ) ) ( not ( = ?auto_186330 ?auto_186328 ) ) ( SURFACE-AT ?auto_186330 ?auto_186334 ) ( CLEAR ?auto_186330 ) ( IS-CRATE ?auto_186326 ) ( AVAILABLE ?auto_186332 ) ( IN ?auto_186326 ?auto_186331 ) ( TRUCK-AT ?auto_186331 ?auto_186333 ) )
    :subtasks
    ( ( !DRIVE ?auto_186331 ?auto_186333 ?auto_186334 )
      ( MAKE-2CRATE ?auto_186330 ?auto_186326 ?auto_186327 )
      ( MAKE-1CRATE-VERIFY ?auto_186326 ?auto_186327 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186335 - SURFACE
      ?auto_186336 - SURFACE
      ?auto_186337 - SURFACE
    )
    :vars
    (
      ?auto_186341 - HOIST
      ?auto_186340 - PLACE
      ?auto_186339 - PLACE
      ?auto_186343 - HOIST
      ?auto_186342 - SURFACE
      ?auto_186338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186341 ?auto_186340 ) ( IS-CRATE ?auto_186337 ) ( not ( = ?auto_186336 ?auto_186337 ) ) ( not ( = ?auto_186335 ?auto_186336 ) ) ( not ( = ?auto_186335 ?auto_186337 ) ) ( not ( = ?auto_186339 ?auto_186340 ) ) ( HOIST-AT ?auto_186343 ?auto_186339 ) ( not ( = ?auto_186341 ?auto_186343 ) ) ( AVAILABLE ?auto_186343 ) ( SURFACE-AT ?auto_186337 ?auto_186339 ) ( ON ?auto_186337 ?auto_186342 ) ( CLEAR ?auto_186337 ) ( not ( = ?auto_186336 ?auto_186342 ) ) ( not ( = ?auto_186337 ?auto_186342 ) ) ( not ( = ?auto_186335 ?auto_186342 ) ) ( SURFACE-AT ?auto_186335 ?auto_186340 ) ( CLEAR ?auto_186335 ) ( IS-CRATE ?auto_186336 ) ( AVAILABLE ?auto_186341 ) ( IN ?auto_186336 ?auto_186338 ) ( TRUCK-AT ?auto_186338 ?auto_186339 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186336 ?auto_186337 )
      ( MAKE-2CRATE-VERIFY ?auto_186335 ?auto_186336 ?auto_186337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186344 - SURFACE
      ?auto_186345 - SURFACE
    )
    :vars
    (
      ?auto_186347 - HOIST
      ?auto_186346 - PLACE
      ?auto_186350 - SURFACE
      ?auto_186351 - PLACE
      ?auto_186352 - HOIST
      ?auto_186348 - SURFACE
      ?auto_186349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186347 ?auto_186346 ) ( IS-CRATE ?auto_186345 ) ( not ( = ?auto_186344 ?auto_186345 ) ) ( not ( = ?auto_186350 ?auto_186344 ) ) ( not ( = ?auto_186350 ?auto_186345 ) ) ( not ( = ?auto_186351 ?auto_186346 ) ) ( HOIST-AT ?auto_186352 ?auto_186351 ) ( not ( = ?auto_186347 ?auto_186352 ) ) ( SURFACE-AT ?auto_186345 ?auto_186351 ) ( ON ?auto_186345 ?auto_186348 ) ( CLEAR ?auto_186345 ) ( not ( = ?auto_186344 ?auto_186348 ) ) ( not ( = ?auto_186345 ?auto_186348 ) ) ( not ( = ?auto_186350 ?auto_186348 ) ) ( SURFACE-AT ?auto_186350 ?auto_186346 ) ( CLEAR ?auto_186350 ) ( IS-CRATE ?auto_186344 ) ( AVAILABLE ?auto_186347 ) ( TRUCK-AT ?auto_186349 ?auto_186351 ) ( LIFTING ?auto_186352 ?auto_186344 ) )
    :subtasks
    ( ( !LOAD ?auto_186352 ?auto_186344 ?auto_186349 ?auto_186351 )
      ( MAKE-2CRATE ?auto_186350 ?auto_186344 ?auto_186345 )
      ( MAKE-1CRATE-VERIFY ?auto_186344 ?auto_186345 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186353 - SURFACE
      ?auto_186354 - SURFACE
      ?auto_186355 - SURFACE
    )
    :vars
    (
      ?auto_186357 - HOIST
      ?auto_186359 - PLACE
      ?auto_186361 - PLACE
      ?auto_186360 - HOIST
      ?auto_186356 - SURFACE
      ?auto_186358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186357 ?auto_186359 ) ( IS-CRATE ?auto_186355 ) ( not ( = ?auto_186354 ?auto_186355 ) ) ( not ( = ?auto_186353 ?auto_186354 ) ) ( not ( = ?auto_186353 ?auto_186355 ) ) ( not ( = ?auto_186361 ?auto_186359 ) ) ( HOIST-AT ?auto_186360 ?auto_186361 ) ( not ( = ?auto_186357 ?auto_186360 ) ) ( SURFACE-AT ?auto_186355 ?auto_186361 ) ( ON ?auto_186355 ?auto_186356 ) ( CLEAR ?auto_186355 ) ( not ( = ?auto_186354 ?auto_186356 ) ) ( not ( = ?auto_186355 ?auto_186356 ) ) ( not ( = ?auto_186353 ?auto_186356 ) ) ( SURFACE-AT ?auto_186353 ?auto_186359 ) ( CLEAR ?auto_186353 ) ( IS-CRATE ?auto_186354 ) ( AVAILABLE ?auto_186357 ) ( TRUCK-AT ?auto_186358 ?auto_186361 ) ( LIFTING ?auto_186360 ?auto_186354 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186354 ?auto_186355 )
      ( MAKE-2CRATE-VERIFY ?auto_186353 ?auto_186354 ?auto_186355 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186362 - SURFACE
      ?auto_186363 - SURFACE
    )
    :vars
    (
      ?auto_186367 - HOIST
      ?auto_186368 - PLACE
      ?auto_186370 - SURFACE
      ?auto_186366 - PLACE
      ?auto_186364 - HOIST
      ?auto_186365 - SURFACE
      ?auto_186369 - TRUCK
      ?auto_186371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186367 ?auto_186368 ) ( IS-CRATE ?auto_186363 ) ( not ( = ?auto_186362 ?auto_186363 ) ) ( not ( = ?auto_186370 ?auto_186362 ) ) ( not ( = ?auto_186370 ?auto_186363 ) ) ( not ( = ?auto_186366 ?auto_186368 ) ) ( HOIST-AT ?auto_186364 ?auto_186366 ) ( not ( = ?auto_186367 ?auto_186364 ) ) ( SURFACE-AT ?auto_186363 ?auto_186366 ) ( ON ?auto_186363 ?auto_186365 ) ( CLEAR ?auto_186363 ) ( not ( = ?auto_186362 ?auto_186365 ) ) ( not ( = ?auto_186363 ?auto_186365 ) ) ( not ( = ?auto_186370 ?auto_186365 ) ) ( SURFACE-AT ?auto_186370 ?auto_186368 ) ( CLEAR ?auto_186370 ) ( IS-CRATE ?auto_186362 ) ( AVAILABLE ?auto_186367 ) ( TRUCK-AT ?auto_186369 ?auto_186366 ) ( AVAILABLE ?auto_186364 ) ( SURFACE-AT ?auto_186362 ?auto_186366 ) ( ON ?auto_186362 ?auto_186371 ) ( CLEAR ?auto_186362 ) ( not ( = ?auto_186362 ?auto_186371 ) ) ( not ( = ?auto_186363 ?auto_186371 ) ) ( not ( = ?auto_186370 ?auto_186371 ) ) ( not ( = ?auto_186365 ?auto_186371 ) ) )
    :subtasks
    ( ( !LIFT ?auto_186364 ?auto_186362 ?auto_186371 ?auto_186366 )
      ( MAKE-2CRATE ?auto_186370 ?auto_186362 ?auto_186363 )
      ( MAKE-1CRATE-VERIFY ?auto_186362 ?auto_186363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186372 - SURFACE
      ?auto_186373 - SURFACE
      ?auto_186374 - SURFACE
    )
    :vars
    (
      ?auto_186375 - HOIST
      ?auto_186381 - PLACE
      ?auto_186379 - PLACE
      ?auto_186377 - HOIST
      ?auto_186376 - SURFACE
      ?auto_186378 - TRUCK
      ?auto_186380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186375 ?auto_186381 ) ( IS-CRATE ?auto_186374 ) ( not ( = ?auto_186373 ?auto_186374 ) ) ( not ( = ?auto_186372 ?auto_186373 ) ) ( not ( = ?auto_186372 ?auto_186374 ) ) ( not ( = ?auto_186379 ?auto_186381 ) ) ( HOIST-AT ?auto_186377 ?auto_186379 ) ( not ( = ?auto_186375 ?auto_186377 ) ) ( SURFACE-AT ?auto_186374 ?auto_186379 ) ( ON ?auto_186374 ?auto_186376 ) ( CLEAR ?auto_186374 ) ( not ( = ?auto_186373 ?auto_186376 ) ) ( not ( = ?auto_186374 ?auto_186376 ) ) ( not ( = ?auto_186372 ?auto_186376 ) ) ( SURFACE-AT ?auto_186372 ?auto_186381 ) ( CLEAR ?auto_186372 ) ( IS-CRATE ?auto_186373 ) ( AVAILABLE ?auto_186375 ) ( TRUCK-AT ?auto_186378 ?auto_186379 ) ( AVAILABLE ?auto_186377 ) ( SURFACE-AT ?auto_186373 ?auto_186379 ) ( ON ?auto_186373 ?auto_186380 ) ( CLEAR ?auto_186373 ) ( not ( = ?auto_186373 ?auto_186380 ) ) ( not ( = ?auto_186374 ?auto_186380 ) ) ( not ( = ?auto_186372 ?auto_186380 ) ) ( not ( = ?auto_186376 ?auto_186380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186373 ?auto_186374 )
      ( MAKE-2CRATE-VERIFY ?auto_186372 ?auto_186373 ?auto_186374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186382 - SURFACE
      ?auto_186383 - SURFACE
    )
    :vars
    (
      ?auto_186387 - HOIST
      ?auto_186386 - PLACE
      ?auto_186385 - SURFACE
      ?auto_186384 - PLACE
      ?auto_186390 - HOIST
      ?auto_186389 - SURFACE
      ?auto_186388 - SURFACE
      ?auto_186391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186387 ?auto_186386 ) ( IS-CRATE ?auto_186383 ) ( not ( = ?auto_186382 ?auto_186383 ) ) ( not ( = ?auto_186385 ?auto_186382 ) ) ( not ( = ?auto_186385 ?auto_186383 ) ) ( not ( = ?auto_186384 ?auto_186386 ) ) ( HOIST-AT ?auto_186390 ?auto_186384 ) ( not ( = ?auto_186387 ?auto_186390 ) ) ( SURFACE-AT ?auto_186383 ?auto_186384 ) ( ON ?auto_186383 ?auto_186389 ) ( CLEAR ?auto_186383 ) ( not ( = ?auto_186382 ?auto_186389 ) ) ( not ( = ?auto_186383 ?auto_186389 ) ) ( not ( = ?auto_186385 ?auto_186389 ) ) ( SURFACE-AT ?auto_186385 ?auto_186386 ) ( CLEAR ?auto_186385 ) ( IS-CRATE ?auto_186382 ) ( AVAILABLE ?auto_186387 ) ( AVAILABLE ?auto_186390 ) ( SURFACE-AT ?auto_186382 ?auto_186384 ) ( ON ?auto_186382 ?auto_186388 ) ( CLEAR ?auto_186382 ) ( not ( = ?auto_186382 ?auto_186388 ) ) ( not ( = ?auto_186383 ?auto_186388 ) ) ( not ( = ?auto_186385 ?auto_186388 ) ) ( not ( = ?auto_186389 ?auto_186388 ) ) ( TRUCK-AT ?auto_186391 ?auto_186386 ) )
    :subtasks
    ( ( !DRIVE ?auto_186391 ?auto_186386 ?auto_186384 )
      ( MAKE-2CRATE ?auto_186385 ?auto_186382 ?auto_186383 )
      ( MAKE-1CRATE-VERIFY ?auto_186382 ?auto_186383 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_186392 - SURFACE
      ?auto_186393 - SURFACE
      ?auto_186394 - SURFACE
    )
    :vars
    (
      ?auto_186400 - HOIST
      ?auto_186398 - PLACE
      ?auto_186396 - PLACE
      ?auto_186401 - HOIST
      ?auto_186399 - SURFACE
      ?auto_186395 - SURFACE
      ?auto_186397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186400 ?auto_186398 ) ( IS-CRATE ?auto_186394 ) ( not ( = ?auto_186393 ?auto_186394 ) ) ( not ( = ?auto_186392 ?auto_186393 ) ) ( not ( = ?auto_186392 ?auto_186394 ) ) ( not ( = ?auto_186396 ?auto_186398 ) ) ( HOIST-AT ?auto_186401 ?auto_186396 ) ( not ( = ?auto_186400 ?auto_186401 ) ) ( SURFACE-AT ?auto_186394 ?auto_186396 ) ( ON ?auto_186394 ?auto_186399 ) ( CLEAR ?auto_186394 ) ( not ( = ?auto_186393 ?auto_186399 ) ) ( not ( = ?auto_186394 ?auto_186399 ) ) ( not ( = ?auto_186392 ?auto_186399 ) ) ( SURFACE-AT ?auto_186392 ?auto_186398 ) ( CLEAR ?auto_186392 ) ( IS-CRATE ?auto_186393 ) ( AVAILABLE ?auto_186400 ) ( AVAILABLE ?auto_186401 ) ( SURFACE-AT ?auto_186393 ?auto_186396 ) ( ON ?auto_186393 ?auto_186395 ) ( CLEAR ?auto_186393 ) ( not ( = ?auto_186393 ?auto_186395 ) ) ( not ( = ?auto_186394 ?auto_186395 ) ) ( not ( = ?auto_186392 ?auto_186395 ) ) ( not ( = ?auto_186399 ?auto_186395 ) ) ( TRUCK-AT ?auto_186397 ?auto_186398 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186393 ?auto_186394 )
      ( MAKE-2CRATE-VERIFY ?auto_186392 ?auto_186393 ?auto_186394 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186420 - SURFACE
      ?auto_186421 - SURFACE
      ?auto_186422 - SURFACE
      ?auto_186423 - SURFACE
    )
    :vars
    (
      ?auto_186424 - HOIST
      ?auto_186425 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186424 ?auto_186425 ) ( SURFACE-AT ?auto_186422 ?auto_186425 ) ( CLEAR ?auto_186422 ) ( LIFTING ?auto_186424 ?auto_186423 ) ( IS-CRATE ?auto_186423 ) ( not ( = ?auto_186422 ?auto_186423 ) ) ( ON ?auto_186421 ?auto_186420 ) ( ON ?auto_186422 ?auto_186421 ) ( not ( = ?auto_186420 ?auto_186421 ) ) ( not ( = ?auto_186420 ?auto_186422 ) ) ( not ( = ?auto_186420 ?auto_186423 ) ) ( not ( = ?auto_186421 ?auto_186422 ) ) ( not ( = ?auto_186421 ?auto_186423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186422 ?auto_186423 )
      ( MAKE-3CRATE-VERIFY ?auto_186420 ?auto_186421 ?auto_186422 ?auto_186423 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186437 - SURFACE
      ?auto_186438 - SURFACE
      ?auto_186439 - SURFACE
      ?auto_186440 - SURFACE
    )
    :vars
    (
      ?auto_186441 - HOIST
      ?auto_186442 - PLACE
      ?auto_186443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186441 ?auto_186442 ) ( SURFACE-AT ?auto_186439 ?auto_186442 ) ( CLEAR ?auto_186439 ) ( IS-CRATE ?auto_186440 ) ( not ( = ?auto_186439 ?auto_186440 ) ) ( TRUCK-AT ?auto_186443 ?auto_186442 ) ( AVAILABLE ?auto_186441 ) ( IN ?auto_186440 ?auto_186443 ) ( ON ?auto_186439 ?auto_186438 ) ( not ( = ?auto_186438 ?auto_186439 ) ) ( not ( = ?auto_186438 ?auto_186440 ) ) ( ON ?auto_186438 ?auto_186437 ) ( not ( = ?auto_186437 ?auto_186438 ) ) ( not ( = ?auto_186437 ?auto_186439 ) ) ( not ( = ?auto_186437 ?auto_186440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186438 ?auto_186439 ?auto_186440 )
      ( MAKE-3CRATE-VERIFY ?auto_186437 ?auto_186438 ?auto_186439 ?auto_186440 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186458 - SURFACE
      ?auto_186459 - SURFACE
      ?auto_186460 - SURFACE
      ?auto_186461 - SURFACE
    )
    :vars
    (
      ?auto_186462 - HOIST
      ?auto_186465 - PLACE
      ?auto_186463 - TRUCK
      ?auto_186464 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186462 ?auto_186465 ) ( SURFACE-AT ?auto_186460 ?auto_186465 ) ( CLEAR ?auto_186460 ) ( IS-CRATE ?auto_186461 ) ( not ( = ?auto_186460 ?auto_186461 ) ) ( AVAILABLE ?auto_186462 ) ( IN ?auto_186461 ?auto_186463 ) ( ON ?auto_186460 ?auto_186459 ) ( not ( = ?auto_186459 ?auto_186460 ) ) ( not ( = ?auto_186459 ?auto_186461 ) ) ( TRUCK-AT ?auto_186463 ?auto_186464 ) ( not ( = ?auto_186464 ?auto_186465 ) ) ( ON ?auto_186459 ?auto_186458 ) ( not ( = ?auto_186458 ?auto_186459 ) ) ( not ( = ?auto_186458 ?auto_186460 ) ) ( not ( = ?auto_186458 ?auto_186461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186459 ?auto_186460 ?auto_186461 )
      ( MAKE-3CRATE-VERIFY ?auto_186458 ?auto_186459 ?auto_186460 ?auto_186461 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186482 - SURFACE
      ?auto_186483 - SURFACE
      ?auto_186484 - SURFACE
      ?auto_186485 - SURFACE
    )
    :vars
    (
      ?auto_186490 - HOIST
      ?auto_186489 - PLACE
      ?auto_186488 - TRUCK
      ?auto_186487 - PLACE
      ?auto_186486 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186490 ?auto_186489 ) ( SURFACE-AT ?auto_186484 ?auto_186489 ) ( CLEAR ?auto_186484 ) ( IS-CRATE ?auto_186485 ) ( not ( = ?auto_186484 ?auto_186485 ) ) ( AVAILABLE ?auto_186490 ) ( ON ?auto_186484 ?auto_186483 ) ( not ( = ?auto_186483 ?auto_186484 ) ) ( not ( = ?auto_186483 ?auto_186485 ) ) ( TRUCK-AT ?auto_186488 ?auto_186487 ) ( not ( = ?auto_186487 ?auto_186489 ) ) ( HOIST-AT ?auto_186486 ?auto_186487 ) ( LIFTING ?auto_186486 ?auto_186485 ) ( not ( = ?auto_186490 ?auto_186486 ) ) ( ON ?auto_186483 ?auto_186482 ) ( not ( = ?auto_186482 ?auto_186483 ) ) ( not ( = ?auto_186482 ?auto_186484 ) ) ( not ( = ?auto_186482 ?auto_186485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186483 ?auto_186484 ?auto_186485 )
      ( MAKE-3CRATE-VERIFY ?auto_186482 ?auto_186483 ?auto_186484 ?auto_186485 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186509 - SURFACE
      ?auto_186510 - SURFACE
      ?auto_186511 - SURFACE
      ?auto_186512 - SURFACE
    )
    :vars
    (
      ?auto_186516 - HOIST
      ?auto_186515 - PLACE
      ?auto_186518 - TRUCK
      ?auto_186517 - PLACE
      ?auto_186513 - HOIST
      ?auto_186514 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186516 ?auto_186515 ) ( SURFACE-AT ?auto_186511 ?auto_186515 ) ( CLEAR ?auto_186511 ) ( IS-CRATE ?auto_186512 ) ( not ( = ?auto_186511 ?auto_186512 ) ) ( AVAILABLE ?auto_186516 ) ( ON ?auto_186511 ?auto_186510 ) ( not ( = ?auto_186510 ?auto_186511 ) ) ( not ( = ?auto_186510 ?auto_186512 ) ) ( TRUCK-AT ?auto_186518 ?auto_186517 ) ( not ( = ?auto_186517 ?auto_186515 ) ) ( HOIST-AT ?auto_186513 ?auto_186517 ) ( not ( = ?auto_186516 ?auto_186513 ) ) ( AVAILABLE ?auto_186513 ) ( SURFACE-AT ?auto_186512 ?auto_186517 ) ( ON ?auto_186512 ?auto_186514 ) ( CLEAR ?auto_186512 ) ( not ( = ?auto_186511 ?auto_186514 ) ) ( not ( = ?auto_186512 ?auto_186514 ) ) ( not ( = ?auto_186510 ?auto_186514 ) ) ( ON ?auto_186510 ?auto_186509 ) ( not ( = ?auto_186509 ?auto_186510 ) ) ( not ( = ?auto_186509 ?auto_186511 ) ) ( not ( = ?auto_186509 ?auto_186512 ) ) ( not ( = ?auto_186509 ?auto_186514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186510 ?auto_186511 ?auto_186512 )
      ( MAKE-3CRATE-VERIFY ?auto_186509 ?auto_186510 ?auto_186511 ?auto_186512 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186537 - SURFACE
      ?auto_186538 - SURFACE
      ?auto_186539 - SURFACE
      ?auto_186540 - SURFACE
    )
    :vars
    (
      ?auto_186544 - HOIST
      ?auto_186543 - PLACE
      ?auto_186546 - PLACE
      ?auto_186541 - HOIST
      ?auto_186545 - SURFACE
      ?auto_186542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186544 ?auto_186543 ) ( SURFACE-AT ?auto_186539 ?auto_186543 ) ( CLEAR ?auto_186539 ) ( IS-CRATE ?auto_186540 ) ( not ( = ?auto_186539 ?auto_186540 ) ) ( AVAILABLE ?auto_186544 ) ( ON ?auto_186539 ?auto_186538 ) ( not ( = ?auto_186538 ?auto_186539 ) ) ( not ( = ?auto_186538 ?auto_186540 ) ) ( not ( = ?auto_186546 ?auto_186543 ) ) ( HOIST-AT ?auto_186541 ?auto_186546 ) ( not ( = ?auto_186544 ?auto_186541 ) ) ( AVAILABLE ?auto_186541 ) ( SURFACE-AT ?auto_186540 ?auto_186546 ) ( ON ?auto_186540 ?auto_186545 ) ( CLEAR ?auto_186540 ) ( not ( = ?auto_186539 ?auto_186545 ) ) ( not ( = ?auto_186540 ?auto_186545 ) ) ( not ( = ?auto_186538 ?auto_186545 ) ) ( TRUCK-AT ?auto_186542 ?auto_186543 ) ( ON ?auto_186538 ?auto_186537 ) ( not ( = ?auto_186537 ?auto_186538 ) ) ( not ( = ?auto_186537 ?auto_186539 ) ) ( not ( = ?auto_186537 ?auto_186540 ) ) ( not ( = ?auto_186537 ?auto_186545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186538 ?auto_186539 ?auto_186540 )
      ( MAKE-3CRATE-VERIFY ?auto_186537 ?auto_186538 ?auto_186539 ?auto_186540 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186565 - SURFACE
      ?auto_186566 - SURFACE
      ?auto_186567 - SURFACE
      ?auto_186568 - SURFACE
    )
    :vars
    (
      ?auto_186574 - HOIST
      ?auto_186573 - PLACE
      ?auto_186571 - PLACE
      ?auto_186572 - HOIST
      ?auto_186570 - SURFACE
      ?auto_186569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186574 ?auto_186573 ) ( IS-CRATE ?auto_186568 ) ( not ( = ?auto_186567 ?auto_186568 ) ) ( not ( = ?auto_186566 ?auto_186567 ) ) ( not ( = ?auto_186566 ?auto_186568 ) ) ( not ( = ?auto_186571 ?auto_186573 ) ) ( HOIST-AT ?auto_186572 ?auto_186571 ) ( not ( = ?auto_186574 ?auto_186572 ) ) ( AVAILABLE ?auto_186572 ) ( SURFACE-AT ?auto_186568 ?auto_186571 ) ( ON ?auto_186568 ?auto_186570 ) ( CLEAR ?auto_186568 ) ( not ( = ?auto_186567 ?auto_186570 ) ) ( not ( = ?auto_186568 ?auto_186570 ) ) ( not ( = ?auto_186566 ?auto_186570 ) ) ( TRUCK-AT ?auto_186569 ?auto_186573 ) ( SURFACE-AT ?auto_186566 ?auto_186573 ) ( CLEAR ?auto_186566 ) ( LIFTING ?auto_186574 ?auto_186567 ) ( IS-CRATE ?auto_186567 ) ( ON ?auto_186566 ?auto_186565 ) ( not ( = ?auto_186565 ?auto_186566 ) ) ( not ( = ?auto_186565 ?auto_186567 ) ) ( not ( = ?auto_186565 ?auto_186568 ) ) ( not ( = ?auto_186565 ?auto_186570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186566 ?auto_186567 ?auto_186568 )
      ( MAKE-3CRATE-VERIFY ?auto_186565 ?auto_186566 ?auto_186567 ?auto_186568 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186593 - SURFACE
      ?auto_186594 - SURFACE
      ?auto_186595 - SURFACE
      ?auto_186596 - SURFACE
    )
    :vars
    (
      ?auto_186599 - HOIST
      ?auto_186602 - PLACE
      ?auto_186598 - PLACE
      ?auto_186600 - HOIST
      ?auto_186601 - SURFACE
      ?auto_186597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186599 ?auto_186602 ) ( IS-CRATE ?auto_186596 ) ( not ( = ?auto_186595 ?auto_186596 ) ) ( not ( = ?auto_186594 ?auto_186595 ) ) ( not ( = ?auto_186594 ?auto_186596 ) ) ( not ( = ?auto_186598 ?auto_186602 ) ) ( HOIST-AT ?auto_186600 ?auto_186598 ) ( not ( = ?auto_186599 ?auto_186600 ) ) ( AVAILABLE ?auto_186600 ) ( SURFACE-AT ?auto_186596 ?auto_186598 ) ( ON ?auto_186596 ?auto_186601 ) ( CLEAR ?auto_186596 ) ( not ( = ?auto_186595 ?auto_186601 ) ) ( not ( = ?auto_186596 ?auto_186601 ) ) ( not ( = ?auto_186594 ?auto_186601 ) ) ( TRUCK-AT ?auto_186597 ?auto_186602 ) ( SURFACE-AT ?auto_186594 ?auto_186602 ) ( CLEAR ?auto_186594 ) ( IS-CRATE ?auto_186595 ) ( AVAILABLE ?auto_186599 ) ( IN ?auto_186595 ?auto_186597 ) ( ON ?auto_186594 ?auto_186593 ) ( not ( = ?auto_186593 ?auto_186594 ) ) ( not ( = ?auto_186593 ?auto_186595 ) ) ( not ( = ?auto_186593 ?auto_186596 ) ) ( not ( = ?auto_186593 ?auto_186601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186594 ?auto_186595 ?auto_186596 )
      ( MAKE-3CRATE-VERIFY ?auto_186593 ?auto_186594 ?auto_186595 ?auto_186596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186672 - SURFACE
      ?auto_186673 - SURFACE
    )
    :vars
    (
      ?auto_186675 - HOIST
      ?auto_186674 - PLACE
      ?auto_186677 - SURFACE
      ?auto_186676 - PLACE
      ?auto_186678 - HOIST
      ?auto_186680 - SURFACE
      ?auto_186679 - TRUCK
      ?auto_186681 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186675 ?auto_186674 ) ( SURFACE-AT ?auto_186672 ?auto_186674 ) ( CLEAR ?auto_186672 ) ( IS-CRATE ?auto_186673 ) ( not ( = ?auto_186672 ?auto_186673 ) ) ( AVAILABLE ?auto_186675 ) ( ON ?auto_186672 ?auto_186677 ) ( not ( = ?auto_186677 ?auto_186672 ) ) ( not ( = ?auto_186677 ?auto_186673 ) ) ( not ( = ?auto_186676 ?auto_186674 ) ) ( HOIST-AT ?auto_186678 ?auto_186676 ) ( not ( = ?auto_186675 ?auto_186678 ) ) ( AVAILABLE ?auto_186678 ) ( SURFACE-AT ?auto_186673 ?auto_186676 ) ( ON ?auto_186673 ?auto_186680 ) ( CLEAR ?auto_186673 ) ( not ( = ?auto_186672 ?auto_186680 ) ) ( not ( = ?auto_186673 ?auto_186680 ) ) ( not ( = ?auto_186677 ?auto_186680 ) ) ( TRUCK-AT ?auto_186679 ?auto_186681 ) ( not ( = ?auto_186681 ?auto_186674 ) ) ( not ( = ?auto_186676 ?auto_186681 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_186679 ?auto_186681 ?auto_186674 )
      ( MAKE-1CRATE ?auto_186672 ?auto_186673 )
      ( MAKE-1CRATE-VERIFY ?auto_186672 ?auto_186673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186778 - SURFACE
      ?auto_186779 - SURFACE
    )
    :vars
    (
      ?auto_186782 - HOIST
      ?auto_186785 - PLACE
      ?auto_186783 - SURFACE
      ?auto_186786 - PLACE
      ?auto_186784 - HOIST
      ?auto_186781 - SURFACE
      ?auto_186780 - TRUCK
      ?auto_186787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186782 ?auto_186785 ) ( SURFACE-AT ?auto_186778 ?auto_186785 ) ( CLEAR ?auto_186778 ) ( IS-CRATE ?auto_186779 ) ( not ( = ?auto_186778 ?auto_186779 ) ) ( ON ?auto_186778 ?auto_186783 ) ( not ( = ?auto_186783 ?auto_186778 ) ) ( not ( = ?auto_186783 ?auto_186779 ) ) ( not ( = ?auto_186786 ?auto_186785 ) ) ( HOIST-AT ?auto_186784 ?auto_186786 ) ( not ( = ?auto_186782 ?auto_186784 ) ) ( AVAILABLE ?auto_186784 ) ( SURFACE-AT ?auto_186779 ?auto_186786 ) ( ON ?auto_186779 ?auto_186781 ) ( CLEAR ?auto_186779 ) ( not ( = ?auto_186778 ?auto_186781 ) ) ( not ( = ?auto_186779 ?auto_186781 ) ) ( not ( = ?auto_186783 ?auto_186781 ) ) ( TRUCK-AT ?auto_186780 ?auto_186785 ) ( LIFTING ?auto_186782 ?auto_186787 ) ( IS-CRATE ?auto_186787 ) ( not ( = ?auto_186778 ?auto_186787 ) ) ( not ( = ?auto_186779 ?auto_186787 ) ) ( not ( = ?auto_186783 ?auto_186787 ) ) ( not ( = ?auto_186781 ?auto_186787 ) ) )
    :subtasks
    ( ( !LOAD ?auto_186782 ?auto_186787 ?auto_186780 ?auto_186785 )
      ( MAKE-1CRATE ?auto_186778 ?auto_186779 )
      ( MAKE-1CRATE-VERIFY ?auto_186778 ?auto_186779 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186886 - SURFACE
      ?auto_186887 - SURFACE
      ?auto_186888 - SURFACE
      ?auto_186889 - SURFACE
      ?auto_186890 - SURFACE
    )
    :vars
    (
      ?auto_186891 - HOIST
      ?auto_186892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186891 ?auto_186892 ) ( SURFACE-AT ?auto_186889 ?auto_186892 ) ( CLEAR ?auto_186889 ) ( LIFTING ?auto_186891 ?auto_186890 ) ( IS-CRATE ?auto_186890 ) ( not ( = ?auto_186889 ?auto_186890 ) ) ( ON ?auto_186887 ?auto_186886 ) ( ON ?auto_186888 ?auto_186887 ) ( ON ?auto_186889 ?auto_186888 ) ( not ( = ?auto_186886 ?auto_186887 ) ) ( not ( = ?auto_186886 ?auto_186888 ) ) ( not ( = ?auto_186886 ?auto_186889 ) ) ( not ( = ?auto_186886 ?auto_186890 ) ) ( not ( = ?auto_186887 ?auto_186888 ) ) ( not ( = ?auto_186887 ?auto_186889 ) ) ( not ( = ?auto_186887 ?auto_186890 ) ) ( not ( = ?auto_186888 ?auto_186889 ) ) ( not ( = ?auto_186888 ?auto_186890 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186889 ?auto_186890 )
      ( MAKE-4CRATE-VERIFY ?auto_186886 ?auto_186887 ?auto_186888 ?auto_186889 ?auto_186890 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186911 - SURFACE
      ?auto_186912 - SURFACE
      ?auto_186913 - SURFACE
      ?auto_186914 - SURFACE
      ?auto_186915 - SURFACE
    )
    :vars
    (
      ?auto_186918 - HOIST
      ?auto_186917 - PLACE
      ?auto_186916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186918 ?auto_186917 ) ( SURFACE-AT ?auto_186914 ?auto_186917 ) ( CLEAR ?auto_186914 ) ( IS-CRATE ?auto_186915 ) ( not ( = ?auto_186914 ?auto_186915 ) ) ( TRUCK-AT ?auto_186916 ?auto_186917 ) ( AVAILABLE ?auto_186918 ) ( IN ?auto_186915 ?auto_186916 ) ( ON ?auto_186914 ?auto_186913 ) ( not ( = ?auto_186913 ?auto_186914 ) ) ( not ( = ?auto_186913 ?auto_186915 ) ) ( ON ?auto_186912 ?auto_186911 ) ( ON ?auto_186913 ?auto_186912 ) ( not ( = ?auto_186911 ?auto_186912 ) ) ( not ( = ?auto_186911 ?auto_186913 ) ) ( not ( = ?auto_186911 ?auto_186914 ) ) ( not ( = ?auto_186911 ?auto_186915 ) ) ( not ( = ?auto_186912 ?auto_186913 ) ) ( not ( = ?auto_186912 ?auto_186914 ) ) ( not ( = ?auto_186912 ?auto_186915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186913 ?auto_186914 ?auto_186915 )
      ( MAKE-4CRATE-VERIFY ?auto_186911 ?auto_186912 ?auto_186913 ?auto_186914 ?auto_186915 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186941 - SURFACE
      ?auto_186942 - SURFACE
      ?auto_186943 - SURFACE
      ?auto_186944 - SURFACE
      ?auto_186945 - SURFACE
    )
    :vars
    (
      ?auto_186947 - HOIST
      ?auto_186948 - PLACE
      ?auto_186949 - TRUCK
      ?auto_186946 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186947 ?auto_186948 ) ( SURFACE-AT ?auto_186944 ?auto_186948 ) ( CLEAR ?auto_186944 ) ( IS-CRATE ?auto_186945 ) ( not ( = ?auto_186944 ?auto_186945 ) ) ( AVAILABLE ?auto_186947 ) ( IN ?auto_186945 ?auto_186949 ) ( ON ?auto_186944 ?auto_186943 ) ( not ( = ?auto_186943 ?auto_186944 ) ) ( not ( = ?auto_186943 ?auto_186945 ) ) ( TRUCK-AT ?auto_186949 ?auto_186946 ) ( not ( = ?auto_186946 ?auto_186948 ) ) ( ON ?auto_186942 ?auto_186941 ) ( ON ?auto_186943 ?auto_186942 ) ( not ( = ?auto_186941 ?auto_186942 ) ) ( not ( = ?auto_186941 ?auto_186943 ) ) ( not ( = ?auto_186941 ?auto_186944 ) ) ( not ( = ?auto_186941 ?auto_186945 ) ) ( not ( = ?auto_186942 ?auto_186943 ) ) ( not ( = ?auto_186942 ?auto_186944 ) ) ( not ( = ?auto_186942 ?auto_186945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186943 ?auto_186944 ?auto_186945 )
      ( MAKE-4CRATE-VERIFY ?auto_186941 ?auto_186942 ?auto_186943 ?auto_186944 ?auto_186945 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186975 - SURFACE
      ?auto_186976 - SURFACE
      ?auto_186977 - SURFACE
      ?auto_186978 - SURFACE
      ?auto_186979 - SURFACE
    )
    :vars
    (
      ?auto_186982 - HOIST
      ?auto_186981 - PLACE
      ?auto_186980 - TRUCK
      ?auto_186984 - PLACE
      ?auto_186983 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186982 ?auto_186981 ) ( SURFACE-AT ?auto_186978 ?auto_186981 ) ( CLEAR ?auto_186978 ) ( IS-CRATE ?auto_186979 ) ( not ( = ?auto_186978 ?auto_186979 ) ) ( AVAILABLE ?auto_186982 ) ( ON ?auto_186978 ?auto_186977 ) ( not ( = ?auto_186977 ?auto_186978 ) ) ( not ( = ?auto_186977 ?auto_186979 ) ) ( TRUCK-AT ?auto_186980 ?auto_186984 ) ( not ( = ?auto_186984 ?auto_186981 ) ) ( HOIST-AT ?auto_186983 ?auto_186984 ) ( LIFTING ?auto_186983 ?auto_186979 ) ( not ( = ?auto_186982 ?auto_186983 ) ) ( ON ?auto_186976 ?auto_186975 ) ( ON ?auto_186977 ?auto_186976 ) ( not ( = ?auto_186975 ?auto_186976 ) ) ( not ( = ?auto_186975 ?auto_186977 ) ) ( not ( = ?auto_186975 ?auto_186978 ) ) ( not ( = ?auto_186975 ?auto_186979 ) ) ( not ( = ?auto_186976 ?auto_186977 ) ) ( not ( = ?auto_186976 ?auto_186978 ) ) ( not ( = ?auto_186976 ?auto_186979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186977 ?auto_186978 ?auto_186979 )
      ( MAKE-4CRATE-VERIFY ?auto_186975 ?auto_186976 ?auto_186977 ?auto_186978 ?auto_186979 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_187013 - SURFACE
      ?auto_187014 - SURFACE
      ?auto_187015 - SURFACE
      ?auto_187016 - SURFACE
      ?auto_187017 - SURFACE
    )
    :vars
    (
      ?auto_187018 - HOIST
      ?auto_187022 - PLACE
      ?auto_187021 - TRUCK
      ?auto_187020 - PLACE
      ?auto_187023 - HOIST
      ?auto_187019 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187018 ?auto_187022 ) ( SURFACE-AT ?auto_187016 ?auto_187022 ) ( CLEAR ?auto_187016 ) ( IS-CRATE ?auto_187017 ) ( not ( = ?auto_187016 ?auto_187017 ) ) ( AVAILABLE ?auto_187018 ) ( ON ?auto_187016 ?auto_187015 ) ( not ( = ?auto_187015 ?auto_187016 ) ) ( not ( = ?auto_187015 ?auto_187017 ) ) ( TRUCK-AT ?auto_187021 ?auto_187020 ) ( not ( = ?auto_187020 ?auto_187022 ) ) ( HOIST-AT ?auto_187023 ?auto_187020 ) ( not ( = ?auto_187018 ?auto_187023 ) ) ( AVAILABLE ?auto_187023 ) ( SURFACE-AT ?auto_187017 ?auto_187020 ) ( ON ?auto_187017 ?auto_187019 ) ( CLEAR ?auto_187017 ) ( not ( = ?auto_187016 ?auto_187019 ) ) ( not ( = ?auto_187017 ?auto_187019 ) ) ( not ( = ?auto_187015 ?auto_187019 ) ) ( ON ?auto_187014 ?auto_187013 ) ( ON ?auto_187015 ?auto_187014 ) ( not ( = ?auto_187013 ?auto_187014 ) ) ( not ( = ?auto_187013 ?auto_187015 ) ) ( not ( = ?auto_187013 ?auto_187016 ) ) ( not ( = ?auto_187013 ?auto_187017 ) ) ( not ( = ?auto_187013 ?auto_187019 ) ) ( not ( = ?auto_187014 ?auto_187015 ) ) ( not ( = ?auto_187014 ?auto_187016 ) ) ( not ( = ?auto_187014 ?auto_187017 ) ) ( not ( = ?auto_187014 ?auto_187019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187015 ?auto_187016 ?auto_187017 )
      ( MAKE-4CRATE-VERIFY ?auto_187013 ?auto_187014 ?auto_187015 ?auto_187016 ?auto_187017 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_187052 - SURFACE
      ?auto_187053 - SURFACE
      ?auto_187054 - SURFACE
      ?auto_187055 - SURFACE
      ?auto_187056 - SURFACE
    )
    :vars
    (
      ?auto_187062 - HOIST
      ?auto_187058 - PLACE
      ?auto_187060 - PLACE
      ?auto_187061 - HOIST
      ?auto_187059 - SURFACE
      ?auto_187057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187062 ?auto_187058 ) ( SURFACE-AT ?auto_187055 ?auto_187058 ) ( CLEAR ?auto_187055 ) ( IS-CRATE ?auto_187056 ) ( not ( = ?auto_187055 ?auto_187056 ) ) ( AVAILABLE ?auto_187062 ) ( ON ?auto_187055 ?auto_187054 ) ( not ( = ?auto_187054 ?auto_187055 ) ) ( not ( = ?auto_187054 ?auto_187056 ) ) ( not ( = ?auto_187060 ?auto_187058 ) ) ( HOIST-AT ?auto_187061 ?auto_187060 ) ( not ( = ?auto_187062 ?auto_187061 ) ) ( AVAILABLE ?auto_187061 ) ( SURFACE-AT ?auto_187056 ?auto_187060 ) ( ON ?auto_187056 ?auto_187059 ) ( CLEAR ?auto_187056 ) ( not ( = ?auto_187055 ?auto_187059 ) ) ( not ( = ?auto_187056 ?auto_187059 ) ) ( not ( = ?auto_187054 ?auto_187059 ) ) ( TRUCK-AT ?auto_187057 ?auto_187058 ) ( ON ?auto_187053 ?auto_187052 ) ( ON ?auto_187054 ?auto_187053 ) ( not ( = ?auto_187052 ?auto_187053 ) ) ( not ( = ?auto_187052 ?auto_187054 ) ) ( not ( = ?auto_187052 ?auto_187055 ) ) ( not ( = ?auto_187052 ?auto_187056 ) ) ( not ( = ?auto_187052 ?auto_187059 ) ) ( not ( = ?auto_187053 ?auto_187054 ) ) ( not ( = ?auto_187053 ?auto_187055 ) ) ( not ( = ?auto_187053 ?auto_187056 ) ) ( not ( = ?auto_187053 ?auto_187059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187054 ?auto_187055 ?auto_187056 )
      ( MAKE-4CRATE-VERIFY ?auto_187052 ?auto_187053 ?auto_187054 ?auto_187055 ?auto_187056 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_187091 - SURFACE
      ?auto_187092 - SURFACE
      ?auto_187093 - SURFACE
      ?auto_187094 - SURFACE
      ?auto_187095 - SURFACE
    )
    :vars
    (
      ?auto_187101 - HOIST
      ?auto_187100 - PLACE
      ?auto_187096 - PLACE
      ?auto_187099 - HOIST
      ?auto_187098 - SURFACE
      ?auto_187097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187101 ?auto_187100 ) ( IS-CRATE ?auto_187095 ) ( not ( = ?auto_187094 ?auto_187095 ) ) ( not ( = ?auto_187093 ?auto_187094 ) ) ( not ( = ?auto_187093 ?auto_187095 ) ) ( not ( = ?auto_187096 ?auto_187100 ) ) ( HOIST-AT ?auto_187099 ?auto_187096 ) ( not ( = ?auto_187101 ?auto_187099 ) ) ( AVAILABLE ?auto_187099 ) ( SURFACE-AT ?auto_187095 ?auto_187096 ) ( ON ?auto_187095 ?auto_187098 ) ( CLEAR ?auto_187095 ) ( not ( = ?auto_187094 ?auto_187098 ) ) ( not ( = ?auto_187095 ?auto_187098 ) ) ( not ( = ?auto_187093 ?auto_187098 ) ) ( TRUCK-AT ?auto_187097 ?auto_187100 ) ( SURFACE-AT ?auto_187093 ?auto_187100 ) ( CLEAR ?auto_187093 ) ( LIFTING ?auto_187101 ?auto_187094 ) ( IS-CRATE ?auto_187094 ) ( ON ?auto_187092 ?auto_187091 ) ( ON ?auto_187093 ?auto_187092 ) ( not ( = ?auto_187091 ?auto_187092 ) ) ( not ( = ?auto_187091 ?auto_187093 ) ) ( not ( = ?auto_187091 ?auto_187094 ) ) ( not ( = ?auto_187091 ?auto_187095 ) ) ( not ( = ?auto_187091 ?auto_187098 ) ) ( not ( = ?auto_187092 ?auto_187093 ) ) ( not ( = ?auto_187092 ?auto_187094 ) ) ( not ( = ?auto_187092 ?auto_187095 ) ) ( not ( = ?auto_187092 ?auto_187098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187093 ?auto_187094 ?auto_187095 )
      ( MAKE-4CRATE-VERIFY ?auto_187091 ?auto_187092 ?auto_187093 ?auto_187094 ?auto_187095 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_187130 - SURFACE
      ?auto_187131 - SURFACE
      ?auto_187132 - SURFACE
      ?auto_187133 - SURFACE
      ?auto_187134 - SURFACE
    )
    :vars
    (
      ?auto_187137 - HOIST
      ?auto_187139 - PLACE
      ?auto_187140 - PLACE
      ?auto_187136 - HOIST
      ?auto_187138 - SURFACE
      ?auto_187135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187137 ?auto_187139 ) ( IS-CRATE ?auto_187134 ) ( not ( = ?auto_187133 ?auto_187134 ) ) ( not ( = ?auto_187132 ?auto_187133 ) ) ( not ( = ?auto_187132 ?auto_187134 ) ) ( not ( = ?auto_187140 ?auto_187139 ) ) ( HOIST-AT ?auto_187136 ?auto_187140 ) ( not ( = ?auto_187137 ?auto_187136 ) ) ( AVAILABLE ?auto_187136 ) ( SURFACE-AT ?auto_187134 ?auto_187140 ) ( ON ?auto_187134 ?auto_187138 ) ( CLEAR ?auto_187134 ) ( not ( = ?auto_187133 ?auto_187138 ) ) ( not ( = ?auto_187134 ?auto_187138 ) ) ( not ( = ?auto_187132 ?auto_187138 ) ) ( TRUCK-AT ?auto_187135 ?auto_187139 ) ( SURFACE-AT ?auto_187132 ?auto_187139 ) ( CLEAR ?auto_187132 ) ( IS-CRATE ?auto_187133 ) ( AVAILABLE ?auto_187137 ) ( IN ?auto_187133 ?auto_187135 ) ( ON ?auto_187131 ?auto_187130 ) ( ON ?auto_187132 ?auto_187131 ) ( not ( = ?auto_187130 ?auto_187131 ) ) ( not ( = ?auto_187130 ?auto_187132 ) ) ( not ( = ?auto_187130 ?auto_187133 ) ) ( not ( = ?auto_187130 ?auto_187134 ) ) ( not ( = ?auto_187130 ?auto_187138 ) ) ( not ( = ?auto_187131 ?auto_187132 ) ) ( not ( = ?auto_187131 ?auto_187133 ) ) ( not ( = ?auto_187131 ?auto_187134 ) ) ( not ( = ?auto_187131 ?auto_187138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187132 ?auto_187133 ?auto_187134 )
      ( MAKE-4CRATE-VERIFY ?auto_187130 ?auto_187131 ?auto_187132 ?auto_187133 ?auto_187134 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_187403 - SURFACE
      ?auto_187404 - SURFACE
    )
    :vars
    (
      ?auto_187406 - HOIST
      ?auto_187407 - PLACE
      ?auto_187408 - SURFACE
      ?auto_187409 - TRUCK
      ?auto_187410 - PLACE
      ?auto_187411 - HOIST
      ?auto_187405 - SURFACE
      ?auto_187412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187406 ?auto_187407 ) ( SURFACE-AT ?auto_187403 ?auto_187407 ) ( CLEAR ?auto_187403 ) ( IS-CRATE ?auto_187404 ) ( not ( = ?auto_187403 ?auto_187404 ) ) ( AVAILABLE ?auto_187406 ) ( ON ?auto_187403 ?auto_187408 ) ( not ( = ?auto_187408 ?auto_187403 ) ) ( not ( = ?auto_187408 ?auto_187404 ) ) ( TRUCK-AT ?auto_187409 ?auto_187410 ) ( not ( = ?auto_187410 ?auto_187407 ) ) ( HOIST-AT ?auto_187411 ?auto_187410 ) ( not ( = ?auto_187406 ?auto_187411 ) ) ( SURFACE-AT ?auto_187404 ?auto_187410 ) ( ON ?auto_187404 ?auto_187405 ) ( CLEAR ?auto_187404 ) ( not ( = ?auto_187403 ?auto_187405 ) ) ( not ( = ?auto_187404 ?auto_187405 ) ) ( not ( = ?auto_187408 ?auto_187405 ) ) ( LIFTING ?auto_187411 ?auto_187412 ) ( IS-CRATE ?auto_187412 ) ( not ( = ?auto_187403 ?auto_187412 ) ) ( not ( = ?auto_187404 ?auto_187412 ) ) ( not ( = ?auto_187408 ?auto_187412 ) ) ( not ( = ?auto_187405 ?auto_187412 ) ) )
    :subtasks
    ( ( !LOAD ?auto_187411 ?auto_187412 ?auto_187409 ?auto_187410 )
      ( MAKE-1CRATE ?auto_187403 ?auto_187404 )
      ( MAKE-1CRATE-VERIFY ?auto_187403 ?auto_187404 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187781 - SURFACE
      ?auto_187782 - SURFACE
      ?auto_187783 - SURFACE
      ?auto_187784 - SURFACE
      ?auto_187785 - SURFACE
      ?auto_187786 - SURFACE
    )
    :vars
    (
      ?auto_187788 - HOIST
      ?auto_187787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187788 ?auto_187787 ) ( SURFACE-AT ?auto_187785 ?auto_187787 ) ( CLEAR ?auto_187785 ) ( LIFTING ?auto_187788 ?auto_187786 ) ( IS-CRATE ?auto_187786 ) ( not ( = ?auto_187785 ?auto_187786 ) ) ( ON ?auto_187782 ?auto_187781 ) ( ON ?auto_187783 ?auto_187782 ) ( ON ?auto_187784 ?auto_187783 ) ( ON ?auto_187785 ?auto_187784 ) ( not ( = ?auto_187781 ?auto_187782 ) ) ( not ( = ?auto_187781 ?auto_187783 ) ) ( not ( = ?auto_187781 ?auto_187784 ) ) ( not ( = ?auto_187781 ?auto_187785 ) ) ( not ( = ?auto_187781 ?auto_187786 ) ) ( not ( = ?auto_187782 ?auto_187783 ) ) ( not ( = ?auto_187782 ?auto_187784 ) ) ( not ( = ?auto_187782 ?auto_187785 ) ) ( not ( = ?auto_187782 ?auto_187786 ) ) ( not ( = ?auto_187783 ?auto_187784 ) ) ( not ( = ?auto_187783 ?auto_187785 ) ) ( not ( = ?auto_187783 ?auto_187786 ) ) ( not ( = ?auto_187784 ?auto_187785 ) ) ( not ( = ?auto_187784 ?auto_187786 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_187785 ?auto_187786 )
      ( MAKE-5CRATE-VERIFY ?auto_187781 ?auto_187782 ?auto_187783 ?auto_187784 ?auto_187785 ?auto_187786 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187815 - SURFACE
      ?auto_187816 - SURFACE
      ?auto_187817 - SURFACE
      ?auto_187818 - SURFACE
      ?auto_187819 - SURFACE
      ?auto_187820 - SURFACE
    )
    :vars
    (
      ?auto_187823 - HOIST
      ?auto_187822 - PLACE
      ?auto_187821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187823 ?auto_187822 ) ( SURFACE-AT ?auto_187819 ?auto_187822 ) ( CLEAR ?auto_187819 ) ( IS-CRATE ?auto_187820 ) ( not ( = ?auto_187819 ?auto_187820 ) ) ( TRUCK-AT ?auto_187821 ?auto_187822 ) ( AVAILABLE ?auto_187823 ) ( IN ?auto_187820 ?auto_187821 ) ( ON ?auto_187819 ?auto_187818 ) ( not ( = ?auto_187818 ?auto_187819 ) ) ( not ( = ?auto_187818 ?auto_187820 ) ) ( ON ?auto_187816 ?auto_187815 ) ( ON ?auto_187817 ?auto_187816 ) ( ON ?auto_187818 ?auto_187817 ) ( not ( = ?auto_187815 ?auto_187816 ) ) ( not ( = ?auto_187815 ?auto_187817 ) ) ( not ( = ?auto_187815 ?auto_187818 ) ) ( not ( = ?auto_187815 ?auto_187819 ) ) ( not ( = ?auto_187815 ?auto_187820 ) ) ( not ( = ?auto_187816 ?auto_187817 ) ) ( not ( = ?auto_187816 ?auto_187818 ) ) ( not ( = ?auto_187816 ?auto_187819 ) ) ( not ( = ?auto_187816 ?auto_187820 ) ) ( not ( = ?auto_187817 ?auto_187818 ) ) ( not ( = ?auto_187817 ?auto_187819 ) ) ( not ( = ?auto_187817 ?auto_187820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187818 ?auto_187819 ?auto_187820 )
      ( MAKE-5CRATE-VERIFY ?auto_187815 ?auto_187816 ?auto_187817 ?auto_187818 ?auto_187819 ?auto_187820 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187855 - SURFACE
      ?auto_187856 - SURFACE
      ?auto_187857 - SURFACE
      ?auto_187858 - SURFACE
      ?auto_187859 - SURFACE
      ?auto_187860 - SURFACE
    )
    :vars
    (
      ?auto_187861 - HOIST
      ?auto_187864 - PLACE
      ?auto_187863 - TRUCK
      ?auto_187862 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187861 ?auto_187864 ) ( SURFACE-AT ?auto_187859 ?auto_187864 ) ( CLEAR ?auto_187859 ) ( IS-CRATE ?auto_187860 ) ( not ( = ?auto_187859 ?auto_187860 ) ) ( AVAILABLE ?auto_187861 ) ( IN ?auto_187860 ?auto_187863 ) ( ON ?auto_187859 ?auto_187858 ) ( not ( = ?auto_187858 ?auto_187859 ) ) ( not ( = ?auto_187858 ?auto_187860 ) ) ( TRUCK-AT ?auto_187863 ?auto_187862 ) ( not ( = ?auto_187862 ?auto_187864 ) ) ( ON ?auto_187856 ?auto_187855 ) ( ON ?auto_187857 ?auto_187856 ) ( ON ?auto_187858 ?auto_187857 ) ( not ( = ?auto_187855 ?auto_187856 ) ) ( not ( = ?auto_187855 ?auto_187857 ) ) ( not ( = ?auto_187855 ?auto_187858 ) ) ( not ( = ?auto_187855 ?auto_187859 ) ) ( not ( = ?auto_187855 ?auto_187860 ) ) ( not ( = ?auto_187856 ?auto_187857 ) ) ( not ( = ?auto_187856 ?auto_187858 ) ) ( not ( = ?auto_187856 ?auto_187859 ) ) ( not ( = ?auto_187856 ?auto_187860 ) ) ( not ( = ?auto_187857 ?auto_187858 ) ) ( not ( = ?auto_187857 ?auto_187859 ) ) ( not ( = ?auto_187857 ?auto_187860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187858 ?auto_187859 ?auto_187860 )
      ( MAKE-5CRATE-VERIFY ?auto_187855 ?auto_187856 ?auto_187857 ?auto_187858 ?auto_187859 ?auto_187860 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187900 - SURFACE
      ?auto_187901 - SURFACE
      ?auto_187902 - SURFACE
      ?auto_187903 - SURFACE
      ?auto_187904 - SURFACE
      ?auto_187905 - SURFACE
    )
    :vars
    (
      ?auto_187910 - HOIST
      ?auto_187908 - PLACE
      ?auto_187909 - TRUCK
      ?auto_187907 - PLACE
      ?auto_187906 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_187910 ?auto_187908 ) ( SURFACE-AT ?auto_187904 ?auto_187908 ) ( CLEAR ?auto_187904 ) ( IS-CRATE ?auto_187905 ) ( not ( = ?auto_187904 ?auto_187905 ) ) ( AVAILABLE ?auto_187910 ) ( ON ?auto_187904 ?auto_187903 ) ( not ( = ?auto_187903 ?auto_187904 ) ) ( not ( = ?auto_187903 ?auto_187905 ) ) ( TRUCK-AT ?auto_187909 ?auto_187907 ) ( not ( = ?auto_187907 ?auto_187908 ) ) ( HOIST-AT ?auto_187906 ?auto_187907 ) ( LIFTING ?auto_187906 ?auto_187905 ) ( not ( = ?auto_187910 ?auto_187906 ) ) ( ON ?auto_187901 ?auto_187900 ) ( ON ?auto_187902 ?auto_187901 ) ( ON ?auto_187903 ?auto_187902 ) ( not ( = ?auto_187900 ?auto_187901 ) ) ( not ( = ?auto_187900 ?auto_187902 ) ) ( not ( = ?auto_187900 ?auto_187903 ) ) ( not ( = ?auto_187900 ?auto_187904 ) ) ( not ( = ?auto_187900 ?auto_187905 ) ) ( not ( = ?auto_187901 ?auto_187902 ) ) ( not ( = ?auto_187901 ?auto_187903 ) ) ( not ( = ?auto_187901 ?auto_187904 ) ) ( not ( = ?auto_187901 ?auto_187905 ) ) ( not ( = ?auto_187902 ?auto_187903 ) ) ( not ( = ?auto_187902 ?auto_187904 ) ) ( not ( = ?auto_187902 ?auto_187905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187903 ?auto_187904 ?auto_187905 )
      ( MAKE-5CRATE-VERIFY ?auto_187900 ?auto_187901 ?auto_187902 ?auto_187903 ?auto_187904 ?auto_187905 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187950 - SURFACE
      ?auto_187951 - SURFACE
      ?auto_187952 - SURFACE
      ?auto_187953 - SURFACE
      ?auto_187954 - SURFACE
      ?auto_187955 - SURFACE
    )
    :vars
    (
      ?auto_187958 - HOIST
      ?auto_187960 - PLACE
      ?auto_187961 - TRUCK
      ?auto_187957 - PLACE
      ?auto_187956 - HOIST
      ?auto_187959 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187958 ?auto_187960 ) ( SURFACE-AT ?auto_187954 ?auto_187960 ) ( CLEAR ?auto_187954 ) ( IS-CRATE ?auto_187955 ) ( not ( = ?auto_187954 ?auto_187955 ) ) ( AVAILABLE ?auto_187958 ) ( ON ?auto_187954 ?auto_187953 ) ( not ( = ?auto_187953 ?auto_187954 ) ) ( not ( = ?auto_187953 ?auto_187955 ) ) ( TRUCK-AT ?auto_187961 ?auto_187957 ) ( not ( = ?auto_187957 ?auto_187960 ) ) ( HOIST-AT ?auto_187956 ?auto_187957 ) ( not ( = ?auto_187958 ?auto_187956 ) ) ( AVAILABLE ?auto_187956 ) ( SURFACE-AT ?auto_187955 ?auto_187957 ) ( ON ?auto_187955 ?auto_187959 ) ( CLEAR ?auto_187955 ) ( not ( = ?auto_187954 ?auto_187959 ) ) ( not ( = ?auto_187955 ?auto_187959 ) ) ( not ( = ?auto_187953 ?auto_187959 ) ) ( ON ?auto_187951 ?auto_187950 ) ( ON ?auto_187952 ?auto_187951 ) ( ON ?auto_187953 ?auto_187952 ) ( not ( = ?auto_187950 ?auto_187951 ) ) ( not ( = ?auto_187950 ?auto_187952 ) ) ( not ( = ?auto_187950 ?auto_187953 ) ) ( not ( = ?auto_187950 ?auto_187954 ) ) ( not ( = ?auto_187950 ?auto_187955 ) ) ( not ( = ?auto_187950 ?auto_187959 ) ) ( not ( = ?auto_187951 ?auto_187952 ) ) ( not ( = ?auto_187951 ?auto_187953 ) ) ( not ( = ?auto_187951 ?auto_187954 ) ) ( not ( = ?auto_187951 ?auto_187955 ) ) ( not ( = ?auto_187951 ?auto_187959 ) ) ( not ( = ?auto_187952 ?auto_187953 ) ) ( not ( = ?auto_187952 ?auto_187954 ) ) ( not ( = ?auto_187952 ?auto_187955 ) ) ( not ( = ?auto_187952 ?auto_187959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187953 ?auto_187954 ?auto_187955 )
      ( MAKE-5CRATE-VERIFY ?auto_187950 ?auto_187951 ?auto_187952 ?auto_187953 ?auto_187954 ?auto_187955 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_188001 - SURFACE
      ?auto_188002 - SURFACE
      ?auto_188003 - SURFACE
      ?auto_188004 - SURFACE
      ?auto_188005 - SURFACE
      ?auto_188006 - SURFACE
    )
    :vars
    (
      ?auto_188008 - HOIST
      ?auto_188011 - PLACE
      ?auto_188009 - PLACE
      ?auto_188010 - HOIST
      ?auto_188012 - SURFACE
      ?auto_188007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_188008 ?auto_188011 ) ( SURFACE-AT ?auto_188005 ?auto_188011 ) ( CLEAR ?auto_188005 ) ( IS-CRATE ?auto_188006 ) ( not ( = ?auto_188005 ?auto_188006 ) ) ( AVAILABLE ?auto_188008 ) ( ON ?auto_188005 ?auto_188004 ) ( not ( = ?auto_188004 ?auto_188005 ) ) ( not ( = ?auto_188004 ?auto_188006 ) ) ( not ( = ?auto_188009 ?auto_188011 ) ) ( HOIST-AT ?auto_188010 ?auto_188009 ) ( not ( = ?auto_188008 ?auto_188010 ) ) ( AVAILABLE ?auto_188010 ) ( SURFACE-AT ?auto_188006 ?auto_188009 ) ( ON ?auto_188006 ?auto_188012 ) ( CLEAR ?auto_188006 ) ( not ( = ?auto_188005 ?auto_188012 ) ) ( not ( = ?auto_188006 ?auto_188012 ) ) ( not ( = ?auto_188004 ?auto_188012 ) ) ( TRUCK-AT ?auto_188007 ?auto_188011 ) ( ON ?auto_188002 ?auto_188001 ) ( ON ?auto_188003 ?auto_188002 ) ( ON ?auto_188004 ?auto_188003 ) ( not ( = ?auto_188001 ?auto_188002 ) ) ( not ( = ?auto_188001 ?auto_188003 ) ) ( not ( = ?auto_188001 ?auto_188004 ) ) ( not ( = ?auto_188001 ?auto_188005 ) ) ( not ( = ?auto_188001 ?auto_188006 ) ) ( not ( = ?auto_188001 ?auto_188012 ) ) ( not ( = ?auto_188002 ?auto_188003 ) ) ( not ( = ?auto_188002 ?auto_188004 ) ) ( not ( = ?auto_188002 ?auto_188005 ) ) ( not ( = ?auto_188002 ?auto_188006 ) ) ( not ( = ?auto_188002 ?auto_188012 ) ) ( not ( = ?auto_188003 ?auto_188004 ) ) ( not ( = ?auto_188003 ?auto_188005 ) ) ( not ( = ?auto_188003 ?auto_188006 ) ) ( not ( = ?auto_188003 ?auto_188012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_188004 ?auto_188005 ?auto_188006 )
      ( MAKE-5CRATE-VERIFY ?auto_188001 ?auto_188002 ?auto_188003 ?auto_188004 ?auto_188005 ?auto_188006 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_188052 - SURFACE
      ?auto_188053 - SURFACE
      ?auto_188054 - SURFACE
      ?auto_188055 - SURFACE
      ?auto_188056 - SURFACE
      ?auto_188057 - SURFACE
    )
    :vars
    (
      ?auto_188063 - HOIST
      ?auto_188059 - PLACE
      ?auto_188058 - PLACE
      ?auto_188061 - HOIST
      ?auto_188060 - SURFACE
      ?auto_188062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_188063 ?auto_188059 ) ( IS-CRATE ?auto_188057 ) ( not ( = ?auto_188056 ?auto_188057 ) ) ( not ( = ?auto_188055 ?auto_188056 ) ) ( not ( = ?auto_188055 ?auto_188057 ) ) ( not ( = ?auto_188058 ?auto_188059 ) ) ( HOIST-AT ?auto_188061 ?auto_188058 ) ( not ( = ?auto_188063 ?auto_188061 ) ) ( AVAILABLE ?auto_188061 ) ( SURFACE-AT ?auto_188057 ?auto_188058 ) ( ON ?auto_188057 ?auto_188060 ) ( CLEAR ?auto_188057 ) ( not ( = ?auto_188056 ?auto_188060 ) ) ( not ( = ?auto_188057 ?auto_188060 ) ) ( not ( = ?auto_188055 ?auto_188060 ) ) ( TRUCK-AT ?auto_188062 ?auto_188059 ) ( SURFACE-AT ?auto_188055 ?auto_188059 ) ( CLEAR ?auto_188055 ) ( LIFTING ?auto_188063 ?auto_188056 ) ( IS-CRATE ?auto_188056 ) ( ON ?auto_188053 ?auto_188052 ) ( ON ?auto_188054 ?auto_188053 ) ( ON ?auto_188055 ?auto_188054 ) ( not ( = ?auto_188052 ?auto_188053 ) ) ( not ( = ?auto_188052 ?auto_188054 ) ) ( not ( = ?auto_188052 ?auto_188055 ) ) ( not ( = ?auto_188052 ?auto_188056 ) ) ( not ( = ?auto_188052 ?auto_188057 ) ) ( not ( = ?auto_188052 ?auto_188060 ) ) ( not ( = ?auto_188053 ?auto_188054 ) ) ( not ( = ?auto_188053 ?auto_188055 ) ) ( not ( = ?auto_188053 ?auto_188056 ) ) ( not ( = ?auto_188053 ?auto_188057 ) ) ( not ( = ?auto_188053 ?auto_188060 ) ) ( not ( = ?auto_188054 ?auto_188055 ) ) ( not ( = ?auto_188054 ?auto_188056 ) ) ( not ( = ?auto_188054 ?auto_188057 ) ) ( not ( = ?auto_188054 ?auto_188060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_188055 ?auto_188056 ?auto_188057 )
      ( MAKE-5CRATE-VERIFY ?auto_188052 ?auto_188053 ?auto_188054 ?auto_188055 ?auto_188056 ?auto_188057 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_188103 - SURFACE
      ?auto_188104 - SURFACE
      ?auto_188105 - SURFACE
      ?auto_188106 - SURFACE
      ?auto_188107 - SURFACE
      ?auto_188108 - SURFACE
    )
    :vars
    (
      ?auto_188114 - HOIST
      ?auto_188112 - PLACE
      ?auto_188109 - PLACE
      ?auto_188111 - HOIST
      ?auto_188110 - SURFACE
      ?auto_188113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_188114 ?auto_188112 ) ( IS-CRATE ?auto_188108 ) ( not ( = ?auto_188107 ?auto_188108 ) ) ( not ( = ?auto_188106 ?auto_188107 ) ) ( not ( = ?auto_188106 ?auto_188108 ) ) ( not ( = ?auto_188109 ?auto_188112 ) ) ( HOIST-AT ?auto_188111 ?auto_188109 ) ( not ( = ?auto_188114 ?auto_188111 ) ) ( AVAILABLE ?auto_188111 ) ( SURFACE-AT ?auto_188108 ?auto_188109 ) ( ON ?auto_188108 ?auto_188110 ) ( CLEAR ?auto_188108 ) ( not ( = ?auto_188107 ?auto_188110 ) ) ( not ( = ?auto_188108 ?auto_188110 ) ) ( not ( = ?auto_188106 ?auto_188110 ) ) ( TRUCK-AT ?auto_188113 ?auto_188112 ) ( SURFACE-AT ?auto_188106 ?auto_188112 ) ( CLEAR ?auto_188106 ) ( IS-CRATE ?auto_188107 ) ( AVAILABLE ?auto_188114 ) ( IN ?auto_188107 ?auto_188113 ) ( ON ?auto_188104 ?auto_188103 ) ( ON ?auto_188105 ?auto_188104 ) ( ON ?auto_188106 ?auto_188105 ) ( not ( = ?auto_188103 ?auto_188104 ) ) ( not ( = ?auto_188103 ?auto_188105 ) ) ( not ( = ?auto_188103 ?auto_188106 ) ) ( not ( = ?auto_188103 ?auto_188107 ) ) ( not ( = ?auto_188103 ?auto_188108 ) ) ( not ( = ?auto_188103 ?auto_188110 ) ) ( not ( = ?auto_188104 ?auto_188105 ) ) ( not ( = ?auto_188104 ?auto_188106 ) ) ( not ( = ?auto_188104 ?auto_188107 ) ) ( not ( = ?auto_188104 ?auto_188108 ) ) ( not ( = ?auto_188104 ?auto_188110 ) ) ( not ( = ?auto_188105 ?auto_188106 ) ) ( not ( = ?auto_188105 ?auto_188107 ) ) ( not ( = ?auto_188105 ?auto_188108 ) ) ( not ( = ?auto_188105 ?auto_188110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_188106 ?auto_188107 ?auto_188108 )
      ( MAKE-5CRATE-VERIFY ?auto_188103 ?auto_188104 ?auto_188105 ?auto_188106 ?auto_188107 ?auto_188108 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189299 - SURFACE
      ?auto_189300 - SURFACE
      ?auto_189301 - SURFACE
      ?auto_189302 - SURFACE
      ?auto_189303 - SURFACE
      ?auto_189304 - SURFACE
      ?auto_189305 - SURFACE
    )
    :vars
    (
      ?auto_189307 - HOIST
      ?auto_189306 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189307 ?auto_189306 ) ( SURFACE-AT ?auto_189304 ?auto_189306 ) ( CLEAR ?auto_189304 ) ( LIFTING ?auto_189307 ?auto_189305 ) ( IS-CRATE ?auto_189305 ) ( not ( = ?auto_189304 ?auto_189305 ) ) ( ON ?auto_189300 ?auto_189299 ) ( ON ?auto_189301 ?auto_189300 ) ( ON ?auto_189302 ?auto_189301 ) ( ON ?auto_189303 ?auto_189302 ) ( ON ?auto_189304 ?auto_189303 ) ( not ( = ?auto_189299 ?auto_189300 ) ) ( not ( = ?auto_189299 ?auto_189301 ) ) ( not ( = ?auto_189299 ?auto_189302 ) ) ( not ( = ?auto_189299 ?auto_189303 ) ) ( not ( = ?auto_189299 ?auto_189304 ) ) ( not ( = ?auto_189299 ?auto_189305 ) ) ( not ( = ?auto_189300 ?auto_189301 ) ) ( not ( = ?auto_189300 ?auto_189302 ) ) ( not ( = ?auto_189300 ?auto_189303 ) ) ( not ( = ?auto_189300 ?auto_189304 ) ) ( not ( = ?auto_189300 ?auto_189305 ) ) ( not ( = ?auto_189301 ?auto_189302 ) ) ( not ( = ?auto_189301 ?auto_189303 ) ) ( not ( = ?auto_189301 ?auto_189304 ) ) ( not ( = ?auto_189301 ?auto_189305 ) ) ( not ( = ?auto_189302 ?auto_189303 ) ) ( not ( = ?auto_189302 ?auto_189304 ) ) ( not ( = ?auto_189302 ?auto_189305 ) ) ( not ( = ?auto_189303 ?auto_189304 ) ) ( not ( = ?auto_189303 ?auto_189305 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_189304 ?auto_189305 )
      ( MAKE-6CRATE-VERIFY ?auto_189299 ?auto_189300 ?auto_189301 ?auto_189302 ?auto_189303 ?auto_189304 ?auto_189305 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189343 - SURFACE
      ?auto_189344 - SURFACE
      ?auto_189345 - SURFACE
      ?auto_189346 - SURFACE
      ?auto_189347 - SURFACE
      ?auto_189348 - SURFACE
      ?auto_189349 - SURFACE
    )
    :vars
    (
      ?auto_189352 - HOIST
      ?auto_189350 - PLACE
      ?auto_189351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189352 ?auto_189350 ) ( SURFACE-AT ?auto_189348 ?auto_189350 ) ( CLEAR ?auto_189348 ) ( IS-CRATE ?auto_189349 ) ( not ( = ?auto_189348 ?auto_189349 ) ) ( TRUCK-AT ?auto_189351 ?auto_189350 ) ( AVAILABLE ?auto_189352 ) ( IN ?auto_189349 ?auto_189351 ) ( ON ?auto_189348 ?auto_189347 ) ( not ( = ?auto_189347 ?auto_189348 ) ) ( not ( = ?auto_189347 ?auto_189349 ) ) ( ON ?auto_189344 ?auto_189343 ) ( ON ?auto_189345 ?auto_189344 ) ( ON ?auto_189346 ?auto_189345 ) ( ON ?auto_189347 ?auto_189346 ) ( not ( = ?auto_189343 ?auto_189344 ) ) ( not ( = ?auto_189343 ?auto_189345 ) ) ( not ( = ?auto_189343 ?auto_189346 ) ) ( not ( = ?auto_189343 ?auto_189347 ) ) ( not ( = ?auto_189343 ?auto_189348 ) ) ( not ( = ?auto_189343 ?auto_189349 ) ) ( not ( = ?auto_189344 ?auto_189345 ) ) ( not ( = ?auto_189344 ?auto_189346 ) ) ( not ( = ?auto_189344 ?auto_189347 ) ) ( not ( = ?auto_189344 ?auto_189348 ) ) ( not ( = ?auto_189344 ?auto_189349 ) ) ( not ( = ?auto_189345 ?auto_189346 ) ) ( not ( = ?auto_189345 ?auto_189347 ) ) ( not ( = ?auto_189345 ?auto_189348 ) ) ( not ( = ?auto_189345 ?auto_189349 ) ) ( not ( = ?auto_189346 ?auto_189347 ) ) ( not ( = ?auto_189346 ?auto_189348 ) ) ( not ( = ?auto_189346 ?auto_189349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189347 ?auto_189348 ?auto_189349 )
      ( MAKE-6CRATE-VERIFY ?auto_189343 ?auto_189344 ?auto_189345 ?auto_189346 ?auto_189347 ?auto_189348 ?auto_189349 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189394 - SURFACE
      ?auto_189395 - SURFACE
      ?auto_189396 - SURFACE
      ?auto_189397 - SURFACE
      ?auto_189398 - SURFACE
      ?auto_189399 - SURFACE
      ?auto_189400 - SURFACE
    )
    :vars
    (
      ?auto_189403 - HOIST
      ?auto_189402 - PLACE
      ?auto_189404 - TRUCK
      ?auto_189401 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189403 ?auto_189402 ) ( SURFACE-AT ?auto_189399 ?auto_189402 ) ( CLEAR ?auto_189399 ) ( IS-CRATE ?auto_189400 ) ( not ( = ?auto_189399 ?auto_189400 ) ) ( AVAILABLE ?auto_189403 ) ( IN ?auto_189400 ?auto_189404 ) ( ON ?auto_189399 ?auto_189398 ) ( not ( = ?auto_189398 ?auto_189399 ) ) ( not ( = ?auto_189398 ?auto_189400 ) ) ( TRUCK-AT ?auto_189404 ?auto_189401 ) ( not ( = ?auto_189401 ?auto_189402 ) ) ( ON ?auto_189395 ?auto_189394 ) ( ON ?auto_189396 ?auto_189395 ) ( ON ?auto_189397 ?auto_189396 ) ( ON ?auto_189398 ?auto_189397 ) ( not ( = ?auto_189394 ?auto_189395 ) ) ( not ( = ?auto_189394 ?auto_189396 ) ) ( not ( = ?auto_189394 ?auto_189397 ) ) ( not ( = ?auto_189394 ?auto_189398 ) ) ( not ( = ?auto_189394 ?auto_189399 ) ) ( not ( = ?auto_189394 ?auto_189400 ) ) ( not ( = ?auto_189395 ?auto_189396 ) ) ( not ( = ?auto_189395 ?auto_189397 ) ) ( not ( = ?auto_189395 ?auto_189398 ) ) ( not ( = ?auto_189395 ?auto_189399 ) ) ( not ( = ?auto_189395 ?auto_189400 ) ) ( not ( = ?auto_189396 ?auto_189397 ) ) ( not ( = ?auto_189396 ?auto_189398 ) ) ( not ( = ?auto_189396 ?auto_189399 ) ) ( not ( = ?auto_189396 ?auto_189400 ) ) ( not ( = ?auto_189397 ?auto_189398 ) ) ( not ( = ?auto_189397 ?auto_189399 ) ) ( not ( = ?auto_189397 ?auto_189400 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189398 ?auto_189399 ?auto_189400 )
      ( MAKE-6CRATE-VERIFY ?auto_189394 ?auto_189395 ?auto_189396 ?auto_189397 ?auto_189398 ?auto_189399 ?auto_189400 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189451 - SURFACE
      ?auto_189452 - SURFACE
      ?auto_189453 - SURFACE
      ?auto_189454 - SURFACE
      ?auto_189455 - SURFACE
      ?auto_189456 - SURFACE
      ?auto_189457 - SURFACE
    )
    :vars
    (
      ?auto_189461 - HOIST
      ?auto_189460 - PLACE
      ?auto_189462 - TRUCK
      ?auto_189459 - PLACE
      ?auto_189458 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_189461 ?auto_189460 ) ( SURFACE-AT ?auto_189456 ?auto_189460 ) ( CLEAR ?auto_189456 ) ( IS-CRATE ?auto_189457 ) ( not ( = ?auto_189456 ?auto_189457 ) ) ( AVAILABLE ?auto_189461 ) ( ON ?auto_189456 ?auto_189455 ) ( not ( = ?auto_189455 ?auto_189456 ) ) ( not ( = ?auto_189455 ?auto_189457 ) ) ( TRUCK-AT ?auto_189462 ?auto_189459 ) ( not ( = ?auto_189459 ?auto_189460 ) ) ( HOIST-AT ?auto_189458 ?auto_189459 ) ( LIFTING ?auto_189458 ?auto_189457 ) ( not ( = ?auto_189461 ?auto_189458 ) ) ( ON ?auto_189452 ?auto_189451 ) ( ON ?auto_189453 ?auto_189452 ) ( ON ?auto_189454 ?auto_189453 ) ( ON ?auto_189455 ?auto_189454 ) ( not ( = ?auto_189451 ?auto_189452 ) ) ( not ( = ?auto_189451 ?auto_189453 ) ) ( not ( = ?auto_189451 ?auto_189454 ) ) ( not ( = ?auto_189451 ?auto_189455 ) ) ( not ( = ?auto_189451 ?auto_189456 ) ) ( not ( = ?auto_189451 ?auto_189457 ) ) ( not ( = ?auto_189452 ?auto_189453 ) ) ( not ( = ?auto_189452 ?auto_189454 ) ) ( not ( = ?auto_189452 ?auto_189455 ) ) ( not ( = ?auto_189452 ?auto_189456 ) ) ( not ( = ?auto_189452 ?auto_189457 ) ) ( not ( = ?auto_189453 ?auto_189454 ) ) ( not ( = ?auto_189453 ?auto_189455 ) ) ( not ( = ?auto_189453 ?auto_189456 ) ) ( not ( = ?auto_189453 ?auto_189457 ) ) ( not ( = ?auto_189454 ?auto_189455 ) ) ( not ( = ?auto_189454 ?auto_189456 ) ) ( not ( = ?auto_189454 ?auto_189457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189455 ?auto_189456 ?auto_189457 )
      ( MAKE-6CRATE-VERIFY ?auto_189451 ?auto_189452 ?auto_189453 ?auto_189454 ?auto_189455 ?auto_189456 ?auto_189457 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189514 - SURFACE
      ?auto_189515 - SURFACE
      ?auto_189516 - SURFACE
      ?auto_189517 - SURFACE
      ?auto_189518 - SURFACE
      ?auto_189519 - SURFACE
      ?auto_189520 - SURFACE
    )
    :vars
    (
      ?auto_189525 - HOIST
      ?auto_189524 - PLACE
      ?auto_189522 - TRUCK
      ?auto_189523 - PLACE
      ?auto_189526 - HOIST
      ?auto_189521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189525 ?auto_189524 ) ( SURFACE-AT ?auto_189519 ?auto_189524 ) ( CLEAR ?auto_189519 ) ( IS-CRATE ?auto_189520 ) ( not ( = ?auto_189519 ?auto_189520 ) ) ( AVAILABLE ?auto_189525 ) ( ON ?auto_189519 ?auto_189518 ) ( not ( = ?auto_189518 ?auto_189519 ) ) ( not ( = ?auto_189518 ?auto_189520 ) ) ( TRUCK-AT ?auto_189522 ?auto_189523 ) ( not ( = ?auto_189523 ?auto_189524 ) ) ( HOIST-AT ?auto_189526 ?auto_189523 ) ( not ( = ?auto_189525 ?auto_189526 ) ) ( AVAILABLE ?auto_189526 ) ( SURFACE-AT ?auto_189520 ?auto_189523 ) ( ON ?auto_189520 ?auto_189521 ) ( CLEAR ?auto_189520 ) ( not ( = ?auto_189519 ?auto_189521 ) ) ( not ( = ?auto_189520 ?auto_189521 ) ) ( not ( = ?auto_189518 ?auto_189521 ) ) ( ON ?auto_189515 ?auto_189514 ) ( ON ?auto_189516 ?auto_189515 ) ( ON ?auto_189517 ?auto_189516 ) ( ON ?auto_189518 ?auto_189517 ) ( not ( = ?auto_189514 ?auto_189515 ) ) ( not ( = ?auto_189514 ?auto_189516 ) ) ( not ( = ?auto_189514 ?auto_189517 ) ) ( not ( = ?auto_189514 ?auto_189518 ) ) ( not ( = ?auto_189514 ?auto_189519 ) ) ( not ( = ?auto_189514 ?auto_189520 ) ) ( not ( = ?auto_189514 ?auto_189521 ) ) ( not ( = ?auto_189515 ?auto_189516 ) ) ( not ( = ?auto_189515 ?auto_189517 ) ) ( not ( = ?auto_189515 ?auto_189518 ) ) ( not ( = ?auto_189515 ?auto_189519 ) ) ( not ( = ?auto_189515 ?auto_189520 ) ) ( not ( = ?auto_189515 ?auto_189521 ) ) ( not ( = ?auto_189516 ?auto_189517 ) ) ( not ( = ?auto_189516 ?auto_189518 ) ) ( not ( = ?auto_189516 ?auto_189519 ) ) ( not ( = ?auto_189516 ?auto_189520 ) ) ( not ( = ?auto_189516 ?auto_189521 ) ) ( not ( = ?auto_189517 ?auto_189518 ) ) ( not ( = ?auto_189517 ?auto_189519 ) ) ( not ( = ?auto_189517 ?auto_189520 ) ) ( not ( = ?auto_189517 ?auto_189521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189518 ?auto_189519 ?auto_189520 )
      ( MAKE-6CRATE-VERIFY ?auto_189514 ?auto_189515 ?auto_189516 ?auto_189517 ?auto_189518 ?auto_189519 ?auto_189520 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189578 - SURFACE
      ?auto_189579 - SURFACE
      ?auto_189580 - SURFACE
      ?auto_189581 - SURFACE
      ?auto_189582 - SURFACE
      ?auto_189583 - SURFACE
      ?auto_189584 - SURFACE
    )
    :vars
    (
      ?auto_189587 - HOIST
      ?auto_189589 - PLACE
      ?auto_189586 - PLACE
      ?auto_189585 - HOIST
      ?auto_189588 - SURFACE
      ?auto_189590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189587 ?auto_189589 ) ( SURFACE-AT ?auto_189583 ?auto_189589 ) ( CLEAR ?auto_189583 ) ( IS-CRATE ?auto_189584 ) ( not ( = ?auto_189583 ?auto_189584 ) ) ( AVAILABLE ?auto_189587 ) ( ON ?auto_189583 ?auto_189582 ) ( not ( = ?auto_189582 ?auto_189583 ) ) ( not ( = ?auto_189582 ?auto_189584 ) ) ( not ( = ?auto_189586 ?auto_189589 ) ) ( HOIST-AT ?auto_189585 ?auto_189586 ) ( not ( = ?auto_189587 ?auto_189585 ) ) ( AVAILABLE ?auto_189585 ) ( SURFACE-AT ?auto_189584 ?auto_189586 ) ( ON ?auto_189584 ?auto_189588 ) ( CLEAR ?auto_189584 ) ( not ( = ?auto_189583 ?auto_189588 ) ) ( not ( = ?auto_189584 ?auto_189588 ) ) ( not ( = ?auto_189582 ?auto_189588 ) ) ( TRUCK-AT ?auto_189590 ?auto_189589 ) ( ON ?auto_189579 ?auto_189578 ) ( ON ?auto_189580 ?auto_189579 ) ( ON ?auto_189581 ?auto_189580 ) ( ON ?auto_189582 ?auto_189581 ) ( not ( = ?auto_189578 ?auto_189579 ) ) ( not ( = ?auto_189578 ?auto_189580 ) ) ( not ( = ?auto_189578 ?auto_189581 ) ) ( not ( = ?auto_189578 ?auto_189582 ) ) ( not ( = ?auto_189578 ?auto_189583 ) ) ( not ( = ?auto_189578 ?auto_189584 ) ) ( not ( = ?auto_189578 ?auto_189588 ) ) ( not ( = ?auto_189579 ?auto_189580 ) ) ( not ( = ?auto_189579 ?auto_189581 ) ) ( not ( = ?auto_189579 ?auto_189582 ) ) ( not ( = ?auto_189579 ?auto_189583 ) ) ( not ( = ?auto_189579 ?auto_189584 ) ) ( not ( = ?auto_189579 ?auto_189588 ) ) ( not ( = ?auto_189580 ?auto_189581 ) ) ( not ( = ?auto_189580 ?auto_189582 ) ) ( not ( = ?auto_189580 ?auto_189583 ) ) ( not ( = ?auto_189580 ?auto_189584 ) ) ( not ( = ?auto_189580 ?auto_189588 ) ) ( not ( = ?auto_189581 ?auto_189582 ) ) ( not ( = ?auto_189581 ?auto_189583 ) ) ( not ( = ?auto_189581 ?auto_189584 ) ) ( not ( = ?auto_189581 ?auto_189588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189582 ?auto_189583 ?auto_189584 )
      ( MAKE-6CRATE-VERIFY ?auto_189578 ?auto_189579 ?auto_189580 ?auto_189581 ?auto_189582 ?auto_189583 ?auto_189584 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189642 - SURFACE
      ?auto_189643 - SURFACE
      ?auto_189644 - SURFACE
      ?auto_189645 - SURFACE
      ?auto_189646 - SURFACE
      ?auto_189647 - SURFACE
      ?auto_189648 - SURFACE
    )
    :vars
    (
      ?auto_189649 - HOIST
      ?auto_189650 - PLACE
      ?auto_189651 - PLACE
      ?auto_189653 - HOIST
      ?auto_189654 - SURFACE
      ?auto_189652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189649 ?auto_189650 ) ( IS-CRATE ?auto_189648 ) ( not ( = ?auto_189647 ?auto_189648 ) ) ( not ( = ?auto_189646 ?auto_189647 ) ) ( not ( = ?auto_189646 ?auto_189648 ) ) ( not ( = ?auto_189651 ?auto_189650 ) ) ( HOIST-AT ?auto_189653 ?auto_189651 ) ( not ( = ?auto_189649 ?auto_189653 ) ) ( AVAILABLE ?auto_189653 ) ( SURFACE-AT ?auto_189648 ?auto_189651 ) ( ON ?auto_189648 ?auto_189654 ) ( CLEAR ?auto_189648 ) ( not ( = ?auto_189647 ?auto_189654 ) ) ( not ( = ?auto_189648 ?auto_189654 ) ) ( not ( = ?auto_189646 ?auto_189654 ) ) ( TRUCK-AT ?auto_189652 ?auto_189650 ) ( SURFACE-AT ?auto_189646 ?auto_189650 ) ( CLEAR ?auto_189646 ) ( LIFTING ?auto_189649 ?auto_189647 ) ( IS-CRATE ?auto_189647 ) ( ON ?auto_189643 ?auto_189642 ) ( ON ?auto_189644 ?auto_189643 ) ( ON ?auto_189645 ?auto_189644 ) ( ON ?auto_189646 ?auto_189645 ) ( not ( = ?auto_189642 ?auto_189643 ) ) ( not ( = ?auto_189642 ?auto_189644 ) ) ( not ( = ?auto_189642 ?auto_189645 ) ) ( not ( = ?auto_189642 ?auto_189646 ) ) ( not ( = ?auto_189642 ?auto_189647 ) ) ( not ( = ?auto_189642 ?auto_189648 ) ) ( not ( = ?auto_189642 ?auto_189654 ) ) ( not ( = ?auto_189643 ?auto_189644 ) ) ( not ( = ?auto_189643 ?auto_189645 ) ) ( not ( = ?auto_189643 ?auto_189646 ) ) ( not ( = ?auto_189643 ?auto_189647 ) ) ( not ( = ?auto_189643 ?auto_189648 ) ) ( not ( = ?auto_189643 ?auto_189654 ) ) ( not ( = ?auto_189644 ?auto_189645 ) ) ( not ( = ?auto_189644 ?auto_189646 ) ) ( not ( = ?auto_189644 ?auto_189647 ) ) ( not ( = ?auto_189644 ?auto_189648 ) ) ( not ( = ?auto_189644 ?auto_189654 ) ) ( not ( = ?auto_189645 ?auto_189646 ) ) ( not ( = ?auto_189645 ?auto_189647 ) ) ( not ( = ?auto_189645 ?auto_189648 ) ) ( not ( = ?auto_189645 ?auto_189654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189646 ?auto_189647 ?auto_189648 )
      ( MAKE-6CRATE-VERIFY ?auto_189642 ?auto_189643 ?auto_189644 ?auto_189645 ?auto_189646 ?auto_189647 ?auto_189648 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189706 - SURFACE
      ?auto_189707 - SURFACE
      ?auto_189708 - SURFACE
      ?auto_189709 - SURFACE
      ?auto_189710 - SURFACE
      ?auto_189711 - SURFACE
      ?auto_189712 - SURFACE
    )
    :vars
    (
      ?auto_189713 - HOIST
      ?auto_189714 - PLACE
      ?auto_189717 - PLACE
      ?auto_189718 - HOIST
      ?auto_189715 - SURFACE
      ?auto_189716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189713 ?auto_189714 ) ( IS-CRATE ?auto_189712 ) ( not ( = ?auto_189711 ?auto_189712 ) ) ( not ( = ?auto_189710 ?auto_189711 ) ) ( not ( = ?auto_189710 ?auto_189712 ) ) ( not ( = ?auto_189717 ?auto_189714 ) ) ( HOIST-AT ?auto_189718 ?auto_189717 ) ( not ( = ?auto_189713 ?auto_189718 ) ) ( AVAILABLE ?auto_189718 ) ( SURFACE-AT ?auto_189712 ?auto_189717 ) ( ON ?auto_189712 ?auto_189715 ) ( CLEAR ?auto_189712 ) ( not ( = ?auto_189711 ?auto_189715 ) ) ( not ( = ?auto_189712 ?auto_189715 ) ) ( not ( = ?auto_189710 ?auto_189715 ) ) ( TRUCK-AT ?auto_189716 ?auto_189714 ) ( SURFACE-AT ?auto_189710 ?auto_189714 ) ( CLEAR ?auto_189710 ) ( IS-CRATE ?auto_189711 ) ( AVAILABLE ?auto_189713 ) ( IN ?auto_189711 ?auto_189716 ) ( ON ?auto_189707 ?auto_189706 ) ( ON ?auto_189708 ?auto_189707 ) ( ON ?auto_189709 ?auto_189708 ) ( ON ?auto_189710 ?auto_189709 ) ( not ( = ?auto_189706 ?auto_189707 ) ) ( not ( = ?auto_189706 ?auto_189708 ) ) ( not ( = ?auto_189706 ?auto_189709 ) ) ( not ( = ?auto_189706 ?auto_189710 ) ) ( not ( = ?auto_189706 ?auto_189711 ) ) ( not ( = ?auto_189706 ?auto_189712 ) ) ( not ( = ?auto_189706 ?auto_189715 ) ) ( not ( = ?auto_189707 ?auto_189708 ) ) ( not ( = ?auto_189707 ?auto_189709 ) ) ( not ( = ?auto_189707 ?auto_189710 ) ) ( not ( = ?auto_189707 ?auto_189711 ) ) ( not ( = ?auto_189707 ?auto_189712 ) ) ( not ( = ?auto_189707 ?auto_189715 ) ) ( not ( = ?auto_189708 ?auto_189709 ) ) ( not ( = ?auto_189708 ?auto_189710 ) ) ( not ( = ?auto_189708 ?auto_189711 ) ) ( not ( = ?auto_189708 ?auto_189712 ) ) ( not ( = ?auto_189708 ?auto_189715 ) ) ( not ( = ?auto_189709 ?auto_189710 ) ) ( not ( = ?auto_189709 ?auto_189711 ) ) ( not ( = ?auto_189709 ?auto_189712 ) ) ( not ( = ?auto_189709 ?auto_189715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189710 ?auto_189711 ?auto_189712 )
      ( MAKE-6CRATE-VERIFY ?auto_189706 ?auto_189707 ?auto_189708 ?auto_189709 ?auto_189710 ?auto_189711 ?auto_189712 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191630 - SURFACE
      ?auto_191631 - SURFACE
      ?auto_191632 - SURFACE
      ?auto_191633 - SURFACE
      ?auto_191634 - SURFACE
      ?auto_191635 - SURFACE
      ?auto_191636 - SURFACE
      ?auto_191637 - SURFACE
    )
    :vars
    (
      ?auto_191639 - HOIST
      ?auto_191638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191639 ?auto_191638 ) ( SURFACE-AT ?auto_191636 ?auto_191638 ) ( CLEAR ?auto_191636 ) ( LIFTING ?auto_191639 ?auto_191637 ) ( IS-CRATE ?auto_191637 ) ( not ( = ?auto_191636 ?auto_191637 ) ) ( ON ?auto_191631 ?auto_191630 ) ( ON ?auto_191632 ?auto_191631 ) ( ON ?auto_191633 ?auto_191632 ) ( ON ?auto_191634 ?auto_191633 ) ( ON ?auto_191635 ?auto_191634 ) ( ON ?auto_191636 ?auto_191635 ) ( not ( = ?auto_191630 ?auto_191631 ) ) ( not ( = ?auto_191630 ?auto_191632 ) ) ( not ( = ?auto_191630 ?auto_191633 ) ) ( not ( = ?auto_191630 ?auto_191634 ) ) ( not ( = ?auto_191630 ?auto_191635 ) ) ( not ( = ?auto_191630 ?auto_191636 ) ) ( not ( = ?auto_191630 ?auto_191637 ) ) ( not ( = ?auto_191631 ?auto_191632 ) ) ( not ( = ?auto_191631 ?auto_191633 ) ) ( not ( = ?auto_191631 ?auto_191634 ) ) ( not ( = ?auto_191631 ?auto_191635 ) ) ( not ( = ?auto_191631 ?auto_191636 ) ) ( not ( = ?auto_191631 ?auto_191637 ) ) ( not ( = ?auto_191632 ?auto_191633 ) ) ( not ( = ?auto_191632 ?auto_191634 ) ) ( not ( = ?auto_191632 ?auto_191635 ) ) ( not ( = ?auto_191632 ?auto_191636 ) ) ( not ( = ?auto_191632 ?auto_191637 ) ) ( not ( = ?auto_191633 ?auto_191634 ) ) ( not ( = ?auto_191633 ?auto_191635 ) ) ( not ( = ?auto_191633 ?auto_191636 ) ) ( not ( = ?auto_191633 ?auto_191637 ) ) ( not ( = ?auto_191634 ?auto_191635 ) ) ( not ( = ?auto_191634 ?auto_191636 ) ) ( not ( = ?auto_191634 ?auto_191637 ) ) ( not ( = ?auto_191635 ?auto_191636 ) ) ( not ( = ?auto_191635 ?auto_191637 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_191636 ?auto_191637 )
      ( MAKE-7CRATE-VERIFY ?auto_191630 ?auto_191631 ?auto_191632 ?auto_191633 ?auto_191634 ?auto_191635 ?auto_191636 ?auto_191637 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191685 - SURFACE
      ?auto_191686 - SURFACE
      ?auto_191687 - SURFACE
      ?auto_191688 - SURFACE
      ?auto_191689 - SURFACE
      ?auto_191690 - SURFACE
      ?auto_191691 - SURFACE
      ?auto_191692 - SURFACE
    )
    :vars
    (
      ?auto_191695 - HOIST
      ?auto_191693 - PLACE
      ?auto_191694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191695 ?auto_191693 ) ( SURFACE-AT ?auto_191691 ?auto_191693 ) ( CLEAR ?auto_191691 ) ( IS-CRATE ?auto_191692 ) ( not ( = ?auto_191691 ?auto_191692 ) ) ( TRUCK-AT ?auto_191694 ?auto_191693 ) ( AVAILABLE ?auto_191695 ) ( IN ?auto_191692 ?auto_191694 ) ( ON ?auto_191691 ?auto_191690 ) ( not ( = ?auto_191690 ?auto_191691 ) ) ( not ( = ?auto_191690 ?auto_191692 ) ) ( ON ?auto_191686 ?auto_191685 ) ( ON ?auto_191687 ?auto_191686 ) ( ON ?auto_191688 ?auto_191687 ) ( ON ?auto_191689 ?auto_191688 ) ( ON ?auto_191690 ?auto_191689 ) ( not ( = ?auto_191685 ?auto_191686 ) ) ( not ( = ?auto_191685 ?auto_191687 ) ) ( not ( = ?auto_191685 ?auto_191688 ) ) ( not ( = ?auto_191685 ?auto_191689 ) ) ( not ( = ?auto_191685 ?auto_191690 ) ) ( not ( = ?auto_191685 ?auto_191691 ) ) ( not ( = ?auto_191685 ?auto_191692 ) ) ( not ( = ?auto_191686 ?auto_191687 ) ) ( not ( = ?auto_191686 ?auto_191688 ) ) ( not ( = ?auto_191686 ?auto_191689 ) ) ( not ( = ?auto_191686 ?auto_191690 ) ) ( not ( = ?auto_191686 ?auto_191691 ) ) ( not ( = ?auto_191686 ?auto_191692 ) ) ( not ( = ?auto_191687 ?auto_191688 ) ) ( not ( = ?auto_191687 ?auto_191689 ) ) ( not ( = ?auto_191687 ?auto_191690 ) ) ( not ( = ?auto_191687 ?auto_191691 ) ) ( not ( = ?auto_191687 ?auto_191692 ) ) ( not ( = ?auto_191688 ?auto_191689 ) ) ( not ( = ?auto_191688 ?auto_191690 ) ) ( not ( = ?auto_191688 ?auto_191691 ) ) ( not ( = ?auto_191688 ?auto_191692 ) ) ( not ( = ?auto_191689 ?auto_191690 ) ) ( not ( = ?auto_191689 ?auto_191691 ) ) ( not ( = ?auto_191689 ?auto_191692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191690 ?auto_191691 ?auto_191692 )
      ( MAKE-7CRATE-VERIFY ?auto_191685 ?auto_191686 ?auto_191687 ?auto_191688 ?auto_191689 ?auto_191690 ?auto_191691 ?auto_191692 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191748 - SURFACE
      ?auto_191749 - SURFACE
      ?auto_191750 - SURFACE
      ?auto_191751 - SURFACE
      ?auto_191752 - SURFACE
      ?auto_191753 - SURFACE
      ?auto_191754 - SURFACE
      ?auto_191755 - SURFACE
    )
    :vars
    (
      ?auto_191758 - HOIST
      ?auto_191756 - PLACE
      ?auto_191759 - TRUCK
      ?auto_191757 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191758 ?auto_191756 ) ( SURFACE-AT ?auto_191754 ?auto_191756 ) ( CLEAR ?auto_191754 ) ( IS-CRATE ?auto_191755 ) ( not ( = ?auto_191754 ?auto_191755 ) ) ( AVAILABLE ?auto_191758 ) ( IN ?auto_191755 ?auto_191759 ) ( ON ?auto_191754 ?auto_191753 ) ( not ( = ?auto_191753 ?auto_191754 ) ) ( not ( = ?auto_191753 ?auto_191755 ) ) ( TRUCK-AT ?auto_191759 ?auto_191757 ) ( not ( = ?auto_191757 ?auto_191756 ) ) ( ON ?auto_191749 ?auto_191748 ) ( ON ?auto_191750 ?auto_191749 ) ( ON ?auto_191751 ?auto_191750 ) ( ON ?auto_191752 ?auto_191751 ) ( ON ?auto_191753 ?auto_191752 ) ( not ( = ?auto_191748 ?auto_191749 ) ) ( not ( = ?auto_191748 ?auto_191750 ) ) ( not ( = ?auto_191748 ?auto_191751 ) ) ( not ( = ?auto_191748 ?auto_191752 ) ) ( not ( = ?auto_191748 ?auto_191753 ) ) ( not ( = ?auto_191748 ?auto_191754 ) ) ( not ( = ?auto_191748 ?auto_191755 ) ) ( not ( = ?auto_191749 ?auto_191750 ) ) ( not ( = ?auto_191749 ?auto_191751 ) ) ( not ( = ?auto_191749 ?auto_191752 ) ) ( not ( = ?auto_191749 ?auto_191753 ) ) ( not ( = ?auto_191749 ?auto_191754 ) ) ( not ( = ?auto_191749 ?auto_191755 ) ) ( not ( = ?auto_191750 ?auto_191751 ) ) ( not ( = ?auto_191750 ?auto_191752 ) ) ( not ( = ?auto_191750 ?auto_191753 ) ) ( not ( = ?auto_191750 ?auto_191754 ) ) ( not ( = ?auto_191750 ?auto_191755 ) ) ( not ( = ?auto_191751 ?auto_191752 ) ) ( not ( = ?auto_191751 ?auto_191753 ) ) ( not ( = ?auto_191751 ?auto_191754 ) ) ( not ( = ?auto_191751 ?auto_191755 ) ) ( not ( = ?auto_191752 ?auto_191753 ) ) ( not ( = ?auto_191752 ?auto_191754 ) ) ( not ( = ?auto_191752 ?auto_191755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191753 ?auto_191754 ?auto_191755 )
      ( MAKE-7CRATE-VERIFY ?auto_191748 ?auto_191749 ?auto_191750 ?auto_191751 ?auto_191752 ?auto_191753 ?auto_191754 ?auto_191755 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191818 - SURFACE
      ?auto_191819 - SURFACE
      ?auto_191820 - SURFACE
      ?auto_191821 - SURFACE
      ?auto_191822 - SURFACE
      ?auto_191823 - SURFACE
      ?auto_191824 - SURFACE
      ?auto_191825 - SURFACE
    )
    :vars
    (
      ?auto_191830 - HOIST
      ?auto_191827 - PLACE
      ?auto_191826 - TRUCK
      ?auto_191829 - PLACE
      ?auto_191828 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_191830 ?auto_191827 ) ( SURFACE-AT ?auto_191824 ?auto_191827 ) ( CLEAR ?auto_191824 ) ( IS-CRATE ?auto_191825 ) ( not ( = ?auto_191824 ?auto_191825 ) ) ( AVAILABLE ?auto_191830 ) ( ON ?auto_191824 ?auto_191823 ) ( not ( = ?auto_191823 ?auto_191824 ) ) ( not ( = ?auto_191823 ?auto_191825 ) ) ( TRUCK-AT ?auto_191826 ?auto_191829 ) ( not ( = ?auto_191829 ?auto_191827 ) ) ( HOIST-AT ?auto_191828 ?auto_191829 ) ( LIFTING ?auto_191828 ?auto_191825 ) ( not ( = ?auto_191830 ?auto_191828 ) ) ( ON ?auto_191819 ?auto_191818 ) ( ON ?auto_191820 ?auto_191819 ) ( ON ?auto_191821 ?auto_191820 ) ( ON ?auto_191822 ?auto_191821 ) ( ON ?auto_191823 ?auto_191822 ) ( not ( = ?auto_191818 ?auto_191819 ) ) ( not ( = ?auto_191818 ?auto_191820 ) ) ( not ( = ?auto_191818 ?auto_191821 ) ) ( not ( = ?auto_191818 ?auto_191822 ) ) ( not ( = ?auto_191818 ?auto_191823 ) ) ( not ( = ?auto_191818 ?auto_191824 ) ) ( not ( = ?auto_191818 ?auto_191825 ) ) ( not ( = ?auto_191819 ?auto_191820 ) ) ( not ( = ?auto_191819 ?auto_191821 ) ) ( not ( = ?auto_191819 ?auto_191822 ) ) ( not ( = ?auto_191819 ?auto_191823 ) ) ( not ( = ?auto_191819 ?auto_191824 ) ) ( not ( = ?auto_191819 ?auto_191825 ) ) ( not ( = ?auto_191820 ?auto_191821 ) ) ( not ( = ?auto_191820 ?auto_191822 ) ) ( not ( = ?auto_191820 ?auto_191823 ) ) ( not ( = ?auto_191820 ?auto_191824 ) ) ( not ( = ?auto_191820 ?auto_191825 ) ) ( not ( = ?auto_191821 ?auto_191822 ) ) ( not ( = ?auto_191821 ?auto_191823 ) ) ( not ( = ?auto_191821 ?auto_191824 ) ) ( not ( = ?auto_191821 ?auto_191825 ) ) ( not ( = ?auto_191822 ?auto_191823 ) ) ( not ( = ?auto_191822 ?auto_191824 ) ) ( not ( = ?auto_191822 ?auto_191825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191823 ?auto_191824 ?auto_191825 )
      ( MAKE-7CRATE-VERIFY ?auto_191818 ?auto_191819 ?auto_191820 ?auto_191821 ?auto_191822 ?auto_191823 ?auto_191824 ?auto_191825 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191895 - SURFACE
      ?auto_191896 - SURFACE
      ?auto_191897 - SURFACE
      ?auto_191898 - SURFACE
      ?auto_191899 - SURFACE
      ?auto_191900 - SURFACE
      ?auto_191901 - SURFACE
      ?auto_191902 - SURFACE
    )
    :vars
    (
      ?auto_191903 - HOIST
      ?auto_191906 - PLACE
      ?auto_191905 - TRUCK
      ?auto_191907 - PLACE
      ?auto_191908 - HOIST
      ?auto_191904 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191903 ?auto_191906 ) ( SURFACE-AT ?auto_191901 ?auto_191906 ) ( CLEAR ?auto_191901 ) ( IS-CRATE ?auto_191902 ) ( not ( = ?auto_191901 ?auto_191902 ) ) ( AVAILABLE ?auto_191903 ) ( ON ?auto_191901 ?auto_191900 ) ( not ( = ?auto_191900 ?auto_191901 ) ) ( not ( = ?auto_191900 ?auto_191902 ) ) ( TRUCK-AT ?auto_191905 ?auto_191907 ) ( not ( = ?auto_191907 ?auto_191906 ) ) ( HOIST-AT ?auto_191908 ?auto_191907 ) ( not ( = ?auto_191903 ?auto_191908 ) ) ( AVAILABLE ?auto_191908 ) ( SURFACE-AT ?auto_191902 ?auto_191907 ) ( ON ?auto_191902 ?auto_191904 ) ( CLEAR ?auto_191902 ) ( not ( = ?auto_191901 ?auto_191904 ) ) ( not ( = ?auto_191902 ?auto_191904 ) ) ( not ( = ?auto_191900 ?auto_191904 ) ) ( ON ?auto_191896 ?auto_191895 ) ( ON ?auto_191897 ?auto_191896 ) ( ON ?auto_191898 ?auto_191897 ) ( ON ?auto_191899 ?auto_191898 ) ( ON ?auto_191900 ?auto_191899 ) ( not ( = ?auto_191895 ?auto_191896 ) ) ( not ( = ?auto_191895 ?auto_191897 ) ) ( not ( = ?auto_191895 ?auto_191898 ) ) ( not ( = ?auto_191895 ?auto_191899 ) ) ( not ( = ?auto_191895 ?auto_191900 ) ) ( not ( = ?auto_191895 ?auto_191901 ) ) ( not ( = ?auto_191895 ?auto_191902 ) ) ( not ( = ?auto_191895 ?auto_191904 ) ) ( not ( = ?auto_191896 ?auto_191897 ) ) ( not ( = ?auto_191896 ?auto_191898 ) ) ( not ( = ?auto_191896 ?auto_191899 ) ) ( not ( = ?auto_191896 ?auto_191900 ) ) ( not ( = ?auto_191896 ?auto_191901 ) ) ( not ( = ?auto_191896 ?auto_191902 ) ) ( not ( = ?auto_191896 ?auto_191904 ) ) ( not ( = ?auto_191897 ?auto_191898 ) ) ( not ( = ?auto_191897 ?auto_191899 ) ) ( not ( = ?auto_191897 ?auto_191900 ) ) ( not ( = ?auto_191897 ?auto_191901 ) ) ( not ( = ?auto_191897 ?auto_191902 ) ) ( not ( = ?auto_191897 ?auto_191904 ) ) ( not ( = ?auto_191898 ?auto_191899 ) ) ( not ( = ?auto_191898 ?auto_191900 ) ) ( not ( = ?auto_191898 ?auto_191901 ) ) ( not ( = ?auto_191898 ?auto_191902 ) ) ( not ( = ?auto_191898 ?auto_191904 ) ) ( not ( = ?auto_191899 ?auto_191900 ) ) ( not ( = ?auto_191899 ?auto_191901 ) ) ( not ( = ?auto_191899 ?auto_191902 ) ) ( not ( = ?auto_191899 ?auto_191904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191900 ?auto_191901 ?auto_191902 )
      ( MAKE-7CRATE-VERIFY ?auto_191895 ?auto_191896 ?auto_191897 ?auto_191898 ?auto_191899 ?auto_191900 ?auto_191901 ?auto_191902 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191973 - SURFACE
      ?auto_191974 - SURFACE
      ?auto_191975 - SURFACE
      ?auto_191976 - SURFACE
      ?auto_191977 - SURFACE
      ?auto_191978 - SURFACE
      ?auto_191979 - SURFACE
      ?auto_191980 - SURFACE
    )
    :vars
    (
      ?auto_191982 - HOIST
      ?auto_191981 - PLACE
      ?auto_191986 - PLACE
      ?auto_191983 - HOIST
      ?auto_191985 - SURFACE
      ?auto_191984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191982 ?auto_191981 ) ( SURFACE-AT ?auto_191979 ?auto_191981 ) ( CLEAR ?auto_191979 ) ( IS-CRATE ?auto_191980 ) ( not ( = ?auto_191979 ?auto_191980 ) ) ( AVAILABLE ?auto_191982 ) ( ON ?auto_191979 ?auto_191978 ) ( not ( = ?auto_191978 ?auto_191979 ) ) ( not ( = ?auto_191978 ?auto_191980 ) ) ( not ( = ?auto_191986 ?auto_191981 ) ) ( HOIST-AT ?auto_191983 ?auto_191986 ) ( not ( = ?auto_191982 ?auto_191983 ) ) ( AVAILABLE ?auto_191983 ) ( SURFACE-AT ?auto_191980 ?auto_191986 ) ( ON ?auto_191980 ?auto_191985 ) ( CLEAR ?auto_191980 ) ( not ( = ?auto_191979 ?auto_191985 ) ) ( not ( = ?auto_191980 ?auto_191985 ) ) ( not ( = ?auto_191978 ?auto_191985 ) ) ( TRUCK-AT ?auto_191984 ?auto_191981 ) ( ON ?auto_191974 ?auto_191973 ) ( ON ?auto_191975 ?auto_191974 ) ( ON ?auto_191976 ?auto_191975 ) ( ON ?auto_191977 ?auto_191976 ) ( ON ?auto_191978 ?auto_191977 ) ( not ( = ?auto_191973 ?auto_191974 ) ) ( not ( = ?auto_191973 ?auto_191975 ) ) ( not ( = ?auto_191973 ?auto_191976 ) ) ( not ( = ?auto_191973 ?auto_191977 ) ) ( not ( = ?auto_191973 ?auto_191978 ) ) ( not ( = ?auto_191973 ?auto_191979 ) ) ( not ( = ?auto_191973 ?auto_191980 ) ) ( not ( = ?auto_191973 ?auto_191985 ) ) ( not ( = ?auto_191974 ?auto_191975 ) ) ( not ( = ?auto_191974 ?auto_191976 ) ) ( not ( = ?auto_191974 ?auto_191977 ) ) ( not ( = ?auto_191974 ?auto_191978 ) ) ( not ( = ?auto_191974 ?auto_191979 ) ) ( not ( = ?auto_191974 ?auto_191980 ) ) ( not ( = ?auto_191974 ?auto_191985 ) ) ( not ( = ?auto_191975 ?auto_191976 ) ) ( not ( = ?auto_191975 ?auto_191977 ) ) ( not ( = ?auto_191975 ?auto_191978 ) ) ( not ( = ?auto_191975 ?auto_191979 ) ) ( not ( = ?auto_191975 ?auto_191980 ) ) ( not ( = ?auto_191975 ?auto_191985 ) ) ( not ( = ?auto_191976 ?auto_191977 ) ) ( not ( = ?auto_191976 ?auto_191978 ) ) ( not ( = ?auto_191976 ?auto_191979 ) ) ( not ( = ?auto_191976 ?auto_191980 ) ) ( not ( = ?auto_191976 ?auto_191985 ) ) ( not ( = ?auto_191977 ?auto_191978 ) ) ( not ( = ?auto_191977 ?auto_191979 ) ) ( not ( = ?auto_191977 ?auto_191980 ) ) ( not ( = ?auto_191977 ?auto_191985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191978 ?auto_191979 ?auto_191980 )
      ( MAKE-7CRATE-VERIFY ?auto_191973 ?auto_191974 ?auto_191975 ?auto_191976 ?auto_191977 ?auto_191978 ?auto_191979 ?auto_191980 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_192051 - SURFACE
      ?auto_192052 - SURFACE
      ?auto_192053 - SURFACE
      ?auto_192054 - SURFACE
      ?auto_192055 - SURFACE
      ?auto_192056 - SURFACE
      ?auto_192057 - SURFACE
      ?auto_192058 - SURFACE
    )
    :vars
    (
      ?auto_192059 - HOIST
      ?auto_192061 - PLACE
      ?auto_192064 - PLACE
      ?auto_192062 - HOIST
      ?auto_192060 - SURFACE
      ?auto_192063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_192059 ?auto_192061 ) ( IS-CRATE ?auto_192058 ) ( not ( = ?auto_192057 ?auto_192058 ) ) ( not ( = ?auto_192056 ?auto_192057 ) ) ( not ( = ?auto_192056 ?auto_192058 ) ) ( not ( = ?auto_192064 ?auto_192061 ) ) ( HOIST-AT ?auto_192062 ?auto_192064 ) ( not ( = ?auto_192059 ?auto_192062 ) ) ( AVAILABLE ?auto_192062 ) ( SURFACE-AT ?auto_192058 ?auto_192064 ) ( ON ?auto_192058 ?auto_192060 ) ( CLEAR ?auto_192058 ) ( not ( = ?auto_192057 ?auto_192060 ) ) ( not ( = ?auto_192058 ?auto_192060 ) ) ( not ( = ?auto_192056 ?auto_192060 ) ) ( TRUCK-AT ?auto_192063 ?auto_192061 ) ( SURFACE-AT ?auto_192056 ?auto_192061 ) ( CLEAR ?auto_192056 ) ( LIFTING ?auto_192059 ?auto_192057 ) ( IS-CRATE ?auto_192057 ) ( ON ?auto_192052 ?auto_192051 ) ( ON ?auto_192053 ?auto_192052 ) ( ON ?auto_192054 ?auto_192053 ) ( ON ?auto_192055 ?auto_192054 ) ( ON ?auto_192056 ?auto_192055 ) ( not ( = ?auto_192051 ?auto_192052 ) ) ( not ( = ?auto_192051 ?auto_192053 ) ) ( not ( = ?auto_192051 ?auto_192054 ) ) ( not ( = ?auto_192051 ?auto_192055 ) ) ( not ( = ?auto_192051 ?auto_192056 ) ) ( not ( = ?auto_192051 ?auto_192057 ) ) ( not ( = ?auto_192051 ?auto_192058 ) ) ( not ( = ?auto_192051 ?auto_192060 ) ) ( not ( = ?auto_192052 ?auto_192053 ) ) ( not ( = ?auto_192052 ?auto_192054 ) ) ( not ( = ?auto_192052 ?auto_192055 ) ) ( not ( = ?auto_192052 ?auto_192056 ) ) ( not ( = ?auto_192052 ?auto_192057 ) ) ( not ( = ?auto_192052 ?auto_192058 ) ) ( not ( = ?auto_192052 ?auto_192060 ) ) ( not ( = ?auto_192053 ?auto_192054 ) ) ( not ( = ?auto_192053 ?auto_192055 ) ) ( not ( = ?auto_192053 ?auto_192056 ) ) ( not ( = ?auto_192053 ?auto_192057 ) ) ( not ( = ?auto_192053 ?auto_192058 ) ) ( not ( = ?auto_192053 ?auto_192060 ) ) ( not ( = ?auto_192054 ?auto_192055 ) ) ( not ( = ?auto_192054 ?auto_192056 ) ) ( not ( = ?auto_192054 ?auto_192057 ) ) ( not ( = ?auto_192054 ?auto_192058 ) ) ( not ( = ?auto_192054 ?auto_192060 ) ) ( not ( = ?auto_192055 ?auto_192056 ) ) ( not ( = ?auto_192055 ?auto_192057 ) ) ( not ( = ?auto_192055 ?auto_192058 ) ) ( not ( = ?auto_192055 ?auto_192060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_192056 ?auto_192057 ?auto_192058 )
      ( MAKE-7CRATE-VERIFY ?auto_192051 ?auto_192052 ?auto_192053 ?auto_192054 ?auto_192055 ?auto_192056 ?auto_192057 ?auto_192058 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_192129 - SURFACE
      ?auto_192130 - SURFACE
      ?auto_192131 - SURFACE
      ?auto_192132 - SURFACE
      ?auto_192133 - SURFACE
      ?auto_192134 - SURFACE
      ?auto_192135 - SURFACE
      ?auto_192136 - SURFACE
    )
    :vars
    (
      ?auto_192137 - HOIST
      ?auto_192142 - PLACE
      ?auto_192139 - PLACE
      ?auto_192138 - HOIST
      ?auto_192141 - SURFACE
      ?auto_192140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_192137 ?auto_192142 ) ( IS-CRATE ?auto_192136 ) ( not ( = ?auto_192135 ?auto_192136 ) ) ( not ( = ?auto_192134 ?auto_192135 ) ) ( not ( = ?auto_192134 ?auto_192136 ) ) ( not ( = ?auto_192139 ?auto_192142 ) ) ( HOIST-AT ?auto_192138 ?auto_192139 ) ( not ( = ?auto_192137 ?auto_192138 ) ) ( AVAILABLE ?auto_192138 ) ( SURFACE-AT ?auto_192136 ?auto_192139 ) ( ON ?auto_192136 ?auto_192141 ) ( CLEAR ?auto_192136 ) ( not ( = ?auto_192135 ?auto_192141 ) ) ( not ( = ?auto_192136 ?auto_192141 ) ) ( not ( = ?auto_192134 ?auto_192141 ) ) ( TRUCK-AT ?auto_192140 ?auto_192142 ) ( SURFACE-AT ?auto_192134 ?auto_192142 ) ( CLEAR ?auto_192134 ) ( IS-CRATE ?auto_192135 ) ( AVAILABLE ?auto_192137 ) ( IN ?auto_192135 ?auto_192140 ) ( ON ?auto_192130 ?auto_192129 ) ( ON ?auto_192131 ?auto_192130 ) ( ON ?auto_192132 ?auto_192131 ) ( ON ?auto_192133 ?auto_192132 ) ( ON ?auto_192134 ?auto_192133 ) ( not ( = ?auto_192129 ?auto_192130 ) ) ( not ( = ?auto_192129 ?auto_192131 ) ) ( not ( = ?auto_192129 ?auto_192132 ) ) ( not ( = ?auto_192129 ?auto_192133 ) ) ( not ( = ?auto_192129 ?auto_192134 ) ) ( not ( = ?auto_192129 ?auto_192135 ) ) ( not ( = ?auto_192129 ?auto_192136 ) ) ( not ( = ?auto_192129 ?auto_192141 ) ) ( not ( = ?auto_192130 ?auto_192131 ) ) ( not ( = ?auto_192130 ?auto_192132 ) ) ( not ( = ?auto_192130 ?auto_192133 ) ) ( not ( = ?auto_192130 ?auto_192134 ) ) ( not ( = ?auto_192130 ?auto_192135 ) ) ( not ( = ?auto_192130 ?auto_192136 ) ) ( not ( = ?auto_192130 ?auto_192141 ) ) ( not ( = ?auto_192131 ?auto_192132 ) ) ( not ( = ?auto_192131 ?auto_192133 ) ) ( not ( = ?auto_192131 ?auto_192134 ) ) ( not ( = ?auto_192131 ?auto_192135 ) ) ( not ( = ?auto_192131 ?auto_192136 ) ) ( not ( = ?auto_192131 ?auto_192141 ) ) ( not ( = ?auto_192132 ?auto_192133 ) ) ( not ( = ?auto_192132 ?auto_192134 ) ) ( not ( = ?auto_192132 ?auto_192135 ) ) ( not ( = ?auto_192132 ?auto_192136 ) ) ( not ( = ?auto_192132 ?auto_192141 ) ) ( not ( = ?auto_192133 ?auto_192134 ) ) ( not ( = ?auto_192133 ?auto_192135 ) ) ( not ( = ?auto_192133 ?auto_192136 ) ) ( not ( = ?auto_192133 ?auto_192141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_192134 ?auto_192135 ?auto_192136 )
      ( MAKE-7CRATE-VERIFY ?auto_192129 ?auto_192130 ?auto_192131 ?auto_192132 ?auto_192133 ?auto_192134 ?auto_192135 ?auto_192136 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195000 - SURFACE
      ?auto_195001 - SURFACE
      ?auto_195002 - SURFACE
      ?auto_195003 - SURFACE
      ?auto_195004 - SURFACE
      ?auto_195005 - SURFACE
      ?auto_195006 - SURFACE
      ?auto_195007 - SURFACE
      ?auto_195008 - SURFACE
    )
    :vars
    (
      ?auto_195010 - HOIST
      ?auto_195009 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_195010 ?auto_195009 ) ( SURFACE-AT ?auto_195007 ?auto_195009 ) ( CLEAR ?auto_195007 ) ( LIFTING ?auto_195010 ?auto_195008 ) ( IS-CRATE ?auto_195008 ) ( not ( = ?auto_195007 ?auto_195008 ) ) ( ON ?auto_195001 ?auto_195000 ) ( ON ?auto_195002 ?auto_195001 ) ( ON ?auto_195003 ?auto_195002 ) ( ON ?auto_195004 ?auto_195003 ) ( ON ?auto_195005 ?auto_195004 ) ( ON ?auto_195006 ?auto_195005 ) ( ON ?auto_195007 ?auto_195006 ) ( not ( = ?auto_195000 ?auto_195001 ) ) ( not ( = ?auto_195000 ?auto_195002 ) ) ( not ( = ?auto_195000 ?auto_195003 ) ) ( not ( = ?auto_195000 ?auto_195004 ) ) ( not ( = ?auto_195000 ?auto_195005 ) ) ( not ( = ?auto_195000 ?auto_195006 ) ) ( not ( = ?auto_195000 ?auto_195007 ) ) ( not ( = ?auto_195000 ?auto_195008 ) ) ( not ( = ?auto_195001 ?auto_195002 ) ) ( not ( = ?auto_195001 ?auto_195003 ) ) ( not ( = ?auto_195001 ?auto_195004 ) ) ( not ( = ?auto_195001 ?auto_195005 ) ) ( not ( = ?auto_195001 ?auto_195006 ) ) ( not ( = ?auto_195001 ?auto_195007 ) ) ( not ( = ?auto_195001 ?auto_195008 ) ) ( not ( = ?auto_195002 ?auto_195003 ) ) ( not ( = ?auto_195002 ?auto_195004 ) ) ( not ( = ?auto_195002 ?auto_195005 ) ) ( not ( = ?auto_195002 ?auto_195006 ) ) ( not ( = ?auto_195002 ?auto_195007 ) ) ( not ( = ?auto_195002 ?auto_195008 ) ) ( not ( = ?auto_195003 ?auto_195004 ) ) ( not ( = ?auto_195003 ?auto_195005 ) ) ( not ( = ?auto_195003 ?auto_195006 ) ) ( not ( = ?auto_195003 ?auto_195007 ) ) ( not ( = ?auto_195003 ?auto_195008 ) ) ( not ( = ?auto_195004 ?auto_195005 ) ) ( not ( = ?auto_195004 ?auto_195006 ) ) ( not ( = ?auto_195004 ?auto_195007 ) ) ( not ( = ?auto_195004 ?auto_195008 ) ) ( not ( = ?auto_195005 ?auto_195006 ) ) ( not ( = ?auto_195005 ?auto_195007 ) ) ( not ( = ?auto_195005 ?auto_195008 ) ) ( not ( = ?auto_195006 ?auto_195007 ) ) ( not ( = ?auto_195006 ?auto_195008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_195007 ?auto_195008 )
      ( MAKE-8CRATE-VERIFY ?auto_195000 ?auto_195001 ?auto_195002 ?auto_195003 ?auto_195004 ?auto_195005 ?auto_195006 ?auto_195007 ?auto_195008 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195067 - SURFACE
      ?auto_195068 - SURFACE
      ?auto_195069 - SURFACE
      ?auto_195070 - SURFACE
      ?auto_195071 - SURFACE
      ?auto_195072 - SURFACE
      ?auto_195073 - SURFACE
      ?auto_195074 - SURFACE
      ?auto_195075 - SURFACE
    )
    :vars
    (
      ?auto_195078 - HOIST
      ?auto_195077 - PLACE
      ?auto_195076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195078 ?auto_195077 ) ( SURFACE-AT ?auto_195074 ?auto_195077 ) ( CLEAR ?auto_195074 ) ( IS-CRATE ?auto_195075 ) ( not ( = ?auto_195074 ?auto_195075 ) ) ( TRUCK-AT ?auto_195076 ?auto_195077 ) ( AVAILABLE ?auto_195078 ) ( IN ?auto_195075 ?auto_195076 ) ( ON ?auto_195074 ?auto_195073 ) ( not ( = ?auto_195073 ?auto_195074 ) ) ( not ( = ?auto_195073 ?auto_195075 ) ) ( ON ?auto_195068 ?auto_195067 ) ( ON ?auto_195069 ?auto_195068 ) ( ON ?auto_195070 ?auto_195069 ) ( ON ?auto_195071 ?auto_195070 ) ( ON ?auto_195072 ?auto_195071 ) ( ON ?auto_195073 ?auto_195072 ) ( not ( = ?auto_195067 ?auto_195068 ) ) ( not ( = ?auto_195067 ?auto_195069 ) ) ( not ( = ?auto_195067 ?auto_195070 ) ) ( not ( = ?auto_195067 ?auto_195071 ) ) ( not ( = ?auto_195067 ?auto_195072 ) ) ( not ( = ?auto_195067 ?auto_195073 ) ) ( not ( = ?auto_195067 ?auto_195074 ) ) ( not ( = ?auto_195067 ?auto_195075 ) ) ( not ( = ?auto_195068 ?auto_195069 ) ) ( not ( = ?auto_195068 ?auto_195070 ) ) ( not ( = ?auto_195068 ?auto_195071 ) ) ( not ( = ?auto_195068 ?auto_195072 ) ) ( not ( = ?auto_195068 ?auto_195073 ) ) ( not ( = ?auto_195068 ?auto_195074 ) ) ( not ( = ?auto_195068 ?auto_195075 ) ) ( not ( = ?auto_195069 ?auto_195070 ) ) ( not ( = ?auto_195069 ?auto_195071 ) ) ( not ( = ?auto_195069 ?auto_195072 ) ) ( not ( = ?auto_195069 ?auto_195073 ) ) ( not ( = ?auto_195069 ?auto_195074 ) ) ( not ( = ?auto_195069 ?auto_195075 ) ) ( not ( = ?auto_195070 ?auto_195071 ) ) ( not ( = ?auto_195070 ?auto_195072 ) ) ( not ( = ?auto_195070 ?auto_195073 ) ) ( not ( = ?auto_195070 ?auto_195074 ) ) ( not ( = ?auto_195070 ?auto_195075 ) ) ( not ( = ?auto_195071 ?auto_195072 ) ) ( not ( = ?auto_195071 ?auto_195073 ) ) ( not ( = ?auto_195071 ?auto_195074 ) ) ( not ( = ?auto_195071 ?auto_195075 ) ) ( not ( = ?auto_195072 ?auto_195073 ) ) ( not ( = ?auto_195072 ?auto_195074 ) ) ( not ( = ?auto_195072 ?auto_195075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195073 ?auto_195074 ?auto_195075 )
      ( MAKE-8CRATE-VERIFY ?auto_195067 ?auto_195068 ?auto_195069 ?auto_195070 ?auto_195071 ?auto_195072 ?auto_195073 ?auto_195074 ?auto_195075 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195143 - SURFACE
      ?auto_195144 - SURFACE
      ?auto_195145 - SURFACE
      ?auto_195146 - SURFACE
      ?auto_195147 - SURFACE
      ?auto_195148 - SURFACE
      ?auto_195149 - SURFACE
      ?auto_195150 - SURFACE
      ?auto_195151 - SURFACE
    )
    :vars
    (
      ?auto_195153 - HOIST
      ?auto_195155 - PLACE
      ?auto_195152 - TRUCK
      ?auto_195154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_195153 ?auto_195155 ) ( SURFACE-AT ?auto_195150 ?auto_195155 ) ( CLEAR ?auto_195150 ) ( IS-CRATE ?auto_195151 ) ( not ( = ?auto_195150 ?auto_195151 ) ) ( AVAILABLE ?auto_195153 ) ( IN ?auto_195151 ?auto_195152 ) ( ON ?auto_195150 ?auto_195149 ) ( not ( = ?auto_195149 ?auto_195150 ) ) ( not ( = ?auto_195149 ?auto_195151 ) ) ( TRUCK-AT ?auto_195152 ?auto_195154 ) ( not ( = ?auto_195154 ?auto_195155 ) ) ( ON ?auto_195144 ?auto_195143 ) ( ON ?auto_195145 ?auto_195144 ) ( ON ?auto_195146 ?auto_195145 ) ( ON ?auto_195147 ?auto_195146 ) ( ON ?auto_195148 ?auto_195147 ) ( ON ?auto_195149 ?auto_195148 ) ( not ( = ?auto_195143 ?auto_195144 ) ) ( not ( = ?auto_195143 ?auto_195145 ) ) ( not ( = ?auto_195143 ?auto_195146 ) ) ( not ( = ?auto_195143 ?auto_195147 ) ) ( not ( = ?auto_195143 ?auto_195148 ) ) ( not ( = ?auto_195143 ?auto_195149 ) ) ( not ( = ?auto_195143 ?auto_195150 ) ) ( not ( = ?auto_195143 ?auto_195151 ) ) ( not ( = ?auto_195144 ?auto_195145 ) ) ( not ( = ?auto_195144 ?auto_195146 ) ) ( not ( = ?auto_195144 ?auto_195147 ) ) ( not ( = ?auto_195144 ?auto_195148 ) ) ( not ( = ?auto_195144 ?auto_195149 ) ) ( not ( = ?auto_195144 ?auto_195150 ) ) ( not ( = ?auto_195144 ?auto_195151 ) ) ( not ( = ?auto_195145 ?auto_195146 ) ) ( not ( = ?auto_195145 ?auto_195147 ) ) ( not ( = ?auto_195145 ?auto_195148 ) ) ( not ( = ?auto_195145 ?auto_195149 ) ) ( not ( = ?auto_195145 ?auto_195150 ) ) ( not ( = ?auto_195145 ?auto_195151 ) ) ( not ( = ?auto_195146 ?auto_195147 ) ) ( not ( = ?auto_195146 ?auto_195148 ) ) ( not ( = ?auto_195146 ?auto_195149 ) ) ( not ( = ?auto_195146 ?auto_195150 ) ) ( not ( = ?auto_195146 ?auto_195151 ) ) ( not ( = ?auto_195147 ?auto_195148 ) ) ( not ( = ?auto_195147 ?auto_195149 ) ) ( not ( = ?auto_195147 ?auto_195150 ) ) ( not ( = ?auto_195147 ?auto_195151 ) ) ( not ( = ?auto_195148 ?auto_195149 ) ) ( not ( = ?auto_195148 ?auto_195150 ) ) ( not ( = ?auto_195148 ?auto_195151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195149 ?auto_195150 ?auto_195151 )
      ( MAKE-8CRATE-VERIFY ?auto_195143 ?auto_195144 ?auto_195145 ?auto_195146 ?auto_195147 ?auto_195148 ?auto_195149 ?auto_195150 ?auto_195151 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195227 - SURFACE
      ?auto_195228 - SURFACE
      ?auto_195229 - SURFACE
      ?auto_195230 - SURFACE
      ?auto_195231 - SURFACE
      ?auto_195232 - SURFACE
      ?auto_195233 - SURFACE
      ?auto_195234 - SURFACE
      ?auto_195235 - SURFACE
    )
    :vars
    (
      ?auto_195240 - HOIST
      ?auto_195236 - PLACE
      ?auto_195238 - TRUCK
      ?auto_195237 - PLACE
      ?auto_195239 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_195240 ?auto_195236 ) ( SURFACE-AT ?auto_195234 ?auto_195236 ) ( CLEAR ?auto_195234 ) ( IS-CRATE ?auto_195235 ) ( not ( = ?auto_195234 ?auto_195235 ) ) ( AVAILABLE ?auto_195240 ) ( ON ?auto_195234 ?auto_195233 ) ( not ( = ?auto_195233 ?auto_195234 ) ) ( not ( = ?auto_195233 ?auto_195235 ) ) ( TRUCK-AT ?auto_195238 ?auto_195237 ) ( not ( = ?auto_195237 ?auto_195236 ) ) ( HOIST-AT ?auto_195239 ?auto_195237 ) ( LIFTING ?auto_195239 ?auto_195235 ) ( not ( = ?auto_195240 ?auto_195239 ) ) ( ON ?auto_195228 ?auto_195227 ) ( ON ?auto_195229 ?auto_195228 ) ( ON ?auto_195230 ?auto_195229 ) ( ON ?auto_195231 ?auto_195230 ) ( ON ?auto_195232 ?auto_195231 ) ( ON ?auto_195233 ?auto_195232 ) ( not ( = ?auto_195227 ?auto_195228 ) ) ( not ( = ?auto_195227 ?auto_195229 ) ) ( not ( = ?auto_195227 ?auto_195230 ) ) ( not ( = ?auto_195227 ?auto_195231 ) ) ( not ( = ?auto_195227 ?auto_195232 ) ) ( not ( = ?auto_195227 ?auto_195233 ) ) ( not ( = ?auto_195227 ?auto_195234 ) ) ( not ( = ?auto_195227 ?auto_195235 ) ) ( not ( = ?auto_195228 ?auto_195229 ) ) ( not ( = ?auto_195228 ?auto_195230 ) ) ( not ( = ?auto_195228 ?auto_195231 ) ) ( not ( = ?auto_195228 ?auto_195232 ) ) ( not ( = ?auto_195228 ?auto_195233 ) ) ( not ( = ?auto_195228 ?auto_195234 ) ) ( not ( = ?auto_195228 ?auto_195235 ) ) ( not ( = ?auto_195229 ?auto_195230 ) ) ( not ( = ?auto_195229 ?auto_195231 ) ) ( not ( = ?auto_195229 ?auto_195232 ) ) ( not ( = ?auto_195229 ?auto_195233 ) ) ( not ( = ?auto_195229 ?auto_195234 ) ) ( not ( = ?auto_195229 ?auto_195235 ) ) ( not ( = ?auto_195230 ?auto_195231 ) ) ( not ( = ?auto_195230 ?auto_195232 ) ) ( not ( = ?auto_195230 ?auto_195233 ) ) ( not ( = ?auto_195230 ?auto_195234 ) ) ( not ( = ?auto_195230 ?auto_195235 ) ) ( not ( = ?auto_195231 ?auto_195232 ) ) ( not ( = ?auto_195231 ?auto_195233 ) ) ( not ( = ?auto_195231 ?auto_195234 ) ) ( not ( = ?auto_195231 ?auto_195235 ) ) ( not ( = ?auto_195232 ?auto_195233 ) ) ( not ( = ?auto_195232 ?auto_195234 ) ) ( not ( = ?auto_195232 ?auto_195235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195233 ?auto_195234 ?auto_195235 )
      ( MAKE-8CRATE-VERIFY ?auto_195227 ?auto_195228 ?auto_195229 ?auto_195230 ?auto_195231 ?auto_195232 ?auto_195233 ?auto_195234 ?auto_195235 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195319 - SURFACE
      ?auto_195320 - SURFACE
      ?auto_195321 - SURFACE
      ?auto_195322 - SURFACE
      ?auto_195323 - SURFACE
      ?auto_195324 - SURFACE
      ?auto_195325 - SURFACE
      ?auto_195326 - SURFACE
      ?auto_195327 - SURFACE
    )
    :vars
    (
      ?auto_195329 - HOIST
      ?auto_195328 - PLACE
      ?auto_195333 - TRUCK
      ?auto_195332 - PLACE
      ?auto_195331 - HOIST
      ?auto_195330 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_195329 ?auto_195328 ) ( SURFACE-AT ?auto_195326 ?auto_195328 ) ( CLEAR ?auto_195326 ) ( IS-CRATE ?auto_195327 ) ( not ( = ?auto_195326 ?auto_195327 ) ) ( AVAILABLE ?auto_195329 ) ( ON ?auto_195326 ?auto_195325 ) ( not ( = ?auto_195325 ?auto_195326 ) ) ( not ( = ?auto_195325 ?auto_195327 ) ) ( TRUCK-AT ?auto_195333 ?auto_195332 ) ( not ( = ?auto_195332 ?auto_195328 ) ) ( HOIST-AT ?auto_195331 ?auto_195332 ) ( not ( = ?auto_195329 ?auto_195331 ) ) ( AVAILABLE ?auto_195331 ) ( SURFACE-AT ?auto_195327 ?auto_195332 ) ( ON ?auto_195327 ?auto_195330 ) ( CLEAR ?auto_195327 ) ( not ( = ?auto_195326 ?auto_195330 ) ) ( not ( = ?auto_195327 ?auto_195330 ) ) ( not ( = ?auto_195325 ?auto_195330 ) ) ( ON ?auto_195320 ?auto_195319 ) ( ON ?auto_195321 ?auto_195320 ) ( ON ?auto_195322 ?auto_195321 ) ( ON ?auto_195323 ?auto_195322 ) ( ON ?auto_195324 ?auto_195323 ) ( ON ?auto_195325 ?auto_195324 ) ( not ( = ?auto_195319 ?auto_195320 ) ) ( not ( = ?auto_195319 ?auto_195321 ) ) ( not ( = ?auto_195319 ?auto_195322 ) ) ( not ( = ?auto_195319 ?auto_195323 ) ) ( not ( = ?auto_195319 ?auto_195324 ) ) ( not ( = ?auto_195319 ?auto_195325 ) ) ( not ( = ?auto_195319 ?auto_195326 ) ) ( not ( = ?auto_195319 ?auto_195327 ) ) ( not ( = ?auto_195319 ?auto_195330 ) ) ( not ( = ?auto_195320 ?auto_195321 ) ) ( not ( = ?auto_195320 ?auto_195322 ) ) ( not ( = ?auto_195320 ?auto_195323 ) ) ( not ( = ?auto_195320 ?auto_195324 ) ) ( not ( = ?auto_195320 ?auto_195325 ) ) ( not ( = ?auto_195320 ?auto_195326 ) ) ( not ( = ?auto_195320 ?auto_195327 ) ) ( not ( = ?auto_195320 ?auto_195330 ) ) ( not ( = ?auto_195321 ?auto_195322 ) ) ( not ( = ?auto_195321 ?auto_195323 ) ) ( not ( = ?auto_195321 ?auto_195324 ) ) ( not ( = ?auto_195321 ?auto_195325 ) ) ( not ( = ?auto_195321 ?auto_195326 ) ) ( not ( = ?auto_195321 ?auto_195327 ) ) ( not ( = ?auto_195321 ?auto_195330 ) ) ( not ( = ?auto_195322 ?auto_195323 ) ) ( not ( = ?auto_195322 ?auto_195324 ) ) ( not ( = ?auto_195322 ?auto_195325 ) ) ( not ( = ?auto_195322 ?auto_195326 ) ) ( not ( = ?auto_195322 ?auto_195327 ) ) ( not ( = ?auto_195322 ?auto_195330 ) ) ( not ( = ?auto_195323 ?auto_195324 ) ) ( not ( = ?auto_195323 ?auto_195325 ) ) ( not ( = ?auto_195323 ?auto_195326 ) ) ( not ( = ?auto_195323 ?auto_195327 ) ) ( not ( = ?auto_195323 ?auto_195330 ) ) ( not ( = ?auto_195324 ?auto_195325 ) ) ( not ( = ?auto_195324 ?auto_195326 ) ) ( not ( = ?auto_195324 ?auto_195327 ) ) ( not ( = ?auto_195324 ?auto_195330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195325 ?auto_195326 ?auto_195327 )
      ( MAKE-8CRATE-VERIFY ?auto_195319 ?auto_195320 ?auto_195321 ?auto_195322 ?auto_195323 ?auto_195324 ?auto_195325 ?auto_195326 ?auto_195327 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195412 - SURFACE
      ?auto_195413 - SURFACE
      ?auto_195414 - SURFACE
      ?auto_195415 - SURFACE
      ?auto_195416 - SURFACE
      ?auto_195417 - SURFACE
      ?auto_195418 - SURFACE
      ?auto_195419 - SURFACE
      ?auto_195420 - SURFACE
    )
    :vars
    (
      ?auto_195423 - HOIST
      ?auto_195425 - PLACE
      ?auto_195426 - PLACE
      ?auto_195422 - HOIST
      ?auto_195421 - SURFACE
      ?auto_195424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195423 ?auto_195425 ) ( SURFACE-AT ?auto_195419 ?auto_195425 ) ( CLEAR ?auto_195419 ) ( IS-CRATE ?auto_195420 ) ( not ( = ?auto_195419 ?auto_195420 ) ) ( AVAILABLE ?auto_195423 ) ( ON ?auto_195419 ?auto_195418 ) ( not ( = ?auto_195418 ?auto_195419 ) ) ( not ( = ?auto_195418 ?auto_195420 ) ) ( not ( = ?auto_195426 ?auto_195425 ) ) ( HOIST-AT ?auto_195422 ?auto_195426 ) ( not ( = ?auto_195423 ?auto_195422 ) ) ( AVAILABLE ?auto_195422 ) ( SURFACE-AT ?auto_195420 ?auto_195426 ) ( ON ?auto_195420 ?auto_195421 ) ( CLEAR ?auto_195420 ) ( not ( = ?auto_195419 ?auto_195421 ) ) ( not ( = ?auto_195420 ?auto_195421 ) ) ( not ( = ?auto_195418 ?auto_195421 ) ) ( TRUCK-AT ?auto_195424 ?auto_195425 ) ( ON ?auto_195413 ?auto_195412 ) ( ON ?auto_195414 ?auto_195413 ) ( ON ?auto_195415 ?auto_195414 ) ( ON ?auto_195416 ?auto_195415 ) ( ON ?auto_195417 ?auto_195416 ) ( ON ?auto_195418 ?auto_195417 ) ( not ( = ?auto_195412 ?auto_195413 ) ) ( not ( = ?auto_195412 ?auto_195414 ) ) ( not ( = ?auto_195412 ?auto_195415 ) ) ( not ( = ?auto_195412 ?auto_195416 ) ) ( not ( = ?auto_195412 ?auto_195417 ) ) ( not ( = ?auto_195412 ?auto_195418 ) ) ( not ( = ?auto_195412 ?auto_195419 ) ) ( not ( = ?auto_195412 ?auto_195420 ) ) ( not ( = ?auto_195412 ?auto_195421 ) ) ( not ( = ?auto_195413 ?auto_195414 ) ) ( not ( = ?auto_195413 ?auto_195415 ) ) ( not ( = ?auto_195413 ?auto_195416 ) ) ( not ( = ?auto_195413 ?auto_195417 ) ) ( not ( = ?auto_195413 ?auto_195418 ) ) ( not ( = ?auto_195413 ?auto_195419 ) ) ( not ( = ?auto_195413 ?auto_195420 ) ) ( not ( = ?auto_195413 ?auto_195421 ) ) ( not ( = ?auto_195414 ?auto_195415 ) ) ( not ( = ?auto_195414 ?auto_195416 ) ) ( not ( = ?auto_195414 ?auto_195417 ) ) ( not ( = ?auto_195414 ?auto_195418 ) ) ( not ( = ?auto_195414 ?auto_195419 ) ) ( not ( = ?auto_195414 ?auto_195420 ) ) ( not ( = ?auto_195414 ?auto_195421 ) ) ( not ( = ?auto_195415 ?auto_195416 ) ) ( not ( = ?auto_195415 ?auto_195417 ) ) ( not ( = ?auto_195415 ?auto_195418 ) ) ( not ( = ?auto_195415 ?auto_195419 ) ) ( not ( = ?auto_195415 ?auto_195420 ) ) ( not ( = ?auto_195415 ?auto_195421 ) ) ( not ( = ?auto_195416 ?auto_195417 ) ) ( not ( = ?auto_195416 ?auto_195418 ) ) ( not ( = ?auto_195416 ?auto_195419 ) ) ( not ( = ?auto_195416 ?auto_195420 ) ) ( not ( = ?auto_195416 ?auto_195421 ) ) ( not ( = ?auto_195417 ?auto_195418 ) ) ( not ( = ?auto_195417 ?auto_195419 ) ) ( not ( = ?auto_195417 ?auto_195420 ) ) ( not ( = ?auto_195417 ?auto_195421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195418 ?auto_195419 ?auto_195420 )
      ( MAKE-8CRATE-VERIFY ?auto_195412 ?auto_195413 ?auto_195414 ?auto_195415 ?auto_195416 ?auto_195417 ?auto_195418 ?auto_195419 ?auto_195420 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195505 - SURFACE
      ?auto_195506 - SURFACE
      ?auto_195507 - SURFACE
      ?auto_195508 - SURFACE
      ?auto_195509 - SURFACE
      ?auto_195510 - SURFACE
      ?auto_195511 - SURFACE
      ?auto_195512 - SURFACE
      ?auto_195513 - SURFACE
    )
    :vars
    (
      ?auto_195517 - HOIST
      ?auto_195515 - PLACE
      ?auto_195514 - PLACE
      ?auto_195516 - HOIST
      ?auto_195518 - SURFACE
      ?auto_195519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195517 ?auto_195515 ) ( IS-CRATE ?auto_195513 ) ( not ( = ?auto_195512 ?auto_195513 ) ) ( not ( = ?auto_195511 ?auto_195512 ) ) ( not ( = ?auto_195511 ?auto_195513 ) ) ( not ( = ?auto_195514 ?auto_195515 ) ) ( HOIST-AT ?auto_195516 ?auto_195514 ) ( not ( = ?auto_195517 ?auto_195516 ) ) ( AVAILABLE ?auto_195516 ) ( SURFACE-AT ?auto_195513 ?auto_195514 ) ( ON ?auto_195513 ?auto_195518 ) ( CLEAR ?auto_195513 ) ( not ( = ?auto_195512 ?auto_195518 ) ) ( not ( = ?auto_195513 ?auto_195518 ) ) ( not ( = ?auto_195511 ?auto_195518 ) ) ( TRUCK-AT ?auto_195519 ?auto_195515 ) ( SURFACE-AT ?auto_195511 ?auto_195515 ) ( CLEAR ?auto_195511 ) ( LIFTING ?auto_195517 ?auto_195512 ) ( IS-CRATE ?auto_195512 ) ( ON ?auto_195506 ?auto_195505 ) ( ON ?auto_195507 ?auto_195506 ) ( ON ?auto_195508 ?auto_195507 ) ( ON ?auto_195509 ?auto_195508 ) ( ON ?auto_195510 ?auto_195509 ) ( ON ?auto_195511 ?auto_195510 ) ( not ( = ?auto_195505 ?auto_195506 ) ) ( not ( = ?auto_195505 ?auto_195507 ) ) ( not ( = ?auto_195505 ?auto_195508 ) ) ( not ( = ?auto_195505 ?auto_195509 ) ) ( not ( = ?auto_195505 ?auto_195510 ) ) ( not ( = ?auto_195505 ?auto_195511 ) ) ( not ( = ?auto_195505 ?auto_195512 ) ) ( not ( = ?auto_195505 ?auto_195513 ) ) ( not ( = ?auto_195505 ?auto_195518 ) ) ( not ( = ?auto_195506 ?auto_195507 ) ) ( not ( = ?auto_195506 ?auto_195508 ) ) ( not ( = ?auto_195506 ?auto_195509 ) ) ( not ( = ?auto_195506 ?auto_195510 ) ) ( not ( = ?auto_195506 ?auto_195511 ) ) ( not ( = ?auto_195506 ?auto_195512 ) ) ( not ( = ?auto_195506 ?auto_195513 ) ) ( not ( = ?auto_195506 ?auto_195518 ) ) ( not ( = ?auto_195507 ?auto_195508 ) ) ( not ( = ?auto_195507 ?auto_195509 ) ) ( not ( = ?auto_195507 ?auto_195510 ) ) ( not ( = ?auto_195507 ?auto_195511 ) ) ( not ( = ?auto_195507 ?auto_195512 ) ) ( not ( = ?auto_195507 ?auto_195513 ) ) ( not ( = ?auto_195507 ?auto_195518 ) ) ( not ( = ?auto_195508 ?auto_195509 ) ) ( not ( = ?auto_195508 ?auto_195510 ) ) ( not ( = ?auto_195508 ?auto_195511 ) ) ( not ( = ?auto_195508 ?auto_195512 ) ) ( not ( = ?auto_195508 ?auto_195513 ) ) ( not ( = ?auto_195508 ?auto_195518 ) ) ( not ( = ?auto_195509 ?auto_195510 ) ) ( not ( = ?auto_195509 ?auto_195511 ) ) ( not ( = ?auto_195509 ?auto_195512 ) ) ( not ( = ?auto_195509 ?auto_195513 ) ) ( not ( = ?auto_195509 ?auto_195518 ) ) ( not ( = ?auto_195510 ?auto_195511 ) ) ( not ( = ?auto_195510 ?auto_195512 ) ) ( not ( = ?auto_195510 ?auto_195513 ) ) ( not ( = ?auto_195510 ?auto_195518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195511 ?auto_195512 ?auto_195513 )
      ( MAKE-8CRATE-VERIFY ?auto_195505 ?auto_195506 ?auto_195507 ?auto_195508 ?auto_195509 ?auto_195510 ?auto_195511 ?auto_195512 ?auto_195513 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195598 - SURFACE
      ?auto_195599 - SURFACE
      ?auto_195600 - SURFACE
      ?auto_195601 - SURFACE
      ?auto_195602 - SURFACE
      ?auto_195603 - SURFACE
      ?auto_195604 - SURFACE
      ?auto_195605 - SURFACE
      ?auto_195606 - SURFACE
    )
    :vars
    (
      ?auto_195610 - HOIST
      ?auto_195612 - PLACE
      ?auto_195607 - PLACE
      ?auto_195609 - HOIST
      ?auto_195608 - SURFACE
      ?auto_195611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195610 ?auto_195612 ) ( IS-CRATE ?auto_195606 ) ( not ( = ?auto_195605 ?auto_195606 ) ) ( not ( = ?auto_195604 ?auto_195605 ) ) ( not ( = ?auto_195604 ?auto_195606 ) ) ( not ( = ?auto_195607 ?auto_195612 ) ) ( HOIST-AT ?auto_195609 ?auto_195607 ) ( not ( = ?auto_195610 ?auto_195609 ) ) ( AVAILABLE ?auto_195609 ) ( SURFACE-AT ?auto_195606 ?auto_195607 ) ( ON ?auto_195606 ?auto_195608 ) ( CLEAR ?auto_195606 ) ( not ( = ?auto_195605 ?auto_195608 ) ) ( not ( = ?auto_195606 ?auto_195608 ) ) ( not ( = ?auto_195604 ?auto_195608 ) ) ( TRUCK-AT ?auto_195611 ?auto_195612 ) ( SURFACE-AT ?auto_195604 ?auto_195612 ) ( CLEAR ?auto_195604 ) ( IS-CRATE ?auto_195605 ) ( AVAILABLE ?auto_195610 ) ( IN ?auto_195605 ?auto_195611 ) ( ON ?auto_195599 ?auto_195598 ) ( ON ?auto_195600 ?auto_195599 ) ( ON ?auto_195601 ?auto_195600 ) ( ON ?auto_195602 ?auto_195601 ) ( ON ?auto_195603 ?auto_195602 ) ( ON ?auto_195604 ?auto_195603 ) ( not ( = ?auto_195598 ?auto_195599 ) ) ( not ( = ?auto_195598 ?auto_195600 ) ) ( not ( = ?auto_195598 ?auto_195601 ) ) ( not ( = ?auto_195598 ?auto_195602 ) ) ( not ( = ?auto_195598 ?auto_195603 ) ) ( not ( = ?auto_195598 ?auto_195604 ) ) ( not ( = ?auto_195598 ?auto_195605 ) ) ( not ( = ?auto_195598 ?auto_195606 ) ) ( not ( = ?auto_195598 ?auto_195608 ) ) ( not ( = ?auto_195599 ?auto_195600 ) ) ( not ( = ?auto_195599 ?auto_195601 ) ) ( not ( = ?auto_195599 ?auto_195602 ) ) ( not ( = ?auto_195599 ?auto_195603 ) ) ( not ( = ?auto_195599 ?auto_195604 ) ) ( not ( = ?auto_195599 ?auto_195605 ) ) ( not ( = ?auto_195599 ?auto_195606 ) ) ( not ( = ?auto_195599 ?auto_195608 ) ) ( not ( = ?auto_195600 ?auto_195601 ) ) ( not ( = ?auto_195600 ?auto_195602 ) ) ( not ( = ?auto_195600 ?auto_195603 ) ) ( not ( = ?auto_195600 ?auto_195604 ) ) ( not ( = ?auto_195600 ?auto_195605 ) ) ( not ( = ?auto_195600 ?auto_195606 ) ) ( not ( = ?auto_195600 ?auto_195608 ) ) ( not ( = ?auto_195601 ?auto_195602 ) ) ( not ( = ?auto_195601 ?auto_195603 ) ) ( not ( = ?auto_195601 ?auto_195604 ) ) ( not ( = ?auto_195601 ?auto_195605 ) ) ( not ( = ?auto_195601 ?auto_195606 ) ) ( not ( = ?auto_195601 ?auto_195608 ) ) ( not ( = ?auto_195602 ?auto_195603 ) ) ( not ( = ?auto_195602 ?auto_195604 ) ) ( not ( = ?auto_195602 ?auto_195605 ) ) ( not ( = ?auto_195602 ?auto_195606 ) ) ( not ( = ?auto_195602 ?auto_195608 ) ) ( not ( = ?auto_195603 ?auto_195604 ) ) ( not ( = ?auto_195603 ?auto_195605 ) ) ( not ( = ?auto_195603 ?auto_195606 ) ) ( not ( = ?auto_195603 ?auto_195608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195604 ?auto_195605 ?auto_195606 )
      ( MAKE-8CRATE-VERIFY ?auto_195598 ?auto_195599 ?auto_195600 ?auto_195601 ?auto_195602 ?auto_195603 ?auto_195604 ?auto_195605 ?auto_195606 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199637 - SURFACE
      ?auto_199638 - SURFACE
      ?auto_199639 - SURFACE
      ?auto_199640 - SURFACE
      ?auto_199641 - SURFACE
      ?auto_199642 - SURFACE
      ?auto_199643 - SURFACE
      ?auto_199644 - SURFACE
      ?auto_199645 - SURFACE
      ?auto_199646 - SURFACE
    )
    :vars
    (
      ?auto_199647 - HOIST
      ?auto_199648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_199647 ?auto_199648 ) ( SURFACE-AT ?auto_199645 ?auto_199648 ) ( CLEAR ?auto_199645 ) ( LIFTING ?auto_199647 ?auto_199646 ) ( IS-CRATE ?auto_199646 ) ( not ( = ?auto_199645 ?auto_199646 ) ) ( ON ?auto_199638 ?auto_199637 ) ( ON ?auto_199639 ?auto_199638 ) ( ON ?auto_199640 ?auto_199639 ) ( ON ?auto_199641 ?auto_199640 ) ( ON ?auto_199642 ?auto_199641 ) ( ON ?auto_199643 ?auto_199642 ) ( ON ?auto_199644 ?auto_199643 ) ( ON ?auto_199645 ?auto_199644 ) ( not ( = ?auto_199637 ?auto_199638 ) ) ( not ( = ?auto_199637 ?auto_199639 ) ) ( not ( = ?auto_199637 ?auto_199640 ) ) ( not ( = ?auto_199637 ?auto_199641 ) ) ( not ( = ?auto_199637 ?auto_199642 ) ) ( not ( = ?auto_199637 ?auto_199643 ) ) ( not ( = ?auto_199637 ?auto_199644 ) ) ( not ( = ?auto_199637 ?auto_199645 ) ) ( not ( = ?auto_199637 ?auto_199646 ) ) ( not ( = ?auto_199638 ?auto_199639 ) ) ( not ( = ?auto_199638 ?auto_199640 ) ) ( not ( = ?auto_199638 ?auto_199641 ) ) ( not ( = ?auto_199638 ?auto_199642 ) ) ( not ( = ?auto_199638 ?auto_199643 ) ) ( not ( = ?auto_199638 ?auto_199644 ) ) ( not ( = ?auto_199638 ?auto_199645 ) ) ( not ( = ?auto_199638 ?auto_199646 ) ) ( not ( = ?auto_199639 ?auto_199640 ) ) ( not ( = ?auto_199639 ?auto_199641 ) ) ( not ( = ?auto_199639 ?auto_199642 ) ) ( not ( = ?auto_199639 ?auto_199643 ) ) ( not ( = ?auto_199639 ?auto_199644 ) ) ( not ( = ?auto_199639 ?auto_199645 ) ) ( not ( = ?auto_199639 ?auto_199646 ) ) ( not ( = ?auto_199640 ?auto_199641 ) ) ( not ( = ?auto_199640 ?auto_199642 ) ) ( not ( = ?auto_199640 ?auto_199643 ) ) ( not ( = ?auto_199640 ?auto_199644 ) ) ( not ( = ?auto_199640 ?auto_199645 ) ) ( not ( = ?auto_199640 ?auto_199646 ) ) ( not ( = ?auto_199641 ?auto_199642 ) ) ( not ( = ?auto_199641 ?auto_199643 ) ) ( not ( = ?auto_199641 ?auto_199644 ) ) ( not ( = ?auto_199641 ?auto_199645 ) ) ( not ( = ?auto_199641 ?auto_199646 ) ) ( not ( = ?auto_199642 ?auto_199643 ) ) ( not ( = ?auto_199642 ?auto_199644 ) ) ( not ( = ?auto_199642 ?auto_199645 ) ) ( not ( = ?auto_199642 ?auto_199646 ) ) ( not ( = ?auto_199643 ?auto_199644 ) ) ( not ( = ?auto_199643 ?auto_199645 ) ) ( not ( = ?auto_199643 ?auto_199646 ) ) ( not ( = ?auto_199644 ?auto_199645 ) ) ( not ( = ?auto_199644 ?auto_199646 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_199645 ?auto_199646 )
      ( MAKE-9CRATE-VERIFY ?auto_199637 ?auto_199638 ?auto_199639 ?auto_199640 ?auto_199641 ?auto_199642 ?auto_199643 ?auto_199644 ?auto_199645 ?auto_199646 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199717 - SURFACE
      ?auto_199718 - SURFACE
      ?auto_199719 - SURFACE
      ?auto_199720 - SURFACE
      ?auto_199721 - SURFACE
      ?auto_199722 - SURFACE
      ?auto_199723 - SURFACE
      ?auto_199724 - SURFACE
      ?auto_199725 - SURFACE
      ?auto_199726 - SURFACE
    )
    :vars
    (
      ?auto_199727 - HOIST
      ?auto_199729 - PLACE
      ?auto_199728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_199727 ?auto_199729 ) ( SURFACE-AT ?auto_199725 ?auto_199729 ) ( CLEAR ?auto_199725 ) ( IS-CRATE ?auto_199726 ) ( not ( = ?auto_199725 ?auto_199726 ) ) ( TRUCK-AT ?auto_199728 ?auto_199729 ) ( AVAILABLE ?auto_199727 ) ( IN ?auto_199726 ?auto_199728 ) ( ON ?auto_199725 ?auto_199724 ) ( not ( = ?auto_199724 ?auto_199725 ) ) ( not ( = ?auto_199724 ?auto_199726 ) ) ( ON ?auto_199718 ?auto_199717 ) ( ON ?auto_199719 ?auto_199718 ) ( ON ?auto_199720 ?auto_199719 ) ( ON ?auto_199721 ?auto_199720 ) ( ON ?auto_199722 ?auto_199721 ) ( ON ?auto_199723 ?auto_199722 ) ( ON ?auto_199724 ?auto_199723 ) ( not ( = ?auto_199717 ?auto_199718 ) ) ( not ( = ?auto_199717 ?auto_199719 ) ) ( not ( = ?auto_199717 ?auto_199720 ) ) ( not ( = ?auto_199717 ?auto_199721 ) ) ( not ( = ?auto_199717 ?auto_199722 ) ) ( not ( = ?auto_199717 ?auto_199723 ) ) ( not ( = ?auto_199717 ?auto_199724 ) ) ( not ( = ?auto_199717 ?auto_199725 ) ) ( not ( = ?auto_199717 ?auto_199726 ) ) ( not ( = ?auto_199718 ?auto_199719 ) ) ( not ( = ?auto_199718 ?auto_199720 ) ) ( not ( = ?auto_199718 ?auto_199721 ) ) ( not ( = ?auto_199718 ?auto_199722 ) ) ( not ( = ?auto_199718 ?auto_199723 ) ) ( not ( = ?auto_199718 ?auto_199724 ) ) ( not ( = ?auto_199718 ?auto_199725 ) ) ( not ( = ?auto_199718 ?auto_199726 ) ) ( not ( = ?auto_199719 ?auto_199720 ) ) ( not ( = ?auto_199719 ?auto_199721 ) ) ( not ( = ?auto_199719 ?auto_199722 ) ) ( not ( = ?auto_199719 ?auto_199723 ) ) ( not ( = ?auto_199719 ?auto_199724 ) ) ( not ( = ?auto_199719 ?auto_199725 ) ) ( not ( = ?auto_199719 ?auto_199726 ) ) ( not ( = ?auto_199720 ?auto_199721 ) ) ( not ( = ?auto_199720 ?auto_199722 ) ) ( not ( = ?auto_199720 ?auto_199723 ) ) ( not ( = ?auto_199720 ?auto_199724 ) ) ( not ( = ?auto_199720 ?auto_199725 ) ) ( not ( = ?auto_199720 ?auto_199726 ) ) ( not ( = ?auto_199721 ?auto_199722 ) ) ( not ( = ?auto_199721 ?auto_199723 ) ) ( not ( = ?auto_199721 ?auto_199724 ) ) ( not ( = ?auto_199721 ?auto_199725 ) ) ( not ( = ?auto_199721 ?auto_199726 ) ) ( not ( = ?auto_199722 ?auto_199723 ) ) ( not ( = ?auto_199722 ?auto_199724 ) ) ( not ( = ?auto_199722 ?auto_199725 ) ) ( not ( = ?auto_199722 ?auto_199726 ) ) ( not ( = ?auto_199723 ?auto_199724 ) ) ( not ( = ?auto_199723 ?auto_199725 ) ) ( not ( = ?auto_199723 ?auto_199726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199724 ?auto_199725 ?auto_199726 )
      ( MAKE-9CRATE-VERIFY ?auto_199717 ?auto_199718 ?auto_199719 ?auto_199720 ?auto_199721 ?auto_199722 ?auto_199723 ?auto_199724 ?auto_199725 ?auto_199726 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199807 - SURFACE
      ?auto_199808 - SURFACE
      ?auto_199809 - SURFACE
      ?auto_199810 - SURFACE
      ?auto_199811 - SURFACE
      ?auto_199812 - SURFACE
      ?auto_199813 - SURFACE
      ?auto_199814 - SURFACE
      ?auto_199815 - SURFACE
      ?auto_199816 - SURFACE
    )
    :vars
    (
      ?auto_199818 - HOIST
      ?auto_199820 - PLACE
      ?auto_199817 - TRUCK
      ?auto_199819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_199818 ?auto_199820 ) ( SURFACE-AT ?auto_199815 ?auto_199820 ) ( CLEAR ?auto_199815 ) ( IS-CRATE ?auto_199816 ) ( not ( = ?auto_199815 ?auto_199816 ) ) ( AVAILABLE ?auto_199818 ) ( IN ?auto_199816 ?auto_199817 ) ( ON ?auto_199815 ?auto_199814 ) ( not ( = ?auto_199814 ?auto_199815 ) ) ( not ( = ?auto_199814 ?auto_199816 ) ) ( TRUCK-AT ?auto_199817 ?auto_199819 ) ( not ( = ?auto_199819 ?auto_199820 ) ) ( ON ?auto_199808 ?auto_199807 ) ( ON ?auto_199809 ?auto_199808 ) ( ON ?auto_199810 ?auto_199809 ) ( ON ?auto_199811 ?auto_199810 ) ( ON ?auto_199812 ?auto_199811 ) ( ON ?auto_199813 ?auto_199812 ) ( ON ?auto_199814 ?auto_199813 ) ( not ( = ?auto_199807 ?auto_199808 ) ) ( not ( = ?auto_199807 ?auto_199809 ) ) ( not ( = ?auto_199807 ?auto_199810 ) ) ( not ( = ?auto_199807 ?auto_199811 ) ) ( not ( = ?auto_199807 ?auto_199812 ) ) ( not ( = ?auto_199807 ?auto_199813 ) ) ( not ( = ?auto_199807 ?auto_199814 ) ) ( not ( = ?auto_199807 ?auto_199815 ) ) ( not ( = ?auto_199807 ?auto_199816 ) ) ( not ( = ?auto_199808 ?auto_199809 ) ) ( not ( = ?auto_199808 ?auto_199810 ) ) ( not ( = ?auto_199808 ?auto_199811 ) ) ( not ( = ?auto_199808 ?auto_199812 ) ) ( not ( = ?auto_199808 ?auto_199813 ) ) ( not ( = ?auto_199808 ?auto_199814 ) ) ( not ( = ?auto_199808 ?auto_199815 ) ) ( not ( = ?auto_199808 ?auto_199816 ) ) ( not ( = ?auto_199809 ?auto_199810 ) ) ( not ( = ?auto_199809 ?auto_199811 ) ) ( not ( = ?auto_199809 ?auto_199812 ) ) ( not ( = ?auto_199809 ?auto_199813 ) ) ( not ( = ?auto_199809 ?auto_199814 ) ) ( not ( = ?auto_199809 ?auto_199815 ) ) ( not ( = ?auto_199809 ?auto_199816 ) ) ( not ( = ?auto_199810 ?auto_199811 ) ) ( not ( = ?auto_199810 ?auto_199812 ) ) ( not ( = ?auto_199810 ?auto_199813 ) ) ( not ( = ?auto_199810 ?auto_199814 ) ) ( not ( = ?auto_199810 ?auto_199815 ) ) ( not ( = ?auto_199810 ?auto_199816 ) ) ( not ( = ?auto_199811 ?auto_199812 ) ) ( not ( = ?auto_199811 ?auto_199813 ) ) ( not ( = ?auto_199811 ?auto_199814 ) ) ( not ( = ?auto_199811 ?auto_199815 ) ) ( not ( = ?auto_199811 ?auto_199816 ) ) ( not ( = ?auto_199812 ?auto_199813 ) ) ( not ( = ?auto_199812 ?auto_199814 ) ) ( not ( = ?auto_199812 ?auto_199815 ) ) ( not ( = ?auto_199812 ?auto_199816 ) ) ( not ( = ?auto_199813 ?auto_199814 ) ) ( not ( = ?auto_199813 ?auto_199815 ) ) ( not ( = ?auto_199813 ?auto_199816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199814 ?auto_199815 ?auto_199816 )
      ( MAKE-9CRATE-VERIFY ?auto_199807 ?auto_199808 ?auto_199809 ?auto_199810 ?auto_199811 ?auto_199812 ?auto_199813 ?auto_199814 ?auto_199815 ?auto_199816 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199906 - SURFACE
      ?auto_199907 - SURFACE
      ?auto_199908 - SURFACE
      ?auto_199909 - SURFACE
      ?auto_199910 - SURFACE
      ?auto_199911 - SURFACE
      ?auto_199912 - SURFACE
      ?auto_199913 - SURFACE
      ?auto_199914 - SURFACE
      ?auto_199915 - SURFACE
    )
    :vars
    (
      ?auto_199916 - HOIST
      ?auto_199918 - PLACE
      ?auto_199917 - TRUCK
      ?auto_199920 - PLACE
      ?auto_199919 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_199916 ?auto_199918 ) ( SURFACE-AT ?auto_199914 ?auto_199918 ) ( CLEAR ?auto_199914 ) ( IS-CRATE ?auto_199915 ) ( not ( = ?auto_199914 ?auto_199915 ) ) ( AVAILABLE ?auto_199916 ) ( ON ?auto_199914 ?auto_199913 ) ( not ( = ?auto_199913 ?auto_199914 ) ) ( not ( = ?auto_199913 ?auto_199915 ) ) ( TRUCK-AT ?auto_199917 ?auto_199920 ) ( not ( = ?auto_199920 ?auto_199918 ) ) ( HOIST-AT ?auto_199919 ?auto_199920 ) ( LIFTING ?auto_199919 ?auto_199915 ) ( not ( = ?auto_199916 ?auto_199919 ) ) ( ON ?auto_199907 ?auto_199906 ) ( ON ?auto_199908 ?auto_199907 ) ( ON ?auto_199909 ?auto_199908 ) ( ON ?auto_199910 ?auto_199909 ) ( ON ?auto_199911 ?auto_199910 ) ( ON ?auto_199912 ?auto_199911 ) ( ON ?auto_199913 ?auto_199912 ) ( not ( = ?auto_199906 ?auto_199907 ) ) ( not ( = ?auto_199906 ?auto_199908 ) ) ( not ( = ?auto_199906 ?auto_199909 ) ) ( not ( = ?auto_199906 ?auto_199910 ) ) ( not ( = ?auto_199906 ?auto_199911 ) ) ( not ( = ?auto_199906 ?auto_199912 ) ) ( not ( = ?auto_199906 ?auto_199913 ) ) ( not ( = ?auto_199906 ?auto_199914 ) ) ( not ( = ?auto_199906 ?auto_199915 ) ) ( not ( = ?auto_199907 ?auto_199908 ) ) ( not ( = ?auto_199907 ?auto_199909 ) ) ( not ( = ?auto_199907 ?auto_199910 ) ) ( not ( = ?auto_199907 ?auto_199911 ) ) ( not ( = ?auto_199907 ?auto_199912 ) ) ( not ( = ?auto_199907 ?auto_199913 ) ) ( not ( = ?auto_199907 ?auto_199914 ) ) ( not ( = ?auto_199907 ?auto_199915 ) ) ( not ( = ?auto_199908 ?auto_199909 ) ) ( not ( = ?auto_199908 ?auto_199910 ) ) ( not ( = ?auto_199908 ?auto_199911 ) ) ( not ( = ?auto_199908 ?auto_199912 ) ) ( not ( = ?auto_199908 ?auto_199913 ) ) ( not ( = ?auto_199908 ?auto_199914 ) ) ( not ( = ?auto_199908 ?auto_199915 ) ) ( not ( = ?auto_199909 ?auto_199910 ) ) ( not ( = ?auto_199909 ?auto_199911 ) ) ( not ( = ?auto_199909 ?auto_199912 ) ) ( not ( = ?auto_199909 ?auto_199913 ) ) ( not ( = ?auto_199909 ?auto_199914 ) ) ( not ( = ?auto_199909 ?auto_199915 ) ) ( not ( = ?auto_199910 ?auto_199911 ) ) ( not ( = ?auto_199910 ?auto_199912 ) ) ( not ( = ?auto_199910 ?auto_199913 ) ) ( not ( = ?auto_199910 ?auto_199914 ) ) ( not ( = ?auto_199910 ?auto_199915 ) ) ( not ( = ?auto_199911 ?auto_199912 ) ) ( not ( = ?auto_199911 ?auto_199913 ) ) ( not ( = ?auto_199911 ?auto_199914 ) ) ( not ( = ?auto_199911 ?auto_199915 ) ) ( not ( = ?auto_199912 ?auto_199913 ) ) ( not ( = ?auto_199912 ?auto_199914 ) ) ( not ( = ?auto_199912 ?auto_199915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199913 ?auto_199914 ?auto_199915 )
      ( MAKE-9CRATE-VERIFY ?auto_199906 ?auto_199907 ?auto_199908 ?auto_199909 ?auto_199910 ?auto_199911 ?auto_199912 ?auto_199913 ?auto_199914 ?auto_199915 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200014 - SURFACE
      ?auto_200015 - SURFACE
      ?auto_200016 - SURFACE
      ?auto_200017 - SURFACE
      ?auto_200018 - SURFACE
      ?auto_200019 - SURFACE
      ?auto_200020 - SURFACE
      ?auto_200021 - SURFACE
      ?auto_200022 - SURFACE
      ?auto_200023 - SURFACE
    )
    :vars
    (
      ?auto_200027 - HOIST
      ?auto_200028 - PLACE
      ?auto_200026 - TRUCK
      ?auto_200024 - PLACE
      ?auto_200025 - HOIST
      ?auto_200029 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_200027 ?auto_200028 ) ( SURFACE-AT ?auto_200022 ?auto_200028 ) ( CLEAR ?auto_200022 ) ( IS-CRATE ?auto_200023 ) ( not ( = ?auto_200022 ?auto_200023 ) ) ( AVAILABLE ?auto_200027 ) ( ON ?auto_200022 ?auto_200021 ) ( not ( = ?auto_200021 ?auto_200022 ) ) ( not ( = ?auto_200021 ?auto_200023 ) ) ( TRUCK-AT ?auto_200026 ?auto_200024 ) ( not ( = ?auto_200024 ?auto_200028 ) ) ( HOIST-AT ?auto_200025 ?auto_200024 ) ( not ( = ?auto_200027 ?auto_200025 ) ) ( AVAILABLE ?auto_200025 ) ( SURFACE-AT ?auto_200023 ?auto_200024 ) ( ON ?auto_200023 ?auto_200029 ) ( CLEAR ?auto_200023 ) ( not ( = ?auto_200022 ?auto_200029 ) ) ( not ( = ?auto_200023 ?auto_200029 ) ) ( not ( = ?auto_200021 ?auto_200029 ) ) ( ON ?auto_200015 ?auto_200014 ) ( ON ?auto_200016 ?auto_200015 ) ( ON ?auto_200017 ?auto_200016 ) ( ON ?auto_200018 ?auto_200017 ) ( ON ?auto_200019 ?auto_200018 ) ( ON ?auto_200020 ?auto_200019 ) ( ON ?auto_200021 ?auto_200020 ) ( not ( = ?auto_200014 ?auto_200015 ) ) ( not ( = ?auto_200014 ?auto_200016 ) ) ( not ( = ?auto_200014 ?auto_200017 ) ) ( not ( = ?auto_200014 ?auto_200018 ) ) ( not ( = ?auto_200014 ?auto_200019 ) ) ( not ( = ?auto_200014 ?auto_200020 ) ) ( not ( = ?auto_200014 ?auto_200021 ) ) ( not ( = ?auto_200014 ?auto_200022 ) ) ( not ( = ?auto_200014 ?auto_200023 ) ) ( not ( = ?auto_200014 ?auto_200029 ) ) ( not ( = ?auto_200015 ?auto_200016 ) ) ( not ( = ?auto_200015 ?auto_200017 ) ) ( not ( = ?auto_200015 ?auto_200018 ) ) ( not ( = ?auto_200015 ?auto_200019 ) ) ( not ( = ?auto_200015 ?auto_200020 ) ) ( not ( = ?auto_200015 ?auto_200021 ) ) ( not ( = ?auto_200015 ?auto_200022 ) ) ( not ( = ?auto_200015 ?auto_200023 ) ) ( not ( = ?auto_200015 ?auto_200029 ) ) ( not ( = ?auto_200016 ?auto_200017 ) ) ( not ( = ?auto_200016 ?auto_200018 ) ) ( not ( = ?auto_200016 ?auto_200019 ) ) ( not ( = ?auto_200016 ?auto_200020 ) ) ( not ( = ?auto_200016 ?auto_200021 ) ) ( not ( = ?auto_200016 ?auto_200022 ) ) ( not ( = ?auto_200016 ?auto_200023 ) ) ( not ( = ?auto_200016 ?auto_200029 ) ) ( not ( = ?auto_200017 ?auto_200018 ) ) ( not ( = ?auto_200017 ?auto_200019 ) ) ( not ( = ?auto_200017 ?auto_200020 ) ) ( not ( = ?auto_200017 ?auto_200021 ) ) ( not ( = ?auto_200017 ?auto_200022 ) ) ( not ( = ?auto_200017 ?auto_200023 ) ) ( not ( = ?auto_200017 ?auto_200029 ) ) ( not ( = ?auto_200018 ?auto_200019 ) ) ( not ( = ?auto_200018 ?auto_200020 ) ) ( not ( = ?auto_200018 ?auto_200021 ) ) ( not ( = ?auto_200018 ?auto_200022 ) ) ( not ( = ?auto_200018 ?auto_200023 ) ) ( not ( = ?auto_200018 ?auto_200029 ) ) ( not ( = ?auto_200019 ?auto_200020 ) ) ( not ( = ?auto_200019 ?auto_200021 ) ) ( not ( = ?auto_200019 ?auto_200022 ) ) ( not ( = ?auto_200019 ?auto_200023 ) ) ( not ( = ?auto_200019 ?auto_200029 ) ) ( not ( = ?auto_200020 ?auto_200021 ) ) ( not ( = ?auto_200020 ?auto_200022 ) ) ( not ( = ?auto_200020 ?auto_200023 ) ) ( not ( = ?auto_200020 ?auto_200029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200021 ?auto_200022 ?auto_200023 )
      ( MAKE-9CRATE-VERIFY ?auto_200014 ?auto_200015 ?auto_200016 ?auto_200017 ?auto_200018 ?auto_200019 ?auto_200020 ?auto_200021 ?auto_200022 ?auto_200023 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200123 - SURFACE
      ?auto_200124 - SURFACE
      ?auto_200125 - SURFACE
      ?auto_200126 - SURFACE
      ?auto_200127 - SURFACE
      ?auto_200128 - SURFACE
      ?auto_200129 - SURFACE
      ?auto_200130 - SURFACE
      ?auto_200131 - SURFACE
      ?auto_200132 - SURFACE
    )
    :vars
    (
      ?auto_200136 - HOIST
      ?auto_200134 - PLACE
      ?auto_200137 - PLACE
      ?auto_200133 - HOIST
      ?auto_200138 - SURFACE
      ?auto_200135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200136 ?auto_200134 ) ( SURFACE-AT ?auto_200131 ?auto_200134 ) ( CLEAR ?auto_200131 ) ( IS-CRATE ?auto_200132 ) ( not ( = ?auto_200131 ?auto_200132 ) ) ( AVAILABLE ?auto_200136 ) ( ON ?auto_200131 ?auto_200130 ) ( not ( = ?auto_200130 ?auto_200131 ) ) ( not ( = ?auto_200130 ?auto_200132 ) ) ( not ( = ?auto_200137 ?auto_200134 ) ) ( HOIST-AT ?auto_200133 ?auto_200137 ) ( not ( = ?auto_200136 ?auto_200133 ) ) ( AVAILABLE ?auto_200133 ) ( SURFACE-AT ?auto_200132 ?auto_200137 ) ( ON ?auto_200132 ?auto_200138 ) ( CLEAR ?auto_200132 ) ( not ( = ?auto_200131 ?auto_200138 ) ) ( not ( = ?auto_200132 ?auto_200138 ) ) ( not ( = ?auto_200130 ?auto_200138 ) ) ( TRUCK-AT ?auto_200135 ?auto_200134 ) ( ON ?auto_200124 ?auto_200123 ) ( ON ?auto_200125 ?auto_200124 ) ( ON ?auto_200126 ?auto_200125 ) ( ON ?auto_200127 ?auto_200126 ) ( ON ?auto_200128 ?auto_200127 ) ( ON ?auto_200129 ?auto_200128 ) ( ON ?auto_200130 ?auto_200129 ) ( not ( = ?auto_200123 ?auto_200124 ) ) ( not ( = ?auto_200123 ?auto_200125 ) ) ( not ( = ?auto_200123 ?auto_200126 ) ) ( not ( = ?auto_200123 ?auto_200127 ) ) ( not ( = ?auto_200123 ?auto_200128 ) ) ( not ( = ?auto_200123 ?auto_200129 ) ) ( not ( = ?auto_200123 ?auto_200130 ) ) ( not ( = ?auto_200123 ?auto_200131 ) ) ( not ( = ?auto_200123 ?auto_200132 ) ) ( not ( = ?auto_200123 ?auto_200138 ) ) ( not ( = ?auto_200124 ?auto_200125 ) ) ( not ( = ?auto_200124 ?auto_200126 ) ) ( not ( = ?auto_200124 ?auto_200127 ) ) ( not ( = ?auto_200124 ?auto_200128 ) ) ( not ( = ?auto_200124 ?auto_200129 ) ) ( not ( = ?auto_200124 ?auto_200130 ) ) ( not ( = ?auto_200124 ?auto_200131 ) ) ( not ( = ?auto_200124 ?auto_200132 ) ) ( not ( = ?auto_200124 ?auto_200138 ) ) ( not ( = ?auto_200125 ?auto_200126 ) ) ( not ( = ?auto_200125 ?auto_200127 ) ) ( not ( = ?auto_200125 ?auto_200128 ) ) ( not ( = ?auto_200125 ?auto_200129 ) ) ( not ( = ?auto_200125 ?auto_200130 ) ) ( not ( = ?auto_200125 ?auto_200131 ) ) ( not ( = ?auto_200125 ?auto_200132 ) ) ( not ( = ?auto_200125 ?auto_200138 ) ) ( not ( = ?auto_200126 ?auto_200127 ) ) ( not ( = ?auto_200126 ?auto_200128 ) ) ( not ( = ?auto_200126 ?auto_200129 ) ) ( not ( = ?auto_200126 ?auto_200130 ) ) ( not ( = ?auto_200126 ?auto_200131 ) ) ( not ( = ?auto_200126 ?auto_200132 ) ) ( not ( = ?auto_200126 ?auto_200138 ) ) ( not ( = ?auto_200127 ?auto_200128 ) ) ( not ( = ?auto_200127 ?auto_200129 ) ) ( not ( = ?auto_200127 ?auto_200130 ) ) ( not ( = ?auto_200127 ?auto_200131 ) ) ( not ( = ?auto_200127 ?auto_200132 ) ) ( not ( = ?auto_200127 ?auto_200138 ) ) ( not ( = ?auto_200128 ?auto_200129 ) ) ( not ( = ?auto_200128 ?auto_200130 ) ) ( not ( = ?auto_200128 ?auto_200131 ) ) ( not ( = ?auto_200128 ?auto_200132 ) ) ( not ( = ?auto_200128 ?auto_200138 ) ) ( not ( = ?auto_200129 ?auto_200130 ) ) ( not ( = ?auto_200129 ?auto_200131 ) ) ( not ( = ?auto_200129 ?auto_200132 ) ) ( not ( = ?auto_200129 ?auto_200138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200130 ?auto_200131 ?auto_200132 )
      ( MAKE-9CRATE-VERIFY ?auto_200123 ?auto_200124 ?auto_200125 ?auto_200126 ?auto_200127 ?auto_200128 ?auto_200129 ?auto_200130 ?auto_200131 ?auto_200132 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200232 - SURFACE
      ?auto_200233 - SURFACE
      ?auto_200234 - SURFACE
      ?auto_200235 - SURFACE
      ?auto_200236 - SURFACE
      ?auto_200237 - SURFACE
      ?auto_200238 - SURFACE
      ?auto_200239 - SURFACE
      ?auto_200240 - SURFACE
      ?auto_200241 - SURFACE
    )
    :vars
    (
      ?auto_200244 - HOIST
      ?auto_200245 - PLACE
      ?auto_200242 - PLACE
      ?auto_200246 - HOIST
      ?auto_200247 - SURFACE
      ?auto_200243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200244 ?auto_200245 ) ( IS-CRATE ?auto_200241 ) ( not ( = ?auto_200240 ?auto_200241 ) ) ( not ( = ?auto_200239 ?auto_200240 ) ) ( not ( = ?auto_200239 ?auto_200241 ) ) ( not ( = ?auto_200242 ?auto_200245 ) ) ( HOIST-AT ?auto_200246 ?auto_200242 ) ( not ( = ?auto_200244 ?auto_200246 ) ) ( AVAILABLE ?auto_200246 ) ( SURFACE-AT ?auto_200241 ?auto_200242 ) ( ON ?auto_200241 ?auto_200247 ) ( CLEAR ?auto_200241 ) ( not ( = ?auto_200240 ?auto_200247 ) ) ( not ( = ?auto_200241 ?auto_200247 ) ) ( not ( = ?auto_200239 ?auto_200247 ) ) ( TRUCK-AT ?auto_200243 ?auto_200245 ) ( SURFACE-AT ?auto_200239 ?auto_200245 ) ( CLEAR ?auto_200239 ) ( LIFTING ?auto_200244 ?auto_200240 ) ( IS-CRATE ?auto_200240 ) ( ON ?auto_200233 ?auto_200232 ) ( ON ?auto_200234 ?auto_200233 ) ( ON ?auto_200235 ?auto_200234 ) ( ON ?auto_200236 ?auto_200235 ) ( ON ?auto_200237 ?auto_200236 ) ( ON ?auto_200238 ?auto_200237 ) ( ON ?auto_200239 ?auto_200238 ) ( not ( = ?auto_200232 ?auto_200233 ) ) ( not ( = ?auto_200232 ?auto_200234 ) ) ( not ( = ?auto_200232 ?auto_200235 ) ) ( not ( = ?auto_200232 ?auto_200236 ) ) ( not ( = ?auto_200232 ?auto_200237 ) ) ( not ( = ?auto_200232 ?auto_200238 ) ) ( not ( = ?auto_200232 ?auto_200239 ) ) ( not ( = ?auto_200232 ?auto_200240 ) ) ( not ( = ?auto_200232 ?auto_200241 ) ) ( not ( = ?auto_200232 ?auto_200247 ) ) ( not ( = ?auto_200233 ?auto_200234 ) ) ( not ( = ?auto_200233 ?auto_200235 ) ) ( not ( = ?auto_200233 ?auto_200236 ) ) ( not ( = ?auto_200233 ?auto_200237 ) ) ( not ( = ?auto_200233 ?auto_200238 ) ) ( not ( = ?auto_200233 ?auto_200239 ) ) ( not ( = ?auto_200233 ?auto_200240 ) ) ( not ( = ?auto_200233 ?auto_200241 ) ) ( not ( = ?auto_200233 ?auto_200247 ) ) ( not ( = ?auto_200234 ?auto_200235 ) ) ( not ( = ?auto_200234 ?auto_200236 ) ) ( not ( = ?auto_200234 ?auto_200237 ) ) ( not ( = ?auto_200234 ?auto_200238 ) ) ( not ( = ?auto_200234 ?auto_200239 ) ) ( not ( = ?auto_200234 ?auto_200240 ) ) ( not ( = ?auto_200234 ?auto_200241 ) ) ( not ( = ?auto_200234 ?auto_200247 ) ) ( not ( = ?auto_200235 ?auto_200236 ) ) ( not ( = ?auto_200235 ?auto_200237 ) ) ( not ( = ?auto_200235 ?auto_200238 ) ) ( not ( = ?auto_200235 ?auto_200239 ) ) ( not ( = ?auto_200235 ?auto_200240 ) ) ( not ( = ?auto_200235 ?auto_200241 ) ) ( not ( = ?auto_200235 ?auto_200247 ) ) ( not ( = ?auto_200236 ?auto_200237 ) ) ( not ( = ?auto_200236 ?auto_200238 ) ) ( not ( = ?auto_200236 ?auto_200239 ) ) ( not ( = ?auto_200236 ?auto_200240 ) ) ( not ( = ?auto_200236 ?auto_200241 ) ) ( not ( = ?auto_200236 ?auto_200247 ) ) ( not ( = ?auto_200237 ?auto_200238 ) ) ( not ( = ?auto_200237 ?auto_200239 ) ) ( not ( = ?auto_200237 ?auto_200240 ) ) ( not ( = ?auto_200237 ?auto_200241 ) ) ( not ( = ?auto_200237 ?auto_200247 ) ) ( not ( = ?auto_200238 ?auto_200239 ) ) ( not ( = ?auto_200238 ?auto_200240 ) ) ( not ( = ?auto_200238 ?auto_200241 ) ) ( not ( = ?auto_200238 ?auto_200247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200239 ?auto_200240 ?auto_200241 )
      ( MAKE-9CRATE-VERIFY ?auto_200232 ?auto_200233 ?auto_200234 ?auto_200235 ?auto_200236 ?auto_200237 ?auto_200238 ?auto_200239 ?auto_200240 ?auto_200241 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200341 - SURFACE
      ?auto_200342 - SURFACE
      ?auto_200343 - SURFACE
      ?auto_200344 - SURFACE
      ?auto_200345 - SURFACE
      ?auto_200346 - SURFACE
      ?auto_200347 - SURFACE
      ?auto_200348 - SURFACE
      ?auto_200349 - SURFACE
      ?auto_200350 - SURFACE
    )
    :vars
    (
      ?auto_200354 - HOIST
      ?auto_200356 - PLACE
      ?auto_200355 - PLACE
      ?auto_200353 - HOIST
      ?auto_200352 - SURFACE
      ?auto_200351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200354 ?auto_200356 ) ( IS-CRATE ?auto_200350 ) ( not ( = ?auto_200349 ?auto_200350 ) ) ( not ( = ?auto_200348 ?auto_200349 ) ) ( not ( = ?auto_200348 ?auto_200350 ) ) ( not ( = ?auto_200355 ?auto_200356 ) ) ( HOIST-AT ?auto_200353 ?auto_200355 ) ( not ( = ?auto_200354 ?auto_200353 ) ) ( AVAILABLE ?auto_200353 ) ( SURFACE-AT ?auto_200350 ?auto_200355 ) ( ON ?auto_200350 ?auto_200352 ) ( CLEAR ?auto_200350 ) ( not ( = ?auto_200349 ?auto_200352 ) ) ( not ( = ?auto_200350 ?auto_200352 ) ) ( not ( = ?auto_200348 ?auto_200352 ) ) ( TRUCK-AT ?auto_200351 ?auto_200356 ) ( SURFACE-AT ?auto_200348 ?auto_200356 ) ( CLEAR ?auto_200348 ) ( IS-CRATE ?auto_200349 ) ( AVAILABLE ?auto_200354 ) ( IN ?auto_200349 ?auto_200351 ) ( ON ?auto_200342 ?auto_200341 ) ( ON ?auto_200343 ?auto_200342 ) ( ON ?auto_200344 ?auto_200343 ) ( ON ?auto_200345 ?auto_200344 ) ( ON ?auto_200346 ?auto_200345 ) ( ON ?auto_200347 ?auto_200346 ) ( ON ?auto_200348 ?auto_200347 ) ( not ( = ?auto_200341 ?auto_200342 ) ) ( not ( = ?auto_200341 ?auto_200343 ) ) ( not ( = ?auto_200341 ?auto_200344 ) ) ( not ( = ?auto_200341 ?auto_200345 ) ) ( not ( = ?auto_200341 ?auto_200346 ) ) ( not ( = ?auto_200341 ?auto_200347 ) ) ( not ( = ?auto_200341 ?auto_200348 ) ) ( not ( = ?auto_200341 ?auto_200349 ) ) ( not ( = ?auto_200341 ?auto_200350 ) ) ( not ( = ?auto_200341 ?auto_200352 ) ) ( not ( = ?auto_200342 ?auto_200343 ) ) ( not ( = ?auto_200342 ?auto_200344 ) ) ( not ( = ?auto_200342 ?auto_200345 ) ) ( not ( = ?auto_200342 ?auto_200346 ) ) ( not ( = ?auto_200342 ?auto_200347 ) ) ( not ( = ?auto_200342 ?auto_200348 ) ) ( not ( = ?auto_200342 ?auto_200349 ) ) ( not ( = ?auto_200342 ?auto_200350 ) ) ( not ( = ?auto_200342 ?auto_200352 ) ) ( not ( = ?auto_200343 ?auto_200344 ) ) ( not ( = ?auto_200343 ?auto_200345 ) ) ( not ( = ?auto_200343 ?auto_200346 ) ) ( not ( = ?auto_200343 ?auto_200347 ) ) ( not ( = ?auto_200343 ?auto_200348 ) ) ( not ( = ?auto_200343 ?auto_200349 ) ) ( not ( = ?auto_200343 ?auto_200350 ) ) ( not ( = ?auto_200343 ?auto_200352 ) ) ( not ( = ?auto_200344 ?auto_200345 ) ) ( not ( = ?auto_200344 ?auto_200346 ) ) ( not ( = ?auto_200344 ?auto_200347 ) ) ( not ( = ?auto_200344 ?auto_200348 ) ) ( not ( = ?auto_200344 ?auto_200349 ) ) ( not ( = ?auto_200344 ?auto_200350 ) ) ( not ( = ?auto_200344 ?auto_200352 ) ) ( not ( = ?auto_200345 ?auto_200346 ) ) ( not ( = ?auto_200345 ?auto_200347 ) ) ( not ( = ?auto_200345 ?auto_200348 ) ) ( not ( = ?auto_200345 ?auto_200349 ) ) ( not ( = ?auto_200345 ?auto_200350 ) ) ( not ( = ?auto_200345 ?auto_200352 ) ) ( not ( = ?auto_200346 ?auto_200347 ) ) ( not ( = ?auto_200346 ?auto_200348 ) ) ( not ( = ?auto_200346 ?auto_200349 ) ) ( not ( = ?auto_200346 ?auto_200350 ) ) ( not ( = ?auto_200346 ?auto_200352 ) ) ( not ( = ?auto_200347 ?auto_200348 ) ) ( not ( = ?auto_200347 ?auto_200349 ) ) ( not ( = ?auto_200347 ?auto_200350 ) ) ( not ( = ?auto_200347 ?auto_200352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200348 ?auto_200349 ?auto_200350 )
      ( MAKE-9CRATE-VERIFY ?auto_200341 ?auto_200342 ?auto_200343 ?auto_200344 ?auto_200345 ?auto_200346 ?auto_200347 ?auto_200348 ?auto_200349 ?auto_200350 ) )
  )

)

