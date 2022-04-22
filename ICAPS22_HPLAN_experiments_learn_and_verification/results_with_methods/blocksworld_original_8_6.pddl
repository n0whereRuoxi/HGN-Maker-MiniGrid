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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_158178 - BLOCK
      ?auto_158179 - BLOCK
      ?auto_158180 - BLOCK
      ?auto_158181 - BLOCK
      ?auto_158182 - BLOCK
      ?auto_158183 - BLOCK
      ?auto_158184 - BLOCK
      ?auto_158185 - BLOCK
    )
    :vars
    (
      ?auto_158186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158186 ?auto_158185 ) ( CLEAR ?auto_158186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158178 ) ( ON ?auto_158179 ?auto_158178 ) ( ON ?auto_158180 ?auto_158179 ) ( ON ?auto_158181 ?auto_158180 ) ( ON ?auto_158182 ?auto_158181 ) ( ON ?auto_158183 ?auto_158182 ) ( ON ?auto_158184 ?auto_158183 ) ( ON ?auto_158185 ?auto_158184 ) ( not ( = ?auto_158178 ?auto_158179 ) ) ( not ( = ?auto_158178 ?auto_158180 ) ) ( not ( = ?auto_158178 ?auto_158181 ) ) ( not ( = ?auto_158178 ?auto_158182 ) ) ( not ( = ?auto_158178 ?auto_158183 ) ) ( not ( = ?auto_158178 ?auto_158184 ) ) ( not ( = ?auto_158178 ?auto_158185 ) ) ( not ( = ?auto_158178 ?auto_158186 ) ) ( not ( = ?auto_158179 ?auto_158180 ) ) ( not ( = ?auto_158179 ?auto_158181 ) ) ( not ( = ?auto_158179 ?auto_158182 ) ) ( not ( = ?auto_158179 ?auto_158183 ) ) ( not ( = ?auto_158179 ?auto_158184 ) ) ( not ( = ?auto_158179 ?auto_158185 ) ) ( not ( = ?auto_158179 ?auto_158186 ) ) ( not ( = ?auto_158180 ?auto_158181 ) ) ( not ( = ?auto_158180 ?auto_158182 ) ) ( not ( = ?auto_158180 ?auto_158183 ) ) ( not ( = ?auto_158180 ?auto_158184 ) ) ( not ( = ?auto_158180 ?auto_158185 ) ) ( not ( = ?auto_158180 ?auto_158186 ) ) ( not ( = ?auto_158181 ?auto_158182 ) ) ( not ( = ?auto_158181 ?auto_158183 ) ) ( not ( = ?auto_158181 ?auto_158184 ) ) ( not ( = ?auto_158181 ?auto_158185 ) ) ( not ( = ?auto_158181 ?auto_158186 ) ) ( not ( = ?auto_158182 ?auto_158183 ) ) ( not ( = ?auto_158182 ?auto_158184 ) ) ( not ( = ?auto_158182 ?auto_158185 ) ) ( not ( = ?auto_158182 ?auto_158186 ) ) ( not ( = ?auto_158183 ?auto_158184 ) ) ( not ( = ?auto_158183 ?auto_158185 ) ) ( not ( = ?auto_158183 ?auto_158186 ) ) ( not ( = ?auto_158184 ?auto_158185 ) ) ( not ( = ?auto_158184 ?auto_158186 ) ) ( not ( = ?auto_158185 ?auto_158186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158186 ?auto_158185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_158188 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158188 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_158188 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_158189 - BLOCK
    )
    :vars
    (
      ?auto_158190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158189 ?auto_158190 ) ( CLEAR ?auto_158189 ) ( HAND-EMPTY ) ( not ( = ?auto_158189 ?auto_158190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158189 ?auto_158190 )
      ( MAKE-1PILE ?auto_158189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158198 - BLOCK
      ?auto_158199 - BLOCK
      ?auto_158200 - BLOCK
      ?auto_158201 - BLOCK
      ?auto_158202 - BLOCK
      ?auto_158203 - BLOCK
      ?auto_158204 - BLOCK
    )
    :vars
    (
      ?auto_158205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158205 ?auto_158204 ) ( CLEAR ?auto_158205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158198 ) ( ON ?auto_158199 ?auto_158198 ) ( ON ?auto_158200 ?auto_158199 ) ( ON ?auto_158201 ?auto_158200 ) ( ON ?auto_158202 ?auto_158201 ) ( ON ?auto_158203 ?auto_158202 ) ( ON ?auto_158204 ?auto_158203 ) ( not ( = ?auto_158198 ?auto_158199 ) ) ( not ( = ?auto_158198 ?auto_158200 ) ) ( not ( = ?auto_158198 ?auto_158201 ) ) ( not ( = ?auto_158198 ?auto_158202 ) ) ( not ( = ?auto_158198 ?auto_158203 ) ) ( not ( = ?auto_158198 ?auto_158204 ) ) ( not ( = ?auto_158198 ?auto_158205 ) ) ( not ( = ?auto_158199 ?auto_158200 ) ) ( not ( = ?auto_158199 ?auto_158201 ) ) ( not ( = ?auto_158199 ?auto_158202 ) ) ( not ( = ?auto_158199 ?auto_158203 ) ) ( not ( = ?auto_158199 ?auto_158204 ) ) ( not ( = ?auto_158199 ?auto_158205 ) ) ( not ( = ?auto_158200 ?auto_158201 ) ) ( not ( = ?auto_158200 ?auto_158202 ) ) ( not ( = ?auto_158200 ?auto_158203 ) ) ( not ( = ?auto_158200 ?auto_158204 ) ) ( not ( = ?auto_158200 ?auto_158205 ) ) ( not ( = ?auto_158201 ?auto_158202 ) ) ( not ( = ?auto_158201 ?auto_158203 ) ) ( not ( = ?auto_158201 ?auto_158204 ) ) ( not ( = ?auto_158201 ?auto_158205 ) ) ( not ( = ?auto_158202 ?auto_158203 ) ) ( not ( = ?auto_158202 ?auto_158204 ) ) ( not ( = ?auto_158202 ?auto_158205 ) ) ( not ( = ?auto_158203 ?auto_158204 ) ) ( not ( = ?auto_158203 ?auto_158205 ) ) ( not ( = ?auto_158204 ?auto_158205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158205 ?auto_158204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158206 - BLOCK
      ?auto_158207 - BLOCK
      ?auto_158208 - BLOCK
      ?auto_158209 - BLOCK
      ?auto_158210 - BLOCK
      ?auto_158211 - BLOCK
      ?auto_158212 - BLOCK
    )
    :vars
    (
      ?auto_158213 - BLOCK
      ?auto_158214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158213 ?auto_158212 ) ( CLEAR ?auto_158213 ) ( ON-TABLE ?auto_158206 ) ( ON ?auto_158207 ?auto_158206 ) ( ON ?auto_158208 ?auto_158207 ) ( ON ?auto_158209 ?auto_158208 ) ( ON ?auto_158210 ?auto_158209 ) ( ON ?auto_158211 ?auto_158210 ) ( ON ?auto_158212 ?auto_158211 ) ( not ( = ?auto_158206 ?auto_158207 ) ) ( not ( = ?auto_158206 ?auto_158208 ) ) ( not ( = ?auto_158206 ?auto_158209 ) ) ( not ( = ?auto_158206 ?auto_158210 ) ) ( not ( = ?auto_158206 ?auto_158211 ) ) ( not ( = ?auto_158206 ?auto_158212 ) ) ( not ( = ?auto_158206 ?auto_158213 ) ) ( not ( = ?auto_158207 ?auto_158208 ) ) ( not ( = ?auto_158207 ?auto_158209 ) ) ( not ( = ?auto_158207 ?auto_158210 ) ) ( not ( = ?auto_158207 ?auto_158211 ) ) ( not ( = ?auto_158207 ?auto_158212 ) ) ( not ( = ?auto_158207 ?auto_158213 ) ) ( not ( = ?auto_158208 ?auto_158209 ) ) ( not ( = ?auto_158208 ?auto_158210 ) ) ( not ( = ?auto_158208 ?auto_158211 ) ) ( not ( = ?auto_158208 ?auto_158212 ) ) ( not ( = ?auto_158208 ?auto_158213 ) ) ( not ( = ?auto_158209 ?auto_158210 ) ) ( not ( = ?auto_158209 ?auto_158211 ) ) ( not ( = ?auto_158209 ?auto_158212 ) ) ( not ( = ?auto_158209 ?auto_158213 ) ) ( not ( = ?auto_158210 ?auto_158211 ) ) ( not ( = ?auto_158210 ?auto_158212 ) ) ( not ( = ?auto_158210 ?auto_158213 ) ) ( not ( = ?auto_158211 ?auto_158212 ) ) ( not ( = ?auto_158211 ?auto_158213 ) ) ( not ( = ?auto_158212 ?auto_158213 ) ) ( HOLDING ?auto_158214 ) ( not ( = ?auto_158206 ?auto_158214 ) ) ( not ( = ?auto_158207 ?auto_158214 ) ) ( not ( = ?auto_158208 ?auto_158214 ) ) ( not ( = ?auto_158209 ?auto_158214 ) ) ( not ( = ?auto_158210 ?auto_158214 ) ) ( not ( = ?auto_158211 ?auto_158214 ) ) ( not ( = ?auto_158212 ?auto_158214 ) ) ( not ( = ?auto_158213 ?auto_158214 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_158214 )
      ( MAKE-7PILE ?auto_158206 ?auto_158207 ?auto_158208 ?auto_158209 ?auto_158210 ?auto_158211 ?auto_158212 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158215 - BLOCK
      ?auto_158216 - BLOCK
      ?auto_158217 - BLOCK
      ?auto_158218 - BLOCK
      ?auto_158219 - BLOCK
      ?auto_158220 - BLOCK
      ?auto_158221 - BLOCK
    )
    :vars
    (
      ?auto_158222 - BLOCK
      ?auto_158223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158222 ?auto_158221 ) ( ON-TABLE ?auto_158215 ) ( ON ?auto_158216 ?auto_158215 ) ( ON ?auto_158217 ?auto_158216 ) ( ON ?auto_158218 ?auto_158217 ) ( ON ?auto_158219 ?auto_158218 ) ( ON ?auto_158220 ?auto_158219 ) ( ON ?auto_158221 ?auto_158220 ) ( not ( = ?auto_158215 ?auto_158216 ) ) ( not ( = ?auto_158215 ?auto_158217 ) ) ( not ( = ?auto_158215 ?auto_158218 ) ) ( not ( = ?auto_158215 ?auto_158219 ) ) ( not ( = ?auto_158215 ?auto_158220 ) ) ( not ( = ?auto_158215 ?auto_158221 ) ) ( not ( = ?auto_158215 ?auto_158222 ) ) ( not ( = ?auto_158216 ?auto_158217 ) ) ( not ( = ?auto_158216 ?auto_158218 ) ) ( not ( = ?auto_158216 ?auto_158219 ) ) ( not ( = ?auto_158216 ?auto_158220 ) ) ( not ( = ?auto_158216 ?auto_158221 ) ) ( not ( = ?auto_158216 ?auto_158222 ) ) ( not ( = ?auto_158217 ?auto_158218 ) ) ( not ( = ?auto_158217 ?auto_158219 ) ) ( not ( = ?auto_158217 ?auto_158220 ) ) ( not ( = ?auto_158217 ?auto_158221 ) ) ( not ( = ?auto_158217 ?auto_158222 ) ) ( not ( = ?auto_158218 ?auto_158219 ) ) ( not ( = ?auto_158218 ?auto_158220 ) ) ( not ( = ?auto_158218 ?auto_158221 ) ) ( not ( = ?auto_158218 ?auto_158222 ) ) ( not ( = ?auto_158219 ?auto_158220 ) ) ( not ( = ?auto_158219 ?auto_158221 ) ) ( not ( = ?auto_158219 ?auto_158222 ) ) ( not ( = ?auto_158220 ?auto_158221 ) ) ( not ( = ?auto_158220 ?auto_158222 ) ) ( not ( = ?auto_158221 ?auto_158222 ) ) ( not ( = ?auto_158215 ?auto_158223 ) ) ( not ( = ?auto_158216 ?auto_158223 ) ) ( not ( = ?auto_158217 ?auto_158223 ) ) ( not ( = ?auto_158218 ?auto_158223 ) ) ( not ( = ?auto_158219 ?auto_158223 ) ) ( not ( = ?auto_158220 ?auto_158223 ) ) ( not ( = ?auto_158221 ?auto_158223 ) ) ( not ( = ?auto_158222 ?auto_158223 ) ) ( ON ?auto_158223 ?auto_158222 ) ( CLEAR ?auto_158223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158215 ?auto_158216 ?auto_158217 ?auto_158218 ?auto_158219 ?auto_158220 ?auto_158221 ?auto_158222 )
      ( MAKE-7PILE ?auto_158215 ?auto_158216 ?auto_158217 ?auto_158218 ?auto_158219 ?auto_158220 ?auto_158221 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158226 - BLOCK
      ?auto_158227 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158227 ) ( CLEAR ?auto_158226 ) ( ON-TABLE ?auto_158226 ) ( not ( = ?auto_158226 ?auto_158227 ) ) )
    :subtasks
    ( ( !STACK ?auto_158227 ?auto_158226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158228 - BLOCK
      ?auto_158229 - BLOCK
    )
    :vars
    (
      ?auto_158230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158228 ) ( ON-TABLE ?auto_158228 ) ( not ( = ?auto_158228 ?auto_158229 ) ) ( ON ?auto_158229 ?auto_158230 ) ( CLEAR ?auto_158229 ) ( HAND-EMPTY ) ( not ( = ?auto_158228 ?auto_158230 ) ) ( not ( = ?auto_158229 ?auto_158230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158229 ?auto_158230 )
      ( MAKE-2PILE ?auto_158228 ?auto_158229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158231 - BLOCK
      ?auto_158232 - BLOCK
    )
    :vars
    (
      ?auto_158233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158231 ?auto_158232 ) ) ( ON ?auto_158232 ?auto_158233 ) ( CLEAR ?auto_158232 ) ( not ( = ?auto_158231 ?auto_158233 ) ) ( not ( = ?auto_158232 ?auto_158233 ) ) ( HOLDING ?auto_158231 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158231 )
      ( MAKE-2PILE ?auto_158231 ?auto_158232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158234 - BLOCK
      ?auto_158235 - BLOCK
    )
    :vars
    (
      ?auto_158236 - BLOCK
      ?auto_158238 - BLOCK
      ?auto_158242 - BLOCK
      ?auto_158237 - BLOCK
      ?auto_158240 - BLOCK
      ?auto_158241 - BLOCK
      ?auto_158239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158234 ?auto_158235 ) ) ( ON ?auto_158235 ?auto_158236 ) ( not ( = ?auto_158234 ?auto_158236 ) ) ( not ( = ?auto_158235 ?auto_158236 ) ) ( ON ?auto_158234 ?auto_158235 ) ( CLEAR ?auto_158234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158238 ) ( ON ?auto_158242 ?auto_158238 ) ( ON ?auto_158237 ?auto_158242 ) ( ON ?auto_158240 ?auto_158237 ) ( ON ?auto_158241 ?auto_158240 ) ( ON ?auto_158239 ?auto_158241 ) ( ON ?auto_158236 ?auto_158239 ) ( not ( = ?auto_158238 ?auto_158242 ) ) ( not ( = ?auto_158238 ?auto_158237 ) ) ( not ( = ?auto_158238 ?auto_158240 ) ) ( not ( = ?auto_158238 ?auto_158241 ) ) ( not ( = ?auto_158238 ?auto_158239 ) ) ( not ( = ?auto_158238 ?auto_158236 ) ) ( not ( = ?auto_158238 ?auto_158235 ) ) ( not ( = ?auto_158238 ?auto_158234 ) ) ( not ( = ?auto_158242 ?auto_158237 ) ) ( not ( = ?auto_158242 ?auto_158240 ) ) ( not ( = ?auto_158242 ?auto_158241 ) ) ( not ( = ?auto_158242 ?auto_158239 ) ) ( not ( = ?auto_158242 ?auto_158236 ) ) ( not ( = ?auto_158242 ?auto_158235 ) ) ( not ( = ?auto_158242 ?auto_158234 ) ) ( not ( = ?auto_158237 ?auto_158240 ) ) ( not ( = ?auto_158237 ?auto_158241 ) ) ( not ( = ?auto_158237 ?auto_158239 ) ) ( not ( = ?auto_158237 ?auto_158236 ) ) ( not ( = ?auto_158237 ?auto_158235 ) ) ( not ( = ?auto_158237 ?auto_158234 ) ) ( not ( = ?auto_158240 ?auto_158241 ) ) ( not ( = ?auto_158240 ?auto_158239 ) ) ( not ( = ?auto_158240 ?auto_158236 ) ) ( not ( = ?auto_158240 ?auto_158235 ) ) ( not ( = ?auto_158240 ?auto_158234 ) ) ( not ( = ?auto_158241 ?auto_158239 ) ) ( not ( = ?auto_158241 ?auto_158236 ) ) ( not ( = ?auto_158241 ?auto_158235 ) ) ( not ( = ?auto_158241 ?auto_158234 ) ) ( not ( = ?auto_158239 ?auto_158236 ) ) ( not ( = ?auto_158239 ?auto_158235 ) ) ( not ( = ?auto_158239 ?auto_158234 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158238 ?auto_158242 ?auto_158237 ?auto_158240 ?auto_158241 ?auto_158239 ?auto_158236 ?auto_158235 )
      ( MAKE-2PILE ?auto_158234 ?auto_158235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158249 - BLOCK
      ?auto_158250 - BLOCK
      ?auto_158251 - BLOCK
      ?auto_158252 - BLOCK
      ?auto_158253 - BLOCK
      ?auto_158254 - BLOCK
    )
    :vars
    (
      ?auto_158255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158255 ?auto_158254 ) ( CLEAR ?auto_158255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158249 ) ( ON ?auto_158250 ?auto_158249 ) ( ON ?auto_158251 ?auto_158250 ) ( ON ?auto_158252 ?auto_158251 ) ( ON ?auto_158253 ?auto_158252 ) ( ON ?auto_158254 ?auto_158253 ) ( not ( = ?auto_158249 ?auto_158250 ) ) ( not ( = ?auto_158249 ?auto_158251 ) ) ( not ( = ?auto_158249 ?auto_158252 ) ) ( not ( = ?auto_158249 ?auto_158253 ) ) ( not ( = ?auto_158249 ?auto_158254 ) ) ( not ( = ?auto_158249 ?auto_158255 ) ) ( not ( = ?auto_158250 ?auto_158251 ) ) ( not ( = ?auto_158250 ?auto_158252 ) ) ( not ( = ?auto_158250 ?auto_158253 ) ) ( not ( = ?auto_158250 ?auto_158254 ) ) ( not ( = ?auto_158250 ?auto_158255 ) ) ( not ( = ?auto_158251 ?auto_158252 ) ) ( not ( = ?auto_158251 ?auto_158253 ) ) ( not ( = ?auto_158251 ?auto_158254 ) ) ( not ( = ?auto_158251 ?auto_158255 ) ) ( not ( = ?auto_158252 ?auto_158253 ) ) ( not ( = ?auto_158252 ?auto_158254 ) ) ( not ( = ?auto_158252 ?auto_158255 ) ) ( not ( = ?auto_158253 ?auto_158254 ) ) ( not ( = ?auto_158253 ?auto_158255 ) ) ( not ( = ?auto_158254 ?auto_158255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158255 ?auto_158254 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158256 - BLOCK
      ?auto_158257 - BLOCK
      ?auto_158258 - BLOCK
      ?auto_158259 - BLOCK
      ?auto_158260 - BLOCK
      ?auto_158261 - BLOCK
    )
    :vars
    (
      ?auto_158262 - BLOCK
      ?auto_158263 - BLOCK
      ?auto_158264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158262 ?auto_158261 ) ( CLEAR ?auto_158262 ) ( ON-TABLE ?auto_158256 ) ( ON ?auto_158257 ?auto_158256 ) ( ON ?auto_158258 ?auto_158257 ) ( ON ?auto_158259 ?auto_158258 ) ( ON ?auto_158260 ?auto_158259 ) ( ON ?auto_158261 ?auto_158260 ) ( not ( = ?auto_158256 ?auto_158257 ) ) ( not ( = ?auto_158256 ?auto_158258 ) ) ( not ( = ?auto_158256 ?auto_158259 ) ) ( not ( = ?auto_158256 ?auto_158260 ) ) ( not ( = ?auto_158256 ?auto_158261 ) ) ( not ( = ?auto_158256 ?auto_158262 ) ) ( not ( = ?auto_158257 ?auto_158258 ) ) ( not ( = ?auto_158257 ?auto_158259 ) ) ( not ( = ?auto_158257 ?auto_158260 ) ) ( not ( = ?auto_158257 ?auto_158261 ) ) ( not ( = ?auto_158257 ?auto_158262 ) ) ( not ( = ?auto_158258 ?auto_158259 ) ) ( not ( = ?auto_158258 ?auto_158260 ) ) ( not ( = ?auto_158258 ?auto_158261 ) ) ( not ( = ?auto_158258 ?auto_158262 ) ) ( not ( = ?auto_158259 ?auto_158260 ) ) ( not ( = ?auto_158259 ?auto_158261 ) ) ( not ( = ?auto_158259 ?auto_158262 ) ) ( not ( = ?auto_158260 ?auto_158261 ) ) ( not ( = ?auto_158260 ?auto_158262 ) ) ( not ( = ?auto_158261 ?auto_158262 ) ) ( HOLDING ?auto_158263 ) ( CLEAR ?auto_158264 ) ( not ( = ?auto_158256 ?auto_158263 ) ) ( not ( = ?auto_158256 ?auto_158264 ) ) ( not ( = ?auto_158257 ?auto_158263 ) ) ( not ( = ?auto_158257 ?auto_158264 ) ) ( not ( = ?auto_158258 ?auto_158263 ) ) ( not ( = ?auto_158258 ?auto_158264 ) ) ( not ( = ?auto_158259 ?auto_158263 ) ) ( not ( = ?auto_158259 ?auto_158264 ) ) ( not ( = ?auto_158260 ?auto_158263 ) ) ( not ( = ?auto_158260 ?auto_158264 ) ) ( not ( = ?auto_158261 ?auto_158263 ) ) ( not ( = ?auto_158261 ?auto_158264 ) ) ( not ( = ?auto_158262 ?auto_158263 ) ) ( not ( = ?auto_158262 ?auto_158264 ) ) ( not ( = ?auto_158263 ?auto_158264 ) ) )
    :subtasks
    ( ( !STACK ?auto_158263 ?auto_158264 )
      ( MAKE-6PILE ?auto_158256 ?auto_158257 ?auto_158258 ?auto_158259 ?auto_158260 ?auto_158261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158265 - BLOCK
      ?auto_158266 - BLOCK
      ?auto_158267 - BLOCK
      ?auto_158268 - BLOCK
      ?auto_158269 - BLOCK
      ?auto_158270 - BLOCK
    )
    :vars
    (
      ?auto_158273 - BLOCK
      ?auto_158271 - BLOCK
      ?auto_158272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158273 ?auto_158270 ) ( ON-TABLE ?auto_158265 ) ( ON ?auto_158266 ?auto_158265 ) ( ON ?auto_158267 ?auto_158266 ) ( ON ?auto_158268 ?auto_158267 ) ( ON ?auto_158269 ?auto_158268 ) ( ON ?auto_158270 ?auto_158269 ) ( not ( = ?auto_158265 ?auto_158266 ) ) ( not ( = ?auto_158265 ?auto_158267 ) ) ( not ( = ?auto_158265 ?auto_158268 ) ) ( not ( = ?auto_158265 ?auto_158269 ) ) ( not ( = ?auto_158265 ?auto_158270 ) ) ( not ( = ?auto_158265 ?auto_158273 ) ) ( not ( = ?auto_158266 ?auto_158267 ) ) ( not ( = ?auto_158266 ?auto_158268 ) ) ( not ( = ?auto_158266 ?auto_158269 ) ) ( not ( = ?auto_158266 ?auto_158270 ) ) ( not ( = ?auto_158266 ?auto_158273 ) ) ( not ( = ?auto_158267 ?auto_158268 ) ) ( not ( = ?auto_158267 ?auto_158269 ) ) ( not ( = ?auto_158267 ?auto_158270 ) ) ( not ( = ?auto_158267 ?auto_158273 ) ) ( not ( = ?auto_158268 ?auto_158269 ) ) ( not ( = ?auto_158268 ?auto_158270 ) ) ( not ( = ?auto_158268 ?auto_158273 ) ) ( not ( = ?auto_158269 ?auto_158270 ) ) ( not ( = ?auto_158269 ?auto_158273 ) ) ( not ( = ?auto_158270 ?auto_158273 ) ) ( CLEAR ?auto_158271 ) ( not ( = ?auto_158265 ?auto_158272 ) ) ( not ( = ?auto_158265 ?auto_158271 ) ) ( not ( = ?auto_158266 ?auto_158272 ) ) ( not ( = ?auto_158266 ?auto_158271 ) ) ( not ( = ?auto_158267 ?auto_158272 ) ) ( not ( = ?auto_158267 ?auto_158271 ) ) ( not ( = ?auto_158268 ?auto_158272 ) ) ( not ( = ?auto_158268 ?auto_158271 ) ) ( not ( = ?auto_158269 ?auto_158272 ) ) ( not ( = ?auto_158269 ?auto_158271 ) ) ( not ( = ?auto_158270 ?auto_158272 ) ) ( not ( = ?auto_158270 ?auto_158271 ) ) ( not ( = ?auto_158273 ?auto_158272 ) ) ( not ( = ?auto_158273 ?auto_158271 ) ) ( not ( = ?auto_158272 ?auto_158271 ) ) ( ON ?auto_158272 ?auto_158273 ) ( CLEAR ?auto_158272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158265 ?auto_158266 ?auto_158267 ?auto_158268 ?auto_158269 ?auto_158270 ?auto_158273 )
      ( MAKE-6PILE ?auto_158265 ?auto_158266 ?auto_158267 ?auto_158268 ?auto_158269 ?auto_158270 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158274 - BLOCK
      ?auto_158275 - BLOCK
      ?auto_158276 - BLOCK
      ?auto_158277 - BLOCK
      ?auto_158278 - BLOCK
      ?auto_158279 - BLOCK
    )
    :vars
    (
      ?auto_158282 - BLOCK
      ?auto_158281 - BLOCK
      ?auto_158280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158282 ?auto_158279 ) ( ON-TABLE ?auto_158274 ) ( ON ?auto_158275 ?auto_158274 ) ( ON ?auto_158276 ?auto_158275 ) ( ON ?auto_158277 ?auto_158276 ) ( ON ?auto_158278 ?auto_158277 ) ( ON ?auto_158279 ?auto_158278 ) ( not ( = ?auto_158274 ?auto_158275 ) ) ( not ( = ?auto_158274 ?auto_158276 ) ) ( not ( = ?auto_158274 ?auto_158277 ) ) ( not ( = ?auto_158274 ?auto_158278 ) ) ( not ( = ?auto_158274 ?auto_158279 ) ) ( not ( = ?auto_158274 ?auto_158282 ) ) ( not ( = ?auto_158275 ?auto_158276 ) ) ( not ( = ?auto_158275 ?auto_158277 ) ) ( not ( = ?auto_158275 ?auto_158278 ) ) ( not ( = ?auto_158275 ?auto_158279 ) ) ( not ( = ?auto_158275 ?auto_158282 ) ) ( not ( = ?auto_158276 ?auto_158277 ) ) ( not ( = ?auto_158276 ?auto_158278 ) ) ( not ( = ?auto_158276 ?auto_158279 ) ) ( not ( = ?auto_158276 ?auto_158282 ) ) ( not ( = ?auto_158277 ?auto_158278 ) ) ( not ( = ?auto_158277 ?auto_158279 ) ) ( not ( = ?auto_158277 ?auto_158282 ) ) ( not ( = ?auto_158278 ?auto_158279 ) ) ( not ( = ?auto_158278 ?auto_158282 ) ) ( not ( = ?auto_158279 ?auto_158282 ) ) ( not ( = ?auto_158274 ?auto_158281 ) ) ( not ( = ?auto_158274 ?auto_158280 ) ) ( not ( = ?auto_158275 ?auto_158281 ) ) ( not ( = ?auto_158275 ?auto_158280 ) ) ( not ( = ?auto_158276 ?auto_158281 ) ) ( not ( = ?auto_158276 ?auto_158280 ) ) ( not ( = ?auto_158277 ?auto_158281 ) ) ( not ( = ?auto_158277 ?auto_158280 ) ) ( not ( = ?auto_158278 ?auto_158281 ) ) ( not ( = ?auto_158278 ?auto_158280 ) ) ( not ( = ?auto_158279 ?auto_158281 ) ) ( not ( = ?auto_158279 ?auto_158280 ) ) ( not ( = ?auto_158282 ?auto_158281 ) ) ( not ( = ?auto_158282 ?auto_158280 ) ) ( not ( = ?auto_158281 ?auto_158280 ) ) ( ON ?auto_158281 ?auto_158282 ) ( CLEAR ?auto_158281 ) ( HOLDING ?auto_158280 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158280 )
      ( MAKE-6PILE ?auto_158274 ?auto_158275 ?auto_158276 ?auto_158277 ?auto_158278 ?auto_158279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158283 - BLOCK
      ?auto_158284 - BLOCK
      ?auto_158285 - BLOCK
      ?auto_158286 - BLOCK
      ?auto_158287 - BLOCK
      ?auto_158288 - BLOCK
    )
    :vars
    (
      ?auto_158289 - BLOCK
      ?auto_158291 - BLOCK
      ?auto_158290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158289 ?auto_158288 ) ( ON-TABLE ?auto_158283 ) ( ON ?auto_158284 ?auto_158283 ) ( ON ?auto_158285 ?auto_158284 ) ( ON ?auto_158286 ?auto_158285 ) ( ON ?auto_158287 ?auto_158286 ) ( ON ?auto_158288 ?auto_158287 ) ( not ( = ?auto_158283 ?auto_158284 ) ) ( not ( = ?auto_158283 ?auto_158285 ) ) ( not ( = ?auto_158283 ?auto_158286 ) ) ( not ( = ?auto_158283 ?auto_158287 ) ) ( not ( = ?auto_158283 ?auto_158288 ) ) ( not ( = ?auto_158283 ?auto_158289 ) ) ( not ( = ?auto_158284 ?auto_158285 ) ) ( not ( = ?auto_158284 ?auto_158286 ) ) ( not ( = ?auto_158284 ?auto_158287 ) ) ( not ( = ?auto_158284 ?auto_158288 ) ) ( not ( = ?auto_158284 ?auto_158289 ) ) ( not ( = ?auto_158285 ?auto_158286 ) ) ( not ( = ?auto_158285 ?auto_158287 ) ) ( not ( = ?auto_158285 ?auto_158288 ) ) ( not ( = ?auto_158285 ?auto_158289 ) ) ( not ( = ?auto_158286 ?auto_158287 ) ) ( not ( = ?auto_158286 ?auto_158288 ) ) ( not ( = ?auto_158286 ?auto_158289 ) ) ( not ( = ?auto_158287 ?auto_158288 ) ) ( not ( = ?auto_158287 ?auto_158289 ) ) ( not ( = ?auto_158288 ?auto_158289 ) ) ( not ( = ?auto_158283 ?auto_158291 ) ) ( not ( = ?auto_158283 ?auto_158290 ) ) ( not ( = ?auto_158284 ?auto_158291 ) ) ( not ( = ?auto_158284 ?auto_158290 ) ) ( not ( = ?auto_158285 ?auto_158291 ) ) ( not ( = ?auto_158285 ?auto_158290 ) ) ( not ( = ?auto_158286 ?auto_158291 ) ) ( not ( = ?auto_158286 ?auto_158290 ) ) ( not ( = ?auto_158287 ?auto_158291 ) ) ( not ( = ?auto_158287 ?auto_158290 ) ) ( not ( = ?auto_158288 ?auto_158291 ) ) ( not ( = ?auto_158288 ?auto_158290 ) ) ( not ( = ?auto_158289 ?auto_158291 ) ) ( not ( = ?auto_158289 ?auto_158290 ) ) ( not ( = ?auto_158291 ?auto_158290 ) ) ( ON ?auto_158291 ?auto_158289 ) ( ON ?auto_158290 ?auto_158291 ) ( CLEAR ?auto_158290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158283 ?auto_158284 ?auto_158285 ?auto_158286 ?auto_158287 ?auto_158288 ?auto_158289 ?auto_158291 )
      ( MAKE-6PILE ?auto_158283 ?auto_158284 ?auto_158285 ?auto_158286 ?auto_158287 ?auto_158288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158295 - BLOCK
      ?auto_158296 - BLOCK
      ?auto_158297 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158297 ) ( CLEAR ?auto_158296 ) ( ON-TABLE ?auto_158295 ) ( ON ?auto_158296 ?auto_158295 ) ( not ( = ?auto_158295 ?auto_158296 ) ) ( not ( = ?auto_158295 ?auto_158297 ) ) ( not ( = ?auto_158296 ?auto_158297 ) ) )
    :subtasks
    ( ( !STACK ?auto_158297 ?auto_158296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158298 - BLOCK
      ?auto_158299 - BLOCK
      ?auto_158300 - BLOCK
    )
    :vars
    (
      ?auto_158301 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158299 ) ( ON-TABLE ?auto_158298 ) ( ON ?auto_158299 ?auto_158298 ) ( not ( = ?auto_158298 ?auto_158299 ) ) ( not ( = ?auto_158298 ?auto_158300 ) ) ( not ( = ?auto_158299 ?auto_158300 ) ) ( ON ?auto_158300 ?auto_158301 ) ( CLEAR ?auto_158300 ) ( HAND-EMPTY ) ( not ( = ?auto_158298 ?auto_158301 ) ) ( not ( = ?auto_158299 ?auto_158301 ) ) ( not ( = ?auto_158300 ?auto_158301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158300 ?auto_158301 )
      ( MAKE-3PILE ?auto_158298 ?auto_158299 ?auto_158300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158302 - BLOCK
      ?auto_158303 - BLOCK
      ?auto_158304 - BLOCK
    )
    :vars
    (
      ?auto_158305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158302 ) ( not ( = ?auto_158302 ?auto_158303 ) ) ( not ( = ?auto_158302 ?auto_158304 ) ) ( not ( = ?auto_158303 ?auto_158304 ) ) ( ON ?auto_158304 ?auto_158305 ) ( CLEAR ?auto_158304 ) ( not ( = ?auto_158302 ?auto_158305 ) ) ( not ( = ?auto_158303 ?auto_158305 ) ) ( not ( = ?auto_158304 ?auto_158305 ) ) ( HOLDING ?auto_158303 ) ( CLEAR ?auto_158302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158302 ?auto_158303 )
      ( MAKE-3PILE ?auto_158302 ?auto_158303 ?auto_158304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158306 - BLOCK
      ?auto_158307 - BLOCK
      ?auto_158308 - BLOCK
    )
    :vars
    (
      ?auto_158309 - BLOCK
      ?auto_158314 - BLOCK
      ?auto_158313 - BLOCK
      ?auto_158311 - BLOCK
      ?auto_158312 - BLOCK
      ?auto_158310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158306 ) ( not ( = ?auto_158306 ?auto_158307 ) ) ( not ( = ?auto_158306 ?auto_158308 ) ) ( not ( = ?auto_158307 ?auto_158308 ) ) ( ON ?auto_158308 ?auto_158309 ) ( not ( = ?auto_158306 ?auto_158309 ) ) ( not ( = ?auto_158307 ?auto_158309 ) ) ( not ( = ?auto_158308 ?auto_158309 ) ) ( CLEAR ?auto_158306 ) ( ON ?auto_158307 ?auto_158308 ) ( CLEAR ?auto_158307 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158314 ) ( ON ?auto_158313 ?auto_158314 ) ( ON ?auto_158311 ?auto_158313 ) ( ON ?auto_158312 ?auto_158311 ) ( ON ?auto_158310 ?auto_158312 ) ( ON ?auto_158309 ?auto_158310 ) ( not ( = ?auto_158314 ?auto_158313 ) ) ( not ( = ?auto_158314 ?auto_158311 ) ) ( not ( = ?auto_158314 ?auto_158312 ) ) ( not ( = ?auto_158314 ?auto_158310 ) ) ( not ( = ?auto_158314 ?auto_158309 ) ) ( not ( = ?auto_158314 ?auto_158308 ) ) ( not ( = ?auto_158314 ?auto_158307 ) ) ( not ( = ?auto_158313 ?auto_158311 ) ) ( not ( = ?auto_158313 ?auto_158312 ) ) ( not ( = ?auto_158313 ?auto_158310 ) ) ( not ( = ?auto_158313 ?auto_158309 ) ) ( not ( = ?auto_158313 ?auto_158308 ) ) ( not ( = ?auto_158313 ?auto_158307 ) ) ( not ( = ?auto_158311 ?auto_158312 ) ) ( not ( = ?auto_158311 ?auto_158310 ) ) ( not ( = ?auto_158311 ?auto_158309 ) ) ( not ( = ?auto_158311 ?auto_158308 ) ) ( not ( = ?auto_158311 ?auto_158307 ) ) ( not ( = ?auto_158312 ?auto_158310 ) ) ( not ( = ?auto_158312 ?auto_158309 ) ) ( not ( = ?auto_158312 ?auto_158308 ) ) ( not ( = ?auto_158312 ?auto_158307 ) ) ( not ( = ?auto_158310 ?auto_158309 ) ) ( not ( = ?auto_158310 ?auto_158308 ) ) ( not ( = ?auto_158310 ?auto_158307 ) ) ( not ( = ?auto_158306 ?auto_158314 ) ) ( not ( = ?auto_158306 ?auto_158313 ) ) ( not ( = ?auto_158306 ?auto_158311 ) ) ( not ( = ?auto_158306 ?auto_158312 ) ) ( not ( = ?auto_158306 ?auto_158310 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158314 ?auto_158313 ?auto_158311 ?auto_158312 ?auto_158310 ?auto_158309 ?auto_158308 )
      ( MAKE-3PILE ?auto_158306 ?auto_158307 ?auto_158308 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158315 - BLOCK
      ?auto_158316 - BLOCK
      ?auto_158317 - BLOCK
    )
    :vars
    (
      ?auto_158318 - BLOCK
      ?auto_158320 - BLOCK
      ?auto_158321 - BLOCK
      ?auto_158319 - BLOCK
      ?auto_158323 - BLOCK
      ?auto_158322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158315 ?auto_158316 ) ) ( not ( = ?auto_158315 ?auto_158317 ) ) ( not ( = ?auto_158316 ?auto_158317 ) ) ( ON ?auto_158317 ?auto_158318 ) ( not ( = ?auto_158315 ?auto_158318 ) ) ( not ( = ?auto_158316 ?auto_158318 ) ) ( not ( = ?auto_158317 ?auto_158318 ) ) ( ON ?auto_158316 ?auto_158317 ) ( CLEAR ?auto_158316 ) ( ON-TABLE ?auto_158320 ) ( ON ?auto_158321 ?auto_158320 ) ( ON ?auto_158319 ?auto_158321 ) ( ON ?auto_158323 ?auto_158319 ) ( ON ?auto_158322 ?auto_158323 ) ( ON ?auto_158318 ?auto_158322 ) ( not ( = ?auto_158320 ?auto_158321 ) ) ( not ( = ?auto_158320 ?auto_158319 ) ) ( not ( = ?auto_158320 ?auto_158323 ) ) ( not ( = ?auto_158320 ?auto_158322 ) ) ( not ( = ?auto_158320 ?auto_158318 ) ) ( not ( = ?auto_158320 ?auto_158317 ) ) ( not ( = ?auto_158320 ?auto_158316 ) ) ( not ( = ?auto_158321 ?auto_158319 ) ) ( not ( = ?auto_158321 ?auto_158323 ) ) ( not ( = ?auto_158321 ?auto_158322 ) ) ( not ( = ?auto_158321 ?auto_158318 ) ) ( not ( = ?auto_158321 ?auto_158317 ) ) ( not ( = ?auto_158321 ?auto_158316 ) ) ( not ( = ?auto_158319 ?auto_158323 ) ) ( not ( = ?auto_158319 ?auto_158322 ) ) ( not ( = ?auto_158319 ?auto_158318 ) ) ( not ( = ?auto_158319 ?auto_158317 ) ) ( not ( = ?auto_158319 ?auto_158316 ) ) ( not ( = ?auto_158323 ?auto_158322 ) ) ( not ( = ?auto_158323 ?auto_158318 ) ) ( not ( = ?auto_158323 ?auto_158317 ) ) ( not ( = ?auto_158323 ?auto_158316 ) ) ( not ( = ?auto_158322 ?auto_158318 ) ) ( not ( = ?auto_158322 ?auto_158317 ) ) ( not ( = ?auto_158322 ?auto_158316 ) ) ( not ( = ?auto_158315 ?auto_158320 ) ) ( not ( = ?auto_158315 ?auto_158321 ) ) ( not ( = ?auto_158315 ?auto_158319 ) ) ( not ( = ?auto_158315 ?auto_158323 ) ) ( not ( = ?auto_158315 ?auto_158322 ) ) ( HOLDING ?auto_158315 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158315 )
      ( MAKE-3PILE ?auto_158315 ?auto_158316 ?auto_158317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158324 - BLOCK
      ?auto_158325 - BLOCK
      ?auto_158326 - BLOCK
    )
    :vars
    (
      ?auto_158331 - BLOCK
      ?auto_158332 - BLOCK
      ?auto_158329 - BLOCK
      ?auto_158330 - BLOCK
      ?auto_158327 - BLOCK
      ?auto_158328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158324 ?auto_158325 ) ) ( not ( = ?auto_158324 ?auto_158326 ) ) ( not ( = ?auto_158325 ?auto_158326 ) ) ( ON ?auto_158326 ?auto_158331 ) ( not ( = ?auto_158324 ?auto_158331 ) ) ( not ( = ?auto_158325 ?auto_158331 ) ) ( not ( = ?auto_158326 ?auto_158331 ) ) ( ON ?auto_158325 ?auto_158326 ) ( ON-TABLE ?auto_158332 ) ( ON ?auto_158329 ?auto_158332 ) ( ON ?auto_158330 ?auto_158329 ) ( ON ?auto_158327 ?auto_158330 ) ( ON ?auto_158328 ?auto_158327 ) ( ON ?auto_158331 ?auto_158328 ) ( not ( = ?auto_158332 ?auto_158329 ) ) ( not ( = ?auto_158332 ?auto_158330 ) ) ( not ( = ?auto_158332 ?auto_158327 ) ) ( not ( = ?auto_158332 ?auto_158328 ) ) ( not ( = ?auto_158332 ?auto_158331 ) ) ( not ( = ?auto_158332 ?auto_158326 ) ) ( not ( = ?auto_158332 ?auto_158325 ) ) ( not ( = ?auto_158329 ?auto_158330 ) ) ( not ( = ?auto_158329 ?auto_158327 ) ) ( not ( = ?auto_158329 ?auto_158328 ) ) ( not ( = ?auto_158329 ?auto_158331 ) ) ( not ( = ?auto_158329 ?auto_158326 ) ) ( not ( = ?auto_158329 ?auto_158325 ) ) ( not ( = ?auto_158330 ?auto_158327 ) ) ( not ( = ?auto_158330 ?auto_158328 ) ) ( not ( = ?auto_158330 ?auto_158331 ) ) ( not ( = ?auto_158330 ?auto_158326 ) ) ( not ( = ?auto_158330 ?auto_158325 ) ) ( not ( = ?auto_158327 ?auto_158328 ) ) ( not ( = ?auto_158327 ?auto_158331 ) ) ( not ( = ?auto_158327 ?auto_158326 ) ) ( not ( = ?auto_158327 ?auto_158325 ) ) ( not ( = ?auto_158328 ?auto_158331 ) ) ( not ( = ?auto_158328 ?auto_158326 ) ) ( not ( = ?auto_158328 ?auto_158325 ) ) ( not ( = ?auto_158324 ?auto_158332 ) ) ( not ( = ?auto_158324 ?auto_158329 ) ) ( not ( = ?auto_158324 ?auto_158330 ) ) ( not ( = ?auto_158324 ?auto_158327 ) ) ( not ( = ?auto_158324 ?auto_158328 ) ) ( ON ?auto_158324 ?auto_158325 ) ( CLEAR ?auto_158324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158332 ?auto_158329 ?auto_158330 ?auto_158327 ?auto_158328 ?auto_158331 ?auto_158326 ?auto_158325 )
      ( MAKE-3PILE ?auto_158324 ?auto_158325 ?auto_158326 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158338 - BLOCK
      ?auto_158339 - BLOCK
      ?auto_158340 - BLOCK
      ?auto_158341 - BLOCK
      ?auto_158342 - BLOCK
    )
    :vars
    (
      ?auto_158343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158343 ?auto_158342 ) ( CLEAR ?auto_158343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158338 ) ( ON ?auto_158339 ?auto_158338 ) ( ON ?auto_158340 ?auto_158339 ) ( ON ?auto_158341 ?auto_158340 ) ( ON ?auto_158342 ?auto_158341 ) ( not ( = ?auto_158338 ?auto_158339 ) ) ( not ( = ?auto_158338 ?auto_158340 ) ) ( not ( = ?auto_158338 ?auto_158341 ) ) ( not ( = ?auto_158338 ?auto_158342 ) ) ( not ( = ?auto_158338 ?auto_158343 ) ) ( not ( = ?auto_158339 ?auto_158340 ) ) ( not ( = ?auto_158339 ?auto_158341 ) ) ( not ( = ?auto_158339 ?auto_158342 ) ) ( not ( = ?auto_158339 ?auto_158343 ) ) ( not ( = ?auto_158340 ?auto_158341 ) ) ( not ( = ?auto_158340 ?auto_158342 ) ) ( not ( = ?auto_158340 ?auto_158343 ) ) ( not ( = ?auto_158341 ?auto_158342 ) ) ( not ( = ?auto_158341 ?auto_158343 ) ) ( not ( = ?auto_158342 ?auto_158343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158343 ?auto_158342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158344 - BLOCK
      ?auto_158345 - BLOCK
      ?auto_158346 - BLOCK
      ?auto_158347 - BLOCK
      ?auto_158348 - BLOCK
    )
    :vars
    (
      ?auto_158349 - BLOCK
      ?auto_158350 - BLOCK
      ?auto_158351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158349 ?auto_158348 ) ( CLEAR ?auto_158349 ) ( ON-TABLE ?auto_158344 ) ( ON ?auto_158345 ?auto_158344 ) ( ON ?auto_158346 ?auto_158345 ) ( ON ?auto_158347 ?auto_158346 ) ( ON ?auto_158348 ?auto_158347 ) ( not ( = ?auto_158344 ?auto_158345 ) ) ( not ( = ?auto_158344 ?auto_158346 ) ) ( not ( = ?auto_158344 ?auto_158347 ) ) ( not ( = ?auto_158344 ?auto_158348 ) ) ( not ( = ?auto_158344 ?auto_158349 ) ) ( not ( = ?auto_158345 ?auto_158346 ) ) ( not ( = ?auto_158345 ?auto_158347 ) ) ( not ( = ?auto_158345 ?auto_158348 ) ) ( not ( = ?auto_158345 ?auto_158349 ) ) ( not ( = ?auto_158346 ?auto_158347 ) ) ( not ( = ?auto_158346 ?auto_158348 ) ) ( not ( = ?auto_158346 ?auto_158349 ) ) ( not ( = ?auto_158347 ?auto_158348 ) ) ( not ( = ?auto_158347 ?auto_158349 ) ) ( not ( = ?auto_158348 ?auto_158349 ) ) ( HOLDING ?auto_158350 ) ( CLEAR ?auto_158351 ) ( not ( = ?auto_158344 ?auto_158350 ) ) ( not ( = ?auto_158344 ?auto_158351 ) ) ( not ( = ?auto_158345 ?auto_158350 ) ) ( not ( = ?auto_158345 ?auto_158351 ) ) ( not ( = ?auto_158346 ?auto_158350 ) ) ( not ( = ?auto_158346 ?auto_158351 ) ) ( not ( = ?auto_158347 ?auto_158350 ) ) ( not ( = ?auto_158347 ?auto_158351 ) ) ( not ( = ?auto_158348 ?auto_158350 ) ) ( not ( = ?auto_158348 ?auto_158351 ) ) ( not ( = ?auto_158349 ?auto_158350 ) ) ( not ( = ?auto_158349 ?auto_158351 ) ) ( not ( = ?auto_158350 ?auto_158351 ) ) )
    :subtasks
    ( ( !STACK ?auto_158350 ?auto_158351 )
      ( MAKE-5PILE ?auto_158344 ?auto_158345 ?auto_158346 ?auto_158347 ?auto_158348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158352 - BLOCK
      ?auto_158353 - BLOCK
      ?auto_158354 - BLOCK
      ?auto_158355 - BLOCK
      ?auto_158356 - BLOCK
    )
    :vars
    (
      ?auto_158358 - BLOCK
      ?auto_158359 - BLOCK
      ?auto_158357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158358 ?auto_158356 ) ( ON-TABLE ?auto_158352 ) ( ON ?auto_158353 ?auto_158352 ) ( ON ?auto_158354 ?auto_158353 ) ( ON ?auto_158355 ?auto_158354 ) ( ON ?auto_158356 ?auto_158355 ) ( not ( = ?auto_158352 ?auto_158353 ) ) ( not ( = ?auto_158352 ?auto_158354 ) ) ( not ( = ?auto_158352 ?auto_158355 ) ) ( not ( = ?auto_158352 ?auto_158356 ) ) ( not ( = ?auto_158352 ?auto_158358 ) ) ( not ( = ?auto_158353 ?auto_158354 ) ) ( not ( = ?auto_158353 ?auto_158355 ) ) ( not ( = ?auto_158353 ?auto_158356 ) ) ( not ( = ?auto_158353 ?auto_158358 ) ) ( not ( = ?auto_158354 ?auto_158355 ) ) ( not ( = ?auto_158354 ?auto_158356 ) ) ( not ( = ?auto_158354 ?auto_158358 ) ) ( not ( = ?auto_158355 ?auto_158356 ) ) ( not ( = ?auto_158355 ?auto_158358 ) ) ( not ( = ?auto_158356 ?auto_158358 ) ) ( CLEAR ?auto_158359 ) ( not ( = ?auto_158352 ?auto_158357 ) ) ( not ( = ?auto_158352 ?auto_158359 ) ) ( not ( = ?auto_158353 ?auto_158357 ) ) ( not ( = ?auto_158353 ?auto_158359 ) ) ( not ( = ?auto_158354 ?auto_158357 ) ) ( not ( = ?auto_158354 ?auto_158359 ) ) ( not ( = ?auto_158355 ?auto_158357 ) ) ( not ( = ?auto_158355 ?auto_158359 ) ) ( not ( = ?auto_158356 ?auto_158357 ) ) ( not ( = ?auto_158356 ?auto_158359 ) ) ( not ( = ?auto_158358 ?auto_158357 ) ) ( not ( = ?auto_158358 ?auto_158359 ) ) ( not ( = ?auto_158357 ?auto_158359 ) ) ( ON ?auto_158357 ?auto_158358 ) ( CLEAR ?auto_158357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158352 ?auto_158353 ?auto_158354 ?auto_158355 ?auto_158356 ?auto_158358 )
      ( MAKE-5PILE ?auto_158352 ?auto_158353 ?auto_158354 ?auto_158355 ?auto_158356 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158360 - BLOCK
      ?auto_158361 - BLOCK
      ?auto_158362 - BLOCK
      ?auto_158363 - BLOCK
      ?auto_158364 - BLOCK
    )
    :vars
    (
      ?auto_158367 - BLOCK
      ?auto_158365 - BLOCK
      ?auto_158366 - BLOCK
      ?auto_158368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158367 ?auto_158364 ) ( ON-TABLE ?auto_158360 ) ( ON ?auto_158361 ?auto_158360 ) ( ON ?auto_158362 ?auto_158361 ) ( ON ?auto_158363 ?auto_158362 ) ( ON ?auto_158364 ?auto_158363 ) ( not ( = ?auto_158360 ?auto_158361 ) ) ( not ( = ?auto_158360 ?auto_158362 ) ) ( not ( = ?auto_158360 ?auto_158363 ) ) ( not ( = ?auto_158360 ?auto_158364 ) ) ( not ( = ?auto_158360 ?auto_158367 ) ) ( not ( = ?auto_158361 ?auto_158362 ) ) ( not ( = ?auto_158361 ?auto_158363 ) ) ( not ( = ?auto_158361 ?auto_158364 ) ) ( not ( = ?auto_158361 ?auto_158367 ) ) ( not ( = ?auto_158362 ?auto_158363 ) ) ( not ( = ?auto_158362 ?auto_158364 ) ) ( not ( = ?auto_158362 ?auto_158367 ) ) ( not ( = ?auto_158363 ?auto_158364 ) ) ( not ( = ?auto_158363 ?auto_158367 ) ) ( not ( = ?auto_158364 ?auto_158367 ) ) ( not ( = ?auto_158360 ?auto_158365 ) ) ( not ( = ?auto_158360 ?auto_158366 ) ) ( not ( = ?auto_158361 ?auto_158365 ) ) ( not ( = ?auto_158361 ?auto_158366 ) ) ( not ( = ?auto_158362 ?auto_158365 ) ) ( not ( = ?auto_158362 ?auto_158366 ) ) ( not ( = ?auto_158363 ?auto_158365 ) ) ( not ( = ?auto_158363 ?auto_158366 ) ) ( not ( = ?auto_158364 ?auto_158365 ) ) ( not ( = ?auto_158364 ?auto_158366 ) ) ( not ( = ?auto_158367 ?auto_158365 ) ) ( not ( = ?auto_158367 ?auto_158366 ) ) ( not ( = ?auto_158365 ?auto_158366 ) ) ( ON ?auto_158365 ?auto_158367 ) ( CLEAR ?auto_158365 ) ( HOLDING ?auto_158366 ) ( CLEAR ?auto_158368 ) ( ON-TABLE ?auto_158368 ) ( not ( = ?auto_158368 ?auto_158366 ) ) ( not ( = ?auto_158360 ?auto_158368 ) ) ( not ( = ?auto_158361 ?auto_158368 ) ) ( not ( = ?auto_158362 ?auto_158368 ) ) ( not ( = ?auto_158363 ?auto_158368 ) ) ( not ( = ?auto_158364 ?auto_158368 ) ) ( not ( = ?auto_158367 ?auto_158368 ) ) ( not ( = ?auto_158365 ?auto_158368 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158368 ?auto_158366 )
      ( MAKE-5PILE ?auto_158360 ?auto_158361 ?auto_158362 ?auto_158363 ?auto_158364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158369 - BLOCK
      ?auto_158370 - BLOCK
      ?auto_158371 - BLOCK
      ?auto_158372 - BLOCK
      ?auto_158373 - BLOCK
    )
    :vars
    (
      ?auto_158374 - BLOCK
      ?auto_158376 - BLOCK
      ?auto_158377 - BLOCK
      ?auto_158375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158374 ?auto_158373 ) ( ON-TABLE ?auto_158369 ) ( ON ?auto_158370 ?auto_158369 ) ( ON ?auto_158371 ?auto_158370 ) ( ON ?auto_158372 ?auto_158371 ) ( ON ?auto_158373 ?auto_158372 ) ( not ( = ?auto_158369 ?auto_158370 ) ) ( not ( = ?auto_158369 ?auto_158371 ) ) ( not ( = ?auto_158369 ?auto_158372 ) ) ( not ( = ?auto_158369 ?auto_158373 ) ) ( not ( = ?auto_158369 ?auto_158374 ) ) ( not ( = ?auto_158370 ?auto_158371 ) ) ( not ( = ?auto_158370 ?auto_158372 ) ) ( not ( = ?auto_158370 ?auto_158373 ) ) ( not ( = ?auto_158370 ?auto_158374 ) ) ( not ( = ?auto_158371 ?auto_158372 ) ) ( not ( = ?auto_158371 ?auto_158373 ) ) ( not ( = ?auto_158371 ?auto_158374 ) ) ( not ( = ?auto_158372 ?auto_158373 ) ) ( not ( = ?auto_158372 ?auto_158374 ) ) ( not ( = ?auto_158373 ?auto_158374 ) ) ( not ( = ?auto_158369 ?auto_158376 ) ) ( not ( = ?auto_158369 ?auto_158377 ) ) ( not ( = ?auto_158370 ?auto_158376 ) ) ( not ( = ?auto_158370 ?auto_158377 ) ) ( not ( = ?auto_158371 ?auto_158376 ) ) ( not ( = ?auto_158371 ?auto_158377 ) ) ( not ( = ?auto_158372 ?auto_158376 ) ) ( not ( = ?auto_158372 ?auto_158377 ) ) ( not ( = ?auto_158373 ?auto_158376 ) ) ( not ( = ?auto_158373 ?auto_158377 ) ) ( not ( = ?auto_158374 ?auto_158376 ) ) ( not ( = ?auto_158374 ?auto_158377 ) ) ( not ( = ?auto_158376 ?auto_158377 ) ) ( ON ?auto_158376 ?auto_158374 ) ( CLEAR ?auto_158375 ) ( ON-TABLE ?auto_158375 ) ( not ( = ?auto_158375 ?auto_158377 ) ) ( not ( = ?auto_158369 ?auto_158375 ) ) ( not ( = ?auto_158370 ?auto_158375 ) ) ( not ( = ?auto_158371 ?auto_158375 ) ) ( not ( = ?auto_158372 ?auto_158375 ) ) ( not ( = ?auto_158373 ?auto_158375 ) ) ( not ( = ?auto_158374 ?auto_158375 ) ) ( not ( = ?auto_158376 ?auto_158375 ) ) ( ON ?auto_158377 ?auto_158376 ) ( CLEAR ?auto_158377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158369 ?auto_158370 ?auto_158371 ?auto_158372 ?auto_158373 ?auto_158374 ?auto_158376 )
      ( MAKE-5PILE ?auto_158369 ?auto_158370 ?auto_158371 ?auto_158372 ?auto_158373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158378 - BLOCK
      ?auto_158379 - BLOCK
      ?auto_158380 - BLOCK
      ?auto_158381 - BLOCK
      ?auto_158382 - BLOCK
    )
    :vars
    (
      ?auto_158383 - BLOCK
      ?auto_158385 - BLOCK
      ?auto_158386 - BLOCK
      ?auto_158384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158383 ?auto_158382 ) ( ON-TABLE ?auto_158378 ) ( ON ?auto_158379 ?auto_158378 ) ( ON ?auto_158380 ?auto_158379 ) ( ON ?auto_158381 ?auto_158380 ) ( ON ?auto_158382 ?auto_158381 ) ( not ( = ?auto_158378 ?auto_158379 ) ) ( not ( = ?auto_158378 ?auto_158380 ) ) ( not ( = ?auto_158378 ?auto_158381 ) ) ( not ( = ?auto_158378 ?auto_158382 ) ) ( not ( = ?auto_158378 ?auto_158383 ) ) ( not ( = ?auto_158379 ?auto_158380 ) ) ( not ( = ?auto_158379 ?auto_158381 ) ) ( not ( = ?auto_158379 ?auto_158382 ) ) ( not ( = ?auto_158379 ?auto_158383 ) ) ( not ( = ?auto_158380 ?auto_158381 ) ) ( not ( = ?auto_158380 ?auto_158382 ) ) ( not ( = ?auto_158380 ?auto_158383 ) ) ( not ( = ?auto_158381 ?auto_158382 ) ) ( not ( = ?auto_158381 ?auto_158383 ) ) ( not ( = ?auto_158382 ?auto_158383 ) ) ( not ( = ?auto_158378 ?auto_158385 ) ) ( not ( = ?auto_158378 ?auto_158386 ) ) ( not ( = ?auto_158379 ?auto_158385 ) ) ( not ( = ?auto_158379 ?auto_158386 ) ) ( not ( = ?auto_158380 ?auto_158385 ) ) ( not ( = ?auto_158380 ?auto_158386 ) ) ( not ( = ?auto_158381 ?auto_158385 ) ) ( not ( = ?auto_158381 ?auto_158386 ) ) ( not ( = ?auto_158382 ?auto_158385 ) ) ( not ( = ?auto_158382 ?auto_158386 ) ) ( not ( = ?auto_158383 ?auto_158385 ) ) ( not ( = ?auto_158383 ?auto_158386 ) ) ( not ( = ?auto_158385 ?auto_158386 ) ) ( ON ?auto_158385 ?auto_158383 ) ( not ( = ?auto_158384 ?auto_158386 ) ) ( not ( = ?auto_158378 ?auto_158384 ) ) ( not ( = ?auto_158379 ?auto_158384 ) ) ( not ( = ?auto_158380 ?auto_158384 ) ) ( not ( = ?auto_158381 ?auto_158384 ) ) ( not ( = ?auto_158382 ?auto_158384 ) ) ( not ( = ?auto_158383 ?auto_158384 ) ) ( not ( = ?auto_158385 ?auto_158384 ) ) ( ON ?auto_158386 ?auto_158385 ) ( CLEAR ?auto_158386 ) ( HOLDING ?auto_158384 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158384 )
      ( MAKE-5PILE ?auto_158378 ?auto_158379 ?auto_158380 ?auto_158381 ?auto_158382 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158387 - BLOCK
      ?auto_158388 - BLOCK
      ?auto_158389 - BLOCK
      ?auto_158390 - BLOCK
      ?auto_158391 - BLOCK
    )
    :vars
    (
      ?auto_158393 - BLOCK
      ?auto_158392 - BLOCK
      ?auto_158395 - BLOCK
      ?auto_158394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158393 ?auto_158391 ) ( ON-TABLE ?auto_158387 ) ( ON ?auto_158388 ?auto_158387 ) ( ON ?auto_158389 ?auto_158388 ) ( ON ?auto_158390 ?auto_158389 ) ( ON ?auto_158391 ?auto_158390 ) ( not ( = ?auto_158387 ?auto_158388 ) ) ( not ( = ?auto_158387 ?auto_158389 ) ) ( not ( = ?auto_158387 ?auto_158390 ) ) ( not ( = ?auto_158387 ?auto_158391 ) ) ( not ( = ?auto_158387 ?auto_158393 ) ) ( not ( = ?auto_158388 ?auto_158389 ) ) ( not ( = ?auto_158388 ?auto_158390 ) ) ( not ( = ?auto_158388 ?auto_158391 ) ) ( not ( = ?auto_158388 ?auto_158393 ) ) ( not ( = ?auto_158389 ?auto_158390 ) ) ( not ( = ?auto_158389 ?auto_158391 ) ) ( not ( = ?auto_158389 ?auto_158393 ) ) ( not ( = ?auto_158390 ?auto_158391 ) ) ( not ( = ?auto_158390 ?auto_158393 ) ) ( not ( = ?auto_158391 ?auto_158393 ) ) ( not ( = ?auto_158387 ?auto_158392 ) ) ( not ( = ?auto_158387 ?auto_158395 ) ) ( not ( = ?auto_158388 ?auto_158392 ) ) ( not ( = ?auto_158388 ?auto_158395 ) ) ( not ( = ?auto_158389 ?auto_158392 ) ) ( not ( = ?auto_158389 ?auto_158395 ) ) ( not ( = ?auto_158390 ?auto_158392 ) ) ( not ( = ?auto_158390 ?auto_158395 ) ) ( not ( = ?auto_158391 ?auto_158392 ) ) ( not ( = ?auto_158391 ?auto_158395 ) ) ( not ( = ?auto_158393 ?auto_158392 ) ) ( not ( = ?auto_158393 ?auto_158395 ) ) ( not ( = ?auto_158392 ?auto_158395 ) ) ( ON ?auto_158392 ?auto_158393 ) ( not ( = ?auto_158394 ?auto_158395 ) ) ( not ( = ?auto_158387 ?auto_158394 ) ) ( not ( = ?auto_158388 ?auto_158394 ) ) ( not ( = ?auto_158389 ?auto_158394 ) ) ( not ( = ?auto_158390 ?auto_158394 ) ) ( not ( = ?auto_158391 ?auto_158394 ) ) ( not ( = ?auto_158393 ?auto_158394 ) ) ( not ( = ?auto_158392 ?auto_158394 ) ) ( ON ?auto_158395 ?auto_158392 ) ( ON ?auto_158394 ?auto_158395 ) ( CLEAR ?auto_158394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158387 ?auto_158388 ?auto_158389 ?auto_158390 ?auto_158391 ?auto_158393 ?auto_158392 ?auto_158395 )
      ( MAKE-5PILE ?auto_158387 ?auto_158388 ?auto_158389 ?auto_158390 ?auto_158391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158400 - BLOCK
      ?auto_158401 - BLOCK
      ?auto_158402 - BLOCK
      ?auto_158403 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158403 ) ( CLEAR ?auto_158402 ) ( ON-TABLE ?auto_158400 ) ( ON ?auto_158401 ?auto_158400 ) ( ON ?auto_158402 ?auto_158401 ) ( not ( = ?auto_158400 ?auto_158401 ) ) ( not ( = ?auto_158400 ?auto_158402 ) ) ( not ( = ?auto_158400 ?auto_158403 ) ) ( not ( = ?auto_158401 ?auto_158402 ) ) ( not ( = ?auto_158401 ?auto_158403 ) ) ( not ( = ?auto_158402 ?auto_158403 ) ) )
    :subtasks
    ( ( !STACK ?auto_158403 ?auto_158402 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158404 - BLOCK
      ?auto_158405 - BLOCK
      ?auto_158406 - BLOCK
      ?auto_158407 - BLOCK
    )
    :vars
    (
      ?auto_158408 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158406 ) ( ON-TABLE ?auto_158404 ) ( ON ?auto_158405 ?auto_158404 ) ( ON ?auto_158406 ?auto_158405 ) ( not ( = ?auto_158404 ?auto_158405 ) ) ( not ( = ?auto_158404 ?auto_158406 ) ) ( not ( = ?auto_158404 ?auto_158407 ) ) ( not ( = ?auto_158405 ?auto_158406 ) ) ( not ( = ?auto_158405 ?auto_158407 ) ) ( not ( = ?auto_158406 ?auto_158407 ) ) ( ON ?auto_158407 ?auto_158408 ) ( CLEAR ?auto_158407 ) ( HAND-EMPTY ) ( not ( = ?auto_158404 ?auto_158408 ) ) ( not ( = ?auto_158405 ?auto_158408 ) ) ( not ( = ?auto_158406 ?auto_158408 ) ) ( not ( = ?auto_158407 ?auto_158408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158407 ?auto_158408 )
      ( MAKE-4PILE ?auto_158404 ?auto_158405 ?auto_158406 ?auto_158407 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158409 - BLOCK
      ?auto_158410 - BLOCK
      ?auto_158411 - BLOCK
      ?auto_158412 - BLOCK
    )
    :vars
    (
      ?auto_158413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158409 ) ( ON ?auto_158410 ?auto_158409 ) ( not ( = ?auto_158409 ?auto_158410 ) ) ( not ( = ?auto_158409 ?auto_158411 ) ) ( not ( = ?auto_158409 ?auto_158412 ) ) ( not ( = ?auto_158410 ?auto_158411 ) ) ( not ( = ?auto_158410 ?auto_158412 ) ) ( not ( = ?auto_158411 ?auto_158412 ) ) ( ON ?auto_158412 ?auto_158413 ) ( CLEAR ?auto_158412 ) ( not ( = ?auto_158409 ?auto_158413 ) ) ( not ( = ?auto_158410 ?auto_158413 ) ) ( not ( = ?auto_158411 ?auto_158413 ) ) ( not ( = ?auto_158412 ?auto_158413 ) ) ( HOLDING ?auto_158411 ) ( CLEAR ?auto_158410 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158409 ?auto_158410 ?auto_158411 )
      ( MAKE-4PILE ?auto_158409 ?auto_158410 ?auto_158411 ?auto_158412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158414 - BLOCK
      ?auto_158415 - BLOCK
      ?auto_158416 - BLOCK
      ?auto_158417 - BLOCK
    )
    :vars
    (
      ?auto_158418 - BLOCK
      ?auto_158419 - BLOCK
      ?auto_158420 - BLOCK
      ?auto_158422 - BLOCK
      ?auto_158421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158414 ) ( ON ?auto_158415 ?auto_158414 ) ( not ( = ?auto_158414 ?auto_158415 ) ) ( not ( = ?auto_158414 ?auto_158416 ) ) ( not ( = ?auto_158414 ?auto_158417 ) ) ( not ( = ?auto_158415 ?auto_158416 ) ) ( not ( = ?auto_158415 ?auto_158417 ) ) ( not ( = ?auto_158416 ?auto_158417 ) ) ( ON ?auto_158417 ?auto_158418 ) ( not ( = ?auto_158414 ?auto_158418 ) ) ( not ( = ?auto_158415 ?auto_158418 ) ) ( not ( = ?auto_158416 ?auto_158418 ) ) ( not ( = ?auto_158417 ?auto_158418 ) ) ( CLEAR ?auto_158415 ) ( ON ?auto_158416 ?auto_158417 ) ( CLEAR ?auto_158416 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158419 ) ( ON ?auto_158420 ?auto_158419 ) ( ON ?auto_158422 ?auto_158420 ) ( ON ?auto_158421 ?auto_158422 ) ( ON ?auto_158418 ?auto_158421 ) ( not ( = ?auto_158419 ?auto_158420 ) ) ( not ( = ?auto_158419 ?auto_158422 ) ) ( not ( = ?auto_158419 ?auto_158421 ) ) ( not ( = ?auto_158419 ?auto_158418 ) ) ( not ( = ?auto_158419 ?auto_158417 ) ) ( not ( = ?auto_158419 ?auto_158416 ) ) ( not ( = ?auto_158420 ?auto_158422 ) ) ( not ( = ?auto_158420 ?auto_158421 ) ) ( not ( = ?auto_158420 ?auto_158418 ) ) ( not ( = ?auto_158420 ?auto_158417 ) ) ( not ( = ?auto_158420 ?auto_158416 ) ) ( not ( = ?auto_158422 ?auto_158421 ) ) ( not ( = ?auto_158422 ?auto_158418 ) ) ( not ( = ?auto_158422 ?auto_158417 ) ) ( not ( = ?auto_158422 ?auto_158416 ) ) ( not ( = ?auto_158421 ?auto_158418 ) ) ( not ( = ?auto_158421 ?auto_158417 ) ) ( not ( = ?auto_158421 ?auto_158416 ) ) ( not ( = ?auto_158414 ?auto_158419 ) ) ( not ( = ?auto_158414 ?auto_158420 ) ) ( not ( = ?auto_158414 ?auto_158422 ) ) ( not ( = ?auto_158414 ?auto_158421 ) ) ( not ( = ?auto_158415 ?auto_158419 ) ) ( not ( = ?auto_158415 ?auto_158420 ) ) ( not ( = ?auto_158415 ?auto_158422 ) ) ( not ( = ?auto_158415 ?auto_158421 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158419 ?auto_158420 ?auto_158422 ?auto_158421 ?auto_158418 ?auto_158417 )
      ( MAKE-4PILE ?auto_158414 ?auto_158415 ?auto_158416 ?auto_158417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158423 - BLOCK
      ?auto_158424 - BLOCK
      ?auto_158425 - BLOCK
      ?auto_158426 - BLOCK
    )
    :vars
    (
      ?auto_158427 - BLOCK
      ?auto_158428 - BLOCK
      ?auto_158431 - BLOCK
      ?auto_158430 - BLOCK
      ?auto_158429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158423 ) ( not ( = ?auto_158423 ?auto_158424 ) ) ( not ( = ?auto_158423 ?auto_158425 ) ) ( not ( = ?auto_158423 ?auto_158426 ) ) ( not ( = ?auto_158424 ?auto_158425 ) ) ( not ( = ?auto_158424 ?auto_158426 ) ) ( not ( = ?auto_158425 ?auto_158426 ) ) ( ON ?auto_158426 ?auto_158427 ) ( not ( = ?auto_158423 ?auto_158427 ) ) ( not ( = ?auto_158424 ?auto_158427 ) ) ( not ( = ?auto_158425 ?auto_158427 ) ) ( not ( = ?auto_158426 ?auto_158427 ) ) ( ON ?auto_158425 ?auto_158426 ) ( CLEAR ?auto_158425 ) ( ON-TABLE ?auto_158428 ) ( ON ?auto_158431 ?auto_158428 ) ( ON ?auto_158430 ?auto_158431 ) ( ON ?auto_158429 ?auto_158430 ) ( ON ?auto_158427 ?auto_158429 ) ( not ( = ?auto_158428 ?auto_158431 ) ) ( not ( = ?auto_158428 ?auto_158430 ) ) ( not ( = ?auto_158428 ?auto_158429 ) ) ( not ( = ?auto_158428 ?auto_158427 ) ) ( not ( = ?auto_158428 ?auto_158426 ) ) ( not ( = ?auto_158428 ?auto_158425 ) ) ( not ( = ?auto_158431 ?auto_158430 ) ) ( not ( = ?auto_158431 ?auto_158429 ) ) ( not ( = ?auto_158431 ?auto_158427 ) ) ( not ( = ?auto_158431 ?auto_158426 ) ) ( not ( = ?auto_158431 ?auto_158425 ) ) ( not ( = ?auto_158430 ?auto_158429 ) ) ( not ( = ?auto_158430 ?auto_158427 ) ) ( not ( = ?auto_158430 ?auto_158426 ) ) ( not ( = ?auto_158430 ?auto_158425 ) ) ( not ( = ?auto_158429 ?auto_158427 ) ) ( not ( = ?auto_158429 ?auto_158426 ) ) ( not ( = ?auto_158429 ?auto_158425 ) ) ( not ( = ?auto_158423 ?auto_158428 ) ) ( not ( = ?auto_158423 ?auto_158431 ) ) ( not ( = ?auto_158423 ?auto_158430 ) ) ( not ( = ?auto_158423 ?auto_158429 ) ) ( not ( = ?auto_158424 ?auto_158428 ) ) ( not ( = ?auto_158424 ?auto_158431 ) ) ( not ( = ?auto_158424 ?auto_158430 ) ) ( not ( = ?auto_158424 ?auto_158429 ) ) ( HOLDING ?auto_158424 ) ( CLEAR ?auto_158423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158423 ?auto_158424 )
      ( MAKE-4PILE ?auto_158423 ?auto_158424 ?auto_158425 ?auto_158426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158432 - BLOCK
      ?auto_158433 - BLOCK
      ?auto_158434 - BLOCK
      ?auto_158435 - BLOCK
    )
    :vars
    (
      ?auto_158436 - BLOCK
      ?auto_158438 - BLOCK
      ?auto_158437 - BLOCK
      ?auto_158440 - BLOCK
      ?auto_158439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158432 ) ( not ( = ?auto_158432 ?auto_158433 ) ) ( not ( = ?auto_158432 ?auto_158434 ) ) ( not ( = ?auto_158432 ?auto_158435 ) ) ( not ( = ?auto_158433 ?auto_158434 ) ) ( not ( = ?auto_158433 ?auto_158435 ) ) ( not ( = ?auto_158434 ?auto_158435 ) ) ( ON ?auto_158435 ?auto_158436 ) ( not ( = ?auto_158432 ?auto_158436 ) ) ( not ( = ?auto_158433 ?auto_158436 ) ) ( not ( = ?auto_158434 ?auto_158436 ) ) ( not ( = ?auto_158435 ?auto_158436 ) ) ( ON ?auto_158434 ?auto_158435 ) ( ON-TABLE ?auto_158438 ) ( ON ?auto_158437 ?auto_158438 ) ( ON ?auto_158440 ?auto_158437 ) ( ON ?auto_158439 ?auto_158440 ) ( ON ?auto_158436 ?auto_158439 ) ( not ( = ?auto_158438 ?auto_158437 ) ) ( not ( = ?auto_158438 ?auto_158440 ) ) ( not ( = ?auto_158438 ?auto_158439 ) ) ( not ( = ?auto_158438 ?auto_158436 ) ) ( not ( = ?auto_158438 ?auto_158435 ) ) ( not ( = ?auto_158438 ?auto_158434 ) ) ( not ( = ?auto_158437 ?auto_158440 ) ) ( not ( = ?auto_158437 ?auto_158439 ) ) ( not ( = ?auto_158437 ?auto_158436 ) ) ( not ( = ?auto_158437 ?auto_158435 ) ) ( not ( = ?auto_158437 ?auto_158434 ) ) ( not ( = ?auto_158440 ?auto_158439 ) ) ( not ( = ?auto_158440 ?auto_158436 ) ) ( not ( = ?auto_158440 ?auto_158435 ) ) ( not ( = ?auto_158440 ?auto_158434 ) ) ( not ( = ?auto_158439 ?auto_158436 ) ) ( not ( = ?auto_158439 ?auto_158435 ) ) ( not ( = ?auto_158439 ?auto_158434 ) ) ( not ( = ?auto_158432 ?auto_158438 ) ) ( not ( = ?auto_158432 ?auto_158437 ) ) ( not ( = ?auto_158432 ?auto_158440 ) ) ( not ( = ?auto_158432 ?auto_158439 ) ) ( not ( = ?auto_158433 ?auto_158438 ) ) ( not ( = ?auto_158433 ?auto_158437 ) ) ( not ( = ?auto_158433 ?auto_158440 ) ) ( not ( = ?auto_158433 ?auto_158439 ) ) ( CLEAR ?auto_158432 ) ( ON ?auto_158433 ?auto_158434 ) ( CLEAR ?auto_158433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158438 ?auto_158437 ?auto_158440 ?auto_158439 ?auto_158436 ?auto_158435 ?auto_158434 )
      ( MAKE-4PILE ?auto_158432 ?auto_158433 ?auto_158434 ?auto_158435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158441 - BLOCK
      ?auto_158442 - BLOCK
      ?auto_158443 - BLOCK
      ?auto_158444 - BLOCK
    )
    :vars
    (
      ?auto_158448 - BLOCK
      ?auto_158445 - BLOCK
      ?auto_158449 - BLOCK
      ?auto_158446 - BLOCK
      ?auto_158447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158441 ?auto_158442 ) ) ( not ( = ?auto_158441 ?auto_158443 ) ) ( not ( = ?auto_158441 ?auto_158444 ) ) ( not ( = ?auto_158442 ?auto_158443 ) ) ( not ( = ?auto_158442 ?auto_158444 ) ) ( not ( = ?auto_158443 ?auto_158444 ) ) ( ON ?auto_158444 ?auto_158448 ) ( not ( = ?auto_158441 ?auto_158448 ) ) ( not ( = ?auto_158442 ?auto_158448 ) ) ( not ( = ?auto_158443 ?auto_158448 ) ) ( not ( = ?auto_158444 ?auto_158448 ) ) ( ON ?auto_158443 ?auto_158444 ) ( ON-TABLE ?auto_158445 ) ( ON ?auto_158449 ?auto_158445 ) ( ON ?auto_158446 ?auto_158449 ) ( ON ?auto_158447 ?auto_158446 ) ( ON ?auto_158448 ?auto_158447 ) ( not ( = ?auto_158445 ?auto_158449 ) ) ( not ( = ?auto_158445 ?auto_158446 ) ) ( not ( = ?auto_158445 ?auto_158447 ) ) ( not ( = ?auto_158445 ?auto_158448 ) ) ( not ( = ?auto_158445 ?auto_158444 ) ) ( not ( = ?auto_158445 ?auto_158443 ) ) ( not ( = ?auto_158449 ?auto_158446 ) ) ( not ( = ?auto_158449 ?auto_158447 ) ) ( not ( = ?auto_158449 ?auto_158448 ) ) ( not ( = ?auto_158449 ?auto_158444 ) ) ( not ( = ?auto_158449 ?auto_158443 ) ) ( not ( = ?auto_158446 ?auto_158447 ) ) ( not ( = ?auto_158446 ?auto_158448 ) ) ( not ( = ?auto_158446 ?auto_158444 ) ) ( not ( = ?auto_158446 ?auto_158443 ) ) ( not ( = ?auto_158447 ?auto_158448 ) ) ( not ( = ?auto_158447 ?auto_158444 ) ) ( not ( = ?auto_158447 ?auto_158443 ) ) ( not ( = ?auto_158441 ?auto_158445 ) ) ( not ( = ?auto_158441 ?auto_158449 ) ) ( not ( = ?auto_158441 ?auto_158446 ) ) ( not ( = ?auto_158441 ?auto_158447 ) ) ( not ( = ?auto_158442 ?auto_158445 ) ) ( not ( = ?auto_158442 ?auto_158449 ) ) ( not ( = ?auto_158442 ?auto_158446 ) ) ( not ( = ?auto_158442 ?auto_158447 ) ) ( ON ?auto_158442 ?auto_158443 ) ( CLEAR ?auto_158442 ) ( HOLDING ?auto_158441 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158441 )
      ( MAKE-4PILE ?auto_158441 ?auto_158442 ?auto_158443 ?auto_158444 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158450 - BLOCK
      ?auto_158451 - BLOCK
      ?auto_158452 - BLOCK
      ?auto_158453 - BLOCK
    )
    :vars
    (
      ?auto_158456 - BLOCK
      ?auto_158454 - BLOCK
      ?auto_158455 - BLOCK
      ?auto_158458 - BLOCK
      ?auto_158457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158450 ?auto_158451 ) ) ( not ( = ?auto_158450 ?auto_158452 ) ) ( not ( = ?auto_158450 ?auto_158453 ) ) ( not ( = ?auto_158451 ?auto_158452 ) ) ( not ( = ?auto_158451 ?auto_158453 ) ) ( not ( = ?auto_158452 ?auto_158453 ) ) ( ON ?auto_158453 ?auto_158456 ) ( not ( = ?auto_158450 ?auto_158456 ) ) ( not ( = ?auto_158451 ?auto_158456 ) ) ( not ( = ?auto_158452 ?auto_158456 ) ) ( not ( = ?auto_158453 ?auto_158456 ) ) ( ON ?auto_158452 ?auto_158453 ) ( ON-TABLE ?auto_158454 ) ( ON ?auto_158455 ?auto_158454 ) ( ON ?auto_158458 ?auto_158455 ) ( ON ?auto_158457 ?auto_158458 ) ( ON ?auto_158456 ?auto_158457 ) ( not ( = ?auto_158454 ?auto_158455 ) ) ( not ( = ?auto_158454 ?auto_158458 ) ) ( not ( = ?auto_158454 ?auto_158457 ) ) ( not ( = ?auto_158454 ?auto_158456 ) ) ( not ( = ?auto_158454 ?auto_158453 ) ) ( not ( = ?auto_158454 ?auto_158452 ) ) ( not ( = ?auto_158455 ?auto_158458 ) ) ( not ( = ?auto_158455 ?auto_158457 ) ) ( not ( = ?auto_158455 ?auto_158456 ) ) ( not ( = ?auto_158455 ?auto_158453 ) ) ( not ( = ?auto_158455 ?auto_158452 ) ) ( not ( = ?auto_158458 ?auto_158457 ) ) ( not ( = ?auto_158458 ?auto_158456 ) ) ( not ( = ?auto_158458 ?auto_158453 ) ) ( not ( = ?auto_158458 ?auto_158452 ) ) ( not ( = ?auto_158457 ?auto_158456 ) ) ( not ( = ?auto_158457 ?auto_158453 ) ) ( not ( = ?auto_158457 ?auto_158452 ) ) ( not ( = ?auto_158450 ?auto_158454 ) ) ( not ( = ?auto_158450 ?auto_158455 ) ) ( not ( = ?auto_158450 ?auto_158458 ) ) ( not ( = ?auto_158450 ?auto_158457 ) ) ( not ( = ?auto_158451 ?auto_158454 ) ) ( not ( = ?auto_158451 ?auto_158455 ) ) ( not ( = ?auto_158451 ?auto_158458 ) ) ( not ( = ?auto_158451 ?auto_158457 ) ) ( ON ?auto_158451 ?auto_158452 ) ( ON ?auto_158450 ?auto_158451 ) ( CLEAR ?auto_158450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158454 ?auto_158455 ?auto_158458 ?auto_158457 ?auto_158456 ?auto_158453 ?auto_158452 ?auto_158451 )
      ( MAKE-4PILE ?auto_158450 ?auto_158451 ?auto_158452 ?auto_158453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158463 - BLOCK
      ?auto_158464 - BLOCK
      ?auto_158465 - BLOCK
      ?auto_158466 - BLOCK
    )
    :vars
    (
      ?auto_158467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158467 ?auto_158466 ) ( CLEAR ?auto_158467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158463 ) ( ON ?auto_158464 ?auto_158463 ) ( ON ?auto_158465 ?auto_158464 ) ( ON ?auto_158466 ?auto_158465 ) ( not ( = ?auto_158463 ?auto_158464 ) ) ( not ( = ?auto_158463 ?auto_158465 ) ) ( not ( = ?auto_158463 ?auto_158466 ) ) ( not ( = ?auto_158463 ?auto_158467 ) ) ( not ( = ?auto_158464 ?auto_158465 ) ) ( not ( = ?auto_158464 ?auto_158466 ) ) ( not ( = ?auto_158464 ?auto_158467 ) ) ( not ( = ?auto_158465 ?auto_158466 ) ) ( not ( = ?auto_158465 ?auto_158467 ) ) ( not ( = ?auto_158466 ?auto_158467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158467 ?auto_158466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158468 - BLOCK
      ?auto_158469 - BLOCK
      ?auto_158470 - BLOCK
      ?auto_158471 - BLOCK
    )
    :vars
    (
      ?auto_158472 - BLOCK
      ?auto_158473 - BLOCK
      ?auto_158474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158472 ?auto_158471 ) ( CLEAR ?auto_158472 ) ( ON-TABLE ?auto_158468 ) ( ON ?auto_158469 ?auto_158468 ) ( ON ?auto_158470 ?auto_158469 ) ( ON ?auto_158471 ?auto_158470 ) ( not ( = ?auto_158468 ?auto_158469 ) ) ( not ( = ?auto_158468 ?auto_158470 ) ) ( not ( = ?auto_158468 ?auto_158471 ) ) ( not ( = ?auto_158468 ?auto_158472 ) ) ( not ( = ?auto_158469 ?auto_158470 ) ) ( not ( = ?auto_158469 ?auto_158471 ) ) ( not ( = ?auto_158469 ?auto_158472 ) ) ( not ( = ?auto_158470 ?auto_158471 ) ) ( not ( = ?auto_158470 ?auto_158472 ) ) ( not ( = ?auto_158471 ?auto_158472 ) ) ( HOLDING ?auto_158473 ) ( CLEAR ?auto_158474 ) ( not ( = ?auto_158468 ?auto_158473 ) ) ( not ( = ?auto_158468 ?auto_158474 ) ) ( not ( = ?auto_158469 ?auto_158473 ) ) ( not ( = ?auto_158469 ?auto_158474 ) ) ( not ( = ?auto_158470 ?auto_158473 ) ) ( not ( = ?auto_158470 ?auto_158474 ) ) ( not ( = ?auto_158471 ?auto_158473 ) ) ( not ( = ?auto_158471 ?auto_158474 ) ) ( not ( = ?auto_158472 ?auto_158473 ) ) ( not ( = ?auto_158472 ?auto_158474 ) ) ( not ( = ?auto_158473 ?auto_158474 ) ) )
    :subtasks
    ( ( !STACK ?auto_158473 ?auto_158474 )
      ( MAKE-4PILE ?auto_158468 ?auto_158469 ?auto_158470 ?auto_158471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158475 - BLOCK
      ?auto_158476 - BLOCK
      ?auto_158477 - BLOCK
      ?auto_158478 - BLOCK
    )
    :vars
    (
      ?auto_158479 - BLOCK
      ?auto_158480 - BLOCK
      ?auto_158481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158479 ?auto_158478 ) ( ON-TABLE ?auto_158475 ) ( ON ?auto_158476 ?auto_158475 ) ( ON ?auto_158477 ?auto_158476 ) ( ON ?auto_158478 ?auto_158477 ) ( not ( = ?auto_158475 ?auto_158476 ) ) ( not ( = ?auto_158475 ?auto_158477 ) ) ( not ( = ?auto_158475 ?auto_158478 ) ) ( not ( = ?auto_158475 ?auto_158479 ) ) ( not ( = ?auto_158476 ?auto_158477 ) ) ( not ( = ?auto_158476 ?auto_158478 ) ) ( not ( = ?auto_158476 ?auto_158479 ) ) ( not ( = ?auto_158477 ?auto_158478 ) ) ( not ( = ?auto_158477 ?auto_158479 ) ) ( not ( = ?auto_158478 ?auto_158479 ) ) ( CLEAR ?auto_158480 ) ( not ( = ?auto_158475 ?auto_158481 ) ) ( not ( = ?auto_158475 ?auto_158480 ) ) ( not ( = ?auto_158476 ?auto_158481 ) ) ( not ( = ?auto_158476 ?auto_158480 ) ) ( not ( = ?auto_158477 ?auto_158481 ) ) ( not ( = ?auto_158477 ?auto_158480 ) ) ( not ( = ?auto_158478 ?auto_158481 ) ) ( not ( = ?auto_158478 ?auto_158480 ) ) ( not ( = ?auto_158479 ?auto_158481 ) ) ( not ( = ?auto_158479 ?auto_158480 ) ) ( not ( = ?auto_158481 ?auto_158480 ) ) ( ON ?auto_158481 ?auto_158479 ) ( CLEAR ?auto_158481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158475 ?auto_158476 ?auto_158477 ?auto_158478 ?auto_158479 )
      ( MAKE-4PILE ?auto_158475 ?auto_158476 ?auto_158477 ?auto_158478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158482 - BLOCK
      ?auto_158483 - BLOCK
      ?auto_158484 - BLOCK
      ?auto_158485 - BLOCK
    )
    :vars
    (
      ?auto_158488 - BLOCK
      ?auto_158486 - BLOCK
      ?auto_158487 - BLOCK
      ?auto_158490 - BLOCK
      ?auto_158489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158488 ?auto_158485 ) ( ON-TABLE ?auto_158482 ) ( ON ?auto_158483 ?auto_158482 ) ( ON ?auto_158484 ?auto_158483 ) ( ON ?auto_158485 ?auto_158484 ) ( not ( = ?auto_158482 ?auto_158483 ) ) ( not ( = ?auto_158482 ?auto_158484 ) ) ( not ( = ?auto_158482 ?auto_158485 ) ) ( not ( = ?auto_158482 ?auto_158488 ) ) ( not ( = ?auto_158483 ?auto_158484 ) ) ( not ( = ?auto_158483 ?auto_158485 ) ) ( not ( = ?auto_158483 ?auto_158488 ) ) ( not ( = ?auto_158484 ?auto_158485 ) ) ( not ( = ?auto_158484 ?auto_158488 ) ) ( not ( = ?auto_158485 ?auto_158488 ) ) ( not ( = ?auto_158482 ?auto_158486 ) ) ( not ( = ?auto_158482 ?auto_158487 ) ) ( not ( = ?auto_158483 ?auto_158486 ) ) ( not ( = ?auto_158483 ?auto_158487 ) ) ( not ( = ?auto_158484 ?auto_158486 ) ) ( not ( = ?auto_158484 ?auto_158487 ) ) ( not ( = ?auto_158485 ?auto_158486 ) ) ( not ( = ?auto_158485 ?auto_158487 ) ) ( not ( = ?auto_158488 ?auto_158486 ) ) ( not ( = ?auto_158488 ?auto_158487 ) ) ( not ( = ?auto_158486 ?auto_158487 ) ) ( ON ?auto_158486 ?auto_158488 ) ( CLEAR ?auto_158486 ) ( HOLDING ?auto_158487 ) ( CLEAR ?auto_158490 ) ( ON-TABLE ?auto_158489 ) ( ON ?auto_158490 ?auto_158489 ) ( not ( = ?auto_158489 ?auto_158490 ) ) ( not ( = ?auto_158489 ?auto_158487 ) ) ( not ( = ?auto_158490 ?auto_158487 ) ) ( not ( = ?auto_158482 ?auto_158490 ) ) ( not ( = ?auto_158482 ?auto_158489 ) ) ( not ( = ?auto_158483 ?auto_158490 ) ) ( not ( = ?auto_158483 ?auto_158489 ) ) ( not ( = ?auto_158484 ?auto_158490 ) ) ( not ( = ?auto_158484 ?auto_158489 ) ) ( not ( = ?auto_158485 ?auto_158490 ) ) ( not ( = ?auto_158485 ?auto_158489 ) ) ( not ( = ?auto_158488 ?auto_158490 ) ) ( not ( = ?auto_158488 ?auto_158489 ) ) ( not ( = ?auto_158486 ?auto_158490 ) ) ( not ( = ?auto_158486 ?auto_158489 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158489 ?auto_158490 ?auto_158487 )
      ( MAKE-4PILE ?auto_158482 ?auto_158483 ?auto_158484 ?auto_158485 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158491 - BLOCK
      ?auto_158492 - BLOCK
      ?auto_158493 - BLOCK
      ?auto_158494 - BLOCK
    )
    :vars
    (
      ?auto_158496 - BLOCK
      ?auto_158497 - BLOCK
      ?auto_158495 - BLOCK
      ?auto_158499 - BLOCK
      ?auto_158498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158496 ?auto_158494 ) ( ON-TABLE ?auto_158491 ) ( ON ?auto_158492 ?auto_158491 ) ( ON ?auto_158493 ?auto_158492 ) ( ON ?auto_158494 ?auto_158493 ) ( not ( = ?auto_158491 ?auto_158492 ) ) ( not ( = ?auto_158491 ?auto_158493 ) ) ( not ( = ?auto_158491 ?auto_158494 ) ) ( not ( = ?auto_158491 ?auto_158496 ) ) ( not ( = ?auto_158492 ?auto_158493 ) ) ( not ( = ?auto_158492 ?auto_158494 ) ) ( not ( = ?auto_158492 ?auto_158496 ) ) ( not ( = ?auto_158493 ?auto_158494 ) ) ( not ( = ?auto_158493 ?auto_158496 ) ) ( not ( = ?auto_158494 ?auto_158496 ) ) ( not ( = ?auto_158491 ?auto_158497 ) ) ( not ( = ?auto_158491 ?auto_158495 ) ) ( not ( = ?auto_158492 ?auto_158497 ) ) ( not ( = ?auto_158492 ?auto_158495 ) ) ( not ( = ?auto_158493 ?auto_158497 ) ) ( not ( = ?auto_158493 ?auto_158495 ) ) ( not ( = ?auto_158494 ?auto_158497 ) ) ( not ( = ?auto_158494 ?auto_158495 ) ) ( not ( = ?auto_158496 ?auto_158497 ) ) ( not ( = ?auto_158496 ?auto_158495 ) ) ( not ( = ?auto_158497 ?auto_158495 ) ) ( ON ?auto_158497 ?auto_158496 ) ( CLEAR ?auto_158499 ) ( ON-TABLE ?auto_158498 ) ( ON ?auto_158499 ?auto_158498 ) ( not ( = ?auto_158498 ?auto_158499 ) ) ( not ( = ?auto_158498 ?auto_158495 ) ) ( not ( = ?auto_158499 ?auto_158495 ) ) ( not ( = ?auto_158491 ?auto_158499 ) ) ( not ( = ?auto_158491 ?auto_158498 ) ) ( not ( = ?auto_158492 ?auto_158499 ) ) ( not ( = ?auto_158492 ?auto_158498 ) ) ( not ( = ?auto_158493 ?auto_158499 ) ) ( not ( = ?auto_158493 ?auto_158498 ) ) ( not ( = ?auto_158494 ?auto_158499 ) ) ( not ( = ?auto_158494 ?auto_158498 ) ) ( not ( = ?auto_158496 ?auto_158499 ) ) ( not ( = ?auto_158496 ?auto_158498 ) ) ( not ( = ?auto_158497 ?auto_158499 ) ) ( not ( = ?auto_158497 ?auto_158498 ) ) ( ON ?auto_158495 ?auto_158497 ) ( CLEAR ?auto_158495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158491 ?auto_158492 ?auto_158493 ?auto_158494 ?auto_158496 ?auto_158497 )
      ( MAKE-4PILE ?auto_158491 ?auto_158492 ?auto_158493 ?auto_158494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158500 - BLOCK
      ?auto_158501 - BLOCK
      ?auto_158502 - BLOCK
      ?auto_158503 - BLOCK
    )
    :vars
    (
      ?auto_158504 - BLOCK
      ?auto_158508 - BLOCK
      ?auto_158507 - BLOCK
      ?auto_158505 - BLOCK
      ?auto_158506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158504 ?auto_158503 ) ( ON-TABLE ?auto_158500 ) ( ON ?auto_158501 ?auto_158500 ) ( ON ?auto_158502 ?auto_158501 ) ( ON ?auto_158503 ?auto_158502 ) ( not ( = ?auto_158500 ?auto_158501 ) ) ( not ( = ?auto_158500 ?auto_158502 ) ) ( not ( = ?auto_158500 ?auto_158503 ) ) ( not ( = ?auto_158500 ?auto_158504 ) ) ( not ( = ?auto_158501 ?auto_158502 ) ) ( not ( = ?auto_158501 ?auto_158503 ) ) ( not ( = ?auto_158501 ?auto_158504 ) ) ( not ( = ?auto_158502 ?auto_158503 ) ) ( not ( = ?auto_158502 ?auto_158504 ) ) ( not ( = ?auto_158503 ?auto_158504 ) ) ( not ( = ?auto_158500 ?auto_158508 ) ) ( not ( = ?auto_158500 ?auto_158507 ) ) ( not ( = ?auto_158501 ?auto_158508 ) ) ( not ( = ?auto_158501 ?auto_158507 ) ) ( not ( = ?auto_158502 ?auto_158508 ) ) ( not ( = ?auto_158502 ?auto_158507 ) ) ( not ( = ?auto_158503 ?auto_158508 ) ) ( not ( = ?auto_158503 ?auto_158507 ) ) ( not ( = ?auto_158504 ?auto_158508 ) ) ( not ( = ?auto_158504 ?auto_158507 ) ) ( not ( = ?auto_158508 ?auto_158507 ) ) ( ON ?auto_158508 ?auto_158504 ) ( ON-TABLE ?auto_158505 ) ( not ( = ?auto_158505 ?auto_158506 ) ) ( not ( = ?auto_158505 ?auto_158507 ) ) ( not ( = ?auto_158506 ?auto_158507 ) ) ( not ( = ?auto_158500 ?auto_158506 ) ) ( not ( = ?auto_158500 ?auto_158505 ) ) ( not ( = ?auto_158501 ?auto_158506 ) ) ( not ( = ?auto_158501 ?auto_158505 ) ) ( not ( = ?auto_158502 ?auto_158506 ) ) ( not ( = ?auto_158502 ?auto_158505 ) ) ( not ( = ?auto_158503 ?auto_158506 ) ) ( not ( = ?auto_158503 ?auto_158505 ) ) ( not ( = ?auto_158504 ?auto_158506 ) ) ( not ( = ?auto_158504 ?auto_158505 ) ) ( not ( = ?auto_158508 ?auto_158506 ) ) ( not ( = ?auto_158508 ?auto_158505 ) ) ( ON ?auto_158507 ?auto_158508 ) ( CLEAR ?auto_158507 ) ( HOLDING ?auto_158506 ) ( CLEAR ?auto_158505 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158505 ?auto_158506 )
      ( MAKE-4PILE ?auto_158500 ?auto_158501 ?auto_158502 ?auto_158503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158509 - BLOCK
      ?auto_158510 - BLOCK
      ?auto_158511 - BLOCK
      ?auto_158512 - BLOCK
    )
    :vars
    (
      ?auto_158517 - BLOCK
      ?auto_158513 - BLOCK
      ?auto_158514 - BLOCK
      ?auto_158516 - BLOCK
      ?auto_158515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158517 ?auto_158512 ) ( ON-TABLE ?auto_158509 ) ( ON ?auto_158510 ?auto_158509 ) ( ON ?auto_158511 ?auto_158510 ) ( ON ?auto_158512 ?auto_158511 ) ( not ( = ?auto_158509 ?auto_158510 ) ) ( not ( = ?auto_158509 ?auto_158511 ) ) ( not ( = ?auto_158509 ?auto_158512 ) ) ( not ( = ?auto_158509 ?auto_158517 ) ) ( not ( = ?auto_158510 ?auto_158511 ) ) ( not ( = ?auto_158510 ?auto_158512 ) ) ( not ( = ?auto_158510 ?auto_158517 ) ) ( not ( = ?auto_158511 ?auto_158512 ) ) ( not ( = ?auto_158511 ?auto_158517 ) ) ( not ( = ?auto_158512 ?auto_158517 ) ) ( not ( = ?auto_158509 ?auto_158513 ) ) ( not ( = ?auto_158509 ?auto_158514 ) ) ( not ( = ?auto_158510 ?auto_158513 ) ) ( not ( = ?auto_158510 ?auto_158514 ) ) ( not ( = ?auto_158511 ?auto_158513 ) ) ( not ( = ?auto_158511 ?auto_158514 ) ) ( not ( = ?auto_158512 ?auto_158513 ) ) ( not ( = ?auto_158512 ?auto_158514 ) ) ( not ( = ?auto_158517 ?auto_158513 ) ) ( not ( = ?auto_158517 ?auto_158514 ) ) ( not ( = ?auto_158513 ?auto_158514 ) ) ( ON ?auto_158513 ?auto_158517 ) ( ON-TABLE ?auto_158516 ) ( not ( = ?auto_158516 ?auto_158515 ) ) ( not ( = ?auto_158516 ?auto_158514 ) ) ( not ( = ?auto_158515 ?auto_158514 ) ) ( not ( = ?auto_158509 ?auto_158515 ) ) ( not ( = ?auto_158509 ?auto_158516 ) ) ( not ( = ?auto_158510 ?auto_158515 ) ) ( not ( = ?auto_158510 ?auto_158516 ) ) ( not ( = ?auto_158511 ?auto_158515 ) ) ( not ( = ?auto_158511 ?auto_158516 ) ) ( not ( = ?auto_158512 ?auto_158515 ) ) ( not ( = ?auto_158512 ?auto_158516 ) ) ( not ( = ?auto_158517 ?auto_158515 ) ) ( not ( = ?auto_158517 ?auto_158516 ) ) ( not ( = ?auto_158513 ?auto_158515 ) ) ( not ( = ?auto_158513 ?auto_158516 ) ) ( ON ?auto_158514 ?auto_158513 ) ( CLEAR ?auto_158516 ) ( ON ?auto_158515 ?auto_158514 ) ( CLEAR ?auto_158515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158509 ?auto_158510 ?auto_158511 ?auto_158512 ?auto_158517 ?auto_158513 ?auto_158514 )
      ( MAKE-4PILE ?auto_158509 ?auto_158510 ?auto_158511 ?auto_158512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158518 - BLOCK
      ?auto_158519 - BLOCK
      ?auto_158520 - BLOCK
      ?auto_158521 - BLOCK
    )
    :vars
    (
      ?auto_158523 - BLOCK
      ?auto_158524 - BLOCK
      ?auto_158525 - BLOCK
      ?auto_158526 - BLOCK
      ?auto_158522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158523 ?auto_158521 ) ( ON-TABLE ?auto_158518 ) ( ON ?auto_158519 ?auto_158518 ) ( ON ?auto_158520 ?auto_158519 ) ( ON ?auto_158521 ?auto_158520 ) ( not ( = ?auto_158518 ?auto_158519 ) ) ( not ( = ?auto_158518 ?auto_158520 ) ) ( not ( = ?auto_158518 ?auto_158521 ) ) ( not ( = ?auto_158518 ?auto_158523 ) ) ( not ( = ?auto_158519 ?auto_158520 ) ) ( not ( = ?auto_158519 ?auto_158521 ) ) ( not ( = ?auto_158519 ?auto_158523 ) ) ( not ( = ?auto_158520 ?auto_158521 ) ) ( not ( = ?auto_158520 ?auto_158523 ) ) ( not ( = ?auto_158521 ?auto_158523 ) ) ( not ( = ?auto_158518 ?auto_158524 ) ) ( not ( = ?auto_158518 ?auto_158525 ) ) ( not ( = ?auto_158519 ?auto_158524 ) ) ( not ( = ?auto_158519 ?auto_158525 ) ) ( not ( = ?auto_158520 ?auto_158524 ) ) ( not ( = ?auto_158520 ?auto_158525 ) ) ( not ( = ?auto_158521 ?auto_158524 ) ) ( not ( = ?auto_158521 ?auto_158525 ) ) ( not ( = ?auto_158523 ?auto_158524 ) ) ( not ( = ?auto_158523 ?auto_158525 ) ) ( not ( = ?auto_158524 ?auto_158525 ) ) ( ON ?auto_158524 ?auto_158523 ) ( not ( = ?auto_158526 ?auto_158522 ) ) ( not ( = ?auto_158526 ?auto_158525 ) ) ( not ( = ?auto_158522 ?auto_158525 ) ) ( not ( = ?auto_158518 ?auto_158522 ) ) ( not ( = ?auto_158518 ?auto_158526 ) ) ( not ( = ?auto_158519 ?auto_158522 ) ) ( not ( = ?auto_158519 ?auto_158526 ) ) ( not ( = ?auto_158520 ?auto_158522 ) ) ( not ( = ?auto_158520 ?auto_158526 ) ) ( not ( = ?auto_158521 ?auto_158522 ) ) ( not ( = ?auto_158521 ?auto_158526 ) ) ( not ( = ?auto_158523 ?auto_158522 ) ) ( not ( = ?auto_158523 ?auto_158526 ) ) ( not ( = ?auto_158524 ?auto_158522 ) ) ( not ( = ?auto_158524 ?auto_158526 ) ) ( ON ?auto_158525 ?auto_158524 ) ( ON ?auto_158522 ?auto_158525 ) ( CLEAR ?auto_158522 ) ( HOLDING ?auto_158526 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158526 )
      ( MAKE-4PILE ?auto_158518 ?auto_158519 ?auto_158520 ?auto_158521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_158527 - BLOCK
      ?auto_158528 - BLOCK
      ?auto_158529 - BLOCK
      ?auto_158530 - BLOCK
    )
    :vars
    (
      ?auto_158535 - BLOCK
      ?auto_158531 - BLOCK
      ?auto_158533 - BLOCK
      ?auto_158532 - BLOCK
      ?auto_158534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158535 ?auto_158530 ) ( ON-TABLE ?auto_158527 ) ( ON ?auto_158528 ?auto_158527 ) ( ON ?auto_158529 ?auto_158528 ) ( ON ?auto_158530 ?auto_158529 ) ( not ( = ?auto_158527 ?auto_158528 ) ) ( not ( = ?auto_158527 ?auto_158529 ) ) ( not ( = ?auto_158527 ?auto_158530 ) ) ( not ( = ?auto_158527 ?auto_158535 ) ) ( not ( = ?auto_158528 ?auto_158529 ) ) ( not ( = ?auto_158528 ?auto_158530 ) ) ( not ( = ?auto_158528 ?auto_158535 ) ) ( not ( = ?auto_158529 ?auto_158530 ) ) ( not ( = ?auto_158529 ?auto_158535 ) ) ( not ( = ?auto_158530 ?auto_158535 ) ) ( not ( = ?auto_158527 ?auto_158531 ) ) ( not ( = ?auto_158527 ?auto_158533 ) ) ( not ( = ?auto_158528 ?auto_158531 ) ) ( not ( = ?auto_158528 ?auto_158533 ) ) ( not ( = ?auto_158529 ?auto_158531 ) ) ( not ( = ?auto_158529 ?auto_158533 ) ) ( not ( = ?auto_158530 ?auto_158531 ) ) ( not ( = ?auto_158530 ?auto_158533 ) ) ( not ( = ?auto_158535 ?auto_158531 ) ) ( not ( = ?auto_158535 ?auto_158533 ) ) ( not ( = ?auto_158531 ?auto_158533 ) ) ( ON ?auto_158531 ?auto_158535 ) ( not ( = ?auto_158532 ?auto_158534 ) ) ( not ( = ?auto_158532 ?auto_158533 ) ) ( not ( = ?auto_158534 ?auto_158533 ) ) ( not ( = ?auto_158527 ?auto_158534 ) ) ( not ( = ?auto_158527 ?auto_158532 ) ) ( not ( = ?auto_158528 ?auto_158534 ) ) ( not ( = ?auto_158528 ?auto_158532 ) ) ( not ( = ?auto_158529 ?auto_158534 ) ) ( not ( = ?auto_158529 ?auto_158532 ) ) ( not ( = ?auto_158530 ?auto_158534 ) ) ( not ( = ?auto_158530 ?auto_158532 ) ) ( not ( = ?auto_158535 ?auto_158534 ) ) ( not ( = ?auto_158535 ?auto_158532 ) ) ( not ( = ?auto_158531 ?auto_158534 ) ) ( not ( = ?auto_158531 ?auto_158532 ) ) ( ON ?auto_158533 ?auto_158531 ) ( ON ?auto_158534 ?auto_158533 ) ( ON ?auto_158532 ?auto_158534 ) ( CLEAR ?auto_158532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158527 ?auto_158528 ?auto_158529 ?auto_158530 ?auto_158535 ?auto_158531 ?auto_158533 ?auto_158534 )
      ( MAKE-4PILE ?auto_158527 ?auto_158528 ?auto_158529 ?auto_158530 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158541 - BLOCK
      ?auto_158542 - BLOCK
      ?auto_158543 - BLOCK
      ?auto_158544 - BLOCK
      ?auto_158545 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158545 ) ( CLEAR ?auto_158544 ) ( ON-TABLE ?auto_158541 ) ( ON ?auto_158542 ?auto_158541 ) ( ON ?auto_158543 ?auto_158542 ) ( ON ?auto_158544 ?auto_158543 ) ( not ( = ?auto_158541 ?auto_158542 ) ) ( not ( = ?auto_158541 ?auto_158543 ) ) ( not ( = ?auto_158541 ?auto_158544 ) ) ( not ( = ?auto_158541 ?auto_158545 ) ) ( not ( = ?auto_158542 ?auto_158543 ) ) ( not ( = ?auto_158542 ?auto_158544 ) ) ( not ( = ?auto_158542 ?auto_158545 ) ) ( not ( = ?auto_158543 ?auto_158544 ) ) ( not ( = ?auto_158543 ?auto_158545 ) ) ( not ( = ?auto_158544 ?auto_158545 ) ) )
    :subtasks
    ( ( !STACK ?auto_158545 ?auto_158544 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158546 - BLOCK
      ?auto_158547 - BLOCK
      ?auto_158548 - BLOCK
      ?auto_158549 - BLOCK
      ?auto_158550 - BLOCK
    )
    :vars
    (
      ?auto_158551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158549 ) ( ON-TABLE ?auto_158546 ) ( ON ?auto_158547 ?auto_158546 ) ( ON ?auto_158548 ?auto_158547 ) ( ON ?auto_158549 ?auto_158548 ) ( not ( = ?auto_158546 ?auto_158547 ) ) ( not ( = ?auto_158546 ?auto_158548 ) ) ( not ( = ?auto_158546 ?auto_158549 ) ) ( not ( = ?auto_158546 ?auto_158550 ) ) ( not ( = ?auto_158547 ?auto_158548 ) ) ( not ( = ?auto_158547 ?auto_158549 ) ) ( not ( = ?auto_158547 ?auto_158550 ) ) ( not ( = ?auto_158548 ?auto_158549 ) ) ( not ( = ?auto_158548 ?auto_158550 ) ) ( not ( = ?auto_158549 ?auto_158550 ) ) ( ON ?auto_158550 ?auto_158551 ) ( CLEAR ?auto_158550 ) ( HAND-EMPTY ) ( not ( = ?auto_158546 ?auto_158551 ) ) ( not ( = ?auto_158547 ?auto_158551 ) ) ( not ( = ?auto_158548 ?auto_158551 ) ) ( not ( = ?auto_158549 ?auto_158551 ) ) ( not ( = ?auto_158550 ?auto_158551 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158550 ?auto_158551 )
      ( MAKE-5PILE ?auto_158546 ?auto_158547 ?auto_158548 ?auto_158549 ?auto_158550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158552 - BLOCK
      ?auto_158553 - BLOCK
      ?auto_158554 - BLOCK
      ?auto_158555 - BLOCK
      ?auto_158556 - BLOCK
    )
    :vars
    (
      ?auto_158557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158552 ) ( ON ?auto_158553 ?auto_158552 ) ( ON ?auto_158554 ?auto_158553 ) ( not ( = ?auto_158552 ?auto_158553 ) ) ( not ( = ?auto_158552 ?auto_158554 ) ) ( not ( = ?auto_158552 ?auto_158555 ) ) ( not ( = ?auto_158552 ?auto_158556 ) ) ( not ( = ?auto_158553 ?auto_158554 ) ) ( not ( = ?auto_158553 ?auto_158555 ) ) ( not ( = ?auto_158553 ?auto_158556 ) ) ( not ( = ?auto_158554 ?auto_158555 ) ) ( not ( = ?auto_158554 ?auto_158556 ) ) ( not ( = ?auto_158555 ?auto_158556 ) ) ( ON ?auto_158556 ?auto_158557 ) ( CLEAR ?auto_158556 ) ( not ( = ?auto_158552 ?auto_158557 ) ) ( not ( = ?auto_158553 ?auto_158557 ) ) ( not ( = ?auto_158554 ?auto_158557 ) ) ( not ( = ?auto_158555 ?auto_158557 ) ) ( not ( = ?auto_158556 ?auto_158557 ) ) ( HOLDING ?auto_158555 ) ( CLEAR ?auto_158554 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158552 ?auto_158553 ?auto_158554 ?auto_158555 )
      ( MAKE-5PILE ?auto_158552 ?auto_158553 ?auto_158554 ?auto_158555 ?auto_158556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158558 - BLOCK
      ?auto_158559 - BLOCK
      ?auto_158560 - BLOCK
      ?auto_158561 - BLOCK
      ?auto_158562 - BLOCK
    )
    :vars
    (
      ?auto_158563 - BLOCK
      ?auto_158565 - BLOCK
      ?auto_158566 - BLOCK
      ?auto_158564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158558 ) ( ON ?auto_158559 ?auto_158558 ) ( ON ?auto_158560 ?auto_158559 ) ( not ( = ?auto_158558 ?auto_158559 ) ) ( not ( = ?auto_158558 ?auto_158560 ) ) ( not ( = ?auto_158558 ?auto_158561 ) ) ( not ( = ?auto_158558 ?auto_158562 ) ) ( not ( = ?auto_158559 ?auto_158560 ) ) ( not ( = ?auto_158559 ?auto_158561 ) ) ( not ( = ?auto_158559 ?auto_158562 ) ) ( not ( = ?auto_158560 ?auto_158561 ) ) ( not ( = ?auto_158560 ?auto_158562 ) ) ( not ( = ?auto_158561 ?auto_158562 ) ) ( ON ?auto_158562 ?auto_158563 ) ( not ( = ?auto_158558 ?auto_158563 ) ) ( not ( = ?auto_158559 ?auto_158563 ) ) ( not ( = ?auto_158560 ?auto_158563 ) ) ( not ( = ?auto_158561 ?auto_158563 ) ) ( not ( = ?auto_158562 ?auto_158563 ) ) ( CLEAR ?auto_158560 ) ( ON ?auto_158561 ?auto_158562 ) ( CLEAR ?auto_158561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158565 ) ( ON ?auto_158566 ?auto_158565 ) ( ON ?auto_158564 ?auto_158566 ) ( ON ?auto_158563 ?auto_158564 ) ( not ( = ?auto_158565 ?auto_158566 ) ) ( not ( = ?auto_158565 ?auto_158564 ) ) ( not ( = ?auto_158565 ?auto_158563 ) ) ( not ( = ?auto_158565 ?auto_158562 ) ) ( not ( = ?auto_158565 ?auto_158561 ) ) ( not ( = ?auto_158566 ?auto_158564 ) ) ( not ( = ?auto_158566 ?auto_158563 ) ) ( not ( = ?auto_158566 ?auto_158562 ) ) ( not ( = ?auto_158566 ?auto_158561 ) ) ( not ( = ?auto_158564 ?auto_158563 ) ) ( not ( = ?auto_158564 ?auto_158562 ) ) ( not ( = ?auto_158564 ?auto_158561 ) ) ( not ( = ?auto_158558 ?auto_158565 ) ) ( not ( = ?auto_158558 ?auto_158566 ) ) ( not ( = ?auto_158558 ?auto_158564 ) ) ( not ( = ?auto_158559 ?auto_158565 ) ) ( not ( = ?auto_158559 ?auto_158566 ) ) ( not ( = ?auto_158559 ?auto_158564 ) ) ( not ( = ?auto_158560 ?auto_158565 ) ) ( not ( = ?auto_158560 ?auto_158566 ) ) ( not ( = ?auto_158560 ?auto_158564 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158565 ?auto_158566 ?auto_158564 ?auto_158563 ?auto_158562 )
      ( MAKE-5PILE ?auto_158558 ?auto_158559 ?auto_158560 ?auto_158561 ?auto_158562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158567 - BLOCK
      ?auto_158568 - BLOCK
      ?auto_158569 - BLOCK
      ?auto_158570 - BLOCK
      ?auto_158571 - BLOCK
    )
    :vars
    (
      ?auto_158575 - BLOCK
      ?auto_158574 - BLOCK
      ?auto_158572 - BLOCK
      ?auto_158573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158567 ) ( ON ?auto_158568 ?auto_158567 ) ( not ( = ?auto_158567 ?auto_158568 ) ) ( not ( = ?auto_158567 ?auto_158569 ) ) ( not ( = ?auto_158567 ?auto_158570 ) ) ( not ( = ?auto_158567 ?auto_158571 ) ) ( not ( = ?auto_158568 ?auto_158569 ) ) ( not ( = ?auto_158568 ?auto_158570 ) ) ( not ( = ?auto_158568 ?auto_158571 ) ) ( not ( = ?auto_158569 ?auto_158570 ) ) ( not ( = ?auto_158569 ?auto_158571 ) ) ( not ( = ?auto_158570 ?auto_158571 ) ) ( ON ?auto_158571 ?auto_158575 ) ( not ( = ?auto_158567 ?auto_158575 ) ) ( not ( = ?auto_158568 ?auto_158575 ) ) ( not ( = ?auto_158569 ?auto_158575 ) ) ( not ( = ?auto_158570 ?auto_158575 ) ) ( not ( = ?auto_158571 ?auto_158575 ) ) ( ON ?auto_158570 ?auto_158571 ) ( CLEAR ?auto_158570 ) ( ON-TABLE ?auto_158574 ) ( ON ?auto_158572 ?auto_158574 ) ( ON ?auto_158573 ?auto_158572 ) ( ON ?auto_158575 ?auto_158573 ) ( not ( = ?auto_158574 ?auto_158572 ) ) ( not ( = ?auto_158574 ?auto_158573 ) ) ( not ( = ?auto_158574 ?auto_158575 ) ) ( not ( = ?auto_158574 ?auto_158571 ) ) ( not ( = ?auto_158574 ?auto_158570 ) ) ( not ( = ?auto_158572 ?auto_158573 ) ) ( not ( = ?auto_158572 ?auto_158575 ) ) ( not ( = ?auto_158572 ?auto_158571 ) ) ( not ( = ?auto_158572 ?auto_158570 ) ) ( not ( = ?auto_158573 ?auto_158575 ) ) ( not ( = ?auto_158573 ?auto_158571 ) ) ( not ( = ?auto_158573 ?auto_158570 ) ) ( not ( = ?auto_158567 ?auto_158574 ) ) ( not ( = ?auto_158567 ?auto_158572 ) ) ( not ( = ?auto_158567 ?auto_158573 ) ) ( not ( = ?auto_158568 ?auto_158574 ) ) ( not ( = ?auto_158568 ?auto_158572 ) ) ( not ( = ?auto_158568 ?auto_158573 ) ) ( not ( = ?auto_158569 ?auto_158574 ) ) ( not ( = ?auto_158569 ?auto_158572 ) ) ( not ( = ?auto_158569 ?auto_158573 ) ) ( HOLDING ?auto_158569 ) ( CLEAR ?auto_158568 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158567 ?auto_158568 ?auto_158569 )
      ( MAKE-5PILE ?auto_158567 ?auto_158568 ?auto_158569 ?auto_158570 ?auto_158571 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158576 - BLOCK
      ?auto_158577 - BLOCK
      ?auto_158578 - BLOCK
      ?auto_158579 - BLOCK
      ?auto_158580 - BLOCK
    )
    :vars
    (
      ?auto_158582 - BLOCK
      ?auto_158583 - BLOCK
      ?auto_158581 - BLOCK
      ?auto_158584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158576 ) ( ON ?auto_158577 ?auto_158576 ) ( not ( = ?auto_158576 ?auto_158577 ) ) ( not ( = ?auto_158576 ?auto_158578 ) ) ( not ( = ?auto_158576 ?auto_158579 ) ) ( not ( = ?auto_158576 ?auto_158580 ) ) ( not ( = ?auto_158577 ?auto_158578 ) ) ( not ( = ?auto_158577 ?auto_158579 ) ) ( not ( = ?auto_158577 ?auto_158580 ) ) ( not ( = ?auto_158578 ?auto_158579 ) ) ( not ( = ?auto_158578 ?auto_158580 ) ) ( not ( = ?auto_158579 ?auto_158580 ) ) ( ON ?auto_158580 ?auto_158582 ) ( not ( = ?auto_158576 ?auto_158582 ) ) ( not ( = ?auto_158577 ?auto_158582 ) ) ( not ( = ?auto_158578 ?auto_158582 ) ) ( not ( = ?auto_158579 ?auto_158582 ) ) ( not ( = ?auto_158580 ?auto_158582 ) ) ( ON ?auto_158579 ?auto_158580 ) ( ON-TABLE ?auto_158583 ) ( ON ?auto_158581 ?auto_158583 ) ( ON ?auto_158584 ?auto_158581 ) ( ON ?auto_158582 ?auto_158584 ) ( not ( = ?auto_158583 ?auto_158581 ) ) ( not ( = ?auto_158583 ?auto_158584 ) ) ( not ( = ?auto_158583 ?auto_158582 ) ) ( not ( = ?auto_158583 ?auto_158580 ) ) ( not ( = ?auto_158583 ?auto_158579 ) ) ( not ( = ?auto_158581 ?auto_158584 ) ) ( not ( = ?auto_158581 ?auto_158582 ) ) ( not ( = ?auto_158581 ?auto_158580 ) ) ( not ( = ?auto_158581 ?auto_158579 ) ) ( not ( = ?auto_158584 ?auto_158582 ) ) ( not ( = ?auto_158584 ?auto_158580 ) ) ( not ( = ?auto_158584 ?auto_158579 ) ) ( not ( = ?auto_158576 ?auto_158583 ) ) ( not ( = ?auto_158576 ?auto_158581 ) ) ( not ( = ?auto_158576 ?auto_158584 ) ) ( not ( = ?auto_158577 ?auto_158583 ) ) ( not ( = ?auto_158577 ?auto_158581 ) ) ( not ( = ?auto_158577 ?auto_158584 ) ) ( not ( = ?auto_158578 ?auto_158583 ) ) ( not ( = ?auto_158578 ?auto_158581 ) ) ( not ( = ?auto_158578 ?auto_158584 ) ) ( CLEAR ?auto_158577 ) ( ON ?auto_158578 ?auto_158579 ) ( CLEAR ?auto_158578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158583 ?auto_158581 ?auto_158584 ?auto_158582 ?auto_158580 ?auto_158579 )
      ( MAKE-5PILE ?auto_158576 ?auto_158577 ?auto_158578 ?auto_158579 ?auto_158580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158585 - BLOCK
      ?auto_158586 - BLOCK
      ?auto_158587 - BLOCK
      ?auto_158588 - BLOCK
      ?auto_158589 - BLOCK
    )
    :vars
    (
      ?auto_158591 - BLOCK
      ?auto_158590 - BLOCK
      ?auto_158592 - BLOCK
      ?auto_158593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158585 ) ( not ( = ?auto_158585 ?auto_158586 ) ) ( not ( = ?auto_158585 ?auto_158587 ) ) ( not ( = ?auto_158585 ?auto_158588 ) ) ( not ( = ?auto_158585 ?auto_158589 ) ) ( not ( = ?auto_158586 ?auto_158587 ) ) ( not ( = ?auto_158586 ?auto_158588 ) ) ( not ( = ?auto_158586 ?auto_158589 ) ) ( not ( = ?auto_158587 ?auto_158588 ) ) ( not ( = ?auto_158587 ?auto_158589 ) ) ( not ( = ?auto_158588 ?auto_158589 ) ) ( ON ?auto_158589 ?auto_158591 ) ( not ( = ?auto_158585 ?auto_158591 ) ) ( not ( = ?auto_158586 ?auto_158591 ) ) ( not ( = ?auto_158587 ?auto_158591 ) ) ( not ( = ?auto_158588 ?auto_158591 ) ) ( not ( = ?auto_158589 ?auto_158591 ) ) ( ON ?auto_158588 ?auto_158589 ) ( ON-TABLE ?auto_158590 ) ( ON ?auto_158592 ?auto_158590 ) ( ON ?auto_158593 ?auto_158592 ) ( ON ?auto_158591 ?auto_158593 ) ( not ( = ?auto_158590 ?auto_158592 ) ) ( not ( = ?auto_158590 ?auto_158593 ) ) ( not ( = ?auto_158590 ?auto_158591 ) ) ( not ( = ?auto_158590 ?auto_158589 ) ) ( not ( = ?auto_158590 ?auto_158588 ) ) ( not ( = ?auto_158592 ?auto_158593 ) ) ( not ( = ?auto_158592 ?auto_158591 ) ) ( not ( = ?auto_158592 ?auto_158589 ) ) ( not ( = ?auto_158592 ?auto_158588 ) ) ( not ( = ?auto_158593 ?auto_158591 ) ) ( not ( = ?auto_158593 ?auto_158589 ) ) ( not ( = ?auto_158593 ?auto_158588 ) ) ( not ( = ?auto_158585 ?auto_158590 ) ) ( not ( = ?auto_158585 ?auto_158592 ) ) ( not ( = ?auto_158585 ?auto_158593 ) ) ( not ( = ?auto_158586 ?auto_158590 ) ) ( not ( = ?auto_158586 ?auto_158592 ) ) ( not ( = ?auto_158586 ?auto_158593 ) ) ( not ( = ?auto_158587 ?auto_158590 ) ) ( not ( = ?auto_158587 ?auto_158592 ) ) ( not ( = ?auto_158587 ?auto_158593 ) ) ( ON ?auto_158587 ?auto_158588 ) ( CLEAR ?auto_158587 ) ( HOLDING ?auto_158586 ) ( CLEAR ?auto_158585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158585 ?auto_158586 )
      ( MAKE-5PILE ?auto_158585 ?auto_158586 ?auto_158587 ?auto_158588 ?auto_158589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158594 - BLOCK
      ?auto_158595 - BLOCK
      ?auto_158596 - BLOCK
      ?auto_158597 - BLOCK
      ?auto_158598 - BLOCK
    )
    :vars
    (
      ?auto_158599 - BLOCK
      ?auto_158602 - BLOCK
      ?auto_158601 - BLOCK
      ?auto_158600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158594 ) ( not ( = ?auto_158594 ?auto_158595 ) ) ( not ( = ?auto_158594 ?auto_158596 ) ) ( not ( = ?auto_158594 ?auto_158597 ) ) ( not ( = ?auto_158594 ?auto_158598 ) ) ( not ( = ?auto_158595 ?auto_158596 ) ) ( not ( = ?auto_158595 ?auto_158597 ) ) ( not ( = ?auto_158595 ?auto_158598 ) ) ( not ( = ?auto_158596 ?auto_158597 ) ) ( not ( = ?auto_158596 ?auto_158598 ) ) ( not ( = ?auto_158597 ?auto_158598 ) ) ( ON ?auto_158598 ?auto_158599 ) ( not ( = ?auto_158594 ?auto_158599 ) ) ( not ( = ?auto_158595 ?auto_158599 ) ) ( not ( = ?auto_158596 ?auto_158599 ) ) ( not ( = ?auto_158597 ?auto_158599 ) ) ( not ( = ?auto_158598 ?auto_158599 ) ) ( ON ?auto_158597 ?auto_158598 ) ( ON-TABLE ?auto_158602 ) ( ON ?auto_158601 ?auto_158602 ) ( ON ?auto_158600 ?auto_158601 ) ( ON ?auto_158599 ?auto_158600 ) ( not ( = ?auto_158602 ?auto_158601 ) ) ( not ( = ?auto_158602 ?auto_158600 ) ) ( not ( = ?auto_158602 ?auto_158599 ) ) ( not ( = ?auto_158602 ?auto_158598 ) ) ( not ( = ?auto_158602 ?auto_158597 ) ) ( not ( = ?auto_158601 ?auto_158600 ) ) ( not ( = ?auto_158601 ?auto_158599 ) ) ( not ( = ?auto_158601 ?auto_158598 ) ) ( not ( = ?auto_158601 ?auto_158597 ) ) ( not ( = ?auto_158600 ?auto_158599 ) ) ( not ( = ?auto_158600 ?auto_158598 ) ) ( not ( = ?auto_158600 ?auto_158597 ) ) ( not ( = ?auto_158594 ?auto_158602 ) ) ( not ( = ?auto_158594 ?auto_158601 ) ) ( not ( = ?auto_158594 ?auto_158600 ) ) ( not ( = ?auto_158595 ?auto_158602 ) ) ( not ( = ?auto_158595 ?auto_158601 ) ) ( not ( = ?auto_158595 ?auto_158600 ) ) ( not ( = ?auto_158596 ?auto_158602 ) ) ( not ( = ?auto_158596 ?auto_158601 ) ) ( not ( = ?auto_158596 ?auto_158600 ) ) ( ON ?auto_158596 ?auto_158597 ) ( CLEAR ?auto_158594 ) ( ON ?auto_158595 ?auto_158596 ) ( CLEAR ?auto_158595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158602 ?auto_158601 ?auto_158600 ?auto_158599 ?auto_158598 ?auto_158597 ?auto_158596 )
      ( MAKE-5PILE ?auto_158594 ?auto_158595 ?auto_158596 ?auto_158597 ?auto_158598 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158603 - BLOCK
      ?auto_158604 - BLOCK
      ?auto_158605 - BLOCK
      ?auto_158606 - BLOCK
      ?auto_158607 - BLOCK
    )
    :vars
    (
      ?auto_158610 - BLOCK
      ?auto_158611 - BLOCK
      ?auto_158608 - BLOCK
      ?auto_158609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158603 ?auto_158604 ) ) ( not ( = ?auto_158603 ?auto_158605 ) ) ( not ( = ?auto_158603 ?auto_158606 ) ) ( not ( = ?auto_158603 ?auto_158607 ) ) ( not ( = ?auto_158604 ?auto_158605 ) ) ( not ( = ?auto_158604 ?auto_158606 ) ) ( not ( = ?auto_158604 ?auto_158607 ) ) ( not ( = ?auto_158605 ?auto_158606 ) ) ( not ( = ?auto_158605 ?auto_158607 ) ) ( not ( = ?auto_158606 ?auto_158607 ) ) ( ON ?auto_158607 ?auto_158610 ) ( not ( = ?auto_158603 ?auto_158610 ) ) ( not ( = ?auto_158604 ?auto_158610 ) ) ( not ( = ?auto_158605 ?auto_158610 ) ) ( not ( = ?auto_158606 ?auto_158610 ) ) ( not ( = ?auto_158607 ?auto_158610 ) ) ( ON ?auto_158606 ?auto_158607 ) ( ON-TABLE ?auto_158611 ) ( ON ?auto_158608 ?auto_158611 ) ( ON ?auto_158609 ?auto_158608 ) ( ON ?auto_158610 ?auto_158609 ) ( not ( = ?auto_158611 ?auto_158608 ) ) ( not ( = ?auto_158611 ?auto_158609 ) ) ( not ( = ?auto_158611 ?auto_158610 ) ) ( not ( = ?auto_158611 ?auto_158607 ) ) ( not ( = ?auto_158611 ?auto_158606 ) ) ( not ( = ?auto_158608 ?auto_158609 ) ) ( not ( = ?auto_158608 ?auto_158610 ) ) ( not ( = ?auto_158608 ?auto_158607 ) ) ( not ( = ?auto_158608 ?auto_158606 ) ) ( not ( = ?auto_158609 ?auto_158610 ) ) ( not ( = ?auto_158609 ?auto_158607 ) ) ( not ( = ?auto_158609 ?auto_158606 ) ) ( not ( = ?auto_158603 ?auto_158611 ) ) ( not ( = ?auto_158603 ?auto_158608 ) ) ( not ( = ?auto_158603 ?auto_158609 ) ) ( not ( = ?auto_158604 ?auto_158611 ) ) ( not ( = ?auto_158604 ?auto_158608 ) ) ( not ( = ?auto_158604 ?auto_158609 ) ) ( not ( = ?auto_158605 ?auto_158611 ) ) ( not ( = ?auto_158605 ?auto_158608 ) ) ( not ( = ?auto_158605 ?auto_158609 ) ) ( ON ?auto_158605 ?auto_158606 ) ( ON ?auto_158604 ?auto_158605 ) ( CLEAR ?auto_158604 ) ( HOLDING ?auto_158603 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158603 )
      ( MAKE-5PILE ?auto_158603 ?auto_158604 ?auto_158605 ?auto_158606 ?auto_158607 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_158612 - BLOCK
      ?auto_158613 - BLOCK
      ?auto_158614 - BLOCK
      ?auto_158615 - BLOCK
      ?auto_158616 - BLOCK
    )
    :vars
    (
      ?auto_158619 - BLOCK
      ?auto_158618 - BLOCK
      ?auto_158617 - BLOCK
      ?auto_158620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158612 ?auto_158613 ) ) ( not ( = ?auto_158612 ?auto_158614 ) ) ( not ( = ?auto_158612 ?auto_158615 ) ) ( not ( = ?auto_158612 ?auto_158616 ) ) ( not ( = ?auto_158613 ?auto_158614 ) ) ( not ( = ?auto_158613 ?auto_158615 ) ) ( not ( = ?auto_158613 ?auto_158616 ) ) ( not ( = ?auto_158614 ?auto_158615 ) ) ( not ( = ?auto_158614 ?auto_158616 ) ) ( not ( = ?auto_158615 ?auto_158616 ) ) ( ON ?auto_158616 ?auto_158619 ) ( not ( = ?auto_158612 ?auto_158619 ) ) ( not ( = ?auto_158613 ?auto_158619 ) ) ( not ( = ?auto_158614 ?auto_158619 ) ) ( not ( = ?auto_158615 ?auto_158619 ) ) ( not ( = ?auto_158616 ?auto_158619 ) ) ( ON ?auto_158615 ?auto_158616 ) ( ON-TABLE ?auto_158618 ) ( ON ?auto_158617 ?auto_158618 ) ( ON ?auto_158620 ?auto_158617 ) ( ON ?auto_158619 ?auto_158620 ) ( not ( = ?auto_158618 ?auto_158617 ) ) ( not ( = ?auto_158618 ?auto_158620 ) ) ( not ( = ?auto_158618 ?auto_158619 ) ) ( not ( = ?auto_158618 ?auto_158616 ) ) ( not ( = ?auto_158618 ?auto_158615 ) ) ( not ( = ?auto_158617 ?auto_158620 ) ) ( not ( = ?auto_158617 ?auto_158619 ) ) ( not ( = ?auto_158617 ?auto_158616 ) ) ( not ( = ?auto_158617 ?auto_158615 ) ) ( not ( = ?auto_158620 ?auto_158619 ) ) ( not ( = ?auto_158620 ?auto_158616 ) ) ( not ( = ?auto_158620 ?auto_158615 ) ) ( not ( = ?auto_158612 ?auto_158618 ) ) ( not ( = ?auto_158612 ?auto_158617 ) ) ( not ( = ?auto_158612 ?auto_158620 ) ) ( not ( = ?auto_158613 ?auto_158618 ) ) ( not ( = ?auto_158613 ?auto_158617 ) ) ( not ( = ?auto_158613 ?auto_158620 ) ) ( not ( = ?auto_158614 ?auto_158618 ) ) ( not ( = ?auto_158614 ?auto_158617 ) ) ( not ( = ?auto_158614 ?auto_158620 ) ) ( ON ?auto_158614 ?auto_158615 ) ( ON ?auto_158613 ?auto_158614 ) ( ON ?auto_158612 ?auto_158613 ) ( CLEAR ?auto_158612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158618 ?auto_158617 ?auto_158620 ?auto_158619 ?auto_158616 ?auto_158615 ?auto_158614 ?auto_158613 )
      ( MAKE-5PILE ?auto_158612 ?auto_158613 ?auto_158614 ?auto_158615 ?auto_158616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158624 - BLOCK
      ?auto_158625 - BLOCK
      ?auto_158626 - BLOCK
    )
    :vars
    (
      ?auto_158627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158627 ?auto_158626 ) ( CLEAR ?auto_158627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158624 ) ( ON ?auto_158625 ?auto_158624 ) ( ON ?auto_158626 ?auto_158625 ) ( not ( = ?auto_158624 ?auto_158625 ) ) ( not ( = ?auto_158624 ?auto_158626 ) ) ( not ( = ?auto_158624 ?auto_158627 ) ) ( not ( = ?auto_158625 ?auto_158626 ) ) ( not ( = ?auto_158625 ?auto_158627 ) ) ( not ( = ?auto_158626 ?auto_158627 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158627 ?auto_158626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158628 - BLOCK
      ?auto_158629 - BLOCK
      ?auto_158630 - BLOCK
    )
    :vars
    (
      ?auto_158631 - BLOCK
      ?auto_158632 - BLOCK
      ?auto_158633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158631 ?auto_158630 ) ( CLEAR ?auto_158631 ) ( ON-TABLE ?auto_158628 ) ( ON ?auto_158629 ?auto_158628 ) ( ON ?auto_158630 ?auto_158629 ) ( not ( = ?auto_158628 ?auto_158629 ) ) ( not ( = ?auto_158628 ?auto_158630 ) ) ( not ( = ?auto_158628 ?auto_158631 ) ) ( not ( = ?auto_158629 ?auto_158630 ) ) ( not ( = ?auto_158629 ?auto_158631 ) ) ( not ( = ?auto_158630 ?auto_158631 ) ) ( HOLDING ?auto_158632 ) ( CLEAR ?auto_158633 ) ( not ( = ?auto_158628 ?auto_158632 ) ) ( not ( = ?auto_158628 ?auto_158633 ) ) ( not ( = ?auto_158629 ?auto_158632 ) ) ( not ( = ?auto_158629 ?auto_158633 ) ) ( not ( = ?auto_158630 ?auto_158632 ) ) ( not ( = ?auto_158630 ?auto_158633 ) ) ( not ( = ?auto_158631 ?auto_158632 ) ) ( not ( = ?auto_158631 ?auto_158633 ) ) ( not ( = ?auto_158632 ?auto_158633 ) ) )
    :subtasks
    ( ( !STACK ?auto_158632 ?auto_158633 )
      ( MAKE-3PILE ?auto_158628 ?auto_158629 ?auto_158630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158634 - BLOCK
      ?auto_158635 - BLOCK
      ?auto_158636 - BLOCK
    )
    :vars
    (
      ?auto_158637 - BLOCK
      ?auto_158639 - BLOCK
      ?auto_158638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158637 ?auto_158636 ) ( ON-TABLE ?auto_158634 ) ( ON ?auto_158635 ?auto_158634 ) ( ON ?auto_158636 ?auto_158635 ) ( not ( = ?auto_158634 ?auto_158635 ) ) ( not ( = ?auto_158634 ?auto_158636 ) ) ( not ( = ?auto_158634 ?auto_158637 ) ) ( not ( = ?auto_158635 ?auto_158636 ) ) ( not ( = ?auto_158635 ?auto_158637 ) ) ( not ( = ?auto_158636 ?auto_158637 ) ) ( CLEAR ?auto_158639 ) ( not ( = ?auto_158634 ?auto_158638 ) ) ( not ( = ?auto_158634 ?auto_158639 ) ) ( not ( = ?auto_158635 ?auto_158638 ) ) ( not ( = ?auto_158635 ?auto_158639 ) ) ( not ( = ?auto_158636 ?auto_158638 ) ) ( not ( = ?auto_158636 ?auto_158639 ) ) ( not ( = ?auto_158637 ?auto_158638 ) ) ( not ( = ?auto_158637 ?auto_158639 ) ) ( not ( = ?auto_158638 ?auto_158639 ) ) ( ON ?auto_158638 ?auto_158637 ) ( CLEAR ?auto_158638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158634 ?auto_158635 ?auto_158636 ?auto_158637 )
      ( MAKE-3PILE ?auto_158634 ?auto_158635 ?auto_158636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158640 - BLOCK
      ?auto_158641 - BLOCK
      ?auto_158642 - BLOCK
    )
    :vars
    (
      ?auto_158645 - BLOCK
      ?auto_158644 - BLOCK
      ?auto_158643 - BLOCK
      ?auto_158648 - BLOCK
      ?auto_158647 - BLOCK
      ?auto_158646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158645 ?auto_158642 ) ( ON-TABLE ?auto_158640 ) ( ON ?auto_158641 ?auto_158640 ) ( ON ?auto_158642 ?auto_158641 ) ( not ( = ?auto_158640 ?auto_158641 ) ) ( not ( = ?auto_158640 ?auto_158642 ) ) ( not ( = ?auto_158640 ?auto_158645 ) ) ( not ( = ?auto_158641 ?auto_158642 ) ) ( not ( = ?auto_158641 ?auto_158645 ) ) ( not ( = ?auto_158642 ?auto_158645 ) ) ( not ( = ?auto_158640 ?auto_158644 ) ) ( not ( = ?auto_158640 ?auto_158643 ) ) ( not ( = ?auto_158641 ?auto_158644 ) ) ( not ( = ?auto_158641 ?auto_158643 ) ) ( not ( = ?auto_158642 ?auto_158644 ) ) ( not ( = ?auto_158642 ?auto_158643 ) ) ( not ( = ?auto_158645 ?auto_158644 ) ) ( not ( = ?auto_158645 ?auto_158643 ) ) ( not ( = ?auto_158644 ?auto_158643 ) ) ( ON ?auto_158644 ?auto_158645 ) ( CLEAR ?auto_158644 ) ( HOLDING ?auto_158643 ) ( CLEAR ?auto_158648 ) ( ON-TABLE ?auto_158647 ) ( ON ?auto_158646 ?auto_158647 ) ( ON ?auto_158648 ?auto_158646 ) ( not ( = ?auto_158647 ?auto_158646 ) ) ( not ( = ?auto_158647 ?auto_158648 ) ) ( not ( = ?auto_158647 ?auto_158643 ) ) ( not ( = ?auto_158646 ?auto_158648 ) ) ( not ( = ?auto_158646 ?auto_158643 ) ) ( not ( = ?auto_158648 ?auto_158643 ) ) ( not ( = ?auto_158640 ?auto_158648 ) ) ( not ( = ?auto_158640 ?auto_158647 ) ) ( not ( = ?auto_158640 ?auto_158646 ) ) ( not ( = ?auto_158641 ?auto_158648 ) ) ( not ( = ?auto_158641 ?auto_158647 ) ) ( not ( = ?auto_158641 ?auto_158646 ) ) ( not ( = ?auto_158642 ?auto_158648 ) ) ( not ( = ?auto_158642 ?auto_158647 ) ) ( not ( = ?auto_158642 ?auto_158646 ) ) ( not ( = ?auto_158645 ?auto_158648 ) ) ( not ( = ?auto_158645 ?auto_158647 ) ) ( not ( = ?auto_158645 ?auto_158646 ) ) ( not ( = ?auto_158644 ?auto_158648 ) ) ( not ( = ?auto_158644 ?auto_158647 ) ) ( not ( = ?auto_158644 ?auto_158646 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158647 ?auto_158646 ?auto_158648 ?auto_158643 )
      ( MAKE-3PILE ?auto_158640 ?auto_158641 ?auto_158642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158649 - BLOCK
      ?auto_158650 - BLOCK
      ?auto_158651 - BLOCK
    )
    :vars
    (
      ?auto_158652 - BLOCK
      ?auto_158653 - BLOCK
      ?auto_158656 - BLOCK
      ?auto_158655 - BLOCK
      ?auto_158654 - BLOCK
      ?auto_158657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158652 ?auto_158651 ) ( ON-TABLE ?auto_158649 ) ( ON ?auto_158650 ?auto_158649 ) ( ON ?auto_158651 ?auto_158650 ) ( not ( = ?auto_158649 ?auto_158650 ) ) ( not ( = ?auto_158649 ?auto_158651 ) ) ( not ( = ?auto_158649 ?auto_158652 ) ) ( not ( = ?auto_158650 ?auto_158651 ) ) ( not ( = ?auto_158650 ?auto_158652 ) ) ( not ( = ?auto_158651 ?auto_158652 ) ) ( not ( = ?auto_158649 ?auto_158653 ) ) ( not ( = ?auto_158649 ?auto_158656 ) ) ( not ( = ?auto_158650 ?auto_158653 ) ) ( not ( = ?auto_158650 ?auto_158656 ) ) ( not ( = ?auto_158651 ?auto_158653 ) ) ( not ( = ?auto_158651 ?auto_158656 ) ) ( not ( = ?auto_158652 ?auto_158653 ) ) ( not ( = ?auto_158652 ?auto_158656 ) ) ( not ( = ?auto_158653 ?auto_158656 ) ) ( ON ?auto_158653 ?auto_158652 ) ( CLEAR ?auto_158655 ) ( ON-TABLE ?auto_158654 ) ( ON ?auto_158657 ?auto_158654 ) ( ON ?auto_158655 ?auto_158657 ) ( not ( = ?auto_158654 ?auto_158657 ) ) ( not ( = ?auto_158654 ?auto_158655 ) ) ( not ( = ?auto_158654 ?auto_158656 ) ) ( not ( = ?auto_158657 ?auto_158655 ) ) ( not ( = ?auto_158657 ?auto_158656 ) ) ( not ( = ?auto_158655 ?auto_158656 ) ) ( not ( = ?auto_158649 ?auto_158655 ) ) ( not ( = ?auto_158649 ?auto_158654 ) ) ( not ( = ?auto_158649 ?auto_158657 ) ) ( not ( = ?auto_158650 ?auto_158655 ) ) ( not ( = ?auto_158650 ?auto_158654 ) ) ( not ( = ?auto_158650 ?auto_158657 ) ) ( not ( = ?auto_158651 ?auto_158655 ) ) ( not ( = ?auto_158651 ?auto_158654 ) ) ( not ( = ?auto_158651 ?auto_158657 ) ) ( not ( = ?auto_158652 ?auto_158655 ) ) ( not ( = ?auto_158652 ?auto_158654 ) ) ( not ( = ?auto_158652 ?auto_158657 ) ) ( not ( = ?auto_158653 ?auto_158655 ) ) ( not ( = ?auto_158653 ?auto_158654 ) ) ( not ( = ?auto_158653 ?auto_158657 ) ) ( ON ?auto_158656 ?auto_158653 ) ( CLEAR ?auto_158656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158649 ?auto_158650 ?auto_158651 ?auto_158652 ?auto_158653 )
      ( MAKE-3PILE ?auto_158649 ?auto_158650 ?auto_158651 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158658 - BLOCK
      ?auto_158659 - BLOCK
      ?auto_158660 - BLOCK
    )
    :vars
    (
      ?auto_158662 - BLOCK
      ?auto_158661 - BLOCK
      ?auto_158666 - BLOCK
      ?auto_158664 - BLOCK
      ?auto_158663 - BLOCK
      ?auto_158665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158662 ?auto_158660 ) ( ON-TABLE ?auto_158658 ) ( ON ?auto_158659 ?auto_158658 ) ( ON ?auto_158660 ?auto_158659 ) ( not ( = ?auto_158658 ?auto_158659 ) ) ( not ( = ?auto_158658 ?auto_158660 ) ) ( not ( = ?auto_158658 ?auto_158662 ) ) ( not ( = ?auto_158659 ?auto_158660 ) ) ( not ( = ?auto_158659 ?auto_158662 ) ) ( not ( = ?auto_158660 ?auto_158662 ) ) ( not ( = ?auto_158658 ?auto_158661 ) ) ( not ( = ?auto_158658 ?auto_158666 ) ) ( not ( = ?auto_158659 ?auto_158661 ) ) ( not ( = ?auto_158659 ?auto_158666 ) ) ( not ( = ?auto_158660 ?auto_158661 ) ) ( not ( = ?auto_158660 ?auto_158666 ) ) ( not ( = ?auto_158662 ?auto_158661 ) ) ( not ( = ?auto_158662 ?auto_158666 ) ) ( not ( = ?auto_158661 ?auto_158666 ) ) ( ON ?auto_158661 ?auto_158662 ) ( ON-TABLE ?auto_158664 ) ( ON ?auto_158663 ?auto_158664 ) ( not ( = ?auto_158664 ?auto_158663 ) ) ( not ( = ?auto_158664 ?auto_158665 ) ) ( not ( = ?auto_158664 ?auto_158666 ) ) ( not ( = ?auto_158663 ?auto_158665 ) ) ( not ( = ?auto_158663 ?auto_158666 ) ) ( not ( = ?auto_158665 ?auto_158666 ) ) ( not ( = ?auto_158658 ?auto_158665 ) ) ( not ( = ?auto_158658 ?auto_158664 ) ) ( not ( = ?auto_158658 ?auto_158663 ) ) ( not ( = ?auto_158659 ?auto_158665 ) ) ( not ( = ?auto_158659 ?auto_158664 ) ) ( not ( = ?auto_158659 ?auto_158663 ) ) ( not ( = ?auto_158660 ?auto_158665 ) ) ( not ( = ?auto_158660 ?auto_158664 ) ) ( not ( = ?auto_158660 ?auto_158663 ) ) ( not ( = ?auto_158662 ?auto_158665 ) ) ( not ( = ?auto_158662 ?auto_158664 ) ) ( not ( = ?auto_158662 ?auto_158663 ) ) ( not ( = ?auto_158661 ?auto_158665 ) ) ( not ( = ?auto_158661 ?auto_158664 ) ) ( not ( = ?auto_158661 ?auto_158663 ) ) ( ON ?auto_158666 ?auto_158661 ) ( CLEAR ?auto_158666 ) ( HOLDING ?auto_158665 ) ( CLEAR ?auto_158663 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158664 ?auto_158663 ?auto_158665 )
      ( MAKE-3PILE ?auto_158658 ?auto_158659 ?auto_158660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158667 - BLOCK
      ?auto_158668 - BLOCK
      ?auto_158669 - BLOCK
    )
    :vars
    (
      ?auto_158675 - BLOCK
      ?auto_158674 - BLOCK
      ?auto_158672 - BLOCK
      ?auto_158671 - BLOCK
      ?auto_158673 - BLOCK
      ?auto_158670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158675 ?auto_158669 ) ( ON-TABLE ?auto_158667 ) ( ON ?auto_158668 ?auto_158667 ) ( ON ?auto_158669 ?auto_158668 ) ( not ( = ?auto_158667 ?auto_158668 ) ) ( not ( = ?auto_158667 ?auto_158669 ) ) ( not ( = ?auto_158667 ?auto_158675 ) ) ( not ( = ?auto_158668 ?auto_158669 ) ) ( not ( = ?auto_158668 ?auto_158675 ) ) ( not ( = ?auto_158669 ?auto_158675 ) ) ( not ( = ?auto_158667 ?auto_158674 ) ) ( not ( = ?auto_158667 ?auto_158672 ) ) ( not ( = ?auto_158668 ?auto_158674 ) ) ( not ( = ?auto_158668 ?auto_158672 ) ) ( not ( = ?auto_158669 ?auto_158674 ) ) ( not ( = ?auto_158669 ?auto_158672 ) ) ( not ( = ?auto_158675 ?auto_158674 ) ) ( not ( = ?auto_158675 ?auto_158672 ) ) ( not ( = ?auto_158674 ?auto_158672 ) ) ( ON ?auto_158674 ?auto_158675 ) ( ON-TABLE ?auto_158671 ) ( ON ?auto_158673 ?auto_158671 ) ( not ( = ?auto_158671 ?auto_158673 ) ) ( not ( = ?auto_158671 ?auto_158670 ) ) ( not ( = ?auto_158671 ?auto_158672 ) ) ( not ( = ?auto_158673 ?auto_158670 ) ) ( not ( = ?auto_158673 ?auto_158672 ) ) ( not ( = ?auto_158670 ?auto_158672 ) ) ( not ( = ?auto_158667 ?auto_158670 ) ) ( not ( = ?auto_158667 ?auto_158671 ) ) ( not ( = ?auto_158667 ?auto_158673 ) ) ( not ( = ?auto_158668 ?auto_158670 ) ) ( not ( = ?auto_158668 ?auto_158671 ) ) ( not ( = ?auto_158668 ?auto_158673 ) ) ( not ( = ?auto_158669 ?auto_158670 ) ) ( not ( = ?auto_158669 ?auto_158671 ) ) ( not ( = ?auto_158669 ?auto_158673 ) ) ( not ( = ?auto_158675 ?auto_158670 ) ) ( not ( = ?auto_158675 ?auto_158671 ) ) ( not ( = ?auto_158675 ?auto_158673 ) ) ( not ( = ?auto_158674 ?auto_158670 ) ) ( not ( = ?auto_158674 ?auto_158671 ) ) ( not ( = ?auto_158674 ?auto_158673 ) ) ( ON ?auto_158672 ?auto_158674 ) ( CLEAR ?auto_158673 ) ( ON ?auto_158670 ?auto_158672 ) ( CLEAR ?auto_158670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158667 ?auto_158668 ?auto_158669 ?auto_158675 ?auto_158674 ?auto_158672 )
      ( MAKE-3PILE ?auto_158667 ?auto_158668 ?auto_158669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158676 - BLOCK
      ?auto_158677 - BLOCK
      ?auto_158678 - BLOCK
    )
    :vars
    (
      ?auto_158680 - BLOCK
      ?auto_158679 - BLOCK
      ?auto_158681 - BLOCK
      ?auto_158684 - BLOCK
      ?auto_158682 - BLOCK
      ?auto_158683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158680 ?auto_158678 ) ( ON-TABLE ?auto_158676 ) ( ON ?auto_158677 ?auto_158676 ) ( ON ?auto_158678 ?auto_158677 ) ( not ( = ?auto_158676 ?auto_158677 ) ) ( not ( = ?auto_158676 ?auto_158678 ) ) ( not ( = ?auto_158676 ?auto_158680 ) ) ( not ( = ?auto_158677 ?auto_158678 ) ) ( not ( = ?auto_158677 ?auto_158680 ) ) ( not ( = ?auto_158678 ?auto_158680 ) ) ( not ( = ?auto_158676 ?auto_158679 ) ) ( not ( = ?auto_158676 ?auto_158681 ) ) ( not ( = ?auto_158677 ?auto_158679 ) ) ( not ( = ?auto_158677 ?auto_158681 ) ) ( not ( = ?auto_158678 ?auto_158679 ) ) ( not ( = ?auto_158678 ?auto_158681 ) ) ( not ( = ?auto_158680 ?auto_158679 ) ) ( not ( = ?auto_158680 ?auto_158681 ) ) ( not ( = ?auto_158679 ?auto_158681 ) ) ( ON ?auto_158679 ?auto_158680 ) ( ON-TABLE ?auto_158684 ) ( not ( = ?auto_158684 ?auto_158682 ) ) ( not ( = ?auto_158684 ?auto_158683 ) ) ( not ( = ?auto_158684 ?auto_158681 ) ) ( not ( = ?auto_158682 ?auto_158683 ) ) ( not ( = ?auto_158682 ?auto_158681 ) ) ( not ( = ?auto_158683 ?auto_158681 ) ) ( not ( = ?auto_158676 ?auto_158683 ) ) ( not ( = ?auto_158676 ?auto_158684 ) ) ( not ( = ?auto_158676 ?auto_158682 ) ) ( not ( = ?auto_158677 ?auto_158683 ) ) ( not ( = ?auto_158677 ?auto_158684 ) ) ( not ( = ?auto_158677 ?auto_158682 ) ) ( not ( = ?auto_158678 ?auto_158683 ) ) ( not ( = ?auto_158678 ?auto_158684 ) ) ( not ( = ?auto_158678 ?auto_158682 ) ) ( not ( = ?auto_158680 ?auto_158683 ) ) ( not ( = ?auto_158680 ?auto_158684 ) ) ( not ( = ?auto_158680 ?auto_158682 ) ) ( not ( = ?auto_158679 ?auto_158683 ) ) ( not ( = ?auto_158679 ?auto_158684 ) ) ( not ( = ?auto_158679 ?auto_158682 ) ) ( ON ?auto_158681 ?auto_158679 ) ( ON ?auto_158683 ?auto_158681 ) ( CLEAR ?auto_158683 ) ( HOLDING ?auto_158682 ) ( CLEAR ?auto_158684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158684 ?auto_158682 )
      ( MAKE-3PILE ?auto_158676 ?auto_158677 ?auto_158678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158685 - BLOCK
      ?auto_158686 - BLOCK
      ?auto_158687 - BLOCK
    )
    :vars
    (
      ?auto_158693 - BLOCK
      ?auto_158691 - BLOCK
      ?auto_158690 - BLOCK
      ?auto_158688 - BLOCK
      ?auto_158689 - BLOCK
      ?auto_158692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158693 ?auto_158687 ) ( ON-TABLE ?auto_158685 ) ( ON ?auto_158686 ?auto_158685 ) ( ON ?auto_158687 ?auto_158686 ) ( not ( = ?auto_158685 ?auto_158686 ) ) ( not ( = ?auto_158685 ?auto_158687 ) ) ( not ( = ?auto_158685 ?auto_158693 ) ) ( not ( = ?auto_158686 ?auto_158687 ) ) ( not ( = ?auto_158686 ?auto_158693 ) ) ( not ( = ?auto_158687 ?auto_158693 ) ) ( not ( = ?auto_158685 ?auto_158691 ) ) ( not ( = ?auto_158685 ?auto_158690 ) ) ( not ( = ?auto_158686 ?auto_158691 ) ) ( not ( = ?auto_158686 ?auto_158690 ) ) ( not ( = ?auto_158687 ?auto_158691 ) ) ( not ( = ?auto_158687 ?auto_158690 ) ) ( not ( = ?auto_158693 ?auto_158691 ) ) ( not ( = ?auto_158693 ?auto_158690 ) ) ( not ( = ?auto_158691 ?auto_158690 ) ) ( ON ?auto_158691 ?auto_158693 ) ( ON-TABLE ?auto_158688 ) ( not ( = ?auto_158688 ?auto_158689 ) ) ( not ( = ?auto_158688 ?auto_158692 ) ) ( not ( = ?auto_158688 ?auto_158690 ) ) ( not ( = ?auto_158689 ?auto_158692 ) ) ( not ( = ?auto_158689 ?auto_158690 ) ) ( not ( = ?auto_158692 ?auto_158690 ) ) ( not ( = ?auto_158685 ?auto_158692 ) ) ( not ( = ?auto_158685 ?auto_158688 ) ) ( not ( = ?auto_158685 ?auto_158689 ) ) ( not ( = ?auto_158686 ?auto_158692 ) ) ( not ( = ?auto_158686 ?auto_158688 ) ) ( not ( = ?auto_158686 ?auto_158689 ) ) ( not ( = ?auto_158687 ?auto_158692 ) ) ( not ( = ?auto_158687 ?auto_158688 ) ) ( not ( = ?auto_158687 ?auto_158689 ) ) ( not ( = ?auto_158693 ?auto_158692 ) ) ( not ( = ?auto_158693 ?auto_158688 ) ) ( not ( = ?auto_158693 ?auto_158689 ) ) ( not ( = ?auto_158691 ?auto_158692 ) ) ( not ( = ?auto_158691 ?auto_158688 ) ) ( not ( = ?auto_158691 ?auto_158689 ) ) ( ON ?auto_158690 ?auto_158691 ) ( ON ?auto_158692 ?auto_158690 ) ( CLEAR ?auto_158688 ) ( ON ?auto_158689 ?auto_158692 ) ( CLEAR ?auto_158689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158685 ?auto_158686 ?auto_158687 ?auto_158693 ?auto_158691 ?auto_158690 ?auto_158692 )
      ( MAKE-3PILE ?auto_158685 ?auto_158686 ?auto_158687 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158694 - BLOCK
      ?auto_158695 - BLOCK
      ?auto_158696 - BLOCK
    )
    :vars
    (
      ?auto_158702 - BLOCK
      ?auto_158697 - BLOCK
      ?auto_158701 - BLOCK
      ?auto_158700 - BLOCK
      ?auto_158699 - BLOCK
      ?auto_158698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158702 ?auto_158696 ) ( ON-TABLE ?auto_158694 ) ( ON ?auto_158695 ?auto_158694 ) ( ON ?auto_158696 ?auto_158695 ) ( not ( = ?auto_158694 ?auto_158695 ) ) ( not ( = ?auto_158694 ?auto_158696 ) ) ( not ( = ?auto_158694 ?auto_158702 ) ) ( not ( = ?auto_158695 ?auto_158696 ) ) ( not ( = ?auto_158695 ?auto_158702 ) ) ( not ( = ?auto_158696 ?auto_158702 ) ) ( not ( = ?auto_158694 ?auto_158697 ) ) ( not ( = ?auto_158694 ?auto_158701 ) ) ( not ( = ?auto_158695 ?auto_158697 ) ) ( not ( = ?auto_158695 ?auto_158701 ) ) ( not ( = ?auto_158696 ?auto_158697 ) ) ( not ( = ?auto_158696 ?auto_158701 ) ) ( not ( = ?auto_158702 ?auto_158697 ) ) ( not ( = ?auto_158702 ?auto_158701 ) ) ( not ( = ?auto_158697 ?auto_158701 ) ) ( ON ?auto_158697 ?auto_158702 ) ( not ( = ?auto_158700 ?auto_158699 ) ) ( not ( = ?auto_158700 ?auto_158698 ) ) ( not ( = ?auto_158700 ?auto_158701 ) ) ( not ( = ?auto_158699 ?auto_158698 ) ) ( not ( = ?auto_158699 ?auto_158701 ) ) ( not ( = ?auto_158698 ?auto_158701 ) ) ( not ( = ?auto_158694 ?auto_158698 ) ) ( not ( = ?auto_158694 ?auto_158700 ) ) ( not ( = ?auto_158694 ?auto_158699 ) ) ( not ( = ?auto_158695 ?auto_158698 ) ) ( not ( = ?auto_158695 ?auto_158700 ) ) ( not ( = ?auto_158695 ?auto_158699 ) ) ( not ( = ?auto_158696 ?auto_158698 ) ) ( not ( = ?auto_158696 ?auto_158700 ) ) ( not ( = ?auto_158696 ?auto_158699 ) ) ( not ( = ?auto_158702 ?auto_158698 ) ) ( not ( = ?auto_158702 ?auto_158700 ) ) ( not ( = ?auto_158702 ?auto_158699 ) ) ( not ( = ?auto_158697 ?auto_158698 ) ) ( not ( = ?auto_158697 ?auto_158700 ) ) ( not ( = ?auto_158697 ?auto_158699 ) ) ( ON ?auto_158701 ?auto_158697 ) ( ON ?auto_158698 ?auto_158701 ) ( ON ?auto_158699 ?auto_158698 ) ( CLEAR ?auto_158699 ) ( HOLDING ?auto_158700 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158700 )
      ( MAKE-3PILE ?auto_158694 ?auto_158695 ?auto_158696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_158703 - BLOCK
      ?auto_158704 - BLOCK
      ?auto_158705 - BLOCK
    )
    :vars
    (
      ?auto_158710 - BLOCK
      ?auto_158711 - BLOCK
      ?auto_158708 - BLOCK
      ?auto_158709 - BLOCK
      ?auto_158706 - BLOCK
      ?auto_158707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158710 ?auto_158705 ) ( ON-TABLE ?auto_158703 ) ( ON ?auto_158704 ?auto_158703 ) ( ON ?auto_158705 ?auto_158704 ) ( not ( = ?auto_158703 ?auto_158704 ) ) ( not ( = ?auto_158703 ?auto_158705 ) ) ( not ( = ?auto_158703 ?auto_158710 ) ) ( not ( = ?auto_158704 ?auto_158705 ) ) ( not ( = ?auto_158704 ?auto_158710 ) ) ( not ( = ?auto_158705 ?auto_158710 ) ) ( not ( = ?auto_158703 ?auto_158711 ) ) ( not ( = ?auto_158703 ?auto_158708 ) ) ( not ( = ?auto_158704 ?auto_158711 ) ) ( not ( = ?auto_158704 ?auto_158708 ) ) ( not ( = ?auto_158705 ?auto_158711 ) ) ( not ( = ?auto_158705 ?auto_158708 ) ) ( not ( = ?auto_158710 ?auto_158711 ) ) ( not ( = ?auto_158710 ?auto_158708 ) ) ( not ( = ?auto_158711 ?auto_158708 ) ) ( ON ?auto_158711 ?auto_158710 ) ( not ( = ?auto_158709 ?auto_158706 ) ) ( not ( = ?auto_158709 ?auto_158707 ) ) ( not ( = ?auto_158709 ?auto_158708 ) ) ( not ( = ?auto_158706 ?auto_158707 ) ) ( not ( = ?auto_158706 ?auto_158708 ) ) ( not ( = ?auto_158707 ?auto_158708 ) ) ( not ( = ?auto_158703 ?auto_158707 ) ) ( not ( = ?auto_158703 ?auto_158709 ) ) ( not ( = ?auto_158703 ?auto_158706 ) ) ( not ( = ?auto_158704 ?auto_158707 ) ) ( not ( = ?auto_158704 ?auto_158709 ) ) ( not ( = ?auto_158704 ?auto_158706 ) ) ( not ( = ?auto_158705 ?auto_158707 ) ) ( not ( = ?auto_158705 ?auto_158709 ) ) ( not ( = ?auto_158705 ?auto_158706 ) ) ( not ( = ?auto_158710 ?auto_158707 ) ) ( not ( = ?auto_158710 ?auto_158709 ) ) ( not ( = ?auto_158710 ?auto_158706 ) ) ( not ( = ?auto_158711 ?auto_158707 ) ) ( not ( = ?auto_158711 ?auto_158709 ) ) ( not ( = ?auto_158711 ?auto_158706 ) ) ( ON ?auto_158708 ?auto_158711 ) ( ON ?auto_158707 ?auto_158708 ) ( ON ?auto_158706 ?auto_158707 ) ( ON ?auto_158709 ?auto_158706 ) ( CLEAR ?auto_158709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158703 ?auto_158704 ?auto_158705 ?auto_158710 ?auto_158711 ?auto_158708 ?auto_158707 ?auto_158706 )
      ( MAKE-3PILE ?auto_158703 ?auto_158704 ?auto_158705 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158718 - BLOCK
      ?auto_158719 - BLOCK
      ?auto_158720 - BLOCK
      ?auto_158721 - BLOCK
      ?auto_158722 - BLOCK
      ?auto_158723 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158723 ) ( CLEAR ?auto_158722 ) ( ON-TABLE ?auto_158718 ) ( ON ?auto_158719 ?auto_158718 ) ( ON ?auto_158720 ?auto_158719 ) ( ON ?auto_158721 ?auto_158720 ) ( ON ?auto_158722 ?auto_158721 ) ( not ( = ?auto_158718 ?auto_158719 ) ) ( not ( = ?auto_158718 ?auto_158720 ) ) ( not ( = ?auto_158718 ?auto_158721 ) ) ( not ( = ?auto_158718 ?auto_158722 ) ) ( not ( = ?auto_158718 ?auto_158723 ) ) ( not ( = ?auto_158719 ?auto_158720 ) ) ( not ( = ?auto_158719 ?auto_158721 ) ) ( not ( = ?auto_158719 ?auto_158722 ) ) ( not ( = ?auto_158719 ?auto_158723 ) ) ( not ( = ?auto_158720 ?auto_158721 ) ) ( not ( = ?auto_158720 ?auto_158722 ) ) ( not ( = ?auto_158720 ?auto_158723 ) ) ( not ( = ?auto_158721 ?auto_158722 ) ) ( not ( = ?auto_158721 ?auto_158723 ) ) ( not ( = ?auto_158722 ?auto_158723 ) ) )
    :subtasks
    ( ( !STACK ?auto_158723 ?auto_158722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158724 - BLOCK
      ?auto_158725 - BLOCK
      ?auto_158726 - BLOCK
      ?auto_158727 - BLOCK
      ?auto_158728 - BLOCK
      ?auto_158729 - BLOCK
    )
    :vars
    (
      ?auto_158730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158728 ) ( ON-TABLE ?auto_158724 ) ( ON ?auto_158725 ?auto_158724 ) ( ON ?auto_158726 ?auto_158725 ) ( ON ?auto_158727 ?auto_158726 ) ( ON ?auto_158728 ?auto_158727 ) ( not ( = ?auto_158724 ?auto_158725 ) ) ( not ( = ?auto_158724 ?auto_158726 ) ) ( not ( = ?auto_158724 ?auto_158727 ) ) ( not ( = ?auto_158724 ?auto_158728 ) ) ( not ( = ?auto_158724 ?auto_158729 ) ) ( not ( = ?auto_158725 ?auto_158726 ) ) ( not ( = ?auto_158725 ?auto_158727 ) ) ( not ( = ?auto_158725 ?auto_158728 ) ) ( not ( = ?auto_158725 ?auto_158729 ) ) ( not ( = ?auto_158726 ?auto_158727 ) ) ( not ( = ?auto_158726 ?auto_158728 ) ) ( not ( = ?auto_158726 ?auto_158729 ) ) ( not ( = ?auto_158727 ?auto_158728 ) ) ( not ( = ?auto_158727 ?auto_158729 ) ) ( not ( = ?auto_158728 ?auto_158729 ) ) ( ON ?auto_158729 ?auto_158730 ) ( CLEAR ?auto_158729 ) ( HAND-EMPTY ) ( not ( = ?auto_158724 ?auto_158730 ) ) ( not ( = ?auto_158725 ?auto_158730 ) ) ( not ( = ?auto_158726 ?auto_158730 ) ) ( not ( = ?auto_158727 ?auto_158730 ) ) ( not ( = ?auto_158728 ?auto_158730 ) ) ( not ( = ?auto_158729 ?auto_158730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158729 ?auto_158730 )
      ( MAKE-6PILE ?auto_158724 ?auto_158725 ?auto_158726 ?auto_158727 ?auto_158728 ?auto_158729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158731 - BLOCK
      ?auto_158732 - BLOCK
      ?auto_158733 - BLOCK
      ?auto_158734 - BLOCK
      ?auto_158735 - BLOCK
      ?auto_158736 - BLOCK
    )
    :vars
    (
      ?auto_158737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158731 ) ( ON ?auto_158732 ?auto_158731 ) ( ON ?auto_158733 ?auto_158732 ) ( ON ?auto_158734 ?auto_158733 ) ( not ( = ?auto_158731 ?auto_158732 ) ) ( not ( = ?auto_158731 ?auto_158733 ) ) ( not ( = ?auto_158731 ?auto_158734 ) ) ( not ( = ?auto_158731 ?auto_158735 ) ) ( not ( = ?auto_158731 ?auto_158736 ) ) ( not ( = ?auto_158732 ?auto_158733 ) ) ( not ( = ?auto_158732 ?auto_158734 ) ) ( not ( = ?auto_158732 ?auto_158735 ) ) ( not ( = ?auto_158732 ?auto_158736 ) ) ( not ( = ?auto_158733 ?auto_158734 ) ) ( not ( = ?auto_158733 ?auto_158735 ) ) ( not ( = ?auto_158733 ?auto_158736 ) ) ( not ( = ?auto_158734 ?auto_158735 ) ) ( not ( = ?auto_158734 ?auto_158736 ) ) ( not ( = ?auto_158735 ?auto_158736 ) ) ( ON ?auto_158736 ?auto_158737 ) ( CLEAR ?auto_158736 ) ( not ( = ?auto_158731 ?auto_158737 ) ) ( not ( = ?auto_158732 ?auto_158737 ) ) ( not ( = ?auto_158733 ?auto_158737 ) ) ( not ( = ?auto_158734 ?auto_158737 ) ) ( not ( = ?auto_158735 ?auto_158737 ) ) ( not ( = ?auto_158736 ?auto_158737 ) ) ( HOLDING ?auto_158735 ) ( CLEAR ?auto_158734 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158731 ?auto_158732 ?auto_158733 ?auto_158734 ?auto_158735 )
      ( MAKE-6PILE ?auto_158731 ?auto_158732 ?auto_158733 ?auto_158734 ?auto_158735 ?auto_158736 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158738 - BLOCK
      ?auto_158739 - BLOCK
      ?auto_158740 - BLOCK
      ?auto_158741 - BLOCK
      ?auto_158742 - BLOCK
      ?auto_158743 - BLOCK
    )
    :vars
    (
      ?auto_158744 - BLOCK
      ?auto_158745 - BLOCK
      ?auto_158746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158738 ) ( ON ?auto_158739 ?auto_158738 ) ( ON ?auto_158740 ?auto_158739 ) ( ON ?auto_158741 ?auto_158740 ) ( not ( = ?auto_158738 ?auto_158739 ) ) ( not ( = ?auto_158738 ?auto_158740 ) ) ( not ( = ?auto_158738 ?auto_158741 ) ) ( not ( = ?auto_158738 ?auto_158742 ) ) ( not ( = ?auto_158738 ?auto_158743 ) ) ( not ( = ?auto_158739 ?auto_158740 ) ) ( not ( = ?auto_158739 ?auto_158741 ) ) ( not ( = ?auto_158739 ?auto_158742 ) ) ( not ( = ?auto_158739 ?auto_158743 ) ) ( not ( = ?auto_158740 ?auto_158741 ) ) ( not ( = ?auto_158740 ?auto_158742 ) ) ( not ( = ?auto_158740 ?auto_158743 ) ) ( not ( = ?auto_158741 ?auto_158742 ) ) ( not ( = ?auto_158741 ?auto_158743 ) ) ( not ( = ?auto_158742 ?auto_158743 ) ) ( ON ?auto_158743 ?auto_158744 ) ( not ( = ?auto_158738 ?auto_158744 ) ) ( not ( = ?auto_158739 ?auto_158744 ) ) ( not ( = ?auto_158740 ?auto_158744 ) ) ( not ( = ?auto_158741 ?auto_158744 ) ) ( not ( = ?auto_158742 ?auto_158744 ) ) ( not ( = ?auto_158743 ?auto_158744 ) ) ( CLEAR ?auto_158741 ) ( ON ?auto_158742 ?auto_158743 ) ( CLEAR ?auto_158742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158745 ) ( ON ?auto_158746 ?auto_158745 ) ( ON ?auto_158744 ?auto_158746 ) ( not ( = ?auto_158745 ?auto_158746 ) ) ( not ( = ?auto_158745 ?auto_158744 ) ) ( not ( = ?auto_158745 ?auto_158743 ) ) ( not ( = ?auto_158745 ?auto_158742 ) ) ( not ( = ?auto_158746 ?auto_158744 ) ) ( not ( = ?auto_158746 ?auto_158743 ) ) ( not ( = ?auto_158746 ?auto_158742 ) ) ( not ( = ?auto_158738 ?auto_158745 ) ) ( not ( = ?auto_158738 ?auto_158746 ) ) ( not ( = ?auto_158739 ?auto_158745 ) ) ( not ( = ?auto_158739 ?auto_158746 ) ) ( not ( = ?auto_158740 ?auto_158745 ) ) ( not ( = ?auto_158740 ?auto_158746 ) ) ( not ( = ?auto_158741 ?auto_158745 ) ) ( not ( = ?auto_158741 ?auto_158746 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158745 ?auto_158746 ?auto_158744 ?auto_158743 )
      ( MAKE-6PILE ?auto_158738 ?auto_158739 ?auto_158740 ?auto_158741 ?auto_158742 ?auto_158743 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158747 - BLOCK
      ?auto_158748 - BLOCK
      ?auto_158749 - BLOCK
      ?auto_158750 - BLOCK
      ?auto_158751 - BLOCK
      ?auto_158752 - BLOCK
    )
    :vars
    (
      ?auto_158754 - BLOCK
      ?auto_158753 - BLOCK
      ?auto_158755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158747 ) ( ON ?auto_158748 ?auto_158747 ) ( ON ?auto_158749 ?auto_158748 ) ( not ( = ?auto_158747 ?auto_158748 ) ) ( not ( = ?auto_158747 ?auto_158749 ) ) ( not ( = ?auto_158747 ?auto_158750 ) ) ( not ( = ?auto_158747 ?auto_158751 ) ) ( not ( = ?auto_158747 ?auto_158752 ) ) ( not ( = ?auto_158748 ?auto_158749 ) ) ( not ( = ?auto_158748 ?auto_158750 ) ) ( not ( = ?auto_158748 ?auto_158751 ) ) ( not ( = ?auto_158748 ?auto_158752 ) ) ( not ( = ?auto_158749 ?auto_158750 ) ) ( not ( = ?auto_158749 ?auto_158751 ) ) ( not ( = ?auto_158749 ?auto_158752 ) ) ( not ( = ?auto_158750 ?auto_158751 ) ) ( not ( = ?auto_158750 ?auto_158752 ) ) ( not ( = ?auto_158751 ?auto_158752 ) ) ( ON ?auto_158752 ?auto_158754 ) ( not ( = ?auto_158747 ?auto_158754 ) ) ( not ( = ?auto_158748 ?auto_158754 ) ) ( not ( = ?auto_158749 ?auto_158754 ) ) ( not ( = ?auto_158750 ?auto_158754 ) ) ( not ( = ?auto_158751 ?auto_158754 ) ) ( not ( = ?auto_158752 ?auto_158754 ) ) ( ON ?auto_158751 ?auto_158752 ) ( CLEAR ?auto_158751 ) ( ON-TABLE ?auto_158753 ) ( ON ?auto_158755 ?auto_158753 ) ( ON ?auto_158754 ?auto_158755 ) ( not ( = ?auto_158753 ?auto_158755 ) ) ( not ( = ?auto_158753 ?auto_158754 ) ) ( not ( = ?auto_158753 ?auto_158752 ) ) ( not ( = ?auto_158753 ?auto_158751 ) ) ( not ( = ?auto_158755 ?auto_158754 ) ) ( not ( = ?auto_158755 ?auto_158752 ) ) ( not ( = ?auto_158755 ?auto_158751 ) ) ( not ( = ?auto_158747 ?auto_158753 ) ) ( not ( = ?auto_158747 ?auto_158755 ) ) ( not ( = ?auto_158748 ?auto_158753 ) ) ( not ( = ?auto_158748 ?auto_158755 ) ) ( not ( = ?auto_158749 ?auto_158753 ) ) ( not ( = ?auto_158749 ?auto_158755 ) ) ( not ( = ?auto_158750 ?auto_158753 ) ) ( not ( = ?auto_158750 ?auto_158755 ) ) ( HOLDING ?auto_158750 ) ( CLEAR ?auto_158749 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158747 ?auto_158748 ?auto_158749 ?auto_158750 )
      ( MAKE-6PILE ?auto_158747 ?auto_158748 ?auto_158749 ?auto_158750 ?auto_158751 ?auto_158752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158756 - BLOCK
      ?auto_158757 - BLOCK
      ?auto_158758 - BLOCK
      ?auto_158759 - BLOCK
      ?auto_158760 - BLOCK
      ?auto_158761 - BLOCK
    )
    :vars
    (
      ?auto_158763 - BLOCK
      ?auto_158762 - BLOCK
      ?auto_158764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158756 ) ( ON ?auto_158757 ?auto_158756 ) ( ON ?auto_158758 ?auto_158757 ) ( not ( = ?auto_158756 ?auto_158757 ) ) ( not ( = ?auto_158756 ?auto_158758 ) ) ( not ( = ?auto_158756 ?auto_158759 ) ) ( not ( = ?auto_158756 ?auto_158760 ) ) ( not ( = ?auto_158756 ?auto_158761 ) ) ( not ( = ?auto_158757 ?auto_158758 ) ) ( not ( = ?auto_158757 ?auto_158759 ) ) ( not ( = ?auto_158757 ?auto_158760 ) ) ( not ( = ?auto_158757 ?auto_158761 ) ) ( not ( = ?auto_158758 ?auto_158759 ) ) ( not ( = ?auto_158758 ?auto_158760 ) ) ( not ( = ?auto_158758 ?auto_158761 ) ) ( not ( = ?auto_158759 ?auto_158760 ) ) ( not ( = ?auto_158759 ?auto_158761 ) ) ( not ( = ?auto_158760 ?auto_158761 ) ) ( ON ?auto_158761 ?auto_158763 ) ( not ( = ?auto_158756 ?auto_158763 ) ) ( not ( = ?auto_158757 ?auto_158763 ) ) ( not ( = ?auto_158758 ?auto_158763 ) ) ( not ( = ?auto_158759 ?auto_158763 ) ) ( not ( = ?auto_158760 ?auto_158763 ) ) ( not ( = ?auto_158761 ?auto_158763 ) ) ( ON ?auto_158760 ?auto_158761 ) ( ON-TABLE ?auto_158762 ) ( ON ?auto_158764 ?auto_158762 ) ( ON ?auto_158763 ?auto_158764 ) ( not ( = ?auto_158762 ?auto_158764 ) ) ( not ( = ?auto_158762 ?auto_158763 ) ) ( not ( = ?auto_158762 ?auto_158761 ) ) ( not ( = ?auto_158762 ?auto_158760 ) ) ( not ( = ?auto_158764 ?auto_158763 ) ) ( not ( = ?auto_158764 ?auto_158761 ) ) ( not ( = ?auto_158764 ?auto_158760 ) ) ( not ( = ?auto_158756 ?auto_158762 ) ) ( not ( = ?auto_158756 ?auto_158764 ) ) ( not ( = ?auto_158757 ?auto_158762 ) ) ( not ( = ?auto_158757 ?auto_158764 ) ) ( not ( = ?auto_158758 ?auto_158762 ) ) ( not ( = ?auto_158758 ?auto_158764 ) ) ( not ( = ?auto_158759 ?auto_158762 ) ) ( not ( = ?auto_158759 ?auto_158764 ) ) ( CLEAR ?auto_158758 ) ( ON ?auto_158759 ?auto_158760 ) ( CLEAR ?auto_158759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158762 ?auto_158764 ?auto_158763 ?auto_158761 ?auto_158760 )
      ( MAKE-6PILE ?auto_158756 ?auto_158757 ?auto_158758 ?auto_158759 ?auto_158760 ?auto_158761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158765 - BLOCK
      ?auto_158766 - BLOCK
      ?auto_158767 - BLOCK
      ?auto_158768 - BLOCK
      ?auto_158769 - BLOCK
      ?auto_158770 - BLOCK
    )
    :vars
    (
      ?auto_158773 - BLOCK
      ?auto_158771 - BLOCK
      ?auto_158772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158765 ) ( ON ?auto_158766 ?auto_158765 ) ( not ( = ?auto_158765 ?auto_158766 ) ) ( not ( = ?auto_158765 ?auto_158767 ) ) ( not ( = ?auto_158765 ?auto_158768 ) ) ( not ( = ?auto_158765 ?auto_158769 ) ) ( not ( = ?auto_158765 ?auto_158770 ) ) ( not ( = ?auto_158766 ?auto_158767 ) ) ( not ( = ?auto_158766 ?auto_158768 ) ) ( not ( = ?auto_158766 ?auto_158769 ) ) ( not ( = ?auto_158766 ?auto_158770 ) ) ( not ( = ?auto_158767 ?auto_158768 ) ) ( not ( = ?auto_158767 ?auto_158769 ) ) ( not ( = ?auto_158767 ?auto_158770 ) ) ( not ( = ?auto_158768 ?auto_158769 ) ) ( not ( = ?auto_158768 ?auto_158770 ) ) ( not ( = ?auto_158769 ?auto_158770 ) ) ( ON ?auto_158770 ?auto_158773 ) ( not ( = ?auto_158765 ?auto_158773 ) ) ( not ( = ?auto_158766 ?auto_158773 ) ) ( not ( = ?auto_158767 ?auto_158773 ) ) ( not ( = ?auto_158768 ?auto_158773 ) ) ( not ( = ?auto_158769 ?auto_158773 ) ) ( not ( = ?auto_158770 ?auto_158773 ) ) ( ON ?auto_158769 ?auto_158770 ) ( ON-TABLE ?auto_158771 ) ( ON ?auto_158772 ?auto_158771 ) ( ON ?auto_158773 ?auto_158772 ) ( not ( = ?auto_158771 ?auto_158772 ) ) ( not ( = ?auto_158771 ?auto_158773 ) ) ( not ( = ?auto_158771 ?auto_158770 ) ) ( not ( = ?auto_158771 ?auto_158769 ) ) ( not ( = ?auto_158772 ?auto_158773 ) ) ( not ( = ?auto_158772 ?auto_158770 ) ) ( not ( = ?auto_158772 ?auto_158769 ) ) ( not ( = ?auto_158765 ?auto_158771 ) ) ( not ( = ?auto_158765 ?auto_158772 ) ) ( not ( = ?auto_158766 ?auto_158771 ) ) ( not ( = ?auto_158766 ?auto_158772 ) ) ( not ( = ?auto_158767 ?auto_158771 ) ) ( not ( = ?auto_158767 ?auto_158772 ) ) ( not ( = ?auto_158768 ?auto_158771 ) ) ( not ( = ?auto_158768 ?auto_158772 ) ) ( ON ?auto_158768 ?auto_158769 ) ( CLEAR ?auto_158768 ) ( HOLDING ?auto_158767 ) ( CLEAR ?auto_158766 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158765 ?auto_158766 ?auto_158767 )
      ( MAKE-6PILE ?auto_158765 ?auto_158766 ?auto_158767 ?auto_158768 ?auto_158769 ?auto_158770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158774 - BLOCK
      ?auto_158775 - BLOCK
      ?auto_158776 - BLOCK
      ?auto_158777 - BLOCK
      ?auto_158778 - BLOCK
      ?auto_158779 - BLOCK
    )
    :vars
    (
      ?auto_158781 - BLOCK
      ?auto_158780 - BLOCK
      ?auto_158782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158774 ) ( ON ?auto_158775 ?auto_158774 ) ( not ( = ?auto_158774 ?auto_158775 ) ) ( not ( = ?auto_158774 ?auto_158776 ) ) ( not ( = ?auto_158774 ?auto_158777 ) ) ( not ( = ?auto_158774 ?auto_158778 ) ) ( not ( = ?auto_158774 ?auto_158779 ) ) ( not ( = ?auto_158775 ?auto_158776 ) ) ( not ( = ?auto_158775 ?auto_158777 ) ) ( not ( = ?auto_158775 ?auto_158778 ) ) ( not ( = ?auto_158775 ?auto_158779 ) ) ( not ( = ?auto_158776 ?auto_158777 ) ) ( not ( = ?auto_158776 ?auto_158778 ) ) ( not ( = ?auto_158776 ?auto_158779 ) ) ( not ( = ?auto_158777 ?auto_158778 ) ) ( not ( = ?auto_158777 ?auto_158779 ) ) ( not ( = ?auto_158778 ?auto_158779 ) ) ( ON ?auto_158779 ?auto_158781 ) ( not ( = ?auto_158774 ?auto_158781 ) ) ( not ( = ?auto_158775 ?auto_158781 ) ) ( not ( = ?auto_158776 ?auto_158781 ) ) ( not ( = ?auto_158777 ?auto_158781 ) ) ( not ( = ?auto_158778 ?auto_158781 ) ) ( not ( = ?auto_158779 ?auto_158781 ) ) ( ON ?auto_158778 ?auto_158779 ) ( ON-TABLE ?auto_158780 ) ( ON ?auto_158782 ?auto_158780 ) ( ON ?auto_158781 ?auto_158782 ) ( not ( = ?auto_158780 ?auto_158782 ) ) ( not ( = ?auto_158780 ?auto_158781 ) ) ( not ( = ?auto_158780 ?auto_158779 ) ) ( not ( = ?auto_158780 ?auto_158778 ) ) ( not ( = ?auto_158782 ?auto_158781 ) ) ( not ( = ?auto_158782 ?auto_158779 ) ) ( not ( = ?auto_158782 ?auto_158778 ) ) ( not ( = ?auto_158774 ?auto_158780 ) ) ( not ( = ?auto_158774 ?auto_158782 ) ) ( not ( = ?auto_158775 ?auto_158780 ) ) ( not ( = ?auto_158775 ?auto_158782 ) ) ( not ( = ?auto_158776 ?auto_158780 ) ) ( not ( = ?auto_158776 ?auto_158782 ) ) ( not ( = ?auto_158777 ?auto_158780 ) ) ( not ( = ?auto_158777 ?auto_158782 ) ) ( ON ?auto_158777 ?auto_158778 ) ( CLEAR ?auto_158775 ) ( ON ?auto_158776 ?auto_158777 ) ( CLEAR ?auto_158776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158780 ?auto_158782 ?auto_158781 ?auto_158779 ?auto_158778 ?auto_158777 )
      ( MAKE-6PILE ?auto_158774 ?auto_158775 ?auto_158776 ?auto_158777 ?auto_158778 ?auto_158779 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158783 - BLOCK
      ?auto_158784 - BLOCK
      ?auto_158785 - BLOCK
      ?auto_158786 - BLOCK
      ?auto_158787 - BLOCK
      ?auto_158788 - BLOCK
    )
    :vars
    (
      ?auto_158791 - BLOCK
      ?auto_158790 - BLOCK
      ?auto_158789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158783 ) ( not ( = ?auto_158783 ?auto_158784 ) ) ( not ( = ?auto_158783 ?auto_158785 ) ) ( not ( = ?auto_158783 ?auto_158786 ) ) ( not ( = ?auto_158783 ?auto_158787 ) ) ( not ( = ?auto_158783 ?auto_158788 ) ) ( not ( = ?auto_158784 ?auto_158785 ) ) ( not ( = ?auto_158784 ?auto_158786 ) ) ( not ( = ?auto_158784 ?auto_158787 ) ) ( not ( = ?auto_158784 ?auto_158788 ) ) ( not ( = ?auto_158785 ?auto_158786 ) ) ( not ( = ?auto_158785 ?auto_158787 ) ) ( not ( = ?auto_158785 ?auto_158788 ) ) ( not ( = ?auto_158786 ?auto_158787 ) ) ( not ( = ?auto_158786 ?auto_158788 ) ) ( not ( = ?auto_158787 ?auto_158788 ) ) ( ON ?auto_158788 ?auto_158791 ) ( not ( = ?auto_158783 ?auto_158791 ) ) ( not ( = ?auto_158784 ?auto_158791 ) ) ( not ( = ?auto_158785 ?auto_158791 ) ) ( not ( = ?auto_158786 ?auto_158791 ) ) ( not ( = ?auto_158787 ?auto_158791 ) ) ( not ( = ?auto_158788 ?auto_158791 ) ) ( ON ?auto_158787 ?auto_158788 ) ( ON-TABLE ?auto_158790 ) ( ON ?auto_158789 ?auto_158790 ) ( ON ?auto_158791 ?auto_158789 ) ( not ( = ?auto_158790 ?auto_158789 ) ) ( not ( = ?auto_158790 ?auto_158791 ) ) ( not ( = ?auto_158790 ?auto_158788 ) ) ( not ( = ?auto_158790 ?auto_158787 ) ) ( not ( = ?auto_158789 ?auto_158791 ) ) ( not ( = ?auto_158789 ?auto_158788 ) ) ( not ( = ?auto_158789 ?auto_158787 ) ) ( not ( = ?auto_158783 ?auto_158790 ) ) ( not ( = ?auto_158783 ?auto_158789 ) ) ( not ( = ?auto_158784 ?auto_158790 ) ) ( not ( = ?auto_158784 ?auto_158789 ) ) ( not ( = ?auto_158785 ?auto_158790 ) ) ( not ( = ?auto_158785 ?auto_158789 ) ) ( not ( = ?auto_158786 ?auto_158790 ) ) ( not ( = ?auto_158786 ?auto_158789 ) ) ( ON ?auto_158786 ?auto_158787 ) ( ON ?auto_158785 ?auto_158786 ) ( CLEAR ?auto_158785 ) ( HOLDING ?auto_158784 ) ( CLEAR ?auto_158783 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158783 ?auto_158784 )
      ( MAKE-6PILE ?auto_158783 ?auto_158784 ?auto_158785 ?auto_158786 ?auto_158787 ?auto_158788 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158792 - BLOCK
      ?auto_158793 - BLOCK
      ?auto_158794 - BLOCK
      ?auto_158795 - BLOCK
      ?auto_158796 - BLOCK
      ?auto_158797 - BLOCK
    )
    :vars
    (
      ?auto_158799 - BLOCK
      ?auto_158800 - BLOCK
      ?auto_158798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158792 ) ( not ( = ?auto_158792 ?auto_158793 ) ) ( not ( = ?auto_158792 ?auto_158794 ) ) ( not ( = ?auto_158792 ?auto_158795 ) ) ( not ( = ?auto_158792 ?auto_158796 ) ) ( not ( = ?auto_158792 ?auto_158797 ) ) ( not ( = ?auto_158793 ?auto_158794 ) ) ( not ( = ?auto_158793 ?auto_158795 ) ) ( not ( = ?auto_158793 ?auto_158796 ) ) ( not ( = ?auto_158793 ?auto_158797 ) ) ( not ( = ?auto_158794 ?auto_158795 ) ) ( not ( = ?auto_158794 ?auto_158796 ) ) ( not ( = ?auto_158794 ?auto_158797 ) ) ( not ( = ?auto_158795 ?auto_158796 ) ) ( not ( = ?auto_158795 ?auto_158797 ) ) ( not ( = ?auto_158796 ?auto_158797 ) ) ( ON ?auto_158797 ?auto_158799 ) ( not ( = ?auto_158792 ?auto_158799 ) ) ( not ( = ?auto_158793 ?auto_158799 ) ) ( not ( = ?auto_158794 ?auto_158799 ) ) ( not ( = ?auto_158795 ?auto_158799 ) ) ( not ( = ?auto_158796 ?auto_158799 ) ) ( not ( = ?auto_158797 ?auto_158799 ) ) ( ON ?auto_158796 ?auto_158797 ) ( ON-TABLE ?auto_158800 ) ( ON ?auto_158798 ?auto_158800 ) ( ON ?auto_158799 ?auto_158798 ) ( not ( = ?auto_158800 ?auto_158798 ) ) ( not ( = ?auto_158800 ?auto_158799 ) ) ( not ( = ?auto_158800 ?auto_158797 ) ) ( not ( = ?auto_158800 ?auto_158796 ) ) ( not ( = ?auto_158798 ?auto_158799 ) ) ( not ( = ?auto_158798 ?auto_158797 ) ) ( not ( = ?auto_158798 ?auto_158796 ) ) ( not ( = ?auto_158792 ?auto_158800 ) ) ( not ( = ?auto_158792 ?auto_158798 ) ) ( not ( = ?auto_158793 ?auto_158800 ) ) ( not ( = ?auto_158793 ?auto_158798 ) ) ( not ( = ?auto_158794 ?auto_158800 ) ) ( not ( = ?auto_158794 ?auto_158798 ) ) ( not ( = ?auto_158795 ?auto_158800 ) ) ( not ( = ?auto_158795 ?auto_158798 ) ) ( ON ?auto_158795 ?auto_158796 ) ( ON ?auto_158794 ?auto_158795 ) ( CLEAR ?auto_158792 ) ( ON ?auto_158793 ?auto_158794 ) ( CLEAR ?auto_158793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158800 ?auto_158798 ?auto_158799 ?auto_158797 ?auto_158796 ?auto_158795 ?auto_158794 )
      ( MAKE-6PILE ?auto_158792 ?auto_158793 ?auto_158794 ?auto_158795 ?auto_158796 ?auto_158797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158801 - BLOCK
      ?auto_158802 - BLOCK
      ?auto_158803 - BLOCK
      ?auto_158804 - BLOCK
      ?auto_158805 - BLOCK
      ?auto_158806 - BLOCK
    )
    :vars
    (
      ?auto_158807 - BLOCK
      ?auto_158809 - BLOCK
      ?auto_158808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158801 ?auto_158802 ) ) ( not ( = ?auto_158801 ?auto_158803 ) ) ( not ( = ?auto_158801 ?auto_158804 ) ) ( not ( = ?auto_158801 ?auto_158805 ) ) ( not ( = ?auto_158801 ?auto_158806 ) ) ( not ( = ?auto_158802 ?auto_158803 ) ) ( not ( = ?auto_158802 ?auto_158804 ) ) ( not ( = ?auto_158802 ?auto_158805 ) ) ( not ( = ?auto_158802 ?auto_158806 ) ) ( not ( = ?auto_158803 ?auto_158804 ) ) ( not ( = ?auto_158803 ?auto_158805 ) ) ( not ( = ?auto_158803 ?auto_158806 ) ) ( not ( = ?auto_158804 ?auto_158805 ) ) ( not ( = ?auto_158804 ?auto_158806 ) ) ( not ( = ?auto_158805 ?auto_158806 ) ) ( ON ?auto_158806 ?auto_158807 ) ( not ( = ?auto_158801 ?auto_158807 ) ) ( not ( = ?auto_158802 ?auto_158807 ) ) ( not ( = ?auto_158803 ?auto_158807 ) ) ( not ( = ?auto_158804 ?auto_158807 ) ) ( not ( = ?auto_158805 ?auto_158807 ) ) ( not ( = ?auto_158806 ?auto_158807 ) ) ( ON ?auto_158805 ?auto_158806 ) ( ON-TABLE ?auto_158809 ) ( ON ?auto_158808 ?auto_158809 ) ( ON ?auto_158807 ?auto_158808 ) ( not ( = ?auto_158809 ?auto_158808 ) ) ( not ( = ?auto_158809 ?auto_158807 ) ) ( not ( = ?auto_158809 ?auto_158806 ) ) ( not ( = ?auto_158809 ?auto_158805 ) ) ( not ( = ?auto_158808 ?auto_158807 ) ) ( not ( = ?auto_158808 ?auto_158806 ) ) ( not ( = ?auto_158808 ?auto_158805 ) ) ( not ( = ?auto_158801 ?auto_158809 ) ) ( not ( = ?auto_158801 ?auto_158808 ) ) ( not ( = ?auto_158802 ?auto_158809 ) ) ( not ( = ?auto_158802 ?auto_158808 ) ) ( not ( = ?auto_158803 ?auto_158809 ) ) ( not ( = ?auto_158803 ?auto_158808 ) ) ( not ( = ?auto_158804 ?auto_158809 ) ) ( not ( = ?auto_158804 ?auto_158808 ) ) ( ON ?auto_158804 ?auto_158805 ) ( ON ?auto_158803 ?auto_158804 ) ( ON ?auto_158802 ?auto_158803 ) ( CLEAR ?auto_158802 ) ( HOLDING ?auto_158801 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158801 )
      ( MAKE-6PILE ?auto_158801 ?auto_158802 ?auto_158803 ?auto_158804 ?auto_158805 ?auto_158806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_158810 - BLOCK
      ?auto_158811 - BLOCK
      ?auto_158812 - BLOCK
      ?auto_158813 - BLOCK
      ?auto_158814 - BLOCK
      ?auto_158815 - BLOCK
    )
    :vars
    (
      ?auto_158817 - BLOCK
      ?auto_158816 - BLOCK
      ?auto_158818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_158810 ?auto_158811 ) ) ( not ( = ?auto_158810 ?auto_158812 ) ) ( not ( = ?auto_158810 ?auto_158813 ) ) ( not ( = ?auto_158810 ?auto_158814 ) ) ( not ( = ?auto_158810 ?auto_158815 ) ) ( not ( = ?auto_158811 ?auto_158812 ) ) ( not ( = ?auto_158811 ?auto_158813 ) ) ( not ( = ?auto_158811 ?auto_158814 ) ) ( not ( = ?auto_158811 ?auto_158815 ) ) ( not ( = ?auto_158812 ?auto_158813 ) ) ( not ( = ?auto_158812 ?auto_158814 ) ) ( not ( = ?auto_158812 ?auto_158815 ) ) ( not ( = ?auto_158813 ?auto_158814 ) ) ( not ( = ?auto_158813 ?auto_158815 ) ) ( not ( = ?auto_158814 ?auto_158815 ) ) ( ON ?auto_158815 ?auto_158817 ) ( not ( = ?auto_158810 ?auto_158817 ) ) ( not ( = ?auto_158811 ?auto_158817 ) ) ( not ( = ?auto_158812 ?auto_158817 ) ) ( not ( = ?auto_158813 ?auto_158817 ) ) ( not ( = ?auto_158814 ?auto_158817 ) ) ( not ( = ?auto_158815 ?auto_158817 ) ) ( ON ?auto_158814 ?auto_158815 ) ( ON-TABLE ?auto_158816 ) ( ON ?auto_158818 ?auto_158816 ) ( ON ?auto_158817 ?auto_158818 ) ( not ( = ?auto_158816 ?auto_158818 ) ) ( not ( = ?auto_158816 ?auto_158817 ) ) ( not ( = ?auto_158816 ?auto_158815 ) ) ( not ( = ?auto_158816 ?auto_158814 ) ) ( not ( = ?auto_158818 ?auto_158817 ) ) ( not ( = ?auto_158818 ?auto_158815 ) ) ( not ( = ?auto_158818 ?auto_158814 ) ) ( not ( = ?auto_158810 ?auto_158816 ) ) ( not ( = ?auto_158810 ?auto_158818 ) ) ( not ( = ?auto_158811 ?auto_158816 ) ) ( not ( = ?auto_158811 ?auto_158818 ) ) ( not ( = ?auto_158812 ?auto_158816 ) ) ( not ( = ?auto_158812 ?auto_158818 ) ) ( not ( = ?auto_158813 ?auto_158816 ) ) ( not ( = ?auto_158813 ?auto_158818 ) ) ( ON ?auto_158813 ?auto_158814 ) ( ON ?auto_158812 ?auto_158813 ) ( ON ?auto_158811 ?auto_158812 ) ( ON ?auto_158810 ?auto_158811 ) ( CLEAR ?auto_158810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158816 ?auto_158818 ?auto_158817 ?auto_158815 ?auto_158814 ?auto_158813 ?auto_158812 ?auto_158811 )
      ( MAKE-6PILE ?auto_158810 ?auto_158811 ?auto_158812 ?auto_158813 ?auto_158814 ?auto_158815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158821 - BLOCK
      ?auto_158822 - BLOCK
    )
    :vars
    (
      ?auto_158823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158823 ?auto_158822 ) ( CLEAR ?auto_158823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158821 ) ( ON ?auto_158822 ?auto_158821 ) ( not ( = ?auto_158821 ?auto_158822 ) ) ( not ( = ?auto_158821 ?auto_158823 ) ) ( not ( = ?auto_158822 ?auto_158823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158823 ?auto_158822 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158824 - BLOCK
      ?auto_158825 - BLOCK
    )
    :vars
    (
      ?auto_158826 - BLOCK
      ?auto_158827 - BLOCK
      ?auto_158828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158826 ?auto_158825 ) ( CLEAR ?auto_158826 ) ( ON-TABLE ?auto_158824 ) ( ON ?auto_158825 ?auto_158824 ) ( not ( = ?auto_158824 ?auto_158825 ) ) ( not ( = ?auto_158824 ?auto_158826 ) ) ( not ( = ?auto_158825 ?auto_158826 ) ) ( HOLDING ?auto_158827 ) ( CLEAR ?auto_158828 ) ( not ( = ?auto_158824 ?auto_158827 ) ) ( not ( = ?auto_158824 ?auto_158828 ) ) ( not ( = ?auto_158825 ?auto_158827 ) ) ( not ( = ?auto_158825 ?auto_158828 ) ) ( not ( = ?auto_158826 ?auto_158827 ) ) ( not ( = ?auto_158826 ?auto_158828 ) ) ( not ( = ?auto_158827 ?auto_158828 ) ) )
    :subtasks
    ( ( !STACK ?auto_158827 ?auto_158828 )
      ( MAKE-2PILE ?auto_158824 ?auto_158825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158829 - BLOCK
      ?auto_158830 - BLOCK
    )
    :vars
    (
      ?auto_158831 - BLOCK
      ?auto_158832 - BLOCK
      ?auto_158833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158831 ?auto_158830 ) ( ON-TABLE ?auto_158829 ) ( ON ?auto_158830 ?auto_158829 ) ( not ( = ?auto_158829 ?auto_158830 ) ) ( not ( = ?auto_158829 ?auto_158831 ) ) ( not ( = ?auto_158830 ?auto_158831 ) ) ( CLEAR ?auto_158832 ) ( not ( = ?auto_158829 ?auto_158833 ) ) ( not ( = ?auto_158829 ?auto_158832 ) ) ( not ( = ?auto_158830 ?auto_158833 ) ) ( not ( = ?auto_158830 ?auto_158832 ) ) ( not ( = ?auto_158831 ?auto_158833 ) ) ( not ( = ?auto_158831 ?auto_158832 ) ) ( not ( = ?auto_158833 ?auto_158832 ) ) ( ON ?auto_158833 ?auto_158831 ) ( CLEAR ?auto_158833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158829 ?auto_158830 ?auto_158831 )
      ( MAKE-2PILE ?auto_158829 ?auto_158830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158834 - BLOCK
      ?auto_158835 - BLOCK
    )
    :vars
    (
      ?auto_158836 - BLOCK
      ?auto_158838 - BLOCK
      ?auto_158837 - BLOCK
      ?auto_158840 - BLOCK
      ?auto_158841 - BLOCK
      ?auto_158839 - BLOCK
      ?auto_158842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158836 ?auto_158835 ) ( ON-TABLE ?auto_158834 ) ( ON ?auto_158835 ?auto_158834 ) ( not ( = ?auto_158834 ?auto_158835 ) ) ( not ( = ?auto_158834 ?auto_158836 ) ) ( not ( = ?auto_158835 ?auto_158836 ) ) ( not ( = ?auto_158834 ?auto_158838 ) ) ( not ( = ?auto_158834 ?auto_158837 ) ) ( not ( = ?auto_158835 ?auto_158838 ) ) ( not ( = ?auto_158835 ?auto_158837 ) ) ( not ( = ?auto_158836 ?auto_158838 ) ) ( not ( = ?auto_158836 ?auto_158837 ) ) ( not ( = ?auto_158838 ?auto_158837 ) ) ( ON ?auto_158838 ?auto_158836 ) ( CLEAR ?auto_158838 ) ( HOLDING ?auto_158837 ) ( CLEAR ?auto_158840 ) ( ON-TABLE ?auto_158841 ) ( ON ?auto_158839 ?auto_158841 ) ( ON ?auto_158842 ?auto_158839 ) ( ON ?auto_158840 ?auto_158842 ) ( not ( = ?auto_158841 ?auto_158839 ) ) ( not ( = ?auto_158841 ?auto_158842 ) ) ( not ( = ?auto_158841 ?auto_158840 ) ) ( not ( = ?auto_158841 ?auto_158837 ) ) ( not ( = ?auto_158839 ?auto_158842 ) ) ( not ( = ?auto_158839 ?auto_158840 ) ) ( not ( = ?auto_158839 ?auto_158837 ) ) ( not ( = ?auto_158842 ?auto_158840 ) ) ( not ( = ?auto_158842 ?auto_158837 ) ) ( not ( = ?auto_158840 ?auto_158837 ) ) ( not ( = ?auto_158834 ?auto_158840 ) ) ( not ( = ?auto_158834 ?auto_158841 ) ) ( not ( = ?auto_158834 ?auto_158839 ) ) ( not ( = ?auto_158834 ?auto_158842 ) ) ( not ( = ?auto_158835 ?auto_158840 ) ) ( not ( = ?auto_158835 ?auto_158841 ) ) ( not ( = ?auto_158835 ?auto_158839 ) ) ( not ( = ?auto_158835 ?auto_158842 ) ) ( not ( = ?auto_158836 ?auto_158840 ) ) ( not ( = ?auto_158836 ?auto_158841 ) ) ( not ( = ?auto_158836 ?auto_158839 ) ) ( not ( = ?auto_158836 ?auto_158842 ) ) ( not ( = ?auto_158838 ?auto_158840 ) ) ( not ( = ?auto_158838 ?auto_158841 ) ) ( not ( = ?auto_158838 ?auto_158839 ) ) ( not ( = ?auto_158838 ?auto_158842 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158841 ?auto_158839 ?auto_158842 ?auto_158840 ?auto_158837 )
      ( MAKE-2PILE ?auto_158834 ?auto_158835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158843 - BLOCK
      ?auto_158844 - BLOCK
    )
    :vars
    (
      ?auto_158845 - BLOCK
      ?auto_158846 - BLOCK
      ?auto_158849 - BLOCK
      ?auto_158851 - BLOCK
      ?auto_158850 - BLOCK
      ?auto_158848 - BLOCK
      ?auto_158847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158845 ?auto_158844 ) ( ON-TABLE ?auto_158843 ) ( ON ?auto_158844 ?auto_158843 ) ( not ( = ?auto_158843 ?auto_158844 ) ) ( not ( = ?auto_158843 ?auto_158845 ) ) ( not ( = ?auto_158844 ?auto_158845 ) ) ( not ( = ?auto_158843 ?auto_158846 ) ) ( not ( = ?auto_158843 ?auto_158849 ) ) ( not ( = ?auto_158844 ?auto_158846 ) ) ( not ( = ?auto_158844 ?auto_158849 ) ) ( not ( = ?auto_158845 ?auto_158846 ) ) ( not ( = ?auto_158845 ?auto_158849 ) ) ( not ( = ?auto_158846 ?auto_158849 ) ) ( ON ?auto_158846 ?auto_158845 ) ( CLEAR ?auto_158851 ) ( ON-TABLE ?auto_158850 ) ( ON ?auto_158848 ?auto_158850 ) ( ON ?auto_158847 ?auto_158848 ) ( ON ?auto_158851 ?auto_158847 ) ( not ( = ?auto_158850 ?auto_158848 ) ) ( not ( = ?auto_158850 ?auto_158847 ) ) ( not ( = ?auto_158850 ?auto_158851 ) ) ( not ( = ?auto_158850 ?auto_158849 ) ) ( not ( = ?auto_158848 ?auto_158847 ) ) ( not ( = ?auto_158848 ?auto_158851 ) ) ( not ( = ?auto_158848 ?auto_158849 ) ) ( not ( = ?auto_158847 ?auto_158851 ) ) ( not ( = ?auto_158847 ?auto_158849 ) ) ( not ( = ?auto_158851 ?auto_158849 ) ) ( not ( = ?auto_158843 ?auto_158851 ) ) ( not ( = ?auto_158843 ?auto_158850 ) ) ( not ( = ?auto_158843 ?auto_158848 ) ) ( not ( = ?auto_158843 ?auto_158847 ) ) ( not ( = ?auto_158844 ?auto_158851 ) ) ( not ( = ?auto_158844 ?auto_158850 ) ) ( not ( = ?auto_158844 ?auto_158848 ) ) ( not ( = ?auto_158844 ?auto_158847 ) ) ( not ( = ?auto_158845 ?auto_158851 ) ) ( not ( = ?auto_158845 ?auto_158850 ) ) ( not ( = ?auto_158845 ?auto_158848 ) ) ( not ( = ?auto_158845 ?auto_158847 ) ) ( not ( = ?auto_158846 ?auto_158851 ) ) ( not ( = ?auto_158846 ?auto_158850 ) ) ( not ( = ?auto_158846 ?auto_158848 ) ) ( not ( = ?auto_158846 ?auto_158847 ) ) ( ON ?auto_158849 ?auto_158846 ) ( CLEAR ?auto_158849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158843 ?auto_158844 ?auto_158845 ?auto_158846 )
      ( MAKE-2PILE ?auto_158843 ?auto_158844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158852 - BLOCK
      ?auto_158853 - BLOCK
    )
    :vars
    (
      ?auto_158860 - BLOCK
      ?auto_158857 - BLOCK
      ?auto_158855 - BLOCK
      ?auto_158859 - BLOCK
      ?auto_158856 - BLOCK
      ?auto_158854 - BLOCK
      ?auto_158858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158860 ?auto_158853 ) ( ON-TABLE ?auto_158852 ) ( ON ?auto_158853 ?auto_158852 ) ( not ( = ?auto_158852 ?auto_158853 ) ) ( not ( = ?auto_158852 ?auto_158860 ) ) ( not ( = ?auto_158853 ?auto_158860 ) ) ( not ( = ?auto_158852 ?auto_158857 ) ) ( not ( = ?auto_158852 ?auto_158855 ) ) ( not ( = ?auto_158853 ?auto_158857 ) ) ( not ( = ?auto_158853 ?auto_158855 ) ) ( not ( = ?auto_158860 ?auto_158857 ) ) ( not ( = ?auto_158860 ?auto_158855 ) ) ( not ( = ?auto_158857 ?auto_158855 ) ) ( ON ?auto_158857 ?auto_158860 ) ( ON-TABLE ?auto_158859 ) ( ON ?auto_158856 ?auto_158859 ) ( ON ?auto_158854 ?auto_158856 ) ( not ( = ?auto_158859 ?auto_158856 ) ) ( not ( = ?auto_158859 ?auto_158854 ) ) ( not ( = ?auto_158859 ?auto_158858 ) ) ( not ( = ?auto_158859 ?auto_158855 ) ) ( not ( = ?auto_158856 ?auto_158854 ) ) ( not ( = ?auto_158856 ?auto_158858 ) ) ( not ( = ?auto_158856 ?auto_158855 ) ) ( not ( = ?auto_158854 ?auto_158858 ) ) ( not ( = ?auto_158854 ?auto_158855 ) ) ( not ( = ?auto_158858 ?auto_158855 ) ) ( not ( = ?auto_158852 ?auto_158858 ) ) ( not ( = ?auto_158852 ?auto_158859 ) ) ( not ( = ?auto_158852 ?auto_158856 ) ) ( not ( = ?auto_158852 ?auto_158854 ) ) ( not ( = ?auto_158853 ?auto_158858 ) ) ( not ( = ?auto_158853 ?auto_158859 ) ) ( not ( = ?auto_158853 ?auto_158856 ) ) ( not ( = ?auto_158853 ?auto_158854 ) ) ( not ( = ?auto_158860 ?auto_158858 ) ) ( not ( = ?auto_158860 ?auto_158859 ) ) ( not ( = ?auto_158860 ?auto_158856 ) ) ( not ( = ?auto_158860 ?auto_158854 ) ) ( not ( = ?auto_158857 ?auto_158858 ) ) ( not ( = ?auto_158857 ?auto_158859 ) ) ( not ( = ?auto_158857 ?auto_158856 ) ) ( not ( = ?auto_158857 ?auto_158854 ) ) ( ON ?auto_158855 ?auto_158857 ) ( CLEAR ?auto_158855 ) ( HOLDING ?auto_158858 ) ( CLEAR ?auto_158854 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158859 ?auto_158856 ?auto_158854 ?auto_158858 )
      ( MAKE-2PILE ?auto_158852 ?auto_158853 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158861 - BLOCK
      ?auto_158862 - BLOCK
    )
    :vars
    (
      ?auto_158867 - BLOCK
      ?auto_158869 - BLOCK
      ?auto_158868 - BLOCK
      ?auto_158863 - BLOCK
      ?auto_158866 - BLOCK
      ?auto_158864 - BLOCK
      ?auto_158865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158867 ?auto_158862 ) ( ON-TABLE ?auto_158861 ) ( ON ?auto_158862 ?auto_158861 ) ( not ( = ?auto_158861 ?auto_158862 ) ) ( not ( = ?auto_158861 ?auto_158867 ) ) ( not ( = ?auto_158862 ?auto_158867 ) ) ( not ( = ?auto_158861 ?auto_158869 ) ) ( not ( = ?auto_158861 ?auto_158868 ) ) ( not ( = ?auto_158862 ?auto_158869 ) ) ( not ( = ?auto_158862 ?auto_158868 ) ) ( not ( = ?auto_158867 ?auto_158869 ) ) ( not ( = ?auto_158867 ?auto_158868 ) ) ( not ( = ?auto_158869 ?auto_158868 ) ) ( ON ?auto_158869 ?auto_158867 ) ( ON-TABLE ?auto_158863 ) ( ON ?auto_158866 ?auto_158863 ) ( ON ?auto_158864 ?auto_158866 ) ( not ( = ?auto_158863 ?auto_158866 ) ) ( not ( = ?auto_158863 ?auto_158864 ) ) ( not ( = ?auto_158863 ?auto_158865 ) ) ( not ( = ?auto_158863 ?auto_158868 ) ) ( not ( = ?auto_158866 ?auto_158864 ) ) ( not ( = ?auto_158866 ?auto_158865 ) ) ( not ( = ?auto_158866 ?auto_158868 ) ) ( not ( = ?auto_158864 ?auto_158865 ) ) ( not ( = ?auto_158864 ?auto_158868 ) ) ( not ( = ?auto_158865 ?auto_158868 ) ) ( not ( = ?auto_158861 ?auto_158865 ) ) ( not ( = ?auto_158861 ?auto_158863 ) ) ( not ( = ?auto_158861 ?auto_158866 ) ) ( not ( = ?auto_158861 ?auto_158864 ) ) ( not ( = ?auto_158862 ?auto_158865 ) ) ( not ( = ?auto_158862 ?auto_158863 ) ) ( not ( = ?auto_158862 ?auto_158866 ) ) ( not ( = ?auto_158862 ?auto_158864 ) ) ( not ( = ?auto_158867 ?auto_158865 ) ) ( not ( = ?auto_158867 ?auto_158863 ) ) ( not ( = ?auto_158867 ?auto_158866 ) ) ( not ( = ?auto_158867 ?auto_158864 ) ) ( not ( = ?auto_158869 ?auto_158865 ) ) ( not ( = ?auto_158869 ?auto_158863 ) ) ( not ( = ?auto_158869 ?auto_158866 ) ) ( not ( = ?auto_158869 ?auto_158864 ) ) ( ON ?auto_158868 ?auto_158869 ) ( CLEAR ?auto_158864 ) ( ON ?auto_158865 ?auto_158868 ) ( CLEAR ?auto_158865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158861 ?auto_158862 ?auto_158867 ?auto_158869 ?auto_158868 )
      ( MAKE-2PILE ?auto_158861 ?auto_158862 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158870 - BLOCK
      ?auto_158871 - BLOCK
    )
    :vars
    (
      ?auto_158876 - BLOCK
      ?auto_158875 - BLOCK
      ?auto_158873 - BLOCK
      ?auto_158878 - BLOCK
      ?auto_158872 - BLOCK
      ?auto_158874 - BLOCK
      ?auto_158877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158876 ?auto_158871 ) ( ON-TABLE ?auto_158870 ) ( ON ?auto_158871 ?auto_158870 ) ( not ( = ?auto_158870 ?auto_158871 ) ) ( not ( = ?auto_158870 ?auto_158876 ) ) ( not ( = ?auto_158871 ?auto_158876 ) ) ( not ( = ?auto_158870 ?auto_158875 ) ) ( not ( = ?auto_158870 ?auto_158873 ) ) ( not ( = ?auto_158871 ?auto_158875 ) ) ( not ( = ?auto_158871 ?auto_158873 ) ) ( not ( = ?auto_158876 ?auto_158875 ) ) ( not ( = ?auto_158876 ?auto_158873 ) ) ( not ( = ?auto_158875 ?auto_158873 ) ) ( ON ?auto_158875 ?auto_158876 ) ( ON-TABLE ?auto_158878 ) ( ON ?auto_158872 ?auto_158878 ) ( not ( = ?auto_158878 ?auto_158872 ) ) ( not ( = ?auto_158878 ?auto_158874 ) ) ( not ( = ?auto_158878 ?auto_158877 ) ) ( not ( = ?auto_158878 ?auto_158873 ) ) ( not ( = ?auto_158872 ?auto_158874 ) ) ( not ( = ?auto_158872 ?auto_158877 ) ) ( not ( = ?auto_158872 ?auto_158873 ) ) ( not ( = ?auto_158874 ?auto_158877 ) ) ( not ( = ?auto_158874 ?auto_158873 ) ) ( not ( = ?auto_158877 ?auto_158873 ) ) ( not ( = ?auto_158870 ?auto_158877 ) ) ( not ( = ?auto_158870 ?auto_158878 ) ) ( not ( = ?auto_158870 ?auto_158872 ) ) ( not ( = ?auto_158870 ?auto_158874 ) ) ( not ( = ?auto_158871 ?auto_158877 ) ) ( not ( = ?auto_158871 ?auto_158878 ) ) ( not ( = ?auto_158871 ?auto_158872 ) ) ( not ( = ?auto_158871 ?auto_158874 ) ) ( not ( = ?auto_158876 ?auto_158877 ) ) ( not ( = ?auto_158876 ?auto_158878 ) ) ( not ( = ?auto_158876 ?auto_158872 ) ) ( not ( = ?auto_158876 ?auto_158874 ) ) ( not ( = ?auto_158875 ?auto_158877 ) ) ( not ( = ?auto_158875 ?auto_158878 ) ) ( not ( = ?auto_158875 ?auto_158872 ) ) ( not ( = ?auto_158875 ?auto_158874 ) ) ( ON ?auto_158873 ?auto_158875 ) ( ON ?auto_158877 ?auto_158873 ) ( CLEAR ?auto_158877 ) ( HOLDING ?auto_158874 ) ( CLEAR ?auto_158872 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158878 ?auto_158872 ?auto_158874 )
      ( MAKE-2PILE ?auto_158870 ?auto_158871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158879 - BLOCK
      ?auto_158880 - BLOCK
    )
    :vars
    (
      ?auto_158885 - BLOCK
      ?auto_158881 - BLOCK
      ?auto_158882 - BLOCK
      ?auto_158886 - BLOCK
      ?auto_158887 - BLOCK
      ?auto_158884 - BLOCK
      ?auto_158883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158885 ?auto_158880 ) ( ON-TABLE ?auto_158879 ) ( ON ?auto_158880 ?auto_158879 ) ( not ( = ?auto_158879 ?auto_158880 ) ) ( not ( = ?auto_158879 ?auto_158885 ) ) ( not ( = ?auto_158880 ?auto_158885 ) ) ( not ( = ?auto_158879 ?auto_158881 ) ) ( not ( = ?auto_158879 ?auto_158882 ) ) ( not ( = ?auto_158880 ?auto_158881 ) ) ( not ( = ?auto_158880 ?auto_158882 ) ) ( not ( = ?auto_158885 ?auto_158881 ) ) ( not ( = ?auto_158885 ?auto_158882 ) ) ( not ( = ?auto_158881 ?auto_158882 ) ) ( ON ?auto_158881 ?auto_158885 ) ( ON-TABLE ?auto_158886 ) ( ON ?auto_158887 ?auto_158886 ) ( not ( = ?auto_158886 ?auto_158887 ) ) ( not ( = ?auto_158886 ?auto_158884 ) ) ( not ( = ?auto_158886 ?auto_158883 ) ) ( not ( = ?auto_158886 ?auto_158882 ) ) ( not ( = ?auto_158887 ?auto_158884 ) ) ( not ( = ?auto_158887 ?auto_158883 ) ) ( not ( = ?auto_158887 ?auto_158882 ) ) ( not ( = ?auto_158884 ?auto_158883 ) ) ( not ( = ?auto_158884 ?auto_158882 ) ) ( not ( = ?auto_158883 ?auto_158882 ) ) ( not ( = ?auto_158879 ?auto_158883 ) ) ( not ( = ?auto_158879 ?auto_158886 ) ) ( not ( = ?auto_158879 ?auto_158887 ) ) ( not ( = ?auto_158879 ?auto_158884 ) ) ( not ( = ?auto_158880 ?auto_158883 ) ) ( not ( = ?auto_158880 ?auto_158886 ) ) ( not ( = ?auto_158880 ?auto_158887 ) ) ( not ( = ?auto_158880 ?auto_158884 ) ) ( not ( = ?auto_158885 ?auto_158883 ) ) ( not ( = ?auto_158885 ?auto_158886 ) ) ( not ( = ?auto_158885 ?auto_158887 ) ) ( not ( = ?auto_158885 ?auto_158884 ) ) ( not ( = ?auto_158881 ?auto_158883 ) ) ( not ( = ?auto_158881 ?auto_158886 ) ) ( not ( = ?auto_158881 ?auto_158887 ) ) ( not ( = ?auto_158881 ?auto_158884 ) ) ( ON ?auto_158882 ?auto_158881 ) ( ON ?auto_158883 ?auto_158882 ) ( CLEAR ?auto_158887 ) ( ON ?auto_158884 ?auto_158883 ) ( CLEAR ?auto_158884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158879 ?auto_158880 ?auto_158885 ?auto_158881 ?auto_158882 ?auto_158883 )
      ( MAKE-2PILE ?auto_158879 ?auto_158880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158888 - BLOCK
      ?auto_158889 - BLOCK
    )
    :vars
    (
      ?auto_158895 - BLOCK
      ?auto_158896 - BLOCK
      ?auto_158893 - BLOCK
      ?auto_158890 - BLOCK
      ?auto_158891 - BLOCK
      ?auto_158892 - BLOCK
      ?auto_158894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158895 ?auto_158889 ) ( ON-TABLE ?auto_158888 ) ( ON ?auto_158889 ?auto_158888 ) ( not ( = ?auto_158888 ?auto_158889 ) ) ( not ( = ?auto_158888 ?auto_158895 ) ) ( not ( = ?auto_158889 ?auto_158895 ) ) ( not ( = ?auto_158888 ?auto_158896 ) ) ( not ( = ?auto_158888 ?auto_158893 ) ) ( not ( = ?auto_158889 ?auto_158896 ) ) ( not ( = ?auto_158889 ?auto_158893 ) ) ( not ( = ?auto_158895 ?auto_158896 ) ) ( not ( = ?auto_158895 ?auto_158893 ) ) ( not ( = ?auto_158896 ?auto_158893 ) ) ( ON ?auto_158896 ?auto_158895 ) ( ON-TABLE ?auto_158890 ) ( not ( = ?auto_158890 ?auto_158891 ) ) ( not ( = ?auto_158890 ?auto_158892 ) ) ( not ( = ?auto_158890 ?auto_158894 ) ) ( not ( = ?auto_158890 ?auto_158893 ) ) ( not ( = ?auto_158891 ?auto_158892 ) ) ( not ( = ?auto_158891 ?auto_158894 ) ) ( not ( = ?auto_158891 ?auto_158893 ) ) ( not ( = ?auto_158892 ?auto_158894 ) ) ( not ( = ?auto_158892 ?auto_158893 ) ) ( not ( = ?auto_158894 ?auto_158893 ) ) ( not ( = ?auto_158888 ?auto_158894 ) ) ( not ( = ?auto_158888 ?auto_158890 ) ) ( not ( = ?auto_158888 ?auto_158891 ) ) ( not ( = ?auto_158888 ?auto_158892 ) ) ( not ( = ?auto_158889 ?auto_158894 ) ) ( not ( = ?auto_158889 ?auto_158890 ) ) ( not ( = ?auto_158889 ?auto_158891 ) ) ( not ( = ?auto_158889 ?auto_158892 ) ) ( not ( = ?auto_158895 ?auto_158894 ) ) ( not ( = ?auto_158895 ?auto_158890 ) ) ( not ( = ?auto_158895 ?auto_158891 ) ) ( not ( = ?auto_158895 ?auto_158892 ) ) ( not ( = ?auto_158896 ?auto_158894 ) ) ( not ( = ?auto_158896 ?auto_158890 ) ) ( not ( = ?auto_158896 ?auto_158891 ) ) ( not ( = ?auto_158896 ?auto_158892 ) ) ( ON ?auto_158893 ?auto_158896 ) ( ON ?auto_158894 ?auto_158893 ) ( ON ?auto_158892 ?auto_158894 ) ( CLEAR ?auto_158892 ) ( HOLDING ?auto_158891 ) ( CLEAR ?auto_158890 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_158890 ?auto_158891 )
      ( MAKE-2PILE ?auto_158888 ?auto_158889 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158897 - BLOCK
      ?auto_158898 - BLOCK
    )
    :vars
    (
      ?auto_158904 - BLOCK
      ?auto_158905 - BLOCK
      ?auto_158903 - BLOCK
      ?auto_158899 - BLOCK
      ?auto_158902 - BLOCK
      ?auto_158901 - BLOCK
      ?auto_158900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158904 ?auto_158898 ) ( ON-TABLE ?auto_158897 ) ( ON ?auto_158898 ?auto_158897 ) ( not ( = ?auto_158897 ?auto_158898 ) ) ( not ( = ?auto_158897 ?auto_158904 ) ) ( not ( = ?auto_158898 ?auto_158904 ) ) ( not ( = ?auto_158897 ?auto_158905 ) ) ( not ( = ?auto_158897 ?auto_158903 ) ) ( not ( = ?auto_158898 ?auto_158905 ) ) ( not ( = ?auto_158898 ?auto_158903 ) ) ( not ( = ?auto_158904 ?auto_158905 ) ) ( not ( = ?auto_158904 ?auto_158903 ) ) ( not ( = ?auto_158905 ?auto_158903 ) ) ( ON ?auto_158905 ?auto_158904 ) ( ON-TABLE ?auto_158899 ) ( not ( = ?auto_158899 ?auto_158902 ) ) ( not ( = ?auto_158899 ?auto_158901 ) ) ( not ( = ?auto_158899 ?auto_158900 ) ) ( not ( = ?auto_158899 ?auto_158903 ) ) ( not ( = ?auto_158902 ?auto_158901 ) ) ( not ( = ?auto_158902 ?auto_158900 ) ) ( not ( = ?auto_158902 ?auto_158903 ) ) ( not ( = ?auto_158901 ?auto_158900 ) ) ( not ( = ?auto_158901 ?auto_158903 ) ) ( not ( = ?auto_158900 ?auto_158903 ) ) ( not ( = ?auto_158897 ?auto_158900 ) ) ( not ( = ?auto_158897 ?auto_158899 ) ) ( not ( = ?auto_158897 ?auto_158902 ) ) ( not ( = ?auto_158897 ?auto_158901 ) ) ( not ( = ?auto_158898 ?auto_158900 ) ) ( not ( = ?auto_158898 ?auto_158899 ) ) ( not ( = ?auto_158898 ?auto_158902 ) ) ( not ( = ?auto_158898 ?auto_158901 ) ) ( not ( = ?auto_158904 ?auto_158900 ) ) ( not ( = ?auto_158904 ?auto_158899 ) ) ( not ( = ?auto_158904 ?auto_158902 ) ) ( not ( = ?auto_158904 ?auto_158901 ) ) ( not ( = ?auto_158905 ?auto_158900 ) ) ( not ( = ?auto_158905 ?auto_158899 ) ) ( not ( = ?auto_158905 ?auto_158902 ) ) ( not ( = ?auto_158905 ?auto_158901 ) ) ( ON ?auto_158903 ?auto_158905 ) ( ON ?auto_158900 ?auto_158903 ) ( ON ?auto_158901 ?auto_158900 ) ( CLEAR ?auto_158899 ) ( ON ?auto_158902 ?auto_158901 ) ( CLEAR ?auto_158902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_158897 ?auto_158898 ?auto_158904 ?auto_158905 ?auto_158903 ?auto_158900 ?auto_158901 )
      ( MAKE-2PILE ?auto_158897 ?auto_158898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158906 - BLOCK
      ?auto_158907 - BLOCK
    )
    :vars
    (
      ?auto_158911 - BLOCK
      ?auto_158913 - BLOCK
      ?auto_158909 - BLOCK
      ?auto_158912 - BLOCK
      ?auto_158908 - BLOCK
      ?auto_158910 - BLOCK
      ?auto_158914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158911 ?auto_158907 ) ( ON-TABLE ?auto_158906 ) ( ON ?auto_158907 ?auto_158906 ) ( not ( = ?auto_158906 ?auto_158907 ) ) ( not ( = ?auto_158906 ?auto_158911 ) ) ( not ( = ?auto_158907 ?auto_158911 ) ) ( not ( = ?auto_158906 ?auto_158913 ) ) ( not ( = ?auto_158906 ?auto_158909 ) ) ( not ( = ?auto_158907 ?auto_158913 ) ) ( not ( = ?auto_158907 ?auto_158909 ) ) ( not ( = ?auto_158911 ?auto_158913 ) ) ( not ( = ?auto_158911 ?auto_158909 ) ) ( not ( = ?auto_158913 ?auto_158909 ) ) ( ON ?auto_158913 ?auto_158911 ) ( not ( = ?auto_158912 ?auto_158908 ) ) ( not ( = ?auto_158912 ?auto_158910 ) ) ( not ( = ?auto_158912 ?auto_158914 ) ) ( not ( = ?auto_158912 ?auto_158909 ) ) ( not ( = ?auto_158908 ?auto_158910 ) ) ( not ( = ?auto_158908 ?auto_158914 ) ) ( not ( = ?auto_158908 ?auto_158909 ) ) ( not ( = ?auto_158910 ?auto_158914 ) ) ( not ( = ?auto_158910 ?auto_158909 ) ) ( not ( = ?auto_158914 ?auto_158909 ) ) ( not ( = ?auto_158906 ?auto_158914 ) ) ( not ( = ?auto_158906 ?auto_158912 ) ) ( not ( = ?auto_158906 ?auto_158908 ) ) ( not ( = ?auto_158906 ?auto_158910 ) ) ( not ( = ?auto_158907 ?auto_158914 ) ) ( not ( = ?auto_158907 ?auto_158912 ) ) ( not ( = ?auto_158907 ?auto_158908 ) ) ( not ( = ?auto_158907 ?auto_158910 ) ) ( not ( = ?auto_158911 ?auto_158914 ) ) ( not ( = ?auto_158911 ?auto_158912 ) ) ( not ( = ?auto_158911 ?auto_158908 ) ) ( not ( = ?auto_158911 ?auto_158910 ) ) ( not ( = ?auto_158913 ?auto_158914 ) ) ( not ( = ?auto_158913 ?auto_158912 ) ) ( not ( = ?auto_158913 ?auto_158908 ) ) ( not ( = ?auto_158913 ?auto_158910 ) ) ( ON ?auto_158909 ?auto_158913 ) ( ON ?auto_158914 ?auto_158909 ) ( ON ?auto_158910 ?auto_158914 ) ( ON ?auto_158908 ?auto_158910 ) ( CLEAR ?auto_158908 ) ( HOLDING ?auto_158912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_158912 )
      ( MAKE-2PILE ?auto_158906 ?auto_158907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_158915 - BLOCK
      ?auto_158916 - BLOCK
    )
    :vars
    (
      ?auto_158919 - BLOCK
      ?auto_158922 - BLOCK
      ?auto_158917 - BLOCK
      ?auto_158918 - BLOCK
      ?auto_158921 - BLOCK
      ?auto_158920 - BLOCK
      ?auto_158923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_158919 ?auto_158916 ) ( ON-TABLE ?auto_158915 ) ( ON ?auto_158916 ?auto_158915 ) ( not ( = ?auto_158915 ?auto_158916 ) ) ( not ( = ?auto_158915 ?auto_158919 ) ) ( not ( = ?auto_158916 ?auto_158919 ) ) ( not ( = ?auto_158915 ?auto_158922 ) ) ( not ( = ?auto_158915 ?auto_158917 ) ) ( not ( = ?auto_158916 ?auto_158922 ) ) ( not ( = ?auto_158916 ?auto_158917 ) ) ( not ( = ?auto_158919 ?auto_158922 ) ) ( not ( = ?auto_158919 ?auto_158917 ) ) ( not ( = ?auto_158922 ?auto_158917 ) ) ( ON ?auto_158922 ?auto_158919 ) ( not ( = ?auto_158918 ?auto_158921 ) ) ( not ( = ?auto_158918 ?auto_158920 ) ) ( not ( = ?auto_158918 ?auto_158923 ) ) ( not ( = ?auto_158918 ?auto_158917 ) ) ( not ( = ?auto_158921 ?auto_158920 ) ) ( not ( = ?auto_158921 ?auto_158923 ) ) ( not ( = ?auto_158921 ?auto_158917 ) ) ( not ( = ?auto_158920 ?auto_158923 ) ) ( not ( = ?auto_158920 ?auto_158917 ) ) ( not ( = ?auto_158923 ?auto_158917 ) ) ( not ( = ?auto_158915 ?auto_158923 ) ) ( not ( = ?auto_158915 ?auto_158918 ) ) ( not ( = ?auto_158915 ?auto_158921 ) ) ( not ( = ?auto_158915 ?auto_158920 ) ) ( not ( = ?auto_158916 ?auto_158923 ) ) ( not ( = ?auto_158916 ?auto_158918 ) ) ( not ( = ?auto_158916 ?auto_158921 ) ) ( not ( = ?auto_158916 ?auto_158920 ) ) ( not ( = ?auto_158919 ?auto_158923 ) ) ( not ( = ?auto_158919 ?auto_158918 ) ) ( not ( = ?auto_158919 ?auto_158921 ) ) ( not ( = ?auto_158919 ?auto_158920 ) ) ( not ( = ?auto_158922 ?auto_158923 ) ) ( not ( = ?auto_158922 ?auto_158918 ) ) ( not ( = ?auto_158922 ?auto_158921 ) ) ( not ( = ?auto_158922 ?auto_158920 ) ) ( ON ?auto_158917 ?auto_158922 ) ( ON ?auto_158923 ?auto_158917 ) ( ON ?auto_158920 ?auto_158923 ) ( ON ?auto_158921 ?auto_158920 ) ( ON ?auto_158918 ?auto_158921 ) ( CLEAR ?auto_158918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_158915 ?auto_158916 ?auto_158919 ?auto_158922 ?auto_158917 ?auto_158923 ?auto_158920 ?auto_158921 )
      ( MAKE-2PILE ?auto_158915 ?auto_158916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158931 - BLOCK
      ?auto_158932 - BLOCK
      ?auto_158933 - BLOCK
      ?auto_158934 - BLOCK
      ?auto_158935 - BLOCK
      ?auto_158936 - BLOCK
      ?auto_158937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_158937 ) ( CLEAR ?auto_158936 ) ( ON-TABLE ?auto_158931 ) ( ON ?auto_158932 ?auto_158931 ) ( ON ?auto_158933 ?auto_158932 ) ( ON ?auto_158934 ?auto_158933 ) ( ON ?auto_158935 ?auto_158934 ) ( ON ?auto_158936 ?auto_158935 ) ( not ( = ?auto_158931 ?auto_158932 ) ) ( not ( = ?auto_158931 ?auto_158933 ) ) ( not ( = ?auto_158931 ?auto_158934 ) ) ( not ( = ?auto_158931 ?auto_158935 ) ) ( not ( = ?auto_158931 ?auto_158936 ) ) ( not ( = ?auto_158931 ?auto_158937 ) ) ( not ( = ?auto_158932 ?auto_158933 ) ) ( not ( = ?auto_158932 ?auto_158934 ) ) ( not ( = ?auto_158932 ?auto_158935 ) ) ( not ( = ?auto_158932 ?auto_158936 ) ) ( not ( = ?auto_158932 ?auto_158937 ) ) ( not ( = ?auto_158933 ?auto_158934 ) ) ( not ( = ?auto_158933 ?auto_158935 ) ) ( not ( = ?auto_158933 ?auto_158936 ) ) ( not ( = ?auto_158933 ?auto_158937 ) ) ( not ( = ?auto_158934 ?auto_158935 ) ) ( not ( = ?auto_158934 ?auto_158936 ) ) ( not ( = ?auto_158934 ?auto_158937 ) ) ( not ( = ?auto_158935 ?auto_158936 ) ) ( not ( = ?auto_158935 ?auto_158937 ) ) ( not ( = ?auto_158936 ?auto_158937 ) ) )
    :subtasks
    ( ( !STACK ?auto_158937 ?auto_158936 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158938 - BLOCK
      ?auto_158939 - BLOCK
      ?auto_158940 - BLOCK
      ?auto_158941 - BLOCK
      ?auto_158942 - BLOCK
      ?auto_158943 - BLOCK
      ?auto_158944 - BLOCK
    )
    :vars
    (
      ?auto_158945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_158943 ) ( ON-TABLE ?auto_158938 ) ( ON ?auto_158939 ?auto_158938 ) ( ON ?auto_158940 ?auto_158939 ) ( ON ?auto_158941 ?auto_158940 ) ( ON ?auto_158942 ?auto_158941 ) ( ON ?auto_158943 ?auto_158942 ) ( not ( = ?auto_158938 ?auto_158939 ) ) ( not ( = ?auto_158938 ?auto_158940 ) ) ( not ( = ?auto_158938 ?auto_158941 ) ) ( not ( = ?auto_158938 ?auto_158942 ) ) ( not ( = ?auto_158938 ?auto_158943 ) ) ( not ( = ?auto_158938 ?auto_158944 ) ) ( not ( = ?auto_158939 ?auto_158940 ) ) ( not ( = ?auto_158939 ?auto_158941 ) ) ( not ( = ?auto_158939 ?auto_158942 ) ) ( not ( = ?auto_158939 ?auto_158943 ) ) ( not ( = ?auto_158939 ?auto_158944 ) ) ( not ( = ?auto_158940 ?auto_158941 ) ) ( not ( = ?auto_158940 ?auto_158942 ) ) ( not ( = ?auto_158940 ?auto_158943 ) ) ( not ( = ?auto_158940 ?auto_158944 ) ) ( not ( = ?auto_158941 ?auto_158942 ) ) ( not ( = ?auto_158941 ?auto_158943 ) ) ( not ( = ?auto_158941 ?auto_158944 ) ) ( not ( = ?auto_158942 ?auto_158943 ) ) ( not ( = ?auto_158942 ?auto_158944 ) ) ( not ( = ?auto_158943 ?auto_158944 ) ) ( ON ?auto_158944 ?auto_158945 ) ( CLEAR ?auto_158944 ) ( HAND-EMPTY ) ( not ( = ?auto_158938 ?auto_158945 ) ) ( not ( = ?auto_158939 ?auto_158945 ) ) ( not ( = ?auto_158940 ?auto_158945 ) ) ( not ( = ?auto_158941 ?auto_158945 ) ) ( not ( = ?auto_158942 ?auto_158945 ) ) ( not ( = ?auto_158943 ?auto_158945 ) ) ( not ( = ?auto_158944 ?auto_158945 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_158944 ?auto_158945 )
      ( MAKE-7PILE ?auto_158938 ?auto_158939 ?auto_158940 ?auto_158941 ?auto_158942 ?auto_158943 ?auto_158944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158946 - BLOCK
      ?auto_158947 - BLOCK
      ?auto_158948 - BLOCK
      ?auto_158949 - BLOCK
      ?auto_158950 - BLOCK
      ?auto_158951 - BLOCK
      ?auto_158952 - BLOCK
    )
    :vars
    (
      ?auto_158953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158946 ) ( ON ?auto_158947 ?auto_158946 ) ( ON ?auto_158948 ?auto_158947 ) ( ON ?auto_158949 ?auto_158948 ) ( ON ?auto_158950 ?auto_158949 ) ( not ( = ?auto_158946 ?auto_158947 ) ) ( not ( = ?auto_158946 ?auto_158948 ) ) ( not ( = ?auto_158946 ?auto_158949 ) ) ( not ( = ?auto_158946 ?auto_158950 ) ) ( not ( = ?auto_158946 ?auto_158951 ) ) ( not ( = ?auto_158946 ?auto_158952 ) ) ( not ( = ?auto_158947 ?auto_158948 ) ) ( not ( = ?auto_158947 ?auto_158949 ) ) ( not ( = ?auto_158947 ?auto_158950 ) ) ( not ( = ?auto_158947 ?auto_158951 ) ) ( not ( = ?auto_158947 ?auto_158952 ) ) ( not ( = ?auto_158948 ?auto_158949 ) ) ( not ( = ?auto_158948 ?auto_158950 ) ) ( not ( = ?auto_158948 ?auto_158951 ) ) ( not ( = ?auto_158948 ?auto_158952 ) ) ( not ( = ?auto_158949 ?auto_158950 ) ) ( not ( = ?auto_158949 ?auto_158951 ) ) ( not ( = ?auto_158949 ?auto_158952 ) ) ( not ( = ?auto_158950 ?auto_158951 ) ) ( not ( = ?auto_158950 ?auto_158952 ) ) ( not ( = ?auto_158951 ?auto_158952 ) ) ( ON ?auto_158952 ?auto_158953 ) ( CLEAR ?auto_158952 ) ( not ( = ?auto_158946 ?auto_158953 ) ) ( not ( = ?auto_158947 ?auto_158953 ) ) ( not ( = ?auto_158948 ?auto_158953 ) ) ( not ( = ?auto_158949 ?auto_158953 ) ) ( not ( = ?auto_158950 ?auto_158953 ) ) ( not ( = ?auto_158951 ?auto_158953 ) ) ( not ( = ?auto_158952 ?auto_158953 ) ) ( HOLDING ?auto_158951 ) ( CLEAR ?auto_158950 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_158946 ?auto_158947 ?auto_158948 ?auto_158949 ?auto_158950 ?auto_158951 )
      ( MAKE-7PILE ?auto_158946 ?auto_158947 ?auto_158948 ?auto_158949 ?auto_158950 ?auto_158951 ?auto_158952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158954 - BLOCK
      ?auto_158955 - BLOCK
      ?auto_158956 - BLOCK
      ?auto_158957 - BLOCK
      ?auto_158958 - BLOCK
      ?auto_158959 - BLOCK
      ?auto_158960 - BLOCK
    )
    :vars
    (
      ?auto_158961 - BLOCK
      ?auto_158962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158954 ) ( ON ?auto_158955 ?auto_158954 ) ( ON ?auto_158956 ?auto_158955 ) ( ON ?auto_158957 ?auto_158956 ) ( ON ?auto_158958 ?auto_158957 ) ( not ( = ?auto_158954 ?auto_158955 ) ) ( not ( = ?auto_158954 ?auto_158956 ) ) ( not ( = ?auto_158954 ?auto_158957 ) ) ( not ( = ?auto_158954 ?auto_158958 ) ) ( not ( = ?auto_158954 ?auto_158959 ) ) ( not ( = ?auto_158954 ?auto_158960 ) ) ( not ( = ?auto_158955 ?auto_158956 ) ) ( not ( = ?auto_158955 ?auto_158957 ) ) ( not ( = ?auto_158955 ?auto_158958 ) ) ( not ( = ?auto_158955 ?auto_158959 ) ) ( not ( = ?auto_158955 ?auto_158960 ) ) ( not ( = ?auto_158956 ?auto_158957 ) ) ( not ( = ?auto_158956 ?auto_158958 ) ) ( not ( = ?auto_158956 ?auto_158959 ) ) ( not ( = ?auto_158956 ?auto_158960 ) ) ( not ( = ?auto_158957 ?auto_158958 ) ) ( not ( = ?auto_158957 ?auto_158959 ) ) ( not ( = ?auto_158957 ?auto_158960 ) ) ( not ( = ?auto_158958 ?auto_158959 ) ) ( not ( = ?auto_158958 ?auto_158960 ) ) ( not ( = ?auto_158959 ?auto_158960 ) ) ( ON ?auto_158960 ?auto_158961 ) ( not ( = ?auto_158954 ?auto_158961 ) ) ( not ( = ?auto_158955 ?auto_158961 ) ) ( not ( = ?auto_158956 ?auto_158961 ) ) ( not ( = ?auto_158957 ?auto_158961 ) ) ( not ( = ?auto_158958 ?auto_158961 ) ) ( not ( = ?auto_158959 ?auto_158961 ) ) ( not ( = ?auto_158960 ?auto_158961 ) ) ( CLEAR ?auto_158958 ) ( ON ?auto_158959 ?auto_158960 ) ( CLEAR ?auto_158959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_158962 ) ( ON ?auto_158961 ?auto_158962 ) ( not ( = ?auto_158962 ?auto_158961 ) ) ( not ( = ?auto_158962 ?auto_158960 ) ) ( not ( = ?auto_158962 ?auto_158959 ) ) ( not ( = ?auto_158954 ?auto_158962 ) ) ( not ( = ?auto_158955 ?auto_158962 ) ) ( not ( = ?auto_158956 ?auto_158962 ) ) ( not ( = ?auto_158957 ?auto_158962 ) ) ( not ( = ?auto_158958 ?auto_158962 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158962 ?auto_158961 ?auto_158960 )
      ( MAKE-7PILE ?auto_158954 ?auto_158955 ?auto_158956 ?auto_158957 ?auto_158958 ?auto_158959 ?auto_158960 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158963 - BLOCK
      ?auto_158964 - BLOCK
      ?auto_158965 - BLOCK
      ?auto_158966 - BLOCK
      ?auto_158967 - BLOCK
      ?auto_158968 - BLOCK
      ?auto_158969 - BLOCK
    )
    :vars
    (
      ?auto_158971 - BLOCK
      ?auto_158970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158963 ) ( ON ?auto_158964 ?auto_158963 ) ( ON ?auto_158965 ?auto_158964 ) ( ON ?auto_158966 ?auto_158965 ) ( not ( = ?auto_158963 ?auto_158964 ) ) ( not ( = ?auto_158963 ?auto_158965 ) ) ( not ( = ?auto_158963 ?auto_158966 ) ) ( not ( = ?auto_158963 ?auto_158967 ) ) ( not ( = ?auto_158963 ?auto_158968 ) ) ( not ( = ?auto_158963 ?auto_158969 ) ) ( not ( = ?auto_158964 ?auto_158965 ) ) ( not ( = ?auto_158964 ?auto_158966 ) ) ( not ( = ?auto_158964 ?auto_158967 ) ) ( not ( = ?auto_158964 ?auto_158968 ) ) ( not ( = ?auto_158964 ?auto_158969 ) ) ( not ( = ?auto_158965 ?auto_158966 ) ) ( not ( = ?auto_158965 ?auto_158967 ) ) ( not ( = ?auto_158965 ?auto_158968 ) ) ( not ( = ?auto_158965 ?auto_158969 ) ) ( not ( = ?auto_158966 ?auto_158967 ) ) ( not ( = ?auto_158966 ?auto_158968 ) ) ( not ( = ?auto_158966 ?auto_158969 ) ) ( not ( = ?auto_158967 ?auto_158968 ) ) ( not ( = ?auto_158967 ?auto_158969 ) ) ( not ( = ?auto_158968 ?auto_158969 ) ) ( ON ?auto_158969 ?auto_158971 ) ( not ( = ?auto_158963 ?auto_158971 ) ) ( not ( = ?auto_158964 ?auto_158971 ) ) ( not ( = ?auto_158965 ?auto_158971 ) ) ( not ( = ?auto_158966 ?auto_158971 ) ) ( not ( = ?auto_158967 ?auto_158971 ) ) ( not ( = ?auto_158968 ?auto_158971 ) ) ( not ( = ?auto_158969 ?auto_158971 ) ) ( ON ?auto_158968 ?auto_158969 ) ( CLEAR ?auto_158968 ) ( ON-TABLE ?auto_158970 ) ( ON ?auto_158971 ?auto_158970 ) ( not ( = ?auto_158970 ?auto_158971 ) ) ( not ( = ?auto_158970 ?auto_158969 ) ) ( not ( = ?auto_158970 ?auto_158968 ) ) ( not ( = ?auto_158963 ?auto_158970 ) ) ( not ( = ?auto_158964 ?auto_158970 ) ) ( not ( = ?auto_158965 ?auto_158970 ) ) ( not ( = ?auto_158966 ?auto_158970 ) ) ( not ( = ?auto_158967 ?auto_158970 ) ) ( HOLDING ?auto_158967 ) ( CLEAR ?auto_158966 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158963 ?auto_158964 ?auto_158965 ?auto_158966 ?auto_158967 )
      ( MAKE-7PILE ?auto_158963 ?auto_158964 ?auto_158965 ?auto_158966 ?auto_158967 ?auto_158968 ?auto_158969 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158972 - BLOCK
      ?auto_158973 - BLOCK
      ?auto_158974 - BLOCK
      ?auto_158975 - BLOCK
      ?auto_158976 - BLOCK
      ?auto_158977 - BLOCK
      ?auto_158978 - BLOCK
    )
    :vars
    (
      ?auto_158979 - BLOCK
      ?auto_158980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158972 ) ( ON ?auto_158973 ?auto_158972 ) ( ON ?auto_158974 ?auto_158973 ) ( ON ?auto_158975 ?auto_158974 ) ( not ( = ?auto_158972 ?auto_158973 ) ) ( not ( = ?auto_158972 ?auto_158974 ) ) ( not ( = ?auto_158972 ?auto_158975 ) ) ( not ( = ?auto_158972 ?auto_158976 ) ) ( not ( = ?auto_158972 ?auto_158977 ) ) ( not ( = ?auto_158972 ?auto_158978 ) ) ( not ( = ?auto_158973 ?auto_158974 ) ) ( not ( = ?auto_158973 ?auto_158975 ) ) ( not ( = ?auto_158973 ?auto_158976 ) ) ( not ( = ?auto_158973 ?auto_158977 ) ) ( not ( = ?auto_158973 ?auto_158978 ) ) ( not ( = ?auto_158974 ?auto_158975 ) ) ( not ( = ?auto_158974 ?auto_158976 ) ) ( not ( = ?auto_158974 ?auto_158977 ) ) ( not ( = ?auto_158974 ?auto_158978 ) ) ( not ( = ?auto_158975 ?auto_158976 ) ) ( not ( = ?auto_158975 ?auto_158977 ) ) ( not ( = ?auto_158975 ?auto_158978 ) ) ( not ( = ?auto_158976 ?auto_158977 ) ) ( not ( = ?auto_158976 ?auto_158978 ) ) ( not ( = ?auto_158977 ?auto_158978 ) ) ( ON ?auto_158978 ?auto_158979 ) ( not ( = ?auto_158972 ?auto_158979 ) ) ( not ( = ?auto_158973 ?auto_158979 ) ) ( not ( = ?auto_158974 ?auto_158979 ) ) ( not ( = ?auto_158975 ?auto_158979 ) ) ( not ( = ?auto_158976 ?auto_158979 ) ) ( not ( = ?auto_158977 ?auto_158979 ) ) ( not ( = ?auto_158978 ?auto_158979 ) ) ( ON ?auto_158977 ?auto_158978 ) ( ON-TABLE ?auto_158980 ) ( ON ?auto_158979 ?auto_158980 ) ( not ( = ?auto_158980 ?auto_158979 ) ) ( not ( = ?auto_158980 ?auto_158978 ) ) ( not ( = ?auto_158980 ?auto_158977 ) ) ( not ( = ?auto_158972 ?auto_158980 ) ) ( not ( = ?auto_158973 ?auto_158980 ) ) ( not ( = ?auto_158974 ?auto_158980 ) ) ( not ( = ?auto_158975 ?auto_158980 ) ) ( not ( = ?auto_158976 ?auto_158980 ) ) ( CLEAR ?auto_158975 ) ( ON ?auto_158976 ?auto_158977 ) ( CLEAR ?auto_158976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158980 ?auto_158979 ?auto_158978 ?auto_158977 )
      ( MAKE-7PILE ?auto_158972 ?auto_158973 ?auto_158974 ?auto_158975 ?auto_158976 ?auto_158977 ?auto_158978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158981 - BLOCK
      ?auto_158982 - BLOCK
      ?auto_158983 - BLOCK
      ?auto_158984 - BLOCK
      ?auto_158985 - BLOCK
      ?auto_158986 - BLOCK
      ?auto_158987 - BLOCK
    )
    :vars
    (
      ?auto_158989 - BLOCK
      ?auto_158988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158981 ) ( ON ?auto_158982 ?auto_158981 ) ( ON ?auto_158983 ?auto_158982 ) ( not ( = ?auto_158981 ?auto_158982 ) ) ( not ( = ?auto_158981 ?auto_158983 ) ) ( not ( = ?auto_158981 ?auto_158984 ) ) ( not ( = ?auto_158981 ?auto_158985 ) ) ( not ( = ?auto_158981 ?auto_158986 ) ) ( not ( = ?auto_158981 ?auto_158987 ) ) ( not ( = ?auto_158982 ?auto_158983 ) ) ( not ( = ?auto_158982 ?auto_158984 ) ) ( not ( = ?auto_158982 ?auto_158985 ) ) ( not ( = ?auto_158982 ?auto_158986 ) ) ( not ( = ?auto_158982 ?auto_158987 ) ) ( not ( = ?auto_158983 ?auto_158984 ) ) ( not ( = ?auto_158983 ?auto_158985 ) ) ( not ( = ?auto_158983 ?auto_158986 ) ) ( not ( = ?auto_158983 ?auto_158987 ) ) ( not ( = ?auto_158984 ?auto_158985 ) ) ( not ( = ?auto_158984 ?auto_158986 ) ) ( not ( = ?auto_158984 ?auto_158987 ) ) ( not ( = ?auto_158985 ?auto_158986 ) ) ( not ( = ?auto_158985 ?auto_158987 ) ) ( not ( = ?auto_158986 ?auto_158987 ) ) ( ON ?auto_158987 ?auto_158989 ) ( not ( = ?auto_158981 ?auto_158989 ) ) ( not ( = ?auto_158982 ?auto_158989 ) ) ( not ( = ?auto_158983 ?auto_158989 ) ) ( not ( = ?auto_158984 ?auto_158989 ) ) ( not ( = ?auto_158985 ?auto_158989 ) ) ( not ( = ?auto_158986 ?auto_158989 ) ) ( not ( = ?auto_158987 ?auto_158989 ) ) ( ON ?auto_158986 ?auto_158987 ) ( ON-TABLE ?auto_158988 ) ( ON ?auto_158989 ?auto_158988 ) ( not ( = ?auto_158988 ?auto_158989 ) ) ( not ( = ?auto_158988 ?auto_158987 ) ) ( not ( = ?auto_158988 ?auto_158986 ) ) ( not ( = ?auto_158981 ?auto_158988 ) ) ( not ( = ?auto_158982 ?auto_158988 ) ) ( not ( = ?auto_158983 ?auto_158988 ) ) ( not ( = ?auto_158984 ?auto_158988 ) ) ( not ( = ?auto_158985 ?auto_158988 ) ) ( ON ?auto_158985 ?auto_158986 ) ( CLEAR ?auto_158985 ) ( HOLDING ?auto_158984 ) ( CLEAR ?auto_158983 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_158981 ?auto_158982 ?auto_158983 ?auto_158984 )
      ( MAKE-7PILE ?auto_158981 ?auto_158982 ?auto_158983 ?auto_158984 ?auto_158985 ?auto_158986 ?auto_158987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158990 - BLOCK
      ?auto_158991 - BLOCK
      ?auto_158992 - BLOCK
      ?auto_158993 - BLOCK
      ?auto_158994 - BLOCK
      ?auto_158995 - BLOCK
      ?auto_158996 - BLOCK
    )
    :vars
    (
      ?auto_158998 - BLOCK
      ?auto_158997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158990 ) ( ON ?auto_158991 ?auto_158990 ) ( ON ?auto_158992 ?auto_158991 ) ( not ( = ?auto_158990 ?auto_158991 ) ) ( not ( = ?auto_158990 ?auto_158992 ) ) ( not ( = ?auto_158990 ?auto_158993 ) ) ( not ( = ?auto_158990 ?auto_158994 ) ) ( not ( = ?auto_158990 ?auto_158995 ) ) ( not ( = ?auto_158990 ?auto_158996 ) ) ( not ( = ?auto_158991 ?auto_158992 ) ) ( not ( = ?auto_158991 ?auto_158993 ) ) ( not ( = ?auto_158991 ?auto_158994 ) ) ( not ( = ?auto_158991 ?auto_158995 ) ) ( not ( = ?auto_158991 ?auto_158996 ) ) ( not ( = ?auto_158992 ?auto_158993 ) ) ( not ( = ?auto_158992 ?auto_158994 ) ) ( not ( = ?auto_158992 ?auto_158995 ) ) ( not ( = ?auto_158992 ?auto_158996 ) ) ( not ( = ?auto_158993 ?auto_158994 ) ) ( not ( = ?auto_158993 ?auto_158995 ) ) ( not ( = ?auto_158993 ?auto_158996 ) ) ( not ( = ?auto_158994 ?auto_158995 ) ) ( not ( = ?auto_158994 ?auto_158996 ) ) ( not ( = ?auto_158995 ?auto_158996 ) ) ( ON ?auto_158996 ?auto_158998 ) ( not ( = ?auto_158990 ?auto_158998 ) ) ( not ( = ?auto_158991 ?auto_158998 ) ) ( not ( = ?auto_158992 ?auto_158998 ) ) ( not ( = ?auto_158993 ?auto_158998 ) ) ( not ( = ?auto_158994 ?auto_158998 ) ) ( not ( = ?auto_158995 ?auto_158998 ) ) ( not ( = ?auto_158996 ?auto_158998 ) ) ( ON ?auto_158995 ?auto_158996 ) ( ON-TABLE ?auto_158997 ) ( ON ?auto_158998 ?auto_158997 ) ( not ( = ?auto_158997 ?auto_158998 ) ) ( not ( = ?auto_158997 ?auto_158996 ) ) ( not ( = ?auto_158997 ?auto_158995 ) ) ( not ( = ?auto_158990 ?auto_158997 ) ) ( not ( = ?auto_158991 ?auto_158997 ) ) ( not ( = ?auto_158992 ?auto_158997 ) ) ( not ( = ?auto_158993 ?auto_158997 ) ) ( not ( = ?auto_158994 ?auto_158997 ) ) ( ON ?auto_158994 ?auto_158995 ) ( CLEAR ?auto_158992 ) ( ON ?auto_158993 ?auto_158994 ) ( CLEAR ?auto_158993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_158997 ?auto_158998 ?auto_158996 ?auto_158995 ?auto_158994 )
      ( MAKE-7PILE ?auto_158990 ?auto_158991 ?auto_158992 ?auto_158993 ?auto_158994 ?auto_158995 ?auto_158996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_158999 - BLOCK
      ?auto_159000 - BLOCK
      ?auto_159001 - BLOCK
      ?auto_159002 - BLOCK
      ?auto_159003 - BLOCK
      ?auto_159004 - BLOCK
      ?auto_159005 - BLOCK
    )
    :vars
    (
      ?auto_159007 - BLOCK
      ?auto_159006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_158999 ) ( ON ?auto_159000 ?auto_158999 ) ( not ( = ?auto_158999 ?auto_159000 ) ) ( not ( = ?auto_158999 ?auto_159001 ) ) ( not ( = ?auto_158999 ?auto_159002 ) ) ( not ( = ?auto_158999 ?auto_159003 ) ) ( not ( = ?auto_158999 ?auto_159004 ) ) ( not ( = ?auto_158999 ?auto_159005 ) ) ( not ( = ?auto_159000 ?auto_159001 ) ) ( not ( = ?auto_159000 ?auto_159002 ) ) ( not ( = ?auto_159000 ?auto_159003 ) ) ( not ( = ?auto_159000 ?auto_159004 ) ) ( not ( = ?auto_159000 ?auto_159005 ) ) ( not ( = ?auto_159001 ?auto_159002 ) ) ( not ( = ?auto_159001 ?auto_159003 ) ) ( not ( = ?auto_159001 ?auto_159004 ) ) ( not ( = ?auto_159001 ?auto_159005 ) ) ( not ( = ?auto_159002 ?auto_159003 ) ) ( not ( = ?auto_159002 ?auto_159004 ) ) ( not ( = ?auto_159002 ?auto_159005 ) ) ( not ( = ?auto_159003 ?auto_159004 ) ) ( not ( = ?auto_159003 ?auto_159005 ) ) ( not ( = ?auto_159004 ?auto_159005 ) ) ( ON ?auto_159005 ?auto_159007 ) ( not ( = ?auto_158999 ?auto_159007 ) ) ( not ( = ?auto_159000 ?auto_159007 ) ) ( not ( = ?auto_159001 ?auto_159007 ) ) ( not ( = ?auto_159002 ?auto_159007 ) ) ( not ( = ?auto_159003 ?auto_159007 ) ) ( not ( = ?auto_159004 ?auto_159007 ) ) ( not ( = ?auto_159005 ?auto_159007 ) ) ( ON ?auto_159004 ?auto_159005 ) ( ON-TABLE ?auto_159006 ) ( ON ?auto_159007 ?auto_159006 ) ( not ( = ?auto_159006 ?auto_159007 ) ) ( not ( = ?auto_159006 ?auto_159005 ) ) ( not ( = ?auto_159006 ?auto_159004 ) ) ( not ( = ?auto_158999 ?auto_159006 ) ) ( not ( = ?auto_159000 ?auto_159006 ) ) ( not ( = ?auto_159001 ?auto_159006 ) ) ( not ( = ?auto_159002 ?auto_159006 ) ) ( not ( = ?auto_159003 ?auto_159006 ) ) ( ON ?auto_159003 ?auto_159004 ) ( ON ?auto_159002 ?auto_159003 ) ( CLEAR ?auto_159002 ) ( HOLDING ?auto_159001 ) ( CLEAR ?auto_159000 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_158999 ?auto_159000 ?auto_159001 )
      ( MAKE-7PILE ?auto_158999 ?auto_159000 ?auto_159001 ?auto_159002 ?auto_159003 ?auto_159004 ?auto_159005 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159008 - BLOCK
      ?auto_159009 - BLOCK
      ?auto_159010 - BLOCK
      ?auto_159011 - BLOCK
      ?auto_159012 - BLOCK
      ?auto_159013 - BLOCK
      ?auto_159014 - BLOCK
    )
    :vars
    (
      ?auto_159016 - BLOCK
      ?auto_159015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159008 ) ( ON ?auto_159009 ?auto_159008 ) ( not ( = ?auto_159008 ?auto_159009 ) ) ( not ( = ?auto_159008 ?auto_159010 ) ) ( not ( = ?auto_159008 ?auto_159011 ) ) ( not ( = ?auto_159008 ?auto_159012 ) ) ( not ( = ?auto_159008 ?auto_159013 ) ) ( not ( = ?auto_159008 ?auto_159014 ) ) ( not ( = ?auto_159009 ?auto_159010 ) ) ( not ( = ?auto_159009 ?auto_159011 ) ) ( not ( = ?auto_159009 ?auto_159012 ) ) ( not ( = ?auto_159009 ?auto_159013 ) ) ( not ( = ?auto_159009 ?auto_159014 ) ) ( not ( = ?auto_159010 ?auto_159011 ) ) ( not ( = ?auto_159010 ?auto_159012 ) ) ( not ( = ?auto_159010 ?auto_159013 ) ) ( not ( = ?auto_159010 ?auto_159014 ) ) ( not ( = ?auto_159011 ?auto_159012 ) ) ( not ( = ?auto_159011 ?auto_159013 ) ) ( not ( = ?auto_159011 ?auto_159014 ) ) ( not ( = ?auto_159012 ?auto_159013 ) ) ( not ( = ?auto_159012 ?auto_159014 ) ) ( not ( = ?auto_159013 ?auto_159014 ) ) ( ON ?auto_159014 ?auto_159016 ) ( not ( = ?auto_159008 ?auto_159016 ) ) ( not ( = ?auto_159009 ?auto_159016 ) ) ( not ( = ?auto_159010 ?auto_159016 ) ) ( not ( = ?auto_159011 ?auto_159016 ) ) ( not ( = ?auto_159012 ?auto_159016 ) ) ( not ( = ?auto_159013 ?auto_159016 ) ) ( not ( = ?auto_159014 ?auto_159016 ) ) ( ON ?auto_159013 ?auto_159014 ) ( ON-TABLE ?auto_159015 ) ( ON ?auto_159016 ?auto_159015 ) ( not ( = ?auto_159015 ?auto_159016 ) ) ( not ( = ?auto_159015 ?auto_159014 ) ) ( not ( = ?auto_159015 ?auto_159013 ) ) ( not ( = ?auto_159008 ?auto_159015 ) ) ( not ( = ?auto_159009 ?auto_159015 ) ) ( not ( = ?auto_159010 ?auto_159015 ) ) ( not ( = ?auto_159011 ?auto_159015 ) ) ( not ( = ?auto_159012 ?auto_159015 ) ) ( ON ?auto_159012 ?auto_159013 ) ( ON ?auto_159011 ?auto_159012 ) ( CLEAR ?auto_159009 ) ( ON ?auto_159010 ?auto_159011 ) ( CLEAR ?auto_159010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159015 ?auto_159016 ?auto_159014 ?auto_159013 ?auto_159012 ?auto_159011 )
      ( MAKE-7PILE ?auto_159008 ?auto_159009 ?auto_159010 ?auto_159011 ?auto_159012 ?auto_159013 ?auto_159014 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159017 - BLOCK
      ?auto_159018 - BLOCK
      ?auto_159019 - BLOCK
      ?auto_159020 - BLOCK
      ?auto_159021 - BLOCK
      ?auto_159022 - BLOCK
      ?auto_159023 - BLOCK
    )
    :vars
    (
      ?auto_159024 - BLOCK
      ?auto_159025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159017 ) ( not ( = ?auto_159017 ?auto_159018 ) ) ( not ( = ?auto_159017 ?auto_159019 ) ) ( not ( = ?auto_159017 ?auto_159020 ) ) ( not ( = ?auto_159017 ?auto_159021 ) ) ( not ( = ?auto_159017 ?auto_159022 ) ) ( not ( = ?auto_159017 ?auto_159023 ) ) ( not ( = ?auto_159018 ?auto_159019 ) ) ( not ( = ?auto_159018 ?auto_159020 ) ) ( not ( = ?auto_159018 ?auto_159021 ) ) ( not ( = ?auto_159018 ?auto_159022 ) ) ( not ( = ?auto_159018 ?auto_159023 ) ) ( not ( = ?auto_159019 ?auto_159020 ) ) ( not ( = ?auto_159019 ?auto_159021 ) ) ( not ( = ?auto_159019 ?auto_159022 ) ) ( not ( = ?auto_159019 ?auto_159023 ) ) ( not ( = ?auto_159020 ?auto_159021 ) ) ( not ( = ?auto_159020 ?auto_159022 ) ) ( not ( = ?auto_159020 ?auto_159023 ) ) ( not ( = ?auto_159021 ?auto_159022 ) ) ( not ( = ?auto_159021 ?auto_159023 ) ) ( not ( = ?auto_159022 ?auto_159023 ) ) ( ON ?auto_159023 ?auto_159024 ) ( not ( = ?auto_159017 ?auto_159024 ) ) ( not ( = ?auto_159018 ?auto_159024 ) ) ( not ( = ?auto_159019 ?auto_159024 ) ) ( not ( = ?auto_159020 ?auto_159024 ) ) ( not ( = ?auto_159021 ?auto_159024 ) ) ( not ( = ?auto_159022 ?auto_159024 ) ) ( not ( = ?auto_159023 ?auto_159024 ) ) ( ON ?auto_159022 ?auto_159023 ) ( ON-TABLE ?auto_159025 ) ( ON ?auto_159024 ?auto_159025 ) ( not ( = ?auto_159025 ?auto_159024 ) ) ( not ( = ?auto_159025 ?auto_159023 ) ) ( not ( = ?auto_159025 ?auto_159022 ) ) ( not ( = ?auto_159017 ?auto_159025 ) ) ( not ( = ?auto_159018 ?auto_159025 ) ) ( not ( = ?auto_159019 ?auto_159025 ) ) ( not ( = ?auto_159020 ?auto_159025 ) ) ( not ( = ?auto_159021 ?auto_159025 ) ) ( ON ?auto_159021 ?auto_159022 ) ( ON ?auto_159020 ?auto_159021 ) ( ON ?auto_159019 ?auto_159020 ) ( CLEAR ?auto_159019 ) ( HOLDING ?auto_159018 ) ( CLEAR ?auto_159017 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159017 ?auto_159018 )
      ( MAKE-7PILE ?auto_159017 ?auto_159018 ?auto_159019 ?auto_159020 ?auto_159021 ?auto_159022 ?auto_159023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159026 - BLOCK
      ?auto_159027 - BLOCK
      ?auto_159028 - BLOCK
      ?auto_159029 - BLOCK
      ?auto_159030 - BLOCK
      ?auto_159031 - BLOCK
      ?auto_159032 - BLOCK
    )
    :vars
    (
      ?auto_159034 - BLOCK
      ?auto_159033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159026 ) ( not ( = ?auto_159026 ?auto_159027 ) ) ( not ( = ?auto_159026 ?auto_159028 ) ) ( not ( = ?auto_159026 ?auto_159029 ) ) ( not ( = ?auto_159026 ?auto_159030 ) ) ( not ( = ?auto_159026 ?auto_159031 ) ) ( not ( = ?auto_159026 ?auto_159032 ) ) ( not ( = ?auto_159027 ?auto_159028 ) ) ( not ( = ?auto_159027 ?auto_159029 ) ) ( not ( = ?auto_159027 ?auto_159030 ) ) ( not ( = ?auto_159027 ?auto_159031 ) ) ( not ( = ?auto_159027 ?auto_159032 ) ) ( not ( = ?auto_159028 ?auto_159029 ) ) ( not ( = ?auto_159028 ?auto_159030 ) ) ( not ( = ?auto_159028 ?auto_159031 ) ) ( not ( = ?auto_159028 ?auto_159032 ) ) ( not ( = ?auto_159029 ?auto_159030 ) ) ( not ( = ?auto_159029 ?auto_159031 ) ) ( not ( = ?auto_159029 ?auto_159032 ) ) ( not ( = ?auto_159030 ?auto_159031 ) ) ( not ( = ?auto_159030 ?auto_159032 ) ) ( not ( = ?auto_159031 ?auto_159032 ) ) ( ON ?auto_159032 ?auto_159034 ) ( not ( = ?auto_159026 ?auto_159034 ) ) ( not ( = ?auto_159027 ?auto_159034 ) ) ( not ( = ?auto_159028 ?auto_159034 ) ) ( not ( = ?auto_159029 ?auto_159034 ) ) ( not ( = ?auto_159030 ?auto_159034 ) ) ( not ( = ?auto_159031 ?auto_159034 ) ) ( not ( = ?auto_159032 ?auto_159034 ) ) ( ON ?auto_159031 ?auto_159032 ) ( ON-TABLE ?auto_159033 ) ( ON ?auto_159034 ?auto_159033 ) ( not ( = ?auto_159033 ?auto_159034 ) ) ( not ( = ?auto_159033 ?auto_159032 ) ) ( not ( = ?auto_159033 ?auto_159031 ) ) ( not ( = ?auto_159026 ?auto_159033 ) ) ( not ( = ?auto_159027 ?auto_159033 ) ) ( not ( = ?auto_159028 ?auto_159033 ) ) ( not ( = ?auto_159029 ?auto_159033 ) ) ( not ( = ?auto_159030 ?auto_159033 ) ) ( ON ?auto_159030 ?auto_159031 ) ( ON ?auto_159029 ?auto_159030 ) ( ON ?auto_159028 ?auto_159029 ) ( CLEAR ?auto_159026 ) ( ON ?auto_159027 ?auto_159028 ) ( CLEAR ?auto_159027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159033 ?auto_159034 ?auto_159032 ?auto_159031 ?auto_159030 ?auto_159029 ?auto_159028 )
      ( MAKE-7PILE ?auto_159026 ?auto_159027 ?auto_159028 ?auto_159029 ?auto_159030 ?auto_159031 ?auto_159032 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159035 - BLOCK
      ?auto_159036 - BLOCK
      ?auto_159037 - BLOCK
      ?auto_159038 - BLOCK
      ?auto_159039 - BLOCK
      ?auto_159040 - BLOCK
      ?auto_159041 - BLOCK
    )
    :vars
    (
      ?auto_159043 - BLOCK
      ?auto_159042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159035 ?auto_159036 ) ) ( not ( = ?auto_159035 ?auto_159037 ) ) ( not ( = ?auto_159035 ?auto_159038 ) ) ( not ( = ?auto_159035 ?auto_159039 ) ) ( not ( = ?auto_159035 ?auto_159040 ) ) ( not ( = ?auto_159035 ?auto_159041 ) ) ( not ( = ?auto_159036 ?auto_159037 ) ) ( not ( = ?auto_159036 ?auto_159038 ) ) ( not ( = ?auto_159036 ?auto_159039 ) ) ( not ( = ?auto_159036 ?auto_159040 ) ) ( not ( = ?auto_159036 ?auto_159041 ) ) ( not ( = ?auto_159037 ?auto_159038 ) ) ( not ( = ?auto_159037 ?auto_159039 ) ) ( not ( = ?auto_159037 ?auto_159040 ) ) ( not ( = ?auto_159037 ?auto_159041 ) ) ( not ( = ?auto_159038 ?auto_159039 ) ) ( not ( = ?auto_159038 ?auto_159040 ) ) ( not ( = ?auto_159038 ?auto_159041 ) ) ( not ( = ?auto_159039 ?auto_159040 ) ) ( not ( = ?auto_159039 ?auto_159041 ) ) ( not ( = ?auto_159040 ?auto_159041 ) ) ( ON ?auto_159041 ?auto_159043 ) ( not ( = ?auto_159035 ?auto_159043 ) ) ( not ( = ?auto_159036 ?auto_159043 ) ) ( not ( = ?auto_159037 ?auto_159043 ) ) ( not ( = ?auto_159038 ?auto_159043 ) ) ( not ( = ?auto_159039 ?auto_159043 ) ) ( not ( = ?auto_159040 ?auto_159043 ) ) ( not ( = ?auto_159041 ?auto_159043 ) ) ( ON ?auto_159040 ?auto_159041 ) ( ON-TABLE ?auto_159042 ) ( ON ?auto_159043 ?auto_159042 ) ( not ( = ?auto_159042 ?auto_159043 ) ) ( not ( = ?auto_159042 ?auto_159041 ) ) ( not ( = ?auto_159042 ?auto_159040 ) ) ( not ( = ?auto_159035 ?auto_159042 ) ) ( not ( = ?auto_159036 ?auto_159042 ) ) ( not ( = ?auto_159037 ?auto_159042 ) ) ( not ( = ?auto_159038 ?auto_159042 ) ) ( not ( = ?auto_159039 ?auto_159042 ) ) ( ON ?auto_159039 ?auto_159040 ) ( ON ?auto_159038 ?auto_159039 ) ( ON ?auto_159037 ?auto_159038 ) ( ON ?auto_159036 ?auto_159037 ) ( CLEAR ?auto_159036 ) ( HOLDING ?auto_159035 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159035 )
      ( MAKE-7PILE ?auto_159035 ?auto_159036 ?auto_159037 ?auto_159038 ?auto_159039 ?auto_159040 ?auto_159041 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159044 - BLOCK
      ?auto_159045 - BLOCK
      ?auto_159046 - BLOCK
      ?auto_159047 - BLOCK
      ?auto_159048 - BLOCK
      ?auto_159049 - BLOCK
      ?auto_159050 - BLOCK
    )
    :vars
    (
      ?auto_159052 - BLOCK
      ?auto_159051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159044 ?auto_159045 ) ) ( not ( = ?auto_159044 ?auto_159046 ) ) ( not ( = ?auto_159044 ?auto_159047 ) ) ( not ( = ?auto_159044 ?auto_159048 ) ) ( not ( = ?auto_159044 ?auto_159049 ) ) ( not ( = ?auto_159044 ?auto_159050 ) ) ( not ( = ?auto_159045 ?auto_159046 ) ) ( not ( = ?auto_159045 ?auto_159047 ) ) ( not ( = ?auto_159045 ?auto_159048 ) ) ( not ( = ?auto_159045 ?auto_159049 ) ) ( not ( = ?auto_159045 ?auto_159050 ) ) ( not ( = ?auto_159046 ?auto_159047 ) ) ( not ( = ?auto_159046 ?auto_159048 ) ) ( not ( = ?auto_159046 ?auto_159049 ) ) ( not ( = ?auto_159046 ?auto_159050 ) ) ( not ( = ?auto_159047 ?auto_159048 ) ) ( not ( = ?auto_159047 ?auto_159049 ) ) ( not ( = ?auto_159047 ?auto_159050 ) ) ( not ( = ?auto_159048 ?auto_159049 ) ) ( not ( = ?auto_159048 ?auto_159050 ) ) ( not ( = ?auto_159049 ?auto_159050 ) ) ( ON ?auto_159050 ?auto_159052 ) ( not ( = ?auto_159044 ?auto_159052 ) ) ( not ( = ?auto_159045 ?auto_159052 ) ) ( not ( = ?auto_159046 ?auto_159052 ) ) ( not ( = ?auto_159047 ?auto_159052 ) ) ( not ( = ?auto_159048 ?auto_159052 ) ) ( not ( = ?auto_159049 ?auto_159052 ) ) ( not ( = ?auto_159050 ?auto_159052 ) ) ( ON ?auto_159049 ?auto_159050 ) ( ON-TABLE ?auto_159051 ) ( ON ?auto_159052 ?auto_159051 ) ( not ( = ?auto_159051 ?auto_159052 ) ) ( not ( = ?auto_159051 ?auto_159050 ) ) ( not ( = ?auto_159051 ?auto_159049 ) ) ( not ( = ?auto_159044 ?auto_159051 ) ) ( not ( = ?auto_159045 ?auto_159051 ) ) ( not ( = ?auto_159046 ?auto_159051 ) ) ( not ( = ?auto_159047 ?auto_159051 ) ) ( not ( = ?auto_159048 ?auto_159051 ) ) ( ON ?auto_159048 ?auto_159049 ) ( ON ?auto_159047 ?auto_159048 ) ( ON ?auto_159046 ?auto_159047 ) ( ON ?auto_159045 ?auto_159046 ) ( ON ?auto_159044 ?auto_159045 ) ( CLEAR ?auto_159044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159051 ?auto_159052 ?auto_159050 ?auto_159049 ?auto_159048 ?auto_159047 ?auto_159046 ?auto_159045 )
      ( MAKE-7PILE ?auto_159044 ?auto_159045 ?auto_159046 ?auto_159047 ?auto_159048 ?auto_159049 ?auto_159050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159054 - BLOCK
    )
    :vars
    (
      ?auto_159055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159055 ?auto_159054 ) ( CLEAR ?auto_159055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159054 ) ( not ( = ?auto_159054 ?auto_159055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159055 ?auto_159054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159056 - BLOCK
    )
    :vars
    (
      ?auto_159057 - BLOCK
      ?auto_159058 - BLOCK
      ?auto_159059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159057 ?auto_159056 ) ( CLEAR ?auto_159057 ) ( ON-TABLE ?auto_159056 ) ( not ( = ?auto_159056 ?auto_159057 ) ) ( HOLDING ?auto_159058 ) ( CLEAR ?auto_159059 ) ( not ( = ?auto_159056 ?auto_159058 ) ) ( not ( = ?auto_159056 ?auto_159059 ) ) ( not ( = ?auto_159057 ?auto_159058 ) ) ( not ( = ?auto_159057 ?auto_159059 ) ) ( not ( = ?auto_159058 ?auto_159059 ) ) )
    :subtasks
    ( ( !STACK ?auto_159058 ?auto_159059 )
      ( MAKE-1PILE ?auto_159056 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159060 - BLOCK
    )
    :vars
    (
      ?auto_159063 - BLOCK
      ?auto_159062 - BLOCK
      ?auto_159061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159063 ?auto_159060 ) ( ON-TABLE ?auto_159060 ) ( not ( = ?auto_159060 ?auto_159063 ) ) ( CLEAR ?auto_159062 ) ( not ( = ?auto_159060 ?auto_159061 ) ) ( not ( = ?auto_159060 ?auto_159062 ) ) ( not ( = ?auto_159063 ?auto_159061 ) ) ( not ( = ?auto_159063 ?auto_159062 ) ) ( not ( = ?auto_159061 ?auto_159062 ) ) ( ON ?auto_159061 ?auto_159063 ) ( CLEAR ?auto_159061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159060 ?auto_159063 )
      ( MAKE-1PILE ?auto_159060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159064 - BLOCK
    )
    :vars
    (
      ?auto_159067 - BLOCK
      ?auto_159066 - BLOCK
      ?auto_159065 - BLOCK
      ?auto_159069 - BLOCK
      ?auto_159072 - BLOCK
      ?auto_159070 - BLOCK
      ?auto_159071 - BLOCK
      ?auto_159068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159067 ?auto_159064 ) ( ON-TABLE ?auto_159064 ) ( not ( = ?auto_159064 ?auto_159067 ) ) ( not ( = ?auto_159064 ?auto_159066 ) ) ( not ( = ?auto_159064 ?auto_159065 ) ) ( not ( = ?auto_159067 ?auto_159066 ) ) ( not ( = ?auto_159067 ?auto_159065 ) ) ( not ( = ?auto_159066 ?auto_159065 ) ) ( ON ?auto_159066 ?auto_159067 ) ( CLEAR ?auto_159066 ) ( HOLDING ?auto_159065 ) ( CLEAR ?auto_159069 ) ( ON-TABLE ?auto_159072 ) ( ON ?auto_159070 ?auto_159072 ) ( ON ?auto_159071 ?auto_159070 ) ( ON ?auto_159068 ?auto_159071 ) ( ON ?auto_159069 ?auto_159068 ) ( not ( = ?auto_159072 ?auto_159070 ) ) ( not ( = ?auto_159072 ?auto_159071 ) ) ( not ( = ?auto_159072 ?auto_159068 ) ) ( not ( = ?auto_159072 ?auto_159069 ) ) ( not ( = ?auto_159072 ?auto_159065 ) ) ( not ( = ?auto_159070 ?auto_159071 ) ) ( not ( = ?auto_159070 ?auto_159068 ) ) ( not ( = ?auto_159070 ?auto_159069 ) ) ( not ( = ?auto_159070 ?auto_159065 ) ) ( not ( = ?auto_159071 ?auto_159068 ) ) ( not ( = ?auto_159071 ?auto_159069 ) ) ( not ( = ?auto_159071 ?auto_159065 ) ) ( not ( = ?auto_159068 ?auto_159069 ) ) ( not ( = ?auto_159068 ?auto_159065 ) ) ( not ( = ?auto_159069 ?auto_159065 ) ) ( not ( = ?auto_159064 ?auto_159069 ) ) ( not ( = ?auto_159064 ?auto_159072 ) ) ( not ( = ?auto_159064 ?auto_159070 ) ) ( not ( = ?auto_159064 ?auto_159071 ) ) ( not ( = ?auto_159064 ?auto_159068 ) ) ( not ( = ?auto_159067 ?auto_159069 ) ) ( not ( = ?auto_159067 ?auto_159072 ) ) ( not ( = ?auto_159067 ?auto_159070 ) ) ( not ( = ?auto_159067 ?auto_159071 ) ) ( not ( = ?auto_159067 ?auto_159068 ) ) ( not ( = ?auto_159066 ?auto_159069 ) ) ( not ( = ?auto_159066 ?auto_159072 ) ) ( not ( = ?auto_159066 ?auto_159070 ) ) ( not ( = ?auto_159066 ?auto_159071 ) ) ( not ( = ?auto_159066 ?auto_159068 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159072 ?auto_159070 ?auto_159071 ?auto_159068 ?auto_159069 ?auto_159065 )
      ( MAKE-1PILE ?auto_159064 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159073 - BLOCK
    )
    :vars
    (
      ?auto_159078 - BLOCK
      ?auto_159079 - BLOCK
      ?auto_159081 - BLOCK
      ?auto_159076 - BLOCK
      ?auto_159075 - BLOCK
      ?auto_159074 - BLOCK
      ?auto_159077 - BLOCK
      ?auto_159080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159078 ?auto_159073 ) ( ON-TABLE ?auto_159073 ) ( not ( = ?auto_159073 ?auto_159078 ) ) ( not ( = ?auto_159073 ?auto_159079 ) ) ( not ( = ?auto_159073 ?auto_159081 ) ) ( not ( = ?auto_159078 ?auto_159079 ) ) ( not ( = ?auto_159078 ?auto_159081 ) ) ( not ( = ?auto_159079 ?auto_159081 ) ) ( ON ?auto_159079 ?auto_159078 ) ( CLEAR ?auto_159076 ) ( ON-TABLE ?auto_159075 ) ( ON ?auto_159074 ?auto_159075 ) ( ON ?auto_159077 ?auto_159074 ) ( ON ?auto_159080 ?auto_159077 ) ( ON ?auto_159076 ?auto_159080 ) ( not ( = ?auto_159075 ?auto_159074 ) ) ( not ( = ?auto_159075 ?auto_159077 ) ) ( not ( = ?auto_159075 ?auto_159080 ) ) ( not ( = ?auto_159075 ?auto_159076 ) ) ( not ( = ?auto_159075 ?auto_159081 ) ) ( not ( = ?auto_159074 ?auto_159077 ) ) ( not ( = ?auto_159074 ?auto_159080 ) ) ( not ( = ?auto_159074 ?auto_159076 ) ) ( not ( = ?auto_159074 ?auto_159081 ) ) ( not ( = ?auto_159077 ?auto_159080 ) ) ( not ( = ?auto_159077 ?auto_159076 ) ) ( not ( = ?auto_159077 ?auto_159081 ) ) ( not ( = ?auto_159080 ?auto_159076 ) ) ( not ( = ?auto_159080 ?auto_159081 ) ) ( not ( = ?auto_159076 ?auto_159081 ) ) ( not ( = ?auto_159073 ?auto_159076 ) ) ( not ( = ?auto_159073 ?auto_159075 ) ) ( not ( = ?auto_159073 ?auto_159074 ) ) ( not ( = ?auto_159073 ?auto_159077 ) ) ( not ( = ?auto_159073 ?auto_159080 ) ) ( not ( = ?auto_159078 ?auto_159076 ) ) ( not ( = ?auto_159078 ?auto_159075 ) ) ( not ( = ?auto_159078 ?auto_159074 ) ) ( not ( = ?auto_159078 ?auto_159077 ) ) ( not ( = ?auto_159078 ?auto_159080 ) ) ( not ( = ?auto_159079 ?auto_159076 ) ) ( not ( = ?auto_159079 ?auto_159075 ) ) ( not ( = ?auto_159079 ?auto_159074 ) ) ( not ( = ?auto_159079 ?auto_159077 ) ) ( not ( = ?auto_159079 ?auto_159080 ) ) ( ON ?auto_159081 ?auto_159079 ) ( CLEAR ?auto_159081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159073 ?auto_159078 ?auto_159079 )
      ( MAKE-1PILE ?auto_159073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159082 - BLOCK
    )
    :vars
    (
      ?auto_159089 - BLOCK
      ?auto_159084 - BLOCK
      ?auto_159085 - BLOCK
      ?auto_159083 - BLOCK
      ?auto_159088 - BLOCK
      ?auto_159086 - BLOCK
      ?auto_159087 - BLOCK
      ?auto_159090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159089 ?auto_159082 ) ( ON-TABLE ?auto_159082 ) ( not ( = ?auto_159082 ?auto_159089 ) ) ( not ( = ?auto_159082 ?auto_159084 ) ) ( not ( = ?auto_159082 ?auto_159085 ) ) ( not ( = ?auto_159089 ?auto_159084 ) ) ( not ( = ?auto_159089 ?auto_159085 ) ) ( not ( = ?auto_159084 ?auto_159085 ) ) ( ON ?auto_159084 ?auto_159089 ) ( ON-TABLE ?auto_159083 ) ( ON ?auto_159088 ?auto_159083 ) ( ON ?auto_159086 ?auto_159088 ) ( ON ?auto_159087 ?auto_159086 ) ( not ( = ?auto_159083 ?auto_159088 ) ) ( not ( = ?auto_159083 ?auto_159086 ) ) ( not ( = ?auto_159083 ?auto_159087 ) ) ( not ( = ?auto_159083 ?auto_159090 ) ) ( not ( = ?auto_159083 ?auto_159085 ) ) ( not ( = ?auto_159088 ?auto_159086 ) ) ( not ( = ?auto_159088 ?auto_159087 ) ) ( not ( = ?auto_159088 ?auto_159090 ) ) ( not ( = ?auto_159088 ?auto_159085 ) ) ( not ( = ?auto_159086 ?auto_159087 ) ) ( not ( = ?auto_159086 ?auto_159090 ) ) ( not ( = ?auto_159086 ?auto_159085 ) ) ( not ( = ?auto_159087 ?auto_159090 ) ) ( not ( = ?auto_159087 ?auto_159085 ) ) ( not ( = ?auto_159090 ?auto_159085 ) ) ( not ( = ?auto_159082 ?auto_159090 ) ) ( not ( = ?auto_159082 ?auto_159083 ) ) ( not ( = ?auto_159082 ?auto_159088 ) ) ( not ( = ?auto_159082 ?auto_159086 ) ) ( not ( = ?auto_159082 ?auto_159087 ) ) ( not ( = ?auto_159089 ?auto_159090 ) ) ( not ( = ?auto_159089 ?auto_159083 ) ) ( not ( = ?auto_159089 ?auto_159088 ) ) ( not ( = ?auto_159089 ?auto_159086 ) ) ( not ( = ?auto_159089 ?auto_159087 ) ) ( not ( = ?auto_159084 ?auto_159090 ) ) ( not ( = ?auto_159084 ?auto_159083 ) ) ( not ( = ?auto_159084 ?auto_159088 ) ) ( not ( = ?auto_159084 ?auto_159086 ) ) ( not ( = ?auto_159084 ?auto_159087 ) ) ( ON ?auto_159085 ?auto_159084 ) ( CLEAR ?auto_159085 ) ( HOLDING ?auto_159090 ) ( CLEAR ?auto_159087 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159083 ?auto_159088 ?auto_159086 ?auto_159087 ?auto_159090 )
      ( MAKE-1PILE ?auto_159082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159091 - BLOCK
    )
    :vars
    (
      ?auto_159095 - BLOCK
      ?auto_159092 - BLOCK
      ?auto_159097 - BLOCK
      ?auto_159094 - BLOCK
      ?auto_159096 - BLOCK
      ?auto_159099 - BLOCK
      ?auto_159098 - BLOCK
      ?auto_159093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159095 ?auto_159091 ) ( ON-TABLE ?auto_159091 ) ( not ( = ?auto_159091 ?auto_159095 ) ) ( not ( = ?auto_159091 ?auto_159092 ) ) ( not ( = ?auto_159091 ?auto_159097 ) ) ( not ( = ?auto_159095 ?auto_159092 ) ) ( not ( = ?auto_159095 ?auto_159097 ) ) ( not ( = ?auto_159092 ?auto_159097 ) ) ( ON ?auto_159092 ?auto_159095 ) ( ON-TABLE ?auto_159094 ) ( ON ?auto_159096 ?auto_159094 ) ( ON ?auto_159099 ?auto_159096 ) ( ON ?auto_159098 ?auto_159099 ) ( not ( = ?auto_159094 ?auto_159096 ) ) ( not ( = ?auto_159094 ?auto_159099 ) ) ( not ( = ?auto_159094 ?auto_159098 ) ) ( not ( = ?auto_159094 ?auto_159093 ) ) ( not ( = ?auto_159094 ?auto_159097 ) ) ( not ( = ?auto_159096 ?auto_159099 ) ) ( not ( = ?auto_159096 ?auto_159098 ) ) ( not ( = ?auto_159096 ?auto_159093 ) ) ( not ( = ?auto_159096 ?auto_159097 ) ) ( not ( = ?auto_159099 ?auto_159098 ) ) ( not ( = ?auto_159099 ?auto_159093 ) ) ( not ( = ?auto_159099 ?auto_159097 ) ) ( not ( = ?auto_159098 ?auto_159093 ) ) ( not ( = ?auto_159098 ?auto_159097 ) ) ( not ( = ?auto_159093 ?auto_159097 ) ) ( not ( = ?auto_159091 ?auto_159093 ) ) ( not ( = ?auto_159091 ?auto_159094 ) ) ( not ( = ?auto_159091 ?auto_159096 ) ) ( not ( = ?auto_159091 ?auto_159099 ) ) ( not ( = ?auto_159091 ?auto_159098 ) ) ( not ( = ?auto_159095 ?auto_159093 ) ) ( not ( = ?auto_159095 ?auto_159094 ) ) ( not ( = ?auto_159095 ?auto_159096 ) ) ( not ( = ?auto_159095 ?auto_159099 ) ) ( not ( = ?auto_159095 ?auto_159098 ) ) ( not ( = ?auto_159092 ?auto_159093 ) ) ( not ( = ?auto_159092 ?auto_159094 ) ) ( not ( = ?auto_159092 ?auto_159096 ) ) ( not ( = ?auto_159092 ?auto_159099 ) ) ( not ( = ?auto_159092 ?auto_159098 ) ) ( ON ?auto_159097 ?auto_159092 ) ( CLEAR ?auto_159098 ) ( ON ?auto_159093 ?auto_159097 ) ( CLEAR ?auto_159093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159091 ?auto_159095 ?auto_159092 ?auto_159097 )
      ( MAKE-1PILE ?auto_159091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159100 - BLOCK
    )
    :vars
    (
      ?auto_159106 - BLOCK
      ?auto_159108 - BLOCK
      ?auto_159103 - BLOCK
      ?auto_159101 - BLOCK
      ?auto_159102 - BLOCK
      ?auto_159104 - BLOCK
      ?auto_159105 - BLOCK
      ?auto_159107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159106 ?auto_159100 ) ( ON-TABLE ?auto_159100 ) ( not ( = ?auto_159100 ?auto_159106 ) ) ( not ( = ?auto_159100 ?auto_159108 ) ) ( not ( = ?auto_159100 ?auto_159103 ) ) ( not ( = ?auto_159106 ?auto_159108 ) ) ( not ( = ?auto_159106 ?auto_159103 ) ) ( not ( = ?auto_159108 ?auto_159103 ) ) ( ON ?auto_159108 ?auto_159106 ) ( ON-TABLE ?auto_159101 ) ( ON ?auto_159102 ?auto_159101 ) ( ON ?auto_159104 ?auto_159102 ) ( not ( = ?auto_159101 ?auto_159102 ) ) ( not ( = ?auto_159101 ?auto_159104 ) ) ( not ( = ?auto_159101 ?auto_159105 ) ) ( not ( = ?auto_159101 ?auto_159107 ) ) ( not ( = ?auto_159101 ?auto_159103 ) ) ( not ( = ?auto_159102 ?auto_159104 ) ) ( not ( = ?auto_159102 ?auto_159105 ) ) ( not ( = ?auto_159102 ?auto_159107 ) ) ( not ( = ?auto_159102 ?auto_159103 ) ) ( not ( = ?auto_159104 ?auto_159105 ) ) ( not ( = ?auto_159104 ?auto_159107 ) ) ( not ( = ?auto_159104 ?auto_159103 ) ) ( not ( = ?auto_159105 ?auto_159107 ) ) ( not ( = ?auto_159105 ?auto_159103 ) ) ( not ( = ?auto_159107 ?auto_159103 ) ) ( not ( = ?auto_159100 ?auto_159107 ) ) ( not ( = ?auto_159100 ?auto_159101 ) ) ( not ( = ?auto_159100 ?auto_159102 ) ) ( not ( = ?auto_159100 ?auto_159104 ) ) ( not ( = ?auto_159100 ?auto_159105 ) ) ( not ( = ?auto_159106 ?auto_159107 ) ) ( not ( = ?auto_159106 ?auto_159101 ) ) ( not ( = ?auto_159106 ?auto_159102 ) ) ( not ( = ?auto_159106 ?auto_159104 ) ) ( not ( = ?auto_159106 ?auto_159105 ) ) ( not ( = ?auto_159108 ?auto_159107 ) ) ( not ( = ?auto_159108 ?auto_159101 ) ) ( not ( = ?auto_159108 ?auto_159102 ) ) ( not ( = ?auto_159108 ?auto_159104 ) ) ( not ( = ?auto_159108 ?auto_159105 ) ) ( ON ?auto_159103 ?auto_159108 ) ( ON ?auto_159107 ?auto_159103 ) ( CLEAR ?auto_159107 ) ( HOLDING ?auto_159105 ) ( CLEAR ?auto_159104 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159101 ?auto_159102 ?auto_159104 ?auto_159105 )
      ( MAKE-1PILE ?auto_159100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159109 - BLOCK
    )
    :vars
    (
      ?auto_159114 - BLOCK
      ?auto_159117 - BLOCK
      ?auto_159113 - BLOCK
      ?auto_159110 - BLOCK
      ?auto_159111 - BLOCK
      ?auto_159116 - BLOCK
      ?auto_159112 - BLOCK
      ?auto_159115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159114 ?auto_159109 ) ( ON-TABLE ?auto_159109 ) ( not ( = ?auto_159109 ?auto_159114 ) ) ( not ( = ?auto_159109 ?auto_159117 ) ) ( not ( = ?auto_159109 ?auto_159113 ) ) ( not ( = ?auto_159114 ?auto_159117 ) ) ( not ( = ?auto_159114 ?auto_159113 ) ) ( not ( = ?auto_159117 ?auto_159113 ) ) ( ON ?auto_159117 ?auto_159114 ) ( ON-TABLE ?auto_159110 ) ( ON ?auto_159111 ?auto_159110 ) ( ON ?auto_159116 ?auto_159111 ) ( not ( = ?auto_159110 ?auto_159111 ) ) ( not ( = ?auto_159110 ?auto_159116 ) ) ( not ( = ?auto_159110 ?auto_159112 ) ) ( not ( = ?auto_159110 ?auto_159115 ) ) ( not ( = ?auto_159110 ?auto_159113 ) ) ( not ( = ?auto_159111 ?auto_159116 ) ) ( not ( = ?auto_159111 ?auto_159112 ) ) ( not ( = ?auto_159111 ?auto_159115 ) ) ( not ( = ?auto_159111 ?auto_159113 ) ) ( not ( = ?auto_159116 ?auto_159112 ) ) ( not ( = ?auto_159116 ?auto_159115 ) ) ( not ( = ?auto_159116 ?auto_159113 ) ) ( not ( = ?auto_159112 ?auto_159115 ) ) ( not ( = ?auto_159112 ?auto_159113 ) ) ( not ( = ?auto_159115 ?auto_159113 ) ) ( not ( = ?auto_159109 ?auto_159115 ) ) ( not ( = ?auto_159109 ?auto_159110 ) ) ( not ( = ?auto_159109 ?auto_159111 ) ) ( not ( = ?auto_159109 ?auto_159116 ) ) ( not ( = ?auto_159109 ?auto_159112 ) ) ( not ( = ?auto_159114 ?auto_159115 ) ) ( not ( = ?auto_159114 ?auto_159110 ) ) ( not ( = ?auto_159114 ?auto_159111 ) ) ( not ( = ?auto_159114 ?auto_159116 ) ) ( not ( = ?auto_159114 ?auto_159112 ) ) ( not ( = ?auto_159117 ?auto_159115 ) ) ( not ( = ?auto_159117 ?auto_159110 ) ) ( not ( = ?auto_159117 ?auto_159111 ) ) ( not ( = ?auto_159117 ?auto_159116 ) ) ( not ( = ?auto_159117 ?auto_159112 ) ) ( ON ?auto_159113 ?auto_159117 ) ( ON ?auto_159115 ?auto_159113 ) ( CLEAR ?auto_159116 ) ( ON ?auto_159112 ?auto_159115 ) ( CLEAR ?auto_159112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159109 ?auto_159114 ?auto_159117 ?auto_159113 ?auto_159115 )
      ( MAKE-1PILE ?auto_159109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159118 - BLOCK
    )
    :vars
    (
      ?auto_159126 - BLOCK
      ?auto_159119 - BLOCK
      ?auto_159122 - BLOCK
      ?auto_159124 - BLOCK
      ?auto_159120 - BLOCK
      ?auto_159123 - BLOCK
      ?auto_159125 - BLOCK
      ?auto_159121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159126 ?auto_159118 ) ( ON-TABLE ?auto_159118 ) ( not ( = ?auto_159118 ?auto_159126 ) ) ( not ( = ?auto_159118 ?auto_159119 ) ) ( not ( = ?auto_159118 ?auto_159122 ) ) ( not ( = ?auto_159126 ?auto_159119 ) ) ( not ( = ?auto_159126 ?auto_159122 ) ) ( not ( = ?auto_159119 ?auto_159122 ) ) ( ON ?auto_159119 ?auto_159126 ) ( ON-TABLE ?auto_159124 ) ( ON ?auto_159120 ?auto_159124 ) ( not ( = ?auto_159124 ?auto_159120 ) ) ( not ( = ?auto_159124 ?auto_159123 ) ) ( not ( = ?auto_159124 ?auto_159125 ) ) ( not ( = ?auto_159124 ?auto_159121 ) ) ( not ( = ?auto_159124 ?auto_159122 ) ) ( not ( = ?auto_159120 ?auto_159123 ) ) ( not ( = ?auto_159120 ?auto_159125 ) ) ( not ( = ?auto_159120 ?auto_159121 ) ) ( not ( = ?auto_159120 ?auto_159122 ) ) ( not ( = ?auto_159123 ?auto_159125 ) ) ( not ( = ?auto_159123 ?auto_159121 ) ) ( not ( = ?auto_159123 ?auto_159122 ) ) ( not ( = ?auto_159125 ?auto_159121 ) ) ( not ( = ?auto_159125 ?auto_159122 ) ) ( not ( = ?auto_159121 ?auto_159122 ) ) ( not ( = ?auto_159118 ?auto_159121 ) ) ( not ( = ?auto_159118 ?auto_159124 ) ) ( not ( = ?auto_159118 ?auto_159120 ) ) ( not ( = ?auto_159118 ?auto_159123 ) ) ( not ( = ?auto_159118 ?auto_159125 ) ) ( not ( = ?auto_159126 ?auto_159121 ) ) ( not ( = ?auto_159126 ?auto_159124 ) ) ( not ( = ?auto_159126 ?auto_159120 ) ) ( not ( = ?auto_159126 ?auto_159123 ) ) ( not ( = ?auto_159126 ?auto_159125 ) ) ( not ( = ?auto_159119 ?auto_159121 ) ) ( not ( = ?auto_159119 ?auto_159124 ) ) ( not ( = ?auto_159119 ?auto_159120 ) ) ( not ( = ?auto_159119 ?auto_159123 ) ) ( not ( = ?auto_159119 ?auto_159125 ) ) ( ON ?auto_159122 ?auto_159119 ) ( ON ?auto_159121 ?auto_159122 ) ( ON ?auto_159125 ?auto_159121 ) ( CLEAR ?auto_159125 ) ( HOLDING ?auto_159123 ) ( CLEAR ?auto_159120 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159124 ?auto_159120 ?auto_159123 )
      ( MAKE-1PILE ?auto_159118 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159127 - BLOCK
    )
    :vars
    (
      ?auto_159133 - BLOCK
      ?auto_159131 - BLOCK
      ?auto_159135 - BLOCK
      ?auto_159132 - BLOCK
      ?auto_159130 - BLOCK
      ?auto_159128 - BLOCK
      ?auto_159129 - BLOCK
      ?auto_159134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159133 ?auto_159127 ) ( ON-TABLE ?auto_159127 ) ( not ( = ?auto_159127 ?auto_159133 ) ) ( not ( = ?auto_159127 ?auto_159131 ) ) ( not ( = ?auto_159127 ?auto_159135 ) ) ( not ( = ?auto_159133 ?auto_159131 ) ) ( not ( = ?auto_159133 ?auto_159135 ) ) ( not ( = ?auto_159131 ?auto_159135 ) ) ( ON ?auto_159131 ?auto_159133 ) ( ON-TABLE ?auto_159132 ) ( ON ?auto_159130 ?auto_159132 ) ( not ( = ?auto_159132 ?auto_159130 ) ) ( not ( = ?auto_159132 ?auto_159128 ) ) ( not ( = ?auto_159132 ?auto_159129 ) ) ( not ( = ?auto_159132 ?auto_159134 ) ) ( not ( = ?auto_159132 ?auto_159135 ) ) ( not ( = ?auto_159130 ?auto_159128 ) ) ( not ( = ?auto_159130 ?auto_159129 ) ) ( not ( = ?auto_159130 ?auto_159134 ) ) ( not ( = ?auto_159130 ?auto_159135 ) ) ( not ( = ?auto_159128 ?auto_159129 ) ) ( not ( = ?auto_159128 ?auto_159134 ) ) ( not ( = ?auto_159128 ?auto_159135 ) ) ( not ( = ?auto_159129 ?auto_159134 ) ) ( not ( = ?auto_159129 ?auto_159135 ) ) ( not ( = ?auto_159134 ?auto_159135 ) ) ( not ( = ?auto_159127 ?auto_159134 ) ) ( not ( = ?auto_159127 ?auto_159132 ) ) ( not ( = ?auto_159127 ?auto_159130 ) ) ( not ( = ?auto_159127 ?auto_159128 ) ) ( not ( = ?auto_159127 ?auto_159129 ) ) ( not ( = ?auto_159133 ?auto_159134 ) ) ( not ( = ?auto_159133 ?auto_159132 ) ) ( not ( = ?auto_159133 ?auto_159130 ) ) ( not ( = ?auto_159133 ?auto_159128 ) ) ( not ( = ?auto_159133 ?auto_159129 ) ) ( not ( = ?auto_159131 ?auto_159134 ) ) ( not ( = ?auto_159131 ?auto_159132 ) ) ( not ( = ?auto_159131 ?auto_159130 ) ) ( not ( = ?auto_159131 ?auto_159128 ) ) ( not ( = ?auto_159131 ?auto_159129 ) ) ( ON ?auto_159135 ?auto_159131 ) ( ON ?auto_159134 ?auto_159135 ) ( ON ?auto_159129 ?auto_159134 ) ( CLEAR ?auto_159130 ) ( ON ?auto_159128 ?auto_159129 ) ( CLEAR ?auto_159128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159127 ?auto_159133 ?auto_159131 ?auto_159135 ?auto_159134 ?auto_159129 )
      ( MAKE-1PILE ?auto_159127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159136 - BLOCK
    )
    :vars
    (
      ?auto_159140 - BLOCK
      ?auto_159138 - BLOCK
      ?auto_159139 - BLOCK
      ?auto_159142 - BLOCK
      ?auto_159144 - BLOCK
      ?auto_159137 - BLOCK
      ?auto_159143 - BLOCK
      ?auto_159141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159140 ?auto_159136 ) ( ON-TABLE ?auto_159136 ) ( not ( = ?auto_159136 ?auto_159140 ) ) ( not ( = ?auto_159136 ?auto_159138 ) ) ( not ( = ?auto_159136 ?auto_159139 ) ) ( not ( = ?auto_159140 ?auto_159138 ) ) ( not ( = ?auto_159140 ?auto_159139 ) ) ( not ( = ?auto_159138 ?auto_159139 ) ) ( ON ?auto_159138 ?auto_159140 ) ( ON-TABLE ?auto_159142 ) ( not ( = ?auto_159142 ?auto_159144 ) ) ( not ( = ?auto_159142 ?auto_159137 ) ) ( not ( = ?auto_159142 ?auto_159143 ) ) ( not ( = ?auto_159142 ?auto_159141 ) ) ( not ( = ?auto_159142 ?auto_159139 ) ) ( not ( = ?auto_159144 ?auto_159137 ) ) ( not ( = ?auto_159144 ?auto_159143 ) ) ( not ( = ?auto_159144 ?auto_159141 ) ) ( not ( = ?auto_159144 ?auto_159139 ) ) ( not ( = ?auto_159137 ?auto_159143 ) ) ( not ( = ?auto_159137 ?auto_159141 ) ) ( not ( = ?auto_159137 ?auto_159139 ) ) ( not ( = ?auto_159143 ?auto_159141 ) ) ( not ( = ?auto_159143 ?auto_159139 ) ) ( not ( = ?auto_159141 ?auto_159139 ) ) ( not ( = ?auto_159136 ?auto_159141 ) ) ( not ( = ?auto_159136 ?auto_159142 ) ) ( not ( = ?auto_159136 ?auto_159144 ) ) ( not ( = ?auto_159136 ?auto_159137 ) ) ( not ( = ?auto_159136 ?auto_159143 ) ) ( not ( = ?auto_159140 ?auto_159141 ) ) ( not ( = ?auto_159140 ?auto_159142 ) ) ( not ( = ?auto_159140 ?auto_159144 ) ) ( not ( = ?auto_159140 ?auto_159137 ) ) ( not ( = ?auto_159140 ?auto_159143 ) ) ( not ( = ?auto_159138 ?auto_159141 ) ) ( not ( = ?auto_159138 ?auto_159142 ) ) ( not ( = ?auto_159138 ?auto_159144 ) ) ( not ( = ?auto_159138 ?auto_159137 ) ) ( not ( = ?auto_159138 ?auto_159143 ) ) ( ON ?auto_159139 ?auto_159138 ) ( ON ?auto_159141 ?auto_159139 ) ( ON ?auto_159143 ?auto_159141 ) ( ON ?auto_159137 ?auto_159143 ) ( CLEAR ?auto_159137 ) ( HOLDING ?auto_159144 ) ( CLEAR ?auto_159142 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159142 ?auto_159144 )
      ( MAKE-1PILE ?auto_159136 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159145 - BLOCK
    )
    :vars
    (
      ?auto_159149 - BLOCK
      ?auto_159150 - BLOCK
      ?auto_159146 - BLOCK
      ?auto_159153 - BLOCK
      ?auto_159151 - BLOCK
      ?auto_159147 - BLOCK
      ?auto_159152 - BLOCK
      ?auto_159148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159149 ?auto_159145 ) ( ON-TABLE ?auto_159145 ) ( not ( = ?auto_159145 ?auto_159149 ) ) ( not ( = ?auto_159145 ?auto_159150 ) ) ( not ( = ?auto_159145 ?auto_159146 ) ) ( not ( = ?auto_159149 ?auto_159150 ) ) ( not ( = ?auto_159149 ?auto_159146 ) ) ( not ( = ?auto_159150 ?auto_159146 ) ) ( ON ?auto_159150 ?auto_159149 ) ( ON-TABLE ?auto_159153 ) ( not ( = ?auto_159153 ?auto_159151 ) ) ( not ( = ?auto_159153 ?auto_159147 ) ) ( not ( = ?auto_159153 ?auto_159152 ) ) ( not ( = ?auto_159153 ?auto_159148 ) ) ( not ( = ?auto_159153 ?auto_159146 ) ) ( not ( = ?auto_159151 ?auto_159147 ) ) ( not ( = ?auto_159151 ?auto_159152 ) ) ( not ( = ?auto_159151 ?auto_159148 ) ) ( not ( = ?auto_159151 ?auto_159146 ) ) ( not ( = ?auto_159147 ?auto_159152 ) ) ( not ( = ?auto_159147 ?auto_159148 ) ) ( not ( = ?auto_159147 ?auto_159146 ) ) ( not ( = ?auto_159152 ?auto_159148 ) ) ( not ( = ?auto_159152 ?auto_159146 ) ) ( not ( = ?auto_159148 ?auto_159146 ) ) ( not ( = ?auto_159145 ?auto_159148 ) ) ( not ( = ?auto_159145 ?auto_159153 ) ) ( not ( = ?auto_159145 ?auto_159151 ) ) ( not ( = ?auto_159145 ?auto_159147 ) ) ( not ( = ?auto_159145 ?auto_159152 ) ) ( not ( = ?auto_159149 ?auto_159148 ) ) ( not ( = ?auto_159149 ?auto_159153 ) ) ( not ( = ?auto_159149 ?auto_159151 ) ) ( not ( = ?auto_159149 ?auto_159147 ) ) ( not ( = ?auto_159149 ?auto_159152 ) ) ( not ( = ?auto_159150 ?auto_159148 ) ) ( not ( = ?auto_159150 ?auto_159153 ) ) ( not ( = ?auto_159150 ?auto_159151 ) ) ( not ( = ?auto_159150 ?auto_159147 ) ) ( not ( = ?auto_159150 ?auto_159152 ) ) ( ON ?auto_159146 ?auto_159150 ) ( ON ?auto_159148 ?auto_159146 ) ( ON ?auto_159152 ?auto_159148 ) ( ON ?auto_159147 ?auto_159152 ) ( CLEAR ?auto_159153 ) ( ON ?auto_159151 ?auto_159147 ) ( CLEAR ?auto_159151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159145 ?auto_159149 ?auto_159150 ?auto_159146 ?auto_159148 ?auto_159152 ?auto_159147 )
      ( MAKE-1PILE ?auto_159145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159154 - BLOCK
    )
    :vars
    (
      ?auto_159162 - BLOCK
      ?auto_159157 - BLOCK
      ?auto_159155 - BLOCK
      ?auto_159156 - BLOCK
      ?auto_159158 - BLOCK
      ?auto_159160 - BLOCK
      ?auto_159161 - BLOCK
      ?auto_159159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159162 ?auto_159154 ) ( ON-TABLE ?auto_159154 ) ( not ( = ?auto_159154 ?auto_159162 ) ) ( not ( = ?auto_159154 ?auto_159157 ) ) ( not ( = ?auto_159154 ?auto_159155 ) ) ( not ( = ?auto_159162 ?auto_159157 ) ) ( not ( = ?auto_159162 ?auto_159155 ) ) ( not ( = ?auto_159157 ?auto_159155 ) ) ( ON ?auto_159157 ?auto_159162 ) ( not ( = ?auto_159156 ?auto_159158 ) ) ( not ( = ?auto_159156 ?auto_159160 ) ) ( not ( = ?auto_159156 ?auto_159161 ) ) ( not ( = ?auto_159156 ?auto_159159 ) ) ( not ( = ?auto_159156 ?auto_159155 ) ) ( not ( = ?auto_159158 ?auto_159160 ) ) ( not ( = ?auto_159158 ?auto_159161 ) ) ( not ( = ?auto_159158 ?auto_159159 ) ) ( not ( = ?auto_159158 ?auto_159155 ) ) ( not ( = ?auto_159160 ?auto_159161 ) ) ( not ( = ?auto_159160 ?auto_159159 ) ) ( not ( = ?auto_159160 ?auto_159155 ) ) ( not ( = ?auto_159161 ?auto_159159 ) ) ( not ( = ?auto_159161 ?auto_159155 ) ) ( not ( = ?auto_159159 ?auto_159155 ) ) ( not ( = ?auto_159154 ?auto_159159 ) ) ( not ( = ?auto_159154 ?auto_159156 ) ) ( not ( = ?auto_159154 ?auto_159158 ) ) ( not ( = ?auto_159154 ?auto_159160 ) ) ( not ( = ?auto_159154 ?auto_159161 ) ) ( not ( = ?auto_159162 ?auto_159159 ) ) ( not ( = ?auto_159162 ?auto_159156 ) ) ( not ( = ?auto_159162 ?auto_159158 ) ) ( not ( = ?auto_159162 ?auto_159160 ) ) ( not ( = ?auto_159162 ?auto_159161 ) ) ( not ( = ?auto_159157 ?auto_159159 ) ) ( not ( = ?auto_159157 ?auto_159156 ) ) ( not ( = ?auto_159157 ?auto_159158 ) ) ( not ( = ?auto_159157 ?auto_159160 ) ) ( not ( = ?auto_159157 ?auto_159161 ) ) ( ON ?auto_159155 ?auto_159157 ) ( ON ?auto_159159 ?auto_159155 ) ( ON ?auto_159161 ?auto_159159 ) ( ON ?auto_159160 ?auto_159161 ) ( ON ?auto_159158 ?auto_159160 ) ( CLEAR ?auto_159158 ) ( HOLDING ?auto_159156 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159156 )
      ( MAKE-1PILE ?auto_159154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159163 - BLOCK
    )
    :vars
    (
      ?auto_159167 - BLOCK
      ?auto_159171 - BLOCK
      ?auto_159168 - BLOCK
      ?auto_159169 - BLOCK
      ?auto_159170 - BLOCK
      ?auto_159164 - BLOCK
      ?auto_159165 - BLOCK
      ?auto_159166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159167 ?auto_159163 ) ( ON-TABLE ?auto_159163 ) ( not ( = ?auto_159163 ?auto_159167 ) ) ( not ( = ?auto_159163 ?auto_159171 ) ) ( not ( = ?auto_159163 ?auto_159168 ) ) ( not ( = ?auto_159167 ?auto_159171 ) ) ( not ( = ?auto_159167 ?auto_159168 ) ) ( not ( = ?auto_159171 ?auto_159168 ) ) ( ON ?auto_159171 ?auto_159167 ) ( not ( = ?auto_159169 ?auto_159170 ) ) ( not ( = ?auto_159169 ?auto_159164 ) ) ( not ( = ?auto_159169 ?auto_159165 ) ) ( not ( = ?auto_159169 ?auto_159166 ) ) ( not ( = ?auto_159169 ?auto_159168 ) ) ( not ( = ?auto_159170 ?auto_159164 ) ) ( not ( = ?auto_159170 ?auto_159165 ) ) ( not ( = ?auto_159170 ?auto_159166 ) ) ( not ( = ?auto_159170 ?auto_159168 ) ) ( not ( = ?auto_159164 ?auto_159165 ) ) ( not ( = ?auto_159164 ?auto_159166 ) ) ( not ( = ?auto_159164 ?auto_159168 ) ) ( not ( = ?auto_159165 ?auto_159166 ) ) ( not ( = ?auto_159165 ?auto_159168 ) ) ( not ( = ?auto_159166 ?auto_159168 ) ) ( not ( = ?auto_159163 ?auto_159166 ) ) ( not ( = ?auto_159163 ?auto_159169 ) ) ( not ( = ?auto_159163 ?auto_159170 ) ) ( not ( = ?auto_159163 ?auto_159164 ) ) ( not ( = ?auto_159163 ?auto_159165 ) ) ( not ( = ?auto_159167 ?auto_159166 ) ) ( not ( = ?auto_159167 ?auto_159169 ) ) ( not ( = ?auto_159167 ?auto_159170 ) ) ( not ( = ?auto_159167 ?auto_159164 ) ) ( not ( = ?auto_159167 ?auto_159165 ) ) ( not ( = ?auto_159171 ?auto_159166 ) ) ( not ( = ?auto_159171 ?auto_159169 ) ) ( not ( = ?auto_159171 ?auto_159170 ) ) ( not ( = ?auto_159171 ?auto_159164 ) ) ( not ( = ?auto_159171 ?auto_159165 ) ) ( ON ?auto_159168 ?auto_159171 ) ( ON ?auto_159166 ?auto_159168 ) ( ON ?auto_159165 ?auto_159166 ) ( ON ?auto_159164 ?auto_159165 ) ( ON ?auto_159170 ?auto_159164 ) ( ON ?auto_159169 ?auto_159170 ) ( CLEAR ?auto_159169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159163 ?auto_159167 ?auto_159171 ?auto_159168 ?auto_159166 ?auto_159165 ?auto_159164 ?auto_159170 )
      ( MAKE-1PILE ?auto_159163 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159180 - BLOCK
      ?auto_159181 - BLOCK
      ?auto_159182 - BLOCK
      ?auto_159183 - BLOCK
      ?auto_159184 - BLOCK
      ?auto_159185 - BLOCK
      ?auto_159186 - BLOCK
      ?auto_159187 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_159187 ) ( CLEAR ?auto_159186 ) ( ON-TABLE ?auto_159180 ) ( ON ?auto_159181 ?auto_159180 ) ( ON ?auto_159182 ?auto_159181 ) ( ON ?auto_159183 ?auto_159182 ) ( ON ?auto_159184 ?auto_159183 ) ( ON ?auto_159185 ?auto_159184 ) ( ON ?auto_159186 ?auto_159185 ) ( not ( = ?auto_159180 ?auto_159181 ) ) ( not ( = ?auto_159180 ?auto_159182 ) ) ( not ( = ?auto_159180 ?auto_159183 ) ) ( not ( = ?auto_159180 ?auto_159184 ) ) ( not ( = ?auto_159180 ?auto_159185 ) ) ( not ( = ?auto_159180 ?auto_159186 ) ) ( not ( = ?auto_159180 ?auto_159187 ) ) ( not ( = ?auto_159181 ?auto_159182 ) ) ( not ( = ?auto_159181 ?auto_159183 ) ) ( not ( = ?auto_159181 ?auto_159184 ) ) ( not ( = ?auto_159181 ?auto_159185 ) ) ( not ( = ?auto_159181 ?auto_159186 ) ) ( not ( = ?auto_159181 ?auto_159187 ) ) ( not ( = ?auto_159182 ?auto_159183 ) ) ( not ( = ?auto_159182 ?auto_159184 ) ) ( not ( = ?auto_159182 ?auto_159185 ) ) ( not ( = ?auto_159182 ?auto_159186 ) ) ( not ( = ?auto_159182 ?auto_159187 ) ) ( not ( = ?auto_159183 ?auto_159184 ) ) ( not ( = ?auto_159183 ?auto_159185 ) ) ( not ( = ?auto_159183 ?auto_159186 ) ) ( not ( = ?auto_159183 ?auto_159187 ) ) ( not ( = ?auto_159184 ?auto_159185 ) ) ( not ( = ?auto_159184 ?auto_159186 ) ) ( not ( = ?auto_159184 ?auto_159187 ) ) ( not ( = ?auto_159185 ?auto_159186 ) ) ( not ( = ?auto_159185 ?auto_159187 ) ) ( not ( = ?auto_159186 ?auto_159187 ) ) )
    :subtasks
    ( ( !STACK ?auto_159187 ?auto_159186 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159188 - BLOCK
      ?auto_159189 - BLOCK
      ?auto_159190 - BLOCK
      ?auto_159191 - BLOCK
      ?auto_159192 - BLOCK
      ?auto_159193 - BLOCK
      ?auto_159194 - BLOCK
      ?auto_159195 - BLOCK
    )
    :vars
    (
      ?auto_159196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_159194 ) ( ON-TABLE ?auto_159188 ) ( ON ?auto_159189 ?auto_159188 ) ( ON ?auto_159190 ?auto_159189 ) ( ON ?auto_159191 ?auto_159190 ) ( ON ?auto_159192 ?auto_159191 ) ( ON ?auto_159193 ?auto_159192 ) ( ON ?auto_159194 ?auto_159193 ) ( not ( = ?auto_159188 ?auto_159189 ) ) ( not ( = ?auto_159188 ?auto_159190 ) ) ( not ( = ?auto_159188 ?auto_159191 ) ) ( not ( = ?auto_159188 ?auto_159192 ) ) ( not ( = ?auto_159188 ?auto_159193 ) ) ( not ( = ?auto_159188 ?auto_159194 ) ) ( not ( = ?auto_159188 ?auto_159195 ) ) ( not ( = ?auto_159189 ?auto_159190 ) ) ( not ( = ?auto_159189 ?auto_159191 ) ) ( not ( = ?auto_159189 ?auto_159192 ) ) ( not ( = ?auto_159189 ?auto_159193 ) ) ( not ( = ?auto_159189 ?auto_159194 ) ) ( not ( = ?auto_159189 ?auto_159195 ) ) ( not ( = ?auto_159190 ?auto_159191 ) ) ( not ( = ?auto_159190 ?auto_159192 ) ) ( not ( = ?auto_159190 ?auto_159193 ) ) ( not ( = ?auto_159190 ?auto_159194 ) ) ( not ( = ?auto_159190 ?auto_159195 ) ) ( not ( = ?auto_159191 ?auto_159192 ) ) ( not ( = ?auto_159191 ?auto_159193 ) ) ( not ( = ?auto_159191 ?auto_159194 ) ) ( not ( = ?auto_159191 ?auto_159195 ) ) ( not ( = ?auto_159192 ?auto_159193 ) ) ( not ( = ?auto_159192 ?auto_159194 ) ) ( not ( = ?auto_159192 ?auto_159195 ) ) ( not ( = ?auto_159193 ?auto_159194 ) ) ( not ( = ?auto_159193 ?auto_159195 ) ) ( not ( = ?auto_159194 ?auto_159195 ) ) ( ON ?auto_159195 ?auto_159196 ) ( CLEAR ?auto_159195 ) ( HAND-EMPTY ) ( not ( = ?auto_159188 ?auto_159196 ) ) ( not ( = ?auto_159189 ?auto_159196 ) ) ( not ( = ?auto_159190 ?auto_159196 ) ) ( not ( = ?auto_159191 ?auto_159196 ) ) ( not ( = ?auto_159192 ?auto_159196 ) ) ( not ( = ?auto_159193 ?auto_159196 ) ) ( not ( = ?auto_159194 ?auto_159196 ) ) ( not ( = ?auto_159195 ?auto_159196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159195 ?auto_159196 )
      ( MAKE-8PILE ?auto_159188 ?auto_159189 ?auto_159190 ?auto_159191 ?auto_159192 ?auto_159193 ?auto_159194 ?auto_159195 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159197 - BLOCK
      ?auto_159198 - BLOCK
      ?auto_159199 - BLOCK
      ?auto_159200 - BLOCK
      ?auto_159201 - BLOCK
      ?auto_159202 - BLOCK
      ?auto_159203 - BLOCK
      ?auto_159204 - BLOCK
    )
    :vars
    (
      ?auto_159205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159197 ) ( ON ?auto_159198 ?auto_159197 ) ( ON ?auto_159199 ?auto_159198 ) ( ON ?auto_159200 ?auto_159199 ) ( ON ?auto_159201 ?auto_159200 ) ( ON ?auto_159202 ?auto_159201 ) ( not ( = ?auto_159197 ?auto_159198 ) ) ( not ( = ?auto_159197 ?auto_159199 ) ) ( not ( = ?auto_159197 ?auto_159200 ) ) ( not ( = ?auto_159197 ?auto_159201 ) ) ( not ( = ?auto_159197 ?auto_159202 ) ) ( not ( = ?auto_159197 ?auto_159203 ) ) ( not ( = ?auto_159197 ?auto_159204 ) ) ( not ( = ?auto_159198 ?auto_159199 ) ) ( not ( = ?auto_159198 ?auto_159200 ) ) ( not ( = ?auto_159198 ?auto_159201 ) ) ( not ( = ?auto_159198 ?auto_159202 ) ) ( not ( = ?auto_159198 ?auto_159203 ) ) ( not ( = ?auto_159198 ?auto_159204 ) ) ( not ( = ?auto_159199 ?auto_159200 ) ) ( not ( = ?auto_159199 ?auto_159201 ) ) ( not ( = ?auto_159199 ?auto_159202 ) ) ( not ( = ?auto_159199 ?auto_159203 ) ) ( not ( = ?auto_159199 ?auto_159204 ) ) ( not ( = ?auto_159200 ?auto_159201 ) ) ( not ( = ?auto_159200 ?auto_159202 ) ) ( not ( = ?auto_159200 ?auto_159203 ) ) ( not ( = ?auto_159200 ?auto_159204 ) ) ( not ( = ?auto_159201 ?auto_159202 ) ) ( not ( = ?auto_159201 ?auto_159203 ) ) ( not ( = ?auto_159201 ?auto_159204 ) ) ( not ( = ?auto_159202 ?auto_159203 ) ) ( not ( = ?auto_159202 ?auto_159204 ) ) ( not ( = ?auto_159203 ?auto_159204 ) ) ( ON ?auto_159204 ?auto_159205 ) ( CLEAR ?auto_159204 ) ( not ( = ?auto_159197 ?auto_159205 ) ) ( not ( = ?auto_159198 ?auto_159205 ) ) ( not ( = ?auto_159199 ?auto_159205 ) ) ( not ( = ?auto_159200 ?auto_159205 ) ) ( not ( = ?auto_159201 ?auto_159205 ) ) ( not ( = ?auto_159202 ?auto_159205 ) ) ( not ( = ?auto_159203 ?auto_159205 ) ) ( not ( = ?auto_159204 ?auto_159205 ) ) ( HOLDING ?auto_159203 ) ( CLEAR ?auto_159202 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159197 ?auto_159198 ?auto_159199 ?auto_159200 ?auto_159201 ?auto_159202 ?auto_159203 )
      ( MAKE-8PILE ?auto_159197 ?auto_159198 ?auto_159199 ?auto_159200 ?auto_159201 ?auto_159202 ?auto_159203 ?auto_159204 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159206 - BLOCK
      ?auto_159207 - BLOCK
      ?auto_159208 - BLOCK
      ?auto_159209 - BLOCK
      ?auto_159210 - BLOCK
      ?auto_159211 - BLOCK
      ?auto_159212 - BLOCK
      ?auto_159213 - BLOCK
    )
    :vars
    (
      ?auto_159214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159206 ) ( ON ?auto_159207 ?auto_159206 ) ( ON ?auto_159208 ?auto_159207 ) ( ON ?auto_159209 ?auto_159208 ) ( ON ?auto_159210 ?auto_159209 ) ( ON ?auto_159211 ?auto_159210 ) ( not ( = ?auto_159206 ?auto_159207 ) ) ( not ( = ?auto_159206 ?auto_159208 ) ) ( not ( = ?auto_159206 ?auto_159209 ) ) ( not ( = ?auto_159206 ?auto_159210 ) ) ( not ( = ?auto_159206 ?auto_159211 ) ) ( not ( = ?auto_159206 ?auto_159212 ) ) ( not ( = ?auto_159206 ?auto_159213 ) ) ( not ( = ?auto_159207 ?auto_159208 ) ) ( not ( = ?auto_159207 ?auto_159209 ) ) ( not ( = ?auto_159207 ?auto_159210 ) ) ( not ( = ?auto_159207 ?auto_159211 ) ) ( not ( = ?auto_159207 ?auto_159212 ) ) ( not ( = ?auto_159207 ?auto_159213 ) ) ( not ( = ?auto_159208 ?auto_159209 ) ) ( not ( = ?auto_159208 ?auto_159210 ) ) ( not ( = ?auto_159208 ?auto_159211 ) ) ( not ( = ?auto_159208 ?auto_159212 ) ) ( not ( = ?auto_159208 ?auto_159213 ) ) ( not ( = ?auto_159209 ?auto_159210 ) ) ( not ( = ?auto_159209 ?auto_159211 ) ) ( not ( = ?auto_159209 ?auto_159212 ) ) ( not ( = ?auto_159209 ?auto_159213 ) ) ( not ( = ?auto_159210 ?auto_159211 ) ) ( not ( = ?auto_159210 ?auto_159212 ) ) ( not ( = ?auto_159210 ?auto_159213 ) ) ( not ( = ?auto_159211 ?auto_159212 ) ) ( not ( = ?auto_159211 ?auto_159213 ) ) ( not ( = ?auto_159212 ?auto_159213 ) ) ( ON ?auto_159213 ?auto_159214 ) ( not ( = ?auto_159206 ?auto_159214 ) ) ( not ( = ?auto_159207 ?auto_159214 ) ) ( not ( = ?auto_159208 ?auto_159214 ) ) ( not ( = ?auto_159209 ?auto_159214 ) ) ( not ( = ?auto_159210 ?auto_159214 ) ) ( not ( = ?auto_159211 ?auto_159214 ) ) ( not ( = ?auto_159212 ?auto_159214 ) ) ( not ( = ?auto_159213 ?auto_159214 ) ) ( CLEAR ?auto_159211 ) ( ON ?auto_159212 ?auto_159213 ) ( CLEAR ?auto_159212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159214 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159214 ?auto_159213 )
      ( MAKE-8PILE ?auto_159206 ?auto_159207 ?auto_159208 ?auto_159209 ?auto_159210 ?auto_159211 ?auto_159212 ?auto_159213 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159215 - BLOCK
      ?auto_159216 - BLOCK
      ?auto_159217 - BLOCK
      ?auto_159218 - BLOCK
      ?auto_159219 - BLOCK
      ?auto_159220 - BLOCK
      ?auto_159221 - BLOCK
      ?auto_159222 - BLOCK
    )
    :vars
    (
      ?auto_159223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159215 ) ( ON ?auto_159216 ?auto_159215 ) ( ON ?auto_159217 ?auto_159216 ) ( ON ?auto_159218 ?auto_159217 ) ( ON ?auto_159219 ?auto_159218 ) ( not ( = ?auto_159215 ?auto_159216 ) ) ( not ( = ?auto_159215 ?auto_159217 ) ) ( not ( = ?auto_159215 ?auto_159218 ) ) ( not ( = ?auto_159215 ?auto_159219 ) ) ( not ( = ?auto_159215 ?auto_159220 ) ) ( not ( = ?auto_159215 ?auto_159221 ) ) ( not ( = ?auto_159215 ?auto_159222 ) ) ( not ( = ?auto_159216 ?auto_159217 ) ) ( not ( = ?auto_159216 ?auto_159218 ) ) ( not ( = ?auto_159216 ?auto_159219 ) ) ( not ( = ?auto_159216 ?auto_159220 ) ) ( not ( = ?auto_159216 ?auto_159221 ) ) ( not ( = ?auto_159216 ?auto_159222 ) ) ( not ( = ?auto_159217 ?auto_159218 ) ) ( not ( = ?auto_159217 ?auto_159219 ) ) ( not ( = ?auto_159217 ?auto_159220 ) ) ( not ( = ?auto_159217 ?auto_159221 ) ) ( not ( = ?auto_159217 ?auto_159222 ) ) ( not ( = ?auto_159218 ?auto_159219 ) ) ( not ( = ?auto_159218 ?auto_159220 ) ) ( not ( = ?auto_159218 ?auto_159221 ) ) ( not ( = ?auto_159218 ?auto_159222 ) ) ( not ( = ?auto_159219 ?auto_159220 ) ) ( not ( = ?auto_159219 ?auto_159221 ) ) ( not ( = ?auto_159219 ?auto_159222 ) ) ( not ( = ?auto_159220 ?auto_159221 ) ) ( not ( = ?auto_159220 ?auto_159222 ) ) ( not ( = ?auto_159221 ?auto_159222 ) ) ( ON ?auto_159222 ?auto_159223 ) ( not ( = ?auto_159215 ?auto_159223 ) ) ( not ( = ?auto_159216 ?auto_159223 ) ) ( not ( = ?auto_159217 ?auto_159223 ) ) ( not ( = ?auto_159218 ?auto_159223 ) ) ( not ( = ?auto_159219 ?auto_159223 ) ) ( not ( = ?auto_159220 ?auto_159223 ) ) ( not ( = ?auto_159221 ?auto_159223 ) ) ( not ( = ?auto_159222 ?auto_159223 ) ) ( ON ?auto_159221 ?auto_159222 ) ( CLEAR ?auto_159221 ) ( ON-TABLE ?auto_159223 ) ( HOLDING ?auto_159220 ) ( CLEAR ?auto_159219 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159215 ?auto_159216 ?auto_159217 ?auto_159218 ?auto_159219 ?auto_159220 )
      ( MAKE-8PILE ?auto_159215 ?auto_159216 ?auto_159217 ?auto_159218 ?auto_159219 ?auto_159220 ?auto_159221 ?auto_159222 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159224 - BLOCK
      ?auto_159225 - BLOCK
      ?auto_159226 - BLOCK
      ?auto_159227 - BLOCK
      ?auto_159228 - BLOCK
      ?auto_159229 - BLOCK
      ?auto_159230 - BLOCK
      ?auto_159231 - BLOCK
    )
    :vars
    (
      ?auto_159232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159224 ) ( ON ?auto_159225 ?auto_159224 ) ( ON ?auto_159226 ?auto_159225 ) ( ON ?auto_159227 ?auto_159226 ) ( ON ?auto_159228 ?auto_159227 ) ( not ( = ?auto_159224 ?auto_159225 ) ) ( not ( = ?auto_159224 ?auto_159226 ) ) ( not ( = ?auto_159224 ?auto_159227 ) ) ( not ( = ?auto_159224 ?auto_159228 ) ) ( not ( = ?auto_159224 ?auto_159229 ) ) ( not ( = ?auto_159224 ?auto_159230 ) ) ( not ( = ?auto_159224 ?auto_159231 ) ) ( not ( = ?auto_159225 ?auto_159226 ) ) ( not ( = ?auto_159225 ?auto_159227 ) ) ( not ( = ?auto_159225 ?auto_159228 ) ) ( not ( = ?auto_159225 ?auto_159229 ) ) ( not ( = ?auto_159225 ?auto_159230 ) ) ( not ( = ?auto_159225 ?auto_159231 ) ) ( not ( = ?auto_159226 ?auto_159227 ) ) ( not ( = ?auto_159226 ?auto_159228 ) ) ( not ( = ?auto_159226 ?auto_159229 ) ) ( not ( = ?auto_159226 ?auto_159230 ) ) ( not ( = ?auto_159226 ?auto_159231 ) ) ( not ( = ?auto_159227 ?auto_159228 ) ) ( not ( = ?auto_159227 ?auto_159229 ) ) ( not ( = ?auto_159227 ?auto_159230 ) ) ( not ( = ?auto_159227 ?auto_159231 ) ) ( not ( = ?auto_159228 ?auto_159229 ) ) ( not ( = ?auto_159228 ?auto_159230 ) ) ( not ( = ?auto_159228 ?auto_159231 ) ) ( not ( = ?auto_159229 ?auto_159230 ) ) ( not ( = ?auto_159229 ?auto_159231 ) ) ( not ( = ?auto_159230 ?auto_159231 ) ) ( ON ?auto_159231 ?auto_159232 ) ( not ( = ?auto_159224 ?auto_159232 ) ) ( not ( = ?auto_159225 ?auto_159232 ) ) ( not ( = ?auto_159226 ?auto_159232 ) ) ( not ( = ?auto_159227 ?auto_159232 ) ) ( not ( = ?auto_159228 ?auto_159232 ) ) ( not ( = ?auto_159229 ?auto_159232 ) ) ( not ( = ?auto_159230 ?auto_159232 ) ) ( not ( = ?auto_159231 ?auto_159232 ) ) ( ON ?auto_159230 ?auto_159231 ) ( ON-TABLE ?auto_159232 ) ( CLEAR ?auto_159228 ) ( ON ?auto_159229 ?auto_159230 ) ( CLEAR ?auto_159229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159232 ?auto_159231 ?auto_159230 )
      ( MAKE-8PILE ?auto_159224 ?auto_159225 ?auto_159226 ?auto_159227 ?auto_159228 ?auto_159229 ?auto_159230 ?auto_159231 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159233 - BLOCK
      ?auto_159234 - BLOCK
      ?auto_159235 - BLOCK
      ?auto_159236 - BLOCK
      ?auto_159237 - BLOCK
      ?auto_159238 - BLOCK
      ?auto_159239 - BLOCK
      ?auto_159240 - BLOCK
    )
    :vars
    (
      ?auto_159241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159233 ) ( ON ?auto_159234 ?auto_159233 ) ( ON ?auto_159235 ?auto_159234 ) ( ON ?auto_159236 ?auto_159235 ) ( not ( = ?auto_159233 ?auto_159234 ) ) ( not ( = ?auto_159233 ?auto_159235 ) ) ( not ( = ?auto_159233 ?auto_159236 ) ) ( not ( = ?auto_159233 ?auto_159237 ) ) ( not ( = ?auto_159233 ?auto_159238 ) ) ( not ( = ?auto_159233 ?auto_159239 ) ) ( not ( = ?auto_159233 ?auto_159240 ) ) ( not ( = ?auto_159234 ?auto_159235 ) ) ( not ( = ?auto_159234 ?auto_159236 ) ) ( not ( = ?auto_159234 ?auto_159237 ) ) ( not ( = ?auto_159234 ?auto_159238 ) ) ( not ( = ?auto_159234 ?auto_159239 ) ) ( not ( = ?auto_159234 ?auto_159240 ) ) ( not ( = ?auto_159235 ?auto_159236 ) ) ( not ( = ?auto_159235 ?auto_159237 ) ) ( not ( = ?auto_159235 ?auto_159238 ) ) ( not ( = ?auto_159235 ?auto_159239 ) ) ( not ( = ?auto_159235 ?auto_159240 ) ) ( not ( = ?auto_159236 ?auto_159237 ) ) ( not ( = ?auto_159236 ?auto_159238 ) ) ( not ( = ?auto_159236 ?auto_159239 ) ) ( not ( = ?auto_159236 ?auto_159240 ) ) ( not ( = ?auto_159237 ?auto_159238 ) ) ( not ( = ?auto_159237 ?auto_159239 ) ) ( not ( = ?auto_159237 ?auto_159240 ) ) ( not ( = ?auto_159238 ?auto_159239 ) ) ( not ( = ?auto_159238 ?auto_159240 ) ) ( not ( = ?auto_159239 ?auto_159240 ) ) ( ON ?auto_159240 ?auto_159241 ) ( not ( = ?auto_159233 ?auto_159241 ) ) ( not ( = ?auto_159234 ?auto_159241 ) ) ( not ( = ?auto_159235 ?auto_159241 ) ) ( not ( = ?auto_159236 ?auto_159241 ) ) ( not ( = ?auto_159237 ?auto_159241 ) ) ( not ( = ?auto_159238 ?auto_159241 ) ) ( not ( = ?auto_159239 ?auto_159241 ) ) ( not ( = ?auto_159240 ?auto_159241 ) ) ( ON ?auto_159239 ?auto_159240 ) ( ON-TABLE ?auto_159241 ) ( ON ?auto_159238 ?auto_159239 ) ( CLEAR ?auto_159238 ) ( HOLDING ?auto_159237 ) ( CLEAR ?auto_159236 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159233 ?auto_159234 ?auto_159235 ?auto_159236 ?auto_159237 )
      ( MAKE-8PILE ?auto_159233 ?auto_159234 ?auto_159235 ?auto_159236 ?auto_159237 ?auto_159238 ?auto_159239 ?auto_159240 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159242 - BLOCK
      ?auto_159243 - BLOCK
      ?auto_159244 - BLOCK
      ?auto_159245 - BLOCK
      ?auto_159246 - BLOCK
      ?auto_159247 - BLOCK
      ?auto_159248 - BLOCK
      ?auto_159249 - BLOCK
    )
    :vars
    (
      ?auto_159250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159242 ) ( ON ?auto_159243 ?auto_159242 ) ( ON ?auto_159244 ?auto_159243 ) ( ON ?auto_159245 ?auto_159244 ) ( not ( = ?auto_159242 ?auto_159243 ) ) ( not ( = ?auto_159242 ?auto_159244 ) ) ( not ( = ?auto_159242 ?auto_159245 ) ) ( not ( = ?auto_159242 ?auto_159246 ) ) ( not ( = ?auto_159242 ?auto_159247 ) ) ( not ( = ?auto_159242 ?auto_159248 ) ) ( not ( = ?auto_159242 ?auto_159249 ) ) ( not ( = ?auto_159243 ?auto_159244 ) ) ( not ( = ?auto_159243 ?auto_159245 ) ) ( not ( = ?auto_159243 ?auto_159246 ) ) ( not ( = ?auto_159243 ?auto_159247 ) ) ( not ( = ?auto_159243 ?auto_159248 ) ) ( not ( = ?auto_159243 ?auto_159249 ) ) ( not ( = ?auto_159244 ?auto_159245 ) ) ( not ( = ?auto_159244 ?auto_159246 ) ) ( not ( = ?auto_159244 ?auto_159247 ) ) ( not ( = ?auto_159244 ?auto_159248 ) ) ( not ( = ?auto_159244 ?auto_159249 ) ) ( not ( = ?auto_159245 ?auto_159246 ) ) ( not ( = ?auto_159245 ?auto_159247 ) ) ( not ( = ?auto_159245 ?auto_159248 ) ) ( not ( = ?auto_159245 ?auto_159249 ) ) ( not ( = ?auto_159246 ?auto_159247 ) ) ( not ( = ?auto_159246 ?auto_159248 ) ) ( not ( = ?auto_159246 ?auto_159249 ) ) ( not ( = ?auto_159247 ?auto_159248 ) ) ( not ( = ?auto_159247 ?auto_159249 ) ) ( not ( = ?auto_159248 ?auto_159249 ) ) ( ON ?auto_159249 ?auto_159250 ) ( not ( = ?auto_159242 ?auto_159250 ) ) ( not ( = ?auto_159243 ?auto_159250 ) ) ( not ( = ?auto_159244 ?auto_159250 ) ) ( not ( = ?auto_159245 ?auto_159250 ) ) ( not ( = ?auto_159246 ?auto_159250 ) ) ( not ( = ?auto_159247 ?auto_159250 ) ) ( not ( = ?auto_159248 ?auto_159250 ) ) ( not ( = ?auto_159249 ?auto_159250 ) ) ( ON ?auto_159248 ?auto_159249 ) ( ON-TABLE ?auto_159250 ) ( ON ?auto_159247 ?auto_159248 ) ( CLEAR ?auto_159245 ) ( ON ?auto_159246 ?auto_159247 ) ( CLEAR ?auto_159246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159250 ?auto_159249 ?auto_159248 ?auto_159247 )
      ( MAKE-8PILE ?auto_159242 ?auto_159243 ?auto_159244 ?auto_159245 ?auto_159246 ?auto_159247 ?auto_159248 ?auto_159249 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159251 - BLOCK
      ?auto_159252 - BLOCK
      ?auto_159253 - BLOCK
      ?auto_159254 - BLOCK
      ?auto_159255 - BLOCK
      ?auto_159256 - BLOCK
      ?auto_159257 - BLOCK
      ?auto_159258 - BLOCK
    )
    :vars
    (
      ?auto_159259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159251 ) ( ON ?auto_159252 ?auto_159251 ) ( ON ?auto_159253 ?auto_159252 ) ( not ( = ?auto_159251 ?auto_159252 ) ) ( not ( = ?auto_159251 ?auto_159253 ) ) ( not ( = ?auto_159251 ?auto_159254 ) ) ( not ( = ?auto_159251 ?auto_159255 ) ) ( not ( = ?auto_159251 ?auto_159256 ) ) ( not ( = ?auto_159251 ?auto_159257 ) ) ( not ( = ?auto_159251 ?auto_159258 ) ) ( not ( = ?auto_159252 ?auto_159253 ) ) ( not ( = ?auto_159252 ?auto_159254 ) ) ( not ( = ?auto_159252 ?auto_159255 ) ) ( not ( = ?auto_159252 ?auto_159256 ) ) ( not ( = ?auto_159252 ?auto_159257 ) ) ( not ( = ?auto_159252 ?auto_159258 ) ) ( not ( = ?auto_159253 ?auto_159254 ) ) ( not ( = ?auto_159253 ?auto_159255 ) ) ( not ( = ?auto_159253 ?auto_159256 ) ) ( not ( = ?auto_159253 ?auto_159257 ) ) ( not ( = ?auto_159253 ?auto_159258 ) ) ( not ( = ?auto_159254 ?auto_159255 ) ) ( not ( = ?auto_159254 ?auto_159256 ) ) ( not ( = ?auto_159254 ?auto_159257 ) ) ( not ( = ?auto_159254 ?auto_159258 ) ) ( not ( = ?auto_159255 ?auto_159256 ) ) ( not ( = ?auto_159255 ?auto_159257 ) ) ( not ( = ?auto_159255 ?auto_159258 ) ) ( not ( = ?auto_159256 ?auto_159257 ) ) ( not ( = ?auto_159256 ?auto_159258 ) ) ( not ( = ?auto_159257 ?auto_159258 ) ) ( ON ?auto_159258 ?auto_159259 ) ( not ( = ?auto_159251 ?auto_159259 ) ) ( not ( = ?auto_159252 ?auto_159259 ) ) ( not ( = ?auto_159253 ?auto_159259 ) ) ( not ( = ?auto_159254 ?auto_159259 ) ) ( not ( = ?auto_159255 ?auto_159259 ) ) ( not ( = ?auto_159256 ?auto_159259 ) ) ( not ( = ?auto_159257 ?auto_159259 ) ) ( not ( = ?auto_159258 ?auto_159259 ) ) ( ON ?auto_159257 ?auto_159258 ) ( ON-TABLE ?auto_159259 ) ( ON ?auto_159256 ?auto_159257 ) ( ON ?auto_159255 ?auto_159256 ) ( CLEAR ?auto_159255 ) ( HOLDING ?auto_159254 ) ( CLEAR ?auto_159253 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159251 ?auto_159252 ?auto_159253 ?auto_159254 )
      ( MAKE-8PILE ?auto_159251 ?auto_159252 ?auto_159253 ?auto_159254 ?auto_159255 ?auto_159256 ?auto_159257 ?auto_159258 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159260 - BLOCK
      ?auto_159261 - BLOCK
      ?auto_159262 - BLOCK
      ?auto_159263 - BLOCK
      ?auto_159264 - BLOCK
      ?auto_159265 - BLOCK
      ?auto_159266 - BLOCK
      ?auto_159267 - BLOCK
    )
    :vars
    (
      ?auto_159268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159260 ) ( ON ?auto_159261 ?auto_159260 ) ( ON ?auto_159262 ?auto_159261 ) ( not ( = ?auto_159260 ?auto_159261 ) ) ( not ( = ?auto_159260 ?auto_159262 ) ) ( not ( = ?auto_159260 ?auto_159263 ) ) ( not ( = ?auto_159260 ?auto_159264 ) ) ( not ( = ?auto_159260 ?auto_159265 ) ) ( not ( = ?auto_159260 ?auto_159266 ) ) ( not ( = ?auto_159260 ?auto_159267 ) ) ( not ( = ?auto_159261 ?auto_159262 ) ) ( not ( = ?auto_159261 ?auto_159263 ) ) ( not ( = ?auto_159261 ?auto_159264 ) ) ( not ( = ?auto_159261 ?auto_159265 ) ) ( not ( = ?auto_159261 ?auto_159266 ) ) ( not ( = ?auto_159261 ?auto_159267 ) ) ( not ( = ?auto_159262 ?auto_159263 ) ) ( not ( = ?auto_159262 ?auto_159264 ) ) ( not ( = ?auto_159262 ?auto_159265 ) ) ( not ( = ?auto_159262 ?auto_159266 ) ) ( not ( = ?auto_159262 ?auto_159267 ) ) ( not ( = ?auto_159263 ?auto_159264 ) ) ( not ( = ?auto_159263 ?auto_159265 ) ) ( not ( = ?auto_159263 ?auto_159266 ) ) ( not ( = ?auto_159263 ?auto_159267 ) ) ( not ( = ?auto_159264 ?auto_159265 ) ) ( not ( = ?auto_159264 ?auto_159266 ) ) ( not ( = ?auto_159264 ?auto_159267 ) ) ( not ( = ?auto_159265 ?auto_159266 ) ) ( not ( = ?auto_159265 ?auto_159267 ) ) ( not ( = ?auto_159266 ?auto_159267 ) ) ( ON ?auto_159267 ?auto_159268 ) ( not ( = ?auto_159260 ?auto_159268 ) ) ( not ( = ?auto_159261 ?auto_159268 ) ) ( not ( = ?auto_159262 ?auto_159268 ) ) ( not ( = ?auto_159263 ?auto_159268 ) ) ( not ( = ?auto_159264 ?auto_159268 ) ) ( not ( = ?auto_159265 ?auto_159268 ) ) ( not ( = ?auto_159266 ?auto_159268 ) ) ( not ( = ?auto_159267 ?auto_159268 ) ) ( ON ?auto_159266 ?auto_159267 ) ( ON-TABLE ?auto_159268 ) ( ON ?auto_159265 ?auto_159266 ) ( ON ?auto_159264 ?auto_159265 ) ( CLEAR ?auto_159262 ) ( ON ?auto_159263 ?auto_159264 ) ( CLEAR ?auto_159263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159268 ?auto_159267 ?auto_159266 ?auto_159265 ?auto_159264 )
      ( MAKE-8PILE ?auto_159260 ?auto_159261 ?auto_159262 ?auto_159263 ?auto_159264 ?auto_159265 ?auto_159266 ?auto_159267 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159269 - BLOCK
      ?auto_159270 - BLOCK
      ?auto_159271 - BLOCK
      ?auto_159272 - BLOCK
      ?auto_159273 - BLOCK
      ?auto_159274 - BLOCK
      ?auto_159275 - BLOCK
      ?auto_159276 - BLOCK
    )
    :vars
    (
      ?auto_159277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159269 ) ( ON ?auto_159270 ?auto_159269 ) ( not ( = ?auto_159269 ?auto_159270 ) ) ( not ( = ?auto_159269 ?auto_159271 ) ) ( not ( = ?auto_159269 ?auto_159272 ) ) ( not ( = ?auto_159269 ?auto_159273 ) ) ( not ( = ?auto_159269 ?auto_159274 ) ) ( not ( = ?auto_159269 ?auto_159275 ) ) ( not ( = ?auto_159269 ?auto_159276 ) ) ( not ( = ?auto_159270 ?auto_159271 ) ) ( not ( = ?auto_159270 ?auto_159272 ) ) ( not ( = ?auto_159270 ?auto_159273 ) ) ( not ( = ?auto_159270 ?auto_159274 ) ) ( not ( = ?auto_159270 ?auto_159275 ) ) ( not ( = ?auto_159270 ?auto_159276 ) ) ( not ( = ?auto_159271 ?auto_159272 ) ) ( not ( = ?auto_159271 ?auto_159273 ) ) ( not ( = ?auto_159271 ?auto_159274 ) ) ( not ( = ?auto_159271 ?auto_159275 ) ) ( not ( = ?auto_159271 ?auto_159276 ) ) ( not ( = ?auto_159272 ?auto_159273 ) ) ( not ( = ?auto_159272 ?auto_159274 ) ) ( not ( = ?auto_159272 ?auto_159275 ) ) ( not ( = ?auto_159272 ?auto_159276 ) ) ( not ( = ?auto_159273 ?auto_159274 ) ) ( not ( = ?auto_159273 ?auto_159275 ) ) ( not ( = ?auto_159273 ?auto_159276 ) ) ( not ( = ?auto_159274 ?auto_159275 ) ) ( not ( = ?auto_159274 ?auto_159276 ) ) ( not ( = ?auto_159275 ?auto_159276 ) ) ( ON ?auto_159276 ?auto_159277 ) ( not ( = ?auto_159269 ?auto_159277 ) ) ( not ( = ?auto_159270 ?auto_159277 ) ) ( not ( = ?auto_159271 ?auto_159277 ) ) ( not ( = ?auto_159272 ?auto_159277 ) ) ( not ( = ?auto_159273 ?auto_159277 ) ) ( not ( = ?auto_159274 ?auto_159277 ) ) ( not ( = ?auto_159275 ?auto_159277 ) ) ( not ( = ?auto_159276 ?auto_159277 ) ) ( ON ?auto_159275 ?auto_159276 ) ( ON-TABLE ?auto_159277 ) ( ON ?auto_159274 ?auto_159275 ) ( ON ?auto_159273 ?auto_159274 ) ( ON ?auto_159272 ?auto_159273 ) ( CLEAR ?auto_159272 ) ( HOLDING ?auto_159271 ) ( CLEAR ?auto_159270 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159269 ?auto_159270 ?auto_159271 )
      ( MAKE-8PILE ?auto_159269 ?auto_159270 ?auto_159271 ?auto_159272 ?auto_159273 ?auto_159274 ?auto_159275 ?auto_159276 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159278 - BLOCK
      ?auto_159279 - BLOCK
      ?auto_159280 - BLOCK
      ?auto_159281 - BLOCK
      ?auto_159282 - BLOCK
      ?auto_159283 - BLOCK
      ?auto_159284 - BLOCK
      ?auto_159285 - BLOCK
    )
    :vars
    (
      ?auto_159286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159278 ) ( ON ?auto_159279 ?auto_159278 ) ( not ( = ?auto_159278 ?auto_159279 ) ) ( not ( = ?auto_159278 ?auto_159280 ) ) ( not ( = ?auto_159278 ?auto_159281 ) ) ( not ( = ?auto_159278 ?auto_159282 ) ) ( not ( = ?auto_159278 ?auto_159283 ) ) ( not ( = ?auto_159278 ?auto_159284 ) ) ( not ( = ?auto_159278 ?auto_159285 ) ) ( not ( = ?auto_159279 ?auto_159280 ) ) ( not ( = ?auto_159279 ?auto_159281 ) ) ( not ( = ?auto_159279 ?auto_159282 ) ) ( not ( = ?auto_159279 ?auto_159283 ) ) ( not ( = ?auto_159279 ?auto_159284 ) ) ( not ( = ?auto_159279 ?auto_159285 ) ) ( not ( = ?auto_159280 ?auto_159281 ) ) ( not ( = ?auto_159280 ?auto_159282 ) ) ( not ( = ?auto_159280 ?auto_159283 ) ) ( not ( = ?auto_159280 ?auto_159284 ) ) ( not ( = ?auto_159280 ?auto_159285 ) ) ( not ( = ?auto_159281 ?auto_159282 ) ) ( not ( = ?auto_159281 ?auto_159283 ) ) ( not ( = ?auto_159281 ?auto_159284 ) ) ( not ( = ?auto_159281 ?auto_159285 ) ) ( not ( = ?auto_159282 ?auto_159283 ) ) ( not ( = ?auto_159282 ?auto_159284 ) ) ( not ( = ?auto_159282 ?auto_159285 ) ) ( not ( = ?auto_159283 ?auto_159284 ) ) ( not ( = ?auto_159283 ?auto_159285 ) ) ( not ( = ?auto_159284 ?auto_159285 ) ) ( ON ?auto_159285 ?auto_159286 ) ( not ( = ?auto_159278 ?auto_159286 ) ) ( not ( = ?auto_159279 ?auto_159286 ) ) ( not ( = ?auto_159280 ?auto_159286 ) ) ( not ( = ?auto_159281 ?auto_159286 ) ) ( not ( = ?auto_159282 ?auto_159286 ) ) ( not ( = ?auto_159283 ?auto_159286 ) ) ( not ( = ?auto_159284 ?auto_159286 ) ) ( not ( = ?auto_159285 ?auto_159286 ) ) ( ON ?auto_159284 ?auto_159285 ) ( ON-TABLE ?auto_159286 ) ( ON ?auto_159283 ?auto_159284 ) ( ON ?auto_159282 ?auto_159283 ) ( ON ?auto_159281 ?auto_159282 ) ( CLEAR ?auto_159279 ) ( ON ?auto_159280 ?auto_159281 ) ( CLEAR ?auto_159280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159286 ?auto_159285 ?auto_159284 ?auto_159283 ?auto_159282 ?auto_159281 )
      ( MAKE-8PILE ?auto_159278 ?auto_159279 ?auto_159280 ?auto_159281 ?auto_159282 ?auto_159283 ?auto_159284 ?auto_159285 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159287 - BLOCK
      ?auto_159288 - BLOCK
      ?auto_159289 - BLOCK
      ?auto_159290 - BLOCK
      ?auto_159291 - BLOCK
      ?auto_159292 - BLOCK
      ?auto_159293 - BLOCK
      ?auto_159294 - BLOCK
    )
    :vars
    (
      ?auto_159295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159287 ) ( not ( = ?auto_159287 ?auto_159288 ) ) ( not ( = ?auto_159287 ?auto_159289 ) ) ( not ( = ?auto_159287 ?auto_159290 ) ) ( not ( = ?auto_159287 ?auto_159291 ) ) ( not ( = ?auto_159287 ?auto_159292 ) ) ( not ( = ?auto_159287 ?auto_159293 ) ) ( not ( = ?auto_159287 ?auto_159294 ) ) ( not ( = ?auto_159288 ?auto_159289 ) ) ( not ( = ?auto_159288 ?auto_159290 ) ) ( not ( = ?auto_159288 ?auto_159291 ) ) ( not ( = ?auto_159288 ?auto_159292 ) ) ( not ( = ?auto_159288 ?auto_159293 ) ) ( not ( = ?auto_159288 ?auto_159294 ) ) ( not ( = ?auto_159289 ?auto_159290 ) ) ( not ( = ?auto_159289 ?auto_159291 ) ) ( not ( = ?auto_159289 ?auto_159292 ) ) ( not ( = ?auto_159289 ?auto_159293 ) ) ( not ( = ?auto_159289 ?auto_159294 ) ) ( not ( = ?auto_159290 ?auto_159291 ) ) ( not ( = ?auto_159290 ?auto_159292 ) ) ( not ( = ?auto_159290 ?auto_159293 ) ) ( not ( = ?auto_159290 ?auto_159294 ) ) ( not ( = ?auto_159291 ?auto_159292 ) ) ( not ( = ?auto_159291 ?auto_159293 ) ) ( not ( = ?auto_159291 ?auto_159294 ) ) ( not ( = ?auto_159292 ?auto_159293 ) ) ( not ( = ?auto_159292 ?auto_159294 ) ) ( not ( = ?auto_159293 ?auto_159294 ) ) ( ON ?auto_159294 ?auto_159295 ) ( not ( = ?auto_159287 ?auto_159295 ) ) ( not ( = ?auto_159288 ?auto_159295 ) ) ( not ( = ?auto_159289 ?auto_159295 ) ) ( not ( = ?auto_159290 ?auto_159295 ) ) ( not ( = ?auto_159291 ?auto_159295 ) ) ( not ( = ?auto_159292 ?auto_159295 ) ) ( not ( = ?auto_159293 ?auto_159295 ) ) ( not ( = ?auto_159294 ?auto_159295 ) ) ( ON ?auto_159293 ?auto_159294 ) ( ON-TABLE ?auto_159295 ) ( ON ?auto_159292 ?auto_159293 ) ( ON ?auto_159291 ?auto_159292 ) ( ON ?auto_159290 ?auto_159291 ) ( ON ?auto_159289 ?auto_159290 ) ( CLEAR ?auto_159289 ) ( HOLDING ?auto_159288 ) ( CLEAR ?auto_159287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159287 ?auto_159288 )
      ( MAKE-8PILE ?auto_159287 ?auto_159288 ?auto_159289 ?auto_159290 ?auto_159291 ?auto_159292 ?auto_159293 ?auto_159294 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159296 - BLOCK
      ?auto_159297 - BLOCK
      ?auto_159298 - BLOCK
      ?auto_159299 - BLOCK
      ?auto_159300 - BLOCK
      ?auto_159301 - BLOCK
      ?auto_159302 - BLOCK
      ?auto_159303 - BLOCK
    )
    :vars
    (
      ?auto_159304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159296 ) ( not ( = ?auto_159296 ?auto_159297 ) ) ( not ( = ?auto_159296 ?auto_159298 ) ) ( not ( = ?auto_159296 ?auto_159299 ) ) ( not ( = ?auto_159296 ?auto_159300 ) ) ( not ( = ?auto_159296 ?auto_159301 ) ) ( not ( = ?auto_159296 ?auto_159302 ) ) ( not ( = ?auto_159296 ?auto_159303 ) ) ( not ( = ?auto_159297 ?auto_159298 ) ) ( not ( = ?auto_159297 ?auto_159299 ) ) ( not ( = ?auto_159297 ?auto_159300 ) ) ( not ( = ?auto_159297 ?auto_159301 ) ) ( not ( = ?auto_159297 ?auto_159302 ) ) ( not ( = ?auto_159297 ?auto_159303 ) ) ( not ( = ?auto_159298 ?auto_159299 ) ) ( not ( = ?auto_159298 ?auto_159300 ) ) ( not ( = ?auto_159298 ?auto_159301 ) ) ( not ( = ?auto_159298 ?auto_159302 ) ) ( not ( = ?auto_159298 ?auto_159303 ) ) ( not ( = ?auto_159299 ?auto_159300 ) ) ( not ( = ?auto_159299 ?auto_159301 ) ) ( not ( = ?auto_159299 ?auto_159302 ) ) ( not ( = ?auto_159299 ?auto_159303 ) ) ( not ( = ?auto_159300 ?auto_159301 ) ) ( not ( = ?auto_159300 ?auto_159302 ) ) ( not ( = ?auto_159300 ?auto_159303 ) ) ( not ( = ?auto_159301 ?auto_159302 ) ) ( not ( = ?auto_159301 ?auto_159303 ) ) ( not ( = ?auto_159302 ?auto_159303 ) ) ( ON ?auto_159303 ?auto_159304 ) ( not ( = ?auto_159296 ?auto_159304 ) ) ( not ( = ?auto_159297 ?auto_159304 ) ) ( not ( = ?auto_159298 ?auto_159304 ) ) ( not ( = ?auto_159299 ?auto_159304 ) ) ( not ( = ?auto_159300 ?auto_159304 ) ) ( not ( = ?auto_159301 ?auto_159304 ) ) ( not ( = ?auto_159302 ?auto_159304 ) ) ( not ( = ?auto_159303 ?auto_159304 ) ) ( ON ?auto_159302 ?auto_159303 ) ( ON-TABLE ?auto_159304 ) ( ON ?auto_159301 ?auto_159302 ) ( ON ?auto_159300 ?auto_159301 ) ( ON ?auto_159299 ?auto_159300 ) ( ON ?auto_159298 ?auto_159299 ) ( CLEAR ?auto_159296 ) ( ON ?auto_159297 ?auto_159298 ) ( CLEAR ?auto_159297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159304 ?auto_159303 ?auto_159302 ?auto_159301 ?auto_159300 ?auto_159299 ?auto_159298 )
      ( MAKE-8PILE ?auto_159296 ?auto_159297 ?auto_159298 ?auto_159299 ?auto_159300 ?auto_159301 ?auto_159302 ?auto_159303 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159305 - BLOCK
      ?auto_159306 - BLOCK
      ?auto_159307 - BLOCK
      ?auto_159308 - BLOCK
      ?auto_159309 - BLOCK
      ?auto_159310 - BLOCK
      ?auto_159311 - BLOCK
      ?auto_159312 - BLOCK
    )
    :vars
    (
      ?auto_159313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159305 ?auto_159306 ) ) ( not ( = ?auto_159305 ?auto_159307 ) ) ( not ( = ?auto_159305 ?auto_159308 ) ) ( not ( = ?auto_159305 ?auto_159309 ) ) ( not ( = ?auto_159305 ?auto_159310 ) ) ( not ( = ?auto_159305 ?auto_159311 ) ) ( not ( = ?auto_159305 ?auto_159312 ) ) ( not ( = ?auto_159306 ?auto_159307 ) ) ( not ( = ?auto_159306 ?auto_159308 ) ) ( not ( = ?auto_159306 ?auto_159309 ) ) ( not ( = ?auto_159306 ?auto_159310 ) ) ( not ( = ?auto_159306 ?auto_159311 ) ) ( not ( = ?auto_159306 ?auto_159312 ) ) ( not ( = ?auto_159307 ?auto_159308 ) ) ( not ( = ?auto_159307 ?auto_159309 ) ) ( not ( = ?auto_159307 ?auto_159310 ) ) ( not ( = ?auto_159307 ?auto_159311 ) ) ( not ( = ?auto_159307 ?auto_159312 ) ) ( not ( = ?auto_159308 ?auto_159309 ) ) ( not ( = ?auto_159308 ?auto_159310 ) ) ( not ( = ?auto_159308 ?auto_159311 ) ) ( not ( = ?auto_159308 ?auto_159312 ) ) ( not ( = ?auto_159309 ?auto_159310 ) ) ( not ( = ?auto_159309 ?auto_159311 ) ) ( not ( = ?auto_159309 ?auto_159312 ) ) ( not ( = ?auto_159310 ?auto_159311 ) ) ( not ( = ?auto_159310 ?auto_159312 ) ) ( not ( = ?auto_159311 ?auto_159312 ) ) ( ON ?auto_159312 ?auto_159313 ) ( not ( = ?auto_159305 ?auto_159313 ) ) ( not ( = ?auto_159306 ?auto_159313 ) ) ( not ( = ?auto_159307 ?auto_159313 ) ) ( not ( = ?auto_159308 ?auto_159313 ) ) ( not ( = ?auto_159309 ?auto_159313 ) ) ( not ( = ?auto_159310 ?auto_159313 ) ) ( not ( = ?auto_159311 ?auto_159313 ) ) ( not ( = ?auto_159312 ?auto_159313 ) ) ( ON ?auto_159311 ?auto_159312 ) ( ON-TABLE ?auto_159313 ) ( ON ?auto_159310 ?auto_159311 ) ( ON ?auto_159309 ?auto_159310 ) ( ON ?auto_159308 ?auto_159309 ) ( ON ?auto_159307 ?auto_159308 ) ( ON ?auto_159306 ?auto_159307 ) ( CLEAR ?auto_159306 ) ( HOLDING ?auto_159305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159305 )
      ( MAKE-8PILE ?auto_159305 ?auto_159306 ?auto_159307 ?auto_159308 ?auto_159309 ?auto_159310 ?auto_159311 ?auto_159312 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_159314 - BLOCK
      ?auto_159315 - BLOCK
      ?auto_159316 - BLOCK
      ?auto_159317 - BLOCK
      ?auto_159318 - BLOCK
      ?auto_159319 - BLOCK
      ?auto_159320 - BLOCK
      ?auto_159321 - BLOCK
    )
    :vars
    (
      ?auto_159322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159314 ?auto_159315 ) ) ( not ( = ?auto_159314 ?auto_159316 ) ) ( not ( = ?auto_159314 ?auto_159317 ) ) ( not ( = ?auto_159314 ?auto_159318 ) ) ( not ( = ?auto_159314 ?auto_159319 ) ) ( not ( = ?auto_159314 ?auto_159320 ) ) ( not ( = ?auto_159314 ?auto_159321 ) ) ( not ( = ?auto_159315 ?auto_159316 ) ) ( not ( = ?auto_159315 ?auto_159317 ) ) ( not ( = ?auto_159315 ?auto_159318 ) ) ( not ( = ?auto_159315 ?auto_159319 ) ) ( not ( = ?auto_159315 ?auto_159320 ) ) ( not ( = ?auto_159315 ?auto_159321 ) ) ( not ( = ?auto_159316 ?auto_159317 ) ) ( not ( = ?auto_159316 ?auto_159318 ) ) ( not ( = ?auto_159316 ?auto_159319 ) ) ( not ( = ?auto_159316 ?auto_159320 ) ) ( not ( = ?auto_159316 ?auto_159321 ) ) ( not ( = ?auto_159317 ?auto_159318 ) ) ( not ( = ?auto_159317 ?auto_159319 ) ) ( not ( = ?auto_159317 ?auto_159320 ) ) ( not ( = ?auto_159317 ?auto_159321 ) ) ( not ( = ?auto_159318 ?auto_159319 ) ) ( not ( = ?auto_159318 ?auto_159320 ) ) ( not ( = ?auto_159318 ?auto_159321 ) ) ( not ( = ?auto_159319 ?auto_159320 ) ) ( not ( = ?auto_159319 ?auto_159321 ) ) ( not ( = ?auto_159320 ?auto_159321 ) ) ( ON ?auto_159321 ?auto_159322 ) ( not ( = ?auto_159314 ?auto_159322 ) ) ( not ( = ?auto_159315 ?auto_159322 ) ) ( not ( = ?auto_159316 ?auto_159322 ) ) ( not ( = ?auto_159317 ?auto_159322 ) ) ( not ( = ?auto_159318 ?auto_159322 ) ) ( not ( = ?auto_159319 ?auto_159322 ) ) ( not ( = ?auto_159320 ?auto_159322 ) ) ( not ( = ?auto_159321 ?auto_159322 ) ) ( ON ?auto_159320 ?auto_159321 ) ( ON-TABLE ?auto_159322 ) ( ON ?auto_159319 ?auto_159320 ) ( ON ?auto_159318 ?auto_159319 ) ( ON ?auto_159317 ?auto_159318 ) ( ON ?auto_159316 ?auto_159317 ) ( ON ?auto_159315 ?auto_159316 ) ( ON ?auto_159314 ?auto_159315 ) ( CLEAR ?auto_159314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159322 ?auto_159321 ?auto_159320 ?auto_159319 ?auto_159318 ?auto_159317 ?auto_159316 ?auto_159315 )
      ( MAKE-8PILE ?auto_159314 ?auto_159315 ?auto_159316 ?auto_159317 ?auto_159318 ?auto_159319 ?auto_159320 ?auto_159321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159330 - BLOCK
      ?auto_159331 - BLOCK
      ?auto_159332 - BLOCK
      ?auto_159333 - BLOCK
      ?auto_159334 - BLOCK
      ?auto_159335 - BLOCK
      ?auto_159336 - BLOCK
    )
    :vars
    (
      ?auto_159337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159337 ?auto_159336 ) ( CLEAR ?auto_159337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159330 ) ( ON ?auto_159331 ?auto_159330 ) ( ON ?auto_159332 ?auto_159331 ) ( ON ?auto_159333 ?auto_159332 ) ( ON ?auto_159334 ?auto_159333 ) ( ON ?auto_159335 ?auto_159334 ) ( ON ?auto_159336 ?auto_159335 ) ( not ( = ?auto_159330 ?auto_159331 ) ) ( not ( = ?auto_159330 ?auto_159332 ) ) ( not ( = ?auto_159330 ?auto_159333 ) ) ( not ( = ?auto_159330 ?auto_159334 ) ) ( not ( = ?auto_159330 ?auto_159335 ) ) ( not ( = ?auto_159330 ?auto_159336 ) ) ( not ( = ?auto_159330 ?auto_159337 ) ) ( not ( = ?auto_159331 ?auto_159332 ) ) ( not ( = ?auto_159331 ?auto_159333 ) ) ( not ( = ?auto_159331 ?auto_159334 ) ) ( not ( = ?auto_159331 ?auto_159335 ) ) ( not ( = ?auto_159331 ?auto_159336 ) ) ( not ( = ?auto_159331 ?auto_159337 ) ) ( not ( = ?auto_159332 ?auto_159333 ) ) ( not ( = ?auto_159332 ?auto_159334 ) ) ( not ( = ?auto_159332 ?auto_159335 ) ) ( not ( = ?auto_159332 ?auto_159336 ) ) ( not ( = ?auto_159332 ?auto_159337 ) ) ( not ( = ?auto_159333 ?auto_159334 ) ) ( not ( = ?auto_159333 ?auto_159335 ) ) ( not ( = ?auto_159333 ?auto_159336 ) ) ( not ( = ?auto_159333 ?auto_159337 ) ) ( not ( = ?auto_159334 ?auto_159335 ) ) ( not ( = ?auto_159334 ?auto_159336 ) ) ( not ( = ?auto_159334 ?auto_159337 ) ) ( not ( = ?auto_159335 ?auto_159336 ) ) ( not ( = ?auto_159335 ?auto_159337 ) ) ( not ( = ?auto_159336 ?auto_159337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159337 ?auto_159336 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159355 - BLOCK
      ?auto_159356 - BLOCK
      ?auto_159357 - BLOCK
      ?auto_159358 - BLOCK
      ?auto_159359 - BLOCK
      ?auto_159360 - BLOCK
      ?auto_159361 - BLOCK
    )
    :vars
    (
      ?auto_159362 - BLOCK
      ?auto_159363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159355 ) ( ON ?auto_159356 ?auto_159355 ) ( ON ?auto_159357 ?auto_159356 ) ( ON ?auto_159358 ?auto_159357 ) ( ON ?auto_159359 ?auto_159358 ) ( ON ?auto_159360 ?auto_159359 ) ( not ( = ?auto_159355 ?auto_159356 ) ) ( not ( = ?auto_159355 ?auto_159357 ) ) ( not ( = ?auto_159355 ?auto_159358 ) ) ( not ( = ?auto_159355 ?auto_159359 ) ) ( not ( = ?auto_159355 ?auto_159360 ) ) ( not ( = ?auto_159355 ?auto_159361 ) ) ( not ( = ?auto_159355 ?auto_159362 ) ) ( not ( = ?auto_159356 ?auto_159357 ) ) ( not ( = ?auto_159356 ?auto_159358 ) ) ( not ( = ?auto_159356 ?auto_159359 ) ) ( not ( = ?auto_159356 ?auto_159360 ) ) ( not ( = ?auto_159356 ?auto_159361 ) ) ( not ( = ?auto_159356 ?auto_159362 ) ) ( not ( = ?auto_159357 ?auto_159358 ) ) ( not ( = ?auto_159357 ?auto_159359 ) ) ( not ( = ?auto_159357 ?auto_159360 ) ) ( not ( = ?auto_159357 ?auto_159361 ) ) ( not ( = ?auto_159357 ?auto_159362 ) ) ( not ( = ?auto_159358 ?auto_159359 ) ) ( not ( = ?auto_159358 ?auto_159360 ) ) ( not ( = ?auto_159358 ?auto_159361 ) ) ( not ( = ?auto_159358 ?auto_159362 ) ) ( not ( = ?auto_159359 ?auto_159360 ) ) ( not ( = ?auto_159359 ?auto_159361 ) ) ( not ( = ?auto_159359 ?auto_159362 ) ) ( not ( = ?auto_159360 ?auto_159361 ) ) ( not ( = ?auto_159360 ?auto_159362 ) ) ( not ( = ?auto_159361 ?auto_159362 ) ) ( ON ?auto_159362 ?auto_159363 ) ( CLEAR ?auto_159362 ) ( not ( = ?auto_159355 ?auto_159363 ) ) ( not ( = ?auto_159356 ?auto_159363 ) ) ( not ( = ?auto_159357 ?auto_159363 ) ) ( not ( = ?auto_159358 ?auto_159363 ) ) ( not ( = ?auto_159359 ?auto_159363 ) ) ( not ( = ?auto_159360 ?auto_159363 ) ) ( not ( = ?auto_159361 ?auto_159363 ) ) ( not ( = ?auto_159362 ?auto_159363 ) ) ( HOLDING ?auto_159361 ) ( CLEAR ?auto_159360 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159355 ?auto_159356 ?auto_159357 ?auto_159358 ?auto_159359 ?auto_159360 ?auto_159361 ?auto_159362 )
      ( MAKE-7PILE ?auto_159355 ?auto_159356 ?auto_159357 ?auto_159358 ?auto_159359 ?auto_159360 ?auto_159361 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159364 - BLOCK
      ?auto_159365 - BLOCK
      ?auto_159366 - BLOCK
      ?auto_159367 - BLOCK
      ?auto_159368 - BLOCK
      ?auto_159369 - BLOCK
      ?auto_159370 - BLOCK
    )
    :vars
    (
      ?auto_159371 - BLOCK
      ?auto_159372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159364 ) ( ON ?auto_159365 ?auto_159364 ) ( ON ?auto_159366 ?auto_159365 ) ( ON ?auto_159367 ?auto_159366 ) ( ON ?auto_159368 ?auto_159367 ) ( ON ?auto_159369 ?auto_159368 ) ( not ( = ?auto_159364 ?auto_159365 ) ) ( not ( = ?auto_159364 ?auto_159366 ) ) ( not ( = ?auto_159364 ?auto_159367 ) ) ( not ( = ?auto_159364 ?auto_159368 ) ) ( not ( = ?auto_159364 ?auto_159369 ) ) ( not ( = ?auto_159364 ?auto_159370 ) ) ( not ( = ?auto_159364 ?auto_159371 ) ) ( not ( = ?auto_159365 ?auto_159366 ) ) ( not ( = ?auto_159365 ?auto_159367 ) ) ( not ( = ?auto_159365 ?auto_159368 ) ) ( not ( = ?auto_159365 ?auto_159369 ) ) ( not ( = ?auto_159365 ?auto_159370 ) ) ( not ( = ?auto_159365 ?auto_159371 ) ) ( not ( = ?auto_159366 ?auto_159367 ) ) ( not ( = ?auto_159366 ?auto_159368 ) ) ( not ( = ?auto_159366 ?auto_159369 ) ) ( not ( = ?auto_159366 ?auto_159370 ) ) ( not ( = ?auto_159366 ?auto_159371 ) ) ( not ( = ?auto_159367 ?auto_159368 ) ) ( not ( = ?auto_159367 ?auto_159369 ) ) ( not ( = ?auto_159367 ?auto_159370 ) ) ( not ( = ?auto_159367 ?auto_159371 ) ) ( not ( = ?auto_159368 ?auto_159369 ) ) ( not ( = ?auto_159368 ?auto_159370 ) ) ( not ( = ?auto_159368 ?auto_159371 ) ) ( not ( = ?auto_159369 ?auto_159370 ) ) ( not ( = ?auto_159369 ?auto_159371 ) ) ( not ( = ?auto_159370 ?auto_159371 ) ) ( ON ?auto_159371 ?auto_159372 ) ( not ( = ?auto_159364 ?auto_159372 ) ) ( not ( = ?auto_159365 ?auto_159372 ) ) ( not ( = ?auto_159366 ?auto_159372 ) ) ( not ( = ?auto_159367 ?auto_159372 ) ) ( not ( = ?auto_159368 ?auto_159372 ) ) ( not ( = ?auto_159369 ?auto_159372 ) ) ( not ( = ?auto_159370 ?auto_159372 ) ) ( not ( = ?auto_159371 ?auto_159372 ) ) ( CLEAR ?auto_159369 ) ( ON ?auto_159370 ?auto_159371 ) ( CLEAR ?auto_159370 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159372 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159372 ?auto_159371 )
      ( MAKE-7PILE ?auto_159364 ?auto_159365 ?auto_159366 ?auto_159367 ?auto_159368 ?auto_159369 ?auto_159370 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159373 - BLOCK
      ?auto_159374 - BLOCK
      ?auto_159375 - BLOCK
      ?auto_159376 - BLOCK
      ?auto_159377 - BLOCK
      ?auto_159378 - BLOCK
      ?auto_159379 - BLOCK
    )
    :vars
    (
      ?auto_159380 - BLOCK
      ?auto_159381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159373 ) ( ON ?auto_159374 ?auto_159373 ) ( ON ?auto_159375 ?auto_159374 ) ( ON ?auto_159376 ?auto_159375 ) ( ON ?auto_159377 ?auto_159376 ) ( not ( = ?auto_159373 ?auto_159374 ) ) ( not ( = ?auto_159373 ?auto_159375 ) ) ( not ( = ?auto_159373 ?auto_159376 ) ) ( not ( = ?auto_159373 ?auto_159377 ) ) ( not ( = ?auto_159373 ?auto_159378 ) ) ( not ( = ?auto_159373 ?auto_159379 ) ) ( not ( = ?auto_159373 ?auto_159380 ) ) ( not ( = ?auto_159374 ?auto_159375 ) ) ( not ( = ?auto_159374 ?auto_159376 ) ) ( not ( = ?auto_159374 ?auto_159377 ) ) ( not ( = ?auto_159374 ?auto_159378 ) ) ( not ( = ?auto_159374 ?auto_159379 ) ) ( not ( = ?auto_159374 ?auto_159380 ) ) ( not ( = ?auto_159375 ?auto_159376 ) ) ( not ( = ?auto_159375 ?auto_159377 ) ) ( not ( = ?auto_159375 ?auto_159378 ) ) ( not ( = ?auto_159375 ?auto_159379 ) ) ( not ( = ?auto_159375 ?auto_159380 ) ) ( not ( = ?auto_159376 ?auto_159377 ) ) ( not ( = ?auto_159376 ?auto_159378 ) ) ( not ( = ?auto_159376 ?auto_159379 ) ) ( not ( = ?auto_159376 ?auto_159380 ) ) ( not ( = ?auto_159377 ?auto_159378 ) ) ( not ( = ?auto_159377 ?auto_159379 ) ) ( not ( = ?auto_159377 ?auto_159380 ) ) ( not ( = ?auto_159378 ?auto_159379 ) ) ( not ( = ?auto_159378 ?auto_159380 ) ) ( not ( = ?auto_159379 ?auto_159380 ) ) ( ON ?auto_159380 ?auto_159381 ) ( not ( = ?auto_159373 ?auto_159381 ) ) ( not ( = ?auto_159374 ?auto_159381 ) ) ( not ( = ?auto_159375 ?auto_159381 ) ) ( not ( = ?auto_159376 ?auto_159381 ) ) ( not ( = ?auto_159377 ?auto_159381 ) ) ( not ( = ?auto_159378 ?auto_159381 ) ) ( not ( = ?auto_159379 ?auto_159381 ) ) ( not ( = ?auto_159380 ?auto_159381 ) ) ( ON ?auto_159379 ?auto_159380 ) ( CLEAR ?auto_159379 ) ( ON-TABLE ?auto_159381 ) ( HOLDING ?auto_159378 ) ( CLEAR ?auto_159377 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159373 ?auto_159374 ?auto_159375 ?auto_159376 ?auto_159377 ?auto_159378 )
      ( MAKE-7PILE ?auto_159373 ?auto_159374 ?auto_159375 ?auto_159376 ?auto_159377 ?auto_159378 ?auto_159379 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159382 - BLOCK
      ?auto_159383 - BLOCK
      ?auto_159384 - BLOCK
      ?auto_159385 - BLOCK
      ?auto_159386 - BLOCK
      ?auto_159387 - BLOCK
      ?auto_159388 - BLOCK
    )
    :vars
    (
      ?auto_159389 - BLOCK
      ?auto_159390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159382 ) ( ON ?auto_159383 ?auto_159382 ) ( ON ?auto_159384 ?auto_159383 ) ( ON ?auto_159385 ?auto_159384 ) ( ON ?auto_159386 ?auto_159385 ) ( not ( = ?auto_159382 ?auto_159383 ) ) ( not ( = ?auto_159382 ?auto_159384 ) ) ( not ( = ?auto_159382 ?auto_159385 ) ) ( not ( = ?auto_159382 ?auto_159386 ) ) ( not ( = ?auto_159382 ?auto_159387 ) ) ( not ( = ?auto_159382 ?auto_159388 ) ) ( not ( = ?auto_159382 ?auto_159389 ) ) ( not ( = ?auto_159383 ?auto_159384 ) ) ( not ( = ?auto_159383 ?auto_159385 ) ) ( not ( = ?auto_159383 ?auto_159386 ) ) ( not ( = ?auto_159383 ?auto_159387 ) ) ( not ( = ?auto_159383 ?auto_159388 ) ) ( not ( = ?auto_159383 ?auto_159389 ) ) ( not ( = ?auto_159384 ?auto_159385 ) ) ( not ( = ?auto_159384 ?auto_159386 ) ) ( not ( = ?auto_159384 ?auto_159387 ) ) ( not ( = ?auto_159384 ?auto_159388 ) ) ( not ( = ?auto_159384 ?auto_159389 ) ) ( not ( = ?auto_159385 ?auto_159386 ) ) ( not ( = ?auto_159385 ?auto_159387 ) ) ( not ( = ?auto_159385 ?auto_159388 ) ) ( not ( = ?auto_159385 ?auto_159389 ) ) ( not ( = ?auto_159386 ?auto_159387 ) ) ( not ( = ?auto_159386 ?auto_159388 ) ) ( not ( = ?auto_159386 ?auto_159389 ) ) ( not ( = ?auto_159387 ?auto_159388 ) ) ( not ( = ?auto_159387 ?auto_159389 ) ) ( not ( = ?auto_159388 ?auto_159389 ) ) ( ON ?auto_159389 ?auto_159390 ) ( not ( = ?auto_159382 ?auto_159390 ) ) ( not ( = ?auto_159383 ?auto_159390 ) ) ( not ( = ?auto_159384 ?auto_159390 ) ) ( not ( = ?auto_159385 ?auto_159390 ) ) ( not ( = ?auto_159386 ?auto_159390 ) ) ( not ( = ?auto_159387 ?auto_159390 ) ) ( not ( = ?auto_159388 ?auto_159390 ) ) ( not ( = ?auto_159389 ?auto_159390 ) ) ( ON ?auto_159388 ?auto_159389 ) ( ON-TABLE ?auto_159390 ) ( CLEAR ?auto_159386 ) ( ON ?auto_159387 ?auto_159388 ) ( CLEAR ?auto_159387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159390 ?auto_159389 ?auto_159388 )
      ( MAKE-7PILE ?auto_159382 ?auto_159383 ?auto_159384 ?auto_159385 ?auto_159386 ?auto_159387 ?auto_159388 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159391 - BLOCK
      ?auto_159392 - BLOCK
      ?auto_159393 - BLOCK
      ?auto_159394 - BLOCK
      ?auto_159395 - BLOCK
      ?auto_159396 - BLOCK
      ?auto_159397 - BLOCK
    )
    :vars
    (
      ?auto_159398 - BLOCK
      ?auto_159399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159391 ) ( ON ?auto_159392 ?auto_159391 ) ( ON ?auto_159393 ?auto_159392 ) ( ON ?auto_159394 ?auto_159393 ) ( not ( = ?auto_159391 ?auto_159392 ) ) ( not ( = ?auto_159391 ?auto_159393 ) ) ( not ( = ?auto_159391 ?auto_159394 ) ) ( not ( = ?auto_159391 ?auto_159395 ) ) ( not ( = ?auto_159391 ?auto_159396 ) ) ( not ( = ?auto_159391 ?auto_159397 ) ) ( not ( = ?auto_159391 ?auto_159398 ) ) ( not ( = ?auto_159392 ?auto_159393 ) ) ( not ( = ?auto_159392 ?auto_159394 ) ) ( not ( = ?auto_159392 ?auto_159395 ) ) ( not ( = ?auto_159392 ?auto_159396 ) ) ( not ( = ?auto_159392 ?auto_159397 ) ) ( not ( = ?auto_159392 ?auto_159398 ) ) ( not ( = ?auto_159393 ?auto_159394 ) ) ( not ( = ?auto_159393 ?auto_159395 ) ) ( not ( = ?auto_159393 ?auto_159396 ) ) ( not ( = ?auto_159393 ?auto_159397 ) ) ( not ( = ?auto_159393 ?auto_159398 ) ) ( not ( = ?auto_159394 ?auto_159395 ) ) ( not ( = ?auto_159394 ?auto_159396 ) ) ( not ( = ?auto_159394 ?auto_159397 ) ) ( not ( = ?auto_159394 ?auto_159398 ) ) ( not ( = ?auto_159395 ?auto_159396 ) ) ( not ( = ?auto_159395 ?auto_159397 ) ) ( not ( = ?auto_159395 ?auto_159398 ) ) ( not ( = ?auto_159396 ?auto_159397 ) ) ( not ( = ?auto_159396 ?auto_159398 ) ) ( not ( = ?auto_159397 ?auto_159398 ) ) ( ON ?auto_159398 ?auto_159399 ) ( not ( = ?auto_159391 ?auto_159399 ) ) ( not ( = ?auto_159392 ?auto_159399 ) ) ( not ( = ?auto_159393 ?auto_159399 ) ) ( not ( = ?auto_159394 ?auto_159399 ) ) ( not ( = ?auto_159395 ?auto_159399 ) ) ( not ( = ?auto_159396 ?auto_159399 ) ) ( not ( = ?auto_159397 ?auto_159399 ) ) ( not ( = ?auto_159398 ?auto_159399 ) ) ( ON ?auto_159397 ?auto_159398 ) ( ON-TABLE ?auto_159399 ) ( ON ?auto_159396 ?auto_159397 ) ( CLEAR ?auto_159396 ) ( HOLDING ?auto_159395 ) ( CLEAR ?auto_159394 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159391 ?auto_159392 ?auto_159393 ?auto_159394 ?auto_159395 )
      ( MAKE-7PILE ?auto_159391 ?auto_159392 ?auto_159393 ?auto_159394 ?auto_159395 ?auto_159396 ?auto_159397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159400 - BLOCK
      ?auto_159401 - BLOCK
      ?auto_159402 - BLOCK
      ?auto_159403 - BLOCK
      ?auto_159404 - BLOCK
      ?auto_159405 - BLOCK
      ?auto_159406 - BLOCK
    )
    :vars
    (
      ?auto_159407 - BLOCK
      ?auto_159408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159400 ) ( ON ?auto_159401 ?auto_159400 ) ( ON ?auto_159402 ?auto_159401 ) ( ON ?auto_159403 ?auto_159402 ) ( not ( = ?auto_159400 ?auto_159401 ) ) ( not ( = ?auto_159400 ?auto_159402 ) ) ( not ( = ?auto_159400 ?auto_159403 ) ) ( not ( = ?auto_159400 ?auto_159404 ) ) ( not ( = ?auto_159400 ?auto_159405 ) ) ( not ( = ?auto_159400 ?auto_159406 ) ) ( not ( = ?auto_159400 ?auto_159407 ) ) ( not ( = ?auto_159401 ?auto_159402 ) ) ( not ( = ?auto_159401 ?auto_159403 ) ) ( not ( = ?auto_159401 ?auto_159404 ) ) ( not ( = ?auto_159401 ?auto_159405 ) ) ( not ( = ?auto_159401 ?auto_159406 ) ) ( not ( = ?auto_159401 ?auto_159407 ) ) ( not ( = ?auto_159402 ?auto_159403 ) ) ( not ( = ?auto_159402 ?auto_159404 ) ) ( not ( = ?auto_159402 ?auto_159405 ) ) ( not ( = ?auto_159402 ?auto_159406 ) ) ( not ( = ?auto_159402 ?auto_159407 ) ) ( not ( = ?auto_159403 ?auto_159404 ) ) ( not ( = ?auto_159403 ?auto_159405 ) ) ( not ( = ?auto_159403 ?auto_159406 ) ) ( not ( = ?auto_159403 ?auto_159407 ) ) ( not ( = ?auto_159404 ?auto_159405 ) ) ( not ( = ?auto_159404 ?auto_159406 ) ) ( not ( = ?auto_159404 ?auto_159407 ) ) ( not ( = ?auto_159405 ?auto_159406 ) ) ( not ( = ?auto_159405 ?auto_159407 ) ) ( not ( = ?auto_159406 ?auto_159407 ) ) ( ON ?auto_159407 ?auto_159408 ) ( not ( = ?auto_159400 ?auto_159408 ) ) ( not ( = ?auto_159401 ?auto_159408 ) ) ( not ( = ?auto_159402 ?auto_159408 ) ) ( not ( = ?auto_159403 ?auto_159408 ) ) ( not ( = ?auto_159404 ?auto_159408 ) ) ( not ( = ?auto_159405 ?auto_159408 ) ) ( not ( = ?auto_159406 ?auto_159408 ) ) ( not ( = ?auto_159407 ?auto_159408 ) ) ( ON ?auto_159406 ?auto_159407 ) ( ON-TABLE ?auto_159408 ) ( ON ?auto_159405 ?auto_159406 ) ( CLEAR ?auto_159403 ) ( ON ?auto_159404 ?auto_159405 ) ( CLEAR ?auto_159404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159408 ?auto_159407 ?auto_159406 ?auto_159405 )
      ( MAKE-7PILE ?auto_159400 ?auto_159401 ?auto_159402 ?auto_159403 ?auto_159404 ?auto_159405 ?auto_159406 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159409 - BLOCK
      ?auto_159410 - BLOCK
      ?auto_159411 - BLOCK
      ?auto_159412 - BLOCK
      ?auto_159413 - BLOCK
      ?auto_159414 - BLOCK
      ?auto_159415 - BLOCK
    )
    :vars
    (
      ?auto_159416 - BLOCK
      ?auto_159417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159409 ) ( ON ?auto_159410 ?auto_159409 ) ( ON ?auto_159411 ?auto_159410 ) ( not ( = ?auto_159409 ?auto_159410 ) ) ( not ( = ?auto_159409 ?auto_159411 ) ) ( not ( = ?auto_159409 ?auto_159412 ) ) ( not ( = ?auto_159409 ?auto_159413 ) ) ( not ( = ?auto_159409 ?auto_159414 ) ) ( not ( = ?auto_159409 ?auto_159415 ) ) ( not ( = ?auto_159409 ?auto_159416 ) ) ( not ( = ?auto_159410 ?auto_159411 ) ) ( not ( = ?auto_159410 ?auto_159412 ) ) ( not ( = ?auto_159410 ?auto_159413 ) ) ( not ( = ?auto_159410 ?auto_159414 ) ) ( not ( = ?auto_159410 ?auto_159415 ) ) ( not ( = ?auto_159410 ?auto_159416 ) ) ( not ( = ?auto_159411 ?auto_159412 ) ) ( not ( = ?auto_159411 ?auto_159413 ) ) ( not ( = ?auto_159411 ?auto_159414 ) ) ( not ( = ?auto_159411 ?auto_159415 ) ) ( not ( = ?auto_159411 ?auto_159416 ) ) ( not ( = ?auto_159412 ?auto_159413 ) ) ( not ( = ?auto_159412 ?auto_159414 ) ) ( not ( = ?auto_159412 ?auto_159415 ) ) ( not ( = ?auto_159412 ?auto_159416 ) ) ( not ( = ?auto_159413 ?auto_159414 ) ) ( not ( = ?auto_159413 ?auto_159415 ) ) ( not ( = ?auto_159413 ?auto_159416 ) ) ( not ( = ?auto_159414 ?auto_159415 ) ) ( not ( = ?auto_159414 ?auto_159416 ) ) ( not ( = ?auto_159415 ?auto_159416 ) ) ( ON ?auto_159416 ?auto_159417 ) ( not ( = ?auto_159409 ?auto_159417 ) ) ( not ( = ?auto_159410 ?auto_159417 ) ) ( not ( = ?auto_159411 ?auto_159417 ) ) ( not ( = ?auto_159412 ?auto_159417 ) ) ( not ( = ?auto_159413 ?auto_159417 ) ) ( not ( = ?auto_159414 ?auto_159417 ) ) ( not ( = ?auto_159415 ?auto_159417 ) ) ( not ( = ?auto_159416 ?auto_159417 ) ) ( ON ?auto_159415 ?auto_159416 ) ( ON-TABLE ?auto_159417 ) ( ON ?auto_159414 ?auto_159415 ) ( ON ?auto_159413 ?auto_159414 ) ( CLEAR ?auto_159413 ) ( HOLDING ?auto_159412 ) ( CLEAR ?auto_159411 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159409 ?auto_159410 ?auto_159411 ?auto_159412 )
      ( MAKE-7PILE ?auto_159409 ?auto_159410 ?auto_159411 ?auto_159412 ?auto_159413 ?auto_159414 ?auto_159415 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159418 - BLOCK
      ?auto_159419 - BLOCK
      ?auto_159420 - BLOCK
      ?auto_159421 - BLOCK
      ?auto_159422 - BLOCK
      ?auto_159423 - BLOCK
      ?auto_159424 - BLOCK
    )
    :vars
    (
      ?auto_159426 - BLOCK
      ?auto_159425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159418 ) ( ON ?auto_159419 ?auto_159418 ) ( ON ?auto_159420 ?auto_159419 ) ( not ( = ?auto_159418 ?auto_159419 ) ) ( not ( = ?auto_159418 ?auto_159420 ) ) ( not ( = ?auto_159418 ?auto_159421 ) ) ( not ( = ?auto_159418 ?auto_159422 ) ) ( not ( = ?auto_159418 ?auto_159423 ) ) ( not ( = ?auto_159418 ?auto_159424 ) ) ( not ( = ?auto_159418 ?auto_159426 ) ) ( not ( = ?auto_159419 ?auto_159420 ) ) ( not ( = ?auto_159419 ?auto_159421 ) ) ( not ( = ?auto_159419 ?auto_159422 ) ) ( not ( = ?auto_159419 ?auto_159423 ) ) ( not ( = ?auto_159419 ?auto_159424 ) ) ( not ( = ?auto_159419 ?auto_159426 ) ) ( not ( = ?auto_159420 ?auto_159421 ) ) ( not ( = ?auto_159420 ?auto_159422 ) ) ( not ( = ?auto_159420 ?auto_159423 ) ) ( not ( = ?auto_159420 ?auto_159424 ) ) ( not ( = ?auto_159420 ?auto_159426 ) ) ( not ( = ?auto_159421 ?auto_159422 ) ) ( not ( = ?auto_159421 ?auto_159423 ) ) ( not ( = ?auto_159421 ?auto_159424 ) ) ( not ( = ?auto_159421 ?auto_159426 ) ) ( not ( = ?auto_159422 ?auto_159423 ) ) ( not ( = ?auto_159422 ?auto_159424 ) ) ( not ( = ?auto_159422 ?auto_159426 ) ) ( not ( = ?auto_159423 ?auto_159424 ) ) ( not ( = ?auto_159423 ?auto_159426 ) ) ( not ( = ?auto_159424 ?auto_159426 ) ) ( ON ?auto_159426 ?auto_159425 ) ( not ( = ?auto_159418 ?auto_159425 ) ) ( not ( = ?auto_159419 ?auto_159425 ) ) ( not ( = ?auto_159420 ?auto_159425 ) ) ( not ( = ?auto_159421 ?auto_159425 ) ) ( not ( = ?auto_159422 ?auto_159425 ) ) ( not ( = ?auto_159423 ?auto_159425 ) ) ( not ( = ?auto_159424 ?auto_159425 ) ) ( not ( = ?auto_159426 ?auto_159425 ) ) ( ON ?auto_159424 ?auto_159426 ) ( ON-TABLE ?auto_159425 ) ( ON ?auto_159423 ?auto_159424 ) ( ON ?auto_159422 ?auto_159423 ) ( CLEAR ?auto_159420 ) ( ON ?auto_159421 ?auto_159422 ) ( CLEAR ?auto_159421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159425 ?auto_159426 ?auto_159424 ?auto_159423 ?auto_159422 )
      ( MAKE-7PILE ?auto_159418 ?auto_159419 ?auto_159420 ?auto_159421 ?auto_159422 ?auto_159423 ?auto_159424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159427 - BLOCK
      ?auto_159428 - BLOCK
      ?auto_159429 - BLOCK
      ?auto_159430 - BLOCK
      ?auto_159431 - BLOCK
      ?auto_159432 - BLOCK
      ?auto_159433 - BLOCK
    )
    :vars
    (
      ?auto_159434 - BLOCK
      ?auto_159435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159427 ) ( ON ?auto_159428 ?auto_159427 ) ( not ( = ?auto_159427 ?auto_159428 ) ) ( not ( = ?auto_159427 ?auto_159429 ) ) ( not ( = ?auto_159427 ?auto_159430 ) ) ( not ( = ?auto_159427 ?auto_159431 ) ) ( not ( = ?auto_159427 ?auto_159432 ) ) ( not ( = ?auto_159427 ?auto_159433 ) ) ( not ( = ?auto_159427 ?auto_159434 ) ) ( not ( = ?auto_159428 ?auto_159429 ) ) ( not ( = ?auto_159428 ?auto_159430 ) ) ( not ( = ?auto_159428 ?auto_159431 ) ) ( not ( = ?auto_159428 ?auto_159432 ) ) ( not ( = ?auto_159428 ?auto_159433 ) ) ( not ( = ?auto_159428 ?auto_159434 ) ) ( not ( = ?auto_159429 ?auto_159430 ) ) ( not ( = ?auto_159429 ?auto_159431 ) ) ( not ( = ?auto_159429 ?auto_159432 ) ) ( not ( = ?auto_159429 ?auto_159433 ) ) ( not ( = ?auto_159429 ?auto_159434 ) ) ( not ( = ?auto_159430 ?auto_159431 ) ) ( not ( = ?auto_159430 ?auto_159432 ) ) ( not ( = ?auto_159430 ?auto_159433 ) ) ( not ( = ?auto_159430 ?auto_159434 ) ) ( not ( = ?auto_159431 ?auto_159432 ) ) ( not ( = ?auto_159431 ?auto_159433 ) ) ( not ( = ?auto_159431 ?auto_159434 ) ) ( not ( = ?auto_159432 ?auto_159433 ) ) ( not ( = ?auto_159432 ?auto_159434 ) ) ( not ( = ?auto_159433 ?auto_159434 ) ) ( ON ?auto_159434 ?auto_159435 ) ( not ( = ?auto_159427 ?auto_159435 ) ) ( not ( = ?auto_159428 ?auto_159435 ) ) ( not ( = ?auto_159429 ?auto_159435 ) ) ( not ( = ?auto_159430 ?auto_159435 ) ) ( not ( = ?auto_159431 ?auto_159435 ) ) ( not ( = ?auto_159432 ?auto_159435 ) ) ( not ( = ?auto_159433 ?auto_159435 ) ) ( not ( = ?auto_159434 ?auto_159435 ) ) ( ON ?auto_159433 ?auto_159434 ) ( ON-TABLE ?auto_159435 ) ( ON ?auto_159432 ?auto_159433 ) ( ON ?auto_159431 ?auto_159432 ) ( ON ?auto_159430 ?auto_159431 ) ( CLEAR ?auto_159430 ) ( HOLDING ?auto_159429 ) ( CLEAR ?auto_159428 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159427 ?auto_159428 ?auto_159429 )
      ( MAKE-7PILE ?auto_159427 ?auto_159428 ?auto_159429 ?auto_159430 ?auto_159431 ?auto_159432 ?auto_159433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159436 - BLOCK
      ?auto_159437 - BLOCK
      ?auto_159438 - BLOCK
      ?auto_159439 - BLOCK
      ?auto_159440 - BLOCK
      ?auto_159441 - BLOCK
      ?auto_159442 - BLOCK
    )
    :vars
    (
      ?auto_159444 - BLOCK
      ?auto_159443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159436 ) ( ON ?auto_159437 ?auto_159436 ) ( not ( = ?auto_159436 ?auto_159437 ) ) ( not ( = ?auto_159436 ?auto_159438 ) ) ( not ( = ?auto_159436 ?auto_159439 ) ) ( not ( = ?auto_159436 ?auto_159440 ) ) ( not ( = ?auto_159436 ?auto_159441 ) ) ( not ( = ?auto_159436 ?auto_159442 ) ) ( not ( = ?auto_159436 ?auto_159444 ) ) ( not ( = ?auto_159437 ?auto_159438 ) ) ( not ( = ?auto_159437 ?auto_159439 ) ) ( not ( = ?auto_159437 ?auto_159440 ) ) ( not ( = ?auto_159437 ?auto_159441 ) ) ( not ( = ?auto_159437 ?auto_159442 ) ) ( not ( = ?auto_159437 ?auto_159444 ) ) ( not ( = ?auto_159438 ?auto_159439 ) ) ( not ( = ?auto_159438 ?auto_159440 ) ) ( not ( = ?auto_159438 ?auto_159441 ) ) ( not ( = ?auto_159438 ?auto_159442 ) ) ( not ( = ?auto_159438 ?auto_159444 ) ) ( not ( = ?auto_159439 ?auto_159440 ) ) ( not ( = ?auto_159439 ?auto_159441 ) ) ( not ( = ?auto_159439 ?auto_159442 ) ) ( not ( = ?auto_159439 ?auto_159444 ) ) ( not ( = ?auto_159440 ?auto_159441 ) ) ( not ( = ?auto_159440 ?auto_159442 ) ) ( not ( = ?auto_159440 ?auto_159444 ) ) ( not ( = ?auto_159441 ?auto_159442 ) ) ( not ( = ?auto_159441 ?auto_159444 ) ) ( not ( = ?auto_159442 ?auto_159444 ) ) ( ON ?auto_159444 ?auto_159443 ) ( not ( = ?auto_159436 ?auto_159443 ) ) ( not ( = ?auto_159437 ?auto_159443 ) ) ( not ( = ?auto_159438 ?auto_159443 ) ) ( not ( = ?auto_159439 ?auto_159443 ) ) ( not ( = ?auto_159440 ?auto_159443 ) ) ( not ( = ?auto_159441 ?auto_159443 ) ) ( not ( = ?auto_159442 ?auto_159443 ) ) ( not ( = ?auto_159444 ?auto_159443 ) ) ( ON ?auto_159442 ?auto_159444 ) ( ON-TABLE ?auto_159443 ) ( ON ?auto_159441 ?auto_159442 ) ( ON ?auto_159440 ?auto_159441 ) ( ON ?auto_159439 ?auto_159440 ) ( CLEAR ?auto_159437 ) ( ON ?auto_159438 ?auto_159439 ) ( CLEAR ?auto_159438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159443 ?auto_159444 ?auto_159442 ?auto_159441 ?auto_159440 ?auto_159439 )
      ( MAKE-7PILE ?auto_159436 ?auto_159437 ?auto_159438 ?auto_159439 ?auto_159440 ?auto_159441 ?auto_159442 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159445 - BLOCK
      ?auto_159446 - BLOCK
      ?auto_159447 - BLOCK
      ?auto_159448 - BLOCK
      ?auto_159449 - BLOCK
      ?auto_159450 - BLOCK
      ?auto_159451 - BLOCK
    )
    :vars
    (
      ?auto_159453 - BLOCK
      ?auto_159452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159445 ) ( not ( = ?auto_159445 ?auto_159446 ) ) ( not ( = ?auto_159445 ?auto_159447 ) ) ( not ( = ?auto_159445 ?auto_159448 ) ) ( not ( = ?auto_159445 ?auto_159449 ) ) ( not ( = ?auto_159445 ?auto_159450 ) ) ( not ( = ?auto_159445 ?auto_159451 ) ) ( not ( = ?auto_159445 ?auto_159453 ) ) ( not ( = ?auto_159446 ?auto_159447 ) ) ( not ( = ?auto_159446 ?auto_159448 ) ) ( not ( = ?auto_159446 ?auto_159449 ) ) ( not ( = ?auto_159446 ?auto_159450 ) ) ( not ( = ?auto_159446 ?auto_159451 ) ) ( not ( = ?auto_159446 ?auto_159453 ) ) ( not ( = ?auto_159447 ?auto_159448 ) ) ( not ( = ?auto_159447 ?auto_159449 ) ) ( not ( = ?auto_159447 ?auto_159450 ) ) ( not ( = ?auto_159447 ?auto_159451 ) ) ( not ( = ?auto_159447 ?auto_159453 ) ) ( not ( = ?auto_159448 ?auto_159449 ) ) ( not ( = ?auto_159448 ?auto_159450 ) ) ( not ( = ?auto_159448 ?auto_159451 ) ) ( not ( = ?auto_159448 ?auto_159453 ) ) ( not ( = ?auto_159449 ?auto_159450 ) ) ( not ( = ?auto_159449 ?auto_159451 ) ) ( not ( = ?auto_159449 ?auto_159453 ) ) ( not ( = ?auto_159450 ?auto_159451 ) ) ( not ( = ?auto_159450 ?auto_159453 ) ) ( not ( = ?auto_159451 ?auto_159453 ) ) ( ON ?auto_159453 ?auto_159452 ) ( not ( = ?auto_159445 ?auto_159452 ) ) ( not ( = ?auto_159446 ?auto_159452 ) ) ( not ( = ?auto_159447 ?auto_159452 ) ) ( not ( = ?auto_159448 ?auto_159452 ) ) ( not ( = ?auto_159449 ?auto_159452 ) ) ( not ( = ?auto_159450 ?auto_159452 ) ) ( not ( = ?auto_159451 ?auto_159452 ) ) ( not ( = ?auto_159453 ?auto_159452 ) ) ( ON ?auto_159451 ?auto_159453 ) ( ON-TABLE ?auto_159452 ) ( ON ?auto_159450 ?auto_159451 ) ( ON ?auto_159449 ?auto_159450 ) ( ON ?auto_159448 ?auto_159449 ) ( ON ?auto_159447 ?auto_159448 ) ( CLEAR ?auto_159447 ) ( HOLDING ?auto_159446 ) ( CLEAR ?auto_159445 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159445 ?auto_159446 )
      ( MAKE-7PILE ?auto_159445 ?auto_159446 ?auto_159447 ?auto_159448 ?auto_159449 ?auto_159450 ?auto_159451 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159454 - BLOCK
      ?auto_159455 - BLOCK
      ?auto_159456 - BLOCK
      ?auto_159457 - BLOCK
      ?auto_159458 - BLOCK
      ?auto_159459 - BLOCK
      ?auto_159460 - BLOCK
    )
    :vars
    (
      ?auto_159462 - BLOCK
      ?auto_159461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159454 ) ( not ( = ?auto_159454 ?auto_159455 ) ) ( not ( = ?auto_159454 ?auto_159456 ) ) ( not ( = ?auto_159454 ?auto_159457 ) ) ( not ( = ?auto_159454 ?auto_159458 ) ) ( not ( = ?auto_159454 ?auto_159459 ) ) ( not ( = ?auto_159454 ?auto_159460 ) ) ( not ( = ?auto_159454 ?auto_159462 ) ) ( not ( = ?auto_159455 ?auto_159456 ) ) ( not ( = ?auto_159455 ?auto_159457 ) ) ( not ( = ?auto_159455 ?auto_159458 ) ) ( not ( = ?auto_159455 ?auto_159459 ) ) ( not ( = ?auto_159455 ?auto_159460 ) ) ( not ( = ?auto_159455 ?auto_159462 ) ) ( not ( = ?auto_159456 ?auto_159457 ) ) ( not ( = ?auto_159456 ?auto_159458 ) ) ( not ( = ?auto_159456 ?auto_159459 ) ) ( not ( = ?auto_159456 ?auto_159460 ) ) ( not ( = ?auto_159456 ?auto_159462 ) ) ( not ( = ?auto_159457 ?auto_159458 ) ) ( not ( = ?auto_159457 ?auto_159459 ) ) ( not ( = ?auto_159457 ?auto_159460 ) ) ( not ( = ?auto_159457 ?auto_159462 ) ) ( not ( = ?auto_159458 ?auto_159459 ) ) ( not ( = ?auto_159458 ?auto_159460 ) ) ( not ( = ?auto_159458 ?auto_159462 ) ) ( not ( = ?auto_159459 ?auto_159460 ) ) ( not ( = ?auto_159459 ?auto_159462 ) ) ( not ( = ?auto_159460 ?auto_159462 ) ) ( ON ?auto_159462 ?auto_159461 ) ( not ( = ?auto_159454 ?auto_159461 ) ) ( not ( = ?auto_159455 ?auto_159461 ) ) ( not ( = ?auto_159456 ?auto_159461 ) ) ( not ( = ?auto_159457 ?auto_159461 ) ) ( not ( = ?auto_159458 ?auto_159461 ) ) ( not ( = ?auto_159459 ?auto_159461 ) ) ( not ( = ?auto_159460 ?auto_159461 ) ) ( not ( = ?auto_159462 ?auto_159461 ) ) ( ON ?auto_159460 ?auto_159462 ) ( ON-TABLE ?auto_159461 ) ( ON ?auto_159459 ?auto_159460 ) ( ON ?auto_159458 ?auto_159459 ) ( ON ?auto_159457 ?auto_159458 ) ( ON ?auto_159456 ?auto_159457 ) ( CLEAR ?auto_159454 ) ( ON ?auto_159455 ?auto_159456 ) ( CLEAR ?auto_159455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159461 ?auto_159462 ?auto_159460 ?auto_159459 ?auto_159458 ?auto_159457 ?auto_159456 )
      ( MAKE-7PILE ?auto_159454 ?auto_159455 ?auto_159456 ?auto_159457 ?auto_159458 ?auto_159459 ?auto_159460 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159463 - BLOCK
      ?auto_159464 - BLOCK
      ?auto_159465 - BLOCK
      ?auto_159466 - BLOCK
      ?auto_159467 - BLOCK
      ?auto_159468 - BLOCK
      ?auto_159469 - BLOCK
    )
    :vars
    (
      ?auto_159470 - BLOCK
      ?auto_159471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159463 ?auto_159464 ) ) ( not ( = ?auto_159463 ?auto_159465 ) ) ( not ( = ?auto_159463 ?auto_159466 ) ) ( not ( = ?auto_159463 ?auto_159467 ) ) ( not ( = ?auto_159463 ?auto_159468 ) ) ( not ( = ?auto_159463 ?auto_159469 ) ) ( not ( = ?auto_159463 ?auto_159470 ) ) ( not ( = ?auto_159464 ?auto_159465 ) ) ( not ( = ?auto_159464 ?auto_159466 ) ) ( not ( = ?auto_159464 ?auto_159467 ) ) ( not ( = ?auto_159464 ?auto_159468 ) ) ( not ( = ?auto_159464 ?auto_159469 ) ) ( not ( = ?auto_159464 ?auto_159470 ) ) ( not ( = ?auto_159465 ?auto_159466 ) ) ( not ( = ?auto_159465 ?auto_159467 ) ) ( not ( = ?auto_159465 ?auto_159468 ) ) ( not ( = ?auto_159465 ?auto_159469 ) ) ( not ( = ?auto_159465 ?auto_159470 ) ) ( not ( = ?auto_159466 ?auto_159467 ) ) ( not ( = ?auto_159466 ?auto_159468 ) ) ( not ( = ?auto_159466 ?auto_159469 ) ) ( not ( = ?auto_159466 ?auto_159470 ) ) ( not ( = ?auto_159467 ?auto_159468 ) ) ( not ( = ?auto_159467 ?auto_159469 ) ) ( not ( = ?auto_159467 ?auto_159470 ) ) ( not ( = ?auto_159468 ?auto_159469 ) ) ( not ( = ?auto_159468 ?auto_159470 ) ) ( not ( = ?auto_159469 ?auto_159470 ) ) ( ON ?auto_159470 ?auto_159471 ) ( not ( = ?auto_159463 ?auto_159471 ) ) ( not ( = ?auto_159464 ?auto_159471 ) ) ( not ( = ?auto_159465 ?auto_159471 ) ) ( not ( = ?auto_159466 ?auto_159471 ) ) ( not ( = ?auto_159467 ?auto_159471 ) ) ( not ( = ?auto_159468 ?auto_159471 ) ) ( not ( = ?auto_159469 ?auto_159471 ) ) ( not ( = ?auto_159470 ?auto_159471 ) ) ( ON ?auto_159469 ?auto_159470 ) ( ON-TABLE ?auto_159471 ) ( ON ?auto_159468 ?auto_159469 ) ( ON ?auto_159467 ?auto_159468 ) ( ON ?auto_159466 ?auto_159467 ) ( ON ?auto_159465 ?auto_159466 ) ( ON ?auto_159464 ?auto_159465 ) ( CLEAR ?auto_159464 ) ( HOLDING ?auto_159463 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159463 )
      ( MAKE-7PILE ?auto_159463 ?auto_159464 ?auto_159465 ?auto_159466 ?auto_159467 ?auto_159468 ?auto_159469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_159472 - BLOCK
      ?auto_159473 - BLOCK
      ?auto_159474 - BLOCK
      ?auto_159475 - BLOCK
      ?auto_159476 - BLOCK
      ?auto_159477 - BLOCK
      ?auto_159478 - BLOCK
    )
    :vars
    (
      ?auto_159480 - BLOCK
      ?auto_159479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159472 ?auto_159473 ) ) ( not ( = ?auto_159472 ?auto_159474 ) ) ( not ( = ?auto_159472 ?auto_159475 ) ) ( not ( = ?auto_159472 ?auto_159476 ) ) ( not ( = ?auto_159472 ?auto_159477 ) ) ( not ( = ?auto_159472 ?auto_159478 ) ) ( not ( = ?auto_159472 ?auto_159480 ) ) ( not ( = ?auto_159473 ?auto_159474 ) ) ( not ( = ?auto_159473 ?auto_159475 ) ) ( not ( = ?auto_159473 ?auto_159476 ) ) ( not ( = ?auto_159473 ?auto_159477 ) ) ( not ( = ?auto_159473 ?auto_159478 ) ) ( not ( = ?auto_159473 ?auto_159480 ) ) ( not ( = ?auto_159474 ?auto_159475 ) ) ( not ( = ?auto_159474 ?auto_159476 ) ) ( not ( = ?auto_159474 ?auto_159477 ) ) ( not ( = ?auto_159474 ?auto_159478 ) ) ( not ( = ?auto_159474 ?auto_159480 ) ) ( not ( = ?auto_159475 ?auto_159476 ) ) ( not ( = ?auto_159475 ?auto_159477 ) ) ( not ( = ?auto_159475 ?auto_159478 ) ) ( not ( = ?auto_159475 ?auto_159480 ) ) ( not ( = ?auto_159476 ?auto_159477 ) ) ( not ( = ?auto_159476 ?auto_159478 ) ) ( not ( = ?auto_159476 ?auto_159480 ) ) ( not ( = ?auto_159477 ?auto_159478 ) ) ( not ( = ?auto_159477 ?auto_159480 ) ) ( not ( = ?auto_159478 ?auto_159480 ) ) ( ON ?auto_159480 ?auto_159479 ) ( not ( = ?auto_159472 ?auto_159479 ) ) ( not ( = ?auto_159473 ?auto_159479 ) ) ( not ( = ?auto_159474 ?auto_159479 ) ) ( not ( = ?auto_159475 ?auto_159479 ) ) ( not ( = ?auto_159476 ?auto_159479 ) ) ( not ( = ?auto_159477 ?auto_159479 ) ) ( not ( = ?auto_159478 ?auto_159479 ) ) ( not ( = ?auto_159480 ?auto_159479 ) ) ( ON ?auto_159478 ?auto_159480 ) ( ON-TABLE ?auto_159479 ) ( ON ?auto_159477 ?auto_159478 ) ( ON ?auto_159476 ?auto_159477 ) ( ON ?auto_159475 ?auto_159476 ) ( ON ?auto_159474 ?auto_159475 ) ( ON ?auto_159473 ?auto_159474 ) ( ON ?auto_159472 ?auto_159473 ) ( CLEAR ?auto_159472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159479 ?auto_159480 ?auto_159478 ?auto_159477 ?auto_159476 ?auto_159475 ?auto_159474 ?auto_159473 )
      ( MAKE-7PILE ?auto_159472 ?auto_159473 ?auto_159474 ?auto_159475 ?auto_159476 ?auto_159477 ?auto_159478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159482 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_159482 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_159482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159483 - BLOCK
    )
    :vars
    (
      ?auto_159484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159483 ?auto_159484 ) ( CLEAR ?auto_159483 ) ( HAND-EMPTY ) ( not ( = ?auto_159483 ?auto_159484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159483 ?auto_159484 )
      ( MAKE-1PILE ?auto_159483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159485 - BLOCK
    )
    :vars
    (
      ?auto_159486 - BLOCK
      ?auto_159491 - BLOCK
      ?auto_159488 - BLOCK
      ?auto_159487 - BLOCK
      ?auto_159490 - BLOCK
      ?auto_159489 - BLOCK
      ?auto_159492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159485 ?auto_159486 ) ) ( HOLDING ?auto_159485 ) ( CLEAR ?auto_159486 ) ( ON-TABLE ?auto_159491 ) ( ON ?auto_159488 ?auto_159491 ) ( ON ?auto_159487 ?auto_159488 ) ( ON ?auto_159490 ?auto_159487 ) ( ON ?auto_159489 ?auto_159490 ) ( ON ?auto_159492 ?auto_159489 ) ( ON ?auto_159486 ?auto_159492 ) ( not ( = ?auto_159491 ?auto_159488 ) ) ( not ( = ?auto_159491 ?auto_159487 ) ) ( not ( = ?auto_159491 ?auto_159490 ) ) ( not ( = ?auto_159491 ?auto_159489 ) ) ( not ( = ?auto_159491 ?auto_159492 ) ) ( not ( = ?auto_159491 ?auto_159486 ) ) ( not ( = ?auto_159491 ?auto_159485 ) ) ( not ( = ?auto_159488 ?auto_159487 ) ) ( not ( = ?auto_159488 ?auto_159490 ) ) ( not ( = ?auto_159488 ?auto_159489 ) ) ( not ( = ?auto_159488 ?auto_159492 ) ) ( not ( = ?auto_159488 ?auto_159486 ) ) ( not ( = ?auto_159488 ?auto_159485 ) ) ( not ( = ?auto_159487 ?auto_159490 ) ) ( not ( = ?auto_159487 ?auto_159489 ) ) ( not ( = ?auto_159487 ?auto_159492 ) ) ( not ( = ?auto_159487 ?auto_159486 ) ) ( not ( = ?auto_159487 ?auto_159485 ) ) ( not ( = ?auto_159490 ?auto_159489 ) ) ( not ( = ?auto_159490 ?auto_159492 ) ) ( not ( = ?auto_159490 ?auto_159486 ) ) ( not ( = ?auto_159490 ?auto_159485 ) ) ( not ( = ?auto_159489 ?auto_159492 ) ) ( not ( = ?auto_159489 ?auto_159486 ) ) ( not ( = ?auto_159489 ?auto_159485 ) ) ( not ( = ?auto_159492 ?auto_159486 ) ) ( not ( = ?auto_159492 ?auto_159485 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159491 ?auto_159488 ?auto_159487 ?auto_159490 ?auto_159489 ?auto_159492 ?auto_159486 ?auto_159485 )
      ( MAKE-1PILE ?auto_159485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159493 - BLOCK
    )
    :vars
    (
      ?auto_159498 - BLOCK
      ?auto_159500 - BLOCK
      ?auto_159499 - BLOCK
      ?auto_159496 - BLOCK
      ?auto_159495 - BLOCK
      ?auto_159494 - BLOCK
      ?auto_159497 - BLOCK
      ?auto_159501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159493 ?auto_159498 ) ) ( CLEAR ?auto_159498 ) ( ON-TABLE ?auto_159500 ) ( ON ?auto_159499 ?auto_159500 ) ( ON ?auto_159496 ?auto_159499 ) ( ON ?auto_159495 ?auto_159496 ) ( ON ?auto_159494 ?auto_159495 ) ( ON ?auto_159497 ?auto_159494 ) ( ON ?auto_159498 ?auto_159497 ) ( not ( = ?auto_159500 ?auto_159499 ) ) ( not ( = ?auto_159500 ?auto_159496 ) ) ( not ( = ?auto_159500 ?auto_159495 ) ) ( not ( = ?auto_159500 ?auto_159494 ) ) ( not ( = ?auto_159500 ?auto_159497 ) ) ( not ( = ?auto_159500 ?auto_159498 ) ) ( not ( = ?auto_159500 ?auto_159493 ) ) ( not ( = ?auto_159499 ?auto_159496 ) ) ( not ( = ?auto_159499 ?auto_159495 ) ) ( not ( = ?auto_159499 ?auto_159494 ) ) ( not ( = ?auto_159499 ?auto_159497 ) ) ( not ( = ?auto_159499 ?auto_159498 ) ) ( not ( = ?auto_159499 ?auto_159493 ) ) ( not ( = ?auto_159496 ?auto_159495 ) ) ( not ( = ?auto_159496 ?auto_159494 ) ) ( not ( = ?auto_159496 ?auto_159497 ) ) ( not ( = ?auto_159496 ?auto_159498 ) ) ( not ( = ?auto_159496 ?auto_159493 ) ) ( not ( = ?auto_159495 ?auto_159494 ) ) ( not ( = ?auto_159495 ?auto_159497 ) ) ( not ( = ?auto_159495 ?auto_159498 ) ) ( not ( = ?auto_159495 ?auto_159493 ) ) ( not ( = ?auto_159494 ?auto_159497 ) ) ( not ( = ?auto_159494 ?auto_159498 ) ) ( not ( = ?auto_159494 ?auto_159493 ) ) ( not ( = ?auto_159497 ?auto_159498 ) ) ( not ( = ?auto_159497 ?auto_159493 ) ) ( ON ?auto_159493 ?auto_159501 ) ( CLEAR ?auto_159493 ) ( HAND-EMPTY ) ( not ( = ?auto_159493 ?auto_159501 ) ) ( not ( = ?auto_159498 ?auto_159501 ) ) ( not ( = ?auto_159500 ?auto_159501 ) ) ( not ( = ?auto_159499 ?auto_159501 ) ) ( not ( = ?auto_159496 ?auto_159501 ) ) ( not ( = ?auto_159495 ?auto_159501 ) ) ( not ( = ?auto_159494 ?auto_159501 ) ) ( not ( = ?auto_159497 ?auto_159501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159493 ?auto_159501 )
      ( MAKE-1PILE ?auto_159493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159502 - BLOCK
    )
    :vars
    (
      ?auto_159504 - BLOCK
      ?auto_159506 - BLOCK
      ?auto_159507 - BLOCK
      ?auto_159508 - BLOCK
      ?auto_159509 - BLOCK
      ?auto_159503 - BLOCK
      ?auto_159510 - BLOCK
      ?auto_159505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159502 ?auto_159504 ) ) ( ON-TABLE ?auto_159506 ) ( ON ?auto_159507 ?auto_159506 ) ( ON ?auto_159508 ?auto_159507 ) ( ON ?auto_159509 ?auto_159508 ) ( ON ?auto_159503 ?auto_159509 ) ( ON ?auto_159510 ?auto_159503 ) ( not ( = ?auto_159506 ?auto_159507 ) ) ( not ( = ?auto_159506 ?auto_159508 ) ) ( not ( = ?auto_159506 ?auto_159509 ) ) ( not ( = ?auto_159506 ?auto_159503 ) ) ( not ( = ?auto_159506 ?auto_159510 ) ) ( not ( = ?auto_159506 ?auto_159504 ) ) ( not ( = ?auto_159506 ?auto_159502 ) ) ( not ( = ?auto_159507 ?auto_159508 ) ) ( not ( = ?auto_159507 ?auto_159509 ) ) ( not ( = ?auto_159507 ?auto_159503 ) ) ( not ( = ?auto_159507 ?auto_159510 ) ) ( not ( = ?auto_159507 ?auto_159504 ) ) ( not ( = ?auto_159507 ?auto_159502 ) ) ( not ( = ?auto_159508 ?auto_159509 ) ) ( not ( = ?auto_159508 ?auto_159503 ) ) ( not ( = ?auto_159508 ?auto_159510 ) ) ( not ( = ?auto_159508 ?auto_159504 ) ) ( not ( = ?auto_159508 ?auto_159502 ) ) ( not ( = ?auto_159509 ?auto_159503 ) ) ( not ( = ?auto_159509 ?auto_159510 ) ) ( not ( = ?auto_159509 ?auto_159504 ) ) ( not ( = ?auto_159509 ?auto_159502 ) ) ( not ( = ?auto_159503 ?auto_159510 ) ) ( not ( = ?auto_159503 ?auto_159504 ) ) ( not ( = ?auto_159503 ?auto_159502 ) ) ( not ( = ?auto_159510 ?auto_159504 ) ) ( not ( = ?auto_159510 ?auto_159502 ) ) ( ON ?auto_159502 ?auto_159505 ) ( CLEAR ?auto_159502 ) ( not ( = ?auto_159502 ?auto_159505 ) ) ( not ( = ?auto_159504 ?auto_159505 ) ) ( not ( = ?auto_159506 ?auto_159505 ) ) ( not ( = ?auto_159507 ?auto_159505 ) ) ( not ( = ?auto_159508 ?auto_159505 ) ) ( not ( = ?auto_159509 ?auto_159505 ) ) ( not ( = ?auto_159503 ?auto_159505 ) ) ( not ( = ?auto_159510 ?auto_159505 ) ) ( HOLDING ?auto_159504 ) ( CLEAR ?auto_159510 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159506 ?auto_159507 ?auto_159508 ?auto_159509 ?auto_159503 ?auto_159510 ?auto_159504 )
      ( MAKE-1PILE ?auto_159502 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159511 - BLOCK
    )
    :vars
    (
      ?auto_159515 - BLOCK
      ?auto_159516 - BLOCK
      ?auto_159519 - BLOCK
      ?auto_159518 - BLOCK
      ?auto_159512 - BLOCK
      ?auto_159517 - BLOCK
      ?auto_159514 - BLOCK
      ?auto_159513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159511 ?auto_159515 ) ) ( ON-TABLE ?auto_159516 ) ( ON ?auto_159519 ?auto_159516 ) ( ON ?auto_159518 ?auto_159519 ) ( ON ?auto_159512 ?auto_159518 ) ( ON ?auto_159517 ?auto_159512 ) ( ON ?auto_159514 ?auto_159517 ) ( not ( = ?auto_159516 ?auto_159519 ) ) ( not ( = ?auto_159516 ?auto_159518 ) ) ( not ( = ?auto_159516 ?auto_159512 ) ) ( not ( = ?auto_159516 ?auto_159517 ) ) ( not ( = ?auto_159516 ?auto_159514 ) ) ( not ( = ?auto_159516 ?auto_159515 ) ) ( not ( = ?auto_159516 ?auto_159511 ) ) ( not ( = ?auto_159519 ?auto_159518 ) ) ( not ( = ?auto_159519 ?auto_159512 ) ) ( not ( = ?auto_159519 ?auto_159517 ) ) ( not ( = ?auto_159519 ?auto_159514 ) ) ( not ( = ?auto_159519 ?auto_159515 ) ) ( not ( = ?auto_159519 ?auto_159511 ) ) ( not ( = ?auto_159518 ?auto_159512 ) ) ( not ( = ?auto_159518 ?auto_159517 ) ) ( not ( = ?auto_159518 ?auto_159514 ) ) ( not ( = ?auto_159518 ?auto_159515 ) ) ( not ( = ?auto_159518 ?auto_159511 ) ) ( not ( = ?auto_159512 ?auto_159517 ) ) ( not ( = ?auto_159512 ?auto_159514 ) ) ( not ( = ?auto_159512 ?auto_159515 ) ) ( not ( = ?auto_159512 ?auto_159511 ) ) ( not ( = ?auto_159517 ?auto_159514 ) ) ( not ( = ?auto_159517 ?auto_159515 ) ) ( not ( = ?auto_159517 ?auto_159511 ) ) ( not ( = ?auto_159514 ?auto_159515 ) ) ( not ( = ?auto_159514 ?auto_159511 ) ) ( ON ?auto_159511 ?auto_159513 ) ( not ( = ?auto_159511 ?auto_159513 ) ) ( not ( = ?auto_159515 ?auto_159513 ) ) ( not ( = ?auto_159516 ?auto_159513 ) ) ( not ( = ?auto_159519 ?auto_159513 ) ) ( not ( = ?auto_159518 ?auto_159513 ) ) ( not ( = ?auto_159512 ?auto_159513 ) ) ( not ( = ?auto_159517 ?auto_159513 ) ) ( not ( = ?auto_159514 ?auto_159513 ) ) ( CLEAR ?auto_159514 ) ( ON ?auto_159515 ?auto_159511 ) ( CLEAR ?auto_159515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159513 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159513 ?auto_159511 )
      ( MAKE-1PILE ?auto_159511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159520 - BLOCK
    )
    :vars
    (
      ?auto_159527 - BLOCK
      ?auto_159521 - BLOCK
      ?auto_159526 - BLOCK
      ?auto_159524 - BLOCK
      ?auto_159522 - BLOCK
      ?auto_159523 - BLOCK
      ?auto_159525 - BLOCK
      ?auto_159528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159520 ?auto_159527 ) ) ( ON-TABLE ?auto_159521 ) ( ON ?auto_159526 ?auto_159521 ) ( ON ?auto_159524 ?auto_159526 ) ( ON ?auto_159522 ?auto_159524 ) ( ON ?auto_159523 ?auto_159522 ) ( not ( = ?auto_159521 ?auto_159526 ) ) ( not ( = ?auto_159521 ?auto_159524 ) ) ( not ( = ?auto_159521 ?auto_159522 ) ) ( not ( = ?auto_159521 ?auto_159523 ) ) ( not ( = ?auto_159521 ?auto_159525 ) ) ( not ( = ?auto_159521 ?auto_159527 ) ) ( not ( = ?auto_159521 ?auto_159520 ) ) ( not ( = ?auto_159526 ?auto_159524 ) ) ( not ( = ?auto_159526 ?auto_159522 ) ) ( not ( = ?auto_159526 ?auto_159523 ) ) ( not ( = ?auto_159526 ?auto_159525 ) ) ( not ( = ?auto_159526 ?auto_159527 ) ) ( not ( = ?auto_159526 ?auto_159520 ) ) ( not ( = ?auto_159524 ?auto_159522 ) ) ( not ( = ?auto_159524 ?auto_159523 ) ) ( not ( = ?auto_159524 ?auto_159525 ) ) ( not ( = ?auto_159524 ?auto_159527 ) ) ( not ( = ?auto_159524 ?auto_159520 ) ) ( not ( = ?auto_159522 ?auto_159523 ) ) ( not ( = ?auto_159522 ?auto_159525 ) ) ( not ( = ?auto_159522 ?auto_159527 ) ) ( not ( = ?auto_159522 ?auto_159520 ) ) ( not ( = ?auto_159523 ?auto_159525 ) ) ( not ( = ?auto_159523 ?auto_159527 ) ) ( not ( = ?auto_159523 ?auto_159520 ) ) ( not ( = ?auto_159525 ?auto_159527 ) ) ( not ( = ?auto_159525 ?auto_159520 ) ) ( ON ?auto_159520 ?auto_159528 ) ( not ( = ?auto_159520 ?auto_159528 ) ) ( not ( = ?auto_159527 ?auto_159528 ) ) ( not ( = ?auto_159521 ?auto_159528 ) ) ( not ( = ?auto_159526 ?auto_159528 ) ) ( not ( = ?auto_159524 ?auto_159528 ) ) ( not ( = ?auto_159522 ?auto_159528 ) ) ( not ( = ?auto_159523 ?auto_159528 ) ) ( not ( = ?auto_159525 ?auto_159528 ) ) ( ON ?auto_159527 ?auto_159520 ) ( CLEAR ?auto_159527 ) ( ON-TABLE ?auto_159528 ) ( HOLDING ?auto_159525 ) ( CLEAR ?auto_159523 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159521 ?auto_159526 ?auto_159524 ?auto_159522 ?auto_159523 ?auto_159525 )
      ( MAKE-1PILE ?auto_159520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159529 - BLOCK
    )
    :vars
    (
      ?auto_159533 - BLOCK
      ?auto_159530 - BLOCK
      ?auto_159531 - BLOCK
      ?auto_159534 - BLOCK
      ?auto_159532 - BLOCK
      ?auto_159536 - BLOCK
      ?auto_159535 - BLOCK
      ?auto_159537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159529 ?auto_159533 ) ) ( ON-TABLE ?auto_159530 ) ( ON ?auto_159531 ?auto_159530 ) ( ON ?auto_159534 ?auto_159531 ) ( ON ?auto_159532 ?auto_159534 ) ( ON ?auto_159536 ?auto_159532 ) ( not ( = ?auto_159530 ?auto_159531 ) ) ( not ( = ?auto_159530 ?auto_159534 ) ) ( not ( = ?auto_159530 ?auto_159532 ) ) ( not ( = ?auto_159530 ?auto_159536 ) ) ( not ( = ?auto_159530 ?auto_159535 ) ) ( not ( = ?auto_159530 ?auto_159533 ) ) ( not ( = ?auto_159530 ?auto_159529 ) ) ( not ( = ?auto_159531 ?auto_159534 ) ) ( not ( = ?auto_159531 ?auto_159532 ) ) ( not ( = ?auto_159531 ?auto_159536 ) ) ( not ( = ?auto_159531 ?auto_159535 ) ) ( not ( = ?auto_159531 ?auto_159533 ) ) ( not ( = ?auto_159531 ?auto_159529 ) ) ( not ( = ?auto_159534 ?auto_159532 ) ) ( not ( = ?auto_159534 ?auto_159536 ) ) ( not ( = ?auto_159534 ?auto_159535 ) ) ( not ( = ?auto_159534 ?auto_159533 ) ) ( not ( = ?auto_159534 ?auto_159529 ) ) ( not ( = ?auto_159532 ?auto_159536 ) ) ( not ( = ?auto_159532 ?auto_159535 ) ) ( not ( = ?auto_159532 ?auto_159533 ) ) ( not ( = ?auto_159532 ?auto_159529 ) ) ( not ( = ?auto_159536 ?auto_159535 ) ) ( not ( = ?auto_159536 ?auto_159533 ) ) ( not ( = ?auto_159536 ?auto_159529 ) ) ( not ( = ?auto_159535 ?auto_159533 ) ) ( not ( = ?auto_159535 ?auto_159529 ) ) ( ON ?auto_159529 ?auto_159537 ) ( not ( = ?auto_159529 ?auto_159537 ) ) ( not ( = ?auto_159533 ?auto_159537 ) ) ( not ( = ?auto_159530 ?auto_159537 ) ) ( not ( = ?auto_159531 ?auto_159537 ) ) ( not ( = ?auto_159534 ?auto_159537 ) ) ( not ( = ?auto_159532 ?auto_159537 ) ) ( not ( = ?auto_159536 ?auto_159537 ) ) ( not ( = ?auto_159535 ?auto_159537 ) ) ( ON ?auto_159533 ?auto_159529 ) ( ON-TABLE ?auto_159537 ) ( CLEAR ?auto_159536 ) ( ON ?auto_159535 ?auto_159533 ) ( CLEAR ?auto_159535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159537 ?auto_159529 ?auto_159533 )
      ( MAKE-1PILE ?auto_159529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159538 - BLOCK
    )
    :vars
    (
      ?auto_159541 - BLOCK
      ?auto_159544 - BLOCK
      ?auto_159539 - BLOCK
      ?auto_159545 - BLOCK
      ?auto_159546 - BLOCK
      ?auto_159540 - BLOCK
      ?auto_159542 - BLOCK
      ?auto_159543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159538 ?auto_159541 ) ) ( ON-TABLE ?auto_159544 ) ( ON ?auto_159539 ?auto_159544 ) ( ON ?auto_159545 ?auto_159539 ) ( ON ?auto_159546 ?auto_159545 ) ( not ( = ?auto_159544 ?auto_159539 ) ) ( not ( = ?auto_159544 ?auto_159545 ) ) ( not ( = ?auto_159544 ?auto_159546 ) ) ( not ( = ?auto_159544 ?auto_159540 ) ) ( not ( = ?auto_159544 ?auto_159542 ) ) ( not ( = ?auto_159544 ?auto_159541 ) ) ( not ( = ?auto_159544 ?auto_159538 ) ) ( not ( = ?auto_159539 ?auto_159545 ) ) ( not ( = ?auto_159539 ?auto_159546 ) ) ( not ( = ?auto_159539 ?auto_159540 ) ) ( not ( = ?auto_159539 ?auto_159542 ) ) ( not ( = ?auto_159539 ?auto_159541 ) ) ( not ( = ?auto_159539 ?auto_159538 ) ) ( not ( = ?auto_159545 ?auto_159546 ) ) ( not ( = ?auto_159545 ?auto_159540 ) ) ( not ( = ?auto_159545 ?auto_159542 ) ) ( not ( = ?auto_159545 ?auto_159541 ) ) ( not ( = ?auto_159545 ?auto_159538 ) ) ( not ( = ?auto_159546 ?auto_159540 ) ) ( not ( = ?auto_159546 ?auto_159542 ) ) ( not ( = ?auto_159546 ?auto_159541 ) ) ( not ( = ?auto_159546 ?auto_159538 ) ) ( not ( = ?auto_159540 ?auto_159542 ) ) ( not ( = ?auto_159540 ?auto_159541 ) ) ( not ( = ?auto_159540 ?auto_159538 ) ) ( not ( = ?auto_159542 ?auto_159541 ) ) ( not ( = ?auto_159542 ?auto_159538 ) ) ( ON ?auto_159538 ?auto_159543 ) ( not ( = ?auto_159538 ?auto_159543 ) ) ( not ( = ?auto_159541 ?auto_159543 ) ) ( not ( = ?auto_159544 ?auto_159543 ) ) ( not ( = ?auto_159539 ?auto_159543 ) ) ( not ( = ?auto_159545 ?auto_159543 ) ) ( not ( = ?auto_159546 ?auto_159543 ) ) ( not ( = ?auto_159540 ?auto_159543 ) ) ( not ( = ?auto_159542 ?auto_159543 ) ) ( ON ?auto_159541 ?auto_159538 ) ( ON-TABLE ?auto_159543 ) ( ON ?auto_159542 ?auto_159541 ) ( CLEAR ?auto_159542 ) ( HOLDING ?auto_159540 ) ( CLEAR ?auto_159546 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159544 ?auto_159539 ?auto_159545 ?auto_159546 ?auto_159540 )
      ( MAKE-1PILE ?auto_159538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159547 - BLOCK
    )
    :vars
    (
      ?auto_159551 - BLOCK
      ?auto_159549 - BLOCK
      ?auto_159552 - BLOCK
      ?auto_159550 - BLOCK
      ?auto_159553 - BLOCK
      ?auto_159555 - BLOCK
      ?auto_159548 - BLOCK
      ?auto_159554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159547 ?auto_159551 ) ) ( ON-TABLE ?auto_159549 ) ( ON ?auto_159552 ?auto_159549 ) ( ON ?auto_159550 ?auto_159552 ) ( ON ?auto_159553 ?auto_159550 ) ( not ( = ?auto_159549 ?auto_159552 ) ) ( not ( = ?auto_159549 ?auto_159550 ) ) ( not ( = ?auto_159549 ?auto_159553 ) ) ( not ( = ?auto_159549 ?auto_159555 ) ) ( not ( = ?auto_159549 ?auto_159548 ) ) ( not ( = ?auto_159549 ?auto_159551 ) ) ( not ( = ?auto_159549 ?auto_159547 ) ) ( not ( = ?auto_159552 ?auto_159550 ) ) ( not ( = ?auto_159552 ?auto_159553 ) ) ( not ( = ?auto_159552 ?auto_159555 ) ) ( not ( = ?auto_159552 ?auto_159548 ) ) ( not ( = ?auto_159552 ?auto_159551 ) ) ( not ( = ?auto_159552 ?auto_159547 ) ) ( not ( = ?auto_159550 ?auto_159553 ) ) ( not ( = ?auto_159550 ?auto_159555 ) ) ( not ( = ?auto_159550 ?auto_159548 ) ) ( not ( = ?auto_159550 ?auto_159551 ) ) ( not ( = ?auto_159550 ?auto_159547 ) ) ( not ( = ?auto_159553 ?auto_159555 ) ) ( not ( = ?auto_159553 ?auto_159548 ) ) ( not ( = ?auto_159553 ?auto_159551 ) ) ( not ( = ?auto_159553 ?auto_159547 ) ) ( not ( = ?auto_159555 ?auto_159548 ) ) ( not ( = ?auto_159555 ?auto_159551 ) ) ( not ( = ?auto_159555 ?auto_159547 ) ) ( not ( = ?auto_159548 ?auto_159551 ) ) ( not ( = ?auto_159548 ?auto_159547 ) ) ( ON ?auto_159547 ?auto_159554 ) ( not ( = ?auto_159547 ?auto_159554 ) ) ( not ( = ?auto_159551 ?auto_159554 ) ) ( not ( = ?auto_159549 ?auto_159554 ) ) ( not ( = ?auto_159552 ?auto_159554 ) ) ( not ( = ?auto_159550 ?auto_159554 ) ) ( not ( = ?auto_159553 ?auto_159554 ) ) ( not ( = ?auto_159555 ?auto_159554 ) ) ( not ( = ?auto_159548 ?auto_159554 ) ) ( ON ?auto_159551 ?auto_159547 ) ( ON-TABLE ?auto_159554 ) ( ON ?auto_159548 ?auto_159551 ) ( CLEAR ?auto_159553 ) ( ON ?auto_159555 ?auto_159548 ) ( CLEAR ?auto_159555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159554 ?auto_159547 ?auto_159551 ?auto_159548 )
      ( MAKE-1PILE ?auto_159547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159556 - BLOCK
    )
    :vars
    (
      ?auto_159561 - BLOCK
      ?auto_159560 - BLOCK
      ?auto_159559 - BLOCK
      ?auto_159557 - BLOCK
      ?auto_159558 - BLOCK
      ?auto_159564 - BLOCK
      ?auto_159563 - BLOCK
      ?auto_159562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159556 ?auto_159561 ) ) ( ON-TABLE ?auto_159560 ) ( ON ?auto_159559 ?auto_159560 ) ( ON ?auto_159557 ?auto_159559 ) ( not ( = ?auto_159560 ?auto_159559 ) ) ( not ( = ?auto_159560 ?auto_159557 ) ) ( not ( = ?auto_159560 ?auto_159558 ) ) ( not ( = ?auto_159560 ?auto_159564 ) ) ( not ( = ?auto_159560 ?auto_159563 ) ) ( not ( = ?auto_159560 ?auto_159561 ) ) ( not ( = ?auto_159560 ?auto_159556 ) ) ( not ( = ?auto_159559 ?auto_159557 ) ) ( not ( = ?auto_159559 ?auto_159558 ) ) ( not ( = ?auto_159559 ?auto_159564 ) ) ( not ( = ?auto_159559 ?auto_159563 ) ) ( not ( = ?auto_159559 ?auto_159561 ) ) ( not ( = ?auto_159559 ?auto_159556 ) ) ( not ( = ?auto_159557 ?auto_159558 ) ) ( not ( = ?auto_159557 ?auto_159564 ) ) ( not ( = ?auto_159557 ?auto_159563 ) ) ( not ( = ?auto_159557 ?auto_159561 ) ) ( not ( = ?auto_159557 ?auto_159556 ) ) ( not ( = ?auto_159558 ?auto_159564 ) ) ( not ( = ?auto_159558 ?auto_159563 ) ) ( not ( = ?auto_159558 ?auto_159561 ) ) ( not ( = ?auto_159558 ?auto_159556 ) ) ( not ( = ?auto_159564 ?auto_159563 ) ) ( not ( = ?auto_159564 ?auto_159561 ) ) ( not ( = ?auto_159564 ?auto_159556 ) ) ( not ( = ?auto_159563 ?auto_159561 ) ) ( not ( = ?auto_159563 ?auto_159556 ) ) ( ON ?auto_159556 ?auto_159562 ) ( not ( = ?auto_159556 ?auto_159562 ) ) ( not ( = ?auto_159561 ?auto_159562 ) ) ( not ( = ?auto_159560 ?auto_159562 ) ) ( not ( = ?auto_159559 ?auto_159562 ) ) ( not ( = ?auto_159557 ?auto_159562 ) ) ( not ( = ?auto_159558 ?auto_159562 ) ) ( not ( = ?auto_159564 ?auto_159562 ) ) ( not ( = ?auto_159563 ?auto_159562 ) ) ( ON ?auto_159561 ?auto_159556 ) ( ON-TABLE ?auto_159562 ) ( ON ?auto_159563 ?auto_159561 ) ( ON ?auto_159564 ?auto_159563 ) ( CLEAR ?auto_159564 ) ( HOLDING ?auto_159558 ) ( CLEAR ?auto_159557 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159560 ?auto_159559 ?auto_159557 ?auto_159558 )
      ( MAKE-1PILE ?auto_159556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159565 - BLOCK
    )
    :vars
    (
      ?auto_159571 - BLOCK
      ?auto_159570 - BLOCK
      ?auto_159566 - BLOCK
      ?auto_159572 - BLOCK
      ?auto_159568 - BLOCK
      ?auto_159573 - BLOCK
      ?auto_159567 - BLOCK
      ?auto_159569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159565 ?auto_159571 ) ) ( ON-TABLE ?auto_159570 ) ( ON ?auto_159566 ?auto_159570 ) ( ON ?auto_159572 ?auto_159566 ) ( not ( = ?auto_159570 ?auto_159566 ) ) ( not ( = ?auto_159570 ?auto_159572 ) ) ( not ( = ?auto_159570 ?auto_159568 ) ) ( not ( = ?auto_159570 ?auto_159573 ) ) ( not ( = ?auto_159570 ?auto_159567 ) ) ( not ( = ?auto_159570 ?auto_159571 ) ) ( not ( = ?auto_159570 ?auto_159565 ) ) ( not ( = ?auto_159566 ?auto_159572 ) ) ( not ( = ?auto_159566 ?auto_159568 ) ) ( not ( = ?auto_159566 ?auto_159573 ) ) ( not ( = ?auto_159566 ?auto_159567 ) ) ( not ( = ?auto_159566 ?auto_159571 ) ) ( not ( = ?auto_159566 ?auto_159565 ) ) ( not ( = ?auto_159572 ?auto_159568 ) ) ( not ( = ?auto_159572 ?auto_159573 ) ) ( not ( = ?auto_159572 ?auto_159567 ) ) ( not ( = ?auto_159572 ?auto_159571 ) ) ( not ( = ?auto_159572 ?auto_159565 ) ) ( not ( = ?auto_159568 ?auto_159573 ) ) ( not ( = ?auto_159568 ?auto_159567 ) ) ( not ( = ?auto_159568 ?auto_159571 ) ) ( not ( = ?auto_159568 ?auto_159565 ) ) ( not ( = ?auto_159573 ?auto_159567 ) ) ( not ( = ?auto_159573 ?auto_159571 ) ) ( not ( = ?auto_159573 ?auto_159565 ) ) ( not ( = ?auto_159567 ?auto_159571 ) ) ( not ( = ?auto_159567 ?auto_159565 ) ) ( ON ?auto_159565 ?auto_159569 ) ( not ( = ?auto_159565 ?auto_159569 ) ) ( not ( = ?auto_159571 ?auto_159569 ) ) ( not ( = ?auto_159570 ?auto_159569 ) ) ( not ( = ?auto_159566 ?auto_159569 ) ) ( not ( = ?auto_159572 ?auto_159569 ) ) ( not ( = ?auto_159568 ?auto_159569 ) ) ( not ( = ?auto_159573 ?auto_159569 ) ) ( not ( = ?auto_159567 ?auto_159569 ) ) ( ON ?auto_159571 ?auto_159565 ) ( ON-TABLE ?auto_159569 ) ( ON ?auto_159567 ?auto_159571 ) ( ON ?auto_159573 ?auto_159567 ) ( CLEAR ?auto_159572 ) ( ON ?auto_159568 ?auto_159573 ) ( CLEAR ?auto_159568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159569 ?auto_159565 ?auto_159571 ?auto_159567 ?auto_159573 )
      ( MAKE-1PILE ?auto_159565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159574 - BLOCK
    )
    :vars
    (
      ?auto_159582 - BLOCK
      ?auto_159576 - BLOCK
      ?auto_159581 - BLOCK
      ?auto_159575 - BLOCK
      ?auto_159579 - BLOCK
      ?auto_159580 - BLOCK
      ?auto_159577 - BLOCK
      ?auto_159578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159574 ?auto_159582 ) ) ( ON-TABLE ?auto_159576 ) ( ON ?auto_159581 ?auto_159576 ) ( not ( = ?auto_159576 ?auto_159581 ) ) ( not ( = ?auto_159576 ?auto_159575 ) ) ( not ( = ?auto_159576 ?auto_159579 ) ) ( not ( = ?auto_159576 ?auto_159580 ) ) ( not ( = ?auto_159576 ?auto_159577 ) ) ( not ( = ?auto_159576 ?auto_159582 ) ) ( not ( = ?auto_159576 ?auto_159574 ) ) ( not ( = ?auto_159581 ?auto_159575 ) ) ( not ( = ?auto_159581 ?auto_159579 ) ) ( not ( = ?auto_159581 ?auto_159580 ) ) ( not ( = ?auto_159581 ?auto_159577 ) ) ( not ( = ?auto_159581 ?auto_159582 ) ) ( not ( = ?auto_159581 ?auto_159574 ) ) ( not ( = ?auto_159575 ?auto_159579 ) ) ( not ( = ?auto_159575 ?auto_159580 ) ) ( not ( = ?auto_159575 ?auto_159577 ) ) ( not ( = ?auto_159575 ?auto_159582 ) ) ( not ( = ?auto_159575 ?auto_159574 ) ) ( not ( = ?auto_159579 ?auto_159580 ) ) ( not ( = ?auto_159579 ?auto_159577 ) ) ( not ( = ?auto_159579 ?auto_159582 ) ) ( not ( = ?auto_159579 ?auto_159574 ) ) ( not ( = ?auto_159580 ?auto_159577 ) ) ( not ( = ?auto_159580 ?auto_159582 ) ) ( not ( = ?auto_159580 ?auto_159574 ) ) ( not ( = ?auto_159577 ?auto_159582 ) ) ( not ( = ?auto_159577 ?auto_159574 ) ) ( ON ?auto_159574 ?auto_159578 ) ( not ( = ?auto_159574 ?auto_159578 ) ) ( not ( = ?auto_159582 ?auto_159578 ) ) ( not ( = ?auto_159576 ?auto_159578 ) ) ( not ( = ?auto_159581 ?auto_159578 ) ) ( not ( = ?auto_159575 ?auto_159578 ) ) ( not ( = ?auto_159579 ?auto_159578 ) ) ( not ( = ?auto_159580 ?auto_159578 ) ) ( not ( = ?auto_159577 ?auto_159578 ) ) ( ON ?auto_159582 ?auto_159574 ) ( ON-TABLE ?auto_159578 ) ( ON ?auto_159577 ?auto_159582 ) ( ON ?auto_159580 ?auto_159577 ) ( ON ?auto_159579 ?auto_159580 ) ( CLEAR ?auto_159579 ) ( HOLDING ?auto_159575 ) ( CLEAR ?auto_159581 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159576 ?auto_159581 ?auto_159575 )
      ( MAKE-1PILE ?auto_159574 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159583 - BLOCK
    )
    :vars
    (
      ?auto_159590 - BLOCK
      ?auto_159591 - BLOCK
      ?auto_159588 - BLOCK
      ?auto_159587 - BLOCK
      ?auto_159586 - BLOCK
      ?auto_159584 - BLOCK
      ?auto_159585 - BLOCK
      ?auto_159589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159583 ?auto_159590 ) ) ( ON-TABLE ?auto_159591 ) ( ON ?auto_159588 ?auto_159591 ) ( not ( = ?auto_159591 ?auto_159588 ) ) ( not ( = ?auto_159591 ?auto_159587 ) ) ( not ( = ?auto_159591 ?auto_159586 ) ) ( not ( = ?auto_159591 ?auto_159584 ) ) ( not ( = ?auto_159591 ?auto_159585 ) ) ( not ( = ?auto_159591 ?auto_159590 ) ) ( not ( = ?auto_159591 ?auto_159583 ) ) ( not ( = ?auto_159588 ?auto_159587 ) ) ( not ( = ?auto_159588 ?auto_159586 ) ) ( not ( = ?auto_159588 ?auto_159584 ) ) ( not ( = ?auto_159588 ?auto_159585 ) ) ( not ( = ?auto_159588 ?auto_159590 ) ) ( not ( = ?auto_159588 ?auto_159583 ) ) ( not ( = ?auto_159587 ?auto_159586 ) ) ( not ( = ?auto_159587 ?auto_159584 ) ) ( not ( = ?auto_159587 ?auto_159585 ) ) ( not ( = ?auto_159587 ?auto_159590 ) ) ( not ( = ?auto_159587 ?auto_159583 ) ) ( not ( = ?auto_159586 ?auto_159584 ) ) ( not ( = ?auto_159586 ?auto_159585 ) ) ( not ( = ?auto_159586 ?auto_159590 ) ) ( not ( = ?auto_159586 ?auto_159583 ) ) ( not ( = ?auto_159584 ?auto_159585 ) ) ( not ( = ?auto_159584 ?auto_159590 ) ) ( not ( = ?auto_159584 ?auto_159583 ) ) ( not ( = ?auto_159585 ?auto_159590 ) ) ( not ( = ?auto_159585 ?auto_159583 ) ) ( ON ?auto_159583 ?auto_159589 ) ( not ( = ?auto_159583 ?auto_159589 ) ) ( not ( = ?auto_159590 ?auto_159589 ) ) ( not ( = ?auto_159591 ?auto_159589 ) ) ( not ( = ?auto_159588 ?auto_159589 ) ) ( not ( = ?auto_159587 ?auto_159589 ) ) ( not ( = ?auto_159586 ?auto_159589 ) ) ( not ( = ?auto_159584 ?auto_159589 ) ) ( not ( = ?auto_159585 ?auto_159589 ) ) ( ON ?auto_159590 ?auto_159583 ) ( ON-TABLE ?auto_159589 ) ( ON ?auto_159585 ?auto_159590 ) ( ON ?auto_159584 ?auto_159585 ) ( ON ?auto_159586 ?auto_159584 ) ( CLEAR ?auto_159588 ) ( ON ?auto_159587 ?auto_159586 ) ( CLEAR ?auto_159587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159589 ?auto_159583 ?auto_159590 ?auto_159585 ?auto_159584 ?auto_159586 )
      ( MAKE-1PILE ?auto_159583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159592 - BLOCK
    )
    :vars
    (
      ?auto_159598 - BLOCK
      ?auto_159594 - BLOCK
      ?auto_159595 - BLOCK
      ?auto_159599 - BLOCK
      ?auto_159593 - BLOCK
      ?auto_159597 - BLOCK
      ?auto_159596 - BLOCK
      ?auto_159600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159592 ?auto_159598 ) ) ( ON-TABLE ?auto_159594 ) ( not ( = ?auto_159594 ?auto_159595 ) ) ( not ( = ?auto_159594 ?auto_159599 ) ) ( not ( = ?auto_159594 ?auto_159593 ) ) ( not ( = ?auto_159594 ?auto_159597 ) ) ( not ( = ?auto_159594 ?auto_159596 ) ) ( not ( = ?auto_159594 ?auto_159598 ) ) ( not ( = ?auto_159594 ?auto_159592 ) ) ( not ( = ?auto_159595 ?auto_159599 ) ) ( not ( = ?auto_159595 ?auto_159593 ) ) ( not ( = ?auto_159595 ?auto_159597 ) ) ( not ( = ?auto_159595 ?auto_159596 ) ) ( not ( = ?auto_159595 ?auto_159598 ) ) ( not ( = ?auto_159595 ?auto_159592 ) ) ( not ( = ?auto_159599 ?auto_159593 ) ) ( not ( = ?auto_159599 ?auto_159597 ) ) ( not ( = ?auto_159599 ?auto_159596 ) ) ( not ( = ?auto_159599 ?auto_159598 ) ) ( not ( = ?auto_159599 ?auto_159592 ) ) ( not ( = ?auto_159593 ?auto_159597 ) ) ( not ( = ?auto_159593 ?auto_159596 ) ) ( not ( = ?auto_159593 ?auto_159598 ) ) ( not ( = ?auto_159593 ?auto_159592 ) ) ( not ( = ?auto_159597 ?auto_159596 ) ) ( not ( = ?auto_159597 ?auto_159598 ) ) ( not ( = ?auto_159597 ?auto_159592 ) ) ( not ( = ?auto_159596 ?auto_159598 ) ) ( not ( = ?auto_159596 ?auto_159592 ) ) ( ON ?auto_159592 ?auto_159600 ) ( not ( = ?auto_159592 ?auto_159600 ) ) ( not ( = ?auto_159598 ?auto_159600 ) ) ( not ( = ?auto_159594 ?auto_159600 ) ) ( not ( = ?auto_159595 ?auto_159600 ) ) ( not ( = ?auto_159599 ?auto_159600 ) ) ( not ( = ?auto_159593 ?auto_159600 ) ) ( not ( = ?auto_159597 ?auto_159600 ) ) ( not ( = ?auto_159596 ?auto_159600 ) ) ( ON ?auto_159598 ?auto_159592 ) ( ON-TABLE ?auto_159600 ) ( ON ?auto_159596 ?auto_159598 ) ( ON ?auto_159597 ?auto_159596 ) ( ON ?auto_159593 ?auto_159597 ) ( ON ?auto_159599 ?auto_159593 ) ( CLEAR ?auto_159599 ) ( HOLDING ?auto_159595 ) ( CLEAR ?auto_159594 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159594 ?auto_159595 )
      ( MAKE-1PILE ?auto_159592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159601 - BLOCK
    )
    :vars
    (
      ?auto_159609 - BLOCK
      ?auto_159607 - BLOCK
      ?auto_159606 - BLOCK
      ?auto_159605 - BLOCK
      ?auto_159604 - BLOCK
      ?auto_159602 - BLOCK
      ?auto_159608 - BLOCK
      ?auto_159603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159601 ?auto_159609 ) ) ( ON-TABLE ?auto_159607 ) ( not ( = ?auto_159607 ?auto_159606 ) ) ( not ( = ?auto_159607 ?auto_159605 ) ) ( not ( = ?auto_159607 ?auto_159604 ) ) ( not ( = ?auto_159607 ?auto_159602 ) ) ( not ( = ?auto_159607 ?auto_159608 ) ) ( not ( = ?auto_159607 ?auto_159609 ) ) ( not ( = ?auto_159607 ?auto_159601 ) ) ( not ( = ?auto_159606 ?auto_159605 ) ) ( not ( = ?auto_159606 ?auto_159604 ) ) ( not ( = ?auto_159606 ?auto_159602 ) ) ( not ( = ?auto_159606 ?auto_159608 ) ) ( not ( = ?auto_159606 ?auto_159609 ) ) ( not ( = ?auto_159606 ?auto_159601 ) ) ( not ( = ?auto_159605 ?auto_159604 ) ) ( not ( = ?auto_159605 ?auto_159602 ) ) ( not ( = ?auto_159605 ?auto_159608 ) ) ( not ( = ?auto_159605 ?auto_159609 ) ) ( not ( = ?auto_159605 ?auto_159601 ) ) ( not ( = ?auto_159604 ?auto_159602 ) ) ( not ( = ?auto_159604 ?auto_159608 ) ) ( not ( = ?auto_159604 ?auto_159609 ) ) ( not ( = ?auto_159604 ?auto_159601 ) ) ( not ( = ?auto_159602 ?auto_159608 ) ) ( not ( = ?auto_159602 ?auto_159609 ) ) ( not ( = ?auto_159602 ?auto_159601 ) ) ( not ( = ?auto_159608 ?auto_159609 ) ) ( not ( = ?auto_159608 ?auto_159601 ) ) ( ON ?auto_159601 ?auto_159603 ) ( not ( = ?auto_159601 ?auto_159603 ) ) ( not ( = ?auto_159609 ?auto_159603 ) ) ( not ( = ?auto_159607 ?auto_159603 ) ) ( not ( = ?auto_159606 ?auto_159603 ) ) ( not ( = ?auto_159605 ?auto_159603 ) ) ( not ( = ?auto_159604 ?auto_159603 ) ) ( not ( = ?auto_159602 ?auto_159603 ) ) ( not ( = ?auto_159608 ?auto_159603 ) ) ( ON ?auto_159609 ?auto_159601 ) ( ON-TABLE ?auto_159603 ) ( ON ?auto_159608 ?auto_159609 ) ( ON ?auto_159602 ?auto_159608 ) ( ON ?auto_159604 ?auto_159602 ) ( ON ?auto_159605 ?auto_159604 ) ( CLEAR ?auto_159607 ) ( ON ?auto_159606 ?auto_159605 ) ( CLEAR ?auto_159606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159603 ?auto_159601 ?auto_159609 ?auto_159608 ?auto_159602 ?auto_159604 ?auto_159605 )
      ( MAKE-1PILE ?auto_159601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159610 - BLOCK
    )
    :vars
    (
      ?auto_159615 - BLOCK
      ?auto_159618 - BLOCK
      ?auto_159616 - BLOCK
      ?auto_159611 - BLOCK
      ?auto_159614 - BLOCK
      ?auto_159613 - BLOCK
      ?auto_159617 - BLOCK
      ?auto_159612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159610 ?auto_159615 ) ) ( not ( = ?auto_159618 ?auto_159616 ) ) ( not ( = ?auto_159618 ?auto_159611 ) ) ( not ( = ?auto_159618 ?auto_159614 ) ) ( not ( = ?auto_159618 ?auto_159613 ) ) ( not ( = ?auto_159618 ?auto_159617 ) ) ( not ( = ?auto_159618 ?auto_159615 ) ) ( not ( = ?auto_159618 ?auto_159610 ) ) ( not ( = ?auto_159616 ?auto_159611 ) ) ( not ( = ?auto_159616 ?auto_159614 ) ) ( not ( = ?auto_159616 ?auto_159613 ) ) ( not ( = ?auto_159616 ?auto_159617 ) ) ( not ( = ?auto_159616 ?auto_159615 ) ) ( not ( = ?auto_159616 ?auto_159610 ) ) ( not ( = ?auto_159611 ?auto_159614 ) ) ( not ( = ?auto_159611 ?auto_159613 ) ) ( not ( = ?auto_159611 ?auto_159617 ) ) ( not ( = ?auto_159611 ?auto_159615 ) ) ( not ( = ?auto_159611 ?auto_159610 ) ) ( not ( = ?auto_159614 ?auto_159613 ) ) ( not ( = ?auto_159614 ?auto_159617 ) ) ( not ( = ?auto_159614 ?auto_159615 ) ) ( not ( = ?auto_159614 ?auto_159610 ) ) ( not ( = ?auto_159613 ?auto_159617 ) ) ( not ( = ?auto_159613 ?auto_159615 ) ) ( not ( = ?auto_159613 ?auto_159610 ) ) ( not ( = ?auto_159617 ?auto_159615 ) ) ( not ( = ?auto_159617 ?auto_159610 ) ) ( ON ?auto_159610 ?auto_159612 ) ( not ( = ?auto_159610 ?auto_159612 ) ) ( not ( = ?auto_159615 ?auto_159612 ) ) ( not ( = ?auto_159618 ?auto_159612 ) ) ( not ( = ?auto_159616 ?auto_159612 ) ) ( not ( = ?auto_159611 ?auto_159612 ) ) ( not ( = ?auto_159614 ?auto_159612 ) ) ( not ( = ?auto_159613 ?auto_159612 ) ) ( not ( = ?auto_159617 ?auto_159612 ) ) ( ON ?auto_159615 ?auto_159610 ) ( ON-TABLE ?auto_159612 ) ( ON ?auto_159617 ?auto_159615 ) ( ON ?auto_159613 ?auto_159617 ) ( ON ?auto_159614 ?auto_159613 ) ( ON ?auto_159611 ?auto_159614 ) ( ON ?auto_159616 ?auto_159611 ) ( CLEAR ?auto_159616 ) ( HOLDING ?auto_159618 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159618 )
      ( MAKE-1PILE ?auto_159610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_159619 - BLOCK
    )
    :vars
    (
      ?auto_159623 - BLOCK
      ?auto_159626 - BLOCK
      ?auto_159622 - BLOCK
      ?auto_159620 - BLOCK
      ?auto_159624 - BLOCK
      ?auto_159621 - BLOCK
      ?auto_159625 - BLOCK
      ?auto_159627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159619 ?auto_159623 ) ) ( not ( = ?auto_159626 ?auto_159622 ) ) ( not ( = ?auto_159626 ?auto_159620 ) ) ( not ( = ?auto_159626 ?auto_159624 ) ) ( not ( = ?auto_159626 ?auto_159621 ) ) ( not ( = ?auto_159626 ?auto_159625 ) ) ( not ( = ?auto_159626 ?auto_159623 ) ) ( not ( = ?auto_159626 ?auto_159619 ) ) ( not ( = ?auto_159622 ?auto_159620 ) ) ( not ( = ?auto_159622 ?auto_159624 ) ) ( not ( = ?auto_159622 ?auto_159621 ) ) ( not ( = ?auto_159622 ?auto_159625 ) ) ( not ( = ?auto_159622 ?auto_159623 ) ) ( not ( = ?auto_159622 ?auto_159619 ) ) ( not ( = ?auto_159620 ?auto_159624 ) ) ( not ( = ?auto_159620 ?auto_159621 ) ) ( not ( = ?auto_159620 ?auto_159625 ) ) ( not ( = ?auto_159620 ?auto_159623 ) ) ( not ( = ?auto_159620 ?auto_159619 ) ) ( not ( = ?auto_159624 ?auto_159621 ) ) ( not ( = ?auto_159624 ?auto_159625 ) ) ( not ( = ?auto_159624 ?auto_159623 ) ) ( not ( = ?auto_159624 ?auto_159619 ) ) ( not ( = ?auto_159621 ?auto_159625 ) ) ( not ( = ?auto_159621 ?auto_159623 ) ) ( not ( = ?auto_159621 ?auto_159619 ) ) ( not ( = ?auto_159625 ?auto_159623 ) ) ( not ( = ?auto_159625 ?auto_159619 ) ) ( ON ?auto_159619 ?auto_159627 ) ( not ( = ?auto_159619 ?auto_159627 ) ) ( not ( = ?auto_159623 ?auto_159627 ) ) ( not ( = ?auto_159626 ?auto_159627 ) ) ( not ( = ?auto_159622 ?auto_159627 ) ) ( not ( = ?auto_159620 ?auto_159627 ) ) ( not ( = ?auto_159624 ?auto_159627 ) ) ( not ( = ?auto_159621 ?auto_159627 ) ) ( not ( = ?auto_159625 ?auto_159627 ) ) ( ON ?auto_159623 ?auto_159619 ) ( ON-TABLE ?auto_159627 ) ( ON ?auto_159625 ?auto_159623 ) ( ON ?auto_159621 ?auto_159625 ) ( ON ?auto_159624 ?auto_159621 ) ( ON ?auto_159620 ?auto_159624 ) ( ON ?auto_159622 ?auto_159620 ) ( ON ?auto_159626 ?auto_159622 ) ( CLEAR ?auto_159626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159627 ?auto_159619 ?auto_159623 ?auto_159625 ?auto_159621 ?auto_159624 ?auto_159620 ?auto_159622 )
      ( MAKE-1PILE ?auto_159619 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159634 - BLOCK
      ?auto_159635 - BLOCK
      ?auto_159636 - BLOCK
      ?auto_159637 - BLOCK
      ?auto_159638 - BLOCK
      ?auto_159639 - BLOCK
    )
    :vars
    (
      ?auto_159640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159640 ?auto_159639 ) ( CLEAR ?auto_159640 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159634 ) ( ON ?auto_159635 ?auto_159634 ) ( ON ?auto_159636 ?auto_159635 ) ( ON ?auto_159637 ?auto_159636 ) ( ON ?auto_159638 ?auto_159637 ) ( ON ?auto_159639 ?auto_159638 ) ( not ( = ?auto_159634 ?auto_159635 ) ) ( not ( = ?auto_159634 ?auto_159636 ) ) ( not ( = ?auto_159634 ?auto_159637 ) ) ( not ( = ?auto_159634 ?auto_159638 ) ) ( not ( = ?auto_159634 ?auto_159639 ) ) ( not ( = ?auto_159634 ?auto_159640 ) ) ( not ( = ?auto_159635 ?auto_159636 ) ) ( not ( = ?auto_159635 ?auto_159637 ) ) ( not ( = ?auto_159635 ?auto_159638 ) ) ( not ( = ?auto_159635 ?auto_159639 ) ) ( not ( = ?auto_159635 ?auto_159640 ) ) ( not ( = ?auto_159636 ?auto_159637 ) ) ( not ( = ?auto_159636 ?auto_159638 ) ) ( not ( = ?auto_159636 ?auto_159639 ) ) ( not ( = ?auto_159636 ?auto_159640 ) ) ( not ( = ?auto_159637 ?auto_159638 ) ) ( not ( = ?auto_159637 ?auto_159639 ) ) ( not ( = ?auto_159637 ?auto_159640 ) ) ( not ( = ?auto_159638 ?auto_159639 ) ) ( not ( = ?auto_159638 ?auto_159640 ) ) ( not ( = ?auto_159639 ?auto_159640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159640 ?auto_159639 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159641 - BLOCK
      ?auto_159642 - BLOCK
      ?auto_159643 - BLOCK
      ?auto_159644 - BLOCK
      ?auto_159645 - BLOCK
      ?auto_159646 - BLOCK
    )
    :vars
    (
      ?auto_159647 - BLOCK
      ?auto_159648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159647 ?auto_159646 ) ( CLEAR ?auto_159647 ) ( ON-TABLE ?auto_159641 ) ( ON ?auto_159642 ?auto_159641 ) ( ON ?auto_159643 ?auto_159642 ) ( ON ?auto_159644 ?auto_159643 ) ( ON ?auto_159645 ?auto_159644 ) ( ON ?auto_159646 ?auto_159645 ) ( not ( = ?auto_159641 ?auto_159642 ) ) ( not ( = ?auto_159641 ?auto_159643 ) ) ( not ( = ?auto_159641 ?auto_159644 ) ) ( not ( = ?auto_159641 ?auto_159645 ) ) ( not ( = ?auto_159641 ?auto_159646 ) ) ( not ( = ?auto_159641 ?auto_159647 ) ) ( not ( = ?auto_159642 ?auto_159643 ) ) ( not ( = ?auto_159642 ?auto_159644 ) ) ( not ( = ?auto_159642 ?auto_159645 ) ) ( not ( = ?auto_159642 ?auto_159646 ) ) ( not ( = ?auto_159642 ?auto_159647 ) ) ( not ( = ?auto_159643 ?auto_159644 ) ) ( not ( = ?auto_159643 ?auto_159645 ) ) ( not ( = ?auto_159643 ?auto_159646 ) ) ( not ( = ?auto_159643 ?auto_159647 ) ) ( not ( = ?auto_159644 ?auto_159645 ) ) ( not ( = ?auto_159644 ?auto_159646 ) ) ( not ( = ?auto_159644 ?auto_159647 ) ) ( not ( = ?auto_159645 ?auto_159646 ) ) ( not ( = ?auto_159645 ?auto_159647 ) ) ( not ( = ?auto_159646 ?auto_159647 ) ) ( HOLDING ?auto_159648 ) ( not ( = ?auto_159641 ?auto_159648 ) ) ( not ( = ?auto_159642 ?auto_159648 ) ) ( not ( = ?auto_159643 ?auto_159648 ) ) ( not ( = ?auto_159644 ?auto_159648 ) ) ( not ( = ?auto_159645 ?auto_159648 ) ) ( not ( = ?auto_159646 ?auto_159648 ) ) ( not ( = ?auto_159647 ?auto_159648 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_159648 )
      ( MAKE-6PILE ?auto_159641 ?auto_159642 ?auto_159643 ?auto_159644 ?auto_159645 ?auto_159646 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159649 - BLOCK
      ?auto_159650 - BLOCK
      ?auto_159651 - BLOCK
      ?auto_159652 - BLOCK
      ?auto_159653 - BLOCK
      ?auto_159654 - BLOCK
    )
    :vars
    (
      ?auto_159655 - BLOCK
      ?auto_159656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159655 ?auto_159654 ) ( ON-TABLE ?auto_159649 ) ( ON ?auto_159650 ?auto_159649 ) ( ON ?auto_159651 ?auto_159650 ) ( ON ?auto_159652 ?auto_159651 ) ( ON ?auto_159653 ?auto_159652 ) ( ON ?auto_159654 ?auto_159653 ) ( not ( = ?auto_159649 ?auto_159650 ) ) ( not ( = ?auto_159649 ?auto_159651 ) ) ( not ( = ?auto_159649 ?auto_159652 ) ) ( not ( = ?auto_159649 ?auto_159653 ) ) ( not ( = ?auto_159649 ?auto_159654 ) ) ( not ( = ?auto_159649 ?auto_159655 ) ) ( not ( = ?auto_159650 ?auto_159651 ) ) ( not ( = ?auto_159650 ?auto_159652 ) ) ( not ( = ?auto_159650 ?auto_159653 ) ) ( not ( = ?auto_159650 ?auto_159654 ) ) ( not ( = ?auto_159650 ?auto_159655 ) ) ( not ( = ?auto_159651 ?auto_159652 ) ) ( not ( = ?auto_159651 ?auto_159653 ) ) ( not ( = ?auto_159651 ?auto_159654 ) ) ( not ( = ?auto_159651 ?auto_159655 ) ) ( not ( = ?auto_159652 ?auto_159653 ) ) ( not ( = ?auto_159652 ?auto_159654 ) ) ( not ( = ?auto_159652 ?auto_159655 ) ) ( not ( = ?auto_159653 ?auto_159654 ) ) ( not ( = ?auto_159653 ?auto_159655 ) ) ( not ( = ?auto_159654 ?auto_159655 ) ) ( not ( = ?auto_159649 ?auto_159656 ) ) ( not ( = ?auto_159650 ?auto_159656 ) ) ( not ( = ?auto_159651 ?auto_159656 ) ) ( not ( = ?auto_159652 ?auto_159656 ) ) ( not ( = ?auto_159653 ?auto_159656 ) ) ( not ( = ?auto_159654 ?auto_159656 ) ) ( not ( = ?auto_159655 ?auto_159656 ) ) ( ON ?auto_159656 ?auto_159655 ) ( CLEAR ?auto_159656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159649 ?auto_159650 ?auto_159651 ?auto_159652 ?auto_159653 ?auto_159654 ?auto_159655 )
      ( MAKE-6PILE ?auto_159649 ?auto_159650 ?auto_159651 ?auto_159652 ?auto_159653 ?auto_159654 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159657 - BLOCK
      ?auto_159658 - BLOCK
      ?auto_159659 - BLOCK
      ?auto_159660 - BLOCK
      ?auto_159661 - BLOCK
      ?auto_159662 - BLOCK
    )
    :vars
    (
      ?auto_159663 - BLOCK
      ?auto_159664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159663 ?auto_159662 ) ( ON-TABLE ?auto_159657 ) ( ON ?auto_159658 ?auto_159657 ) ( ON ?auto_159659 ?auto_159658 ) ( ON ?auto_159660 ?auto_159659 ) ( ON ?auto_159661 ?auto_159660 ) ( ON ?auto_159662 ?auto_159661 ) ( not ( = ?auto_159657 ?auto_159658 ) ) ( not ( = ?auto_159657 ?auto_159659 ) ) ( not ( = ?auto_159657 ?auto_159660 ) ) ( not ( = ?auto_159657 ?auto_159661 ) ) ( not ( = ?auto_159657 ?auto_159662 ) ) ( not ( = ?auto_159657 ?auto_159663 ) ) ( not ( = ?auto_159658 ?auto_159659 ) ) ( not ( = ?auto_159658 ?auto_159660 ) ) ( not ( = ?auto_159658 ?auto_159661 ) ) ( not ( = ?auto_159658 ?auto_159662 ) ) ( not ( = ?auto_159658 ?auto_159663 ) ) ( not ( = ?auto_159659 ?auto_159660 ) ) ( not ( = ?auto_159659 ?auto_159661 ) ) ( not ( = ?auto_159659 ?auto_159662 ) ) ( not ( = ?auto_159659 ?auto_159663 ) ) ( not ( = ?auto_159660 ?auto_159661 ) ) ( not ( = ?auto_159660 ?auto_159662 ) ) ( not ( = ?auto_159660 ?auto_159663 ) ) ( not ( = ?auto_159661 ?auto_159662 ) ) ( not ( = ?auto_159661 ?auto_159663 ) ) ( not ( = ?auto_159662 ?auto_159663 ) ) ( not ( = ?auto_159657 ?auto_159664 ) ) ( not ( = ?auto_159658 ?auto_159664 ) ) ( not ( = ?auto_159659 ?auto_159664 ) ) ( not ( = ?auto_159660 ?auto_159664 ) ) ( not ( = ?auto_159661 ?auto_159664 ) ) ( not ( = ?auto_159662 ?auto_159664 ) ) ( not ( = ?auto_159663 ?auto_159664 ) ) ( HOLDING ?auto_159664 ) ( CLEAR ?auto_159663 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159657 ?auto_159658 ?auto_159659 ?auto_159660 ?auto_159661 ?auto_159662 ?auto_159663 ?auto_159664 )
      ( MAKE-6PILE ?auto_159657 ?auto_159658 ?auto_159659 ?auto_159660 ?auto_159661 ?auto_159662 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159665 - BLOCK
      ?auto_159666 - BLOCK
      ?auto_159667 - BLOCK
      ?auto_159668 - BLOCK
      ?auto_159669 - BLOCK
      ?auto_159670 - BLOCK
    )
    :vars
    (
      ?auto_159671 - BLOCK
      ?auto_159672 - BLOCK
      ?auto_159673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159671 ?auto_159670 ) ( ON-TABLE ?auto_159665 ) ( ON ?auto_159666 ?auto_159665 ) ( ON ?auto_159667 ?auto_159666 ) ( ON ?auto_159668 ?auto_159667 ) ( ON ?auto_159669 ?auto_159668 ) ( ON ?auto_159670 ?auto_159669 ) ( not ( = ?auto_159665 ?auto_159666 ) ) ( not ( = ?auto_159665 ?auto_159667 ) ) ( not ( = ?auto_159665 ?auto_159668 ) ) ( not ( = ?auto_159665 ?auto_159669 ) ) ( not ( = ?auto_159665 ?auto_159670 ) ) ( not ( = ?auto_159665 ?auto_159671 ) ) ( not ( = ?auto_159666 ?auto_159667 ) ) ( not ( = ?auto_159666 ?auto_159668 ) ) ( not ( = ?auto_159666 ?auto_159669 ) ) ( not ( = ?auto_159666 ?auto_159670 ) ) ( not ( = ?auto_159666 ?auto_159671 ) ) ( not ( = ?auto_159667 ?auto_159668 ) ) ( not ( = ?auto_159667 ?auto_159669 ) ) ( not ( = ?auto_159667 ?auto_159670 ) ) ( not ( = ?auto_159667 ?auto_159671 ) ) ( not ( = ?auto_159668 ?auto_159669 ) ) ( not ( = ?auto_159668 ?auto_159670 ) ) ( not ( = ?auto_159668 ?auto_159671 ) ) ( not ( = ?auto_159669 ?auto_159670 ) ) ( not ( = ?auto_159669 ?auto_159671 ) ) ( not ( = ?auto_159670 ?auto_159671 ) ) ( not ( = ?auto_159665 ?auto_159672 ) ) ( not ( = ?auto_159666 ?auto_159672 ) ) ( not ( = ?auto_159667 ?auto_159672 ) ) ( not ( = ?auto_159668 ?auto_159672 ) ) ( not ( = ?auto_159669 ?auto_159672 ) ) ( not ( = ?auto_159670 ?auto_159672 ) ) ( not ( = ?auto_159671 ?auto_159672 ) ) ( CLEAR ?auto_159671 ) ( ON ?auto_159672 ?auto_159673 ) ( CLEAR ?auto_159672 ) ( HAND-EMPTY ) ( not ( = ?auto_159665 ?auto_159673 ) ) ( not ( = ?auto_159666 ?auto_159673 ) ) ( not ( = ?auto_159667 ?auto_159673 ) ) ( not ( = ?auto_159668 ?auto_159673 ) ) ( not ( = ?auto_159669 ?auto_159673 ) ) ( not ( = ?auto_159670 ?auto_159673 ) ) ( not ( = ?auto_159671 ?auto_159673 ) ) ( not ( = ?auto_159672 ?auto_159673 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159672 ?auto_159673 )
      ( MAKE-6PILE ?auto_159665 ?auto_159666 ?auto_159667 ?auto_159668 ?auto_159669 ?auto_159670 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159692 - BLOCK
      ?auto_159693 - BLOCK
      ?auto_159694 - BLOCK
      ?auto_159695 - BLOCK
      ?auto_159696 - BLOCK
      ?auto_159697 - BLOCK
    )
    :vars
    (
      ?auto_159700 - BLOCK
      ?auto_159699 - BLOCK
      ?auto_159698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159692 ) ( ON ?auto_159693 ?auto_159692 ) ( ON ?auto_159694 ?auto_159693 ) ( ON ?auto_159695 ?auto_159694 ) ( ON ?auto_159696 ?auto_159695 ) ( not ( = ?auto_159692 ?auto_159693 ) ) ( not ( = ?auto_159692 ?auto_159694 ) ) ( not ( = ?auto_159692 ?auto_159695 ) ) ( not ( = ?auto_159692 ?auto_159696 ) ) ( not ( = ?auto_159692 ?auto_159697 ) ) ( not ( = ?auto_159692 ?auto_159700 ) ) ( not ( = ?auto_159693 ?auto_159694 ) ) ( not ( = ?auto_159693 ?auto_159695 ) ) ( not ( = ?auto_159693 ?auto_159696 ) ) ( not ( = ?auto_159693 ?auto_159697 ) ) ( not ( = ?auto_159693 ?auto_159700 ) ) ( not ( = ?auto_159694 ?auto_159695 ) ) ( not ( = ?auto_159694 ?auto_159696 ) ) ( not ( = ?auto_159694 ?auto_159697 ) ) ( not ( = ?auto_159694 ?auto_159700 ) ) ( not ( = ?auto_159695 ?auto_159696 ) ) ( not ( = ?auto_159695 ?auto_159697 ) ) ( not ( = ?auto_159695 ?auto_159700 ) ) ( not ( = ?auto_159696 ?auto_159697 ) ) ( not ( = ?auto_159696 ?auto_159700 ) ) ( not ( = ?auto_159697 ?auto_159700 ) ) ( not ( = ?auto_159692 ?auto_159699 ) ) ( not ( = ?auto_159693 ?auto_159699 ) ) ( not ( = ?auto_159694 ?auto_159699 ) ) ( not ( = ?auto_159695 ?auto_159699 ) ) ( not ( = ?auto_159696 ?auto_159699 ) ) ( not ( = ?auto_159697 ?auto_159699 ) ) ( not ( = ?auto_159700 ?auto_159699 ) ) ( ON ?auto_159699 ?auto_159698 ) ( not ( = ?auto_159692 ?auto_159698 ) ) ( not ( = ?auto_159693 ?auto_159698 ) ) ( not ( = ?auto_159694 ?auto_159698 ) ) ( not ( = ?auto_159695 ?auto_159698 ) ) ( not ( = ?auto_159696 ?auto_159698 ) ) ( not ( = ?auto_159697 ?auto_159698 ) ) ( not ( = ?auto_159700 ?auto_159698 ) ) ( not ( = ?auto_159699 ?auto_159698 ) ) ( ON ?auto_159700 ?auto_159699 ) ( CLEAR ?auto_159700 ) ( HOLDING ?auto_159697 ) ( CLEAR ?auto_159696 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159692 ?auto_159693 ?auto_159694 ?auto_159695 ?auto_159696 ?auto_159697 ?auto_159700 )
      ( MAKE-6PILE ?auto_159692 ?auto_159693 ?auto_159694 ?auto_159695 ?auto_159696 ?auto_159697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159701 - BLOCK
      ?auto_159702 - BLOCK
      ?auto_159703 - BLOCK
      ?auto_159704 - BLOCK
      ?auto_159705 - BLOCK
      ?auto_159706 - BLOCK
    )
    :vars
    (
      ?auto_159709 - BLOCK
      ?auto_159708 - BLOCK
      ?auto_159707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159701 ) ( ON ?auto_159702 ?auto_159701 ) ( ON ?auto_159703 ?auto_159702 ) ( ON ?auto_159704 ?auto_159703 ) ( ON ?auto_159705 ?auto_159704 ) ( not ( = ?auto_159701 ?auto_159702 ) ) ( not ( = ?auto_159701 ?auto_159703 ) ) ( not ( = ?auto_159701 ?auto_159704 ) ) ( not ( = ?auto_159701 ?auto_159705 ) ) ( not ( = ?auto_159701 ?auto_159706 ) ) ( not ( = ?auto_159701 ?auto_159709 ) ) ( not ( = ?auto_159702 ?auto_159703 ) ) ( not ( = ?auto_159702 ?auto_159704 ) ) ( not ( = ?auto_159702 ?auto_159705 ) ) ( not ( = ?auto_159702 ?auto_159706 ) ) ( not ( = ?auto_159702 ?auto_159709 ) ) ( not ( = ?auto_159703 ?auto_159704 ) ) ( not ( = ?auto_159703 ?auto_159705 ) ) ( not ( = ?auto_159703 ?auto_159706 ) ) ( not ( = ?auto_159703 ?auto_159709 ) ) ( not ( = ?auto_159704 ?auto_159705 ) ) ( not ( = ?auto_159704 ?auto_159706 ) ) ( not ( = ?auto_159704 ?auto_159709 ) ) ( not ( = ?auto_159705 ?auto_159706 ) ) ( not ( = ?auto_159705 ?auto_159709 ) ) ( not ( = ?auto_159706 ?auto_159709 ) ) ( not ( = ?auto_159701 ?auto_159708 ) ) ( not ( = ?auto_159702 ?auto_159708 ) ) ( not ( = ?auto_159703 ?auto_159708 ) ) ( not ( = ?auto_159704 ?auto_159708 ) ) ( not ( = ?auto_159705 ?auto_159708 ) ) ( not ( = ?auto_159706 ?auto_159708 ) ) ( not ( = ?auto_159709 ?auto_159708 ) ) ( ON ?auto_159708 ?auto_159707 ) ( not ( = ?auto_159701 ?auto_159707 ) ) ( not ( = ?auto_159702 ?auto_159707 ) ) ( not ( = ?auto_159703 ?auto_159707 ) ) ( not ( = ?auto_159704 ?auto_159707 ) ) ( not ( = ?auto_159705 ?auto_159707 ) ) ( not ( = ?auto_159706 ?auto_159707 ) ) ( not ( = ?auto_159709 ?auto_159707 ) ) ( not ( = ?auto_159708 ?auto_159707 ) ) ( ON ?auto_159709 ?auto_159708 ) ( CLEAR ?auto_159705 ) ( ON ?auto_159706 ?auto_159709 ) ( CLEAR ?auto_159706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159707 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159707 ?auto_159708 ?auto_159709 )
      ( MAKE-6PILE ?auto_159701 ?auto_159702 ?auto_159703 ?auto_159704 ?auto_159705 ?auto_159706 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159710 - BLOCK
      ?auto_159711 - BLOCK
      ?auto_159712 - BLOCK
      ?auto_159713 - BLOCK
      ?auto_159714 - BLOCK
      ?auto_159715 - BLOCK
    )
    :vars
    (
      ?auto_159716 - BLOCK
      ?auto_159718 - BLOCK
      ?auto_159717 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159710 ) ( ON ?auto_159711 ?auto_159710 ) ( ON ?auto_159712 ?auto_159711 ) ( ON ?auto_159713 ?auto_159712 ) ( not ( = ?auto_159710 ?auto_159711 ) ) ( not ( = ?auto_159710 ?auto_159712 ) ) ( not ( = ?auto_159710 ?auto_159713 ) ) ( not ( = ?auto_159710 ?auto_159714 ) ) ( not ( = ?auto_159710 ?auto_159715 ) ) ( not ( = ?auto_159710 ?auto_159716 ) ) ( not ( = ?auto_159711 ?auto_159712 ) ) ( not ( = ?auto_159711 ?auto_159713 ) ) ( not ( = ?auto_159711 ?auto_159714 ) ) ( not ( = ?auto_159711 ?auto_159715 ) ) ( not ( = ?auto_159711 ?auto_159716 ) ) ( not ( = ?auto_159712 ?auto_159713 ) ) ( not ( = ?auto_159712 ?auto_159714 ) ) ( not ( = ?auto_159712 ?auto_159715 ) ) ( not ( = ?auto_159712 ?auto_159716 ) ) ( not ( = ?auto_159713 ?auto_159714 ) ) ( not ( = ?auto_159713 ?auto_159715 ) ) ( not ( = ?auto_159713 ?auto_159716 ) ) ( not ( = ?auto_159714 ?auto_159715 ) ) ( not ( = ?auto_159714 ?auto_159716 ) ) ( not ( = ?auto_159715 ?auto_159716 ) ) ( not ( = ?auto_159710 ?auto_159718 ) ) ( not ( = ?auto_159711 ?auto_159718 ) ) ( not ( = ?auto_159712 ?auto_159718 ) ) ( not ( = ?auto_159713 ?auto_159718 ) ) ( not ( = ?auto_159714 ?auto_159718 ) ) ( not ( = ?auto_159715 ?auto_159718 ) ) ( not ( = ?auto_159716 ?auto_159718 ) ) ( ON ?auto_159718 ?auto_159717 ) ( not ( = ?auto_159710 ?auto_159717 ) ) ( not ( = ?auto_159711 ?auto_159717 ) ) ( not ( = ?auto_159712 ?auto_159717 ) ) ( not ( = ?auto_159713 ?auto_159717 ) ) ( not ( = ?auto_159714 ?auto_159717 ) ) ( not ( = ?auto_159715 ?auto_159717 ) ) ( not ( = ?auto_159716 ?auto_159717 ) ) ( not ( = ?auto_159718 ?auto_159717 ) ) ( ON ?auto_159716 ?auto_159718 ) ( ON ?auto_159715 ?auto_159716 ) ( CLEAR ?auto_159715 ) ( ON-TABLE ?auto_159717 ) ( HOLDING ?auto_159714 ) ( CLEAR ?auto_159713 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159710 ?auto_159711 ?auto_159712 ?auto_159713 ?auto_159714 )
      ( MAKE-6PILE ?auto_159710 ?auto_159711 ?auto_159712 ?auto_159713 ?auto_159714 ?auto_159715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159719 - BLOCK
      ?auto_159720 - BLOCK
      ?auto_159721 - BLOCK
      ?auto_159722 - BLOCK
      ?auto_159723 - BLOCK
      ?auto_159724 - BLOCK
    )
    :vars
    (
      ?auto_159725 - BLOCK
      ?auto_159727 - BLOCK
      ?auto_159726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159719 ) ( ON ?auto_159720 ?auto_159719 ) ( ON ?auto_159721 ?auto_159720 ) ( ON ?auto_159722 ?auto_159721 ) ( not ( = ?auto_159719 ?auto_159720 ) ) ( not ( = ?auto_159719 ?auto_159721 ) ) ( not ( = ?auto_159719 ?auto_159722 ) ) ( not ( = ?auto_159719 ?auto_159723 ) ) ( not ( = ?auto_159719 ?auto_159724 ) ) ( not ( = ?auto_159719 ?auto_159725 ) ) ( not ( = ?auto_159720 ?auto_159721 ) ) ( not ( = ?auto_159720 ?auto_159722 ) ) ( not ( = ?auto_159720 ?auto_159723 ) ) ( not ( = ?auto_159720 ?auto_159724 ) ) ( not ( = ?auto_159720 ?auto_159725 ) ) ( not ( = ?auto_159721 ?auto_159722 ) ) ( not ( = ?auto_159721 ?auto_159723 ) ) ( not ( = ?auto_159721 ?auto_159724 ) ) ( not ( = ?auto_159721 ?auto_159725 ) ) ( not ( = ?auto_159722 ?auto_159723 ) ) ( not ( = ?auto_159722 ?auto_159724 ) ) ( not ( = ?auto_159722 ?auto_159725 ) ) ( not ( = ?auto_159723 ?auto_159724 ) ) ( not ( = ?auto_159723 ?auto_159725 ) ) ( not ( = ?auto_159724 ?auto_159725 ) ) ( not ( = ?auto_159719 ?auto_159727 ) ) ( not ( = ?auto_159720 ?auto_159727 ) ) ( not ( = ?auto_159721 ?auto_159727 ) ) ( not ( = ?auto_159722 ?auto_159727 ) ) ( not ( = ?auto_159723 ?auto_159727 ) ) ( not ( = ?auto_159724 ?auto_159727 ) ) ( not ( = ?auto_159725 ?auto_159727 ) ) ( ON ?auto_159727 ?auto_159726 ) ( not ( = ?auto_159719 ?auto_159726 ) ) ( not ( = ?auto_159720 ?auto_159726 ) ) ( not ( = ?auto_159721 ?auto_159726 ) ) ( not ( = ?auto_159722 ?auto_159726 ) ) ( not ( = ?auto_159723 ?auto_159726 ) ) ( not ( = ?auto_159724 ?auto_159726 ) ) ( not ( = ?auto_159725 ?auto_159726 ) ) ( not ( = ?auto_159727 ?auto_159726 ) ) ( ON ?auto_159725 ?auto_159727 ) ( ON ?auto_159724 ?auto_159725 ) ( ON-TABLE ?auto_159726 ) ( CLEAR ?auto_159722 ) ( ON ?auto_159723 ?auto_159724 ) ( CLEAR ?auto_159723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159726 ?auto_159727 ?auto_159725 ?auto_159724 )
      ( MAKE-6PILE ?auto_159719 ?auto_159720 ?auto_159721 ?auto_159722 ?auto_159723 ?auto_159724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159728 - BLOCK
      ?auto_159729 - BLOCK
      ?auto_159730 - BLOCK
      ?auto_159731 - BLOCK
      ?auto_159732 - BLOCK
      ?auto_159733 - BLOCK
    )
    :vars
    (
      ?auto_159735 - BLOCK
      ?auto_159734 - BLOCK
      ?auto_159736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159728 ) ( ON ?auto_159729 ?auto_159728 ) ( ON ?auto_159730 ?auto_159729 ) ( not ( = ?auto_159728 ?auto_159729 ) ) ( not ( = ?auto_159728 ?auto_159730 ) ) ( not ( = ?auto_159728 ?auto_159731 ) ) ( not ( = ?auto_159728 ?auto_159732 ) ) ( not ( = ?auto_159728 ?auto_159733 ) ) ( not ( = ?auto_159728 ?auto_159735 ) ) ( not ( = ?auto_159729 ?auto_159730 ) ) ( not ( = ?auto_159729 ?auto_159731 ) ) ( not ( = ?auto_159729 ?auto_159732 ) ) ( not ( = ?auto_159729 ?auto_159733 ) ) ( not ( = ?auto_159729 ?auto_159735 ) ) ( not ( = ?auto_159730 ?auto_159731 ) ) ( not ( = ?auto_159730 ?auto_159732 ) ) ( not ( = ?auto_159730 ?auto_159733 ) ) ( not ( = ?auto_159730 ?auto_159735 ) ) ( not ( = ?auto_159731 ?auto_159732 ) ) ( not ( = ?auto_159731 ?auto_159733 ) ) ( not ( = ?auto_159731 ?auto_159735 ) ) ( not ( = ?auto_159732 ?auto_159733 ) ) ( not ( = ?auto_159732 ?auto_159735 ) ) ( not ( = ?auto_159733 ?auto_159735 ) ) ( not ( = ?auto_159728 ?auto_159734 ) ) ( not ( = ?auto_159729 ?auto_159734 ) ) ( not ( = ?auto_159730 ?auto_159734 ) ) ( not ( = ?auto_159731 ?auto_159734 ) ) ( not ( = ?auto_159732 ?auto_159734 ) ) ( not ( = ?auto_159733 ?auto_159734 ) ) ( not ( = ?auto_159735 ?auto_159734 ) ) ( ON ?auto_159734 ?auto_159736 ) ( not ( = ?auto_159728 ?auto_159736 ) ) ( not ( = ?auto_159729 ?auto_159736 ) ) ( not ( = ?auto_159730 ?auto_159736 ) ) ( not ( = ?auto_159731 ?auto_159736 ) ) ( not ( = ?auto_159732 ?auto_159736 ) ) ( not ( = ?auto_159733 ?auto_159736 ) ) ( not ( = ?auto_159735 ?auto_159736 ) ) ( not ( = ?auto_159734 ?auto_159736 ) ) ( ON ?auto_159735 ?auto_159734 ) ( ON ?auto_159733 ?auto_159735 ) ( ON-TABLE ?auto_159736 ) ( ON ?auto_159732 ?auto_159733 ) ( CLEAR ?auto_159732 ) ( HOLDING ?auto_159731 ) ( CLEAR ?auto_159730 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159728 ?auto_159729 ?auto_159730 ?auto_159731 )
      ( MAKE-6PILE ?auto_159728 ?auto_159729 ?auto_159730 ?auto_159731 ?auto_159732 ?auto_159733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159737 - BLOCK
      ?auto_159738 - BLOCK
      ?auto_159739 - BLOCK
      ?auto_159740 - BLOCK
      ?auto_159741 - BLOCK
      ?auto_159742 - BLOCK
    )
    :vars
    (
      ?auto_159743 - BLOCK
      ?auto_159744 - BLOCK
      ?auto_159745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159737 ) ( ON ?auto_159738 ?auto_159737 ) ( ON ?auto_159739 ?auto_159738 ) ( not ( = ?auto_159737 ?auto_159738 ) ) ( not ( = ?auto_159737 ?auto_159739 ) ) ( not ( = ?auto_159737 ?auto_159740 ) ) ( not ( = ?auto_159737 ?auto_159741 ) ) ( not ( = ?auto_159737 ?auto_159742 ) ) ( not ( = ?auto_159737 ?auto_159743 ) ) ( not ( = ?auto_159738 ?auto_159739 ) ) ( not ( = ?auto_159738 ?auto_159740 ) ) ( not ( = ?auto_159738 ?auto_159741 ) ) ( not ( = ?auto_159738 ?auto_159742 ) ) ( not ( = ?auto_159738 ?auto_159743 ) ) ( not ( = ?auto_159739 ?auto_159740 ) ) ( not ( = ?auto_159739 ?auto_159741 ) ) ( not ( = ?auto_159739 ?auto_159742 ) ) ( not ( = ?auto_159739 ?auto_159743 ) ) ( not ( = ?auto_159740 ?auto_159741 ) ) ( not ( = ?auto_159740 ?auto_159742 ) ) ( not ( = ?auto_159740 ?auto_159743 ) ) ( not ( = ?auto_159741 ?auto_159742 ) ) ( not ( = ?auto_159741 ?auto_159743 ) ) ( not ( = ?auto_159742 ?auto_159743 ) ) ( not ( = ?auto_159737 ?auto_159744 ) ) ( not ( = ?auto_159738 ?auto_159744 ) ) ( not ( = ?auto_159739 ?auto_159744 ) ) ( not ( = ?auto_159740 ?auto_159744 ) ) ( not ( = ?auto_159741 ?auto_159744 ) ) ( not ( = ?auto_159742 ?auto_159744 ) ) ( not ( = ?auto_159743 ?auto_159744 ) ) ( ON ?auto_159744 ?auto_159745 ) ( not ( = ?auto_159737 ?auto_159745 ) ) ( not ( = ?auto_159738 ?auto_159745 ) ) ( not ( = ?auto_159739 ?auto_159745 ) ) ( not ( = ?auto_159740 ?auto_159745 ) ) ( not ( = ?auto_159741 ?auto_159745 ) ) ( not ( = ?auto_159742 ?auto_159745 ) ) ( not ( = ?auto_159743 ?auto_159745 ) ) ( not ( = ?auto_159744 ?auto_159745 ) ) ( ON ?auto_159743 ?auto_159744 ) ( ON ?auto_159742 ?auto_159743 ) ( ON-TABLE ?auto_159745 ) ( ON ?auto_159741 ?auto_159742 ) ( CLEAR ?auto_159739 ) ( ON ?auto_159740 ?auto_159741 ) ( CLEAR ?auto_159740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159745 ?auto_159744 ?auto_159743 ?auto_159742 ?auto_159741 )
      ( MAKE-6PILE ?auto_159737 ?auto_159738 ?auto_159739 ?auto_159740 ?auto_159741 ?auto_159742 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159746 - BLOCK
      ?auto_159747 - BLOCK
      ?auto_159748 - BLOCK
      ?auto_159749 - BLOCK
      ?auto_159750 - BLOCK
      ?auto_159751 - BLOCK
    )
    :vars
    (
      ?auto_159753 - BLOCK
      ?auto_159752 - BLOCK
      ?auto_159754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159746 ) ( ON ?auto_159747 ?auto_159746 ) ( not ( = ?auto_159746 ?auto_159747 ) ) ( not ( = ?auto_159746 ?auto_159748 ) ) ( not ( = ?auto_159746 ?auto_159749 ) ) ( not ( = ?auto_159746 ?auto_159750 ) ) ( not ( = ?auto_159746 ?auto_159751 ) ) ( not ( = ?auto_159746 ?auto_159753 ) ) ( not ( = ?auto_159747 ?auto_159748 ) ) ( not ( = ?auto_159747 ?auto_159749 ) ) ( not ( = ?auto_159747 ?auto_159750 ) ) ( not ( = ?auto_159747 ?auto_159751 ) ) ( not ( = ?auto_159747 ?auto_159753 ) ) ( not ( = ?auto_159748 ?auto_159749 ) ) ( not ( = ?auto_159748 ?auto_159750 ) ) ( not ( = ?auto_159748 ?auto_159751 ) ) ( not ( = ?auto_159748 ?auto_159753 ) ) ( not ( = ?auto_159749 ?auto_159750 ) ) ( not ( = ?auto_159749 ?auto_159751 ) ) ( not ( = ?auto_159749 ?auto_159753 ) ) ( not ( = ?auto_159750 ?auto_159751 ) ) ( not ( = ?auto_159750 ?auto_159753 ) ) ( not ( = ?auto_159751 ?auto_159753 ) ) ( not ( = ?auto_159746 ?auto_159752 ) ) ( not ( = ?auto_159747 ?auto_159752 ) ) ( not ( = ?auto_159748 ?auto_159752 ) ) ( not ( = ?auto_159749 ?auto_159752 ) ) ( not ( = ?auto_159750 ?auto_159752 ) ) ( not ( = ?auto_159751 ?auto_159752 ) ) ( not ( = ?auto_159753 ?auto_159752 ) ) ( ON ?auto_159752 ?auto_159754 ) ( not ( = ?auto_159746 ?auto_159754 ) ) ( not ( = ?auto_159747 ?auto_159754 ) ) ( not ( = ?auto_159748 ?auto_159754 ) ) ( not ( = ?auto_159749 ?auto_159754 ) ) ( not ( = ?auto_159750 ?auto_159754 ) ) ( not ( = ?auto_159751 ?auto_159754 ) ) ( not ( = ?auto_159753 ?auto_159754 ) ) ( not ( = ?auto_159752 ?auto_159754 ) ) ( ON ?auto_159753 ?auto_159752 ) ( ON ?auto_159751 ?auto_159753 ) ( ON-TABLE ?auto_159754 ) ( ON ?auto_159750 ?auto_159751 ) ( ON ?auto_159749 ?auto_159750 ) ( CLEAR ?auto_159749 ) ( HOLDING ?auto_159748 ) ( CLEAR ?auto_159747 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159746 ?auto_159747 ?auto_159748 )
      ( MAKE-6PILE ?auto_159746 ?auto_159747 ?auto_159748 ?auto_159749 ?auto_159750 ?auto_159751 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159755 - BLOCK
      ?auto_159756 - BLOCK
      ?auto_159757 - BLOCK
      ?auto_159758 - BLOCK
      ?auto_159759 - BLOCK
      ?auto_159760 - BLOCK
    )
    :vars
    (
      ?auto_159761 - BLOCK
      ?auto_159762 - BLOCK
      ?auto_159763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159755 ) ( ON ?auto_159756 ?auto_159755 ) ( not ( = ?auto_159755 ?auto_159756 ) ) ( not ( = ?auto_159755 ?auto_159757 ) ) ( not ( = ?auto_159755 ?auto_159758 ) ) ( not ( = ?auto_159755 ?auto_159759 ) ) ( not ( = ?auto_159755 ?auto_159760 ) ) ( not ( = ?auto_159755 ?auto_159761 ) ) ( not ( = ?auto_159756 ?auto_159757 ) ) ( not ( = ?auto_159756 ?auto_159758 ) ) ( not ( = ?auto_159756 ?auto_159759 ) ) ( not ( = ?auto_159756 ?auto_159760 ) ) ( not ( = ?auto_159756 ?auto_159761 ) ) ( not ( = ?auto_159757 ?auto_159758 ) ) ( not ( = ?auto_159757 ?auto_159759 ) ) ( not ( = ?auto_159757 ?auto_159760 ) ) ( not ( = ?auto_159757 ?auto_159761 ) ) ( not ( = ?auto_159758 ?auto_159759 ) ) ( not ( = ?auto_159758 ?auto_159760 ) ) ( not ( = ?auto_159758 ?auto_159761 ) ) ( not ( = ?auto_159759 ?auto_159760 ) ) ( not ( = ?auto_159759 ?auto_159761 ) ) ( not ( = ?auto_159760 ?auto_159761 ) ) ( not ( = ?auto_159755 ?auto_159762 ) ) ( not ( = ?auto_159756 ?auto_159762 ) ) ( not ( = ?auto_159757 ?auto_159762 ) ) ( not ( = ?auto_159758 ?auto_159762 ) ) ( not ( = ?auto_159759 ?auto_159762 ) ) ( not ( = ?auto_159760 ?auto_159762 ) ) ( not ( = ?auto_159761 ?auto_159762 ) ) ( ON ?auto_159762 ?auto_159763 ) ( not ( = ?auto_159755 ?auto_159763 ) ) ( not ( = ?auto_159756 ?auto_159763 ) ) ( not ( = ?auto_159757 ?auto_159763 ) ) ( not ( = ?auto_159758 ?auto_159763 ) ) ( not ( = ?auto_159759 ?auto_159763 ) ) ( not ( = ?auto_159760 ?auto_159763 ) ) ( not ( = ?auto_159761 ?auto_159763 ) ) ( not ( = ?auto_159762 ?auto_159763 ) ) ( ON ?auto_159761 ?auto_159762 ) ( ON ?auto_159760 ?auto_159761 ) ( ON-TABLE ?auto_159763 ) ( ON ?auto_159759 ?auto_159760 ) ( ON ?auto_159758 ?auto_159759 ) ( CLEAR ?auto_159756 ) ( ON ?auto_159757 ?auto_159758 ) ( CLEAR ?auto_159757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159763 ?auto_159762 ?auto_159761 ?auto_159760 ?auto_159759 ?auto_159758 )
      ( MAKE-6PILE ?auto_159755 ?auto_159756 ?auto_159757 ?auto_159758 ?auto_159759 ?auto_159760 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159764 - BLOCK
      ?auto_159765 - BLOCK
      ?auto_159766 - BLOCK
      ?auto_159767 - BLOCK
      ?auto_159768 - BLOCK
      ?auto_159769 - BLOCK
    )
    :vars
    (
      ?auto_159771 - BLOCK
      ?auto_159772 - BLOCK
      ?auto_159770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159764 ) ( not ( = ?auto_159764 ?auto_159765 ) ) ( not ( = ?auto_159764 ?auto_159766 ) ) ( not ( = ?auto_159764 ?auto_159767 ) ) ( not ( = ?auto_159764 ?auto_159768 ) ) ( not ( = ?auto_159764 ?auto_159769 ) ) ( not ( = ?auto_159764 ?auto_159771 ) ) ( not ( = ?auto_159765 ?auto_159766 ) ) ( not ( = ?auto_159765 ?auto_159767 ) ) ( not ( = ?auto_159765 ?auto_159768 ) ) ( not ( = ?auto_159765 ?auto_159769 ) ) ( not ( = ?auto_159765 ?auto_159771 ) ) ( not ( = ?auto_159766 ?auto_159767 ) ) ( not ( = ?auto_159766 ?auto_159768 ) ) ( not ( = ?auto_159766 ?auto_159769 ) ) ( not ( = ?auto_159766 ?auto_159771 ) ) ( not ( = ?auto_159767 ?auto_159768 ) ) ( not ( = ?auto_159767 ?auto_159769 ) ) ( not ( = ?auto_159767 ?auto_159771 ) ) ( not ( = ?auto_159768 ?auto_159769 ) ) ( not ( = ?auto_159768 ?auto_159771 ) ) ( not ( = ?auto_159769 ?auto_159771 ) ) ( not ( = ?auto_159764 ?auto_159772 ) ) ( not ( = ?auto_159765 ?auto_159772 ) ) ( not ( = ?auto_159766 ?auto_159772 ) ) ( not ( = ?auto_159767 ?auto_159772 ) ) ( not ( = ?auto_159768 ?auto_159772 ) ) ( not ( = ?auto_159769 ?auto_159772 ) ) ( not ( = ?auto_159771 ?auto_159772 ) ) ( ON ?auto_159772 ?auto_159770 ) ( not ( = ?auto_159764 ?auto_159770 ) ) ( not ( = ?auto_159765 ?auto_159770 ) ) ( not ( = ?auto_159766 ?auto_159770 ) ) ( not ( = ?auto_159767 ?auto_159770 ) ) ( not ( = ?auto_159768 ?auto_159770 ) ) ( not ( = ?auto_159769 ?auto_159770 ) ) ( not ( = ?auto_159771 ?auto_159770 ) ) ( not ( = ?auto_159772 ?auto_159770 ) ) ( ON ?auto_159771 ?auto_159772 ) ( ON ?auto_159769 ?auto_159771 ) ( ON-TABLE ?auto_159770 ) ( ON ?auto_159768 ?auto_159769 ) ( ON ?auto_159767 ?auto_159768 ) ( ON ?auto_159766 ?auto_159767 ) ( CLEAR ?auto_159766 ) ( HOLDING ?auto_159765 ) ( CLEAR ?auto_159764 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159764 ?auto_159765 )
      ( MAKE-6PILE ?auto_159764 ?auto_159765 ?auto_159766 ?auto_159767 ?auto_159768 ?auto_159769 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159773 - BLOCK
      ?auto_159774 - BLOCK
      ?auto_159775 - BLOCK
      ?auto_159776 - BLOCK
      ?auto_159777 - BLOCK
      ?auto_159778 - BLOCK
    )
    :vars
    (
      ?auto_159779 - BLOCK
      ?auto_159781 - BLOCK
      ?auto_159780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_159773 ) ( not ( = ?auto_159773 ?auto_159774 ) ) ( not ( = ?auto_159773 ?auto_159775 ) ) ( not ( = ?auto_159773 ?auto_159776 ) ) ( not ( = ?auto_159773 ?auto_159777 ) ) ( not ( = ?auto_159773 ?auto_159778 ) ) ( not ( = ?auto_159773 ?auto_159779 ) ) ( not ( = ?auto_159774 ?auto_159775 ) ) ( not ( = ?auto_159774 ?auto_159776 ) ) ( not ( = ?auto_159774 ?auto_159777 ) ) ( not ( = ?auto_159774 ?auto_159778 ) ) ( not ( = ?auto_159774 ?auto_159779 ) ) ( not ( = ?auto_159775 ?auto_159776 ) ) ( not ( = ?auto_159775 ?auto_159777 ) ) ( not ( = ?auto_159775 ?auto_159778 ) ) ( not ( = ?auto_159775 ?auto_159779 ) ) ( not ( = ?auto_159776 ?auto_159777 ) ) ( not ( = ?auto_159776 ?auto_159778 ) ) ( not ( = ?auto_159776 ?auto_159779 ) ) ( not ( = ?auto_159777 ?auto_159778 ) ) ( not ( = ?auto_159777 ?auto_159779 ) ) ( not ( = ?auto_159778 ?auto_159779 ) ) ( not ( = ?auto_159773 ?auto_159781 ) ) ( not ( = ?auto_159774 ?auto_159781 ) ) ( not ( = ?auto_159775 ?auto_159781 ) ) ( not ( = ?auto_159776 ?auto_159781 ) ) ( not ( = ?auto_159777 ?auto_159781 ) ) ( not ( = ?auto_159778 ?auto_159781 ) ) ( not ( = ?auto_159779 ?auto_159781 ) ) ( ON ?auto_159781 ?auto_159780 ) ( not ( = ?auto_159773 ?auto_159780 ) ) ( not ( = ?auto_159774 ?auto_159780 ) ) ( not ( = ?auto_159775 ?auto_159780 ) ) ( not ( = ?auto_159776 ?auto_159780 ) ) ( not ( = ?auto_159777 ?auto_159780 ) ) ( not ( = ?auto_159778 ?auto_159780 ) ) ( not ( = ?auto_159779 ?auto_159780 ) ) ( not ( = ?auto_159781 ?auto_159780 ) ) ( ON ?auto_159779 ?auto_159781 ) ( ON ?auto_159778 ?auto_159779 ) ( ON-TABLE ?auto_159780 ) ( ON ?auto_159777 ?auto_159778 ) ( ON ?auto_159776 ?auto_159777 ) ( ON ?auto_159775 ?auto_159776 ) ( CLEAR ?auto_159773 ) ( ON ?auto_159774 ?auto_159775 ) ( CLEAR ?auto_159774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159780 ?auto_159781 ?auto_159779 ?auto_159778 ?auto_159777 ?auto_159776 ?auto_159775 )
      ( MAKE-6PILE ?auto_159773 ?auto_159774 ?auto_159775 ?auto_159776 ?auto_159777 ?auto_159778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159782 - BLOCK
      ?auto_159783 - BLOCK
      ?auto_159784 - BLOCK
      ?auto_159785 - BLOCK
      ?auto_159786 - BLOCK
      ?auto_159787 - BLOCK
    )
    :vars
    (
      ?auto_159789 - BLOCK
      ?auto_159788 - BLOCK
      ?auto_159790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159782 ?auto_159783 ) ) ( not ( = ?auto_159782 ?auto_159784 ) ) ( not ( = ?auto_159782 ?auto_159785 ) ) ( not ( = ?auto_159782 ?auto_159786 ) ) ( not ( = ?auto_159782 ?auto_159787 ) ) ( not ( = ?auto_159782 ?auto_159789 ) ) ( not ( = ?auto_159783 ?auto_159784 ) ) ( not ( = ?auto_159783 ?auto_159785 ) ) ( not ( = ?auto_159783 ?auto_159786 ) ) ( not ( = ?auto_159783 ?auto_159787 ) ) ( not ( = ?auto_159783 ?auto_159789 ) ) ( not ( = ?auto_159784 ?auto_159785 ) ) ( not ( = ?auto_159784 ?auto_159786 ) ) ( not ( = ?auto_159784 ?auto_159787 ) ) ( not ( = ?auto_159784 ?auto_159789 ) ) ( not ( = ?auto_159785 ?auto_159786 ) ) ( not ( = ?auto_159785 ?auto_159787 ) ) ( not ( = ?auto_159785 ?auto_159789 ) ) ( not ( = ?auto_159786 ?auto_159787 ) ) ( not ( = ?auto_159786 ?auto_159789 ) ) ( not ( = ?auto_159787 ?auto_159789 ) ) ( not ( = ?auto_159782 ?auto_159788 ) ) ( not ( = ?auto_159783 ?auto_159788 ) ) ( not ( = ?auto_159784 ?auto_159788 ) ) ( not ( = ?auto_159785 ?auto_159788 ) ) ( not ( = ?auto_159786 ?auto_159788 ) ) ( not ( = ?auto_159787 ?auto_159788 ) ) ( not ( = ?auto_159789 ?auto_159788 ) ) ( ON ?auto_159788 ?auto_159790 ) ( not ( = ?auto_159782 ?auto_159790 ) ) ( not ( = ?auto_159783 ?auto_159790 ) ) ( not ( = ?auto_159784 ?auto_159790 ) ) ( not ( = ?auto_159785 ?auto_159790 ) ) ( not ( = ?auto_159786 ?auto_159790 ) ) ( not ( = ?auto_159787 ?auto_159790 ) ) ( not ( = ?auto_159789 ?auto_159790 ) ) ( not ( = ?auto_159788 ?auto_159790 ) ) ( ON ?auto_159789 ?auto_159788 ) ( ON ?auto_159787 ?auto_159789 ) ( ON-TABLE ?auto_159790 ) ( ON ?auto_159786 ?auto_159787 ) ( ON ?auto_159785 ?auto_159786 ) ( ON ?auto_159784 ?auto_159785 ) ( ON ?auto_159783 ?auto_159784 ) ( CLEAR ?auto_159783 ) ( HOLDING ?auto_159782 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159782 )
      ( MAKE-6PILE ?auto_159782 ?auto_159783 ?auto_159784 ?auto_159785 ?auto_159786 ?auto_159787 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_159791 - BLOCK
      ?auto_159792 - BLOCK
      ?auto_159793 - BLOCK
      ?auto_159794 - BLOCK
      ?auto_159795 - BLOCK
      ?auto_159796 - BLOCK
    )
    :vars
    (
      ?auto_159799 - BLOCK
      ?auto_159797 - BLOCK
      ?auto_159798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159791 ?auto_159792 ) ) ( not ( = ?auto_159791 ?auto_159793 ) ) ( not ( = ?auto_159791 ?auto_159794 ) ) ( not ( = ?auto_159791 ?auto_159795 ) ) ( not ( = ?auto_159791 ?auto_159796 ) ) ( not ( = ?auto_159791 ?auto_159799 ) ) ( not ( = ?auto_159792 ?auto_159793 ) ) ( not ( = ?auto_159792 ?auto_159794 ) ) ( not ( = ?auto_159792 ?auto_159795 ) ) ( not ( = ?auto_159792 ?auto_159796 ) ) ( not ( = ?auto_159792 ?auto_159799 ) ) ( not ( = ?auto_159793 ?auto_159794 ) ) ( not ( = ?auto_159793 ?auto_159795 ) ) ( not ( = ?auto_159793 ?auto_159796 ) ) ( not ( = ?auto_159793 ?auto_159799 ) ) ( not ( = ?auto_159794 ?auto_159795 ) ) ( not ( = ?auto_159794 ?auto_159796 ) ) ( not ( = ?auto_159794 ?auto_159799 ) ) ( not ( = ?auto_159795 ?auto_159796 ) ) ( not ( = ?auto_159795 ?auto_159799 ) ) ( not ( = ?auto_159796 ?auto_159799 ) ) ( not ( = ?auto_159791 ?auto_159797 ) ) ( not ( = ?auto_159792 ?auto_159797 ) ) ( not ( = ?auto_159793 ?auto_159797 ) ) ( not ( = ?auto_159794 ?auto_159797 ) ) ( not ( = ?auto_159795 ?auto_159797 ) ) ( not ( = ?auto_159796 ?auto_159797 ) ) ( not ( = ?auto_159799 ?auto_159797 ) ) ( ON ?auto_159797 ?auto_159798 ) ( not ( = ?auto_159791 ?auto_159798 ) ) ( not ( = ?auto_159792 ?auto_159798 ) ) ( not ( = ?auto_159793 ?auto_159798 ) ) ( not ( = ?auto_159794 ?auto_159798 ) ) ( not ( = ?auto_159795 ?auto_159798 ) ) ( not ( = ?auto_159796 ?auto_159798 ) ) ( not ( = ?auto_159799 ?auto_159798 ) ) ( not ( = ?auto_159797 ?auto_159798 ) ) ( ON ?auto_159799 ?auto_159797 ) ( ON ?auto_159796 ?auto_159799 ) ( ON-TABLE ?auto_159798 ) ( ON ?auto_159795 ?auto_159796 ) ( ON ?auto_159794 ?auto_159795 ) ( ON ?auto_159793 ?auto_159794 ) ( ON ?auto_159792 ?auto_159793 ) ( ON ?auto_159791 ?auto_159792 ) ( CLEAR ?auto_159791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159798 ?auto_159797 ?auto_159799 ?auto_159796 ?auto_159795 ?auto_159794 ?auto_159793 ?auto_159792 )
      ( MAKE-6PILE ?auto_159791 ?auto_159792 ?auto_159793 ?auto_159794 ?auto_159795 ?auto_159796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159802 - BLOCK
      ?auto_159803 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_159803 ) ( CLEAR ?auto_159802 ) ( ON-TABLE ?auto_159802 ) ( not ( = ?auto_159802 ?auto_159803 ) ) )
    :subtasks
    ( ( !STACK ?auto_159803 ?auto_159802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159804 - BLOCK
      ?auto_159805 - BLOCK
    )
    :vars
    (
      ?auto_159806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_159804 ) ( ON-TABLE ?auto_159804 ) ( not ( = ?auto_159804 ?auto_159805 ) ) ( ON ?auto_159805 ?auto_159806 ) ( CLEAR ?auto_159805 ) ( HAND-EMPTY ) ( not ( = ?auto_159804 ?auto_159806 ) ) ( not ( = ?auto_159805 ?auto_159806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159805 ?auto_159806 )
      ( MAKE-2PILE ?auto_159804 ?auto_159805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159807 - BLOCK
      ?auto_159808 - BLOCK
    )
    :vars
    (
      ?auto_159809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159807 ?auto_159808 ) ) ( ON ?auto_159808 ?auto_159809 ) ( CLEAR ?auto_159808 ) ( not ( = ?auto_159807 ?auto_159809 ) ) ( not ( = ?auto_159808 ?auto_159809 ) ) ( HOLDING ?auto_159807 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159807 )
      ( MAKE-2PILE ?auto_159807 ?auto_159808 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159810 - BLOCK
      ?auto_159811 - BLOCK
    )
    :vars
    (
      ?auto_159812 - BLOCK
      ?auto_159817 - BLOCK
      ?auto_159815 - BLOCK
      ?auto_159813 - BLOCK
      ?auto_159816 - BLOCK
      ?auto_159814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159810 ?auto_159811 ) ) ( ON ?auto_159811 ?auto_159812 ) ( not ( = ?auto_159810 ?auto_159812 ) ) ( not ( = ?auto_159811 ?auto_159812 ) ) ( ON ?auto_159810 ?auto_159811 ) ( CLEAR ?auto_159810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159817 ) ( ON ?auto_159815 ?auto_159817 ) ( ON ?auto_159813 ?auto_159815 ) ( ON ?auto_159816 ?auto_159813 ) ( ON ?auto_159814 ?auto_159816 ) ( ON ?auto_159812 ?auto_159814 ) ( not ( = ?auto_159817 ?auto_159815 ) ) ( not ( = ?auto_159817 ?auto_159813 ) ) ( not ( = ?auto_159817 ?auto_159816 ) ) ( not ( = ?auto_159817 ?auto_159814 ) ) ( not ( = ?auto_159817 ?auto_159812 ) ) ( not ( = ?auto_159817 ?auto_159811 ) ) ( not ( = ?auto_159817 ?auto_159810 ) ) ( not ( = ?auto_159815 ?auto_159813 ) ) ( not ( = ?auto_159815 ?auto_159816 ) ) ( not ( = ?auto_159815 ?auto_159814 ) ) ( not ( = ?auto_159815 ?auto_159812 ) ) ( not ( = ?auto_159815 ?auto_159811 ) ) ( not ( = ?auto_159815 ?auto_159810 ) ) ( not ( = ?auto_159813 ?auto_159816 ) ) ( not ( = ?auto_159813 ?auto_159814 ) ) ( not ( = ?auto_159813 ?auto_159812 ) ) ( not ( = ?auto_159813 ?auto_159811 ) ) ( not ( = ?auto_159813 ?auto_159810 ) ) ( not ( = ?auto_159816 ?auto_159814 ) ) ( not ( = ?auto_159816 ?auto_159812 ) ) ( not ( = ?auto_159816 ?auto_159811 ) ) ( not ( = ?auto_159816 ?auto_159810 ) ) ( not ( = ?auto_159814 ?auto_159812 ) ) ( not ( = ?auto_159814 ?auto_159811 ) ) ( not ( = ?auto_159814 ?auto_159810 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159817 ?auto_159815 ?auto_159813 ?auto_159816 ?auto_159814 ?auto_159812 ?auto_159811 )
      ( MAKE-2PILE ?auto_159810 ?auto_159811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159818 - BLOCK
      ?auto_159819 - BLOCK
    )
    :vars
    (
      ?auto_159821 - BLOCK
      ?auto_159820 - BLOCK
      ?auto_159822 - BLOCK
      ?auto_159825 - BLOCK
      ?auto_159824 - BLOCK
      ?auto_159823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159818 ?auto_159819 ) ) ( ON ?auto_159819 ?auto_159821 ) ( not ( = ?auto_159818 ?auto_159821 ) ) ( not ( = ?auto_159819 ?auto_159821 ) ) ( ON-TABLE ?auto_159820 ) ( ON ?auto_159822 ?auto_159820 ) ( ON ?auto_159825 ?auto_159822 ) ( ON ?auto_159824 ?auto_159825 ) ( ON ?auto_159823 ?auto_159824 ) ( ON ?auto_159821 ?auto_159823 ) ( not ( = ?auto_159820 ?auto_159822 ) ) ( not ( = ?auto_159820 ?auto_159825 ) ) ( not ( = ?auto_159820 ?auto_159824 ) ) ( not ( = ?auto_159820 ?auto_159823 ) ) ( not ( = ?auto_159820 ?auto_159821 ) ) ( not ( = ?auto_159820 ?auto_159819 ) ) ( not ( = ?auto_159820 ?auto_159818 ) ) ( not ( = ?auto_159822 ?auto_159825 ) ) ( not ( = ?auto_159822 ?auto_159824 ) ) ( not ( = ?auto_159822 ?auto_159823 ) ) ( not ( = ?auto_159822 ?auto_159821 ) ) ( not ( = ?auto_159822 ?auto_159819 ) ) ( not ( = ?auto_159822 ?auto_159818 ) ) ( not ( = ?auto_159825 ?auto_159824 ) ) ( not ( = ?auto_159825 ?auto_159823 ) ) ( not ( = ?auto_159825 ?auto_159821 ) ) ( not ( = ?auto_159825 ?auto_159819 ) ) ( not ( = ?auto_159825 ?auto_159818 ) ) ( not ( = ?auto_159824 ?auto_159823 ) ) ( not ( = ?auto_159824 ?auto_159821 ) ) ( not ( = ?auto_159824 ?auto_159819 ) ) ( not ( = ?auto_159824 ?auto_159818 ) ) ( not ( = ?auto_159823 ?auto_159821 ) ) ( not ( = ?auto_159823 ?auto_159819 ) ) ( not ( = ?auto_159823 ?auto_159818 ) ) ( HOLDING ?auto_159818 ) ( CLEAR ?auto_159819 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159820 ?auto_159822 ?auto_159825 ?auto_159824 ?auto_159823 ?auto_159821 ?auto_159819 ?auto_159818 )
      ( MAKE-2PILE ?auto_159818 ?auto_159819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159826 - BLOCK
      ?auto_159827 - BLOCK
    )
    :vars
    (
      ?auto_159830 - BLOCK
      ?auto_159828 - BLOCK
      ?auto_159831 - BLOCK
      ?auto_159833 - BLOCK
      ?auto_159832 - BLOCK
      ?auto_159829 - BLOCK
      ?auto_159834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159826 ?auto_159827 ) ) ( ON ?auto_159827 ?auto_159830 ) ( not ( = ?auto_159826 ?auto_159830 ) ) ( not ( = ?auto_159827 ?auto_159830 ) ) ( ON-TABLE ?auto_159828 ) ( ON ?auto_159831 ?auto_159828 ) ( ON ?auto_159833 ?auto_159831 ) ( ON ?auto_159832 ?auto_159833 ) ( ON ?auto_159829 ?auto_159832 ) ( ON ?auto_159830 ?auto_159829 ) ( not ( = ?auto_159828 ?auto_159831 ) ) ( not ( = ?auto_159828 ?auto_159833 ) ) ( not ( = ?auto_159828 ?auto_159832 ) ) ( not ( = ?auto_159828 ?auto_159829 ) ) ( not ( = ?auto_159828 ?auto_159830 ) ) ( not ( = ?auto_159828 ?auto_159827 ) ) ( not ( = ?auto_159828 ?auto_159826 ) ) ( not ( = ?auto_159831 ?auto_159833 ) ) ( not ( = ?auto_159831 ?auto_159832 ) ) ( not ( = ?auto_159831 ?auto_159829 ) ) ( not ( = ?auto_159831 ?auto_159830 ) ) ( not ( = ?auto_159831 ?auto_159827 ) ) ( not ( = ?auto_159831 ?auto_159826 ) ) ( not ( = ?auto_159833 ?auto_159832 ) ) ( not ( = ?auto_159833 ?auto_159829 ) ) ( not ( = ?auto_159833 ?auto_159830 ) ) ( not ( = ?auto_159833 ?auto_159827 ) ) ( not ( = ?auto_159833 ?auto_159826 ) ) ( not ( = ?auto_159832 ?auto_159829 ) ) ( not ( = ?auto_159832 ?auto_159830 ) ) ( not ( = ?auto_159832 ?auto_159827 ) ) ( not ( = ?auto_159832 ?auto_159826 ) ) ( not ( = ?auto_159829 ?auto_159830 ) ) ( not ( = ?auto_159829 ?auto_159827 ) ) ( not ( = ?auto_159829 ?auto_159826 ) ) ( CLEAR ?auto_159827 ) ( ON ?auto_159826 ?auto_159834 ) ( CLEAR ?auto_159826 ) ( HAND-EMPTY ) ( not ( = ?auto_159826 ?auto_159834 ) ) ( not ( = ?auto_159827 ?auto_159834 ) ) ( not ( = ?auto_159830 ?auto_159834 ) ) ( not ( = ?auto_159828 ?auto_159834 ) ) ( not ( = ?auto_159831 ?auto_159834 ) ) ( not ( = ?auto_159833 ?auto_159834 ) ) ( not ( = ?auto_159832 ?auto_159834 ) ) ( not ( = ?auto_159829 ?auto_159834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159826 ?auto_159834 )
      ( MAKE-2PILE ?auto_159826 ?auto_159827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159835 - BLOCK
      ?auto_159836 - BLOCK
    )
    :vars
    (
      ?auto_159839 - BLOCK
      ?auto_159838 - BLOCK
      ?auto_159842 - BLOCK
      ?auto_159840 - BLOCK
      ?auto_159843 - BLOCK
      ?auto_159841 - BLOCK
      ?auto_159837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159835 ?auto_159836 ) ) ( not ( = ?auto_159835 ?auto_159839 ) ) ( not ( = ?auto_159836 ?auto_159839 ) ) ( ON-TABLE ?auto_159838 ) ( ON ?auto_159842 ?auto_159838 ) ( ON ?auto_159840 ?auto_159842 ) ( ON ?auto_159843 ?auto_159840 ) ( ON ?auto_159841 ?auto_159843 ) ( ON ?auto_159839 ?auto_159841 ) ( not ( = ?auto_159838 ?auto_159842 ) ) ( not ( = ?auto_159838 ?auto_159840 ) ) ( not ( = ?auto_159838 ?auto_159843 ) ) ( not ( = ?auto_159838 ?auto_159841 ) ) ( not ( = ?auto_159838 ?auto_159839 ) ) ( not ( = ?auto_159838 ?auto_159836 ) ) ( not ( = ?auto_159838 ?auto_159835 ) ) ( not ( = ?auto_159842 ?auto_159840 ) ) ( not ( = ?auto_159842 ?auto_159843 ) ) ( not ( = ?auto_159842 ?auto_159841 ) ) ( not ( = ?auto_159842 ?auto_159839 ) ) ( not ( = ?auto_159842 ?auto_159836 ) ) ( not ( = ?auto_159842 ?auto_159835 ) ) ( not ( = ?auto_159840 ?auto_159843 ) ) ( not ( = ?auto_159840 ?auto_159841 ) ) ( not ( = ?auto_159840 ?auto_159839 ) ) ( not ( = ?auto_159840 ?auto_159836 ) ) ( not ( = ?auto_159840 ?auto_159835 ) ) ( not ( = ?auto_159843 ?auto_159841 ) ) ( not ( = ?auto_159843 ?auto_159839 ) ) ( not ( = ?auto_159843 ?auto_159836 ) ) ( not ( = ?auto_159843 ?auto_159835 ) ) ( not ( = ?auto_159841 ?auto_159839 ) ) ( not ( = ?auto_159841 ?auto_159836 ) ) ( not ( = ?auto_159841 ?auto_159835 ) ) ( ON ?auto_159835 ?auto_159837 ) ( CLEAR ?auto_159835 ) ( not ( = ?auto_159835 ?auto_159837 ) ) ( not ( = ?auto_159836 ?auto_159837 ) ) ( not ( = ?auto_159839 ?auto_159837 ) ) ( not ( = ?auto_159838 ?auto_159837 ) ) ( not ( = ?auto_159842 ?auto_159837 ) ) ( not ( = ?auto_159840 ?auto_159837 ) ) ( not ( = ?auto_159843 ?auto_159837 ) ) ( not ( = ?auto_159841 ?auto_159837 ) ) ( HOLDING ?auto_159836 ) ( CLEAR ?auto_159839 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159838 ?auto_159842 ?auto_159840 ?auto_159843 ?auto_159841 ?auto_159839 ?auto_159836 )
      ( MAKE-2PILE ?auto_159835 ?auto_159836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159844 - BLOCK
      ?auto_159845 - BLOCK
    )
    :vars
    (
      ?auto_159848 - BLOCK
      ?auto_159850 - BLOCK
      ?auto_159847 - BLOCK
      ?auto_159851 - BLOCK
      ?auto_159846 - BLOCK
      ?auto_159849 - BLOCK
      ?auto_159852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159844 ?auto_159845 ) ) ( not ( = ?auto_159844 ?auto_159848 ) ) ( not ( = ?auto_159845 ?auto_159848 ) ) ( ON-TABLE ?auto_159850 ) ( ON ?auto_159847 ?auto_159850 ) ( ON ?auto_159851 ?auto_159847 ) ( ON ?auto_159846 ?auto_159851 ) ( ON ?auto_159849 ?auto_159846 ) ( ON ?auto_159848 ?auto_159849 ) ( not ( = ?auto_159850 ?auto_159847 ) ) ( not ( = ?auto_159850 ?auto_159851 ) ) ( not ( = ?auto_159850 ?auto_159846 ) ) ( not ( = ?auto_159850 ?auto_159849 ) ) ( not ( = ?auto_159850 ?auto_159848 ) ) ( not ( = ?auto_159850 ?auto_159845 ) ) ( not ( = ?auto_159850 ?auto_159844 ) ) ( not ( = ?auto_159847 ?auto_159851 ) ) ( not ( = ?auto_159847 ?auto_159846 ) ) ( not ( = ?auto_159847 ?auto_159849 ) ) ( not ( = ?auto_159847 ?auto_159848 ) ) ( not ( = ?auto_159847 ?auto_159845 ) ) ( not ( = ?auto_159847 ?auto_159844 ) ) ( not ( = ?auto_159851 ?auto_159846 ) ) ( not ( = ?auto_159851 ?auto_159849 ) ) ( not ( = ?auto_159851 ?auto_159848 ) ) ( not ( = ?auto_159851 ?auto_159845 ) ) ( not ( = ?auto_159851 ?auto_159844 ) ) ( not ( = ?auto_159846 ?auto_159849 ) ) ( not ( = ?auto_159846 ?auto_159848 ) ) ( not ( = ?auto_159846 ?auto_159845 ) ) ( not ( = ?auto_159846 ?auto_159844 ) ) ( not ( = ?auto_159849 ?auto_159848 ) ) ( not ( = ?auto_159849 ?auto_159845 ) ) ( not ( = ?auto_159849 ?auto_159844 ) ) ( ON ?auto_159844 ?auto_159852 ) ( not ( = ?auto_159844 ?auto_159852 ) ) ( not ( = ?auto_159845 ?auto_159852 ) ) ( not ( = ?auto_159848 ?auto_159852 ) ) ( not ( = ?auto_159850 ?auto_159852 ) ) ( not ( = ?auto_159847 ?auto_159852 ) ) ( not ( = ?auto_159851 ?auto_159852 ) ) ( not ( = ?auto_159846 ?auto_159852 ) ) ( not ( = ?auto_159849 ?auto_159852 ) ) ( CLEAR ?auto_159848 ) ( ON ?auto_159845 ?auto_159844 ) ( CLEAR ?auto_159845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159852 ?auto_159844 )
      ( MAKE-2PILE ?auto_159844 ?auto_159845 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159853 - BLOCK
      ?auto_159854 - BLOCK
    )
    :vars
    (
      ?auto_159861 - BLOCK
      ?auto_159856 - BLOCK
      ?auto_159860 - BLOCK
      ?auto_159855 - BLOCK
      ?auto_159859 - BLOCK
      ?auto_159858 - BLOCK
      ?auto_159857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159853 ?auto_159854 ) ) ( not ( = ?auto_159853 ?auto_159861 ) ) ( not ( = ?auto_159854 ?auto_159861 ) ) ( ON-TABLE ?auto_159856 ) ( ON ?auto_159860 ?auto_159856 ) ( ON ?auto_159855 ?auto_159860 ) ( ON ?auto_159859 ?auto_159855 ) ( ON ?auto_159858 ?auto_159859 ) ( not ( = ?auto_159856 ?auto_159860 ) ) ( not ( = ?auto_159856 ?auto_159855 ) ) ( not ( = ?auto_159856 ?auto_159859 ) ) ( not ( = ?auto_159856 ?auto_159858 ) ) ( not ( = ?auto_159856 ?auto_159861 ) ) ( not ( = ?auto_159856 ?auto_159854 ) ) ( not ( = ?auto_159856 ?auto_159853 ) ) ( not ( = ?auto_159860 ?auto_159855 ) ) ( not ( = ?auto_159860 ?auto_159859 ) ) ( not ( = ?auto_159860 ?auto_159858 ) ) ( not ( = ?auto_159860 ?auto_159861 ) ) ( not ( = ?auto_159860 ?auto_159854 ) ) ( not ( = ?auto_159860 ?auto_159853 ) ) ( not ( = ?auto_159855 ?auto_159859 ) ) ( not ( = ?auto_159855 ?auto_159858 ) ) ( not ( = ?auto_159855 ?auto_159861 ) ) ( not ( = ?auto_159855 ?auto_159854 ) ) ( not ( = ?auto_159855 ?auto_159853 ) ) ( not ( = ?auto_159859 ?auto_159858 ) ) ( not ( = ?auto_159859 ?auto_159861 ) ) ( not ( = ?auto_159859 ?auto_159854 ) ) ( not ( = ?auto_159859 ?auto_159853 ) ) ( not ( = ?auto_159858 ?auto_159861 ) ) ( not ( = ?auto_159858 ?auto_159854 ) ) ( not ( = ?auto_159858 ?auto_159853 ) ) ( ON ?auto_159853 ?auto_159857 ) ( not ( = ?auto_159853 ?auto_159857 ) ) ( not ( = ?auto_159854 ?auto_159857 ) ) ( not ( = ?auto_159861 ?auto_159857 ) ) ( not ( = ?auto_159856 ?auto_159857 ) ) ( not ( = ?auto_159860 ?auto_159857 ) ) ( not ( = ?auto_159855 ?auto_159857 ) ) ( not ( = ?auto_159859 ?auto_159857 ) ) ( not ( = ?auto_159858 ?auto_159857 ) ) ( ON ?auto_159854 ?auto_159853 ) ( CLEAR ?auto_159854 ) ( ON-TABLE ?auto_159857 ) ( HOLDING ?auto_159861 ) ( CLEAR ?auto_159858 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159856 ?auto_159860 ?auto_159855 ?auto_159859 ?auto_159858 ?auto_159861 )
      ( MAKE-2PILE ?auto_159853 ?auto_159854 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159862 - BLOCK
      ?auto_159863 - BLOCK
    )
    :vars
    (
      ?auto_159868 - BLOCK
      ?auto_159869 - BLOCK
      ?auto_159865 - BLOCK
      ?auto_159870 - BLOCK
      ?auto_159867 - BLOCK
      ?auto_159864 - BLOCK
      ?auto_159866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159862 ?auto_159863 ) ) ( not ( = ?auto_159862 ?auto_159868 ) ) ( not ( = ?auto_159863 ?auto_159868 ) ) ( ON-TABLE ?auto_159869 ) ( ON ?auto_159865 ?auto_159869 ) ( ON ?auto_159870 ?auto_159865 ) ( ON ?auto_159867 ?auto_159870 ) ( ON ?auto_159864 ?auto_159867 ) ( not ( = ?auto_159869 ?auto_159865 ) ) ( not ( = ?auto_159869 ?auto_159870 ) ) ( not ( = ?auto_159869 ?auto_159867 ) ) ( not ( = ?auto_159869 ?auto_159864 ) ) ( not ( = ?auto_159869 ?auto_159868 ) ) ( not ( = ?auto_159869 ?auto_159863 ) ) ( not ( = ?auto_159869 ?auto_159862 ) ) ( not ( = ?auto_159865 ?auto_159870 ) ) ( not ( = ?auto_159865 ?auto_159867 ) ) ( not ( = ?auto_159865 ?auto_159864 ) ) ( not ( = ?auto_159865 ?auto_159868 ) ) ( not ( = ?auto_159865 ?auto_159863 ) ) ( not ( = ?auto_159865 ?auto_159862 ) ) ( not ( = ?auto_159870 ?auto_159867 ) ) ( not ( = ?auto_159870 ?auto_159864 ) ) ( not ( = ?auto_159870 ?auto_159868 ) ) ( not ( = ?auto_159870 ?auto_159863 ) ) ( not ( = ?auto_159870 ?auto_159862 ) ) ( not ( = ?auto_159867 ?auto_159864 ) ) ( not ( = ?auto_159867 ?auto_159868 ) ) ( not ( = ?auto_159867 ?auto_159863 ) ) ( not ( = ?auto_159867 ?auto_159862 ) ) ( not ( = ?auto_159864 ?auto_159868 ) ) ( not ( = ?auto_159864 ?auto_159863 ) ) ( not ( = ?auto_159864 ?auto_159862 ) ) ( ON ?auto_159862 ?auto_159866 ) ( not ( = ?auto_159862 ?auto_159866 ) ) ( not ( = ?auto_159863 ?auto_159866 ) ) ( not ( = ?auto_159868 ?auto_159866 ) ) ( not ( = ?auto_159869 ?auto_159866 ) ) ( not ( = ?auto_159865 ?auto_159866 ) ) ( not ( = ?auto_159870 ?auto_159866 ) ) ( not ( = ?auto_159867 ?auto_159866 ) ) ( not ( = ?auto_159864 ?auto_159866 ) ) ( ON ?auto_159863 ?auto_159862 ) ( ON-TABLE ?auto_159866 ) ( CLEAR ?auto_159864 ) ( ON ?auto_159868 ?auto_159863 ) ( CLEAR ?auto_159868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159866 ?auto_159862 ?auto_159863 )
      ( MAKE-2PILE ?auto_159862 ?auto_159863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159871 - BLOCK
      ?auto_159872 - BLOCK
    )
    :vars
    (
      ?auto_159877 - BLOCK
      ?auto_159875 - BLOCK
      ?auto_159876 - BLOCK
      ?auto_159879 - BLOCK
      ?auto_159873 - BLOCK
      ?auto_159874 - BLOCK
      ?auto_159878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159871 ?auto_159872 ) ) ( not ( = ?auto_159871 ?auto_159877 ) ) ( not ( = ?auto_159872 ?auto_159877 ) ) ( ON-TABLE ?auto_159875 ) ( ON ?auto_159876 ?auto_159875 ) ( ON ?auto_159879 ?auto_159876 ) ( ON ?auto_159873 ?auto_159879 ) ( not ( = ?auto_159875 ?auto_159876 ) ) ( not ( = ?auto_159875 ?auto_159879 ) ) ( not ( = ?auto_159875 ?auto_159873 ) ) ( not ( = ?auto_159875 ?auto_159874 ) ) ( not ( = ?auto_159875 ?auto_159877 ) ) ( not ( = ?auto_159875 ?auto_159872 ) ) ( not ( = ?auto_159875 ?auto_159871 ) ) ( not ( = ?auto_159876 ?auto_159879 ) ) ( not ( = ?auto_159876 ?auto_159873 ) ) ( not ( = ?auto_159876 ?auto_159874 ) ) ( not ( = ?auto_159876 ?auto_159877 ) ) ( not ( = ?auto_159876 ?auto_159872 ) ) ( not ( = ?auto_159876 ?auto_159871 ) ) ( not ( = ?auto_159879 ?auto_159873 ) ) ( not ( = ?auto_159879 ?auto_159874 ) ) ( not ( = ?auto_159879 ?auto_159877 ) ) ( not ( = ?auto_159879 ?auto_159872 ) ) ( not ( = ?auto_159879 ?auto_159871 ) ) ( not ( = ?auto_159873 ?auto_159874 ) ) ( not ( = ?auto_159873 ?auto_159877 ) ) ( not ( = ?auto_159873 ?auto_159872 ) ) ( not ( = ?auto_159873 ?auto_159871 ) ) ( not ( = ?auto_159874 ?auto_159877 ) ) ( not ( = ?auto_159874 ?auto_159872 ) ) ( not ( = ?auto_159874 ?auto_159871 ) ) ( ON ?auto_159871 ?auto_159878 ) ( not ( = ?auto_159871 ?auto_159878 ) ) ( not ( = ?auto_159872 ?auto_159878 ) ) ( not ( = ?auto_159877 ?auto_159878 ) ) ( not ( = ?auto_159875 ?auto_159878 ) ) ( not ( = ?auto_159876 ?auto_159878 ) ) ( not ( = ?auto_159879 ?auto_159878 ) ) ( not ( = ?auto_159873 ?auto_159878 ) ) ( not ( = ?auto_159874 ?auto_159878 ) ) ( ON ?auto_159872 ?auto_159871 ) ( ON-TABLE ?auto_159878 ) ( ON ?auto_159877 ?auto_159872 ) ( CLEAR ?auto_159877 ) ( HOLDING ?auto_159874 ) ( CLEAR ?auto_159873 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159875 ?auto_159876 ?auto_159879 ?auto_159873 ?auto_159874 )
      ( MAKE-2PILE ?auto_159871 ?auto_159872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159880 - BLOCK
      ?auto_159881 - BLOCK
    )
    :vars
    (
      ?auto_159886 - BLOCK
      ?auto_159885 - BLOCK
      ?auto_159888 - BLOCK
      ?auto_159883 - BLOCK
      ?auto_159884 - BLOCK
      ?auto_159887 - BLOCK
      ?auto_159882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159880 ?auto_159881 ) ) ( not ( = ?auto_159880 ?auto_159886 ) ) ( not ( = ?auto_159881 ?auto_159886 ) ) ( ON-TABLE ?auto_159885 ) ( ON ?auto_159888 ?auto_159885 ) ( ON ?auto_159883 ?auto_159888 ) ( ON ?auto_159884 ?auto_159883 ) ( not ( = ?auto_159885 ?auto_159888 ) ) ( not ( = ?auto_159885 ?auto_159883 ) ) ( not ( = ?auto_159885 ?auto_159884 ) ) ( not ( = ?auto_159885 ?auto_159887 ) ) ( not ( = ?auto_159885 ?auto_159886 ) ) ( not ( = ?auto_159885 ?auto_159881 ) ) ( not ( = ?auto_159885 ?auto_159880 ) ) ( not ( = ?auto_159888 ?auto_159883 ) ) ( not ( = ?auto_159888 ?auto_159884 ) ) ( not ( = ?auto_159888 ?auto_159887 ) ) ( not ( = ?auto_159888 ?auto_159886 ) ) ( not ( = ?auto_159888 ?auto_159881 ) ) ( not ( = ?auto_159888 ?auto_159880 ) ) ( not ( = ?auto_159883 ?auto_159884 ) ) ( not ( = ?auto_159883 ?auto_159887 ) ) ( not ( = ?auto_159883 ?auto_159886 ) ) ( not ( = ?auto_159883 ?auto_159881 ) ) ( not ( = ?auto_159883 ?auto_159880 ) ) ( not ( = ?auto_159884 ?auto_159887 ) ) ( not ( = ?auto_159884 ?auto_159886 ) ) ( not ( = ?auto_159884 ?auto_159881 ) ) ( not ( = ?auto_159884 ?auto_159880 ) ) ( not ( = ?auto_159887 ?auto_159886 ) ) ( not ( = ?auto_159887 ?auto_159881 ) ) ( not ( = ?auto_159887 ?auto_159880 ) ) ( ON ?auto_159880 ?auto_159882 ) ( not ( = ?auto_159880 ?auto_159882 ) ) ( not ( = ?auto_159881 ?auto_159882 ) ) ( not ( = ?auto_159886 ?auto_159882 ) ) ( not ( = ?auto_159885 ?auto_159882 ) ) ( not ( = ?auto_159888 ?auto_159882 ) ) ( not ( = ?auto_159883 ?auto_159882 ) ) ( not ( = ?auto_159884 ?auto_159882 ) ) ( not ( = ?auto_159887 ?auto_159882 ) ) ( ON ?auto_159881 ?auto_159880 ) ( ON-TABLE ?auto_159882 ) ( ON ?auto_159886 ?auto_159881 ) ( CLEAR ?auto_159884 ) ( ON ?auto_159887 ?auto_159886 ) ( CLEAR ?auto_159887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159882 ?auto_159880 ?auto_159881 ?auto_159886 )
      ( MAKE-2PILE ?auto_159880 ?auto_159881 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159889 - BLOCK
      ?auto_159890 - BLOCK
    )
    :vars
    (
      ?auto_159897 - BLOCK
      ?auto_159893 - BLOCK
      ?auto_159895 - BLOCK
      ?auto_159896 - BLOCK
      ?auto_159892 - BLOCK
      ?auto_159894 - BLOCK
      ?auto_159891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159889 ?auto_159890 ) ) ( not ( = ?auto_159889 ?auto_159897 ) ) ( not ( = ?auto_159890 ?auto_159897 ) ) ( ON-TABLE ?auto_159893 ) ( ON ?auto_159895 ?auto_159893 ) ( ON ?auto_159896 ?auto_159895 ) ( not ( = ?auto_159893 ?auto_159895 ) ) ( not ( = ?auto_159893 ?auto_159896 ) ) ( not ( = ?auto_159893 ?auto_159892 ) ) ( not ( = ?auto_159893 ?auto_159894 ) ) ( not ( = ?auto_159893 ?auto_159897 ) ) ( not ( = ?auto_159893 ?auto_159890 ) ) ( not ( = ?auto_159893 ?auto_159889 ) ) ( not ( = ?auto_159895 ?auto_159896 ) ) ( not ( = ?auto_159895 ?auto_159892 ) ) ( not ( = ?auto_159895 ?auto_159894 ) ) ( not ( = ?auto_159895 ?auto_159897 ) ) ( not ( = ?auto_159895 ?auto_159890 ) ) ( not ( = ?auto_159895 ?auto_159889 ) ) ( not ( = ?auto_159896 ?auto_159892 ) ) ( not ( = ?auto_159896 ?auto_159894 ) ) ( not ( = ?auto_159896 ?auto_159897 ) ) ( not ( = ?auto_159896 ?auto_159890 ) ) ( not ( = ?auto_159896 ?auto_159889 ) ) ( not ( = ?auto_159892 ?auto_159894 ) ) ( not ( = ?auto_159892 ?auto_159897 ) ) ( not ( = ?auto_159892 ?auto_159890 ) ) ( not ( = ?auto_159892 ?auto_159889 ) ) ( not ( = ?auto_159894 ?auto_159897 ) ) ( not ( = ?auto_159894 ?auto_159890 ) ) ( not ( = ?auto_159894 ?auto_159889 ) ) ( ON ?auto_159889 ?auto_159891 ) ( not ( = ?auto_159889 ?auto_159891 ) ) ( not ( = ?auto_159890 ?auto_159891 ) ) ( not ( = ?auto_159897 ?auto_159891 ) ) ( not ( = ?auto_159893 ?auto_159891 ) ) ( not ( = ?auto_159895 ?auto_159891 ) ) ( not ( = ?auto_159896 ?auto_159891 ) ) ( not ( = ?auto_159892 ?auto_159891 ) ) ( not ( = ?auto_159894 ?auto_159891 ) ) ( ON ?auto_159890 ?auto_159889 ) ( ON-TABLE ?auto_159891 ) ( ON ?auto_159897 ?auto_159890 ) ( ON ?auto_159894 ?auto_159897 ) ( CLEAR ?auto_159894 ) ( HOLDING ?auto_159892 ) ( CLEAR ?auto_159896 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_159893 ?auto_159895 ?auto_159896 ?auto_159892 )
      ( MAKE-2PILE ?auto_159889 ?auto_159890 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159898 - BLOCK
      ?auto_159899 - BLOCK
    )
    :vars
    (
      ?auto_159902 - BLOCK
      ?auto_159903 - BLOCK
      ?auto_159906 - BLOCK
      ?auto_159904 - BLOCK
      ?auto_159905 - BLOCK
      ?auto_159901 - BLOCK
      ?auto_159900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159898 ?auto_159899 ) ) ( not ( = ?auto_159898 ?auto_159902 ) ) ( not ( = ?auto_159899 ?auto_159902 ) ) ( ON-TABLE ?auto_159903 ) ( ON ?auto_159906 ?auto_159903 ) ( ON ?auto_159904 ?auto_159906 ) ( not ( = ?auto_159903 ?auto_159906 ) ) ( not ( = ?auto_159903 ?auto_159904 ) ) ( not ( = ?auto_159903 ?auto_159905 ) ) ( not ( = ?auto_159903 ?auto_159901 ) ) ( not ( = ?auto_159903 ?auto_159902 ) ) ( not ( = ?auto_159903 ?auto_159899 ) ) ( not ( = ?auto_159903 ?auto_159898 ) ) ( not ( = ?auto_159906 ?auto_159904 ) ) ( not ( = ?auto_159906 ?auto_159905 ) ) ( not ( = ?auto_159906 ?auto_159901 ) ) ( not ( = ?auto_159906 ?auto_159902 ) ) ( not ( = ?auto_159906 ?auto_159899 ) ) ( not ( = ?auto_159906 ?auto_159898 ) ) ( not ( = ?auto_159904 ?auto_159905 ) ) ( not ( = ?auto_159904 ?auto_159901 ) ) ( not ( = ?auto_159904 ?auto_159902 ) ) ( not ( = ?auto_159904 ?auto_159899 ) ) ( not ( = ?auto_159904 ?auto_159898 ) ) ( not ( = ?auto_159905 ?auto_159901 ) ) ( not ( = ?auto_159905 ?auto_159902 ) ) ( not ( = ?auto_159905 ?auto_159899 ) ) ( not ( = ?auto_159905 ?auto_159898 ) ) ( not ( = ?auto_159901 ?auto_159902 ) ) ( not ( = ?auto_159901 ?auto_159899 ) ) ( not ( = ?auto_159901 ?auto_159898 ) ) ( ON ?auto_159898 ?auto_159900 ) ( not ( = ?auto_159898 ?auto_159900 ) ) ( not ( = ?auto_159899 ?auto_159900 ) ) ( not ( = ?auto_159902 ?auto_159900 ) ) ( not ( = ?auto_159903 ?auto_159900 ) ) ( not ( = ?auto_159906 ?auto_159900 ) ) ( not ( = ?auto_159904 ?auto_159900 ) ) ( not ( = ?auto_159905 ?auto_159900 ) ) ( not ( = ?auto_159901 ?auto_159900 ) ) ( ON ?auto_159899 ?auto_159898 ) ( ON-TABLE ?auto_159900 ) ( ON ?auto_159902 ?auto_159899 ) ( ON ?auto_159901 ?auto_159902 ) ( CLEAR ?auto_159904 ) ( ON ?auto_159905 ?auto_159901 ) ( CLEAR ?auto_159905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_159900 ?auto_159898 ?auto_159899 ?auto_159902 ?auto_159901 )
      ( MAKE-2PILE ?auto_159898 ?auto_159899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159907 - BLOCK
      ?auto_159908 - BLOCK
    )
    :vars
    (
      ?auto_159914 - BLOCK
      ?auto_159910 - BLOCK
      ?auto_159912 - BLOCK
      ?auto_159911 - BLOCK
      ?auto_159915 - BLOCK
      ?auto_159913 - BLOCK
      ?auto_159909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159907 ?auto_159908 ) ) ( not ( = ?auto_159907 ?auto_159914 ) ) ( not ( = ?auto_159908 ?auto_159914 ) ) ( ON-TABLE ?auto_159910 ) ( ON ?auto_159912 ?auto_159910 ) ( not ( = ?auto_159910 ?auto_159912 ) ) ( not ( = ?auto_159910 ?auto_159911 ) ) ( not ( = ?auto_159910 ?auto_159915 ) ) ( not ( = ?auto_159910 ?auto_159913 ) ) ( not ( = ?auto_159910 ?auto_159914 ) ) ( not ( = ?auto_159910 ?auto_159908 ) ) ( not ( = ?auto_159910 ?auto_159907 ) ) ( not ( = ?auto_159912 ?auto_159911 ) ) ( not ( = ?auto_159912 ?auto_159915 ) ) ( not ( = ?auto_159912 ?auto_159913 ) ) ( not ( = ?auto_159912 ?auto_159914 ) ) ( not ( = ?auto_159912 ?auto_159908 ) ) ( not ( = ?auto_159912 ?auto_159907 ) ) ( not ( = ?auto_159911 ?auto_159915 ) ) ( not ( = ?auto_159911 ?auto_159913 ) ) ( not ( = ?auto_159911 ?auto_159914 ) ) ( not ( = ?auto_159911 ?auto_159908 ) ) ( not ( = ?auto_159911 ?auto_159907 ) ) ( not ( = ?auto_159915 ?auto_159913 ) ) ( not ( = ?auto_159915 ?auto_159914 ) ) ( not ( = ?auto_159915 ?auto_159908 ) ) ( not ( = ?auto_159915 ?auto_159907 ) ) ( not ( = ?auto_159913 ?auto_159914 ) ) ( not ( = ?auto_159913 ?auto_159908 ) ) ( not ( = ?auto_159913 ?auto_159907 ) ) ( ON ?auto_159907 ?auto_159909 ) ( not ( = ?auto_159907 ?auto_159909 ) ) ( not ( = ?auto_159908 ?auto_159909 ) ) ( not ( = ?auto_159914 ?auto_159909 ) ) ( not ( = ?auto_159910 ?auto_159909 ) ) ( not ( = ?auto_159912 ?auto_159909 ) ) ( not ( = ?auto_159911 ?auto_159909 ) ) ( not ( = ?auto_159915 ?auto_159909 ) ) ( not ( = ?auto_159913 ?auto_159909 ) ) ( ON ?auto_159908 ?auto_159907 ) ( ON-TABLE ?auto_159909 ) ( ON ?auto_159914 ?auto_159908 ) ( ON ?auto_159913 ?auto_159914 ) ( ON ?auto_159915 ?auto_159913 ) ( CLEAR ?auto_159915 ) ( HOLDING ?auto_159911 ) ( CLEAR ?auto_159912 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_159910 ?auto_159912 ?auto_159911 )
      ( MAKE-2PILE ?auto_159907 ?auto_159908 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159916 - BLOCK
      ?auto_159917 - BLOCK
    )
    :vars
    (
      ?auto_159920 - BLOCK
      ?auto_159921 - BLOCK
      ?auto_159919 - BLOCK
      ?auto_159922 - BLOCK
      ?auto_159924 - BLOCK
      ?auto_159918 - BLOCK
      ?auto_159923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159916 ?auto_159917 ) ) ( not ( = ?auto_159916 ?auto_159920 ) ) ( not ( = ?auto_159917 ?auto_159920 ) ) ( ON-TABLE ?auto_159921 ) ( ON ?auto_159919 ?auto_159921 ) ( not ( = ?auto_159921 ?auto_159919 ) ) ( not ( = ?auto_159921 ?auto_159922 ) ) ( not ( = ?auto_159921 ?auto_159924 ) ) ( not ( = ?auto_159921 ?auto_159918 ) ) ( not ( = ?auto_159921 ?auto_159920 ) ) ( not ( = ?auto_159921 ?auto_159917 ) ) ( not ( = ?auto_159921 ?auto_159916 ) ) ( not ( = ?auto_159919 ?auto_159922 ) ) ( not ( = ?auto_159919 ?auto_159924 ) ) ( not ( = ?auto_159919 ?auto_159918 ) ) ( not ( = ?auto_159919 ?auto_159920 ) ) ( not ( = ?auto_159919 ?auto_159917 ) ) ( not ( = ?auto_159919 ?auto_159916 ) ) ( not ( = ?auto_159922 ?auto_159924 ) ) ( not ( = ?auto_159922 ?auto_159918 ) ) ( not ( = ?auto_159922 ?auto_159920 ) ) ( not ( = ?auto_159922 ?auto_159917 ) ) ( not ( = ?auto_159922 ?auto_159916 ) ) ( not ( = ?auto_159924 ?auto_159918 ) ) ( not ( = ?auto_159924 ?auto_159920 ) ) ( not ( = ?auto_159924 ?auto_159917 ) ) ( not ( = ?auto_159924 ?auto_159916 ) ) ( not ( = ?auto_159918 ?auto_159920 ) ) ( not ( = ?auto_159918 ?auto_159917 ) ) ( not ( = ?auto_159918 ?auto_159916 ) ) ( ON ?auto_159916 ?auto_159923 ) ( not ( = ?auto_159916 ?auto_159923 ) ) ( not ( = ?auto_159917 ?auto_159923 ) ) ( not ( = ?auto_159920 ?auto_159923 ) ) ( not ( = ?auto_159921 ?auto_159923 ) ) ( not ( = ?auto_159919 ?auto_159923 ) ) ( not ( = ?auto_159922 ?auto_159923 ) ) ( not ( = ?auto_159924 ?auto_159923 ) ) ( not ( = ?auto_159918 ?auto_159923 ) ) ( ON ?auto_159917 ?auto_159916 ) ( ON-TABLE ?auto_159923 ) ( ON ?auto_159920 ?auto_159917 ) ( ON ?auto_159918 ?auto_159920 ) ( ON ?auto_159924 ?auto_159918 ) ( CLEAR ?auto_159919 ) ( ON ?auto_159922 ?auto_159924 ) ( CLEAR ?auto_159922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159923 ?auto_159916 ?auto_159917 ?auto_159920 ?auto_159918 ?auto_159924 )
      ( MAKE-2PILE ?auto_159916 ?auto_159917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159925 - BLOCK
      ?auto_159926 - BLOCK
    )
    :vars
    (
      ?auto_159928 - BLOCK
      ?auto_159933 - BLOCK
      ?auto_159927 - BLOCK
      ?auto_159930 - BLOCK
      ?auto_159931 - BLOCK
      ?auto_159929 - BLOCK
      ?auto_159932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159925 ?auto_159926 ) ) ( not ( = ?auto_159925 ?auto_159928 ) ) ( not ( = ?auto_159926 ?auto_159928 ) ) ( ON-TABLE ?auto_159933 ) ( not ( = ?auto_159933 ?auto_159927 ) ) ( not ( = ?auto_159933 ?auto_159930 ) ) ( not ( = ?auto_159933 ?auto_159931 ) ) ( not ( = ?auto_159933 ?auto_159929 ) ) ( not ( = ?auto_159933 ?auto_159928 ) ) ( not ( = ?auto_159933 ?auto_159926 ) ) ( not ( = ?auto_159933 ?auto_159925 ) ) ( not ( = ?auto_159927 ?auto_159930 ) ) ( not ( = ?auto_159927 ?auto_159931 ) ) ( not ( = ?auto_159927 ?auto_159929 ) ) ( not ( = ?auto_159927 ?auto_159928 ) ) ( not ( = ?auto_159927 ?auto_159926 ) ) ( not ( = ?auto_159927 ?auto_159925 ) ) ( not ( = ?auto_159930 ?auto_159931 ) ) ( not ( = ?auto_159930 ?auto_159929 ) ) ( not ( = ?auto_159930 ?auto_159928 ) ) ( not ( = ?auto_159930 ?auto_159926 ) ) ( not ( = ?auto_159930 ?auto_159925 ) ) ( not ( = ?auto_159931 ?auto_159929 ) ) ( not ( = ?auto_159931 ?auto_159928 ) ) ( not ( = ?auto_159931 ?auto_159926 ) ) ( not ( = ?auto_159931 ?auto_159925 ) ) ( not ( = ?auto_159929 ?auto_159928 ) ) ( not ( = ?auto_159929 ?auto_159926 ) ) ( not ( = ?auto_159929 ?auto_159925 ) ) ( ON ?auto_159925 ?auto_159932 ) ( not ( = ?auto_159925 ?auto_159932 ) ) ( not ( = ?auto_159926 ?auto_159932 ) ) ( not ( = ?auto_159928 ?auto_159932 ) ) ( not ( = ?auto_159933 ?auto_159932 ) ) ( not ( = ?auto_159927 ?auto_159932 ) ) ( not ( = ?auto_159930 ?auto_159932 ) ) ( not ( = ?auto_159931 ?auto_159932 ) ) ( not ( = ?auto_159929 ?auto_159932 ) ) ( ON ?auto_159926 ?auto_159925 ) ( ON-TABLE ?auto_159932 ) ( ON ?auto_159928 ?auto_159926 ) ( ON ?auto_159929 ?auto_159928 ) ( ON ?auto_159931 ?auto_159929 ) ( ON ?auto_159930 ?auto_159931 ) ( CLEAR ?auto_159930 ) ( HOLDING ?auto_159927 ) ( CLEAR ?auto_159933 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_159933 ?auto_159927 )
      ( MAKE-2PILE ?auto_159925 ?auto_159926 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159934 - BLOCK
      ?auto_159935 - BLOCK
    )
    :vars
    (
      ?auto_159938 - BLOCK
      ?auto_159939 - BLOCK
      ?auto_159942 - BLOCK
      ?auto_159937 - BLOCK
      ?auto_159936 - BLOCK
      ?auto_159941 - BLOCK
      ?auto_159940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159934 ?auto_159935 ) ) ( not ( = ?auto_159934 ?auto_159938 ) ) ( not ( = ?auto_159935 ?auto_159938 ) ) ( ON-TABLE ?auto_159939 ) ( not ( = ?auto_159939 ?auto_159942 ) ) ( not ( = ?auto_159939 ?auto_159937 ) ) ( not ( = ?auto_159939 ?auto_159936 ) ) ( not ( = ?auto_159939 ?auto_159941 ) ) ( not ( = ?auto_159939 ?auto_159938 ) ) ( not ( = ?auto_159939 ?auto_159935 ) ) ( not ( = ?auto_159939 ?auto_159934 ) ) ( not ( = ?auto_159942 ?auto_159937 ) ) ( not ( = ?auto_159942 ?auto_159936 ) ) ( not ( = ?auto_159942 ?auto_159941 ) ) ( not ( = ?auto_159942 ?auto_159938 ) ) ( not ( = ?auto_159942 ?auto_159935 ) ) ( not ( = ?auto_159942 ?auto_159934 ) ) ( not ( = ?auto_159937 ?auto_159936 ) ) ( not ( = ?auto_159937 ?auto_159941 ) ) ( not ( = ?auto_159937 ?auto_159938 ) ) ( not ( = ?auto_159937 ?auto_159935 ) ) ( not ( = ?auto_159937 ?auto_159934 ) ) ( not ( = ?auto_159936 ?auto_159941 ) ) ( not ( = ?auto_159936 ?auto_159938 ) ) ( not ( = ?auto_159936 ?auto_159935 ) ) ( not ( = ?auto_159936 ?auto_159934 ) ) ( not ( = ?auto_159941 ?auto_159938 ) ) ( not ( = ?auto_159941 ?auto_159935 ) ) ( not ( = ?auto_159941 ?auto_159934 ) ) ( ON ?auto_159934 ?auto_159940 ) ( not ( = ?auto_159934 ?auto_159940 ) ) ( not ( = ?auto_159935 ?auto_159940 ) ) ( not ( = ?auto_159938 ?auto_159940 ) ) ( not ( = ?auto_159939 ?auto_159940 ) ) ( not ( = ?auto_159942 ?auto_159940 ) ) ( not ( = ?auto_159937 ?auto_159940 ) ) ( not ( = ?auto_159936 ?auto_159940 ) ) ( not ( = ?auto_159941 ?auto_159940 ) ) ( ON ?auto_159935 ?auto_159934 ) ( ON-TABLE ?auto_159940 ) ( ON ?auto_159938 ?auto_159935 ) ( ON ?auto_159941 ?auto_159938 ) ( ON ?auto_159936 ?auto_159941 ) ( ON ?auto_159937 ?auto_159936 ) ( CLEAR ?auto_159939 ) ( ON ?auto_159942 ?auto_159937 ) ( CLEAR ?auto_159942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159940 ?auto_159934 ?auto_159935 ?auto_159938 ?auto_159941 ?auto_159936 ?auto_159937 )
      ( MAKE-2PILE ?auto_159934 ?auto_159935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159943 - BLOCK
      ?auto_159944 - BLOCK
    )
    :vars
    (
      ?auto_159950 - BLOCK
      ?auto_159945 - BLOCK
      ?auto_159946 - BLOCK
      ?auto_159951 - BLOCK
      ?auto_159948 - BLOCK
      ?auto_159947 - BLOCK
      ?auto_159949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159943 ?auto_159944 ) ) ( not ( = ?auto_159943 ?auto_159950 ) ) ( not ( = ?auto_159944 ?auto_159950 ) ) ( not ( = ?auto_159945 ?auto_159946 ) ) ( not ( = ?auto_159945 ?auto_159951 ) ) ( not ( = ?auto_159945 ?auto_159948 ) ) ( not ( = ?auto_159945 ?auto_159947 ) ) ( not ( = ?auto_159945 ?auto_159950 ) ) ( not ( = ?auto_159945 ?auto_159944 ) ) ( not ( = ?auto_159945 ?auto_159943 ) ) ( not ( = ?auto_159946 ?auto_159951 ) ) ( not ( = ?auto_159946 ?auto_159948 ) ) ( not ( = ?auto_159946 ?auto_159947 ) ) ( not ( = ?auto_159946 ?auto_159950 ) ) ( not ( = ?auto_159946 ?auto_159944 ) ) ( not ( = ?auto_159946 ?auto_159943 ) ) ( not ( = ?auto_159951 ?auto_159948 ) ) ( not ( = ?auto_159951 ?auto_159947 ) ) ( not ( = ?auto_159951 ?auto_159950 ) ) ( not ( = ?auto_159951 ?auto_159944 ) ) ( not ( = ?auto_159951 ?auto_159943 ) ) ( not ( = ?auto_159948 ?auto_159947 ) ) ( not ( = ?auto_159948 ?auto_159950 ) ) ( not ( = ?auto_159948 ?auto_159944 ) ) ( not ( = ?auto_159948 ?auto_159943 ) ) ( not ( = ?auto_159947 ?auto_159950 ) ) ( not ( = ?auto_159947 ?auto_159944 ) ) ( not ( = ?auto_159947 ?auto_159943 ) ) ( ON ?auto_159943 ?auto_159949 ) ( not ( = ?auto_159943 ?auto_159949 ) ) ( not ( = ?auto_159944 ?auto_159949 ) ) ( not ( = ?auto_159950 ?auto_159949 ) ) ( not ( = ?auto_159945 ?auto_159949 ) ) ( not ( = ?auto_159946 ?auto_159949 ) ) ( not ( = ?auto_159951 ?auto_159949 ) ) ( not ( = ?auto_159948 ?auto_159949 ) ) ( not ( = ?auto_159947 ?auto_159949 ) ) ( ON ?auto_159944 ?auto_159943 ) ( ON-TABLE ?auto_159949 ) ( ON ?auto_159950 ?auto_159944 ) ( ON ?auto_159947 ?auto_159950 ) ( ON ?auto_159948 ?auto_159947 ) ( ON ?auto_159951 ?auto_159948 ) ( ON ?auto_159946 ?auto_159951 ) ( CLEAR ?auto_159946 ) ( HOLDING ?auto_159945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159945 )
      ( MAKE-2PILE ?auto_159943 ?auto_159944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_159952 - BLOCK
      ?auto_159953 - BLOCK
    )
    :vars
    (
      ?auto_159960 - BLOCK
      ?auto_159959 - BLOCK
      ?auto_159956 - BLOCK
      ?auto_159954 - BLOCK
      ?auto_159957 - BLOCK
      ?auto_159958 - BLOCK
      ?auto_159955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_159952 ?auto_159953 ) ) ( not ( = ?auto_159952 ?auto_159960 ) ) ( not ( = ?auto_159953 ?auto_159960 ) ) ( not ( = ?auto_159959 ?auto_159956 ) ) ( not ( = ?auto_159959 ?auto_159954 ) ) ( not ( = ?auto_159959 ?auto_159957 ) ) ( not ( = ?auto_159959 ?auto_159958 ) ) ( not ( = ?auto_159959 ?auto_159960 ) ) ( not ( = ?auto_159959 ?auto_159953 ) ) ( not ( = ?auto_159959 ?auto_159952 ) ) ( not ( = ?auto_159956 ?auto_159954 ) ) ( not ( = ?auto_159956 ?auto_159957 ) ) ( not ( = ?auto_159956 ?auto_159958 ) ) ( not ( = ?auto_159956 ?auto_159960 ) ) ( not ( = ?auto_159956 ?auto_159953 ) ) ( not ( = ?auto_159956 ?auto_159952 ) ) ( not ( = ?auto_159954 ?auto_159957 ) ) ( not ( = ?auto_159954 ?auto_159958 ) ) ( not ( = ?auto_159954 ?auto_159960 ) ) ( not ( = ?auto_159954 ?auto_159953 ) ) ( not ( = ?auto_159954 ?auto_159952 ) ) ( not ( = ?auto_159957 ?auto_159958 ) ) ( not ( = ?auto_159957 ?auto_159960 ) ) ( not ( = ?auto_159957 ?auto_159953 ) ) ( not ( = ?auto_159957 ?auto_159952 ) ) ( not ( = ?auto_159958 ?auto_159960 ) ) ( not ( = ?auto_159958 ?auto_159953 ) ) ( not ( = ?auto_159958 ?auto_159952 ) ) ( ON ?auto_159952 ?auto_159955 ) ( not ( = ?auto_159952 ?auto_159955 ) ) ( not ( = ?auto_159953 ?auto_159955 ) ) ( not ( = ?auto_159960 ?auto_159955 ) ) ( not ( = ?auto_159959 ?auto_159955 ) ) ( not ( = ?auto_159956 ?auto_159955 ) ) ( not ( = ?auto_159954 ?auto_159955 ) ) ( not ( = ?auto_159957 ?auto_159955 ) ) ( not ( = ?auto_159958 ?auto_159955 ) ) ( ON ?auto_159953 ?auto_159952 ) ( ON-TABLE ?auto_159955 ) ( ON ?auto_159960 ?auto_159953 ) ( ON ?auto_159958 ?auto_159960 ) ( ON ?auto_159957 ?auto_159958 ) ( ON ?auto_159954 ?auto_159957 ) ( ON ?auto_159956 ?auto_159954 ) ( ON ?auto_159959 ?auto_159956 ) ( CLEAR ?auto_159959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_159955 ?auto_159952 ?auto_159953 ?auto_159960 ?auto_159958 ?auto_159957 ?auto_159954 ?auto_159956 )
      ( MAKE-2PILE ?auto_159952 ?auto_159953 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_159966 - BLOCK
      ?auto_159967 - BLOCK
      ?auto_159968 - BLOCK
      ?auto_159969 - BLOCK
      ?auto_159970 - BLOCK
    )
    :vars
    (
      ?auto_159971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159971 ?auto_159970 ) ( CLEAR ?auto_159971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_159966 ) ( ON ?auto_159967 ?auto_159966 ) ( ON ?auto_159968 ?auto_159967 ) ( ON ?auto_159969 ?auto_159968 ) ( ON ?auto_159970 ?auto_159969 ) ( not ( = ?auto_159966 ?auto_159967 ) ) ( not ( = ?auto_159966 ?auto_159968 ) ) ( not ( = ?auto_159966 ?auto_159969 ) ) ( not ( = ?auto_159966 ?auto_159970 ) ) ( not ( = ?auto_159966 ?auto_159971 ) ) ( not ( = ?auto_159967 ?auto_159968 ) ) ( not ( = ?auto_159967 ?auto_159969 ) ) ( not ( = ?auto_159967 ?auto_159970 ) ) ( not ( = ?auto_159967 ?auto_159971 ) ) ( not ( = ?auto_159968 ?auto_159969 ) ) ( not ( = ?auto_159968 ?auto_159970 ) ) ( not ( = ?auto_159968 ?auto_159971 ) ) ( not ( = ?auto_159969 ?auto_159970 ) ) ( not ( = ?auto_159969 ?auto_159971 ) ) ( not ( = ?auto_159970 ?auto_159971 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_159971 ?auto_159970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_159972 - BLOCK
      ?auto_159973 - BLOCK
      ?auto_159974 - BLOCK
      ?auto_159975 - BLOCK
      ?auto_159976 - BLOCK
    )
    :vars
    (
      ?auto_159977 - BLOCK
      ?auto_159978 - BLOCK
      ?auto_159979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159977 ?auto_159976 ) ( CLEAR ?auto_159977 ) ( ON-TABLE ?auto_159972 ) ( ON ?auto_159973 ?auto_159972 ) ( ON ?auto_159974 ?auto_159973 ) ( ON ?auto_159975 ?auto_159974 ) ( ON ?auto_159976 ?auto_159975 ) ( not ( = ?auto_159972 ?auto_159973 ) ) ( not ( = ?auto_159972 ?auto_159974 ) ) ( not ( = ?auto_159972 ?auto_159975 ) ) ( not ( = ?auto_159972 ?auto_159976 ) ) ( not ( = ?auto_159972 ?auto_159977 ) ) ( not ( = ?auto_159973 ?auto_159974 ) ) ( not ( = ?auto_159973 ?auto_159975 ) ) ( not ( = ?auto_159973 ?auto_159976 ) ) ( not ( = ?auto_159973 ?auto_159977 ) ) ( not ( = ?auto_159974 ?auto_159975 ) ) ( not ( = ?auto_159974 ?auto_159976 ) ) ( not ( = ?auto_159974 ?auto_159977 ) ) ( not ( = ?auto_159975 ?auto_159976 ) ) ( not ( = ?auto_159975 ?auto_159977 ) ) ( not ( = ?auto_159976 ?auto_159977 ) ) ( HOLDING ?auto_159978 ) ( CLEAR ?auto_159979 ) ( not ( = ?auto_159972 ?auto_159978 ) ) ( not ( = ?auto_159972 ?auto_159979 ) ) ( not ( = ?auto_159973 ?auto_159978 ) ) ( not ( = ?auto_159973 ?auto_159979 ) ) ( not ( = ?auto_159974 ?auto_159978 ) ) ( not ( = ?auto_159974 ?auto_159979 ) ) ( not ( = ?auto_159975 ?auto_159978 ) ) ( not ( = ?auto_159975 ?auto_159979 ) ) ( not ( = ?auto_159976 ?auto_159978 ) ) ( not ( = ?auto_159976 ?auto_159979 ) ) ( not ( = ?auto_159977 ?auto_159978 ) ) ( not ( = ?auto_159977 ?auto_159979 ) ) ( not ( = ?auto_159978 ?auto_159979 ) ) )
    :subtasks
    ( ( !STACK ?auto_159978 ?auto_159979 )
      ( MAKE-5PILE ?auto_159972 ?auto_159973 ?auto_159974 ?auto_159975 ?auto_159976 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_159980 - BLOCK
      ?auto_159981 - BLOCK
      ?auto_159982 - BLOCK
      ?auto_159983 - BLOCK
      ?auto_159984 - BLOCK
    )
    :vars
    (
      ?auto_159985 - BLOCK
      ?auto_159987 - BLOCK
      ?auto_159986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159985 ?auto_159984 ) ( ON-TABLE ?auto_159980 ) ( ON ?auto_159981 ?auto_159980 ) ( ON ?auto_159982 ?auto_159981 ) ( ON ?auto_159983 ?auto_159982 ) ( ON ?auto_159984 ?auto_159983 ) ( not ( = ?auto_159980 ?auto_159981 ) ) ( not ( = ?auto_159980 ?auto_159982 ) ) ( not ( = ?auto_159980 ?auto_159983 ) ) ( not ( = ?auto_159980 ?auto_159984 ) ) ( not ( = ?auto_159980 ?auto_159985 ) ) ( not ( = ?auto_159981 ?auto_159982 ) ) ( not ( = ?auto_159981 ?auto_159983 ) ) ( not ( = ?auto_159981 ?auto_159984 ) ) ( not ( = ?auto_159981 ?auto_159985 ) ) ( not ( = ?auto_159982 ?auto_159983 ) ) ( not ( = ?auto_159982 ?auto_159984 ) ) ( not ( = ?auto_159982 ?auto_159985 ) ) ( not ( = ?auto_159983 ?auto_159984 ) ) ( not ( = ?auto_159983 ?auto_159985 ) ) ( not ( = ?auto_159984 ?auto_159985 ) ) ( CLEAR ?auto_159987 ) ( not ( = ?auto_159980 ?auto_159986 ) ) ( not ( = ?auto_159980 ?auto_159987 ) ) ( not ( = ?auto_159981 ?auto_159986 ) ) ( not ( = ?auto_159981 ?auto_159987 ) ) ( not ( = ?auto_159982 ?auto_159986 ) ) ( not ( = ?auto_159982 ?auto_159987 ) ) ( not ( = ?auto_159983 ?auto_159986 ) ) ( not ( = ?auto_159983 ?auto_159987 ) ) ( not ( = ?auto_159984 ?auto_159986 ) ) ( not ( = ?auto_159984 ?auto_159987 ) ) ( not ( = ?auto_159985 ?auto_159986 ) ) ( not ( = ?auto_159985 ?auto_159987 ) ) ( not ( = ?auto_159986 ?auto_159987 ) ) ( ON ?auto_159986 ?auto_159985 ) ( CLEAR ?auto_159986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_159980 ?auto_159981 ?auto_159982 ?auto_159983 ?auto_159984 ?auto_159985 )
      ( MAKE-5PILE ?auto_159980 ?auto_159981 ?auto_159982 ?auto_159983 ?auto_159984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_159988 - BLOCK
      ?auto_159989 - BLOCK
      ?auto_159990 - BLOCK
      ?auto_159991 - BLOCK
      ?auto_159992 - BLOCK
    )
    :vars
    (
      ?auto_159994 - BLOCK
      ?auto_159993 - BLOCK
      ?auto_159995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_159994 ?auto_159992 ) ( ON-TABLE ?auto_159988 ) ( ON ?auto_159989 ?auto_159988 ) ( ON ?auto_159990 ?auto_159989 ) ( ON ?auto_159991 ?auto_159990 ) ( ON ?auto_159992 ?auto_159991 ) ( not ( = ?auto_159988 ?auto_159989 ) ) ( not ( = ?auto_159988 ?auto_159990 ) ) ( not ( = ?auto_159988 ?auto_159991 ) ) ( not ( = ?auto_159988 ?auto_159992 ) ) ( not ( = ?auto_159988 ?auto_159994 ) ) ( not ( = ?auto_159989 ?auto_159990 ) ) ( not ( = ?auto_159989 ?auto_159991 ) ) ( not ( = ?auto_159989 ?auto_159992 ) ) ( not ( = ?auto_159989 ?auto_159994 ) ) ( not ( = ?auto_159990 ?auto_159991 ) ) ( not ( = ?auto_159990 ?auto_159992 ) ) ( not ( = ?auto_159990 ?auto_159994 ) ) ( not ( = ?auto_159991 ?auto_159992 ) ) ( not ( = ?auto_159991 ?auto_159994 ) ) ( not ( = ?auto_159992 ?auto_159994 ) ) ( not ( = ?auto_159988 ?auto_159993 ) ) ( not ( = ?auto_159988 ?auto_159995 ) ) ( not ( = ?auto_159989 ?auto_159993 ) ) ( not ( = ?auto_159989 ?auto_159995 ) ) ( not ( = ?auto_159990 ?auto_159993 ) ) ( not ( = ?auto_159990 ?auto_159995 ) ) ( not ( = ?auto_159991 ?auto_159993 ) ) ( not ( = ?auto_159991 ?auto_159995 ) ) ( not ( = ?auto_159992 ?auto_159993 ) ) ( not ( = ?auto_159992 ?auto_159995 ) ) ( not ( = ?auto_159994 ?auto_159993 ) ) ( not ( = ?auto_159994 ?auto_159995 ) ) ( not ( = ?auto_159993 ?auto_159995 ) ) ( ON ?auto_159993 ?auto_159994 ) ( CLEAR ?auto_159993 ) ( HOLDING ?auto_159995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_159995 )
      ( MAKE-5PILE ?auto_159988 ?auto_159989 ?auto_159990 ?auto_159991 ?auto_159992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_159996 - BLOCK
      ?auto_159997 - BLOCK
      ?auto_159998 - BLOCK
      ?auto_159999 - BLOCK
      ?auto_160000 - BLOCK
    )
    :vars
    (
      ?auto_160003 - BLOCK
      ?auto_160002 - BLOCK
      ?auto_160001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160003 ?auto_160000 ) ( ON-TABLE ?auto_159996 ) ( ON ?auto_159997 ?auto_159996 ) ( ON ?auto_159998 ?auto_159997 ) ( ON ?auto_159999 ?auto_159998 ) ( ON ?auto_160000 ?auto_159999 ) ( not ( = ?auto_159996 ?auto_159997 ) ) ( not ( = ?auto_159996 ?auto_159998 ) ) ( not ( = ?auto_159996 ?auto_159999 ) ) ( not ( = ?auto_159996 ?auto_160000 ) ) ( not ( = ?auto_159996 ?auto_160003 ) ) ( not ( = ?auto_159997 ?auto_159998 ) ) ( not ( = ?auto_159997 ?auto_159999 ) ) ( not ( = ?auto_159997 ?auto_160000 ) ) ( not ( = ?auto_159997 ?auto_160003 ) ) ( not ( = ?auto_159998 ?auto_159999 ) ) ( not ( = ?auto_159998 ?auto_160000 ) ) ( not ( = ?auto_159998 ?auto_160003 ) ) ( not ( = ?auto_159999 ?auto_160000 ) ) ( not ( = ?auto_159999 ?auto_160003 ) ) ( not ( = ?auto_160000 ?auto_160003 ) ) ( not ( = ?auto_159996 ?auto_160002 ) ) ( not ( = ?auto_159996 ?auto_160001 ) ) ( not ( = ?auto_159997 ?auto_160002 ) ) ( not ( = ?auto_159997 ?auto_160001 ) ) ( not ( = ?auto_159998 ?auto_160002 ) ) ( not ( = ?auto_159998 ?auto_160001 ) ) ( not ( = ?auto_159999 ?auto_160002 ) ) ( not ( = ?auto_159999 ?auto_160001 ) ) ( not ( = ?auto_160000 ?auto_160002 ) ) ( not ( = ?auto_160000 ?auto_160001 ) ) ( not ( = ?auto_160003 ?auto_160002 ) ) ( not ( = ?auto_160003 ?auto_160001 ) ) ( not ( = ?auto_160002 ?auto_160001 ) ) ( ON ?auto_160002 ?auto_160003 ) ( ON ?auto_160001 ?auto_160002 ) ( CLEAR ?auto_160001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_159996 ?auto_159997 ?auto_159998 ?auto_159999 ?auto_160000 ?auto_160003 ?auto_160002 )
      ( MAKE-5PILE ?auto_159996 ?auto_159997 ?auto_159998 ?auto_159999 ?auto_160000 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160004 - BLOCK
      ?auto_160005 - BLOCK
      ?auto_160006 - BLOCK
      ?auto_160007 - BLOCK
      ?auto_160008 - BLOCK
    )
    :vars
    (
      ?auto_160010 - BLOCK
      ?auto_160009 - BLOCK
      ?auto_160011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160010 ?auto_160008 ) ( ON-TABLE ?auto_160004 ) ( ON ?auto_160005 ?auto_160004 ) ( ON ?auto_160006 ?auto_160005 ) ( ON ?auto_160007 ?auto_160006 ) ( ON ?auto_160008 ?auto_160007 ) ( not ( = ?auto_160004 ?auto_160005 ) ) ( not ( = ?auto_160004 ?auto_160006 ) ) ( not ( = ?auto_160004 ?auto_160007 ) ) ( not ( = ?auto_160004 ?auto_160008 ) ) ( not ( = ?auto_160004 ?auto_160010 ) ) ( not ( = ?auto_160005 ?auto_160006 ) ) ( not ( = ?auto_160005 ?auto_160007 ) ) ( not ( = ?auto_160005 ?auto_160008 ) ) ( not ( = ?auto_160005 ?auto_160010 ) ) ( not ( = ?auto_160006 ?auto_160007 ) ) ( not ( = ?auto_160006 ?auto_160008 ) ) ( not ( = ?auto_160006 ?auto_160010 ) ) ( not ( = ?auto_160007 ?auto_160008 ) ) ( not ( = ?auto_160007 ?auto_160010 ) ) ( not ( = ?auto_160008 ?auto_160010 ) ) ( not ( = ?auto_160004 ?auto_160009 ) ) ( not ( = ?auto_160004 ?auto_160011 ) ) ( not ( = ?auto_160005 ?auto_160009 ) ) ( not ( = ?auto_160005 ?auto_160011 ) ) ( not ( = ?auto_160006 ?auto_160009 ) ) ( not ( = ?auto_160006 ?auto_160011 ) ) ( not ( = ?auto_160007 ?auto_160009 ) ) ( not ( = ?auto_160007 ?auto_160011 ) ) ( not ( = ?auto_160008 ?auto_160009 ) ) ( not ( = ?auto_160008 ?auto_160011 ) ) ( not ( = ?auto_160010 ?auto_160009 ) ) ( not ( = ?auto_160010 ?auto_160011 ) ) ( not ( = ?auto_160009 ?auto_160011 ) ) ( ON ?auto_160009 ?auto_160010 ) ( HOLDING ?auto_160011 ) ( CLEAR ?auto_160009 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160004 ?auto_160005 ?auto_160006 ?auto_160007 ?auto_160008 ?auto_160010 ?auto_160009 ?auto_160011 )
      ( MAKE-5PILE ?auto_160004 ?auto_160005 ?auto_160006 ?auto_160007 ?auto_160008 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160012 - BLOCK
      ?auto_160013 - BLOCK
      ?auto_160014 - BLOCK
      ?auto_160015 - BLOCK
      ?auto_160016 - BLOCK
    )
    :vars
    (
      ?auto_160017 - BLOCK
      ?auto_160019 - BLOCK
      ?auto_160018 - BLOCK
      ?auto_160020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160017 ?auto_160016 ) ( ON-TABLE ?auto_160012 ) ( ON ?auto_160013 ?auto_160012 ) ( ON ?auto_160014 ?auto_160013 ) ( ON ?auto_160015 ?auto_160014 ) ( ON ?auto_160016 ?auto_160015 ) ( not ( = ?auto_160012 ?auto_160013 ) ) ( not ( = ?auto_160012 ?auto_160014 ) ) ( not ( = ?auto_160012 ?auto_160015 ) ) ( not ( = ?auto_160012 ?auto_160016 ) ) ( not ( = ?auto_160012 ?auto_160017 ) ) ( not ( = ?auto_160013 ?auto_160014 ) ) ( not ( = ?auto_160013 ?auto_160015 ) ) ( not ( = ?auto_160013 ?auto_160016 ) ) ( not ( = ?auto_160013 ?auto_160017 ) ) ( not ( = ?auto_160014 ?auto_160015 ) ) ( not ( = ?auto_160014 ?auto_160016 ) ) ( not ( = ?auto_160014 ?auto_160017 ) ) ( not ( = ?auto_160015 ?auto_160016 ) ) ( not ( = ?auto_160015 ?auto_160017 ) ) ( not ( = ?auto_160016 ?auto_160017 ) ) ( not ( = ?auto_160012 ?auto_160019 ) ) ( not ( = ?auto_160012 ?auto_160018 ) ) ( not ( = ?auto_160013 ?auto_160019 ) ) ( not ( = ?auto_160013 ?auto_160018 ) ) ( not ( = ?auto_160014 ?auto_160019 ) ) ( not ( = ?auto_160014 ?auto_160018 ) ) ( not ( = ?auto_160015 ?auto_160019 ) ) ( not ( = ?auto_160015 ?auto_160018 ) ) ( not ( = ?auto_160016 ?auto_160019 ) ) ( not ( = ?auto_160016 ?auto_160018 ) ) ( not ( = ?auto_160017 ?auto_160019 ) ) ( not ( = ?auto_160017 ?auto_160018 ) ) ( not ( = ?auto_160019 ?auto_160018 ) ) ( ON ?auto_160019 ?auto_160017 ) ( CLEAR ?auto_160019 ) ( ON ?auto_160018 ?auto_160020 ) ( CLEAR ?auto_160018 ) ( HAND-EMPTY ) ( not ( = ?auto_160012 ?auto_160020 ) ) ( not ( = ?auto_160013 ?auto_160020 ) ) ( not ( = ?auto_160014 ?auto_160020 ) ) ( not ( = ?auto_160015 ?auto_160020 ) ) ( not ( = ?auto_160016 ?auto_160020 ) ) ( not ( = ?auto_160017 ?auto_160020 ) ) ( not ( = ?auto_160019 ?auto_160020 ) ) ( not ( = ?auto_160018 ?auto_160020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160018 ?auto_160020 )
      ( MAKE-5PILE ?auto_160012 ?auto_160013 ?auto_160014 ?auto_160015 ?auto_160016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160021 - BLOCK
      ?auto_160022 - BLOCK
      ?auto_160023 - BLOCK
      ?auto_160024 - BLOCK
      ?auto_160025 - BLOCK
    )
    :vars
    (
      ?auto_160029 - BLOCK
      ?auto_160027 - BLOCK
      ?auto_160026 - BLOCK
      ?auto_160028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160029 ?auto_160025 ) ( ON-TABLE ?auto_160021 ) ( ON ?auto_160022 ?auto_160021 ) ( ON ?auto_160023 ?auto_160022 ) ( ON ?auto_160024 ?auto_160023 ) ( ON ?auto_160025 ?auto_160024 ) ( not ( = ?auto_160021 ?auto_160022 ) ) ( not ( = ?auto_160021 ?auto_160023 ) ) ( not ( = ?auto_160021 ?auto_160024 ) ) ( not ( = ?auto_160021 ?auto_160025 ) ) ( not ( = ?auto_160021 ?auto_160029 ) ) ( not ( = ?auto_160022 ?auto_160023 ) ) ( not ( = ?auto_160022 ?auto_160024 ) ) ( not ( = ?auto_160022 ?auto_160025 ) ) ( not ( = ?auto_160022 ?auto_160029 ) ) ( not ( = ?auto_160023 ?auto_160024 ) ) ( not ( = ?auto_160023 ?auto_160025 ) ) ( not ( = ?auto_160023 ?auto_160029 ) ) ( not ( = ?auto_160024 ?auto_160025 ) ) ( not ( = ?auto_160024 ?auto_160029 ) ) ( not ( = ?auto_160025 ?auto_160029 ) ) ( not ( = ?auto_160021 ?auto_160027 ) ) ( not ( = ?auto_160021 ?auto_160026 ) ) ( not ( = ?auto_160022 ?auto_160027 ) ) ( not ( = ?auto_160022 ?auto_160026 ) ) ( not ( = ?auto_160023 ?auto_160027 ) ) ( not ( = ?auto_160023 ?auto_160026 ) ) ( not ( = ?auto_160024 ?auto_160027 ) ) ( not ( = ?auto_160024 ?auto_160026 ) ) ( not ( = ?auto_160025 ?auto_160027 ) ) ( not ( = ?auto_160025 ?auto_160026 ) ) ( not ( = ?auto_160029 ?auto_160027 ) ) ( not ( = ?auto_160029 ?auto_160026 ) ) ( not ( = ?auto_160027 ?auto_160026 ) ) ( ON ?auto_160026 ?auto_160028 ) ( CLEAR ?auto_160026 ) ( not ( = ?auto_160021 ?auto_160028 ) ) ( not ( = ?auto_160022 ?auto_160028 ) ) ( not ( = ?auto_160023 ?auto_160028 ) ) ( not ( = ?auto_160024 ?auto_160028 ) ) ( not ( = ?auto_160025 ?auto_160028 ) ) ( not ( = ?auto_160029 ?auto_160028 ) ) ( not ( = ?auto_160027 ?auto_160028 ) ) ( not ( = ?auto_160026 ?auto_160028 ) ) ( HOLDING ?auto_160027 ) ( CLEAR ?auto_160029 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160021 ?auto_160022 ?auto_160023 ?auto_160024 ?auto_160025 ?auto_160029 ?auto_160027 )
      ( MAKE-5PILE ?auto_160021 ?auto_160022 ?auto_160023 ?auto_160024 ?auto_160025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160030 - BLOCK
      ?auto_160031 - BLOCK
      ?auto_160032 - BLOCK
      ?auto_160033 - BLOCK
      ?auto_160034 - BLOCK
    )
    :vars
    (
      ?auto_160035 - BLOCK
      ?auto_160036 - BLOCK
      ?auto_160037 - BLOCK
      ?auto_160038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160035 ?auto_160034 ) ( ON-TABLE ?auto_160030 ) ( ON ?auto_160031 ?auto_160030 ) ( ON ?auto_160032 ?auto_160031 ) ( ON ?auto_160033 ?auto_160032 ) ( ON ?auto_160034 ?auto_160033 ) ( not ( = ?auto_160030 ?auto_160031 ) ) ( not ( = ?auto_160030 ?auto_160032 ) ) ( not ( = ?auto_160030 ?auto_160033 ) ) ( not ( = ?auto_160030 ?auto_160034 ) ) ( not ( = ?auto_160030 ?auto_160035 ) ) ( not ( = ?auto_160031 ?auto_160032 ) ) ( not ( = ?auto_160031 ?auto_160033 ) ) ( not ( = ?auto_160031 ?auto_160034 ) ) ( not ( = ?auto_160031 ?auto_160035 ) ) ( not ( = ?auto_160032 ?auto_160033 ) ) ( not ( = ?auto_160032 ?auto_160034 ) ) ( not ( = ?auto_160032 ?auto_160035 ) ) ( not ( = ?auto_160033 ?auto_160034 ) ) ( not ( = ?auto_160033 ?auto_160035 ) ) ( not ( = ?auto_160034 ?auto_160035 ) ) ( not ( = ?auto_160030 ?auto_160036 ) ) ( not ( = ?auto_160030 ?auto_160037 ) ) ( not ( = ?auto_160031 ?auto_160036 ) ) ( not ( = ?auto_160031 ?auto_160037 ) ) ( not ( = ?auto_160032 ?auto_160036 ) ) ( not ( = ?auto_160032 ?auto_160037 ) ) ( not ( = ?auto_160033 ?auto_160036 ) ) ( not ( = ?auto_160033 ?auto_160037 ) ) ( not ( = ?auto_160034 ?auto_160036 ) ) ( not ( = ?auto_160034 ?auto_160037 ) ) ( not ( = ?auto_160035 ?auto_160036 ) ) ( not ( = ?auto_160035 ?auto_160037 ) ) ( not ( = ?auto_160036 ?auto_160037 ) ) ( ON ?auto_160037 ?auto_160038 ) ( not ( = ?auto_160030 ?auto_160038 ) ) ( not ( = ?auto_160031 ?auto_160038 ) ) ( not ( = ?auto_160032 ?auto_160038 ) ) ( not ( = ?auto_160033 ?auto_160038 ) ) ( not ( = ?auto_160034 ?auto_160038 ) ) ( not ( = ?auto_160035 ?auto_160038 ) ) ( not ( = ?auto_160036 ?auto_160038 ) ) ( not ( = ?auto_160037 ?auto_160038 ) ) ( CLEAR ?auto_160035 ) ( ON ?auto_160036 ?auto_160037 ) ( CLEAR ?auto_160036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160038 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160038 ?auto_160037 )
      ( MAKE-5PILE ?auto_160030 ?auto_160031 ?auto_160032 ?auto_160033 ?auto_160034 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160057 - BLOCK
      ?auto_160058 - BLOCK
      ?auto_160059 - BLOCK
      ?auto_160060 - BLOCK
      ?auto_160061 - BLOCK
    )
    :vars
    (
      ?auto_160063 - BLOCK
      ?auto_160062 - BLOCK
      ?auto_160065 - BLOCK
      ?auto_160064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160057 ) ( ON ?auto_160058 ?auto_160057 ) ( ON ?auto_160059 ?auto_160058 ) ( ON ?auto_160060 ?auto_160059 ) ( not ( = ?auto_160057 ?auto_160058 ) ) ( not ( = ?auto_160057 ?auto_160059 ) ) ( not ( = ?auto_160057 ?auto_160060 ) ) ( not ( = ?auto_160057 ?auto_160061 ) ) ( not ( = ?auto_160057 ?auto_160063 ) ) ( not ( = ?auto_160058 ?auto_160059 ) ) ( not ( = ?auto_160058 ?auto_160060 ) ) ( not ( = ?auto_160058 ?auto_160061 ) ) ( not ( = ?auto_160058 ?auto_160063 ) ) ( not ( = ?auto_160059 ?auto_160060 ) ) ( not ( = ?auto_160059 ?auto_160061 ) ) ( not ( = ?auto_160059 ?auto_160063 ) ) ( not ( = ?auto_160060 ?auto_160061 ) ) ( not ( = ?auto_160060 ?auto_160063 ) ) ( not ( = ?auto_160061 ?auto_160063 ) ) ( not ( = ?auto_160057 ?auto_160062 ) ) ( not ( = ?auto_160057 ?auto_160065 ) ) ( not ( = ?auto_160058 ?auto_160062 ) ) ( not ( = ?auto_160058 ?auto_160065 ) ) ( not ( = ?auto_160059 ?auto_160062 ) ) ( not ( = ?auto_160059 ?auto_160065 ) ) ( not ( = ?auto_160060 ?auto_160062 ) ) ( not ( = ?auto_160060 ?auto_160065 ) ) ( not ( = ?auto_160061 ?auto_160062 ) ) ( not ( = ?auto_160061 ?auto_160065 ) ) ( not ( = ?auto_160063 ?auto_160062 ) ) ( not ( = ?auto_160063 ?auto_160065 ) ) ( not ( = ?auto_160062 ?auto_160065 ) ) ( ON ?auto_160065 ?auto_160064 ) ( not ( = ?auto_160057 ?auto_160064 ) ) ( not ( = ?auto_160058 ?auto_160064 ) ) ( not ( = ?auto_160059 ?auto_160064 ) ) ( not ( = ?auto_160060 ?auto_160064 ) ) ( not ( = ?auto_160061 ?auto_160064 ) ) ( not ( = ?auto_160063 ?auto_160064 ) ) ( not ( = ?auto_160062 ?auto_160064 ) ) ( not ( = ?auto_160065 ?auto_160064 ) ) ( ON ?auto_160062 ?auto_160065 ) ( ON-TABLE ?auto_160064 ) ( ON ?auto_160063 ?auto_160062 ) ( CLEAR ?auto_160063 ) ( HOLDING ?auto_160061 ) ( CLEAR ?auto_160060 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160057 ?auto_160058 ?auto_160059 ?auto_160060 ?auto_160061 ?auto_160063 )
      ( MAKE-5PILE ?auto_160057 ?auto_160058 ?auto_160059 ?auto_160060 ?auto_160061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160066 - BLOCK
      ?auto_160067 - BLOCK
      ?auto_160068 - BLOCK
      ?auto_160069 - BLOCK
      ?auto_160070 - BLOCK
    )
    :vars
    (
      ?auto_160072 - BLOCK
      ?auto_160073 - BLOCK
      ?auto_160074 - BLOCK
      ?auto_160071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160066 ) ( ON ?auto_160067 ?auto_160066 ) ( ON ?auto_160068 ?auto_160067 ) ( ON ?auto_160069 ?auto_160068 ) ( not ( = ?auto_160066 ?auto_160067 ) ) ( not ( = ?auto_160066 ?auto_160068 ) ) ( not ( = ?auto_160066 ?auto_160069 ) ) ( not ( = ?auto_160066 ?auto_160070 ) ) ( not ( = ?auto_160066 ?auto_160072 ) ) ( not ( = ?auto_160067 ?auto_160068 ) ) ( not ( = ?auto_160067 ?auto_160069 ) ) ( not ( = ?auto_160067 ?auto_160070 ) ) ( not ( = ?auto_160067 ?auto_160072 ) ) ( not ( = ?auto_160068 ?auto_160069 ) ) ( not ( = ?auto_160068 ?auto_160070 ) ) ( not ( = ?auto_160068 ?auto_160072 ) ) ( not ( = ?auto_160069 ?auto_160070 ) ) ( not ( = ?auto_160069 ?auto_160072 ) ) ( not ( = ?auto_160070 ?auto_160072 ) ) ( not ( = ?auto_160066 ?auto_160073 ) ) ( not ( = ?auto_160066 ?auto_160074 ) ) ( not ( = ?auto_160067 ?auto_160073 ) ) ( not ( = ?auto_160067 ?auto_160074 ) ) ( not ( = ?auto_160068 ?auto_160073 ) ) ( not ( = ?auto_160068 ?auto_160074 ) ) ( not ( = ?auto_160069 ?auto_160073 ) ) ( not ( = ?auto_160069 ?auto_160074 ) ) ( not ( = ?auto_160070 ?auto_160073 ) ) ( not ( = ?auto_160070 ?auto_160074 ) ) ( not ( = ?auto_160072 ?auto_160073 ) ) ( not ( = ?auto_160072 ?auto_160074 ) ) ( not ( = ?auto_160073 ?auto_160074 ) ) ( ON ?auto_160074 ?auto_160071 ) ( not ( = ?auto_160066 ?auto_160071 ) ) ( not ( = ?auto_160067 ?auto_160071 ) ) ( not ( = ?auto_160068 ?auto_160071 ) ) ( not ( = ?auto_160069 ?auto_160071 ) ) ( not ( = ?auto_160070 ?auto_160071 ) ) ( not ( = ?auto_160072 ?auto_160071 ) ) ( not ( = ?auto_160073 ?auto_160071 ) ) ( not ( = ?auto_160074 ?auto_160071 ) ) ( ON ?auto_160073 ?auto_160074 ) ( ON-TABLE ?auto_160071 ) ( ON ?auto_160072 ?auto_160073 ) ( CLEAR ?auto_160069 ) ( ON ?auto_160070 ?auto_160072 ) ( CLEAR ?auto_160070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160071 ?auto_160074 ?auto_160073 ?auto_160072 )
      ( MAKE-5PILE ?auto_160066 ?auto_160067 ?auto_160068 ?auto_160069 ?auto_160070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160075 - BLOCK
      ?auto_160076 - BLOCK
      ?auto_160077 - BLOCK
      ?auto_160078 - BLOCK
      ?auto_160079 - BLOCK
    )
    :vars
    (
      ?auto_160083 - BLOCK
      ?auto_160081 - BLOCK
      ?auto_160080 - BLOCK
      ?auto_160082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160075 ) ( ON ?auto_160076 ?auto_160075 ) ( ON ?auto_160077 ?auto_160076 ) ( not ( = ?auto_160075 ?auto_160076 ) ) ( not ( = ?auto_160075 ?auto_160077 ) ) ( not ( = ?auto_160075 ?auto_160078 ) ) ( not ( = ?auto_160075 ?auto_160079 ) ) ( not ( = ?auto_160075 ?auto_160083 ) ) ( not ( = ?auto_160076 ?auto_160077 ) ) ( not ( = ?auto_160076 ?auto_160078 ) ) ( not ( = ?auto_160076 ?auto_160079 ) ) ( not ( = ?auto_160076 ?auto_160083 ) ) ( not ( = ?auto_160077 ?auto_160078 ) ) ( not ( = ?auto_160077 ?auto_160079 ) ) ( not ( = ?auto_160077 ?auto_160083 ) ) ( not ( = ?auto_160078 ?auto_160079 ) ) ( not ( = ?auto_160078 ?auto_160083 ) ) ( not ( = ?auto_160079 ?auto_160083 ) ) ( not ( = ?auto_160075 ?auto_160081 ) ) ( not ( = ?auto_160075 ?auto_160080 ) ) ( not ( = ?auto_160076 ?auto_160081 ) ) ( not ( = ?auto_160076 ?auto_160080 ) ) ( not ( = ?auto_160077 ?auto_160081 ) ) ( not ( = ?auto_160077 ?auto_160080 ) ) ( not ( = ?auto_160078 ?auto_160081 ) ) ( not ( = ?auto_160078 ?auto_160080 ) ) ( not ( = ?auto_160079 ?auto_160081 ) ) ( not ( = ?auto_160079 ?auto_160080 ) ) ( not ( = ?auto_160083 ?auto_160081 ) ) ( not ( = ?auto_160083 ?auto_160080 ) ) ( not ( = ?auto_160081 ?auto_160080 ) ) ( ON ?auto_160080 ?auto_160082 ) ( not ( = ?auto_160075 ?auto_160082 ) ) ( not ( = ?auto_160076 ?auto_160082 ) ) ( not ( = ?auto_160077 ?auto_160082 ) ) ( not ( = ?auto_160078 ?auto_160082 ) ) ( not ( = ?auto_160079 ?auto_160082 ) ) ( not ( = ?auto_160083 ?auto_160082 ) ) ( not ( = ?auto_160081 ?auto_160082 ) ) ( not ( = ?auto_160080 ?auto_160082 ) ) ( ON ?auto_160081 ?auto_160080 ) ( ON-TABLE ?auto_160082 ) ( ON ?auto_160083 ?auto_160081 ) ( ON ?auto_160079 ?auto_160083 ) ( CLEAR ?auto_160079 ) ( HOLDING ?auto_160078 ) ( CLEAR ?auto_160077 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160075 ?auto_160076 ?auto_160077 ?auto_160078 )
      ( MAKE-5PILE ?auto_160075 ?auto_160076 ?auto_160077 ?auto_160078 ?auto_160079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160084 - BLOCK
      ?auto_160085 - BLOCK
      ?auto_160086 - BLOCK
      ?auto_160087 - BLOCK
      ?auto_160088 - BLOCK
    )
    :vars
    (
      ?auto_160089 - BLOCK
      ?auto_160091 - BLOCK
      ?auto_160090 - BLOCK
      ?auto_160092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160084 ) ( ON ?auto_160085 ?auto_160084 ) ( ON ?auto_160086 ?auto_160085 ) ( not ( = ?auto_160084 ?auto_160085 ) ) ( not ( = ?auto_160084 ?auto_160086 ) ) ( not ( = ?auto_160084 ?auto_160087 ) ) ( not ( = ?auto_160084 ?auto_160088 ) ) ( not ( = ?auto_160084 ?auto_160089 ) ) ( not ( = ?auto_160085 ?auto_160086 ) ) ( not ( = ?auto_160085 ?auto_160087 ) ) ( not ( = ?auto_160085 ?auto_160088 ) ) ( not ( = ?auto_160085 ?auto_160089 ) ) ( not ( = ?auto_160086 ?auto_160087 ) ) ( not ( = ?auto_160086 ?auto_160088 ) ) ( not ( = ?auto_160086 ?auto_160089 ) ) ( not ( = ?auto_160087 ?auto_160088 ) ) ( not ( = ?auto_160087 ?auto_160089 ) ) ( not ( = ?auto_160088 ?auto_160089 ) ) ( not ( = ?auto_160084 ?auto_160091 ) ) ( not ( = ?auto_160084 ?auto_160090 ) ) ( not ( = ?auto_160085 ?auto_160091 ) ) ( not ( = ?auto_160085 ?auto_160090 ) ) ( not ( = ?auto_160086 ?auto_160091 ) ) ( not ( = ?auto_160086 ?auto_160090 ) ) ( not ( = ?auto_160087 ?auto_160091 ) ) ( not ( = ?auto_160087 ?auto_160090 ) ) ( not ( = ?auto_160088 ?auto_160091 ) ) ( not ( = ?auto_160088 ?auto_160090 ) ) ( not ( = ?auto_160089 ?auto_160091 ) ) ( not ( = ?auto_160089 ?auto_160090 ) ) ( not ( = ?auto_160091 ?auto_160090 ) ) ( ON ?auto_160090 ?auto_160092 ) ( not ( = ?auto_160084 ?auto_160092 ) ) ( not ( = ?auto_160085 ?auto_160092 ) ) ( not ( = ?auto_160086 ?auto_160092 ) ) ( not ( = ?auto_160087 ?auto_160092 ) ) ( not ( = ?auto_160088 ?auto_160092 ) ) ( not ( = ?auto_160089 ?auto_160092 ) ) ( not ( = ?auto_160091 ?auto_160092 ) ) ( not ( = ?auto_160090 ?auto_160092 ) ) ( ON ?auto_160091 ?auto_160090 ) ( ON-TABLE ?auto_160092 ) ( ON ?auto_160089 ?auto_160091 ) ( ON ?auto_160088 ?auto_160089 ) ( CLEAR ?auto_160086 ) ( ON ?auto_160087 ?auto_160088 ) ( CLEAR ?auto_160087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160092 ?auto_160090 ?auto_160091 ?auto_160089 ?auto_160088 )
      ( MAKE-5PILE ?auto_160084 ?auto_160085 ?auto_160086 ?auto_160087 ?auto_160088 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160093 - BLOCK
      ?auto_160094 - BLOCK
      ?auto_160095 - BLOCK
      ?auto_160096 - BLOCK
      ?auto_160097 - BLOCK
    )
    :vars
    (
      ?auto_160100 - BLOCK
      ?auto_160098 - BLOCK
      ?auto_160101 - BLOCK
      ?auto_160099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160093 ) ( ON ?auto_160094 ?auto_160093 ) ( not ( = ?auto_160093 ?auto_160094 ) ) ( not ( = ?auto_160093 ?auto_160095 ) ) ( not ( = ?auto_160093 ?auto_160096 ) ) ( not ( = ?auto_160093 ?auto_160097 ) ) ( not ( = ?auto_160093 ?auto_160100 ) ) ( not ( = ?auto_160094 ?auto_160095 ) ) ( not ( = ?auto_160094 ?auto_160096 ) ) ( not ( = ?auto_160094 ?auto_160097 ) ) ( not ( = ?auto_160094 ?auto_160100 ) ) ( not ( = ?auto_160095 ?auto_160096 ) ) ( not ( = ?auto_160095 ?auto_160097 ) ) ( not ( = ?auto_160095 ?auto_160100 ) ) ( not ( = ?auto_160096 ?auto_160097 ) ) ( not ( = ?auto_160096 ?auto_160100 ) ) ( not ( = ?auto_160097 ?auto_160100 ) ) ( not ( = ?auto_160093 ?auto_160098 ) ) ( not ( = ?auto_160093 ?auto_160101 ) ) ( not ( = ?auto_160094 ?auto_160098 ) ) ( not ( = ?auto_160094 ?auto_160101 ) ) ( not ( = ?auto_160095 ?auto_160098 ) ) ( not ( = ?auto_160095 ?auto_160101 ) ) ( not ( = ?auto_160096 ?auto_160098 ) ) ( not ( = ?auto_160096 ?auto_160101 ) ) ( not ( = ?auto_160097 ?auto_160098 ) ) ( not ( = ?auto_160097 ?auto_160101 ) ) ( not ( = ?auto_160100 ?auto_160098 ) ) ( not ( = ?auto_160100 ?auto_160101 ) ) ( not ( = ?auto_160098 ?auto_160101 ) ) ( ON ?auto_160101 ?auto_160099 ) ( not ( = ?auto_160093 ?auto_160099 ) ) ( not ( = ?auto_160094 ?auto_160099 ) ) ( not ( = ?auto_160095 ?auto_160099 ) ) ( not ( = ?auto_160096 ?auto_160099 ) ) ( not ( = ?auto_160097 ?auto_160099 ) ) ( not ( = ?auto_160100 ?auto_160099 ) ) ( not ( = ?auto_160098 ?auto_160099 ) ) ( not ( = ?auto_160101 ?auto_160099 ) ) ( ON ?auto_160098 ?auto_160101 ) ( ON-TABLE ?auto_160099 ) ( ON ?auto_160100 ?auto_160098 ) ( ON ?auto_160097 ?auto_160100 ) ( ON ?auto_160096 ?auto_160097 ) ( CLEAR ?auto_160096 ) ( HOLDING ?auto_160095 ) ( CLEAR ?auto_160094 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160093 ?auto_160094 ?auto_160095 )
      ( MAKE-5PILE ?auto_160093 ?auto_160094 ?auto_160095 ?auto_160096 ?auto_160097 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160102 - BLOCK
      ?auto_160103 - BLOCK
      ?auto_160104 - BLOCK
      ?auto_160105 - BLOCK
      ?auto_160106 - BLOCK
    )
    :vars
    (
      ?auto_160109 - BLOCK
      ?auto_160110 - BLOCK
      ?auto_160107 - BLOCK
      ?auto_160108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160102 ) ( ON ?auto_160103 ?auto_160102 ) ( not ( = ?auto_160102 ?auto_160103 ) ) ( not ( = ?auto_160102 ?auto_160104 ) ) ( not ( = ?auto_160102 ?auto_160105 ) ) ( not ( = ?auto_160102 ?auto_160106 ) ) ( not ( = ?auto_160102 ?auto_160109 ) ) ( not ( = ?auto_160103 ?auto_160104 ) ) ( not ( = ?auto_160103 ?auto_160105 ) ) ( not ( = ?auto_160103 ?auto_160106 ) ) ( not ( = ?auto_160103 ?auto_160109 ) ) ( not ( = ?auto_160104 ?auto_160105 ) ) ( not ( = ?auto_160104 ?auto_160106 ) ) ( not ( = ?auto_160104 ?auto_160109 ) ) ( not ( = ?auto_160105 ?auto_160106 ) ) ( not ( = ?auto_160105 ?auto_160109 ) ) ( not ( = ?auto_160106 ?auto_160109 ) ) ( not ( = ?auto_160102 ?auto_160110 ) ) ( not ( = ?auto_160102 ?auto_160107 ) ) ( not ( = ?auto_160103 ?auto_160110 ) ) ( not ( = ?auto_160103 ?auto_160107 ) ) ( not ( = ?auto_160104 ?auto_160110 ) ) ( not ( = ?auto_160104 ?auto_160107 ) ) ( not ( = ?auto_160105 ?auto_160110 ) ) ( not ( = ?auto_160105 ?auto_160107 ) ) ( not ( = ?auto_160106 ?auto_160110 ) ) ( not ( = ?auto_160106 ?auto_160107 ) ) ( not ( = ?auto_160109 ?auto_160110 ) ) ( not ( = ?auto_160109 ?auto_160107 ) ) ( not ( = ?auto_160110 ?auto_160107 ) ) ( ON ?auto_160107 ?auto_160108 ) ( not ( = ?auto_160102 ?auto_160108 ) ) ( not ( = ?auto_160103 ?auto_160108 ) ) ( not ( = ?auto_160104 ?auto_160108 ) ) ( not ( = ?auto_160105 ?auto_160108 ) ) ( not ( = ?auto_160106 ?auto_160108 ) ) ( not ( = ?auto_160109 ?auto_160108 ) ) ( not ( = ?auto_160110 ?auto_160108 ) ) ( not ( = ?auto_160107 ?auto_160108 ) ) ( ON ?auto_160110 ?auto_160107 ) ( ON-TABLE ?auto_160108 ) ( ON ?auto_160109 ?auto_160110 ) ( ON ?auto_160106 ?auto_160109 ) ( ON ?auto_160105 ?auto_160106 ) ( CLEAR ?auto_160103 ) ( ON ?auto_160104 ?auto_160105 ) ( CLEAR ?auto_160104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160108 ?auto_160107 ?auto_160110 ?auto_160109 ?auto_160106 ?auto_160105 )
      ( MAKE-5PILE ?auto_160102 ?auto_160103 ?auto_160104 ?auto_160105 ?auto_160106 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160111 - BLOCK
      ?auto_160112 - BLOCK
      ?auto_160113 - BLOCK
      ?auto_160114 - BLOCK
      ?auto_160115 - BLOCK
    )
    :vars
    (
      ?auto_160119 - BLOCK
      ?auto_160118 - BLOCK
      ?auto_160116 - BLOCK
      ?auto_160117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160111 ) ( not ( = ?auto_160111 ?auto_160112 ) ) ( not ( = ?auto_160111 ?auto_160113 ) ) ( not ( = ?auto_160111 ?auto_160114 ) ) ( not ( = ?auto_160111 ?auto_160115 ) ) ( not ( = ?auto_160111 ?auto_160119 ) ) ( not ( = ?auto_160112 ?auto_160113 ) ) ( not ( = ?auto_160112 ?auto_160114 ) ) ( not ( = ?auto_160112 ?auto_160115 ) ) ( not ( = ?auto_160112 ?auto_160119 ) ) ( not ( = ?auto_160113 ?auto_160114 ) ) ( not ( = ?auto_160113 ?auto_160115 ) ) ( not ( = ?auto_160113 ?auto_160119 ) ) ( not ( = ?auto_160114 ?auto_160115 ) ) ( not ( = ?auto_160114 ?auto_160119 ) ) ( not ( = ?auto_160115 ?auto_160119 ) ) ( not ( = ?auto_160111 ?auto_160118 ) ) ( not ( = ?auto_160111 ?auto_160116 ) ) ( not ( = ?auto_160112 ?auto_160118 ) ) ( not ( = ?auto_160112 ?auto_160116 ) ) ( not ( = ?auto_160113 ?auto_160118 ) ) ( not ( = ?auto_160113 ?auto_160116 ) ) ( not ( = ?auto_160114 ?auto_160118 ) ) ( not ( = ?auto_160114 ?auto_160116 ) ) ( not ( = ?auto_160115 ?auto_160118 ) ) ( not ( = ?auto_160115 ?auto_160116 ) ) ( not ( = ?auto_160119 ?auto_160118 ) ) ( not ( = ?auto_160119 ?auto_160116 ) ) ( not ( = ?auto_160118 ?auto_160116 ) ) ( ON ?auto_160116 ?auto_160117 ) ( not ( = ?auto_160111 ?auto_160117 ) ) ( not ( = ?auto_160112 ?auto_160117 ) ) ( not ( = ?auto_160113 ?auto_160117 ) ) ( not ( = ?auto_160114 ?auto_160117 ) ) ( not ( = ?auto_160115 ?auto_160117 ) ) ( not ( = ?auto_160119 ?auto_160117 ) ) ( not ( = ?auto_160118 ?auto_160117 ) ) ( not ( = ?auto_160116 ?auto_160117 ) ) ( ON ?auto_160118 ?auto_160116 ) ( ON-TABLE ?auto_160117 ) ( ON ?auto_160119 ?auto_160118 ) ( ON ?auto_160115 ?auto_160119 ) ( ON ?auto_160114 ?auto_160115 ) ( ON ?auto_160113 ?auto_160114 ) ( CLEAR ?auto_160113 ) ( HOLDING ?auto_160112 ) ( CLEAR ?auto_160111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160111 ?auto_160112 )
      ( MAKE-5PILE ?auto_160111 ?auto_160112 ?auto_160113 ?auto_160114 ?auto_160115 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160120 - BLOCK
      ?auto_160121 - BLOCK
      ?auto_160122 - BLOCK
      ?auto_160123 - BLOCK
      ?auto_160124 - BLOCK
    )
    :vars
    (
      ?auto_160126 - BLOCK
      ?auto_160125 - BLOCK
      ?auto_160127 - BLOCK
      ?auto_160128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160120 ) ( not ( = ?auto_160120 ?auto_160121 ) ) ( not ( = ?auto_160120 ?auto_160122 ) ) ( not ( = ?auto_160120 ?auto_160123 ) ) ( not ( = ?auto_160120 ?auto_160124 ) ) ( not ( = ?auto_160120 ?auto_160126 ) ) ( not ( = ?auto_160121 ?auto_160122 ) ) ( not ( = ?auto_160121 ?auto_160123 ) ) ( not ( = ?auto_160121 ?auto_160124 ) ) ( not ( = ?auto_160121 ?auto_160126 ) ) ( not ( = ?auto_160122 ?auto_160123 ) ) ( not ( = ?auto_160122 ?auto_160124 ) ) ( not ( = ?auto_160122 ?auto_160126 ) ) ( not ( = ?auto_160123 ?auto_160124 ) ) ( not ( = ?auto_160123 ?auto_160126 ) ) ( not ( = ?auto_160124 ?auto_160126 ) ) ( not ( = ?auto_160120 ?auto_160125 ) ) ( not ( = ?auto_160120 ?auto_160127 ) ) ( not ( = ?auto_160121 ?auto_160125 ) ) ( not ( = ?auto_160121 ?auto_160127 ) ) ( not ( = ?auto_160122 ?auto_160125 ) ) ( not ( = ?auto_160122 ?auto_160127 ) ) ( not ( = ?auto_160123 ?auto_160125 ) ) ( not ( = ?auto_160123 ?auto_160127 ) ) ( not ( = ?auto_160124 ?auto_160125 ) ) ( not ( = ?auto_160124 ?auto_160127 ) ) ( not ( = ?auto_160126 ?auto_160125 ) ) ( not ( = ?auto_160126 ?auto_160127 ) ) ( not ( = ?auto_160125 ?auto_160127 ) ) ( ON ?auto_160127 ?auto_160128 ) ( not ( = ?auto_160120 ?auto_160128 ) ) ( not ( = ?auto_160121 ?auto_160128 ) ) ( not ( = ?auto_160122 ?auto_160128 ) ) ( not ( = ?auto_160123 ?auto_160128 ) ) ( not ( = ?auto_160124 ?auto_160128 ) ) ( not ( = ?auto_160126 ?auto_160128 ) ) ( not ( = ?auto_160125 ?auto_160128 ) ) ( not ( = ?auto_160127 ?auto_160128 ) ) ( ON ?auto_160125 ?auto_160127 ) ( ON-TABLE ?auto_160128 ) ( ON ?auto_160126 ?auto_160125 ) ( ON ?auto_160124 ?auto_160126 ) ( ON ?auto_160123 ?auto_160124 ) ( ON ?auto_160122 ?auto_160123 ) ( CLEAR ?auto_160120 ) ( ON ?auto_160121 ?auto_160122 ) ( CLEAR ?auto_160121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160128 ?auto_160127 ?auto_160125 ?auto_160126 ?auto_160124 ?auto_160123 ?auto_160122 )
      ( MAKE-5PILE ?auto_160120 ?auto_160121 ?auto_160122 ?auto_160123 ?auto_160124 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160129 - BLOCK
      ?auto_160130 - BLOCK
      ?auto_160131 - BLOCK
      ?auto_160132 - BLOCK
      ?auto_160133 - BLOCK
    )
    :vars
    (
      ?auto_160135 - BLOCK
      ?auto_160136 - BLOCK
      ?auto_160137 - BLOCK
      ?auto_160134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160129 ?auto_160130 ) ) ( not ( = ?auto_160129 ?auto_160131 ) ) ( not ( = ?auto_160129 ?auto_160132 ) ) ( not ( = ?auto_160129 ?auto_160133 ) ) ( not ( = ?auto_160129 ?auto_160135 ) ) ( not ( = ?auto_160130 ?auto_160131 ) ) ( not ( = ?auto_160130 ?auto_160132 ) ) ( not ( = ?auto_160130 ?auto_160133 ) ) ( not ( = ?auto_160130 ?auto_160135 ) ) ( not ( = ?auto_160131 ?auto_160132 ) ) ( not ( = ?auto_160131 ?auto_160133 ) ) ( not ( = ?auto_160131 ?auto_160135 ) ) ( not ( = ?auto_160132 ?auto_160133 ) ) ( not ( = ?auto_160132 ?auto_160135 ) ) ( not ( = ?auto_160133 ?auto_160135 ) ) ( not ( = ?auto_160129 ?auto_160136 ) ) ( not ( = ?auto_160129 ?auto_160137 ) ) ( not ( = ?auto_160130 ?auto_160136 ) ) ( not ( = ?auto_160130 ?auto_160137 ) ) ( not ( = ?auto_160131 ?auto_160136 ) ) ( not ( = ?auto_160131 ?auto_160137 ) ) ( not ( = ?auto_160132 ?auto_160136 ) ) ( not ( = ?auto_160132 ?auto_160137 ) ) ( not ( = ?auto_160133 ?auto_160136 ) ) ( not ( = ?auto_160133 ?auto_160137 ) ) ( not ( = ?auto_160135 ?auto_160136 ) ) ( not ( = ?auto_160135 ?auto_160137 ) ) ( not ( = ?auto_160136 ?auto_160137 ) ) ( ON ?auto_160137 ?auto_160134 ) ( not ( = ?auto_160129 ?auto_160134 ) ) ( not ( = ?auto_160130 ?auto_160134 ) ) ( not ( = ?auto_160131 ?auto_160134 ) ) ( not ( = ?auto_160132 ?auto_160134 ) ) ( not ( = ?auto_160133 ?auto_160134 ) ) ( not ( = ?auto_160135 ?auto_160134 ) ) ( not ( = ?auto_160136 ?auto_160134 ) ) ( not ( = ?auto_160137 ?auto_160134 ) ) ( ON ?auto_160136 ?auto_160137 ) ( ON-TABLE ?auto_160134 ) ( ON ?auto_160135 ?auto_160136 ) ( ON ?auto_160133 ?auto_160135 ) ( ON ?auto_160132 ?auto_160133 ) ( ON ?auto_160131 ?auto_160132 ) ( ON ?auto_160130 ?auto_160131 ) ( CLEAR ?auto_160130 ) ( HOLDING ?auto_160129 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160129 )
      ( MAKE-5PILE ?auto_160129 ?auto_160130 ?auto_160131 ?auto_160132 ?auto_160133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160138 - BLOCK
      ?auto_160139 - BLOCK
      ?auto_160140 - BLOCK
      ?auto_160141 - BLOCK
      ?auto_160142 - BLOCK
    )
    :vars
    (
      ?auto_160145 - BLOCK
      ?auto_160143 - BLOCK
      ?auto_160146 - BLOCK
      ?auto_160144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160138 ?auto_160139 ) ) ( not ( = ?auto_160138 ?auto_160140 ) ) ( not ( = ?auto_160138 ?auto_160141 ) ) ( not ( = ?auto_160138 ?auto_160142 ) ) ( not ( = ?auto_160138 ?auto_160145 ) ) ( not ( = ?auto_160139 ?auto_160140 ) ) ( not ( = ?auto_160139 ?auto_160141 ) ) ( not ( = ?auto_160139 ?auto_160142 ) ) ( not ( = ?auto_160139 ?auto_160145 ) ) ( not ( = ?auto_160140 ?auto_160141 ) ) ( not ( = ?auto_160140 ?auto_160142 ) ) ( not ( = ?auto_160140 ?auto_160145 ) ) ( not ( = ?auto_160141 ?auto_160142 ) ) ( not ( = ?auto_160141 ?auto_160145 ) ) ( not ( = ?auto_160142 ?auto_160145 ) ) ( not ( = ?auto_160138 ?auto_160143 ) ) ( not ( = ?auto_160138 ?auto_160146 ) ) ( not ( = ?auto_160139 ?auto_160143 ) ) ( not ( = ?auto_160139 ?auto_160146 ) ) ( not ( = ?auto_160140 ?auto_160143 ) ) ( not ( = ?auto_160140 ?auto_160146 ) ) ( not ( = ?auto_160141 ?auto_160143 ) ) ( not ( = ?auto_160141 ?auto_160146 ) ) ( not ( = ?auto_160142 ?auto_160143 ) ) ( not ( = ?auto_160142 ?auto_160146 ) ) ( not ( = ?auto_160145 ?auto_160143 ) ) ( not ( = ?auto_160145 ?auto_160146 ) ) ( not ( = ?auto_160143 ?auto_160146 ) ) ( ON ?auto_160146 ?auto_160144 ) ( not ( = ?auto_160138 ?auto_160144 ) ) ( not ( = ?auto_160139 ?auto_160144 ) ) ( not ( = ?auto_160140 ?auto_160144 ) ) ( not ( = ?auto_160141 ?auto_160144 ) ) ( not ( = ?auto_160142 ?auto_160144 ) ) ( not ( = ?auto_160145 ?auto_160144 ) ) ( not ( = ?auto_160143 ?auto_160144 ) ) ( not ( = ?auto_160146 ?auto_160144 ) ) ( ON ?auto_160143 ?auto_160146 ) ( ON-TABLE ?auto_160144 ) ( ON ?auto_160145 ?auto_160143 ) ( ON ?auto_160142 ?auto_160145 ) ( ON ?auto_160141 ?auto_160142 ) ( ON ?auto_160140 ?auto_160141 ) ( ON ?auto_160139 ?auto_160140 ) ( ON ?auto_160138 ?auto_160139 ) ( CLEAR ?auto_160138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160144 ?auto_160146 ?auto_160143 ?auto_160145 ?auto_160142 ?auto_160141 ?auto_160140 ?auto_160139 )
      ( MAKE-5PILE ?auto_160138 ?auto_160139 ?auto_160140 ?auto_160141 ?auto_160142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160150 - BLOCK
      ?auto_160151 - BLOCK
      ?auto_160152 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_160152 ) ( CLEAR ?auto_160151 ) ( ON-TABLE ?auto_160150 ) ( ON ?auto_160151 ?auto_160150 ) ( not ( = ?auto_160150 ?auto_160151 ) ) ( not ( = ?auto_160150 ?auto_160152 ) ) ( not ( = ?auto_160151 ?auto_160152 ) ) )
    :subtasks
    ( ( !STACK ?auto_160152 ?auto_160151 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160153 - BLOCK
      ?auto_160154 - BLOCK
      ?auto_160155 - BLOCK
    )
    :vars
    (
      ?auto_160156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_160154 ) ( ON-TABLE ?auto_160153 ) ( ON ?auto_160154 ?auto_160153 ) ( not ( = ?auto_160153 ?auto_160154 ) ) ( not ( = ?auto_160153 ?auto_160155 ) ) ( not ( = ?auto_160154 ?auto_160155 ) ) ( ON ?auto_160155 ?auto_160156 ) ( CLEAR ?auto_160155 ) ( HAND-EMPTY ) ( not ( = ?auto_160153 ?auto_160156 ) ) ( not ( = ?auto_160154 ?auto_160156 ) ) ( not ( = ?auto_160155 ?auto_160156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160155 ?auto_160156 )
      ( MAKE-3PILE ?auto_160153 ?auto_160154 ?auto_160155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160157 - BLOCK
      ?auto_160158 - BLOCK
      ?auto_160159 - BLOCK
    )
    :vars
    (
      ?auto_160160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160157 ) ( not ( = ?auto_160157 ?auto_160158 ) ) ( not ( = ?auto_160157 ?auto_160159 ) ) ( not ( = ?auto_160158 ?auto_160159 ) ) ( ON ?auto_160159 ?auto_160160 ) ( CLEAR ?auto_160159 ) ( not ( = ?auto_160157 ?auto_160160 ) ) ( not ( = ?auto_160158 ?auto_160160 ) ) ( not ( = ?auto_160159 ?auto_160160 ) ) ( HOLDING ?auto_160158 ) ( CLEAR ?auto_160157 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160157 ?auto_160158 )
      ( MAKE-3PILE ?auto_160157 ?auto_160158 ?auto_160159 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160161 - BLOCK
      ?auto_160162 - BLOCK
      ?auto_160163 - BLOCK
    )
    :vars
    (
      ?auto_160164 - BLOCK
      ?auto_160165 - BLOCK
      ?auto_160168 - BLOCK
      ?auto_160166 - BLOCK
      ?auto_160167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160161 ) ( not ( = ?auto_160161 ?auto_160162 ) ) ( not ( = ?auto_160161 ?auto_160163 ) ) ( not ( = ?auto_160162 ?auto_160163 ) ) ( ON ?auto_160163 ?auto_160164 ) ( not ( = ?auto_160161 ?auto_160164 ) ) ( not ( = ?auto_160162 ?auto_160164 ) ) ( not ( = ?auto_160163 ?auto_160164 ) ) ( CLEAR ?auto_160161 ) ( ON ?auto_160162 ?auto_160163 ) ( CLEAR ?auto_160162 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160165 ) ( ON ?auto_160168 ?auto_160165 ) ( ON ?auto_160166 ?auto_160168 ) ( ON ?auto_160167 ?auto_160166 ) ( ON ?auto_160164 ?auto_160167 ) ( not ( = ?auto_160165 ?auto_160168 ) ) ( not ( = ?auto_160165 ?auto_160166 ) ) ( not ( = ?auto_160165 ?auto_160167 ) ) ( not ( = ?auto_160165 ?auto_160164 ) ) ( not ( = ?auto_160165 ?auto_160163 ) ) ( not ( = ?auto_160165 ?auto_160162 ) ) ( not ( = ?auto_160168 ?auto_160166 ) ) ( not ( = ?auto_160168 ?auto_160167 ) ) ( not ( = ?auto_160168 ?auto_160164 ) ) ( not ( = ?auto_160168 ?auto_160163 ) ) ( not ( = ?auto_160168 ?auto_160162 ) ) ( not ( = ?auto_160166 ?auto_160167 ) ) ( not ( = ?auto_160166 ?auto_160164 ) ) ( not ( = ?auto_160166 ?auto_160163 ) ) ( not ( = ?auto_160166 ?auto_160162 ) ) ( not ( = ?auto_160167 ?auto_160164 ) ) ( not ( = ?auto_160167 ?auto_160163 ) ) ( not ( = ?auto_160167 ?auto_160162 ) ) ( not ( = ?auto_160161 ?auto_160165 ) ) ( not ( = ?auto_160161 ?auto_160168 ) ) ( not ( = ?auto_160161 ?auto_160166 ) ) ( not ( = ?auto_160161 ?auto_160167 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160165 ?auto_160168 ?auto_160166 ?auto_160167 ?auto_160164 ?auto_160163 )
      ( MAKE-3PILE ?auto_160161 ?auto_160162 ?auto_160163 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160169 - BLOCK
      ?auto_160170 - BLOCK
      ?auto_160171 - BLOCK
    )
    :vars
    (
      ?auto_160176 - BLOCK
      ?auto_160172 - BLOCK
      ?auto_160174 - BLOCK
      ?auto_160175 - BLOCK
      ?auto_160173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160169 ?auto_160170 ) ) ( not ( = ?auto_160169 ?auto_160171 ) ) ( not ( = ?auto_160170 ?auto_160171 ) ) ( ON ?auto_160171 ?auto_160176 ) ( not ( = ?auto_160169 ?auto_160176 ) ) ( not ( = ?auto_160170 ?auto_160176 ) ) ( not ( = ?auto_160171 ?auto_160176 ) ) ( ON ?auto_160170 ?auto_160171 ) ( CLEAR ?auto_160170 ) ( ON-TABLE ?auto_160172 ) ( ON ?auto_160174 ?auto_160172 ) ( ON ?auto_160175 ?auto_160174 ) ( ON ?auto_160173 ?auto_160175 ) ( ON ?auto_160176 ?auto_160173 ) ( not ( = ?auto_160172 ?auto_160174 ) ) ( not ( = ?auto_160172 ?auto_160175 ) ) ( not ( = ?auto_160172 ?auto_160173 ) ) ( not ( = ?auto_160172 ?auto_160176 ) ) ( not ( = ?auto_160172 ?auto_160171 ) ) ( not ( = ?auto_160172 ?auto_160170 ) ) ( not ( = ?auto_160174 ?auto_160175 ) ) ( not ( = ?auto_160174 ?auto_160173 ) ) ( not ( = ?auto_160174 ?auto_160176 ) ) ( not ( = ?auto_160174 ?auto_160171 ) ) ( not ( = ?auto_160174 ?auto_160170 ) ) ( not ( = ?auto_160175 ?auto_160173 ) ) ( not ( = ?auto_160175 ?auto_160176 ) ) ( not ( = ?auto_160175 ?auto_160171 ) ) ( not ( = ?auto_160175 ?auto_160170 ) ) ( not ( = ?auto_160173 ?auto_160176 ) ) ( not ( = ?auto_160173 ?auto_160171 ) ) ( not ( = ?auto_160173 ?auto_160170 ) ) ( not ( = ?auto_160169 ?auto_160172 ) ) ( not ( = ?auto_160169 ?auto_160174 ) ) ( not ( = ?auto_160169 ?auto_160175 ) ) ( not ( = ?auto_160169 ?auto_160173 ) ) ( HOLDING ?auto_160169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160169 )
      ( MAKE-3PILE ?auto_160169 ?auto_160170 ?auto_160171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160177 - BLOCK
      ?auto_160178 - BLOCK
      ?auto_160179 - BLOCK
    )
    :vars
    (
      ?auto_160182 - BLOCK
      ?auto_160184 - BLOCK
      ?auto_160183 - BLOCK
      ?auto_160180 - BLOCK
      ?auto_160181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160177 ?auto_160178 ) ) ( not ( = ?auto_160177 ?auto_160179 ) ) ( not ( = ?auto_160178 ?auto_160179 ) ) ( ON ?auto_160179 ?auto_160182 ) ( not ( = ?auto_160177 ?auto_160182 ) ) ( not ( = ?auto_160178 ?auto_160182 ) ) ( not ( = ?auto_160179 ?auto_160182 ) ) ( ON ?auto_160178 ?auto_160179 ) ( ON-TABLE ?auto_160184 ) ( ON ?auto_160183 ?auto_160184 ) ( ON ?auto_160180 ?auto_160183 ) ( ON ?auto_160181 ?auto_160180 ) ( ON ?auto_160182 ?auto_160181 ) ( not ( = ?auto_160184 ?auto_160183 ) ) ( not ( = ?auto_160184 ?auto_160180 ) ) ( not ( = ?auto_160184 ?auto_160181 ) ) ( not ( = ?auto_160184 ?auto_160182 ) ) ( not ( = ?auto_160184 ?auto_160179 ) ) ( not ( = ?auto_160184 ?auto_160178 ) ) ( not ( = ?auto_160183 ?auto_160180 ) ) ( not ( = ?auto_160183 ?auto_160181 ) ) ( not ( = ?auto_160183 ?auto_160182 ) ) ( not ( = ?auto_160183 ?auto_160179 ) ) ( not ( = ?auto_160183 ?auto_160178 ) ) ( not ( = ?auto_160180 ?auto_160181 ) ) ( not ( = ?auto_160180 ?auto_160182 ) ) ( not ( = ?auto_160180 ?auto_160179 ) ) ( not ( = ?auto_160180 ?auto_160178 ) ) ( not ( = ?auto_160181 ?auto_160182 ) ) ( not ( = ?auto_160181 ?auto_160179 ) ) ( not ( = ?auto_160181 ?auto_160178 ) ) ( not ( = ?auto_160177 ?auto_160184 ) ) ( not ( = ?auto_160177 ?auto_160183 ) ) ( not ( = ?auto_160177 ?auto_160180 ) ) ( not ( = ?auto_160177 ?auto_160181 ) ) ( ON ?auto_160177 ?auto_160178 ) ( CLEAR ?auto_160177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160184 ?auto_160183 ?auto_160180 ?auto_160181 ?auto_160182 ?auto_160179 ?auto_160178 )
      ( MAKE-3PILE ?auto_160177 ?auto_160178 ?auto_160179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160185 - BLOCK
      ?auto_160186 - BLOCK
      ?auto_160187 - BLOCK
    )
    :vars
    (
      ?auto_160190 - BLOCK
      ?auto_160191 - BLOCK
      ?auto_160192 - BLOCK
      ?auto_160188 - BLOCK
      ?auto_160189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160185 ?auto_160186 ) ) ( not ( = ?auto_160185 ?auto_160187 ) ) ( not ( = ?auto_160186 ?auto_160187 ) ) ( ON ?auto_160187 ?auto_160190 ) ( not ( = ?auto_160185 ?auto_160190 ) ) ( not ( = ?auto_160186 ?auto_160190 ) ) ( not ( = ?auto_160187 ?auto_160190 ) ) ( ON ?auto_160186 ?auto_160187 ) ( ON-TABLE ?auto_160191 ) ( ON ?auto_160192 ?auto_160191 ) ( ON ?auto_160188 ?auto_160192 ) ( ON ?auto_160189 ?auto_160188 ) ( ON ?auto_160190 ?auto_160189 ) ( not ( = ?auto_160191 ?auto_160192 ) ) ( not ( = ?auto_160191 ?auto_160188 ) ) ( not ( = ?auto_160191 ?auto_160189 ) ) ( not ( = ?auto_160191 ?auto_160190 ) ) ( not ( = ?auto_160191 ?auto_160187 ) ) ( not ( = ?auto_160191 ?auto_160186 ) ) ( not ( = ?auto_160192 ?auto_160188 ) ) ( not ( = ?auto_160192 ?auto_160189 ) ) ( not ( = ?auto_160192 ?auto_160190 ) ) ( not ( = ?auto_160192 ?auto_160187 ) ) ( not ( = ?auto_160192 ?auto_160186 ) ) ( not ( = ?auto_160188 ?auto_160189 ) ) ( not ( = ?auto_160188 ?auto_160190 ) ) ( not ( = ?auto_160188 ?auto_160187 ) ) ( not ( = ?auto_160188 ?auto_160186 ) ) ( not ( = ?auto_160189 ?auto_160190 ) ) ( not ( = ?auto_160189 ?auto_160187 ) ) ( not ( = ?auto_160189 ?auto_160186 ) ) ( not ( = ?auto_160185 ?auto_160191 ) ) ( not ( = ?auto_160185 ?auto_160192 ) ) ( not ( = ?auto_160185 ?auto_160188 ) ) ( not ( = ?auto_160185 ?auto_160189 ) ) ( HOLDING ?auto_160185 ) ( CLEAR ?auto_160186 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160191 ?auto_160192 ?auto_160188 ?auto_160189 ?auto_160190 ?auto_160187 ?auto_160186 ?auto_160185 )
      ( MAKE-3PILE ?auto_160185 ?auto_160186 ?auto_160187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160193 - BLOCK
      ?auto_160194 - BLOCK
      ?auto_160195 - BLOCK
    )
    :vars
    (
      ?auto_160199 - BLOCK
      ?auto_160197 - BLOCK
      ?auto_160198 - BLOCK
      ?auto_160196 - BLOCK
      ?auto_160200 - BLOCK
      ?auto_160201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160193 ?auto_160194 ) ) ( not ( = ?auto_160193 ?auto_160195 ) ) ( not ( = ?auto_160194 ?auto_160195 ) ) ( ON ?auto_160195 ?auto_160199 ) ( not ( = ?auto_160193 ?auto_160199 ) ) ( not ( = ?auto_160194 ?auto_160199 ) ) ( not ( = ?auto_160195 ?auto_160199 ) ) ( ON ?auto_160194 ?auto_160195 ) ( ON-TABLE ?auto_160197 ) ( ON ?auto_160198 ?auto_160197 ) ( ON ?auto_160196 ?auto_160198 ) ( ON ?auto_160200 ?auto_160196 ) ( ON ?auto_160199 ?auto_160200 ) ( not ( = ?auto_160197 ?auto_160198 ) ) ( not ( = ?auto_160197 ?auto_160196 ) ) ( not ( = ?auto_160197 ?auto_160200 ) ) ( not ( = ?auto_160197 ?auto_160199 ) ) ( not ( = ?auto_160197 ?auto_160195 ) ) ( not ( = ?auto_160197 ?auto_160194 ) ) ( not ( = ?auto_160198 ?auto_160196 ) ) ( not ( = ?auto_160198 ?auto_160200 ) ) ( not ( = ?auto_160198 ?auto_160199 ) ) ( not ( = ?auto_160198 ?auto_160195 ) ) ( not ( = ?auto_160198 ?auto_160194 ) ) ( not ( = ?auto_160196 ?auto_160200 ) ) ( not ( = ?auto_160196 ?auto_160199 ) ) ( not ( = ?auto_160196 ?auto_160195 ) ) ( not ( = ?auto_160196 ?auto_160194 ) ) ( not ( = ?auto_160200 ?auto_160199 ) ) ( not ( = ?auto_160200 ?auto_160195 ) ) ( not ( = ?auto_160200 ?auto_160194 ) ) ( not ( = ?auto_160193 ?auto_160197 ) ) ( not ( = ?auto_160193 ?auto_160198 ) ) ( not ( = ?auto_160193 ?auto_160196 ) ) ( not ( = ?auto_160193 ?auto_160200 ) ) ( CLEAR ?auto_160194 ) ( ON ?auto_160193 ?auto_160201 ) ( CLEAR ?auto_160193 ) ( HAND-EMPTY ) ( not ( = ?auto_160193 ?auto_160201 ) ) ( not ( = ?auto_160194 ?auto_160201 ) ) ( not ( = ?auto_160195 ?auto_160201 ) ) ( not ( = ?auto_160199 ?auto_160201 ) ) ( not ( = ?auto_160197 ?auto_160201 ) ) ( not ( = ?auto_160198 ?auto_160201 ) ) ( not ( = ?auto_160196 ?auto_160201 ) ) ( not ( = ?auto_160200 ?auto_160201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160193 ?auto_160201 )
      ( MAKE-3PILE ?auto_160193 ?auto_160194 ?auto_160195 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160202 - BLOCK
      ?auto_160203 - BLOCK
      ?auto_160204 - BLOCK
    )
    :vars
    (
      ?auto_160208 - BLOCK
      ?auto_160209 - BLOCK
      ?auto_160206 - BLOCK
      ?auto_160205 - BLOCK
      ?auto_160207 - BLOCK
      ?auto_160210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160202 ?auto_160203 ) ) ( not ( = ?auto_160202 ?auto_160204 ) ) ( not ( = ?auto_160203 ?auto_160204 ) ) ( ON ?auto_160204 ?auto_160208 ) ( not ( = ?auto_160202 ?auto_160208 ) ) ( not ( = ?auto_160203 ?auto_160208 ) ) ( not ( = ?auto_160204 ?auto_160208 ) ) ( ON-TABLE ?auto_160209 ) ( ON ?auto_160206 ?auto_160209 ) ( ON ?auto_160205 ?auto_160206 ) ( ON ?auto_160207 ?auto_160205 ) ( ON ?auto_160208 ?auto_160207 ) ( not ( = ?auto_160209 ?auto_160206 ) ) ( not ( = ?auto_160209 ?auto_160205 ) ) ( not ( = ?auto_160209 ?auto_160207 ) ) ( not ( = ?auto_160209 ?auto_160208 ) ) ( not ( = ?auto_160209 ?auto_160204 ) ) ( not ( = ?auto_160209 ?auto_160203 ) ) ( not ( = ?auto_160206 ?auto_160205 ) ) ( not ( = ?auto_160206 ?auto_160207 ) ) ( not ( = ?auto_160206 ?auto_160208 ) ) ( not ( = ?auto_160206 ?auto_160204 ) ) ( not ( = ?auto_160206 ?auto_160203 ) ) ( not ( = ?auto_160205 ?auto_160207 ) ) ( not ( = ?auto_160205 ?auto_160208 ) ) ( not ( = ?auto_160205 ?auto_160204 ) ) ( not ( = ?auto_160205 ?auto_160203 ) ) ( not ( = ?auto_160207 ?auto_160208 ) ) ( not ( = ?auto_160207 ?auto_160204 ) ) ( not ( = ?auto_160207 ?auto_160203 ) ) ( not ( = ?auto_160202 ?auto_160209 ) ) ( not ( = ?auto_160202 ?auto_160206 ) ) ( not ( = ?auto_160202 ?auto_160205 ) ) ( not ( = ?auto_160202 ?auto_160207 ) ) ( ON ?auto_160202 ?auto_160210 ) ( CLEAR ?auto_160202 ) ( not ( = ?auto_160202 ?auto_160210 ) ) ( not ( = ?auto_160203 ?auto_160210 ) ) ( not ( = ?auto_160204 ?auto_160210 ) ) ( not ( = ?auto_160208 ?auto_160210 ) ) ( not ( = ?auto_160209 ?auto_160210 ) ) ( not ( = ?auto_160206 ?auto_160210 ) ) ( not ( = ?auto_160205 ?auto_160210 ) ) ( not ( = ?auto_160207 ?auto_160210 ) ) ( HOLDING ?auto_160203 ) ( CLEAR ?auto_160204 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160209 ?auto_160206 ?auto_160205 ?auto_160207 ?auto_160208 ?auto_160204 ?auto_160203 )
      ( MAKE-3PILE ?auto_160202 ?auto_160203 ?auto_160204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160211 - BLOCK
      ?auto_160212 - BLOCK
      ?auto_160213 - BLOCK
    )
    :vars
    (
      ?auto_160218 - BLOCK
      ?auto_160216 - BLOCK
      ?auto_160214 - BLOCK
      ?auto_160215 - BLOCK
      ?auto_160217 - BLOCK
      ?auto_160219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160211 ?auto_160212 ) ) ( not ( = ?auto_160211 ?auto_160213 ) ) ( not ( = ?auto_160212 ?auto_160213 ) ) ( ON ?auto_160213 ?auto_160218 ) ( not ( = ?auto_160211 ?auto_160218 ) ) ( not ( = ?auto_160212 ?auto_160218 ) ) ( not ( = ?auto_160213 ?auto_160218 ) ) ( ON-TABLE ?auto_160216 ) ( ON ?auto_160214 ?auto_160216 ) ( ON ?auto_160215 ?auto_160214 ) ( ON ?auto_160217 ?auto_160215 ) ( ON ?auto_160218 ?auto_160217 ) ( not ( = ?auto_160216 ?auto_160214 ) ) ( not ( = ?auto_160216 ?auto_160215 ) ) ( not ( = ?auto_160216 ?auto_160217 ) ) ( not ( = ?auto_160216 ?auto_160218 ) ) ( not ( = ?auto_160216 ?auto_160213 ) ) ( not ( = ?auto_160216 ?auto_160212 ) ) ( not ( = ?auto_160214 ?auto_160215 ) ) ( not ( = ?auto_160214 ?auto_160217 ) ) ( not ( = ?auto_160214 ?auto_160218 ) ) ( not ( = ?auto_160214 ?auto_160213 ) ) ( not ( = ?auto_160214 ?auto_160212 ) ) ( not ( = ?auto_160215 ?auto_160217 ) ) ( not ( = ?auto_160215 ?auto_160218 ) ) ( not ( = ?auto_160215 ?auto_160213 ) ) ( not ( = ?auto_160215 ?auto_160212 ) ) ( not ( = ?auto_160217 ?auto_160218 ) ) ( not ( = ?auto_160217 ?auto_160213 ) ) ( not ( = ?auto_160217 ?auto_160212 ) ) ( not ( = ?auto_160211 ?auto_160216 ) ) ( not ( = ?auto_160211 ?auto_160214 ) ) ( not ( = ?auto_160211 ?auto_160215 ) ) ( not ( = ?auto_160211 ?auto_160217 ) ) ( ON ?auto_160211 ?auto_160219 ) ( not ( = ?auto_160211 ?auto_160219 ) ) ( not ( = ?auto_160212 ?auto_160219 ) ) ( not ( = ?auto_160213 ?auto_160219 ) ) ( not ( = ?auto_160218 ?auto_160219 ) ) ( not ( = ?auto_160216 ?auto_160219 ) ) ( not ( = ?auto_160214 ?auto_160219 ) ) ( not ( = ?auto_160215 ?auto_160219 ) ) ( not ( = ?auto_160217 ?auto_160219 ) ) ( CLEAR ?auto_160213 ) ( ON ?auto_160212 ?auto_160211 ) ( CLEAR ?auto_160212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160219 ?auto_160211 )
      ( MAKE-3PILE ?auto_160211 ?auto_160212 ?auto_160213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160220 - BLOCK
      ?auto_160221 - BLOCK
      ?auto_160222 - BLOCK
    )
    :vars
    (
      ?auto_160224 - BLOCK
      ?auto_160226 - BLOCK
      ?auto_160223 - BLOCK
      ?auto_160225 - BLOCK
      ?auto_160228 - BLOCK
      ?auto_160227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160220 ?auto_160221 ) ) ( not ( = ?auto_160220 ?auto_160222 ) ) ( not ( = ?auto_160221 ?auto_160222 ) ) ( not ( = ?auto_160220 ?auto_160224 ) ) ( not ( = ?auto_160221 ?auto_160224 ) ) ( not ( = ?auto_160222 ?auto_160224 ) ) ( ON-TABLE ?auto_160226 ) ( ON ?auto_160223 ?auto_160226 ) ( ON ?auto_160225 ?auto_160223 ) ( ON ?auto_160228 ?auto_160225 ) ( ON ?auto_160224 ?auto_160228 ) ( not ( = ?auto_160226 ?auto_160223 ) ) ( not ( = ?auto_160226 ?auto_160225 ) ) ( not ( = ?auto_160226 ?auto_160228 ) ) ( not ( = ?auto_160226 ?auto_160224 ) ) ( not ( = ?auto_160226 ?auto_160222 ) ) ( not ( = ?auto_160226 ?auto_160221 ) ) ( not ( = ?auto_160223 ?auto_160225 ) ) ( not ( = ?auto_160223 ?auto_160228 ) ) ( not ( = ?auto_160223 ?auto_160224 ) ) ( not ( = ?auto_160223 ?auto_160222 ) ) ( not ( = ?auto_160223 ?auto_160221 ) ) ( not ( = ?auto_160225 ?auto_160228 ) ) ( not ( = ?auto_160225 ?auto_160224 ) ) ( not ( = ?auto_160225 ?auto_160222 ) ) ( not ( = ?auto_160225 ?auto_160221 ) ) ( not ( = ?auto_160228 ?auto_160224 ) ) ( not ( = ?auto_160228 ?auto_160222 ) ) ( not ( = ?auto_160228 ?auto_160221 ) ) ( not ( = ?auto_160220 ?auto_160226 ) ) ( not ( = ?auto_160220 ?auto_160223 ) ) ( not ( = ?auto_160220 ?auto_160225 ) ) ( not ( = ?auto_160220 ?auto_160228 ) ) ( ON ?auto_160220 ?auto_160227 ) ( not ( = ?auto_160220 ?auto_160227 ) ) ( not ( = ?auto_160221 ?auto_160227 ) ) ( not ( = ?auto_160222 ?auto_160227 ) ) ( not ( = ?auto_160224 ?auto_160227 ) ) ( not ( = ?auto_160226 ?auto_160227 ) ) ( not ( = ?auto_160223 ?auto_160227 ) ) ( not ( = ?auto_160225 ?auto_160227 ) ) ( not ( = ?auto_160228 ?auto_160227 ) ) ( ON ?auto_160221 ?auto_160220 ) ( CLEAR ?auto_160221 ) ( ON-TABLE ?auto_160227 ) ( HOLDING ?auto_160222 ) ( CLEAR ?auto_160224 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160226 ?auto_160223 ?auto_160225 ?auto_160228 ?auto_160224 ?auto_160222 )
      ( MAKE-3PILE ?auto_160220 ?auto_160221 ?auto_160222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160229 - BLOCK
      ?auto_160230 - BLOCK
      ?auto_160231 - BLOCK
    )
    :vars
    (
      ?auto_160237 - BLOCK
      ?auto_160233 - BLOCK
      ?auto_160236 - BLOCK
      ?auto_160234 - BLOCK
      ?auto_160232 - BLOCK
      ?auto_160235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160229 ?auto_160230 ) ) ( not ( = ?auto_160229 ?auto_160231 ) ) ( not ( = ?auto_160230 ?auto_160231 ) ) ( not ( = ?auto_160229 ?auto_160237 ) ) ( not ( = ?auto_160230 ?auto_160237 ) ) ( not ( = ?auto_160231 ?auto_160237 ) ) ( ON-TABLE ?auto_160233 ) ( ON ?auto_160236 ?auto_160233 ) ( ON ?auto_160234 ?auto_160236 ) ( ON ?auto_160232 ?auto_160234 ) ( ON ?auto_160237 ?auto_160232 ) ( not ( = ?auto_160233 ?auto_160236 ) ) ( not ( = ?auto_160233 ?auto_160234 ) ) ( not ( = ?auto_160233 ?auto_160232 ) ) ( not ( = ?auto_160233 ?auto_160237 ) ) ( not ( = ?auto_160233 ?auto_160231 ) ) ( not ( = ?auto_160233 ?auto_160230 ) ) ( not ( = ?auto_160236 ?auto_160234 ) ) ( not ( = ?auto_160236 ?auto_160232 ) ) ( not ( = ?auto_160236 ?auto_160237 ) ) ( not ( = ?auto_160236 ?auto_160231 ) ) ( not ( = ?auto_160236 ?auto_160230 ) ) ( not ( = ?auto_160234 ?auto_160232 ) ) ( not ( = ?auto_160234 ?auto_160237 ) ) ( not ( = ?auto_160234 ?auto_160231 ) ) ( not ( = ?auto_160234 ?auto_160230 ) ) ( not ( = ?auto_160232 ?auto_160237 ) ) ( not ( = ?auto_160232 ?auto_160231 ) ) ( not ( = ?auto_160232 ?auto_160230 ) ) ( not ( = ?auto_160229 ?auto_160233 ) ) ( not ( = ?auto_160229 ?auto_160236 ) ) ( not ( = ?auto_160229 ?auto_160234 ) ) ( not ( = ?auto_160229 ?auto_160232 ) ) ( ON ?auto_160229 ?auto_160235 ) ( not ( = ?auto_160229 ?auto_160235 ) ) ( not ( = ?auto_160230 ?auto_160235 ) ) ( not ( = ?auto_160231 ?auto_160235 ) ) ( not ( = ?auto_160237 ?auto_160235 ) ) ( not ( = ?auto_160233 ?auto_160235 ) ) ( not ( = ?auto_160236 ?auto_160235 ) ) ( not ( = ?auto_160234 ?auto_160235 ) ) ( not ( = ?auto_160232 ?auto_160235 ) ) ( ON ?auto_160230 ?auto_160229 ) ( ON-TABLE ?auto_160235 ) ( CLEAR ?auto_160237 ) ( ON ?auto_160231 ?auto_160230 ) ( CLEAR ?auto_160231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160235 ?auto_160229 ?auto_160230 )
      ( MAKE-3PILE ?auto_160229 ?auto_160230 ?auto_160231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160238 - BLOCK
      ?auto_160239 - BLOCK
      ?auto_160240 - BLOCK
    )
    :vars
    (
      ?auto_160241 - BLOCK
      ?auto_160246 - BLOCK
      ?auto_160245 - BLOCK
      ?auto_160243 - BLOCK
      ?auto_160242 - BLOCK
      ?auto_160244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160238 ?auto_160239 ) ) ( not ( = ?auto_160238 ?auto_160240 ) ) ( not ( = ?auto_160239 ?auto_160240 ) ) ( not ( = ?auto_160238 ?auto_160241 ) ) ( not ( = ?auto_160239 ?auto_160241 ) ) ( not ( = ?auto_160240 ?auto_160241 ) ) ( ON-TABLE ?auto_160246 ) ( ON ?auto_160245 ?auto_160246 ) ( ON ?auto_160243 ?auto_160245 ) ( ON ?auto_160242 ?auto_160243 ) ( not ( = ?auto_160246 ?auto_160245 ) ) ( not ( = ?auto_160246 ?auto_160243 ) ) ( not ( = ?auto_160246 ?auto_160242 ) ) ( not ( = ?auto_160246 ?auto_160241 ) ) ( not ( = ?auto_160246 ?auto_160240 ) ) ( not ( = ?auto_160246 ?auto_160239 ) ) ( not ( = ?auto_160245 ?auto_160243 ) ) ( not ( = ?auto_160245 ?auto_160242 ) ) ( not ( = ?auto_160245 ?auto_160241 ) ) ( not ( = ?auto_160245 ?auto_160240 ) ) ( not ( = ?auto_160245 ?auto_160239 ) ) ( not ( = ?auto_160243 ?auto_160242 ) ) ( not ( = ?auto_160243 ?auto_160241 ) ) ( not ( = ?auto_160243 ?auto_160240 ) ) ( not ( = ?auto_160243 ?auto_160239 ) ) ( not ( = ?auto_160242 ?auto_160241 ) ) ( not ( = ?auto_160242 ?auto_160240 ) ) ( not ( = ?auto_160242 ?auto_160239 ) ) ( not ( = ?auto_160238 ?auto_160246 ) ) ( not ( = ?auto_160238 ?auto_160245 ) ) ( not ( = ?auto_160238 ?auto_160243 ) ) ( not ( = ?auto_160238 ?auto_160242 ) ) ( ON ?auto_160238 ?auto_160244 ) ( not ( = ?auto_160238 ?auto_160244 ) ) ( not ( = ?auto_160239 ?auto_160244 ) ) ( not ( = ?auto_160240 ?auto_160244 ) ) ( not ( = ?auto_160241 ?auto_160244 ) ) ( not ( = ?auto_160246 ?auto_160244 ) ) ( not ( = ?auto_160245 ?auto_160244 ) ) ( not ( = ?auto_160243 ?auto_160244 ) ) ( not ( = ?auto_160242 ?auto_160244 ) ) ( ON ?auto_160239 ?auto_160238 ) ( ON-TABLE ?auto_160244 ) ( ON ?auto_160240 ?auto_160239 ) ( CLEAR ?auto_160240 ) ( HOLDING ?auto_160241 ) ( CLEAR ?auto_160242 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160246 ?auto_160245 ?auto_160243 ?auto_160242 ?auto_160241 )
      ( MAKE-3PILE ?auto_160238 ?auto_160239 ?auto_160240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160247 - BLOCK
      ?auto_160248 - BLOCK
      ?auto_160249 - BLOCK
    )
    :vars
    (
      ?auto_160251 - BLOCK
      ?auto_160250 - BLOCK
      ?auto_160255 - BLOCK
      ?auto_160252 - BLOCK
      ?auto_160254 - BLOCK
      ?auto_160253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160247 ?auto_160248 ) ) ( not ( = ?auto_160247 ?auto_160249 ) ) ( not ( = ?auto_160248 ?auto_160249 ) ) ( not ( = ?auto_160247 ?auto_160251 ) ) ( not ( = ?auto_160248 ?auto_160251 ) ) ( not ( = ?auto_160249 ?auto_160251 ) ) ( ON-TABLE ?auto_160250 ) ( ON ?auto_160255 ?auto_160250 ) ( ON ?auto_160252 ?auto_160255 ) ( ON ?auto_160254 ?auto_160252 ) ( not ( = ?auto_160250 ?auto_160255 ) ) ( not ( = ?auto_160250 ?auto_160252 ) ) ( not ( = ?auto_160250 ?auto_160254 ) ) ( not ( = ?auto_160250 ?auto_160251 ) ) ( not ( = ?auto_160250 ?auto_160249 ) ) ( not ( = ?auto_160250 ?auto_160248 ) ) ( not ( = ?auto_160255 ?auto_160252 ) ) ( not ( = ?auto_160255 ?auto_160254 ) ) ( not ( = ?auto_160255 ?auto_160251 ) ) ( not ( = ?auto_160255 ?auto_160249 ) ) ( not ( = ?auto_160255 ?auto_160248 ) ) ( not ( = ?auto_160252 ?auto_160254 ) ) ( not ( = ?auto_160252 ?auto_160251 ) ) ( not ( = ?auto_160252 ?auto_160249 ) ) ( not ( = ?auto_160252 ?auto_160248 ) ) ( not ( = ?auto_160254 ?auto_160251 ) ) ( not ( = ?auto_160254 ?auto_160249 ) ) ( not ( = ?auto_160254 ?auto_160248 ) ) ( not ( = ?auto_160247 ?auto_160250 ) ) ( not ( = ?auto_160247 ?auto_160255 ) ) ( not ( = ?auto_160247 ?auto_160252 ) ) ( not ( = ?auto_160247 ?auto_160254 ) ) ( ON ?auto_160247 ?auto_160253 ) ( not ( = ?auto_160247 ?auto_160253 ) ) ( not ( = ?auto_160248 ?auto_160253 ) ) ( not ( = ?auto_160249 ?auto_160253 ) ) ( not ( = ?auto_160251 ?auto_160253 ) ) ( not ( = ?auto_160250 ?auto_160253 ) ) ( not ( = ?auto_160255 ?auto_160253 ) ) ( not ( = ?auto_160252 ?auto_160253 ) ) ( not ( = ?auto_160254 ?auto_160253 ) ) ( ON ?auto_160248 ?auto_160247 ) ( ON-TABLE ?auto_160253 ) ( ON ?auto_160249 ?auto_160248 ) ( CLEAR ?auto_160254 ) ( ON ?auto_160251 ?auto_160249 ) ( CLEAR ?auto_160251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160253 ?auto_160247 ?auto_160248 ?auto_160249 )
      ( MAKE-3PILE ?auto_160247 ?auto_160248 ?auto_160249 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160256 - BLOCK
      ?auto_160257 - BLOCK
      ?auto_160258 - BLOCK
    )
    :vars
    (
      ?auto_160263 - BLOCK
      ?auto_160260 - BLOCK
      ?auto_160264 - BLOCK
      ?auto_160262 - BLOCK
      ?auto_160261 - BLOCK
      ?auto_160259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160256 ?auto_160257 ) ) ( not ( = ?auto_160256 ?auto_160258 ) ) ( not ( = ?auto_160257 ?auto_160258 ) ) ( not ( = ?auto_160256 ?auto_160263 ) ) ( not ( = ?auto_160257 ?auto_160263 ) ) ( not ( = ?auto_160258 ?auto_160263 ) ) ( ON-TABLE ?auto_160260 ) ( ON ?auto_160264 ?auto_160260 ) ( ON ?auto_160262 ?auto_160264 ) ( not ( = ?auto_160260 ?auto_160264 ) ) ( not ( = ?auto_160260 ?auto_160262 ) ) ( not ( = ?auto_160260 ?auto_160261 ) ) ( not ( = ?auto_160260 ?auto_160263 ) ) ( not ( = ?auto_160260 ?auto_160258 ) ) ( not ( = ?auto_160260 ?auto_160257 ) ) ( not ( = ?auto_160264 ?auto_160262 ) ) ( not ( = ?auto_160264 ?auto_160261 ) ) ( not ( = ?auto_160264 ?auto_160263 ) ) ( not ( = ?auto_160264 ?auto_160258 ) ) ( not ( = ?auto_160264 ?auto_160257 ) ) ( not ( = ?auto_160262 ?auto_160261 ) ) ( not ( = ?auto_160262 ?auto_160263 ) ) ( not ( = ?auto_160262 ?auto_160258 ) ) ( not ( = ?auto_160262 ?auto_160257 ) ) ( not ( = ?auto_160261 ?auto_160263 ) ) ( not ( = ?auto_160261 ?auto_160258 ) ) ( not ( = ?auto_160261 ?auto_160257 ) ) ( not ( = ?auto_160256 ?auto_160260 ) ) ( not ( = ?auto_160256 ?auto_160264 ) ) ( not ( = ?auto_160256 ?auto_160262 ) ) ( not ( = ?auto_160256 ?auto_160261 ) ) ( ON ?auto_160256 ?auto_160259 ) ( not ( = ?auto_160256 ?auto_160259 ) ) ( not ( = ?auto_160257 ?auto_160259 ) ) ( not ( = ?auto_160258 ?auto_160259 ) ) ( not ( = ?auto_160263 ?auto_160259 ) ) ( not ( = ?auto_160260 ?auto_160259 ) ) ( not ( = ?auto_160264 ?auto_160259 ) ) ( not ( = ?auto_160262 ?auto_160259 ) ) ( not ( = ?auto_160261 ?auto_160259 ) ) ( ON ?auto_160257 ?auto_160256 ) ( ON-TABLE ?auto_160259 ) ( ON ?auto_160258 ?auto_160257 ) ( ON ?auto_160263 ?auto_160258 ) ( CLEAR ?auto_160263 ) ( HOLDING ?auto_160261 ) ( CLEAR ?auto_160262 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160260 ?auto_160264 ?auto_160262 ?auto_160261 )
      ( MAKE-3PILE ?auto_160256 ?auto_160257 ?auto_160258 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160265 - BLOCK
      ?auto_160266 - BLOCK
      ?auto_160267 - BLOCK
    )
    :vars
    (
      ?auto_160271 - BLOCK
      ?auto_160268 - BLOCK
      ?auto_160269 - BLOCK
      ?auto_160270 - BLOCK
      ?auto_160272 - BLOCK
      ?auto_160273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160265 ?auto_160266 ) ) ( not ( = ?auto_160265 ?auto_160267 ) ) ( not ( = ?auto_160266 ?auto_160267 ) ) ( not ( = ?auto_160265 ?auto_160271 ) ) ( not ( = ?auto_160266 ?auto_160271 ) ) ( not ( = ?auto_160267 ?auto_160271 ) ) ( ON-TABLE ?auto_160268 ) ( ON ?auto_160269 ?auto_160268 ) ( ON ?auto_160270 ?auto_160269 ) ( not ( = ?auto_160268 ?auto_160269 ) ) ( not ( = ?auto_160268 ?auto_160270 ) ) ( not ( = ?auto_160268 ?auto_160272 ) ) ( not ( = ?auto_160268 ?auto_160271 ) ) ( not ( = ?auto_160268 ?auto_160267 ) ) ( not ( = ?auto_160268 ?auto_160266 ) ) ( not ( = ?auto_160269 ?auto_160270 ) ) ( not ( = ?auto_160269 ?auto_160272 ) ) ( not ( = ?auto_160269 ?auto_160271 ) ) ( not ( = ?auto_160269 ?auto_160267 ) ) ( not ( = ?auto_160269 ?auto_160266 ) ) ( not ( = ?auto_160270 ?auto_160272 ) ) ( not ( = ?auto_160270 ?auto_160271 ) ) ( not ( = ?auto_160270 ?auto_160267 ) ) ( not ( = ?auto_160270 ?auto_160266 ) ) ( not ( = ?auto_160272 ?auto_160271 ) ) ( not ( = ?auto_160272 ?auto_160267 ) ) ( not ( = ?auto_160272 ?auto_160266 ) ) ( not ( = ?auto_160265 ?auto_160268 ) ) ( not ( = ?auto_160265 ?auto_160269 ) ) ( not ( = ?auto_160265 ?auto_160270 ) ) ( not ( = ?auto_160265 ?auto_160272 ) ) ( ON ?auto_160265 ?auto_160273 ) ( not ( = ?auto_160265 ?auto_160273 ) ) ( not ( = ?auto_160266 ?auto_160273 ) ) ( not ( = ?auto_160267 ?auto_160273 ) ) ( not ( = ?auto_160271 ?auto_160273 ) ) ( not ( = ?auto_160268 ?auto_160273 ) ) ( not ( = ?auto_160269 ?auto_160273 ) ) ( not ( = ?auto_160270 ?auto_160273 ) ) ( not ( = ?auto_160272 ?auto_160273 ) ) ( ON ?auto_160266 ?auto_160265 ) ( ON-TABLE ?auto_160273 ) ( ON ?auto_160267 ?auto_160266 ) ( ON ?auto_160271 ?auto_160267 ) ( CLEAR ?auto_160270 ) ( ON ?auto_160272 ?auto_160271 ) ( CLEAR ?auto_160272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160273 ?auto_160265 ?auto_160266 ?auto_160267 ?auto_160271 )
      ( MAKE-3PILE ?auto_160265 ?auto_160266 ?auto_160267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160274 - BLOCK
      ?auto_160275 - BLOCK
      ?auto_160276 - BLOCK
    )
    :vars
    (
      ?auto_160280 - BLOCK
      ?auto_160277 - BLOCK
      ?auto_160278 - BLOCK
      ?auto_160281 - BLOCK
      ?auto_160282 - BLOCK
      ?auto_160279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160274 ?auto_160275 ) ) ( not ( = ?auto_160274 ?auto_160276 ) ) ( not ( = ?auto_160275 ?auto_160276 ) ) ( not ( = ?auto_160274 ?auto_160280 ) ) ( not ( = ?auto_160275 ?auto_160280 ) ) ( not ( = ?auto_160276 ?auto_160280 ) ) ( ON-TABLE ?auto_160277 ) ( ON ?auto_160278 ?auto_160277 ) ( not ( = ?auto_160277 ?auto_160278 ) ) ( not ( = ?auto_160277 ?auto_160281 ) ) ( not ( = ?auto_160277 ?auto_160282 ) ) ( not ( = ?auto_160277 ?auto_160280 ) ) ( not ( = ?auto_160277 ?auto_160276 ) ) ( not ( = ?auto_160277 ?auto_160275 ) ) ( not ( = ?auto_160278 ?auto_160281 ) ) ( not ( = ?auto_160278 ?auto_160282 ) ) ( not ( = ?auto_160278 ?auto_160280 ) ) ( not ( = ?auto_160278 ?auto_160276 ) ) ( not ( = ?auto_160278 ?auto_160275 ) ) ( not ( = ?auto_160281 ?auto_160282 ) ) ( not ( = ?auto_160281 ?auto_160280 ) ) ( not ( = ?auto_160281 ?auto_160276 ) ) ( not ( = ?auto_160281 ?auto_160275 ) ) ( not ( = ?auto_160282 ?auto_160280 ) ) ( not ( = ?auto_160282 ?auto_160276 ) ) ( not ( = ?auto_160282 ?auto_160275 ) ) ( not ( = ?auto_160274 ?auto_160277 ) ) ( not ( = ?auto_160274 ?auto_160278 ) ) ( not ( = ?auto_160274 ?auto_160281 ) ) ( not ( = ?auto_160274 ?auto_160282 ) ) ( ON ?auto_160274 ?auto_160279 ) ( not ( = ?auto_160274 ?auto_160279 ) ) ( not ( = ?auto_160275 ?auto_160279 ) ) ( not ( = ?auto_160276 ?auto_160279 ) ) ( not ( = ?auto_160280 ?auto_160279 ) ) ( not ( = ?auto_160277 ?auto_160279 ) ) ( not ( = ?auto_160278 ?auto_160279 ) ) ( not ( = ?auto_160281 ?auto_160279 ) ) ( not ( = ?auto_160282 ?auto_160279 ) ) ( ON ?auto_160275 ?auto_160274 ) ( ON-TABLE ?auto_160279 ) ( ON ?auto_160276 ?auto_160275 ) ( ON ?auto_160280 ?auto_160276 ) ( ON ?auto_160282 ?auto_160280 ) ( CLEAR ?auto_160282 ) ( HOLDING ?auto_160281 ) ( CLEAR ?auto_160278 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160277 ?auto_160278 ?auto_160281 )
      ( MAKE-3PILE ?auto_160274 ?auto_160275 ?auto_160276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160283 - BLOCK
      ?auto_160284 - BLOCK
      ?auto_160285 - BLOCK
    )
    :vars
    (
      ?auto_160287 - BLOCK
      ?auto_160290 - BLOCK
      ?auto_160288 - BLOCK
      ?auto_160291 - BLOCK
      ?auto_160286 - BLOCK
      ?auto_160289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160283 ?auto_160284 ) ) ( not ( = ?auto_160283 ?auto_160285 ) ) ( not ( = ?auto_160284 ?auto_160285 ) ) ( not ( = ?auto_160283 ?auto_160287 ) ) ( not ( = ?auto_160284 ?auto_160287 ) ) ( not ( = ?auto_160285 ?auto_160287 ) ) ( ON-TABLE ?auto_160290 ) ( ON ?auto_160288 ?auto_160290 ) ( not ( = ?auto_160290 ?auto_160288 ) ) ( not ( = ?auto_160290 ?auto_160291 ) ) ( not ( = ?auto_160290 ?auto_160286 ) ) ( not ( = ?auto_160290 ?auto_160287 ) ) ( not ( = ?auto_160290 ?auto_160285 ) ) ( not ( = ?auto_160290 ?auto_160284 ) ) ( not ( = ?auto_160288 ?auto_160291 ) ) ( not ( = ?auto_160288 ?auto_160286 ) ) ( not ( = ?auto_160288 ?auto_160287 ) ) ( not ( = ?auto_160288 ?auto_160285 ) ) ( not ( = ?auto_160288 ?auto_160284 ) ) ( not ( = ?auto_160291 ?auto_160286 ) ) ( not ( = ?auto_160291 ?auto_160287 ) ) ( not ( = ?auto_160291 ?auto_160285 ) ) ( not ( = ?auto_160291 ?auto_160284 ) ) ( not ( = ?auto_160286 ?auto_160287 ) ) ( not ( = ?auto_160286 ?auto_160285 ) ) ( not ( = ?auto_160286 ?auto_160284 ) ) ( not ( = ?auto_160283 ?auto_160290 ) ) ( not ( = ?auto_160283 ?auto_160288 ) ) ( not ( = ?auto_160283 ?auto_160291 ) ) ( not ( = ?auto_160283 ?auto_160286 ) ) ( ON ?auto_160283 ?auto_160289 ) ( not ( = ?auto_160283 ?auto_160289 ) ) ( not ( = ?auto_160284 ?auto_160289 ) ) ( not ( = ?auto_160285 ?auto_160289 ) ) ( not ( = ?auto_160287 ?auto_160289 ) ) ( not ( = ?auto_160290 ?auto_160289 ) ) ( not ( = ?auto_160288 ?auto_160289 ) ) ( not ( = ?auto_160291 ?auto_160289 ) ) ( not ( = ?auto_160286 ?auto_160289 ) ) ( ON ?auto_160284 ?auto_160283 ) ( ON-TABLE ?auto_160289 ) ( ON ?auto_160285 ?auto_160284 ) ( ON ?auto_160287 ?auto_160285 ) ( ON ?auto_160286 ?auto_160287 ) ( CLEAR ?auto_160288 ) ( ON ?auto_160291 ?auto_160286 ) ( CLEAR ?auto_160291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160289 ?auto_160283 ?auto_160284 ?auto_160285 ?auto_160287 ?auto_160286 )
      ( MAKE-3PILE ?auto_160283 ?auto_160284 ?auto_160285 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160292 - BLOCK
      ?auto_160293 - BLOCK
      ?auto_160294 - BLOCK
    )
    :vars
    (
      ?auto_160295 - BLOCK
      ?auto_160299 - BLOCK
      ?auto_160300 - BLOCK
      ?auto_160297 - BLOCK
      ?auto_160298 - BLOCK
      ?auto_160296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160292 ?auto_160293 ) ) ( not ( = ?auto_160292 ?auto_160294 ) ) ( not ( = ?auto_160293 ?auto_160294 ) ) ( not ( = ?auto_160292 ?auto_160295 ) ) ( not ( = ?auto_160293 ?auto_160295 ) ) ( not ( = ?auto_160294 ?auto_160295 ) ) ( ON-TABLE ?auto_160299 ) ( not ( = ?auto_160299 ?auto_160300 ) ) ( not ( = ?auto_160299 ?auto_160297 ) ) ( not ( = ?auto_160299 ?auto_160298 ) ) ( not ( = ?auto_160299 ?auto_160295 ) ) ( not ( = ?auto_160299 ?auto_160294 ) ) ( not ( = ?auto_160299 ?auto_160293 ) ) ( not ( = ?auto_160300 ?auto_160297 ) ) ( not ( = ?auto_160300 ?auto_160298 ) ) ( not ( = ?auto_160300 ?auto_160295 ) ) ( not ( = ?auto_160300 ?auto_160294 ) ) ( not ( = ?auto_160300 ?auto_160293 ) ) ( not ( = ?auto_160297 ?auto_160298 ) ) ( not ( = ?auto_160297 ?auto_160295 ) ) ( not ( = ?auto_160297 ?auto_160294 ) ) ( not ( = ?auto_160297 ?auto_160293 ) ) ( not ( = ?auto_160298 ?auto_160295 ) ) ( not ( = ?auto_160298 ?auto_160294 ) ) ( not ( = ?auto_160298 ?auto_160293 ) ) ( not ( = ?auto_160292 ?auto_160299 ) ) ( not ( = ?auto_160292 ?auto_160300 ) ) ( not ( = ?auto_160292 ?auto_160297 ) ) ( not ( = ?auto_160292 ?auto_160298 ) ) ( ON ?auto_160292 ?auto_160296 ) ( not ( = ?auto_160292 ?auto_160296 ) ) ( not ( = ?auto_160293 ?auto_160296 ) ) ( not ( = ?auto_160294 ?auto_160296 ) ) ( not ( = ?auto_160295 ?auto_160296 ) ) ( not ( = ?auto_160299 ?auto_160296 ) ) ( not ( = ?auto_160300 ?auto_160296 ) ) ( not ( = ?auto_160297 ?auto_160296 ) ) ( not ( = ?auto_160298 ?auto_160296 ) ) ( ON ?auto_160293 ?auto_160292 ) ( ON-TABLE ?auto_160296 ) ( ON ?auto_160294 ?auto_160293 ) ( ON ?auto_160295 ?auto_160294 ) ( ON ?auto_160298 ?auto_160295 ) ( ON ?auto_160297 ?auto_160298 ) ( CLEAR ?auto_160297 ) ( HOLDING ?auto_160300 ) ( CLEAR ?auto_160299 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160299 ?auto_160300 )
      ( MAKE-3PILE ?auto_160292 ?auto_160293 ?auto_160294 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160301 - BLOCK
      ?auto_160302 - BLOCK
      ?auto_160303 - BLOCK
    )
    :vars
    (
      ?auto_160308 - BLOCK
      ?auto_160304 - BLOCK
      ?auto_160305 - BLOCK
      ?auto_160306 - BLOCK
      ?auto_160307 - BLOCK
      ?auto_160309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160301 ?auto_160302 ) ) ( not ( = ?auto_160301 ?auto_160303 ) ) ( not ( = ?auto_160302 ?auto_160303 ) ) ( not ( = ?auto_160301 ?auto_160308 ) ) ( not ( = ?auto_160302 ?auto_160308 ) ) ( not ( = ?auto_160303 ?auto_160308 ) ) ( ON-TABLE ?auto_160304 ) ( not ( = ?auto_160304 ?auto_160305 ) ) ( not ( = ?auto_160304 ?auto_160306 ) ) ( not ( = ?auto_160304 ?auto_160307 ) ) ( not ( = ?auto_160304 ?auto_160308 ) ) ( not ( = ?auto_160304 ?auto_160303 ) ) ( not ( = ?auto_160304 ?auto_160302 ) ) ( not ( = ?auto_160305 ?auto_160306 ) ) ( not ( = ?auto_160305 ?auto_160307 ) ) ( not ( = ?auto_160305 ?auto_160308 ) ) ( not ( = ?auto_160305 ?auto_160303 ) ) ( not ( = ?auto_160305 ?auto_160302 ) ) ( not ( = ?auto_160306 ?auto_160307 ) ) ( not ( = ?auto_160306 ?auto_160308 ) ) ( not ( = ?auto_160306 ?auto_160303 ) ) ( not ( = ?auto_160306 ?auto_160302 ) ) ( not ( = ?auto_160307 ?auto_160308 ) ) ( not ( = ?auto_160307 ?auto_160303 ) ) ( not ( = ?auto_160307 ?auto_160302 ) ) ( not ( = ?auto_160301 ?auto_160304 ) ) ( not ( = ?auto_160301 ?auto_160305 ) ) ( not ( = ?auto_160301 ?auto_160306 ) ) ( not ( = ?auto_160301 ?auto_160307 ) ) ( ON ?auto_160301 ?auto_160309 ) ( not ( = ?auto_160301 ?auto_160309 ) ) ( not ( = ?auto_160302 ?auto_160309 ) ) ( not ( = ?auto_160303 ?auto_160309 ) ) ( not ( = ?auto_160308 ?auto_160309 ) ) ( not ( = ?auto_160304 ?auto_160309 ) ) ( not ( = ?auto_160305 ?auto_160309 ) ) ( not ( = ?auto_160306 ?auto_160309 ) ) ( not ( = ?auto_160307 ?auto_160309 ) ) ( ON ?auto_160302 ?auto_160301 ) ( ON-TABLE ?auto_160309 ) ( ON ?auto_160303 ?auto_160302 ) ( ON ?auto_160308 ?auto_160303 ) ( ON ?auto_160307 ?auto_160308 ) ( ON ?auto_160306 ?auto_160307 ) ( CLEAR ?auto_160304 ) ( ON ?auto_160305 ?auto_160306 ) ( CLEAR ?auto_160305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160309 ?auto_160301 ?auto_160302 ?auto_160303 ?auto_160308 ?auto_160307 ?auto_160306 )
      ( MAKE-3PILE ?auto_160301 ?auto_160302 ?auto_160303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160310 - BLOCK
      ?auto_160311 - BLOCK
      ?auto_160312 - BLOCK
    )
    :vars
    (
      ?auto_160317 - BLOCK
      ?auto_160314 - BLOCK
      ?auto_160318 - BLOCK
      ?auto_160313 - BLOCK
      ?auto_160315 - BLOCK
      ?auto_160316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160310 ?auto_160311 ) ) ( not ( = ?auto_160310 ?auto_160312 ) ) ( not ( = ?auto_160311 ?auto_160312 ) ) ( not ( = ?auto_160310 ?auto_160317 ) ) ( not ( = ?auto_160311 ?auto_160317 ) ) ( not ( = ?auto_160312 ?auto_160317 ) ) ( not ( = ?auto_160314 ?auto_160318 ) ) ( not ( = ?auto_160314 ?auto_160313 ) ) ( not ( = ?auto_160314 ?auto_160315 ) ) ( not ( = ?auto_160314 ?auto_160317 ) ) ( not ( = ?auto_160314 ?auto_160312 ) ) ( not ( = ?auto_160314 ?auto_160311 ) ) ( not ( = ?auto_160318 ?auto_160313 ) ) ( not ( = ?auto_160318 ?auto_160315 ) ) ( not ( = ?auto_160318 ?auto_160317 ) ) ( not ( = ?auto_160318 ?auto_160312 ) ) ( not ( = ?auto_160318 ?auto_160311 ) ) ( not ( = ?auto_160313 ?auto_160315 ) ) ( not ( = ?auto_160313 ?auto_160317 ) ) ( not ( = ?auto_160313 ?auto_160312 ) ) ( not ( = ?auto_160313 ?auto_160311 ) ) ( not ( = ?auto_160315 ?auto_160317 ) ) ( not ( = ?auto_160315 ?auto_160312 ) ) ( not ( = ?auto_160315 ?auto_160311 ) ) ( not ( = ?auto_160310 ?auto_160314 ) ) ( not ( = ?auto_160310 ?auto_160318 ) ) ( not ( = ?auto_160310 ?auto_160313 ) ) ( not ( = ?auto_160310 ?auto_160315 ) ) ( ON ?auto_160310 ?auto_160316 ) ( not ( = ?auto_160310 ?auto_160316 ) ) ( not ( = ?auto_160311 ?auto_160316 ) ) ( not ( = ?auto_160312 ?auto_160316 ) ) ( not ( = ?auto_160317 ?auto_160316 ) ) ( not ( = ?auto_160314 ?auto_160316 ) ) ( not ( = ?auto_160318 ?auto_160316 ) ) ( not ( = ?auto_160313 ?auto_160316 ) ) ( not ( = ?auto_160315 ?auto_160316 ) ) ( ON ?auto_160311 ?auto_160310 ) ( ON-TABLE ?auto_160316 ) ( ON ?auto_160312 ?auto_160311 ) ( ON ?auto_160317 ?auto_160312 ) ( ON ?auto_160315 ?auto_160317 ) ( ON ?auto_160313 ?auto_160315 ) ( ON ?auto_160318 ?auto_160313 ) ( CLEAR ?auto_160318 ) ( HOLDING ?auto_160314 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160314 )
      ( MAKE-3PILE ?auto_160310 ?auto_160311 ?auto_160312 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160319 - BLOCK
      ?auto_160320 - BLOCK
      ?auto_160321 - BLOCK
    )
    :vars
    (
      ?auto_160322 - BLOCK
      ?auto_160325 - BLOCK
      ?auto_160326 - BLOCK
      ?auto_160323 - BLOCK
      ?auto_160324 - BLOCK
      ?auto_160327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160319 ?auto_160320 ) ) ( not ( = ?auto_160319 ?auto_160321 ) ) ( not ( = ?auto_160320 ?auto_160321 ) ) ( not ( = ?auto_160319 ?auto_160322 ) ) ( not ( = ?auto_160320 ?auto_160322 ) ) ( not ( = ?auto_160321 ?auto_160322 ) ) ( not ( = ?auto_160325 ?auto_160326 ) ) ( not ( = ?auto_160325 ?auto_160323 ) ) ( not ( = ?auto_160325 ?auto_160324 ) ) ( not ( = ?auto_160325 ?auto_160322 ) ) ( not ( = ?auto_160325 ?auto_160321 ) ) ( not ( = ?auto_160325 ?auto_160320 ) ) ( not ( = ?auto_160326 ?auto_160323 ) ) ( not ( = ?auto_160326 ?auto_160324 ) ) ( not ( = ?auto_160326 ?auto_160322 ) ) ( not ( = ?auto_160326 ?auto_160321 ) ) ( not ( = ?auto_160326 ?auto_160320 ) ) ( not ( = ?auto_160323 ?auto_160324 ) ) ( not ( = ?auto_160323 ?auto_160322 ) ) ( not ( = ?auto_160323 ?auto_160321 ) ) ( not ( = ?auto_160323 ?auto_160320 ) ) ( not ( = ?auto_160324 ?auto_160322 ) ) ( not ( = ?auto_160324 ?auto_160321 ) ) ( not ( = ?auto_160324 ?auto_160320 ) ) ( not ( = ?auto_160319 ?auto_160325 ) ) ( not ( = ?auto_160319 ?auto_160326 ) ) ( not ( = ?auto_160319 ?auto_160323 ) ) ( not ( = ?auto_160319 ?auto_160324 ) ) ( ON ?auto_160319 ?auto_160327 ) ( not ( = ?auto_160319 ?auto_160327 ) ) ( not ( = ?auto_160320 ?auto_160327 ) ) ( not ( = ?auto_160321 ?auto_160327 ) ) ( not ( = ?auto_160322 ?auto_160327 ) ) ( not ( = ?auto_160325 ?auto_160327 ) ) ( not ( = ?auto_160326 ?auto_160327 ) ) ( not ( = ?auto_160323 ?auto_160327 ) ) ( not ( = ?auto_160324 ?auto_160327 ) ) ( ON ?auto_160320 ?auto_160319 ) ( ON-TABLE ?auto_160327 ) ( ON ?auto_160321 ?auto_160320 ) ( ON ?auto_160322 ?auto_160321 ) ( ON ?auto_160324 ?auto_160322 ) ( ON ?auto_160323 ?auto_160324 ) ( ON ?auto_160326 ?auto_160323 ) ( ON ?auto_160325 ?auto_160326 ) ( CLEAR ?auto_160325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160327 ?auto_160319 ?auto_160320 ?auto_160321 ?auto_160322 ?auto_160324 ?auto_160323 ?auto_160326 )
      ( MAKE-3PILE ?auto_160319 ?auto_160320 ?auto_160321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160332 - BLOCK
      ?auto_160333 - BLOCK
      ?auto_160334 - BLOCK
      ?auto_160335 - BLOCK
    )
    :vars
    (
      ?auto_160336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160336 ?auto_160335 ) ( CLEAR ?auto_160336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160332 ) ( ON ?auto_160333 ?auto_160332 ) ( ON ?auto_160334 ?auto_160333 ) ( ON ?auto_160335 ?auto_160334 ) ( not ( = ?auto_160332 ?auto_160333 ) ) ( not ( = ?auto_160332 ?auto_160334 ) ) ( not ( = ?auto_160332 ?auto_160335 ) ) ( not ( = ?auto_160332 ?auto_160336 ) ) ( not ( = ?auto_160333 ?auto_160334 ) ) ( not ( = ?auto_160333 ?auto_160335 ) ) ( not ( = ?auto_160333 ?auto_160336 ) ) ( not ( = ?auto_160334 ?auto_160335 ) ) ( not ( = ?auto_160334 ?auto_160336 ) ) ( not ( = ?auto_160335 ?auto_160336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160336 ?auto_160335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160337 - BLOCK
      ?auto_160338 - BLOCK
      ?auto_160339 - BLOCK
      ?auto_160340 - BLOCK
    )
    :vars
    (
      ?auto_160341 - BLOCK
      ?auto_160342 - BLOCK
      ?auto_160343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160341 ?auto_160340 ) ( CLEAR ?auto_160341 ) ( ON-TABLE ?auto_160337 ) ( ON ?auto_160338 ?auto_160337 ) ( ON ?auto_160339 ?auto_160338 ) ( ON ?auto_160340 ?auto_160339 ) ( not ( = ?auto_160337 ?auto_160338 ) ) ( not ( = ?auto_160337 ?auto_160339 ) ) ( not ( = ?auto_160337 ?auto_160340 ) ) ( not ( = ?auto_160337 ?auto_160341 ) ) ( not ( = ?auto_160338 ?auto_160339 ) ) ( not ( = ?auto_160338 ?auto_160340 ) ) ( not ( = ?auto_160338 ?auto_160341 ) ) ( not ( = ?auto_160339 ?auto_160340 ) ) ( not ( = ?auto_160339 ?auto_160341 ) ) ( not ( = ?auto_160340 ?auto_160341 ) ) ( HOLDING ?auto_160342 ) ( CLEAR ?auto_160343 ) ( not ( = ?auto_160337 ?auto_160342 ) ) ( not ( = ?auto_160337 ?auto_160343 ) ) ( not ( = ?auto_160338 ?auto_160342 ) ) ( not ( = ?auto_160338 ?auto_160343 ) ) ( not ( = ?auto_160339 ?auto_160342 ) ) ( not ( = ?auto_160339 ?auto_160343 ) ) ( not ( = ?auto_160340 ?auto_160342 ) ) ( not ( = ?auto_160340 ?auto_160343 ) ) ( not ( = ?auto_160341 ?auto_160342 ) ) ( not ( = ?auto_160341 ?auto_160343 ) ) ( not ( = ?auto_160342 ?auto_160343 ) ) )
    :subtasks
    ( ( !STACK ?auto_160342 ?auto_160343 )
      ( MAKE-4PILE ?auto_160337 ?auto_160338 ?auto_160339 ?auto_160340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160344 - BLOCK
      ?auto_160345 - BLOCK
      ?auto_160346 - BLOCK
      ?auto_160347 - BLOCK
    )
    :vars
    (
      ?auto_160349 - BLOCK
      ?auto_160350 - BLOCK
      ?auto_160348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160349 ?auto_160347 ) ( ON-TABLE ?auto_160344 ) ( ON ?auto_160345 ?auto_160344 ) ( ON ?auto_160346 ?auto_160345 ) ( ON ?auto_160347 ?auto_160346 ) ( not ( = ?auto_160344 ?auto_160345 ) ) ( not ( = ?auto_160344 ?auto_160346 ) ) ( not ( = ?auto_160344 ?auto_160347 ) ) ( not ( = ?auto_160344 ?auto_160349 ) ) ( not ( = ?auto_160345 ?auto_160346 ) ) ( not ( = ?auto_160345 ?auto_160347 ) ) ( not ( = ?auto_160345 ?auto_160349 ) ) ( not ( = ?auto_160346 ?auto_160347 ) ) ( not ( = ?auto_160346 ?auto_160349 ) ) ( not ( = ?auto_160347 ?auto_160349 ) ) ( CLEAR ?auto_160350 ) ( not ( = ?auto_160344 ?auto_160348 ) ) ( not ( = ?auto_160344 ?auto_160350 ) ) ( not ( = ?auto_160345 ?auto_160348 ) ) ( not ( = ?auto_160345 ?auto_160350 ) ) ( not ( = ?auto_160346 ?auto_160348 ) ) ( not ( = ?auto_160346 ?auto_160350 ) ) ( not ( = ?auto_160347 ?auto_160348 ) ) ( not ( = ?auto_160347 ?auto_160350 ) ) ( not ( = ?auto_160349 ?auto_160348 ) ) ( not ( = ?auto_160349 ?auto_160350 ) ) ( not ( = ?auto_160348 ?auto_160350 ) ) ( ON ?auto_160348 ?auto_160349 ) ( CLEAR ?auto_160348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160344 ?auto_160345 ?auto_160346 ?auto_160347 ?auto_160349 )
      ( MAKE-4PILE ?auto_160344 ?auto_160345 ?auto_160346 ?auto_160347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160351 - BLOCK
      ?auto_160352 - BLOCK
      ?auto_160353 - BLOCK
      ?auto_160354 - BLOCK
    )
    :vars
    (
      ?auto_160356 - BLOCK
      ?auto_160355 - BLOCK
      ?auto_160357 - BLOCK
      ?auto_160358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160356 ?auto_160354 ) ( ON-TABLE ?auto_160351 ) ( ON ?auto_160352 ?auto_160351 ) ( ON ?auto_160353 ?auto_160352 ) ( ON ?auto_160354 ?auto_160353 ) ( not ( = ?auto_160351 ?auto_160352 ) ) ( not ( = ?auto_160351 ?auto_160353 ) ) ( not ( = ?auto_160351 ?auto_160354 ) ) ( not ( = ?auto_160351 ?auto_160356 ) ) ( not ( = ?auto_160352 ?auto_160353 ) ) ( not ( = ?auto_160352 ?auto_160354 ) ) ( not ( = ?auto_160352 ?auto_160356 ) ) ( not ( = ?auto_160353 ?auto_160354 ) ) ( not ( = ?auto_160353 ?auto_160356 ) ) ( not ( = ?auto_160354 ?auto_160356 ) ) ( not ( = ?auto_160351 ?auto_160355 ) ) ( not ( = ?auto_160351 ?auto_160357 ) ) ( not ( = ?auto_160352 ?auto_160355 ) ) ( not ( = ?auto_160352 ?auto_160357 ) ) ( not ( = ?auto_160353 ?auto_160355 ) ) ( not ( = ?auto_160353 ?auto_160357 ) ) ( not ( = ?auto_160354 ?auto_160355 ) ) ( not ( = ?auto_160354 ?auto_160357 ) ) ( not ( = ?auto_160356 ?auto_160355 ) ) ( not ( = ?auto_160356 ?auto_160357 ) ) ( not ( = ?auto_160355 ?auto_160357 ) ) ( ON ?auto_160355 ?auto_160356 ) ( CLEAR ?auto_160355 ) ( HOLDING ?auto_160357 ) ( CLEAR ?auto_160358 ) ( ON-TABLE ?auto_160358 ) ( not ( = ?auto_160358 ?auto_160357 ) ) ( not ( = ?auto_160351 ?auto_160358 ) ) ( not ( = ?auto_160352 ?auto_160358 ) ) ( not ( = ?auto_160353 ?auto_160358 ) ) ( not ( = ?auto_160354 ?auto_160358 ) ) ( not ( = ?auto_160356 ?auto_160358 ) ) ( not ( = ?auto_160355 ?auto_160358 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160358 ?auto_160357 )
      ( MAKE-4PILE ?auto_160351 ?auto_160352 ?auto_160353 ?auto_160354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160359 - BLOCK
      ?auto_160360 - BLOCK
      ?auto_160361 - BLOCK
      ?auto_160362 - BLOCK
    )
    :vars
    (
      ?auto_160365 - BLOCK
      ?auto_160364 - BLOCK
      ?auto_160363 - BLOCK
      ?auto_160366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160365 ?auto_160362 ) ( ON-TABLE ?auto_160359 ) ( ON ?auto_160360 ?auto_160359 ) ( ON ?auto_160361 ?auto_160360 ) ( ON ?auto_160362 ?auto_160361 ) ( not ( = ?auto_160359 ?auto_160360 ) ) ( not ( = ?auto_160359 ?auto_160361 ) ) ( not ( = ?auto_160359 ?auto_160362 ) ) ( not ( = ?auto_160359 ?auto_160365 ) ) ( not ( = ?auto_160360 ?auto_160361 ) ) ( not ( = ?auto_160360 ?auto_160362 ) ) ( not ( = ?auto_160360 ?auto_160365 ) ) ( not ( = ?auto_160361 ?auto_160362 ) ) ( not ( = ?auto_160361 ?auto_160365 ) ) ( not ( = ?auto_160362 ?auto_160365 ) ) ( not ( = ?auto_160359 ?auto_160364 ) ) ( not ( = ?auto_160359 ?auto_160363 ) ) ( not ( = ?auto_160360 ?auto_160364 ) ) ( not ( = ?auto_160360 ?auto_160363 ) ) ( not ( = ?auto_160361 ?auto_160364 ) ) ( not ( = ?auto_160361 ?auto_160363 ) ) ( not ( = ?auto_160362 ?auto_160364 ) ) ( not ( = ?auto_160362 ?auto_160363 ) ) ( not ( = ?auto_160365 ?auto_160364 ) ) ( not ( = ?auto_160365 ?auto_160363 ) ) ( not ( = ?auto_160364 ?auto_160363 ) ) ( ON ?auto_160364 ?auto_160365 ) ( CLEAR ?auto_160366 ) ( ON-TABLE ?auto_160366 ) ( not ( = ?auto_160366 ?auto_160363 ) ) ( not ( = ?auto_160359 ?auto_160366 ) ) ( not ( = ?auto_160360 ?auto_160366 ) ) ( not ( = ?auto_160361 ?auto_160366 ) ) ( not ( = ?auto_160362 ?auto_160366 ) ) ( not ( = ?auto_160365 ?auto_160366 ) ) ( not ( = ?auto_160364 ?auto_160366 ) ) ( ON ?auto_160363 ?auto_160364 ) ( CLEAR ?auto_160363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160359 ?auto_160360 ?auto_160361 ?auto_160362 ?auto_160365 ?auto_160364 )
      ( MAKE-4PILE ?auto_160359 ?auto_160360 ?auto_160361 ?auto_160362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160367 - BLOCK
      ?auto_160368 - BLOCK
      ?auto_160369 - BLOCK
      ?auto_160370 - BLOCK
    )
    :vars
    (
      ?auto_160372 - BLOCK
      ?auto_160373 - BLOCK
      ?auto_160371 - BLOCK
      ?auto_160374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160372 ?auto_160370 ) ( ON-TABLE ?auto_160367 ) ( ON ?auto_160368 ?auto_160367 ) ( ON ?auto_160369 ?auto_160368 ) ( ON ?auto_160370 ?auto_160369 ) ( not ( = ?auto_160367 ?auto_160368 ) ) ( not ( = ?auto_160367 ?auto_160369 ) ) ( not ( = ?auto_160367 ?auto_160370 ) ) ( not ( = ?auto_160367 ?auto_160372 ) ) ( not ( = ?auto_160368 ?auto_160369 ) ) ( not ( = ?auto_160368 ?auto_160370 ) ) ( not ( = ?auto_160368 ?auto_160372 ) ) ( not ( = ?auto_160369 ?auto_160370 ) ) ( not ( = ?auto_160369 ?auto_160372 ) ) ( not ( = ?auto_160370 ?auto_160372 ) ) ( not ( = ?auto_160367 ?auto_160373 ) ) ( not ( = ?auto_160367 ?auto_160371 ) ) ( not ( = ?auto_160368 ?auto_160373 ) ) ( not ( = ?auto_160368 ?auto_160371 ) ) ( not ( = ?auto_160369 ?auto_160373 ) ) ( not ( = ?auto_160369 ?auto_160371 ) ) ( not ( = ?auto_160370 ?auto_160373 ) ) ( not ( = ?auto_160370 ?auto_160371 ) ) ( not ( = ?auto_160372 ?auto_160373 ) ) ( not ( = ?auto_160372 ?auto_160371 ) ) ( not ( = ?auto_160373 ?auto_160371 ) ) ( ON ?auto_160373 ?auto_160372 ) ( not ( = ?auto_160374 ?auto_160371 ) ) ( not ( = ?auto_160367 ?auto_160374 ) ) ( not ( = ?auto_160368 ?auto_160374 ) ) ( not ( = ?auto_160369 ?auto_160374 ) ) ( not ( = ?auto_160370 ?auto_160374 ) ) ( not ( = ?auto_160372 ?auto_160374 ) ) ( not ( = ?auto_160373 ?auto_160374 ) ) ( ON ?auto_160371 ?auto_160373 ) ( CLEAR ?auto_160371 ) ( HOLDING ?auto_160374 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160374 )
      ( MAKE-4PILE ?auto_160367 ?auto_160368 ?auto_160369 ?auto_160370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160375 - BLOCK
      ?auto_160376 - BLOCK
      ?auto_160377 - BLOCK
      ?auto_160378 - BLOCK
    )
    :vars
    (
      ?auto_160379 - BLOCK
      ?auto_160380 - BLOCK
      ?auto_160381 - BLOCK
      ?auto_160382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160379 ?auto_160378 ) ( ON-TABLE ?auto_160375 ) ( ON ?auto_160376 ?auto_160375 ) ( ON ?auto_160377 ?auto_160376 ) ( ON ?auto_160378 ?auto_160377 ) ( not ( = ?auto_160375 ?auto_160376 ) ) ( not ( = ?auto_160375 ?auto_160377 ) ) ( not ( = ?auto_160375 ?auto_160378 ) ) ( not ( = ?auto_160375 ?auto_160379 ) ) ( not ( = ?auto_160376 ?auto_160377 ) ) ( not ( = ?auto_160376 ?auto_160378 ) ) ( not ( = ?auto_160376 ?auto_160379 ) ) ( not ( = ?auto_160377 ?auto_160378 ) ) ( not ( = ?auto_160377 ?auto_160379 ) ) ( not ( = ?auto_160378 ?auto_160379 ) ) ( not ( = ?auto_160375 ?auto_160380 ) ) ( not ( = ?auto_160375 ?auto_160381 ) ) ( not ( = ?auto_160376 ?auto_160380 ) ) ( not ( = ?auto_160376 ?auto_160381 ) ) ( not ( = ?auto_160377 ?auto_160380 ) ) ( not ( = ?auto_160377 ?auto_160381 ) ) ( not ( = ?auto_160378 ?auto_160380 ) ) ( not ( = ?auto_160378 ?auto_160381 ) ) ( not ( = ?auto_160379 ?auto_160380 ) ) ( not ( = ?auto_160379 ?auto_160381 ) ) ( not ( = ?auto_160380 ?auto_160381 ) ) ( ON ?auto_160380 ?auto_160379 ) ( not ( = ?auto_160382 ?auto_160381 ) ) ( not ( = ?auto_160375 ?auto_160382 ) ) ( not ( = ?auto_160376 ?auto_160382 ) ) ( not ( = ?auto_160377 ?auto_160382 ) ) ( not ( = ?auto_160378 ?auto_160382 ) ) ( not ( = ?auto_160379 ?auto_160382 ) ) ( not ( = ?auto_160380 ?auto_160382 ) ) ( ON ?auto_160381 ?auto_160380 ) ( ON ?auto_160382 ?auto_160381 ) ( CLEAR ?auto_160382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160375 ?auto_160376 ?auto_160377 ?auto_160378 ?auto_160379 ?auto_160380 ?auto_160381 )
      ( MAKE-4PILE ?auto_160375 ?auto_160376 ?auto_160377 ?auto_160378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160383 - BLOCK
      ?auto_160384 - BLOCK
      ?auto_160385 - BLOCK
      ?auto_160386 - BLOCK
    )
    :vars
    (
      ?auto_160389 - BLOCK
      ?auto_160390 - BLOCK
      ?auto_160387 - BLOCK
      ?auto_160388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160389 ?auto_160386 ) ( ON-TABLE ?auto_160383 ) ( ON ?auto_160384 ?auto_160383 ) ( ON ?auto_160385 ?auto_160384 ) ( ON ?auto_160386 ?auto_160385 ) ( not ( = ?auto_160383 ?auto_160384 ) ) ( not ( = ?auto_160383 ?auto_160385 ) ) ( not ( = ?auto_160383 ?auto_160386 ) ) ( not ( = ?auto_160383 ?auto_160389 ) ) ( not ( = ?auto_160384 ?auto_160385 ) ) ( not ( = ?auto_160384 ?auto_160386 ) ) ( not ( = ?auto_160384 ?auto_160389 ) ) ( not ( = ?auto_160385 ?auto_160386 ) ) ( not ( = ?auto_160385 ?auto_160389 ) ) ( not ( = ?auto_160386 ?auto_160389 ) ) ( not ( = ?auto_160383 ?auto_160390 ) ) ( not ( = ?auto_160383 ?auto_160387 ) ) ( not ( = ?auto_160384 ?auto_160390 ) ) ( not ( = ?auto_160384 ?auto_160387 ) ) ( not ( = ?auto_160385 ?auto_160390 ) ) ( not ( = ?auto_160385 ?auto_160387 ) ) ( not ( = ?auto_160386 ?auto_160390 ) ) ( not ( = ?auto_160386 ?auto_160387 ) ) ( not ( = ?auto_160389 ?auto_160390 ) ) ( not ( = ?auto_160389 ?auto_160387 ) ) ( not ( = ?auto_160390 ?auto_160387 ) ) ( ON ?auto_160390 ?auto_160389 ) ( not ( = ?auto_160388 ?auto_160387 ) ) ( not ( = ?auto_160383 ?auto_160388 ) ) ( not ( = ?auto_160384 ?auto_160388 ) ) ( not ( = ?auto_160385 ?auto_160388 ) ) ( not ( = ?auto_160386 ?auto_160388 ) ) ( not ( = ?auto_160389 ?auto_160388 ) ) ( not ( = ?auto_160390 ?auto_160388 ) ) ( ON ?auto_160387 ?auto_160390 ) ( HOLDING ?auto_160388 ) ( CLEAR ?auto_160387 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160383 ?auto_160384 ?auto_160385 ?auto_160386 ?auto_160389 ?auto_160390 ?auto_160387 ?auto_160388 )
      ( MAKE-4PILE ?auto_160383 ?auto_160384 ?auto_160385 ?auto_160386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160391 - BLOCK
      ?auto_160392 - BLOCK
      ?auto_160393 - BLOCK
      ?auto_160394 - BLOCK
    )
    :vars
    (
      ?auto_160398 - BLOCK
      ?auto_160395 - BLOCK
      ?auto_160396 - BLOCK
      ?auto_160397 - BLOCK
      ?auto_160399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160398 ?auto_160394 ) ( ON-TABLE ?auto_160391 ) ( ON ?auto_160392 ?auto_160391 ) ( ON ?auto_160393 ?auto_160392 ) ( ON ?auto_160394 ?auto_160393 ) ( not ( = ?auto_160391 ?auto_160392 ) ) ( not ( = ?auto_160391 ?auto_160393 ) ) ( not ( = ?auto_160391 ?auto_160394 ) ) ( not ( = ?auto_160391 ?auto_160398 ) ) ( not ( = ?auto_160392 ?auto_160393 ) ) ( not ( = ?auto_160392 ?auto_160394 ) ) ( not ( = ?auto_160392 ?auto_160398 ) ) ( not ( = ?auto_160393 ?auto_160394 ) ) ( not ( = ?auto_160393 ?auto_160398 ) ) ( not ( = ?auto_160394 ?auto_160398 ) ) ( not ( = ?auto_160391 ?auto_160395 ) ) ( not ( = ?auto_160391 ?auto_160396 ) ) ( not ( = ?auto_160392 ?auto_160395 ) ) ( not ( = ?auto_160392 ?auto_160396 ) ) ( not ( = ?auto_160393 ?auto_160395 ) ) ( not ( = ?auto_160393 ?auto_160396 ) ) ( not ( = ?auto_160394 ?auto_160395 ) ) ( not ( = ?auto_160394 ?auto_160396 ) ) ( not ( = ?auto_160398 ?auto_160395 ) ) ( not ( = ?auto_160398 ?auto_160396 ) ) ( not ( = ?auto_160395 ?auto_160396 ) ) ( ON ?auto_160395 ?auto_160398 ) ( not ( = ?auto_160397 ?auto_160396 ) ) ( not ( = ?auto_160391 ?auto_160397 ) ) ( not ( = ?auto_160392 ?auto_160397 ) ) ( not ( = ?auto_160393 ?auto_160397 ) ) ( not ( = ?auto_160394 ?auto_160397 ) ) ( not ( = ?auto_160398 ?auto_160397 ) ) ( not ( = ?auto_160395 ?auto_160397 ) ) ( ON ?auto_160396 ?auto_160395 ) ( CLEAR ?auto_160396 ) ( ON ?auto_160397 ?auto_160399 ) ( CLEAR ?auto_160397 ) ( HAND-EMPTY ) ( not ( = ?auto_160391 ?auto_160399 ) ) ( not ( = ?auto_160392 ?auto_160399 ) ) ( not ( = ?auto_160393 ?auto_160399 ) ) ( not ( = ?auto_160394 ?auto_160399 ) ) ( not ( = ?auto_160398 ?auto_160399 ) ) ( not ( = ?auto_160395 ?auto_160399 ) ) ( not ( = ?auto_160396 ?auto_160399 ) ) ( not ( = ?auto_160397 ?auto_160399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160397 ?auto_160399 )
      ( MAKE-4PILE ?auto_160391 ?auto_160392 ?auto_160393 ?auto_160394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160400 - BLOCK
      ?auto_160401 - BLOCK
      ?auto_160402 - BLOCK
      ?auto_160403 - BLOCK
    )
    :vars
    (
      ?auto_160408 - BLOCK
      ?auto_160407 - BLOCK
      ?auto_160405 - BLOCK
      ?auto_160404 - BLOCK
      ?auto_160406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160408 ?auto_160403 ) ( ON-TABLE ?auto_160400 ) ( ON ?auto_160401 ?auto_160400 ) ( ON ?auto_160402 ?auto_160401 ) ( ON ?auto_160403 ?auto_160402 ) ( not ( = ?auto_160400 ?auto_160401 ) ) ( not ( = ?auto_160400 ?auto_160402 ) ) ( not ( = ?auto_160400 ?auto_160403 ) ) ( not ( = ?auto_160400 ?auto_160408 ) ) ( not ( = ?auto_160401 ?auto_160402 ) ) ( not ( = ?auto_160401 ?auto_160403 ) ) ( not ( = ?auto_160401 ?auto_160408 ) ) ( not ( = ?auto_160402 ?auto_160403 ) ) ( not ( = ?auto_160402 ?auto_160408 ) ) ( not ( = ?auto_160403 ?auto_160408 ) ) ( not ( = ?auto_160400 ?auto_160407 ) ) ( not ( = ?auto_160400 ?auto_160405 ) ) ( not ( = ?auto_160401 ?auto_160407 ) ) ( not ( = ?auto_160401 ?auto_160405 ) ) ( not ( = ?auto_160402 ?auto_160407 ) ) ( not ( = ?auto_160402 ?auto_160405 ) ) ( not ( = ?auto_160403 ?auto_160407 ) ) ( not ( = ?auto_160403 ?auto_160405 ) ) ( not ( = ?auto_160408 ?auto_160407 ) ) ( not ( = ?auto_160408 ?auto_160405 ) ) ( not ( = ?auto_160407 ?auto_160405 ) ) ( ON ?auto_160407 ?auto_160408 ) ( not ( = ?auto_160404 ?auto_160405 ) ) ( not ( = ?auto_160400 ?auto_160404 ) ) ( not ( = ?auto_160401 ?auto_160404 ) ) ( not ( = ?auto_160402 ?auto_160404 ) ) ( not ( = ?auto_160403 ?auto_160404 ) ) ( not ( = ?auto_160408 ?auto_160404 ) ) ( not ( = ?auto_160407 ?auto_160404 ) ) ( ON ?auto_160404 ?auto_160406 ) ( CLEAR ?auto_160404 ) ( not ( = ?auto_160400 ?auto_160406 ) ) ( not ( = ?auto_160401 ?auto_160406 ) ) ( not ( = ?auto_160402 ?auto_160406 ) ) ( not ( = ?auto_160403 ?auto_160406 ) ) ( not ( = ?auto_160408 ?auto_160406 ) ) ( not ( = ?auto_160407 ?auto_160406 ) ) ( not ( = ?auto_160405 ?auto_160406 ) ) ( not ( = ?auto_160404 ?auto_160406 ) ) ( HOLDING ?auto_160405 ) ( CLEAR ?auto_160407 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160400 ?auto_160401 ?auto_160402 ?auto_160403 ?auto_160408 ?auto_160407 ?auto_160405 )
      ( MAKE-4PILE ?auto_160400 ?auto_160401 ?auto_160402 ?auto_160403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160409 - BLOCK
      ?auto_160410 - BLOCK
      ?auto_160411 - BLOCK
      ?auto_160412 - BLOCK
    )
    :vars
    (
      ?auto_160417 - BLOCK
      ?auto_160416 - BLOCK
      ?auto_160413 - BLOCK
      ?auto_160415 - BLOCK
      ?auto_160414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160417 ?auto_160412 ) ( ON-TABLE ?auto_160409 ) ( ON ?auto_160410 ?auto_160409 ) ( ON ?auto_160411 ?auto_160410 ) ( ON ?auto_160412 ?auto_160411 ) ( not ( = ?auto_160409 ?auto_160410 ) ) ( not ( = ?auto_160409 ?auto_160411 ) ) ( not ( = ?auto_160409 ?auto_160412 ) ) ( not ( = ?auto_160409 ?auto_160417 ) ) ( not ( = ?auto_160410 ?auto_160411 ) ) ( not ( = ?auto_160410 ?auto_160412 ) ) ( not ( = ?auto_160410 ?auto_160417 ) ) ( not ( = ?auto_160411 ?auto_160412 ) ) ( not ( = ?auto_160411 ?auto_160417 ) ) ( not ( = ?auto_160412 ?auto_160417 ) ) ( not ( = ?auto_160409 ?auto_160416 ) ) ( not ( = ?auto_160409 ?auto_160413 ) ) ( not ( = ?auto_160410 ?auto_160416 ) ) ( not ( = ?auto_160410 ?auto_160413 ) ) ( not ( = ?auto_160411 ?auto_160416 ) ) ( not ( = ?auto_160411 ?auto_160413 ) ) ( not ( = ?auto_160412 ?auto_160416 ) ) ( not ( = ?auto_160412 ?auto_160413 ) ) ( not ( = ?auto_160417 ?auto_160416 ) ) ( not ( = ?auto_160417 ?auto_160413 ) ) ( not ( = ?auto_160416 ?auto_160413 ) ) ( ON ?auto_160416 ?auto_160417 ) ( not ( = ?auto_160415 ?auto_160413 ) ) ( not ( = ?auto_160409 ?auto_160415 ) ) ( not ( = ?auto_160410 ?auto_160415 ) ) ( not ( = ?auto_160411 ?auto_160415 ) ) ( not ( = ?auto_160412 ?auto_160415 ) ) ( not ( = ?auto_160417 ?auto_160415 ) ) ( not ( = ?auto_160416 ?auto_160415 ) ) ( ON ?auto_160415 ?auto_160414 ) ( not ( = ?auto_160409 ?auto_160414 ) ) ( not ( = ?auto_160410 ?auto_160414 ) ) ( not ( = ?auto_160411 ?auto_160414 ) ) ( not ( = ?auto_160412 ?auto_160414 ) ) ( not ( = ?auto_160417 ?auto_160414 ) ) ( not ( = ?auto_160416 ?auto_160414 ) ) ( not ( = ?auto_160413 ?auto_160414 ) ) ( not ( = ?auto_160415 ?auto_160414 ) ) ( CLEAR ?auto_160416 ) ( ON ?auto_160413 ?auto_160415 ) ( CLEAR ?auto_160413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160414 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160414 ?auto_160415 )
      ( MAKE-4PILE ?auto_160409 ?auto_160410 ?auto_160411 ?auto_160412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160418 - BLOCK
      ?auto_160419 - BLOCK
      ?auto_160420 - BLOCK
      ?auto_160421 - BLOCK
    )
    :vars
    (
      ?auto_160423 - BLOCK
      ?auto_160422 - BLOCK
      ?auto_160424 - BLOCK
      ?auto_160426 - BLOCK
      ?auto_160425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160423 ?auto_160421 ) ( ON-TABLE ?auto_160418 ) ( ON ?auto_160419 ?auto_160418 ) ( ON ?auto_160420 ?auto_160419 ) ( ON ?auto_160421 ?auto_160420 ) ( not ( = ?auto_160418 ?auto_160419 ) ) ( not ( = ?auto_160418 ?auto_160420 ) ) ( not ( = ?auto_160418 ?auto_160421 ) ) ( not ( = ?auto_160418 ?auto_160423 ) ) ( not ( = ?auto_160419 ?auto_160420 ) ) ( not ( = ?auto_160419 ?auto_160421 ) ) ( not ( = ?auto_160419 ?auto_160423 ) ) ( not ( = ?auto_160420 ?auto_160421 ) ) ( not ( = ?auto_160420 ?auto_160423 ) ) ( not ( = ?auto_160421 ?auto_160423 ) ) ( not ( = ?auto_160418 ?auto_160422 ) ) ( not ( = ?auto_160418 ?auto_160424 ) ) ( not ( = ?auto_160419 ?auto_160422 ) ) ( not ( = ?auto_160419 ?auto_160424 ) ) ( not ( = ?auto_160420 ?auto_160422 ) ) ( not ( = ?auto_160420 ?auto_160424 ) ) ( not ( = ?auto_160421 ?auto_160422 ) ) ( not ( = ?auto_160421 ?auto_160424 ) ) ( not ( = ?auto_160423 ?auto_160422 ) ) ( not ( = ?auto_160423 ?auto_160424 ) ) ( not ( = ?auto_160422 ?auto_160424 ) ) ( not ( = ?auto_160426 ?auto_160424 ) ) ( not ( = ?auto_160418 ?auto_160426 ) ) ( not ( = ?auto_160419 ?auto_160426 ) ) ( not ( = ?auto_160420 ?auto_160426 ) ) ( not ( = ?auto_160421 ?auto_160426 ) ) ( not ( = ?auto_160423 ?auto_160426 ) ) ( not ( = ?auto_160422 ?auto_160426 ) ) ( ON ?auto_160426 ?auto_160425 ) ( not ( = ?auto_160418 ?auto_160425 ) ) ( not ( = ?auto_160419 ?auto_160425 ) ) ( not ( = ?auto_160420 ?auto_160425 ) ) ( not ( = ?auto_160421 ?auto_160425 ) ) ( not ( = ?auto_160423 ?auto_160425 ) ) ( not ( = ?auto_160422 ?auto_160425 ) ) ( not ( = ?auto_160424 ?auto_160425 ) ) ( not ( = ?auto_160426 ?auto_160425 ) ) ( ON ?auto_160424 ?auto_160426 ) ( CLEAR ?auto_160424 ) ( ON-TABLE ?auto_160425 ) ( HOLDING ?auto_160422 ) ( CLEAR ?auto_160423 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160418 ?auto_160419 ?auto_160420 ?auto_160421 ?auto_160423 ?auto_160422 )
      ( MAKE-4PILE ?auto_160418 ?auto_160419 ?auto_160420 ?auto_160421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160427 - BLOCK
      ?auto_160428 - BLOCK
      ?auto_160429 - BLOCK
      ?auto_160430 - BLOCK
    )
    :vars
    (
      ?auto_160434 - BLOCK
      ?auto_160431 - BLOCK
      ?auto_160433 - BLOCK
      ?auto_160435 - BLOCK
      ?auto_160432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160434 ?auto_160430 ) ( ON-TABLE ?auto_160427 ) ( ON ?auto_160428 ?auto_160427 ) ( ON ?auto_160429 ?auto_160428 ) ( ON ?auto_160430 ?auto_160429 ) ( not ( = ?auto_160427 ?auto_160428 ) ) ( not ( = ?auto_160427 ?auto_160429 ) ) ( not ( = ?auto_160427 ?auto_160430 ) ) ( not ( = ?auto_160427 ?auto_160434 ) ) ( not ( = ?auto_160428 ?auto_160429 ) ) ( not ( = ?auto_160428 ?auto_160430 ) ) ( not ( = ?auto_160428 ?auto_160434 ) ) ( not ( = ?auto_160429 ?auto_160430 ) ) ( not ( = ?auto_160429 ?auto_160434 ) ) ( not ( = ?auto_160430 ?auto_160434 ) ) ( not ( = ?auto_160427 ?auto_160431 ) ) ( not ( = ?auto_160427 ?auto_160433 ) ) ( not ( = ?auto_160428 ?auto_160431 ) ) ( not ( = ?auto_160428 ?auto_160433 ) ) ( not ( = ?auto_160429 ?auto_160431 ) ) ( not ( = ?auto_160429 ?auto_160433 ) ) ( not ( = ?auto_160430 ?auto_160431 ) ) ( not ( = ?auto_160430 ?auto_160433 ) ) ( not ( = ?auto_160434 ?auto_160431 ) ) ( not ( = ?auto_160434 ?auto_160433 ) ) ( not ( = ?auto_160431 ?auto_160433 ) ) ( not ( = ?auto_160435 ?auto_160433 ) ) ( not ( = ?auto_160427 ?auto_160435 ) ) ( not ( = ?auto_160428 ?auto_160435 ) ) ( not ( = ?auto_160429 ?auto_160435 ) ) ( not ( = ?auto_160430 ?auto_160435 ) ) ( not ( = ?auto_160434 ?auto_160435 ) ) ( not ( = ?auto_160431 ?auto_160435 ) ) ( ON ?auto_160435 ?auto_160432 ) ( not ( = ?auto_160427 ?auto_160432 ) ) ( not ( = ?auto_160428 ?auto_160432 ) ) ( not ( = ?auto_160429 ?auto_160432 ) ) ( not ( = ?auto_160430 ?auto_160432 ) ) ( not ( = ?auto_160434 ?auto_160432 ) ) ( not ( = ?auto_160431 ?auto_160432 ) ) ( not ( = ?auto_160433 ?auto_160432 ) ) ( not ( = ?auto_160435 ?auto_160432 ) ) ( ON ?auto_160433 ?auto_160435 ) ( ON-TABLE ?auto_160432 ) ( CLEAR ?auto_160434 ) ( ON ?auto_160431 ?auto_160433 ) ( CLEAR ?auto_160431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160432 ?auto_160435 ?auto_160433 )
      ( MAKE-4PILE ?auto_160427 ?auto_160428 ?auto_160429 ?auto_160430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160454 - BLOCK
      ?auto_160455 - BLOCK
      ?auto_160456 - BLOCK
      ?auto_160457 - BLOCK
    )
    :vars
    (
      ?auto_160460 - BLOCK
      ?auto_160461 - BLOCK
      ?auto_160459 - BLOCK
      ?auto_160458 - BLOCK
      ?auto_160462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160454 ) ( ON ?auto_160455 ?auto_160454 ) ( ON ?auto_160456 ?auto_160455 ) ( not ( = ?auto_160454 ?auto_160455 ) ) ( not ( = ?auto_160454 ?auto_160456 ) ) ( not ( = ?auto_160454 ?auto_160457 ) ) ( not ( = ?auto_160454 ?auto_160460 ) ) ( not ( = ?auto_160455 ?auto_160456 ) ) ( not ( = ?auto_160455 ?auto_160457 ) ) ( not ( = ?auto_160455 ?auto_160460 ) ) ( not ( = ?auto_160456 ?auto_160457 ) ) ( not ( = ?auto_160456 ?auto_160460 ) ) ( not ( = ?auto_160457 ?auto_160460 ) ) ( not ( = ?auto_160454 ?auto_160461 ) ) ( not ( = ?auto_160454 ?auto_160459 ) ) ( not ( = ?auto_160455 ?auto_160461 ) ) ( not ( = ?auto_160455 ?auto_160459 ) ) ( not ( = ?auto_160456 ?auto_160461 ) ) ( not ( = ?auto_160456 ?auto_160459 ) ) ( not ( = ?auto_160457 ?auto_160461 ) ) ( not ( = ?auto_160457 ?auto_160459 ) ) ( not ( = ?auto_160460 ?auto_160461 ) ) ( not ( = ?auto_160460 ?auto_160459 ) ) ( not ( = ?auto_160461 ?auto_160459 ) ) ( not ( = ?auto_160458 ?auto_160459 ) ) ( not ( = ?auto_160454 ?auto_160458 ) ) ( not ( = ?auto_160455 ?auto_160458 ) ) ( not ( = ?auto_160456 ?auto_160458 ) ) ( not ( = ?auto_160457 ?auto_160458 ) ) ( not ( = ?auto_160460 ?auto_160458 ) ) ( not ( = ?auto_160461 ?auto_160458 ) ) ( ON ?auto_160458 ?auto_160462 ) ( not ( = ?auto_160454 ?auto_160462 ) ) ( not ( = ?auto_160455 ?auto_160462 ) ) ( not ( = ?auto_160456 ?auto_160462 ) ) ( not ( = ?auto_160457 ?auto_160462 ) ) ( not ( = ?auto_160460 ?auto_160462 ) ) ( not ( = ?auto_160461 ?auto_160462 ) ) ( not ( = ?auto_160459 ?auto_160462 ) ) ( not ( = ?auto_160458 ?auto_160462 ) ) ( ON ?auto_160459 ?auto_160458 ) ( ON-TABLE ?auto_160462 ) ( ON ?auto_160461 ?auto_160459 ) ( ON ?auto_160460 ?auto_160461 ) ( CLEAR ?auto_160460 ) ( HOLDING ?auto_160457 ) ( CLEAR ?auto_160456 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160454 ?auto_160455 ?auto_160456 ?auto_160457 ?auto_160460 )
      ( MAKE-4PILE ?auto_160454 ?auto_160455 ?auto_160456 ?auto_160457 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160463 - BLOCK
      ?auto_160464 - BLOCK
      ?auto_160465 - BLOCK
      ?auto_160466 - BLOCK
    )
    :vars
    (
      ?auto_160467 - BLOCK
      ?auto_160468 - BLOCK
      ?auto_160469 - BLOCK
      ?auto_160471 - BLOCK
      ?auto_160470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160463 ) ( ON ?auto_160464 ?auto_160463 ) ( ON ?auto_160465 ?auto_160464 ) ( not ( = ?auto_160463 ?auto_160464 ) ) ( not ( = ?auto_160463 ?auto_160465 ) ) ( not ( = ?auto_160463 ?auto_160466 ) ) ( not ( = ?auto_160463 ?auto_160467 ) ) ( not ( = ?auto_160464 ?auto_160465 ) ) ( not ( = ?auto_160464 ?auto_160466 ) ) ( not ( = ?auto_160464 ?auto_160467 ) ) ( not ( = ?auto_160465 ?auto_160466 ) ) ( not ( = ?auto_160465 ?auto_160467 ) ) ( not ( = ?auto_160466 ?auto_160467 ) ) ( not ( = ?auto_160463 ?auto_160468 ) ) ( not ( = ?auto_160463 ?auto_160469 ) ) ( not ( = ?auto_160464 ?auto_160468 ) ) ( not ( = ?auto_160464 ?auto_160469 ) ) ( not ( = ?auto_160465 ?auto_160468 ) ) ( not ( = ?auto_160465 ?auto_160469 ) ) ( not ( = ?auto_160466 ?auto_160468 ) ) ( not ( = ?auto_160466 ?auto_160469 ) ) ( not ( = ?auto_160467 ?auto_160468 ) ) ( not ( = ?auto_160467 ?auto_160469 ) ) ( not ( = ?auto_160468 ?auto_160469 ) ) ( not ( = ?auto_160471 ?auto_160469 ) ) ( not ( = ?auto_160463 ?auto_160471 ) ) ( not ( = ?auto_160464 ?auto_160471 ) ) ( not ( = ?auto_160465 ?auto_160471 ) ) ( not ( = ?auto_160466 ?auto_160471 ) ) ( not ( = ?auto_160467 ?auto_160471 ) ) ( not ( = ?auto_160468 ?auto_160471 ) ) ( ON ?auto_160471 ?auto_160470 ) ( not ( = ?auto_160463 ?auto_160470 ) ) ( not ( = ?auto_160464 ?auto_160470 ) ) ( not ( = ?auto_160465 ?auto_160470 ) ) ( not ( = ?auto_160466 ?auto_160470 ) ) ( not ( = ?auto_160467 ?auto_160470 ) ) ( not ( = ?auto_160468 ?auto_160470 ) ) ( not ( = ?auto_160469 ?auto_160470 ) ) ( not ( = ?auto_160471 ?auto_160470 ) ) ( ON ?auto_160469 ?auto_160471 ) ( ON-TABLE ?auto_160470 ) ( ON ?auto_160468 ?auto_160469 ) ( ON ?auto_160467 ?auto_160468 ) ( CLEAR ?auto_160465 ) ( ON ?auto_160466 ?auto_160467 ) ( CLEAR ?auto_160466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160470 ?auto_160471 ?auto_160469 ?auto_160468 ?auto_160467 )
      ( MAKE-4PILE ?auto_160463 ?auto_160464 ?auto_160465 ?auto_160466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160472 - BLOCK
      ?auto_160473 - BLOCK
      ?auto_160474 - BLOCK
      ?auto_160475 - BLOCK
    )
    :vars
    (
      ?auto_160480 - BLOCK
      ?auto_160478 - BLOCK
      ?auto_160477 - BLOCK
      ?auto_160476 - BLOCK
      ?auto_160479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160472 ) ( ON ?auto_160473 ?auto_160472 ) ( not ( = ?auto_160472 ?auto_160473 ) ) ( not ( = ?auto_160472 ?auto_160474 ) ) ( not ( = ?auto_160472 ?auto_160475 ) ) ( not ( = ?auto_160472 ?auto_160480 ) ) ( not ( = ?auto_160473 ?auto_160474 ) ) ( not ( = ?auto_160473 ?auto_160475 ) ) ( not ( = ?auto_160473 ?auto_160480 ) ) ( not ( = ?auto_160474 ?auto_160475 ) ) ( not ( = ?auto_160474 ?auto_160480 ) ) ( not ( = ?auto_160475 ?auto_160480 ) ) ( not ( = ?auto_160472 ?auto_160478 ) ) ( not ( = ?auto_160472 ?auto_160477 ) ) ( not ( = ?auto_160473 ?auto_160478 ) ) ( not ( = ?auto_160473 ?auto_160477 ) ) ( not ( = ?auto_160474 ?auto_160478 ) ) ( not ( = ?auto_160474 ?auto_160477 ) ) ( not ( = ?auto_160475 ?auto_160478 ) ) ( not ( = ?auto_160475 ?auto_160477 ) ) ( not ( = ?auto_160480 ?auto_160478 ) ) ( not ( = ?auto_160480 ?auto_160477 ) ) ( not ( = ?auto_160478 ?auto_160477 ) ) ( not ( = ?auto_160476 ?auto_160477 ) ) ( not ( = ?auto_160472 ?auto_160476 ) ) ( not ( = ?auto_160473 ?auto_160476 ) ) ( not ( = ?auto_160474 ?auto_160476 ) ) ( not ( = ?auto_160475 ?auto_160476 ) ) ( not ( = ?auto_160480 ?auto_160476 ) ) ( not ( = ?auto_160478 ?auto_160476 ) ) ( ON ?auto_160476 ?auto_160479 ) ( not ( = ?auto_160472 ?auto_160479 ) ) ( not ( = ?auto_160473 ?auto_160479 ) ) ( not ( = ?auto_160474 ?auto_160479 ) ) ( not ( = ?auto_160475 ?auto_160479 ) ) ( not ( = ?auto_160480 ?auto_160479 ) ) ( not ( = ?auto_160478 ?auto_160479 ) ) ( not ( = ?auto_160477 ?auto_160479 ) ) ( not ( = ?auto_160476 ?auto_160479 ) ) ( ON ?auto_160477 ?auto_160476 ) ( ON-TABLE ?auto_160479 ) ( ON ?auto_160478 ?auto_160477 ) ( ON ?auto_160480 ?auto_160478 ) ( ON ?auto_160475 ?auto_160480 ) ( CLEAR ?auto_160475 ) ( HOLDING ?auto_160474 ) ( CLEAR ?auto_160473 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160472 ?auto_160473 ?auto_160474 )
      ( MAKE-4PILE ?auto_160472 ?auto_160473 ?auto_160474 ?auto_160475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160481 - BLOCK
      ?auto_160482 - BLOCK
      ?auto_160483 - BLOCK
      ?auto_160484 - BLOCK
    )
    :vars
    (
      ?auto_160486 - BLOCK
      ?auto_160488 - BLOCK
      ?auto_160487 - BLOCK
      ?auto_160485 - BLOCK
      ?auto_160489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160481 ) ( ON ?auto_160482 ?auto_160481 ) ( not ( = ?auto_160481 ?auto_160482 ) ) ( not ( = ?auto_160481 ?auto_160483 ) ) ( not ( = ?auto_160481 ?auto_160484 ) ) ( not ( = ?auto_160481 ?auto_160486 ) ) ( not ( = ?auto_160482 ?auto_160483 ) ) ( not ( = ?auto_160482 ?auto_160484 ) ) ( not ( = ?auto_160482 ?auto_160486 ) ) ( not ( = ?auto_160483 ?auto_160484 ) ) ( not ( = ?auto_160483 ?auto_160486 ) ) ( not ( = ?auto_160484 ?auto_160486 ) ) ( not ( = ?auto_160481 ?auto_160488 ) ) ( not ( = ?auto_160481 ?auto_160487 ) ) ( not ( = ?auto_160482 ?auto_160488 ) ) ( not ( = ?auto_160482 ?auto_160487 ) ) ( not ( = ?auto_160483 ?auto_160488 ) ) ( not ( = ?auto_160483 ?auto_160487 ) ) ( not ( = ?auto_160484 ?auto_160488 ) ) ( not ( = ?auto_160484 ?auto_160487 ) ) ( not ( = ?auto_160486 ?auto_160488 ) ) ( not ( = ?auto_160486 ?auto_160487 ) ) ( not ( = ?auto_160488 ?auto_160487 ) ) ( not ( = ?auto_160485 ?auto_160487 ) ) ( not ( = ?auto_160481 ?auto_160485 ) ) ( not ( = ?auto_160482 ?auto_160485 ) ) ( not ( = ?auto_160483 ?auto_160485 ) ) ( not ( = ?auto_160484 ?auto_160485 ) ) ( not ( = ?auto_160486 ?auto_160485 ) ) ( not ( = ?auto_160488 ?auto_160485 ) ) ( ON ?auto_160485 ?auto_160489 ) ( not ( = ?auto_160481 ?auto_160489 ) ) ( not ( = ?auto_160482 ?auto_160489 ) ) ( not ( = ?auto_160483 ?auto_160489 ) ) ( not ( = ?auto_160484 ?auto_160489 ) ) ( not ( = ?auto_160486 ?auto_160489 ) ) ( not ( = ?auto_160488 ?auto_160489 ) ) ( not ( = ?auto_160487 ?auto_160489 ) ) ( not ( = ?auto_160485 ?auto_160489 ) ) ( ON ?auto_160487 ?auto_160485 ) ( ON-TABLE ?auto_160489 ) ( ON ?auto_160488 ?auto_160487 ) ( ON ?auto_160486 ?auto_160488 ) ( ON ?auto_160484 ?auto_160486 ) ( CLEAR ?auto_160482 ) ( ON ?auto_160483 ?auto_160484 ) ( CLEAR ?auto_160483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160489 ?auto_160485 ?auto_160487 ?auto_160488 ?auto_160486 ?auto_160484 )
      ( MAKE-4PILE ?auto_160481 ?auto_160482 ?auto_160483 ?auto_160484 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160490 - BLOCK
      ?auto_160491 - BLOCK
      ?auto_160492 - BLOCK
      ?auto_160493 - BLOCK
    )
    :vars
    (
      ?auto_160494 - BLOCK
      ?auto_160495 - BLOCK
      ?auto_160496 - BLOCK
      ?auto_160497 - BLOCK
      ?auto_160498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160490 ) ( not ( = ?auto_160490 ?auto_160491 ) ) ( not ( = ?auto_160490 ?auto_160492 ) ) ( not ( = ?auto_160490 ?auto_160493 ) ) ( not ( = ?auto_160490 ?auto_160494 ) ) ( not ( = ?auto_160491 ?auto_160492 ) ) ( not ( = ?auto_160491 ?auto_160493 ) ) ( not ( = ?auto_160491 ?auto_160494 ) ) ( not ( = ?auto_160492 ?auto_160493 ) ) ( not ( = ?auto_160492 ?auto_160494 ) ) ( not ( = ?auto_160493 ?auto_160494 ) ) ( not ( = ?auto_160490 ?auto_160495 ) ) ( not ( = ?auto_160490 ?auto_160496 ) ) ( not ( = ?auto_160491 ?auto_160495 ) ) ( not ( = ?auto_160491 ?auto_160496 ) ) ( not ( = ?auto_160492 ?auto_160495 ) ) ( not ( = ?auto_160492 ?auto_160496 ) ) ( not ( = ?auto_160493 ?auto_160495 ) ) ( not ( = ?auto_160493 ?auto_160496 ) ) ( not ( = ?auto_160494 ?auto_160495 ) ) ( not ( = ?auto_160494 ?auto_160496 ) ) ( not ( = ?auto_160495 ?auto_160496 ) ) ( not ( = ?auto_160497 ?auto_160496 ) ) ( not ( = ?auto_160490 ?auto_160497 ) ) ( not ( = ?auto_160491 ?auto_160497 ) ) ( not ( = ?auto_160492 ?auto_160497 ) ) ( not ( = ?auto_160493 ?auto_160497 ) ) ( not ( = ?auto_160494 ?auto_160497 ) ) ( not ( = ?auto_160495 ?auto_160497 ) ) ( ON ?auto_160497 ?auto_160498 ) ( not ( = ?auto_160490 ?auto_160498 ) ) ( not ( = ?auto_160491 ?auto_160498 ) ) ( not ( = ?auto_160492 ?auto_160498 ) ) ( not ( = ?auto_160493 ?auto_160498 ) ) ( not ( = ?auto_160494 ?auto_160498 ) ) ( not ( = ?auto_160495 ?auto_160498 ) ) ( not ( = ?auto_160496 ?auto_160498 ) ) ( not ( = ?auto_160497 ?auto_160498 ) ) ( ON ?auto_160496 ?auto_160497 ) ( ON-TABLE ?auto_160498 ) ( ON ?auto_160495 ?auto_160496 ) ( ON ?auto_160494 ?auto_160495 ) ( ON ?auto_160493 ?auto_160494 ) ( ON ?auto_160492 ?auto_160493 ) ( CLEAR ?auto_160492 ) ( HOLDING ?auto_160491 ) ( CLEAR ?auto_160490 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160490 ?auto_160491 )
      ( MAKE-4PILE ?auto_160490 ?auto_160491 ?auto_160492 ?auto_160493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160499 - BLOCK
      ?auto_160500 - BLOCK
      ?auto_160501 - BLOCK
      ?auto_160502 - BLOCK
    )
    :vars
    (
      ?auto_160504 - BLOCK
      ?auto_160507 - BLOCK
      ?auto_160506 - BLOCK
      ?auto_160505 - BLOCK
      ?auto_160503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160499 ) ( not ( = ?auto_160499 ?auto_160500 ) ) ( not ( = ?auto_160499 ?auto_160501 ) ) ( not ( = ?auto_160499 ?auto_160502 ) ) ( not ( = ?auto_160499 ?auto_160504 ) ) ( not ( = ?auto_160500 ?auto_160501 ) ) ( not ( = ?auto_160500 ?auto_160502 ) ) ( not ( = ?auto_160500 ?auto_160504 ) ) ( not ( = ?auto_160501 ?auto_160502 ) ) ( not ( = ?auto_160501 ?auto_160504 ) ) ( not ( = ?auto_160502 ?auto_160504 ) ) ( not ( = ?auto_160499 ?auto_160507 ) ) ( not ( = ?auto_160499 ?auto_160506 ) ) ( not ( = ?auto_160500 ?auto_160507 ) ) ( not ( = ?auto_160500 ?auto_160506 ) ) ( not ( = ?auto_160501 ?auto_160507 ) ) ( not ( = ?auto_160501 ?auto_160506 ) ) ( not ( = ?auto_160502 ?auto_160507 ) ) ( not ( = ?auto_160502 ?auto_160506 ) ) ( not ( = ?auto_160504 ?auto_160507 ) ) ( not ( = ?auto_160504 ?auto_160506 ) ) ( not ( = ?auto_160507 ?auto_160506 ) ) ( not ( = ?auto_160505 ?auto_160506 ) ) ( not ( = ?auto_160499 ?auto_160505 ) ) ( not ( = ?auto_160500 ?auto_160505 ) ) ( not ( = ?auto_160501 ?auto_160505 ) ) ( not ( = ?auto_160502 ?auto_160505 ) ) ( not ( = ?auto_160504 ?auto_160505 ) ) ( not ( = ?auto_160507 ?auto_160505 ) ) ( ON ?auto_160505 ?auto_160503 ) ( not ( = ?auto_160499 ?auto_160503 ) ) ( not ( = ?auto_160500 ?auto_160503 ) ) ( not ( = ?auto_160501 ?auto_160503 ) ) ( not ( = ?auto_160502 ?auto_160503 ) ) ( not ( = ?auto_160504 ?auto_160503 ) ) ( not ( = ?auto_160507 ?auto_160503 ) ) ( not ( = ?auto_160506 ?auto_160503 ) ) ( not ( = ?auto_160505 ?auto_160503 ) ) ( ON ?auto_160506 ?auto_160505 ) ( ON-TABLE ?auto_160503 ) ( ON ?auto_160507 ?auto_160506 ) ( ON ?auto_160504 ?auto_160507 ) ( ON ?auto_160502 ?auto_160504 ) ( ON ?auto_160501 ?auto_160502 ) ( CLEAR ?auto_160499 ) ( ON ?auto_160500 ?auto_160501 ) ( CLEAR ?auto_160500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160503 ?auto_160505 ?auto_160506 ?auto_160507 ?auto_160504 ?auto_160502 ?auto_160501 )
      ( MAKE-4PILE ?auto_160499 ?auto_160500 ?auto_160501 ?auto_160502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160508 - BLOCK
      ?auto_160509 - BLOCK
      ?auto_160510 - BLOCK
      ?auto_160511 - BLOCK
    )
    :vars
    (
      ?auto_160515 - BLOCK
      ?auto_160514 - BLOCK
      ?auto_160513 - BLOCK
      ?auto_160512 - BLOCK
      ?auto_160516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160508 ?auto_160509 ) ) ( not ( = ?auto_160508 ?auto_160510 ) ) ( not ( = ?auto_160508 ?auto_160511 ) ) ( not ( = ?auto_160508 ?auto_160515 ) ) ( not ( = ?auto_160509 ?auto_160510 ) ) ( not ( = ?auto_160509 ?auto_160511 ) ) ( not ( = ?auto_160509 ?auto_160515 ) ) ( not ( = ?auto_160510 ?auto_160511 ) ) ( not ( = ?auto_160510 ?auto_160515 ) ) ( not ( = ?auto_160511 ?auto_160515 ) ) ( not ( = ?auto_160508 ?auto_160514 ) ) ( not ( = ?auto_160508 ?auto_160513 ) ) ( not ( = ?auto_160509 ?auto_160514 ) ) ( not ( = ?auto_160509 ?auto_160513 ) ) ( not ( = ?auto_160510 ?auto_160514 ) ) ( not ( = ?auto_160510 ?auto_160513 ) ) ( not ( = ?auto_160511 ?auto_160514 ) ) ( not ( = ?auto_160511 ?auto_160513 ) ) ( not ( = ?auto_160515 ?auto_160514 ) ) ( not ( = ?auto_160515 ?auto_160513 ) ) ( not ( = ?auto_160514 ?auto_160513 ) ) ( not ( = ?auto_160512 ?auto_160513 ) ) ( not ( = ?auto_160508 ?auto_160512 ) ) ( not ( = ?auto_160509 ?auto_160512 ) ) ( not ( = ?auto_160510 ?auto_160512 ) ) ( not ( = ?auto_160511 ?auto_160512 ) ) ( not ( = ?auto_160515 ?auto_160512 ) ) ( not ( = ?auto_160514 ?auto_160512 ) ) ( ON ?auto_160512 ?auto_160516 ) ( not ( = ?auto_160508 ?auto_160516 ) ) ( not ( = ?auto_160509 ?auto_160516 ) ) ( not ( = ?auto_160510 ?auto_160516 ) ) ( not ( = ?auto_160511 ?auto_160516 ) ) ( not ( = ?auto_160515 ?auto_160516 ) ) ( not ( = ?auto_160514 ?auto_160516 ) ) ( not ( = ?auto_160513 ?auto_160516 ) ) ( not ( = ?auto_160512 ?auto_160516 ) ) ( ON ?auto_160513 ?auto_160512 ) ( ON-TABLE ?auto_160516 ) ( ON ?auto_160514 ?auto_160513 ) ( ON ?auto_160515 ?auto_160514 ) ( ON ?auto_160511 ?auto_160515 ) ( ON ?auto_160510 ?auto_160511 ) ( ON ?auto_160509 ?auto_160510 ) ( CLEAR ?auto_160509 ) ( HOLDING ?auto_160508 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160508 )
      ( MAKE-4PILE ?auto_160508 ?auto_160509 ?auto_160510 ?auto_160511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160517 - BLOCK
      ?auto_160518 - BLOCK
      ?auto_160519 - BLOCK
      ?auto_160520 - BLOCK
    )
    :vars
    (
      ?auto_160522 - BLOCK
      ?auto_160524 - BLOCK
      ?auto_160523 - BLOCK
      ?auto_160525 - BLOCK
      ?auto_160521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160517 ?auto_160518 ) ) ( not ( = ?auto_160517 ?auto_160519 ) ) ( not ( = ?auto_160517 ?auto_160520 ) ) ( not ( = ?auto_160517 ?auto_160522 ) ) ( not ( = ?auto_160518 ?auto_160519 ) ) ( not ( = ?auto_160518 ?auto_160520 ) ) ( not ( = ?auto_160518 ?auto_160522 ) ) ( not ( = ?auto_160519 ?auto_160520 ) ) ( not ( = ?auto_160519 ?auto_160522 ) ) ( not ( = ?auto_160520 ?auto_160522 ) ) ( not ( = ?auto_160517 ?auto_160524 ) ) ( not ( = ?auto_160517 ?auto_160523 ) ) ( not ( = ?auto_160518 ?auto_160524 ) ) ( not ( = ?auto_160518 ?auto_160523 ) ) ( not ( = ?auto_160519 ?auto_160524 ) ) ( not ( = ?auto_160519 ?auto_160523 ) ) ( not ( = ?auto_160520 ?auto_160524 ) ) ( not ( = ?auto_160520 ?auto_160523 ) ) ( not ( = ?auto_160522 ?auto_160524 ) ) ( not ( = ?auto_160522 ?auto_160523 ) ) ( not ( = ?auto_160524 ?auto_160523 ) ) ( not ( = ?auto_160525 ?auto_160523 ) ) ( not ( = ?auto_160517 ?auto_160525 ) ) ( not ( = ?auto_160518 ?auto_160525 ) ) ( not ( = ?auto_160519 ?auto_160525 ) ) ( not ( = ?auto_160520 ?auto_160525 ) ) ( not ( = ?auto_160522 ?auto_160525 ) ) ( not ( = ?auto_160524 ?auto_160525 ) ) ( ON ?auto_160525 ?auto_160521 ) ( not ( = ?auto_160517 ?auto_160521 ) ) ( not ( = ?auto_160518 ?auto_160521 ) ) ( not ( = ?auto_160519 ?auto_160521 ) ) ( not ( = ?auto_160520 ?auto_160521 ) ) ( not ( = ?auto_160522 ?auto_160521 ) ) ( not ( = ?auto_160524 ?auto_160521 ) ) ( not ( = ?auto_160523 ?auto_160521 ) ) ( not ( = ?auto_160525 ?auto_160521 ) ) ( ON ?auto_160523 ?auto_160525 ) ( ON-TABLE ?auto_160521 ) ( ON ?auto_160524 ?auto_160523 ) ( ON ?auto_160522 ?auto_160524 ) ( ON ?auto_160520 ?auto_160522 ) ( ON ?auto_160519 ?auto_160520 ) ( ON ?auto_160518 ?auto_160519 ) ( ON ?auto_160517 ?auto_160518 ) ( CLEAR ?auto_160517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160521 ?auto_160525 ?auto_160523 ?auto_160524 ?auto_160522 ?auto_160520 ?auto_160519 ?auto_160518 )
      ( MAKE-4PILE ?auto_160517 ?auto_160518 ?auto_160519 ?auto_160520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160530 - BLOCK
      ?auto_160531 - BLOCK
      ?auto_160532 - BLOCK
      ?auto_160533 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_160533 ) ( CLEAR ?auto_160532 ) ( ON-TABLE ?auto_160530 ) ( ON ?auto_160531 ?auto_160530 ) ( ON ?auto_160532 ?auto_160531 ) ( not ( = ?auto_160530 ?auto_160531 ) ) ( not ( = ?auto_160530 ?auto_160532 ) ) ( not ( = ?auto_160530 ?auto_160533 ) ) ( not ( = ?auto_160531 ?auto_160532 ) ) ( not ( = ?auto_160531 ?auto_160533 ) ) ( not ( = ?auto_160532 ?auto_160533 ) ) )
    :subtasks
    ( ( !STACK ?auto_160533 ?auto_160532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160534 - BLOCK
      ?auto_160535 - BLOCK
      ?auto_160536 - BLOCK
      ?auto_160537 - BLOCK
    )
    :vars
    (
      ?auto_160538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_160536 ) ( ON-TABLE ?auto_160534 ) ( ON ?auto_160535 ?auto_160534 ) ( ON ?auto_160536 ?auto_160535 ) ( not ( = ?auto_160534 ?auto_160535 ) ) ( not ( = ?auto_160534 ?auto_160536 ) ) ( not ( = ?auto_160534 ?auto_160537 ) ) ( not ( = ?auto_160535 ?auto_160536 ) ) ( not ( = ?auto_160535 ?auto_160537 ) ) ( not ( = ?auto_160536 ?auto_160537 ) ) ( ON ?auto_160537 ?auto_160538 ) ( CLEAR ?auto_160537 ) ( HAND-EMPTY ) ( not ( = ?auto_160534 ?auto_160538 ) ) ( not ( = ?auto_160535 ?auto_160538 ) ) ( not ( = ?auto_160536 ?auto_160538 ) ) ( not ( = ?auto_160537 ?auto_160538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160537 ?auto_160538 )
      ( MAKE-4PILE ?auto_160534 ?auto_160535 ?auto_160536 ?auto_160537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160539 - BLOCK
      ?auto_160540 - BLOCK
      ?auto_160541 - BLOCK
      ?auto_160542 - BLOCK
    )
    :vars
    (
      ?auto_160543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160539 ) ( ON ?auto_160540 ?auto_160539 ) ( not ( = ?auto_160539 ?auto_160540 ) ) ( not ( = ?auto_160539 ?auto_160541 ) ) ( not ( = ?auto_160539 ?auto_160542 ) ) ( not ( = ?auto_160540 ?auto_160541 ) ) ( not ( = ?auto_160540 ?auto_160542 ) ) ( not ( = ?auto_160541 ?auto_160542 ) ) ( ON ?auto_160542 ?auto_160543 ) ( CLEAR ?auto_160542 ) ( not ( = ?auto_160539 ?auto_160543 ) ) ( not ( = ?auto_160540 ?auto_160543 ) ) ( not ( = ?auto_160541 ?auto_160543 ) ) ( not ( = ?auto_160542 ?auto_160543 ) ) ( HOLDING ?auto_160541 ) ( CLEAR ?auto_160540 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160539 ?auto_160540 ?auto_160541 )
      ( MAKE-4PILE ?auto_160539 ?auto_160540 ?auto_160541 ?auto_160542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160544 - BLOCK
      ?auto_160545 - BLOCK
      ?auto_160546 - BLOCK
      ?auto_160547 - BLOCK
    )
    :vars
    (
      ?auto_160548 - BLOCK
      ?auto_160550 - BLOCK
      ?auto_160551 - BLOCK
      ?auto_160549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160544 ) ( ON ?auto_160545 ?auto_160544 ) ( not ( = ?auto_160544 ?auto_160545 ) ) ( not ( = ?auto_160544 ?auto_160546 ) ) ( not ( = ?auto_160544 ?auto_160547 ) ) ( not ( = ?auto_160545 ?auto_160546 ) ) ( not ( = ?auto_160545 ?auto_160547 ) ) ( not ( = ?auto_160546 ?auto_160547 ) ) ( ON ?auto_160547 ?auto_160548 ) ( not ( = ?auto_160544 ?auto_160548 ) ) ( not ( = ?auto_160545 ?auto_160548 ) ) ( not ( = ?auto_160546 ?auto_160548 ) ) ( not ( = ?auto_160547 ?auto_160548 ) ) ( CLEAR ?auto_160545 ) ( ON ?auto_160546 ?auto_160547 ) ( CLEAR ?auto_160546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160550 ) ( ON ?auto_160551 ?auto_160550 ) ( ON ?auto_160549 ?auto_160551 ) ( ON ?auto_160548 ?auto_160549 ) ( not ( = ?auto_160550 ?auto_160551 ) ) ( not ( = ?auto_160550 ?auto_160549 ) ) ( not ( = ?auto_160550 ?auto_160548 ) ) ( not ( = ?auto_160550 ?auto_160547 ) ) ( not ( = ?auto_160550 ?auto_160546 ) ) ( not ( = ?auto_160551 ?auto_160549 ) ) ( not ( = ?auto_160551 ?auto_160548 ) ) ( not ( = ?auto_160551 ?auto_160547 ) ) ( not ( = ?auto_160551 ?auto_160546 ) ) ( not ( = ?auto_160549 ?auto_160548 ) ) ( not ( = ?auto_160549 ?auto_160547 ) ) ( not ( = ?auto_160549 ?auto_160546 ) ) ( not ( = ?auto_160544 ?auto_160550 ) ) ( not ( = ?auto_160544 ?auto_160551 ) ) ( not ( = ?auto_160544 ?auto_160549 ) ) ( not ( = ?auto_160545 ?auto_160550 ) ) ( not ( = ?auto_160545 ?auto_160551 ) ) ( not ( = ?auto_160545 ?auto_160549 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160550 ?auto_160551 ?auto_160549 ?auto_160548 ?auto_160547 )
      ( MAKE-4PILE ?auto_160544 ?auto_160545 ?auto_160546 ?auto_160547 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160552 - BLOCK
      ?auto_160553 - BLOCK
      ?auto_160554 - BLOCK
      ?auto_160555 - BLOCK
    )
    :vars
    (
      ?auto_160559 - BLOCK
      ?auto_160556 - BLOCK
      ?auto_160557 - BLOCK
      ?auto_160558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160552 ) ( not ( = ?auto_160552 ?auto_160553 ) ) ( not ( = ?auto_160552 ?auto_160554 ) ) ( not ( = ?auto_160552 ?auto_160555 ) ) ( not ( = ?auto_160553 ?auto_160554 ) ) ( not ( = ?auto_160553 ?auto_160555 ) ) ( not ( = ?auto_160554 ?auto_160555 ) ) ( ON ?auto_160555 ?auto_160559 ) ( not ( = ?auto_160552 ?auto_160559 ) ) ( not ( = ?auto_160553 ?auto_160559 ) ) ( not ( = ?auto_160554 ?auto_160559 ) ) ( not ( = ?auto_160555 ?auto_160559 ) ) ( ON ?auto_160554 ?auto_160555 ) ( CLEAR ?auto_160554 ) ( ON-TABLE ?auto_160556 ) ( ON ?auto_160557 ?auto_160556 ) ( ON ?auto_160558 ?auto_160557 ) ( ON ?auto_160559 ?auto_160558 ) ( not ( = ?auto_160556 ?auto_160557 ) ) ( not ( = ?auto_160556 ?auto_160558 ) ) ( not ( = ?auto_160556 ?auto_160559 ) ) ( not ( = ?auto_160556 ?auto_160555 ) ) ( not ( = ?auto_160556 ?auto_160554 ) ) ( not ( = ?auto_160557 ?auto_160558 ) ) ( not ( = ?auto_160557 ?auto_160559 ) ) ( not ( = ?auto_160557 ?auto_160555 ) ) ( not ( = ?auto_160557 ?auto_160554 ) ) ( not ( = ?auto_160558 ?auto_160559 ) ) ( not ( = ?auto_160558 ?auto_160555 ) ) ( not ( = ?auto_160558 ?auto_160554 ) ) ( not ( = ?auto_160552 ?auto_160556 ) ) ( not ( = ?auto_160552 ?auto_160557 ) ) ( not ( = ?auto_160552 ?auto_160558 ) ) ( not ( = ?auto_160553 ?auto_160556 ) ) ( not ( = ?auto_160553 ?auto_160557 ) ) ( not ( = ?auto_160553 ?auto_160558 ) ) ( HOLDING ?auto_160553 ) ( CLEAR ?auto_160552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160552 ?auto_160553 )
      ( MAKE-4PILE ?auto_160552 ?auto_160553 ?auto_160554 ?auto_160555 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160560 - BLOCK
      ?auto_160561 - BLOCK
      ?auto_160562 - BLOCK
      ?auto_160563 - BLOCK
    )
    :vars
    (
      ?auto_160565 - BLOCK
      ?auto_160564 - BLOCK
      ?auto_160566 - BLOCK
      ?auto_160567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160560 ) ( not ( = ?auto_160560 ?auto_160561 ) ) ( not ( = ?auto_160560 ?auto_160562 ) ) ( not ( = ?auto_160560 ?auto_160563 ) ) ( not ( = ?auto_160561 ?auto_160562 ) ) ( not ( = ?auto_160561 ?auto_160563 ) ) ( not ( = ?auto_160562 ?auto_160563 ) ) ( ON ?auto_160563 ?auto_160565 ) ( not ( = ?auto_160560 ?auto_160565 ) ) ( not ( = ?auto_160561 ?auto_160565 ) ) ( not ( = ?auto_160562 ?auto_160565 ) ) ( not ( = ?auto_160563 ?auto_160565 ) ) ( ON ?auto_160562 ?auto_160563 ) ( ON-TABLE ?auto_160564 ) ( ON ?auto_160566 ?auto_160564 ) ( ON ?auto_160567 ?auto_160566 ) ( ON ?auto_160565 ?auto_160567 ) ( not ( = ?auto_160564 ?auto_160566 ) ) ( not ( = ?auto_160564 ?auto_160567 ) ) ( not ( = ?auto_160564 ?auto_160565 ) ) ( not ( = ?auto_160564 ?auto_160563 ) ) ( not ( = ?auto_160564 ?auto_160562 ) ) ( not ( = ?auto_160566 ?auto_160567 ) ) ( not ( = ?auto_160566 ?auto_160565 ) ) ( not ( = ?auto_160566 ?auto_160563 ) ) ( not ( = ?auto_160566 ?auto_160562 ) ) ( not ( = ?auto_160567 ?auto_160565 ) ) ( not ( = ?auto_160567 ?auto_160563 ) ) ( not ( = ?auto_160567 ?auto_160562 ) ) ( not ( = ?auto_160560 ?auto_160564 ) ) ( not ( = ?auto_160560 ?auto_160566 ) ) ( not ( = ?auto_160560 ?auto_160567 ) ) ( not ( = ?auto_160561 ?auto_160564 ) ) ( not ( = ?auto_160561 ?auto_160566 ) ) ( not ( = ?auto_160561 ?auto_160567 ) ) ( CLEAR ?auto_160560 ) ( ON ?auto_160561 ?auto_160562 ) ( CLEAR ?auto_160561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160564 ?auto_160566 ?auto_160567 ?auto_160565 ?auto_160563 ?auto_160562 )
      ( MAKE-4PILE ?auto_160560 ?auto_160561 ?auto_160562 ?auto_160563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160568 - BLOCK
      ?auto_160569 - BLOCK
      ?auto_160570 - BLOCK
      ?auto_160571 - BLOCK
    )
    :vars
    (
      ?auto_160573 - BLOCK
      ?auto_160574 - BLOCK
      ?auto_160575 - BLOCK
      ?auto_160572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160568 ?auto_160569 ) ) ( not ( = ?auto_160568 ?auto_160570 ) ) ( not ( = ?auto_160568 ?auto_160571 ) ) ( not ( = ?auto_160569 ?auto_160570 ) ) ( not ( = ?auto_160569 ?auto_160571 ) ) ( not ( = ?auto_160570 ?auto_160571 ) ) ( ON ?auto_160571 ?auto_160573 ) ( not ( = ?auto_160568 ?auto_160573 ) ) ( not ( = ?auto_160569 ?auto_160573 ) ) ( not ( = ?auto_160570 ?auto_160573 ) ) ( not ( = ?auto_160571 ?auto_160573 ) ) ( ON ?auto_160570 ?auto_160571 ) ( ON-TABLE ?auto_160574 ) ( ON ?auto_160575 ?auto_160574 ) ( ON ?auto_160572 ?auto_160575 ) ( ON ?auto_160573 ?auto_160572 ) ( not ( = ?auto_160574 ?auto_160575 ) ) ( not ( = ?auto_160574 ?auto_160572 ) ) ( not ( = ?auto_160574 ?auto_160573 ) ) ( not ( = ?auto_160574 ?auto_160571 ) ) ( not ( = ?auto_160574 ?auto_160570 ) ) ( not ( = ?auto_160575 ?auto_160572 ) ) ( not ( = ?auto_160575 ?auto_160573 ) ) ( not ( = ?auto_160575 ?auto_160571 ) ) ( not ( = ?auto_160575 ?auto_160570 ) ) ( not ( = ?auto_160572 ?auto_160573 ) ) ( not ( = ?auto_160572 ?auto_160571 ) ) ( not ( = ?auto_160572 ?auto_160570 ) ) ( not ( = ?auto_160568 ?auto_160574 ) ) ( not ( = ?auto_160568 ?auto_160575 ) ) ( not ( = ?auto_160568 ?auto_160572 ) ) ( not ( = ?auto_160569 ?auto_160574 ) ) ( not ( = ?auto_160569 ?auto_160575 ) ) ( not ( = ?auto_160569 ?auto_160572 ) ) ( ON ?auto_160569 ?auto_160570 ) ( CLEAR ?auto_160569 ) ( HOLDING ?auto_160568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160568 )
      ( MAKE-4PILE ?auto_160568 ?auto_160569 ?auto_160570 ?auto_160571 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160576 - BLOCK
      ?auto_160577 - BLOCK
      ?auto_160578 - BLOCK
      ?auto_160579 - BLOCK
    )
    :vars
    (
      ?auto_160583 - BLOCK
      ?auto_160582 - BLOCK
      ?auto_160581 - BLOCK
      ?auto_160580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160576 ?auto_160577 ) ) ( not ( = ?auto_160576 ?auto_160578 ) ) ( not ( = ?auto_160576 ?auto_160579 ) ) ( not ( = ?auto_160577 ?auto_160578 ) ) ( not ( = ?auto_160577 ?auto_160579 ) ) ( not ( = ?auto_160578 ?auto_160579 ) ) ( ON ?auto_160579 ?auto_160583 ) ( not ( = ?auto_160576 ?auto_160583 ) ) ( not ( = ?auto_160577 ?auto_160583 ) ) ( not ( = ?auto_160578 ?auto_160583 ) ) ( not ( = ?auto_160579 ?auto_160583 ) ) ( ON ?auto_160578 ?auto_160579 ) ( ON-TABLE ?auto_160582 ) ( ON ?auto_160581 ?auto_160582 ) ( ON ?auto_160580 ?auto_160581 ) ( ON ?auto_160583 ?auto_160580 ) ( not ( = ?auto_160582 ?auto_160581 ) ) ( not ( = ?auto_160582 ?auto_160580 ) ) ( not ( = ?auto_160582 ?auto_160583 ) ) ( not ( = ?auto_160582 ?auto_160579 ) ) ( not ( = ?auto_160582 ?auto_160578 ) ) ( not ( = ?auto_160581 ?auto_160580 ) ) ( not ( = ?auto_160581 ?auto_160583 ) ) ( not ( = ?auto_160581 ?auto_160579 ) ) ( not ( = ?auto_160581 ?auto_160578 ) ) ( not ( = ?auto_160580 ?auto_160583 ) ) ( not ( = ?auto_160580 ?auto_160579 ) ) ( not ( = ?auto_160580 ?auto_160578 ) ) ( not ( = ?auto_160576 ?auto_160582 ) ) ( not ( = ?auto_160576 ?auto_160581 ) ) ( not ( = ?auto_160576 ?auto_160580 ) ) ( not ( = ?auto_160577 ?auto_160582 ) ) ( not ( = ?auto_160577 ?auto_160581 ) ) ( not ( = ?auto_160577 ?auto_160580 ) ) ( ON ?auto_160577 ?auto_160578 ) ( ON ?auto_160576 ?auto_160577 ) ( CLEAR ?auto_160576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160582 ?auto_160581 ?auto_160580 ?auto_160583 ?auto_160579 ?auto_160578 ?auto_160577 )
      ( MAKE-4PILE ?auto_160576 ?auto_160577 ?auto_160578 ?auto_160579 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160584 - BLOCK
      ?auto_160585 - BLOCK
      ?auto_160586 - BLOCK
      ?auto_160587 - BLOCK
    )
    :vars
    (
      ?auto_160591 - BLOCK
      ?auto_160590 - BLOCK
      ?auto_160588 - BLOCK
      ?auto_160589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160584 ?auto_160585 ) ) ( not ( = ?auto_160584 ?auto_160586 ) ) ( not ( = ?auto_160584 ?auto_160587 ) ) ( not ( = ?auto_160585 ?auto_160586 ) ) ( not ( = ?auto_160585 ?auto_160587 ) ) ( not ( = ?auto_160586 ?auto_160587 ) ) ( ON ?auto_160587 ?auto_160591 ) ( not ( = ?auto_160584 ?auto_160591 ) ) ( not ( = ?auto_160585 ?auto_160591 ) ) ( not ( = ?auto_160586 ?auto_160591 ) ) ( not ( = ?auto_160587 ?auto_160591 ) ) ( ON ?auto_160586 ?auto_160587 ) ( ON-TABLE ?auto_160590 ) ( ON ?auto_160588 ?auto_160590 ) ( ON ?auto_160589 ?auto_160588 ) ( ON ?auto_160591 ?auto_160589 ) ( not ( = ?auto_160590 ?auto_160588 ) ) ( not ( = ?auto_160590 ?auto_160589 ) ) ( not ( = ?auto_160590 ?auto_160591 ) ) ( not ( = ?auto_160590 ?auto_160587 ) ) ( not ( = ?auto_160590 ?auto_160586 ) ) ( not ( = ?auto_160588 ?auto_160589 ) ) ( not ( = ?auto_160588 ?auto_160591 ) ) ( not ( = ?auto_160588 ?auto_160587 ) ) ( not ( = ?auto_160588 ?auto_160586 ) ) ( not ( = ?auto_160589 ?auto_160591 ) ) ( not ( = ?auto_160589 ?auto_160587 ) ) ( not ( = ?auto_160589 ?auto_160586 ) ) ( not ( = ?auto_160584 ?auto_160590 ) ) ( not ( = ?auto_160584 ?auto_160588 ) ) ( not ( = ?auto_160584 ?auto_160589 ) ) ( not ( = ?auto_160585 ?auto_160590 ) ) ( not ( = ?auto_160585 ?auto_160588 ) ) ( not ( = ?auto_160585 ?auto_160589 ) ) ( ON ?auto_160585 ?auto_160586 ) ( HOLDING ?auto_160584 ) ( CLEAR ?auto_160585 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160590 ?auto_160588 ?auto_160589 ?auto_160591 ?auto_160587 ?auto_160586 ?auto_160585 ?auto_160584 )
      ( MAKE-4PILE ?auto_160584 ?auto_160585 ?auto_160586 ?auto_160587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160592 - BLOCK
      ?auto_160593 - BLOCK
      ?auto_160594 - BLOCK
      ?auto_160595 - BLOCK
    )
    :vars
    (
      ?auto_160596 - BLOCK
      ?auto_160598 - BLOCK
      ?auto_160599 - BLOCK
      ?auto_160597 - BLOCK
      ?auto_160600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160592 ?auto_160593 ) ) ( not ( = ?auto_160592 ?auto_160594 ) ) ( not ( = ?auto_160592 ?auto_160595 ) ) ( not ( = ?auto_160593 ?auto_160594 ) ) ( not ( = ?auto_160593 ?auto_160595 ) ) ( not ( = ?auto_160594 ?auto_160595 ) ) ( ON ?auto_160595 ?auto_160596 ) ( not ( = ?auto_160592 ?auto_160596 ) ) ( not ( = ?auto_160593 ?auto_160596 ) ) ( not ( = ?auto_160594 ?auto_160596 ) ) ( not ( = ?auto_160595 ?auto_160596 ) ) ( ON ?auto_160594 ?auto_160595 ) ( ON-TABLE ?auto_160598 ) ( ON ?auto_160599 ?auto_160598 ) ( ON ?auto_160597 ?auto_160599 ) ( ON ?auto_160596 ?auto_160597 ) ( not ( = ?auto_160598 ?auto_160599 ) ) ( not ( = ?auto_160598 ?auto_160597 ) ) ( not ( = ?auto_160598 ?auto_160596 ) ) ( not ( = ?auto_160598 ?auto_160595 ) ) ( not ( = ?auto_160598 ?auto_160594 ) ) ( not ( = ?auto_160599 ?auto_160597 ) ) ( not ( = ?auto_160599 ?auto_160596 ) ) ( not ( = ?auto_160599 ?auto_160595 ) ) ( not ( = ?auto_160599 ?auto_160594 ) ) ( not ( = ?auto_160597 ?auto_160596 ) ) ( not ( = ?auto_160597 ?auto_160595 ) ) ( not ( = ?auto_160597 ?auto_160594 ) ) ( not ( = ?auto_160592 ?auto_160598 ) ) ( not ( = ?auto_160592 ?auto_160599 ) ) ( not ( = ?auto_160592 ?auto_160597 ) ) ( not ( = ?auto_160593 ?auto_160598 ) ) ( not ( = ?auto_160593 ?auto_160599 ) ) ( not ( = ?auto_160593 ?auto_160597 ) ) ( ON ?auto_160593 ?auto_160594 ) ( CLEAR ?auto_160593 ) ( ON ?auto_160592 ?auto_160600 ) ( CLEAR ?auto_160592 ) ( HAND-EMPTY ) ( not ( = ?auto_160592 ?auto_160600 ) ) ( not ( = ?auto_160593 ?auto_160600 ) ) ( not ( = ?auto_160594 ?auto_160600 ) ) ( not ( = ?auto_160595 ?auto_160600 ) ) ( not ( = ?auto_160596 ?auto_160600 ) ) ( not ( = ?auto_160598 ?auto_160600 ) ) ( not ( = ?auto_160599 ?auto_160600 ) ) ( not ( = ?auto_160597 ?auto_160600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160592 ?auto_160600 )
      ( MAKE-4PILE ?auto_160592 ?auto_160593 ?auto_160594 ?auto_160595 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160601 - BLOCK
      ?auto_160602 - BLOCK
      ?auto_160603 - BLOCK
      ?auto_160604 - BLOCK
    )
    :vars
    (
      ?auto_160608 - BLOCK
      ?auto_160609 - BLOCK
      ?auto_160605 - BLOCK
      ?auto_160606 - BLOCK
      ?auto_160607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160601 ?auto_160602 ) ) ( not ( = ?auto_160601 ?auto_160603 ) ) ( not ( = ?auto_160601 ?auto_160604 ) ) ( not ( = ?auto_160602 ?auto_160603 ) ) ( not ( = ?auto_160602 ?auto_160604 ) ) ( not ( = ?auto_160603 ?auto_160604 ) ) ( ON ?auto_160604 ?auto_160608 ) ( not ( = ?auto_160601 ?auto_160608 ) ) ( not ( = ?auto_160602 ?auto_160608 ) ) ( not ( = ?auto_160603 ?auto_160608 ) ) ( not ( = ?auto_160604 ?auto_160608 ) ) ( ON ?auto_160603 ?auto_160604 ) ( ON-TABLE ?auto_160609 ) ( ON ?auto_160605 ?auto_160609 ) ( ON ?auto_160606 ?auto_160605 ) ( ON ?auto_160608 ?auto_160606 ) ( not ( = ?auto_160609 ?auto_160605 ) ) ( not ( = ?auto_160609 ?auto_160606 ) ) ( not ( = ?auto_160609 ?auto_160608 ) ) ( not ( = ?auto_160609 ?auto_160604 ) ) ( not ( = ?auto_160609 ?auto_160603 ) ) ( not ( = ?auto_160605 ?auto_160606 ) ) ( not ( = ?auto_160605 ?auto_160608 ) ) ( not ( = ?auto_160605 ?auto_160604 ) ) ( not ( = ?auto_160605 ?auto_160603 ) ) ( not ( = ?auto_160606 ?auto_160608 ) ) ( not ( = ?auto_160606 ?auto_160604 ) ) ( not ( = ?auto_160606 ?auto_160603 ) ) ( not ( = ?auto_160601 ?auto_160609 ) ) ( not ( = ?auto_160601 ?auto_160605 ) ) ( not ( = ?auto_160601 ?auto_160606 ) ) ( not ( = ?auto_160602 ?auto_160609 ) ) ( not ( = ?auto_160602 ?auto_160605 ) ) ( not ( = ?auto_160602 ?auto_160606 ) ) ( ON ?auto_160601 ?auto_160607 ) ( CLEAR ?auto_160601 ) ( not ( = ?auto_160601 ?auto_160607 ) ) ( not ( = ?auto_160602 ?auto_160607 ) ) ( not ( = ?auto_160603 ?auto_160607 ) ) ( not ( = ?auto_160604 ?auto_160607 ) ) ( not ( = ?auto_160608 ?auto_160607 ) ) ( not ( = ?auto_160609 ?auto_160607 ) ) ( not ( = ?auto_160605 ?auto_160607 ) ) ( not ( = ?auto_160606 ?auto_160607 ) ) ( HOLDING ?auto_160602 ) ( CLEAR ?auto_160603 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160609 ?auto_160605 ?auto_160606 ?auto_160608 ?auto_160604 ?auto_160603 ?auto_160602 )
      ( MAKE-4PILE ?auto_160601 ?auto_160602 ?auto_160603 ?auto_160604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160610 - BLOCK
      ?auto_160611 - BLOCK
      ?auto_160612 - BLOCK
      ?auto_160613 - BLOCK
    )
    :vars
    (
      ?auto_160616 - BLOCK
      ?auto_160615 - BLOCK
      ?auto_160618 - BLOCK
      ?auto_160614 - BLOCK
      ?auto_160617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160610 ?auto_160611 ) ) ( not ( = ?auto_160610 ?auto_160612 ) ) ( not ( = ?auto_160610 ?auto_160613 ) ) ( not ( = ?auto_160611 ?auto_160612 ) ) ( not ( = ?auto_160611 ?auto_160613 ) ) ( not ( = ?auto_160612 ?auto_160613 ) ) ( ON ?auto_160613 ?auto_160616 ) ( not ( = ?auto_160610 ?auto_160616 ) ) ( not ( = ?auto_160611 ?auto_160616 ) ) ( not ( = ?auto_160612 ?auto_160616 ) ) ( not ( = ?auto_160613 ?auto_160616 ) ) ( ON ?auto_160612 ?auto_160613 ) ( ON-TABLE ?auto_160615 ) ( ON ?auto_160618 ?auto_160615 ) ( ON ?auto_160614 ?auto_160618 ) ( ON ?auto_160616 ?auto_160614 ) ( not ( = ?auto_160615 ?auto_160618 ) ) ( not ( = ?auto_160615 ?auto_160614 ) ) ( not ( = ?auto_160615 ?auto_160616 ) ) ( not ( = ?auto_160615 ?auto_160613 ) ) ( not ( = ?auto_160615 ?auto_160612 ) ) ( not ( = ?auto_160618 ?auto_160614 ) ) ( not ( = ?auto_160618 ?auto_160616 ) ) ( not ( = ?auto_160618 ?auto_160613 ) ) ( not ( = ?auto_160618 ?auto_160612 ) ) ( not ( = ?auto_160614 ?auto_160616 ) ) ( not ( = ?auto_160614 ?auto_160613 ) ) ( not ( = ?auto_160614 ?auto_160612 ) ) ( not ( = ?auto_160610 ?auto_160615 ) ) ( not ( = ?auto_160610 ?auto_160618 ) ) ( not ( = ?auto_160610 ?auto_160614 ) ) ( not ( = ?auto_160611 ?auto_160615 ) ) ( not ( = ?auto_160611 ?auto_160618 ) ) ( not ( = ?auto_160611 ?auto_160614 ) ) ( ON ?auto_160610 ?auto_160617 ) ( not ( = ?auto_160610 ?auto_160617 ) ) ( not ( = ?auto_160611 ?auto_160617 ) ) ( not ( = ?auto_160612 ?auto_160617 ) ) ( not ( = ?auto_160613 ?auto_160617 ) ) ( not ( = ?auto_160616 ?auto_160617 ) ) ( not ( = ?auto_160615 ?auto_160617 ) ) ( not ( = ?auto_160618 ?auto_160617 ) ) ( not ( = ?auto_160614 ?auto_160617 ) ) ( CLEAR ?auto_160612 ) ( ON ?auto_160611 ?auto_160610 ) ( CLEAR ?auto_160611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160617 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160617 ?auto_160610 )
      ( MAKE-4PILE ?auto_160610 ?auto_160611 ?auto_160612 ?auto_160613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160619 - BLOCK
      ?auto_160620 - BLOCK
      ?auto_160621 - BLOCK
      ?auto_160622 - BLOCK
    )
    :vars
    (
      ?auto_160624 - BLOCK
      ?auto_160626 - BLOCK
      ?auto_160625 - BLOCK
      ?auto_160623 - BLOCK
      ?auto_160627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160619 ?auto_160620 ) ) ( not ( = ?auto_160619 ?auto_160621 ) ) ( not ( = ?auto_160619 ?auto_160622 ) ) ( not ( = ?auto_160620 ?auto_160621 ) ) ( not ( = ?auto_160620 ?auto_160622 ) ) ( not ( = ?auto_160621 ?auto_160622 ) ) ( ON ?auto_160622 ?auto_160624 ) ( not ( = ?auto_160619 ?auto_160624 ) ) ( not ( = ?auto_160620 ?auto_160624 ) ) ( not ( = ?auto_160621 ?auto_160624 ) ) ( not ( = ?auto_160622 ?auto_160624 ) ) ( ON-TABLE ?auto_160626 ) ( ON ?auto_160625 ?auto_160626 ) ( ON ?auto_160623 ?auto_160625 ) ( ON ?auto_160624 ?auto_160623 ) ( not ( = ?auto_160626 ?auto_160625 ) ) ( not ( = ?auto_160626 ?auto_160623 ) ) ( not ( = ?auto_160626 ?auto_160624 ) ) ( not ( = ?auto_160626 ?auto_160622 ) ) ( not ( = ?auto_160626 ?auto_160621 ) ) ( not ( = ?auto_160625 ?auto_160623 ) ) ( not ( = ?auto_160625 ?auto_160624 ) ) ( not ( = ?auto_160625 ?auto_160622 ) ) ( not ( = ?auto_160625 ?auto_160621 ) ) ( not ( = ?auto_160623 ?auto_160624 ) ) ( not ( = ?auto_160623 ?auto_160622 ) ) ( not ( = ?auto_160623 ?auto_160621 ) ) ( not ( = ?auto_160619 ?auto_160626 ) ) ( not ( = ?auto_160619 ?auto_160625 ) ) ( not ( = ?auto_160619 ?auto_160623 ) ) ( not ( = ?auto_160620 ?auto_160626 ) ) ( not ( = ?auto_160620 ?auto_160625 ) ) ( not ( = ?auto_160620 ?auto_160623 ) ) ( ON ?auto_160619 ?auto_160627 ) ( not ( = ?auto_160619 ?auto_160627 ) ) ( not ( = ?auto_160620 ?auto_160627 ) ) ( not ( = ?auto_160621 ?auto_160627 ) ) ( not ( = ?auto_160622 ?auto_160627 ) ) ( not ( = ?auto_160624 ?auto_160627 ) ) ( not ( = ?auto_160626 ?auto_160627 ) ) ( not ( = ?auto_160625 ?auto_160627 ) ) ( not ( = ?auto_160623 ?auto_160627 ) ) ( ON ?auto_160620 ?auto_160619 ) ( CLEAR ?auto_160620 ) ( ON-TABLE ?auto_160627 ) ( HOLDING ?auto_160621 ) ( CLEAR ?auto_160622 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160626 ?auto_160625 ?auto_160623 ?auto_160624 ?auto_160622 ?auto_160621 )
      ( MAKE-4PILE ?auto_160619 ?auto_160620 ?auto_160621 ?auto_160622 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160628 - BLOCK
      ?auto_160629 - BLOCK
      ?auto_160630 - BLOCK
      ?auto_160631 - BLOCK
    )
    :vars
    (
      ?auto_160635 - BLOCK
      ?auto_160636 - BLOCK
      ?auto_160632 - BLOCK
      ?auto_160633 - BLOCK
      ?auto_160634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160628 ?auto_160629 ) ) ( not ( = ?auto_160628 ?auto_160630 ) ) ( not ( = ?auto_160628 ?auto_160631 ) ) ( not ( = ?auto_160629 ?auto_160630 ) ) ( not ( = ?auto_160629 ?auto_160631 ) ) ( not ( = ?auto_160630 ?auto_160631 ) ) ( ON ?auto_160631 ?auto_160635 ) ( not ( = ?auto_160628 ?auto_160635 ) ) ( not ( = ?auto_160629 ?auto_160635 ) ) ( not ( = ?auto_160630 ?auto_160635 ) ) ( not ( = ?auto_160631 ?auto_160635 ) ) ( ON-TABLE ?auto_160636 ) ( ON ?auto_160632 ?auto_160636 ) ( ON ?auto_160633 ?auto_160632 ) ( ON ?auto_160635 ?auto_160633 ) ( not ( = ?auto_160636 ?auto_160632 ) ) ( not ( = ?auto_160636 ?auto_160633 ) ) ( not ( = ?auto_160636 ?auto_160635 ) ) ( not ( = ?auto_160636 ?auto_160631 ) ) ( not ( = ?auto_160636 ?auto_160630 ) ) ( not ( = ?auto_160632 ?auto_160633 ) ) ( not ( = ?auto_160632 ?auto_160635 ) ) ( not ( = ?auto_160632 ?auto_160631 ) ) ( not ( = ?auto_160632 ?auto_160630 ) ) ( not ( = ?auto_160633 ?auto_160635 ) ) ( not ( = ?auto_160633 ?auto_160631 ) ) ( not ( = ?auto_160633 ?auto_160630 ) ) ( not ( = ?auto_160628 ?auto_160636 ) ) ( not ( = ?auto_160628 ?auto_160632 ) ) ( not ( = ?auto_160628 ?auto_160633 ) ) ( not ( = ?auto_160629 ?auto_160636 ) ) ( not ( = ?auto_160629 ?auto_160632 ) ) ( not ( = ?auto_160629 ?auto_160633 ) ) ( ON ?auto_160628 ?auto_160634 ) ( not ( = ?auto_160628 ?auto_160634 ) ) ( not ( = ?auto_160629 ?auto_160634 ) ) ( not ( = ?auto_160630 ?auto_160634 ) ) ( not ( = ?auto_160631 ?auto_160634 ) ) ( not ( = ?auto_160635 ?auto_160634 ) ) ( not ( = ?auto_160636 ?auto_160634 ) ) ( not ( = ?auto_160632 ?auto_160634 ) ) ( not ( = ?auto_160633 ?auto_160634 ) ) ( ON ?auto_160629 ?auto_160628 ) ( ON-TABLE ?auto_160634 ) ( CLEAR ?auto_160631 ) ( ON ?auto_160630 ?auto_160629 ) ( CLEAR ?auto_160630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160634 ?auto_160628 ?auto_160629 )
      ( MAKE-4PILE ?auto_160628 ?auto_160629 ?auto_160630 ?auto_160631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160637 - BLOCK
      ?auto_160638 - BLOCK
      ?auto_160639 - BLOCK
      ?auto_160640 - BLOCK
    )
    :vars
    (
      ?auto_160642 - BLOCK
      ?auto_160644 - BLOCK
      ?auto_160645 - BLOCK
      ?auto_160641 - BLOCK
      ?auto_160643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160637 ?auto_160638 ) ) ( not ( = ?auto_160637 ?auto_160639 ) ) ( not ( = ?auto_160637 ?auto_160640 ) ) ( not ( = ?auto_160638 ?auto_160639 ) ) ( not ( = ?auto_160638 ?auto_160640 ) ) ( not ( = ?auto_160639 ?auto_160640 ) ) ( not ( = ?auto_160637 ?auto_160642 ) ) ( not ( = ?auto_160638 ?auto_160642 ) ) ( not ( = ?auto_160639 ?auto_160642 ) ) ( not ( = ?auto_160640 ?auto_160642 ) ) ( ON-TABLE ?auto_160644 ) ( ON ?auto_160645 ?auto_160644 ) ( ON ?auto_160641 ?auto_160645 ) ( ON ?auto_160642 ?auto_160641 ) ( not ( = ?auto_160644 ?auto_160645 ) ) ( not ( = ?auto_160644 ?auto_160641 ) ) ( not ( = ?auto_160644 ?auto_160642 ) ) ( not ( = ?auto_160644 ?auto_160640 ) ) ( not ( = ?auto_160644 ?auto_160639 ) ) ( not ( = ?auto_160645 ?auto_160641 ) ) ( not ( = ?auto_160645 ?auto_160642 ) ) ( not ( = ?auto_160645 ?auto_160640 ) ) ( not ( = ?auto_160645 ?auto_160639 ) ) ( not ( = ?auto_160641 ?auto_160642 ) ) ( not ( = ?auto_160641 ?auto_160640 ) ) ( not ( = ?auto_160641 ?auto_160639 ) ) ( not ( = ?auto_160637 ?auto_160644 ) ) ( not ( = ?auto_160637 ?auto_160645 ) ) ( not ( = ?auto_160637 ?auto_160641 ) ) ( not ( = ?auto_160638 ?auto_160644 ) ) ( not ( = ?auto_160638 ?auto_160645 ) ) ( not ( = ?auto_160638 ?auto_160641 ) ) ( ON ?auto_160637 ?auto_160643 ) ( not ( = ?auto_160637 ?auto_160643 ) ) ( not ( = ?auto_160638 ?auto_160643 ) ) ( not ( = ?auto_160639 ?auto_160643 ) ) ( not ( = ?auto_160640 ?auto_160643 ) ) ( not ( = ?auto_160642 ?auto_160643 ) ) ( not ( = ?auto_160644 ?auto_160643 ) ) ( not ( = ?auto_160645 ?auto_160643 ) ) ( not ( = ?auto_160641 ?auto_160643 ) ) ( ON ?auto_160638 ?auto_160637 ) ( ON-TABLE ?auto_160643 ) ( ON ?auto_160639 ?auto_160638 ) ( CLEAR ?auto_160639 ) ( HOLDING ?auto_160640 ) ( CLEAR ?auto_160642 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160644 ?auto_160645 ?auto_160641 ?auto_160642 ?auto_160640 )
      ( MAKE-4PILE ?auto_160637 ?auto_160638 ?auto_160639 ?auto_160640 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160646 - BLOCK
      ?auto_160647 - BLOCK
      ?auto_160648 - BLOCK
      ?auto_160649 - BLOCK
    )
    :vars
    (
      ?auto_160651 - BLOCK
      ?auto_160650 - BLOCK
      ?auto_160653 - BLOCK
      ?auto_160654 - BLOCK
      ?auto_160652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160646 ?auto_160647 ) ) ( not ( = ?auto_160646 ?auto_160648 ) ) ( not ( = ?auto_160646 ?auto_160649 ) ) ( not ( = ?auto_160647 ?auto_160648 ) ) ( not ( = ?auto_160647 ?auto_160649 ) ) ( not ( = ?auto_160648 ?auto_160649 ) ) ( not ( = ?auto_160646 ?auto_160651 ) ) ( not ( = ?auto_160647 ?auto_160651 ) ) ( not ( = ?auto_160648 ?auto_160651 ) ) ( not ( = ?auto_160649 ?auto_160651 ) ) ( ON-TABLE ?auto_160650 ) ( ON ?auto_160653 ?auto_160650 ) ( ON ?auto_160654 ?auto_160653 ) ( ON ?auto_160651 ?auto_160654 ) ( not ( = ?auto_160650 ?auto_160653 ) ) ( not ( = ?auto_160650 ?auto_160654 ) ) ( not ( = ?auto_160650 ?auto_160651 ) ) ( not ( = ?auto_160650 ?auto_160649 ) ) ( not ( = ?auto_160650 ?auto_160648 ) ) ( not ( = ?auto_160653 ?auto_160654 ) ) ( not ( = ?auto_160653 ?auto_160651 ) ) ( not ( = ?auto_160653 ?auto_160649 ) ) ( not ( = ?auto_160653 ?auto_160648 ) ) ( not ( = ?auto_160654 ?auto_160651 ) ) ( not ( = ?auto_160654 ?auto_160649 ) ) ( not ( = ?auto_160654 ?auto_160648 ) ) ( not ( = ?auto_160646 ?auto_160650 ) ) ( not ( = ?auto_160646 ?auto_160653 ) ) ( not ( = ?auto_160646 ?auto_160654 ) ) ( not ( = ?auto_160647 ?auto_160650 ) ) ( not ( = ?auto_160647 ?auto_160653 ) ) ( not ( = ?auto_160647 ?auto_160654 ) ) ( ON ?auto_160646 ?auto_160652 ) ( not ( = ?auto_160646 ?auto_160652 ) ) ( not ( = ?auto_160647 ?auto_160652 ) ) ( not ( = ?auto_160648 ?auto_160652 ) ) ( not ( = ?auto_160649 ?auto_160652 ) ) ( not ( = ?auto_160651 ?auto_160652 ) ) ( not ( = ?auto_160650 ?auto_160652 ) ) ( not ( = ?auto_160653 ?auto_160652 ) ) ( not ( = ?auto_160654 ?auto_160652 ) ) ( ON ?auto_160647 ?auto_160646 ) ( ON-TABLE ?auto_160652 ) ( ON ?auto_160648 ?auto_160647 ) ( CLEAR ?auto_160651 ) ( ON ?auto_160649 ?auto_160648 ) ( CLEAR ?auto_160649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160652 ?auto_160646 ?auto_160647 ?auto_160648 )
      ( MAKE-4PILE ?auto_160646 ?auto_160647 ?auto_160648 ?auto_160649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160655 - BLOCK
      ?auto_160656 - BLOCK
      ?auto_160657 - BLOCK
      ?auto_160658 - BLOCK
    )
    :vars
    (
      ?auto_160662 - BLOCK
      ?auto_160661 - BLOCK
      ?auto_160663 - BLOCK
      ?auto_160659 - BLOCK
      ?auto_160660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160655 ?auto_160656 ) ) ( not ( = ?auto_160655 ?auto_160657 ) ) ( not ( = ?auto_160655 ?auto_160658 ) ) ( not ( = ?auto_160656 ?auto_160657 ) ) ( not ( = ?auto_160656 ?auto_160658 ) ) ( not ( = ?auto_160657 ?auto_160658 ) ) ( not ( = ?auto_160655 ?auto_160662 ) ) ( not ( = ?auto_160656 ?auto_160662 ) ) ( not ( = ?auto_160657 ?auto_160662 ) ) ( not ( = ?auto_160658 ?auto_160662 ) ) ( ON-TABLE ?auto_160661 ) ( ON ?auto_160663 ?auto_160661 ) ( ON ?auto_160659 ?auto_160663 ) ( not ( = ?auto_160661 ?auto_160663 ) ) ( not ( = ?auto_160661 ?auto_160659 ) ) ( not ( = ?auto_160661 ?auto_160662 ) ) ( not ( = ?auto_160661 ?auto_160658 ) ) ( not ( = ?auto_160661 ?auto_160657 ) ) ( not ( = ?auto_160663 ?auto_160659 ) ) ( not ( = ?auto_160663 ?auto_160662 ) ) ( not ( = ?auto_160663 ?auto_160658 ) ) ( not ( = ?auto_160663 ?auto_160657 ) ) ( not ( = ?auto_160659 ?auto_160662 ) ) ( not ( = ?auto_160659 ?auto_160658 ) ) ( not ( = ?auto_160659 ?auto_160657 ) ) ( not ( = ?auto_160655 ?auto_160661 ) ) ( not ( = ?auto_160655 ?auto_160663 ) ) ( not ( = ?auto_160655 ?auto_160659 ) ) ( not ( = ?auto_160656 ?auto_160661 ) ) ( not ( = ?auto_160656 ?auto_160663 ) ) ( not ( = ?auto_160656 ?auto_160659 ) ) ( ON ?auto_160655 ?auto_160660 ) ( not ( = ?auto_160655 ?auto_160660 ) ) ( not ( = ?auto_160656 ?auto_160660 ) ) ( not ( = ?auto_160657 ?auto_160660 ) ) ( not ( = ?auto_160658 ?auto_160660 ) ) ( not ( = ?auto_160662 ?auto_160660 ) ) ( not ( = ?auto_160661 ?auto_160660 ) ) ( not ( = ?auto_160663 ?auto_160660 ) ) ( not ( = ?auto_160659 ?auto_160660 ) ) ( ON ?auto_160656 ?auto_160655 ) ( ON-TABLE ?auto_160660 ) ( ON ?auto_160657 ?auto_160656 ) ( ON ?auto_160658 ?auto_160657 ) ( CLEAR ?auto_160658 ) ( HOLDING ?auto_160662 ) ( CLEAR ?auto_160659 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160661 ?auto_160663 ?auto_160659 ?auto_160662 )
      ( MAKE-4PILE ?auto_160655 ?auto_160656 ?auto_160657 ?auto_160658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160664 - BLOCK
      ?auto_160665 - BLOCK
      ?auto_160666 - BLOCK
      ?auto_160667 - BLOCK
    )
    :vars
    (
      ?auto_160669 - BLOCK
      ?auto_160671 - BLOCK
      ?auto_160668 - BLOCK
      ?auto_160670 - BLOCK
      ?auto_160672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160664 ?auto_160665 ) ) ( not ( = ?auto_160664 ?auto_160666 ) ) ( not ( = ?auto_160664 ?auto_160667 ) ) ( not ( = ?auto_160665 ?auto_160666 ) ) ( not ( = ?auto_160665 ?auto_160667 ) ) ( not ( = ?auto_160666 ?auto_160667 ) ) ( not ( = ?auto_160664 ?auto_160669 ) ) ( not ( = ?auto_160665 ?auto_160669 ) ) ( not ( = ?auto_160666 ?auto_160669 ) ) ( not ( = ?auto_160667 ?auto_160669 ) ) ( ON-TABLE ?auto_160671 ) ( ON ?auto_160668 ?auto_160671 ) ( ON ?auto_160670 ?auto_160668 ) ( not ( = ?auto_160671 ?auto_160668 ) ) ( not ( = ?auto_160671 ?auto_160670 ) ) ( not ( = ?auto_160671 ?auto_160669 ) ) ( not ( = ?auto_160671 ?auto_160667 ) ) ( not ( = ?auto_160671 ?auto_160666 ) ) ( not ( = ?auto_160668 ?auto_160670 ) ) ( not ( = ?auto_160668 ?auto_160669 ) ) ( not ( = ?auto_160668 ?auto_160667 ) ) ( not ( = ?auto_160668 ?auto_160666 ) ) ( not ( = ?auto_160670 ?auto_160669 ) ) ( not ( = ?auto_160670 ?auto_160667 ) ) ( not ( = ?auto_160670 ?auto_160666 ) ) ( not ( = ?auto_160664 ?auto_160671 ) ) ( not ( = ?auto_160664 ?auto_160668 ) ) ( not ( = ?auto_160664 ?auto_160670 ) ) ( not ( = ?auto_160665 ?auto_160671 ) ) ( not ( = ?auto_160665 ?auto_160668 ) ) ( not ( = ?auto_160665 ?auto_160670 ) ) ( ON ?auto_160664 ?auto_160672 ) ( not ( = ?auto_160664 ?auto_160672 ) ) ( not ( = ?auto_160665 ?auto_160672 ) ) ( not ( = ?auto_160666 ?auto_160672 ) ) ( not ( = ?auto_160667 ?auto_160672 ) ) ( not ( = ?auto_160669 ?auto_160672 ) ) ( not ( = ?auto_160671 ?auto_160672 ) ) ( not ( = ?auto_160668 ?auto_160672 ) ) ( not ( = ?auto_160670 ?auto_160672 ) ) ( ON ?auto_160665 ?auto_160664 ) ( ON-TABLE ?auto_160672 ) ( ON ?auto_160666 ?auto_160665 ) ( ON ?auto_160667 ?auto_160666 ) ( CLEAR ?auto_160670 ) ( ON ?auto_160669 ?auto_160667 ) ( CLEAR ?auto_160669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160672 ?auto_160664 ?auto_160665 ?auto_160666 ?auto_160667 )
      ( MAKE-4PILE ?auto_160664 ?auto_160665 ?auto_160666 ?auto_160667 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160673 - BLOCK
      ?auto_160674 - BLOCK
      ?auto_160675 - BLOCK
      ?auto_160676 - BLOCK
    )
    :vars
    (
      ?auto_160680 - BLOCK
      ?auto_160677 - BLOCK
      ?auto_160681 - BLOCK
      ?auto_160678 - BLOCK
      ?auto_160679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160673 ?auto_160674 ) ) ( not ( = ?auto_160673 ?auto_160675 ) ) ( not ( = ?auto_160673 ?auto_160676 ) ) ( not ( = ?auto_160674 ?auto_160675 ) ) ( not ( = ?auto_160674 ?auto_160676 ) ) ( not ( = ?auto_160675 ?auto_160676 ) ) ( not ( = ?auto_160673 ?auto_160680 ) ) ( not ( = ?auto_160674 ?auto_160680 ) ) ( not ( = ?auto_160675 ?auto_160680 ) ) ( not ( = ?auto_160676 ?auto_160680 ) ) ( ON-TABLE ?auto_160677 ) ( ON ?auto_160681 ?auto_160677 ) ( not ( = ?auto_160677 ?auto_160681 ) ) ( not ( = ?auto_160677 ?auto_160678 ) ) ( not ( = ?auto_160677 ?auto_160680 ) ) ( not ( = ?auto_160677 ?auto_160676 ) ) ( not ( = ?auto_160677 ?auto_160675 ) ) ( not ( = ?auto_160681 ?auto_160678 ) ) ( not ( = ?auto_160681 ?auto_160680 ) ) ( not ( = ?auto_160681 ?auto_160676 ) ) ( not ( = ?auto_160681 ?auto_160675 ) ) ( not ( = ?auto_160678 ?auto_160680 ) ) ( not ( = ?auto_160678 ?auto_160676 ) ) ( not ( = ?auto_160678 ?auto_160675 ) ) ( not ( = ?auto_160673 ?auto_160677 ) ) ( not ( = ?auto_160673 ?auto_160681 ) ) ( not ( = ?auto_160673 ?auto_160678 ) ) ( not ( = ?auto_160674 ?auto_160677 ) ) ( not ( = ?auto_160674 ?auto_160681 ) ) ( not ( = ?auto_160674 ?auto_160678 ) ) ( ON ?auto_160673 ?auto_160679 ) ( not ( = ?auto_160673 ?auto_160679 ) ) ( not ( = ?auto_160674 ?auto_160679 ) ) ( not ( = ?auto_160675 ?auto_160679 ) ) ( not ( = ?auto_160676 ?auto_160679 ) ) ( not ( = ?auto_160680 ?auto_160679 ) ) ( not ( = ?auto_160677 ?auto_160679 ) ) ( not ( = ?auto_160681 ?auto_160679 ) ) ( not ( = ?auto_160678 ?auto_160679 ) ) ( ON ?auto_160674 ?auto_160673 ) ( ON-TABLE ?auto_160679 ) ( ON ?auto_160675 ?auto_160674 ) ( ON ?auto_160676 ?auto_160675 ) ( ON ?auto_160680 ?auto_160676 ) ( CLEAR ?auto_160680 ) ( HOLDING ?auto_160678 ) ( CLEAR ?auto_160681 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160677 ?auto_160681 ?auto_160678 )
      ( MAKE-4PILE ?auto_160673 ?auto_160674 ?auto_160675 ?auto_160676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160682 - BLOCK
      ?auto_160683 - BLOCK
      ?auto_160684 - BLOCK
      ?auto_160685 - BLOCK
    )
    :vars
    (
      ?auto_160687 - BLOCK
      ?auto_160690 - BLOCK
      ?auto_160688 - BLOCK
      ?auto_160689 - BLOCK
      ?auto_160686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160682 ?auto_160683 ) ) ( not ( = ?auto_160682 ?auto_160684 ) ) ( not ( = ?auto_160682 ?auto_160685 ) ) ( not ( = ?auto_160683 ?auto_160684 ) ) ( not ( = ?auto_160683 ?auto_160685 ) ) ( not ( = ?auto_160684 ?auto_160685 ) ) ( not ( = ?auto_160682 ?auto_160687 ) ) ( not ( = ?auto_160683 ?auto_160687 ) ) ( not ( = ?auto_160684 ?auto_160687 ) ) ( not ( = ?auto_160685 ?auto_160687 ) ) ( ON-TABLE ?auto_160690 ) ( ON ?auto_160688 ?auto_160690 ) ( not ( = ?auto_160690 ?auto_160688 ) ) ( not ( = ?auto_160690 ?auto_160689 ) ) ( not ( = ?auto_160690 ?auto_160687 ) ) ( not ( = ?auto_160690 ?auto_160685 ) ) ( not ( = ?auto_160690 ?auto_160684 ) ) ( not ( = ?auto_160688 ?auto_160689 ) ) ( not ( = ?auto_160688 ?auto_160687 ) ) ( not ( = ?auto_160688 ?auto_160685 ) ) ( not ( = ?auto_160688 ?auto_160684 ) ) ( not ( = ?auto_160689 ?auto_160687 ) ) ( not ( = ?auto_160689 ?auto_160685 ) ) ( not ( = ?auto_160689 ?auto_160684 ) ) ( not ( = ?auto_160682 ?auto_160690 ) ) ( not ( = ?auto_160682 ?auto_160688 ) ) ( not ( = ?auto_160682 ?auto_160689 ) ) ( not ( = ?auto_160683 ?auto_160690 ) ) ( not ( = ?auto_160683 ?auto_160688 ) ) ( not ( = ?auto_160683 ?auto_160689 ) ) ( ON ?auto_160682 ?auto_160686 ) ( not ( = ?auto_160682 ?auto_160686 ) ) ( not ( = ?auto_160683 ?auto_160686 ) ) ( not ( = ?auto_160684 ?auto_160686 ) ) ( not ( = ?auto_160685 ?auto_160686 ) ) ( not ( = ?auto_160687 ?auto_160686 ) ) ( not ( = ?auto_160690 ?auto_160686 ) ) ( not ( = ?auto_160688 ?auto_160686 ) ) ( not ( = ?auto_160689 ?auto_160686 ) ) ( ON ?auto_160683 ?auto_160682 ) ( ON-TABLE ?auto_160686 ) ( ON ?auto_160684 ?auto_160683 ) ( ON ?auto_160685 ?auto_160684 ) ( ON ?auto_160687 ?auto_160685 ) ( CLEAR ?auto_160688 ) ( ON ?auto_160689 ?auto_160687 ) ( CLEAR ?auto_160689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160686 ?auto_160682 ?auto_160683 ?auto_160684 ?auto_160685 ?auto_160687 )
      ( MAKE-4PILE ?auto_160682 ?auto_160683 ?auto_160684 ?auto_160685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160691 - BLOCK
      ?auto_160692 - BLOCK
      ?auto_160693 - BLOCK
      ?auto_160694 - BLOCK
    )
    :vars
    (
      ?auto_160699 - BLOCK
      ?auto_160697 - BLOCK
      ?auto_160695 - BLOCK
      ?auto_160698 - BLOCK
      ?auto_160696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160691 ?auto_160692 ) ) ( not ( = ?auto_160691 ?auto_160693 ) ) ( not ( = ?auto_160691 ?auto_160694 ) ) ( not ( = ?auto_160692 ?auto_160693 ) ) ( not ( = ?auto_160692 ?auto_160694 ) ) ( not ( = ?auto_160693 ?auto_160694 ) ) ( not ( = ?auto_160691 ?auto_160699 ) ) ( not ( = ?auto_160692 ?auto_160699 ) ) ( not ( = ?auto_160693 ?auto_160699 ) ) ( not ( = ?auto_160694 ?auto_160699 ) ) ( ON-TABLE ?auto_160697 ) ( not ( = ?auto_160697 ?auto_160695 ) ) ( not ( = ?auto_160697 ?auto_160698 ) ) ( not ( = ?auto_160697 ?auto_160699 ) ) ( not ( = ?auto_160697 ?auto_160694 ) ) ( not ( = ?auto_160697 ?auto_160693 ) ) ( not ( = ?auto_160695 ?auto_160698 ) ) ( not ( = ?auto_160695 ?auto_160699 ) ) ( not ( = ?auto_160695 ?auto_160694 ) ) ( not ( = ?auto_160695 ?auto_160693 ) ) ( not ( = ?auto_160698 ?auto_160699 ) ) ( not ( = ?auto_160698 ?auto_160694 ) ) ( not ( = ?auto_160698 ?auto_160693 ) ) ( not ( = ?auto_160691 ?auto_160697 ) ) ( not ( = ?auto_160691 ?auto_160695 ) ) ( not ( = ?auto_160691 ?auto_160698 ) ) ( not ( = ?auto_160692 ?auto_160697 ) ) ( not ( = ?auto_160692 ?auto_160695 ) ) ( not ( = ?auto_160692 ?auto_160698 ) ) ( ON ?auto_160691 ?auto_160696 ) ( not ( = ?auto_160691 ?auto_160696 ) ) ( not ( = ?auto_160692 ?auto_160696 ) ) ( not ( = ?auto_160693 ?auto_160696 ) ) ( not ( = ?auto_160694 ?auto_160696 ) ) ( not ( = ?auto_160699 ?auto_160696 ) ) ( not ( = ?auto_160697 ?auto_160696 ) ) ( not ( = ?auto_160695 ?auto_160696 ) ) ( not ( = ?auto_160698 ?auto_160696 ) ) ( ON ?auto_160692 ?auto_160691 ) ( ON-TABLE ?auto_160696 ) ( ON ?auto_160693 ?auto_160692 ) ( ON ?auto_160694 ?auto_160693 ) ( ON ?auto_160699 ?auto_160694 ) ( ON ?auto_160698 ?auto_160699 ) ( CLEAR ?auto_160698 ) ( HOLDING ?auto_160695 ) ( CLEAR ?auto_160697 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160697 ?auto_160695 )
      ( MAKE-4PILE ?auto_160691 ?auto_160692 ?auto_160693 ?auto_160694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160700 - BLOCK
      ?auto_160701 - BLOCK
      ?auto_160702 - BLOCK
      ?auto_160703 - BLOCK
    )
    :vars
    (
      ?auto_160706 - BLOCK
      ?auto_160708 - BLOCK
      ?auto_160705 - BLOCK
      ?auto_160707 - BLOCK
      ?auto_160704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160700 ?auto_160701 ) ) ( not ( = ?auto_160700 ?auto_160702 ) ) ( not ( = ?auto_160700 ?auto_160703 ) ) ( not ( = ?auto_160701 ?auto_160702 ) ) ( not ( = ?auto_160701 ?auto_160703 ) ) ( not ( = ?auto_160702 ?auto_160703 ) ) ( not ( = ?auto_160700 ?auto_160706 ) ) ( not ( = ?auto_160701 ?auto_160706 ) ) ( not ( = ?auto_160702 ?auto_160706 ) ) ( not ( = ?auto_160703 ?auto_160706 ) ) ( ON-TABLE ?auto_160708 ) ( not ( = ?auto_160708 ?auto_160705 ) ) ( not ( = ?auto_160708 ?auto_160707 ) ) ( not ( = ?auto_160708 ?auto_160706 ) ) ( not ( = ?auto_160708 ?auto_160703 ) ) ( not ( = ?auto_160708 ?auto_160702 ) ) ( not ( = ?auto_160705 ?auto_160707 ) ) ( not ( = ?auto_160705 ?auto_160706 ) ) ( not ( = ?auto_160705 ?auto_160703 ) ) ( not ( = ?auto_160705 ?auto_160702 ) ) ( not ( = ?auto_160707 ?auto_160706 ) ) ( not ( = ?auto_160707 ?auto_160703 ) ) ( not ( = ?auto_160707 ?auto_160702 ) ) ( not ( = ?auto_160700 ?auto_160708 ) ) ( not ( = ?auto_160700 ?auto_160705 ) ) ( not ( = ?auto_160700 ?auto_160707 ) ) ( not ( = ?auto_160701 ?auto_160708 ) ) ( not ( = ?auto_160701 ?auto_160705 ) ) ( not ( = ?auto_160701 ?auto_160707 ) ) ( ON ?auto_160700 ?auto_160704 ) ( not ( = ?auto_160700 ?auto_160704 ) ) ( not ( = ?auto_160701 ?auto_160704 ) ) ( not ( = ?auto_160702 ?auto_160704 ) ) ( not ( = ?auto_160703 ?auto_160704 ) ) ( not ( = ?auto_160706 ?auto_160704 ) ) ( not ( = ?auto_160708 ?auto_160704 ) ) ( not ( = ?auto_160705 ?auto_160704 ) ) ( not ( = ?auto_160707 ?auto_160704 ) ) ( ON ?auto_160701 ?auto_160700 ) ( ON-TABLE ?auto_160704 ) ( ON ?auto_160702 ?auto_160701 ) ( ON ?auto_160703 ?auto_160702 ) ( ON ?auto_160706 ?auto_160703 ) ( ON ?auto_160707 ?auto_160706 ) ( CLEAR ?auto_160708 ) ( ON ?auto_160705 ?auto_160707 ) ( CLEAR ?auto_160705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160704 ?auto_160700 ?auto_160701 ?auto_160702 ?auto_160703 ?auto_160706 ?auto_160707 )
      ( MAKE-4PILE ?auto_160700 ?auto_160701 ?auto_160702 ?auto_160703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160709 - BLOCK
      ?auto_160710 - BLOCK
      ?auto_160711 - BLOCK
      ?auto_160712 - BLOCK
    )
    :vars
    (
      ?auto_160715 - BLOCK
      ?auto_160716 - BLOCK
      ?auto_160714 - BLOCK
      ?auto_160717 - BLOCK
      ?auto_160713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160709 ?auto_160710 ) ) ( not ( = ?auto_160709 ?auto_160711 ) ) ( not ( = ?auto_160709 ?auto_160712 ) ) ( not ( = ?auto_160710 ?auto_160711 ) ) ( not ( = ?auto_160710 ?auto_160712 ) ) ( not ( = ?auto_160711 ?auto_160712 ) ) ( not ( = ?auto_160709 ?auto_160715 ) ) ( not ( = ?auto_160710 ?auto_160715 ) ) ( not ( = ?auto_160711 ?auto_160715 ) ) ( not ( = ?auto_160712 ?auto_160715 ) ) ( not ( = ?auto_160716 ?auto_160714 ) ) ( not ( = ?auto_160716 ?auto_160717 ) ) ( not ( = ?auto_160716 ?auto_160715 ) ) ( not ( = ?auto_160716 ?auto_160712 ) ) ( not ( = ?auto_160716 ?auto_160711 ) ) ( not ( = ?auto_160714 ?auto_160717 ) ) ( not ( = ?auto_160714 ?auto_160715 ) ) ( not ( = ?auto_160714 ?auto_160712 ) ) ( not ( = ?auto_160714 ?auto_160711 ) ) ( not ( = ?auto_160717 ?auto_160715 ) ) ( not ( = ?auto_160717 ?auto_160712 ) ) ( not ( = ?auto_160717 ?auto_160711 ) ) ( not ( = ?auto_160709 ?auto_160716 ) ) ( not ( = ?auto_160709 ?auto_160714 ) ) ( not ( = ?auto_160709 ?auto_160717 ) ) ( not ( = ?auto_160710 ?auto_160716 ) ) ( not ( = ?auto_160710 ?auto_160714 ) ) ( not ( = ?auto_160710 ?auto_160717 ) ) ( ON ?auto_160709 ?auto_160713 ) ( not ( = ?auto_160709 ?auto_160713 ) ) ( not ( = ?auto_160710 ?auto_160713 ) ) ( not ( = ?auto_160711 ?auto_160713 ) ) ( not ( = ?auto_160712 ?auto_160713 ) ) ( not ( = ?auto_160715 ?auto_160713 ) ) ( not ( = ?auto_160716 ?auto_160713 ) ) ( not ( = ?auto_160714 ?auto_160713 ) ) ( not ( = ?auto_160717 ?auto_160713 ) ) ( ON ?auto_160710 ?auto_160709 ) ( ON-TABLE ?auto_160713 ) ( ON ?auto_160711 ?auto_160710 ) ( ON ?auto_160712 ?auto_160711 ) ( ON ?auto_160715 ?auto_160712 ) ( ON ?auto_160717 ?auto_160715 ) ( ON ?auto_160714 ?auto_160717 ) ( CLEAR ?auto_160714 ) ( HOLDING ?auto_160716 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160716 )
      ( MAKE-4PILE ?auto_160709 ?auto_160710 ?auto_160711 ?auto_160712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_160718 - BLOCK
      ?auto_160719 - BLOCK
      ?auto_160720 - BLOCK
      ?auto_160721 - BLOCK
    )
    :vars
    (
      ?auto_160725 - BLOCK
      ?auto_160722 - BLOCK
      ?auto_160726 - BLOCK
      ?auto_160723 - BLOCK
      ?auto_160724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160718 ?auto_160719 ) ) ( not ( = ?auto_160718 ?auto_160720 ) ) ( not ( = ?auto_160718 ?auto_160721 ) ) ( not ( = ?auto_160719 ?auto_160720 ) ) ( not ( = ?auto_160719 ?auto_160721 ) ) ( not ( = ?auto_160720 ?auto_160721 ) ) ( not ( = ?auto_160718 ?auto_160725 ) ) ( not ( = ?auto_160719 ?auto_160725 ) ) ( not ( = ?auto_160720 ?auto_160725 ) ) ( not ( = ?auto_160721 ?auto_160725 ) ) ( not ( = ?auto_160722 ?auto_160726 ) ) ( not ( = ?auto_160722 ?auto_160723 ) ) ( not ( = ?auto_160722 ?auto_160725 ) ) ( not ( = ?auto_160722 ?auto_160721 ) ) ( not ( = ?auto_160722 ?auto_160720 ) ) ( not ( = ?auto_160726 ?auto_160723 ) ) ( not ( = ?auto_160726 ?auto_160725 ) ) ( not ( = ?auto_160726 ?auto_160721 ) ) ( not ( = ?auto_160726 ?auto_160720 ) ) ( not ( = ?auto_160723 ?auto_160725 ) ) ( not ( = ?auto_160723 ?auto_160721 ) ) ( not ( = ?auto_160723 ?auto_160720 ) ) ( not ( = ?auto_160718 ?auto_160722 ) ) ( not ( = ?auto_160718 ?auto_160726 ) ) ( not ( = ?auto_160718 ?auto_160723 ) ) ( not ( = ?auto_160719 ?auto_160722 ) ) ( not ( = ?auto_160719 ?auto_160726 ) ) ( not ( = ?auto_160719 ?auto_160723 ) ) ( ON ?auto_160718 ?auto_160724 ) ( not ( = ?auto_160718 ?auto_160724 ) ) ( not ( = ?auto_160719 ?auto_160724 ) ) ( not ( = ?auto_160720 ?auto_160724 ) ) ( not ( = ?auto_160721 ?auto_160724 ) ) ( not ( = ?auto_160725 ?auto_160724 ) ) ( not ( = ?auto_160722 ?auto_160724 ) ) ( not ( = ?auto_160726 ?auto_160724 ) ) ( not ( = ?auto_160723 ?auto_160724 ) ) ( ON ?auto_160719 ?auto_160718 ) ( ON-TABLE ?auto_160724 ) ( ON ?auto_160720 ?auto_160719 ) ( ON ?auto_160721 ?auto_160720 ) ( ON ?auto_160725 ?auto_160721 ) ( ON ?auto_160723 ?auto_160725 ) ( ON ?auto_160726 ?auto_160723 ) ( ON ?auto_160722 ?auto_160726 ) ( CLEAR ?auto_160722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160724 ?auto_160718 ?auto_160719 ?auto_160720 ?auto_160721 ?auto_160725 ?auto_160723 ?auto_160726 )
      ( MAKE-4PILE ?auto_160718 ?auto_160719 ?auto_160720 ?auto_160721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160730 - BLOCK
      ?auto_160731 - BLOCK
      ?auto_160732 - BLOCK
    )
    :vars
    (
      ?auto_160733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160733 ?auto_160732 ) ( CLEAR ?auto_160733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160730 ) ( ON ?auto_160731 ?auto_160730 ) ( ON ?auto_160732 ?auto_160731 ) ( not ( = ?auto_160730 ?auto_160731 ) ) ( not ( = ?auto_160730 ?auto_160732 ) ) ( not ( = ?auto_160730 ?auto_160733 ) ) ( not ( = ?auto_160731 ?auto_160732 ) ) ( not ( = ?auto_160731 ?auto_160733 ) ) ( not ( = ?auto_160732 ?auto_160733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160733 ?auto_160732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160734 - BLOCK
      ?auto_160735 - BLOCK
      ?auto_160736 - BLOCK
    )
    :vars
    (
      ?auto_160737 - BLOCK
      ?auto_160738 - BLOCK
      ?auto_160739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160737 ?auto_160736 ) ( CLEAR ?auto_160737 ) ( ON-TABLE ?auto_160734 ) ( ON ?auto_160735 ?auto_160734 ) ( ON ?auto_160736 ?auto_160735 ) ( not ( = ?auto_160734 ?auto_160735 ) ) ( not ( = ?auto_160734 ?auto_160736 ) ) ( not ( = ?auto_160734 ?auto_160737 ) ) ( not ( = ?auto_160735 ?auto_160736 ) ) ( not ( = ?auto_160735 ?auto_160737 ) ) ( not ( = ?auto_160736 ?auto_160737 ) ) ( HOLDING ?auto_160738 ) ( CLEAR ?auto_160739 ) ( not ( = ?auto_160734 ?auto_160738 ) ) ( not ( = ?auto_160734 ?auto_160739 ) ) ( not ( = ?auto_160735 ?auto_160738 ) ) ( not ( = ?auto_160735 ?auto_160739 ) ) ( not ( = ?auto_160736 ?auto_160738 ) ) ( not ( = ?auto_160736 ?auto_160739 ) ) ( not ( = ?auto_160737 ?auto_160738 ) ) ( not ( = ?auto_160737 ?auto_160739 ) ) ( not ( = ?auto_160738 ?auto_160739 ) ) )
    :subtasks
    ( ( !STACK ?auto_160738 ?auto_160739 )
      ( MAKE-3PILE ?auto_160734 ?auto_160735 ?auto_160736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160740 - BLOCK
      ?auto_160741 - BLOCK
      ?auto_160742 - BLOCK
    )
    :vars
    (
      ?auto_160745 - BLOCK
      ?auto_160744 - BLOCK
      ?auto_160743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160745 ?auto_160742 ) ( ON-TABLE ?auto_160740 ) ( ON ?auto_160741 ?auto_160740 ) ( ON ?auto_160742 ?auto_160741 ) ( not ( = ?auto_160740 ?auto_160741 ) ) ( not ( = ?auto_160740 ?auto_160742 ) ) ( not ( = ?auto_160740 ?auto_160745 ) ) ( not ( = ?auto_160741 ?auto_160742 ) ) ( not ( = ?auto_160741 ?auto_160745 ) ) ( not ( = ?auto_160742 ?auto_160745 ) ) ( CLEAR ?auto_160744 ) ( not ( = ?auto_160740 ?auto_160743 ) ) ( not ( = ?auto_160740 ?auto_160744 ) ) ( not ( = ?auto_160741 ?auto_160743 ) ) ( not ( = ?auto_160741 ?auto_160744 ) ) ( not ( = ?auto_160742 ?auto_160743 ) ) ( not ( = ?auto_160742 ?auto_160744 ) ) ( not ( = ?auto_160745 ?auto_160743 ) ) ( not ( = ?auto_160745 ?auto_160744 ) ) ( not ( = ?auto_160743 ?auto_160744 ) ) ( ON ?auto_160743 ?auto_160745 ) ( CLEAR ?auto_160743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160740 ?auto_160741 ?auto_160742 ?auto_160745 )
      ( MAKE-3PILE ?auto_160740 ?auto_160741 ?auto_160742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160746 - BLOCK
      ?auto_160747 - BLOCK
      ?auto_160748 - BLOCK
    )
    :vars
    (
      ?auto_160751 - BLOCK
      ?auto_160750 - BLOCK
      ?auto_160749 - BLOCK
      ?auto_160752 - BLOCK
      ?auto_160753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160751 ?auto_160748 ) ( ON-TABLE ?auto_160746 ) ( ON ?auto_160747 ?auto_160746 ) ( ON ?auto_160748 ?auto_160747 ) ( not ( = ?auto_160746 ?auto_160747 ) ) ( not ( = ?auto_160746 ?auto_160748 ) ) ( not ( = ?auto_160746 ?auto_160751 ) ) ( not ( = ?auto_160747 ?auto_160748 ) ) ( not ( = ?auto_160747 ?auto_160751 ) ) ( not ( = ?auto_160748 ?auto_160751 ) ) ( not ( = ?auto_160746 ?auto_160750 ) ) ( not ( = ?auto_160746 ?auto_160749 ) ) ( not ( = ?auto_160747 ?auto_160750 ) ) ( not ( = ?auto_160747 ?auto_160749 ) ) ( not ( = ?auto_160748 ?auto_160750 ) ) ( not ( = ?auto_160748 ?auto_160749 ) ) ( not ( = ?auto_160751 ?auto_160750 ) ) ( not ( = ?auto_160751 ?auto_160749 ) ) ( not ( = ?auto_160750 ?auto_160749 ) ) ( ON ?auto_160750 ?auto_160751 ) ( CLEAR ?auto_160750 ) ( HOLDING ?auto_160749 ) ( CLEAR ?auto_160752 ) ( ON-TABLE ?auto_160753 ) ( ON ?auto_160752 ?auto_160753 ) ( not ( = ?auto_160753 ?auto_160752 ) ) ( not ( = ?auto_160753 ?auto_160749 ) ) ( not ( = ?auto_160752 ?auto_160749 ) ) ( not ( = ?auto_160746 ?auto_160752 ) ) ( not ( = ?auto_160746 ?auto_160753 ) ) ( not ( = ?auto_160747 ?auto_160752 ) ) ( not ( = ?auto_160747 ?auto_160753 ) ) ( not ( = ?auto_160748 ?auto_160752 ) ) ( not ( = ?auto_160748 ?auto_160753 ) ) ( not ( = ?auto_160751 ?auto_160752 ) ) ( not ( = ?auto_160751 ?auto_160753 ) ) ( not ( = ?auto_160750 ?auto_160752 ) ) ( not ( = ?auto_160750 ?auto_160753 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160753 ?auto_160752 ?auto_160749 )
      ( MAKE-3PILE ?auto_160746 ?auto_160747 ?auto_160748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160754 - BLOCK
      ?auto_160755 - BLOCK
      ?auto_160756 - BLOCK
    )
    :vars
    (
      ?auto_160759 - BLOCK
      ?auto_160761 - BLOCK
      ?auto_160760 - BLOCK
      ?auto_160757 - BLOCK
      ?auto_160758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160759 ?auto_160756 ) ( ON-TABLE ?auto_160754 ) ( ON ?auto_160755 ?auto_160754 ) ( ON ?auto_160756 ?auto_160755 ) ( not ( = ?auto_160754 ?auto_160755 ) ) ( not ( = ?auto_160754 ?auto_160756 ) ) ( not ( = ?auto_160754 ?auto_160759 ) ) ( not ( = ?auto_160755 ?auto_160756 ) ) ( not ( = ?auto_160755 ?auto_160759 ) ) ( not ( = ?auto_160756 ?auto_160759 ) ) ( not ( = ?auto_160754 ?auto_160761 ) ) ( not ( = ?auto_160754 ?auto_160760 ) ) ( not ( = ?auto_160755 ?auto_160761 ) ) ( not ( = ?auto_160755 ?auto_160760 ) ) ( not ( = ?auto_160756 ?auto_160761 ) ) ( not ( = ?auto_160756 ?auto_160760 ) ) ( not ( = ?auto_160759 ?auto_160761 ) ) ( not ( = ?auto_160759 ?auto_160760 ) ) ( not ( = ?auto_160761 ?auto_160760 ) ) ( ON ?auto_160761 ?auto_160759 ) ( CLEAR ?auto_160757 ) ( ON-TABLE ?auto_160758 ) ( ON ?auto_160757 ?auto_160758 ) ( not ( = ?auto_160758 ?auto_160757 ) ) ( not ( = ?auto_160758 ?auto_160760 ) ) ( not ( = ?auto_160757 ?auto_160760 ) ) ( not ( = ?auto_160754 ?auto_160757 ) ) ( not ( = ?auto_160754 ?auto_160758 ) ) ( not ( = ?auto_160755 ?auto_160757 ) ) ( not ( = ?auto_160755 ?auto_160758 ) ) ( not ( = ?auto_160756 ?auto_160757 ) ) ( not ( = ?auto_160756 ?auto_160758 ) ) ( not ( = ?auto_160759 ?auto_160757 ) ) ( not ( = ?auto_160759 ?auto_160758 ) ) ( not ( = ?auto_160761 ?auto_160757 ) ) ( not ( = ?auto_160761 ?auto_160758 ) ) ( ON ?auto_160760 ?auto_160761 ) ( CLEAR ?auto_160760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160754 ?auto_160755 ?auto_160756 ?auto_160759 ?auto_160761 )
      ( MAKE-3PILE ?auto_160754 ?auto_160755 ?auto_160756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160762 - BLOCK
      ?auto_160763 - BLOCK
      ?auto_160764 - BLOCK
    )
    :vars
    (
      ?auto_160767 - BLOCK
      ?auto_160765 - BLOCK
      ?auto_160766 - BLOCK
      ?auto_160768 - BLOCK
      ?auto_160769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160767 ?auto_160764 ) ( ON-TABLE ?auto_160762 ) ( ON ?auto_160763 ?auto_160762 ) ( ON ?auto_160764 ?auto_160763 ) ( not ( = ?auto_160762 ?auto_160763 ) ) ( not ( = ?auto_160762 ?auto_160764 ) ) ( not ( = ?auto_160762 ?auto_160767 ) ) ( not ( = ?auto_160763 ?auto_160764 ) ) ( not ( = ?auto_160763 ?auto_160767 ) ) ( not ( = ?auto_160764 ?auto_160767 ) ) ( not ( = ?auto_160762 ?auto_160765 ) ) ( not ( = ?auto_160762 ?auto_160766 ) ) ( not ( = ?auto_160763 ?auto_160765 ) ) ( not ( = ?auto_160763 ?auto_160766 ) ) ( not ( = ?auto_160764 ?auto_160765 ) ) ( not ( = ?auto_160764 ?auto_160766 ) ) ( not ( = ?auto_160767 ?auto_160765 ) ) ( not ( = ?auto_160767 ?auto_160766 ) ) ( not ( = ?auto_160765 ?auto_160766 ) ) ( ON ?auto_160765 ?auto_160767 ) ( ON-TABLE ?auto_160768 ) ( not ( = ?auto_160768 ?auto_160769 ) ) ( not ( = ?auto_160768 ?auto_160766 ) ) ( not ( = ?auto_160769 ?auto_160766 ) ) ( not ( = ?auto_160762 ?auto_160769 ) ) ( not ( = ?auto_160762 ?auto_160768 ) ) ( not ( = ?auto_160763 ?auto_160769 ) ) ( not ( = ?auto_160763 ?auto_160768 ) ) ( not ( = ?auto_160764 ?auto_160769 ) ) ( not ( = ?auto_160764 ?auto_160768 ) ) ( not ( = ?auto_160767 ?auto_160769 ) ) ( not ( = ?auto_160767 ?auto_160768 ) ) ( not ( = ?auto_160765 ?auto_160769 ) ) ( not ( = ?auto_160765 ?auto_160768 ) ) ( ON ?auto_160766 ?auto_160765 ) ( CLEAR ?auto_160766 ) ( HOLDING ?auto_160769 ) ( CLEAR ?auto_160768 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160768 ?auto_160769 )
      ( MAKE-3PILE ?auto_160762 ?auto_160763 ?auto_160764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160770 - BLOCK
      ?auto_160771 - BLOCK
      ?auto_160772 - BLOCK
    )
    :vars
    (
      ?auto_160776 - BLOCK
      ?auto_160774 - BLOCK
      ?auto_160773 - BLOCK
      ?auto_160775 - BLOCK
      ?auto_160777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160776 ?auto_160772 ) ( ON-TABLE ?auto_160770 ) ( ON ?auto_160771 ?auto_160770 ) ( ON ?auto_160772 ?auto_160771 ) ( not ( = ?auto_160770 ?auto_160771 ) ) ( not ( = ?auto_160770 ?auto_160772 ) ) ( not ( = ?auto_160770 ?auto_160776 ) ) ( not ( = ?auto_160771 ?auto_160772 ) ) ( not ( = ?auto_160771 ?auto_160776 ) ) ( not ( = ?auto_160772 ?auto_160776 ) ) ( not ( = ?auto_160770 ?auto_160774 ) ) ( not ( = ?auto_160770 ?auto_160773 ) ) ( not ( = ?auto_160771 ?auto_160774 ) ) ( not ( = ?auto_160771 ?auto_160773 ) ) ( not ( = ?auto_160772 ?auto_160774 ) ) ( not ( = ?auto_160772 ?auto_160773 ) ) ( not ( = ?auto_160776 ?auto_160774 ) ) ( not ( = ?auto_160776 ?auto_160773 ) ) ( not ( = ?auto_160774 ?auto_160773 ) ) ( ON ?auto_160774 ?auto_160776 ) ( ON-TABLE ?auto_160775 ) ( not ( = ?auto_160775 ?auto_160777 ) ) ( not ( = ?auto_160775 ?auto_160773 ) ) ( not ( = ?auto_160777 ?auto_160773 ) ) ( not ( = ?auto_160770 ?auto_160777 ) ) ( not ( = ?auto_160770 ?auto_160775 ) ) ( not ( = ?auto_160771 ?auto_160777 ) ) ( not ( = ?auto_160771 ?auto_160775 ) ) ( not ( = ?auto_160772 ?auto_160777 ) ) ( not ( = ?auto_160772 ?auto_160775 ) ) ( not ( = ?auto_160776 ?auto_160777 ) ) ( not ( = ?auto_160776 ?auto_160775 ) ) ( not ( = ?auto_160774 ?auto_160777 ) ) ( not ( = ?auto_160774 ?auto_160775 ) ) ( ON ?auto_160773 ?auto_160774 ) ( CLEAR ?auto_160775 ) ( ON ?auto_160777 ?auto_160773 ) ( CLEAR ?auto_160777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160770 ?auto_160771 ?auto_160772 ?auto_160776 ?auto_160774 ?auto_160773 )
      ( MAKE-3PILE ?auto_160770 ?auto_160771 ?auto_160772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160778 - BLOCK
      ?auto_160779 - BLOCK
      ?auto_160780 - BLOCK
    )
    :vars
    (
      ?auto_160781 - BLOCK
      ?auto_160784 - BLOCK
      ?auto_160782 - BLOCK
      ?auto_160785 - BLOCK
      ?auto_160783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160781 ?auto_160780 ) ( ON-TABLE ?auto_160778 ) ( ON ?auto_160779 ?auto_160778 ) ( ON ?auto_160780 ?auto_160779 ) ( not ( = ?auto_160778 ?auto_160779 ) ) ( not ( = ?auto_160778 ?auto_160780 ) ) ( not ( = ?auto_160778 ?auto_160781 ) ) ( not ( = ?auto_160779 ?auto_160780 ) ) ( not ( = ?auto_160779 ?auto_160781 ) ) ( not ( = ?auto_160780 ?auto_160781 ) ) ( not ( = ?auto_160778 ?auto_160784 ) ) ( not ( = ?auto_160778 ?auto_160782 ) ) ( not ( = ?auto_160779 ?auto_160784 ) ) ( not ( = ?auto_160779 ?auto_160782 ) ) ( not ( = ?auto_160780 ?auto_160784 ) ) ( not ( = ?auto_160780 ?auto_160782 ) ) ( not ( = ?auto_160781 ?auto_160784 ) ) ( not ( = ?auto_160781 ?auto_160782 ) ) ( not ( = ?auto_160784 ?auto_160782 ) ) ( ON ?auto_160784 ?auto_160781 ) ( not ( = ?auto_160785 ?auto_160783 ) ) ( not ( = ?auto_160785 ?auto_160782 ) ) ( not ( = ?auto_160783 ?auto_160782 ) ) ( not ( = ?auto_160778 ?auto_160783 ) ) ( not ( = ?auto_160778 ?auto_160785 ) ) ( not ( = ?auto_160779 ?auto_160783 ) ) ( not ( = ?auto_160779 ?auto_160785 ) ) ( not ( = ?auto_160780 ?auto_160783 ) ) ( not ( = ?auto_160780 ?auto_160785 ) ) ( not ( = ?auto_160781 ?auto_160783 ) ) ( not ( = ?auto_160781 ?auto_160785 ) ) ( not ( = ?auto_160784 ?auto_160783 ) ) ( not ( = ?auto_160784 ?auto_160785 ) ) ( ON ?auto_160782 ?auto_160784 ) ( ON ?auto_160783 ?auto_160782 ) ( CLEAR ?auto_160783 ) ( HOLDING ?auto_160785 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160785 )
      ( MAKE-3PILE ?auto_160778 ?auto_160779 ?auto_160780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160786 - BLOCK
      ?auto_160787 - BLOCK
      ?auto_160788 - BLOCK
    )
    :vars
    (
      ?auto_160792 - BLOCK
      ?auto_160791 - BLOCK
      ?auto_160789 - BLOCK
      ?auto_160790 - BLOCK
      ?auto_160793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160792 ?auto_160788 ) ( ON-TABLE ?auto_160786 ) ( ON ?auto_160787 ?auto_160786 ) ( ON ?auto_160788 ?auto_160787 ) ( not ( = ?auto_160786 ?auto_160787 ) ) ( not ( = ?auto_160786 ?auto_160788 ) ) ( not ( = ?auto_160786 ?auto_160792 ) ) ( not ( = ?auto_160787 ?auto_160788 ) ) ( not ( = ?auto_160787 ?auto_160792 ) ) ( not ( = ?auto_160788 ?auto_160792 ) ) ( not ( = ?auto_160786 ?auto_160791 ) ) ( not ( = ?auto_160786 ?auto_160789 ) ) ( not ( = ?auto_160787 ?auto_160791 ) ) ( not ( = ?auto_160787 ?auto_160789 ) ) ( not ( = ?auto_160788 ?auto_160791 ) ) ( not ( = ?auto_160788 ?auto_160789 ) ) ( not ( = ?auto_160792 ?auto_160791 ) ) ( not ( = ?auto_160792 ?auto_160789 ) ) ( not ( = ?auto_160791 ?auto_160789 ) ) ( ON ?auto_160791 ?auto_160792 ) ( not ( = ?auto_160790 ?auto_160793 ) ) ( not ( = ?auto_160790 ?auto_160789 ) ) ( not ( = ?auto_160793 ?auto_160789 ) ) ( not ( = ?auto_160786 ?auto_160793 ) ) ( not ( = ?auto_160786 ?auto_160790 ) ) ( not ( = ?auto_160787 ?auto_160793 ) ) ( not ( = ?auto_160787 ?auto_160790 ) ) ( not ( = ?auto_160788 ?auto_160793 ) ) ( not ( = ?auto_160788 ?auto_160790 ) ) ( not ( = ?auto_160792 ?auto_160793 ) ) ( not ( = ?auto_160792 ?auto_160790 ) ) ( not ( = ?auto_160791 ?auto_160793 ) ) ( not ( = ?auto_160791 ?auto_160790 ) ) ( ON ?auto_160789 ?auto_160791 ) ( ON ?auto_160793 ?auto_160789 ) ( ON ?auto_160790 ?auto_160793 ) ( CLEAR ?auto_160790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160786 ?auto_160787 ?auto_160788 ?auto_160792 ?auto_160791 ?auto_160789 ?auto_160793 )
      ( MAKE-3PILE ?auto_160786 ?auto_160787 ?auto_160788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160794 - BLOCK
      ?auto_160795 - BLOCK
      ?auto_160796 - BLOCK
    )
    :vars
    (
      ?auto_160800 - BLOCK
      ?auto_160798 - BLOCK
      ?auto_160799 - BLOCK
      ?auto_160797 - BLOCK
      ?auto_160801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160800 ?auto_160796 ) ( ON-TABLE ?auto_160794 ) ( ON ?auto_160795 ?auto_160794 ) ( ON ?auto_160796 ?auto_160795 ) ( not ( = ?auto_160794 ?auto_160795 ) ) ( not ( = ?auto_160794 ?auto_160796 ) ) ( not ( = ?auto_160794 ?auto_160800 ) ) ( not ( = ?auto_160795 ?auto_160796 ) ) ( not ( = ?auto_160795 ?auto_160800 ) ) ( not ( = ?auto_160796 ?auto_160800 ) ) ( not ( = ?auto_160794 ?auto_160798 ) ) ( not ( = ?auto_160794 ?auto_160799 ) ) ( not ( = ?auto_160795 ?auto_160798 ) ) ( not ( = ?auto_160795 ?auto_160799 ) ) ( not ( = ?auto_160796 ?auto_160798 ) ) ( not ( = ?auto_160796 ?auto_160799 ) ) ( not ( = ?auto_160800 ?auto_160798 ) ) ( not ( = ?auto_160800 ?auto_160799 ) ) ( not ( = ?auto_160798 ?auto_160799 ) ) ( ON ?auto_160798 ?auto_160800 ) ( not ( = ?auto_160797 ?auto_160801 ) ) ( not ( = ?auto_160797 ?auto_160799 ) ) ( not ( = ?auto_160801 ?auto_160799 ) ) ( not ( = ?auto_160794 ?auto_160801 ) ) ( not ( = ?auto_160794 ?auto_160797 ) ) ( not ( = ?auto_160795 ?auto_160801 ) ) ( not ( = ?auto_160795 ?auto_160797 ) ) ( not ( = ?auto_160796 ?auto_160801 ) ) ( not ( = ?auto_160796 ?auto_160797 ) ) ( not ( = ?auto_160800 ?auto_160801 ) ) ( not ( = ?auto_160800 ?auto_160797 ) ) ( not ( = ?auto_160798 ?auto_160801 ) ) ( not ( = ?auto_160798 ?auto_160797 ) ) ( ON ?auto_160799 ?auto_160798 ) ( ON ?auto_160801 ?auto_160799 ) ( HOLDING ?auto_160797 ) ( CLEAR ?auto_160801 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160794 ?auto_160795 ?auto_160796 ?auto_160800 ?auto_160798 ?auto_160799 ?auto_160801 ?auto_160797 )
      ( MAKE-3PILE ?auto_160794 ?auto_160795 ?auto_160796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160802 - BLOCK
      ?auto_160803 - BLOCK
      ?auto_160804 - BLOCK
    )
    :vars
    (
      ?auto_160809 - BLOCK
      ?auto_160807 - BLOCK
      ?auto_160805 - BLOCK
      ?auto_160806 - BLOCK
      ?auto_160808 - BLOCK
      ?auto_160810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160809 ?auto_160804 ) ( ON-TABLE ?auto_160802 ) ( ON ?auto_160803 ?auto_160802 ) ( ON ?auto_160804 ?auto_160803 ) ( not ( = ?auto_160802 ?auto_160803 ) ) ( not ( = ?auto_160802 ?auto_160804 ) ) ( not ( = ?auto_160802 ?auto_160809 ) ) ( not ( = ?auto_160803 ?auto_160804 ) ) ( not ( = ?auto_160803 ?auto_160809 ) ) ( not ( = ?auto_160804 ?auto_160809 ) ) ( not ( = ?auto_160802 ?auto_160807 ) ) ( not ( = ?auto_160802 ?auto_160805 ) ) ( not ( = ?auto_160803 ?auto_160807 ) ) ( not ( = ?auto_160803 ?auto_160805 ) ) ( not ( = ?auto_160804 ?auto_160807 ) ) ( not ( = ?auto_160804 ?auto_160805 ) ) ( not ( = ?auto_160809 ?auto_160807 ) ) ( not ( = ?auto_160809 ?auto_160805 ) ) ( not ( = ?auto_160807 ?auto_160805 ) ) ( ON ?auto_160807 ?auto_160809 ) ( not ( = ?auto_160806 ?auto_160808 ) ) ( not ( = ?auto_160806 ?auto_160805 ) ) ( not ( = ?auto_160808 ?auto_160805 ) ) ( not ( = ?auto_160802 ?auto_160808 ) ) ( not ( = ?auto_160802 ?auto_160806 ) ) ( not ( = ?auto_160803 ?auto_160808 ) ) ( not ( = ?auto_160803 ?auto_160806 ) ) ( not ( = ?auto_160804 ?auto_160808 ) ) ( not ( = ?auto_160804 ?auto_160806 ) ) ( not ( = ?auto_160809 ?auto_160808 ) ) ( not ( = ?auto_160809 ?auto_160806 ) ) ( not ( = ?auto_160807 ?auto_160808 ) ) ( not ( = ?auto_160807 ?auto_160806 ) ) ( ON ?auto_160805 ?auto_160807 ) ( ON ?auto_160808 ?auto_160805 ) ( CLEAR ?auto_160808 ) ( ON ?auto_160806 ?auto_160810 ) ( CLEAR ?auto_160806 ) ( HAND-EMPTY ) ( not ( = ?auto_160802 ?auto_160810 ) ) ( not ( = ?auto_160803 ?auto_160810 ) ) ( not ( = ?auto_160804 ?auto_160810 ) ) ( not ( = ?auto_160809 ?auto_160810 ) ) ( not ( = ?auto_160807 ?auto_160810 ) ) ( not ( = ?auto_160805 ?auto_160810 ) ) ( not ( = ?auto_160806 ?auto_160810 ) ) ( not ( = ?auto_160808 ?auto_160810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160806 ?auto_160810 )
      ( MAKE-3PILE ?auto_160802 ?auto_160803 ?auto_160804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160811 - BLOCK
      ?auto_160812 - BLOCK
      ?auto_160813 - BLOCK
    )
    :vars
    (
      ?auto_160816 - BLOCK
      ?auto_160818 - BLOCK
      ?auto_160814 - BLOCK
      ?auto_160817 - BLOCK
      ?auto_160819 - BLOCK
      ?auto_160815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160816 ?auto_160813 ) ( ON-TABLE ?auto_160811 ) ( ON ?auto_160812 ?auto_160811 ) ( ON ?auto_160813 ?auto_160812 ) ( not ( = ?auto_160811 ?auto_160812 ) ) ( not ( = ?auto_160811 ?auto_160813 ) ) ( not ( = ?auto_160811 ?auto_160816 ) ) ( not ( = ?auto_160812 ?auto_160813 ) ) ( not ( = ?auto_160812 ?auto_160816 ) ) ( not ( = ?auto_160813 ?auto_160816 ) ) ( not ( = ?auto_160811 ?auto_160818 ) ) ( not ( = ?auto_160811 ?auto_160814 ) ) ( not ( = ?auto_160812 ?auto_160818 ) ) ( not ( = ?auto_160812 ?auto_160814 ) ) ( not ( = ?auto_160813 ?auto_160818 ) ) ( not ( = ?auto_160813 ?auto_160814 ) ) ( not ( = ?auto_160816 ?auto_160818 ) ) ( not ( = ?auto_160816 ?auto_160814 ) ) ( not ( = ?auto_160818 ?auto_160814 ) ) ( ON ?auto_160818 ?auto_160816 ) ( not ( = ?auto_160817 ?auto_160819 ) ) ( not ( = ?auto_160817 ?auto_160814 ) ) ( not ( = ?auto_160819 ?auto_160814 ) ) ( not ( = ?auto_160811 ?auto_160819 ) ) ( not ( = ?auto_160811 ?auto_160817 ) ) ( not ( = ?auto_160812 ?auto_160819 ) ) ( not ( = ?auto_160812 ?auto_160817 ) ) ( not ( = ?auto_160813 ?auto_160819 ) ) ( not ( = ?auto_160813 ?auto_160817 ) ) ( not ( = ?auto_160816 ?auto_160819 ) ) ( not ( = ?auto_160816 ?auto_160817 ) ) ( not ( = ?auto_160818 ?auto_160819 ) ) ( not ( = ?auto_160818 ?auto_160817 ) ) ( ON ?auto_160814 ?auto_160818 ) ( ON ?auto_160817 ?auto_160815 ) ( CLEAR ?auto_160817 ) ( not ( = ?auto_160811 ?auto_160815 ) ) ( not ( = ?auto_160812 ?auto_160815 ) ) ( not ( = ?auto_160813 ?auto_160815 ) ) ( not ( = ?auto_160816 ?auto_160815 ) ) ( not ( = ?auto_160818 ?auto_160815 ) ) ( not ( = ?auto_160814 ?auto_160815 ) ) ( not ( = ?auto_160817 ?auto_160815 ) ) ( not ( = ?auto_160819 ?auto_160815 ) ) ( HOLDING ?auto_160819 ) ( CLEAR ?auto_160814 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160811 ?auto_160812 ?auto_160813 ?auto_160816 ?auto_160818 ?auto_160814 ?auto_160819 )
      ( MAKE-3PILE ?auto_160811 ?auto_160812 ?auto_160813 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160820 - BLOCK
      ?auto_160821 - BLOCK
      ?auto_160822 - BLOCK
    )
    :vars
    (
      ?auto_160826 - BLOCK
      ?auto_160825 - BLOCK
      ?auto_160823 - BLOCK
      ?auto_160824 - BLOCK
      ?auto_160828 - BLOCK
      ?auto_160827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160826 ?auto_160822 ) ( ON-TABLE ?auto_160820 ) ( ON ?auto_160821 ?auto_160820 ) ( ON ?auto_160822 ?auto_160821 ) ( not ( = ?auto_160820 ?auto_160821 ) ) ( not ( = ?auto_160820 ?auto_160822 ) ) ( not ( = ?auto_160820 ?auto_160826 ) ) ( not ( = ?auto_160821 ?auto_160822 ) ) ( not ( = ?auto_160821 ?auto_160826 ) ) ( not ( = ?auto_160822 ?auto_160826 ) ) ( not ( = ?auto_160820 ?auto_160825 ) ) ( not ( = ?auto_160820 ?auto_160823 ) ) ( not ( = ?auto_160821 ?auto_160825 ) ) ( not ( = ?auto_160821 ?auto_160823 ) ) ( not ( = ?auto_160822 ?auto_160825 ) ) ( not ( = ?auto_160822 ?auto_160823 ) ) ( not ( = ?auto_160826 ?auto_160825 ) ) ( not ( = ?auto_160826 ?auto_160823 ) ) ( not ( = ?auto_160825 ?auto_160823 ) ) ( ON ?auto_160825 ?auto_160826 ) ( not ( = ?auto_160824 ?auto_160828 ) ) ( not ( = ?auto_160824 ?auto_160823 ) ) ( not ( = ?auto_160828 ?auto_160823 ) ) ( not ( = ?auto_160820 ?auto_160828 ) ) ( not ( = ?auto_160820 ?auto_160824 ) ) ( not ( = ?auto_160821 ?auto_160828 ) ) ( not ( = ?auto_160821 ?auto_160824 ) ) ( not ( = ?auto_160822 ?auto_160828 ) ) ( not ( = ?auto_160822 ?auto_160824 ) ) ( not ( = ?auto_160826 ?auto_160828 ) ) ( not ( = ?auto_160826 ?auto_160824 ) ) ( not ( = ?auto_160825 ?auto_160828 ) ) ( not ( = ?auto_160825 ?auto_160824 ) ) ( ON ?auto_160823 ?auto_160825 ) ( ON ?auto_160824 ?auto_160827 ) ( not ( = ?auto_160820 ?auto_160827 ) ) ( not ( = ?auto_160821 ?auto_160827 ) ) ( not ( = ?auto_160822 ?auto_160827 ) ) ( not ( = ?auto_160826 ?auto_160827 ) ) ( not ( = ?auto_160825 ?auto_160827 ) ) ( not ( = ?auto_160823 ?auto_160827 ) ) ( not ( = ?auto_160824 ?auto_160827 ) ) ( not ( = ?auto_160828 ?auto_160827 ) ) ( CLEAR ?auto_160823 ) ( ON ?auto_160828 ?auto_160824 ) ( CLEAR ?auto_160828 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160827 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160827 ?auto_160824 )
      ( MAKE-3PILE ?auto_160820 ?auto_160821 ?auto_160822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160829 - BLOCK
      ?auto_160830 - BLOCK
      ?auto_160831 - BLOCK
    )
    :vars
    (
      ?auto_160832 - BLOCK
      ?auto_160834 - BLOCK
      ?auto_160837 - BLOCK
      ?auto_160835 - BLOCK
      ?auto_160833 - BLOCK
      ?auto_160836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160832 ?auto_160831 ) ( ON-TABLE ?auto_160829 ) ( ON ?auto_160830 ?auto_160829 ) ( ON ?auto_160831 ?auto_160830 ) ( not ( = ?auto_160829 ?auto_160830 ) ) ( not ( = ?auto_160829 ?auto_160831 ) ) ( not ( = ?auto_160829 ?auto_160832 ) ) ( not ( = ?auto_160830 ?auto_160831 ) ) ( not ( = ?auto_160830 ?auto_160832 ) ) ( not ( = ?auto_160831 ?auto_160832 ) ) ( not ( = ?auto_160829 ?auto_160834 ) ) ( not ( = ?auto_160829 ?auto_160837 ) ) ( not ( = ?auto_160830 ?auto_160834 ) ) ( not ( = ?auto_160830 ?auto_160837 ) ) ( not ( = ?auto_160831 ?auto_160834 ) ) ( not ( = ?auto_160831 ?auto_160837 ) ) ( not ( = ?auto_160832 ?auto_160834 ) ) ( not ( = ?auto_160832 ?auto_160837 ) ) ( not ( = ?auto_160834 ?auto_160837 ) ) ( ON ?auto_160834 ?auto_160832 ) ( not ( = ?auto_160835 ?auto_160833 ) ) ( not ( = ?auto_160835 ?auto_160837 ) ) ( not ( = ?auto_160833 ?auto_160837 ) ) ( not ( = ?auto_160829 ?auto_160833 ) ) ( not ( = ?auto_160829 ?auto_160835 ) ) ( not ( = ?auto_160830 ?auto_160833 ) ) ( not ( = ?auto_160830 ?auto_160835 ) ) ( not ( = ?auto_160831 ?auto_160833 ) ) ( not ( = ?auto_160831 ?auto_160835 ) ) ( not ( = ?auto_160832 ?auto_160833 ) ) ( not ( = ?auto_160832 ?auto_160835 ) ) ( not ( = ?auto_160834 ?auto_160833 ) ) ( not ( = ?auto_160834 ?auto_160835 ) ) ( ON ?auto_160835 ?auto_160836 ) ( not ( = ?auto_160829 ?auto_160836 ) ) ( not ( = ?auto_160830 ?auto_160836 ) ) ( not ( = ?auto_160831 ?auto_160836 ) ) ( not ( = ?auto_160832 ?auto_160836 ) ) ( not ( = ?auto_160834 ?auto_160836 ) ) ( not ( = ?auto_160837 ?auto_160836 ) ) ( not ( = ?auto_160835 ?auto_160836 ) ) ( not ( = ?auto_160833 ?auto_160836 ) ) ( ON ?auto_160833 ?auto_160835 ) ( CLEAR ?auto_160833 ) ( ON-TABLE ?auto_160836 ) ( HOLDING ?auto_160837 ) ( CLEAR ?auto_160834 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160829 ?auto_160830 ?auto_160831 ?auto_160832 ?auto_160834 ?auto_160837 )
      ( MAKE-3PILE ?auto_160829 ?auto_160830 ?auto_160831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160838 - BLOCK
      ?auto_160839 - BLOCK
      ?auto_160840 - BLOCK
    )
    :vars
    (
      ?auto_160841 - BLOCK
      ?auto_160842 - BLOCK
      ?auto_160844 - BLOCK
      ?auto_160846 - BLOCK
      ?auto_160843 - BLOCK
      ?auto_160845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160841 ?auto_160840 ) ( ON-TABLE ?auto_160838 ) ( ON ?auto_160839 ?auto_160838 ) ( ON ?auto_160840 ?auto_160839 ) ( not ( = ?auto_160838 ?auto_160839 ) ) ( not ( = ?auto_160838 ?auto_160840 ) ) ( not ( = ?auto_160838 ?auto_160841 ) ) ( not ( = ?auto_160839 ?auto_160840 ) ) ( not ( = ?auto_160839 ?auto_160841 ) ) ( not ( = ?auto_160840 ?auto_160841 ) ) ( not ( = ?auto_160838 ?auto_160842 ) ) ( not ( = ?auto_160838 ?auto_160844 ) ) ( not ( = ?auto_160839 ?auto_160842 ) ) ( not ( = ?auto_160839 ?auto_160844 ) ) ( not ( = ?auto_160840 ?auto_160842 ) ) ( not ( = ?auto_160840 ?auto_160844 ) ) ( not ( = ?auto_160841 ?auto_160842 ) ) ( not ( = ?auto_160841 ?auto_160844 ) ) ( not ( = ?auto_160842 ?auto_160844 ) ) ( ON ?auto_160842 ?auto_160841 ) ( not ( = ?auto_160846 ?auto_160843 ) ) ( not ( = ?auto_160846 ?auto_160844 ) ) ( not ( = ?auto_160843 ?auto_160844 ) ) ( not ( = ?auto_160838 ?auto_160843 ) ) ( not ( = ?auto_160838 ?auto_160846 ) ) ( not ( = ?auto_160839 ?auto_160843 ) ) ( not ( = ?auto_160839 ?auto_160846 ) ) ( not ( = ?auto_160840 ?auto_160843 ) ) ( not ( = ?auto_160840 ?auto_160846 ) ) ( not ( = ?auto_160841 ?auto_160843 ) ) ( not ( = ?auto_160841 ?auto_160846 ) ) ( not ( = ?auto_160842 ?auto_160843 ) ) ( not ( = ?auto_160842 ?auto_160846 ) ) ( ON ?auto_160846 ?auto_160845 ) ( not ( = ?auto_160838 ?auto_160845 ) ) ( not ( = ?auto_160839 ?auto_160845 ) ) ( not ( = ?auto_160840 ?auto_160845 ) ) ( not ( = ?auto_160841 ?auto_160845 ) ) ( not ( = ?auto_160842 ?auto_160845 ) ) ( not ( = ?auto_160844 ?auto_160845 ) ) ( not ( = ?auto_160846 ?auto_160845 ) ) ( not ( = ?auto_160843 ?auto_160845 ) ) ( ON ?auto_160843 ?auto_160846 ) ( ON-TABLE ?auto_160845 ) ( CLEAR ?auto_160842 ) ( ON ?auto_160844 ?auto_160843 ) ( CLEAR ?auto_160844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160845 ?auto_160846 ?auto_160843 )
      ( MAKE-3PILE ?auto_160838 ?auto_160839 ?auto_160840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160847 - BLOCK
      ?auto_160848 - BLOCK
      ?auto_160849 - BLOCK
    )
    :vars
    (
      ?auto_160855 - BLOCK
      ?auto_160852 - BLOCK
      ?auto_160854 - BLOCK
      ?auto_160851 - BLOCK
      ?auto_160850 - BLOCK
      ?auto_160853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160855 ?auto_160849 ) ( ON-TABLE ?auto_160847 ) ( ON ?auto_160848 ?auto_160847 ) ( ON ?auto_160849 ?auto_160848 ) ( not ( = ?auto_160847 ?auto_160848 ) ) ( not ( = ?auto_160847 ?auto_160849 ) ) ( not ( = ?auto_160847 ?auto_160855 ) ) ( not ( = ?auto_160848 ?auto_160849 ) ) ( not ( = ?auto_160848 ?auto_160855 ) ) ( not ( = ?auto_160849 ?auto_160855 ) ) ( not ( = ?auto_160847 ?auto_160852 ) ) ( not ( = ?auto_160847 ?auto_160854 ) ) ( not ( = ?auto_160848 ?auto_160852 ) ) ( not ( = ?auto_160848 ?auto_160854 ) ) ( not ( = ?auto_160849 ?auto_160852 ) ) ( not ( = ?auto_160849 ?auto_160854 ) ) ( not ( = ?auto_160855 ?auto_160852 ) ) ( not ( = ?auto_160855 ?auto_160854 ) ) ( not ( = ?auto_160852 ?auto_160854 ) ) ( not ( = ?auto_160851 ?auto_160850 ) ) ( not ( = ?auto_160851 ?auto_160854 ) ) ( not ( = ?auto_160850 ?auto_160854 ) ) ( not ( = ?auto_160847 ?auto_160850 ) ) ( not ( = ?auto_160847 ?auto_160851 ) ) ( not ( = ?auto_160848 ?auto_160850 ) ) ( not ( = ?auto_160848 ?auto_160851 ) ) ( not ( = ?auto_160849 ?auto_160850 ) ) ( not ( = ?auto_160849 ?auto_160851 ) ) ( not ( = ?auto_160855 ?auto_160850 ) ) ( not ( = ?auto_160855 ?auto_160851 ) ) ( not ( = ?auto_160852 ?auto_160850 ) ) ( not ( = ?auto_160852 ?auto_160851 ) ) ( ON ?auto_160851 ?auto_160853 ) ( not ( = ?auto_160847 ?auto_160853 ) ) ( not ( = ?auto_160848 ?auto_160853 ) ) ( not ( = ?auto_160849 ?auto_160853 ) ) ( not ( = ?auto_160855 ?auto_160853 ) ) ( not ( = ?auto_160852 ?auto_160853 ) ) ( not ( = ?auto_160854 ?auto_160853 ) ) ( not ( = ?auto_160851 ?auto_160853 ) ) ( not ( = ?auto_160850 ?auto_160853 ) ) ( ON ?auto_160850 ?auto_160851 ) ( ON-TABLE ?auto_160853 ) ( ON ?auto_160854 ?auto_160850 ) ( CLEAR ?auto_160854 ) ( HOLDING ?auto_160852 ) ( CLEAR ?auto_160855 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160847 ?auto_160848 ?auto_160849 ?auto_160855 ?auto_160852 )
      ( MAKE-3PILE ?auto_160847 ?auto_160848 ?auto_160849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160856 - BLOCK
      ?auto_160857 - BLOCK
      ?auto_160858 - BLOCK
    )
    :vars
    (
      ?auto_160859 - BLOCK
      ?auto_160862 - BLOCK
      ?auto_160861 - BLOCK
      ?auto_160863 - BLOCK
      ?auto_160860 - BLOCK
      ?auto_160864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_160859 ?auto_160858 ) ( ON-TABLE ?auto_160856 ) ( ON ?auto_160857 ?auto_160856 ) ( ON ?auto_160858 ?auto_160857 ) ( not ( = ?auto_160856 ?auto_160857 ) ) ( not ( = ?auto_160856 ?auto_160858 ) ) ( not ( = ?auto_160856 ?auto_160859 ) ) ( not ( = ?auto_160857 ?auto_160858 ) ) ( not ( = ?auto_160857 ?auto_160859 ) ) ( not ( = ?auto_160858 ?auto_160859 ) ) ( not ( = ?auto_160856 ?auto_160862 ) ) ( not ( = ?auto_160856 ?auto_160861 ) ) ( not ( = ?auto_160857 ?auto_160862 ) ) ( not ( = ?auto_160857 ?auto_160861 ) ) ( not ( = ?auto_160858 ?auto_160862 ) ) ( not ( = ?auto_160858 ?auto_160861 ) ) ( not ( = ?auto_160859 ?auto_160862 ) ) ( not ( = ?auto_160859 ?auto_160861 ) ) ( not ( = ?auto_160862 ?auto_160861 ) ) ( not ( = ?auto_160863 ?auto_160860 ) ) ( not ( = ?auto_160863 ?auto_160861 ) ) ( not ( = ?auto_160860 ?auto_160861 ) ) ( not ( = ?auto_160856 ?auto_160860 ) ) ( not ( = ?auto_160856 ?auto_160863 ) ) ( not ( = ?auto_160857 ?auto_160860 ) ) ( not ( = ?auto_160857 ?auto_160863 ) ) ( not ( = ?auto_160858 ?auto_160860 ) ) ( not ( = ?auto_160858 ?auto_160863 ) ) ( not ( = ?auto_160859 ?auto_160860 ) ) ( not ( = ?auto_160859 ?auto_160863 ) ) ( not ( = ?auto_160862 ?auto_160860 ) ) ( not ( = ?auto_160862 ?auto_160863 ) ) ( ON ?auto_160863 ?auto_160864 ) ( not ( = ?auto_160856 ?auto_160864 ) ) ( not ( = ?auto_160857 ?auto_160864 ) ) ( not ( = ?auto_160858 ?auto_160864 ) ) ( not ( = ?auto_160859 ?auto_160864 ) ) ( not ( = ?auto_160862 ?auto_160864 ) ) ( not ( = ?auto_160861 ?auto_160864 ) ) ( not ( = ?auto_160863 ?auto_160864 ) ) ( not ( = ?auto_160860 ?auto_160864 ) ) ( ON ?auto_160860 ?auto_160863 ) ( ON-TABLE ?auto_160864 ) ( ON ?auto_160861 ?auto_160860 ) ( CLEAR ?auto_160859 ) ( ON ?auto_160862 ?auto_160861 ) ( CLEAR ?auto_160862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160864 ?auto_160863 ?auto_160860 ?auto_160861 )
      ( MAKE-3PILE ?auto_160856 ?auto_160857 ?auto_160858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160883 - BLOCK
      ?auto_160884 - BLOCK
      ?auto_160885 - BLOCK
    )
    :vars
    (
      ?auto_160888 - BLOCK
      ?auto_160891 - BLOCK
      ?auto_160887 - BLOCK
      ?auto_160889 - BLOCK
      ?auto_160886 - BLOCK
      ?auto_160890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160883 ) ( ON ?auto_160884 ?auto_160883 ) ( not ( = ?auto_160883 ?auto_160884 ) ) ( not ( = ?auto_160883 ?auto_160885 ) ) ( not ( = ?auto_160883 ?auto_160888 ) ) ( not ( = ?auto_160884 ?auto_160885 ) ) ( not ( = ?auto_160884 ?auto_160888 ) ) ( not ( = ?auto_160885 ?auto_160888 ) ) ( not ( = ?auto_160883 ?auto_160891 ) ) ( not ( = ?auto_160883 ?auto_160887 ) ) ( not ( = ?auto_160884 ?auto_160891 ) ) ( not ( = ?auto_160884 ?auto_160887 ) ) ( not ( = ?auto_160885 ?auto_160891 ) ) ( not ( = ?auto_160885 ?auto_160887 ) ) ( not ( = ?auto_160888 ?auto_160891 ) ) ( not ( = ?auto_160888 ?auto_160887 ) ) ( not ( = ?auto_160891 ?auto_160887 ) ) ( not ( = ?auto_160889 ?auto_160886 ) ) ( not ( = ?auto_160889 ?auto_160887 ) ) ( not ( = ?auto_160886 ?auto_160887 ) ) ( not ( = ?auto_160883 ?auto_160886 ) ) ( not ( = ?auto_160883 ?auto_160889 ) ) ( not ( = ?auto_160884 ?auto_160886 ) ) ( not ( = ?auto_160884 ?auto_160889 ) ) ( not ( = ?auto_160885 ?auto_160886 ) ) ( not ( = ?auto_160885 ?auto_160889 ) ) ( not ( = ?auto_160888 ?auto_160886 ) ) ( not ( = ?auto_160888 ?auto_160889 ) ) ( not ( = ?auto_160891 ?auto_160886 ) ) ( not ( = ?auto_160891 ?auto_160889 ) ) ( ON ?auto_160889 ?auto_160890 ) ( not ( = ?auto_160883 ?auto_160890 ) ) ( not ( = ?auto_160884 ?auto_160890 ) ) ( not ( = ?auto_160885 ?auto_160890 ) ) ( not ( = ?auto_160888 ?auto_160890 ) ) ( not ( = ?auto_160891 ?auto_160890 ) ) ( not ( = ?auto_160887 ?auto_160890 ) ) ( not ( = ?auto_160889 ?auto_160890 ) ) ( not ( = ?auto_160886 ?auto_160890 ) ) ( ON ?auto_160886 ?auto_160889 ) ( ON-TABLE ?auto_160890 ) ( ON ?auto_160887 ?auto_160886 ) ( ON ?auto_160891 ?auto_160887 ) ( ON ?auto_160888 ?auto_160891 ) ( CLEAR ?auto_160888 ) ( HOLDING ?auto_160885 ) ( CLEAR ?auto_160884 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160883 ?auto_160884 ?auto_160885 ?auto_160888 )
      ( MAKE-3PILE ?auto_160883 ?auto_160884 ?auto_160885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160892 - BLOCK
      ?auto_160893 - BLOCK
      ?auto_160894 - BLOCK
    )
    :vars
    (
      ?auto_160896 - BLOCK
      ?auto_160895 - BLOCK
      ?auto_160898 - BLOCK
      ?auto_160899 - BLOCK
      ?auto_160900 - BLOCK
      ?auto_160897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160892 ) ( ON ?auto_160893 ?auto_160892 ) ( not ( = ?auto_160892 ?auto_160893 ) ) ( not ( = ?auto_160892 ?auto_160894 ) ) ( not ( = ?auto_160892 ?auto_160896 ) ) ( not ( = ?auto_160893 ?auto_160894 ) ) ( not ( = ?auto_160893 ?auto_160896 ) ) ( not ( = ?auto_160894 ?auto_160896 ) ) ( not ( = ?auto_160892 ?auto_160895 ) ) ( not ( = ?auto_160892 ?auto_160898 ) ) ( not ( = ?auto_160893 ?auto_160895 ) ) ( not ( = ?auto_160893 ?auto_160898 ) ) ( not ( = ?auto_160894 ?auto_160895 ) ) ( not ( = ?auto_160894 ?auto_160898 ) ) ( not ( = ?auto_160896 ?auto_160895 ) ) ( not ( = ?auto_160896 ?auto_160898 ) ) ( not ( = ?auto_160895 ?auto_160898 ) ) ( not ( = ?auto_160899 ?auto_160900 ) ) ( not ( = ?auto_160899 ?auto_160898 ) ) ( not ( = ?auto_160900 ?auto_160898 ) ) ( not ( = ?auto_160892 ?auto_160900 ) ) ( not ( = ?auto_160892 ?auto_160899 ) ) ( not ( = ?auto_160893 ?auto_160900 ) ) ( not ( = ?auto_160893 ?auto_160899 ) ) ( not ( = ?auto_160894 ?auto_160900 ) ) ( not ( = ?auto_160894 ?auto_160899 ) ) ( not ( = ?auto_160896 ?auto_160900 ) ) ( not ( = ?auto_160896 ?auto_160899 ) ) ( not ( = ?auto_160895 ?auto_160900 ) ) ( not ( = ?auto_160895 ?auto_160899 ) ) ( ON ?auto_160899 ?auto_160897 ) ( not ( = ?auto_160892 ?auto_160897 ) ) ( not ( = ?auto_160893 ?auto_160897 ) ) ( not ( = ?auto_160894 ?auto_160897 ) ) ( not ( = ?auto_160896 ?auto_160897 ) ) ( not ( = ?auto_160895 ?auto_160897 ) ) ( not ( = ?auto_160898 ?auto_160897 ) ) ( not ( = ?auto_160899 ?auto_160897 ) ) ( not ( = ?auto_160900 ?auto_160897 ) ) ( ON ?auto_160900 ?auto_160899 ) ( ON-TABLE ?auto_160897 ) ( ON ?auto_160898 ?auto_160900 ) ( ON ?auto_160895 ?auto_160898 ) ( ON ?auto_160896 ?auto_160895 ) ( CLEAR ?auto_160893 ) ( ON ?auto_160894 ?auto_160896 ) ( CLEAR ?auto_160894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160897 ?auto_160899 ?auto_160900 ?auto_160898 ?auto_160895 ?auto_160896 )
      ( MAKE-3PILE ?auto_160892 ?auto_160893 ?auto_160894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160901 - BLOCK
      ?auto_160902 - BLOCK
      ?auto_160903 - BLOCK
    )
    :vars
    (
      ?auto_160905 - BLOCK
      ?auto_160904 - BLOCK
      ?auto_160909 - BLOCK
      ?auto_160906 - BLOCK
      ?auto_160907 - BLOCK
      ?auto_160908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160901 ) ( not ( = ?auto_160901 ?auto_160902 ) ) ( not ( = ?auto_160901 ?auto_160903 ) ) ( not ( = ?auto_160901 ?auto_160905 ) ) ( not ( = ?auto_160902 ?auto_160903 ) ) ( not ( = ?auto_160902 ?auto_160905 ) ) ( not ( = ?auto_160903 ?auto_160905 ) ) ( not ( = ?auto_160901 ?auto_160904 ) ) ( not ( = ?auto_160901 ?auto_160909 ) ) ( not ( = ?auto_160902 ?auto_160904 ) ) ( not ( = ?auto_160902 ?auto_160909 ) ) ( not ( = ?auto_160903 ?auto_160904 ) ) ( not ( = ?auto_160903 ?auto_160909 ) ) ( not ( = ?auto_160905 ?auto_160904 ) ) ( not ( = ?auto_160905 ?auto_160909 ) ) ( not ( = ?auto_160904 ?auto_160909 ) ) ( not ( = ?auto_160906 ?auto_160907 ) ) ( not ( = ?auto_160906 ?auto_160909 ) ) ( not ( = ?auto_160907 ?auto_160909 ) ) ( not ( = ?auto_160901 ?auto_160907 ) ) ( not ( = ?auto_160901 ?auto_160906 ) ) ( not ( = ?auto_160902 ?auto_160907 ) ) ( not ( = ?auto_160902 ?auto_160906 ) ) ( not ( = ?auto_160903 ?auto_160907 ) ) ( not ( = ?auto_160903 ?auto_160906 ) ) ( not ( = ?auto_160905 ?auto_160907 ) ) ( not ( = ?auto_160905 ?auto_160906 ) ) ( not ( = ?auto_160904 ?auto_160907 ) ) ( not ( = ?auto_160904 ?auto_160906 ) ) ( ON ?auto_160906 ?auto_160908 ) ( not ( = ?auto_160901 ?auto_160908 ) ) ( not ( = ?auto_160902 ?auto_160908 ) ) ( not ( = ?auto_160903 ?auto_160908 ) ) ( not ( = ?auto_160905 ?auto_160908 ) ) ( not ( = ?auto_160904 ?auto_160908 ) ) ( not ( = ?auto_160909 ?auto_160908 ) ) ( not ( = ?auto_160906 ?auto_160908 ) ) ( not ( = ?auto_160907 ?auto_160908 ) ) ( ON ?auto_160907 ?auto_160906 ) ( ON-TABLE ?auto_160908 ) ( ON ?auto_160909 ?auto_160907 ) ( ON ?auto_160904 ?auto_160909 ) ( ON ?auto_160905 ?auto_160904 ) ( ON ?auto_160903 ?auto_160905 ) ( CLEAR ?auto_160903 ) ( HOLDING ?auto_160902 ) ( CLEAR ?auto_160901 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160901 ?auto_160902 )
      ( MAKE-3PILE ?auto_160901 ?auto_160902 ?auto_160903 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160910 - BLOCK
      ?auto_160911 - BLOCK
      ?auto_160912 - BLOCK
    )
    :vars
    (
      ?auto_160913 - BLOCK
      ?auto_160918 - BLOCK
      ?auto_160916 - BLOCK
      ?auto_160914 - BLOCK
      ?auto_160917 - BLOCK
      ?auto_160915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160910 ) ( not ( = ?auto_160910 ?auto_160911 ) ) ( not ( = ?auto_160910 ?auto_160912 ) ) ( not ( = ?auto_160910 ?auto_160913 ) ) ( not ( = ?auto_160911 ?auto_160912 ) ) ( not ( = ?auto_160911 ?auto_160913 ) ) ( not ( = ?auto_160912 ?auto_160913 ) ) ( not ( = ?auto_160910 ?auto_160918 ) ) ( not ( = ?auto_160910 ?auto_160916 ) ) ( not ( = ?auto_160911 ?auto_160918 ) ) ( not ( = ?auto_160911 ?auto_160916 ) ) ( not ( = ?auto_160912 ?auto_160918 ) ) ( not ( = ?auto_160912 ?auto_160916 ) ) ( not ( = ?auto_160913 ?auto_160918 ) ) ( not ( = ?auto_160913 ?auto_160916 ) ) ( not ( = ?auto_160918 ?auto_160916 ) ) ( not ( = ?auto_160914 ?auto_160917 ) ) ( not ( = ?auto_160914 ?auto_160916 ) ) ( not ( = ?auto_160917 ?auto_160916 ) ) ( not ( = ?auto_160910 ?auto_160917 ) ) ( not ( = ?auto_160910 ?auto_160914 ) ) ( not ( = ?auto_160911 ?auto_160917 ) ) ( not ( = ?auto_160911 ?auto_160914 ) ) ( not ( = ?auto_160912 ?auto_160917 ) ) ( not ( = ?auto_160912 ?auto_160914 ) ) ( not ( = ?auto_160913 ?auto_160917 ) ) ( not ( = ?auto_160913 ?auto_160914 ) ) ( not ( = ?auto_160918 ?auto_160917 ) ) ( not ( = ?auto_160918 ?auto_160914 ) ) ( ON ?auto_160914 ?auto_160915 ) ( not ( = ?auto_160910 ?auto_160915 ) ) ( not ( = ?auto_160911 ?auto_160915 ) ) ( not ( = ?auto_160912 ?auto_160915 ) ) ( not ( = ?auto_160913 ?auto_160915 ) ) ( not ( = ?auto_160918 ?auto_160915 ) ) ( not ( = ?auto_160916 ?auto_160915 ) ) ( not ( = ?auto_160914 ?auto_160915 ) ) ( not ( = ?auto_160917 ?auto_160915 ) ) ( ON ?auto_160917 ?auto_160914 ) ( ON-TABLE ?auto_160915 ) ( ON ?auto_160916 ?auto_160917 ) ( ON ?auto_160918 ?auto_160916 ) ( ON ?auto_160913 ?auto_160918 ) ( ON ?auto_160912 ?auto_160913 ) ( CLEAR ?auto_160910 ) ( ON ?auto_160911 ?auto_160912 ) ( CLEAR ?auto_160911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_160915 ?auto_160914 ?auto_160917 ?auto_160916 ?auto_160918 ?auto_160913 ?auto_160912 )
      ( MAKE-3PILE ?auto_160910 ?auto_160911 ?auto_160912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160919 - BLOCK
      ?auto_160920 - BLOCK
      ?auto_160921 - BLOCK
    )
    :vars
    (
      ?auto_160926 - BLOCK
      ?auto_160925 - BLOCK
      ?auto_160924 - BLOCK
      ?auto_160923 - BLOCK
      ?auto_160927 - BLOCK
      ?auto_160922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160919 ?auto_160920 ) ) ( not ( = ?auto_160919 ?auto_160921 ) ) ( not ( = ?auto_160919 ?auto_160926 ) ) ( not ( = ?auto_160920 ?auto_160921 ) ) ( not ( = ?auto_160920 ?auto_160926 ) ) ( not ( = ?auto_160921 ?auto_160926 ) ) ( not ( = ?auto_160919 ?auto_160925 ) ) ( not ( = ?auto_160919 ?auto_160924 ) ) ( not ( = ?auto_160920 ?auto_160925 ) ) ( not ( = ?auto_160920 ?auto_160924 ) ) ( not ( = ?auto_160921 ?auto_160925 ) ) ( not ( = ?auto_160921 ?auto_160924 ) ) ( not ( = ?auto_160926 ?auto_160925 ) ) ( not ( = ?auto_160926 ?auto_160924 ) ) ( not ( = ?auto_160925 ?auto_160924 ) ) ( not ( = ?auto_160923 ?auto_160927 ) ) ( not ( = ?auto_160923 ?auto_160924 ) ) ( not ( = ?auto_160927 ?auto_160924 ) ) ( not ( = ?auto_160919 ?auto_160927 ) ) ( not ( = ?auto_160919 ?auto_160923 ) ) ( not ( = ?auto_160920 ?auto_160927 ) ) ( not ( = ?auto_160920 ?auto_160923 ) ) ( not ( = ?auto_160921 ?auto_160927 ) ) ( not ( = ?auto_160921 ?auto_160923 ) ) ( not ( = ?auto_160926 ?auto_160927 ) ) ( not ( = ?auto_160926 ?auto_160923 ) ) ( not ( = ?auto_160925 ?auto_160927 ) ) ( not ( = ?auto_160925 ?auto_160923 ) ) ( ON ?auto_160923 ?auto_160922 ) ( not ( = ?auto_160919 ?auto_160922 ) ) ( not ( = ?auto_160920 ?auto_160922 ) ) ( not ( = ?auto_160921 ?auto_160922 ) ) ( not ( = ?auto_160926 ?auto_160922 ) ) ( not ( = ?auto_160925 ?auto_160922 ) ) ( not ( = ?auto_160924 ?auto_160922 ) ) ( not ( = ?auto_160923 ?auto_160922 ) ) ( not ( = ?auto_160927 ?auto_160922 ) ) ( ON ?auto_160927 ?auto_160923 ) ( ON-TABLE ?auto_160922 ) ( ON ?auto_160924 ?auto_160927 ) ( ON ?auto_160925 ?auto_160924 ) ( ON ?auto_160926 ?auto_160925 ) ( ON ?auto_160921 ?auto_160926 ) ( ON ?auto_160920 ?auto_160921 ) ( CLEAR ?auto_160920 ) ( HOLDING ?auto_160919 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160919 )
      ( MAKE-3PILE ?auto_160919 ?auto_160920 ?auto_160921 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_160928 - BLOCK
      ?auto_160929 - BLOCK
      ?auto_160930 - BLOCK
    )
    :vars
    (
      ?auto_160932 - BLOCK
      ?auto_160934 - BLOCK
      ?auto_160933 - BLOCK
      ?auto_160936 - BLOCK
      ?auto_160935 - BLOCK
      ?auto_160931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160928 ?auto_160929 ) ) ( not ( = ?auto_160928 ?auto_160930 ) ) ( not ( = ?auto_160928 ?auto_160932 ) ) ( not ( = ?auto_160929 ?auto_160930 ) ) ( not ( = ?auto_160929 ?auto_160932 ) ) ( not ( = ?auto_160930 ?auto_160932 ) ) ( not ( = ?auto_160928 ?auto_160934 ) ) ( not ( = ?auto_160928 ?auto_160933 ) ) ( not ( = ?auto_160929 ?auto_160934 ) ) ( not ( = ?auto_160929 ?auto_160933 ) ) ( not ( = ?auto_160930 ?auto_160934 ) ) ( not ( = ?auto_160930 ?auto_160933 ) ) ( not ( = ?auto_160932 ?auto_160934 ) ) ( not ( = ?auto_160932 ?auto_160933 ) ) ( not ( = ?auto_160934 ?auto_160933 ) ) ( not ( = ?auto_160936 ?auto_160935 ) ) ( not ( = ?auto_160936 ?auto_160933 ) ) ( not ( = ?auto_160935 ?auto_160933 ) ) ( not ( = ?auto_160928 ?auto_160935 ) ) ( not ( = ?auto_160928 ?auto_160936 ) ) ( not ( = ?auto_160929 ?auto_160935 ) ) ( not ( = ?auto_160929 ?auto_160936 ) ) ( not ( = ?auto_160930 ?auto_160935 ) ) ( not ( = ?auto_160930 ?auto_160936 ) ) ( not ( = ?auto_160932 ?auto_160935 ) ) ( not ( = ?auto_160932 ?auto_160936 ) ) ( not ( = ?auto_160934 ?auto_160935 ) ) ( not ( = ?auto_160934 ?auto_160936 ) ) ( ON ?auto_160936 ?auto_160931 ) ( not ( = ?auto_160928 ?auto_160931 ) ) ( not ( = ?auto_160929 ?auto_160931 ) ) ( not ( = ?auto_160930 ?auto_160931 ) ) ( not ( = ?auto_160932 ?auto_160931 ) ) ( not ( = ?auto_160934 ?auto_160931 ) ) ( not ( = ?auto_160933 ?auto_160931 ) ) ( not ( = ?auto_160936 ?auto_160931 ) ) ( not ( = ?auto_160935 ?auto_160931 ) ) ( ON ?auto_160935 ?auto_160936 ) ( ON-TABLE ?auto_160931 ) ( ON ?auto_160933 ?auto_160935 ) ( ON ?auto_160934 ?auto_160933 ) ( ON ?auto_160932 ?auto_160934 ) ( ON ?auto_160930 ?auto_160932 ) ( ON ?auto_160929 ?auto_160930 ) ( ON ?auto_160928 ?auto_160929 ) ( CLEAR ?auto_160928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_160931 ?auto_160936 ?auto_160935 ?auto_160933 ?auto_160934 ?auto_160932 ?auto_160930 ?auto_160929 )
      ( MAKE-3PILE ?auto_160928 ?auto_160929 ?auto_160930 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160942 - BLOCK
      ?auto_160943 - BLOCK
      ?auto_160944 - BLOCK
      ?auto_160945 - BLOCK
      ?auto_160946 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_160946 ) ( CLEAR ?auto_160945 ) ( ON-TABLE ?auto_160942 ) ( ON ?auto_160943 ?auto_160942 ) ( ON ?auto_160944 ?auto_160943 ) ( ON ?auto_160945 ?auto_160944 ) ( not ( = ?auto_160942 ?auto_160943 ) ) ( not ( = ?auto_160942 ?auto_160944 ) ) ( not ( = ?auto_160942 ?auto_160945 ) ) ( not ( = ?auto_160942 ?auto_160946 ) ) ( not ( = ?auto_160943 ?auto_160944 ) ) ( not ( = ?auto_160943 ?auto_160945 ) ) ( not ( = ?auto_160943 ?auto_160946 ) ) ( not ( = ?auto_160944 ?auto_160945 ) ) ( not ( = ?auto_160944 ?auto_160946 ) ) ( not ( = ?auto_160945 ?auto_160946 ) ) )
    :subtasks
    ( ( !STACK ?auto_160946 ?auto_160945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160947 - BLOCK
      ?auto_160948 - BLOCK
      ?auto_160949 - BLOCK
      ?auto_160950 - BLOCK
      ?auto_160951 - BLOCK
    )
    :vars
    (
      ?auto_160952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_160950 ) ( ON-TABLE ?auto_160947 ) ( ON ?auto_160948 ?auto_160947 ) ( ON ?auto_160949 ?auto_160948 ) ( ON ?auto_160950 ?auto_160949 ) ( not ( = ?auto_160947 ?auto_160948 ) ) ( not ( = ?auto_160947 ?auto_160949 ) ) ( not ( = ?auto_160947 ?auto_160950 ) ) ( not ( = ?auto_160947 ?auto_160951 ) ) ( not ( = ?auto_160948 ?auto_160949 ) ) ( not ( = ?auto_160948 ?auto_160950 ) ) ( not ( = ?auto_160948 ?auto_160951 ) ) ( not ( = ?auto_160949 ?auto_160950 ) ) ( not ( = ?auto_160949 ?auto_160951 ) ) ( not ( = ?auto_160950 ?auto_160951 ) ) ( ON ?auto_160951 ?auto_160952 ) ( CLEAR ?auto_160951 ) ( HAND-EMPTY ) ( not ( = ?auto_160947 ?auto_160952 ) ) ( not ( = ?auto_160948 ?auto_160952 ) ) ( not ( = ?auto_160949 ?auto_160952 ) ) ( not ( = ?auto_160950 ?auto_160952 ) ) ( not ( = ?auto_160951 ?auto_160952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_160951 ?auto_160952 )
      ( MAKE-5PILE ?auto_160947 ?auto_160948 ?auto_160949 ?auto_160950 ?auto_160951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160953 - BLOCK
      ?auto_160954 - BLOCK
      ?auto_160955 - BLOCK
      ?auto_160956 - BLOCK
      ?auto_160957 - BLOCK
    )
    :vars
    (
      ?auto_160958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160953 ) ( ON ?auto_160954 ?auto_160953 ) ( ON ?auto_160955 ?auto_160954 ) ( not ( = ?auto_160953 ?auto_160954 ) ) ( not ( = ?auto_160953 ?auto_160955 ) ) ( not ( = ?auto_160953 ?auto_160956 ) ) ( not ( = ?auto_160953 ?auto_160957 ) ) ( not ( = ?auto_160954 ?auto_160955 ) ) ( not ( = ?auto_160954 ?auto_160956 ) ) ( not ( = ?auto_160954 ?auto_160957 ) ) ( not ( = ?auto_160955 ?auto_160956 ) ) ( not ( = ?auto_160955 ?auto_160957 ) ) ( not ( = ?auto_160956 ?auto_160957 ) ) ( ON ?auto_160957 ?auto_160958 ) ( CLEAR ?auto_160957 ) ( not ( = ?auto_160953 ?auto_160958 ) ) ( not ( = ?auto_160954 ?auto_160958 ) ) ( not ( = ?auto_160955 ?auto_160958 ) ) ( not ( = ?auto_160956 ?auto_160958 ) ) ( not ( = ?auto_160957 ?auto_160958 ) ) ( HOLDING ?auto_160956 ) ( CLEAR ?auto_160955 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160953 ?auto_160954 ?auto_160955 ?auto_160956 )
      ( MAKE-5PILE ?auto_160953 ?auto_160954 ?auto_160955 ?auto_160956 ?auto_160957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160959 - BLOCK
      ?auto_160960 - BLOCK
      ?auto_160961 - BLOCK
      ?auto_160962 - BLOCK
      ?auto_160963 - BLOCK
    )
    :vars
    (
      ?auto_160964 - BLOCK
      ?auto_160965 - BLOCK
      ?auto_160966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160959 ) ( ON ?auto_160960 ?auto_160959 ) ( ON ?auto_160961 ?auto_160960 ) ( not ( = ?auto_160959 ?auto_160960 ) ) ( not ( = ?auto_160959 ?auto_160961 ) ) ( not ( = ?auto_160959 ?auto_160962 ) ) ( not ( = ?auto_160959 ?auto_160963 ) ) ( not ( = ?auto_160960 ?auto_160961 ) ) ( not ( = ?auto_160960 ?auto_160962 ) ) ( not ( = ?auto_160960 ?auto_160963 ) ) ( not ( = ?auto_160961 ?auto_160962 ) ) ( not ( = ?auto_160961 ?auto_160963 ) ) ( not ( = ?auto_160962 ?auto_160963 ) ) ( ON ?auto_160963 ?auto_160964 ) ( not ( = ?auto_160959 ?auto_160964 ) ) ( not ( = ?auto_160960 ?auto_160964 ) ) ( not ( = ?auto_160961 ?auto_160964 ) ) ( not ( = ?auto_160962 ?auto_160964 ) ) ( not ( = ?auto_160963 ?auto_160964 ) ) ( CLEAR ?auto_160961 ) ( ON ?auto_160962 ?auto_160963 ) ( CLEAR ?auto_160962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_160965 ) ( ON ?auto_160966 ?auto_160965 ) ( ON ?auto_160964 ?auto_160966 ) ( not ( = ?auto_160965 ?auto_160966 ) ) ( not ( = ?auto_160965 ?auto_160964 ) ) ( not ( = ?auto_160965 ?auto_160963 ) ) ( not ( = ?auto_160965 ?auto_160962 ) ) ( not ( = ?auto_160966 ?auto_160964 ) ) ( not ( = ?auto_160966 ?auto_160963 ) ) ( not ( = ?auto_160966 ?auto_160962 ) ) ( not ( = ?auto_160959 ?auto_160965 ) ) ( not ( = ?auto_160959 ?auto_160966 ) ) ( not ( = ?auto_160960 ?auto_160965 ) ) ( not ( = ?auto_160960 ?auto_160966 ) ) ( not ( = ?auto_160961 ?auto_160965 ) ) ( not ( = ?auto_160961 ?auto_160966 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_160965 ?auto_160966 ?auto_160964 ?auto_160963 )
      ( MAKE-5PILE ?auto_160959 ?auto_160960 ?auto_160961 ?auto_160962 ?auto_160963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160967 - BLOCK
      ?auto_160968 - BLOCK
      ?auto_160969 - BLOCK
      ?auto_160970 - BLOCK
      ?auto_160971 - BLOCK
    )
    :vars
    (
      ?auto_160974 - BLOCK
      ?auto_160973 - BLOCK
      ?auto_160972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160967 ) ( ON ?auto_160968 ?auto_160967 ) ( not ( = ?auto_160967 ?auto_160968 ) ) ( not ( = ?auto_160967 ?auto_160969 ) ) ( not ( = ?auto_160967 ?auto_160970 ) ) ( not ( = ?auto_160967 ?auto_160971 ) ) ( not ( = ?auto_160968 ?auto_160969 ) ) ( not ( = ?auto_160968 ?auto_160970 ) ) ( not ( = ?auto_160968 ?auto_160971 ) ) ( not ( = ?auto_160969 ?auto_160970 ) ) ( not ( = ?auto_160969 ?auto_160971 ) ) ( not ( = ?auto_160970 ?auto_160971 ) ) ( ON ?auto_160971 ?auto_160974 ) ( not ( = ?auto_160967 ?auto_160974 ) ) ( not ( = ?auto_160968 ?auto_160974 ) ) ( not ( = ?auto_160969 ?auto_160974 ) ) ( not ( = ?auto_160970 ?auto_160974 ) ) ( not ( = ?auto_160971 ?auto_160974 ) ) ( ON ?auto_160970 ?auto_160971 ) ( CLEAR ?auto_160970 ) ( ON-TABLE ?auto_160973 ) ( ON ?auto_160972 ?auto_160973 ) ( ON ?auto_160974 ?auto_160972 ) ( not ( = ?auto_160973 ?auto_160972 ) ) ( not ( = ?auto_160973 ?auto_160974 ) ) ( not ( = ?auto_160973 ?auto_160971 ) ) ( not ( = ?auto_160973 ?auto_160970 ) ) ( not ( = ?auto_160972 ?auto_160974 ) ) ( not ( = ?auto_160972 ?auto_160971 ) ) ( not ( = ?auto_160972 ?auto_160970 ) ) ( not ( = ?auto_160967 ?auto_160973 ) ) ( not ( = ?auto_160967 ?auto_160972 ) ) ( not ( = ?auto_160968 ?auto_160973 ) ) ( not ( = ?auto_160968 ?auto_160972 ) ) ( not ( = ?auto_160969 ?auto_160973 ) ) ( not ( = ?auto_160969 ?auto_160972 ) ) ( HOLDING ?auto_160969 ) ( CLEAR ?auto_160968 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_160967 ?auto_160968 ?auto_160969 )
      ( MAKE-5PILE ?auto_160967 ?auto_160968 ?auto_160969 ?auto_160970 ?auto_160971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160975 - BLOCK
      ?auto_160976 - BLOCK
      ?auto_160977 - BLOCK
      ?auto_160978 - BLOCK
      ?auto_160979 - BLOCK
    )
    :vars
    (
      ?auto_160981 - BLOCK
      ?auto_160980 - BLOCK
      ?auto_160982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160975 ) ( ON ?auto_160976 ?auto_160975 ) ( not ( = ?auto_160975 ?auto_160976 ) ) ( not ( = ?auto_160975 ?auto_160977 ) ) ( not ( = ?auto_160975 ?auto_160978 ) ) ( not ( = ?auto_160975 ?auto_160979 ) ) ( not ( = ?auto_160976 ?auto_160977 ) ) ( not ( = ?auto_160976 ?auto_160978 ) ) ( not ( = ?auto_160976 ?auto_160979 ) ) ( not ( = ?auto_160977 ?auto_160978 ) ) ( not ( = ?auto_160977 ?auto_160979 ) ) ( not ( = ?auto_160978 ?auto_160979 ) ) ( ON ?auto_160979 ?auto_160981 ) ( not ( = ?auto_160975 ?auto_160981 ) ) ( not ( = ?auto_160976 ?auto_160981 ) ) ( not ( = ?auto_160977 ?auto_160981 ) ) ( not ( = ?auto_160978 ?auto_160981 ) ) ( not ( = ?auto_160979 ?auto_160981 ) ) ( ON ?auto_160978 ?auto_160979 ) ( ON-TABLE ?auto_160980 ) ( ON ?auto_160982 ?auto_160980 ) ( ON ?auto_160981 ?auto_160982 ) ( not ( = ?auto_160980 ?auto_160982 ) ) ( not ( = ?auto_160980 ?auto_160981 ) ) ( not ( = ?auto_160980 ?auto_160979 ) ) ( not ( = ?auto_160980 ?auto_160978 ) ) ( not ( = ?auto_160982 ?auto_160981 ) ) ( not ( = ?auto_160982 ?auto_160979 ) ) ( not ( = ?auto_160982 ?auto_160978 ) ) ( not ( = ?auto_160975 ?auto_160980 ) ) ( not ( = ?auto_160975 ?auto_160982 ) ) ( not ( = ?auto_160976 ?auto_160980 ) ) ( not ( = ?auto_160976 ?auto_160982 ) ) ( not ( = ?auto_160977 ?auto_160980 ) ) ( not ( = ?auto_160977 ?auto_160982 ) ) ( CLEAR ?auto_160976 ) ( ON ?auto_160977 ?auto_160978 ) ( CLEAR ?auto_160977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_160980 ?auto_160982 ?auto_160981 ?auto_160979 ?auto_160978 )
      ( MAKE-5PILE ?auto_160975 ?auto_160976 ?auto_160977 ?auto_160978 ?auto_160979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160983 - BLOCK
      ?auto_160984 - BLOCK
      ?auto_160985 - BLOCK
      ?auto_160986 - BLOCK
      ?auto_160987 - BLOCK
    )
    :vars
    (
      ?auto_160988 - BLOCK
      ?auto_160990 - BLOCK
      ?auto_160989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160983 ) ( not ( = ?auto_160983 ?auto_160984 ) ) ( not ( = ?auto_160983 ?auto_160985 ) ) ( not ( = ?auto_160983 ?auto_160986 ) ) ( not ( = ?auto_160983 ?auto_160987 ) ) ( not ( = ?auto_160984 ?auto_160985 ) ) ( not ( = ?auto_160984 ?auto_160986 ) ) ( not ( = ?auto_160984 ?auto_160987 ) ) ( not ( = ?auto_160985 ?auto_160986 ) ) ( not ( = ?auto_160985 ?auto_160987 ) ) ( not ( = ?auto_160986 ?auto_160987 ) ) ( ON ?auto_160987 ?auto_160988 ) ( not ( = ?auto_160983 ?auto_160988 ) ) ( not ( = ?auto_160984 ?auto_160988 ) ) ( not ( = ?auto_160985 ?auto_160988 ) ) ( not ( = ?auto_160986 ?auto_160988 ) ) ( not ( = ?auto_160987 ?auto_160988 ) ) ( ON ?auto_160986 ?auto_160987 ) ( ON-TABLE ?auto_160990 ) ( ON ?auto_160989 ?auto_160990 ) ( ON ?auto_160988 ?auto_160989 ) ( not ( = ?auto_160990 ?auto_160989 ) ) ( not ( = ?auto_160990 ?auto_160988 ) ) ( not ( = ?auto_160990 ?auto_160987 ) ) ( not ( = ?auto_160990 ?auto_160986 ) ) ( not ( = ?auto_160989 ?auto_160988 ) ) ( not ( = ?auto_160989 ?auto_160987 ) ) ( not ( = ?auto_160989 ?auto_160986 ) ) ( not ( = ?auto_160983 ?auto_160990 ) ) ( not ( = ?auto_160983 ?auto_160989 ) ) ( not ( = ?auto_160984 ?auto_160990 ) ) ( not ( = ?auto_160984 ?auto_160989 ) ) ( not ( = ?auto_160985 ?auto_160990 ) ) ( not ( = ?auto_160985 ?auto_160989 ) ) ( ON ?auto_160985 ?auto_160986 ) ( CLEAR ?auto_160985 ) ( HOLDING ?auto_160984 ) ( CLEAR ?auto_160983 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_160983 ?auto_160984 )
      ( MAKE-5PILE ?auto_160983 ?auto_160984 ?auto_160985 ?auto_160986 ?auto_160987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160991 - BLOCK
      ?auto_160992 - BLOCK
      ?auto_160993 - BLOCK
      ?auto_160994 - BLOCK
      ?auto_160995 - BLOCK
    )
    :vars
    (
      ?auto_160998 - BLOCK
      ?auto_160996 - BLOCK
      ?auto_160997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_160991 ) ( not ( = ?auto_160991 ?auto_160992 ) ) ( not ( = ?auto_160991 ?auto_160993 ) ) ( not ( = ?auto_160991 ?auto_160994 ) ) ( not ( = ?auto_160991 ?auto_160995 ) ) ( not ( = ?auto_160992 ?auto_160993 ) ) ( not ( = ?auto_160992 ?auto_160994 ) ) ( not ( = ?auto_160992 ?auto_160995 ) ) ( not ( = ?auto_160993 ?auto_160994 ) ) ( not ( = ?auto_160993 ?auto_160995 ) ) ( not ( = ?auto_160994 ?auto_160995 ) ) ( ON ?auto_160995 ?auto_160998 ) ( not ( = ?auto_160991 ?auto_160998 ) ) ( not ( = ?auto_160992 ?auto_160998 ) ) ( not ( = ?auto_160993 ?auto_160998 ) ) ( not ( = ?auto_160994 ?auto_160998 ) ) ( not ( = ?auto_160995 ?auto_160998 ) ) ( ON ?auto_160994 ?auto_160995 ) ( ON-TABLE ?auto_160996 ) ( ON ?auto_160997 ?auto_160996 ) ( ON ?auto_160998 ?auto_160997 ) ( not ( = ?auto_160996 ?auto_160997 ) ) ( not ( = ?auto_160996 ?auto_160998 ) ) ( not ( = ?auto_160996 ?auto_160995 ) ) ( not ( = ?auto_160996 ?auto_160994 ) ) ( not ( = ?auto_160997 ?auto_160998 ) ) ( not ( = ?auto_160997 ?auto_160995 ) ) ( not ( = ?auto_160997 ?auto_160994 ) ) ( not ( = ?auto_160991 ?auto_160996 ) ) ( not ( = ?auto_160991 ?auto_160997 ) ) ( not ( = ?auto_160992 ?auto_160996 ) ) ( not ( = ?auto_160992 ?auto_160997 ) ) ( not ( = ?auto_160993 ?auto_160996 ) ) ( not ( = ?auto_160993 ?auto_160997 ) ) ( ON ?auto_160993 ?auto_160994 ) ( CLEAR ?auto_160991 ) ( ON ?auto_160992 ?auto_160993 ) ( CLEAR ?auto_160992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_160996 ?auto_160997 ?auto_160998 ?auto_160995 ?auto_160994 ?auto_160993 )
      ( MAKE-5PILE ?auto_160991 ?auto_160992 ?auto_160993 ?auto_160994 ?auto_160995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_160999 - BLOCK
      ?auto_161000 - BLOCK
      ?auto_161001 - BLOCK
      ?auto_161002 - BLOCK
      ?auto_161003 - BLOCK
    )
    :vars
    (
      ?auto_161005 - BLOCK
      ?auto_161004 - BLOCK
      ?auto_161006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_160999 ?auto_161000 ) ) ( not ( = ?auto_160999 ?auto_161001 ) ) ( not ( = ?auto_160999 ?auto_161002 ) ) ( not ( = ?auto_160999 ?auto_161003 ) ) ( not ( = ?auto_161000 ?auto_161001 ) ) ( not ( = ?auto_161000 ?auto_161002 ) ) ( not ( = ?auto_161000 ?auto_161003 ) ) ( not ( = ?auto_161001 ?auto_161002 ) ) ( not ( = ?auto_161001 ?auto_161003 ) ) ( not ( = ?auto_161002 ?auto_161003 ) ) ( ON ?auto_161003 ?auto_161005 ) ( not ( = ?auto_160999 ?auto_161005 ) ) ( not ( = ?auto_161000 ?auto_161005 ) ) ( not ( = ?auto_161001 ?auto_161005 ) ) ( not ( = ?auto_161002 ?auto_161005 ) ) ( not ( = ?auto_161003 ?auto_161005 ) ) ( ON ?auto_161002 ?auto_161003 ) ( ON-TABLE ?auto_161004 ) ( ON ?auto_161006 ?auto_161004 ) ( ON ?auto_161005 ?auto_161006 ) ( not ( = ?auto_161004 ?auto_161006 ) ) ( not ( = ?auto_161004 ?auto_161005 ) ) ( not ( = ?auto_161004 ?auto_161003 ) ) ( not ( = ?auto_161004 ?auto_161002 ) ) ( not ( = ?auto_161006 ?auto_161005 ) ) ( not ( = ?auto_161006 ?auto_161003 ) ) ( not ( = ?auto_161006 ?auto_161002 ) ) ( not ( = ?auto_160999 ?auto_161004 ) ) ( not ( = ?auto_160999 ?auto_161006 ) ) ( not ( = ?auto_161000 ?auto_161004 ) ) ( not ( = ?auto_161000 ?auto_161006 ) ) ( not ( = ?auto_161001 ?auto_161004 ) ) ( not ( = ?auto_161001 ?auto_161006 ) ) ( ON ?auto_161001 ?auto_161002 ) ( ON ?auto_161000 ?auto_161001 ) ( CLEAR ?auto_161000 ) ( HOLDING ?auto_160999 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_160999 )
      ( MAKE-5PILE ?auto_160999 ?auto_161000 ?auto_161001 ?auto_161002 ?auto_161003 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161007 - BLOCK
      ?auto_161008 - BLOCK
      ?auto_161009 - BLOCK
      ?auto_161010 - BLOCK
      ?auto_161011 - BLOCK
    )
    :vars
    (
      ?auto_161014 - BLOCK
      ?auto_161013 - BLOCK
      ?auto_161012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161007 ?auto_161008 ) ) ( not ( = ?auto_161007 ?auto_161009 ) ) ( not ( = ?auto_161007 ?auto_161010 ) ) ( not ( = ?auto_161007 ?auto_161011 ) ) ( not ( = ?auto_161008 ?auto_161009 ) ) ( not ( = ?auto_161008 ?auto_161010 ) ) ( not ( = ?auto_161008 ?auto_161011 ) ) ( not ( = ?auto_161009 ?auto_161010 ) ) ( not ( = ?auto_161009 ?auto_161011 ) ) ( not ( = ?auto_161010 ?auto_161011 ) ) ( ON ?auto_161011 ?auto_161014 ) ( not ( = ?auto_161007 ?auto_161014 ) ) ( not ( = ?auto_161008 ?auto_161014 ) ) ( not ( = ?auto_161009 ?auto_161014 ) ) ( not ( = ?auto_161010 ?auto_161014 ) ) ( not ( = ?auto_161011 ?auto_161014 ) ) ( ON ?auto_161010 ?auto_161011 ) ( ON-TABLE ?auto_161013 ) ( ON ?auto_161012 ?auto_161013 ) ( ON ?auto_161014 ?auto_161012 ) ( not ( = ?auto_161013 ?auto_161012 ) ) ( not ( = ?auto_161013 ?auto_161014 ) ) ( not ( = ?auto_161013 ?auto_161011 ) ) ( not ( = ?auto_161013 ?auto_161010 ) ) ( not ( = ?auto_161012 ?auto_161014 ) ) ( not ( = ?auto_161012 ?auto_161011 ) ) ( not ( = ?auto_161012 ?auto_161010 ) ) ( not ( = ?auto_161007 ?auto_161013 ) ) ( not ( = ?auto_161007 ?auto_161012 ) ) ( not ( = ?auto_161008 ?auto_161013 ) ) ( not ( = ?auto_161008 ?auto_161012 ) ) ( not ( = ?auto_161009 ?auto_161013 ) ) ( not ( = ?auto_161009 ?auto_161012 ) ) ( ON ?auto_161009 ?auto_161010 ) ( ON ?auto_161008 ?auto_161009 ) ( ON ?auto_161007 ?auto_161008 ) ( CLEAR ?auto_161007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161013 ?auto_161012 ?auto_161014 ?auto_161011 ?auto_161010 ?auto_161009 ?auto_161008 )
      ( MAKE-5PILE ?auto_161007 ?auto_161008 ?auto_161009 ?auto_161010 ?auto_161011 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161015 - BLOCK
      ?auto_161016 - BLOCK
      ?auto_161017 - BLOCK
      ?auto_161018 - BLOCK
      ?auto_161019 - BLOCK
    )
    :vars
    (
      ?auto_161020 - BLOCK
      ?auto_161022 - BLOCK
      ?auto_161021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161015 ?auto_161016 ) ) ( not ( = ?auto_161015 ?auto_161017 ) ) ( not ( = ?auto_161015 ?auto_161018 ) ) ( not ( = ?auto_161015 ?auto_161019 ) ) ( not ( = ?auto_161016 ?auto_161017 ) ) ( not ( = ?auto_161016 ?auto_161018 ) ) ( not ( = ?auto_161016 ?auto_161019 ) ) ( not ( = ?auto_161017 ?auto_161018 ) ) ( not ( = ?auto_161017 ?auto_161019 ) ) ( not ( = ?auto_161018 ?auto_161019 ) ) ( ON ?auto_161019 ?auto_161020 ) ( not ( = ?auto_161015 ?auto_161020 ) ) ( not ( = ?auto_161016 ?auto_161020 ) ) ( not ( = ?auto_161017 ?auto_161020 ) ) ( not ( = ?auto_161018 ?auto_161020 ) ) ( not ( = ?auto_161019 ?auto_161020 ) ) ( ON ?auto_161018 ?auto_161019 ) ( ON-TABLE ?auto_161022 ) ( ON ?auto_161021 ?auto_161022 ) ( ON ?auto_161020 ?auto_161021 ) ( not ( = ?auto_161022 ?auto_161021 ) ) ( not ( = ?auto_161022 ?auto_161020 ) ) ( not ( = ?auto_161022 ?auto_161019 ) ) ( not ( = ?auto_161022 ?auto_161018 ) ) ( not ( = ?auto_161021 ?auto_161020 ) ) ( not ( = ?auto_161021 ?auto_161019 ) ) ( not ( = ?auto_161021 ?auto_161018 ) ) ( not ( = ?auto_161015 ?auto_161022 ) ) ( not ( = ?auto_161015 ?auto_161021 ) ) ( not ( = ?auto_161016 ?auto_161022 ) ) ( not ( = ?auto_161016 ?auto_161021 ) ) ( not ( = ?auto_161017 ?auto_161022 ) ) ( not ( = ?auto_161017 ?auto_161021 ) ) ( ON ?auto_161017 ?auto_161018 ) ( ON ?auto_161016 ?auto_161017 ) ( HOLDING ?auto_161015 ) ( CLEAR ?auto_161016 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161022 ?auto_161021 ?auto_161020 ?auto_161019 ?auto_161018 ?auto_161017 ?auto_161016 ?auto_161015 )
      ( MAKE-5PILE ?auto_161015 ?auto_161016 ?auto_161017 ?auto_161018 ?auto_161019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161023 - BLOCK
      ?auto_161024 - BLOCK
      ?auto_161025 - BLOCK
      ?auto_161026 - BLOCK
      ?auto_161027 - BLOCK
    )
    :vars
    (
      ?auto_161028 - BLOCK
      ?auto_161030 - BLOCK
      ?auto_161029 - BLOCK
      ?auto_161031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161023 ?auto_161024 ) ) ( not ( = ?auto_161023 ?auto_161025 ) ) ( not ( = ?auto_161023 ?auto_161026 ) ) ( not ( = ?auto_161023 ?auto_161027 ) ) ( not ( = ?auto_161024 ?auto_161025 ) ) ( not ( = ?auto_161024 ?auto_161026 ) ) ( not ( = ?auto_161024 ?auto_161027 ) ) ( not ( = ?auto_161025 ?auto_161026 ) ) ( not ( = ?auto_161025 ?auto_161027 ) ) ( not ( = ?auto_161026 ?auto_161027 ) ) ( ON ?auto_161027 ?auto_161028 ) ( not ( = ?auto_161023 ?auto_161028 ) ) ( not ( = ?auto_161024 ?auto_161028 ) ) ( not ( = ?auto_161025 ?auto_161028 ) ) ( not ( = ?auto_161026 ?auto_161028 ) ) ( not ( = ?auto_161027 ?auto_161028 ) ) ( ON ?auto_161026 ?auto_161027 ) ( ON-TABLE ?auto_161030 ) ( ON ?auto_161029 ?auto_161030 ) ( ON ?auto_161028 ?auto_161029 ) ( not ( = ?auto_161030 ?auto_161029 ) ) ( not ( = ?auto_161030 ?auto_161028 ) ) ( not ( = ?auto_161030 ?auto_161027 ) ) ( not ( = ?auto_161030 ?auto_161026 ) ) ( not ( = ?auto_161029 ?auto_161028 ) ) ( not ( = ?auto_161029 ?auto_161027 ) ) ( not ( = ?auto_161029 ?auto_161026 ) ) ( not ( = ?auto_161023 ?auto_161030 ) ) ( not ( = ?auto_161023 ?auto_161029 ) ) ( not ( = ?auto_161024 ?auto_161030 ) ) ( not ( = ?auto_161024 ?auto_161029 ) ) ( not ( = ?auto_161025 ?auto_161030 ) ) ( not ( = ?auto_161025 ?auto_161029 ) ) ( ON ?auto_161025 ?auto_161026 ) ( ON ?auto_161024 ?auto_161025 ) ( CLEAR ?auto_161024 ) ( ON ?auto_161023 ?auto_161031 ) ( CLEAR ?auto_161023 ) ( HAND-EMPTY ) ( not ( = ?auto_161023 ?auto_161031 ) ) ( not ( = ?auto_161024 ?auto_161031 ) ) ( not ( = ?auto_161025 ?auto_161031 ) ) ( not ( = ?auto_161026 ?auto_161031 ) ) ( not ( = ?auto_161027 ?auto_161031 ) ) ( not ( = ?auto_161028 ?auto_161031 ) ) ( not ( = ?auto_161030 ?auto_161031 ) ) ( not ( = ?auto_161029 ?auto_161031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161023 ?auto_161031 )
      ( MAKE-5PILE ?auto_161023 ?auto_161024 ?auto_161025 ?auto_161026 ?auto_161027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161032 - BLOCK
      ?auto_161033 - BLOCK
      ?auto_161034 - BLOCK
      ?auto_161035 - BLOCK
      ?auto_161036 - BLOCK
    )
    :vars
    (
      ?auto_161038 - BLOCK
      ?auto_161039 - BLOCK
      ?auto_161040 - BLOCK
      ?auto_161037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161032 ?auto_161033 ) ) ( not ( = ?auto_161032 ?auto_161034 ) ) ( not ( = ?auto_161032 ?auto_161035 ) ) ( not ( = ?auto_161032 ?auto_161036 ) ) ( not ( = ?auto_161033 ?auto_161034 ) ) ( not ( = ?auto_161033 ?auto_161035 ) ) ( not ( = ?auto_161033 ?auto_161036 ) ) ( not ( = ?auto_161034 ?auto_161035 ) ) ( not ( = ?auto_161034 ?auto_161036 ) ) ( not ( = ?auto_161035 ?auto_161036 ) ) ( ON ?auto_161036 ?auto_161038 ) ( not ( = ?auto_161032 ?auto_161038 ) ) ( not ( = ?auto_161033 ?auto_161038 ) ) ( not ( = ?auto_161034 ?auto_161038 ) ) ( not ( = ?auto_161035 ?auto_161038 ) ) ( not ( = ?auto_161036 ?auto_161038 ) ) ( ON ?auto_161035 ?auto_161036 ) ( ON-TABLE ?auto_161039 ) ( ON ?auto_161040 ?auto_161039 ) ( ON ?auto_161038 ?auto_161040 ) ( not ( = ?auto_161039 ?auto_161040 ) ) ( not ( = ?auto_161039 ?auto_161038 ) ) ( not ( = ?auto_161039 ?auto_161036 ) ) ( not ( = ?auto_161039 ?auto_161035 ) ) ( not ( = ?auto_161040 ?auto_161038 ) ) ( not ( = ?auto_161040 ?auto_161036 ) ) ( not ( = ?auto_161040 ?auto_161035 ) ) ( not ( = ?auto_161032 ?auto_161039 ) ) ( not ( = ?auto_161032 ?auto_161040 ) ) ( not ( = ?auto_161033 ?auto_161039 ) ) ( not ( = ?auto_161033 ?auto_161040 ) ) ( not ( = ?auto_161034 ?auto_161039 ) ) ( not ( = ?auto_161034 ?auto_161040 ) ) ( ON ?auto_161034 ?auto_161035 ) ( ON ?auto_161032 ?auto_161037 ) ( CLEAR ?auto_161032 ) ( not ( = ?auto_161032 ?auto_161037 ) ) ( not ( = ?auto_161033 ?auto_161037 ) ) ( not ( = ?auto_161034 ?auto_161037 ) ) ( not ( = ?auto_161035 ?auto_161037 ) ) ( not ( = ?auto_161036 ?auto_161037 ) ) ( not ( = ?auto_161038 ?auto_161037 ) ) ( not ( = ?auto_161039 ?auto_161037 ) ) ( not ( = ?auto_161040 ?auto_161037 ) ) ( HOLDING ?auto_161033 ) ( CLEAR ?auto_161034 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161039 ?auto_161040 ?auto_161038 ?auto_161036 ?auto_161035 ?auto_161034 ?auto_161033 )
      ( MAKE-5PILE ?auto_161032 ?auto_161033 ?auto_161034 ?auto_161035 ?auto_161036 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161041 - BLOCK
      ?auto_161042 - BLOCK
      ?auto_161043 - BLOCK
      ?auto_161044 - BLOCK
      ?auto_161045 - BLOCK
    )
    :vars
    (
      ?auto_161047 - BLOCK
      ?auto_161046 - BLOCK
      ?auto_161048 - BLOCK
      ?auto_161049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161041 ?auto_161042 ) ) ( not ( = ?auto_161041 ?auto_161043 ) ) ( not ( = ?auto_161041 ?auto_161044 ) ) ( not ( = ?auto_161041 ?auto_161045 ) ) ( not ( = ?auto_161042 ?auto_161043 ) ) ( not ( = ?auto_161042 ?auto_161044 ) ) ( not ( = ?auto_161042 ?auto_161045 ) ) ( not ( = ?auto_161043 ?auto_161044 ) ) ( not ( = ?auto_161043 ?auto_161045 ) ) ( not ( = ?auto_161044 ?auto_161045 ) ) ( ON ?auto_161045 ?auto_161047 ) ( not ( = ?auto_161041 ?auto_161047 ) ) ( not ( = ?auto_161042 ?auto_161047 ) ) ( not ( = ?auto_161043 ?auto_161047 ) ) ( not ( = ?auto_161044 ?auto_161047 ) ) ( not ( = ?auto_161045 ?auto_161047 ) ) ( ON ?auto_161044 ?auto_161045 ) ( ON-TABLE ?auto_161046 ) ( ON ?auto_161048 ?auto_161046 ) ( ON ?auto_161047 ?auto_161048 ) ( not ( = ?auto_161046 ?auto_161048 ) ) ( not ( = ?auto_161046 ?auto_161047 ) ) ( not ( = ?auto_161046 ?auto_161045 ) ) ( not ( = ?auto_161046 ?auto_161044 ) ) ( not ( = ?auto_161048 ?auto_161047 ) ) ( not ( = ?auto_161048 ?auto_161045 ) ) ( not ( = ?auto_161048 ?auto_161044 ) ) ( not ( = ?auto_161041 ?auto_161046 ) ) ( not ( = ?auto_161041 ?auto_161048 ) ) ( not ( = ?auto_161042 ?auto_161046 ) ) ( not ( = ?auto_161042 ?auto_161048 ) ) ( not ( = ?auto_161043 ?auto_161046 ) ) ( not ( = ?auto_161043 ?auto_161048 ) ) ( ON ?auto_161043 ?auto_161044 ) ( ON ?auto_161041 ?auto_161049 ) ( not ( = ?auto_161041 ?auto_161049 ) ) ( not ( = ?auto_161042 ?auto_161049 ) ) ( not ( = ?auto_161043 ?auto_161049 ) ) ( not ( = ?auto_161044 ?auto_161049 ) ) ( not ( = ?auto_161045 ?auto_161049 ) ) ( not ( = ?auto_161047 ?auto_161049 ) ) ( not ( = ?auto_161046 ?auto_161049 ) ) ( not ( = ?auto_161048 ?auto_161049 ) ) ( CLEAR ?auto_161043 ) ( ON ?auto_161042 ?auto_161041 ) ( CLEAR ?auto_161042 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161049 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161049 ?auto_161041 )
      ( MAKE-5PILE ?auto_161041 ?auto_161042 ?auto_161043 ?auto_161044 ?auto_161045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161050 - BLOCK
      ?auto_161051 - BLOCK
      ?auto_161052 - BLOCK
      ?auto_161053 - BLOCK
      ?auto_161054 - BLOCK
    )
    :vars
    (
      ?auto_161058 - BLOCK
      ?auto_161056 - BLOCK
      ?auto_161057 - BLOCK
      ?auto_161055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161050 ?auto_161051 ) ) ( not ( = ?auto_161050 ?auto_161052 ) ) ( not ( = ?auto_161050 ?auto_161053 ) ) ( not ( = ?auto_161050 ?auto_161054 ) ) ( not ( = ?auto_161051 ?auto_161052 ) ) ( not ( = ?auto_161051 ?auto_161053 ) ) ( not ( = ?auto_161051 ?auto_161054 ) ) ( not ( = ?auto_161052 ?auto_161053 ) ) ( not ( = ?auto_161052 ?auto_161054 ) ) ( not ( = ?auto_161053 ?auto_161054 ) ) ( ON ?auto_161054 ?auto_161058 ) ( not ( = ?auto_161050 ?auto_161058 ) ) ( not ( = ?auto_161051 ?auto_161058 ) ) ( not ( = ?auto_161052 ?auto_161058 ) ) ( not ( = ?auto_161053 ?auto_161058 ) ) ( not ( = ?auto_161054 ?auto_161058 ) ) ( ON ?auto_161053 ?auto_161054 ) ( ON-TABLE ?auto_161056 ) ( ON ?auto_161057 ?auto_161056 ) ( ON ?auto_161058 ?auto_161057 ) ( not ( = ?auto_161056 ?auto_161057 ) ) ( not ( = ?auto_161056 ?auto_161058 ) ) ( not ( = ?auto_161056 ?auto_161054 ) ) ( not ( = ?auto_161056 ?auto_161053 ) ) ( not ( = ?auto_161057 ?auto_161058 ) ) ( not ( = ?auto_161057 ?auto_161054 ) ) ( not ( = ?auto_161057 ?auto_161053 ) ) ( not ( = ?auto_161050 ?auto_161056 ) ) ( not ( = ?auto_161050 ?auto_161057 ) ) ( not ( = ?auto_161051 ?auto_161056 ) ) ( not ( = ?auto_161051 ?auto_161057 ) ) ( not ( = ?auto_161052 ?auto_161056 ) ) ( not ( = ?auto_161052 ?auto_161057 ) ) ( ON ?auto_161050 ?auto_161055 ) ( not ( = ?auto_161050 ?auto_161055 ) ) ( not ( = ?auto_161051 ?auto_161055 ) ) ( not ( = ?auto_161052 ?auto_161055 ) ) ( not ( = ?auto_161053 ?auto_161055 ) ) ( not ( = ?auto_161054 ?auto_161055 ) ) ( not ( = ?auto_161058 ?auto_161055 ) ) ( not ( = ?auto_161056 ?auto_161055 ) ) ( not ( = ?auto_161057 ?auto_161055 ) ) ( ON ?auto_161051 ?auto_161050 ) ( CLEAR ?auto_161051 ) ( ON-TABLE ?auto_161055 ) ( HOLDING ?auto_161052 ) ( CLEAR ?auto_161053 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161056 ?auto_161057 ?auto_161058 ?auto_161054 ?auto_161053 ?auto_161052 )
      ( MAKE-5PILE ?auto_161050 ?auto_161051 ?auto_161052 ?auto_161053 ?auto_161054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161059 - BLOCK
      ?auto_161060 - BLOCK
      ?auto_161061 - BLOCK
      ?auto_161062 - BLOCK
      ?auto_161063 - BLOCK
    )
    :vars
    (
      ?auto_161064 - BLOCK
      ?auto_161066 - BLOCK
      ?auto_161065 - BLOCK
      ?auto_161067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161059 ?auto_161060 ) ) ( not ( = ?auto_161059 ?auto_161061 ) ) ( not ( = ?auto_161059 ?auto_161062 ) ) ( not ( = ?auto_161059 ?auto_161063 ) ) ( not ( = ?auto_161060 ?auto_161061 ) ) ( not ( = ?auto_161060 ?auto_161062 ) ) ( not ( = ?auto_161060 ?auto_161063 ) ) ( not ( = ?auto_161061 ?auto_161062 ) ) ( not ( = ?auto_161061 ?auto_161063 ) ) ( not ( = ?auto_161062 ?auto_161063 ) ) ( ON ?auto_161063 ?auto_161064 ) ( not ( = ?auto_161059 ?auto_161064 ) ) ( not ( = ?auto_161060 ?auto_161064 ) ) ( not ( = ?auto_161061 ?auto_161064 ) ) ( not ( = ?auto_161062 ?auto_161064 ) ) ( not ( = ?auto_161063 ?auto_161064 ) ) ( ON ?auto_161062 ?auto_161063 ) ( ON-TABLE ?auto_161066 ) ( ON ?auto_161065 ?auto_161066 ) ( ON ?auto_161064 ?auto_161065 ) ( not ( = ?auto_161066 ?auto_161065 ) ) ( not ( = ?auto_161066 ?auto_161064 ) ) ( not ( = ?auto_161066 ?auto_161063 ) ) ( not ( = ?auto_161066 ?auto_161062 ) ) ( not ( = ?auto_161065 ?auto_161064 ) ) ( not ( = ?auto_161065 ?auto_161063 ) ) ( not ( = ?auto_161065 ?auto_161062 ) ) ( not ( = ?auto_161059 ?auto_161066 ) ) ( not ( = ?auto_161059 ?auto_161065 ) ) ( not ( = ?auto_161060 ?auto_161066 ) ) ( not ( = ?auto_161060 ?auto_161065 ) ) ( not ( = ?auto_161061 ?auto_161066 ) ) ( not ( = ?auto_161061 ?auto_161065 ) ) ( ON ?auto_161059 ?auto_161067 ) ( not ( = ?auto_161059 ?auto_161067 ) ) ( not ( = ?auto_161060 ?auto_161067 ) ) ( not ( = ?auto_161061 ?auto_161067 ) ) ( not ( = ?auto_161062 ?auto_161067 ) ) ( not ( = ?auto_161063 ?auto_161067 ) ) ( not ( = ?auto_161064 ?auto_161067 ) ) ( not ( = ?auto_161066 ?auto_161067 ) ) ( not ( = ?auto_161065 ?auto_161067 ) ) ( ON ?auto_161060 ?auto_161059 ) ( ON-TABLE ?auto_161067 ) ( CLEAR ?auto_161062 ) ( ON ?auto_161061 ?auto_161060 ) ( CLEAR ?auto_161061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161067 ?auto_161059 ?auto_161060 )
      ( MAKE-5PILE ?auto_161059 ?auto_161060 ?auto_161061 ?auto_161062 ?auto_161063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161068 - BLOCK
      ?auto_161069 - BLOCK
      ?auto_161070 - BLOCK
      ?auto_161071 - BLOCK
      ?auto_161072 - BLOCK
    )
    :vars
    (
      ?auto_161076 - BLOCK
      ?auto_161074 - BLOCK
      ?auto_161073 - BLOCK
      ?auto_161075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161068 ?auto_161069 ) ) ( not ( = ?auto_161068 ?auto_161070 ) ) ( not ( = ?auto_161068 ?auto_161071 ) ) ( not ( = ?auto_161068 ?auto_161072 ) ) ( not ( = ?auto_161069 ?auto_161070 ) ) ( not ( = ?auto_161069 ?auto_161071 ) ) ( not ( = ?auto_161069 ?auto_161072 ) ) ( not ( = ?auto_161070 ?auto_161071 ) ) ( not ( = ?auto_161070 ?auto_161072 ) ) ( not ( = ?auto_161071 ?auto_161072 ) ) ( ON ?auto_161072 ?auto_161076 ) ( not ( = ?auto_161068 ?auto_161076 ) ) ( not ( = ?auto_161069 ?auto_161076 ) ) ( not ( = ?auto_161070 ?auto_161076 ) ) ( not ( = ?auto_161071 ?auto_161076 ) ) ( not ( = ?auto_161072 ?auto_161076 ) ) ( ON-TABLE ?auto_161074 ) ( ON ?auto_161073 ?auto_161074 ) ( ON ?auto_161076 ?auto_161073 ) ( not ( = ?auto_161074 ?auto_161073 ) ) ( not ( = ?auto_161074 ?auto_161076 ) ) ( not ( = ?auto_161074 ?auto_161072 ) ) ( not ( = ?auto_161074 ?auto_161071 ) ) ( not ( = ?auto_161073 ?auto_161076 ) ) ( not ( = ?auto_161073 ?auto_161072 ) ) ( not ( = ?auto_161073 ?auto_161071 ) ) ( not ( = ?auto_161068 ?auto_161074 ) ) ( not ( = ?auto_161068 ?auto_161073 ) ) ( not ( = ?auto_161069 ?auto_161074 ) ) ( not ( = ?auto_161069 ?auto_161073 ) ) ( not ( = ?auto_161070 ?auto_161074 ) ) ( not ( = ?auto_161070 ?auto_161073 ) ) ( ON ?auto_161068 ?auto_161075 ) ( not ( = ?auto_161068 ?auto_161075 ) ) ( not ( = ?auto_161069 ?auto_161075 ) ) ( not ( = ?auto_161070 ?auto_161075 ) ) ( not ( = ?auto_161071 ?auto_161075 ) ) ( not ( = ?auto_161072 ?auto_161075 ) ) ( not ( = ?auto_161076 ?auto_161075 ) ) ( not ( = ?auto_161074 ?auto_161075 ) ) ( not ( = ?auto_161073 ?auto_161075 ) ) ( ON ?auto_161069 ?auto_161068 ) ( ON-TABLE ?auto_161075 ) ( ON ?auto_161070 ?auto_161069 ) ( CLEAR ?auto_161070 ) ( HOLDING ?auto_161071 ) ( CLEAR ?auto_161072 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161074 ?auto_161073 ?auto_161076 ?auto_161072 ?auto_161071 )
      ( MAKE-5PILE ?auto_161068 ?auto_161069 ?auto_161070 ?auto_161071 ?auto_161072 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161077 - BLOCK
      ?auto_161078 - BLOCK
      ?auto_161079 - BLOCK
      ?auto_161080 - BLOCK
      ?auto_161081 - BLOCK
    )
    :vars
    (
      ?auto_161085 - BLOCK
      ?auto_161084 - BLOCK
      ?auto_161082 - BLOCK
      ?auto_161083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161077 ?auto_161078 ) ) ( not ( = ?auto_161077 ?auto_161079 ) ) ( not ( = ?auto_161077 ?auto_161080 ) ) ( not ( = ?auto_161077 ?auto_161081 ) ) ( not ( = ?auto_161078 ?auto_161079 ) ) ( not ( = ?auto_161078 ?auto_161080 ) ) ( not ( = ?auto_161078 ?auto_161081 ) ) ( not ( = ?auto_161079 ?auto_161080 ) ) ( not ( = ?auto_161079 ?auto_161081 ) ) ( not ( = ?auto_161080 ?auto_161081 ) ) ( ON ?auto_161081 ?auto_161085 ) ( not ( = ?auto_161077 ?auto_161085 ) ) ( not ( = ?auto_161078 ?auto_161085 ) ) ( not ( = ?auto_161079 ?auto_161085 ) ) ( not ( = ?auto_161080 ?auto_161085 ) ) ( not ( = ?auto_161081 ?auto_161085 ) ) ( ON-TABLE ?auto_161084 ) ( ON ?auto_161082 ?auto_161084 ) ( ON ?auto_161085 ?auto_161082 ) ( not ( = ?auto_161084 ?auto_161082 ) ) ( not ( = ?auto_161084 ?auto_161085 ) ) ( not ( = ?auto_161084 ?auto_161081 ) ) ( not ( = ?auto_161084 ?auto_161080 ) ) ( not ( = ?auto_161082 ?auto_161085 ) ) ( not ( = ?auto_161082 ?auto_161081 ) ) ( not ( = ?auto_161082 ?auto_161080 ) ) ( not ( = ?auto_161077 ?auto_161084 ) ) ( not ( = ?auto_161077 ?auto_161082 ) ) ( not ( = ?auto_161078 ?auto_161084 ) ) ( not ( = ?auto_161078 ?auto_161082 ) ) ( not ( = ?auto_161079 ?auto_161084 ) ) ( not ( = ?auto_161079 ?auto_161082 ) ) ( ON ?auto_161077 ?auto_161083 ) ( not ( = ?auto_161077 ?auto_161083 ) ) ( not ( = ?auto_161078 ?auto_161083 ) ) ( not ( = ?auto_161079 ?auto_161083 ) ) ( not ( = ?auto_161080 ?auto_161083 ) ) ( not ( = ?auto_161081 ?auto_161083 ) ) ( not ( = ?auto_161085 ?auto_161083 ) ) ( not ( = ?auto_161084 ?auto_161083 ) ) ( not ( = ?auto_161082 ?auto_161083 ) ) ( ON ?auto_161078 ?auto_161077 ) ( ON-TABLE ?auto_161083 ) ( ON ?auto_161079 ?auto_161078 ) ( CLEAR ?auto_161081 ) ( ON ?auto_161080 ?auto_161079 ) ( CLEAR ?auto_161080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161083 ?auto_161077 ?auto_161078 ?auto_161079 )
      ( MAKE-5PILE ?auto_161077 ?auto_161078 ?auto_161079 ?auto_161080 ?auto_161081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161086 - BLOCK
      ?auto_161087 - BLOCK
      ?auto_161088 - BLOCK
      ?auto_161089 - BLOCK
      ?auto_161090 - BLOCK
    )
    :vars
    (
      ?auto_161092 - BLOCK
      ?auto_161094 - BLOCK
      ?auto_161091 - BLOCK
      ?auto_161093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161086 ?auto_161087 ) ) ( not ( = ?auto_161086 ?auto_161088 ) ) ( not ( = ?auto_161086 ?auto_161089 ) ) ( not ( = ?auto_161086 ?auto_161090 ) ) ( not ( = ?auto_161087 ?auto_161088 ) ) ( not ( = ?auto_161087 ?auto_161089 ) ) ( not ( = ?auto_161087 ?auto_161090 ) ) ( not ( = ?auto_161088 ?auto_161089 ) ) ( not ( = ?auto_161088 ?auto_161090 ) ) ( not ( = ?auto_161089 ?auto_161090 ) ) ( not ( = ?auto_161086 ?auto_161092 ) ) ( not ( = ?auto_161087 ?auto_161092 ) ) ( not ( = ?auto_161088 ?auto_161092 ) ) ( not ( = ?auto_161089 ?auto_161092 ) ) ( not ( = ?auto_161090 ?auto_161092 ) ) ( ON-TABLE ?auto_161094 ) ( ON ?auto_161091 ?auto_161094 ) ( ON ?auto_161092 ?auto_161091 ) ( not ( = ?auto_161094 ?auto_161091 ) ) ( not ( = ?auto_161094 ?auto_161092 ) ) ( not ( = ?auto_161094 ?auto_161090 ) ) ( not ( = ?auto_161094 ?auto_161089 ) ) ( not ( = ?auto_161091 ?auto_161092 ) ) ( not ( = ?auto_161091 ?auto_161090 ) ) ( not ( = ?auto_161091 ?auto_161089 ) ) ( not ( = ?auto_161086 ?auto_161094 ) ) ( not ( = ?auto_161086 ?auto_161091 ) ) ( not ( = ?auto_161087 ?auto_161094 ) ) ( not ( = ?auto_161087 ?auto_161091 ) ) ( not ( = ?auto_161088 ?auto_161094 ) ) ( not ( = ?auto_161088 ?auto_161091 ) ) ( ON ?auto_161086 ?auto_161093 ) ( not ( = ?auto_161086 ?auto_161093 ) ) ( not ( = ?auto_161087 ?auto_161093 ) ) ( not ( = ?auto_161088 ?auto_161093 ) ) ( not ( = ?auto_161089 ?auto_161093 ) ) ( not ( = ?auto_161090 ?auto_161093 ) ) ( not ( = ?auto_161092 ?auto_161093 ) ) ( not ( = ?auto_161094 ?auto_161093 ) ) ( not ( = ?auto_161091 ?auto_161093 ) ) ( ON ?auto_161087 ?auto_161086 ) ( ON-TABLE ?auto_161093 ) ( ON ?auto_161088 ?auto_161087 ) ( ON ?auto_161089 ?auto_161088 ) ( CLEAR ?auto_161089 ) ( HOLDING ?auto_161090 ) ( CLEAR ?auto_161092 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161094 ?auto_161091 ?auto_161092 ?auto_161090 )
      ( MAKE-5PILE ?auto_161086 ?auto_161087 ?auto_161088 ?auto_161089 ?auto_161090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161095 - BLOCK
      ?auto_161096 - BLOCK
      ?auto_161097 - BLOCK
      ?auto_161098 - BLOCK
      ?auto_161099 - BLOCK
    )
    :vars
    (
      ?auto_161102 - BLOCK
      ?auto_161101 - BLOCK
      ?auto_161100 - BLOCK
      ?auto_161103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161095 ?auto_161096 ) ) ( not ( = ?auto_161095 ?auto_161097 ) ) ( not ( = ?auto_161095 ?auto_161098 ) ) ( not ( = ?auto_161095 ?auto_161099 ) ) ( not ( = ?auto_161096 ?auto_161097 ) ) ( not ( = ?auto_161096 ?auto_161098 ) ) ( not ( = ?auto_161096 ?auto_161099 ) ) ( not ( = ?auto_161097 ?auto_161098 ) ) ( not ( = ?auto_161097 ?auto_161099 ) ) ( not ( = ?auto_161098 ?auto_161099 ) ) ( not ( = ?auto_161095 ?auto_161102 ) ) ( not ( = ?auto_161096 ?auto_161102 ) ) ( not ( = ?auto_161097 ?auto_161102 ) ) ( not ( = ?auto_161098 ?auto_161102 ) ) ( not ( = ?auto_161099 ?auto_161102 ) ) ( ON-TABLE ?auto_161101 ) ( ON ?auto_161100 ?auto_161101 ) ( ON ?auto_161102 ?auto_161100 ) ( not ( = ?auto_161101 ?auto_161100 ) ) ( not ( = ?auto_161101 ?auto_161102 ) ) ( not ( = ?auto_161101 ?auto_161099 ) ) ( not ( = ?auto_161101 ?auto_161098 ) ) ( not ( = ?auto_161100 ?auto_161102 ) ) ( not ( = ?auto_161100 ?auto_161099 ) ) ( not ( = ?auto_161100 ?auto_161098 ) ) ( not ( = ?auto_161095 ?auto_161101 ) ) ( not ( = ?auto_161095 ?auto_161100 ) ) ( not ( = ?auto_161096 ?auto_161101 ) ) ( not ( = ?auto_161096 ?auto_161100 ) ) ( not ( = ?auto_161097 ?auto_161101 ) ) ( not ( = ?auto_161097 ?auto_161100 ) ) ( ON ?auto_161095 ?auto_161103 ) ( not ( = ?auto_161095 ?auto_161103 ) ) ( not ( = ?auto_161096 ?auto_161103 ) ) ( not ( = ?auto_161097 ?auto_161103 ) ) ( not ( = ?auto_161098 ?auto_161103 ) ) ( not ( = ?auto_161099 ?auto_161103 ) ) ( not ( = ?auto_161102 ?auto_161103 ) ) ( not ( = ?auto_161101 ?auto_161103 ) ) ( not ( = ?auto_161100 ?auto_161103 ) ) ( ON ?auto_161096 ?auto_161095 ) ( ON-TABLE ?auto_161103 ) ( ON ?auto_161097 ?auto_161096 ) ( ON ?auto_161098 ?auto_161097 ) ( CLEAR ?auto_161102 ) ( ON ?auto_161099 ?auto_161098 ) ( CLEAR ?auto_161099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161103 ?auto_161095 ?auto_161096 ?auto_161097 ?auto_161098 )
      ( MAKE-5PILE ?auto_161095 ?auto_161096 ?auto_161097 ?auto_161098 ?auto_161099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161104 - BLOCK
      ?auto_161105 - BLOCK
      ?auto_161106 - BLOCK
      ?auto_161107 - BLOCK
      ?auto_161108 - BLOCK
    )
    :vars
    (
      ?auto_161111 - BLOCK
      ?auto_161109 - BLOCK
      ?auto_161112 - BLOCK
      ?auto_161110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161104 ?auto_161105 ) ) ( not ( = ?auto_161104 ?auto_161106 ) ) ( not ( = ?auto_161104 ?auto_161107 ) ) ( not ( = ?auto_161104 ?auto_161108 ) ) ( not ( = ?auto_161105 ?auto_161106 ) ) ( not ( = ?auto_161105 ?auto_161107 ) ) ( not ( = ?auto_161105 ?auto_161108 ) ) ( not ( = ?auto_161106 ?auto_161107 ) ) ( not ( = ?auto_161106 ?auto_161108 ) ) ( not ( = ?auto_161107 ?auto_161108 ) ) ( not ( = ?auto_161104 ?auto_161111 ) ) ( not ( = ?auto_161105 ?auto_161111 ) ) ( not ( = ?auto_161106 ?auto_161111 ) ) ( not ( = ?auto_161107 ?auto_161111 ) ) ( not ( = ?auto_161108 ?auto_161111 ) ) ( ON-TABLE ?auto_161109 ) ( ON ?auto_161112 ?auto_161109 ) ( not ( = ?auto_161109 ?auto_161112 ) ) ( not ( = ?auto_161109 ?auto_161111 ) ) ( not ( = ?auto_161109 ?auto_161108 ) ) ( not ( = ?auto_161109 ?auto_161107 ) ) ( not ( = ?auto_161112 ?auto_161111 ) ) ( not ( = ?auto_161112 ?auto_161108 ) ) ( not ( = ?auto_161112 ?auto_161107 ) ) ( not ( = ?auto_161104 ?auto_161109 ) ) ( not ( = ?auto_161104 ?auto_161112 ) ) ( not ( = ?auto_161105 ?auto_161109 ) ) ( not ( = ?auto_161105 ?auto_161112 ) ) ( not ( = ?auto_161106 ?auto_161109 ) ) ( not ( = ?auto_161106 ?auto_161112 ) ) ( ON ?auto_161104 ?auto_161110 ) ( not ( = ?auto_161104 ?auto_161110 ) ) ( not ( = ?auto_161105 ?auto_161110 ) ) ( not ( = ?auto_161106 ?auto_161110 ) ) ( not ( = ?auto_161107 ?auto_161110 ) ) ( not ( = ?auto_161108 ?auto_161110 ) ) ( not ( = ?auto_161111 ?auto_161110 ) ) ( not ( = ?auto_161109 ?auto_161110 ) ) ( not ( = ?auto_161112 ?auto_161110 ) ) ( ON ?auto_161105 ?auto_161104 ) ( ON-TABLE ?auto_161110 ) ( ON ?auto_161106 ?auto_161105 ) ( ON ?auto_161107 ?auto_161106 ) ( ON ?auto_161108 ?auto_161107 ) ( CLEAR ?auto_161108 ) ( HOLDING ?auto_161111 ) ( CLEAR ?auto_161112 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161109 ?auto_161112 ?auto_161111 )
      ( MAKE-5PILE ?auto_161104 ?auto_161105 ?auto_161106 ?auto_161107 ?auto_161108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161113 - BLOCK
      ?auto_161114 - BLOCK
      ?auto_161115 - BLOCK
      ?auto_161116 - BLOCK
      ?auto_161117 - BLOCK
    )
    :vars
    (
      ?auto_161120 - BLOCK
      ?auto_161121 - BLOCK
      ?auto_161119 - BLOCK
      ?auto_161118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161113 ?auto_161114 ) ) ( not ( = ?auto_161113 ?auto_161115 ) ) ( not ( = ?auto_161113 ?auto_161116 ) ) ( not ( = ?auto_161113 ?auto_161117 ) ) ( not ( = ?auto_161114 ?auto_161115 ) ) ( not ( = ?auto_161114 ?auto_161116 ) ) ( not ( = ?auto_161114 ?auto_161117 ) ) ( not ( = ?auto_161115 ?auto_161116 ) ) ( not ( = ?auto_161115 ?auto_161117 ) ) ( not ( = ?auto_161116 ?auto_161117 ) ) ( not ( = ?auto_161113 ?auto_161120 ) ) ( not ( = ?auto_161114 ?auto_161120 ) ) ( not ( = ?auto_161115 ?auto_161120 ) ) ( not ( = ?auto_161116 ?auto_161120 ) ) ( not ( = ?auto_161117 ?auto_161120 ) ) ( ON-TABLE ?auto_161121 ) ( ON ?auto_161119 ?auto_161121 ) ( not ( = ?auto_161121 ?auto_161119 ) ) ( not ( = ?auto_161121 ?auto_161120 ) ) ( not ( = ?auto_161121 ?auto_161117 ) ) ( not ( = ?auto_161121 ?auto_161116 ) ) ( not ( = ?auto_161119 ?auto_161120 ) ) ( not ( = ?auto_161119 ?auto_161117 ) ) ( not ( = ?auto_161119 ?auto_161116 ) ) ( not ( = ?auto_161113 ?auto_161121 ) ) ( not ( = ?auto_161113 ?auto_161119 ) ) ( not ( = ?auto_161114 ?auto_161121 ) ) ( not ( = ?auto_161114 ?auto_161119 ) ) ( not ( = ?auto_161115 ?auto_161121 ) ) ( not ( = ?auto_161115 ?auto_161119 ) ) ( ON ?auto_161113 ?auto_161118 ) ( not ( = ?auto_161113 ?auto_161118 ) ) ( not ( = ?auto_161114 ?auto_161118 ) ) ( not ( = ?auto_161115 ?auto_161118 ) ) ( not ( = ?auto_161116 ?auto_161118 ) ) ( not ( = ?auto_161117 ?auto_161118 ) ) ( not ( = ?auto_161120 ?auto_161118 ) ) ( not ( = ?auto_161121 ?auto_161118 ) ) ( not ( = ?auto_161119 ?auto_161118 ) ) ( ON ?auto_161114 ?auto_161113 ) ( ON-TABLE ?auto_161118 ) ( ON ?auto_161115 ?auto_161114 ) ( ON ?auto_161116 ?auto_161115 ) ( ON ?auto_161117 ?auto_161116 ) ( CLEAR ?auto_161119 ) ( ON ?auto_161120 ?auto_161117 ) ( CLEAR ?auto_161120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161118 ?auto_161113 ?auto_161114 ?auto_161115 ?auto_161116 ?auto_161117 )
      ( MAKE-5PILE ?auto_161113 ?auto_161114 ?auto_161115 ?auto_161116 ?auto_161117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161122 - BLOCK
      ?auto_161123 - BLOCK
      ?auto_161124 - BLOCK
      ?auto_161125 - BLOCK
      ?auto_161126 - BLOCK
    )
    :vars
    (
      ?auto_161128 - BLOCK
      ?auto_161127 - BLOCK
      ?auto_161130 - BLOCK
      ?auto_161129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161122 ?auto_161123 ) ) ( not ( = ?auto_161122 ?auto_161124 ) ) ( not ( = ?auto_161122 ?auto_161125 ) ) ( not ( = ?auto_161122 ?auto_161126 ) ) ( not ( = ?auto_161123 ?auto_161124 ) ) ( not ( = ?auto_161123 ?auto_161125 ) ) ( not ( = ?auto_161123 ?auto_161126 ) ) ( not ( = ?auto_161124 ?auto_161125 ) ) ( not ( = ?auto_161124 ?auto_161126 ) ) ( not ( = ?auto_161125 ?auto_161126 ) ) ( not ( = ?auto_161122 ?auto_161128 ) ) ( not ( = ?auto_161123 ?auto_161128 ) ) ( not ( = ?auto_161124 ?auto_161128 ) ) ( not ( = ?auto_161125 ?auto_161128 ) ) ( not ( = ?auto_161126 ?auto_161128 ) ) ( ON-TABLE ?auto_161127 ) ( not ( = ?auto_161127 ?auto_161130 ) ) ( not ( = ?auto_161127 ?auto_161128 ) ) ( not ( = ?auto_161127 ?auto_161126 ) ) ( not ( = ?auto_161127 ?auto_161125 ) ) ( not ( = ?auto_161130 ?auto_161128 ) ) ( not ( = ?auto_161130 ?auto_161126 ) ) ( not ( = ?auto_161130 ?auto_161125 ) ) ( not ( = ?auto_161122 ?auto_161127 ) ) ( not ( = ?auto_161122 ?auto_161130 ) ) ( not ( = ?auto_161123 ?auto_161127 ) ) ( not ( = ?auto_161123 ?auto_161130 ) ) ( not ( = ?auto_161124 ?auto_161127 ) ) ( not ( = ?auto_161124 ?auto_161130 ) ) ( ON ?auto_161122 ?auto_161129 ) ( not ( = ?auto_161122 ?auto_161129 ) ) ( not ( = ?auto_161123 ?auto_161129 ) ) ( not ( = ?auto_161124 ?auto_161129 ) ) ( not ( = ?auto_161125 ?auto_161129 ) ) ( not ( = ?auto_161126 ?auto_161129 ) ) ( not ( = ?auto_161128 ?auto_161129 ) ) ( not ( = ?auto_161127 ?auto_161129 ) ) ( not ( = ?auto_161130 ?auto_161129 ) ) ( ON ?auto_161123 ?auto_161122 ) ( ON-TABLE ?auto_161129 ) ( ON ?auto_161124 ?auto_161123 ) ( ON ?auto_161125 ?auto_161124 ) ( ON ?auto_161126 ?auto_161125 ) ( ON ?auto_161128 ?auto_161126 ) ( CLEAR ?auto_161128 ) ( HOLDING ?auto_161130 ) ( CLEAR ?auto_161127 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161127 ?auto_161130 )
      ( MAKE-5PILE ?auto_161122 ?auto_161123 ?auto_161124 ?auto_161125 ?auto_161126 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161131 - BLOCK
      ?auto_161132 - BLOCK
      ?auto_161133 - BLOCK
      ?auto_161134 - BLOCK
      ?auto_161135 - BLOCK
    )
    :vars
    (
      ?auto_161136 - BLOCK
      ?auto_161139 - BLOCK
      ?auto_161138 - BLOCK
      ?auto_161137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161131 ?auto_161132 ) ) ( not ( = ?auto_161131 ?auto_161133 ) ) ( not ( = ?auto_161131 ?auto_161134 ) ) ( not ( = ?auto_161131 ?auto_161135 ) ) ( not ( = ?auto_161132 ?auto_161133 ) ) ( not ( = ?auto_161132 ?auto_161134 ) ) ( not ( = ?auto_161132 ?auto_161135 ) ) ( not ( = ?auto_161133 ?auto_161134 ) ) ( not ( = ?auto_161133 ?auto_161135 ) ) ( not ( = ?auto_161134 ?auto_161135 ) ) ( not ( = ?auto_161131 ?auto_161136 ) ) ( not ( = ?auto_161132 ?auto_161136 ) ) ( not ( = ?auto_161133 ?auto_161136 ) ) ( not ( = ?auto_161134 ?auto_161136 ) ) ( not ( = ?auto_161135 ?auto_161136 ) ) ( ON-TABLE ?auto_161139 ) ( not ( = ?auto_161139 ?auto_161138 ) ) ( not ( = ?auto_161139 ?auto_161136 ) ) ( not ( = ?auto_161139 ?auto_161135 ) ) ( not ( = ?auto_161139 ?auto_161134 ) ) ( not ( = ?auto_161138 ?auto_161136 ) ) ( not ( = ?auto_161138 ?auto_161135 ) ) ( not ( = ?auto_161138 ?auto_161134 ) ) ( not ( = ?auto_161131 ?auto_161139 ) ) ( not ( = ?auto_161131 ?auto_161138 ) ) ( not ( = ?auto_161132 ?auto_161139 ) ) ( not ( = ?auto_161132 ?auto_161138 ) ) ( not ( = ?auto_161133 ?auto_161139 ) ) ( not ( = ?auto_161133 ?auto_161138 ) ) ( ON ?auto_161131 ?auto_161137 ) ( not ( = ?auto_161131 ?auto_161137 ) ) ( not ( = ?auto_161132 ?auto_161137 ) ) ( not ( = ?auto_161133 ?auto_161137 ) ) ( not ( = ?auto_161134 ?auto_161137 ) ) ( not ( = ?auto_161135 ?auto_161137 ) ) ( not ( = ?auto_161136 ?auto_161137 ) ) ( not ( = ?auto_161139 ?auto_161137 ) ) ( not ( = ?auto_161138 ?auto_161137 ) ) ( ON ?auto_161132 ?auto_161131 ) ( ON-TABLE ?auto_161137 ) ( ON ?auto_161133 ?auto_161132 ) ( ON ?auto_161134 ?auto_161133 ) ( ON ?auto_161135 ?auto_161134 ) ( ON ?auto_161136 ?auto_161135 ) ( CLEAR ?auto_161139 ) ( ON ?auto_161138 ?auto_161136 ) ( CLEAR ?auto_161138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161137 ?auto_161131 ?auto_161132 ?auto_161133 ?auto_161134 ?auto_161135 ?auto_161136 )
      ( MAKE-5PILE ?auto_161131 ?auto_161132 ?auto_161133 ?auto_161134 ?auto_161135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161140 - BLOCK
      ?auto_161141 - BLOCK
      ?auto_161142 - BLOCK
      ?auto_161143 - BLOCK
      ?auto_161144 - BLOCK
    )
    :vars
    (
      ?auto_161146 - BLOCK
      ?auto_161145 - BLOCK
      ?auto_161147 - BLOCK
      ?auto_161148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161140 ?auto_161141 ) ) ( not ( = ?auto_161140 ?auto_161142 ) ) ( not ( = ?auto_161140 ?auto_161143 ) ) ( not ( = ?auto_161140 ?auto_161144 ) ) ( not ( = ?auto_161141 ?auto_161142 ) ) ( not ( = ?auto_161141 ?auto_161143 ) ) ( not ( = ?auto_161141 ?auto_161144 ) ) ( not ( = ?auto_161142 ?auto_161143 ) ) ( not ( = ?auto_161142 ?auto_161144 ) ) ( not ( = ?auto_161143 ?auto_161144 ) ) ( not ( = ?auto_161140 ?auto_161146 ) ) ( not ( = ?auto_161141 ?auto_161146 ) ) ( not ( = ?auto_161142 ?auto_161146 ) ) ( not ( = ?auto_161143 ?auto_161146 ) ) ( not ( = ?auto_161144 ?auto_161146 ) ) ( not ( = ?auto_161145 ?auto_161147 ) ) ( not ( = ?auto_161145 ?auto_161146 ) ) ( not ( = ?auto_161145 ?auto_161144 ) ) ( not ( = ?auto_161145 ?auto_161143 ) ) ( not ( = ?auto_161147 ?auto_161146 ) ) ( not ( = ?auto_161147 ?auto_161144 ) ) ( not ( = ?auto_161147 ?auto_161143 ) ) ( not ( = ?auto_161140 ?auto_161145 ) ) ( not ( = ?auto_161140 ?auto_161147 ) ) ( not ( = ?auto_161141 ?auto_161145 ) ) ( not ( = ?auto_161141 ?auto_161147 ) ) ( not ( = ?auto_161142 ?auto_161145 ) ) ( not ( = ?auto_161142 ?auto_161147 ) ) ( ON ?auto_161140 ?auto_161148 ) ( not ( = ?auto_161140 ?auto_161148 ) ) ( not ( = ?auto_161141 ?auto_161148 ) ) ( not ( = ?auto_161142 ?auto_161148 ) ) ( not ( = ?auto_161143 ?auto_161148 ) ) ( not ( = ?auto_161144 ?auto_161148 ) ) ( not ( = ?auto_161146 ?auto_161148 ) ) ( not ( = ?auto_161145 ?auto_161148 ) ) ( not ( = ?auto_161147 ?auto_161148 ) ) ( ON ?auto_161141 ?auto_161140 ) ( ON-TABLE ?auto_161148 ) ( ON ?auto_161142 ?auto_161141 ) ( ON ?auto_161143 ?auto_161142 ) ( ON ?auto_161144 ?auto_161143 ) ( ON ?auto_161146 ?auto_161144 ) ( ON ?auto_161147 ?auto_161146 ) ( CLEAR ?auto_161147 ) ( HOLDING ?auto_161145 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161145 )
      ( MAKE-5PILE ?auto_161140 ?auto_161141 ?auto_161142 ?auto_161143 ?auto_161144 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161149 - BLOCK
      ?auto_161150 - BLOCK
      ?auto_161151 - BLOCK
      ?auto_161152 - BLOCK
      ?auto_161153 - BLOCK
    )
    :vars
    (
      ?auto_161155 - BLOCK
      ?auto_161156 - BLOCK
      ?auto_161157 - BLOCK
      ?auto_161154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161149 ?auto_161150 ) ) ( not ( = ?auto_161149 ?auto_161151 ) ) ( not ( = ?auto_161149 ?auto_161152 ) ) ( not ( = ?auto_161149 ?auto_161153 ) ) ( not ( = ?auto_161150 ?auto_161151 ) ) ( not ( = ?auto_161150 ?auto_161152 ) ) ( not ( = ?auto_161150 ?auto_161153 ) ) ( not ( = ?auto_161151 ?auto_161152 ) ) ( not ( = ?auto_161151 ?auto_161153 ) ) ( not ( = ?auto_161152 ?auto_161153 ) ) ( not ( = ?auto_161149 ?auto_161155 ) ) ( not ( = ?auto_161150 ?auto_161155 ) ) ( not ( = ?auto_161151 ?auto_161155 ) ) ( not ( = ?auto_161152 ?auto_161155 ) ) ( not ( = ?auto_161153 ?auto_161155 ) ) ( not ( = ?auto_161156 ?auto_161157 ) ) ( not ( = ?auto_161156 ?auto_161155 ) ) ( not ( = ?auto_161156 ?auto_161153 ) ) ( not ( = ?auto_161156 ?auto_161152 ) ) ( not ( = ?auto_161157 ?auto_161155 ) ) ( not ( = ?auto_161157 ?auto_161153 ) ) ( not ( = ?auto_161157 ?auto_161152 ) ) ( not ( = ?auto_161149 ?auto_161156 ) ) ( not ( = ?auto_161149 ?auto_161157 ) ) ( not ( = ?auto_161150 ?auto_161156 ) ) ( not ( = ?auto_161150 ?auto_161157 ) ) ( not ( = ?auto_161151 ?auto_161156 ) ) ( not ( = ?auto_161151 ?auto_161157 ) ) ( ON ?auto_161149 ?auto_161154 ) ( not ( = ?auto_161149 ?auto_161154 ) ) ( not ( = ?auto_161150 ?auto_161154 ) ) ( not ( = ?auto_161151 ?auto_161154 ) ) ( not ( = ?auto_161152 ?auto_161154 ) ) ( not ( = ?auto_161153 ?auto_161154 ) ) ( not ( = ?auto_161155 ?auto_161154 ) ) ( not ( = ?auto_161156 ?auto_161154 ) ) ( not ( = ?auto_161157 ?auto_161154 ) ) ( ON ?auto_161150 ?auto_161149 ) ( ON-TABLE ?auto_161154 ) ( ON ?auto_161151 ?auto_161150 ) ( ON ?auto_161152 ?auto_161151 ) ( ON ?auto_161153 ?auto_161152 ) ( ON ?auto_161155 ?auto_161153 ) ( ON ?auto_161157 ?auto_161155 ) ( ON ?auto_161156 ?auto_161157 ) ( CLEAR ?auto_161156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161154 ?auto_161149 ?auto_161150 ?auto_161151 ?auto_161152 ?auto_161153 ?auto_161155 ?auto_161157 )
      ( MAKE-5PILE ?auto_161149 ?auto_161150 ?auto_161151 ?auto_161152 ?auto_161153 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161160 - BLOCK
      ?auto_161161 - BLOCK
    )
    :vars
    (
      ?auto_161162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161162 ?auto_161161 ) ( CLEAR ?auto_161162 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161160 ) ( ON ?auto_161161 ?auto_161160 ) ( not ( = ?auto_161160 ?auto_161161 ) ) ( not ( = ?auto_161160 ?auto_161162 ) ) ( not ( = ?auto_161161 ?auto_161162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161162 ?auto_161161 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161163 - BLOCK
      ?auto_161164 - BLOCK
    )
    :vars
    (
      ?auto_161165 - BLOCK
      ?auto_161166 - BLOCK
      ?auto_161167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161165 ?auto_161164 ) ( CLEAR ?auto_161165 ) ( ON-TABLE ?auto_161163 ) ( ON ?auto_161164 ?auto_161163 ) ( not ( = ?auto_161163 ?auto_161164 ) ) ( not ( = ?auto_161163 ?auto_161165 ) ) ( not ( = ?auto_161164 ?auto_161165 ) ) ( HOLDING ?auto_161166 ) ( CLEAR ?auto_161167 ) ( not ( = ?auto_161163 ?auto_161166 ) ) ( not ( = ?auto_161163 ?auto_161167 ) ) ( not ( = ?auto_161164 ?auto_161166 ) ) ( not ( = ?auto_161164 ?auto_161167 ) ) ( not ( = ?auto_161165 ?auto_161166 ) ) ( not ( = ?auto_161165 ?auto_161167 ) ) ( not ( = ?auto_161166 ?auto_161167 ) ) )
    :subtasks
    ( ( !STACK ?auto_161166 ?auto_161167 )
      ( MAKE-2PILE ?auto_161163 ?auto_161164 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161168 - BLOCK
      ?auto_161169 - BLOCK
    )
    :vars
    (
      ?auto_161172 - BLOCK
      ?auto_161170 - BLOCK
      ?auto_161171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161172 ?auto_161169 ) ( ON-TABLE ?auto_161168 ) ( ON ?auto_161169 ?auto_161168 ) ( not ( = ?auto_161168 ?auto_161169 ) ) ( not ( = ?auto_161168 ?auto_161172 ) ) ( not ( = ?auto_161169 ?auto_161172 ) ) ( CLEAR ?auto_161170 ) ( not ( = ?auto_161168 ?auto_161171 ) ) ( not ( = ?auto_161168 ?auto_161170 ) ) ( not ( = ?auto_161169 ?auto_161171 ) ) ( not ( = ?auto_161169 ?auto_161170 ) ) ( not ( = ?auto_161172 ?auto_161171 ) ) ( not ( = ?auto_161172 ?auto_161170 ) ) ( not ( = ?auto_161171 ?auto_161170 ) ) ( ON ?auto_161171 ?auto_161172 ) ( CLEAR ?auto_161171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161168 ?auto_161169 ?auto_161172 )
      ( MAKE-2PILE ?auto_161168 ?auto_161169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161173 - BLOCK
      ?auto_161174 - BLOCK
    )
    :vars
    (
      ?auto_161177 - BLOCK
      ?auto_161175 - BLOCK
      ?auto_161176 - BLOCK
      ?auto_161178 - BLOCK
      ?auto_161179 - BLOCK
      ?auto_161180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161177 ?auto_161174 ) ( ON-TABLE ?auto_161173 ) ( ON ?auto_161174 ?auto_161173 ) ( not ( = ?auto_161173 ?auto_161174 ) ) ( not ( = ?auto_161173 ?auto_161177 ) ) ( not ( = ?auto_161174 ?auto_161177 ) ) ( not ( = ?auto_161173 ?auto_161175 ) ) ( not ( = ?auto_161173 ?auto_161176 ) ) ( not ( = ?auto_161174 ?auto_161175 ) ) ( not ( = ?auto_161174 ?auto_161176 ) ) ( not ( = ?auto_161177 ?auto_161175 ) ) ( not ( = ?auto_161177 ?auto_161176 ) ) ( not ( = ?auto_161175 ?auto_161176 ) ) ( ON ?auto_161175 ?auto_161177 ) ( CLEAR ?auto_161175 ) ( HOLDING ?auto_161176 ) ( CLEAR ?auto_161178 ) ( ON-TABLE ?auto_161179 ) ( ON ?auto_161180 ?auto_161179 ) ( ON ?auto_161178 ?auto_161180 ) ( not ( = ?auto_161179 ?auto_161180 ) ) ( not ( = ?auto_161179 ?auto_161178 ) ) ( not ( = ?auto_161179 ?auto_161176 ) ) ( not ( = ?auto_161180 ?auto_161178 ) ) ( not ( = ?auto_161180 ?auto_161176 ) ) ( not ( = ?auto_161178 ?auto_161176 ) ) ( not ( = ?auto_161173 ?auto_161178 ) ) ( not ( = ?auto_161173 ?auto_161179 ) ) ( not ( = ?auto_161173 ?auto_161180 ) ) ( not ( = ?auto_161174 ?auto_161178 ) ) ( not ( = ?auto_161174 ?auto_161179 ) ) ( not ( = ?auto_161174 ?auto_161180 ) ) ( not ( = ?auto_161177 ?auto_161178 ) ) ( not ( = ?auto_161177 ?auto_161179 ) ) ( not ( = ?auto_161177 ?auto_161180 ) ) ( not ( = ?auto_161175 ?auto_161178 ) ) ( not ( = ?auto_161175 ?auto_161179 ) ) ( not ( = ?auto_161175 ?auto_161180 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161179 ?auto_161180 ?auto_161178 ?auto_161176 )
      ( MAKE-2PILE ?auto_161173 ?auto_161174 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161181 - BLOCK
      ?auto_161182 - BLOCK
    )
    :vars
    (
      ?auto_161187 - BLOCK
      ?auto_161186 - BLOCK
      ?auto_161185 - BLOCK
      ?auto_161184 - BLOCK
      ?auto_161188 - BLOCK
      ?auto_161183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161187 ?auto_161182 ) ( ON-TABLE ?auto_161181 ) ( ON ?auto_161182 ?auto_161181 ) ( not ( = ?auto_161181 ?auto_161182 ) ) ( not ( = ?auto_161181 ?auto_161187 ) ) ( not ( = ?auto_161182 ?auto_161187 ) ) ( not ( = ?auto_161181 ?auto_161186 ) ) ( not ( = ?auto_161181 ?auto_161185 ) ) ( not ( = ?auto_161182 ?auto_161186 ) ) ( not ( = ?auto_161182 ?auto_161185 ) ) ( not ( = ?auto_161187 ?auto_161186 ) ) ( not ( = ?auto_161187 ?auto_161185 ) ) ( not ( = ?auto_161186 ?auto_161185 ) ) ( ON ?auto_161186 ?auto_161187 ) ( CLEAR ?auto_161184 ) ( ON-TABLE ?auto_161188 ) ( ON ?auto_161183 ?auto_161188 ) ( ON ?auto_161184 ?auto_161183 ) ( not ( = ?auto_161188 ?auto_161183 ) ) ( not ( = ?auto_161188 ?auto_161184 ) ) ( not ( = ?auto_161188 ?auto_161185 ) ) ( not ( = ?auto_161183 ?auto_161184 ) ) ( not ( = ?auto_161183 ?auto_161185 ) ) ( not ( = ?auto_161184 ?auto_161185 ) ) ( not ( = ?auto_161181 ?auto_161184 ) ) ( not ( = ?auto_161181 ?auto_161188 ) ) ( not ( = ?auto_161181 ?auto_161183 ) ) ( not ( = ?auto_161182 ?auto_161184 ) ) ( not ( = ?auto_161182 ?auto_161188 ) ) ( not ( = ?auto_161182 ?auto_161183 ) ) ( not ( = ?auto_161187 ?auto_161184 ) ) ( not ( = ?auto_161187 ?auto_161188 ) ) ( not ( = ?auto_161187 ?auto_161183 ) ) ( not ( = ?auto_161186 ?auto_161184 ) ) ( not ( = ?auto_161186 ?auto_161188 ) ) ( not ( = ?auto_161186 ?auto_161183 ) ) ( ON ?auto_161185 ?auto_161186 ) ( CLEAR ?auto_161185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161181 ?auto_161182 ?auto_161187 ?auto_161186 )
      ( MAKE-2PILE ?auto_161181 ?auto_161182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161189 - BLOCK
      ?auto_161190 - BLOCK
    )
    :vars
    (
      ?auto_161195 - BLOCK
      ?auto_161194 - BLOCK
      ?auto_161193 - BLOCK
      ?auto_161192 - BLOCK
      ?auto_161191 - BLOCK
      ?auto_161196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161195 ?auto_161190 ) ( ON-TABLE ?auto_161189 ) ( ON ?auto_161190 ?auto_161189 ) ( not ( = ?auto_161189 ?auto_161190 ) ) ( not ( = ?auto_161189 ?auto_161195 ) ) ( not ( = ?auto_161190 ?auto_161195 ) ) ( not ( = ?auto_161189 ?auto_161194 ) ) ( not ( = ?auto_161189 ?auto_161193 ) ) ( not ( = ?auto_161190 ?auto_161194 ) ) ( not ( = ?auto_161190 ?auto_161193 ) ) ( not ( = ?auto_161195 ?auto_161194 ) ) ( not ( = ?auto_161195 ?auto_161193 ) ) ( not ( = ?auto_161194 ?auto_161193 ) ) ( ON ?auto_161194 ?auto_161195 ) ( ON-TABLE ?auto_161192 ) ( ON ?auto_161191 ?auto_161192 ) ( not ( = ?auto_161192 ?auto_161191 ) ) ( not ( = ?auto_161192 ?auto_161196 ) ) ( not ( = ?auto_161192 ?auto_161193 ) ) ( not ( = ?auto_161191 ?auto_161196 ) ) ( not ( = ?auto_161191 ?auto_161193 ) ) ( not ( = ?auto_161196 ?auto_161193 ) ) ( not ( = ?auto_161189 ?auto_161196 ) ) ( not ( = ?auto_161189 ?auto_161192 ) ) ( not ( = ?auto_161189 ?auto_161191 ) ) ( not ( = ?auto_161190 ?auto_161196 ) ) ( not ( = ?auto_161190 ?auto_161192 ) ) ( not ( = ?auto_161190 ?auto_161191 ) ) ( not ( = ?auto_161195 ?auto_161196 ) ) ( not ( = ?auto_161195 ?auto_161192 ) ) ( not ( = ?auto_161195 ?auto_161191 ) ) ( not ( = ?auto_161194 ?auto_161196 ) ) ( not ( = ?auto_161194 ?auto_161192 ) ) ( not ( = ?auto_161194 ?auto_161191 ) ) ( ON ?auto_161193 ?auto_161194 ) ( CLEAR ?auto_161193 ) ( HOLDING ?auto_161196 ) ( CLEAR ?auto_161191 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161192 ?auto_161191 ?auto_161196 )
      ( MAKE-2PILE ?auto_161189 ?auto_161190 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161197 - BLOCK
      ?auto_161198 - BLOCK
    )
    :vars
    (
      ?auto_161204 - BLOCK
      ?auto_161201 - BLOCK
      ?auto_161202 - BLOCK
      ?auto_161203 - BLOCK
      ?auto_161199 - BLOCK
      ?auto_161200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161204 ?auto_161198 ) ( ON-TABLE ?auto_161197 ) ( ON ?auto_161198 ?auto_161197 ) ( not ( = ?auto_161197 ?auto_161198 ) ) ( not ( = ?auto_161197 ?auto_161204 ) ) ( not ( = ?auto_161198 ?auto_161204 ) ) ( not ( = ?auto_161197 ?auto_161201 ) ) ( not ( = ?auto_161197 ?auto_161202 ) ) ( not ( = ?auto_161198 ?auto_161201 ) ) ( not ( = ?auto_161198 ?auto_161202 ) ) ( not ( = ?auto_161204 ?auto_161201 ) ) ( not ( = ?auto_161204 ?auto_161202 ) ) ( not ( = ?auto_161201 ?auto_161202 ) ) ( ON ?auto_161201 ?auto_161204 ) ( ON-TABLE ?auto_161203 ) ( ON ?auto_161199 ?auto_161203 ) ( not ( = ?auto_161203 ?auto_161199 ) ) ( not ( = ?auto_161203 ?auto_161200 ) ) ( not ( = ?auto_161203 ?auto_161202 ) ) ( not ( = ?auto_161199 ?auto_161200 ) ) ( not ( = ?auto_161199 ?auto_161202 ) ) ( not ( = ?auto_161200 ?auto_161202 ) ) ( not ( = ?auto_161197 ?auto_161200 ) ) ( not ( = ?auto_161197 ?auto_161203 ) ) ( not ( = ?auto_161197 ?auto_161199 ) ) ( not ( = ?auto_161198 ?auto_161200 ) ) ( not ( = ?auto_161198 ?auto_161203 ) ) ( not ( = ?auto_161198 ?auto_161199 ) ) ( not ( = ?auto_161204 ?auto_161200 ) ) ( not ( = ?auto_161204 ?auto_161203 ) ) ( not ( = ?auto_161204 ?auto_161199 ) ) ( not ( = ?auto_161201 ?auto_161200 ) ) ( not ( = ?auto_161201 ?auto_161203 ) ) ( not ( = ?auto_161201 ?auto_161199 ) ) ( ON ?auto_161202 ?auto_161201 ) ( CLEAR ?auto_161199 ) ( ON ?auto_161200 ?auto_161202 ) ( CLEAR ?auto_161200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161197 ?auto_161198 ?auto_161204 ?auto_161201 ?auto_161202 )
      ( MAKE-2PILE ?auto_161197 ?auto_161198 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161205 - BLOCK
      ?auto_161206 - BLOCK
    )
    :vars
    (
      ?auto_161209 - BLOCK
      ?auto_161211 - BLOCK
      ?auto_161210 - BLOCK
      ?auto_161207 - BLOCK
      ?auto_161208 - BLOCK
      ?auto_161212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161209 ?auto_161206 ) ( ON-TABLE ?auto_161205 ) ( ON ?auto_161206 ?auto_161205 ) ( not ( = ?auto_161205 ?auto_161206 ) ) ( not ( = ?auto_161205 ?auto_161209 ) ) ( not ( = ?auto_161206 ?auto_161209 ) ) ( not ( = ?auto_161205 ?auto_161211 ) ) ( not ( = ?auto_161205 ?auto_161210 ) ) ( not ( = ?auto_161206 ?auto_161211 ) ) ( not ( = ?auto_161206 ?auto_161210 ) ) ( not ( = ?auto_161209 ?auto_161211 ) ) ( not ( = ?auto_161209 ?auto_161210 ) ) ( not ( = ?auto_161211 ?auto_161210 ) ) ( ON ?auto_161211 ?auto_161209 ) ( ON-TABLE ?auto_161207 ) ( not ( = ?auto_161207 ?auto_161208 ) ) ( not ( = ?auto_161207 ?auto_161212 ) ) ( not ( = ?auto_161207 ?auto_161210 ) ) ( not ( = ?auto_161208 ?auto_161212 ) ) ( not ( = ?auto_161208 ?auto_161210 ) ) ( not ( = ?auto_161212 ?auto_161210 ) ) ( not ( = ?auto_161205 ?auto_161212 ) ) ( not ( = ?auto_161205 ?auto_161207 ) ) ( not ( = ?auto_161205 ?auto_161208 ) ) ( not ( = ?auto_161206 ?auto_161212 ) ) ( not ( = ?auto_161206 ?auto_161207 ) ) ( not ( = ?auto_161206 ?auto_161208 ) ) ( not ( = ?auto_161209 ?auto_161212 ) ) ( not ( = ?auto_161209 ?auto_161207 ) ) ( not ( = ?auto_161209 ?auto_161208 ) ) ( not ( = ?auto_161211 ?auto_161212 ) ) ( not ( = ?auto_161211 ?auto_161207 ) ) ( not ( = ?auto_161211 ?auto_161208 ) ) ( ON ?auto_161210 ?auto_161211 ) ( ON ?auto_161212 ?auto_161210 ) ( CLEAR ?auto_161212 ) ( HOLDING ?auto_161208 ) ( CLEAR ?auto_161207 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161207 ?auto_161208 )
      ( MAKE-2PILE ?auto_161205 ?auto_161206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161213 - BLOCK
      ?auto_161214 - BLOCK
    )
    :vars
    (
      ?auto_161215 - BLOCK
      ?auto_161220 - BLOCK
      ?auto_161219 - BLOCK
      ?auto_161218 - BLOCK
      ?auto_161216 - BLOCK
      ?auto_161217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161215 ?auto_161214 ) ( ON-TABLE ?auto_161213 ) ( ON ?auto_161214 ?auto_161213 ) ( not ( = ?auto_161213 ?auto_161214 ) ) ( not ( = ?auto_161213 ?auto_161215 ) ) ( not ( = ?auto_161214 ?auto_161215 ) ) ( not ( = ?auto_161213 ?auto_161220 ) ) ( not ( = ?auto_161213 ?auto_161219 ) ) ( not ( = ?auto_161214 ?auto_161220 ) ) ( not ( = ?auto_161214 ?auto_161219 ) ) ( not ( = ?auto_161215 ?auto_161220 ) ) ( not ( = ?auto_161215 ?auto_161219 ) ) ( not ( = ?auto_161220 ?auto_161219 ) ) ( ON ?auto_161220 ?auto_161215 ) ( ON-TABLE ?auto_161218 ) ( not ( = ?auto_161218 ?auto_161216 ) ) ( not ( = ?auto_161218 ?auto_161217 ) ) ( not ( = ?auto_161218 ?auto_161219 ) ) ( not ( = ?auto_161216 ?auto_161217 ) ) ( not ( = ?auto_161216 ?auto_161219 ) ) ( not ( = ?auto_161217 ?auto_161219 ) ) ( not ( = ?auto_161213 ?auto_161217 ) ) ( not ( = ?auto_161213 ?auto_161218 ) ) ( not ( = ?auto_161213 ?auto_161216 ) ) ( not ( = ?auto_161214 ?auto_161217 ) ) ( not ( = ?auto_161214 ?auto_161218 ) ) ( not ( = ?auto_161214 ?auto_161216 ) ) ( not ( = ?auto_161215 ?auto_161217 ) ) ( not ( = ?auto_161215 ?auto_161218 ) ) ( not ( = ?auto_161215 ?auto_161216 ) ) ( not ( = ?auto_161220 ?auto_161217 ) ) ( not ( = ?auto_161220 ?auto_161218 ) ) ( not ( = ?auto_161220 ?auto_161216 ) ) ( ON ?auto_161219 ?auto_161220 ) ( ON ?auto_161217 ?auto_161219 ) ( CLEAR ?auto_161218 ) ( ON ?auto_161216 ?auto_161217 ) ( CLEAR ?auto_161216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161213 ?auto_161214 ?auto_161215 ?auto_161220 ?auto_161219 ?auto_161217 )
      ( MAKE-2PILE ?auto_161213 ?auto_161214 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161221 - BLOCK
      ?auto_161222 - BLOCK
    )
    :vars
    (
      ?auto_161227 - BLOCK
      ?auto_161228 - BLOCK
      ?auto_161224 - BLOCK
      ?auto_161225 - BLOCK
      ?auto_161226 - BLOCK
      ?auto_161223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161227 ?auto_161222 ) ( ON-TABLE ?auto_161221 ) ( ON ?auto_161222 ?auto_161221 ) ( not ( = ?auto_161221 ?auto_161222 ) ) ( not ( = ?auto_161221 ?auto_161227 ) ) ( not ( = ?auto_161222 ?auto_161227 ) ) ( not ( = ?auto_161221 ?auto_161228 ) ) ( not ( = ?auto_161221 ?auto_161224 ) ) ( not ( = ?auto_161222 ?auto_161228 ) ) ( not ( = ?auto_161222 ?auto_161224 ) ) ( not ( = ?auto_161227 ?auto_161228 ) ) ( not ( = ?auto_161227 ?auto_161224 ) ) ( not ( = ?auto_161228 ?auto_161224 ) ) ( ON ?auto_161228 ?auto_161227 ) ( not ( = ?auto_161225 ?auto_161226 ) ) ( not ( = ?auto_161225 ?auto_161223 ) ) ( not ( = ?auto_161225 ?auto_161224 ) ) ( not ( = ?auto_161226 ?auto_161223 ) ) ( not ( = ?auto_161226 ?auto_161224 ) ) ( not ( = ?auto_161223 ?auto_161224 ) ) ( not ( = ?auto_161221 ?auto_161223 ) ) ( not ( = ?auto_161221 ?auto_161225 ) ) ( not ( = ?auto_161221 ?auto_161226 ) ) ( not ( = ?auto_161222 ?auto_161223 ) ) ( not ( = ?auto_161222 ?auto_161225 ) ) ( not ( = ?auto_161222 ?auto_161226 ) ) ( not ( = ?auto_161227 ?auto_161223 ) ) ( not ( = ?auto_161227 ?auto_161225 ) ) ( not ( = ?auto_161227 ?auto_161226 ) ) ( not ( = ?auto_161228 ?auto_161223 ) ) ( not ( = ?auto_161228 ?auto_161225 ) ) ( not ( = ?auto_161228 ?auto_161226 ) ) ( ON ?auto_161224 ?auto_161228 ) ( ON ?auto_161223 ?auto_161224 ) ( ON ?auto_161226 ?auto_161223 ) ( CLEAR ?auto_161226 ) ( HOLDING ?auto_161225 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161225 )
      ( MAKE-2PILE ?auto_161221 ?auto_161222 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161229 - BLOCK
      ?auto_161230 - BLOCK
    )
    :vars
    (
      ?auto_161234 - BLOCK
      ?auto_161233 - BLOCK
      ?auto_161231 - BLOCK
      ?auto_161232 - BLOCK
      ?auto_161236 - BLOCK
      ?auto_161235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161234 ?auto_161230 ) ( ON-TABLE ?auto_161229 ) ( ON ?auto_161230 ?auto_161229 ) ( not ( = ?auto_161229 ?auto_161230 ) ) ( not ( = ?auto_161229 ?auto_161234 ) ) ( not ( = ?auto_161230 ?auto_161234 ) ) ( not ( = ?auto_161229 ?auto_161233 ) ) ( not ( = ?auto_161229 ?auto_161231 ) ) ( not ( = ?auto_161230 ?auto_161233 ) ) ( not ( = ?auto_161230 ?auto_161231 ) ) ( not ( = ?auto_161234 ?auto_161233 ) ) ( not ( = ?auto_161234 ?auto_161231 ) ) ( not ( = ?auto_161233 ?auto_161231 ) ) ( ON ?auto_161233 ?auto_161234 ) ( not ( = ?auto_161232 ?auto_161236 ) ) ( not ( = ?auto_161232 ?auto_161235 ) ) ( not ( = ?auto_161232 ?auto_161231 ) ) ( not ( = ?auto_161236 ?auto_161235 ) ) ( not ( = ?auto_161236 ?auto_161231 ) ) ( not ( = ?auto_161235 ?auto_161231 ) ) ( not ( = ?auto_161229 ?auto_161235 ) ) ( not ( = ?auto_161229 ?auto_161232 ) ) ( not ( = ?auto_161229 ?auto_161236 ) ) ( not ( = ?auto_161230 ?auto_161235 ) ) ( not ( = ?auto_161230 ?auto_161232 ) ) ( not ( = ?auto_161230 ?auto_161236 ) ) ( not ( = ?auto_161234 ?auto_161235 ) ) ( not ( = ?auto_161234 ?auto_161232 ) ) ( not ( = ?auto_161234 ?auto_161236 ) ) ( not ( = ?auto_161233 ?auto_161235 ) ) ( not ( = ?auto_161233 ?auto_161232 ) ) ( not ( = ?auto_161233 ?auto_161236 ) ) ( ON ?auto_161231 ?auto_161233 ) ( ON ?auto_161235 ?auto_161231 ) ( ON ?auto_161236 ?auto_161235 ) ( ON ?auto_161232 ?auto_161236 ) ( CLEAR ?auto_161232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161229 ?auto_161230 ?auto_161234 ?auto_161233 ?auto_161231 ?auto_161235 ?auto_161236 )
      ( MAKE-2PILE ?auto_161229 ?auto_161230 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161237 - BLOCK
      ?auto_161238 - BLOCK
    )
    :vars
    (
      ?auto_161240 - BLOCK
      ?auto_161242 - BLOCK
      ?auto_161243 - BLOCK
      ?auto_161239 - BLOCK
      ?auto_161244 - BLOCK
      ?auto_161241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161240 ?auto_161238 ) ( ON-TABLE ?auto_161237 ) ( ON ?auto_161238 ?auto_161237 ) ( not ( = ?auto_161237 ?auto_161238 ) ) ( not ( = ?auto_161237 ?auto_161240 ) ) ( not ( = ?auto_161238 ?auto_161240 ) ) ( not ( = ?auto_161237 ?auto_161242 ) ) ( not ( = ?auto_161237 ?auto_161243 ) ) ( not ( = ?auto_161238 ?auto_161242 ) ) ( not ( = ?auto_161238 ?auto_161243 ) ) ( not ( = ?auto_161240 ?auto_161242 ) ) ( not ( = ?auto_161240 ?auto_161243 ) ) ( not ( = ?auto_161242 ?auto_161243 ) ) ( ON ?auto_161242 ?auto_161240 ) ( not ( = ?auto_161239 ?auto_161244 ) ) ( not ( = ?auto_161239 ?auto_161241 ) ) ( not ( = ?auto_161239 ?auto_161243 ) ) ( not ( = ?auto_161244 ?auto_161241 ) ) ( not ( = ?auto_161244 ?auto_161243 ) ) ( not ( = ?auto_161241 ?auto_161243 ) ) ( not ( = ?auto_161237 ?auto_161241 ) ) ( not ( = ?auto_161237 ?auto_161239 ) ) ( not ( = ?auto_161237 ?auto_161244 ) ) ( not ( = ?auto_161238 ?auto_161241 ) ) ( not ( = ?auto_161238 ?auto_161239 ) ) ( not ( = ?auto_161238 ?auto_161244 ) ) ( not ( = ?auto_161240 ?auto_161241 ) ) ( not ( = ?auto_161240 ?auto_161239 ) ) ( not ( = ?auto_161240 ?auto_161244 ) ) ( not ( = ?auto_161242 ?auto_161241 ) ) ( not ( = ?auto_161242 ?auto_161239 ) ) ( not ( = ?auto_161242 ?auto_161244 ) ) ( ON ?auto_161243 ?auto_161242 ) ( ON ?auto_161241 ?auto_161243 ) ( ON ?auto_161244 ?auto_161241 ) ( HOLDING ?auto_161239 ) ( CLEAR ?auto_161244 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161237 ?auto_161238 ?auto_161240 ?auto_161242 ?auto_161243 ?auto_161241 ?auto_161244 ?auto_161239 )
      ( MAKE-2PILE ?auto_161237 ?auto_161238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161245 - BLOCK
      ?auto_161246 - BLOCK
    )
    :vars
    (
      ?auto_161252 - BLOCK
      ?auto_161250 - BLOCK
      ?auto_161247 - BLOCK
      ?auto_161248 - BLOCK
      ?auto_161251 - BLOCK
      ?auto_161249 - BLOCK
      ?auto_161253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161252 ?auto_161246 ) ( ON-TABLE ?auto_161245 ) ( ON ?auto_161246 ?auto_161245 ) ( not ( = ?auto_161245 ?auto_161246 ) ) ( not ( = ?auto_161245 ?auto_161252 ) ) ( not ( = ?auto_161246 ?auto_161252 ) ) ( not ( = ?auto_161245 ?auto_161250 ) ) ( not ( = ?auto_161245 ?auto_161247 ) ) ( not ( = ?auto_161246 ?auto_161250 ) ) ( not ( = ?auto_161246 ?auto_161247 ) ) ( not ( = ?auto_161252 ?auto_161250 ) ) ( not ( = ?auto_161252 ?auto_161247 ) ) ( not ( = ?auto_161250 ?auto_161247 ) ) ( ON ?auto_161250 ?auto_161252 ) ( not ( = ?auto_161248 ?auto_161251 ) ) ( not ( = ?auto_161248 ?auto_161249 ) ) ( not ( = ?auto_161248 ?auto_161247 ) ) ( not ( = ?auto_161251 ?auto_161249 ) ) ( not ( = ?auto_161251 ?auto_161247 ) ) ( not ( = ?auto_161249 ?auto_161247 ) ) ( not ( = ?auto_161245 ?auto_161249 ) ) ( not ( = ?auto_161245 ?auto_161248 ) ) ( not ( = ?auto_161245 ?auto_161251 ) ) ( not ( = ?auto_161246 ?auto_161249 ) ) ( not ( = ?auto_161246 ?auto_161248 ) ) ( not ( = ?auto_161246 ?auto_161251 ) ) ( not ( = ?auto_161252 ?auto_161249 ) ) ( not ( = ?auto_161252 ?auto_161248 ) ) ( not ( = ?auto_161252 ?auto_161251 ) ) ( not ( = ?auto_161250 ?auto_161249 ) ) ( not ( = ?auto_161250 ?auto_161248 ) ) ( not ( = ?auto_161250 ?auto_161251 ) ) ( ON ?auto_161247 ?auto_161250 ) ( ON ?auto_161249 ?auto_161247 ) ( ON ?auto_161251 ?auto_161249 ) ( CLEAR ?auto_161251 ) ( ON ?auto_161248 ?auto_161253 ) ( CLEAR ?auto_161248 ) ( HAND-EMPTY ) ( not ( = ?auto_161245 ?auto_161253 ) ) ( not ( = ?auto_161246 ?auto_161253 ) ) ( not ( = ?auto_161252 ?auto_161253 ) ) ( not ( = ?auto_161250 ?auto_161253 ) ) ( not ( = ?auto_161247 ?auto_161253 ) ) ( not ( = ?auto_161248 ?auto_161253 ) ) ( not ( = ?auto_161251 ?auto_161253 ) ) ( not ( = ?auto_161249 ?auto_161253 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161248 ?auto_161253 )
      ( MAKE-2PILE ?auto_161245 ?auto_161246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161254 - BLOCK
      ?auto_161255 - BLOCK
    )
    :vars
    (
      ?auto_161261 - BLOCK
      ?auto_161258 - BLOCK
      ?auto_161257 - BLOCK
      ?auto_161262 - BLOCK
      ?auto_161260 - BLOCK
      ?auto_161256 - BLOCK
      ?auto_161259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161261 ?auto_161255 ) ( ON-TABLE ?auto_161254 ) ( ON ?auto_161255 ?auto_161254 ) ( not ( = ?auto_161254 ?auto_161255 ) ) ( not ( = ?auto_161254 ?auto_161261 ) ) ( not ( = ?auto_161255 ?auto_161261 ) ) ( not ( = ?auto_161254 ?auto_161258 ) ) ( not ( = ?auto_161254 ?auto_161257 ) ) ( not ( = ?auto_161255 ?auto_161258 ) ) ( not ( = ?auto_161255 ?auto_161257 ) ) ( not ( = ?auto_161261 ?auto_161258 ) ) ( not ( = ?auto_161261 ?auto_161257 ) ) ( not ( = ?auto_161258 ?auto_161257 ) ) ( ON ?auto_161258 ?auto_161261 ) ( not ( = ?auto_161262 ?auto_161260 ) ) ( not ( = ?auto_161262 ?auto_161256 ) ) ( not ( = ?auto_161262 ?auto_161257 ) ) ( not ( = ?auto_161260 ?auto_161256 ) ) ( not ( = ?auto_161260 ?auto_161257 ) ) ( not ( = ?auto_161256 ?auto_161257 ) ) ( not ( = ?auto_161254 ?auto_161256 ) ) ( not ( = ?auto_161254 ?auto_161262 ) ) ( not ( = ?auto_161254 ?auto_161260 ) ) ( not ( = ?auto_161255 ?auto_161256 ) ) ( not ( = ?auto_161255 ?auto_161262 ) ) ( not ( = ?auto_161255 ?auto_161260 ) ) ( not ( = ?auto_161261 ?auto_161256 ) ) ( not ( = ?auto_161261 ?auto_161262 ) ) ( not ( = ?auto_161261 ?auto_161260 ) ) ( not ( = ?auto_161258 ?auto_161256 ) ) ( not ( = ?auto_161258 ?auto_161262 ) ) ( not ( = ?auto_161258 ?auto_161260 ) ) ( ON ?auto_161257 ?auto_161258 ) ( ON ?auto_161256 ?auto_161257 ) ( ON ?auto_161262 ?auto_161259 ) ( CLEAR ?auto_161262 ) ( not ( = ?auto_161254 ?auto_161259 ) ) ( not ( = ?auto_161255 ?auto_161259 ) ) ( not ( = ?auto_161261 ?auto_161259 ) ) ( not ( = ?auto_161258 ?auto_161259 ) ) ( not ( = ?auto_161257 ?auto_161259 ) ) ( not ( = ?auto_161262 ?auto_161259 ) ) ( not ( = ?auto_161260 ?auto_161259 ) ) ( not ( = ?auto_161256 ?auto_161259 ) ) ( HOLDING ?auto_161260 ) ( CLEAR ?auto_161256 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161254 ?auto_161255 ?auto_161261 ?auto_161258 ?auto_161257 ?auto_161256 ?auto_161260 )
      ( MAKE-2PILE ?auto_161254 ?auto_161255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161263 - BLOCK
      ?auto_161264 - BLOCK
    )
    :vars
    (
      ?auto_161265 - BLOCK
      ?auto_161266 - BLOCK
      ?auto_161270 - BLOCK
      ?auto_161269 - BLOCK
      ?auto_161268 - BLOCK
      ?auto_161267 - BLOCK
      ?auto_161271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161265 ?auto_161264 ) ( ON-TABLE ?auto_161263 ) ( ON ?auto_161264 ?auto_161263 ) ( not ( = ?auto_161263 ?auto_161264 ) ) ( not ( = ?auto_161263 ?auto_161265 ) ) ( not ( = ?auto_161264 ?auto_161265 ) ) ( not ( = ?auto_161263 ?auto_161266 ) ) ( not ( = ?auto_161263 ?auto_161270 ) ) ( not ( = ?auto_161264 ?auto_161266 ) ) ( not ( = ?auto_161264 ?auto_161270 ) ) ( not ( = ?auto_161265 ?auto_161266 ) ) ( not ( = ?auto_161265 ?auto_161270 ) ) ( not ( = ?auto_161266 ?auto_161270 ) ) ( ON ?auto_161266 ?auto_161265 ) ( not ( = ?auto_161269 ?auto_161268 ) ) ( not ( = ?auto_161269 ?auto_161267 ) ) ( not ( = ?auto_161269 ?auto_161270 ) ) ( not ( = ?auto_161268 ?auto_161267 ) ) ( not ( = ?auto_161268 ?auto_161270 ) ) ( not ( = ?auto_161267 ?auto_161270 ) ) ( not ( = ?auto_161263 ?auto_161267 ) ) ( not ( = ?auto_161263 ?auto_161269 ) ) ( not ( = ?auto_161263 ?auto_161268 ) ) ( not ( = ?auto_161264 ?auto_161267 ) ) ( not ( = ?auto_161264 ?auto_161269 ) ) ( not ( = ?auto_161264 ?auto_161268 ) ) ( not ( = ?auto_161265 ?auto_161267 ) ) ( not ( = ?auto_161265 ?auto_161269 ) ) ( not ( = ?auto_161265 ?auto_161268 ) ) ( not ( = ?auto_161266 ?auto_161267 ) ) ( not ( = ?auto_161266 ?auto_161269 ) ) ( not ( = ?auto_161266 ?auto_161268 ) ) ( ON ?auto_161270 ?auto_161266 ) ( ON ?auto_161267 ?auto_161270 ) ( ON ?auto_161269 ?auto_161271 ) ( not ( = ?auto_161263 ?auto_161271 ) ) ( not ( = ?auto_161264 ?auto_161271 ) ) ( not ( = ?auto_161265 ?auto_161271 ) ) ( not ( = ?auto_161266 ?auto_161271 ) ) ( not ( = ?auto_161270 ?auto_161271 ) ) ( not ( = ?auto_161269 ?auto_161271 ) ) ( not ( = ?auto_161268 ?auto_161271 ) ) ( not ( = ?auto_161267 ?auto_161271 ) ) ( CLEAR ?auto_161267 ) ( ON ?auto_161268 ?auto_161269 ) ( CLEAR ?auto_161268 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161271 ?auto_161269 )
      ( MAKE-2PILE ?auto_161263 ?auto_161264 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161272 - BLOCK
      ?auto_161273 - BLOCK
    )
    :vars
    (
      ?auto_161275 - BLOCK
      ?auto_161279 - BLOCK
      ?auto_161278 - BLOCK
      ?auto_161277 - BLOCK
      ?auto_161280 - BLOCK
      ?auto_161274 - BLOCK
      ?auto_161276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161275 ?auto_161273 ) ( ON-TABLE ?auto_161272 ) ( ON ?auto_161273 ?auto_161272 ) ( not ( = ?auto_161272 ?auto_161273 ) ) ( not ( = ?auto_161272 ?auto_161275 ) ) ( not ( = ?auto_161273 ?auto_161275 ) ) ( not ( = ?auto_161272 ?auto_161279 ) ) ( not ( = ?auto_161272 ?auto_161278 ) ) ( not ( = ?auto_161273 ?auto_161279 ) ) ( not ( = ?auto_161273 ?auto_161278 ) ) ( not ( = ?auto_161275 ?auto_161279 ) ) ( not ( = ?auto_161275 ?auto_161278 ) ) ( not ( = ?auto_161279 ?auto_161278 ) ) ( ON ?auto_161279 ?auto_161275 ) ( not ( = ?auto_161277 ?auto_161280 ) ) ( not ( = ?auto_161277 ?auto_161274 ) ) ( not ( = ?auto_161277 ?auto_161278 ) ) ( not ( = ?auto_161280 ?auto_161274 ) ) ( not ( = ?auto_161280 ?auto_161278 ) ) ( not ( = ?auto_161274 ?auto_161278 ) ) ( not ( = ?auto_161272 ?auto_161274 ) ) ( not ( = ?auto_161272 ?auto_161277 ) ) ( not ( = ?auto_161272 ?auto_161280 ) ) ( not ( = ?auto_161273 ?auto_161274 ) ) ( not ( = ?auto_161273 ?auto_161277 ) ) ( not ( = ?auto_161273 ?auto_161280 ) ) ( not ( = ?auto_161275 ?auto_161274 ) ) ( not ( = ?auto_161275 ?auto_161277 ) ) ( not ( = ?auto_161275 ?auto_161280 ) ) ( not ( = ?auto_161279 ?auto_161274 ) ) ( not ( = ?auto_161279 ?auto_161277 ) ) ( not ( = ?auto_161279 ?auto_161280 ) ) ( ON ?auto_161278 ?auto_161279 ) ( ON ?auto_161277 ?auto_161276 ) ( not ( = ?auto_161272 ?auto_161276 ) ) ( not ( = ?auto_161273 ?auto_161276 ) ) ( not ( = ?auto_161275 ?auto_161276 ) ) ( not ( = ?auto_161279 ?auto_161276 ) ) ( not ( = ?auto_161278 ?auto_161276 ) ) ( not ( = ?auto_161277 ?auto_161276 ) ) ( not ( = ?auto_161280 ?auto_161276 ) ) ( not ( = ?auto_161274 ?auto_161276 ) ) ( ON ?auto_161280 ?auto_161277 ) ( CLEAR ?auto_161280 ) ( ON-TABLE ?auto_161276 ) ( HOLDING ?auto_161274 ) ( CLEAR ?auto_161278 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161272 ?auto_161273 ?auto_161275 ?auto_161279 ?auto_161278 ?auto_161274 )
      ( MAKE-2PILE ?auto_161272 ?auto_161273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161281 - BLOCK
      ?auto_161282 - BLOCK
    )
    :vars
    (
      ?auto_161286 - BLOCK
      ?auto_161288 - BLOCK
      ?auto_161289 - BLOCK
      ?auto_161285 - BLOCK
      ?auto_161283 - BLOCK
      ?auto_161284 - BLOCK
      ?auto_161287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161286 ?auto_161282 ) ( ON-TABLE ?auto_161281 ) ( ON ?auto_161282 ?auto_161281 ) ( not ( = ?auto_161281 ?auto_161282 ) ) ( not ( = ?auto_161281 ?auto_161286 ) ) ( not ( = ?auto_161282 ?auto_161286 ) ) ( not ( = ?auto_161281 ?auto_161288 ) ) ( not ( = ?auto_161281 ?auto_161289 ) ) ( not ( = ?auto_161282 ?auto_161288 ) ) ( not ( = ?auto_161282 ?auto_161289 ) ) ( not ( = ?auto_161286 ?auto_161288 ) ) ( not ( = ?auto_161286 ?auto_161289 ) ) ( not ( = ?auto_161288 ?auto_161289 ) ) ( ON ?auto_161288 ?auto_161286 ) ( not ( = ?auto_161285 ?auto_161283 ) ) ( not ( = ?auto_161285 ?auto_161284 ) ) ( not ( = ?auto_161285 ?auto_161289 ) ) ( not ( = ?auto_161283 ?auto_161284 ) ) ( not ( = ?auto_161283 ?auto_161289 ) ) ( not ( = ?auto_161284 ?auto_161289 ) ) ( not ( = ?auto_161281 ?auto_161284 ) ) ( not ( = ?auto_161281 ?auto_161285 ) ) ( not ( = ?auto_161281 ?auto_161283 ) ) ( not ( = ?auto_161282 ?auto_161284 ) ) ( not ( = ?auto_161282 ?auto_161285 ) ) ( not ( = ?auto_161282 ?auto_161283 ) ) ( not ( = ?auto_161286 ?auto_161284 ) ) ( not ( = ?auto_161286 ?auto_161285 ) ) ( not ( = ?auto_161286 ?auto_161283 ) ) ( not ( = ?auto_161288 ?auto_161284 ) ) ( not ( = ?auto_161288 ?auto_161285 ) ) ( not ( = ?auto_161288 ?auto_161283 ) ) ( ON ?auto_161289 ?auto_161288 ) ( ON ?auto_161285 ?auto_161287 ) ( not ( = ?auto_161281 ?auto_161287 ) ) ( not ( = ?auto_161282 ?auto_161287 ) ) ( not ( = ?auto_161286 ?auto_161287 ) ) ( not ( = ?auto_161288 ?auto_161287 ) ) ( not ( = ?auto_161289 ?auto_161287 ) ) ( not ( = ?auto_161285 ?auto_161287 ) ) ( not ( = ?auto_161283 ?auto_161287 ) ) ( not ( = ?auto_161284 ?auto_161287 ) ) ( ON ?auto_161283 ?auto_161285 ) ( ON-TABLE ?auto_161287 ) ( CLEAR ?auto_161289 ) ( ON ?auto_161284 ?auto_161283 ) ( CLEAR ?auto_161284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161287 ?auto_161285 ?auto_161283 )
      ( MAKE-2PILE ?auto_161281 ?auto_161282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161290 - BLOCK
      ?auto_161291 - BLOCK
    )
    :vars
    (
      ?auto_161297 - BLOCK
      ?auto_161293 - BLOCK
      ?auto_161296 - BLOCK
      ?auto_161295 - BLOCK
      ?auto_161298 - BLOCK
      ?auto_161292 - BLOCK
      ?auto_161294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161297 ?auto_161291 ) ( ON-TABLE ?auto_161290 ) ( ON ?auto_161291 ?auto_161290 ) ( not ( = ?auto_161290 ?auto_161291 ) ) ( not ( = ?auto_161290 ?auto_161297 ) ) ( not ( = ?auto_161291 ?auto_161297 ) ) ( not ( = ?auto_161290 ?auto_161293 ) ) ( not ( = ?auto_161290 ?auto_161296 ) ) ( not ( = ?auto_161291 ?auto_161293 ) ) ( not ( = ?auto_161291 ?auto_161296 ) ) ( not ( = ?auto_161297 ?auto_161293 ) ) ( not ( = ?auto_161297 ?auto_161296 ) ) ( not ( = ?auto_161293 ?auto_161296 ) ) ( ON ?auto_161293 ?auto_161297 ) ( not ( = ?auto_161295 ?auto_161298 ) ) ( not ( = ?auto_161295 ?auto_161292 ) ) ( not ( = ?auto_161295 ?auto_161296 ) ) ( not ( = ?auto_161298 ?auto_161292 ) ) ( not ( = ?auto_161298 ?auto_161296 ) ) ( not ( = ?auto_161292 ?auto_161296 ) ) ( not ( = ?auto_161290 ?auto_161292 ) ) ( not ( = ?auto_161290 ?auto_161295 ) ) ( not ( = ?auto_161290 ?auto_161298 ) ) ( not ( = ?auto_161291 ?auto_161292 ) ) ( not ( = ?auto_161291 ?auto_161295 ) ) ( not ( = ?auto_161291 ?auto_161298 ) ) ( not ( = ?auto_161297 ?auto_161292 ) ) ( not ( = ?auto_161297 ?auto_161295 ) ) ( not ( = ?auto_161297 ?auto_161298 ) ) ( not ( = ?auto_161293 ?auto_161292 ) ) ( not ( = ?auto_161293 ?auto_161295 ) ) ( not ( = ?auto_161293 ?auto_161298 ) ) ( ON ?auto_161295 ?auto_161294 ) ( not ( = ?auto_161290 ?auto_161294 ) ) ( not ( = ?auto_161291 ?auto_161294 ) ) ( not ( = ?auto_161297 ?auto_161294 ) ) ( not ( = ?auto_161293 ?auto_161294 ) ) ( not ( = ?auto_161296 ?auto_161294 ) ) ( not ( = ?auto_161295 ?auto_161294 ) ) ( not ( = ?auto_161298 ?auto_161294 ) ) ( not ( = ?auto_161292 ?auto_161294 ) ) ( ON ?auto_161298 ?auto_161295 ) ( ON-TABLE ?auto_161294 ) ( ON ?auto_161292 ?auto_161298 ) ( CLEAR ?auto_161292 ) ( HOLDING ?auto_161296 ) ( CLEAR ?auto_161293 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161290 ?auto_161291 ?auto_161297 ?auto_161293 ?auto_161296 )
      ( MAKE-2PILE ?auto_161290 ?auto_161291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161299 - BLOCK
      ?auto_161300 - BLOCK
    )
    :vars
    (
      ?auto_161306 - BLOCK
      ?auto_161307 - BLOCK
      ?auto_161304 - BLOCK
      ?auto_161301 - BLOCK
      ?auto_161305 - BLOCK
      ?auto_161302 - BLOCK
      ?auto_161303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161306 ?auto_161300 ) ( ON-TABLE ?auto_161299 ) ( ON ?auto_161300 ?auto_161299 ) ( not ( = ?auto_161299 ?auto_161300 ) ) ( not ( = ?auto_161299 ?auto_161306 ) ) ( not ( = ?auto_161300 ?auto_161306 ) ) ( not ( = ?auto_161299 ?auto_161307 ) ) ( not ( = ?auto_161299 ?auto_161304 ) ) ( not ( = ?auto_161300 ?auto_161307 ) ) ( not ( = ?auto_161300 ?auto_161304 ) ) ( not ( = ?auto_161306 ?auto_161307 ) ) ( not ( = ?auto_161306 ?auto_161304 ) ) ( not ( = ?auto_161307 ?auto_161304 ) ) ( ON ?auto_161307 ?auto_161306 ) ( not ( = ?auto_161301 ?auto_161305 ) ) ( not ( = ?auto_161301 ?auto_161302 ) ) ( not ( = ?auto_161301 ?auto_161304 ) ) ( not ( = ?auto_161305 ?auto_161302 ) ) ( not ( = ?auto_161305 ?auto_161304 ) ) ( not ( = ?auto_161302 ?auto_161304 ) ) ( not ( = ?auto_161299 ?auto_161302 ) ) ( not ( = ?auto_161299 ?auto_161301 ) ) ( not ( = ?auto_161299 ?auto_161305 ) ) ( not ( = ?auto_161300 ?auto_161302 ) ) ( not ( = ?auto_161300 ?auto_161301 ) ) ( not ( = ?auto_161300 ?auto_161305 ) ) ( not ( = ?auto_161306 ?auto_161302 ) ) ( not ( = ?auto_161306 ?auto_161301 ) ) ( not ( = ?auto_161306 ?auto_161305 ) ) ( not ( = ?auto_161307 ?auto_161302 ) ) ( not ( = ?auto_161307 ?auto_161301 ) ) ( not ( = ?auto_161307 ?auto_161305 ) ) ( ON ?auto_161301 ?auto_161303 ) ( not ( = ?auto_161299 ?auto_161303 ) ) ( not ( = ?auto_161300 ?auto_161303 ) ) ( not ( = ?auto_161306 ?auto_161303 ) ) ( not ( = ?auto_161307 ?auto_161303 ) ) ( not ( = ?auto_161304 ?auto_161303 ) ) ( not ( = ?auto_161301 ?auto_161303 ) ) ( not ( = ?auto_161305 ?auto_161303 ) ) ( not ( = ?auto_161302 ?auto_161303 ) ) ( ON ?auto_161305 ?auto_161301 ) ( ON-TABLE ?auto_161303 ) ( ON ?auto_161302 ?auto_161305 ) ( CLEAR ?auto_161307 ) ( ON ?auto_161304 ?auto_161302 ) ( CLEAR ?auto_161304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161303 ?auto_161301 ?auto_161305 ?auto_161302 )
      ( MAKE-2PILE ?auto_161299 ?auto_161300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161308 - BLOCK
      ?auto_161309 - BLOCK
    )
    :vars
    (
      ?auto_161316 - BLOCK
      ?auto_161315 - BLOCK
      ?auto_161310 - BLOCK
      ?auto_161313 - BLOCK
      ?auto_161314 - BLOCK
      ?auto_161312 - BLOCK
      ?auto_161311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161316 ?auto_161309 ) ( ON-TABLE ?auto_161308 ) ( ON ?auto_161309 ?auto_161308 ) ( not ( = ?auto_161308 ?auto_161309 ) ) ( not ( = ?auto_161308 ?auto_161316 ) ) ( not ( = ?auto_161309 ?auto_161316 ) ) ( not ( = ?auto_161308 ?auto_161315 ) ) ( not ( = ?auto_161308 ?auto_161310 ) ) ( not ( = ?auto_161309 ?auto_161315 ) ) ( not ( = ?auto_161309 ?auto_161310 ) ) ( not ( = ?auto_161316 ?auto_161315 ) ) ( not ( = ?auto_161316 ?auto_161310 ) ) ( not ( = ?auto_161315 ?auto_161310 ) ) ( not ( = ?auto_161313 ?auto_161314 ) ) ( not ( = ?auto_161313 ?auto_161312 ) ) ( not ( = ?auto_161313 ?auto_161310 ) ) ( not ( = ?auto_161314 ?auto_161312 ) ) ( not ( = ?auto_161314 ?auto_161310 ) ) ( not ( = ?auto_161312 ?auto_161310 ) ) ( not ( = ?auto_161308 ?auto_161312 ) ) ( not ( = ?auto_161308 ?auto_161313 ) ) ( not ( = ?auto_161308 ?auto_161314 ) ) ( not ( = ?auto_161309 ?auto_161312 ) ) ( not ( = ?auto_161309 ?auto_161313 ) ) ( not ( = ?auto_161309 ?auto_161314 ) ) ( not ( = ?auto_161316 ?auto_161312 ) ) ( not ( = ?auto_161316 ?auto_161313 ) ) ( not ( = ?auto_161316 ?auto_161314 ) ) ( not ( = ?auto_161315 ?auto_161312 ) ) ( not ( = ?auto_161315 ?auto_161313 ) ) ( not ( = ?auto_161315 ?auto_161314 ) ) ( ON ?auto_161313 ?auto_161311 ) ( not ( = ?auto_161308 ?auto_161311 ) ) ( not ( = ?auto_161309 ?auto_161311 ) ) ( not ( = ?auto_161316 ?auto_161311 ) ) ( not ( = ?auto_161315 ?auto_161311 ) ) ( not ( = ?auto_161310 ?auto_161311 ) ) ( not ( = ?auto_161313 ?auto_161311 ) ) ( not ( = ?auto_161314 ?auto_161311 ) ) ( not ( = ?auto_161312 ?auto_161311 ) ) ( ON ?auto_161314 ?auto_161313 ) ( ON-TABLE ?auto_161311 ) ( ON ?auto_161312 ?auto_161314 ) ( ON ?auto_161310 ?auto_161312 ) ( CLEAR ?auto_161310 ) ( HOLDING ?auto_161315 ) ( CLEAR ?auto_161316 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161308 ?auto_161309 ?auto_161316 ?auto_161315 )
      ( MAKE-2PILE ?auto_161308 ?auto_161309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161317 - BLOCK
      ?auto_161318 - BLOCK
    )
    :vars
    (
      ?auto_161319 - BLOCK
      ?auto_161320 - BLOCK
      ?auto_161324 - BLOCK
      ?auto_161321 - BLOCK
      ?auto_161325 - BLOCK
      ?auto_161322 - BLOCK
      ?auto_161323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161319 ?auto_161318 ) ( ON-TABLE ?auto_161317 ) ( ON ?auto_161318 ?auto_161317 ) ( not ( = ?auto_161317 ?auto_161318 ) ) ( not ( = ?auto_161317 ?auto_161319 ) ) ( not ( = ?auto_161318 ?auto_161319 ) ) ( not ( = ?auto_161317 ?auto_161320 ) ) ( not ( = ?auto_161317 ?auto_161324 ) ) ( not ( = ?auto_161318 ?auto_161320 ) ) ( not ( = ?auto_161318 ?auto_161324 ) ) ( not ( = ?auto_161319 ?auto_161320 ) ) ( not ( = ?auto_161319 ?auto_161324 ) ) ( not ( = ?auto_161320 ?auto_161324 ) ) ( not ( = ?auto_161321 ?auto_161325 ) ) ( not ( = ?auto_161321 ?auto_161322 ) ) ( not ( = ?auto_161321 ?auto_161324 ) ) ( not ( = ?auto_161325 ?auto_161322 ) ) ( not ( = ?auto_161325 ?auto_161324 ) ) ( not ( = ?auto_161322 ?auto_161324 ) ) ( not ( = ?auto_161317 ?auto_161322 ) ) ( not ( = ?auto_161317 ?auto_161321 ) ) ( not ( = ?auto_161317 ?auto_161325 ) ) ( not ( = ?auto_161318 ?auto_161322 ) ) ( not ( = ?auto_161318 ?auto_161321 ) ) ( not ( = ?auto_161318 ?auto_161325 ) ) ( not ( = ?auto_161319 ?auto_161322 ) ) ( not ( = ?auto_161319 ?auto_161321 ) ) ( not ( = ?auto_161319 ?auto_161325 ) ) ( not ( = ?auto_161320 ?auto_161322 ) ) ( not ( = ?auto_161320 ?auto_161321 ) ) ( not ( = ?auto_161320 ?auto_161325 ) ) ( ON ?auto_161321 ?auto_161323 ) ( not ( = ?auto_161317 ?auto_161323 ) ) ( not ( = ?auto_161318 ?auto_161323 ) ) ( not ( = ?auto_161319 ?auto_161323 ) ) ( not ( = ?auto_161320 ?auto_161323 ) ) ( not ( = ?auto_161324 ?auto_161323 ) ) ( not ( = ?auto_161321 ?auto_161323 ) ) ( not ( = ?auto_161325 ?auto_161323 ) ) ( not ( = ?auto_161322 ?auto_161323 ) ) ( ON ?auto_161325 ?auto_161321 ) ( ON-TABLE ?auto_161323 ) ( ON ?auto_161322 ?auto_161325 ) ( ON ?auto_161324 ?auto_161322 ) ( CLEAR ?auto_161319 ) ( ON ?auto_161320 ?auto_161324 ) ( CLEAR ?auto_161320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161323 ?auto_161321 ?auto_161325 ?auto_161322 ?auto_161324 )
      ( MAKE-2PILE ?auto_161317 ?auto_161318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161344 - BLOCK
      ?auto_161345 - BLOCK
    )
    :vars
    (
      ?auto_161348 - BLOCK
      ?auto_161350 - BLOCK
      ?auto_161349 - BLOCK
      ?auto_161352 - BLOCK
      ?auto_161347 - BLOCK
      ?auto_161346 - BLOCK
      ?auto_161351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161344 ) ( not ( = ?auto_161344 ?auto_161345 ) ) ( not ( = ?auto_161344 ?auto_161348 ) ) ( not ( = ?auto_161345 ?auto_161348 ) ) ( not ( = ?auto_161344 ?auto_161350 ) ) ( not ( = ?auto_161344 ?auto_161349 ) ) ( not ( = ?auto_161345 ?auto_161350 ) ) ( not ( = ?auto_161345 ?auto_161349 ) ) ( not ( = ?auto_161348 ?auto_161350 ) ) ( not ( = ?auto_161348 ?auto_161349 ) ) ( not ( = ?auto_161350 ?auto_161349 ) ) ( not ( = ?auto_161352 ?auto_161347 ) ) ( not ( = ?auto_161352 ?auto_161346 ) ) ( not ( = ?auto_161352 ?auto_161349 ) ) ( not ( = ?auto_161347 ?auto_161346 ) ) ( not ( = ?auto_161347 ?auto_161349 ) ) ( not ( = ?auto_161346 ?auto_161349 ) ) ( not ( = ?auto_161344 ?auto_161346 ) ) ( not ( = ?auto_161344 ?auto_161352 ) ) ( not ( = ?auto_161344 ?auto_161347 ) ) ( not ( = ?auto_161345 ?auto_161346 ) ) ( not ( = ?auto_161345 ?auto_161352 ) ) ( not ( = ?auto_161345 ?auto_161347 ) ) ( not ( = ?auto_161348 ?auto_161346 ) ) ( not ( = ?auto_161348 ?auto_161352 ) ) ( not ( = ?auto_161348 ?auto_161347 ) ) ( not ( = ?auto_161350 ?auto_161346 ) ) ( not ( = ?auto_161350 ?auto_161352 ) ) ( not ( = ?auto_161350 ?auto_161347 ) ) ( ON ?auto_161352 ?auto_161351 ) ( not ( = ?auto_161344 ?auto_161351 ) ) ( not ( = ?auto_161345 ?auto_161351 ) ) ( not ( = ?auto_161348 ?auto_161351 ) ) ( not ( = ?auto_161350 ?auto_161351 ) ) ( not ( = ?auto_161349 ?auto_161351 ) ) ( not ( = ?auto_161352 ?auto_161351 ) ) ( not ( = ?auto_161347 ?auto_161351 ) ) ( not ( = ?auto_161346 ?auto_161351 ) ) ( ON ?auto_161347 ?auto_161352 ) ( ON-TABLE ?auto_161351 ) ( ON ?auto_161346 ?auto_161347 ) ( ON ?auto_161349 ?auto_161346 ) ( ON ?auto_161350 ?auto_161349 ) ( ON ?auto_161348 ?auto_161350 ) ( CLEAR ?auto_161348 ) ( HOLDING ?auto_161345 ) ( CLEAR ?auto_161344 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161344 ?auto_161345 ?auto_161348 )
      ( MAKE-2PILE ?auto_161344 ?auto_161345 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161353 - BLOCK
      ?auto_161354 - BLOCK
    )
    :vars
    (
      ?auto_161358 - BLOCK
      ?auto_161361 - BLOCK
      ?auto_161356 - BLOCK
      ?auto_161357 - BLOCK
      ?auto_161359 - BLOCK
      ?auto_161360 - BLOCK
      ?auto_161355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161353 ) ( not ( = ?auto_161353 ?auto_161354 ) ) ( not ( = ?auto_161353 ?auto_161358 ) ) ( not ( = ?auto_161354 ?auto_161358 ) ) ( not ( = ?auto_161353 ?auto_161361 ) ) ( not ( = ?auto_161353 ?auto_161356 ) ) ( not ( = ?auto_161354 ?auto_161361 ) ) ( not ( = ?auto_161354 ?auto_161356 ) ) ( not ( = ?auto_161358 ?auto_161361 ) ) ( not ( = ?auto_161358 ?auto_161356 ) ) ( not ( = ?auto_161361 ?auto_161356 ) ) ( not ( = ?auto_161357 ?auto_161359 ) ) ( not ( = ?auto_161357 ?auto_161360 ) ) ( not ( = ?auto_161357 ?auto_161356 ) ) ( not ( = ?auto_161359 ?auto_161360 ) ) ( not ( = ?auto_161359 ?auto_161356 ) ) ( not ( = ?auto_161360 ?auto_161356 ) ) ( not ( = ?auto_161353 ?auto_161360 ) ) ( not ( = ?auto_161353 ?auto_161357 ) ) ( not ( = ?auto_161353 ?auto_161359 ) ) ( not ( = ?auto_161354 ?auto_161360 ) ) ( not ( = ?auto_161354 ?auto_161357 ) ) ( not ( = ?auto_161354 ?auto_161359 ) ) ( not ( = ?auto_161358 ?auto_161360 ) ) ( not ( = ?auto_161358 ?auto_161357 ) ) ( not ( = ?auto_161358 ?auto_161359 ) ) ( not ( = ?auto_161361 ?auto_161360 ) ) ( not ( = ?auto_161361 ?auto_161357 ) ) ( not ( = ?auto_161361 ?auto_161359 ) ) ( ON ?auto_161357 ?auto_161355 ) ( not ( = ?auto_161353 ?auto_161355 ) ) ( not ( = ?auto_161354 ?auto_161355 ) ) ( not ( = ?auto_161358 ?auto_161355 ) ) ( not ( = ?auto_161361 ?auto_161355 ) ) ( not ( = ?auto_161356 ?auto_161355 ) ) ( not ( = ?auto_161357 ?auto_161355 ) ) ( not ( = ?auto_161359 ?auto_161355 ) ) ( not ( = ?auto_161360 ?auto_161355 ) ) ( ON ?auto_161359 ?auto_161357 ) ( ON-TABLE ?auto_161355 ) ( ON ?auto_161360 ?auto_161359 ) ( ON ?auto_161356 ?auto_161360 ) ( ON ?auto_161361 ?auto_161356 ) ( ON ?auto_161358 ?auto_161361 ) ( CLEAR ?auto_161353 ) ( ON ?auto_161354 ?auto_161358 ) ( CLEAR ?auto_161354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161355 ?auto_161357 ?auto_161359 ?auto_161360 ?auto_161356 ?auto_161361 ?auto_161358 )
      ( MAKE-2PILE ?auto_161353 ?auto_161354 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161362 - BLOCK
      ?auto_161363 - BLOCK
    )
    :vars
    (
      ?auto_161367 - BLOCK
      ?auto_161370 - BLOCK
      ?auto_161369 - BLOCK
      ?auto_161364 - BLOCK
      ?auto_161365 - BLOCK
      ?auto_161366 - BLOCK
      ?auto_161368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161362 ?auto_161363 ) ) ( not ( = ?auto_161362 ?auto_161367 ) ) ( not ( = ?auto_161363 ?auto_161367 ) ) ( not ( = ?auto_161362 ?auto_161370 ) ) ( not ( = ?auto_161362 ?auto_161369 ) ) ( not ( = ?auto_161363 ?auto_161370 ) ) ( not ( = ?auto_161363 ?auto_161369 ) ) ( not ( = ?auto_161367 ?auto_161370 ) ) ( not ( = ?auto_161367 ?auto_161369 ) ) ( not ( = ?auto_161370 ?auto_161369 ) ) ( not ( = ?auto_161364 ?auto_161365 ) ) ( not ( = ?auto_161364 ?auto_161366 ) ) ( not ( = ?auto_161364 ?auto_161369 ) ) ( not ( = ?auto_161365 ?auto_161366 ) ) ( not ( = ?auto_161365 ?auto_161369 ) ) ( not ( = ?auto_161366 ?auto_161369 ) ) ( not ( = ?auto_161362 ?auto_161366 ) ) ( not ( = ?auto_161362 ?auto_161364 ) ) ( not ( = ?auto_161362 ?auto_161365 ) ) ( not ( = ?auto_161363 ?auto_161366 ) ) ( not ( = ?auto_161363 ?auto_161364 ) ) ( not ( = ?auto_161363 ?auto_161365 ) ) ( not ( = ?auto_161367 ?auto_161366 ) ) ( not ( = ?auto_161367 ?auto_161364 ) ) ( not ( = ?auto_161367 ?auto_161365 ) ) ( not ( = ?auto_161370 ?auto_161366 ) ) ( not ( = ?auto_161370 ?auto_161364 ) ) ( not ( = ?auto_161370 ?auto_161365 ) ) ( ON ?auto_161364 ?auto_161368 ) ( not ( = ?auto_161362 ?auto_161368 ) ) ( not ( = ?auto_161363 ?auto_161368 ) ) ( not ( = ?auto_161367 ?auto_161368 ) ) ( not ( = ?auto_161370 ?auto_161368 ) ) ( not ( = ?auto_161369 ?auto_161368 ) ) ( not ( = ?auto_161364 ?auto_161368 ) ) ( not ( = ?auto_161365 ?auto_161368 ) ) ( not ( = ?auto_161366 ?auto_161368 ) ) ( ON ?auto_161365 ?auto_161364 ) ( ON-TABLE ?auto_161368 ) ( ON ?auto_161366 ?auto_161365 ) ( ON ?auto_161369 ?auto_161366 ) ( ON ?auto_161370 ?auto_161369 ) ( ON ?auto_161367 ?auto_161370 ) ( ON ?auto_161363 ?auto_161367 ) ( CLEAR ?auto_161363 ) ( HOLDING ?auto_161362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161362 )
      ( MAKE-2PILE ?auto_161362 ?auto_161363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161371 - BLOCK
      ?auto_161372 - BLOCK
    )
    :vars
    (
      ?auto_161375 - BLOCK
      ?auto_161374 - BLOCK
      ?auto_161376 - BLOCK
      ?auto_161377 - BLOCK
      ?auto_161373 - BLOCK
      ?auto_161378 - BLOCK
      ?auto_161379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161371 ?auto_161372 ) ) ( not ( = ?auto_161371 ?auto_161375 ) ) ( not ( = ?auto_161372 ?auto_161375 ) ) ( not ( = ?auto_161371 ?auto_161374 ) ) ( not ( = ?auto_161371 ?auto_161376 ) ) ( not ( = ?auto_161372 ?auto_161374 ) ) ( not ( = ?auto_161372 ?auto_161376 ) ) ( not ( = ?auto_161375 ?auto_161374 ) ) ( not ( = ?auto_161375 ?auto_161376 ) ) ( not ( = ?auto_161374 ?auto_161376 ) ) ( not ( = ?auto_161377 ?auto_161373 ) ) ( not ( = ?auto_161377 ?auto_161378 ) ) ( not ( = ?auto_161377 ?auto_161376 ) ) ( not ( = ?auto_161373 ?auto_161378 ) ) ( not ( = ?auto_161373 ?auto_161376 ) ) ( not ( = ?auto_161378 ?auto_161376 ) ) ( not ( = ?auto_161371 ?auto_161378 ) ) ( not ( = ?auto_161371 ?auto_161377 ) ) ( not ( = ?auto_161371 ?auto_161373 ) ) ( not ( = ?auto_161372 ?auto_161378 ) ) ( not ( = ?auto_161372 ?auto_161377 ) ) ( not ( = ?auto_161372 ?auto_161373 ) ) ( not ( = ?auto_161375 ?auto_161378 ) ) ( not ( = ?auto_161375 ?auto_161377 ) ) ( not ( = ?auto_161375 ?auto_161373 ) ) ( not ( = ?auto_161374 ?auto_161378 ) ) ( not ( = ?auto_161374 ?auto_161377 ) ) ( not ( = ?auto_161374 ?auto_161373 ) ) ( ON ?auto_161377 ?auto_161379 ) ( not ( = ?auto_161371 ?auto_161379 ) ) ( not ( = ?auto_161372 ?auto_161379 ) ) ( not ( = ?auto_161375 ?auto_161379 ) ) ( not ( = ?auto_161374 ?auto_161379 ) ) ( not ( = ?auto_161376 ?auto_161379 ) ) ( not ( = ?auto_161377 ?auto_161379 ) ) ( not ( = ?auto_161373 ?auto_161379 ) ) ( not ( = ?auto_161378 ?auto_161379 ) ) ( ON ?auto_161373 ?auto_161377 ) ( ON-TABLE ?auto_161379 ) ( ON ?auto_161378 ?auto_161373 ) ( ON ?auto_161376 ?auto_161378 ) ( ON ?auto_161374 ?auto_161376 ) ( ON ?auto_161375 ?auto_161374 ) ( ON ?auto_161372 ?auto_161375 ) ( ON ?auto_161371 ?auto_161372 ) ( CLEAR ?auto_161371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161379 ?auto_161377 ?auto_161373 ?auto_161378 ?auto_161376 ?auto_161374 ?auto_161375 ?auto_161372 )
      ( MAKE-2PILE ?auto_161371 ?auto_161372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161386 - BLOCK
      ?auto_161387 - BLOCK
      ?auto_161388 - BLOCK
      ?auto_161389 - BLOCK
      ?auto_161390 - BLOCK
      ?auto_161391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_161391 ) ( CLEAR ?auto_161390 ) ( ON-TABLE ?auto_161386 ) ( ON ?auto_161387 ?auto_161386 ) ( ON ?auto_161388 ?auto_161387 ) ( ON ?auto_161389 ?auto_161388 ) ( ON ?auto_161390 ?auto_161389 ) ( not ( = ?auto_161386 ?auto_161387 ) ) ( not ( = ?auto_161386 ?auto_161388 ) ) ( not ( = ?auto_161386 ?auto_161389 ) ) ( not ( = ?auto_161386 ?auto_161390 ) ) ( not ( = ?auto_161386 ?auto_161391 ) ) ( not ( = ?auto_161387 ?auto_161388 ) ) ( not ( = ?auto_161387 ?auto_161389 ) ) ( not ( = ?auto_161387 ?auto_161390 ) ) ( not ( = ?auto_161387 ?auto_161391 ) ) ( not ( = ?auto_161388 ?auto_161389 ) ) ( not ( = ?auto_161388 ?auto_161390 ) ) ( not ( = ?auto_161388 ?auto_161391 ) ) ( not ( = ?auto_161389 ?auto_161390 ) ) ( not ( = ?auto_161389 ?auto_161391 ) ) ( not ( = ?auto_161390 ?auto_161391 ) ) )
    :subtasks
    ( ( !STACK ?auto_161391 ?auto_161390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161392 - BLOCK
      ?auto_161393 - BLOCK
      ?auto_161394 - BLOCK
      ?auto_161395 - BLOCK
      ?auto_161396 - BLOCK
      ?auto_161397 - BLOCK
    )
    :vars
    (
      ?auto_161398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161396 ) ( ON-TABLE ?auto_161392 ) ( ON ?auto_161393 ?auto_161392 ) ( ON ?auto_161394 ?auto_161393 ) ( ON ?auto_161395 ?auto_161394 ) ( ON ?auto_161396 ?auto_161395 ) ( not ( = ?auto_161392 ?auto_161393 ) ) ( not ( = ?auto_161392 ?auto_161394 ) ) ( not ( = ?auto_161392 ?auto_161395 ) ) ( not ( = ?auto_161392 ?auto_161396 ) ) ( not ( = ?auto_161392 ?auto_161397 ) ) ( not ( = ?auto_161393 ?auto_161394 ) ) ( not ( = ?auto_161393 ?auto_161395 ) ) ( not ( = ?auto_161393 ?auto_161396 ) ) ( not ( = ?auto_161393 ?auto_161397 ) ) ( not ( = ?auto_161394 ?auto_161395 ) ) ( not ( = ?auto_161394 ?auto_161396 ) ) ( not ( = ?auto_161394 ?auto_161397 ) ) ( not ( = ?auto_161395 ?auto_161396 ) ) ( not ( = ?auto_161395 ?auto_161397 ) ) ( not ( = ?auto_161396 ?auto_161397 ) ) ( ON ?auto_161397 ?auto_161398 ) ( CLEAR ?auto_161397 ) ( HAND-EMPTY ) ( not ( = ?auto_161392 ?auto_161398 ) ) ( not ( = ?auto_161393 ?auto_161398 ) ) ( not ( = ?auto_161394 ?auto_161398 ) ) ( not ( = ?auto_161395 ?auto_161398 ) ) ( not ( = ?auto_161396 ?auto_161398 ) ) ( not ( = ?auto_161397 ?auto_161398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161397 ?auto_161398 )
      ( MAKE-6PILE ?auto_161392 ?auto_161393 ?auto_161394 ?auto_161395 ?auto_161396 ?auto_161397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161399 - BLOCK
      ?auto_161400 - BLOCK
      ?auto_161401 - BLOCK
      ?auto_161402 - BLOCK
      ?auto_161403 - BLOCK
      ?auto_161404 - BLOCK
    )
    :vars
    (
      ?auto_161405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161399 ) ( ON ?auto_161400 ?auto_161399 ) ( ON ?auto_161401 ?auto_161400 ) ( ON ?auto_161402 ?auto_161401 ) ( not ( = ?auto_161399 ?auto_161400 ) ) ( not ( = ?auto_161399 ?auto_161401 ) ) ( not ( = ?auto_161399 ?auto_161402 ) ) ( not ( = ?auto_161399 ?auto_161403 ) ) ( not ( = ?auto_161399 ?auto_161404 ) ) ( not ( = ?auto_161400 ?auto_161401 ) ) ( not ( = ?auto_161400 ?auto_161402 ) ) ( not ( = ?auto_161400 ?auto_161403 ) ) ( not ( = ?auto_161400 ?auto_161404 ) ) ( not ( = ?auto_161401 ?auto_161402 ) ) ( not ( = ?auto_161401 ?auto_161403 ) ) ( not ( = ?auto_161401 ?auto_161404 ) ) ( not ( = ?auto_161402 ?auto_161403 ) ) ( not ( = ?auto_161402 ?auto_161404 ) ) ( not ( = ?auto_161403 ?auto_161404 ) ) ( ON ?auto_161404 ?auto_161405 ) ( CLEAR ?auto_161404 ) ( not ( = ?auto_161399 ?auto_161405 ) ) ( not ( = ?auto_161400 ?auto_161405 ) ) ( not ( = ?auto_161401 ?auto_161405 ) ) ( not ( = ?auto_161402 ?auto_161405 ) ) ( not ( = ?auto_161403 ?auto_161405 ) ) ( not ( = ?auto_161404 ?auto_161405 ) ) ( HOLDING ?auto_161403 ) ( CLEAR ?auto_161402 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161399 ?auto_161400 ?auto_161401 ?auto_161402 ?auto_161403 )
      ( MAKE-6PILE ?auto_161399 ?auto_161400 ?auto_161401 ?auto_161402 ?auto_161403 ?auto_161404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161406 - BLOCK
      ?auto_161407 - BLOCK
      ?auto_161408 - BLOCK
      ?auto_161409 - BLOCK
      ?auto_161410 - BLOCK
      ?auto_161411 - BLOCK
    )
    :vars
    (
      ?auto_161412 - BLOCK
      ?auto_161413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161406 ) ( ON ?auto_161407 ?auto_161406 ) ( ON ?auto_161408 ?auto_161407 ) ( ON ?auto_161409 ?auto_161408 ) ( not ( = ?auto_161406 ?auto_161407 ) ) ( not ( = ?auto_161406 ?auto_161408 ) ) ( not ( = ?auto_161406 ?auto_161409 ) ) ( not ( = ?auto_161406 ?auto_161410 ) ) ( not ( = ?auto_161406 ?auto_161411 ) ) ( not ( = ?auto_161407 ?auto_161408 ) ) ( not ( = ?auto_161407 ?auto_161409 ) ) ( not ( = ?auto_161407 ?auto_161410 ) ) ( not ( = ?auto_161407 ?auto_161411 ) ) ( not ( = ?auto_161408 ?auto_161409 ) ) ( not ( = ?auto_161408 ?auto_161410 ) ) ( not ( = ?auto_161408 ?auto_161411 ) ) ( not ( = ?auto_161409 ?auto_161410 ) ) ( not ( = ?auto_161409 ?auto_161411 ) ) ( not ( = ?auto_161410 ?auto_161411 ) ) ( ON ?auto_161411 ?auto_161412 ) ( not ( = ?auto_161406 ?auto_161412 ) ) ( not ( = ?auto_161407 ?auto_161412 ) ) ( not ( = ?auto_161408 ?auto_161412 ) ) ( not ( = ?auto_161409 ?auto_161412 ) ) ( not ( = ?auto_161410 ?auto_161412 ) ) ( not ( = ?auto_161411 ?auto_161412 ) ) ( CLEAR ?auto_161409 ) ( ON ?auto_161410 ?auto_161411 ) ( CLEAR ?auto_161410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161413 ) ( ON ?auto_161412 ?auto_161413 ) ( not ( = ?auto_161413 ?auto_161412 ) ) ( not ( = ?auto_161413 ?auto_161411 ) ) ( not ( = ?auto_161413 ?auto_161410 ) ) ( not ( = ?auto_161406 ?auto_161413 ) ) ( not ( = ?auto_161407 ?auto_161413 ) ) ( not ( = ?auto_161408 ?auto_161413 ) ) ( not ( = ?auto_161409 ?auto_161413 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161413 ?auto_161412 ?auto_161411 )
      ( MAKE-6PILE ?auto_161406 ?auto_161407 ?auto_161408 ?auto_161409 ?auto_161410 ?auto_161411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161414 - BLOCK
      ?auto_161415 - BLOCK
      ?auto_161416 - BLOCK
      ?auto_161417 - BLOCK
      ?auto_161418 - BLOCK
      ?auto_161419 - BLOCK
    )
    :vars
    (
      ?auto_161421 - BLOCK
      ?auto_161420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161414 ) ( ON ?auto_161415 ?auto_161414 ) ( ON ?auto_161416 ?auto_161415 ) ( not ( = ?auto_161414 ?auto_161415 ) ) ( not ( = ?auto_161414 ?auto_161416 ) ) ( not ( = ?auto_161414 ?auto_161417 ) ) ( not ( = ?auto_161414 ?auto_161418 ) ) ( not ( = ?auto_161414 ?auto_161419 ) ) ( not ( = ?auto_161415 ?auto_161416 ) ) ( not ( = ?auto_161415 ?auto_161417 ) ) ( not ( = ?auto_161415 ?auto_161418 ) ) ( not ( = ?auto_161415 ?auto_161419 ) ) ( not ( = ?auto_161416 ?auto_161417 ) ) ( not ( = ?auto_161416 ?auto_161418 ) ) ( not ( = ?auto_161416 ?auto_161419 ) ) ( not ( = ?auto_161417 ?auto_161418 ) ) ( not ( = ?auto_161417 ?auto_161419 ) ) ( not ( = ?auto_161418 ?auto_161419 ) ) ( ON ?auto_161419 ?auto_161421 ) ( not ( = ?auto_161414 ?auto_161421 ) ) ( not ( = ?auto_161415 ?auto_161421 ) ) ( not ( = ?auto_161416 ?auto_161421 ) ) ( not ( = ?auto_161417 ?auto_161421 ) ) ( not ( = ?auto_161418 ?auto_161421 ) ) ( not ( = ?auto_161419 ?auto_161421 ) ) ( ON ?auto_161418 ?auto_161419 ) ( CLEAR ?auto_161418 ) ( ON-TABLE ?auto_161420 ) ( ON ?auto_161421 ?auto_161420 ) ( not ( = ?auto_161420 ?auto_161421 ) ) ( not ( = ?auto_161420 ?auto_161419 ) ) ( not ( = ?auto_161420 ?auto_161418 ) ) ( not ( = ?auto_161414 ?auto_161420 ) ) ( not ( = ?auto_161415 ?auto_161420 ) ) ( not ( = ?auto_161416 ?auto_161420 ) ) ( not ( = ?auto_161417 ?auto_161420 ) ) ( HOLDING ?auto_161417 ) ( CLEAR ?auto_161416 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161414 ?auto_161415 ?auto_161416 ?auto_161417 )
      ( MAKE-6PILE ?auto_161414 ?auto_161415 ?auto_161416 ?auto_161417 ?auto_161418 ?auto_161419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161422 - BLOCK
      ?auto_161423 - BLOCK
      ?auto_161424 - BLOCK
      ?auto_161425 - BLOCK
      ?auto_161426 - BLOCK
      ?auto_161427 - BLOCK
    )
    :vars
    (
      ?auto_161429 - BLOCK
      ?auto_161428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161422 ) ( ON ?auto_161423 ?auto_161422 ) ( ON ?auto_161424 ?auto_161423 ) ( not ( = ?auto_161422 ?auto_161423 ) ) ( not ( = ?auto_161422 ?auto_161424 ) ) ( not ( = ?auto_161422 ?auto_161425 ) ) ( not ( = ?auto_161422 ?auto_161426 ) ) ( not ( = ?auto_161422 ?auto_161427 ) ) ( not ( = ?auto_161423 ?auto_161424 ) ) ( not ( = ?auto_161423 ?auto_161425 ) ) ( not ( = ?auto_161423 ?auto_161426 ) ) ( not ( = ?auto_161423 ?auto_161427 ) ) ( not ( = ?auto_161424 ?auto_161425 ) ) ( not ( = ?auto_161424 ?auto_161426 ) ) ( not ( = ?auto_161424 ?auto_161427 ) ) ( not ( = ?auto_161425 ?auto_161426 ) ) ( not ( = ?auto_161425 ?auto_161427 ) ) ( not ( = ?auto_161426 ?auto_161427 ) ) ( ON ?auto_161427 ?auto_161429 ) ( not ( = ?auto_161422 ?auto_161429 ) ) ( not ( = ?auto_161423 ?auto_161429 ) ) ( not ( = ?auto_161424 ?auto_161429 ) ) ( not ( = ?auto_161425 ?auto_161429 ) ) ( not ( = ?auto_161426 ?auto_161429 ) ) ( not ( = ?auto_161427 ?auto_161429 ) ) ( ON ?auto_161426 ?auto_161427 ) ( ON-TABLE ?auto_161428 ) ( ON ?auto_161429 ?auto_161428 ) ( not ( = ?auto_161428 ?auto_161429 ) ) ( not ( = ?auto_161428 ?auto_161427 ) ) ( not ( = ?auto_161428 ?auto_161426 ) ) ( not ( = ?auto_161422 ?auto_161428 ) ) ( not ( = ?auto_161423 ?auto_161428 ) ) ( not ( = ?auto_161424 ?auto_161428 ) ) ( not ( = ?auto_161425 ?auto_161428 ) ) ( CLEAR ?auto_161424 ) ( ON ?auto_161425 ?auto_161426 ) ( CLEAR ?auto_161425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161428 ?auto_161429 ?auto_161427 ?auto_161426 )
      ( MAKE-6PILE ?auto_161422 ?auto_161423 ?auto_161424 ?auto_161425 ?auto_161426 ?auto_161427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161430 - BLOCK
      ?auto_161431 - BLOCK
      ?auto_161432 - BLOCK
      ?auto_161433 - BLOCK
      ?auto_161434 - BLOCK
      ?auto_161435 - BLOCK
    )
    :vars
    (
      ?auto_161436 - BLOCK
      ?auto_161437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161430 ) ( ON ?auto_161431 ?auto_161430 ) ( not ( = ?auto_161430 ?auto_161431 ) ) ( not ( = ?auto_161430 ?auto_161432 ) ) ( not ( = ?auto_161430 ?auto_161433 ) ) ( not ( = ?auto_161430 ?auto_161434 ) ) ( not ( = ?auto_161430 ?auto_161435 ) ) ( not ( = ?auto_161431 ?auto_161432 ) ) ( not ( = ?auto_161431 ?auto_161433 ) ) ( not ( = ?auto_161431 ?auto_161434 ) ) ( not ( = ?auto_161431 ?auto_161435 ) ) ( not ( = ?auto_161432 ?auto_161433 ) ) ( not ( = ?auto_161432 ?auto_161434 ) ) ( not ( = ?auto_161432 ?auto_161435 ) ) ( not ( = ?auto_161433 ?auto_161434 ) ) ( not ( = ?auto_161433 ?auto_161435 ) ) ( not ( = ?auto_161434 ?auto_161435 ) ) ( ON ?auto_161435 ?auto_161436 ) ( not ( = ?auto_161430 ?auto_161436 ) ) ( not ( = ?auto_161431 ?auto_161436 ) ) ( not ( = ?auto_161432 ?auto_161436 ) ) ( not ( = ?auto_161433 ?auto_161436 ) ) ( not ( = ?auto_161434 ?auto_161436 ) ) ( not ( = ?auto_161435 ?auto_161436 ) ) ( ON ?auto_161434 ?auto_161435 ) ( ON-TABLE ?auto_161437 ) ( ON ?auto_161436 ?auto_161437 ) ( not ( = ?auto_161437 ?auto_161436 ) ) ( not ( = ?auto_161437 ?auto_161435 ) ) ( not ( = ?auto_161437 ?auto_161434 ) ) ( not ( = ?auto_161430 ?auto_161437 ) ) ( not ( = ?auto_161431 ?auto_161437 ) ) ( not ( = ?auto_161432 ?auto_161437 ) ) ( not ( = ?auto_161433 ?auto_161437 ) ) ( ON ?auto_161433 ?auto_161434 ) ( CLEAR ?auto_161433 ) ( HOLDING ?auto_161432 ) ( CLEAR ?auto_161431 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161430 ?auto_161431 ?auto_161432 )
      ( MAKE-6PILE ?auto_161430 ?auto_161431 ?auto_161432 ?auto_161433 ?auto_161434 ?auto_161435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161438 - BLOCK
      ?auto_161439 - BLOCK
      ?auto_161440 - BLOCK
      ?auto_161441 - BLOCK
      ?auto_161442 - BLOCK
      ?auto_161443 - BLOCK
    )
    :vars
    (
      ?auto_161445 - BLOCK
      ?auto_161444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161438 ) ( ON ?auto_161439 ?auto_161438 ) ( not ( = ?auto_161438 ?auto_161439 ) ) ( not ( = ?auto_161438 ?auto_161440 ) ) ( not ( = ?auto_161438 ?auto_161441 ) ) ( not ( = ?auto_161438 ?auto_161442 ) ) ( not ( = ?auto_161438 ?auto_161443 ) ) ( not ( = ?auto_161439 ?auto_161440 ) ) ( not ( = ?auto_161439 ?auto_161441 ) ) ( not ( = ?auto_161439 ?auto_161442 ) ) ( not ( = ?auto_161439 ?auto_161443 ) ) ( not ( = ?auto_161440 ?auto_161441 ) ) ( not ( = ?auto_161440 ?auto_161442 ) ) ( not ( = ?auto_161440 ?auto_161443 ) ) ( not ( = ?auto_161441 ?auto_161442 ) ) ( not ( = ?auto_161441 ?auto_161443 ) ) ( not ( = ?auto_161442 ?auto_161443 ) ) ( ON ?auto_161443 ?auto_161445 ) ( not ( = ?auto_161438 ?auto_161445 ) ) ( not ( = ?auto_161439 ?auto_161445 ) ) ( not ( = ?auto_161440 ?auto_161445 ) ) ( not ( = ?auto_161441 ?auto_161445 ) ) ( not ( = ?auto_161442 ?auto_161445 ) ) ( not ( = ?auto_161443 ?auto_161445 ) ) ( ON ?auto_161442 ?auto_161443 ) ( ON-TABLE ?auto_161444 ) ( ON ?auto_161445 ?auto_161444 ) ( not ( = ?auto_161444 ?auto_161445 ) ) ( not ( = ?auto_161444 ?auto_161443 ) ) ( not ( = ?auto_161444 ?auto_161442 ) ) ( not ( = ?auto_161438 ?auto_161444 ) ) ( not ( = ?auto_161439 ?auto_161444 ) ) ( not ( = ?auto_161440 ?auto_161444 ) ) ( not ( = ?auto_161441 ?auto_161444 ) ) ( ON ?auto_161441 ?auto_161442 ) ( CLEAR ?auto_161439 ) ( ON ?auto_161440 ?auto_161441 ) ( CLEAR ?auto_161440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161444 ?auto_161445 ?auto_161443 ?auto_161442 ?auto_161441 )
      ( MAKE-6PILE ?auto_161438 ?auto_161439 ?auto_161440 ?auto_161441 ?auto_161442 ?auto_161443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161446 - BLOCK
      ?auto_161447 - BLOCK
      ?auto_161448 - BLOCK
      ?auto_161449 - BLOCK
      ?auto_161450 - BLOCK
      ?auto_161451 - BLOCK
    )
    :vars
    (
      ?auto_161453 - BLOCK
      ?auto_161452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161446 ) ( not ( = ?auto_161446 ?auto_161447 ) ) ( not ( = ?auto_161446 ?auto_161448 ) ) ( not ( = ?auto_161446 ?auto_161449 ) ) ( not ( = ?auto_161446 ?auto_161450 ) ) ( not ( = ?auto_161446 ?auto_161451 ) ) ( not ( = ?auto_161447 ?auto_161448 ) ) ( not ( = ?auto_161447 ?auto_161449 ) ) ( not ( = ?auto_161447 ?auto_161450 ) ) ( not ( = ?auto_161447 ?auto_161451 ) ) ( not ( = ?auto_161448 ?auto_161449 ) ) ( not ( = ?auto_161448 ?auto_161450 ) ) ( not ( = ?auto_161448 ?auto_161451 ) ) ( not ( = ?auto_161449 ?auto_161450 ) ) ( not ( = ?auto_161449 ?auto_161451 ) ) ( not ( = ?auto_161450 ?auto_161451 ) ) ( ON ?auto_161451 ?auto_161453 ) ( not ( = ?auto_161446 ?auto_161453 ) ) ( not ( = ?auto_161447 ?auto_161453 ) ) ( not ( = ?auto_161448 ?auto_161453 ) ) ( not ( = ?auto_161449 ?auto_161453 ) ) ( not ( = ?auto_161450 ?auto_161453 ) ) ( not ( = ?auto_161451 ?auto_161453 ) ) ( ON ?auto_161450 ?auto_161451 ) ( ON-TABLE ?auto_161452 ) ( ON ?auto_161453 ?auto_161452 ) ( not ( = ?auto_161452 ?auto_161453 ) ) ( not ( = ?auto_161452 ?auto_161451 ) ) ( not ( = ?auto_161452 ?auto_161450 ) ) ( not ( = ?auto_161446 ?auto_161452 ) ) ( not ( = ?auto_161447 ?auto_161452 ) ) ( not ( = ?auto_161448 ?auto_161452 ) ) ( not ( = ?auto_161449 ?auto_161452 ) ) ( ON ?auto_161449 ?auto_161450 ) ( ON ?auto_161448 ?auto_161449 ) ( CLEAR ?auto_161448 ) ( HOLDING ?auto_161447 ) ( CLEAR ?auto_161446 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161446 ?auto_161447 )
      ( MAKE-6PILE ?auto_161446 ?auto_161447 ?auto_161448 ?auto_161449 ?auto_161450 ?auto_161451 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161454 - BLOCK
      ?auto_161455 - BLOCK
      ?auto_161456 - BLOCK
      ?auto_161457 - BLOCK
      ?auto_161458 - BLOCK
      ?auto_161459 - BLOCK
    )
    :vars
    (
      ?auto_161460 - BLOCK
      ?auto_161461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161454 ) ( not ( = ?auto_161454 ?auto_161455 ) ) ( not ( = ?auto_161454 ?auto_161456 ) ) ( not ( = ?auto_161454 ?auto_161457 ) ) ( not ( = ?auto_161454 ?auto_161458 ) ) ( not ( = ?auto_161454 ?auto_161459 ) ) ( not ( = ?auto_161455 ?auto_161456 ) ) ( not ( = ?auto_161455 ?auto_161457 ) ) ( not ( = ?auto_161455 ?auto_161458 ) ) ( not ( = ?auto_161455 ?auto_161459 ) ) ( not ( = ?auto_161456 ?auto_161457 ) ) ( not ( = ?auto_161456 ?auto_161458 ) ) ( not ( = ?auto_161456 ?auto_161459 ) ) ( not ( = ?auto_161457 ?auto_161458 ) ) ( not ( = ?auto_161457 ?auto_161459 ) ) ( not ( = ?auto_161458 ?auto_161459 ) ) ( ON ?auto_161459 ?auto_161460 ) ( not ( = ?auto_161454 ?auto_161460 ) ) ( not ( = ?auto_161455 ?auto_161460 ) ) ( not ( = ?auto_161456 ?auto_161460 ) ) ( not ( = ?auto_161457 ?auto_161460 ) ) ( not ( = ?auto_161458 ?auto_161460 ) ) ( not ( = ?auto_161459 ?auto_161460 ) ) ( ON ?auto_161458 ?auto_161459 ) ( ON-TABLE ?auto_161461 ) ( ON ?auto_161460 ?auto_161461 ) ( not ( = ?auto_161461 ?auto_161460 ) ) ( not ( = ?auto_161461 ?auto_161459 ) ) ( not ( = ?auto_161461 ?auto_161458 ) ) ( not ( = ?auto_161454 ?auto_161461 ) ) ( not ( = ?auto_161455 ?auto_161461 ) ) ( not ( = ?auto_161456 ?auto_161461 ) ) ( not ( = ?auto_161457 ?auto_161461 ) ) ( ON ?auto_161457 ?auto_161458 ) ( ON ?auto_161456 ?auto_161457 ) ( CLEAR ?auto_161454 ) ( ON ?auto_161455 ?auto_161456 ) ( CLEAR ?auto_161455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161461 ?auto_161460 ?auto_161459 ?auto_161458 ?auto_161457 ?auto_161456 )
      ( MAKE-6PILE ?auto_161454 ?auto_161455 ?auto_161456 ?auto_161457 ?auto_161458 ?auto_161459 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161462 - BLOCK
      ?auto_161463 - BLOCK
      ?auto_161464 - BLOCK
      ?auto_161465 - BLOCK
      ?auto_161466 - BLOCK
      ?auto_161467 - BLOCK
    )
    :vars
    (
      ?auto_161468 - BLOCK
      ?auto_161469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161462 ?auto_161463 ) ) ( not ( = ?auto_161462 ?auto_161464 ) ) ( not ( = ?auto_161462 ?auto_161465 ) ) ( not ( = ?auto_161462 ?auto_161466 ) ) ( not ( = ?auto_161462 ?auto_161467 ) ) ( not ( = ?auto_161463 ?auto_161464 ) ) ( not ( = ?auto_161463 ?auto_161465 ) ) ( not ( = ?auto_161463 ?auto_161466 ) ) ( not ( = ?auto_161463 ?auto_161467 ) ) ( not ( = ?auto_161464 ?auto_161465 ) ) ( not ( = ?auto_161464 ?auto_161466 ) ) ( not ( = ?auto_161464 ?auto_161467 ) ) ( not ( = ?auto_161465 ?auto_161466 ) ) ( not ( = ?auto_161465 ?auto_161467 ) ) ( not ( = ?auto_161466 ?auto_161467 ) ) ( ON ?auto_161467 ?auto_161468 ) ( not ( = ?auto_161462 ?auto_161468 ) ) ( not ( = ?auto_161463 ?auto_161468 ) ) ( not ( = ?auto_161464 ?auto_161468 ) ) ( not ( = ?auto_161465 ?auto_161468 ) ) ( not ( = ?auto_161466 ?auto_161468 ) ) ( not ( = ?auto_161467 ?auto_161468 ) ) ( ON ?auto_161466 ?auto_161467 ) ( ON-TABLE ?auto_161469 ) ( ON ?auto_161468 ?auto_161469 ) ( not ( = ?auto_161469 ?auto_161468 ) ) ( not ( = ?auto_161469 ?auto_161467 ) ) ( not ( = ?auto_161469 ?auto_161466 ) ) ( not ( = ?auto_161462 ?auto_161469 ) ) ( not ( = ?auto_161463 ?auto_161469 ) ) ( not ( = ?auto_161464 ?auto_161469 ) ) ( not ( = ?auto_161465 ?auto_161469 ) ) ( ON ?auto_161465 ?auto_161466 ) ( ON ?auto_161464 ?auto_161465 ) ( ON ?auto_161463 ?auto_161464 ) ( CLEAR ?auto_161463 ) ( HOLDING ?auto_161462 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161462 )
      ( MAKE-6PILE ?auto_161462 ?auto_161463 ?auto_161464 ?auto_161465 ?auto_161466 ?auto_161467 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161470 - BLOCK
      ?auto_161471 - BLOCK
      ?auto_161472 - BLOCK
      ?auto_161473 - BLOCK
      ?auto_161474 - BLOCK
      ?auto_161475 - BLOCK
    )
    :vars
    (
      ?auto_161476 - BLOCK
      ?auto_161477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161470 ?auto_161471 ) ) ( not ( = ?auto_161470 ?auto_161472 ) ) ( not ( = ?auto_161470 ?auto_161473 ) ) ( not ( = ?auto_161470 ?auto_161474 ) ) ( not ( = ?auto_161470 ?auto_161475 ) ) ( not ( = ?auto_161471 ?auto_161472 ) ) ( not ( = ?auto_161471 ?auto_161473 ) ) ( not ( = ?auto_161471 ?auto_161474 ) ) ( not ( = ?auto_161471 ?auto_161475 ) ) ( not ( = ?auto_161472 ?auto_161473 ) ) ( not ( = ?auto_161472 ?auto_161474 ) ) ( not ( = ?auto_161472 ?auto_161475 ) ) ( not ( = ?auto_161473 ?auto_161474 ) ) ( not ( = ?auto_161473 ?auto_161475 ) ) ( not ( = ?auto_161474 ?auto_161475 ) ) ( ON ?auto_161475 ?auto_161476 ) ( not ( = ?auto_161470 ?auto_161476 ) ) ( not ( = ?auto_161471 ?auto_161476 ) ) ( not ( = ?auto_161472 ?auto_161476 ) ) ( not ( = ?auto_161473 ?auto_161476 ) ) ( not ( = ?auto_161474 ?auto_161476 ) ) ( not ( = ?auto_161475 ?auto_161476 ) ) ( ON ?auto_161474 ?auto_161475 ) ( ON-TABLE ?auto_161477 ) ( ON ?auto_161476 ?auto_161477 ) ( not ( = ?auto_161477 ?auto_161476 ) ) ( not ( = ?auto_161477 ?auto_161475 ) ) ( not ( = ?auto_161477 ?auto_161474 ) ) ( not ( = ?auto_161470 ?auto_161477 ) ) ( not ( = ?auto_161471 ?auto_161477 ) ) ( not ( = ?auto_161472 ?auto_161477 ) ) ( not ( = ?auto_161473 ?auto_161477 ) ) ( ON ?auto_161473 ?auto_161474 ) ( ON ?auto_161472 ?auto_161473 ) ( ON ?auto_161471 ?auto_161472 ) ( ON ?auto_161470 ?auto_161471 ) ( CLEAR ?auto_161470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161477 ?auto_161476 ?auto_161475 ?auto_161474 ?auto_161473 ?auto_161472 ?auto_161471 )
      ( MAKE-6PILE ?auto_161470 ?auto_161471 ?auto_161472 ?auto_161473 ?auto_161474 ?auto_161475 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161478 - BLOCK
      ?auto_161479 - BLOCK
      ?auto_161480 - BLOCK
      ?auto_161481 - BLOCK
      ?auto_161482 - BLOCK
      ?auto_161483 - BLOCK
    )
    :vars
    (
      ?auto_161484 - BLOCK
      ?auto_161485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161478 ?auto_161479 ) ) ( not ( = ?auto_161478 ?auto_161480 ) ) ( not ( = ?auto_161478 ?auto_161481 ) ) ( not ( = ?auto_161478 ?auto_161482 ) ) ( not ( = ?auto_161478 ?auto_161483 ) ) ( not ( = ?auto_161479 ?auto_161480 ) ) ( not ( = ?auto_161479 ?auto_161481 ) ) ( not ( = ?auto_161479 ?auto_161482 ) ) ( not ( = ?auto_161479 ?auto_161483 ) ) ( not ( = ?auto_161480 ?auto_161481 ) ) ( not ( = ?auto_161480 ?auto_161482 ) ) ( not ( = ?auto_161480 ?auto_161483 ) ) ( not ( = ?auto_161481 ?auto_161482 ) ) ( not ( = ?auto_161481 ?auto_161483 ) ) ( not ( = ?auto_161482 ?auto_161483 ) ) ( ON ?auto_161483 ?auto_161484 ) ( not ( = ?auto_161478 ?auto_161484 ) ) ( not ( = ?auto_161479 ?auto_161484 ) ) ( not ( = ?auto_161480 ?auto_161484 ) ) ( not ( = ?auto_161481 ?auto_161484 ) ) ( not ( = ?auto_161482 ?auto_161484 ) ) ( not ( = ?auto_161483 ?auto_161484 ) ) ( ON ?auto_161482 ?auto_161483 ) ( ON-TABLE ?auto_161485 ) ( ON ?auto_161484 ?auto_161485 ) ( not ( = ?auto_161485 ?auto_161484 ) ) ( not ( = ?auto_161485 ?auto_161483 ) ) ( not ( = ?auto_161485 ?auto_161482 ) ) ( not ( = ?auto_161478 ?auto_161485 ) ) ( not ( = ?auto_161479 ?auto_161485 ) ) ( not ( = ?auto_161480 ?auto_161485 ) ) ( not ( = ?auto_161481 ?auto_161485 ) ) ( ON ?auto_161481 ?auto_161482 ) ( ON ?auto_161480 ?auto_161481 ) ( ON ?auto_161479 ?auto_161480 ) ( HOLDING ?auto_161478 ) ( CLEAR ?auto_161479 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161485 ?auto_161484 ?auto_161483 ?auto_161482 ?auto_161481 ?auto_161480 ?auto_161479 ?auto_161478 )
      ( MAKE-6PILE ?auto_161478 ?auto_161479 ?auto_161480 ?auto_161481 ?auto_161482 ?auto_161483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161486 - BLOCK
      ?auto_161487 - BLOCK
      ?auto_161488 - BLOCK
      ?auto_161489 - BLOCK
      ?auto_161490 - BLOCK
      ?auto_161491 - BLOCK
    )
    :vars
    (
      ?auto_161492 - BLOCK
      ?auto_161493 - BLOCK
      ?auto_161494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161486 ?auto_161487 ) ) ( not ( = ?auto_161486 ?auto_161488 ) ) ( not ( = ?auto_161486 ?auto_161489 ) ) ( not ( = ?auto_161486 ?auto_161490 ) ) ( not ( = ?auto_161486 ?auto_161491 ) ) ( not ( = ?auto_161487 ?auto_161488 ) ) ( not ( = ?auto_161487 ?auto_161489 ) ) ( not ( = ?auto_161487 ?auto_161490 ) ) ( not ( = ?auto_161487 ?auto_161491 ) ) ( not ( = ?auto_161488 ?auto_161489 ) ) ( not ( = ?auto_161488 ?auto_161490 ) ) ( not ( = ?auto_161488 ?auto_161491 ) ) ( not ( = ?auto_161489 ?auto_161490 ) ) ( not ( = ?auto_161489 ?auto_161491 ) ) ( not ( = ?auto_161490 ?auto_161491 ) ) ( ON ?auto_161491 ?auto_161492 ) ( not ( = ?auto_161486 ?auto_161492 ) ) ( not ( = ?auto_161487 ?auto_161492 ) ) ( not ( = ?auto_161488 ?auto_161492 ) ) ( not ( = ?auto_161489 ?auto_161492 ) ) ( not ( = ?auto_161490 ?auto_161492 ) ) ( not ( = ?auto_161491 ?auto_161492 ) ) ( ON ?auto_161490 ?auto_161491 ) ( ON-TABLE ?auto_161493 ) ( ON ?auto_161492 ?auto_161493 ) ( not ( = ?auto_161493 ?auto_161492 ) ) ( not ( = ?auto_161493 ?auto_161491 ) ) ( not ( = ?auto_161493 ?auto_161490 ) ) ( not ( = ?auto_161486 ?auto_161493 ) ) ( not ( = ?auto_161487 ?auto_161493 ) ) ( not ( = ?auto_161488 ?auto_161493 ) ) ( not ( = ?auto_161489 ?auto_161493 ) ) ( ON ?auto_161489 ?auto_161490 ) ( ON ?auto_161488 ?auto_161489 ) ( ON ?auto_161487 ?auto_161488 ) ( CLEAR ?auto_161487 ) ( ON ?auto_161486 ?auto_161494 ) ( CLEAR ?auto_161486 ) ( HAND-EMPTY ) ( not ( = ?auto_161486 ?auto_161494 ) ) ( not ( = ?auto_161487 ?auto_161494 ) ) ( not ( = ?auto_161488 ?auto_161494 ) ) ( not ( = ?auto_161489 ?auto_161494 ) ) ( not ( = ?auto_161490 ?auto_161494 ) ) ( not ( = ?auto_161491 ?auto_161494 ) ) ( not ( = ?auto_161492 ?auto_161494 ) ) ( not ( = ?auto_161493 ?auto_161494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161486 ?auto_161494 )
      ( MAKE-6PILE ?auto_161486 ?auto_161487 ?auto_161488 ?auto_161489 ?auto_161490 ?auto_161491 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161495 - BLOCK
      ?auto_161496 - BLOCK
      ?auto_161497 - BLOCK
      ?auto_161498 - BLOCK
      ?auto_161499 - BLOCK
      ?auto_161500 - BLOCK
    )
    :vars
    (
      ?auto_161501 - BLOCK
      ?auto_161503 - BLOCK
      ?auto_161502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161495 ?auto_161496 ) ) ( not ( = ?auto_161495 ?auto_161497 ) ) ( not ( = ?auto_161495 ?auto_161498 ) ) ( not ( = ?auto_161495 ?auto_161499 ) ) ( not ( = ?auto_161495 ?auto_161500 ) ) ( not ( = ?auto_161496 ?auto_161497 ) ) ( not ( = ?auto_161496 ?auto_161498 ) ) ( not ( = ?auto_161496 ?auto_161499 ) ) ( not ( = ?auto_161496 ?auto_161500 ) ) ( not ( = ?auto_161497 ?auto_161498 ) ) ( not ( = ?auto_161497 ?auto_161499 ) ) ( not ( = ?auto_161497 ?auto_161500 ) ) ( not ( = ?auto_161498 ?auto_161499 ) ) ( not ( = ?auto_161498 ?auto_161500 ) ) ( not ( = ?auto_161499 ?auto_161500 ) ) ( ON ?auto_161500 ?auto_161501 ) ( not ( = ?auto_161495 ?auto_161501 ) ) ( not ( = ?auto_161496 ?auto_161501 ) ) ( not ( = ?auto_161497 ?auto_161501 ) ) ( not ( = ?auto_161498 ?auto_161501 ) ) ( not ( = ?auto_161499 ?auto_161501 ) ) ( not ( = ?auto_161500 ?auto_161501 ) ) ( ON ?auto_161499 ?auto_161500 ) ( ON-TABLE ?auto_161503 ) ( ON ?auto_161501 ?auto_161503 ) ( not ( = ?auto_161503 ?auto_161501 ) ) ( not ( = ?auto_161503 ?auto_161500 ) ) ( not ( = ?auto_161503 ?auto_161499 ) ) ( not ( = ?auto_161495 ?auto_161503 ) ) ( not ( = ?auto_161496 ?auto_161503 ) ) ( not ( = ?auto_161497 ?auto_161503 ) ) ( not ( = ?auto_161498 ?auto_161503 ) ) ( ON ?auto_161498 ?auto_161499 ) ( ON ?auto_161497 ?auto_161498 ) ( ON ?auto_161495 ?auto_161502 ) ( CLEAR ?auto_161495 ) ( not ( = ?auto_161495 ?auto_161502 ) ) ( not ( = ?auto_161496 ?auto_161502 ) ) ( not ( = ?auto_161497 ?auto_161502 ) ) ( not ( = ?auto_161498 ?auto_161502 ) ) ( not ( = ?auto_161499 ?auto_161502 ) ) ( not ( = ?auto_161500 ?auto_161502 ) ) ( not ( = ?auto_161501 ?auto_161502 ) ) ( not ( = ?auto_161503 ?auto_161502 ) ) ( HOLDING ?auto_161496 ) ( CLEAR ?auto_161497 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161503 ?auto_161501 ?auto_161500 ?auto_161499 ?auto_161498 ?auto_161497 ?auto_161496 )
      ( MAKE-6PILE ?auto_161495 ?auto_161496 ?auto_161497 ?auto_161498 ?auto_161499 ?auto_161500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161504 - BLOCK
      ?auto_161505 - BLOCK
      ?auto_161506 - BLOCK
      ?auto_161507 - BLOCK
      ?auto_161508 - BLOCK
      ?auto_161509 - BLOCK
    )
    :vars
    (
      ?auto_161511 - BLOCK
      ?auto_161510 - BLOCK
      ?auto_161512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161504 ?auto_161505 ) ) ( not ( = ?auto_161504 ?auto_161506 ) ) ( not ( = ?auto_161504 ?auto_161507 ) ) ( not ( = ?auto_161504 ?auto_161508 ) ) ( not ( = ?auto_161504 ?auto_161509 ) ) ( not ( = ?auto_161505 ?auto_161506 ) ) ( not ( = ?auto_161505 ?auto_161507 ) ) ( not ( = ?auto_161505 ?auto_161508 ) ) ( not ( = ?auto_161505 ?auto_161509 ) ) ( not ( = ?auto_161506 ?auto_161507 ) ) ( not ( = ?auto_161506 ?auto_161508 ) ) ( not ( = ?auto_161506 ?auto_161509 ) ) ( not ( = ?auto_161507 ?auto_161508 ) ) ( not ( = ?auto_161507 ?auto_161509 ) ) ( not ( = ?auto_161508 ?auto_161509 ) ) ( ON ?auto_161509 ?auto_161511 ) ( not ( = ?auto_161504 ?auto_161511 ) ) ( not ( = ?auto_161505 ?auto_161511 ) ) ( not ( = ?auto_161506 ?auto_161511 ) ) ( not ( = ?auto_161507 ?auto_161511 ) ) ( not ( = ?auto_161508 ?auto_161511 ) ) ( not ( = ?auto_161509 ?auto_161511 ) ) ( ON ?auto_161508 ?auto_161509 ) ( ON-TABLE ?auto_161510 ) ( ON ?auto_161511 ?auto_161510 ) ( not ( = ?auto_161510 ?auto_161511 ) ) ( not ( = ?auto_161510 ?auto_161509 ) ) ( not ( = ?auto_161510 ?auto_161508 ) ) ( not ( = ?auto_161504 ?auto_161510 ) ) ( not ( = ?auto_161505 ?auto_161510 ) ) ( not ( = ?auto_161506 ?auto_161510 ) ) ( not ( = ?auto_161507 ?auto_161510 ) ) ( ON ?auto_161507 ?auto_161508 ) ( ON ?auto_161506 ?auto_161507 ) ( ON ?auto_161504 ?auto_161512 ) ( not ( = ?auto_161504 ?auto_161512 ) ) ( not ( = ?auto_161505 ?auto_161512 ) ) ( not ( = ?auto_161506 ?auto_161512 ) ) ( not ( = ?auto_161507 ?auto_161512 ) ) ( not ( = ?auto_161508 ?auto_161512 ) ) ( not ( = ?auto_161509 ?auto_161512 ) ) ( not ( = ?auto_161511 ?auto_161512 ) ) ( not ( = ?auto_161510 ?auto_161512 ) ) ( CLEAR ?auto_161506 ) ( ON ?auto_161505 ?auto_161504 ) ( CLEAR ?auto_161505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161512 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161512 ?auto_161504 )
      ( MAKE-6PILE ?auto_161504 ?auto_161505 ?auto_161506 ?auto_161507 ?auto_161508 ?auto_161509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161513 - BLOCK
      ?auto_161514 - BLOCK
      ?auto_161515 - BLOCK
      ?auto_161516 - BLOCK
      ?auto_161517 - BLOCK
      ?auto_161518 - BLOCK
    )
    :vars
    (
      ?auto_161521 - BLOCK
      ?auto_161519 - BLOCK
      ?auto_161520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161513 ?auto_161514 ) ) ( not ( = ?auto_161513 ?auto_161515 ) ) ( not ( = ?auto_161513 ?auto_161516 ) ) ( not ( = ?auto_161513 ?auto_161517 ) ) ( not ( = ?auto_161513 ?auto_161518 ) ) ( not ( = ?auto_161514 ?auto_161515 ) ) ( not ( = ?auto_161514 ?auto_161516 ) ) ( not ( = ?auto_161514 ?auto_161517 ) ) ( not ( = ?auto_161514 ?auto_161518 ) ) ( not ( = ?auto_161515 ?auto_161516 ) ) ( not ( = ?auto_161515 ?auto_161517 ) ) ( not ( = ?auto_161515 ?auto_161518 ) ) ( not ( = ?auto_161516 ?auto_161517 ) ) ( not ( = ?auto_161516 ?auto_161518 ) ) ( not ( = ?auto_161517 ?auto_161518 ) ) ( ON ?auto_161518 ?auto_161521 ) ( not ( = ?auto_161513 ?auto_161521 ) ) ( not ( = ?auto_161514 ?auto_161521 ) ) ( not ( = ?auto_161515 ?auto_161521 ) ) ( not ( = ?auto_161516 ?auto_161521 ) ) ( not ( = ?auto_161517 ?auto_161521 ) ) ( not ( = ?auto_161518 ?auto_161521 ) ) ( ON ?auto_161517 ?auto_161518 ) ( ON-TABLE ?auto_161519 ) ( ON ?auto_161521 ?auto_161519 ) ( not ( = ?auto_161519 ?auto_161521 ) ) ( not ( = ?auto_161519 ?auto_161518 ) ) ( not ( = ?auto_161519 ?auto_161517 ) ) ( not ( = ?auto_161513 ?auto_161519 ) ) ( not ( = ?auto_161514 ?auto_161519 ) ) ( not ( = ?auto_161515 ?auto_161519 ) ) ( not ( = ?auto_161516 ?auto_161519 ) ) ( ON ?auto_161516 ?auto_161517 ) ( ON ?auto_161513 ?auto_161520 ) ( not ( = ?auto_161513 ?auto_161520 ) ) ( not ( = ?auto_161514 ?auto_161520 ) ) ( not ( = ?auto_161515 ?auto_161520 ) ) ( not ( = ?auto_161516 ?auto_161520 ) ) ( not ( = ?auto_161517 ?auto_161520 ) ) ( not ( = ?auto_161518 ?auto_161520 ) ) ( not ( = ?auto_161521 ?auto_161520 ) ) ( not ( = ?auto_161519 ?auto_161520 ) ) ( ON ?auto_161514 ?auto_161513 ) ( CLEAR ?auto_161514 ) ( ON-TABLE ?auto_161520 ) ( HOLDING ?auto_161515 ) ( CLEAR ?auto_161516 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161519 ?auto_161521 ?auto_161518 ?auto_161517 ?auto_161516 ?auto_161515 )
      ( MAKE-6PILE ?auto_161513 ?auto_161514 ?auto_161515 ?auto_161516 ?auto_161517 ?auto_161518 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161522 - BLOCK
      ?auto_161523 - BLOCK
      ?auto_161524 - BLOCK
      ?auto_161525 - BLOCK
      ?auto_161526 - BLOCK
      ?auto_161527 - BLOCK
    )
    :vars
    (
      ?auto_161530 - BLOCK
      ?auto_161529 - BLOCK
      ?auto_161528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161522 ?auto_161523 ) ) ( not ( = ?auto_161522 ?auto_161524 ) ) ( not ( = ?auto_161522 ?auto_161525 ) ) ( not ( = ?auto_161522 ?auto_161526 ) ) ( not ( = ?auto_161522 ?auto_161527 ) ) ( not ( = ?auto_161523 ?auto_161524 ) ) ( not ( = ?auto_161523 ?auto_161525 ) ) ( not ( = ?auto_161523 ?auto_161526 ) ) ( not ( = ?auto_161523 ?auto_161527 ) ) ( not ( = ?auto_161524 ?auto_161525 ) ) ( not ( = ?auto_161524 ?auto_161526 ) ) ( not ( = ?auto_161524 ?auto_161527 ) ) ( not ( = ?auto_161525 ?auto_161526 ) ) ( not ( = ?auto_161525 ?auto_161527 ) ) ( not ( = ?auto_161526 ?auto_161527 ) ) ( ON ?auto_161527 ?auto_161530 ) ( not ( = ?auto_161522 ?auto_161530 ) ) ( not ( = ?auto_161523 ?auto_161530 ) ) ( not ( = ?auto_161524 ?auto_161530 ) ) ( not ( = ?auto_161525 ?auto_161530 ) ) ( not ( = ?auto_161526 ?auto_161530 ) ) ( not ( = ?auto_161527 ?auto_161530 ) ) ( ON ?auto_161526 ?auto_161527 ) ( ON-TABLE ?auto_161529 ) ( ON ?auto_161530 ?auto_161529 ) ( not ( = ?auto_161529 ?auto_161530 ) ) ( not ( = ?auto_161529 ?auto_161527 ) ) ( not ( = ?auto_161529 ?auto_161526 ) ) ( not ( = ?auto_161522 ?auto_161529 ) ) ( not ( = ?auto_161523 ?auto_161529 ) ) ( not ( = ?auto_161524 ?auto_161529 ) ) ( not ( = ?auto_161525 ?auto_161529 ) ) ( ON ?auto_161525 ?auto_161526 ) ( ON ?auto_161522 ?auto_161528 ) ( not ( = ?auto_161522 ?auto_161528 ) ) ( not ( = ?auto_161523 ?auto_161528 ) ) ( not ( = ?auto_161524 ?auto_161528 ) ) ( not ( = ?auto_161525 ?auto_161528 ) ) ( not ( = ?auto_161526 ?auto_161528 ) ) ( not ( = ?auto_161527 ?auto_161528 ) ) ( not ( = ?auto_161530 ?auto_161528 ) ) ( not ( = ?auto_161529 ?auto_161528 ) ) ( ON ?auto_161523 ?auto_161522 ) ( ON-TABLE ?auto_161528 ) ( CLEAR ?auto_161525 ) ( ON ?auto_161524 ?auto_161523 ) ( CLEAR ?auto_161524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161528 ?auto_161522 ?auto_161523 )
      ( MAKE-6PILE ?auto_161522 ?auto_161523 ?auto_161524 ?auto_161525 ?auto_161526 ?auto_161527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161531 - BLOCK
      ?auto_161532 - BLOCK
      ?auto_161533 - BLOCK
      ?auto_161534 - BLOCK
      ?auto_161535 - BLOCK
      ?auto_161536 - BLOCK
    )
    :vars
    (
      ?auto_161537 - BLOCK
      ?auto_161538 - BLOCK
      ?auto_161539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161531 ?auto_161532 ) ) ( not ( = ?auto_161531 ?auto_161533 ) ) ( not ( = ?auto_161531 ?auto_161534 ) ) ( not ( = ?auto_161531 ?auto_161535 ) ) ( not ( = ?auto_161531 ?auto_161536 ) ) ( not ( = ?auto_161532 ?auto_161533 ) ) ( not ( = ?auto_161532 ?auto_161534 ) ) ( not ( = ?auto_161532 ?auto_161535 ) ) ( not ( = ?auto_161532 ?auto_161536 ) ) ( not ( = ?auto_161533 ?auto_161534 ) ) ( not ( = ?auto_161533 ?auto_161535 ) ) ( not ( = ?auto_161533 ?auto_161536 ) ) ( not ( = ?auto_161534 ?auto_161535 ) ) ( not ( = ?auto_161534 ?auto_161536 ) ) ( not ( = ?auto_161535 ?auto_161536 ) ) ( ON ?auto_161536 ?auto_161537 ) ( not ( = ?auto_161531 ?auto_161537 ) ) ( not ( = ?auto_161532 ?auto_161537 ) ) ( not ( = ?auto_161533 ?auto_161537 ) ) ( not ( = ?auto_161534 ?auto_161537 ) ) ( not ( = ?auto_161535 ?auto_161537 ) ) ( not ( = ?auto_161536 ?auto_161537 ) ) ( ON ?auto_161535 ?auto_161536 ) ( ON-TABLE ?auto_161538 ) ( ON ?auto_161537 ?auto_161538 ) ( not ( = ?auto_161538 ?auto_161537 ) ) ( not ( = ?auto_161538 ?auto_161536 ) ) ( not ( = ?auto_161538 ?auto_161535 ) ) ( not ( = ?auto_161531 ?auto_161538 ) ) ( not ( = ?auto_161532 ?auto_161538 ) ) ( not ( = ?auto_161533 ?auto_161538 ) ) ( not ( = ?auto_161534 ?auto_161538 ) ) ( ON ?auto_161531 ?auto_161539 ) ( not ( = ?auto_161531 ?auto_161539 ) ) ( not ( = ?auto_161532 ?auto_161539 ) ) ( not ( = ?auto_161533 ?auto_161539 ) ) ( not ( = ?auto_161534 ?auto_161539 ) ) ( not ( = ?auto_161535 ?auto_161539 ) ) ( not ( = ?auto_161536 ?auto_161539 ) ) ( not ( = ?auto_161537 ?auto_161539 ) ) ( not ( = ?auto_161538 ?auto_161539 ) ) ( ON ?auto_161532 ?auto_161531 ) ( ON-TABLE ?auto_161539 ) ( ON ?auto_161533 ?auto_161532 ) ( CLEAR ?auto_161533 ) ( HOLDING ?auto_161534 ) ( CLEAR ?auto_161535 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161538 ?auto_161537 ?auto_161536 ?auto_161535 ?auto_161534 )
      ( MAKE-6PILE ?auto_161531 ?auto_161532 ?auto_161533 ?auto_161534 ?auto_161535 ?auto_161536 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161540 - BLOCK
      ?auto_161541 - BLOCK
      ?auto_161542 - BLOCK
      ?auto_161543 - BLOCK
      ?auto_161544 - BLOCK
      ?auto_161545 - BLOCK
    )
    :vars
    (
      ?auto_161546 - BLOCK
      ?auto_161547 - BLOCK
      ?auto_161548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161540 ?auto_161541 ) ) ( not ( = ?auto_161540 ?auto_161542 ) ) ( not ( = ?auto_161540 ?auto_161543 ) ) ( not ( = ?auto_161540 ?auto_161544 ) ) ( not ( = ?auto_161540 ?auto_161545 ) ) ( not ( = ?auto_161541 ?auto_161542 ) ) ( not ( = ?auto_161541 ?auto_161543 ) ) ( not ( = ?auto_161541 ?auto_161544 ) ) ( not ( = ?auto_161541 ?auto_161545 ) ) ( not ( = ?auto_161542 ?auto_161543 ) ) ( not ( = ?auto_161542 ?auto_161544 ) ) ( not ( = ?auto_161542 ?auto_161545 ) ) ( not ( = ?auto_161543 ?auto_161544 ) ) ( not ( = ?auto_161543 ?auto_161545 ) ) ( not ( = ?auto_161544 ?auto_161545 ) ) ( ON ?auto_161545 ?auto_161546 ) ( not ( = ?auto_161540 ?auto_161546 ) ) ( not ( = ?auto_161541 ?auto_161546 ) ) ( not ( = ?auto_161542 ?auto_161546 ) ) ( not ( = ?auto_161543 ?auto_161546 ) ) ( not ( = ?auto_161544 ?auto_161546 ) ) ( not ( = ?auto_161545 ?auto_161546 ) ) ( ON ?auto_161544 ?auto_161545 ) ( ON-TABLE ?auto_161547 ) ( ON ?auto_161546 ?auto_161547 ) ( not ( = ?auto_161547 ?auto_161546 ) ) ( not ( = ?auto_161547 ?auto_161545 ) ) ( not ( = ?auto_161547 ?auto_161544 ) ) ( not ( = ?auto_161540 ?auto_161547 ) ) ( not ( = ?auto_161541 ?auto_161547 ) ) ( not ( = ?auto_161542 ?auto_161547 ) ) ( not ( = ?auto_161543 ?auto_161547 ) ) ( ON ?auto_161540 ?auto_161548 ) ( not ( = ?auto_161540 ?auto_161548 ) ) ( not ( = ?auto_161541 ?auto_161548 ) ) ( not ( = ?auto_161542 ?auto_161548 ) ) ( not ( = ?auto_161543 ?auto_161548 ) ) ( not ( = ?auto_161544 ?auto_161548 ) ) ( not ( = ?auto_161545 ?auto_161548 ) ) ( not ( = ?auto_161546 ?auto_161548 ) ) ( not ( = ?auto_161547 ?auto_161548 ) ) ( ON ?auto_161541 ?auto_161540 ) ( ON-TABLE ?auto_161548 ) ( ON ?auto_161542 ?auto_161541 ) ( CLEAR ?auto_161544 ) ( ON ?auto_161543 ?auto_161542 ) ( CLEAR ?auto_161543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161548 ?auto_161540 ?auto_161541 ?auto_161542 )
      ( MAKE-6PILE ?auto_161540 ?auto_161541 ?auto_161542 ?auto_161543 ?auto_161544 ?auto_161545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161549 - BLOCK
      ?auto_161550 - BLOCK
      ?auto_161551 - BLOCK
      ?auto_161552 - BLOCK
      ?auto_161553 - BLOCK
      ?auto_161554 - BLOCK
    )
    :vars
    (
      ?auto_161555 - BLOCK
      ?auto_161557 - BLOCK
      ?auto_161556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161549 ?auto_161550 ) ) ( not ( = ?auto_161549 ?auto_161551 ) ) ( not ( = ?auto_161549 ?auto_161552 ) ) ( not ( = ?auto_161549 ?auto_161553 ) ) ( not ( = ?auto_161549 ?auto_161554 ) ) ( not ( = ?auto_161550 ?auto_161551 ) ) ( not ( = ?auto_161550 ?auto_161552 ) ) ( not ( = ?auto_161550 ?auto_161553 ) ) ( not ( = ?auto_161550 ?auto_161554 ) ) ( not ( = ?auto_161551 ?auto_161552 ) ) ( not ( = ?auto_161551 ?auto_161553 ) ) ( not ( = ?auto_161551 ?auto_161554 ) ) ( not ( = ?auto_161552 ?auto_161553 ) ) ( not ( = ?auto_161552 ?auto_161554 ) ) ( not ( = ?auto_161553 ?auto_161554 ) ) ( ON ?auto_161554 ?auto_161555 ) ( not ( = ?auto_161549 ?auto_161555 ) ) ( not ( = ?auto_161550 ?auto_161555 ) ) ( not ( = ?auto_161551 ?auto_161555 ) ) ( not ( = ?auto_161552 ?auto_161555 ) ) ( not ( = ?auto_161553 ?auto_161555 ) ) ( not ( = ?auto_161554 ?auto_161555 ) ) ( ON-TABLE ?auto_161557 ) ( ON ?auto_161555 ?auto_161557 ) ( not ( = ?auto_161557 ?auto_161555 ) ) ( not ( = ?auto_161557 ?auto_161554 ) ) ( not ( = ?auto_161557 ?auto_161553 ) ) ( not ( = ?auto_161549 ?auto_161557 ) ) ( not ( = ?auto_161550 ?auto_161557 ) ) ( not ( = ?auto_161551 ?auto_161557 ) ) ( not ( = ?auto_161552 ?auto_161557 ) ) ( ON ?auto_161549 ?auto_161556 ) ( not ( = ?auto_161549 ?auto_161556 ) ) ( not ( = ?auto_161550 ?auto_161556 ) ) ( not ( = ?auto_161551 ?auto_161556 ) ) ( not ( = ?auto_161552 ?auto_161556 ) ) ( not ( = ?auto_161553 ?auto_161556 ) ) ( not ( = ?auto_161554 ?auto_161556 ) ) ( not ( = ?auto_161555 ?auto_161556 ) ) ( not ( = ?auto_161557 ?auto_161556 ) ) ( ON ?auto_161550 ?auto_161549 ) ( ON-TABLE ?auto_161556 ) ( ON ?auto_161551 ?auto_161550 ) ( ON ?auto_161552 ?auto_161551 ) ( CLEAR ?auto_161552 ) ( HOLDING ?auto_161553 ) ( CLEAR ?auto_161554 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161557 ?auto_161555 ?auto_161554 ?auto_161553 )
      ( MAKE-6PILE ?auto_161549 ?auto_161550 ?auto_161551 ?auto_161552 ?auto_161553 ?auto_161554 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161558 - BLOCK
      ?auto_161559 - BLOCK
      ?auto_161560 - BLOCK
      ?auto_161561 - BLOCK
      ?auto_161562 - BLOCK
      ?auto_161563 - BLOCK
    )
    :vars
    (
      ?auto_161565 - BLOCK
      ?auto_161564 - BLOCK
      ?auto_161566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161558 ?auto_161559 ) ) ( not ( = ?auto_161558 ?auto_161560 ) ) ( not ( = ?auto_161558 ?auto_161561 ) ) ( not ( = ?auto_161558 ?auto_161562 ) ) ( not ( = ?auto_161558 ?auto_161563 ) ) ( not ( = ?auto_161559 ?auto_161560 ) ) ( not ( = ?auto_161559 ?auto_161561 ) ) ( not ( = ?auto_161559 ?auto_161562 ) ) ( not ( = ?auto_161559 ?auto_161563 ) ) ( not ( = ?auto_161560 ?auto_161561 ) ) ( not ( = ?auto_161560 ?auto_161562 ) ) ( not ( = ?auto_161560 ?auto_161563 ) ) ( not ( = ?auto_161561 ?auto_161562 ) ) ( not ( = ?auto_161561 ?auto_161563 ) ) ( not ( = ?auto_161562 ?auto_161563 ) ) ( ON ?auto_161563 ?auto_161565 ) ( not ( = ?auto_161558 ?auto_161565 ) ) ( not ( = ?auto_161559 ?auto_161565 ) ) ( not ( = ?auto_161560 ?auto_161565 ) ) ( not ( = ?auto_161561 ?auto_161565 ) ) ( not ( = ?auto_161562 ?auto_161565 ) ) ( not ( = ?auto_161563 ?auto_161565 ) ) ( ON-TABLE ?auto_161564 ) ( ON ?auto_161565 ?auto_161564 ) ( not ( = ?auto_161564 ?auto_161565 ) ) ( not ( = ?auto_161564 ?auto_161563 ) ) ( not ( = ?auto_161564 ?auto_161562 ) ) ( not ( = ?auto_161558 ?auto_161564 ) ) ( not ( = ?auto_161559 ?auto_161564 ) ) ( not ( = ?auto_161560 ?auto_161564 ) ) ( not ( = ?auto_161561 ?auto_161564 ) ) ( ON ?auto_161558 ?auto_161566 ) ( not ( = ?auto_161558 ?auto_161566 ) ) ( not ( = ?auto_161559 ?auto_161566 ) ) ( not ( = ?auto_161560 ?auto_161566 ) ) ( not ( = ?auto_161561 ?auto_161566 ) ) ( not ( = ?auto_161562 ?auto_161566 ) ) ( not ( = ?auto_161563 ?auto_161566 ) ) ( not ( = ?auto_161565 ?auto_161566 ) ) ( not ( = ?auto_161564 ?auto_161566 ) ) ( ON ?auto_161559 ?auto_161558 ) ( ON-TABLE ?auto_161566 ) ( ON ?auto_161560 ?auto_161559 ) ( ON ?auto_161561 ?auto_161560 ) ( CLEAR ?auto_161563 ) ( ON ?auto_161562 ?auto_161561 ) ( CLEAR ?auto_161562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161566 ?auto_161558 ?auto_161559 ?auto_161560 ?auto_161561 )
      ( MAKE-6PILE ?auto_161558 ?auto_161559 ?auto_161560 ?auto_161561 ?auto_161562 ?auto_161563 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161567 - BLOCK
      ?auto_161568 - BLOCK
      ?auto_161569 - BLOCK
      ?auto_161570 - BLOCK
      ?auto_161571 - BLOCK
      ?auto_161572 - BLOCK
    )
    :vars
    (
      ?auto_161573 - BLOCK
      ?auto_161575 - BLOCK
      ?auto_161574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161567 ?auto_161568 ) ) ( not ( = ?auto_161567 ?auto_161569 ) ) ( not ( = ?auto_161567 ?auto_161570 ) ) ( not ( = ?auto_161567 ?auto_161571 ) ) ( not ( = ?auto_161567 ?auto_161572 ) ) ( not ( = ?auto_161568 ?auto_161569 ) ) ( not ( = ?auto_161568 ?auto_161570 ) ) ( not ( = ?auto_161568 ?auto_161571 ) ) ( not ( = ?auto_161568 ?auto_161572 ) ) ( not ( = ?auto_161569 ?auto_161570 ) ) ( not ( = ?auto_161569 ?auto_161571 ) ) ( not ( = ?auto_161569 ?auto_161572 ) ) ( not ( = ?auto_161570 ?auto_161571 ) ) ( not ( = ?auto_161570 ?auto_161572 ) ) ( not ( = ?auto_161571 ?auto_161572 ) ) ( not ( = ?auto_161567 ?auto_161573 ) ) ( not ( = ?auto_161568 ?auto_161573 ) ) ( not ( = ?auto_161569 ?auto_161573 ) ) ( not ( = ?auto_161570 ?auto_161573 ) ) ( not ( = ?auto_161571 ?auto_161573 ) ) ( not ( = ?auto_161572 ?auto_161573 ) ) ( ON-TABLE ?auto_161575 ) ( ON ?auto_161573 ?auto_161575 ) ( not ( = ?auto_161575 ?auto_161573 ) ) ( not ( = ?auto_161575 ?auto_161572 ) ) ( not ( = ?auto_161575 ?auto_161571 ) ) ( not ( = ?auto_161567 ?auto_161575 ) ) ( not ( = ?auto_161568 ?auto_161575 ) ) ( not ( = ?auto_161569 ?auto_161575 ) ) ( not ( = ?auto_161570 ?auto_161575 ) ) ( ON ?auto_161567 ?auto_161574 ) ( not ( = ?auto_161567 ?auto_161574 ) ) ( not ( = ?auto_161568 ?auto_161574 ) ) ( not ( = ?auto_161569 ?auto_161574 ) ) ( not ( = ?auto_161570 ?auto_161574 ) ) ( not ( = ?auto_161571 ?auto_161574 ) ) ( not ( = ?auto_161572 ?auto_161574 ) ) ( not ( = ?auto_161573 ?auto_161574 ) ) ( not ( = ?auto_161575 ?auto_161574 ) ) ( ON ?auto_161568 ?auto_161567 ) ( ON-TABLE ?auto_161574 ) ( ON ?auto_161569 ?auto_161568 ) ( ON ?auto_161570 ?auto_161569 ) ( ON ?auto_161571 ?auto_161570 ) ( CLEAR ?auto_161571 ) ( HOLDING ?auto_161572 ) ( CLEAR ?auto_161573 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161575 ?auto_161573 ?auto_161572 )
      ( MAKE-6PILE ?auto_161567 ?auto_161568 ?auto_161569 ?auto_161570 ?auto_161571 ?auto_161572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161576 - BLOCK
      ?auto_161577 - BLOCK
      ?auto_161578 - BLOCK
      ?auto_161579 - BLOCK
      ?auto_161580 - BLOCK
      ?auto_161581 - BLOCK
    )
    :vars
    (
      ?auto_161582 - BLOCK
      ?auto_161583 - BLOCK
      ?auto_161584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161576 ?auto_161577 ) ) ( not ( = ?auto_161576 ?auto_161578 ) ) ( not ( = ?auto_161576 ?auto_161579 ) ) ( not ( = ?auto_161576 ?auto_161580 ) ) ( not ( = ?auto_161576 ?auto_161581 ) ) ( not ( = ?auto_161577 ?auto_161578 ) ) ( not ( = ?auto_161577 ?auto_161579 ) ) ( not ( = ?auto_161577 ?auto_161580 ) ) ( not ( = ?auto_161577 ?auto_161581 ) ) ( not ( = ?auto_161578 ?auto_161579 ) ) ( not ( = ?auto_161578 ?auto_161580 ) ) ( not ( = ?auto_161578 ?auto_161581 ) ) ( not ( = ?auto_161579 ?auto_161580 ) ) ( not ( = ?auto_161579 ?auto_161581 ) ) ( not ( = ?auto_161580 ?auto_161581 ) ) ( not ( = ?auto_161576 ?auto_161582 ) ) ( not ( = ?auto_161577 ?auto_161582 ) ) ( not ( = ?auto_161578 ?auto_161582 ) ) ( not ( = ?auto_161579 ?auto_161582 ) ) ( not ( = ?auto_161580 ?auto_161582 ) ) ( not ( = ?auto_161581 ?auto_161582 ) ) ( ON-TABLE ?auto_161583 ) ( ON ?auto_161582 ?auto_161583 ) ( not ( = ?auto_161583 ?auto_161582 ) ) ( not ( = ?auto_161583 ?auto_161581 ) ) ( not ( = ?auto_161583 ?auto_161580 ) ) ( not ( = ?auto_161576 ?auto_161583 ) ) ( not ( = ?auto_161577 ?auto_161583 ) ) ( not ( = ?auto_161578 ?auto_161583 ) ) ( not ( = ?auto_161579 ?auto_161583 ) ) ( ON ?auto_161576 ?auto_161584 ) ( not ( = ?auto_161576 ?auto_161584 ) ) ( not ( = ?auto_161577 ?auto_161584 ) ) ( not ( = ?auto_161578 ?auto_161584 ) ) ( not ( = ?auto_161579 ?auto_161584 ) ) ( not ( = ?auto_161580 ?auto_161584 ) ) ( not ( = ?auto_161581 ?auto_161584 ) ) ( not ( = ?auto_161582 ?auto_161584 ) ) ( not ( = ?auto_161583 ?auto_161584 ) ) ( ON ?auto_161577 ?auto_161576 ) ( ON-TABLE ?auto_161584 ) ( ON ?auto_161578 ?auto_161577 ) ( ON ?auto_161579 ?auto_161578 ) ( ON ?auto_161580 ?auto_161579 ) ( CLEAR ?auto_161582 ) ( ON ?auto_161581 ?auto_161580 ) ( CLEAR ?auto_161581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161584 ?auto_161576 ?auto_161577 ?auto_161578 ?auto_161579 ?auto_161580 )
      ( MAKE-6PILE ?auto_161576 ?auto_161577 ?auto_161578 ?auto_161579 ?auto_161580 ?auto_161581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161585 - BLOCK
      ?auto_161586 - BLOCK
      ?auto_161587 - BLOCK
      ?auto_161588 - BLOCK
      ?auto_161589 - BLOCK
      ?auto_161590 - BLOCK
    )
    :vars
    (
      ?auto_161592 - BLOCK
      ?auto_161591 - BLOCK
      ?auto_161593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161585 ?auto_161586 ) ) ( not ( = ?auto_161585 ?auto_161587 ) ) ( not ( = ?auto_161585 ?auto_161588 ) ) ( not ( = ?auto_161585 ?auto_161589 ) ) ( not ( = ?auto_161585 ?auto_161590 ) ) ( not ( = ?auto_161586 ?auto_161587 ) ) ( not ( = ?auto_161586 ?auto_161588 ) ) ( not ( = ?auto_161586 ?auto_161589 ) ) ( not ( = ?auto_161586 ?auto_161590 ) ) ( not ( = ?auto_161587 ?auto_161588 ) ) ( not ( = ?auto_161587 ?auto_161589 ) ) ( not ( = ?auto_161587 ?auto_161590 ) ) ( not ( = ?auto_161588 ?auto_161589 ) ) ( not ( = ?auto_161588 ?auto_161590 ) ) ( not ( = ?auto_161589 ?auto_161590 ) ) ( not ( = ?auto_161585 ?auto_161592 ) ) ( not ( = ?auto_161586 ?auto_161592 ) ) ( not ( = ?auto_161587 ?auto_161592 ) ) ( not ( = ?auto_161588 ?auto_161592 ) ) ( not ( = ?auto_161589 ?auto_161592 ) ) ( not ( = ?auto_161590 ?auto_161592 ) ) ( ON-TABLE ?auto_161591 ) ( not ( = ?auto_161591 ?auto_161592 ) ) ( not ( = ?auto_161591 ?auto_161590 ) ) ( not ( = ?auto_161591 ?auto_161589 ) ) ( not ( = ?auto_161585 ?auto_161591 ) ) ( not ( = ?auto_161586 ?auto_161591 ) ) ( not ( = ?auto_161587 ?auto_161591 ) ) ( not ( = ?auto_161588 ?auto_161591 ) ) ( ON ?auto_161585 ?auto_161593 ) ( not ( = ?auto_161585 ?auto_161593 ) ) ( not ( = ?auto_161586 ?auto_161593 ) ) ( not ( = ?auto_161587 ?auto_161593 ) ) ( not ( = ?auto_161588 ?auto_161593 ) ) ( not ( = ?auto_161589 ?auto_161593 ) ) ( not ( = ?auto_161590 ?auto_161593 ) ) ( not ( = ?auto_161592 ?auto_161593 ) ) ( not ( = ?auto_161591 ?auto_161593 ) ) ( ON ?auto_161586 ?auto_161585 ) ( ON-TABLE ?auto_161593 ) ( ON ?auto_161587 ?auto_161586 ) ( ON ?auto_161588 ?auto_161587 ) ( ON ?auto_161589 ?auto_161588 ) ( ON ?auto_161590 ?auto_161589 ) ( CLEAR ?auto_161590 ) ( HOLDING ?auto_161592 ) ( CLEAR ?auto_161591 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161591 ?auto_161592 )
      ( MAKE-6PILE ?auto_161585 ?auto_161586 ?auto_161587 ?auto_161588 ?auto_161589 ?auto_161590 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161594 - BLOCK
      ?auto_161595 - BLOCK
      ?auto_161596 - BLOCK
      ?auto_161597 - BLOCK
      ?auto_161598 - BLOCK
      ?auto_161599 - BLOCK
    )
    :vars
    (
      ?auto_161600 - BLOCK
      ?auto_161601 - BLOCK
      ?auto_161602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161594 ?auto_161595 ) ) ( not ( = ?auto_161594 ?auto_161596 ) ) ( not ( = ?auto_161594 ?auto_161597 ) ) ( not ( = ?auto_161594 ?auto_161598 ) ) ( not ( = ?auto_161594 ?auto_161599 ) ) ( not ( = ?auto_161595 ?auto_161596 ) ) ( not ( = ?auto_161595 ?auto_161597 ) ) ( not ( = ?auto_161595 ?auto_161598 ) ) ( not ( = ?auto_161595 ?auto_161599 ) ) ( not ( = ?auto_161596 ?auto_161597 ) ) ( not ( = ?auto_161596 ?auto_161598 ) ) ( not ( = ?auto_161596 ?auto_161599 ) ) ( not ( = ?auto_161597 ?auto_161598 ) ) ( not ( = ?auto_161597 ?auto_161599 ) ) ( not ( = ?auto_161598 ?auto_161599 ) ) ( not ( = ?auto_161594 ?auto_161600 ) ) ( not ( = ?auto_161595 ?auto_161600 ) ) ( not ( = ?auto_161596 ?auto_161600 ) ) ( not ( = ?auto_161597 ?auto_161600 ) ) ( not ( = ?auto_161598 ?auto_161600 ) ) ( not ( = ?auto_161599 ?auto_161600 ) ) ( ON-TABLE ?auto_161601 ) ( not ( = ?auto_161601 ?auto_161600 ) ) ( not ( = ?auto_161601 ?auto_161599 ) ) ( not ( = ?auto_161601 ?auto_161598 ) ) ( not ( = ?auto_161594 ?auto_161601 ) ) ( not ( = ?auto_161595 ?auto_161601 ) ) ( not ( = ?auto_161596 ?auto_161601 ) ) ( not ( = ?auto_161597 ?auto_161601 ) ) ( ON ?auto_161594 ?auto_161602 ) ( not ( = ?auto_161594 ?auto_161602 ) ) ( not ( = ?auto_161595 ?auto_161602 ) ) ( not ( = ?auto_161596 ?auto_161602 ) ) ( not ( = ?auto_161597 ?auto_161602 ) ) ( not ( = ?auto_161598 ?auto_161602 ) ) ( not ( = ?auto_161599 ?auto_161602 ) ) ( not ( = ?auto_161600 ?auto_161602 ) ) ( not ( = ?auto_161601 ?auto_161602 ) ) ( ON ?auto_161595 ?auto_161594 ) ( ON-TABLE ?auto_161602 ) ( ON ?auto_161596 ?auto_161595 ) ( ON ?auto_161597 ?auto_161596 ) ( ON ?auto_161598 ?auto_161597 ) ( ON ?auto_161599 ?auto_161598 ) ( CLEAR ?auto_161601 ) ( ON ?auto_161600 ?auto_161599 ) ( CLEAR ?auto_161600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161602 ?auto_161594 ?auto_161595 ?auto_161596 ?auto_161597 ?auto_161598 ?auto_161599 )
      ( MAKE-6PILE ?auto_161594 ?auto_161595 ?auto_161596 ?auto_161597 ?auto_161598 ?auto_161599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161603 - BLOCK
      ?auto_161604 - BLOCK
      ?auto_161605 - BLOCK
      ?auto_161606 - BLOCK
      ?auto_161607 - BLOCK
      ?auto_161608 - BLOCK
    )
    :vars
    (
      ?auto_161609 - BLOCK
      ?auto_161611 - BLOCK
      ?auto_161610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161603 ?auto_161604 ) ) ( not ( = ?auto_161603 ?auto_161605 ) ) ( not ( = ?auto_161603 ?auto_161606 ) ) ( not ( = ?auto_161603 ?auto_161607 ) ) ( not ( = ?auto_161603 ?auto_161608 ) ) ( not ( = ?auto_161604 ?auto_161605 ) ) ( not ( = ?auto_161604 ?auto_161606 ) ) ( not ( = ?auto_161604 ?auto_161607 ) ) ( not ( = ?auto_161604 ?auto_161608 ) ) ( not ( = ?auto_161605 ?auto_161606 ) ) ( not ( = ?auto_161605 ?auto_161607 ) ) ( not ( = ?auto_161605 ?auto_161608 ) ) ( not ( = ?auto_161606 ?auto_161607 ) ) ( not ( = ?auto_161606 ?auto_161608 ) ) ( not ( = ?auto_161607 ?auto_161608 ) ) ( not ( = ?auto_161603 ?auto_161609 ) ) ( not ( = ?auto_161604 ?auto_161609 ) ) ( not ( = ?auto_161605 ?auto_161609 ) ) ( not ( = ?auto_161606 ?auto_161609 ) ) ( not ( = ?auto_161607 ?auto_161609 ) ) ( not ( = ?auto_161608 ?auto_161609 ) ) ( not ( = ?auto_161611 ?auto_161609 ) ) ( not ( = ?auto_161611 ?auto_161608 ) ) ( not ( = ?auto_161611 ?auto_161607 ) ) ( not ( = ?auto_161603 ?auto_161611 ) ) ( not ( = ?auto_161604 ?auto_161611 ) ) ( not ( = ?auto_161605 ?auto_161611 ) ) ( not ( = ?auto_161606 ?auto_161611 ) ) ( ON ?auto_161603 ?auto_161610 ) ( not ( = ?auto_161603 ?auto_161610 ) ) ( not ( = ?auto_161604 ?auto_161610 ) ) ( not ( = ?auto_161605 ?auto_161610 ) ) ( not ( = ?auto_161606 ?auto_161610 ) ) ( not ( = ?auto_161607 ?auto_161610 ) ) ( not ( = ?auto_161608 ?auto_161610 ) ) ( not ( = ?auto_161609 ?auto_161610 ) ) ( not ( = ?auto_161611 ?auto_161610 ) ) ( ON ?auto_161604 ?auto_161603 ) ( ON-TABLE ?auto_161610 ) ( ON ?auto_161605 ?auto_161604 ) ( ON ?auto_161606 ?auto_161605 ) ( ON ?auto_161607 ?auto_161606 ) ( ON ?auto_161608 ?auto_161607 ) ( ON ?auto_161609 ?auto_161608 ) ( CLEAR ?auto_161609 ) ( HOLDING ?auto_161611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161611 )
      ( MAKE-6PILE ?auto_161603 ?auto_161604 ?auto_161605 ?auto_161606 ?auto_161607 ?auto_161608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161612 - BLOCK
      ?auto_161613 - BLOCK
      ?auto_161614 - BLOCK
      ?auto_161615 - BLOCK
      ?auto_161616 - BLOCK
      ?auto_161617 - BLOCK
    )
    :vars
    (
      ?auto_161618 - BLOCK
      ?auto_161619 - BLOCK
      ?auto_161620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161612 ?auto_161613 ) ) ( not ( = ?auto_161612 ?auto_161614 ) ) ( not ( = ?auto_161612 ?auto_161615 ) ) ( not ( = ?auto_161612 ?auto_161616 ) ) ( not ( = ?auto_161612 ?auto_161617 ) ) ( not ( = ?auto_161613 ?auto_161614 ) ) ( not ( = ?auto_161613 ?auto_161615 ) ) ( not ( = ?auto_161613 ?auto_161616 ) ) ( not ( = ?auto_161613 ?auto_161617 ) ) ( not ( = ?auto_161614 ?auto_161615 ) ) ( not ( = ?auto_161614 ?auto_161616 ) ) ( not ( = ?auto_161614 ?auto_161617 ) ) ( not ( = ?auto_161615 ?auto_161616 ) ) ( not ( = ?auto_161615 ?auto_161617 ) ) ( not ( = ?auto_161616 ?auto_161617 ) ) ( not ( = ?auto_161612 ?auto_161618 ) ) ( not ( = ?auto_161613 ?auto_161618 ) ) ( not ( = ?auto_161614 ?auto_161618 ) ) ( not ( = ?auto_161615 ?auto_161618 ) ) ( not ( = ?auto_161616 ?auto_161618 ) ) ( not ( = ?auto_161617 ?auto_161618 ) ) ( not ( = ?auto_161619 ?auto_161618 ) ) ( not ( = ?auto_161619 ?auto_161617 ) ) ( not ( = ?auto_161619 ?auto_161616 ) ) ( not ( = ?auto_161612 ?auto_161619 ) ) ( not ( = ?auto_161613 ?auto_161619 ) ) ( not ( = ?auto_161614 ?auto_161619 ) ) ( not ( = ?auto_161615 ?auto_161619 ) ) ( ON ?auto_161612 ?auto_161620 ) ( not ( = ?auto_161612 ?auto_161620 ) ) ( not ( = ?auto_161613 ?auto_161620 ) ) ( not ( = ?auto_161614 ?auto_161620 ) ) ( not ( = ?auto_161615 ?auto_161620 ) ) ( not ( = ?auto_161616 ?auto_161620 ) ) ( not ( = ?auto_161617 ?auto_161620 ) ) ( not ( = ?auto_161618 ?auto_161620 ) ) ( not ( = ?auto_161619 ?auto_161620 ) ) ( ON ?auto_161613 ?auto_161612 ) ( ON-TABLE ?auto_161620 ) ( ON ?auto_161614 ?auto_161613 ) ( ON ?auto_161615 ?auto_161614 ) ( ON ?auto_161616 ?auto_161615 ) ( ON ?auto_161617 ?auto_161616 ) ( ON ?auto_161618 ?auto_161617 ) ( ON ?auto_161619 ?auto_161618 ) ( CLEAR ?auto_161619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161620 ?auto_161612 ?auto_161613 ?auto_161614 ?auto_161615 ?auto_161616 ?auto_161617 ?auto_161618 )
      ( MAKE-6PILE ?auto_161612 ?auto_161613 ?auto_161614 ?auto_161615 ?auto_161616 ?auto_161617 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161622 - BLOCK
    )
    :vars
    (
      ?auto_161623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161623 ?auto_161622 ) ( CLEAR ?auto_161623 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161622 ) ( not ( = ?auto_161622 ?auto_161623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161623 ?auto_161622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161624 - BLOCK
    )
    :vars
    (
      ?auto_161625 - BLOCK
      ?auto_161626 - BLOCK
      ?auto_161627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161625 ?auto_161624 ) ( CLEAR ?auto_161625 ) ( ON-TABLE ?auto_161624 ) ( not ( = ?auto_161624 ?auto_161625 ) ) ( HOLDING ?auto_161626 ) ( CLEAR ?auto_161627 ) ( not ( = ?auto_161624 ?auto_161626 ) ) ( not ( = ?auto_161624 ?auto_161627 ) ) ( not ( = ?auto_161625 ?auto_161626 ) ) ( not ( = ?auto_161625 ?auto_161627 ) ) ( not ( = ?auto_161626 ?auto_161627 ) ) )
    :subtasks
    ( ( !STACK ?auto_161626 ?auto_161627 )
      ( MAKE-1PILE ?auto_161624 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161628 - BLOCK
    )
    :vars
    (
      ?auto_161630 - BLOCK
      ?auto_161631 - BLOCK
      ?auto_161629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161630 ?auto_161628 ) ( ON-TABLE ?auto_161628 ) ( not ( = ?auto_161628 ?auto_161630 ) ) ( CLEAR ?auto_161631 ) ( not ( = ?auto_161628 ?auto_161629 ) ) ( not ( = ?auto_161628 ?auto_161631 ) ) ( not ( = ?auto_161630 ?auto_161629 ) ) ( not ( = ?auto_161630 ?auto_161631 ) ) ( not ( = ?auto_161629 ?auto_161631 ) ) ( ON ?auto_161629 ?auto_161630 ) ( CLEAR ?auto_161629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161628 ?auto_161630 )
      ( MAKE-1PILE ?auto_161628 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161632 - BLOCK
    )
    :vars
    (
      ?auto_161634 - BLOCK
      ?auto_161635 - BLOCK
      ?auto_161633 - BLOCK
      ?auto_161636 - BLOCK
      ?auto_161637 - BLOCK
      ?auto_161638 - BLOCK
      ?auto_161639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161634 ?auto_161632 ) ( ON-TABLE ?auto_161632 ) ( not ( = ?auto_161632 ?auto_161634 ) ) ( not ( = ?auto_161632 ?auto_161635 ) ) ( not ( = ?auto_161632 ?auto_161633 ) ) ( not ( = ?auto_161634 ?auto_161635 ) ) ( not ( = ?auto_161634 ?auto_161633 ) ) ( not ( = ?auto_161635 ?auto_161633 ) ) ( ON ?auto_161635 ?auto_161634 ) ( CLEAR ?auto_161635 ) ( HOLDING ?auto_161633 ) ( CLEAR ?auto_161636 ) ( ON-TABLE ?auto_161637 ) ( ON ?auto_161638 ?auto_161637 ) ( ON ?auto_161639 ?auto_161638 ) ( ON ?auto_161636 ?auto_161639 ) ( not ( = ?auto_161637 ?auto_161638 ) ) ( not ( = ?auto_161637 ?auto_161639 ) ) ( not ( = ?auto_161637 ?auto_161636 ) ) ( not ( = ?auto_161637 ?auto_161633 ) ) ( not ( = ?auto_161638 ?auto_161639 ) ) ( not ( = ?auto_161638 ?auto_161636 ) ) ( not ( = ?auto_161638 ?auto_161633 ) ) ( not ( = ?auto_161639 ?auto_161636 ) ) ( not ( = ?auto_161639 ?auto_161633 ) ) ( not ( = ?auto_161636 ?auto_161633 ) ) ( not ( = ?auto_161632 ?auto_161636 ) ) ( not ( = ?auto_161632 ?auto_161637 ) ) ( not ( = ?auto_161632 ?auto_161638 ) ) ( not ( = ?auto_161632 ?auto_161639 ) ) ( not ( = ?auto_161634 ?auto_161636 ) ) ( not ( = ?auto_161634 ?auto_161637 ) ) ( not ( = ?auto_161634 ?auto_161638 ) ) ( not ( = ?auto_161634 ?auto_161639 ) ) ( not ( = ?auto_161635 ?auto_161636 ) ) ( not ( = ?auto_161635 ?auto_161637 ) ) ( not ( = ?auto_161635 ?auto_161638 ) ) ( not ( = ?auto_161635 ?auto_161639 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161637 ?auto_161638 ?auto_161639 ?auto_161636 ?auto_161633 )
      ( MAKE-1PILE ?auto_161632 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161640 - BLOCK
    )
    :vars
    (
      ?auto_161647 - BLOCK
      ?auto_161646 - BLOCK
      ?auto_161645 - BLOCK
      ?auto_161644 - BLOCK
      ?auto_161643 - BLOCK
      ?auto_161642 - BLOCK
      ?auto_161641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161647 ?auto_161640 ) ( ON-TABLE ?auto_161640 ) ( not ( = ?auto_161640 ?auto_161647 ) ) ( not ( = ?auto_161640 ?auto_161646 ) ) ( not ( = ?auto_161640 ?auto_161645 ) ) ( not ( = ?auto_161647 ?auto_161646 ) ) ( not ( = ?auto_161647 ?auto_161645 ) ) ( not ( = ?auto_161646 ?auto_161645 ) ) ( ON ?auto_161646 ?auto_161647 ) ( CLEAR ?auto_161644 ) ( ON-TABLE ?auto_161643 ) ( ON ?auto_161642 ?auto_161643 ) ( ON ?auto_161641 ?auto_161642 ) ( ON ?auto_161644 ?auto_161641 ) ( not ( = ?auto_161643 ?auto_161642 ) ) ( not ( = ?auto_161643 ?auto_161641 ) ) ( not ( = ?auto_161643 ?auto_161644 ) ) ( not ( = ?auto_161643 ?auto_161645 ) ) ( not ( = ?auto_161642 ?auto_161641 ) ) ( not ( = ?auto_161642 ?auto_161644 ) ) ( not ( = ?auto_161642 ?auto_161645 ) ) ( not ( = ?auto_161641 ?auto_161644 ) ) ( not ( = ?auto_161641 ?auto_161645 ) ) ( not ( = ?auto_161644 ?auto_161645 ) ) ( not ( = ?auto_161640 ?auto_161644 ) ) ( not ( = ?auto_161640 ?auto_161643 ) ) ( not ( = ?auto_161640 ?auto_161642 ) ) ( not ( = ?auto_161640 ?auto_161641 ) ) ( not ( = ?auto_161647 ?auto_161644 ) ) ( not ( = ?auto_161647 ?auto_161643 ) ) ( not ( = ?auto_161647 ?auto_161642 ) ) ( not ( = ?auto_161647 ?auto_161641 ) ) ( not ( = ?auto_161646 ?auto_161644 ) ) ( not ( = ?auto_161646 ?auto_161643 ) ) ( not ( = ?auto_161646 ?auto_161642 ) ) ( not ( = ?auto_161646 ?auto_161641 ) ) ( ON ?auto_161645 ?auto_161646 ) ( CLEAR ?auto_161645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161640 ?auto_161647 ?auto_161646 )
      ( MAKE-1PILE ?auto_161640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161648 - BLOCK
    )
    :vars
    (
      ?auto_161651 - BLOCK
      ?auto_161650 - BLOCK
      ?auto_161654 - BLOCK
      ?auto_161655 - BLOCK
      ?auto_161649 - BLOCK
      ?auto_161652 - BLOCK
      ?auto_161653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161651 ?auto_161648 ) ( ON-TABLE ?auto_161648 ) ( not ( = ?auto_161648 ?auto_161651 ) ) ( not ( = ?auto_161648 ?auto_161650 ) ) ( not ( = ?auto_161648 ?auto_161654 ) ) ( not ( = ?auto_161651 ?auto_161650 ) ) ( not ( = ?auto_161651 ?auto_161654 ) ) ( not ( = ?auto_161650 ?auto_161654 ) ) ( ON ?auto_161650 ?auto_161651 ) ( ON-TABLE ?auto_161655 ) ( ON ?auto_161649 ?auto_161655 ) ( ON ?auto_161652 ?auto_161649 ) ( not ( = ?auto_161655 ?auto_161649 ) ) ( not ( = ?auto_161655 ?auto_161652 ) ) ( not ( = ?auto_161655 ?auto_161653 ) ) ( not ( = ?auto_161655 ?auto_161654 ) ) ( not ( = ?auto_161649 ?auto_161652 ) ) ( not ( = ?auto_161649 ?auto_161653 ) ) ( not ( = ?auto_161649 ?auto_161654 ) ) ( not ( = ?auto_161652 ?auto_161653 ) ) ( not ( = ?auto_161652 ?auto_161654 ) ) ( not ( = ?auto_161653 ?auto_161654 ) ) ( not ( = ?auto_161648 ?auto_161653 ) ) ( not ( = ?auto_161648 ?auto_161655 ) ) ( not ( = ?auto_161648 ?auto_161649 ) ) ( not ( = ?auto_161648 ?auto_161652 ) ) ( not ( = ?auto_161651 ?auto_161653 ) ) ( not ( = ?auto_161651 ?auto_161655 ) ) ( not ( = ?auto_161651 ?auto_161649 ) ) ( not ( = ?auto_161651 ?auto_161652 ) ) ( not ( = ?auto_161650 ?auto_161653 ) ) ( not ( = ?auto_161650 ?auto_161655 ) ) ( not ( = ?auto_161650 ?auto_161649 ) ) ( not ( = ?auto_161650 ?auto_161652 ) ) ( ON ?auto_161654 ?auto_161650 ) ( CLEAR ?auto_161654 ) ( HOLDING ?auto_161653 ) ( CLEAR ?auto_161652 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161655 ?auto_161649 ?auto_161652 ?auto_161653 )
      ( MAKE-1PILE ?auto_161648 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161656 - BLOCK
    )
    :vars
    (
      ?auto_161660 - BLOCK
      ?auto_161657 - BLOCK
      ?auto_161661 - BLOCK
      ?auto_161662 - BLOCK
      ?auto_161658 - BLOCK
      ?auto_161659 - BLOCK
      ?auto_161663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161660 ?auto_161656 ) ( ON-TABLE ?auto_161656 ) ( not ( = ?auto_161656 ?auto_161660 ) ) ( not ( = ?auto_161656 ?auto_161657 ) ) ( not ( = ?auto_161656 ?auto_161661 ) ) ( not ( = ?auto_161660 ?auto_161657 ) ) ( not ( = ?auto_161660 ?auto_161661 ) ) ( not ( = ?auto_161657 ?auto_161661 ) ) ( ON ?auto_161657 ?auto_161660 ) ( ON-TABLE ?auto_161662 ) ( ON ?auto_161658 ?auto_161662 ) ( ON ?auto_161659 ?auto_161658 ) ( not ( = ?auto_161662 ?auto_161658 ) ) ( not ( = ?auto_161662 ?auto_161659 ) ) ( not ( = ?auto_161662 ?auto_161663 ) ) ( not ( = ?auto_161662 ?auto_161661 ) ) ( not ( = ?auto_161658 ?auto_161659 ) ) ( not ( = ?auto_161658 ?auto_161663 ) ) ( not ( = ?auto_161658 ?auto_161661 ) ) ( not ( = ?auto_161659 ?auto_161663 ) ) ( not ( = ?auto_161659 ?auto_161661 ) ) ( not ( = ?auto_161663 ?auto_161661 ) ) ( not ( = ?auto_161656 ?auto_161663 ) ) ( not ( = ?auto_161656 ?auto_161662 ) ) ( not ( = ?auto_161656 ?auto_161658 ) ) ( not ( = ?auto_161656 ?auto_161659 ) ) ( not ( = ?auto_161660 ?auto_161663 ) ) ( not ( = ?auto_161660 ?auto_161662 ) ) ( not ( = ?auto_161660 ?auto_161658 ) ) ( not ( = ?auto_161660 ?auto_161659 ) ) ( not ( = ?auto_161657 ?auto_161663 ) ) ( not ( = ?auto_161657 ?auto_161662 ) ) ( not ( = ?auto_161657 ?auto_161658 ) ) ( not ( = ?auto_161657 ?auto_161659 ) ) ( ON ?auto_161661 ?auto_161657 ) ( CLEAR ?auto_161659 ) ( ON ?auto_161663 ?auto_161661 ) ( CLEAR ?auto_161663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161656 ?auto_161660 ?auto_161657 ?auto_161661 )
      ( MAKE-1PILE ?auto_161656 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161664 - BLOCK
    )
    :vars
    (
      ?auto_161670 - BLOCK
      ?auto_161667 - BLOCK
      ?auto_161671 - BLOCK
      ?auto_161666 - BLOCK
      ?auto_161668 - BLOCK
      ?auto_161665 - BLOCK
      ?auto_161669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161670 ?auto_161664 ) ( ON-TABLE ?auto_161664 ) ( not ( = ?auto_161664 ?auto_161670 ) ) ( not ( = ?auto_161664 ?auto_161667 ) ) ( not ( = ?auto_161664 ?auto_161671 ) ) ( not ( = ?auto_161670 ?auto_161667 ) ) ( not ( = ?auto_161670 ?auto_161671 ) ) ( not ( = ?auto_161667 ?auto_161671 ) ) ( ON ?auto_161667 ?auto_161670 ) ( ON-TABLE ?auto_161666 ) ( ON ?auto_161668 ?auto_161666 ) ( not ( = ?auto_161666 ?auto_161668 ) ) ( not ( = ?auto_161666 ?auto_161665 ) ) ( not ( = ?auto_161666 ?auto_161669 ) ) ( not ( = ?auto_161666 ?auto_161671 ) ) ( not ( = ?auto_161668 ?auto_161665 ) ) ( not ( = ?auto_161668 ?auto_161669 ) ) ( not ( = ?auto_161668 ?auto_161671 ) ) ( not ( = ?auto_161665 ?auto_161669 ) ) ( not ( = ?auto_161665 ?auto_161671 ) ) ( not ( = ?auto_161669 ?auto_161671 ) ) ( not ( = ?auto_161664 ?auto_161669 ) ) ( not ( = ?auto_161664 ?auto_161666 ) ) ( not ( = ?auto_161664 ?auto_161668 ) ) ( not ( = ?auto_161664 ?auto_161665 ) ) ( not ( = ?auto_161670 ?auto_161669 ) ) ( not ( = ?auto_161670 ?auto_161666 ) ) ( not ( = ?auto_161670 ?auto_161668 ) ) ( not ( = ?auto_161670 ?auto_161665 ) ) ( not ( = ?auto_161667 ?auto_161669 ) ) ( not ( = ?auto_161667 ?auto_161666 ) ) ( not ( = ?auto_161667 ?auto_161668 ) ) ( not ( = ?auto_161667 ?auto_161665 ) ) ( ON ?auto_161671 ?auto_161667 ) ( ON ?auto_161669 ?auto_161671 ) ( CLEAR ?auto_161669 ) ( HOLDING ?auto_161665 ) ( CLEAR ?auto_161668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161666 ?auto_161668 ?auto_161665 )
      ( MAKE-1PILE ?auto_161664 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161672 - BLOCK
    )
    :vars
    (
      ?auto_161673 - BLOCK
      ?auto_161676 - BLOCK
      ?auto_161674 - BLOCK
      ?auto_161675 - BLOCK
      ?auto_161679 - BLOCK
      ?auto_161677 - BLOCK
      ?auto_161678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161673 ?auto_161672 ) ( ON-TABLE ?auto_161672 ) ( not ( = ?auto_161672 ?auto_161673 ) ) ( not ( = ?auto_161672 ?auto_161676 ) ) ( not ( = ?auto_161672 ?auto_161674 ) ) ( not ( = ?auto_161673 ?auto_161676 ) ) ( not ( = ?auto_161673 ?auto_161674 ) ) ( not ( = ?auto_161676 ?auto_161674 ) ) ( ON ?auto_161676 ?auto_161673 ) ( ON-TABLE ?auto_161675 ) ( ON ?auto_161679 ?auto_161675 ) ( not ( = ?auto_161675 ?auto_161679 ) ) ( not ( = ?auto_161675 ?auto_161677 ) ) ( not ( = ?auto_161675 ?auto_161678 ) ) ( not ( = ?auto_161675 ?auto_161674 ) ) ( not ( = ?auto_161679 ?auto_161677 ) ) ( not ( = ?auto_161679 ?auto_161678 ) ) ( not ( = ?auto_161679 ?auto_161674 ) ) ( not ( = ?auto_161677 ?auto_161678 ) ) ( not ( = ?auto_161677 ?auto_161674 ) ) ( not ( = ?auto_161678 ?auto_161674 ) ) ( not ( = ?auto_161672 ?auto_161678 ) ) ( not ( = ?auto_161672 ?auto_161675 ) ) ( not ( = ?auto_161672 ?auto_161679 ) ) ( not ( = ?auto_161672 ?auto_161677 ) ) ( not ( = ?auto_161673 ?auto_161678 ) ) ( not ( = ?auto_161673 ?auto_161675 ) ) ( not ( = ?auto_161673 ?auto_161679 ) ) ( not ( = ?auto_161673 ?auto_161677 ) ) ( not ( = ?auto_161676 ?auto_161678 ) ) ( not ( = ?auto_161676 ?auto_161675 ) ) ( not ( = ?auto_161676 ?auto_161679 ) ) ( not ( = ?auto_161676 ?auto_161677 ) ) ( ON ?auto_161674 ?auto_161676 ) ( ON ?auto_161678 ?auto_161674 ) ( CLEAR ?auto_161679 ) ( ON ?auto_161677 ?auto_161678 ) ( CLEAR ?auto_161677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161672 ?auto_161673 ?auto_161676 ?auto_161674 ?auto_161678 )
      ( MAKE-1PILE ?auto_161672 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161680 - BLOCK
    )
    :vars
    (
      ?auto_161682 - BLOCK
      ?auto_161683 - BLOCK
      ?auto_161687 - BLOCK
      ?auto_161681 - BLOCK
      ?auto_161684 - BLOCK
      ?auto_161685 - BLOCK
      ?auto_161686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161682 ?auto_161680 ) ( ON-TABLE ?auto_161680 ) ( not ( = ?auto_161680 ?auto_161682 ) ) ( not ( = ?auto_161680 ?auto_161683 ) ) ( not ( = ?auto_161680 ?auto_161687 ) ) ( not ( = ?auto_161682 ?auto_161683 ) ) ( not ( = ?auto_161682 ?auto_161687 ) ) ( not ( = ?auto_161683 ?auto_161687 ) ) ( ON ?auto_161683 ?auto_161682 ) ( ON-TABLE ?auto_161681 ) ( not ( = ?auto_161681 ?auto_161684 ) ) ( not ( = ?auto_161681 ?auto_161685 ) ) ( not ( = ?auto_161681 ?auto_161686 ) ) ( not ( = ?auto_161681 ?auto_161687 ) ) ( not ( = ?auto_161684 ?auto_161685 ) ) ( not ( = ?auto_161684 ?auto_161686 ) ) ( not ( = ?auto_161684 ?auto_161687 ) ) ( not ( = ?auto_161685 ?auto_161686 ) ) ( not ( = ?auto_161685 ?auto_161687 ) ) ( not ( = ?auto_161686 ?auto_161687 ) ) ( not ( = ?auto_161680 ?auto_161686 ) ) ( not ( = ?auto_161680 ?auto_161681 ) ) ( not ( = ?auto_161680 ?auto_161684 ) ) ( not ( = ?auto_161680 ?auto_161685 ) ) ( not ( = ?auto_161682 ?auto_161686 ) ) ( not ( = ?auto_161682 ?auto_161681 ) ) ( not ( = ?auto_161682 ?auto_161684 ) ) ( not ( = ?auto_161682 ?auto_161685 ) ) ( not ( = ?auto_161683 ?auto_161686 ) ) ( not ( = ?auto_161683 ?auto_161681 ) ) ( not ( = ?auto_161683 ?auto_161684 ) ) ( not ( = ?auto_161683 ?auto_161685 ) ) ( ON ?auto_161687 ?auto_161683 ) ( ON ?auto_161686 ?auto_161687 ) ( ON ?auto_161685 ?auto_161686 ) ( CLEAR ?auto_161685 ) ( HOLDING ?auto_161684 ) ( CLEAR ?auto_161681 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161681 ?auto_161684 )
      ( MAKE-1PILE ?auto_161680 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161688 - BLOCK
    )
    :vars
    (
      ?auto_161691 - BLOCK
      ?auto_161693 - BLOCK
      ?auto_161695 - BLOCK
      ?auto_161690 - BLOCK
      ?auto_161694 - BLOCK
      ?auto_161692 - BLOCK
      ?auto_161689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161691 ?auto_161688 ) ( ON-TABLE ?auto_161688 ) ( not ( = ?auto_161688 ?auto_161691 ) ) ( not ( = ?auto_161688 ?auto_161693 ) ) ( not ( = ?auto_161688 ?auto_161695 ) ) ( not ( = ?auto_161691 ?auto_161693 ) ) ( not ( = ?auto_161691 ?auto_161695 ) ) ( not ( = ?auto_161693 ?auto_161695 ) ) ( ON ?auto_161693 ?auto_161691 ) ( ON-TABLE ?auto_161690 ) ( not ( = ?auto_161690 ?auto_161694 ) ) ( not ( = ?auto_161690 ?auto_161692 ) ) ( not ( = ?auto_161690 ?auto_161689 ) ) ( not ( = ?auto_161690 ?auto_161695 ) ) ( not ( = ?auto_161694 ?auto_161692 ) ) ( not ( = ?auto_161694 ?auto_161689 ) ) ( not ( = ?auto_161694 ?auto_161695 ) ) ( not ( = ?auto_161692 ?auto_161689 ) ) ( not ( = ?auto_161692 ?auto_161695 ) ) ( not ( = ?auto_161689 ?auto_161695 ) ) ( not ( = ?auto_161688 ?auto_161689 ) ) ( not ( = ?auto_161688 ?auto_161690 ) ) ( not ( = ?auto_161688 ?auto_161694 ) ) ( not ( = ?auto_161688 ?auto_161692 ) ) ( not ( = ?auto_161691 ?auto_161689 ) ) ( not ( = ?auto_161691 ?auto_161690 ) ) ( not ( = ?auto_161691 ?auto_161694 ) ) ( not ( = ?auto_161691 ?auto_161692 ) ) ( not ( = ?auto_161693 ?auto_161689 ) ) ( not ( = ?auto_161693 ?auto_161690 ) ) ( not ( = ?auto_161693 ?auto_161694 ) ) ( not ( = ?auto_161693 ?auto_161692 ) ) ( ON ?auto_161695 ?auto_161693 ) ( ON ?auto_161689 ?auto_161695 ) ( ON ?auto_161692 ?auto_161689 ) ( CLEAR ?auto_161690 ) ( ON ?auto_161694 ?auto_161692 ) ( CLEAR ?auto_161694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161688 ?auto_161691 ?auto_161693 ?auto_161695 ?auto_161689 ?auto_161692 )
      ( MAKE-1PILE ?auto_161688 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161696 - BLOCK
    )
    :vars
    (
      ?auto_161697 - BLOCK
      ?auto_161699 - BLOCK
      ?auto_161703 - BLOCK
      ?auto_161698 - BLOCK
      ?auto_161700 - BLOCK
      ?auto_161702 - BLOCK
      ?auto_161701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161697 ?auto_161696 ) ( ON-TABLE ?auto_161696 ) ( not ( = ?auto_161696 ?auto_161697 ) ) ( not ( = ?auto_161696 ?auto_161699 ) ) ( not ( = ?auto_161696 ?auto_161703 ) ) ( not ( = ?auto_161697 ?auto_161699 ) ) ( not ( = ?auto_161697 ?auto_161703 ) ) ( not ( = ?auto_161699 ?auto_161703 ) ) ( ON ?auto_161699 ?auto_161697 ) ( not ( = ?auto_161698 ?auto_161700 ) ) ( not ( = ?auto_161698 ?auto_161702 ) ) ( not ( = ?auto_161698 ?auto_161701 ) ) ( not ( = ?auto_161698 ?auto_161703 ) ) ( not ( = ?auto_161700 ?auto_161702 ) ) ( not ( = ?auto_161700 ?auto_161701 ) ) ( not ( = ?auto_161700 ?auto_161703 ) ) ( not ( = ?auto_161702 ?auto_161701 ) ) ( not ( = ?auto_161702 ?auto_161703 ) ) ( not ( = ?auto_161701 ?auto_161703 ) ) ( not ( = ?auto_161696 ?auto_161701 ) ) ( not ( = ?auto_161696 ?auto_161698 ) ) ( not ( = ?auto_161696 ?auto_161700 ) ) ( not ( = ?auto_161696 ?auto_161702 ) ) ( not ( = ?auto_161697 ?auto_161701 ) ) ( not ( = ?auto_161697 ?auto_161698 ) ) ( not ( = ?auto_161697 ?auto_161700 ) ) ( not ( = ?auto_161697 ?auto_161702 ) ) ( not ( = ?auto_161699 ?auto_161701 ) ) ( not ( = ?auto_161699 ?auto_161698 ) ) ( not ( = ?auto_161699 ?auto_161700 ) ) ( not ( = ?auto_161699 ?auto_161702 ) ) ( ON ?auto_161703 ?auto_161699 ) ( ON ?auto_161701 ?auto_161703 ) ( ON ?auto_161702 ?auto_161701 ) ( ON ?auto_161700 ?auto_161702 ) ( CLEAR ?auto_161700 ) ( HOLDING ?auto_161698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161698 )
      ( MAKE-1PILE ?auto_161696 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161704 - BLOCK
    )
    :vars
    (
      ?auto_161708 - BLOCK
      ?auto_161711 - BLOCK
      ?auto_161706 - BLOCK
      ?auto_161705 - BLOCK
      ?auto_161707 - BLOCK
      ?auto_161709 - BLOCK
      ?auto_161710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161708 ?auto_161704 ) ( ON-TABLE ?auto_161704 ) ( not ( = ?auto_161704 ?auto_161708 ) ) ( not ( = ?auto_161704 ?auto_161711 ) ) ( not ( = ?auto_161704 ?auto_161706 ) ) ( not ( = ?auto_161708 ?auto_161711 ) ) ( not ( = ?auto_161708 ?auto_161706 ) ) ( not ( = ?auto_161711 ?auto_161706 ) ) ( ON ?auto_161711 ?auto_161708 ) ( not ( = ?auto_161705 ?auto_161707 ) ) ( not ( = ?auto_161705 ?auto_161709 ) ) ( not ( = ?auto_161705 ?auto_161710 ) ) ( not ( = ?auto_161705 ?auto_161706 ) ) ( not ( = ?auto_161707 ?auto_161709 ) ) ( not ( = ?auto_161707 ?auto_161710 ) ) ( not ( = ?auto_161707 ?auto_161706 ) ) ( not ( = ?auto_161709 ?auto_161710 ) ) ( not ( = ?auto_161709 ?auto_161706 ) ) ( not ( = ?auto_161710 ?auto_161706 ) ) ( not ( = ?auto_161704 ?auto_161710 ) ) ( not ( = ?auto_161704 ?auto_161705 ) ) ( not ( = ?auto_161704 ?auto_161707 ) ) ( not ( = ?auto_161704 ?auto_161709 ) ) ( not ( = ?auto_161708 ?auto_161710 ) ) ( not ( = ?auto_161708 ?auto_161705 ) ) ( not ( = ?auto_161708 ?auto_161707 ) ) ( not ( = ?auto_161708 ?auto_161709 ) ) ( not ( = ?auto_161711 ?auto_161710 ) ) ( not ( = ?auto_161711 ?auto_161705 ) ) ( not ( = ?auto_161711 ?auto_161707 ) ) ( not ( = ?auto_161711 ?auto_161709 ) ) ( ON ?auto_161706 ?auto_161711 ) ( ON ?auto_161710 ?auto_161706 ) ( ON ?auto_161709 ?auto_161710 ) ( ON ?auto_161707 ?auto_161709 ) ( ON ?auto_161705 ?auto_161707 ) ( CLEAR ?auto_161705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161704 ?auto_161708 ?auto_161711 ?auto_161706 ?auto_161710 ?auto_161709 ?auto_161707 )
      ( MAKE-1PILE ?auto_161704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161712 - BLOCK
    )
    :vars
    (
      ?auto_161713 - BLOCK
      ?auto_161719 - BLOCK
      ?auto_161717 - BLOCK
      ?auto_161715 - BLOCK
      ?auto_161718 - BLOCK
      ?auto_161714 - BLOCK
      ?auto_161716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161713 ?auto_161712 ) ( ON-TABLE ?auto_161712 ) ( not ( = ?auto_161712 ?auto_161713 ) ) ( not ( = ?auto_161712 ?auto_161719 ) ) ( not ( = ?auto_161712 ?auto_161717 ) ) ( not ( = ?auto_161713 ?auto_161719 ) ) ( not ( = ?auto_161713 ?auto_161717 ) ) ( not ( = ?auto_161719 ?auto_161717 ) ) ( ON ?auto_161719 ?auto_161713 ) ( not ( = ?auto_161715 ?auto_161718 ) ) ( not ( = ?auto_161715 ?auto_161714 ) ) ( not ( = ?auto_161715 ?auto_161716 ) ) ( not ( = ?auto_161715 ?auto_161717 ) ) ( not ( = ?auto_161718 ?auto_161714 ) ) ( not ( = ?auto_161718 ?auto_161716 ) ) ( not ( = ?auto_161718 ?auto_161717 ) ) ( not ( = ?auto_161714 ?auto_161716 ) ) ( not ( = ?auto_161714 ?auto_161717 ) ) ( not ( = ?auto_161716 ?auto_161717 ) ) ( not ( = ?auto_161712 ?auto_161716 ) ) ( not ( = ?auto_161712 ?auto_161715 ) ) ( not ( = ?auto_161712 ?auto_161718 ) ) ( not ( = ?auto_161712 ?auto_161714 ) ) ( not ( = ?auto_161713 ?auto_161716 ) ) ( not ( = ?auto_161713 ?auto_161715 ) ) ( not ( = ?auto_161713 ?auto_161718 ) ) ( not ( = ?auto_161713 ?auto_161714 ) ) ( not ( = ?auto_161719 ?auto_161716 ) ) ( not ( = ?auto_161719 ?auto_161715 ) ) ( not ( = ?auto_161719 ?auto_161718 ) ) ( not ( = ?auto_161719 ?auto_161714 ) ) ( ON ?auto_161717 ?auto_161719 ) ( ON ?auto_161716 ?auto_161717 ) ( ON ?auto_161714 ?auto_161716 ) ( ON ?auto_161718 ?auto_161714 ) ( HOLDING ?auto_161715 ) ( CLEAR ?auto_161718 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161712 ?auto_161713 ?auto_161719 ?auto_161717 ?auto_161716 ?auto_161714 ?auto_161718 ?auto_161715 )
      ( MAKE-1PILE ?auto_161712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161720 - BLOCK
    )
    :vars
    (
      ?auto_161723 - BLOCK
      ?auto_161726 - BLOCK
      ?auto_161725 - BLOCK
      ?auto_161722 - BLOCK
      ?auto_161727 - BLOCK
      ?auto_161721 - BLOCK
      ?auto_161724 - BLOCK
      ?auto_161728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161723 ?auto_161720 ) ( ON-TABLE ?auto_161720 ) ( not ( = ?auto_161720 ?auto_161723 ) ) ( not ( = ?auto_161720 ?auto_161726 ) ) ( not ( = ?auto_161720 ?auto_161725 ) ) ( not ( = ?auto_161723 ?auto_161726 ) ) ( not ( = ?auto_161723 ?auto_161725 ) ) ( not ( = ?auto_161726 ?auto_161725 ) ) ( ON ?auto_161726 ?auto_161723 ) ( not ( = ?auto_161722 ?auto_161727 ) ) ( not ( = ?auto_161722 ?auto_161721 ) ) ( not ( = ?auto_161722 ?auto_161724 ) ) ( not ( = ?auto_161722 ?auto_161725 ) ) ( not ( = ?auto_161727 ?auto_161721 ) ) ( not ( = ?auto_161727 ?auto_161724 ) ) ( not ( = ?auto_161727 ?auto_161725 ) ) ( not ( = ?auto_161721 ?auto_161724 ) ) ( not ( = ?auto_161721 ?auto_161725 ) ) ( not ( = ?auto_161724 ?auto_161725 ) ) ( not ( = ?auto_161720 ?auto_161724 ) ) ( not ( = ?auto_161720 ?auto_161722 ) ) ( not ( = ?auto_161720 ?auto_161727 ) ) ( not ( = ?auto_161720 ?auto_161721 ) ) ( not ( = ?auto_161723 ?auto_161724 ) ) ( not ( = ?auto_161723 ?auto_161722 ) ) ( not ( = ?auto_161723 ?auto_161727 ) ) ( not ( = ?auto_161723 ?auto_161721 ) ) ( not ( = ?auto_161726 ?auto_161724 ) ) ( not ( = ?auto_161726 ?auto_161722 ) ) ( not ( = ?auto_161726 ?auto_161727 ) ) ( not ( = ?auto_161726 ?auto_161721 ) ) ( ON ?auto_161725 ?auto_161726 ) ( ON ?auto_161724 ?auto_161725 ) ( ON ?auto_161721 ?auto_161724 ) ( ON ?auto_161727 ?auto_161721 ) ( CLEAR ?auto_161727 ) ( ON ?auto_161722 ?auto_161728 ) ( CLEAR ?auto_161722 ) ( HAND-EMPTY ) ( not ( = ?auto_161720 ?auto_161728 ) ) ( not ( = ?auto_161723 ?auto_161728 ) ) ( not ( = ?auto_161726 ?auto_161728 ) ) ( not ( = ?auto_161725 ?auto_161728 ) ) ( not ( = ?auto_161722 ?auto_161728 ) ) ( not ( = ?auto_161727 ?auto_161728 ) ) ( not ( = ?auto_161721 ?auto_161728 ) ) ( not ( = ?auto_161724 ?auto_161728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161722 ?auto_161728 )
      ( MAKE-1PILE ?auto_161720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161729 - BLOCK
    )
    :vars
    (
      ?auto_161737 - BLOCK
      ?auto_161735 - BLOCK
      ?auto_161734 - BLOCK
      ?auto_161730 - BLOCK
      ?auto_161732 - BLOCK
      ?auto_161731 - BLOCK
      ?auto_161736 - BLOCK
      ?auto_161733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161737 ?auto_161729 ) ( ON-TABLE ?auto_161729 ) ( not ( = ?auto_161729 ?auto_161737 ) ) ( not ( = ?auto_161729 ?auto_161735 ) ) ( not ( = ?auto_161729 ?auto_161734 ) ) ( not ( = ?auto_161737 ?auto_161735 ) ) ( not ( = ?auto_161737 ?auto_161734 ) ) ( not ( = ?auto_161735 ?auto_161734 ) ) ( ON ?auto_161735 ?auto_161737 ) ( not ( = ?auto_161730 ?auto_161732 ) ) ( not ( = ?auto_161730 ?auto_161731 ) ) ( not ( = ?auto_161730 ?auto_161736 ) ) ( not ( = ?auto_161730 ?auto_161734 ) ) ( not ( = ?auto_161732 ?auto_161731 ) ) ( not ( = ?auto_161732 ?auto_161736 ) ) ( not ( = ?auto_161732 ?auto_161734 ) ) ( not ( = ?auto_161731 ?auto_161736 ) ) ( not ( = ?auto_161731 ?auto_161734 ) ) ( not ( = ?auto_161736 ?auto_161734 ) ) ( not ( = ?auto_161729 ?auto_161736 ) ) ( not ( = ?auto_161729 ?auto_161730 ) ) ( not ( = ?auto_161729 ?auto_161732 ) ) ( not ( = ?auto_161729 ?auto_161731 ) ) ( not ( = ?auto_161737 ?auto_161736 ) ) ( not ( = ?auto_161737 ?auto_161730 ) ) ( not ( = ?auto_161737 ?auto_161732 ) ) ( not ( = ?auto_161737 ?auto_161731 ) ) ( not ( = ?auto_161735 ?auto_161736 ) ) ( not ( = ?auto_161735 ?auto_161730 ) ) ( not ( = ?auto_161735 ?auto_161732 ) ) ( not ( = ?auto_161735 ?auto_161731 ) ) ( ON ?auto_161734 ?auto_161735 ) ( ON ?auto_161736 ?auto_161734 ) ( ON ?auto_161731 ?auto_161736 ) ( ON ?auto_161730 ?auto_161733 ) ( CLEAR ?auto_161730 ) ( not ( = ?auto_161729 ?auto_161733 ) ) ( not ( = ?auto_161737 ?auto_161733 ) ) ( not ( = ?auto_161735 ?auto_161733 ) ) ( not ( = ?auto_161734 ?auto_161733 ) ) ( not ( = ?auto_161730 ?auto_161733 ) ) ( not ( = ?auto_161732 ?auto_161733 ) ) ( not ( = ?auto_161731 ?auto_161733 ) ) ( not ( = ?auto_161736 ?auto_161733 ) ) ( HOLDING ?auto_161732 ) ( CLEAR ?auto_161731 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161729 ?auto_161737 ?auto_161735 ?auto_161734 ?auto_161736 ?auto_161731 ?auto_161732 )
      ( MAKE-1PILE ?auto_161729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161738 - BLOCK
    )
    :vars
    (
      ?auto_161740 - BLOCK
      ?auto_161745 - BLOCK
      ?auto_161743 - BLOCK
      ?auto_161742 - BLOCK
      ?auto_161741 - BLOCK
      ?auto_161739 - BLOCK
      ?auto_161746 - BLOCK
      ?auto_161744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161740 ?auto_161738 ) ( ON-TABLE ?auto_161738 ) ( not ( = ?auto_161738 ?auto_161740 ) ) ( not ( = ?auto_161738 ?auto_161745 ) ) ( not ( = ?auto_161738 ?auto_161743 ) ) ( not ( = ?auto_161740 ?auto_161745 ) ) ( not ( = ?auto_161740 ?auto_161743 ) ) ( not ( = ?auto_161745 ?auto_161743 ) ) ( ON ?auto_161745 ?auto_161740 ) ( not ( = ?auto_161742 ?auto_161741 ) ) ( not ( = ?auto_161742 ?auto_161739 ) ) ( not ( = ?auto_161742 ?auto_161746 ) ) ( not ( = ?auto_161742 ?auto_161743 ) ) ( not ( = ?auto_161741 ?auto_161739 ) ) ( not ( = ?auto_161741 ?auto_161746 ) ) ( not ( = ?auto_161741 ?auto_161743 ) ) ( not ( = ?auto_161739 ?auto_161746 ) ) ( not ( = ?auto_161739 ?auto_161743 ) ) ( not ( = ?auto_161746 ?auto_161743 ) ) ( not ( = ?auto_161738 ?auto_161746 ) ) ( not ( = ?auto_161738 ?auto_161742 ) ) ( not ( = ?auto_161738 ?auto_161741 ) ) ( not ( = ?auto_161738 ?auto_161739 ) ) ( not ( = ?auto_161740 ?auto_161746 ) ) ( not ( = ?auto_161740 ?auto_161742 ) ) ( not ( = ?auto_161740 ?auto_161741 ) ) ( not ( = ?auto_161740 ?auto_161739 ) ) ( not ( = ?auto_161745 ?auto_161746 ) ) ( not ( = ?auto_161745 ?auto_161742 ) ) ( not ( = ?auto_161745 ?auto_161741 ) ) ( not ( = ?auto_161745 ?auto_161739 ) ) ( ON ?auto_161743 ?auto_161745 ) ( ON ?auto_161746 ?auto_161743 ) ( ON ?auto_161739 ?auto_161746 ) ( ON ?auto_161742 ?auto_161744 ) ( not ( = ?auto_161738 ?auto_161744 ) ) ( not ( = ?auto_161740 ?auto_161744 ) ) ( not ( = ?auto_161745 ?auto_161744 ) ) ( not ( = ?auto_161743 ?auto_161744 ) ) ( not ( = ?auto_161742 ?auto_161744 ) ) ( not ( = ?auto_161741 ?auto_161744 ) ) ( not ( = ?auto_161739 ?auto_161744 ) ) ( not ( = ?auto_161746 ?auto_161744 ) ) ( CLEAR ?auto_161739 ) ( ON ?auto_161741 ?auto_161742 ) ( CLEAR ?auto_161741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161744 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161744 ?auto_161742 )
      ( MAKE-1PILE ?auto_161738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161747 - BLOCK
    )
    :vars
    (
      ?auto_161748 - BLOCK
      ?auto_161751 - BLOCK
      ?auto_161753 - BLOCK
      ?auto_161755 - BLOCK
      ?auto_161754 - BLOCK
      ?auto_161752 - BLOCK
      ?auto_161750 - BLOCK
      ?auto_161749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161748 ?auto_161747 ) ( ON-TABLE ?auto_161747 ) ( not ( = ?auto_161747 ?auto_161748 ) ) ( not ( = ?auto_161747 ?auto_161751 ) ) ( not ( = ?auto_161747 ?auto_161753 ) ) ( not ( = ?auto_161748 ?auto_161751 ) ) ( not ( = ?auto_161748 ?auto_161753 ) ) ( not ( = ?auto_161751 ?auto_161753 ) ) ( ON ?auto_161751 ?auto_161748 ) ( not ( = ?auto_161755 ?auto_161754 ) ) ( not ( = ?auto_161755 ?auto_161752 ) ) ( not ( = ?auto_161755 ?auto_161750 ) ) ( not ( = ?auto_161755 ?auto_161753 ) ) ( not ( = ?auto_161754 ?auto_161752 ) ) ( not ( = ?auto_161754 ?auto_161750 ) ) ( not ( = ?auto_161754 ?auto_161753 ) ) ( not ( = ?auto_161752 ?auto_161750 ) ) ( not ( = ?auto_161752 ?auto_161753 ) ) ( not ( = ?auto_161750 ?auto_161753 ) ) ( not ( = ?auto_161747 ?auto_161750 ) ) ( not ( = ?auto_161747 ?auto_161755 ) ) ( not ( = ?auto_161747 ?auto_161754 ) ) ( not ( = ?auto_161747 ?auto_161752 ) ) ( not ( = ?auto_161748 ?auto_161750 ) ) ( not ( = ?auto_161748 ?auto_161755 ) ) ( not ( = ?auto_161748 ?auto_161754 ) ) ( not ( = ?auto_161748 ?auto_161752 ) ) ( not ( = ?auto_161751 ?auto_161750 ) ) ( not ( = ?auto_161751 ?auto_161755 ) ) ( not ( = ?auto_161751 ?auto_161754 ) ) ( not ( = ?auto_161751 ?auto_161752 ) ) ( ON ?auto_161753 ?auto_161751 ) ( ON ?auto_161750 ?auto_161753 ) ( ON ?auto_161755 ?auto_161749 ) ( not ( = ?auto_161747 ?auto_161749 ) ) ( not ( = ?auto_161748 ?auto_161749 ) ) ( not ( = ?auto_161751 ?auto_161749 ) ) ( not ( = ?auto_161753 ?auto_161749 ) ) ( not ( = ?auto_161755 ?auto_161749 ) ) ( not ( = ?auto_161754 ?auto_161749 ) ) ( not ( = ?auto_161752 ?auto_161749 ) ) ( not ( = ?auto_161750 ?auto_161749 ) ) ( ON ?auto_161754 ?auto_161755 ) ( CLEAR ?auto_161754 ) ( ON-TABLE ?auto_161749 ) ( HOLDING ?auto_161752 ) ( CLEAR ?auto_161750 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161747 ?auto_161748 ?auto_161751 ?auto_161753 ?auto_161750 ?auto_161752 )
      ( MAKE-1PILE ?auto_161747 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161756 - BLOCK
    )
    :vars
    (
      ?auto_161762 - BLOCK
      ?auto_161759 - BLOCK
      ?auto_161763 - BLOCK
      ?auto_161758 - BLOCK
      ?auto_161760 - BLOCK
      ?auto_161761 - BLOCK
      ?auto_161757 - BLOCK
      ?auto_161764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161762 ?auto_161756 ) ( ON-TABLE ?auto_161756 ) ( not ( = ?auto_161756 ?auto_161762 ) ) ( not ( = ?auto_161756 ?auto_161759 ) ) ( not ( = ?auto_161756 ?auto_161763 ) ) ( not ( = ?auto_161762 ?auto_161759 ) ) ( not ( = ?auto_161762 ?auto_161763 ) ) ( not ( = ?auto_161759 ?auto_161763 ) ) ( ON ?auto_161759 ?auto_161762 ) ( not ( = ?auto_161758 ?auto_161760 ) ) ( not ( = ?auto_161758 ?auto_161761 ) ) ( not ( = ?auto_161758 ?auto_161757 ) ) ( not ( = ?auto_161758 ?auto_161763 ) ) ( not ( = ?auto_161760 ?auto_161761 ) ) ( not ( = ?auto_161760 ?auto_161757 ) ) ( not ( = ?auto_161760 ?auto_161763 ) ) ( not ( = ?auto_161761 ?auto_161757 ) ) ( not ( = ?auto_161761 ?auto_161763 ) ) ( not ( = ?auto_161757 ?auto_161763 ) ) ( not ( = ?auto_161756 ?auto_161757 ) ) ( not ( = ?auto_161756 ?auto_161758 ) ) ( not ( = ?auto_161756 ?auto_161760 ) ) ( not ( = ?auto_161756 ?auto_161761 ) ) ( not ( = ?auto_161762 ?auto_161757 ) ) ( not ( = ?auto_161762 ?auto_161758 ) ) ( not ( = ?auto_161762 ?auto_161760 ) ) ( not ( = ?auto_161762 ?auto_161761 ) ) ( not ( = ?auto_161759 ?auto_161757 ) ) ( not ( = ?auto_161759 ?auto_161758 ) ) ( not ( = ?auto_161759 ?auto_161760 ) ) ( not ( = ?auto_161759 ?auto_161761 ) ) ( ON ?auto_161763 ?auto_161759 ) ( ON ?auto_161757 ?auto_161763 ) ( ON ?auto_161758 ?auto_161764 ) ( not ( = ?auto_161756 ?auto_161764 ) ) ( not ( = ?auto_161762 ?auto_161764 ) ) ( not ( = ?auto_161759 ?auto_161764 ) ) ( not ( = ?auto_161763 ?auto_161764 ) ) ( not ( = ?auto_161758 ?auto_161764 ) ) ( not ( = ?auto_161760 ?auto_161764 ) ) ( not ( = ?auto_161761 ?auto_161764 ) ) ( not ( = ?auto_161757 ?auto_161764 ) ) ( ON ?auto_161760 ?auto_161758 ) ( ON-TABLE ?auto_161764 ) ( CLEAR ?auto_161757 ) ( ON ?auto_161761 ?auto_161760 ) ( CLEAR ?auto_161761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161764 ?auto_161758 ?auto_161760 )
      ( MAKE-1PILE ?auto_161756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161765 - BLOCK
    )
    :vars
    (
      ?auto_161768 - BLOCK
      ?auto_161769 - BLOCK
      ?auto_161767 - BLOCK
      ?auto_161770 - BLOCK
      ?auto_161773 - BLOCK
      ?auto_161771 - BLOCK
      ?auto_161766 - BLOCK
      ?auto_161772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161768 ?auto_161765 ) ( ON-TABLE ?auto_161765 ) ( not ( = ?auto_161765 ?auto_161768 ) ) ( not ( = ?auto_161765 ?auto_161769 ) ) ( not ( = ?auto_161765 ?auto_161767 ) ) ( not ( = ?auto_161768 ?auto_161769 ) ) ( not ( = ?auto_161768 ?auto_161767 ) ) ( not ( = ?auto_161769 ?auto_161767 ) ) ( ON ?auto_161769 ?auto_161768 ) ( not ( = ?auto_161770 ?auto_161773 ) ) ( not ( = ?auto_161770 ?auto_161771 ) ) ( not ( = ?auto_161770 ?auto_161766 ) ) ( not ( = ?auto_161770 ?auto_161767 ) ) ( not ( = ?auto_161773 ?auto_161771 ) ) ( not ( = ?auto_161773 ?auto_161766 ) ) ( not ( = ?auto_161773 ?auto_161767 ) ) ( not ( = ?auto_161771 ?auto_161766 ) ) ( not ( = ?auto_161771 ?auto_161767 ) ) ( not ( = ?auto_161766 ?auto_161767 ) ) ( not ( = ?auto_161765 ?auto_161766 ) ) ( not ( = ?auto_161765 ?auto_161770 ) ) ( not ( = ?auto_161765 ?auto_161773 ) ) ( not ( = ?auto_161765 ?auto_161771 ) ) ( not ( = ?auto_161768 ?auto_161766 ) ) ( not ( = ?auto_161768 ?auto_161770 ) ) ( not ( = ?auto_161768 ?auto_161773 ) ) ( not ( = ?auto_161768 ?auto_161771 ) ) ( not ( = ?auto_161769 ?auto_161766 ) ) ( not ( = ?auto_161769 ?auto_161770 ) ) ( not ( = ?auto_161769 ?auto_161773 ) ) ( not ( = ?auto_161769 ?auto_161771 ) ) ( ON ?auto_161767 ?auto_161769 ) ( ON ?auto_161770 ?auto_161772 ) ( not ( = ?auto_161765 ?auto_161772 ) ) ( not ( = ?auto_161768 ?auto_161772 ) ) ( not ( = ?auto_161769 ?auto_161772 ) ) ( not ( = ?auto_161767 ?auto_161772 ) ) ( not ( = ?auto_161770 ?auto_161772 ) ) ( not ( = ?auto_161773 ?auto_161772 ) ) ( not ( = ?auto_161771 ?auto_161772 ) ) ( not ( = ?auto_161766 ?auto_161772 ) ) ( ON ?auto_161773 ?auto_161770 ) ( ON-TABLE ?auto_161772 ) ( ON ?auto_161771 ?auto_161773 ) ( CLEAR ?auto_161771 ) ( HOLDING ?auto_161766 ) ( CLEAR ?auto_161767 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161765 ?auto_161768 ?auto_161769 ?auto_161767 ?auto_161766 )
      ( MAKE-1PILE ?auto_161765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161774 - BLOCK
    )
    :vars
    (
      ?auto_161775 - BLOCK
      ?auto_161777 - BLOCK
      ?auto_161782 - BLOCK
      ?auto_161780 - BLOCK
      ?auto_161776 - BLOCK
      ?auto_161778 - BLOCK
      ?auto_161779 - BLOCK
      ?auto_161781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161775 ?auto_161774 ) ( ON-TABLE ?auto_161774 ) ( not ( = ?auto_161774 ?auto_161775 ) ) ( not ( = ?auto_161774 ?auto_161777 ) ) ( not ( = ?auto_161774 ?auto_161782 ) ) ( not ( = ?auto_161775 ?auto_161777 ) ) ( not ( = ?auto_161775 ?auto_161782 ) ) ( not ( = ?auto_161777 ?auto_161782 ) ) ( ON ?auto_161777 ?auto_161775 ) ( not ( = ?auto_161780 ?auto_161776 ) ) ( not ( = ?auto_161780 ?auto_161778 ) ) ( not ( = ?auto_161780 ?auto_161779 ) ) ( not ( = ?auto_161780 ?auto_161782 ) ) ( not ( = ?auto_161776 ?auto_161778 ) ) ( not ( = ?auto_161776 ?auto_161779 ) ) ( not ( = ?auto_161776 ?auto_161782 ) ) ( not ( = ?auto_161778 ?auto_161779 ) ) ( not ( = ?auto_161778 ?auto_161782 ) ) ( not ( = ?auto_161779 ?auto_161782 ) ) ( not ( = ?auto_161774 ?auto_161779 ) ) ( not ( = ?auto_161774 ?auto_161780 ) ) ( not ( = ?auto_161774 ?auto_161776 ) ) ( not ( = ?auto_161774 ?auto_161778 ) ) ( not ( = ?auto_161775 ?auto_161779 ) ) ( not ( = ?auto_161775 ?auto_161780 ) ) ( not ( = ?auto_161775 ?auto_161776 ) ) ( not ( = ?auto_161775 ?auto_161778 ) ) ( not ( = ?auto_161777 ?auto_161779 ) ) ( not ( = ?auto_161777 ?auto_161780 ) ) ( not ( = ?auto_161777 ?auto_161776 ) ) ( not ( = ?auto_161777 ?auto_161778 ) ) ( ON ?auto_161782 ?auto_161777 ) ( ON ?auto_161780 ?auto_161781 ) ( not ( = ?auto_161774 ?auto_161781 ) ) ( not ( = ?auto_161775 ?auto_161781 ) ) ( not ( = ?auto_161777 ?auto_161781 ) ) ( not ( = ?auto_161782 ?auto_161781 ) ) ( not ( = ?auto_161780 ?auto_161781 ) ) ( not ( = ?auto_161776 ?auto_161781 ) ) ( not ( = ?auto_161778 ?auto_161781 ) ) ( not ( = ?auto_161779 ?auto_161781 ) ) ( ON ?auto_161776 ?auto_161780 ) ( ON-TABLE ?auto_161781 ) ( ON ?auto_161778 ?auto_161776 ) ( CLEAR ?auto_161782 ) ( ON ?auto_161779 ?auto_161778 ) ( CLEAR ?auto_161779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161781 ?auto_161780 ?auto_161776 ?auto_161778 )
      ( MAKE-1PILE ?auto_161774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161783 - BLOCK
    )
    :vars
    (
      ?auto_161790 - BLOCK
      ?auto_161789 - BLOCK
      ?auto_161784 - BLOCK
      ?auto_161791 - BLOCK
      ?auto_161787 - BLOCK
      ?auto_161785 - BLOCK
      ?auto_161786 - BLOCK
      ?auto_161788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161790 ?auto_161783 ) ( ON-TABLE ?auto_161783 ) ( not ( = ?auto_161783 ?auto_161790 ) ) ( not ( = ?auto_161783 ?auto_161789 ) ) ( not ( = ?auto_161783 ?auto_161784 ) ) ( not ( = ?auto_161790 ?auto_161789 ) ) ( not ( = ?auto_161790 ?auto_161784 ) ) ( not ( = ?auto_161789 ?auto_161784 ) ) ( ON ?auto_161789 ?auto_161790 ) ( not ( = ?auto_161791 ?auto_161787 ) ) ( not ( = ?auto_161791 ?auto_161785 ) ) ( not ( = ?auto_161791 ?auto_161786 ) ) ( not ( = ?auto_161791 ?auto_161784 ) ) ( not ( = ?auto_161787 ?auto_161785 ) ) ( not ( = ?auto_161787 ?auto_161786 ) ) ( not ( = ?auto_161787 ?auto_161784 ) ) ( not ( = ?auto_161785 ?auto_161786 ) ) ( not ( = ?auto_161785 ?auto_161784 ) ) ( not ( = ?auto_161786 ?auto_161784 ) ) ( not ( = ?auto_161783 ?auto_161786 ) ) ( not ( = ?auto_161783 ?auto_161791 ) ) ( not ( = ?auto_161783 ?auto_161787 ) ) ( not ( = ?auto_161783 ?auto_161785 ) ) ( not ( = ?auto_161790 ?auto_161786 ) ) ( not ( = ?auto_161790 ?auto_161791 ) ) ( not ( = ?auto_161790 ?auto_161787 ) ) ( not ( = ?auto_161790 ?auto_161785 ) ) ( not ( = ?auto_161789 ?auto_161786 ) ) ( not ( = ?auto_161789 ?auto_161791 ) ) ( not ( = ?auto_161789 ?auto_161787 ) ) ( not ( = ?auto_161789 ?auto_161785 ) ) ( ON ?auto_161791 ?auto_161788 ) ( not ( = ?auto_161783 ?auto_161788 ) ) ( not ( = ?auto_161790 ?auto_161788 ) ) ( not ( = ?auto_161789 ?auto_161788 ) ) ( not ( = ?auto_161784 ?auto_161788 ) ) ( not ( = ?auto_161791 ?auto_161788 ) ) ( not ( = ?auto_161787 ?auto_161788 ) ) ( not ( = ?auto_161785 ?auto_161788 ) ) ( not ( = ?auto_161786 ?auto_161788 ) ) ( ON ?auto_161787 ?auto_161791 ) ( ON-TABLE ?auto_161788 ) ( ON ?auto_161785 ?auto_161787 ) ( ON ?auto_161786 ?auto_161785 ) ( CLEAR ?auto_161786 ) ( HOLDING ?auto_161784 ) ( CLEAR ?auto_161789 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161783 ?auto_161790 ?auto_161789 ?auto_161784 )
      ( MAKE-1PILE ?auto_161783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161792 - BLOCK
    )
    :vars
    (
      ?auto_161798 - BLOCK
      ?auto_161797 - BLOCK
      ?auto_161793 - BLOCK
      ?auto_161800 - BLOCK
      ?auto_161795 - BLOCK
      ?auto_161794 - BLOCK
      ?auto_161796 - BLOCK
      ?auto_161799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161798 ?auto_161792 ) ( ON-TABLE ?auto_161792 ) ( not ( = ?auto_161792 ?auto_161798 ) ) ( not ( = ?auto_161792 ?auto_161797 ) ) ( not ( = ?auto_161792 ?auto_161793 ) ) ( not ( = ?auto_161798 ?auto_161797 ) ) ( not ( = ?auto_161798 ?auto_161793 ) ) ( not ( = ?auto_161797 ?auto_161793 ) ) ( ON ?auto_161797 ?auto_161798 ) ( not ( = ?auto_161800 ?auto_161795 ) ) ( not ( = ?auto_161800 ?auto_161794 ) ) ( not ( = ?auto_161800 ?auto_161796 ) ) ( not ( = ?auto_161800 ?auto_161793 ) ) ( not ( = ?auto_161795 ?auto_161794 ) ) ( not ( = ?auto_161795 ?auto_161796 ) ) ( not ( = ?auto_161795 ?auto_161793 ) ) ( not ( = ?auto_161794 ?auto_161796 ) ) ( not ( = ?auto_161794 ?auto_161793 ) ) ( not ( = ?auto_161796 ?auto_161793 ) ) ( not ( = ?auto_161792 ?auto_161796 ) ) ( not ( = ?auto_161792 ?auto_161800 ) ) ( not ( = ?auto_161792 ?auto_161795 ) ) ( not ( = ?auto_161792 ?auto_161794 ) ) ( not ( = ?auto_161798 ?auto_161796 ) ) ( not ( = ?auto_161798 ?auto_161800 ) ) ( not ( = ?auto_161798 ?auto_161795 ) ) ( not ( = ?auto_161798 ?auto_161794 ) ) ( not ( = ?auto_161797 ?auto_161796 ) ) ( not ( = ?auto_161797 ?auto_161800 ) ) ( not ( = ?auto_161797 ?auto_161795 ) ) ( not ( = ?auto_161797 ?auto_161794 ) ) ( ON ?auto_161800 ?auto_161799 ) ( not ( = ?auto_161792 ?auto_161799 ) ) ( not ( = ?auto_161798 ?auto_161799 ) ) ( not ( = ?auto_161797 ?auto_161799 ) ) ( not ( = ?auto_161793 ?auto_161799 ) ) ( not ( = ?auto_161800 ?auto_161799 ) ) ( not ( = ?auto_161795 ?auto_161799 ) ) ( not ( = ?auto_161794 ?auto_161799 ) ) ( not ( = ?auto_161796 ?auto_161799 ) ) ( ON ?auto_161795 ?auto_161800 ) ( ON-TABLE ?auto_161799 ) ( ON ?auto_161794 ?auto_161795 ) ( ON ?auto_161796 ?auto_161794 ) ( CLEAR ?auto_161797 ) ( ON ?auto_161793 ?auto_161796 ) ( CLEAR ?auto_161793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161799 ?auto_161800 ?auto_161795 ?auto_161794 ?auto_161796 )
      ( MAKE-1PILE ?auto_161792 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161801 - BLOCK
    )
    :vars
    (
      ?auto_161802 - BLOCK
      ?auto_161809 - BLOCK
      ?auto_161804 - BLOCK
      ?auto_161803 - BLOCK
      ?auto_161806 - BLOCK
      ?auto_161808 - BLOCK
      ?auto_161805 - BLOCK
      ?auto_161807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161802 ?auto_161801 ) ( ON-TABLE ?auto_161801 ) ( not ( = ?auto_161801 ?auto_161802 ) ) ( not ( = ?auto_161801 ?auto_161809 ) ) ( not ( = ?auto_161801 ?auto_161804 ) ) ( not ( = ?auto_161802 ?auto_161809 ) ) ( not ( = ?auto_161802 ?auto_161804 ) ) ( not ( = ?auto_161809 ?auto_161804 ) ) ( not ( = ?auto_161803 ?auto_161806 ) ) ( not ( = ?auto_161803 ?auto_161808 ) ) ( not ( = ?auto_161803 ?auto_161805 ) ) ( not ( = ?auto_161803 ?auto_161804 ) ) ( not ( = ?auto_161806 ?auto_161808 ) ) ( not ( = ?auto_161806 ?auto_161805 ) ) ( not ( = ?auto_161806 ?auto_161804 ) ) ( not ( = ?auto_161808 ?auto_161805 ) ) ( not ( = ?auto_161808 ?auto_161804 ) ) ( not ( = ?auto_161805 ?auto_161804 ) ) ( not ( = ?auto_161801 ?auto_161805 ) ) ( not ( = ?auto_161801 ?auto_161803 ) ) ( not ( = ?auto_161801 ?auto_161806 ) ) ( not ( = ?auto_161801 ?auto_161808 ) ) ( not ( = ?auto_161802 ?auto_161805 ) ) ( not ( = ?auto_161802 ?auto_161803 ) ) ( not ( = ?auto_161802 ?auto_161806 ) ) ( not ( = ?auto_161802 ?auto_161808 ) ) ( not ( = ?auto_161809 ?auto_161805 ) ) ( not ( = ?auto_161809 ?auto_161803 ) ) ( not ( = ?auto_161809 ?auto_161806 ) ) ( not ( = ?auto_161809 ?auto_161808 ) ) ( ON ?auto_161803 ?auto_161807 ) ( not ( = ?auto_161801 ?auto_161807 ) ) ( not ( = ?auto_161802 ?auto_161807 ) ) ( not ( = ?auto_161809 ?auto_161807 ) ) ( not ( = ?auto_161804 ?auto_161807 ) ) ( not ( = ?auto_161803 ?auto_161807 ) ) ( not ( = ?auto_161806 ?auto_161807 ) ) ( not ( = ?auto_161808 ?auto_161807 ) ) ( not ( = ?auto_161805 ?auto_161807 ) ) ( ON ?auto_161806 ?auto_161803 ) ( ON-TABLE ?auto_161807 ) ( ON ?auto_161808 ?auto_161806 ) ( ON ?auto_161805 ?auto_161808 ) ( ON ?auto_161804 ?auto_161805 ) ( CLEAR ?auto_161804 ) ( HOLDING ?auto_161809 ) ( CLEAR ?auto_161802 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161801 ?auto_161802 ?auto_161809 )
      ( MAKE-1PILE ?auto_161801 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161810 - BLOCK
    )
    :vars
    (
      ?auto_161818 - BLOCK
      ?auto_161817 - BLOCK
      ?auto_161812 - BLOCK
      ?auto_161814 - BLOCK
      ?auto_161816 - BLOCK
      ?auto_161813 - BLOCK
      ?auto_161815 - BLOCK
      ?auto_161811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161818 ?auto_161810 ) ( ON-TABLE ?auto_161810 ) ( not ( = ?auto_161810 ?auto_161818 ) ) ( not ( = ?auto_161810 ?auto_161817 ) ) ( not ( = ?auto_161810 ?auto_161812 ) ) ( not ( = ?auto_161818 ?auto_161817 ) ) ( not ( = ?auto_161818 ?auto_161812 ) ) ( not ( = ?auto_161817 ?auto_161812 ) ) ( not ( = ?auto_161814 ?auto_161816 ) ) ( not ( = ?auto_161814 ?auto_161813 ) ) ( not ( = ?auto_161814 ?auto_161815 ) ) ( not ( = ?auto_161814 ?auto_161812 ) ) ( not ( = ?auto_161816 ?auto_161813 ) ) ( not ( = ?auto_161816 ?auto_161815 ) ) ( not ( = ?auto_161816 ?auto_161812 ) ) ( not ( = ?auto_161813 ?auto_161815 ) ) ( not ( = ?auto_161813 ?auto_161812 ) ) ( not ( = ?auto_161815 ?auto_161812 ) ) ( not ( = ?auto_161810 ?auto_161815 ) ) ( not ( = ?auto_161810 ?auto_161814 ) ) ( not ( = ?auto_161810 ?auto_161816 ) ) ( not ( = ?auto_161810 ?auto_161813 ) ) ( not ( = ?auto_161818 ?auto_161815 ) ) ( not ( = ?auto_161818 ?auto_161814 ) ) ( not ( = ?auto_161818 ?auto_161816 ) ) ( not ( = ?auto_161818 ?auto_161813 ) ) ( not ( = ?auto_161817 ?auto_161815 ) ) ( not ( = ?auto_161817 ?auto_161814 ) ) ( not ( = ?auto_161817 ?auto_161816 ) ) ( not ( = ?auto_161817 ?auto_161813 ) ) ( ON ?auto_161814 ?auto_161811 ) ( not ( = ?auto_161810 ?auto_161811 ) ) ( not ( = ?auto_161818 ?auto_161811 ) ) ( not ( = ?auto_161817 ?auto_161811 ) ) ( not ( = ?auto_161812 ?auto_161811 ) ) ( not ( = ?auto_161814 ?auto_161811 ) ) ( not ( = ?auto_161816 ?auto_161811 ) ) ( not ( = ?auto_161813 ?auto_161811 ) ) ( not ( = ?auto_161815 ?auto_161811 ) ) ( ON ?auto_161816 ?auto_161814 ) ( ON-TABLE ?auto_161811 ) ( ON ?auto_161813 ?auto_161816 ) ( ON ?auto_161815 ?auto_161813 ) ( ON ?auto_161812 ?auto_161815 ) ( CLEAR ?auto_161818 ) ( ON ?auto_161817 ?auto_161812 ) ( CLEAR ?auto_161817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161811 ?auto_161814 ?auto_161816 ?auto_161813 ?auto_161815 ?auto_161812 )
      ( MAKE-1PILE ?auto_161810 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161837 - BLOCK
    )
    :vars
    (
      ?auto_161843 - BLOCK
      ?auto_161839 - BLOCK
      ?auto_161844 - BLOCK
      ?auto_161838 - BLOCK
      ?auto_161842 - BLOCK
      ?auto_161841 - BLOCK
      ?auto_161840 - BLOCK
      ?auto_161845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161837 ?auto_161843 ) ) ( not ( = ?auto_161837 ?auto_161839 ) ) ( not ( = ?auto_161837 ?auto_161844 ) ) ( not ( = ?auto_161843 ?auto_161839 ) ) ( not ( = ?auto_161843 ?auto_161844 ) ) ( not ( = ?auto_161839 ?auto_161844 ) ) ( not ( = ?auto_161838 ?auto_161842 ) ) ( not ( = ?auto_161838 ?auto_161841 ) ) ( not ( = ?auto_161838 ?auto_161840 ) ) ( not ( = ?auto_161838 ?auto_161844 ) ) ( not ( = ?auto_161842 ?auto_161841 ) ) ( not ( = ?auto_161842 ?auto_161840 ) ) ( not ( = ?auto_161842 ?auto_161844 ) ) ( not ( = ?auto_161841 ?auto_161840 ) ) ( not ( = ?auto_161841 ?auto_161844 ) ) ( not ( = ?auto_161840 ?auto_161844 ) ) ( not ( = ?auto_161837 ?auto_161840 ) ) ( not ( = ?auto_161837 ?auto_161838 ) ) ( not ( = ?auto_161837 ?auto_161842 ) ) ( not ( = ?auto_161837 ?auto_161841 ) ) ( not ( = ?auto_161843 ?auto_161840 ) ) ( not ( = ?auto_161843 ?auto_161838 ) ) ( not ( = ?auto_161843 ?auto_161842 ) ) ( not ( = ?auto_161843 ?auto_161841 ) ) ( not ( = ?auto_161839 ?auto_161840 ) ) ( not ( = ?auto_161839 ?auto_161838 ) ) ( not ( = ?auto_161839 ?auto_161842 ) ) ( not ( = ?auto_161839 ?auto_161841 ) ) ( ON ?auto_161838 ?auto_161845 ) ( not ( = ?auto_161837 ?auto_161845 ) ) ( not ( = ?auto_161843 ?auto_161845 ) ) ( not ( = ?auto_161839 ?auto_161845 ) ) ( not ( = ?auto_161844 ?auto_161845 ) ) ( not ( = ?auto_161838 ?auto_161845 ) ) ( not ( = ?auto_161842 ?auto_161845 ) ) ( not ( = ?auto_161841 ?auto_161845 ) ) ( not ( = ?auto_161840 ?auto_161845 ) ) ( ON ?auto_161842 ?auto_161838 ) ( ON-TABLE ?auto_161845 ) ( ON ?auto_161841 ?auto_161842 ) ( ON ?auto_161840 ?auto_161841 ) ( ON ?auto_161844 ?auto_161840 ) ( ON ?auto_161839 ?auto_161844 ) ( ON ?auto_161843 ?auto_161839 ) ( CLEAR ?auto_161843 ) ( HOLDING ?auto_161837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161837 ?auto_161843 )
      ( MAKE-1PILE ?auto_161837 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161846 - BLOCK
    )
    :vars
    (
      ?auto_161850 - BLOCK
      ?auto_161852 - BLOCK
      ?auto_161847 - BLOCK
      ?auto_161853 - BLOCK
      ?auto_161851 - BLOCK
      ?auto_161849 - BLOCK
      ?auto_161848 - BLOCK
      ?auto_161854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161846 ?auto_161850 ) ) ( not ( = ?auto_161846 ?auto_161852 ) ) ( not ( = ?auto_161846 ?auto_161847 ) ) ( not ( = ?auto_161850 ?auto_161852 ) ) ( not ( = ?auto_161850 ?auto_161847 ) ) ( not ( = ?auto_161852 ?auto_161847 ) ) ( not ( = ?auto_161853 ?auto_161851 ) ) ( not ( = ?auto_161853 ?auto_161849 ) ) ( not ( = ?auto_161853 ?auto_161848 ) ) ( not ( = ?auto_161853 ?auto_161847 ) ) ( not ( = ?auto_161851 ?auto_161849 ) ) ( not ( = ?auto_161851 ?auto_161848 ) ) ( not ( = ?auto_161851 ?auto_161847 ) ) ( not ( = ?auto_161849 ?auto_161848 ) ) ( not ( = ?auto_161849 ?auto_161847 ) ) ( not ( = ?auto_161848 ?auto_161847 ) ) ( not ( = ?auto_161846 ?auto_161848 ) ) ( not ( = ?auto_161846 ?auto_161853 ) ) ( not ( = ?auto_161846 ?auto_161851 ) ) ( not ( = ?auto_161846 ?auto_161849 ) ) ( not ( = ?auto_161850 ?auto_161848 ) ) ( not ( = ?auto_161850 ?auto_161853 ) ) ( not ( = ?auto_161850 ?auto_161851 ) ) ( not ( = ?auto_161850 ?auto_161849 ) ) ( not ( = ?auto_161852 ?auto_161848 ) ) ( not ( = ?auto_161852 ?auto_161853 ) ) ( not ( = ?auto_161852 ?auto_161851 ) ) ( not ( = ?auto_161852 ?auto_161849 ) ) ( ON ?auto_161853 ?auto_161854 ) ( not ( = ?auto_161846 ?auto_161854 ) ) ( not ( = ?auto_161850 ?auto_161854 ) ) ( not ( = ?auto_161852 ?auto_161854 ) ) ( not ( = ?auto_161847 ?auto_161854 ) ) ( not ( = ?auto_161853 ?auto_161854 ) ) ( not ( = ?auto_161851 ?auto_161854 ) ) ( not ( = ?auto_161849 ?auto_161854 ) ) ( not ( = ?auto_161848 ?auto_161854 ) ) ( ON ?auto_161851 ?auto_161853 ) ( ON-TABLE ?auto_161854 ) ( ON ?auto_161849 ?auto_161851 ) ( ON ?auto_161848 ?auto_161849 ) ( ON ?auto_161847 ?auto_161848 ) ( ON ?auto_161852 ?auto_161847 ) ( ON ?auto_161850 ?auto_161852 ) ( ON ?auto_161846 ?auto_161850 ) ( CLEAR ?auto_161846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161854 ?auto_161853 ?auto_161851 ?auto_161849 ?auto_161848 ?auto_161847 ?auto_161852 ?auto_161850 )
      ( MAKE-1PILE ?auto_161846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161862 - BLOCK
      ?auto_161863 - BLOCK
      ?auto_161864 - BLOCK
      ?auto_161865 - BLOCK
      ?auto_161866 - BLOCK
      ?auto_161867 - BLOCK
      ?auto_161868 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_161868 ) ( CLEAR ?auto_161867 ) ( ON-TABLE ?auto_161862 ) ( ON ?auto_161863 ?auto_161862 ) ( ON ?auto_161864 ?auto_161863 ) ( ON ?auto_161865 ?auto_161864 ) ( ON ?auto_161866 ?auto_161865 ) ( ON ?auto_161867 ?auto_161866 ) ( not ( = ?auto_161862 ?auto_161863 ) ) ( not ( = ?auto_161862 ?auto_161864 ) ) ( not ( = ?auto_161862 ?auto_161865 ) ) ( not ( = ?auto_161862 ?auto_161866 ) ) ( not ( = ?auto_161862 ?auto_161867 ) ) ( not ( = ?auto_161862 ?auto_161868 ) ) ( not ( = ?auto_161863 ?auto_161864 ) ) ( not ( = ?auto_161863 ?auto_161865 ) ) ( not ( = ?auto_161863 ?auto_161866 ) ) ( not ( = ?auto_161863 ?auto_161867 ) ) ( not ( = ?auto_161863 ?auto_161868 ) ) ( not ( = ?auto_161864 ?auto_161865 ) ) ( not ( = ?auto_161864 ?auto_161866 ) ) ( not ( = ?auto_161864 ?auto_161867 ) ) ( not ( = ?auto_161864 ?auto_161868 ) ) ( not ( = ?auto_161865 ?auto_161866 ) ) ( not ( = ?auto_161865 ?auto_161867 ) ) ( not ( = ?auto_161865 ?auto_161868 ) ) ( not ( = ?auto_161866 ?auto_161867 ) ) ( not ( = ?auto_161866 ?auto_161868 ) ) ( not ( = ?auto_161867 ?auto_161868 ) ) )
    :subtasks
    ( ( !STACK ?auto_161868 ?auto_161867 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161869 - BLOCK
      ?auto_161870 - BLOCK
      ?auto_161871 - BLOCK
      ?auto_161872 - BLOCK
      ?auto_161873 - BLOCK
      ?auto_161874 - BLOCK
      ?auto_161875 - BLOCK
    )
    :vars
    (
      ?auto_161876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161874 ) ( ON-TABLE ?auto_161869 ) ( ON ?auto_161870 ?auto_161869 ) ( ON ?auto_161871 ?auto_161870 ) ( ON ?auto_161872 ?auto_161871 ) ( ON ?auto_161873 ?auto_161872 ) ( ON ?auto_161874 ?auto_161873 ) ( not ( = ?auto_161869 ?auto_161870 ) ) ( not ( = ?auto_161869 ?auto_161871 ) ) ( not ( = ?auto_161869 ?auto_161872 ) ) ( not ( = ?auto_161869 ?auto_161873 ) ) ( not ( = ?auto_161869 ?auto_161874 ) ) ( not ( = ?auto_161869 ?auto_161875 ) ) ( not ( = ?auto_161870 ?auto_161871 ) ) ( not ( = ?auto_161870 ?auto_161872 ) ) ( not ( = ?auto_161870 ?auto_161873 ) ) ( not ( = ?auto_161870 ?auto_161874 ) ) ( not ( = ?auto_161870 ?auto_161875 ) ) ( not ( = ?auto_161871 ?auto_161872 ) ) ( not ( = ?auto_161871 ?auto_161873 ) ) ( not ( = ?auto_161871 ?auto_161874 ) ) ( not ( = ?auto_161871 ?auto_161875 ) ) ( not ( = ?auto_161872 ?auto_161873 ) ) ( not ( = ?auto_161872 ?auto_161874 ) ) ( not ( = ?auto_161872 ?auto_161875 ) ) ( not ( = ?auto_161873 ?auto_161874 ) ) ( not ( = ?auto_161873 ?auto_161875 ) ) ( not ( = ?auto_161874 ?auto_161875 ) ) ( ON ?auto_161875 ?auto_161876 ) ( CLEAR ?auto_161875 ) ( HAND-EMPTY ) ( not ( = ?auto_161869 ?auto_161876 ) ) ( not ( = ?auto_161870 ?auto_161876 ) ) ( not ( = ?auto_161871 ?auto_161876 ) ) ( not ( = ?auto_161872 ?auto_161876 ) ) ( not ( = ?auto_161873 ?auto_161876 ) ) ( not ( = ?auto_161874 ?auto_161876 ) ) ( not ( = ?auto_161875 ?auto_161876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161875 ?auto_161876 )
      ( MAKE-7PILE ?auto_161869 ?auto_161870 ?auto_161871 ?auto_161872 ?auto_161873 ?auto_161874 ?auto_161875 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161877 - BLOCK
      ?auto_161878 - BLOCK
      ?auto_161879 - BLOCK
      ?auto_161880 - BLOCK
      ?auto_161881 - BLOCK
      ?auto_161882 - BLOCK
      ?auto_161883 - BLOCK
    )
    :vars
    (
      ?auto_161884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161877 ) ( ON ?auto_161878 ?auto_161877 ) ( ON ?auto_161879 ?auto_161878 ) ( ON ?auto_161880 ?auto_161879 ) ( ON ?auto_161881 ?auto_161880 ) ( not ( = ?auto_161877 ?auto_161878 ) ) ( not ( = ?auto_161877 ?auto_161879 ) ) ( not ( = ?auto_161877 ?auto_161880 ) ) ( not ( = ?auto_161877 ?auto_161881 ) ) ( not ( = ?auto_161877 ?auto_161882 ) ) ( not ( = ?auto_161877 ?auto_161883 ) ) ( not ( = ?auto_161878 ?auto_161879 ) ) ( not ( = ?auto_161878 ?auto_161880 ) ) ( not ( = ?auto_161878 ?auto_161881 ) ) ( not ( = ?auto_161878 ?auto_161882 ) ) ( not ( = ?auto_161878 ?auto_161883 ) ) ( not ( = ?auto_161879 ?auto_161880 ) ) ( not ( = ?auto_161879 ?auto_161881 ) ) ( not ( = ?auto_161879 ?auto_161882 ) ) ( not ( = ?auto_161879 ?auto_161883 ) ) ( not ( = ?auto_161880 ?auto_161881 ) ) ( not ( = ?auto_161880 ?auto_161882 ) ) ( not ( = ?auto_161880 ?auto_161883 ) ) ( not ( = ?auto_161881 ?auto_161882 ) ) ( not ( = ?auto_161881 ?auto_161883 ) ) ( not ( = ?auto_161882 ?auto_161883 ) ) ( ON ?auto_161883 ?auto_161884 ) ( CLEAR ?auto_161883 ) ( not ( = ?auto_161877 ?auto_161884 ) ) ( not ( = ?auto_161878 ?auto_161884 ) ) ( not ( = ?auto_161879 ?auto_161884 ) ) ( not ( = ?auto_161880 ?auto_161884 ) ) ( not ( = ?auto_161881 ?auto_161884 ) ) ( not ( = ?auto_161882 ?auto_161884 ) ) ( not ( = ?auto_161883 ?auto_161884 ) ) ( HOLDING ?auto_161882 ) ( CLEAR ?auto_161881 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161877 ?auto_161878 ?auto_161879 ?auto_161880 ?auto_161881 ?auto_161882 )
      ( MAKE-7PILE ?auto_161877 ?auto_161878 ?auto_161879 ?auto_161880 ?auto_161881 ?auto_161882 ?auto_161883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161885 - BLOCK
      ?auto_161886 - BLOCK
      ?auto_161887 - BLOCK
      ?auto_161888 - BLOCK
      ?auto_161889 - BLOCK
      ?auto_161890 - BLOCK
      ?auto_161891 - BLOCK
    )
    :vars
    (
      ?auto_161892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161885 ) ( ON ?auto_161886 ?auto_161885 ) ( ON ?auto_161887 ?auto_161886 ) ( ON ?auto_161888 ?auto_161887 ) ( ON ?auto_161889 ?auto_161888 ) ( not ( = ?auto_161885 ?auto_161886 ) ) ( not ( = ?auto_161885 ?auto_161887 ) ) ( not ( = ?auto_161885 ?auto_161888 ) ) ( not ( = ?auto_161885 ?auto_161889 ) ) ( not ( = ?auto_161885 ?auto_161890 ) ) ( not ( = ?auto_161885 ?auto_161891 ) ) ( not ( = ?auto_161886 ?auto_161887 ) ) ( not ( = ?auto_161886 ?auto_161888 ) ) ( not ( = ?auto_161886 ?auto_161889 ) ) ( not ( = ?auto_161886 ?auto_161890 ) ) ( not ( = ?auto_161886 ?auto_161891 ) ) ( not ( = ?auto_161887 ?auto_161888 ) ) ( not ( = ?auto_161887 ?auto_161889 ) ) ( not ( = ?auto_161887 ?auto_161890 ) ) ( not ( = ?auto_161887 ?auto_161891 ) ) ( not ( = ?auto_161888 ?auto_161889 ) ) ( not ( = ?auto_161888 ?auto_161890 ) ) ( not ( = ?auto_161888 ?auto_161891 ) ) ( not ( = ?auto_161889 ?auto_161890 ) ) ( not ( = ?auto_161889 ?auto_161891 ) ) ( not ( = ?auto_161890 ?auto_161891 ) ) ( ON ?auto_161891 ?auto_161892 ) ( not ( = ?auto_161885 ?auto_161892 ) ) ( not ( = ?auto_161886 ?auto_161892 ) ) ( not ( = ?auto_161887 ?auto_161892 ) ) ( not ( = ?auto_161888 ?auto_161892 ) ) ( not ( = ?auto_161889 ?auto_161892 ) ) ( not ( = ?auto_161890 ?auto_161892 ) ) ( not ( = ?auto_161891 ?auto_161892 ) ) ( CLEAR ?auto_161889 ) ( ON ?auto_161890 ?auto_161891 ) ( CLEAR ?auto_161890 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161892 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161892 ?auto_161891 )
      ( MAKE-7PILE ?auto_161885 ?auto_161886 ?auto_161887 ?auto_161888 ?auto_161889 ?auto_161890 ?auto_161891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161893 - BLOCK
      ?auto_161894 - BLOCK
      ?auto_161895 - BLOCK
      ?auto_161896 - BLOCK
      ?auto_161897 - BLOCK
      ?auto_161898 - BLOCK
      ?auto_161899 - BLOCK
    )
    :vars
    (
      ?auto_161900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161893 ) ( ON ?auto_161894 ?auto_161893 ) ( ON ?auto_161895 ?auto_161894 ) ( ON ?auto_161896 ?auto_161895 ) ( not ( = ?auto_161893 ?auto_161894 ) ) ( not ( = ?auto_161893 ?auto_161895 ) ) ( not ( = ?auto_161893 ?auto_161896 ) ) ( not ( = ?auto_161893 ?auto_161897 ) ) ( not ( = ?auto_161893 ?auto_161898 ) ) ( not ( = ?auto_161893 ?auto_161899 ) ) ( not ( = ?auto_161894 ?auto_161895 ) ) ( not ( = ?auto_161894 ?auto_161896 ) ) ( not ( = ?auto_161894 ?auto_161897 ) ) ( not ( = ?auto_161894 ?auto_161898 ) ) ( not ( = ?auto_161894 ?auto_161899 ) ) ( not ( = ?auto_161895 ?auto_161896 ) ) ( not ( = ?auto_161895 ?auto_161897 ) ) ( not ( = ?auto_161895 ?auto_161898 ) ) ( not ( = ?auto_161895 ?auto_161899 ) ) ( not ( = ?auto_161896 ?auto_161897 ) ) ( not ( = ?auto_161896 ?auto_161898 ) ) ( not ( = ?auto_161896 ?auto_161899 ) ) ( not ( = ?auto_161897 ?auto_161898 ) ) ( not ( = ?auto_161897 ?auto_161899 ) ) ( not ( = ?auto_161898 ?auto_161899 ) ) ( ON ?auto_161899 ?auto_161900 ) ( not ( = ?auto_161893 ?auto_161900 ) ) ( not ( = ?auto_161894 ?auto_161900 ) ) ( not ( = ?auto_161895 ?auto_161900 ) ) ( not ( = ?auto_161896 ?auto_161900 ) ) ( not ( = ?auto_161897 ?auto_161900 ) ) ( not ( = ?auto_161898 ?auto_161900 ) ) ( not ( = ?auto_161899 ?auto_161900 ) ) ( ON ?auto_161898 ?auto_161899 ) ( CLEAR ?auto_161898 ) ( ON-TABLE ?auto_161900 ) ( HOLDING ?auto_161897 ) ( CLEAR ?auto_161896 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161893 ?auto_161894 ?auto_161895 ?auto_161896 ?auto_161897 )
      ( MAKE-7PILE ?auto_161893 ?auto_161894 ?auto_161895 ?auto_161896 ?auto_161897 ?auto_161898 ?auto_161899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161901 - BLOCK
      ?auto_161902 - BLOCK
      ?auto_161903 - BLOCK
      ?auto_161904 - BLOCK
      ?auto_161905 - BLOCK
      ?auto_161906 - BLOCK
      ?auto_161907 - BLOCK
    )
    :vars
    (
      ?auto_161908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161901 ) ( ON ?auto_161902 ?auto_161901 ) ( ON ?auto_161903 ?auto_161902 ) ( ON ?auto_161904 ?auto_161903 ) ( not ( = ?auto_161901 ?auto_161902 ) ) ( not ( = ?auto_161901 ?auto_161903 ) ) ( not ( = ?auto_161901 ?auto_161904 ) ) ( not ( = ?auto_161901 ?auto_161905 ) ) ( not ( = ?auto_161901 ?auto_161906 ) ) ( not ( = ?auto_161901 ?auto_161907 ) ) ( not ( = ?auto_161902 ?auto_161903 ) ) ( not ( = ?auto_161902 ?auto_161904 ) ) ( not ( = ?auto_161902 ?auto_161905 ) ) ( not ( = ?auto_161902 ?auto_161906 ) ) ( not ( = ?auto_161902 ?auto_161907 ) ) ( not ( = ?auto_161903 ?auto_161904 ) ) ( not ( = ?auto_161903 ?auto_161905 ) ) ( not ( = ?auto_161903 ?auto_161906 ) ) ( not ( = ?auto_161903 ?auto_161907 ) ) ( not ( = ?auto_161904 ?auto_161905 ) ) ( not ( = ?auto_161904 ?auto_161906 ) ) ( not ( = ?auto_161904 ?auto_161907 ) ) ( not ( = ?auto_161905 ?auto_161906 ) ) ( not ( = ?auto_161905 ?auto_161907 ) ) ( not ( = ?auto_161906 ?auto_161907 ) ) ( ON ?auto_161907 ?auto_161908 ) ( not ( = ?auto_161901 ?auto_161908 ) ) ( not ( = ?auto_161902 ?auto_161908 ) ) ( not ( = ?auto_161903 ?auto_161908 ) ) ( not ( = ?auto_161904 ?auto_161908 ) ) ( not ( = ?auto_161905 ?auto_161908 ) ) ( not ( = ?auto_161906 ?auto_161908 ) ) ( not ( = ?auto_161907 ?auto_161908 ) ) ( ON ?auto_161906 ?auto_161907 ) ( ON-TABLE ?auto_161908 ) ( CLEAR ?auto_161904 ) ( ON ?auto_161905 ?auto_161906 ) ( CLEAR ?auto_161905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161908 ?auto_161907 ?auto_161906 )
      ( MAKE-7PILE ?auto_161901 ?auto_161902 ?auto_161903 ?auto_161904 ?auto_161905 ?auto_161906 ?auto_161907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161909 - BLOCK
      ?auto_161910 - BLOCK
      ?auto_161911 - BLOCK
      ?auto_161912 - BLOCK
      ?auto_161913 - BLOCK
      ?auto_161914 - BLOCK
      ?auto_161915 - BLOCK
    )
    :vars
    (
      ?auto_161916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161909 ) ( ON ?auto_161910 ?auto_161909 ) ( ON ?auto_161911 ?auto_161910 ) ( not ( = ?auto_161909 ?auto_161910 ) ) ( not ( = ?auto_161909 ?auto_161911 ) ) ( not ( = ?auto_161909 ?auto_161912 ) ) ( not ( = ?auto_161909 ?auto_161913 ) ) ( not ( = ?auto_161909 ?auto_161914 ) ) ( not ( = ?auto_161909 ?auto_161915 ) ) ( not ( = ?auto_161910 ?auto_161911 ) ) ( not ( = ?auto_161910 ?auto_161912 ) ) ( not ( = ?auto_161910 ?auto_161913 ) ) ( not ( = ?auto_161910 ?auto_161914 ) ) ( not ( = ?auto_161910 ?auto_161915 ) ) ( not ( = ?auto_161911 ?auto_161912 ) ) ( not ( = ?auto_161911 ?auto_161913 ) ) ( not ( = ?auto_161911 ?auto_161914 ) ) ( not ( = ?auto_161911 ?auto_161915 ) ) ( not ( = ?auto_161912 ?auto_161913 ) ) ( not ( = ?auto_161912 ?auto_161914 ) ) ( not ( = ?auto_161912 ?auto_161915 ) ) ( not ( = ?auto_161913 ?auto_161914 ) ) ( not ( = ?auto_161913 ?auto_161915 ) ) ( not ( = ?auto_161914 ?auto_161915 ) ) ( ON ?auto_161915 ?auto_161916 ) ( not ( = ?auto_161909 ?auto_161916 ) ) ( not ( = ?auto_161910 ?auto_161916 ) ) ( not ( = ?auto_161911 ?auto_161916 ) ) ( not ( = ?auto_161912 ?auto_161916 ) ) ( not ( = ?auto_161913 ?auto_161916 ) ) ( not ( = ?auto_161914 ?auto_161916 ) ) ( not ( = ?auto_161915 ?auto_161916 ) ) ( ON ?auto_161914 ?auto_161915 ) ( ON-TABLE ?auto_161916 ) ( ON ?auto_161913 ?auto_161914 ) ( CLEAR ?auto_161913 ) ( HOLDING ?auto_161912 ) ( CLEAR ?auto_161911 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161909 ?auto_161910 ?auto_161911 ?auto_161912 )
      ( MAKE-7PILE ?auto_161909 ?auto_161910 ?auto_161911 ?auto_161912 ?auto_161913 ?auto_161914 ?auto_161915 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161917 - BLOCK
      ?auto_161918 - BLOCK
      ?auto_161919 - BLOCK
      ?auto_161920 - BLOCK
      ?auto_161921 - BLOCK
      ?auto_161922 - BLOCK
      ?auto_161923 - BLOCK
    )
    :vars
    (
      ?auto_161924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161917 ) ( ON ?auto_161918 ?auto_161917 ) ( ON ?auto_161919 ?auto_161918 ) ( not ( = ?auto_161917 ?auto_161918 ) ) ( not ( = ?auto_161917 ?auto_161919 ) ) ( not ( = ?auto_161917 ?auto_161920 ) ) ( not ( = ?auto_161917 ?auto_161921 ) ) ( not ( = ?auto_161917 ?auto_161922 ) ) ( not ( = ?auto_161917 ?auto_161923 ) ) ( not ( = ?auto_161918 ?auto_161919 ) ) ( not ( = ?auto_161918 ?auto_161920 ) ) ( not ( = ?auto_161918 ?auto_161921 ) ) ( not ( = ?auto_161918 ?auto_161922 ) ) ( not ( = ?auto_161918 ?auto_161923 ) ) ( not ( = ?auto_161919 ?auto_161920 ) ) ( not ( = ?auto_161919 ?auto_161921 ) ) ( not ( = ?auto_161919 ?auto_161922 ) ) ( not ( = ?auto_161919 ?auto_161923 ) ) ( not ( = ?auto_161920 ?auto_161921 ) ) ( not ( = ?auto_161920 ?auto_161922 ) ) ( not ( = ?auto_161920 ?auto_161923 ) ) ( not ( = ?auto_161921 ?auto_161922 ) ) ( not ( = ?auto_161921 ?auto_161923 ) ) ( not ( = ?auto_161922 ?auto_161923 ) ) ( ON ?auto_161923 ?auto_161924 ) ( not ( = ?auto_161917 ?auto_161924 ) ) ( not ( = ?auto_161918 ?auto_161924 ) ) ( not ( = ?auto_161919 ?auto_161924 ) ) ( not ( = ?auto_161920 ?auto_161924 ) ) ( not ( = ?auto_161921 ?auto_161924 ) ) ( not ( = ?auto_161922 ?auto_161924 ) ) ( not ( = ?auto_161923 ?auto_161924 ) ) ( ON ?auto_161922 ?auto_161923 ) ( ON-TABLE ?auto_161924 ) ( ON ?auto_161921 ?auto_161922 ) ( CLEAR ?auto_161919 ) ( ON ?auto_161920 ?auto_161921 ) ( CLEAR ?auto_161920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161924 ?auto_161923 ?auto_161922 ?auto_161921 )
      ( MAKE-7PILE ?auto_161917 ?auto_161918 ?auto_161919 ?auto_161920 ?auto_161921 ?auto_161922 ?auto_161923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161925 - BLOCK
      ?auto_161926 - BLOCK
      ?auto_161927 - BLOCK
      ?auto_161928 - BLOCK
      ?auto_161929 - BLOCK
      ?auto_161930 - BLOCK
      ?auto_161931 - BLOCK
    )
    :vars
    (
      ?auto_161932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161925 ) ( ON ?auto_161926 ?auto_161925 ) ( not ( = ?auto_161925 ?auto_161926 ) ) ( not ( = ?auto_161925 ?auto_161927 ) ) ( not ( = ?auto_161925 ?auto_161928 ) ) ( not ( = ?auto_161925 ?auto_161929 ) ) ( not ( = ?auto_161925 ?auto_161930 ) ) ( not ( = ?auto_161925 ?auto_161931 ) ) ( not ( = ?auto_161926 ?auto_161927 ) ) ( not ( = ?auto_161926 ?auto_161928 ) ) ( not ( = ?auto_161926 ?auto_161929 ) ) ( not ( = ?auto_161926 ?auto_161930 ) ) ( not ( = ?auto_161926 ?auto_161931 ) ) ( not ( = ?auto_161927 ?auto_161928 ) ) ( not ( = ?auto_161927 ?auto_161929 ) ) ( not ( = ?auto_161927 ?auto_161930 ) ) ( not ( = ?auto_161927 ?auto_161931 ) ) ( not ( = ?auto_161928 ?auto_161929 ) ) ( not ( = ?auto_161928 ?auto_161930 ) ) ( not ( = ?auto_161928 ?auto_161931 ) ) ( not ( = ?auto_161929 ?auto_161930 ) ) ( not ( = ?auto_161929 ?auto_161931 ) ) ( not ( = ?auto_161930 ?auto_161931 ) ) ( ON ?auto_161931 ?auto_161932 ) ( not ( = ?auto_161925 ?auto_161932 ) ) ( not ( = ?auto_161926 ?auto_161932 ) ) ( not ( = ?auto_161927 ?auto_161932 ) ) ( not ( = ?auto_161928 ?auto_161932 ) ) ( not ( = ?auto_161929 ?auto_161932 ) ) ( not ( = ?auto_161930 ?auto_161932 ) ) ( not ( = ?auto_161931 ?auto_161932 ) ) ( ON ?auto_161930 ?auto_161931 ) ( ON-TABLE ?auto_161932 ) ( ON ?auto_161929 ?auto_161930 ) ( ON ?auto_161928 ?auto_161929 ) ( CLEAR ?auto_161928 ) ( HOLDING ?auto_161927 ) ( CLEAR ?auto_161926 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161925 ?auto_161926 ?auto_161927 )
      ( MAKE-7PILE ?auto_161925 ?auto_161926 ?auto_161927 ?auto_161928 ?auto_161929 ?auto_161930 ?auto_161931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161933 - BLOCK
      ?auto_161934 - BLOCK
      ?auto_161935 - BLOCK
      ?auto_161936 - BLOCK
      ?auto_161937 - BLOCK
      ?auto_161938 - BLOCK
      ?auto_161939 - BLOCK
    )
    :vars
    (
      ?auto_161940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161933 ) ( ON ?auto_161934 ?auto_161933 ) ( not ( = ?auto_161933 ?auto_161934 ) ) ( not ( = ?auto_161933 ?auto_161935 ) ) ( not ( = ?auto_161933 ?auto_161936 ) ) ( not ( = ?auto_161933 ?auto_161937 ) ) ( not ( = ?auto_161933 ?auto_161938 ) ) ( not ( = ?auto_161933 ?auto_161939 ) ) ( not ( = ?auto_161934 ?auto_161935 ) ) ( not ( = ?auto_161934 ?auto_161936 ) ) ( not ( = ?auto_161934 ?auto_161937 ) ) ( not ( = ?auto_161934 ?auto_161938 ) ) ( not ( = ?auto_161934 ?auto_161939 ) ) ( not ( = ?auto_161935 ?auto_161936 ) ) ( not ( = ?auto_161935 ?auto_161937 ) ) ( not ( = ?auto_161935 ?auto_161938 ) ) ( not ( = ?auto_161935 ?auto_161939 ) ) ( not ( = ?auto_161936 ?auto_161937 ) ) ( not ( = ?auto_161936 ?auto_161938 ) ) ( not ( = ?auto_161936 ?auto_161939 ) ) ( not ( = ?auto_161937 ?auto_161938 ) ) ( not ( = ?auto_161937 ?auto_161939 ) ) ( not ( = ?auto_161938 ?auto_161939 ) ) ( ON ?auto_161939 ?auto_161940 ) ( not ( = ?auto_161933 ?auto_161940 ) ) ( not ( = ?auto_161934 ?auto_161940 ) ) ( not ( = ?auto_161935 ?auto_161940 ) ) ( not ( = ?auto_161936 ?auto_161940 ) ) ( not ( = ?auto_161937 ?auto_161940 ) ) ( not ( = ?auto_161938 ?auto_161940 ) ) ( not ( = ?auto_161939 ?auto_161940 ) ) ( ON ?auto_161938 ?auto_161939 ) ( ON-TABLE ?auto_161940 ) ( ON ?auto_161937 ?auto_161938 ) ( ON ?auto_161936 ?auto_161937 ) ( CLEAR ?auto_161934 ) ( ON ?auto_161935 ?auto_161936 ) ( CLEAR ?auto_161935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161940 ?auto_161939 ?auto_161938 ?auto_161937 ?auto_161936 )
      ( MAKE-7PILE ?auto_161933 ?auto_161934 ?auto_161935 ?auto_161936 ?auto_161937 ?auto_161938 ?auto_161939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161941 - BLOCK
      ?auto_161942 - BLOCK
      ?auto_161943 - BLOCK
      ?auto_161944 - BLOCK
      ?auto_161945 - BLOCK
      ?auto_161946 - BLOCK
      ?auto_161947 - BLOCK
    )
    :vars
    (
      ?auto_161948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161941 ) ( not ( = ?auto_161941 ?auto_161942 ) ) ( not ( = ?auto_161941 ?auto_161943 ) ) ( not ( = ?auto_161941 ?auto_161944 ) ) ( not ( = ?auto_161941 ?auto_161945 ) ) ( not ( = ?auto_161941 ?auto_161946 ) ) ( not ( = ?auto_161941 ?auto_161947 ) ) ( not ( = ?auto_161942 ?auto_161943 ) ) ( not ( = ?auto_161942 ?auto_161944 ) ) ( not ( = ?auto_161942 ?auto_161945 ) ) ( not ( = ?auto_161942 ?auto_161946 ) ) ( not ( = ?auto_161942 ?auto_161947 ) ) ( not ( = ?auto_161943 ?auto_161944 ) ) ( not ( = ?auto_161943 ?auto_161945 ) ) ( not ( = ?auto_161943 ?auto_161946 ) ) ( not ( = ?auto_161943 ?auto_161947 ) ) ( not ( = ?auto_161944 ?auto_161945 ) ) ( not ( = ?auto_161944 ?auto_161946 ) ) ( not ( = ?auto_161944 ?auto_161947 ) ) ( not ( = ?auto_161945 ?auto_161946 ) ) ( not ( = ?auto_161945 ?auto_161947 ) ) ( not ( = ?auto_161946 ?auto_161947 ) ) ( ON ?auto_161947 ?auto_161948 ) ( not ( = ?auto_161941 ?auto_161948 ) ) ( not ( = ?auto_161942 ?auto_161948 ) ) ( not ( = ?auto_161943 ?auto_161948 ) ) ( not ( = ?auto_161944 ?auto_161948 ) ) ( not ( = ?auto_161945 ?auto_161948 ) ) ( not ( = ?auto_161946 ?auto_161948 ) ) ( not ( = ?auto_161947 ?auto_161948 ) ) ( ON ?auto_161946 ?auto_161947 ) ( ON-TABLE ?auto_161948 ) ( ON ?auto_161945 ?auto_161946 ) ( ON ?auto_161944 ?auto_161945 ) ( ON ?auto_161943 ?auto_161944 ) ( CLEAR ?auto_161943 ) ( HOLDING ?auto_161942 ) ( CLEAR ?auto_161941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161941 ?auto_161942 )
      ( MAKE-7PILE ?auto_161941 ?auto_161942 ?auto_161943 ?auto_161944 ?auto_161945 ?auto_161946 ?auto_161947 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161949 - BLOCK
      ?auto_161950 - BLOCK
      ?auto_161951 - BLOCK
      ?auto_161952 - BLOCK
      ?auto_161953 - BLOCK
      ?auto_161954 - BLOCK
      ?auto_161955 - BLOCK
    )
    :vars
    (
      ?auto_161956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_161949 ) ( not ( = ?auto_161949 ?auto_161950 ) ) ( not ( = ?auto_161949 ?auto_161951 ) ) ( not ( = ?auto_161949 ?auto_161952 ) ) ( not ( = ?auto_161949 ?auto_161953 ) ) ( not ( = ?auto_161949 ?auto_161954 ) ) ( not ( = ?auto_161949 ?auto_161955 ) ) ( not ( = ?auto_161950 ?auto_161951 ) ) ( not ( = ?auto_161950 ?auto_161952 ) ) ( not ( = ?auto_161950 ?auto_161953 ) ) ( not ( = ?auto_161950 ?auto_161954 ) ) ( not ( = ?auto_161950 ?auto_161955 ) ) ( not ( = ?auto_161951 ?auto_161952 ) ) ( not ( = ?auto_161951 ?auto_161953 ) ) ( not ( = ?auto_161951 ?auto_161954 ) ) ( not ( = ?auto_161951 ?auto_161955 ) ) ( not ( = ?auto_161952 ?auto_161953 ) ) ( not ( = ?auto_161952 ?auto_161954 ) ) ( not ( = ?auto_161952 ?auto_161955 ) ) ( not ( = ?auto_161953 ?auto_161954 ) ) ( not ( = ?auto_161953 ?auto_161955 ) ) ( not ( = ?auto_161954 ?auto_161955 ) ) ( ON ?auto_161955 ?auto_161956 ) ( not ( = ?auto_161949 ?auto_161956 ) ) ( not ( = ?auto_161950 ?auto_161956 ) ) ( not ( = ?auto_161951 ?auto_161956 ) ) ( not ( = ?auto_161952 ?auto_161956 ) ) ( not ( = ?auto_161953 ?auto_161956 ) ) ( not ( = ?auto_161954 ?auto_161956 ) ) ( not ( = ?auto_161955 ?auto_161956 ) ) ( ON ?auto_161954 ?auto_161955 ) ( ON-TABLE ?auto_161956 ) ( ON ?auto_161953 ?auto_161954 ) ( ON ?auto_161952 ?auto_161953 ) ( ON ?auto_161951 ?auto_161952 ) ( CLEAR ?auto_161949 ) ( ON ?auto_161950 ?auto_161951 ) ( CLEAR ?auto_161950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161956 ?auto_161955 ?auto_161954 ?auto_161953 ?auto_161952 ?auto_161951 )
      ( MAKE-7PILE ?auto_161949 ?auto_161950 ?auto_161951 ?auto_161952 ?auto_161953 ?auto_161954 ?auto_161955 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161957 - BLOCK
      ?auto_161958 - BLOCK
      ?auto_161959 - BLOCK
      ?auto_161960 - BLOCK
      ?auto_161961 - BLOCK
      ?auto_161962 - BLOCK
      ?auto_161963 - BLOCK
    )
    :vars
    (
      ?auto_161964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161957 ?auto_161958 ) ) ( not ( = ?auto_161957 ?auto_161959 ) ) ( not ( = ?auto_161957 ?auto_161960 ) ) ( not ( = ?auto_161957 ?auto_161961 ) ) ( not ( = ?auto_161957 ?auto_161962 ) ) ( not ( = ?auto_161957 ?auto_161963 ) ) ( not ( = ?auto_161958 ?auto_161959 ) ) ( not ( = ?auto_161958 ?auto_161960 ) ) ( not ( = ?auto_161958 ?auto_161961 ) ) ( not ( = ?auto_161958 ?auto_161962 ) ) ( not ( = ?auto_161958 ?auto_161963 ) ) ( not ( = ?auto_161959 ?auto_161960 ) ) ( not ( = ?auto_161959 ?auto_161961 ) ) ( not ( = ?auto_161959 ?auto_161962 ) ) ( not ( = ?auto_161959 ?auto_161963 ) ) ( not ( = ?auto_161960 ?auto_161961 ) ) ( not ( = ?auto_161960 ?auto_161962 ) ) ( not ( = ?auto_161960 ?auto_161963 ) ) ( not ( = ?auto_161961 ?auto_161962 ) ) ( not ( = ?auto_161961 ?auto_161963 ) ) ( not ( = ?auto_161962 ?auto_161963 ) ) ( ON ?auto_161963 ?auto_161964 ) ( not ( = ?auto_161957 ?auto_161964 ) ) ( not ( = ?auto_161958 ?auto_161964 ) ) ( not ( = ?auto_161959 ?auto_161964 ) ) ( not ( = ?auto_161960 ?auto_161964 ) ) ( not ( = ?auto_161961 ?auto_161964 ) ) ( not ( = ?auto_161962 ?auto_161964 ) ) ( not ( = ?auto_161963 ?auto_161964 ) ) ( ON ?auto_161962 ?auto_161963 ) ( ON-TABLE ?auto_161964 ) ( ON ?auto_161961 ?auto_161962 ) ( ON ?auto_161960 ?auto_161961 ) ( ON ?auto_161959 ?auto_161960 ) ( ON ?auto_161958 ?auto_161959 ) ( CLEAR ?auto_161958 ) ( HOLDING ?auto_161957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161957 )
      ( MAKE-7PILE ?auto_161957 ?auto_161958 ?auto_161959 ?auto_161960 ?auto_161961 ?auto_161962 ?auto_161963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161965 - BLOCK
      ?auto_161966 - BLOCK
      ?auto_161967 - BLOCK
      ?auto_161968 - BLOCK
      ?auto_161969 - BLOCK
      ?auto_161970 - BLOCK
      ?auto_161971 - BLOCK
    )
    :vars
    (
      ?auto_161972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161965 ?auto_161966 ) ) ( not ( = ?auto_161965 ?auto_161967 ) ) ( not ( = ?auto_161965 ?auto_161968 ) ) ( not ( = ?auto_161965 ?auto_161969 ) ) ( not ( = ?auto_161965 ?auto_161970 ) ) ( not ( = ?auto_161965 ?auto_161971 ) ) ( not ( = ?auto_161966 ?auto_161967 ) ) ( not ( = ?auto_161966 ?auto_161968 ) ) ( not ( = ?auto_161966 ?auto_161969 ) ) ( not ( = ?auto_161966 ?auto_161970 ) ) ( not ( = ?auto_161966 ?auto_161971 ) ) ( not ( = ?auto_161967 ?auto_161968 ) ) ( not ( = ?auto_161967 ?auto_161969 ) ) ( not ( = ?auto_161967 ?auto_161970 ) ) ( not ( = ?auto_161967 ?auto_161971 ) ) ( not ( = ?auto_161968 ?auto_161969 ) ) ( not ( = ?auto_161968 ?auto_161970 ) ) ( not ( = ?auto_161968 ?auto_161971 ) ) ( not ( = ?auto_161969 ?auto_161970 ) ) ( not ( = ?auto_161969 ?auto_161971 ) ) ( not ( = ?auto_161970 ?auto_161971 ) ) ( ON ?auto_161971 ?auto_161972 ) ( not ( = ?auto_161965 ?auto_161972 ) ) ( not ( = ?auto_161966 ?auto_161972 ) ) ( not ( = ?auto_161967 ?auto_161972 ) ) ( not ( = ?auto_161968 ?auto_161972 ) ) ( not ( = ?auto_161969 ?auto_161972 ) ) ( not ( = ?auto_161970 ?auto_161972 ) ) ( not ( = ?auto_161971 ?auto_161972 ) ) ( ON ?auto_161970 ?auto_161971 ) ( ON-TABLE ?auto_161972 ) ( ON ?auto_161969 ?auto_161970 ) ( ON ?auto_161968 ?auto_161969 ) ( ON ?auto_161967 ?auto_161968 ) ( ON ?auto_161966 ?auto_161967 ) ( ON ?auto_161965 ?auto_161966 ) ( CLEAR ?auto_161965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161972 ?auto_161971 ?auto_161970 ?auto_161969 ?auto_161968 ?auto_161967 ?auto_161966 )
      ( MAKE-7PILE ?auto_161965 ?auto_161966 ?auto_161967 ?auto_161968 ?auto_161969 ?auto_161970 ?auto_161971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161973 - BLOCK
      ?auto_161974 - BLOCK
      ?auto_161975 - BLOCK
      ?auto_161976 - BLOCK
      ?auto_161977 - BLOCK
      ?auto_161978 - BLOCK
      ?auto_161979 - BLOCK
    )
    :vars
    (
      ?auto_161980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161973 ?auto_161974 ) ) ( not ( = ?auto_161973 ?auto_161975 ) ) ( not ( = ?auto_161973 ?auto_161976 ) ) ( not ( = ?auto_161973 ?auto_161977 ) ) ( not ( = ?auto_161973 ?auto_161978 ) ) ( not ( = ?auto_161973 ?auto_161979 ) ) ( not ( = ?auto_161974 ?auto_161975 ) ) ( not ( = ?auto_161974 ?auto_161976 ) ) ( not ( = ?auto_161974 ?auto_161977 ) ) ( not ( = ?auto_161974 ?auto_161978 ) ) ( not ( = ?auto_161974 ?auto_161979 ) ) ( not ( = ?auto_161975 ?auto_161976 ) ) ( not ( = ?auto_161975 ?auto_161977 ) ) ( not ( = ?auto_161975 ?auto_161978 ) ) ( not ( = ?auto_161975 ?auto_161979 ) ) ( not ( = ?auto_161976 ?auto_161977 ) ) ( not ( = ?auto_161976 ?auto_161978 ) ) ( not ( = ?auto_161976 ?auto_161979 ) ) ( not ( = ?auto_161977 ?auto_161978 ) ) ( not ( = ?auto_161977 ?auto_161979 ) ) ( not ( = ?auto_161978 ?auto_161979 ) ) ( ON ?auto_161979 ?auto_161980 ) ( not ( = ?auto_161973 ?auto_161980 ) ) ( not ( = ?auto_161974 ?auto_161980 ) ) ( not ( = ?auto_161975 ?auto_161980 ) ) ( not ( = ?auto_161976 ?auto_161980 ) ) ( not ( = ?auto_161977 ?auto_161980 ) ) ( not ( = ?auto_161978 ?auto_161980 ) ) ( not ( = ?auto_161979 ?auto_161980 ) ) ( ON ?auto_161978 ?auto_161979 ) ( ON-TABLE ?auto_161980 ) ( ON ?auto_161977 ?auto_161978 ) ( ON ?auto_161976 ?auto_161977 ) ( ON ?auto_161975 ?auto_161976 ) ( ON ?auto_161974 ?auto_161975 ) ( HOLDING ?auto_161973 ) ( CLEAR ?auto_161974 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_161980 ?auto_161979 ?auto_161978 ?auto_161977 ?auto_161976 ?auto_161975 ?auto_161974 ?auto_161973 )
      ( MAKE-7PILE ?auto_161973 ?auto_161974 ?auto_161975 ?auto_161976 ?auto_161977 ?auto_161978 ?auto_161979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161981 - BLOCK
      ?auto_161982 - BLOCK
      ?auto_161983 - BLOCK
      ?auto_161984 - BLOCK
      ?auto_161985 - BLOCK
      ?auto_161986 - BLOCK
      ?auto_161987 - BLOCK
    )
    :vars
    (
      ?auto_161988 - BLOCK
      ?auto_161989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161981 ?auto_161982 ) ) ( not ( = ?auto_161981 ?auto_161983 ) ) ( not ( = ?auto_161981 ?auto_161984 ) ) ( not ( = ?auto_161981 ?auto_161985 ) ) ( not ( = ?auto_161981 ?auto_161986 ) ) ( not ( = ?auto_161981 ?auto_161987 ) ) ( not ( = ?auto_161982 ?auto_161983 ) ) ( not ( = ?auto_161982 ?auto_161984 ) ) ( not ( = ?auto_161982 ?auto_161985 ) ) ( not ( = ?auto_161982 ?auto_161986 ) ) ( not ( = ?auto_161982 ?auto_161987 ) ) ( not ( = ?auto_161983 ?auto_161984 ) ) ( not ( = ?auto_161983 ?auto_161985 ) ) ( not ( = ?auto_161983 ?auto_161986 ) ) ( not ( = ?auto_161983 ?auto_161987 ) ) ( not ( = ?auto_161984 ?auto_161985 ) ) ( not ( = ?auto_161984 ?auto_161986 ) ) ( not ( = ?auto_161984 ?auto_161987 ) ) ( not ( = ?auto_161985 ?auto_161986 ) ) ( not ( = ?auto_161985 ?auto_161987 ) ) ( not ( = ?auto_161986 ?auto_161987 ) ) ( ON ?auto_161987 ?auto_161988 ) ( not ( = ?auto_161981 ?auto_161988 ) ) ( not ( = ?auto_161982 ?auto_161988 ) ) ( not ( = ?auto_161983 ?auto_161988 ) ) ( not ( = ?auto_161984 ?auto_161988 ) ) ( not ( = ?auto_161985 ?auto_161988 ) ) ( not ( = ?auto_161986 ?auto_161988 ) ) ( not ( = ?auto_161987 ?auto_161988 ) ) ( ON ?auto_161986 ?auto_161987 ) ( ON-TABLE ?auto_161988 ) ( ON ?auto_161985 ?auto_161986 ) ( ON ?auto_161984 ?auto_161985 ) ( ON ?auto_161983 ?auto_161984 ) ( ON ?auto_161982 ?auto_161983 ) ( CLEAR ?auto_161982 ) ( ON ?auto_161981 ?auto_161989 ) ( CLEAR ?auto_161981 ) ( HAND-EMPTY ) ( not ( = ?auto_161981 ?auto_161989 ) ) ( not ( = ?auto_161982 ?auto_161989 ) ) ( not ( = ?auto_161983 ?auto_161989 ) ) ( not ( = ?auto_161984 ?auto_161989 ) ) ( not ( = ?auto_161985 ?auto_161989 ) ) ( not ( = ?auto_161986 ?auto_161989 ) ) ( not ( = ?auto_161987 ?auto_161989 ) ) ( not ( = ?auto_161988 ?auto_161989 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161981 ?auto_161989 )
      ( MAKE-7PILE ?auto_161981 ?auto_161982 ?auto_161983 ?auto_161984 ?auto_161985 ?auto_161986 ?auto_161987 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161990 - BLOCK
      ?auto_161991 - BLOCK
      ?auto_161992 - BLOCK
      ?auto_161993 - BLOCK
      ?auto_161994 - BLOCK
      ?auto_161995 - BLOCK
      ?auto_161996 - BLOCK
    )
    :vars
    (
      ?auto_161998 - BLOCK
      ?auto_161997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161990 ?auto_161991 ) ) ( not ( = ?auto_161990 ?auto_161992 ) ) ( not ( = ?auto_161990 ?auto_161993 ) ) ( not ( = ?auto_161990 ?auto_161994 ) ) ( not ( = ?auto_161990 ?auto_161995 ) ) ( not ( = ?auto_161990 ?auto_161996 ) ) ( not ( = ?auto_161991 ?auto_161992 ) ) ( not ( = ?auto_161991 ?auto_161993 ) ) ( not ( = ?auto_161991 ?auto_161994 ) ) ( not ( = ?auto_161991 ?auto_161995 ) ) ( not ( = ?auto_161991 ?auto_161996 ) ) ( not ( = ?auto_161992 ?auto_161993 ) ) ( not ( = ?auto_161992 ?auto_161994 ) ) ( not ( = ?auto_161992 ?auto_161995 ) ) ( not ( = ?auto_161992 ?auto_161996 ) ) ( not ( = ?auto_161993 ?auto_161994 ) ) ( not ( = ?auto_161993 ?auto_161995 ) ) ( not ( = ?auto_161993 ?auto_161996 ) ) ( not ( = ?auto_161994 ?auto_161995 ) ) ( not ( = ?auto_161994 ?auto_161996 ) ) ( not ( = ?auto_161995 ?auto_161996 ) ) ( ON ?auto_161996 ?auto_161998 ) ( not ( = ?auto_161990 ?auto_161998 ) ) ( not ( = ?auto_161991 ?auto_161998 ) ) ( not ( = ?auto_161992 ?auto_161998 ) ) ( not ( = ?auto_161993 ?auto_161998 ) ) ( not ( = ?auto_161994 ?auto_161998 ) ) ( not ( = ?auto_161995 ?auto_161998 ) ) ( not ( = ?auto_161996 ?auto_161998 ) ) ( ON ?auto_161995 ?auto_161996 ) ( ON-TABLE ?auto_161998 ) ( ON ?auto_161994 ?auto_161995 ) ( ON ?auto_161993 ?auto_161994 ) ( ON ?auto_161992 ?auto_161993 ) ( ON ?auto_161990 ?auto_161997 ) ( CLEAR ?auto_161990 ) ( not ( = ?auto_161990 ?auto_161997 ) ) ( not ( = ?auto_161991 ?auto_161997 ) ) ( not ( = ?auto_161992 ?auto_161997 ) ) ( not ( = ?auto_161993 ?auto_161997 ) ) ( not ( = ?auto_161994 ?auto_161997 ) ) ( not ( = ?auto_161995 ?auto_161997 ) ) ( not ( = ?auto_161996 ?auto_161997 ) ) ( not ( = ?auto_161998 ?auto_161997 ) ) ( HOLDING ?auto_161991 ) ( CLEAR ?auto_161992 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161998 ?auto_161996 ?auto_161995 ?auto_161994 ?auto_161993 ?auto_161992 ?auto_161991 )
      ( MAKE-7PILE ?auto_161990 ?auto_161991 ?auto_161992 ?auto_161993 ?auto_161994 ?auto_161995 ?auto_161996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161999 - BLOCK
      ?auto_162000 - BLOCK
      ?auto_162001 - BLOCK
      ?auto_162002 - BLOCK
      ?auto_162003 - BLOCK
      ?auto_162004 - BLOCK
      ?auto_162005 - BLOCK
    )
    :vars
    (
      ?auto_162006 - BLOCK
      ?auto_162007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_161999 ?auto_162000 ) ) ( not ( = ?auto_161999 ?auto_162001 ) ) ( not ( = ?auto_161999 ?auto_162002 ) ) ( not ( = ?auto_161999 ?auto_162003 ) ) ( not ( = ?auto_161999 ?auto_162004 ) ) ( not ( = ?auto_161999 ?auto_162005 ) ) ( not ( = ?auto_162000 ?auto_162001 ) ) ( not ( = ?auto_162000 ?auto_162002 ) ) ( not ( = ?auto_162000 ?auto_162003 ) ) ( not ( = ?auto_162000 ?auto_162004 ) ) ( not ( = ?auto_162000 ?auto_162005 ) ) ( not ( = ?auto_162001 ?auto_162002 ) ) ( not ( = ?auto_162001 ?auto_162003 ) ) ( not ( = ?auto_162001 ?auto_162004 ) ) ( not ( = ?auto_162001 ?auto_162005 ) ) ( not ( = ?auto_162002 ?auto_162003 ) ) ( not ( = ?auto_162002 ?auto_162004 ) ) ( not ( = ?auto_162002 ?auto_162005 ) ) ( not ( = ?auto_162003 ?auto_162004 ) ) ( not ( = ?auto_162003 ?auto_162005 ) ) ( not ( = ?auto_162004 ?auto_162005 ) ) ( ON ?auto_162005 ?auto_162006 ) ( not ( = ?auto_161999 ?auto_162006 ) ) ( not ( = ?auto_162000 ?auto_162006 ) ) ( not ( = ?auto_162001 ?auto_162006 ) ) ( not ( = ?auto_162002 ?auto_162006 ) ) ( not ( = ?auto_162003 ?auto_162006 ) ) ( not ( = ?auto_162004 ?auto_162006 ) ) ( not ( = ?auto_162005 ?auto_162006 ) ) ( ON ?auto_162004 ?auto_162005 ) ( ON-TABLE ?auto_162006 ) ( ON ?auto_162003 ?auto_162004 ) ( ON ?auto_162002 ?auto_162003 ) ( ON ?auto_162001 ?auto_162002 ) ( ON ?auto_161999 ?auto_162007 ) ( not ( = ?auto_161999 ?auto_162007 ) ) ( not ( = ?auto_162000 ?auto_162007 ) ) ( not ( = ?auto_162001 ?auto_162007 ) ) ( not ( = ?auto_162002 ?auto_162007 ) ) ( not ( = ?auto_162003 ?auto_162007 ) ) ( not ( = ?auto_162004 ?auto_162007 ) ) ( not ( = ?auto_162005 ?auto_162007 ) ) ( not ( = ?auto_162006 ?auto_162007 ) ) ( CLEAR ?auto_162001 ) ( ON ?auto_162000 ?auto_161999 ) ( CLEAR ?auto_162000 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162007 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162007 ?auto_161999 )
      ( MAKE-7PILE ?auto_161999 ?auto_162000 ?auto_162001 ?auto_162002 ?auto_162003 ?auto_162004 ?auto_162005 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162008 - BLOCK
      ?auto_162009 - BLOCK
      ?auto_162010 - BLOCK
      ?auto_162011 - BLOCK
      ?auto_162012 - BLOCK
      ?auto_162013 - BLOCK
      ?auto_162014 - BLOCK
    )
    :vars
    (
      ?auto_162016 - BLOCK
      ?auto_162015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162008 ?auto_162009 ) ) ( not ( = ?auto_162008 ?auto_162010 ) ) ( not ( = ?auto_162008 ?auto_162011 ) ) ( not ( = ?auto_162008 ?auto_162012 ) ) ( not ( = ?auto_162008 ?auto_162013 ) ) ( not ( = ?auto_162008 ?auto_162014 ) ) ( not ( = ?auto_162009 ?auto_162010 ) ) ( not ( = ?auto_162009 ?auto_162011 ) ) ( not ( = ?auto_162009 ?auto_162012 ) ) ( not ( = ?auto_162009 ?auto_162013 ) ) ( not ( = ?auto_162009 ?auto_162014 ) ) ( not ( = ?auto_162010 ?auto_162011 ) ) ( not ( = ?auto_162010 ?auto_162012 ) ) ( not ( = ?auto_162010 ?auto_162013 ) ) ( not ( = ?auto_162010 ?auto_162014 ) ) ( not ( = ?auto_162011 ?auto_162012 ) ) ( not ( = ?auto_162011 ?auto_162013 ) ) ( not ( = ?auto_162011 ?auto_162014 ) ) ( not ( = ?auto_162012 ?auto_162013 ) ) ( not ( = ?auto_162012 ?auto_162014 ) ) ( not ( = ?auto_162013 ?auto_162014 ) ) ( ON ?auto_162014 ?auto_162016 ) ( not ( = ?auto_162008 ?auto_162016 ) ) ( not ( = ?auto_162009 ?auto_162016 ) ) ( not ( = ?auto_162010 ?auto_162016 ) ) ( not ( = ?auto_162011 ?auto_162016 ) ) ( not ( = ?auto_162012 ?auto_162016 ) ) ( not ( = ?auto_162013 ?auto_162016 ) ) ( not ( = ?auto_162014 ?auto_162016 ) ) ( ON ?auto_162013 ?auto_162014 ) ( ON-TABLE ?auto_162016 ) ( ON ?auto_162012 ?auto_162013 ) ( ON ?auto_162011 ?auto_162012 ) ( ON ?auto_162008 ?auto_162015 ) ( not ( = ?auto_162008 ?auto_162015 ) ) ( not ( = ?auto_162009 ?auto_162015 ) ) ( not ( = ?auto_162010 ?auto_162015 ) ) ( not ( = ?auto_162011 ?auto_162015 ) ) ( not ( = ?auto_162012 ?auto_162015 ) ) ( not ( = ?auto_162013 ?auto_162015 ) ) ( not ( = ?auto_162014 ?auto_162015 ) ) ( not ( = ?auto_162016 ?auto_162015 ) ) ( ON ?auto_162009 ?auto_162008 ) ( CLEAR ?auto_162009 ) ( ON-TABLE ?auto_162015 ) ( HOLDING ?auto_162010 ) ( CLEAR ?auto_162011 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162016 ?auto_162014 ?auto_162013 ?auto_162012 ?auto_162011 ?auto_162010 )
      ( MAKE-7PILE ?auto_162008 ?auto_162009 ?auto_162010 ?auto_162011 ?auto_162012 ?auto_162013 ?auto_162014 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162017 - BLOCK
      ?auto_162018 - BLOCK
      ?auto_162019 - BLOCK
      ?auto_162020 - BLOCK
      ?auto_162021 - BLOCK
      ?auto_162022 - BLOCK
      ?auto_162023 - BLOCK
    )
    :vars
    (
      ?auto_162024 - BLOCK
      ?auto_162025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162017 ?auto_162018 ) ) ( not ( = ?auto_162017 ?auto_162019 ) ) ( not ( = ?auto_162017 ?auto_162020 ) ) ( not ( = ?auto_162017 ?auto_162021 ) ) ( not ( = ?auto_162017 ?auto_162022 ) ) ( not ( = ?auto_162017 ?auto_162023 ) ) ( not ( = ?auto_162018 ?auto_162019 ) ) ( not ( = ?auto_162018 ?auto_162020 ) ) ( not ( = ?auto_162018 ?auto_162021 ) ) ( not ( = ?auto_162018 ?auto_162022 ) ) ( not ( = ?auto_162018 ?auto_162023 ) ) ( not ( = ?auto_162019 ?auto_162020 ) ) ( not ( = ?auto_162019 ?auto_162021 ) ) ( not ( = ?auto_162019 ?auto_162022 ) ) ( not ( = ?auto_162019 ?auto_162023 ) ) ( not ( = ?auto_162020 ?auto_162021 ) ) ( not ( = ?auto_162020 ?auto_162022 ) ) ( not ( = ?auto_162020 ?auto_162023 ) ) ( not ( = ?auto_162021 ?auto_162022 ) ) ( not ( = ?auto_162021 ?auto_162023 ) ) ( not ( = ?auto_162022 ?auto_162023 ) ) ( ON ?auto_162023 ?auto_162024 ) ( not ( = ?auto_162017 ?auto_162024 ) ) ( not ( = ?auto_162018 ?auto_162024 ) ) ( not ( = ?auto_162019 ?auto_162024 ) ) ( not ( = ?auto_162020 ?auto_162024 ) ) ( not ( = ?auto_162021 ?auto_162024 ) ) ( not ( = ?auto_162022 ?auto_162024 ) ) ( not ( = ?auto_162023 ?auto_162024 ) ) ( ON ?auto_162022 ?auto_162023 ) ( ON-TABLE ?auto_162024 ) ( ON ?auto_162021 ?auto_162022 ) ( ON ?auto_162020 ?auto_162021 ) ( ON ?auto_162017 ?auto_162025 ) ( not ( = ?auto_162017 ?auto_162025 ) ) ( not ( = ?auto_162018 ?auto_162025 ) ) ( not ( = ?auto_162019 ?auto_162025 ) ) ( not ( = ?auto_162020 ?auto_162025 ) ) ( not ( = ?auto_162021 ?auto_162025 ) ) ( not ( = ?auto_162022 ?auto_162025 ) ) ( not ( = ?auto_162023 ?auto_162025 ) ) ( not ( = ?auto_162024 ?auto_162025 ) ) ( ON ?auto_162018 ?auto_162017 ) ( ON-TABLE ?auto_162025 ) ( CLEAR ?auto_162020 ) ( ON ?auto_162019 ?auto_162018 ) ( CLEAR ?auto_162019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162025 ?auto_162017 ?auto_162018 )
      ( MAKE-7PILE ?auto_162017 ?auto_162018 ?auto_162019 ?auto_162020 ?auto_162021 ?auto_162022 ?auto_162023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162026 - BLOCK
      ?auto_162027 - BLOCK
      ?auto_162028 - BLOCK
      ?auto_162029 - BLOCK
      ?auto_162030 - BLOCK
      ?auto_162031 - BLOCK
      ?auto_162032 - BLOCK
    )
    :vars
    (
      ?auto_162034 - BLOCK
      ?auto_162033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162026 ?auto_162027 ) ) ( not ( = ?auto_162026 ?auto_162028 ) ) ( not ( = ?auto_162026 ?auto_162029 ) ) ( not ( = ?auto_162026 ?auto_162030 ) ) ( not ( = ?auto_162026 ?auto_162031 ) ) ( not ( = ?auto_162026 ?auto_162032 ) ) ( not ( = ?auto_162027 ?auto_162028 ) ) ( not ( = ?auto_162027 ?auto_162029 ) ) ( not ( = ?auto_162027 ?auto_162030 ) ) ( not ( = ?auto_162027 ?auto_162031 ) ) ( not ( = ?auto_162027 ?auto_162032 ) ) ( not ( = ?auto_162028 ?auto_162029 ) ) ( not ( = ?auto_162028 ?auto_162030 ) ) ( not ( = ?auto_162028 ?auto_162031 ) ) ( not ( = ?auto_162028 ?auto_162032 ) ) ( not ( = ?auto_162029 ?auto_162030 ) ) ( not ( = ?auto_162029 ?auto_162031 ) ) ( not ( = ?auto_162029 ?auto_162032 ) ) ( not ( = ?auto_162030 ?auto_162031 ) ) ( not ( = ?auto_162030 ?auto_162032 ) ) ( not ( = ?auto_162031 ?auto_162032 ) ) ( ON ?auto_162032 ?auto_162034 ) ( not ( = ?auto_162026 ?auto_162034 ) ) ( not ( = ?auto_162027 ?auto_162034 ) ) ( not ( = ?auto_162028 ?auto_162034 ) ) ( not ( = ?auto_162029 ?auto_162034 ) ) ( not ( = ?auto_162030 ?auto_162034 ) ) ( not ( = ?auto_162031 ?auto_162034 ) ) ( not ( = ?auto_162032 ?auto_162034 ) ) ( ON ?auto_162031 ?auto_162032 ) ( ON-TABLE ?auto_162034 ) ( ON ?auto_162030 ?auto_162031 ) ( ON ?auto_162026 ?auto_162033 ) ( not ( = ?auto_162026 ?auto_162033 ) ) ( not ( = ?auto_162027 ?auto_162033 ) ) ( not ( = ?auto_162028 ?auto_162033 ) ) ( not ( = ?auto_162029 ?auto_162033 ) ) ( not ( = ?auto_162030 ?auto_162033 ) ) ( not ( = ?auto_162031 ?auto_162033 ) ) ( not ( = ?auto_162032 ?auto_162033 ) ) ( not ( = ?auto_162034 ?auto_162033 ) ) ( ON ?auto_162027 ?auto_162026 ) ( ON-TABLE ?auto_162033 ) ( ON ?auto_162028 ?auto_162027 ) ( CLEAR ?auto_162028 ) ( HOLDING ?auto_162029 ) ( CLEAR ?auto_162030 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162034 ?auto_162032 ?auto_162031 ?auto_162030 ?auto_162029 )
      ( MAKE-7PILE ?auto_162026 ?auto_162027 ?auto_162028 ?auto_162029 ?auto_162030 ?auto_162031 ?auto_162032 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162035 - BLOCK
      ?auto_162036 - BLOCK
      ?auto_162037 - BLOCK
      ?auto_162038 - BLOCK
      ?auto_162039 - BLOCK
      ?auto_162040 - BLOCK
      ?auto_162041 - BLOCK
    )
    :vars
    (
      ?auto_162042 - BLOCK
      ?auto_162043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162035 ?auto_162036 ) ) ( not ( = ?auto_162035 ?auto_162037 ) ) ( not ( = ?auto_162035 ?auto_162038 ) ) ( not ( = ?auto_162035 ?auto_162039 ) ) ( not ( = ?auto_162035 ?auto_162040 ) ) ( not ( = ?auto_162035 ?auto_162041 ) ) ( not ( = ?auto_162036 ?auto_162037 ) ) ( not ( = ?auto_162036 ?auto_162038 ) ) ( not ( = ?auto_162036 ?auto_162039 ) ) ( not ( = ?auto_162036 ?auto_162040 ) ) ( not ( = ?auto_162036 ?auto_162041 ) ) ( not ( = ?auto_162037 ?auto_162038 ) ) ( not ( = ?auto_162037 ?auto_162039 ) ) ( not ( = ?auto_162037 ?auto_162040 ) ) ( not ( = ?auto_162037 ?auto_162041 ) ) ( not ( = ?auto_162038 ?auto_162039 ) ) ( not ( = ?auto_162038 ?auto_162040 ) ) ( not ( = ?auto_162038 ?auto_162041 ) ) ( not ( = ?auto_162039 ?auto_162040 ) ) ( not ( = ?auto_162039 ?auto_162041 ) ) ( not ( = ?auto_162040 ?auto_162041 ) ) ( ON ?auto_162041 ?auto_162042 ) ( not ( = ?auto_162035 ?auto_162042 ) ) ( not ( = ?auto_162036 ?auto_162042 ) ) ( not ( = ?auto_162037 ?auto_162042 ) ) ( not ( = ?auto_162038 ?auto_162042 ) ) ( not ( = ?auto_162039 ?auto_162042 ) ) ( not ( = ?auto_162040 ?auto_162042 ) ) ( not ( = ?auto_162041 ?auto_162042 ) ) ( ON ?auto_162040 ?auto_162041 ) ( ON-TABLE ?auto_162042 ) ( ON ?auto_162039 ?auto_162040 ) ( ON ?auto_162035 ?auto_162043 ) ( not ( = ?auto_162035 ?auto_162043 ) ) ( not ( = ?auto_162036 ?auto_162043 ) ) ( not ( = ?auto_162037 ?auto_162043 ) ) ( not ( = ?auto_162038 ?auto_162043 ) ) ( not ( = ?auto_162039 ?auto_162043 ) ) ( not ( = ?auto_162040 ?auto_162043 ) ) ( not ( = ?auto_162041 ?auto_162043 ) ) ( not ( = ?auto_162042 ?auto_162043 ) ) ( ON ?auto_162036 ?auto_162035 ) ( ON-TABLE ?auto_162043 ) ( ON ?auto_162037 ?auto_162036 ) ( CLEAR ?auto_162039 ) ( ON ?auto_162038 ?auto_162037 ) ( CLEAR ?auto_162038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162043 ?auto_162035 ?auto_162036 ?auto_162037 )
      ( MAKE-7PILE ?auto_162035 ?auto_162036 ?auto_162037 ?auto_162038 ?auto_162039 ?auto_162040 ?auto_162041 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162044 - BLOCK
      ?auto_162045 - BLOCK
      ?auto_162046 - BLOCK
      ?auto_162047 - BLOCK
      ?auto_162048 - BLOCK
      ?auto_162049 - BLOCK
      ?auto_162050 - BLOCK
    )
    :vars
    (
      ?auto_162052 - BLOCK
      ?auto_162051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162044 ?auto_162045 ) ) ( not ( = ?auto_162044 ?auto_162046 ) ) ( not ( = ?auto_162044 ?auto_162047 ) ) ( not ( = ?auto_162044 ?auto_162048 ) ) ( not ( = ?auto_162044 ?auto_162049 ) ) ( not ( = ?auto_162044 ?auto_162050 ) ) ( not ( = ?auto_162045 ?auto_162046 ) ) ( not ( = ?auto_162045 ?auto_162047 ) ) ( not ( = ?auto_162045 ?auto_162048 ) ) ( not ( = ?auto_162045 ?auto_162049 ) ) ( not ( = ?auto_162045 ?auto_162050 ) ) ( not ( = ?auto_162046 ?auto_162047 ) ) ( not ( = ?auto_162046 ?auto_162048 ) ) ( not ( = ?auto_162046 ?auto_162049 ) ) ( not ( = ?auto_162046 ?auto_162050 ) ) ( not ( = ?auto_162047 ?auto_162048 ) ) ( not ( = ?auto_162047 ?auto_162049 ) ) ( not ( = ?auto_162047 ?auto_162050 ) ) ( not ( = ?auto_162048 ?auto_162049 ) ) ( not ( = ?auto_162048 ?auto_162050 ) ) ( not ( = ?auto_162049 ?auto_162050 ) ) ( ON ?auto_162050 ?auto_162052 ) ( not ( = ?auto_162044 ?auto_162052 ) ) ( not ( = ?auto_162045 ?auto_162052 ) ) ( not ( = ?auto_162046 ?auto_162052 ) ) ( not ( = ?auto_162047 ?auto_162052 ) ) ( not ( = ?auto_162048 ?auto_162052 ) ) ( not ( = ?auto_162049 ?auto_162052 ) ) ( not ( = ?auto_162050 ?auto_162052 ) ) ( ON ?auto_162049 ?auto_162050 ) ( ON-TABLE ?auto_162052 ) ( ON ?auto_162044 ?auto_162051 ) ( not ( = ?auto_162044 ?auto_162051 ) ) ( not ( = ?auto_162045 ?auto_162051 ) ) ( not ( = ?auto_162046 ?auto_162051 ) ) ( not ( = ?auto_162047 ?auto_162051 ) ) ( not ( = ?auto_162048 ?auto_162051 ) ) ( not ( = ?auto_162049 ?auto_162051 ) ) ( not ( = ?auto_162050 ?auto_162051 ) ) ( not ( = ?auto_162052 ?auto_162051 ) ) ( ON ?auto_162045 ?auto_162044 ) ( ON-TABLE ?auto_162051 ) ( ON ?auto_162046 ?auto_162045 ) ( ON ?auto_162047 ?auto_162046 ) ( CLEAR ?auto_162047 ) ( HOLDING ?auto_162048 ) ( CLEAR ?auto_162049 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162052 ?auto_162050 ?auto_162049 ?auto_162048 )
      ( MAKE-7PILE ?auto_162044 ?auto_162045 ?auto_162046 ?auto_162047 ?auto_162048 ?auto_162049 ?auto_162050 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162053 - BLOCK
      ?auto_162054 - BLOCK
      ?auto_162055 - BLOCK
      ?auto_162056 - BLOCK
      ?auto_162057 - BLOCK
      ?auto_162058 - BLOCK
      ?auto_162059 - BLOCK
    )
    :vars
    (
      ?auto_162060 - BLOCK
      ?auto_162061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162053 ?auto_162054 ) ) ( not ( = ?auto_162053 ?auto_162055 ) ) ( not ( = ?auto_162053 ?auto_162056 ) ) ( not ( = ?auto_162053 ?auto_162057 ) ) ( not ( = ?auto_162053 ?auto_162058 ) ) ( not ( = ?auto_162053 ?auto_162059 ) ) ( not ( = ?auto_162054 ?auto_162055 ) ) ( not ( = ?auto_162054 ?auto_162056 ) ) ( not ( = ?auto_162054 ?auto_162057 ) ) ( not ( = ?auto_162054 ?auto_162058 ) ) ( not ( = ?auto_162054 ?auto_162059 ) ) ( not ( = ?auto_162055 ?auto_162056 ) ) ( not ( = ?auto_162055 ?auto_162057 ) ) ( not ( = ?auto_162055 ?auto_162058 ) ) ( not ( = ?auto_162055 ?auto_162059 ) ) ( not ( = ?auto_162056 ?auto_162057 ) ) ( not ( = ?auto_162056 ?auto_162058 ) ) ( not ( = ?auto_162056 ?auto_162059 ) ) ( not ( = ?auto_162057 ?auto_162058 ) ) ( not ( = ?auto_162057 ?auto_162059 ) ) ( not ( = ?auto_162058 ?auto_162059 ) ) ( ON ?auto_162059 ?auto_162060 ) ( not ( = ?auto_162053 ?auto_162060 ) ) ( not ( = ?auto_162054 ?auto_162060 ) ) ( not ( = ?auto_162055 ?auto_162060 ) ) ( not ( = ?auto_162056 ?auto_162060 ) ) ( not ( = ?auto_162057 ?auto_162060 ) ) ( not ( = ?auto_162058 ?auto_162060 ) ) ( not ( = ?auto_162059 ?auto_162060 ) ) ( ON ?auto_162058 ?auto_162059 ) ( ON-TABLE ?auto_162060 ) ( ON ?auto_162053 ?auto_162061 ) ( not ( = ?auto_162053 ?auto_162061 ) ) ( not ( = ?auto_162054 ?auto_162061 ) ) ( not ( = ?auto_162055 ?auto_162061 ) ) ( not ( = ?auto_162056 ?auto_162061 ) ) ( not ( = ?auto_162057 ?auto_162061 ) ) ( not ( = ?auto_162058 ?auto_162061 ) ) ( not ( = ?auto_162059 ?auto_162061 ) ) ( not ( = ?auto_162060 ?auto_162061 ) ) ( ON ?auto_162054 ?auto_162053 ) ( ON-TABLE ?auto_162061 ) ( ON ?auto_162055 ?auto_162054 ) ( ON ?auto_162056 ?auto_162055 ) ( CLEAR ?auto_162058 ) ( ON ?auto_162057 ?auto_162056 ) ( CLEAR ?auto_162057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162061 ?auto_162053 ?auto_162054 ?auto_162055 ?auto_162056 )
      ( MAKE-7PILE ?auto_162053 ?auto_162054 ?auto_162055 ?auto_162056 ?auto_162057 ?auto_162058 ?auto_162059 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162062 - BLOCK
      ?auto_162063 - BLOCK
      ?auto_162064 - BLOCK
      ?auto_162065 - BLOCK
      ?auto_162066 - BLOCK
      ?auto_162067 - BLOCK
      ?auto_162068 - BLOCK
    )
    :vars
    (
      ?auto_162069 - BLOCK
      ?auto_162070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162062 ?auto_162063 ) ) ( not ( = ?auto_162062 ?auto_162064 ) ) ( not ( = ?auto_162062 ?auto_162065 ) ) ( not ( = ?auto_162062 ?auto_162066 ) ) ( not ( = ?auto_162062 ?auto_162067 ) ) ( not ( = ?auto_162062 ?auto_162068 ) ) ( not ( = ?auto_162063 ?auto_162064 ) ) ( not ( = ?auto_162063 ?auto_162065 ) ) ( not ( = ?auto_162063 ?auto_162066 ) ) ( not ( = ?auto_162063 ?auto_162067 ) ) ( not ( = ?auto_162063 ?auto_162068 ) ) ( not ( = ?auto_162064 ?auto_162065 ) ) ( not ( = ?auto_162064 ?auto_162066 ) ) ( not ( = ?auto_162064 ?auto_162067 ) ) ( not ( = ?auto_162064 ?auto_162068 ) ) ( not ( = ?auto_162065 ?auto_162066 ) ) ( not ( = ?auto_162065 ?auto_162067 ) ) ( not ( = ?auto_162065 ?auto_162068 ) ) ( not ( = ?auto_162066 ?auto_162067 ) ) ( not ( = ?auto_162066 ?auto_162068 ) ) ( not ( = ?auto_162067 ?auto_162068 ) ) ( ON ?auto_162068 ?auto_162069 ) ( not ( = ?auto_162062 ?auto_162069 ) ) ( not ( = ?auto_162063 ?auto_162069 ) ) ( not ( = ?auto_162064 ?auto_162069 ) ) ( not ( = ?auto_162065 ?auto_162069 ) ) ( not ( = ?auto_162066 ?auto_162069 ) ) ( not ( = ?auto_162067 ?auto_162069 ) ) ( not ( = ?auto_162068 ?auto_162069 ) ) ( ON-TABLE ?auto_162069 ) ( ON ?auto_162062 ?auto_162070 ) ( not ( = ?auto_162062 ?auto_162070 ) ) ( not ( = ?auto_162063 ?auto_162070 ) ) ( not ( = ?auto_162064 ?auto_162070 ) ) ( not ( = ?auto_162065 ?auto_162070 ) ) ( not ( = ?auto_162066 ?auto_162070 ) ) ( not ( = ?auto_162067 ?auto_162070 ) ) ( not ( = ?auto_162068 ?auto_162070 ) ) ( not ( = ?auto_162069 ?auto_162070 ) ) ( ON ?auto_162063 ?auto_162062 ) ( ON-TABLE ?auto_162070 ) ( ON ?auto_162064 ?auto_162063 ) ( ON ?auto_162065 ?auto_162064 ) ( ON ?auto_162066 ?auto_162065 ) ( CLEAR ?auto_162066 ) ( HOLDING ?auto_162067 ) ( CLEAR ?auto_162068 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162069 ?auto_162068 ?auto_162067 )
      ( MAKE-7PILE ?auto_162062 ?auto_162063 ?auto_162064 ?auto_162065 ?auto_162066 ?auto_162067 ?auto_162068 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162071 - BLOCK
      ?auto_162072 - BLOCK
      ?auto_162073 - BLOCK
      ?auto_162074 - BLOCK
      ?auto_162075 - BLOCK
      ?auto_162076 - BLOCK
      ?auto_162077 - BLOCK
    )
    :vars
    (
      ?auto_162078 - BLOCK
      ?auto_162079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162071 ?auto_162072 ) ) ( not ( = ?auto_162071 ?auto_162073 ) ) ( not ( = ?auto_162071 ?auto_162074 ) ) ( not ( = ?auto_162071 ?auto_162075 ) ) ( not ( = ?auto_162071 ?auto_162076 ) ) ( not ( = ?auto_162071 ?auto_162077 ) ) ( not ( = ?auto_162072 ?auto_162073 ) ) ( not ( = ?auto_162072 ?auto_162074 ) ) ( not ( = ?auto_162072 ?auto_162075 ) ) ( not ( = ?auto_162072 ?auto_162076 ) ) ( not ( = ?auto_162072 ?auto_162077 ) ) ( not ( = ?auto_162073 ?auto_162074 ) ) ( not ( = ?auto_162073 ?auto_162075 ) ) ( not ( = ?auto_162073 ?auto_162076 ) ) ( not ( = ?auto_162073 ?auto_162077 ) ) ( not ( = ?auto_162074 ?auto_162075 ) ) ( not ( = ?auto_162074 ?auto_162076 ) ) ( not ( = ?auto_162074 ?auto_162077 ) ) ( not ( = ?auto_162075 ?auto_162076 ) ) ( not ( = ?auto_162075 ?auto_162077 ) ) ( not ( = ?auto_162076 ?auto_162077 ) ) ( ON ?auto_162077 ?auto_162078 ) ( not ( = ?auto_162071 ?auto_162078 ) ) ( not ( = ?auto_162072 ?auto_162078 ) ) ( not ( = ?auto_162073 ?auto_162078 ) ) ( not ( = ?auto_162074 ?auto_162078 ) ) ( not ( = ?auto_162075 ?auto_162078 ) ) ( not ( = ?auto_162076 ?auto_162078 ) ) ( not ( = ?auto_162077 ?auto_162078 ) ) ( ON-TABLE ?auto_162078 ) ( ON ?auto_162071 ?auto_162079 ) ( not ( = ?auto_162071 ?auto_162079 ) ) ( not ( = ?auto_162072 ?auto_162079 ) ) ( not ( = ?auto_162073 ?auto_162079 ) ) ( not ( = ?auto_162074 ?auto_162079 ) ) ( not ( = ?auto_162075 ?auto_162079 ) ) ( not ( = ?auto_162076 ?auto_162079 ) ) ( not ( = ?auto_162077 ?auto_162079 ) ) ( not ( = ?auto_162078 ?auto_162079 ) ) ( ON ?auto_162072 ?auto_162071 ) ( ON-TABLE ?auto_162079 ) ( ON ?auto_162073 ?auto_162072 ) ( ON ?auto_162074 ?auto_162073 ) ( ON ?auto_162075 ?auto_162074 ) ( CLEAR ?auto_162077 ) ( ON ?auto_162076 ?auto_162075 ) ( CLEAR ?auto_162076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162079 ?auto_162071 ?auto_162072 ?auto_162073 ?auto_162074 ?auto_162075 )
      ( MAKE-7PILE ?auto_162071 ?auto_162072 ?auto_162073 ?auto_162074 ?auto_162075 ?auto_162076 ?auto_162077 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162080 - BLOCK
      ?auto_162081 - BLOCK
      ?auto_162082 - BLOCK
      ?auto_162083 - BLOCK
      ?auto_162084 - BLOCK
      ?auto_162085 - BLOCK
      ?auto_162086 - BLOCK
    )
    :vars
    (
      ?auto_162088 - BLOCK
      ?auto_162087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162080 ?auto_162081 ) ) ( not ( = ?auto_162080 ?auto_162082 ) ) ( not ( = ?auto_162080 ?auto_162083 ) ) ( not ( = ?auto_162080 ?auto_162084 ) ) ( not ( = ?auto_162080 ?auto_162085 ) ) ( not ( = ?auto_162080 ?auto_162086 ) ) ( not ( = ?auto_162081 ?auto_162082 ) ) ( not ( = ?auto_162081 ?auto_162083 ) ) ( not ( = ?auto_162081 ?auto_162084 ) ) ( not ( = ?auto_162081 ?auto_162085 ) ) ( not ( = ?auto_162081 ?auto_162086 ) ) ( not ( = ?auto_162082 ?auto_162083 ) ) ( not ( = ?auto_162082 ?auto_162084 ) ) ( not ( = ?auto_162082 ?auto_162085 ) ) ( not ( = ?auto_162082 ?auto_162086 ) ) ( not ( = ?auto_162083 ?auto_162084 ) ) ( not ( = ?auto_162083 ?auto_162085 ) ) ( not ( = ?auto_162083 ?auto_162086 ) ) ( not ( = ?auto_162084 ?auto_162085 ) ) ( not ( = ?auto_162084 ?auto_162086 ) ) ( not ( = ?auto_162085 ?auto_162086 ) ) ( not ( = ?auto_162080 ?auto_162088 ) ) ( not ( = ?auto_162081 ?auto_162088 ) ) ( not ( = ?auto_162082 ?auto_162088 ) ) ( not ( = ?auto_162083 ?auto_162088 ) ) ( not ( = ?auto_162084 ?auto_162088 ) ) ( not ( = ?auto_162085 ?auto_162088 ) ) ( not ( = ?auto_162086 ?auto_162088 ) ) ( ON-TABLE ?auto_162088 ) ( ON ?auto_162080 ?auto_162087 ) ( not ( = ?auto_162080 ?auto_162087 ) ) ( not ( = ?auto_162081 ?auto_162087 ) ) ( not ( = ?auto_162082 ?auto_162087 ) ) ( not ( = ?auto_162083 ?auto_162087 ) ) ( not ( = ?auto_162084 ?auto_162087 ) ) ( not ( = ?auto_162085 ?auto_162087 ) ) ( not ( = ?auto_162086 ?auto_162087 ) ) ( not ( = ?auto_162088 ?auto_162087 ) ) ( ON ?auto_162081 ?auto_162080 ) ( ON-TABLE ?auto_162087 ) ( ON ?auto_162082 ?auto_162081 ) ( ON ?auto_162083 ?auto_162082 ) ( ON ?auto_162084 ?auto_162083 ) ( ON ?auto_162085 ?auto_162084 ) ( CLEAR ?auto_162085 ) ( HOLDING ?auto_162086 ) ( CLEAR ?auto_162088 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162088 ?auto_162086 )
      ( MAKE-7PILE ?auto_162080 ?auto_162081 ?auto_162082 ?auto_162083 ?auto_162084 ?auto_162085 ?auto_162086 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162089 - BLOCK
      ?auto_162090 - BLOCK
      ?auto_162091 - BLOCK
      ?auto_162092 - BLOCK
      ?auto_162093 - BLOCK
      ?auto_162094 - BLOCK
      ?auto_162095 - BLOCK
    )
    :vars
    (
      ?auto_162097 - BLOCK
      ?auto_162096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162089 ?auto_162090 ) ) ( not ( = ?auto_162089 ?auto_162091 ) ) ( not ( = ?auto_162089 ?auto_162092 ) ) ( not ( = ?auto_162089 ?auto_162093 ) ) ( not ( = ?auto_162089 ?auto_162094 ) ) ( not ( = ?auto_162089 ?auto_162095 ) ) ( not ( = ?auto_162090 ?auto_162091 ) ) ( not ( = ?auto_162090 ?auto_162092 ) ) ( not ( = ?auto_162090 ?auto_162093 ) ) ( not ( = ?auto_162090 ?auto_162094 ) ) ( not ( = ?auto_162090 ?auto_162095 ) ) ( not ( = ?auto_162091 ?auto_162092 ) ) ( not ( = ?auto_162091 ?auto_162093 ) ) ( not ( = ?auto_162091 ?auto_162094 ) ) ( not ( = ?auto_162091 ?auto_162095 ) ) ( not ( = ?auto_162092 ?auto_162093 ) ) ( not ( = ?auto_162092 ?auto_162094 ) ) ( not ( = ?auto_162092 ?auto_162095 ) ) ( not ( = ?auto_162093 ?auto_162094 ) ) ( not ( = ?auto_162093 ?auto_162095 ) ) ( not ( = ?auto_162094 ?auto_162095 ) ) ( not ( = ?auto_162089 ?auto_162097 ) ) ( not ( = ?auto_162090 ?auto_162097 ) ) ( not ( = ?auto_162091 ?auto_162097 ) ) ( not ( = ?auto_162092 ?auto_162097 ) ) ( not ( = ?auto_162093 ?auto_162097 ) ) ( not ( = ?auto_162094 ?auto_162097 ) ) ( not ( = ?auto_162095 ?auto_162097 ) ) ( ON-TABLE ?auto_162097 ) ( ON ?auto_162089 ?auto_162096 ) ( not ( = ?auto_162089 ?auto_162096 ) ) ( not ( = ?auto_162090 ?auto_162096 ) ) ( not ( = ?auto_162091 ?auto_162096 ) ) ( not ( = ?auto_162092 ?auto_162096 ) ) ( not ( = ?auto_162093 ?auto_162096 ) ) ( not ( = ?auto_162094 ?auto_162096 ) ) ( not ( = ?auto_162095 ?auto_162096 ) ) ( not ( = ?auto_162097 ?auto_162096 ) ) ( ON ?auto_162090 ?auto_162089 ) ( ON-TABLE ?auto_162096 ) ( ON ?auto_162091 ?auto_162090 ) ( ON ?auto_162092 ?auto_162091 ) ( ON ?auto_162093 ?auto_162092 ) ( ON ?auto_162094 ?auto_162093 ) ( CLEAR ?auto_162097 ) ( ON ?auto_162095 ?auto_162094 ) ( CLEAR ?auto_162095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162096 ?auto_162089 ?auto_162090 ?auto_162091 ?auto_162092 ?auto_162093 ?auto_162094 )
      ( MAKE-7PILE ?auto_162089 ?auto_162090 ?auto_162091 ?auto_162092 ?auto_162093 ?auto_162094 ?auto_162095 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162098 - BLOCK
      ?auto_162099 - BLOCK
      ?auto_162100 - BLOCK
      ?auto_162101 - BLOCK
      ?auto_162102 - BLOCK
      ?auto_162103 - BLOCK
      ?auto_162104 - BLOCK
    )
    :vars
    (
      ?auto_162106 - BLOCK
      ?auto_162105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162098 ?auto_162099 ) ) ( not ( = ?auto_162098 ?auto_162100 ) ) ( not ( = ?auto_162098 ?auto_162101 ) ) ( not ( = ?auto_162098 ?auto_162102 ) ) ( not ( = ?auto_162098 ?auto_162103 ) ) ( not ( = ?auto_162098 ?auto_162104 ) ) ( not ( = ?auto_162099 ?auto_162100 ) ) ( not ( = ?auto_162099 ?auto_162101 ) ) ( not ( = ?auto_162099 ?auto_162102 ) ) ( not ( = ?auto_162099 ?auto_162103 ) ) ( not ( = ?auto_162099 ?auto_162104 ) ) ( not ( = ?auto_162100 ?auto_162101 ) ) ( not ( = ?auto_162100 ?auto_162102 ) ) ( not ( = ?auto_162100 ?auto_162103 ) ) ( not ( = ?auto_162100 ?auto_162104 ) ) ( not ( = ?auto_162101 ?auto_162102 ) ) ( not ( = ?auto_162101 ?auto_162103 ) ) ( not ( = ?auto_162101 ?auto_162104 ) ) ( not ( = ?auto_162102 ?auto_162103 ) ) ( not ( = ?auto_162102 ?auto_162104 ) ) ( not ( = ?auto_162103 ?auto_162104 ) ) ( not ( = ?auto_162098 ?auto_162106 ) ) ( not ( = ?auto_162099 ?auto_162106 ) ) ( not ( = ?auto_162100 ?auto_162106 ) ) ( not ( = ?auto_162101 ?auto_162106 ) ) ( not ( = ?auto_162102 ?auto_162106 ) ) ( not ( = ?auto_162103 ?auto_162106 ) ) ( not ( = ?auto_162104 ?auto_162106 ) ) ( ON ?auto_162098 ?auto_162105 ) ( not ( = ?auto_162098 ?auto_162105 ) ) ( not ( = ?auto_162099 ?auto_162105 ) ) ( not ( = ?auto_162100 ?auto_162105 ) ) ( not ( = ?auto_162101 ?auto_162105 ) ) ( not ( = ?auto_162102 ?auto_162105 ) ) ( not ( = ?auto_162103 ?auto_162105 ) ) ( not ( = ?auto_162104 ?auto_162105 ) ) ( not ( = ?auto_162106 ?auto_162105 ) ) ( ON ?auto_162099 ?auto_162098 ) ( ON-TABLE ?auto_162105 ) ( ON ?auto_162100 ?auto_162099 ) ( ON ?auto_162101 ?auto_162100 ) ( ON ?auto_162102 ?auto_162101 ) ( ON ?auto_162103 ?auto_162102 ) ( ON ?auto_162104 ?auto_162103 ) ( CLEAR ?auto_162104 ) ( HOLDING ?auto_162106 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162106 )
      ( MAKE-7PILE ?auto_162098 ?auto_162099 ?auto_162100 ?auto_162101 ?auto_162102 ?auto_162103 ?auto_162104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_162107 - BLOCK
      ?auto_162108 - BLOCK
      ?auto_162109 - BLOCK
      ?auto_162110 - BLOCK
      ?auto_162111 - BLOCK
      ?auto_162112 - BLOCK
      ?auto_162113 - BLOCK
    )
    :vars
    (
      ?auto_162115 - BLOCK
      ?auto_162114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162107 ?auto_162108 ) ) ( not ( = ?auto_162107 ?auto_162109 ) ) ( not ( = ?auto_162107 ?auto_162110 ) ) ( not ( = ?auto_162107 ?auto_162111 ) ) ( not ( = ?auto_162107 ?auto_162112 ) ) ( not ( = ?auto_162107 ?auto_162113 ) ) ( not ( = ?auto_162108 ?auto_162109 ) ) ( not ( = ?auto_162108 ?auto_162110 ) ) ( not ( = ?auto_162108 ?auto_162111 ) ) ( not ( = ?auto_162108 ?auto_162112 ) ) ( not ( = ?auto_162108 ?auto_162113 ) ) ( not ( = ?auto_162109 ?auto_162110 ) ) ( not ( = ?auto_162109 ?auto_162111 ) ) ( not ( = ?auto_162109 ?auto_162112 ) ) ( not ( = ?auto_162109 ?auto_162113 ) ) ( not ( = ?auto_162110 ?auto_162111 ) ) ( not ( = ?auto_162110 ?auto_162112 ) ) ( not ( = ?auto_162110 ?auto_162113 ) ) ( not ( = ?auto_162111 ?auto_162112 ) ) ( not ( = ?auto_162111 ?auto_162113 ) ) ( not ( = ?auto_162112 ?auto_162113 ) ) ( not ( = ?auto_162107 ?auto_162115 ) ) ( not ( = ?auto_162108 ?auto_162115 ) ) ( not ( = ?auto_162109 ?auto_162115 ) ) ( not ( = ?auto_162110 ?auto_162115 ) ) ( not ( = ?auto_162111 ?auto_162115 ) ) ( not ( = ?auto_162112 ?auto_162115 ) ) ( not ( = ?auto_162113 ?auto_162115 ) ) ( ON ?auto_162107 ?auto_162114 ) ( not ( = ?auto_162107 ?auto_162114 ) ) ( not ( = ?auto_162108 ?auto_162114 ) ) ( not ( = ?auto_162109 ?auto_162114 ) ) ( not ( = ?auto_162110 ?auto_162114 ) ) ( not ( = ?auto_162111 ?auto_162114 ) ) ( not ( = ?auto_162112 ?auto_162114 ) ) ( not ( = ?auto_162113 ?auto_162114 ) ) ( not ( = ?auto_162115 ?auto_162114 ) ) ( ON ?auto_162108 ?auto_162107 ) ( ON-TABLE ?auto_162114 ) ( ON ?auto_162109 ?auto_162108 ) ( ON ?auto_162110 ?auto_162109 ) ( ON ?auto_162111 ?auto_162110 ) ( ON ?auto_162112 ?auto_162111 ) ( ON ?auto_162113 ?auto_162112 ) ( ON ?auto_162115 ?auto_162113 ) ( CLEAR ?auto_162115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162114 ?auto_162107 ?auto_162108 ?auto_162109 ?auto_162110 ?auto_162111 ?auto_162112 ?auto_162113 )
      ( MAKE-7PILE ?auto_162107 ?auto_162108 ?auto_162109 ?auto_162110 ?auto_162111 ?auto_162112 ?auto_162113 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162124 - BLOCK
      ?auto_162125 - BLOCK
      ?auto_162126 - BLOCK
      ?auto_162127 - BLOCK
      ?auto_162128 - BLOCK
      ?auto_162129 - BLOCK
      ?auto_162130 - BLOCK
      ?auto_162131 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_162131 ) ( CLEAR ?auto_162130 ) ( ON-TABLE ?auto_162124 ) ( ON ?auto_162125 ?auto_162124 ) ( ON ?auto_162126 ?auto_162125 ) ( ON ?auto_162127 ?auto_162126 ) ( ON ?auto_162128 ?auto_162127 ) ( ON ?auto_162129 ?auto_162128 ) ( ON ?auto_162130 ?auto_162129 ) ( not ( = ?auto_162124 ?auto_162125 ) ) ( not ( = ?auto_162124 ?auto_162126 ) ) ( not ( = ?auto_162124 ?auto_162127 ) ) ( not ( = ?auto_162124 ?auto_162128 ) ) ( not ( = ?auto_162124 ?auto_162129 ) ) ( not ( = ?auto_162124 ?auto_162130 ) ) ( not ( = ?auto_162124 ?auto_162131 ) ) ( not ( = ?auto_162125 ?auto_162126 ) ) ( not ( = ?auto_162125 ?auto_162127 ) ) ( not ( = ?auto_162125 ?auto_162128 ) ) ( not ( = ?auto_162125 ?auto_162129 ) ) ( not ( = ?auto_162125 ?auto_162130 ) ) ( not ( = ?auto_162125 ?auto_162131 ) ) ( not ( = ?auto_162126 ?auto_162127 ) ) ( not ( = ?auto_162126 ?auto_162128 ) ) ( not ( = ?auto_162126 ?auto_162129 ) ) ( not ( = ?auto_162126 ?auto_162130 ) ) ( not ( = ?auto_162126 ?auto_162131 ) ) ( not ( = ?auto_162127 ?auto_162128 ) ) ( not ( = ?auto_162127 ?auto_162129 ) ) ( not ( = ?auto_162127 ?auto_162130 ) ) ( not ( = ?auto_162127 ?auto_162131 ) ) ( not ( = ?auto_162128 ?auto_162129 ) ) ( not ( = ?auto_162128 ?auto_162130 ) ) ( not ( = ?auto_162128 ?auto_162131 ) ) ( not ( = ?auto_162129 ?auto_162130 ) ) ( not ( = ?auto_162129 ?auto_162131 ) ) ( not ( = ?auto_162130 ?auto_162131 ) ) )
    :subtasks
    ( ( !STACK ?auto_162131 ?auto_162130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162132 - BLOCK
      ?auto_162133 - BLOCK
      ?auto_162134 - BLOCK
      ?auto_162135 - BLOCK
      ?auto_162136 - BLOCK
      ?auto_162137 - BLOCK
      ?auto_162138 - BLOCK
      ?auto_162139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162138 ) ( ON-TABLE ?auto_162132 ) ( ON ?auto_162133 ?auto_162132 ) ( ON ?auto_162134 ?auto_162133 ) ( ON ?auto_162135 ?auto_162134 ) ( ON ?auto_162136 ?auto_162135 ) ( ON ?auto_162137 ?auto_162136 ) ( ON ?auto_162138 ?auto_162137 ) ( not ( = ?auto_162132 ?auto_162133 ) ) ( not ( = ?auto_162132 ?auto_162134 ) ) ( not ( = ?auto_162132 ?auto_162135 ) ) ( not ( = ?auto_162132 ?auto_162136 ) ) ( not ( = ?auto_162132 ?auto_162137 ) ) ( not ( = ?auto_162132 ?auto_162138 ) ) ( not ( = ?auto_162132 ?auto_162139 ) ) ( not ( = ?auto_162133 ?auto_162134 ) ) ( not ( = ?auto_162133 ?auto_162135 ) ) ( not ( = ?auto_162133 ?auto_162136 ) ) ( not ( = ?auto_162133 ?auto_162137 ) ) ( not ( = ?auto_162133 ?auto_162138 ) ) ( not ( = ?auto_162133 ?auto_162139 ) ) ( not ( = ?auto_162134 ?auto_162135 ) ) ( not ( = ?auto_162134 ?auto_162136 ) ) ( not ( = ?auto_162134 ?auto_162137 ) ) ( not ( = ?auto_162134 ?auto_162138 ) ) ( not ( = ?auto_162134 ?auto_162139 ) ) ( not ( = ?auto_162135 ?auto_162136 ) ) ( not ( = ?auto_162135 ?auto_162137 ) ) ( not ( = ?auto_162135 ?auto_162138 ) ) ( not ( = ?auto_162135 ?auto_162139 ) ) ( not ( = ?auto_162136 ?auto_162137 ) ) ( not ( = ?auto_162136 ?auto_162138 ) ) ( not ( = ?auto_162136 ?auto_162139 ) ) ( not ( = ?auto_162137 ?auto_162138 ) ) ( not ( = ?auto_162137 ?auto_162139 ) ) ( not ( = ?auto_162138 ?auto_162139 ) ) ( ON-TABLE ?auto_162139 ) ( CLEAR ?auto_162139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_162139 )
      ( MAKE-8PILE ?auto_162132 ?auto_162133 ?auto_162134 ?auto_162135 ?auto_162136 ?auto_162137 ?auto_162138 ?auto_162139 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162140 - BLOCK
      ?auto_162141 - BLOCK
      ?auto_162142 - BLOCK
      ?auto_162143 - BLOCK
      ?auto_162144 - BLOCK
      ?auto_162145 - BLOCK
      ?auto_162146 - BLOCK
      ?auto_162147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162140 ) ( ON ?auto_162141 ?auto_162140 ) ( ON ?auto_162142 ?auto_162141 ) ( ON ?auto_162143 ?auto_162142 ) ( ON ?auto_162144 ?auto_162143 ) ( ON ?auto_162145 ?auto_162144 ) ( not ( = ?auto_162140 ?auto_162141 ) ) ( not ( = ?auto_162140 ?auto_162142 ) ) ( not ( = ?auto_162140 ?auto_162143 ) ) ( not ( = ?auto_162140 ?auto_162144 ) ) ( not ( = ?auto_162140 ?auto_162145 ) ) ( not ( = ?auto_162140 ?auto_162146 ) ) ( not ( = ?auto_162140 ?auto_162147 ) ) ( not ( = ?auto_162141 ?auto_162142 ) ) ( not ( = ?auto_162141 ?auto_162143 ) ) ( not ( = ?auto_162141 ?auto_162144 ) ) ( not ( = ?auto_162141 ?auto_162145 ) ) ( not ( = ?auto_162141 ?auto_162146 ) ) ( not ( = ?auto_162141 ?auto_162147 ) ) ( not ( = ?auto_162142 ?auto_162143 ) ) ( not ( = ?auto_162142 ?auto_162144 ) ) ( not ( = ?auto_162142 ?auto_162145 ) ) ( not ( = ?auto_162142 ?auto_162146 ) ) ( not ( = ?auto_162142 ?auto_162147 ) ) ( not ( = ?auto_162143 ?auto_162144 ) ) ( not ( = ?auto_162143 ?auto_162145 ) ) ( not ( = ?auto_162143 ?auto_162146 ) ) ( not ( = ?auto_162143 ?auto_162147 ) ) ( not ( = ?auto_162144 ?auto_162145 ) ) ( not ( = ?auto_162144 ?auto_162146 ) ) ( not ( = ?auto_162144 ?auto_162147 ) ) ( not ( = ?auto_162145 ?auto_162146 ) ) ( not ( = ?auto_162145 ?auto_162147 ) ) ( not ( = ?auto_162146 ?auto_162147 ) ) ( ON-TABLE ?auto_162147 ) ( CLEAR ?auto_162147 ) ( HOLDING ?auto_162146 ) ( CLEAR ?auto_162145 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162140 ?auto_162141 ?auto_162142 ?auto_162143 ?auto_162144 ?auto_162145 ?auto_162146 )
      ( MAKE-8PILE ?auto_162140 ?auto_162141 ?auto_162142 ?auto_162143 ?auto_162144 ?auto_162145 ?auto_162146 ?auto_162147 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162148 - BLOCK
      ?auto_162149 - BLOCK
      ?auto_162150 - BLOCK
      ?auto_162151 - BLOCK
      ?auto_162152 - BLOCK
      ?auto_162153 - BLOCK
      ?auto_162154 - BLOCK
      ?auto_162155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162148 ) ( ON ?auto_162149 ?auto_162148 ) ( ON ?auto_162150 ?auto_162149 ) ( ON ?auto_162151 ?auto_162150 ) ( ON ?auto_162152 ?auto_162151 ) ( ON ?auto_162153 ?auto_162152 ) ( not ( = ?auto_162148 ?auto_162149 ) ) ( not ( = ?auto_162148 ?auto_162150 ) ) ( not ( = ?auto_162148 ?auto_162151 ) ) ( not ( = ?auto_162148 ?auto_162152 ) ) ( not ( = ?auto_162148 ?auto_162153 ) ) ( not ( = ?auto_162148 ?auto_162154 ) ) ( not ( = ?auto_162148 ?auto_162155 ) ) ( not ( = ?auto_162149 ?auto_162150 ) ) ( not ( = ?auto_162149 ?auto_162151 ) ) ( not ( = ?auto_162149 ?auto_162152 ) ) ( not ( = ?auto_162149 ?auto_162153 ) ) ( not ( = ?auto_162149 ?auto_162154 ) ) ( not ( = ?auto_162149 ?auto_162155 ) ) ( not ( = ?auto_162150 ?auto_162151 ) ) ( not ( = ?auto_162150 ?auto_162152 ) ) ( not ( = ?auto_162150 ?auto_162153 ) ) ( not ( = ?auto_162150 ?auto_162154 ) ) ( not ( = ?auto_162150 ?auto_162155 ) ) ( not ( = ?auto_162151 ?auto_162152 ) ) ( not ( = ?auto_162151 ?auto_162153 ) ) ( not ( = ?auto_162151 ?auto_162154 ) ) ( not ( = ?auto_162151 ?auto_162155 ) ) ( not ( = ?auto_162152 ?auto_162153 ) ) ( not ( = ?auto_162152 ?auto_162154 ) ) ( not ( = ?auto_162152 ?auto_162155 ) ) ( not ( = ?auto_162153 ?auto_162154 ) ) ( not ( = ?auto_162153 ?auto_162155 ) ) ( not ( = ?auto_162154 ?auto_162155 ) ) ( ON-TABLE ?auto_162155 ) ( CLEAR ?auto_162153 ) ( ON ?auto_162154 ?auto_162155 ) ( CLEAR ?auto_162154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162155 )
      ( MAKE-8PILE ?auto_162148 ?auto_162149 ?auto_162150 ?auto_162151 ?auto_162152 ?auto_162153 ?auto_162154 ?auto_162155 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162156 - BLOCK
      ?auto_162157 - BLOCK
      ?auto_162158 - BLOCK
      ?auto_162159 - BLOCK
      ?auto_162160 - BLOCK
      ?auto_162161 - BLOCK
      ?auto_162162 - BLOCK
      ?auto_162163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162156 ) ( ON ?auto_162157 ?auto_162156 ) ( ON ?auto_162158 ?auto_162157 ) ( ON ?auto_162159 ?auto_162158 ) ( ON ?auto_162160 ?auto_162159 ) ( not ( = ?auto_162156 ?auto_162157 ) ) ( not ( = ?auto_162156 ?auto_162158 ) ) ( not ( = ?auto_162156 ?auto_162159 ) ) ( not ( = ?auto_162156 ?auto_162160 ) ) ( not ( = ?auto_162156 ?auto_162161 ) ) ( not ( = ?auto_162156 ?auto_162162 ) ) ( not ( = ?auto_162156 ?auto_162163 ) ) ( not ( = ?auto_162157 ?auto_162158 ) ) ( not ( = ?auto_162157 ?auto_162159 ) ) ( not ( = ?auto_162157 ?auto_162160 ) ) ( not ( = ?auto_162157 ?auto_162161 ) ) ( not ( = ?auto_162157 ?auto_162162 ) ) ( not ( = ?auto_162157 ?auto_162163 ) ) ( not ( = ?auto_162158 ?auto_162159 ) ) ( not ( = ?auto_162158 ?auto_162160 ) ) ( not ( = ?auto_162158 ?auto_162161 ) ) ( not ( = ?auto_162158 ?auto_162162 ) ) ( not ( = ?auto_162158 ?auto_162163 ) ) ( not ( = ?auto_162159 ?auto_162160 ) ) ( not ( = ?auto_162159 ?auto_162161 ) ) ( not ( = ?auto_162159 ?auto_162162 ) ) ( not ( = ?auto_162159 ?auto_162163 ) ) ( not ( = ?auto_162160 ?auto_162161 ) ) ( not ( = ?auto_162160 ?auto_162162 ) ) ( not ( = ?auto_162160 ?auto_162163 ) ) ( not ( = ?auto_162161 ?auto_162162 ) ) ( not ( = ?auto_162161 ?auto_162163 ) ) ( not ( = ?auto_162162 ?auto_162163 ) ) ( ON-TABLE ?auto_162163 ) ( ON ?auto_162162 ?auto_162163 ) ( CLEAR ?auto_162162 ) ( HOLDING ?auto_162161 ) ( CLEAR ?auto_162160 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162156 ?auto_162157 ?auto_162158 ?auto_162159 ?auto_162160 ?auto_162161 )
      ( MAKE-8PILE ?auto_162156 ?auto_162157 ?auto_162158 ?auto_162159 ?auto_162160 ?auto_162161 ?auto_162162 ?auto_162163 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162164 - BLOCK
      ?auto_162165 - BLOCK
      ?auto_162166 - BLOCK
      ?auto_162167 - BLOCK
      ?auto_162168 - BLOCK
      ?auto_162169 - BLOCK
      ?auto_162170 - BLOCK
      ?auto_162171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162164 ) ( ON ?auto_162165 ?auto_162164 ) ( ON ?auto_162166 ?auto_162165 ) ( ON ?auto_162167 ?auto_162166 ) ( ON ?auto_162168 ?auto_162167 ) ( not ( = ?auto_162164 ?auto_162165 ) ) ( not ( = ?auto_162164 ?auto_162166 ) ) ( not ( = ?auto_162164 ?auto_162167 ) ) ( not ( = ?auto_162164 ?auto_162168 ) ) ( not ( = ?auto_162164 ?auto_162169 ) ) ( not ( = ?auto_162164 ?auto_162170 ) ) ( not ( = ?auto_162164 ?auto_162171 ) ) ( not ( = ?auto_162165 ?auto_162166 ) ) ( not ( = ?auto_162165 ?auto_162167 ) ) ( not ( = ?auto_162165 ?auto_162168 ) ) ( not ( = ?auto_162165 ?auto_162169 ) ) ( not ( = ?auto_162165 ?auto_162170 ) ) ( not ( = ?auto_162165 ?auto_162171 ) ) ( not ( = ?auto_162166 ?auto_162167 ) ) ( not ( = ?auto_162166 ?auto_162168 ) ) ( not ( = ?auto_162166 ?auto_162169 ) ) ( not ( = ?auto_162166 ?auto_162170 ) ) ( not ( = ?auto_162166 ?auto_162171 ) ) ( not ( = ?auto_162167 ?auto_162168 ) ) ( not ( = ?auto_162167 ?auto_162169 ) ) ( not ( = ?auto_162167 ?auto_162170 ) ) ( not ( = ?auto_162167 ?auto_162171 ) ) ( not ( = ?auto_162168 ?auto_162169 ) ) ( not ( = ?auto_162168 ?auto_162170 ) ) ( not ( = ?auto_162168 ?auto_162171 ) ) ( not ( = ?auto_162169 ?auto_162170 ) ) ( not ( = ?auto_162169 ?auto_162171 ) ) ( not ( = ?auto_162170 ?auto_162171 ) ) ( ON-TABLE ?auto_162171 ) ( ON ?auto_162170 ?auto_162171 ) ( CLEAR ?auto_162168 ) ( ON ?auto_162169 ?auto_162170 ) ( CLEAR ?auto_162169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162171 ?auto_162170 )
      ( MAKE-8PILE ?auto_162164 ?auto_162165 ?auto_162166 ?auto_162167 ?auto_162168 ?auto_162169 ?auto_162170 ?auto_162171 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162172 - BLOCK
      ?auto_162173 - BLOCK
      ?auto_162174 - BLOCK
      ?auto_162175 - BLOCK
      ?auto_162176 - BLOCK
      ?auto_162177 - BLOCK
      ?auto_162178 - BLOCK
      ?auto_162179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162172 ) ( ON ?auto_162173 ?auto_162172 ) ( ON ?auto_162174 ?auto_162173 ) ( ON ?auto_162175 ?auto_162174 ) ( not ( = ?auto_162172 ?auto_162173 ) ) ( not ( = ?auto_162172 ?auto_162174 ) ) ( not ( = ?auto_162172 ?auto_162175 ) ) ( not ( = ?auto_162172 ?auto_162176 ) ) ( not ( = ?auto_162172 ?auto_162177 ) ) ( not ( = ?auto_162172 ?auto_162178 ) ) ( not ( = ?auto_162172 ?auto_162179 ) ) ( not ( = ?auto_162173 ?auto_162174 ) ) ( not ( = ?auto_162173 ?auto_162175 ) ) ( not ( = ?auto_162173 ?auto_162176 ) ) ( not ( = ?auto_162173 ?auto_162177 ) ) ( not ( = ?auto_162173 ?auto_162178 ) ) ( not ( = ?auto_162173 ?auto_162179 ) ) ( not ( = ?auto_162174 ?auto_162175 ) ) ( not ( = ?auto_162174 ?auto_162176 ) ) ( not ( = ?auto_162174 ?auto_162177 ) ) ( not ( = ?auto_162174 ?auto_162178 ) ) ( not ( = ?auto_162174 ?auto_162179 ) ) ( not ( = ?auto_162175 ?auto_162176 ) ) ( not ( = ?auto_162175 ?auto_162177 ) ) ( not ( = ?auto_162175 ?auto_162178 ) ) ( not ( = ?auto_162175 ?auto_162179 ) ) ( not ( = ?auto_162176 ?auto_162177 ) ) ( not ( = ?auto_162176 ?auto_162178 ) ) ( not ( = ?auto_162176 ?auto_162179 ) ) ( not ( = ?auto_162177 ?auto_162178 ) ) ( not ( = ?auto_162177 ?auto_162179 ) ) ( not ( = ?auto_162178 ?auto_162179 ) ) ( ON-TABLE ?auto_162179 ) ( ON ?auto_162178 ?auto_162179 ) ( ON ?auto_162177 ?auto_162178 ) ( CLEAR ?auto_162177 ) ( HOLDING ?auto_162176 ) ( CLEAR ?auto_162175 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162172 ?auto_162173 ?auto_162174 ?auto_162175 ?auto_162176 )
      ( MAKE-8PILE ?auto_162172 ?auto_162173 ?auto_162174 ?auto_162175 ?auto_162176 ?auto_162177 ?auto_162178 ?auto_162179 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162180 - BLOCK
      ?auto_162181 - BLOCK
      ?auto_162182 - BLOCK
      ?auto_162183 - BLOCK
      ?auto_162184 - BLOCK
      ?auto_162185 - BLOCK
      ?auto_162186 - BLOCK
      ?auto_162187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162180 ) ( ON ?auto_162181 ?auto_162180 ) ( ON ?auto_162182 ?auto_162181 ) ( ON ?auto_162183 ?auto_162182 ) ( not ( = ?auto_162180 ?auto_162181 ) ) ( not ( = ?auto_162180 ?auto_162182 ) ) ( not ( = ?auto_162180 ?auto_162183 ) ) ( not ( = ?auto_162180 ?auto_162184 ) ) ( not ( = ?auto_162180 ?auto_162185 ) ) ( not ( = ?auto_162180 ?auto_162186 ) ) ( not ( = ?auto_162180 ?auto_162187 ) ) ( not ( = ?auto_162181 ?auto_162182 ) ) ( not ( = ?auto_162181 ?auto_162183 ) ) ( not ( = ?auto_162181 ?auto_162184 ) ) ( not ( = ?auto_162181 ?auto_162185 ) ) ( not ( = ?auto_162181 ?auto_162186 ) ) ( not ( = ?auto_162181 ?auto_162187 ) ) ( not ( = ?auto_162182 ?auto_162183 ) ) ( not ( = ?auto_162182 ?auto_162184 ) ) ( not ( = ?auto_162182 ?auto_162185 ) ) ( not ( = ?auto_162182 ?auto_162186 ) ) ( not ( = ?auto_162182 ?auto_162187 ) ) ( not ( = ?auto_162183 ?auto_162184 ) ) ( not ( = ?auto_162183 ?auto_162185 ) ) ( not ( = ?auto_162183 ?auto_162186 ) ) ( not ( = ?auto_162183 ?auto_162187 ) ) ( not ( = ?auto_162184 ?auto_162185 ) ) ( not ( = ?auto_162184 ?auto_162186 ) ) ( not ( = ?auto_162184 ?auto_162187 ) ) ( not ( = ?auto_162185 ?auto_162186 ) ) ( not ( = ?auto_162185 ?auto_162187 ) ) ( not ( = ?auto_162186 ?auto_162187 ) ) ( ON-TABLE ?auto_162187 ) ( ON ?auto_162186 ?auto_162187 ) ( ON ?auto_162185 ?auto_162186 ) ( CLEAR ?auto_162183 ) ( ON ?auto_162184 ?auto_162185 ) ( CLEAR ?auto_162184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162187 ?auto_162186 ?auto_162185 )
      ( MAKE-8PILE ?auto_162180 ?auto_162181 ?auto_162182 ?auto_162183 ?auto_162184 ?auto_162185 ?auto_162186 ?auto_162187 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162188 - BLOCK
      ?auto_162189 - BLOCK
      ?auto_162190 - BLOCK
      ?auto_162191 - BLOCK
      ?auto_162192 - BLOCK
      ?auto_162193 - BLOCK
      ?auto_162194 - BLOCK
      ?auto_162195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162188 ) ( ON ?auto_162189 ?auto_162188 ) ( ON ?auto_162190 ?auto_162189 ) ( not ( = ?auto_162188 ?auto_162189 ) ) ( not ( = ?auto_162188 ?auto_162190 ) ) ( not ( = ?auto_162188 ?auto_162191 ) ) ( not ( = ?auto_162188 ?auto_162192 ) ) ( not ( = ?auto_162188 ?auto_162193 ) ) ( not ( = ?auto_162188 ?auto_162194 ) ) ( not ( = ?auto_162188 ?auto_162195 ) ) ( not ( = ?auto_162189 ?auto_162190 ) ) ( not ( = ?auto_162189 ?auto_162191 ) ) ( not ( = ?auto_162189 ?auto_162192 ) ) ( not ( = ?auto_162189 ?auto_162193 ) ) ( not ( = ?auto_162189 ?auto_162194 ) ) ( not ( = ?auto_162189 ?auto_162195 ) ) ( not ( = ?auto_162190 ?auto_162191 ) ) ( not ( = ?auto_162190 ?auto_162192 ) ) ( not ( = ?auto_162190 ?auto_162193 ) ) ( not ( = ?auto_162190 ?auto_162194 ) ) ( not ( = ?auto_162190 ?auto_162195 ) ) ( not ( = ?auto_162191 ?auto_162192 ) ) ( not ( = ?auto_162191 ?auto_162193 ) ) ( not ( = ?auto_162191 ?auto_162194 ) ) ( not ( = ?auto_162191 ?auto_162195 ) ) ( not ( = ?auto_162192 ?auto_162193 ) ) ( not ( = ?auto_162192 ?auto_162194 ) ) ( not ( = ?auto_162192 ?auto_162195 ) ) ( not ( = ?auto_162193 ?auto_162194 ) ) ( not ( = ?auto_162193 ?auto_162195 ) ) ( not ( = ?auto_162194 ?auto_162195 ) ) ( ON-TABLE ?auto_162195 ) ( ON ?auto_162194 ?auto_162195 ) ( ON ?auto_162193 ?auto_162194 ) ( ON ?auto_162192 ?auto_162193 ) ( CLEAR ?auto_162192 ) ( HOLDING ?auto_162191 ) ( CLEAR ?auto_162190 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162188 ?auto_162189 ?auto_162190 ?auto_162191 )
      ( MAKE-8PILE ?auto_162188 ?auto_162189 ?auto_162190 ?auto_162191 ?auto_162192 ?auto_162193 ?auto_162194 ?auto_162195 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162196 - BLOCK
      ?auto_162197 - BLOCK
      ?auto_162198 - BLOCK
      ?auto_162199 - BLOCK
      ?auto_162200 - BLOCK
      ?auto_162201 - BLOCK
      ?auto_162202 - BLOCK
      ?auto_162203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162196 ) ( ON ?auto_162197 ?auto_162196 ) ( ON ?auto_162198 ?auto_162197 ) ( not ( = ?auto_162196 ?auto_162197 ) ) ( not ( = ?auto_162196 ?auto_162198 ) ) ( not ( = ?auto_162196 ?auto_162199 ) ) ( not ( = ?auto_162196 ?auto_162200 ) ) ( not ( = ?auto_162196 ?auto_162201 ) ) ( not ( = ?auto_162196 ?auto_162202 ) ) ( not ( = ?auto_162196 ?auto_162203 ) ) ( not ( = ?auto_162197 ?auto_162198 ) ) ( not ( = ?auto_162197 ?auto_162199 ) ) ( not ( = ?auto_162197 ?auto_162200 ) ) ( not ( = ?auto_162197 ?auto_162201 ) ) ( not ( = ?auto_162197 ?auto_162202 ) ) ( not ( = ?auto_162197 ?auto_162203 ) ) ( not ( = ?auto_162198 ?auto_162199 ) ) ( not ( = ?auto_162198 ?auto_162200 ) ) ( not ( = ?auto_162198 ?auto_162201 ) ) ( not ( = ?auto_162198 ?auto_162202 ) ) ( not ( = ?auto_162198 ?auto_162203 ) ) ( not ( = ?auto_162199 ?auto_162200 ) ) ( not ( = ?auto_162199 ?auto_162201 ) ) ( not ( = ?auto_162199 ?auto_162202 ) ) ( not ( = ?auto_162199 ?auto_162203 ) ) ( not ( = ?auto_162200 ?auto_162201 ) ) ( not ( = ?auto_162200 ?auto_162202 ) ) ( not ( = ?auto_162200 ?auto_162203 ) ) ( not ( = ?auto_162201 ?auto_162202 ) ) ( not ( = ?auto_162201 ?auto_162203 ) ) ( not ( = ?auto_162202 ?auto_162203 ) ) ( ON-TABLE ?auto_162203 ) ( ON ?auto_162202 ?auto_162203 ) ( ON ?auto_162201 ?auto_162202 ) ( ON ?auto_162200 ?auto_162201 ) ( CLEAR ?auto_162198 ) ( ON ?auto_162199 ?auto_162200 ) ( CLEAR ?auto_162199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162203 ?auto_162202 ?auto_162201 ?auto_162200 )
      ( MAKE-8PILE ?auto_162196 ?auto_162197 ?auto_162198 ?auto_162199 ?auto_162200 ?auto_162201 ?auto_162202 ?auto_162203 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162204 - BLOCK
      ?auto_162205 - BLOCK
      ?auto_162206 - BLOCK
      ?auto_162207 - BLOCK
      ?auto_162208 - BLOCK
      ?auto_162209 - BLOCK
      ?auto_162210 - BLOCK
      ?auto_162211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162204 ) ( ON ?auto_162205 ?auto_162204 ) ( not ( = ?auto_162204 ?auto_162205 ) ) ( not ( = ?auto_162204 ?auto_162206 ) ) ( not ( = ?auto_162204 ?auto_162207 ) ) ( not ( = ?auto_162204 ?auto_162208 ) ) ( not ( = ?auto_162204 ?auto_162209 ) ) ( not ( = ?auto_162204 ?auto_162210 ) ) ( not ( = ?auto_162204 ?auto_162211 ) ) ( not ( = ?auto_162205 ?auto_162206 ) ) ( not ( = ?auto_162205 ?auto_162207 ) ) ( not ( = ?auto_162205 ?auto_162208 ) ) ( not ( = ?auto_162205 ?auto_162209 ) ) ( not ( = ?auto_162205 ?auto_162210 ) ) ( not ( = ?auto_162205 ?auto_162211 ) ) ( not ( = ?auto_162206 ?auto_162207 ) ) ( not ( = ?auto_162206 ?auto_162208 ) ) ( not ( = ?auto_162206 ?auto_162209 ) ) ( not ( = ?auto_162206 ?auto_162210 ) ) ( not ( = ?auto_162206 ?auto_162211 ) ) ( not ( = ?auto_162207 ?auto_162208 ) ) ( not ( = ?auto_162207 ?auto_162209 ) ) ( not ( = ?auto_162207 ?auto_162210 ) ) ( not ( = ?auto_162207 ?auto_162211 ) ) ( not ( = ?auto_162208 ?auto_162209 ) ) ( not ( = ?auto_162208 ?auto_162210 ) ) ( not ( = ?auto_162208 ?auto_162211 ) ) ( not ( = ?auto_162209 ?auto_162210 ) ) ( not ( = ?auto_162209 ?auto_162211 ) ) ( not ( = ?auto_162210 ?auto_162211 ) ) ( ON-TABLE ?auto_162211 ) ( ON ?auto_162210 ?auto_162211 ) ( ON ?auto_162209 ?auto_162210 ) ( ON ?auto_162208 ?auto_162209 ) ( ON ?auto_162207 ?auto_162208 ) ( CLEAR ?auto_162207 ) ( HOLDING ?auto_162206 ) ( CLEAR ?auto_162205 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162204 ?auto_162205 ?auto_162206 )
      ( MAKE-8PILE ?auto_162204 ?auto_162205 ?auto_162206 ?auto_162207 ?auto_162208 ?auto_162209 ?auto_162210 ?auto_162211 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162212 - BLOCK
      ?auto_162213 - BLOCK
      ?auto_162214 - BLOCK
      ?auto_162215 - BLOCK
      ?auto_162216 - BLOCK
      ?auto_162217 - BLOCK
      ?auto_162218 - BLOCK
      ?auto_162219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162212 ) ( ON ?auto_162213 ?auto_162212 ) ( not ( = ?auto_162212 ?auto_162213 ) ) ( not ( = ?auto_162212 ?auto_162214 ) ) ( not ( = ?auto_162212 ?auto_162215 ) ) ( not ( = ?auto_162212 ?auto_162216 ) ) ( not ( = ?auto_162212 ?auto_162217 ) ) ( not ( = ?auto_162212 ?auto_162218 ) ) ( not ( = ?auto_162212 ?auto_162219 ) ) ( not ( = ?auto_162213 ?auto_162214 ) ) ( not ( = ?auto_162213 ?auto_162215 ) ) ( not ( = ?auto_162213 ?auto_162216 ) ) ( not ( = ?auto_162213 ?auto_162217 ) ) ( not ( = ?auto_162213 ?auto_162218 ) ) ( not ( = ?auto_162213 ?auto_162219 ) ) ( not ( = ?auto_162214 ?auto_162215 ) ) ( not ( = ?auto_162214 ?auto_162216 ) ) ( not ( = ?auto_162214 ?auto_162217 ) ) ( not ( = ?auto_162214 ?auto_162218 ) ) ( not ( = ?auto_162214 ?auto_162219 ) ) ( not ( = ?auto_162215 ?auto_162216 ) ) ( not ( = ?auto_162215 ?auto_162217 ) ) ( not ( = ?auto_162215 ?auto_162218 ) ) ( not ( = ?auto_162215 ?auto_162219 ) ) ( not ( = ?auto_162216 ?auto_162217 ) ) ( not ( = ?auto_162216 ?auto_162218 ) ) ( not ( = ?auto_162216 ?auto_162219 ) ) ( not ( = ?auto_162217 ?auto_162218 ) ) ( not ( = ?auto_162217 ?auto_162219 ) ) ( not ( = ?auto_162218 ?auto_162219 ) ) ( ON-TABLE ?auto_162219 ) ( ON ?auto_162218 ?auto_162219 ) ( ON ?auto_162217 ?auto_162218 ) ( ON ?auto_162216 ?auto_162217 ) ( ON ?auto_162215 ?auto_162216 ) ( CLEAR ?auto_162213 ) ( ON ?auto_162214 ?auto_162215 ) ( CLEAR ?auto_162214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162219 ?auto_162218 ?auto_162217 ?auto_162216 ?auto_162215 )
      ( MAKE-8PILE ?auto_162212 ?auto_162213 ?auto_162214 ?auto_162215 ?auto_162216 ?auto_162217 ?auto_162218 ?auto_162219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162220 - BLOCK
      ?auto_162221 - BLOCK
      ?auto_162222 - BLOCK
      ?auto_162223 - BLOCK
      ?auto_162224 - BLOCK
      ?auto_162225 - BLOCK
      ?auto_162226 - BLOCK
      ?auto_162227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162220 ) ( not ( = ?auto_162220 ?auto_162221 ) ) ( not ( = ?auto_162220 ?auto_162222 ) ) ( not ( = ?auto_162220 ?auto_162223 ) ) ( not ( = ?auto_162220 ?auto_162224 ) ) ( not ( = ?auto_162220 ?auto_162225 ) ) ( not ( = ?auto_162220 ?auto_162226 ) ) ( not ( = ?auto_162220 ?auto_162227 ) ) ( not ( = ?auto_162221 ?auto_162222 ) ) ( not ( = ?auto_162221 ?auto_162223 ) ) ( not ( = ?auto_162221 ?auto_162224 ) ) ( not ( = ?auto_162221 ?auto_162225 ) ) ( not ( = ?auto_162221 ?auto_162226 ) ) ( not ( = ?auto_162221 ?auto_162227 ) ) ( not ( = ?auto_162222 ?auto_162223 ) ) ( not ( = ?auto_162222 ?auto_162224 ) ) ( not ( = ?auto_162222 ?auto_162225 ) ) ( not ( = ?auto_162222 ?auto_162226 ) ) ( not ( = ?auto_162222 ?auto_162227 ) ) ( not ( = ?auto_162223 ?auto_162224 ) ) ( not ( = ?auto_162223 ?auto_162225 ) ) ( not ( = ?auto_162223 ?auto_162226 ) ) ( not ( = ?auto_162223 ?auto_162227 ) ) ( not ( = ?auto_162224 ?auto_162225 ) ) ( not ( = ?auto_162224 ?auto_162226 ) ) ( not ( = ?auto_162224 ?auto_162227 ) ) ( not ( = ?auto_162225 ?auto_162226 ) ) ( not ( = ?auto_162225 ?auto_162227 ) ) ( not ( = ?auto_162226 ?auto_162227 ) ) ( ON-TABLE ?auto_162227 ) ( ON ?auto_162226 ?auto_162227 ) ( ON ?auto_162225 ?auto_162226 ) ( ON ?auto_162224 ?auto_162225 ) ( ON ?auto_162223 ?auto_162224 ) ( ON ?auto_162222 ?auto_162223 ) ( CLEAR ?auto_162222 ) ( HOLDING ?auto_162221 ) ( CLEAR ?auto_162220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162220 ?auto_162221 )
      ( MAKE-8PILE ?auto_162220 ?auto_162221 ?auto_162222 ?auto_162223 ?auto_162224 ?auto_162225 ?auto_162226 ?auto_162227 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162228 - BLOCK
      ?auto_162229 - BLOCK
      ?auto_162230 - BLOCK
      ?auto_162231 - BLOCK
      ?auto_162232 - BLOCK
      ?auto_162233 - BLOCK
      ?auto_162234 - BLOCK
      ?auto_162235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_162228 ) ( not ( = ?auto_162228 ?auto_162229 ) ) ( not ( = ?auto_162228 ?auto_162230 ) ) ( not ( = ?auto_162228 ?auto_162231 ) ) ( not ( = ?auto_162228 ?auto_162232 ) ) ( not ( = ?auto_162228 ?auto_162233 ) ) ( not ( = ?auto_162228 ?auto_162234 ) ) ( not ( = ?auto_162228 ?auto_162235 ) ) ( not ( = ?auto_162229 ?auto_162230 ) ) ( not ( = ?auto_162229 ?auto_162231 ) ) ( not ( = ?auto_162229 ?auto_162232 ) ) ( not ( = ?auto_162229 ?auto_162233 ) ) ( not ( = ?auto_162229 ?auto_162234 ) ) ( not ( = ?auto_162229 ?auto_162235 ) ) ( not ( = ?auto_162230 ?auto_162231 ) ) ( not ( = ?auto_162230 ?auto_162232 ) ) ( not ( = ?auto_162230 ?auto_162233 ) ) ( not ( = ?auto_162230 ?auto_162234 ) ) ( not ( = ?auto_162230 ?auto_162235 ) ) ( not ( = ?auto_162231 ?auto_162232 ) ) ( not ( = ?auto_162231 ?auto_162233 ) ) ( not ( = ?auto_162231 ?auto_162234 ) ) ( not ( = ?auto_162231 ?auto_162235 ) ) ( not ( = ?auto_162232 ?auto_162233 ) ) ( not ( = ?auto_162232 ?auto_162234 ) ) ( not ( = ?auto_162232 ?auto_162235 ) ) ( not ( = ?auto_162233 ?auto_162234 ) ) ( not ( = ?auto_162233 ?auto_162235 ) ) ( not ( = ?auto_162234 ?auto_162235 ) ) ( ON-TABLE ?auto_162235 ) ( ON ?auto_162234 ?auto_162235 ) ( ON ?auto_162233 ?auto_162234 ) ( ON ?auto_162232 ?auto_162233 ) ( ON ?auto_162231 ?auto_162232 ) ( ON ?auto_162230 ?auto_162231 ) ( CLEAR ?auto_162228 ) ( ON ?auto_162229 ?auto_162230 ) ( CLEAR ?auto_162229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162235 ?auto_162234 ?auto_162233 ?auto_162232 ?auto_162231 ?auto_162230 )
      ( MAKE-8PILE ?auto_162228 ?auto_162229 ?auto_162230 ?auto_162231 ?auto_162232 ?auto_162233 ?auto_162234 ?auto_162235 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162236 - BLOCK
      ?auto_162237 - BLOCK
      ?auto_162238 - BLOCK
      ?auto_162239 - BLOCK
      ?auto_162240 - BLOCK
      ?auto_162241 - BLOCK
      ?auto_162242 - BLOCK
      ?auto_162243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162236 ?auto_162237 ) ) ( not ( = ?auto_162236 ?auto_162238 ) ) ( not ( = ?auto_162236 ?auto_162239 ) ) ( not ( = ?auto_162236 ?auto_162240 ) ) ( not ( = ?auto_162236 ?auto_162241 ) ) ( not ( = ?auto_162236 ?auto_162242 ) ) ( not ( = ?auto_162236 ?auto_162243 ) ) ( not ( = ?auto_162237 ?auto_162238 ) ) ( not ( = ?auto_162237 ?auto_162239 ) ) ( not ( = ?auto_162237 ?auto_162240 ) ) ( not ( = ?auto_162237 ?auto_162241 ) ) ( not ( = ?auto_162237 ?auto_162242 ) ) ( not ( = ?auto_162237 ?auto_162243 ) ) ( not ( = ?auto_162238 ?auto_162239 ) ) ( not ( = ?auto_162238 ?auto_162240 ) ) ( not ( = ?auto_162238 ?auto_162241 ) ) ( not ( = ?auto_162238 ?auto_162242 ) ) ( not ( = ?auto_162238 ?auto_162243 ) ) ( not ( = ?auto_162239 ?auto_162240 ) ) ( not ( = ?auto_162239 ?auto_162241 ) ) ( not ( = ?auto_162239 ?auto_162242 ) ) ( not ( = ?auto_162239 ?auto_162243 ) ) ( not ( = ?auto_162240 ?auto_162241 ) ) ( not ( = ?auto_162240 ?auto_162242 ) ) ( not ( = ?auto_162240 ?auto_162243 ) ) ( not ( = ?auto_162241 ?auto_162242 ) ) ( not ( = ?auto_162241 ?auto_162243 ) ) ( not ( = ?auto_162242 ?auto_162243 ) ) ( ON-TABLE ?auto_162243 ) ( ON ?auto_162242 ?auto_162243 ) ( ON ?auto_162241 ?auto_162242 ) ( ON ?auto_162240 ?auto_162241 ) ( ON ?auto_162239 ?auto_162240 ) ( ON ?auto_162238 ?auto_162239 ) ( ON ?auto_162237 ?auto_162238 ) ( CLEAR ?auto_162237 ) ( HOLDING ?auto_162236 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162236 )
      ( MAKE-8PILE ?auto_162236 ?auto_162237 ?auto_162238 ?auto_162239 ?auto_162240 ?auto_162241 ?auto_162242 ?auto_162243 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162244 - BLOCK
      ?auto_162245 - BLOCK
      ?auto_162246 - BLOCK
      ?auto_162247 - BLOCK
      ?auto_162248 - BLOCK
      ?auto_162249 - BLOCK
      ?auto_162250 - BLOCK
      ?auto_162251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162244 ?auto_162245 ) ) ( not ( = ?auto_162244 ?auto_162246 ) ) ( not ( = ?auto_162244 ?auto_162247 ) ) ( not ( = ?auto_162244 ?auto_162248 ) ) ( not ( = ?auto_162244 ?auto_162249 ) ) ( not ( = ?auto_162244 ?auto_162250 ) ) ( not ( = ?auto_162244 ?auto_162251 ) ) ( not ( = ?auto_162245 ?auto_162246 ) ) ( not ( = ?auto_162245 ?auto_162247 ) ) ( not ( = ?auto_162245 ?auto_162248 ) ) ( not ( = ?auto_162245 ?auto_162249 ) ) ( not ( = ?auto_162245 ?auto_162250 ) ) ( not ( = ?auto_162245 ?auto_162251 ) ) ( not ( = ?auto_162246 ?auto_162247 ) ) ( not ( = ?auto_162246 ?auto_162248 ) ) ( not ( = ?auto_162246 ?auto_162249 ) ) ( not ( = ?auto_162246 ?auto_162250 ) ) ( not ( = ?auto_162246 ?auto_162251 ) ) ( not ( = ?auto_162247 ?auto_162248 ) ) ( not ( = ?auto_162247 ?auto_162249 ) ) ( not ( = ?auto_162247 ?auto_162250 ) ) ( not ( = ?auto_162247 ?auto_162251 ) ) ( not ( = ?auto_162248 ?auto_162249 ) ) ( not ( = ?auto_162248 ?auto_162250 ) ) ( not ( = ?auto_162248 ?auto_162251 ) ) ( not ( = ?auto_162249 ?auto_162250 ) ) ( not ( = ?auto_162249 ?auto_162251 ) ) ( not ( = ?auto_162250 ?auto_162251 ) ) ( ON-TABLE ?auto_162251 ) ( ON ?auto_162250 ?auto_162251 ) ( ON ?auto_162249 ?auto_162250 ) ( ON ?auto_162248 ?auto_162249 ) ( ON ?auto_162247 ?auto_162248 ) ( ON ?auto_162246 ?auto_162247 ) ( ON ?auto_162245 ?auto_162246 ) ( ON ?auto_162244 ?auto_162245 ) ( CLEAR ?auto_162244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162251 ?auto_162250 ?auto_162249 ?auto_162248 ?auto_162247 ?auto_162246 ?auto_162245 )
      ( MAKE-8PILE ?auto_162244 ?auto_162245 ?auto_162246 ?auto_162247 ?auto_162248 ?auto_162249 ?auto_162250 ?auto_162251 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162252 - BLOCK
      ?auto_162253 - BLOCK
      ?auto_162254 - BLOCK
      ?auto_162255 - BLOCK
      ?auto_162256 - BLOCK
      ?auto_162257 - BLOCK
      ?auto_162258 - BLOCK
      ?auto_162259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162252 ?auto_162253 ) ) ( not ( = ?auto_162252 ?auto_162254 ) ) ( not ( = ?auto_162252 ?auto_162255 ) ) ( not ( = ?auto_162252 ?auto_162256 ) ) ( not ( = ?auto_162252 ?auto_162257 ) ) ( not ( = ?auto_162252 ?auto_162258 ) ) ( not ( = ?auto_162252 ?auto_162259 ) ) ( not ( = ?auto_162253 ?auto_162254 ) ) ( not ( = ?auto_162253 ?auto_162255 ) ) ( not ( = ?auto_162253 ?auto_162256 ) ) ( not ( = ?auto_162253 ?auto_162257 ) ) ( not ( = ?auto_162253 ?auto_162258 ) ) ( not ( = ?auto_162253 ?auto_162259 ) ) ( not ( = ?auto_162254 ?auto_162255 ) ) ( not ( = ?auto_162254 ?auto_162256 ) ) ( not ( = ?auto_162254 ?auto_162257 ) ) ( not ( = ?auto_162254 ?auto_162258 ) ) ( not ( = ?auto_162254 ?auto_162259 ) ) ( not ( = ?auto_162255 ?auto_162256 ) ) ( not ( = ?auto_162255 ?auto_162257 ) ) ( not ( = ?auto_162255 ?auto_162258 ) ) ( not ( = ?auto_162255 ?auto_162259 ) ) ( not ( = ?auto_162256 ?auto_162257 ) ) ( not ( = ?auto_162256 ?auto_162258 ) ) ( not ( = ?auto_162256 ?auto_162259 ) ) ( not ( = ?auto_162257 ?auto_162258 ) ) ( not ( = ?auto_162257 ?auto_162259 ) ) ( not ( = ?auto_162258 ?auto_162259 ) ) ( ON-TABLE ?auto_162259 ) ( ON ?auto_162258 ?auto_162259 ) ( ON ?auto_162257 ?auto_162258 ) ( ON ?auto_162256 ?auto_162257 ) ( ON ?auto_162255 ?auto_162256 ) ( ON ?auto_162254 ?auto_162255 ) ( ON ?auto_162253 ?auto_162254 ) ( HOLDING ?auto_162252 ) ( CLEAR ?auto_162253 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162259 ?auto_162258 ?auto_162257 ?auto_162256 ?auto_162255 ?auto_162254 ?auto_162253 ?auto_162252 )
      ( MAKE-8PILE ?auto_162252 ?auto_162253 ?auto_162254 ?auto_162255 ?auto_162256 ?auto_162257 ?auto_162258 ?auto_162259 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162260 - BLOCK
      ?auto_162261 - BLOCK
      ?auto_162262 - BLOCK
      ?auto_162263 - BLOCK
      ?auto_162264 - BLOCK
      ?auto_162265 - BLOCK
      ?auto_162266 - BLOCK
      ?auto_162267 - BLOCK
    )
    :vars
    (
      ?auto_162268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162260 ?auto_162261 ) ) ( not ( = ?auto_162260 ?auto_162262 ) ) ( not ( = ?auto_162260 ?auto_162263 ) ) ( not ( = ?auto_162260 ?auto_162264 ) ) ( not ( = ?auto_162260 ?auto_162265 ) ) ( not ( = ?auto_162260 ?auto_162266 ) ) ( not ( = ?auto_162260 ?auto_162267 ) ) ( not ( = ?auto_162261 ?auto_162262 ) ) ( not ( = ?auto_162261 ?auto_162263 ) ) ( not ( = ?auto_162261 ?auto_162264 ) ) ( not ( = ?auto_162261 ?auto_162265 ) ) ( not ( = ?auto_162261 ?auto_162266 ) ) ( not ( = ?auto_162261 ?auto_162267 ) ) ( not ( = ?auto_162262 ?auto_162263 ) ) ( not ( = ?auto_162262 ?auto_162264 ) ) ( not ( = ?auto_162262 ?auto_162265 ) ) ( not ( = ?auto_162262 ?auto_162266 ) ) ( not ( = ?auto_162262 ?auto_162267 ) ) ( not ( = ?auto_162263 ?auto_162264 ) ) ( not ( = ?auto_162263 ?auto_162265 ) ) ( not ( = ?auto_162263 ?auto_162266 ) ) ( not ( = ?auto_162263 ?auto_162267 ) ) ( not ( = ?auto_162264 ?auto_162265 ) ) ( not ( = ?auto_162264 ?auto_162266 ) ) ( not ( = ?auto_162264 ?auto_162267 ) ) ( not ( = ?auto_162265 ?auto_162266 ) ) ( not ( = ?auto_162265 ?auto_162267 ) ) ( not ( = ?auto_162266 ?auto_162267 ) ) ( ON-TABLE ?auto_162267 ) ( ON ?auto_162266 ?auto_162267 ) ( ON ?auto_162265 ?auto_162266 ) ( ON ?auto_162264 ?auto_162265 ) ( ON ?auto_162263 ?auto_162264 ) ( ON ?auto_162262 ?auto_162263 ) ( ON ?auto_162261 ?auto_162262 ) ( CLEAR ?auto_162261 ) ( ON ?auto_162260 ?auto_162268 ) ( CLEAR ?auto_162260 ) ( HAND-EMPTY ) ( not ( = ?auto_162260 ?auto_162268 ) ) ( not ( = ?auto_162261 ?auto_162268 ) ) ( not ( = ?auto_162262 ?auto_162268 ) ) ( not ( = ?auto_162263 ?auto_162268 ) ) ( not ( = ?auto_162264 ?auto_162268 ) ) ( not ( = ?auto_162265 ?auto_162268 ) ) ( not ( = ?auto_162266 ?auto_162268 ) ) ( not ( = ?auto_162267 ?auto_162268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162260 ?auto_162268 )
      ( MAKE-8PILE ?auto_162260 ?auto_162261 ?auto_162262 ?auto_162263 ?auto_162264 ?auto_162265 ?auto_162266 ?auto_162267 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162269 - BLOCK
      ?auto_162270 - BLOCK
      ?auto_162271 - BLOCK
      ?auto_162272 - BLOCK
      ?auto_162273 - BLOCK
      ?auto_162274 - BLOCK
      ?auto_162275 - BLOCK
      ?auto_162276 - BLOCK
    )
    :vars
    (
      ?auto_162277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162269 ?auto_162270 ) ) ( not ( = ?auto_162269 ?auto_162271 ) ) ( not ( = ?auto_162269 ?auto_162272 ) ) ( not ( = ?auto_162269 ?auto_162273 ) ) ( not ( = ?auto_162269 ?auto_162274 ) ) ( not ( = ?auto_162269 ?auto_162275 ) ) ( not ( = ?auto_162269 ?auto_162276 ) ) ( not ( = ?auto_162270 ?auto_162271 ) ) ( not ( = ?auto_162270 ?auto_162272 ) ) ( not ( = ?auto_162270 ?auto_162273 ) ) ( not ( = ?auto_162270 ?auto_162274 ) ) ( not ( = ?auto_162270 ?auto_162275 ) ) ( not ( = ?auto_162270 ?auto_162276 ) ) ( not ( = ?auto_162271 ?auto_162272 ) ) ( not ( = ?auto_162271 ?auto_162273 ) ) ( not ( = ?auto_162271 ?auto_162274 ) ) ( not ( = ?auto_162271 ?auto_162275 ) ) ( not ( = ?auto_162271 ?auto_162276 ) ) ( not ( = ?auto_162272 ?auto_162273 ) ) ( not ( = ?auto_162272 ?auto_162274 ) ) ( not ( = ?auto_162272 ?auto_162275 ) ) ( not ( = ?auto_162272 ?auto_162276 ) ) ( not ( = ?auto_162273 ?auto_162274 ) ) ( not ( = ?auto_162273 ?auto_162275 ) ) ( not ( = ?auto_162273 ?auto_162276 ) ) ( not ( = ?auto_162274 ?auto_162275 ) ) ( not ( = ?auto_162274 ?auto_162276 ) ) ( not ( = ?auto_162275 ?auto_162276 ) ) ( ON-TABLE ?auto_162276 ) ( ON ?auto_162275 ?auto_162276 ) ( ON ?auto_162274 ?auto_162275 ) ( ON ?auto_162273 ?auto_162274 ) ( ON ?auto_162272 ?auto_162273 ) ( ON ?auto_162271 ?auto_162272 ) ( ON ?auto_162269 ?auto_162277 ) ( CLEAR ?auto_162269 ) ( not ( = ?auto_162269 ?auto_162277 ) ) ( not ( = ?auto_162270 ?auto_162277 ) ) ( not ( = ?auto_162271 ?auto_162277 ) ) ( not ( = ?auto_162272 ?auto_162277 ) ) ( not ( = ?auto_162273 ?auto_162277 ) ) ( not ( = ?auto_162274 ?auto_162277 ) ) ( not ( = ?auto_162275 ?auto_162277 ) ) ( not ( = ?auto_162276 ?auto_162277 ) ) ( HOLDING ?auto_162270 ) ( CLEAR ?auto_162271 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162276 ?auto_162275 ?auto_162274 ?auto_162273 ?auto_162272 ?auto_162271 ?auto_162270 )
      ( MAKE-8PILE ?auto_162269 ?auto_162270 ?auto_162271 ?auto_162272 ?auto_162273 ?auto_162274 ?auto_162275 ?auto_162276 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162278 - BLOCK
      ?auto_162279 - BLOCK
      ?auto_162280 - BLOCK
      ?auto_162281 - BLOCK
      ?auto_162282 - BLOCK
      ?auto_162283 - BLOCK
      ?auto_162284 - BLOCK
      ?auto_162285 - BLOCK
    )
    :vars
    (
      ?auto_162286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162278 ?auto_162279 ) ) ( not ( = ?auto_162278 ?auto_162280 ) ) ( not ( = ?auto_162278 ?auto_162281 ) ) ( not ( = ?auto_162278 ?auto_162282 ) ) ( not ( = ?auto_162278 ?auto_162283 ) ) ( not ( = ?auto_162278 ?auto_162284 ) ) ( not ( = ?auto_162278 ?auto_162285 ) ) ( not ( = ?auto_162279 ?auto_162280 ) ) ( not ( = ?auto_162279 ?auto_162281 ) ) ( not ( = ?auto_162279 ?auto_162282 ) ) ( not ( = ?auto_162279 ?auto_162283 ) ) ( not ( = ?auto_162279 ?auto_162284 ) ) ( not ( = ?auto_162279 ?auto_162285 ) ) ( not ( = ?auto_162280 ?auto_162281 ) ) ( not ( = ?auto_162280 ?auto_162282 ) ) ( not ( = ?auto_162280 ?auto_162283 ) ) ( not ( = ?auto_162280 ?auto_162284 ) ) ( not ( = ?auto_162280 ?auto_162285 ) ) ( not ( = ?auto_162281 ?auto_162282 ) ) ( not ( = ?auto_162281 ?auto_162283 ) ) ( not ( = ?auto_162281 ?auto_162284 ) ) ( not ( = ?auto_162281 ?auto_162285 ) ) ( not ( = ?auto_162282 ?auto_162283 ) ) ( not ( = ?auto_162282 ?auto_162284 ) ) ( not ( = ?auto_162282 ?auto_162285 ) ) ( not ( = ?auto_162283 ?auto_162284 ) ) ( not ( = ?auto_162283 ?auto_162285 ) ) ( not ( = ?auto_162284 ?auto_162285 ) ) ( ON-TABLE ?auto_162285 ) ( ON ?auto_162284 ?auto_162285 ) ( ON ?auto_162283 ?auto_162284 ) ( ON ?auto_162282 ?auto_162283 ) ( ON ?auto_162281 ?auto_162282 ) ( ON ?auto_162280 ?auto_162281 ) ( ON ?auto_162278 ?auto_162286 ) ( not ( = ?auto_162278 ?auto_162286 ) ) ( not ( = ?auto_162279 ?auto_162286 ) ) ( not ( = ?auto_162280 ?auto_162286 ) ) ( not ( = ?auto_162281 ?auto_162286 ) ) ( not ( = ?auto_162282 ?auto_162286 ) ) ( not ( = ?auto_162283 ?auto_162286 ) ) ( not ( = ?auto_162284 ?auto_162286 ) ) ( not ( = ?auto_162285 ?auto_162286 ) ) ( CLEAR ?auto_162280 ) ( ON ?auto_162279 ?auto_162278 ) ( CLEAR ?auto_162279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162286 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162286 ?auto_162278 )
      ( MAKE-8PILE ?auto_162278 ?auto_162279 ?auto_162280 ?auto_162281 ?auto_162282 ?auto_162283 ?auto_162284 ?auto_162285 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162287 - BLOCK
      ?auto_162288 - BLOCK
      ?auto_162289 - BLOCK
      ?auto_162290 - BLOCK
      ?auto_162291 - BLOCK
      ?auto_162292 - BLOCK
      ?auto_162293 - BLOCK
      ?auto_162294 - BLOCK
    )
    :vars
    (
      ?auto_162295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162287 ?auto_162288 ) ) ( not ( = ?auto_162287 ?auto_162289 ) ) ( not ( = ?auto_162287 ?auto_162290 ) ) ( not ( = ?auto_162287 ?auto_162291 ) ) ( not ( = ?auto_162287 ?auto_162292 ) ) ( not ( = ?auto_162287 ?auto_162293 ) ) ( not ( = ?auto_162287 ?auto_162294 ) ) ( not ( = ?auto_162288 ?auto_162289 ) ) ( not ( = ?auto_162288 ?auto_162290 ) ) ( not ( = ?auto_162288 ?auto_162291 ) ) ( not ( = ?auto_162288 ?auto_162292 ) ) ( not ( = ?auto_162288 ?auto_162293 ) ) ( not ( = ?auto_162288 ?auto_162294 ) ) ( not ( = ?auto_162289 ?auto_162290 ) ) ( not ( = ?auto_162289 ?auto_162291 ) ) ( not ( = ?auto_162289 ?auto_162292 ) ) ( not ( = ?auto_162289 ?auto_162293 ) ) ( not ( = ?auto_162289 ?auto_162294 ) ) ( not ( = ?auto_162290 ?auto_162291 ) ) ( not ( = ?auto_162290 ?auto_162292 ) ) ( not ( = ?auto_162290 ?auto_162293 ) ) ( not ( = ?auto_162290 ?auto_162294 ) ) ( not ( = ?auto_162291 ?auto_162292 ) ) ( not ( = ?auto_162291 ?auto_162293 ) ) ( not ( = ?auto_162291 ?auto_162294 ) ) ( not ( = ?auto_162292 ?auto_162293 ) ) ( not ( = ?auto_162292 ?auto_162294 ) ) ( not ( = ?auto_162293 ?auto_162294 ) ) ( ON-TABLE ?auto_162294 ) ( ON ?auto_162293 ?auto_162294 ) ( ON ?auto_162292 ?auto_162293 ) ( ON ?auto_162291 ?auto_162292 ) ( ON ?auto_162290 ?auto_162291 ) ( ON ?auto_162287 ?auto_162295 ) ( not ( = ?auto_162287 ?auto_162295 ) ) ( not ( = ?auto_162288 ?auto_162295 ) ) ( not ( = ?auto_162289 ?auto_162295 ) ) ( not ( = ?auto_162290 ?auto_162295 ) ) ( not ( = ?auto_162291 ?auto_162295 ) ) ( not ( = ?auto_162292 ?auto_162295 ) ) ( not ( = ?auto_162293 ?auto_162295 ) ) ( not ( = ?auto_162294 ?auto_162295 ) ) ( ON ?auto_162288 ?auto_162287 ) ( CLEAR ?auto_162288 ) ( ON-TABLE ?auto_162295 ) ( HOLDING ?auto_162289 ) ( CLEAR ?auto_162290 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162294 ?auto_162293 ?auto_162292 ?auto_162291 ?auto_162290 ?auto_162289 )
      ( MAKE-8PILE ?auto_162287 ?auto_162288 ?auto_162289 ?auto_162290 ?auto_162291 ?auto_162292 ?auto_162293 ?auto_162294 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162296 - BLOCK
      ?auto_162297 - BLOCK
      ?auto_162298 - BLOCK
      ?auto_162299 - BLOCK
      ?auto_162300 - BLOCK
      ?auto_162301 - BLOCK
      ?auto_162302 - BLOCK
      ?auto_162303 - BLOCK
    )
    :vars
    (
      ?auto_162304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162296 ?auto_162297 ) ) ( not ( = ?auto_162296 ?auto_162298 ) ) ( not ( = ?auto_162296 ?auto_162299 ) ) ( not ( = ?auto_162296 ?auto_162300 ) ) ( not ( = ?auto_162296 ?auto_162301 ) ) ( not ( = ?auto_162296 ?auto_162302 ) ) ( not ( = ?auto_162296 ?auto_162303 ) ) ( not ( = ?auto_162297 ?auto_162298 ) ) ( not ( = ?auto_162297 ?auto_162299 ) ) ( not ( = ?auto_162297 ?auto_162300 ) ) ( not ( = ?auto_162297 ?auto_162301 ) ) ( not ( = ?auto_162297 ?auto_162302 ) ) ( not ( = ?auto_162297 ?auto_162303 ) ) ( not ( = ?auto_162298 ?auto_162299 ) ) ( not ( = ?auto_162298 ?auto_162300 ) ) ( not ( = ?auto_162298 ?auto_162301 ) ) ( not ( = ?auto_162298 ?auto_162302 ) ) ( not ( = ?auto_162298 ?auto_162303 ) ) ( not ( = ?auto_162299 ?auto_162300 ) ) ( not ( = ?auto_162299 ?auto_162301 ) ) ( not ( = ?auto_162299 ?auto_162302 ) ) ( not ( = ?auto_162299 ?auto_162303 ) ) ( not ( = ?auto_162300 ?auto_162301 ) ) ( not ( = ?auto_162300 ?auto_162302 ) ) ( not ( = ?auto_162300 ?auto_162303 ) ) ( not ( = ?auto_162301 ?auto_162302 ) ) ( not ( = ?auto_162301 ?auto_162303 ) ) ( not ( = ?auto_162302 ?auto_162303 ) ) ( ON-TABLE ?auto_162303 ) ( ON ?auto_162302 ?auto_162303 ) ( ON ?auto_162301 ?auto_162302 ) ( ON ?auto_162300 ?auto_162301 ) ( ON ?auto_162299 ?auto_162300 ) ( ON ?auto_162296 ?auto_162304 ) ( not ( = ?auto_162296 ?auto_162304 ) ) ( not ( = ?auto_162297 ?auto_162304 ) ) ( not ( = ?auto_162298 ?auto_162304 ) ) ( not ( = ?auto_162299 ?auto_162304 ) ) ( not ( = ?auto_162300 ?auto_162304 ) ) ( not ( = ?auto_162301 ?auto_162304 ) ) ( not ( = ?auto_162302 ?auto_162304 ) ) ( not ( = ?auto_162303 ?auto_162304 ) ) ( ON ?auto_162297 ?auto_162296 ) ( ON-TABLE ?auto_162304 ) ( CLEAR ?auto_162299 ) ( ON ?auto_162298 ?auto_162297 ) ( CLEAR ?auto_162298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162304 ?auto_162296 ?auto_162297 )
      ( MAKE-8PILE ?auto_162296 ?auto_162297 ?auto_162298 ?auto_162299 ?auto_162300 ?auto_162301 ?auto_162302 ?auto_162303 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162305 - BLOCK
      ?auto_162306 - BLOCK
      ?auto_162307 - BLOCK
      ?auto_162308 - BLOCK
      ?auto_162309 - BLOCK
      ?auto_162310 - BLOCK
      ?auto_162311 - BLOCK
      ?auto_162312 - BLOCK
    )
    :vars
    (
      ?auto_162313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162305 ?auto_162306 ) ) ( not ( = ?auto_162305 ?auto_162307 ) ) ( not ( = ?auto_162305 ?auto_162308 ) ) ( not ( = ?auto_162305 ?auto_162309 ) ) ( not ( = ?auto_162305 ?auto_162310 ) ) ( not ( = ?auto_162305 ?auto_162311 ) ) ( not ( = ?auto_162305 ?auto_162312 ) ) ( not ( = ?auto_162306 ?auto_162307 ) ) ( not ( = ?auto_162306 ?auto_162308 ) ) ( not ( = ?auto_162306 ?auto_162309 ) ) ( not ( = ?auto_162306 ?auto_162310 ) ) ( not ( = ?auto_162306 ?auto_162311 ) ) ( not ( = ?auto_162306 ?auto_162312 ) ) ( not ( = ?auto_162307 ?auto_162308 ) ) ( not ( = ?auto_162307 ?auto_162309 ) ) ( not ( = ?auto_162307 ?auto_162310 ) ) ( not ( = ?auto_162307 ?auto_162311 ) ) ( not ( = ?auto_162307 ?auto_162312 ) ) ( not ( = ?auto_162308 ?auto_162309 ) ) ( not ( = ?auto_162308 ?auto_162310 ) ) ( not ( = ?auto_162308 ?auto_162311 ) ) ( not ( = ?auto_162308 ?auto_162312 ) ) ( not ( = ?auto_162309 ?auto_162310 ) ) ( not ( = ?auto_162309 ?auto_162311 ) ) ( not ( = ?auto_162309 ?auto_162312 ) ) ( not ( = ?auto_162310 ?auto_162311 ) ) ( not ( = ?auto_162310 ?auto_162312 ) ) ( not ( = ?auto_162311 ?auto_162312 ) ) ( ON-TABLE ?auto_162312 ) ( ON ?auto_162311 ?auto_162312 ) ( ON ?auto_162310 ?auto_162311 ) ( ON ?auto_162309 ?auto_162310 ) ( ON ?auto_162305 ?auto_162313 ) ( not ( = ?auto_162305 ?auto_162313 ) ) ( not ( = ?auto_162306 ?auto_162313 ) ) ( not ( = ?auto_162307 ?auto_162313 ) ) ( not ( = ?auto_162308 ?auto_162313 ) ) ( not ( = ?auto_162309 ?auto_162313 ) ) ( not ( = ?auto_162310 ?auto_162313 ) ) ( not ( = ?auto_162311 ?auto_162313 ) ) ( not ( = ?auto_162312 ?auto_162313 ) ) ( ON ?auto_162306 ?auto_162305 ) ( ON-TABLE ?auto_162313 ) ( ON ?auto_162307 ?auto_162306 ) ( CLEAR ?auto_162307 ) ( HOLDING ?auto_162308 ) ( CLEAR ?auto_162309 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162312 ?auto_162311 ?auto_162310 ?auto_162309 ?auto_162308 )
      ( MAKE-8PILE ?auto_162305 ?auto_162306 ?auto_162307 ?auto_162308 ?auto_162309 ?auto_162310 ?auto_162311 ?auto_162312 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162314 - BLOCK
      ?auto_162315 - BLOCK
      ?auto_162316 - BLOCK
      ?auto_162317 - BLOCK
      ?auto_162318 - BLOCK
      ?auto_162319 - BLOCK
      ?auto_162320 - BLOCK
      ?auto_162321 - BLOCK
    )
    :vars
    (
      ?auto_162322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162314 ?auto_162315 ) ) ( not ( = ?auto_162314 ?auto_162316 ) ) ( not ( = ?auto_162314 ?auto_162317 ) ) ( not ( = ?auto_162314 ?auto_162318 ) ) ( not ( = ?auto_162314 ?auto_162319 ) ) ( not ( = ?auto_162314 ?auto_162320 ) ) ( not ( = ?auto_162314 ?auto_162321 ) ) ( not ( = ?auto_162315 ?auto_162316 ) ) ( not ( = ?auto_162315 ?auto_162317 ) ) ( not ( = ?auto_162315 ?auto_162318 ) ) ( not ( = ?auto_162315 ?auto_162319 ) ) ( not ( = ?auto_162315 ?auto_162320 ) ) ( not ( = ?auto_162315 ?auto_162321 ) ) ( not ( = ?auto_162316 ?auto_162317 ) ) ( not ( = ?auto_162316 ?auto_162318 ) ) ( not ( = ?auto_162316 ?auto_162319 ) ) ( not ( = ?auto_162316 ?auto_162320 ) ) ( not ( = ?auto_162316 ?auto_162321 ) ) ( not ( = ?auto_162317 ?auto_162318 ) ) ( not ( = ?auto_162317 ?auto_162319 ) ) ( not ( = ?auto_162317 ?auto_162320 ) ) ( not ( = ?auto_162317 ?auto_162321 ) ) ( not ( = ?auto_162318 ?auto_162319 ) ) ( not ( = ?auto_162318 ?auto_162320 ) ) ( not ( = ?auto_162318 ?auto_162321 ) ) ( not ( = ?auto_162319 ?auto_162320 ) ) ( not ( = ?auto_162319 ?auto_162321 ) ) ( not ( = ?auto_162320 ?auto_162321 ) ) ( ON-TABLE ?auto_162321 ) ( ON ?auto_162320 ?auto_162321 ) ( ON ?auto_162319 ?auto_162320 ) ( ON ?auto_162318 ?auto_162319 ) ( ON ?auto_162314 ?auto_162322 ) ( not ( = ?auto_162314 ?auto_162322 ) ) ( not ( = ?auto_162315 ?auto_162322 ) ) ( not ( = ?auto_162316 ?auto_162322 ) ) ( not ( = ?auto_162317 ?auto_162322 ) ) ( not ( = ?auto_162318 ?auto_162322 ) ) ( not ( = ?auto_162319 ?auto_162322 ) ) ( not ( = ?auto_162320 ?auto_162322 ) ) ( not ( = ?auto_162321 ?auto_162322 ) ) ( ON ?auto_162315 ?auto_162314 ) ( ON-TABLE ?auto_162322 ) ( ON ?auto_162316 ?auto_162315 ) ( CLEAR ?auto_162318 ) ( ON ?auto_162317 ?auto_162316 ) ( CLEAR ?auto_162317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162322 ?auto_162314 ?auto_162315 ?auto_162316 )
      ( MAKE-8PILE ?auto_162314 ?auto_162315 ?auto_162316 ?auto_162317 ?auto_162318 ?auto_162319 ?auto_162320 ?auto_162321 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162323 - BLOCK
      ?auto_162324 - BLOCK
      ?auto_162325 - BLOCK
      ?auto_162326 - BLOCK
      ?auto_162327 - BLOCK
      ?auto_162328 - BLOCK
      ?auto_162329 - BLOCK
      ?auto_162330 - BLOCK
    )
    :vars
    (
      ?auto_162331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162323 ?auto_162324 ) ) ( not ( = ?auto_162323 ?auto_162325 ) ) ( not ( = ?auto_162323 ?auto_162326 ) ) ( not ( = ?auto_162323 ?auto_162327 ) ) ( not ( = ?auto_162323 ?auto_162328 ) ) ( not ( = ?auto_162323 ?auto_162329 ) ) ( not ( = ?auto_162323 ?auto_162330 ) ) ( not ( = ?auto_162324 ?auto_162325 ) ) ( not ( = ?auto_162324 ?auto_162326 ) ) ( not ( = ?auto_162324 ?auto_162327 ) ) ( not ( = ?auto_162324 ?auto_162328 ) ) ( not ( = ?auto_162324 ?auto_162329 ) ) ( not ( = ?auto_162324 ?auto_162330 ) ) ( not ( = ?auto_162325 ?auto_162326 ) ) ( not ( = ?auto_162325 ?auto_162327 ) ) ( not ( = ?auto_162325 ?auto_162328 ) ) ( not ( = ?auto_162325 ?auto_162329 ) ) ( not ( = ?auto_162325 ?auto_162330 ) ) ( not ( = ?auto_162326 ?auto_162327 ) ) ( not ( = ?auto_162326 ?auto_162328 ) ) ( not ( = ?auto_162326 ?auto_162329 ) ) ( not ( = ?auto_162326 ?auto_162330 ) ) ( not ( = ?auto_162327 ?auto_162328 ) ) ( not ( = ?auto_162327 ?auto_162329 ) ) ( not ( = ?auto_162327 ?auto_162330 ) ) ( not ( = ?auto_162328 ?auto_162329 ) ) ( not ( = ?auto_162328 ?auto_162330 ) ) ( not ( = ?auto_162329 ?auto_162330 ) ) ( ON-TABLE ?auto_162330 ) ( ON ?auto_162329 ?auto_162330 ) ( ON ?auto_162328 ?auto_162329 ) ( ON ?auto_162323 ?auto_162331 ) ( not ( = ?auto_162323 ?auto_162331 ) ) ( not ( = ?auto_162324 ?auto_162331 ) ) ( not ( = ?auto_162325 ?auto_162331 ) ) ( not ( = ?auto_162326 ?auto_162331 ) ) ( not ( = ?auto_162327 ?auto_162331 ) ) ( not ( = ?auto_162328 ?auto_162331 ) ) ( not ( = ?auto_162329 ?auto_162331 ) ) ( not ( = ?auto_162330 ?auto_162331 ) ) ( ON ?auto_162324 ?auto_162323 ) ( ON-TABLE ?auto_162331 ) ( ON ?auto_162325 ?auto_162324 ) ( ON ?auto_162326 ?auto_162325 ) ( CLEAR ?auto_162326 ) ( HOLDING ?auto_162327 ) ( CLEAR ?auto_162328 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162330 ?auto_162329 ?auto_162328 ?auto_162327 )
      ( MAKE-8PILE ?auto_162323 ?auto_162324 ?auto_162325 ?auto_162326 ?auto_162327 ?auto_162328 ?auto_162329 ?auto_162330 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162332 - BLOCK
      ?auto_162333 - BLOCK
      ?auto_162334 - BLOCK
      ?auto_162335 - BLOCK
      ?auto_162336 - BLOCK
      ?auto_162337 - BLOCK
      ?auto_162338 - BLOCK
      ?auto_162339 - BLOCK
    )
    :vars
    (
      ?auto_162340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162332 ?auto_162333 ) ) ( not ( = ?auto_162332 ?auto_162334 ) ) ( not ( = ?auto_162332 ?auto_162335 ) ) ( not ( = ?auto_162332 ?auto_162336 ) ) ( not ( = ?auto_162332 ?auto_162337 ) ) ( not ( = ?auto_162332 ?auto_162338 ) ) ( not ( = ?auto_162332 ?auto_162339 ) ) ( not ( = ?auto_162333 ?auto_162334 ) ) ( not ( = ?auto_162333 ?auto_162335 ) ) ( not ( = ?auto_162333 ?auto_162336 ) ) ( not ( = ?auto_162333 ?auto_162337 ) ) ( not ( = ?auto_162333 ?auto_162338 ) ) ( not ( = ?auto_162333 ?auto_162339 ) ) ( not ( = ?auto_162334 ?auto_162335 ) ) ( not ( = ?auto_162334 ?auto_162336 ) ) ( not ( = ?auto_162334 ?auto_162337 ) ) ( not ( = ?auto_162334 ?auto_162338 ) ) ( not ( = ?auto_162334 ?auto_162339 ) ) ( not ( = ?auto_162335 ?auto_162336 ) ) ( not ( = ?auto_162335 ?auto_162337 ) ) ( not ( = ?auto_162335 ?auto_162338 ) ) ( not ( = ?auto_162335 ?auto_162339 ) ) ( not ( = ?auto_162336 ?auto_162337 ) ) ( not ( = ?auto_162336 ?auto_162338 ) ) ( not ( = ?auto_162336 ?auto_162339 ) ) ( not ( = ?auto_162337 ?auto_162338 ) ) ( not ( = ?auto_162337 ?auto_162339 ) ) ( not ( = ?auto_162338 ?auto_162339 ) ) ( ON-TABLE ?auto_162339 ) ( ON ?auto_162338 ?auto_162339 ) ( ON ?auto_162337 ?auto_162338 ) ( ON ?auto_162332 ?auto_162340 ) ( not ( = ?auto_162332 ?auto_162340 ) ) ( not ( = ?auto_162333 ?auto_162340 ) ) ( not ( = ?auto_162334 ?auto_162340 ) ) ( not ( = ?auto_162335 ?auto_162340 ) ) ( not ( = ?auto_162336 ?auto_162340 ) ) ( not ( = ?auto_162337 ?auto_162340 ) ) ( not ( = ?auto_162338 ?auto_162340 ) ) ( not ( = ?auto_162339 ?auto_162340 ) ) ( ON ?auto_162333 ?auto_162332 ) ( ON-TABLE ?auto_162340 ) ( ON ?auto_162334 ?auto_162333 ) ( ON ?auto_162335 ?auto_162334 ) ( CLEAR ?auto_162337 ) ( ON ?auto_162336 ?auto_162335 ) ( CLEAR ?auto_162336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162340 ?auto_162332 ?auto_162333 ?auto_162334 ?auto_162335 )
      ( MAKE-8PILE ?auto_162332 ?auto_162333 ?auto_162334 ?auto_162335 ?auto_162336 ?auto_162337 ?auto_162338 ?auto_162339 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162341 - BLOCK
      ?auto_162342 - BLOCK
      ?auto_162343 - BLOCK
      ?auto_162344 - BLOCK
      ?auto_162345 - BLOCK
      ?auto_162346 - BLOCK
      ?auto_162347 - BLOCK
      ?auto_162348 - BLOCK
    )
    :vars
    (
      ?auto_162349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162341 ?auto_162342 ) ) ( not ( = ?auto_162341 ?auto_162343 ) ) ( not ( = ?auto_162341 ?auto_162344 ) ) ( not ( = ?auto_162341 ?auto_162345 ) ) ( not ( = ?auto_162341 ?auto_162346 ) ) ( not ( = ?auto_162341 ?auto_162347 ) ) ( not ( = ?auto_162341 ?auto_162348 ) ) ( not ( = ?auto_162342 ?auto_162343 ) ) ( not ( = ?auto_162342 ?auto_162344 ) ) ( not ( = ?auto_162342 ?auto_162345 ) ) ( not ( = ?auto_162342 ?auto_162346 ) ) ( not ( = ?auto_162342 ?auto_162347 ) ) ( not ( = ?auto_162342 ?auto_162348 ) ) ( not ( = ?auto_162343 ?auto_162344 ) ) ( not ( = ?auto_162343 ?auto_162345 ) ) ( not ( = ?auto_162343 ?auto_162346 ) ) ( not ( = ?auto_162343 ?auto_162347 ) ) ( not ( = ?auto_162343 ?auto_162348 ) ) ( not ( = ?auto_162344 ?auto_162345 ) ) ( not ( = ?auto_162344 ?auto_162346 ) ) ( not ( = ?auto_162344 ?auto_162347 ) ) ( not ( = ?auto_162344 ?auto_162348 ) ) ( not ( = ?auto_162345 ?auto_162346 ) ) ( not ( = ?auto_162345 ?auto_162347 ) ) ( not ( = ?auto_162345 ?auto_162348 ) ) ( not ( = ?auto_162346 ?auto_162347 ) ) ( not ( = ?auto_162346 ?auto_162348 ) ) ( not ( = ?auto_162347 ?auto_162348 ) ) ( ON-TABLE ?auto_162348 ) ( ON ?auto_162347 ?auto_162348 ) ( ON ?auto_162341 ?auto_162349 ) ( not ( = ?auto_162341 ?auto_162349 ) ) ( not ( = ?auto_162342 ?auto_162349 ) ) ( not ( = ?auto_162343 ?auto_162349 ) ) ( not ( = ?auto_162344 ?auto_162349 ) ) ( not ( = ?auto_162345 ?auto_162349 ) ) ( not ( = ?auto_162346 ?auto_162349 ) ) ( not ( = ?auto_162347 ?auto_162349 ) ) ( not ( = ?auto_162348 ?auto_162349 ) ) ( ON ?auto_162342 ?auto_162341 ) ( ON-TABLE ?auto_162349 ) ( ON ?auto_162343 ?auto_162342 ) ( ON ?auto_162344 ?auto_162343 ) ( ON ?auto_162345 ?auto_162344 ) ( CLEAR ?auto_162345 ) ( HOLDING ?auto_162346 ) ( CLEAR ?auto_162347 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162348 ?auto_162347 ?auto_162346 )
      ( MAKE-8PILE ?auto_162341 ?auto_162342 ?auto_162343 ?auto_162344 ?auto_162345 ?auto_162346 ?auto_162347 ?auto_162348 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162350 - BLOCK
      ?auto_162351 - BLOCK
      ?auto_162352 - BLOCK
      ?auto_162353 - BLOCK
      ?auto_162354 - BLOCK
      ?auto_162355 - BLOCK
      ?auto_162356 - BLOCK
      ?auto_162357 - BLOCK
    )
    :vars
    (
      ?auto_162358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162350 ?auto_162351 ) ) ( not ( = ?auto_162350 ?auto_162352 ) ) ( not ( = ?auto_162350 ?auto_162353 ) ) ( not ( = ?auto_162350 ?auto_162354 ) ) ( not ( = ?auto_162350 ?auto_162355 ) ) ( not ( = ?auto_162350 ?auto_162356 ) ) ( not ( = ?auto_162350 ?auto_162357 ) ) ( not ( = ?auto_162351 ?auto_162352 ) ) ( not ( = ?auto_162351 ?auto_162353 ) ) ( not ( = ?auto_162351 ?auto_162354 ) ) ( not ( = ?auto_162351 ?auto_162355 ) ) ( not ( = ?auto_162351 ?auto_162356 ) ) ( not ( = ?auto_162351 ?auto_162357 ) ) ( not ( = ?auto_162352 ?auto_162353 ) ) ( not ( = ?auto_162352 ?auto_162354 ) ) ( not ( = ?auto_162352 ?auto_162355 ) ) ( not ( = ?auto_162352 ?auto_162356 ) ) ( not ( = ?auto_162352 ?auto_162357 ) ) ( not ( = ?auto_162353 ?auto_162354 ) ) ( not ( = ?auto_162353 ?auto_162355 ) ) ( not ( = ?auto_162353 ?auto_162356 ) ) ( not ( = ?auto_162353 ?auto_162357 ) ) ( not ( = ?auto_162354 ?auto_162355 ) ) ( not ( = ?auto_162354 ?auto_162356 ) ) ( not ( = ?auto_162354 ?auto_162357 ) ) ( not ( = ?auto_162355 ?auto_162356 ) ) ( not ( = ?auto_162355 ?auto_162357 ) ) ( not ( = ?auto_162356 ?auto_162357 ) ) ( ON-TABLE ?auto_162357 ) ( ON ?auto_162356 ?auto_162357 ) ( ON ?auto_162350 ?auto_162358 ) ( not ( = ?auto_162350 ?auto_162358 ) ) ( not ( = ?auto_162351 ?auto_162358 ) ) ( not ( = ?auto_162352 ?auto_162358 ) ) ( not ( = ?auto_162353 ?auto_162358 ) ) ( not ( = ?auto_162354 ?auto_162358 ) ) ( not ( = ?auto_162355 ?auto_162358 ) ) ( not ( = ?auto_162356 ?auto_162358 ) ) ( not ( = ?auto_162357 ?auto_162358 ) ) ( ON ?auto_162351 ?auto_162350 ) ( ON-TABLE ?auto_162358 ) ( ON ?auto_162352 ?auto_162351 ) ( ON ?auto_162353 ?auto_162352 ) ( ON ?auto_162354 ?auto_162353 ) ( CLEAR ?auto_162356 ) ( ON ?auto_162355 ?auto_162354 ) ( CLEAR ?auto_162355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162358 ?auto_162350 ?auto_162351 ?auto_162352 ?auto_162353 ?auto_162354 )
      ( MAKE-8PILE ?auto_162350 ?auto_162351 ?auto_162352 ?auto_162353 ?auto_162354 ?auto_162355 ?auto_162356 ?auto_162357 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162359 - BLOCK
      ?auto_162360 - BLOCK
      ?auto_162361 - BLOCK
      ?auto_162362 - BLOCK
      ?auto_162363 - BLOCK
      ?auto_162364 - BLOCK
      ?auto_162365 - BLOCK
      ?auto_162366 - BLOCK
    )
    :vars
    (
      ?auto_162367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162359 ?auto_162360 ) ) ( not ( = ?auto_162359 ?auto_162361 ) ) ( not ( = ?auto_162359 ?auto_162362 ) ) ( not ( = ?auto_162359 ?auto_162363 ) ) ( not ( = ?auto_162359 ?auto_162364 ) ) ( not ( = ?auto_162359 ?auto_162365 ) ) ( not ( = ?auto_162359 ?auto_162366 ) ) ( not ( = ?auto_162360 ?auto_162361 ) ) ( not ( = ?auto_162360 ?auto_162362 ) ) ( not ( = ?auto_162360 ?auto_162363 ) ) ( not ( = ?auto_162360 ?auto_162364 ) ) ( not ( = ?auto_162360 ?auto_162365 ) ) ( not ( = ?auto_162360 ?auto_162366 ) ) ( not ( = ?auto_162361 ?auto_162362 ) ) ( not ( = ?auto_162361 ?auto_162363 ) ) ( not ( = ?auto_162361 ?auto_162364 ) ) ( not ( = ?auto_162361 ?auto_162365 ) ) ( not ( = ?auto_162361 ?auto_162366 ) ) ( not ( = ?auto_162362 ?auto_162363 ) ) ( not ( = ?auto_162362 ?auto_162364 ) ) ( not ( = ?auto_162362 ?auto_162365 ) ) ( not ( = ?auto_162362 ?auto_162366 ) ) ( not ( = ?auto_162363 ?auto_162364 ) ) ( not ( = ?auto_162363 ?auto_162365 ) ) ( not ( = ?auto_162363 ?auto_162366 ) ) ( not ( = ?auto_162364 ?auto_162365 ) ) ( not ( = ?auto_162364 ?auto_162366 ) ) ( not ( = ?auto_162365 ?auto_162366 ) ) ( ON-TABLE ?auto_162366 ) ( ON ?auto_162359 ?auto_162367 ) ( not ( = ?auto_162359 ?auto_162367 ) ) ( not ( = ?auto_162360 ?auto_162367 ) ) ( not ( = ?auto_162361 ?auto_162367 ) ) ( not ( = ?auto_162362 ?auto_162367 ) ) ( not ( = ?auto_162363 ?auto_162367 ) ) ( not ( = ?auto_162364 ?auto_162367 ) ) ( not ( = ?auto_162365 ?auto_162367 ) ) ( not ( = ?auto_162366 ?auto_162367 ) ) ( ON ?auto_162360 ?auto_162359 ) ( ON-TABLE ?auto_162367 ) ( ON ?auto_162361 ?auto_162360 ) ( ON ?auto_162362 ?auto_162361 ) ( ON ?auto_162363 ?auto_162362 ) ( ON ?auto_162364 ?auto_162363 ) ( CLEAR ?auto_162364 ) ( HOLDING ?auto_162365 ) ( CLEAR ?auto_162366 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162366 ?auto_162365 )
      ( MAKE-8PILE ?auto_162359 ?auto_162360 ?auto_162361 ?auto_162362 ?auto_162363 ?auto_162364 ?auto_162365 ?auto_162366 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162368 - BLOCK
      ?auto_162369 - BLOCK
      ?auto_162370 - BLOCK
      ?auto_162371 - BLOCK
      ?auto_162372 - BLOCK
      ?auto_162373 - BLOCK
      ?auto_162374 - BLOCK
      ?auto_162375 - BLOCK
    )
    :vars
    (
      ?auto_162376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162368 ?auto_162369 ) ) ( not ( = ?auto_162368 ?auto_162370 ) ) ( not ( = ?auto_162368 ?auto_162371 ) ) ( not ( = ?auto_162368 ?auto_162372 ) ) ( not ( = ?auto_162368 ?auto_162373 ) ) ( not ( = ?auto_162368 ?auto_162374 ) ) ( not ( = ?auto_162368 ?auto_162375 ) ) ( not ( = ?auto_162369 ?auto_162370 ) ) ( not ( = ?auto_162369 ?auto_162371 ) ) ( not ( = ?auto_162369 ?auto_162372 ) ) ( not ( = ?auto_162369 ?auto_162373 ) ) ( not ( = ?auto_162369 ?auto_162374 ) ) ( not ( = ?auto_162369 ?auto_162375 ) ) ( not ( = ?auto_162370 ?auto_162371 ) ) ( not ( = ?auto_162370 ?auto_162372 ) ) ( not ( = ?auto_162370 ?auto_162373 ) ) ( not ( = ?auto_162370 ?auto_162374 ) ) ( not ( = ?auto_162370 ?auto_162375 ) ) ( not ( = ?auto_162371 ?auto_162372 ) ) ( not ( = ?auto_162371 ?auto_162373 ) ) ( not ( = ?auto_162371 ?auto_162374 ) ) ( not ( = ?auto_162371 ?auto_162375 ) ) ( not ( = ?auto_162372 ?auto_162373 ) ) ( not ( = ?auto_162372 ?auto_162374 ) ) ( not ( = ?auto_162372 ?auto_162375 ) ) ( not ( = ?auto_162373 ?auto_162374 ) ) ( not ( = ?auto_162373 ?auto_162375 ) ) ( not ( = ?auto_162374 ?auto_162375 ) ) ( ON-TABLE ?auto_162375 ) ( ON ?auto_162368 ?auto_162376 ) ( not ( = ?auto_162368 ?auto_162376 ) ) ( not ( = ?auto_162369 ?auto_162376 ) ) ( not ( = ?auto_162370 ?auto_162376 ) ) ( not ( = ?auto_162371 ?auto_162376 ) ) ( not ( = ?auto_162372 ?auto_162376 ) ) ( not ( = ?auto_162373 ?auto_162376 ) ) ( not ( = ?auto_162374 ?auto_162376 ) ) ( not ( = ?auto_162375 ?auto_162376 ) ) ( ON ?auto_162369 ?auto_162368 ) ( ON-TABLE ?auto_162376 ) ( ON ?auto_162370 ?auto_162369 ) ( ON ?auto_162371 ?auto_162370 ) ( ON ?auto_162372 ?auto_162371 ) ( ON ?auto_162373 ?auto_162372 ) ( CLEAR ?auto_162375 ) ( ON ?auto_162374 ?auto_162373 ) ( CLEAR ?auto_162374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162376 ?auto_162368 ?auto_162369 ?auto_162370 ?auto_162371 ?auto_162372 ?auto_162373 )
      ( MAKE-8PILE ?auto_162368 ?auto_162369 ?auto_162370 ?auto_162371 ?auto_162372 ?auto_162373 ?auto_162374 ?auto_162375 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162377 - BLOCK
      ?auto_162378 - BLOCK
      ?auto_162379 - BLOCK
      ?auto_162380 - BLOCK
      ?auto_162381 - BLOCK
      ?auto_162382 - BLOCK
      ?auto_162383 - BLOCK
      ?auto_162384 - BLOCK
    )
    :vars
    (
      ?auto_162385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162377 ?auto_162378 ) ) ( not ( = ?auto_162377 ?auto_162379 ) ) ( not ( = ?auto_162377 ?auto_162380 ) ) ( not ( = ?auto_162377 ?auto_162381 ) ) ( not ( = ?auto_162377 ?auto_162382 ) ) ( not ( = ?auto_162377 ?auto_162383 ) ) ( not ( = ?auto_162377 ?auto_162384 ) ) ( not ( = ?auto_162378 ?auto_162379 ) ) ( not ( = ?auto_162378 ?auto_162380 ) ) ( not ( = ?auto_162378 ?auto_162381 ) ) ( not ( = ?auto_162378 ?auto_162382 ) ) ( not ( = ?auto_162378 ?auto_162383 ) ) ( not ( = ?auto_162378 ?auto_162384 ) ) ( not ( = ?auto_162379 ?auto_162380 ) ) ( not ( = ?auto_162379 ?auto_162381 ) ) ( not ( = ?auto_162379 ?auto_162382 ) ) ( not ( = ?auto_162379 ?auto_162383 ) ) ( not ( = ?auto_162379 ?auto_162384 ) ) ( not ( = ?auto_162380 ?auto_162381 ) ) ( not ( = ?auto_162380 ?auto_162382 ) ) ( not ( = ?auto_162380 ?auto_162383 ) ) ( not ( = ?auto_162380 ?auto_162384 ) ) ( not ( = ?auto_162381 ?auto_162382 ) ) ( not ( = ?auto_162381 ?auto_162383 ) ) ( not ( = ?auto_162381 ?auto_162384 ) ) ( not ( = ?auto_162382 ?auto_162383 ) ) ( not ( = ?auto_162382 ?auto_162384 ) ) ( not ( = ?auto_162383 ?auto_162384 ) ) ( ON ?auto_162377 ?auto_162385 ) ( not ( = ?auto_162377 ?auto_162385 ) ) ( not ( = ?auto_162378 ?auto_162385 ) ) ( not ( = ?auto_162379 ?auto_162385 ) ) ( not ( = ?auto_162380 ?auto_162385 ) ) ( not ( = ?auto_162381 ?auto_162385 ) ) ( not ( = ?auto_162382 ?auto_162385 ) ) ( not ( = ?auto_162383 ?auto_162385 ) ) ( not ( = ?auto_162384 ?auto_162385 ) ) ( ON ?auto_162378 ?auto_162377 ) ( ON-TABLE ?auto_162385 ) ( ON ?auto_162379 ?auto_162378 ) ( ON ?auto_162380 ?auto_162379 ) ( ON ?auto_162381 ?auto_162380 ) ( ON ?auto_162382 ?auto_162381 ) ( ON ?auto_162383 ?auto_162382 ) ( CLEAR ?auto_162383 ) ( HOLDING ?auto_162384 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162384 )
      ( MAKE-8PILE ?auto_162377 ?auto_162378 ?auto_162379 ?auto_162380 ?auto_162381 ?auto_162382 ?auto_162383 ?auto_162384 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162386 - BLOCK
      ?auto_162387 - BLOCK
      ?auto_162388 - BLOCK
      ?auto_162389 - BLOCK
      ?auto_162390 - BLOCK
      ?auto_162391 - BLOCK
      ?auto_162392 - BLOCK
      ?auto_162393 - BLOCK
    )
    :vars
    (
      ?auto_162394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_162386 ?auto_162387 ) ) ( not ( = ?auto_162386 ?auto_162388 ) ) ( not ( = ?auto_162386 ?auto_162389 ) ) ( not ( = ?auto_162386 ?auto_162390 ) ) ( not ( = ?auto_162386 ?auto_162391 ) ) ( not ( = ?auto_162386 ?auto_162392 ) ) ( not ( = ?auto_162386 ?auto_162393 ) ) ( not ( = ?auto_162387 ?auto_162388 ) ) ( not ( = ?auto_162387 ?auto_162389 ) ) ( not ( = ?auto_162387 ?auto_162390 ) ) ( not ( = ?auto_162387 ?auto_162391 ) ) ( not ( = ?auto_162387 ?auto_162392 ) ) ( not ( = ?auto_162387 ?auto_162393 ) ) ( not ( = ?auto_162388 ?auto_162389 ) ) ( not ( = ?auto_162388 ?auto_162390 ) ) ( not ( = ?auto_162388 ?auto_162391 ) ) ( not ( = ?auto_162388 ?auto_162392 ) ) ( not ( = ?auto_162388 ?auto_162393 ) ) ( not ( = ?auto_162389 ?auto_162390 ) ) ( not ( = ?auto_162389 ?auto_162391 ) ) ( not ( = ?auto_162389 ?auto_162392 ) ) ( not ( = ?auto_162389 ?auto_162393 ) ) ( not ( = ?auto_162390 ?auto_162391 ) ) ( not ( = ?auto_162390 ?auto_162392 ) ) ( not ( = ?auto_162390 ?auto_162393 ) ) ( not ( = ?auto_162391 ?auto_162392 ) ) ( not ( = ?auto_162391 ?auto_162393 ) ) ( not ( = ?auto_162392 ?auto_162393 ) ) ( ON ?auto_162386 ?auto_162394 ) ( not ( = ?auto_162386 ?auto_162394 ) ) ( not ( = ?auto_162387 ?auto_162394 ) ) ( not ( = ?auto_162388 ?auto_162394 ) ) ( not ( = ?auto_162389 ?auto_162394 ) ) ( not ( = ?auto_162390 ?auto_162394 ) ) ( not ( = ?auto_162391 ?auto_162394 ) ) ( not ( = ?auto_162392 ?auto_162394 ) ) ( not ( = ?auto_162393 ?auto_162394 ) ) ( ON ?auto_162387 ?auto_162386 ) ( ON-TABLE ?auto_162394 ) ( ON ?auto_162388 ?auto_162387 ) ( ON ?auto_162389 ?auto_162388 ) ( ON ?auto_162390 ?auto_162389 ) ( ON ?auto_162391 ?auto_162390 ) ( ON ?auto_162392 ?auto_162391 ) ( ON ?auto_162393 ?auto_162392 ) ( CLEAR ?auto_162393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162394 ?auto_162386 ?auto_162387 ?auto_162388 ?auto_162389 ?auto_162390 ?auto_162391 ?auto_162392 )
      ( MAKE-8PILE ?auto_162386 ?auto_162387 ?auto_162388 ?auto_162389 ?auto_162390 ?auto_162391 ?auto_162392 ?auto_162393 ) )
  )

)

