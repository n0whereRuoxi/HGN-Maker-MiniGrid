( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2166 - BLOCK
    )
    :vars
    (
      ?auto_2167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2166 ?auto_2167 ) ( CLEAR ?auto_2166 ) ( HAND-EMPTY ) ( not ( = ?auto_2166 ?auto_2167 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2166 ?auto_2167 )
      ( !PUTDOWN ?auto_2166 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2169 - BLOCK
    )
    :vars
    (
      ?auto_2170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2169 ?auto_2170 ) ( CLEAR ?auto_2169 ) ( HAND-EMPTY ) ( not ( = ?auto_2169 ?auto_2170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2169 ?auto_2170 )
      ( !PUTDOWN ?auto_2169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2173 - BLOCK
      ?auto_2174 - BLOCK
    )
    :vars
    (
      ?auto_2175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2173 ) ( ON ?auto_2174 ?auto_2175 ) ( CLEAR ?auto_2174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2173 ) ( not ( = ?auto_2173 ?auto_2174 ) ) ( not ( = ?auto_2173 ?auto_2175 ) ) ( not ( = ?auto_2174 ?auto_2175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2174 ?auto_2175 )
      ( !STACK ?auto_2174 ?auto_2173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2178 - BLOCK
      ?auto_2179 - BLOCK
    )
    :vars
    (
      ?auto_2180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2178 ) ( ON ?auto_2179 ?auto_2180 ) ( CLEAR ?auto_2179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2178 ) ( not ( = ?auto_2178 ?auto_2179 ) ) ( not ( = ?auto_2178 ?auto_2180 ) ) ( not ( = ?auto_2179 ?auto_2180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2179 ?auto_2180 )
      ( !STACK ?auto_2179 ?auto_2178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2183 - BLOCK
      ?auto_2184 - BLOCK
    )
    :vars
    (
      ?auto_2185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2184 ?auto_2185 ) ( not ( = ?auto_2183 ?auto_2184 ) ) ( not ( = ?auto_2183 ?auto_2185 ) ) ( not ( = ?auto_2184 ?auto_2185 ) ) ( ON ?auto_2183 ?auto_2184 ) ( CLEAR ?auto_2183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2183 )
      ( MAKE-2PILE ?auto_2183 ?auto_2184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2188 - BLOCK
      ?auto_2189 - BLOCK
    )
    :vars
    (
      ?auto_2190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2189 ?auto_2190 ) ( not ( = ?auto_2188 ?auto_2189 ) ) ( not ( = ?auto_2188 ?auto_2190 ) ) ( not ( = ?auto_2189 ?auto_2190 ) ) ( ON ?auto_2188 ?auto_2189 ) ( CLEAR ?auto_2188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2188 )
      ( MAKE-2PILE ?auto_2188 ?auto_2189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2194 - BLOCK
      ?auto_2195 - BLOCK
      ?auto_2196 - BLOCK
    )
    :vars
    (
      ?auto_2197 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2195 ) ( ON ?auto_2196 ?auto_2197 ) ( CLEAR ?auto_2196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2194 ) ( ON ?auto_2195 ?auto_2194 ) ( not ( = ?auto_2194 ?auto_2195 ) ) ( not ( = ?auto_2194 ?auto_2196 ) ) ( not ( = ?auto_2194 ?auto_2197 ) ) ( not ( = ?auto_2195 ?auto_2196 ) ) ( not ( = ?auto_2195 ?auto_2197 ) ) ( not ( = ?auto_2196 ?auto_2197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2196 ?auto_2197 )
      ( !STACK ?auto_2196 ?auto_2195 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2201 - BLOCK
      ?auto_2202 - BLOCK
      ?auto_2203 - BLOCK
    )
    :vars
    (
      ?auto_2204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2202 ) ( ON ?auto_2203 ?auto_2204 ) ( CLEAR ?auto_2203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2201 ) ( ON ?auto_2202 ?auto_2201 ) ( not ( = ?auto_2201 ?auto_2202 ) ) ( not ( = ?auto_2201 ?auto_2203 ) ) ( not ( = ?auto_2201 ?auto_2204 ) ) ( not ( = ?auto_2202 ?auto_2203 ) ) ( not ( = ?auto_2202 ?auto_2204 ) ) ( not ( = ?auto_2203 ?auto_2204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2203 ?auto_2204 )
      ( !STACK ?auto_2203 ?auto_2202 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2208 - BLOCK
      ?auto_2209 - BLOCK
      ?auto_2210 - BLOCK
    )
    :vars
    (
      ?auto_2211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2210 ?auto_2211 ) ( ON-TABLE ?auto_2208 ) ( not ( = ?auto_2208 ?auto_2209 ) ) ( not ( = ?auto_2208 ?auto_2210 ) ) ( not ( = ?auto_2208 ?auto_2211 ) ) ( not ( = ?auto_2209 ?auto_2210 ) ) ( not ( = ?auto_2209 ?auto_2211 ) ) ( not ( = ?auto_2210 ?auto_2211 ) ) ( CLEAR ?auto_2208 ) ( ON ?auto_2209 ?auto_2210 ) ( CLEAR ?auto_2209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2208 ?auto_2209 )
      ( MAKE-3PILE ?auto_2208 ?auto_2209 ?auto_2210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2215 - BLOCK
      ?auto_2216 - BLOCK
      ?auto_2217 - BLOCK
    )
    :vars
    (
      ?auto_2218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2217 ?auto_2218 ) ( ON-TABLE ?auto_2215 ) ( not ( = ?auto_2215 ?auto_2216 ) ) ( not ( = ?auto_2215 ?auto_2217 ) ) ( not ( = ?auto_2215 ?auto_2218 ) ) ( not ( = ?auto_2216 ?auto_2217 ) ) ( not ( = ?auto_2216 ?auto_2218 ) ) ( not ( = ?auto_2217 ?auto_2218 ) ) ( CLEAR ?auto_2215 ) ( ON ?auto_2216 ?auto_2217 ) ( CLEAR ?auto_2216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2215 ?auto_2216 )
      ( MAKE-3PILE ?auto_2215 ?auto_2216 ?auto_2217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2222 - BLOCK
      ?auto_2223 - BLOCK
      ?auto_2224 - BLOCK
    )
    :vars
    (
      ?auto_2225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2224 ?auto_2225 ) ( not ( = ?auto_2222 ?auto_2223 ) ) ( not ( = ?auto_2222 ?auto_2224 ) ) ( not ( = ?auto_2222 ?auto_2225 ) ) ( not ( = ?auto_2223 ?auto_2224 ) ) ( not ( = ?auto_2223 ?auto_2225 ) ) ( not ( = ?auto_2224 ?auto_2225 ) ) ( ON ?auto_2223 ?auto_2224 ) ( ON ?auto_2222 ?auto_2223 ) ( CLEAR ?auto_2222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2222 )
      ( MAKE-3PILE ?auto_2222 ?auto_2223 ?auto_2224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2229 - BLOCK
      ?auto_2230 - BLOCK
      ?auto_2231 - BLOCK
    )
    :vars
    (
      ?auto_2232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2231 ?auto_2232 ) ( not ( = ?auto_2229 ?auto_2230 ) ) ( not ( = ?auto_2229 ?auto_2231 ) ) ( not ( = ?auto_2229 ?auto_2232 ) ) ( not ( = ?auto_2230 ?auto_2231 ) ) ( not ( = ?auto_2230 ?auto_2232 ) ) ( not ( = ?auto_2231 ?auto_2232 ) ) ( ON ?auto_2230 ?auto_2231 ) ( ON ?auto_2229 ?auto_2230 ) ( CLEAR ?auto_2229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2229 )
      ( MAKE-3PILE ?auto_2229 ?auto_2230 ?auto_2231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2237 - BLOCK
      ?auto_2238 - BLOCK
      ?auto_2239 - BLOCK
      ?auto_2240 - BLOCK
    )
    :vars
    (
      ?auto_2241 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2239 ) ( ON ?auto_2240 ?auto_2241 ) ( CLEAR ?auto_2240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2237 ) ( ON ?auto_2238 ?auto_2237 ) ( ON ?auto_2239 ?auto_2238 ) ( not ( = ?auto_2237 ?auto_2238 ) ) ( not ( = ?auto_2237 ?auto_2239 ) ) ( not ( = ?auto_2237 ?auto_2240 ) ) ( not ( = ?auto_2237 ?auto_2241 ) ) ( not ( = ?auto_2238 ?auto_2239 ) ) ( not ( = ?auto_2238 ?auto_2240 ) ) ( not ( = ?auto_2238 ?auto_2241 ) ) ( not ( = ?auto_2239 ?auto_2240 ) ) ( not ( = ?auto_2239 ?auto_2241 ) ) ( not ( = ?auto_2240 ?auto_2241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2240 ?auto_2241 )
      ( !STACK ?auto_2240 ?auto_2239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2246 - BLOCK
      ?auto_2247 - BLOCK
      ?auto_2248 - BLOCK
      ?auto_2249 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2248 ) ( ON-TABLE ?auto_2249 ) ( CLEAR ?auto_2249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2246 ) ( ON ?auto_2247 ?auto_2246 ) ( ON ?auto_2248 ?auto_2247 ) ( not ( = ?auto_2246 ?auto_2247 ) ) ( not ( = ?auto_2246 ?auto_2248 ) ) ( not ( = ?auto_2246 ?auto_2249 ) ) ( not ( = ?auto_2247 ?auto_2248 ) ) ( not ( = ?auto_2247 ?auto_2249 ) ) ( not ( = ?auto_2248 ?auto_2249 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_2249 )
      ( !STACK ?auto_2249 ?auto_2248 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2254 - BLOCK
      ?auto_2255 - BLOCK
      ?auto_2256 - BLOCK
      ?auto_2257 - BLOCK
    )
    :vars
    (
      ?auto_2258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2257 ?auto_2258 ) ( ON-TABLE ?auto_2254 ) ( ON ?auto_2255 ?auto_2254 ) ( not ( = ?auto_2254 ?auto_2255 ) ) ( not ( = ?auto_2254 ?auto_2256 ) ) ( not ( = ?auto_2254 ?auto_2257 ) ) ( not ( = ?auto_2254 ?auto_2258 ) ) ( not ( = ?auto_2255 ?auto_2256 ) ) ( not ( = ?auto_2255 ?auto_2257 ) ) ( not ( = ?auto_2255 ?auto_2258 ) ) ( not ( = ?auto_2256 ?auto_2257 ) ) ( not ( = ?auto_2256 ?auto_2258 ) ) ( not ( = ?auto_2257 ?auto_2258 ) ) ( CLEAR ?auto_2255 ) ( ON ?auto_2256 ?auto_2257 ) ( CLEAR ?auto_2256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2254 ?auto_2255 ?auto_2256 )
      ( MAKE-4PILE ?auto_2254 ?auto_2255 ?auto_2256 ?auto_2257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2263 - BLOCK
      ?auto_2264 - BLOCK
      ?auto_2265 - BLOCK
      ?auto_2266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2266 ) ( ON-TABLE ?auto_2263 ) ( ON ?auto_2264 ?auto_2263 ) ( not ( = ?auto_2263 ?auto_2264 ) ) ( not ( = ?auto_2263 ?auto_2265 ) ) ( not ( = ?auto_2263 ?auto_2266 ) ) ( not ( = ?auto_2264 ?auto_2265 ) ) ( not ( = ?auto_2264 ?auto_2266 ) ) ( not ( = ?auto_2265 ?auto_2266 ) ) ( CLEAR ?auto_2264 ) ( ON ?auto_2265 ?auto_2266 ) ( CLEAR ?auto_2265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2263 ?auto_2264 ?auto_2265 )
      ( MAKE-4PILE ?auto_2263 ?auto_2264 ?auto_2265 ?auto_2266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2271 - BLOCK
      ?auto_2272 - BLOCK
      ?auto_2273 - BLOCK
      ?auto_2274 - BLOCK
    )
    :vars
    (
      ?auto_2275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2274 ?auto_2275 ) ( ON-TABLE ?auto_2271 ) ( not ( = ?auto_2271 ?auto_2272 ) ) ( not ( = ?auto_2271 ?auto_2273 ) ) ( not ( = ?auto_2271 ?auto_2274 ) ) ( not ( = ?auto_2271 ?auto_2275 ) ) ( not ( = ?auto_2272 ?auto_2273 ) ) ( not ( = ?auto_2272 ?auto_2274 ) ) ( not ( = ?auto_2272 ?auto_2275 ) ) ( not ( = ?auto_2273 ?auto_2274 ) ) ( not ( = ?auto_2273 ?auto_2275 ) ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( ON ?auto_2273 ?auto_2274 ) ( CLEAR ?auto_2271 ) ( ON ?auto_2272 ?auto_2273 ) ( CLEAR ?auto_2272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2271 ?auto_2272 )
      ( MAKE-4PILE ?auto_2271 ?auto_2272 ?auto_2273 ?auto_2274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2280 - BLOCK
      ?auto_2281 - BLOCK
      ?auto_2282 - BLOCK
      ?auto_2283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2283 ) ( ON-TABLE ?auto_2280 ) ( not ( = ?auto_2280 ?auto_2281 ) ) ( not ( = ?auto_2280 ?auto_2282 ) ) ( not ( = ?auto_2280 ?auto_2283 ) ) ( not ( = ?auto_2281 ?auto_2282 ) ) ( not ( = ?auto_2281 ?auto_2283 ) ) ( not ( = ?auto_2282 ?auto_2283 ) ) ( ON ?auto_2282 ?auto_2283 ) ( CLEAR ?auto_2280 ) ( ON ?auto_2281 ?auto_2282 ) ( CLEAR ?auto_2281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2280 ?auto_2281 )
      ( MAKE-4PILE ?auto_2280 ?auto_2281 ?auto_2282 ?auto_2283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2288 - BLOCK
      ?auto_2289 - BLOCK
      ?auto_2290 - BLOCK
      ?auto_2291 - BLOCK
    )
    :vars
    (
      ?auto_2292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2291 ?auto_2292 ) ( not ( = ?auto_2288 ?auto_2289 ) ) ( not ( = ?auto_2288 ?auto_2290 ) ) ( not ( = ?auto_2288 ?auto_2291 ) ) ( not ( = ?auto_2288 ?auto_2292 ) ) ( not ( = ?auto_2289 ?auto_2290 ) ) ( not ( = ?auto_2289 ?auto_2291 ) ) ( not ( = ?auto_2289 ?auto_2292 ) ) ( not ( = ?auto_2290 ?auto_2291 ) ) ( not ( = ?auto_2290 ?auto_2292 ) ) ( not ( = ?auto_2291 ?auto_2292 ) ) ( ON ?auto_2290 ?auto_2291 ) ( ON ?auto_2289 ?auto_2290 ) ( ON ?auto_2288 ?auto_2289 ) ( CLEAR ?auto_2288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2288 )
      ( MAKE-4PILE ?auto_2288 ?auto_2289 ?auto_2290 ?auto_2291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2297 - BLOCK
      ?auto_2298 - BLOCK
      ?auto_2299 - BLOCK
      ?auto_2300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2300 ) ( not ( = ?auto_2297 ?auto_2298 ) ) ( not ( = ?auto_2297 ?auto_2299 ) ) ( not ( = ?auto_2297 ?auto_2300 ) ) ( not ( = ?auto_2298 ?auto_2299 ) ) ( not ( = ?auto_2298 ?auto_2300 ) ) ( not ( = ?auto_2299 ?auto_2300 ) ) ( ON ?auto_2299 ?auto_2300 ) ( ON ?auto_2298 ?auto_2299 ) ( ON ?auto_2297 ?auto_2298 ) ( CLEAR ?auto_2297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2297 )
      ( MAKE-4PILE ?auto_2297 ?auto_2298 ?auto_2299 ?auto_2300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2305 - BLOCK
      ?auto_2306 - BLOCK
      ?auto_2307 - BLOCK
      ?auto_2308 - BLOCK
    )
    :vars
    (
      ?auto_2309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2305 ?auto_2306 ) ) ( not ( = ?auto_2305 ?auto_2307 ) ) ( not ( = ?auto_2305 ?auto_2308 ) ) ( not ( = ?auto_2306 ?auto_2307 ) ) ( not ( = ?auto_2306 ?auto_2308 ) ) ( not ( = ?auto_2307 ?auto_2308 ) ) ( ON ?auto_2305 ?auto_2309 ) ( not ( = ?auto_2308 ?auto_2309 ) ) ( not ( = ?auto_2307 ?auto_2309 ) ) ( not ( = ?auto_2306 ?auto_2309 ) ) ( not ( = ?auto_2305 ?auto_2309 ) ) ( ON ?auto_2306 ?auto_2305 ) ( ON ?auto_2307 ?auto_2306 ) ( ON ?auto_2308 ?auto_2307 ) ( CLEAR ?auto_2308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_2308 ?auto_2307 ?auto_2306 ?auto_2305 )
      ( MAKE-4PILE ?auto_2305 ?auto_2306 ?auto_2307 ?auto_2308 ) )
  )

)

