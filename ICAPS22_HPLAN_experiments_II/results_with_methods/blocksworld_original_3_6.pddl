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
      ?auto_3123 - BLOCK
      ?auto_3124 - BLOCK
      ?auto_3125 - BLOCK
    )
    :vars
    (
      ?auto_3126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3126 ?auto_3125 ) ( CLEAR ?auto_3126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3123 ) ( ON ?auto_3124 ?auto_3123 ) ( ON ?auto_3125 ?auto_3124 ) ( not ( = ?auto_3123 ?auto_3124 ) ) ( not ( = ?auto_3123 ?auto_3125 ) ) ( not ( = ?auto_3123 ?auto_3126 ) ) ( not ( = ?auto_3124 ?auto_3125 ) ) ( not ( = ?auto_3124 ?auto_3126 ) ) ( not ( = ?auto_3125 ?auto_3126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3126 ?auto_3125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3128 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3129 - BLOCK
    )
    :vars
    (
      ?auto_3130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3129 ?auto_3130 ) ( CLEAR ?auto_3129 ) ( HAND-EMPTY ) ( not ( = ?auto_3129 ?auto_3130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3129 ?auto_3130 )
      ( MAKE-1PILE ?auto_3129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3133 - BLOCK
      ?auto_3134 - BLOCK
    )
    :vars
    (
      ?auto_3135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3135 ?auto_3134 ) ( CLEAR ?auto_3135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3133 ) ( ON ?auto_3134 ?auto_3133 ) ( not ( = ?auto_3133 ?auto_3134 ) ) ( not ( = ?auto_3133 ?auto_3135 ) ) ( not ( = ?auto_3134 ?auto_3135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3135 ?auto_3134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3136 - BLOCK
      ?auto_3137 - BLOCK
    )
    :vars
    (
      ?auto_3138 - BLOCK
      ?auto_3139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3138 ?auto_3137 ) ( CLEAR ?auto_3138 ) ( ON-TABLE ?auto_3136 ) ( ON ?auto_3137 ?auto_3136 ) ( not ( = ?auto_3136 ?auto_3137 ) ) ( not ( = ?auto_3136 ?auto_3138 ) ) ( not ( = ?auto_3137 ?auto_3138 ) ) ( HOLDING ?auto_3139 ) ( not ( = ?auto_3136 ?auto_3139 ) ) ( not ( = ?auto_3137 ?auto_3139 ) ) ( not ( = ?auto_3138 ?auto_3139 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3139 )
      ( MAKE-2PILE ?auto_3136 ?auto_3137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3140 - BLOCK
      ?auto_3141 - BLOCK
    )
    :vars
    (
      ?auto_3142 - BLOCK
      ?auto_3143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3142 ?auto_3141 ) ( ON-TABLE ?auto_3140 ) ( ON ?auto_3141 ?auto_3140 ) ( not ( = ?auto_3140 ?auto_3141 ) ) ( not ( = ?auto_3140 ?auto_3142 ) ) ( not ( = ?auto_3141 ?auto_3142 ) ) ( not ( = ?auto_3140 ?auto_3143 ) ) ( not ( = ?auto_3141 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( ON ?auto_3143 ?auto_3142 ) ( CLEAR ?auto_3143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3140 ?auto_3141 ?auto_3142 )
      ( MAKE-2PILE ?auto_3140 ?auto_3141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3146 - BLOCK
      ?auto_3147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3147 ) ( CLEAR ?auto_3146 ) ( ON-TABLE ?auto_3146 ) ( not ( = ?auto_3146 ?auto_3147 ) ) )
    :subtasks
    ( ( !STACK ?auto_3147 ?auto_3146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3148 - BLOCK
      ?auto_3149 - BLOCK
    )
    :vars
    (
      ?auto_3150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3148 ) ( ON-TABLE ?auto_3148 ) ( not ( = ?auto_3148 ?auto_3149 ) ) ( ON ?auto_3149 ?auto_3150 ) ( CLEAR ?auto_3149 ) ( HAND-EMPTY ) ( not ( = ?auto_3148 ?auto_3150 ) ) ( not ( = ?auto_3149 ?auto_3150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3149 ?auto_3150 )
      ( MAKE-2PILE ?auto_3148 ?auto_3149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3151 - BLOCK
      ?auto_3152 - BLOCK
    )
    :vars
    (
      ?auto_3153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3151 ?auto_3152 ) ) ( ON ?auto_3152 ?auto_3153 ) ( CLEAR ?auto_3152 ) ( not ( = ?auto_3151 ?auto_3153 ) ) ( not ( = ?auto_3152 ?auto_3153 ) ) ( HOLDING ?auto_3151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3151 )
      ( MAKE-2PILE ?auto_3151 ?auto_3152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3154 - BLOCK
      ?auto_3155 - BLOCK
    )
    :vars
    (
      ?auto_3156 - BLOCK
      ?auto_3157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3154 ?auto_3155 ) ) ( ON ?auto_3155 ?auto_3156 ) ( not ( = ?auto_3154 ?auto_3156 ) ) ( not ( = ?auto_3155 ?auto_3156 ) ) ( ON ?auto_3154 ?auto_3155 ) ( CLEAR ?auto_3154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3157 ) ( ON ?auto_3156 ?auto_3157 ) ( not ( = ?auto_3157 ?auto_3156 ) ) ( not ( = ?auto_3157 ?auto_3155 ) ) ( not ( = ?auto_3157 ?auto_3154 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3157 ?auto_3156 ?auto_3155 )
      ( MAKE-2PILE ?auto_3154 ?auto_3155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3159 - BLOCK
    )
    :vars
    (
      ?auto_3160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3160 ?auto_3159 ) ( CLEAR ?auto_3160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3159 ) ( not ( = ?auto_3159 ?auto_3160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3160 ?auto_3159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3161 - BLOCK
    )
    :vars
    (
      ?auto_3162 - BLOCK
      ?auto_3163 - BLOCK
      ?auto_3164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3162 ?auto_3161 ) ( CLEAR ?auto_3162 ) ( ON-TABLE ?auto_3161 ) ( not ( = ?auto_3161 ?auto_3162 ) ) ( HOLDING ?auto_3163 ) ( CLEAR ?auto_3164 ) ( not ( = ?auto_3161 ?auto_3163 ) ) ( not ( = ?auto_3161 ?auto_3164 ) ) ( not ( = ?auto_3162 ?auto_3163 ) ) ( not ( = ?auto_3162 ?auto_3164 ) ) ( not ( = ?auto_3163 ?auto_3164 ) ) )
    :subtasks
    ( ( !STACK ?auto_3163 ?auto_3164 )
      ( MAKE-1PILE ?auto_3161 ) )
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
      ?auto_3168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3166 ?auto_3165 ) ( ON-TABLE ?auto_3165 ) ( not ( = ?auto_3165 ?auto_3166 ) ) ( CLEAR ?auto_3167 ) ( not ( = ?auto_3165 ?auto_3168 ) ) ( not ( = ?auto_3165 ?auto_3167 ) ) ( not ( = ?auto_3166 ?auto_3168 ) ) ( not ( = ?auto_3166 ?auto_3167 ) ) ( not ( = ?auto_3168 ?auto_3167 ) ) ( ON ?auto_3168 ?auto_3166 ) ( CLEAR ?auto_3168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3165 ?auto_3166 )
      ( MAKE-1PILE ?auto_3165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3169 - BLOCK
    )
    :vars
    (
      ?auto_3172 - BLOCK
      ?auto_3170 - BLOCK
      ?auto_3171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3172 ?auto_3169 ) ( ON-TABLE ?auto_3169 ) ( not ( = ?auto_3169 ?auto_3172 ) ) ( not ( = ?auto_3169 ?auto_3170 ) ) ( not ( = ?auto_3169 ?auto_3171 ) ) ( not ( = ?auto_3172 ?auto_3170 ) ) ( not ( = ?auto_3172 ?auto_3171 ) ) ( not ( = ?auto_3170 ?auto_3171 ) ) ( ON ?auto_3170 ?auto_3172 ) ( CLEAR ?auto_3170 ) ( HOLDING ?auto_3171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3171 )
      ( MAKE-1PILE ?auto_3169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3173 - BLOCK
    )
    :vars
    (
      ?auto_3175 - BLOCK
      ?auto_3174 - BLOCK
      ?auto_3176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3175 ?auto_3173 ) ( ON-TABLE ?auto_3173 ) ( not ( = ?auto_3173 ?auto_3175 ) ) ( not ( = ?auto_3173 ?auto_3174 ) ) ( not ( = ?auto_3173 ?auto_3176 ) ) ( not ( = ?auto_3175 ?auto_3174 ) ) ( not ( = ?auto_3175 ?auto_3176 ) ) ( not ( = ?auto_3174 ?auto_3176 ) ) ( ON ?auto_3174 ?auto_3175 ) ( ON ?auto_3176 ?auto_3174 ) ( CLEAR ?auto_3176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3173 ?auto_3175 ?auto_3174 )
      ( MAKE-1PILE ?auto_3173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3180 - BLOCK
      ?auto_3181 - BLOCK
      ?auto_3182 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3182 ) ( CLEAR ?auto_3181 ) ( ON-TABLE ?auto_3180 ) ( ON ?auto_3181 ?auto_3180 ) ( not ( = ?auto_3180 ?auto_3181 ) ) ( not ( = ?auto_3180 ?auto_3182 ) ) ( not ( = ?auto_3181 ?auto_3182 ) ) )
    :subtasks
    ( ( !STACK ?auto_3182 ?auto_3181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3183 - BLOCK
      ?auto_3184 - BLOCK
      ?auto_3185 - BLOCK
    )
    :vars
    (
      ?auto_3186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3184 ) ( ON-TABLE ?auto_3183 ) ( ON ?auto_3184 ?auto_3183 ) ( not ( = ?auto_3183 ?auto_3184 ) ) ( not ( = ?auto_3183 ?auto_3185 ) ) ( not ( = ?auto_3184 ?auto_3185 ) ) ( ON ?auto_3185 ?auto_3186 ) ( CLEAR ?auto_3185 ) ( HAND-EMPTY ) ( not ( = ?auto_3183 ?auto_3186 ) ) ( not ( = ?auto_3184 ?auto_3186 ) ) ( not ( = ?auto_3185 ?auto_3186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3185 ?auto_3186 )
      ( MAKE-3PILE ?auto_3183 ?auto_3184 ?auto_3185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3187 - BLOCK
      ?auto_3188 - BLOCK
      ?auto_3189 - BLOCK
    )
    :vars
    (
      ?auto_3190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3187 ) ( not ( = ?auto_3187 ?auto_3188 ) ) ( not ( = ?auto_3187 ?auto_3189 ) ) ( not ( = ?auto_3188 ?auto_3189 ) ) ( ON ?auto_3189 ?auto_3190 ) ( CLEAR ?auto_3189 ) ( not ( = ?auto_3187 ?auto_3190 ) ) ( not ( = ?auto_3188 ?auto_3190 ) ) ( not ( = ?auto_3189 ?auto_3190 ) ) ( HOLDING ?auto_3188 ) ( CLEAR ?auto_3187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3187 ?auto_3188 )
      ( MAKE-3PILE ?auto_3187 ?auto_3188 ?auto_3189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3191 - BLOCK
      ?auto_3192 - BLOCK
      ?auto_3193 - BLOCK
    )
    :vars
    (
      ?auto_3194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3191 ) ( not ( = ?auto_3191 ?auto_3192 ) ) ( not ( = ?auto_3191 ?auto_3193 ) ) ( not ( = ?auto_3192 ?auto_3193 ) ) ( ON ?auto_3193 ?auto_3194 ) ( not ( = ?auto_3191 ?auto_3194 ) ) ( not ( = ?auto_3192 ?auto_3194 ) ) ( not ( = ?auto_3193 ?auto_3194 ) ) ( CLEAR ?auto_3191 ) ( ON ?auto_3192 ?auto_3193 ) ( CLEAR ?auto_3192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3194 ?auto_3193 )
      ( MAKE-3PILE ?auto_3191 ?auto_3192 ?auto_3193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3195 - BLOCK
      ?auto_3196 - BLOCK
      ?auto_3197 - BLOCK
    )
    :vars
    (
      ?auto_3198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3195 ?auto_3196 ) ) ( not ( = ?auto_3195 ?auto_3197 ) ) ( not ( = ?auto_3196 ?auto_3197 ) ) ( ON ?auto_3197 ?auto_3198 ) ( not ( = ?auto_3195 ?auto_3198 ) ) ( not ( = ?auto_3196 ?auto_3198 ) ) ( not ( = ?auto_3197 ?auto_3198 ) ) ( ON ?auto_3196 ?auto_3197 ) ( CLEAR ?auto_3196 ) ( ON-TABLE ?auto_3198 ) ( HOLDING ?auto_3195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3195 )
      ( MAKE-3PILE ?auto_3195 ?auto_3196 ?auto_3197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3199 - BLOCK
      ?auto_3200 - BLOCK
      ?auto_3201 - BLOCK
    )
    :vars
    (
      ?auto_3202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3199 ?auto_3200 ) ) ( not ( = ?auto_3199 ?auto_3201 ) ) ( not ( = ?auto_3200 ?auto_3201 ) ) ( ON ?auto_3201 ?auto_3202 ) ( not ( = ?auto_3199 ?auto_3202 ) ) ( not ( = ?auto_3200 ?auto_3202 ) ) ( not ( = ?auto_3201 ?auto_3202 ) ) ( ON ?auto_3200 ?auto_3201 ) ( ON-TABLE ?auto_3202 ) ( ON ?auto_3199 ?auto_3200 ) ( CLEAR ?auto_3199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3202 ?auto_3201 ?auto_3200 )
      ( MAKE-3PILE ?auto_3199 ?auto_3200 ?auto_3201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3205 - BLOCK
      ?auto_3206 - BLOCK
    )
    :vars
    (
      ?auto_3207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3207 ?auto_3206 ) ( CLEAR ?auto_3207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3205 ) ( ON ?auto_3206 ?auto_3205 ) ( not ( = ?auto_3205 ?auto_3206 ) ) ( not ( = ?auto_3205 ?auto_3207 ) ) ( not ( = ?auto_3206 ?auto_3207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3207 ?auto_3206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3215 - BLOCK
      ?auto_3216 - BLOCK
    )
    :vars
    (
      ?auto_3217 - BLOCK
      ?auto_3218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3215 ) ( not ( = ?auto_3215 ?auto_3216 ) ) ( not ( = ?auto_3215 ?auto_3217 ) ) ( not ( = ?auto_3216 ?auto_3217 ) ) ( ON ?auto_3217 ?auto_3218 ) ( CLEAR ?auto_3217 ) ( not ( = ?auto_3215 ?auto_3218 ) ) ( not ( = ?auto_3216 ?auto_3218 ) ) ( not ( = ?auto_3217 ?auto_3218 ) ) ( HOLDING ?auto_3216 ) ( CLEAR ?auto_3215 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3215 ?auto_3216 ?auto_3217 )
      ( MAKE-2PILE ?auto_3215 ?auto_3216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3219 - BLOCK
      ?auto_3220 - BLOCK
    )
    :vars
    (
      ?auto_3221 - BLOCK
      ?auto_3222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3219 ) ( not ( = ?auto_3219 ?auto_3220 ) ) ( not ( = ?auto_3219 ?auto_3221 ) ) ( not ( = ?auto_3220 ?auto_3221 ) ) ( ON ?auto_3221 ?auto_3222 ) ( not ( = ?auto_3219 ?auto_3222 ) ) ( not ( = ?auto_3220 ?auto_3222 ) ) ( not ( = ?auto_3221 ?auto_3222 ) ) ( CLEAR ?auto_3219 ) ( ON ?auto_3220 ?auto_3221 ) ( CLEAR ?auto_3220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3222 ?auto_3221 )
      ( MAKE-2PILE ?auto_3219 ?auto_3220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3223 - BLOCK
      ?auto_3224 - BLOCK
    )
    :vars
    (
      ?auto_3226 - BLOCK
      ?auto_3225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3223 ?auto_3224 ) ) ( not ( = ?auto_3223 ?auto_3226 ) ) ( not ( = ?auto_3224 ?auto_3226 ) ) ( ON ?auto_3226 ?auto_3225 ) ( not ( = ?auto_3223 ?auto_3225 ) ) ( not ( = ?auto_3224 ?auto_3225 ) ) ( not ( = ?auto_3226 ?auto_3225 ) ) ( ON ?auto_3224 ?auto_3226 ) ( CLEAR ?auto_3224 ) ( ON-TABLE ?auto_3225 ) ( HOLDING ?auto_3223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3223 )
      ( MAKE-2PILE ?auto_3223 ?auto_3224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3227 - BLOCK
      ?auto_3228 - BLOCK
    )
    :vars
    (
      ?auto_3230 - BLOCK
      ?auto_3229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3227 ?auto_3228 ) ) ( not ( = ?auto_3227 ?auto_3230 ) ) ( not ( = ?auto_3228 ?auto_3230 ) ) ( ON ?auto_3230 ?auto_3229 ) ( not ( = ?auto_3227 ?auto_3229 ) ) ( not ( = ?auto_3228 ?auto_3229 ) ) ( not ( = ?auto_3230 ?auto_3229 ) ) ( ON ?auto_3228 ?auto_3230 ) ( ON-TABLE ?auto_3229 ) ( ON ?auto_3227 ?auto_3228 ) ( CLEAR ?auto_3227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3229 ?auto_3230 ?auto_3228 )
      ( MAKE-2PILE ?auto_3227 ?auto_3228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3232 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3232 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3233 - BLOCK
    )
    :vars
    (
      ?auto_3234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3233 ?auto_3234 ) ( CLEAR ?auto_3233 ) ( HAND-EMPTY ) ( not ( = ?auto_3233 ?auto_3234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3233 ?auto_3234 )
      ( MAKE-1PILE ?auto_3233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3235 - BLOCK
    )
    :vars
    (
      ?auto_3236 - BLOCK
      ?auto_3237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3235 ?auto_3236 ) ) ( HOLDING ?auto_3235 ) ( CLEAR ?auto_3236 ) ( ON-TABLE ?auto_3237 ) ( ON ?auto_3236 ?auto_3237 ) ( not ( = ?auto_3237 ?auto_3236 ) ) ( not ( = ?auto_3237 ?auto_3235 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3237 ?auto_3236 ?auto_3235 )
      ( MAKE-1PILE ?auto_3235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3238 - BLOCK
    )
    :vars
    (
      ?auto_3239 - BLOCK
      ?auto_3240 - BLOCK
      ?auto_3241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3238 ?auto_3239 ) ) ( CLEAR ?auto_3239 ) ( ON-TABLE ?auto_3240 ) ( ON ?auto_3239 ?auto_3240 ) ( not ( = ?auto_3240 ?auto_3239 ) ) ( not ( = ?auto_3240 ?auto_3238 ) ) ( ON ?auto_3238 ?auto_3241 ) ( CLEAR ?auto_3238 ) ( HAND-EMPTY ) ( not ( = ?auto_3238 ?auto_3241 ) ) ( not ( = ?auto_3239 ?auto_3241 ) ) ( not ( = ?auto_3240 ?auto_3241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3238 ?auto_3241 )
      ( MAKE-1PILE ?auto_3238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3242 - BLOCK
    )
    :vars
    (
      ?auto_3245 - BLOCK
      ?auto_3243 - BLOCK
      ?auto_3244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3242 ?auto_3245 ) ) ( ON-TABLE ?auto_3243 ) ( not ( = ?auto_3243 ?auto_3245 ) ) ( not ( = ?auto_3243 ?auto_3242 ) ) ( ON ?auto_3242 ?auto_3244 ) ( CLEAR ?auto_3242 ) ( not ( = ?auto_3242 ?auto_3244 ) ) ( not ( = ?auto_3245 ?auto_3244 ) ) ( not ( = ?auto_3243 ?auto_3244 ) ) ( HOLDING ?auto_3245 ) ( CLEAR ?auto_3243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3243 ?auto_3245 )
      ( MAKE-1PILE ?auto_3242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3246 - BLOCK
    )
    :vars
    (
      ?auto_3247 - BLOCK
      ?auto_3249 - BLOCK
      ?auto_3248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3246 ?auto_3247 ) ) ( ON-TABLE ?auto_3249 ) ( not ( = ?auto_3249 ?auto_3247 ) ) ( not ( = ?auto_3249 ?auto_3246 ) ) ( ON ?auto_3246 ?auto_3248 ) ( not ( = ?auto_3246 ?auto_3248 ) ) ( not ( = ?auto_3247 ?auto_3248 ) ) ( not ( = ?auto_3249 ?auto_3248 ) ) ( CLEAR ?auto_3249 ) ( ON ?auto_3247 ?auto_3246 ) ( CLEAR ?auto_3247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3248 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3248 ?auto_3246 )
      ( MAKE-1PILE ?auto_3246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3250 - BLOCK
    )
    :vars
    (
      ?auto_3253 - BLOCK
      ?auto_3251 - BLOCK
      ?auto_3252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3250 ?auto_3253 ) ) ( not ( = ?auto_3251 ?auto_3253 ) ) ( not ( = ?auto_3251 ?auto_3250 ) ) ( ON ?auto_3250 ?auto_3252 ) ( not ( = ?auto_3250 ?auto_3252 ) ) ( not ( = ?auto_3253 ?auto_3252 ) ) ( not ( = ?auto_3251 ?auto_3252 ) ) ( ON ?auto_3253 ?auto_3250 ) ( CLEAR ?auto_3253 ) ( ON-TABLE ?auto_3252 ) ( HOLDING ?auto_3251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3251 )
      ( MAKE-1PILE ?auto_3250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3254 - BLOCK
    )
    :vars
    (
      ?auto_3255 - BLOCK
      ?auto_3256 - BLOCK
      ?auto_3257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3254 ?auto_3255 ) ) ( not ( = ?auto_3256 ?auto_3255 ) ) ( not ( = ?auto_3256 ?auto_3254 ) ) ( ON ?auto_3254 ?auto_3257 ) ( not ( = ?auto_3254 ?auto_3257 ) ) ( not ( = ?auto_3255 ?auto_3257 ) ) ( not ( = ?auto_3256 ?auto_3257 ) ) ( ON ?auto_3255 ?auto_3254 ) ( ON-TABLE ?auto_3257 ) ( ON ?auto_3256 ?auto_3255 ) ( CLEAR ?auto_3256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3257 ?auto_3254 ?auto_3255 )
      ( MAKE-1PILE ?auto_3254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3259 - BLOCK
    )
    :vars
    (
      ?auto_3260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3260 ?auto_3259 ) ( CLEAR ?auto_3260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3259 ) ( not ( = ?auto_3259 ?auto_3260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3260 ?auto_3259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3261 - BLOCK
    )
    :vars
    (
      ?auto_3262 - BLOCK
      ?auto_3263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3262 ?auto_3261 ) ( CLEAR ?auto_3262 ) ( ON-TABLE ?auto_3261 ) ( not ( = ?auto_3261 ?auto_3262 ) ) ( HOLDING ?auto_3263 ) ( not ( = ?auto_3261 ?auto_3263 ) ) ( not ( = ?auto_3262 ?auto_3263 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3263 )
      ( MAKE-1PILE ?auto_3261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3264 - BLOCK
    )
    :vars
    (
      ?auto_3266 - BLOCK
      ?auto_3265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3266 ?auto_3264 ) ( ON-TABLE ?auto_3264 ) ( not ( = ?auto_3264 ?auto_3266 ) ) ( not ( = ?auto_3264 ?auto_3265 ) ) ( not ( = ?auto_3266 ?auto_3265 ) ) ( ON ?auto_3265 ?auto_3266 ) ( CLEAR ?auto_3265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3264 ?auto_3266 )
      ( MAKE-1PILE ?auto_3264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3267 - BLOCK
    )
    :vars
    (
      ?auto_3268 - BLOCK
      ?auto_3269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3268 ?auto_3267 ) ( ON-TABLE ?auto_3267 ) ( not ( = ?auto_3267 ?auto_3268 ) ) ( not ( = ?auto_3267 ?auto_3269 ) ) ( not ( = ?auto_3268 ?auto_3269 ) ) ( HOLDING ?auto_3269 ) ( CLEAR ?auto_3268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3267 ?auto_3268 ?auto_3269 )
      ( MAKE-1PILE ?auto_3267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3270 - BLOCK
    )
    :vars
    (
      ?auto_3271 - BLOCK
      ?auto_3272 - BLOCK
      ?auto_3273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3271 ?auto_3270 ) ( ON-TABLE ?auto_3270 ) ( not ( = ?auto_3270 ?auto_3271 ) ) ( not ( = ?auto_3270 ?auto_3272 ) ) ( not ( = ?auto_3271 ?auto_3272 ) ) ( CLEAR ?auto_3271 ) ( ON ?auto_3272 ?auto_3273 ) ( CLEAR ?auto_3272 ) ( HAND-EMPTY ) ( not ( = ?auto_3270 ?auto_3273 ) ) ( not ( = ?auto_3271 ?auto_3273 ) ) ( not ( = ?auto_3272 ?auto_3273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3272 ?auto_3273 )
      ( MAKE-1PILE ?auto_3270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3282 - BLOCK
    )
    :vars
    (
      ?auto_3283 - BLOCK
      ?auto_3285 - BLOCK
      ?auto_3284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3282 ?auto_3283 ) ) ( not ( = ?auto_3282 ?auto_3285 ) ) ( not ( = ?auto_3283 ?auto_3285 ) ) ( ON ?auto_3285 ?auto_3284 ) ( not ( = ?auto_3282 ?auto_3284 ) ) ( not ( = ?auto_3283 ?auto_3284 ) ) ( not ( = ?auto_3285 ?auto_3284 ) ) ( ON ?auto_3283 ?auto_3285 ) ( CLEAR ?auto_3283 ) ( HOLDING ?auto_3282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3282 ?auto_3283 )
      ( MAKE-1PILE ?auto_3282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3286 - BLOCK
    )
    :vars
    (
      ?auto_3287 - BLOCK
      ?auto_3288 - BLOCK
      ?auto_3289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3286 ?auto_3287 ) ) ( not ( = ?auto_3286 ?auto_3288 ) ) ( not ( = ?auto_3287 ?auto_3288 ) ) ( ON ?auto_3288 ?auto_3289 ) ( not ( = ?auto_3286 ?auto_3289 ) ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3288 ?auto_3289 ) ) ( ON ?auto_3287 ?auto_3288 ) ( ON ?auto_3286 ?auto_3287 ) ( CLEAR ?auto_3286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3289 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3289 ?auto_3288 ?auto_3287 )
      ( MAKE-1PILE ?auto_3286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3292 - BLOCK
      ?auto_3293 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3293 ) ( CLEAR ?auto_3292 ) ( ON-TABLE ?auto_3292 ) ( not ( = ?auto_3292 ?auto_3293 ) ) )
    :subtasks
    ( ( !STACK ?auto_3293 ?auto_3292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3294 - BLOCK
      ?auto_3295 - BLOCK
    )
    :vars
    (
      ?auto_3296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3294 ) ( ON-TABLE ?auto_3294 ) ( not ( = ?auto_3294 ?auto_3295 ) ) ( ON ?auto_3295 ?auto_3296 ) ( CLEAR ?auto_3295 ) ( HAND-EMPTY ) ( not ( = ?auto_3294 ?auto_3296 ) ) ( not ( = ?auto_3295 ?auto_3296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3295 ?auto_3296 )
      ( MAKE-2PILE ?auto_3294 ?auto_3295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3297 - BLOCK
      ?auto_3298 - BLOCK
    )
    :vars
    (
      ?auto_3299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3297 ?auto_3298 ) ) ( ON ?auto_3298 ?auto_3299 ) ( CLEAR ?auto_3298 ) ( not ( = ?auto_3297 ?auto_3299 ) ) ( not ( = ?auto_3298 ?auto_3299 ) ) ( HOLDING ?auto_3297 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3297 )
      ( MAKE-2PILE ?auto_3297 ?auto_3298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3300 - BLOCK
      ?auto_3301 - BLOCK
    )
    :vars
    (
      ?auto_3302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3300 ?auto_3301 ) ) ( ON ?auto_3301 ?auto_3302 ) ( not ( = ?auto_3300 ?auto_3302 ) ) ( not ( = ?auto_3301 ?auto_3302 ) ) ( ON ?auto_3300 ?auto_3301 ) ( CLEAR ?auto_3300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3302 ?auto_3301 )
      ( MAKE-2PILE ?auto_3300 ?auto_3301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3303 - BLOCK
      ?auto_3304 - BLOCK
    )
    :vars
    (
      ?auto_3305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3303 ?auto_3304 ) ) ( ON ?auto_3304 ?auto_3305 ) ( not ( = ?auto_3303 ?auto_3305 ) ) ( not ( = ?auto_3304 ?auto_3305 ) ) ( ON-TABLE ?auto_3305 ) ( HOLDING ?auto_3303 ) ( CLEAR ?auto_3304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3305 ?auto_3304 ?auto_3303 )
      ( MAKE-2PILE ?auto_3303 ?auto_3304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3306 - BLOCK
      ?auto_3307 - BLOCK
    )
    :vars
    (
      ?auto_3308 - BLOCK
      ?auto_3309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3306 ?auto_3307 ) ) ( ON ?auto_3307 ?auto_3308 ) ( not ( = ?auto_3306 ?auto_3308 ) ) ( not ( = ?auto_3307 ?auto_3308 ) ) ( ON-TABLE ?auto_3308 ) ( CLEAR ?auto_3307 ) ( ON ?auto_3306 ?auto_3309 ) ( CLEAR ?auto_3306 ) ( HAND-EMPTY ) ( not ( = ?auto_3306 ?auto_3309 ) ) ( not ( = ?auto_3307 ?auto_3309 ) ) ( not ( = ?auto_3308 ?auto_3309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3306 ?auto_3309 )
      ( MAKE-2PILE ?auto_3306 ?auto_3307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3310 - BLOCK
      ?auto_3311 - BLOCK
    )
    :vars
    (
      ?auto_3313 - BLOCK
      ?auto_3312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3310 ?auto_3311 ) ) ( not ( = ?auto_3310 ?auto_3313 ) ) ( not ( = ?auto_3311 ?auto_3313 ) ) ( ON-TABLE ?auto_3313 ) ( ON ?auto_3310 ?auto_3312 ) ( CLEAR ?auto_3310 ) ( not ( = ?auto_3310 ?auto_3312 ) ) ( not ( = ?auto_3311 ?auto_3312 ) ) ( not ( = ?auto_3313 ?auto_3312 ) ) ( HOLDING ?auto_3311 ) ( CLEAR ?auto_3313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3313 ?auto_3311 )
      ( MAKE-2PILE ?auto_3310 ?auto_3311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3314 - BLOCK
      ?auto_3315 - BLOCK
    )
    :vars
    (
      ?auto_3316 - BLOCK
      ?auto_3317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3314 ?auto_3315 ) ) ( not ( = ?auto_3314 ?auto_3316 ) ) ( not ( = ?auto_3315 ?auto_3316 ) ) ( ON-TABLE ?auto_3316 ) ( ON ?auto_3314 ?auto_3317 ) ( not ( = ?auto_3314 ?auto_3317 ) ) ( not ( = ?auto_3315 ?auto_3317 ) ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( CLEAR ?auto_3316 ) ( ON ?auto_3315 ?auto_3314 ) ( CLEAR ?auto_3315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3317 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3317 ?auto_3314 )
      ( MAKE-2PILE ?auto_3314 ?auto_3315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3318 - BLOCK
      ?auto_3319 - BLOCK
    )
    :vars
    (
      ?auto_3320 - BLOCK
      ?auto_3321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3318 ?auto_3319 ) ) ( not ( = ?auto_3318 ?auto_3320 ) ) ( not ( = ?auto_3319 ?auto_3320 ) ) ( ON ?auto_3318 ?auto_3321 ) ( not ( = ?auto_3318 ?auto_3321 ) ) ( not ( = ?auto_3319 ?auto_3321 ) ) ( not ( = ?auto_3320 ?auto_3321 ) ) ( ON ?auto_3319 ?auto_3318 ) ( CLEAR ?auto_3319 ) ( ON-TABLE ?auto_3321 ) ( HOLDING ?auto_3320 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3320 )
      ( MAKE-2PILE ?auto_3318 ?auto_3319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3322 - BLOCK
      ?auto_3323 - BLOCK
    )
    :vars
    (
      ?auto_3325 - BLOCK
      ?auto_3324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3322 ?auto_3323 ) ) ( not ( = ?auto_3322 ?auto_3325 ) ) ( not ( = ?auto_3323 ?auto_3325 ) ) ( ON ?auto_3322 ?auto_3324 ) ( not ( = ?auto_3322 ?auto_3324 ) ) ( not ( = ?auto_3323 ?auto_3324 ) ) ( not ( = ?auto_3325 ?auto_3324 ) ) ( ON ?auto_3323 ?auto_3322 ) ( ON-TABLE ?auto_3324 ) ( ON ?auto_3325 ?auto_3323 ) ( CLEAR ?auto_3325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3324 ?auto_3322 ?auto_3323 )
      ( MAKE-2PILE ?auto_3322 ?auto_3323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3329 - BLOCK
      ?auto_3330 - BLOCK
      ?auto_3331 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3331 ) ( CLEAR ?auto_3330 ) ( ON-TABLE ?auto_3329 ) ( ON ?auto_3330 ?auto_3329 ) ( not ( = ?auto_3329 ?auto_3330 ) ) ( not ( = ?auto_3329 ?auto_3331 ) ) ( not ( = ?auto_3330 ?auto_3331 ) ) )
    :subtasks
    ( ( !STACK ?auto_3331 ?auto_3330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3332 - BLOCK
      ?auto_3333 - BLOCK
      ?auto_3334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3333 ) ( ON-TABLE ?auto_3332 ) ( ON ?auto_3333 ?auto_3332 ) ( not ( = ?auto_3332 ?auto_3333 ) ) ( not ( = ?auto_3332 ?auto_3334 ) ) ( not ( = ?auto_3333 ?auto_3334 ) ) ( ON-TABLE ?auto_3334 ) ( CLEAR ?auto_3334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_3334 )
      ( MAKE-3PILE ?auto_3332 ?auto_3333 ?auto_3334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3335 - BLOCK
      ?auto_3336 - BLOCK
      ?auto_3337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3335 ) ( not ( = ?auto_3335 ?auto_3336 ) ) ( not ( = ?auto_3335 ?auto_3337 ) ) ( not ( = ?auto_3336 ?auto_3337 ) ) ( ON-TABLE ?auto_3337 ) ( CLEAR ?auto_3337 ) ( HOLDING ?auto_3336 ) ( CLEAR ?auto_3335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3335 ?auto_3336 )
      ( MAKE-3PILE ?auto_3335 ?auto_3336 ?auto_3337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3338 - BLOCK
      ?auto_3339 - BLOCK
      ?auto_3340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3338 ) ( not ( = ?auto_3338 ?auto_3339 ) ) ( not ( = ?auto_3338 ?auto_3340 ) ) ( not ( = ?auto_3339 ?auto_3340 ) ) ( ON-TABLE ?auto_3340 ) ( CLEAR ?auto_3338 ) ( ON ?auto_3339 ?auto_3340 ) ( CLEAR ?auto_3339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3340 )
      ( MAKE-3PILE ?auto_3338 ?auto_3339 ?auto_3340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3341 - BLOCK
      ?auto_3342 - BLOCK
      ?auto_3343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3341 ?auto_3342 ) ) ( not ( = ?auto_3341 ?auto_3343 ) ) ( not ( = ?auto_3342 ?auto_3343 ) ) ( ON-TABLE ?auto_3343 ) ( ON ?auto_3342 ?auto_3343 ) ( CLEAR ?auto_3342 ) ( HOLDING ?auto_3341 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3341 )
      ( MAKE-3PILE ?auto_3341 ?auto_3342 ?auto_3343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3344 - BLOCK
      ?auto_3345 - BLOCK
      ?auto_3346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3344 ?auto_3345 ) ) ( not ( = ?auto_3344 ?auto_3346 ) ) ( not ( = ?auto_3345 ?auto_3346 ) ) ( ON-TABLE ?auto_3346 ) ( ON ?auto_3345 ?auto_3346 ) ( ON ?auto_3344 ?auto_3345 ) ( CLEAR ?auto_3344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3346 ?auto_3345 )
      ( MAKE-3PILE ?auto_3344 ?auto_3345 ?auto_3346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3347 - BLOCK
      ?auto_3348 - BLOCK
      ?auto_3349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3347 ?auto_3348 ) ) ( not ( = ?auto_3347 ?auto_3349 ) ) ( not ( = ?auto_3348 ?auto_3349 ) ) ( ON-TABLE ?auto_3349 ) ( ON ?auto_3348 ?auto_3349 ) ( HOLDING ?auto_3347 ) ( CLEAR ?auto_3348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3349 ?auto_3348 ?auto_3347 )
      ( MAKE-3PILE ?auto_3347 ?auto_3348 ?auto_3349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3350 - BLOCK
      ?auto_3351 - BLOCK
      ?auto_3352 - BLOCK
    )
    :vars
    (
      ?auto_3353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3350 ?auto_3351 ) ) ( not ( = ?auto_3350 ?auto_3352 ) ) ( not ( = ?auto_3351 ?auto_3352 ) ) ( ON-TABLE ?auto_3352 ) ( ON ?auto_3351 ?auto_3352 ) ( CLEAR ?auto_3351 ) ( ON ?auto_3350 ?auto_3353 ) ( CLEAR ?auto_3350 ) ( HAND-EMPTY ) ( not ( = ?auto_3350 ?auto_3353 ) ) ( not ( = ?auto_3351 ?auto_3353 ) ) ( not ( = ?auto_3352 ?auto_3353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3350 ?auto_3353 )
      ( MAKE-3PILE ?auto_3350 ?auto_3351 ?auto_3352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3354 - BLOCK
      ?auto_3355 - BLOCK
      ?auto_3356 - BLOCK
    )
    :vars
    (
      ?auto_3357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3354 ?auto_3355 ) ) ( not ( = ?auto_3354 ?auto_3356 ) ) ( not ( = ?auto_3355 ?auto_3356 ) ) ( ON-TABLE ?auto_3356 ) ( ON ?auto_3354 ?auto_3357 ) ( CLEAR ?auto_3354 ) ( not ( = ?auto_3354 ?auto_3357 ) ) ( not ( = ?auto_3355 ?auto_3357 ) ) ( not ( = ?auto_3356 ?auto_3357 ) ) ( HOLDING ?auto_3355 ) ( CLEAR ?auto_3356 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3356 ?auto_3355 )
      ( MAKE-3PILE ?auto_3354 ?auto_3355 ?auto_3356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3358 - BLOCK
      ?auto_3359 - BLOCK
      ?auto_3360 - BLOCK
    )
    :vars
    (
      ?auto_3361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3358 ?auto_3359 ) ) ( not ( = ?auto_3358 ?auto_3360 ) ) ( not ( = ?auto_3359 ?auto_3360 ) ) ( ON-TABLE ?auto_3360 ) ( ON ?auto_3358 ?auto_3361 ) ( not ( = ?auto_3358 ?auto_3361 ) ) ( not ( = ?auto_3359 ?auto_3361 ) ) ( not ( = ?auto_3360 ?auto_3361 ) ) ( CLEAR ?auto_3360 ) ( ON ?auto_3359 ?auto_3358 ) ( CLEAR ?auto_3359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3361 ?auto_3358 )
      ( MAKE-3PILE ?auto_3358 ?auto_3359 ?auto_3360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3362 - BLOCK
      ?auto_3363 - BLOCK
      ?auto_3364 - BLOCK
    )
    :vars
    (
      ?auto_3365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3362 ?auto_3363 ) ) ( not ( = ?auto_3362 ?auto_3364 ) ) ( not ( = ?auto_3363 ?auto_3364 ) ) ( ON ?auto_3362 ?auto_3365 ) ( not ( = ?auto_3362 ?auto_3365 ) ) ( not ( = ?auto_3363 ?auto_3365 ) ) ( not ( = ?auto_3364 ?auto_3365 ) ) ( ON ?auto_3363 ?auto_3362 ) ( CLEAR ?auto_3363 ) ( ON-TABLE ?auto_3365 ) ( HOLDING ?auto_3364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3364 )
      ( MAKE-3PILE ?auto_3362 ?auto_3363 ?auto_3364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3366 - BLOCK
      ?auto_3367 - BLOCK
      ?auto_3368 - BLOCK
    )
    :vars
    (
      ?auto_3369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3366 ?auto_3367 ) ) ( not ( = ?auto_3366 ?auto_3368 ) ) ( not ( = ?auto_3367 ?auto_3368 ) ) ( ON ?auto_3366 ?auto_3369 ) ( not ( = ?auto_3366 ?auto_3369 ) ) ( not ( = ?auto_3367 ?auto_3369 ) ) ( not ( = ?auto_3368 ?auto_3369 ) ) ( ON ?auto_3367 ?auto_3366 ) ( ON-TABLE ?auto_3369 ) ( ON ?auto_3368 ?auto_3367 ) ( CLEAR ?auto_3368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3369 ?auto_3366 ?auto_3367 )
      ( MAKE-3PILE ?auto_3366 ?auto_3367 ?auto_3368 ) )
  )

)

