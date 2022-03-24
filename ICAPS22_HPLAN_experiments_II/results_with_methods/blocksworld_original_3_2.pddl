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
      ?auto_2123 - BLOCK
      ?auto_2124 - BLOCK
      ?auto_2125 - BLOCK
    )
    :vars
    (
      ?auto_2126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2126 ?auto_2125 ) ( CLEAR ?auto_2126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2123 ) ( ON ?auto_2124 ?auto_2123 ) ( ON ?auto_2125 ?auto_2124 ) ( not ( = ?auto_2123 ?auto_2124 ) ) ( not ( = ?auto_2123 ?auto_2125 ) ) ( not ( = ?auto_2123 ?auto_2126 ) ) ( not ( = ?auto_2124 ?auto_2125 ) ) ( not ( = ?auto_2124 ?auto_2126 ) ) ( not ( = ?auto_2125 ?auto_2126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2126 ?auto_2125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2128 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2129 - BLOCK
    )
    :vars
    (
      ?auto_2130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2129 ?auto_2130 ) ( CLEAR ?auto_2129 ) ( HAND-EMPTY ) ( not ( = ?auto_2129 ?auto_2130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2129 ?auto_2130 )
      ( MAKE-1PILE ?auto_2129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2133 - BLOCK
      ?auto_2134 - BLOCK
    )
    :vars
    (
      ?auto_2135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2135 ?auto_2134 ) ( CLEAR ?auto_2135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2133 ) ( ON ?auto_2134 ?auto_2133 ) ( not ( = ?auto_2133 ?auto_2134 ) ) ( not ( = ?auto_2133 ?auto_2135 ) ) ( not ( = ?auto_2134 ?auto_2135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2135 ?auto_2134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2136 - BLOCK
      ?auto_2137 - BLOCK
    )
    :vars
    (
      ?auto_2138 - BLOCK
      ?auto_2139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2138 ?auto_2137 ) ( CLEAR ?auto_2138 ) ( ON-TABLE ?auto_2136 ) ( ON ?auto_2137 ?auto_2136 ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2138 ) ) ( not ( = ?auto_2137 ?auto_2138 ) ) ( HOLDING ?auto_2139 ) ( not ( = ?auto_2136 ?auto_2139 ) ) ( not ( = ?auto_2137 ?auto_2139 ) ) ( not ( = ?auto_2138 ?auto_2139 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2139 )
      ( MAKE-2PILE ?auto_2136 ?auto_2137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2140 - BLOCK
      ?auto_2141 - BLOCK
    )
    :vars
    (
      ?auto_2142 - BLOCK
      ?auto_2143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2142 ?auto_2141 ) ( ON-TABLE ?auto_2140 ) ( ON ?auto_2141 ?auto_2140 ) ( not ( = ?auto_2140 ?auto_2141 ) ) ( not ( = ?auto_2140 ?auto_2142 ) ) ( not ( = ?auto_2141 ?auto_2142 ) ) ( not ( = ?auto_2140 ?auto_2143 ) ) ( not ( = ?auto_2141 ?auto_2143 ) ) ( not ( = ?auto_2142 ?auto_2143 ) ) ( ON ?auto_2143 ?auto_2142 ) ( CLEAR ?auto_2143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2140 ?auto_2141 ?auto_2142 )
      ( MAKE-2PILE ?auto_2140 ?auto_2141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2146 - BLOCK
      ?auto_2147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2147 ) ( CLEAR ?auto_2146 ) ( ON-TABLE ?auto_2146 ) ( not ( = ?auto_2146 ?auto_2147 ) ) )
    :subtasks
    ( ( !STACK ?auto_2147 ?auto_2146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2148 - BLOCK
      ?auto_2149 - BLOCK
    )
    :vars
    (
      ?auto_2150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2148 ) ( ON-TABLE ?auto_2148 ) ( not ( = ?auto_2148 ?auto_2149 ) ) ( ON ?auto_2149 ?auto_2150 ) ( CLEAR ?auto_2149 ) ( HAND-EMPTY ) ( not ( = ?auto_2148 ?auto_2150 ) ) ( not ( = ?auto_2149 ?auto_2150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2149 ?auto_2150 )
      ( MAKE-2PILE ?auto_2148 ?auto_2149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2151 - BLOCK
      ?auto_2152 - BLOCK
    )
    :vars
    (
      ?auto_2153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2151 ?auto_2152 ) ) ( ON ?auto_2152 ?auto_2153 ) ( CLEAR ?auto_2152 ) ( not ( = ?auto_2151 ?auto_2153 ) ) ( not ( = ?auto_2152 ?auto_2153 ) ) ( HOLDING ?auto_2151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2151 )
      ( MAKE-2PILE ?auto_2151 ?auto_2152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2154 - BLOCK
      ?auto_2155 - BLOCK
    )
    :vars
    (
      ?auto_2156 - BLOCK
      ?auto_2157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2154 ?auto_2155 ) ) ( ON ?auto_2155 ?auto_2156 ) ( not ( = ?auto_2154 ?auto_2156 ) ) ( not ( = ?auto_2155 ?auto_2156 ) ) ( ON ?auto_2154 ?auto_2155 ) ( CLEAR ?auto_2154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2157 ) ( ON ?auto_2156 ?auto_2157 ) ( not ( = ?auto_2157 ?auto_2156 ) ) ( not ( = ?auto_2157 ?auto_2155 ) ) ( not ( = ?auto_2157 ?auto_2154 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2157 ?auto_2156 ?auto_2155 )
      ( MAKE-2PILE ?auto_2154 ?auto_2155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2159 - BLOCK
    )
    :vars
    (
      ?auto_2160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2160 ?auto_2159 ) ( CLEAR ?auto_2160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2159 ) ( not ( = ?auto_2159 ?auto_2160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2160 ?auto_2159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2161 - BLOCK
    )
    :vars
    (
      ?auto_2162 - BLOCK
      ?auto_2163 - BLOCK
      ?auto_2164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2162 ?auto_2161 ) ( CLEAR ?auto_2162 ) ( ON-TABLE ?auto_2161 ) ( not ( = ?auto_2161 ?auto_2162 ) ) ( HOLDING ?auto_2163 ) ( CLEAR ?auto_2164 ) ( not ( = ?auto_2161 ?auto_2163 ) ) ( not ( = ?auto_2161 ?auto_2164 ) ) ( not ( = ?auto_2162 ?auto_2163 ) ) ( not ( = ?auto_2162 ?auto_2164 ) ) ( not ( = ?auto_2163 ?auto_2164 ) ) )
    :subtasks
    ( ( !STACK ?auto_2163 ?auto_2164 )
      ( MAKE-1PILE ?auto_2161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2165 - BLOCK
    )
    :vars
    (
      ?auto_2168 - BLOCK
      ?auto_2166 - BLOCK
      ?auto_2167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2168 ?auto_2165 ) ( ON-TABLE ?auto_2165 ) ( not ( = ?auto_2165 ?auto_2168 ) ) ( CLEAR ?auto_2166 ) ( not ( = ?auto_2165 ?auto_2167 ) ) ( not ( = ?auto_2165 ?auto_2166 ) ) ( not ( = ?auto_2168 ?auto_2167 ) ) ( not ( = ?auto_2168 ?auto_2166 ) ) ( not ( = ?auto_2167 ?auto_2166 ) ) ( ON ?auto_2167 ?auto_2168 ) ( CLEAR ?auto_2167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2165 ?auto_2168 )
      ( MAKE-1PILE ?auto_2165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2169 - BLOCK
    )
    :vars
    (
      ?auto_2172 - BLOCK
      ?auto_2170 - BLOCK
      ?auto_2171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2172 ?auto_2169 ) ( ON-TABLE ?auto_2169 ) ( not ( = ?auto_2169 ?auto_2172 ) ) ( not ( = ?auto_2169 ?auto_2170 ) ) ( not ( = ?auto_2169 ?auto_2171 ) ) ( not ( = ?auto_2172 ?auto_2170 ) ) ( not ( = ?auto_2172 ?auto_2171 ) ) ( not ( = ?auto_2170 ?auto_2171 ) ) ( ON ?auto_2170 ?auto_2172 ) ( CLEAR ?auto_2170 ) ( HOLDING ?auto_2171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2171 )
      ( MAKE-1PILE ?auto_2169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2173 - BLOCK
    )
    :vars
    (
      ?auto_2175 - BLOCK
      ?auto_2176 - BLOCK
      ?auto_2174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2175 ?auto_2173 ) ( ON-TABLE ?auto_2173 ) ( not ( = ?auto_2173 ?auto_2175 ) ) ( not ( = ?auto_2173 ?auto_2176 ) ) ( not ( = ?auto_2173 ?auto_2174 ) ) ( not ( = ?auto_2175 ?auto_2176 ) ) ( not ( = ?auto_2175 ?auto_2174 ) ) ( not ( = ?auto_2176 ?auto_2174 ) ) ( ON ?auto_2176 ?auto_2175 ) ( ON ?auto_2174 ?auto_2176 ) ( CLEAR ?auto_2174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2173 ?auto_2175 ?auto_2176 )
      ( MAKE-1PILE ?auto_2173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2180 - BLOCK
      ?auto_2181 - BLOCK
      ?auto_2182 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2182 ) ( CLEAR ?auto_2181 ) ( ON-TABLE ?auto_2180 ) ( ON ?auto_2181 ?auto_2180 ) ( not ( = ?auto_2180 ?auto_2181 ) ) ( not ( = ?auto_2180 ?auto_2182 ) ) ( not ( = ?auto_2181 ?auto_2182 ) ) )
    :subtasks
    ( ( !STACK ?auto_2182 ?auto_2181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2183 - BLOCK
      ?auto_2184 - BLOCK
      ?auto_2185 - BLOCK
    )
    :vars
    (
      ?auto_2186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2184 ) ( ON-TABLE ?auto_2183 ) ( ON ?auto_2184 ?auto_2183 ) ( not ( = ?auto_2183 ?auto_2184 ) ) ( not ( = ?auto_2183 ?auto_2185 ) ) ( not ( = ?auto_2184 ?auto_2185 ) ) ( ON ?auto_2185 ?auto_2186 ) ( CLEAR ?auto_2185 ) ( HAND-EMPTY ) ( not ( = ?auto_2183 ?auto_2186 ) ) ( not ( = ?auto_2184 ?auto_2186 ) ) ( not ( = ?auto_2185 ?auto_2186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2185 ?auto_2186 )
      ( MAKE-3PILE ?auto_2183 ?auto_2184 ?auto_2185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2187 - BLOCK
      ?auto_2188 - BLOCK
      ?auto_2189 - BLOCK
    )
    :vars
    (
      ?auto_2190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2187 ) ( not ( = ?auto_2187 ?auto_2188 ) ) ( not ( = ?auto_2187 ?auto_2189 ) ) ( not ( = ?auto_2188 ?auto_2189 ) ) ( ON ?auto_2189 ?auto_2190 ) ( CLEAR ?auto_2189 ) ( not ( = ?auto_2187 ?auto_2190 ) ) ( not ( = ?auto_2188 ?auto_2190 ) ) ( not ( = ?auto_2189 ?auto_2190 ) ) ( HOLDING ?auto_2188 ) ( CLEAR ?auto_2187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2187 ?auto_2188 )
      ( MAKE-3PILE ?auto_2187 ?auto_2188 ?auto_2189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2191 - BLOCK
      ?auto_2192 - BLOCK
      ?auto_2193 - BLOCK
    )
    :vars
    (
      ?auto_2194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2191 ) ( not ( = ?auto_2191 ?auto_2192 ) ) ( not ( = ?auto_2191 ?auto_2193 ) ) ( not ( = ?auto_2192 ?auto_2193 ) ) ( ON ?auto_2193 ?auto_2194 ) ( not ( = ?auto_2191 ?auto_2194 ) ) ( not ( = ?auto_2192 ?auto_2194 ) ) ( not ( = ?auto_2193 ?auto_2194 ) ) ( CLEAR ?auto_2191 ) ( ON ?auto_2192 ?auto_2193 ) ( CLEAR ?auto_2192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2194 ?auto_2193 )
      ( MAKE-3PILE ?auto_2191 ?auto_2192 ?auto_2193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2195 - BLOCK
      ?auto_2196 - BLOCK
      ?auto_2197 - BLOCK
    )
    :vars
    (
      ?auto_2198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2195 ?auto_2196 ) ) ( not ( = ?auto_2195 ?auto_2197 ) ) ( not ( = ?auto_2196 ?auto_2197 ) ) ( ON ?auto_2197 ?auto_2198 ) ( not ( = ?auto_2195 ?auto_2198 ) ) ( not ( = ?auto_2196 ?auto_2198 ) ) ( not ( = ?auto_2197 ?auto_2198 ) ) ( ON ?auto_2196 ?auto_2197 ) ( CLEAR ?auto_2196 ) ( ON-TABLE ?auto_2198 ) ( HOLDING ?auto_2195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2195 )
      ( MAKE-3PILE ?auto_2195 ?auto_2196 ?auto_2197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2199 - BLOCK
      ?auto_2200 - BLOCK
      ?auto_2201 - BLOCK
    )
    :vars
    (
      ?auto_2202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2199 ?auto_2200 ) ) ( not ( = ?auto_2199 ?auto_2201 ) ) ( not ( = ?auto_2200 ?auto_2201 ) ) ( ON ?auto_2201 ?auto_2202 ) ( not ( = ?auto_2199 ?auto_2202 ) ) ( not ( = ?auto_2200 ?auto_2202 ) ) ( not ( = ?auto_2201 ?auto_2202 ) ) ( ON ?auto_2200 ?auto_2201 ) ( ON-TABLE ?auto_2202 ) ( ON ?auto_2199 ?auto_2200 ) ( CLEAR ?auto_2199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2202 ?auto_2201 ?auto_2200 )
      ( MAKE-3PILE ?auto_2199 ?auto_2200 ?auto_2201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2205 - BLOCK
      ?auto_2206 - BLOCK
    )
    :vars
    (
      ?auto_2207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2207 ?auto_2206 ) ( CLEAR ?auto_2207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2205 ) ( ON ?auto_2206 ?auto_2205 ) ( not ( = ?auto_2205 ?auto_2206 ) ) ( not ( = ?auto_2205 ?auto_2207 ) ) ( not ( = ?auto_2206 ?auto_2207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2207 ?auto_2206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2215 - BLOCK
      ?auto_2216 - BLOCK
    )
    :vars
    (
      ?auto_2217 - BLOCK
      ?auto_2218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2215 ) ( not ( = ?auto_2215 ?auto_2216 ) ) ( not ( = ?auto_2215 ?auto_2217 ) ) ( not ( = ?auto_2216 ?auto_2217 ) ) ( ON ?auto_2217 ?auto_2218 ) ( CLEAR ?auto_2217 ) ( not ( = ?auto_2215 ?auto_2218 ) ) ( not ( = ?auto_2216 ?auto_2218 ) ) ( not ( = ?auto_2217 ?auto_2218 ) ) ( HOLDING ?auto_2216 ) ( CLEAR ?auto_2215 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2215 ?auto_2216 ?auto_2217 )
      ( MAKE-2PILE ?auto_2215 ?auto_2216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2219 - BLOCK
      ?auto_2220 - BLOCK
    )
    :vars
    (
      ?auto_2222 - BLOCK
      ?auto_2221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2219 ) ( not ( = ?auto_2219 ?auto_2220 ) ) ( not ( = ?auto_2219 ?auto_2222 ) ) ( not ( = ?auto_2220 ?auto_2222 ) ) ( ON ?auto_2222 ?auto_2221 ) ( not ( = ?auto_2219 ?auto_2221 ) ) ( not ( = ?auto_2220 ?auto_2221 ) ) ( not ( = ?auto_2222 ?auto_2221 ) ) ( CLEAR ?auto_2219 ) ( ON ?auto_2220 ?auto_2222 ) ( CLEAR ?auto_2220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2221 ?auto_2222 )
      ( MAKE-2PILE ?auto_2219 ?auto_2220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2223 - BLOCK
      ?auto_2224 - BLOCK
    )
    :vars
    (
      ?auto_2226 - BLOCK
      ?auto_2225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2223 ?auto_2224 ) ) ( not ( = ?auto_2223 ?auto_2226 ) ) ( not ( = ?auto_2224 ?auto_2226 ) ) ( ON ?auto_2226 ?auto_2225 ) ( not ( = ?auto_2223 ?auto_2225 ) ) ( not ( = ?auto_2224 ?auto_2225 ) ) ( not ( = ?auto_2226 ?auto_2225 ) ) ( ON ?auto_2224 ?auto_2226 ) ( CLEAR ?auto_2224 ) ( ON-TABLE ?auto_2225 ) ( HOLDING ?auto_2223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2223 )
      ( MAKE-2PILE ?auto_2223 ?auto_2224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2227 - BLOCK
      ?auto_2228 - BLOCK
    )
    :vars
    (
      ?auto_2230 - BLOCK
      ?auto_2229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2227 ?auto_2228 ) ) ( not ( = ?auto_2227 ?auto_2230 ) ) ( not ( = ?auto_2228 ?auto_2230 ) ) ( ON ?auto_2230 ?auto_2229 ) ( not ( = ?auto_2227 ?auto_2229 ) ) ( not ( = ?auto_2228 ?auto_2229 ) ) ( not ( = ?auto_2230 ?auto_2229 ) ) ( ON ?auto_2228 ?auto_2230 ) ( ON-TABLE ?auto_2229 ) ( ON ?auto_2227 ?auto_2228 ) ( CLEAR ?auto_2227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2229 ?auto_2230 ?auto_2228 )
      ( MAKE-2PILE ?auto_2227 ?auto_2228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2232 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2232 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2233 - BLOCK
    )
    :vars
    (
      ?auto_2234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2233 ?auto_2234 ) ( CLEAR ?auto_2233 ) ( HAND-EMPTY ) ( not ( = ?auto_2233 ?auto_2234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2233 ?auto_2234 )
      ( MAKE-1PILE ?auto_2233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2235 - BLOCK
    )
    :vars
    (
      ?auto_2236 - BLOCK
      ?auto_2237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2235 ?auto_2236 ) ) ( HOLDING ?auto_2235 ) ( CLEAR ?auto_2236 ) ( ON-TABLE ?auto_2237 ) ( ON ?auto_2236 ?auto_2237 ) ( not ( = ?auto_2237 ?auto_2236 ) ) ( not ( = ?auto_2237 ?auto_2235 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2237 ?auto_2236 ?auto_2235 )
      ( MAKE-1PILE ?auto_2235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2238 - BLOCK
    )
    :vars
    (
      ?auto_2239 - BLOCK
      ?auto_2240 - BLOCK
      ?auto_2241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2238 ?auto_2239 ) ) ( CLEAR ?auto_2239 ) ( ON-TABLE ?auto_2240 ) ( ON ?auto_2239 ?auto_2240 ) ( not ( = ?auto_2240 ?auto_2239 ) ) ( not ( = ?auto_2240 ?auto_2238 ) ) ( ON ?auto_2238 ?auto_2241 ) ( CLEAR ?auto_2238 ) ( HAND-EMPTY ) ( not ( = ?auto_2238 ?auto_2241 ) ) ( not ( = ?auto_2239 ?auto_2241 ) ) ( not ( = ?auto_2240 ?auto_2241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2238 ?auto_2241 )
      ( MAKE-1PILE ?auto_2238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2242 - BLOCK
    )
    :vars
    (
      ?auto_2244 - BLOCK
      ?auto_2243 - BLOCK
      ?auto_2245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2242 ?auto_2244 ) ) ( ON-TABLE ?auto_2243 ) ( not ( = ?auto_2243 ?auto_2244 ) ) ( not ( = ?auto_2243 ?auto_2242 ) ) ( ON ?auto_2242 ?auto_2245 ) ( CLEAR ?auto_2242 ) ( not ( = ?auto_2242 ?auto_2245 ) ) ( not ( = ?auto_2244 ?auto_2245 ) ) ( not ( = ?auto_2243 ?auto_2245 ) ) ( HOLDING ?auto_2244 ) ( CLEAR ?auto_2243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2243 ?auto_2244 )
      ( MAKE-1PILE ?auto_2242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2246 - BLOCK
    )
    :vars
    (
      ?auto_2248 - BLOCK
      ?auto_2247 - BLOCK
      ?auto_2249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2246 ?auto_2248 ) ) ( ON-TABLE ?auto_2247 ) ( not ( = ?auto_2247 ?auto_2248 ) ) ( not ( = ?auto_2247 ?auto_2246 ) ) ( ON ?auto_2246 ?auto_2249 ) ( not ( = ?auto_2246 ?auto_2249 ) ) ( not ( = ?auto_2248 ?auto_2249 ) ) ( not ( = ?auto_2247 ?auto_2249 ) ) ( CLEAR ?auto_2247 ) ( ON ?auto_2248 ?auto_2246 ) ( CLEAR ?auto_2248 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2249 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2249 ?auto_2246 )
      ( MAKE-1PILE ?auto_2246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2250 - BLOCK
    )
    :vars
    (
      ?auto_2251 - BLOCK
      ?auto_2252 - BLOCK
      ?auto_2253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2250 ?auto_2251 ) ) ( not ( = ?auto_2252 ?auto_2251 ) ) ( not ( = ?auto_2252 ?auto_2250 ) ) ( ON ?auto_2250 ?auto_2253 ) ( not ( = ?auto_2250 ?auto_2253 ) ) ( not ( = ?auto_2251 ?auto_2253 ) ) ( not ( = ?auto_2252 ?auto_2253 ) ) ( ON ?auto_2251 ?auto_2250 ) ( CLEAR ?auto_2251 ) ( ON-TABLE ?auto_2253 ) ( HOLDING ?auto_2252 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2252 )
      ( MAKE-1PILE ?auto_2250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2254 - BLOCK
    )
    :vars
    (
      ?auto_2257 - BLOCK
      ?auto_2255 - BLOCK
      ?auto_2256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2254 ?auto_2257 ) ) ( not ( = ?auto_2255 ?auto_2257 ) ) ( not ( = ?auto_2255 ?auto_2254 ) ) ( ON ?auto_2254 ?auto_2256 ) ( not ( = ?auto_2254 ?auto_2256 ) ) ( not ( = ?auto_2257 ?auto_2256 ) ) ( not ( = ?auto_2255 ?auto_2256 ) ) ( ON ?auto_2257 ?auto_2254 ) ( ON-TABLE ?auto_2256 ) ( ON ?auto_2255 ?auto_2257 ) ( CLEAR ?auto_2255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2256 ?auto_2254 ?auto_2257 )
      ( MAKE-1PILE ?auto_2254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2259 - BLOCK
    )
    :vars
    (
      ?auto_2260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2260 ?auto_2259 ) ( CLEAR ?auto_2260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2259 ) ( not ( = ?auto_2259 ?auto_2260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2260 ?auto_2259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2261 - BLOCK
    )
    :vars
    (
      ?auto_2262 - BLOCK
      ?auto_2263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2262 ?auto_2261 ) ( CLEAR ?auto_2262 ) ( ON-TABLE ?auto_2261 ) ( not ( = ?auto_2261 ?auto_2262 ) ) ( HOLDING ?auto_2263 ) ( not ( = ?auto_2261 ?auto_2263 ) ) ( not ( = ?auto_2262 ?auto_2263 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2263 )
      ( MAKE-1PILE ?auto_2261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2264 - BLOCK
    )
    :vars
    (
      ?auto_2265 - BLOCK
      ?auto_2266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2265 ?auto_2264 ) ( ON-TABLE ?auto_2264 ) ( not ( = ?auto_2264 ?auto_2265 ) ) ( not ( = ?auto_2264 ?auto_2266 ) ) ( not ( = ?auto_2265 ?auto_2266 ) ) ( ON ?auto_2266 ?auto_2265 ) ( CLEAR ?auto_2266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2264 ?auto_2265 )
      ( MAKE-1PILE ?auto_2264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2267 - BLOCK
    )
    :vars
    (
      ?auto_2268 - BLOCK
      ?auto_2269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2268 ?auto_2267 ) ( ON-TABLE ?auto_2267 ) ( not ( = ?auto_2267 ?auto_2268 ) ) ( not ( = ?auto_2267 ?auto_2269 ) ) ( not ( = ?auto_2268 ?auto_2269 ) ) ( HOLDING ?auto_2269 ) ( CLEAR ?auto_2268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2267 ?auto_2268 ?auto_2269 )
      ( MAKE-1PILE ?auto_2267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2270 - BLOCK
    )
    :vars
    (
      ?auto_2272 - BLOCK
      ?auto_2271 - BLOCK
      ?auto_2273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2272 ?auto_2270 ) ( ON-TABLE ?auto_2270 ) ( not ( = ?auto_2270 ?auto_2272 ) ) ( not ( = ?auto_2270 ?auto_2271 ) ) ( not ( = ?auto_2272 ?auto_2271 ) ) ( CLEAR ?auto_2272 ) ( ON ?auto_2271 ?auto_2273 ) ( CLEAR ?auto_2271 ) ( HAND-EMPTY ) ( not ( = ?auto_2270 ?auto_2273 ) ) ( not ( = ?auto_2272 ?auto_2273 ) ) ( not ( = ?auto_2271 ?auto_2273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2271 ?auto_2273 )
      ( MAKE-1PILE ?auto_2270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2282 - BLOCK
    )
    :vars
    (
      ?auto_2284 - BLOCK
      ?auto_2283 - BLOCK
      ?auto_2285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2282 ?auto_2284 ) ) ( not ( = ?auto_2282 ?auto_2283 ) ) ( not ( = ?auto_2284 ?auto_2283 ) ) ( ON ?auto_2283 ?auto_2285 ) ( not ( = ?auto_2282 ?auto_2285 ) ) ( not ( = ?auto_2284 ?auto_2285 ) ) ( not ( = ?auto_2283 ?auto_2285 ) ) ( ON ?auto_2284 ?auto_2283 ) ( CLEAR ?auto_2284 ) ( HOLDING ?auto_2282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2282 ?auto_2284 )
      ( MAKE-1PILE ?auto_2282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2286 - BLOCK
    )
    :vars
    (
      ?auto_2288 - BLOCK
      ?auto_2287 - BLOCK
      ?auto_2289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2286 ?auto_2288 ) ) ( not ( = ?auto_2286 ?auto_2287 ) ) ( not ( = ?auto_2288 ?auto_2287 ) ) ( ON ?auto_2287 ?auto_2289 ) ( not ( = ?auto_2286 ?auto_2289 ) ) ( not ( = ?auto_2288 ?auto_2289 ) ) ( not ( = ?auto_2287 ?auto_2289 ) ) ( ON ?auto_2288 ?auto_2287 ) ( ON ?auto_2286 ?auto_2288 ) ( CLEAR ?auto_2286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2289 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2289 ?auto_2287 ?auto_2288 )
      ( MAKE-1PILE ?auto_2286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2292 - BLOCK
      ?auto_2293 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2293 ) ( CLEAR ?auto_2292 ) ( ON-TABLE ?auto_2292 ) ( not ( = ?auto_2292 ?auto_2293 ) ) )
    :subtasks
    ( ( !STACK ?auto_2293 ?auto_2292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2294 - BLOCK
      ?auto_2295 - BLOCK
    )
    :vars
    (
      ?auto_2296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2294 ) ( ON-TABLE ?auto_2294 ) ( not ( = ?auto_2294 ?auto_2295 ) ) ( ON ?auto_2295 ?auto_2296 ) ( CLEAR ?auto_2295 ) ( HAND-EMPTY ) ( not ( = ?auto_2294 ?auto_2296 ) ) ( not ( = ?auto_2295 ?auto_2296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2295 ?auto_2296 )
      ( MAKE-2PILE ?auto_2294 ?auto_2295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2297 - BLOCK
      ?auto_2298 - BLOCK
    )
    :vars
    (
      ?auto_2299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2297 ?auto_2298 ) ) ( ON ?auto_2298 ?auto_2299 ) ( CLEAR ?auto_2298 ) ( not ( = ?auto_2297 ?auto_2299 ) ) ( not ( = ?auto_2298 ?auto_2299 ) ) ( HOLDING ?auto_2297 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2297 )
      ( MAKE-2PILE ?auto_2297 ?auto_2298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2300 - BLOCK
      ?auto_2301 - BLOCK
    )
    :vars
    (
      ?auto_2302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2300 ?auto_2301 ) ) ( ON ?auto_2301 ?auto_2302 ) ( not ( = ?auto_2300 ?auto_2302 ) ) ( not ( = ?auto_2301 ?auto_2302 ) ) ( ON ?auto_2300 ?auto_2301 ) ( CLEAR ?auto_2300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2302 ?auto_2301 )
      ( MAKE-2PILE ?auto_2300 ?auto_2301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2303 - BLOCK
      ?auto_2304 - BLOCK
    )
    :vars
    (
      ?auto_2305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2303 ?auto_2304 ) ) ( ON ?auto_2304 ?auto_2305 ) ( not ( = ?auto_2303 ?auto_2305 ) ) ( not ( = ?auto_2304 ?auto_2305 ) ) ( ON-TABLE ?auto_2305 ) ( HOLDING ?auto_2303 ) ( CLEAR ?auto_2304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2305 ?auto_2304 ?auto_2303 )
      ( MAKE-2PILE ?auto_2303 ?auto_2304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2306 - BLOCK
      ?auto_2307 - BLOCK
    )
    :vars
    (
      ?auto_2308 - BLOCK
      ?auto_2309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2306 ?auto_2307 ) ) ( ON ?auto_2307 ?auto_2308 ) ( not ( = ?auto_2306 ?auto_2308 ) ) ( not ( = ?auto_2307 ?auto_2308 ) ) ( ON-TABLE ?auto_2308 ) ( CLEAR ?auto_2307 ) ( ON ?auto_2306 ?auto_2309 ) ( CLEAR ?auto_2306 ) ( HAND-EMPTY ) ( not ( = ?auto_2306 ?auto_2309 ) ) ( not ( = ?auto_2307 ?auto_2309 ) ) ( not ( = ?auto_2308 ?auto_2309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2306 ?auto_2309 )
      ( MAKE-2PILE ?auto_2306 ?auto_2307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2310 - BLOCK
      ?auto_2311 - BLOCK
    )
    :vars
    (
      ?auto_2313 - BLOCK
      ?auto_2312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2310 ?auto_2311 ) ) ( not ( = ?auto_2310 ?auto_2313 ) ) ( not ( = ?auto_2311 ?auto_2313 ) ) ( ON-TABLE ?auto_2313 ) ( ON ?auto_2310 ?auto_2312 ) ( CLEAR ?auto_2310 ) ( not ( = ?auto_2310 ?auto_2312 ) ) ( not ( = ?auto_2311 ?auto_2312 ) ) ( not ( = ?auto_2313 ?auto_2312 ) ) ( HOLDING ?auto_2311 ) ( CLEAR ?auto_2313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2313 ?auto_2311 )
      ( MAKE-2PILE ?auto_2310 ?auto_2311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2314 - BLOCK
      ?auto_2315 - BLOCK
    )
    :vars
    (
      ?auto_2316 - BLOCK
      ?auto_2317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2314 ?auto_2315 ) ) ( not ( = ?auto_2314 ?auto_2316 ) ) ( not ( = ?auto_2315 ?auto_2316 ) ) ( ON-TABLE ?auto_2316 ) ( ON ?auto_2314 ?auto_2317 ) ( not ( = ?auto_2314 ?auto_2317 ) ) ( not ( = ?auto_2315 ?auto_2317 ) ) ( not ( = ?auto_2316 ?auto_2317 ) ) ( CLEAR ?auto_2316 ) ( ON ?auto_2315 ?auto_2314 ) ( CLEAR ?auto_2315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2317 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2317 ?auto_2314 )
      ( MAKE-2PILE ?auto_2314 ?auto_2315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2318 - BLOCK
      ?auto_2319 - BLOCK
    )
    :vars
    (
      ?auto_2321 - BLOCK
      ?auto_2320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2318 ?auto_2319 ) ) ( not ( = ?auto_2318 ?auto_2321 ) ) ( not ( = ?auto_2319 ?auto_2321 ) ) ( ON ?auto_2318 ?auto_2320 ) ( not ( = ?auto_2318 ?auto_2320 ) ) ( not ( = ?auto_2319 ?auto_2320 ) ) ( not ( = ?auto_2321 ?auto_2320 ) ) ( ON ?auto_2319 ?auto_2318 ) ( CLEAR ?auto_2319 ) ( ON-TABLE ?auto_2320 ) ( HOLDING ?auto_2321 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2321 )
      ( MAKE-2PILE ?auto_2318 ?auto_2319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2322 - BLOCK
      ?auto_2323 - BLOCK
    )
    :vars
    (
      ?auto_2325 - BLOCK
      ?auto_2324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2322 ?auto_2323 ) ) ( not ( = ?auto_2322 ?auto_2325 ) ) ( not ( = ?auto_2323 ?auto_2325 ) ) ( ON ?auto_2322 ?auto_2324 ) ( not ( = ?auto_2322 ?auto_2324 ) ) ( not ( = ?auto_2323 ?auto_2324 ) ) ( not ( = ?auto_2325 ?auto_2324 ) ) ( ON ?auto_2323 ?auto_2322 ) ( ON-TABLE ?auto_2324 ) ( ON ?auto_2325 ?auto_2323 ) ( CLEAR ?auto_2325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2324 ?auto_2322 ?auto_2323 )
      ( MAKE-2PILE ?auto_2322 ?auto_2323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2329 - BLOCK
      ?auto_2330 - BLOCK
      ?auto_2331 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2331 ) ( CLEAR ?auto_2330 ) ( ON-TABLE ?auto_2329 ) ( ON ?auto_2330 ?auto_2329 ) ( not ( = ?auto_2329 ?auto_2330 ) ) ( not ( = ?auto_2329 ?auto_2331 ) ) ( not ( = ?auto_2330 ?auto_2331 ) ) )
    :subtasks
    ( ( !STACK ?auto_2331 ?auto_2330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2332 - BLOCK
      ?auto_2333 - BLOCK
      ?auto_2334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2333 ) ( ON-TABLE ?auto_2332 ) ( ON ?auto_2333 ?auto_2332 ) ( not ( = ?auto_2332 ?auto_2333 ) ) ( not ( = ?auto_2332 ?auto_2334 ) ) ( not ( = ?auto_2333 ?auto_2334 ) ) ( ON-TABLE ?auto_2334 ) ( CLEAR ?auto_2334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2334 )
      ( MAKE-3PILE ?auto_2332 ?auto_2333 ?auto_2334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2335 - BLOCK
      ?auto_2336 - BLOCK
      ?auto_2337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2335 ) ( not ( = ?auto_2335 ?auto_2336 ) ) ( not ( = ?auto_2335 ?auto_2337 ) ) ( not ( = ?auto_2336 ?auto_2337 ) ) ( ON-TABLE ?auto_2337 ) ( CLEAR ?auto_2337 ) ( HOLDING ?auto_2336 ) ( CLEAR ?auto_2335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2335 ?auto_2336 )
      ( MAKE-3PILE ?auto_2335 ?auto_2336 ?auto_2337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2338 - BLOCK
      ?auto_2339 - BLOCK
      ?auto_2340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2338 ) ( not ( = ?auto_2338 ?auto_2339 ) ) ( not ( = ?auto_2338 ?auto_2340 ) ) ( not ( = ?auto_2339 ?auto_2340 ) ) ( ON-TABLE ?auto_2340 ) ( CLEAR ?auto_2338 ) ( ON ?auto_2339 ?auto_2340 ) ( CLEAR ?auto_2339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2340 )
      ( MAKE-3PILE ?auto_2338 ?auto_2339 ?auto_2340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2341 - BLOCK
      ?auto_2342 - BLOCK
      ?auto_2343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2341 ?auto_2342 ) ) ( not ( = ?auto_2341 ?auto_2343 ) ) ( not ( = ?auto_2342 ?auto_2343 ) ) ( ON-TABLE ?auto_2343 ) ( ON ?auto_2342 ?auto_2343 ) ( CLEAR ?auto_2342 ) ( HOLDING ?auto_2341 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2341 )
      ( MAKE-3PILE ?auto_2341 ?auto_2342 ?auto_2343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2344 - BLOCK
      ?auto_2345 - BLOCK
      ?auto_2346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2344 ?auto_2345 ) ) ( not ( = ?auto_2344 ?auto_2346 ) ) ( not ( = ?auto_2345 ?auto_2346 ) ) ( ON-TABLE ?auto_2346 ) ( ON ?auto_2345 ?auto_2346 ) ( ON ?auto_2344 ?auto_2345 ) ( CLEAR ?auto_2344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2346 ?auto_2345 )
      ( MAKE-3PILE ?auto_2344 ?auto_2345 ?auto_2346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2347 - BLOCK
      ?auto_2348 - BLOCK
      ?auto_2349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2347 ?auto_2348 ) ) ( not ( = ?auto_2347 ?auto_2349 ) ) ( not ( = ?auto_2348 ?auto_2349 ) ) ( ON-TABLE ?auto_2349 ) ( ON ?auto_2348 ?auto_2349 ) ( HOLDING ?auto_2347 ) ( CLEAR ?auto_2348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2349 ?auto_2348 ?auto_2347 )
      ( MAKE-3PILE ?auto_2347 ?auto_2348 ?auto_2349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2350 - BLOCK
      ?auto_2351 - BLOCK
      ?auto_2352 - BLOCK
    )
    :vars
    (
      ?auto_2353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2350 ?auto_2351 ) ) ( not ( = ?auto_2350 ?auto_2352 ) ) ( not ( = ?auto_2351 ?auto_2352 ) ) ( ON-TABLE ?auto_2352 ) ( ON ?auto_2351 ?auto_2352 ) ( CLEAR ?auto_2351 ) ( ON ?auto_2350 ?auto_2353 ) ( CLEAR ?auto_2350 ) ( HAND-EMPTY ) ( not ( = ?auto_2350 ?auto_2353 ) ) ( not ( = ?auto_2351 ?auto_2353 ) ) ( not ( = ?auto_2352 ?auto_2353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2350 ?auto_2353 )
      ( MAKE-3PILE ?auto_2350 ?auto_2351 ?auto_2352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2354 - BLOCK
      ?auto_2355 - BLOCK
      ?auto_2356 - BLOCK
    )
    :vars
    (
      ?auto_2357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2354 ?auto_2355 ) ) ( not ( = ?auto_2354 ?auto_2356 ) ) ( not ( = ?auto_2355 ?auto_2356 ) ) ( ON-TABLE ?auto_2356 ) ( ON ?auto_2354 ?auto_2357 ) ( CLEAR ?auto_2354 ) ( not ( = ?auto_2354 ?auto_2357 ) ) ( not ( = ?auto_2355 ?auto_2357 ) ) ( not ( = ?auto_2356 ?auto_2357 ) ) ( HOLDING ?auto_2355 ) ( CLEAR ?auto_2356 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2356 ?auto_2355 )
      ( MAKE-3PILE ?auto_2354 ?auto_2355 ?auto_2356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2358 - BLOCK
      ?auto_2359 - BLOCK
      ?auto_2360 - BLOCK
    )
    :vars
    (
      ?auto_2361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2358 ?auto_2359 ) ) ( not ( = ?auto_2358 ?auto_2360 ) ) ( not ( = ?auto_2359 ?auto_2360 ) ) ( ON-TABLE ?auto_2360 ) ( ON ?auto_2358 ?auto_2361 ) ( not ( = ?auto_2358 ?auto_2361 ) ) ( not ( = ?auto_2359 ?auto_2361 ) ) ( not ( = ?auto_2360 ?auto_2361 ) ) ( CLEAR ?auto_2360 ) ( ON ?auto_2359 ?auto_2358 ) ( CLEAR ?auto_2359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2361 ?auto_2358 )
      ( MAKE-3PILE ?auto_2358 ?auto_2359 ?auto_2360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2362 - BLOCK
      ?auto_2363 - BLOCK
      ?auto_2364 - BLOCK
    )
    :vars
    (
      ?auto_2365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2362 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2364 ) ) ( not ( = ?auto_2363 ?auto_2364 ) ) ( ON ?auto_2362 ?auto_2365 ) ( not ( = ?auto_2362 ?auto_2365 ) ) ( not ( = ?auto_2363 ?auto_2365 ) ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( ON ?auto_2363 ?auto_2362 ) ( CLEAR ?auto_2363 ) ( ON-TABLE ?auto_2365 ) ( HOLDING ?auto_2364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2364 )
      ( MAKE-3PILE ?auto_2362 ?auto_2363 ?auto_2364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2366 - BLOCK
      ?auto_2367 - BLOCK
      ?auto_2368 - BLOCK
    )
    :vars
    (
      ?auto_2369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2366 ?auto_2367 ) ) ( not ( = ?auto_2366 ?auto_2368 ) ) ( not ( = ?auto_2367 ?auto_2368 ) ) ( ON ?auto_2366 ?auto_2369 ) ( not ( = ?auto_2366 ?auto_2369 ) ) ( not ( = ?auto_2367 ?auto_2369 ) ) ( not ( = ?auto_2368 ?auto_2369 ) ) ( ON ?auto_2367 ?auto_2366 ) ( ON-TABLE ?auto_2369 ) ( ON ?auto_2368 ?auto_2367 ) ( CLEAR ?auto_2368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2369 ?auto_2366 ?auto_2367 )
      ( MAKE-3PILE ?auto_2366 ?auto_2367 ?auto_2368 ) )
  )

)

