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
      ?auto_3037 - BLOCK
      ?auto_3038 - BLOCK
      ?auto_3039 - BLOCK
    )
    :vars
    (
      ?auto_3040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3040 ?auto_3039 ) ( CLEAR ?auto_3040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3037 ) ( ON ?auto_3038 ?auto_3037 ) ( ON ?auto_3039 ?auto_3038 ) ( not ( = ?auto_3037 ?auto_3038 ) ) ( not ( = ?auto_3037 ?auto_3039 ) ) ( not ( = ?auto_3037 ?auto_3040 ) ) ( not ( = ?auto_3038 ?auto_3039 ) ) ( not ( = ?auto_3038 ?auto_3040 ) ) ( not ( = ?auto_3039 ?auto_3040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3040 ?auto_3039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3042 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3042 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3043 - BLOCK
    )
    :vars
    (
      ?auto_3044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3043 ?auto_3044 ) ( CLEAR ?auto_3043 ) ( HAND-EMPTY ) ( not ( = ?auto_3043 ?auto_3044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3043 ?auto_3044 )
      ( MAKE-1PILE ?auto_3043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3047 - BLOCK
      ?auto_3048 - BLOCK
    )
    :vars
    (
      ?auto_3049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3049 ?auto_3048 ) ( CLEAR ?auto_3049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3047 ) ( ON ?auto_3048 ?auto_3047 ) ( not ( = ?auto_3047 ?auto_3048 ) ) ( not ( = ?auto_3047 ?auto_3049 ) ) ( not ( = ?auto_3048 ?auto_3049 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3049 ?auto_3048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3050 - BLOCK
      ?auto_3051 - BLOCK
    )
    :vars
    (
      ?auto_3052 - BLOCK
      ?auto_3053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3052 ?auto_3051 ) ( CLEAR ?auto_3052 ) ( ON-TABLE ?auto_3050 ) ( ON ?auto_3051 ?auto_3050 ) ( not ( = ?auto_3050 ?auto_3051 ) ) ( not ( = ?auto_3050 ?auto_3052 ) ) ( not ( = ?auto_3051 ?auto_3052 ) ) ( HOLDING ?auto_3053 ) ( not ( = ?auto_3050 ?auto_3053 ) ) ( not ( = ?auto_3051 ?auto_3053 ) ) ( not ( = ?auto_3052 ?auto_3053 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3053 )
      ( MAKE-2PILE ?auto_3050 ?auto_3051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3054 - BLOCK
      ?auto_3055 - BLOCK
    )
    :vars
    (
      ?auto_3057 - BLOCK
      ?auto_3056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3057 ?auto_3055 ) ( ON-TABLE ?auto_3054 ) ( ON ?auto_3055 ?auto_3054 ) ( not ( = ?auto_3054 ?auto_3055 ) ) ( not ( = ?auto_3054 ?auto_3057 ) ) ( not ( = ?auto_3055 ?auto_3057 ) ) ( not ( = ?auto_3054 ?auto_3056 ) ) ( not ( = ?auto_3055 ?auto_3056 ) ) ( not ( = ?auto_3057 ?auto_3056 ) ) ( ON ?auto_3056 ?auto_3057 ) ( CLEAR ?auto_3056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3054 ?auto_3055 ?auto_3057 )
      ( MAKE-2PILE ?auto_3054 ?auto_3055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3060 - BLOCK
      ?auto_3061 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3061 ) ( CLEAR ?auto_3060 ) ( ON-TABLE ?auto_3060 ) ( not ( = ?auto_3060 ?auto_3061 ) ) )
    :subtasks
    ( ( !STACK ?auto_3061 ?auto_3060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3062 - BLOCK
      ?auto_3063 - BLOCK
    )
    :vars
    (
      ?auto_3064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3062 ) ( ON-TABLE ?auto_3062 ) ( not ( = ?auto_3062 ?auto_3063 ) ) ( ON ?auto_3063 ?auto_3064 ) ( CLEAR ?auto_3063 ) ( HAND-EMPTY ) ( not ( = ?auto_3062 ?auto_3064 ) ) ( not ( = ?auto_3063 ?auto_3064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3063 ?auto_3064 )
      ( MAKE-2PILE ?auto_3062 ?auto_3063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3065 - BLOCK
      ?auto_3066 - BLOCK
    )
    :vars
    (
      ?auto_3067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3065 ?auto_3066 ) ) ( ON ?auto_3066 ?auto_3067 ) ( CLEAR ?auto_3066 ) ( not ( = ?auto_3065 ?auto_3067 ) ) ( not ( = ?auto_3066 ?auto_3067 ) ) ( HOLDING ?auto_3065 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3065 )
      ( MAKE-2PILE ?auto_3065 ?auto_3066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3068 - BLOCK
      ?auto_3069 - BLOCK
    )
    :vars
    (
      ?auto_3070 - BLOCK
      ?auto_3071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3068 ?auto_3069 ) ) ( ON ?auto_3069 ?auto_3070 ) ( not ( = ?auto_3068 ?auto_3070 ) ) ( not ( = ?auto_3069 ?auto_3070 ) ) ( ON ?auto_3068 ?auto_3069 ) ( CLEAR ?auto_3068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3071 ) ( ON ?auto_3070 ?auto_3071 ) ( not ( = ?auto_3071 ?auto_3070 ) ) ( not ( = ?auto_3071 ?auto_3069 ) ) ( not ( = ?auto_3071 ?auto_3068 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3071 ?auto_3070 ?auto_3069 )
      ( MAKE-2PILE ?auto_3068 ?auto_3069 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3073 - BLOCK
    )
    :vars
    (
      ?auto_3074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3074 ?auto_3073 ) ( CLEAR ?auto_3074 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3073 ) ( not ( = ?auto_3073 ?auto_3074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3074 ?auto_3073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3075 - BLOCK
    )
    :vars
    (
      ?auto_3076 - BLOCK
      ?auto_3077 - BLOCK
      ?auto_3078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3076 ?auto_3075 ) ( CLEAR ?auto_3076 ) ( ON-TABLE ?auto_3075 ) ( not ( = ?auto_3075 ?auto_3076 ) ) ( HOLDING ?auto_3077 ) ( CLEAR ?auto_3078 ) ( not ( = ?auto_3075 ?auto_3077 ) ) ( not ( = ?auto_3075 ?auto_3078 ) ) ( not ( = ?auto_3076 ?auto_3077 ) ) ( not ( = ?auto_3076 ?auto_3078 ) ) ( not ( = ?auto_3077 ?auto_3078 ) ) )
    :subtasks
    ( ( !STACK ?auto_3077 ?auto_3078 )
      ( MAKE-1PILE ?auto_3075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3165 - BLOCK
    )
    :vars
    (
      ?auto_3166 - BLOCK
      ?auto_3167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3166 ?auto_3165 ) ( ON-TABLE ?auto_3165 ) ( not ( = ?auto_3165 ?auto_3166 ) ) ( not ( = ?auto_3165 ?auto_3167 ) ) ( not ( = ?auto_3166 ?auto_3167 ) ) ( ON ?auto_3167 ?auto_3166 ) ( CLEAR ?auto_3167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3165 ?auto_3166 )
      ( MAKE-1PILE ?auto_3165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3083 - BLOCK
    )
    :vars
    (
      ?auto_3085 - BLOCK
      ?auto_3084 - BLOCK
      ?auto_3086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3085 ?auto_3083 ) ( ON-TABLE ?auto_3083 ) ( not ( = ?auto_3083 ?auto_3085 ) ) ( not ( = ?auto_3083 ?auto_3084 ) ) ( not ( = ?auto_3083 ?auto_3086 ) ) ( not ( = ?auto_3085 ?auto_3084 ) ) ( not ( = ?auto_3085 ?auto_3086 ) ) ( not ( = ?auto_3084 ?auto_3086 ) ) ( ON ?auto_3084 ?auto_3085 ) ( CLEAR ?auto_3084 ) ( HOLDING ?auto_3086 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3086 )
      ( MAKE-1PILE ?auto_3083 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3087 - BLOCK
    )
    :vars
    (
      ?auto_3088 - BLOCK
      ?auto_3090 - BLOCK
      ?auto_3089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3088 ?auto_3087 ) ( ON-TABLE ?auto_3087 ) ( not ( = ?auto_3087 ?auto_3088 ) ) ( not ( = ?auto_3087 ?auto_3090 ) ) ( not ( = ?auto_3087 ?auto_3089 ) ) ( not ( = ?auto_3088 ?auto_3090 ) ) ( not ( = ?auto_3088 ?auto_3089 ) ) ( not ( = ?auto_3090 ?auto_3089 ) ) ( ON ?auto_3090 ?auto_3088 ) ( ON ?auto_3089 ?auto_3090 ) ( CLEAR ?auto_3089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3087 ?auto_3088 ?auto_3090 )
      ( MAKE-1PILE ?auto_3087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3094 - BLOCK
      ?auto_3095 - BLOCK
      ?auto_3096 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3096 ) ( CLEAR ?auto_3095 ) ( ON-TABLE ?auto_3094 ) ( ON ?auto_3095 ?auto_3094 ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3094 ?auto_3096 ) ) ( not ( = ?auto_3095 ?auto_3096 ) ) )
    :subtasks
    ( ( !STACK ?auto_3096 ?auto_3095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3097 - BLOCK
      ?auto_3098 - BLOCK
      ?auto_3099 - BLOCK
    )
    :vars
    (
      ?auto_3100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3098 ) ( ON-TABLE ?auto_3097 ) ( ON ?auto_3098 ?auto_3097 ) ( not ( = ?auto_3097 ?auto_3098 ) ) ( not ( = ?auto_3097 ?auto_3099 ) ) ( not ( = ?auto_3098 ?auto_3099 ) ) ( ON ?auto_3099 ?auto_3100 ) ( CLEAR ?auto_3099 ) ( HAND-EMPTY ) ( not ( = ?auto_3097 ?auto_3100 ) ) ( not ( = ?auto_3098 ?auto_3100 ) ) ( not ( = ?auto_3099 ?auto_3100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3099 ?auto_3100 )
      ( MAKE-3PILE ?auto_3097 ?auto_3098 ?auto_3099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3101 - BLOCK
      ?auto_3102 - BLOCK
      ?auto_3103 - BLOCK
    )
    :vars
    (
      ?auto_3104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3101 ) ( not ( = ?auto_3101 ?auto_3102 ) ) ( not ( = ?auto_3101 ?auto_3103 ) ) ( not ( = ?auto_3102 ?auto_3103 ) ) ( ON ?auto_3103 ?auto_3104 ) ( CLEAR ?auto_3103 ) ( not ( = ?auto_3101 ?auto_3104 ) ) ( not ( = ?auto_3102 ?auto_3104 ) ) ( not ( = ?auto_3103 ?auto_3104 ) ) ( HOLDING ?auto_3102 ) ( CLEAR ?auto_3101 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3101 ?auto_3102 )
      ( MAKE-3PILE ?auto_3101 ?auto_3102 ?auto_3103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3105 - BLOCK
      ?auto_3106 - BLOCK
      ?auto_3107 - BLOCK
    )
    :vars
    (
      ?auto_3108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3105 ) ( not ( = ?auto_3105 ?auto_3106 ) ) ( not ( = ?auto_3105 ?auto_3107 ) ) ( not ( = ?auto_3106 ?auto_3107 ) ) ( ON ?auto_3107 ?auto_3108 ) ( not ( = ?auto_3105 ?auto_3108 ) ) ( not ( = ?auto_3106 ?auto_3108 ) ) ( not ( = ?auto_3107 ?auto_3108 ) ) ( CLEAR ?auto_3105 ) ( ON ?auto_3106 ?auto_3107 ) ( CLEAR ?auto_3106 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3108 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3108 ?auto_3107 )
      ( MAKE-3PILE ?auto_3105 ?auto_3106 ?auto_3107 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3109 - BLOCK
      ?auto_3110 - BLOCK
      ?auto_3111 - BLOCK
    )
    :vars
    (
      ?auto_3112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3109 ?auto_3110 ) ) ( not ( = ?auto_3109 ?auto_3111 ) ) ( not ( = ?auto_3110 ?auto_3111 ) ) ( ON ?auto_3111 ?auto_3112 ) ( not ( = ?auto_3109 ?auto_3112 ) ) ( not ( = ?auto_3110 ?auto_3112 ) ) ( not ( = ?auto_3111 ?auto_3112 ) ) ( ON ?auto_3110 ?auto_3111 ) ( CLEAR ?auto_3110 ) ( ON-TABLE ?auto_3112 ) ( HOLDING ?auto_3109 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3109 )
      ( MAKE-3PILE ?auto_3109 ?auto_3110 ?auto_3111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3113 - BLOCK
      ?auto_3114 - BLOCK
      ?auto_3115 - BLOCK
    )
    :vars
    (
      ?auto_3116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3113 ?auto_3114 ) ) ( not ( = ?auto_3113 ?auto_3115 ) ) ( not ( = ?auto_3114 ?auto_3115 ) ) ( ON ?auto_3115 ?auto_3116 ) ( not ( = ?auto_3113 ?auto_3116 ) ) ( not ( = ?auto_3114 ?auto_3116 ) ) ( not ( = ?auto_3115 ?auto_3116 ) ) ( ON ?auto_3114 ?auto_3115 ) ( ON-TABLE ?auto_3116 ) ( ON ?auto_3113 ?auto_3114 ) ( CLEAR ?auto_3113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3116 ?auto_3115 ?auto_3114 )
      ( MAKE-3PILE ?auto_3113 ?auto_3114 ?auto_3115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3143 - BLOCK
    )
    :vars
    (
      ?auto_3144 - BLOCK
      ?auto_3145 - BLOCK
      ?auto_3146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3143 ?auto_3144 ) ( CLEAR ?auto_3143 ) ( not ( = ?auto_3143 ?auto_3144 ) ) ( HOLDING ?auto_3145 ) ( CLEAR ?auto_3146 ) ( not ( = ?auto_3143 ?auto_3145 ) ) ( not ( = ?auto_3143 ?auto_3146 ) ) ( not ( = ?auto_3144 ?auto_3145 ) ) ( not ( = ?auto_3144 ?auto_3146 ) ) ( not ( = ?auto_3145 ?auto_3146 ) ) )
    :subtasks
    ( ( !STACK ?auto_3145 ?auto_3146 )
      ( MAKE-1PILE ?auto_3143 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3147 - BLOCK
    )
    :vars
    (
      ?auto_3149 - BLOCK
      ?auto_3150 - BLOCK
      ?auto_3148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3147 ?auto_3149 ) ( not ( = ?auto_3147 ?auto_3149 ) ) ( CLEAR ?auto_3150 ) ( not ( = ?auto_3147 ?auto_3148 ) ) ( not ( = ?auto_3147 ?auto_3150 ) ) ( not ( = ?auto_3149 ?auto_3148 ) ) ( not ( = ?auto_3149 ?auto_3150 ) ) ( not ( = ?auto_3148 ?auto_3150 ) ) ( ON ?auto_3148 ?auto_3147 ) ( CLEAR ?auto_3148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3149 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3149 ?auto_3147 )
      ( MAKE-1PILE ?auto_3147 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3151 - BLOCK
    )
    :vars
    (
      ?auto_3153 - BLOCK
      ?auto_3154 - BLOCK
      ?auto_3152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3151 ?auto_3153 ) ( not ( = ?auto_3151 ?auto_3153 ) ) ( not ( = ?auto_3151 ?auto_3154 ) ) ( not ( = ?auto_3151 ?auto_3152 ) ) ( not ( = ?auto_3153 ?auto_3154 ) ) ( not ( = ?auto_3153 ?auto_3152 ) ) ( not ( = ?auto_3154 ?auto_3152 ) ) ( ON ?auto_3154 ?auto_3151 ) ( CLEAR ?auto_3154 ) ( ON-TABLE ?auto_3153 ) ( HOLDING ?auto_3152 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3152 )
      ( MAKE-1PILE ?auto_3151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3155 - BLOCK
    )
    :vars
    (
      ?auto_3157 - BLOCK
      ?auto_3158 - BLOCK
      ?auto_3156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3155 ?auto_3157 ) ( not ( = ?auto_3155 ?auto_3157 ) ) ( not ( = ?auto_3155 ?auto_3158 ) ) ( not ( = ?auto_3155 ?auto_3156 ) ) ( not ( = ?auto_3157 ?auto_3158 ) ) ( not ( = ?auto_3157 ?auto_3156 ) ) ( not ( = ?auto_3158 ?auto_3156 ) ) ( ON ?auto_3158 ?auto_3155 ) ( ON-TABLE ?auto_3157 ) ( ON ?auto_3156 ?auto_3158 ) ( CLEAR ?auto_3156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3157 ?auto_3155 ?auto_3158 )
      ( MAKE-1PILE ?auto_3155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3162 - BLOCK
    )
    :vars
    (
      ?auto_3163 - BLOCK
      ?auto_3164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3163 ?auto_3162 ) ( CLEAR ?auto_3163 ) ( ON-TABLE ?auto_3162 ) ( not ( = ?auto_3162 ?auto_3163 ) ) ( HOLDING ?auto_3164 ) ( not ( = ?auto_3162 ?auto_3164 ) ) ( not ( = ?auto_3163 ?auto_3164 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3164 )
      ( MAKE-1PILE ?auto_3162 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3187 - BLOCK
      ?auto_3188 - BLOCK
    )
    :vars
    (
      ?auto_3189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3187 ?auto_3188 ) ) ( ON ?auto_3188 ?auto_3189 ) ( not ( = ?auto_3187 ?auto_3189 ) ) ( not ( = ?auto_3188 ?auto_3189 ) ) ( ON ?auto_3187 ?auto_3188 ) ( CLEAR ?auto_3187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3189 ?auto_3188 )
      ( MAKE-2PILE ?auto_3187 ?auto_3188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3192 - BLOCK
      ?auto_3193 - BLOCK
    )
    :vars
    (
      ?auto_3194 - BLOCK
      ?auto_3195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3192 ?auto_3193 ) ) ( ON ?auto_3193 ?auto_3194 ) ( CLEAR ?auto_3193 ) ( not ( = ?auto_3192 ?auto_3194 ) ) ( not ( = ?auto_3193 ?auto_3194 ) ) ( ON ?auto_3192 ?auto_3195 ) ( CLEAR ?auto_3192 ) ( HAND-EMPTY ) ( not ( = ?auto_3192 ?auto_3195 ) ) ( not ( = ?auto_3193 ?auto_3195 ) ) ( not ( = ?auto_3194 ?auto_3195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3192 ?auto_3195 )
      ( MAKE-2PILE ?auto_3192 ?auto_3193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3196 - BLOCK
      ?auto_3197 - BLOCK
    )
    :vars
    (
      ?auto_3199 - BLOCK
      ?auto_3198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3196 ?auto_3197 ) ) ( not ( = ?auto_3196 ?auto_3199 ) ) ( not ( = ?auto_3197 ?auto_3199 ) ) ( ON ?auto_3196 ?auto_3198 ) ( CLEAR ?auto_3196 ) ( not ( = ?auto_3196 ?auto_3198 ) ) ( not ( = ?auto_3197 ?auto_3198 ) ) ( not ( = ?auto_3199 ?auto_3198 ) ) ( HOLDING ?auto_3197 ) ( CLEAR ?auto_3199 ) ( ON-TABLE ?auto_3199 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3199 ?auto_3197 )
      ( MAKE-2PILE ?auto_3196 ?auto_3197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3200 - BLOCK
      ?auto_3201 - BLOCK
    )
    :vars
    (
      ?auto_3202 - BLOCK
      ?auto_3203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3200 ?auto_3201 ) ) ( not ( = ?auto_3200 ?auto_3202 ) ) ( not ( = ?auto_3201 ?auto_3202 ) ) ( ON ?auto_3200 ?auto_3203 ) ( not ( = ?auto_3200 ?auto_3203 ) ) ( not ( = ?auto_3201 ?auto_3203 ) ) ( not ( = ?auto_3202 ?auto_3203 ) ) ( CLEAR ?auto_3202 ) ( ON-TABLE ?auto_3202 ) ( ON ?auto_3201 ?auto_3200 ) ( CLEAR ?auto_3201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3203 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3203 ?auto_3200 )
      ( MAKE-2PILE ?auto_3200 ?auto_3201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3204 - BLOCK
      ?auto_3205 - BLOCK
    )
    :vars
    (
      ?auto_3206 - BLOCK
      ?auto_3207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3204 ?auto_3205 ) ) ( not ( = ?auto_3204 ?auto_3206 ) ) ( not ( = ?auto_3205 ?auto_3206 ) ) ( ON ?auto_3204 ?auto_3207 ) ( not ( = ?auto_3204 ?auto_3207 ) ) ( not ( = ?auto_3205 ?auto_3207 ) ) ( not ( = ?auto_3206 ?auto_3207 ) ) ( ON ?auto_3205 ?auto_3204 ) ( CLEAR ?auto_3205 ) ( ON-TABLE ?auto_3207 ) ( HOLDING ?auto_3206 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3206 )
      ( MAKE-2PILE ?auto_3204 ?auto_3205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3208 - BLOCK
      ?auto_3209 - BLOCK
    )
    :vars
    (
      ?auto_3211 - BLOCK
      ?auto_3210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3208 ?auto_3209 ) ) ( not ( = ?auto_3208 ?auto_3211 ) ) ( not ( = ?auto_3209 ?auto_3211 ) ) ( ON ?auto_3208 ?auto_3210 ) ( not ( = ?auto_3208 ?auto_3210 ) ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( not ( = ?auto_3211 ?auto_3210 ) ) ( ON ?auto_3209 ?auto_3208 ) ( ON-TABLE ?auto_3210 ) ( ON ?auto_3211 ?auto_3209 ) ( CLEAR ?auto_3211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3210 ?auto_3208 ?auto_3209 )
      ( MAKE-2PILE ?auto_3208 ?auto_3209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3218 - BLOCK
      ?auto_3219 - BLOCK
      ?auto_3220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3219 ) ( ON-TABLE ?auto_3218 ) ( ON ?auto_3219 ?auto_3218 ) ( not ( = ?auto_3218 ?auto_3219 ) ) ( not ( = ?auto_3218 ?auto_3220 ) ) ( not ( = ?auto_3219 ?auto_3220 ) ) ( ON-TABLE ?auto_3220 ) ( CLEAR ?auto_3220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_3220 )
      ( MAKE-3PILE ?auto_3218 ?auto_3219 ?auto_3220 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3221 - BLOCK
      ?auto_3222 - BLOCK
      ?auto_3223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3221 ) ( not ( = ?auto_3221 ?auto_3222 ) ) ( not ( = ?auto_3221 ?auto_3223 ) ) ( not ( = ?auto_3222 ?auto_3223 ) ) ( ON-TABLE ?auto_3223 ) ( CLEAR ?auto_3223 ) ( HOLDING ?auto_3222 ) ( CLEAR ?auto_3221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3221 ?auto_3222 )
      ( MAKE-3PILE ?auto_3221 ?auto_3222 ?auto_3223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3224 - BLOCK
      ?auto_3225 - BLOCK
      ?auto_3226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3224 ) ( not ( = ?auto_3224 ?auto_3225 ) ) ( not ( = ?auto_3224 ?auto_3226 ) ) ( not ( = ?auto_3225 ?auto_3226 ) ) ( ON-TABLE ?auto_3226 ) ( CLEAR ?auto_3224 ) ( ON ?auto_3225 ?auto_3226 ) ( CLEAR ?auto_3225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3226 )
      ( MAKE-3PILE ?auto_3224 ?auto_3225 ?auto_3226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3227 - BLOCK
      ?auto_3228 - BLOCK
      ?auto_3229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3227 ?auto_3228 ) ) ( not ( = ?auto_3227 ?auto_3229 ) ) ( not ( = ?auto_3228 ?auto_3229 ) ) ( ON-TABLE ?auto_3229 ) ( ON ?auto_3228 ?auto_3229 ) ( CLEAR ?auto_3228 ) ( HOLDING ?auto_3227 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3227 )
      ( MAKE-3PILE ?auto_3227 ?auto_3228 ?auto_3229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3230 - BLOCK
      ?auto_3231 - BLOCK
      ?auto_3232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3230 ?auto_3231 ) ) ( not ( = ?auto_3230 ?auto_3232 ) ) ( not ( = ?auto_3231 ?auto_3232 ) ) ( ON-TABLE ?auto_3232 ) ( ON ?auto_3231 ?auto_3232 ) ( ON ?auto_3230 ?auto_3231 ) ( CLEAR ?auto_3230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3232 ?auto_3231 )
      ( MAKE-3PILE ?auto_3230 ?auto_3231 ?auto_3232 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3236 - BLOCK
      ?auto_3237 - BLOCK
      ?auto_3238 - BLOCK
    )
    :vars
    (
      ?auto_3239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3236 ?auto_3237 ) ) ( not ( = ?auto_3236 ?auto_3238 ) ) ( not ( = ?auto_3237 ?auto_3238 ) ) ( ON-TABLE ?auto_3238 ) ( ON ?auto_3237 ?auto_3238 ) ( CLEAR ?auto_3237 ) ( ON ?auto_3236 ?auto_3239 ) ( CLEAR ?auto_3236 ) ( HAND-EMPTY ) ( not ( = ?auto_3236 ?auto_3239 ) ) ( not ( = ?auto_3237 ?auto_3239 ) ) ( not ( = ?auto_3238 ?auto_3239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3236 ?auto_3239 )
      ( MAKE-3PILE ?auto_3236 ?auto_3237 ?auto_3238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3240 - BLOCK
      ?auto_3241 - BLOCK
      ?auto_3242 - BLOCK
    )
    :vars
    (
      ?auto_3243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3240 ?auto_3241 ) ) ( not ( = ?auto_3240 ?auto_3242 ) ) ( not ( = ?auto_3241 ?auto_3242 ) ) ( ON-TABLE ?auto_3242 ) ( ON ?auto_3240 ?auto_3243 ) ( CLEAR ?auto_3240 ) ( not ( = ?auto_3240 ?auto_3243 ) ) ( not ( = ?auto_3241 ?auto_3243 ) ) ( not ( = ?auto_3242 ?auto_3243 ) ) ( HOLDING ?auto_3241 ) ( CLEAR ?auto_3242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3242 ?auto_3241 )
      ( MAKE-3PILE ?auto_3240 ?auto_3241 ?auto_3242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3244 - BLOCK
      ?auto_3245 - BLOCK
      ?auto_3246 - BLOCK
    )
    :vars
    (
      ?auto_3247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3244 ?auto_3245 ) ) ( not ( = ?auto_3244 ?auto_3246 ) ) ( not ( = ?auto_3245 ?auto_3246 ) ) ( ON-TABLE ?auto_3246 ) ( ON ?auto_3244 ?auto_3247 ) ( not ( = ?auto_3244 ?auto_3247 ) ) ( not ( = ?auto_3245 ?auto_3247 ) ) ( not ( = ?auto_3246 ?auto_3247 ) ) ( CLEAR ?auto_3246 ) ( ON ?auto_3245 ?auto_3244 ) ( CLEAR ?auto_3245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3247 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3247 ?auto_3244 )
      ( MAKE-3PILE ?auto_3244 ?auto_3245 ?auto_3246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3248 - BLOCK
      ?auto_3249 - BLOCK
      ?auto_3250 - BLOCK
    )
    :vars
    (
      ?auto_3251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3248 ?auto_3249 ) ) ( not ( = ?auto_3248 ?auto_3250 ) ) ( not ( = ?auto_3249 ?auto_3250 ) ) ( ON ?auto_3248 ?auto_3251 ) ( not ( = ?auto_3248 ?auto_3251 ) ) ( not ( = ?auto_3249 ?auto_3251 ) ) ( not ( = ?auto_3250 ?auto_3251 ) ) ( ON ?auto_3249 ?auto_3248 ) ( CLEAR ?auto_3249 ) ( ON-TABLE ?auto_3251 ) ( HOLDING ?auto_3250 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3250 )
      ( MAKE-3PILE ?auto_3248 ?auto_3249 ?auto_3250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3252 - BLOCK
      ?auto_3253 - BLOCK
      ?auto_3254 - BLOCK
    )
    :vars
    (
      ?auto_3255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3252 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3254 ) ) ( not ( = ?auto_3253 ?auto_3254 ) ) ( ON ?auto_3252 ?auto_3255 ) ( not ( = ?auto_3252 ?auto_3255 ) ) ( not ( = ?auto_3253 ?auto_3255 ) ) ( not ( = ?auto_3254 ?auto_3255 ) ) ( ON ?auto_3253 ?auto_3252 ) ( ON-TABLE ?auto_3255 ) ( ON ?auto_3254 ?auto_3253 ) ( CLEAR ?auto_3254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3255 ?auto_3252 ?auto_3253 )
      ( MAKE-3PILE ?auto_3252 ?auto_3253 ?auto_3254 ) )
  )

)

