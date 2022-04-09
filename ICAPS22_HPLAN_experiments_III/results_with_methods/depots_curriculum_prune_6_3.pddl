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
      ?auto_2157 - SURFACE
      ?auto_2158 - SURFACE
    )
    :vars
    (
      ?auto_2159 - HOIST
      ?auto_2160 - PLACE
      ?auto_2162 - PLACE
      ?auto_2163 - HOIST
      ?auto_2164 - SURFACE
      ?auto_2161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2159 ?auto_2160 ) ( SURFACE-AT ?auto_2157 ?auto_2160 ) ( CLEAR ?auto_2157 ) ( IS-CRATE ?auto_2158 ) ( AVAILABLE ?auto_2159 ) ( not ( = ?auto_2162 ?auto_2160 ) ) ( HOIST-AT ?auto_2163 ?auto_2162 ) ( AVAILABLE ?auto_2163 ) ( SURFACE-AT ?auto_2158 ?auto_2162 ) ( ON ?auto_2158 ?auto_2164 ) ( CLEAR ?auto_2158 ) ( TRUCK-AT ?auto_2161 ?auto_2160 ) ( not ( = ?auto_2157 ?auto_2158 ) ) ( not ( = ?auto_2157 ?auto_2164 ) ) ( not ( = ?auto_2158 ?auto_2164 ) ) ( not ( = ?auto_2159 ?auto_2163 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2161 ?auto_2160 ?auto_2162 )
      ( !LIFT ?auto_2163 ?auto_2158 ?auto_2164 ?auto_2162 )
      ( !LOAD ?auto_2163 ?auto_2158 ?auto_2161 ?auto_2162 )
      ( !DRIVE ?auto_2161 ?auto_2162 ?auto_2160 )
      ( !UNLOAD ?auto_2159 ?auto_2158 ?auto_2161 ?auto_2160 )
      ( !DROP ?auto_2159 ?auto_2158 ?auto_2157 ?auto_2160 )
      ( MAKE-1CRATE-VERIFY ?auto_2157 ?auto_2158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2178 - SURFACE
      ?auto_2179 - SURFACE
      ?auto_2180 - SURFACE
    )
    :vars
    (
      ?auto_2181 - HOIST
      ?auto_2184 - PLACE
      ?auto_2185 - PLACE
      ?auto_2186 - HOIST
      ?auto_2183 - SURFACE
      ?auto_2189 - PLACE
      ?auto_2188 - HOIST
      ?auto_2187 - SURFACE
      ?auto_2182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2181 ?auto_2184 ) ( IS-CRATE ?auto_2180 ) ( not ( = ?auto_2185 ?auto_2184 ) ) ( HOIST-AT ?auto_2186 ?auto_2185 ) ( AVAILABLE ?auto_2186 ) ( SURFACE-AT ?auto_2180 ?auto_2185 ) ( ON ?auto_2180 ?auto_2183 ) ( CLEAR ?auto_2180 ) ( not ( = ?auto_2179 ?auto_2180 ) ) ( not ( = ?auto_2179 ?auto_2183 ) ) ( not ( = ?auto_2180 ?auto_2183 ) ) ( not ( = ?auto_2181 ?auto_2186 ) ) ( SURFACE-AT ?auto_2178 ?auto_2184 ) ( CLEAR ?auto_2178 ) ( IS-CRATE ?auto_2179 ) ( AVAILABLE ?auto_2181 ) ( not ( = ?auto_2189 ?auto_2184 ) ) ( HOIST-AT ?auto_2188 ?auto_2189 ) ( AVAILABLE ?auto_2188 ) ( SURFACE-AT ?auto_2179 ?auto_2189 ) ( ON ?auto_2179 ?auto_2187 ) ( CLEAR ?auto_2179 ) ( TRUCK-AT ?auto_2182 ?auto_2184 ) ( not ( = ?auto_2178 ?auto_2179 ) ) ( not ( = ?auto_2178 ?auto_2187 ) ) ( not ( = ?auto_2179 ?auto_2187 ) ) ( not ( = ?auto_2181 ?auto_2188 ) ) ( not ( = ?auto_2178 ?auto_2180 ) ) ( not ( = ?auto_2178 ?auto_2183 ) ) ( not ( = ?auto_2180 ?auto_2187 ) ) ( not ( = ?auto_2185 ?auto_2189 ) ) ( not ( = ?auto_2186 ?auto_2188 ) ) ( not ( = ?auto_2183 ?auto_2187 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2178 ?auto_2179 )
      ( MAKE-1CRATE ?auto_2179 ?auto_2180 )
      ( MAKE-2CRATE-VERIFY ?auto_2178 ?auto_2179 ?auto_2180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2204 - SURFACE
      ?auto_2205 - SURFACE
      ?auto_2206 - SURFACE
      ?auto_2207 - SURFACE
    )
    :vars
    (
      ?auto_2208 - HOIST
      ?auto_2211 - PLACE
      ?auto_2213 - PLACE
      ?auto_2212 - HOIST
      ?auto_2210 - SURFACE
      ?auto_2217 - PLACE
      ?auto_2219 - HOIST
      ?auto_2218 - SURFACE
      ?auto_2215 - PLACE
      ?auto_2214 - HOIST
      ?auto_2216 - SURFACE
      ?auto_2209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2208 ?auto_2211 ) ( IS-CRATE ?auto_2207 ) ( not ( = ?auto_2213 ?auto_2211 ) ) ( HOIST-AT ?auto_2212 ?auto_2213 ) ( AVAILABLE ?auto_2212 ) ( SURFACE-AT ?auto_2207 ?auto_2213 ) ( ON ?auto_2207 ?auto_2210 ) ( CLEAR ?auto_2207 ) ( not ( = ?auto_2206 ?auto_2207 ) ) ( not ( = ?auto_2206 ?auto_2210 ) ) ( not ( = ?auto_2207 ?auto_2210 ) ) ( not ( = ?auto_2208 ?auto_2212 ) ) ( IS-CRATE ?auto_2206 ) ( not ( = ?auto_2217 ?auto_2211 ) ) ( HOIST-AT ?auto_2219 ?auto_2217 ) ( AVAILABLE ?auto_2219 ) ( SURFACE-AT ?auto_2206 ?auto_2217 ) ( ON ?auto_2206 ?auto_2218 ) ( CLEAR ?auto_2206 ) ( not ( = ?auto_2205 ?auto_2206 ) ) ( not ( = ?auto_2205 ?auto_2218 ) ) ( not ( = ?auto_2206 ?auto_2218 ) ) ( not ( = ?auto_2208 ?auto_2219 ) ) ( SURFACE-AT ?auto_2204 ?auto_2211 ) ( CLEAR ?auto_2204 ) ( IS-CRATE ?auto_2205 ) ( AVAILABLE ?auto_2208 ) ( not ( = ?auto_2215 ?auto_2211 ) ) ( HOIST-AT ?auto_2214 ?auto_2215 ) ( AVAILABLE ?auto_2214 ) ( SURFACE-AT ?auto_2205 ?auto_2215 ) ( ON ?auto_2205 ?auto_2216 ) ( CLEAR ?auto_2205 ) ( TRUCK-AT ?auto_2209 ?auto_2211 ) ( not ( = ?auto_2204 ?auto_2205 ) ) ( not ( = ?auto_2204 ?auto_2216 ) ) ( not ( = ?auto_2205 ?auto_2216 ) ) ( not ( = ?auto_2208 ?auto_2214 ) ) ( not ( = ?auto_2204 ?auto_2206 ) ) ( not ( = ?auto_2204 ?auto_2218 ) ) ( not ( = ?auto_2206 ?auto_2216 ) ) ( not ( = ?auto_2217 ?auto_2215 ) ) ( not ( = ?auto_2219 ?auto_2214 ) ) ( not ( = ?auto_2218 ?auto_2216 ) ) ( not ( = ?auto_2204 ?auto_2207 ) ) ( not ( = ?auto_2204 ?auto_2210 ) ) ( not ( = ?auto_2205 ?auto_2207 ) ) ( not ( = ?auto_2205 ?auto_2210 ) ) ( not ( = ?auto_2207 ?auto_2218 ) ) ( not ( = ?auto_2207 ?auto_2216 ) ) ( not ( = ?auto_2213 ?auto_2217 ) ) ( not ( = ?auto_2213 ?auto_2215 ) ) ( not ( = ?auto_2212 ?auto_2219 ) ) ( not ( = ?auto_2212 ?auto_2214 ) ) ( not ( = ?auto_2210 ?auto_2218 ) ) ( not ( = ?auto_2210 ?auto_2216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2204 ?auto_2205 ?auto_2206 )
      ( MAKE-1CRATE ?auto_2206 ?auto_2207 )
      ( MAKE-3CRATE-VERIFY ?auto_2204 ?auto_2205 ?auto_2206 ?auto_2207 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2235 - SURFACE
      ?auto_2236 - SURFACE
      ?auto_2237 - SURFACE
      ?auto_2238 - SURFACE
      ?auto_2239 - SURFACE
    )
    :vars
    (
      ?auto_2243 - HOIST
      ?auto_2240 - PLACE
      ?auto_2245 - PLACE
      ?auto_2244 - HOIST
      ?auto_2241 - SURFACE
      ?auto_2246 - PLACE
      ?auto_2254 - HOIST
      ?auto_2247 - SURFACE
      ?auto_2253 - PLACE
      ?auto_2250 - HOIST
      ?auto_2252 - SURFACE
      ?auto_2249 - PLACE
      ?auto_2248 - HOIST
      ?auto_2251 - SURFACE
      ?auto_2242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2243 ?auto_2240 ) ( IS-CRATE ?auto_2239 ) ( not ( = ?auto_2245 ?auto_2240 ) ) ( HOIST-AT ?auto_2244 ?auto_2245 ) ( AVAILABLE ?auto_2244 ) ( SURFACE-AT ?auto_2239 ?auto_2245 ) ( ON ?auto_2239 ?auto_2241 ) ( CLEAR ?auto_2239 ) ( not ( = ?auto_2238 ?auto_2239 ) ) ( not ( = ?auto_2238 ?auto_2241 ) ) ( not ( = ?auto_2239 ?auto_2241 ) ) ( not ( = ?auto_2243 ?auto_2244 ) ) ( IS-CRATE ?auto_2238 ) ( not ( = ?auto_2246 ?auto_2240 ) ) ( HOIST-AT ?auto_2254 ?auto_2246 ) ( AVAILABLE ?auto_2254 ) ( SURFACE-AT ?auto_2238 ?auto_2246 ) ( ON ?auto_2238 ?auto_2247 ) ( CLEAR ?auto_2238 ) ( not ( = ?auto_2237 ?auto_2238 ) ) ( not ( = ?auto_2237 ?auto_2247 ) ) ( not ( = ?auto_2238 ?auto_2247 ) ) ( not ( = ?auto_2243 ?auto_2254 ) ) ( IS-CRATE ?auto_2237 ) ( not ( = ?auto_2253 ?auto_2240 ) ) ( HOIST-AT ?auto_2250 ?auto_2253 ) ( AVAILABLE ?auto_2250 ) ( SURFACE-AT ?auto_2237 ?auto_2253 ) ( ON ?auto_2237 ?auto_2252 ) ( CLEAR ?auto_2237 ) ( not ( = ?auto_2236 ?auto_2237 ) ) ( not ( = ?auto_2236 ?auto_2252 ) ) ( not ( = ?auto_2237 ?auto_2252 ) ) ( not ( = ?auto_2243 ?auto_2250 ) ) ( SURFACE-AT ?auto_2235 ?auto_2240 ) ( CLEAR ?auto_2235 ) ( IS-CRATE ?auto_2236 ) ( AVAILABLE ?auto_2243 ) ( not ( = ?auto_2249 ?auto_2240 ) ) ( HOIST-AT ?auto_2248 ?auto_2249 ) ( AVAILABLE ?auto_2248 ) ( SURFACE-AT ?auto_2236 ?auto_2249 ) ( ON ?auto_2236 ?auto_2251 ) ( CLEAR ?auto_2236 ) ( TRUCK-AT ?auto_2242 ?auto_2240 ) ( not ( = ?auto_2235 ?auto_2236 ) ) ( not ( = ?auto_2235 ?auto_2251 ) ) ( not ( = ?auto_2236 ?auto_2251 ) ) ( not ( = ?auto_2243 ?auto_2248 ) ) ( not ( = ?auto_2235 ?auto_2237 ) ) ( not ( = ?auto_2235 ?auto_2252 ) ) ( not ( = ?auto_2237 ?auto_2251 ) ) ( not ( = ?auto_2253 ?auto_2249 ) ) ( not ( = ?auto_2250 ?auto_2248 ) ) ( not ( = ?auto_2252 ?auto_2251 ) ) ( not ( = ?auto_2235 ?auto_2238 ) ) ( not ( = ?auto_2235 ?auto_2247 ) ) ( not ( = ?auto_2236 ?auto_2238 ) ) ( not ( = ?auto_2236 ?auto_2247 ) ) ( not ( = ?auto_2238 ?auto_2252 ) ) ( not ( = ?auto_2238 ?auto_2251 ) ) ( not ( = ?auto_2246 ?auto_2253 ) ) ( not ( = ?auto_2246 ?auto_2249 ) ) ( not ( = ?auto_2254 ?auto_2250 ) ) ( not ( = ?auto_2254 ?auto_2248 ) ) ( not ( = ?auto_2247 ?auto_2252 ) ) ( not ( = ?auto_2247 ?auto_2251 ) ) ( not ( = ?auto_2235 ?auto_2239 ) ) ( not ( = ?auto_2235 ?auto_2241 ) ) ( not ( = ?auto_2236 ?auto_2239 ) ) ( not ( = ?auto_2236 ?auto_2241 ) ) ( not ( = ?auto_2237 ?auto_2239 ) ) ( not ( = ?auto_2237 ?auto_2241 ) ) ( not ( = ?auto_2239 ?auto_2247 ) ) ( not ( = ?auto_2239 ?auto_2252 ) ) ( not ( = ?auto_2239 ?auto_2251 ) ) ( not ( = ?auto_2245 ?auto_2246 ) ) ( not ( = ?auto_2245 ?auto_2253 ) ) ( not ( = ?auto_2245 ?auto_2249 ) ) ( not ( = ?auto_2244 ?auto_2254 ) ) ( not ( = ?auto_2244 ?auto_2250 ) ) ( not ( = ?auto_2244 ?auto_2248 ) ) ( not ( = ?auto_2241 ?auto_2247 ) ) ( not ( = ?auto_2241 ?auto_2252 ) ) ( not ( = ?auto_2241 ?auto_2251 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2235 ?auto_2236 ?auto_2237 ?auto_2238 )
      ( MAKE-1CRATE ?auto_2238 ?auto_2239 )
      ( MAKE-4CRATE-VERIFY ?auto_2235 ?auto_2236 ?auto_2237 ?auto_2238 ?auto_2239 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2271 - SURFACE
      ?auto_2272 - SURFACE
      ?auto_2273 - SURFACE
      ?auto_2274 - SURFACE
      ?auto_2275 - SURFACE
      ?auto_2276 - SURFACE
    )
    :vars
    (
      ?auto_2280 - HOIST
      ?auto_2278 - PLACE
      ?auto_2277 - PLACE
      ?auto_2279 - HOIST
      ?auto_2281 - SURFACE
      ?auto_2287 - PLACE
      ?auto_2290 - HOIST
      ?auto_2291 - SURFACE
      ?auto_2288 - SURFACE
      ?auto_2292 - PLACE
      ?auto_2285 - HOIST
      ?auto_2286 - SURFACE
      ?auto_2289 - PLACE
      ?auto_2284 - HOIST
      ?auto_2283 - SURFACE
      ?auto_2282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280 ?auto_2278 ) ( IS-CRATE ?auto_2276 ) ( not ( = ?auto_2277 ?auto_2278 ) ) ( HOIST-AT ?auto_2279 ?auto_2277 ) ( SURFACE-AT ?auto_2276 ?auto_2277 ) ( ON ?auto_2276 ?auto_2281 ) ( CLEAR ?auto_2276 ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2281 ) ) ( not ( = ?auto_2276 ?auto_2281 ) ) ( not ( = ?auto_2280 ?auto_2279 ) ) ( IS-CRATE ?auto_2275 ) ( not ( = ?auto_2287 ?auto_2278 ) ) ( HOIST-AT ?auto_2290 ?auto_2287 ) ( AVAILABLE ?auto_2290 ) ( SURFACE-AT ?auto_2275 ?auto_2287 ) ( ON ?auto_2275 ?auto_2291 ) ( CLEAR ?auto_2275 ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2274 ?auto_2291 ) ) ( not ( = ?auto_2275 ?auto_2291 ) ) ( not ( = ?auto_2280 ?auto_2290 ) ) ( IS-CRATE ?auto_2274 ) ( AVAILABLE ?auto_2279 ) ( SURFACE-AT ?auto_2274 ?auto_2277 ) ( ON ?auto_2274 ?auto_2288 ) ( CLEAR ?auto_2274 ) ( not ( = ?auto_2273 ?auto_2274 ) ) ( not ( = ?auto_2273 ?auto_2288 ) ) ( not ( = ?auto_2274 ?auto_2288 ) ) ( IS-CRATE ?auto_2273 ) ( not ( = ?auto_2292 ?auto_2278 ) ) ( HOIST-AT ?auto_2285 ?auto_2292 ) ( AVAILABLE ?auto_2285 ) ( SURFACE-AT ?auto_2273 ?auto_2292 ) ( ON ?auto_2273 ?auto_2286 ) ( CLEAR ?auto_2273 ) ( not ( = ?auto_2272 ?auto_2273 ) ) ( not ( = ?auto_2272 ?auto_2286 ) ) ( not ( = ?auto_2273 ?auto_2286 ) ) ( not ( = ?auto_2280 ?auto_2285 ) ) ( SURFACE-AT ?auto_2271 ?auto_2278 ) ( CLEAR ?auto_2271 ) ( IS-CRATE ?auto_2272 ) ( AVAILABLE ?auto_2280 ) ( not ( = ?auto_2289 ?auto_2278 ) ) ( HOIST-AT ?auto_2284 ?auto_2289 ) ( AVAILABLE ?auto_2284 ) ( SURFACE-AT ?auto_2272 ?auto_2289 ) ( ON ?auto_2272 ?auto_2283 ) ( CLEAR ?auto_2272 ) ( TRUCK-AT ?auto_2282 ?auto_2278 ) ( not ( = ?auto_2271 ?auto_2272 ) ) ( not ( = ?auto_2271 ?auto_2283 ) ) ( not ( = ?auto_2272 ?auto_2283 ) ) ( not ( = ?auto_2280 ?auto_2284 ) ) ( not ( = ?auto_2271 ?auto_2273 ) ) ( not ( = ?auto_2271 ?auto_2286 ) ) ( not ( = ?auto_2273 ?auto_2283 ) ) ( not ( = ?auto_2292 ?auto_2289 ) ) ( not ( = ?auto_2285 ?auto_2284 ) ) ( not ( = ?auto_2286 ?auto_2283 ) ) ( not ( = ?auto_2271 ?auto_2274 ) ) ( not ( = ?auto_2271 ?auto_2288 ) ) ( not ( = ?auto_2272 ?auto_2274 ) ) ( not ( = ?auto_2272 ?auto_2288 ) ) ( not ( = ?auto_2274 ?auto_2286 ) ) ( not ( = ?auto_2274 ?auto_2283 ) ) ( not ( = ?auto_2277 ?auto_2292 ) ) ( not ( = ?auto_2277 ?auto_2289 ) ) ( not ( = ?auto_2279 ?auto_2285 ) ) ( not ( = ?auto_2279 ?auto_2284 ) ) ( not ( = ?auto_2288 ?auto_2286 ) ) ( not ( = ?auto_2288 ?auto_2283 ) ) ( not ( = ?auto_2271 ?auto_2275 ) ) ( not ( = ?auto_2271 ?auto_2291 ) ) ( not ( = ?auto_2272 ?auto_2275 ) ) ( not ( = ?auto_2272 ?auto_2291 ) ) ( not ( = ?auto_2273 ?auto_2275 ) ) ( not ( = ?auto_2273 ?auto_2291 ) ) ( not ( = ?auto_2275 ?auto_2288 ) ) ( not ( = ?auto_2275 ?auto_2286 ) ) ( not ( = ?auto_2275 ?auto_2283 ) ) ( not ( = ?auto_2287 ?auto_2277 ) ) ( not ( = ?auto_2287 ?auto_2292 ) ) ( not ( = ?auto_2287 ?auto_2289 ) ) ( not ( = ?auto_2290 ?auto_2279 ) ) ( not ( = ?auto_2290 ?auto_2285 ) ) ( not ( = ?auto_2290 ?auto_2284 ) ) ( not ( = ?auto_2291 ?auto_2288 ) ) ( not ( = ?auto_2291 ?auto_2286 ) ) ( not ( = ?auto_2291 ?auto_2283 ) ) ( not ( = ?auto_2271 ?auto_2276 ) ) ( not ( = ?auto_2271 ?auto_2281 ) ) ( not ( = ?auto_2272 ?auto_2276 ) ) ( not ( = ?auto_2272 ?auto_2281 ) ) ( not ( = ?auto_2273 ?auto_2276 ) ) ( not ( = ?auto_2273 ?auto_2281 ) ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2274 ?auto_2281 ) ) ( not ( = ?auto_2276 ?auto_2291 ) ) ( not ( = ?auto_2276 ?auto_2288 ) ) ( not ( = ?auto_2276 ?auto_2286 ) ) ( not ( = ?auto_2276 ?auto_2283 ) ) ( not ( = ?auto_2281 ?auto_2291 ) ) ( not ( = ?auto_2281 ?auto_2288 ) ) ( not ( = ?auto_2281 ?auto_2286 ) ) ( not ( = ?auto_2281 ?auto_2283 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2271 ?auto_2272 ?auto_2273 ?auto_2274 ?auto_2275 )
      ( MAKE-1CRATE ?auto_2275 ?auto_2276 )
      ( MAKE-5CRATE-VERIFY ?auto_2271 ?auto_2272 ?auto_2273 ?auto_2274 ?auto_2275 ?auto_2276 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2310 - SURFACE
      ?auto_2311 - SURFACE
      ?auto_2312 - SURFACE
      ?auto_2313 - SURFACE
      ?auto_2314 - SURFACE
      ?auto_2315 - SURFACE
      ?auto_2316 - SURFACE
    )
    :vars
    (
      ?auto_2321 - HOIST
      ?auto_2320 - PLACE
      ?auto_2322 - PLACE
      ?auto_2318 - HOIST
      ?auto_2317 - SURFACE
      ?auto_2330 - PLACE
      ?auto_2327 - HOIST
      ?auto_2331 - SURFACE
      ?auto_2323 - PLACE
      ?auto_2328 - HOIST
      ?auto_2333 - SURFACE
      ?auto_2329 - SURFACE
      ?auto_2332 - PLACE
      ?auto_2325 - HOIST
      ?auto_2324 - SURFACE
      ?auto_2326 - SURFACE
      ?auto_2319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2321 ?auto_2320 ) ( IS-CRATE ?auto_2316 ) ( not ( = ?auto_2322 ?auto_2320 ) ) ( HOIST-AT ?auto_2318 ?auto_2322 ) ( SURFACE-AT ?auto_2316 ?auto_2322 ) ( ON ?auto_2316 ?auto_2317 ) ( CLEAR ?auto_2316 ) ( not ( = ?auto_2315 ?auto_2316 ) ) ( not ( = ?auto_2315 ?auto_2317 ) ) ( not ( = ?auto_2316 ?auto_2317 ) ) ( not ( = ?auto_2321 ?auto_2318 ) ) ( IS-CRATE ?auto_2315 ) ( not ( = ?auto_2330 ?auto_2320 ) ) ( HOIST-AT ?auto_2327 ?auto_2330 ) ( SURFACE-AT ?auto_2315 ?auto_2330 ) ( ON ?auto_2315 ?auto_2331 ) ( CLEAR ?auto_2315 ) ( not ( = ?auto_2314 ?auto_2315 ) ) ( not ( = ?auto_2314 ?auto_2331 ) ) ( not ( = ?auto_2315 ?auto_2331 ) ) ( not ( = ?auto_2321 ?auto_2327 ) ) ( IS-CRATE ?auto_2314 ) ( not ( = ?auto_2323 ?auto_2320 ) ) ( HOIST-AT ?auto_2328 ?auto_2323 ) ( AVAILABLE ?auto_2328 ) ( SURFACE-AT ?auto_2314 ?auto_2323 ) ( ON ?auto_2314 ?auto_2333 ) ( CLEAR ?auto_2314 ) ( not ( = ?auto_2313 ?auto_2314 ) ) ( not ( = ?auto_2313 ?auto_2333 ) ) ( not ( = ?auto_2314 ?auto_2333 ) ) ( not ( = ?auto_2321 ?auto_2328 ) ) ( IS-CRATE ?auto_2313 ) ( AVAILABLE ?auto_2327 ) ( SURFACE-AT ?auto_2313 ?auto_2330 ) ( ON ?auto_2313 ?auto_2329 ) ( CLEAR ?auto_2313 ) ( not ( = ?auto_2312 ?auto_2313 ) ) ( not ( = ?auto_2312 ?auto_2329 ) ) ( not ( = ?auto_2313 ?auto_2329 ) ) ( IS-CRATE ?auto_2312 ) ( not ( = ?auto_2332 ?auto_2320 ) ) ( HOIST-AT ?auto_2325 ?auto_2332 ) ( AVAILABLE ?auto_2325 ) ( SURFACE-AT ?auto_2312 ?auto_2332 ) ( ON ?auto_2312 ?auto_2324 ) ( CLEAR ?auto_2312 ) ( not ( = ?auto_2311 ?auto_2312 ) ) ( not ( = ?auto_2311 ?auto_2324 ) ) ( not ( = ?auto_2312 ?auto_2324 ) ) ( not ( = ?auto_2321 ?auto_2325 ) ) ( SURFACE-AT ?auto_2310 ?auto_2320 ) ( CLEAR ?auto_2310 ) ( IS-CRATE ?auto_2311 ) ( AVAILABLE ?auto_2321 ) ( AVAILABLE ?auto_2318 ) ( SURFACE-AT ?auto_2311 ?auto_2322 ) ( ON ?auto_2311 ?auto_2326 ) ( CLEAR ?auto_2311 ) ( TRUCK-AT ?auto_2319 ?auto_2320 ) ( not ( = ?auto_2310 ?auto_2311 ) ) ( not ( = ?auto_2310 ?auto_2326 ) ) ( not ( = ?auto_2311 ?auto_2326 ) ) ( not ( = ?auto_2310 ?auto_2312 ) ) ( not ( = ?auto_2310 ?auto_2324 ) ) ( not ( = ?auto_2312 ?auto_2326 ) ) ( not ( = ?auto_2332 ?auto_2322 ) ) ( not ( = ?auto_2325 ?auto_2318 ) ) ( not ( = ?auto_2324 ?auto_2326 ) ) ( not ( = ?auto_2310 ?auto_2313 ) ) ( not ( = ?auto_2310 ?auto_2329 ) ) ( not ( = ?auto_2311 ?auto_2313 ) ) ( not ( = ?auto_2311 ?auto_2329 ) ) ( not ( = ?auto_2313 ?auto_2324 ) ) ( not ( = ?auto_2313 ?auto_2326 ) ) ( not ( = ?auto_2330 ?auto_2332 ) ) ( not ( = ?auto_2330 ?auto_2322 ) ) ( not ( = ?auto_2327 ?auto_2325 ) ) ( not ( = ?auto_2327 ?auto_2318 ) ) ( not ( = ?auto_2329 ?auto_2324 ) ) ( not ( = ?auto_2329 ?auto_2326 ) ) ( not ( = ?auto_2310 ?auto_2314 ) ) ( not ( = ?auto_2310 ?auto_2333 ) ) ( not ( = ?auto_2311 ?auto_2314 ) ) ( not ( = ?auto_2311 ?auto_2333 ) ) ( not ( = ?auto_2312 ?auto_2314 ) ) ( not ( = ?auto_2312 ?auto_2333 ) ) ( not ( = ?auto_2314 ?auto_2329 ) ) ( not ( = ?auto_2314 ?auto_2324 ) ) ( not ( = ?auto_2314 ?auto_2326 ) ) ( not ( = ?auto_2323 ?auto_2330 ) ) ( not ( = ?auto_2323 ?auto_2332 ) ) ( not ( = ?auto_2323 ?auto_2322 ) ) ( not ( = ?auto_2328 ?auto_2327 ) ) ( not ( = ?auto_2328 ?auto_2325 ) ) ( not ( = ?auto_2328 ?auto_2318 ) ) ( not ( = ?auto_2333 ?auto_2329 ) ) ( not ( = ?auto_2333 ?auto_2324 ) ) ( not ( = ?auto_2333 ?auto_2326 ) ) ( not ( = ?auto_2310 ?auto_2315 ) ) ( not ( = ?auto_2310 ?auto_2331 ) ) ( not ( = ?auto_2311 ?auto_2315 ) ) ( not ( = ?auto_2311 ?auto_2331 ) ) ( not ( = ?auto_2312 ?auto_2315 ) ) ( not ( = ?auto_2312 ?auto_2331 ) ) ( not ( = ?auto_2313 ?auto_2315 ) ) ( not ( = ?auto_2313 ?auto_2331 ) ) ( not ( = ?auto_2315 ?auto_2333 ) ) ( not ( = ?auto_2315 ?auto_2329 ) ) ( not ( = ?auto_2315 ?auto_2324 ) ) ( not ( = ?auto_2315 ?auto_2326 ) ) ( not ( = ?auto_2331 ?auto_2333 ) ) ( not ( = ?auto_2331 ?auto_2329 ) ) ( not ( = ?auto_2331 ?auto_2324 ) ) ( not ( = ?auto_2331 ?auto_2326 ) ) ( not ( = ?auto_2310 ?auto_2316 ) ) ( not ( = ?auto_2310 ?auto_2317 ) ) ( not ( = ?auto_2311 ?auto_2316 ) ) ( not ( = ?auto_2311 ?auto_2317 ) ) ( not ( = ?auto_2312 ?auto_2316 ) ) ( not ( = ?auto_2312 ?auto_2317 ) ) ( not ( = ?auto_2313 ?auto_2316 ) ) ( not ( = ?auto_2313 ?auto_2317 ) ) ( not ( = ?auto_2314 ?auto_2316 ) ) ( not ( = ?auto_2314 ?auto_2317 ) ) ( not ( = ?auto_2316 ?auto_2331 ) ) ( not ( = ?auto_2316 ?auto_2333 ) ) ( not ( = ?auto_2316 ?auto_2329 ) ) ( not ( = ?auto_2316 ?auto_2324 ) ) ( not ( = ?auto_2316 ?auto_2326 ) ) ( not ( = ?auto_2317 ?auto_2331 ) ) ( not ( = ?auto_2317 ?auto_2333 ) ) ( not ( = ?auto_2317 ?auto_2329 ) ) ( not ( = ?auto_2317 ?auto_2324 ) ) ( not ( = ?auto_2317 ?auto_2326 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2310 ?auto_2311 ?auto_2312 ?auto_2313 ?auto_2314 ?auto_2315 )
      ( MAKE-1CRATE ?auto_2315 ?auto_2316 )
      ( MAKE-6CRATE-VERIFY ?auto_2310 ?auto_2311 ?auto_2312 ?auto_2313 ?auto_2314 ?auto_2315 ?auto_2316 ) )
  )

)

