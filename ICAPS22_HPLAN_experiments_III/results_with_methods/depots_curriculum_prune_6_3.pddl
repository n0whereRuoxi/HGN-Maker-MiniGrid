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
      ?auto_2159 - SURFACE
      ?auto_2160 - SURFACE
    )
    :vars
    (
      ?auto_2161 - HOIST
      ?auto_2162 - PLACE
      ?auto_2164 - PLACE
      ?auto_2165 - HOIST
      ?auto_2166 - SURFACE
      ?auto_2163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2161 ?auto_2162 ) ( SURFACE-AT ?auto_2159 ?auto_2162 ) ( CLEAR ?auto_2159 ) ( IS-CRATE ?auto_2160 ) ( AVAILABLE ?auto_2161 ) ( not ( = ?auto_2164 ?auto_2162 ) ) ( HOIST-AT ?auto_2165 ?auto_2164 ) ( AVAILABLE ?auto_2165 ) ( SURFACE-AT ?auto_2160 ?auto_2164 ) ( ON ?auto_2160 ?auto_2166 ) ( CLEAR ?auto_2160 ) ( TRUCK-AT ?auto_2163 ?auto_2162 ) ( not ( = ?auto_2159 ?auto_2160 ) ) ( not ( = ?auto_2159 ?auto_2166 ) ) ( not ( = ?auto_2160 ?auto_2166 ) ) ( not ( = ?auto_2161 ?auto_2165 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2163 ?auto_2162 ?auto_2164 )
      ( !LIFT ?auto_2165 ?auto_2160 ?auto_2166 ?auto_2164 )
      ( !LOAD ?auto_2165 ?auto_2160 ?auto_2163 ?auto_2164 )
      ( !DRIVE ?auto_2163 ?auto_2164 ?auto_2162 )
      ( !UNLOAD ?auto_2161 ?auto_2160 ?auto_2163 ?auto_2162 )
      ( !DROP ?auto_2161 ?auto_2160 ?auto_2159 ?auto_2162 )
      ( MAKE-1CRATE-VERIFY ?auto_2159 ?auto_2160 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2180 - SURFACE
      ?auto_2181 - SURFACE
      ?auto_2182 - SURFACE
    )
    :vars
    (
      ?auto_2184 - HOIST
      ?auto_2185 - PLACE
      ?auto_2187 - PLACE
      ?auto_2183 - HOIST
      ?auto_2188 - SURFACE
      ?auto_2191 - PLACE
      ?auto_2190 - HOIST
      ?auto_2189 - SURFACE
      ?auto_2186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2184 ?auto_2185 ) ( IS-CRATE ?auto_2182 ) ( not ( = ?auto_2187 ?auto_2185 ) ) ( HOIST-AT ?auto_2183 ?auto_2187 ) ( AVAILABLE ?auto_2183 ) ( SURFACE-AT ?auto_2182 ?auto_2187 ) ( ON ?auto_2182 ?auto_2188 ) ( CLEAR ?auto_2182 ) ( not ( = ?auto_2181 ?auto_2182 ) ) ( not ( = ?auto_2181 ?auto_2188 ) ) ( not ( = ?auto_2182 ?auto_2188 ) ) ( not ( = ?auto_2184 ?auto_2183 ) ) ( SURFACE-AT ?auto_2180 ?auto_2185 ) ( CLEAR ?auto_2180 ) ( IS-CRATE ?auto_2181 ) ( AVAILABLE ?auto_2184 ) ( not ( = ?auto_2191 ?auto_2185 ) ) ( HOIST-AT ?auto_2190 ?auto_2191 ) ( AVAILABLE ?auto_2190 ) ( SURFACE-AT ?auto_2181 ?auto_2191 ) ( ON ?auto_2181 ?auto_2189 ) ( CLEAR ?auto_2181 ) ( TRUCK-AT ?auto_2186 ?auto_2185 ) ( not ( = ?auto_2180 ?auto_2181 ) ) ( not ( = ?auto_2180 ?auto_2189 ) ) ( not ( = ?auto_2181 ?auto_2189 ) ) ( not ( = ?auto_2184 ?auto_2190 ) ) ( not ( = ?auto_2180 ?auto_2182 ) ) ( not ( = ?auto_2180 ?auto_2188 ) ) ( not ( = ?auto_2182 ?auto_2189 ) ) ( not ( = ?auto_2187 ?auto_2191 ) ) ( not ( = ?auto_2183 ?auto_2190 ) ) ( not ( = ?auto_2188 ?auto_2189 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2180 ?auto_2181 )
      ( MAKE-1CRATE ?auto_2181 ?auto_2182 )
      ( MAKE-2CRATE-VERIFY ?auto_2180 ?auto_2181 ?auto_2182 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2206 - SURFACE
      ?auto_2207 - SURFACE
      ?auto_2208 - SURFACE
      ?auto_2209 - SURFACE
    )
    :vars
    (
      ?auto_2211 - HOIST
      ?auto_2212 - PLACE
      ?auto_2214 - PLACE
      ?auto_2213 - HOIST
      ?auto_2215 - SURFACE
      ?auto_2217 - PLACE
      ?auto_2216 - HOIST
      ?auto_2218 - SURFACE
      ?auto_2219 - PLACE
      ?auto_2220 - HOIST
      ?auto_2221 - SURFACE
      ?auto_2210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2211 ?auto_2212 ) ( IS-CRATE ?auto_2209 ) ( not ( = ?auto_2214 ?auto_2212 ) ) ( HOIST-AT ?auto_2213 ?auto_2214 ) ( AVAILABLE ?auto_2213 ) ( SURFACE-AT ?auto_2209 ?auto_2214 ) ( ON ?auto_2209 ?auto_2215 ) ( CLEAR ?auto_2209 ) ( not ( = ?auto_2208 ?auto_2209 ) ) ( not ( = ?auto_2208 ?auto_2215 ) ) ( not ( = ?auto_2209 ?auto_2215 ) ) ( not ( = ?auto_2211 ?auto_2213 ) ) ( IS-CRATE ?auto_2208 ) ( not ( = ?auto_2217 ?auto_2212 ) ) ( HOIST-AT ?auto_2216 ?auto_2217 ) ( AVAILABLE ?auto_2216 ) ( SURFACE-AT ?auto_2208 ?auto_2217 ) ( ON ?auto_2208 ?auto_2218 ) ( CLEAR ?auto_2208 ) ( not ( = ?auto_2207 ?auto_2208 ) ) ( not ( = ?auto_2207 ?auto_2218 ) ) ( not ( = ?auto_2208 ?auto_2218 ) ) ( not ( = ?auto_2211 ?auto_2216 ) ) ( SURFACE-AT ?auto_2206 ?auto_2212 ) ( CLEAR ?auto_2206 ) ( IS-CRATE ?auto_2207 ) ( AVAILABLE ?auto_2211 ) ( not ( = ?auto_2219 ?auto_2212 ) ) ( HOIST-AT ?auto_2220 ?auto_2219 ) ( AVAILABLE ?auto_2220 ) ( SURFACE-AT ?auto_2207 ?auto_2219 ) ( ON ?auto_2207 ?auto_2221 ) ( CLEAR ?auto_2207 ) ( TRUCK-AT ?auto_2210 ?auto_2212 ) ( not ( = ?auto_2206 ?auto_2207 ) ) ( not ( = ?auto_2206 ?auto_2221 ) ) ( not ( = ?auto_2207 ?auto_2221 ) ) ( not ( = ?auto_2211 ?auto_2220 ) ) ( not ( = ?auto_2206 ?auto_2208 ) ) ( not ( = ?auto_2206 ?auto_2218 ) ) ( not ( = ?auto_2208 ?auto_2221 ) ) ( not ( = ?auto_2217 ?auto_2219 ) ) ( not ( = ?auto_2216 ?auto_2220 ) ) ( not ( = ?auto_2218 ?auto_2221 ) ) ( not ( = ?auto_2206 ?auto_2209 ) ) ( not ( = ?auto_2206 ?auto_2215 ) ) ( not ( = ?auto_2207 ?auto_2209 ) ) ( not ( = ?auto_2207 ?auto_2215 ) ) ( not ( = ?auto_2209 ?auto_2218 ) ) ( not ( = ?auto_2209 ?auto_2221 ) ) ( not ( = ?auto_2214 ?auto_2217 ) ) ( not ( = ?auto_2214 ?auto_2219 ) ) ( not ( = ?auto_2213 ?auto_2216 ) ) ( not ( = ?auto_2213 ?auto_2220 ) ) ( not ( = ?auto_2215 ?auto_2218 ) ) ( not ( = ?auto_2215 ?auto_2221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2206 ?auto_2207 ?auto_2208 )
      ( MAKE-1CRATE ?auto_2208 ?auto_2209 )
      ( MAKE-3CRATE-VERIFY ?auto_2206 ?auto_2207 ?auto_2208 ?auto_2209 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2237 - SURFACE
      ?auto_2238 - SURFACE
      ?auto_2239 - SURFACE
      ?auto_2240 - SURFACE
      ?auto_2241 - SURFACE
    )
    :vars
    (
      ?auto_2243 - HOIST
      ?auto_2245 - PLACE
      ?auto_2247 - PLACE
      ?auto_2242 - HOIST
      ?auto_2246 - SURFACE
      ?auto_2249 - PLACE
      ?auto_2248 - HOIST
      ?auto_2256 - SURFACE
      ?auto_2252 - PLACE
      ?auto_2250 - HOIST
      ?auto_2254 - SURFACE
      ?auto_2251 - PLACE
      ?auto_2253 - HOIST
      ?auto_2255 - SURFACE
      ?auto_2244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2243 ?auto_2245 ) ( IS-CRATE ?auto_2241 ) ( not ( = ?auto_2247 ?auto_2245 ) ) ( HOIST-AT ?auto_2242 ?auto_2247 ) ( AVAILABLE ?auto_2242 ) ( SURFACE-AT ?auto_2241 ?auto_2247 ) ( ON ?auto_2241 ?auto_2246 ) ( CLEAR ?auto_2241 ) ( not ( = ?auto_2240 ?auto_2241 ) ) ( not ( = ?auto_2240 ?auto_2246 ) ) ( not ( = ?auto_2241 ?auto_2246 ) ) ( not ( = ?auto_2243 ?auto_2242 ) ) ( IS-CRATE ?auto_2240 ) ( not ( = ?auto_2249 ?auto_2245 ) ) ( HOIST-AT ?auto_2248 ?auto_2249 ) ( AVAILABLE ?auto_2248 ) ( SURFACE-AT ?auto_2240 ?auto_2249 ) ( ON ?auto_2240 ?auto_2256 ) ( CLEAR ?auto_2240 ) ( not ( = ?auto_2239 ?auto_2240 ) ) ( not ( = ?auto_2239 ?auto_2256 ) ) ( not ( = ?auto_2240 ?auto_2256 ) ) ( not ( = ?auto_2243 ?auto_2248 ) ) ( IS-CRATE ?auto_2239 ) ( not ( = ?auto_2252 ?auto_2245 ) ) ( HOIST-AT ?auto_2250 ?auto_2252 ) ( AVAILABLE ?auto_2250 ) ( SURFACE-AT ?auto_2239 ?auto_2252 ) ( ON ?auto_2239 ?auto_2254 ) ( CLEAR ?auto_2239 ) ( not ( = ?auto_2238 ?auto_2239 ) ) ( not ( = ?auto_2238 ?auto_2254 ) ) ( not ( = ?auto_2239 ?auto_2254 ) ) ( not ( = ?auto_2243 ?auto_2250 ) ) ( SURFACE-AT ?auto_2237 ?auto_2245 ) ( CLEAR ?auto_2237 ) ( IS-CRATE ?auto_2238 ) ( AVAILABLE ?auto_2243 ) ( not ( = ?auto_2251 ?auto_2245 ) ) ( HOIST-AT ?auto_2253 ?auto_2251 ) ( AVAILABLE ?auto_2253 ) ( SURFACE-AT ?auto_2238 ?auto_2251 ) ( ON ?auto_2238 ?auto_2255 ) ( CLEAR ?auto_2238 ) ( TRUCK-AT ?auto_2244 ?auto_2245 ) ( not ( = ?auto_2237 ?auto_2238 ) ) ( not ( = ?auto_2237 ?auto_2255 ) ) ( not ( = ?auto_2238 ?auto_2255 ) ) ( not ( = ?auto_2243 ?auto_2253 ) ) ( not ( = ?auto_2237 ?auto_2239 ) ) ( not ( = ?auto_2237 ?auto_2254 ) ) ( not ( = ?auto_2239 ?auto_2255 ) ) ( not ( = ?auto_2252 ?auto_2251 ) ) ( not ( = ?auto_2250 ?auto_2253 ) ) ( not ( = ?auto_2254 ?auto_2255 ) ) ( not ( = ?auto_2237 ?auto_2240 ) ) ( not ( = ?auto_2237 ?auto_2256 ) ) ( not ( = ?auto_2238 ?auto_2240 ) ) ( not ( = ?auto_2238 ?auto_2256 ) ) ( not ( = ?auto_2240 ?auto_2254 ) ) ( not ( = ?auto_2240 ?auto_2255 ) ) ( not ( = ?auto_2249 ?auto_2252 ) ) ( not ( = ?auto_2249 ?auto_2251 ) ) ( not ( = ?auto_2248 ?auto_2250 ) ) ( not ( = ?auto_2248 ?auto_2253 ) ) ( not ( = ?auto_2256 ?auto_2254 ) ) ( not ( = ?auto_2256 ?auto_2255 ) ) ( not ( = ?auto_2237 ?auto_2241 ) ) ( not ( = ?auto_2237 ?auto_2246 ) ) ( not ( = ?auto_2238 ?auto_2241 ) ) ( not ( = ?auto_2238 ?auto_2246 ) ) ( not ( = ?auto_2239 ?auto_2241 ) ) ( not ( = ?auto_2239 ?auto_2246 ) ) ( not ( = ?auto_2241 ?auto_2256 ) ) ( not ( = ?auto_2241 ?auto_2254 ) ) ( not ( = ?auto_2241 ?auto_2255 ) ) ( not ( = ?auto_2247 ?auto_2249 ) ) ( not ( = ?auto_2247 ?auto_2252 ) ) ( not ( = ?auto_2247 ?auto_2251 ) ) ( not ( = ?auto_2242 ?auto_2248 ) ) ( not ( = ?auto_2242 ?auto_2250 ) ) ( not ( = ?auto_2242 ?auto_2253 ) ) ( not ( = ?auto_2246 ?auto_2256 ) ) ( not ( = ?auto_2246 ?auto_2254 ) ) ( not ( = ?auto_2246 ?auto_2255 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2237 ?auto_2238 ?auto_2239 ?auto_2240 )
      ( MAKE-1CRATE ?auto_2240 ?auto_2241 )
      ( MAKE-4CRATE-VERIFY ?auto_2237 ?auto_2238 ?auto_2239 ?auto_2240 ?auto_2241 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2273 - SURFACE
      ?auto_2274 - SURFACE
      ?auto_2275 - SURFACE
      ?auto_2276 - SURFACE
      ?auto_2277 - SURFACE
      ?auto_2278 - SURFACE
    )
    :vars
    (
      ?auto_2279 - HOIST
      ?auto_2282 - PLACE
      ?auto_2284 - PLACE
      ?auto_2280 - HOIST
      ?auto_2281 - SURFACE
      ?auto_2285 - PLACE
      ?auto_2286 - HOIST
      ?auto_2294 - SURFACE
      ?auto_2290 - PLACE
      ?auto_2287 - HOIST
      ?auto_2289 - SURFACE
      ?auto_2295 - PLACE
      ?auto_2288 - HOIST
      ?auto_2292 - SURFACE
      ?auto_2291 - PLACE
      ?auto_2296 - HOIST
      ?auto_2293 - SURFACE
      ?auto_2283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2279 ?auto_2282 ) ( IS-CRATE ?auto_2278 ) ( not ( = ?auto_2284 ?auto_2282 ) ) ( HOIST-AT ?auto_2280 ?auto_2284 ) ( AVAILABLE ?auto_2280 ) ( SURFACE-AT ?auto_2278 ?auto_2284 ) ( ON ?auto_2278 ?auto_2281 ) ( CLEAR ?auto_2278 ) ( not ( = ?auto_2277 ?auto_2278 ) ) ( not ( = ?auto_2277 ?auto_2281 ) ) ( not ( = ?auto_2278 ?auto_2281 ) ) ( not ( = ?auto_2279 ?auto_2280 ) ) ( IS-CRATE ?auto_2277 ) ( not ( = ?auto_2285 ?auto_2282 ) ) ( HOIST-AT ?auto_2286 ?auto_2285 ) ( AVAILABLE ?auto_2286 ) ( SURFACE-AT ?auto_2277 ?auto_2285 ) ( ON ?auto_2277 ?auto_2294 ) ( CLEAR ?auto_2277 ) ( not ( = ?auto_2276 ?auto_2277 ) ) ( not ( = ?auto_2276 ?auto_2294 ) ) ( not ( = ?auto_2277 ?auto_2294 ) ) ( not ( = ?auto_2279 ?auto_2286 ) ) ( IS-CRATE ?auto_2276 ) ( not ( = ?auto_2290 ?auto_2282 ) ) ( HOIST-AT ?auto_2287 ?auto_2290 ) ( AVAILABLE ?auto_2287 ) ( SURFACE-AT ?auto_2276 ?auto_2290 ) ( ON ?auto_2276 ?auto_2289 ) ( CLEAR ?auto_2276 ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2289 ) ) ( not ( = ?auto_2276 ?auto_2289 ) ) ( not ( = ?auto_2279 ?auto_2287 ) ) ( IS-CRATE ?auto_2275 ) ( not ( = ?auto_2295 ?auto_2282 ) ) ( HOIST-AT ?auto_2288 ?auto_2295 ) ( AVAILABLE ?auto_2288 ) ( SURFACE-AT ?auto_2275 ?auto_2295 ) ( ON ?auto_2275 ?auto_2292 ) ( CLEAR ?auto_2275 ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2274 ?auto_2292 ) ) ( not ( = ?auto_2275 ?auto_2292 ) ) ( not ( = ?auto_2279 ?auto_2288 ) ) ( SURFACE-AT ?auto_2273 ?auto_2282 ) ( CLEAR ?auto_2273 ) ( IS-CRATE ?auto_2274 ) ( AVAILABLE ?auto_2279 ) ( not ( = ?auto_2291 ?auto_2282 ) ) ( HOIST-AT ?auto_2296 ?auto_2291 ) ( AVAILABLE ?auto_2296 ) ( SURFACE-AT ?auto_2274 ?auto_2291 ) ( ON ?auto_2274 ?auto_2293 ) ( CLEAR ?auto_2274 ) ( TRUCK-AT ?auto_2283 ?auto_2282 ) ( not ( = ?auto_2273 ?auto_2274 ) ) ( not ( = ?auto_2273 ?auto_2293 ) ) ( not ( = ?auto_2274 ?auto_2293 ) ) ( not ( = ?auto_2279 ?auto_2296 ) ) ( not ( = ?auto_2273 ?auto_2275 ) ) ( not ( = ?auto_2273 ?auto_2292 ) ) ( not ( = ?auto_2275 ?auto_2293 ) ) ( not ( = ?auto_2295 ?auto_2291 ) ) ( not ( = ?auto_2288 ?auto_2296 ) ) ( not ( = ?auto_2292 ?auto_2293 ) ) ( not ( = ?auto_2273 ?auto_2276 ) ) ( not ( = ?auto_2273 ?auto_2289 ) ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2274 ?auto_2289 ) ) ( not ( = ?auto_2276 ?auto_2292 ) ) ( not ( = ?auto_2276 ?auto_2293 ) ) ( not ( = ?auto_2290 ?auto_2295 ) ) ( not ( = ?auto_2290 ?auto_2291 ) ) ( not ( = ?auto_2287 ?auto_2288 ) ) ( not ( = ?auto_2287 ?auto_2296 ) ) ( not ( = ?auto_2289 ?auto_2292 ) ) ( not ( = ?auto_2289 ?auto_2293 ) ) ( not ( = ?auto_2273 ?auto_2277 ) ) ( not ( = ?auto_2273 ?auto_2294 ) ) ( not ( = ?auto_2274 ?auto_2277 ) ) ( not ( = ?auto_2274 ?auto_2294 ) ) ( not ( = ?auto_2275 ?auto_2277 ) ) ( not ( = ?auto_2275 ?auto_2294 ) ) ( not ( = ?auto_2277 ?auto_2289 ) ) ( not ( = ?auto_2277 ?auto_2292 ) ) ( not ( = ?auto_2277 ?auto_2293 ) ) ( not ( = ?auto_2285 ?auto_2290 ) ) ( not ( = ?auto_2285 ?auto_2295 ) ) ( not ( = ?auto_2285 ?auto_2291 ) ) ( not ( = ?auto_2286 ?auto_2287 ) ) ( not ( = ?auto_2286 ?auto_2288 ) ) ( not ( = ?auto_2286 ?auto_2296 ) ) ( not ( = ?auto_2294 ?auto_2289 ) ) ( not ( = ?auto_2294 ?auto_2292 ) ) ( not ( = ?auto_2294 ?auto_2293 ) ) ( not ( = ?auto_2273 ?auto_2278 ) ) ( not ( = ?auto_2273 ?auto_2281 ) ) ( not ( = ?auto_2274 ?auto_2278 ) ) ( not ( = ?auto_2274 ?auto_2281 ) ) ( not ( = ?auto_2275 ?auto_2278 ) ) ( not ( = ?auto_2275 ?auto_2281 ) ) ( not ( = ?auto_2276 ?auto_2278 ) ) ( not ( = ?auto_2276 ?auto_2281 ) ) ( not ( = ?auto_2278 ?auto_2294 ) ) ( not ( = ?auto_2278 ?auto_2289 ) ) ( not ( = ?auto_2278 ?auto_2292 ) ) ( not ( = ?auto_2278 ?auto_2293 ) ) ( not ( = ?auto_2284 ?auto_2285 ) ) ( not ( = ?auto_2284 ?auto_2290 ) ) ( not ( = ?auto_2284 ?auto_2295 ) ) ( not ( = ?auto_2284 ?auto_2291 ) ) ( not ( = ?auto_2280 ?auto_2286 ) ) ( not ( = ?auto_2280 ?auto_2287 ) ) ( not ( = ?auto_2280 ?auto_2288 ) ) ( not ( = ?auto_2280 ?auto_2296 ) ) ( not ( = ?auto_2281 ?auto_2294 ) ) ( not ( = ?auto_2281 ?auto_2289 ) ) ( not ( = ?auto_2281 ?auto_2292 ) ) ( not ( = ?auto_2281 ?auto_2293 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2273 ?auto_2274 ?auto_2275 ?auto_2276 ?auto_2277 )
      ( MAKE-1CRATE ?auto_2277 ?auto_2278 )
      ( MAKE-5CRATE-VERIFY ?auto_2273 ?auto_2274 ?auto_2275 ?auto_2276 ?auto_2277 ?auto_2278 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2314 - SURFACE
      ?auto_2315 - SURFACE
      ?auto_2316 - SURFACE
      ?auto_2317 - SURFACE
      ?auto_2318 - SURFACE
      ?auto_2319 - SURFACE
      ?auto_2320 - SURFACE
    )
    :vars
    (
      ?auto_2326 - HOIST
      ?auto_2325 - PLACE
      ?auto_2321 - PLACE
      ?auto_2322 - HOIST
      ?auto_2323 - SURFACE
      ?auto_2334 - PLACE
      ?auto_2333 - HOIST
      ?auto_2330 - SURFACE
      ?auto_2338 - PLACE
      ?auto_2337 - HOIST
      ?auto_2335 - SURFACE
      ?auto_2329 - SURFACE
      ?auto_2332 - PLACE
      ?auto_2339 - HOIST
      ?auto_2327 - SURFACE
      ?auto_2328 - PLACE
      ?auto_2336 - HOIST
      ?auto_2331 - SURFACE
      ?auto_2324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2326 ?auto_2325 ) ( IS-CRATE ?auto_2320 ) ( not ( = ?auto_2321 ?auto_2325 ) ) ( HOIST-AT ?auto_2322 ?auto_2321 ) ( SURFACE-AT ?auto_2320 ?auto_2321 ) ( ON ?auto_2320 ?auto_2323 ) ( CLEAR ?auto_2320 ) ( not ( = ?auto_2319 ?auto_2320 ) ) ( not ( = ?auto_2319 ?auto_2323 ) ) ( not ( = ?auto_2320 ?auto_2323 ) ) ( not ( = ?auto_2326 ?auto_2322 ) ) ( IS-CRATE ?auto_2319 ) ( not ( = ?auto_2334 ?auto_2325 ) ) ( HOIST-AT ?auto_2333 ?auto_2334 ) ( AVAILABLE ?auto_2333 ) ( SURFACE-AT ?auto_2319 ?auto_2334 ) ( ON ?auto_2319 ?auto_2330 ) ( CLEAR ?auto_2319 ) ( not ( = ?auto_2318 ?auto_2319 ) ) ( not ( = ?auto_2318 ?auto_2330 ) ) ( not ( = ?auto_2319 ?auto_2330 ) ) ( not ( = ?auto_2326 ?auto_2333 ) ) ( IS-CRATE ?auto_2318 ) ( not ( = ?auto_2338 ?auto_2325 ) ) ( HOIST-AT ?auto_2337 ?auto_2338 ) ( AVAILABLE ?auto_2337 ) ( SURFACE-AT ?auto_2318 ?auto_2338 ) ( ON ?auto_2318 ?auto_2335 ) ( CLEAR ?auto_2318 ) ( not ( = ?auto_2317 ?auto_2318 ) ) ( not ( = ?auto_2317 ?auto_2335 ) ) ( not ( = ?auto_2318 ?auto_2335 ) ) ( not ( = ?auto_2326 ?auto_2337 ) ) ( IS-CRATE ?auto_2317 ) ( AVAILABLE ?auto_2322 ) ( SURFACE-AT ?auto_2317 ?auto_2321 ) ( ON ?auto_2317 ?auto_2329 ) ( CLEAR ?auto_2317 ) ( not ( = ?auto_2316 ?auto_2317 ) ) ( not ( = ?auto_2316 ?auto_2329 ) ) ( not ( = ?auto_2317 ?auto_2329 ) ) ( IS-CRATE ?auto_2316 ) ( not ( = ?auto_2332 ?auto_2325 ) ) ( HOIST-AT ?auto_2339 ?auto_2332 ) ( AVAILABLE ?auto_2339 ) ( SURFACE-AT ?auto_2316 ?auto_2332 ) ( ON ?auto_2316 ?auto_2327 ) ( CLEAR ?auto_2316 ) ( not ( = ?auto_2315 ?auto_2316 ) ) ( not ( = ?auto_2315 ?auto_2327 ) ) ( not ( = ?auto_2316 ?auto_2327 ) ) ( not ( = ?auto_2326 ?auto_2339 ) ) ( SURFACE-AT ?auto_2314 ?auto_2325 ) ( CLEAR ?auto_2314 ) ( IS-CRATE ?auto_2315 ) ( AVAILABLE ?auto_2326 ) ( not ( = ?auto_2328 ?auto_2325 ) ) ( HOIST-AT ?auto_2336 ?auto_2328 ) ( AVAILABLE ?auto_2336 ) ( SURFACE-AT ?auto_2315 ?auto_2328 ) ( ON ?auto_2315 ?auto_2331 ) ( CLEAR ?auto_2315 ) ( TRUCK-AT ?auto_2324 ?auto_2325 ) ( not ( = ?auto_2314 ?auto_2315 ) ) ( not ( = ?auto_2314 ?auto_2331 ) ) ( not ( = ?auto_2315 ?auto_2331 ) ) ( not ( = ?auto_2326 ?auto_2336 ) ) ( not ( = ?auto_2314 ?auto_2316 ) ) ( not ( = ?auto_2314 ?auto_2327 ) ) ( not ( = ?auto_2316 ?auto_2331 ) ) ( not ( = ?auto_2332 ?auto_2328 ) ) ( not ( = ?auto_2339 ?auto_2336 ) ) ( not ( = ?auto_2327 ?auto_2331 ) ) ( not ( = ?auto_2314 ?auto_2317 ) ) ( not ( = ?auto_2314 ?auto_2329 ) ) ( not ( = ?auto_2315 ?auto_2317 ) ) ( not ( = ?auto_2315 ?auto_2329 ) ) ( not ( = ?auto_2317 ?auto_2327 ) ) ( not ( = ?auto_2317 ?auto_2331 ) ) ( not ( = ?auto_2321 ?auto_2332 ) ) ( not ( = ?auto_2321 ?auto_2328 ) ) ( not ( = ?auto_2322 ?auto_2339 ) ) ( not ( = ?auto_2322 ?auto_2336 ) ) ( not ( = ?auto_2329 ?auto_2327 ) ) ( not ( = ?auto_2329 ?auto_2331 ) ) ( not ( = ?auto_2314 ?auto_2318 ) ) ( not ( = ?auto_2314 ?auto_2335 ) ) ( not ( = ?auto_2315 ?auto_2318 ) ) ( not ( = ?auto_2315 ?auto_2335 ) ) ( not ( = ?auto_2316 ?auto_2318 ) ) ( not ( = ?auto_2316 ?auto_2335 ) ) ( not ( = ?auto_2318 ?auto_2329 ) ) ( not ( = ?auto_2318 ?auto_2327 ) ) ( not ( = ?auto_2318 ?auto_2331 ) ) ( not ( = ?auto_2338 ?auto_2321 ) ) ( not ( = ?auto_2338 ?auto_2332 ) ) ( not ( = ?auto_2338 ?auto_2328 ) ) ( not ( = ?auto_2337 ?auto_2322 ) ) ( not ( = ?auto_2337 ?auto_2339 ) ) ( not ( = ?auto_2337 ?auto_2336 ) ) ( not ( = ?auto_2335 ?auto_2329 ) ) ( not ( = ?auto_2335 ?auto_2327 ) ) ( not ( = ?auto_2335 ?auto_2331 ) ) ( not ( = ?auto_2314 ?auto_2319 ) ) ( not ( = ?auto_2314 ?auto_2330 ) ) ( not ( = ?auto_2315 ?auto_2319 ) ) ( not ( = ?auto_2315 ?auto_2330 ) ) ( not ( = ?auto_2316 ?auto_2319 ) ) ( not ( = ?auto_2316 ?auto_2330 ) ) ( not ( = ?auto_2317 ?auto_2319 ) ) ( not ( = ?auto_2317 ?auto_2330 ) ) ( not ( = ?auto_2319 ?auto_2335 ) ) ( not ( = ?auto_2319 ?auto_2329 ) ) ( not ( = ?auto_2319 ?auto_2327 ) ) ( not ( = ?auto_2319 ?auto_2331 ) ) ( not ( = ?auto_2334 ?auto_2338 ) ) ( not ( = ?auto_2334 ?auto_2321 ) ) ( not ( = ?auto_2334 ?auto_2332 ) ) ( not ( = ?auto_2334 ?auto_2328 ) ) ( not ( = ?auto_2333 ?auto_2337 ) ) ( not ( = ?auto_2333 ?auto_2322 ) ) ( not ( = ?auto_2333 ?auto_2339 ) ) ( not ( = ?auto_2333 ?auto_2336 ) ) ( not ( = ?auto_2330 ?auto_2335 ) ) ( not ( = ?auto_2330 ?auto_2329 ) ) ( not ( = ?auto_2330 ?auto_2327 ) ) ( not ( = ?auto_2330 ?auto_2331 ) ) ( not ( = ?auto_2314 ?auto_2320 ) ) ( not ( = ?auto_2314 ?auto_2323 ) ) ( not ( = ?auto_2315 ?auto_2320 ) ) ( not ( = ?auto_2315 ?auto_2323 ) ) ( not ( = ?auto_2316 ?auto_2320 ) ) ( not ( = ?auto_2316 ?auto_2323 ) ) ( not ( = ?auto_2317 ?auto_2320 ) ) ( not ( = ?auto_2317 ?auto_2323 ) ) ( not ( = ?auto_2318 ?auto_2320 ) ) ( not ( = ?auto_2318 ?auto_2323 ) ) ( not ( = ?auto_2320 ?auto_2330 ) ) ( not ( = ?auto_2320 ?auto_2335 ) ) ( not ( = ?auto_2320 ?auto_2329 ) ) ( not ( = ?auto_2320 ?auto_2327 ) ) ( not ( = ?auto_2320 ?auto_2331 ) ) ( not ( = ?auto_2323 ?auto_2330 ) ) ( not ( = ?auto_2323 ?auto_2335 ) ) ( not ( = ?auto_2323 ?auto_2329 ) ) ( not ( = ?auto_2323 ?auto_2327 ) ) ( not ( = ?auto_2323 ?auto_2331 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2314 ?auto_2315 ?auto_2316 ?auto_2317 ?auto_2318 ?auto_2319 )
      ( MAKE-1CRATE ?auto_2319 ?auto_2320 )
      ( MAKE-6CRATE-VERIFY ?auto_2314 ?auto_2315 ?auto_2316 ?auto_2317 ?auto_2318 ?auto_2319 ?auto_2320 ) )
  )

)

