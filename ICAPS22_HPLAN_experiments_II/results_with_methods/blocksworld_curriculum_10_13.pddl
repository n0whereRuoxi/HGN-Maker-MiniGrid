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
      ?auto_95114 - BLOCK
    )
    :vars
    (
      ?auto_95115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95114 ?auto_95115 ) ( CLEAR ?auto_95114 ) ( HAND-EMPTY ) ( not ( = ?auto_95114 ?auto_95115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95114 ?auto_95115 )
      ( !PUTDOWN ?auto_95114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95117 - BLOCK
    )
    :vars
    (
      ?auto_95118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95117 ?auto_95118 ) ( CLEAR ?auto_95117 ) ( HAND-EMPTY ) ( not ( = ?auto_95117 ?auto_95118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95117 ?auto_95118 )
      ( !PUTDOWN ?auto_95117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95121 - BLOCK
      ?auto_95122 - BLOCK
    )
    :vars
    (
      ?auto_95123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95121 ) ( ON ?auto_95122 ?auto_95123 ) ( CLEAR ?auto_95122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95121 ) ( not ( = ?auto_95121 ?auto_95122 ) ) ( not ( = ?auto_95121 ?auto_95123 ) ) ( not ( = ?auto_95122 ?auto_95123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95122 ?auto_95123 )
      ( !STACK ?auto_95122 ?auto_95121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95126 - BLOCK
      ?auto_95127 - BLOCK
    )
    :vars
    (
      ?auto_95128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95126 ) ( ON ?auto_95127 ?auto_95128 ) ( CLEAR ?auto_95127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95126 ) ( not ( = ?auto_95126 ?auto_95127 ) ) ( not ( = ?auto_95126 ?auto_95128 ) ) ( not ( = ?auto_95127 ?auto_95128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95127 ?auto_95128 )
      ( !STACK ?auto_95127 ?auto_95126 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95131 - BLOCK
      ?auto_95132 - BLOCK
    )
    :vars
    (
      ?auto_95133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95132 ?auto_95133 ) ( not ( = ?auto_95131 ?auto_95132 ) ) ( not ( = ?auto_95131 ?auto_95133 ) ) ( not ( = ?auto_95132 ?auto_95133 ) ) ( ON ?auto_95131 ?auto_95132 ) ( CLEAR ?auto_95131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95131 )
      ( MAKE-2PILE ?auto_95131 ?auto_95132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95136 - BLOCK
      ?auto_95137 - BLOCK
    )
    :vars
    (
      ?auto_95138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95137 ?auto_95138 ) ( not ( = ?auto_95136 ?auto_95137 ) ) ( not ( = ?auto_95136 ?auto_95138 ) ) ( not ( = ?auto_95137 ?auto_95138 ) ) ( ON ?auto_95136 ?auto_95137 ) ( CLEAR ?auto_95136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95136 )
      ( MAKE-2PILE ?auto_95136 ?auto_95137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95142 - BLOCK
      ?auto_95143 - BLOCK
      ?auto_95144 - BLOCK
    )
    :vars
    (
      ?auto_95145 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95143 ) ( ON ?auto_95144 ?auto_95145 ) ( CLEAR ?auto_95144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95142 ) ( ON ?auto_95143 ?auto_95142 ) ( not ( = ?auto_95142 ?auto_95143 ) ) ( not ( = ?auto_95142 ?auto_95144 ) ) ( not ( = ?auto_95142 ?auto_95145 ) ) ( not ( = ?auto_95143 ?auto_95144 ) ) ( not ( = ?auto_95143 ?auto_95145 ) ) ( not ( = ?auto_95144 ?auto_95145 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95144 ?auto_95145 )
      ( !STACK ?auto_95144 ?auto_95143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95149 - BLOCK
      ?auto_95150 - BLOCK
      ?auto_95151 - BLOCK
    )
    :vars
    (
      ?auto_95152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95150 ) ( ON ?auto_95151 ?auto_95152 ) ( CLEAR ?auto_95151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95149 ) ( ON ?auto_95150 ?auto_95149 ) ( not ( = ?auto_95149 ?auto_95150 ) ) ( not ( = ?auto_95149 ?auto_95151 ) ) ( not ( = ?auto_95149 ?auto_95152 ) ) ( not ( = ?auto_95150 ?auto_95151 ) ) ( not ( = ?auto_95150 ?auto_95152 ) ) ( not ( = ?auto_95151 ?auto_95152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95151 ?auto_95152 )
      ( !STACK ?auto_95151 ?auto_95150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95156 - BLOCK
      ?auto_95157 - BLOCK
      ?auto_95158 - BLOCK
    )
    :vars
    (
      ?auto_95159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95158 ?auto_95159 ) ( ON-TABLE ?auto_95156 ) ( not ( = ?auto_95156 ?auto_95157 ) ) ( not ( = ?auto_95156 ?auto_95158 ) ) ( not ( = ?auto_95156 ?auto_95159 ) ) ( not ( = ?auto_95157 ?auto_95158 ) ) ( not ( = ?auto_95157 ?auto_95159 ) ) ( not ( = ?auto_95158 ?auto_95159 ) ) ( CLEAR ?auto_95156 ) ( ON ?auto_95157 ?auto_95158 ) ( CLEAR ?auto_95157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95156 ?auto_95157 )
      ( MAKE-3PILE ?auto_95156 ?auto_95157 ?auto_95158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95163 - BLOCK
      ?auto_95164 - BLOCK
      ?auto_95165 - BLOCK
    )
    :vars
    (
      ?auto_95166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95165 ?auto_95166 ) ( ON-TABLE ?auto_95163 ) ( not ( = ?auto_95163 ?auto_95164 ) ) ( not ( = ?auto_95163 ?auto_95165 ) ) ( not ( = ?auto_95163 ?auto_95166 ) ) ( not ( = ?auto_95164 ?auto_95165 ) ) ( not ( = ?auto_95164 ?auto_95166 ) ) ( not ( = ?auto_95165 ?auto_95166 ) ) ( CLEAR ?auto_95163 ) ( ON ?auto_95164 ?auto_95165 ) ( CLEAR ?auto_95164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95163 ?auto_95164 )
      ( MAKE-3PILE ?auto_95163 ?auto_95164 ?auto_95165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95170 - BLOCK
      ?auto_95171 - BLOCK
      ?auto_95172 - BLOCK
    )
    :vars
    (
      ?auto_95173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95172 ?auto_95173 ) ( not ( = ?auto_95170 ?auto_95171 ) ) ( not ( = ?auto_95170 ?auto_95172 ) ) ( not ( = ?auto_95170 ?auto_95173 ) ) ( not ( = ?auto_95171 ?auto_95172 ) ) ( not ( = ?auto_95171 ?auto_95173 ) ) ( not ( = ?auto_95172 ?auto_95173 ) ) ( ON ?auto_95171 ?auto_95172 ) ( ON ?auto_95170 ?auto_95171 ) ( CLEAR ?auto_95170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95170 )
      ( MAKE-3PILE ?auto_95170 ?auto_95171 ?auto_95172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95177 - BLOCK
      ?auto_95178 - BLOCK
      ?auto_95179 - BLOCK
    )
    :vars
    (
      ?auto_95180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95179 ?auto_95180 ) ( not ( = ?auto_95177 ?auto_95178 ) ) ( not ( = ?auto_95177 ?auto_95179 ) ) ( not ( = ?auto_95177 ?auto_95180 ) ) ( not ( = ?auto_95178 ?auto_95179 ) ) ( not ( = ?auto_95178 ?auto_95180 ) ) ( not ( = ?auto_95179 ?auto_95180 ) ) ( ON ?auto_95178 ?auto_95179 ) ( ON ?auto_95177 ?auto_95178 ) ( CLEAR ?auto_95177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95177 )
      ( MAKE-3PILE ?auto_95177 ?auto_95178 ?auto_95179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95185 - BLOCK
      ?auto_95186 - BLOCK
      ?auto_95187 - BLOCK
      ?auto_95188 - BLOCK
    )
    :vars
    (
      ?auto_95189 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95187 ) ( ON ?auto_95188 ?auto_95189 ) ( CLEAR ?auto_95188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95185 ) ( ON ?auto_95186 ?auto_95185 ) ( ON ?auto_95187 ?auto_95186 ) ( not ( = ?auto_95185 ?auto_95186 ) ) ( not ( = ?auto_95185 ?auto_95187 ) ) ( not ( = ?auto_95185 ?auto_95188 ) ) ( not ( = ?auto_95185 ?auto_95189 ) ) ( not ( = ?auto_95186 ?auto_95187 ) ) ( not ( = ?auto_95186 ?auto_95188 ) ) ( not ( = ?auto_95186 ?auto_95189 ) ) ( not ( = ?auto_95187 ?auto_95188 ) ) ( not ( = ?auto_95187 ?auto_95189 ) ) ( not ( = ?auto_95188 ?auto_95189 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95188 ?auto_95189 )
      ( !STACK ?auto_95188 ?auto_95187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95194 - BLOCK
      ?auto_95195 - BLOCK
      ?auto_95196 - BLOCK
      ?auto_95197 - BLOCK
    )
    :vars
    (
      ?auto_95198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95196 ) ( ON ?auto_95197 ?auto_95198 ) ( CLEAR ?auto_95197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95194 ) ( ON ?auto_95195 ?auto_95194 ) ( ON ?auto_95196 ?auto_95195 ) ( not ( = ?auto_95194 ?auto_95195 ) ) ( not ( = ?auto_95194 ?auto_95196 ) ) ( not ( = ?auto_95194 ?auto_95197 ) ) ( not ( = ?auto_95194 ?auto_95198 ) ) ( not ( = ?auto_95195 ?auto_95196 ) ) ( not ( = ?auto_95195 ?auto_95197 ) ) ( not ( = ?auto_95195 ?auto_95198 ) ) ( not ( = ?auto_95196 ?auto_95197 ) ) ( not ( = ?auto_95196 ?auto_95198 ) ) ( not ( = ?auto_95197 ?auto_95198 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95197 ?auto_95198 )
      ( !STACK ?auto_95197 ?auto_95196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95203 - BLOCK
      ?auto_95204 - BLOCK
      ?auto_95205 - BLOCK
      ?auto_95206 - BLOCK
    )
    :vars
    (
      ?auto_95207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95206 ?auto_95207 ) ( ON-TABLE ?auto_95203 ) ( ON ?auto_95204 ?auto_95203 ) ( not ( = ?auto_95203 ?auto_95204 ) ) ( not ( = ?auto_95203 ?auto_95205 ) ) ( not ( = ?auto_95203 ?auto_95206 ) ) ( not ( = ?auto_95203 ?auto_95207 ) ) ( not ( = ?auto_95204 ?auto_95205 ) ) ( not ( = ?auto_95204 ?auto_95206 ) ) ( not ( = ?auto_95204 ?auto_95207 ) ) ( not ( = ?auto_95205 ?auto_95206 ) ) ( not ( = ?auto_95205 ?auto_95207 ) ) ( not ( = ?auto_95206 ?auto_95207 ) ) ( CLEAR ?auto_95204 ) ( ON ?auto_95205 ?auto_95206 ) ( CLEAR ?auto_95205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95203 ?auto_95204 ?auto_95205 )
      ( MAKE-4PILE ?auto_95203 ?auto_95204 ?auto_95205 ?auto_95206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95212 - BLOCK
      ?auto_95213 - BLOCK
      ?auto_95214 - BLOCK
      ?auto_95215 - BLOCK
    )
    :vars
    (
      ?auto_95216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95215 ?auto_95216 ) ( ON-TABLE ?auto_95212 ) ( ON ?auto_95213 ?auto_95212 ) ( not ( = ?auto_95212 ?auto_95213 ) ) ( not ( = ?auto_95212 ?auto_95214 ) ) ( not ( = ?auto_95212 ?auto_95215 ) ) ( not ( = ?auto_95212 ?auto_95216 ) ) ( not ( = ?auto_95213 ?auto_95214 ) ) ( not ( = ?auto_95213 ?auto_95215 ) ) ( not ( = ?auto_95213 ?auto_95216 ) ) ( not ( = ?auto_95214 ?auto_95215 ) ) ( not ( = ?auto_95214 ?auto_95216 ) ) ( not ( = ?auto_95215 ?auto_95216 ) ) ( CLEAR ?auto_95213 ) ( ON ?auto_95214 ?auto_95215 ) ( CLEAR ?auto_95214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95212 ?auto_95213 ?auto_95214 )
      ( MAKE-4PILE ?auto_95212 ?auto_95213 ?auto_95214 ?auto_95215 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95221 - BLOCK
      ?auto_95222 - BLOCK
      ?auto_95223 - BLOCK
      ?auto_95224 - BLOCK
    )
    :vars
    (
      ?auto_95225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95224 ?auto_95225 ) ( ON-TABLE ?auto_95221 ) ( not ( = ?auto_95221 ?auto_95222 ) ) ( not ( = ?auto_95221 ?auto_95223 ) ) ( not ( = ?auto_95221 ?auto_95224 ) ) ( not ( = ?auto_95221 ?auto_95225 ) ) ( not ( = ?auto_95222 ?auto_95223 ) ) ( not ( = ?auto_95222 ?auto_95224 ) ) ( not ( = ?auto_95222 ?auto_95225 ) ) ( not ( = ?auto_95223 ?auto_95224 ) ) ( not ( = ?auto_95223 ?auto_95225 ) ) ( not ( = ?auto_95224 ?auto_95225 ) ) ( ON ?auto_95223 ?auto_95224 ) ( CLEAR ?auto_95221 ) ( ON ?auto_95222 ?auto_95223 ) ( CLEAR ?auto_95222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95221 ?auto_95222 )
      ( MAKE-4PILE ?auto_95221 ?auto_95222 ?auto_95223 ?auto_95224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95230 - BLOCK
      ?auto_95231 - BLOCK
      ?auto_95232 - BLOCK
      ?auto_95233 - BLOCK
    )
    :vars
    (
      ?auto_95234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95233 ?auto_95234 ) ( ON-TABLE ?auto_95230 ) ( not ( = ?auto_95230 ?auto_95231 ) ) ( not ( = ?auto_95230 ?auto_95232 ) ) ( not ( = ?auto_95230 ?auto_95233 ) ) ( not ( = ?auto_95230 ?auto_95234 ) ) ( not ( = ?auto_95231 ?auto_95232 ) ) ( not ( = ?auto_95231 ?auto_95233 ) ) ( not ( = ?auto_95231 ?auto_95234 ) ) ( not ( = ?auto_95232 ?auto_95233 ) ) ( not ( = ?auto_95232 ?auto_95234 ) ) ( not ( = ?auto_95233 ?auto_95234 ) ) ( ON ?auto_95232 ?auto_95233 ) ( CLEAR ?auto_95230 ) ( ON ?auto_95231 ?auto_95232 ) ( CLEAR ?auto_95231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95230 ?auto_95231 )
      ( MAKE-4PILE ?auto_95230 ?auto_95231 ?auto_95232 ?auto_95233 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95239 - BLOCK
      ?auto_95240 - BLOCK
      ?auto_95241 - BLOCK
      ?auto_95242 - BLOCK
    )
    :vars
    (
      ?auto_95243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95242 ?auto_95243 ) ( not ( = ?auto_95239 ?auto_95240 ) ) ( not ( = ?auto_95239 ?auto_95241 ) ) ( not ( = ?auto_95239 ?auto_95242 ) ) ( not ( = ?auto_95239 ?auto_95243 ) ) ( not ( = ?auto_95240 ?auto_95241 ) ) ( not ( = ?auto_95240 ?auto_95242 ) ) ( not ( = ?auto_95240 ?auto_95243 ) ) ( not ( = ?auto_95241 ?auto_95242 ) ) ( not ( = ?auto_95241 ?auto_95243 ) ) ( not ( = ?auto_95242 ?auto_95243 ) ) ( ON ?auto_95241 ?auto_95242 ) ( ON ?auto_95240 ?auto_95241 ) ( ON ?auto_95239 ?auto_95240 ) ( CLEAR ?auto_95239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95239 )
      ( MAKE-4PILE ?auto_95239 ?auto_95240 ?auto_95241 ?auto_95242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95248 - BLOCK
      ?auto_95249 - BLOCK
      ?auto_95250 - BLOCK
      ?auto_95251 - BLOCK
    )
    :vars
    (
      ?auto_95252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95251 ?auto_95252 ) ( not ( = ?auto_95248 ?auto_95249 ) ) ( not ( = ?auto_95248 ?auto_95250 ) ) ( not ( = ?auto_95248 ?auto_95251 ) ) ( not ( = ?auto_95248 ?auto_95252 ) ) ( not ( = ?auto_95249 ?auto_95250 ) ) ( not ( = ?auto_95249 ?auto_95251 ) ) ( not ( = ?auto_95249 ?auto_95252 ) ) ( not ( = ?auto_95250 ?auto_95251 ) ) ( not ( = ?auto_95250 ?auto_95252 ) ) ( not ( = ?auto_95251 ?auto_95252 ) ) ( ON ?auto_95250 ?auto_95251 ) ( ON ?auto_95249 ?auto_95250 ) ( ON ?auto_95248 ?auto_95249 ) ( CLEAR ?auto_95248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95248 )
      ( MAKE-4PILE ?auto_95248 ?auto_95249 ?auto_95250 ?auto_95251 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95258 - BLOCK
      ?auto_95259 - BLOCK
      ?auto_95260 - BLOCK
      ?auto_95261 - BLOCK
      ?auto_95262 - BLOCK
    )
    :vars
    (
      ?auto_95263 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95261 ) ( ON ?auto_95262 ?auto_95263 ) ( CLEAR ?auto_95262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95258 ) ( ON ?auto_95259 ?auto_95258 ) ( ON ?auto_95260 ?auto_95259 ) ( ON ?auto_95261 ?auto_95260 ) ( not ( = ?auto_95258 ?auto_95259 ) ) ( not ( = ?auto_95258 ?auto_95260 ) ) ( not ( = ?auto_95258 ?auto_95261 ) ) ( not ( = ?auto_95258 ?auto_95262 ) ) ( not ( = ?auto_95258 ?auto_95263 ) ) ( not ( = ?auto_95259 ?auto_95260 ) ) ( not ( = ?auto_95259 ?auto_95261 ) ) ( not ( = ?auto_95259 ?auto_95262 ) ) ( not ( = ?auto_95259 ?auto_95263 ) ) ( not ( = ?auto_95260 ?auto_95261 ) ) ( not ( = ?auto_95260 ?auto_95262 ) ) ( not ( = ?auto_95260 ?auto_95263 ) ) ( not ( = ?auto_95261 ?auto_95262 ) ) ( not ( = ?auto_95261 ?auto_95263 ) ) ( not ( = ?auto_95262 ?auto_95263 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95262 ?auto_95263 )
      ( !STACK ?auto_95262 ?auto_95261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95269 - BLOCK
      ?auto_95270 - BLOCK
      ?auto_95271 - BLOCK
      ?auto_95272 - BLOCK
      ?auto_95273 - BLOCK
    )
    :vars
    (
      ?auto_95274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95272 ) ( ON ?auto_95273 ?auto_95274 ) ( CLEAR ?auto_95273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95269 ) ( ON ?auto_95270 ?auto_95269 ) ( ON ?auto_95271 ?auto_95270 ) ( ON ?auto_95272 ?auto_95271 ) ( not ( = ?auto_95269 ?auto_95270 ) ) ( not ( = ?auto_95269 ?auto_95271 ) ) ( not ( = ?auto_95269 ?auto_95272 ) ) ( not ( = ?auto_95269 ?auto_95273 ) ) ( not ( = ?auto_95269 ?auto_95274 ) ) ( not ( = ?auto_95270 ?auto_95271 ) ) ( not ( = ?auto_95270 ?auto_95272 ) ) ( not ( = ?auto_95270 ?auto_95273 ) ) ( not ( = ?auto_95270 ?auto_95274 ) ) ( not ( = ?auto_95271 ?auto_95272 ) ) ( not ( = ?auto_95271 ?auto_95273 ) ) ( not ( = ?auto_95271 ?auto_95274 ) ) ( not ( = ?auto_95272 ?auto_95273 ) ) ( not ( = ?auto_95272 ?auto_95274 ) ) ( not ( = ?auto_95273 ?auto_95274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95273 ?auto_95274 )
      ( !STACK ?auto_95273 ?auto_95272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95280 - BLOCK
      ?auto_95281 - BLOCK
      ?auto_95282 - BLOCK
      ?auto_95283 - BLOCK
      ?auto_95284 - BLOCK
    )
    :vars
    (
      ?auto_95285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95284 ?auto_95285 ) ( ON-TABLE ?auto_95280 ) ( ON ?auto_95281 ?auto_95280 ) ( ON ?auto_95282 ?auto_95281 ) ( not ( = ?auto_95280 ?auto_95281 ) ) ( not ( = ?auto_95280 ?auto_95282 ) ) ( not ( = ?auto_95280 ?auto_95283 ) ) ( not ( = ?auto_95280 ?auto_95284 ) ) ( not ( = ?auto_95280 ?auto_95285 ) ) ( not ( = ?auto_95281 ?auto_95282 ) ) ( not ( = ?auto_95281 ?auto_95283 ) ) ( not ( = ?auto_95281 ?auto_95284 ) ) ( not ( = ?auto_95281 ?auto_95285 ) ) ( not ( = ?auto_95282 ?auto_95283 ) ) ( not ( = ?auto_95282 ?auto_95284 ) ) ( not ( = ?auto_95282 ?auto_95285 ) ) ( not ( = ?auto_95283 ?auto_95284 ) ) ( not ( = ?auto_95283 ?auto_95285 ) ) ( not ( = ?auto_95284 ?auto_95285 ) ) ( CLEAR ?auto_95282 ) ( ON ?auto_95283 ?auto_95284 ) ( CLEAR ?auto_95283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95280 ?auto_95281 ?auto_95282 ?auto_95283 )
      ( MAKE-5PILE ?auto_95280 ?auto_95281 ?auto_95282 ?auto_95283 ?auto_95284 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95291 - BLOCK
      ?auto_95292 - BLOCK
      ?auto_95293 - BLOCK
      ?auto_95294 - BLOCK
      ?auto_95295 - BLOCK
    )
    :vars
    (
      ?auto_95296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95295 ?auto_95296 ) ( ON-TABLE ?auto_95291 ) ( ON ?auto_95292 ?auto_95291 ) ( ON ?auto_95293 ?auto_95292 ) ( not ( = ?auto_95291 ?auto_95292 ) ) ( not ( = ?auto_95291 ?auto_95293 ) ) ( not ( = ?auto_95291 ?auto_95294 ) ) ( not ( = ?auto_95291 ?auto_95295 ) ) ( not ( = ?auto_95291 ?auto_95296 ) ) ( not ( = ?auto_95292 ?auto_95293 ) ) ( not ( = ?auto_95292 ?auto_95294 ) ) ( not ( = ?auto_95292 ?auto_95295 ) ) ( not ( = ?auto_95292 ?auto_95296 ) ) ( not ( = ?auto_95293 ?auto_95294 ) ) ( not ( = ?auto_95293 ?auto_95295 ) ) ( not ( = ?auto_95293 ?auto_95296 ) ) ( not ( = ?auto_95294 ?auto_95295 ) ) ( not ( = ?auto_95294 ?auto_95296 ) ) ( not ( = ?auto_95295 ?auto_95296 ) ) ( CLEAR ?auto_95293 ) ( ON ?auto_95294 ?auto_95295 ) ( CLEAR ?auto_95294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95291 ?auto_95292 ?auto_95293 ?auto_95294 )
      ( MAKE-5PILE ?auto_95291 ?auto_95292 ?auto_95293 ?auto_95294 ?auto_95295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95302 - BLOCK
      ?auto_95303 - BLOCK
      ?auto_95304 - BLOCK
      ?auto_95305 - BLOCK
      ?auto_95306 - BLOCK
    )
    :vars
    (
      ?auto_95307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95306 ?auto_95307 ) ( ON-TABLE ?auto_95302 ) ( ON ?auto_95303 ?auto_95302 ) ( not ( = ?auto_95302 ?auto_95303 ) ) ( not ( = ?auto_95302 ?auto_95304 ) ) ( not ( = ?auto_95302 ?auto_95305 ) ) ( not ( = ?auto_95302 ?auto_95306 ) ) ( not ( = ?auto_95302 ?auto_95307 ) ) ( not ( = ?auto_95303 ?auto_95304 ) ) ( not ( = ?auto_95303 ?auto_95305 ) ) ( not ( = ?auto_95303 ?auto_95306 ) ) ( not ( = ?auto_95303 ?auto_95307 ) ) ( not ( = ?auto_95304 ?auto_95305 ) ) ( not ( = ?auto_95304 ?auto_95306 ) ) ( not ( = ?auto_95304 ?auto_95307 ) ) ( not ( = ?auto_95305 ?auto_95306 ) ) ( not ( = ?auto_95305 ?auto_95307 ) ) ( not ( = ?auto_95306 ?auto_95307 ) ) ( ON ?auto_95305 ?auto_95306 ) ( CLEAR ?auto_95303 ) ( ON ?auto_95304 ?auto_95305 ) ( CLEAR ?auto_95304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95302 ?auto_95303 ?auto_95304 )
      ( MAKE-5PILE ?auto_95302 ?auto_95303 ?auto_95304 ?auto_95305 ?auto_95306 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95313 - BLOCK
      ?auto_95314 - BLOCK
      ?auto_95315 - BLOCK
      ?auto_95316 - BLOCK
      ?auto_95317 - BLOCK
    )
    :vars
    (
      ?auto_95318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95317 ?auto_95318 ) ( ON-TABLE ?auto_95313 ) ( ON ?auto_95314 ?auto_95313 ) ( not ( = ?auto_95313 ?auto_95314 ) ) ( not ( = ?auto_95313 ?auto_95315 ) ) ( not ( = ?auto_95313 ?auto_95316 ) ) ( not ( = ?auto_95313 ?auto_95317 ) ) ( not ( = ?auto_95313 ?auto_95318 ) ) ( not ( = ?auto_95314 ?auto_95315 ) ) ( not ( = ?auto_95314 ?auto_95316 ) ) ( not ( = ?auto_95314 ?auto_95317 ) ) ( not ( = ?auto_95314 ?auto_95318 ) ) ( not ( = ?auto_95315 ?auto_95316 ) ) ( not ( = ?auto_95315 ?auto_95317 ) ) ( not ( = ?auto_95315 ?auto_95318 ) ) ( not ( = ?auto_95316 ?auto_95317 ) ) ( not ( = ?auto_95316 ?auto_95318 ) ) ( not ( = ?auto_95317 ?auto_95318 ) ) ( ON ?auto_95316 ?auto_95317 ) ( CLEAR ?auto_95314 ) ( ON ?auto_95315 ?auto_95316 ) ( CLEAR ?auto_95315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95313 ?auto_95314 ?auto_95315 )
      ( MAKE-5PILE ?auto_95313 ?auto_95314 ?auto_95315 ?auto_95316 ?auto_95317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95324 - BLOCK
      ?auto_95325 - BLOCK
      ?auto_95326 - BLOCK
      ?auto_95327 - BLOCK
      ?auto_95328 - BLOCK
    )
    :vars
    (
      ?auto_95329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95328 ?auto_95329 ) ( ON-TABLE ?auto_95324 ) ( not ( = ?auto_95324 ?auto_95325 ) ) ( not ( = ?auto_95324 ?auto_95326 ) ) ( not ( = ?auto_95324 ?auto_95327 ) ) ( not ( = ?auto_95324 ?auto_95328 ) ) ( not ( = ?auto_95324 ?auto_95329 ) ) ( not ( = ?auto_95325 ?auto_95326 ) ) ( not ( = ?auto_95325 ?auto_95327 ) ) ( not ( = ?auto_95325 ?auto_95328 ) ) ( not ( = ?auto_95325 ?auto_95329 ) ) ( not ( = ?auto_95326 ?auto_95327 ) ) ( not ( = ?auto_95326 ?auto_95328 ) ) ( not ( = ?auto_95326 ?auto_95329 ) ) ( not ( = ?auto_95327 ?auto_95328 ) ) ( not ( = ?auto_95327 ?auto_95329 ) ) ( not ( = ?auto_95328 ?auto_95329 ) ) ( ON ?auto_95327 ?auto_95328 ) ( ON ?auto_95326 ?auto_95327 ) ( CLEAR ?auto_95324 ) ( ON ?auto_95325 ?auto_95326 ) ( CLEAR ?auto_95325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95324 ?auto_95325 )
      ( MAKE-5PILE ?auto_95324 ?auto_95325 ?auto_95326 ?auto_95327 ?auto_95328 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95335 - BLOCK
      ?auto_95336 - BLOCK
      ?auto_95337 - BLOCK
      ?auto_95338 - BLOCK
      ?auto_95339 - BLOCK
    )
    :vars
    (
      ?auto_95340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95339 ?auto_95340 ) ( ON-TABLE ?auto_95335 ) ( not ( = ?auto_95335 ?auto_95336 ) ) ( not ( = ?auto_95335 ?auto_95337 ) ) ( not ( = ?auto_95335 ?auto_95338 ) ) ( not ( = ?auto_95335 ?auto_95339 ) ) ( not ( = ?auto_95335 ?auto_95340 ) ) ( not ( = ?auto_95336 ?auto_95337 ) ) ( not ( = ?auto_95336 ?auto_95338 ) ) ( not ( = ?auto_95336 ?auto_95339 ) ) ( not ( = ?auto_95336 ?auto_95340 ) ) ( not ( = ?auto_95337 ?auto_95338 ) ) ( not ( = ?auto_95337 ?auto_95339 ) ) ( not ( = ?auto_95337 ?auto_95340 ) ) ( not ( = ?auto_95338 ?auto_95339 ) ) ( not ( = ?auto_95338 ?auto_95340 ) ) ( not ( = ?auto_95339 ?auto_95340 ) ) ( ON ?auto_95338 ?auto_95339 ) ( ON ?auto_95337 ?auto_95338 ) ( CLEAR ?auto_95335 ) ( ON ?auto_95336 ?auto_95337 ) ( CLEAR ?auto_95336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95335 ?auto_95336 )
      ( MAKE-5PILE ?auto_95335 ?auto_95336 ?auto_95337 ?auto_95338 ?auto_95339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95346 - BLOCK
      ?auto_95347 - BLOCK
      ?auto_95348 - BLOCK
      ?auto_95349 - BLOCK
      ?auto_95350 - BLOCK
    )
    :vars
    (
      ?auto_95351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95350 ?auto_95351 ) ( not ( = ?auto_95346 ?auto_95347 ) ) ( not ( = ?auto_95346 ?auto_95348 ) ) ( not ( = ?auto_95346 ?auto_95349 ) ) ( not ( = ?auto_95346 ?auto_95350 ) ) ( not ( = ?auto_95346 ?auto_95351 ) ) ( not ( = ?auto_95347 ?auto_95348 ) ) ( not ( = ?auto_95347 ?auto_95349 ) ) ( not ( = ?auto_95347 ?auto_95350 ) ) ( not ( = ?auto_95347 ?auto_95351 ) ) ( not ( = ?auto_95348 ?auto_95349 ) ) ( not ( = ?auto_95348 ?auto_95350 ) ) ( not ( = ?auto_95348 ?auto_95351 ) ) ( not ( = ?auto_95349 ?auto_95350 ) ) ( not ( = ?auto_95349 ?auto_95351 ) ) ( not ( = ?auto_95350 ?auto_95351 ) ) ( ON ?auto_95349 ?auto_95350 ) ( ON ?auto_95348 ?auto_95349 ) ( ON ?auto_95347 ?auto_95348 ) ( ON ?auto_95346 ?auto_95347 ) ( CLEAR ?auto_95346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95346 )
      ( MAKE-5PILE ?auto_95346 ?auto_95347 ?auto_95348 ?auto_95349 ?auto_95350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95357 - BLOCK
      ?auto_95358 - BLOCK
      ?auto_95359 - BLOCK
      ?auto_95360 - BLOCK
      ?auto_95361 - BLOCK
    )
    :vars
    (
      ?auto_95362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95361 ?auto_95362 ) ( not ( = ?auto_95357 ?auto_95358 ) ) ( not ( = ?auto_95357 ?auto_95359 ) ) ( not ( = ?auto_95357 ?auto_95360 ) ) ( not ( = ?auto_95357 ?auto_95361 ) ) ( not ( = ?auto_95357 ?auto_95362 ) ) ( not ( = ?auto_95358 ?auto_95359 ) ) ( not ( = ?auto_95358 ?auto_95360 ) ) ( not ( = ?auto_95358 ?auto_95361 ) ) ( not ( = ?auto_95358 ?auto_95362 ) ) ( not ( = ?auto_95359 ?auto_95360 ) ) ( not ( = ?auto_95359 ?auto_95361 ) ) ( not ( = ?auto_95359 ?auto_95362 ) ) ( not ( = ?auto_95360 ?auto_95361 ) ) ( not ( = ?auto_95360 ?auto_95362 ) ) ( not ( = ?auto_95361 ?auto_95362 ) ) ( ON ?auto_95360 ?auto_95361 ) ( ON ?auto_95359 ?auto_95360 ) ( ON ?auto_95358 ?auto_95359 ) ( ON ?auto_95357 ?auto_95358 ) ( CLEAR ?auto_95357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95357 )
      ( MAKE-5PILE ?auto_95357 ?auto_95358 ?auto_95359 ?auto_95360 ?auto_95361 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95369 - BLOCK
      ?auto_95370 - BLOCK
      ?auto_95371 - BLOCK
      ?auto_95372 - BLOCK
      ?auto_95373 - BLOCK
      ?auto_95374 - BLOCK
    )
    :vars
    (
      ?auto_95375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95373 ) ( ON ?auto_95374 ?auto_95375 ) ( CLEAR ?auto_95374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95369 ) ( ON ?auto_95370 ?auto_95369 ) ( ON ?auto_95371 ?auto_95370 ) ( ON ?auto_95372 ?auto_95371 ) ( ON ?auto_95373 ?auto_95372 ) ( not ( = ?auto_95369 ?auto_95370 ) ) ( not ( = ?auto_95369 ?auto_95371 ) ) ( not ( = ?auto_95369 ?auto_95372 ) ) ( not ( = ?auto_95369 ?auto_95373 ) ) ( not ( = ?auto_95369 ?auto_95374 ) ) ( not ( = ?auto_95369 ?auto_95375 ) ) ( not ( = ?auto_95370 ?auto_95371 ) ) ( not ( = ?auto_95370 ?auto_95372 ) ) ( not ( = ?auto_95370 ?auto_95373 ) ) ( not ( = ?auto_95370 ?auto_95374 ) ) ( not ( = ?auto_95370 ?auto_95375 ) ) ( not ( = ?auto_95371 ?auto_95372 ) ) ( not ( = ?auto_95371 ?auto_95373 ) ) ( not ( = ?auto_95371 ?auto_95374 ) ) ( not ( = ?auto_95371 ?auto_95375 ) ) ( not ( = ?auto_95372 ?auto_95373 ) ) ( not ( = ?auto_95372 ?auto_95374 ) ) ( not ( = ?auto_95372 ?auto_95375 ) ) ( not ( = ?auto_95373 ?auto_95374 ) ) ( not ( = ?auto_95373 ?auto_95375 ) ) ( not ( = ?auto_95374 ?auto_95375 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95374 ?auto_95375 )
      ( !STACK ?auto_95374 ?auto_95373 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95382 - BLOCK
      ?auto_95383 - BLOCK
      ?auto_95384 - BLOCK
      ?auto_95385 - BLOCK
      ?auto_95386 - BLOCK
      ?auto_95387 - BLOCK
    )
    :vars
    (
      ?auto_95388 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95386 ) ( ON ?auto_95387 ?auto_95388 ) ( CLEAR ?auto_95387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95382 ) ( ON ?auto_95383 ?auto_95382 ) ( ON ?auto_95384 ?auto_95383 ) ( ON ?auto_95385 ?auto_95384 ) ( ON ?auto_95386 ?auto_95385 ) ( not ( = ?auto_95382 ?auto_95383 ) ) ( not ( = ?auto_95382 ?auto_95384 ) ) ( not ( = ?auto_95382 ?auto_95385 ) ) ( not ( = ?auto_95382 ?auto_95386 ) ) ( not ( = ?auto_95382 ?auto_95387 ) ) ( not ( = ?auto_95382 ?auto_95388 ) ) ( not ( = ?auto_95383 ?auto_95384 ) ) ( not ( = ?auto_95383 ?auto_95385 ) ) ( not ( = ?auto_95383 ?auto_95386 ) ) ( not ( = ?auto_95383 ?auto_95387 ) ) ( not ( = ?auto_95383 ?auto_95388 ) ) ( not ( = ?auto_95384 ?auto_95385 ) ) ( not ( = ?auto_95384 ?auto_95386 ) ) ( not ( = ?auto_95384 ?auto_95387 ) ) ( not ( = ?auto_95384 ?auto_95388 ) ) ( not ( = ?auto_95385 ?auto_95386 ) ) ( not ( = ?auto_95385 ?auto_95387 ) ) ( not ( = ?auto_95385 ?auto_95388 ) ) ( not ( = ?auto_95386 ?auto_95387 ) ) ( not ( = ?auto_95386 ?auto_95388 ) ) ( not ( = ?auto_95387 ?auto_95388 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95387 ?auto_95388 )
      ( !STACK ?auto_95387 ?auto_95386 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95395 - BLOCK
      ?auto_95396 - BLOCK
      ?auto_95397 - BLOCK
      ?auto_95398 - BLOCK
      ?auto_95399 - BLOCK
      ?auto_95400 - BLOCK
    )
    :vars
    (
      ?auto_95401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95400 ?auto_95401 ) ( ON-TABLE ?auto_95395 ) ( ON ?auto_95396 ?auto_95395 ) ( ON ?auto_95397 ?auto_95396 ) ( ON ?auto_95398 ?auto_95397 ) ( not ( = ?auto_95395 ?auto_95396 ) ) ( not ( = ?auto_95395 ?auto_95397 ) ) ( not ( = ?auto_95395 ?auto_95398 ) ) ( not ( = ?auto_95395 ?auto_95399 ) ) ( not ( = ?auto_95395 ?auto_95400 ) ) ( not ( = ?auto_95395 ?auto_95401 ) ) ( not ( = ?auto_95396 ?auto_95397 ) ) ( not ( = ?auto_95396 ?auto_95398 ) ) ( not ( = ?auto_95396 ?auto_95399 ) ) ( not ( = ?auto_95396 ?auto_95400 ) ) ( not ( = ?auto_95396 ?auto_95401 ) ) ( not ( = ?auto_95397 ?auto_95398 ) ) ( not ( = ?auto_95397 ?auto_95399 ) ) ( not ( = ?auto_95397 ?auto_95400 ) ) ( not ( = ?auto_95397 ?auto_95401 ) ) ( not ( = ?auto_95398 ?auto_95399 ) ) ( not ( = ?auto_95398 ?auto_95400 ) ) ( not ( = ?auto_95398 ?auto_95401 ) ) ( not ( = ?auto_95399 ?auto_95400 ) ) ( not ( = ?auto_95399 ?auto_95401 ) ) ( not ( = ?auto_95400 ?auto_95401 ) ) ( CLEAR ?auto_95398 ) ( ON ?auto_95399 ?auto_95400 ) ( CLEAR ?auto_95399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95395 ?auto_95396 ?auto_95397 ?auto_95398 ?auto_95399 )
      ( MAKE-6PILE ?auto_95395 ?auto_95396 ?auto_95397 ?auto_95398 ?auto_95399 ?auto_95400 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95408 - BLOCK
      ?auto_95409 - BLOCK
      ?auto_95410 - BLOCK
      ?auto_95411 - BLOCK
      ?auto_95412 - BLOCK
      ?auto_95413 - BLOCK
    )
    :vars
    (
      ?auto_95414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95413 ?auto_95414 ) ( ON-TABLE ?auto_95408 ) ( ON ?auto_95409 ?auto_95408 ) ( ON ?auto_95410 ?auto_95409 ) ( ON ?auto_95411 ?auto_95410 ) ( not ( = ?auto_95408 ?auto_95409 ) ) ( not ( = ?auto_95408 ?auto_95410 ) ) ( not ( = ?auto_95408 ?auto_95411 ) ) ( not ( = ?auto_95408 ?auto_95412 ) ) ( not ( = ?auto_95408 ?auto_95413 ) ) ( not ( = ?auto_95408 ?auto_95414 ) ) ( not ( = ?auto_95409 ?auto_95410 ) ) ( not ( = ?auto_95409 ?auto_95411 ) ) ( not ( = ?auto_95409 ?auto_95412 ) ) ( not ( = ?auto_95409 ?auto_95413 ) ) ( not ( = ?auto_95409 ?auto_95414 ) ) ( not ( = ?auto_95410 ?auto_95411 ) ) ( not ( = ?auto_95410 ?auto_95412 ) ) ( not ( = ?auto_95410 ?auto_95413 ) ) ( not ( = ?auto_95410 ?auto_95414 ) ) ( not ( = ?auto_95411 ?auto_95412 ) ) ( not ( = ?auto_95411 ?auto_95413 ) ) ( not ( = ?auto_95411 ?auto_95414 ) ) ( not ( = ?auto_95412 ?auto_95413 ) ) ( not ( = ?auto_95412 ?auto_95414 ) ) ( not ( = ?auto_95413 ?auto_95414 ) ) ( CLEAR ?auto_95411 ) ( ON ?auto_95412 ?auto_95413 ) ( CLEAR ?auto_95412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95408 ?auto_95409 ?auto_95410 ?auto_95411 ?auto_95412 )
      ( MAKE-6PILE ?auto_95408 ?auto_95409 ?auto_95410 ?auto_95411 ?auto_95412 ?auto_95413 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95421 - BLOCK
      ?auto_95422 - BLOCK
      ?auto_95423 - BLOCK
      ?auto_95424 - BLOCK
      ?auto_95425 - BLOCK
      ?auto_95426 - BLOCK
    )
    :vars
    (
      ?auto_95427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95426 ?auto_95427 ) ( ON-TABLE ?auto_95421 ) ( ON ?auto_95422 ?auto_95421 ) ( ON ?auto_95423 ?auto_95422 ) ( not ( = ?auto_95421 ?auto_95422 ) ) ( not ( = ?auto_95421 ?auto_95423 ) ) ( not ( = ?auto_95421 ?auto_95424 ) ) ( not ( = ?auto_95421 ?auto_95425 ) ) ( not ( = ?auto_95421 ?auto_95426 ) ) ( not ( = ?auto_95421 ?auto_95427 ) ) ( not ( = ?auto_95422 ?auto_95423 ) ) ( not ( = ?auto_95422 ?auto_95424 ) ) ( not ( = ?auto_95422 ?auto_95425 ) ) ( not ( = ?auto_95422 ?auto_95426 ) ) ( not ( = ?auto_95422 ?auto_95427 ) ) ( not ( = ?auto_95423 ?auto_95424 ) ) ( not ( = ?auto_95423 ?auto_95425 ) ) ( not ( = ?auto_95423 ?auto_95426 ) ) ( not ( = ?auto_95423 ?auto_95427 ) ) ( not ( = ?auto_95424 ?auto_95425 ) ) ( not ( = ?auto_95424 ?auto_95426 ) ) ( not ( = ?auto_95424 ?auto_95427 ) ) ( not ( = ?auto_95425 ?auto_95426 ) ) ( not ( = ?auto_95425 ?auto_95427 ) ) ( not ( = ?auto_95426 ?auto_95427 ) ) ( ON ?auto_95425 ?auto_95426 ) ( CLEAR ?auto_95423 ) ( ON ?auto_95424 ?auto_95425 ) ( CLEAR ?auto_95424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95421 ?auto_95422 ?auto_95423 ?auto_95424 )
      ( MAKE-6PILE ?auto_95421 ?auto_95422 ?auto_95423 ?auto_95424 ?auto_95425 ?auto_95426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95434 - BLOCK
      ?auto_95435 - BLOCK
      ?auto_95436 - BLOCK
      ?auto_95437 - BLOCK
      ?auto_95438 - BLOCK
      ?auto_95439 - BLOCK
    )
    :vars
    (
      ?auto_95440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95439 ?auto_95440 ) ( ON-TABLE ?auto_95434 ) ( ON ?auto_95435 ?auto_95434 ) ( ON ?auto_95436 ?auto_95435 ) ( not ( = ?auto_95434 ?auto_95435 ) ) ( not ( = ?auto_95434 ?auto_95436 ) ) ( not ( = ?auto_95434 ?auto_95437 ) ) ( not ( = ?auto_95434 ?auto_95438 ) ) ( not ( = ?auto_95434 ?auto_95439 ) ) ( not ( = ?auto_95434 ?auto_95440 ) ) ( not ( = ?auto_95435 ?auto_95436 ) ) ( not ( = ?auto_95435 ?auto_95437 ) ) ( not ( = ?auto_95435 ?auto_95438 ) ) ( not ( = ?auto_95435 ?auto_95439 ) ) ( not ( = ?auto_95435 ?auto_95440 ) ) ( not ( = ?auto_95436 ?auto_95437 ) ) ( not ( = ?auto_95436 ?auto_95438 ) ) ( not ( = ?auto_95436 ?auto_95439 ) ) ( not ( = ?auto_95436 ?auto_95440 ) ) ( not ( = ?auto_95437 ?auto_95438 ) ) ( not ( = ?auto_95437 ?auto_95439 ) ) ( not ( = ?auto_95437 ?auto_95440 ) ) ( not ( = ?auto_95438 ?auto_95439 ) ) ( not ( = ?auto_95438 ?auto_95440 ) ) ( not ( = ?auto_95439 ?auto_95440 ) ) ( ON ?auto_95438 ?auto_95439 ) ( CLEAR ?auto_95436 ) ( ON ?auto_95437 ?auto_95438 ) ( CLEAR ?auto_95437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95434 ?auto_95435 ?auto_95436 ?auto_95437 )
      ( MAKE-6PILE ?auto_95434 ?auto_95435 ?auto_95436 ?auto_95437 ?auto_95438 ?auto_95439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95447 - BLOCK
      ?auto_95448 - BLOCK
      ?auto_95449 - BLOCK
      ?auto_95450 - BLOCK
      ?auto_95451 - BLOCK
      ?auto_95452 - BLOCK
    )
    :vars
    (
      ?auto_95453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95452 ?auto_95453 ) ( ON-TABLE ?auto_95447 ) ( ON ?auto_95448 ?auto_95447 ) ( not ( = ?auto_95447 ?auto_95448 ) ) ( not ( = ?auto_95447 ?auto_95449 ) ) ( not ( = ?auto_95447 ?auto_95450 ) ) ( not ( = ?auto_95447 ?auto_95451 ) ) ( not ( = ?auto_95447 ?auto_95452 ) ) ( not ( = ?auto_95447 ?auto_95453 ) ) ( not ( = ?auto_95448 ?auto_95449 ) ) ( not ( = ?auto_95448 ?auto_95450 ) ) ( not ( = ?auto_95448 ?auto_95451 ) ) ( not ( = ?auto_95448 ?auto_95452 ) ) ( not ( = ?auto_95448 ?auto_95453 ) ) ( not ( = ?auto_95449 ?auto_95450 ) ) ( not ( = ?auto_95449 ?auto_95451 ) ) ( not ( = ?auto_95449 ?auto_95452 ) ) ( not ( = ?auto_95449 ?auto_95453 ) ) ( not ( = ?auto_95450 ?auto_95451 ) ) ( not ( = ?auto_95450 ?auto_95452 ) ) ( not ( = ?auto_95450 ?auto_95453 ) ) ( not ( = ?auto_95451 ?auto_95452 ) ) ( not ( = ?auto_95451 ?auto_95453 ) ) ( not ( = ?auto_95452 ?auto_95453 ) ) ( ON ?auto_95451 ?auto_95452 ) ( ON ?auto_95450 ?auto_95451 ) ( CLEAR ?auto_95448 ) ( ON ?auto_95449 ?auto_95450 ) ( CLEAR ?auto_95449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95447 ?auto_95448 ?auto_95449 )
      ( MAKE-6PILE ?auto_95447 ?auto_95448 ?auto_95449 ?auto_95450 ?auto_95451 ?auto_95452 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95460 - BLOCK
      ?auto_95461 - BLOCK
      ?auto_95462 - BLOCK
      ?auto_95463 - BLOCK
      ?auto_95464 - BLOCK
      ?auto_95465 - BLOCK
    )
    :vars
    (
      ?auto_95466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95465 ?auto_95466 ) ( ON-TABLE ?auto_95460 ) ( ON ?auto_95461 ?auto_95460 ) ( not ( = ?auto_95460 ?auto_95461 ) ) ( not ( = ?auto_95460 ?auto_95462 ) ) ( not ( = ?auto_95460 ?auto_95463 ) ) ( not ( = ?auto_95460 ?auto_95464 ) ) ( not ( = ?auto_95460 ?auto_95465 ) ) ( not ( = ?auto_95460 ?auto_95466 ) ) ( not ( = ?auto_95461 ?auto_95462 ) ) ( not ( = ?auto_95461 ?auto_95463 ) ) ( not ( = ?auto_95461 ?auto_95464 ) ) ( not ( = ?auto_95461 ?auto_95465 ) ) ( not ( = ?auto_95461 ?auto_95466 ) ) ( not ( = ?auto_95462 ?auto_95463 ) ) ( not ( = ?auto_95462 ?auto_95464 ) ) ( not ( = ?auto_95462 ?auto_95465 ) ) ( not ( = ?auto_95462 ?auto_95466 ) ) ( not ( = ?auto_95463 ?auto_95464 ) ) ( not ( = ?auto_95463 ?auto_95465 ) ) ( not ( = ?auto_95463 ?auto_95466 ) ) ( not ( = ?auto_95464 ?auto_95465 ) ) ( not ( = ?auto_95464 ?auto_95466 ) ) ( not ( = ?auto_95465 ?auto_95466 ) ) ( ON ?auto_95464 ?auto_95465 ) ( ON ?auto_95463 ?auto_95464 ) ( CLEAR ?auto_95461 ) ( ON ?auto_95462 ?auto_95463 ) ( CLEAR ?auto_95462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95460 ?auto_95461 ?auto_95462 )
      ( MAKE-6PILE ?auto_95460 ?auto_95461 ?auto_95462 ?auto_95463 ?auto_95464 ?auto_95465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95473 - BLOCK
      ?auto_95474 - BLOCK
      ?auto_95475 - BLOCK
      ?auto_95476 - BLOCK
      ?auto_95477 - BLOCK
      ?auto_95478 - BLOCK
    )
    :vars
    (
      ?auto_95479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95478 ?auto_95479 ) ( ON-TABLE ?auto_95473 ) ( not ( = ?auto_95473 ?auto_95474 ) ) ( not ( = ?auto_95473 ?auto_95475 ) ) ( not ( = ?auto_95473 ?auto_95476 ) ) ( not ( = ?auto_95473 ?auto_95477 ) ) ( not ( = ?auto_95473 ?auto_95478 ) ) ( not ( = ?auto_95473 ?auto_95479 ) ) ( not ( = ?auto_95474 ?auto_95475 ) ) ( not ( = ?auto_95474 ?auto_95476 ) ) ( not ( = ?auto_95474 ?auto_95477 ) ) ( not ( = ?auto_95474 ?auto_95478 ) ) ( not ( = ?auto_95474 ?auto_95479 ) ) ( not ( = ?auto_95475 ?auto_95476 ) ) ( not ( = ?auto_95475 ?auto_95477 ) ) ( not ( = ?auto_95475 ?auto_95478 ) ) ( not ( = ?auto_95475 ?auto_95479 ) ) ( not ( = ?auto_95476 ?auto_95477 ) ) ( not ( = ?auto_95476 ?auto_95478 ) ) ( not ( = ?auto_95476 ?auto_95479 ) ) ( not ( = ?auto_95477 ?auto_95478 ) ) ( not ( = ?auto_95477 ?auto_95479 ) ) ( not ( = ?auto_95478 ?auto_95479 ) ) ( ON ?auto_95477 ?auto_95478 ) ( ON ?auto_95476 ?auto_95477 ) ( ON ?auto_95475 ?auto_95476 ) ( CLEAR ?auto_95473 ) ( ON ?auto_95474 ?auto_95475 ) ( CLEAR ?auto_95474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95473 ?auto_95474 )
      ( MAKE-6PILE ?auto_95473 ?auto_95474 ?auto_95475 ?auto_95476 ?auto_95477 ?auto_95478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95486 - BLOCK
      ?auto_95487 - BLOCK
      ?auto_95488 - BLOCK
      ?auto_95489 - BLOCK
      ?auto_95490 - BLOCK
      ?auto_95491 - BLOCK
    )
    :vars
    (
      ?auto_95492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95491 ?auto_95492 ) ( ON-TABLE ?auto_95486 ) ( not ( = ?auto_95486 ?auto_95487 ) ) ( not ( = ?auto_95486 ?auto_95488 ) ) ( not ( = ?auto_95486 ?auto_95489 ) ) ( not ( = ?auto_95486 ?auto_95490 ) ) ( not ( = ?auto_95486 ?auto_95491 ) ) ( not ( = ?auto_95486 ?auto_95492 ) ) ( not ( = ?auto_95487 ?auto_95488 ) ) ( not ( = ?auto_95487 ?auto_95489 ) ) ( not ( = ?auto_95487 ?auto_95490 ) ) ( not ( = ?auto_95487 ?auto_95491 ) ) ( not ( = ?auto_95487 ?auto_95492 ) ) ( not ( = ?auto_95488 ?auto_95489 ) ) ( not ( = ?auto_95488 ?auto_95490 ) ) ( not ( = ?auto_95488 ?auto_95491 ) ) ( not ( = ?auto_95488 ?auto_95492 ) ) ( not ( = ?auto_95489 ?auto_95490 ) ) ( not ( = ?auto_95489 ?auto_95491 ) ) ( not ( = ?auto_95489 ?auto_95492 ) ) ( not ( = ?auto_95490 ?auto_95491 ) ) ( not ( = ?auto_95490 ?auto_95492 ) ) ( not ( = ?auto_95491 ?auto_95492 ) ) ( ON ?auto_95490 ?auto_95491 ) ( ON ?auto_95489 ?auto_95490 ) ( ON ?auto_95488 ?auto_95489 ) ( CLEAR ?auto_95486 ) ( ON ?auto_95487 ?auto_95488 ) ( CLEAR ?auto_95487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95486 ?auto_95487 )
      ( MAKE-6PILE ?auto_95486 ?auto_95487 ?auto_95488 ?auto_95489 ?auto_95490 ?auto_95491 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95499 - BLOCK
      ?auto_95500 - BLOCK
      ?auto_95501 - BLOCK
      ?auto_95502 - BLOCK
      ?auto_95503 - BLOCK
      ?auto_95504 - BLOCK
    )
    :vars
    (
      ?auto_95505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95504 ?auto_95505 ) ( not ( = ?auto_95499 ?auto_95500 ) ) ( not ( = ?auto_95499 ?auto_95501 ) ) ( not ( = ?auto_95499 ?auto_95502 ) ) ( not ( = ?auto_95499 ?auto_95503 ) ) ( not ( = ?auto_95499 ?auto_95504 ) ) ( not ( = ?auto_95499 ?auto_95505 ) ) ( not ( = ?auto_95500 ?auto_95501 ) ) ( not ( = ?auto_95500 ?auto_95502 ) ) ( not ( = ?auto_95500 ?auto_95503 ) ) ( not ( = ?auto_95500 ?auto_95504 ) ) ( not ( = ?auto_95500 ?auto_95505 ) ) ( not ( = ?auto_95501 ?auto_95502 ) ) ( not ( = ?auto_95501 ?auto_95503 ) ) ( not ( = ?auto_95501 ?auto_95504 ) ) ( not ( = ?auto_95501 ?auto_95505 ) ) ( not ( = ?auto_95502 ?auto_95503 ) ) ( not ( = ?auto_95502 ?auto_95504 ) ) ( not ( = ?auto_95502 ?auto_95505 ) ) ( not ( = ?auto_95503 ?auto_95504 ) ) ( not ( = ?auto_95503 ?auto_95505 ) ) ( not ( = ?auto_95504 ?auto_95505 ) ) ( ON ?auto_95503 ?auto_95504 ) ( ON ?auto_95502 ?auto_95503 ) ( ON ?auto_95501 ?auto_95502 ) ( ON ?auto_95500 ?auto_95501 ) ( ON ?auto_95499 ?auto_95500 ) ( CLEAR ?auto_95499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95499 )
      ( MAKE-6PILE ?auto_95499 ?auto_95500 ?auto_95501 ?auto_95502 ?auto_95503 ?auto_95504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95512 - BLOCK
      ?auto_95513 - BLOCK
      ?auto_95514 - BLOCK
      ?auto_95515 - BLOCK
      ?auto_95516 - BLOCK
      ?auto_95517 - BLOCK
    )
    :vars
    (
      ?auto_95518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95517 ?auto_95518 ) ( not ( = ?auto_95512 ?auto_95513 ) ) ( not ( = ?auto_95512 ?auto_95514 ) ) ( not ( = ?auto_95512 ?auto_95515 ) ) ( not ( = ?auto_95512 ?auto_95516 ) ) ( not ( = ?auto_95512 ?auto_95517 ) ) ( not ( = ?auto_95512 ?auto_95518 ) ) ( not ( = ?auto_95513 ?auto_95514 ) ) ( not ( = ?auto_95513 ?auto_95515 ) ) ( not ( = ?auto_95513 ?auto_95516 ) ) ( not ( = ?auto_95513 ?auto_95517 ) ) ( not ( = ?auto_95513 ?auto_95518 ) ) ( not ( = ?auto_95514 ?auto_95515 ) ) ( not ( = ?auto_95514 ?auto_95516 ) ) ( not ( = ?auto_95514 ?auto_95517 ) ) ( not ( = ?auto_95514 ?auto_95518 ) ) ( not ( = ?auto_95515 ?auto_95516 ) ) ( not ( = ?auto_95515 ?auto_95517 ) ) ( not ( = ?auto_95515 ?auto_95518 ) ) ( not ( = ?auto_95516 ?auto_95517 ) ) ( not ( = ?auto_95516 ?auto_95518 ) ) ( not ( = ?auto_95517 ?auto_95518 ) ) ( ON ?auto_95516 ?auto_95517 ) ( ON ?auto_95515 ?auto_95516 ) ( ON ?auto_95514 ?auto_95515 ) ( ON ?auto_95513 ?auto_95514 ) ( ON ?auto_95512 ?auto_95513 ) ( CLEAR ?auto_95512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95512 )
      ( MAKE-6PILE ?auto_95512 ?auto_95513 ?auto_95514 ?auto_95515 ?auto_95516 ?auto_95517 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95526 - BLOCK
      ?auto_95527 - BLOCK
      ?auto_95528 - BLOCK
      ?auto_95529 - BLOCK
      ?auto_95530 - BLOCK
      ?auto_95531 - BLOCK
      ?auto_95532 - BLOCK
    )
    :vars
    (
      ?auto_95533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95531 ) ( ON ?auto_95532 ?auto_95533 ) ( CLEAR ?auto_95532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95526 ) ( ON ?auto_95527 ?auto_95526 ) ( ON ?auto_95528 ?auto_95527 ) ( ON ?auto_95529 ?auto_95528 ) ( ON ?auto_95530 ?auto_95529 ) ( ON ?auto_95531 ?auto_95530 ) ( not ( = ?auto_95526 ?auto_95527 ) ) ( not ( = ?auto_95526 ?auto_95528 ) ) ( not ( = ?auto_95526 ?auto_95529 ) ) ( not ( = ?auto_95526 ?auto_95530 ) ) ( not ( = ?auto_95526 ?auto_95531 ) ) ( not ( = ?auto_95526 ?auto_95532 ) ) ( not ( = ?auto_95526 ?auto_95533 ) ) ( not ( = ?auto_95527 ?auto_95528 ) ) ( not ( = ?auto_95527 ?auto_95529 ) ) ( not ( = ?auto_95527 ?auto_95530 ) ) ( not ( = ?auto_95527 ?auto_95531 ) ) ( not ( = ?auto_95527 ?auto_95532 ) ) ( not ( = ?auto_95527 ?auto_95533 ) ) ( not ( = ?auto_95528 ?auto_95529 ) ) ( not ( = ?auto_95528 ?auto_95530 ) ) ( not ( = ?auto_95528 ?auto_95531 ) ) ( not ( = ?auto_95528 ?auto_95532 ) ) ( not ( = ?auto_95528 ?auto_95533 ) ) ( not ( = ?auto_95529 ?auto_95530 ) ) ( not ( = ?auto_95529 ?auto_95531 ) ) ( not ( = ?auto_95529 ?auto_95532 ) ) ( not ( = ?auto_95529 ?auto_95533 ) ) ( not ( = ?auto_95530 ?auto_95531 ) ) ( not ( = ?auto_95530 ?auto_95532 ) ) ( not ( = ?auto_95530 ?auto_95533 ) ) ( not ( = ?auto_95531 ?auto_95532 ) ) ( not ( = ?auto_95531 ?auto_95533 ) ) ( not ( = ?auto_95532 ?auto_95533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95532 ?auto_95533 )
      ( !STACK ?auto_95532 ?auto_95531 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95541 - BLOCK
      ?auto_95542 - BLOCK
      ?auto_95543 - BLOCK
      ?auto_95544 - BLOCK
      ?auto_95545 - BLOCK
      ?auto_95546 - BLOCK
      ?auto_95547 - BLOCK
    )
    :vars
    (
      ?auto_95548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95546 ) ( ON ?auto_95547 ?auto_95548 ) ( CLEAR ?auto_95547 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95541 ) ( ON ?auto_95542 ?auto_95541 ) ( ON ?auto_95543 ?auto_95542 ) ( ON ?auto_95544 ?auto_95543 ) ( ON ?auto_95545 ?auto_95544 ) ( ON ?auto_95546 ?auto_95545 ) ( not ( = ?auto_95541 ?auto_95542 ) ) ( not ( = ?auto_95541 ?auto_95543 ) ) ( not ( = ?auto_95541 ?auto_95544 ) ) ( not ( = ?auto_95541 ?auto_95545 ) ) ( not ( = ?auto_95541 ?auto_95546 ) ) ( not ( = ?auto_95541 ?auto_95547 ) ) ( not ( = ?auto_95541 ?auto_95548 ) ) ( not ( = ?auto_95542 ?auto_95543 ) ) ( not ( = ?auto_95542 ?auto_95544 ) ) ( not ( = ?auto_95542 ?auto_95545 ) ) ( not ( = ?auto_95542 ?auto_95546 ) ) ( not ( = ?auto_95542 ?auto_95547 ) ) ( not ( = ?auto_95542 ?auto_95548 ) ) ( not ( = ?auto_95543 ?auto_95544 ) ) ( not ( = ?auto_95543 ?auto_95545 ) ) ( not ( = ?auto_95543 ?auto_95546 ) ) ( not ( = ?auto_95543 ?auto_95547 ) ) ( not ( = ?auto_95543 ?auto_95548 ) ) ( not ( = ?auto_95544 ?auto_95545 ) ) ( not ( = ?auto_95544 ?auto_95546 ) ) ( not ( = ?auto_95544 ?auto_95547 ) ) ( not ( = ?auto_95544 ?auto_95548 ) ) ( not ( = ?auto_95545 ?auto_95546 ) ) ( not ( = ?auto_95545 ?auto_95547 ) ) ( not ( = ?auto_95545 ?auto_95548 ) ) ( not ( = ?auto_95546 ?auto_95547 ) ) ( not ( = ?auto_95546 ?auto_95548 ) ) ( not ( = ?auto_95547 ?auto_95548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95547 ?auto_95548 )
      ( !STACK ?auto_95547 ?auto_95546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95556 - BLOCK
      ?auto_95557 - BLOCK
      ?auto_95558 - BLOCK
      ?auto_95559 - BLOCK
      ?auto_95560 - BLOCK
      ?auto_95561 - BLOCK
      ?auto_95562 - BLOCK
    )
    :vars
    (
      ?auto_95563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95562 ?auto_95563 ) ( ON-TABLE ?auto_95556 ) ( ON ?auto_95557 ?auto_95556 ) ( ON ?auto_95558 ?auto_95557 ) ( ON ?auto_95559 ?auto_95558 ) ( ON ?auto_95560 ?auto_95559 ) ( not ( = ?auto_95556 ?auto_95557 ) ) ( not ( = ?auto_95556 ?auto_95558 ) ) ( not ( = ?auto_95556 ?auto_95559 ) ) ( not ( = ?auto_95556 ?auto_95560 ) ) ( not ( = ?auto_95556 ?auto_95561 ) ) ( not ( = ?auto_95556 ?auto_95562 ) ) ( not ( = ?auto_95556 ?auto_95563 ) ) ( not ( = ?auto_95557 ?auto_95558 ) ) ( not ( = ?auto_95557 ?auto_95559 ) ) ( not ( = ?auto_95557 ?auto_95560 ) ) ( not ( = ?auto_95557 ?auto_95561 ) ) ( not ( = ?auto_95557 ?auto_95562 ) ) ( not ( = ?auto_95557 ?auto_95563 ) ) ( not ( = ?auto_95558 ?auto_95559 ) ) ( not ( = ?auto_95558 ?auto_95560 ) ) ( not ( = ?auto_95558 ?auto_95561 ) ) ( not ( = ?auto_95558 ?auto_95562 ) ) ( not ( = ?auto_95558 ?auto_95563 ) ) ( not ( = ?auto_95559 ?auto_95560 ) ) ( not ( = ?auto_95559 ?auto_95561 ) ) ( not ( = ?auto_95559 ?auto_95562 ) ) ( not ( = ?auto_95559 ?auto_95563 ) ) ( not ( = ?auto_95560 ?auto_95561 ) ) ( not ( = ?auto_95560 ?auto_95562 ) ) ( not ( = ?auto_95560 ?auto_95563 ) ) ( not ( = ?auto_95561 ?auto_95562 ) ) ( not ( = ?auto_95561 ?auto_95563 ) ) ( not ( = ?auto_95562 ?auto_95563 ) ) ( CLEAR ?auto_95560 ) ( ON ?auto_95561 ?auto_95562 ) ( CLEAR ?auto_95561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95556 ?auto_95557 ?auto_95558 ?auto_95559 ?auto_95560 ?auto_95561 )
      ( MAKE-7PILE ?auto_95556 ?auto_95557 ?auto_95558 ?auto_95559 ?auto_95560 ?auto_95561 ?auto_95562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95571 - BLOCK
      ?auto_95572 - BLOCK
      ?auto_95573 - BLOCK
      ?auto_95574 - BLOCK
      ?auto_95575 - BLOCK
      ?auto_95576 - BLOCK
      ?auto_95577 - BLOCK
    )
    :vars
    (
      ?auto_95578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95577 ?auto_95578 ) ( ON-TABLE ?auto_95571 ) ( ON ?auto_95572 ?auto_95571 ) ( ON ?auto_95573 ?auto_95572 ) ( ON ?auto_95574 ?auto_95573 ) ( ON ?auto_95575 ?auto_95574 ) ( not ( = ?auto_95571 ?auto_95572 ) ) ( not ( = ?auto_95571 ?auto_95573 ) ) ( not ( = ?auto_95571 ?auto_95574 ) ) ( not ( = ?auto_95571 ?auto_95575 ) ) ( not ( = ?auto_95571 ?auto_95576 ) ) ( not ( = ?auto_95571 ?auto_95577 ) ) ( not ( = ?auto_95571 ?auto_95578 ) ) ( not ( = ?auto_95572 ?auto_95573 ) ) ( not ( = ?auto_95572 ?auto_95574 ) ) ( not ( = ?auto_95572 ?auto_95575 ) ) ( not ( = ?auto_95572 ?auto_95576 ) ) ( not ( = ?auto_95572 ?auto_95577 ) ) ( not ( = ?auto_95572 ?auto_95578 ) ) ( not ( = ?auto_95573 ?auto_95574 ) ) ( not ( = ?auto_95573 ?auto_95575 ) ) ( not ( = ?auto_95573 ?auto_95576 ) ) ( not ( = ?auto_95573 ?auto_95577 ) ) ( not ( = ?auto_95573 ?auto_95578 ) ) ( not ( = ?auto_95574 ?auto_95575 ) ) ( not ( = ?auto_95574 ?auto_95576 ) ) ( not ( = ?auto_95574 ?auto_95577 ) ) ( not ( = ?auto_95574 ?auto_95578 ) ) ( not ( = ?auto_95575 ?auto_95576 ) ) ( not ( = ?auto_95575 ?auto_95577 ) ) ( not ( = ?auto_95575 ?auto_95578 ) ) ( not ( = ?auto_95576 ?auto_95577 ) ) ( not ( = ?auto_95576 ?auto_95578 ) ) ( not ( = ?auto_95577 ?auto_95578 ) ) ( CLEAR ?auto_95575 ) ( ON ?auto_95576 ?auto_95577 ) ( CLEAR ?auto_95576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95571 ?auto_95572 ?auto_95573 ?auto_95574 ?auto_95575 ?auto_95576 )
      ( MAKE-7PILE ?auto_95571 ?auto_95572 ?auto_95573 ?auto_95574 ?auto_95575 ?auto_95576 ?auto_95577 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95586 - BLOCK
      ?auto_95587 - BLOCK
      ?auto_95588 - BLOCK
      ?auto_95589 - BLOCK
      ?auto_95590 - BLOCK
      ?auto_95591 - BLOCK
      ?auto_95592 - BLOCK
    )
    :vars
    (
      ?auto_95593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95592 ?auto_95593 ) ( ON-TABLE ?auto_95586 ) ( ON ?auto_95587 ?auto_95586 ) ( ON ?auto_95588 ?auto_95587 ) ( ON ?auto_95589 ?auto_95588 ) ( not ( = ?auto_95586 ?auto_95587 ) ) ( not ( = ?auto_95586 ?auto_95588 ) ) ( not ( = ?auto_95586 ?auto_95589 ) ) ( not ( = ?auto_95586 ?auto_95590 ) ) ( not ( = ?auto_95586 ?auto_95591 ) ) ( not ( = ?auto_95586 ?auto_95592 ) ) ( not ( = ?auto_95586 ?auto_95593 ) ) ( not ( = ?auto_95587 ?auto_95588 ) ) ( not ( = ?auto_95587 ?auto_95589 ) ) ( not ( = ?auto_95587 ?auto_95590 ) ) ( not ( = ?auto_95587 ?auto_95591 ) ) ( not ( = ?auto_95587 ?auto_95592 ) ) ( not ( = ?auto_95587 ?auto_95593 ) ) ( not ( = ?auto_95588 ?auto_95589 ) ) ( not ( = ?auto_95588 ?auto_95590 ) ) ( not ( = ?auto_95588 ?auto_95591 ) ) ( not ( = ?auto_95588 ?auto_95592 ) ) ( not ( = ?auto_95588 ?auto_95593 ) ) ( not ( = ?auto_95589 ?auto_95590 ) ) ( not ( = ?auto_95589 ?auto_95591 ) ) ( not ( = ?auto_95589 ?auto_95592 ) ) ( not ( = ?auto_95589 ?auto_95593 ) ) ( not ( = ?auto_95590 ?auto_95591 ) ) ( not ( = ?auto_95590 ?auto_95592 ) ) ( not ( = ?auto_95590 ?auto_95593 ) ) ( not ( = ?auto_95591 ?auto_95592 ) ) ( not ( = ?auto_95591 ?auto_95593 ) ) ( not ( = ?auto_95592 ?auto_95593 ) ) ( ON ?auto_95591 ?auto_95592 ) ( CLEAR ?auto_95589 ) ( ON ?auto_95590 ?auto_95591 ) ( CLEAR ?auto_95590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95586 ?auto_95587 ?auto_95588 ?auto_95589 ?auto_95590 )
      ( MAKE-7PILE ?auto_95586 ?auto_95587 ?auto_95588 ?auto_95589 ?auto_95590 ?auto_95591 ?auto_95592 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95601 - BLOCK
      ?auto_95602 - BLOCK
      ?auto_95603 - BLOCK
      ?auto_95604 - BLOCK
      ?auto_95605 - BLOCK
      ?auto_95606 - BLOCK
      ?auto_95607 - BLOCK
    )
    :vars
    (
      ?auto_95608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95607 ?auto_95608 ) ( ON-TABLE ?auto_95601 ) ( ON ?auto_95602 ?auto_95601 ) ( ON ?auto_95603 ?auto_95602 ) ( ON ?auto_95604 ?auto_95603 ) ( not ( = ?auto_95601 ?auto_95602 ) ) ( not ( = ?auto_95601 ?auto_95603 ) ) ( not ( = ?auto_95601 ?auto_95604 ) ) ( not ( = ?auto_95601 ?auto_95605 ) ) ( not ( = ?auto_95601 ?auto_95606 ) ) ( not ( = ?auto_95601 ?auto_95607 ) ) ( not ( = ?auto_95601 ?auto_95608 ) ) ( not ( = ?auto_95602 ?auto_95603 ) ) ( not ( = ?auto_95602 ?auto_95604 ) ) ( not ( = ?auto_95602 ?auto_95605 ) ) ( not ( = ?auto_95602 ?auto_95606 ) ) ( not ( = ?auto_95602 ?auto_95607 ) ) ( not ( = ?auto_95602 ?auto_95608 ) ) ( not ( = ?auto_95603 ?auto_95604 ) ) ( not ( = ?auto_95603 ?auto_95605 ) ) ( not ( = ?auto_95603 ?auto_95606 ) ) ( not ( = ?auto_95603 ?auto_95607 ) ) ( not ( = ?auto_95603 ?auto_95608 ) ) ( not ( = ?auto_95604 ?auto_95605 ) ) ( not ( = ?auto_95604 ?auto_95606 ) ) ( not ( = ?auto_95604 ?auto_95607 ) ) ( not ( = ?auto_95604 ?auto_95608 ) ) ( not ( = ?auto_95605 ?auto_95606 ) ) ( not ( = ?auto_95605 ?auto_95607 ) ) ( not ( = ?auto_95605 ?auto_95608 ) ) ( not ( = ?auto_95606 ?auto_95607 ) ) ( not ( = ?auto_95606 ?auto_95608 ) ) ( not ( = ?auto_95607 ?auto_95608 ) ) ( ON ?auto_95606 ?auto_95607 ) ( CLEAR ?auto_95604 ) ( ON ?auto_95605 ?auto_95606 ) ( CLEAR ?auto_95605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95601 ?auto_95602 ?auto_95603 ?auto_95604 ?auto_95605 )
      ( MAKE-7PILE ?auto_95601 ?auto_95602 ?auto_95603 ?auto_95604 ?auto_95605 ?auto_95606 ?auto_95607 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95616 - BLOCK
      ?auto_95617 - BLOCK
      ?auto_95618 - BLOCK
      ?auto_95619 - BLOCK
      ?auto_95620 - BLOCK
      ?auto_95621 - BLOCK
      ?auto_95622 - BLOCK
    )
    :vars
    (
      ?auto_95623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95622 ?auto_95623 ) ( ON-TABLE ?auto_95616 ) ( ON ?auto_95617 ?auto_95616 ) ( ON ?auto_95618 ?auto_95617 ) ( not ( = ?auto_95616 ?auto_95617 ) ) ( not ( = ?auto_95616 ?auto_95618 ) ) ( not ( = ?auto_95616 ?auto_95619 ) ) ( not ( = ?auto_95616 ?auto_95620 ) ) ( not ( = ?auto_95616 ?auto_95621 ) ) ( not ( = ?auto_95616 ?auto_95622 ) ) ( not ( = ?auto_95616 ?auto_95623 ) ) ( not ( = ?auto_95617 ?auto_95618 ) ) ( not ( = ?auto_95617 ?auto_95619 ) ) ( not ( = ?auto_95617 ?auto_95620 ) ) ( not ( = ?auto_95617 ?auto_95621 ) ) ( not ( = ?auto_95617 ?auto_95622 ) ) ( not ( = ?auto_95617 ?auto_95623 ) ) ( not ( = ?auto_95618 ?auto_95619 ) ) ( not ( = ?auto_95618 ?auto_95620 ) ) ( not ( = ?auto_95618 ?auto_95621 ) ) ( not ( = ?auto_95618 ?auto_95622 ) ) ( not ( = ?auto_95618 ?auto_95623 ) ) ( not ( = ?auto_95619 ?auto_95620 ) ) ( not ( = ?auto_95619 ?auto_95621 ) ) ( not ( = ?auto_95619 ?auto_95622 ) ) ( not ( = ?auto_95619 ?auto_95623 ) ) ( not ( = ?auto_95620 ?auto_95621 ) ) ( not ( = ?auto_95620 ?auto_95622 ) ) ( not ( = ?auto_95620 ?auto_95623 ) ) ( not ( = ?auto_95621 ?auto_95622 ) ) ( not ( = ?auto_95621 ?auto_95623 ) ) ( not ( = ?auto_95622 ?auto_95623 ) ) ( ON ?auto_95621 ?auto_95622 ) ( ON ?auto_95620 ?auto_95621 ) ( CLEAR ?auto_95618 ) ( ON ?auto_95619 ?auto_95620 ) ( CLEAR ?auto_95619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95616 ?auto_95617 ?auto_95618 ?auto_95619 )
      ( MAKE-7PILE ?auto_95616 ?auto_95617 ?auto_95618 ?auto_95619 ?auto_95620 ?auto_95621 ?auto_95622 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95631 - BLOCK
      ?auto_95632 - BLOCK
      ?auto_95633 - BLOCK
      ?auto_95634 - BLOCK
      ?auto_95635 - BLOCK
      ?auto_95636 - BLOCK
      ?auto_95637 - BLOCK
    )
    :vars
    (
      ?auto_95638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95637 ?auto_95638 ) ( ON-TABLE ?auto_95631 ) ( ON ?auto_95632 ?auto_95631 ) ( ON ?auto_95633 ?auto_95632 ) ( not ( = ?auto_95631 ?auto_95632 ) ) ( not ( = ?auto_95631 ?auto_95633 ) ) ( not ( = ?auto_95631 ?auto_95634 ) ) ( not ( = ?auto_95631 ?auto_95635 ) ) ( not ( = ?auto_95631 ?auto_95636 ) ) ( not ( = ?auto_95631 ?auto_95637 ) ) ( not ( = ?auto_95631 ?auto_95638 ) ) ( not ( = ?auto_95632 ?auto_95633 ) ) ( not ( = ?auto_95632 ?auto_95634 ) ) ( not ( = ?auto_95632 ?auto_95635 ) ) ( not ( = ?auto_95632 ?auto_95636 ) ) ( not ( = ?auto_95632 ?auto_95637 ) ) ( not ( = ?auto_95632 ?auto_95638 ) ) ( not ( = ?auto_95633 ?auto_95634 ) ) ( not ( = ?auto_95633 ?auto_95635 ) ) ( not ( = ?auto_95633 ?auto_95636 ) ) ( not ( = ?auto_95633 ?auto_95637 ) ) ( not ( = ?auto_95633 ?auto_95638 ) ) ( not ( = ?auto_95634 ?auto_95635 ) ) ( not ( = ?auto_95634 ?auto_95636 ) ) ( not ( = ?auto_95634 ?auto_95637 ) ) ( not ( = ?auto_95634 ?auto_95638 ) ) ( not ( = ?auto_95635 ?auto_95636 ) ) ( not ( = ?auto_95635 ?auto_95637 ) ) ( not ( = ?auto_95635 ?auto_95638 ) ) ( not ( = ?auto_95636 ?auto_95637 ) ) ( not ( = ?auto_95636 ?auto_95638 ) ) ( not ( = ?auto_95637 ?auto_95638 ) ) ( ON ?auto_95636 ?auto_95637 ) ( ON ?auto_95635 ?auto_95636 ) ( CLEAR ?auto_95633 ) ( ON ?auto_95634 ?auto_95635 ) ( CLEAR ?auto_95634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95631 ?auto_95632 ?auto_95633 ?auto_95634 )
      ( MAKE-7PILE ?auto_95631 ?auto_95632 ?auto_95633 ?auto_95634 ?auto_95635 ?auto_95636 ?auto_95637 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95646 - BLOCK
      ?auto_95647 - BLOCK
      ?auto_95648 - BLOCK
      ?auto_95649 - BLOCK
      ?auto_95650 - BLOCK
      ?auto_95651 - BLOCK
      ?auto_95652 - BLOCK
    )
    :vars
    (
      ?auto_95653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95652 ?auto_95653 ) ( ON-TABLE ?auto_95646 ) ( ON ?auto_95647 ?auto_95646 ) ( not ( = ?auto_95646 ?auto_95647 ) ) ( not ( = ?auto_95646 ?auto_95648 ) ) ( not ( = ?auto_95646 ?auto_95649 ) ) ( not ( = ?auto_95646 ?auto_95650 ) ) ( not ( = ?auto_95646 ?auto_95651 ) ) ( not ( = ?auto_95646 ?auto_95652 ) ) ( not ( = ?auto_95646 ?auto_95653 ) ) ( not ( = ?auto_95647 ?auto_95648 ) ) ( not ( = ?auto_95647 ?auto_95649 ) ) ( not ( = ?auto_95647 ?auto_95650 ) ) ( not ( = ?auto_95647 ?auto_95651 ) ) ( not ( = ?auto_95647 ?auto_95652 ) ) ( not ( = ?auto_95647 ?auto_95653 ) ) ( not ( = ?auto_95648 ?auto_95649 ) ) ( not ( = ?auto_95648 ?auto_95650 ) ) ( not ( = ?auto_95648 ?auto_95651 ) ) ( not ( = ?auto_95648 ?auto_95652 ) ) ( not ( = ?auto_95648 ?auto_95653 ) ) ( not ( = ?auto_95649 ?auto_95650 ) ) ( not ( = ?auto_95649 ?auto_95651 ) ) ( not ( = ?auto_95649 ?auto_95652 ) ) ( not ( = ?auto_95649 ?auto_95653 ) ) ( not ( = ?auto_95650 ?auto_95651 ) ) ( not ( = ?auto_95650 ?auto_95652 ) ) ( not ( = ?auto_95650 ?auto_95653 ) ) ( not ( = ?auto_95651 ?auto_95652 ) ) ( not ( = ?auto_95651 ?auto_95653 ) ) ( not ( = ?auto_95652 ?auto_95653 ) ) ( ON ?auto_95651 ?auto_95652 ) ( ON ?auto_95650 ?auto_95651 ) ( ON ?auto_95649 ?auto_95650 ) ( CLEAR ?auto_95647 ) ( ON ?auto_95648 ?auto_95649 ) ( CLEAR ?auto_95648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95646 ?auto_95647 ?auto_95648 )
      ( MAKE-7PILE ?auto_95646 ?auto_95647 ?auto_95648 ?auto_95649 ?auto_95650 ?auto_95651 ?auto_95652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95661 - BLOCK
      ?auto_95662 - BLOCK
      ?auto_95663 - BLOCK
      ?auto_95664 - BLOCK
      ?auto_95665 - BLOCK
      ?auto_95666 - BLOCK
      ?auto_95667 - BLOCK
    )
    :vars
    (
      ?auto_95668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95667 ?auto_95668 ) ( ON-TABLE ?auto_95661 ) ( ON ?auto_95662 ?auto_95661 ) ( not ( = ?auto_95661 ?auto_95662 ) ) ( not ( = ?auto_95661 ?auto_95663 ) ) ( not ( = ?auto_95661 ?auto_95664 ) ) ( not ( = ?auto_95661 ?auto_95665 ) ) ( not ( = ?auto_95661 ?auto_95666 ) ) ( not ( = ?auto_95661 ?auto_95667 ) ) ( not ( = ?auto_95661 ?auto_95668 ) ) ( not ( = ?auto_95662 ?auto_95663 ) ) ( not ( = ?auto_95662 ?auto_95664 ) ) ( not ( = ?auto_95662 ?auto_95665 ) ) ( not ( = ?auto_95662 ?auto_95666 ) ) ( not ( = ?auto_95662 ?auto_95667 ) ) ( not ( = ?auto_95662 ?auto_95668 ) ) ( not ( = ?auto_95663 ?auto_95664 ) ) ( not ( = ?auto_95663 ?auto_95665 ) ) ( not ( = ?auto_95663 ?auto_95666 ) ) ( not ( = ?auto_95663 ?auto_95667 ) ) ( not ( = ?auto_95663 ?auto_95668 ) ) ( not ( = ?auto_95664 ?auto_95665 ) ) ( not ( = ?auto_95664 ?auto_95666 ) ) ( not ( = ?auto_95664 ?auto_95667 ) ) ( not ( = ?auto_95664 ?auto_95668 ) ) ( not ( = ?auto_95665 ?auto_95666 ) ) ( not ( = ?auto_95665 ?auto_95667 ) ) ( not ( = ?auto_95665 ?auto_95668 ) ) ( not ( = ?auto_95666 ?auto_95667 ) ) ( not ( = ?auto_95666 ?auto_95668 ) ) ( not ( = ?auto_95667 ?auto_95668 ) ) ( ON ?auto_95666 ?auto_95667 ) ( ON ?auto_95665 ?auto_95666 ) ( ON ?auto_95664 ?auto_95665 ) ( CLEAR ?auto_95662 ) ( ON ?auto_95663 ?auto_95664 ) ( CLEAR ?auto_95663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95661 ?auto_95662 ?auto_95663 )
      ( MAKE-7PILE ?auto_95661 ?auto_95662 ?auto_95663 ?auto_95664 ?auto_95665 ?auto_95666 ?auto_95667 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95676 - BLOCK
      ?auto_95677 - BLOCK
      ?auto_95678 - BLOCK
      ?auto_95679 - BLOCK
      ?auto_95680 - BLOCK
      ?auto_95681 - BLOCK
      ?auto_95682 - BLOCK
    )
    :vars
    (
      ?auto_95683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95682 ?auto_95683 ) ( ON-TABLE ?auto_95676 ) ( not ( = ?auto_95676 ?auto_95677 ) ) ( not ( = ?auto_95676 ?auto_95678 ) ) ( not ( = ?auto_95676 ?auto_95679 ) ) ( not ( = ?auto_95676 ?auto_95680 ) ) ( not ( = ?auto_95676 ?auto_95681 ) ) ( not ( = ?auto_95676 ?auto_95682 ) ) ( not ( = ?auto_95676 ?auto_95683 ) ) ( not ( = ?auto_95677 ?auto_95678 ) ) ( not ( = ?auto_95677 ?auto_95679 ) ) ( not ( = ?auto_95677 ?auto_95680 ) ) ( not ( = ?auto_95677 ?auto_95681 ) ) ( not ( = ?auto_95677 ?auto_95682 ) ) ( not ( = ?auto_95677 ?auto_95683 ) ) ( not ( = ?auto_95678 ?auto_95679 ) ) ( not ( = ?auto_95678 ?auto_95680 ) ) ( not ( = ?auto_95678 ?auto_95681 ) ) ( not ( = ?auto_95678 ?auto_95682 ) ) ( not ( = ?auto_95678 ?auto_95683 ) ) ( not ( = ?auto_95679 ?auto_95680 ) ) ( not ( = ?auto_95679 ?auto_95681 ) ) ( not ( = ?auto_95679 ?auto_95682 ) ) ( not ( = ?auto_95679 ?auto_95683 ) ) ( not ( = ?auto_95680 ?auto_95681 ) ) ( not ( = ?auto_95680 ?auto_95682 ) ) ( not ( = ?auto_95680 ?auto_95683 ) ) ( not ( = ?auto_95681 ?auto_95682 ) ) ( not ( = ?auto_95681 ?auto_95683 ) ) ( not ( = ?auto_95682 ?auto_95683 ) ) ( ON ?auto_95681 ?auto_95682 ) ( ON ?auto_95680 ?auto_95681 ) ( ON ?auto_95679 ?auto_95680 ) ( ON ?auto_95678 ?auto_95679 ) ( CLEAR ?auto_95676 ) ( ON ?auto_95677 ?auto_95678 ) ( CLEAR ?auto_95677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95676 ?auto_95677 )
      ( MAKE-7PILE ?auto_95676 ?auto_95677 ?auto_95678 ?auto_95679 ?auto_95680 ?auto_95681 ?auto_95682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95691 - BLOCK
      ?auto_95692 - BLOCK
      ?auto_95693 - BLOCK
      ?auto_95694 - BLOCK
      ?auto_95695 - BLOCK
      ?auto_95696 - BLOCK
      ?auto_95697 - BLOCK
    )
    :vars
    (
      ?auto_95698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95697 ?auto_95698 ) ( ON-TABLE ?auto_95691 ) ( not ( = ?auto_95691 ?auto_95692 ) ) ( not ( = ?auto_95691 ?auto_95693 ) ) ( not ( = ?auto_95691 ?auto_95694 ) ) ( not ( = ?auto_95691 ?auto_95695 ) ) ( not ( = ?auto_95691 ?auto_95696 ) ) ( not ( = ?auto_95691 ?auto_95697 ) ) ( not ( = ?auto_95691 ?auto_95698 ) ) ( not ( = ?auto_95692 ?auto_95693 ) ) ( not ( = ?auto_95692 ?auto_95694 ) ) ( not ( = ?auto_95692 ?auto_95695 ) ) ( not ( = ?auto_95692 ?auto_95696 ) ) ( not ( = ?auto_95692 ?auto_95697 ) ) ( not ( = ?auto_95692 ?auto_95698 ) ) ( not ( = ?auto_95693 ?auto_95694 ) ) ( not ( = ?auto_95693 ?auto_95695 ) ) ( not ( = ?auto_95693 ?auto_95696 ) ) ( not ( = ?auto_95693 ?auto_95697 ) ) ( not ( = ?auto_95693 ?auto_95698 ) ) ( not ( = ?auto_95694 ?auto_95695 ) ) ( not ( = ?auto_95694 ?auto_95696 ) ) ( not ( = ?auto_95694 ?auto_95697 ) ) ( not ( = ?auto_95694 ?auto_95698 ) ) ( not ( = ?auto_95695 ?auto_95696 ) ) ( not ( = ?auto_95695 ?auto_95697 ) ) ( not ( = ?auto_95695 ?auto_95698 ) ) ( not ( = ?auto_95696 ?auto_95697 ) ) ( not ( = ?auto_95696 ?auto_95698 ) ) ( not ( = ?auto_95697 ?auto_95698 ) ) ( ON ?auto_95696 ?auto_95697 ) ( ON ?auto_95695 ?auto_95696 ) ( ON ?auto_95694 ?auto_95695 ) ( ON ?auto_95693 ?auto_95694 ) ( CLEAR ?auto_95691 ) ( ON ?auto_95692 ?auto_95693 ) ( CLEAR ?auto_95692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95691 ?auto_95692 )
      ( MAKE-7PILE ?auto_95691 ?auto_95692 ?auto_95693 ?auto_95694 ?auto_95695 ?auto_95696 ?auto_95697 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95706 - BLOCK
      ?auto_95707 - BLOCK
      ?auto_95708 - BLOCK
      ?auto_95709 - BLOCK
      ?auto_95710 - BLOCK
      ?auto_95711 - BLOCK
      ?auto_95712 - BLOCK
    )
    :vars
    (
      ?auto_95713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95712 ?auto_95713 ) ( not ( = ?auto_95706 ?auto_95707 ) ) ( not ( = ?auto_95706 ?auto_95708 ) ) ( not ( = ?auto_95706 ?auto_95709 ) ) ( not ( = ?auto_95706 ?auto_95710 ) ) ( not ( = ?auto_95706 ?auto_95711 ) ) ( not ( = ?auto_95706 ?auto_95712 ) ) ( not ( = ?auto_95706 ?auto_95713 ) ) ( not ( = ?auto_95707 ?auto_95708 ) ) ( not ( = ?auto_95707 ?auto_95709 ) ) ( not ( = ?auto_95707 ?auto_95710 ) ) ( not ( = ?auto_95707 ?auto_95711 ) ) ( not ( = ?auto_95707 ?auto_95712 ) ) ( not ( = ?auto_95707 ?auto_95713 ) ) ( not ( = ?auto_95708 ?auto_95709 ) ) ( not ( = ?auto_95708 ?auto_95710 ) ) ( not ( = ?auto_95708 ?auto_95711 ) ) ( not ( = ?auto_95708 ?auto_95712 ) ) ( not ( = ?auto_95708 ?auto_95713 ) ) ( not ( = ?auto_95709 ?auto_95710 ) ) ( not ( = ?auto_95709 ?auto_95711 ) ) ( not ( = ?auto_95709 ?auto_95712 ) ) ( not ( = ?auto_95709 ?auto_95713 ) ) ( not ( = ?auto_95710 ?auto_95711 ) ) ( not ( = ?auto_95710 ?auto_95712 ) ) ( not ( = ?auto_95710 ?auto_95713 ) ) ( not ( = ?auto_95711 ?auto_95712 ) ) ( not ( = ?auto_95711 ?auto_95713 ) ) ( not ( = ?auto_95712 ?auto_95713 ) ) ( ON ?auto_95711 ?auto_95712 ) ( ON ?auto_95710 ?auto_95711 ) ( ON ?auto_95709 ?auto_95710 ) ( ON ?auto_95708 ?auto_95709 ) ( ON ?auto_95707 ?auto_95708 ) ( ON ?auto_95706 ?auto_95707 ) ( CLEAR ?auto_95706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95706 )
      ( MAKE-7PILE ?auto_95706 ?auto_95707 ?auto_95708 ?auto_95709 ?auto_95710 ?auto_95711 ?auto_95712 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95721 - BLOCK
      ?auto_95722 - BLOCK
      ?auto_95723 - BLOCK
      ?auto_95724 - BLOCK
      ?auto_95725 - BLOCK
      ?auto_95726 - BLOCK
      ?auto_95727 - BLOCK
    )
    :vars
    (
      ?auto_95728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95727 ?auto_95728 ) ( not ( = ?auto_95721 ?auto_95722 ) ) ( not ( = ?auto_95721 ?auto_95723 ) ) ( not ( = ?auto_95721 ?auto_95724 ) ) ( not ( = ?auto_95721 ?auto_95725 ) ) ( not ( = ?auto_95721 ?auto_95726 ) ) ( not ( = ?auto_95721 ?auto_95727 ) ) ( not ( = ?auto_95721 ?auto_95728 ) ) ( not ( = ?auto_95722 ?auto_95723 ) ) ( not ( = ?auto_95722 ?auto_95724 ) ) ( not ( = ?auto_95722 ?auto_95725 ) ) ( not ( = ?auto_95722 ?auto_95726 ) ) ( not ( = ?auto_95722 ?auto_95727 ) ) ( not ( = ?auto_95722 ?auto_95728 ) ) ( not ( = ?auto_95723 ?auto_95724 ) ) ( not ( = ?auto_95723 ?auto_95725 ) ) ( not ( = ?auto_95723 ?auto_95726 ) ) ( not ( = ?auto_95723 ?auto_95727 ) ) ( not ( = ?auto_95723 ?auto_95728 ) ) ( not ( = ?auto_95724 ?auto_95725 ) ) ( not ( = ?auto_95724 ?auto_95726 ) ) ( not ( = ?auto_95724 ?auto_95727 ) ) ( not ( = ?auto_95724 ?auto_95728 ) ) ( not ( = ?auto_95725 ?auto_95726 ) ) ( not ( = ?auto_95725 ?auto_95727 ) ) ( not ( = ?auto_95725 ?auto_95728 ) ) ( not ( = ?auto_95726 ?auto_95727 ) ) ( not ( = ?auto_95726 ?auto_95728 ) ) ( not ( = ?auto_95727 ?auto_95728 ) ) ( ON ?auto_95726 ?auto_95727 ) ( ON ?auto_95725 ?auto_95726 ) ( ON ?auto_95724 ?auto_95725 ) ( ON ?auto_95723 ?auto_95724 ) ( ON ?auto_95722 ?auto_95723 ) ( ON ?auto_95721 ?auto_95722 ) ( CLEAR ?auto_95721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95721 )
      ( MAKE-7PILE ?auto_95721 ?auto_95722 ?auto_95723 ?auto_95724 ?auto_95725 ?auto_95726 ?auto_95727 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95737 - BLOCK
      ?auto_95738 - BLOCK
      ?auto_95739 - BLOCK
      ?auto_95740 - BLOCK
      ?auto_95741 - BLOCK
      ?auto_95742 - BLOCK
      ?auto_95743 - BLOCK
      ?auto_95744 - BLOCK
    )
    :vars
    (
      ?auto_95745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95743 ) ( ON ?auto_95744 ?auto_95745 ) ( CLEAR ?auto_95744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95737 ) ( ON ?auto_95738 ?auto_95737 ) ( ON ?auto_95739 ?auto_95738 ) ( ON ?auto_95740 ?auto_95739 ) ( ON ?auto_95741 ?auto_95740 ) ( ON ?auto_95742 ?auto_95741 ) ( ON ?auto_95743 ?auto_95742 ) ( not ( = ?auto_95737 ?auto_95738 ) ) ( not ( = ?auto_95737 ?auto_95739 ) ) ( not ( = ?auto_95737 ?auto_95740 ) ) ( not ( = ?auto_95737 ?auto_95741 ) ) ( not ( = ?auto_95737 ?auto_95742 ) ) ( not ( = ?auto_95737 ?auto_95743 ) ) ( not ( = ?auto_95737 ?auto_95744 ) ) ( not ( = ?auto_95737 ?auto_95745 ) ) ( not ( = ?auto_95738 ?auto_95739 ) ) ( not ( = ?auto_95738 ?auto_95740 ) ) ( not ( = ?auto_95738 ?auto_95741 ) ) ( not ( = ?auto_95738 ?auto_95742 ) ) ( not ( = ?auto_95738 ?auto_95743 ) ) ( not ( = ?auto_95738 ?auto_95744 ) ) ( not ( = ?auto_95738 ?auto_95745 ) ) ( not ( = ?auto_95739 ?auto_95740 ) ) ( not ( = ?auto_95739 ?auto_95741 ) ) ( not ( = ?auto_95739 ?auto_95742 ) ) ( not ( = ?auto_95739 ?auto_95743 ) ) ( not ( = ?auto_95739 ?auto_95744 ) ) ( not ( = ?auto_95739 ?auto_95745 ) ) ( not ( = ?auto_95740 ?auto_95741 ) ) ( not ( = ?auto_95740 ?auto_95742 ) ) ( not ( = ?auto_95740 ?auto_95743 ) ) ( not ( = ?auto_95740 ?auto_95744 ) ) ( not ( = ?auto_95740 ?auto_95745 ) ) ( not ( = ?auto_95741 ?auto_95742 ) ) ( not ( = ?auto_95741 ?auto_95743 ) ) ( not ( = ?auto_95741 ?auto_95744 ) ) ( not ( = ?auto_95741 ?auto_95745 ) ) ( not ( = ?auto_95742 ?auto_95743 ) ) ( not ( = ?auto_95742 ?auto_95744 ) ) ( not ( = ?auto_95742 ?auto_95745 ) ) ( not ( = ?auto_95743 ?auto_95744 ) ) ( not ( = ?auto_95743 ?auto_95745 ) ) ( not ( = ?auto_95744 ?auto_95745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95744 ?auto_95745 )
      ( !STACK ?auto_95744 ?auto_95743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95754 - BLOCK
      ?auto_95755 - BLOCK
      ?auto_95756 - BLOCK
      ?auto_95757 - BLOCK
      ?auto_95758 - BLOCK
      ?auto_95759 - BLOCK
      ?auto_95760 - BLOCK
      ?auto_95761 - BLOCK
    )
    :vars
    (
      ?auto_95762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95760 ) ( ON ?auto_95761 ?auto_95762 ) ( CLEAR ?auto_95761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95754 ) ( ON ?auto_95755 ?auto_95754 ) ( ON ?auto_95756 ?auto_95755 ) ( ON ?auto_95757 ?auto_95756 ) ( ON ?auto_95758 ?auto_95757 ) ( ON ?auto_95759 ?auto_95758 ) ( ON ?auto_95760 ?auto_95759 ) ( not ( = ?auto_95754 ?auto_95755 ) ) ( not ( = ?auto_95754 ?auto_95756 ) ) ( not ( = ?auto_95754 ?auto_95757 ) ) ( not ( = ?auto_95754 ?auto_95758 ) ) ( not ( = ?auto_95754 ?auto_95759 ) ) ( not ( = ?auto_95754 ?auto_95760 ) ) ( not ( = ?auto_95754 ?auto_95761 ) ) ( not ( = ?auto_95754 ?auto_95762 ) ) ( not ( = ?auto_95755 ?auto_95756 ) ) ( not ( = ?auto_95755 ?auto_95757 ) ) ( not ( = ?auto_95755 ?auto_95758 ) ) ( not ( = ?auto_95755 ?auto_95759 ) ) ( not ( = ?auto_95755 ?auto_95760 ) ) ( not ( = ?auto_95755 ?auto_95761 ) ) ( not ( = ?auto_95755 ?auto_95762 ) ) ( not ( = ?auto_95756 ?auto_95757 ) ) ( not ( = ?auto_95756 ?auto_95758 ) ) ( not ( = ?auto_95756 ?auto_95759 ) ) ( not ( = ?auto_95756 ?auto_95760 ) ) ( not ( = ?auto_95756 ?auto_95761 ) ) ( not ( = ?auto_95756 ?auto_95762 ) ) ( not ( = ?auto_95757 ?auto_95758 ) ) ( not ( = ?auto_95757 ?auto_95759 ) ) ( not ( = ?auto_95757 ?auto_95760 ) ) ( not ( = ?auto_95757 ?auto_95761 ) ) ( not ( = ?auto_95757 ?auto_95762 ) ) ( not ( = ?auto_95758 ?auto_95759 ) ) ( not ( = ?auto_95758 ?auto_95760 ) ) ( not ( = ?auto_95758 ?auto_95761 ) ) ( not ( = ?auto_95758 ?auto_95762 ) ) ( not ( = ?auto_95759 ?auto_95760 ) ) ( not ( = ?auto_95759 ?auto_95761 ) ) ( not ( = ?auto_95759 ?auto_95762 ) ) ( not ( = ?auto_95760 ?auto_95761 ) ) ( not ( = ?auto_95760 ?auto_95762 ) ) ( not ( = ?auto_95761 ?auto_95762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95761 ?auto_95762 )
      ( !STACK ?auto_95761 ?auto_95760 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95771 - BLOCK
      ?auto_95772 - BLOCK
      ?auto_95773 - BLOCK
      ?auto_95774 - BLOCK
      ?auto_95775 - BLOCK
      ?auto_95776 - BLOCK
      ?auto_95777 - BLOCK
      ?auto_95778 - BLOCK
    )
    :vars
    (
      ?auto_95779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95778 ?auto_95779 ) ( ON-TABLE ?auto_95771 ) ( ON ?auto_95772 ?auto_95771 ) ( ON ?auto_95773 ?auto_95772 ) ( ON ?auto_95774 ?auto_95773 ) ( ON ?auto_95775 ?auto_95774 ) ( ON ?auto_95776 ?auto_95775 ) ( not ( = ?auto_95771 ?auto_95772 ) ) ( not ( = ?auto_95771 ?auto_95773 ) ) ( not ( = ?auto_95771 ?auto_95774 ) ) ( not ( = ?auto_95771 ?auto_95775 ) ) ( not ( = ?auto_95771 ?auto_95776 ) ) ( not ( = ?auto_95771 ?auto_95777 ) ) ( not ( = ?auto_95771 ?auto_95778 ) ) ( not ( = ?auto_95771 ?auto_95779 ) ) ( not ( = ?auto_95772 ?auto_95773 ) ) ( not ( = ?auto_95772 ?auto_95774 ) ) ( not ( = ?auto_95772 ?auto_95775 ) ) ( not ( = ?auto_95772 ?auto_95776 ) ) ( not ( = ?auto_95772 ?auto_95777 ) ) ( not ( = ?auto_95772 ?auto_95778 ) ) ( not ( = ?auto_95772 ?auto_95779 ) ) ( not ( = ?auto_95773 ?auto_95774 ) ) ( not ( = ?auto_95773 ?auto_95775 ) ) ( not ( = ?auto_95773 ?auto_95776 ) ) ( not ( = ?auto_95773 ?auto_95777 ) ) ( not ( = ?auto_95773 ?auto_95778 ) ) ( not ( = ?auto_95773 ?auto_95779 ) ) ( not ( = ?auto_95774 ?auto_95775 ) ) ( not ( = ?auto_95774 ?auto_95776 ) ) ( not ( = ?auto_95774 ?auto_95777 ) ) ( not ( = ?auto_95774 ?auto_95778 ) ) ( not ( = ?auto_95774 ?auto_95779 ) ) ( not ( = ?auto_95775 ?auto_95776 ) ) ( not ( = ?auto_95775 ?auto_95777 ) ) ( not ( = ?auto_95775 ?auto_95778 ) ) ( not ( = ?auto_95775 ?auto_95779 ) ) ( not ( = ?auto_95776 ?auto_95777 ) ) ( not ( = ?auto_95776 ?auto_95778 ) ) ( not ( = ?auto_95776 ?auto_95779 ) ) ( not ( = ?auto_95777 ?auto_95778 ) ) ( not ( = ?auto_95777 ?auto_95779 ) ) ( not ( = ?auto_95778 ?auto_95779 ) ) ( CLEAR ?auto_95776 ) ( ON ?auto_95777 ?auto_95778 ) ( CLEAR ?auto_95777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95771 ?auto_95772 ?auto_95773 ?auto_95774 ?auto_95775 ?auto_95776 ?auto_95777 )
      ( MAKE-8PILE ?auto_95771 ?auto_95772 ?auto_95773 ?auto_95774 ?auto_95775 ?auto_95776 ?auto_95777 ?auto_95778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95788 - BLOCK
      ?auto_95789 - BLOCK
      ?auto_95790 - BLOCK
      ?auto_95791 - BLOCK
      ?auto_95792 - BLOCK
      ?auto_95793 - BLOCK
      ?auto_95794 - BLOCK
      ?auto_95795 - BLOCK
    )
    :vars
    (
      ?auto_95796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95795 ?auto_95796 ) ( ON-TABLE ?auto_95788 ) ( ON ?auto_95789 ?auto_95788 ) ( ON ?auto_95790 ?auto_95789 ) ( ON ?auto_95791 ?auto_95790 ) ( ON ?auto_95792 ?auto_95791 ) ( ON ?auto_95793 ?auto_95792 ) ( not ( = ?auto_95788 ?auto_95789 ) ) ( not ( = ?auto_95788 ?auto_95790 ) ) ( not ( = ?auto_95788 ?auto_95791 ) ) ( not ( = ?auto_95788 ?auto_95792 ) ) ( not ( = ?auto_95788 ?auto_95793 ) ) ( not ( = ?auto_95788 ?auto_95794 ) ) ( not ( = ?auto_95788 ?auto_95795 ) ) ( not ( = ?auto_95788 ?auto_95796 ) ) ( not ( = ?auto_95789 ?auto_95790 ) ) ( not ( = ?auto_95789 ?auto_95791 ) ) ( not ( = ?auto_95789 ?auto_95792 ) ) ( not ( = ?auto_95789 ?auto_95793 ) ) ( not ( = ?auto_95789 ?auto_95794 ) ) ( not ( = ?auto_95789 ?auto_95795 ) ) ( not ( = ?auto_95789 ?auto_95796 ) ) ( not ( = ?auto_95790 ?auto_95791 ) ) ( not ( = ?auto_95790 ?auto_95792 ) ) ( not ( = ?auto_95790 ?auto_95793 ) ) ( not ( = ?auto_95790 ?auto_95794 ) ) ( not ( = ?auto_95790 ?auto_95795 ) ) ( not ( = ?auto_95790 ?auto_95796 ) ) ( not ( = ?auto_95791 ?auto_95792 ) ) ( not ( = ?auto_95791 ?auto_95793 ) ) ( not ( = ?auto_95791 ?auto_95794 ) ) ( not ( = ?auto_95791 ?auto_95795 ) ) ( not ( = ?auto_95791 ?auto_95796 ) ) ( not ( = ?auto_95792 ?auto_95793 ) ) ( not ( = ?auto_95792 ?auto_95794 ) ) ( not ( = ?auto_95792 ?auto_95795 ) ) ( not ( = ?auto_95792 ?auto_95796 ) ) ( not ( = ?auto_95793 ?auto_95794 ) ) ( not ( = ?auto_95793 ?auto_95795 ) ) ( not ( = ?auto_95793 ?auto_95796 ) ) ( not ( = ?auto_95794 ?auto_95795 ) ) ( not ( = ?auto_95794 ?auto_95796 ) ) ( not ( = ?auto_95795 ?auto_95796 ) ) ( CLEAR ?auto_95793 ) ( ON ?auto_95794 ?auto_95795 ) ( CLEAR ?auto_95794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95788 ?auto_95789 ?auto_95790 ?auto_95791 ?auto_95792 ?auto_95793 ?auto_95794 )
      ( MAKE-8PILE ?auto_95788 ?auto_95789 ?auto_95790 ?auto_95791 ?auto_95792 ?auto_95793 ?auto_95794 ?auto_95795 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95805 - BLOCK
      ?auto_95806 - BLOCK
      ?auto_95807 - BLOCK
      ?auto_95808 - BLOCK
      ?auto_95809 - BLOCK
      ?auto_95810 - BLOCK
      ?auto_95811 - BLOCK
      ?auto_95812 - BLOCK
    )
    :vars
    (
      ?auto_95813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95812 ?auto_95813 ) ( ON-TABLE ?auto_95805 ) ( ON ?auto_95806 ?auto_95805 ) ( ON ?auto_95807 ?auto_95806 ) ( ON ?auto_95808 ?auto_95807 ) ( ON ?auto_95809 ?auto_95808 ) ( not ( = ?auto_95805 ?auto_95806 ) ) ( not ( = ?auto_95805 ?auto_95807 ) ) ( not ( = ?auto_95805 ?auto_95808 ) ) ( not ( = ?auto_95805 ?auto_95809 ) ) ( not ( = ?auto_95805 ?auto_95810 ) ) ( not ( = ?auto_95805 ?auto_95811 ) ) ( not ( = ?auto_95805 ?auto_95812 ) ) ( not ( = ?auto_95805 ?auto_95813 ) ) ( not ( = ?auto_95806 ?auto_95807 ) ) ( not ( = ?auto_95806 ?auto_95808 ) ) ( not ( = ?auto_95806 ?auto_95809 ) ) ( not ( = ?auto_95806 ?auto_95810 ) ) ( not ( = ?auto_95806 ?auto_95811 ) ) ( not ( = ?auto_95806 ?auto_95812 ) ) ( not ( = ?auto_95806 ?auto_95813 ) ) ( not ( = ?auto_95807 ?auto_95808 ) ) ( not ( = ?auto_95807 ?auto_95809 ) ) ( not ( = ?auto_95807 ?auto_95810 ) ) ( not ( = ?auto_95807 ?auto_95811 ) ) ( not ( = ?auto_95807 ?auto_95812 ) ) ( not ( = ?auto_95807 ?auto_95813 ) ) ( not ( = ?auto_95808 ?auto_95809 ) ) ( not ( = ?auto_95808 ?auto_95810 ) ) ( not ( = ?auto_95808 ?auto_95811 ) ) ( not ( = ?auto_95808 ?auto_95812 ) ) ( not ( = ?auto_95808 ?auto_95813 ) ) ( not ( = ?auto_95809 ?auto_95810 ) ) ( not ( = ?auto_95809 ?auto_95811 ) ) ( not ( = ?auto_95809 ?auto_95812 ) ) ( not ( = ?auto_95809 ?auto_95813 ) ) ( not ( = ?auto_95810 ?auto_95811 ) ) ( not ( = ?auto_95810 ?auto_95812 ) ) ( not ( = ?auto_95810 ?auto_95813 ) ) ( not ( = ?auto_95811 ?auto_95812 ) ) ( not ( = ?auto_95811 ?auto_95813 ) ) ( not ( = ?auto_95812 ?auto_95813 ) ) ( ON ?auto_95811 ?auto_95812 ) ( CLEAR ?auto_95809 ) ( ON ?auto_95810 ?auto_95811 ) ( CLEAR ?auto_95810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95805 ?auto_95806 ?auto_95807 ?auto_95808 ?auto_95809 ?auto_95810 )
      ( MAKE-8PILE ?auto_95805 ?auto_95806 ?auto_95807 ?auto_95808 ?auto_95809 ?auto_95810 ?auto_95811 ?auto_95812 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95822 - BLOCK
      ?auto_95823 - BLOCK
      ?auto_95824 - BLOCK
      ?auto_95825 - BLOCK
      ?auto_95826 - BLOCK
      ?auto_95827 - BLOCK
      ?auto_95828 - BLOCK
      ?auto_95829 - BLOCK
    )
    :vars
    (
      ?auto_95830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95829 ?auto_95830 ) ( ON-TABLE ?auto_95822 ) ( ON ?auto_95823 ?auto_95822 ) ( ON ?auto_95824 ?auto_95823 ) ( ON ?auto_95825 ?auto_95824 ) ( ON ?auto_95826 ?auto_95825 ) ( not ( = ?auto_95822 ?auto_95823 ) ) ( not ( = ?auto_95822 ?auto_95824 ) ) ( not ( = ?auto_95822 ?auto_95825 ) ) ( not ( = ?auto_95822 ?auto_95826 ) ) ( not ( = ?auto_95822 ?auto_95827 ) ) ( not ( = ?auto_95822 ?auto_95828 ) ) ( not ( = ?auto_95822 ?auto_95829 ) ) ( not ( = ?auto_95822 ?auto_95830 ) ) ( not ( = ?auto_95823 ?auto_95824 ) ) ( not ( = ?auto_95823 ?auto_95825 ) ) ( not ( = ?auto_95823 ?auto_95826 ) ) ( not ( = ?auto_95823 ?auto_95827 ) ) ( not ( = ?auto_95823 ?auto_95828 ) ) ( not ( = ?auto_95823 ?auto_95829 ) ) ( not ( = ?auto_95823 ?auto_95830 ) ) ( not ( = ?auto_95824 ?auto_95825 ) ) ( not ( = ?auto_95824 ?auto_95826 ) ) ( not ( = ?auto_95824 ?auto_95827 ) ) ( not ( = ?auto_95824 ?auto_95828 ) ) ( not ( = ?auto_95824 ?auto_95829 ) ) ( not ( = ?auto_95824 ?auto_95830 ) ) ( not ( = ?auto_95825 ?auto_95826 ) ) ( not ( = ?auto_95825 ?auto_95827 ) ) ( not ( = ?auto_95825 ?auto_95828 ) ) ( not ( = ?auto_95825 ?auto_95829 ) ) ( not ( = ?auto_95825 ?auto_95830 ) ) ( not ( = ?auto_95826 ?auto_95827 ) ) ( not ( = ?auto_95826 ?auto_95828 ) ) ( not ( = ?auto_95826 ?auto_95829 ) ) ( not ( = ?auto_95826 ?auto_95830 ) ) ( not ( = ?auto_95827 ?auto_95828 ) ) ( not ( = ?auto_95827 ?auto_95829 ) ) ( not ( = ?auto_95827 ?auto_95830 ) ) ( not ( = ?auto_95828 ?auto_95829 ) ) ( not ( = ?auto_95828 ?auto_95830 ) ) ( not ( = ?auto_95829 ?auto_95830 ) ) ( ON ?auto_95828 ?auto_95829 ) ( CLEAR ?auto_95826 ) ( ON ?auto_95827 ?auto_95828 ) ( CLEAR ?auto_95827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95822 ?auto_95823 ?auto_95824 ?auto_95825 ?auto_95826 ?auto_95827 )
      ( MAKE-8PILE ?auto_95822 ?auto_95823 ?auto_95824 ?auto_95825 ?auto_95826 ?auto_95827 ?auto_95828 ?auto_95829 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95839 - BLOCK
      ?auto_95840 - BLOCK
      ?auto_95841 - BLOCK
      ?auto_95842 - BLOCK
      ?auto_95843 - BLOCK
      ?auto_95844 - BLOCK
      ?auto_95845 - BLOCK
      ?auto_95846 - BLOCK
    )
    :vars
    (
      ?auto_95847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95846 ?auto_95847 ) ( ON-TABLE ?auto_95839 ) ( ON ?auto_95840 ?auto_95839 ) ( ON ?auto_95841 ?auto_95840 ) ( ON ?auto_95842 ?auto_95841 ) ( not ( = ?auto_95839 ?auto_95840 ) ) ( not ( = ?auto_95839 ?auto_95841 ) ) ( not ( = ?auto_95839 ?auto_95842 ) ) ( not ( = ?auto_95839 ?auto_95843 ) ) ( not ( = ?auto_95839 ?auto_95844 ) ) ( not ( = ?auto_95839 ?auto_95845 ) ) ( not ( = ?auto_95839 ?auto_95846 ) ) ( not ( = ?auto_95839 ?auto_95847 ) ) ( not ( = ?auto_95840 ?auto_95841 ) ) ( not ( = ?auto_95840 ?auto_95842 ) ) ( not ( = ?auto_95840 ?auto_95843 ) ) ( not ( = ?auto_95840 ?auto_95844 ) ) ( not ( = ?auto_95840 ?auto_95845 ) ) ( not ( = ?auto_95840 ?auto_95846 ) ) ( not ( = ?auto_95840 ?auto_95847 ) ) ( not ( = ?auto_95841 ?auto_95842 ) ) ( not ( = ?auto_95841 ?auto_95843 ) ) ( not ( = ?auto_95841 ?auto_95844 ) ) ( not ( = ?auto_95841 ?auto_95845 ) ) ( not ( = ?auto_95841 ?auto_95846 ) ) ( not ( = ?auto_95841 ?auto_95847 ) ) ( not ( = ?auto_95842 ?auto_95843 ) ) ( not ( = ?auto_95842 ?auto_95844 ) ) ( not ( = ?auto_95842 ?auto_95845 ) ) ( not ( = ?auto_95842 ?auto_95846 ) ) ( not ( = ?auto_95842 ?auto_95847 ) ) ( not ( = ?auto_95843 ?auto_95844 ) ) ( not ( = ?auto_95843 ?auto_95845 ) ) ( not ( = ?auto_95843 ?auto_95846 ) ) ( not ( = ?auto_95843 ?auto_95847 ) ) ( not ( = ?auto_95844 ?auto_95845 ) ) ( not ( = ?auto_95844 ?auto_95846 ) ) ( not ( = ?auto_95844 ?auto_95847 ) ) ( not ( = ?auto_95845 ?auto_95846 ) ) ( not ( = ?auto_95845 ?auto_95847 ) ) ( not ( = ?auto_95846 ?auto_95847 ) ) ( ON ?auto_95845 ?auto_95846 ) ( ON ?auto_95844 ?auto_95845 ) ( CLEAR ?auto_95842 ) ( ON ?auto_95843 ?auto_95844 ) ( CLEAR ?auto_95843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95839 ?auto_95840 ?auto_95841 ?auto_95842 ?auto_95843 )
      ( MAKE-8PILE ?auto_95839 ?auto_95840 ?auto_95841 ?auto_95842 ?auto_95843 ?auto_95844 ?auto_95845 ?auto_95846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95856 - BLOCK
      ?auto_95857 - BLOCK
      ?auto_95858 - BLOCK
      ?auto_95859 - BLOCK
      ?auto_95860 - BLOCK
      ?auto_95861 - BLOCK
      ?auto_95862 - BLOCK
      ?auto_95863 - BLOCK
    )
    :vars
    (
      ?auto_95864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95863 ?auto_95864 ) ( ON-TABLE ?auto_95856 ) ( ON ?auto_95857 ?auto_95856 ) ( ON ?auto_95858 ?auto_95857 ) ( ON ?auto_95859 ?auto_95858 ) ( not ( = ?auto_95856 ?auto_95857 ) ) ( not ( = ?auto_95856 ?auto_95858 ) ) ( not ( = ?auto_95856 ?auto_95859 ) ) ( not ( = ?auto_95856 ?auto_95860 ) ) ( not ( = ?auto_95856 ?auto_95861 ) ) ( not ( = ?auto_95856 ?auto_95862 ) ) ( not ( = ?auto_95856 ?auto_95863 ) ) ( not ( = ?auto_95856 ?auto_95864 ) ) ( not ( = ?auto_95857 ?auto_95858 ) ) ( not ( = ?auto_95857 ?auto_95859 ) ) ( not ( = ?auto_95857 ?auto_95860 ) ) ( not ( = ?auto_95857 ?auto_95861 ) ) ( not ( = ?auto_95857 ?auto_95862 ) ) ( not ( = ?auto_95857 ?auto_95863 ) ) ( not ( = ?auto_95857 ?auto_95864 ) ) ( not ( = ?auto_95858 ?auto_95859 ) ) ( not ( = ?auto_95858 ?auto_95860 ) ) ( not ( = ?auto_95858 ?auto_95861 ) ) ( not ( = ?auto_95858 ?auto_95862 ) ) ( not ( = ?auto_95858 ?auto_95863 ) ) ( not ( = ?auto_95858 ?auto_95864 ) ) ( not ( = ?auto_95859 ?auto_95860 ) ) ( not ( = ?auto_95859 ?auto_95861 ) ) ( not ( = ?auto_95859 ?auto_95862 ) ) ( not ( = ?auto_95859 ?auto_95863 ) ) ( not ( = ?auto_95859 ?auto_95864 ) ) ( not ( = ?auto_95860 ?auto_95861 ) ) ( not ( = ?auto_95860 ?auto_95862 ) ) ( not ( = ?auto_95860 ?auto_95863 ) ) ( not ( = ?auto_95860 ?auto_95864 ) ) ( not ( = ?auto_95861 ?auto_95862 ) ) ( not ( = ?auto_95861 ?auto_95863 ) ) ( not ( = ?auto_95861 ?auto_95864 ) ) ( not ( = ?auto_95862 ?auto_95863 ) ) ( not ( = ?auto_95862 ?auto_95864 ) ) ( not ( = ?auto_95863 ?auto_95864 ) ) ( ON ?auto_95862 ?auto_95863 ) ( ON ?auto_95861 ?auto_95862 ) ( CLEAR ?auto_95859 ) ( ON ?auto_95860 ?auto_95861 ) ( CLEAR ?auto_95860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95856 ?auto_95857 ?auto_95858 ?auto_95859 ?auto_95860 )
      ( MAKE-8PILE ?auto_95856 ?auto_95857 ?auto_95858 ?auto_95859 ?auto_95860 ?auto_95861 ?auto_95862 ?auto_95863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95873 - BLOCK
      ?auto_95874 - BLOCK
      ?auto_95875 - BLOCK
      ?auto_95876 - BLOCK
      ?auto_95877 - BLOCK
      ?auto_95878 - BLOCK
      ?auto_95879 - BLOCK
      ?auto_95880 - BLOCK
    )
    :vars
    (
      ?auto_95881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95880 ?auto_95881 ) ( ON-TABLE ?auto_95873 ) ( ON ?auto_95874 ?auto_95873 ) ( ON ?auto_95875 ?auto_95874 ) ( not ( = ?auto_95873 ?auto_95874 ) ) ( not ( = ?auto_95873 ?auto_95875 ) ) ( not ( = ?auto_95873 ?auto_95876 ) ) ( not ( = ?auto_95873 ?auto_95877 ) ) ( not ( = ?auto_95873 ?auto_95878 ) ) ( not ( = ?auto_95873 ?auto_95879 ) ) ( not ( = ?auto_95873 ?auto_95880 ) ) ( not ( = ?auto_95873 ?auto_95881 ) ) ( not ( = ?auto_95874 ?auto_95875 ) ) ( not ( = ?auto_95874 ?auto_95876 ) ) ( not ( = ?auto_95874 ?auto_95877 ) ) ( not ( = ?auto_95874 ?auto_95878 ) ) ( not ( = ?auto_95874 ?auto_95879 ) ) ( not ( = ?auto_95874 ?auto_95880 ) ) ( not ( = ?auto_95874 ?auto_95881 ) ) ( not ( = ?auto_95875 ?auto_95876 ) ) ( not ( = ?auto_95875 ?auto_95877 ) ) ( not ( = ?auto_95875 ?auto_95878 ) ) ( not ( = ?auto_95875 ?auto_95879 ) ) ( not ( = ?auto_95875 ?auto_95880 ) ) ( not ( = ?auto_95875 ?auto_95881 ) ) ( not ( = ?auto_95876 ?auto_95877 ) ) ( not ( = ?auto_95876 ?auto_95878 ) ) ( not ( = ?auto_95876 ?auto_95879 ) ) ( not ( = ?auto_95876 ?auto_95880 ) ) ( not ( = ?auto_95876 ?auto_95881 ) ) ( not ( = ?auto_95877 ?auto_95878 ) ) ( not ( = ?auto_95877 ?auto_95879 ) ) ( not ( = ?auto_95877 ?auto_95880 ) ) ( not ( = ?auto_95877 ?auto_95881 ) ) ( not ( = ?auto_95878 ?auto_95879 ) ) ( not ( = ?auto_95878 ?auto_95880 ) ) ( not ( = ?auto_95878 ?auto_95881 ) ) ( not ( = ?auto_95879 ?auto_95880 ) ) ( not ( = ?auto_95879 ?auto_95881 ) ) ( not ( = ?auto_95880 ?auto_95881 ) ) ( ON ?auto_95879 ?auto_95880 ) ( ON ?auto_95878 ?auto_95879 ) ( ON ?auto_95877 ?auto_95878 ) ( CLEAR ?auto_95875 ) ( ON ?auto_95876 ?auto_95877 ) ( CLEAR ?auto_95876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95873 ?auto_95874 ?auto_95875 ?auto_95876 )
      ( MAKE-8PILE ?auto_95873 ?auto_95874 ?auto_95875 ?auto_95876 ?auto_95877 ?auto_95878 ?auto_95879 ?auto_95880 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95890 - BLOCK
      ?auto_95891 - BLOCK
      ?auto_95892 - BLOCK
      ?auto_95893 - BLOCK
      ?auto_95894 - BLOCK
      ?auto_95895 - BLOCK
      ?auto_95896 - BLOCK
      ?auto_95897 - BLOCK
    )
    :vars
    (
      ?auto_95898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95897 ?auto_95898 ) ( ON-TABLE ?auto_95890 ) ( ON ?auto_95891 ?auto_95890 ) ( ON ?auto_95892 ?auto_95891 ) ( not ( = ?auto_95890 ?auto_95891 ) ) ( not ( = ?auto_95890 ?auto_95892 ) ) ( not ( = ?auto_95890 ?auto_95893 ) ) ( not ( = ?auto_95890 ?auto_95894 ) ) ( not ( = ?auto_95890 ?auto_95895 ) ) ( not ( = ?auto_95890 ?auto_95896 ) ) ( not ( = ?auto_95890 ?auto_95897 ) ) ( not ( = ?auto_95890 ?auto_95898 ) ) ( not ( = ?auto_95891 ?auto_95892 ) ) ( not ( = ?auto_95891 ?auto_95893 ) ) ( not ( = ?auto_95891 ?auto_95894 ) ) ( not ( = ?auto_95891 ?auto_95895 ) ) ( not ( = ?auto_95891 ?auto_95896 ) ) ( not ( = ?auto_95891 ?auto_95897 ) ) ( not ( = ?auto_95891 ?auto_95898 ) ) ( not ( = ?auto_95892 ?auto_95893 ) ) ( not ( = ?auto_95892 ?auto_95894 ) ) ( not ( = ?auto_95892 ?auto_95895 ) ) ( not ( = ?auto_95892 ?auto_95896 ) ) ( not ( = ?auto_95892 ?auto_95897 ) ) ( not ( = ?auto_95892 ?auto_95898 ) ) ( not ( = ?auto_95893 ?auto_95894 ) ) ( not ( = ?auto_95893 ?auto_95895 ) ) ( not ( = ?auto_95893 ?auto_95896 ) ) ( not ( = ?auto_95893 ?auto_95897 ) ) ( not ( = ?auto_95893 ?auto_95898 ) ) ( not ( = ?auto_95894 ?auto_95895 ) ) ( not ( = ?auto_95894 ?auto_95896 ) ) ( not ( = ?auto_95894 ?auto_95897 ) ) ( not ( = ?auto_95894 ?auto_95898 ) ) ( not ( = ?auto_95895 ?auto_95896 ) ) ( not ( = ?auto_95895 ?auto_95897 ) ) ( not ( = ?auto_95895 ?auto_95898 ) ) ( not ( = ?auto_95896 ?auto_95897 ) ) ( not ( = ?auto_95896 ?auto_95898 ) ) ( not ( = ?auto_95897 ?auto_95898 ) ) ( ON ?auto_95896 ?auto_95897 ) ( ON ?auto_95895 ?auto_95896 ) ( ON ?auto_95894 ?auto_95895 ) ( CLEAR ?auto_95892 ) ( ON ?auto_95893 ?auto_95894 ) ( CLEAR ?auto_95893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95890 ?auto_95891 ?auto_95892 ?auto_95893 )
      ( MAKE-8PILE ?auto_95890 ?auto_95891 ?auto_95892 ?auto_95893 ?auto_95894 ?auto_95895 ?auto_95896 ?auto_95897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95907 - BLOCK
      ?auto_95908 - BLOCK
      ?auto_95909 - BLOCK
      ?auto_95910 - BLOCK
      ?auto_95911 - BLOCK
      ?auto_95912 - BLOCK
      ?auto_95913 - BLOCK
      ?auto_95914 - BLOCK
    )
    :vars
    (
      ?auto_95915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95914 ?auto_95915 ) ( ON-TABLE ?auto_95907 ) ( ON ?auto_95908 ?auto_95907 ) ( not ( = ?auto_95907 ?auto_95908 ) ) ( not ( = ?auto_95907 ?auto_95909 ) ) ( not ( = ?auto_95907 ?auto_95910 ) ) ( not ( = ?auto_95907 ?auto_95911 ) ) ( not ( = ?auto_95907 ?auto_95912 ) ) ( not ( = ?auto_95907 ?auto_95913 ) ) ( not ( = ?auto_95907 ?auto_95914 ) ) ( not ( = ?auto_95907 ?auto_95915 ) ) ( not ( = ?auto_95908 ?auto_95909 ) ) ( not ( = ?auto_95908 ?auto_95910 ) ) ( not ( = ?auto_95908 ?auto_95911 ) ) ( not ( = ?auto_95908 ?auto_95912 ) ) ( not ( = ?auto_95908 ?auto_95913 ) ) ( not ( = ?auto_95908 ?auto_95914 ) ) ( not ( = ?auto_95908 ?auto_95915 ) ) ( not ( = ?auto_95909 ?auto_95910 ) ) ( not ( = ?auto_95909 ?auto_95911 ) ) ( not ( = ?auto_95909 ?auto_95912 ) ) ( not ( = ?auto_95909 ?auto_95913 ) ) ( not ( = ?auto_95909 ?auto_95914 ) ) ( not ( = ?auto_95909 ?auto_95915 ) ) ( not ( = ?auto_95910 ?auto_95911 ) ) ( not ( = ?auto_95910 ?auto_95912 ) ) ( not ( = ?auto_95910 ?auto_95913 ) ) ( not ( = ?auto_95910 ?auto_95914 ) ) ( not ( = ?auto_95910 ?auto_95915 ) ) ( not ( = ?auto_95911 ?auto_95912 ) ) ( not ( = ?auto_95911 ?auto_95913 ) ) ( not ( = ?auto_95911 ?auto_95914 ) ) ( not ( = ?auto_95911 ?auto_95915 ) ) ( not ( = ?auto_95912 ?auto_95913 ) ) ( not ( = ?auto_95912 ?auto_95914 ) ) ( not ( = ?auto_95912 ?auto_95915 ) ) ( not ( = ?auto_95913 ?auto_95914 ) ) ( not ( = ?auto_95913 ?auto_95915 ) ) ( not ( = ?auto_95914 ?auto_95915 ) ) ( ON ?auto_95913 ?auto_95914 ) ( ON ?auto_95912 ?auto_95913 ) ( ON ?auto_95911 ?auto_95912 ) ( ON ?auto_95910 ?auto_95911 ) ( CLEAR ?auto_95908 ) ( ON ?auto_95909 ?auto_95910 ) ( CLEAR ?auto_95909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95907 ?auto_95908 ?auto_95909 )
      ( MAKE-8PILE ?auto_95907 ?auto_95908 ?auto_95909 ?auto_95910 ?auto_95911 ?auto_95912 ?auto_95913 ?auto_95914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95924 - BLOCK
      ?auto_95925 - BLOCK
      ?auto_95926 - BLOCK
      ?auto_95927 - BLOCK
      ?auto_95928 - BLOCK
      ?auto_95929 - BLOCK
      ?auto_95930 - BLOCK
      ?auto_95931 - BLOCK
    )
    :vars
    (
      ?auto_95932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95931 ?auto_95932 ) ( ON-TABLE ?auto_95924 ) ( ON ?auto_95925 ?auto_95924 ) ( not ( = ?auto_95924 ?auto_95925 ) ) ( not ( = ?auto_95924 ?auto_95926 ) ) ( not ( = ?auto_95924 ?auto_95927 ) ) ( not ( = ?auto_95924 ?auto_95928 ) ) ( not ( = ?auto_95924 ?auto_95929 ) ) ( not ( = ?auto_95924 ?auto_95930 ) ) ( not ( = ?auto_95924 ?auto_95931 ) ) ( not ( = ?auto_95924 ?auto_95932 ) ) ( not ( = ?auto_95925 ?auto_95926 ) ) ( not ( = ?auto_95925 ?auto_95927 ) ) ( not ( = ?auto_95925 ?auto_95928 ) ) ( not ( = ?auto_95925 ?auto_95929 ) ) ( not ( = ?auto_95925 ?auto_95930 ) ) ( not ( = ?auto_95925 ?auto_95931 ) ) ( not ( = ?auto_95925 ?auto_95932 ) ) ( not ( = ?auto_95926 ?auto_95927 ) ) ( not ( = ?auto_95926 ?auto_95928 ) ) ( not ( = ?auto_95926 ?auto_95929 ) ) ( not ( = ?auto_95926 ?auto_95930 ) ) ( not ( = ?auto_95926 ?auto_95931 ) ) ( not ( = ?auto_95926 ?auto_95932 ) ) ( not ( = ?auto_95927 ?auto_95928 ) ) ( not ( = ?auto_95927 ?auto_95929 ) ) ( not ( = ?auto_95927 ?auto_95930 ) ) ( not ( = ?auto_95927 ?auto_95931 ) ) ( not ( = ?auto_95927 ?auto_95932 ) ) ( not ( = ?auto_95928 ?auto_95929 ) ) ( not ( = ?auto_95928 ?auto_95930 ) ) ( not ( = ?auto_95928 ?auto_95931 ) ) ( not ( = ?auto_95928 ?auto_95932 ) ) ( not ( = ?auto_95929 ?auto_95930 ) ) ( not ( = ?auto_95929 ?auto_95931 ) ) ( not ( = ?auto_95929 ?auto_95932 ) ) ( not ( = ?auto_95930 ?auto_95931 ) ) ( not ( = ?auto_95930 ?auto_95932 ) ) ( not ( = ?auto_95931 ?auto_95932 ) ) ( ON ?auto_95930 ?auto_95931 ) ( ON ?auto_95929 ?auto_95930 ) ( ON ?auto_95928 ?auto_95929 ) ( ON ?auto_95927 ?auto_95928 ) ( CLEAR ?auto_95925 ) ( ON ?auto_95926 ?auto_95927 ) ( CLEAR ?auto_95926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95924 ?auto_95925 ?auto_95926 )
      ( MAKE-8PILE ?auto_95924 ?auto_95925 ?auto_95926 ?auto_95927 ?auto_95928 ?auto_95929 ?auto_95930 ?auto_95931 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95941 - BLOCK
      ?auto_95942 - BLOCK
      ?auto_95943 - BLOCK
      ?auto_95944 - BLOCK
      ?auto_95945 - BLOCK
      ?auto_95946 - BLOCK
      ?auto_95947 - BLOCK
      ?auto_95948 - BLOCK
    )
    :vars
    (
      ?auto_95949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95948 ?auto_95949 ) ( ON-TABLE ?auto_95941 ) ( not ( = ?auto_95941 ?auto_95942 ) ) ( not ( = ?auto_95941 ?auto_95943 ) ) ( not ( = ?auto_95941 ?auto_95944 ) ) ( not ( = ?auto_95941 ?auto_95945 ) ) ( not ( = ?auto_95941 ?auto_95946 ) ) ( not ( = ?auto_95941 ?auto_95947 ) ) ( not ( = ?auto_95941 ?auto_95948 ) ) ( not ( = ?auto_95941 ?auto_95949 ) ) ( not ( = ?auto_95942 ?auto_95943 ) ) ( not ( = ?auto_95942 ?auto_95944 ) ) ( not ( = ?auto_95942 ?auto_95945 ) ) ( not ( = ?auto_95942 ?auto_95946 ) ) ( not ( = ?auto_95942 ?auto_95947 ) ) ( not ( = ?auto_95942 ?auto_95948 ) ) ( not ( = ?auto_95942 ?auto_95949 ) ) ( not ( = ?auto_95943 ?auto_95944 ) ) ( not ( = ?auto_95943 ?auto_95945 ) ) ( not ( = ?auto_95943 ?auto_95946 ) ) ( not ( = ?auto_95943 ?auto_95947 ) ) ( not ( = ?auto_95943 ?auto_95948 ) ) ( not ( = ?auto_95943 ?auto_95949 ) ) ( not ( = ?auto_95944 ?auto_95945 ) ) ( not ( = ?auto_95944 ?auto_95946 ) ) ( not ( = ?auto_95944 ?auto_95947 ) ) ( not ( = ?auto_95944 ?auto_95948 ) ) ( not ( = ?auto_95944 ?auto_95949 ) ) ( not ( = ?auto_95945 ?auto_95946 ) ) ( not ( = ?auto_95945 ?auto_95947 ) ) ( not ( = ?auto_95945 ?auto_95948 ) ) ( not ( = ?auto_95945 ?auto_95949 ) ) ( not ( = ?auto_95946 ?auto_95947 ) ) ( not ( = ?auto_95946 ?auto_95948 ) ) ( not ( = ?auto_95946 ?auto_95949 ) ) ( not ( = ?auto_95947 ?auto_95948 ) ) ( not ( = ?auto_95947 ?auto_95949 ) ) ( not ( = ?auto_95948 ?auto_95949 ) ) ( ON ?auto_95947 ?auto_95948 ) ( ON ?auto_95946 ?auto_95947 ) ( ON ?auto_95945 ?auto_95946 ) ( ON ?auto_95944 ?auto_95945 ) ( ON ?auto_95943 ?auto_95944 ) ( CLEAR ?auto_95941 ) ( ON ?auto_95942 ?auto_95943 ) ( CLEAR ?auto_95942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95941 ?auto_95942 )
      ( MAKE-8PILE ?auto_95941 ?auto_95942 ?auto_95943 ?auto_95944 ?auto_95945 ?auto_95946 ?auto_95947 ?auto_95948 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95958 - BLOCK
      ?auto_95959 - BLOCK
      ?auto_95960 - BLOCK
      ?auto_95961 - BLOCK
      ?auto_95962 - BLOCK
      ?auto_95963 - BLOCK
      ?auto_95964 - BLOCK
      ?auto_95965 - BLOCK
    )
    :vars
    (
      ?auto_95966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95965 ?auto_95966 ) ( ON-TABLE ?auto_95958 ) ( not ( = ?auto_95958 ?auto_95959 ) ) ( not ( = ?auto_95958 ?auto_95960 ) ) ( not ( = ?auto_95958 ?auto_95961 ) ) ( not ( = ?auto_95958 ?auto_95962 ) ) ( not ( = ?auto_95958 ?auto_95963 ) ) ( not ( = ?auto_95958 ?auto_95964 ) ) ( not ( = ?auto_95958 ?auto_95965 ) ) ( not ( = ?auto_95958 ?auto_95966 ) ) ( not ( = ?auto_95959 ?auto_95960 ) ) ( not ( = ?auto_95959 ?auto_95961 ) ) ( not ( = ?auto_95959 ?auto_95962 ) ) ( not ( = ?auto_95959 ?auto_95963 ) ) ( not ( = ?auto_95959 ?auto_95964 ) ) ( not ( = ?auto_95959 ?auto_95965 ) ) ( not ( = ?auto_95959 ?auto_95966 ) ) ( not ( = ?auto_95960 ?auto_95961 ) ) ( not ( = ?auto_95960 ?auto_95962 ) ) ( not ( = ?auto_95960 ?auto_95963 ) ) ( not ( = ?auto_95960 ?auto_95964 ) ) ( not ( = ?auto_95960 ?auto_95965 ) ) ( not ( = ?auto_95960 ?auto_95966 ) ) ( not ( = ?auto_95961 ?auto_95962 ) ) ( not ( = ?auto_95961 ?auto_95963 ) ) ( not ( = ?auto_95961 ?auto_95964 ) ) ( not ( = ?auto_95961 ?auto_95965 ) ) ( not ( = ?auto_95961 ?auto_95966 ) ) ( not ( = ?auto_95962 ?auto_95963 ) ) ( not ( = ?auto_95962 ?auto_95964 ) ) ( not ( = ?auto_95962 ?auto_95965 ) ) ( not ( = ?auto_95962 ?auto_95966 ) ) ( not ( = ?auto_95963 ?auto_95964 ) ) ( not ( = ?auto_95963 ?auto_95965 ) ) ( not ( = ?auto_95963 ?auto_95966 ) ) ( not ( = ?auto_95964 ?auto_95965 ) ) ( not ( = ?auto_95964 ?auto_95966 ) ) ( not ( = ?auto_95965 ?auto_95966 ) ) ( ON ?auto_95964 ?auto_95965 ) ( ON ?auto_95963 ?auto_95964 ) ( ON ?auto_95962 ?auto_95963 ) ( ON ?auto_95961 ?auto_95962 ) ( ON ?auto_95960 ?auto_95961 ) ( CLEAR ?auto_95958 ) ( ON ?auto_95959 ?auto_95960 ) ( CLEAR ?auto_95959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95958 ?auto_95959 )
      ( MAKE-8PILE ?auto_95958 ?auto_95959 ?auto_95960 ?auto_95961 ?auto_95962 ?auto_95963 ?auto_95964 ?auto_95965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95975 - BLOCK
      ?auto_95976 - BLOCK
      ?auto_95977 - BLOCK
      ?auto_95978 - BLOCK
      ?auto_95979 - BLOCK
      ?auto_95980 - BLOCK
      ?auto_95981 - BLOCK
      ?auto_95982 - BLOCK
    )
    :vars
    (
      ?auto_95983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95982 ?auto_95983 ) ( not ( = ?auto_95975 ?auto_95976 ) ) ( not ( = ?auto_95975 ?auto_95977 ) ) ( not ( = ?auto_95975 ?auto_95978 ) ) ( not ( = ?auto_95975 ?auto_95979 ) ) ( not ( = ?auto_95975 ?auto_95980 ) ) ( not ( = ?auto_95975 ?auto_95981 ) ) ( not ( = ?auto_95975 ?auto_95982 ) ) ( not ( = ?auto_95975 ?auto_95983 ) ) ( not ( = ?auto_95976 ?auto_95977 ) ) ( not ( = ?auto_95976 ?auto_95978 ) ) ( not ( = ?auto_95976 ?auto_95979 ) ) ( not ( = ?auto_95976 ?auto_95980 ) ) ( not ( = ?auto_95976 ?auto_95981 ) ) ( not ( = ?auto_95976 ?auto_95982 ) ) ( not ( = ?auto_95976 ?auto_95983 ) ) ( not ( = ?auto_95977 ?auto_95978 ) ) ( not ( = ?auto_95977 ?auto_95979 ) ) ( not ( = ?auto_95977 ?auto_95980 ) ) ( not ( = ?auto_95977 ?auto_95981 ) ) ( not ( = ?auto_95977 ?auto_95982 ) ) ( not ( = ?auto_95977 ?auto_95983 ) ) ( not ( = ?auto_95978 ?auto_95979 ) ) ( not ( = ?auto_95978 ?auto_95980 ) ) ( not ( = ?auto_95978 ?auto_95981 ) ) ( not ( = ?auto_95978 ?auto_95982 ) ) ( not ( = ?auto_95978 ?auto_95983 ) ) ( not ( = ?auto_95979 ?auto_95980 ) ) ( not ( = ?auto_95979 ?auto_95981 ) ) ( not ( = ?auto_95979 ?auto_95982 ) ) ( not ( = ?auto_95979 ?auto_95983 ) ) ( not ( = ?auto_95980 ?auto_95981 ) ) ( not ( = ?auto_95980 ?auto_95982 ) ) ( not ( = ?auto_95980 ?auto_95983 ) ) ( not ( = ?auto_95981 ?auto_95982 ) ) ( not ( = ?auto_95981 ?auto_95983 ) ) ( not ( = ?auto_95982 ?auto_95983 ) ) ( ON ?auto_95981 ?auto_95982 ) ( ON ?auto_95980 ?auto_95981 ) ( ON ?auto_95979 ?auto_95980 ) ( ON ?auto_95978 ?auto_95979 ) ( ON ?auto_95977 ?auto_95978 ) ( ON ?auto_95976 ?auto_95977 ) ( ON ?auto_95975 ?auto_95976 ) ( CLEAR ?auto_95975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95975 )
      ( MAKE-8PILE ?auto_95975 ?auto_95976 ?auto_95977 ?auto_95978 ?auto_95979 ?auto_95980 ?auto_95981 ?auto_95982 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_95992 - BLOCK
      ?auto_95993 - BLOCK
      ?auto_95994 - BLOCK
      ?auto_95995 - BLOCK
      ?auto_95996 - BLOCK
      ?auto_95997 - BLOCK
      ?auto_95998 - BLOCK
      ?auto_95999 - BLOCK
    )
    :vars
    (
      ?auto_96000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95999 ?auto_96000 ) ( not ( = ?auto_95992 ?auto_95993 ) ) ( not ( = ?auto_95992 ?auto_95994 ) ) ( not ( = ?auto_95992 ?auto_95995 ) ) ( not ( = ?auto_95992 ?auto_95996 ) ) ( not ( = ?auto_95992 ?auto_95997 ) ) ( not ( = ?auto_95992 ?auto_95998 ) ) ( not ( = ?auto_95992 ?auto_95999 ) ) ( not ( = ?auto_95992 ?auto_96000 ) ) ( not ( = ?auto_95993 ?auto_95994 ) ) ( not ( = ?auto_95993 ?auto_95995 ) ) ( not ( = ?auto_95993 ?auto_95996 ) ) ( not ( = ?auto_95993 ?auto_95997 ) ) ( not ( = ?auto_95993 ?auto_95998 ) ) ( not ( = ?auto_95993 ?auto_95999 ) ) ( not ( = ?auto_95993 ?auto_96000 ) ) ( not ( = ?auto_95994 ?auto_95995 ) ) ( not ( = ?auto_95994 ?auto_95996 ) ) ( not ( = ?auto_95994 ?auto_95997 ) ) ( not ( = ?auto_95994 ?auto_95998 ) ) ( not ( = ?auto_95994 ?auto_95999 ) ) ( not ( = ?auto_95994 ?auto_96000 ) ) ( not ( = ?auto_95995 ?auto_95996 ) ) ( not ( = ?auto_95995 ?auto_95997 ) ) ( not ( = ?auto_95995 ?auto_95998 ) ) ( not ( = ?auto_95995 ?auto_95999 ) ) ( not ( = ?auto_95995 ?auto_96000 ) ) ( not ( = ?auto_95996 ?auto_95997 ) ) ( not ( = ?auto_95996 ?auto_95998 ) ) ( not ( = ?auto_95996 ?auto_95999 ) ) ( not ( = ?auto_95996 ?auto_96000 ) ) ( not ( = ?auto_95997 ?auto_95998 ) ) ( not ( = ?auto_95997 ?auto_95999 ) ) ( not ( = ?auto_95997 ?auto_96000 ) ) ( not ( = ?auto_95998 ?auto_95999 ) ) ( not ( = ?auto_95998 ?auto_96000 ) ) ( not ( = ?auto_95999 ?auto_96000 ) ) ( ON ?auto_95998 ?auto_95999 ) ( ON ?auto_95997 ?auto_95998 ) ( ON ?auto_95996 ?auto_95997 ) ( ON ?auto_95995 ?auto_95996 ) ( ON ?auto_95994 ?auto_95995 ) ( ON ?auto_95993 ?auto_95994 ) ( ON ?auto_95992 ?auto_95993 ) ( CLEAR ?auto_95992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95992 )
      ( MAKE-8PILE ?auto_95992 ?auto_95993 ?auto_95994 ?auto_95995 ?auto_95996 ?auto_95997 ?auto_95998 ?auto_95999 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96010 - BLOCK
      ?auto_96011 - BLOCK
      ?auto_96012 - BLOCK
      ?auto_96013 - BLOCK
      ?auto_96014 - BLOCK
      ?auto_96015 - BLOCK
      ?auto_96016 - BLOCK
      ?auto_96017 - BLOCK
      ?auto_96018 - BLOCK
    )
    :vars
    (
      ?auto_96019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96017 ) ( ON ?auto_96018 ?auto_96019 ) ( CLEAR ?auto_96018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96010 ) ( ON ?auto_96011 ?auto_96010 ) ( ON ?auto_96012 ?auto_96011 ) ( ON ?auto_96013 ?auto_96012 ) ( ON ?auto_96014 ?auto_96013 ) ( ON ?auto_96015 ?auto_96014 ) ( ON ?auto_96016 ?auto_96015 ) ( ON ?auto_96017 ?auto_96016 ) ( not ( = ?auto_96010 ?auto_96011 ) ) ( not ( = ?auto_96010 ?auto_96012 ) ) ( not ( = ?auto_96010 ?auto_96013 ) ) ( not ( = ?auto_96010 ?auto_96014 ) ) ( not ( = ?auto_96010 ?auto_96015 ) ) ( not ( = ?auto_96010 ?auto_96016 ) ) ( not ( = ?auto_96010 ?auto_96017 ) ) ( not ( = ?auto_96010 ?auto_96018 ) ) ( not ( = ?auto_96010 ?auto_96019 ) ) ( not ( = ?auto_96011 ?auto_96012 ) ) ( not ( = ?auto_96011 ?auto_96013 ) ) ( not ( = ?auto_96011 ?auto_96014 ) ) ( not ( = ?auto_96011 ?auto_96015 ) ) ( not ( = ?auto_96011 ?auto_96016 ) ) ( not ( = ?auto_96011 ?auto_96017 ) ) ( not ( = ?auto_96011 ?auto_96018 ) ) ( not ( = ?auto_96011 ?auto_96019 ) ) ( not ( = ?auto_96012 ?auto_96013 ) ) ( not ( = ?auto_96012 ?auto_96014 ) ) ( not ( = ?auto_96012 ?auto_96015 ) ) ( not ( = ?auto_96012 ?auto_96016 ) ) ( not ( = ?auto_96012 ?auto_96017 ) ) ( not ( = ?auto_96012 ?auto_96018 ) ) ( not ( = ?auto_96012 ?auto_96019 ) ) ( not ( = ?auto_96013 ?auto_96014 ) ) ( not ( = ?auto_96013 ?auto_96015 ) ) ( not ( = ?auto_96013 ?auto_96016 ) ) ( not ( = ?auto_96013 ?auto_96017 ) ) ( not ( = ?auto_96013 ?auto_96018 ) ) ( not ( = ?auto_96013 ?auto_96019 ) ) ( not ( = ?auto_96014 ?auto_96015 ) ) ( not ( = ?auto_96014 ?auto_96016 ) ) ( not ( = ?auto_96014 ?auto_96017 ) ) ( not ( = ?auto_96014 ?auto_96018 ) ) ( not ( = ?auto_96014 ?auto_96019 ) ) ( not ( = ?auto_96015 ?auto_96016 ) ) ( not ( = ?auto_96015 ?auto_96017 ) ) ( not ( = ?auto_96015 ?auto_96018 ) ) ( not ( = ?auto_96015 ?auto_96019 ) ) ( not ( = ?auto_96016 ?auto_96017 ) ) ( not ( = ?auto_96016 ?auto_96018 ) ) ( not ( = ?auto_96016 ?auto_96019 ) ) ( not ( = ?auto_96017 ?auto_96018 ) ) ( not ( = ?auto_96017 ?auto_96019 ) ) ( not ( = ?auto_96018 ?auto_96019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96018 ?auto_96019 )
      ( !STACK ?auto_96018 ?auto_96017 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96029 - BLOCK
      ?auto_96030 - BLOCK
      ?auto_96031 - BLOCK
      ?auto_96032 - BLOCK
      ?auto_96033 - BLOCK
      ?auto_96034 - BLOCK
      ?auto_96035 - BLOCK
      ?auto_96036 - BLOCK
      ?auto_96037 - BLOCK
    )
    :vars
    (
      ?auto_96038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96036 ) ( ON ?auto_96037 ?auto_96038 ) ( CLEAR ?auto_96037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96029 ) ( ON ?auto_96030 ?auto_96029 ) ( ON ?auto_96031 ?auto_96030 ) ( ON ?auto_96032 ?auto_96031 ) ( ON ?auto_96033 ?auto_96032 ) ( ON ?auto_96034 ?auto_96033 ) ( ON ?auto_96035 ?auto_96034 ) ( ON ?auto_96036 ?auto_96035 ) ( not ( = ?auto_96029 ?auto_96030 ) ) ( not ( = ?auto_96029 ?auto_96031 ) ) ( not ( = ?auto_96029 ?auto_96032 ) ) ( not ( = ?auto_96029 ?auto_96033 ) ) ( not ( = ?auto_96029 ?auto_96034 ) ) ( not ( = ?auto_96029 ?auto_96035 ) ) ( not ( = ?auto_96029 ?auto_96036 ) ) ( not ( = ?auto_96029 ?auto_96037 ) ) ( not ( = ?auto_96029 ?auto_96038 ) ) ( not ( = ?auto_96030 ?auto_96031 ) ) ( not ( = ?auto_96030 ?auto_96032 ) ) ( not ( = ?auto_96030 ?auto_96033 ) ) ( not ( = ?auto_96030 ?auto_96034 ) ) ( not ( = ?auto_96030 ?auto_96035 ) ) ( not ( = ?auto_96030 ?auto_96036 ) ) ( not ( = ?auto_96030 ?auto_96037 ) ) ( not ( = ?auto_96030 ?auto_96038 ) ) ( not ( = ?auto_96031 ?auto_96032 ) ) ( not ( = ?auto_96031 ?auto_96033 ) ) ( not ( = ?auto_96031 ?auto_96034 ) ) ( not ( = ?auto_96031 ?auto_96035 ) ) ( not ( = ?auto_96031 ?auto_96036 ) ) ( not ( = ?auto_96031 ?auto_96037 ) ) ( not ( = ?auto_96031 ?auto_96038 ) ) ( not ( = ?auto_96032 ?auto_96033 ) ) ( not ( = ?auto_96032 ?auto_96034 ) ) ( not ( = ?auto_96032 ?auto_96035 ) ) ( not ( = ?auto_96032 ?auto_96036 ) ) ( not ( = ?auto_96032 ?auto_96037 ) ) ( not ( = ?auto_96032 ?auto_96038 ) ) ( not ( = ?auto_96033 ?auto_96034 ) ) ( not ( = ?auto_96033 ?auto_96035 ) ) ( not ( = ?auto_96033 ?auto_96036 ) ) ( not ( = ?auto_96033 ?auto_96037 ) ) ( not ( = ?auto_96033 ?auto_96038 ) ) ( not ( = ?auto_96034 ?auto_96035 ) ) ( not ( = ?auto_96034 ?auto_96036 ) ) ( not ( = ?auto_96034 ?auto_96037 ) ) ( not ( = ?auto_96034 ?auto_96038 ) ) ( not ( = ?auto_96035 ?auto_96036 ) ) ( not ( = ?auto_96035 ?auto_96037 ) ) ( not ( = ?auto_96035 ?auto_96038 ) ) ( not ( = ?auto_96036 ?auto_96037 ) ) ( not ( = ?auto_96036 ?auto_96038 ) ) ( not ( = ?auto_96037 ?auto_96038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96037 ?auto_96038 )
      ( !STACK ?auto_96037 ?auto_96036 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96048 - BLOCK
      ?auto_96049 - BLOCK
      ?auto_96050 - BLOCK
      ?auto_96051 - BLOCK
      ?auto_96052 - BLOCK
      ?auto_96053 - BLOCK
      ?auto_96054 - BLOCK
      ?auto_96055 - BLOCK
      ?auto_96056 - BLOCK
    )
    :vars
    (
      ?auto_96057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96056 ?auto_96057 ) ( ON-TABLE ?auto_96048 ) ( ON ?auto_96049 ?auto_96048 ) ( ON ?auto_96050 ?auto_96049 ) ( ON ?auto_96051 ?auto_96050 ) ( ON ?auto_96052 ?auto_96051 ) ( ON ?auto_96053 ?auto_96052 ) ( ON ?auto_96054 ?auto_96053 ) ( not ( = ?auto_96048 ?auto_96049 ) ) ( not ( = ?auto_96048 ?auto_96050 ) ) ( not ( = ?auto_96048 ?auto_96051 ) ) ( not ( = ?auto_96048 ?auto_96052 ) ) ( not ( = ?auto_96048 ?auto_96053 ) ) ( not ( = ?auto_96048 ?auto_96054 ) ) ( not ( = ?auto_96048 ?auto_96055 ) ) ( not ( = ?auto_96048 ?auto_96056 ) ) ( not ( = ?auto_96048 ?auto_96057 ) ) ( not ( = ?auto_96049 ?auto_96050 ) ) ( not ( = ?auto_96049 ?auto_96051 ) ) ( not ( = ?auto_96049 ?auto_96052 ) ) ( not ( = ?auto_96049 ?auto_96053 ) ) ( not ( = ?auto_96049 ?auto_96054 ) ) ( not ( = ?auto_96049 ?auto_96055 ) ) ( not ( = ?auto_96049 ?auto_96056 ) ) ( not ( = ?auto_96049 ?auto_96057 ) ) ( not ( = ?auto_96050 ?auto_96051 ) ) ( not ( = ?auto_96050 ?auto_96052 ) ) ( not ( = ?auto_96050 ?auto_96053 ) ) ( not ( = ?auto_96050 ?auto_96054 ) ) ( not ( = ?auto_96050 ?auto_96055 ) ) ( not ( = ?auto_96050 ?auto_96056 ) ) ( not ( = ?auto_96050 ?auto_96057 ) ) ( not ( = ?auto_96051 ?auto_96052 ) ) ( not ( = ?auto_96051 ?auto_96053 ) ) ( not ( = ?auto_96051 ?auto_96054 ) ) ( not ( = ?auto_96051 ?auto_96055 ) ) ( not ( = ?auto_96051 ?auto_96056 ) ) ( not ( = ?auto_96051 ?auto_96057 ) ) ( not ( = ?auto_96052 ?auto_96053 ) ) ( not ( = ?auto_96052 ?auto_96054 ) ) ( not ( = ?auto_96052 ?auto_96055 ) ) ( not ( = ?auto_96052 ?auto_96056 ) ) ( not ( = ?auto_96052 ?auto_96057 ) ) ( not ( = ?auto_96053 ?auto_96054 ) ) ( not ( = ?auto_96053 ?auto_96055 ) ) ( not ( = ?auto_96053 ?auto_96056 ) ) ( not ( = ?auto_96053 ?auto_96057 ) ) ( not ( = ?auto_96054 ?auto_96055 ) ) ( not ( = ?auto_96054 ?auto_96056 ) ) ( not ( = ?auto_96054 ?auto_96057 ) ) ( not ( = ?auto_96055 ?auto_96056 ) ) ( not ( = ?auto_96055 ?auto_96057 ) ) ( not ( = ?auto_96056 ?auto_96057 ) ) ( CLEAR ?auto_96054 ) ( ON ?auto_96055 ?auto_96056 ) ( CLEAR ?auto_96055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_96048 ?auto_96049 ?auto_96050 ?auto_96051 ?auto_96052 ?auto_96053 ?auto_96054 ?auto_96055 )
      ( MAKE-9PILE ?auto_96048 ?auto_96049 ?auto_96050 ?auto_96051 ?auto_96052 ?auto_96053 ?auto_96054 ?auto_96055 ?auto_96056 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96067 - BLOCK
      ?auto_96068 - BLOCK
      ?auto_96069 - BLOCK
      ?auto_96070 - BLOCK
      ?auto_96071 - BLOCK
      ?auto_96072 - BLOCK
      ?auto_96073 - BLOCK
      ?auto_96074 - BLOCK
      ?auto_96075 - BLOCK
    )
    :vars
    (
      ?auto_96076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96075 ?auto_96076 ) ( ON-TABLE ?auto_96067 ) ( ON ?auto_96068 ?auto_96067 ) ( ON ?auto_96069 ?auto_96068 ) ( ON ?auto_96070 ?auto_96069 ) ( ON ?auto_96071 ?auto_96070 ) ( ON ?auto_96072 ?auto_96071 ) ( ON ?auto_96073 ?auto_96072 ) ( not ( = ?auto_96067 ?auto_96068 ) ) ( not ( = ?auto_96067 ?auto_96069 ) ) ( not ( = ?auto_96067 ?auto_96070 ) ) ( not ( = ?auto_96067 ?auto_96071 ) ) ( not ( = ?auto_96067 ?auto_96072 ) ) ( not ( = ?auto_96067 ?auto_96073 ) ) ( not ( = ?auto_96067 ?auto_96074 ) ) ( not ( = ?auto_96067 ?auto_96075 ) ) ( not ( = ?auto_96067 ?auto_96076 ) ) ( not ( = ?auto_96068 ?auto_96069 ) ) ( not ( = ?auto_96068 ?auto_96070 ) ) ( not ( = ?auto_96068 ?auto_96071 ) ) ( not ( = ?auto_96068 ?auto_96072 ) ) ( not ( = ?auto_96068 ?auto_96073 ) ) ( not ( = ?auto_96068 ?auto_96074 ) ) ( not ( = ?auto_96068 ?auto_96075 ) ) ( not ( = ?auto_96068 ?auto_96076 ) ) ( not ( = ?auto_96069 ?auto_96070 ) ) ( not ( = ?auto_96069 ?auto_96071 ) ) ( not ( = ?auto_96069 ?auto_96072 ) ) ( not ( = ?auto_96069 ?auto_96073 ) ) ( not ( = ?auto_96069 ?auto_96074 ) ) ( not ( = ?auto_96069 ?auto_96075 ) ) ( not ( = ?auto_96069 ?auto_96076 ) ) ( not ( = ?auto_96070 ?auto_96071 ) ) ( not ( = ?auto_96070 ?auto_96072 ) ) ( not ( = ?auto_96070 ?auto_96073 ) ) ( not ( = ?auto_96070 ?auto_96074 ) ) ( not ( = ?auto_96070 ?auto_96075 ) ) ( not ( = ?auto_96070 ?auto_96076 ) ) ( not ( = ?auto_96071 ?auto_96072 ) ) ( not ( = ?auto_96071 ?auto_96073 ) ) ( not ( = ?auto_96071 ?auto_96074 ) ) ( not ( = ?auto_96071 ?auto_96075 ) ) ( not ( = ?auto_96071 ?auto_96076 ) ) ( not ( = ?auto_96072 ?auto_96073 ) ) ( not ( = ?auto_96072 ?auto_96074 ) ) ( not ( = ?auto_96072 ?auto_96075 ) ) ( not ( = ?auto_96072 ?auto_96076 ) ) ( not ( = ?auto_96073 ?auto_96074 ) ) ( not ( = ?auto_96073 ?auto_96075 ) ) ( not ( = ?auto_96073 ?auto_96076 ) ) ( not ( = ?auto_96074 ?auto_96075 ) ) ( not ( = ?auto_96074 ?auto_96076 ) ) ( not ( = ?auto_96075 ?auto_96076 ) ) ( CLEAR ?auto_96073 ) ( ON ?auto_96074 ?auto_96075 ) ( CLEAR ?auto_96074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_96067 ?auto_96068 ?auto_96069 ?auto_96070 ?auto_96071 ?auto_96072 ?auto_96073 ?auto_96074 )
      ( MAKE-9PILE ?auto_96067 ?auto_96068 ?auto_96069 ?auto_96070 ?auto_96071 ?auto_96072 ?auto_96073 ?auto_96074 ?auto_96075 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96086 - BLOCK
      ?auto_96087 - BLOCK
      ?auto_96088 - BLOCK
      ?auto_96089 - BLOCK
      ?auto_96090 - BLOCK
      ?auto_96091 - BLOCK
      ?auto_96092 - BLOCK
      ?auto_96093 - BLOCK
      ?auto_96094 - BLOCK
    )
    :vars
    (
      ?auto_96095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96094 ?auto_96095 ) ( ON-TABLE ?auto_96086 ) ( ON ?auto_96087 ?auto_96086 ) ( ON ?auto_96088 ?auto_96087 ) ( ON ?auto_96089 ?auto_96088 ) ( ON ?auto_96090 ?auto_96089 ) ( ON ?auto_96091 ?auto_96090 ) ( not ( = ?auto_96086 ?auto_96087 ) ) ( not ( = ?auto_96086 ?auto_96088 ) ) ( not ( = ?auto_96086 ?auto_96089 ) ) ( not ( = ?auto_96086 ?auto_96090 ) ) ( not ( = ?auto_96086 ?auto_96091 ) ) ( not ( = ?auto_96086 ?auto_96092 ) ) ( not ( = ?auto_96086 ?auto_96093 ) ) ( not ( = ?auto_96086 ?auto_96094 ) ) ( not ( = ?auto_96086 ?auto_96095 ) ) ( not ( = ?auto_96087 ?auto_96088 ) ) ( not ( = ?auto_96087 ?auto_96089 ) ) ( not ( = ?auto_96087 ?auto_96090 ) ) ( not ( = ?auto_96087 ?auto_96091 ) ) ( not ( = ?auto_96087 ?auto_96092 ) ) ( not ( = ?auto_96087 ?auto_96093 ) ) ( not ( = ?auto_96087 ?auto_96094 ) ) ( not ( = ?auto_96087 ?auto_96095 ) ) ( not ( = ?auto_96088 ?auto_96089 ) ) ( not ( = ?auto_96088 ?auto_96090 ) ) ( not ( = ?auto_96088 ?auto_96091 ) ) ( not ( = ?auto_96088 ?auto_96092 ) ) ( not ( = ?auto_96088 ?auto_96093 ) ) ( not ( = ?auto_96088 ?auto_96094 ) ) ( not ( = ?auto_96088 ?auto_96095 ) ) ( not ( = ?auto_96089 ?auto_96090 ) ) ( not ( = ?auto_96089 ?auto_96091 ) ) ( not ( = ?auto_96089 ?auto_96092 ) ) ( not ( = ?auto_96089 ?auto_96093 ) ) ( not ( = ?auto_96089 ?auto_96094 ) ) ( not ( = ?auto_96089 ?auto_96095 ) ) ( not ( = ?auto_96090 ?auto_96091 ) ) ( not ( = ?auto_96090 ?auto_96092 ) ) ( not ( = ?auto_96090 ?auto_96093 ) ) ( not ( = ?auto_96090 ?auto_96094 ) ) ( not ( = ?auto_96090 ?auto_96095 ) ) ( not ( = ?auto_96091 ?auto_96092 ) ) ( not ( = ?auto_96091 ?auto_96093 ) ) ( not ( = ?auto_96091 ?auto_96094 ) ) ( not ( = ?auto_96091 ?auto_96095 ) ) ( not ( = ?auto_96092 ?auto_96093 ) ) ( not ( = ?auto_96092 ?auto_96094 ) ) ( not ( = ?auto_96092 ?auto_96095 ) ) ( not ( = ?auto_96093 ?auto_96094 ) ) ( not ( = ?auto_96093 ?auto_96095 ) ) ( not ( = ?auto_96094 ?auto_96095 ) ) ( ON ?auto_96093 ?auto_96094 ) ( CLEAR ?auto_96091 ) ( ON ?auto_96092 ?auto_96093 ) ( CLEAR ?auto_96092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96086 ?auto_96087 ?auto_96088 ?auto_96089 ?auto_96090 ?auto_96091 ?auto_96092 )
      ( MAKE-9PILE ?auto_96086 ?auto_96087 ?auto_96088 ?auto_96089 ?auto_96090 ?auto_96091 ?auto_96092 ?auto_96093 ?auto_96094 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96105 - BLOCK
      ?auto_96106 - BLOCK
      ?auto_96107 - BLOCK
      ?auto_96108 - BLOCK
      ?auto_96109 - BLOCK
      ?auto_96110 - BLOCK
      ?auto_96111 - BLOCK
      ?auto_96112 - BLOCK
      ?auto_96113 - BLOCK
    )
    :vars
    (
      ?auto_96114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96113 ?auto_96114 ) ( ON-TABLE ?auto_96105 ) ( ON ?auto_96106 ?auto_96105 ) ( ON ?auto_96107 ?auto_96106 ) ( ON ?auto_96108 ?auto_96107 ) ( ON ?auto_96109 ?auto_96108 ) ( ON ?auto_96110 ?auto_96109 ) ( not ( = ?auto_96105 ?auto_96106 ) ) ( not ( = ?auto_96105 ?auto_96107 ) ) ( not ( = ?auto_96105 ?auto_96108 ) ) ( not ( = ?auto_96105 ?auto_96109 ) ) ( not ( = ?auto_96105 ?auto_96110 ) ) ( not ( = ?auto_96105 ?auto_96111 ) ) ( not ( = ?auto_96105 ?auto_96112 ) ) ( not ( = ?auto_96105 ?auto_96113 ) ) ( not ( = ?auto_96105 ?auto_96114 ) ) ( not ( = ?auto_96106 ?auto_96107 ) ) ( not ( = ?auto_96106 ?auto_96108 ) ) ( not ( = ?auto_96106 ?auto_96109 ) ) ( not ( = ?auto_96106 ?auto_96110 ) ) ( not ( = ?auto_96106 ?auto_96111 ) ) ( not ( = ?auto_96106 ?auto_96112 ) ) ( not ( = ?auto_96106 ?auto_96113 ) ) ( not ( = ?auto_96106 ?auto_96114 ) ) ( not ( = ?auto_96107 ?auto_96108 ) ) ( not ( = ?auto_96107 ?auto_96109 ) ) ( not ( = ?auto_96107 ?auto_96110 ) ) ( not ( = ?auto_96107 ?auto_96111 ) ) ( not ( = ?auto_96107 ?auto_96112 ) ) ( not ( = ?auto_96107 ?auto_96113 ) ) ( not ( = ?auto_96107 ?auto_96114 ) ) ( not ( = ?auto_96108 ?auto_96109 ) ) ( not ( = ?auto_96108 ?auto_96110 ) ) ( not ( = ?auto_96108 ?auto_96111 ) ) ( not ( = ?auto_96108 ?auto_96112 ) ) ( not ( = ?auto_96108 ?auto_96113 ) ) ( not ( = ?auto_96108 ?auto_96114 ) ) ( not ( = ?auto_96109 ?auto_96110 ) ) ( not ( = ?auto_96109 ?auto_96111 ) ) ( not ( = ?auto_96109 ?auto_96112 ) ) ( not ( = ?auto_96109 ?auto_96113 ) ) ( not ( = ?auto_96109 ?auto_96114 ) ) ( not ( = ?auto_96110 ?auto_96111 ) ) ( not ( = ?auto_96110 ?auto_96112 ) ) ( not ( = ?auto_96110 ?auto_96113 ) ) ( not ( = ?auto_96110 ?auto_96114 ) ) ( not ( = ?auto_96111 ?auto_96112 ) ) ( not ( = ?auto_96111 ?auto_96113 ) ) ( not ( = ?auto_96111 ?auto_96114 ) ) ( not ( = ?auto_96112 ?auto_96113 ) ) ( not ( = ?auto_96112 ?auto_96114 ) ) ( not ( = ?auto_96113 ?auto_96114 ) ) ( ON ?auto_96112 ?auto_96113 ) ( CLEAR ?auto_96110 ) ( ON ?auto_96111 ?auto_96112 ) ( CLEAR ?auto_96111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96105 ?auto_96106 ?auto_96107 ?auto_96108 ?auto_96109 ?auto_96110 ?auto_96111 )
      ( MAKE-9PILE ?auto_96105 ?auto_96106 ?auto_96107 ?auto_96108 ?auto_96109 ?auto_96110 ?auto_96111 ?auto_96112 ?auto_96113 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96124 - BLOCK
      ?auto_96125 - BLOCK
      ?auto_96126 - BLOCK
      ?auto_96127 - BLOCK
      ?auto_96128 - BLOCK
      ?auto_96129 - BLOCK
      ?auto_96130 - BLOCK
      ?auto_96131 - BLOCK
      ?auto_96132 - BLOCK
    )
    :vars
    (
      ?auto_96133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96132 ?auto_96133 ) ( ON-TABLE ?auto_96124 ) ( ON ?auto_96125 ?auto_96124 ) ( ON ?auto_96126 ?auto_96125 ) ( ON ?auto_96127 ?auto_96126 ) ( ON ?auto_96128 ?auto_96127 ) ( not ( = ?auto_96124 ?auto_96125 ) ) ( not ( = ?auto_96124 ?auto_96126 ) ) ( not ( = ?auto_96124 ?auto_96127 ) ) ( not ( = ?auto_96124 ?auto_96128 ) ) ( not ( = ?auto_96124 ?auto_96129 ) ) ( not ( = ?auto_96124 ?auto_96130 ) ) ( not ( = ?auto_96124 ?auto_96131 ) ) ( not ( = ?auto_96124 ?auto_96132 ) ) ( not ( = ?auto_96124 ?auto_96133 ) ) ( not ( = ?auto_96125 ?auto_96126 ) ) ( not ( = ?auto_96125 ?auto_96127 ) ) ( not ( = ?auto_96125 ?auto_96128 ) ) ( not ( = ?auto_96125 ?auto_96129 ) ) ( not ( = ?auto_96125 ?auto_96130 ) ) ( not ( = ?auto_96125 ?auto_96131 ) ) ( not ( = ?auto_96125 ?auto_96132 ) ) ( not ( = ?auto_96125 ?auto_96133 ) ) ( not ( = ?auto_96126 ?auto_96127 ) ) ( not ( = ?auto_96126 ?auto_96128 ) ) ( not ( = ?auto_96126 ?auto_96129 ) ) ( not ( = ?auto_96126 ?auto_96130 ) ) ( not ( = ?auto_96126 ?auto_96131 ) ) ( not ( = ?auto_96126 ?auto_96132 ) ) ( not ( = ?auto_96126 ?auto_96133 ) ) ( not ( = ?auto_96127 ?auto_96128 ) ) ( not ( = ?auto_96127 ?auto_96129 ) ) ( not ( = ?auto_96127 ?auto_96130 ) ) ( not ( = ?auto_96127 ?auto_96131 ) ) ( not ( = ?auto_96127 ?auto_96132 ) ) ( not ( = ?auto_96127 ?auto_96133 ) ) ( not ( = ?auto_96128 ?auto_96129 ) ) ( not ( = ?auto_96128 ?auto_96130 ) ) ( not ( = ?auto_96128 ?auto_96131 ) ) ( not ( = ?auto_96128 ?auto_96132 ) ) ( not ( = ?auto_96128 ?auto_96133 ) ) ( not ( = ?auto_96129 ?auto_96130 ) ) ( not ( = ?auto_96129 ?auto_96131 ) ) ( not ( = ?auto_96129 ?auto_96132 ) ) ( not ( = ?auto_96129 ?auto_96133 ) ) ( not ( = ?auto_96130 ?auto_96131 ) ) ( not ( = ?auto_96130 ?auto_96132 ) ) ( not ( = ?auto_96130 ?auto_96133 ) ) ( not ( = ?auto_96131 ?auto_96132 ) ) ( not ( = ?auto_96131 ?auto_96133 ) ) ( not ( = ?auto_96132 ?auto_96133 ) ) ( ON ?auto_96131 ?auto_96132 ) ( ON ?auto_96130 ?auto_96131 ) ( CLEAR ?auto_96128 ) ( ON ?auto_96129 ?auto_96130 ) ( CLEAR ?auto_96129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96124 ?auto_96125 ?auto_96126 ?auto_96127 ?auto_96128 ?auto_96129 )
      ( MAKE-9PILE ?auto_96124 ?auto_96125 ?auto_96126 ?auto_96127 ?auto_96128 ?auto_96129 ?auto_96130 ?auto_96131 ?auto_96132 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96143 - BLOCK
      ?auto_96144 - BLOCK
      ?auto_96145 - BLOCK
      ?auto_96146 - BLOCK
      ?auto_96147 - BLOCK
      ?auto_96148 - BLOCK
      ?auto_96149 - BLOCK
      ?auto_96150 - BLOCK
      ?auto_96151 - BLOCK
    )
    :vars
    (
      ?auto_96152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96151 ?auto_96152 ) ( ON-TABLE ?auto_96143 ) ( ON ?auto_96144 ?auto_96143 ) ( ON ?auto_96145 ?auto_96144 ) ( ON ?auto_96146 ?auto_96145 ) ( ON ?auto_96147 ?auto_96146 ) ( not ( = ?auto_96143 ?auto_96144 ) ) ( not ( = ?auto_96143 ?auto_96145 ) ) ( not ( = ?auto_96143 ?auto_96146 ) ) ( not ( = ?auto_96143 ?auto_96147 ) ) ( not ( = ?auto_96143 ?auto_96148 ) ) ( not ( = ?auto_96143 ?auto_96149 ) ) ( not ( = ?auto_96143 ?auto_96150 ) ) ( not ( = ?auto_96143 ?auto_96151 ) ) ( not ( = ?auto_96143 ?auto_96152 ) ) ( not ( = ?auto_96144 ?auto_96145 ) ) ( not ( = ?auto_96144 ?auto_96146 ) ) ( not ( = ?auto_96144 ?auto_96147 ) ) ( not ( = ?auto_96144 ?auto_96148 ) ) ( not ( = ?auto_96144 ?auto_96149 ) ) ( not ( = ?auto_96144 ?auto_96150 ) ) ( not ( = ?auto_96144 ?auto_96151 ) ) ( not ( = ?auto_96144 ?auto_96152 ) ) ( not ( = ?auto_96145 ?auto_96146 ) ) ( not ( = ?auto_96145 ?auto_96147 ) ) ( not ( = ?auto_96145 ?auto_96148 ) ) ( not ( = ?auto_96145 ?auto_96149 ) ) ( not ( = ?auto_96145 ?auto_96150 ) ) ( not ( = ?auto_96145 ?auto_96151 ) ) ( not ( = ?auto_96145 ?auto_96152 ) ) ( not ( = ?auto_96146 ?auto_96147 ) ) ( not ( = ?auto_96146 ?auto_96148 ) ) ( not ( = ?auto_96146 ?auto_96149 ) ) ( not ( = ?auto_96146 ?auto_96150 ) ) ( not ( = ?auto_96146 ?auto_96151 ) ) ( not ( = ?auto_96146 ?auto_96152 ) ) ( not ( = ?auto_96147 ?auto_96148 ) ) ( not ( = ?auto_96147 ?auto_96149 ) ) ( not ( = ?auto_96147 ?auto_96150 ) ) ( not ( = ?auto_96147 ?auto_96151 ) ) ( not ( = ?auto_96147 ?auto_96152 ) ) ( not ( = ?auto_96148 ?auto_96149 ) ) ( not ( = ?auto_96148 ?auto_96150 ) ) ( not ( = ?auto_96148 ?auto_96151 ) ) ( not ( = ?auto_96148 ?auto_96152 ) ) ( not ( = ?auto_96149 ?auto_96150 ) ) ( not ( = ?auto_96149 ?auto_96151 ) ) ( not ( = ?auto_96149 ?auto_96152 ) ) ( not ( = ?auto_96150 ?auto_96151 ) ) ( not ( = ?auto_96150 ?auto_96152 ) ) ( not ( = ?auto_96151 ?auto_96152 ) ) ( ON ?auto_96150 ?auto_96151 ) ( ON ?auto_96149 ?auto_96150 ) ( CLEAR ?auto_96147 ) ( ON ?auto_96148 ?auto_96149 ) ( CLEAR ?auto_96148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96143 ?auto_96144 ?auto_96145 ?auto_96146 ?auto_96147 ?auto_96148 )
      ( MAKE-9PILE ?auto_96143 ?auto_96144 ?auto_96145 ?auto_96146 ?auto_96147 ?auto_96148 ?auto_96149 ?auto_96150 ?auto_96151 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96162 - BLOCK
      ?auto_96163 - BLOCK
      ?auto_96164 - BLOCK
      ?auto_96165 - BLOCK
      ?auto_96166 - BLOCK
      ?auto_96167 - BLOCK
      ?auto_96168 - BLOCK
      ?auto_96169 - BLOCK
      ?auto_96170 - BLOCK
    )
    :vars
    (
      ?auto_96171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96170 ?auto_96171 ) ( ON-TABLE ?auto_96162 ) ( ON ?auto_96163 ?auto_96162 ) ( ON ?auto_96164 ?auto_96163 ) ( ON ?auto_96165 ?auto_96164 ) ( not ( = ?auto_96162 ?auto_96163 ) ) ( not ( = ?auto_96162 ?auto_96164 ) ) ( not ( = ?auto_96162 ?auto_96165 ) ) ( not ( = ?auto_96162 ?auto_96166 ) ) ( not ( = ?auto_96162 ?auto_96167 ) ) ( not ( = ?auto_96162 ?auto_96168 ) ) ( not ( = ?auto_96162 ?auto_96169 ) ) ( not ( = ?auto_96162 ?auto_96170 ) ) ( not ( = ?auto_96162 ?auto_96171 ) ) ( not ( = ?auto_96163 ?auto_96164 ) ) ( not ( = ?auto_96163 ?auto_96165 ) ) ( not ( = ?auto_96163 ?auto_96166 ) ) ( not ( = ?auto_96163 ?auto_96167 ) ) ( not ( = ?auto_96163 ?auto_96168 ) ) ( not ( = ?auto_96163 ?auto_96169 ) ) ( not ( = ?auto_96163 ?auto_96170 ) ) ( not ( = ?auto_96163 ?auto_96171 ) ) ( not ( = ?auto_96164 ?auto_96165 ) ) ( not ( = ?auto_96164 ?auto_96166 ) ) ( not ( = ?auto_96164 ?auto_96167 ) ) ( not ( = ?auto_96164 ?auto_96168 ) ) ( not ( = ?auto_96164 ?auto_96169 ) ) ( not ( = ?auto_96164 ?auto_96170 ) ) ( not ( = ?auto_96164 ?auto_96171 ) ) ( not ( = ?auto_96165 ?auto_96166 ) ) ( not ( = ?auto_96165 ?auto_96167 ) ) ( not ( = ?auto_96165 ?auto_96168 ) ) ( not ( = ?auto_96165 ?auto_96169 ) ) ( not ( = ?auto_96165 ?auto_96170 ) ) ( not ( = ?auto_96165 ?auto_96171 ) ) ( not ( = ?auto_96166 ?auto_96167 ) ) ( not ( = ?auto_96166 ?auto_96168 ) ) ( not ( = ?auto_96166 ?auto_96169 ) ) ( not ( = ?auto_96166 ?auto_96170 ) ) ( not ( = ?auto_96166 ?auto_96171 ) ) ( not ( = ?auto_96167 ?auto_96168 ) ) ( not ( = ?auto_96167 ?auto_96169 ) ) ( not ( = ?auto_96167 ?auto_96170 ) ) ( not ( = ?auto_96167 ?auto_96171 ) ) ( not ( = ?auto_96168 ?auto_96169 ) ) ( not ( = ?auto_96168 ?auto_96170 ) ) ( not ( = ?auto_96168 ?auto_96171 ) ) ( not ( = ?auto_96169 ?auto_96170 ) ) ( not ( = ?auto_96169 ?auto_96171 ) ) ( not ( = ?auto_96170 ?auto_96171 ) ) ( ON ?auto_96169 ?auto_96170 ) ( ON ?auto_96168 ?auto_96169 ) ( ON ?auto_96167 ?auto_96168 ) ( CLEAR ?auto_96165 ) ( ON ?auto_96166 ?auto_96167 ) ( CLEAR ?auto_96166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96162 ?auto_96163 ?auto_96164 ?auto_96165 ?auto_96166 )
      ( MAKE-9PILE ?auto_96162 ?auto_96163 ?auto_96164 ?auto_96165 ?auto_96166 ?auto_96167 ?auto_96168 ?auto_96169 ?auto_96170 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96181 - BLOCK
      ?auto_96182 - BLOCK
      ?auto_96183 - BLOCK
      ?auto_96184 - BLOCK
      ?auto_96185 - BLOCK
      ?auto_96186 - BLOCK
      ?auto_96187 - BLOCK
      ?auto_96188 - BLOCK
      ?auto_96189 - BLOCK
    )
    :vars
    (
      ?auto_96190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96189 ?auto_96190 ) ( ON-TABLE ?auto_96181 ) ( ON ?auto_96182 ?auto_96181 ) ( ON ?auto_96183 ?auto_96182 ) ( ON ?auto_96184 ?auto_96183 ) ( not ( = ?auto_96181 ?auto_96182 ) ) ( not ( = ?auto_96181 ?auto_96183 ) ) ( not ( = ?auto_96181 ?auto_96184 ) ) ( not ( = ?auto_96181 ?auto_96185 ) ) ( not ( = ?auto_96181 ?auto_96186 ) ) ( not ( = ?auto_96181 ?auto_96187 ) ) ( not ( = ?auto_96181 ?auto_96188 ) ) ( not ( = ?auto_96181 ?auto_96189 ) ) ( not ( = ?auto_96181 ?auto_96190 ) ) ( not ( = ?auto_96182 ?auto_96183 ) ) ( not ( = ?auto_96182 ?auto_96184 ) ) ( not ( = ?auto_96182 ?auto_96185 ) ) ( not ( = ?auto_96182 ?auto_96186 ) ) ( not ( = ?auto_96182 ?auto_96187 ) ) ( not ( = ?auto_96182 ?auto_96188 ) ) ( not ( = ?auto_96182 ?auto_96189 ) ) ( not ( = ?auto_96182 ?auto_96190 ) ) ( not ( = ?auto_96183 ?auto_96184 ) ) ( not ( = ?auto_96183 ?auto_96185 ) ) ( not ( = ?auto_96183 ?auto_96186 ) ) ( not ( = ?auto_96183 ?auto_96187 ) ) ( not ( = ?auto_96183 ?auto_96188 ) ) ( not ( = ?auto_96183 ?auto_96189 ) ) ( not ( = ?auto_96183 ?auto_96190 ) ) ( not ( = ?auto_96184 ?auto_96185 ) ) ( not ( = ?auto_96184 ?auto_96186 ) ) ( not ( = ?auto_96184 ?auto_96187 ) ) ( not ( = ?auto_96184 ?auto_96188 ) ) ( not ( = ?auto_96184 ?auto_96189 ) ) ( not ( = ?auto_96184 ?auto_96190 ) ) ( not ( = ?auto_96185 ?auto_96186 ) ) ( not ( = ?auto_96185 ?auto_96187 ) ) ( not ( = ?auto_96185 ?auto_96188 ) ) ( not ( = ?auto_96185 ?auto_96189 ) ) ( not ( = ?auto_96185 ?auto_96190 ) ) ( not ( = ?auto_96186 ?auto_96187 ) ) ( not ( = ?auto_96186 ?auto_96188 ) ) ( not ( = ?auto_96186 ?auto_96189 ) ) ( not ( = ?auto_96186 ?auto_96190 ) ) ( not ( = ?auto_96187 ?auto_96188 ) ) ( not ( = ?auto_96187 ?auto_96189 ) ) ( not ( = ?auto_96187 ?auto_96190 ) ) ( not ( = ?auto_96188 ?auto_96189 ) ) ( not ( = ?auto_96188 ?auto_96190 ) ) ( not ( = ?auto_96189 ?auto_96190 ) ) ( ON ?auto_96188 ?auto_96189 ) ( ON ?auto_96187 ?auto_96188 ) ( ON ?auto_96186 ?auto_96187 ) ( CLEAR ?auto_96184 ) ( ON ?auto_96185 ?auto_96186 ) ( CLEAR ?auto_96185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96181 ?auto_96182 ?auto_96183 ?auto_96184 ?auto_96185 )
      ( MAKE-9PILE ?auto_96181 ?auto_96182 ?auto_96183 ?auto_96184 ?auto_96185 ?auto_96186 ?auto_96187 ?auto_96188 ?auto_96189 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96200 - BLOCK
      ?auto_96201 - BLOCK
      ?auto_96202 - BLOCK
      ?auto_96203 - BLOCK
      ?auto_96204 - BLOCK
      ?auto_96205 - BLOCK
      ?auto_96206 - BLOCK
      ?auto_96207 - BLOCK
      ?auto_96208 - BLOCK
    )
    :vars
    (
      ?auto_96209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96208 ?auto_96209 ) ( ON-TABLE ?auto_96200 ) ( ON ?auto_96201 ?auto_96200 ) ( ON ?auto_96202 ?auto_96201 ) ( not ( = ?auto_96200 ?auto_96201 ) ) ( not ( = ?auto_96200 ?auto_96202 ) ) ( not ( = ?auto_96200 ?auto_96203 ) ) ( not ( = ?auto_96200 ?auto_96204 ) ) ( not ( = ?auto_96200 ?auto_96205 ) ) ( not ( = ?auto_96200 ?auto_96206 ) ) ( not ( = ?auto_96200 ?auto_96207 ) ) ( not ( = ?auto_96200 ?auto_96208 ) ) ( not ( = ?auto_96200 ?auto_96209 ) ) ( not ( = ?auto_96201 ?auto_96202 ) ) ( not ( = ?auto_96201 ?auto_96203 ) ) ( not ( = ?auto_96201 ?auto_96204 ) ) ( not ( = ?auto_96201 ?auto_96205 ) ) ( not ( = ?auto_96201 ?auto_96206 ) ) ( not ( = ?auto_96201 ?auto_96207 ) ) ( not ( = ?auto_96201 ?auto_96208 ) ) ( not ( = ?auto_96201 ?auto_96209 ) ) ( not ( = ?auto_96202 ?auto_96203 ) ) ( not ( = ?auto_96202 ?auto_96204 ) ) ( not ( = ?auto_96202 ?auto_96205 ) ) ( not ( = ?auto_96202 ?auto_96206 ) ) ( not ( = ?auto_96202 ?auto_96207 ) ) ( not ( = ?auto_96202 ?auto_96208 ) ) ( not ( = ?auto_96202 ?auto_96209 ) ) ( not ( = ?auto_96203 ?auto_96204 ) ) ( not ( = ?auto_96203 ?auto_96205 ) ) ( not ( = ?auto_96203 ?auto_96206 ) ) ( not ( = ?auto_96203 ?auto_96207 ) ) ( not ( = ?auto_96203 ?auto_96208 ) ) ( not ( = ?auto_96203 ?auto_96209 ) ) ( not ( = ?auto_96204 ?auto_96205 ) ) ( not ( = ?auto_96204 ?auto_96206 ) ) ( not ( = ?auto_96204 ?auto_96207 ) ) ( not ( = ?auto_96204 ?auto_96208 ) ) ( not ( = ?auto_96204 ?auto_96209 ) ) ( not ( = ?auto_96205 ?auto_96206 ) ) ( not ( = ?auto_96205 ?auto_96207 ) ) ( not ( = ?auto_96205 ?auto_96208 ) ) ( not ( = ?auto_96205 ?auto_96209 ) ) ( not ( = ?auto_96206 ?auto_96207 ) ) ( not ( = ?auto_96206 ?auto_96208 ) ) ( not ( = ?auto_96206 ?auto_96209 ) ) ( not ( = ?auto_96207 ?auto_96208 ) ) ( not ( = ?auto_96207 ?auto_96209 ) ) ( not ( = ?auto_96208 ?auto_96209 ) ) ( ON ?auto_96207 ?auto_96208 ) ( ON ?auto_96206 ?auto_96207 ) ( ON ?auto_96205 ?auto_96206 ) ( ON ?auto_96204 ?auto_96205 ) ( CLEAR ?auto_96202 ) ( ON ?auto_96203 ?auto_96204 ) ( CLEAR ?auto_96203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96200 ?auto_96201 ?auto_96202 ?auto_96203 )
      ( MAKE-9PILE ?auto_96200 ?auto_96201 ?auto_96202 ?auto_96203 ?auto_96204 ?auto_96205 ?auto_96206 ?auto_96207 ?auto_96208 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96219 - BLOCK
      ?auto_96220 - BLOCK
      ?auto_96221 - BLOCK
      ?auto_96222 - BLOCK
      ?auto_96223 - BLOCK
      ?auto_96224 - BLOCK
      ?auto_96225 - BLOCK
      ?auto_96226 - BLOCK
      ?auto_96227 - BLOCK
    )
    :vars
    (
      ?auto_96228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96227 ?auto_96228 ) ( ON-TABLE ?auto_96219 ) ( ON ?auto_96220 ?auto_96219 ) ( ON ?auto_96221 ?auto_96220 ) ( not ( = ?auto_96219 ?auto_96220 ) ) ( not ( = ?auto_96219 ?auto_96221 ) ) ( not ( = ?auto_96219 ?auto_96222 ) ) ( not ( = ?auto_96219 ?auto_96223 ) ) ( not ( = ?auto_96219 ?auto_96224 ) ) ( not ( = ?auto_96219 ?auto_96225 ) ) ( not ( = ?auto_96219 ?auto_96226 ) ) ( not ( = ?auto_96219 ?auto_96227 ) ) ( not ( = ?auto_96219 ?auto_96228 ) ) ( not ( = ?auto_96220 ?auto_96221 ) ) ( not ( = ?auto_96220 ?auto_96222 ) ) ( not ( = ?auto_96220 ?auto_96223 ) ) ( not ( = ?auto_96220 ?auto_96224 ) ) ( not ( = ?auto_96220 ?auto_96225 ) ) ( not ( = ?auto_96220 ?auto_96226 ) ) ( not ( = ?auto_96220 ?auto_96227 ) ) ( not ( = ?auto_96220 ?auto_96228 ) ) ( not ( = ?auto_96221 ?auto_96222 ) ) ( not ( = ?auto_96221 ?auto_96223 ) ) ( not ( = ?auto_96221 ?auto_96224 ) ) ( not ( = ?auto_96221 ?auto_96225 ) ) ( not ( = ?auto_96221 ?auto_96226 ) ) ( not ( = ?auto_96221 ?auto_96227 ) ) ( not ( = ?auto_96221 ?auto_96228 ) ) ( not ( = ?auto_96222 ?auto_96223 ) ) ( not ( = ?auto_96222 ?auto_96224 ) ) ( not ( = ?auto_96222 ?auto_96225 ) ) ( not ( = ?auto_96222 ?auto_96226 ) ) ( not ( = ?auto_96222 ?auto_96227 ) ) ( not ( = ?auto_96222 ?auto_96228 ) ) ( not ( = ?auto_96223 ?auto_96224 ) ) ( not ( = ?auto_96223 ?auto_96225 ) ) ( not ( = ?auto_96223 ?auto_96226 ) ) ( not ( = ?auto_96223 ?auto_96227 ) ) ( not ( = ?auto_96223 ?auto_96228 ) ) ( not ( = ?auto_96224 ?auto_96225 ) ) ( not ( = ?auto_96224 ?auto_96226 ) ) ( not ( = ?auto_96224 ?auto_96227 ) ) ( not ( = ?auto_96224 ?auto_96228 ) ) ( not ( = ?auto_96225 ?auto_96226 ) ) ( not ( = ?auto_96225 ?auto_96227 ) ) ( not ( = ?auto_96225 ?auto_96228 ) ) ( not ( = ?auto_96226 ?auto_96227 ) ) ( not ( = ?auto_96226 ?auto_96228 ) ) ( not ( = ?auto_96227 ?auto_96228 ) ) ( ON ?auto_96226 ?auto_96227 ) ( ON ?auto_96225 ?auto_96226 ) ( ON ?auto_96224 ?auto_96225 ) ( ON ?auto_96223 ?auto_96224 ) ( CLEAR ?auto_96221 ) ( ON ?auto_96222 ?auto_96223 ) ( CLEAR ?auto_96222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96219 ?auto_96220 ?auto_96221 ?auto_96222 )
      ( MAKE-9PILE ?auto_96219 ?auto_96220 ?auto_96221 ?auto_96222 ?auto_96223 ?auto_96224 ?auto_96225 ?auto_96226 ?auto_96227 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96238 - BLOCK
      ?auto_96239 - BLOCK
      ?auto_96240 - BLOCK
      ?auto_96241 - BLOCK
      ?auto_96242 - BLOCK
      ?auto_96243 - BLOCK
      ?auto_96244 - BLOCK
      ?auto_96245 - BLOCK
      ?auto_96246 - BLOCK
    )
    :vars
    (
      ?auto_96247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96246 ?auto_96247 ) ( ON-TABLE ?auto_96238 ) ( ON ?auto_96239 ?auto_96238 ) ( not ( = ?auto_96238 ?auto_96239 ) ) ( not ( = ?auto_96238 ?auto_96240 ) ) ( not ( = ?auto_96238 ?auto_96241 ) ) ( not ( = ?auto_96238 ?auto_96242 ) ) ( not ( = ?auto_96238 ?auto_96243 ) ) ( not ( = ?auto_96238 ?auto_96244 ) ) ( not ( = ?auto_96238 ?auto_96245 ) ) ( not ( = ?auto_96238 ?auto_96246 ) ) ( not ( = ?auto_96238 ?auto_96247 ) ) ( not ( = ?auto_96239 ?auto_96240 ) ) ( not ( = ?auto_96239 ?auto_96241 ) ) ( not ( = ?auto_96239 ?auto_96242 ) ) ( not ( = ?auto_96239 ?auto_96243 ) ) ( not ( = ?auto_96239 ?auto_96244 ) ) ( not ( = ?auto_96239 ?auto_96245 ) ) ( not ( = ?auto_96239 ?auto_96246 ) ) ( not ( = ?auto_96239 ?auto_96247 ) ) ( not ( = ?auto_96240 ?auto_96241 ) ) ( not ( = ?auto_96240 ?auto_96242 ) ) ( not ( = ?auto_96240 ?auto_96243 ) ) ( not ( = ?auto_96240 ?auto_96244 ) ) ( not ( = ?auto_96240 ?auto_96245 ) ) ( not ( = ?auto_96240 ?auto_96246 ) ) ( not ( = ?auto_96240 ?auto_96247 ) ) ( not ( = ?auto_96241 ?auto_96242 ) ) ( not ( = ?auto_96241 ?auto_96243 ) ) ( not ( = ?auto_96241 ?auto_96244 ) ) ( not ( = ?auto_96241 ?auto_96245 ) ) ( not ( = ?auto_96241 ?auto_96246 ) ) ( not ( = ?auto_96241 ?auto_96247 ) ) ( not ( = ?auto_96242 ?auto_96243 ) ) ( not ( = ?auto_96242 ?auto_96244 ) ) ( not ( = ?auto_96242 ?auto_96245 ) ) ( not ( = ?auto_96242 ?auto_96246 ) ) ( not ( = ?auto_96242 ?auto_96247 ) ) ( not ( = ?auto_96243 ?auto_96244 ) ) ( not ( = ?auto_96243 ?auto_96245 ) ) ( not ( = ?auto_96243 ?auto_96246 ) ) ( not ( = ?auto_96243 ?auto_96247 ) ) ( not ( = ?auto_96244 ?auto_96245 ) ) ( not ( = ?auto_96244 ?auto_96246 ) ) ( not ( = ?auto_96244 ?auto_96247 ) ) ( not ( = ?auto_96245 ?auto_96246 ) ) ( not ( = ?auto_96245 ?auto_96247 ) ) ( not ( = ?auto_96246 ?auto_96247 ) ) ( ON ?auto_96245 ?auto_96246 ) ( ON ?auto_96244 ?auto_96245 ) ( ON ?auto_96243 ?auto_96244 ) ( ON ?auto_96242 ?auto_96243 ) ( ON ?auto_96241 ?auto_96242 ) ( CLEAR ?auto_96239 ) ( ON ?auto_96240 ?auto_96241 ) ( CLEAR ?auto_96240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96238 ?auto_96239 ?auto_96240 )
      ( MAKE-9PILE ?auto_96238 ?auto_96239 ?auto_96240 ?auto_96241 ?auto_96242 ?auto_96243 ?auto_96244 ?auto_96245 ?auto_96246 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96257 - BLOCK
      ?auto_96258 - BLOCK
      ?auto_96259 - BLOCK
      ?auto_96260 - BLOCK
      ?auto_96261 - BLOCK
      ?auto_96262 - BLOCK
      ?auto_96263 - BLOCK
      ?auto_96264 - BLOCK
      ?auto_96265 - BLOCK
    )
    :vars
    (
      ?auto_96266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96265 ?auto_96266 ) ( ON-TABLE ?auto_96257 ) ( ON ?auto_96258 ?auto_96257 ) ( not ( = ?auto_96257 ?auto_96258 ) ) ( not ( = ?auto_96257 ?auto_96259 ) ) ( not ( = ?auto_96257 ?auto_96260 ) ) ( not ( = ?auto_96257 ?auto_96261 ) ) ( not ( = ?auto_96257 ?auto_96262 ) ) ( not ( = ?auto_96257 ?auto_96263 ) ) ( not ( = ?auto_96257 ?auto_96264 ) ) ( not ( = ?auto_96257 ?auto_96265 ) ) ( not ( = ?auto_96257 ?auto_96266 ) ) ( not ( = ?auto_96258 ?auto_96259 ) ) ( not ( = ?auto_96258 ?auto_96260 ) ) ( not ( = ?auto_96258 ?auto_96261 ) ) ( not ( = ?auto_96258 ?auto_96262 ) ) ( not ( = ?auto_96258 ?auto_96263 ) ) ( not ( = ?auto_96258 ?auto_96264 ) ) ( not ( = ?auto_96258 ?auto_96265 ) ) ( not ( = ?auto_96258 ?auto_96266 ) ) ( not ( = ?auto_96259 ?auto_96260 ) ) ( not ( = ?auto_96259 ?auto_96261 ) ) ( not ( = ?auto_96259 ?auto_96262 ) ) ( not ( = ?auto_96259 ?auto_96263 ) ) ( not ( = ?auto_96259 ?auto_96264 ) ) ( not ( = ?auto_96259 ?auto_96265 ) ) ( not ( = ?auto_96259 ?auto_96266 ) ) ( not ( = ?auto_96260 ?auto_96261 ) ) ( not ( = ?auto_96260 ?auto_96262 ) ) ( not ( = ?auto_96260 ?auto_96263 ) ) ( not ( = ?auto_96260 ?auto_96264 ) ) ( not ( = ?auto_96260 ?auto_96265 ) ) ( not ( = ?auto_96260 ?auto_96266 ) ) ( not ( = ?auto_96261 ?auto_96262 ) ) ( not ( = ?auto_96261 ?auto_96263 ) ) ( not ( = ?auto_96261 ?auto_96264 ) ) ( not ( = ?auto_96261 ?auto_96265 ) ) ( not ( = ?auto_96261 ?auto_96266 ) ) ( not ( = ?auto_96262 ?auto_96263 ) ) ( not ( = ?auto_96262 ?auto_96264 ) ) ( not ( = ?auto_96262 ?auto_96265 ) ) ( not ( = ?auto_96262 ?auto_96266 ) ) ( not ( = ?auto_96263 ?auto_96264 ) ) ( not ( = ?auto_96263 ?auto_96265 ) ) ( not ( = ?auto_96263 ?auto_96266 ) ) ( not ( = ?auto_96264 ?auto_96265 ) ) ( not ( = ?auto_96264 ?auto_96266 ) ) ( not ( = ?auto_96265 ?auto_96266 ) ) ( ON ?auto_96264 ?auto_96265 ) ( ON ?auto_96263 ?auto_96264 ) ( ON ?auto_96262 ?auto_96263 ) ( ON ?auto_96261 ?auto_96262 ) ( ON ?auto_96260 ?auto_96261 ) ( CLEAR ?auto_96258 ) ( ON ?auto_96259 ?auto_96260 ) ( CLEAR ?auto_96259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96257 ?auto_96258 ?auto_96259 )
      ( MAKE-9PILE ?auto_96257 ?auto_96258 ?auto_96259 ?auto_96260 ?auto_96261 ?auto_96262 ?auto_96263 ?auto_96264 ?auto_96265 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96276 - BLOCK
      ?auto_96277 - BLOCK
      ?auto_96278 - BLOCK
      ?auto_96279 - BLOCK
      ?auto_96280 - BLOCK
      ?auto_96281 - BLOCK
      ?auto_96282 - BLOCK
      ?auto_96283 - BLOCK
      ?auto_96284 - BLOCK
    )
    :vars
    (
      ?auto_96285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96284 ?auto_96285 ) ( ON-TABLE ?auto_96276 ) ( not ( = ?auto_96276 ?auto_96277 ) ) ( not ( = ?auto_96276 ?auto_96278 ) ) ( not ( = ?auto_96276 ?auto_96279 ) ) ( not ( = ?auto_96276 ?auto_96280 ) ) ( not ( = ?auto_96276 ?auto_96281 ) ) ( not ( = ?auto_96276 ?auto_96282 ) ) ( not ( = ?auto_96276 ?auto_96283 ) ) ( not ( = ?auto_96276 ?auto_96284 ) ) ( not ( = ?auto_96276 ?auto_96285 ) ) ( not ( = ?auto_96277 ?auto_96278 ) ) ( not ( = ?auto_96277 ?auto_96279 ) ) ( not ( = ?auto_96277 ?auto_96280 ) ) ( not ( = ?auto_96277 ?auto_96281 ) ) ( not ( = ?auto_96277 ?auto_96282 ) ) ( not ( = ?auto_96277 ?auto_96283 ) ) ( not ( = ?auto_96277 ?auto_96284 ) ) ( not ( = ?auto_96277 ?auto_96285 ) ) ( not ( = ?auto_96278 ?auto_96279 ) ) ( not ( = ?auto_96278 ?auto_96280 ) ) ( not ( = ?auto_96278 ?auto_96281 ) ) ( not ( = ?auto_96278 ?auto_96282 ) ) ( not ( = ?auto_96278 ?auto_96283 ) ) ( not ( = ?auto_96278 ?auto_96284 ) ) ( not ( = ?auto_96278 ?auto_96285 ) ) ( not ( = ?auto_96279 ?auto_96280 ) ) ( not ( = ?auto_96279 ?auto_96281 ) ) ( not ( = ?auto_96279 ?auto_96282 ) ) ( not ( = ?auto_96279 ?auto_96283 ) ) ( not ( = ?auto_96279 ?auto_96284 ) ) ( not ( = ?auto_96279 ?auto_96285 ) ) ( not ( = ?auto_96280 ?auto_96281 ) ) ( not ( = ?auto_96280 ?auto_96282 ) ) ( not ( = ?auto_96280 ?auto_96283 ) ) ( not ( = ?auto_96280 ?auto_96284 ) ) ( not ( = ?auto_96280 ?auto_96285 ) ) ( not ( = ?auto_96281 ?auto_96282 ) ) ( not ( = ?auto_96281 ?auto_96283 ) ) ( not ( = ?auto_96281 ?auto_96284 ) ) ( not ( = ?auto_96281 ?auto_96285 ) ) ( not ( = ?auto_96282 ?auto_96283 ) ) ( not ( = ?auto_96282 ?auto_96284 ) ) ( not ( = ?auto_96282 ?auto_96285 ) ) ( not ( = ?auto_96283 ?auto_96284 ) ) ( not ( = ?auto_96283 ?auto_96285 ) ) ( not ( = ?auto_96284 ?auto_96285 ) ) ( ON ?auto_96283 ?auto_96284 ) ( ON ?auto_96282 ?auto_96283 ) ( ON ?auto_96281 ?auto_96282 ) ( ON ?auto_96280 ?auto_96281 ) ( ON ?auto_96279 ?auto_96280 ) ( ON ?auto_96278 ?auto_96279 ) ( CLEAR ?auto_96276 ) ( ON ?auto_96277 ?auto_96278 ) ( CLEAR ?auto_96277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96276 ?auto_96277 )
      ( MAKE-9PILE ?auto_96276 ?auto_96277 ?auto_96278 ?auto_96279 ?auto_96280 ?auto_96281 ?auto_96282 ?auto_96283 ?auto_96284 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96295 - BLOCK
      ?auto_96296 - BLOCK
      ?auto_96297 - BLOCK
      ?auto_96298 - BLOCK
      ?auto_96299 - BLOCK
      ?auto_96300 - BLOCK
      ?auto_96301 - BLOCK
      ?auto_96302 - BLOCK
      ?auto_96303 - BLOCK
    )
    :vars
    (
      ?auto_96304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96303 ?auto_96304 ) ( ON-TABLE ?auto_96295 ) ( not ( = ?auto_96295 ?auto_96296 ) ) ( not ( = ?auto_96295 ?auto_96297 ) ) ( not ( = ?auto_96295 ?auto_96298 ) ) ( not ( = ?auto_96295 ?auto_96299 ) ) ( not ( = ?auto_96295 ?auto_96300 ) ) ( not ( = ?auto_96295 ?auto_96301 ) ) ( not ( = ?auto_96295 ?auto_96302 ) ) ( not ( = ?auto_96295 ?auto_96303 ) ) ( not ( = ?auto_96295 ?auto_96304 ) ) ( not ( = ?auto_96296 ?auto_96297 ) ) ( not ( = ?auto_96296 ?auto_96298 ) ) ( not ( = ?auto_96296 ?auto_96299 ) ) ( not ( = ?auto_96296 ?auto_96300 ) ) ( not ( = ?auto_96296 ?auto_96301 ) ) ( not ( = ?auto_96296 ?auto_96302 ) ) ( not ( = ?auto_96296 ?auto_96303 ) ) ( not ( = ?auto_96296 ?auto_96304 ) ) ( not ( = ?auto_96297 ?auto_96298 ) ) ( not ( = ?auto_96297 ?auto_96299 ) ) ( not ( = ?auto_96297 ?auto_96300 ) ) ( not ( = ?auto_96297 ?auto_96301 ) ) ( not ( = ?auto_96297 ?auto_96302 ) ) ( not ( = ?auto_96297 ?auto_96303 ) ) ( not ( = ?auto_96297 ?auto_96304 ) ) ( not ( = ?auto_96298 ?auto_96299 ) ) ( not ( = ?auto_96298 ?auto_96300 ) ) ( not ( = ?auto_96298 ?auto_96301 ) ) ( not ( = ?auto_96298 ?auto_96302 ) ) ( not ( = ?auto_96298 ?auto_96303 ) ) ( not ( = ?auto_96298 ?auto_96304 ) ) ( not ( = ?auto_96299 ?auto_96300 ) ) ( not ( = ?auto_96299 ?auto_96301 ) ) ( not ( = ?auto_96299 ?auto_96302 ) ) ( not ( = ?auto_96299 ?auto_96303 ) ) ( not ( = ?auto_96299 ?auto_96304 ) ) ( not ( = ?auto_96300 ?auto_96301 ) ) ( not ( = ?auto_96300 ?auto_96302 ) ) ( not ( = ?auto_96300 ?auto_96303 ) ) ( not ( = ?auto_96300 ?auto_96304 ) ) ( not ( = ?auto_96301 ?auto_96302 ) ) ( not ( = ?auto_96301 ?auto_96303 ) ) ( not ( = ?auto_96301 ?auto_96304 ) ) ( not ( = ?auto_96302 ?auto_96303 ) ) ( not ( = ?auto_96302 ?auto_96304 ) ) ( not ( = ?auto_96303 ?auto_96304 ) ) ( ON ?auto_96302 ?auto_96303 ) ( ON ?auto_96301 ?auto_96302 ) ( ON ?auto_96300 ?auto_96301 ) ( ON ?auto_96299 ?auto_96300 ) ( ON ?auto_96298 ?auto_96299 ) ( ON ?auto_96297 ?auto_96298 ) ( CLEAR ?auto_96295 ) ( ON ?auto_96296 ?auto_96297 ) ( CLEAR ?auto_96296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96295 ?auto_96296 )
      ( MAKE-9PILE ?auto_96295 ?auto_96296 ?auto_96297 ?auto_96298 ?auto_96299 ?auto_96300 ?auto_96301 ?auto_96302 ?auto_96303 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96314 - BLOCK
      ?auto_96315 - BLOCK
      ?auto_96316 - BLOCK
      ?auto_96317 - BLOCK
      ?auto_96318 - BLOCK
      ?auto_96319 - BLOCK
      ?auto_96320 - BLOCK
      ?auto_96321 - BLOCK
      ?auto_96322 - BLOCK
    )
    :vars
    (
      ?auto_96323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96322 ?auto_96323 ) ( not ( = ?auto_96314 ?auto_96315 ) ) ( not ( = ?auto_96314 ?auto_96316 ) ) ( not ( = ?auto_96314 ?auto_96317 ) ) ( not ( = ?auto_96314 ?auto_96318 ) ) ( not ( = ?auto_96314 ?auto_96319 ) ) ( not ( = ?auto_96314 ?auto_96320 ) ) ( not ( = ?auto_96314 ?auto_96321 ) ) ( not ( = ?auto_96314 ?auto_96322 ) ) ( not ( = ?auto_96314 ?auto_96323 ) ) ( not ( = ?auto_96315 ?auto_96316 ) ) ( not ( = ?auto_96315 ?auto_96317 ) ) ( not ( = ?auto_96315 ?auto_96318 ) ) ( not ( = ?auto_96315 ?auto_96319 ) ) ( not ( = ?auto_96315 ?auto_96320 ) ) ( not ( = ?auto_96315 ?auto_96321 ) ) ( not ( = ?auto_96315 ?auto_96322 ) ) ( not ( = ?auto_96315 ?auto_96323 ) ) ( not ( = ?auto_96316 ?auto_96317 ) ) ( not ( = ?auto_96316 ?auto_96318 ) ) ( not ( = ?auto_96316 ?auto_96319 ) ) ( not ( = ?auto_96316 ?auto_96320 ) ) ( not ( = ?auto_96316 ?auto_96321 ) ) ( not ( = ?auto_96316 ?auto_96322 ) ) ( not ( = ?auto_96316 ?auto_96323 ) ) ( not ( = ?auto_96317 ?auto_96318 ) ) ( not ( = ?auto_96317 ?auto_96319 ) ) ( not ( = ?auto_96317 ?auto_96320 ) ) ( not ( = ?auto_96317 ?auto_96321 ) ) ( not ( = ?auto_96317 ?auto_96322 ) ) ( not ( = ?auto_96317 ?auto_96323 ) ) ( not ( = ?auto_96318 ?auto_96319 ) ) ( not ( = ?auto_96318 ?auto_96320 ) ) ( not ( = ?auto_96318 ?auto_96321 ) ) ( not ( = ?auto_96318 ?auto_96322 ) ) ( not ( = ?auto_96318 ?auto_96323 ) ) ( not ( = ?auto_96319 ?auto_96320 ) ) ( not ( = ?auto_96319 ?auto_96321 ) ) ( not ( = ?auto_96319 ?auto_96322 ) ) ( not ( = ?auto_96319 ?auto_96323 ) ) ( not ( = ?auto_96320 ?auto_96321 ) ) ( not ( = ?auto_96320 ?auto_96322 ) ) ( not ( = ?auto_96320 ?auto_96323 ) ) ( not ( = ?auto_96321 ?auto_96322 ) ) ( not ( = ?auto_96321 ?auto_96323 ) ) ( not ( = ?auto_96322 ?auto_96323 ) ) ( ON ?auto_96321 ?auto_96322 ) ( ON ?auto_96320 ?auto_96321 ) ( ON ?auto_96319 ?auto_96320 ) ( ON ?auto_96318 ?auto_96319 ) ( ON ?auto_96317 ?auto_96318 ) ( ON ?auto_96316 ?auto_96317 ) ( ON ?auto_96315 ?auto_96316 ) ( ON ?auto_96314 ?auto_96315 ) ( CLEAR ?auto_96314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96314 )
      ( MAKE-9PILE ?auto_96314 ?auto_96315 ?auto_96316 ?auto_96317 ?auto_96318 ?auto_96319 ?auto_96320 ?auto_96321 ?auto_96322 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_96333 - BLOCK
      ?auto_96334 - BLOCK
      ?auto_96335 - BLOCK
      ?auto_96336 - BLOCK
      ?auto_96337 - BLOCK
      ?auto_96338 - BLOCK
      ?auto_96339 - BLOCK
      ?auto_96340 - BLOCK
      ?auto_96341 - BLOCK
    )
    :vars
    (
      ?auto_96342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96341 ?auto_96342 ) ( not ( = ?auto_96333 ?auto_96334 ) ) ( not ( = ?auto_96333 ?auto_96335 ) ) ( not ( = ?auto_96333 ?auto_96336 ) ) ( not ( = ?auto_96333 ?auto_96337 ) ) ( not ( = ?auto_96333 ?auto_96338 ) ) ( not ( = ?auto_96333 ?auto_96339 ) ) ( not ( = ?auto_96333 ?auto_96340 ) ) ( not ( = ?auto_96333 ?auto_96341 ) ) ( not ( = ?auto_96333 ?auto_96342 ) ) ( not ( = ?auto_96334 ?auto_96335 ) ) ( not ( = ?auto_96334 ?auto_96336 ) ) ( not ( = ?auto_96334 ?auto_96337 ) ) ( not ( = ?auto_96334 ?auto_96338 ) ) ( not ( = ?auto_96334 ?auto_96339 ) ) ( not ( = ?auto_96334 ?auto_96340 ) ) ( not ( = ?auto_96334 ?auto_96341 ) ) ( not ( = ?auto_96334 ?auto_96342 ) ) ( not ( = ?auto_96335 ?auto_96336 ) ) ( not ( = ?auto_96335 ?auto_96337 ) ) ( not ( = ?auto_96335 ?auto_96338 ) ) ( not ( = ?auto_96335 ?auto_96339 ) ) ( not ( = ?auto_96335 ?auto_96340 ) ) ( not ( = ?auto_96335 ?auto_96341 ) ) ( not ( = ?auto_96335 ?auto_96342 ) ) ( not ( = ?auto_96336 ?auto_96337 ) ) ( not ( = ?auto_96336 ?auto_96338 ) ) ( not ( = ?auto_96336 ?auto_96339 ) ) ( not ( = ?auto_96336 ?auto_96340 ) ) ( not ( = ?auto_96336 ?auto_96341 ) ) ( not ( = ?auto_96336 ?auto_96342 ) ) ( not ( = ?auto_96337 ?auto_96338 ) ) ( not ( = ?auto_96337 ?auto_96339 ) ) ( not ( = ?auto_96337 ?auto_96340 ) ) ( not ( = ?auto_96337 ?auto_96341 ) ) ( not ( = ?auto_96337 ?auto_96342 ) ) ( not ( = ?auto_96338 ?auto_96339 ) ) ( not ( = ?auto_96338 ?auto_96340 ) ) ( not ( = ?auto_96338 ?auto_96341 ) ) ( not ( = ?auto_96338 ?auto_96342 ) ) ( not ( = ?auto_96339 ?auto_96340 ) ) ( not ( = ?auto_96339 ?auto_96341 ) ) ( not ( = ?auto_96339 ?auto_96342 ) ) ( not ( = ?auto_96340 ?auto_96341 ) ) ( not ( = ?auto_96340 ?auto_96342 ) ) ( not ( = ?auto_96341 ?auto_96342 ) ) ( ON ?auto_96340 ?auto_96341 ) ( ON ?auto_96339 ?auto_96340 ) ( ON ?auto_96338 ?auto_96339 ) ( ON ?auto_96337 ?auto_96338 ) ( ON ?auto_96336 ?auto_96337 ) ( ON ?auto_96335 ?auto_96336 ) ( ON ?auto_96334 ?auto_96335 ) ( ON ?auto_96333 ?auto_96334 ) ( CLEAR ?auto_96333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96333 )
      ( MAKE-9PILE ?auto_96333 ?auto_96334 ?auto_96335 ?auto_96336 ?auto_96337 ?auto_96338 ?auto_96339 ?auto_96340 ?auto_96341 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96353 - BLOCK
      ?auto_96354 - BLOCK
      ?auto_96355 - BLOCK
      ?auto_96356 - BLOCK
      ?auto_96357 - BLOCK
      ?auto_96358 - BLOCK
      ?auto_96359 - BLOCK
      ?auto_96360 - BLOCK
      ?auto_96361 - BLOCK
      ?auto_96362 - BLOCK
    )
    :vars
    (
      ?auto_96363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96361 ) ( ON ?auto_96362 ?auto_96363 ) ( CLEAR ?auto_96362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96353 ) ( ON ?auto_96354 ?auto_96353 ) ( ON ?auto_96355 ?auto_96354 ) ( ON ?auto_96356 ?auto_96355 ) ( ON ?auto_96357 ?auto_96356 ) ( ON ?auto_96358 ?auto_96357 ) ( ON ?auto_96359 ?auto_96358 ) ( ON ?auto_96360 ?auto_96359 ) ( ON ?auto_96361 ?auto_96360 ) ( not ( = ?auto_96353 ?auto_96354 ) ) ( not ( = ?auto_96353 ?auto_96355 ) ) ( not ( = ?auto_96353 ?auto_96356 ) ) ( not ( = ?auto_96353 ?auto_96357 ) ) ( not ( = ?auto_96353 ?auto_96358 ) ) ( not ( = ?auto_96353 ?auto_96359 ) ) ( not ( = ?auto_96353 ?auto_96360 ) ) ( not ( = ?auto_96353 ?auto_96361 ) ) ( not ( = ?auto_96353 ?auto_96362 ) ) ( not ( = ?auto_96353 ?auto_96363 ) ) ( not ( = ?auto_96354 ?auto_96355 ) ) ( not ( = ?auto_96354 ?auto_96356 ) ) ( not ( = ?auto_96354 ?auto_96357 ) ) ( not ( = ?auto_96354 ?auto_96358 ) ) ( not ( = ?auto_96354 ?auto_96359 ) ) ( not ( = ?auto_96354 ?auto_96360 ) ) ( not ( = ?auto_96354 ?auto_96361 ) ) ( not ( = ?auto_96354 ?auto_96362 ) ) ( not ( = ?auto_96354 ?auto_96363 ) ) ( not ( = ?auto_96355 ?auto_96356 ) ) ( not ( = ?auto_96355 ?auto_96357 ) ) ( not ( = ?auto_96355 ?auto_96358 ) ) ( not ( = ?auto_96355 ?auto_96359 ) ) ( not ( = ?auto_96355 ?auto_96360 ) ) ( not ( = ?auto_96355 ?auto_96361 ) ) ( not ( = ?auto_96355 ?auto_96362 ) ) ( not ( = ?auto_96355 ?auto_96363 ) ) ( not ( = ?auto_96356 ?auto_96357 ) ) ( not ( = ?auto_96356 ?auto_96358 ) ) ( not ( = ?auto_96356 ?auto_96359 ) ) ( not ( = ?auto_96356 ?auto_96360 ) ) ( not ( = ?auto_96356 ?auto_96361 ) ) ( not ( = ?auto_96356 ?auto_96362 ) ) ( not ( = ?auto_96356 ?auto_96363 ) ) ( not ( = ?auto_96357 ?auto_96358 ) ) ( not ( = ?auto_96357 ?auto_96359 ) ) ( not ( = ?auto_96357 ?auto_96360 ) ) ( not ( = ?auto_96357 ?auto_96361 ) ) ( not ( = ?auto_96357 ?auto_96362 ) ) ( not ( = ?auto_96357 ?auto_96363 ) ) ( not ( = ?auto_96358 ?auto_96359 ) ) ( not ( = ?auto_96358 ?auto_96360 ) ) ( not ( = ?auto_96358 ?auto_96361 ) ) ( not ( = ?auto_96358 ?auto_96362 ) ) ( not ( = ?auto_96358 ?auto_96363 ) ) ( not ( = ?auto_96359 ?auto_96360 ) ) ( not ( = ?auto_96359 ?auto_96361 ) ) ( not ( = ?auto_96359 ?auto_96362 ) ) ( not ( = ?auto_96359 ?auto_96363 ) ) ( not ( = ?auto_96360 ?auto_96361 ) ) ( not ( = ?auto_96360 ?auto_96362 ) ) ( not ( = ?auto_96360 ?auto_96363 ) ) ( not ( = ?auto_96361 ?auto_96362 ) ) ( not ( = ?auto_96361 ?auto_96363 ) ) ( not ( = ?auto_96362 ?auto_96363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96362 ?auto_96363 )
      ( !STACK ?auto_96362 ?auto_96361 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96374 - BLOCK
      ?auto_96375 - BLOCK
      ?auto_96376 - BLOCK
      ?auto_96377 - BLOCK
      ?auto_96378 - BLOCK
      ?auto_96379 - BLOCK
      ?auto_96380 - BLOCK
      ?auto_96381 - BLOCK
      ?auto_96382 - BLOCK
      ?auto_96383 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96382 ) ( ON-TABLE ?auto_96383 ) ( CLEAR ?auto_96383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96374 ) ( ON ?auto_96375 ?auto_96374 ) ( ON ?auto_96376 ?auto_96375 ) ( ON ?auto_96377 ?auto_96376 ) ( ON ?auto_96378 ?auto_96377 ) ( ON ?auto_96379 ?auto_96378 ) ( ON ?auto_96380 ?auto_96379 ) ( ON ?auto_96381 ?auto_96380 ) ( ON ?auto_96382 ?auto_96381 ) ( not ( = ?auto_96374 ?auto_96375 ) ) ( not ( = ?auto_96374 ?auto_96376 ) ) ( not ( = ?auto_96374 ?auto_96377 ) ) ( not ( = ?auto_96374 ?auto_96378 ) ) ( not ( = ?auto_96374 ?auto_96379 ) ) ( not ( = ?auto_96374 ?auto_96380 ) ) ( not ( = ?auto_96374 ?auto_96381 ) ) ( not ( = ?auto_96374 ?auto_96382 ) ) ( not ( = ?auto_96374 ?auto_96383 ) ) ( not ( = ?auto_96375 ?auto_96376 ) ) ( not ( = ?auto_96375 ?auto_96377 ) ) ( not ( = ?auto_96375 ?auto_96378 ) ) ( not ( = ?auto_96375 ?auto_96379 ) ) ( not ( = ?auto_96375 ?auto_96380 ) ) ( not ( = ?auto_96375 ?auto_96381 ) ) ( not ( = ?auto_96375 ?auto_96382 ) ) ( not ( = ?auto_96375 ?auto_96383 ) ) ( not ( = ?auto_96376 ?auto_96377 ) ) ( not ( = ?auto_96376 ?auto_96378 ) ) ( not ( = ?auto_96376 ?auto_96379 ) ) ( not ( = ?auto_96376 ?auto_96380 ) ) ( not ( = ?auto_96376 ?auto_96381 ) ) ( not ( = ?auto_96376 ?auto_96382 ) ) ( not ( = ?auto_96376 ?auto_96383 ) ) ( not ( = ?auto_96377 ?auto_96378 ) ) ( not ( = ?auto_96377 ?auto_96379 ) ) ( not ( = ?auto_96377 ?auto_96380 ) ) ( not ( = ?auto_96377 ?auto_96381 ) ) ( not ( = ?auto_96377 ?auto_96382 ) ) ( not ( = ?auto_96377 ?auto_96383 ) ) ( not ( = ?auto_96378 ?auto_96379 ) ) ( not ( = ?auto_96378 ?auto_96380 ) ) ( not ( = ?auto_96378 ?auto_96381 ) ) ( not ( = ?auto_96378 ?auto_96382 ) ) ( not ( = ?auto_96378 ?auto_96383 ) ) ( not ( = ?auto_96379 ?auto_96380 ) ) ( not ( = ?auto_96379 ?auto_96381 ) ) ( not ( = ?auto_96379 ?auto_96382 ) ) ( not ( = ?auto_96379 ?auto_96383 ) ) ( not ( = ?auto_96380 ?auto_96381 ) ) ( not ( = ?auto_96380 ?auto_96382 ) ) ( not ( = ?auto_96380 ?auto_96383 ) ) ( not ( = ?auto_96381 ?auto_96382 ) ) ( not ( = ?auto_96381 ?auto_96383 ) ) ( not ( = ?auto_96382 ?auto_96383 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_96383 )
      ( !STACK ?auto_96383 ?auto_96382 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96394 - BLOCK
      ?auto_96395 - BLOCK
      ?auto_96396 - BLOCK
      ?auto_96397 - BLOCK
      ?auto_96398 - BLOCK
      ?auto_96399 - BLOCK
      ?auto_96400 - BLOCK
      ?auto_96401 - BLOCK
      ?auto_96402 - BLOCK
      ?auto_96403 - BLOCK
    )
    :vars
    (
      ?auto_96404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96403 ?auto_96404 ) ( ON-TABLE ?auto_96394 ) ( ON ?auto_96395 ?auto_96394 ) ( ON ?auto_96396 ?auto_96395 ) ( ON ?auto_96397 ?auto_96396 ) ( ON ?auto_96398 ?auto_96397 ) ( ON ?auto_96399 ?auto_96398 ) ( ON ?auto_96400 ?auto_96399 ) ( ON ?auto_96401 ?auto_96400 ) ( not ( = ?auto_96394 ?auto_96395 ) ) ( not ( = ?auto_96394 ?auto_96396 ) ) ( not ( = ?auto_96394 ?auto_96397 ) ) ( not ( = ?auto_96394 ?auto_96398 ) ) ( not ( = ?auto_96394 ?auto_96399 ) ) ( not ( = ?auto_96394 ?auto_96400 ) ) ( not ( = ?auto_96394 ?auto_96401 ) ) ( not ( = ?auto_96394 ?auto_96402 ) ) ( not ( = ?auto_96394 ?auto_96403 ) ) ( not ( = ?auto_96394 ?auto_96404 ) ) ( not ( = ?auto_96395 ?auto_96396 ) ) ( not ( = ?auto_96395 ?auto_96397 ) ) ( not ( = ?auto_96395 ?auto_96398 ) ) ( not ( = ?auto_96395 ?auto_96399 ) ) ( not ( = ?auto_96395 ?auto_96400 ) ) ( not ( = ?auto_96395 ?auto_96401 ) ) ( not ( = ?auto_96395 ?auto_96402 ) ) ( not ( = ?auto_96395 ?auto_96403 ) ) ( not ( = ?auto_96395 ?auto_96404 ) ) ( not ( = ?auto_96396 ?auto_96397 ) ) ( not ( = ?auto_96396 ?auto_96398 ) ) ( not ( = ?auto_96396 ?auto_96399 ) ) ( not ( = ?auto_96396 ?auto_96400 ) ) ( not ( = ?auto_96396 ?auto_96401 ) ) ( not ( = ?auto_96396 ?auto_96402 ) ) ( not ( = ?auto_96396 ?auto_96403 ) ) ( not ( = ?auto_96396 ?auto_96404 ) ) ( not ( = ?auto_96397 ?auto_96398 ) ) ( not ( = ?auto_96397 ?auto_96399 ) ) ( not ( = ?auto_96397 ?auto_96400 ) ) ( not ( = ?auto_96397 ?auto_96401 ) ) ( not ( = ?auto_96397 ?auto_96402 ) ) ( not ( = ?auto_96397 ?auto_96403 ) ) ( not ( = ?auto_96397 ?auto_96404 ) ) ( not ( = ?auto_96398 ?auto_96399 ) ) ( not ( = ?auto_96398 ?auto_96400 ) ) ( not ( = ?auto_96398 ?auto_96401 ) ) ( not ( = ?auto_96398 ?auto_96402 ) ) ( not ( = ?auto_96398 ?auto_96403 ) ) ( not ( = ?auto_96398 ?auto_96404 ) ) ( not ( = ?auto_96399 ?auto_96400 ) ) ( not ( = ?auto_96399 ?auto_96401 ) ) ( not ( = ?auto_96399 ?auto_96402 ) ) ( not ( = ?auto_96399 ?auto_96403 ) ) ( not ( = ?auto_96399 ?auto_96404 ) ) ( not ( = ?auto_96400 ?auto_96401 ) ) ( not ( = ?auto_96400 ?auto_96402 ) ) ( not ( = ?auto_96400 ?auto_96403 ) ) ( not ( = ?auto_96400 ?auto_96404 ) ) ( not ( = ?auto_96401 ?auto_96402 ) ) ( not ( = ?auto_96401 ?auto_96403 ) ) ( not ( = ?auto_96401 ?auto_96404 ) ) ( not ( = ?auto_96402 ?auto_96403 ) ) ( not ( = ?auto_96402 ?auto_96404 ) ) ( not ( = ?auto_96403 ?auto_96404 ) ) ( CLEAR ?auto_96401 ) ( ON ?auto_96402 ?auto_96403 ) ( CLEAR ?auto_96402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_96394 ?auto_96395 ?auto_96396 ?auto_96397 ?auto_96398 ?auto_96399 ?auto_96400 ?auto_96401 ?auto_96402 )
      ( MAKE-10PILE ?auto_96394 ?auto_96395 ?auto_96396 ?auto_96397 ?auto_96398 ?auto_96399 ?auto_96400 ?auto_96401 ?auto_96402 ?auto_96403 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96415 - BLOCK
      ?auto_96416 - BLOCK
      ?auto_96417 - BLOCK
      ?auto_96418 - BLOCK
      ?auto_96419 - BLOCK
      ?auto_96420 - BLOCK
      ?auto_96421 - BLOCK
      ?auto_96422 - BLOCK
      ?auto_96423 - BLOCK
      ?auto_96424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96424 ) ( ON-TABLE ?auto_96415 ) ( ON ?auto_96416 ?auto_96415 ) ( ON ?auto_96417 ?auto_96416 ) ( ON ?auto_96418 ?auto_96417 ) ( ON ?auto_96419 ?auto_96418 ) ( ON ?auto_96420 ?auto_96419 ) ( ON ?auto_96421 ?auto_96420 ) ( ON ?auto_96422 ?auto_96421 ) ( not ( = ?auto_96415 ?auto_96416 ) ) ( not ( = ?auto_96415 ?auto_96417 ) ) ( not ( = ?auto_96415 ?auto_96418 ) ) ( not ( = ?auto_96415 ?auto_96419 ) ) ( not ( = ?auto_96415 ?auto_96420 ) ) ( not ( = ?auto_96415 ?auto_96421 ) ) ( not ( = ?auto_96415 ?auto_96422 ) ) ( not ( = ?auto_96415 ?auto_96423 ) ) ( not ( = ?auto_96415 ?auto_96424 ) ) ( not ( = ?auto_96416 ?auto_96417 ) ) ( not ( = ?auto_96416 ?auto_96418 ) ) ( not ( = ?auto_96416 ?auto_96419 ) ) ( not ( = ?auto_96416 ?auto_96420 ) ) ( not ( = ?auto_96416 ?auto_96421 ) ) ( not ( = ?auto_96416 ?auto_96422 ) ) ( not ( = ?auto_96416 ?auto_96423 ) ) ( not ( = ?auto_96416 ?auto_96424 ) ) ( not ( = ?auto_96417 ?auto_96418 ) ) ( not ( = ?auto_96417 ?auto_96419 ) ) ( not ( = ?auto_96417 ?auto_96420 ) ) ( not ( = ?auto_96417 ?auto_96421 ) ) ( not ( = ?auto_96417 ?auto_96422 ) ) ( not ( = ?auto_96417 ?auto_96423 ) ) ( not ( = ?auto_96417 ?auto_96424 ) ) ( not ( = ?auto_96418 ?auto_96419 ) ) ( not ( = ?auto_96418 ?auto_96420 ) ) ( not ( = ?auto_96418 ?auto_96421 ) ) ( not ( = ?auto_96418 ?auto_96422 ) ) ( not ( = ?auto_96418 ?auto_96423 ) ) ( not ( = ?auto_96418 ?auto_96424 ) ) ( not ( = ?auto_96419 ?auto_96420 ) ) ( not ( = ?auto_96419 ?auto_96421 ) ) ( not ( = ?auto_96419 ?auto_96422 ) ) ( not ( = ?auto_96419 ?auto_96423 ) ) ( not ( = ?auto_96419 ?auto_96424 ) ) ( not ( = ?auto_96420 ?auto_96421 ) ) ( not ( = ?auto_96420 ?auto_96422 ) ) ( not ( = ?auto_96420 ?auto_96423 ) ) ( not ( = ?auto_96420 ?auto_96424 ) ) ( not ( = ?auto_96421 ?auto_96422 ) ) ( not ( = ?auto_96421 ?auto_96423 ) ) ( not ( = ?auto_96421 ?auto_96424 ) ) ( not ( = ?auto_96422 ?auto_96423 ) ) ( not ( = ?auto_96422 ?auto_96424 ) ) ( not ( = ?auto_96423 ?auto_96424 ) ) ( CLEAR ?auto_96422 ) ( ON ?auto_96423 ?auto_96424 ) ( CLEAR ?auto_96423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_96415 ?auto_96416 ?auto_96417 ?auto_96418 ?auto_96419 ?auto_96420 ?auto_96421 ?auto_96422 ?auto_96423 )
      ( MAKE-10PILE ?auto_96415 ?auto_96416 ?auto_96417 ?auto_96418 ?auto_96419 ?auto_96420 ?auto_96421 ?auto_96422 ?auto_96423 ?auto_96424 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96435 - BLOCK
      ?auto_96436 - BLOCK
      ?auto_96437 - BLOCK
      ?auto_96438 - BLOCK
      ?auto_96439 - BLOCK
      ?auto_96440 - BLOCK
      ?auto_96441 - BLOCK
      ?auto_96442 - BLOCK
      ?auto_96443 - BLOCK
      ?auto_96444 - BLOCK
    )
    :vars
    (
      ?auto_96445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96444 ?auto_96445 ) ( ON-TABLE ?auto_96435 ) ( ON ?auto_96436 ?auto_96435 ) ( ON ?auto_96437 ?auto_96436 ) ( ON ?auto_96438 ?auto_96437 ) ( ON ?auto_96439 ?auto_96438 ) ( ON ?auto_96440 ?auto_96439 ) ( ON ?auto_96441 ?auto_96440 ) ( not ( = ?auto_96435 ?auto_96436 ) ) ( not ( = ?auto_96435 ?auto_96437 ) ) ( not ( = ?auto_96435 ?auto_96438 ) ) ( not ( = ?auto_96435 ?auto_96439 ) ) ( not ( = ?auto_96435 ?auto_96440 ) ) ( not ( = ?auto_96435 ?auto_96441 ) ) ( not ( = ?auto_96435 ?auto_96442 ) ) ( not ( = ?auto_96435 ?auto_96443 ) ) ( not ( = ?auto_96435 ?auto_96444 ) ) ( not ( = ?auto_96435 ?auto_96445 ) ) ( not ( = ?auto_96436 ?auto_96437 ) ) ( not ( = ?auto_96436 ?auto_96438 ) ) ( not ( = ?auto_96436 ?auto_96439 ) ) ( not ( = ?auto_96436 ?auto_96440 ) ) ( not ( = ?auto_96436 ?auto_96441 ) ) ( not ( = ?auto_96436 ?auto_96442 ) ) ( not ( = ?auto_96436 ?auto_96443 ) ) ( not ( = ?auto_96436 ?auto_96444 ) ) ( not ( = ?auto_96436 ?auto_96445 ) ) ( not ( = ?auto_96437 ?auto_96438 ) ) ( not ( = ?auto_96437 ?auto_96439 ) ) ( not ( = ?auto_96437 ?auto_96440 ) ) ( not ( = ?auto_96437 ?auto_96441 ) ) ( not ( = ?auto_96437 ?auto_96442 ) ) ( not ( = ?auto_96437 ?auto_96443 ) ) ( not ( = ?auto_96437 ?auto_96444 ) ) ( not ( = ?auto_96437 ?auto_96445 ) ) ( not ( = ?auto_96438 ?auto_96439 ) ) ( not ( = ?auto_96438 ?auto_96440 ) ) ( not ( = ?auto_96438 ?auto_96441 ) ) ( not ( = ?auto_96438 ?auto_96442 ) ) ( not ( = ?auto_96438 ?auto_96443 ) ) ( not ( = ?auto_96438 ?auto_96444 ) ) ( not ( = ?auto_96438 ?auto_96445 ) ) ( not ( = ?auto_96439 ?auto_96440 ) ) ( not ( = ?auto_96439 ?auto_96441 ) ) ( not ( = ?auto_96439 ?auto_96442 ) ) ( not ( = ?auto_96439 ?auto_96443 ) ) ( not ( = ?auto_96439 ?auto_96444 ) ) ( not ( = ?auto_96439 ?auto_96445 ) ) ( not ( = ?auto_96440 ?auto_96441 ) ) ( not ( = ?auto_96440 ?auto_96442 ) ) ( not ( = ?auto_96440 ?auto_96443 ) ) ( not ( = ?auto_96440 ?auto_96444 ) ) ( not ( = ?auto_96440 ?auto_96445 ) ) ( not ( = ?auto_96441 ?auto_96442 ) ) ( not ( = ?auto_96441 ?auto_96443 ) ) ( not ( = ?auto_96441 ?auto_96444 ) ) ( not ( = ?auto_96441 ?auto_96445 ) ) ( not ( = ?auto_96442 ?auto_96443 ) ) ( not ( = ?auto_96442 ?auto_96444 ) ) ( not ( = ?auto_96442 ?auto_96445 ) ) ( not ( = ?auto_96443 ?auto_96444 ) ) ( not ( = ?auto_96443 ?auto_96445 ) ) ( not ( = ?auto_96444 ?auto_96445 ) ) ( ON ?auto_96443 ?auto_96444 ) ( CLEAR ?auto_96441 ) ( ON ?auto_96442 ?auto_96443 ) ( CLEAR ?auto_96442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_96435 ?auto_96436 ?auto_96437 ?auto_96438 ?auto_96439 ?auto_96440 ?auto_96441 ?auto_96442 )
      ( MAKE-10PILE ?auto_96435 ?auto_96436 ?auto_96437 ?auto_96438 ?auto_96439 ?auto_96440 ?auto_96441 ?auto_96442 ?auto_96443 ?auto_96444 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96456 - BLOCK
      ?auto_96457 - BLOCK
      ?auto_96458 - BLOCK
      ?auto_96459 - BLOCK
      ?auto_96460 - BLOCK
      ?auto_96461 - BLOCK
      ?auto_96462 - BLOCK
      ?auto_96463 - BLOCK
      ?auto_96464 - BLOCK
      ?auto_96465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96465 ) ( ON-TABLE ?auto_96456 ) ( ON ?auto_96457 ?auto_96456 ) ( ON ?auto_96458 ?auto_96457 ) ( ON ?auto_96459 ?auto_96458 ) ( ON ?auto_96460 ?auto_96459 ) ( ON ?auto_96461 ?auto_96460 ) ( ON ?auto_96462 ?auto_96461 ) ( not ( = ?auto_96456 ?auto_96457 ) ) ( not ( = ?auto_96456 ?auto_96458 ) ) ( not ( = ?auto_96456 ?auto_96459 ) ) ( not ( = ?auto_96456 ?auto_96460 ) ) ( not ( = ?auto_96456 ?auto_96461 ) ) ( not ( = ?auto_96456 ?auto_96462 ) ) ( not ( = ?auto_96456 ?auto_96463 ) ) ( not ( = ?auto_96456 ?auto_96464 ) ) ( not ( = ?auto_96456 ?auto_96465 ) ) ( not ( = ?auto_96457 ?auto_96458 ) ) ( not ( = ?auto_96457 ?auto_96459 ) ) ( not ( = ?auto_96457 ?auto_96460 ) ) ( not ( = ?auto_96457 ?auto_96461 ) ) ( not ( = ?auto_96457 ?auto_96462 ) ) ( not ( = ?auto_96457 ?auto_96463 ) ) ( not ( = ?auto_96457 ?auto_96464 ) ) ( not ( = ?auto_96457 ?auto_96465 ) ) ( not ( = ?auto_96458 ?auto_96459 ) ) ( not ( = ?auto_96458 ?auto_96460 ) ) ( not ( = ?auto_96458 ?auto_96461 ) ) ( not ( = ?auto_96458 ?auto_96462 ) ) ( not ( = ?auto_96458 ?auto_96463 ) ) ( not ( = ?auto_96458 ?auto_96464 ) ) ( not ( = ?auto_96458 ?auto_96465 ) ) ( not ( = ?auto_96459 ?auto_96460 ) ) ( not ( = ?auto_96459 ?auto_96461 ) ) ( not ( = ?auto_96459 ?auto_96462 ) ) ( not ( = ?auto_96459 ?auto_96463 ) ) ( not ( = ?auto_96459 ?auto_96464 ) ) ( not ( = ?auto_96459 ?auto_96465 ) ) ( not ( = ?auto_96460 ?auto_96461 ) ) ( not ( = ?auto_96460 ?auto_96462 ) ) ( not ( = ?auto_96460 ?auto_96463 ) ) ( not ( = ?auto_96460 ?auto_96464 ) ) ( not ( = ?auto_96460 ?auto_96465 ) ) ( not ( = ?auto_96461 ?auto_96462 ) ) ( not ( = ?auto_96461 ?auto_96463 ) ) ( not ( = ?auto_96461 ?auto_96464 ) ) ( not ( = ?auto_96461 ?auto_96465 ) ) ( not ( = ?auto_96462 ?auto_96463 ) ) ( not ( = ?auto_96462 ?auto_96464 ) ) ( not ( = ?auto_96462 ?auto_96465 ) ) ( not ( = ?auto_96463 ?auto_96464 ) ) ( not ( = ?auto_96463 ?auto_96465 ) ) ( not ( = ?auto_96464 ?auto_96465 ) ) ( ON ?auto_96464 ?auto_96465 ) ( CLEAR ?auto_96462 ) ( ON ?auto_96463 ?auto_96464 ) ( CLEAR ?auto_96463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_96456 ?auto_96457 ?auto_96458 ?auto_96459 ?auto_96460 ?auto_96461 ?auto_96462 ?auto_96463 )
      ( MAKE-10PILE ?auto_96456 ?auto_96457 ?auto_96458 ?auto_96459 ?auto_96460 ?auto_96461 ?auto_96462 ?auto_96463 ?auto_96464 ?auto_96465 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96476 - BLOCK
      ?auto_96477 - BLOCK
      ?auto_96478 - BLOCK
      ?auto_96479 - BLOCK
      ?auto_96480 - BLOCK
      ?auto_96481 - BLOCK
      ?auto_96482 - BLOCK
      ?auto_96483 - BLOCK
      ?auto_96484 - BLOCK
      ?auto_96485 - BLOCK
    )
    :vars
    (
      ?auto_96486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96485 ?auto_96486 ) ( ON-TABLE ?auto_96476 ) ( ON ?auto_96477 ?auto_96476 ) ( ON ?auto_96478 ?auto_96477 ) ( ON ?auto_96479 ?auto_96478 ) ( ON ?auto_96480 ?auto_96479 ) ( ON ?auto_96481 ?auto_96480 ) ( not ( = ?auto_96476 ?auto_96477 ) ) ( not ( = ?auto_96476 ?auto_96478 ) ) ( not ( = ?auto_96476 ?auto_96479 ) ) ( not ( = ?auto_96476 ?auto_96480 ) ) ( not ( = ?auto_96476 ?auto_96481 ) ) ( not ( = ?auto_96476 ?auto_96482 ) ) ( not ( = ?auto_96476 ?auto_96483 ) ) ( not ( = ?auto_96476 ?auto_96484 ) ) ( not ( = ?auto_96476 ?auto_96485 ) ) ( not ( = ?auto_96476 ?auto_96486 ) ) ( not ( = ?auto_96477 ?auto_96478 ) ) ( not ( = ?auto_96477 ?auto_96479 ) ) ( not ( = ?auto_96477 ?auto_96480 ) ) ( not ( = ?auto_96477 ?auto_96481 ) ) ( not ( = ?auto_96477 ?auto_96482 ) ) ( not ( = ?auto_96477 ?auto_96483 ) ) ( not ( = ?auto_96477 ?auto_96484 ) ) ( not ( = ?auto_96477 ?auto_96485 ) ) ( not ( = ?auto_96477 ?auto_96486 ) ) ( not ( = ?auto_96478 ?auto_96479 ) ) ( not ( = ?auto_96478 ?auto_96480 ) ) ( not ( = ?auto_96478 ?auto_96481 ) ) ( not ( = ?auto_96478 ?auto_96482 ) ) ( not ( = ?auto_96478 ?auto_96483 ) ) ( not ( = ?auto_96478 ?auto_96484 ) ) ( not ( = ?auto_96478 ?auto_96485 ) ) ( not ( = ?auto_96478 ?auto_96486 ) ) ( not ( = ?auto_96479 ?auto_96480 ) ) ( not ( = ?auto_96479 ?auto_96481 ) ) ( not ( = ?auto_96479 ?auto_96482 ) ) ( not ( = ?auto_96479 ?auto_96483 ) ) ( not ( = ?auto_96479 ?auto_96484 ) ) ( not ( = ?auto_96479 ?auto_96485 ) ) ( not ( = ?auto_96479 ?auto_96486 ) ) ( not ( = ?auto_96480 ?auto_96481 ) ) ( not ( = ?auto_96480 ?auto_96482 ) ) ( not ( = ?auto_96480 ?auto_96483 ) ) ( not ( = ?auto_96480 ?auto_96484 ) ) ( not ( = ?auto_96480 ?auto_96485 ) ) ( not ( = ?auto_96480 ?auto_96486 ) ) ( not ( = ?auto_96481 ?auto_96482 ) ) ( not ( = ?auto_96481 ?auto_96483 ) ) ( not ( = ?auto_96481 ?auto_96484 ) ) ( not ( = ?auto_96481 ?auto_96485 ) ) ( not ( = ?auto_96481 ?auto_96486 ) ) ( not ( = ?auto_96482 ?auto_96483 ) ) ( not ( = ?auto_96482 ?auto_96484 ) ) ( not ( = ?auto_96482 ?auto_96485 ) ) ( not ( = ?auto_96482 ?auto_96486 ) ) ( not ( = ?auto_96483 ?auto_96484 ) ) ( not ( = ?auto_96483 ?auto_96485 ) ) ( not ( = ?auto_96483 ?auto_96486 ) ) ( not ( = ?auto_96484 ?auto_96485 ) ) ( not ( = ?auto_96484 ?auto_96486 ) ) ( not ( = ?auto_96485 ?auto_96486 ) ) ( ON ?auto_96484 ?auto_96485 ) ( ON ?auto_96483 ?auto_96484 ) ( CLEAR ?auto_96481 ) ( ON ?auto_96482 ?auto_96483 ) ( CLEAR ?auto_96482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96476 ?auto_96477 ?auto_96478 ?auto_96479 ?auto_96480 ?auto_96481 ?auto_96482 )
      ( MAKE-10PILE ?auto_96476 ?auto_96477 ?auto_96478 ?auto_96479 ?auto_96480 ?auto_96481 ?auto_96482 ?auto_96483 ?auto_96484 ?auto_96485 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96497 - BLOCK
      ?auto_96498 - BLOCK
      ?auto_96499 - BLOCK
      ?auto_96500 - BLOCK
      ?auto_96501 - BLOCK
      ?auto_96502 - BLOCK
      ?auto_96503 - BLOCK
      ?auto_96504 - BLOCK
      ?auto_96505 - BLOCK
      ?auto_96506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96506 ) ( ON-TABLE ?auto_96497 ) ( ON ?auto_96498 ?auto_96497 ) ( ON ?auto_96499 ?auto_96498 ) ( ON ?auto_96500 ?auto_96499 ) ( ON ?auto_96501 ?auto_96500 ) ( ON ?auto_96502 ?auto_96501 ) ( not ( = ?auto_96497 ?auto_96498 ) ) ( not ( = ?auto_96497 ?auto_96499 ) ) ( not ( = ?auto_96497 ?auto_96500 ) ) ( not ( = ?auto_96497 ?auto_96501 ) ) ( not ( = ?auto_96497 ?auto_96502 ) ) ( not ( = ?auto_96497 ?auto_96503 ) ) ( not ( = ?auto_96497 ?auto_96504 ) ) ( not ( = ?auto_96497 ?auto_96505 ) ) ( not ( = ?auto_96497 ?auto_96506 ) ) ( not ( = ?auto_96498 ?auto_96499 ) ) ( not ( = ?auto_96498 ?auto_96500 ) ) ( not ( = ?auto_96498 ?auto_96501 ) ) ( not ( = ?auto_96498 ?auto_96502 ) ) ( not ( = ?auto_96498 ?auto_96503 ) ) ( not ( = ?auto_96498 ?auto_96504 ) ) ( not ( = ?auto_96498 ?auto_96505 ) ) ( not ( = ?auto_96498 ?auto_96506 ) ) ( not ( = ?auto_96499 ?auto_96500 ) ) ( not ( = ?auto_96499 ?auto_96501 ) ) ( not ( = ?auto_96499 ?auto_96502 ) ) ( not ( = ?auto_96499 ?auto_96503 ) ) ( not ( = ?auto_96499 ?auto_96504 ) ) ( not ( = ?auto_96499 ?auto_96505 ) ) ( not ( = ?auto_96499 ?auto_96506 ) ) ( not ( = ?auto_96500 ?auto_96501 ) ) ( not ( = ?auto_96500 ?auto_96502 ) ) ( not ( = ?auto_96500 ?auto_96503 ) ) ( not ( = ?auto_96500 ?auto_96504 ) ) ( not ( = ?auto_96500 ?auto_96505 ) ) ( not ( = ?auto_96500 ?auto_96506 ) ) ( not ( = ?auto_96501 ?auto_96502 ) ) ( not ( = ?auto_96501 ?auto_96503 ) ) ( not ( = ?auto_96501 ?auto_96504 ) ) ( not ( = ?auto_96501 ?auto_96505 ) ) ( not ( = ?auto_96501 ?auto_96506 ) ) ( not ( = ?auto_96502 ?auto_96503 ) ) ( not ( = ?auto_96502 ?auto_96504 ) ) ( not ( = ?auto_96502 ?auto_96505 ) ) ( not ( = ?auto_96502 ?auto_96506 ) ) ( not ( = ?auto_96503 ?auto_96504 ) ) ( not ( = ?auto_96503 ?auto_96505 ) ) ( not ( = ?auto_96503 ?auto_96506 ) ) ( not ( = ?auto_96504 ?auto_96505 ) ) ( not ( = ?auto_96504 ?auto_96506 ) ) ( not ( = ?auto_96505 ?auto_96506 ) ) ( ON ?auto_96505 ?auto_96506 ) ( ON ?auto_96504 ?auto_96505 ) ( CLEAR ?auto_96502 ) ( ON ?auto_96503 ?auto_96504 ) ( CLEAR ?auto_96503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96497 ?auto_96498 ?auto_96499 ?auto_96500 ?auto_96501 ?auto_96502 ?auto_96503 )
      ( MAKE-10PILE ?auto_96497 ?auto_96498 ?auto_96499 ?auto_96500 ?auto_96501 ?auto_96502 ?auto_96503 ?auto_96504 ?auto_96505 ?auto_96506 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96517 - BLOCK
      ?auto_96518 - BLOCK
      ?auto_96519 - BLOCK
      ?auto_96520 - BLOCK
      ?auto_96521 - BLOCK
      ?auto_96522 - BLOCK
      ?auto_96523 - BLOCK
      ?auto_96524 - BLOCK
      ?auto_96525 - BLOCK
      ?auto_96526 - BLOCK
    )
    :vars
    (
      ?auto_96527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96526 ?auto_96527 ) ( ON-TABLE ?auto_96517 ) ( ON ?auto_96518 ?auto_96517 ) ( ON ?auto_96519 ?auto_96518 ) ( ON ?auto_96520 ?auto_96519 ) ( ON ?auto_96521 ?auto_96520 ) ( not ( = ?auto_96517 ?auto_96518 ) ) ( not ( = ?auto_96517 ?auto_96519 ) ) ( not ( = ?auto_96517 ?auto_96520 ) ) ( not ( = ?auto_96517 ?auto_96521 ) ) ( not ( = ?auto_96517 ?auto_96522 ) ) ( not ( = ?auto_96517 ?auto_96523 ) ) ( not ( = ?auto_96517 ?auto_96524 ) ) ( not ( = ?auto_96517 ?auto_96525 ) ) ( not ( = ?auto_96517 ?auto_96526 ) ) ( not ( = ?auto_96517 ?auto_96527 ) ) ( not ( = ?auto_96518 ?auto_96519 ) ) ( not ( = ?auto_96518 ?auto_96520 ) ) ( not ( = ?auto_96518 ?auto_96521 ) ) ( not ( = ?auto_96518 ?auto_96522 ) ) ( not ( = ?auto_96518 ?auto_96523 ) ) ( not ( = ?auto_96518 ?auto_96524 ) ) ( not ( = ?auto_96518 ?auto_96525 ) ) ( not ( = ?auto_96518 ?auto_96526 ) ) ( not ( = ?auto_96518 ?auto_96527 ) ) ( not ( = ?auto_96519 ?auto_96520 ) ) ( not ( = ?auto_96519 ?auto_96521 ) ) ( not ( = ?auto_96519 ?auto_96522 ) ) ( not ( = ?auto_96519 ?auto_96523 ) ) ( not ( = ?auto_96519 ?auto_96524 ) ) ( not ( = ?auto_96519 ?auto_96525 ) ) ( not ( = ?auto_96519 ?auto_96526 ) ) ( not ( = ?auto_96519 ?auto_96527 ) ) ( not ( = ?auto_96520 ?auto_96521 ) ) ( not ( = ?auto_96520 ?auto_96522 ) ) ( not ( = ?auto_96520 ?auto_96523 ) ) ( not ( = ?auto_96520 ?auto_96524 ) ) ( not ( = ?auto_96520 ?auto_96525 ) ) ( not ( = ?auto_96520 ?auto_96526 ) ) ( not ( = ?auto_96520 ?auto_96527 ) ) ( not ( = ?auto_96521 ?auto_96522 ) ) ( not ( = ?auto_96521 ?auto_96523 ) ) ( not ( = ?auto_96521 ?auto_96524 ) ) ( not ( = ?auto_96521 ?auto_96525 ) ) ( not ( = ?auto_96521 ?auto_96526 ) ) ( not ( = ?auto_96521 ?auto_96527 ) ) ( not ( = ?auto_96522 ?auto_96523 ) ) ( not ( = ?auto_96522 ?auto_96524 ) ) ( not ( = ?auto_96522 ?auto_96525 ) ) ( not ( = ?auto_96522 ?auto_96526 ) ) ( not ( = ?auto_96522 ?auto_96527 ) ) ( not ( = ?auto_96523 ?auto_96524 ) ) ( not ( = ?auto_96523 ?auto_96525 ) ) ( not ( = ?auto_96523 ?auto_96526 ) ) ( not ( = ?auto_96523 ?auto_96527 ) ) ( not ( = ?auto_96524 ?auto_96525 ) ) ( not ( = ?auto_96524 ?auto_96526 ) ) ( not ( = ?auto_96524 ?auto_96527 ) ) ( not ( = ?auto_96525 ?auto_96526 ) ) ( not ( = ?auto_96525 ?auto_96527 ) ) ( not ( = ?auto_96526 ?auto_96527 ) ) ( ON ?auto_96525 ?auto_96526 ) ( ON ?auto_96524 ?auto_96525 ) ( ON ?auto_96523 ?auto_96524 ) ( CLEAR ?auto_96521 ) ( ON ?auto_96522 ?auto_96523 ) ( CLEAR ?auto_96522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96517 ?auto_96518 ?auto_96519 ?auto_96520 ?auto_96521 ?auto_96522 )
      ( MAKE-10PILE ?auto_96517 ?auto_96518 ?auto_96519 ?auto_96520 ?auto_96521 ?auto_96522 ?auto_96523 ?auto_96524 ?auto_96525 ?auto_96526 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96538 - BLOCK
      ?auto_96539 - BLOCK
      ?auto_96540 - BLOCK
      ?auto_96541 - BLOCK
      ?auto_96542 - BLOCK
      ?auto_96543 - BLOCK
      ?auto_96544 - BLOCK
      ?auto_96545 - BLOCK
      ?auto_96546 - BLOCK
      ?auto_96547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96547 ) ( ON-TABLE ?auto_96538 ) ( ON ?auto_96539 ?auto_96538 ) ( ON ?auto_96540 ?auto_96539 ) ( ON ?auto_96541 ?auto_96540 ) ( ON ?auto_96542 ?auto_96541 ) ( not ( = ?auto_96538 ?auto_96539 ) ) ( not ( = ?auto_96538 ?auto_96540 ) ) ( not ( = ?auto_96538 ?auto_96541 ) ) ( not ( = ?auto_96538 ?auto_96542 ) ) ( not ( = ?auto_96538 ?auto_96543 ) ) ( not ( = ?auto_96538 ?auto_96544 ) ) ( not ( = ?auto_96538 ?auto_96545 ) ) ( not ( = ?auto_96538 ?auto_96546 ) ) ( not ( = ?auto_96538 ?auto_96547 ) ) ( not ( = ?auto_96539 ?auto_96540 ) ) ( not ( = ?auto_96539 ?auto_96541 ) ) ( not ( = ?auto_96539 ?auto_96542 ) ) ( not ( = ?auto_96539 ?auto_96543 ) ) ( not ( = ?auto_96539 ?auto_96544 ) ) ( not ( = ?auto_96539 ?auto_96545 ) ) ( not ( = ?auto_96539 ?auto_96546 ) ) ( not ( = ?auto_96539 ?auto_96547 ) ) ( not ( = ?auto_96540 ?auto_96541 ) ) ( not ( = ?auto_96540 ?auto_96542 ) ) ( not ( = ?auto_96540 ?auto_96543 ) ) ( not ( = ?auto_96540 ?auto_96544 ) ) ( not ( = ?auto_96540 ?auto_96545 ) ) ( not ( = ?auto_96540 ?auto_96546 ) ) ( not ( = ?auto_96540 ?auto_96547 ) ) ( not ( = ?auto_96541 ?auto_96542 ) ) ( not ( = ?auto_96541 ?auto_96543 ) ) ( not ( = ?auto_96541 ?auto_96544 ) ) ( not ( = ?auto_96541 ?auto_96545 ) ) ( not ( = ?auto_96541 ?auto_96546 ) ) ( not ( = ?auto_96541 ?auto_96547 ) ) ( not ( = ?auto_96542 ?auto_96543 ) ) ( not ( = ?auto_96542 ?auto_96544 ) ) ( not ( = ?auto_96542 ?auto_96545 ) ) ( not ( = ?auto_96542 ?auto_96546 ) ) ( not ( = ?auto_96542 ?auto_96547 ) ) ( not ( = ?auto_96543 ?auto_96544 ) ) ( not ( = ?auto_96543 ?auto_96545 ) ) ( not ( = ?auto_96543 ?auto_96546 ) ) ( not ( = ?auto_96543 ?auto_96547 ) ) ( not ( = ?auto_96544 ?auto_96545 ) ) ( not ( = ?auto_96544 ?auto_96546 ) ) ( not ( = ?auto_96544 ?auto_96547 ) ) ( not ( = ?auto_96545 ?auto_96546 ) ) ( not ( = ?auto_96545 ?auto_96547 ) ) ( not ( = ?auto_96546 ?auto_96547 ) ) ( ON ?auto_96546 ?auto_96547 ) ( ON ?auto_96545 ?auto_96546 ) ( ON ?auto_96544 ?auto_96545 ) ( CLEAR ?auto_96542 ) ( ON ?auto_96543 ?auto_96544 ) ( CLEAR ?auto_96543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96538 ?auto_96539 ?auto_96540 ?auto_96541 ?auto_96542 ?auto_96543 )
      ( MAKE-10PILE ?auto_96538 ?auto_96539 ?auto_96540 ?auto_96541 ?auto_96542 ?auto_96543 ?auto_96544 ?auto_96545 ?auto_96546 ?auto_96547 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96558 - BLOCK
      ?auto_96559 - BLOCK
      ?auto_96560 - BLOCK
      ?auto_96561 - BLOCK
      ?auto_96562 - BLOCK
      ?auto_96563 - BLOCK
      ?auto_96564 - BLOCK
      ?auto_96565 - BLOCK
      ?auto_96566 - BLOCK
      ?auto_96567 - BLOCK
    )
    :vars
    (
      ?auto_96568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96567 ?auto_96568 ) ( ON-TABLE ?auto_96558 ) ( ON ?auto_96559 ?auto_96558 ) ( ON ?auto_96560 ?auto_96559 ) ( ON ?auto_96561 ?auto_96560 ) ( not ( = ?auto_96558 ?auto_96559 ) ) ( not ( = ?auto_96558 ?auto_96560 ) ) ( not ( = ?auto_96558 ?auto_96561 ) ) ( not ( = ?auto_96558 ?auto_96562 ) ) ( not ( = ?auto_96558 ?auto_96563 ) ) ( not ( = ?auto_96558 ?auto_96564 ) ) ( not ( = ?auto_96558 ?auto_96565 ) ) ( not ( = ?auto_96558 ?auto_96566 ) ) ( not ( = ?auto_96558 ?auto_96567 ) ) ( not ( = ?auto_96558 ?auto_96568 ) ) ( not ( = ?auto_96559 ?auto_96560 ) ) ( not ( = ?auto_96559 ?auto_96561 ) ) ( not ( = ?auto_96559 ?auto_96562 ) ) ( not ( = ?auto_96559 ?auto_96563 ) ) ( not ( = ?auto_96559 ?auto_96564 ) ) ( not ( = ?auto_96559 ?auto_96565 ) ) ( not ( = ?auto_96559 ?auto_96566 ) ) ( not ( = ?auto_96559 ?auto_96567 ) ) ( not ( = ?auto_96559 ?auto_96568 ) ) ( not ( = ?auto_96560 ?auto_96561 ) ) ( not ( = ?auto_96560 ?auto_96562 ) ) ( not ( = ?auto_96560 ?auto_96563 ) ) ( not ( = ?auto_96560 ?auto_96564 ) ) ( not ( = ?auto_96560 ?auto_96565 ) ) ( not ( = ?auto_96560 ?auto_96566 ) ) ( not ( = ?auto_96560 ?auto_96567 ) ) ( not ( = ?auto_96560 ?auto_96568 ) ) ( not ( = ?auto_96561 ?auto_96562 ) ) ( not ( = ?auto_96561 ?auto_96563 ) ) ( not ( = ?auto_96561 ?auto_96564 ) ) ( not ( = ?auto_96561 ?auto_96565 ) ) ( not ( = ?auto_96561 ?auto_96566 ) ) ( not ( = ?auto_96561 ?auto_96567 ) ) ( not ( = ?auto_96561 ?auto_96568 ) ) ( not ( = ?auto_96562 ?auto_96563 ) ) ( not ( = ?auto_96562 ?auto_96564 ) ) ( not ( = ?auto_96562 ?auto_96565 ) ) ( not ( = ?auto_96562 ?auto_96566 ) ) ( not ( = ?auto_96562 ?auto_96567 ) ) ( not ( = ?auto_96562 ?auto_96568 ) ) ( not ( = ?auto_96563 ?auto_96564 ) ) ( not ( = ?auto_96563 ?auto_96565 ) ) ( not ( = ?auto_96563 ?auto_96566 ) ) ( not ( = ?auto_96563 ?auto_96567 ) ) ( not ( = ?auto_96563 ?auto_96568 ) ) ( not ( = ?auto_96564 ?auto_96565 ) ) ( not ( = ?auto_96564 ?auto_96566 ) ) ( not ( = ?auto_96564 ?auto_96567 ) ) ( not ( = ?auto_96564 ?auto_96568 ) ) ( not ( = ?auto_96565 ?auto_96566 ) ) ( not ( = ?auto_96565 ?auto_96567 ) ) ( not ( = ?auto_96565 ?auto_96568 ) ) ( not ( = ?auto_96566 ?auto_96567 ) ) ( not ( = ?auto_96566 ?auto_96568 ) ) ( not ( = ?auto_96567 ?auto_96568 ) ) ( ON ?auto_96566 ?auto_96567 ) ( ON ?auto_96565 ?auto_96566 ) ( ON ?auto_96564 ?auto_96565 ) ( ON ?auto_96563 ?auto_96564 ) ( CLEAR ?auto_96561 ) ( ON ?auto_96562 ?auto_96563 ) ( CLEAR ?auto_96562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96558 ?auto_96559 ?auto_96560 ?auto_96561 ?auto_96562 )
      ( MAKE-10PILE ?auto_96558 ?auto_96559 ?auto_96560 ?auto_96561 ?auto_96562 ?auto_96563 ?auto_96564 ?auto_96565 ?auto_96566 ?auto_96567 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96579 - BLOCK
      ?auto_96580 - BLOCK
      ?auto_96581 - BLOCK
      ?auto_96582 - BLOCK
      ?auto_96583 - BLOCK
      ?auto_96584 - BLOCK
      ?auto_96585 - BLOCK
      ?auto_96586 - BLOCK
      ?auto_96587 - BLOCK
      ?auto_96588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96588 ) ( ON-TABLE ?auto_96579 ) ( ON ?auto_96580 ?auto_96579 ) ( ON ?auto_96581 ?auto_96580 ) ( ON ?auto_96582 ?auto_96581 ) ( not ( = ?auto_96579 ?auto_96580 ) ) ( not ( = ?auto_96579 ?auto_96581 ) ) ( not ( = ?auto_96579 ?auto_96582 ) ) ( not ( = ?auto_96579 ?auto_96583 ) ) ( not ( = ?auto_96579 ?auto_96584 ) ) ( not ( = ?auto_96579 ?auto_96585 ) ) ( not ( = ?auto_96579 ?auto_96586 ) ) ( not ( = ?auto_96579 ?auto_96587 ) ) ( not ( = ?auto_96579 ?auto_96588 ) ) ( not ( = ?auto_96580 ?auto_96581 ) ) ( not ( = ?auto_96580 ?auto_96582 ) ) ( not ( = ?auto_96580 ?auto_96583 ) ) ( not ( = ?auto_96580 ?auto_96584 ) ) ( not ( = ?auto_96580 ?auto_96585 ) ) ( not ( = ?auto_96580 ?auto_96586 ) ) ( not ( = ?auto_96580 ?auto_96587 ) ) ( not ( = ?auto_96580 ?auto_96588 ) ) ( not ( = ?auto_96581 ?auto_96582 ) ) ( not ( = ?auto_96581 ?auto_96583 ) ) ( not ( = ?auto_96581 ?auto_96584 ) ) ( not ( = ?auto_96581 ?auto_96585 ) ) ( not ( = ?auto_96581 ?auto_96586 ) ) ( not ( = ?auto_96581 ?auto_96587 ) ) ( not ( = ?auto_96581 ?auto_96588 ) ) ( not ( = ?auto_96582 ?auto_96583 ) ) ( not ( = ?auto_96582 ?auto_96584 ) ) ( not ( = ?auto_96582 ?auto_96585 ) ) ( not ( = ?auto_96582 ?auto_96586 ) ) ( not ( = ?auto_96582 ?auto_96587 ) ) ( not ( = ?auto_96582 ?auto_96588 ) ) ( not ( = ?auto_96583 ?auto_96584 ) ) ( not ( = ?auto_96583 ?auto_96585 ) ) ( not ( = ?auto_96583 ?auto_96586 ) ) ( not ( = ?auto_96583 ?auto_96587 ) ) ( not ( = ?auto_96583 ?auto_96588 ) ) ( not ( = ?auto_96584 ?auto_96585 ) ) ( not ( = ?auto_96584 ?auto_96586 ) ) ( not ( = ?auto_96584 ?auto_96587 ) ) ( not ( = ?auto_96584 ?auto_96588 ) ) ( not ( = ?auto_96585 ?auto_96586 ) ) ( not ( = ?auto_96585 ?auto_96587 ) ) ( not ( = ?auto_96585 ?auto_96588 ) ) ( not ( = ?auto_96586 ?auto_96587 ) ) ( not ( = ?auto_96586 ?auto_96588 ) ) ( not ( = ?auto_96587 ?auto_96588 ) ) ( ON ?auto_96587 ?auto_96588 ) ( ON ?auto_96586 ?auto_96587 ) ( ON ?auto_96585 ?auto_96586 ) ( ON ?auto_96584 ?auto_96585 ) ( CLEAR ?auto_96582 ) ( ON ?auto_96583 ?auto_96584 ) ( CLEAR ?auto_96583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96579 ?auto_96580 ?auto_96581 ?auto_96582 ?auto_96583 )
      ( MAKE-10PILE ?auto_96579 ?auto_96580 ?auto_96581 ?auto_96582 ?auto_96583 ?auto_96584 ?auto_96585 ?auto_96586 ?auto_96587 ?auto_96588 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96599 - BLOCK
      ?auto_96600 - BLOCK
      ?auto_96601 - BLOCK
      ?auto_96602 - BLOCK
      ?auto_96603 - BLOCK
      ?auto_96604 - BLOCK
      ?auto_96605 - BLOCK
      ?auto_96606 - BLOCK
      ?auto_96607 - BLOCK
      ?auto_96608 - BLOCK
    )
    :vars
    (
      ?auto_96609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96608 ?auto_96609 ) ( ON-TABLE ?auto_96599 ) ( ON ?auto_96600 ?auto_96599 ) ( ON ?auto_96601 ?auto_96600 ) ( not ( = ?auto_96599 ?auto_96600 ) ) ( not ( = ?auto_96599 ?auto_96601 ) ) ( not ( = ?auto_96599 ?auto_96602 ) ) ( not ( = ?auto_96599 ?auto_96603 ) ) ( not ( = ?auto_96599 ?auto_96604 ) ) ( not ( = ?auto_96599 ?auto_96605 ) ) ( not ( = ?auto_96599 ?auto_96606 ) ) ( not ( = ?auto_96599 ?auto_96607 ) ) ( not ( = ?auto_96599 ?auto_96608 ) ) ( not ( = ?auto_96599 ?auto_96609 ) ) ( not ( = ?auto_96600 ?auto_96601 ) ) ( not ( = ?auto_96600 ?auto_96602 ) ) ( not ( = ?auto_96600 ?auto_96603 ) ) ( not ( = ?auto_96600 ?auto_96604 ) ) ( not ( = ?auto_96600 ?auto_96605 ) ) ( not ( = ?auto_96600 ?auto_96606 ) ) ( not ( = ?auto_96600 ?auto_96607 ) ) ( not ( = ?auto_96600 ?auto_96608 ) ) ( not ( = ?auto_96600 ?auto_96609 ) ) ( not ( = ?auto_96601 ?auto_96602 ) ) ( not ( = ?auto_96601 ?auto_96603 ) ) ( not ( = ?auto_96601 ?auto_96604 ) ) ( not ( = ?auto_96601 ?auto_96605 ) ) ( not ( = ?auto_96601 ?auto_96606 ) ) ( not ( = ?auto_96601 ?auto_96607 ) ) ( not ( = ?auto_96601 ?auto_96608 ) ) ( not ( = ?auto_96601 ?auto_96609 ) ) ( not ( = ?auto_96602 ?auto_96603 ) ) ( not ( = ?auto_96602 ?auto_96604 ) ) ( not ( = ?auto_96602 ?auto_96605 ) ) ( not ( = ?auto_96602 ?auto_96606 ) ) ( not ( = ?auto_96602 ?auto_96607 ) ) ( not ( = ?auto_96602 ?auto_96608 ) ) ( not ( = ?auto_96602 ?auto_96609 ) ) ( not ( = ?auto_96603 ?auto_96604 ) ) ( not ( = ?auto_96603 ?auto_96605 ) ) ( not ( = ?auto_96603 ?auto_96606 ) ) ( not ( = ?auto_96603 ?auto_96607 ) ) ( not ( = ?auto_96603 ?auto_96608 ) ) ( not ( = ?auto_96603 ?auto_96609 ) ) ( not ( = ?auto_96604 ?auto_96605 ) ) ( not ( = ?auto_96604 ?auto_96606 ) ) ( not ( = ?auto_96604 ?auto_96607 ) ) ( not ( = ?auto_96604 ?auto_96608 ) ) ( not ( = ?auto_96604 ?auto_96609 ) ) ( not ( = ?auto_96605 ?auto_96606 ) ) ( not ( = ?auto_96605 ?auto_96607 ) ) ( not ( = ?auto_96605 ?auto_96608 ) ) ( not ( = ?auto_96605 ?auto_96609 ) ) ( not ( = ?auto_96606 ?auto_96607 ) ) ( not ( = ?auto_96606 ?auto_96608 ) ) ( not ( = ?auto_96606 ?auto_96609 ) ) ( not ( = ?auto_96607 ?auto_96608 ) ) ( not ( = ?auto_96607 ?auto_96609 ) ) ( not ( = ?auto_96608 ?auto_96609 ) ) ( ON ?auto_96607 ?auto_96608 ) ( ON ?auto_96606 ?auto_96607 ) ( ON ?auto_96605 ?auto_96606 ) ( ON ?auto_96604 ?auto_96605 ) ( ON ?auto_96603 ?auto_96604 ) ( CLEAR ?auto_96601 ) ( ON ?auto_96602 ?auto_96603 ) ( CLEAR ?auto_96602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96599 ?auto_96600 ?auto_96601 ?auto_96602 )
      ( MAKE-10PILE ?auto_96599 ?auto_96600 ?auto_96601 ?auto_96602 ?auto_96603 ?auto_96604 ?auto_96605 ?auto_96606 ?auto_96607 ?auto_96608 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96620 - BLOCK
      ?auto_96621 - BLOCK
      ?auto_96622 - BLOCK
      ?auto_96623 - BLOCK
      ?auto_96624 - BLOCK
      ?auto_96625 - BLOCK
      ?auto_96626 - BLOCK
      ?auto_96627 - BLOCK
      ?auto_96628 - BLOCK
      ?auto_96629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96629 ) ( ON-TABLE ?auto_96620 ) ( ON ?auto_96621 ?auto_96620 ) ( ON ?auto_96622 ?auto_96621 ) ( not ( = ?auto_96620 ?auto_96621 ) ) ( not ( = ?auto_96620 ?auto_96622 ) ) ( not ( = ?auto_96620 ?auto_96623 ) ) ( not ( = ?auto_96620 ?auto_96624 ) ) ( not ( = ?auto_96620 ?auto_96625 ) ) ( not ( = ?auto_96620 ?auto_96626 ) ) ( not ( = ?auto_96620 ?auto_96627 ) ) ( not ( = ?auto_96620 ?auto_96628 ) ) ( not ( = ?auto_96620 ?auto_96629 ) ) ( not ( = ?auto_96621 ?auto_96622 ) ) ( not ( = ?auto_96621 ?auto_96623 ) ) ( not ( = ?auto_96621 ?auto_96624 ) ) ( not ( = ?auto_96621 ?auto_96625 ) ) ( not ( = ?auto_96621 ?auto_96626 ) ) ( not ( = ?auto_96621 ?auto_96627 ) ) ( not ( = ?auto_96621 ?auto_96628 ) ) ( not ( = ?auto_96621 ?auto_96629 ) ) ( not ( = ?auto_96622 ?auto_96623 ) ) ( not ( = ?auto_96622 ?auto_96624 ) ) ( not ( = ?auto_96622 ?auto_96625 ) ) ( not ( = ?auto_96622 ?auto_96626 ) ) ( not ( = ?auto_96622 ?auto_96627 ) ) ( not ( = ?auto_96622 ?auto_96628 ) ) ( not ( = ?auto_96622 ?auto_96629 ) ) ( not ( = ?auto_96623 ?auto_96624 ) ) ( not ( = ?auto_96623 ?auto_96625 ) ) ( not ( = ?auto_96623 ?auto_96626 ) ) ( not ( = ?auto_96623 ?auto_96627 ) ) ( not ( = ?auto_96623 ?auto_96628 ) ) ( not ( = ?auto_96623 ?auto_96629 ) ) ( not ( = ?auto_96624 ?auto_96625 ) ) ( not ( = ?auto_96624 ?auto_96626 ) ) ( not ( = ?auto_96624 ?auto_96627 ) ) ( not ( = ?auto_96624 ?auto_96628 ) ) ( not ( = ?auto_96624 ?auto_96629 ) ) ( not ( = ?auto_96625 ?auto_96626 ) ) ( not ( = ?auto_96625 ?auto_96627 ) ) ( not ( = ?auto_96625 ?auto_96628 ) ) ( not ( = ?auto_96625 ?auto_96629 ) ) ( not ( = ?auto_96626 ?auto_96627 ) ) ( not ( = ?auto_96626 ?auto_96628 ) ) ( not ( = ?auto_96626 ?auto_96629 ) ) ( not ( = ?auto_96627 ?auto_96628 ) ) ( not ( = ?auto_96627 ?auto_96629 ) ) ( not ( = ?auto_96628 ?auto_96629 ) ) ( ON ?auto_96628 ?auto_96629 ) ( ON ?auto_96627 ?auto_96628 ) ( ON ?auto_96626 ?auto_96627 ) ( ON ?auto_96625 ?auto_96626 ) ( ON ?auto_96624 ?auto_96625 ) ( CLEAR ?auto_96622 ) ( ON ?auto_96623 ?auto_96624 ) ( CLEAR ?auto_96623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96620 ?auto_96621 ?auto_96622 ?auto_96623 )
      ( MAKE-10PILE ?auto_96620 ?auto_96621 ?auto_96622 ?auto_96623 ?auto_96624 ?auto_96625 ?auto_96626 ?auto_96627 ?auto_96628 ?auto_96629 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96640 - BLOCK
      ?auto_96641 - BLOCK
      ?auto_96642 - BLOCK
      ?auto_96643 - BLOCK
      ?auto_96644 - BLOCK
      ?auto_96645 - BLOCK
      ?auto_96646 - BLOCK
      ?auto_96647 - BLOCK
      ?auto_96648 - BLOCK
      ?auto_96649 - BLOCK
    )
    :vars
    (
      ?auto_96650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96649 ?auto_96650 ) ( ON-TABLE ?auto_96640 ) ( ON ?auto_96641 ?auto_96640 ) ( not ( = ?auto_96640 ?auto_96641 ) ) ( not ( = ?auto_96640 ?auto_96642 ) ) ( not ( = ?auto_96640 ?auto_96643 ) ) ( not ( = ?auto_96640 ?auto_96644 ) ) ( not ( = ?auto_96640 ?auto_96645 ) ) ( not ( = ?auto_96640 ?auto_96646 ) ) ( not ( = ?auto_96640 ?auto_96647 ) ) ( not ( = ?auto_96640 ?auto_96648 ) ) ( not ( = ?auto_96640 ?auto_96649 ) ) ( not ( = ?auto_96640 ?auto_96650 ) ) ( not ( = ?auto_96641 ?auto_96642 ) ) ( not ( = ?auto_96641 ?auto_96643 ) ) ( not ( = ?auto_96641 ?auto_96644 ) ) ( not ( = ?auto_96641 ?auto_96645 ) ) ( not ( = ?auto_96641 ?auto_96646 ) ) ( not ( = ?auto_96641 ?auto_96647 ) ) ( not ( = ?auto_96641 ?auto_96648 ) ) ( not ( = ?auto_96641 ?auto_96649 ) ) ( not ( = ?auto_96641 ?auto_96650 ) ) ( not ( = ?auto_96642 ?auto_96643 ) ) ( not ( = ?auto_96642 ?auto_96644 ) ) ( not ( = ?auto_96642 ?auto_96645 ) ) ( not ( = ?auto_96642 ?auto_96646 ) ) ( not ( = ?auto_96642 ?auto_96647 ) ) ( not ( = ?auto_96642 ?auto_96648 ) ) ( not ( = ?auto_96642 ?auto_96649 ) ) ( not ( = ?auto_96642 ?auto_96650 ) ) ( not ( = ?auto_96643 ?auto_96644 ) ) ( not ( = ?auto_96643 ?auto_96645 ) ) ( not ( = ?auto_96643 ?auto_96646 ) ) ( not ( = ?auto_96643 ?auto_96647 ) ) ( not ( = ?auto_96643 ?auto_96648 ) ) ( not ( = ?auto_96643 ?auto_96649 ) ) ( not ( = ?auto_96643 ?auto_96650 ) ) ( not ( = ?auto_96644 ?auto_96645 ) ) ( not ( = ?auto_96644 ?auto_96646 ) ) ( not ( = ?auto_96644 ?auto_96647 ) ) ( not ( = ?auto_96644 ?auto_96648 ) ) ( not ( = ?auto_96644 ?auto_96649 ) ) ( not ( = ?auto_96644 ?auto_96650 ) ) ( not ( = ?auto_96645 ?auto_96646 ) ) ( not ( = ?auto_96645 ?auto_96647 ) ) ( not ( = ?auto_96645 ?auto_96648 ) ) ( not ( = ?auto_96645 ?auto_96649 ) ) ( not ( = ?auto_96645 ?auto_96650 ) ) ( not ( = ?auto_96646 ?auto_96647 ) ) ( not ( = ?auto_96646 ?auto_96648 ) ) ( not ( = ?auto_96646 ?auto_96649 ) ) ( not ( = ?auto_96646 ?auto_96650 ) ) ( not ( = ?auto_96647 ?auto_96648 ) ) ( not ( = ?auto_96647 ?auto_96649 ) ) ( not ( = ?auto_96647 ?auto_96650 ) ) ( not ( = ?auto_96648 ?auto_96649 ) ) ( not ( = ?auto_96648 ?auto_96650 ) ) ( not ( = ?auto_96649 ?auto_96650 ) ) ( ON ?auto_96648 ?auto_96649 ) ( ON ?auto_96647 ?auto_96648 ) ( ON ?auto_96646 ?auto_96647 ) ( ON ?auto_96645 ?auto_96646 ) ( ON ?auto_96644 ?auto_96645 ) ( ON ?auto_96643 ?auto_96644 ) ( CLEAR ?auto_96641 ) ( ON ?auto_96642 ?auto_96643 ) ( CLEAR ?auto_96642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96640 ?auto_96641 ?auto_96642 )
      ( MAKE-10PILE ?auto_96640 ?auto_96641 ?auto_96642 ?auto_96643 ?auto_96644 ?auto_96645 ?auto_96646 ?auto_96647 ?auto_96648 ?auto_96649 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96661 - BLOCK
      ?auto_96662 - BLOCK
      ?auto_96663 - BLOCK
      ?auto_96664 - BLOCK
      ?auto_96665 - BLOCK
      ?auto_96666 - BLOCK
      ?auto_96667 - BLOCK
      ?auto_96668 - BLOCK
      ?auto_96669 - BLOCK
      ?auto_96670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96670 ) ( ON-TABLE ?auto_96661 ) ( ON ?auto_96662 ?auto_96661 ) ( not ( = ?auto_96661 ?auto_96662 ) ) ( not ( = ?auto_96661 ?auto_96663 ) ) ( not ( = ?auto_96661 ?auto_96664 ) ) ( not ( = ?auto_96661 ?auto_96665 ) ) ( not ( = ?auto_96661 ?auto_96666 ) ) ( not ( = ?auto_96661 ?auto_96667 ) ) ( not ( = ?auto_96661 ?auto_96668 ) ) ( not ( = ?auto_96661 ?auto_96669 ) ) ( not ( = ?auto_96661 ?auto_96670 ) ) ( not ( = ?auto_96662 ?auto_96663 ) ) ( not ( = ?auto_96662 ?auto_96664 ) ) ( not ( = ?auto_96662 ?auto_96665 ) ) ( not ( = ?auto_96662 ?auto_96666 ) ) ( not ( = ?auto_96662 ?auto_96667 ) ) ( not ( = ?auto_96662 ?auto_96668 ) ) ( not ( = ?auto_96662 ?auto_96669 ) ) ( not ( = ?auto_96662 ?auto_96670 ) ) ( not ( = ?auto_96663 ?auto_96664 ) ) ( not ( = ?auto_96663 ?auto_96665 ) ) ( not ( = ?auto_96663 ?auto_96666 ) ) ( not ( = ?auto_96663 ?auto_96667 ) ) ( not ( = ?auto_96663 ?auto_96668 ) ) ( not ( = ?auto_96663 ?auto_96669 ) ) ( not ( = ?auto_96663 ?auto_96670 ) ) ( not ( = ?auto_96664 ?auto_96665 ) ) ( not ( = ?auto_96664 ?auto_96666 ) ) ( not ( = ?auto_96664 ?auto_96667 ) ) ( not ( = ?auto_96664 ?auto_96668 ) ) ( not ( = ?auto_96664 ?auto_96669 ) ) ( not ( = ?auto_96664 ?auto_96670 ) ) ( not ( = ?auto_96665 ?auto_96666 ) ) ( not ( = ?auto_96665 ?auto_96667 ) ) ( not ( = ?auto_96665 ?auto_96668 ) ) ( not ( = ?auto_96665 ?auto_96669 ) ) ( not ( = ?auto_96665 ?auto_96670 ) ) ( not ( = ?auto_96666 ?auto_96667 ) ) ( not ( = ?auto_96666 ?auto_96668 ) ) ( not ( = ?auto_96666 ?auto_96669 ) ) ( not ( = ?auto_96666 ?auto_96670 ) ) ( not ( = ?auto_96667 ?auto_96668 ) ) ( not ( = ?auto_96667 ?auto_96669 ) ) ( not ( = ?auto_96667 ?auto_96670 ) ) ( not ( = ?auto_96668 ?auto_96669 ) ) ( not ( = ?auto_96668 ?auto_96670 ) ) ( not ( = ?auto_96669 ?auto_96670 ) ) ( ON ?auto_96669 ?auto_96670 ) ( ON ?auto_96668 ?auto_96669 ) ( ON ?auto_96667 ?auto_96668 ) ( ON ?auto_96666 ?auto_96667 ) ( ON ?auto_96665 ?auto_96666 ) ( ON ?auto_96664 ?auto_96665 ) ( CLEAR ?auto_96662 ) ( ON ?auto_96663 ?auto_96664 ) ( CLEAR ?auto_96663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96661 ?auto_96662 ?auto_96663 )
      ( MAKE-10PILE ?auto_96661 ?auto_96662 ?auto_96663 ?auto_96664 ?auto_96665 ?auto_96666 ?auto_96667 ?auto_96668 ?auto_96669 ?auto_96670 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96681 - BLOCK
      ?auto_96682 - BLOCK
      ?auto_96683 - BLOCK
      ?auto_96684 - BLOCK
      ?auto_96685 - BLOCK
      ?auto_96686 - BLOCK
      ?auto_96687 - BLOCK
      ?auto_96688 - BLOCK
      ?auto_96689 - BLOCK
      ?auto_96690 - BLOCK
    )
    :vars
    (
      ?auto_96691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96690 ?auto_96691 ) ( ON-TABLE ?auto_96681 ) ( not ( = ?auto_96681 ?auto_96682 ) ) ( not ( = ?auto_96681 ?auto_96683 ) ) ( not ( = ?auto_96681 ?auto_96684 ) ) ( not ( = ?auto_96681 ?auto_96685 ) ) ( not ( = ?auto_96681 ?auto_96686 ) ) ( not ( = ?auto_96681 ?auto_96687 ) ) ( not ( = ?auto_96681 ?auto_96688 ) ) ( not ( = ?auto_96681 ?auto_96689 ) ) ( not ( = ?auto_96681 ?auto_96690 ) ) ( not ( = ?auto_96681 ?auto_96691 ) ) ( not ( = ?auto_96682 ?auto_96683 ) ) ( not ( = ?auto_96682 ?auto_96684 ) ) ( not ( = ?auto_96682 ?auto_96685 ) ) ( not ( = ?auto_96682 ?auto_96686 ) ) ( not ( = ?auto_96682 ?auto_96687 ) ) ( not ( = ?auto_96682 ?auto_96688 ) ) ( not ( = ?auto_96682 ?auto_96689 ) ) ( not ( = ?auto_96682 ?auto_96690 ) ) ( not ( = ?auto_96682 ?auto_96691 ) ) ( not ( = ?auto_96683 ?auto_96684 ) ) ( not ( = ?auto_96683 ?auto_96685 ) ) ( not ( = ?auto_96683 ?auto_96686 ) ) ( not ( = ?auto_96683 ?auto_96687 ) ) ( not ( = ?auto_96683 ?auto_96688 ) ) ( not ( = ?auto_96683 ?auto_96689 ) ) ( not ( = ?auto_96683 ?auto_96690 ) ) ( not ( = ?auto_96683 ?auto_96691 ) ) ( not ( = ?auto_96684 ?auto_96685 ) ) ( not ( = ?auto_96684 ?auto_96686 ) ) ( not ( = ?auto_96684 ?auto_96687 ) ) ( not ( = ?auto_96684 ?auto_96688 ) ) ( not ( = ?auto_96684 ?auto_96689 ) ) ( not ( = ?auto_96684 ?auto_96690 ) ) ( not ( = ?auto_96684 ?auto_96691 ) ) ( not ( = ?auto_96685 ?auto_96686 ) ) ( not ( = ?auto_96685 ?auto_96687 ) ) ( not ( = ?auto_96685 ?auto_96688 ) ) ( not ( = ?auto_96685 ?auto_96689 ) ) ( not ( = ?auto_96685 ?auto_96690 ) ) ( not ( = ?auto_96685 ?auto_96691 ) ) ( not ( = ?auto_96686 ?auto_96687 ) ) ( not ( = ?auto_96686 ?auto_96688 ) ) ( not ( = ?auto_96686 ?auto_96689 ) ) ( not ( = ?auto_96686 ?auto_96690 ) ) ( not ( = ?auto_96686 ?auto_96691 ) ) ( not ( = ?auto_96687 ?auto_96688 ) ) ( not ( = ?auto_96687 ?auto_96689 ) ) ( not ( = ?auto_96687 ?auto_96690 ) ) ( not ( = ?auto_96687 ?auto_96691 ) ) ( not ( = ?auto_96688 ?auto_96689 ) ) ( not ( = ?auto_96688 ?auto_96690 ) ) ( not ( = ?auto_96688 ?auto_96691 ) ) ( not ( = ?auto_96689 ?auto_96690 ) ) ( not ( = ?auto_96689 ?auto_96691 ) ) ( not ( = ?auto_96690 ?auto_96691 ) ) ( ON ?auto_96689 ?auto_96690 ) ( ON ?auto_96688 ?auto_96689 ) ( ON ?auto_96687 ?auto_96688 ) ( ON ?auto_96686 ?auto_96687 ) ( ON ?auto_96685 ?auto_96686 ) ( ON ?auto_96684 ?auto_96685 ) ( ON ?auto_96683 ?auto_96684 ) ( CLEAR ?auto_96681 ) ( ON ?auto_96682 ?auto_96683 ) ( CLEAR ?auto_96682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96681 ?auto_96682 )
      ( MAKE-10PILE ?auto_96681 ?auto_96682 ?auto_96683 ?auto_96684 ?auto_96685 ?auto_96686 ?auto_96687 ?auto_96688 ?auto_96689 ?auto_96690 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96702 - BLOCK
      ?auto_96703 - BLOCK
      ?auto_96704 - BLOCK
      ?auto_96705 - BLOCK
      ?auto_96706 - BLOCK
      ?auto_96707 - BLOCK
      ?auto_96708 - BLOCK
      ?auto_96709 - BLOCK
      ?auto_96710 - BLOCK
      ?auto_96711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96711 ) ( ON-TABLE ?auto_96702 ) ( not ( = ?auto_96702 ?auto_96703 ) ) ( not ( = ?auto_96702 ?auto_96704 ) ) ( not ( = ?auto_96702 ?auto_96705 ) ) ( not ( = ?auto_96702 ?auto_96706 ) ) ( not ( = ?auto_96702 ?auto_96707 ) ) ( not ( = ?auto_96702 ?auto_96708 ) ) ( not ( = ?auto_96702 ?auto_96709 ) ) ( not ( = ?auto_96702 ?auto_96710 ) ) ( not ( = ?auto_96702 ?auto_96711 ) ) ( not ( = ?auto_96703 ?auto_96704 ) ) ( not ( = ?auto_96703 ?auto_96705 ) ) ( not ( = ?auto_96703 ?auto_96706 ) ) ( not ( = ?auto_96703 ?auto_96707 ) ) ( not ( = ?auto_96703 ?auto_96708 ) ) ( not ( = ?auto_96703 ?auto_96709 ) ) ( not ( = ?auto_96703 ?auto_96710 ) ) ( not ( = ?auto_96703 ?auto_96711 ) ) ( not ( = ?auto_96704 ?auto_96705 ) ) ( not ( = ?auto_96704 ?auto_96706 ) ) ( not ( = ?auto_96704 ?auto_96707 ) ) ( not ( = ?auto_96704 ?auto_96708 ) ) ( not ( = ?auto_96704 ?auto_96709 ) ) ( not ( = ?auto_96704 ?auto_96710 ) ) ( not ( = ?auto_96704 ?auto_96711 ) ) ( not ( = ?auto_96705 ?auto_96706 ) ) ( not ( = ?auto_96705 ?auto_96707 ) ) ( not ( = ?auto_96705 ?auto_96708 ) ) ( not ( = ?auto_96705 ?auto_96709 ) ) ( not ( = ?auto_96705 ?auto_96710 ) ) ( not ( = ?auto_96705 ?auto_96711 ) ) ( not ( = ?auto_96706 ?auto_96707 ) ) ( not ( = ?auto_96706 ?auto_96708 ) ) ( not ( = ?auto_96706 ?auto_96709 ) ) ( not ( = ?auto_96706 ?auto_96710 ) ) ( not ( = ?auto_96706 ?auto_96711 ) ) ( not ( = ?auto_96707 ?auto_96708 ) ) ( not ( = ?auto_96707 ?auto_96709 ) ) ( not ( = ?auto_96707 ?auto_96710 ) ) ( not ( = ?auto_96707 ?auto_96711 ) ) ( not ( = ?auto_96708 ?auto_96709 ) ) ( not ( = ?auto_96708 ?auto_96710 ) ) ( not ( = ?auto_96708 ?auto_96711 ) ) ( not ( = ?auto_96709 ?auto_96710 ) ) ( not ( = ?auto_96709 ?auto_96711 ) ) ( not ( = ?auto_96710 ?auto_96711 ) ) ( ON ?auto_96710 ?auto_96711 ) ( ON ?auto_96709 ?auto_96710 ) ( ON ?auto_96708 ?auto_96709 ) ( ON ?auto_96707 ?auto_96708 ) ( ON ?auto_96706 ?auto_96707 ) ( ON ?auto_96705 ?auto_96706 ) ( ON ?auto_96704 ?auto_96705 ) ( CLEAR ?auto_96702 ) ( ON ?auto_96703 ?auto_96704 ) ( CLEAR ?auto_96703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96702 ?auto_96703 )
      ( MAKE-10PILE ?auto_96702 ?auto_96703 ?auto_96704 ?auto_96705 ?auto_96706 ?auto_96707 ?auto_96708 ?auto_96709 ?auto_96710 ?auto_96711 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96722 - BLOCK
      ?auto_96723 - BLOCK
      ?auto_96724 - BLOCK
      ?auto_96725 - BLOCK
      ?auto_96726 - BLOCK
      ?auto_96727 - BLOCK
      ?auto_96728 - BLOCK
      ?auto_96729 - BLOCK
      ?auto_96730 - BLOCK
      ?auto_96731 - BLOCK
    )
    :vars
    (
      ?auto_96732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96731 ?auto_96732 ) ( not ( = ?auto_96722 ?auto_96723 ) ) ( not ( = ?auto_96722 ?auto_96724 ) ) ( not ( = ?auto_96722 ?auto_96725 ) ) ( not ( = ?auto_96722 ?auto_96726 ) ) ( not ( = ?auto_96722 ?auto_96727 ) ) ( not ( = ?auto_96722 ?auto_96728 ) ) ( not ( = ?auto_96722 ?auto_96729 ) ) ( not ( = ?auto_96722 ?auto_96730 ) ) ( not ( = ?auto_96722 ?auto_96731 ) ) ( not ( = ?auto_96722 ?auto_96732 ) ) ( not ( = ?auto_96723 ?auto_96724 ) ) ( not ( = ?auto_96723 ?auto_96725 ) ) ( not ( = ?auto_96723 ?auto_96726 ) ) ( not ( = ?auto_96723 ?auto_96727 ) ) ( not ( = ?auto_96723 ?auto_96728 ) ) ( not ( = ?auto_96723 ?auto_96729 ) ) ( not ( = ?auto_96723 ?auto_96730 ) ) ( not ( = ?auto_96723 ?auto_96731 ) ) ( not ( = ?auto_96723 ?auto_96732 ) ) ( not ( = ?auto_96724 ?auto_96725 ) ) ( not ( = ?auto_96724 ?auto_96726 ) ) ( not ( = ?auto_96724 ?auto_96727 ) ) ( not ( = ?auto_96724 ?auto_96728 ) ) ( not ( = ?auto_96724 ?auto_96729 ) ) ( not ( = ?auto_96724 ?auto_96730 ) ) ( not ( = ?auto_96724 ?auto_96731 ) ) ( not ( = ?auto_96724 ?auto_96732 ) ) ( not ( = ?auto_96725 ?auto_96726 ) ) ( not ( = ?auto_96725 ?auto_96727 ) ) ( not ( = ?auto_96725 ?auto_96728 ) ) ( not ( = ?auto_96725 ?auto_96729 ) ) ( not ( = ?auto_96725 ?auto_96730 ) ) ( not ( = ?auto_96725 ?auto_96731 ) ) ( not ( = ?auto_96725 ?auto_96732 ) ) ( not ( = ?auto_96726 ?auto_96727 ) ) ( not ( = ?auto_96726 ?auto_96728 ) ) ( not ( = ?auto_96726 ?auto_96729 ) ) ( not ( = ?auto_96726 ?auto_96730 ) ) ( not ( = ?auto_96726 ?auto_96731 ) ) ( not ( = ?auto_96726 ?auto_96732 ) ) ( not ( = ?auto_96727 ?auto_96728 ) ) ( not ( = ?auto_96727 ?auto_96729 ) ) ( not ( = ?auto_96727 ?auto_96730 ) ) ( not ( = ?auto_96727 ?auto_96731 ) ) ( not ( = ?auto_96727 ?auto_96732 ) ) ( not ( = ?auto_96728 ?auto_96729 ) ) ( not ( = ?auto_96728 ?auto_96730 ) ) ( not ( = ?auto_96728 ?auto_96731 ) ) ( not ( = ?auto_96728 ?auto_96732 ) ) ( not ( = ?auto_96729 ?auto_96730 ) ) ( not ( = ?auto_96729 ?auto_96731 ) ) ( not ( = ?auto_96729 ?auto_96732 ) ) ( not ( = ?auto_96730 ?auto_96731 ) ) ( not ( = ?auto_96730 ?auto_96732 ) ) ( not ( = ?auto_96731 ?auto_96732 ) ) ( ON ?auto_96730 ?auto_96731 ) ( ON ?auto_96729 ?auto_96730 ) ( ON ?auto_96728 ?auto_96729 ) ( ON ?auto_96727 ?auto_96728 ) ( ON ?auto_96726 ?auto_96727 ) ( ON ?auto_96725 ?auto_96726 ) ( ON ?auto_96724 ?auto_96725 ) ( ON ?auto_96723 ?auto_96724 ) ( ON ?auto_96722 ?auto_96723 ) ( CLEAR ?auto_96722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96722 )
      ( MAKE-10PILE ?auto_96722 ?auto_96723 ?auto_96724 ?auto_96725 ?auto_96726 ?auto_96727 ?auto_96728 ?auto_96729 ?auto_96730 ?auto_96731 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96743 - BLOCK
      ?auto_96744 - BLOCK
      ?auto_96745 - BLOCK
      ?auto_96746 - BLOCK
      ?auto_96747 - BLOCK
      ?auto_96748 - BLOCK
      ?auto_96749 - BLOCK
      ?auto_96750 - BLOCK
      ?auto_96751 - BLOCK
      ?auto_96752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96752 ) ( not ( = ?auto_96743 ?auto_96744 ) ) ( not ( = ?auto_96743 ?auto_96745 ) ) ( not ( = ?auto_96743 ?auto_96746 ) ) ( not ( = ?auto_96743 ?auto_96747 ) ) ( not ( = ?auto_96743 ?auto_96748 ) ) ( not ( = ?auto_96743 ?auto_96749 ) ) ( not ( = ?auto_96743 ?auto_96750 ) ) ( not ( = ?auto_96743 ?auto_96751 ) ) ( not ( = ?auto_96743 ?auto_96752 ) ) ( not ( = ?auto_96744 ?auto_96745 ) ) ( not ( = ?auto_96744 ?auto_96746 ) ) ( not ( = ?auto_96744 ?auto_96747 ) ) ( not ( = ?auto_96744 ?auto_96748 ) ) ( not ( = ?auto_96744 ?auto_96749 ) ) ( not ( = ?auto_96744 ?auto_96750 ) ) ( not ( = ?auto_96744 ?auto_96751 ) ) ( not ( = ?auto_96744 ?auto_96752 ) ) ( not ( = ?auto_96745 ?auto_96746 ) ) ( not ( = ?auto_96745 ?auto_96747 ) ) ( not ( = ?auto_96745 ?auto_96748 ) ) ( not ( = ?auto_96745 ?auto_96749 ) ) ( not ( = ?auto_96745 ?auto_96750 ) ) ( not ( = ?auto_96745 ?auto_96751 ) ) ( not ( = ?auto_96745 ?auto_96752 ) ) ( not ( = ?auto_96746 ?auto_96747 ) ) ( not ( = ?auto_96746 ?auto_96748 ) ) ( not ( = ?auto_96746 ?auto_96749 ) ) ( not ( = ?auto_96746 ?auto_96750 ) ) ( not ( = ?auto_96746 ?auto_96751 ) ) ( not ( = ?auto_96746 ?auto_96752 ) ) ( not ( = ?auto_96747 ?auto_96748 ) ) ( not ( = ?auto_96747 ?auto_96749 ) ) ( not ( = ?auto_96747 ?auto_96750 ) ) ( not ( = ?auto_96747 ?auto_96751 ) ) ( not ( = ?auto_96747 ?auto_96752 ) ) ( not ( = ?auto_96748 ?auto_96749 ) ) ( not ( = ?auto_96748 ?auto_96750 ) ) ( not ( = ?auto_96748 ?auto_96751 ) ) ( not ( = ?auto_96748 ?auto_96752 ) ) ( not ( = ?auto_96749 ?auto_96750 ) ) ( not ( = ?auto_96749 ?auto_96751 ) ) ( not ( = ?auto_96749 ?auto_96752 ) ) ( not ( = ?auto_96750 ?auto_96751 ) ) ( not ( = ?auto_96750 ?auto_96752 ) ) ( not ( = ?auto_96751 ?auto_96752 ) ) ( ON ?auto_96751 ?auto_96752 ) ( ON ?auto_96750 ?auto_96751 ) ( ON ?auto_96749 ?auto_96750 ) ( ON ?auto_96748 ?auto_96749 ) ( ON ?auto_96747 ?auto_96748 ) ( ON ?auto_96746 ?auto_96747 ) ( ON ?auto_96745 ?auto_96746 ) ( ON ?auto_96744 ?auto_96745 ) ( ON ?auto_96743 ?auto_96744 ) ( CLEAR ?auto_96743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96743 )
      ( MAKE-10PILE ?auto_96743 ?auto_96744 ?auto_96745 ?auto_96746 ?auto_96747 ?auto_96748 ?auto_96749 ?auto_96750 ?auto_96751 ?auto_96752 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_96763 - BLOCK
      ?auto_96764 - BLOCK
      ?auto_96765 - BLOCK
      ?auto_96766 - BLOCK
      ?auto_96767 - BLOCK
      ?auto_96768 - BLOCK
      ?auto_96769 - BLOCK
      ?auto_96770 - BLOCK
      ?auto_96771 - BLOCK
      ?auto_96772 - BLOCK
    )
    :vars
    (
      ?auto_96773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96763 ?auto_96764 ) ) ( not ( = ?auto_96763 ?auto_96765 ) ) ( not ( = ?auto_96763 ?auto_96766 ) ) ( not ( = ?auto_96763 ?auto_96767 ) ) ( not ( = ?auto_96763 ?auto_96768 ) ) ( not ( = ?auto_96763 ?auto_96769 ) ) ( not ( = ?auto_96763 ?auto_96770 ) ) ( not ( = ?auto_96763 ?auto_96771 ) ) ( not ( = ?auto_96763 ?auto_96772 ) ) ( not ( = ?auto_96764 ?auto_96765 ) ) ( not ( = ?auto_96764 ?auto_96766 ) ) ( not ( = ?auto_96764 ?auto_96767 ) ) ( not ( = ?auto_96764 ?auto_96768 ) ) ( not ( = ?auto_96764 ?auto_96769 ) ) ( not ( = ?auto_96764 ?auto_96770 ) ) ( not ( = ?auto_96764 ?auto_96771 ) ) ( not ( = ?auto_96764 ?auto_96772 ) ) ( not ( = ?auto_96765 ?auto_96766 ) ) ( not ( = ?auto_96765 ?auto_96767 ) ) ( not ( = ?auto_96765 ?auto_96768 ) ) ( not ( = ?auto_96765 ?auto_96769 ) ) ( not ( = ?auto_96765 ?auto_96770 ) ) ( not ( = ?auto_96765 ?auto_96771 ) ) ( not ( = ?auto_96765 ?auto_96772 ) ) ( not ( = ?auto_96766 ?auto_96767 ) ) ( not ( = ?auto_96766 ?auto_96768 ) ) ( not ( = ?auto_96766 ?auto_96769 ) ) ( not ( = ?auto_96766 ?auto_96770 ) ) ( not ( = ?auto_96766 ?auto_96771 ) ) ( not ( = ?auto_96766 ?auto_96772 ) ) ( not ( = ?auto_96767 ?auto_96768 ) ) ( not ( = ?auto_96767 ?auto_96769 ) ) ( not ( = ?auto_96767 ?auto_96770 ) ) ( not ( = ?auto_96767 ?auto_96771 ) ) ( not ( = ?auto_96767 ?auto_96772 ) ) ( not ( = ?auto_96768 ?auto_96769 ) ) ( not ( = ?auto_96768 ?auto_96770 ) ) ( not ( = ?auto_96768 ?auto_96771 ) ) ( not ( = ?auto_96768 ?auto_96772 ) ) ( not ( = ?auto_96769 ?auto_96770 ) ) ( not ( = ?auto_96769 ?auto_96771 ) ) ( not ( = ?auto_96769 ?auto_96772 ) ) ( not ( = ?auto_96770 ?auto_96771 ) ) ( not ( = ?auto_96770 ?auto_96772 ) ) ( not ( = ?auto_96771 ?auto_96772 ) ) ( ON ?auto_96763 ?auto_96773 ) ( not ( = ?auto_96772 ?auto_96773 ) ) ( not ( = ?auto_96771 ?auto_96773 ) ) ( not ( = ?auto_96770 ?auto_96773 ) ) ( not ( = ?auto_96769 ?auto_96773 ) ) ( not ( = ?auto_96768 ?auto_96773 ) ) ( not ( = ?auto_96767 ?auto_96773 ) ) ( not ( = ?auto_96766 ?auto_96773 ) ) ( not ( = ?auto_96765 ?auto_96773 ) ) ( not ( = ?auto_96764 ?auto_96773 ) ) ( not ( = ?auto_96763 ?auto_96773 ) ) ( ON ?auto_96764 ?auto_96763 ) ( ON ?auto_96765 ?auto_96764 ) ( ON ?auto_96766 ?auto_96765 ) ( ON ?auto_96767 ?auto_96766 ) ( ON ?auto_96768 ?auto_96767 ) ( ON ?auto_96769 ?auto_96768 ) ( ON ?auto_96770 ?auto_96769 ) ( ON ?auto_96771 ?auto_96770 ) ( ON ?auto_96772 ?auto_96771 ) ( CLEAR ?auto_96772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_96772 ?auto_96771 ?auto_96770 ?auto_96769 ?auto_96768 ?auto_96767 ?auto_96766 ?auto_96765 ?auto_96764 ?auto_96763 )
      ( MAKE-10PILE ?auto_96763 ?auto_96764 ?auto_96765 ?auto_96766 ?auto_96767 ?auto_96768 ?auto_96769 ?auto_96770 ?auto_96771 ?auto_96772 ) )
  )

)

