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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8156 - SURFACE
      ?auto_8157 - SURFACE
    )
    :vars
    (
      ?auto_8158 - HOIST
      ?auto_8159 - PLACE
      ?auto_8161 - PLACE
      ?auto_8162 - HOIST
      ?auto_8163 - SURFACE
      ?auto_8160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8158 ?auto_8159 ) ( SURFACE-AT ?auto_8156 ?auto_8159 ) ( CLEAR ?auto_8156 ) ( IS-CRATE ?auto_8157 ) ( AVAILABLE ?auto_8158 ) ( not ( = ?auto_8161 ?auto_8159 ) ) ( HOIST-AT ?auto_8162 ?auto_8161 ) ( AVAILABLE ?auto_8162 ) ( SURFACE-AT ?auto_8157 ?auto_8161 ) ( ON ?auto_8157 ?auto_8163 ) ( CLEAR ?auto_8157 ) ( TRUCK-AT ?auto_8160 ?auto_8159 ) ( not ( = ?auto_8156 ?auto_8157 ) ) ( not ( = ?auto_8156 ?auto_8163 ) ) ( not ( = ?auto_8157 ?auto_8163 ) ) ( not ( = ?auto_8158 ?auto_8162 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8160 ?auto_8159 ?auto_8161 )
      ( !LIFT ?auto_8162 ?auto_8157 ?auto_8163 ?auto_8161 )
      ( !LOAD ?auto_8162 ?auto_8157 ?auto_8160 ?auto_8161 )
      ( !DRIVE ?auto_8160 ?auto_8161 ?auto_8159 )
      ( !UNLOAD ?auto_8158 ?auto_8157 ?auto_8160 ?auto_8159 )
      ( !DROP ?auto_8158 ?auto_8157 ?auto_8156 ?auto_8159 )
      ( MAKE-1CRATE-VERIFY ?auto_8156 ?auto_8157 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8177 - SURFACE
      ?auto_8178 - SURFACE
      ?auto_8179 - SURFACE
    )
    :vars
    (
      ?auto_8185 - HOIST
      ?auto_8180 - PLACE
      ?auto_8182 - PLACE
      ?auto_8184 - HOIST
      ?auto_8181 - SURFACE
      ?auto_8187 - PLACE
      ?auto_8188 - HOIST
      ?auto_8186 - SURFACE
      ?auto_8183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8185 ?auto_8180 ) ( IS-CRATE ?auto_8179 ) ( not ( = ?auto_8182 ?auto_8180 ) ) ( HOIST-AT ?auto_8184 ?auto_8182 ) ( AVAILABLE ?auto_8184 ) ( SURFACE-AT ?auto_8179 ?auto_8182 ) ( ON ?auto_8179 ?auto_8181 ) ( CLEAR ?auto_8179 ) ( not ( = ?auto_8178 ?auto_8179 ) ) ( not ( = ?auto_8178 ?auto_8181 ) ) ( not ( = ?auto_8179 ?auto_8181 ) ) ( not ( = ?auto_8185 ?auto_8184 ) ) ( SURFACE-AT ?auto_8177 ?auto_8180 ) ( CLEAR ?auto_8177 ) ( IS-CRATE ?auto_8178 ) ( AVAILABLE ?auto_8185 ) ( not ( = ?auto_8187 ?auto_8180 ) ) ( HOIST-AT ?auto_8188 ?auto_8187 ) ( AVAILABLE ?auto_8188 ) ( SURFACE-AT ?auto_8178 ?auto_8187 ) ( ON ?auto_8178 ?auto_8186 ) ( CLEAR ?auto_8178 ) ( TRUCK-AT ?auto_8183 ?auto_8180 ) ( not ( = ?auto_8177 ?auto_8178 ) ) ( not ( = ?auto_8177 ?auto_8186 ) ) ( not ( = ?auto_8178 ?auto_8186 ) ) ( not ( = ?auto_8185 ?auto_8188 ) ) ( not ( = ?auto_8177 ?auto_8179 ) ) ( not ( = ?auto_8177 ?auto_8181 ) ) ( not ( = ?auto_8179 ?auto_8186 ) ) ( not ( = ?auto_8182 ?auto_8187 ) ) ( not ( = ?auto_8184 ?auto_8188 ) ) ( not ( = ?auto_8181 ?auto_8186 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8177 ?auto_8178 )
      ( MAKE-1CRATE ?auto_8178 ?auto_8179 )
      ( MAKE-2CRATE-VERIFY ?auto_8177 ?auto_8178 ?auto_8179 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8203 - SURFACE
      ?auto_8204 - SURFACE
      ?auto_8205 - SURFACE
      ?auto_8206 - SURFACE
    )
    :vars
    (
      ?auto_8208 - HOIST
      ?auto_8212 - PLACE
      ?auto_8207 - PLACE
      ?auto_8209 - HOIST
      ?auto_8210 - SURFACE
      ?auto_8215 - PLACE
      ?auto_8218 - HOIST
      ?auto_8217 - SURFACE
      ?auto_8213 - PLACE
      ?auto_8216 - HOIST
      ?auto_8214 - SURFACE
      ?auto_8211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8208 ?auto_8212 ) ( IS-CRATE ?auto_8206 ) ( not ( = ?auto_8207 ?auto_8212 ) ) ( HOIST-AT ?auto_8209 ?auto_8207 ) ( AVAILABLE ?auto_8209 ) ( SURFACE-AT ?auto_8206 ?auto_8207 ) ( ON ?auto_8206 ?auto_8210 ) ( CLEAR ?auto_8206 ) ( not ( = ?auto_8205 ?auto_8206 ) ) ( not ( = ?auto_8205 ?auto_8210 ) ) ( not ( = ?auto_8206 ?auto_8210 ) ) ( not ( = ?auto_8208 ?auto_8209 ) ) ( IS-CRATE ?auto_8205 ) ( not ( = ?auto_8215 ?auto_8212 ) ) ( HOIST-AT ?auto_8218 ?auto_8215 ) ( AVAILABLE ?auto_8218 ) ( SURFACE-AT ?auto_8205 ?auto_8215 ) ( ON ?auto_8205 ?auto_8217 ) ( CLEAR ?auto_8205 ) ( not ( = ?auto_8204 ?auto_8205 ) ) ( not ( = ?auto_8204 ?auto_8217 ) ) ( not ( = ?auto_8205 ?auto_8217 ) ) ( not ( = ?auto_8208 ?auto_8218 ) ) ( SURFACE-AT ?auto_8203 ?auto_8212 ) ( CLEAR ?auto_8203 ) ( IS-CRATE ?auto_8204 ) ( AVAILABLE ?auto_8208 ) ( not ( = ?auto_8213 ?auto_8212 ) ) ( HOIST-AT ?auto_8216 ?auto_8213 ) ( AVAILABLE ?auto_8216 ) ( SURFACE-AT ?auto_8204 ?auto_8213 ) ( ON ?auto_8204 ?auto_8214 ) ( CLEAR ?auto_8204 ) ( TRUCK-AT ?auto_8211 ?auto_8212 ) ( not ( = ?auto_8203 ?auto_8204 ) ) ( not ( = ?auto_8203 ?auto_8214 ) ) ( not ( = ?auto_8204 ?auto_8214 ) ) ( not ( = ?auto_8208 ?auto_8216 ) ) ( not ( = ?auto_8203 ?auto_8205 ) ) ( not ( = ?auto_8203 ?auto_8217 ) ) ( not ( = ?auto_8205 ?auto_8214 ) ) ( not ( = ?auto_8215 ?auto_8213 ) ) ( not ( = ?auto_8218 ?auto_8216 ) ) ( not ( = ?auto_8217 ?auto_8214 ) ) ( not ( = ?auto_8203 ?auto_8206 ) ) ( not ( = ?auto_8203 ?auto_8210 ) ) ( not ( = ?auto_8204 ?auto_8206 ) ) ( not ( = ?auto_8204 ?auto_8210 ) ) ( not ( = ?auto_8206 ?auto_8217 ) ) ( not ( = ?auto_8206 ?auto_8214 ) ) ( not ( = ?auto_8207 ?auto_8215 ) ) ( not ( = ?auto_8207 ?auto_8213 ) ) ( not ( = ?auto_8209 ?auto_8218 ) ) ( not ( = ?auto_8209 ?auto_8216 ) ) ( not ( = ?auto_8210 ?auto_8217 ) ) ( not ( = ?auto_8210 ?auto_8214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8203 ?auto_8204 ?auto_8205 )
      ( MAKE-1CRATE ?auto_8205 ?auto_8206 )
      ( MAKE-3CRATE-VERIFY ?auto_8203 ?auto_8204 ?auto_8205 ?auto_8206 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8234 - SURFACE
      ?auto_8235 - SURFACE
      ?auto_8236 - SURFACE
      ?auto_8237 - SURFACE
      ?auto_8238 - SURFACE
    )
    :vars
    (
      ?auto_8240 - HOIST
      ?auto_8242 - PLACE
      ?auto_8243 - PLACE
      ?auto_8241 - HOIST
      ?auto_8244 - SURFACE
      ?auto_8253 - PLACE
      ?auto_8252 - HOIST
      ?auto_8249 - SURFACE
      ?auto_8248 - PLACE
      ?auto_8247 - HOIST
      ?auto_8245 - SURFACE
      ?auto_8250 - PLACE
      ?auto_8246 - HOIST
      ?auto_8251 - SURFACE
      ?auto_8239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8240 ?auto_8242 ) ( IS-CRATE ?auto_8238 ) ( not ( = ?auto_8243 ?auto_8242 ) ) ( HOIST-AT ?auto_8241 ?auto_8243 ) ( AVAILABLE ?auto_8241 ) ( SURFACE-AT ?auto_8238 ?auto_8243 ) ( ON ?auto_8238 ?auto_8244 ) ( CLEAR ?auto_8238 ) ( not ( = ?auto_8237 ?auto_8238 ) ) ( not ( = ?auto_8237 ?auto_8244 ) ) ( not ( = ?auto_8238 ?auto_8244 ) ) ( not ( = ?auto_8240 ?auto_8241 ) ) ( IS-CRATE ?auto_8237 ) ( not ( = ?auto_8253 ?auto_8242 ) ) ( HOIST-AT ?auto_8252 ?auto_8253 ) ( AVAILABLE ?auto_8252 ) ( SURFACE-AT ?auto_8237 ?auto_8253 ) ( ON ?auto_8237 ?auto_8249 ) ( CLEAR ?auto_8237 ) ( not ( = ?auto_8236 ?auto_8237 ) ) ( not ( = ?auto_8236 ?auto_8249 ) ) ( not ( = ?auto_8237 ?auto_8249 ) ) ( not ( = ?auto_8240 ?auto_8252 ) ) ( IS-CRATE ?auto_8236 ) ( not ( = ?auto_8248 ?auto_8242 ) ) ( HOIST-AT ?auto_8247 ?auto_8248 ) ( AVAILABLE ?auto_8247 ) ( SURFACE-AT ?auto_8236 ?auto_8248 ) ( ON ?auto_8236 ?auto_8245 ) ( CLEAR ?auto_8236 ) ( not ( = ?auto_8235 ?auto_8236 ) ) ( not ( = ?auto_8235 ?auto_8245 ) ) ( not ( = ?auto_8236 ?auto_8245 ) ) ( not ( = ?auto_8240 ?auto_8247 ) ) ( SURFACE-AT ?auto_8234 ?auto_8242 ) ( CLEAR ?auto_8234 ) ( IS-CRATE ?auto_8235 ) ( AVAILABLE ?auto_8240 ) ( not ( = ?auto_8250 ?auto_8242 ) ) ( HOIST-AT ?auto_8246 ?auto_8250 ) ( AVAILABLE ?auto_8246 ) ( SURFACE-AT ?auto_8235 ?auto_8250 ) ( ON ?auto_8235 ?auto_8251 ) ( CLEAR ?auto_8235 ) ( TRUCK-AT ?auto_8239 ?auto_8242 ) ( not ( = ?auto_8234 ?auto_8235 ) ) ( not ( = ?auto_8234 ?auto_8251 ) ) ( not ( = ?auto_8235 ?auto_8251 ) ) ( not ( = ?auto_8240 ?auto_8246 ) ) ( not ( = ?auto_8234 ?auto_8236 ) ) ( not ( = ?auto_8234 ?auto_8245 ) ) ( not ( = ?auto_8236 ?auto_8251 ) ) ( not ( = ?auto_8248 ?auto_8250 ) ) ( not ( = ?auto_8247 ?auto_8246 ) ) ( not ( = ?auto_8245 ?auto_8251 ) ) ( not ( = ?auto_8234 ?auto_8237 ) ) ( not ( = ?auto_8234 ?auto_8249 ) ) ( not ( = ?auto_8235 ?auto_8237 ) ) ( not ( = ?auto_8235 ?auto_8249 ) ) ( not ( = ?auto_8237 ?auto_8245 ) ) ( not ( = ?auto_8237 ?auto_8251 ) ) ( not ( = ?auto_8253 ?auto_8248 ) ) ( not ( = ?auto_8253 ?auto_8250 ) ) ( not ( = ?auto_8252 ?auto_8247 ) ) ( not ( = ?auto_8252 ?auto_8246 ) ) ( not ( = ?auto_8249 ?auto_8245 ) ) ( not ( = ?auto_8249 ?auto_8251 ) ) ( not ( = ?auto_8234 ?auto_8238 ) ) ( not ( = ?auto_8234 ?auto_8244 ) ) ( not ( = ?auto_8235 ?auto_8238 ) ) ( not ( = ?auto_8235 ?auto_8244 ) ) ( not ( = ?auto_8236 ?auto_8238 ) ) ( not ( = ?auto_8236 ?auto_8244 ) ) ( not ( = ?auto_8238 ?auto_8249 ) ) ( not ( = ?auto_8238 ?auto_8245 ) ) ( not ( = ?auto_8238 ?auto_8251 ) ) ( not ( = ?auto_8243 ?auto_8253 ) ) ( not ( = ?auto_8243 ?auto_8248 ) ) ( not ( = ?auto_8243 ?auto_8250 ) ) ( not ( = ?auto_8241 ?auto_8252 ) ) ( not ( = ?auto_8241 ?auto_8247 ) ) ( not ( = ?auto_8241 ?auto_8246 ) ) ( not ( = ?auto_8244 ?auto_8249 ) ) ( not ( = ?auto_8244 ?auto_8245 ) ) ( not ( = ?auto_8244 ?auto_8251 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8234 ?auto_8235 ?auto_8236 ?auto_8237 )
      ( MAKE-1CRATE ?auto_8237 ?auto_8238 )
      ( MAKE-4CRATE-VERIFY ?auto_8234 ?auto_8235 ?auto_8236 ?auto_8237 ?auto_8238 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_8270 - SURFACE
      ?auto_8271 - SURFACE
      ?auto_8272 - SURFACE
      ?auto_8273 - SURFACE
      ?auto_8274 - SURFACE
      ?auto_8275 - SURFACE
    )
    :vars
    (
      ?auto_8278 - HOIST
      ?auto_8281 - PLACE
      ?auto_8280 - PLACE
      ?auto_8276 - HOIST
      ?auto_8279 - SURFACE
      ?auto_8293 - PLACE
      ?auto_8287 - HOIST
      ?auto_8292 - SURFACE
      ?auto_8285 - PLACE
      ?auto_8289 - HOIST
      ?auto_8282 - SURFACE
      ?auto_8286 - PLACE
      ?auto_8291 - HOIST
      ?auto_8290 - SURFACE
      ?auto_8283 - PLACE
      ?auto_8284 - HOIST
      ?auto_8288 - SURFACE
      ?auto_8277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8278 ?auto_8281 ) ( IS-CRATE ?auto_8275 ) ( not ( = ?auto_8280 ?auto_8281 ) ) ( HOIST-AT ?auto_8276 ?auto_8280 ) ( AVAILABLE ?auto_8276 ) ( SURFACE-AT ?auto_8275 ?auto_8280 ) ( ON ?auto_8275 ?auto_8279 ) ( CLEAR ?auto_8275 ) ( not ( = ?auto_8274 ?auto_8275 ) ) ( not ( = ?auto_8274 ?auto_8279 ) ) ( not ( = ?auto_8275 ?auto_8279 ) ) ( not ( = ?auto_8278 ?auto_8276 ) ) ( IS-CRATE ?auto_8274 ) ( not ( = ?auto_8293 ?auto_8281 ) ) ( HOIST-AT ?auto_8287 ?auto_8293 ) ( AVAILABLE ?auto_8287 ) ( SURFACE-AT ?auto_8274 ?auto_8293 ) ( ON ?auto_8274 ?auto_8292 ) ( CLEAR ?auto_8274 ) ( not ( = ?auto_8273 ?auto_8274 ) ) ( not ( = ?auto_8273 ?auto_8292 ) ) ( not ( = ?auto_8274 ?auto_8292 ) ) ( not ( = ?auto_8278 ?auto_8287 ) ) ( IS-CRATE ?auto_8273 ) ( not ( = ?auto_8285 ?auto_8281 ) ) ( HOIST-AT ?auto_8289 ?auto_8285 ) ( AVAILABLE ?auto_8289 ) ( SURFACE-AT ?auto_8273 ?auto_8285 ) ( ON ?auto_8273 ?auto_8282 ) ( CLEAR ?auto_8273 ) ( not ( = ?auto_8272 ?auto_8273 ) ) ( not ( = ?auto_8272 ?auto_8282 ) ) ( not ( = ?auto_8273 ?auto_8282 ) ) ( not ( = ?auto_8278 ?auto_8289 ) ) ( IS-CRATE ?auto_8272 ) ( not ( = ?auto_8286 ?auto_8281 ) ) ( HOIST-AT ?auto_8291 ?auto_8286 ) ( AVAILABLE ?auto_8291 ) ( SURFACE-AT ?auto_8272 ?auto_8286 ) ( ON ?auto_8272 ?auto_8290 ) ( CLEAR ?auto_8272 ) ( not ( = ?auto_8271 ?auto_8272 ) ) ( not ( = ?auto_8271 ?auto_8290 ) ) ( not ( = ?auto_8272 ?auto_8290 ) ) ( not ( = ?auto_8278 ?auto_8291 ) ) ( SURFACE-AT ?auto_8270 ?auto_8281 ) ( CLEAR ?auto_8270 ) ( IS-CRATE ?auto_8271 ) ( AVAILABLE ?auto_8278 ) ( not ( = ?auto_8283 ?auto_8281 ) ) ( HOIST-AT ?auto_8284 ?auto_8283 ) ( AVAILABLE ?auto_8284 ) ( SURFACE-AT ?auto_8271 ?auto_8283 ) ( ON ?auto_8271 ?auto_8288 ) ( CLEAR ?auto_8271 ) ( TRUCK-AT ?auto_8277 ?auto_8281 ) ( not ( = ?auto_8270 ?auto_8271 ) ) ( not ( = ?auto_8270 ?auto_8288 ) ) ( not ( = ?auto_8271 ?auto_8288 ) ) ( not ( = ?auto_8278 ?auto_8284 ) ) ( not ( = ?auto_8270 ?auto_8272 ) ) ( not ( = ?auto_8270 ?auto_8290 ) ) ( not ( = ?auto_8272 ?auto_8288 ) ) ( not ( = ?auto_8286 ?auto_8283 ) ) ( not ( = ?auto_8291 ?auto_8284 ) ) ( not ( = ?auto_8290 ?auto_8288 ) ) ( not ( = ?auto_8270 ?auto_8273 ) ) ( not ( = ?auto_8270 ?auto_8282 ) ) ( not ( = ?auto_8271 ?auto_8273 ) ) ( not ( = ?auto_8271 ?auto_8282 ) ) ( not ( = ?auto_8273 ?auto_8290 ) ) ( not ( = ?auto_8273 ?auto_8288 ) ) ( not ( = ?auto_8285 ?auto_8286 ) ) ( not ( = ?auto_8285 ?auto_8283 ) ) ( not ( = ?auto_8289 ?auto_8291 ) ) ( not ( = ?auto_8289 ?auto_8284 ) ) ( not ( = ?auto_8282 ?auto_8290 ) ) ( not ( = ?auto_8282 ?auto_8288 ) ) ( not ( = ?auto_8270 ?auto_8274 ) ) ( not ( = ?auto_8270 ?auto_8292 ) ) ( not ( = ?auto_8271 ?auto_8274 ) ) ( not ( = ?auto_8271 ?auto_8292 ) ) ( not ( = ?auto_8272 ?auto_8274 ) ) ( not ( = ?auto_8272 ?auto_8292 ) ) ( not ( = ?auto_8274 ?auto_8282 ) ) ( not ( = ?auto_8274 ?auto_8290 ) ) ( not ( = ?auto_8274 ?auto_8288 ) ) ( not ( = ?auto_8293 ?auto_8285 ) ) ( not ( = ?auto_8293 ?auto_8286 ) ) ( not ( = ?auto_8293 ?auto_8283 ) ) ( not ( = ?auto_8287 ?auto_8289 ) ) ( not ( = ?auto_8287 ?auto_8291 ) ) ( not ( = ?auto_8287 ?auto_8284 ) ) ( not ( = ?auto_8292 ?auto_8282 ) ) ( not ( = ?auto_8292 ?auto_8290 ) ) ( not ( = ?auto_8292 ?auto_8288 ) ) ( not ( = ?auto_8270 ?auto_8275 ) ) ( not ( = ?auto_8270 ?auto_8279 ) ) ( not ( = ?auto_8271 ?auto_8275 ) ) ( not ( = ?auto_8271 ?auto_8279 ) ) ( not ( = ?auto_8272 ?auto_8275 ) ) ( not ( = ?auto_8272 ?auto_8279 ) ) ( not ( = ?auto_8273 ?auto_8275 ) ) ( not ( = ?auto_8273 ?auto_8279 ) ) ( not ( = ?auto_8275 ?auto_8292 ) ) ( not ( = ?auto_8275 ?auto_8282 ) ) ( not ( = ?auto_8275 ?auto_8290 ) ) ( not ( = ?auto_8275 ?auto_8288 ) ) ( not ( = ?auto_8280 ?auto_8293 ) ) ( not ( = ?auto_8280 ?auto_8285 ) ) ( not ( = ?auto_8280 ?auto_8286 ) ) ( not ( = ?auto_8280 ?auto_8283 ) ) ( not ( = ?auto_8276 ?auto_8287 ) ) ( not ( = ?auto_8276 ?auto_8289 ) ) ( not ( = ?auto_8276 ?auto_8291 ) ) ( not ( = ?auto_8276 ?auto_8284 ) ) ( not ( = ?auto_8279 ?auto_8292 ) ) ( not ( = ?auto_8279 ?auto_8282 ) ) ( not ( = ?auto_8279 ?auto_8290 ) ) ( not ( = ?auto_8279 ?auto_8288 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8270 ?auto_8271 ?auto_8272 ?auto_8273 ?auto_8274 )
      ( MAKE-1CRATE ?auto_8274 ?auto_8275 )
      ( MAKE-5CRATE-VERIFY ?auto_8270 ?auto_8271 ?auto_8272 ?auto_8273 ?auto_8274 ?auto_8275 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8311 - SURFACE
      ?auto_8312 - SURFACE
      ?auto_8313 - SURFACE
      ?auto_8314 - SURFACE
      ?auto_8315 - SURFACE
      ?auto_8316 - SURFACE
      ?auto_8317 - SURFACE
    )
    :vars
    (
      ?auto_8319 - HOIST
      ?auto_8323 - PLACE
      ?auto_8321 - PLACE
      ?auto_8322 - HOIST
      ?auto_8320 - SURFACE
      ?auto_8332 - PLACE
      ?auto_8337 - HOIST
      ?auto_8338 - SURFACE
      ?auto_8335 - PLACE
      ?auto_8328 - HOIST
      ?auto_8333 - SURFACE
      ?auto_8327 - PLACE
      ?auto_8331 - HOIST
      ?auto_8326 - SURFACE
      ?auto_8329 - PLACE
      ?auto_8336 - HOIST
      ?auto_8334 - SURFACE
      ?auto_8325 - PLACE
      ?auto_8324 - HOIST
      ?auto_8330 - SURFACE
      ?auto_8318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8319 ?auto_8323 ) ( IS-CRATE ?auto_8317 ) ( not ( = ?auto_8321 ?auto_8323 ) ) ( HOIST-AT ?auto_8322 ?auto_8321 ) ( AVAILABLE ?auto_8322 ) ( SURFACE-AT ?auto_8317 ?auto_8321 ) ( ON ?auto_8317 ?auto_8320 ) ( CLEAR ?auto_8317 ) ( not ( = ?auto_8316 ?auto_8317 ) ) ( not ( = ?auto_8316 ?auto_8320 ) ) ( not ( = ?auto_8317 ?auto_8320 ) ) ( not ( = ?auto_8319 ?auto_8322 ) ) ( IS-CRATE ?auto_8316 ) ( not ( = ?auto_8332 ?auto_8323 ) ) ( HOIST-AT ?auto_8337 ?auto_8332 ) ( AVAILABLE ?auto_8337 ) ( SURFACE-AT ?auto_8316 ?auto_8332 ) ( ON ?auto_8316 ?auto_8338 ) ( CLEAR ?auto_8316 ) ( not ( = ?auto_8315 ?auto_8316 ) ) ( not ( = ?auto_8315 ?auto_8338 ) ) ( not ( = ?auto_8316 ?auto_8338 ) ) ( not ( = ?auto_8319 ?auto_8337 ) ) ( IS-CRATE ?auto_8315 ) ( not ( = ?auto_8335 ?auto_8323 ) ) ( HOIST-AT ?auto_8328 ?auto_8335 ) ( AVAILABLE ?auto_8328 ) ( SURFACE-AT ?auto_8315 ?auto_8335 ) ( ON ?auto_8315 ?auto_8333 ) ( CLEAR ?auto_8315 ) ( not ( = ?auto_8314 ?auto_8315 ) ) ( not ( = ?auto_8314 ?auto_8333 ) ) ( not ( = ?auto_8315 ?auto_8333 ) ) ( not ( = ?auto_8319 ?auto_8328 ) ) ( IS-CRATE ?auto_8314 ) ( not ( = ?auto_8327 ?auto_8323 ) ) ( HOIST-AT ?auto_8331 ?auto_8327 ) ( AVAILABLE ?auto_8331 ) ( SURFACE-AT ?auto_8314 ?auto_8327 ) ( ON ?auto_8314 ?auto_8326 ) ( CLEAR ?auto_8314 ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( not ( = ?auto_8313 ?auto_8326 ) ) ( not ( = ?auto_8314 ?auto_8326 ) ) ( not ( = ?auto_8319 ?auto_8331 ) ) ( IS-CRATE ?auto_8313 ) ( not ( = ?auto_8329 ?auto_8323 ) ) ( HOIST-AT ?auto_8336 ?auto_8329 ) ( AVAILABLE ?auto_8336 ) ( SURFACE-AT ?auto_8313 ?auto_8329 ) ( ON ?auto_8313 ?auto_8334 ) ( CLEAR ?auto_8313 ) ( not ( = ?auto_8312 ?auto_8313 ) ) ( not ( = ?auto_8312 ?auto_8334 ) ) ( not ( = ?auto_8313 ?auto_8334 ) ) ( not ( = ?auto_8319 ?auto_8336 ) ) ( SURFACE-AT ?auto_8311 ?auto_8323 ) ( CLEAR ?auto_8311 ) ( IS-CRATE ?auto_8312 ) ( AVAILABLE ?auto_8319 ) ( not ( = ?auto_8325 ?auto_8323 ) ) ( HOIST-AT ?auto_8324 ?auto_8325 ) ( AVAILABLE ?auto_8324 ) ( SURFACE-AT ?auto_8312 ?auto_8325 ) ( ON ?auto_8312 ?auto_8330 ) ( CLEAR ?auto_8312 ) ( TRUCK-AT ?auto_8318 ?auto_8323 ) ( not ( = ?auto_8311 ?auto_8312 ) ) ( not ( = ?auto_8311 ?auto_8330 ) ) ( not ( = ?auto_8312 ?auto_8330 ) ) ( not ( = ?auto_8319 ?auto_8324 ) ) ( not ( = ?auto_8311 ?auto_8313 ) ) ( not ( = ?auto_8311 ?auto_8334 ) ) ( not ( = ?auto_8313 ?auto_8330 ) ) ( not ( = ?auto_8329 ?auto_8325 ) ) ( not ( = ?auto_8336 ?auto_8324 ) ) ( not ( = ?auto_8334 ?auto_8330 ) ) ( not ( = ?auto_8311 ?auto_8314 ) ) ( not ( = ?auto_8311 ?auto_8326 ) ) ( not ( = ?auto_8312 ?auto_8314 ) ) ( not ( = ?auto_8312 ?auto_8326 ) ) ( not ( = ?auto_8314 ?auto_8334 ) ) ( not ( = ?auto_8314 ?auto_8330 ) ) ( not ( = ?auto_8327 ?auto_8329 ) ) ( not ( = ?auto_8327 ?auto_8325 ) ) ( not ( = ?auto_8331 ?auto_8336 ) ) ( not ( = ?auto_8331 ?auto_8324 ) ) ( not ( = ?auto_8326 ?auto_8334 ) ) ( not ( = ?auto_8326 ?auto_8330 ) ) ( not ( = ?auto_8311 ?auto_8315 ) ) ( not ( = ?auto_8311 ?auto_8333 ) ) ( not ( = ?auto_8312 ?auto_8315 ) ) ( not ( = ?auto_8312 ?auto_8333 ) ) ( not ( = ?auto_8313 ?auto_8315 ) ) ( not ( = ?auto_8313 ?auto_8333 ) ) ( not ( = ?auto_8315 ?auto_8326 ) ) ( not ( = ?auto_8315 ?auto_8334 ) ) ( not ( = ?auto_8315 ?auto_8330 ) ) ( not ( = ?auto_8335 ?auto_8327 ) ) ( not ( = ?auto_8335 ?auto_8329 ) ) ( not ( = ?auto_8335 ?auto_8325 ) ) ( not ( = ?auto_8328 ?auto_8331 ) ) ( not ( = ?auto_8328 ?auto_8336 ) ) ( not ( = ?auto_8328 ?auto_8324 ) ) ( not ( = ?auto_8333 ?auto_8326 ) ) ( not ( = ?auto_8333 ?auto_8334 ) ) ( not ( = ?auto_8333 ?auto_8330 ) ) ( not ( = ?auto_8311 ?auto_8316 ) ) ( not ( = ?auto_8311 ?auto_8338 ) ) ( not ( = ?auto_8312 ?auto_8316 ) ) ( not ( = ?auto_8312 ?auto_8338 ) ) ( not ( = ?auto_8313 ?auto_8316 ) ) ( not ( = ?auto_8313 ?auto_8338 ) ) ( not ( = ?auto_8314 ?auto_8316 ) ) ( not ( = ?auto_8314 ?auto_8338 ) ) ( not ( = ?auto_8316 ?auto_8333 ) ) ( not ( = ?auto_8316 ?auto_8326 ) ) ( not ( = ?auto_8316 ?auto_8334 ) ) ( not ( = ?auto_8316 ?auto_8330 ) ) ( not ( = ?auto_8332 ?auto_8335 ) ) ( not ( = ?auto_8332 ?auto_8327 ) ) ( not ( = ?auto_8332 ?auto_8329 ) ) ( not ( = ?auto_8332 ?auto_8325 ) ) ( not ( = ?auto_8337 ?auto_8328 ) ) ( not ( = ?auto_8337 ?auto_8331 ) ) ( not ( = ?auto_8337 ?auto_8336 ) ) ( not ( = ?auto_8337 ?auto_8324 ) ) ( not ( = ?auto_8338 ?auto_8333 ) ) ( not ( = ?auto_8338 ?auto_8326 ) ) ( not ( = ?auto_8338 ?auto_8334 ) ) ( not ( = ?auto_8338 ?auto_8330 ) ) ( not ( = ?auto_8311 ?auto_8317 ) ) ( not ( = ?auto_8311 ?auto_8320 ) ) ( not ( = ?auto_8312 ?auto_8317 ) ) ( not ( = ?auto_8312 ?auto_8320 ) ) ( not ( = ?auto_8313 ?auto_8317 ) ) ( not ( = ?auto_8313 ?auto_8320 ) ) ( not ( = ?auto_8314 ?auto_8317 ) ) ( not ( = ?auto_8314 ?auto_8320 ) ) ( not ( = ?auto_8315 ?auto_8317 ) ) ( not ( = ?auto_8315 ?auto_8320 ) ) ( not ( = ?auto_8317 ?auto_8338 ) ) ( not ( = ?auto_8317 ?auto_8333 ) ) ( not ( = ?auto_8317 ?auto_8326 ) ) ( not ( = ?auto_8317 ?auto_8334 ) ) ( not ( = ?auto_8317 ?auto_8330 ) ) ( not ( = ?auto_8321 ?auto_8332 ) ) ( not ( = ?auto_8321 ?auto_8335 ) ) ( not ( = ?auto_8321 ?auto_8327 ) ) ( not ( = ?auto_8321 ?auto_8329 ) ) ( not ( = ?auto_8321 ?auto_8325 ) ) ( not ( = ?auto_8322 ?auto_8337 ) ) ( not ( = ?auto_8322 ?auto_8328 ) ) ( not ( = ?auto_8322 ?auto_8331 ) ) ( not ( = ?auto_8322 ?auto_8336 ) ) ( not ( = ?auto_8322 ?auto_8324 ) ) ( not ( = ?auto_8320 ?auto_8338 ) ) ( not ( = ?auto_8320 ?auto_8333 ) ) ( not ( = ?auto_8320 ?auto_8326 ) ) ( not ( = ?auto_8320 ?auto_8334 ) ) ( not ( = ?auto_8320 ?auto_8330 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8311 ?auto_8312 ?auto_8313 ?auto_8314 ?auto_8315 ?auto_8316 )
      ( MAKE-1CRATE ?auto_8316 ?auto_8317 )
      ( MAKE-6CRATE-VERIFY ?auto_8311 ?auto_8312 ?auto_8313 ?auto_8314 ?auto_8315 ?auto_8316 ?auto_8317 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8357 - SURFACE
      ?auto_8358 - SURFACE
      ?auto_8359 - SURFACE
      ?auto_8360 - SURFACE
      ?auto_8361 - SURFACE
      ?auto_8362 - SURFACE
      ?auto_8363 - SURFACE
      ?auto_8364 - SURFACE
    )
    :vars
    (
      ?auto_8370 - HOIST
      ?auto_8369 - PLACE
      ?auto_8365 - PLACE
      ?auto_8367 - HOIST
      ?auto_8368 - SURFACE
      ?auto_8380 - PLACE
      ?auto_8372 - HOIST
      ?auto_8374 - SURFACE
      ?auto_8384 - SURFACE
      ?auto_8377 - PLACE
      ?auto_8381 - HOIST
      ?auto_8385 - SURFACE
      ?auto_8382 - PLACE
      ?auto_8376 - HOIST
      ?auto_8383 - SURFACE
      ?auto_8373 - PLACE
      ?auto_8375 - HOIST
      ?auto_8378 - SURFACE
      ?auto_8386 - PLACE
      ?auto_8379 - HOIST
      ?auto_8371 - SURFACE
      ?auto_8366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8370 ?auto_8369 ) ( IS-CRATE ?auto_8364 ) ( not ( = ?auto_8365 ?auto_8369 ) ) ( HOIST-AT ?auto_8367 ?auto_8365 ) ( SURFACE-AT ?auto_8364 ?auto_8365 ) ( ON ?auto_8364 ?auto_8368 ) ( CLEAR ?auto_8364 ) ( not ( = ?auto_8363 ?auto_8364 ) ) ( not ( = ?auto_8363 ?auto_8368 ) ) ( not ( = ?auto_8364 ?auto_8368 ) ) ( not ( = ?auto_8370 ?auto_8367 ) ) ( IS-CRATE ?auto_8363 ) ( not ( = ?auto_8380 ?auto_8369 ) ) ( HOIST-AT ?auto_8372 ?auto_8380 ) ( AVAILABLE ?auto_8372 ) ( SURFACE-AT ?auto_8363 ?auto_8380 ) ( ON ?auto_8363 ?auto_8374 ) ( CLEAR ?auto_8363 ) ( not ( = ?auto_8362 ?auto_8363 ) ) ( not ( = ?auto_8362 ?auto_8374 ) ) ( not ( = ?auto_8363 ?auto_8374 ) ) ( not ( = ?auto_8370 ?auto_8372 ) ) ( IS-CRATE ?auto_8362 ) ( AVAILABLE ?auto_8367 ) ( SURFACE-AT ?auto_8362 ?auto_8365 ) ( ON ?auto_8362 ?auto_8384 ) ( CLEAR ?auto_8362 ) ( not ( = ?auto_8361 ?auto_8362 ) ) ( not ( = ?auto_8361 ?auto_8384 ) ) ( not ( = ?auto_8362 ?auto_8384 ) ) ( IS-CRATE ?auto_8361 ) ( not ( = ?auto_8377 ?auto_8369 ) ) ( HOIST-AT ?auto_8381 ?auto_8377 ) ( AVAILABLE ?auto_8381 ) ( SURFACE-AT ?auto_8361 ?auto_8377 ) ( ON ?auto_8361 ?auto_8385 ) ( CLEAR ?auto_8361 ) ( not ( = ?auto_8360 ?auto_8361 ) ) ( not ( = ?auto_8360 ?auto_8385 ) ) ( not ( = ?auto_8361 ?auto_8385 ) ) ( not ( = ?auto_8370 ?auto_8381 ) ) ( IS-CRATE ?auto_8360 ) ( not ( = ?auto_8382 ?auto_8369 ) ) ( HOIST-AT ?auto_8376 ?auto_8382 ) ( AVAILABLE ?auto_8376 ) ( SURFACE-AT ?auto_8360 ?auto_8382 ) ( ON ?auto_8360 ?auto_8383 ) ( CLEAR ?auto_8360 ) ( not ( = ?auto_8359 ?auto_8360 ) ) ( not ( = ?auto_8359 ?auto_8383 ) ) ( not ( = ?auto_8360 ?auto_8383 ) ) ( not ( = ?auto_8370 ?auto_8376 ) ) ( IS-CRATE ?auto_8359 ) ( not ( = ?auto_8373 ?auto_8369 ) ) ( HOIST-AT ?auto_8375 ?auto_8373 ) ( AVAILABLE ?auto_8375 ) ( SURFACE-AT ?auto_8359 ?auto_8373 ) ( ON ?auto_8359 ?auto_8378 ) ( CLEAR ?auto_8359 ) ( not ( = ?auto_8358 ?auto_8359 ) ) ( not ( = ?auto_8358 ?auto_8378 ) ) ( not ( = ?auto_8359 ?auto_8378 ) ) ( not ( = ?auto_8370 ?auto_8375 ) ) ( SURFACE-AT ?auto_8357 ?auto_8369 ) ( CLEAR ?auto_8357 ) ( IS-CRATE ?auto_8358 ) ( AVAILABLE ?auto_8370 ) ( not ( = ?auto_8386 ?auto_8369 ) ) ( HOIST-AT ?auto_8379 ?auto_8386 ) ( AVAILABLE ?auto_8379 ) ( SURFACE-AT ?auto_8358 ?auto_8386 ) ( ON ?auto_8358 ?auto_8371 ) ( CLEAR ?auto_8358 ) ( TRUCK-AT ?auto_8366 ?auto_8369 ) ( not ( = ?auto_8357 ?auto_8358 ) ) ( not ( = ?auto_8357 ?auto_8371 ) ) ( not ( = ?auto_8358 ?auto_8371 ) ) ( not ( = ?auto_8370 ?auto_8379 ) ) ( not ( = ?auto_8357 ?auto_8359 ) ) ( not ( = ?auto_8357 ?auto_8378 ) ) ( not ( = ?auto_8359 ?auto_8371 ) ) ( not ( = ?auto_8373 ?auto_8386 ) ) ( not ( = ?auto_8375 ?auto_8379 ) ) ( not ( = ?auto_8378 ?auto_8371 ) ) ( not ( = ?auto_8357 ?auto_8360 ) ) ( not ( = ?auto_8357 ?auto_8383 ) ) ( not ( = ?auto_8358 ?auto_8360 ) ) ( not ( = ?auto_8358 ?auto_8383 ) ) ( not ( = ?auto_8360 ?auto_8378 ) ) ( not ( = ?auto_8360 ?auto_8371 ) ) ( not ( = ?auto_8382 ?auto_8373 ) ) ( not ( = ?auto_8382 ?auto_8386 ) ) ( not ( = ?auto_8376 ?auto_8375 ) ) ( not ( = ?auto_8376 ?auto_8379 ) ) ( not ( = ?auto_8383 ?auto_8378 ) ) ( not ( = ?auto_8383 ?auto_8371 ) ) ( not ( = ?auto_8357 ?auto_8361 ) ) ( not ( = ?auto_8357 ?auto_8385 ) ) ( not ( = ?auto_8358 ?auto_8361 ) ) ( not ( = ?auto_8358 ?auto_8385 ) ) ( not ( = ?auto_8359 ?auto_8361 ) ) ( not ( = ?auto_8359 ?auto_8385 ) ) ( not ( = ?auto_8361 ?auto_8383 ) ) ( not ( = ?auto_8361 ?auto_8378 ) ) ( not ( = ?auto_8361 ?auto_8371 ) ) ( not ( = ?auto_8377 ?auto_8382 ) ) ( not ( = ?auto_8377 ?auto_8373 ) ) ( not ( = ?auto_8377 ?auto_8386 ) ) ( not ( = ?auto_8381 ?auto_8376 ) ) ( not ( = ?auto_8381 ?auto_8375 ) ) ( not ( = ?auto_8381 ?auto_8379 ) ) ( not ( = ?auto_8385 ?auto_8383 ) ) ( not ( = ?auto_8385 ?auto_8378 ) ) ( not ( = ?auto_8385 ?auto_8371 ) ) ( not ( = ?auto_8357 ?auto_8362 ) ) ( not ( = ?auto_8357 ?auto_8384 ) ) ( not ( = ?auto_8358 ?auto_8362 ) ) ( not ( = ?auto_8358 ?auto_8384 ) ) ( not ( = ?auto_8359 ?auto_8362 ) ) ( not ( = ?auto_8359 ?auto_8384 ) ) ( not ( = ?auto_8360 ?auto_8362 ) ) ( not ( = ?auto_8360 ?auto_8384 ) ) ( not ( = ?auto_8362 ?auto_8385 ) ) ( not ( = ?auto_8362 ?auto_8383 ) ) ( not ( = ?auto_8362 ?auto_8378 ) ) ( not ( = ?auto_8362 ?auto_8371 ) ) ( not ( = ?auto_8365 ?auto_8377 ) ) ( not ( = ?auto_8365 ?auto_8382 ) ) ( not ( = ?auto_8365 ?auto_8373 ) ) ( not ( = ?auto_8365 ?auto_8386 ) ) ( not ( = ?auto_8367 ?auto_8381 ) ) ( not ( = ?auto_8367 ?auto_8376 ) ) ( not ( = ?auto_8367 ?auto_8375 ) ) ( not ( = ?auto_8367 ?auto_8379 ) ) ( not ( = ?auto_8384 ?auto_8385 ) ) ( not ( = ?auto_8384 ?auto_8383 ) ) ( not ( = ?auto_8384 ?auto_8378 ) ) ( not ( = ?auto_8384 ?auto_8371 ) ) ( not ( = ?auto_8357 ?auto_8363 ) ) ( not ( = ?auto_8357 ?auto_8374 ) ) ( not ( = ?auto_8358 ?auto_8363 ) ) ( not ( = ?auto_8358 ?auto_8374 ) ) ( not ( = ?auto_8359 ?auto_8363 ) ) ( not ( = ?auto_8359 ?auto_8374 ) ) ( not ( = ?auto_8360 ?auto_8363 ) ) ( not ( = ?auto_8360 ?auto_8374 ) ) ( not ( = ?auto_8361 ?auto_8363 ) ) ( not ( = ?auto_8361 ?auto_8374 ) ) ( not ( = ?auto_8363 ?auto_8384 ) ) ( not ( = ?auto_8363 ?auto_8385 ) ) ( not ( = ?auto_8363 ?auto_8383 ) ) ( not ( = ?auto_8363 ?auto_8378 ) ) ( not ( = ?auto_8363 ?auto_8371 ) ) ( not ( = ?auto_8380 ?auto_8365 ) ) ( not ( = ?auto_8380 ?auto_8377 ) ) ( not ( = ?auto_8380 ?auto_8382 ) ) ( not ( = ?auto_8380 ?auto_8373 ) ) ( not ( = ?auto_8380 ?auto_8386 ) ) ( not ( = ?auto_8372 ?auto_8367 ) ) ( not ( = ?auto_8372 ?auto_8381 ) ) ( not ( = ?auto_8372 ?auto_8376 ) ) ( not ( = ?auto_8372 ?auto_8375 ) ) ( not ( = ?auto_8372 ?auto_8379 ) ) ( not ( = ?auto_8374 ?auto_8384 ) ) ( not ( = ?auto_8374 ?auto_8385 ) ) ( not ( = ?auto_8374 ?auto_8383 ) ) ( not ( = ?auto_8374 ?auto_8378 ) ) ( not ( = ?auto_8374 ?auto_8371 ) ) ( not ( = ?auto_8357 ?auto_8364 ) ) ( not ( = ?auto_8357 ?auto_8368 ) ) ( not ( = ?auto_8358 ?auto_8364 ) ) ( not ( = ?auto_8358 ?auto_8368 ) ) ( not ( = ?auto_8359 ?auto_8364 ) ) ( not ( = ?auto_8359 ?auto_8368 ) ) ( not ( = ?auto_8360 ?auto_8364 ) ) ( not ( = ?auto_8360 ?auto_8368 ) ) ( not ( = ?auto_8361 ?auto_8364 ) ) ( not ( = ?auto_8361 ?auto_8368 ) ) ( not ( = ?auto_8362 ?auto_8364 ) ) ( not ( = ?auto_8362 ?auto_8368 ) ) ( not ( = ?auto_8364 ?auto_8374 ) ) ( not ( = ?auto_8364 ?auto_8384 ) ) ( not ( = ?auto_8364 ?auto_8385 ) ) ( not ( = ?auto_8364 ?auto_8383 ) ) ( not ( = ?auto_8364 ?auto_8378 ) ) ( not ( = ?auto_8364 ?auto_8371 ) ) ( not ( = ?auto_8368 ?auto_8374 ) ) ( not ( = ?auto_8368 ?auto_8384 ) ) ( not ( = ?auto_8368 ?auto_8385 ) ) ( not ( = ?auto_8368 ?auto_8383 ) ) ( not ( = ?auto_8368 ?auto_8378 ) ) ( not ( = ?auto_8368 ?auto_8371 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8357 ?auto_8358 ?auto_8359 ?auto_8360 ?auto_8361 ?auto_8362 ?auto_8363 )
      ( MAKE-1CRATE ?auto_8363 ?auto_8364 )
      ( MAKE-7CRATE-VERIFY ?auto_8357 ?auto_8358 ?auto_8359 ?auto_8360 ?auto_8361 ?auto_8362 ?auto_8363 ?auto_8364 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8406 - SURFACE
      ?auto_8407 - SURFACE
      ?auto_8408 - SURFACE
      ?auto_8409 - SURFACE
      ?auto_8410 - SURFACE
      ?auto_8411 - SURFACE
      ?auto_8412 - SURFACE
      ?auto_8413 - SURFACE
      ?auto_8414 - SURFACE
    )
    :vars
    (
      ?auto_8419 - HOIST
      ?auto_8415 - PLACE
      ?auto_8417 - PLACE
      ?auto_8418 - HOIST
      ?auto_8416 - SURFACE
      ?auto_8432 - PLACE
      ?auto_8422 - HOIST
      ?auto_8431 - SURFACE
      ?auto_8434 - PLACE
      ?auto_8427 - HOIST
      ?auto_8426 - SURFACE
      ?auto_8430 - SURFACE
      ?auto_8421 - PLACE
      ?auto_8423 - HOIST
      ?auto_8433 - SURFACE
      ?auto_8424 - PLACE
      ?auto_8425 - HOIST
      ?auto_8437 - SURFACE
      ?auto_8428 - PLACE
      ?auto_8438 - HOIST
      ?auto_8435 - SURFACE
      ?auto_8439 - PLACE
      ?auto_8429 - HOIST
      ?auto_8436 - SURFACE
      ?auto_8420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8419 ?auto_8415 ) ( IS-CRATE ?auto_8414 ) ( not ( = ?auto_8417 ?auto_8415 ) ) ( HOIST-AT ?auto_8418 ?auto_8417 ) ( AVAILABLE ?auto_8418 ) ( SURFACE-AT ?auto_8414 ?auto_8417 ) ( ON ?auto_8414 ?auto_8416 ) ( CLEAR ?auto_8414 ) ( not ( = ?auto_8413 ?auto_8414 ) ) ( not ( = ?auto_8413 ?auto_8416 ) ) ( not ( = ?auto_8414 ?auto_8416 ) ) ( not ( = ?auto_8419 ?auto_8418 ) ) ( IS-CRATE ?auto_8413 ) ( not ( = ?auto_8432 ?auto_8415 ) ) ( HOIST-AT ?auto_8422 ?auto_8432 ) ( SURFACE-AT ?auto_8413 ?auto_8432 ) ( ON ?auto_8413 ?auto_8431 ) ( CLEAR ?auto_8413 ) ( not ( = ?auto_8412 ?auto_8413 ) ) ( not ( = ?auto_8412 ?auto_8431 ) ) ( not ( = ?auto_8413 ?auto_8431 ) ) ( not ( = ?auto_8419 ?auto_8422 ) ) ( IS-CRATE ?auto_8412 ) ( not ( = ?auto_8434 ?auto_8415 ) ) ( HOIST-AT ?auto_8427 ?auto_8434 ) ( AVAILABLE ?auto_8427 ) ( SURFACE-AT ?auto_8412 ?auto_8434 ) ( ON ?auto_8412 ?auto_8426 ) ( CLEAR ?auto_8412 ) ( not ( = ?auto_8411 ?auto_8412 ) ) ( not ( = ?auto_8411 ?auto_8426 ) ) ( not ( = ?auto_8412 ?auto_8426 ) ) ( not ( = ?auto_8419 ?auto_8427 ) ) ( IS-CRATE ?auto_8411 ) ( AVAILABLE ?auto_8422 ) ( SURFACE-AT ?auto_8411 ?auto_8432 ) ( ON ?auto_8411 ?auto_8430 ) ( CLEAR ?auto_8411 ) ( not ( = ?auto_8410 ?auto_8411 ) ) ( not ( = ?auto_8410 ?auto_8430 ) ) ( not ( = ?auto_8411 ?auto_8430 ) ) ( IS-CRATE ?auto_8410 ) ( not ( = ?auto_8421 ?auto_8415 ) ) ( HOIST-AT ?auto_8423 ?auto_8421 ) ( AVAILABLE ?auto_8423 ) ( SURFACE-AT ?auto_8410 ?auto_8421 ) ( ON ?auto_8410 ?auto_8433 ) ( CLEAR ?auto_8410 ) ( not ( = ?auto_8409 ?auto_8410 ) ) ( not ( = ?auto_8409 ?auto_8433 ) ) ( not ( = ?auto_8410 ?auto_8433 ) ) ( not ( = ?auto_8419 ?auto_8423 ) ) ( IS-CRATE ?auto_8409 ) ( not ( = ?auto_8424 ?auto_8415 ) ) ( HOIST-AT ?auto_8425 ?auto_8424 ) ( AVAILABLE ?auto_8425 ) ( SURFACE-AT ?auto_8409 ?auto_8424 ) ( ON ?auto_8409 ?auto_8437 ) ( CLEAR ?auto_8409 ) ( not ( = ?auto_8408 ?auto_8409 ) ) ( not ( = ?auto_8408 ?auto_8437 ) ) ( not ( = ?auto_8409 ?auto_8437 ) ) ( not ( = ?auto_8419 ?auto_8425 ) ) ( IS-CRATE ?auto_8408 ) ( not ( = ?auto_8428 ?auto_8415 ) ) ( HOIST-AT ?auto_8438 ?auto_8428 ) ( AVAILABLE ?auto_8438 ) ( SURFACE-AT ?auto_8408 ?auto_8428 ) ( ON ?auto_8408 ?auto_8435 ) ( CLEAR ?auto_8408 ) ( not ( = ?auto_8407 ?auto_8408 ) ) ( not ( = ?auto_8407 ?auto_8435 ) ) ( not ( = ?auto_8408 ?auto_8435 ) ) ( not ( = ?auto_8419 ?auto_8438 ) ) ( SURFACE-AT ?auto_8406 ?auto_8415 ) ( CLEAR ?auto_8406 ) ( IS-CRATE ?auto_8407 ) ( AVAILABLE ?auto_8419 ) ( not ( = ?auto_8439 ?auto_8415 ) ) ( HOIST-AT ?auto_8429 ?auto_8439 ) ( AVAILABLE ?auto_8429 ) ( SURFACE-AT ?auto_8407 ?auto_8439 ) ( ON ?auto_8407 ?auto_8436 ) ( CLEAR ?auto_8407 ) ( TRUCK-AT ?auto_8420 ?auto_8415 ) ( not ( = ?auto_8406 ?auto_8407 ) ) ( not ( = ?auto_8406 ?auto_8436 ) ) ( not ( = ?auto_8407 ?auto_8436 ) ) ( not ( = ?auto_8419 ?auto_8429 ) ) ( not ( = ?auto_8406 ?auto_8408 ) ) ( not ( = ?auto_8406 ?auto_8435 ) ) ( not ( = ?auto_8408 ?auto_8436 ) ) ( not ( = ?auto_8428 ?auto_8439 ) ) ( not ( = ?auto_8438 ?auto_8429 ) ) ( not ( = ?auto_8435 ?auto_8436 ) ) ( not ( = ?auto_8406 ?auto_8409 ) ) ( not ( = ?auto_8406 ?auto_8437 ) ) ( not ( = ?auto_8407 ?auto_8409 ) ) ( not ( = ?auto_8407 ?auto_8437 ) ) ( not ( = ?auto_8409 ?auto_8435 ) ) ( not ( = ?auto_8409 ?auto_8436 ) ) ( not ( = ?auto_8424 ?auto_8428 ) ) ( not ( = ?auto_8424 ?auto_8439 ) ) ( not ( = ?auto_8425 ?auto_8438 ) ) ( not ( = ?auto_8425 ?auto_8429 ) ) ( not ( = ?auto_8437 ?auto_8435 ) ) ( not ( = ?auto_8437 ?auto_8436 ) ) ( not ( = ?auto_8406 ?auto_8410 ) ) ( not ( = ?auto_8406 ?auto_8433 ) ) ( not ( = ?auto_8407 ?auto_8410 ) ) ( not ( = ?auto_8407 ?auto_8433 ) ) ( not ( = ?auto_8408 ?auto_8410 ) ) ( not ( = ?auto_8408 ?auto_8433 ) ) ( not ( = ?auto_8410 ?auto_8437 ) ) ( not ( = ?auto_8410 ?auto_8435 ) ) ( not ( = ?auto_8410 ?auto_8436 ) ) ( not ( = ?auto_8421 ?auto_8424 ) ) ( not ( = ?auto_8421 ?auto_8428 ) ) ( not ( = ?auto_8421 ?auto_8439 ) ) ( not ( = ?auto_8423 ?auto_8425 ) ) ( not ( = ?auto_8423 ?auto_8438 ) ) ( not ( = ?auto_8423 ?auto_8429 ) ) ( not ( = ?auto_8433 ?auto_8437 ) ) ( not ( = ?auto_8433 ?auto_8435 ) ) ( not ( = ?auto_8433 ?auto_8436 ) ) ( not ( = ?auto_8406 ?auto_8411 ) ) ( not ( = ?auto_8406 ?auto_8430 ) ) ( not ( = ?auto_8407 ?auto_8411 ) ) ( not ( = ?auto_8407 ?auto_8430 ) ) ( not ( = ?auto_8408 ?auto_8411 ) ) ( not ( = ?auto_8408 ?auto_8430 ) ) ( not ( = ?auto_8409 ?auto_8411 ) ) ( not ( = ?auto_8409 ?auto_8430 ) ) ( not ( = ?auto_8411 ?auto_8433 ) ) ( not ( = ?auto_8411 ?auto_8437 ) ) ( not ( = ?auto_8411 ?auto_8435 ) ) ( not ( = ?auto_8411 ?auto_8436 ) ) ( not ( = ?auto_8432 ?auto_8421 ) ) ( not ( = ?auto_8432 ?auto_8424 ) ) ( not ( = ?auto_8432 ?auto_8428 ) ) ( not ( = ?auto_8432 ?auto_8439 ) ) ( not ( = ?auto_8422 ?auto_8423 ) ) ( not ( = ?auto_8422 ?auto_8425 ) ) ( not ( = ?auto_8422 ?auto_8438 ) ) ( not ( = ?auto_8422 ?auto_8429 ) ) ( not ( = ?auto_8430 ?auto_8433 ) ) ( not ( = ?auto_8430 ?auto_8437 ) ) ( not ( = ?auto_8430 ?auto_8435 ) ) ( not ( = ?auto_8430 ?auto_8436 ) ) ( not ( = ?auto_8406 ?auto_8412 ) ) ( not ( = ?auto_8406 ?auto_8426 ) ) ( not ( = ?auto_8407 ?auto_8412 ) ) ( not ( = ?auto_8407 ?auto_8426 ) ) ( not ( = ?auto_8408 ?auto_8412 ) ) ( not ( = ?auto_8408 ?auto_8426 ) ) ( not ( = ?auto_8409 ?auto_8412 ) ) ( not ( = ?auto_8409 ?auto_8426 ) ) ( not ( = ?auto_8410 ?auto_8412 ) ) ( not ( = ?auto_8410 ?auto_8426 ) ) ( not ( = ?auto_8412 ?auto_8430 ) ) ( not ( = ?auto_8412 ?auto_8433 ) ) ( not ( = ?auto_8412 ?auto_8437 ) ) ( not ( = ?auto_8412 ?auto_8435 ) ) ( not ( = ?auto_8412 ?auto_8436 ) ) ( not ( = ?auto_8434 ?auto_8432 ) ) ( not ( = ?auto_8434 ?auto_8421 ) ) ( not ( = ?auto_8434 ?auto_8424 ) ) ( not ( = ?auto_8434 ?auto_8428 ) ) ( not ( = ?auto_8434 ?auto_8439 ) ) ( not ( = ?auto_8427 ?auto_8422 ) ) ( not ( = ?auto_8427 ?auto_8423 ) ) ( not ( = ?auto_8427 ?auto_8425 ) ) ( not ( = ?auto_8427 ?auto_8438 ) ) ( not ( = ?auto_8427 ?auto_8429 ) ) ( not ( = ?auto_8426 ?auto_8430 ) ) ( not ( = ?auto_8426 ?auto_8433 ) ) ( not ( = ?auto_8426 ?auto_8437 ) ) ( not ( = ?auto_8426 ?auto_8435 ) ) ( not ( = ?auto_8426 ?auto_8436 ) ) ( not ( = ?auto_8406 ?auto_8413 ) ) ( not ( = ?auto_8406 ?auto_8431 ) ) ( not ( = ?auto_8407 ?auto_8413 ) ) ( not ( = ?auto_8407 ?auto_8431 ) ) ( not ( = ?auto_8408 ?auto_8413 ) ) ( not ( = ?auto_8408 ?auto_8431 ) ) ( not ( = ?auto_8409 ?auto_8413 ) ) ( not ( = ?auto_8409 ?auto_8431 ) ) ( not ( = ?auto_8410 ?auto_8413 ) ) ( not ( = ?auto_8410 ?auto_8431 ) ) ( not ( = ?auto_8411 ?auto_8413 ) ) ( not ( = ?auto_8411 ?auto_8431 ) ) ( not ( = ?auto_8413 ?auto_8426 ) ) ( not ( = ?auto_8413 ?auto_8430 ) ) ( not ( = ?auto_8413 ?auto_8433 ) ) ( not ( = ?auto_8413 ?auto_8437 ) ) ( not ( = ?auto_8413 ?auto_8435 ) ) ( not ( = ?auto_8413 ?auto_8436 ) ) ( not ( = ?auto_8431 ?auto_8426 ) ) ( not ( = ?auto_8431 ?auto_8430 ) ) ( not ( = ?auto_8431 ?auto_8433 ) ) ( not ( = ?auto_8431 ?auto_8437 ) ) ( not ( = ?auto_8431 ?auto_8435 ) ) ( not ( = ?auto_8431 ?auto_8436 ) ) ( not ( = ?auto_8406 ?auto_8414 ) ) ( not ( = ?auto_8406 ?auto_8416 ) ) ( not ( = ?auto_8407 ?auto_8414 ) ) ( not ( = ?auto_8407 ?auto_8416 ) ) ( not ( = ?auto_8408 ?auto_8414 ) ) ( not ( = ?auto_8408 ?auto_8416 ) ) ( not ( = ?auto_8409 ?auto_8414 ) ) ( not ( = ?auto_8409 ?auto_8416 ) ) ( not ( = ?auto_8410 ?auto_8414 ) ) ( not ( = ?auto_8410 ?auto_8416 ) ) ( not ( = ?auto_8411 ?auto_8414 ) ) ( not ( = ?auto_8411 ?auto_8416 ) ) ( not ( = ?auto_8412 ?auto_8414 ) ) ( not ( = ?auto_8412 ?auto_8416 ) ) ( not ( = ?auto_8414 ?auto_8431 ) ) ( not ( = ?auto_8414 ?auto_8426 ) ) ( not ( = ?auto_8414 ?auto_8430 ) ) ( not ( = ?auto_8414 ?auto_8433 ) ) ( not ( = ?auto_8414 ?auto_8437 ) ) ( not ( = ?auto_8414 ?auto_8435 ) ) ( not ( = ?auto_8414 ?auto_8436 ) ) ( not ( = ?auto_8417 ?auto_8432 ) ) ( not ( = ?auto_8417 ?auto_8434 ) ) ( not ( = ?auto_8417 ?auto_8421 ) ) ( not ( = ?auto_8417 ?auto_8424 ) ) ( not ( = ?auto_8417 ?auto_8428 ) ) ( not ( = ?auto_8417 ?auto_8439 ) ) ( not ( = ?auto_8418 ?auto_8422 ) ) ( not ( = ?auto_8418 ?auto_8427 ) ) ( not ( = ?auto_8418 ?auto_8423 ) ) ( not ( = ?auto_8418 ?auto_8425 ) ) ( not ( = ?auto_8418 ?auto_8438 ) ) ( not ( = ?auto_8418 ?auto_8429 ) ) ( not ( = ?auto_8416 ?auto_8431 ) ) ( not ( = ?auto_8416 ?auto_8426 ) ) ( not ( = ?auto_8416 ?auto_8430 ) ) ( not ( = ?auto_8416 ?auto_8433 ) ) ( not ( = ?auto_8416 ?auto_8437 ) ) ( not ( = ?auto_8416 ?auto_8435 ) ) ( not ( = ?auto_8416 ?auto_8436 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8406 ?auto_8407 ?auto_8408 ?auto_8409 ?auto_8410 ?auto_8411 ?auto_8412 ?auto_8413 )
      ( MAKE-1CRATE ?auto_8413 ?auto_8414 )
      ( MAKE-8CRATE-VERIFY ?auto_8406 ?auto_8407 ?auto_8408 ?auto_8409 ?auto_8410 ?auto_8411 ?auto_8412 ?auto_8413 ?auto_8414 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8460 - SURFACE
      ?auto_8461 - SURFACE
      ?auto_8462 - SURFACE
      ?auto_8463 - SURFACE
      ?auto_8464 - SURFACE
      ?auto_8465 - SURFACE
      ?auto_8466 - SURFACE
      ?auto_8467 - SURFACE
      ?auto_8468 - SURFACE
      ?auto_8469 - SURFACE
    )
    :vars
    (
      ?auto_8473 - HOIST
      ?auto_8475 - PLACE
      ?auto_8474 - PLACE
      ?auto_8470 - HOIST
      ?auto_8472 - SURFACE
      ?auto_8484 - PLACE
      ?auto_8485 - HOIST
      ?auto_8476 - SURFACE
      ?auto_8496 - PLACE
      ?auto_8493 - HOIST
      ?auto_8494 - SURFACE
      ?auto_8492 - PLACE
      ?auto_8478 - HOIST
      ?auto_8497 - SURFACE
      ?auto_8479 - SURFACE
      ?auto_8477 - PLACE
      ?auto_8488 - HOIST
      ?auto_8483 - SURFACE
      ?auto_8487 - PLACE
      ?auto_8490 - HOIST
      ?auto_8480 - SURFACE
      ?auto_8486 - PLACE
      ?auto_8489 - HOIST
      ?auto_8482 - SURFACE
      ?auto_8481 - PLACE
      ?auto_8495 - HOIST
      ?auto_8491 - SURFACE
      ?auto_8471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8473 ?auto_8475 ) ( IS-CRATE ?auto_8469 ) ( not ( = ?auto_8474 ?auto_8475 ) ) ( HOIST-AT ?auto_8470 ?auto_8474 ) ( AVAILABLE ?auto_8470 ) ( SURFACE-AT ?auto_8469 ?auto_8474 ) ( ON ?auto_8469 ?auto_8472 ) ( CLEAR ?auto_8469 ) ( not ( = ?auto_8468 ?auto_8469 ) ) ( not ( = ?auto_8468 ?auto_8472 ) ) ( not ( = ?auto_8469 ?auto_8472 ) ) ( not ( = ?auto_8473 ?auto_8470 ) ) ( IS-CRATE ?auto_8468 ) ( not ( = ?auto_8484 ?auto_8475 ) ) ( HOIST-AT ?auto_8485 ?auto_8484 ) ( AVAILABLE ?auto_8485 ) ( SURFACE-AT ?auto_8468 ?auto_8484 ) ( ON ?auto_8468 ?auto_8476 ) ( CLEAR ?auto_8468 ) ( not ( = ?auto_8467 ?auto_8468 ) ) ( not ( = ?auto_8467 ?auto_8476 ) ) ( not ( = ?auto_8468 ?auto_8476 ) ) ( not ( = ?auto_8473 ?auto_8485 ) ) ( IS-CRATE ?auto_8467 ) ( not ( = ?auto_8496 ?auto_8475 ) ) ( HOIST-AT ?auto_8493 ?auto_8496 ) ( SURFACE-AT ?auto_8467 ?auto_8496 ) ( ON ?auto_8467 ?auto_8494 ) ( CLEAR ?auto_8467 ) ( not ( = ?auto_8466 ?auto_8467 ) ) ( not ( = ?auto_8466 ?auto_8494 ) ) ( not ( = ?auto_8467 ?auto_8494 ) ) ( not ( = ?auto_8473 ?auto_8493 ) ) ( IS-CRATE ?auto_8466 ) ( not ( = ?auto_8492 ?auto_8475 ) ) ( HOIST-AT ?auto_8478 ?auto_8492 ) ( AVAILABLE ?auto_8478 ) ( SURFACE-AT ?auto_8466 ?auto_8492 ) ( ON ?auto_8466 ?auto_8497 ) ( CLEAR ?auto_8466 ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( not ( = ?auto_8465 ?auto_8497 ) ) ( not ( = ?auto_8466 ?auto_8497 ) ) ( not ( = ?auto_8473 ?auto_8478 ) ) ( IS-CRATE ?auto_8465 ) ( AVAILABLE ?auto_8493 ) ( SURFACE-AT ?auto_8465 ?auto_8496 ) ( ON ?auto_8465 ?auto_8479 ) ( CLEAR ?auto_8465 ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( not ( = ?auto_8464 ?auto_8479 ) ) ( not ( = ?auto_8465 ?auto_8479 ) ) ( IS-CRATE ?auto_8464 ) ( not ( = ?auto_8477 ?auto_8475 ) ) ( HOIST-AT ?auto_8488 ?auto_8477 ) ( AVAILABLE ?auto_8488 ) ( SURFACE-AT ?auto_8464 ?auto_8477 ) ( ON ?auto_8464 ?auto_8483 ) ( CLEAR ?auto_8464 ) ( not ( = ?auto_8463 ?auto_8464 ) ) ( not ( = ?auto_8463 ?auto_8483 ) ) ( not ( = ?auto_8464 ?auto_8483 ) ) ( not ( = ?auto_8473 ?auto_8488 ) ) ( IS-CRATE ?auto_8463 ) ( not ( = ?auto_8487 ?auto_8475 ) ) ( HOIST-AT ?auto_8490 ?auto_8487 ) ( AVAILABLE ?auto_8490 ) ( SURFACE-AT ?auto_8463 ?auto_8487 ) ( ON ?auto_8463 ?auto_8480 ) ( CLEAR ?auto_8463 ) ( not ( = ?auto_8462 ?auto_8463 ) ) ( not ( = ?auto_8462 ?auto_8480 ) ) ( not ( = ?auto_8463 ?auto_8480 ) ) ( not ( = ?auto_8473 ?auto_8490 ) ) ( IS-CRATE ?auto_8462 ) ( not ( = ?auto_8486 ?auto_8475 ) ) ( HOIST-AT ?auto_8489 ?auto_8486 ) ( AVAILABLE ?auto_8489 ) ( SURFACE-AT ?auto_8462 ?auto_8486 ) ( ON ?auto_8462 ?auto_8482 ) ( CLEAR ?auto_8462 ) ( not ( = ?auto_8461 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8482 ) ) ( not ( = ?auto_8462 ?auto_8482 ) ) ( not ( = ?auto_8473 ?auto_8489 ) ) ( SURFACE-AT ?auto_8460 ?auto_8475 ) ( CLEAR ?auto_8460 ) ( IS-CRATE ?auto_8461 ) ( AVAILABLE ?auto_8473 ) ( not ( = ?auto_8481 ?auto_8475 ) ) ( HOIST-AT ?auto_8495 ?auto_8481 ) ( AVAILABLE ?auto_8495 ) ( SURFACE-AT ?auto_8461 ?auto_8481 ) ( ON ?auto_8461 ?auto_8491 ) ( CLEAR ?auto_8461 ) ( TRUCK-AT ?auto_8471 ?auto_8475 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8491 ) ) ( not ( = ?auto_8461 ?auto_8491 ) ) ( not ( = ?auto_8473 ?auto_8495 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( not ( = ?auto_8460 ?auto_8482 ) ) ( not ( = ?auto_8462 ?auto_8491 ) ) ( not ( = ?auto_8486 ?auto_8481 ) ) ( not ( = ?auto_8489 ?auto_8495 ) ) ( not ( = ?auto_8482 ?auto_8491 ) ) ( not ( = ?auto_8460 ?auto_8463 ) ) ( not ( = ?auto_8460 ?auto_8480 ) ) ( not ( = ?auto_8461 ?auto_8463 ) ) ( not ( = ?auto_8461 ?auto_8480 ) ) ( not ( = ?auto_8463 ?auto_8482 ) ) ( not ( = ?auto_8463 ?auto_8491 ) ) ( not ( = ?auto_8487 ?auto_8486 ) ) ( not ( = ?auto_8487 ?auto_8481 ) ) ( not ( = ?auto_8490 ?auto_8489 ) ) ( not ( = ?auto_8490 ?auto_8495 ) ) ( not ( = ?auto_8480 ?auto_8482 ) ) ( not ( = ?auto_8480 ?auto_8491 ) ) ( not ( = ?auto_8460 ?auto_8464 ) ) ( not ( = ?auto_8460 ?auto_8483 ) ) ( not ( = ?auto_8461 ?auto_8464 ) ) ( not ( = ?auto_8461 ?auto_8483 ) ) ( not ( = ?auto_8462 ?auto_8464 ) ) ( not ( = ?auto_8462 ?auto_8483 ) ) ( not ( = ?auto_8464 ?auto_8480 ) ) ( not ( = ?auto_8464 ?auto_8482 ) ) ( not ( = ?auto_8464 ?auto_8491 ) ) ( not ( = ?auto_8477 ?auto_8487 ) ) ( not ( = ?auto_8477 ?auto_8486 ) ) ( not ( = ?auto_8477 ?auto_8481 ) ) ( not ( = ?auto_8488 ?auto_8490 ) ) ( not ( = ?auto_8488 ?auto_8489 ) ) ( not ( = ?auto_8488 ?auto_8495 ) ) ( not ( = ?auto_8483 ?auto_8480 ) ) ( not ( = ?auto_8483 ?auto_8482 ) ) ( not ( = ?auto_8483 ?auto_8491 ) ) ( not ( = ?auto_8460 ?auto_8465 ) ) ( not ( = ?auto_8460 ?auto_8479 ) ) ( not ( = ?auto_8461 ?auto_8465 ) ) ( not ( = ?auto_8461 ?auto_8479 ) ) ( not ( = ?auto_8462 ?auto_8465 ) ) ( not ( = ?auto_8462 ?auto_8479 ) ) ( not ( = ?auto_8463 ?auto_8465 ) ) ( not ( = ?auto_8463 ?auto_8479 ) ) ( not ( = ?auto_8465 ?auto_8483 ) ) ( not ( = ?auto_8465 ?auto_8480 ) ) ( not ( = ?auto_8465 ?auto_8482 ) ) ( not ( = ?auto_8465 ?auto_8491 ) ) ( not ( = ?auto_8496 ?auto_8477 ) ) ( not ( = ?auto_8496 ?auto_8487 ) ) ( not ( = ?auto_8496 ?auto_8486 ) ) ( not ( = ?auto_8496 ?auto_8481 ) ) ( not ( = ?auto_8493 ?auto_8488 ) ) ( not ( = ?auto_8493 ?auto_8490 ) ) ( not ( = ?auto_8493 ?auto_8489 ) ) ( not ( = ?auto_8493 ?auto_8495 ) ) ( not ( = ?auto_8479 ?auto_8483 ) ) ( not ( = ?auto_8479 ?auto_8480 ) ) ( not ( = ?auto_8479 ?auto_8482 ) ) ( not ( = ?auto_8479 ?auto_8491 ) ) ( not ( = ?auto_8460 ?auto_8466 ) ) ( not ( = ?auto_8460 ?auto_8497 ) ) ( not ( = ?auto_8461 ?auto_8466 ) ) ( not ( = ?auto_8461 ?auto_8497 ) ) ( not ( = ?auto_8462 ?auto_8466 ) ) ( not ( = ?auto_8462 ?auto_8497 ) ) ( not ( = ?auto_8463 ?auto_8466 ) ) ( not ( = ?auto_8463 ?auto_8497 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( not ( = ?auto_8464 ?auto_8497 ) ) ( not ( = ?auto_8466 ?auto_8479 ) ) ( not ( = ?auto_8466 ?auto_8483 ) ) ( not ( = ?auto_8466 ?auto_8480 ) ) ( not ( = ?auto_8466 ?auto_8482 ) ) ( not ( = ?auto_8466 ?auto_8491 ) ) ( not ( = ?auto_8492 ?auto_8496 ) ) ( not ( = ?auto_8492 ?auto_8477 ) ) ( not ( = ?auto_8492 ?auto_8487 ) ) ( not ( = ?auto_8492 ?auto_8486 ) ) ( not ( = ?auto_8492 ?auto_8481 ) ) ( not ( = ?auto_8478 ?auto_8493 ) ) ( not ( = ?auto_8478 ?auto_8488 ) ) ( not ( = ?auto_8478 ?auto_8490 ) ) ( not ( = ?auto_8478 ?auto_8489 ) ) ( not ( = ?auto_8478 ?auto_8495 ) ) ( not ( = ?auto_8497 ?auto_8479 ) ) ( not ( = ?auto_8497 ?auto_8483 ) ) ( not ( = ?auto_8497 ?auto_8480 ) ) ( not ( = ?auto_8497 ?auto_8482 ) ) ( not ( = ?auto_8497 ?auto_8491 ) ) ( not ( = ?auto_8460 ?auto_8467 ) ) ( not ( = ?auto_8460 ?auto_8494 ) ) ( not ( = ?auto_8461 ?auto_8467 ) ) ( not ( = ?auto_8461 ?auto_8494 ) ) ( not ( = ?auto_8462 ?auto_8467 ) ) ( not ( = ?auto_8462 ?auto_8494 ) ) ( not ( = ?auto_8463 ?auto_8467 ) ) ( not ( = ?auto_8463 ?auto_8494 ) ) ( not ( = ?auto_8464 ?auto_8467 ) ) ( not ( = ?auto_8464 ?auto_8494 ) ) ( not ( = ?auto_8465 ?auto_8467 ) ) ( not ( = ?auto_8465 ?auto_8494 ) ) ( not ( = ?auto_8467 ?auto_8497 ) ) ( not ( = ?auto_8467 ?auto_8479 ) ) ( not ( = ?auto_8467 ?auto_8483 ) ) ( not ( = ?auto_8467 ?auto_8480 ) ) ( not ( = ?auto_8467 ?auto_8482 ) ) ( not ( = ?auto_8467 ?auto_8491 ) ) ( not ( = ?auto_8494 ?auto_8497 ) ) ( not ( = ?auto_8494 ?auto_8479 ) ) ( not ( = ?auto_8494 ?auto_8483 ) ) ( not ( = ?auto_8494 ?auto_8480 ) ) ( not ( = ?auto_8494 ?auto_8482 ) ) ( not ( = ?auto_8494 ?auto_8491 ) ) ( not ( = ?auto_8460 ?auto_8468 ) ) ( not ( = ?auto_8460 ?auto_8476 ) ) ( not ( = ?auto_8461 ?auto_8468 ) ) ( not ( = ?auto_8461 ?auto_8476 ) ) ( not ( = ?auto_8462 ?auto_8468 ) ) ( not ( = ?auto_8462 ?auto_8476 ) ) ( not ( = ?auto_8463 ?auto_8468 ) ) ( not ( = ?auto_8463 ?auto_8476 ) ) ( not ( = ?auto_8464 ?auto_8468 ) ) ( not ( = ?auto_8464 ?auto_8476 ) ) ( not ( = ?auto_8465 ?auto_8468 ) ) ( not ( = ?auto_8465 ?auto_8476 ) ) ( not ( = ?auto_8466 ?auto_8468 ) ) ( not ( = ?auto_8466 ?auto_8476 ) ) ( not ( = ?auto_8468 ?auto_8494 ) ) ( not ( = ?auto_8468 ?auto_8497 ) ) ( not ( = ?auto_8468 ?auto_8479 ) ) ( not ( = ?auto_8468 ?auto_8483 ) ) ( not ( = ?auto_8468 ?auto_8480 ) ) ( not ( = ?auto_8468 ?auto_8482 ) ) ( not ( = ?auto_8468 ?auto_8491 ) ) ( not ( = ?auto_8484 ?auto_8496 ) ) ( not ( = ?auto_8484 ?auto_8492 ) ) ( not ( = ?auto_8484 ?auto_8477 ) ) ( not ( = ?auto_8484 ?auto_8487 ) ) ( not ( = ?auto_8484 ?auto_8486 ) ) ( not ( = ?auto_8484 ?auto_8481 ) ) ( not ( = ?auto_8485 ?auto_8493 ) ) ( not ( = ?auto_8485 ?auto_8478 ) ) ( not ( = ?auto_8485 ?auto_8488 ) ) ( not ( = ?auto_8485 ?auto_8490 ) ) ( not ( = ?auto_8485 ?auto_8489 ) ) ( not ( = ?auto_8485 ?auto_8495 ) ) ( not ( = ?auto_8476 ?auto_8494 ) ) ( not ( = ?auto_8476 ?auto_8497 ) ) ( not ( = ?auto_8476 ?auto_8479 ) ) ( not ( = ?auto_8476 ?auto_8483 ) ) ( not ( = ?auto_8476 ?auto_8480 ) ) ( not ( = ?auto_8476 ?auto_8482 ) ) ( not ( = ?auto_8476 ?auto_8491 ) ) ( not ( = ?auto_8460 ?auto_8469 ) ) ( not ( = ?auto_8460 ?auto_8472 ) ) ( not ( = ?auto_8461 ?auto_8469 ) ) ( not ( = ?auto_8461 ?auto_8472 ) ) ( not ( = ?auto_8462 ?auto_8469 ) ) ( not ( = ?auto_8462 ?auto_8472 ) ) ( not ( = ?auto_8463 ?auto_8469 ) ) ( not ( = ?auto_8463 ?auto_8472 ) ) ( not ( = ?auto_8464 ?auto_8469 ) ) ( not ( = ?auto_8464 ?auto_8472 ) ) ( not ( = ?auto_8465 ?auto_8469 ) ) ( not ( = ?auto_8465 ?auto_8472 ) ) ( not ( = ?auto_8466 ?auto_8469 ) ) ( not ( = ?auto_8466 ?auto_8472 ) ) ( not ( = ?auto_8467 ?auto_8469 ) ) ( not ( = ?auto_8467 ?auto_8472 ) ) ( not ( = ?auto_8469 ?auto_8476 ) ) ( not ( = ?auto_8469 ?auto_8494 ) ) ( not ( = ?auto_8469 ?auto_8497 ) ) ( not ( = ?auto_8469 ?auto_8479 ) ) ( not ( = ?auto_8469 ?auto_8483 ) ) ( not ( = ?auto_8469 ?auto_8480 ) ) ( not ( = ?auto_8469 ?auto_8482 ) ) ( not ( = ?auto_8469 ?auto_8491 ) ) ( not ( = ?auto_8474 ?auto_8484 ) ) ( not ( = ?auto_8474 ?auto_8496 ) ) ( not ( = ?auto_8474 ?auto_8492 ) ) ( not ( = ?auto_8474 ?auto_8477 ) ) ( not ( = ?auto_8474 ?auto_8487 ) ) ( not ( = ?auto_8474 ?auto_8486 ) ) ( not ( = ?auto_8474 ?auto_8481 ) ) ( not ( = ?auto_8470 ?auto_8485 ) ) ( not ( = ?auto_8470 ?auto_8493 ) ) ( not ( = ?auto_8470 ?auto_8478 ) ) ( not ( = ?auto_8470 ?auto_8488 ) ) ( not ( = ?auto_8470 ?auto_8490 ) ) ( not ( = ?auto_8470 ?auto_8489 ) ) ( not ( = ?auto_8470 ?auto_8495 ) ) ( not ( = ?auto_8472 ?auto_8476 ) ) ( not ( = ?auto_8472 ?auto_8494 ) ) ( not ( = ?auto_8472 ?auto_8497 ) ) ( not ( = ?auto_8472 ?auto_8479 ) ) ( not ( = ?auto_8472 ?auto_8483 ) ) ( not ( = ?auto_8472 ?auto_8480 ) ) ( not ( = ?auto_8472 ?auto_8482 ) ) ( not ( = ?auto_8472 ?auto_8491 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8466 ?auto_8467 ?auto_8468 )
      ( MAKE-1CRATE ?auto_8468 ?auto_8469 )
      ( MAKE-9CRATE-VERIFY ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8466 ?auto_8467 ?auto_8468 ?auto_8469 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8519 - SURFACE
      ?auto_8520 - SURFACE
      ?auto_8521 - SURFACE
      ?auto_8522 - SURFACE
      ?auto_8523 - SURFACE
      ?auto_8524 - SURFACE
      ?auto_8525 - SURFACE
      ?auto_8526 - SURFACE
      ?auto_8527 - SURFACE
      ?auto_8528 - SURFACE
      ?auto_8529 - SURFACE
    )
    :vars
    (
      ?auto_8532 - HOIST
      ?auto_8530 - PLACE
      ?auto_8533 - PLACE
      ?auto_8535 - HOIST
      ?auto_8534 - SURFACE
      ?auto_8541 - PLACE
      ?auto_8545 - HOIST
      ?auto_8546 - SURFACE
      ?auto_8537 - PLACE
      ?auto_8558 - HOIST
      ?auto_8542 - SURFACE
      ?auto_8555 - PLACE
      ?auto_8551 - HOIST
      ?auto_8540 - SURFACE
      ?auto_8559 - PLACE
      ?auto_8560 - HOIST
      ?auto_8557 - SURFACE
      ?auto_8547 - SURFACE
      ?auto_8543 - PLACE
      ?auto_8544 - HOIST
      ?auto_8556 - SURFACE
      ?auto_8553 - PLACE
      ?auto_8548 - HOIST
      ?auto_8552 - SURFACE
      ?auto_8538 - PLACE
      ?auto_8549 - HOIST
      ?auto_8550 - SURFACE
      ?auto_8539 - PLACE
      ?auto_8554 - HOIST
      ?auto_8536 - SURFACE
      ?auto_8531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8532 ?auto_8530 ) ( IS-CRATE ?auto_8529 ) ( not ( = ?auto_8533 ?auto_8530 ) ) ( HOIST-AT ?auto_8535 ?auto_8533 ) ( AVAILABLE ?auto_8535 ) ( SURFACE-AT ?auto_8529 ?auto_8533 ) ( ON ?auto_8529 ?auto_8534 ) ( CLEAR ?auto_8529 ) ( not ( = ?auto_8528 ?auto_8529 ) ) ( not ( = ?auto_8528 ?auto_8534 ) ) ( not ( = ?auto_8529 ?auto_8534 ) ) ( not ( = ?auto_8532 ?auto_8535 ) ) ( IS-CRATE ?auto_8528 ) ( not ( = ?auto_8541 ?auto_8530 ) ) ( HOIST-AT ?auto_8545 ?auto_8541 ) ( AVAILABLE ?auto_8545 ) ( SURFACE-AT ?auto_8528 ?auto_8541 ) ( ON ?auto_8528 ?auto_8546 ) ( CLEAR ?auto_8528 ) ( not ( = ?auto_8527 ?auto_8528 ) ) ( not ( = ?auto_8527 ?auto_8546 ) ) ( not ( = ?auto_8528 ?auto_8546 ) ) ( not ( = ?auto_8532 ?auto_8545 ) ) ( IS-CRATE ?auto_8527 ) ( not ( = ?auto_8537 ?auto_8530 ) ) ( HOIST-AT ?auto_8558 ?auto_8537 ) ( AVAILABLE ?auto_8558 ) ( SURFACE-AT ?auto_8527 ?auto_8537 ) ( ON ?auto_8527 ?auto_8542 ) ( CLEAR ?auto_8527 ) ( not ( = ?auto_8526 ?auto_8527 ) ) ( not ( = ?auto_8526 ?auto_8542 ) ) ( not ( = ?auto_8527 ?auto_8542 ) ) ( not ( = ?auto_8532 ?auto_8558 ) ) ( IS-CRATE ?auto_8526 ) ( not ( = ?auto_8555 ?auto_8530 ) ) ( HOIST-AT ?auto_8551 ?auto_8555 ) ( SURFACE-AT ?auto_8526 ?auto_8555 ) ( ON ?auto_8526 ?auto_8540 ) ( CLEAR ?auto_8526 ) ( not ( = ?auto_8525 ?auto_8526 ) ) ( not ( = ?auto_8525 ?auto_8540 ) ) ( not ( = ?auto_8526 ?auto_8540 ) ) ( not ( = ?auto_8532 ?auto_8551 ) ) ( IS-CRATE ?auto_8525 ) ( not ( = ?auto_8559 ?auto_8530 ) ) ( HOIST-AT ?auto_8560 ?auto_8559 ) ( AVAILABLE ?auto_8560 ) ( SURFACE-AT ?auto_8525 ?auto_8559 ) ( ON ?auto_8525 ?auto_8557 ) ( CLEAR ?auto_8525 ) ( not ( = ?auto_8524 ?auto_8525 ) ) ( not ( = ?auto_8524 ?auto_8557 ) ) ( not ( = ?auto_8525 ?auto_8557 ) ) ( not ( = ?auto_8532 ?auto_8560 ) ) ( IS-CRATE ?auto_8524 ) ( AVAILABLE ?auto_8551 ) ( SURFACE-AT ?auto_8524 ?auto_8555 ) ( ON ?auto_8524 ?auto_8547 ) ( CLEAR ?auto_8524 ) ( not ( = ?auto_8523 ?auto_8524 ) ) ( not ( = ?auto_8523 ?auto_8547 ) ) ( not ( = ?auto_8524 ?auto_8547 ) ) ( IS-CRATE ?auto_8523 ) ( not ( = ?auto_8543 ?auto_8530 ) ) ( HOIST-AT ?auto_8544 ?auto_8543 ) ( AVAILABLE ?auto_8544 ) ( SURFACE-AT ?auto_8523 ?auto_8543 ) ( ON ?auto_8523 ?auto_8556 ) ( CLEAR ?auto_8523 ) ( not ( = ?auto_8522 ?auto_8523 ) ) ( not ( = ?auto_8522 ?auto_8556 ) ) ( not ( = ?auto_8523 ?auto_8556 ) ) ( not ( = ?auto_8532 ?auto_8544 ) ) ( IS-CRATE ?auto_8522 ) ( not ( = ?auto_8553 ?auto_8530 ) ) ( HOIST-AT ?auto_8548 ?auto_8553 ) ( AVAILABLE ?auto_8548 ) ( SURFACE-AT ?auto_8522 ?auto_8553 ) ( ON ?auto_8522 ?auto_8552 ) ( CLEAR ?auto_8522 ) ( not ( = ?auto_8521 ?auto_8522 ) ) ( not ( = ?auto_8521 ?auto_8552 ) ) ( not ( = ?auto_8522 ?auto_8552 ) ) ( not ( = ?auto_8532 ?auto_8548 ) ) ( IS-CRATE ?auto_8521 ) ( not ( = ?auto_8538 ?auto_8530 ) ) ( HOIST-AT ?auto_8549 ?auto_8538 ) ( AVAILABLE ?auto_8549 ) ( SURFACE-AT ?auto_8521 ?auto_8538 ) ( ON ?auto_8521 ?auto_8550 ) ( CLEAR ?auto_8521 ) ( not ( = ?auto_8520 ?auto_8521 ) ) ( not ( = ?auto_8520 ?auto_8550 ) ) ( not ( = ?auto_8521 ?auto_8550 ) ) ( not ( = ?auto_8532 ?auto_8549 ) ) ( SURFACE-AT ?auto_8519 ?auto_8530 ) ( CLEAR ?auto_8519 ) ( IS-CRATE ?auto_8520 ) ( AVAILABLE ?auto_8532 ) ( not ( = ?auto_8539 ?auto_8530 ) ) ( HOIST-AT ?auto_8554 ?auto_8539 ) ( AVAILABLE ?auto_8554 ) ( SURFACE-AT ?auto_8520 ?auto_8539 ) ( ON ?auto_8520 ?auto_8536 ) ( CLEAR ?auto_8520 ) ( TRUCK-AT ?auto_8531 ?auto_8530 ) ( not ( = ?auto_8519 ?auto_8520 ) ) ( not ( = ?auto_8519 ?auto_8536 ) ) ( not ( = ?auto_8520 ?auto_8536 ) ) ( not ( = ?auto_8532 ?auto_8554 ) ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8550 ) ) ( not ( = ?auto_8521 ?auto_8536 ) ) ( not ( = ?auto_8538 ?auto_8539 ) ) ( not ( = ?auto_8549 ?auto_8554 ) ) ( not ( = ?auto_8550 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8522 ) ) ( not ( = ?auto_8519 ?auto_8552 ) ) ( not ( = ?auto_8520 ?auto_8522 ) ) ( not ( = ?auto_8520 ?auto_8552 ) ) ( not ( = ?auto_8522 ?auto_8550 ) ) ( not ( = ?auto_8522 ?auto_8536 ) ) ( not ( = ?auto_8553 ?auto_8538 ) ) ( not ( = ?auto_8553 ?auto_8539 ) ) ( not ( = ?auto_8548 ?auto_8549 ) ) ( not ( = ?auto_8548 ?auto_8554 ) ) ( not ( = ?auto_8552 ?auto_8550 ) ) ( not ( = ?auto_8552 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8523 ) ) ( not ( = ?auto_8519 ?auto_8556 ) ) ( not ( = ?auto_8520 ?auto_8523 ) ) ( not ( = ?auto_8520 ?auto_8556 ) ) ( not ( = ?auto_8521 ?auto_8523 ) ) ( not ( = ?auto_8521 ?auto_8556 ) ) ( not ( = ?auto_8523 ?auto_8552 ) ) ( not ( = ?auto_8523 ?auto_8550 ) ) ( not ( = ?auto_8523 ?auto_8536 ) ) ( not ( = ?auto_8543 ?auto_8553 ) ) ( not ( = ?auto_8543 ?auto_8538 ) ) ( not ( = ?auto_8543 ?auto_8539 ) ) ( not ( = ?auto_8544 ?auto_8548 ) ) ( not ( = ?auto_8544 ?auto_8549 ) ) ( not ( = ?auto_8544 ?auto_8554 ) ) ( not ( = ?auto_8556 ?auto_8552 ) ) ( not ( = ?auto_8556 ?auto_8550 ) ) ( not ( = ?auto_8556 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8524 ) ) ( not ( = ?auto_8519 ?auto_8547 ) ) ( not ( = ?auto_8520 ?auto_8524 ) ) ( not ( = ?auto_8520 ?auto_8547 ) ) ( not ( = ?auto_8521 ?auto_8524 ) ) ( not ( = ?auto_8521 ?auto_8547 ) ) ( not ( = ?auto_8522 ?auto_8524 ) ) ( not ( = ?auto_8522 ?auto_8547 ) ) ( not ( = ?auto_8524 ?auto_8556 ) ) ( not ( = ?auto_8524 ?auto_8552 ) ) ( not ( = ?auto_8524 ?auto_8550 ) ) ( not ( = ?auto_8524 ?auto_8536 ) ) ( not ( = ?auto_8555 ?auto_8543 ) ) ( not ( = ?auto_8555 ?auto_8553 ) ) ( not ( = ?auto_8555 ?auto_8538 ) ) ( not ( = ?auto_8555 ?auto_8539 ) ) ( not ( = ?auto_8551 ?auto_8544 ) ) ( not ( = ?auto_8551 ?auto_8548 ) ) ( not ( = ?auto_8551 ?auto_8549 ) ) ( not ( = ?auto_8551 ?auto_8554 ) ) ( not ( = ?auto_8547 ?auto_8556 ) ) ( not ( = ?auto_8547 ?auto_8552 ) ) ( not ( = ?auto_8547 ?auto_8550 ) ) ( not ( = ?auto_8547 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8525 ) ) ( not ( = ?auto_8519 ?auto_8557 ) ) ( not ( = ?auto_8520 ?auto_8525 ) ) ( not ( = ?auto_8520 ?auto_8557 ) ) ( not ( = ?auto_8521 ?auto_8525 ) ) ( not ( = ?auto_8521 ?auto_8557 ) ) ( not ( = ?auto_8522 ?auto_8525 ) ) ( not ( = ?auto_8522 ?auto_8557 ) ) ( not ( = ?auto_8523 ?auto_8525 ) ) ( not ( = ?auto_8523 ?auto_8557 ) ) ( not ( = ?auto_8525 ?auto_8547 ) ) ( not ( = ?auto_8525 ?auto_8556 ) ) ( not ( = ?auto_8525 ?auto_8552 ) ) ( not ( = ?auto_8525 ?auto_8550 ) ) ( not ( = ?auto_8525 ?auto_8536 ) ) ( not ( = ?auto_8559 ?auto_8555 ) ) ( not ( = ?auto_8559 ?auto_8543 ) ) ( not ( = ?auto_8559 ?auto_8553 ) ) ( not ( = ?auto_8559 ?auto_8538 ) ) ( not ( = ?auto_8559 ?auto_8539 ) ) ( not ( = ?auto_8560 ?auto_8551 ) ) ( not ( = ?auto_8560 ?auto_8544 ) ) ( not ( = ?auto_8560 ?auto_8548 ) ) ( not ( = ?auto_8560 ?auto_8549 ) ) ( not ( = ?auto_8560 ?auto_8554 ) ) ( not ( = ?auto_8557 ?auto_8547 ) ) ( not ( = ?auto_8557 ?auto_8556 ) ) ( not ( = ?auto_8557 ?auto_8552 ) ) ( not ( = ?auto_8557 ?auto_8550 ) ) ( not ( = ?auto_8557 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8526 ) ) ( not ( = ?auto_8519 ?auto_8540 ) ) ( not ( = ?auto_8520 ?auto_8526 ) ) ( not ( = ?auto_8520 ?auto_8540 ) ) ( not ( = ?auto_8521 ?auto_8526 ) ) ( not ( = ?auto_8521 ?auto_8540 ) ) ( not ( = ?auto_8522 ?auto_8526 ) ) ( not ( = ?auto_8522 ?auto_8540 ) ) ( not ( = ?auto_8523 ?auto_8526 ) ) ( not ( = ?auto_8523 ?auto_8540 ) ) ( not ( = ?auto_8524 ?auto_8526 ) ) ( not ( = ?auto_8524 ?auto_8540 ) ) ( not ( = ?auto_8526 ?auto_8557 ) ) ( not ( = ?auto_8526 ?auto_8547 ) ) ( not ( = ?auto_8526 ?auto_8556 ) ) ( not ( = ?auto_8526 ?auto_8552 ) ) ( not ( = ?auto_8526 ?auto_8550 ) ) ( not ( = ?auto_8526 ?auto_8536 ) ) ( not ( = ?auto_8540 ?auto_8557 ) ) ( not ( = ?auto_8540 ?auto_8547 ) ) ( not ( = ?auto_8540 ?auto_8556 ) ) ( not ( = ?auto_8540 ?auto_8552 ) ) ( not ( = ?auto_8540 ?auto_8550 ) ) ( not ( = ?auto_8540 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8527 ) ) ( not ( = ?auto_8519 ?auto_8542 ) ) ( not ( = ?auto_8520 ?auto_8527 ) ) ( not ( = ?auto_8520 ?auto_8542 ) ) ( not ( = ?auto_8521 ?auto_8527 ) ) ( not ( = ?auto_8521 ?auto_8542 ) ) ( not ( = ?auto_8522 ?auto_8527 ) ) ( not ( = ?auto_8522 ?auto_8542 ) ) ( not ( = ?auto_8523 ?auto_8527 ) ) ( not ( = ?auto_8523 ?auto_8542 ) ) ( not ( = ?auto_8524 ?auto_8527 ) ) ( not ( = ?auto_8524 ?auto_8542 ) ) ( not ( = ?auto_8525 ?auto_8527 ) ) ( not ( = ?auto_8525 ?auto_8542 ) ) ( not ( = ?auto_8527 ?auto_8540 ) ) ( not ( = ?auto_8527 ?auto_8557 ) ) ( not ( = ?auto_8527 ?auto_8547 ) ) ( not ( = ?auto_8527 ?auto_8556 ) ) ( not ( = ?auto_8527 ?auto_8552 ) ) ( not ( = ?auto_8527 ?auto_8550 ) ) ( not ( = ?auto_8527 ?auto_8536 ) ) ( not ( = ?auto_8537 ?auto_8555 ) ) ( not ( = ?auto_8537 ?auto_8559 ) ) ( not ( = ?auto_8537 ?auto_8543 ) ) ( not ( = ?auto_8537 ?auto_8553 ) ) ( not ( = ?auto_8537 ?auto_8538 ) ) ( not ( = ?auto_8537 ?auto_8539 ) ) ( not ( = ?auto_8558 ?auto_8551 ) ) ( not ( = ?auto_8558 ?auto_8560 ) ) ( not ( = ?auto_8558 ?auto_8544 ) ) ( not ( = ?auto_8558 ?auto_8548 ) ) ( not ( = ?auto_8558 ?auto_8549 ) ) ( not ( = ?auto_8558 ?auto_8554 ) ) ( not ( = ?auto_8542 ?auto_8540 ) ) ( not ( = ?auto_8542 ?auto_8557 ) ) ( not ( = ?auto_8542 ?auto_8547 ) ) ( not ( = ?auto_8542 ?auto_8556 ) ) ( not ( = ?auto_8542 ?auto_8552 ) ) ( not ( = ?auto_8542 ?auto_8550 ) ) ( not ( = ?auto_8542 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8528 ) ) ( not ( = ?auto_8519 ?auto_8546 ) ) ( not ( = ?auto_8520 ?auto_8528 ) ) ( not ( = ?auto_8520 ?auto_8546 ) ) ( not ( = ?auto_8521 ?auto_8528 ) ) ( not ( = ?auto_8521 ?auto_8546 ) ) ( not ( = ?auto_8522 ?auto_8528 ) ) ( not ( = ?auto_8522 ?auto_8546 ) ) ( not ( = ?auto_8523 ?auto_8528 ) ) ( not ( = ?auto_8523 ?auto_8546 ) ) ( not ( = ?auto_8524 ?auto_8528 ) ) ( not ( = ?auto_8524 ?auto_8546 ) ) ( not ( = ?auto_8525 ?auto_8528 ) ) ( not ( = ?auto_8525 ?auto_8546 ) ) ( not ( = ?auto_8526 ?auto_8528 ) ) ( not ( = ?auto_8526 ?auto_8546 ) ) ( not ( = ?auto_8528 ?auto_8542 ) ) ( not ( = ?auto_8528 ?auto_8540 ) ) ( not ( = ?auto_8528 ?auto_8557 ) ) ( not ( = ?auto_8528 ?auto_8547 ) ) ( not ( = ?auto_8528 ?auto_8556 ) ) ( not ( = ?auto_8528 ?auto_8552 ) ) ( not ( = ?auto_8528 ?auto_8550 ) ) ( not ( = ?auto_8528 ?auto_8536 ) ) ( not ( = ?auto_8541 ?auto_8537 ) ) ( not ( = ?auto_8541 ?auto_8555 ) ) ( not ( = ?auto_8541 ?auto_8559 ) ) ( not ( = ?auto_8541 ?auto_8543 ) ) ( not ( = ?auto_8541 ?auto_8553 ) ) ( not ( = ?auto_8541 ?auto_8538 ) ) ( not ( = ?auto_8541 ?auto_8539 ) ) ( not ( = ?auto_8545 ?auto_8558 ) ) ( not ( = ?auto_8545 ?auto_8551 ) ) ( not ( = ?auto_8545 ?auto_8560 ) ) ( not ( = ?auto_8545 ?auto_8544 ) ) ( not ( = ?auto_8545 ?auto_8548 ) ) ( not ( = ?auto_8545 ?auto_8549 ) ) ( not ( = ?auto_8545 ?auto_8554 ) ) ( not ( = ?auto_8546 ?auto_8542 ) ) ( not ( = ?auto_8546 ?auto_8540 ) ) ( not ( = ?auto_8546 ?auto_8557 ) ) ( not ( = ?auto_8546 ?auto_8547 ) ) ( not ( = ?auto_8546 ?auto_8556 ) ) ( not ( = ?auto_8546 ?auto_8552 ) ) ( not ( = ?auto_8546 ?auto_8550 ) ) ( not ( = ?auto_8546 ?auto_8536 ) ) ( not ( = ?auto_8519 ?auto_8529 ) ) ( not ( = ?auto_8519 ?auto_8534 ) ) ( not ( = ?auto_8520 ?auto_8529 ) ) ( not ( = ?auto_8520 ?auto_8534 ) ) ( not ( = ?auto_8521 ?auto_8529 ) ) ( not ( = ?auto_8521 ?auto_8534 ) ) ( not ( = ?auto_8522 ?auto_8529 ) ) ( not ( = ?auto_8522 ?auto_8534 ) ) ( not ( = ?auto_8523 ?auto_8529 ) ) ( not ( = ?auto_8523 ?auto_8534 ) ) ( not ( = ?auto_8524 ?auto_8529 ) ) ( not ( = ?auto_8524 ?auto_8534 ) ) ( not ( = ?auto_8525 ?auto_8529 ) ) ( not ( = ?auto_8525 ?auto_8534 ) ) ( not ( = ?auto_8526 ?auto_8529 ) ) ( not ( = ?auto_8526 ?auto_8534 ) ) ( not ( = ?auto_8527 ?auto_8529 ) ) ( not ( = ?auto_8527 ?auto_8534 ) ) ( not ( = ?auto_8529 ?auto_8546 ) ) ( not ( = ?auto_8529 ?auto_8542 ) ) ( not ( = ?auto_8529 ?auto_8540 ) ) ( not ( = ?auto_8529 ?auto_8557 ) ) ( not ( = ?auto_8529 ?auto_8547 ) ) ( not ( = ?auto_8529 ?auto_8556 ) ) ( not ( = ?auto_8529 ?auto_8552 ) ) ( not ( = ?auto_8529 ?auto_8550 ) ) ( not ( = ?auto_8529 ?auto_8536 ) ) ( not ( = ?auto_8533 ?auto_8541 ) ) ( not ( = ?auto_8533 ?auto_8537 ) ) ( not ( = ?auto_8533 ?auto_8555 ) ) ( not ( = ?auto_8533 ?auto_8559 ) ) ( not ( = ?auto_8533 ?auto_8543 ) ) ( not ( = ?auto_8533 ?auto_8553 ) ) ( not ( = ?auto_8533 ?auto_8538 ) ) ( not ( = ?auto_8533 ?auto_8539 ) ) ( not ( = ?auto_8535 ?auto_8545 ) ) ( not ( = ?auto_8535 ?auto_8558 ) ) ( not ( = ?auto_8535 ?auto_8551 ) ) ( not ( = ?auto_8535 ?auto_8560 ) ) ( not ( = ?auto_8535 ?auto_8544 ) ) ( not ( = ?auto_8535 ?auto_8548 ) ) ( not ( = ?auto_8535 ?auto_8549 ) ) ( not ( = ?auto_8535 ?auto_8554 ) ) ( not ( = ?auto_8534 ?auto_8546 ) ) ( not ( = ?auto_8534 ?auto_8542 ) ) ( not ( = ?auto_8534 ?auto_8540 ) ) ( not ( = ?auto_8534 ?auto_8557 ) ) ( not ( = ?auto_8534 ?auto_8547 ) ) ( not ( = ?auto_8534 ?auto_8556 ) ) ( not ( = ?auto_8534 ?auto_8552 ) ) ( not ( = ?auto_8534 ?auto_8550 ) ) ( not ( = ?auto_8534 ?auto_8536 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8519 ?auto_8520 ?auto_8521 ?auto_8522 ?auto_8523 ?auto_8524 ?auto_8525 ?auto_8526 ?auto_8527 ?auto_8528 )
      ( MAKE-1CRATE ?auto_8528 ?auto_8529 )
      ( MAKE-10CRATE-VERIFY ?auto_8519 ?auto_8520 ?auto_8521 ?auto_8522 ?auto_8523 ?auto_8524 ?auto_8525 ?auto_8526 ?auto_8527 ?auto_8528 ?auto_8529 ) )
  )

)

