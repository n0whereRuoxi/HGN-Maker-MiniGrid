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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2096 - SURFACE
      ?auto_2097 - SURFACE
    )
    :vars
    (
      ?auto_2098 - HOIST
      ?auto_2099 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2098 ?auto_2099 ) ( SURFACE-AT ?auto_2096 ?auto_2099 ) ( CLEAR ?auto_2096 ) ( LIFTING ?auto_2098 ?auto_2097 ) ( IS-CRATE ?auto_2097 ) ( not ( = ?auto_2096 ?auto_2097 ) ) )
    :subtasks
    ( ( !DROP ?auto_2098 ?auto_2097 ?auto_2096 ?auto_2099 )
      ( MAKE-1CRATE-VERIFY ?auto_2096 ?auto_2097 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2100 - SURFACE
      ?auto_2101 - SURFACE
    )
    :vars
    (
      ?auto_2102 - HOIST
      ?auto_2103 - PLACE
      ?auto_2104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2102 ?auto_2103 ) ( SURFACE-AT ?auto_2100 ?auto_2103 ) ( CLEAR ?auto_2100 ) ( IS-CRATE ?auto_2101 ) ( not ( = ?auto_2100 ?auto_2101 ) ) ( TRUCK-AT ?auto_2104 ?auto_2103 ) ( AVAILABLE ?auto_2102 ) ( IN ?auto_2101 ?auto_2104 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2102 ?auto_2101 ?auto_2104 ?auto_2103 )
      ( MAKE-1CRATE ?auto_2100 ?auto_2101 )
      ( MAKE-1CRATE-VERIFY ?auto_2100 ?auto_2101 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2105 - SURFACE
      ?auto_2106 - SURFACE
    )
    :vars
    (
      ?auto_2107 - HOIST
      ?auto_2109 - PLACE
      ?auto_2108 - TRUCK
      ?auto_2110 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2107 ?auto_2109 ) ( SURFACE-AT ?auto_2105 ?auto_2109 ) ( CLEAR ?auto_2105 ) ( IS-CRATE ?auto_2106 ) ( not ( = ?auto_2105 ?auto_2106 ) ) ( AVAILABLE ?auto_2107 ) ( IN ?auto_2106 ?auto_2108 ) ( TRUCK-AT ?auto_2108 ?auto_2110 ) ( not ( = ?auto_2110 ?auto_2109 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2108 ?auto_2110 ?auto_2109 )
      ( MAKE-1CRATE ?auto_2105 ?auto_2106 )
      ( MAKE-1CRATE-VERIFY ?auto_2105 ?auto_2106 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2111 - SURFACE
      ?auto_2112 - SURFACE
    )
    :vars
    (
      ?auto_2115 - HOIST
      ?auto_2116 - PLACE
      ?auto_2113 - TRUCK
      ?auto_2114 - PLACE
      ?auto_2117 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2115 ?auto_2116 ) ( SURFACE-AT ?auto_2111 ?auto_2116 ) ( CLEAR ?auto_2111 ) ( IS-CRATE ?auto_2112 ) ( not ( = ?auto_2111 ?auto_2112 ) ) ( AVAILABLE ?auto_2115 ) ( TRUCK-AT ?auto_2113 ?auto_2114 ) ( not ( = ?auto_2114 ?auto_2116 ) ) ( HOIST-AT ?auto_2117 ?auto_2114 ) ( LIFTING ?auto_2117 ?auto_2112 ) ( not ( = ?auto_2115 ?auto_2117 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2117 ?auto_2112 ?auto_2113 ?auto_2114 )
      ( MAKE-1CRATE ?auto_2111 ?auto_2112 )
      ( MAKE-1CRATE-VERIFY ?auto_2111 ?auto_2112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2118 - SURFACE
      ?auto_2119 - SURFACE
    )
    :vars
    (
      ?auto_2120 - HOIST
      ?auto_2121 - PLACE
      ?auto_2123 - TRUCK
      ?auto_2122 - PLACE
      ?auto_2124 - HOIST
      ?auto_2125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2120 ?auto_2121 ) ( SURFACE-AT ?auto_2118 ?auto_2121 ) ( CLEAR ?auto_2118 ) ( IS-CRATE ?auto_2119 ) ( not ( = ?auto_2118 ?auto_2119 ) ) ( AVAILABLE ?auto_2120 ) ( TRUCK-AT ?auto_2123 ?auto_2122 ) ( not ( = ?auto_2122 ?auto_2121 ) ) ( HOIST-AT ?auto_2124 ?auto_2122 ) ( not ( = ?auto_2120 ?auto_2124 ) ) ( AVAILABLE ?auto_2124 ) ( SURFACE-AT ?auto_2119 ?auto_2122 ) ( ON ?auto_2119 ?auto_2125 ) ( CLEAR ?auto_2119 ) ( not ( = ?auto_2118 ?auto_2125 ) ) ( not ( = ?auto_2119 ?auto_2125 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2124 ?auto_2119 ?auto_2125 ?auto_2122 )
      ( MAKE-1CRATE ?auto_2118 ?auto_2119 )
      ( MAKE-1CRATE-VERIFY ?auto_2118 ?auto_2119 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2126 - SURFACE
      ?auto_2127 - SURFACE
    )
    :vars
    (
      ?auto_2131 - HOIST
      ?auto_2133 - PLACE
      ?auto_2130 - PLACE
      ?auto_2128 - HOIST
      ?auto_2132 - SURFACE
      ?auto_2129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131 ?auto_2133 ) ( SURFACE-AT ?auto_2126 ?auto_2133 ) ( CLEAR ?auto_2126 ) ( IS-CRATE ?auto_2127 ) ( not ( = ?auto_2126 ?auto_2127 ) ) ( AVAILABLE ?auto_2131 ) ( not ( = ?auto_2130 ?auto_2133 ) ) ( HOIST-AT ?auto_2128 ?auto_2130 ) ( not ( = ?auto_2131 ?auto_2128 ) ) ( AVAILABLE ?auto_2128 ) ( SURFACE-AT ?auto_2127 ?auto_2130 ) ( ON ?auto_2127 ?auto_2132 ) ( CLEAR ?auto_2127 ) ( not ( = ?auto_2126 ?auto_2132 ) ) ( not ( = ?auto_2127 ?auto_2132 ) ) ( TRUCK-AT ?auto_2129 ?auto_2133 ) )
    :subtasks
    ( ( !DRIVE ?auto_2129 ?auto_2133 ?auto_2130 )
      ( MAKE-1CRATE ?auto_2126 ?auto_2127 )
      ( MAKE-1CRATE-VERIFY ?auto_2126 ?auto_2127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2139 - SURFACE
      ?auto_2140 - SURFACE
    )
    :vars
    (
      ?auto_2141 - HOIST
      ?auto_2142 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141 ?auto_2142 ) ( SURFACE-AT ?auto_2139 ?auto_2142 ) ( CLEAR ?auto_2139 ) ( LIFTING ?auto_2141 ?auto_2140 ) ( IS-CRATE ?auto_2140 ) ( not ( = ?auto_2139 ?auto_2140 ) ) )
    :subtasks
    ( ( !DROP ?auto_2141 ?auto_2140 ?auto_2139 ?auto_2142 )
      ( MAKE-1CRATE-VERIFY ?auto_2139 ?auto_2140 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2143 - SURFACE
      ?auto_2144 - SURFACE
      ?auto_2145 - SURFACE
    )
    :vars
    (
      ?auto_2146 - HOIST
      ?auto_2147 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2146 ?auto_2147 ) ( SURFACE-AT ?auto_2144 ?auto_2147 ) ( CLEAR ?auto_2144 ) ( LIFTING ?auto_2146 ?auto_2145 ) ( IS-CRATE ?auto_2145 ) ( not ( = ?auto_2144 ?auto_2145 ) ) ( ON ?auto_2144 ?auto_2143 ) ( not ( = ?auto_2143 ?auto_2144 ) ) ( not ( = ?auto_2143 ?auto_2145 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2144 ?auto_2145 )
      ( MAKE-2CRATE-VERIFY ?auto_2143 ?auto_2144 ?auto_2145 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2148 - SURFACE
      ?auto_2149 - SURFACE
    )
    :vars
    (
      ?auto_2150 - HOIST
      ?auto_2151 - PLACE
      ?auto_2152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2150 ?auto_2151 ) ( SURFACE-AT ?auto_2148 ?auto_2151 ) ( CLEAR ?auto_2148 ) ( IS-CRATE ?auto_2149 ) ( not ( = ?auto_2148 ?auto_2149 ) ) ( TRUCK-AT ?auto_2152 ?auto_2151 ) ( AVAILABLE ?auto_2150 ) ( IN ?auto_2149 ?auto_2152 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2150 ?auto_2149 ?auto_2152 ?auto_2151 )
      ( MAKE-1CRATE ?auto_2148 ?auto_2149 )
      ( MAKE-1CRATE-VERIFY ?auto_2148 ?auto_2149 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2153 - SURFACE
      ?auto_2154 - SURFACE
      ?auto_2155 - SURFACE
    )
    :vars
    (
      ?auto_2156 - HOIST
      ?auto_2158 - PLACE
      ?auto_2157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156 ?auto_2158 ) ( SURFACE-AT ?auto_2154 ?auto_2158 ) ( CLEAR ?auto_2154 ) ( IS-CRATE ?auto_2155 ) ( not ( = ?auto_2154 ?auto_2155 ) ) ( TRUCK-AT ?auto_2157 ?auto_2158 ) ( AVAILABLE ?auto_2156 ) ( IN ?auto_2155 ?auto_2157 ) ( ON ?auto_2154 ?auto_2153 ) ( not ( = ?auto_2153 ?auto_2154 ) ) ( not ( = ?auto_2153 ?auto_2155 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2154 ?auto_2155 )
      ( MAKE-2CRATE-VERIFY ?auto_2153 ?auto_2154 ?auto_2155 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2159 - SURFACE
      ?auto_2160 - SURFACE
    )
    :vars
    (
      ?auto_2162 - HOIST
      ?auto_2164 - PLACE
      ?auto_2163 - TRUCK
      ?auto_2161 - SURFACE
      ?auto_2165 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2162 ?auto_2164 ) ( SURFACE-AT ?auto_2159 ?auto_2164 ) ( CLEAR ?auto_2159 ) ( IS-CRATE ?auto_2160 ) ( not ( = ?auto_2159 ?auto_2160 ) ) ( AVAILABLE ?auto_2162 ) ( IN ?auto_2160 ?auto_2163 ) ( ON ?auto_2159 ?auto_2161 ) ( not ( = ?auto_2161 ?auto_2159 ) ) ( not ( = ?auto_2161 ?auto_2160 ) ) ( TRUCK-AT ?auto_2163 ?auto_2165 ) ( not ( = ?auto_2165 ?auto_2164 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2163 ?auto_2165 ?auto_2164 )
      ( MAKE-2CRATE ?auto_2161 ?auto_2159 ?auto_2160 )
      ( MAKE-1CRATE-VERIFY ?auto_2159 ?auto_2160 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2166 - SURFACE
      ?auto_2167 - SURFACE
      ?auto_2168 - SURFACE
    )
    :vars
    (
      ?auto_2169 - HOIST
      ?auto_2170 - PLACE
      ?auto_2171 - TRUCK
      ?auto_2172 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2169 ?auto_2170 ) ( SURFACE-AT ?auto_2167 ?auto_2170 ) ( CLEAR ?auto_2167 ) ( IS-CRATE ?auto_2168 ) ( not ( = ?auto_2167 ?auto_2168 ) ) ( AVAILABLE ?auto_2169 ) ( IN ?auto_2168 ?auto_2171 ) ( ON ?auto_2167 ?auto_2166 ) ( not ( = ?auto_2166 ?auto_2167 ) ) ( not ( = ?auto_2166 ?auto_2168 ) ) ( TRUCK-AT ?auto_2171 ?auto_2172 ) ( not ( = ?auto_2172 ?auto_2170 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2167 ?auto_2168 )
      ( MAKE-2CRATE-VERIFY ?auto_2166 ?auto_2167 ?auto_2168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2173 - SURFACE
      ?auto_2174 - SURFACE
    )
    :vars
    (
      ?auto_2178 - HOIST
      ?auto_2179 - PLACE
      ?auto_2177 - SURFACE
      ?auto_2175 - TRUCK
      ?auto_2176 - PLACE
      ?auto_2180 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178 ?auto_2179 ) ( SURFACE-AT ?auto_2173 ?auto_2179 ) ( CLEAR ?auto_2173 ) ( IS-CRATE ?auto_2174 ) ( not ( = ?auto_2173 ?auto_2174 ) ) ( AVAILABLE ?auto_2178 ) ( ON ?auto_2173 ?auto_2177 ) ( not ( = ?auto_2177 ?auto_2173 ) ) ( not ( = ?auto_2177 ?auto_2174 ) ) ( TRUCK-AT ?auto_2175 ?auto_2176 ) ( not ( = ?auto_2176 ?auto_2179 ) ) ( HOIST-AT ?auto_2180 ?auto_2176 ) ( LIFTING ?auto_2180 ?auto_2174 ) ( not ( = ?auto_2178 ?auto_2180 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2180 ?auto_2174 ?auto_2175 ?auto_2176 )
      ( MAKE-2CRATE ?auto_2177 ?auto_2173 ?auto_2174 )
      ( MAKE-1CRATE-VERIFY ?auto_2173 ?auto_2174 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2181 - SURFACE
      ?auto_2182 - SURFACE
      ?auto_2183 - SURFACE
    )
    :vars
    (
      ?auto_2187 - HOIST
      ?auto_2184 - PLACE
      ?auto_2186 - TRUCK
      ?auto_2188 - PLACE
      ?auto_2185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2187 ?auto_2184 ) ( SURFACE-AT ?auto_2182 ?auto_2184 ) ( CLEAR ?auto_2182 ) ( IS-CRATE ?auto_2183 ) ( not ( = ?auto_2182 ?auto_2183 ) ) ( AVAILABLE ?auto_2187 ) ( ON ?auto_2182 ?auto_2181 ) ( not ( = ?auto_2181 ?auto_2182 ) ) ( not ( = ?auto_2181 ?auto_2183 ) ) ( TRUCK-AT ?auto_2186 ?auto_2188 ) ( not ( = ?auto_2188 ?auto_2184 ) ) ( HOIST-AT ?auto_2185 ?auto_2188 ) ( LIFTING ?auto_2185 ?auto_2183 ) ( not ( = ?auto_2187 ?auto_2185 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2182 ?auto_2183 )
      ( MAKE-2CRATE-VERIFY ?auto_2181 ?auto_2182 ?auto_2183 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2189 - SURFACE
      ?auto_2190 - SURFACE
    )
    :vars
    (
      ?auto_2192 - HOIST
      ?auto_2195 - PLACE
      ?auto_2196 - SURFACE
      ?auto_2191 - TRUCK
      ?auto_2193 - PLACE
      ?auto_2194 - HOIST
      ?auto_2197 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2192 ?auto_2195 ) ( SURFACE-AT ?auto_2189 ?auto_2195 ) ( CLEAR ?auto_2189 ) ( IS-CRATE ?auto_2190 ) ( not ( = ?auto_2189 ?auto_2190 ) ) ( AVAILABLE ?auto_2192 ) ( ON ?auto_2189 ?auto_2196 ) ( not ( = ?auto_2196 ?auto_2189 ) ) ( not ( = ?auto_2196 ?auto_2190 ) ) ( TRUCK-AT ?auto_2191 ?auto_2193 ) ( not ( = ?auto_2193 ?auto_2195 ) ) ( HOIST-AT ?auto_2194 ?auto_2193 ) ( not ( = ?auto_2192 ?auto_2194 ) ) ( AVAILABLE ?auto_2194 ) ( SURFACE-AT ?auto_2190 ?auto_2193 ) ( ON ?auto_2190 ?auto_2197 ) ( CLEAR ?auto_2190 ) ( not ( = ?auto_2189 ?auto_2197 ) ) ( not ( = ?auto_2190 ?auto_2197 ) ) ( not ( = ?auto_2196 ?auto_2197 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2194 ?auto_2190 ?auto_2197 ?auto_2193 )
      ( MAKE-2CRATE ?auto_2196 ?auto_2189 ?auto_2190 )
      ( MAKE-1CRATE-VERIFY ?auto_2189 ?auto_2190 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2198 - SURFACE
      ?auto_2199 - SURFACE
      ?auto_2200 - SURFACE
    )
    :vars
    (
      ?auto_2204 - HOIST
      ?auto_2201 - PLACE
      ?auto_2206 - TRUCK
      ?auto_2203 - PLACE
      ?auto_2202 - HOIST
      ?auto_2205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2204 ?auto_2201 ) ( SURFACE-AT ?auto_2199 ?auto_2201 ) ( CLEAR ?auto_2199 ) ( IS-CRATE ?auto_2200 ) ( not ( = ?auto_2199 ?auto_2200 ) ) ( AVAILABLE ?auto_2204 ) ( ON ?auto_2199 ?auto_2198 ) ( not ( = ?auto_2198 ?auto_2199 ) ) ( not ( = ?auto_2198 ?auto_2200 ) ) ( TRUCK-AT ?auto_2206 ?auto_2203 ) ( not ( = ?auto_2203 ?auto_2201 ) ) ( HOIST-AT ?auto_2202 ?auto_2203 ) ( not ( = ?auto_2204 ?auto_2202 ) ) ( AVAILABLE ?auto_2202 ) ( SURFACE-AT ?auto_2200 ?auto_2203 ) ( ON ?auto_2200 ?auto_2205 ) ( CLEAR ?auto_2200 ) ( not ( = ?auto_2199 ?auto_2205 ) ) ( not ( = ?auto_2200 ?auto_2205 ) ) ( not ( = ?auto_2198 ?auto_2205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2199 ?auto_2200 )
      ( MAKE-2CRATE-VERIFY ?auto_2198 ?auto_2199 ?auto_2200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2207 - SURFACE
      ?auto_2208 - SURFACE
    )
    :vars
    (
      ?auto_2213 - HOIST
      ?auto_2209 - PLACE
      ?auto_2211 - SURFACE
      ?auto_2214 - PLACE
      ?auto_2212 - HOIST
      ?auto_2215 - SURFACE
      ?auto_2210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213 ?auto_2209 ) ( SURFACE-AT ?auto_2207 ?auto_2209 ) ( CLEAR ?auto_2207 ) ( IS-CRATE ?auto_2208 ) ( not ( = ?auto_2207 ?auto_2208 ) ) ( AVAILABLE ?auto_2213 ) ( ON ?auto_2207 ?auto_2211 ) ( not ( = ?auto_2211 ?auto_2207 ) ) ( not ( = ?auto_2211 ?auto_2208 ) ) ( not ( = ?auto_2214 ?auto_2209 ) ) ( HOIST-AT ?auto_2212 ?auto_2214 ) ( not ( = ?auto_2213 ?auto_2212 ) ) ( AVAILABLE ?auto_2212 ) ( SURFACE-AT ?auto_2208 ?auto_2214 ) ( ON ?auto_2208 ?auto_2215 ) ( CLEAR ?auto_2208 ) ( not ( = ?auto_2207 ?auto_2215 ) ) ( not ( = ?auto_2208 ?auto_2215 ) ) ( not ( = ?auto_2211 ?auto_2215 ) ) ( TRUCK-AT ?auto_2210 ?auto_2209 ) )
    :subtasks
    ( ( !DRIVE ?auto_2210 ?auto_2209 ?auto_2214 )
      ( MAKE-2CRATE ?auto_2211 ?auto_2207 ?auto_2208 )
      ( MAKE-1CRATE-VERIFY ?auto_2207 ?auto_2208 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2216 - SURFACE
      ?auto_2217 - SURFACE
      ?auto_2218 - SURFACE
    )
    :vars
    (
      ?auto_2221 - HOIST
      ?auto_2223 - PLACE
      ?auto_2219 - PLACE
      ?auto_2222 - HOIST
      ?auto_2220 - SURFACE
      ?auto_2224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2221 ?auto_2223 ) ( SURFACE-AT ?auto_2217 ?auto_2223 ) ( CLEAR ?auto_2217 ) ( IS-CRATE ?auto_2218 ) ( not ( = ?auto_2217 ?auto_2218 ) ) ( AVAILABLE ?auto_2221 ) ( ON ?auto_2217 ?auto_2216 ) ( not ( = ?auto_2216 ?auto_2217 ) ) ( not ( = ?auto_2216 ?auto_2218 ) ) ( not ( = ?auto_2219 ?auto_2223 ) ) ( HOIST-AT ?auto_2222 ?auto_2219 ) ( not ( = ?auto_2221 ?auto_2222 ) ) ( AVAILABLE ?auto_2222 ) ( SURFACE-AT ?auto_2218 ?auto_2219 ) ( ON ?auto_2218 ?auto_2220 ) ( CLEAR ?auto_2218 ) ( not ( = ?auto_2217 ?auto_2220 ) ) ( not ( = ?auto_2218 ?auto_2220 ) ) ( not ( = ?auto_2216 ?auto_2220 ) ) ( TRUCK-AT ?auto_2224 ?auto_2223 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2217 ?auto_2218 )
      ( MAKE-2CRATE-VERIFY ?auto_2216 ?auto_2217 ?auto_2218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2225 - SURFACE
      ?auto_2226 - SURFACE
    )
    :vars
    (
      ?auto_2232 - HOIST
      ?auto_2230 - PLACE
      ?auto_2229 - SURFACE
      ?auto_2233 - PLACE
      ?auto_2227 - HOIST
      ?auto_2231 - SURFACE
      ?auto_2228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2232 ?auto_2230 ) ( IS-CRATE ?auto_2226 ) ( not ( = ?auto_2225 ?auto_2226 ) ) ( not ( = ?auto_2229 ?auto_2225 ) ) ( not ( = ?auto_2229 ?auto_2226 ) ) ( not ( = ?auto_2233 ?auto_2230 ) ) ( HOIST-AT ?auto_2227 ?auto_2233 ) ( not ( = ?auto_2232 ?auto_2227 ) ) ( AVAILABLE ?auto_2227 ) ( SURFACE-AT ?auto_2226 ?auto_2233 ) ( ON ?auto_2226 ?auto_2231 ) ( CLEAR ?auto_2226 ) ( not ( = ?auto_2225 ?auto_2231 ) ) ( not ( = ?auto_2226 ?auto_2231 ) ) ( not ( = ?auto_2229 ?auto_2231 ) ) ( TRUCK-AT ?auto_2228 ?auto_2230 ) ( SURFACE-AT ?auto_2229 ?auto_2230 ) ( CLEAR ?auto_2229 ) ( LIFTING ?auto_2232 ?auto_2225 ) ( IS-CRATE ?auto_2225 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2229 ?auto_2225 )
      ( MAKE-2CRATE ?auto_2229 ?auto_2225 ?auto_2226 )
      ( MAKE-1CRATE-VERIFY ?auto_2225 ?auto_2226 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2234 - SURFACE
      ?auto_2235 - SURFACE
      ?auto_2236 - SURFACE
    )
    :vars
    (
      ?auto_2242 - HOIST
      ?auto_2237 - PLACE
      ?auto_2240 - PLACE
      ?auto_2238 - HOIST
      ?auto_2239 - SURFACE
      ?auto_2241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2242 ?auto_2237 ) ( IS-CRATE ?auto_2236 ) ( not ( = ?auto_2235 ?auto_2236 ) ) ( not ( = ?auto_2234 ?auto_2235 ) ) ( not ( = ?auto_2234 ?auto_2236 ) ) ( not ( = ?auto_2240 ?auto_2237 ) ) ( HOIST-AT ?auto_2238 ?auto_2240 ) ( not ( = ?auto_2242 ?auto_2238 ) ) ( AVAILABLE ?auto_2238 ) ( SURFACE-AT ?auto_2236 ?auto_2240 ) ( ON ?auto_2236 ?auto_2239 ) ( CLEAR ?auto_2236 ) ( not ( = ?auto_2235 ?auto_2239 ) ) ( not ( = ?auto_2236 ?auto_2239 ) ) ( not ( = ?auto_2234 ?auto_2239 ) ) ( TRUCK-AT ?auto_2241 ?auto_2237 ) ( SURFACE-AT ?auto_2234 ?auto_2237 ) ( CLEAR ?auto_2234 ) ( LIFTING ?auto_2242 ?auto_2235 ) ( IS-CRATE ?auto_2235 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2235 ?auto_2236 )
      ( MAKE-2CRATE-VERIFY ?auto_2234 ?auto_2235 ?auto_2236 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2243 - SURFACE
      ?auto_2244 - SURFACE
    )
    :vars
    (
      ?auto_2250 - HOIST
      ?auto_2249 - PLACE
      ?auto_2251 - SURFACE
      ?auto_2247 - PLACE
      ?auto_2248 - HOIST
      ?auto_2246 - SURFACE
      ?auto_2245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2250 ?auto_2249 ) ( IS-CRATE ?auto_2244 ) ( not ( = ?auto_2243 ?auto_2244 ) ) ( not ( = ?auto_2251 ?auto_2243 ) ) ( not ( = ?auto_2251 ?auto_2244 ) ) ( not ( = ?auto_2247 ?auto_2249 ) ) ( HOIST-AT ?auto_2248 ?auto_2247 ) ( not ( = ?auto_2250 ?auto_2248 ) ) ( AVAILABLE ?auto_2248 ) ( SURFACE-AT ?auto_2244 ?auto_2247 ) ( ON ?auto_2244 ?auto_2246 ) ( CLEAR ?auto_2244 ) ( not ( = ?auto_2243 ?auto_2246 ) ) ( not ( = ?auto_2244 ?auto_2246 ) ) ( not ( = ?auto_2251 ?auto_2246 ) ) ( TRUCK-AT ?auto_2245 ?auto_2249 ) ( SURFACE-AT ?auto_2251 ?auto_2249 ) ( CLEAR ?auto_2251 ) ( IS-CRATE ?auto_2243 ) ( AVAILABLE ?auto_2250 ) ( IN ?auto_2243 ?auto_2245 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2250 ?auto_2243 ?auto_2245 ?auto_2249 )
      ( MAKE-2CRATE ?auto_2251 ?auto_2243 ?auto_2244 )
      ( MAKE-1CRATE-VERIFY ?auto_2243 ?auto_2244 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2252 - SURFACE
      ?auto_2253 - SURFACE
      ?auto_2254 - SURFACE
    )
    :vars
    (
      ?auto_2255 - HOIST
      ?auto_2259 - PLACE
      ?auto_2257 - PLACE
      ?auto_2258 - HOIST
      ?auto_2260 - SURFACE
      ?auto_2256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2255 ?auto_2259 ) ( IS-CRATE ?auto_2254 ) ( not ( = ?auto_2253 ?auto_2254 ) ) ( not ( = ?auto_2252 ?auto_2253 ) ) ( not ( = ?auto_2252 ?auto_2254 ) ) ( not ( = ?auto_2257 ?auto_2259 ) ) ( HOIST-AT ?auto_2258 ?auto_2257 ) ( not ( = ?auto_2255 ?auto_2258 ) ) ( AVAILABLE ?auto_2258 ) ( SURFACE-AT ?auto_2254 ?auto_2257 ) ( ON ?auto_2254 ?auto_2260 ) ( CLEAR ?auto_2254 ) ( not ( = ?auto_2253 ?auto_2260 ) ) ( not ( = ?auto_2254 ?auto_2260 ) ) ( not ( = ?auto_2252 ?auto_2260 ) ) ( TRUCK-AT ?auto_2256 ?auto_2259 ) ( SURFACE-AT ?auto_2252 ?auto_2259 ) ( CLEAR ?auto_2252 ) ( IS-CRATE ?auto_2253 ) ( AVAILABLE ?auto_2255 ) ( IN ?auto_2253 ?auto_2256 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2253 ?auto_2254 )
      ( MAKE-2CRATE-VERIFY ?auto_2252 ?auto_2253 ?auto_2254 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2261 - SURFACE
      ?auto_2262 - SURFACE
    )
    :vars
    (
      ?auto_2265 - HOIST
      ?auto_2264 - PLACE
      ?auto_2269 - SURFACE
      ?auto_2266 - PLACE
      ?auto_2267 - HOIST
      ?auto_2263 - SURFACE
      ?auto_2268 - TRUCK
      ?auto_2270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2265 ?auto_2264 ) ( IS-CRATE ?auto_2262 ) ( not ( = ?auto_2261 ?auto_2262 ) ) ( not ( = ?auto_2269 ?auto_2261 ) ) ( not ( = ?auto_2269 ?auto_2262 ) ) ( not ( = ?auto_2266 ?auto_2264 ) ) ( HOIST-AT ?auto_2267 ?auto_2266 ) ( not ( = ?auto_2265 ?auto_2267 ) ) ( AVAILABLE ?auto_2267 ) ( SURFACE-AT ?auto_2262 ?auto_2266 ) ( ON ?auto_2262 ?auto_2263 ) ( CLEAR ?auto_2262 ) ( not ( = ?auto_2261 ?auto_2263 ) ) ( not ( = ?auto_2262 ?auto_2263 ) ) ( not ( = ?auto_2269 ?auto_2263 ) ) ( SURFACE-AT ?auto_2269 ?auto_2264 ) ( CLEAR ?auto_2269 ) ( IS-CRATE ?auto_2261 ) ( AVAILABLE ?auto_2265 ) ( IN ?auto_2261 ?auto_2268 ) ( TRUCK-AT ?auto_2268 ?auto_2270 ) ( not ( = ?auto_2270 ?auto_2264 ) ) ( not ( = ?auto_2266 ?auto_2270 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2268 ?auto_2270 ?auto_2264 )
      ( MAKE-2CRATE ?auto_2269 ?auto_2261 ?auto_2262 )
      ( MAKE-1CRATE-VERIFY ?auto_2261 ?auto_2262 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2271 - SURFACE
      ?auto_2272 - SURFACE
      ?auto_2273 - SURFACE
    )
    :vars
    (
      ?auto_2278 - HOIST
      ?auto_2275 - PLACE
      ?auto_2280 - PLACE
      ?auto_2279 - HOIST
      ?auto_2274 - SURFACE
      ?auto_2276 - TRUCK
      ?auto_2277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2278 ?auto_2275 ) ( IS-CRATE ?auto_2273 ) ( not ( = ?auto_2272 ?auto_2273 ) ) ( not ( = ?auto_2271 ?auto_2272 ) ) ( not ( = ?auto_2271 ?auto_2273 ) ) ( not ( = ?auto_2280 ?auto_2275 ) ) ( HOIST-AT ?auto_2279 ?auto_2280 ) ( not ( = ?auto_2278 ?auto_2279 ) ) ( AVAILABLE ?auto_2279 ) ( SURFACE-AT ?auto_2273 ?auto_2280 ) ( ON ?auto_2273 ?auto_2274 ) ( CLEAR ?auto_2273 ) ( not ( = ?auto_2272 ?auto_2274 ) ) ( not ( = ?auto_2273 ?auto_2274 ) ) ( not ( = ?auto_2271 ?auto_2274 ) ) ( SURFACE-AT ?auto_2271 ?auto_2275 ) ( CLEAR ?auto_2271 ) ( IS-CRATE ?auto_2272 ) ( AVAILABLE ?auto_2278 ) ( IN ?auto_2272 ?auto_2276 ) ( TRUCK-AT ?auto_2276 ?auto_2277 ) ( not ( = ?auto_2277 ?auto_2275 ) ) ( not ( = ?auto_2280 ?auto_2277 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2272 ?auto_2273 )
      ( MAKE-2CRATE-VERIFY ?auto_2271 ?auto_2272 ?auto_2273 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2281 - SURFACE
      ?auto_2282 - SURFACE
    )
    :vars
    (
      ?auto_2285 - HOIST
      ?auto_2287 - PLACE
      ?auto_2283 - SURFACE
      ?auto_2286 - PLACE
      ?auto_2288 - HOIST
      ?auto_2284 - SURFACE
      ?auto_2290 - TRUCK
      ?auto_2289 - PLACE
      ?auto_2291 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2285 ?auto_2287 ) ( IS-CRATE ?auto_2282 ) ( not ( = ?auto_2281 ?auto_2282 ) ) ( not ( = ?auto_2283 ?auto_2281 ) ) ( not ( = ?auto_2283 ?auto_2282 ) ) ( not ( = ?auto_2286 ?auto_2287 ) ) ( HOIST-AT ?auto_2288 ?auto_2286 ) ( not ( = ?auto_2285 ?auto_2288 ) ) ( AVAILABLE ?auto_2288 ) ( SURFACE-AT ?auto_2282 ?auto_2286 ) ( ON ?auto_2282 ?auto_2284 ) ( CLEAR ?auto_2282 ) ( not ( = ?auto_2281 ?auto_2284 ) ) ( not ( = ?auto_2282 ?auto_2284 ) ) ( not ( = ?auto_2283 ?auto_2284 ) ) ( SURFACE-AT ?auto_2283 ?auto_2287 ) ( CLEAR ?auto_2283 ) ( IS-CRATE ?auto_2281 ) ( AVAILABLE ?auto_2285 ) ( TRUCK-AT ?auto_2290 ?auto_2289 ) ( not ( = ?auto_2289 ?auto_2287 ) ) ( not ( = ?auto_2286 ?auto_2289 ) ) ( HOIST-AT ?auto_2291 ?auto_2289 ) ( LIFTING ?auto_2291 ?auto_2281 ) ( not ( = ?auto_2285 ?auto_2291 ) ) ( not ( = ?auto_2288 ?auto_2291 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2291 ?auto_2281 ?auto_2290 ?auto_2289 )
      ( MAKE-2CRATE ?auto_2283 ?auto_2281 ?auto_2282 )
      ( MAKE-1CRATE-VERIFY ?auto_2281 ?auto_2282 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2292 - SURFACE
      ?auto_2293 - SURFACE
      ?auto_2294 - SURFACE
    )
    :vars
    (
      ?auto_2301 - HOIST
      ?auto_2299 - PLACE
      ?auto_2300 - PLACE
      ?auto_2298 - HOIST
      ?auto_2302 - SURFACE
      ?auto_2295 - TRUCK
      ?auto_2296 - PLACE
      ?auto_2297 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2301 ?auto_2299 ) ( IS-CRATE ?auto_2294 ) ( not ( = ?auto_2293 ?auto_2294 ) ) ( not ( = ?auto_2292 ?auto_2293 ) ) ( not ( = ?auto_2292 ?auto_2294 ) ) ( not ( = ?auto_2300 ?auto_2299 ) ) ( HOIST-AT ?auto_2298 ?auto_2300 ) ( not ( = ?auto_2301 ?auto_2298 ) ) ( AVAILABLE ?auto_2298 ) ( SURFACE-AT ?auto_2294 ?auto_2300 ) ( ON ?auto_2294 ?auto_2302 ) ( CLEAR ?auto_2294 ) ( not ( = ?auto_2293 ?auto_2302 ) ) ( not ( = ?auto_2294 ?auto_2302 ) ) ( not ( = ?auto_2292 ?auto_2302 ) ) ( SURFACE-AT ?auto_2292 ?auto_2299 ) ( CLEAR ?auto_2292 ) ( IS-CRATE ?auto_2293 ) ( AVAILABLE ?auto_2301 ) ( TRUCK-AT ?auto_2295 ?auto_2296 ) ( not ( = ?auto_2296 ?auto_2299 ) ) ( not ( = ?auto_2300 ?auto_2296 ) ) ( HOIST-AT ?auto_2297 ?auto_2296 ) ( LIFTING ?auto_2297 ?auto_2293 ) ( not ( = ?auto_2301 ?auto_2297 ) ) ( not ( = ?auto_2298 ?auto_2297 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2293 ?auto_2294 )
      ( MAKE-2CRATE-VERIFY ?auto_2292 ?auto_2293 ?auto_2294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2303 - SURFACE
      ?auto_2304 - SURFACE
    )
    :vars
    (
      ?auto_2312 - HOIST
      ?auto_2306 - PLACE
      ?auto_2308 - SURFACE
      ?auto_2311 - PLACE
      ?auto_2313 - HOIST
      ?auto_2305 - SURFACE
      ?auto_2307 - TRUCK
      ?auto_2310 - PLACE
      ?auto_2309 - HOIST
      ?auto_2314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2312 ?auto_2306 ) ( IS-CRATE ?auto_2304 ) ( not ( = ?auto_2303 ?auto_2304 ) ) ( not ( = ?auto_2308 ?auto_2303 ) ) ( not ( = ?auto_2308 ?auto_2304 ) ) ( not ( = ?auto_2311 ?auto_2306 ) ) ( HOIST-AT ?auto_2313 ?auto_2311 ) ( not ( = ?auto_2312 ?auto_2313 ) ) ( AVAILABLE ?auto_2313 ) ( SURFACE-AT ?auto_2304 ?auto_2311 ) ( ON ?auto_2304 ?auto_2305 ) ( CLEAR ?auto_2304 ) ( not ( = ?auto_2303 ?auto_2305 ) ) ( not ( = ?auto_2304 ?auto_2305 ) ) ( not ( = ?auto_2308 ?auto_2305 ) ) ( SURFACE-AT ?auto_2308 ?auto_2306 ) ( CLEAR ?auto_2308 ) ( IS-CRATE ?auto_2303 ) ( AVAILABLE ?auto_2312 ) ( TRUCK-AT ?auto_2307 ?auto_2310 ) ( not ( = ?auto_2310 ?auto_2306 ) ) ( not ( = ?auto_2311 ?auto_2310 ) ) ( HOIST-AT ?auto_2309 ?auto_2310 ) ( not ( = ?auto_2312 ?auto_2309 ) ) ( not ( = ?auto_2313 ?auto_2309 ) ) ( AVAILABLE ?auto_2309 ) ( SURFACE-AT ?auto_2303 ?auto_2310 ) ( ON ?auto_2303 ?auto_2314 ) ( CLEAR ?auto_2303 ) ( not ( = ?auto_2303 ?auto_2314 ) ) ( not ( = ?auto_2304 ?auto_2314 ) ) ( not ( = ?auto_2308 ?auto_2314 ) ) ( not ( = ?auto_2305 ?auto_2314 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2309 ?auto_2303 ?auto_2314 ?auto_2310 )
      ( MAKE-2CRATE ?auto_2308 ?auto_2303 ?auto_2304 )
      ( MAKE-1CRATE-VERIFY ?auto_2303 ?auto_2304 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2315 - SURFACE
      ?auto_2316 - SURFACE
      ?auto_2317 - SURFACE
    )
    :vars
    (
      ?auto_2325 - HOIST
      ?auto_2323 - PLACE
      ?auto_2320 - PLACE
      ?auto_2326 - HOIST
      ?auto_2319 - SURFACE
      ?auto_2321 - TRUCK
      ?auto_2318 - PLACE
      ?auto_2324 - HOIST
      ?auto_2322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2325 ?auto_2323 ) ( IS-CRATE ?auto_2317 ) ( not ( = ?auto_2316 ?auto_2317 ) ) ( not ( = ?auto_2315 ?auto_2316 ) ) ( not ( = ?auto_2315 ?auto_2317 ) ) ( not ( = ?auto_2320 ?auto_2323 ) ) ( HOIST-AT ?auto_2326 ?auto_2320 ) ( not ( = ?auto_2325 ?auto_2326 ) ) ( AVAILABLE ?auto_2326 ) ( SURFACE-AT ?auto_2317 ?auto_2320 ) ( ON ?auto_2317 ?auto_2319 ) ( CLEAR ?auto_2317 ) ( not ( = ?auto_2316 ?auto_2319 ) ) ( not ( = ?auto_2317 ?auto_2319 ) ) ( not ( = ?auto_2315 ?auto_2319 ) ) ( SURFACE-AT ?auto_2315 ?auto_2323 ) ( CLEAR ?auto_2315 ) ( IS-CRATE ?auto_2316 ) ( AVAILABLE ?auto_2325 ) ( TRUCK-AT ?auto_2321 ?auto_2318 ) ( not ( = ?auto_2318 ?auto_2323 ) ) ( not ( = ?auto_2320 ?auto_2318 ) ) ( HOIST-AT ?auto_2324 ?auto_2318 ) ( not ( = ?auto_2325 ?auto_2324 ) ) ( not ( = ?auto_2326 ?auto_2324 ) ) ( AVAILABLE ?auto_2324 ) ( SURFACE-AT ?auto_2316 ?auto_2318 ) ( ON ?auto_2316 ?auto_2322 ) ( CLEAR ?auto_2316 ) ( not ( = ?auto_2316 ?auto_2322 ) ) ( not ( = ?auto_2317 ?auto_2322 ) ) ( not ( = ?auto_2315 ?auto_2322 ) ) ( not ( = ?auto_2319 ?auto_2322 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2316 ?auto_2317 )
      ( MAKE-2CRATE-VERIFY ?auto_2315 ?auto_2316 ?auto_2317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2327 - SURFACE
      ?auto_2328 - SURFACE
    )
    :vars
    (
      ?auto_2336 - HOIST
      ?auto_2331 - PLACE
      ?auto_2329 - SURFACE
      ?auto_2337 - PLACE
      ?auto_2332 - HOIST
      ?auto_2335 - SURFACE
      ?auto_2338 - PLACE
      ?auto_2330 - HOIST
      ?auto_2333 - SURFACE
      ?auto_2334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2336 ?auto_2331 ) ( IS-CRATE ?auto_2328 ) ( not ( = ?auto_2327 ?auto_2328 ) ) ( not ( = ?auto_2329 ?auto_2327 ) ) ( not ( = ?auto_2329 ?auto_2328 ) ) ( not ( = ?auto_2337 ?auto_2331 ) ) ( HOIST-AT ?auto_2332 ?auto_2337 ) ( not ( = ?auto_2336 ?auto_2332 ) ) ( AVAILABLE ?auto_2332 ) ( SURFACE-AT ?auto_2328 ?auto_2337 ) ( ON ?auto_2328 ?auto_2335 ) ( CLEAR ?auto_2328 ) ( not ( = ?auto_2327 ?auto_2335 ) ) ( not ( = ?auto_2328 ?auto_2335 ) ) ( not ( = ?auto_2329 ?auto_2335 ) ) ( SURFACE-AT ?auto_2329 ?auto_2331 ) ( CLEAR ?auto_2329 ) ( IS-CRATE ?auto_2327 ) ( AVAILABLE ?auto_2336 ) ( not ( = ?auto_2338 ?auto_2331 ) ) ( not ( = ?auto_2337 ?auto_2338 ) ) ( HOIST-AT ?auto_2330 ?auto_2338 ) ( not ( = ?auto_2336 ?auto_2330 ) ) ( not ( = ?auto_2332 ?auto_2330 ) ) ( AVAILABLE ?auto_2330 ) ( SURFACE-AT ?auto_2327 ?auto_2338 ) ( ON ?auto_2327 ?auto_2333 ) ( CLEAR ?auto_2327 ) ( not ( = ?auto_2327 ?auto_2333 ) ) ( not ( = ?auto_2328 ?auto_2333 ) ) ( not ( = ?auto_2329 ?auto_2333 ) ) ( not ( = ?auto_2335 ?auto_2333 ) ) ( TRUCK-AT ?auto_2334 ?auto_2331 ) )
    :subtasks
    ( ( !DRIVE ?auto_2334 ?auto_2331 ?auto_2338 )
      ( MAKE-2CRATE ?auto_2329 ?auto_2327 ?auto_2328 )
      ( MAKE-1CRATE-VERIFY ?auto_2327 ?auto_2328 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2339 - SURFACE
      ?auto_2340 - SURFACE
      ?auto_2341 - SURFACE
    )
    :vars
    (
      ?auto_2345 - HOIST
      ?auto_2349 - PLACE
      ?auto_2344 - PLACE
      ?auto_2348 - HOIST
      ?auto_2346 - SURFACE
      ?auto_2343 - PLACE
      ?auto_2347 - HOIST
      ?auto_2350 - SURFACE
      ?auto_2342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2345 ?auto_2349 ) ( IS-CRATE ?auto_2341 ) ( not ( = ?auto_2340 ?auto_2341 ) ) ( not ( = ?auto_2339 ?auto_2340 ) ) ( not ( = ?auto_2339 ?auto_2341 ) ) ( not ( = ?auto_2344 ?auto_2349 ) ) ( HOIST-AT ?auto_2348 ?auto_2344 ) ( not ( = ?auto_2345 ?auto_2348 ) ) ( AVAILABLE ?auto_2348 ) ( SURFACE-AT ?auto_2341 ?auto_2344 ) ( ON ?auto_2341 ?auto_2346 ) ( CLEAR ?auto_2341 ) ( not ( = ?auto_2340 ?auto_2346 ) ) ( not ( = ?auto_2341 ?auto_2346 ) ) ( not ( = ?auto_2339 ?auto_2346 ) ) ( SURFACE-AT ?auto_2339 ?auto_2349 ) ( CLEAR ?auto_2339 ) ( IS-CRATE ?auto_2340 ) ( AVAILABLE ?auto_2345 ) ( not ( = ?auto_2343 ?auto_2349 ) ) ( not ( = ?auto_2344 ?auto_2343 ) ) ( HOIST-AT ?auto_2347 ?auto_2343 ) ( not ( = ?auto_2345 ?auto_2347 ) ) ( not ( = ?auto_2348 ?auto_2347 ) ) ( AVAILABLE ?auto_2347 ) ( SURFACE-AT ?auto_2340 ?auto_2343 ) ( ON ?auto_2340 ?auto_2350 ) ( CLEAR ?auto_2340 ) ( not ( = ?auto_2340 ?auto_2350 ) ) ( not ( = ?auto_2341 ?auto_2350 ) ) ( not ( = ?auto_2339 ?auto_2350 ) ) ( not ( = ?auto_2346 ?auto_2350 ) ) ( TRUCK-AT ?auto_2342 ?auto_2349 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2340 ?auto_2341 )
      ( MAKE-2CRATE-VERIFY ?auto_2339 ?auto_2340 ?auto_2341 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2360 - SURFACE
      ?auto_2361 - SURFACE
    )
    :vars
    (
      ?auto_2362 - HOIST
      ?auto_2363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2362 ?auto_2363 ) ( SURFACE-AT ?auto_2360 ?auto_2363 ) ( CLEAR ?auto_2360 ) ( LIFTING ?auto_2362 ?auto_2361 ) ( IS-CRATE ?auto_2361 ) ( not ( = ?auto_2360 ?auto_2361 ) ) )
    :subtasks
    ( ( !DROP ?auto_2362 ?auto_2361 ?auto_2360 ?auto_2363 )
      ( MAKE-1CRATE-VERIFY ?auto_2360 ?auto_2361 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2364 - SURFACE
      ?auto_2365 - SURFACE
      ?auto_2366 - SURFACE
    )
    :vars
    (
      ?auto_2367 - HOIST
      ?auto_2368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367 ?auto_2368 ) ( SURFACE-AT ?auto_2365 ?auto_2368 ) ( CLEAR ?auto_2365 ) ( LIFTING ?auto_2367 ?auto_2366 ) ( IS-CRATE ?auto_2366 ) ( not ( = ?auto_2365 ?auto_2366 ) ) ( ON ?auto_2365 ?auto_2364 ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( not ( = ?auto_2364 ?auto_2366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2365 ?auto_2366 )
      ( MAKE-2CRATE-VERIFY ?auto_2364 ?auto_2365 ?auto_2366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2369 - SURFACE
      ?auto_2370 - SURFACE
      ?auto_2371 - SURFACE
      ?auto_2372 - SURFACE
    )
    :vars
    (
      ?auto_2373 - HOIST
      ?auto_2374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2373 ?auto_2374 ) ( SURFACE-AT ?auto_2371 ?auto_2374 ) ( CLEAR ?auto_2371 ) ( LIFTING ?auto_2373 ?auto_2372 ) ( IS-CRATE ?auto_2372 ) ( not ( = ?auto_2371 ?auto_2372 ) ) ( ON ?auto_2370 ?auto_2369 ) ( ON ?auto_2371 ?auto_2370 ) ( not ( = ?auto_2369 ?auto_2370 ) ) ( not ( = ?auto_2369 ?auto_2371 ) ) ( not ( = ?auto_2369 ?auto_2372 ) ) ( not ( = ?auto_2370 ?auto_2371 ) ) ( not ( = ?auto_2370 ?auto_2372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2371 ?auto_2372 )
      ( MAKE-3CRATE-VERIFY ?auto_2369 ?auto_2370 ?auto_2371 ?auto_2372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2375 - SURFACE
      ?auto_2376 - SURFACE
    )
    :vars
    (
      ?auto_2377 - HOIST
      ?auto_2378 - PLACE
      ?auto_2379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2377 ?auto_2378 ) ( SURFACE-AT ?auto_2375 ?auto_2378 ) ( CLEAR ?auto_2375 ) ( IS-CRATE ?auto_2376 ) ( not ( = ?auto_2375 ?auto_2376 ) ) ( TRUCK-AT ?auto_2379 ?auto_2378 ) ( AVAILABLE ?auto_2377 ) ( IN ?auto_2376 ?auto_2379 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2377 ?auto_2376 ?auto_2379 ?auto_2378 )
      ( MAKE-1CRATE ?auto_2375 ?auto_2376 )
      ( MAKE-1CRATE-VERIFY ?auto_2375 ?auto_2376 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2380 - SURFACE
      ?auto_2381 - SURFACE
      ?auto_2382 - SURFACE
    )
    :vars
    (
      ?auto_2383 - HOIST
      ?auto_2385 - PLACE
      ?auto_2384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2383 ?auto_2385 ) ( SURFACE-AT ?auto_2381 ?auto_2385 ) ( CLEAR ?auto_2381 ) ( IS-CRATE ?auto_2382 ) ( not ( = ?auto_2381 ?auto_2382 ) ) ( TRUCK-AT ?auto_2384 ?auto_2385 ) ( AVAILABLE ?auto_2383 ) ( IN ?auto_2382 ?auto_2384 ) ( ON ?auto_2381 ?auto_2380 ) ( not ( = ?auto_2380 ?auto_2381 ) ) ( not ( = ?auto_2380 ?auto_2382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2381 ?auto_2382 )
      ( MAKE-2CRATE-VERIFY ?auto_2380 ?auto_2381 ?auto_2382 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2386 - SURFACE
      ?auto_2387 - SURFACE
      ?auto_2388 - SURFACE
      ?auto_2389 - SURFACE
    )
    :vars
    (
      ?auto_2391 - HOIST
      ?auto_2392 - PLACE
      ?auto_2390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391 ?auto_2392 ) ( SURFACE-AT ?auto_2388 ?auto_2392 ) ( CLEAR ?auto_2388 ) ( IS-CRATE ?auto_2389 ) ( not ( = ?auto_2388 ?auto_2389 ) ) ( TRUCK-AT ?auto_2390 ?auto_2392 ) ( AVAILABLE ?auto_2391 ) ( IN ?auto_2389 ?auto_2390 ) ( ON ?auto_2388 ?auto_2387 ) ( not ( = ?auto_2387 ?auto_2388 ) ) ( not ( = ?auto_2387 ?auto_2389 ) ) ( ON ?auto_2387 ?auto_2386 ) ( not ( = ?auto_2386 ?auto_2387 ) ) ( not ( = ?auto_2386 ?auto_2388 ) ) ( not ( = ?auto_2386 ?auto_2389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2387 ?auto_2388 ?auto_2389 )
      ( MAKE-3CRATE-VERIFY ?auto_2386 ?auto_2387 ?auto_2388 ?auto_2389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2393 - SURFACE
      ?auto_2394 - SURFACE
    )
    :vars
    (
      ?auto_2397 - HOIST
      ?auto_2398 - PLACE
      ?auto_2396 - TRUCK
      ?auto_2395 - SURFACE
      ?auto_2399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2397 ?auto_2398 ) ( SURFACE-AT ?auto_2393 ?auto_2398 ) ( CLEAR ?auto_2393 ) ( IS-CRATE ?auto_2394 ) ( not ( = ?auto_2393 ?auto_2394 ) ) ( AVAILABLE ?auto_2397 ) ( IN ?auto_2394 ?auto_2396 ) ( ON ?auto_2393 ?auto_2395 ) ( not ( = ?auto_2395 ?auto_2393 ) ) ( not ( = ?auto_2395 ?auto_2394 ) ) ( TRUCK-AT ?auto_2396 ?auto_2399 ) ( not ( = ?auto_2399 ?auto_2398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2396 ?auto_2399 ?auto_2398 )
      ( MAKE-2CRATE ?auto_2395 ?auto_2393 ?auto_2394 )
      ( MAKE-1CRATE-VERIFY ?auto_2393 ?auto_2394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2400 - SURFACE
      ?auto_2401 - SURFACE
      ?auto_2402 - SURFACE
    )
    :vars
    (
      ?auto_2405 - HOIST
      ?auto_2406 - PLACE
      ?auto_2404 - TRUCK
      ?auto_2403 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2405 ?auto_2406 ) ( SURFACE-AT ?auto_2401 ?auto_2406 ) ( CLEAR ?auto_2401 ) ( IS-CRATE ?auto_2402 ) ( not ( = ?auto_2401 ?auto_2402 ) ) ( AVAILABLE ?auto_2405 ) ( IN ?auto_2402 ?auto_2404 ) ( ON ?auto_2401 ?auto_2400 ) ( not ( = ?auto_2400 ?auto_2401 ) ) ( not ( = ?auto_2400 ?auto_2402 ) ) ( TRUCK-AT ?auto_2404 ?auto_2403 ) ( not ( = ?auto_2403 ?auto_2406 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2401 ?auto_2402 )
      ( MAKE-2CRATE-VERIFY ?auto_2400 ?auto_2401 ?auto_2402 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2407 - SURFACE
      ?auto_2408 - SURFACE
      ?auto_2409 - SURFACE
      ?auto_2410 - SURFACE
    )
    :vars
    (
      ?auto_2411 - HOIST
      ?auto_2412 - PLACE
      ?auto_2414 - TRUCK
      ?auto_2413 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2411 ?auto_2412 ) ( SURFACE-AT ?auto_2409 ?auto_2412 ) ( CLEAR ?auto_2409 ) ( IS-CRATE ?auto_2410 ) ( not ( = ?auto_2409 ?auto_2410 ) ) ( AVAILABLE ?auto_2411 ) ( IN ?auto_2410 ?auto_2414 ) ( ON ?auto_2409 ?auto_2408 ) ( not ( = ?auto_2408 ?auto_2409 ) ) ( not ( = ?auto_2408 ?auto_2410 ) ) ( TRUCK-AT ?auto_2414 ?auto_2413 ) ( not ( = ?auto_2413 ?auto_2412 ) ) ( ON ?auto_2408 ?auto_2407 ) ( not ( = ?auto_2407 ?auto_2408 ) ) ( not ( = ?auto_2407 ?auto_2409 ) ) ( not ( = ?auto_2407 ?auto_2410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2408 ?auto_2409 ?auto_2410 )
      ( MAKE-3CRATE-VERIFY ?auto_2407 ?auto_2408 ?auto_2409 ?auto_2410 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2415 - SURFACE
      ?auto_2416 - SURFACE
    )
    :vars
    (
      ?auto_2418 - HOIST
      ?auto_2419 - PLACE
      ?auto_2417 - SURFACE
      ?auto_2421 - TRUCK
      ?auto_2420 - PLACE
      ?auto_2422 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2418 ?auto_2419 ) ( SURFACE-AT ?auto_2415 ?auto_2419 ) ( CLEAR ?auto_2415 ) ( IS-CRATE ?auto_2416 ) ( not ( = ?auto_2415 ?auto_2416 ) ) ( AVAILABLE ?auto_2418 ) ( ON ?auto_2415 ?auto_2417 ) ( not ( = ?auto_2417 ?auto_2415 ) ) ( not ( = ?auto_2417 ?auto_2416 ) ) ( TRUCK-AT ?auto_2421 ?auto_2420 ) ( not ( = ?auto_2420 ?auto_2419 ) ) ( HOIST-AT ?auto_2422 ?auto_2420 ) ( LIFTING ?auto_2422 ?auto_2416 ) ( not ( = ?auto_2418 ?auto_2422 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2422 ?auto_2416 ?auto_2421 ?auto_2420 )
      ( MAKE-2CRATE ?auto_2417 ?auto_2415 ?auto_2416 )
      ( MAKE-1CRATE-VERIFY ?auto_2415 ?auto_2416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2423 - SURFACE
      ?auto_2424 - SURFACE
      ?auto_2425 - SURFACE
    )
    :vars
    (
      ?auto_2427 - HOIST
      ?auto_2429 - PLACE
      ?auto_2426 - TRUCK
      ?auto_2428 - PLACE
      ?auto_2430 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2427 ?auto_2429 ) ( SURFACE-AT ?auto_2424 ?auto_2429 ) ( CLEAR ?auto_2424 ) ( IS-CRATE ?auto_2425 ) ( not ( = ?auto_2424 ?auto_2425 ) ) ( AVAILABLE ?auto_2427 ) ( ON ?auto_2424 ?auto_2423 ) ( not ( = ?auto_2423 ?auto_2424 ) ) ( not ( = ?auto_2423 ?auto_2425 ) ) ( TRUCK-AT ?auto_2426 ?auto_2428 ) ( not ( = ?auto_2428 ?auto_2429 ) ) ( HOIST-AT ?auto_2430 ?auto_2428 ) ( LIFTING ?auto_2430 ?auto_2425 ) ( not ( = ?auto_2427 ?auto_2430 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2424 ?auto_2425 )
      ( MAKE-2CRATE-VERIFY ?auto_2423 ?auto_2424 ?auto_2425 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2431 - SURFACE
      ?auto_2432 - SURFACE
      ?auto_2433 - SURFACE
      ?auto_2434 - SURFACE
    )
    :vars
    (
      ?auto_2436 - HOIST
      ?auto_2437 - PLACE
      ?auto_2435 - TRUCK
      ?auto_2439 - PLACE
      ?auto_2438 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2436 ?auto_2437 ) ( SURFACE-AT ?auto_2433 ?auto_2437 ) ( CLEAR ?auto_2433 ) ( IS-CRATE ?auto_2434 ) ( not ( = ?auto_2433 ?auto_2434 ) ) ( AVAILABLE ?auto_2436 ) ( ON ?auto_2433 ?auto_2432 ) ( not ( = ?auto_2432 ?auto_2433 ) ) ( not ( = ?auto_2432 ?auto_2434 ) ) ( TRUCK-AT ?auto_2435 ?auto_2439 ) ( not ( = ?auto_2439 ?auto_2437 ) ) ( HOIST-AT ?auto_2438 ?auto_2439 ) ( LIFTING ?auto_2438 ?auto_2434 ) ( not ( = ?auto_2436 ?auto_2438 ) ) ( ON ?auto_2432 ?auto_2431 ) ( not ( = ?auto_2431 ?auto_2432 ) ) ( not ( = ?auto_2431 ?auto_2433 ) ) ( not ( = ?auto_2431 ?auto_2434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2432 ?auto_2433 ?auto_2434 )
      ( MAKE-3CRATE-VERIFY ?auto_2431 ?auto_2432 ?auto_2433 ?auto_2434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2440 - SURFACE
      ?auto_2441 - SURFACE
    )
    :vars
    (
      ?auto_2444 - HOIST
      ?auto_2445 - PLACE
      ?auto_2443 - SURFACE
      ?auto_2442 - TRUCK
      ?auto_2447 - PLACE
      ?auto_2446 - HOIST
      ?auto_2448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444 ?auto_2445 ) ( SURFACE-AT ?auto_2440 ?auto_2445 ) ( CLEAR ?auto_2440 ) ( IS-CRATE ?auto_2441 ) ( not ( = ?auto_2440 ?auto_2441 ) ) ( AVAILABLE ?auto_2444 ) ( ON ?auto_2440 ?auto_2443 ) ( not ( = ?auto_2443 ?auto_2440 ) ) ( not ( = ?auto_2443 ?auto_2441 ) ) ( TRUCK-AT ?auto_2442 ?auto_2447 ) ( not ( = ?auto_2447 ?auto_2445 ) ) ( HOIST-AT ?auto_2446 ?auto_2447 ) ( not ( = ?auto_2444 ?auto_2446 ) ) ( AVAILABLE ?auto_2446 ) ( SURFACE-AT ?auto_2441 ?auto_2447 ) ( ON ?auto_2441 ?auto_2448 ) ( CLEAR ?auto_2441 ) ( not ( = ?auto_2440 ?auto_2448 ) ) ( not ( = ?auto_2441 ?auto_2448 ) ) ( not ( = ?auto_2443 ?auto_2448 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2446 ?auto_2441 ?auto_2448 ?auto_2447 )
      ( MAKE-2CRATE ?auto_2443 ?auto_2440 ?auto_2441 )
      ( MAKE-1CRATE-VERIFY ?auto_2440 ?auto_2441 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2449 - SURFACE
      ?auto_2450 - SURFACE
      ?auto_2451 - SURFACE
    )
    :vars
    (
      ?auto_2455 - HOIST
      ?auto_2452 - PLACE
      ?auto_2453 - TRUCK
      ?auto_2456 - PLACE
      ?auto_2454 - HOIST
      ?auto_2457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2455 ?auto_2452 ) ( SURFACE-AT ?auto_2450 ?auto_2452 ) ( CLEAR ?auto_2450 ) ( IS-CRATE ?auto_2451 ) ( not ( = ?auto_2450 ?auto_2451 ) ) ( AVAILABLE ?auto_2455 ) ( ON ?auto_2450 ?auto_2449 ) ( not ( = ?auto_2449 ?auto_2450 ) ) ( not ( = ?auto_2449 ?auto_2451 ) ) ( TRUCK-AT ?auto_2453 ?auto_2456 ) ( not ( = ?auto_2456 ?auto_2452 ) ) ( HOIST-AT ?auto_2454 ?auto_2456 ) ( not ( = ?auto_2455 ?auto_2454 ) ) ( AVAILABLE ?auto_2454 ) ( SURFACE-AT ?auto_2451 ?auto_2456 ) ( ON ?auto_2451 ?auto_2457 ) ( CLEAR ?auto_2451 ) ( not ( = ?auto_2450 ?auto_2457 ) ) ( not ( = ?auto_2451 ?auto_2457 ) ) ( not ( = ?auto_2449 ?auto_2457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2450 ?auto_2451 )
      ( MAKE-2CRATE-VERIFY ?auto_2449 ?auto_2450 ?auto_2451 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2458 - SURFACE
      ?auto_2459 - SURFACE
      ?auto_2460 - SURFACE
      ?auto_2461 - SURFACE
    )
    :vars
    (
      ?auto_2467 - HOIST
      ?auto_2462 - PLACE
      ?auto_2466 - TRUCK
      ?auto_2465 - PLACE
      ?auto_2463 - HOIST
      ?auto_2464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2467 ?auto_2462 ) ( SURFACE-AT ?auto_2460 ?auto_2462 ) ( CLEAR ?auto_2460 ) ( IS-CRATE ?auto_2461 ) ( not ( = ?auto_2460 ?auto_2461 ) ) ( AVAILABLE ?auto_2467 ) ( ON ?auto_2460 ?auto_2459 ) ( not ( = ?auto_2459 ?auto_2460 ) ) ( not ( = ?auto_2459 ?auto_2461 ) ) ( TRUCK-AT ?auto_2466 ?auto_2465 ) ( not ( = ?auto_2465 ?auto_2462 ) ) ( HOIST-AT ?auto_2463 ?auto_2465 ) ( not ( = ?auto_2467 ?auto_2463 ) ) ( AVAILABLE ?auto_2463 ) ( SURFACE-AT ?auto_2461 ?auto_2465 ) ( ON ?auto_2461 ?auto_2464 ) ( CLEAR ?auto_2461 ) ( not ( = ?auto_2460 ?auto_2464 ) ) ( not ( = ?auto_2461 ?auto_2464 ) ) ( not ( = ?auto_2459 ?auto_2464 ) ) ( ON ?auto_2459 ?auto_2458 ) ( not ( = ?auto_2458 ?auto_2459 ) ) ( not ( = ?auto_2458 ?auto_2460 ) ) ( not ( = ?auto_2458 ?auto_2461 ) ) ( not ( = ?auto_2458 ?auto_2464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2459 ?auto_2460 ?auto_2461 )
      ( MAKE-3CRATE-VERIFY ?auto_2458 ?auto_2459 ?auto_2460 ?auto_2461 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2468 - SURFACE
      ?auto_2469 - SURFACE
    )
    :vars
    (
      ?auto_2476 - HOIST
      ?auto_2470 - PLACE
      ?auto_2474 - SURFACE
      ?auto_2473 - PLACE
      ?auto_2471 - HOIST
      ?auto_2472 - SURFACE
      ?auto_2475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2476 ?auto_2470 ) ( SURFACE-AT ?auto_2468 ?auto_2470 ) ( CLEAR ?auto_2468 ) ( IS-CRATE ?auto_2469 ) ( not ( = ?auto_2468 ?auto_2469 ) ) ( AVAILABLE ?auto_2476 ) ( ON ?auto_2468 ?auto_2474 ) ( not ( = ?auto_2474 ?auto_2468 ) ) ( not ( = ?auto_2474 ?auto_2469 ) ) ( not ( = ?auto_2473 ?auto_2470 ) ) ( HOIST-AT ?auto_2471 ?auto_2473 ) ( not ( = ?auto_2476 ?auto_2471 ) ) ( AVAILABLE ?auto_2471 ) ( SURFACE-AT ?auto_2469 ?auto_2473 ) ( ON ?auto_2469 ?auto_2472 ) ( CLEAR ?auto_2469 ) ( not ( = ?auto_2468 ?auto_2472 ) ) ( not ( = ?auto_2469 ?auto_2472 ) ) ( not ( = ?auto_2474 ?auto_2472 ) ) ( TRUCK-AT ?auto_2475 ?auto_2470 ) )
    :subtasks
    ( ( !DRIVE ?auto_2475 ?auto_2470 ?auto_2473 )
      ( MAKE-2CRATE ?auto_2474 ?auto_2468 ?auto_2469 )
      ( MAKE-1CRATE-VERIFY ?auto_2468 ?auto_2469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2477 - SURFACE
      ?auto_2478 - SURFACE
      ?auto_2479 - SURFACE
    )
    :vars
    (
      ?auto_2480 - HOIST
      ?auto_2483 - PLACE
      ?auto_2481 - PLACE
      ?auto_2482 - HOIST
      ?auto_2484 - SURFACE
      ?auto_2485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2480 ?auto_2483 ) ( SURFACE-AT ?auto_2478 ?auto_2483 ) ( CLEAR ?auto_2478 ) ( IS-CRATE ?auto_2479 ) ( not ( = ?auto_2478 ?auto_2479 ) ) ( AVAILABLE ?auto_2480 ) ( ON ?auto_2478 ?auto_2477 ) ( not ( = ?auto_2477 ?auto_2478 ) ) ( not ( = ?auto_2477 ?auto_2479 ) ) ( not ( = ?auto_2481 ?auto_2483 ) ) ( HOIST-AT ?auto_2482 ?auto_2481 ) ( not ( = ?auto_2480 ?auto_2482 ) ) ( AVAILABLE ?auto_2482 ) ( SURFACE-AT ?auto_2479 ?auto_2481 ) ( ON ?auto_2479 ?auto_2484 ) ( CLEAR ?auto_2479 ) ( not ( = ?auto_2478 ?auto_2484 ) ) ( not ( = ?auto_2479 ?auto_2484 ) ) ( not ( = ?auto_2477 ?auto_2484 ) ) ( TRUCK-AT ?auto_2485 ?auto_2483 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2478 ?auto_2479 )
      ( MAKE-2CRATE-VERIFY ?auto_2477 ?auto_2478 ?auto_2479 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2486 - SURFACE
      ?auto_2487 - SURFACE
      ?auto_2488 - SURFACE
      ?auto_2489 - SURFACE
    )
    :vars
    (
      ?auto_2491 - HOIST
      ?auto_2492 - PLACE
      ?auto_2495 - PLACE
      ?auto_2490 - HOIST
      ?auto_2494 - SURFACE
      ?auto_2493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2491 ?auto_2492 ) ( SURFACE-AT ?auto_2488 ?auto_2492 ) ( CLEAR ?auto_2488 ) ( IS-CRATE ?auto_2489 ) ( not ( = ?auto_2488 ?auto_2489 ) ) ( AVAILABLE ?auto_2491 ) ( ON ?auto_2488 ?auto_2487 ) ( not ( = ?auto_2487 ?auto_2488 ) ) ( not ( = ?auto_2487 ?auto_2489 ) ) ( not ( = ?auto_2495 ?auto_2492 ) ) ( HOIST-AT ?auto_2490 ?auto_2495 ) ( not ( = ?auto_2491 ?auto_2490 ) ) ( AVAILABLE ?auto_2490 ) ( SURFACE-AT ?auto_2489 ?auto_2495 ) ( ON ?auto_2489 ?auto_2494 ) ( CLEAR ?auto_2489 ) ( not ( = ?auto_2488 ?auto_2494 ) ) ( not ( = ?auto_2489 ?auto_2494 ) ) ( not ( = ?auto_2487 ?auto_2494 ) ) ( TRUCK-AT ?auto_2493 ?auto_2492 ) ( ON ?auto_2487 ?auto_2486 ) ( not ( = ?auto_2486 ?auto_2487 ) ) ( not ( = ?auto_2486 ?auto_2488 ) ) ( not ( = ?auto_2486 ?auto_2489 ) ) ( not ( = ?auto_2486 ?auto_2494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2487 ?auto_2488 ?auto_2489 )
      ( MAKE-3CRATE-VERIFY ?auto_2486 ?auto_2487 ?auto_2488 ?auto_2489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2496 - SURFACE
      ?auto_2497 - SURFACE
    )
    :vars
    (
      ?auto_2499 - HOIST
      ?auto_2500 - PLACE
      ?auto_2504 - SURFACE
      ?auto_2503 - PLACE
      ?auto_2498 - HOIST
      ?auto_2502 - SURFACE
      ?auto_2501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2499 ?auto_2500 ) ( IS-CRATE ?auto_2497 ) ( not ( = ?auto_2496 ?auto_2497 ) ) ( not ( = ?auto_2504 ?auto_2496 ) ) ( not ( = ?auto_2504 ?auto_2497 ) ) ( not ( = ?auto_2503 ?auto_2500 ) ) ( HOIST-AT ?auto_2498 ?auto_2503 ) ( not ( = ?auto_2499 ?auto_2498 ) ) ( AVAILABLE ?auto_2498 ) ( SURFACE-AT ?auto_2497 ?auto_2503 ) ( ON ?auto_2497 ?auto_2502 ) ( CLEAR ?auto_2497 ) ( not ( = ?auto_2496 ?auto_2502 ) ) ( not ( = ?auto_2497 ?auto_2502 ) ) ( not ( = ?auto_2504 ?auto_2502 ) ) ( TRUCK-AT ?auto_2501 ?auto_2500 ) ( SURFACE-AT ?auto_2504 ?auto_2500 ) ( CLEAR ?auto_2504 ) ( LIFTING ?auto_2499 ?auto_2496 ) ( IS-CRATE ?auto_2496 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2504 ?auto_2496 )
      ( MAKE-2CRATE ?auto_2504 ?auto_2496 ?auto_2497 )
      ( MAKE-1CRATE-VERIFY ?auto_2496 ?auto_2497 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2505 - SURFACE
      ?auto_2506 - SURFACE
      ?auto_2507 - SURFACE
    )
    :vars
    (
      ?auto_2510 - HOIST
      ?auto_2509 - PLACE
      ?auto_2513 - PLACE
      ?auto_2512 - HOIST
      ?auto_2511 - SURFACE
      ?auto_2508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2510 ?auto_2509 ) ( IS-CRATE ?auto_2507 ) ( not ( = ?auto_2506 ?auto_2507 ) ) ( not ( = ?auto_2505 ?auto_2506 ) ) ( not ( = ?auto_2505 ?auto_2507 ) ) ( not ( = ?auto_2513 ?auto_2509 ) ) ( HOIST-AT ?auto_2512 ?auto_2513 ) ( not ( = ?auto_2510 ?auto_2512 ) ) ( AVAILABLE ?auto_2512 ) ( SURFACE-AT ?auto_2507 ?auto_2513 ) ( ON ?auto_2507 ?auto_2511 ) ( CLEAR ?auto_2507 ) ( not ( = ?auto_2506 ?auto_2511 ) ) ( not ( = ?auto_2507 ?auto_2511 ) ) ( not ( = ?auto_2505 ?auto_2511 ) ) ( TRUCK-AT ?auto_2508 ?auto_2509 ) ( SURFACE-AT ?auto_2505 ?auto_2509 ) ( CLEAR ?auto_2505 ) ( LIFTING ?auto_2510 ?auto_2506 ) ( IS-CRATE ?auto_2506 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2506 ?auto_2507 )
      ( MAKE-2CRATE-VERIFY ?auto_2505 ?auto_2506 ?auto_2507 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2514 - SURFACE
      ?auto_2515 - SURFACE
      ?auto_2516 - SURFACE
      ?auto_2517 - SURFACE
    )
    :vars
    (
      ?auto_2521 - HOIST
      ?auto_2518 - PLACE
      ?auto_2523 - PLACE
      ?auto_2520 - HOIST
      ?auto_2519 - SURFACE
      ?auto_2522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2521 ?auto_2518 ) ( IS-CRATE ?auto_2517 ) ( not ( = ?auto_2516 ?auto_2517 ) ) ( not ( = ?auto_2515 ?auto_2516 ) ) ( not ( = ?auto_2515 ?auto_2517 ) ) ( not ( = ?auto_2523 ?auto_2518 ) ) ( HOIST-AT ?auto_2520 ?auto_2523 ) ( not ( = ?auto_2521 ?auto_2520 ) ) ( AVAILABLE ?auto_2520 ) ( SURFACE-AT ?auto_2517 ?auto_2523 ) ( ON ?auto_2517 ?auto_2519 ) ( CLEAR ?auto_2517 ) ( not ( = ?auto_2516 ?auto_2519 ) ) ( not ( = ?auto_2517 ?auto_2519 ) ) ( not ( = ?auto_2515 ?auto_2519 ) ) ( TRUCK-AT ?auto_2522 ?auto_2518 ) ( SURFACE-AT ?auto_2515 ?auto_2518 ) ( CLEAR ?auto_2515 ) ( LIFTING ?auto_2521 ?auto_2516 ) ( IS-CRATE ?auto_2516 ) ( ON ?auto_2515 ?auto_2514 ) ( not ( = ?auto_2514 ?auto_2515 ) ) ( not ( = ?auto_2514 ?auto_2516 ) ) ( not ( = ?auto_2514 ?auto_2517 ) ) ( not ( = ?auto_2514 ?auto_2519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2515 ?auto_2516 ?auto_2517 )
      ( MAKE-3CRATE-VERIFY ?auto_2514 ?auto_2515 ?auto_2516 ?auto_2517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524 - SURFACE
      ?auto_2525 - SURFACE
    )
    :vars
    (
      ?auto_2530 - HOIST
      ?auto_2526 - PLACE
      ?auto_2527 - SURFACE
      ?auto_2532 - PLACE
      ?auto_2529 - HOIST
      ?auto_2528 - SURFACE
      ?auto_2531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530 ?auto_2526 ) ( IS-CRATE ?auto_2525 ) ( not ( = ?auto_2524 ?auto_2525 ) ) ( not ( = ?auto_2527 ?auto_2524 ) ) ( not ( = ?auto_2527 ?auto_2525 ) ) ( not ( = ?auto_2532 ?auto_2526 ) ) ( HOIST-AT ?auto_2529 ?auto_2532 ) ( not ( = ?auto_2530 ?auto_2529 ) ) ( AVAILABLE ?auto_2529 ) ( SURFACE-AT ?auto_2525 ?auto_2532 ) ( ON ?auto_2525 ?auto_2528 ) ( CLEAR ?auto_2525 ) ( not ( = ?auto_2524 ?auto_2528 ) ) ( not ( = ?auto_2525 ?auto_2528 ) ) ( not ( = ?auto_2527 ?auto_2528 ) ) ( TRUCK-AT ?auto_2531 ?auto_2526 ) ( SURFACE-AT ?auto_2527 ?auto_2526 ) ( CLEAR ?auto_2527 ) ( IS-CRATE ?auto_2524 ) ( AVAILABLE ?auto_2530 ) ( IN ?auto_2524 ?auto_2531 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2530 ?auto_2524 ?auto_2531 ?auto_2526 )
      ( MAKE-2CRATE ?auto_2527 ?auto_2524 ?auto_2525 )
      ( MAKE-1CRATE-VERIFY ?auto_2524 ?auto_2525 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2533 - SURFACE
      ?auto_2534 - SURFACE
      ?auto_2535 - SURFACE
    )
    :vars
    (
      ?auto_2541 - HOIST
      ?auto_2537 - PLACE
      ?auto_2536 - PLACE
      ?auto_2539 - HOIST
      ?auto_2540 - SURFACE
      ?auto_2538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2541 ?auto_2537 ) ( IS-CRATE ?auto_2535 ) ( not ( = ?auto_2534 ?auto_2535 ) ) ( not ( = ?auto_2533 ?auto_2534 ) ) ( not ( = ?auto_2533 ?auto_2535 ) ) ( not ( = ?auto_2536 ?auto_2537 ) ) ( HOIST-AT ?auto_2539 ?auto_2536 ) ( not ( = ?auto_2541 ?auto_2539 ) ) ( AVAILABLE ?auto_2539 ) ( SURFACE-AT ?auto_2535 ?auto_2536 ) ( ON ?auto_2535 ?auto_2540 ) ( CLEAR ?auto_2535 ) ( not ( = ?auto_2534 ?auto_2540 ) ) ( not ( = ?auto_2535 ?auto_2540 ) ) ( not ( = ?auto_2533 ?auto_2540 ) ) ( TRUCK-AT ?auto_2538 ?auto_2537 ) ( SURFACE-AT ?auto_2533 ?auto_2537 ) ( CLEAR ?auto_2533 ) ( IS-CRATE ?auto_2534 ) ( AVAILABLE ?auto_2541 ) ( IN ?auto_2534 ?auto_2538 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2534 ?auto_2535 )
      ( MAKE-2CRATE-VERIFY ?auto_2533 ?auto_2534 ?auto_2535 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2542 - SURFACE
      ?auto_2543 - SURFACE
      ?auto_2544 - SURFACE
      ?auto_2545 - SURFACE
    )
    :vars
    (
      ?auto_2550 - HOIST
      ?auto_2547 - PLACE
      ?auto_2546 - PLACE
      ?auto_2551 - HOIST
      ?auto_2548 - SURFACE
      ?auto_2549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2550 ?auto_2547 ) ( IS-CRATE ?auto_2545 ) ( not ( = ?auto_2544 ?auto_2545 ) ) ( not ( = ?auto_2543 ?auto_2544 ) ) ( not ( = ?auto_2543 ?auto_2545 ) ) ( not ( = ?auto_2546 ?auto_2547 ) ) ( HOIST-AT ?auto_2551 ?auto_2546 ) ( not ( = ?auto_2550 ?auto_2551 ) ) ( AVAILABLE ?auto_2551 ) ( SURFACE-AT ?auto_2545 ?auto_2546 ) ( ON ?auto_2545 ?auto_2548 ) ( CLEAR ?auto_2545 ) ( not ( = ?auto_2544 ?auto_2548 ) ) ( not ( = ?auto_2545 ?auto_2548 ) ) ( not ( = ?auto_2543 ?auto_2548 ) ) ( TRUCK-AT ?auto_2549 ?auto_2547 ) ( SURFACE-AT ?auto_2543 ?auto_2547 ) ( CLEAR ?auto_2543 ) ( IS-CRATE ?auto_2544 ) ( AVAILABLE ?auto_2550 ) ( IN ?auto_2544 ?auto_2549 ) ( ON ?auto_2543 ?auto_2542 ) ( not ( = ?auto_2542 ?auto_2543 ) ) ( not ( = ?auto_2542 ?auto_2544 ) ) ( not ( = ?auto_2542 ?auto_2545 ) ) ( not ( = ?auto_2542 ?auto_2548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2543 ?auto_2544 ?auto_2545 )
      ( MAKE-3CRATE-VERIFY ?auto_2542 ?auto_2543 ?auto_2544 ?auto_2545 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2552 - SURFACE
      ?auto_2553 - SURFACE
    )
    :vars
    (
      ?auto_2559 - HOIST
      ?auto_2555 - PLACE
      ?auto_2557 - SURFACE
      ?auto_2554 - PLACE
      ?auto_2560 - HOIST
      ?auto_2556 - SURFACE
      ?auto_2558 - TRUCK
      ?auto_2561 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2559 ?auto_2555 ) ( IS-CRATE ?auto_2553 ) ( not ( = ?auto_2552 ?auto_2553 ) ) ( not ( = ?auto_2557 ?auto_2552 ) ) ( not ( = ?auto_2557 ?auto_2553 ) ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( HOIST-AT ?auto_2560 ?auto_2554 ) ( not ( = ?auto_2559 ?auto_2560 ) ) ( AVAILABLE ?auto_2560 ) ( SURFACE-AT ?auto_2553 ?auto_2554 ) ( ON ?auto_2553 ?auto_2556 ) ( CLEAR ?auto_2553 ) ( not ( = ?auto_2552 ?auto_2556 ) ) ( not ( = ?auto_2553 ?auto_2556 ) ) ( not ( = ?auto_2557 ?auto_2556 ) ) ( SURFACE-AT ?auto_2557 ?auto_2555 ) ( CLEAR ?auto_2557 ) ( IS-CRATE ?auto_2552 ) ( AVAILABLE ?auto_2559 ) ( IN ?auto_2552 ?auto_2558 ) ( TRUCK-AT ?auto_2558 ?auto_2561 ) ( not ( = ?auto_2561 ?auto_2555 ) ) ( not ( = ?auto_2554 ?auto_2561 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2558 ?auto_2561 ?auto_2555 )
      ( MAKE-2CRATE ?auto_2557 ?auto_2552 ?auto_2553 )
      ( MAKE-1CRATE-VERIFY ?auto_2552 ?auto_2553 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2562 - SURFACE
      ?auto_2563 - SURFACE
      ?auto_2564 - SURFACE
    )
    :vars
    (
      ?auto_2565 - HOIST
      ?auto_2570 - PLACE
      ?auto_2567 - PLACE
      ?auto_2566 - HOIST
      ?auto_2568 - SURFACE
      ?auto_2571 - TRUCK
      ?auto_2569 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2565 ?auto_2570 ) ( IS-CRATE ?auto_2564 ) ( not ( = ?auto_2563 ?auto_2564 ) ) ( not ( = ?auto_2562 ?auto_2563 ) ) ( not ( = ?auto_2562 ?auto_2564 ) ) ( not ( = ?auto_2567 ?auto_2570 ) ) ( HOIST-AT ?auto_2566 ?auto_2567 ) ( not ( = ?auto_2565 ?auto_2566 ) ) ( AVAILABLE ?auto_2566 ) ( SURFACE-AT ?auto_2564 ?auto_2567 ) ( ON ?auto_2564 ?auto_2568 ) ( CLEAR ?auto_2564 ) ( not ( = ?auto_2563 ?auto_2568 ) ) ( not ( = ?auto_2564 ?auto_2568 ) ) ( not ( = ?auto_2562 ?auto_2568 ) ) ( SURFACE-AT ?auto_2562 ?auto_2570 ) ( CLEAR ?auto_2562 ) ( IS-CRATE ?auto_2563 ) ( AVAILABLE ?auto_2565 ) ( IN ?auto_2563 ?auto_2571 ) ( TRUCK-AT ?auto_2571 ?auto_2569 ) ( not ( = ?auto_2569 ?auto_2570 ) ) ( not ( = ?auto_2567 ?auto_2569 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2563 ?auto_2564 )
      ( MAKE-2CRATE-VERIFY ?auto_2562 ?auto_2563 ?auto_2564 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2572 - SURFACE
      ?auto_2573 - SURFACE
      ?auto_2574 - SURFACE
      ?auto_2575 - SURFACE
    )
    :vars
    (
      ?auto_2581 - HOIST
      ?auto_2576 - PLACE
      ?auto_2578 - PLACE
      ?auto_2577 - HOIST
      ?auto_2580 - SURFACE
      ?auto_2582 - TRUCK
      ?auto_2579 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2581 ?auto_2576 ) ( IS-CRATE ?auto_2575 ) ( not ( = ?auto_2574 ?auto_2575 ) ) ( not ( = ?auto_2573 ?auto_2574 ) ) ( not ( = ?auto_2573 ?auto_2575 ) ) ( not ( = ?auto_2578 ?auto_2576 ) ) ( HOIST-AT ?auto_2577 ?auto_2578 ) ( not ( = ?auto_2581 ?auto_2577 ) ) ( AVAILABLE ?auto_2577 ) ( SURFACE-AT ?auto_2575 ?auto_2578 ) ( ON ?auto_2575 ?auto_2580 ) ( CLEAR ?auto_2575 ) ( not ( = ?auto_2574 ?auto_2580 ) ) ( not ( = ?auto_2575 ?auto_2580 ) ) ( not ( = ?auto_2573 ?auto_2580 ) ) ( SURFACE-AT ?auto_2573 ?auto_2576 ) ( CLEAR ?auto_2573 ) ( IS-CRATE ?auto_2574 ) ( AVAILABLE ?auto_2581 ) ( IN ?auto_2574 ?auto_2582 ) ( TRUCK-AT ?auto_2582 ?auto_2579 ) ( not ( = ?auto_2579 ?auto_2576 ) ) ( not ( = ?auto_2578 ?auto_2579 ) ) ( ON ?auto_2573 ?auto_2572 ) ( not ( = ?auto_2572 ?auto_2573 ) ) ( not ( = ?auto_2572 ?auto_2574 ) ) ( not ( = ?auto_2572 ?auto_2575 ) ) ( not ( = ?auto_2572 ?auto_2580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2573 ?auto_2574 ?auto_2575 )
      ( MAKE-3CRATE-VERIFY ?auto_2572 ?auto_2573 ?auto_2574 ?auto_2575 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2583 - SURFACE
      ?auto_2584 - SURFACE
    )
    :vars
    (
      ?auto_2590 - HOIST
      ?auto_2585 - PLACE
      ?auto_2592 - SURFACE
      ?auto_2587 - PLACE
      ?auto_2586 - HOIST
      ?auto_2589 - SURFACE
      ?auto_2591 - TRUCK
      ?auto_2588 - PLACE
      ?auto_2593 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2590 ?auto_2585 ) ( IS-CRATE ?auto_2584 ) ( not ( = ?auto_2583 ?auto_2584 ) ) ( not ( = ?auto_2592 ?auto_2583 ) ) ( not ( = ?auto_2592 ?auto_2584 ) ) ( not ( = ?auto_2587 ?auto_2585 ) ) ( HOIST-AT ?auto_2586 ?auto_2587 ) ( not ( = ?auto_2590 ?auto_2586 ) ) ( AVAILABLE ?auto_2586 ) ( SURFACE-AT ?auto_2584 ?auto_2587 ) ( ON ?auto_2584 ?auto_2589 ) ( CLEAR ?auto_2584 ) ( not ( = ?auto_2583 ?auto_2589 ) ) ( not ( = ?auto_2584 ?auto_2589 ) ) ( not ( = ?auto_2592 ?auto_2589 ) ) ( SURFACE-AT ?auto_2592 ?auto_2585 ) ( CLEAR ?auto_2592 ) ( IS-CRATE ?auto_2583 ) ( AVAILABLE ?auto_2590 ) ( TRUCK-AT ?auto_2591 ?auto_2588 ) ( not ( = ?auto_2588 ?auto_2585 ) ) ( not ( = ?auto_2587 ?auto_2588 ) ) ( HOIST-AT ?auto_2593 ?auto_2588 ) ( LIFTING ?auto_2593 ?auto_2583 ) ( not ( = ?auto_2590 ?auto_2593 ) ) ( not ( = ?auto_2586 ?auto_2593 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2593 ?auto_2583 ?auto_2591 ?auto_2588 )
      ( MAKE-2CRATE ?auto_2592 ?auto_2583 ?auto_2584 )
      ( MAKE-1CRATE-VERIFY ?auto_2583 ?auto_2584 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2594 - SURFACE
      ?auto_2595 - SURFACE
      ?auto_2596 - SURFACE
    )
    :vars
    (
      ?auto_2603 - HOIST
      ?auto_2599 - PLACE
      ?auto_2598 - PLACE
      ?auto_2604 - HOIST
      ?auto_2602 - SURFACE
      ?auto_2601 - TRUCK
      ?auto_2600 - PLACE
      ?auto_2597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2603 ?auto_2599 ) ( IS-CRATE ?auto_2596 ) ( not ( = ?auto_2595 ?auto_2596 ) ) ( not ( = ?auto_2594 ?auto_2595 ) ) ( not ( = ?auto_2594 ?auto_2596 ) ) ( not ( = ?auto_2598 ?auto_2599 ) ) ( HOIST-AT ?auto_2604 ?auto_2598 ) ( not ( = ?auto_2603 ?auto_2604 ) ) ( AVAILABLE ?auto_2604 ) ( SURFACE-AT ?auto_2596 ?auto_2598 ) ( ON ?auto_2596 ?auto_2602 ) ( CLEAR ?auto_2596 ) ( not ( = ?auto_2595 ?auto_2602 ) ) ( not ( = ?auto_2596 ?auto_2602 ) ) ( not ( = ?auto_2594 ?auto_2602 ) ) ( SURFACE-AT ?auto_2594 ?auto_2599 ) ( CLEAR ?auto_2594 ) ( IS-CRATE ?auto_2595 ) ( AVAILABLE ?auto_2603 ) ( TRUCK-AT ?auto_2601 ?auto_2600 ) ( not ( = ?auto_2600 ?auto_2599 ) ) ( not ( = ?auto_2598 ?auto_2600 ) ) ( HOIST-AT ?auto_2597 ?auto_2600 ) ( LIFTING ?auto_2597 ?auto_2595 ) ( not ( = ?auto_2603 ?auto_2597 ) ) ( not ( = ?auto_2604 ?auto_2597 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2595 ?auto_2596 )
      ( MAKE-2CRATE-VERIFY ?auto_2594 ?auto_2595 ?auto_2596 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2605 - SURFACE
      ?auto_2606 - SURFACE
      ?auto_2607 - SURFACE
      ?auto_2608 - SURFACE
    )
    :vars
    (
      ?auto_2613 - HOIST
      ?auto_2611 - PLACE
      ?auto_2616 - PLACE
      ?auto_2612 - HOIST
      ?auto_2615 - SURFACE
      ?auto_2614 - TRUCK
      ?auto_2609 - PLACE
      ?auto_2610 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2613 ?auto_2611 ) ( IS-CRATE ?auto_2608 ) ( not ( = ?auto_2607 ?auto_2608 ) ) ( not ( = ?auto_2606 ?auto_2607 ) ) ( not ( = ?auto_2606 ?auto_2608 ) ) ( not ( = ?auto_2616 ?auto_2611 ) ) ( HOIST-AT ?auto_2612 ?auto_2616 ) ( not ( = ?auto_2613 ?auto_2612 ) ) ( AVAILABLE ?auto_2612 ) ( SURFACE-AT ?auto_2608 ?auto_2616 ) ( ON ?auto_2608 ?auto_2615 ) ( CLEAR ?auto_2608 ) ( not ( = ?auto_2607 ?auto_2615 ) ) ( not ( = ?auto_2608 ?auto_2615 ) ) ( not ( = ?auto_2606 ?auto_2615 ) ) ( SURFACE-AT ?auto_2606 ?auto_2611 ) ( CLEAR ?auto_2606 ) ( IS-CRATE ?auto_2607 ) ( AVAILABLE ?auto_2613 ) ( TRUCK-AT ?auto_2614 ?auto_2609 ) ( not ( = ?auto_2609 ?auto_2611 ) ) ( not ( = ?auto_2616 ?auto_2609 ) ) ( HOIST-AT ?auto_2610 ?auto_2609 ) ( LIFTING ?auto_2610 ?auto_2607 ) ( not ( = ?auto_2613 ?auto_2610 ) ) ( not ( = ?auto_2612 ?auto_2610 ) ) ( ON ?auto_2606 ?auto_2605 ) ( not ( = ?auto_2605 ?auto_2606 ) ) ( not ( = ?auto_2605 ?auto_2607 ) ) ( not ( = ?auto_2605 ?auto_2608 ) ) ( not ( = ?auto_2605 ?auto_2615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2606 ?auto_2607 ?auto_2608 )
      ( MAKE-3CRATE-VERIFY ?auto_2605 ?auto_2606 ?auto_2607 ?auto_2608 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2617 - SURFACE
      ?auto_2618 - SURFACE
    )
    :vars
    (
      ?auto_2624 - HOIST
      ?auto_2622 - PLACE
      ?auto_2620 - SURFACE
      ?auto_2627 - PLACE
      ?auto_2623 - HOIST
      ?auto_2626 - SURFACE
      ?auto_2625 - TRUCK
      ?auto_2619 - PLACE
      ?auto_2621 - HOIST
      ?auto_2628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2624 ?auto_2622 ) ( IS-CRATE ?auto_2618 ) ( not ( = ?auto_2617 ?auto_2618 ) ) ( not ( = ?auto_2620 ?auto_2617 ) ) ( not ( = ?auto_2620 ?auto_2618 ) ) ( not ( = ?auto_2627 ?auto_2622 ) ) ( HOIST-AT ?auto_2623 ?auto_2627 ) ( not ( = ?auto_2624 ?auto_2623 ) ) ( AVAILABLE ?auto_2623 ) ( SURFACE-AT ?auto_2618 ?auto_2627 ) ( ON ?auto_2618 ?auto_2626 ) ( CLEAR ?auto_2618 ) ( not ( = ?auto_2617 ?auto_2626 ) ) ( not ( = ?auto_2618 ?auto_2626 ) ) ( not ( = ?auto_2620 ?auto_2626 ) ) ( SURFACE-AT ?auto_2620 ?auto_2622 ) ( CLEAR ?auto_2620 ) ( IS-CRATE ?auto_2617 ) ( AVAILABLE ?auto_2624 ) ( TRUCK-AT ?auto_2625 ?auto_2619 ) ( not ( = ?auto_2619 ?auto_2622 ) ) ( not ( = ?auto_2627 ?auto_2619 ) ) ( HOIST-AT ?auto_2621 ?auto_2619 ) ( not ( = ?auto_2624 ?auto_2621 ) ) ( not ( = ?auto_2623 ?auto_2621 ) ) ( AVAILABLE ?auto_2621 ) ( SURFACE-AT ?auto_2617 ?auto_2619 ) ( ON ?auto_2617 ?auto_2628 ) ( CLEAR ?auto_2617 ) ( not ( = ?auto_2617 ?auto_2628 ) ) ( not ( = ?auto_2618 ?auto_2628 ) ) ( not ( = ?auto_2620 ?auto_2628 ) ) ( not ( = ?auto_2626 ?auto_2628 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2621 ?auto_2617 ?auto_2628 ?auto_2619 )
      ( MAKE-2CRATE ?auto_2620 ?auto_2617 ?auto_2618 )
      ( MAKE-1CRATE-VERIFY ?auto_2617 ?auto_2618 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2629 - SURFACE
      ?auto_2630 - SURFACE
      ?auto_2631 - SURFACE
    )
    :vars
    (
      ?auto_2634 - HOIST
      ?auto_2632 - PLACE
      ?auto_2640 - PLACE
      ?auto_2635 - HOIST
      ?auto_2639 - SURFACE
      ?auto_2633 - TRUCK
      ?auto_2638 - PLACE
      ?auto_2637 - HOIST
      ?auto_2636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2634 ?auto_2632 ) ( IS-CRATE ?auto_2631 ) ( not ( = ?auto_2630 ?auto_2631 ) ) ( not ( = ?auto_2629 ?auto_2630 ) ) ( not ( = ?auto_2629 ?auto_2631 ) ) ( not ( = ?auto_2640 ?auto_2632 ) ) ( HOIST-AT ?auto_2635 ?auto_2640 ) ( not ( = ?auto_2634 ?auto_2635 ) ) ( AVAILABLE ?auto_2635 ) ( SURFACE-AT ?auto_2631 ?auto_2640 ) ( ON ?auto_2631 ?auto_2639 ) ( CLEAR ?auto_2631 ) ( not ( = ?auto_2630 ?auto_2639 ) ) ( not ( = ?auto_2631 ?auto_2639 ) ) ( not ( = ?auto_2629 ?auto_2639 ) ) ( SURFACE-AT ?auto_2629 ?auto_2632 ) ( CLEAR ?auto_2629 ) ( IS-CRATE ?auto_2630 ) ( AVAILABLE ?auto_2634 ) ( TRUCK-AT ?auto_2633 ?auto_2638 ) ( not ( = ?auto_2638 ?auto_2632 ) ) ( not ( = ?auto_2640 ?auto_2638 ) ) ( HOIST-AT ?auto_2637 ?auto_2638 ) ( not ( = ?auto_2634 ?auto_2637 ) ) ( not ( = ?auto_2635 ?auto_2637 ) ) ( AVAILABLE ?auto_2637 ) ( SURFACE-AT ?auto_2630 ?auto_2638 ) ( ON ?auto_2630 ?auto_2636 ) ( CLEAR ?auto_2630 ) ( not ( = ?auto_2630 ?auto_2636 ) ) ( not ( = ?auto_2631 ?auto_2636 ) ) ( not ( = ?auto_2629 ?auto_2636 ) ) ( not ( = ?auto_2639 ?auto_2636 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2630 ?auto_2631 )
      ( MAKE-2CRATE-VERIFY ?auto_2629 ?auto_2630 ?auto_2631 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2641 - SURFACE
      ?auto_2642 - SURFACE
      ?auto_2643 - SURFACE
      ?auto_2644 - SURFACE
    )
    :vars
    (
      ?auto_2647 - HOIST
      ?auto_2653 - PLACE
      ?auto_2649 - PLACE
      ?auto_2648 - HOIST
      ?auto_2645 - SURFACE
      ?auto_2650 - TRUCK
      ?auto_2651 - PLACE
      ?auto_2646 - HOIST
      ?auto_2652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2647 ?auto_2653 ) ( IS-CRATE ?auto_2644 ) ( not ( = ?auto_2643 ?auto_2644 ) ) ( not ( = ?auto_2642 ?auto_2643 ) ) ( not ( = ?auto_2642 ?auto_2644 ) ) ( not ( = ?auto_2649 ?auto_2653 ) ) ( HOIST-AT ?auto_2648 ?auto_2649 ) ( not ( = ?auto_2647 ?auto_2648 ) ) ( AVAILABLE ?auto_2648 ) ( SURFACE-AT ?auto_2644 ?auto_2649 ) ( ON ?auto_2644 ?auto_2645 ) ( CLEAR ?auto_2644 ) ( not ( = ?auto_2643 ?auto_2645 ) ) ( not ( = ?auto_2644 ?auto_2645 ) ) ( not ( = ?auto_2642 ?auto_2645 ) ) ( SURFACE-AT ?auto_2642 ?auto_2653 ) ( CLEAR ?auto_2642 ) ( IS-CRATE ?auto_2643 ) ( AVAILABLE ?auto_2647 ) ( TRUCK-AT ?auto_2650 ?auto_2651 ) ( not ( = ?auto_2651 ?auto_2653 ) ) ( not ( = ?auto_2649 ?auto_2651 ) ) ( HOIST-AT ?auto_2646 ?auto_2651 ) ( not ( = ?auto_2647 ?auto_2646 ) ) ( not ( = ?auto_2648 ?auto_2646 ) ) ( AVAILABLE ?auto_2646 ) ( SURFACE-AT ?auto_2643 ?auto_2651 ) ( ON ?auto_2643 ?auto_2652 ) ( CLEAR ?auto_2643 ) ( not ( = ?auto_2643 ?auto_2652 ) ) ( not ( = ?auto_2644 ?auto_2652 ) ) ( not ( = ?auto_2642 ?auto_2652 ) ) ( not ( = ?auto_2645 ?auto_2652 ) ) ( ON ?auto_2642 ?auto_2641 ) ( not ( = ?auto_2641 ?auto_2642 ) ) ( not ( = ?auto_2641 ?auto_2643 ) ) ( not ( = ?auto_2641 ?auto_2644 ) ) ( not ( = ?auto_2641 ?auto_2645 ) ) ( not ( = ?auto_2641 ?auto_2652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2642 ?auto_2643 ?auto_2644 )
      ( MAKE-3CRATE-VERIFY ?auto_2641 ?auto_2642 ?auto_2643 ?auto_2644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2654 - SURFACE
      ?auto_2655 - SURFACE
    )
    :vars
    (
      ?auto_2658 - HOIST
      ?auto_2665 - PLACE
      ?auto_2664 - SURFACE
      ?auto_2660 - PLACE
      ?auto_2659 - HOIST
      ?auto_2656 - SURFACE
      ?auto_2662 - PLACE
      ?auto_2657 - HOIST
      ?auto_2663 - SURFACE
      ?auto_2661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658 ?auto_2665 ) ( IS-CRATE ?auto_2655 ) ( not ( = ?auto_2654 ?auto_2655 ) ) ( not ( = ?auto_2664 ?auto_2654 ) ) ( not ( = ?auto_2664 ?auto_2655 ) ) ( not ( = ?auto_2660 ?auto_2665 ) ) ( HOIST-AT ?auto_2659 ?auto_2660 ) ( not ( = ?auto_2658 ?auto_2659 ) ) ( AVAILABLE ?auto_2659 ) ( SURFACE-AT ?auto_2655 ?auto_2660 ) ( ON ?auto_2655 ?auto_2656 ) ( CLEAR ?auto_2655 ) ( not ( = ?auto_2654 ?auto_2656 ) ) ( not ( = ?auto_2655 ?auto_2656 ) ) ( not ( = ?auto_2664 ?auto_2656 ) ) ( SURFACE-AT ?auto_2664 ?auto_2665 ) ( CLEAR ?auto_2664 ) ( IS-CRATE ?auto_2654 ) ( AVAILABLE ?auto_2658 ) ( not ( = ?auto_2662 ?auto_2665 ) ) ( not ( = ?auto_2660 ?auto_2662 ) ) ( HOIST-AT ?auto_2657 ?auto_2662 ) ( not ( = ?auto_2658 ?auto_2657 ) ) ( not ( = ?auto_2659 ?auto_2657 ) ) ( AVAILABLE ?auto_2657 ) ( SURFACE-AT ?auto_2654 ?auto_2662 ) ( ON ?auto_2654 ?auto_2663 ) ( CLEAR ?auto_2654 ) ( not ( = ?auto_2654 ?auto_2663 ) ) ( not ( = ?auto_2655 ?auto_2663 ) ) ( not ( = ?auto_2664 ?auto_2663 ) ) ( not ( = ?auto_2656 ?auto_2663 ) ) ( TRUCK-AT ?auto_2661 ?auto_2665 ) )
    :subtasks
    ( ( !DRIVE ?auto_2661 ?auto_2665 ?auto_2662 )
      ( MAKE-2CRATE ?auto_2664 ?auto_2654 ?auto_2655 )
      ( MAKE-1CRATE-VERIFY ?auto_2654 ?auto_2655 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2666 - SURFACE
      ?auto_2667 - SURFACE
      ?auto_2668 - SURFACE
    )
    :vars
    (
      ?auto_2673 - HOIST
      ?auto_2677 - PLACE
      ?auto_2672 - PLACE
      ?auto_2671 - HOIST
      ?auto_2676 - SURFACE
      ?auto_2669 - PLACE
      ?auto_2674 - HOIST
      ?auto_2675 - SURFACE
      ?auto_2670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2673 ?auto_2677 ) ( IS-CRATE ?auto_2668 ) ( not ( = ?auto_2667 ?auto_2668 ) ) ( not ( = ?auto_2666 ?auto_2667 ) ) ( not ( = ?auto_2666 ?auto_2668 ) ) ( not ( = ?auto_2672 ?auto_2677 ) ) ( HOIST-AT ?auto_2671 ?auto_2672 ) ( not ( = ?auto_2673 ?auto_2671 ) ) ( AVAILABLE ?auto_2671 ) ( SURFACE-AT ?auto_2668 ?auto_2672 ) ( ON ?auto_2668 ?auto_2676 ) ( CLEAR ?auto_2668 ) ( not ( = ?auto_2667 ?auto_2676 ) ) ( not ( = ?auto_2668 ?auto_2676 ) ) ( not ( = ?auto_2666 ?auto_2676 ) ) ( SURFACE-AT ?auto_2666 ?auto_2677 ) ( CLEAR ?auto_2666 ) ( IS-CRATE ?auto_2667 ) ( AVAILABLE ?auto_2673 ) ( not ( = ?auto_2669 ?auto_2677 ) ) ( not ( = ?auto_2672 ?auto_2669 ) ) ( HOIST-AT ?auto_2674 ?auto_2669 ) ( not ( = ?auto_2673 ?auto_2674 ) ) ( not ( = ?auto_2671 ?auto_2674 ) ) ( AVAILABLE ?auto_2674 ) ( SURFACE-AT ?auto_2667 ?auto_2669 ) ( ON ?auto_2667 ?auto_2675 ) ( CLEAR ?auto_2667 ) ( not ( = ?auto_2667 ?auto_2675 ) ) ( not ( = ?auto_2668 ?auto_2675 ) ) ( not ( = ?auto_2666 ?auto_2675 ) ) ( not ( = ?auto_2676 ?auto_2675 ) ) ( TRUCK-AT ?auto_2670 ?auto_2677 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2667 ?auto_2668 )
      ( MAKE-2CRATE-VERIFY ?auto_2666 ?auto_2667 ?auto_2668 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2678 - SURFACE
      ?auto_2679 - SURFACE
      ?auto_2680 - SURFACE
      ?auto_2681 - SURFACE
    )
    :vars
    (
      ?auto_2686 - HOIST
      ?auto_2684 - PLACE
      ?auto_2682 - PLACE
      ?auto_2689 - HOIST
      ?auto_2688 - SURFACE
      ?auto_2690 - PLACE
      ?auto_2683 - HOIST
      ?auto_2685 - SURFACE
      ?auto_2687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2686 ?auto_2684 ) ( IS-CRATE ?auto_2681 ) ( not ( = ?auto_2680 ?auto_2681 ) ) ( not ( = ?auto_2679 ?auto_2680 ) ) ( not ( = ?auto_2679 ?auto_2681 ) ) ( not ( = ?auto_2682 ?auto_2684 ) ) ( HOIST-AT ?auto_2689 ?auto_2682 ) ( not ( = ?auto_2686 ?auto_2689 ) ) ( AVAILABLE ?auto_2689 ) ( SURFACE-AT ?auto_2681 ?auto_2682 ) ( ON ?auto_2681 ?auto_2688 ) ( CLEAR ?auto_2681 ) ( not ( = ?auto_2680 ?auto_2688 ) ) ( not ( = ?auto_2681 ?auto_2688 ) ) ( not ( = ?auto_2679 ?auto_2688 ) ) ( SURFACE-AT ?auto_2679 ?auto_2684 ) ( CLEAR ?auto_2679 ) ( IS-CRATE ?auto_2680 ) ( AVAILABLE ?auto_2686 ) ( not ( = ?auto_2690 ?auto_2684 ) ) ( not ( = ?auto_2682 ?auto_2690 ) ) ( HOIST-AT ?auto_2683 ?auto_2690 ) ( not ( = ?auto_2686 ?auto_2683 ) ) ( not ( = ?auto_2689 ?auto_2683 ) ) ( AVAILABLE ?auto_2683 ) ( SURFACE-AT ?auto_2680 ?auto_2690 ) ( ON ?auto_2680 ?auto_2685 ) ( CLEAR ?auto_2680 ) ( not ( = ?auto_2680 ?auto_2685 ) ) ( not ( = ?auto_2681 ?auto_2685 ) ) ( not ( = ?auto_2679 ?auto_2685 ) ) ( not ( = ?auto_2688 ?auto_2685 ) ) ( TRUCK-AT ?auto_2687 ?auto_2684 ) ( ON ?auto_2679 ?auto_2678 ) ( not ( = ?auto_2678 ?auto_2679 ) ) ( not ( = ?auto_2678 ?auto_2680 ) ) ( not ( = ?auto_2678 ?auto_2681 ) ) ( not ( = ?auto_2678 ?auto_2688 ) ) ( not ( = ?auto_2678 ?auto_2685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2679 ?auto_2680 ?auto_2681 )
      ( MAKE-3CRATE-VERIFY ?auto_2678 ?auto_2679 ?auto_2680 ?auto_2681 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2691 - SURFACE
      ?auto_2692 - SURFACE
    )
    :vars
    (
      ?auto_2697 - HOIST
      ?auto_2695 - PLACE
      ?auto_2700 - SURFACE
      ?auto_2693 - PLACE
      ?auto_2701 - HOIST
      ?auto_2699 - SURFACE
      ?auto_2702 - PLACE
      ?auto_2694 - HOIST
      ?auto_2696 - SURFACE
      ?auto_2698 - TRUCK
      ?auto_2703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2697 ?auto_2695 ) ( IS-CRATE ?auto_2692 ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2700 ?auto_2691 ) ) ( not ( = ?auto_2700 ?auto_2692 ) ) ( not ( = ?auto_2693 ?auto_2695 ) ) ( HOIST-AT ?auto_2701 ?auto_2693 ) ( not ( = ?auto_2697 ?auto_2701 ) ) ( AVAILABLE ?auto_2701 ) ( SURFACE-AT ?auto_2692 ?auto_2693 ) ( ON ?auto_2692 ?auto_2699 ) ( CLEAR ?auto_2692 ) ( not ( = ?auto_2691 ?auto_2699 ) ) ( not ( = ?auto_2692 ?auto_2699 ) ) ( not ( = ?auto_2700 ?auto_2699 ) ) ( IS-CRATE ?auto_2691 ) ( not ( = ?auto_2702 ?auto_2695 ) ) ( not ( = ?auto_2693 ?auto_2702 ) ) ( HOIST-AT ?auto_2694 ?auto_2702 ) ( not ( = ?auto_2697 ?auto_2694 ) ) ( not ( = ?auto_2701 ?auto_2694 ) ) ( AVAILABLE ?auto_2694 ) ( SURFACE-AT ?auto_2691 ?auto_2702 ) ( ON ?auto_2691 ?auto_2696 ) ( CLEAR ?auto_2691 ) ( not ( = ?auto_2691 ?auto_2696 ) ) ( not ( = ?auto_2692 ?auto_2696 ) ) ( not ( = ?auto_2700 ?auto_2696 ) ) ( not ( = ?auto_2699 ?auto_2696 ) ) ( TRUCK-AT ?auto_2698 ?auto_2695 ) ( SURFACE-AT ?auto_2703 ?auto_2695 ) ( CLEAR ?auto_2703 ) ( LIFTING ?auto_2697 ?auto_2700 ) ( IS-CRATE ?auto_2700 ) ( not ( = ?auto_2703 ?auto_2700 ) ) ( not ( = ?auto_2691 ?auto_2703 ) ) ( not ( = ?auto_2692 ?auto_2703 ) ) ( not ( = ?auto_2699 ?auto_2703 ) ) ( not ( = ?auto_2696 ?auto_2703 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2703 ?auto_2700 )
      ( MAKE-2CRATE ?auto_2700 ?auto_2691 ?auto_2692 )
      ( MAKE-1CRATE-VERIFY ?auto_2691 ?auto_2692 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2704 - SURFACE
      ?auto_2705 - SURFACE
      ?auto_2706 - SURFACE
    )
    :vars
    (
      ?auto_2710 - HOIST
      ?auto_2708 - PLACE
      ?auto_2712 - PLACE
      ?auto_2711 - HOIST
      ?auto_2716 - SURFACE
      ?auto_2709 - PLACE
      ?auto_2707 - HOIST
      ?auto_2714 - SURFACE
      ?auto_2715 - TRUCK
      ?auto_2713 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2710 ?auto_2708 ) ( IS-CRATE ?auto_2706 ) ( not ( = ?auto_2705 ?auto_2706 ) ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( not ( = ?auto_2704 ?auto_2706 ) ) ( not ( = ?auto_2712 ?auto_2708 ) ) ( HOIST-AT ?auto_2711 ?auto_2712 ) ( not ( = ?auto_2710 ?auto_2711 ) ) ( AVAILABLE ?auto_2711 ) ( SURFACE-AT ?auto_2706 ?auto_2712 ) ( ON ?auto_2706 ?auto_2716 ) ( CLEAR ?auto_2706 ) ( not ( = ?auto_2705 ?auto_2716 ) ) ( not ( = ?auto_2706 ?auto_2716 ) ) ( not ( = ?auto_2704 ?auto_2716 ) ) ( IS-CRATE ?auto_2705 ) ( not ( = ?auto_2709 ?auto_2708 ) ) ( not ( = ?auto_2712 ?auto_2709 ) ) ( HOIST-AT ?auto_2707 ?auto_2709 ) ( not ( = ?auto_2710 ?auto_2707 ) ) ( not ( = ?auto_2711 ?auto_2707 ) ) ( AVAILABLE ?auto_2707 ) ( SURFACE-AT ?auto_2705 ?auto_2709 ) ( ON ?auto_2705 ?auto_2714 ) ( CLEAR ?auto_2705 ) ( not ( = ?auto_2705 ?auto_2714 ) ) ( not ( = ?auto_2706 ?auto_2714 ) ) ( not ( = ?auto_2704 ?auto_2714 ) ) ( not ( = ?auto_2716 ?auto_2714 ) ) ( TRUCK-AT ?auto_2715 ?auto_2708 ) ( SURFACE-AT ?auto_2713 ?auto_2708 ) ( CLEAR ?auto_2713 ) ( LIFTING ?auto_2710 ?auto_2704 ) ( IS-CRATE ?auto_2704 ) ( not ( = ?auto_2713 ?auto_2704 ) ) ( not ( = ?auto_2705 ?auto_2713 ) ) ( not ( = ?auto_2706 ?auto_2713 ) ) ( not ( = ?auto_2716 ?auto_2713 ) ) ( not ( = ?auto_2714 ?auto_2713 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2705 ?auto_2706 )
      ( MAKE-2CRATE-VERIFY ?auto_2704 ?auto_2705 ?auto_2706 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2717 - SURFACE
      ?auto_2718 - SURFACE
      ?auto_2719 - SURFACE
      ?auto_2720 - SURFACE
    )
    :vars
    (
      ?auto_2725 - HOIST
      ?auto_2723 - PLACE
      ?auto_2721 - PLACE
      ?auto_2722 - HOIST
      ?auto_2728 - SURFACE
      ?auto_2727 - PLACE
      ?auto_2726 - HOIST
      ?auto_2729 - SURFACE
      ?auto_2724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2725 ?auto_2723 ) ( IS-CRATE ?auto_2720 ) ( not ( = ?auto_2719 ?auto_2720 ) ) ( not ( = ?auto_2718 ?auto_2719 ) ) ( not ( = ?auto_2718 ?auto_2720 ) ) ( not ( = ?auto_2721 ?auto_2723 ) ) ( HOIST-AT ?auto_2722 ?auto_2721 ) ( not ( = ?auto_2725 ?auto_2722 ) ) ( AVAILABLE ?auto_2722 ) ( SURFACE-AT ?auto_2720 ?auto_2721 ) ( ON ?auto_2720 ?auto_2728 ) ( CLEAR ?auto_2720 ) ( not ( = ?auto_2719 ?auto_2728 ) ) ( not ( = ?auto_2720 ?auto_2728 ) ) ( not ( = ?auto_2718 ?auto_2728 ) ) ( IS-CRATE ?auto_2719 ) ( not ( = ?auto_2727 ?auto_2723 ) ) ( not ( = ?auto_2721 ?auto_2727 ) ) ( HOIST-AT ?auto_2726 ?auto_2727 ) ( not ( = ?auto_2725 ?auto_2726 ) ) ( not ( = ?auto_2722 ?auto_2726 ) ) ( AVAILABLE ?auto_2726 ) ( SURFACE-AT ?auto_2719 ?auto_2727 ) ( ON ?auto_2719 ?auto_2729 ) ( CLEAR ?auto_2719 ) ( not ( = ?auto_2719 ?auto_2729 ) ) ( not ( = ?auto_2720 ?auto_2729 ) ) ( not ( = ?auto_2718 ?auto_2729 ) ) ( not ( = ?auto_2728 ?auto_2729 ) ) ( TRUCK-AT ?auto_2724 ?auto_2723 ) ( SURFACE-AT ?auto_2717 ?auto_2723 ) ( CLEAR ?auto_2717 ) ( LIFTING ?auto_2725 ?auto_2718 ) ( IS-CRATE ?auto_2718 ) ( not ( = ?auto_2717 ?auto_2718 ) ) ( not ( = ?auto_2719 ?auto_2717 ) ) ( not ( = ?auto_2720 ?auto_2717 ) ) ( not ( = ?auto_2728 ?auto_2717 ) ) ( not ( = ?auto_2729 ?auto_2717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2718 ?auto_2719 ?auto_2720 )
      ( MAKE-3CRATE-VERIFY ?auto_2717 ?auto_2718 ?auto_2719 ?auto_2720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2730 - SURFACE
      ?auto_2731 - SURFACE
    )
    :vars
    (
      ?auto_2736 - HOIST
      ?auto_2734 - PLACE
      ?auto_2738 - SURFACE
      ?auto_2732 - PLACE
      ?auto_2733 - HOIST
      ?auto_2741 - SURFACE
      ?auto_2739 - PLACE
      ?auto_2737 - HOIST
      ?auto_2742 - SURFACE
      ?auto_2735 - TRUCK
      ?auto_2740 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2736 ?auto_2734 ) ( IS-CRATE ?auto_2731 ) ( not ( = ?auto_2730 ?auto_2731 ) ) ( not ( = ?auto_2738 ?auto_2730 ) ) ( not ( = ?auto_2738 ?auto_2731 ) ) ( not ( = ?auto_2732 ?auto_2734 ) ) ( HOIST-AT ?auto_2733 ?auto_2732 ) ( not ( = ?auto_2736 ?auto_2733 ) ) ( AVAILABLE ?auto_2733 ) ( SURFACE-AT ?auto_2731 ?auto_2732 ) ( ON ?auto_2731 ?auto_2741 ) ( CLEAR ?auto_2731 ) ( not ( = ?auto_2730 ?auto_2741 ) ) ( not ( = ?auto_2731 ?auto_2741 ) ) ( not ( = ?auto_2738 ?auto_2741 ) ) ( IS-CRATE ?auto_2730 ) ( not ( = ?auto_2739 ?auto_2734 ) ) ( not ( = ?auto_2732 ?auto_2739 ) ) ( HOIST-AT ?auto_2737 ?auto_2739 ) ( not ( = ?auto_2736 ?auto_2737 ) ) ( not ( = ?auto_2733 ?auto_2737 ) ) ( AVAILABLE ?auto_2737 ) ( SURFACE-AT ?auto_2730 ?auto_2739 ) ( ON ?auto_2730 ?auto_2742 ) ( CLEAR ?auto_2730 ) ( not ( = ?auto_2730 ?auto_2742 ) ) ( not ( = ?auto_2731 ?auto_2742 ) ) ( not ( = ?auto_2738 ?auto_2742 ) ) ( not ( = ?auto_2741 ?auto_2742 ) ) ( TRUCK-AT ?auto_2735 ?auto_2734 ) ( SURFACE-AT ?auto_2740 ?auto_2734 ) ( CLEAR ?auto_2740 ) ( IS-CRATE ?auto_2738 ) ( not ( = ?auto_2740 ?auto_2738 ) ) ( not ( = ?auto_2730 ?auto_2740 ) ) ( not ( = ?auto_2731 ?auto_2740 ) ) ( not ( = ?auto_2741 ?auto_2740 ) ) ( not ( = ?auto_2742 ?auto_2740 ) ) ( AVAILABLE ?auto_2736 ) ( IN ?auto_2738 ?auto_2735 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2736 ?auto_2738 ?auto_2735 ?auto_2734 )
      ( MAKE-2CRATE ?auto_2738 ?auto_2730 ?auto_2731 )
      ( MAKE-1CRATE-VERIFY ?auto_2730 ?auto_2731 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2743 - SURFACE
      ?auto_2744 - SURFACE
      ?auto_2745 - SURFACE
    )
    :vars
    (
      ?auto_2748 - HOIST
      ?auto_2746 - PLACE
      ?auto_2751 - PLACE
      ?auto_2753 - HOIST
      ?auto_2754 - SURFACE
      ?auto_2749 - PLACE
      ?auto_2750 - HOIST
      ?auto_2752 - SURFACE
      ?auto_2755 - TRUCK
      ?auto_2747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2748 ?auto_2746 ) ( IS-CRATE ?auto_2745 ) ( not ( = ?auto_2744 ?auto_2745 ) ) ( not ( = ?auto_2743 ?auto_2744 ) ) ( not ( = ?auto_2743 ?auto_2745 ) ) ( not ( = ?auto_2751 ?auto_2746 ) ) ( HOIST-AT ?auto_2753 ?auto_2751 ) ( not ( = ?auto_2748 ?auto_2753 ) ) ( AVAILABLE ?auto_2753 ) ( SURFACE-AT ?auto_2745 ?auto_2751 ) ( ON ?auto_2745 ?auto_2754 ) ( CLEAR ?auto_2745 ) ( not ( = ?auto_2744 ?auto_2754 ) ) ( not ( = ?auto_2745 ?auto_2754 ) ) ( not ( = ?auto_2743 ?auto_2754 ) ) ( IS-CRATE ?auto_2744 ) ( not ( = ?auto_2749 ?auto_2746 ) ) ( not ( = ?auto_2751 ?auto_2749 ) ) ( HOIST-AT ?auto_2750 ?auto_2749 ) ( not ( = ?auto_2748 ?auto_2750 ) ) ( not ( = ?auto_2753 ?auto_2750 ) ) ( AVAILABLE ?auto_2750 ) ( SURFACE-AT ?auto_2744 ?auto_2749 ) ( ON ?auto_2744 ?auto_2752 ) ( CLEAR ?auto_2744 ) ( not ( = ?auto_2744 ?auto_2752 ) ) ( not ( = ?auto_2745 ?auto_2752 ) ) ( not ( = ?auto_2743 ?auto_2752 ) ) ( not ( = ?auto_2754 ?auto_2752 ) ) ( TRUCK-AT ?auto_2755 ?auto_2746 ) ( SURFACE-AT ?auto_2747 ?auto_2746 ) ( CLEAR ?auto_2747 ) ( IS-CRATE ?auto_2743 ) ( not ( = ?auto_2747 ?auto_2743 ) ) ( not ( = ?auto_2744 ?auto_2747 ) ) ( not ( = ?auto_2745 ?auto_2747 ) ) ( not ( = ?auto_2754 ?auto_2747 ) ) ( not ( = ?auto_2752 ?auto_2747 ) ) ( AVAILABLE ?auto_2748 ) ( IN ?auto_2743 ?auto_2755 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2744 ?auto_2745 )
      ( MAKE-2CRATE-VERIFY ?auto_2743 ?auto_2744 ?auto_2745 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2756 - SURFACE
      ?auto_2757 - SURFACE
      ?auto_2758 - SURFACE
      ?auto_2759 - SURFACE
    )
    :vars
    (
      ?auto_2764 - HOIST
      ?auto_2762 - PLACE
      ?auto_2767 - PLACE
      ?auto_2768 - HOIST
      ?auto_2765 - SURFACE
      ?auto_2766 - PLACE
      ?auto_2761 - HOIST
      ?auto_2763 - SURFACE
      ?auto_2760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764 ?auto_2762 ) ( IS-CRATE ?auto_2759 ) ( not ( = ?auto_2758 ?auto_2759 ) ) ( not ( = ?auto_2757 ?auto_2758 ) ) ( not ( = ?auto_2757 ?auto_2759 ) ) ( not ( = ?auto_2767 ?auto_2762 ) ) ( HOIST-AT ?auto_2768 ?auto_2767 ) ( not ( = ?auto_2764 ?auto_2768 ) ) ( AVAILABLE ?auto_2768 ) ( SURFACE-AT ?auto_2759 ?auto_2767 ) ( ON ?auto_2759 ?auto_2765 ) ( CLEAR ?auto_2759 ) ( not ( = ?auto_2758 ?auto_2765 ) ) ( not ( = ?auto_2759 ?auto_2765 ) ) ( not ( = ?auto_2757 ?auto_2765 ) ) ( IS-CRATE ?auto_2758 ) ( not ( = ?auto_2766 ?auto_2762 ) ) ( not ( = ?auto_2767 ?auto_2766 ) ) ( HOIST-AT ?auto_2761 ?auto_2766 ) ( not ( = ?auto_2764 ?auto_2761 ) ) ( not ( = ?auto_2768 ?auto_2761 ) ) ( AVAILABLE ?auto_2761 ) ( SURFACE-AT ?auto_2758 ?auto_2766 ) ( ON ?auto_2758 ?auto_2763 ) ( CLEAR ?auto_2758 ) ( not ( = ?auto_2758 ?auto_2763 ) ) ( not ( = ?auto_2759 ?auto_2763 ) ) ( not ( = ?auto_2757 ?auto_2763 ) ) ( not ( = ?auto_2765 ?auto_2763 ) ) ( TRUCK-AT ?auto_2760 ?auto_2762 ) ( SURFACE-AT ?auto_2756 ?auto_2762 ) ( CLEAR ?auto_2756 ) ( IS-CRATE ?auto_2757 ) ( not ( = ?auto_2756 ?auto_2757 ) ) ( not ( = ?auto_2758 ?auto_2756 ) ) ( not ( = ?auto_2759 ?auto_2756 ) ) ( not ( = ?auto_2765 ?auto_2756 ) ) ( not ( = ?auto_2763 ?auto_2756 ) ) ( AVAILABLE ?auto_2764 ) ( IN ?auto_2757 ?auto_2760 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2757 ?auto_2758 ?auto_2759 )
      ( MAKE-3CRATE-VERIFY ?auto_2756 ?auto_2757 ?auto_2758 ?auto_2759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2769 - SURFACE
      ?auto_2770 - SURFACE
    )
    :vars
    (
      ?auto_2775 - HOIST
      ?auto_2773 - PLACE
      ?auto_2778 - SURFACE
      ?auto_2779 - PLACE
      ?auto_2781 - HOIST
      ?auto_2776 - SURFACE
      ?auto_2777 - PLACE
      ?auto_2772 - HOIST
      ?auto_2774 - SURFACE
      ?auto_2780 - SURFACE
      ?auto_2771 - TRUCK
      ?auto_2782 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2775 ?auto_2773 ) ( IS-CRATE ?auto_2770 ) ( not ( = ?auto_2769 ?auto_2770 ) ) ( not ( = ?auto_2778 ?auto_2769 ) ) ( not ( = ?auto_2778 ?auto_2770 ) ) ( not ( = ?auto_2779 ?auto_2773 ) ) ( HOIST-AT ?auto_2781 ?auto_2779 ) ( not ( = ?auto_2775 ?auto_2781 ) ) ( AVAILABLE ?auto_2781 ) ( SURFACE-AT ?auto_2770 ?auto_2779 ) ( ON ?auto_2770 ?auto_2776 ) ( CLEAR ?auto_2770 ) ( not ( = ?auto_2769 ?auto_2776 ) ) ( not ( = ?auto_2770 ?auto_2776 ) ) ( not ( = ?auto_2778 ?auto_2776 ) ) ( IS-CRATE ?auto_2769 ) ( not ( = ?auto_2777 ?auto_2773 ) ) ( not ( = ?auto_2779 ?auto_2777 ) ) ( HOIST-AT ?auto_2772 ?auto_2777 ) ( not ( = ?auto_2775 ?auto_2772 ) ) ( not ( = ?auto_2781 ?auto_2772 ) ) ( AVAILABLE ?auto_2772 ) ( SURFACE-AT ?auto_2769 ?auto_2777 ) ( ON ?auto_2769 ?auto_2774 ) ( CLEAR ?auto_2769 ) ( not ( = ?auto_2769 ?auto_2774 ) ) ( not ( = ?auto_2770 ?auto_2774 ) ) ( not ( = ?auto_2778 ?auto_2774 ) ) ( not ( = ?auto_2776 ?auto_2774 ) ) ( SURFACE-AT ?auto_2780 ?auto_2773 ) ( CLEAR ?auto_2780 ) ( IS-CRATE ?auto_2778 ) ( not ( = ?auto_2780 ?auto_2778 ) ) ( not ( = ?auto_2769 ?auto_2780 ) ) ( not ( = ?auto_2770 ?auto_2780 ) ) ( not ( = ?auto_2776 ?auto_2780 ) ) ( not ( = ?auto_2774 ?auto_2780 ) ) ( AVAILABLE ?auto_2775 ) ( IN ?auto_2778 ?auto_2771 ) ( TRUCK-AT ?auto_2771 ?auto_2782 ) ( not ( = ?auto_2782 ?auto_2773 ) ) ( not ( = ?auto_2779 ?auto_2782 ) ) ( not ( = ?auto_2777 ?auto_2782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2771 ?auto_2782 ?auto_2773 )
      ( MAKE-2CRATE ?auto_2778 ?auto_2769 ?auto_2770 )
      ( MAKE-1CRATE-VERIFY ?auto_2769 ?auto_2770 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2783 - SURFACE
      ?auto_2784 - SURFACE
      ?auto_2785 - SURFACE
    )
    :vars
    (
      ?auto_2788 - HOIST
      ?auto_2787 - PLACE
      ?auto_2786 - PLACE
      ?auto_2789 - HOIST
      ?auto_2790 - SURFACE
      ?auto_2792 - PLACE
      ?auto_2796 - HOIST
      ?auto_2793 - SURFACE
      ?auto_2791 - SURFACE
      ?auto_2794 - TRUCK
      ?auto_2795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2788 ?auto_2787 ) ( IS-CRATE ?auto_2785 ) ( not ( = ?auto_2784 ?auto_2785 ) ) ( not ( = ?auto_2783 ?auto_2784 ) ) ( not ( = ?auto_2783 ?auto_2785 ) ) ( not ( = ?auto_2786 ?auto_2787 ) ) ( HOIST-AT ?auto_2789 ?auto_2786 ) ( not ( = ?auto_2788 ?auto_2789 ) ) ( AVAILABLE ?auto_2789 ) ( SURFACE-AT ?auto_2785 ?auto_2786 ) ( ON ?auto_2785 ?auto_2790 ) ( CLEAR ?auto_2785 ) ( not ( = ?auto_2784 ?auto_2790 ) ) ( not ( = ?auto_2785 ?auto_2790 ) ) ( not ( = ?auto_2783 ?auto_2790 ) ) ( IS-CRATE ?auto_2784 ) ( not ( = ?auto_2792 ?auto_2787 ) ) ( not ( = ?auto_2786 ?auto_2792 ) ) ( HOIST-AT ?auto_2796 ?auto_2792 ) ( not ( = ?auto_2788 ?auto_2796 ) ) ( not ( = ?auto_2789 ?auto_2796 ) ) ( AVAILABLE ?auto_2796 ) ( SURFACE-AT ?auto_2784 ?auto_2792 ) ( ON ?auto_2784 ?auto_2793 ) ( CLEAR ?auto_2784 ) ( not ( = ?auto_2784 ?auto_2793 ) ) ( not ( = ?auto_2785 ?auto_2793 ) ) ( not ( = ?auto_2783 ?auto_2793 ) ) ( not ( = ?auto_2790 ?auto_2793 ) ) ( SURFACE-AT ?auto_2791 ?auto_2787 ) ( CLEAR ?auto_2791 ) ( IS-CRATE ?auto_2783 ) ( not ( = ?auto_2791 ?auto_2783 ) ) ( not ( = ?auto_2784 ?auto_2791 ) ) ( not ( = ?auto_2785 ?auto_2791 ) ) ( not ( = ?auto_2790 ?auto_2791 ) ) ( not ( = ?auto_2793 ?auto_2791 ) ) ( AVAILABLE ?auto_2788 ) ( IN ?auto_2783 ?auto_2794 ) ( TRUCK-AT ?auto_2794 ?auto_2795 ) ( not ( = ?auto_2795 ?auto_2787 ) ) ( not ( = ?auto_2786 ?auto_2795 ) ) ( not ( = ?auto_2792 ?auto_2795 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2784 ?auto_2785 )
      ( MAKE-2CRATE-VERIFY ?auto_2783 ?auto_2784 ?auto_2785 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2797 - SURFACE
      ?auto_2798 - SURFACE
      ?auto_2799 - SURFACE
      ?auto_2800 - SURFACE
    )
    :vars
    (
      ?auto_2803 - HOIST
      ?auto_2804 - PLACE
      ?auto_2807 - PLACE
      ?auto_2801 - HOIST
      ?auto_2802 - SURFACE
      ?auto_2809 - PLACE
      ?auto_2806 - HOIST
      ?auto_2810 - SURFACE
      ?auto_2808 - TRUCK
      ?auto_2805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2803 ?auto_2804 ) ( IS-CRATE ?auto_2800 ) ( not ( = ?auto_2799 ?auto_2800 ) ) ( not ( = ?auto_2798 ?auto_2799 ) ) ( not ( = ?auto_2798 ?auto_2800 ) ) ( not ( = ?auto_2807 ?auto_2804 ) ) ( HOIST-AT ?auto_2801 ?auto_2807 ) ( not ( = ?auto_2803 ?auto_2801 ) ) ( AVAILABLE ?auto_2801 ) ( SURFACE-AT ?auto_2800 ?auto_2807 ) ( ON ?auto_2800 ?auto_2802 ) ( CLEAR ?auto_2800 ) ( not ( = ?auto_2799 ?auto_2802 ) ) ( not ( = ?auto_2800 ?auto_2802 ) ) ( not ( = ?auto_2798 ?auto_2802 ) ) ( IS-CRATE ?auto_2799 ) ( not ( = ?auto_2809 ?auto_2804 ) ) ( not ( = ?auto_2807 ?auto_2809 ) ) ( HOIST-AT ?auto_2806 ?auto_2809 ) ( not ( = ?auto_2803 ?auto_2806 ) ) ( not ( = ?auto_2801 ?auto_2806 ) ) ( AVAILABLE ?auto_2806 ) ( SURFACE-AT ?auto_2799 ?auto_2809 ) ( ON ?auto_2799 ?auto_2810 ) ( CLEAR ?auto_2799 ) ( not ( = ?auto_2799 ?auto_2810 ) ) ( not ( = ?auto_2800 ?auto_2810 ) ) ( not ( = ?auto_2798 ?auto_2810 ) ) ( not ( = ?auto_2802 ?auto_2810 ) ) ( SURFACE-AT ?auto_2797 ?auto_2804 ) ( CLEAR ?auto_2797 ) ( IS-CRATE ?auto_2798 ) ( not ( = ?auto_2797 ?auto_2798 ) ) ( not ( = ?auto_2799 ?auto_2797 ) ) ( not ( = ?auto_2800 ?auto_2797 ) ) ( not ( = ?auto_2802 ?auto_2797 ) ) ( not ( = ?auto_2810 ?auto_2797 ) ) ( AVAILABLE ?auto_2803 ) ( IN ?auto_2798 ?auto_2808 ) ( TRUCK-AT ?auto_2808 ?auto_2805 ) ( not ( = ?auto_2805 ?auto_2804 ) ) ( not ( = ?auto_2807 ?auto_2805 ) ) ( not ( = ?auto_2809 ?auto_2805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2798 ?auto_2799 ?auto_2800 )
      ( MAKE-3CRATE-VERIFY ?auto_2797 ?auto_2798 ?auto_2799 ?auto_2800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2811 - SURFACE
      ?auto_2812 - SURFACE
    )
    :vars
    (
      ?auto_2816 - HOIST
      ?auto_2817 - PLACE
      ?auto_2821 - SURFACE
      ?auto_2820 - PLACE
      ?auto_2814 - HOIST
      ?auto_2815 - SURFACE
      ?auto_2823 - PLACE
      ?auto_2819 - HOIST
      ?auto_2824 - SURFACE
      ?auto_2813 - SURFACE
      ?auto_2822 - TRUCK
      ?auto_2818 - PLACE
      ?auto_2825 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2816 ?auto_2817 ) ( IS-CRATE ?auto_2812 ) ( not ( = ?auto_2811 ?auto_2812 ) ) ( not ( = ?auto_2821 ?auto_2811 ) ) ( not ( = ?auto_2821 ?auto_2812 ) ) ( not ( = ?auto_2820 ?auto_2817 ) ) ( HOIST-AT ?auto_2814 ?auto_2820 ) ( not ( = ?auto_2816 ?auto_2814 ) ) ( AVAILABLE ?auto_2814 ) ( SURFACE-AT ?auto_2812 ?auto_2820 ) ( ON ?auto_2812 ?auto_2815 ) ( CLEAR ?auto_2812 ) ( not ( = ?auto_2811 ?auto_2815 ) ) ( not ( = ?auto_2812 ?auto_2815 ) ) ( not ( = ?auto_2821 ?auto_2815 ) ) ( IS-CRATE ?auto_2811 ) ( not ( = ?auto_2823 ?auto_2817 ) ) ( not ( = ?auto_2820 ?auto_2823 ) ) ( HOIST-AT ?auto_2819 ?auto_2823 ) ( not ( = ?auto_2816 ?auto_2819 ) ) ( not ( = ?auto_2814 ?auto_2819 ) ) ( AVAILABLE ?auto_2819 ) ( SURFACE-AT ?auto_2811 ?auto_2823 ) ( ON ?auto_2811 ?auto_2824 ) ( CLEAR ?auto_2811 ) ( not ( = ?auto_2811 ?auto_2824 ) ) ( not ( = ?auto_2812 ?auto_2824 ) ) ( not ( = ?auto_2821 ?auto_2824 ) ) ( not ( = ?auto_2815 ?auto_2824 ) ) ( SURFACE-AT ?auto_2813 ?auto_2817 ) ( CLEAR ?auto_2813 ) ( IS-CRATE ?auto_2821 ) ( not ( = ?auto_2813 ?auto_2821 ) ) ( not ( = ?auto_2811 ?auto_2813 ) ) ( not ( = ?auto_2812 ?auto_2813 ) ) ( not ( = ?auto_2815 ?auto_2813 ) ) ( not ( = ?auto_2824 ?auto_2813 ) ) ( AVAILABLE ?auto_2816 ) ( TRUCK-AT ?auto_2822 ?auto_2818 ) ( not ( = ?auto_2818 ?auto_2817 ) ) ( not ( = ?auto_2820 ?auto_2818 ) ) ( not ( = ?auto_2823 ?auto_2818 ) ) ( HOIST-AT ?auto_2825 ?auto_2818 ) ( LIFTING ?auto_2825 ?auto_2821 ) ( not ( = ?auto_2816 ?auto_2825 ) ) ( not ( = ?auto_2814 ?auto_2825 ) ) ( not ( = ?auto_2819 ?auto_2825 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2825 ?auto_2821 ?auto_2822 ?auto_2818 )
      ( MAKE-2CRATE ?auto_2821 ?auto_2811 ?auto_2812 )
      ( MAKE-1CRATE-VERIFY ?auto_2811 ?auto_2812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2826 - SURFACE
      ?auto_2827 - SURFACE
      ?auto_2828 - SURFACE
    )
    :vars
    (
      ?auto_2838 - HOIST
      ?auto_2833 - PLACE
      ?auto_2835 - PLACE
      ?auto_2831 - HOIST
      ?auto_2832 - SURFACE
      ?auto_2837 - PLACE
      ?auto_2829 - HOIST
      ?auto_2830 - SURFACE
      ?auto_2840 - SURFACE
      ?auto_2836 - TRUCK
      ?auto_2834 - PLACE
      ?auto_2839 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2838 ?auto_2833 ) ( IS-CRATE ?auto_2828 ) ( not ( = ?auto_2827 ?auto_2828 ) ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( not ( = ?auto_2826 ?auto_2828 ) ) ( not ( = ?auto_2835 ?auto_2833 ) ) ( HOIST-AT ?auto_2831 ?auto_2835 ) ( not ( = ?auto_2838 ?auto_2831 ) ) ( AVAILABLE ?auto_2831 ) ( SURFACE-AT ?auto_2828 ?auto_2835 ) ( ON ?auto_2828 ?auto_2832 ) ( CLEAR ?auto_2828 ) ( not ( = ?auto_2827 ?auto_2832 ) ) ( not ( = ?auto_2828 ?auto_2832 ) ) ( not ( = ?auto_2826 ?auto_2832 ) ) ( IS-CRATE ?auto_2827 ) ( not ( = ?auto_2837 ?auto_2833 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( HOIST-AT ?auto_2829 ?auto_2837 ) ( not ( = ?auto_2838 ?auto_2829 ) ) ( not ( = ?auto_2831 ?auto_2829 ) ) ( AVAILABLE ?auto_2829 ) ( SURFACE-AT ?auto_2827 ?auto_2837 ) ( ON ?auto_2827 ?auto_2830 ) ( CLEAR ?auto_2827 ) ( not ( = ?auto_2827 ?auto_2830 ) ) ( not ( = ?auto_2828 ?auto_2830 ) ) ( not ( = ?auto_2826 ?auto_2830 ) ) ( not ( = ?auto_2832 ?auto_2830 ) ) ( SURFACE-AT ?auto_2840 ?auto_2833 ) ( CLEAR ?auto_2840 ) ( IS-CRATE ?auto_2826 ) ( not ( = ?auto_2840 ?auto_2826 ) ) ( not ( = ?auto_2827 ?auto_2840 ) ) ( not ( = ?auto_2828 ?auto_2840 ) ) ( not ( = ?auto_2832 ?auto_2840 ) ) ( not ( = ?auto_2830 ?auto_2840 ) ) ( AVAILABLE ?auto_2838 ) ( TRUCK-AT ?auto_2836 ?auto_2834 ) ( not ( = ?auto_2834 ?auto_2833 ) ) ( not ( = ?auto_2835 ?auto_2834 ) ) ( not ( = ?auto_2837 ?auto_2834 ) ) ( HOIST-AT ?auto_2839 ?auto_2834 ) ( LIFTING ?auto_2839 ?auto_2826 ) ( not ( = ?auto_2838 ?auto_2839 ) ) ( not ( = ?auto_2831 ?auto_2839 ) ) ( not ( = ?auto_2829 ?auto_2839 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2827 ?auto_2828 )
      ( MAKE-2CRATE-VERIFY ?auto_2826 ?auto_2827 ?auto_2828 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2841 - SURFACE
      ?auto_2842 - SURFACE
      ?auto_2843 - SURFACE
      ?auto_2844 - SURFACE
    )
    :vars
    (
      ?auto_2845 - HOIST
      ?auto_2849 - PLACE
      ?auto_2846 - PLACE
      ?auto_2855 - HOIST
      ?auto_2852 - SURFACE
      ?auto_2847 - PLACE
      ?auto_2853 - HOIST
      ?auto_2854 - SURFACE
      ?auto_2851 - TRUCK
      ?auto_2848 - PLACE
      ?auto_2850 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2845 ?auto_2849 ) ( IS-CRATE ?auto_2844 ) ( not ( = ?auto_2843 ?auto_2844 ) ) ( not ( = ?auto_2842 ?auto_2843 ) ) ( not ( = ?auto_2842 ?auto_2844 ) ) ( not ( = ?auto_2846 ?auto_2849 ) ) ( HOIST-AT ?auto_2855 ?auto_2846 ) ( not ( = ?auto_2845 ?auto_2855 ) ) ( AVAILABLE ?auto_2855 ) ( SURFACE-AT ?auto_2844 ?auto_2846 ) ( ON ?auto_2844 ?auto_2852 ) ( CLEAR ?auto_2844 ) ( not ( = ?auto_2843 ?auto_2852 ) ) ( not ( = ?auto_2844 ?auto_2852 ) ) ( not ( = ?auto_2842 ?auto_2852 ) ) ( IS-CRATE ?auto_2843 ) ( not ( = ?auto_2847 ?auto_2849 ) ) ( not ( = ?auto_2846 ?auto_2847 ) ) ( HOIST-AT ?auto_2853 ?auto_2847 ) ( not ( = ?auto_2845 ?auto_2853 ) ) ( not ( = ?auto_2855 ?auto_2853 ) ) ( AVAILABLE ?auto_2853 ) ( SURFACE-AT ?auto_2843 ?auto_2847 ) ( ON ?auto_2843 ?auto_2854 ) ( CLEAR ?auto_2843 ) ( not ( = ?auto_2843 ?auto_2854 ) ) ( not ( = ?auto_2844 ?auto_2854 ) ) ( not ( = ?auto_2842 ?auto_2854 ) ) ( not ( = ?auto_2852 ?auto_2854 ) ) ( SURFACE-AT ?auto_2841 ?auto_2849 ) ( CLEAR ?auto_2841 ) ( IS-CRATE ?auto_2842 ) ( not ( = ?auto_2841 ?auto_2842 ) ) ( not ( = ?auto_2843 ?auto_2841 ) ) ( not ( = ?auto_2844 ?auto_2841 ) ) ( not ( = ?auto_2852 ?auto_2841 ) ) ( not ( = ?auto_2854 ?auto_2841 ) ) ( AVAILABLE ?auto_2845 ) ( TRUCK-AT ?auto_2851 ?auto_2848 ) ( not ( = ?auto_2848 ?auto_2849 ) ) ( not ( = ?auto_2846 ?auto_2848 ) ) ( not ( = ?auto_2847 ?auto_2848 ) ) ( HOIST-AT ?auto_2850 ?auto_2848 ) ( LIFTING ?auto_2850 ?auto_2842 ) ( not ( = ?auto_2845 ?auto_2850 ) ) ( not ( = ?auto_2855 ?auto_2850 ) ) ( not ( = ?auto_2853 ?auto_2850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2842 ?auto_2843 ?auto_2844 )
      ( MAKE-3CRATE-VERIFY ?auto_2841 ?auto_2842 ?auto_2843 ?auto_2844 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2856 - SURFACE
      ?auto_2857 - SURFACE
    )
    :vars
    (
      ?auto_2858 - HOIST
      ?auto_2863 - PLACE
      ?auto_2870 - SURFACE
      ?auto_2859 - PLACE
      ?auto_2869 - HOIST
      ?auto_2866 - SURFACE
      ?auto_2860 - PLACE
      ?auto_2867 - HOIST
      ?auto_2868 - SURFACE
      ?auto_2862 - SURFACE
      ?auto_2865 - TRUCK
      ?auto_2861 - PLACE
      ?auto_2864 - HOIST
      ?auto_2871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2858 ?auto_2863 ) ( IS-CRATE ?auto_2857 ) ( not ( = ?auto_2856 ?auto_2857 ) ) ( not ( = ?auto_2870 ?auto_2856 ) ) ( not ( = ?auto_2870 ?auto_2857 ) ) ( not ( = ?auto_2859 ?auto_2863 ) ) ( HOIST-AT ?auto_2869 ?auto_2859 ) ( not ( = ?auto_2858 ?auto_2869 ) ) ( AVAILABLE ?auto_2869 ) ( SURFACE-AT ?auto_2857 ?auto_2859 ) ( ON ?auto_2857 ?auto_2866 ) ( CLEAR ?auto_2857 ) ( not ( = ?auto_2856 ?auto_2866 ) ) ( not ( = ?auto_2857 ?auto_2866 ) ) ( not ( = ?auto_2870 ?auto_2866 ) ) ( IS-CRATE ?auto_2856 ) ( not ( = ?auto_2860 ?auto_2863 ) ) ( not ( = ?auto_2859 ?auto_2860 ) ) ( HOIST-AT ?auto_2867 ?auto_2860 ) ( not ( = ?auto_2858 ?auto_2867 ) ) ( not ( = ?auto_2869 ?auto_2867 ) ) ( AVAILABLE ?auto_2867 ) ( SURFACE-AT ?auto_2856 ?auto_2860 ) ( ON ?auto_2856 ?auto_2868 ) ( CLEAR ?auto_2856 ) ( not ( = ?auto_2856 ?auto_2868 ) ) ( not ( = ?auto_2857 ?auto_2868 ) ) ( not ( = ?auto_2870 ?auto_2868 ) ) ( not ( = ?auto_2866 ?auto_2868 ) ) ( SURFACE-AT ?auto_2862 ?auto_2863 ) ( CLEAR ?auto_2862 ) ( IS-CRATE ?auto_2870 ) ( not ( = ?auto_2862 ?auto_2870 ) ) ( not ( = ?auto_2856 ?auto_2862 ) ) ( not ( = ?auto_2857 ?auto_2862 ) ) ( not ( = ?auto_2866 ?auto_2862 ) ) ( not ( = ?auto_2868 ?auto_2862 ) ) ( AVAILABLE ?auto_2858 ) ( TRUCK-AT ?auto_2865 ?auto_2861 ) ( not ( = ?auto_2861 ?auto_2863 ) ) ( not ( = ?auto_2859 ?auto_2861 ) ) ( not ( = ?auto_2860 ?auto_2861 ) ) ( HOIST-AT ?auto_2864 ?auto_2861 ) ( not ( = ?auto_2858 ?auto_2864 ) ) ( not ( = ?auto_2869 ?auto_2864 ) ) ( not ( = ?auto_2867 ?auto_2864 ) ) ( AVAILABLE ?auto_2864 ) ( SURFACE-AT ?auto_2870 ?auto_2861 ) ( ON ?auto_2870 ?auto_2871 ) ( CLEAR ?auto_2870 ) ( not ( = ?auto_2856 ?auto_2871 ) ) ( not ( = ?auto_2857 ?auto_2871 ) ) ( not ( = ?auto_2870 ?auto_2871 ) ) ( not ( = ?auto_2866 ?auto_2871 ) ) ( not ( = ?auto_2868 ?auto_2871 ) ) ( not ( = ?auto_2862 ?auto_2871 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2864 ?auto_2870 ?auto_2871 ?auto_2861 )
      ( MAKE-2CRATE ?auto_2870 ?auto_2856 ?auto_2857 )
      ( MAKE-1CRATE-VERIFY ?auto_2856 ?auto_2857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2872 - SURFACE
      ?auto_2873 - SURFACE
      ?auto_2874 - SURFACE
    )
    :vars
    (
      ?auto_2880 - HOIST
      ?auto_2875 - PLACE
      ?auto_2886 - PLACE
      ?auto_2876 - HOIST
      ?auto_2887 - SURFACE
      ?auto_2878 - PLACE
      ?auto_2884 - HOIST
      ?auto_2877 - SURFACE
      ?auto_2879 - SURFACE
      ?auto_2881 - TRUCK
      ?auto_2882 - PLACE
      ?auto_2883 - HOIST
      ?auto_2885 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2880 ?auto_2875 ) ( IS-CRATE ?auto_2874 ) ( not ( = ?auto_2873 ?auto_2874 ) ) ( not ( = ?auto_2872 ?auto_2873 ) ) ( not ( = ?auto_2872 ?auto_2874 ) ) ( not ( = ?auto_2886 ?auto_2875 ) ) ( HOIST-AT ?auto_2876 ?auto_2886 ) ( not ( = ?auto_2880 ?auto_2876 ) ) ( AVAILABLE ?auto_2876 ) ( SURFACE-AT ?auto_2874 ?auto_2886 ) ( ON ?auto_2874 ?auto_2887 ) ( CLEAR ?auto_2874 ) ( not ( = ?auto_2873 ?auto_2887 ) ) ( not ( = ?auto_2874 ?auto_2887 ) ) ( not ( = ?auto_2872 ?auto_2887 ) ) ( IS-CRATE ?auto_2873 ) ( not ( = ?auto_2878 ?auto_2875 ) ) ( not ( = ?auto_2886 ?auto_2878 ) ) ( HOIST-AT ?auto_2884 ?auto_2878 ) ( not ( = ?auto_2880 ?auto_2884 ) ) ( not ( = ?auto_2876 ?auto_2884 ) ) ( AVAILABLE ?auto_2884 ) ( SURFACE-AT ?auto_2873 ?auto_2878 ) ( ON ?auto_2873 ?auto_2877 ) ( CLEAR ?auto_2873 ) ( not ( = ?auto_2873 ?auto_2877 ) ) ( not ( = ?auto_2874 ?auto_2877 ) ) ( not ( = ?auto_2872 ?auto_2877 ) ) ( not ( = ?auto_2887 ?auto_2877 ) ) ( SURFACE-AT ?auto_2879 ?auto_2875 ) ( CLEAR ?auto_2879 ) ( IS-CRATE ?auto_2872 ) ( not ( = ?auto_2879 ?auto_2872 ) ) ( not ( = ?auto_2873 ?auto_2879 ) ) ( not ( = ?auto_2874 ?auto_2879 ) ) ( not ( = ?auto_2887 ?auto_2879 ) ) ( not ( = ?auto_2877 ?auto_2879 ) ) ( AVAILABLE ?auto_2880 ) ( TRUCK-AT ?auto_2881 ?auto_2882 ) ( not ( = ?auto_2882 ?auto_2875 ) ) ( not ( = ?auto_2886 ?auto_2882 ) ) ( not ( = ?auto_2878 ?auto_2882 ) ) ( HOIST-AT ?auto_2883 ?auto_2882 ) ( not ( = ?auto_2880 ?auto_2883 ) ) ( not ( = ?auto_2876 ?auto_2883 ) ) ( not ( = ?auto_2884 ?auto_2883 ) ) ( AVAILABLE ?auto_2883 ) ( SURFACE-AT ?auto_2872 ?auto_2882 ) ( ON ?auto_2872 ?auto_2885 ) ( CLEAR ?auto_2872 ) ( not ( = ?auto_2873 ?auto_2885 ) ) ( not ( = ?auto_2874 ?auto_2885 ) ) ( not ( = ?auto_2872 ?auto_2885 ) ) ( not ( = ?auto_2887 ?auto_2885 ) ) ( not ( = ?auto_2877 ?auto_2885 ) ) ( not ( = ?auto_2879 ?auto_2885 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2873 ?auto_2874 )
      ( MAKE-2CRATE-VERIFY ?auto_2872 ?auto_2873 ?auto_2874 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2888 - SURFACE
      ?auto_2889 - SURFACE
      ?auto_2890 - SURFACE
      ?auto_2891 - SURFACE
    )
    :vars
    (
      ?auto_2902 - HOIST
      ?auto_2900 - PLACE
      ?auto_2893 - PLACE
      ?auto_2899 - HOIST
      ?auto_2895 - SURFACE
      ?auto_2901 - PLACE
      ?auto_2898 - HOIST
      ?auto_2894 - SURFACE
      ?auto_2903 - TRUCK
      ?auto_2896 - PLACE
      ?auto_2892 - HOIST
      ?auto_2897 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2902 ?auto_2900 ) ( IS-CRATE ?auto_2891 ) ( not ( = ?auto_2890 ?auto_2891 ) ) ( not ( = ?auto_2889 ?auto_2890 ) ) ( not ( = ?auto_2889 ?auto_2891 ) ) ( not ( = ?auto_2893 ?auto_2900 ) ) ( HOIST-AT ?auto_2899 ?auto_2893 ) ( not ( = ?auto_2902 ?auto_2899 ) ) ( AVAILABLE ?auto_2899 ) ( SURFACE-AT ?auto_2891 ?auto_2893 ) ( ON ?auto_2891 ?auto_2895 ) ( CLEAR ?auto_2891 ) ( not ( = ?auto_2890 ?auto_2895 ) ) ( not ( = ?auto_2891 ?auto_2895 ) ) ( not ( = ?auto_2889 ?auto_2895 ) ) ( IS-CRATE ?auto_2890 ) ( not ( = ?auto_2901 ?auto_2900 ) ) ( not ( = ?auto_2893 ?auto_2901 ) ) ( HOIST-AT ?auto_2898 ?auto_2901 ) ( not ( = ?auto_2902 ?auto_2898 ) ) ( not ( = ?auto_2899 ?auto_2898 ) ) ( AVAILABLE ?auto_2898 ) ( SURFACE-AT ?auto_2890 ?auto_2901 ) ( ON ?auto_2890 ?auto_2894 ) ( CLEAR ?auto_2890 ) ( not ( = ?auto_2890 ?auto_2894 ) ) ( not ( = ?auto_2891 ?auto_2894 ) ) ( not ( = ?auto_2889 ?auto_2894 ) ) ( not ( = ?auto_2895 ?auto_2894 ) ) ( SURFACE-AT ?auto_2888 ?auto_2900 ) ( CLEAR ?auto_2888 ) ( IS-CRATE ?auto_2889 ) ( not ( = ?auto_2888 ?auto_2889 ) ) ( not ( = ?auto_2890 ?auto_2888 ) ) ( not ( = ?auto_2891 ?auto_2888 ) ) ( not ( = ?auto_2895 ?auto_2888 ) ) ( not ( = ?auto_2894 ?auto_2888 ) ) ( AVAILABLE ?auto_2902 ) ( TRUCK-AT ?auto_2903 ?auto_2896 ) ( not ( = ?auto_2896 ?auto_2900 ) ) ( not ( = ?auto_2893 ?auto_2896 ) ) ( not ( = ?auto_2901 ?auto_2896 ) ) ( HOIST-AT ?auto_2892 ?auto_2896 ) ( not ( = ?auto_2902 ?auto_2892 ) ) ( not ( = ?auto_2899 ?auto_2892 ) ) ( not ( = ?auto_2898 ?auto_2892 ) ) ( AVAILABLE ?auto_2892 ) ( SURFACE-AT ?auto_2889 ?auto_2896 ) ( ON ?auto_2889 ?auto_2897 ) ( CLEAR ?auto_2889 ) ( not ( = ?auto_2890 ?auto_2897 ) ) ( not ( = ?auto_2891 ?auto_2897 ) ) ( not ( = ?auto_2889 ?auto_2897 ) ) ( not ( = ?auto_2895 ?auto_2897 ) ) ( not ( = ?auto_2894 ?auto_2897 ) ) ( not ( = ?auto_2888 ?auto_2897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2889 ?auto_2890 ?auto_2891 )
      ( MAKE-3CRATE-VERIFY ?auto_2888 ?auto_2889 ?auto_2890 ?auto_2891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2904 - SURFACE
      ?auto_2905 - SURFACE
    )
    :vars
    (
      ?auto_2917 - HOIST
      ?auto_2915 - PLACE
      ?auto_2919 - SURFACE
      ?auto_2907 - PLACE
      ?auto_2914 - HOIST
      ?auto_2909 - SURFACE
      ?auto_2916 - PLACE
      ?auto_2912 - HOIST
      ?auto_2908 - SURFACE
      ?auto_2913 - SURFACE
      ?auto_2910 - PLACE
      ?auto_2906 - HOIST
      ?auto_2911 - SURFACE
      ?auto_2918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2917 ?auto_2915 ) ( IS-CRATE ?auto_2905 ) ( not ( = ?auto_2904 ?auto_2905 ) ) ( not ( = ?auto_2919 ?auto_2904 ) ) ( not ( = ?auto_2919 ?auto_2905 ) ) ( not ( = ?auto_2907 ?auto_2915 ) ) ( HOIST-AT ?auto_2914 ?auto_2907 ) ( not ( = ?auto_2917 ?auto_2914 ) ) ( AVAILABLE ?auto_2914 ) ( SURFACE-AT ?auto_2905 ?auto_2907 ) ( ON ?auto_2905 ?auto_2909 ) ( CLEAR ?auto_2905 ) ( not ( = ?auto_2904 ?auto_2909 ) ) ( not ( = ?auto_2905 ?auto_2909 ) ) ( not ( = ?auto_2919 ?auto_2909 ) ) ( IS-CRATE ?auto_2904 ) ( not ( = ?auto_2916 ?auto_2915 ) ) ( not ( = ?auto_2907 ?auto_2916 ) ) ( HOIST-AT ?auto_2912 ?auto_2916 ) ( not ( = ?auto_2917 ?auto_2912 ) ) ( not ( = ?auto_2914 ?auto_2912 ) ) ( AVAILABLE ?auto_2912 ) ( SURFACE-AT ?auto_2904 ?auto_2916 ) ( ON ?auto_2904 ?auto_2908 ) ( CLEAR ?auto_2904 ) ( not ( = ?auto_2904 ?auto_2908 ) ) ( not ( = ?auto_2905 ?auto_2908 ) ) ( not ( = ?auto_2919 ?auto_2908 ) ) ( not ( = ?auto_2909 ?auto_2908 ) ) ( SURFACE-AT ?auto_2913 ?auto_2915 ) ( CLEAR ?auto_2913 ) ( IS-CRATE ?auto_2919 ) ( not ( = ?auto_2913 ?auto_2919 ) ) ( not ( = ?auto_2904 ?auto_2913 ) ) ( not ( = ?auto_2905 ?auto_2913 ) ) ( not ( = ?auto_2909 ?auto_2913 ) ) ( not ( = ?auto_2908 ?auto_2913 ) ) ( AVAILABLE ?auto_2917 ) ( not ( = ?auto_2910 ?auto_2915 ) ) ( not ( = ?auto_2907 ?auto_2910 ) ) ( not ( = ?auto_2916 ?auto_2910 ) ) ( HOIST-AT ?auto_2906 ?auto_2910 ) ( not ( = ?auto_2917 ?auto_2906 ) ) ( not ( = ?auto_2914 ?auto_2906 ) ) ( not ( = ?auto_2912 ?auto_2906 ) ) ( AVAILABLE ?auto_2906 ) ( SURFACE-AT ?auto_2919 ?auto_2910 ) ( ON ?auto_2919 ?auto_2911 ) ( CLEAR ?auto_2919 ) ( not ( = ?auto_2904 ?auto_2911 ) ) ( not ( = ?auto_2905 ?auto_2911 ) ) ( not ( = ?auto_2919 ?auto_2911 ) ) ( not ( = ?auto_2909 ?auto_2911 ) ) ( not ( = ?auto_2908 ?auto_2911 ) ) ( not ( = ?auto_2913 ?auto_2911 ) ) ( TRUCK-AT ?auto_2918 ?auto_2915 ) )
    :subtasks
    ( ( !DRIVE ?auto_2918 ?auto_2915 ?auto_2910 )
      ( MAKE-2CRATE ?auto_2919 ?auto_2904 ?auto_2905 )
      ( MAKE-1CRATE-VERIFY ?auto_2904 ?auto_2905 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2920 - SURFACE
      ?auto_2921 - SURFACE
      ?auto_2922 - SURFACE
    )
    :vars
    (
      ?auto_2933 - HOIST
      ?auto_2934 - PLACE
      ?auto_2929 - PLACE
      ?auto_2928 - HOIST
      ?auto_2925 - SURFACE
      ?auto_2932 - PLACE
      ?auto_2923 - HOIST
      ?auto_2927 - SURFACE
      ?auto_2926 - SURFACE
      ?auto_2924 - PLACE
      ?auto_2931 - HOIST
      ?auto_2930 - SURFACE
      ?auto_2935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2933 ?auto_2934 ) ( IS-CRATE ?auto_2922 ) ( not ( = ?auto_2921 ?auto_2922 ) ) ( not ( = ?auto_2920 ?auto_2921 ) ) ( not ( = ?auto_2920 ?auto_2922 ) ) ( not ( = ?auto_2929 ?auto_2934 ) ) ( HOIST-AT ?auto_2928 ?auto_2929 ) ( not ( = ?auto_2933 ?auto_2928 ) ) ( AVAILABLE ?auto_2928 ) ( SURFACE-AT ?auto_2922 ?auto_2929 ) ( ON ?auto_2922 ?auto_2925 ) ( CLEAR ?auto_2922 ) ( not ( = ?auto_2921 ?auto_2925 ) ) ( not ( = ?auto_2922 ?auto_2925 ) ) ( not ( = ?auto_2920 ?auto_2925 ) ) ( IS-CRATE ?auto_2921 ) ( not ( = ?auto_2932 ?auto_2934 ) ) ( not ( = ?auto_2929 ?auto_2932 ) ) ( HOIST-AT ?auto_2923 ?auto_2932 ) ( not ( = ?auto_2933 ?auto_2923 ) ) ( not ( = ?auto_2928 ?auto_2923 ) ) ( AVAILABLE ?auto_2923 ) ( SURFACE-AT ?auto_2921 ?auto_2932 ) ( ON ?auto_2921 ?auto_2927 ) ( CLEAR ?auto_2921 ) ( not ( = ?auto_2921 ?auto_2927 ) ) ( not ( = ?auto_2922 ?auto_2927 ) ) ( not ( = ?auto_2920 ?auto_2927 ) ) ( not ( = ?auto_2925 ?auto_2927 ) ) ( SURFACE-AT ?auto_2926 ?auto_2934 ) ( CLEAR ?auto_2926 ) ( IS-CRATE ?auto_2920 ) ( not ( = ?auto_2926 ?auto_2920 ) ) ( not ( = ?auto_2921 ?auto_2926 ) ) ( not ( = ?auto_2922 ?auto_2926 ) ) ( not ( = ?auto_2925 ?auto_2926 ) ) ( not ( = ?auto_2927 ?auto_2926 ) ) ( AVAILABLE ?auto_2933 ) ( not ( = ?auto_2924 ?auto_2934 ) ) ( not ( = ?auto_2929 ?auto_2924 ) ) ( not ( = ?auto_2932 ?auto_2924 ) ) ( HOIST-AT ?auto_2931 ?auto_2924 ) ( not ( = ?auto_2933 ?auto_2931 ) ) ( not ( = ?auto_2928 ?auto_2931 ) ) ( not ( = ?auto_2923 ?auto_2931 ) ) ( AVAILABLE ?auto_2931 ) ( SURFACE-AT ?auto_2920 ?auto_2924 ) ( ON ?auto_2920 ?auto_2930 ) ( CLEAR ?auto_2920 ) ( not ( = ?auto_2921 ?auto_2930 ) ) ( not ( = ?auto_2922 ?auto_2930 ) ) ( not ( = ?auto_2920 ?auto_2930 ) ) ( not ( = ?auto_2925 ?auto_2930 ) ) ( not ( = ?auto_2927 ?auto_2930 ) ) ( not ( = ?auto_2926 ?auto_2930 ) ) ( TRUCK-AT ?auto_2935 ?auto_2934 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2921 ?auto_2922 )
      ( MAKE-2CRATE-VERIFY ?auto_2920 ?auto_2921 ?auto_2922 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2936 - SURFACE
      ?auto_2937 - SURFACE
      ?auto_2938 - SURFACE
      ?auto_2939 - SURFACE
    )
    :vars
    (
      ?auto_2946 - HOIST
      ?auto_2940 - PLACE
      ?auto_2948 - PLACE
      ?auto_2941 - HOIST
      ?auto_2944 - SURFACE
      ?auto_2942 - PLACE
      ?auto_2947 - HOIST
      ?auto_2951 - SURFACE
      ?auto_2949 - PLACE
      ?auto_2945 - HOIST
      ?auto_2950 - SURFACE
      ?auto_2943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2946 ?auto_2940 ) ( IS-CRATE ?auto_2939 ) ( not ( = ?auto_2938 ?auto_2939 ) ) ( not ( = ?auto_2937 ?auto_2938 ) ) ( not ( = ?auto_2937 ?auto_2939 ) ) ( not ( = ?auto_2948 ?auto_2940 ) ) ( HOIST-AT ?auto_2941 ?auto_2948 ) ( not ( = ?auto_2946 ?auto_2941 ) ) ( AVAILABLE ?auto_2941 ) ( SURFACE-AT ?auto_2939 ?auto_2948 ) ( ON ?auto_2939 ?auto_2944 ) ( CLEAR ?auto_2939 ) ( not ( = ?auto_2938 ?auto_2944 ) ) ( not ( = ?auto_2939 ?auto_2944 ) ) ( not ( = ?auto_2937 ?auto_2944 ) ) ( IS-CRATE ?auto_2938 ) ( not ( = ?auto_2942 ?auto_2940 ) ) ( not ( = ?auto_2948 ?auto_2942 ) ) ( HOIST-AT ?auto_2947 ?auto_2942 ) ( not ( = ?auto_2946 ?auto_2947 ) ) ( not ( = ?auto_2941 ?auto_2947 ) ) ( AVAILABLE ?auto_2947 ) ( SURFACE-AT ?auto_2938 ?auto_2942 ) ( ON ?auto_2938 ?auto_2951 ) ( CLEAR ?auto_2938 ) ( not ( = ?auto_2938 ?auto_2951 ) ) ( not ( = ?auto_2939 ?auto_2951 ) ) ( not ( = ?auto_2937 ?auto_2951 ) ) ( not ( = ?auto_2944 ?auto_2951 ) ) ( SURFACE-AT ?auto_2936 ?auto_2940 ) ( CLEAR ?auto_2936 ) ( IS-CRATE ?auto_2937 ) ( not ( = ?auto_2936 ?auto_2937 ) ) ( not ( = ?auto_2938 ?auto_2936 ) ) ( not ( = ?auto_2939 ?auto_2936 ) ) ( not ( = ?auto_2944 ?auto_2936 ) ) ( not ( = ?auto_2951 ?auto_2936 ) ) ( AVAILABLE ?auto_2946 ) ( not ( = ?auto_2949 ?auto_2940 ) ) ( not ( = ?auto_2948 ?auto_2949 ) ) ( not ( = ?auto_2942 ?auto_2949 ) ) ( HOIST-AT ?auto_2945 ?auto_2949 ) ( not ( = ?auto_2946 ?auto_2945 ) ) ( not ( = ?auto_2941 ?auto_2945 ) ) ( not ( = ?auto_2947 ?auto_2945 ) ) ( AVAILABLE ?auto_2945 ) ( SURFACE-AT ?auto_2937 ?auto_2949 ) ( ON ?auto_2937 ?auto_2950 ) ( CLEAR ?auto_2937 ) ( not ( = ?auto_2938 ?auto_2950 ) ) ( not ( = ?auto_2939 ?auto_2950 ) ) ( not ( = ?auto_2937 ?auto_2950 ) ) ( not ( = ?auto_2944 ?auto_2950 ) ) ( not ( = ?auto_2951 ?auto_2950 ) ) ( not ( = ?auto_2936 ?auto_2950 ) ) ( TRUCK-AT ?auto_2943 ?auto_2940 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2937 ?auto_2938 ?auto_2939 )
      ( MAKE-3CRATE-VERIFY ?auto_2936 ?auto_2937 ?auto_2938 ?auto_2939 ) )
  )

)

