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
      ?auto_2021 - BLOCK
    )
    :vars
    (
      ?auto_2022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2021 ?auto_2022 ) ( CLEAR ?auto_2021 ) ( HAND-EMPTY ) ( not ( = ?auto_2021 ?auto_2022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2021 ?auto_2022 )
      ( !PUTDOWN ?auto_2021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2028 - BLOCK
      ?auto_2029 - BLOCK
    )
    :vars
    (
      ?auto_2030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2028 ) ( ON ?auto_2029 ?auto_2030 ) ( CLEAR ?auto_2029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2028 ) ( not ( = ?auto_2028 ?auto_2029 ) ) ( not ( = ?auto_2028 ?auto_2030 ) ) ( not ( = ?auto_2029 ?auto_2030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2029 ?auto_2030 )
      ( !STACK ?auto_2029 ?auto_2028 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2038 - BLOCK
      ?auto_2039 - BLOCK
    )
    :vars
    (
      ?auto_2040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2039 ?auto_2040 ) ( not ( = ?auto_2038 ?auto_2039 ) ) ( not ( = ?auto_2038 ?auto_2040 ) ) ( not ( = ?auto_2039 ?auto_2040 ) ) ( ON ?auto_2038 ?auto_2039 ) ( CLEAR ?auto_2038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2038 )
      ( MAKE-2PILE ?auto_2038 ?auto_2039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2049 - BLOCK
      ?auto_2050 - BLOCK
      ?auto_2051 - BLOCK
    )
    :vars
    (
      ?auto_2052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2050 ) ( ON ?auto_2051 ?auto_2052 ) ( CLEAR ?auto_2051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2049 ) ( ON ?auto_2050 ?auto_2049 ) ( not ( = ?auto_2049 ?auto_2050 ) ) ( not ( = ?auto_2049 ?auto_2051 ) ) ( not ( = ?auto_2049 ?auto_2052 ) ) ( not ( = ?auto_2050 ?auto_2051 ) ) ( not ( = ?auto_2050 ?auto_2052 ) ) ( not ( = ?auto_2051 ?auto_2052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2051 ?auto_2052 )
      ( !STACK ?auto_2051 ?auto_2050 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2063 - BLOCK
      ?auto_2064 - BLOCK
      ?auto_2065 - BLOCK
    )
    :vars
    (
      ?auto_2066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2065 ?auto_2066 ) ( ON-TABLE ?auto_2063 ) ( not ( = ?auto_2063 ?auto_2064 ) ) ( not ( = ?auto_2063 ?auto_2065 ) ) ( not ( = ?auto_2063 ?auto_2066 ) ) ( not ( = ?auto_2064 ?auto_2065 ) ) ( not ( = ?auto_2064 ?auto_2066 ) ) ( not ( = ?auto_2065 ?auto_2066 ) ) ( CLEAR ?auto_2063 ) ( ON ?auto_2064 ?auto_2065 ) ( CLEAR ?auto_2064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2063 ?auto_2064 )
      ( MAKE-3PILE ?auto_2063 ?auto_2064 ?auto_2065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2077 - BLOCK
      ?auto_2078 - BLOCK
      ?auto_2079 - BLOCK
    )
    :vars
    (
      ?auto_2080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2079 ?auto_2080 ) ( not ( = ?auto_2077 ?auto_2078 ) ) ( not ( = ?auto_2077 ?auto_2079 ) ) ( not ( = ?auto_2077 ?auto_2080 ) ) ( not ( = ?auto_2078 ?auto_2079 ) ) ( not ( = ?auto_2078 ?auto_2080 ) ) ( not ( = ?auto_2079 ?auto_2080 ) ) ( ON ?auto_2078 ?auto_2079 ) ( ON ?auto_2077 ?auto_2078 ) ( CLEAR ?auto_2077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2077 )
      ( MAKE-3PILE ?auto_2077 ?auto_2078 ?auto_2079 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2092 - BLOCK
      ?auto_2093 - BLOCK
      ?auto_2094 - BLOCK
      ?auto_2095 - BLOCK
    )
    :vars
    (
      ?auto_2096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2094 ) ( ON ?auto_2095 ?auto_2096 ) ( CLEAR ?auto_2095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2092 ) ( ON ?auto_2093 ?auto_2092 ) ( ON ?auto_2094 ?auto_2093 ) ( not ( = ?auto_2092 ?auto_2093 ) ) ( not ( = ?auto_2092 ?auto_2094 ) ) ( not ( = ?auto_2092 ?auto_2095 ) ) ( not ( = ?auto_2092 ?auto_2096 ) ) ( not ( = ?auto_2093 ?auto_2094 ) ) ( not ( = ?auto_2093 ?auto_2095 ) ) ( not ( = ?auto_2093 ?auto_2096 ) ) ( not ( = ?auto_2094 ?auto_2095 ) ) ( not ( = ?auto_2094 ?auto_2096 ) ) ( not ( = ?auto_2095 ?auto_2096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2095 ?auto_2096 )
      ( !STACK ?auto_2095 ?auto_2094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2101 - BLOCK
      ?auto_2102 - BLOCK
      ?auto_2103 - BLOCK
      ?auto_2104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2103 ) ( ON-TABLE ?auto_2104 ) ( CLEAR ?auto_2104 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2101 ) ( ON ?auto_2102 ?auto_2101 ) ( ON ?auto_2103 ?auto_2102 ) ( not ( = ?auto_2101 ?auto_2102 ) ) ( not ( = ?auto_2101 ?auto_2103 ) ) ( not ( = ?auto_2101 ?auto_2104 ) ) ( not ( = ?auto_2102 ?auto_2103 ) ) ( not ( = ?auto_2102 ?auto_2104 ) ) ( not ( = ?auto_2103 ?auto_2104 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_2104 )
      ( !STACK ?auto_2104 ?auto_2103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2109 - BLOCK
      ?auto_2110 - BLOCK
      ?auto_2111 - BLOCK
      ?auto_2112 - BLOCK
    )
    :vars
    (
      ?auto_2113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2112 ?auto_2113 ) ( ON-TABLE ?auto_2109 ) ( ON ?auto_2110 ?auto_2109 ) ( not ( = ?auto_2109 ?auto_2110 ) ) ( not ( = ?auto_2109 ?auto_2111 ) ) ( not ( = ?auto_2109 ?auto_2112 ) ) ( not ( = ?auto_2109 ?auto_2113 ) ) ( not ( = ?auto_2110 ?auto_2111 ) ) ( not ( = ?auto_2110 ?auto_2112 ) ) ( not ( = ?auto_2110 ?auto_2113 ) ) ( not ( = ?auto_2111 ?auto_2112 ) ) ( not ( = ?auto_2111 ?auto_2113 ) ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( CLEAR ?auto_2110 ) ( ON ?auto_2111 ?auto_2112 ) ( CLEAR ?auto_2111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2109 ?auto_2110 ?auto_2111 )
      ( MAKE-4PILE ?auto_2109 ?auto_2110 ?auto_2111 ?auto_2112 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2118 - BLOCK
      ?auto_2119 - BLOCK
      ?auto_2120 - BLOCK
      ?auto_2121 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2121 ) ( ON-TABLE ?auto_2118 ) ( ON ?auto_2119 ?auto_2118 ) ( not ( = ?auto_2118 ?auto_2119 ) ) ( not ( = ?auto_2118 ?auto_2120 ) ) ( not ( = ?auto_2118 ?auto_2121 ) ) ( not ( = ?auto_2119 ?auto_2120 ) ) ( not ( = ?auto_2119 ?auto_2121 ) ) ( not ( = ?auto_2120 ?auto_2121 ) ) ( CLEAR ?auto_2119 ) ( ON ?auto_2120 ?auto_2121 ) ( CLEAR ?auto_2120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2118 ?auto_2119 ?auto_2120 )
      ( MAKE-4PILE ?auto_2118 ?auto_2119 ?auto_2120 ?auto_2121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2126 - BLOCK
      ?auto_2127 - BLOCK
      ?auto_2128 - BLOCK
      ?auto_2129 - BLOCK
    )
    :vars
    (
      ?auto_2130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2129 ?auto_2130 ) ( ON-TABLE ?auto_2126 ) ( not ( = ?auto_2126 ?auto_2127 ) ) ( not ( = ?auto_2126 ?auto_2128 ) ) ( not ( = ?auto_2126 ?auto_2129 ) ) ( not ( = ?auto_2126 ?auto_2130 ) ) ( not ( = ?auto_2127 ?auto_2128 ) ) ( not ( = ?auto_2127 ?auto_2129 ) ) ( not ( = ?auto_2127 ?auto_2130 ) ) ( not ( = ?auto_2128 ?auto_2129 ) ) ( not ( = ?auto_2128 ?auto_2130 ) ) ( not ( = ?auto_2129 ?auto_2130 ) ) ( ON ?auto_2128 ?auto_2129 ) ( CLEAR ?auto_2126 ) ( ON ?auto_2127 ?auto_2128 ) ( CLEAR ?auto_2127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2126 ?auto_2127 )
      ( MAKE-4PILE ?auto_2126 ?auto_2127 ?auto_2128 ?auto_2129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2135 - BLOCK
      ?auto_2136 - BLOCK
      ?auto_2137 - BLOCK
      ?auto_2138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2138 ) ( ON-TABLE ?auto_2135 ) ( not ( = ?auto_2135 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2137 ) ) ( not ( = ?auto_2135 ?auto_2138 ) ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2138 ) ) ( not ( = ?auto_2137 ?auto_2138 ) ) ( ON ?auto_2137 ?auto_2138 ) ( CLEAR ?auto_2135 ) ( ON ?auto_2136 ?auto_2137 ) ( CLEAR ?auto_2136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2135 ?auto_2136 )
      ( MAKE-4PILE ?auto_2135 ?auto_2136 ?auto_2137 ?auto_2138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2143 - BLOCK
      ?auto_2144 - BLOCK
      ?auto_2145 - BLOCK
      ?auto_2146 - BLOCK
    )
    :vars
    (
      ?auto_2147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2146 ?auto_2147 ) ( not ( = ?auto_2143 ?auto_2144 ) ) ( not ( = ?auto_2143 ?auto_2145 ) ) ( not ( = ?auto_2143 ?auto_2146 ) ) ( not ( = ?auto_2143 ?auto_2147 ) ) ( not ( = ?auto_2144 ?auto_2145 ) ) ( not ( = ?auto_2144 ?auto_2146 ) ) ( not ( = ?auto_2144 ?auto_2147 ) ) ( not ( = ?auto_2145 ?auto_2146 ) ) ( not ( = ?auto_2145 ?auto_2147 ) ) ( not ( = ?auto_2146 ?auto_2147 ) ) ( ON ?auto_2145 ?auto_2146 ) ( ON ?auto_2144 ?auto_2145 ) ( ON ?auto_2143 ?auto_2144 ) ( CLEAR ?auto_2143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2143 )
      ( MAKE-4PILE ?auto_2143 ?auto_2144 ?auto_2145 ?auto_2146 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2152 - BLOCK
      ?auto_2153 - BLOCK
      ?auto_2154 - BLOCK
      ?auto_2155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2155 ) ( not ( = ?auto_2152 ?auto_2153 ) ) ( not ( = ?auto_2152 ?auto_2154 ) ) ( not ( = ?auto_2152 ?auto_2155 ) ) ( not ( = ?auto_2153 ?auto_2154 ) ) ( not ( = ?auto_2153 ?auto_2155 ) ) ( not ( = ?auto_2154 ?auto_2155 ) ) ( ON ?auto_2154 ?auto_2155 ) ( ON ?auto_2153 ?auto_2154 ) ( ON ?auto_2152 ?auto_2153 ) ( CLEAR ?auto_2152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2152 )
      ( MAKE-4PILE ?auto_2152 ?auto_2153 ?auto_2154 ?auto_2155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2160 - BLOCK
      ?auto_2161 - BLOCK
      ?auto_2162 - BLOCK
      ?auto_2163 - BLOCK
    )
    :vars
    (
      ?auto_2164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2160 ?auto_2161 ) ) ( not ( = ?auto_2160 ?auto_2162 ) ) ( not ( = ?auto_2160 ?auto_2163 ) ) ( not ( = ?auto_2161 ?auto_2162 ) ) ( not ( = ?auto_2161 ?auto_2163 ) ) ( not ( = ?auto_2162 ?auto_2163 ) ) ( ON ?auto_2160 ?auto_2164 ) ( not ( = ?auto_2163 ?auto_2164 ) ) ( not ( = ?auto_2162 ?auto_2164 ) ) ( not ( = ?auto_2161 ?auto_2164 ) ) ( not ( = ?auto_2160 ?auto_2164 ) ) ( ON ?auto_2161 ?auto_2160 ) ( ON ?auto_2162 ?auto_2161 ) ( ON ?auto_2163 ?auto_2162 ) ( CLEAR ?auto_2163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_2163 ?auto_2162 ?auto_2161 ?auto_2160 )
      ( MAKE-4PILE ?auto_2160 ?auto_2161 ?auto_2162 ?auto_2163 ) )
  )

)

