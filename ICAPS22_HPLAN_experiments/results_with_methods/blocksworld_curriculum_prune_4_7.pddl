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
      ?auto_3036 - BLOCK
    )
    :vars
    (
      ?auto_3037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3036 ?auto_3037 ) ( CLEAR ?auto_3036 ) ( HAND-EMPTY ) ( not ( = ?auto_3036 ?auto_3037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3036 ?auto_3037 )
      ( !PUTDOWN ?auto_3036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3043 - BLOCK
      ?auto_3044 - BLOCK
    )
    :vars
    (
      ?auto_3045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3043 ) ( ON ?auto_3044 ?auto_3045 ) ( CLEAR ?auto_3044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3043 ) ( not ( = ?auto_3043 ?auto_3044 ) ) ( not ( = ?auto_3043 ?auto_3045 ) ) ( not ( = ?auto_3044 ?auto_3045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3044 ?auto_3045 )
      ( !STACK ?auto_3044 ?auto_3043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3053 - BLOCK
      ?auto_3054 - BLOCK
    )
    :vars
    (
      ?auto_3055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3054 ?auto_3055 ) ( not ( = ?auto_3053 ?auto_3054 ) ) ( not ( = ?auto_3053 ?auto_3055 ) ) ( not ( = ?auto_3054 ?auto_3055 ) ) ( ON ?auto_3053 ?auto_3054 ) ( CLEAR ?auto_3053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3053 )
      ( MAKE-2PILE ?auto_3053 ?auto_3054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3064 - BLOCK
      ?auto_3065 - BLOCK
      ?auto_3066 - BLOCK
    )
    :vars
    (
      ?auto_3067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3065 ) ( ON ?auto_3066 ?auto_3067 ) ( CLEAR ?auto_3066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3064 ) ( ON ?auto_3065 ?auto_3064 ) ( not ( = ?auto_3064 ?auto_3065 ) ) ( not ( = ?auto_3064 ?auto_3066 ) ) ( not ( = ?auto_3064 ?auto_3067 ) ) ( not ( = ?auto_3065 ?auto_3066 ) ) ( not ( = ?auto_3065 ?auto_3067 ) ) ( not ( = ?auto_3066 ?auto_3067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3066 ?auto_3067 )
      ( !STACK ?auto_3066 ?auto_3065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3078 - BLOCK
      ?auto_3079 - BLOCK
      ?auto_3080 - BLOCK
    )
    :vars
    (
      ?auto_3081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3080 ?auto_3081 ) ( ON-TABLE ?auto_3078 ) ( not ( = ?auto_3078 ?auto_3079 ) ) ( not ( = ?auto_3078 ?auto_3080 ) ) ( not ( = ?auto_3078 ?auto_3081 ) ) ( not ( = ?auto_3079 ?auto_3080 ) ) ( not ( = ?auto_3079 ?auto_3081 ) ) ( not ( = ?auto_3080 ?auto_3081 ) ) ( CLEAR ?auto_3078 ) ( ON ?auto_3079 ?auto_3080 ) ( CLEAR ?auto_3079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3078 ?auto_3079 )
      ( MAKE-3PILE ?auto_3078 ?auto_3079 ?auto_3080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3092 - BLOCK
      ?auto_3093 - BLOCK
      ?auto_3094 - BLOCK
    )
    :vars
    (
      ?auto_3095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3094 ?auto_3095 ) ( not ( = ?auto_3092 ?auto_3093 ) ) ( not ( = ?auto_3092 ?auto_3094 ) ) ( not ( = ?auto_3092 ?auto_3095 ) ) ( not ( = ?auto_3093 ?auto_3094 ) ) ( not ( = ?auto_3093 ?auto_3095 ) ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( ON ?auto_3093 ?auto_3094 ) ( ON ?auto_3092 ?auto_3093 ) ( CLEAR ?auto_3092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3092 )
      ( MAKE-3PILE ?auto_3092 ?auto_3093 ?auto_3094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3107 - BLOCK
      ?auto_3108 - BLOCK
      ?auto_3109 - BLOCK
      ?auto_3110 - BLOCK
    )
    :vars
    (
      ?auto_3111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3109 ) ( ON ?auto_3110 ?auto_3111 ) ( CLEAR ?auto_3110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3107 ) ( ON ?auto_3108 ?auto_3107 ) ( ON ?auto_3109 ?auto_3108 ) ( not ( = ?auto_3107 ?auto_3108 ) ) ( not ( = ?auto_3107 ?auto_3109 ) ) ( not ( = ?auto_3107 ?auto_3110 ) ) ( not ( = ?auto_3107 ?auto_3111 ) ) ( not ( = ?auto_3108 ?auto_3109 ) ) ( not ( = ?auto_3108 ?auto_3110 ) ) ( not ( = ?auto_3108 ?auto_3111 ) ) ( not ( = ?auto_3109 ?auto_3110 ) ) ( not ( = ?auto_3109 ?auto_3111 ) ) ( not ( = ?auto_3110 ?auto_3111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3110 ?auto_3111 )
      ( !STACK ?auto_3110 ?auto_3109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3116 - BLOCK
      ?auto_3117 - BLOCK
      ?auto_3118 - BLOCK
      ?auto_3119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3118 ) ( ON-TABLE ?auto_3119 ) ( CLEAR ?auto_3119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3116 ) ( ON ?auto_3117 ?auto_3116 ) ( ON ?auto_3118 ?auto_3117 ) ( not ( = ?auto_3116 ?auto_3117 ) ) ( not ( = ?auto_3116 ?auto_3118 ) ) ( not ( = ?auto_3116 ?auto_3119 ) ) ( not ( = ?auto_3117 ?auto_3118 ) ) ( not ( = ?auto_3117 ?auto_3119 ) ) ( not ( = ?auto_3118 ?auto_3119 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_3119 )
      ( !STACK ?auto_3119 ?auto_3118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3124 - BLOCK
      ?auto_3125 - BLOCK
      ?auto_3126 - BLOCK
      ?auto_3127 - BLOCK
    )
    :vars
    (
      ?auto_3128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3127 ?auto_3128 ) ( ON-TABLE ?auto_3124 ) ( ON ?auto_3125 ?auto_3124 ) ( not ( = ?auto_3124 ?auto_3125 ) ) ( not ( = ?auto_3124 ?auto_3126 ) ) ( not ( = ?auto_3124 ?auto_3127 ) ) ( not ( = ?auto_3124 ?auto_3128 ) ) ( not ( = ?auto_3125 ?auto_3126 ) ) ( not ( = ?auto_3125 ?auto_3127 ) ) ( not ( = ?auto_3125 ?auto_3128 ) ) ( not ( = ?auto_3126 ?auto_3127 ) ) ( not ( = ?auto_3126 ?auto_3128 ) ) ( not ( = ?auto_3127 ?auto_3128 ) ) ( CLEAR ?auto_3125 ) ( ON ?auto_3126 ?auto_3127 ) ( CLEAR ?auto_3126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3124 ?auto_3125 ?auto_3126 )
      ( MAKE-4PILE ?auto_3124 ?auto_3125 ?auto_3126 ?auto_3127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3133 - BLOCK
      ?auto_3134 - BLOCK
      ?auto_3135 - BLOCK
      ?auto_3136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3136 ) ( ON-TABLE ?auto_3133 ) ( ON ?auto_3134 ?auto_3133 ) ( not ( = ?auto_3133 ?auto_3134 ) ) ( not ( = ?auto_3133 ?auto_3135 ) ) ( not ( = ?auto_3133 ?auto_3136 ) ) ( not ( = ?auto_3134 ?auto_3135 ) ) ( not ( = ?auto_3134 ?auto_3136 ) ) ( not ( = ?auto_3135 ?auto_3136 ) ) ( CLEAR ?auto_3134 ) ( ON ?auto_3135 ?auto_3136 ) ( CLEAR ?auto_3135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3133 ?auto_3134 ?auto_3135 )
      ( MAKE-4PILE ?auto_3133 ?auto_3134 ?auto_3135 ?auto_3136 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3141 - BLOCK
      ?auto_3142 - BLOCK
      ?auto_3143 - BLOCK
      ?auto_3144 - BLOCK
    )
    :vars
    (
      ?auto_3145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3144 ?auto_3145 ) ( ON-TABLE ?auto_3141 ) ( not ( = ?auto_3141 ?auto_3142 ) ) ( not ( = ?auto_3141 ?auto_3143 ) ) ( not ( = ?auto_3141 ?auto_3144 ) ) ( not ( = ?auto_3141 ?auto_3145 ) ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3144 ) ) ( not ( = ?auto_3142 ?auto_3145 ) ) ( not ( = ?auto_3143 ?auto_3144 ) ) ( not ( = ?auto_3143 ?auto_3145 ) ) ( not ( = ?auto_3144 ?auto_3145 ) ) ( ON ?auto_3143 ?auto_3144 ) ( CLEAR ?auto_3141 ) ( ON ?auto_3142 ?auto_3143 ) ( CLEAR ?auto_3142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3141 ?auto_3142 )
      ( MAKE-4PILE ?auto_3141 ?auto_3142 ?auto_3143 ?auto_3144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3150 - BLOCK
      ?auto_3151 - BLOCK
      ?auto_3152 - BLOCK
      ?auto_3153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3153 ) ( ON-TABLE ?auto_3150 ) ( not ( = ?auto_3150 ?auto_3151 ) ) ( not ( = ?auto_3150 ?auto_3152 ) ) ( not ( = ?auto_3150 ?auto_3153 ) ) ( not ( = ?auto_3151 ?auto_3152 ) ) ( not ( = ?auto_3151 ?auto_3153 ) ) ( not ( = ?auto_3152 ?auto_3153 ) ) ( ON ?auto_3152 ?auto_3153 ) ( CLEAR ?auto_3150 ) ( ON ?auto_3151 ?auto_3152 ) ( CLEAR ?auto_3151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3150 ?auto_3151 )
      ( MAKE-4PILE ?auto_3150 ?auto_3151 ?auto_3152 ?auto_3153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3158 - BLOCK
      ?auto_3159 - BLOCK
      ?auto_3160 - BLOCK
      ?auto_3161 - BLOCK
    )
    :vars
    (
      ?auto_3162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3161 ?auto_3162 ) ( not ( = ?auto_3158 ?auto_3159 ) ) ( not ( = ?auto_3158 ?auto_3160 ) ) ( not ( = ?auto_3158 ?auto_3161 ) ) ( not ( = ?auto_3158 ?auto_3162 ) ) ( not ( = ?auto_3159 ?auto_3160 ) ) ( not ( = ?auto_3159 ?auto_3161 ) ) ( not ( = ?auto_3159 ?auto_3162 ) ) ( not ( = ?auto_3160 ?auto_3161 ) ) ( not ( = ?auto_3160 ?auto_3162 ) ) ( not ( = ?auto_3161 ?auto_3162 ) ) ( ON ?auto_3160 ?auto_3161 ) ( ON ?auto_3159 ?auto_3160 ) ( ON ?auto_3158 ?auto_3159 ) ( CLEAR ?auto_3158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3158 )
      ( MAKE-4PILE ?auto_3158 ?auto_3159 ?auto_3160 ?auto_3161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3167 - BLOCK
      ?auto_3168 - BLOCK
      ?auto_3169 - BLOCK
      ?auto_3170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3170 ) ( not ( = ?auto_3167 ?auto_3168 ) ) ( not ( = ?auto_3167 ?auto_3169 ) ) ( not ( = ?auto_3167 ?auto_3170 ) ) ( not ( = ?auto_3168 ?auto_3169 ) ) ( not ( = ?auto_3168 ?auto_3170 ) ) ( not ( = ?auto_3169 ?auto_3170 ) ) ( ON ?auto_3169 ?auto_3170 ) ( ON ?auto_3168 ?auto_3169 ) ( ON ?auto_3167 ?auto_3168 ) ( CLEAR ?auto_3167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3167 )
      ( MAKE-4PILE ?auto_3167 ?auto_3168 ?auto_3169 ?auto_3170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3175 - BLOCK
      ?auto_3176 - BLOCK
      ?auto_3177 - BLOCK
      ?auto_3178 - BLOCK
    )
    :vars
    (
      ?auto_3179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3175 ?auto_3176 ) ) ( not ( = ?auto_3175 ?auto_3177 ) ) ( not ( = ?auto_3175 ?auto_3178 ) ) ( not ( = ?auto_3176 ?auto_3177 ) ) ( not ( = ?auto_3176 ?auto_3178 ) ) ( not ( = ?auto_3177 ?auto_3178 ) ) ( ON ?auto_3175 ?auto_3179 ) ( not ( = ?auto_3178 ?auto_3179 ) ) ( not ( = ?auto_3177 ?auto_3179 ) ) ( not ( = ?auto_3176 ?auto_3179 ) ) ( not ( = ?auto_3175 ?auto_3179 ) ) ( ON ?auto_3176 ?auto_3175 ) ( ON ?auto_3177 ?auto_3176 ) ( ON ?auto_3178 ?auto_3177 ) ( CLEAR ?auto_3178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_3178 ?auto_3177 ?auto_3176 ?auto_3175 )
      ( MAKE-4PILE ?auto_3175 ?auto_3176 ?auto_3177 ?auto_3178 ) )
  )

)

