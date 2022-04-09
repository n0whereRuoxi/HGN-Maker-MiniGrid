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
      ?auto_2089 - SURFACE
      ?auto_2090 - SURFACE
    )
    :vars
    (
      ?auto_2091 - HOIST
      ?auto_2092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2091 ?auto_2092 ) ( SURFACE-AT ?auto_2089 ?auto_2092 ) ( CLEAR ?auto_2089 ) ( LIFTING ?auto_2091 ?auto_2090 ) ( IS-CRATE ?auto_2090 ) ( not ( = ?auto_2089 ?auto_2090 ) ) )
    :subtasks
    ( ( !DROP ?auto_2091 ?auto_2090 ?auto_2089 ?auto_2092 )
      ( MAKE-1CRATE-VERIFY ?auto_2089 ?auto_2090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2093 - SURFACE
      ?auto_2094 - SURFACE
    )
    :vars
    (
      ?auto_2095 - HOIST
      ?auto_2096 - PLACE
      ?auto_2097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2095 ?auto_2096 ) ( SURFACE-AT ?auto_2093 ?auto_2096 ) ( CLEAR ?auto_2093 ) ( IS-CRATE ?auto_2094 ) ( not ( = ?auto_2093 ?auto_2094 ) ) ( TRUCK-AT ?auto_2097 ?auto_2096 ) ( AVAILABLE ?auto_2095 ) ( IN ?auto_2094 ?auto_2097 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2095 ?auto_2094 ?auto_2097 ?auto_2096 )
      ( MAKE-1CRATE ?auto_2093 ?auto_2094 )
      ( MAKE-1CRATE-VERIFY ?auto_2093 ?auto_2094 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2098 - SURFACE
      ?auto_2099 - SURFACE
    )
    :vars
    (
      ?auto_2100 - HOIST
      ?auto_2102 - PLACE
      ?auto_2101 - TRUCK
      ?auto_2103 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2100 ?auto_2102 ) ( SURFACE-AT ?auto_2098 ?auto_2102 ) ( CLEAR ?auto_2098 ) ( IS-CRATE ?auto_2099 ) ( not ( = ?auto_2098 ?auto_2099 ) ) ( AVAILABLE ?auto_2100 ) ( IN ?auto_2099 ?auto_2101 ) ( TRUCK-AT ?auto_2101 ?auto_2103 ) ( not ( = ?auto_2103 ?auto_2102 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2101 ?auto_2103 ?auto_2102 )
      ( MAKE-1CRATE ?auto_2098 ?auto_2099 )
      ( MAKE-1CRATE-VERIFY ?auto_2098 ?auto_2099 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2104 - SURFACE
      ?auto_2105 - SURFACE
    )
    :vars
    (
      ?auto_2106 - HOIST
      ?auto_2108 - PLACE
      ?auto_2109 - TRUCK
      ?auto_2107 - PLACE
      ?auto_2110 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106 ?auto_2108 ) ( SURFACE-AT ?auto_2104 ?auto_2108 ) ( CLEAR ?auto_2104 ) ( IS-CRATE ?auto_2105 ) ( not ( = ?auto_2104 ?auto_2105 ) ) ( AVAILABLE ?auto_2106 ) ( TRUCK-AT ?auto_2109 ?auto_2107 ) ( not ( = ?auto_2107 ?auto_2108 ) ) ( HOIST-AT ?auto_2110 ?auto_2107 ) ( LIFTING ?auto_2110 ?auto_2105 ) ( not ( = ?auto_2106 ?auto_2110 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2110 ?auto_2105 ?auto_2109 ?auto_2107 )
      ( MAKE-1CRATE ?auto_2104 ?auto_2105 )
      ( MAKE-1CRATE-VERIFY ?auto_2104 ?auto_2105 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2111 - SURFACE
      ?auto_2112 - SURFACE
    )
    :vars
    (
      ?auto_2114 - HOIST
      ?auto_2115 - PLACE
      ?auto_2117 - TRUCK
      ?auto_2116 - PLACE
      ?auto_2113 - HOIST
      ?auto_2118 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2114 ?auto_2115 ) ( SURFACE-AT ?auto_2111 ?auto_2115 ) ( CLEAR ?auto_2111 ) ( IS-CRATE ?auto_2112 ) ( not ( = ?auto_2111 ?auto_2112 ) ) ( AVAILABLE ?auto_2114 ) ( TRUCK-AT ?auto_2117 ?auto_2116 ) ( not ( = ?auto_2116 ?auto_2115 ) ) ( HOIST-AT ?auto_2113 ?auto_2116 ) ( not ( = ?auto_2114 ?auto_2113 ) ) ( AVAILABLE ?auto_2113 ) ( SURFACE-AT ?auto_2112 ?auto_2116 ) ( ON ?auto_2112 ?auto_2118 ) ( CLEAR ?auto_2112 ) ( not ( = ?auto_2111 ?auto_2118 ) ) ( not ( = ?auto_2112 ?auto_2118 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2113 ?auto_2112 ?auto_2118 ?auto_2116 )
      ( MAKE-1CRATE ?auto_2111 ?auto_2112 )
      ( MAKE-1CRATE-VERIFY ?auto_2111 ?auto_2112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2119 - SURFACE
      ?auto_2120 - SURFACE
    )
    :vars
    (
      ?auto_2124 - HOIST
      ?auto_2121 - PLACE
      ?auto_2126 - PLACE
      ?auto_2125 - HOIST
      ?auto_2123 - SURFACE
      ?auto_2122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2124 ?auto_2121 ) ( SURFACE-AT ?auto_2119 ?auto_2121 ) ( CLEAR ?auto_2119 ) ( IS-CRATE ?auto_2120 ) ( not ( = ?auto_2119 ?auto_2120 ) ) ( AVAILABLE ?auto_2124 ) ( not ( = ?auto_2126 ?auto_2121 ) ) ( HOIST-AT ?auto_2125 ?auto_2126 ) ( not ( = ?auto_2124 ?auto_2125 ) ) ( AVAILABLE ?auto_2125 ) ( SURFACE-AT ?auto_2120 ?auto_2126 ) ( ON ?auto_2120 ?auto_2123 ) ( CLEAR ?auto_2120 ) ( not ( = ?auto_2119 ?auto_2123 ) ) ( not ( = ?auto_2120 ?auto_2123 ) ) ( TRUCK-AT ?auto_2122 ?auto_2121 ) )
    :subtasks
    ( ( !DRIVE ?auto_2122 ?auto_2121 ?auto_2126 )
      ( MAKE-1CRATE ?auto_2119 ?auto_2120 )
      ( MAKE-1CRATE-VERIFY ?auto_2119 ?auto_2120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2132 - SURFACE
      ?auto_2133 - SURFACE
    )
    :vars
    (
      ?auto_2134 - HOIST
      ?auto_2135 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2134 ?auto_2135 ) ( SURFACE-AT ?auto_2132 ?auto_2135 ) ( CLEAR ?auto_2132 ) ( LIFTING ?auto_2134 ?auto_2133 ) ( IS-CRATE ?auto_2133 ) ( not ( = ?auto_2132 ?auto_2133 ) ) )
    :subtasks
    ( ( !DROP ?auto_2134 ?auto_2133 ?auto_2132 ?auto_2135 )
      ( MAKE-1CRATE-VERIFY ?auto_2132 ?auto_2133 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2136 - SURFACE
      ?auto_2137 - SURFACE
      ?auto_2138 - SURFACE
    )
    :vars
    (
      ?auto_2139 - HOIST
      ?auto_2140 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2139 ?auto_2140 ) ( SURFACE-AT ?auto_2137 ?auto_2140 ) ( CLEAR ?auto_2137 ) ( LIFTING ?auto_2139 ?auto_2138 ) ( IS-CRATE ?auto_2138 ) ( not ( = ?auto_2137 ?auto_2138 ) ) ( ON ?auto_2137 ?auto_2136 ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2138 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2137 ?auto_2138 )
      ( MAKE-2CRATE-VERIFY ?auto_2136 ?auto_2137 ?auto_2138 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2141 - SURFACE
      ?auto_2142 - SURFACE
    )
    :vars
    (
      ?auto_2143 - HOIST
      ?auto_2144 - PLACE
      ?auto_2145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2143 ?auto_2144 ) ( SURFACE-AT ?auto_2141 ?auto_2144 ) ( CLEAR ?auto_2141 ) ( IS-CRATE ?auto_2142 ) ( not ( = ?auto_2141 ?auto_2142 ) ) ( TRUCK-AT ?auto_2145 ?auto_2144 ) ( AVAILABLE ?auto_2143 ) ( IN ?auto_2142 ?auto_2145 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2143 ?auto_2142 ?auto_2145 ?auto_2144 )
      ( MAKE-1CRATE ?auto_2141 ?auto_2142 )
      ( MAKE-1CRATE-VERIFY ?auto_2141 ?auto_2142 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2146 - SURFACE
      ?auto_2147 - SURFACE
      ?auto_2148 - SURFACE
    )
    :vars
    (
      ?auto_2149 - HOIST
      ?auto_2150 - PLACE
      ?auto_2151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2149 ?auto_2150 ) ( SURFACE-AT ?auto_2147 ?auto_2150 ) ( CLEAR ?auto_2147 ) ( IS-CRATE ?auto_2148 ) ( not ( = ?auto_2147 ?auto_2148 ) ) ( TRUCK-AT ?auto_2151 ?auto_2150 ) ( AVAILABLE ?auto_2149 ) ( IN ?auto_2148 ?auto_2151 ) ( ON ?auto_2147 ?auto_2146 ) ( not ( = ?auto_2146 ?auto_2147 ) ) ( not ( = ?auto_2146 ?auto_2148 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2147 ?auto_2148 )
      ( MAKE-2CRATE-VERIFY ?auto_2146 ?auto_2147 ?auto_2148 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2152 - SURFACE
      ?auto_2153 - SURFACE
    )
    :vars
    (
      ?auto_2156 - HOIST
      ?auto_2157 - PLACE
      ?auto_2155 - TRUCK
      ?auto_2154 - SURFACE
      ?auto_2158 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156 ?auto_2157 ) ( SURFACE-AT ?auto_2152 ?auto_2157 ) ( CLEAR ?auto_2152 ) ( IS-CRATE ?auto_2153 ) ( not ( = ?auto_2152 ?auto_2153 ) ) ( AVAILABLE ?auto_2156 ) ( IN ?auto_2153 ?auto_2155 ) ( ON ?auto_2152 ?auto_2154 ) ( not ( = ?auto_2154 ?auto_2152 ) ) ( not ( = ?auto_2154 ?auto_2153 ) ) ( TRUCK-AT ?auto_2155 ?auto_2158 ) ( not ( = ?auto_2158 ?auto_2157 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2155 ?auto_2158 ?auto_2157 )
      ( MAKE-2CRATE ?auto_2154 ?auto_2152 ?auto_2153 )
      ( MAKE-1CRATE-VERIFY ?auto_2152 ?auto_2153 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2159 - SURFACE
      ?auto_2160 - SURFACE
      ?auto_2161 - SURFACE
    )
    :vars
    (
      ?auto_2164 - HOIST
      ?auto_2165 - PLACE
      ?auto_2163 - TRUCK
      ?auto_2162 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2164 ?auto_2165 ) ( SURFACE-AT ?auto_2160 ?auto_2165 ) ( CLEAR ?auto_2160 ) ( IS-CRATE ?auto_2161 ) ( not ( = ?auto_2160 ?auto_2161 ) ) ( AVAILABLE ?auto_2164 ) ( IN ?auto_2161 ?auto_2163 ) ( ON ?auto_2160 ?auto_2159 ) ( not ( = ?auto_2159 ?auto_2160 ) ) ( not ( = ?auto_2159 ?auto_2161 ) ) ( TRUCK-AT ?auto_2163 ?auto_2162 ) ( not ( = ?auto_2162 ?auto_2165 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2160 ?auto_2161 )
      ( MAKE-2CRATE-VERIFY ?auto_2159 ?auto_2160 ?auto_2161 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2166 - SURFACE
      ?auto_2167 - SURFACE
    )
    :vars
    (
      ?auto_2170 - HOIST
      ?auto_2168 - PLACE
      ?auto_2172 - SURFACE
      ?auto_2171 - TRUCK
      ?auto_2169 - PLACE
      ?auto_2173 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2170 ?auto_2168 ) ( SURFACE-AT ?auto_2166 ?auto_2168 ) ( CLEAR ?auto_2166 ) ( IS-CRATE ?auto_2167 ) ( not ( = ?auto_2166 ?auto_2167 ) ) ( AVAILABLE ?auto_2170 ) ( ON ?auto_2166 ?auto_2172 ) ( not ( = ?auto_2172 ?auto_2166 ) ) ( not ( = ?auto_2172 ?auto_2167 ) ) ( TRUCK-AT ?auto_2171 ?auto_2169 ) ( not ( = ?auto_2169 ?auto_2168 ) ) ( HOIST-AT ?auto_2173 ?auto_2169 ) ( LIFTING ?auto_2173 ?auto_2167 ) ( not ( = ?auto_2170 ?auto_2173 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2173 ?auto_2167 ?auto_2171 ?auto_2169 )
      ( MAKE-2CRATE ?auto_2172 ?auto_2166 ?auto_2167 )
      ( MAKE-1CRATE-VERIFY ?auto_2166 ?auto_2167 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2174 - SURFACE
      ?auto_2175 - SURFACE
      ?auto_2176 - SURFACE
    )
    :vars
    (
      ?auto_2177 - HOIST
      ?auto_2179 - PLACE
      ?auto_2178 - TRUCK
      ?auto_2181 - PLACE
      ?auto_2180 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2177 ?auto_2179 ) ( SURFACE-AT ?auto_2175 ?auto_2179 ) ( CLEAR ?auto_2175 ) ( IS-CRATE ?auto_2176 ) ( not ( = ?auto_2175 ?auto_2176 ) ) ( AVAILABLE ?auto_2177 ) ( ON ?auto_2175 ?auto_2174 ) ( not ( = ?auto_2174 ?auto_2175 ) ) ( not ( = ?auto_2174 ?auto_2176 ) ) ( TRUCK-AT ?auto_2178 ?auto_2181 ) ( not ( = ?auto_2181 ?auto_2179 ) ) ( HOIST-AT ?auto_2180 ?auto_2181 ) ( LIFTING ?auto_2180 ?auto_2176 ) ( not ( = ?auto_2177 ?auto_2180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2175 ?auto_2176 )
      ( MAKE-2CRATE-VERIFY ?auto_2174 ?auto_2175 ?auto_2176 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2182 - SURFACE
      ?auto_2183 - SURFACE
    )
    :vars
    (
      ?auto_2187 - HOIST
      ?auto_2184 - PLACE
      ?auto_2189 - SURFACE
      ?auto_2186 - TRUCK
      ?auto_2185 - PLACE
      ?auto_2188 - HOIST
      ?auto_2190 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2187 ?auto_2184 ) ( SURFACE-AT ?auto_2182 ?auto_2184 ) ( CLEAR ?auto_2182 ) ( IS-CRATE ?auto_2183 ) ( not ( = ?auto_2182 ?auto_2183 ) ) ( AVAILABLE ?auto_2187 ) ( ON ?auto_2182 ?auto_2189 ) ( not ( = ?auto_2189 ?auto_2182 ) ) ( not ( = ?auto_2189 ?auto_2183 ) ) ( TRUCK-AT ?auto_2186 ?auto_2185 ) ( not ( = ?auto_2185 ?auto_2184 ) ) ( HOIST-AT ?auto_2188 ?auto_2185 ) ( not ( = ?auto_2187 ?auto_2188 ) ) ( AVAILABLE ?auto_2188 ) ( SURFACE-AT ?auto_2183 ?auto_2185 ) ( ON ?auto_2183 ?auto_2190 ) ( CLEAR ?auto_2183 ) ( not ( = ?auto_2182 ?auto_2190 ) ) ( not ( = ?auto_2183 ?auto_2190 ) ) ( not ( = ?auto_2189 ?auto_2190 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2188 ?auto_2183 ?auto_2190 ?auto_2185 )
      ( MAKE-2CRATE ?auto_2189 ?auto_2182 ?auto_2183 )
      ( MAKE-1CRATE-VERIFY ?auto_2182 ?auto_2183 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2191 - SURFACE
      ?auto_2192 - SURFACE
      ?auto_2193 - SURFACE
    )
    :vars
    (
      ?auto_2199 - HOIST
      ?auto_2196 - PLACE
      ?auto_2194 - TRUCK
      ?auto_2198 - PLACE
      ?auto_2195 - HOIST
      ?auto_2197 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2199 ?auto_2196 ) ( SURFACE-AT ?auto_2192 ?auto_2196 ) ( CLEAR ?auto_2192 ) ( IS-CRATE ?auto_2193 ) ( not ( = ?auto_2192 ?auto_2193 ) ) ( AVAILABLE ?auto_2199 ) ( ON ?auto_2192 ?auto_2191 ) ( not ( = ?auto_2191 ?auto_2192 ) ) ( not ( = ?auto_2191 ?auto_2193 ) ) ( TRUCK-AT ?auto_2194 ?auto_2198 ) ( not ( = ?auto_2198 ?auto_2196 ) ) ( HOIST-AT ?auto_2195 ?auto_2198 ) ( not ( = ?auto_2199 ?auto_2195 ) ) ( AVAILABLE ?auto_2195 ) ( SURFACE-AT ?auto_2193 ?auto_2198 ) ( ON ?auto_2193 ?auto_2197 ) ( CLEAR ?auto_2193 ) ( not ( = ?auto_2192 ?auto_2197 ) ) ( not ( = ?auto_2193 ?auto_2197 ) ) ( not ( = ?auto_2191 ?auto_2197 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2192 ?auto_2193 )
      ( MAKE-2CRATE-VERIFY ?auto_2191 ?auto_2192 ?auto_2193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2200 - SURFACE
      ?auto_2201 - SURFACE
    )
    :vars
    (
      ?auto_2202 - HOIST
      ?auto_2204 - PLACE
      ?auto_2205 - SURFACE
      ?auto_2207 - PLACE
      ?auto_2203 - HOIST
      ?auto_2208 - SURFACE
      ?auto_2206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2202 ?auto_2204 ) ( SURFACE-AT ?auto_2200 ?auto_2204 ) ( CLEAR ?auto_2200 ) ( IS-CRATE ?auto_2201 ) ( not ( = ?auto_2200 ?auto_2201 ) ) ( AVAILABLE ?auto_2202 ) ( ON ?auto_2200 ?auto_2205 ) ( not ( = ?auto_2205 ?auto_2200 ) ) ( not ( = ?auto_2205 ?auto_2201 ) ) ( not ( = ?auto_2207 ?auto_2204 ) ) ( HOIST-AT ?auto_2203 ?auto_2207 ) ( not ( = ?auto_2202 ?auto_2203 ) ) ( AVAILABLE ?auto_2203 ) ( SURFACE-AT ?auto_2201 ?auto_2207 ) ( ON ?auto_2201 ?auto_2208 ) ( CLEAR ?auto_2201 ) ( not ( = ?auto_2200 ?auto_2208 ) ) ( not ( = ?auto_2201 ?auto_2208 ) ) ( not ( = ?auto_2205 ?auto_2208 ) ) ( TRUCK-AT ?auto_2206 ?auto_2204 ) )
    :subtasks
    ( ( !DRIVE ?auto_2206 ?auto_2204 ?auto_2207 )
      ( MAKE-2CRATE ?auto_2205 ?auto_2200 ?auto_2201 )
      ( MAKE-1CRATE-VERIFY ?auto_2200 ?auto_2201 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2209 - SURFACE
      ?auto_2210 - SURFACE
      ?auto_2211 - SURFACE
    )
    :vars
    (
      ?auto_2216 - HOIST
      ?auto_2215 - PLACE
      ?auto_2214 - PLACE
      ?auto_2213 - HOIST
      ?auto_2212 - SURFACE
      ?auto_2217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2216 ?auto_2215 ) ( SURFACE-AT ?auto_2210 ?auto_2215 ) ( CLEAR ?auto_2210 ) ( IS-CRATE ?auto_2211 ) ( not ( = ?auto_2210 ?auto_2211 ) ) ( AVAILABLE ?auto_2216 ) ( ON ?auto_2210 ?auto_2209 ) ( not ( = ?auto_2209 ?auto_2210 ) ) ( not ( = ?auto_2209 ?auto_2211 ) ) ( not ( = ?auto_2214 ?auto_2215 ) ) ( HOIST-AT ?auto_2213 ?auto_2214 ) ( not ( = ?auto_2216 ?auto_2213 ) ) ( AVAILABLE ?auto_2213 ) ( SURFACE-AT ?auto_2211 ?auto_2214 ) ( ON ?auto_2211 ?auto_2212 ) ( CLEAR ?auto_2211 ) ( not ( = ?auto_2210 ?auto_2212 ) ) ( not ( = ?auto_2211 ?auto_2212 ) ) ( not ( = ?auto_2209 ?auto_2212 ) ) ( TRUCK-AT ?auto_2217 ?auto_2215 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2210 ?auto_2211 )
      ( MAKE-2CRATE-VERIFY ?auto_2209 ?auto_2210 ?auto_2211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2218 - SURFACE
      ?auto_2219 - SURFACE
    )
    :vars
    (
      ?auto_2223 - HOIST
      ?auto_2221 - PLACE
      ?auto_2225 - SURFACE
      ?auto_2224 - PLACE
      ?auto_2222 - HOIST
      ?auto_2220 - SURFACE
      ?auto_2226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2223 ?auto_2221 ) ( IS-CRATE ?auto_2219 ) ( not ( = ?auto_2218 ?auto_2219 ) ) ( not ( = ?auto_2225 ?auto_2218 ) ) ( not ( = ?auto_2225 ?auto_2219 ) ) ( not ( = ?auto_2224 ?auto_2221 ) ) ( HOIST-AT ?auto_2222 ?auto_2224 ) ( not ( = ?auto_2223 ?auto_2222 ) ) ( AVAILABLE ?auto_2222 ) ( SURFACE-AT ?auto_2219 ?auto_2224 ) ( ON ?auto_2219 ?auto_2220 ) ( CLEAR ?auto_2219 ) ( not ( = ?auto_2218 ?auto_2220 ) ) ( not ( = ?auto_2219 ?auto_2220 ) ) ( not ( = ?auto_2225 ?auto_2220 ) ) ( TRUCK-AT ?auto_2226 ?auto_2221 ) ( SURFACE-AT ?auto_2225 ?auto_2221 ) ( CLEAR ?auto_2225 ) ( LIFTING ?auto_2223 ?auto_2218 ) ( IS-CRATE ?auto_2218 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2225 ?auto_2218 )
      ( MAKE-2CRATE ?auto_2225 ?auto_2218 ?auto_2219 )
      ( MAKE-1CRATE-VERIFY ?auto_2218 ?auto_2219 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2227 - SURFACE
      ?auto_2228 - SURFACE
      ?auto_2229 - SURFACE
    )
    :vars
    (
      ?auto_2231 - HOIST
      ?auto_2235 - PLACE
      ?auto_2233 - PLACE
      ?auto_2232 - HOIST
      ?auto_2234 - SURFACE
      ?auto_2230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2231 ?auto_2235 ) ( IS-CRATE ?auto_2229 ) ( not ( = ?auto_2228 ?auto_2229 ) ) ( not ( = ?auto_2227 ?auto_2228 ) ) ( not ( = ?auto_2227 ?auto_2229 ) ) ( not ( = ?auto_2233 ?auto_2235 ) ) ( HOIST-AT ?auto_2232 ?auto_2233 ) ( not ( = ?auto_2231 ?auto_2232 ) ) ( AVAILABLE ?auto_2232 ) ( SURFACE-AT ?auto_2229 ?auto_2233 ) ( ON ?auto_2229 ?auto_2234 ) ( CLEAR ?auto_2229 ) ( not ( = ?auto_2228 ?auto_2234 ) ) ( not ( = ?auto_2229 ?auto_2234 ) ) ( not ( = ?auto_2227 ?auto_2234 ) ) ( TRUCK-AT ?auto_2230 ?auto_2235 ) ( SURFACE-AT ?auto_2227 ?auto_2235 ) ( CLEAR ?auto_2227 ) ( LIFTING ?auto_2231 ?auto_2228 ) ( IS-CRATE ?auto_2228 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2228 ?auto_2229 )
      ( MAKE-2CRATE-VERIFY ?auto_2227 ?auto_2228 ?auto_2229 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2236 - SURFACE
      ?auto_2237 - SURFACE
    )
    :vars
    (
      ?auto_2242 - HOIST
      ?auto_2240 - PLACE
      ?auto_2239 - SURFACE
      ?auto_2238 - PLACE
      ?auto_2243 - HOIST
      ?auto_2241 - SURFACE
      ?auto_2244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2242 ?auto_2240 ) ( IS-CRATE ?auto_2237 ) ( not ( = ?auto_2236 ?auto_2237 ) ) ( not ( = ?auto_2239 ?auto_2236 ) ) ( not ( = ?auto_2239 ?auto_2237 ) ) ( not ( = ?auto_2238 ?auto_2240 ) ) ( HOIST-AT ?auto_2243 ?auto_2238 ) ( not ( = ?auto_2242 ?auto_2243 ) ) ( AVAILABLE ?auto_2243 ) ( SURFACE-AT ?auto_2237 ?auto_2238 ) ( ON ?auto_2237 ?auto_2241 ) ( CLEAR ?auto_2237 ) ( not ( = ?auto_2236 ?auto_2241 ) ) ( not ( = ?auto_2237 ?auto_2241 ) ) ( not ( = ?auto_2239 ?auto_2241 ) ) ( TRUCK-AT ?auto_2244 ?auto_2240 ) ( SURFACE-AT ?auto_2239 ?auto_2240 ) ( CLEAR ?auto_2239 ) ( IS-CRATE ?auto_2236 ) ( AVAILABLE ?auto_2242 ) ( IN ?auto_2236 ?auto_2244 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2242 ?auto_2236 ?auto_2244 ?auto_2240 )
      ( MAKE-2CRATE ?auto_2239 ?auto_2236 ?auto_2237 )
      ( MAKE-1CRATE-VERIFY ?auto_2236 ?auto_2237 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2245 - SURFACE
      ?auto_2246 - SURFACE
      ?auto_2247 - SURFACE
    )
    :vars
    (
      ?auto_2250 - HOIST
      ?auto_2252 - PLACE
      ?auto_2249 - PLACE
      ?auto_2251 - HOIST
      ?auto_2248 - SURFACE
      ?auto_2253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2250 ?auto_2252 ) ( IS-CRATE ?auto_2247 ) ( not ( = ?auto_2246 ?auto_2247 ) ) ( not ( = ?auto_2245 ?auto_2246 ) ) ( not ( = ?auto_2245 ?auto_2247 ) ) ( not ( = ?auto_2249 ?auto_2252 ) ) ( HOIST-AT ?auto_2251 ?auto_2249 ) ( not ( = ?auto_2250 ?auto_2251 ) ) ( AVAILABLE ?auto_2251 ) ( SURFACE-AT ?auto_2247 ?auto_2249 ) ( ON ?auto_2247 ?auto_2248 ) ( CLEAR ?auto_2247 ) ( not ( = ?auto_2246 ?auto_2248 ) ) ( not ( = ?auto_2247 ?auto_2248 ) ) ( not ( = ?auto_2245 ?auto_2248 ) ) ( TRUCK-AT ?auto_2253 ?auto_2252 ) ( SURFACE-AT ?auto_2245 ?auto_2252 ) ( CLEAR ?auto_2245 ) ( IS-CRATE ?auto_2246 ) ( AVAILABLE ?auto_2250 ) ( IN ?auto_2246 ?auto_2253 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2246 ?auto_2247 )
      ( MAKE-2CRATE-VERIFY ?auto_2245 ?auto_2246 ?auto_2247 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2254 - SURFACE
      ?auto_2255 - SURFACE
    )
    :vars
    (
      ?auto_2257 - HOIST
      ?auto_2259 - PLACE
      ?auto_2262 - SURFACE
      ?auto_2258 - PLACE
      ?auto_2261 - HOIST
      ?auto_2260 - SURFACE
      ?auto_2256 - TRUCK
      ?auto_2263 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2257 ?auto_2259 ) ( IS-CRATE ?auto_2255 ) ( not ( = ?auto_2254 ?auto_2255 ) ) ( not ( = ?auto_2262 ?auto_2254 ) ) ( not ( = ?auto_2262 ?auto_2255 ) ) ( not ( = ?auto_2258 ?auto_2259 ) ) ( HOIST-AT ?auto_2261 ?auto_2258 ) ( not ( = ?auto_2257 ?auto_2261 ) ) ( AVAILABLE ?auto_2261 ) ( SURFACE-AT ?auto_2255 ?auto_2258 ) ( ON ?auto_2255 ?auto_2260 ) ( CLEAR ?auto_2255 ) ( not ( = ?auto_2254 ?auto_2260 ) ) ( not ( = ?auto_2255 ?auto_2260 ) ) ( not ( = ?auto_2262 ?auto_2260 ) ) ( SURFACE-AT ?auto_2262 ?auto_2259 ) ( CLEAR ?auto_2262 ) ( IS-CRATE ?auto_2254 ) ( AVAILABLE ?auto_2257 ) ( IN ?auto_2254 ?auto_2256 ) ( TRUCK-AT ?auto_2256 ?auto_2263 ) ( not ( = ?auto_2263 ?auto_2259 ) ) ( not ( = ?auto_2258 ?auto_2263 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2256 ?auto_2263 ?auto_2259 )
      ( MAKE-2CRATE ?auto_2262 ?auto_2254 ?auto_2255 )
      ( MAKE-1CRATE-VERIFY ?auto_2254 ?auto_2255 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2264 - SURFACE
      ?auto_2265 - SURFACE
      ?auto_2266 - SURFACE
    )
    :vars
    (
      ?auto_2268 - HOIST
      ?auto_2273 - PLACE
      ?auto_2272 - PLACE
      ?auto_2271 - HOIST
      ?auto_2267 - SURFACE
      ?auto_2269 - TRUCK
      ?auto_2270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2268 ?auto_2273 ) ( IS-CRATE ?auto_2266 ) ( not ( = ?auto_2265 ?auto_2266 ) ) ( not ( = ?auto_2264 ?auto_2265 ) ) ( not ( = ?auto_2264 ?auto_2266 ) ) ( not ( = ?auto_2272 ?auto_2273 ) ) ( HOIST-AT ?auto_2271 ?auto_2272 ) ( not ( = ?auto_2268 ?auto_2271 ) ) ( AVAILABLE ?auto_2271 ) ( SURFACE-AT ?auto_2266 ?auto_2272 ) ( ON ?auto_2266 ?auto_2267 ) ( CLEAR ?auto_2266 ) ( not ( = ?auto_2265 ?auto_2267 ) ) ( not ( = ?auto_2266 ?auto_2267 ) ) ( not ( = ?auto_2264 ?auto_2267 ) ) ( SURFACE-AT ?auto_2264 ?auto_2273 ) ( CLEAR ?auto_2264 ) ( IS-CRATE ?auto_2265 ) ( AVAILABLE ?auto_2268 ) ( IN ?auto_2265 ?auto_2269 ) ( TRUCK-AT ?auto_2269 ?auto_2270 ) ( not ( = ?auto_2270 ?auto_2273 ) ) ( not ( = ?auto_2272 ?auto_2270 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2265 ?auto_2266 )
      ( MAKE-2CRATE-VERIFY ?auto_2264 ?auto_2265 ?auto_2266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2274 - SURFACE
      ?auto_2275 - SURFACE
    )
    :vars
    (
      ?auto_2277 - HOIST
      ?auto_2282 - PLACE
      ?auto_2280 - SURFACE
      ?auto_2279 - PLACE
      ?auto_2283 - HOIST
      ?auto_2276 - SURFACE
      ?auto_2278 - TRUCK
      ?auto_2281 - PLACE
      ?auto_2284 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2277 ?auto_2282 ) ( IS-CRATE ?auto_2275 ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2280 ?auto_2274 ) ) ( not ( = ?auto_2280 ?auto_2275 ) ) ( not ( = ?auto_2279 ?auto_2282 ) ) ( HOIST-AT ?auto_2283 ?auto_2279 ) ( not ( = ?auto_2277 ?auto_2283 ) ) ( AVAILABLE ?auto_2283 ) ( SURFACE-AT ?auto_2275 ?auto_2279 ) ( ON ?auto_2275 ?auto_2276 ) ( CLEAR ?auto_2275 ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2280 ?auto_2276 ) ) ( SURFACE-AT ?auto_2280 ?auto_2282 ) ( CLEAR ?auto_2280 ) ( IS-CRATE ?auto_2274 ) ( AVAILABLE ?auto_2277 ) ( TRUCK-AT ?auto_2278 ?auto_2281 ) ( not ( = ?auto_2281 ?auto_2282 ) ) ( not ( = ?auto_2279 ?auto_2281 ) ) ( HOIST-AT ?auto_2284 ?auto_2281 ) ( LIFTING ?auto_2284 ?auto_2274 ) ( not ( = ?auto_2277 ?auto_2284 ) ) ( not ( = ?auto_2283 ?auto_2284 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2284 ?auto_2274 ?auto_2278 ?auto_2281 )
      ( MAKE-2CRATE ?auto_2280 ?auto_2274 ?auto_2275 )
      ( MAKE-1CRATE-VERIFY ?auto_2274 ?auto_2275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2285 - SURFACE
      ?auto_2286 - SURFACE
      ?auto_2287 - SURFACE
    )
    :vars
    (
      ?auto_2292 - HOIST
      ?auto_2293 - PLACE
      ?auto_2294 - PLACE
      ?auto_2289 - HOIST
      ?auto_2290 - SURFACE
      ?auto_2291 - TRUCK
      ?auto_2295 - PLACE
      ?auto_2288 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2292 ?auto_2293 ) ( IS-CRATE ?auto_2287 ) ( not ( = ?auto_2286 ?auto_2287 ) ) ( not ( = ?auto_2285 ?auto_2286 ) ) ( not ( = ?auto_2285 ?auto_2287 ) ) ( not ( = ?auto_2294 ?auto_2293 ) ) ( HOIST-AT ?auto_2289 ?auto_2294 ) ( not ( = ?auto_2292 ?auto_2289 ) ) ( AVAILABLE ?auto_2289 ) ( SURFACE-AT ?auto_2287 ?auto_2294 ) ( ON ?auto_2287 ?auto_2290 ) ( CLEAR ?auto_2287 ) ( not ( = ?auto_2286 ?auto_2290 ) ) ( not ( = ?auto_2287 ?auto_2290 ) ) ( not ( = ?auto_2285 ?auto_2290 ) ) ( SURFACE-AT ?auto_2285 ?auto_2293 ) ( CLEAR ?auto_2285 ) ( IS-CRATE ?auto_2286 ) ( AVAILABLE ?auto_2292 ) ( TRUCK-AT ?auto_2291 ?auto_2295 ) ( not ( = ?auto_2295 ?auto_2293 ) ) ( not ( = ?auto_2294 ?auto_2295 ) ) ( HOIST-AT ?auto_2288 ?auto_2295 ) ( LIFTING ?auto_2288 ?auto_2286 ) ( not ( = ?auto_2292 ?auto_2288 ) ) ( not ( = ?auto_2289 ?auto_2288 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2286 ?auto_2287 )
      ( MAKE-2CRATE-VERIFY ?auto_2285 ?auto_2286 ?auto_2287 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2296 - SURFACE
      ?auto_2297 - SURFACE
    )
    :vars
    (
      ?auto_2300 - HOIST
      ?auto_2298 - PLACE
      ?auto_2303 - SURFACE
      ?auto_2306 - PLACE
      ?auto_2304 - HOIST
      ?auto_2305 - SURFACE
      ?auto_2302 - TRUCK
      ?auto_2299 - PLACE
      ?auto_2301 - HOIST
      ?auto_2307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2300 ?auto_2298 ) ( IS-CRATE ?auto_2297 ) ( not ( = ?auto_2296 ?auto_2297 ) ) ( not ( = ?auto_2303 ?auto_2296 ) ) ( not ( = ?auto_2303 ?auto_2297 ) ) ( not ( = ?auto_2306 ?auto_2298 ) ) ( HOIST-AT ?auto_2304 ?auto_2306 ) ( not ( = ?auto_2300 ?auto_2304 ) ) ( AVAILABLE ?auto_2304 ) ( SURFACE-AT ?auto_2297 ?auto_2306 ) ( ON ?auto_2297 ?auto_2305 ) ( CLEAR ?auto_2297 ) ( not ( = ?auto_2296 ?auto_2305 ) ) ( not ( = ?auto_2297 ?auto_2305 ) ) ( not ( = ?auto_2303 ?auto_2305 ) ) ( SURFACE-AT ?auto_2303 ?auto_2298 ) ( CLEAR ?auto_2303 ) ( IS-CRATE ?auto_2296 ) ( AVAILABLE ?auto_2300 ) ( TRUCK-AT ?auto_2302 ?auto_2299 ) ( not ( = ?auto_2299 ?auto_2298 ) ) ( not ( = ?auto_2306 ?auto_2299 ) ) ( HOIST-AT ?auto_2301 ?auto_2299 ) ( not ( = ?auto_2300 ?auto_2301 ) ) ( not ( = ?auto_2304 ?auto_2301 ) ) ( AVAILABLE ?auto_2301 ) ( SURFACE-AT ?auto_2296 ?auto_2299 ) ( ON ?auto_2296 ?auto_2307 ) ( CLEAR ?auto_2296 ) ( not ( = ?auto_2296 ?auto_2307 ) ) ( not ( = ?auto_2297 ?auto_2307 ) ) ( not ( = ?auto_2303 ?auto_2307 ) ) ( not ( = ?auto_2305 ?auto_2307 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2301 ?auto_2296 ?auto_2307 ?auto_2299 )
      ( MAKE-2CRATE ?auto_2303 ?auto_2296 ?auto_2297 )
      ( MAKE-1CRATE-VERIFY ?auto_2296 ?auto_2297 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2308 - SURFACE
      ?auto_2309 - SURFACE
      ?auto_2310 - SURFACE
    )
    :vars
    (
      ?auto_2314 - HOIST
      ?auto_2313 - PLACE
      ?auto_2315 - PLACE
      ?auto_2319 - HOIST
      ?auto_2317 - SURFACE
      ?auto_2311 - TRUCK
      ?auto_2312 - PLACE
      ?auto_2318 - HOIST
      ?auto_2316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2314 ?auto_2313 ) ( IS-CRATE ?auto_2310 ) ( not ( = ?auto_2309 ?auto_2310 ) ) ( not ( = ?auto_2308 ?auto_2309 ) ) ( not ( = ?auto_2308 ?auto_2310 ) ) ( not ( = ?auto_2315 ?auto_2313 ) ) ( HOIST-AT ?auto_2319 ?auto_2315 ) ( not ( = ?auto_2314 ?auto_2319 ) ) ( AVAILABLE ?auto_2319 ) ( SURFACE-AT ?auto_2310 ?auto_2315 ) ( ON ?auto_2310 ?auto_2317 ) ( CLEAR ?auto_2310 ) ( not ( = ?auto_2309 ?auto_2317 ) ) ( not ( = ?auto_2310 ?auto_2317 ) ) ( not ( = ?auto_2308 ?auto_2317 ) ) ( SURFACE-AT ?auto_2308 ?auto_2313 ) ( CLEAR ?auto_2308 ) ( IS-CRATE ?auto_2309 ) ( AVAILABLE ?auto_2314 ) ( TRUCK-AT ?auto_2311 ?auto_2312 ) ( not ( = ?auto_2312 ?auto_2313 ) ) ( not ( = ?auto_2315 ?auto_2312 ) ) ( HOIST-AT ?auto_2318 ?auto_2312 ) ( not ( = ?auto_2314 ?auto_2318 ) ) ( not ( = ?auto_2319 ?auto_2318 ) ) ( AVAILABLE ?auto_2318 ) ( SURFACE-AT ?auto_2309 ?auto_2312 ) ( ON ?auto_2309 ?auto_2316 ) ( CLEAR ?auto_2309 ) ( not ( = ?auto_2309 ?auto_2316 ) ) ( not ( = ?auto_2310 ?auto_2316 ) ) ( not ( = ?auto_2308 ?auto_2316 ) ) ( not ( = ?auto_2317 ?auto_2316 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2309 ?auto_2310 )
      ( MAKE-2CRATE-VERIFY ?auto_2308 ?auto_2309 ?auto_2310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2320 - SURFACE
      ?auto_2321 - SURFACE
    )
    :vars
    (
      ?auto_2322 - HOIST
      ?auto_2331 - PLACE
      ?auto_2323 - SURFACE
      ?auto_2326 - PLACE
      ?auto_2325 - HOIST
      ?auto_2330 - SURFACE
      ?auto_2327 - PLACE
      ?auto_2328 - HOIST
      ?auto_2324 - SURFACE
      ?auto_2329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2322 ?auto_2331 ) ( IS-CRATE ?auto_2321 ) ( not ( = ?auto_2320 ?auto_2321 ) ) ( not ( = ?auto_2323 ?auto_2320 ) ) ( not ( = ?auto_2323 ?auto_2321 ) ) ( not ( = ?auto_2326 ?auto_2331 ) ) ( HOIST-AT ?auto_2325 ?auto_2326 ) ( not ( = ?auto_2322 ?auto_2325 ) ) ( AVAILABLE ?auto_2325 ) ( SURFACE-AT ?auto_2321 ?auto_2326 ) ( ON ?auto_2321 ?auto_2330 ) ( CLEAR ?auto_2321 ) ( not ( = ?auto_2320 ?auto_2330 ) ) ( not ( = ?auto_2321 ?auto_2330 ) ) ( not ( = ?auto_2323 ?auto_2330 ) ) ( SURFACE-AT ?auto_2323 ?auto_2331 ) ( CLEAR ?auto_2323 ) ( IS-CRATE ?auto_2320 ) ( AVAILABLE ?auto_2322 ) ( not ( = ?auto_2327 ?auto_2331 ) ) ( not ( = ?auto_2326 ?auto_2327 ) ) ( HOIST-AT ?auto_2328 ?auto_2327 ) ( not ( = ?auto_2322 ?auto_2328 ) ) ( not ( = ?auto_2325 ?auto_2328 ) ) ( AVAILABLE ?auto_2328 ) ( SURFACE-AT ?auto_2320 ?auto_2327 ) ( ON ?auto_2320 ?auto_2324 ) ( CLEAR ?auto_2320 ) ( not ( = ?auto_2320 ?auto_2324 ) ) ( not ( = ?auto_2321 ?auto_2324 ) ) ( not ( = ?auto_2323 ?auto_2324 ) ) ( not ( = ?auto_2330 ?auto_2324 ) ) ( TRUCK-AT ?auto_2329 ?auto_2331 ) )
    :subtasks
    ( ( !DRIVE ?auto_2329 ?auto_2331 ?auto_2327 )
      ( MAKE-2CRATE ?auto_2323 ?auto_2320 ?auto_2321 )
      ( MAKE-1CRATE-VERIFY ?auto_2320 ?auto_2321 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2332 - SURFACE
      ?auto_2333 - SURFACE
      ?auto_2334 - SURFACE
    )
    :vars
    (
      ?auto_2341 - HOIST
      ?auto_2337 - PLACE
      ?auto_2338 - PLACE
      ?auto_2342 - HOIST
      ?auto_2339 - SURFACE
      ?auto_2343 - PLACE
      ?auto_2336 - HOIST
      ?auto_2335 - SURFACE
      ?auto_2340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2341 ?auto_2337 ) ( IS-CRATE ?auto_2334 ) ( not ( = ?auto_2333 ?auto_2334 ) ) ( not ( = ?auto_2332 ?auto_2333 ) ) ( not ( = ?auto_2332 ?auto_2334 ) ) ( not ( = ?auto_2338 ?auto_2337 ) ) ( HOIST-AT ?auto_2342 ?auto_2338 ) ( not ( = ?auto_2341 ?auto_2342 ) ) ( AVAILABLE ?auto_2342 ) ( SURFACE-AT ?auto_2334 ?auto_2338 ) ( ON ?auto_2334 ?auto_2339 ) ( CLEAR ?auto_2334 ) ( not ( = ?auto_2333 ?auto_2339 ) ) ( not ( = ?auto_2334 ?auto_2339 ) ) ( not ( = ?auto_2332 ?auto_2339 ) ) ( SURFACE-AT ?auto_2332 ?auto_2337 ) ( CLEAR ?auto_2332 ) ( IS-CRATE ?auto_2333 ) ( AVAILABLE ?auto_2341 ) ( not ( = ?auto_2343 ?auto_2337 ) ) ( not ( = ?auto_2338 ?auto_2343 ) ) ( HOIST-AT ?auto_2336 ?auto_2343 ) ( not ( = ?auto_2341 ?auto_2336 ) ) ( not ( = ?auto_2342 ?auto_2336 ) ) ( AVAILABLE ?auto_2336 ) ( SURFACE-AT ?auto_2333 ?auto_2343 ) ( ON ?auto_2333 ?auto_2335 ) ( CLEAR ?auto_2333 ) ( not ( = ?auto_2333 ?auto_2335 ) ) ( not ( = ?auto_2334 ?auto_2335 ) ) ( not ( = ?auto_2332 ?auto_2335 ) ) ( not ( = ?auto_2339 ?auto_2335 ) ) ( TRUCK-AT ?auto_2340 ?auto_2337 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2333 ?auto_2334 )
      ( MAKE-2CRATE-VERIFY ?auto_2332 ?auto_2333 ?auto_2334 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2353 - SURFACE
      ?auto_2354 - SURFACE
    )
    :vars
    (
      ?auto_2355 - HOIST
      ?auto_2356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2355 ?auto_2356 ) ( SURFACE-AT ?auto_2353 ?auto_2356 ) ( CLEAR ?auto_2353 ) ( LIFTING ?auto_2355 ?auto_2354 ) ( IS-CRATE ?auto_2354 ) ( not ( = ?auto_2353 ?auto_2354 ) ) )
    :subtasks
    ( ( !DROP ?auto_2355 ?auto_2354 ?auto_2353 ?auto_2356 )
      ( MAKE-1CRATE-VERIFY ?auto_2353 ?auto_2354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2357 - SURFACE
      ?auto_2358 - SURFACE
      ?auto_2359 - SURFACE
    )
    :vars
    (
      ?auto_2360 - HOIST
      ?auto_2361 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2360 ?auto_2361 ) ( SURFACE-AT ?auto_2358 ?auto_2361 ) ( CLEAR ?auto_2358 ) ( LIFTING ?auto_2360 ?auto_2359 ) ( IS-CRATE ?auto_2359 ) ( not ( = ?auto_2358 ?auto_2359 ) ) ( ON ?auto_2358 ?auto_2357 ) ( not ( = ?auto_2357 ?auto_2358 ) ) ( not ( = ?auto_2357 ?auto_2359 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2358 ?auto_2359 )
      ( MAKE-2CRATE-VERIFY ?auto_2357 ?auto_2358 ?auto_2359 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2362 - SURFACE
      ?auto_2363 - SURFACE
      ?auto_2364 - SURFACE
      ?auto_2365 - SURFACE
    )
    :vars
    (
      ?auto_2366 - HOIST
      ?auto_2367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2366 ?auto_2367 ) ( SURFACE-AT ?auto_2364 ?auto_2367 ) ( CLEAR ?auto_2364 ) ( LIFTING ?auto_2366 ?auto_2365 ) ( IS-CRATE ?auto_2365 ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( ON ?auto_2363 ?auto_2362 ) ( ON ?auto_2364 ?auto_2363 ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2364 ) ) ( not ( = ?auto_2362 ?auto_2365 ) ) ( not ( = ?auto_2363 ?auto_2364 ) ) ( not ( = ?auto_2363 ?auto_2365 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2364 ?auto_2365 )
      ( MAKE-3CRATE-VERIFY ?auto_2362 ?auto_2363 ?auto_2364 ?auto_2365 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2368 - SURFACE
      ?auto_2369 - SURFACE
    )
    :vars
    (
      ?auto_2370 - HOIST
      ?auto_2371 - PLACE
      ?auto_2372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2370 ?auto_2371 ) ( SURFACE-AT ?auto_2368 ?auto_2371 ) ( CLEAR ?auto_2368 ) ( IS-CRATE ?auto_2369 ) ( not ( = ?auto_2368 ?auto_2369 ) ) ( TRUCK-AT ?auto_2372 ?auto_2371 ) ( AVAILABLE ?auto_2370 ) ( IN ?auto_2369 ?auto_2372 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2370 ?auto_2369 ?auto_2372 ?auto_2371 )
      ( MAKE-1CRATE ?auto_2368 ?auto_2369 )
      ( MAKE-1CRATE-VERIFY ?auto_2368 ?auto_2369 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2373 - SURFACE
      ?auto_2374 - SURFACE
      ?auto_2375 - SURFACE
    )
    :vars
    (
      ?auto_2377 - HOIST
      ?auto_2378 - PLACE
      ?auto_2376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2377 ?auto_2378 ) ( SURFACE-AT ?auto_2374 ?auto_2378 ) ( CLEAR ?auto_2374 ) ( IS-CRATE ?auto_2375 ) ( not ( = ?auto_2374 ?auto_2375 ) ) ( TRUCK-AT ?auto_2376 ?auto_2378 ) ( AVAILABLE ?auto_2377 ) ( IN ?auto_2375 ?auto_2376 ) ( ON ?auto_2374 ?auto_2373 ) ( not ( = ?auto_2373 ?auto_2374 ) ) ( not ( = ?auto_2373 ?auto_2375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2374 ?auto_2375 )
      ( MAKE-2CRATE-VERIFY ?auto_2373 ?auto_2374 ?auto_2375 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2379 - SURFACE
      ?auto_2380 - SURFACE
      ?auto_2381 - SURFACE
      ?auto_2382 - SURFACE
    )
    :vars
    (
      ?auto_2383 - HOIST
      ?auto_2384 - PLACE
      ?auto_2385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2383 ?auto_2384 ) ( SURFACE-AT ?auto_2381 ?auto_2384 ) ( CLEAR ?auto_2381 ) ( IS-CRATE ?auto_2382 ) ( not ( = ?auto_2381 ?auto_2382 ) ) ( TRUCK-AT ?auto_2385 ?auto_2384 ) ( AVAILABLE ?auto_2383 ) ( IN ?auto_2382 ?auto_2385 ) ( ON ?auto_2381 ?auto_2380 ) ( not ( = ?auto_2380 ?auto_2381 ) ) ( not ( = ?auto_2380 ?auto_2382 ) ) ( ON ?auto_2380 ?auto_2379 ) ( not ( = ?auto_2379 ?auto_2380 ) ) ( not ( = ?auto_2379 ?auto_2381 ) ) ( not ( = ?auto_2379 ?auto_2382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2380 ?auto_2381 ?auto_2382 )
      ( MAKE-3CRATE-VERIFY ?auto_2379 ?auto_2380 ?auto_2381 ?auto_2382 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2386 - SURFACE
      ?auto_2387 - SURFACE
    )
    :vars
    (
      ?auto_2389 - HOIST
      ?auto_2390 - PLACE
      ?auto_2391 - TRUCK
      ?auto_2388 - SURFACE
      ?auto_2392 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2389 ?auto_2390 ) ( SURFACE-AT ?auto_2386 ?auto_2390 ) ( CLEAR ?auto_2386 ) ( IS-CRATE ?auto_2387 ) ( not ( = ?auto_2386 ?auto_2387 ) ) ( AVAILABLE ?auto_2389 ) ( IN ?auto_2387 ?auto_2391 ) ( ON ?auto_2386 ?auto_2388 ) ( not ( = ?auto_2388 ?auto_2386 ) ) ( not ( = ?auto_2388 ?auto_2387 ) ) ( TRUCK-AT ?auto_2391 ?auto_2392 ) ( not ( = ?auto_2392 ?auto_2390 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2391 ?auto_2392 ?auto_2390 )
      ( MAKE-2CRATE ?auto_2388 ?auto_2386 ?auto_2387 )
      ( MAKE-1CRATE-VERIFY ?auto_2386 ?auto_2387 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2393 - SURFACE
      ?auto_2394 - SURFACE
      ?auto_2395 - SURFACE
    )
    :vars
    (
      ?auto_2399 - HOIST
      ?auto_2396 - PLACE
      ?auto_2397 - TRUCK
      ?auto_2398 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399 ?auto_2396 ) ( SURFACE-AT ?auto_2394 ?auto_2396 ) ( CLEAR ?auto_2394 ) ( IS-CRATE ?auto_2395 ) ( not ( = ?auto_2394 ?auto_2395 ) ) ( AVAILABLE ?auto_2399 ) ( IN ?auto_2395 ?auto_2397 ) ( ON ?auto_2394 ?auto_2393 ) ( not ( = ?auto_2393 ?auto_2394 ) ) ( not ( = ?auto_2393 ?auto_2395 ) ) ( TRUCK-AT ?auto_2397 ?auto_2398 ) ( not ( = ?auto_2398 ?auto_2396 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2394 ?auto_2395 )
      ( MAKE-2CRATE-VERIFY ?auto_2393 ?auto_2394 ?auto_2395 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2400 - SURFACE
      ?auto_2401 - SURFACE
      ?auto_2402 - SURFACE
      ?auto_2403 - SURFACE
    )
    :vars
    (
      ?auto_2405 - HOIST
      ?auto_2406 - PLACE
      ?auto_2404 - TRUCK
      ?auto_2407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2405 ?auto_2406 ) ( SURFACE-AT ?auto_2402 ?auto_2406 ) ( CLEAR ?auto_2402 ) ( IS-CRATE ?auto_2403 ) ( not ( = ?auto_2402 ?auto_2403 ) ) ( AVAILABLE ?auto_2405 ) ( IN ?auto_2403 ?auto_2404 ) ( ON ?auto_2402 ?auto_2401 ) ( not ( = ?auto_2401 ?auto_2402 ) ) ( not ( = ?auto_2401 ?auto_2403 ) ) ( TRUCK-AT ?auto_2404 ?auto_2407 ) ( not ( = ?auto_2407 ?auto_2406 ) ) ( ON ?auto_2401 ?auto_2400 ) ( not ( = ?auto_2400 ?auto_2401 ) ) ( not ( = ?auto_2400 ?auto_2402 ) ) ( not ( = ?auto_2400 ?auto_2403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2401 ?auto_2402 ?auto_2403 )
      ( MAKE-3CRATE-VERIFY ?auto_2400 ?auto_2401 ?auto_2402 ?auto_2403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2408 - SURFACE
      ?auto_2409 - SURFACE
    )
    :vars
    (
      ?auto_2412 - HOIST
      ?auto_2413 - PLACE
      ?auto_2411 - SURFACE
      ?auto_2410 - TRUCK
      ?auto_2414 - PLACE
      ?auto_2415 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412 ?auto_2413 ) ( SURFACE-AT ?auto_2408 ?auto_2413 ) ( CLEAR ?auto_2408 ) ( IS-CRATE ?auto_2409 ) ( not ( = ?auto_2408 ?auto_2409 ) ) ( AVAILABLE ?auto_2412 ) ( ON ?auto_2408 ?auto_2411 ) ( not ( = ?auto_2411 ?auto_2408 ) ) ( not ( = ?auto_2411 ?auto_2409 ) ) ( TRUCK-AT ?auto_2410 ?auto_2414 ) ( not ( = ?auto_2414 ?auto_2413 ) ) ( HOIST-AT ?auto_2415 ?auto_2414 ) ( LIFTING ?auto_2415 ?auto_2409 ) ( not ( = ?auto_2412 ?auto_2415 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2415 ?auto_2409 ?auto_2410 ?auto_2414 )
      ( MAKE-2CRATE ?auto_2411 ?auto_2408 ?auto_2409 )
      ( MAKE-1CRATE-VERIFY ?auto_2408 ?auto_2409 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2416 - SURFACE
      ?auto_2417 - SURFACE
      ?auto_2418 - SURFACE
    )
    :vars
    (
      ?auto_2420 - HOIST
      ?auto_2419 - PLACE
      ?auto_2421 - TRUCK
      ?auto_2423 - PLACE
      ?auto_2422 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420 ?auto_2419 ) ( SURFACE-AT ?auto_2417 ?auto_2419 ) ( CLEAR ?auto_2417 ) ( IS-CRATE ?auto_2418 ) ( not ( = ?auto_2417 ?auto_2418 ) ) ( AVAILABLE ?auto_2420 ) ( ON ?auto_2417 ?auto_2416 ) ( not ( = ?auto_2416 ?auto_2417 ) ) ( not ( = ?auto_2416 ?auto_2418 ) ) ( TRUCK-AT ?auto_2421 ?auto_2423 ) ( not ( = ?auto_2423 ?auto_2419 ) ) ( HOIST-AT ?auto_2422 ?auto_2423 ) ( LIFTING ?auto_2422 ?auto_2418 ) ( not ( = ?auto_2420 ?auto_2422 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2417 ?auto_2418 )
      ( MAKE-2CRATE-VERIFY ?auto_2416 ?auto_2417 ?auto_2418 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2424 - SURFACE
      ?auto_2425 - SURFACE
      ?auto_2426 - SURFACE
      ?auto_2427 - SURFACE
    )
    :vars
    (
      ?auto_2431 - HOIST
      ?auto_2432 - PLACE
      ?auto_2430 - TRUCK
      ?auto_2429 - PLACE
      ?auto_2428 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431 ?auto_2432 ) ( SURFACE-AT ?auto_2426 ?auto_2432 ) ( CLEAR ?auto_2426 ) ( IS-CRATE ?auto_2427 ) ( not ( = ?auto_2426 ?auto_2427 ) ) ( AVAILABLE ?auto_2431 ) ( ON ?auto_2426 ?auto_2425 ) ( not ( = ?auto_2425 ?auto_2426 ) ) ( not ( = ?auto_2425 ?auto_2427 ) ) ( TRUCK-AT ?auto_2430 ?auto_2429 ) ( not ( = ?auto_2429 ?auto_2432 ) ) ( HOIST-AT ?auto_2428 ?auto_2429 ) ( LIFTING ?auto_2428 ?auto_2427 ) ( not ( = ?auto_2431 ?auto_2428 ) ) ( ON ?auto_2425 ?auto_2424 ) ( not ( = ?auto_2424 ?auto_2425 ) ) ( not ( = ?auto_2424 ?auto_2426 ) ) ( not ( = ?auto_2424 ?auto_2427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2425 ?auto_2426 ?auto_2427 )
      ( MAKE-3CRATE-VERIFY ?auto_2424 ?auto_2425 ?auto_2426 ?auto_2427 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2433 - SURFACE
      ?auto_2434 - SURFACE
    )
    :vars
    (
      ?auto_2439 - HOIST
      ?auto_2440 - PLACE
      ?auto_2438 - SURFACE
      ?auto_2437 - TRUCK
      ?auto_2436 - PLACE
      ?auto_2435 - HOIST
      ?auto_2441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2439 ?auto_2440 ) ( SURFACE-AT ?auto_2433 ?auto_2440 ) ( CLEAR ?auto_2433 ) ( IS-CRATE ?auto_2434 ) ( not ( = ?auto_2433 ?auto_2434 ) ) ( AVAILABLE ?auto_2439 ) ( ON ?auto_2433 ?auto_2438 ) ( not ( = ?auto_2438 ?auto_2433 ) ) ( not ( = ?auto_2438 ?auto_2434 ) ) ( TRUCK-AT ?auto_2437 ?auto_2436 ) ( not ( = ?auto_2436 ?auto_2440 ) ) ( HOIST-AT ?auto_2435 ?auto_2436 ) ( not ( = ?auto_2439 ?auto_2435 ) ) ( AVAILABLE ?auto_2435 ) ( SURFACE-AT ?auto_2434 ?auto_2436 ) ( ON ?auto_2434 ?auto_2441 ) ( CLEAR ?auto_2434 ) ( not ( = ?auto_2433 ?auto_2441 ) ) ( not ( = ?auto_2434 ?auto_2441 ) ) ( not ( = ?auto_2438 ?auto_2441 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2435 ?auto_2434 ?auto_2441 ?auto_2436 )
      ( MAKE-2CRATE ?auto_2438 ?auto_2433 ?auto_2434 )
      ( MAKE-1CRATE-VERIFY ?auto_2433 ?auto_2434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2442 - SURFACE
      ?auto_2443 - SURFACE
      ?auto_2444 - SURFACE
    )
    :vars
    (
      ?auto_2448 - HOIST
      ?auto_2449 - PLACE
      ?auto_2445 - TRUCK
      ?auto_2446 - PLACE
      ?auto_2450 - HOIST
      ?auto_2447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2448 ?auto_2449 ) ( SURFACE-AT ?auto_2443 ?auto_2449 ) ( CLEAR ?auto_2443 ) ( IS-CRATE ?auto_2444 ) ( not ( = ?auto_2443 ?auto_2444 ) ) ( AVAILABLE ?auto_2448 ) ( ON ?auto_2443 ?auto_2442 ) ( not ( = ?auto_2442 ?auto_2443 ) ) ( not ( = ?auto_2442 ?auto_2444 ) ) ( TRUCK-AT ?auto_2445 ?auto_2446 ) ( not ( = ?auto_2446 ?auto_2449 ) ) ( HOIST-AT ?auto_2450 ?auto_2446 ) ( not ( = ?auto_2448 ?auto_2450 ) ) ( AVAILABLE ?auto_2450 ) ( SURFACE-AT ?auto_2444 ?auto_2446 ) ( ON ?auto_2444 ?auto_2447 ) ( CLEAR ?auto_2444 ) ( not ( = ?auto_2443 ?auto_2447 ) ) ( not ( = ?auto_2444 ?auto_2447 ) ) ( not ( = ?auto_2442 ?auto_2447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2443 ?auto_2444 )
      ( MAKE-2CRATE-VERIFY ?auto_2442 ?auto_2443 ?auto_2444 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2451 - SURFACE
      ?auto_2452 - SURFACE
      ?auto_2453 - SURFACE
      ?auto_2454 - SURFACE
    )
    :vars
    (
      ?auto_2460 - HOIST
      ?auto_2457 - PLACE
      ?auto_2456 - TRUCK
      ?auto_2458 - PLACE
      ?auto_2459 - HOIST
      ?auto_2455 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2460 ?auto_2457 ) ( SURFACE-AT ?auto_2453 ?auto_2457 ) ( CLEAR ?auto_2453 ) ( IS-CRATE ?auto_2454 ) ( not ( = ?auto_2453 ?auto_2454 ) ) ( AVAILABLE ?auto_2460 ) ( ON ?auto_2453 ?auto_2452 ) ( not ( = ?auto_2452 ?auto_2453 ) ) ( not ( = ?auto_2452 ?auto_2454 ) ) ( TRUCK-AT ?auto_2456 ?auto_2458 ) ( not ( = ?auto_2458 ?auto_2457 ) ) ( HOIST-AT ?auto_2459 ?auto_2458 ) ( not ( = ?auto_2460 ?auto_2459 ) ) ( AVAILABLE ?auto_2459 ) ( SURFACE-AT ?auto_2454 ?auto_2458 ) ( ON ?auto_2454 ?auto_2455 ) ( CLEAR ?auto_2454 ) ( not ( = ?auto_2453 ?auto_2455 ) ) ( not ( = ?auto_2454 ?auto_2455 ) ) ( not ( = ?auto_2452 ?auto_2455 ) ) ( ON ?auto_2452 ?auto_2451 ) ( not ( = ?auto_2451 ?auto_2452 ) ) ( not ( = ?auto_2451 ?auto_2453 ) ) ( not ( = ?auto_2451 ?auto_2454 ) ) ( not ( = ?auto_2451 ?auto_2455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2452 ?auto_2453 ?auto_2454 )
      ( MAKE-3CRATE-VERIFY ?auto_2451 ?auto_2452 ?auto_2453 ?auto_2454 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2461 - SURFACE
      ?auto_2462 - SURFACE
    )
    :vars
    (
      ?auto_2469 - HOIST
      ?auto_2466 - PLACE
      ?auto_2463 - SURFACE
      ?auto_2467 - PLACE
      ?auto_2468 - HOIST
      ?auto_2464 - SURFACE
      ?auto_2465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2469 ?auto_2466 ) ( SURFACE-AT ?auto_2461 ?auto_2466 ) ( CLEAR ?auto_2461 ) ( IS-CRATE ?auto_2462 ) ( not ( = ?auto_2461 ?auto_2462 ) ) ( AVAILABLE ?auto_2469 ) ( ON ?auto_2461 ?auto_2463 ) ( not ( = ?auto_2463 ?auto_2461 ) ) ( not ( = ?auto_2463 ?auto_2462 ) ) ( not ( = ?auto_2467 ?auto_2466 ) ) ( HOIST-AT ?auto_2468 ?auto_2467 ) ( not ( = ?auto_2469 ?auto_2468 ) ) ( AVAILABLE ?auto_2468 ) ( SURFACE-AT ?auto_2462 ?auto_2467 ) ( ON ?auto_2462 ?auto_2464 ) ( CLEAR ?auto_2462 ) ( not ( = ?auto_2461 ?auto_2464 ) ) ( not ( = ?auto_2462 ?auto_2464 ) ) ( not ( = ?auto_2463 ?auto_2464 ) ) ( TRUCK-AT ?auto_2465 ?auto_2466 ) )
    :subtasks
    ( ( !DRIVE ?auto_2465 ?auto_2466 ?auto_2467 )
      ( MAKE-2CRATE ?auto_2463 ?auto_2461 ?auto_2462 )
      ( MAKE-1CRATE-VERIFY ?auto_2461 ?auto_2462 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2470 - SURFACE
      ?auto_2471 - SURFACE
      ?auto_2472 - SURFACE
    )
    :vars
    (
      ?auto_2478 - HOIST
      ?auto_2475 - PLACE
      ?auto_2476 - PLACE
      ?auto_2474 - HOIST
      ?auto_2477 - SURFACE
      ?auto_2473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2478 ?auto_2475 ) ( SURFACE-AT ?auto_2471 ?auto_2475 ) ( CLEAR ?auto_2471 ) ( IS-CRATE ?auto_2472 ) ( not ( = ?auto_2471 ?auto_2472 ) ) ( AVAILABLE ?auto_2478 ) ( ON ?auto_2471 ?auto_2470 ) ( not ( = ?auto_2470 ?auto_2471 ) ) ( not ( = ?auto_2470 ?auto_2472 ) ) ( not ( = ?auto_2476 ?auto_2475 ) ) ( HOIST-AT ?auto_2474 ?auto_2476 ) ( not ( = ?auto_2478 ?auto_2474 ) ) ( AVAILABLE ?auto_2474 ) ( SURFACE-AT ?auto_2472 ?auto_2476 ) ( ON ?auto_2472 ?auto_2477 ) ( CLEAR ?auto_2472 ) ( not ( = ?auto_2471 ?auto_2477 ) ) ( not ( = ?auto_2472 ?auto_2477 ) ) ( not ( = ?auto_2470 ?auto_2477 ) ) ( TRUCK-AT ?auto_2473 ?auto_2475 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2471 ?auto_2472 )
      ( MAKE-2CRATE-VERIFY ?auto_2470 ?auto_2471 ?auto_2472 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2479 - SURFACE
      ?auto_2480 - SURFACE
      ?auto_2481 - SURFACE
      ?auto_2482 - SURFACE
    )
    :vars
    (
      ?auto_2488 - HOIST
      ?auto_2485 - PLACE
      ?auto_2487 - PLACE
      ?auto_2484 - HOIST
      ?auto_2483 - SURFACE
      ?auto_2486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2488 ?auto_2485 ) ( SURFACE-AT ?auto_2481 ?auto_2485 ) ( CLEAR ?auto_2481 ) ( IS-CRATE ?auto_2482 ) ( not ( = ?auto_2481 ?auto_2482 ) ) ( AVAILABLE ?auto_2488 ) ( ON ?auto_2481 ?auto_2480 ) ( not ( = ?auto_2480 ?auto_2481 ) ) ( not ( = ?auto_2480 ?auto_2482 ) ) ( not ( = ?auto_2487 ?auto_2485 ) ) ( HOIST-AT ?auto_2484 ?auto_2487 ) ( not ( = ?auto_2488 ?auto_2484 ) ) ( AVAILABLE ?auto_2484 ) ( SURFACE-AT ?auto_2482 ?auto_2487 ) ( ON ?auto_2482 ?auto_2483 ) ( CLEAR ?auto_2482 ) ( not ( = ?auto_2481 ?auto_2483 ) ) ( not ( = ?auto_2482 ?auto_2483 ) ) ( not ( = ?auto_2480 ?auto_2483 ) ) ( TRUCK-AT ?auto_2486 ?auto_2485 ) ( ON ?auto_2480 ?auto_2479 ) ( not ( = ?auto_2479 ?auto_2480 ) ) ( not ( = ?auto_2479 ?auto_2481 ) ) ( not ( = ?auto_2479 ?auto_2482 ) ) ( not ( = ?auto_2479 ?auto_2483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2480 ?auto_2481 ?auto_2482 )
      ( MAKE-3CRATE-VERIFY ?auto_2479 ?auto_2480 ?auto_2481 ?auto_2482 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2489 - SURFACE
      ?auto_2490 - SURFACE
    )
    :vars
    (
      ?auto_2496 - HOIST
      ?auto_2493 - PLACE
      ?auto_2497 - SURFACE
      ?auto_2495 - PLACE
      ?auto_2492 - HOIST
      ?auto_2491 - SURFACE
      ?auto_2494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2496 ?auto_2493 ) ( IS-CRATE ?auto_2490 ) ( not ( = ?auto_2489 ?auto_2490 ) ) ( not ( = ?auto_2497 ?auto_2489 ) ) ( not ( = ?auto_2497 ?auto_2490 ) ) ( not ( = ?auto_2495 ?auto_2493 ) ) ( HOIST-AT ?auto_2492 ?auto_2495 ) ( not ( = ?auto_2496 ?auto_2492 ) ) ( AVAILABLE ?auto_2492 ) ( SURFACE-AT ?auto_2490 ?auto_2495 ) ( ON ?auto_2490 ?auto_2491 ) ( CLEAR ?auto_2490 ) ( not ( = ?auto_2489 ?auto_2491 ) ) ( not ( = ?auto_2490 ?auto_2491 ) ) ( not ( = ?auto_2497 ?auto_2491 ) ) ( TRUCK-AT ?auto_2494 ?auto_2493 ) ( SURFACE-AT ?auto_2497 ?auto_2493 ) ( CLEAR ?auto_2497 ) ( LIFTING ?auto_2496 ?auto_2489 ) ( IS-CRATE ?auto_2489 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2497 ?auto_2489 )
      ( MAKE-2CRATE ?auto_2497 ?auto_2489 ?auto_2490 )
      ( MAKE-1CRATE-VERIFY ?auto_2489 ?auto_2490 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2498 - SURFACE
      ?auto_2499 - SURFACE
      ?auto_2500 - SURFACE
    )
    :vars
    (
      ?auto_2506 - HOIST
      ?auto_2502 - PLACE
      ?auto_2504 - PLACE
      ?auto_2503 - HOIST
      ?auto_2505 - SURFACE
      ?auto_2501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2506 ?auto_2502 ) ( IS-CRATE ?auto_2500 ) ( not ( = ?auto_2499 ?auto_2500 ) ) ( not ( = ?auto_2498 ?auto_2499 ) ) ( not ( = ?auto_2498 ?auto_2500 ) ) ( not ( = ?auto_2504 ?auto_2502 ) ) ( HOIST-AT ?auto_2503 ?auto_2504 ) ( not ( = ?auto_2506 ?auto_2503 ) ) ( AVAILABLE ?auto_2503 ) ( SURFACE-AT ?auto_2500 ?auto_2504 ) ( ON ?auto_2500 ?auto_2505 ) ( CLEAR ?auto_2500 ) ( not ( = ?auto_2499 ?auto_2505 ) ) ( not ( = ?auto_2500 ?auto_2505 ) ) ( not ( = ?auto_2498 ?auto_2505 ) ) ( TRUCK-AT ?auto_2501 ?auto_2502 ) ( SURFACE-AT ?auto_2498 ?auto_2502 ) ( CLEAR ?auto_2498 ) ( LIFTING ?auto_2506 ?auto_2499 ) ( IS-CRATE ?auto_2499 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2499 ?auto_2500 )
      ( MAKE-2CRATE-VERIFY ?auto_2498 ?auto_2499 ?auto_2500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2507 - SURFACE
      ?auto_2508 - SURFACE
      ?auto_2509 - SURFACE
      ?auto_2510 - SURFACE
    )
    :vars
    (
      ?auto_2513 - HOIST
      ?auto_2512 - PLACE
      ?auto_2514 - PLACE
      ?auto_2516 - HOIST
      ?auto_2515 - SURFACE
      ?auto_2511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2513 ?auto_2512 ) ( IS-CRATE ?auto_2510 ) ( not ( = ?auto_2509 ?auto_2510 ) ) ( not ( = ?auto_2508 ?auto_2509 ) ) ( not ( = ?auto_2508 ?auto_2510 ) ) ( not ( = ?auto_2514 ?auto_2512 ) ) ( HOIST-AT ?auto_2516 ?auto_2514 ) ( not ( = ?auto_2513 ?auto_2516 ) ) ( AVAILABLE ?auto_2516 ) ( SURFACE-AT ?auto_2510 ?auto_2514 ) ( ON ?auto_2510 ?auto_2515 ) ( CLEAR ?auto_2510 ) ( not ( = ?auto_2509 ?auto_2515 ) ) ( not ( = ?auto_2510 ?auto_2515 ) ) ( not ( = ?auto_2508 ?auto_2515 ) ) ( TRUCK-AT ?auto_2511 ?auto_2512 ) ( SURFACE-AT ?auto_2508 ?auto_2512 ) ( CLEAR ?auto_2508 ) ( LIFTING ?auto_2513 ?auto_2509 ) ( IS-CRATE ?auto_2509 ) ( ON ?auto_2508 ?auto_2507 ) ( not ( = ?auto_2507 ?auto_2508 ) ) ( not ( = ?auto_2507 ?auto_2509 ) ) ( not ( = ?auto_2507 ?auto_2510 ) ) ( not ( = ?auto_2507 ?auto_2515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2508 ?auto_2509 ?auto_2510 )
      ( MAKE-3CRATE-VERIFY ?auto_2507 ?auto_2508 ?auto_2509 ?auto_2510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2517 - SURFACE
      ?auto_2518 - SURFACE
    )
    :vars
    (
      ?auto_2521 - HOIST
      ?auto_2520 - PLACE
      ?auto_2524 - SURFACE
      ?auto_2522 - PLACE
      ?auto_2525 - HOIST
      ?auto_2523 - SURFACE
      ?auto_2519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2521 ?auto_2520 ) ( IS-CRATE ?auto_2518 ) ( not ( = ?auto_2517 ?auto_2518 ) ) ( not ( = ?auto_2524 ?auto_2517 ) ) ( not ( = ?auto_2524 ?auto_2518 ) ) ( not ( = ?auto_2522 ?auto_2520 ) ) ( HOIST-AT ?auto_2525 ?auto_2522 ) ( not ( = ?auto_2521 ?auto_2525 ) ) ( AVAILABLE ?auto_2525 ) ( SURFACE-AT ?auto_2518 ?auto_2522 ) ( ON ?auto_2518 ?auto_2523 ) ( CLEAR ?auto_2518 ) ( not ( = ?auto_2517 ?auto_2523 ) ) ( not ( = ?auto_2518 ?auto_2523 ) ) ( not ( = ?auto_2524 ?auto_2523 ) ) ( TRUCK-AT ?auto_2519 ?auto_2520 ) ( SURFACE-AT ?auto_2524 ?auto_2520 ) ( CLEAR ?auto_2524 ) ( IS-CRATE ?auto_2517 ) ( AVAILABLE ?auto_2521 ) ( IN ?auto_2517 ?auto_2519 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2521 ?auto_2517 ?auto_2519 ?auto_2520 )
      ( MAKE-2CRATE ?auto_2524 ?auto_2517 ?auto_2518 )
      ( MAKE-1CRATE-VERIFY ?auto_2517 ?auto_2518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2526 - SURFACE
      ?auto_2527 - SURFACE
      ?auto_2528 - SURFACE
    )
    :vars
    (
      ?auto_2533 - HOIST
      ?auto_2534 - PLACE
      ?auto_2529 - PLACE
      ?auto_2530 - HOIST
      ?auto_2532 - SURFACE
      ?auto_2531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533 ?auto_2534 ) ( IS-CRATE ?auto_2528 ) ( not ( = ?auto_2527 ?auto_2528 ) ) ( not ( = ?auto_2526 ?auto_2527 ) ) ( not ( = ?auto_2526 ?auto_2528 ) ) ( not ( = ?auto_2529 ?auto_2534 ) ) ( HOIST-AT ?auto_2530 ?auto_2529 ) ( not ( = ?auto_2533 ?auto_2530 ) ) ( AVAILABLE ?auto_2530 ) ( SURFACE-AT ?auto_2528 ?auto_2529 ) ( ON ?auto_2528 ?auto_2532 ) ( CLEAR ?auto_2528 ) ( not ( = ?auto_2527 ?auto_2532 ) ) ( not ( = ?auto_2528 ?auto_2532 ) ) ( not ( = ?auto_2526 ?auto_2532 ) ) ( TRUCK-AT ?auto_2531 ?auto_2534 ) ( SURFACE-AT ?auto_2526 ?auto_2534 ) ( CLEAR ?auto_2526 ) ( IS-CRATE ?auto_2527 ) ( AVAILABLE ?auto_2533 ) ( IN ?auto_2527 ?auto_2531 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2527 ?auto_2528 )
      ( MAKE-2CRATE-VERIFY ?auto_2526 ?auto_2527 ?auto_2528 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2535 - SURFACE
      ?auto_2536 - SURFACE
      ?auto_2537 - SURFACE
      ?auto_2538 - SURFACE
    )
    :vars
    (
      ?auto_2542 - HOIST
      ?auto_2539 - PLACE
      ?auto_2543 - PLACE
      ?auto_2544 - HOIST
      ?auto_2540 - SURFACE
      ?auto_2541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2542 ?auto_2539 ) ( IS-CRATE ?auto_2538 ) ( not ( = ?auto_2537 ?auto_2538 ) ) ( not ( = ?auto_2536 ?auto_2537 ) ) ( not ( = ?auto_2536 ?auto_2538 ) ) ( not ( = ?auto_2543 ?auto_2539 ) ) ( HOIST-AT ?auto_2544 ?auto_2543 ) ( not ( = ?auto_2542 ?auto_2544 ) ) ( AVAILABLE ?auto_2544 ) ( SURFACE-AT ?auto_2538 ?auto_2543 ) ( ON ?auto_2538 ?auto_2540 ) ( CLEAR ?auto_2538 ) ( not ( = ?auto_2537 ?auto_2540 ) ) ( not ( = ?auto_2538 ?auto_2540 ) ) ( not ( = ?auto_2536 ?auto_2540 ) ) ( TRUCK-AT ?auto_2541 ?auto_2539 ) ( SURFACE-AT ?auto_2536 ?auto_2539 ) ( CLEAR ?auto_2536 ) ( IS-CRATE ?auto_2537 ) ( AVAILABLE ?auto_2542 ) ( IN ?auto_2537 ?auto_2541 ) ( ON ?auto_2536 ?auto_2535 ) ( not ( = ?auto_2535 ?auto_2536 ) ) ( not ( = ?auto_2535 ?auto_2537 ) ) ( not ( = ?auto_2535 ?auto_2538 ) ) ( not ( = ?auto_2535 ?auto_2540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2536 ?auto_2537 ?auto_2538 )
      ( MAKE-3CRATE-VERIFY ?auto_2535 ?auto_2536 ?auto_2537 ?auto_2538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2545 - SURFACE
      ?auto_2546 - SURFACE
    )
    :vars
    (
      ?auto_2551 - HOIST
      ?auto_2547 - PLACE
      ?auto_2549 - SURFACE
      ?auto_2552 - PLACE
      ?auto_2553 - HOIST
      ?auto_2548 - SURFACE
      ?auto_2550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551 ?auto_2547 ) ( IS-CRATE ?auto_2546 ) ( not ( = ?auto_2545 ?auto_2546 ) ) ( not ( = ?auto_2549 ?auto_2545 ) ) ( not ( = ?auto_2549 ?auto_2546 ) ) ( not ( = ?auto_2552 ?auto_2547 ) ) ( HOIST-AT ?auto_2553 ?auto_2552 ) ( not ( = ?auto_2551 ?auto_2553 ) ) ( AVAILABLE ?auto_2553 ) ( SURFACE-AT ?auto_2546 ?auto_2552 ) ( ON ?auto_2546 ?auto_2548 ) ( CLEAR ?auto_2546 ) ( not ( = ?auto_2545 ?auto_2548 ) ) ( not ( = ?auto_2546 ?auto_2548 ) ) ( not ( = ?auto_2549 ?auto_2548 ) ) ( SURFACE-AT ?auto_2549 ?auto_2547 ) ( CLEAR ?auto_2549 ) ( IS-CRATE ?auto_2545 ) ( AVAILABLE ?auto_2551 ) ( IN ?auto_2545 ?auto_2550 ) ( TRUCK-AT ?auto_2550 ?auto_2552 ) )
    :subtasks
    ( ( !DRIVE ?auto_2550 ?auto_2552 ?auto_2547 )
      ( MAKE-2CRATE ?auto_2549 ?auto_2545 ?auto_2546 )
      ( MAKE-1CRATE-VERIFY ?auto_2545 ?auto_2546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2554 - SURFACE
      ?auto_2555 - SURFACE
      ?auto_2556 - SURFACE
    )
    :vars
    (
      ?auto_2562 - HOIST
      ?auto_2560 - PLACE
      ?auto_2559 - PLACE
      ?auto_2557 - HOIST
      ?auto_2558 - SURFACE
      ?auto_2561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2562 ?auto_2560 ) ( IS-CRATE ?auto_2556 ) ( not ( = ?auto_2555 ?auto_2556 ) ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( not ( = ?auto_2554 ?auto_2556 ) ) ( not ( = ?auto_2559 ?auto_2560 ) ) ( HOIST-AT ?auto_2557 ?auto_2559 ) ( not ( = ?auto_2562 ?auto_2557 ) ) ( AVAILABLE ?auto_2557 ) ( SURFACE-AT ?auto_2556 ?auto_2559 ) ( ON ?auto_2556 ?auto_2558 ) ( CLEAR ?auto_2556 ) ( not ( = ?auto_2555 ?auto_2558 ) ) ( not ( = ?auto_2556 ?auto_2558 ) ) ( not ( = ?auto_2554 ?auto_2558 ) ) ( SURFACE-AT ?auto_2554 ?auto_2560 ) ( CLEAR ?auto_2554 ) ( IS-CRATE ?auto_2555 ) ( AVAILABLE ?auto_2562 ) ( IN ?auto_2555 ?auto_2561 ) ( TRUCK-AT ?auto_2561 ?auto_2559 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2555 ?auto_2556 )
      ( MAKE-2CRATE-VERIFY ?auto_2554 ?auto_2555 ?auto_2556 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2563 - SURFACE
      ?auto_2564 - SURFACE
      ?auto_2565 - SURFACE
      ?auto_2566 - SURFACE
    )
    :vars
    (
      ?auto_2572 - HOIST
      ?auto_2568 - PLACE
      ?auto_2570 - PLACE
      ?auto_2567 - HOIST
      ?auto_2571 - SURFACE
      ?auto_2569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2572 ?auto_2568 ) ( IS-CRATE ?auto_2566 ) ( not ( = ?auto_2565 ?auto_2566 ) ) ( not ( = ?auto_2564 ?auto_2565 ) ) ( not ( = ?auto_2564 ?auto_2566 ) ) ( not ( = ?auto_2570 ?auto_2568 ) ) ( HOIST-AT ?auto_2567 ?auto_2570 ) ( not ( = ?auto_2572 ?auto_2567 ) ) ( AVAILABLE ?auto_2567 ) ( SURFACE-AT ?auto_2566 ?auto_2570 ) ( ON ?auto_2566 ?auto_2571 ) ( CLEAR ?auto_2566 ) ( not ( = ?auto_2565 ?auto_2571 ) ) ( not ( = ?auto_2566 ?auto_2571 ) ) ( not ( = ?auto_2564 ?auto_2571 ) ) ( SURFACE-AT ?auto_2564 ?auto_2568 ) ( CLEAR ?auto_2564 ) ( IS-CRATE ?auto_2565 ) ( AVAILABLE ?auto_2572 ) ( IN ?auto_2565 ?auto_2569 ) ( TRUCK-AT ?auto_2569 ?auto_2570 ) ( ON ?auto_2564 ?auto_2563 ) ( not ( = ?auto_2563 ?auto_2564 ) ) ( not ( = ?auto_2563 ?auto_2565 ) ) ( not ( = ?auto_2563 ?auto_2566 ) ) ( not ( = ?auto_2563 ?auto_2571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2564 ?auto_2565 ?auto_2566 )
      ( MAKE-3CRATE-VERIFY ?auto_2563 ?auto_2564 ?auto_2565 ?auto_2566 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2573 - SURFACE
      ?auto_2574 - SURFACE
    )
    :vars
    (
      ?auto_2580 - HOIST
      ?auto_2576 - PLACE
      ?auto_2581 - SURFACE
      ?auto_2578 - PLACE
      ?auto_2575 - HOIST
      ?auto_2579 - SURFACE
      ?auto_2577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2580 ?auto_2576 ) ( IS-CRATE ?auto_2574 ) ( not ( = ?auto_2573 ?auto_2574 ) ) ( not ( = ?auto_2581 ?auto_2573 ) ) ( not ( = ?auto_2581 ?auto_2574 ) ) ( not ( = ?auto_2578 ?auto_2576 ) ) ( HOIST-AT ?auto_2575 ?auto_2578 ) ( not ( = ?auto_2580 ?auto_2575 ) ) ( SURFACE-AT ?auto_2574 ?auto_2578 ) ( ON ?auto_2574 ?auto_2579 ) ( CLEAR ?auto_2574 ) ( not ( = ?auto_2573 ?auto_2579 ) ) ( not ( = ?auto_2574 ?auto_2579 ) ) ( not ( = ?auto_2581 ?auto_2579 ) ) ( SURFACE-AT ?auto_2581 ?auto_2576 ) ( CLEAR ?auto_2581 ) ( IS-CRATE ?auto_2573 ) ( AVAILABLE ?auto_2580 ) ( TRUCK-AT ?auto_2577 ?auto_2578 ) ( LIFTING ?auto_2575 ?auto_2573 ) )
    :subtasks
    ( ( !LOAD ?auto_2575 ?auto_2573 ?auto_2577 ?auto_2578 )
      ( MAKE-2CRATE ?auto_2581 ?auto_2573 ?auto_2574 )
      ( MAKE-1CRATE-VERIFY ?auto_2573 ?auto_2574 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2582 - SURFACE
      ?auto_2583 - SURFACE
      ?auto_2584 - SURFACE
    )
    :vars
    (
      ?auto_2585 - HOIST
      ?auto_2588 - PLACE
      ?auto_2586 - PLACE
      ?auto_2589 - HOIST
      ?auto_2587 - SURFACE
      ?auto_2590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2585 ?auto_2588 ) ( IS-CRATE ?auto_2584 ) ( not ( = ?auto_2583 ?auto_2584 ) ) ( not ( = ?auto_2582 ?auto_2583 ) ) ( not ( = ?auto_2582 ?auto_2584 ) ) ( not ( = ?auto_2586 ?auto_2588 ) ) ( HOIST-AT ?auto_2589 ?auto_2586 ) ( not ( = ?auto_2585 ?auto_2589 ) ) ( SURFACE-AT ?auto_2584 ?auto_2586 ) ( ON ?auto_2584 ?auto_2587 ) ( CLEAR ?auto_2584 ) ( not ( = ?auto_2583 ?auto_2587 ) ) ( not ( = ?auto_2584 ?auto_2587 ) ) ( not ( = ?auto_2582 ?auto_2587 ) ) ( SURFACE-AT ?auto_2582 ?auto_2588 ) ( CLEAR ?auto_2582 ) ( IS-CRATE ?auto_2583 ) ( AVAILABLE ?auto_2585 ) ( TRUCK-AT ?auto_2590 ?auto_2586 ) ( LIFTING ?auto_2589 ?auto_2583 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2583 ?auto_2584 )
      ( MAKE-2CRATE-VERIFY ?auto_2582 ?auto_2583 ?auto_2584 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2591 - SURFACE
      ?auto_2592 - SURFACE
      ?auto_2593 - SURFACE
      ?auto_2594 - SURFACE
    )
    :vars
    (
      ?auto_2595 - HOIST
      ?auto_2599 - PLACE
      ?auto_2598 - PLACE
      ?auto_2597 - HOIST
      ?auto_2596 - SURFACE
      ?auto_2600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2595 ?auto_2599 ) ( IS-CRATE ?auto_2594 ) ( not ( = ?auto_2593 ?auto_2594 ) ) ( not ( = ?auto_2592 ?auto_2593 ) ) ( not ( = ?auto_2592 ?auto_2594 ) ) ( not ( = ?auto_2598 ?auto_2599 ) ) ( HOIST-AT ?auto_2597 ?auto_2598 ) ( not ( = ?auto_2595 ?auto_2597 ) ) ( SURFACE-AT ?auto_2594 ?auto_2598 ) ( ON ?auto_2594 ?auto_2596 ) ( CLEAR ?auto_2594 ) ( not ( = ?auto_2593 ?auto_2596 ) ) ( not ( = ?auto_2594 ?auto_2596 ) ) ( not ( = ?auto_2592 ?auto_2596 ) ) ( SURFACE-AT ?auto_2592 ?auto_2599 ) ( CLEAR ?auto_2592 ) ( IS-CRATE ?auto_2593 ) ( AVAILABLE ?auto_2595 ) ( TRUCK-AT ?auto_2600 ?auto_2598 ) ( LIFTING ?auto_2597 ?auto_2593 ) ( ON ?auto_2592 ?auto_2591 ) ( not ( = ?auto_2591 ?auto_2592 ) ) ( not ( = ?auto_2591 ?auto_2593 ) ) ( not ( = ?auto_2591 ?auto_2594 ) ) ( not ( = ?auto_2591 ?auto_2596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2592 ?auto_2593 ?auto_2594 )
      ( MAKE-3CRATE-VERIFY ?auto_2591 ?auto_2592 ?auto_2593 ?auto_2594 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2601 - SURFACE
      ?auto_2602 - SURFACE
    )
    :vars
    (
      ?auto_2603 - HOIST
      ?auto_2607 - PLACE
      ?auto_2609 - SURFACE
      ?auto_2606 - PLACE
      ?auto_2605 - HOIST
      ?auto_2604 - SURFACE
      ?auto_2608 - TRUCK
      ?auto_2610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2603 ?auto_2607 ) ( IS-CRATE ?auto_2602 ) ( not ( = ?auto_2601 ?auto_2602 ) ) ( not ( = ?auto_2609 ?auto_2601 ) ) ( not ( = ?auto_2609 ?auto_2602 ) ) ( not ( = ?auto_2606 ?auto_2607 ) ) ( HOIST-AT ?auto_2605 ?auto_2606 ) ( not ( = ?auto_2603 ?auto_2605 ) ) ( SURFACE-AT ?auto_2602 ?auto_2606 ) ( ON ?auto_2602 ?auto_2604 ) ( CLEAR ?auto_2602 ) ( not ( = ?auto_2601 ?auto_2604 ) ) ( not ( = ?auto_2602 ?auto_2604 ) ) ( not ( = ?auto_2609 ?auto_2604 ) ) ( SURFACE-AT ?auto_2609 ?auto_2607 ) ( CLEAR ?auto_2609 ) ( IS-CRATE ?auto_2601 ) ( AVAILABLE ?auto_2603 ) ( TRUCK-AT ?auto_2608 ?auto_2606 ) ( AVAILABLE ?auto_2605 ) ( SURFACE-AT ?auto_2601 ?auto_2606 ) ( ON ?auto_2601 ?auto_2610 ) ( CLEAR ?auto_2601 ) ( not ( = ?auto_2601 ?auto_2610 ) ) ( not ( = ?auto_2602 ?auto_2610 ) ) ( not ( = ?auto_2609 ?auto_2610 ) ) ( not ( = ?auto_2604 ?auto_2610 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2605 ?auto_2601 ?auto_2610 ?auto_2606 )
      ( MAKE-2CRATE ?auto_2609 ?auto_2601 ?auto_2602 )
      ( MAKE-1CRATE-VERIFY ?auto_2601 ?auto_2602 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2611 - SURFACE
      ?auto_2612 - SURFACE
      ?auto_2613 - SURFACE
    )
    :vars
    (
      ?auto_2619 - HOIST
      ?auto_2614 - PLACE
      ?auto_2616 - PLACE
      ?auto_2617 - HOIST
      ?auto_2618 - SURFACE
      ?auto_2620 - TRUCK
      ?auto_2615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2619 ?auto_2614 ) ( IS-CRATE ?auto_2613 ) ( not ( = ?auto_2612 ?auto_2613 ) ) ( not ( = ?auto_2611 ?auto_2612 ) ) ( not ( = ?auto_2611 ?auto_2613 ) ) ( not ( = ?auto_2616 ?auto_2614 ) ) ( HOIST-AT ?auto_2617 ?auto_2616 ) ( not ( = ?auto_2619 ?auto_2617 ) ) ( SURFACE-AT ?auto_2613 ?auto_2616 ) ( ON ?auto_2613 ?auto_2618 ) ( CLEAR ?auto_2613 ) ( not ( = ?auto_2612 ?auto_2618 ) ) ( not ( = ?auto_2613 ?auto_2618 ) ) ( not ( = ?auto_2611 ?auto_2618 ) ) ( SURFACE-AT ?auto_2611 ?auto_2614 ) ( CLEAR ?auto_2611 ) ( IS-CRATE ?auto_2612 ) ( AVAILABLE ?auto_2619 ) ( TRUCK-AT ?auto_2620 ?auto_2616 ) ( AVAILABLE ?auto_2617 ) ( SURFACE-AT ?auto_2612 ?auto_2616 ) ( ON ?auto_2612 ?auto_2615 ) ( CLEAR ?auto_2612 ) ( not ( = ?auto_2612 ?auto_2615 ) ) ( not ( = ?auto_2613 ?auto_2615 ) ) ( not ( = ?auto_2611 ?auto_2615 ) ) ( not ( = ?auto_2618 ?auto_2615 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2612 ?auto_2613 )
      ( MAKE-2CRATE-VERIFY ?auto_2611 ?auto_2612 ?auto_2613 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2621 - SURFACE
      ?auto_2622 - SURFACE
      ?auto_2623 - SURFACE
      ?auto_2624 - SURFACE
    )
    :vars
    (
      ?auto_2629 - HOIST
      ?auto_2625 - PLACE
      ?auto_2631 - PLACE
      ?auto_2630 - HOIST
      ?auto_2628 - SURFACE
      ?auto_2626 - TRUCK
      ?auto_2627 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2629 ?auto_2625 ) ( IS-CRATE ?auto_2624 ) ( not ( = ?auto_2623 ?auto_2624 ) ) ( not ( = ?auto_2622 ?auto_2623 ) ) ( not ( = ?auto_2622 ?auto_2624 ) ) ( not ( = ?auto_2631 ?auto_2625 ) ) ( HOIST-AT ?auto_2630 ?auto_2631 ) ( not ( = ?auto_2629 ?auto_2630 ) ) ( SURFACE-AT ?auto_2624 ?auto_2631 ) ( ON ?auto_2624 ?auto_2628 ) ( CLEAR ?auto_2624 ) ( not ( = ?auto_2623 ?auto_2628 ) ) ( not ( = ?auto_2624 ?auto_2628 ) ) ( not ( = ?auto_2622 ?auto_2628 ) ) ( SURFACE-AT ?auto_2622 ?auto_2625 ) ( CLEAR ?auto_2622 ) ( IS-CRATE ?auto_2623 ) ( AVAILABLE ?auto_2629 ) ( TRUCK-AT ?auto_2626 ?auto_2631 ) ( AVAILABLE ?auto_2630 ) ( SURFACE-AT ?auto_2623 ?auto_2631 ) ( ON ?auto_2623 ?auto_2627 ) ( CLEAR ?auto_2623 ) ( not ( = ?auto_2623 ?auto_2627 ) ) ( not ( = ?auto_2624 ?auto_2627 ) ) ( not ( = ?auto_2622 ?auto_2627 ) ) ( not ( = ?auto_2628 ?auto_2627 ) ) ( ON ?auto_2622 ?auto_2621 ) ( not ( = ?auto_2621 ?auto_2622 ) ) ( not ( = ?auto_2621 ?auto_2623 ) ) ( not ( = ?auto_2621 ?auto_2624 ) ) ( not ( = ?auto_2621 ?auto_2628 ) ) ( not ( = ?auto_2621 ?auto_2627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2622 ?auto_2623 ?auto_2624 )
      ( MAKE-3CRATE-VERIFY ?auto_2621 ?auto_2622 ?auto_2623 ?auto_2624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2632 - SURFACE
      ?auto_2633 - SURFACE
    )
    :vars
    (
      ?auto_2638 - HOIST
      ?auto_2634 - PLACE
      ?auto_2641 - SURFACE
      ?auto_2640 - PLACE
      ?auto_2639 - HOIST
      ?auto_2637 - SURFACE
      ?auto_2636 - SURFACE
      ?auto_2635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2638 ?auto_2634 ) ( IS-CRATE ?auto_2633 ) ( not ( = ?auto_2632 ?auto_2633 ) ) ( not ( = ?auto_2641 ?auto_2632 ) ) ( not ( = ?auto_2641 ?auto_2633 ) ) ( not ( = ?auto_2640 ?auto_2634 ) ) ( HOIST-AT ?auto_2639 ?auto_2640 ) ( not ( = ?auto_2638 ?auto_2639 ) ) ( SURFACE-AT ?auto_2633 ?auto_2640 ) ( ON ?auto_2633 ?auto_2637 ) ( CLEAR ?auto_2633 ) ( not ( = ?auto_2632 ?auto_2637 ) ) ( not ( = ?auto_2633 ?auto_2637 ) ) ( not ( = ?auto_2641 ?auto_2637 ) ) ( SURFACE-AT ?auto_2641 ?auto_2634 ) ( CLEAR ?auto_2641 ) ( IS-CRATE ?auto_2632 ) ( AVAILABLE ?auto_2638 ) ( AVAILABLE ?auto_2639 ) ( SURFACE-AT ?auto_2632 ?auto_2640 ) ( ON ?auto_2632 ?auto_2636 ) ( CLEAR ?auto_2632 ) ( not ( = ?auto_2632 ?auto_2636 ) ) ( not ( = ?auto_2633 ?auto_2636 ) ) ( not ( = ?auto_2641 ?auto_2636 ) ) ( not ( = ?auto_2637 ?auto_2636 ) ) ( TRUCK-AT ?auto_2635 ?auto_2634 ) )
    :subtasks
    ( ( !DRIVE ?auto_2635 ?auto_2634 ?auto_2640 )
      ( MAKE-2CRATE ?auto_2641 ?auto_2632 ?auto_2633 )
      ( MAKE-1CRATE-VERIFY ?auto_2632 ?auto_2633 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2642 - SURFACE
      ?auto_2643 - SURFACE
      ?auto_2644 - SURFACE
    )
    :vars
    (
      ?auto_2646 - HOIST
      ?auto_2648 - PLACE
      ?auto_2651 - PLACE
      ?auto_2650 - HOIST
      ?auto_2645 - SURFACE
      ?auto_2649 - SURFACE
      ?auto_2647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2646 ?auto_2648 ) ( IS-CRATE ?auto_2644 ) ( not ( = ?auto_2643 ?auto_2644 ) ) ( not ( = ?auto_2642 ?auto_2643 ) ) ( not ( = ?auto_2642 ?auto_2644 ) ) ( not ( = ?auto_2651 ?auto_2648 ) ) ( HOIST-AT ?auto_2650 ?auto_2651 ) ( not ( = ?auto_2646 ?auto_2650 ) ) ( SURFACE-AT ?auto_2644 ?auto_2651 ) ( ON ?auto_2644 ?auto_2645 ) ( CLEAR ?auto_2644 ) ( not ( = ?auto_2643 ?auto_2645 ) ) ( not ( = ?auto_2644 ?auto_2645 ) ) ( not ( = ?auto_2642 ?auto_2645 ) ) ( SURFACE-AT ?auto_2642 ?auto_2648 ) ( CLEAR ?auto_2642 ) ( IS-CRATE ?auto_2643 ) ( AVAILABLE ?auto_2646 ) ( AVAILABLE ?auto_2650 ) ( SURFACE-AT ?auto_2643 ?auto_2651 ) ( ON ?auto_2643 ?auto_2649 ) ( CLEAR ?auto_2643 ) ( not ( = ?auto_2643 ?auto_2649 ) ) ( not ( = ?auto_2644 ?auto_2649 ) ) ( not ( = ?auto_2642 ?auto_2649 ) ) ( not ( = ?auto_2645 ?auto_2649 ) ) ( TRUCK-AT ?auto_2647 ?auto_2648 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2643 ?auto_2644 )
      ( MAKE-2CRATE-VERIFY ?auto_2642 ?auto_2643 ?auto_2644 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2652 - SURFACE
      ?auto_2653 - SURFACE
      ?auto_2654 - SURFACE
      ?auto_2655 - SURFACE
    )
    :vars
    (
      ?auto_2658 - HOIST
      ?auto_2662 - PLACE
      ?auto_2656 - PLACE
      ?auto_2660 - HOIST
      ?auto_2661 - SURFACE
      ?auto_2659 - SURFACE
      ?auto_2657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658 ?auto_2662 ) ( IS-CRATE ?auto_2655 ) ( not ( = ?auto_2654 ?auto_2655 ) ) ( not ( = ?auto_2653 ?auto_2654 ) ) ( not ( = ?auto_2653 ?auto_2655 ) ) ( not ( = ?auto_2656 ?auto_2662 ) ) ( HOIST-AT ?auto_2660 ?auto_2656 ) ( not ( = ?auto_2658 ?auto_2660 ) ) ( SURFACE-AT ?auto_2655 ?auto_2656 ) ( ON ?auto_2655 ?auto_2661 ) ( CLEAR ?auto_2655 ) ( not ( = ?auto_2654 ?auto_2661 ) ) ( not ( = ?auto_2655 ?auto_2661 ) ) ( not ( = ?auto_2653 ?auto_2661 ) ) ( SURFACE-AT ?auto_2653 ?auto_2662 ) ( CLEAR ?auto_2653 ) ( IS-CRATE ?auto_2654 ) ( AVAILABLE ?auto_2658 ) ( AVAILABLE ?auto_2660 ) ( SURFACE-AT ?auto_2654 ?auto_2656 ) ( ON ?auto_2654 ?auto_2659 ) ( CLEAR ?auto_2654 ) ( not ( = ?auto_2654 ?auto_2659 ) ) ( not ( = ?auto_2655 ?auto_2659 ) ) ( not ( = ?auto_2653 ?auto_2659 ) ) ( not ( = ?auto_2661 ?auto_2659 ) ) ( TRUCK-AT ?auto_2657 ?auto_2662 ) ( ON ?auto_2653 ?auto_2652 ) ( not ( = ?auto_2652 ?auto_2653 ) ) ( not ( = ?auto_2652 ?auto_2654 ) ) ( not ( = ?auto_2652 ?auto_2655 ) ) ( not ( = ?auto_2652 ?auto_2661 ) ) ( not ( = ?auto_2652 ?auto_2659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2653 ?auto_2654 ?auto_2655 )
      ( MAKE-3CRATE-VERIFY ?auto_2652 ?auto_2653 ?auto_2654 ?auto_2655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2663 - SURFACE
      ?auto_2664 - SURFACE
    )
    :vars
    (
      ?auto_2668 - HOIST
      ?auto_2672 - PLACE
      ?auto_2665 - SURFACE
      ?auto_2666 - PLACE
      ?auto_2670 - HOIST
      ?auto_2671 - SURFACE
      ?auto_2669 - SURFACE
      ?auto_2667 - TRUCK
      ?auto_2673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2668 ?auto_2672 ) ( IS-CRATE ?auto_2664 ) ( not ( = ?auto_2663 ?auto_2664 ) ) ( not ( = ?auto_2665 ?auto_2663 ) ) ( not ( = ?auto_2665 ?auto_2664 ) ) ( not ( = ?auto_2666 ?auto_2672 ) ) ( HOIST-AT ?auto_2670 ?auto_2666 ) ( not ( = ?auto_2668 ?auto_2670 ) ) ( SURFACE-AT ?auto_2664 ?auto_2666 ) ( ON ?auto_2664 ?auto_2671 ) ( CLEAR ?auto_2664 ) ( not ( = ?auto_2663 ?auto_2671 ) ) ( not ( = ?auto_2664 ?auto_2671 ) ) ( not ( = ?auto_2665 ?auto_2671 ) ) ( IS-CRATE ?auto_2663 ) ( AVAILABLE ?auto_2670 ) ( SURFACE-AT ?auto_2663 ?auto_2666 ) ( ON ?auto_2663 ?auto_2669 ) ( CLEAR ?auto_2663 ) ( not ( = ?auto_2663 ?auto_2669 ) ) ( not ( = ?auto_2664 ?auto_2669 ) ) ( not ( = ?auto_2665 ?auto_2669 ) ) ( not ( = ?auto_2671 ?auto_2669 ) ) ( TRUCK-AT ?auto_2667 ?auto_2672 ) ( SURFACE-AT ?auto_2673 ?auto_2672 ) ( CLEAR ?auto_2673 ) ( LIFTING ?auto_2668 ?auto_2665 ) ( IS-CRATE ?auto_2665 ) ( not ( = ?auto_2673 ?auto_2665 ) ) ( not ( = ?auto_2663 ?auto_2673 ) ) ( not ( = ?auto_2664 ?auto_2673 ) ) ( not ( = ?auto_2671 ?auto_2673 ) ) ( not ( = ?auto_2669 ?auto_2673 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2673 ?auto_2665 )
      ( MAKE-2CRATE ?auto_2665 ?auto_2663 ?auto_2664 )
      ( MAKE-1CRATE-VERIFY ?auto_2663 ?auto_2664 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2674 - SURFACE
      ?auto_2675 - SURFACE
      ?auto_2676 - SURFACE
    )
    :vars
    (
      ?auto_2680 - HOIST
      ?auto_2682 - PLACE
      ?auto_2684 - PLACE
      ?auto_2679 - HOIST
      ?auto_2678 - SURFACE
      ?auto_2677 - SURFACE
      ?auto_2681 - TRUCK
      ?auto_2683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2680 ?auto_2682 ) ( IS-CRATE ?auto_2676 ) ( not ( = ?auto_2675 ?auto_2676 ) ) ( not ( = ?auto_2674 ?auto_2675 ) ) ( not ( = ?auto_2674 ?auto_2676 ) ) ( not ( = ?auto_2684 ?auto_2682 ) ) ( HOIST-AT ?auto_2679 ?auto_2684 ) ( not ( = ?auto_2680 ?auto_2679 ) ) ( SURFACE-AT ?auto_2676 ?auto_2684 ) ( ON ?auto_2676 ?auto_2678 ) ( CLEAR ?auto_2676 ) ( not ( = ?auto_2675 ?auto_2678 ) ) ( not ( = ?auto_2676 ?auto_2678 ) ) ( not ( = ?auto_2674 ?auto_2678 ) ) ( IS-CRATE ?auto_2675 ) ( AVAILABLE ?auto_2679 ) ( SURFACE-AT ?auto_2675 ?auto_2684 ) ( ON ?auto_2675 ?auto_2677 ) ( CLEAR ?auto_2675 ) ( not ( = ?auto_2675 ?auto_2677 ) ) ( not ( = ?auto_2676 ?auto_2677 ) ) ( not ( = ?auto_2674 ?auto_2677 ) ) ( not ( = ?auto_2678 ?auto_2677 ) ) ( TRUCK-AT ?auto_2681 ?auto_2682 ) ( SURFACE-AT ?auto_2683 ?auto_2682 ) ( CLEAR ?auto_2683 ) ( LIFTING ?auto_2680 ?auto_2674 ) ( IS-CRATE ?auto_2674 ) ( not ( = ?auto_2683 ?auto_2674 ) ) ( not ( = ?auto_2675 ?auto_2683 ) ) ( not ( = ?auto_2676 ?auto_2683 ) ) ( not ( = ?auto_2678 ?auto_2683 ) ) ( not ( = ?auto_2677 ?auto_2683 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2675 ?auto_2676 )
      ( MAKE-2CRATE-VERIFY ?auto_2674 ?auto_2675 ?auto_2676 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2685 - SURFACE
      ?auto_2686 - SURFACE
      ?auto_2687 - SURFACE
      ?auto_2688 - SURFACE
    )
    :vars
    (
      ?auto_2695 - HOIST
      ?auto_2690 - PLACE
      ?auto_2692 - PLACE
      ?auto_2694 - HOIST
      ?auto_2693 - SURFACE
      ?auto_2689 - SURFACE
      ?auto_2691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2695 ?auto_2690 ) ( IS-CRATE ?auto_2688 ) ( not ( = ?auto_2687 ?auto_2688 ) ) ( not ( = ?auto_2686 ?auto_2687 ) ) ( not ( = ?auto_2686 ?auto_2688 ) ) ( not ( = ?auto_2692 ?auto_2690 ) ) ( HOIST-AT ?auto_2694 ?auto_2692 ) ( not ( = ?auto_2695 ?auto_2694 ) ) ( SURFACE-AT ?auto_2688 ?auto_2692 ) ( ON ?auto_2688 ?auto_2693 ) ( CLEAR ?auto_2688 ) ( not ( = ?auto_2687 ?auto_2693 ) ) ( not ( = ?auto_2688 ?auto_2693 ) ) ( not ( = ?auto_2686 ?auto_2693 ) ) ( IS-CRATE ?auto_2687 ) ( AVAILABLE ?auto_2694 ) ( SURFACE-AT ?auto_2687 ?auto_2692 ) ( ON ?auto_2687 ?auto_2689 ) ( CLEAR ?auto_2687 ) ( not ( = ?auto_2687 ?auto_2689 ) ) ( not ( = ?auto_2688 ?auto_2689 ) ) ( not ( = ?auto_2686 ?auto_2689 ) ) ( not ( = ?auto_2693 ?auto_2689 ) ) ( TRUCK-AT ?auto_2691 ?auto_2690 ) ( SURFACE-AT ?auto_2685 ?auto_2690 ) ( CLEAR ?auto_2685 ) ( LIFTING ?auto_2695 ?auto_2686 ) ( IS-CRATE ?auto_2686 ) ( not ( = ?auto_2685 ?auto_2686 ) ) ( not ( = ?auto_2687 ?auto_2685 ) ) ( not ( = ?auto_2688 ?auto_2685 ) ) ( not ( = ?auto_2693 ?auto_2685 ) ) ( not ( = ?auto_2689 ?auto_2685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2686 ?auto_2687 ?auto_2688 )
      ( MAKE-3CRATE-VERIFY ?auto_2685 ?auto_2686 ?auto_2687 ?auto_2688 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2696 - SURFACE
      ?auto_2697 - SURFACE
    )
    :vars
    (
      ?auto_2706 - HOIST
      ?auto_2700 - PLACE
      ?auto_2705 - SURFACE
      ?auto_2702 - PLACE
      ?auto_2704 - HOIST
      ?auto_2703 - SURFACE
      ?auto_2699 - SURFACE
      ?auto_2701 - TRUCK
      ?auto_2698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2706 ?auto_2700 ) ( IS-CRATE ?auto_2697 ) ( not ( = ?auto_2696 ?auto_2697 ) ) ( not ( = ?auto_2705 ?auto_2696 ) ) ( not ( = ?auto_2705 ?auto_2697 ) ) ( not ( = ?auto_2702 ?auto_2700 ) ) ( HOIST-AT ?auto_2704 ?auto_2702 ) ( not ( = ?auto_2706 ?auto_2704 ) ) ( SURFACE-AT ?auto_2697 ?auto_2702 ) ( ON ?auto_2697 ?auto_2703 ) ( CLEAR ?auto_2697 ) ( not ( = ?auto_2696 ?auto_2703 ) ) ( not ( = ?auto_2697 ?auto_2703 ) ) ( not ( = ?auto_2705 ?auto_2703 ) ) ( IS-CRATE ?auto_2696 ) ( AVAILABLE ?auto_2704 ) ( SURFACE-AT ?auto_2696 ?auto_2702 ) ( ON ?auto_2696 ?auto_2699 ) ( CLEAR ?auto_2696 ) ( not ( = ?auto_2696 ?auto_2699 ) ) ( not ( = ?auto_2697 ?auto_2699 ) ) ( not ( = ?auto_2705 ?auto_2699 ) ) ( not ( = ?auto_2703 ?auto_2699 ) ) ( TRUCK-AT ?auto_2701 ?auto_2700 ) ( SURFACE-AT ?auto_2698 ?auto_2700 ) ( CLEAR ?auto_2698 ) ( IS-CRATE ?auto_2705 ) ( not ( = ?auto_2698 ?auto_2705 ) ) ( not ( = ?auto_2696 ?auto_2698 ) ) ( not ( = ?auto_2697 ?auto_2698 ) ) ( not ( = ?auto_2703 ?auto_2698 ) ) ( not ( = ?auto_2699 ?auto_2698 ) ) ( AVAILABLE ?auto_2706 ) ( IN ?auto_2705 ?auto_2701 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2706 ?auto_2705 ?auto_2701 ?auto_2700 )
      ( MAKE-2CRATE ?auto_2705 ?auto_2696 ?auto_2697 )
      ( MAKE-1CRATE-VERIFY ?auto_2696 ?auto_2697 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2707 - SURFACE
      ?auto_2708 - SURFACE
      ?auto_2709 - SURFACE
    )
    :vars
    (
      ?auto_2711 - HOIST
      ?auto_2712 - PLACE
      ?auto_2710 - PLACE
      ?auto_2714 - HOIST
      ?auto_2717 - SURFACE
      ?auto_2713 - SURFACE
      ?auto_2715 - TRUCK
      ?auto_2716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2711 ?auto_2712 ) ( IS-CRATE ?auto_2709 ) ( not ( = ?auto_2708 ?auto_2709 ) ) ( not ( = ?auto_2707 ?auto_2708 ) ) ( not ( = ?auto_2707 ?auto_2709 ) ) ( not ( = ?auto_2710 ?auto_2712 ) ) ( HOIST-AT ?auto_2714 ?auto_2710 ) ( not ( = ?auto_2711 ?auto_2714 ) ) ( SURFACE-AT ?auto_2709 ?auto_2710 ) ( ON ?auto_2709 ?auto_2717 ) ( CLEAR ?auto_2709 ) ( not ( = ?auto_2708 ?auto_2717 ) ) ( not ( = ?auto_2709 ?auto_2717 ) ) ( not ( = ?auto_2707 ?auto_2717 ) ) ( IS-CRATE ?auto_2708 ) ( AVAILABLE ?auto_2714 ) ( SURFACE-AT ?auto_2708 ?auto_2710 ) ( ON ?auto_2708 ?auto_2713 ) ( CLEAR ?auto_2708 ) ( not ( = ?auto_2708 ?auto_2713 ) ) ( not ( = ?auto_2709 ?auto_2713 ) ) ( not ( = ?auto_2707 ?auto_2713 ) ) ( not ( = ?auto_2717 ?auto_2713 ) ) ( TRUCK-AT ?auto_2715 ?auto_2712 ) ( SURFACE-AT ?auto_2716 ?auto_2712 ) ( CLEAR ?auto_2716 ) ( IS-CRATE ?auto_2707 ) ( not ( = ?auto_2716 ?auto_2707 ) ) ( not ( = ?auto_2708 ?auto_2716 ) ) ( not ( = ?auto_2709 ?auto_2716 ) ) ( not ( = ?auto_2717 ?auto_2716 ) ) ( not ( = ?auto_2713 ?auto_2716 ) ) ( AVAILABLE ?auto_2711 ) ( IN ?auto_2707 ?auto_2715 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2708 ?auto_2709 )
      ( MAKE-2CRATE-VERIFY ?auto_2707 ?auto_2708 ?auto_2709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2718 - SURFACE
      ?auto_2719 - SURFACE
      ?auto_2720 - SURFACE
      ?auto_2721 - SURFACE
    )
    :vars
    (
      ?auto_2723 - HOIST
      ?auto_2727 - PLACE
      ?auto_2725 - PLACE
      ?auto_2726 - HOIST
      ?auto_2724 - SURFACE
      ?auto_2728 - SURFACE
      ?auto_2722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2723 ?auto_2727 ) ( IS-CRATE ?auto_2721 ) ( not ( = ?auto_2720 ?auto_2721 ) ) ( not ( = ?auto_2719 ?auto_2720 ) ) ( not ( = ?auto_2719 ?auto_2721 ) ) ( not ( = ?auto_2725 ?auto_2727 ) ) ( HOIST-AT ?auto_2726 ?auto_2725 ) ( not ( = ?auto_2723 ?auto_2726 ) ) ( SURFACE-AT ?auto_2721 ?auto_2725 ) ( ON ?auto_2721 ?auto_2724 ) ( CLEAR ?auto_2721 ) ( not ( = ?auto_2720 ?auto_2724 ) ) ( not ( = ?auto_2721 ?auto_2724 ) ) ( not ( = ?auto_2719 ?auto_2724 ) ) ( IS-CRATE ?auto_2720 ) ( AVAILABLE ?auto_2726 ) ( SURFACE-AT ?auto_2720 ?auto_2725 ) ( ON ?auto_2720 ?auto_2728 ) ( CLEAR ?auto_2720 ) ( not ( = ?auto_2720 ?auto_2728 ) ) ( not ( = ?auto_2721 ?auto_2728 ) ) ( not ( = ?auto_2719 ?auto_2728 ) ) ( not ( = ?auto_2724 ?auto_2728 ) ) ( TRUCK-AT ?auto_2722 ?auto_2727 ) ( SURFACE-AT ?auto_2718 ?auto_2727 ) ( CLEAR ?auto_2718 ) ( IS-CRATE ?auto_2719 ) ( not ( = ?auto_2718 ?auto_2719 ) ) ( not ( = ?auto_2720 ?auto_2718 ) ) ( not ( = ?auto_2721 ?auto_2718 ) ) ( not ( = ?auto_2724 ?auto_2718 ) ) ( not ( = ?auto_2728 ?auto_2718 ) ) ( AVAILABLE ?auto_2723 ) ( IN ?auto_2719 ?auto_2722 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2719 ?auto_2720 ?auto_2721 )
      ( MAKE-3CRATE-VERIFY ?auto_2718 ?auto_2719 ?auto_2720 ?auto_2721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2729 - SURFACE
      ?auto_2730 - SURFACE
    )
    :vars
    (
      ?auto_2732 - HOIST
      ?auto_2737 - PLACE
      ?auto_2733 - SURFACE
      ?auto_2735 - PLACE
      ?auto_2736 - HOIST
      ?auto_2734 - SURFACE
      ?auto_2738 - SURFACE
      ?auto_2739 - SURFACE
      ?auto_2731 - TRUCK
      ?auto_2740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2732 ?auto_2737 ) ( IS-CRATE ?auto_2730 ) ( not ( = ?auto_2729 ?auto_2730 ) ) ( not ( = ?auto_2733 ?auto_2729 ) ) ( not ( = ?auto_2733 ?auto_2730 ) ) ( not ( = ?auto_2735 ?auto_2737 ) ) ( HOIST-AT ?auto_2736 ?auto_2735 ) ( not ( = ?auto_2732 ?auto_2736 ) ) ( SURFACE-AT ?auto_2730 ?auto_2735 ) ( ON ?auto_2730 ?auto_2734 ) ( CLEAR ?auto_2730 ) ( not ( = ?auto_2729 ?auto_2734 ) ) ( not ( = ?auto_2730 ?auto_2734 ) ) ( not ( = ?auto_2733 ?auto_2734 ) ) ( IS-CRATE ?auto_2729 ) ( AVAILABLE ?auto_2736 ) ( SURFACE-AT ?auto_2729 ?auto_2735 ) ( ON ?auto_2729 ?auto_2738 ) ( CLEAR ?auto_2729 ) ( not ( = ?auto_2729 ?auto_2738 ) ) ( not ( = ?auto_2730 ?auto_2738 ) ) ( not ( = ?auto_2733 ?auto_2738 ) ) ( not ( = ?auto_2734 ?auto_2738 ) ) ( SURFACE-AT ?auto_2739 ?auto_2737 ) ( CLEAR ?auto_2739 ) ( IS-CRATE ?auto_2733 ) ( not ( = ?auto_2739 ?auto_2733 ) ) ( not ( = ?auto_2729 ?auto_2739 ) ) ( not ( = ?auto_2730 ?auto_2739 ) ) ( not ( = ?auto_2734 ?auto_2739 ) ) ( not ( = ?auto_2738 ?auto_2739 ) ) ( AVAILABLE ?auto_2732 ) ( IN ?auto_2733 ?auto_2731 ) ( TRUCK-AT ?auto_2731 ?auto_2740 ) ( not ( = ?auto_2740 ?auto_2737 ) ) ( not ( = ?auto_2735 ?auto_2740 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2731 ?auto_2740 ?auto_2737 )
      ( MAKE-2CRATE ?auto_2733 ?auto_2729 ?auto_2730 )
      ( MAKE-1CRATE-VERIFY ?auto_2729 ?auto_2730 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2741 - SURFACE
      ?auto_2742 - SURFACE
      ?auto_2743 - SURFACE
    )
    :vars
    (
      ?auto_2749 - HOIST
      ?auto_2752 - PLACE
      ?auto_2751 - PLACE
      ?auto_2747 - HOIST
      ?auto_2750 - SURFACE
      ?auto_2744 - SURFACE
      ?auto_2745 - SURFACE
      ?auto_2746 - TRUCK
      ?auto_2748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2749 ?auto_2752 ) ( IS-CRATE ?auto_2743 ) ( not ( = ?auto_2742 ?auto_2743 ) ) ( not ( = ?auto_2741 ?auto_2742 ) ) ( not ( = ?auto_2741 ?auto_2743 ) ) ( not ( = ?auto_2751 ?auto_2752 ) ) ( HOIST-AT ?auto_2747 ?auto_2751 ) ( not ( = ?auto_2749 ?auto_2747 ) ) ( SURFACE-AT ?auto_2743 ?auto_2751 ) ( ON ?auto_2743 ?auto_2750 ) ( CLEAR ?auto_2743 ) ( not ( = ?auto_2742 ?auto_2750 ) ) ( not ( = ?auto_2743 ?auto_2750 ) ) ( not ( = ?auto_2741 ?auto_2750 ) ) ( IS-CRATE ?auto_2742 ) ( AVAILABLE ?auto_2747 ) ( SURFACE-AT ?auto_2742 ?auto_2751 ) ( ON ?auto_2742 ?auto_2744 ) ( CLEAR ?auto_2742 ) ( not ( = ?auto_2742 ?auto_2744 ) ) ( not ( = ?auto_2743 ?auto_2744 ) ) ( not ( = ?auto_2741 ?auto_2744 ) ) ( not ( = ?auto_2750 ?auto_2744 ) ) ( SURFACE-AT ?auto_2745 ?auto_2752 ) ( CLEAR ?auto_2745 ) ( IS-CRATE ?auto_2741 ) ( not ( = ?auto_2745 ?auto_2741 ) ) ( not ( = ?auto_2742 ?auto_2745 ) ) ( not ( = ?auto_2743 ?auto_2745 ) ) ( not ( = ?auto_2750 ?auto_2745 ) ) ( not ( = ?auto_2744 ?auto_2745 ) ) ( AVAILABLE ?auto_2749 ) ( IN ?auto_2741 ?auto_2746 ) ( TRUCK-AT ?auto_2746 ?auto_2748 ) ( not ( = ?auto_2748 ?auto_2752 ) ) ( not ( = ?auto_2751 ?auto_2748 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2742 ?auto_2743 )
      ( MAKE-2CRATE-VERIFY ?auto_2741 ?auto_2742 ?auto_2743 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2753 - SURFACE
      ?auto_2754 - SURFACE
      ?auto_2755 - SURFACE
      ?auto_2756 - SURFACE
    )
    :vars
    (
      ?auto_2764 - HOIST
      ?auto_2757 - PLACE
      ?auto_2763 - PLACE
      ?auto_2760 - HOIST
      ?auto_2762 - SURFACE
      ?auto_2761 - SURFACE
      ?auto_2759 - TRUCK
      ?auto_2758 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2764 ?auto_2757 ) ( IS-CRATE ?auto_2756 ) ( not ( = ?auto_2755 ?auto_2756 ) ) ( not ( = ?auto_2754 ?auto_2755 ) ) ( not ( = ?auto_2754 ?auto_2756 ) ) ( not ( = ?auto_2763 ?auto_2757 ) ) ( HOIST-AT ?auto_2760 ?auto_2763 ) ( not ( = ?auto_2764 ?auto_2760 ) ) ( SURFACE-AT ?auto_2756 ?auto_2763 ) ( ON ?auto_2756 ?auto_2762 ) ( CLEAR ?auto_2756 ) ( not ( = ?auto_2755 ?auto_2762 ) ) ( not ( = ?auto_2756 ?auto_2762 ) ) ( not ( = ?auto_2754 ?auto_2762 ) ) ( IS-CRATE ?auto_2755 ) ( AVAILABLE ?auto_2760 ) ( SURFACE-AT ?auto_2755 ?auto_2763 ) ( ON ?auto_2755 ?auto_2761 ) ( CLEAR ?auto_2755 ) ( not ( = ?auto_2755 ?auto_2761 ) ) ( not ( = ?auto_2756 ?auto_2761 ) ) ( not ( = ?auto_2754 ?auto_2761 ) ) ( not ( = ?auto_2762 ?auto_2761 ) ) ( SURFACE-AT ?auto_2753 ?auto_2757 ) ( CLEAR ?auto_2753 ) ( IS-CRATE ?auto_2754 ) ( not ( = ?auto_2753 ?auto_2754 ) ) ( not ( = ?auto_2755 ?auto_2753 ) ) ( not ( = ?auto_2756 ?auto_2753 ) ) ( not ( = ?auto_2762 ?auto_2753 ) ) ( not ( = ?auto_2761 ?auto_2753 ) ) ( AVAILABLE ?auto_2764 ) ( IN ?auto_2754 ?auto_2759 ) ( TRUCK-AT ?auto_2759 ?auto_2758 ) ( not ( = ?auto_2758 ?auto_2757 ) ) ( not ( = ?auto_2763 ?auto_2758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2754 ?auto_2755 ?auto_2756 )
      ( MAKE-3CRATE-VERIFY ?auto_2753 ?auto_2754 ?auto_2755 ?auto_2756 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2765 - SURFACE
      ?auto_2766 - SURFACE
    )
    :vars
    (
      ?auto_2775 - HOIST
      ?auto_2767 - PLACE
      ?auto_2769 - SURFACE
      ?auto_2774 - PLACE
      ?auto_2771 - HOIST
      ?auto_2773 - SURFACE
      ?auto_2772 - SURFACE
      ?auto_2776 - SURFACE
      ?auto_2770 - TRUCK
      ?auto_2768 - PLACE
      ?auto_2777 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2775 ?auto_2767 ) ( IS-CRATE ?auto_2766 ) ( not ( = ?auto_2765 ?auto_2766 ) ) ( not ( = ?auto_2769 ?auto_2765 ) ) ( not ( = ?auto_2769 ?auto_2766 ) ) ( not ( = ?auto_2774 ?auto_2767 ) ) ( HOIST-AT ?auto_2771 ?auto_2774 ) ( not ( = ?auto_2775 ?auto_2771 ) ) ( SURFACE-AT ?auto_2766 ?auto_2774 ) ( ON ?auto_2766 ?auto_2773 ) ( CLEAR ?auto_2766 ) ( not ( = ?auto_2765 ?auto_2773 ) ) ( not ( = ?auto_2766 ?auto_2773 ) ) ( not ( = ?auto_2769 ?auto_2773 ) ) ( IS-CRATE ?auto_2765 ) ( AVAILABLE ?auto_2771 ) ( SURFACE-AT ?auto_2765 ?auto_2774 ) ( ON ?auto_2765 ?auto_2772 ) ( CLEAR ?auto_2765 ) ( not ( = ?auto_2765 ?auto_2772 ) ) ( not ( = ?auto_2766 ?auto_2772 ) ) ( not ( = ?auto_2769 ?auto_2772 ) ) ( not ( = ?auto_2773 ?auto_2772 ) ) ( SURFACE-AT ?auto_2776 ?auto_2767 ) ( CLEAR ?auto_2776 ) ( IS-CRATE ?auto_2769 ) ( not ( = ?auto_2776 ?auto_2769 ) ) ( not ( = ?auto_2765 ?auto_2776 ) ) ( not ( = ?auto_2766 ?auto_2776 ) ) ( not ( = ?auto_2773 ?auto_2776 ) ) ( not ( = ?auto_2772 ?auto_2776 ) ) ( AVAILABLE ?auto_2775 ) ( TRUCK-AT ?auto_2770 ?auto_2768 ) ( not ( = ?auto_2768 ?auto_2767 ) ) ( not ( = ?auto_2774 ?auto_2768 ) ) ( HOIST-AT ?auto_2777 ?auto_2768 ) ( LIFTING ?auto_2777 ?auto_2769 ) ( not ( = ?auto_2775 ?auto_2777 ) ) ( not ( = ?auto_2771 ?auto_2777 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2777 ?auto_2769 ?auto_2770 ?auto_2768 )
      ( MAKE-2CRATE ?auto_2769 ?auto_2765 ?auto_2766 )
      ( MAKE-1CRATE-VERIFY ?auto_2765 ?auto_2766 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2778 - SURFACE
      ?auto_2779 - SURFACE
      ?auto_2780 - SURFACE
    )
    :vars
    (
      ?auto_2788 - HOIST
      ?auto_2784 - PLACE
      ?auto_2785 - PLACE
      ?auto_2786 - HOIST
      ?auto_2787 - SURFACE
      ?auto_2781 - SURFACE
      ?auto_2790 - SURFACE
      ?auto_2789 - TRUCK
      ?auto_2782 - PLACE
      ?auto_2783 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2788 ?auto_2784 ) ( IS-CRATE ?auto_2780 ) ( not ( = ?auto_2779 ?auto_2780 ) ) ( not ( = ?auto_2778 ?auto_2779 ) ) ( not ( = ?auto_2778 ?auto_2780 ) ) ( not ( = ?auto_2785 ?auto_2784 ) ) ( HOIST-AT ?auto_2786 ?auto_2785 ) ( not ( = ?auto_2788 ?auto_2786 ) ) ( SURFACE-AT ?auto_2780 ?auto_2785 ) ( ON ?auto_2780 ?auto_2787 ) ( CLEAR ?auto_2780 ) ( not ( = ?auto_2779 ?auto_2787 ) ) ( not ( = ?auto_2780 ?auto_2787 ) ) ( not ( = ?auto_2778 ?auto_2787 ) ) ( IS-CRATE ?auto_2779 ) ( AVAILABLE ?auto_2786 ) ( SURFACE-AT ?auto_2779 ?auto_2785 ) ( ON ?auto_2779 ?auto_2781 ) ( CLEAR ?auto_2779 ) ( not ( = ?auto_2779 ?auto_2781 ) ) ( not ( = ?auto_2780 ?auto_2781 ) ) ( not ( = ?auto_2778 ?auto_2781 ) ) ( not ( = ?auto_2787 ?auto_2781 ) ) ( SURFACE-AT ?auto_2790 ?auto_2784 ) ( CLEAR ?auto_2790 ) ( IS-CRATE ?auto_2778 ) ( not ( = ?auto_2790 ?auto_2778 ) ) ( not ( = ?auto_2779 ?auto_2790 ) ) ( not ( = ?auto_2780 ?auto_2790 ) ) ( not ( = ?auto_2787 ?auto_2790 ) ) ( not ( = ?auto_2781 ?auto_2790 ) ) ( AVAILABLE ?auto_2788 ) ( TRUCK-AT ?auto_2789 ?auto_2782 ) ( not ( = ?auto_2782 ?auto_2784 ) ) ( not ( = ?auto_2785 ?auto_2782 ) ) ( HOIST-AT ?auto_2783 ?auto_2782 ) ( LIFTING ?auto_2783 ?auto_2778 ) ( not ( = ?auto_2788 ?auto_2783 ) ) ( not ( = ?auto_2786 ?auto_2783 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2779 ?auto_2780 )
      ( MAKE-2CRATE-VERIFY ?auto_2778 ?auto_2779 ?auto_2780 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2791 - SURFACE
      ?auto_2792 - SURFACE
      ?auto_2793 - SURFACE
      ?auto_2794 - SURFACE
    )
    :vars
    (
      ?auto_2796 - HOIST
      ?auto_2800 - PLACE
      ?auto_2797 - PLACE
      ?auto_2795 - HOIST
      ?auto_2798 - SURFACE
      ?auto_2801 - SURFACE
      ?auto_2802 - TRUCK
      ?auto_2803 - PLACE
      ?auto_2799 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2796 ?auto_2800 ) ( IS-CRATE ?auto_2794 ) ( not ( = ?auto_2793 ?auto_2794 ) ) ( not ( = ?auto_2792 ?auto_2793 ) ) ( not ( = ?auto_2792 ?auto_2794 ) ) ( not ( = ?auto_2797 ?auto_2800 ) ) ( HOIST-AT ?auto_2795 ?auto_2797 ) ( not ( = ?auto_2796 ?auto_2795 ) ) ( SURFACE-AT ?auto_2794 ?auto_2797 ) ( ON ?auto_2794 ?auto_2798 ) ( CLEAR ?auto_2794 ) ( not ( = ?auto_2793 ?auto_2798 ) ) ( not ( = ?auto_2794 ?auto_2798 ) ) ( not ( = ?auto_2792 ?auto_2798 ) ) ( IS-CRATE ?auto_2793 ) ( AVAILABLE ?auto_2795 ) ( SURFACE-AT ?auto_2793 ?auto_2797 ) ( ON ?auto_2793 ?auto_2801 ) ( CLEAR ?auto_2793 ) ( not ( = ?auto_2793 ?auto_2801 ) ) ( not ( = ?auto_2794 ?auto_2801 ) ) ( not ( = ?auto_2792 ?auto_2801 ) ) ( not ( = ?auto_2798 ?auto_2801 ) ) ( SURFACE-AT ?auto_2791 ?auto_2800 ) ( CLEAR ?auto_2791 ) ( IS-CRATE ?auto_2792 ) ( not ( = ?auto_2791 ?auto_2792 ) ) ( not ( = ?auto_2793 ?auto_2791 ) ) ( not ( = ?auto_2794 ?auto_2791 ) ) ( not ( = ?auto_2798 ?auto_2791 ) ) ( not ( = ?auto_2801 ?auto_2791 ) ) ( AVAILABLE ?auto_2796 ) ( TRUCK-AT ?auto_2802 ?auto_2803 ) ( not ( = ?auto_2803 ?auto_2800 ) ) ( not ( = ?auto_2797 ?auto_2803 ) ) ( HOIST-AT ?auto_2799 ?auto_2803 ) ( LIFTING ?auto_2799 ?auto_2792 ) ( not ( = ?auto_2796 ?auto_2799 ) ) ( not ( = ?auto_2795 ?auto_2799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2792 ?auto_2793 ?auto_2794 )
      ( MAKE-3CRATE-VERIFY ?auto_2791 ?auto_2792 ?auto_2793 ?auto_2794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2804 - SURFACE
      ?auto_2805 - SURFACE
    )
    :vars
    (
      ?auto_2807 - HOIST
      ?auto_2811 - PLACE
      ?auto_2816 - SURFACE
      ?auto_2808 - PLACE
      ?auto_2806 - HOIST
      ?auto_2809 - SURFACE
      ?auto_2813 - SURFACE
      ?auto_2812 - SURFACE
      ?auto_2814 - TRUCK
      ?auto_2815 - PLACE
      ?auto_2810 - HOIST
      ?auto_2817 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2807 ?auto_2811 ) ( IS-CRATE ?auto_2805 ) ( not ( = ?auto_2804 ?auto_2805 ) ) ( not ( = ?auto_2816 ?auto_2804 ) ) ( not ( = ?auto_2816 ?auto_2805 ) ) ( not ( = ?auto_2808 ?auto_2811 ) ) ( HOIST-AT ?auto_2806 ?auto_2808 ) ( not ( = ?auto_2807 ?auto_2806 ) ) ( SURFACE-AT ?auto_2805 ?auto_2808 ) ( ON ?auto_2805 ?auto_2809 ) ( CLEAR ?auto_2805 ) ( not ( = ?auto_2804 ?auto_2809 ) ) ( not ( = ?auto_2805 ?auto_2809 ) ) ( not ( = ?auto_2816 ?auto_2809 ) ) ( IS-CRATE ?auto_2804 ) ( AVAILABLE ?auto_2806 ) ( SURFACE-AT ?auto_2804 ?auto_2808 ) ( ON ?auto_2804 ?auto_2813 ) ( CLEAR ?auto_2804 ) ( not ( = ?auto_2804 ?auto_2813 ) ) ( not ( = ?auto_2805 ?auto_2813 ) ) ( not ( = ?auto_2816 ?auto_2813 ) ) ( not ( = ?auto_2809 ?auto_2813 ) ) ( SURFACE-AT ?auto_2812 ?auto_2811 ) ( CLEAR ?auto_2812 ) ( IS-CRATE ?auto_2816 ) ( not ( = ?auto_2812 ?auto_2816 ) ) ( not ( = ?auto_2804 ?auto_2812 ) ) ( not ( = ?auto_2805 ?auto_2812 ) ) ( not ( = ?auto_2809 ?auto_2812 ) ) ( not ( = ?auto_2813 ?auto_2812 ) ) ( AVAILABLE ?auto_2807 ) ( TRUCK-AT ?auto_2814 ?auto_2815 ) ( not ( = ?auto_2815 ?auto_2811 ) ) ( not ( = ?auto_2808 ?auto_2815 ) ) ( HOIST-AT ?auto_2810 ?auto_2815 ) ( not ( = ?auto_2807 ?auto_2810 ) ) ( not ( = ?auto_2806 ?auto_2810 ) ) ( AVAILABLE ?auto_2810 ) ( SURFACE-AT ?auto_2816 ?auto_2815 ) ( ON ?auto_2816 ?auto_2817 ) ( CLEAR ?auto_2816 ) ( not ( = ?auto_2804 ?auto_2817 ) ) ( not ( = ?auto_2805 ?auto_2817 ) ) ( not ( = ?auto_2816 ?auto_2817 ) ) ( not ( = ?auto_2809 ?auto_2817 ) ) ( not ( = ?auto_2813 ?auto_2817 ) ) ( not ( = ?auto_2812 ?auto_2817 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2810 ?auto_2816 ?auto_2817 ?auto_2815 )
      ( MAKE-2CRATE ?auto_2816 ?auto_2804 ?auto_2805 )
      ( MAKE-1CRATE-VERIFY ?auto_2804 ?auto_2805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2818 - SURFACE
      ?auto_2819 - SURFACE
      ?auto_2820 - SURFACE
    )
    :vars
    (
      ?auto_2827 - HOIST
      ?auto_2824 - PLACE
      ?auto_2826 - PLACE
      ?auto_2829 - HOIST
      ?auto_2825 - SURFACE
      ?auto_2830 - SURFACE
      ?auto_2823 - SURFACE
      ?auto_2821 - TRUCK
      ?auto_2831 - PLACE
      ?auto_2828 - HOIST
      ?auto_2822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2827 ?auto_2824 ) ( IS-CRATE ?auto_2820 ) ( not ( = ?auto_2819 ?auto_2820 ) ) ( not ( = ?auto_2818 ?auto_2819 ) ) ( not ( = ?auto_2818 ?auto_2820 ) ) ( not ( = ?auto_2826 ?auto_2824 ) ) ( HOIST-AT ?auto_2829 ?auto_2826 ) ( not ( = ?auto_2827 ?auto_2829 ) ) ( SURFACE-AT ?auto_2820 ?auto_2826 ) ( ON ?auto_2820 ?auto_2825 ) ( CLEAR ?auto_2820 ) ( not ( = ?auto_2819 ?auto_2825 ) ) ( not ( = ?auto_2820 ?auto_2825 ) ) ( not ( = ?auto_2818 ?auto_2825 ) ) ( IS-CRATE ?auto_2819 ) ( AVAILABLE ?auto_2829 ) ( SURFACE-AT ?auto_2819 ?auto_2826 ) ( ON ?auto_2819 ?auto_2830 ) ( CLEAR ?auto_2819 ) ( not ( = ?auto_2819 ?auto_2830 ) ) ( not ( = ?auto_2820 ?auto_2830 ) ) ( not ( = ?auto_2818 ?auto_2830 ) ) ( not ( = ?auto_2825 ?auto_2830 ) ) ( SURFACE-AT ?auto_2823 ?auto_2824 ) ( CLEAR ?auto_2823 ) ( IS-CRATE ?auto_2818 ) ( not ( = ?auto_2823 ?auto_2818 ) ) ( not ( = ?auto_2819 ?auto_2823 ) ) ( not ( = ?auto_2820 ?auto_2823 ) ) ( not ( = ?auto_2825 ?auto_2823 ) ) ( not ( = ?auto_2830 ?auto_2823 ) ) ( AVAILABLE ?auto_2827 ) ( TRUCK-AT ?auto_2821 ?auto_2831 ) ( not ( = ?auto_2831 ?auto_2824 ) ) ( not ( = ?auto_2826 ?auto_2831 ) ) ( HOIST-AT ?auto_2828 ?auto_2831 ) ( not ( = ?auto_2827 ?auto_2828 ) ) ( not ( = ?auto_2829 ?auto_2828 ) ) ( AVAILABLE ?auto_2828 ) ( SURFACE-AT ?auto_2818 ?auto_2831 ) ( ON ?auto_2818 ?auto_2822 ) ( CLEAR ?auto_2818 ) ( not ( = ?auto_2819 ?auto_2822 ) ) ( not ( = ?auto_2820 ?auto_2822 ) ) ( not ( = ?auto_2818 ?auto_2822 ) ) ( not ( = ?auto_2825 ?auto_2822 ) ) ( not ( = ?auto_2830 ?auto_2822 ) ) ( not ( = ?auto_2823 ?auto_2822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2819 ?auto_2820 )
      ( MAKE-2CRATE-VERIFY ?auto_2818 ?auto_2819 ?auto_2820 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2832 - SURFACE
      ?auto_2833 - SURFACE
      ?auto_2834 - SURFACE
      ?auto_2835 - SURFACE
    )
    :vars
    (
      ?auto_2844 - HOIST
      ?auto_2842 - PLACE
      ?auto_2843 - PLACE
      ?auto_2845 - HOIST
      ?auto_2840 - SURFACE
      ?auto_2839 - SURFACE
      ?auto_2841 - TRUCK
      ?auto_2836 - PLACE
      ?auto_2838 - HOIST
      ?auto_2837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2844 ?auto_2842 ) ( IS-CRATE ?auto_2835 ) ( not ( = ?auto_2834 ?auto_2835 ) ) ( not ( = ?auto_2833 ?auto_2834 ) ) ( not ( = ?auto_2833 ?auto_2835 ) ) ( not ( = ?auto_2843 ?auto_2842 ) ) ( HOIST-AT ?auto_2845 ?auto_2843 ) ( not ( = ?auto_2844 ?auto_2845 ) ) ( SURFACE-AT ?auto_2835 ?auto_2843 ) ( ON ?auto_2835 ?auto_2840 ) ( CLEAR ?auto_2835 ) ( not ( = ?auto_2834 ?auto_2840 ) ) ( not ( = ?auto_2835 ?auto_2840 ) ) ( not ( = ?auto_2833 ?auto_2840 ) ) ( IS-CRATE ?auto_2834 ) ( AVAILABLE ?auto_2845 ) ( SURFACE-AT ?auto_2834 ?auto_2843 ) ( ON ?auto_2834 ?auto_2839 ) ( CLEAR ?auto_2834 ) ( not ( = ?auto_2834 ?auto_2839 ) ) ( not ( = ?auto_2835 ?auto_2839 ) ) ( not ( = ?auto_2833 ?auto_2839 ) ) ( not ( = ?auto_2840 ?auto_2839 ) ) ( SURFACE-AT ?auto_2832 ?auto_2842 ) ( CLEAR ?auto_2832 ) ( IS-CRATE ?auto_2833 ) ( not ( = ?auto_2832 ?auto_2833 ) ) ( not ( = ?auto_2834 ?auto_2832 ) ) ( not ( = ?auto_2835 ?auto_2832 ) ) ( not ( = ?auto_2840 ?auto_2832 ) ) ( not ( = ?auto_2839 ?auto_2832 ) ) ( AVAILABLE ?auto_2844 ) ( TRUCK-AT ?auto_2841 ?auto_2836 ) ( not ( = ?auto_2836 ?auto_2842 ) ) ( not ( = ?auto_2843 ?auto_2836 ) ) ( HOIST-AT ?auto_2838 ?auto_2836 ) ( not ( = ?auto_2844 ?auto_2838 ) ) ( not ( = ?auto_2845 ?auto_2838 ) ) ( AVAILABLE ?auto_2838 ) ( SURFACE-AT ?auto_2833 ?auto_2836 ) ( ON ?auto_2833 ?auto_2837 ) ( CLEAR ?auto_2833 ) ( not ( = ?auto_2834 ?auto_2837 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( not ( = ?auto_2833 ?auto_2837 ) ) ( not ( = ?auto_2840 ?auto_2837 ) ) ( not ( = ?auto_2839 ?auto_2837 ) ) ( not ( = ?auto_2832 ?auto_2837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2833 ?auto_2834 ?auto_2835 )
      ( MAKE-3CRATE-VERIFY ?auto_2832 ?auto_2833 ?auto_2834 ?auto_2835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2846 - SURFACE
      ?auto_2847 - SURFACE
    )
    :vars
    (
      ?auto_2857 - HOIST
      ?auto_2854 - PLACE
      ?auto_2859 - SURFACE
      ?auto_2855 - PLACE
      ?auto_2858 - HOIST
      ?auto_2852 - SURFACE
      ?auto_2851 - SURFACE
      ?auto_2856 - SURFACE
      ?auto_2848 - PLACE
      ?auto_2850 - HOIST
      ?auto_2849 - SURFACE
      ?auto_2853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2857 ?auto_2854 ) ( IS-CRATE ?auto_2847 ) ( not ( = ?auto_2846 ?auto_2847 ) ) ( not ( = ?auto_2859 ?auto_2846 ) ) ( not ( = ?auto_2859 ?auto_2847 ) ) ( not ( = ?auto_2855 ?auto_2854 ) ) ( HOIST-AT ?auto_2858 ?auto_2855 ) ( not ( = ?auto_2857 ?auto_2858 ) ) ( SURFACE-AT ?auto_2847 ?auto_2855 ) ( ON ?auto_2847 ?auto_2852 ) ( CLEAR ?auto_2847 ) ( not ( = ?auto_2846 ?auto_2852 ) ) ( not ( = ?auto_2847 ?auto_2852 ) ) ( not ( = ?auto_2859 ?auto_2852 ) ) ( IS-CRATE ?auto_2846 ) ( AVAILABLE ?auto_2858 ) ( SURFACE-AT ?auto_2846 ?auto_2855 ) ( ON ?auto_2846 ?auto_2851 ) ( CLEAR ?auto_2846 ) ( not ( = ?auto_2846 ?auto_2851 ) ) ( not ( = ?auto_2847 ?auto_2851 ) ) ( not ( = ?auto_2859 ?auto_2851 ) ) ( not ( = ?auto_2852 ?auto_2851 ) ) ( SURFACE-AT ?auto_2856 ?auto_2854 ) ( CLEAR ?auto_2856 ) ( IS-CRATE ?auto_2859 ) ( not ( = ?auto_2856 ?auto_2859 ) ) ( not ( = ?auto_2846 ?auto_2856 ) ) ( not ( = ?auto_2847 ?auto_2856 ) ) ( not ( = ?auto_2852 ?auto_2856 ) ) ( not ( = ?auto_2851 ?auto_2856 ) ) ( AVAILABLE ?auto_2857 ) ( not ( = ?auto_2848 ?auto_2854 ) ) ( not ( = ?auto_2855 ?auto_2848 ) ) ( HOIST-AT ?auto_2850 ?auto_2848 ) ( not ( = ?auto_2857 ?auto_2850 ) ) ( not ( = ?auto_2858 ?auto_2850 ) ) ( AVAILABLE ?auto_2850 ) ( SURFACE-AT ?auto_2859 ?auto_2848 ) ( ON ?auto_2859 ?auto_2849 ) ( CLEAR ?auto_2859 ) ( not ( = ?auto_2846 ?auto_2849 ) ) ( not ( = ?auto_2847 ?auto_2849 ) ) ( not ( = ?auto_2859 ?auto_2849 ) ) ( not ( = ?auto_2852 ?auto_2849 ) ) ( not ( = ?auto_2851 ?auto_2849 ) ) ( not ( = ?auto_2856 ?auto_2849 ) ) ( TRUCK-AT ?auto_2853 ?auto_2854 ) )
    :subtasks
    ( ( !DRIVE ?auto_2853 ?auto_2854 ?auto_2848 )
      ( MAKE-2CRATE ?auto_2859 ?auto_2846 ?auto_2847 )
      ( MAKE-1CRATE-VERIFY ?auto_2846 ?auto_2847 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2860 - SURFACE
      ?auto_2861 - SURFACE
      ?auto_2862 - SURFACE
    )
    :vars
    (
      ?auto_2867 - HOIST
      ?auto_2864 - PLACE
      ?auto_2869 - PLACE
      ?auto_2872 - HOIST
      ?auto_2868 - SURFACE
      ?auto_2866 - SURFACE
      ?auto_2870 - SURFACE
      ?auto_2873 - PLACE
      ?auto_2871 - HOIST
      ?auto_2863 - SURFACE
      ?auto_2865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2867 ?auto_2864 ) ( IS-CRATE ?auto_2862 ) ( not ( = ?auto_2861 ?auto_2862 ) ) ( not ( = ?auto_2860 ?auto_2861 ) ) ( not ( = ?auto_2860 ?auto_2862 ) ) ( not ( = ?auto_2869 ?auto_2864 ) ) ( HOIST-AT ?auto_2872 ?auto_2869 ) ( not ( = ?auto_2867 ?auto_2872 ) ) ( SURFACE-AT ?auto_2862 ?auto_2869 ) ( ON ?auto_2862 ?auto_2868 ) ( CLEAR ?auto_2862 ) ( not ( = ?auto_2861 ?auto_2868 ) ) ( not ( = ?auto_2862 ?auto_2868 ) ) ( not ( = ?auto_2860 ?auto_2868 ) ) ( IS-CRATE ?auto_2861 ) ( AVAILABLE ?auto_2872 ) ( SURFACE-AT ?auto_2861 ?auto_2869 ) ( ON ?auto_2861 ?auto_2866 ) ( CLEAR ?auto_2861 ) ( not ( = ?auto_2861 ?auto_2866 ) ) ( not ( = ?auto_2862 ?auto_2866 ) ) ( not ( = ?auto_2860 ?auto_2866 ) ) ( not ( = ?auto_2868 ?auto_2866 ) ) ( SURFACE-AT ?auto_2870 ?auto_2864 ) ( CLEAR ?auto_2870 ) ( IS-CRATE ?auto_2860 ) ( not ( = ?auto_2870 ?auto_2860 ) ) ( not ( = ?auto_2861 ?auto_2870 ) ) ( not ( = ?auto_2862 ?auto_2870 ) ) ( not ( = ?auto_2868 ?auto_2870 ) ) ( not ( = ?auto_2866 ?auto_2870 ) ) ( AVAILABLE ?auto_2867 ) ( not ( = ?auto_2873 ?auto_2864 ) ) ( not ( = ?auto_2869 ?auto_2873 ) ) ( HOIST-AT ?auto_2871 ?auto_2873 ) ( not ( = ?auto_2867 ?auto_2871 ) ) ( not ( = ?auto_2872 ?auto_2871 ) ) ( AVAILABLE ?auto_2871 ) ( SURFACE-AT ?auto_2860 ?auto_2873 ) ( ON ?auto_2860 ?auto_2863 ) ( CLEAR ?auto_2860 ) ( not ( = ?auto_2861 ?auto_2863 ) ) ( not ( = ?auto_2862 ?auto_2863 ) ) ( not ( = ?auto_2860 ?auto_2863 ) ) ( not ( = ?auto_2868 ?auto_2863 ) ) ( not ( = ?auto_2866 ?auto_2863 ) ) ( not ( = ?auto_2870 ?auto_2863 ) ) ( TRUCK-AT ?auto_2865 ?auto_2864 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2861 ?auto_2862 )
      ( MAKE-2CRATE-VERIFY ?auto_2860 ?auto_2861 ?auto_2862 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2874 - SURFACE
      ?auto_2875 - SURFACE
      ?auto_2876 - SURFACE
      ?auto_2877 - SURFACE
    )
    :vars
    (
      ?auto_2884 - HOIST
      ?auto_2886 - PLACE
      ?auto_2885 - PLACE
      ?auto_2880 - HOIST
      ?auto_2878 - SURFACE
      ?auto_2881 - SURFACE
      ?auto_2882 - PLACE
      ?auto_2883 - HOIST
      ?auto_2887 - SURFACE
      ?auto_2879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2884 ?auto_2886 ) ( IS-CRATE ?auto_2877 ) ( not ( = ?auto_2876 ?auto_2877 ) ) ( not ( = ?auto_2875 ?auto_2876 ) ) ( not ( = ?auto_2875 ?auto_2877 ) ) ( not ( = ?auto_2885 ?auto_2886 ) ) ( HOIST-AT ?auto_2880 ?auto_2885 ) ( not ( = ?auto_2884 ?auto_2880 ) ) ( SURFACE-AT ?auto_2877 ?auto_2885 ) ( ON ?auto_2877 ?auto_2878 ) ( CLEAR ?auto_2877 ) ( not ( = ?auto_2876 ?auto_2878 ) ) ( not ( = ?auto_2877 ?auto_2878 ) ) ( not ( = ?auto_2875 ?auto_2878 ) ) ( IS-CRATE ?auto_2876 ) ( AVAILABLE ?auto_2880 ) ( SURFACE-AT ?auto_2876 ?auto_2885 ) ( ON ?auto_2876 ?auto_2881 ) ( CLEAR ?auto_2876 ) ( not ( = ?auto_2876 ?auto_2881 ) ) ( not ( = ?auto_2877 ?auto_2881 ) ) ( not ( = ?auto_2875 ?auto_2881 ) ) ( not ( = ?auto_2878 ?auto_2881 ) ) ( SURFACE-AT ?auto_2874 ?auto_2886 ) ( CLEAR ?auto_2874 ) ( IS-CRATE ?auto_2875 ) ( not ( = ?auto_2874 ?auto_2875 ) ) ( not ( = ?auto_2876 ?auto_2874 ) ) ( not ( = ?auto_2877 ?auto_2874 ) ) ( not ( = ?auto_2878 ?auto_2874 ) ) ( not ( = ?auto_2881 ?auto_2874 ) ) ( AVAILABLE ?auto_2884 ) ( not ( = ?auto_2882 ?auto_2886 ) ) ( not ( = ?auto_2885 ?auto_2882 ) ) ( HOIST-AT ?auto_2883 ?auto_2882 ) ( not ( = ?auto_2884 ?auto_2883 ) ) ( not ( = ?auto_2880 ?auto_2883 ) ) ( AVAILABLE ?auto_2883 ) ( SURFACE-AT ?auto_2875 ?auto_2882 ) ( ON ?auto_2875 ?auto_2887 ) ( CLEAR ?auto_2875 ) ( not ( = ?auto_2876 ?auto_2887 ) ) ( not ( = ?auto_2877 ?auto_2887 ) ) ( not ( = ?auto_2875 ?auto_2887 ) ) ( not ( = ?auto_2878 ?auto_2887 ) ) ( not ( = ?auto_2881 ?auto_2887 ) ) ( not ( = ?auto_2874 ?auto_2887 ) ) ( TRUCK-AT ?auto_2879 ?auto_2886 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2875 ?auto_2876 ?auto_2877 )
      ( MAKE-3CRATE-VERIFY ?auto_2874 ?auto_2875 ?auto_2876 ?auto_2877 ) )
  )

)

