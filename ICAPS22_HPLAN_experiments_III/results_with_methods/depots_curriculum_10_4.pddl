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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8166 - SURFACE
      ?auto_8167 - SURFACE
    )
    :vars
    (
      ?auto_8168 - HOIST
      ?auto_8169 - PLACE
      ?auto_8171 - PLACE
      ?auto_8172 - HOIST
      ?auto_8173 - SURFACE
      ?auto_8170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8168 ?auto_8169 ) ( SURFACE-AT ?auto_8166 ?auto_8169 ) ( CLEAR ?auto_8166 ) ( IS-CRATE ?auto_8167 ) ( AVAILABLE ?auto_8168 ) ( not ( = ?auto_8171 ?auto_8169 ) ) ( HOIST-AT ?auto_8172 ?auto_8171 ) ( AVAILABLE ?auto_8172 ) ( SURFACE-AT ?auto_8167 ?auto_8171 ) ( ON ?auto_8167 ?auto_8173 ) ( CLEAR ?auto_8167 ) ( TRUCK-AT ?auto_8170 ?auto_8169 ) ( not ( = ?auto_8166 ?auto_8167 ) ) ( not ( = ?auto_8166 ?auto_8173 ) ) ( not ( = ?auto_8167 ?auto_8173 ) ) ( not ( = ?auto_8168 ?auto_8172 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8170 ?auto_8169 ?auto_8171 )
      ( !LIFT ?auto_8172 ?auto_8167 ?auto_8173 ?auto_8171 )
      ( !LOAD ?auto_8172 ?auto_8167 ?auto_8170 ?auto_8171 )
      ( !DRIVE ?auto_8170 ?auto_8171 ?auto_8169 )
      ( !UNLOAD ?auto_8168 ?auto_8167 ?auto_8170 ?auto_8169 )
      ( !DROP ?auto_8168 ?auto_8167 ?auto_8166 ?auto_8169 )
      ( MAKE-1CRATE-VERIFY ?auto_8166 ?auto_8167 ) )
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
      ?auto_8181 - HOIST
      ?auto_8184 - PLACE
      ?auto_8183 - PLACE
      ?auto_8180 - HOIST
      ?auto_8182 - SURFACE
      ?auto_8186 - PLACE
      ?auto_8188 - HOIST
      ?auto_8187 - SURFACE
      ?auto_8185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8181 ?auto_8184 ) ( IS-CRATE ?auto_8179 ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( HOIST-AT ?auto_8180 ?auto_8183 ) ( AVAILABLE ?auto_8180 ) ( SURFACE-AT ?auto_8179 ?auto_8183 ) ( ON ?auto_8179 ?auto_8182 ) ( CLEAR ?auto_8179 ) ( not ( = ?auto_8178 ?auto_8179 ) ) ( not ( = ?auto_8178 ?auto_8182 ) ) ( not ( = ?auto_8179 ?auto_8182 ) ) ( not ( = ?auto_8181 ?auto_8180 ) ) ( SURFACE-AT ?auto_8177 ?auto_8184 ) ( CLEAR ?auto_8177 ) ( IS-CRATE ?auto_8178 ) ( AVAILABLE ?auto_8181 ) ( not ( = ?auto_8186 ?auto_8184 ) ) ( HOIST-AT ?auto_8188 ?auto_8186 ) ( AVAILABLE ?auto_8188 ) ( SURFACE-AT ?auto_8178 ?auto_8186 ) ( ON ?auto_8178 ?auto_8187 ) ( CLEAR ?auto_8178 ) ( TRUCK-AT ?auto_8185 ?auto_8184 ) ( not ( = ?auto_8177 ?auto_8178 ) ) ( not ( = ?auto_8177 ?auto_8187 ) ) ( not ( = ?auto_8178 ?auto_8187 ) ) ( not ( = ?auto_8181 ?auto_8188 ) ) ( not ( = ?auto_8177 ?auto_8179 ) ) ( not ( = ?auto_8177 ?auto_8182 ) ) ( not ( = ?auto_8179 ?auto_8187 ) ) ( not ( = ?auto_8183 ?auto_8186 ) ) ( not ( = ?auto_8180 ?auto_8188 ) ) ( not ( = ?auto_8182 ?auto_8187 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8177 ?auto_8178 )
      ( MAKE-1CRATE ?auto_8178 ?auto_8179 )
      ( MAKE-2CRATE-VERIFY ?auto_8177 ?auto_8178 ?auto_8179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8191 - SURFACE
      ?auto_8192 - SURFACE
    )
    :vars
    (
      ?auto_8193 - HOIST
      ?auto_8194 - PLACE
      ?auto_8196 - PLACE
      ?auto_8197 - HOIST
      ?auto_8198 - SURFACE
      ?auto_8195 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8193 ?auto_8194 ) ( SURFACE-AT ?auto_8191 ?auto_8194 ) ( CLEAR ?auto_8191 ) ( IS-CRATE ?auto_8192 ) ( AVAILABLE ?auto_8193 ) ( not ( = ?auto_8196 ?auto_8194 ) ) ( HOIST-AT ?auto_8197 ?auto_8196 ) ( AVAILABLE ?auto_8197 ) ( SURFACE-AT ?auto_8192 ?auto_8196 ) ( ON ?auto_8192 ?auto_8198 ) ( CLEAR ?auto_8192 ) ( TRUCK-AT ?auto_8195 ?auto_8194 ) ( not ( = ?auto_8191 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8198 ) ) ( not ( = ?auto_8192 ?auto_8198 ) ) ( not ( = ?auto_8193 ?auto_8197 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8195 ?auto_8194 ?auto_8196 )
      ( !LIFT ?auto_8197 ?auto_8192 ?auto_8198 ?auto_8196 )
      ( !LOAD ?auto_8197 ?auto_8192 ?auto_8195 ?auto_8196 )
      ( !DRIVE ?auto_8195 ?auto_8196 ?auto_8194 )
      ( !UNLOAD ?auto_8193 ?auto_8192 ?auto_8195 ?auto_8194 )
      ( !DROP ?auto_8193 ?auto_8192 ?auto_8191 ?auto_8194 )
      ( MAKE-1CRATE-VERIFY ?auto_8191 ?auto_8192 ) )
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
      ?auto_8210 - HOIST
      ?auto_8208 - PLACE
      ?auto_8212 - PLACE
      ?auto_8211 - HOIST
      ?auto_8207 - SURFACE
      ?auto_8218 - PLACE
      ?auto_8217 - HOIST
      ?auto_8216 - SURFACE
      ?auto_8213 - PLACE
      ?auto_8214 - HOIST
      ?auto_8215 - SURFACE
      ?auto_8209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8210 ?auto_8208 ) ( IS-CRATE ?auto_8206 ) ( not ( = ?auto_8212 ?auto_8208 ) ) ( HOIST-AT ?auto_8211 ?auto_8212 ) ( AVAILABLE ?auto_8211 ) ( SURFACE-AT ?auto_8206 ?auto_8212 ) ( ON ?auto_8206 ?auto_8207 ) ( CLEAR ?auto_8206 ) ( not ( = ?auto_8205 ?auto_8206 ) ) ( not ( = ?auto_8205 ?auto_8207 ) ) ( not ( = ?auto_8206 ?auto_8207 ) ) ( not ( = ?auto_8210 ?auto_8211 ) ) ( IS-CRATE ?auto_8205 ) ( not ( = ?auto_8218 ?auto_8208 ) ) ( HOIST-AT ?auto_8217 ?auto_8218 ) ( AVAILABLE ?auto_8217 ) ( SURFACE-AT ?auto_8205 ?auto_8218 ) ( ON ?auto_8205 ?auto_8216 ) ( CLEAR ?auto_8205 ) ( not ( = ?auto_8204 ?auto_8205 ) ) ( not ( = ?auto_8204 ?auto_8216 ) ) ( not ( = ?auto_8205 ?auto_8216 ) ) ( not ( = ?auto_8210 ?auto_8217 ) ) ( SURFACE-AT ?auto_8203 ?auto_8208 ) ( CLEAR ?auto_8203 ) ( IS-CRATE ?auto_8204 ) ( AVAILABLE ?auto_8210 ) ( not ( = ?auto_8213 ?auto_8208 ) ) ( HOIST-AT ?auto_8214 ?auto_8213 ) ( AVAILABLE ?auto_8214 ) ( SURFACE-AT ?auto_8204 ?auto_8213 ) ( ON ?auto_8204 ?auto_8215 ) ( CLEAR ?auto_8204 ) ( TRUCK-AT ?auto_8209 ?auto_8208 ) ( not ( = ?auto_8203 ?auto_8204 ) ) ( not ( = ?auto_8203 ?auto_8215 ) ) ( not ( = ?auto_8204 ?auto_8215 ) ) ( not ( = ?auto_8210 ?auto_8214 ) ) ( not ( = ?auto_8203 ?auto_8205 ) ) ( not ( = ?auto_8203 ?auto_8216 ) ) ( not ( = ?auto_8205 ?auto_8215 ) ) ( not ( = ?auto_8218 ?auto_8213 ) ) ( not ( = ?auto_8217 ?auto_8214 ) ) ( not ( = ?auto_8216 ?auto_8215 ) ) ( not ( = ?auto_8203 ?auto_8206 ) ) ( not ( = ?auto_8203 ?auto_8207 ) ) ( not ( = ?auto_8204 ?auto_8206 ) ) ( not ( = ?auto_8204 ?auto_8207 ) ) ( not ( = ?auto_8206 ?auto_8216 ) ) ( not ( = ?auto_8206 ?auto_8215 ) ) ( not ( = ?auto_8212 ?auto_8218 ) ) ( not ( = ?auto_8212 ?auto_8213 ) ) ( not ( = ?auto_8211 ?auto_8217 ) ) ( not ( = ?auto_8211 ?auto_8214 ) ) ( not ( = ?auto_8207 ?auto_8216 ) ) ( not ( = ?auto_8207 ?auto_8215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8203 ?auto_8204 ?auto_8205 )
      ( MAKE-1CRATE ?auto_8205 ?auto_8206 )
      ( MAKE-3CRATE-VERIFY ?auto_8203 ?auto_8204 ?auto_8205 ?auto_8206 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8221 - SURFACE
      ?auto_8222 - SURFACE
    )
    :vars
    (
      ?auto_8223 - HOIST
      ?auto_8224 - PLACE
      ?auto_8226 - PLACE
      ?auto_8227 - HOIST
      ?auto_8228 - SURFACE
      ?auto_8225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8223 ?auto_8224 ) ( SURFACE-AT ?auto_8221 ?auto_8224 ) ( CLEAR ?auto_8221 ) ( IS-CRATE ?auto_8222 ) ( AVAILABLE ?auto_8223 ) ( not ( = ?auto_8226 ?auto_8224 ) ) ( HOIST-AT ?auto_8227 ?auto_8226 ) ( AVAILABLE ?auto_8227 ) ( SURFACE-AT ?auto_8222 ?auto_8226 ) ( ON ?auto_8222 ?auto_8228 ) ( CLEAR ?auto_8222 ) ( TRUCK-AT ?auto_8225 ?auto_8224 ) ( not ( = ?auto_8221 ?auto_8222 ) ) ( not ( = ?auto_8221 ?auto_8228 ) ) ( not ( = ?auto_8222 ?auto_8228 ) ) ( not ( = ?auto_8223 ?auto_8227 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8225 ?auto_8224 ?auto_8226 )
      ( !LIFT ?auto_8227 ?auto_8222 ?auto_8228 ?auto_8226 )
      ( !LOAD ?auto_8227 ?auto_8222 ?auto_8225 ?auto_8226 )
      ( !DRIVE ?auto_8225 ?auto_8226 ?auto_8224 )
      ( !UNLOAD ?auto_8223 ?auto_8222 ?auto_8225 ?auto_8224 )
      ( !DROP ?auto_8223 ?auto_8222 ?auto_8221 ?auto_8224 )
      ( MAKE-1CRATE-VERIFY ?auto_8221 ?auto_8222 ) )
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
      ?auto_8243 - HOIST
      ?auto_8241 - PLACE
      ?auto_8240 - PLACE
      ?auto_8242 - HOIST
      ?auto_8239 - SURFACE
      ?auto_8245 - PLACE
      ?auto_8252 - HOIST
      ?auto_8253 - SURFACE
      ?auto_8251 - PLACE
      ?auto_8248 - HOIST
      ?auto_8249 - SURFACE
      ?auto_8246 - PLACE
      ?auto_8247 - HOIST
      ?auto_8250 - SURFACE
      ?auto_8244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8243 ?auto_8241 ) ( IS-CRATE ?auto_8238 ) ( not ( = ?auto_8240 ?auto_8241 ) ) ( HOIST-AT ?auto_8242 ?auto_8240 ) ( AVAILABLE ?auto_8242 ) ( SURFACE-AT ?auto_8238 ?auto_8240 ) ( ON ?auto_8238 ?auto_8239 ) ( CLEAR ?auto_8238 ) ( not ( = ?auto_8237 ?auto_8238 ) ) ( not ( = ?auto_8237 ?auto_8239 ) ) ( not ( = ?auto_8238 ?auto_8239 ) ) ( not ( = ?auto_8243 ?auto_8242 ) ) ( IS-CRATE ?auto_8237 ) ( not ( = ?auto_8245 ?auto_8241 ) ) ( HOIST-AT ?auto_8252 ?auto_8245 ) ( AVAILABLE ?auto_8252 ) ( SURFACE-AT ?auto_8237 ?auto_8245 ) ( ON ?auto_8237 ?auto_8253 ) ( CLEAR ?auto_8237 ) ( not ( = ?auto_8236 ?auto_8237 ) ) ( not ( = ?auto_8236 ?auto_8253 ) ) ( not ( = ?auto_8237 ?auto_8253 ) ) ( not ( = ?auto_8243 ?auto_8252 ) ) ( IS-CRATE ?auto_8236 ) ( not ( = ?auto_8251 ?auto_8241 ) ) ( HOIST-AT ?auto_8248 ?auto_8251 ) ( AVAILABLE ?auto_8248 ) ( SURFACE-AT ?auto_8236 ?auto_8251 ) ( ON ?auto_8236 ?auto_8249 ) ( CLEAR ?auto_8236 ) ( not ( = ?auto_8235 ?auto_8236 ) ) ( not ( = ?auto_8235 ?auto_8249 ) ) ( not ( = ?auto_8236 ?auto_8249 ) ) ( not ( = ?auto_8243 ?auto_8248 ) ) ( SURFACE-AT ?auto_8234 ?auto_8241 ) ( CLEAR ?auto_8234 ) ( IS-CRATE ?auto_8235 ) ( AVAILABLE ?auto_8243 ) ( not ( = ?auto_8246 ?auto_8241 ) ) ( HOIST-AT ?auto_8247 ?auto_8246 ) ( AVAILABLE ?auto_8247 ) ( SURFACE-AT ?auto_8235 ?auto_8246 ) ( ON ?auto_8235 ?auto_8250 ) ( CLEAR ?auto_8235 ) ( TRUCK-AT ?auto_8244 ?auto_8241 ) ( not ( = ?auto_8234 ?auto_8235 ) ) ( not ( = ?auto_8234 ?auto_8250 ) ) ( not ( = ?auto_8235 ?auto_8250 ) ) ( not ( = ?auto_8243 ?auto_8247 ) ) ( not ( = ?auto_8234 ?auto_8236 ) ) ( not ( = ?auto_8234 ?auto_8249 ) ) ( not ( = ?auto_8236 ?auto_8250 ) ) ( not ( = ?auto_8251 ?auto_8246 ) ) ( not ( = ?auto_8248 ?auto_8247 ) ) ( not ( = ?auto_8249 ?auto_8250 ) ) ( not ( = ?auto_8234 ?auto_8237 ) ) ( not ( = ?auto_8234 ?auto_8253 ) ) ( not ( = ?auto_8235 ?auto_8237 ) ) ( not ( = ?auto_8235 ?auto_8253 ) ) ( not ( = ?auto_8237 ?auto_8249 ) ) ( not ( = ?auto_8237 ?auto_8250 ) ) ( not ( = ?auto_8245 ?auto_8251 ) ) ( not ( = ?auto_8245 ?auto_8246 ) ) ( not ( = ?auto_8252 ?auto_8248 ) ) ( not ( = ?auto_8252 ?auto_8247 ) ) ( not ( = ?auto_8253 ?auto_8249 ) ) ( not ( = ?auto_8253 ?auto_8250 ) ) ( not ( = ?auto_8234 ?auto_8238 ) ) ( not ( = ?auto_8234 ?auto_8239 ) ) ( not ( = ?auto_8235 ?auto_8238 ) ) ( not ( = ?auto_8235 ?auto_8239 ) ) ( not ( = ?auto_8236 ?auto_8238 ) ) ( not ( = ?auto_8236 ?auto_8239 ) ) ( not ( = ?auto_8238 ?auto_8253 ) ) ( not ( = ?auto_8238 ?auto_8249 ) ) ( not ( = ?auto_8238 ?auto_8250 ) ) ( not ( = ?auto_8240 ?auto_8245 ) ) ( not ( = ?auto_8240 ?auto_8251 ) ) ( not ( = ?auto_8240 ?auto_8246 ) ) ( not ( = ?auto_8242 ?auto_8252 ) ) ( not ( = ?auto_8242 ?auto_8248 ) ) ( not ( = ?auto_8242 ?auto_8247 ) ) ( not ( = ?auto_8239 ?auto_8253 ) ) ( not ( = ?auto_8239 ?auto_8249 ) ) ( not ( = ?auto_8239 ?auto_8250 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8234 ?auto_8235 ?auto_8236 ?auto_8237 )
      ( MAKE-1CRATE ?auto_8237 ?auto_8238 )
      ( MAKE-4CRATE-VERIFY ?auto_8234 ?auto_8235 ?auto_8236 ?auto_8237 ?auto_8238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8256 - SURFACE
      ?auto_8257 - SURFACE
    )
    :vars
    (
      ?auto_8258 - HOIST
      ?auto_8259 - PLACE
      ?auto_8261 - PLACE
      ?auto_8262 - HOIST
      ?auto_8263 - SURFACE
      ?auto_8260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8258 ?auto_8259 ) ( SURFACE-AT ?auto_8256 ?auto_8259 ) ( CLEAR ?auto_8256 ) ( IS-CRATE ?auto_8257 ) ( AVAILABLE ?auto_8258 ) ( not ( = ?auto_8261 ?auto_8259 ) ) ( HOIST-AT ?auto_8262 ?auto_8261 ) ( AVAILABLE ?auto_8262 ) ( SURFACE-AT ?auto_8257 ?auto_8261 ) ( ON ?auto_8257 ?auto_8263 ) ( CLEAR ?auto_8257 ) ( TRUCK-AT ?auto_8260 ?auto_8259 ) ( not ( = ?auto_8256 ?auto_8257 ) ) ( not ( = ?auto_8256 ?auto_8263 ) ) ( not ( = ?auto_8257 ?auto_8263 ) ) ( not ( = ?auto_8258 ?auto_8262 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8260 ?auto_8259 ?auto_8261 )
      ( !LIFT ?auto_8262 ?auto_8257 ?auto_8263 ?auto_8261 )
      ( !LOAD ?auto_8262 ?auto_8257 ?auto_8260 ?auto_8261 )
      ( !DRIVE ?auto_8260 ?auto_8261 ?auto_8259 )
      ( !UNLOAD ?auto_8258 ?auto_8257 ?auto_8260 ?auto_8259 )
      ( !DROP ?auto_8258 ?auto_8257 ?auto_8256 ?auto_8259 )
      ( MAKE-1CRATE-VERIFY ?auto_8256 ?auto_8257 ) )
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
      ?auto_8276 - PLACE
      ?auto_8277 - PLACE
      ?auto_8279 - HOIST
      ?auto_8280 - SURFACE
      ?auto_8290 - PLACE
      ?auto_8282 - HOIST
      ?auto_8285 - SURFACE
      ?auto_8287 - PLACE
      ?auto_8292 - HOIST
      ?auto_8288 - SURFACE
      ?auto_8286 - PLACE
      ?auto_8283 - HOIST
      ?auto_8284 - SURFACE
      ?auto_8291 - PLACE
      ?auto_8289 - HOIST
      ?auto_8293 - SURFACE
      ?auto_8281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8278 ?auto_8276 ) ( IS-CRATE ?auto_8275 ) ( not ( = ?auto_8277 ?auto_8276 ) ) ( HOIST-AT ?auto_8279 ?auto_8277 ) ( AVAILABLE ?auto_8279 ) ( SURFACE-AT ?auto_8275 ?auto_8277 ) ( ON ?auto_8275 ?auto_8280 ) ( CLEAR ?auto_8275 ) ( not ( = ?auto_8274 ?auto_8275 ) ) ( not ( = ?auto_8274 ?auto_8280 ) ) ( not ( = ?auto_8275 ?auto_8280 ) ) ( not ( = ?auto_8278 ?auto_8279 ) ) ( IS-CRATE ?auto_8274 ) ( not ( = ?auto_8290 ?auto_8276 ) ) ( HOIST-AT ?auto_8282 ?auto_8290 ) ( AVAILABLE ?auto_8282 ) ( SURFACE-AT ?auto_8274 ?auto_8290 ) ( ON ?auto_8274 ?auto_8285 ) ( CLEAR ?auto_8274 ) ( not ( = ?auto_8273 ?auto_8274 ) ) ( not ( = ?auto_8273 ?auto_8285 ) ) ( not ( = ?auto_8274 ?auto_8285 ) ) ( not ( = ?auto_8278 ?auto_8282 ) ) ( IS-CRATE ?auto_8273 ) ( not ( = ?auto_8287 ?auto_8276 ) ) ( HOIST-AT ?auto_8292 ?auto_8287 ) ( AVAILABLE ?auto_8292 ) ( SURFACE-AT ?auto_8273 ?auto_8287 ) ( ON ?auto_8273 ?auto_8288 ) ( CLEAR ?auto_8273 ) ( not ( = ?auto_8272 ?auto_8273 ) ) ( not ( = ?auto_8272 ?auto_8288 ) ) ( not ( = ?auto_8273 ?auto_8288 ) ) ( not ( = ?auto_8278 ?auto_8292 ) ) ( IS-CRATE ?auto_8272 ) ( not ( = ?auto_8286 ?auto_8276 ) ) ( HOIST-AT ?auto_8283 ?auto_8286 ) ( AVAILABLE ?auto_8283 ) ( SURFACE-AT ?auto_8272 ?auto_8286 ) ( ON ?auto_8272 ?auto_8284 ) ( CLEAR ?auto_8272 ) ( not ( = ?auto_8271 ?auto_8272 ) ) ( not ( = ?auto_8271 ?auto_8284 ) ) ( not ( = ?auto_8272 ?auto_8284 ) ) ( not ( = ?auto_8278 ?auto_8283 ) ) ( SURFACE-AT ?auto_8270 ?auto_8276 ) ( CLEAR ?auto_8270 ) ( IS-CRATE ?auto_8271 ) ( AVAILABLE ?auto_8278 ) ( not ( = ?auto_8291 ?auto_8276 ) ) ( HOIST-AT ?auto_8289 ?auto_8291 ) ( AVAILABLE ?auto_8289 ) ( SURFACE-AT ?auto_8271 ?auto_8291 ) ( ON ?auto_8271 ?auto_8293 ) ( CLEAR ?auto_8271 ) ( TRUCK-AT ?auto_8281 ?auto_8276 ) ( not ( = ?auto_8270 ?auto_8271 ) ) ( not ( = ?auto_8270 ?auto_8293 ) ) ( not ( = ?auto_8271 ?auto_8293 ) ) ( not ( = ?auto_8278 ?auto_8289 ) ) ( not ( = ?auto_8270 ?auto_8272 ) ) ( not ( = ?auto_8270 ?auto_8284 ) ) ( not ( = ?auto_8272 ?auto_8293 ) ) ( not ( = ?auto_8286 ?auto_8291 ) ) ( not ( = ?auto_8283 ?auto_8289 ) ) ( not ( = ?auto_8284 ?auto_8293 ) ) ( not ( = ?auto_8270 ?auto_8273 ) ) ( not ( = ?auto_8270 ?auto_8288 ) ) ( not ( = ?auto_8271 ?auto_8273 ) ) ( not ( = ?auto_8271 ?auto_8288 ) ) ( not ( = ?auto_8273 ?auto_8284 ) ) ( not ( = ?auto_8273 ?auto_8293 ) ) ( not ( = ?auto_8287 ?auto_8286 ) ) ( not ( = ?auto_8287 ?auto_8291 ) ) ( not ( = ?auto_8292 ?auto_8283 ) ) ( not ( = ?auto_8292 ?auto_8289 ) ) ( not ( = ?auto_8288 ?auto_8284 ) ) ( not ( = ?auto_8288 ?auto_8293 ) ) ( not ( = ?auto_8270 ?auto_8274 ) ) ( not ( = ?auto_8270 ?auto_8285 ) ) ( not ( = ?auto_8271 ?auto_8274 ) ) ( not ( = ?auto_8271 ?auto_8285 ) ) ( not ( = ?auto_8272 ?auto_8274 ) ) ( not ( = ?auto_8272 ?auto_8285 ) ) ( not ( = ?auto_8274 ?auto_8288 ) ) ( not ( = ?auto_8274 ?auto_8284 ) ) ( not ( = ?auto_8274 ?auto_8293 ) ) ( not ( = ?auto_8290 ?auto_8287 ) ) ( not ( = ?auto_8290 ?auto_8286 ) ) ( not ( = ?auto_8290 ?auto_8291 ) ) ( not ( = ?auto_8282 ?auto_8292 ) ) ( not ( = ?auto_8282 ?auto_8283 ) ) ( not ( = ?auto_8282 ?auto_8289 ) ) ( not ( = ?auto_8285 ?auto_8288 ) ) ( not ( = ?auto_8285 ?auto_8284 ) ) ( not ( = ?auto_8285 ?auto_8293 ) ) ( not ( = ?auto_8270 ?auto_8275 ) ) ( not ( = ?auto_8270 ?auto_8280 ) ) ( not ( = ?auto_8271 ?auto_8275 ) ) ( not ( = ?auto_8271 ?auto_8280 ) ) ( not ( = ?auto_8272 ?auto_8275 ) ) ( not ( = ?auto_8272 ?auto_8280 ) ) ( not ( = ?auto_8273 ?auto_8275 ) ) ( not ( = ?auto_8273 ?auto_8280 ) ) ( not ( = ?auto_8275 ?auto_8285 ) ) ( not ( = ?auto_8275 ?auto_8288 ) ) ( not ( = ?auto_8275 ?auto_8284 ) ) ( not ( = ?auto_8275 ?auto_8293 ) ) ( not ( = ?auto_8277 ?auto_8290 ) ) ( not ( = ?auto_8277 ?auto_8287 ) ) ( not ( = ?auto_8277 ?auto_8286 ) ) ( not ( = ?auto_8277 ?auto_8291 ) ) ( not ( = ?auto_8279 ?auto_8282 ) ) ( not ( = ?auto_8279 ?auto_8292 ) ) ( not ( = ?auto_8279 ?auto_8283 ) ) ( not ( = ?auto_8279 ?auto_8289 ) ) ( not ( = ?auto_8280 ?auto_8285 ) ) ( not ( = ?auto_8280 ?auto_8288 ) ) ( not ( = ?auto_8280 ?auto_8284 ) ) ( not ( = ?auto_8280 ?auto_8293 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8270 ?auto_8271 ?auto_8272 ?auto_8273 ?auto_8274 )
      ( MAKE-1CRATE ?auto_8274 ?auto_8275 )
      ( MAKE-5CRATE-VERIFY ?auto_8270 ?auto_8271 ?auto_8272 ?auto_8273 ?auto_8274 ?auto_8275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8296 - SURFACE
      ?auto_8297 - SURFACE
    )
    :vars
    (
      ?auto_8298 - HOIST
      ?auto_8299 - PLACE
      ?auto_8301 - PLACE
      ?auto_8302 - HOIST
      ?auto_8303 - SURFACE
      ?auto_8300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8298 ?auto_8299 ) ( SURFACE-AT ?auto_8296 ?auto_8299 ) ( CLEAR ?auto_8296 ) ( IS-CRATE ?auto_8297 ) ( AVAILABLE ?auto_8298 ) ( not ( = ?auto_8301 ?auto_8299 ) ) ( HOIST-AT ?auto_8302 ?auto_8301 ) ( AVAILABLE ?auto_8302 ) ( SURFACE-AT ?auto_8297 ?auto_8301 ) ( ON ?auto_8297 ?auto_8303 ) ( CLEAR ?auto_8297 ) ( TRUCK-AT ?auto_8300 ?auto_8299 ) ( not ( = ?auto_8296 ?auto_8297 ) ) ( not ( = ?auto_8296 ?auto_8303 ) ) ( not ( = ?auto_8297 ?auto_8303 ) ) ( not ( = ?auto_8298 ?auto_8302 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8300 ?auto_8299 ?auto_8301 )
      ( !LIFT ?auto_8302 ?auto_8297 ?auto_8303 ?auto_8301 )
      ( !LOAD ?auto_8302 ?auto_8297 ?auto_8300 ?auto_8301 )
      ( !DRIVE ?auto_8300 ?auto_8301 ?auto_8299 )
      ( !UNLOAD ?auto_8298 ?auto_8297 ?auto_8300 ?auto_8299 )
      ( !DROP ?auto_8298 ?auto_8297 ?auto_8296 ?auto_8299 )
      ( MAKE-1CRATE-VERIFY ?auto_8296 ?auto_8297 ) )
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
      ?auto_8318 - HOIST
      ?auto_8322 - PLACE
      ?auto_8321 - PLACE
      ?auto_8323 - HOIST
      ?auto_8320 - SURFACE
      ?auto_8333 - PLACE
      ?auto_8335 - HOIST
      ?auto_8334 - SURFACE
      ?auto_8331 - PLACE
      ?auto_8326 - HOIST
      ?auto_8330 - SURFACE
      ?auto_8327 - PLACE
      ?auto_8325 - HOIST
      ?auto_8329 - SURFACE
      ?auto_8324 - PLACE
      ?auto_8337 - HOIST
      ?auto_8336 - SURFACE
      ?auto_8338 - PLACE
      ?auto_8328 - HOIST
      ?auto_8332 - SURFACE
      ?auto_8319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8318 ?auto_8322 ) ( IS-CRATE ?auto_8317 ) ( not ( = ?auto_8321 ?auto_8322 ) ) ( HOIST-AT ?auto_8323 ?auto_8321 ) ( AVAILABLE ?auto_8323 ) ( SURFACE-AT ?auto_8317 ?auto_8321 ) ( ON ?auto_8317 ?auto_8320 ) ( CLEAR ?auto_8317 ) ( not ( = ?auto_8316 ?auto_8317 ) ) ( not ( = ?auto_8316 ?auto_8320 ) ) ( not ( = ?auto_8317 ?auto_8320 ) ) ( not ( = ?auto_8318 ?auto_8323 ) ) ( IS-CRATE ?auto_8316 ) ( not ( = ?auto_8333 ?auto_8322 ) ) ( HOIST-AT ?auto_8335 ?auto_8333 ) ( AVAILABLE ?auto_8335 ) ( SURFACE-AT ?auto_8316 ?auto_8333 ) ( ON ?auto_8316 ?auto_8334 ) ( CLEAR ?auto_8316 ) ( not ( = ?auto_8315 ?auto_8316 ) ) ( not ( = ?auto_8315 ?auto_8334 ) ) ( not ( = ?auto_8316 ?auto_8334 ) ) ( not ( = ?auto_8318 ?auto_8335 ) ) ( IS-CRATE ?auto_8315 ) ( not ( = ?auto_8331 ?auto_8322 ) ) ( HOIST-AT ?auto_8326 ?auto_8331 ) ( AVAILABLE ?auto_8326 ) ( SURFACE-AT ?auto_8315 ?auto_8331 ) ( ON ?auto_8315 ?auto_8330 ) ( CLEAR ?auto_8315 ) ( not ( = ?auto_8314 ?auto_8315 ) ) ( not ( = ?auto_8314 ?auto_8330 ) ) ( not ( = ?auto_8315 ?auto_8330 ) ) ( not ( = ?auto_8318 ?auto_8326 ) ) ( IS-CRATE ?auto_8314 ) ( not ( = ?auto_8327 ?auto_8322 ) ) ( HOIST-AT ?auto_8325 ?auto_8327 ) ( AVAILABLE ?auto_8325 ) ( SURFACE-AT ?auto_8314 ?auto_8327 ) ( ON ?auto_8314 ?auto_8329 ) ( CLEAR ?auto_8314 ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( not ( = ?auto_8313 ?auto_8329 ) ) ( not ( = ?auto_8314 ?auto_8329 ) ) ( not ( = ?auto_8318 ?auto_8325 ) ) ( IS-CRATE ?auto_8313 ) ( not ( = ?auto_8324 ?auto_8322 ) ) ( HOIST-AT ?auto_8337 ?auto_8324 ) ( AVAILABLE ?auto_8337 ) ( SURFACE-AT ?auto_8313 ?auto_8324 ) ( ON ?auto_8313 ?auto_8336 ) ( CLEAR ?auto_8313 ) ( not ( = ?auto_8312 ?auto_8313 ) ) ( not ( = ?auto_8312 ?auto_8336 ) ) ( not ( = ?auto_8313 ?auto_8336 ) ) ( not ( = ?auto_8318 ?auto_8337 ) ) ( SURFACE-AT ?auto_8311 ?auto_8322 ) ( CLEAR ?auto_8311 ) ( IS-CRATE ?auto_8312 ) ( AVAILABLE ?auto_8318 ) ( not ( = ?auto_8338 ?auto_8322 ) ) ( HOIST-AT ?auto_8328 ?auto_8338 ) ( AVAILABLE ?auto_8328 ) ( SURFACE-AT ?auto_8312 ?auto_8338 ) ( ON ?auto_8312 ?auto_8332 ) ( CLEAR ?auto_8312 ) ( TRUCK-AT ?auto_8319 ?auto_8322 ) ( not ( = ?auto_8311 ?auto_8312 ) ) ( not ( = ?auto_8311 ?auto_8332 ) ) ( not ( = ?auto_8312 ?auto_8332 ) ) ( not ( = ?auto_8318 ?auto_8328 ) ) ( not ( = ?auto_8311 ?auto_8313 ) ) ( not ( = ?auto_8311 ?auto_8336 ) ) ( not ( = ?auto_8313 ?auto_8332 ) ) ( not ( = ?auto_8324 ?auto_8338 ) ) ( not ( = ?auto_8337 ?auto_8328 ) ) ( not ( = ?auto_8336 ?auto_8332 ) ) ( not ( = ?auto_8311 ?auto_8314 ) ) ( not ( = ?auto_8311 ?auto_8329 ) ) ( not ( = ?auto_8312 ?auto_8314 ) ) ( not ( = ?auto_8312 ?auto_8329 ) ) ( not ( = ?auto_8314 ?auto_8336 ) ) ( not ( = ?auto_8314 ?auto_8332 ) ) ( not ( = ?auto_8327 ?auto_8324 ) ) ( not ( = ?auto_8327 ?auto_8338 ) ) ( not ( = ?auto_8325 ?auto_8337 ) ) ( not ( = ?auto_8325 ?auto_8328 ) ) ( not ( = ?auto_8329 ?auto_8336 ) ) ( not ( = ?auto_8329 ?auto_8332 ) ) ( not ( = ?auto_8311 ?auto_8315 ) ) ( not ( = ?auto_8311 ?auto_8330 ) ) ( not ( = ?auto_8312 ?auto_8315 ) ) ( not ( = ?auto_8312 ?auto_8330 ) ) ( not ( = ?auto_8313 ?auto_8315 ) ) ( not ( = ?auto_8313 ?auto_8330 ) ) ( not ( = ?auto_8315 ?auto_8329 ) ) ( not ( = ?auto_8315 ?auto_8336 ) ) ( not ( = ?auto_8315 ?auto_8332 ) ) ( not ( = ?auto_8331 ?auto_8327 ) ) ( not ( = ?auto_8331 ?auto_8324 ) ) ( not ( = ?auto_8331 ?auto_8338 ) ) ( not ( = ?auto_8326 ?auto_8325 ) ) ( not ( = ?auto_8326 ?auto_8337 ) ) ( not ( = ?auto_8326 ?auto_8328 ) ) ( not ( = ?auto_8330 ?auto_8329 ) ) ( not ( = ?auto_8330 ?auto_8336 ) ) ( not ( = ?auto_8330 ?auto_8332 ) ) ( not ( = ?auto_8311 ?auto_8316 ) ) ( not ( = ?auto_8311 ?auto_8334 ) ) ( not ( = ?auto_8312 ?auto_8316 ) ) ( not ( = ?auto_8312 ?auto_8334 ) ) ( not ( = ?auto_8313 ?auto_8316 ) ) ( not ( = ?auto_8313 ?auto_8334 ) ) ( not ( = ?auto_8314 ?auto_8316 ) ) ( not ( = ?auto_8314 ?auto_8334 ) ) ( not ( = ?auto_8316 ?auto_8330 ) ) ( not ( = ?auto_8316 ?auto_8329 ) ) ( not ( = ?auto_8316 ?auto_8336 ) ) ( not ( = ?auto_8316 ?auto_8332 ) ) ( not ( = ?auto_8333 ?auto_8331 ) ) ( not ( = ?auto_8333 ?auto_8327 ) ) ( not ( = ?auto_8333 ?auto_8324 ) ) ( not ( = ?auto_8333 ?auto_8338 ) ) ( not ( = ?auto_8335 ?auto_8326 ) ) ( not ( = ?auto_8335 ?auto_8325 ) ) ( not ( = ?auto_8335 ?auto_8337 ) ) ( not ( = ?auto_8335 ?auto_8328 ) ) ( not ( = ?auto_8334 ?auto_8330 ) ) ( not ( = ?auto_8334 ?auto_8329 ) ) ( not ( = ?auto_8334 ?auto_8336 ) ) ( not ( = ?auto_8334 ?auto_8332 ) ) ( not ( = ?auto_8311 ?auto_8317 ) ) ( not ( = ?auto_8311 ?auto_8320 ) ) ( not ( = ?auto_8312 ?auto_8317 ) ) ( not ( = ?auto_8312 ?auto_8320 ) ) ( not ( = ?auto_8313 ?auto_8317 ) ) ( not ( = ?auto_8313 ?auto_8320 ) ) ( not ( = ?auto_8314 ?auto_8317 ) ) ( not ( = ?auto_8314 ?auto_8320 ) ) ( not ( = ?auto_8315 ?auto_8317 ) ) ( not ( = ?auto_8315 ?auto_8320 ) ) ( not ( = ?auto_8317 ?auto_8334 ) ) ( not ( = ?auto_8317 ?auto_8330 ) ) ( not ( = ?auto_8317 ?auto_8329 ) ) ( not ( = ?auto_8317 ?auto_8336 ) ) ( not ( = ?auto_8317 ?auto_8332 ) ) ( not ( = ?auto_8321 ?auto_8333 ) ) ( not ( = ?auto_8321 ?auto_8331 ) ) ( not ( = ?auto_8321 ?auto_8327 ) ) ( not ( = ?auto_8321 ?auto_8324 ) ) ( not ( = ?auto_8321 ?auto_8338 ) ) ( not ( = ?auto_8323 ?auto_8335 ) ) ( not ( = ?auto_8323 ?auto_8326 ) ) ( not ( = ?auto_8323 ?auto_8325 ) ) ( not ( = ?auto_8323 ?auto_8337 ) ) ( not ( = ?auto_8323 ?auto_8328 ) ) ( not ( = ?auto_8320 ?auto_8334 ) ) ( not ( = ?auto_8320 ?auto_8330 ) ) ( not ( = ?auto_8320 ?auto_8329 ) ) ( not ( = ?auto_8320 ?auto_8336 ) ) ( not ( = ?auto_8320 ?auto_8332 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8311 ?auto_8312 ?auto_8313 ?auto_8314 ?auto_8315 ?auto_8316 )
      ( MAKE-1CRATE ?auto_8316 ?auto_8317 )
      ( MAKE-6CRATE-VERIFY ?auto_8311 ?auto_8312 ?auto_8313 ?auto_8314 ?auto_8315 ?auto_8316 ?auto_8317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8341 - SURFACE
      ?auto_8342 - SURFACE
    )
    :vars
    (
      ?auto_8343 - HOIST
      ?auto_8344 - PLACE
      ?auto_8346 - PLACE
      ?auto_8347 - HOIST
      ?auto_8348 - SURFACE
      ?auto_8345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8343 ?auto_8344 ) ( SURFACE-AT ?auto_8341 ?auto_8344 ) ( CLEAR ?auto_8341 ) ( IS-CRATE ?auto_8342 ) ( AVAILABLE ?auto_8343 ) ( not ( = ?auto_8346 ?auto_8344 ) ) ( HOIST-AT ?auto_8347 ?auto_8346 ) ( AVAILABLE ?auto_8347 ) ( SURFACE-AT ?auto_8342 ?auto_8346 ) ( ON ?auto_8342 ?auto_8348 ) ( CLEAR ?auto_8342 ) ( TRUCK-AT ?auto_8345 ?auto_8344 ) ( not ( = ?auto_8341 ?auto_8342 ) ) ( not ( = ?auto_8341 ?auto_8348 ) ) ( not ( = ?auto_8342 ?auto_8348 ) ) ( not ( = ?auto_8343 ?auto_8347 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8345 ?auto_8344 ?auto_8346 )
      ( !LIFT ?auto_8347 ?auto_8342 ?auto_8348 ?auto_8346 )
      ( !LOAD ?auto_8347 ?auto_8342 ?auto_8345 ?auto_8346 )
      ( !DRIVE ?auto_8345 ?auto_8346 ?auto_8344 )
      ( !UNLOAD ?auto_8343 ?auto_8342 ?auto_8345 ?auto_8344 )
      ( !DROP ?auto_8343 ?auto_8342 ?auto_8341 ?auto_8344 )
      ( MAKE-1CRATE-VERIFY ?auto_8341 ?auto_8342 ) )
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
      ?auto_8364 - SURFACE
      ?auto_8363 - SURFACE
    )
    :vars
    (
      ?auto_8367 - HOIST
      ?auto_8369 - PLACE
      ?auto_8370 - PLACE
      ?auto_8368 - HOIST
      ?auto_8366 - SURFACE
      ?auto_8381 - PLACE
      ?auto_8374 - HOIST
      ?auto_8384 - SURFACE
      ?auto_8372 - SURFACE
      ?auto_8386 - PLACE
      ?auto_8380 - HOIST
      ?auto_8375 - SURFACE
      ?auto_8378 - PLACE
      ?auto_8379 - HOIST
      ?auto_8376 - SURFACE
      ?auto_8382 - PLACE
      ?auto_8371 - HOIST
      ?auto_8385 - SURFACE
      ?auto_8383 - PLACE
      ?auto_8377 - HOIST
      ?auto_8373 - SURFACE
      ?auto_8365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8367 ?auto_8369 ) ( IS-CRATE ?auto_8363 ) ( not ( = ?auto_8370 ?auto_8369 ) ) ( HOIST-AT ?auto_8368 ?auto_8370 ) ( SURFACE-AT ?auto_8363 ?auto_8370 ) ( ON ?auto_8363 ?auto_8366 ) ( CLEAR ?auto_8363 ) ( not ( = ?auto_8364 ?auto_8363 ) ) ( not ( = ?auto_8364 ?auto_8366 ) ) ( not ( = ?auto_8363 ?auto_8366 ) ) ( not ( = ?auto_8367 ?auto_8368 ) ) ( IS-CRATE ?auto_8364 ) ( not ( = ?auto_8381 ?auto_8369 ) ) ( HOIST-AT ?auto_8374 ?auto_8381 ) ( AVAILABLE ?auto_8374 ) ( SURFACE-AT ?auto_8364 ?auto_8381 ) ( ON ?auto_8364 ?auto_8384 ) ( CLEAR ?auto_8364 ) ( not ( = ?auto_8362 ?auto_8364 ) ) ( not ( = ?auto_8362 ?auto_8384 ) ) ( not ( = ?auto_8364 ?auto_8384 ) ) ( not ( = ?auto_8367 ?auto_8374 ) ) ( IS-CRATE ?auto_8362 ) ( AVAILABLE ?auto_8368 ) ( SURFACE-AT ?auto_8362 ?auto_8370 ) ( ON ?auto_8362 ?auto_8372 ) ( CLEAR ?auto_8362 ) ( not ( = ?auto_8361 ?auto_8362 ) ) ( not ( = ?auto_8361 ?auto_8372 ) ) ( not ( = ?auto_8362 ?auto_8372 ) ) ( IS-CRATE ?auto_8361 ) ( not ( = ?auto_8386 ?auto_8369 ) ) ( HOIST-AT ?auto_8380 ?auto_8386 ) ( AVAILABLE ?auto_8380 ) ( SURFACE-AT ?auto_8361 ?auto_8386 ) ( ON ?auto_8361 ?auto_8375 ) ( CLEAR ?auto_8361 ) ( not ( = ?auto_8360 ?auto_8361 ) ) ( not ( = ?auto_8360 ?auto_8375 ) ) ( not ( = ?auto_8361 ?auto_8375 ) ) ( not ( = ?auto_8367 ?auto_8380 ) ) ( IS-CRATE ?auto_8360 ) ( not ( = ?auto_8378 ?auto_8369 ) ) ( HOIST-AT ?auto_8379 ?auto_8378 ) ( AVAILABLE ?auto_8379 ) ( SURFACE-AT ?auto_8360 ?auto_8378 ) ( ON ?auto_8360 ?auto_8376 ) ( CLEAR ?auto_8360 ) ( not ( = ?auto_8359 ?auto_8360 ) ) ( not ( = ?auto_8359 ?auto_8376 ) ) ( not ( = ?auto_8360 ?auto_8376 ) ) ( not ( = ?auto_8367 ?auto_8379 ) ) ( IS-CRATE ?auto_8359 ) ( not ( = ?auto_8382 ?auto_8369 ) ) ( HOIST-AT ?auto_8371 ?auto_8382 ) ( AVAILABLE ?auto_8371 ) ( SURFACE-AT ?auto_8359 ?auto_8382 ) ( ON ?auto_8359 ?auto_8385 ) ( CLEAR ?auto_8359 ) ( not ( = ?auto_8358 ?auto_8359 ) ) ( not ( = ?auto_8358 ?auto_8385 ) ) ( not ( = ?auto_8359 ?auto_8385 ) ) ( not ( = ?auto_8367 ?auto_8371 ) ) ( SURFACE-AT ?auto_8357 ?auto_8369 ) ( CLEAR ?auto_8357 ) ( IS-CRATE ?auto_8358 ) ( AVAILABLE ?auto_8367 ) ( not ( = ?auto_8383 ?auto_8369 ) ) ( HOIST-AT ?auto_8377 ?auto_8383 ) ( AVAILABLE ?auto_8377 ) ( SURFACE-AT ?auto_8358 ?auto_8383 ) ( ON ?auto_8358 ?auto_8373 ) ( CLEAR ?auto_8358 ) ( TRUCK-AT ?auto_8365 ?auto_8369 ) ( not ( = ?auto_8357 ?auto_8358 ) ) ( not ( = ?auto_8357 ?auto_8373 ) ) ( not ( = ?auto_8358 ?auto_8373 ) ) ( not ( = ?auto_8367 ?auto_8377 ) ) ( not ( = ?auto_8357 ?auto_8359 ) ) ( not ( = ?auto_8357 ?auto_8385 ) ) ( not ( = ?auto_8359 ?auto_8373 ) ) ( not ( = ?auto_8382 ?auto_8383 ) ) ( not ( = ?auto_8371 ?auto_8377 ) ) ( not ( = ?auto_8385 ?auto_8373 ) ) ( not ( = ?auto_8357 ?auto_8360 ) ) ( not ( = ?auto_8357 ?auto_8376 ) ) ( not ( = ?auto_8358 ?auto_8360 ) ) ( not ( = ?auto_8358 ?auto_8376 ) ) ( not ( = ?auto_8360 ?auto_8385 ) ) ( not ( = ?auto_8360 ?auto_8373 ) ) ( not ( = ?auto_8378 ?auto_8382 ) ) ( not ( = ?auto_8378 ?auto_8383 ) ) ( not ( = ?auto_8379 ?auto_8371 ) ) ( not ( = ?auto_8379 ?auto_8377 ) ) ( not ( = ?auto_8376 ?auto_8385 ) ) ( not ( = ?auto_8376 ?auto_8373 ) ) ( not ( = ?auto_8357 ?auto_8361 ) ) ( not ( = ?auto_8357 ?auto_8375 ) ) ( not ( = ?auto_8358 ?auto_8361 ) ) ( not ( = ?auto_8358 ?auto_8375 ) ) ( not ( = ?auto_8359 ?auto_8361 ) ) ( not ( = ?auto_8359 ?auto_8375 ) ) ( not ( = ?auto_8361 ?auto_8376 ) ) ( not ( = ?auto_8361 ?auto_8385 ) ) ( not ( = ?auto_8361 ?auto_8373 ) ) ( not ( = ?auto_8386 ?auto_8378 ) ) ( not ( = ?auto_8386 ?auto_8382 ) ) ( not ( = ?auto_8386 ?auto_8383 ) ) ( not ( = ?auto_8380 ?auto_8379 ) ) ( not ( = ?auto_8380 ?auto_8371 ) ) ( not ( = ?auto_8380 ?auto_8377 ) ) ( not ( = ?auto_8375 ?auto_8376 ) ) ( not ( = ?auto_8375 ?auto_8385 ) ) ( not ( = ?auto_8375 ?auto_8373 ) ) ( not ( = ?auto_8357 ?auto_8362 ) ) ( not ( = ?auto_8357 ?auto_8372 ) ) ( not ( = ?auto_8358 ?auto_8362 ) ) ( not ( = ?auto_8358 ?auto_8372 ) ) ( not ( = ?auto_8359 ?auto_8362 ) ) ( not ( = ?auto_8359 ?auto_8372 ) ) ( not ( = ?auto_8360 ?auto_8362 ) ) ( not ( = ?auto_8360 ?auto_8372 ) ) ( not ( = ?auto_8362 ?auto_8375 ) ) ( not ( = ?auto_8362 ?auto_8376 ) ) ( not ( = ?auto_8362 ?auto_8385 ) ) ( not ( = ?auto_8362 ?auto_8373 ) ) ( not ( = ?auto_8370 ?auto_8386 ) ) ( not ( = ?auto_8370 ?auto_8378 ) ) ( not ( = ?auto_8370 ?auto_8382 ) ) ( not ( = ?auto_8370 ?auto_8383 ) ) ( not ( = ?auto_8368 ?auto_8380 ) ) ( not ( = ?auto_8368 ?auto_8379 ) ) ( not ( = ?auto_8368 ?auto_8371 ) ) ( not ( = ?auto_8368 ?auto_8377 ) ) ( not ( = ?auto_8372 ?auto_8375 ) ) ( not ( = ?auto_8372 ?auto_8376 ) ) ( not ( = ?auto_8372 ?auto_8385 ) ) ( not ( = ?auto_8372 ?auto_8373 ) ) ( not ( = ?auto_8357 ?auto_8364 ) ) ( not ( = ?auto_8357 ?auto_8384 ) ) ( not ( = ?auto_8358 ?auto_8364 ) ) ( not ( = ?auto_8358 ?auto_8384 ) ) ( not ( = ?auto_8359 ?auto_8364 ) ) ( not ( = ?auto_8359 ?auto_8384 ) ) ( not ( = ?auto_8360 ?auto_8364 ) ) ( not ( = ?auto_8360 ?auto_8384 ) ) ( not ( = ?auto_8361 ?auto_8364 ) ) ( not ( = ?auto_8361 ?auto_8384 ) ) ( not ( = ?auto_8364 ?auto_8372 ) ) ( not ( = ?auto_8364 ?auto_8375 ) ) ( not ( = ?auto_8364 ?auto_8376 ) ) ( not ( = ?auto_8364 ?auto_8385 ) ) ( not ( = ?auto_8364 ?auto_8373 ) ) ( not ( = ?auto_8381 ?auto_8370 ) ) ( not ( = ?auto_8381 ?auto_8386 ) ) ( not ( = ?auto_8381 ?auto_8378 ) ) ( not ( = ?auto_8381 ?auto_8382 ) ) ( not ( = ?auto_8381 ?auto_8383 ) ) ( not ( = ?auto_8374 ?auto_8368 ) ) ( not ( = ?auto_8374 ?auto_8380 ) ) ( not ( = ?auto_8374 ?auto_8379 ) ) ( not ( = ?auto_8374 ?auto_8371 ) ) ( not ( = ?auto_8374 ?auto_8377 ) ) ( not ( = ?auto_8384 ?auto_8372 ) ) ( not ( = ?auto_8384 ?auto_8375 ) ) ( not ( = ?auto_8384 ?auto_8376 ) ) ( not ( = ?auto_8384 ?auto_8385 ) ) ( not ( = ?auto_8384 ?auto_8373 ) ) ( not ( = ?auto_8357 ?auto_8363 ) ) ( not ( = ?auto_8357 ?auto_8366 ) ) ( not ( = ?auto_8358 ?auto_8363 ) ) ( not ( = ?auto_8358 ?auto_8366 ) ) ( not ( = ?auto_8359 ?auto_8363 ) ) ( not ( = ?auto_8359 ?auto_8366 ) ) ( not ( = ?auto_8360 ?auto_8363 ) ) ( not ( = ?auto_8360 ?auto_8366 ) ) ( not ( = ?auto_8361 ?auto_8363 ) ) ( not ( = ?auto_8361 ?auto_8366 ) ) ( not ( = ?auto_8362 ?auto_8363 ) ) ( not ( = ?auto_8362 ?auto_8366 ) ) ( not ( = ?auto_8363 ?auto_8384 ) ) ( not ( = ?auto_8363 ?auto_8372 ) ) ( not ( = ?auto_8363 ?auto_8375 ) ) ( not ( = ?auto_8363 ?auto_8376 ) ) ( not ( = ?auto_8363 ?auto_8385 ) ) ( not ( = ?auto_8363 ?auto_8373 ) ) ( not ( = ?auto_8366 ?auto_8384 ) ) ( not ( = ?auto_8366 ?auto_8372 ) ) ( not ( = ?auto_8366 ?auto_8375 ) ) ( not ( = ?auto_8366 ?auto_8376 ) ) ( not ( = ?auto_8366 ?auto_8385 ) ) ( not ( = ?auto_8366 ?auto_8373 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8357 ?auto_8358 ?auto_8359 ?auto_8360 ?auto_8361 ?auto_8362 ?auto_8364 )
      ( MAKE-1CRATE ?auto_8364 ?auto_8363 )
      ( MAKE-7CRATE-VERIFY ?auto_8357 ?auto_8358 ?auto_8359 ?auto_8360 ?auto_8361 ?auto_8362 ?auto_8364 ?auto_8363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8389 - SURFACE
      ?auto_8390 - SURFACE
    )
    :vars
    (
      ?auto_8391 - HOIST
      ?auto_8392 - PLACE
      ?auto_8394 - PLACE
      ?auto_8395 - HOIST
      ?auto_8396 - SURFACE
      ?auto_8393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8391 ?auto_8392 ) ( SURFACE-AT ?auto_8389 ?auto_8392 ) ( CLEAR ?auto_8389 ) ( IS-CRATE ?auto_8390 ) ( AVAILABLE ?auto_8391 ) ( not ( = ?auto_8394 ?auto_8392 ) ) ( HOIST-AT ?auto_8395 ?auto_8394 ) ( AVAILABLE ?auto_8395 ) ( SURFACE-AT ?auto_8390 ?auto_8394 ) ( ON ?auto_8390 ?auto_8396 ) ( CLEAR ?auto_8390 ) ( TRUCK-AT ?auto_8393 ?auto_8392 ) ( not ( = ?auto_8389 ?auto_8390 ) ) ( not ( = ?auto_8389 ?auto_8396 ) ) ( not ( = ?auto_8390 ?auto_8396 ) ) ( not ( = ?auto_8391 ?auto_8395 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8393 ?auto_8392 ?auto_8394 )
      ( !LIFT ?auto_8395 ?auto_8390 ?auto_8396 ?auto_8394 )
      ( !LOAD ?auto_8395 ?auto_8390 ?auto_8393 ?auto_8394 )
      ( !DRIVE ?auto_8393 ?auto_8394 ?auto_8392 )
      ( !UNLOAD ?auto_8391 ?auto_8390 ?auto_8393 ?auto_8392 )
      ( !DROP ?auto_8391 ?auto_8390 ?auto_8389 ?auto_8392 )
      ( MAKE-1CRATE-VERIFY ?auto_8389 ?auto_8390 ) )
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
      ?auto_8414 - SURFACE
      ?auto_8413 - SURFACE
      ?auto_8412 - SURFACE
    )
    :vars
    (
      ?auto_8419 - HOIST
      ?auto_8420 - PLACE
      ?auto_8418 - PLACE
      ?auto_8417 - HOIST
      ?auto_8416 - SURFACE
      ?auto_8431 - PLACE
      ?auto_8433 - HOIST
      ?auto_8432 - SURFACE
      ?auto_8422 - PLACE
      ?auto_8434 - HOIST
      ?auto_8426 - SURFACE
      ?auto_8439 - SURFACE
      ?auto_8436 - PLACE
      ?auto_8423 - HOIST
      ?auto_8430 - SURFACE
      ?auto_8427 - PLACE
      ?auto_8421 - HOIST
      ?auto_8429 - SURFACE
      ?auto_8424 - PLACE
      ?auto_8435 - HOIST
      ?auto_8437 - SURFACE
      ?auto_8425 - PLACE
      ?auto_8428 - HOIST
      ?auto_8438 - SURFACE
      ?auto_8415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8419 ?auto_8420 ) ( IS-CRATE ?auto_8412 ) ( not ( = ?auto_8418 ?auto_8420 ) ) ( HOIST-AT ?auto_8417 ?auto_8418 ) ( AVAILABLE ?auto_8417 ) ( SURFACE-AT ?auto_8412 ?auto_8418 ) ( ON ?auto_8412 ?auto_8416 ) ( CLEAR ?auto_8412 ) ( not ( = ?auto_8413 ?auto_8412 ) ) ( not ( = ?auto_8413 ?auto_8416 ) ) ( not ( = ?auto_8412 ?auto_8416 ) ) ( not ( = ?auto_8419 ?auto_8417 ) ) ( IS-CRATE ?auto_8413 ) ( not ( = ?auto_8431 ?auto_8420 ) ) ( HOIST-AT ?auto_8433 ?auto_8431 ) ( SURFACE-AT ?auto_8413 ?auto_8431 ) ( ON ?auto_8413 ?auto_8432 ) ( CLEAR ?auto_8413 ) ( not ( = ?auto_8414 ?auto_8413 ) ) ( not ( = ?auto_8414 ?auto_8432 ) ) ( not ( = ?auto_8413 ?auto_8432 ) ) ( not ( = ?auto_8419 ?auto_8433 ) ) ( IS-CRATE ?auto_8414 ) ( not ( = ?auto_8422 ?auto_8420 ) ) ( HOIST-AT ?auto_8434 ?auto_8422 ) ( AVAILABLE ?auto_8434 ) ( SURFACE-AT ?auto_8414 ?auto_8422 ) ( ON ?auto_8414 ?auto_8426 ) ( CLEAR ?auto_8414 ) ( not ( = ?auto_8411 ?auto_8414 ) ) ( not ( = ?auto_8411 ?auto_8426 ) ) ( not ( = ?auto_8414 ?auto_8426 ) ) ( not ( = ?auto_8419 ?auto_8434 ) ) ( IS-CRATE ?auto_8411 ) ( AVAILABLE ?auto_8433 ) ( SURFACE-AT ?auto_8411 ?auto_8431 ) ( ON ?auto_8411 ?auto_8439 ) ( CLEAR ?auto_8411 ) ( not ( = ?auto_8410 ?auto_8411 ) ) ( not ( = ?auto_8410 ?auto_8439 ) ) ( not ( = ?auto_8411 ?auto_8439 ) ) ( IS-CRATE ?auto_8410 ) ( not ( = ?auto_8436 ?auto_8420 ) ) ( HOIST-AT ?auto_8423 ?auto_8436 ) ( AVAILABLE ?auto_8423 ) ( SURFACE-AT ?auto_8410 ?auto_8436 ) ( ON ?auto_8410 ?auto_8430 ) ( CLEAR ?auto_8410 ) ( not ( = ?auto_8409 ?auto_8410 ) ) ( not ( = ?auto_8409 ?auto_8430 ) ) ( not ( = ?auto_8410 ?auto_8430 ) ) ( not ( = ?auto_8419 ?auto_8423 ) ) ( IS-CRATE ?auto_8409 ) ( not ( = ?auto_8427 ?auto_8420 ) ) ( HOIST-AT ?auto_8421 ?auto_8427 ) ( AVAILABLE ?auto_8421 ) ( SURFACE-AT ?auto_8409 ?auto_8427 ) ( ON ?auto_8409 ?auto_8429 ) ( CLEAR ?auto_8409 ) ( not ( = ?auto_8408 ?auto_8409 ) ) ( not ( = ?auto_8408 ?auto_8429 ) ) ( not ( = ?auto_8409 ?auto_8429 ) ) ( not ( = ?auto_8419 ?auto_8421 ) ) ( IS-CRATE ?auto_8408 ) ( not ( = ?auto_8424 ?auto_8420 ) ) ( HOIST-AT ?auto_8435 ?auto_8424 ) ( AVAILABLE ?auto_8435 ) ( SURFACE-AT ?auto_8408 ?auto_8424 ) ( ON ?auto_8408 ?auto_8437 ) ( CLEAR ?auto_8408 ) ( not ( = ?auto_8407 ?auto_8408 ) ) ( not ( = ?auto_8407 ?auto_8437 ) ) ( not ( = ?auto_8408 ?auto_8437 ) ) ( not ( = ?auto_8419 ?auto_8435 ) ) ( SURFACE-AT ?auto_8406 ?auto_8420 ) ( CLEAR ?auto_8406 ) ( IS-CRATE ?auto_8407 ) ( AVAILABLE ?auto_8419 ) ( not ( = ?auto_8425 ?auto_8420 ) ) ( HOIST-AT ?auto_8428 ?auto_8425 ) ( AVAILABLE ?auto_8428 ) ( SURFACE-AT ?auto_8407 ?auto_8425 ) ( ON ?auto_8407 ?auto_8438 ) ( CLEAR ?auto_8407 ) ( TRUCK-AT ?auto_8415 ?auto_8420 ) ( not ( = ?auto_8406 ?auto_8407 ) ) ( not ( = ?auto_8406 ?auto_8438 ) ) ( not ( = ?auto_8407 ?auto_8438 ) ) ( not ( = ?auto_8419 ?auto_8428 ) ) ( not ( = ?auto_8406 ?auto_8408 ) ) ( not ( = ?auto_8406 ?auto_8437 ) ) ( not ( = ?auto_8408 ?auto_8438 ) ) ( not ( = ?auto_8424 ?auto_8425 ) ) ( not ( = ?auto_8435 ?auto_8428 ) ) ( not ( = ?auto_8437 ?auto_8438 ) ) ( not ( = ?auto_8406 ?auto_8409 ) ) ( not ( = ?auto_8406 ?auto_8429 ) ) ( not ( = ?auto_8407 ?auto_8409 ) ) ( not ( = ?auto_8407 ?auto_8429 ) ) ( not ( = ?auto_8409 ?auto_8437 ) ) ( not ( = ?auto_8409 ?auto_8438 ) ) ( not ( = ?auto_8427 ?auto_8424 ) ) ( not ( = ?auto_8427 ?auto_8425 ) ) ( not ( = ?auto_8421 ?auto_8435 ) ) ( not ( = ?auto_8421 ?auto_8428 ) ) ( not ( = ?auto_8429 ?auto_8437 ) ) ( not ( = ?auto_8429 ?auto_8438 ) ) ( not ( = ?auto_8406 ?auto_8410 ) ) ( not ( = ?auto_8406 ?auto_8430 ) ) ( not ( = ?auto_8407 ?auto_8410 ) ) ( not ( = ?auto_8407 ?auto_8430 ) ) ( not ( = ?auto_8408 ?auto_8410 ) ) ( not ( = ?auto_8408 ?auto_8430 ) ) ( not ( = ?auto_8410 ?auto_8429 ) ) ( not ( = ?auto_8410 ?auto_8437 ) ) ( not ( = ?auto_8410 ?auto_8438 ) ) ( not ( = ?auto_8436 ?auto_8427 ) ) ( not ( = ?auto_8436 ?auto_8424 ) ) ( not ( = ?auto_8436 ?auto_8425 ) ) ( not ( = ?auto_8423 ?auto_8421 ) ) ( not ( = ?auto_8423 ?auto_8435 ) ) ( not ( = ?auto_8423 ?auto_8428 ) ) ( not ( = ?auto_8430 ?auto_8429 ) ) ( not ( = ?auto_8430 ?auto_8437 ) ) ( not ( = ?auto_8430 ?auto_8438 ) ) ( not ( = ?auto_8406 ?auto_8411 ) ) ( not ( = ?auto_8406 ?auto_8439 ) ) ( not ( = ?auto_8407 ?auto_8411 ) ) ( not ( = ?auto_8407 ?auto_8439 ) ) ( not ( = ?auto_8408 ?auto_8411 ) ) ( not ( = ?auto_8408 ?auto_8439 ) ) ( not ( = ?auto_8409 ?auto_8411 ) ) ( not ( = ?auto_8409 ?auto_8439 ) ) ( not ( = ?auto_8411 ?auto_8430 ) ) ( not ( = ?auto_8411 ?auto_8429 ) ) ( not ( = ?auto_8411 ?auto_8437 ) ) ( not ( = ?auto_8411 ?auto_8438 ) ) ( not ( = ?auto_8431 ?auto_8436 ) ) ( not ( = ?auto_8431 ?auto_8427 ) ) ( not ( = ?auto_8431 ?auto_8424 ) ) ( not ( = ?auto_8431 ?auto_8425 ) ) ( not ( = ?auto_8433 ?auto_8423 ) ) ( not ( = ?auto_8433 ?auto_8421 ) ) ( not ( = ?auto_8433 ?auto_8435 ) ) ( not ( = ?auto_8433 ?auto_8428 ) ) ( not ( = ?auto_8439 ?auto_8430 ) ) ( not ( = ?auto_8439 ?auto_8429 ) ) ( not ( = ?auto_8439 ?auto_8437 ) ) ( not ( = ?auto_8439 ?auto_8438 ) ) ( not ( = ?auto_8406 ?auto_8414 ) ) ( not ( = ?auto_8406 ?auto_8426 ) ) ( not ( = ?auto_8407 ?auto_8414 ) ) ( not ( = ?auto_8407 ?auto_8426 ) ) ( not ( = ?auto_8408 ?auto_8414 ) ) ( not ( = ?auto_8408 ?auto_8426 ) ) ( not ( = ?auto_8409 ?auto_8414 ) ) ( not ( = ?auto_8409 ?auto_8426 ) ) ( not ( = ?auto_8410 ?auto_8414 ) ) ( not ( = ?auto_8410 ?auto_8426 ) ) ( not ( = ?auto_8414 ?auto_8439 ) ) ( not ( = ?auto_8414 ?auto_8430 ) ) ( not ( = ?auto_8414 ?auto_8429 ) ) ( not ( = ?auto_8414 ?auto_8437 ) ) ( not ( = ?auto_8414 ?auto_8438 ) ) ( not ( = ?auto_8422 ?auto_8431 ) ) ( not ( = ?auto_8422 ?auto_8436 ) ) ( not ( = ?auto_8422 ?auto_8427 ) ) ( not ( = ?auto_8422 ?auto_8424 ) ) ( not ( = ?auto_8422 ?auto_8425 ) ) ( not ( = ?auto_8434 ?auto_8433 ) ) ( not ( = ?auto_8434 ?auto_8423 ) ) ( not ( = ?auto_8434 ?auto_8421 ) ) ( not ( = ?auto_8434 ?auto_8435 ) ) ( not ( = ?auto_8434 ?auto_8428 ) ) ( not ( = ?auto_8426 ?auto_8439 ) ) ( not ( = ?auto_8426 ?auto_8430 ) ) ( not ( = ?auto_8426 ?auto_8429 ) ) ( not ( = ?auto_8426 ?auto_8437 ) ) ( not ( = ?auto_8426 ?auto_8438 ) ) ( not ( = ?auto_8406 ?auto_8413 ) ) ( not ( = ?auto_8406 ?auto_8432 ) ) ( not ( = ?auto_8407 ?auto_8413 ) ) ( not ( = ?auto_8407 ?auto_8432 ) ) ( not ( = ?auto_8408 ?auto_8413 ) ) ( not ( = ?auto_8408 ?auto_8432 ) ) ( not ( = ?auto_8409 ?auto_8413 ) ) ( not ( = ?auto_8409 ?auto_8432 ) ) ( not ( = ?auto_8410 ?auto_8413 ) ) ( not ( = ?auto_8410 ?auto_8432 ) ) ( not ( = ?auto_8411 ?auto_8413 ) ) ( not ( = ?auto_8411 ?auto_8432 ) ) ( not ( = ?auto_8413 ?auto_8426 ) ) ( not ( = ?auto_8413 ?auto_8439 ) ) ( not ( = ?auto_8413 ?auto_8430 ) ) ( not ( = ?auto_8413 ?auto_8429 ) ) ( not ( = ?auto_8413 ?auto_8437 ) ) ( not ( = ?auto_8413 ?auto_8438 ) ) ( not ( = ?auto_8432 ?auto_8426 ) ) ( not ( = ?auto_8432 ?auto_8439 ) ) ( not ( = ?auto_8432 ?auto_8430 ) ) ( not ( = ?auto_8432 ?auto_8429 ) ) ( not ( = ?auto_8432 ?auto_8437 ) ) ( not ( = ?auto_8432 ?auto_8438 ) ) ( not ( = ?auto_8406 ?auto_8412 ) ) ( not ( = ?auto_8406 ?auto_8416 ) ) ( not ( = ?auto_8407 ?auto_8412 ) ) ( not ( = ?auto_8407 ?auto_8416 ) ) ( not ( = ?auto_8408 ?auto_8412 ) ) ( not ( = ?auto_8408 ?auto_8416 ) ) ( not ( = ?auto_8409 ?auto_8412 ) ) ( not ( = ?auto_8409 ?auto_8416 ) ) ( not ( = ?auto_8410 ?auto_8412 ) ) ( not ( = ?auto_8410 ?auto_8416 ) ) ( not ( = ?auto_8411 ?auto_8412 ) ) ( not ( = ?auto_8411 ?auto_8416 ) ) ( not ( = ?auto_8414 ?auto_8412 ) ) ( not ( = ?auto_8414 ?auto_8416 ) ) ( not ( = ?auto_8412 ?auto_8432 ) ) ( not ( = ?auto_8412 ?auto_8426 ) ) ( not ( = ?auto_8412 ?auto_8439 ) ) ( not ( = ?auto_8412 ?auto_8430 ) ) ( not ( = ?auto_8412 ?auto_8429 ) ) ( not ( = ?auto_8412 ?auto_8437 ) ) ( not ( = ?auto_8412 ?auto_8438 ) ) ( not ( = ?auto_8418 ?auto_8431 ) ) ( not ( = ?auto_8418 ?auto_8422 ) ) ( not ( = ?auto_8418 ?auto_8436 ) ) ( not ( = ?auto_8418 ?auto_8427 ) ) ( not ( = ?auto_8418 ?auto_8424 ) ) ( not ( = ?auto_8418 ?auto_8425 ) ) ( not ( = ?auto_8417 ?auto_8433 ) ) ( not ( = ?auto_8417 ?auto_8434 ) ) ( not ( = ?auto_8417 ?auto_8423 ) ) ( not ( = ?auto_8417 ?auto_8421 ) ) ( not ( = ?auto_8417 ?auto_8435 ) ) ( not ( = ?auto_8417 ?auto_8428 ) ) ( not ( = ?auto_8416 ?auto_8432 ) ) ( not ( = ?auto_8416 ?auto_8426 ) ) ( not ( = ?auto_8416 ?auto_8439 ) ) ( not ( = ?auto_8416 ?auto_8430 ) ) ( not ( = ?auto_8416 ?auto_8429 ) ) ( not ( = ?auto_8416 ?auto_8437 ) ) ( not ( = ?auto_8416 ?auto_8438 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8406 ?auto_8407 ?auto_8408 ?auto_8409 ?auto_8410 ?auto_8411 ?auto_8414 ?auto_8413 )
      ( MAKE-1CRATE ?auto_8413 ?auto_8412 )
      ( MAKE-8CRATE-VERIFY ?auto_8406 ?auto_8407 ?auto_8408 ?auto_8409 ?auto_8410 ?auto_8411 ?auto_8414 ?auto_8413 ?auto_8412 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8442 - SURFACE
      ?auto_8443 - SURFACE
    )
    :vars
    (
      ?auto_8444 - HOIST
      ?auto_8445 - PLACE
      ?auto_8447 - PLACE
      ?auto_8448 - HOIST
      ?auto_8449 - SURFACE
      ?auto_8446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8444 ?auto_8445 ) ( SURFACE-AT ?auto_8442 ?auto_8445 ) ( CLEAR ?auto_8442 ) ( IS-CRATE ?auto_8443 ) ( AVAILABLE ?auto_8444 ) ( not ( = ?auto_8447 ?auto_8445 ) ) ( HOIST-AT ?auto_8448 ?auto_8447 ) ( AVAILABLE ?auto_8448 ) ( SURFACE-AT ?auto_8443 ?auto_8447 ) ( ON ?auto_8443 ?auto_8449 ) ( CLEAR ?auto_8443 ) ( TRUCK-AT ?auto_8446 ?auto_8445 ) ( not ( = ?auto_8442 ?auto_8443 ) ) ( not ( = ?auto_8442 ?auto_8449 ) ) ( not ( = ?auto_8443 ?auto_8449 ) ) ( not ( = ?auto_8444 ?auto_8448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8446 ?auto_8445 ?auto_8447 )
      ( !LIFT ?auto_8448 ?auto_8443 ?auto_8449 ?auto_8447 )
      ( !LOAD ?auto_8448 ?auto_8443 ?auto_8446 ?auto_8447 )
      ( !DRIVE ?auto_8446 ?auto_8447 ?auto_8445 )
      ( !UNLOAD ?auto_8444 ?auto_8443 ?auto_8446 ?auto_8445 )
      ( !DROP ?auto_8444 ?auto_8443 ?auto_8442 ?auto_8445 )
      ( MAKE-1CRATE-VERIFY ?auto_8442 ?auto_8443 ) )
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
      ?auto_8468 - SURFACE
      ?auto_8467 - SURFACE
      ?auto_8466 - SURFACE
      ?auto_8469 - SURFACE
    )
    :vars
    (
      ?auto_8473 - HOIST
      ?auto_8475 - PLACE
      ?auto_8472 - PLACE
      ?auto_8471 - HOIST
      ?auto_8474 - SURFACE
      ?auto_8497 - PLACE
      ?auto_8476 - HOIST
      ?auto_8494 - SURFACE
      ?auto_8485 - PLACE
      ?auto_8488 - HOIST
      ?auto_8487 - SURFACE
      ?auto_8478 - PLACE
      ?auto_8489 - HOIST
      ?auto_8492 - SURFACE
      ?auto_8482 - SURFACE
      ?auto_8483 - PLACE
      ?auto_8477 - HOIST
      ?auto_8486 - SURFACE
      ?auto_8491 - PLACE
      ?auto_8480 - HOIST
      ?auto_8484 - SURFACE
      ?auto_8495 - PLACE
      ?auto_8496 - HOIST
      ?auto_8481 - SURFACE
      ?auto_8493 - PLACE
      ?auto_8490 - HOIST
      ?auto_8479 - SURFACE
      ?auto_8470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8473 ?auto_8475 ) ( IS-CRATE ?auto_8469 ) ( not ( = ?auto_8472 ?auto_8475 ) ) ( HOIST-AT ?auto_8471 ?auto_8472 ) ( AVAILABLE ?auto_8471 ) ( SURFACE-AT ?auto_8469 ?auto_8472 ) ( ON ?auto_8469 ?auto_8474 ) ( CLEAR ?auto_8469 ) ( not ( = ?auto_8466 ?auto_8469 ) ) ( not ( = ?auto_8466 ?auto_8474 ) ) ( not ( = ?auto_8469 ?auto_8474 ) ) ( not ( = ?auto_8473 ?auto_8471 ) ) ( IS-CRATE ?auto_8466 ) ( not ( = ?auto_8497 ?auto_8475 ) ) ( HOIST-AT ?auto_8476 ?auto_8497 ) ( AVAILABLE ?auto_8476 ) ( SURFACE-AT ?auto_8466 ?auto_8497 ) ( ON ?auto_8466 ?auto_8494 ) ( CLEAR ?auto_8466 ) ( not ( = ?auto_8467 ?auto_8466 ) ) ( not ( = ?auto_8467 ?auto_8494 ) ) ( not ( = ?auto_8466 ?auto_8494 ) ) ( not ( = ?auto_8473 ?auto_8476 ) ) ( IS-CRATE ?auto_8467 ) ( not ( = ?auto_8485 ?auto_8475 ) ) ( HOIST-AT ?auto_8488 ?auto_8485 ) ( SURFACE-AT ?auto_8467 ?auto_8485 ) ( ON ?auto_8467 ?auto_8487 ) ( CLEAR ?auto_8467 ) ( not ( = ?auto_8468 ?auto_8467 ) ) ( not ( = ?auto_8468 ?auto_8487 ) ) ( not ( = ?auto_8467 ?auto_8487 ) ) ( not ( = ?auto_8473 ?auto_8488 ) ) ( IS-CRATE ?auto_8468 ) ( not ( = ?auto_8478 ?auto_8475 ) ) ( HOIST-AT ?auto_8489 ?auto_8478 ) ( AVAILABLE ?auto_8489 ) ( SURFACE-AT ?auto_8468 ?auto_8478 ) ( ON ?auto_8468 ?auto_8492 ) ( CLEAR ?auto_8468 ) ( not ( = ?auto_8465 ?auto_8468 ) ) ( not ( = ?auto_8465 ?auto_8492 ) ) ( not ( = ?auto_8468 ?auto_8492 ) ) ( not ( = ?auto_8473 ?auto_8489 ) ) ( IS-CRATE ?auto_8465 ) ( AVAILABLE ?auto_8488 ) ( SURFACE-AT ?auto_8465 ?auto_8485 ) ( ON ?auto_8465 ?auto_8482 ) ( CLEAR ?auto_8465 ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( not ( = ?auto_8464 ?auto_8482 ) ) ( not ( = ?auto_8465 ?auto_8482 ) ) ( IS-CRATE ?auto_8464 ) ( not ( = ?auto_8483 ?auto_8475 ) ) ( HOIST-AT ?auto_8477 ?auto_8483 ) ( AVAILABLE ?auto_8477 ) ( SURFACE-AT ?auto_8464 ?auto_8483 ) ( ON ?auto_8464 ?auto_8486 ) ( CLEAR ?auto_8464 ) ( not ( = ?auto_8463 ?auto_8464 ) ) ( not ( = ?auto_8463 ?auto_8486 ) ) ( not ( = ?auto_8464 ?auto_8486 ) ) ( not ( = ?auto_8473 ?auto_8477 ) ) ( IS-CRATE ?auto_8463 ) ( not ( = ?auto_8491 ?auto_8475 ) ) ( HOIST-AT ?auto_8480 ?auto_8491 ) ( AVAILABLE ?auto_8480 ) ( SURFACE-AT ?auto_8463 ?auto_8491 ) ( ON ?auto_8463 ?auto_8484 ) ( CLEAR ?auto_8463 ) ( not ( = ?auto_8462 ?auto_8463 ) ) ( not ( = ?auto_8462 ?auto_8484 ) ) ( not ( = ?auto_8463 ?auto_8484 ) ) ( not ( = ?auto_8473 ?auto_8480 ) ) ( IS-CRATE ?auto_8462 ) ( not ( = ?auto_8495 ?auto_8475 ) ) ( HOIST-AT ?auto_8496 ?auto_8495 ) ( AVAILABLE ?auto_8496 ) ( SURFACE-AT ?auto_8462 ?auto_8495 ) ( ON ?auto_8462 ?auto_8481 ) ( CLEAR ?auto_8462 ) ( not ( = ?auto_8461 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8481 ) ) ( not ( = ?auto_8462 ?auto_8481 ) ) ( not ( = ?auto_8473 ?auto_8496 ) ) ( SURFACE-AT ?auto_8460 ?auto_8475 ) ( CLEAR ?auto_8460 ) ( IS-CRATE ?auto_8461 ) ( AVAILABLE ?auto_8473 ) ( not ( = ?auto_8493 ?auto_8475 ) ) ( HOIST-AT ?auto_8490 ?auto_8493 ) ( AVAILABLE ?auto_8490 ) ( SURFACE-AT ?auto_8461 ?auto_8493 ) ( ON ?auto_8461 ?auto_8479 ) ( CLEAR ?auto_8461 ) ( TRUCK-AT ?auto_8470 ?auto_8475 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8479 ) ) ( not ( = ?auto_8461 ?auto_8479 ) ) ( not ( = ?auto_8473 ?auto_8490 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( not ( = ?auto_8460 ?auto_8481 ) ) ( not ( = ?auto_8462 ?auto_8479 ) ) ( not ( = ?auto_8495 ?auto_8493 ) ) ( not ( = ?auto_8496 ?auto_8490 ) ) ( not ( = ?auto_8481 ?auto_8479 ) ) ( not ( = ?auto_8460 ?auto_8463 ) ) ( not ( = ?auto_8460 ?auto_8484 ) ) ( not ( = ?auto_8461 ?auto_8463 ) ) ( not ( = ?auto_8461 ?auto_8484 ) ) ( not ( = ?auto_8463 ?auto_8481 ) ) ( not ( = ?auto_8463 ?auto_8479 ) ) ( not ( = ?auto_8491 ?auto_8495 ) ) ( not ( = ?auto_8491 ?auto_8493 ) ) ( not ( = ?auto_8480 ?auto_8496 ) ) ( not ( = ?auto_8480 ?auto_8490 ) ) ( not ( = ?auto_8484 ?auto_8481 ) ) ( not ( = ?auto_8484 ?auto_8479 ) ) ( not ( = ?auto_8460 ?auto_8464 ) ) ( not ( = ?auto_8460 ?auto_8486 ) ) ( not ( = ?auto_8461 ?auto_8464 ) ) ( not ( = ?auto_8461 ?auto_8486 ) ) ( not ( = ?auto_8462 ?auto_8464 ) ) ( not ( = ?auto_8462 ?auto_8486 ) ) ( not ( = ?auto_8464 ?auto_8484 ) ) ( not ( = ?auto_8464 ?auto_8481 ) ) ( not ( = ?auto_8464 ?auto_8479 ) ) ( not ( = ?auto_8483 ?auto_8491 ) ) ( not ( = ?auto_8483 ?auto_8495 ) ) ( not ( = ?auto_8483 ?auto_8493 ) ) ( not ( = ?auto_8477 ?auto_8480 ) ) ( not ( = ?auto_8477 ?auto_8496 ) ) ( not ( = ?auto_8477 ?auto_8490 ) ) ( not ( = ?auto_8486 ?auto_8484 ) ) ( not ( = ?auto_8486 ?auto_8481 ) ) ( not ( = ?auto_8486 ?auto_8479 ) ) ( not ( = ?auto_8460 ?auto_8465 ) ) ( not ( = ?auto_8460 ?auto_8482 ) ) ( not ( = ?auto_8461 ?auto_8465 ) ) ( not ( = ?auto_8461 ?auto_8482 ) ) ( not ( = ?auto_8462 ?auto_8465 ) ) ( not ( = ?auto_8462 ?auto_8482 ) ) ( not ( = ?auto_8463 ?auto_8465 ) ) ( not ( = ?auto_8463 ?auto_8482 ) ) ( not ( = ?auto_8465 ?auto_8486 ) ) ( not ( = ?auto_8465 ?auto_8484 ) ) ( not ( = ?auto_8465 ?auto_8481 ) ) ( not ( = ?auto_8465 ?auto_8479 ) ) ( not ( = ?auto_8485 ?auto_8483 ) ) ( not ( = ?auto_8485 ?auto_8491 ) ) ( not ( = ?auto_8485 ?auto_8495 ) ) ( not ( = ?auto_8485 ?auto_8493 ) ) ( not ( = ?auto_8488 ?auto_8477 ) ) ( not ( = ?auto_8488 ?auto_8480 ) ) ( not ( = ?auto_8488 ?auto_8496 ) ) ( not ( = ?auto_8488 ?auto_8490 ) ) ( not ( = ?auto_8482 ?auto_8486 ) ) ( not ( = ?auto_8482 ?auto_8484 ) ) ( not ( = ?auto_8482 ?auto_8481 ) ) ( not ( = ?auto_8482 ?auto_8479 ) ) ( not ( = ?auto_8460 ?auto_8468 ) ) ( not ( = ?auto_8460 ?auto_8492 ) ) ( not ( = ?auto_8461 ?auto_8468 ) ) ( not ( = ?auto_8461 ?auto_8492 ) ) ( not ( = ?auto_8462 ?auto_8468 ) ) ( not ( = ?auto_8462 ?auto_8492 ) ) ( not ( = ?auto_8463 ?auto_8468 ) ) ( not ( = ?auto_8463 ?auto_8492 ) ) ( not ( = ?auto_8464 ?auto_8468 ) ) ( not ( = ?auto_8464 ?auto_8492 ) ) ( not ( = ?auto_8468 ?auto_8482 ) ) ( not ( = ?auto_8468 ?auto_8486 ) ) ( not ( = ?auto_8468 ?auto_8484 ) ) ( not ( = ?auto_8468 ?auto_8481 ) ) ( not ( = ?auto_8468 ?auto_8479 ) ) ( not ( = ?auto_8478 ?auto_8485 ) ) ( not ( = ?auto_8478 ?auto_8483 ) ) ( not ( = ?auto_8478 ?auto_8491 ) ) ( not ( = ?auto_8478 ?auto_8495 ) ) ( not ( = ?auto_8478 ?auto_8493 ) ) ( not ( = ?auto_8489 ?auto_8488 ) ) ( not ( = ?auto_8489 ?auto_8477 ) ) ( not ( = ?auto_8489 ?auto_8480 ) ) ( not ( = ?auto_8489 ?auto_8496 ) ) ( not ( = ?auto_8489 ?auto_8490 ) ) ( not ( = ?auto_8492 ?auto_8482 ) ) ( not ( = ?auto_8492 ?auto_8486 ) ) ( not ( = ?auto_8492 ?auto_8484 ) ) ( not ( = ?auto_8492 ?auto_8481 ) ) ( not ( = ?auto_8492 ?auto_8479 ) ) ( not ( = ?auto_8460 ?auto_8467 ) ) ( not ( = ?auto_8460 ?auto_8487 ) ) ( not ( = ?auto_8461 ?auto_8467 ) ) ( not ( = ?auto_8461 ?auto_8487 ) ) ( not ( = ?auto_8462 ?auto_8467 ) ) ( not ( = ?auto_8462 ?auto_8487 ) ) ( not ( = ?auto_8463 ?auto_8467 ) ) ( not ( = ?auto_8463 ?auto_8487 ) ) ( not ( = ?auto_8464 ?auto_8467 ) ) ( not ( = ?auto_8464 ?auto_8487 ) ) ( not ( = ?auto_8465 ?auto_8467 ) ) ( not ( = ?auto_8465 ?auto_8487 ) ) ( not ( = ?auto_8467 ?auto_8492 ) ) ( not ( = ?auto_8467 ?auto_8482 ) ) ( not ( = ?auto_8467 ?auto_8486 ) ) ( not ( = ?auto_8467 ?auto_8484 ) ) ( not ( = ?auto_8467 ?auto_8481 ) ) ( not ( = ?auto_8467 ?auto_8479 ) ) ( not ( = ?auto_8487 ?auto_8492 ) ) ( not ( = ?auto_8487 ?auto_8482 ) ) ( not ( = ?auto_8487 ?auto_8486 ) ) ( not ( = ?auto_8487 ?auto_8484 ) ) ( not ( = ?auto_8487 ?auto_8481 ) ) ( not ( = ?auto_8487 ?auto_8479 ) ) ( not ( = ?auto_8460 ?auto_8466 ) ) ( not ( = ?auto_8460 ?auto_8494 ) ) ( not ( = ?auto_8461 ?auto_8466 ) ) ( not ( = ?auto_8461 ?auto_8494 ) ) ( not ( = ?auto_8462 ?auto_8466 ) ) ( not ( = ?auto_8462 ?auto_8494 ) ) ( not ( = ?auto_8463 ?auto_8466 ) ) ( not ( = ?auto_8463 ?auto_8494 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( not ( = ?auto_8464 ?auto_8494 ) ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( not ( = ?auto_8465 ?auto_8494 ) ) ( not ( = ?auto_8468 ?auto_8466 ) ) ( not ( = ?auto_8468 ?auto_8494 ) ) ( not ( = ?auto_8466 ?auto_8487 ) ) ( not ( = ?auto_8466 ?auto_8492 ) ) ( not ( = ?auto_8466 ?auto_8482 ) ) ( not ( = ?auto_8466 ?auto_8486 ) ) ( not ( = ?auto_8466 ?auto_8484 ) ) ( not ( = ?auto_8466 ?auto_8481 ) ) ( not ( = ?auto_8466 ?auto_8479 ) ) ( not ( = ?auto_8497 ?auto_8485 ) ) ( not ( = ?auto_8497 ?auto_8478 ) ) ( not ( = ?auto_8497 ?auto_8483 ) ) ( not ( = ?auto_8497 ?auto_8491 ) ) ( not ( = ?auto_8497 ?auto_8495 ) ) ( not ( = ?auto_8497 ?auto_8493 ) ) ( not ( = ?auto_8476 ?auto_8488 ) ) ( not ( = ?auto_8476 ?auto_8489 ) ) ( not ( = ?auto_8476 ?auto_8477 ) ) ( not ( = ?auto_8476 ?auto_8480 ) ) ( not ( = ?auto_8476 ?auto_8496 ) ) ( not ( = ?auto_8476 ?auto_8490 ) ) ( not ( = ?auto_8494 ?auto_8487 ) ) ( not ( = ?auto_8494 ?auto_8492 ) ) ( not ( = ?auto_8494 ?auto_8482 ) ) ( not ( = ?auto_8494 ?auto_8486 ) ) ( not ( = ?auto_8494 ?auto_8484 ) ) ( not ( = ?auto_8494 ?auto_8481 ) ) ( not ( = ?auto_8494 ?auto_8479 ) ) ( not ( = ?auto_8460 ?auto_8469 ) ) ( not ( = ?auto_8460 ?auto_8474 ) ) ( not ( = ?auto_8461 ?auto_8469 ) ) ( not ( = ?auto_8461 ?auto_8474 ) ) ( not ( = ?auto_8462 ?auto_8469 ) ) ( not ( = ?auto_8462 ?auto_8474 ) ) ( not ( = ?auto_8463 ?auto_8469 ) ) ( not ( = ?auto_8463 ?auto_8474 ) ) ( not ( = ?auto_8464 ?auto_8469 ) ) ( not ( = ?auto_8464 ?auto_8474 ) ) ( not ( = ?auto_8465 ?auto_8469 ) ) ( not ( = ?auto_8465 ?auto_8474 ) ) ( not ( = ?auto_8468 ?auto_8469 ) ) ( not ( = ?auto_8468 ?auto_8474 ) ) ( not ( = ?auto_8467 ?auto_8469 ) ) ( not ( = ?auto_8467 ?auto_8474 ) ) ( not ( = ?auto_8469 ?auto_8494 ) ) ( not ( = ?auto_8469 ?auto_8487 ) ) ( not ( = ?auto_8469 ?auto_8492 ) ) ( not ( = ?auto_8469 ?auto_8482 ) ) ( not ( = ?auto_8469 ?auto_8486 ) ) ( not ( = ?auto_8469 ?auto_8484 ) ) ( not ( = ?auto_8469 ?auto_8481 ) ) ( not ( = ?auto_8469 ?auto_8479 ) ) ( not ( = ?auto_8472 ?auto_8497 ) ) ( not ( = ?auto_8472 ?auto_8485 ) ) ( not ( = ?auto_8472 ?auto_8478 ) ) ( not ( = ?auto_8472 ?auto_8483 ) ) ( not ( = ?auto_8472 ?auto_8491 ) ) ( not ( = ?auto_8472 ?auto_8495 ) ) ( not ( = ?auto_8472 ?auto_8493 ) ) ( not ( = ?auto_8471 ?auto_8476 ) ) ( not ( = ?auto_8471 ?auto_8488 ) ) ( not ( = ?auto_8471 ?auto_8489 ) ) ( not ( = ?auto_8471 ?auto_8477 ) ) ( not ( = ?auto_8471 ?auto_8480 ) ) ( not ( = ?auto_8471 ?auto_8496 ) ) ( not ( = ?auto_8471 ?auto_8490 ) ) ( not ( = ?auto_8474 ?auto_8494 ) ) ( not ( = ?auto_8474 ?auto_8487 ) ) ( not ( = ?auto_8474 ?auto_8492 ) ) ( not ( = ?auto_8474 ?auto_8482 ) ) ( not ( = ?auto_8474 ?auto_8486 ) ) ( not ( = ?auto_8474 ?auto_8484 ) ) ( not ( = ?auto_8474 ?auto_8481 ) ) ( not ( = ?auto_8474 ?auto_8479 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8468 ?auto_8467 ?auto_8466 )
      ( MAKE-1CRATE ?auto_8466 ?auto_8469 )
      ( MAKE-9CRATE-VERIFY ?auto_8460 ?auto_8461 ?auto_8462 ?auto_8463 ?auto_8464 ?auto_8465 ?auto_8468 ?auto_8467 ?auto_8466 ?auto_8469 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8500 - SURFACE
      ?auto_8501 - SURFACE
    )
    :vars
    (
      ?auto_8502 - HOIST
      ?auto_8503 - PLACE
      ?auto_8505 - PLACE
      ?auto_8506 - HOIST
      ?auto_8507 - SURFACE
      ?auto_8504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8502 ?auto_8503 ) ( SURFACE-AT ?auto_8500 ?auto_8503 ) ( CLEAR ?auto_8500 ) ( IS-CRATE ?auto_8501 ) ( AVAILABLE ?auto_8502 ) ( not ( = ?auto_8505 ?auto_8503 ) ) ( HOIST-AT ?auto_8506 ?auto_8505 ) ( AVAILABLE ?auto_8506 ) ( SURFACE-AT ?auto_8501 ?auto_8505 ) ( ON ?auto_8501 ?auto_8507 ) ( CLEAR ?auto_8501 ) ( TRUCK-AT ?auto_8504 ?auto_8503 ) ( not ( = ?auto_8500 ?auto_8501 ) ) ( not ( = ?auto_8500 ?auto_8507 ) ) ( not ( = ?auto_8501 ?auto_8507 ) ) ( not ( = ?auto_8502 ?auto_8506 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8504 ?auto_8503 ?auto_8505 )
      ( !LIFT ?auto_8506 ?auto_8501 ?auto_8507 ?auto_8505 )
      ( !LOAD ?auto_8506 ?auto_8501 ?auto_8504 ?auto_8505 )
      ( !DRIVE ?auto_8504 ?auto_8505 ?auto_8503 )
      ( !UNLOAD ?auto_8502 ?auto_8501 ?auto_8504 ?auto_8503 )
      ( !DROP ?auto_8502 ?auto_8501 ?auto_8500 ?auto_8503 )
      ( MAKE-1CRATE-VERIFY ?auto_8500 ?auto_8501 ) )
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
      ?auto_8527 - SURFACE
      ?auto_8526 - SURFACE
      ?auto_8525 - SURFACE
      ?auto_8528 - SURFACE
      ?auto_8529 - SURFACE
    )
    :vars
    (
      ?auto_8531 - HOIST
      ?auto_8532 - PLACE
      ?auto_8535 - PLACE
      ?auto_8530 - HOIST
      ?auto_8534 - SURFACE
      ?auto_8546 - PLACE
      ?auto_8540 - HOIST
      ?auto_8548 - SURFACE
      ?auto_8539 - PLACE
      ?auto_8552 - HOIST
      ?auto_8543 - SURFACE
      ?auto_8536 - PLACE
      ?auto_8537 - HOIST
      ?auto_8560 - SURFACE
      ?auto_8558 - PLACE
      ?auto_8541 - HOIST
      ?auto_8557 - SURFACE
      ?auto_8549 - SURFACE
      ?auto_8554 - PLACE
      ?auto_8553 - HOIST
      ?auto_8559 - SURFACE
      ?auto_8542 - PLACE
      ?auto_8551 - HOIST
      ?auto_8538 - SURFACE
      ?auto_8556 - PLACE
      ?auto_8555 - HOIST
      ?auto_8550 - SURFACE
      ?auto_8544 - PLACE
      ?auto_8547 - HOIST
      ?auto_8545 - SURFACE
      ?auto_8533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8531 ?auto_8532 ) ( IS-CRATE ?auto_8529 ) ( not ( = ?auto_8535 ?auto_8532 ) ) ( HOIST-AT ?auto_8530 ?auto_8535 ) ( AVAILABLE ?auto_8530 ) ( SURFACE-AT ?auto_8529 ?auto_8535 ) ( ON ?auto_8529 ?auto_8534 ) ( CLEAR ?auto_8529 ) ( not ( = ?auto_8528 ?auto_8529 ) ) ( not ( = ?auto_8528 ?auto_8534 ) ) ( not ( = ?auto_8529 ?auto_8534 ) ) ( not ( = ?auto_8531 ?auto_8530 ) ) ( IS-CRATE ?auto_8528 ) ( not ( = ?auto_8546 ?auto_8532 ) ) ( HOIST-AT ?auto_8540 ?auto_8546 ) ( AVAILABLE ?auto_8540 ) ( SURFACE-AT ?auto_8528 ?auto_8546 ) ( ON ?auto_8528 ?auto_8548 ) ( CLEAR ?auto_8528 ) ( not ( = ?auto_8525 ?auto_8528 ) ) ( not ( = ?auto_8525 ?auto_8548 ) ) ( not ( = ?auto_8528 ?auto_8548 ) ) ( not ( = ?auto_8531 ?auto_8540 ) ) ( IS-CRATE ?auto_8525 ) ( not ( = ?auto_8539 ?auto_8532 ) ) ( HOIST-AT ?auto_8552 ?auto_8539 ) ( AVAILABLE ?auto_8552 ) ( SURFACE-AT ?auto_8525 ?auto_8539 ) ( ON ?auto_8525 ?auto_8543 ) ( CLEAR ?auto_8525 ) ( not ( = ?auto_8526 ?auto_8525 ) ) ( not ( = ?auto_8526 ?auto_8543 ) ) ( not ( = ?auto_8525 ?auto_8543 ) ) ( not ( = ?auto_8531 ?auto_8552 ) ) ( IS-CRATE ?auto_8526 ) ( not ( = ?auto_8536 ?auto_8532 ) ) ( HOIST-AT ?auto_8537 ?auto_8536 ) ( SURFACE-AT ?auto_8526 ?auto_8536 ) ( ON ?auto_8526 ?auto_8560 ) ( CLEAR ?auto_8526 ) ( not ( = ?auto_8527 ?auto_8526 ) ) ( not ( = ?auto_8527 ?auto_8560 ) ) ( not ( = ?auto_8526 ?auto_8560 ) ) ( not ( = ?auto_8531 ?auto_8537 ) ) ( IS-CRATE ?auto_8527 ) ( not ( = ?auto_8558 ?auto_8532 ) ) ( HOIST-AT ?auto_8541 ?auto_8558 ) ( AVAILABLE ?auto_8541 ) ( SURFACE-AT ?auto_8527 ?auto_8558 ) ( ON ?auto_8527 ?auto_8557 ) ( CLEAR ?auto_8527 ) ( not ( = ?auto_8524 ?auto_8527 ) ) ( not ( = ?auto_8524 ?auto_8557 ) ) ( not ( = ?auto_8527 ?auto_8557 ) ) ( not ( = ?auto_8531 ?auto_8541 ) ) ( IS-CRATE ?auto_8524 ) ( AVAILABLE ?auto_8537 ) ( SURFACE-AT ?auto_8524 ?auto_8536 ) ( ON ?auto_8524 ?auto_8549 ) ( CLEAR ?auto_8524 ) ( not ( = ?auto_8523 ?auto_8524 ) ) ( not ( = ?auto_8523 ?auto_8549 ) ) ( not ( = ?auto_8524 ?auto_8549 ) ) ( IS-CRATE ?auto_8523 ) ( not ( = ?auto_8554 ?auto_8532 ) ) ( HOIST-AT ?auto_8553 ?auto_8554 ) ( AVAILABLE ?auto_8553 ) ( SURFACE-AT ?auto_8523 ?auto_8554 ) ( ON ?auto_8523 ?auto_8559 ) ( CLEAR ?auto_8523 ) ( not ( = ?auto_8522 ?auto_8523 ) ) ( not ( = ?auto_8522 ?auto_8559 ) ) ( not ( = ?auto_8523 ?auto_8559 ) ) ( not ( = ?auto_8531 ?auto_8553 ) ) ( IS-CRATE ?auto_8522 ) ( not ( = ?auto_8542 ?auto_8532 ) ) ( HOIST-AT ?auto_8551 ?auto_8542 ) ( AVAILABLE ?auto_8551 ) ( SURFACE-AT ?auto_8522 ?auto_8542 ) ( ON ?auto_8522 ?auto_8538 ) ( CLEAR ?auto_8522 ) ( not ( = ?auto_8521 ?auto_8522 ) ) ( not ( = ?auto_8521 ?auto_8538 ) ) ( not ( = ?auto_8522 ?auto_8538 ) ) ( not ( = ?auto_8531 ?auto_8551 ) ) ( IS-CRATE ?auto_8521 ) ( not ( = ?auto_8556 ?auto_8532 ) ) ( HOIST-AT ?auto_8555 ?auto_8556 ) ( AVAILABLE ?auto_8555 ) ( SURFACE-AT ?auto_8521 ?auto_8556 ) ( ON ?auto_8521 ?auto_8550 ) ( CLEAR ?auto_8521 ) ( not ( = ?auto_8520 ?auto_8521 ) ) ( not ( = ?auto_8520 ?auto_8550 ) ) ( not ( = ?auto_8521 ?auto_8550 ) ) ( not ( = ?auto_8531 ?auto_8555 ) ) ( SURFACE-AT ?auto_8519 ?auto_8532 ) ( CLEAR ?auto_8519 ) ( IS-CRATE ?auto_8520 ) ( AVAILABLE ?auto_8531 ) ( not ( = ?auto_8544 ?auto_8532 ) ) ( HOIST-AT ?auto_8547 ?auto_8544 ) ( AVAILABLE ?auto_8547 ) ( SURFACE-AT ?auto_8520 ?auto_8544 ) ( ON ?auto_8520 ?auto_8545 ) ( CLEAR ?auto_8520 ) ( TRUCK-AT ?auto_8533 ?auto_8532 ) ( not ( = ?auto_8519 ?auto_8520 ) ) ( not ( = ?auto_8519 ?auto_8545 ) ) ( not ( = ?auto_8520 ?auto_8545 ) ) ( not ( = ?auto_8531 ?auto_8547 ) ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8550 ) ) ( not ( = ?auto_8521 ?auto_8545 ) ) ( not ( = ?auto_8556 ?auto_8544 ) ) ( not ( = ?auto_8555 ?auto_8547 ) ) ( not ( = ?auto_8550 ?auto_8545 ) ) ( not ( = ?auto_8519 ?auto_8522 ) ) ( not ( = ?auto_8519 ?auto_8538 ) ) ( not ( = ?auto_8520 ?auto_8522 ) ) ( not ( = ?auto_8520 ?auto_8538 ) ) ( not ( = ?auto_8522 ?auto_8550 ) ) ( not ( = ?auto_8522 ?auto_8545 ) ) ( not ( = ?auto_8542 ?auto_8556 ) ) ( not ( = ?auto_8542 ?auto_8544 ) ) ( not ( = ?auto_8551 ?auto_8555 ) ) ( not ( = ?auto_8551 ?auto_8547 ) ) ( not ( = ?auto_8538 ?auto_8550 ) ) ( not ( = ?auto_8538 ?auto_8545 ) ) ( not ( = ?auto_8519 ?auto_8523 ) ) ( not ( = ?auto_8519 ?auto_8559 ) ) ( not ( = ?auto_8520 ?auto_8523 ) ) ( not ( = ?auto_8520 ?auto_8559 ) ) ( not ( = ?auto_8521 ?auto_8523 ) ) ( not ( = ?auto_8521 ?auto_8559 ) ) ( not ( = ?auto_8523 ?auto_8538 ) ) ( not ( = ?auto_8523 ?auto_8550 ) ) ( not ( = ?auto_8523 ?auto_8545 ) ) ( not ( = ?auto_8554 ?auto_8542 ) ) ( not ( = ?auto_8554 ?auto_8556 ) ) ( not ( = ?auto_8554 ?auto_8544 ) ) ( not ( = ?auto_8553 ?auto_8551 ) ) ( not ( = ?auto_8553 ?auto_8555 ) ) ( not ( = ?auto_8553 ?auto_8547 ) ) ( not ( = ?auto_8559 ?auto_8538 ) ) ( not ( = ?auto_8559 ?auto_8550 ) ) ( not ( = ?auto_8559 ?auto_8545 ) ) ( not ( = ?auto_8519 ?auto_8524 ) ) ( not ( = ?auto_8519 ?auto_8549 ) ) ( not ( = ?auto_8520 ?auto_8524 ) ) ( not ( = ?auto_8520 ?auto_8549 ) ) ( not ( = ?auto_8521 ?auto_8524 ) ) ( not ( = ?auto_8521 ?auto_8549 ) ) ( not ( = ?auto_8522 ?auto_8524 ) ) ( not ( = ?auto_8522 ?auto_8549 ) ) ( not ( = ?auto_8524 ?auto_8559 ) ) ( not ( = ?auto_8524 ?auto_8538 ) ) ( not ( = ?auto_8524 ?auto_8550 ) ) ( not ( = ?auto_8524 ?auto_8545 ) ) ( not ( = ?auto_8536 ?auto_8554 ) ) ( not ( = ?auto_8536 ?auto_8542 ) ) ( not ( = ?auto_8536 ?auto_8556 ) ) ( not ( = ?auto_8536 ?auto_8544 ) ) ( not ( = ?auto_8537 ?auto_8553 ) ) ( not ( = ?auto_8537 ?auto_8551 ) ) ( not ( = ?auto_8537 ?auto_8555 ) ) ( not ( = ?auto_8537 ?auto_8547 ) ) ( not ( = ?auto_8549 ?auto_8559 ) ) ( not ( = ?auto_8549 ?auto_8538 ) ) ( not ( = ?auto_8549 ?auto_8550 ) ) ( not ( = ?auto_8549 ?auto_8545 ) ) ( not ( = ?auto_8519 ?auto_8527 ) ) ( not ( = ?auto_8519 ?auto_8557 ) ) ( not ( = ?auto_8520 ?auto_8527 ) ) ( not ( = ?auto_8520 ?auto_8557 ) ) ( not ( = ?auto_8521 ?auto_8527 ) ) ( not ( = ?auto_8521 ?auto_8557 ) ) ( not ( = ?auto_8522 ?auto_8527 ) ) ( not ( = ?auto_8522 ?auto_8557 ) ) ( not ( = ?auto_8523 ?auto_8527 ) ) ( not ( = ?auto_8523 ?auto_8557 ) ) ( not ( = ?auto_8527 ?auto_8549 ) ) ( not ( = ?auto_8527 ?auto_8559 ) ) ( not ( = ?auto_8527 ?auto_8538 ) ) ( not ( = ?auto_8527 ?auto_8550 ) ) ( not ( = ?auto_8527 ?auto_8545 ) ) ( not ( = ?auto_8558 ?auto_8536 ) ) ( not ( = ?auto_8558 ?auto_8554 ) ) ( not ( = ?auto_8558 ?auto_8542 ) ) ( not ( = ?auto_8558 ?auto_8556 ) ) ( not ( = ?auto_8558 ?auto_8544 ) ) ( not ( = ?auto_8541 ?auto_8537 ) ) ( not ( = ?auto_8541 ?auto_8553 ) ) ( not ( = ?auto_8541 ?auto_8551 ) ) ( not ( = ?auto_8541 ?auto_8555 ) ) ( not ( = ?auto_8541 ?auto_8547 ) ) ( not ( = ?auto_8557 ?auto_8549 ) ) ( not ( = ?auto_8557 ?auto_8559 ) ) ( not ( = ?auto_8557 ?auto_8538 ) ) ( not ( = ?auto_8557 ?auto_8550 ) ) ( not ( = ?auto_8557 ?auto_8545 ) ) ( not ( = ?auto_8519 ?auto_8526 ) ) ( not ( = ?auto_8519 ?auto_8560 ) ) ( not ( = ?auto_8520 ?auto_8526 ) ) ( not ( = ?auto_8520 ?auto_8560 ) ) ( not ( = ?auto_8521 ?auto_8526 ) ) ( not ( = ?auto_8521 ?auto_8560 ) ) ( not ( = ?auto_8522 ?auto_8526 ) ) ( not ( = ?auto_8522 ?auto_8560 ) ) ( not ( = ?auto_8523 ?auto_8526 ) ) ( not ( = ?auto_8523 ?auto_8560 ) ) ( not ( = ?auto_8524 ?auto_8526 ) ) ( not ( = ?auto_8524 ?auto_8560 ) ) ( not ( = ?auto_8526 ?auto_8557 ) ) ( not ( = ?auto_8526 ?auto_8549 ) ) ( not ( = ?auto_8526 ?auto_8559 ) ) ( not ( = ?auto_8526 ?auto_8538 ) ) ( not ( = ?auto_8526 ?auto_8550 ) ) ( not ( = ?auto_8526 ?auto_8545 ) ) ( not ( = ?auto_8560 ?auto_8557 ) ) ( not ( = ?auto_8560 ?auto_8549 ) ) ( not ( = ?auto_8560 ?auto_8559 ) ) ( not ( = ?auto_8560 ?auto_8538 ) ) ( not ( = ?auto_8560 ?auto_8550 ) ) ( not ( = ?auto_8560 ?auto_8545 ) ) ( not ( = ?auto_8519 ?auto_8525 ) ) ( not ( = ?auto_8519 ?auto_8543 ) ) ( not ( = ?auto_8520 ?auto_8525 ) ) ( not ( = ?auto_8520 ?auto_8543 ) ) ( not ( = ?auto_8521 ?auto_8525 ) ) ( not ( = ?auto_8521 ?auto_8543 ) ) ( not ( = ?auto_8522 ?auto_8525 ) ) ( not ( = ?auto_8522 ?auto_8543 ) ) ( not ( = ?auto_8523 ?auto_8525 ) ) ( not ( = ?auto_8523 ?auto_8543 ) ) ( not ( = ?auto_8524 ?auto_8525 ) ) ( not ( = ?auto_8524 ?auto_8543 ) ) ( not ( = ?auto_8527 ?auto_8525 ) ) ( not ( = ?auto_8527 ?auto_8543 ) ) ( not ( = ?auto_8525 ?auto_8560 ) ) ( not ( = ?auto_8525 ?auto_8557 ) ) ( not ( = ?auto_8525 ?auto_8549 ) ) ( not ( = ?auto_8525 ?auto_8559 ) ) ( not ( = ?auto_8525 ?auto_8538 ) ) ( not ( = ?auto_8525 ?auto_8550 ) ) ( not ( = ?auto_8525 ?auto_8545 ) ) ( not ( = ?auto_8539 ?auto_8536 ) ) ( not ( = ?auto_8539 ?auto_8558 ) ) ( not ( = ?auto_8539 ?auto_8554 ) ) ( not ( = ?auto_8539 ?auto_8542 ) ) ( not ( = ?auto_8539 ?auto_8556 ) ) ( not ( = ?auto_8539 ?auto_8544 ) ) ( not ( = ?auto_8552 ?auto_8537 ) ) ( not ( = ?auto_8552 ?auto_8541 ) ) ( not ( = ?auto_8552 ?auto_8553 ) ) ( not ( = ?auto_8552 ?auto_8551 ) ) ( not ( = ?auto_8552 ?auto_8555 ) ) ( not ( = ?auto_8552 ?auto_8547 ) ) ( not ( = ?auto_8543 ?auto_8560 ) ) ( not ( = ?auto_8543 ?auto_8557 ) ) ( not ( = ?auto_8543 ?auto_8549 ) ) ( not ( = ?auto_8543 ?auto_8559 ) ) ( not ( = ?auto_8543 ?auto_8538 ) ) ( not ( = ?auto_8543 ?auto_8550 ) ) ( not ( = ?auto_8543 ?auto_8545 ) ) ( not ( = ?auto_8519 ?auto_8528 ) ) ( not ( = ?auto_8519 ?auto_8548 ) ) ( not ( = ?auto_8520 ?auto_8528 ) ) ( not ( = ?auto_8520 ?auto_8548 ) ) ( not ( = ?auto_8521 ?auto_8528 ) ) ( not ( = ?auto_8521 ?auto_8548 ) ) ( not ( = ?auto_8522 ?auto_8528 ) ) ( not ( = ?auto_8522 ?auto_8548 ) ) ( not ( = ?auto_8523 ?auto_8528 ) ) ( not ( = ?auto_8523 ?auto_8548 ) ) ( not ( = ?auto_8524 ?auto_8528 ) ) ( not ( = ?auto_8524 ?auto_8548 ) ) ( not ( = ?auto_8527 ?auto_8528 ) ) ( not ( = ?auto_8527 ?auto_8548 ) ) ( not ( = ?auto_8526 ?auto_8528 ) ) ( not ( = ?auto_8526 ?auto_8548 ) ) ( not ( = ?auto_8528 ?auto_8543 ) ) ( not ( = ?auto_8528 ?auto_8560 ) ) ( not ( = ?auto_8528 ?auto_8557 ) ) ( not ( = ?auto_8528 ?auto_8549 ) ) ( not ( = ?auto_8528 ?auto_8559 ) ) ( not ( = ?auto_8528 ?auto_8538 ) ) ( not ( = ?auto_8528 ?auto_8550 ) ) ( not ( = ?auto_8528 ?auto_8545 ) ) ( not ( = ?auto_8546 ?auto_8539 ) ) ( not ( = ?auto_8546 ?auto_8536 ) ) ( not ( = ?auto_8546 ?auto_8558 ) ) ( not ( = ?auto_8546 ?auto_8554 ) ) ( not ( = ?auto_8546 ?auto_8542 ) ) ( not ( = ?auto_8546 ?auto_8556 ) ) ( not ( = ?auto_8546 ?auto_8544 ) ) ( not ( = ?auto_8540 ?auto_8552 ) ) ( not ( = ?auto_8540 ?auto_8537 ) ) ( not ( = ?auto_8540 ?auto_8541 ) ) ( not ( = ?auto_8540 ?auto_8553 ) ) ( not ( = ?auto_8540 ?auto_8551 ) ) ( not ( = ?auto_8540 ?auto_8555 ) ) ( not ( = ?auto_8540 ?auto_8547 ) ) ( not ( = ?auto_8548 ?auto_8543 ) ) ( not ( = ?auto_8548 ?auto_8560 ) ) ( not ( = ?auto_8548 ?auto_8557 ) ) ( not ( = ?auto_8548 ?auto_8549 ) ) ( not ( = ?auto_8548 ?auto_8559 ) ) ( not ( = ?auto_8548 ?auto_8538 ) ) ( not ( = ?auto_8548 ?auto_8550 ) ) ( not ( = ?auto_8548 ?auto_8545 ) ) ( not ( = ?auto_8519 ?auto_8529 ) ) ( not ( = ?auto_8519 ?auto_8534 ) ) ( not ( = ?auto_8520 ?auto_8529 ) ) ( not ( = ?auto_8520 ?auto_8534 ) ) ( not ( = ?auto_8521 ?auto_8529 ) ) ( not ( = ?auto_8521 ?auto_8534 ) ) ( not ( = ?auto_8522 ?auto_8529 ) ) ( not ( = ?auto_8522 ?auto_8534 ) ) ( not ( = ?auto_8523 ?auto_8529 ) ) ( not ( = ?auto_8523 ?auto_8534 ) ) ( not ( = ?auto_8524 ?auto_8529 ) ) ( not ( = ?auto_8524 ?auto_8534 ) ) ( not ( = ?auto_8527 ?auto_8529 ) ) ( not ( = ?auto_8527 ?auto_8534 ) ) ( not ( = ?auto_8526 ?auto_8529 ) ) ( not ( = ?auto_8526 ?auto_8534 ) ) ( not ( = ?auto_8525 ?auto_8529 ) ) ( not ( = ?auto_8525 ?auto_8534 ) ) ( not ( = ?auto_8529 ?auto_8548 ) ) ( not ( = ?auto_8529 ?auto_8543 ) ) ( not ( = ?auto_8529 ?auto_8560 ) ) ( not ( = ?auto_8529 ?auto_8557 ) ) ( not ( = ?auto_8529 ?auto_8549 ) ) ( not ( = ?auto_8529 ?auto_8559 ) ) ( not ( = ?auto_8529 ?auto_8538 ) ) ( not ( = ?auto_8529 ?auto_8550 ) ) ( not ( = ?auto_8529 ?auto_8545 ) ) ( not ( = ?auto_8535 ?auto_8546 ) ) ( not ( = ?auto_8535 ?auto_8539 ) ) ( not ( = ?auto_8535 ?auto_8536 ) ) ( not ( = ?auto_8535 ?auto_8558 ) ) ( not ( = ?auto_8535 ?auto_8554 ) ) ( not ( = ?auto_8535 ?auto_8542 ) ) ( not ( = ?auto_8535 ?auto_8556 ) ) ( not ( = ?auto_8535 ?auto_8544 ) ) ( not ( = ?auto_8530 ?auto_8540 ) ) ( not ( = ?auto_8530 ?auto_8552 ) ) ( not ( = ?auto_8530 ?auto_8537 ) ) ( not ( = ?auto_8530 ?auto_8541 ) ) ( not ( = ?auto_8530 ?auto_8553 ) ) ( not ( = ?auto_8530 ?auto_8551 ) ) ( not ( = ?auto_8530 ?auto_8555 ) ) ( not ( = ?auto_8530 ?auto_8547 ) ) ( not ( = ?auto_8534 ?auto_8548 ) ) ( not ( = ?auto_8534 ?auto_8543 ) ) ( not ( = ?auto_8534 ?auto_8560 ) ) ( not ( = ?auto_8534 ?auto_8557 ) ) ( not ( = ?auto_8534 ?auto_8549 ) ) ( not ( = ?auto_8534 ?auto_8559 ) ) ( not ( = ?auto_8534 ?auto_8538 ) ) ( not ( = ?auto_8534 ?auto_8550 ) ) ( not ( = ?auto_8534 ?auto_8545 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8519 ?auto_8520 ?auto_8521 ?auto_8522 ?auto_8523 ?auto_8524 ?auto_8527 ?auto_8526 ?auto_8525 ?auto_8528 )
      ( MAKE-1CRATE ?auto_8528 ?auto_8529 )
      ( MAKE-10CRATE-VERIFY ?auto_8519 ?auto_8520 ?auto_8521 ?auto_8522 ?auto_8523 ?auto_8524 ?auto_8527 ?auto_8526 ?auto_8525 ?auto_8528 ?auto_8529 ) )
  )

)

