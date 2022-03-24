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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2149 - BLOCK
      ?auto_2150 - BLOCK
      ?auto_2151 - BLOCK
    )
    :vars
    (
      ?auto_2152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2152 ?auto_2151 ) ( CLEAR ?auto_2152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2149 ) ( ON ?auto_2150 ?auto_2149 ) ( ON ?auto_2151 ?auto_2150 ) ( not ( = ?auto_2149 ?auto_2150 ) ) ( not ( = ?auto_2149 ?auto_2151 ) ) ( not ( = ?auto_2149 ?auto_2152 ) ) ( not ( = ?auto_2150 ?auto_2151 ) ) ( not ( = ?auto_2150 ?auto_2152 ) ) ( not ( = ?auto_2151 ?auto_2152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2152 ?auto_2151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2154 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2154 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2155 - BLOCK
    )
    :vars
    (
      ?auto_2156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2155 ?auto_2156 ) ( CLEAR ?auto_2155 ) ( HAND-EMPTY ) ( not ( = ?auto_2155 ?auto_2156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2155 ?auto_2156 )
      ( MAKE-1PILE ?auto_2155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2159 - BLOCK
      ?auto_2160 - BLOCK
    )
    :vars
    (
      ?auto_2161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2161 ?auto_2160 ) ( CLEAR ?auto_2161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2159 ) ( ON ?auto_2160 ?auto_2159 ) ( not ( = ?auto_2159 ?auto_2160 ) ) ( not ( = ?auto_2159 ?auto_2161 ) ) ( not ( = ?auto_2160 ?auto_2161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2161 ?auto_2160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2162 - BLOCK
      ?auto_2163 - BLOCK
    )
    :vars
    (
      ?auto_2164 - BLOCK
      ?auto_2165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2164 ?auto_2163 ) ( CLEAR ?auto_2164 ) ( ON-TABLE ?auto_2162 ) ( ON ?auto_2163 ?auto_2162 ) ( not ( = ?auto_2162 ?auto_2163 ) ) ( not ( = ?auto_2162 ?auto_2164 ) ) ( not ( = ?auto_2163 ?auto_2164 ) ) ( HOLDING ?auto_2165 ) ( not ( = ?auto_2162 ?auto_2165 ) ) ( not ( = ?auto_2163 ?auto_2165 ) ) ( not ( = ?auto_2164 ?auto_2165 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2165 )
      ( MAKE-2PILE ?auto_2162 ?auto_2163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2166 - BLOCK
      ?auto_2167 - BLOCK
    )
    :vars
    (
      ?auto_2168 - BLOCK
      ?auto_2169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2168 ?auto_2167 ) ( ON-TABLE ?auto_2166 ) ( ON ?auto_2167 ?auto_2166 ) ( not ( = ?auto_2166 ?auto_2167 ) ) ( not ( = ?auto_2166 ?auto_2168 ) ) ( not ( = ?auto_2167 ?auto_2168 ) ) ( not ( = ?auto_2166 ?auto_2169 ) ) ( not ( = ?auto_2167 ?auto_2169 ) ) ( not ( = ?auto_2168 ?auto_2169 ) ) ( ON ?auto_2169 ?auto_2168 ) ( CLEAR ?auto_2169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2166 ?auto_2167 ?auto_2168 )
      ( MAKE-2PILE ?auto_2166 ?auto_2167 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2172 - BLOCK
      ?auto_2173 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2173 ) ( CLEAR ?auto_2172 ) ( ON-TABLE ?auto_2172 ) ( not ( = ?auto_2172 ?auto_2173 ) ) )
    :subtasks
    ( ( !STACK ?auto_2173 ?auto_2172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2174 - BLOCK
      ?auto_2175 - BLOCK
    )
    :vars
    (
      ?auto_2176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2174 ) ( ON-TABLE ?auto_2174 ) ( not ( = ?auto_2174 ?auto_2175 ) ) ( ON ?auto_2175 ?auto_2176 ) ( CLEAR ?auto_2175 ) ( HAND-EMPTY ) ( not ( = ?auto_2174 ?auto_2176 ) ) ( not ( = ?auto_2175 ?auto_2176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2175 ?auto_2176 )
      ( MAKE-2PILE ?auto_2174 ?auto_2175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2177 - BLOCK
      ?auto_2178 - BLOCK
    )
    :vars
    (
      ?auto_2179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2177 ?auto_2178 ) ) ( ON ?auto_2178 ?auto_2179 ) ( CLEAR ?auto_2178 ) ( not ( = ?auto_2177 ?auto_2179 ) ) ( not ( = ?auto_2178 ?auto_2179 ) ) ( HOLDING ?auto_2177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2177 )
      ( MAKE-2PILE ?auto_2177 ?auto_2178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2180 - BLOCK
      ?auto_2181 - BLOCK
    )
    :vars
    (
      ?auto_2182 - BLOCK
      ?auto_2183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2180 ?auto_2181 ) ) ( ON ?auto_2181 ?auto_2182 ) ( not ( = ?auto_2180 ?auto_2182 ) ) ( not ( = ?auto_2181 ?auto_2182 ) ) ( ON ?auto_2180 ?auto_2181 ) ( CLEAR ?auto_2180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2183 ) ( ON ?auto_2182 ?auto_2183 ) ( not ( = ?auto_2183 ?auto_2182 ) ) ( not ( = ?auto_2183 ?auto_2181 ) ) ( not ( = ?auto_2183 ?auto_2180 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2183 ?auto_2182 ?auto_2181 )
      ( MAKE-2PILE ?auto_2180 ?auto_2181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2185 - BLOCK
    )
    :vars
    (
      ?auto_2186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2186 ?auto_2185 ) ( CLEAR ?auto_2186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2185 ) ( not ( = ?auto_2185 ?auto_2186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2186 ?auto_2185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2187 - BLOCK
    )
    :vars
    (
      ?auto_2188 - BLOCK
      ?auto_2189 - BLOCK
      ?auto_2190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2188 ?auto_2187 ) ( CLEAR ?auto_2188 ) ( ON-TABLE ?auto_2187 ) ( not ( = ?auto_2187 ?auto_2188 ) ) ( HOLDING ?auto_2189 ) ( CLEAR ?auto_2190 ) ( not ( = ?auto_2187 ?auto_2189 ) ) ( not ( = ?auto_2187 ?auto_2190 ) ) ( not ( = ?auto_2188 ?auto_2189 ) ) ( not ( = ?auto_2188 ?auto_2190 ) ) ( not ( = ?auto_2189 ?auto_2190 ) ) )
    :subtasks
    ( ( !STACK ?auto_2189 ?auto_2190 )
      ( MAKE-1PILE ?auto_2187 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2277 - BLOCK
    )
    :vars
    (
      ?auto_2279 - BLOCK
      ?auto_2278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2279 ?auto_2277 ) ( ON-TABLE ?auto_2277 ) ( not ( = ?auto_2277 ?auto_2279 ) ) ( not ( = ?auto_2277 ?auto_2278 ) ) ( not ( = ?auto_2279 ?auto_2278 ) ) ( ON ?auto_2278 ?auto_2279 ) ( CLEAR ?auto_2278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2277 ?auto_2279 )
      ( MAKE-1PILE ?auto_2277 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2195 - BLOCK
    )
    :vars
    (
      ?auto_2198 - BLOCK
      ?auto_2197 - BLOCK
      ?auto_2196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2198 ?auto_2195 ) ( ON-TABLE ?auto_2195 ) ( not ( = ?auto_2195 ?auto_2198 ) ) ( not ( = ?auto_2195 ?auto_2197 ) ) ( not ( = ?auto_2195 ?auto_2196 ) ) ( not ( = ?auto_2198 ?auto_2197 ) ) ( not ( = ?auto_2198 ?auto_2196 ) ) ( not ( = ?auto_2197 ?auto_2196 ) ) ( ON ?auto_2197 ?auto_2198 ) ( CLEAR ?auto_2197 ) ( HOLDING ?auto_2196 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2196 )
      ( MAKE-1PILE ?auto_2195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2199 - BLOCK
    )
    :vars
    (
      ?auto_2200 - BLOCK
      ?auto_2202 - BLOCK
      ?auto_2201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2200 ?auto_2199 ) ( ON-TABLE ?auto_2199 ) ( not ( = ?auto_2199 ?auto_2200 ) ) ( not ( = ?auto_2199 ?auto_2202 ) ) ( not ( = ?auto_2199 ?auto_2201 ) ) ( not ( = ?auto_2200 ?auto_2202 ) ) ( not ( = ?auto_2200 ?auto_2201 ) ) ( not ( = ?auto_2202 ?auto_2201 ) ) ( ON ?auto_2202 ?auto_2200 ) ( ON ?auto_2201 ?auto_2202 ) ( CLEAR ?auto_2201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2199 ?auto_2200 ?auto_2202 )
      ( MAKE-1PILE ?auto_2199 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2206 - BLOCK
      ?auto_2207 - BLOCK
      ?auto_2208 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2208 ) ( CLEAR ?auto_2207 ) ( ON-TABLE ?auto_2206 ) ( ON ?auto_2207 ?auto_2206 ) ( not ( = ?auto_2206 ?auto_2207 ) ) ( not ( = ?auto_2206 ?auto_2208 ) ) ( not ( = ?auto_2207 ?auto_2208 ) ) )
    :subtasks
    ( ( !STACK ?auto_2208 ?auto_2207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2209 - BLOCK
      ?auto_2210 - BLOCK
      ?auto_2211 - BLOCK
    )
    :vars
    (
      ?auto_2212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2210 ) ( ON-TABLE ?auto_2209 ) ( ON ?auto_2210 ?auto_2209 ) ( not ( = ?auto_2209 ?auto_2210 ) ) ( not ( = ?auto_2209 ?auto_2211 ) ) ( not ( = ?auto_2210 ?auto_2211 ) ) ( ON ?auto_2211 ?auto_2212 ) ( CLEAR ?auto_2211 ) ( HAND-EMPTY ) ( not ( = ?auto_2209 ?auto_2212 ) ) ( not ( = ?auto_2210 ?auto_2212 ) ) ( not ( = ?auto_2211 ?auto_2212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2211 ?auto_2212 )
      ( MAKE-3PILE ?auto_2209 ?auto_2210 ?auto_2211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2213 - BLOCK
      ?auto_2214 - BLOCK
      ?auto_2215 - BLOCK
    )
    :vars
    (
      ?auto_2216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2213 ) ( not ( = ?auto_2213 ?auto_2214 ) ) ( not ( = ?auto_2213 ?auto_2215 ) ) ( not ( = ?auto_2214 ?auto_2215 ) ) ( ON ?auto_2215 ?auto_2216 ) ( CLEAR ?auto_2215 ) ( not ( = ?auto_2213 ?auto_2216 ) ) ( not ( = ?auto_2214 ?auto_2216 ) ) ( not ( = ?auto_2215 ?auto_2216 ) ) ( HOLDING ?auto_2214 ) ( CLEAR ?auto_2213 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2213 ?auto_2214 )
      ( MAKE-3PILE ?auto_2213 ?auto_2214 ?auto_2215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2217 - BLOCK
      ?auto_2218 - BLOCK
      ?auto_2219 - BLOCK
    )
    :vars
    (
      ?auto_2220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2217 ) ( not ( = ?auto_2217 ?auto_2218 ) ) ( not ( = ?auto_2217 ?auto_2219 ) ) ( not ( = ?auto_2218 ?auto_2219 ) ) ( ON ?auto_2219 ?auto_2220 ) ( not ( = ?auto_2217 ?auto_2220 ) ) ( not ( = ?auto_2218 ?auto_2220 ) ) ( not ( = ?auto_2219 ?auto_2220 ) ) ( CLEAR ?auto_2217 ) ( ON ?auto_2218 ?auto_2219 ) ( CLEAR ?auto_2218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2220 ?auto_2219 )
      ( MAKE-3PILE ?auto_2217 ?auto_2218 ?auto_2219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2221 - BLOCK
      ?auto_2222 - BLOCK
      ?auto_2223 - BLOCK
    )
    :vars
    (
      ?auto_2224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2221 ?auto_2222 ) ) ( not ( = ?auto_2221 ?auto_2223 ) ) ( not ( = ?auto_2222 ?auto_2223 ) ) ( ON ?auto_2223 ?auto_2224 ) ( not ( = ?auto_2221 ?auto_2224 ) ) ( not ( = ?auto_2222 ?auto_2224 ) ) ( not ( = ?auto_2223 ?auto_2224 ) ) ( ON ?auto_2222 ?auto_2223 ) ( CLEAR ?auto_2222 ) ( ON-TABLE ?auto_2224 ) ( HOLDING ?auto_2221 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2221 )
      ( MAKE-3PILE ?auto_2221 ?auto_2222 ?auto_2223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2225 - BLOCK
      ?auto_2226 - BLOCK
      ?auto_2227 - BLOCK
    )
    :vars
    (
      ?auto_2228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2225 ?auto_2226 ) ) ( not ( = ?auto_2225 ?auto_2227 ) ) ( not ( = ?auto_2226 ?auto_2227 ) ) ( ON ?auto_2227 ?auto_2228 ) ( not ( = ?auto_2225 ?auto_2228 ) ) ( not ( = ?auto_2226 ?auto_2228 ) ) ( not ( = ?auto_2227 ?auto_2228 ) ) ( ON ?auto_2226 ?auto_2227 ) ( ON-TABLE ?auto_2228 ) ( ON ?auto_2225 ?auto_2226 ) ( CLEAR ?auto_2225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2228 ?auto_2227 ?auto_2226 )
      ( MAKE-3PILE ?auto_2225 ?auto_2226 ?auto_2227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2255 - BLOCK
    )
    :vars
    (
      ?auto_2256 - BLOCK
      ?auto_2257 - BLOCK
      ?auto_2258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2255 ?auto_2256 ) ( CLEAR ?auto_2255 ) ( not ( = ?auto_2255 ?auto_2256 ) ) ( HOLDING ?auto_2257 ) ( CLEAR ?auto_2258 ) ( not ( = ?auto_2255 ?auto_2257 ) ) ( not ( = ?auto_2255 ?auto_2258 ) ) ( not ( = ?auto_2256 ?auto_2257 ) ) ( not ( = ?auto_2256 ?auto_2258 ) ) ( not ( = ?auto_2257 ?auto_2258 ) ) )
    :subtasks
    ( ( !STACK ?auto_2257 ?auto_2258 )
      ( MAKE-1PILE ?auto_2255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2259 - BLOCK
    )
    :vars
    (
      ?auto_2260 - BLOCK
      ?auto_2262 - BLOCK
      ?auto_2261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2259 ?auto_2260 ) ( not ( = ?auto_2259 ?auto_2260 ) ) ( CLEAR ?auto_2262 ) ( not ( = ?auto_2259 ?auto_2261 ) ) ( not ( = ?auto_2259 ?auto_2262 ) ) ( not ( = ?auto_2260 ?auto_2261 ) ) ( not ( = ?auto_2260 ?auto_2262 ) ) ( not ( = ?auto_2261 ?auto_2262 ) ) ( ON ?auto_2261 ?auto_2259 ) ( CLEAR ?auto_2261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2260 ?auto_2259 )
      ( MAKE-1PILE ?auto_2259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2263 - BLOCK
    )
    :vars
    (
      ?auto_2264 - BLOCK
      ?auto_2265 - BLOCK
      ?auto_2266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2263 ?auto_2264 ) ( not ( = ?auto_2263 ?auto_2264 ) ) ( not ( = ?auto_2263 ?auto_2265 ) ) ( not ( = ?auto_2263 ?auto_2266 ) ) ( not ( = ?auto_2264 ?auto_2265 ) ) ( not ( = ?auto_2264 ?auto_2266 ) ) ( not ( = ?auto_2265 ?auto_2266 ) ) ( ON ?auto_2265 ?auto_2263 ) ( CLEAR ?auto_2265 ) ( ON-TABLE ?auto_2264 ) ( HOLDING ?auto_2266 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2266 )
      ( MAKE-1PILE ?auto_2263 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2267 - BLOCK
    )
    :vars
    (
      ?auto_2270 - BLOCK
      ?auto_2268 - BLOCK
      ?auto_2269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2267 ?auto_2270 ) ( not ( = ?auto_2267 ?auto_2270 ) ) ( not ( = ?auto_2267 ?auto_2268 ) ) ( not ( = ?auto_2267 ?auto_2269 ) ) ( not ( = ?auto_2270 ?auto_2268 ) ) ( not ( = ?auto_2270 ?auto_2269 ) ) ( not ( = ?auto_2268 ?auto_2269 ) ) ( ON ?auto_2268 ?auto_2267 ) ( ON-TABLE ?auto_2270 ) ( ON ?auto_2269 ?auto_2268 ) ( CLEAR ?auto_2269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2270 ?auto_2267 ?auto_2268 )
      ( MAKE-1PILE ?auto_2267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2274 - BLOCK
    )
    :vars
    (
      ?auto_2275 - BLOCK
      ?auto_2276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2275 ?auto_2274 ) ( CLEAR ?auto_2275 ) ( ON-TABLE ?auto_2274 ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( HOLDING ?auto_2276 ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2276 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2276 )
      ( MAKE-1PILE ?auto_2274 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2299 - BLOCK
      ?auto_2300 - BLOCK
    )
    :vars
    (
      ?auto_2301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2299 ?auto_2300 ) ) ( ON ?auto_2300 ?auto_2301 ) ( not ( = ?auto_2299 ?auto_2301 ) ) ( not ( = ?auto_2300 ?auto_2301 ) ) ( ON ?auto_2299 ?auto_2300 ) ( CLEAR ?auto_2299 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2301 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2301 ?auto_2300 )
      ( MAKE-2PILE ?auto_2299 ?auto_2300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2304 - BLOCK
      ?auto_2305 - BLOCK
    )
    :vars
    (
      ?auto_2306 - BLOCK
      ?auto_2307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2304 ?auto_2305 ) ) ( ON ?auto_2305 ?auto_2306 ) ( CLEAR ?auto_2305 ) ( not ( = ?auto_2304 ?auto_2306 ) ) ( not ( = ?auto_2305 ?auto_2306 ) ) ( ON ?auto_2304 ?auto_2307 ) ( CLEAR ?auto_2304 ) ( HAND-EMPTY ) ( not ( = ?auto_2304 ?auto_2307 ) ) ( not ( = ?auto_2305 ?auto_2307 ) ) ( not ( = ?auto_2306 ?auto_2307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2304 ?auto_2307 )
      ( MAKE-2PILE ?auto_2304 ?auto_2305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2308 - BLOCK
      ?auto_2309 - BLOCK
    )
    :vars
    (
      ?auto_2310 - BLOCK
      ?auto_2311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2308 ?auto_2309 ) ) ( not ( = ?auto_2308 ?auto_2310 ) ) ( not ( = ?auto_2309 ?auto_2310 ) ) ( ON ?auto_2308 ?auto_2311 ) ( CLEAR ?auto_2308 ) ( not ( = ?auto_2308 ?auto_2311 ) ) ( not ( = ?auto_2309 ?auto_2311 ) ) ( not ( = ?auto_2310 ?auto_2311 ) ) ( HOLDING ?auto_2309 ) ( CLEAR ?auto_2310 ) ( ON-TABLE ?auto_2310 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2310 ?auto_2309 )
      ( MAKE-2PILE ?auto_2308 ?auto_2309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2312 - BLOCK
      ?auto_2313 - BLOCK
    )
    :vars
    (
      ?auto_2315 - BLOCK
      ?auto_2314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2312 ?auto_2313 ) ) ( not ( = ?auto_2312 ?auto_2315 ) ) ( not ( = ?auto_2313 ?auto_2315 ) ) ( ON ?auto_2312 ?auto_2314 ) ( not ( = ?auto_2312 ?auto_2314 ) ) ( not ( = ?auto_2313 ?auto_2314 ) ) ( not ( = ?auto_2315 ?auto_2314 ) ) ( CLEAR ?auto_2315 ) ( ON-TABLE ?auto_2315 ) ( ON ?auto_2313 ?auto_2312 ) ( CLEAR ?auto_2313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2314 ?auto_2312 )
      ( MAKE-2PILE ?auto_2312 ?auto_2313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2316 - BLOCK
      ?auto_2317 - BLOCK
    )
    :vars
    (
      ?auto_2319 - BLOCK
      ?auto_2318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2316 ?auto_2317 ) ) ( not ( = ?auto_2316 ?auto_2319 ) ) ( not ( = ?auto_2317 ?auto_2319 ) ) ( ON ?auto_2316 ?auto_2318 ) ( not ( = ?auto_2316 ?auto_2318 ) ) ( not ( = ?auto_2317 ?auto_2318 ) ) ( not ( = ?auto_2319 ?auto_2318 ) ) ( ON ?auto_2317 ?auto_2316 ) ( CLEAR ?auto_2317 ) ( ON-TABLE ?auto_2318 ) ( HOLDING ?auto_2319 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2319 )
      ( MAKE-2PILE ?auto_2316 ?auto_2317 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2320 - BLOCK
      ?auto_2321 - BLOCK
    )
    :vars
    (
      ?auto_2323 - BLOCK
      ?auto_2322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2320 ?auto_2321 ) ) ( not ( = ?auto_2320 ?auto_2323 ) ) ( not ( = ?auto_2321 ?auto_2323 ) ) ( ON ?auto_2320 ?auto_2322 ) ( not ( = ?auto_2320 ?auto_2322 ) ) ( not ( = ?auto_2321 ?auto_2322 ) ) ( not ( = ?auto_2323 ?auto_2322 ) ) ( ON ?auto_2321 ?auto_2320 ) ( ON-TABLE ?auto_2322 ) ( ON ?auto_2323 ?auto_2321 ) ( CLEAR ?auto_2323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2322 ?auto_2320 ?auto_2321 )
      ( MAKE-2PILE ?auto_2320 ?auto_2321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2330 - BLOCK
      ?auto_2331 - BLOCK
      ?auto_2332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2331 ) ( ON-TABLE ?auto_2330 ) ( ON ?auto_2331 ?auto_2330 ) ( not ( = ?auto_2330 ?auto_2331 ) ) ( not ( = ?auto_2330 ?auto_2332 ) ) ( not ( = ?auto_2331 ?auto_2332 ) ) ( ON-TABLE ?auto_2332 ) ( CLEAR ?auto_2332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2332 )
      ( MAKE-3PILE ?auto_2330 ?auto_2331 ?auto_2332 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2333 - BLOCK
      ?auto_2334 - BLOCK
      ?auto_2335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2333 ) ( not ( = ?auto_2333 ?auto_2334 ) ) ( not ( = ?auto_2333 ?auto_2335 ) ) ( not ( = ?auto_2334 ?auto_2335 ) ) ( ON-TABLE ?auto_2335 ) ( CLEAR ?auto_2335 ) ( HOLDING ?auto_2334 ) ( CLEAR ?auto_2333 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2333 ?auto_2334 )
      ( MAKE-3PILE ?auto_2333 ?auto_2334 ?auto_2335 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2336 - BLOCK
      ?auto_2337 - BLOCK
      ?auto_2338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2336 ) ( not ( = ?auto_2336 ?auto_2337 ) ) ( not ( = ?auto_2336 ?auto_2338 ) ) ( not ( = ?auto_2337 ?auto_2338 ) ) ( ON-TABLE ?auto_2338 ) ( CLEAR ?auto_2336 ) ( ON ?auto_2337 ?auto_2338 ) ( CLEAR ?auto_2337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2338 )
      ( MAKE-3PILE ?auto_2336 ?auto_2337 ?auto_2338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2339 - BLOCK
      ?auto_2340 - BLOCK
      ?auto_2341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2339 ?auto_2340 ) ) ( not ( = ?auto_2339 ?auto_2341 ) ) ( not ( = ?auto_2340 ?auto_2341 ) ) ( ON-TABLE ?auto_2341 ) ( ON ?auto_2340 ?auto_2341 ) ( CLEAR ?auto_2340 ) ( HOLDING ?auto_2339 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2339 )
      ( MAKE-3PILE ?auto_2339 ?auto_2340 ?auto_2341 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2342 - BLOCK
      ?auto_2343 - BLOCK
      ?auto_2344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2342 ?auto_2343 ) ) ( not ( = ?auto_2342 ?auto_2344 ) ) ( not ( = ?auto_2343 ?auto_2344 ) ) ( ON-TABLE ?auto_2344 ) ( ON ?auto_2343 ?auto_2344 ) ( ON ?auto_2342 ?auto_2343 ) ( CLEAR ?auto_2342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2344 ?auto_2343 )
      ( MAKE-3PILE ?auto_2342 ?auto_2343 ?auto_2344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2348 - BLOCK
      ?auto_2349 - BLOCK
      ?auto_2350 - BLOCK
    )
    :vars
    (
      ?auto_2351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2348 ?auto_2349 ) ) ( not ( = ?auto_2348 ?auto_2350 ) ) ( not ( = ?auto_2349 ?auto_2350 ) ) ( ON-TABLE ?auto_2350 ) ( ON ?auto_2349 ?auto_2350 ) ( CLEAR ?auto_2349 ) ( ON ?auto_2348 ?auto_2351 ) ( CLEAR ?auto_2348 ) ( HAND-EMPTY ) ( not ( = ?auto_2348 ?auto_2351 ) ) ( not ( = ?auto_2349 ?auto_2351 ) ) ( not ( = ?auto_2350 ?auto_2351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2348 ?auto_2351 )
      ( MAKE-3PILE ?auto_2348 ?auto_2349 ?auto_2350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2352 - BLOCK
      ?auto_2353 - BLOCK
      ?auto_2354 - BLOCK
    )
    :vars
    (
      ?auto_2355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2352 ?auto_2353 ) ) ( not ( = ?auto_2352 ?auto_2354 ) ) ( not ( = ?auto_2353 ?auto_2354 ) ) ( ON-TABLE ?auto_2354 ) ( ON ?auto_2352 ?auto_2355 ) ( CLEAR ?auto_2352 ) ( not ( = ?auto_2352 ?auto_2355 ) ) ( not ( = ?auto_2353 ?auto_2355 ) ) ( not ( = ?auto_2354 ?auto_2355 ) ) ( HOLDING ?auto_2353 ) ( CLEAR ?auto_2354 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2354 ?auto_2353 )
      ( MAKE-3PILE ?auto_2352 ?auto_2353 ?auto_2354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2356 - BLOCK
      ?auto_2357 - BLOCK
      ?auto_2358 - BLOCK
    )
    :vars
    (
      ?auto_2359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2356 ?auto_2357 ) ) ( not ( = ?auto_2356 ?auto_2358 ) ) ( not ( = ?auto_2357 ?auto_2358 ) ) ( ON-TABLE ?auto_2358 ) ( ON ?auto_2356 ?auto_2359 ) ( not ( = ?auto_2356 ?auto_2359 ) ) ( not ( = ?auto_2357 ?auto_2359 ) ) ( not ( = ?auto_2358 ?auto_2359 ) ) ( CLEAR ?auto_2358 ) ( ON ?auto_2357 ?auto_2356 ) ( CLEAR ?auto_2357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2359 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2359 ?auto_2356 )
      ( MAKE-3PILE ?auto_2356 ?auto_2357 ?auto_2358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2360 - BLOCK
      ?auto_2361 - BLOCK
      ?auto_2362 - BLOCK
    )
    :vars
    (
      ?auto_2363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2360 ?auto_2361 ) ) ( not ( = ?auto_2360 ?auto_2362 ) ) ( not ( = ?auto_2361 ?auto_2362 ) ) ( ON ?auto_2360 ?auto_2363 ) ( not ( = ?auto_2360 ?auto_2363 ) ) ( not ( = ?auto_2361 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( ON ?auto_2361 ?auto_2360 ) ( CLEAR ?auto_2361 ) ( ON-TABLE ?auto_2363 ) ( HOLDING ?auto_2362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2362 )
      ( MAKE-3PILE ?auto_2360 ?auto_2361 ?auto_2362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2364 - BLOCK
      ?auto_2365 - BLOCK
      ?auto_2366 - BLOCK
    )
    :vars
    (
      ?auto_2367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2364 ?auto_2365 ) ) ( not ( = ?auto_2364 ?auto_2366 ) ) ( not ( = ?auto_2365 ?auto_2366 ) ) ( ON ?auto_2364 ?auto_2367 ) ( not ( = ?auto_2364 ?auto_2367 ) ) ( not ( = ?auto_2365 ?auto_2367 ) ) ( not ( = ?auto_2366 ?auto_2367 ) ) ( ON ?auto_2365 ?auto_2364 ) ( ON-TABLE ?auto_2367 ) ( ON ?auto_2366 ?auto_2365 ) ( CLEAR ?auto_2366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2367 ?auto_2364 ?auto_2365 )
      ( MAKE-3PILE ?auto_2364 ?auto_2365 ?auto_2366 ) )
  )

)

