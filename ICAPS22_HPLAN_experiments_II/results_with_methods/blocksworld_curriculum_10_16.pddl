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
      ?auto_100097 - BLOCK
    )
    :vars
    (
      ?auto_100098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100097 ?auto_100098 ) ( CLEAR ?auto_100097 ) ( HAND-EMPTY ) ( not ( = ?auto_100097 ?auto_100098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100097 ?auto_100098 )
      ( !PUTDOWN ?auto_100097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_100100 - BLOCK
    )
    :vars
    (
      ?auto_100101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100100 ?auto_100101 ) ( CLEAR ?auto_100100 ) ( HAND-EMPTY ) ( not ( = ?auto_100100 ?auto_100101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100100 ?auto_100101 )
      ( !PUTDOWN ?auto_100100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100104 - BLOCK
      ?auto_100105 - BLOCK
    )
    :vars
    (
      ?auto_100106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100104 ) ( ON ?auto_100105 ?auto_100106 ) ( CLEAR ?auto_100105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100104 ) ( not ( = ?auto_100104 ?auto_100105 ) ) ( not ( = ?auto_100104 ?auto_100106 ) ) ( not ( = ?auto_100105 ?auto_100106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100105 ?auto_100106 )
      ( !STACK ?auto_100105 ?auto_100104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100109 - BLOCK
      ?auto_100110 - BLOCK
    )
    :vars
    (
      ?auto_100111 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100109 ) ( ON ?auto_100110 ?auto_100111 ) ( CLEAR ?auto_100110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100109 ) ( not ( = ?auto_100109 ?auto_100110 ) ) ( not ( = ?auto_100109 ?auto_100111 ) ) ( not ( = ?auto_100110 ?auto_100111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100110 ?auto_100111 )
      ( !STACK ?auto_100110 ?auto_100109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100114 - BLOCK
      ?auto_100115 - BLOCK
    )
    :vars
    (
      ?auto_100116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100115 ?auto_100116 ) ( not ( = ?auto_100114 ?auto_100115 ) ) ( not ( = ?auto_100114 ?auto_100116 ) ) ( not ( = ?auto_100115 ?auto_100116 ) ) ( ON ?auto_100114 ?auto_100115 ) ( CLEAR ?auto_100114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100114 )
      ( MAKE-2PILE ?auto_100114 ?auto_100115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100119 - BLOCK
      ?auto_100120 - BLOCK
    )
    :vars
    (
      ?auto_100121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100120 ?auto_100121 ) ( not ( = ?auto_100119 ?auto_100120 ) ) ( not ( = ?auto_100119 ?auto_100121 ) ) ( not ( = ?auto_100120 ?auto_100121 ) ) ( ON ?auto_100119 ?auto_100120 ) ( CLEAR ?auto_100119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100119 )
      ( MAKE-2PILE ?auto_100119 ?auto_100120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100125 - BLOCK
      ?auto_100126 - BLOCK
      ?auto_100127 - BLOCK
    )
    :vars
    (
      ?auto_100128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100126 ) ( ON ?auto_100127 ?auto_100128 ) ( CLEAR ?auto_100127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100125 ) ( ON ?auto_100126 ?auto_100125 ) ( not ( = ?auto_100125 ?auto_100126 ) ) ( not ( = ?auto_100125 ?auto_100127 ) ) ( not ( = ?auto_100125 ?auto_100128 ) ) ( not ( = ?auto_100126 ?auto_100127 ) ) ( not ( = ?auto_100126 ?auto_100128 ) ) ( not ( = ?auto_100127 ?auto_100128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100127 ?auto_100128 )
      ( !STACK ?auto_100127 ?auto_100126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100132 - BLOCK
      ?auto_100133 - BLOCK
      ?auto_100134 - BLOCK
    )
    :vars
    (
      ?auto_100135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100133 ) ( ON ?auto_100134 ?auto_100135 ) ( CLEAR ?auto_100134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100132 ) ( ON ?auto_100133 ?auto_100132 ) ( not ( = ?auto_100132 ?auto_100133 ) ) ( not ( = ?auto_100132 ?auto_100134 ) ) ( not ( = ?auto_100132 ?auto_100135 ) ) ( not ( = ?auto_100133 ?auto_100134 ) ) ( not ( = ?auto_100133 ?auto_100135 ) ) ( not ( = ?auto_100134 ?auto_100135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100134 ?auto_100135 )
      ( !STACK ?auto_100134 ?auto_100133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100139 - BLOCK
      ?auto_100140 - BLOCK
      ?auto_100141 - BLOCK
    )
    :vars
    (
      ?auto_100142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100141 ?auto_100142 ) ( ON-TABLE ?auto_100139 ) ( not ( = ?auto_100139 ?auto_100140 ) ) ( not ( = ?auto_100139 ?auto_100141 ) ) ( not ( = ?auto_100139 ?auto_100142 ) ) ( not ( = ?auto_100140 ?auto_100141 ) ) ( not ( = ?auto_100140 ?auto_100142 ) ) ( not ( = ?auto_100141 ?auto_100142 ) ) ( CLEAR ?auto_100139 ) ( ON ?auto_100140 ?auto_100141 ) ( CLEAR ?auto_100140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100139 ?auto_100140 )
      ( MAKE-3PILE ?auto_100139 ?auto_100140 ?auto_100141 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100146 - BLOCK
      ?auto_100147 - BLOCK
      ?auto_100148 - BLOCK
    )
    :vars
    (
      ?auto_100149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100148 ?auto_100149 ) ( ON-TABLE ?auto_100146 ) ( not ( = ?auto_100146 ?auto_100147 ) ) ( not ( = ?auto_100146 ?auto_100148 ) ) ( not ( = ?auto_100146 ?auto_100149 ) ) ( not ( = ?auto_100147 ?auto_100148 ) ) ( not ( = ?auto_100147 ?auto_100149 ) ) ( not ( = ?auto_100148 ?auto_100149 ) ) ( CLEAR ?auto_100146 ) ( ON ?auto_100147 ?auto_100148 ) ( CLEAR ?auto_100147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100146 ?auto_100147 )
      ( MAKE-3PILE ?auto_100146 ?auto_100147 ?auto_100148 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100153 - BLOCK
      ?auto_100154 - BLOCK
      ?auto_100155 - BLOCK
    )
    :vars
    (
      ?auto_100156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100155 ?auto_100156 ) ( not ( = ?auto_100153 ?auto_100154 ) ) ( not ( = ?auto_100153 ?auto_100155 ) ) ( not ( = ?auto_100153 ?auto_100156 ) ) ( not ( = ?auto_100154 ?auto_100155 ) ) ( not ( = ?auto_100154 ?auto_100156 ) ) ( not ( = ?auto_100155 ?auto_100156 ) ) ( ON ?auto_100154 ?auto_100155 ) ( ON ?auto_100153 ?auto_100154 ) ( CLEAR ?auto_100153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100153 )
      ( MAKE-3PILE ?auto_100153 ?auto_100154 ?auto_100155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_100160 - BLOCK
      ?auto_100161 - BLOCK
      ?auto_100162 - BLOCK
    )
    :vars
    (
      ?auto_100163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100162 ?auto_100163 ) ( not ( = ?auto_100160 ?auto_100161 ) ) ( not ( = ?auto_100160 ?auto_100162 ) ) ( not ( = ?auto_100160 ?auto_100163 ) ) ( not ( = ?auto_100161 ?auto_100162 ) ) ( not ( = ?auto_100161 ?auto_100163 ) ) ( not ( = ?auto_100162 ?auto_100163 ) ) ( ON ?auto_100161 ?auto_100162 ) ( ON ?auto_100160 ?auto_100161 ) ( CLEAR ?auto_100160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100160 )
      ( MAKE-3PILE ?auto_100160 ?auto_100161 ?auto_100162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100168 - BLOCK
      ?auto_100169 - BLOCK
      ?auto_100170 - BLOCK
      ?auto_100171 - BLOCK
    )
    :vars
    (
      ?auto_100172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100170 ) ( ON ?auto_100171 ?auto_100172 ) ( CLEAR ?auto_100171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100168 ) ( ON ?auto_100169 ?auto_100168 ) ( ON ?auto_100170 ?auto_100169 ) ( not ( = ?auto_100168 ?auto_100169 ) ) ( not ( = ?auto_100168 ?auto_100170 ) ) ( not ( = ?auto_100168 ?auto_100171 ) ) ( not ( = ?auto_100168 ?auto_100172 ) ) ( not ( = ?auto_100169 ?auto_100170 ) ) ( not ( = ?auto_100169 ?auto_100171 ) ) ( not ( = ?auto_100169 ?auto_100172 ) ) ( not ( = ?auto_100170 ?auto_100171 ) ) ( not ( = ?auto_100170 ?auto_100172 ) ) ( not ( = ?auto_100171 ?auto_100172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100171 ?auto_100172 )
      ( !STACK ?auto_100171 ?auto_100170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100177 - BLOCK
      ?auto_100178 - BLOCK
      ?auto_100179 - BLOCK
      ?auto_100180 - BLOCK
    )
    :vars
    (
      ?auto_100181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100179 ) ( ON ?auto_100180 ?auto_100181 ) ( CLEAR ?auto_100180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100177 ) ( ON ?auto_100178 ?auto_100177 ) ( ON ?auto_100179 ?auto_100178 ) ( not ( = ?auto_100177 ?auto_100178 ) ) ( not ( = ?auto_100177 ?auto_100179 ) ) ( not ( = ?auto_100177 ?auto_100180 ) ) ( not ( = ?auto_100177 ?auto_100181 ) ) ( not ( = ?auto_100178 ?auto_100179 ) ) ( not ( = ?auto_100178 ?auto_100180 ) ) ( not ( = ?auto_100178 ?auto_100181 ) ) ( not ( = ?auto_100179 ?auto_100180 ) ) ( not ( = ?auto_100179 ?auto_100181 ) ) ( not ( = ?auto_100180 ?auto_100181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100180 ?auto_100181 )
      ( !STACK ?auto_100180 ?auto_100179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100186 - BLOCK
      ?auto_100187 - BLOCK
      ?auto_100188 - BLOCK
      ?auto_100189 - BLOCK
    )
    :vars
    (
      ?auto_100190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100189 ?auto_100190 ) ( ON-TABLE ?auto_100186 ) ( ON ?auto_100187 ?auto_100186 ) ( not ( = ?auto_100186 ?auto_100187 ) ) ( not ( = ?auto_100186 ?auto_100188 ) ) ( not ( = ?auto_100186 ?auto_100189 ) ) ( not ( = ?auto_100186 ?auto_100190 ) ) ( not ( = ?auto_100187 ?auto_100188 ) ) ( not ( = ?auto_100187 ?auto_100189 ) ) ( not ( = ?auto_100187 ?auto_100190 ) ) ( not ( = ?auto_100188 ?auto_100189 ) ) ( not ( = ?auto_100188 ?auto_100190 ) ) ( not ( = ?auto_100189 ?auto_100190 ) ) ( CLEAR ?auto_100187 ) ( ON ?auto_100188 ?auto_100189 ) ( CLEAR ?auto_100188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100186 ?auto_100187 ?auto_100188 )
      ( MAKE-4PILE ?auto_100186 ?auto_100187 ?auto_100188 ?auto_100189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100195 - BLOCK
      ?auto_100196 - BLOCK
      ?auto_100197 - BLOCK
      ?auto_100198 - BLOCK
    )
    :vars
    (
      ?auto_100199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100198 ?auto_100199 ) ( ON-TABLE ?auto_100195 ) ( ON ?auto_100196 ?auto_100195 ) ( not ( = ?auto_100195 ?auto_100196 ) ) ( not ( = ?auto_100195 ?auto_100197 ) ) ( not ( = ?auto_100195 ?auto_100198 ) ) ( not ( = ?auto_100195 ?auto_100199 ) ) ( not ( = ?auto_100196 ?auto_100197 ) ) ( not ( = ?auto_100196 ?auto_100198 ) ) ( not ( = ?auto_100196 ?auto_100199 ) ) ( not ( = ?auto_100197 ?auto_100198 ) ) ( not ( = ?auto_100197 ?auto_100199 ) ) ( not ( = ?auto_100198 ?auto_100199 ) ) ( CLEAR ?auto_100196 ) ( ON ?auto_100197 ?auto_100198 ) ( CLEAR ?auto_100197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100195 ?auto_100196 ?auto_100197 )
      ( MAKE-4PILE ?auto_100195 ?auto_100196 ?auto_100197 ?auto_100198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100204 - BLOCK
      ?auto_100205 - BLOCK
      ?auto_100206 - BLOCK
      ?auto_100207 - BLOCK
    )
    :vars
    (
      ?auto_100208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100207 ?auto_100208 ) ( ON-TABLE ?auto_100204 ) ( not ( = ?auto_100204 ?auto_100205 ) ) ( not ( = ?auto_100204 ?auto_100206 ) ) ( not ( = ?auto_100204 ?auto_100207 ) ) ( not ( = ?auto_100204 ?auto_100208 ) ) ( not ( = ?auto_100205 ?auto_100206 ) ) ( not ( = ?auto_100205 ?auto_100207 ) ) ( not ( = ?auto_100205 ?auto_100208 ) ) ( not ( = ?auto_100206 ?auto_100207 ) ) ( not ( = ?auto_100206 ?auto_100208 ) ) ( not ( = ?auto_100207 ?auto_100208 ) ) ( ON ?auto_100206 ?auto_100207 ) ( CLEAR ?auto_100204 ) ( ON ?auto_100205 ?auto_100206 ) ( CLEAR ?auto_100205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100204 ?auto_100205 )
      ( MAKE-4PILE ?auto_100204 ?auto_100205 ?auto_100206 ?auto_100207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100213 - BLOCK
      ?auto_100214 - BLOCK
      ?auto_100215 - BLOCK
      ?auto_100216 - BLOCK
    )
    :vars
    (
      ?auto_100217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100216 ?auto_100217 ) ( ON-TABLE ?auto_100213 ) ( not ( = ?auto_100213 ?auto_100214 ) ) ( not ( = ?auto_100213 ?auto_100215 ) ) ( not ( = ?auto_100213 ?auto_100216 ) ) ( not ( = ?auto_100213 ?auto_100217 ) ) ( not ( = ?auto_100214 ?auto_100215 ) ) ( not ( = ?auto_100214 ?auto_100216 ) ) ( not ( = ?auto_100214 ?auto_100217 ) ) ( not ( = ?auto_100215 ?auto_100216 ) ) ( not ( = ?auto_100215 ?auto_100217 ) ) ( not ( = ?auto_100216 ?auto_100217 ) ) ( ON ?auto_100215 ?auto_100216 ) ( CLEAR ?auto_100213 ) ( ON ?auto_100214 ?auto_100215 ) ( CLEAR ?auto_100214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100213 ?auto_100214 )
      ( MAKE-4PILE ?auto_100213 ?auto_100214 ?auto_100215 ?auto_100216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100222 - BLOCK
      ?auto_100223 - BLOCK
      ?auto_100224 - BLOCK
      ?auto_100225 - BLOCK
    )
    :vars
    (
      ?auto_100226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100225 ?auto_100226 ) ( not ( = ?auto_100222 ?auto_100223 ) ) ( not ( = ?auto_100222 ?auto_100224 ) ) ( not ( = ?auto_100222 ?auto_100225 ) ) ( not ( = ?auto_100222 ?auto_100226 ) ) ( not ( = ?auto_100223 ?auto_100224 ) ) ( not ( = ?auto_100223 ?auto_100225 ) ) ( not ( = ?auto_100223 ?auto_100226 ) ) ( not ( = ?auto_100224 ?auto_100225 ) ) ( not ( = ?auto_100224 ?auto_100226 ) ) ( not ( = ?auto_100225 ?auto_100226 ) ) ( ON ?auto_100224 ?auto_100225 ) ( ON ?auto_100223 ?auto_100224 ) ( ON ?auto_100222 ?auto_100223 ) ( CLEAR ?auto_100222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100222 )
      ( MAKE-4PILE ?auto_100222 ?auto_100223 ?auto_100224 ?auto_100225 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_100231 - BLOCK
      ?auto_100232 - BLOCK
      ?auto_100233 - BLOCK
      ?auto_100234 - BLOCK
    )
    :vars
    (
      ?auto_100235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100234 ?auto_100235 ) ( not ( = ?auto_100231 ?auto_100232 ) ) ( not ( = ?auto_100231 ?auto_100233 ) ) ( not ( = ?auto_100231 ?auto_100234 ) ) ( not ( = ?auto_100231 ?auto_100235 ) ) ( not ( = ?auto_100232 ?auto_100233 ) ) ( not ( = ?auto_100232 ?auto_100234 ) ) ( not ( = ?auto_100232 ?auto_100235 ) ) ( not ( = ?auto_100233 ?auto_100234 ) ) ( not ( = ?auto_100233 ?auto_100235 ) ) ( not ( = ?auto_100234 ?auto_100235 ) ) ( ON ?auto_100233 ?auto_100234 ) ( ON ?auto_100232 ?auto_100233 ) ( ON ?auto_100231 ?auto_100232 ) ( CLEAR ?auto_100231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100231 )
      ( MAKE-4PILE ?auto_100231 ?auto_100232 ?auto_100233 ?auto_100234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100241 - BLOCK
      ?auto_100242 - BLOCK
      ?auto_100243 - BLOCK
      ?auto_100244 - BLOCK
      ?auto_100245 - BLOCK
    )
    :vars
    (
      ?auto_100246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100244 ) ( ON ?auto_100245 ?auto_100246 ) ( CLEAR ?auto_100245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100241 ) ( ON ?auto_100242 ?auto_100241 ) ( ON ?auto_100243 ?auto_100242 ) ( ON ?auto_100244 ?auto_100243 ) ( not ( = ?auto_100241 ?auto_100242 ) ) ( not ( = ?auto_100241 ?auto_100243 ) ) ( not ( = ?auto_100241 ?auto_100244 ) ) ( not ( = ?auto_100241 ?auto_100245 ) ) ( not ( = ?auto_100241 ?auto_100246 ) ) ( not ( = ?auto_100242 ?auto_100243 ) ) ( not ( = ?auto_100242 ?auto_100244 ) ) ( not ( = ?auto_100242 ?auto_100245 ) ) ( not ( = ?auto_100242 ?auto_100246 ) ) ( not ( = ?auto_100243 ?auto_100244 ) ) ( not ( = ?auto_100243 ?auto_100245 ) ) ( not ( = ?auto_100243 ?auto_100246 ) ) ( not ( = ?auto_100244 ?auto_100245 ) ) ( not ( = ?auto_100244 ?auto_100246 ) ) ( not ( = ?auto_100245 ?auto_100246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100245 ?auto_100246 )
      ( !STACK ?auto_100245 ?auto_100244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100252 - BLOCK
      ?auto_100253 - BLOCK
      ?auto_100254 - BLOCK
      ?auto_100255 - BLOCK
      ?auto_100256 - BLOCK
    )
    :vars
    (
      ?auto_100257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100255 ) ( ON ?auto_100256 ?auto_100257 ) ( CLEAR ?auto_100256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100252 ) ( ON ?auto_100253 ?auto_100252 ) ( ON ?auto_100254 ?auto_100253 ) ( ON ?auto_100255 ?auto_100254 ) ( not ( = ?auto_100252 ?auto_100253 ) ) ( not ( = ?auto_100252 ?auto_100254 ) ) ( not ( = ?auto_100252 ?auto_100255 ) ) ( not ( = ?auto_100252 ?auto_100256 ) ) ( not ( = ?auto_100252 ?auto_100257 ) ) ( not ( = ?auto_100253 ?auto_100254 ) ) ( not ( = ?auto_100253 ?auto_100255 ) ) ( not ( = ?auto_100253 ?auto_100256 ) ) ( not ( = ?auto_100253 ?auto_100257 ) ) ( not ( = ?auto_100254 ?auto_100255 ) ) ( not ( = ?auto_100254 ?auto_100256 ) ) ( not ( = ?auto_100254 ?auto_100257 ) ) ( not ( = ?auto_100255 ?auto_100256 ) ) ( not ( = ?auto_100255 ?auto_100257 ) ) ( not ( = ?auto_100256 ?auto_100257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100256 ?auto_100257 )
      ( !STACK ?auto_100256 ?auto_100255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100263 - BLOCK
      ?auto_100264 - BLOCK
      ?auto_100265 - BLOCK
      ?auto_100266 - BLOCK
      ?auto_100267 - BLOCK
    )
    :vars
    (
      ?auto_100268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100267 ?auto_100268 ) ( ON-TABLE ?auto_100263 ) ( ON ?auto_100264 ?auto_100263 ) ( ON ?auto_100265 ?auto_100264 ) ( not ( = ?auto_100263 ?auto_100264 ) ) ( not ( = ?auto_100263 ?auto_100265 ) ) ( not ( = ?auto_100263 ?auto_100266 ) ) ( not ( = ?auto_100263 ?auto_100267 ) ) ( not ( = ?auto_100263 ?auto_100268 ) ) ( not ( = ?auto_100264 ?auto_100265 ) ) ( not ( = ?auto_100264 ?auto_100266 ) ) ( not ( = ?auto_100264 ?auto_100267 ) ) ( not ( = ?auto_100264 ?auto_100268 ) ) ( not ( = ?auto_100265 ?auto_100266 ) ) ( not ( = ?auto_100265 ?auto_100267 ) ) ( not ( = ?auto_100265 ?auto_100268 ) ) ( not ( = ?auto_100266 ?auto_100267 ) ) ( not ( = ?auto_100266 ?auto_100268 ) ) ( not ( = ?auto_100267 ?auto_100268 ) ) ( CLEAR ?auto_100265 ) ( ON ?auto_100266 ?auto_100267 ) ( CLEAR ?auto_100266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100263 ?auto_100264 ?auto_100265 ?auto_100266 )
      ( MAKE-5PILE ?auto_100263 ?auto_100264 ?auto_100265 ?auto_100266 ?auto_100267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100274 - BLOCK
      ?auto_100275 - BLOCK
      ?auto_100276 - BLOCK
      ?auto_100277 - BLOCK
      ?auto_100278 - BLOCK
    )
    :vars
    (
      ?auto_100279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100278 ?auto_100279 ) ( ON-TABLE ?auto_100274 ) ( ON ?auto_100275 ?auto_100274 ) ( ON ?auto_100276 ?auto_100275 ) ( not ( = ?auto_100274 ?auto_100275 ) ) ( not ( = ?auto_100274 ?auto_100276 ) ) ( not ( = ?auto_100274 ?auto_100277 ) ) ( not ( = ?auto_100274 ?auto_100278 ) ) ( not ( = ?auto_100274 ?auto_100279 ) ) ( not ( = ?auto_100275 ?auto_100276 ) ) ( not ( = ?auto_100275 ?auto_100277 ) ) ( not ( = ?auto_100275 ?auto_100278 ) ) ( not ( = ?auto_100275 ?auto_100279 ) ) ( not ( = ?auto_100276 ?auto_100277 ) ) ( not ( = ?auto_100276 ?auto_100278 ) ) ( not ( = ?auto_100276 ?auto_100279 ) ) ( not ( = ?auto_100277 ?auto_100278 ) ) ( not ( = ?auto_100277 ?auto_100279 ) ) ( not ( = ?auto_100278 ?auto_100279 ) ) ( CLEAR ?auto_100276 ) ( ON ?auto_100277 ?auto_100278 ) ( CLEAR ?auto_100277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100274 ?auto_100275 ?auto_100276 ?auto_100277 )
      ( MAKE-5PILE ?auto_100274 ?auto_100275 ?auto_100276 ?auto_100277 ?auto_100278 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100285 - BLOCK
      ?auto_100286 - BLOCK
      ?auto_100287 - BLOCK
      ?auto_100288 - BLOCK
      ?auto_100289 - BLOCK
    )
    :vars
    (
      ?auto_100290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100289 ?auto_100290 ) ( ON-TABLE ?auto_100285 ) ( ON ?auto_100286 ?auto_100285 ) ( not ( = ?auto_100285 ?auto_100286 ) ) ( not ( = ?auto_100285 ?auto_100287 ) ) ( not ( = ?auto_100285 ?auto_100288 ) ) ( not ( = ?auto_100285 ?auto_100289 ) ) ( not ( = ?auto_100285 ?auto_100290 ) ) ( not ( = ?auto_100286 ?auto_100287 ) ) ( not ( = ?auto_100286 ?auto_100288 ) ) ( not ( = ?auto_100286 ?auto_100289 ) ) ( not ( = ?auto_100286 ?auto_100290 ) ) ( not ( = ?auto_100287 ?auto_100288 ) ) ( not ( = ?auto_100287 ?auto_100289 ) ) ( not ( = ?auto_100287 ?auto_100290 ) ) ( not ( = ?auto_100288 ?auto_100289 ) ) ( not ( = ?auto_100288 ?auto_100290 ) ) ( not ( = ?auto_100289 ?auto_100290 ) ) ( ON ?auto_100288 ?auto_100289 ) ( CLEAR ?auto_100286 ) ( ON ?auto_100287 ?auto_100288 ) ( CLEAR ?auto_100287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100285 ?auto_100286 ?auto_100287 )
      ( MAKE-5PILE ?auto_100285 ?auto_100286 ?auto_100287 ?auto_100288 ?auto_100289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100296 - BLOCK
      ?auto_100297 - BLOCK
      ?auto_100298 - BLOCK
      ?auto_100299 - BLOCK
      ?auto_100300 - BLOCK
    )
    :vars
    (
      ?auto_100301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100300 ?auto_100301 ) ( ON-TABLE ?auto_100296 ) ( ON ?auto_100297 ?auto_100296 ) ( not ( = ?auto_100296 ?auto_100297 ) ) ( not ( = ?auto_100296 ?auto_100298 ) ) ( not ( = ?auto_100296 ?auto_100299 ) ) ( not ( = ?auto_100296 ?auto_100300 ) ) ( not ( = ?auto_100296 ?auto_100301 ) ) ( not ( = ?auto_100297 ?auto_100298 ) ) ( not ( = ?auto_100297 ?auto_100299 ) ) ( not ( = ?auto_100297 ?auto_100300 ) ) ( not ( = ?auto_100297 ?auto_100301 ) ) ( not ( = ?auto_100298 ?auto_100299 ) ) ( not ( = ?auto_100298 ?auto_100300 ) ) ( not ( = ?auto_100298 ?auto_100301 ) ) ( not ( = ?auto_100299 ?auto_100300 ) ) ( not ( = ?auto_100299 ?auto_100301 ) ) ( not ( = ?auto_100300 ?auto_100301 ) ) ( ON ?auto_100299 ?auto_100300 ) ( CLEAR ?auto_100297 ) ( ON ?auto_100298 ?auto_100299 ) ( CLEAR ?auto_100298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100296 ?auto_100297 ?auto_100298 )
      ( MAKE-5PILE ?auto_100296 ?auto_100297 ?auto_100298 ?auto_100299 ?auto_100300 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100307 - BLOCK
      ?auto_100308 - BLOCK
      ?auto_100309 - BLOCK
      ?auto_100310 - BLOCK
      ?auto_100311 - BLOCK
    )
    :vars
    (
      ?auto_100312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100311 ?auto_100312 ) ( ON-TABLE ?auto_100307 ) ( not ( = ?auto_100307 ?auto_100308 ) ) ( not ( = ?auto_100307 ?auto_100309 ) ) ( not ( = ?auto_100307 ?auto_100310 ) ) ( not ( = ?auto_100307 ?auto_100311 ) ) ( not ( = ?auto_100307 ?auto_100312 ) ) ( not ( = ?auto_100308 ?auto_100309 ) ) ( not ( = ?auto_100308 ?auto_100310 ) ) ( not ( = ?auto_100308 ?auto_100311 ) ) ( not ( = ?auto_100308 ?auto_100312 ) ) ( not ( = ?auto_100309 ?auto_100310 ) ) ( not ( = ?auto_100309 ?auto_100311 ) ) ( not ( = ?auto_100309 ?auto_100312 ) ) ( not ( = ?auto_100310 ?auto_100311 ) ) ( not ( = ?auto_100310 ?auto_100312 ) ) ( not ( = ?auto_100311 ?auto_100312 ) ) ( ON ?auto_100310 ?auto_100311 ) ( ON ?auto_100309 ?auto_100310 ) ( CLEAR ?auto_100307 ) ( ON ?auto_100308 ?auto_100309 ) ( CLEAR ?auto_100308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100307 ?auto_100308 )
      ( MAKE-5PILE ?auto_100307 ?auto_100308 ?auto_100309 ?auto_100310 ?auto_100311 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100318 - BLOCK
      ?auto_100319 - BLOCK
      ?auto_100320 - BLOCK
      ?auto_100321 - BLOCK
      ?auto_100322 - BLOCK
    )
    :vars
    (
      ?auto_100323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100322 ?auto_100323 ) ( ON-TABLE ?auto_100318 ) ( not ( = ?auto_100318 ?auto_100319 ) ) ( not ( = ?auto_100318 ?auto_100320 ) ) ( not ( = ?auto_100318 ?auto_100321 ) ) ( not ( = ?auto_100318 ?auto_100322 ) ) ( not ( = ?auto_100318 ?auto_100323 ) ) ( not ( = ?auto_100319 ?auto_100320 ) ) ( not ( = ?auto_100319 ?auto_100321 ) ) ( not ( = ?auto_100319 ?auto_100322 ) ) ( not ( = ?auto_100319 ?auto_100323 ) ) ( not ( = ?auto_100320 ?auto_100321 ) ) ( not ( = ?auto_100320 ?auto_100322 ) ) ( not ( = ?auto_100320 ?auto_100323 ) ) ( not ( = ?auto_100321 ?auto_100322 ) ) ( not ( = ?auto_100321 ?auto_100323 ) ) ( not ( = ?auto_100322 ?auto_100323 ) ) ( ON ?auto_100321 ?auto_100322 ) ( ON ?auto_100320 ?auto_100321 ) ( CLEAR ?auto_100318 ) ( ON ?auto_100319 ?auto_100320 ) ( CLEAR ?auto_100319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100318 ?auto_100319 )
      ( MAKE-5PILE ?auto_100318 ?auto_100319 ?auto_100320 ?auto_100321 ?auto_100322 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100329 - BLOCK
      ?auto_100330 - BLOCK
      ?auto_100331 - BLOCK
      ?auto_100332 - BLOCK
      ?auto_100333 - BLOCK
    )
    :vars
    (
      ?auto_100334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100333 ?auto_100334 ) ( not ( = ?auto_100329 ?auto_100330 ) ) ( not ( = ?auto_100329 ?auto_100331 ) ) ( not ( = ?auto_100329 ?auto_100332 ) ) ( not ( = ?auto_100329 ?auto_100333 ) ) ( not ( = ?auto_100329 ?auto_100334 ) ) ( not ( = ?auto_100330 ?auto_100331 ) ) ( not ( = ?auto_100330 ?auto_100332 ) ) ( not ( = ?auto_100330 ?auto_100333 ) ) ( not ( = ?auto_100330 ?auto_100334 ) ) ( not ( = ?auto_100331 ?auto_100332 ) ) ( not ( = ?auto_100331 ?auto_100333 ) ) ( not ( = ?auto_100331 ?auto_100334 ) ) ( not ( = ?auto_100332 ?auto_100333 ) ) ( not ( = ?auto_100332 ?auto_100334 ) ) ( not ( = ?auto_100333 ?auto_100334 ) ) ( ON ?auto_100332 ?auto_100333 ) ( ON ?auto_100331 ?auto_100332 ) ( ON ?auto_100330 ?auto_100331 ) ( ON ?auto_100329 ?auto_100330 ) ( CLEAR ?auto_100329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100329 )
      ( MAKE-5PILE ?auto_100329 ?auto_100330 ?auto_100331 ?auto_100332 ?auto_100333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_100340 - BLOCK
      ?auto_100341 - BLOCK
      ?auto_100342 - BLOCK
      ?auto_100343 - BLOCK
      ?auto_100344 - BLOCK
    )
    :vars
    (
      ?auto_100345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100344 ?auto_100345 ) ( not ( = ?auto_100340 ?auto_100341 ) ) ( not ( = ?auto_100340 ?auto_100342 ) ) ( not ( = ?auto_100340 ?auto_100343 ) ) ( not ( = ?auto_100340 ?auto_100344 ) ) ( not ( = ?auto_100340 ?auto_100345 ) ) ( not ( = ?auto_100341 ?auto_100342 ) ) ( not ( = ?auto_100341 ?auto_100343 ) ) ( not ( = ?auto_100341 ?auto_100344 ) ) ( not ( = ?auto_100341 ?auto_100345 ) ) ( not ( = ?auto_100342 ?auto_100343 ) ) ( not ( = ?auto_100342 ?auto_100344 ) ) ( not ( = ?auto_100342 ?auto_100345 ) ) ( not ( = ?auto_100343 ?auto_100344 ) ) ( not ( = ?auto_100343 ?auto_100345 ) ) ( not ( = ?auto_100344 ?auto_100345 ) ) ( ON ?auto_100343 ?auto_100344 ) ( ON ?auto_100342 ?auto_100343 ) ( ON ?auto_100341 ?auto_100342 ) ( ON ?auto_100340 ?auto_100341 ) ( CLEAR ?auto_100340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100340 )
      ( MAKE-5PILE ?auto_100340 ?auto_100341 ?auto_100342 ?auto_100343 ?auto_100344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100352 - BLOCK
      ?auto_100353 - BLOCK
      ?auto_100354 - BLOCK
      ?auto_100355 - BLOCK
      ?auto_100356 - BLOCK
      ?auto_100357 - BLOCK
    )
    :vars
    (
      ?auto_100358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100356 ) ( ON ?auto_100357 ?auto_100358 ) ( CLEAR ?auto_100357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100352 ) ( ON ?auto_100353 ?auto_100352 ) ( ON ?auto_100354 ?auto_100353 ) ( ON ?auto_100355 ?auto_100354 ) ( ON ?auto_100356 ?auto_100355 ) ( not ( = ?auto_100352 ?auto_100353 ) ) ( not ( = ?auto_100352 ?auto_100354 ) ) ( not ( = ?auto_100352 ?auto_100355 ) ) ( not ( = ?auto_100352 ?auto_100356 ) ) ( not ( = ?auto_100352 ?auto_100357 ) ) ( not ( = ?auto_100352 ?auto_100358 ) ) ( not ( = ?auto_100353 ?auto_100354 ) ) ( not ( = ?auto_100353 ?auto_100355 ) ) ( not ( = ?auto_100353 ?auto_100356 ) ) ( not ( = ?auto_100353 ?auto_100357 ) ) ( not ( = ?auto_100353 ?auto_100358 ) ) ( not ( = ?auto_100354 ?auto_100355 ) ) ( not ( = ?auto_100354 ?auto_100356 ) ) ( not ( = ?auto_100354 ?auto_100357 ) ) ( not ( = ?auto_100354 ?auto_100358 ) ) ( not ( = ?auto_100355 ?auto_100356 ) ) ( not ( = ?auto_100355 ?auto_100357 ) ) ( not ( = ?auto_100355 ?auto_100358 ) ) ( not ( = ?auto_100356 ?auto_100357 ) ) ( not ( = ?auto_100356 ?auto_100358 ) ) ( not ( = ?auto_100357 ?auto_100358 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100357 ?auto_100358 )
      ( !STACK ?auto_100357 ?auto_100356 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100365 - BLOCK
      ?auto_100366 - BLOCK
      ?auto_100367 - BLOCK
      ?auto_100368 - BLOCK
      ?auto_100369 - BLOCK
      ?auto_100370 - BLOCK
    )
    :vars
    (
      ?auto_100371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100369 ) ( ON ?auto_100370 ?auto_100371 ) ( CLEAR ?auto_100370 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100365 ) ( ON ?auto_100366 ?auto_100365 ) ( ON ?auto_100367 ?auto_100366 ) ( ON ?auto_100368 ?auto_100367 ) ( ON ?auto_100369 ?auto_100368 ) ( not ( = ?auto_100365 ?auto_100366 ) ) ( not ( = ?auto_100365 ?auto_100367 ) ) ( not ( = ?auto_100365 ?auto_100368 ) ) ( not ( = ?auto_100365 ?auto_100369 ) ) ( not ( = ?auto_100365 ?auto_100370 ) ) ( not ( = ?auto_100365 ?auto_100371 ) ) ( not ( = ?auto_100366 ?auto_100367 ) ) ( not ( = ?auto_100366 ?auto_100368 ) ) ( not ( = ?auto_100366 ?auto_100369 ) ) ( not ( = ?auto_100366 ?auto_100370 ) ) ( not ( = ?auto_100366 ?auto_100371 ) ) ( not ( = ?auto_100367 ?auto_100368 ) ) ( not ( = ?auto_100367 ?auto_100369 ) ) ( not ( = ?auto_100367 ?auto_100370 ) ) ( not ( = ?auto_100367 ?auto_100371 ) ) ( not ( = ?auto_100368 ?auto_100369 ) ) ( not ( = ?auto_100368 ?auto_100370 ) ) ( not ( = ?auto_100368 ?auto_100371 ) ) ( not ( = ?auto_100369 ?auto_100370 ) ) ( not ( = ?auto_100369 ?auto_100371 ) ) ( not ( = ?auto_100370 ?auto_100371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100370 ?auto_100371 )
      ( !STACK ?auto_100370 ?auto_100369 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100378 - BLOCK
      ?auto_100379 - BLOCK
      ?auto_100380 - BLOCK
      ?auto_100381 - BLOCK
      ?auto_100382 - BLOCK
      ?auto_100383 - BLOCK
    )
    :vars
    (
      ?auto_100384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100383 ?auto_100384 ) ( ON-TABLE ?auto_100378 ) ( ON ?auto_100379 ?auto_100378 ) ( ON ?auto_100380 ?auto_100379 ) ( ON ?auto_100381 ?auto_100380 ) ( not ( = ?auto_100378 ?auto_100379 ) ) ( not ( = ?auto_100378 ?auto_100380 ) ) ( not ( = ?auto_100378 ?auto_100381 ) ) ( not ( = ?auto_100378 ?auto_100382 ) ) ( not ( = ?auto_100378 ?auto_100383 ) ) ( not ( = ?auto_100378 ?auto_100384 ) ) ( not ( = ?auto_100379 ?auto_100380 ) ) ( not ( = ?auto_100379 ?auto_100381 ) ) ( not ( = ?auto_100379 ?auto_100382 ) ) ( not ( = ?auto_100379 ?auto_100383 ) ) ( not ( = ?auto_100379 ?auto_100384 ) ) ( not ( = ?auto_100380 ?auto_100381 ) ) ( not ( = ?auto_100380 ?auto_100382 ) ) ( not ( = ?auto_100380 ?auto_100383 ) ) ( not ( = ?auto_100380 ?auto_100384 ) ) ( not ( = ?auto_100381 ?auto_100382 ) ) ( not ( = ?auto_100381 ?auto_100383 ) ) ( not ( = ?auto_100381 ?auto_100384 ) ) ( not ( = ?auto_100382 ?auto_100383 ) ) ( not ( = ?auto_100382 ?auto_100384 ) ) ( not ( = ?auto_100383 ?auto_100384 ) ) ( CLEAR ?auto_100381 ) ( ON ?auto_100382 ?auto_100383 ) ( CLEAR ?auto_100382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100378 ?auto_100379 ?auto_100380 ?auto_100381 ?auto_100382 )
      ( MAKE-6PILE ?auto_100378 ?auto_100379 ?auto_100380 ?auto_100381 ?auto_100382 ?auto_100383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100391 - BLOCK
      ?auto_100392 - BLOCK
      ?auto_100393 - BLOCK
      ?auto_100394 - BLOCK
      ?auto_100395 - BLOCK
      ?auto_100396 - BLOCK
    )
    :vars
    (
      ?auto_100397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100396 ?auto_100397 ) ( ON-TABLE ?auto_100391 ) ( ON ?auto_100392 ?auto_100391 ) ( ON ?auto_100393 ?auto_100392 ) ( ON ?auto_100394 ?auto_100393 ) ( not ( = ?auto_100391 ?auto_100392 ) ) ( not ( = ?auto_100391 ?auto_100393 ) ) ( not ( = ?auto_100391 ?auto_100394 ) ) ( not ( = ?auto_100391 ?auto_100395 ) ) ( not ( = ?auto_100391 ?auto_100396 ) ) ( not ( = ?auto_100391 ?auto_100397 ) ) ( not ( = ?auto_100392 ?auto_100393 ) ) ( not ( = ?auto_100392 ?auto_100394 ) ) ( not ( = ?auto_100392 ?auto_100395 ) ) ( not ( = ?auto_100392 ?auto_100396 ) ) ( not ( = ?auto_100392 ?auto_100397 ) ) ( not ( = ?auto_100393 ?auto_100394 ) ) ( not ( = ?auto_100393 ?auto_100395 ) ) ( not ( = ?auto_100393 ?auto_100396 ) ) ( not ( = ?auto_100393 ?auto_100397 ) ) ( not ( = ?auto_100394 ?auto_100395 ) ) ( not ( = ?auto_100394 ?auto_100396 ) ) ( not ( = ?auto_100394 ?auto_100397 ) ) ( not ( = ?auto_100395 ?auto_100396 ) ) ( not ( = ?auto_100395 ?auto_100397 ) ) ( not ( = ?auto_100396 ?auto_100397 ) ) ( CLEAR ?auto_100394 ) ( ON ?auto_100395 ?auto_100396 ) ( CLEAR ?auto_100395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100391 ?auto_100392 ?auto_100393 ?auto_100394 ?auto_100395 )
      ( MAKE-6PILE ?auto_100391 ?auto_100392 ?auto_100393 ?auto_100394 ?auto_100395 ?auto_100396 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100404 - BLOCK
      ?auto_100405 - BLOCK
      ?auto_100406 - BLOCK
      ?auto_100407 - BLOCK
      ?auto_100408 - BLOCK
      ?auto_100409 - BLOCK
    )
    :vars
    (
      ?auto_100410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100409 ?auto_100410 ) ( ON-TABLE ?auto_100404 ) ( ON ?auto_100405 ?auto_100404 ) ( ON ?auto_100406 ?auto_100405 ) ( not ( = ?auto_100404 ?auto_100405 ) ) ( not ( = ?auto_100404 ?auto_100406 ) ) ( not ( = ?auto_100404 ?auto_100407 ) ) ( not ( = ?auto_100404 ?auto_100408 ) ) ( not ( = ?auto_100404 ?auto_100409 ) ) ( not ( = ?auto_100404 ?auto_100410 ) ) ( not ( = ?auto_100405 ?auto_100406 ) ) ( not ( = ?auto_100405 ?auto_100407 ) ) ( not ( = ?auto_100405 ?auto_100408 ) ) ( not ( = ?auto_100405 ?auto_100409 ) ) ( not ( = ?auto_100405 ?auto_100410 ) ) ( not ( = ?auto_100406 ?auto_100407 ) ) ( not ( = ?auto_100406 ?auto_100408 ) ) ( not ( = ?auto_100406 ?auto_100409 ) ) ( not ( = ?auto_100406 ?auto_100410 ) ) ( not ( = ?auto_100407 ?auto_100408 ) ) ( not ( = ?auto_100407 ?auto_100409 ) ) ( not ( = ?auto_100407 ?auto_100410 ) ) ( not ( = ?auto_100408 ?auto_100409 ) ) ( not ( = ?auto_100408 ?auto_100410 ) ) ( not ( = ?auto_100409 ?auto_100410 ) ) ( ON ?auto_100408 ?auto_100409 ) ( CLEAR ?auto_100406 ) ( ON ?auto_100407 ?auto_100408 ) ( CLEAR ?auto_100407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100404 ?auto_100405 ?auto_100406 ?auto_100407 )
      ( MAKE-6PILE ?auto_100404 ?auto_100405 ?auto_100406 ?auto_100407 ?auto_100408 ?auto_100409 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100417 - BLOCK
      ?auto_100418 - BLOCK
      ?auto_100419 - BLOCK
      ?auto_100420 - BLOCK
      ?auto_100421 - BLOCK
      ?auto_100422 - BLOCK
    )
    :vars
    (
      ?auto_100423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100422 ?auto_100423 ) ( ON-TABLE ?auto_100417 ) ( ON ?auto_100418 ?auto_100417 ) ( ON ?auto_100419 ?auto_100418 ) ( not ( = ?auto_100417 ?auto_100418 ) ) ( not ( = ?auto_100417 ?auto_100419 ) ) ( not ( = ?auto_100417 ?auto_100420 ) ) ( not ( = ?auto_100417 ?auto_100421 ) ) ( not ( = ?auto_100417 ?auto_100422 ) ) ( not ( = ?auto_100417 ?auto_100423 ) ) ( not ( = ?auto_100418 ?auto_100419 ) ) ( not ( = ?auto_100418 ?auto_100420 ) ) ( not ( = ?auto_100418 ?auto_100421 ) ) ( not ( = ?auto_100418 ?auto_100422 ) ) ( not ( = ?auto_100418 ?auto_100423 ) ) ( not ( = ?auto_100419 ?auto_100420 ) ) ( not ( = ?auto_100419 ?auto_100421 ) ) ( not ( = ?auto_100419 ?auto_100422 ) ) ( not ( = ?auto_100419 ?auto_100423 ) ) ( not ( = ?auto_100420 ?auto_100421 ) ) ( not ( = ?auto_100420 ?auto_100422 ) ) ( not ( = ?auto_100420 ?auto_100423 ) ) ( not ( = ?auto_100421 ?auto_100422 ) ) ( not ( = ?auto_100421 ?auto_100423 ) ) ( not ( = ?auto_100422 ?auto_100423 ) ) ( ON ?auto_100421 ?auto_100422 ) ( CLEAR ?auto_100419 ) ( ON ?auto_100420 ?auto_100421 ) ( CLEAR ?auto_100420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100417 ?auto_100418 ?auto_100419 ?auto_100420 )
      ( MAKE-6PILE ?auto_100417 ?auto_100418 ?auto_100419 ?auto_100420 ?auto_100421 ?auto_100422 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100430 - BLOCK
      ?auto_100431 - BLOCK
      ?auto_100432 - BLOCK
      ?auto_100433 - BLOCK
      ?auto_100434 - BLOCK
      ?auto_100435 - BLOCK
    )
    :vars
    (
      ?auto_100436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100435 ?auto_100436 ) ( ON-TABLE ?auto_100430 ) ( ON ?auto_100431 ?auto_100430 ) ( not ( = ?auto_100430 ?auto_100431 ) ) ( not ( = ?auto_100430 ?auto_100432 ) ) ( not ( = ?auto_100430 ?auto_100433 ) ) ( not ( = ?auto_100430 ?auto_100434 ) ) ( not ( = ?auto_100430 ?auto_100435 ) ) ( not ( = ?auto_100430 ?auto_100436 ) ) ( not ( = ?auto_100431 ?auto_100432 ) ) ( not ( = ?auto_100431 ?auto_100433 ) ) ( not ( = ?auto_100431 ?auto_100434 ) ) ( not ( = ?auto_100431 ?auto_100435 ) ) ( not ( = ?auto_100431 ?auto_100436 ) ) ( not ( = ?auto_100432 ?auto_100433 ) ) ( not ( = ?auto_100432 ?auto_100434 ) ) ( not ( = ?auto_100432 ?auto_100435 ) ) ( not ( = ?auto_100432 ?auto_100436 ) ) ( not ( = ?auto_100433 ?auto_100434 ) ) ( not ( = ?auto_100433 ?auto_100435 ) ) ( not ( = ?auto_100433 ?auto_100436 ) ) ( not ( = ?auto_100434 ?auto_100435 ) ) ( not ( = ?auto_100434 ?auto_100436 ) ) ( not ( = ?auto_100435 ?auto_100436 ) ) ( ON ?auto_100434 ?auto_100435 ) ( ON ?auto_100433 ?auto_100434 ) ( CLEAR ?auto_100431 ) ( ON ?auto_100432 ?auto_100433 ) ( CLEAR ?auto_100432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100430 ?auto_100431 ?auto_100432 )
      ( MAKE-6PILE ?auto_100430 ?auto_100431 ?auto_100432 ?auto_100433 ?auto_100434 ?auto_100435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100443 - BLOCK
      ?auto_100444 - BLOCK
      ?auto_100445 - BLOCK
      ?auto_100446 - BLOCK
      ?auto_100447 - BLOCK
      ?auto_100448 - BLOCK
    )
    :vars
    (
      ?auto_100449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100448 ?auto_100449 ) ( ON-TABLE ?auto_100443 ) ( ON ?auto_100444 ?auto_100443 ) ( not ( = ?auto_100443 ?auto_100444 ) ) ( not ( = ?auto_100443 ?auto_100445 ) ) ( not ( = ?auto_100443 ?auto_100446 ) ) ( not ( = ?auto_100443 ?auto_100447 ) ) ( not ( = ?auto_100443 ?auto_100448 ) ) ( not ( = ?auto_100443 ?auto_100449 ) ) ( not ( = ?auto_100444 ?auto_100445 ) ) ( not ( = ?auto_100444 ?auto_100446 ) ) ( not ( = ?auto_100444 ?auto_100447 ) ) ( not ( = ?auto_100444 ?auto_100448 ) ) ( not ( = ?auto_100444 ?auto_100449 ) ) ( not ( = ?auto_100445 ?auto_100446 ) ) ( not ( = ?auto_100445 ?auto_100447 ) ) ( not ( = ?auto_100445 ?auto_100448 ) ) ( not ( = ?auto_100445 ?auto_100449 ) ) ( not ( = ?auto_100446 ?auto_100447 ) ) ( not ( = ?auto_100446 ?auto_100448 ) ) ( not ( = ?auto_100446 ?auto_100449 ) ) ( not ( = ?auto_100447 ?auto_100448 ) ) ( not ( = ?auto_100447 ?auto_100449 ) ) ( not ( = ?auto_100448 ?auto_100449 ) ) ( ON ?auto_100447 ?auto_100448 ) ( ON ?auto_100446 ?auto_100447 ) ( CLEAR ?auto_100444 ) ( ON ?auto_100445 ?auto_100446 ) ( CLEAR ?auto_100445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100443 ?auto_100444 ?auto_100445 )
      ( MAKE-6PILE ?auto_100443 ?auto_100444 ?auto_100445 ?auto_100446 ?auto_100447 ?auto_100448 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100456 - BLOCK
      ?auto_100457 - BLOCK
      ?auto_100458 - BLOCK
      ?auto_100459 - BLOCK
      ?auto_100460 - BLOCK
      ?auto_100461 - BLOCK
    )
    :vars
    (
      ?auto_100462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100461 ?auto_100462 ) ( ON-TABLE ?auto_100456 ) ( not ( = ?auto_100456 ?auto_100457 ) ) ( not ( = ?auto_100456 ?auto_100458 ) ) ( not ( = ?auto_100456 ?auto_100459 ) ) ( not ( = ?auto_100456 ?auto_100460 ) ) ( not ( = ?auto_100456 ?auto_100461 ) ) ( not ( = ?auto_100456 ?auto_100462 ) ) ( not ( = ?auto_100457 ?auto_100458 ) ) ( not ( = ?auto_100457 ?auto_100459 ) ) ( not ( = ?auto_100457 ?auto_100460 ) ) ( not ( = ?auto_100457 ?auto_100461 ) ) ( not ( = ?auto_100457 ?auto_100462 ) ) ( not ( = ?auto_100458 ?auto_100459 ) ) ( not ( = ?auto_100458 ?auto_100460 ) ) ( not ( = ?auto_100458 ?auto_100461 ) ) ( not ( = ?auto_100458 ?auto_100462 ) ) ( not ( = ?auto_100459 ?auto_100460 ) ) ( not ( = ?auto_100459 ?auto_100461 ) ) ( not ( = ?auto_100459 ?auto_100462 ) ) ( not ( = ?auto_100460 ?auto_100461 ) ) ( not ( = ?auto_100460 ?auto_100462 ) ) ( not ( = ?auto_100461 ?auto_100462 ) ) ( ON ?auto_100460 ?auto_100461 ) ( ON ?auto_100459 ?auto_100460 ) ( ON ?auto_100458 ?auto_100459 ) ( CLEAR ?auto_100456 ) ( ON ?auto_100457 ?auto_100458 ) ( CLEAR ?auto_100457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100456 ?auto_100457 )
      ( MAKE-6PILE ?auto_100456 ?auto_100457 ?auto_100458 ?auto_100459 ?auto_100460 ?auto_100461 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100469 - BLOCK
      ?auto_100470 - BLOCK
      ?auto_100471 - BLOCK
      ?auto_100472 - BLOCK
      ?auto_100473 - BLOCK
      ?auto_100474 - BLOCK
    )
    :vars
    (
      ?auto_100475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100474 ?auto_100475 ) ( ON-TABLE ?auto_100469 ) ( not ( = ?auto_100469 ?auto_100470 ) ) ( not ( = ?auto_100469 ?auto_100471 ) ) ( not ( = ?auto_100469 ?auto_100472 ) ) ( not ( = ?auto_100469 ?auto_100473 ) ) ( not ( = ?auto_100469 ?auto_100474 ) ) ( not ( = ?auto_100469 ?auto_100475 ) ) ( not ( = ?auto_100470 ?auto_100471 ) ) ( not ( = ?auto_100470 ?auto_100472 ) ) ( not ( = ?auto_100470 ?auto_100473 ) ) ( not ( = ?auto_100470 ?auto_100474 ) ) ( not ( = ?auto_100470 ?auto_100475 ) ) ( not ( = ?auto_100471 ?auto_100472 ) ) ( not ( = ?auto_100471 ?auto_100473 ) ) ( not ( = ?auto_100471 ?auto_100474 ) ) ( not ( = ?auto_100471 ?auto_100475 ) ) ( not ( = ?auto_100472 ?auto_100473 ) ) ( not ( = ?auto_100472 ?auto_100474 ) ) ( not ( = ?auto_100472 ?auto_100475 ) ) ( not ( = ?auto_100473 ?auto_100474 ) ) ( not ( = ?auto_100473 ?auto_100475 ) ) ( not ( = ?auto_100474 ?auto_100475 ) ) ( ON ?auto_100473 ?auto_100474 ) ( ON ?auto_100472 ?auto_100473 ) ( ON ?auto_100471 ?auto_100472 ) ( CLEAR ?auto_100469 ) ( ON ?auto_100470 ?auto_100471 ) ( CLEAR ?auto_100470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100469 ?auto_100470 )
      ( MAKE-6PILE ?auto_100469 ?auto_100470 ?auto_100471 ?auto_100472 ?auto_100473 ?auto_100474 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100482 - BLOCK
      ?auto_100483 - BLOCK
      ?auto_100484 - BLOCK
      ?auto_100485 - BLOCK
      ?auto_100486 - BLOCK
      ?auto_100487 - BLOCK
    )
    :vars
    (
      ?auto_100488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100487 ?auto_100488 ) ( not ( = ?auto_100482 ?auto_100483 ) ) ( not ( = ?auto_100482 ?auto_100484 ) ) ( not ( = ?auto_100482 ?auto_100485 ) ) ( not ( = ?auto_100482 ?auto_100486 ) ) ( not ( = ?auto_100482 ?auto_100487 ) ) ( not ( = ?auto_100482 ?auto_100488 ) ) ( not ( = ?auto_100483 ?auto_100484 ) ) ( not ( = ?auto_100483 ?auto_100485 ) ) ( not ( = ?auto_100483 ?auto_100486 ) ) ( not ( = ?auto_100483 ?auto_100487 ) ) ( not ( = ?auto_100483 ?auto_100488 ) ) ( not ( = ?auto_100484 ?auto_100485 ) ) ( not ( = ?auto_100484 ?auto_100486 ) ) ( not ( = ?auto_100484 ?auto_100487 ) ) ( not ( = ?auto_100484 ?auto_100488 ) ) ( not ( = ?auto_100485 ?auto_100486 ) ) ( not ( = ?auto_100485 ?auto_100487 ) ) ( not ( = ?auto_100485 ?auto_100488 ) ) ( not ( = ?auto_100486 ?auto_100487 ) ) ( not ( = ?auto_100486 ?auto_100488 ) ) ( not ( = ?auto_100487 ?auto_100488 ) ) ( ON ?auto_100486 ?auto_100487 ) ( ON ?auto_100485 ?auto_100486 ) ( ON ?auto_100484 ?auto_100485 ) ( ON ?auto_100483 ?auto_100484 ) ( ON ?auto_100482 ?auto_100483 ) ( CLEAR ?auto_100482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100482 )
      ( MAKE-6PILE ?auto_100482 ?auto_100483 ?auto_100484 ?auto_100485 ?auto_100486 ?auto_100487 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_100495 - BLOCK
      ?auto_100496 - BLOCK
      ?auto_100497 - BLOCK
      ?auto_100498 - BLOCK
      ?auto_100499 - BLOCK
      ?auto_100500 - BLOCK
    )
    :vars
    (
      ?auto_100501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100500 ?auto_100501 ) ( not ( = ?auto_100495 ?auto_100496 ) ) ( not ( = ?auto_100495 ?auto_100497 ) ) ( not ( = ?auto_100495 ?auto_100498 ) ) ( not ( = ?auto_100495 ?auto_100499 ) ) ( not ( = ?auto_100495 ?auto_100500 ) ) ( not ( = ?auto_100495 ?auto_100501 ) ) ( not ( = ?auto_100496 ?auto_100497 ) ) ( not ( = ?auto_100496 ?auto_100498 ) ) ( not ( = ?auto_100496 ?auto_100499 ) ) ( not ( = ?auto_100496 ?auto_100500 ) ) ( not ( = ?auto_100496 ?auto_100501 ) ) ( not ( = ?auto_100497 ?auto_100498 ) ) ( not ( = ?auto_100497 ?auto_100499 ) ) ( not ( = ?auto_100497 ?auto_100500 ) ) ( not ( = ?auto_100497 ?auto_100501 ) ) ( not ( = ?auto_100498 ?auto_100499 ) ) ( not ( = ?auto_100498 ?auto_100500 ) ) ( not ( = ?auto_100498 ?auto_100501 ) ) ( not ( = ?auto_100499 ?auto_100500 ) ) ( not ( = ?auto_100499 ?auto_100501 ) ) ( not ( = ?auto_100500 ?auto_100501 ) ) ( ON ?auto_100499 ?auto_100500 ) ( ON ?auto_100498 ?auto_100499 ) ( ON ?auto_100497 ?auto_100498 ) ( ON ?auto_100496 ?auto_100497 ) ( ON ?auto_100495 ?auto_100496 ) ( CLEAR ?auto_100495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100495 )
      ( MAKE-6PILE ?auto_100495 ?auto_100496 ?auto_100497 ?auto_100498 ?auto_100499 ?auto_100500 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100509 - BLOCK
      ?auto_100510 - BLOCK
      ?auto_100511 - BLOCK
      ?auto_100512 - BLOCK
      ?auto_100513 - BLOCK
      ?auto_100514 - BLOCK
      ?auto_100515 - BLOCK
    )
    :vars
    (
      ?auto_100516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100514 ) ( ON ?auto_100515 ?auto_100516 ) ( CLEAR ?auto_100515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100509 ) ( ON ?auto_100510 ?auto_100509 ) ( ON ?auto_100511 ?auto_100510 ) ( ON ?auto_100512 ?auto_100511 ) ( ON ?auto_100513 ?auto_100512 ) ( ON ?auto_100514 ?auto_100513 ) ( not ( = ?auto_100509 ?auto_100510 ) ) ( not ( = ?auto_100509 ?auto_100511 ) ) ( not ( = ?auto_100509 ?auto_100512 ) ) ( not ( = ?auto_100509 ?auto_100513 ) ) ( not ( = ?auto_100509 ?auto_100514 ) ) ( not ( = ?auto_100509 ?auto_100515 ) ) ( not ( = ?auto_100509 ?auto_100516 ) ) ( not ( = ?auto_100510 ?auto_100511 ) ) ( not ( = ?auto_100510 ?auto_100512 ) ) ( not ( = ?auto_100510 ?auto_100513 ) ) ( not ( = ?auto_100510 ?auto_100514 ) ) ( not ( = ?auto_100510 ?auto_100515 ) ) ( not ( = ?auto_100510 ?auto_100516 ) ) ( not ( = ?auto_100511 ?auto_100512 ) ) ( not ( = ?auto_100511 ?auto_100513 ) ) ( not ( = ?auto_100511 ?auto_100514 ) ) ( not ( = ?auto_100511 ?auto_100515 ) ) ( not ( = ?auto_100511 ?auto_100516 ) ) ( not ( = ?auto_100512 ?auto_100513 ) ) ( not ( = ?auto_100512 ?auto_100514 ) ) ( not ( = ?auto_100512 ?auto_100515 ) ) ( not ( = ?auto_100512 ?auto_100516 ) ) ( not ( = ?auto_100513 ?auto_100514 ) ) ( not ( = ?auto_100513 ?auto_100515 ) ) ( not ( = ?auto_100513 ?auto_100516 ) ) ( not ( = ?auto_100514 ?auto_100515 ) ) ( not ( = ?auto_100514 ?auto_100516 ) ) ( not ( = ?auto_100515 ?auto_100516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100515 ?auto_100516 )
      ( !STACK ?auto_100515 ?auto_100514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100524 - BLOCK
      ?auto_100525 - BLOCK
      ?auto_100526 - BLOCK
      ?auto_100527 - BLOCK
      ?auto_100528 - BLOCK
      ?auto_100529 - BLOCK
      ?auto_100530 - BLOCK
    )
    :vars
    (
      ?auto_100531 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100529 ) ( ON ?auto_100530 ?auto_100531 ) ( CLEAR ?auto_100530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100524 ) ( ON ?auto_100525 ?auto_100524 ) ( ON ?auto_100526 ?auto_100525 ) ( ON ?auto_100527 ?auto_100526 ) ( ON ?auto_100528 ?auto_100527 ) ( ON ?auto_100529 ?auto_100528 ) ( not ( = ?auto_100524 ?auto_100525 ) ) ( not ( = ?auto_100524 ?auto_100526 ) ) ( not ( = ?auto_100524 ?auto_100527 ) ) ( not ( = ?auto_100524 ?auto_100528 ) ) ( not ( = ?auto_100524 ?auto_100529 ) ) ( not ( = ?auto_100524 ?auto_100530 ) ) ( not ( = ?auto_100524 ?auto_100531 ) ) ( not ( = ?auto_100525 ?auto_100526 ) ) ( not ( = ?auto_100525 ?auto_100527 ) ) ( not ( = ?auto_100525 ?auto_100528 ) ) ( not ( = ?auto_100525 ?auto_100529 ) ) ( not ( = ?auto_100525 ?auto_100530 ) ) ( not ( = ?auto_100525 ?auto_100531 ) ) ( not ( = ?auto_100526 ?auto_100527 ) ) ( not ( = ?auto_100526 ?auto_100528 ) ) ( not ( = ?auto_100526 ?auto_100529 ) ) ( not ( = ?auto_100526 ?auto_100530 ) ) ( not ( = ?auto_100526 ?auto_100531 ) ) ( not ( = ?auto_100527 ?auto_100528 ) ) ( not ( = ?auto_100527 ?auto_100529 ) ) ( not ( = ?auto_100527 ?auto_100530 ) ) ( not ( = ?auto_100527 ?auto_100531 ) ) ( not ( = ?auto_100528 ?auto_100529 ) ) ( not ( = ?auto_100528 ?auto_100530 ) ) ( not ( = ?auto_100528 ?auto_100531 ) ) ( not ( = ?auto_100529 ?auto_100530 ) ) ( not ( = ?auto_100529 ?auto_100531 ) ) ( not ( = ?auto_100530 ?auto_100531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100530 ?auto_100531 )
      ( !STACK ?auto_100530 ?auto_100529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100539 - BLOCK
      ?auto_100540 - BLOCK
      ?auto_100541 - BLOCK
      ?auto_100542 - BLOCK
      ?auto_100543 - BLOCK
      ?auto_100544 - BLOCK
      ?auto_100545 - BLOCK
    )
    :vars
    (
      ?auto_100546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100545 ?auto_100546 ) ( ON-TABLE ?auto_100539 ) ( ON ?auto_100540 ?auto_100539 ) ( ON ?auto_100541 ?auto_100540 ) ( ON ?auto_100542 ?auto_100541 ) ( ON ?auto_100543 ?auto_100542 ) ( not ( = ?auto_100539 ?auto_100540 ) ) ( not ( = ?auto_100539 ?auto_100541 ) ) ( not ( = ?auto_100539 ?auto_100542 ) ) ( not ( = ?auto_100539 ?auto_100543 ) ) ( not ( = ?auto_100539 ?auto_100544 ) ) ( not ( = ?auto_100539 ?auto_100545 ) ) ( not ( = ?auto_100539 ?auto_100546 ) ) ( not ( = ?auto_100540 ?auto_100541 ) ) ( not ( = ?auto_100540 ?auto_100542 ) ) ( not ( = ?auto_100540 ?auto_100543 ) ) ( not ( = ?auto_100540 ?auto_100544 ) ) ( not ( = ?auto_100540 ?auto_100545 ) ) ( not ( = ?auto_100540 ?auto_100546 ) ) ( not ( = ?auto_100541 ?auto_100542 ) ) ( not ( = ?auto_100541 ?auto_100543 ) ) ( not ( = ?auto_100541 ?auto_100544 ) ) ( not ( = ?auto_100541 ?auto_100545 ) ) ( not ( = ?auto_100541 ?auto_100546 ) ) ( not ( = ?auto_100542 ?auto_100543 ) ) ( not ( = ?auto_100542 ?auto_100544 ) ) ( not ( = ?auto_100542 ?auto_100545 ) ) ( not ( = ?auto_100542 ?auto_100546 ) ) ( not ( = ?auto_100543 ?auto_100544 ) ) ( not ( = ?auto_100543 ?auto_100545 ) ) ( not ( = ?auto_100543 ?auto_100546 ) ) ( not ( = ?auto_100544 ?auto_100545 ) ) ( not ( = ?auto_100544 ?auto_100546 ) ) ( not ( = ?auto_100545 ?auto_100546 ) ) ( CLEAR ?auto_100543 ) ( ON ?auto_100544 ?auto_100545 ) ( CLEAR ?auto_100544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100539 ?auto_100540 ?auto_100541 ?auto_100542 ?auto_100543 ?auto_100544 )
      ( MAKE-7PILE ?auto_100539 ?auto_100540 ?auto_100541 ?auto_100542 ?auto_100543 ?auto_100544 ?auto_100545 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100554 - BLOCK
      ?auto_100555 - BLOCK
      ?auto_100556 - BLOCK
      ?auto_100557 - BLOCK
      ?auto_100558 - BLOCK
      ?auto_100559 - BLOCK
      ?auto_100560 - BLOCK
    )
    :vars
    (
      ?auto_100561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100560 ?auto_100561 ) ( ON-TABLE ?auto_100554 ) ( ON ?auto_100555 ?auto_100554 ) ( ON ?auto_100556 ?auto_100555 ) ( ON ?auto_100557 ?auto_100556 ) ( ON ?auto_100558 ?auto_100557 ) ( not ( = ?auto_100554 ?auto_100555 ) ) ( not ( = ?auto_100554 ?auto_100556 ) ) ( not ( = ?auto_100554 ?auto_100557 ) ) ( not ( = ?auto_100554 ?auto_100558 ) ) ( not ( = ?auto_100554 ?auto_100559 ) ) ( not ( = ?auto_100554 ?auto_100560 ) ) ( not ( = ?auto_100554 ?auto_100561 ) ) ( not ( = ?auto_100555 ?auto_100556 ) ) ( not ( = ?auto_100555 ?auto_100557 ) ) ( not ( = ?auto_100555 ?auto_100558 ) ) ( not ( = ?auto_100555 ?auto_100559 ) ) ( not ( = ?auto_100555 ?auto_100560 ) ) ( not ( = ?auto_100555 ?auto_100561 ) ) ( not ( = ?auto_100556 ?auto_100557 ) ) ( not ( = ?auto_100556 ?auto_100558 ) ) ( not ( = ?auto_100556 ?auto_100559 ) ) ( not ( = ?auto_100556 ?auto_100560 ) ) ( not ( = ?auto_100556 ?auto_100561 ) ) ( not ( = ?auto_100557 ?auto_100558 ) ) ( not ( = ?auto_100557 ?auto_100559 ) ) ( not ( = ?auto_100557 ?auto_100560 ) ) ( not ( = ?auto_100557 ?auto_100561 ) ) ( not ( = ?auto_100558 ?auto_100559 ) ) ( not ( = ?auto_100558 ?auto_100560 ) ) ( not ( = ?auto_100558 ?auto_100561 ) ) ( not ( = ?auto_100559 ?auto_100560 ) ) ( not ( = ?auto_100559 ?auto_100561 ) ) ( not ( = ?auto_100560 ?auto_100561 ) ) ( CLEAR ?auto_100558 ) ( ON ?auto_100559 ?auto_100560 ) ( CLEAR ?auto_100559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100554 ?auto_100555 ?auto_100556 ?auto_100557 ?auto_100558 ?auto_100559 )
      ( MAKE-7PILE ?auto_100554 ?auto_100555 ?auto_100556 ?auto_100557 ?auto_100558 ?auto_100559 ?auto_100560 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100569 - BLOCK
      ?auto_100570 - BLOCK
      ?auto_100571 - BLOCK
      ?auto_100572 - BLOCK
      ?auto_100573 - BLOCK
      ?auto_100574 - BLOCK
      ?auto_100575 - BLOCK
    )
    :vars
    (
      ?auto_100576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100575 ?auto_100576 ) ( ON-TABLE ?auto_100569 ) ( ON ?auto_100570 ?auto_100569 ) ( ON ?auto_100571 ?auto_100570 ) ( ON ?auto_100572 ?auto_100571 ) ( not ( = ?auto_100569 ?auto_100570 ) ) ( not ( = ?auto_100569 ?auto_100571 ) ) ( not ( = ?auto_100569 ?auto_100572 ) ) ( not ( = ?auto_100569 ?auto_100573 ) ) ( not ( = ?auto_100569 ?auto_100574 ) ) ( not ( = ?auto_100569 ?auto_100575 ) ) ( not ( = ?auto_100569 ?auto_100576 ) ) ( not ( = ?auto_100570 ?auto_100571 ) ) ( not ( = ?auto_100570 ?auto_100572 ) ) ( not ( = ?auto_100570 ?auto_100573 ) ) ( not ( = ?auto_100570 ?auto_100574 ) ) ( not ( = ?auto_100570 ?auto_100575 ) ) ( not ( = ?auto_100570 ?auto_100576 ) ) ( not ( = ?auto_100571 ?auto_100572 ) ) ( not ( = ?auto_100571 ?auto_100573 ) ) ( not ( = ?auto_100571 ?auto_100574 ) ) ( not ( = ?auto_100571 ?auto_100575 ) ) ( not ( = ?auto_100571 ?auto_100576 ) ) ( not ( = ?auto_100572 ?auto_100573 ) ) ( not ( = ?auto_100572 ?auto_100574 ) ) ( not ( = ?auto_100572 ?auto_100575 ) ) ( not ( = ?auto_100572 ?auto_100576 ) ) ( not ( = ?auto_100573 ?auto_100574 ) ) ( not ( = ?auto_100573 ?auto_100575 ) ) ( not ( = ?auto_100573 ?auto_100576 ) ) ( not ( = ?auto_100574 ?auto_100575 ) ) ( not ( = ?auto_100574 ?auto_100576 ) ) ( not ( = ?auto_100575 ?auto_100576 ) ) ( ON ?auto_100574 ?auto_100575 ) ( CLEAR ?auto_100572 ) ( ON ?auto_100573 ?auto_100574 ) ( CLEAR ?auto_100573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100569 ?auto_100570 ?auto_100571 ?auto_100572 ?auto_100573 )
      ( MAKE-7PILE ?auto_100569 ?auto_100570 ?auto_100571 ?auto_100572 ?auto_100573 ?auto_100574 ?auto_100575 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100584 - BLOCK
      ?auto_100585 - BLOCK
      ?auto_100586 - BLOCK
      ?auto_100587 - BLOCK
      ?auto_100588 - BLOCK
      ?auto_100589 - BLOCK
      ?auto_100590 - BLOCK
    )
    :vars
    (
      ?auto_100591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100590 ?auto_100591 ) ( ON-TABLE ?auto_100584 ) ( ON ?auto_100585 ?auto_100584 ) ( ON ?auto_100586 ?auto_100585 ) ( ON ?auto_100587 ?auto_100586 ) ( not ( = ?auto_100584 ?auto_100585 ) ) ( not ( = ?auto_100584 ?auto_100586 ) ) ( not ( = ?auto_100584 ?auto_100587 ) ) ( not ( = ?auto_100584 ?auto_100588 ) ) ( not ( = ?auto_100584 ?auto_100589 ) ) ( not ( = ?auto_100584 ?auto_100590 ) ) ( not ( = ?auto_100584 ?auto_100591 ) ) ( not ( = ?auto_100585 ?auto_100586 ) ) ( not ( = ?auto_100585 ?auto_100587 ) ) ( not ( = ?auto_100585 ?auto_100588 ) ) ( not ( = ?auto_100585 ?auto_100589 ) ) ( not ( = ?auto_100585 ?auto_100590 ) ) ( not ( = ?auto_100585 ?auto_100591 ) ) ( not ( = ?auto_100586 ?auto_100587 ) ) ( not ( = ?auto_100586 ?auto_100588 ) ) ( not ( = ?auto_100586 ?auto_100589 ) ) ( not ( = ?auto_100586 ?auto_100590 ) ) ( not ( = ?auto_100586 ?auto_100591 ) ) ( not ( = ?auto_100587 ?auto_100588 ) ) ( not ( = ?auto_100587 ?auto_100589 ) ) ( not ( = ?auto_100587 ?auto_100590 ) ) ( not ( = ?auto_100587 ?auto_100591 ) ) ( not ( = ?auto_100588 ?auto_100589 ) ) ( not ( = ?auto_100588 ?auto_100590 ) ) ( not ( = ?auto_100588 ?auto_100591 ) ) ( not ( = ?auto_100589 ?auto_100590 ) ) ( not ( = ?auto_100589 ?auto_100591 ) ) ( not ( = ?auto_100590 ?auto_100591 ) ) ( ON ?auto_100589 ?auto_100590 ) ( CLEAR ?auto_100587 ) ( ON ?auto_100588 ?auto_100589 ) ( CLEAR ?auto_100588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100584 ?auto_100585 ?auto_100586 ?auto_100587 ?auto_100588 )
      ( MAKE-7PILE ?auto_100584 ?auto_100585 ?auto_100586 ?auto_100587 ?auto_100588 ?auto_100589 ?auto_100590 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100599 - BLOCK
      ?auto_100600 - BLOCK
      ?auto_100601 - BLOCK
      ?auto_100602 - BLOCK
      ?auto_100603 - BLOCK
      ?auto_100604 - BLOCK
      ?auto_100605 - BLOCK
    )
    :vars
    (
      ?auto_100606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100605 ?auto_100606 ) ( ON-TABLE ?auto_100599 ) ( ON ?auto_100600 ?auto_100599 ) ( ON ?auto_100601 ?auto_100600 ) ( not ( = ?auto_100599 ?auto_100600 ) ) ( not ( = ?auto_100599 ?auto_100601 ) ) ( not ( = ?auto_100599 ?auto_100602 ) ) ( not ( = ?auto_100599 ?auto_100603 ) ) ( not ( = ?auto_100599 ?auto_100604 ) ) ( not ( = ?auto_100599 ?auto_100605 ) ) ( not ( = ?auto_100599 ?auto_100606 ) ) ( not ( = ?auto_100600 ?auto_100601 ) ) ( not ( = ?auto_100600 ?auto_100602 ) ) ( not ( = ?auto_100600 ?auto_100603 ) ) ( not ( = ?auto_100600 ?auto_100604 ) ) ( not ( = ?auto_100600 ?auto_100605 ) ) ( not ( = ?auto_100600 ?auto_100606 ) ) ( not ( = ?auto_100601 ?auto_100602 ) ) ( not ( = ?auto_100601 ?auto_100603 ) ) ( not ( = ?auto_100601 ?auto_100604 ) ) ( not ( = ?auto_100601 ?auto_100605 ) ) ( not ( = ?auto_100601 ?auto_100606 ) ) ( not ( = ?auto_100602 ?auto_100603 ) ) ( not ( = ?auto_100602 ?auto_100604 ) ) ( not ( = ?auto_100602 ?auto_100605 ) ) ( not ( = ?auto_100602 ?auto_100606 ) ) ( not ( = ?auto_100603 ?auto_100604 ) ) ( not ( = ?auto_100603 ?auto_100605 ) ) ( not ( = ?auto_100603 ?auto_100606 ) ) ( not ( = ?auto_100604 ?auto_100605 ) ) ( not ( = ?auto_100604 ?auto_100606 ) ) ( not ( = ?auto_100605 ?auto_100606 ) ) ( ON ?auto_100604 ?auto_100605 ) ( ON ?auto_100603 ?auto_100604 ) ( CLEAR ?auto_100601 ) ( ON ?auto_100602 ?auto_100603 ) ( CLEAR ?auto_100602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100599 ?auto_100600 ?auto_100601 ?auto_100602 )
      ( MAKE-7PILE ?auto_100599 ?auto_100600 ?auto_100601 ?auto_100602 ?auto_100603 ?auto_100604 ?auto_100605 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100614 - BLOCK
      ?auto_100615 - BLOCK
      ?auto_100616 - BLOCK
      ?auto_100617 - BLOCK
      ?auto_100618 - BLOCK
      ?auto_100619 - BLOCK
      ?auto_100620 - BLOCK
    )
    :vars
    (
      ?auto_100621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100620 ?auto_100621 ) ( ON-TABLE ?auto_100614 ) ( ON ?auto_100615 ?auto_100614 ) ( ON ?auto_100616 ?auto_100615 ) ( not ( = ?auto_100614 ?auto_100615 ) ) ( not ( = ?auto_100614 ?auto_100616 ) ) ( not ( = ?auto_100614 ?auto_100617 ) ) ( not ( = ?auto_100614 ?auto_100618 ) ) ( not ( = ?auto_100614 ?auto_100619 ) ) ( not ( = ?auto_100614 ?auto_100620 ) ) ( not ( = ?auto_100614 ?auto_100621 ) ) ( not ( = ?auto_100615 ?auto_100616 ) ) ( not ( = ?auto_100615 ?auto_100617 ) ) ( not ( = ?auto_100615 ?auto_100618 ) ) ( not ( = ?auto_100615 ?auto_100619 ) ) ( not ( = ?auto_100615 ?auto_100620 ) ) ( not ( = ?auto_100615 ?auto_100621 ) ) ( not ( = ?auto_100616 ?auto_100617 ) ) ( not ( = ?auto_100616 ?auto_100618 ) ) ( not ( = ?auto_100616 ?auto_100619 ) ) ( not ( = ?auto_100616 ?auto_100620 ) ) ( not ( = ?auto_100616 ?auto_100621 ) ) ( not ( = ?auto_100617 ?auto_100618 ) ) ( not ( = ?auto_100617 ?auto_100619 ) ) ( not ( = ?auto_100617 ?auto_100620 ) ) ( not ( = ?auto_100617 ?auto_100621 ) ) ( not ( = ?auto_100618 ?auto_100619 ) ) ( not ( = ?auto_100618 ?auto_100620 ) ) ( not ( = ?auto_100618 ?auto_100621 ) ) ( not ( = ?auto_100619 ?auto_100620 ) ) ( not ( = ?auto_100619 ?auto_100621 ) ) ( not ( = ?auto_100620 ?auto_100621 ) ) ( ON ?auto_100619 ?auto_100620 ) ( ON ?auto_100618 ?auto_100619 ) ( CLEAR ?auto_100616 ) ( ON ?auto_100617 ?auto_100618 ) ( CLEAR ?auto_100617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100614 ?auto_100615 ?auto_100616 ?auto_100617 )
      ( MAKE-7PILE ?auto_100614 ?auto_100615 ?auto_100616 ?auto_100617 ?auto_100618 ?auto_100619 ?auto_100620 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100629 - BLOCK
      ?auto_100630 - BLOCK
      ?auto_100631 - BLOCK
      ?auto_100632 - BLOCK
      ?auto_100633 - BLOCK
      ?auto_100634 - BLOCK
      ?auto_100635 - BLOCK
    )
    :vars
    (
      ?auto_100636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100635 ?auto_100636 ) ( ON-TABLE ?auto_100629 ) ( ON ?auto_100630 ?auto_100629 ) ( not ( = ?auto_100629 ?auto_100630 ) ) ( not ( = ?auto_100629 ?auto_100631 ) ) ( not ( = ?auto_100629 ?auto_100632 ) ) ( not ( = ?auto_100629 ?auto_100633 ) ) ( not ( = ?auto_100629 ?auto_100634 ) ) ( not ( = ?auto_100629 ?auto_100635 ) ) ( not ( = ?auto_100629 ?auto_100636 ) ) ( not ( = ?auto_100630 ?auto_100631 ) ) ( not ( = ?auto_100630 ?auto_100632 ) ) ( not ( = ?auto_100630 ?auto_100633 ) ) ( not ( = ?auto_100630 ?auto_100634 ) ) ( not ( = ?auto_100630 ?auto_100635 ) ) ( not ( = ?auto_100630 ?auto_100636 ) ) ( not ( = ?auto_100631 ?auto_100632 ) ) ( not ( = ?auto_100631 ?auto_100633 ) ) ( not ( = ?auto_100631 ?auto_100634 ) ) ( not ( = ?auto_100631 ?auto_100635 ) ) ( not ( = ?auto_100631 ?auto_100636 ) ) ( not ( = ?auto_100632 ?auto_100633 ) ) ( not ( = ?auto_100632 ?auto_100634 ) ) ( not ( = ?auto_100632 ?auto_100635 ) ) ( not ( = ?auto_100632 ?auto_100636 ) ) ( not ( = ?auto_100633 ?auto_100634 ) ) ( not ( = ?auto_100633 ?auto_100635 ) ) ( not ( = ?auto_100633 ?auto_100636 ) ) ( not ( = ?auto_100634 ?auto_100635 ) ) ( not ( = ?auto_100634 ?auto_100636 ) ) ( not ( = ?auto_100635 ?auto_100636 ) ) ( ON ?auto_100634 ?auto_100635 ) ( ON ?auto_100633 ?auto_100634 ) ( ON ?auto_100632 ?auto_100633 ) ( CLEAR ?auto_100630 ) ( ON ?auto_100631 ?auto_100632 ) ( CLEAR ?auto_100631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100629 ?auto_100630 ?auto_100631 )
      ( MAKE-7PILE ?auto_100629 ?auto_100630 ?auto_100631 ?auto_100632 ?auto_100633 ?auto_100634 ?auto_100635 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100644 - BLOCK
      ?auto_100645 - BLOCK
      ?auto_100646 - BLOCK
      ?auto_100647 - BLOCK
      ?auto_100648 - BLOCK
      ?auto_100649 - BLOCK
      ?auto_100650 - BLOCK
    )
    :vars
    (
      ?auto_100651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100650 ?auto_100651 ) ( ON-TABLE ?auto_100644 ) ( ON ?auto_100645 ?auto_100644 ) ( not ( = ?auto_100644 ?auto_100645 ) ) ( not ( = ?auto_100644 ?auto_100646 ) ) ( not ( = ?auto_100644 ?auto_100647 ) ) ( not ( = ?auto_100644 ?auto_100648 ) ) ( not ( = ?auto_100644 ?auto_100649 ) ) ( not ( = ?auto_100644 ?auto_100650 ) ) ( not ( = ?auto_100644 ?auto_100651 ) ) ( not ( = ?auto_100645 ?auto_100646 ) ) ( not ( = ?auto_100645 ?auto_100647 ) ) ( not ( = ?auto_100645 ?auto_100648 ) ) ( not ( = ?auto_100645 ?auto_100649 ) ) ( not ( = ?auto_100645 ?auto_100650 ) ) ( not ( = ?auto_100645 ?auto_100651 ) ) ( not ( = ?auto_100646 ?auto_100647 ) ) ( not ( = ?auto_100646 ?auto_100648 ) ) ( not ( = ?auto_100646 ?auto_100649 ) ) ( not ( = ?auto_100646 ?auto_100650 ) ) ( not ( = ?auto_100646 ?auto_100651 ) ) ( not ( = ?auto_100647 ?auto_100648 ) ) ( not ( = ?auto_100647 ?auto_100649 ) ) ( not ( = ?auto_100647 ?auto_100650 ) ) ( not ( = ?auto_100647 ?auto_100651 ) ) ( not ( = ?auto_100648 ?auto_100649 ) ) ( not ( = ?auto_100648 ?auto_100650 ) ) ( not ( = ?auto_100648 ?auto_100651 ) ) ( not ( = ?auto_100649 ?auto_100650 ) ) ( not ( = ?auto_100649 ?auto_100651 ) ) ( not ( = ?auto_100650 ?auto_100651 ) ) ( ON ?auto_100649 ?auto_100650 ) ( ON ?auto_100648 ?auto_100649 ) ( ON ?auto_100647 ?auto_100648 ) ( CLEAR ?auto_100645 ) ( ON ?auto_100646 ?auto_100647 ) ( CLEAR ?auto_100646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100644 ?auto_100645 ?auto_100646 )
      ( MAKE-7PILE ?auto_100644 ?auto_100645 ?auto_100646 ?auto_100647 ?auto_100648 ?auto_100649 ?auto_100650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100659 - BLOCK
      ?auto_100660 - BLOCK
      ?auto_100661 - BLOCK
      ?auto_100662 - BLOCK
      ?auto_100663 - BLOCK
      ?auto_100664 - BLOCK
      ?auto_100665 - BLOCK
    )
    :vars
    (
      ?auto_100666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100665 ?auto_100666 ) ( ON-TABLE ?auto_100659 ) ( not ( = ?auto_100659 ?auto_100660 ) ) ( not ( = ?auto_100659 ?auto_100661 ) ) ( not ( = ?auto_100659 ?auto_100662 ) ) ( not ( = ?auto_100659 ?auto_100663 ) ) ( not ( = ?auto_100659 ?auto_100664 ) ) ( not ( = ?auto_100659 ?auto_100665 ) ) ( not ( = ?auto_100659 ?auto_100666 ) ) ( not ( = ?auto_100660 ?auto_100661 ) ) ( not ( = ?auto_100660 ?auto_100662 ) ) ( not ( = ?auto_100660 ?auto_100663 ) ) ( not ( = ?auto_100660 ?auto_100664 ) ) ( not ( = ?auto_100660 ?auto_100665 ) ) ( not ( = ?auto_100660 ?auto_100666 ) ) ( not ( = ?auto_100661 ?auto_100662 ) ) ( not ( = ?auto_100661 ?auto_100663 ) ) ( not ( = ?auto_100661 ?auto_100664 ) ) ( not ( = ?auto_100661 ?auto_100665 ) ) ( not ( = ?auto_100661 ?auto_100666 ) ) ( not ( = ?auto_100662 ?auto_100663 ) ) ( not ( = ?auto_100662 ?auto_100664 ) ) ( not ( = ?auto_100662 ?auto_100665 ) ) ( not ( = ?auto_100662 ?auto_100666 ) ) ( not ( = ?auto_100663 ?auto_100664 ) ) ( not ( = ?auto_100663 ?auto_100665 ) ) ( not ( = ?auto_100663 ?auto_100666 ) ) ( not ( = ?auto_100664 ?auto_100665 ) ) ( not ( = ?auto_100664 ?auto_100666 ) ) ( not ( = ?auto_100665 ?auto_100666 ) ) ( ON ?auto_100664 ?auto_100665 ) ( ON ?auto_100663 ?auto_100664 ) ( ON ?auto_100662 ?auto_100663 ) ( ON ?auto_100661 ?auto_100662 ) ( CLEAR ?auto_100659 ) ( ON ?auto_100660 ?auto_100661 ) ( CLEAR ?auto_100660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100659 ?auto_100660 )
      ( MAKE-7PILE ?auto_100659 ?auto_100660 ?auto_100661 ?auto_100662 ?auto_100663 ?auto_100664 ?auto_100665 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100674 - BLOCK
      ?auto_100675 - BLOCK
      ?auto_100676 - BLOCK
      ?auto_100677 - BLOCK
      ?auto_100678 - BLOCK
      ?auto_100679 - BLOCK
      ?auto_100680 - BLOCK
    )
    :vars
    (
      ?auto_100681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100680 ?auto_100681 ) ( ON-TABLE ?auto_100674 ) ( not ( = ?auto_100674 ?auto_100675 ) ) ( not ( = ?auto_100674 ?auto_100676 ) ) ( not ( = ?auto_100674 ?auto_100677 ) ) ( not ( = ?auto_100674 ?auto_100678 ) ) ( not ( = ?auto_100674 ?auto_100679 ) ) ( not ( = ?auto_100674 ?auto_100680 ) ) ( not ( = ?auto_100674 ?auto_100681 ) ) ( not ( = ?auto_100675 ?auto_100676 ) ) ( not ( = ?auto_100675 ?auto_100677 ) ) ( not ( = ?auto_100675 ?auto_100678 ) ) ( not ( = ?auto_100675 ?auto_100679 ) ) ( not ( = ?auto_100675 ?auto_100680 ) ) ( not ( = ?auto_100675 ?auto_100681 ) ) ( not ( = ?auto_100676 ?auto_100677 ) ) ( not ( = ?auto_100676 ?auto_100678 ) ) ( not ( = ?auto_100676 ?auto_100679 ) ) ( not ( = ?auto_100676 ?auto_100680 ) ) ( not ( = ?auto_100676 ?auto_100681 ) ) ( not ( = ?auto_100677 ?auto_100678 ) ) ( not ( = ?auto_100677 ?auto_100679 ) ) ( not ( = ?auto_100677 ?auto_100680 ) ) ( not ( = ?auto_100677 ?auto_100681 ) ) ( not ( = ?auto_100678 ?auto_100679 ) ) ( not ( = ?auto_100678 ?auto_100680 ) ) ( not ( = ?auto_100678 ?auto_100681 ) ) ( not ( = ?auto_100679 ?auto_100680 ) ) ( not ( = ?auto_100679 ?auto_100681 ) ) ( not ( = ?auto_100680 ?auto_100681 ) ) ( ON ?auto_100679 ?auto_100680 ) ( ON ?auto_100678 ?auto_100679 ) ( ON ?auto_100677 ?auto_100678 ) ( ON ?auto_100676 ?auto_100677 ) ( CLEAR ?auto_100674 ) ( ON ?auto_100675 ?auto_100676 ) ( CLEAR ?auto_100675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100674 ?auto_100675 )
      ( MAKE-7PILE ?auto_100674 ?auto_100675 ?auto_100676 ?auto_100677 ?auto_100678 ?auto_100679 ?auto_100680 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100689 - BLOCK
      ?auto_100690 - BLOCK
      ?auto_100691 - BLOCK
      ?auto_100692 - BLOCK
      ?auto_100693 - BLOCK
      ?auto_100694 - BLOCK
      ?auto_100695 - BLOCK
    )
    :vars
    (
      ?auto_100696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100695 ?auto_100696 ) ( not ( = ?auto_100689 ?auto_100690 ) ) ( not ( = ?auto_100689 ?auto_100691 ) ) ( not ( = ?auto_100689 ?auto_100692 ) ) ( not ( = ?auto_100689 ?auto_100693 ) ) ( not ( = ?auto_100689 ?auto_100694 ) ) ( not ( = ?auto_100689 ?auto_100695 ) ) ( not ( = ?auto_100689 ?auto_100696 ) ) ( not ( = ?auto_100690 ?auto_100691 ) ) ( not ( = ?auto_100690 ?auto_100692 ) ) ( not ( = ?auto_100690 ?auto_100693 ) ) ( not ( = ?auto_100690 ?auto_100694 ) ) ( not ( = ?auto_100690 ?auto_100695 ) ) ( not ( = ?auto_100690 ?auto_100696 ) ) ( not ( = ?auto_100691 ?auto_100692 ) ) ( not ( = ?auto_100691 ?auto_100693 ) ) ( not ( = ?auto_100691 ?auto_100694 ) ) ( not ( = ?auto_100691 ?auto_100695 ) ) ( not ( = ?auto_100691 ?auto_100696 ) ) ( not ( = ?auto_100692 ?auto_100693 ) ) ( not ( = ?auto_100692 ?auto_100694 ) ) ( not ( = ?auto_100692 ?auto_100695 ) ) ( not ( = ?auto_100692 ?auto_100696 ) ) ( not ( = ?auto_100693 ?auto_100694 ) ) ( not ( = ?auto_100693 ?auto_100695 ) ) ( not ( = ?auto_100693 ?auto_100696 ) ) ( not ( = ?auto_100694 ?auto_100695 ) ) ( not ( = ?auto_100694 ?auto_100696 ) ) ( not ( = ?auto_100695 ?auto_100696 ) ) ( ON ?auto_100694 ?auto_100695 ) ( ON ?auto_100693 ?auto_100694 ) ( ON ?auto_100692 ?auto_100693 ) ( ON ?auto_100691 ?auto_100692 ) ( ON ?auto_100690 ?auto_100691 ) ( ON ?auto_100689 ?auto_100690 ) ( CLEAR ?auto_100689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100689 )
      ( MAKE-7PILE ?auto_100689 ?auto_100690 ?auto_100691 ?auto_100692 ?auto_100693 ?auto_100694 ?auto_100695 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_100704 - BLOCK
      ?auto_100705 - BLOCK
      ?auto_100706 - BLOCK
      ?auto_100707 - BLOCK
      ?auto_100708 - BLOCK
      ?auto_100709 - BLOCK
      ?auto_100710 - BLOCK
    )
    :vars
    (
      ?auto_100711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100710 ?auto_100711 ) ( not ( = ?auto_100704 ?auto_100705 ) ) ( not ( = ?auto_100704 ?auto_100706 ) ) ( not ( = ?auto_100704 ?auto_100707 ) ) ( not ( = ?auto_100704 ?auto_100708 ) ) ( not ( = ?auto_100704 ?auto_100709 ) ) ( not ( = ?auto_100704 ?auto_100710 ) ) ( not ( = ?auto_100704 ?auto_100711 ) ) ( not ( = ?auto_100705 ?auto_100706 ) ) ( not ( = ?auto_100705 ?auto_100707 ) ) ( not ( = ?auto_100705 ?auto_100708 ) ) ( not ( = ?auto_100705 ?auto_100709 ) ) ( not ( = ?auto_100705 ?auto_100710 ) ) ( not ( = ?auto_100705 ?auto_100711 ) ) ( not ( = ?auto_100706 ?auto_100707 ) ) ( not ( = ?auto_100706 ?auto_100708 ) ) ( not ( = ?auto_100706 ?auto_100709 ) ) ( not ( = ?auto_100706 ?auto_100710 ) ) ( not ( = ?auto_100706 ?auto_100711 ) ) ( not ( = ?auto_100707 ?auto_100708 ) ) ( not ( = ?auto_100707 ?auto_100709 ) ) ( not ( = ?auto_100707 ?auto_100710 ) ) ( not ( = ?auto_100707 ?auto_100711 ) ) ( not ( = ?auto_100708 ?auto_100709 ) ) ( not ( = ?auto_100708 ?auto_100710 ) ) ( not ( = ?auto_100708 ?auto_100711 ) ) ( not ( = ?auto_100709 ?auto_100710 ) ) ( not ( = ?auto_100709 ?auto_100711 ) ) ( not ( = ?auto_100710 ?auto_100711 ) ) ( ON ?auto_100709 ?auto_100710 ) ( ON ?auto_100708 ?auto_100709 ) ( ON ?auto_100707 ?auto_100708 ) ( ON ?auto_100706 ?auto_100707 ) ( ON ?auto_100705 ?auto_100706 ) ( ON ?auto_100704 ?auto_100705 ) ( CLEAR ?auto_100704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100704 )
      ( MAKE-7PILE ?auto_100704 ?auto_100705 ?auto_100706 ?auto_100707 ?auto_100708 ?auto_100709 ?auto_100710 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100720 - BLOCK
      ?auto_100721 - BLOCK
      ?auto_100722 - BLOCK
      ?auto_100723 - BLOCK
      ?auto_100724 - BLOCK
      ?auto_100725 - BLOCK
      ?auto_100726 - BLOCK
      ?auto_100727 - BLOCK
    )
    :vars
    (
      ?auto_100728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100726 ) ( ON ?auto_100727 ?auto_100728 ) ( CLEAR ?auto_100727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100720 ) ( ON ?auto_100721 ?auto_100720 ) ( ON ?auto_100722 ?auto_100721 ) ( ON ?auto_100723 ?auto_100722 ) ( ON ?auto_100724 ?auto_100723 ) ( ON ?auto_100725 ?auto_100724 ) ( ON ?auto_100726 ?auto_100725 ) ( not ( = ?auto_100720 ?auto_100721 ) ) ( not ( = ?auto_100720 ?auto_100722 ) ) ( not ( = ?auto_100720 ?auto_100723 ) ) ( not ( = ?auto_100720 ?auto_100724 ) ) ( not ( = ?auto_100720 ?auto_100725 ) ) ( not ( = ?auto_100720 ?auto_100726 ) ) ( not ( = ?auto_100720 ?auto_100727 ) ) ( not ( = ?auto_100720 ?auto_100728 ) ) ( not ( = ?auto_100721 ?auto_100722 ) ) ( not ( = ?auto_100721 ?auto_100723 ) ) ( not ( = ?auto_100721 ?auto_100724 ) ) ( not ( = ?auto_100721 ?auto_100725 ) ) ( not ( = ?auto_100721 ?auto_100726 ) ) ( not ( = ?auto_100721 ?auto_100727 ) ) ( not ( = ?auto_100721 ?auto_100728 ) ) ( not ( = ?auto_100722 ?auto_100723 ) ) ( not ( = ?auto_100722 ?auto_100724 ) ) ( not ( = ?auto_100722 ?auto_100725 ) ) ( not ( = ?auto_100722 ?auto_100726 ) ) ( not ( = ?auto_100722 ?auto_100727 ) ) ( not ( = ?auto_100722 ?auto_100728 ) ) ( not ( = ?auto_100723 ?auto_100724 ) ) ( not ( = ?auto_100723 ?auto_100725 ) ) ( not ( = ?auto_100723 ?auto_100726 ) ) ( not ( = ?auto_100723 ?auto_100727 ) ) ( not ( = ?auto_100723 ?auto_100728 ) ) ( not ( = ?auto_100724 ?auto_100725 ) ) ( not ( = ?auto_100724 ?auto_100726 ) ) ( not ( = ?auto_100724 ?auto_100727 ) ) ( not ( = ?auto_100724 ?auto_100728 ) ) ( not ( = ?auto_100725 ?auto_100726 ) ) ( not ( = ?auto_100725 ?auto_100727 ) ) ( not ( = ?auto_100725 ?auto_100728 ) ) ( not ( = ?auto_100726 ?auto_100727 ) ) ( not ( = ?auto_100726 ?auto_100728 ) ) ( not ( = ?auto_100727 ?auto_100728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100727 ?auto_100728 )
      ( !STACK ?auto_100727 ?auto_100726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100737 - BLOCK
      ?auto_100738 - BLOCK
      ?auto_100739 - BLOCK
      ?auto_100740 - BLOCK
      ?auto_100741 - BLOCK
      ?auto_100742 - BLOCK
      ?auto_100743 - BLOCK
      ?auto_100744 - BLOCK
    )
    :vars
    (
      ?auto_100745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100743 ) ( ON ?auto_100744 ?auto_100745 ) ( CLEAR ?auto_100744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100737 ) ( ON ?auto_100738 ?auto_100737 ) ( ON ?auto_100739 ?auto_100738 ) ( ON ?auto_100740 ?auto_100739 ) ( ON ?auto_100741 ?auto_100740 ) ( ON ?auto_100742 ?auto_100741 ) ( ON ?auto_100743 ?auto_100742 ) ( not ( = ?auto_100737 ?auto_100738 ) ) ( not ( = ?auto_100737 ?auto_100739 ) ) ( not ( = ?auto_100737 ?auto_100740 ) ) ( not ( = ?auto_100737 ?auto_100741 ) ) ( not ( = ?auto_100737 ?auto_100742 ) ) ( not ( = ?auto_100737 ?auto_100743 ) ) ( not ( = ?auto_100737 ?auto_100744 ) ) ( not ( = ?auto_100737 ?auto_100745 ) ) ( not ( = ?auto_100738 ?auto_100739 ) ) ( not ( = ?auto_100738 ?auto_100740 ) ) ( not ( = ?auto_100738 ?auto_100741 ) ) ( not ( = ?auto_100738 ?auto_100742 ) ) ( not ( = ?auto_100738 ?auto_100743 ) ) ( not ( = ?auto_100738 ?auto_100744 ) ) ( not ( = ?auto_100738 ?auto_100745 ) ) ( not ( = ?auto_100739 ?auto_100740 ) ) ( not ( = ?auto_100739 ?auto_100741 ) ) ( not ( = ?auto_100739 ?auto_100742 ) ) ( not ( = ?auto_100739 ?auto_100743 ) ) ( not ( = ?auto_100739 ?auto_100744 ) ) ( not ( = ?auto_100739 ?auto_100745 ) ) ( not ( = ?auto_100740 ?auto_100741 ) ) ( not ( = ?auto_100740 ?auto_100742 ) ) ( not ( = ?auto_100740 ?auto_100743 ) ) ( not ( = ?auto_100740 ?auto_100744 ) ) ( not ( = ?auto_100740 ?auto_100745 ) ) ( not ( = ?auto_100741 ?auto_100742 ) ) ( not ( = ?auto_100741 ?auto_100743 ) ) ( not ( = ?auto_100741 ?auto_100744 ) ) ( not ( = ?auto_100741 ?auto_100745 ) ) ( not ( = ?auto_100742 ?auto_100743 ) ) ( not ( = ?auto_100742 ?auto_100744 ) ) ( not ( = ?auto_100742 ?auto_100745 ) ) ( not ( = ?auto_100743 ?auto_100744 ) ) ( not ( = ?auto_100743 ?auto_100745 ) ) ( not ( = ?auto_100744 ?auto_100745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_100744 ?auto_100745 )
      ( !STACK ?auto_100744 ?auto_100743 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100754 - BLOCK
      ?auto_100755 - BLOCK
      ?auto_100756 - BLOCK
      ?auto_100757 - BLOCK
      ?auto_100758 - BLOCK
      ?auto_100759 - BLOCK
      ?auto_100760 - BLOCK
      ?auto_100761 - BLOCK
    )
    :vars
    (
      ?auto_100762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100761 ?auto_100762 ) ( ON-TABLE ?auto_100754 ) ( ON ?auto_100755 ?auto_100754 ) ( ON ?auto_100756 ?auto_100755 ) ( ON ?auto_100757 ?auto_100756 ) ( ON ?auto_100758 ?auto_100757 ) ( ON ?auto_100759 ?auto_100758 ) ( not ( = ?auto_100754 ?auto_100755 ) ) ( not ( = ?auto_100754 ?auto_100756 ) ) ( not ( = ?auto_100754 ?auto_100757 ) ) ( not ( = ?auto_100754 ?auto_100758 ) ) ( not ( = ?auto_100754 ?auto_100759 ) ) ( not ( = ?auto_100754 ?auto_100760 ) ) ( not ( = ?auto_100754 ?auto_100761 ) ) ( not ( = ?auto_100754 ?auto_100762 ) ) ( not ( = ?auto_100755 ?auto_100756 ) ) ( not ( = ?auto_100755 ?auto_100757 ) ) ( not ( = ?auto_100755 ?auto_100758 ) ) ( not ( = ?auto_100755 ?auto_100759 ) ) ( not ( = ?auto_100755 ?auto_100760 ) ) ( not ( = ?auto_100755 ?auto_100761 ) ) ( not ( = ?auto_100755 ?auto_100762 ) ) ( not ( = ?auto_100756 ?auto_100757 ) ) ( not ( = ?auto_100756 ?auto_100758 ) ) ( not ( = ?auto_100756 ?auto_100759 ) ) ( not ( = ?auto_100756 ?auto_100760 ) ) ( not ( = ?auto_100756 ?auto_100761 ) ) ( not ( = ?auto_100756 ?auto_100762 ) ) ( not ( = ?auto_100757 ?auto_100758 ) ) ( not ( = ?auto_100757 ?auto_100759 ) ) ( not ( = ?auto_100757 ?auto_100760 ) ) ( not ( = ?auto_100757 ?auto_100761 ) ) ( not ( = ?auto_100757 ?auto_100762 ) ) ( not ( = ?auto_100758 ?auto_100759 ) ) ( not ( = ?auto_100758 ?auto_100760 ) ) ( not ( = ?auto_100758 ?auto_100761 ) ) ( not ( = ?auto_100758 ?auto_100762 ) ) ( not ( = ?auto_100759 ?auto_100760 ) ) ( not ( = ?auto_100759 ?auto_100761 ) ) ( not ( = ?auto_100759 ?auto_100762 ) ) ( not ( = ?auto_100760 ?auto_100761 ) ) ( not ( = ?auto_100760 ?auto_100762 ) ) ( not ( = ?auto_100761 ?auto_100762 ) ) ( CLEAR ?auto_100759 ) ( ON ?auto_100760 ?auto_100761 ) ( CLEAR ?auto_100760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100754 ?auto_100755 ?auto_100756 ?auto_100757 ?auto_100758 ?auto_100759 ?auto_100760 )
      ( MAKE-8PILE ?auto_100754 ?auto_100755 ?auto_100756 ?auto_100757 ?auto_100758 ?auto_100759 ?auto_100760 ?auto_100761 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100771 - BLOCK
      ?auto_100772 - BLOCK
      ?auto_100773 - BLOCK
      ?auto_100774 - BLOCK
      ?auto_100775 - BLOCK
      ?auto_100776 - BLOCK
      ?auto_100777 - BLOCK
      ?auto_100778 - BLOCK
    )
    :vars
    (
      ?auto_100779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100778 ?auto_100779 ) ( ON-TABLE ?auto_100771 ) ( ON ?auto_100772 ?auto_100771 ) ( ON ?auto_100773 ?auto_100772 ) ( ON ?auto_100774 ?auto_100773 ) ( ON ?auto_100775 ?auto_100774 ) ( ON ?auto_100776 ?auto_100775 ) ( not ( = ?auto_100771 ?auto_100772 ) ) ( not ( = ?auto_100771 ?auto_100773 ) ) ( not ( = ?auto_100771 ?auto_100774 ) ) ( not ( = ?auto_100771 ?auto_100775 ) ) ( not ( = ?auto_100771 ?auto_100776 ) ) ( not ( = ?auto_100771 ?auto_100777 ) ) ( not ( = ?auto_100771 ?auto_100778 ) ) ( not ( = ?auto_100771 ?auto_100779 ) ) ( not ( = ?auto_100772 ?auto_100773 ) ) ( not ( = ?auto_100772 ?auto_100774 ) ) ( not ( = ?auto_100772 ?auto_100775 ) ) ( not ( = ?auto_100772 ?auto_100776 ) ) ( not ( = ?auto_100772 ?auto_100777 ) ) ( not ( = ?auto_100772 ?auto_100778 ) ) ( not ( = ?auto_100772 ?auto_100779 ) ) ( not ( = ?auto_100773 ?auto_100774 ) ) ( not ( = ?auto_100773 ?auto_100775 ) ) ( not ( = ?auto_100773 ?auto_100776 ) ) ( not ( = ?auto_100773 ?auto_100777 ) ) ( not ( = ?auto_100773 ?auto_100778 ) ) ( not ( = ?auto_100773 ?auto_100779 ) ) ( not ( = ?auto_100774 ?auto_100775 ) ) ( not ( = ?auto_100774 ?auto_100776 ) ) ( not ( = ?auto_100774 ?auto_100777 ) ) ( not ( = ?auto_100774 ?auto_100778 ) ) ( not ( = ?auto_100774 ?auto_100779 ) ) ( not ( = ?auto_100775 ?auto_100776 ) ) ( not ( = ?auto_100775 ?auto_100777 ) ) ( not ( = ?auto_100775 ?auto_100778 ) ) ( not ( = ?auto_100775 ?auto_100779 ) ) ( not ( = ?auto_100776 ?auto_100777 ) ) ( not ( = ?auto_100776 ?auto_100778 ) ) ( not ( = ?auto_100776 ?auto_100779 ) ) ( not ( = ?auto_100777 ?auto_100778 ) ) ( not ( = ?auto_100777 ?auto_100779 ) ) ( not ( = ?auto_100778 ?auto_100779 ) ) ( CLEAR ?auto_100776 ) ( ON ?auto_100777 ?auto_100778 ) ( CLEAR ?auto_100777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_100771 ?auto_100772 ?auto_100773 ?auto_100774 ?auto_100775 ?auto_100776 ?auto_100777 )
      ( MAKE-8PILE ?auto_100771 ?auto_100772 ?auto_100773 ?auto_100774 ?auto_100775 ?auto_100776 ?auto_100777 ?auto_100778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100788 - BLOCK
      ?auto_100789 - BLOCK
      ?auto_100790 - BLOCK
      ?auto_100791 - BLOCK
      ?auto_100792 - BLOCK
      ?auto_100793 - BLOCK
      ?auto_100794 - BLOCK
      ?auto_100795 - BLOCK
    )
    :vars
    (
      ?auto_100796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100795 ?auto_100796 ) ( ON-TABLE ?auto_100788 ) ( ON ?auto_100789 ?auto_100788 ) ( ON ?auto_100790 ?auto_100789 ) ( ON ?auto_100791 ?auto_100790 ) ( ON ?auto_100792 ?auto_100791 ) ( not ( = ?auto_100788 ?auto_100789 ) ) ( not ( = ?auto_100788 ?auto_100790 ) ) ( not ( = ?auto_100788 ?auto_100791 ) ) ( not ( = ?auto_100788 ?auto_100792 ) ) ( not ( = ?auto_100788 ?auto_100793 ) ) ( not ( = ?auto_100788 ?auto_100794 ) ) ( not ( = ?auto_100788 ?auto_100795 ) ) ( not ( = ?auto_100788 ?auto_100796 ) ) ( not ( = ?auto_100789 ?auto_100790 ) ) ( not ( = ?auto_100789 ?auto_100791 ) ) ( not ( = ?auto_100789 ?auto_100792 ) ) ( not ( = ?auto_100789 ?auto_100793 ) ) ( not ( = ?auto_100789 ?auto_100794 ) ) ( not ( = ?auto_100789 ?auto_100795 ) ) ( not ( = ?auto_100789 ?auto_100796 ) ) ( not ( = ?auto_100790 ?auto_100791 ) ) ( not ( = ?auto_100790 ?auto_100792 ) ) ( not ( = ?auto_100790 ?auto_100793 ) ) ( not ( = ?auto_100790 ?auto_100794 ) ) ( not ( = ?auto_100790 ?auto_100795 ) ) ( not ( = ?auto_100790 ?auto_100796 ) ) ( not ( = ?auto_100791 ?auto_100792 ) ) ( not ( = ?auto_100791 ?auto_100793 ) ) ( not ( = ?auto_100791 ?auto_100794 ) ) ( not ( = ?auto_100791 ?auto_100795 ) ) ( not ( = ?auto_100791 ?auto_100796 ) ) ( not ( = ?auto_100792 ?auto_100793 ) ) ( not ( = ?auto_100792 ?auto_100794 ) ) ( not ( = ?auto_100792 ?auto_100795 ) ) ( not ( = ?auto_100792 ?auto_100796 ) ) ( not ( = ?auto_100793 ?auto_100794 ) ) ( not ( = ?auto_100793 ?auto_100795 ) ) ( not ( = ?auto_100793 ?auto_100796 ) ) ( not ( = ?auto_100794 ?auto_100795 ) ) ( not ( = ?auto_100794 ?auto_100796 ) ) ( not ( = ?auto_100795 ?auto_100796 ) ) ( ON ?auto_100794 ?auto_100795 ) ( CLEAR ?auto_100792 ) ( ON ?auto_100793 ?auto_100794 ) ( CLEAR ?auto_100793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100788 ?auto_100789 ?auto_100790 ?auto_100791 ?auto_100792 ?auto_100793 )
      ( MAKE-8PILE ?auto_100788 ?auto_100789 ?auto_100790 ?auto_100791 ?auto_100792 ?auto_100793 ?auto_100794 ?auto_100795 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100805 - BLOCK
      ?auto_100806 - BLOCK
      ?auto_100807 - BLOCK
      ?auto_100808 - BLOCK
      ?auto_100809 - BLOCK
      ?auto_100810 - BLOCK
      ?auto_100811 - BLOCK
      ?auto_100812 - BLOCK
    )
    :vars
    (
      ?auto_100813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100812 ?auto_100813 ) ( ON-TABLE ?auto_100805 ) ( ON ?auto_100806 ?auto_100805 ) ( ON ?auto_100807 ?auto_100806 ) ( ON ?auto_100808 ?auto_100807 ) ( ON ?auto_100809 ?auto_100808 ) ( not ( = ?auto_100805 ?auto_100806 ) ) ( not ( = ?auto_100805 ?auto_100807 ) ) ( not ( = ?auto_100805 ?auto_100808 ) ) ( not ( = ?auto_100805 ?auto_100809 ) ) ( not ( = ?auto_100805 ?auto_100810 ) ) ( not ( = ?auto_100805 ?auto_100811 ) ) ( not ( = ?auto_100805 ?auto_100812 ) ) ( not ( = ?auto_100805 ?auto_100813 ) ) ( not ( = ?auto_100806 ?auto_100807 ) ) ( not ( = ?auto_100806 ?auto_100808 ) ) ( not ( = ?auto_100806 ?auto_100809 ) ) ( not ( = ?auto_100806 ?auto_100810 ) ) ( not ( = ?auto_100806 ?auto_100811 ) ) ( not ( = ?auto_100806 ?auto_100812 ) ) ( not ( = ?auto_100806 ?auto_100813 ) ) ( not ( = ?auto_100807 ?auto_100808 ) ) ( not ( = ?auto_100807 ?auto_100809 ) ) ( not ( = ?auto_100807 ?auto_100810 ) ) ( not ( = ?auto_100807 ?auto_100811 ) ) ( not ( = ?auto_100807 ?auto_100812 ) ) ( not ( = ?auto_100807 ?auto_100813 ) ) ( not ( = ?auto_100808 ?auto_100809 ) ) ( not ( = ?auto_100808 ?auto_100810 ) ) ( not ( = ?auto_100808 ?auto_100811 ) ) ( not ( = ?auto_100808 ?auto_100812 ) ) ( not ( = ?auto_100808 ?auto_100813 ) ) ( not ( = ?auto_100809 ?auto_100810 ) ) ( not ( = ?auto_100809 ?auto_100811 ) ) ( not ( = ?auto_100809 ?auto_100812 ) ) ( not ( = ?auto_100809 ?auto_100813 ) ) ( not ( = ?auto_100810 ?auto_100811 ) ) ( not ( = ?auto_100810 ?auto_100812 ) ) ( not ( = ?auto_100810 ?auto_100813 ) ) ( not ( = ?auto_100811 ?auto_100812 ) ) ( not ( = ?auto_100811 ?auto_100813 ) ) ( not ( = ?auto_100812 ?auto_100813 ) ) ( ON ?auto_100811 ?auto_100812 ) ( CLEAR ?auto_100809 ) ( ON ?auto_100810 ?auto_100811 ) ( CLEAR ?auto_100810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_100805 ?auto_100806 ?auto_100807 ?auto_100808 ?auto_100809 ?auto_100810 )
      ( MAKE-8PILE ?auto_100805 ?auto_100806 ?auto_100807 ?auto_100808 ?auto_100809 ?auto_100810 ?auto_100811 ?auto_100812 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100822 - BLOCK
      ?auto_100823 - BLOCK
      ?auto_100824 - BLOCK
      ?auto_100825 - BLOCK
      ?auto_100826 - BLOCK
      ?auto_100827 - BLOCK
      ?auto_100828 - BLOCK
      ?auto_100829 - BLOCK
    )
    :vars
    (
      ?auto_100830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100829 ?auto_100830 ) ( ON-TABLE ?auto_100822 ) ( ON ?auto_100823 ?auto_100822 ) ( ON ?auto_100824 ?auto_100823 ) ( ON ?auto_100825 ?auto_100824 ) ( not ( = ?auto_100822 ?auto_100823 ) ) ( not ( = ?auto_100822 ?auto_100824 ) ) ( not ( = ?auto_100822 ?auto_100825 ) ) ( not ( = ?auto_100822 ?auto_100826 ) ) ( not ( = ?auto_100822 ?auto_100827 ) ) ( not ( = ?auto_100822 ?auto_100828 ) ) ( not ( = ?auto_100822 ?auto_100829 ) ) ( not ( = ?auto_100822 ?auto_100830 ) ) ( not ( = ?auto_100823 ?auto_100824 ) ) ( not ( = ?auto_100823 ?auto_100825 ) ) ( not ( = ?auto_100823 ?auto_100826 ) ) ( not ( = ?auto_100823 ?auto_100827 ) ) ( not ( = ?auto_100823 ?auto_100828 ) ) ( not ( = ?auto_100823 ?auto_100829 ) ) ( not ( = ?auto_100823 ?auto_100830 ) ) ( not ( = ?auto_100824 ?auto_100825 ) ) ( not ( = ?auto_100824 ?auto_100826 ) ) ( not ( = ?auto_100824 ?auto_100827 ) ) ( not ( = ?auto_100824 ?auto_100828 ) ) ( not ( = ?auto_100824 ?auto_100829 ) ) ( not ( = ?auto_100824 ?auto_100830 ) ) ( not ( = ?auto_100825 ?auto_100826 ) ) ( not ( = ?auto_100825 ?auto_100827 ) ) ( not ( = ?auto_100825 ?auto_100828 ) ) ( not ( = ?auto_100825 ?auto_100829 ) ) ( not ( = ?auto_100825 ?auto_100830 ) ) ( not ( = ?auto_100826 ?auto_100827 ) ) ( not ( = ?auto_100826 ?auto_100828 ) ) ( not ( = ?auto_100826 ?auto_100829 ) ) ( not ( = ?auto_100826 ?auto_100830 ) ) ( not ( = ?auto_100827 ?auto_100828 ) ) ( not ( = ?auto_100827 ?auto_100829 ) ) ( not ( = ?auto_100827 ?auto_100830 ) ) ( not ( = ?auto_100828 ?auto_100829 ) ) ( not ( = ?auto_100828 ?auto_100830 ) ) ( not ( = ?auto_100829 ?auto_100830 ) ) ( ON ?auto_100828 ?auto_100829 ) ( ON ?auto_100827 ?auto_100828 ) ( CLEAR ?auto_100825 ) ( ON ?auto_100826 ?auto_100827 ) ( CLEAR ?auto_100826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100822 ?auto_100823 ?auto_100824 ?auto_100825 ?auto_100826 )
      ( MAKE-8PILE ?auto_100822 ?auto_100823 ?auto_100824 ?auto_100825 ?auto_100826 ?auto_100827 ?auto_100828 ?auto_100829 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100839 - BLOCK
      ?auto_100840 - BLOCK
      ?auto_100841 - BLOCK
      ?auto_100842 - BLOCK
      ?auto_100843 - BLOCK
      ?auto_100844 - BLOCK
      ?auto_100845 - BLOCK
      ?auto_100846 - BLOCK
    )
    :vars
    (
      ?auto_100847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100846 ?auto_100847 ) ( ON-TABLE ?auto_100839 ) ( ON ?auto_100840 ?auto_100839 ) ( ON ?auto_100841 ?auto_100840 ) ( ON ?auto_100842 ?auto_100841 ) ( not ( = ?auto_100839 ?auto_100840 ) ) ( not ( = ?auto_100839 ?auto_100841 ) ) ( not ( = ?auto_100839 ?auto_100842 ) ) ( not ( = ?auto_100839 ?auto_100843 ) ) ( not ( = ?auto_100839 ?auto_100844 ) ) ( not ( = ?auto_100839 ?auto_100845 ) ) ( not ( = ?auto_100839 ?auto_100846 ) ) ( not ( = ?auto_100839 ?auto_100847 ) ) ( not ( = ?auto_100840 ?auto_100841 ) ) ( not ( = ?auto_100840 ?auto_100842 ) ) ( not ( = ?auto_100840 ?auto_100843 ) ) ( not ( = ?auto_100840 ?auto_100844 ) ) ( not ( = ?auto_100840 ?auto_100845 ) ) ( not ( = ?auto_100840 ?auto_100846 ) ) ( not ( = ?auto_100840 ?auto_100847 ) ) ( not ( = ?auto_100841 ?auto_100842 ) ) ( not ( = ?auto_100841 ?auto_100843 ) ) ( not ( = ?auto_100841 ?auto_100844 ) ) ( not ( = ?auto_100841 ?auto_100845 ) ) ( not ( = ?auto_100841 ?auto_100846 ) ) ( not ( = ?auto_100841 ?auto_100847 ) ) ( not ( = ?auto_100842 ?auto_100843 ) ) ( not ( = ?auto_100842 ?auto_100844 ) ) ( not ( = ?auto_100842 ?auto_100845 ) ) ( not ( = ?auto_100842 ?auto_100846 ) ) ( not ( = ?auto_100842 ?auto_100847 ) ) ( not ( = ?auto_100843 ?auto_100844 ) ) ( not ( = ?auto_100843 ?auto_100845 ) ) ( not ( = ?auto_100843 ?auto_100846 ) ) ( not ( = ?auto_100843 ?auto_100847 ) ) ( not ( = ?auto_100844 ?auto_100845 ) ) ( not ( = ?auto_100844 ?auto_100846 ) ) ( not ( = ?auto_100844 ?auto_100847 ) ) ( not ( = ?auto_100845 ?auto_100846 ) ) ( not ( = ?auto_100845 ?auto_100847 ) ) ( not ( = ?auto_100846 ?auto_100847 ) ) ( ON ?auto_100845 ?auto_100846 ) ( ON ?auto_100844 ?auto_100845 ) ( CLEAR ?auto_100842 ) ( ON ?auto_100843 ?auto_100844 ) ( CLEAR ?auto_100843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_100839 ?auto_100840 ?auto_100841 ?auto_100842 ?auto_100843 )
      ( MAKE-8PILE ?auto_100839 ?auto_100840 ?auto_100841 ?auto_100842 ?auto_100843 ?auto_100844 ?auto_100845 ?auto_100846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100856 - BLOCK
      ?auto_100857 - BLOCK
      ?auto_100858 - BLOCK
      ?auto_100859 - BLOCK
      ?auto_100860 - BLOCK
      ?auto_100861 - BLOCK
      ?auto_100862 - BLOCK
      ?auto_100863 - BLOCK
    )
    :vars
    (
      ?auto_100864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100863 ?auto_100864 ) ( ON-TABLE ?auto_100856 ) ( ON ?auto_100857 ?auto_100856 ) ( ON ?auto_100858 ?auto_100857 ) ( not ( = ?auto_100856 ?auto_100857 ) ) ( not ( = ?auto_100856 ?auto_100858 ) ) ( not ( = ?auto_100856 ?auto_100859 ) ) ( not ( = ?auto_100856 ?auto_100860 ) ) ( not ( = ?auto_100856 ?auto_100861 ) ) ( not ( = ?auto_100856 ?auto_100862 ) ) ( not ( = ?auto_100856 ?auto_100863 ) ) ( not ( = ?auto_100856 ?auto_100864 ) ) ( not ( = ?auto_100857 ?auto_100858 ) ) ( not ( = ?auto_100857 ?auto_100859 ) ) ( not ( = ?auto_100857 ?auto_100860 ) ) ( not ( = ?auto_100857 ?auto_100861 ) ) ( not ( = ?auto_100857 ?auto_100862 ) ) ( not ( = ?auto_100857 ?auto_100863 ) ) ( not ( = ?auto_100857 ?auto_100864 ) ) ( not ( = ?auto_100858 ?auto_100859 ) ) ( not ( = ?auto_100858 ?auto_100860 ) ) ( not ( = ?auto_100858 ?auto_100861 ) ) ( not ( = ?auto_100858 ?auto_100862 ) ) ( not ( = ?auto_100858 ?auto_100863 ) ) ( not ( = ?auto_100858 ?auto_100864 ) ) ( not ( = ?auto_100859 ?auto_100860 ) ) ( not ( = ?auto_100859 ?auto_100861 ) ) ( not ( = ?auto_100859 ?auto_100862 ) ) ( not ( = ?auto_100859 ?auto_100863 ) ) ( not ( = ?auto_100859 ?auto_100864 ) ) ( not ( = ?auto_100860 ?auto_100861 ) ) ( not ( = ?auto_100860 ?auto_100862 ) ) ( not ( = ?auto_100860 ?auto_100863 ) ) ( not ( = ?auto_100860 ?auto_100864 ) ) ( not ( = ?auto_100861 ?auto_100862 ) ) ( not ( = ?auto_100861 ?auto_100863 ) ) ( not ( = ?auto_100861 ?auto_100864 ) ) ( not ( = ?auto_100862 ?auto_100863 ) ) ( not ( = ?auto_100862 ?auto_100864 ) ) ( not ( = ?auto_100863 ?auto_100864 ) ) ( ON ?auto_100862 ?auto_100863 ) ( ON ?auto_100861 ?auto_100862 ) ( ON ?auto_100860 ?auto_100861 ) ( CLEAR ?auto_100858 ) ( ON ?auto_100859 ?auto_100860 ) ( CLEAR ?auto_100859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100856 ?auto_100857 ?auto_100858 ?auto_100859 )
      ( MAKE-8PILE ?auto_100856 ?auto_100857 ?auto_100858 ?auto_100859 ?auto_100860 ?auto_100861 ?auto_100862 ?auto_100863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100873 - BLOCK
      ?auto_100874 - BLOCK
      ?auto_100875 - BLOCK
      ?auto_100876 - BLOCK
      ?auto_100877 - BLOCK
      ?auto_100878 - BLOCK
      ?auto_100879 - BLOCK
      ?auto_100880 - BLOCK
    )
    :vars
    (
      ?auto_100881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100880 ?auto_100881 ) ( ON-TABLE ?auto_100873 ) ( ON ?auto_100874 ?auto_100873 ) ( ON ?auto_100875 ?auto_100874 ) ( not ( = ?auto_100873 ?auto_100874 ) ) ( not ( = ?auto_100873 ?auto_100875 ) ) ( not ( = ?auto_100873 ?auto_100876 ) ) ( not ( = ?auto_100873 ?auto_100877 ) ) ( not ( = ?auto_100873 ?auto_100878 ) ) ( not ( = ?auto_100873 ?auto_100879 ) ) ( not ( = ?auto_100873 ?auto_100880 ) ) ( not ( = ?auto_100873 ?auto_100881 ) ) ( not ( = ?auto_100874 ?auto_100875 ) ) ( not ( = ?auto_100874 ?auto_100876 ) ) ( not ( = ?auto_100874 ?auto_100877 ) ) ( not ( = ?auto_100874 ?auto_100878 ) ) ( not ( = ?auto_100874 ?auto_100879 ) ) ( not ( = ?auto_100874 ?auto_100880 ) ) ( not ( = ?auto_100874 ?auto_100881 ) ) ( not ( = ?auto_100875 ?auto_100876 ) ) ( not ( = ?auto_100875 ?auto_100877 ) ) ( not ( = ?auto_100875 ?auto_100878 ) ) ( not ( = ?auto_100875 ?auto_100879 ) ) ( not ( = ?auto_100875 ?auto_100880 ) ) ( not ( = ?auto_100875 ?auto_100881 ) ) ( not ( = ?auto_100876 ?auto_100877 ) ) ( not ( = ?auto_100876 ?auto_100878 ) ) ( not ( = ?auto_100876 ?auto_100879 ) ) ( not ( = ?auto_100876 ?auto_100880 ) ) ( not ( = ?auto_100876 ?auto_100881 ) ) ( not ( = ?auto_100877 ?auto_100878 ) ) ( not ( = ?auto_100877 ?auto_100879 ) ) ( not ( = ?auto_100877 ?auto_100880 ) ) ( not ( = ?auto_100877 ?auto_100881 ) ) ( not ( = ?auto_100878 ?auto_100879 ) ) ( not ( = ?auto_100878 ?auto_100880 ) ) ( not ( = ?auto_100878 ?auto_100881 ) ) ( not ( = ?auto_100879 ?auto_100880 ) ) ( not ( = ?auto_100879 ?auto_100881 ) ) ( not ( = ?auto_100880 ?auto_100881 ) ) ( ON ?auto_100879 ?auto_100880 ) ( ON ?auto_100878 ?auto_100879 ) ( ON ?auto_100877 ?auto_100878 ) ( CLEAR ?auto_100875 ) ( ON ?auto_100876 ?auto_100877 ) ( CLEAR ?auto_100876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_100873 ?auto_100874 ?auto_100875 ?auto_100876 )
      ( MAKE-8PILE ?auto_100873 ?auto_100874 ?auto_100875 ?auto_100876 ?auto_100877 ?auto_100878 ?auto_100879 ?auto_100880 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100890 - BLOCK
      ?auto_100891 - BLOCK
      ?auto_100892 - BLOCK
      ?auto_100893 - BLOCK
      ?auto_100894 - BLOCK
      ?auto_100895 - BLOCK
      ?auto_100896 - BLOCK
      ?auto_100897 - BLOCK
    )
    :vars
    (
      ?auto_100898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100897 ?auto_100898 ) ( ON-TABLE ?auto_100890 ) ( ON ?auto_100891 ?auto_100890 ) ( not ( = ?auto_100890 ?auto_100891 ) ) ( not ( = ?auto_100890 ?auto_100892 ) ) ( not ( = ?auto_100890 ?auto_100893 ) ) ( not ( = ?auto_100890 ?auto_100894 ) ) ( not ( = ?auto_100890 ?auto_100895 ) ) ( not ( = ?auto_100890 ?auto_100896 ) ) ( not ( = ?auto_100890 ?auto_100897 ) ) ( not ( = ?auto_100890 ?auto_100898 ) ) ( not ( = ?auto_100891 ?auto_100892 ) ) ( not ( = ?auto_100891 ?auto_100893 ) ) ( not ( = ?auto_100891 ?auto_100894 ) ) ( not ( = ?auto_100891 ?auto_100895 ) ) ( not ( = ?auto_100891 ?auto_100896 ) ) ( not ( = ?auto_100891 ?auto_100897 ) ) ( not ( = ?auto_100891 ?auto_100898 ) ) ( not ( = ?auto_100892 ?auto_100893 ) ) ( not ( = ?auto_100892 ?auto_100894 ) ) ( not ( = ?auto_100892 ?auto_100895 ) ) ( not ( = ?auto_100892 ?auto_100896 ) ) ( not ( = ?auto_100892 ?auto_100897 ) ) ( not ( = ?auto_100892 ?auto_100898 ) ) ( not ( = ?auto_100893 ?auto_100894 ) ) ( not ( = ?auto_100893 ?auto_100895 ) ) ( not ( = ?auto_100893 ?auto_100896 ) ) ( not ( = ?auto_100893 ?auto_100897 ) ) ( not ( = ?auto_100893 ?auto_100898 ) ) ( not ( = ?auto_100894 ?auto_100895 ) ) ( not ( = ?auto_100894 ?auto_100896 ) ) ( not ( = ?auto_100894 ?auto_100897 ) ) ( not ( = ?auto_100894 ?auto_100898 ) ) ( not ( = ?auto_100895 ?auto_100896 ) ) ( not ( = ?auto_100895 ?auto_100897 ) ) ( not ( = ?auto_100895 ?auto_100898 ) ) ( not ( = ?auto_100896 ?auto_100897 ) ) ( not ( = ?auto_100896 ?auto_100898 ) ) ( not ( = ?auto_100897 ?auto_100898 ) ) ( ON ?auto_100896 ?auto_100897 ) ( ON ?auto_100895 ?auto_100896 ) ( ON ?auto_100894 ?auto_100895 ) ( ON ?auto_100893 ?auto_100894 ) ( CLEAR ?auto_100891 ) ( ON ?auto_100892 ?auto_100893 ) ( CLEAR ?auto_100892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100890 ?auto_100891 ?auto_100892 )
      ( MAKE-8PILE ?auto_100890 ?auto_100891 ?auto_100892 ?auto_100893 ?auto_100894 ?auto_100895 ?auto_100896 ?auto_100897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100907 - BLOCK
      ?auto_100908 - BLOCK
      ?auto_100909 - BLOCK
      ?auto_100910 - BLOCK
      ?auto_100911 - BLOCK
      ?auto_100912 - BLOCK
      ?auto_100913 - BLOCK
      ?auto_100914 - BLOCK
    )
    :vars
    (
      ?auto_100915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100914 ?auto_100915 ) ( ON-TABLE ?auto_100907 ) ( ON ?auto_100908 ?auto_100907 ) ( not ( = ?auto_100907 ?auto_100908 ) ) ( not ( = ?auto_100907 ?auto_100909 ) ) ( not ( = ?auto_100907 ?auto_100910 ) ) ( not ( = ?auto_100907 ?auto_100911 ) ) ( not ( = ?auto_100907 ?auto_100912 ) ) ( not ( = ?auto_100907 ?auto_100913 ) ) ( not ( = ?auto_100907 ?auto_100914 ) ) ( not ( = ?auto_100907 ?auto_100915 ) ) ( not ( = ?auto_100908 ?auto_100909 ) ) ( not ( = ?auto_100908 ?auto_100910 ) ) ( not ( = ?auto_100908 ?auto_100911 ) ) ( not ( = ?auto_100908 ?auto_100912 ) ) ( not ( = ?auto_100908 ?auto_100913 ) ) ( not ( = ?auto_100908 ?auto_100914 ) ) ( not ( = ?auto_100908 ?auto_100915 ) ) ( not ( = ?auto_100909 ?auto_100910 ) ) ( not ( = ?auto_100909 ?auto_100911 ) ) ( not ( = ?auto_100909 ?auto_100912 ) ) ( not ( = ?auto_100909 ?auto_100913 ) ) ( not ( = ?auto_100909 ?auto_100914 ) ) ( not ( = ?auto_100909 ?auto_100915 ) ) ( not ( = ?auto_100910 ?auto_100911 ) ) ( not ( = ?auto_100910 ?auto_100912 ) ) ( not ( = ?auto_100910 ?auto_100913 ) ) ( not ( = ?auto_100910 ?auto_100914 ) ) ( not ( = ?auto_100910 ?auto_100915 ) ) ( not ( = ?auto_100911 ?auto_100912 ) ) ( not ( = ?auto_100911 ?auto_100913 ) ) ( not ( = ?auto_100911 ?auto_100914 ) ) ( not ( = ?auto_100911 ?auto_100915 ) ) ( not ( = ?auto_100912 ?auto_100913 ) ) ( not ( = ?auto_100912 ?auto_100914 ) ) ( not ( = ?auto_100912 ?auto_100915 ) ) ( not ( = ?auto_100913 ?auto_100914 ) ) ( not ( = ?auto_100913 ?auto_100915 ) ) ( not ( = ?auto_100914 ?auto_100915 ) ) ( ON ?auto_100913 ?auto_100914 ) ( ON ?auto_100912 ?auto_100913 ) ( ON ?auto_100911 ?auto_100912 ) ( ON ?auto_100910 ?auto_100911 ) ( CLEAR ?auto_100908 ) ( ON ?auto_100909 ?auto_100910 ) ( CLEAR ?auto_100909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_100907 ?auto_100908 ?auto_100909 )
      ( MAKE-8PILE ?auto_100907 ?auto_100908 ?auto_100909 ?auto_100910 ?auto_100911 ?auto_100912 ?auto_100913 ?auto_100914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100924 - BLOCK
      ?auto_100925 - BLOCK
      ?auto_100926 - BLOCK
      ?auto_100927 - BLOCK
      ?auto_100928 - BLOCK
      ?auto_100929 - BLOCK
      ?auto_100930 - BLOCK
      ?auto_100931 - BLOCK
    )
    :vars
    (
      ?auto_100932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100931 ?auto_100932 ) ( ON-TABLE ?auto_100924 ) ( not ( = ?auto_100924 ?auto_100925 ) ) ( not ( = ?auto_100924 ?auto_100926 ) ) ( not ( = ?auto_100924 ?auto_100927 ) ) ( not ( = ?auto_100924 ?auto_100928 ) ) ( not ( = ?auto_100924 ?auto_100929 ) ) ( not ( = ?auto_100924 ?auto_100930 ) ) ( not ( = ?auto_100924 ?auto_100931 ) ) ( not ( = ?auto_100924 ?auto_100932 ) ) ( not ( = ?auto_100925 ?auto_100926 ) ) ( not ( = ?auto_100925 ?auto_100927 ) ) ( not ( = ?auto_100925 ?auto_100928 ) ) ( not ( = ?auto_100925 ?auto_100929 ) ) ( not ( = ?auto_100925 ?auto_100930 ) ) ( not ( = ?auto_100925 ?auto_100931 ) ) ( not ( = ?auto_100925 ?auto_100932 ) ) ( not ( = ?auto_100926 ?auto_100927 ) ) ( not ( = ?auto_100926 ?auto_100928 ) ) ( not ( = ?auto_100926 ?auto_100929 ) ) ( not ( = ?auto_100926 ?auto_100930 ) ) ( not ( = ?auto_100926 ?auto_100931 ) ) ( not ( = ?auto_100926 ?auto_100932 ) ) ( not ( = ?auto_100927 ?auto_100928 ) ) ( not ( = ?auto_100927 ?auto_100929 ) ) ( not ( = ?auto_100927 ?auto_100930 ) ) ( not ( = ?auto_100927 ?auto_100931 ) ) ( not ( = ?auto_100927 ?auto_100932 ) ) ( not ( = ?auto_100928 ?auto_100929 ) ) ( not ( = ?auto_100928 ?auto_100930 ) ) ( not ( = ?auto_100928 ?auto_100931 ) ) ( not ( = ?auto_100928 ?auto_100932 ) ) ( not ( = ?auto_100929 ?auto_100930 ) ) ( not ( = ?auto_100929 ?auto_100931 ) ) ( not ( = ?auto_100929 ?auto_100932 ) ) ( not ( = ?auto_100930 ?auto_100931 ) ) ( not ( = ?auto_100930 ?auto_100932 ) ) ( not ( = ?auto_100931 ?auto_100932 ) ) ( ON ?auto_100930 ?auto_100931 ) ( ON ?auto_100929 ?auto_100930 ) ( ON ?auto_100928 ?auto_100929 ) ( ON ?auto_100927 ?auto_100928 ) ( ON ?auto_100926 ?auto_100927 ) ( CLEAR ?auto_100924 ) ( ON ?auto_100925 ?auto_100926 ) ( CLEAR ?auto_100925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100924 ?auto_100925 )
      ( MAKE-8PILE ?auto_100924 ?auto_100925 ?auto_100926 ?auto_100927 ?auto_100928 ?auto_100929 ?auto_100930 ?auto_100931 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100941 - BLOCK
      ?auto_100942 - BLOCK
      ?auto_100943 - BLOCK
      ?auto_100944 - BLOCK
      ?auto_100945 - BLOCK
      ?auto_100946 - BLOCK
      ?auto_100947 - BLOCK
      ?auto_100948 - BLOCK
    )
    :vars
    (
      ?auto_100949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100948 ?auto_100949 ) ( ON-TABLE ?auto_100941 ) ( not ( = ?auto_100941 ?auto_100942 ) ) ( not ( = ?auto_100941 ?auto_100943 ) ) ( not ( = ?auto_100941 ?auto_100944 ) ) ( not ( = ?auto_100941 ?auto_100945 ) ) ( not ( = ?auto_100941 ?auto_100946 ) ) ( not ( = ?auto_100941 ?auto_100947 ) ) ( not ( = ?auto_100941 ?auto_100948 ) ) ( not ( = ?auto_100941 ?auto_100949 ) ) ( not ( = ?auto_100942 ?auto_100943 ) ) ( not ( = ?auto_100942 ?auto_100944 ) ) ( not ( = ?auto_100942 ?auto_100945 ) ) ( not ( = ?auto_100942 ?auto_100946 ) ) ( not ( = ?auto_100942 ?auto_100947 ) ) ( not ( = ?auto_100942 ?auto_100948 ) ) ( not ( = ?auto_100942 ?auto_100949 ) ) ( not ( = ?auto_100943 ?auto_100944 ) ) ( not ( = ?auto_100943 ?auto_100945 ) ) ( not ( = ?auto_100943 ?auto_100946 ) ) ( not ( = ?auto_100943 ?auto_100947 ) ) ( not ( = ?auto_100943 ?auto_100948 ) ) ( not ( = ?auto_100943 ?auto_100949 ) ) ( not ( = ?auto_100944 ?auto_100945 ) ) ( not ( = ?auto_100944 ?auto_100946 ) ) ( not ( = ?auto_100944 ?auto_100947 ) ) ( not ( = ?auto_100944 ?auto_100948 ) ) ( not ( = ?auto_100944 ?auto_100949 ) ) ( not ( = ?auto_100945 ?auto_100946 ) ) ( not ( = ?auto_100945 ?auto_100947 ) ) ( not ( = ?auto_100945 ?auto_100948 ) ) ( not ( = ?auto_100945 ?auto_100949 ) ) ( not ( = ?auto_100946 ?auto_100947 ) ) ( not ( = ?auto_100946 ?auto_100948 ) ) ( not ( = ?auto_100946 ?auto_100949 ) ) ( not ( = ?auto_100947 ?auto_100948 ) ) ( not ( = ?auto_100947 ?auto_100949 ) ) ( not ( = ?auto_100948 ?auto_100949 ) ) ( ON ?auto_100947 ?auto_100948 ) ( ON ?auto_100946 ?auto_100947 ) ( ON ?auto_100945 ?auto_100946 ) ( ON ?auto_100944 ?auto_100945 ) ( ON ?auto_100943 ?auto_100944 ) ( CLEAR ?auto_100941 ) ( ON ?auto_100942 ?auto_100943 ) ( CLEAR ?auto_100942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100941 ?auto_100942 )
      ( MAKE-8PILE ?auto_100941 ?auto_100942 ?auto_100943 ?auto_100944 ?auto_100945 ?auto_100946 ?auto_100947 ?auto_100948 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100958 - BLOCK
      ?auto_100959 - BLOCK
      ?auto_100960 - BLOCK
      ?auto_100961 - BLOCK
      ?auto_100962 - BLOCK
      ?auto_100963 - BLOCK
      ?auto_100964 - BLOCK
      ?auto_100965 - BLOCK
    )
    :vars
    (
      ?auto_100966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100965 ?auto_100966 ) ( not ( = ?auto_100958 ?auto_100959 ) ) ( not ( = ?auto_100958 ?auto_100960 ) ) ( not ( = ?auto_100958 ?auto_100961 ) ) ( not ( = ?auto_100958 ?auto_100962 ) ) ( not ( = ?auto_100958 ?auto_100963 ) ) ( not ( = ?auto_100958 ?auto_100964 ) ) ( not ( = ?auto_100958 ?auto_100965 ) ) ( not ( = ?auto_100958 ?auto_100966 ) ) ( not ( = ?auto_100959 ?auto_100960 ) ) ( not ( = ?auto_100959 ?auto_100961 ) ) ( not ( = ?auto_100959 ?auto_100962 ) ) ( not ( = ?auto_100959 ?auto_100963 ) ) ( not ( = ?auto_100959 ?auto_100964 ) ) ( not ( = ?auto_100959 ?auto_100965 ) ) ( not ( = ?auto_100959 ?auto_100966 ) ) ( not ( = ?auto_100960 ?auto_100961 ) ) ( not ( = ?auto_100960 ?auto_100962 ) ) ( not ( = ?auto_100960 ?auto_100963 ) ) ( not ( = ?auto_100960 ?auto_100964 ) ) ( not ( = ?auto_100960 ?auto_100965 ) ) ( not ( = ?auto_100960 ?auto_100966 ) ) ( not ( = ?auto_100961 ?auto_100962 ) ) ( not ( = ?auto_100961 ?auto_100963 ) ) ( not ( = ?auto_100961 ?auto_100964 ) ) ( not ( = ?auto_100961 ?auto_100965 ) ) ( not ( = ?auto_100961 ?auto_100966 ) ) ( not ( = ?auto_100962 ?auto_100963 ) ) ( not ( = ?auto_100962 ?auto_100964 ) ) ( not ( = ?auto_100962 ?auto_100965 ) ) ( not ( = ?auto_100962 ?auto_100966 ) ) ( not ( = ?auto_100963 ?auto_100964 ) ) ( not ( = ?auto_100963 ?auto_100965 ) ) ( not ( = ?auto_100963 ?auto_100966 ) ) ( not ( = ?auto_100964 ?auto_100965 ) ) ( not ( = ?auto_100964 ?auto_100966 ) ) ( not ( = ?auto_100965 ?auto_100966 ) ) ( ON ?auto_100964 ?auto_100965 ) ( ON ?auto_100963 ?auto_100964 ) ( ON ?auto_100962 ?auto_100963 ) ( ON ?auto_100961 ?auto_100962 ) ( ON ?auto_100960 ?auto_100961 ) ( ON ?auto_100959 ?auto_100960 ) ( ON ?auto_100958 ?auto_100959 ) ( CLEAR ?auto_100958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100958 )
      ( MAKE-8PILE ?auto_100958 ?auto_100959 ?auto_100960 ?auto_100961 ?auto_100962 ?auto_100963 ?auto_100964 ?auto_100965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_100975 - BLOCK
      ?auto_100976 - BLOCK
      ?auto_100977 - BLOCK
      ?auto_100978 - BLOCK
      ?auto_100979 - BLOCK
      ?auto_100980 - BLOCK
      ?auto_100981 - BLOCK
      ?auto_100982 - BLOCK
    )
    :vars
    (
      ?auto_100983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100982 ?auto_100983 ) ( not ( = ?auto_100975 ?auto_100976 ) ) ( not ( = ?auto_100975 ?auto_100977 ) ) ( not ( = ?auto_100975 ?auto_100978 ) ) ( not ( = ?auto_100975 ?auto_100979 ) ) ( not ( = ?auto_100975 ?auto_100980 ) ) ( not ( = ?auto_100975 ?auto_100981 ) ) ( not ( = ?auto_100975 ?auto_100982 ) ) ( not ( = ?auto_100975 ?auto_100983 ) ) ( not ( = ?auto_100976 ?auto_100977 ) ) ( not ( = ?auto_100976 ?auto_100978 ) ) ( not ( = ?auto_100976 ?auto_100979 ) ) ( not ( = ?auto_100976 ?auto_100980 ) ) ( not ( = ?auto_100976 ?auto_100981 ) ) ( not ( = ?auto_100976 ?auto_100982 ) ) ( not ( = ?auto_100976 ?auto_100983 ) ) ( not ( = ?auto_100977 ?auto_100978 ) ) ( not ( = ?auto_100977 ?auto_100979 ) ) ( not ( = ?auto_100977 ?auto_100980 ) ) ( not ( = ?auto_100977 ?auto_100981 ) ) ( not ( = ?auto_100977 ?auto_100982 ) ) ( not ( = ?auto_100977 ?auto_100983 ) ) ( not ( = ?auto_100978 ?auto_100979 ) ) ( not ( = ?auto_100978 ?auto_100980 ) ) ( not ( = ?auto_100978 ?auto_100981 ) ) ( not ( = ?auto_100978 ?auto_100982 ) ) ( not ( = ?auto_100978 ?auto_100983 ) ) ( not ( = ?auto_100979 ?auto_100980 ) ) ( not ( = ?auto_100979 ?auto_100981 ) ) ( not ( = ?auto_100979 ?auto_100982 ) ) ( not ( = ?auto_100979 ?auto_100983 ) ) ( not ( = ?auto_100980 ?auto_100981 ) ) ( not ( = ?auto_100980 ?auto_100982 ) ) ( not ( = ?auto_100980 ?auto_100983 ) ) ( not ( = ?auto_100981 ?auto_100982 ) ) ( not ( = ?auto_100981 ?auto_100983 ) ) ( not ( = ?auto_100982 ?auto_100983 ) ) ( ON ?auto_100981 ?auto_100982 ) ( ON ?auto_100980 ?auto_100981 ) ( ON ?auto_100979 ?auto_100980 ) ( ON ?auto_100978 ?auto_100979 ) ( ON ?auto_100977 ?auto_100978 ) ( ON ?auto_100976 ?auto_100977 ) ( ON ?auto_100975 ?auto_100976 ) ( CLEAR ?auto_100975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100975 )
      ( MAKE-8PILE ?auto_100975 ?auto_100976 ?auto_100977 ?auto_100978 ?auto_100979 ?auto_100980 ?auto_100981 ?auto_100982 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_100993 - BLOCK
      ?auto_100994 - BLOCK
      ?auto_100995 - BLOCK
      ?auto_100996 - BLOCK
      ?auto_100997 - BLOCK
      ?auto_100998 - BLOCK
      ?auto_100999 - BLOCK
      ?auto_101000 - BLOCK
      ?auto_101001 - BLOCK
    )
    :vars
    (
      ?auto_101002 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101000 ) ( ON ?auto_101001 ?auto_101002 ) ( CLEAR ?auto_101001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100993 ) ( ON ?auto_100994 ?auto_100993 ) ( ON ?auto_100995 ?auto_100994 ) ( ON ?auto_100996 ?auto_100995 ) ( ON ?auto_100997 ?auto_100996 ) ( ON ?auto_100998 ?auto_100997 ) ( ON ?auto_100999 ?auto_100998 ) ( ON ?auto_101000 ?auto_100999 ) ( not ( = ?auto_100993 ?auto_100994 ) ) ( not ( = ?auto_100993 ?auto_100995 ) ) ( not ( = ?auto_100993 ?auto_100996 ) ) ( not ( = ?auto_100993 ?auto_100997 ) ) ( not ( = ?auto_100993 ?auto_100998 ) ) ( not ( = ?auto_100993 ?auto_100999 ) ) ( not ( = ?auto_100993 ?auto_101000 ) ) ( not ( = ?auto_100993 ?auto_101001 ) ) ( not ( = ?auto_100993 ?auto_101002 ) ) ( not ( = ?auto_100994 ?auto_100995 ) ) ( not ( = ?auto_100994 ?auto_100996 ) ) ( not ( = ?auto_100994 ?auto_100997 ) ) ( not ( = ?auto_100994 ?auto_100998 ) ) ( not ( = ?auto_100994 ?auto_100999 ) ) ( not ( = ?auto_100994 ?auto_101000 ) ) ( not ( = ?auto_100994 ?auto_101001 ) ) ( not ( = ?auto_100994 ?auto_101002 ) ) ( not ( = ?auto_100995 ?auto_100996 ) ) ( not ( = ?auto_100995 ?auto_100997 ) ) ( not ( = ?auto_100995 ?auto_100998 ) ) ( not ( = ?auto_100995 ?auto_100999 ) ) ( not ( = ?auto_100995 ?auto_101000 ) ) ( not ( = ?auto_100995 ?auto_101001 ) ) ( not ( = ?auto_100995 ?auto_101002 ) ) ( not ( = ?auto_100996 ?auto_100997 ) ) ( not ( = ?auto_100996 ?auto_100998 ) ) ( not ( = ?auto_100996 ?auto_100999 ) ) ( not ( = ?auto_100996 ?auto_101000 ) ) ( not ( = ?auto_100996 ?auto_101001 ) ) ( not ( = ?auto_100996 ?auto_101002 ) ) ( not ( = ?auto_100997 ?auto_100998 ) ) ( not ( = ?auto_100997 ?auto_100999 ) ) ( not ( = ?auto_100997 ?auto_101000 ) ) ( not ( = ?auto_100997 ?auto_101001 ) ) ( not ( = ?auto_100997 ?auto_101002 ) ) ( not ( = ?auto_100998 ?auto_100999 ) ) ( not ( = ?auto_100998 ?auto_101000 ) ) ( not ( = ?auto_100998 ?auto_101001 ) ) ( not ( = ?auto_100998 ?auto_101002 ) ) ( not ( = ?auto_100999 ?auto_101000 ) ) ( not ( = ?auto_100999 ?auto_101001 ) ) ( not ( = ?auto_100999 ?auto_101002 ) ) ( not ( = ?auto_101000 ?auto_101001 ) ) ( not ( = ?auto_101000 ?auto_101002 ) ) ( not ( = ?auto_101001 ?auto_101002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101001 ?auto_101002 )
      ( !STACK ?auto_101001 ?auto_101000 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101012 - BLOCK
      ?auto_101013 - BLOCK
      ?auto_101014 - BLOCK
      ?auto_101015 - BLOCK
      ?auto_101016 - BLOCK
      ?auto_101017 - BLOCK
      ?auto_101018 - BLOCK
      ?auto_101019 - BLOCK
      ?auto_101020 - BLOCK
    )
    :vars
    (
      ?auto_101021 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101019 ) ( ON ?auto_101020 ?auto_101021 ) ( CLEAR ?auto_101020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101012 ) ( ON ?auto_101013 ?auto_101012 ) ( ON ?auto_101014 ?auto_101013 ) ( ON ?auto_101015 ?auto_101014 ) ( ON ?auto_101016 ?auto_101015 ) ( ON ?auto_101017 ?auto_101016 ) ( ON ?auto_101018 ?auto_101017 ) ( ON ?auto_101019 ?auto_101018 ) ( not ( = ?auto_101012 ?auto_101013 ) ) ( not ( = ?auto_101012 ?auto_101014 ) ) ( not ( = ?auto_101012 ?auto_101015 ) ) ( not ( = ?auto_101012 ?auto_101016 ) ) ( not ( = ?auto_101012 ?auto_101017 ) ) ( not ( = ?auto_101012 ?auto_101018 ) ) ( not ( = ?auto_101012 ?auto_101019 ) ) ( not ( = ?auto_101012 ?auto_101020 ) ) ( not ( = ?auto_101012 ?auto_101021 ) ) ( not ( = ?auto_101013 ?auto_101014 ) ) ( not ( = ?auto_101013 ?auto_101015 ) ) ( not ( = ?auto_101013 ?auto_101016 ) ) ( not ( = ?auto_101013 ?auto_101017 ) ) ( not ( = ?auto_101013 ?auto_101018 ) ) ( not ( = ?auto_101013 ?auto_101019 ) ) ( not ( = ?auto_101013 ?auto_101020 ) ) ( not ( = ?auto_101013 ?auto_101021 ) ) ( not ( = ?auto_101014 ?auto_101015 ) ) ( not ( = ?auto_101014 ?auto_101016 ) ) ( not ( = ?auto_101014 ?auto_101017 ) ) ( not ( = ?auto_101014 ?auto_101018 ) ) ( not ( = ?auto_101014 ?auto_101019 ) ) ( not ( = ?auto_101014 ?auto_101020 ) ) ( not ( = ?auto_101014 ?auto_101021 ) ) ( not ( = ?auto_101015 ?auto_101016 ) ) ( not ( = ?auto_101015 ?auto_101017 ) ) ( not ( = ?auto_101015 ?auto_101018 ) ) ( not ( = ?auto_101015 ?auto_101019 ) ) ( not ( = ?auto_101015 ?auto_101020 ) ) ( not ( = ?auto_101015 ?auto_101021 ) ) ( not ( = ?auto_101016 ?auto_101017 ) ) ( not ( = ?auto_101016 ?auto_101018 ) ) ( not ( = ?auto_101016 ?auto_101019 ) ) ( not ( = ?auto_101016 ?auto_101020 ) ) ( not ( = ?auto_101016 ?auto_101021 ) ) ( not ( = ?auto_101017 ?auto_101018 ) ) ( not ( = ?auto_101017 ?auto_101019 ) ) ( not ( = ?auto_101017 ?auto_101020 ) ) ( not ( = ?auto_101017 ?auto_101021 ) ) ( not ( = ?auto_101018 ?auto_101019 ) ) ( not ( = ?auto_101018 ?auto_101020 ) ) ( not ( = ?auto_101018 ?auto_101021 ) ) ( not ( = ?auto_101019 ?auto_101020 ) ) ( not ( = ?auto_101019 ?auto_101021 ) ) ( not ( = ?auto_101020 ?auto_101021 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101020 ?auto_101021 )
      ( !STACK ?auto_101020 ?auto_101019 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101031 - BLOCK
      ?auto_101032 - BLOCK
      ?auto_101033 - BLOCK
      ?auto_101034 - BLOCK
      ?auto_101035 - BLOCK
      ?auto_101036 - BLOCK
      ?auto_101037 - BLOCK
      ?auto_101038 - BLOCK
      ?auto_101039 - BLOCK
    )
    :vars
    (
      ?auto_101040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101039 ?auto_101040 ) ( ON-TABLE ?auto_101031 ) ( ON ?auto_101032 ?auto_101031 ) ( ON ?auto_101033 ?auto_101032 ) ( ON ?auto_101034 ?auto_101033 ) ( ON ?auto_101035 ?auto_101034 ) ( ON ?auto_101036 ?auto_101035 ) ( ON ?auto_101037 ?auto_101036 ) ( not ( = ?auto_101031 ?auto_101032 ) ) ( not ( = ?auto_101031 ?auto_101033 ) ) ( not ( = ?auto_101031 ?auto_101034 ) ) ( not ( = ?auto_101031 ?auto_101035 ) ) ( not ( = ?auto_101031 ?auto_101036 ) ) ( not ( = ?auto_101031 ?auto_101037 ) ) ( not ( = ?auto_101031 ?auto_101038 ) ) ( not ( = ?auto_101031 ?auto_101039 ) ) ( not ( = ?auto_101031 ?auto_101040 ) ) ( not ( = ?auto_101032 ?auto_101033 ) ) ( not ( = ?auto_101032 ?auto_101034 ) ) ( not ( = ?auto_101032 ?auto_101035 ) ) ( not ( = ?auto_101032 ?auto_101036 ) ) ( not ( = ?auto_101032 ?auto_101037 ) ) ( not ( = ?auto_101032 ?auto_101038 ) ) ( not ( = ?auto_101032 ?auto_101039 ) ) ( not ( = ?auto_101032 ?auto_101040 ) ) ( not ( = ?auto_101033 ?auto_101034 ) ) ( not ( = ?auto_101033 ?auto_101035 ) ) ( not ( = ?auto_101033 ?auto_101036 ) ) ( not ( = ?auto_101033 ?auto_101037 ) ) ( not ( = ?auto_101033 ?auto_101038 ) ) ( not ( = ?auto_101033 ?auto_101039 ) ) ( not ( = ?auto_101033 ?auto_101040 ) ) ( not ( = ?auto_101034 ?auto_101035 ) ) ( not ( = ?auto_101034 ?auto_101036 ) ) ( not ( = ?auto_101034 ?auto_101037 ) ) ( not ( = ?auto_101034 ?auto_101038 ) ) ( not ( = ?auto_101034 ?auto_101039 ) ) ( not ( = ?auto_101034 ?auto_101040 ) ) ( not ( = ?auto_101035 ?auto_101036 ) ) ( not ( = ?auto_101035 ?auto_101037 ) ) ( not ( = ?auto_101035 ?auto_101038 ) ) ( not ( = ?auto_101035 ?auto_101039 ) ) ( not ( = ?auto_101035 ?auto_101040 ) ) ( not ( = ?auto_101036 ?auto_101037 ) ) ( not ( = ?auto_101036 ?auto_101038 ) ) ( not ( = ?auto_101036 ?auto_101039 ) ) ( not ( = ?auto_101036 ?auto_101040 ) ) ( not ( = ?auto_101037 ?auto_101038 ) ) ( not ( = ?auto_101037 ?auto_101039 ) ) ( not ( = ?auto_101037 ?auto_101040 ) ) ( not ( = ?auto_101038 ?auto_101039 ) ) ( not ( = ?auto_101038 ?auto_101040 ) ) ( not ( = ?auto_101039 ?auto_101040 ) ) ( CLEAR ?auto_101037 ) ( ON ?auto_101038 ?auto_101039 ) ( CLEAR ?auto_101038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_101031 ?auto_101032 ?auto_101033 ?auto_101034 ?auto_101035 ?auto_101036 ?auto_101037 ?auto_101038 )
      ( MAKE-9PILE ?auto_101031 ?auto_101032 ?auto_101033 ?auto_101034 ?auto_101035 ?auto_101036 ?auto_101037 ?auto_101038 ?auto_101039 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101050 - BLOCK
      ?auto_101051 - BLOCK
      ?auto_101052 - BLOCK
      ?auto_101053 - BLOCK
      ?auto_101054 - BLOCK
      ?auto_101055 - BLOCK
      ?auto_101056 - BLOCK
      ?auto_101057 - BLOCK
      ?auto_101058 - BLOCK
    )
    :vars
    (
      ?auto_101059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101058 ?auto_101059 ) ( ON-TABLE ?auto_101050 ) ( ON ?auto_101051 ?auto_101050 ) ( ON ?auto_101052 ?auto_101051 ) ( ON ?auto_101053 ?auto_101052 ) ( ON ?auto_101054 ?auto_101053 ) ( ON ?auto_101055 ?auto_101054 ) ( ON ?auto_101056 ?auto_101055 ) ( not ( = ?auto_101050 ?auto_101051 ) ) ( not ( = ?auto_101050 ?auto_101052 ) ) ( not ( = ?auto_101050 ?auto_101053 ) ) ( not ( = ?auto_101050 ?auto_101054 ) ) ( not ( = ?auto_101050 ?auto_101055 ) ) ( not ( = ?auto_101050 ?auto_101056 ) ) ( not ( = ?auto_101050 ?auto_101057 ) ) ( not ( = ?auto_101050 ?auto_101058 ) ) ( not ( = ?auto_101050 ?auto_101059 ) ) ( not ( = ?auto_101051 ?auto_101052 ) ) ( not ( = ?auto_101051 ?auto_101053 ) ) ( not ( = ?auto_101051 ?auto_101054 ) ) ( not ( = ?auto_101051 ?auto_101055 ) ) ( not ( = ?auto_101051 ?auto_101056 ) ) ( not ( = ?auto_101051 ?auto_101057 ) ) ( not ( = ?auto_101051 ?auto_101058 ) ) ( not ( = ?auto_101051 ?auto_101059 ) ) ( not ( = ?auto_101052 ?auto_101053 ) ) ( not ( = ?auto_101052 ?auto_101054 ) ) ( not ( = ?auto_101052 ?auto_101055 ) ) ( not ( = ?auto_101052 ?auto_101056 ) ) ( not ( = ?auto_101052 ?auto_101057 ) ) ( not ( = ?auto_101052 ?auto_101058 ) ) ( not ( = ?auto_101052 ?auto_101059 ) ) ( not ( = ?auto_101053 ?auto_101054 ) ) ( not ( = ?auto_101053 ?auto_101055 ) ) ( not ( = ?auto_101053 ?auto_101056 ) ) ( not ( = ?auto_101053 ?auto_101057 ) ) ( not ( = ?auto_101053 ?auto_101058 ) ) ( not ( = ?auto_101053 ?auto_101059 ) ) ( not ( = ?auto_101054 ?auto_101055 ) ) ( not ( = ?auto_101054 ?auto_101056 ) ) ( not ( = ?auto_101054 ?auto_101057 ) ) ( not ( = ?auto_101054 ?auto_101058 ) ) ( not ( = ?auto_101054 ?auto_101059 ) ) ( not ( = ?auto_101055 ?auto_101056 ) ) ( not ( = ?auto_101055 ?auto_101057 ) ) ( not ( = ?auto_101055 ?auto_101058 ) ) ( not ( = ?auto_101055 ?auto_101059 ) ) ( not ( = ?auto_101056 ?auto_101057 ) ) ( not ( = ?auto_101056 ?auto_101058 ) ) ( not ( = ?auto_101056 ?auto_101059 ) ) ( not ( = ?auto_101057 ?auto_101058 ) ) ( not ( = ?auto_101057 ?auto_101059 ) ) ( not ( = ?auto_101058 ?auto_101059 ) ) ( CLEAR ?auto_101056 ) ( ON ?auto_101057 ?auto_101058 ) ( CLEAR ?auto_101057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_101050 ?auto_101051 ?auto_101052 ?auto_101053 ?auto_101054 ?auto_101055 ?auto_101056 ?auto_101057 )
      ( MAKE-9PILE ?auto_101050 ?auto_101051 ?auto_101052 ?auto_101053 ?auto_101054 ?auto_101055 ?auto_101056 ?auto_101057 ?auto_101058 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101069 - BLOCK
      ?auto_101070 - BLOCK
      ?auto_101071 - BLOCK
      ?auto_101072 - BLOCK
      ?auto_101073 - BLOCK
      ?auto_101074 - BLOCK
      ?auto_101075 - BLOCK
      ?auto_101076 - BLOCK
      ?auto_101077 - BLOCK
    )
    :vars
    (
      ?auto_101078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101077 ?auto_101078 ) ( ON-TABLE ?auto_101069 ) ( ON ?auto_101070 ?auto_101069 ) ( ON ?auto_101071 ?auto_101070 ) ( ON ?auto_101072 ?auto_101071 ) ( ON ?auto_101073 ?auto_101072 ) ( ON ?auto_101074 ?auto_101073 ) ( not ( = ?auto_101069 ?auto_101070 ) ) ( not ( = ?auto_101069 ?auto_101071 ) ) ( not ( = ?auto_101069 ?auto_101072 ) ) ( not ( = ?auto_101069 ?auto_101073 ) ) ( not ( = ?auto_101069 ?auto_101074 ) ) ( not ( = ?auto_101069 ?auto_101075 ) ) ( not ( = ?auto_101069 ?auto_101076 ) ) ( not ( = ?auto_101069 ?auto_101077 ) ) ( not ( = ?auto_101069 ?auto_101078 ) ) ( not ( = ?auto_101070 ?auto_101071 ) ) ( not ( = ?auto_101070 ?auto_101072 ) ) ( not ( = ?auto_101070 ?auto_101073 ) ) ( not ( = ?auto_101070 ?auto_101074 ) ) ( not ( = ?auto_101070 ?auto_101075 ) ) ( not ( = ?auto_101070 ?auto_101076 ) ) ( not ( = ?auto_101070 ?auto_101077 ) ) ( not ( = ?auto_101070 ?auto_101078 ) ) ( not ( = ?auto_101071 ?auto_101072 ) ) ( not ( = ?auto_101071 ?auto_101073 ) ) ( not ( = ?auto_101071 ?auto_101074 ) ) ( not ( = ?auto_101071 ?auto_101075 ) ) ( not ( = ?auto_101071 ?auto_101076 ) ) ( not ( = ?auto_101071 ?auto_101077 ) ) ( not ( = ?auto_101071 ?auto_101078 ) ) ( not ( = ?auto_101072 ?auto_101073 ) ) ( not ( = ?auto_101072 ?auto_101074 ) ) ( not ( = ?auto_101072 ?auto_101075 ) ) ( not ( = ?auto_101072 ?auto_101076 ) ) ( not ( = ?auto_101072 ?auto_101077 ) ) ( not ( = ?auto_101072 ?auto_101078 ) ) ( not ( = ?auto_101073 ?auto_101074 ) ) ( not ( = ?auto_101073 ?auto_101075 ) ) ( not ( = ?auto_101073 ?auto_101076 ) ) ( not ( = ?auto_101073 ?auto_101077 ) ) ( not ( = ?auto_101073 ?auto_101078 ) ) ( not ( = ?auto_101074 ?auto_101075 ) ) ( not ( = ?auto_101074 ?auto_101076 ) ) ( not ( = ?auto_101074 ?auto_101077 ) ) ( not ( = ?auto_101074 ?auto_101078 ) ) ( not ( = ?auto_101075 ?auto_101076 ) ) ( not ( = ?auto_101075 ?auto_101077 ) ) ( not ( = ?auto_101075 ?auto_101078 ) ) ( not ( = ?auto_101076 ?auto_101077 ) ) ( not ( = ?auto_101076 ?auto_101078 ) ) ( not ( = ?auto_101077 ?auto_101078 ) ) ( ON ?auto_101076 ?auto_101077 ) ( CLEAR ?auto_101074 ) ( ON ?auto_101075 ?auto_101076 ) ( CLEAR ?auto_101075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101069 ?auto_101070 ?auto_101071 ?auto_101072 ?auto_101073 ?auto_101074 ?auto_101075 )
      ( MAKE-9PILE ?auto_101069 ?auto_101070 ?auto_101071 ?auto_101072 ?auto_101073 ?auto_101074 ?auto_101075 ?auto_101076 ?auto_101077 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101088 - BLOCK
      ?auto_101089 - BLOCK
      ?auto_101090 - BLOCK
      ?auto_101091 - BLOCK
      ?auto_101092 - BLOCK
      ?auto_101093 - BLOCK
      ?auto_101094 - BLOCK
      ?auto_101095 - BLOCK
      ?auto_101096 - BLOCK
    )
    :vars
    (
      ?auto_101097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101096 ?auto_101097 ) ( ON-TABLE ?auto_101088 ) ( ON ?auto_101089 ?auto_101088 ) ( ON ?auto_101090 ?auto_101089 ) ( ON ?auto_101091 ?auto_101090 ) ( ON ?auto_101092 ?auto_101091 ) ( ON ?auto_101093 ?auto_101092 ) ( not ( = ?auto_101088 ?auto_101089 ) ) ( not ( = ?auto_101088 ?auto_101090 ) ) ( not ( = ?auto_101088 ?auto_101091 ) ) ( not ( = ?auto_101088 ?auto_101092 ) ) ( not ( = ?auto_101088 ?auto_101093 ) ) ( not ( = ?auto_101088 ?auto_101094 ) ) ( not ( = ?auto_101088 ?auto_101095 ) ) ( not ( = ?auto_101088 ?auto_101096 ) ) ( not ( = ?auto_101088 ?auto_101097 ) ) ( not ( = ?auto_101089 ?auto_101090 ) ) ( not ( = ?auto_101089 ?auto_101091 ) ) ( not ( = ?auto_101089 ?auto_101092 ) ) ( not ( = ?auto_101089 ?auto_101093 ) ) ( not ( = ?auto_101089 ?auto_101094 ) ) ( not ( = ?auto_101089 ?auto_101095 ) ) ( not ( = ?auto_101089 ?auto_101096 ) ) ( not ( = ?auto_101089 ?auto_101097 ) ) ( not ( = ?auto_101090 ?auto_101091 ) ) ( not ( = ?auto_101090 ?auto_101092 ) ) ( not ( = ?auto_101090 ?auto_101093 ) ) ( not ( = ?auto_101090 ?auto_101094 ) ) ( not ( = ?auto_101090 ?auto_101095 ) ) ( not ( = ?auto_101090 ?auto_101096 ) ) ( not ( = ?auto_101090 ?auto_101097 ) ) ( not ( = ?auto_101091 ?auto_101092 ) ) ( not ( = ?auto_101091 ?auto_101093 ) ) ( not ( = ?auto_101091 ?auto_101094 ) ) ( not ( = ?auto_101091 ?auto_101095 ) ) ( not ( = ?auto_101091 ?auto_101096 ) ) ( not ( = ?auto_101091 ?auto_101097 ) ) ( not ( = ?auto_101092 ?auto_101093 ) ) ( not ( = ?auto_101092 ?auto_101094 ) ) ( not ( = ?auto_101092 ?auto_101095 ) ) ( not ( = ?auto_101092 ?auto_101096 ) ) ( not ( = ?auto_101092 ?auto_101097 ) ) ( not ( = ?auto_101093 ?auto_101094 ) ) ( not ( = ?auto_101093 ?auto_101095 ) ) ( not ( = ?auto_101093 ?auto_101096 ) ) ( not ( = ?auto_101093 ?auto_101097 ) ) ( not ( = ?auto_101094 ?auto_101095 ) ) ( not ( = ?auto_101094 ?auto_101096 ) ) ( not ( = ?auto_101094 ?auto_101097 ) ) ( not ( = ?auto_101095 ?auto_101096 ) ) ( not ( = ?auto_101095 ?auto_101097 ) ) ( not ( = ?auto_101096 ?auto_101097 ) ) ( ON ?auto_101095 ?auto_101096 ) ( CLEAR ?auto_101093 ) ( ON ?auto_101094 ?auto_101095 ) ( CLEAR ?auto_101094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101088 ?auto_101089 ?auto_101090 ?auto_101091 ?auto_101092 ?auto_101093 ?auto_101094 )
      ( MAKE-9PILE ?auto_101088 ?auto_101089 ?auto_101090 ?auto_101091 ?auto_101092 ?auto_101093 ?auto_101094 ?auto_101095 ?auto_101096 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101107 - BLOCK
      ?auto_101108 - BLOCK
      ?auto_101109 - BLOCK
      ?auto_101110 - BLOCK
      ?auto_101111 - BLOCK
      ?auto_101112 - BLOCK
      ?auto_101113 - BLOCK
      ?auto_101114 - BLOCK
      ?auto_101115 - BLOCK
    )
    :vars
    (
      ?auto_101116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101115 ?auto_101116 ) ( ON-TABLE ?auto_101107 ) ( ON ?auto_101108 ?auto_101107 ) ( ON ?auto_101109 ?auto_101108 ) ( ON ?auto_101110 ?auto_101109 ) ( ON ?auto_101111 ?auto_101110 ) ( not ( = ?auto_101107 ?auto_101108 ) ) ( not ( = ?auto_101107 ?auto_101109 ) ) ( not ( = ?auto_101107 ?auto_101110 ) ) ( not ( = ?auto_101107 ?auto_101111 ) ) ( not ( = ?auto_101107 ?auto_101112 ) ) ( not ( = ?auto_101107 ?auto_101113 ) ) ( not ( = ?auto_101107 ?auto_101114 ) ) ( not ( = ?auto_101107 ?auto_101115 ) ) ( not ( = ?auto_101107 ?auto_101116 ) ) ( not ( = ?auto_101108 ?auto_101109 ) ) ( not ( = ?auto_101108 ?auto_101110 ) ) ( not ( = ?auto_101108 ?auto_101111 ) ) ( not ( = ?auto_101108 ?auto_101112 ) ) ( not ( = ?auto_101108 ?auto_101113 ) ) ( not ( = ?auto_101108 ?auto_101114 ) ) ( not ( = ?auto_101108 ?auto_101115 ) ) ( not ( = ?auto_101108 ?auto_101116 ) ) ( not ( = ?auto_101109 ?auto_101110 ) ) ( not ( = ?auto_101109 ?auto_101111 ) ) ( not ( = ?auto_101109 ?auto_101112 ) ) ( not ( = ?auto_101109 ?auto_101113 ) ) ( not ( = ?auto_101109 ?auto_101114 ) ) ( not ( = ?auto_101109 ?auto_101115 ) ) ( not ( = ?auto_101109 ?auto_101116 ) ) ( not ( = ?auto_101110 ?auto_101111 ) ) ( not ( = ?auto_101110 ?auto_101112 ) ) ( not ( = ?auto_101110 ?auto_101113 ) ) ( not ( = ?auto_101110 ?auto_101114 ) ) ( not ( = ?auto_101110 ?auto_101115 ) ) ( not ( = ?auto_101110 ?auto_101116 ) ) ( not ( = ?auto_101111 ?auto_101112 ) ) ( not ( = ?auto_101111 ?auto_101113 ) ) ( not ( = ?auto_101111 ?auto_101114 ) ) ( not ( = ?auto_101111 ?auto_101115 ) ) ( not ( = ?auto_101111 ?auto_101116 ) ) ( not ( = ?auto_101112 ?auto_101113 ) ) ( not ( = ?auto_101112 ?auto_101114 ) ) ( not ( = ?auto_101112 ?auto_101115 ) ) ( not ( = ?auto_101112 ?auto_101116 ) ) ( not ( = ?auto_101113 ?auto_101114 ) ) ( not ( = ?auto_101113 ?auto_101115 ) ) ( not ( = ?auto_101113 ?auto_101116 ) ) ( not ( = ?auto_101114 ?auto_101115 ) ) ( not ( = ?auto_101114 ?auto_101116 ) ) ( not ( = ?auto_101115 ?auto_101116 ) ) ( ON ?auto_101114 ?auto_101115 ) ( ON ?auto_101113 ?auto_101114 ) ( CLEAR ?auto_101111 ) ( ON ?auto_101112 ?auto_101113 ) ( CLEAR ?auto_101112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101107 ?auto_101108 ?auto_101109 ?auto_101110 ?auto_101111 ?auto_101112 )
      ( MAKE-9PILE ?auto_101107 ?auto_101108 ?auto_101109 ?auto_101110 ?auto_101111 ?auto_101112 ?auto_101113 ?auto_101114 ?auto_101115 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101126 - BLOCK
      ?auto_101127 - BLOCK
      ?auto_101128 - BLOCK
      ?auto_101129 - BLOCK
      ?auto_101130 - BLOCK
      ?auto_101131 - BLOCK
      ?auto_101132 - BLOCK
      ?auto_101133 - BLOCK
      ?auto_101134 - BLOCK
    )
    :vars
    (
      ?auto_101135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101134 ?auto_101135 ) ( ON-TABLE ?auto_101126 ) ( ON ?auto_101127 ?auto_101126 ) ( ON ?auto_101128 ?auto_101127 ) ( ON ?auto_101129 ?auto_101128 ) ( ON ?auto_101130 ?auto_101129 ) ( not ( = ?auto_101126 ?auto_101127 ) ) ( not ( = ?auto_101126 ?auto_101128 ) ) ( not ( = ?auto_101126 ?auto_101129 ) ) ( not ( = ?auto_101126 ?auto_101130 ) ) ( not ( = ?auto_101126 ?auto_101131 ) ) ( not ( = ?auto_101126 ?auto_101132 ) ) ( not ( = ?auto_101126 ?auto_101133 ) ) ( not ( = ?auto_101126 ?auto_101134 ) ) ( not ( = ?auto_101126 ?auto_101135 ) ) ( not ( = ?auto_101127 ?auto_101128 ) ) ( not ( = ?auto_101127 ?auto_101129 ) ) ( not ( = ?auto_101127 ?auto_101130 ) ) ( not ( = ?auto_101127 ?auto_101131 ) ) ( not ( = ?auto_101127 ?auto_101132 ) ) ( not ( = ?auto_101127 ?auto_101133 ) ) ( not ( = ?auto_101127 ?auto_101134 ) ) ( not ( = ?auto_101127 ?auto_101135 ) ) ( not ( = ?auto_101128 ?auto_101129 ) ) ( not ( = ?auto_101128 ?auto_101130 ) ) ( not ( = ?auto_101128 ?auto_101131 ) ) ( not ( = ?auto_101128 ?auto_101132 ) ) ( not ( = ?auto_101128 ?auto_101133 ) ) ( not ( = ?auto_101128 ?auto_101134 ) ) ( not ( = ?auto_101128 ?auto_101135 ) ) ( not ( = ?auto_101129 ?auto_101130 ) ) ( not ( = ?auto_101129 ?auto_101131 ) ) ( not ( = ?auto_101129 ?auto_101132 ) ) ( not ( = ?auto_101129 ?auto_101133 ) ) ( not ( = ?auto_101129 ?auto_101134 ) ) ( not ( = ?auto_101129 ?auto_101135 ) ) ( not ( = ?auto_101130 ?auto_101131 ) ) ( not ( = ?auto_101130 ?auto_101132 ) ) ( not ( = ?auto_101130 ?auto_101133 ) ) ( not ( = ?auto_101130 ?auto_101134 ) ) ( not ( = ?auto_101130 ?auto_101135 ) ) ( not ( = ?auto_101131 ?auto_101132 ) ) ( not ( = ?auto_101131 ?auto_101133 ) ) ( not ( = ?auto_101131 ?auto_101134 ) ) ( not ( = ?auto_101131 ?auto_101135 ) ) ( not ( = ?auto_101132 ?auto_101133 ) ) ( not ( = ?auto_101132 ?auto_101134 ) ) ( not ( = ?auto_101132 ?auto_101135 ) ) ( not ( = ?auto_101133 ?auto_101134 ) ) ( not ( = ?auto_101133 ?auto_101135 ) ) ( not ( = ?auto_101134 ?auto_101135 ) ) ( ON ?auto_101133 ?auto_101134 ) ( ON ?auto_101132 ?auto_101133 ) ( CLEAR ?auto_101130 ) ( ON ?auto_101131 ?auto_101132 ) ( CLEAR ?auto_101131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101126 ?auto_101127 ?auto_101128 ?auto_101129 ?auto_101130 ?auto_101131 )
      ( MAKE-9PILE ?auto_101126 ?auto_101127 ?auto_101128 ?auto_101129 ?auto_101130 ?auto_101131 ?auto_101132 ?auto_101133 ?auto_101134 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101145 - BLOCK
      ?auto_101146 - BLOCK
      ?auto_101147 - BLOCK
      ?auto_101148 - BLOCK
      ?auto_101149 - BLOCK
      ?auto_101150 - BLOCK
      ?auto_101151 - BLOCK
      ?auto_101152 - BLOCK
      ?auto_101153 - BLOCK
    )
    :vars
    (
      ?auto_101154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101153 ?auto_101154 ) ( ON-TABLE ?auto_101145 ) ( ON ?auto_101146 ?auto_101145 ) ( ON ?auto_101147 ?auto_101146 ) ( ON ?auto_101148 ?auto_101147 ) ( not ( = ?auto_101145 ?auto_101146 ) ) ( not ( = ?auto_101145 ?auto_101147 ) ) ( not ( = ?auto_101145 ?auto_101148 ) ) ( not ( = ?auto_101145 ?auto_101149 ) ) ( not ( = ?auto_101145 ?auto_101150 ) ) ( not ( = ?auto_101145 ?auto_101151 ) ) ( not ( = ?auto_101145 ?auto_101152 ) ) ( not ( = ?auto_101145 ?auto_101153 ) ) ( not ( = ?auto_101145 ?auto_101154 ) ) ( not ( = ?auto_101146 ?auto_101147 ) ) ( not ( = ?auto_101146 ?auto_101148 ) ) ( not ( = ?auto_101146 ?auto_101149 ) ) ( not ( = ?auto_101146 ?auto_101150 ) ) ( not ( = ?auto_101146 ?auto_101151 ) ) ( not ( = ?auto_101146 ?auto_101152 ) ) ( not ( = ?auto_101146 ?auto_101153 ) ) ( not ( = ?auto_101146 ?auto_101154 ) ) ( not ( = ?auto_101147 ?auto_101148 ) ) ( not ( = ?auto_101147 ?auto_101149 ) ) ( not ( = ?auto_101147 ?auto_101150 ) ) ( not ( = ?auto_101147 ?auto_101151 ) ) ( not ( = ?auto_101147 ?auto_101152 ) ) ( not ( = ?auto_101147 ?auto_101153 ) ) ( not ( = ?auto_101147 ?auto_101154 ) ) ( not ( = ?auto_101148 ?auto_101149 ) ) ( not ( = ?auto_101148 ?auto_101150 ) ) ( not ( = ?auto_101148 ?auto_101151 ) ) ( not ( = ?auto_101148 ?auto_101152 ) ) ( not ( = ?auto_101148 ?auto_101153 ) ) ( not ( = ?auto_101148 ?auto_101154 ) ) ( not ( = ?auto_101149 ?auto_101150 ) ) ( not ( = ?auto_101149 ?auto_101151 ) ) ( not ( = ?auto_101149 ?auto_101152 ) ) ( not ( = ?auto_101149 ?auto_101153 ) ) ( not ( = ?auto_101149 ?auto_101154 ) ) ( not ( = ?auto_101150 ?auto_101151 ) ) ( not ( = ?auto_101150 ?auto_101152 ) ) ( not ( = ?auto_101150 ?auto_101153 ) ) ( not ( = ?auto_101150 ?auto_101154 ) ) ( not ( = ?auto_101151 ?auto_101152 ) ) ( not ( = ?auto_101151 ?auto_101153 ) ) ( not ( = ?auto_101151 ?auto_101154 ) ) ( not ( = ?auto_101152 ?auto_101153 ) ) ( not ( = ?auto_101152 ?auto_101154 ) ) ( not ( = ?auto_101153 ?auto_101154 ) ) ( ON ?auto_101152 ?auto_101153 ) ( ON ?auto_101151 ?auto_101152 ) ( ON ?auto_101150 ?auto_101151 ) ( CLEAR ?auto_101148 ) ( ON ?auto_101149 ?auto_101150 ) ( CLEAR ?auto_101149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101145 ?auto_101146 ?auto_101147 ?auto_101148 ?auto_101149 )
      ( MAKE-9PILE ?auto_101145 ?auto_101146 ?auto_101147 ?auto_101148 ?auto_101149 ?auto_101150 ?auto_101151 ?auto_101152 ?auto_101153 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101164 - BLOCK
      ?auto_101165 - BLOCK
      ?auto_101166 - BLOCK
      ?auto_101167 - BLOCK
      ?auto_101168 - BLOCK
      ?auto_101169 - BLOCK
      ?auto_101170 - BLOCK
      ?auto_101171 - BLOCK
      ?auto_101172 - BLOCK
    )
    :vars
    (
      ?auto_101173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101172 ?auto_101173 ) ( ON-TABLE ?auto_101164 ) ( ON ?auto_101165 ?auto_101164 ) ( ON ?auto_101166 ?auto_101165 ) ( ON ?auto_101167 ?auto_101166 ) ( not ( = ?auto_101164 ?auto_101165 ) ) ( not ( = ?auto_101164 ?auto_101166 ) ) ( not ( = ?auto_101164 ?auto_101167 ) ) ( not ( = ?auto_101164 ?auto_101168 ) ) ( not ( = ?auto_101164 ?auto_101169 ) ) ( not ( = ?auto_101164 ?auto_101170 ) ) ( not ( = ?auto_101164 ?auto_101171 ) ) ( not ( = ?auto_101164 ?auto_101172 ) ) ( not ( = ?auto_101164 ?auto_101173 ) ) ( not ( = ?auto_101165 ?auto_101166 ) ) ( not ( = ?auto_101165 ?auto_101167 ) ) ( not ( = ?auto_101165 ?auto_101168 ) ) ( not ( = ?auto_101165 ?auto_101169 ) ) ( not ( = ?auto_101165 ?auto_101170 ) ) ( not ( = ?auto_101165 ?auto_101171 ) ) ( not ( = ?auto_101165 ?auto_101172 ) ) ( not ( = ?auto_101165 ?auto_101173 ) ) ( not ( = ?auto_101166 ?auto_101167 ) ) ( not ( = ?auto_101166 ?auto_101168 ) ) ( not ( = ?auto_101166 ?auto_101169 ) ) ( not ( = ?auto_101166 ?auto_101170 ) ) ( not ( = ?auto_101166 ?auto_101171 ) ) ( not ( = ?auto_101166 ?auto_101172 ) ) ( not ( = ?auto_101166 ?auto_101173 ) ) ( not ( = ?auto_101167 ?auto_101168 ) ) ( not ( = ?auto_101167 ?auto_101169 ) ) ( not ( = ?auto_101167 ?auto_101170 ) ) ( not ( = ?auto_101167 ?auto_101171 ) ) ( not ( = ?auto_101167 ?auto_101172 ) ) ( not ( = ?auto_101167 ?auto_101173 ) ) ( not ( = ?auto_101168 ?auto_101169 ) ) ( not ( = ?auto_101168 ?auto_101170 ) ) ( not ( = ?auto_101168 ?auto_101171 ) ) ( not ( = ?auto_101168 ?auto_101172 ) ) ( not ( = ?auto_101168 ?auto_101173 ) ) ( not ( = ?auto_101169 ?auto_101170 ) ) ( not ( = ?auto_101169 ?auto_101171 ) ) ( not ( = ?auto_101169 ?auto_101172 ) ) ( not ( = ?auto_101169 ?auto_101173 ) ) ( not ( = ?auto_101170 ?auto_101171 ) ) ( not ( = ?auto_101170 ?auto_101172 ) ) ( not ( = ?auto_101170 ?auto_101173 ) ) ( not ( = ?auto_101171 ?auto_101172 ) ) ( not ( = ?auto_101171 ?auto_101173 ) ) ( not ( = ?auto_101172 ?auto_101173 ) ) ( ON ?auto_101171 ?auto_101172 ) ( ON ?auto_101170 ?auto_101171 ) ( ON ?auto_101169 ?auto_101170 ) ( CLEAR ?auto_101167 ) ( ON ?auto_101168 ?auto_101169 ) ( CLEAR ?auto_101168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101164 ?auto_101165 ?auto_101166 ?auto_101167 ?auto_101168 )
      ( MAKE-9PILE ?auto_101164 ?auto_101165 ?auto_101166 ?auto_101167 ?auto_101168 ?auto_101169 ?auto_101170 ?auto_101171 ?auto_101172 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101183 - BLOCK
      ?auto_101184 - BLOCK
      ?auto_101185 - BLOCK
      ?auto_101186 - BLOCK
      ?auto_101187 - BLOCK
      ?auto_101188 - BLOCK
      ?auto_101189 - BLOCK
      ?auto_101190 - BLOCK
      ?auto_101191 - BLOCK
    )
    :vars
    (
      ?auto_101192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101191 ?auto_101192 ) ( ON-TABLE ?auto_101183 ) ( ON ?auto_101184 ?auto_101183 ) ( ON ?auto_101185 ?auto_101184 ) ( not ( = ?auto_101183 ?auto_101184 ) ) ( not ( = ?auto_101183 ?auto_101185 ) ) ( not ( = ?auto_101183 ?auto_101186 ) ) ( not ( = ?auto_101183 ?auto_101187 ) ) ( not ( = ?auto_101183 ?auto_101188 ) ) ( not ( = ?auto_101183 ?auto_101189 ) ) ( not ( = ?auto_101183 ?auto_101190 ) ) ( not ( = ?auto_101183 ?auto_101191 ) ) ( not ( = ?auto_101183 ?auto_101192 ) ) ( not ( = ?auto_101184 ?auto_101185 ) ) ( not ( = ?auto_101184 ?auto_101186 ) ) ( not ( = ?auto_101184 ?auto_101187 ) ) ( not ( = ?auto_101184 ?auto_101188 ) ) ( not ( = ?auto_101184 ?auto_101189 ) ) ( not ( = ?auto_101184 ?auto_101190 ) ) ( not ( = ?auto_101184 ?auto_101191 ) ) ( not ( = ?auto_101184 ?auto_101192 ) ) ( not ( = ?auto_101185 ?auto_101186 ) ) ( not ( = ?auto_101185 ?auto_101187 ) ) ( not ( = ?auto_101185 ?auto_101188 ) ) ( not ( = ?auto_101185 ?auto_101189 ) ) ( not ( = ?auto_101185 ?auto_101190 ) ) ( not ( = ?auto_101185 ?auto_101191 ) ) ( not ( = ?auto_101185 ?auto_101192 ) ) ( not ( = ?auto_101186 ?auto_101187 ) ) ( not ( = ?auto_101186 ?auto_101188 ) ) ( not ( = ?auto_101186 ?auto_101189 ) ) ( not ( = ?auto_101186 ?auto_101190 ) ) ( not ( = ?auto_101186 ?auto_101191 ) ) ( not ( = ?auto_101186 ?auto_101192 ) ) ( not ( = ?auto_101187 ?auto_101188 ) ) ( not ( = ?auto_101187 ?auto_101189 ) ) ( not ( = ?auto_101187 ?auto_101190 ) ) ( not ( = ?auto_101187 ?auto_101191 ) ) ( not ( = ?auto_101187 ?auto_101192 ) ) ( not ( = ?auto_101188 ?auto_101189 ) ) ( not ( = ?auto_101188 ?auto_101190 ) ) ( not ( = ?auto_101188 ?auto_101191 ) ) ( not ( = ?auto_101188 ?auto_101192 ) ) ( not ( = ?auto_101189 ?auto_101190 ) ) ( not ( = ?auto_101189 ?auto_101191 ) ) ( not ( = ?auto_101189 ?auto_101192 ) ) ( not ( = ?auto_101190 ?auto_101191 ) ) ( not ( = ?auto_101190 ?auto_101192 ) ) ( not ( = ?auto_101191 ?auto_101192 ) ) ( ON ?auto_101190 ?auto_101191 ) ( ON ?auto_101189 ?auto_101190 ) ( ON ?auto_101188 ?auto_101189 ) ( ON ?auto_101187 ?auto_101188 ) ( CLEAR ?auto_101185 ) ( ON ?auto_101186 ?auto_101187 ) ( CLEAR ?auto_101186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101183 ?auto_101184 ?auto_101185 ?auto_101186 )
      ( MAKE-9PILE ?auto_101183 ?auto_101184 ?auto_101185 ?auto_101186 ?auto_101187 ?auto_101188 ?auto_101189 ?auto_101190 ?auto_101191 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101202 - BLOCK
      ?auto_101203 - BLOCK
      ?auto_101204 - BLOCK
      ?auto_101205 - BLOCK
      ?auto_101206 - BLOCK
      ?auto_101207 - BLOCK
      ?auto_101208 - BLOCK
      ?auto_101209 - BLOCK
      ?auto_101210 - BLOCK
    )
    :vars
    (
      ?auto_101211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101210 ?auto_101211 ) ( ON-TABLE ?auto_101202 ) ( ON ?auto_101203 ?auto_101202 ) ( ON ?auto_101204 ?auto_101203 ) ( not ( = ?auto_101202 ?auto_101203 ) ) ( not ( = ?auto_101202 ?auto_101204 ) ) ( not ( = ?auto_101202 ?auto_101205 ) ) ( not ( = ?auto_101202 ?auto_101206 ) ) ( not ( = ?auto_101202 ?auto_101207 ) ) ( not ( = ?auto_101202 ?auto_101208 ) ) ( not ( = ?auto_101202 ?auto_101209 ) ) ( not ( = ?auto_101202 ?auto_101210 ) ) ( not ( = ?auto_101202 ?auto_101211 ) ) ( not ( = ?auto_101203 ?auto_101204 ) ) ( not ( = ?auto_101203 ?auto_101205 ) ) ( not ( = ?auto_101203 ?auto_101206 ) ) ( not ( = ?auto_101203 ?auto_101207 ) ) ( not ( = ?auto_101203 ?auto_101208 ) ) ( not ( = ?auto_101203 ?auto_101209 ) ) ( not ( = ?auto_101203 ?auto_101210 ) ) ( not ( = ?auto_101203 ?auto_101211 ) ) ( not ( = ?auto_101204 ?auto_101205 ) ) ( not ( = ?auto_101204 ?auto_101206 ) ) ( not ( = ?auto_101204 ?auto_101207 ) ) ( not ( = ?auto_101204 ?auto_101208 ) ) ( not ( = ?auto_101204 ?auto_101209 ) ) ( not ( = ?auto_101204 ?auto_101210 ) ) ( not ( = ?auto_101204 ?auto_101211 ) ) ( not ( = ?auto_101205 ?auto_101206 ) ) ( not ( = ?auto_101205 ?auto_101207 ) ) ( not ( = ?auto_101205 ?auto_101208 ) ) ( not ( = ?auto_101205 ?auto_101209 ) ) ( not ( = ?auto_101205 ?auto_101210 ) ) ( not ( = ?auto_101205 ?auto_101211 ) ) ( not ( = ?auto_101206 ?auto_101207 ) ) ( not ( = ?auto_101206 ?auto_101208 ) ) ( not ( = ?auto_101206 ?auto_101209 ) ) ( not ( = ?auto_101206 ?auto_101210 ) ) ( not ( = ?auto_101206 ?auto_101211 ) ) ( not ( = ?auto_101207 ?auto_101208 ) ) ( not ( = ?auto_101207 ?auto_101209 ) ) ( not ( = ?auto_101207 ?auto_101210 ) ) ( not ( = ?auto_101207 ?auto_101211 ) ) ( not ( = ?auto_101208 ?auto_101209 ) ) ( not ( = ?auto_101208 ?auto_101210 ) ) ( not ( = ?auto_101208 ?auto_101211 ) ) ( not ( = ?auto_101209 ?auto_101210 ) ) ( not ( = ?auto_101209 ?auto_101211 ) ) ( not ( = ?auto_101210 ?auto_101211 ) ) ( ON ?auto_101209 ?auto_101210 ) ( ON ?auto_101208 ?auto_101209 ) ( ON ?auto_101207 ?auto_101208 ) ( ON ?auto_101206 ?auto_101207 ) ( CLEAR ?auto_101204 ) ( ON ?auto_101205 ?auto_101206 ) ( CLEAR ?auto_101205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101202 ?auto_101203 ?auto_101204 ?auto_101205 )
      ( MAKE-9PILE ?auto_101202 ?auto_101203 ?auto_101204 ?auto_101205 ?auto_101206 ?auto_101207 ?auto_101208 ?auto_101209 ?auto_101210 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101221 - BLOCK
      ?auto_101222 - BLOCK
      ?auto_101223 - BLOCK
      ?auto_101224 - BLOCK
      ?auto_101225 - BLOCK
      ?auto_101226 - BLOCK
      ?auto_101227 - BLOCK
      ?auto_101228 - BLOCK
      ?auto_101229 - BLOCK
    )
    :vars
    (
      ?auto_101230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101229 ?auto_101230 ) ( ON-TABLE ?auto_101221 ) ( ON ?auto_101222 ?auto_101221 ) ( not ( = ?auto_101221 ?auto_101222 ) ) ( not ( = ?auto_101221 ?auto_101223 ) ) ( not ( = ?auto_101221 ?auto_101224 ) ) ( not ( = ?auto_101221 ?auto_101225 ) ) ( not ( = ?auto_101221 ?auto_101226 ) ) ( not ( = ?auto_101221 ?auto_101227 ) ) ( not ( = ?auto_101221 ?auto_101228 ) ) ( not ( = ?auto_101221 ?auto_101229 ) ) ( not ( = ?auto_101221 ?auto_101230 ) ) ( not ( = ?auto_101222 ?auto_101223 ) ) ( not ( = ?auto_101222 ?auto_101224 ) ) ( not ( = ?auto_101222 ?auto_101225 ) ) ( not ( = ?auto_101222 ?auto_101226 ) ) ( not ( = ?auto_101222 ?auto_101227 ) ) ( not ( = ?auto_101222 ?auto_101228 ) ) ( not ( = ?auto_101222 ?auto_101229 ) ) ( not ( = ?auto_101222 ?auto_101230 ) ) ( not ( = ?auto_101223 ?auto_101224 ) ) ( not ( = ?auto_101223 ?auto_101225 ) ) ( not ( = ?auto_101223 ?auto_101226 ) ) ( not ( = ?auto_101223 ?auto_101227 ) ) ( not ( = ?auto_101223 ?auto_101228 ) ) ( not ( = ?auto_101223 ?auto_101229 ) ) ( not ( = ?auto_101223 ?auto_101230 ) ) ( not ( = ?auto_101224 ?auto_101225 ) ) ( not ( = ?auto_101224 ?auto_101226 ) ) ( not ( = ?auto_101224 ?auto_101227 ) ) ( not ( = ?auto_101224 ?auto_101228 ) ) ( not ( = ?auto_101224 ?auto_101229 ) ) ( not ( = ?auto_101224 ?auto_101230 ) ) ( not ( = ?auto_101225 ?auto_101226 ) ) ( not ( = ?auto_101225 ?auto_101227 ) ) ( not ( = ?auto_101225 ?auto_101228 ) ) ( not ( = ?auto_101225 ?auto_101229 ) ) ( not ( = ?auto_101225 ?auto_101230 ) ) ( not ( = ?auto_101226 ?auto_101227 ) ) ( not ( = ?auto_101226 ?auto_101228 ) ) ( not ( = ?auto_101226 ?auto_101229 ) ) ( not ( = ?auto_101226 ?auto_101230 ) ) ( not ( = ?auto_101227 ?auto_101228 ) ) ( not ( = ?auto_101227 ?auto_101229 ) ) ( not ( = ?auto_101227 ?auto_101230 ) ) ( not ( = ?auto_101228 ?auto_101229 ) ) ( not ( = ?auto_101228 ?auto_101230 ) ) ( not ( = ?auto_101229 ?auto_101230 ) ) ( ON ?auto_101228 ?auto_101229 ) ( ON ?auto_101227 ?auto_101228 ) ( ON ?auto_101226 ?auto_101227 ) ( ON ?auto_101225 ?auto_101226 ) ( ON ?auto_101224 ?auto_101225 ) ( CLEAR ?auto_101222 ) ( ON ?auto_101223 ?auto_101224 ) ( CLEAR ?auto_101223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101221 ?auto_101222 ?auto_101223 )
      ( MAKE-9PILE ?auto_101221 ?auto_101222 ?auto_101223 ?auto_101224 ?auto_101225 ?auto_101226 ?auto_101227 ?auto_101228 ?auto_101229 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101240 - BLOCK
      ?auto_101241 - BLOCK
      ?auto_101242 - BLOCK
      ?auto_101243 - BLOCK
      ?auto_101244 - BLOCK
      ?auto_101245 - BLOCK
      ?auto_101246 - BLOCK
      ?auto_101247 - BLOCK
      ?auto_101248 - BLOCK
    )
    :vars
    (
      ?auto_101249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101248 ?auto_101249 ) ( ON-TABLE ?auto_101240 ) ( ON ?auto_101241 ?auto_101240 ) ( not ( = ?auto_101240 ?auto_101241 ) ) ( not ( = ?auto_101240 ?auto_101242 ) ) ( not ( = ?auto_101240 ?auto_101243 ) ) ( not ( = ?auto_101240 ?auto_101244 ) ) ( not ( = ?auto_101240 ?auto_101245 ) ) ( not ( = ?auto_101240 ?auto_101246 ) ) ( not ( = ?auto_101240 ?auto_101247 ) ) ( not ( = ?auto_101240 ?auto_101248 ) ) ( not ( = ?auto_101240 ?auto_101249 ) ) ( not ( = ?auto_101241 ?auto_101242 ) ) ( not ( = ?auto_101241 ?auto_101243 ) ) ( not ( = ?auto_101241 ?auto_101244 ) ) ( not ( = ?auto_101241 ?auto_101245 ) ) ( not ( = ?auto_101241 ?auto_101246 ) ) ( not ( = ?auto_101241 ?auto_101247 ) ) ( not ( = ?auto_101241 ?auto_101248 ) ) ( not ( = ?auto_101241 ?auto_101249 ) ) ( not ( = ?auto_101242 ?auto_101243 ) ) ( not ( = ?auto_101242 ?auto_101244 ) ) ( not ( = ?auto_101242 ?auto_101245 ) ) ( not ( = ?auto_101242 ?auto_101246 ) ) ( not ( = ?auto_101242 ?auto_101247 ) ) ( not ( = ?auto_101242 ?auto_101248 ) ) ( not ( = ?auto_101242 ?auto_101249 ) ) ( not ( = ?auto_101243 ?auto_101244 ) ) ( not ( = ?auto_101243 ?auto_101245 ) ) ( not ( = ?auto_101243 ?auto_101246 ) ) ( not ( = ?auto_101243 ?auto_101247 ) ) ( not ( = ?auto_101243 ?auto_101248 ) ) ( not ( = ?auto_101243 ?auto_101249 ) ) ( not ( = ?auto_101244 ?auto_101245 ) ) ( not ( = ?auto_101244 ?auto_101246 ) ) ( not ( = ?auto_101244 ?auto_101247 ) ) ( not ( = ?auto_101244 ?auto_101248 ) ) ( not ( = ?auto_101244 ?auto_101249 ) ) ( not ( = ?auto_101245 ?auto_101246 ) ) ( not ( = ?auto_101245 ?auto_101247 ) ) ( not ( = ?auto_101245 ?auto_101248 ) ) ( not ( = ?auto_101245 ?auto_101249 ) ) ( not ( = ?auto_101246 ?auto_101247 ) ) ( not ( = ?auto_101246 ?auto_101248 ) ) ( not ( = ?auto_101246 ?auto_101249 ) ) ( not ( = ?auto_101247 ?auto_101248 ) ) ( not ( = ?auto_101247 ?auto_101249 ) ) ( not ( = ?auto_101248 ?auto_101249 ) ) ( ON ?auto_101247 ?auto_101248 ) ( ON ?auto_101246 ?auto_101247 ) ( ON ?auto_101245 ?auto_101246 ) ( ON ?auto_101244 ?auto_101245 ) ( ON ?auto_101243 ?auto_101244 ) ( CLEAR ?auto_101241 ) ( ON ?auto_101242 ?auto_101243 ) ( CLEAR ?auto_101242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101240 ?auto_101241 ?auto_101242 )
      ( MAKE-9PILE ?auto_101240 ?auto_101241 ?auto_101242 ?auto_101243 ?auto_101244 ?auto_101245 ?auto_101246 ?auto_101247 ?auto_101248 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101259 - BLOCK
      ?auto_101260 - BLOCK
      ?auto_101261 - BLOCK
      ?auto_101262 - BLOCK
      ?auto_101263 - BLOCK
      ?auto_101264 - BLOCK
      ?auto_101265 - BLOCK
      ?auto_101266 - BLOCK
      ?auto_101267 - BLOCK
    )
    :vars
    (
      ?auto_101268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101267 ?auto_101268 ) ( ON-TABLE ?auto_101259 ) ( not ( = ?auto_101259 ?auto_101260 ) ) ( not ( = ?auto_101259 ?auto_101261 ) ) ( not ( = ?auto_101259 ?auto_101262 ) ) ( not ( = ?auto_101259 ?auto_101263 ) ) ( not ( = ?auto_101259 ?auto_101264 ) ) ( not ( = ?auto_101259 ?auto_101265 ) ) ( not ( = ?auto_101259 ?auto_101266 ) ) ( not ( = ?auto_101259 ?auto_101267 ) ) ( not ( = ?auto_101259 ?auto_101268 ) ) ( not ( = ?auto_101260 ?auto_101261 ) ) ( not ( = ?auto_101260 ?auto_101262 ) ) ( not ( = ?auto_101260 ?auto_101263 ) ) ( not ( = ?auto_101260 ?auto_101264 ) ) ( not ( = ?auto_101260 ?auto_101265 ) ) ( not ( = ?auto_101260 ?auto_101266 ) ) ( not ( = ?auto_101260 ?auto_101267 ) ) ( not ( = ?auto_101260 ?auto_101268 ) ) ( not ( = ?auto_101261 ?auto_101262 ) ) ( not ( = ?auto_101261 ?auto_101263 ) ) ( not ( = ?auto_101261 ?auto_101264 ) ) ( not ( = ?auto_101261 ?auto_101265 ) ) ( not ( = ?auto_101261 ?auto_101266 ) ) ( not ( = ?auto_101261 ?auto_101267 ) ) ( not ( = ?auto_101261 ?auto_101268 ) ) ( not ( = ?auto_101262 ?auto_101263 ) ) ( not ( = ?auto_101262 ?auto_101264 ) ) ( not ( = ?auto_101262 ?auto_101265 ) ) ( not ( = ?auto_101262 ?auto_101266 ) ) ( not ( = ?auto_101262 ?auto_101267 ) ) ( not ( = ?auto_101262 ?auto_101268 ) ) ( not ( = ?auto_101263 ?auto_101264 ) ) ( not ( = ?auto_101263 ?auto_101265 ) ) ( not ( = ?auto_101263 ?auto_101266 ) ) ( not ( = ?auto_101263 ?auto_101267 ) ) ( not ( = ?auto_101263 ?auto_101268 ) ) ( not ( = ?auto_101264 ?auto_101265 ) ) ( not ( = ?auto_101264 ?auto_101266 ) ) ( not ( = ?auto_101264 ?auto_101267 ) ) ( not ( = ?auto_101264 ?auto_101268 ) ) ( not ( = ?auto_101265 ?auto_101266 ) ) ( not ( = ?auto_101265 ?auto_101267 ) ) ( not ( = ?auto_101265 ?auto_101268 ) ) ( not ( = ?auto_101266 ?auto_101267 ) ) ( not ( = ?auto_101266 ?auto_101268 ) ) ( not ( = ?auto_101267 ?auto_101268 ) ) ( ON ?auto_101266 ?auto_101267 ) ( ON ?auto_101265 ?auto_101266 ) ( ON ?auto_101264 ?auto_101265 ) ( ON ?auto_101263 ?auto_101264 ) ( ON ?auto_101262 ?auto_101263 ) ( ON ?auto_101261 ?auto_101262 ) ( CLEAR ?auto_101259 ) ( ON ?auto_101260 ?auto_101261 ) ( CLEAR ?auto_101260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101259 ?auto_101260 )
      ( MAKE-9PILE ?auto_101259 ?auto_101260 ?auto_101261 ?auto_101262 ?auto_101263 ?auto_101264 ?auto_101265 ?auto_101266 ?auto_101267 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101278 - BLOCK
      ?auto_101279 - BLOCK
      ?auto_101280 - BLOCK
      ?auto_101281 - BLOCK
      ?auto_101282 - BLOCK
      ?auto_101283 - BLOCK
      ?auto_101284 - BLOCK
      ?auto_101285 - BLOCK
      ?auto_101286 - BLOCK
    )
    :vars
    (
      ?auto_101287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101286 ?auto_101287 ) ( ON-TABLE ?auto_101278 ) ( not ( = ?auto_101278 ?auto_101279 ) ) ( not ( = ?auto_101278 ?auto_101280 ) ) ( not ( = ?auto_101278 ?auto_101281 ) ) ( not ( = ?auto_101278 ?auto_101282 ) ) ( not ( = ?auto_101278 ?auto_101283 ) ) ( not ( = ?auto_101278 ?auto_101284 ) ) ( not ( = ?auto_101278 ?auto_101285 ) ) ( not ( = ?auto_101278 ?auto_101286 ) ) ( not ( = ?auto_101278 ?auto_101287 ) ) ( not ( = ?auto_101279 ?auto_101280 ) ) ( not ( = ?auto_101279 ?auto_101281 ) ) ( not ( = ?auto_101279 ?auto_101282 ) ) ( not ( = ?auto_101279 ?auto_101283 ) ) ( not ( = ?auto_101279 ?auto_101284 ) ) ( not ( = ?auto_101279 ?auto_101285 ) ) ( not ( = ?auto_101279 ?auto_101286 ) ) ( not ( = ?auto_101279 ?auto_101287 ) ) ( not ( = ?auto_101280 ?auto_101281 ) ) ( not ( = ?auto_101280 ?auto_101282 ) ) ( not ( = ?auto_101280 ?auto_101283 ) ) ( not ( = ?auto_101280 ?auto_101284 ) ) ( not ( = ?auto_101280 ?auto_101285 ) ) ( not ( = ?auto_101280 ?auto_101286 ) ) ( not ( = ?auto_101280 ?auto_101287 ) ) ( not ( = ?auto_101281 ?auto_101282 ) ) ( not ( = ?auto_101281 ?auto_101283 ) ) ( not ( = ?auto_101281 ?auto_101284 ) ) ( not ( = ?auto_101281 ?auto_101285 ) ) ( not ( = ?auto_101281 ?auto_101286 ) ) ( not ( = ?auto_101281 ?auto_101287 ) ) ( not ( = ?auto_101282 ?auto_101283 ) ) ( not ( = ?auto_101282 ?auto_101284 ) ) ( not ( = ?auto_101282 ?auto_101285 ) ) ( not ( = ?auto_101282 ?auto_101286 ) ) ( not ( = ?auto_101282 ?auto_101287 ) ) ( not ( = ?auto_101283 ?auto_101284 ) ) ( not ( = ?auto_101283 ?auto_101285 ) ) ( not ( = ?auto_101283 ?auto_101286 ) ) ( not ( = ?auto_101283 ?auto_101287 ) ) ( not ( = ?auto_101284 ?auto_101285 ) ) ( not ( = ?auto_101284 ?auto_101286 ) ) ( not ( = ?auto_101284 ?auto_101287 ) ) ( not ( = ?auto_101285 ?auto_101286 ) ) ( not ( = ?auto_101285 ?auto_101287 ) ) ( not ( = ?auto_101286 ?auto_101287 ) ) ( ON ?auto_101285 ?auto_101286 ) ( ON ?auto_101284 ?auto_101285 ) ( ON ?auto_101283 ?auto_101284 ) ( ON ?auto_101282 ?auto_101283 ) ( ON ?auto_101281 ?auto_101282 ) ( ON ?auto_101280 ?auto_101281 ) ( CLEAR ?auto_101278 ) ( ON ?auto_101279 ?auto_101280 ) ( CLEAR ?auto_101279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101278 ?auto_101279 )
      ( MAKE-9PILE ?auto_101278 ?auto_101279 ?auto_101280 ?auto_101281 ?auto_101282 ?auto_101283 ?auto_101284 ?auto_101285 ?auto_101286 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101297 - BLOCK
      ?auto_101298 - BLOCK
      ?auto_101299 - BLOCK
      ?auto_101300 - BLOCK
      ?auto_101301 - BLOCK
      ?auto_101302 - BLOCK
      ?auto_101303 - BLOCK
      ?auto_101304 - BLOCK
      ?auto_101305 - BLOCK
    )
    :vars
    (
      ?auto_101306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101305 ?auto_101306 ) ( not ( = ?auto_101297 ?auto_101298 ) ) ( not ( = ?auto_101297 ?auto_101299 ) ) ( not ( = ?auto_101297 ?auto_101300 ) ) ( not ( = ?auto_101297 ?auto_101301 ) ) ( not ( = ?auto_101297 ?auto_101302 ) ) ( not ( = ?auto_101297 ?auto_101303 ) ) ( not ( = ?auto_101297 ?auto_101304 ) ) ( not ( = ?auto_101297 ?auto_101305 ) ) ( not ( = ?auto_101297 ?auto_101306 ) ) ( not ( = ?auto_101298 ?auto_101299 ) ) ( not ( = ?auto_101298 ?auto_101300 ) ) ( not ( = ?auto_101298 ?auto_101301 ) ) ( not ( = ?auto_101298 ?auto_101302 ) ) ( not ( = ?auto_101298 ?auto_101303 ) ) ( not ( = ?auto_101298 ?auto_101304 ) ) ( not ( = ?auto_101298 ?auto_101305 ) ) ( not ( = ?auto_101298 ?auto_101306 ) ) ( not ( = ?auto_101299 ?auto_101300 ) ) ( not ( = ?auto_101299 ?auto_101301 ) ) ( not ( = ?auto_101299 ?auto_101302 ) ) ( not ( = ?auto_101299 ?auto_101303 ) ) ( not ( = ?auto_101299 ?auto_101304 ) ) ( not ( = ?auto_101299 ?auto_101305 ) ) ( not ( = ?auto_101299 ?auto_101306 ) ) ( not ( = ?auto_101300 ?auto_101301 ) ) ( not ( = ?auto_101300 ?auto_101302 ) ) ( not ( = ?auto_101300 ?auto_101303 ) ) ( not ( = ?auto_101300 ?auto_101304 ) ) ( not ( = ?auto_101300 ?auto_101305 ) ) ( not ( = ?auto_101300 ?auto_101306 ) ) ( not ( = ?auto_101301 ?auto_101302 ) ) ( not ( = ?auto_101301 ?auto_101303 ) ) ( not ( = ?auto_101301 ?auto_101304 ) ) ( not ( = ?auto_101301 ?auto_101305 ) ) ( not ( = ?auto_101301 ?auto_101306 ) ) ( not ( = ?auto_101302 ?auto_101303 ) ) ( not ( = ?auto_101302 ?auto_101304 ) ) ( not ( = ?auto_101302 ?auto_101305 ) ) ( not ( = ?auto_101302 ?auto_101306 ) ) ( not ( = ?auto_101303 ?auto_101304 ) ) ( not ( = ?auto_101303 ?auto_101305 ) ) ( not ( = ?auto_101303 ?auto_101306 ) ) ( not ( = ?auto_101304 ?auto_101305 ) ) ( not ( = ?auto_101304 ?auto_101306 ) ) ( not ( = ?auto_101305 ?auto_101306 ) ) ( ON ?auto_101304 ?auto_101305 ) ( ON ?auto_101303 ?auto_101304 ) ( ON ?auto_101302 ?auto_101303 ) ( ON ?auto_101301 ?auto_101302 ) ( ON ?auto_101300 ?auto_101301 ) ( ON ?auto_101299 ?auto_101300 ) ( ON ?auto_101298 ?auto_101299 ) ( ON ?auto_101297 ?auto_101298 ) ( CLEAR ?auto_101297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101297 )
      ( MAKE-9PILE ?auto_101297 ?auto_101298 ?auto_101299 ?auto_101300 ?auto_101301 ?auto_101302 ?auto_101303 ?auto_101304 ?auto_101305 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_101316 - BLOCK
      ?auto_101317 - BLOCK
      ?auto_101318 - BLOCK
      ?auto_101319 - BLOCK
      ?auto_101320 - BLOCK
      ?auto_101321 - BLOCK
      ?auto_101322 - BLOCK
      ?auto_101323 - BLOCK
      ?auto_101324 - BLOCK
    )
    :vars
    (
      ?auto_101325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101324 ?auto_101325 ) ( not ( = ?auto_101316 ?auto_101317 ) ) ( not ( = ?auto_101316 ?auto_101318 ) ) ( not ( = ?auto_101316 ?auto_101319 ) ) ( not ( = ?auto_101316 ?auto_101320 ) ) ( not ( = ?auto_101316 ?auto_101321 ) ) ( not ( = ?auto_101316 ?auto_101322 ) ) ( not ( = ?auto_101316 ?auto_101323 ) ) ( not ( = ?auto_101316 ?auto_101324 ) ) ( not ( = ?auto_101316 ?auto_101325 ) ) ( not ( = ?auto_101317 ?auto_101318 ) ) ( not ( = ?auto_101317 ?auto_101319 ) ) ( not ( = ?auto_101317 ?auto_101320 ) ) ( not ( = ?auto_101317 ?auto_101321 ) ) ( not ( = ?auto_101317 ?auto_101322 ) ) ( not ( = ?auto_101317 ?auto_101323 ) ) ( not ( = ?auto_101317 ?auto_101324 ) ) ( not ( = ?auto_101317 ?auto_101325 ) ) ( not ( = ?auto_101318 ?auto_101319 ) ) ( not ( = ?auto_101318 ?auto_101320 ) ) ( not ( = ?auto_101318 ?auto_101321 ) ) ( not ( = ?auto_101318 ?auto_101322 ) ) ( not ( = ?auto_101318 ?auto_101323 ) ) ( not ( = ?auto_101318 ?auto_101324 ) ) ( not ( = ?auto_101318 ?auto_101325 ) ) ( not ( = ?auto_101319 ?auto_101320 ) ) ( not ( = ?auto_101319 ?auto_101321 ) ) ( not ( = ?auto_101319 ?auto_101322 ) ) ( not ( = ?auto_101319 ?auto_101323 ) ) ( not ( = ?auto_101319 ?auto_101324 ) ) ( not ( = ?auto_101319 ?auto_101325 ) ) ( not ( = ?auto_101320 ?auto_101321 ) ) ( not ( = ?auto_101320 ?auto_101322 ) ) ( not ( = ?auto_101320 ?auto_101323 ) ) ( not ( = ?auto_101320 ?auto_101324 ) ) ( not ( = ?auto_101320 ?auto_101325 ) ) ( not ( = ?auto_101321 ?auto_101322 ) ) ( not ( = ?auto_101321 ?auto_101323 ) ) ( not ( = ?auto_101321 ?auto_101324 ) ) ( not ( = ?auto_101321 ?auto_101325 ) ) ( not ( = ?auto_101322 ?auto_101323 ) ) ( not ( = ?auto_101322 ?auto_101324 ) ) ( not ( = ?auto_101322 ?auto_101325 ) ) ( not ( = ?auto_101323 ?auto_101324 ) ) ( not ( = ?auto_101323 ?auto_101325 ) ) ( not ( = ?auto_101324 ?auto_101325 ) ) ( ON ?auto_101323 ?auto_101324 ) ( ON ?auto_101322 ?auto_101323 ) ( ON ?auto_101321 ?auto_101322 ) ( ON ?auto_101320 ?auto_101321 ) ( ON ?auto_101319 ?auto_101320 ) ( ON ?auto_101318 ?auto_101319 ) ( ON ?auto_101317 ?auto_101318 ) ( ON ?auto_101316 ?auto_101317 ) ( CLEAR ?auto_101316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101316 )
      ( MAKE-9PILE ?auto_101316 ?auto_101317 ?auto_101318 ?auto_101319 ?auto_101320 ?auto_101321 ?auto_101322 ?auto_101323 ?auto_101324 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101336 - BLOCK
      ?auto_101337 - BLOCK
      ?auto_101338 - BLOCK
      ?auto_101339 - BLOCK
      ?auto_101340 - BLOCK
      ?auto_101341 - BLOCK
      ?auto_101342 - BLOCK
      ?auto_101343 - BLOCK
      ?auto_101344 - BLOCK
      ?auto_101345 - BLOCK
    )
    :vars
    (
      ?auto_101346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101344 ) ( ON ?auto_101345 ?auto_101346 ) ( CLEAR ?auto_101345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101336 ) ( ON ?auto_101337 ?auto_101336 ) ( ON ?auto_101338 ?auto_101337 ) ( ON ?auto_101339 ?auto_101338 ) ( ON ?auto_101340 ?auto_101339 ) ( ON ?auto_101341 ?auto_101340 ) ( ON ?auto_101342 ?auto_101341 ) ( ON ?auto_101343 ?auto_101342 ) ( ON ?auto_101344 ?auto_101343 ) ( not ( = ?auto_101336 ?auto_101337 ) ) ( not ( = ?auto_101336 ?auto_101338 ) ) ( not ( = ?auto_101336 ?auto_101339 ) ) ( not ( = ?auto_101336 ?auto_101340 ) ) ( not ( = ?auto_101336 ?auto_101341 ) ) ( not ( = ?auto_101336 ?auto_101342 ) ) ( not ( = ?auto_101336 ?auto_101343 ) ) ( not ( = ?auto_101336 ?auto_101344 ) ) ( not ( = ?auto_101336 ?auto_101345 ) ) ( not ( = ?auto_101336 ?auto_101346 ) ) ( not ( = ?auto_101337 ?auto_101338 ) ) ( not ( = ?auto_101337 ?auto_101339 ) ) ( not ( = ?auto_101337 ?auto_101340 ) ) ( not ( = ?auto_101337 ?auto_101341 ) ) ( not ( = ?auto_101337 ?auto_101342 ) ) ( not ( = ?auto_101337 ?auto_101343 ) ) ( not ( = ?auto_101337 ?auto_101344 ) ) ( not ( = ?auto_101337 ?auto_101345 ) ) ( not ( = ?auto_101337 ?auto_101346 ) ) ( not ( = ?auto_101338 ?auto_101339 ) ) ( not ( = ?auto_101338 ?auto_101340 ) ) ( not ( = ?auto_101338 ?auto_101341 ) ) ( not ( = ?auto_101338 ?auto_101342 ) ) ( not ( = ?auto_101338 ?auto_101343 ) ) ( not ( = ?auto_101338 ?auto_101344 ) ) ( not ( = ?auto_101338 ?auto_101345 ) ) ( not ( = ?auto_101338 ?auto_101346 ) ) ( not ( = ?auto_101339 ?auto_101340 ) ) ( not ( = ?auto_101339 ?auto_101341 ) ) ( not ( = ?auto_101339 ?auto_101342 ) ) ( not ( = ?auto_101339 ?auto_101343 ) ) ( not ( = ?auto_101339 ?auto_101344 ) ) ( not ( = ?auto_101339 ?auto_101345 ) ) ( not ( = ?auto_101339 ?auto_101346 ) ) ( not ( = ?auto_101340 ?auto_101341 ) ) ( not ( = ?auto_101340 ?auto_101342 ) ) ( not ( = ?auto_101340 ?auto_101343 ) ) ( not ( = ?auto_101340 ?auto_101344 ) ) ( not ( = ?auto_101340 ?auto_101345 ) ) ( not ( = ?auto_101340 ?auto_101346 ) ) ( not ( = ?auto_101341 ?auto_101342 ) ) ( not ( = ?auto_101341 ?auto_101343 ) ) ( not ( = ?auto_101341 ?auto_101344 ) ) ( not ( = ?auto_101341 ?auto_101345 ) ) ( not ( = ?auto_101341 ?auto_101346 ) ) ( not ( = ?auto_101342 ?auto_101343 ) ) ( not ( = ?auto_101342 ?auto_101344 ) ) ( not ( = ?auto_101342 ?auto_101345 ) ) ( not ( = ?auto_101342 ?auto_101346 ) ) ( not ( = ?auto_101343 ?auto_101344 ) ) ( not ( = ?auto_101343 ?auto_101345 ) ) ( not ( = ?auto_101343 ?auto_101346 ) ) ( not ( = ?auto_101344 ?auto_101345 ) ) ( not ( = ?auto_101344 ?auto_101346 ) ) ( not ( = ?auto_101345 ?auto_101346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101345 ?auto_101346 )
      ( !STACK ?auto_101345 ?auto_101344 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101357 - BLOCK
      ?auto_101358 - BLOCK
      ?auto_101359 - BLOCK
      ?auto_101360 - BLOCK
      ?auto_101361 - BLOCK
      ?auto_101362 - BLOCK
      ?auto_101363 - BLOCK
      ?auto_101364 - BLOCK
      ?auto_101365 - BLOCK
      ?auto_101366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101365 ) ( ON-TABLE ?auto_101366 ) ( CLEAR ?auto_101366 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101357 ) ( ON ?auto_101358 ?auto_101357 ) ( ON ?auto_101359 ?auto_101358 ) ( ON ?auto_101360 ?auto_101359 ) ( ON ?auto_101361 ?auto_101360 ) ( ON ?auto_101362 ?auto_101361 ) ( ON ?auto_101363 ?auto_101362 ) ( ON ?auto_101364 ?auto_101363 ) ( ON ?auto_101365 ?auto_101364 ) ( not ( = ?auto_101357 ?auto_101358 ) ) ( not ( = ?auto_101357 ?auto_101359 ) ) ( not ( = ?auto_101357 ?auto_101360 ) ) ( not ( = ?auto_101357 ?auto_101361 ) ) ( not ( = ?auto_101357 ?auto_101362 ) ) ( not ( = ?auto_101357 ?auto_101363 ) ) ( not ( = ?auto_101357 ?auto_101364 ) ) ( not ( = ?auto_101357 ?auto_101365 ) ) ( not ( = ?auto_101357 ?auto_101366 ) ) ( not ( = ?auto_101358 ?auto_101359 ) ) ( not ( = ?auto_101358 ?auto_101360 ) ) ( not ( = ?auto_101358 ?auto_101361 ) ) ( not ( = ?auto_101358 ?auto_101362 ) ) ( not ( = ?auto_101358 ?auto_101363 ) ) ( not ( = ?auto_101358 ?auto_101364 ) ) ( not ( = ?auto_101358 ?auto_101365 ) ) ( not ( = ?auto_101358 ?auto_101366 ) ) ( not ( = ?auto_101359 ?auto_101360 ) ) ( not ( = ?auto_101359 ?auto_101361 ) ) ( not ( = ?auto_101359 ?auto_101362 ) ) ( not ( = ?auto_101359 ?auto_101363 ) ) ( not ( = ?auto_101359 ?auto_101364 ) ) ( not ( = ?auto_101359 ?auto_101365 ) ) ( not ( = ?auto_101359 ?auto_101366 ) ) ( not ( = ?auto_101360 ?auto_101361 ) ) ( not ( = ?auto_101360 ?auto_101362 ) ) ( not ( = ?auto_101360 ?auto_101363 ) ) ( not ( = ?auto_101360 ?auto_101364 ) ) ( not ( = ?auto_101360 ?auto_101365 ) ) ( not ( = ?auto_101360 ?auto_101366 ) ) ( not ( = ?auto_101361 ?auto_101362 ) ) ( not ( = ?auto_101361 ?auto_101363 ) ) ( not ( = ?auto_101361 ?auto_101364 ) ) ( not ( = ?auto_101361 ?auto_101365 ) ) ( not ( = ?auto_101361 ?auto_101366 ) ) ( not ( = ?auto_101362 ?auto_101363 ) ) ( not ( = ?auto_101362 ?auto_101364 ) ) ( not ( = ?auto_101362 ?auto_101365 ) ) ( not ( = ?auto_101362 ?auto_101366 ) ) ( not ( = ?auto_101363 ?auto_101364 ) ) ( not ( = ?auto_101363 ?auto_101365 ) ) ( not ( = ?auto_101363 ?auto_101366 ) ) ( not ( = ?auto_101364 ?auto_101365 ) ) ( not ( = ?auto_101364 ?auto_101366 ) ) ( not ( = ?auto_101365 ?auto_101366 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_101366 )
      ( !STACK ?auto_101366 ?auto_101365 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101377 - BLOCK
      ?auto_101378 - BLOCK
      ?auto_101379 - BLOCK
      ?auto_101380 - BLOCK
      ?auto_101381 - BLOCK
      ?auto_101382 - BLOCK
      ?auto_101383 - BLOCK
      ?auto_101384 - BLOCK
      ?auto_101385 - BLOCK
      ?auto_101386 - BLOCK
    )
    :vars
    (
      ?auto_101387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101386 ?auto_101387 ) ( ON-TABLE ?auto_101377 ) ( ON ?auto_101378 ?auto_101377 ) ( ON ?auto_101379 ?auto_101378 ) ( ON ?auto_101380 ?auto_101379 ) ( ON ?auto_101381 ?auto_101380 ) ( ON ?auto_101382 ?auto_101381 ) ( ON ?auto_101383 ?auto_101382 ) ( ON ?auto_101384 ?auto_101383 ) ( not ( = ?auto_101377 ?auto_101378 ) ) ( not ( = ?auto_101377 ?auto_101379 ) ) ( not ( = ?auto_101377 ?auto_101380 ) ) ( not ( = ?auto_101377 ?auto_101381 ) ) ( not ( = ?auto_101377 ?auto_101382 ) ) ( not ( = ?auto_101377 ?auto_101383 ) ) ( not ( = ?auto_101377 ?auto_101384 ) ) ( not ( = ?auto_101377 ?auto_101385 ) ) ( not ( = ?auto_101377 ?auto_101386 ) ) ( not ( = ?auto_101377 ?auto_101387 ) ) ( not ( = ?auto_101378 ?auto_101379 ) ) ( not ( = ?auto_101378 ?auto_101380 ) ) ( not ( = ?auto_101378 ?auto_101381 ) ) ( not ( = ?auto_101378 ?auto_101382 ) ) ( not ( = ?auto_101378 ?auto_101383 ) ) ( not ( = ?auto_101378 ?auto_101384 ) ) ( not ( = ?auto_101378 ?auto_101385 ) ) ( not ( = ?auto_101378 ?auto_101386 ) ) ( not ( = ?auto_101378 ?auto_101387 ) ) ( not ( = ?auto_101379 ?auto_101380 ) ) ( not ( = ?auto_101379 ?auto_101381 ) ) ( not ( = ?auto_101379 ?auto_101382 ) ) ( not ( = ?auto_101379 ?auto_101383 ) ) ( not ( = ?auto_101379 ?auto_101384 ) ) ( not ( = ?auto_101379 ?auto_101385 ) ) ( not ( = ?auto_101379 ?auto_101386 ) ) ( not ( = ?auto_101379 ?auto_101387 ) ) ( not ( = ?auto_101380 ?auto_101381 ) ) ( not ( = ?auto_101380 ?auto_101382 ) ) ( not ( = ?auto_101380 ?auto_101383 ) ) ( not ( = ?auto_101380 ?auto_101384 ) ) ( not ( = ?auto_101380 ?auto_101385 ) ) ( not ( = ?auto_101380 ?auto_101386 ) ) ( not ( = ?auto_101380 ?auto_101387 ) ) ( not ( = ?auto_101381 ?auto_101382 ) ) ( not ( = ?auto_101381 ?auto_101383 ) ) ( not ( = ?auto_101381 ?auto_101384 ) ) ( not ( = ?auto_101381 ?auto_101385 ) ) ( not ( = ?auto_101381 ?auto_101386 ) ) ( not ( = ?auto_101381 ?auto_101387 ) ) ( not ( = ?auto_101382 ?auto_101383 ) ) ( not ( = ?auto_101382 ?auto_101384 ) ) ( not ( = ?auto_101382 ?auto_101385 ) ) ( not ( = ?auto_101382 ?auto_101386 ) ) ( not ( = ?auto_101382 ?auto_101387 ) ) ( not ( = ?auto_101383 ?auto_101384 ) ) ( not ( = ?auto_101383 ?auto_101385 ) ) ( not ( = ?auto_101383 ?auto_101386 ) ) ( not ( = ?auto_101383 ?auto_101387 ) ) ( not ( = ?auto_101384 ?auto_101385 ) ) ( not ( = ?auto_101384 ?auto_101386 ) ) ( not ( = ?auto_101384 ?auto_101387 ) ) ( not ( = ?auto_101385 ?auto_101386 ) ) ( not ( = ?auto_101385 ?auto_101387 ) ) ( not ( = ?auto_101386 ?auto_101387 ) ) ( CLEAR ?auto_101384 ) ( ON ?auto_101385 ?auto_101386 ) ( CLEAR ?auto_101385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_101377 ?auto_101378 ?auto_101379 ?auto_101380 ?auto_101381 ?auto_101382 ?auto_101383 ?auto_101384 ?auto_101385 )
      ( MAKE-10PILE ?auto_101377 ?auto_101378 ?auto_101379 ?auto_101380 ?auto_101381 ?auto_101382 ?auto_101383 ?auto_101384 ?auto_101385 ?auto_101386 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101398 - BLOCK
      ?auto_101399 - BLOCK
      ?auto_101400 - BLOCK
      ?auto_101401 - BLOCK
      ?auto_101402 - BLOCK
      ?auto_101403 - BLOCK
      ?auto_101404 - BLOCK
      ?auto_101405 - BLOCK
      ?auto_101406 - BLOCK
      ?auto_101407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101407 ) ( ON-TABLE ?auto_101398 ) ( ON ?auto_101399 ?auto_101398 ) ( ON ?auto_101400 ?auto_101399 ) ( ON ?auto_101401 ?auto_101400 ) ( ON ?auto_101402 ?auto_101401 ) ( ON ?auto_101403 ?auto_101402 ) ( ON ?auto_101404 ?auto_101403 ) ( ON ?auto_101405 ?auto_101404 ) ( not ( = ?auto_101398 ?auto_101399 ) ) ( not ( = ?auto_101398 ?auto_101400 ) ) ( not ( = ?auto_101398 ?auto_101401 ) ) ( not ( = ?auto_101398 ?auto_101402 ) ) ( not ( = ?auto_101398 ?auto_101403 ) ) ( not ( = ?auto_101398 ?auto_101404 ) ) ( not ( = ?auto_101398 ?auto_101405 ) ) ( not ( = ?auto_101398 ?auto_101406 ) ) ( not ( = ?auto_101398 ?auto_101407 ) ) ( not ( = ?auto_101399 ?auto_101400 ) ) ( not ( = ?auto_101399 ?auto_101401 ) ) ( not ( = ?auto_101399 ?auto_101402 ) ) ( not ( = ?auto_101399 ?auto_101403 ) ) ( not ( = ?auto_101399 ?auto_101404 ) ) ( not ( = ?auto_101399 ?auto_101405 ) ) ( not ( = ?auto_101399 ?auto_101406 ) ) ( not ( = ?auto_101399 ?auto_101407 ) ) ( not ( = ?auto_101400 ?auto_101401 ) ) ( not ( = ?auto_101400 ?auto_101402 ) ) ( not ( = ?auto_101400 ?auto_101403 ) ) ( not ( = ?auto_101400 ?auto_101404 ) ) ( not ( = ?auto_101400 ?auto_101405 ) ) ( not ( = ?auto_101400 ?auto_101406 ) ) ( not ( = ?auto_101400 ?auto_101407 ) ) ( not ( = ?auto_101401 ?auto_101402 ) ) ( not ( = ?auto_101401 ?auto_101403 ) ) ( not ( = ?auto_101401 ?auto_101404 ) ) ( not ( = ?auto_101401 ?auto_101405 ) ) ( not ( = ?auto_101401 ?auto_101406 ) ) ( not ( = ?auto_101401 ?auto_101407 ) ) ( not ( = ?auto_101402 ?auto_101403 ) ) ( not ( = ?auto_101402 ?auto_101404 ) ) ( not ( = ?auto_101402 ?auto_101405 ) ) ( not ( = ?auto_101402 ?auto_101406 ) ) ( not ( = ?auto_101402 ?auto_101407 ) ) ( not ( = ?auto_101403 ?auto_101404 ) ) ( not ( = ?auto_101403 ?auto_101405 ) ) ( not ( = ?auto_101403 ?auto_101406 ) ) ( not ( = ?auto_101403 ?auto_101407 ) ) ( not ( = ?auto_101404 ?auto_101405 ) ) ( not ( = ?auto_101404 ?auto_101406 ) ) ( not ( = ?auto_101404 ?auto_101407 ) ) ( not ( = ?auto_101405 ?auto_101406 ) ) ( not ( = ?auto_101405 ?auto_101407 ) ) ( not ( = ?auto_101406 ?auto_101407 ) ) ( CLEAR ?auto_101405 ) ( ON ?auto_101406 ?auto_101407 ) ( CLEAR ?auto_101406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_101398 ?auto_101399 ?auto_101400 ?auto_101401 ?auto_101402 ?auto_101403 ?auto_101404 ?auto_101405 ?auto_101406 )
      ( MAKE-10PILE ?auto_101398 ?auto_101399 ?auto_101400 ?auto_101401 ?auto_101402 ?auto_101403 ?auto_101404 ?auto_101405 ?auto_101406 ?auto_101407 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101418 - BLOCK
      ?auto_101419 - BLOCK
      ?auto_101420 - BLOCK
      ?auto_101421 - BLOCK
      ?auto_101422 - BLOCK
      ?auto_101423 - BLOCK
      ?auto_101424 - BLOCK
      ?auto_101425 - BLOCK
      ?auto_101426 - BLOCK
      ?auto_101427 - BLOCK
    )
    :vars
    (
      ?auto_101428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101427 ?auto_101428 ) ( ON-TABLE ?auto_101418 ) ( ON ?auto_101419 ?auto_101418 ) ( ON ?auto_101420 ?auto_101419 ) ( ON ?auto_101421 ?auto_101420 ) ( ON ?auto_101422 ?auto_101421 ) ( ON ?auto_101423 ?auto_101422 ) ( ON ?auto_101424 ?auto_101423 ) ( not ( = ?auto_101418 ?auto_101419 ) ) ( not ( = ?auto_101418 ?auto_101420 ) ) ( not ( = ?auto_101418 ?auto_101421 ) ) ( not ( = ?auto_101418 ?auto_101422 ) ) ( not ( = ?auto_101418 ?auto_101423 ) ) ( not ( = ?auto_101418 ?auto_101424 ) ) ( not ( = ?auto_101418 ?auto_101425 ) ) ( not ( = ?auto_101418 ?auto_101426 ) ) ( not ( = ?auto_101418 ?auto_101427 ) ) ( not ( = ?auto_101418 ?auto_101428 ) ) ( not ( = ?auto_101419 ?auto_101420 ) ) ( not ( = ?auto_101419 ?auto_101421 ) ) ( not ( = ?auto_101419 ?auto_101422 ) ) ( not ( = ?auto_101419 ?auto_101423 ) ) ( not ( = ?auto_101419 ?auto_101424 ) ) ( not ( = ?auto_101419 ?auto_101425 ) ) ( not ( = ?auto_101419 ?auto_101426 ) ) ( not ( = ?auto_101419 ?auto_101427 ) ) ( not ( = ?auto_101419 ?auto_101428 ) ) ( not ( = ?auto_101420 ?auto_101421 ) ) ( not ( = ?auto_101420 ?auto_101422 ) ) ( not ( = ?auto_101420 ?auto_101423 ) ) ( not ( = ?auto_101420 ?auto_101424 ) ) ( not ( = ?auto_101420 ?auto_101425 ) ) ( not ( = ?auto_101420 ?auto_101426 ) ) ( not ( = ?auto_101420 ?auto_101427 ) ) ( not ( = ?auto_101420 ?auto_101428 ) ) ( not ( = ?auto_101421 ?auto_101422 ) ) ( not ( = ?auto_101421 ?auto_101423 ) ) ( not ( = ?auto_101421 ?auto_101424 ) ) ( not ( = ?auto_101421 ?auto_101425 ) ) ( not ( = ?auto_101421 ?auto_101426 ) ) ( not ( = ?auto_101421 ?auto_101427 ) ) ( not ( = ?auto_101421 ?auto_101428 ) ) ( not ( = ?auto_101422 ?auto_101423 ) ) ( not ( = ?auto_101422 ?auto_101424 ) ) ( not ( = ?auto_101422 ?auto_101425 ) ) ( not ( = ?auto_101422 ?auto_101426 ) ) ( not ( = ?auto_101422 ?auto_101427 ) ) ( not ( = ?auto_101422 ?auto_101428 ) ) ( not ( = ?auto_101423 ?auto_101424 ) ) ( not ( = ?auto_101423 ?auto_101425 ) ) ( not ( = ?auto_101423 ?auto_101426 ) ) ( not ( = ?auto_101423 ?auto_101427 ) ) ( not ( = ?auto_101423 ?auto_101428 ) ) ( not ( = ?auto_101424 ?auto_101425 ) ) ( not ( = ?auto_101424 ?auto_101426 ) ) ( not ( = ?auto_101424 ?auto_101427 ) ) ( not ( = ?auto_101424 ?auto_101428 ) ) ( not ( = ?auto_101425 ?auto_101426 ) ) ( not ( = ?auto_101425 ?auto_101427 ) ) ( not ( = ?auto_101425 ?auto_101428 ) ) ( not ( = ?auto_101426 ?auto_101427 ) ) ( not ( = ?auto_101426 ?auto_101428 ) ) ( not ( = ?auto_101427 ?auto_101428 ) ) ( ON ?auto_101426 ?auto_101427 ) ( CLEAR ?auto_101424 ) ( ON ?auto_101425 ?auto_101426 ) ( CLEAR ?auto_101425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_101418 ?auto_101419 ?auto_101420 ?auto_101421 ?auto_101422 ?auto_101423 ?auto_101424 ?auto_101425 )
      ( MAKE-10PILE ?auto_101418 ?auto_101419 ?auto_101420 ?auto_101421 ?auto_101422 ?auto_101423 ?auto_101424 ?auto_101425 ?auto_101426 ?auto_101427 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101439 - BLOCK
      ?auto_101440 - BLOCK
      ?auto_101441 - BLOCK
      ?auto_101442 - BLOCK
      ?auto_101443 - BLOCK
      ?auto_101444 - BLOCK
      ?auto_101445 - BLOCK
      ?auto_101446 - BLOCK
      ?auto_101447 - BLOCK
      ?auto_101448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101448 ) ( ON-TABLE ?auto_101439 ) ( ON ?auto_101440 ?auto_101439 ) ( ON ?auto_101441 ?auto_101440 ) ( ON ?auto_101442 ?auto_101441 ) ( ON ?auto_101443 ?auto_101442 ) ( ON ?auto_101444 ?auto_101443 ) ( ON ?auto_101445 ?auto_101444 ) ( not ( = ?auto_101439 ?auto_101440 ) ) ( not ( = ?auto_101439 ?auto_101441 ) ) ( not ( = ?auto_101439 ?auto_101442 ) ) ( not ( = ?auto_101439 ?auto_101443 ) ) ( not ( = ?auto_101439 ?auto_101444 ) ) ( not ( = ?auto_101439 ?auto_101445 ) ) ( not ( = ?auto_101439 ?auto_101446 ) ) ( not ( = ?auto_101439 ?auto_101447 ) ) ( not ( = ?auto_101439 ?auto_101448 ) ) ( not ( = ?auto_101440 ?auto_101441 ) ) ( not ( = ?auto_101440 ?auto_101442 ) ) ( not ( = ?auto_101440 ?auto_101443 ) ) ( not ( = ?auto_101440 ?auto_101444 ) ) ( not ( = ?auto_101440 ?auto_101445 ) ) ( not ( = ?auto_101440 ?auto_101446 ) ) ( not ( = ?auto_101440 ?auto_101447 ) ) ( not ( = ?auto_101440 ?auto_101448 ) ) ( not ( = ?auto_101441 ?auto_101442 ) ) ( not ( = ?auto_101441 ?auto_101443 ) ) ( not ( = ?auto_101441 ?auto_101444 ) ) ( not ( = ?auto_101441 ?auto_101445 ) ) ( not ( = ?auto_101441 ?auto_101446 ) ) ( not ( = ?auto_101441 ?auto_101447 ) ) ( not ( = ?auto_101441 ?auto_101448 ) ) ( not ( = ?auto_101442 ?auto_101443 ) ) ( not ( = ?auto_101442 ?auto_101444 ) ) ( not ( = ?auto_101442 ?auto_101445 ) ) ( not ( = ?auto_101442 ?auto_101446 ) ) ( not ( = ?auto_101442 ?auto_101447 ) ) ( not ( = ?auto_101442 ?auto_101448 ) ) ( not ( = ?auto_101443 ?auto_101444 ) ) ( not ( = ?auto_101443 ?auto_101445 ) ) ( not ( = ?auto_101443 ?auto_101446 ) ) ( not ( = ?auto_101443 ?auto_101447 ) ) ( not ( = ?auto_101443 ?auto_101448 ) ) ( not ( = ?auto_101444 ?auto_101445 ) ) ( not ( = ?auto_101444 ?auto_101446 ) ) ( not ( = ?auto_101444 ?auto_101447 ) ) ( not ( = ?auto_101444 ?auto_101448 ) ) ( not ( = ?auto_101445 ?auto_101446 ) ) ( not ( = ?auto_101445 ?auto_101447 ) ) ( not ( = ?auto_101445 ?auto_101448 ) ) ( not ( = ?auto_101446 ?auto_101447 ) ) ( not ( = ?auto_101446 ?auto_101448 ) ) ( not ( = ?auto_101447 ?auto_101448 ) ) ( ON ?auto_101447 ?auto_101448 ) ( CLEAR ?auto_101445 ) ( ON ?auto_101446 ?auto_101447 ) ( CLEAR ?auto_101446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_101439 ?auto_101440 ?auto_101441 ?auto_101442 ?auto_101443 ?auto_101444 ?auto_101445 ?auto_101446 )
      ( MAKE-10PILE ?auto_101439 ?auto_101440 ?auto_101441 ?auto_101442 ?auto_101443 ?auto_101444 ?auto_101445 ?auto_101446 ?auto_101447 ?auto_101448 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101459 - BLOCK
      ?auto_101460 - BLOCK
      ?auto_101461 - BLOCK
      ?auto_101462 - BLOCK
      ?auto_101463 - BLOCK
      ?auto_101464 - BLOCK
      ?auto_101465 - BLOCK
      ?auto_101466 - BLOCK
      ?auto_101467 - BLOCK
      ?auto_101468 - BLOCK
    )
    :vars
    (
      ?auto_101469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101468 ?auto_101469 ) ( ON-TABLE ?auto_101459 ) ( ON ?auto_101460 ?auto_101459 ) ( ON ?auto_101461 ?auto_101460 ) ( ON ?auto_101462 ?auto_101461 ) ( ON ?auto_101463 ?auto_101462 ) ( ON ?auto_101464 ?auto_101463 ) ( not ( = ?auto_101459 ?auto_101460 ) ) ( not ( = ?auto_101459 ?auto_101461 ) ) ( not ( = ?auto_101459 ?auto_101462 ) ) ( not ( = ?auto_101459 ?auto_101463 ) ) ( not ( = ?auto_101459 ?auto_101464 ) ) ( not ( = ?auto_101459 ?auto_101465 ) ) ( not ( = ?auto_101459 ?auto_101466 ) ) ( not ( = ?auto_101459 ?auto_101467 ) ) ( not ( = ?auto_101459 ?auto_101468 ) ) ( not ( = ?auto_101459 ?auto_101469 ) ) ( not ( = ?auto_101460 ?auto_101461 ) ) ( not ( = ?auto_101460 ?auto_101462 ) ) ( not ( = ?auto_101460 ?auto_101463 ) ) ( not ( = ?auto_101460 ?auto_101464 ) ) ( not ( = ?auto_101460 ?auto_101465 ) ) ( not ( = ?auto_101460 ?auto_101466 ) ) ( not ( = ?auto_101460 ?auto_101467 ) ) ( not ( = ?auto_101460 ?auto_101468 ) ) ( not ( = ?auto_101460 ?auto_101469 ) ) ( not ( = ?auto_101461 ?auto_101462 ) ) ( not ( = ?auto_101461 ?auto_101463 ) ) ( not ( = ?auto_101461 ?auto_101464 ) ) ( not ( = ?auto_101461 ?auto_101465 ) ) ( not ( = ?auto_101461 ?auto_101466 ) ) ( not ( = ?auto_101461 ?auto_101467 ) ) ( not ( = ?auto_101461 ?auto_101468 ) ) ( not ( = ?auto_101461 ?auto_101469 ) ) ( not ( = ?auto_101462 ?auto_101463 ) ) ( not ( = ?auto_101462 ?auto_101464 ) ) ( not ( = ?auto_101462 ?auto_101465 ) ) ( not ( = ?auto_101462 ?auto_101466 ) ) ( not ( = ?auto_101462 ?auto_101467 ) ) ( not ( = ?auto_101462 ?auto_101468 ) ) ( not ( = ?auto_101462 ?auto_101469 ) ) ( not ( = ?auto_101463 ?auto_101464 ) ) ( not ( = ?auto_101463 ?auto_101465 ) ) ( not ( = ?auto_101463 ?auto_101466 ) ) ( not ( = ?auto_101463 ?auto_101467 ) ) ( not ( = ?auto_101463 ?auto_101468 ) ) ( not ( = ?auto_101463 ?auto_101469 ) ) ( not ( = ?auto_101464 ?auto_101465 ) ) ( not ( = ?auto_101464 ?auto_101466 ) ) ( not ( = ?auto_101464 ?auto_101467 ) ) ( not ( = ?auto_101464 ?auto_101468 ) ) ( not ( = ?auto_101464 ?auto_101469 ) ) ( not ( = ?auto_101465 ?auto_101466 ) ) ( not ( = ?auto_101465 ?auto_101467 ) ) ( not ( = ?auto_101465 ?auto_101468 ) ) ( not ( = ?auto_101465 ?auto_101469 ) ) ( not ( = ?auto_101466 ?auto_101467 ) ) ( not ( = ?auto_101466 ?auto_101468 ) ) ( not ( = ?auto_101466 ?auto_101469 ) ) ( not ( = ?auto_101467 ?auto_101468 ) ) ( not ( = ?auto_101467 ?auto_101469 ) ) ( not ( = ?auto_101468 ?auto_101469 ) ) ( ON ?auto_101467 ?auto_101468 ) ( ON ?auto_101466 ?auto_101467 ) ( CLEAR ?auto_101464 ) ( ON ?auto_101465 ?auto_101466 ) ( CLEAR ?auto_101465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101459 ?auto_101460 ?auto_101461 ?auto_101462 ?auto_101463 ?auto_101464 ?auto_101465 )
      ( MAKE-10PILE ?auto_101459 ?auto_101460 ?auto_101461 ?auto_101462 ?auto_101463 ?auto_101464 ?auto_101465 ?auto_101466 ?auto_101467 ?auto_101468 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101480 - BLOCK
      ?auto_101481 - BLOCK
      ?auto_101482 - BLOCK
      ?auto_101483 - BLOCK
      ?auto_101484 - BLOCK
      ?auto_101485 - BLOCK
      ?auto_101486 - BLOCK
      ?auto_101487 - BLOCK
      ?auto_101488 - BLOCK
      ?auto_101489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101489 ) ( ON-TABLE ?auto_101480 ) ( ON ?auto_101481 ?auto_101480 ) ( ON ?auto_101482 ?auto_101481 ) ( ON ?auto_101483 ?auto_101482 ) ( ON ?auto_101484 ?auto_101483 ) ( ON ?auto_101485 ?auto_101484 ) ( not ( = ?auto_101480 ?auto_101481 ) ) ( not ( = ?auto_101480 ?auto_101482 ) ) ( not ( = ?auto_101480 ?auto_101483 ) ) ( not ( = ?auto_101480 ?auto_101484 ) ) ( not ( = ?auto_101480 ?auto_101485 ) ) ( not ( = ?auto_101480 ?auto_101486 ) ) ( not ( = ?auto_101480 ?auto_101487 ) ) ( not ( = ?auto_101480 ?auto_101488 ) ) ( not ( = ?auto_101480 ?auto_101489 ) ) ( not ( = ?auto_101481 ?auto_101482 ) ) ( not ( = ?auto_101481 ?auto_101483 ) ) ( not ( = ?auto_101481 ?auto_101484 ) ) ( not ( = ?auto_101481 ?auto_101485 ) ) ( not ( = ?auto_101481 ?auto_101486 ) ) ( not ( = ?auto_101481 ?auto_101487 ) ) ( not ( = ?auto_101481 ?auto_101488 ) ) ( not ( = ?auto_101481 ?auto_101489 ) ) ( not ( = ?auto_101482 ?auto_101483 ) ) ( not ( = ?auto_101482 ?auto_101484 ) ) ( not ( = ?auto_101482 ?auto_101485 ) ) ( not ( = ?auto_101482 ?auto_101486 ) ) ( not ( = ?auto_101482 ?auto_101487 ) ) ( not ( = ?auto_101482 ?auto_101488 ) ) ( not ( = ?auto_101482 ?auto_101489 ) ) ( not ( = ?auto_101483 ?auto_101484 ) ) ( not ( = ?auto_101483 ?auto_101485 ) ) ( not ( = ?auto_101483 ?auto_101486 ) ) ( not ( = ?auto_101483 ?auto_101487 ) ) ( not ( = ?auto_101483 ?auto_101488 ) ) ( not ( = ?auto_101483 ?auto_101489 ) ) ( not ( = ?auto_101484 ?auto_101485 ) ) ( not ( = ?auto_101484 ?auto_101486 ) ) ( not ( = ?auto_101484 ?auto_101487 ) ) ( not ( = ?auto_101484 ?auto_101488 ) ) ( not ( = ?auto_101484 ?auto_101489 ) ) ( not ( = ?auto_101485 ?auto_101486 ) ) ( not ( = ?auto_101485 ?auto_101487 ) ) ( not ( = ?auto_101485 ?auto_101488 ) ) ( not ( = ?auto_101485 ?auto_101489 ) ) ( not ( = ?auto_101486 ?auto_101487 ) ) ( not ( = ?auto_101486 ?auto_101488 ) ) ( not ( = ?auto_101486 ?auto_101489 ) ) ( not ( = ?auto_101487 ?auto_101488 ) ) ( not ( = ?auto_101487 ?auto_101489 ) ) ( not ( = ?auto_101488 ?auto_101489 ) ) ( ON ?auto_101488 ?auto_101489 ) ( ON ?auto_101487 ?auto_101488 ) ( CLEAR ?auto_101485 ) ( ON ?auto_101486 ?auto_101487 ) ( CLEAR ?auto_101486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101480 ?auto_101481 ?auto_101482 ?auto_101483 ?auto_101484 ?auto_101485 ?auto_101486 )
      ( MAKE-10PILE ?auto_101480 ?auto_101481 ?auto_101482 ?auto_101483 ?auto_101484 ?auto_101485 ?auto_101486 ?auto_101487 ?auto_101488 ?auto_101489 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101500 - BLOCK
      ?auto_101501 - BLOCK
      ?auto_101502 - BLOCK
      ?auto_101503 - BLOCK
      ?auto_101504 - BLOCK
      ?auto_101505 - BLOCK
      ?auto_101506 - BLOCK
      ?auto_101507 - BLOCK
      ?auto_101508 - BLOCK
      ?auto_101509 - BLOCK
    )
    :vars
    (
      ?auto_101510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101509 ?auto_101510 ) ( ON-TABLE ?auto_101500 ) ( ON ?auto_101501 ?auto_101500 ) ( ON ?auto_101502 ?auto_101501 ) ( ON ?auto_101503 ?auto_101502 ) ( ON ?auto_101504 ?auto_101503 ) ( not ( = ?auto_101500 ?auto_101501 ) ) ( not ( = ?auto_101500 ?auto_101502 ) ) ( not ( = ?auto_101500 ?auto_101503 ) ) ( not ( = ?auto_101500 ?auto_101504 ) ) ( not ( = ?auto_101500 ?auto_101505 ) ) ( not ( = ?auto_101500 ?auto_101506 ) ) ( not ( = ?auto_101500 ?auto_101507 ) ) ( not ( = ?auto_101500 ?auto_101508 ) ) ( not ( = ?auto_101500 ?auto_101509 ) ) ( not ( = ?auto_101500 ?auto_101510 ) ) ( not ( = ?auto_101501 ?auto_101502 ) ) ( not ( = ?auto_101501 ?auto_101503 ) ) ( not ( = ?auto_101501 ?auto_101504 ) ) ( not ( = ?auto_101501 ?auto_101505 ) ) ( not ( = ?auto_101501 ?auto_101506 ) ) ( not ( = ?auto_101501 ?auto_101507 ) ) ( not ( = ?auto_101501 ?auto_101508 ) ) ( not ( = ?auto_101501 ?auto_101509 ) ) ( not ( = ?auto_101501 ?auto_101510 ) ) ( not ( = ?auto_101502 ?auto_101503 ) ) ( not ( = ?auto_101502 ?auto_101504 ) ) ( not ( = ?auto_101502 ?auto_101505 ) ) ( not ( = ?auto_101502 ?auto_101506 ) ) ( not ( = ?auto_101502 ?auto_101507 ) ) ( not ( = ?auto_101502 ?auto_101508 ) ) ( not ( = ?auto_101502 ?auto_101509 ) ) ( not ( = ?auto_101502 ?auto_101510 ) ) ( not ( = ?auto_101503 ?auto_101504 ) ) ( not ( = ?auto_101503 ?auto_101505 ) ) ( not ( = ?auto_101503 ?auto_101506 ) ) ( not ( = ?auto_101503 ?auto_101507 ) ) ( not ( = ?auto_101503 ?auto_101508 ) ) ( not ( = ?auto_101503 ?auto_101509 ) ) ( not ( = ?auto_101503 ?auto_101510 ) ) ( not ( = ?auto_101504 ?auto_101505 ) ) ( not ( = ?auto_101504 ?auto_101506 ) ) ( not ( = ?auto_101504 ?auto_101507 ) ) ( not ( = ?auto_101504 ?auto_101508 ) ) ( not ( = ?auto_101504 ?auto_101509 ) ) ( not ( = ?auto_101504 ?auto_101510 ) ) ( not ( = ?auto_101505 ?auto_101506 ) ) ( not ( = ?auto_101505 ?auto_101507 ) ) ( not ( = ?auto_101505 ?auto_101508 ) ) ( not ( = ?auto_101505 ?auto_101509 ) ) ( not ( = ?auto_101505 ?auto_101510 ) ) ( not ( = ?auto_101506 ?auto_101507 ) ) ( not ( = ?auto_101506 ?auto_101508 ) ) ( not ( = ?auto_101506 ?auto_101509 ) ) ( not ( = ?auto_101506 ?auto_101510 ) ) ( not ( = ?auto_101507 ?auto_101508 ) ) ( not ( = ?auto_101507 ?auto_101509 ) ) ( not ( = ?auto_101507 ?auto_101510 ) ) ( not ( = ?auto_101508 ?auto_101509 ) ) ( not ( = ?auto_101508 ?auto_101510 ) ) ( not ( = ?auto_101509 ?auto_101510 ) ) ( ON ?auto_101508 ?auto_101509 ) ( ON ?auto_101507 ?auto_101508 ) ( ON ?auto_101506 ?auto_101507 ) ( CLEAR ?auto_101504 ) ( ON ?auto_101505 ?auto_101506 ) ( CLEAR ?auto_101505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101500 ?auto_101501 ?auto_101502 ?auto_101503 ?auto_101504 ?auto_101505 )
      ( MAKE-10PILE ?auto_101500 ?auto_101501 ?auto_101502 ?auto_101503 ?auto_101504 ?auto_101505 ?auto_101506 ?auto_101507 ?auto_101508 ?auto_101509 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101521 - BLOCK
      ?auto_101522 - BLOCK
      ?auto_101523 - BLOCK
      ?auto_101524 - BLOCK
      ?auto_101525 - BLOCK
      ?auto_101526 - BLOCK
      ?auto_101527 - BLOCK
      ?auto_101528 - BLOCK
      ?auto_101529 - BLOCK
      ?auto_101530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101530 ) ( ON-TABLE ?auto_101521 ) ( ON ?auto_101522 ?auto_101521 ) ( ON ?auto_101523 ?auto_101522 ) ( ON ?auto_101524 ?auto_101523 ) ( ON ?auto_101525 ?auto_101524 ) ( not ( = ?auto_101521 ?auto_101522 ) ) ( not ( = ?auto_101521 ?auto_101523 ) ) ( not ( = ?auto_101521 ?auto_101524 ) ) ( not ( = ?auto_101521 ?auto_101525 ) ) ( not ( = ?auto_101521 ?auto_101526 ) ) ( not ( = ?auto_101521 ?auto_101527 ) ) ( not ( = ?auto_101521 ?auto_101528 ) ) ( not ( = ?auto_101521 ?auto_101529 ) ) ( not ( = ?auto_101521 ?auto_101530 ) ) ( not ( = ?auto_101522 ?auto_101523 ) ) ( not ( = ?auto_101522 ?auto_101524 ) ) ( not ( = ?auto_101522 ?auto_101525 ) ) ( not ( = ?auto_101522 ?auto_101526 ) ) ( not ( = ?auto_101522 ?auto_101527 ) ) ( not ( = ?auto_101522 ?auto_101528 ) ) ( not ( = ?auto_101522 ?auto_101529 ) ) ( not ( = ?auto_101522 ?auto_101530 ) ) ( not ( = ?auto_101523 ?auto_101524 ) ) ( not ( = ?auto_101523 ?auto_101525 ) ) ( not ( = ?auto_101523 ?auto_101526 ) ) ( not ( = ?auto_101523 ?auto_101527 ) ) ( not ( = ?auto_101523 ?auto_101528 ) ) ( not ( = ?auto_101523 ?auto_101529 ) ) ( not ( = ?auto_101523 ?auto_101530 ) ) ( not ( = ?auto_101524 ?auto_101525 ) ) ( not ( = ?auto_101524 ?auto_101526 ) ) ( not ( = ?auto_101524 ?auto_101527 ) ) ( not ( = ?auto_101524 ?auto_101528 ) ) ( not ( = ?auto_101524 ?auto_101529 ) ) ( not ( = ?auto_101524 ?auto_101530 ) ) ( not ( = ?auto_101525 ?auto_101526 ) ) ( not ( = ?auto_101525 ?auto_101527 ) ) ( not ( = ?auto_101525 ?auto_101528 ) ) ( not ( = ?auto_101525 ?auto_101529 ) ) ( not ( = ?auto_101525 ?auto_101530 ) ) ( not ( = ?auto_101526 ?auto_101527 ) ) ( not ( = ?auto_101526 ?auto_101528 ) ) ( not ( = ?auto_101526 ?auto_101529 ) ) ( not ( = ?auto_101526 ?auto_101530 ) ) ( not ( = ?auto_101527 ?auto_101528 ) ) ( not ( = ?auto_101527 ?auto_101529 ) ) ( not ( = ?auto_101527 ?auto_101530 ) ) ( not ( = ?auto_101528 ?auto_101529 ) ) ( not ( = ?auto_101528 ?auto_101530 ) ) ( not ( = ?auto_101529 ?auto_101530 ) ) ( ON ?auto_101529 ?auto_101530 ) ( ON ?auto_101528 ?auto_101529 ) ( ON ?auto_101527 ?auto_101528 ) ( CLEAR ?auto_101525 ) ( ON ?auto_101526 ?auto_101527 ) ( CLEAR ?auto_101526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101521 ?auto_101522 ?auto_101523 ?auto_101524 ?auto_101525 ?auto_101526 )
      ( MAKE-10PILE ?auto_101521 ?auto_101522 ?auto_101523 ?auto_101524 ?auto_101525 ?auto_101526 ?auto_101527 ?auto_101528 ?auto_101529 ?auto_101530 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101541 - BLOCK
      ?auto_101542 - BLOCK
      ?auto_101543 - BLOCK
      ?auto_101544 - BLOCK
      ?auto_101545 - BLOCK
      ?auto_101546 - BLOCK
      ?auto_101547 - BLOCK
      ?auto_101548 - BLOCK
      ?auto_101549 - BLOCK
      ?auto_101550 - BLOCK
    )
    :vars
    (
      ?auto_101551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101550 ?auto_101551 ) ( ON-TABLE ?auto_101541 ) ( ON ?auto_101542 ?auto_101541 ) ( ON ?auto_101543 ?auto_101542 ) ( ON ?auto_101544 ?auto_101543 ) ( not ( = ?auto_101541 ?auto_101542 ) ) ( not ( = ?auto_101541 ?auto_101543 ) ) ( not ( = ?auto_101541 ?auto_101544 ) ) ( not ( = ?auto_101541 ?auto_101545 ) ) ( not ( = ?auto_101541 ?auto_101546 ) ) ( not ( = ?auto_101541 ?auto_101547 ) ) ( not ( = ?auto_101541 ?auto_101548 ) ) ( not ( = ?auto_101541 ?auto_101549 ) ) ( not ( = ?auto_101541 ?auto_101550 ) ) ( not ( = ?auto_101541 ?auto_101551 ) ) ( not ( = ?auto_101542 ?auto_101543 ) ) ( not ( = ?auto_101542 ?auto_101544 ) ) ( not ( = ?auto_101542 ?auto_101545 ) ) ( not ( = ?auto_101542 ?auto_101546 ) ) ( not ( = ?auto_101542 ?auto_101547 ) ) ( not ( = ?auto_101542 ?auto_101548 ) ) ( not ( = ?auto_101542 ?auto_101549 ) ) ( not ( = ?auto_101542 ?auto_101550 ) ) ( not ( = ?auto_101542 ?auto_101551 ) ) ( not ( = ?auto_101543 ?auto_101544 ) ) ( not ( = ?auto_101543 ?auto_101545 ) ) ( not ( = ?auto_101543 ?auto_101546 ) ) ( not ( = ?auto_101543 ?auto_101547 ) ) ( not ( = ?auto_101543 ?auto_101548 ) ) ( not ( = ?auto_101543 ?auto_101549 ) ) ( not ( = ?auto_101543 ?auto_101550 ) ) ( not ( = ?auto_101543 ?auto_101551 ) ) ( not ( = ?auto_101544 ?auto_101545 ) ) ( not ( = ?auto_101544 ?auto_101546 ) ) ( not ( = ?auto_101544 ?auto_101547 ) ) ( not ( = ?auto_101544 ?auto_101548 ) ) ( not ( = ?auto_101544 ?auto_101549 ) ) ( not ( = ?auto_101544 ?auto_101550 ) ) ( not ( = ?auto_101544 ?auto_101551 ) ) ( not ( = ?auto_101545 ?auto_101546 ) ) ( not ( = ?auto_101545 ?auto_101547 ) ) ( not ( = ?auto_101545 ?auto_101548 ) ) ( not ( = ?auto_101545 ?auto_101549 ) ) ( not ( = ?auto_101545 ?auto_101550 ) ) ( not ( = ?auto_101545 ?auto_101551 ) ) ( not ( = ?auto_101546 ?auto_101547 ) ) ( not ( = ?auto_101546 ?auto_101548 ) ) ( not ( = ?auto_101546 ?auto_101549 ) ) ( not ( = ?auto_101546 ?auto_101550 ) ) ( not ( = ?auto_101546 ?auto_101551 ) ) ( not ( = ?auto_101547 ?auto_101548 ) ) ( not ( = ?auto_101547 ?auto_101549 ) ) ( not ( = ?auto_101547 ?auto_101550 ) ) ( not ( = ?auto_101547 ?auto_101551 ) ) ( not ( = ?auto_101548 ?auto_101549 ) ) ( not ( = ?auto_101548 ?auto_101550 ) ) ( not ( = ?auto_101548 ?auto_101551 ) ) ( not ( = ?auto_101549 ?auto_101550 ) ) ( not ( = ?auto_101549 ?auto_101551 ) ) ( not ( = ?auto_101550 ?auto_101551 ) ) ( ON ?auto_101549 ?auto_101550 ) ( ON ?auto_101548 ?auto_101549 ) ( ON ?auto_101547 ?auto_101548 ) ( ON ?auto_101546 ?auto_101547 ) ( CLEAR ?auto_101544 ) ( ON ?auto_101545 ?auto_101546 ) ( CLEAR ?auto_101545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101541 ?auto_101542 ?auto_101543 ?auto_101544 ?auto_101545 )
      ( MAKE-10PILE ?auto_101541 ?auto_101542 ?auto_101543 ?auto_101544 ?auto_101545 ?auto_101546 ?auto_101547 ?auto_101548 ?auto_101549 ?auto_101550 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101562 - BLOCK
      ?auto_101563 - BLOCK
      ?auto_101564 - BLOCK
      ?auto_101565 - BLOCK
      ?auto_101566 - BLOCK
      ?auto_101567 - BLOCK
      ?auto_101568 - BLOCK
      ?auto_101569 - BLOCK
      ?auto_101570 - BLOCK
      ?auto_101571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101571 ) ( ON-TABLE ?auto_101562 ) ( ON ?auto_101563 ?auto_101562 ) ( ON ?auto_101564 ?auto_101563 ) ( ON ?auto_101565 ?auto_101564 ) ( not ( = ?auto_101562 ?auto_101563 ) ) ( not ( = ?auto_101562 ?auto_101564 ) ) ( not ( = ?auto_101562 ?auto_101565 ) ) ( not ( = ?auto_101562 ?auto_101566 ) ) ( not ( = ?auto_101562 ?auto_101567 ) ) ( not ( = ?auto_101562 ?auto_101568 ) ) ( not ( = ?auto_101562 ?auto_101569 ) ) ( not ( = ?auto_101562 ?auto_101570 ) ) ( not ( = ?auto_101562 ?auto_101571 ) ) ( not ( = ?auto_101563 ?auto_101564 ) ) ( not ( = ?auto_101563 ?auto_101565 ) ) ( not ( = ?auto_101563 ?auto_101566 ) ) ( not ( = ?auto_101563 ?auto_101567 ) ) ( not ( = ?auto_101563 ?auto_101568 ) ) ( not ( = ?auto_101563 ?auto_101569 ) ) ( not ( = ?auto_101563 ?auto_101570 ) ) ( not ( = ?auto_101563 ?auto_101571 ) ) ( not ( = ?auto_101564 ?auto_101565 ) ) ( not ( = ?auto_101564 ?auto_101566 ) ) ( not ( = ?auto_101564 ?auto_101567 ) ) ( not ( = ?auto_101564 ?auto_101568 ) ) ( not ( = ?auto_101564 ?auto_101569 ) ) ( not ( = ?auto_101564 ?auto_101570 ) ) ( not ( = ?auto_101564 ?auto_101571 ) ) ( not ( = ?auto_101565 ?auto_101566 ) ) ( not ( = ?auto_101565 ?auto_101567 ) ) ( not ( = ?auto_101565 ?auto_101568 ) ) ( not ( = ?auto_101565 ?auto_101569 ) ) ( not ( = ?auto_101565 ?auto_101570 ) ) ( not ( = ?auto_101565 ?auto_101571 ) ) ( not ( = ?auto_101566 ?auto_101567 ) ) ( not ( = ?auto_101566 ?auto_101568 ) ) ( not ( = ?auto_101566 ?auto_101569 ) ) ( not ( = ?auto_101566 ?auto_101570 ) ) ( not ( = ?auto_101566 ?auto_101571 ) ) ( not ( = ?auto_101567 ?auto_101568 ) ) ( not ( = ?auto_101567 ?auto_101569 ) ) ( not ( = ?auto_101567 ?auto_101570 ) ) ( not ( = ?auto_101567 ?auto_101571 ) ) ( not ( = ?auto_101568 ?auto_101569 ) ) ( not ( = ?auto_101568 ?auto_101570 ) ) ( not ( = ?auto_101568 ?auto_101571 ) ) ( not ( = ?auto_101569 ?auto_101570 ) ) ( not ( = ?auto_101569 ?auto_101571 ) ) ( not ( = ?auto_101570 ?auto_101571 ) ) ( ON ?auto_101570 ?auto_101571 ) ( ON ?auto_101569 ?auto_101570 ) ( ON ?auto_101568 ?auto_101569 ) ( ON ?auto_101567 ?auto_101568 ) ( CLEAR ?auto_101565 ) ( ON ?auto_101566 ?auto_101567 ) ( CLEAR ?auto_101566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101562 ?auto_101563 ?auto_101564 ?auto_101565 ?auto_101566 )
      ( MAKE-10PILE ?auto_101562 ?auto_101563 ?auto_101564 ?auto_101565 ?auto_101566 ?auto_101567 ?auto_101568 ?auto_101569 ?auto_101570 ?auto_101571 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101582 - BLOCK
      ?auto_101583 - BLOCK
      ?auto_101584 - BLOCK
      ?auto_101585 - BLOCK
      ?auto_101586 - BLOCK
      ?auto_101587 - BLOCK
      ?auto_101588 - BLOCK
      ?auto_101589 - BLOCK
      ?auto_101590 - BLOCK
      ?auto_101591 - BLOCK
    )
    :vars
    (
      ?auto_101592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101591 ?auto_101592 ) ( ON-TABLE ?auto_101582 ) ( ON ?auto_101583 ?auto_101582 ) ( ON ?auto_101584 ?auto_101583 ) ( not ( = ?auto_101582 ?auto_101583 ) ) ( not ( = ?auto_101582 ?auto_101584 ) ) ( not ( = ?auto_101582 ?auto_101585 ) ) ( not ( = ?auto_101582 ?auto_101586 ) ) ( not ( = ?auto_101582 ?auto_101587 ) ) ( not ( = ?auto_101582 ?auto_101588 ) ) ( not ( = ?auto_101582 ?auto_101589 ) ) ( not ( = ?auto_101582 ?auto_101590 ) ) ( not ( = ?auto_101582 ?auto_101591 ) ) ( not ( = ?auto_101582 ?auto_101592 ) ) ( not ( = ?auto_101583 ?auto_101584 ) ) ( not ( = ?auto_101583 ?auto_101585 ) ) ( not ( = ?auto_101583 ?auto_101586 ) ) ( not ( = ?auto_101583 ?auto_101587 ) ) ( not ( = ?auto_101583 ?auto_101588 ) ) ( not ( = ?auto_101583 ?auto_101589 ) ) ( not ( = ?auto_101583 ?auto_101590 ) ) ( not ( = ?auto_101583 ?auto_101591 ) ) ( not ( = ?auto_101583 ?auto_101592 ) ) ( not ( = ?auto_101584 ?auto_101585 ) ) ( not ( = ?auto_101584 ?auto_101586 ) ) ( not ( = ?auto_101584 ?auto_101587 ) ) ( not ( = ?auto_101584 ?auto_101588 ) ) ( not ( = ?auto_101584 ?auto_101589 ) ) ( not ( = ?auto_101584 ?auto_101590 ) ) ( not ( = ?auto_101584 ?auto_101591 ) ) ( not ( = ?auto_101584 ?auto_101592 ) ) ( not ( = ?auto_101585 ?auto_101586 ) ) ( not ( = ?auto_101585 ?auto_101587 ) ) ( not ( = ?auto_101585 ?auto_101588 ) ) ( not ( = ?auto_101585 ?auto_101589 ) ) ( not ( = ?auto_101585 ?auto_101590 ) ) ( not ( = ?auto_101585 ?auto_101591 ) ) ( not ( = ?auto_101585 ?auto_101592 ) ) ( not ( = ?auto_101586 ?auto_101587 ) ) ( not ( = ?auto_101586 ?auto_101588 ) ) ( not ( = ?auto_101586 ?auto_101589 ) ) ( not ( = ?auto_101586 ?auto_101590 ) ) ( not ( = ?auto_101586 ?auto_101591 ) ) ( not ( = ?auto_101586 ?auto_101592 ) ) ( not ( = ?auto_101587 ?auto_101588 ) ) ( not ( = ?auto_101587 ?auto_101589 ) ) ( not ( = ?auto_101587 ?auto_101590 ) ) ( not ( = ?auto_101587 ?auto_101591 ) ) ( not ( = ?auto_101587 ?auto_101592 ) ) ( not ( = ?auto_101588 ?auto_101589 ) ) ( not ( = ?auto_101588 ?auto_101590 ) ) ( not ( = ?auto_101588 ?auto_101591 ) ) ( not ( = ?auto_101588 ?auto_101592 ) ) ( not ( = ?auto_101589 ?auto_101590 ) ) ( not ( = ?auto_101589 ?auto_101591 ) ) ( not ( = ?auto_101589 ?auto_101592 ) ) ( not ( = ?auto_101590 ?auto_101591 ) ) ( not ( = ?auto_101590 ?auto_101592 ) ) ( not ( = ?auto_101591 ?auto_101592 ) ) ( ON ?auto_101590 ?auto_101591 ) ( ON ?auto_101589 ?auto_101590 ) ( ON ?auto_101588 ?auto_101589 ) ( ON ?auto_101587 ?auto_101588 ) ( ON ?auto_101586 ?auto_101587 ) ( CLEAR ?auto_101584 ) ( ON ?auto_101585 ?auto_101586 ) ( CLEAR ?auto_101585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101582 ?auto_101583 ?auto_101584 ?auto_101585 )
      ( MAKE-10PILE ?auto_101582 ?auto_101583 ?auto_101584 ?auto_101585 ?auto_101586 ?auto_101587 ?auto_101588 ?auto_101589 ?auto_101590 ?auto_101591 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101603 - BLOCK
      ?auto_101604 - BLOCK
      ?auto_101605 - BLOCK
      ?auto_101606 - BLOCK
      ?auto_101607 - BLOCK
      ?auto_101608 - BLOCK
      ?auto_101609 - BLOCK
      ?auto_101610 - BLOCK
      ?auto_101611 - BLOCK
      ?auto_101612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101612 ) ( ON-TABLE ?auto_101603 ) ( ON ?auto_101604 ?auto_101603 ) ( ON ?auto_101605 ?auto_101604 ) ( not ( = ?auto_101603 ?auto_101604 ) ) ( not ( = ?auto_101603 ?auto_101605 ) ) ( not ( = ?auto_101603 ?auto_101606 ) ) ( not ( = ?auto_101603 ?auto_101607 ) ) ( not ( = ?auto_101603 ?auto_101608 ) ) ( not ( = ?auto_101603 ?auto_101609 ) ) ( not ( = ?auto_101603 ?auto_101610 ) ) ( not ( = ?auto_101603 ?auto_101611 ) ) ( not ( = ?auto_101603 ?auto_101612 ) ) ( not ( = ?auto_101604 ?auto_101605 ) ) ( not ( = ?auto_101604 ?auto_101606 ) ) ( not ( = ?auto_101604 ?auto_101607 ) ) ( not ( = ?auto_101604 ?auto_101608 ) ) ( not ( = ?auto_101604 ?auto_101609 ) ) ( not ( = ?auto_101604 ?auto_101610 ) ) ( not ( = ?auto_101604 ?auto_101611 ) ) ( not ( = ?auto_101604 ?auto_101612 ) ) ( not ( = ?auto_101605 ?auto_101606 ) ) ( not ( = ?auto_101605 ?auto_101607 ) ) ( not ( = ?auto_101605 ?auto_101608 ) ) ( not ( = ?auto_101605 ?auto_101609 ) ) ( not ( = ?auto_101605 ?auto_101610 ) ) ( not ( = ?auto_101605 ?auto_101611 ) ) ( not ( = ?auto_101605 ?auto_101612 ) ) ( not ( = ?auto_101606 ?auto_101607 ) ) ( not ( = ?auto_101606 ?auto_101608 ) ) ( not ( = ?auto_101606 ?auto_101609 ) ) ( not ( = ?auto_101606 ?auto_101610 ) ) ( not ( = ?auto_101606 ?auto_101611 ) ) ( not ( = ?auto_101606 ?auto_101612 ) ) ( not ( = ?auto_101607 ?auto_101608 ) ) ( not ( = ?auto_101607 ?auto_101609 ) ) ( not ( = ?auto_101607 ?auto_101610 ) ) ( not ( = ?auto_101607 ?auto_101611 ) ) ( not ( = ?auto_101607 ?auto_101612 ) ) ( not ( = ?auto_101608 ?auto_101609 ) ) ( not ( = ?auto_101608 ?auto_101610 ) ) ( not ( = ?auto_101608 ?auto_101611 ) ) ( not ( = ?auto_101608 ?auto_101612 ) ) ( not ( = ?auto_101609 ?auto_101610 ) ) ( not ( = ?auto_101609 ?auto_101611 ) ) ( not ( = ?auto_101609 ?auto_101612 ) ) ( not ( = ?auto_101610 ?auto_101611 ) ) ( not ( = ?auto_101610 ?auto_101612 ) ) ( not ( = ?auto_101611 ?auto_101612 ) ) ( ON ?auto_101611 ?auto_101612 ) ( ON ?auto_101610 ?auto_101611 ) ( ON ?auto_101609 ?auto_101610 ) ( ON ?auto_101608 ?auto_101609 ) ( ON ?auto_101607 ?auto_101608 ) ( CLEAR ?auto_101605 ) ( ON ?auto_101606 ?auto_101607 ) ( CLEAR ?auto_101606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_101603 ?auto_101604 ?auto_101605 ?auto_101606 )
      ( MAKE-10PILE ?auto_101603 ?auto_101604 ?auto_101605 ?auto_101606 ?auto_101607 ?auto_101608 ?auto_101609 ?auto_101610 ?auto_101611 ?auto_101612 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101623 - BLOCK
      ?auto_101624 - BLOCK
      ?auto_101625 - BLOCK
      ?auto_101626 - BLOCK
      ?auto_101627 - BLOCK
      ?auto_101628 - BLOCK
      ?auto_101629 - BLOCK
      ?auto_101630 - BLOCK
      ?auto_101631 - BLOCK
      ?auto_101632 - BLOCK
    )
    :vars
    (
      ?auto_101633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101632 ?auto_101633 ) ( ON-TABLE ?auto_101623 ) ( ON ?auto_101624 ?auto_101623 ) ( not ( = ?auto_101623 ?auto_101624 ) ) ( not ( = ?auto_101623 ?auto_101625 ) ) ( not ( = ?auto_101623 ?auto_101626 ) ) ( not ( = ?auto_101623 ?auto_101627 ) ) ( not ( = ?auto_101623 ?auto_101628 ) ) ( not ( = ?auto_101623 ?auto_101629 ) ) ( not ( = ?auto_101623 ?auto_101630 ) ) ( not ( = ?auto_101623 ?auto_101631 ) ) ( not ( = ?auto_101623 ?auto_101632 ) ) ( not ( = ?auto_101623 ?auto_101633 ) ) ( not ( = ?auto_101624 ?auto_101625 ) ) ( not ( = ?auto_101624 ?auto_101626 ) ) ( not ( = ?auto_101624 ?auto_101627 ) ) ( not ( = ?auto_101624 ?auto_101628 ) ) ( not ( = ?auto_101624 ?auto_101629 ) ) ( not ( = ?auto_101624 ?auto_101630 ) ) ( not ( = ?auto_101624 ?auto_101631 ) ) ( not ( = ?auto_101624 ?auto_101632 ) ) ( not ( = ?auto_101624 ?auto_101633 ) ) ( not ( = ?auto_101625 ?auto_101626 ) ) ( not ( = ?auto_101625 ?auto_101627 ) ) ( not ( = ?auto_101625 ?auto_101628 ) ) ( not ( = ?auto_101625 ?auto_101629 ) ) ( not ( = ?auto_101625 ?auto_101630 ) ) ( not ( = ?auto_101625 ?auto_101631 ) ) ( not ( = ?auto_101625 ?auto_101632 ) ) ( not ( = ?auto_101625 ?auto_101633 ) ) ( not ( = ?auto_101626 ?auto_101627 ) ) ( not ( = ?auto_101626 ?auto_101628 ) ) ( not ( = ?auto_101626 ?auto_101629 ) ) ( not ( = ?auto_101626 ?auto_101630 ) ) ( not ( = ?auto_101626 ?auto_101631 ) ) ( not ( = ?auto_101626 ?auto_101632 ) ) ( not ( = ?auto_101626 ?auto_101633 ) ) ( not ( = ?auto_101627 ?auto_101628 ) ) ( not ( = ?auto_101627 ?auto_101629 ) ) ( not ( = ?auto_101627 ?auto_101630 ) ) ( not ( = ?auto_101627 ?auto_101631 ) ) ( not ( = ?auto_101627 ?auto_101632 ) ) ( not ( = ?auto_101627 ?auto_101633 ) ) ( not ( = ?auto_101628 ?auto_101629 ) ) ( not ( = ?auto_101628 ?auto_101630 ) ) ( not ( = ?auto_101628 ?auto_101631 ) ) ( not ( = ?auto_101628 ?auto_101632 ) ) ( not ( = ?auto_101628 ?auto_101633 ) ) ( not ( = ?auto_101629 ?auto_101630 ) ) ( not ( = ?auto_101629 ?auto_101631 ) ) ( not ( = ?auto_101629 ?auto_101632 ) ) ( not ( = ?auto_101629 ?auto_101633 ) ) ( not ( = ?auto_101630 ?auto_101631 ) ) ( not ( = ?auto_101630 ?auto_101632 ) ) ( not ( = ?auto_101630 ?auto_101633 ) ) ( not ( = ?auto_101631 ?auto_101632 ) ) ( not ( = ?auto_101631 ?auto_101633 ) ) ( not ( = ?auto_101632 ?auto_101633 ) ) ( ON ?auto_101631 ?auto_101632 ) ( ON ?auto_101630 ?auto_101631 ) ( ON ?auto_101629 ?auto_101630 ) ( ON ?auto_101628 ?auto_101629 ) ( ON ?auto_101627 ?auto_101628 ) ( ON ?auto_101626 ?auto_101627 ) ( CLEAR ?auto_101624 ) ( ON ?auto_101625 ?auto_101626 ) ( CLEAR ?auto_101625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101623 ?auto_101624 ?auto_101625 )
      ( MAKE-10PILE ?auto_101623 ?auto_101624 ?auto_101625 ?auto_101626 ?auto_101627 ?auto_101628 ?auto_101629 ?auto_101630 ?auto_101631 ?auto_101632 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101644 - BLOCK
      ?auto_101645 - BLOCK
      ?auto_101646 - BLOCK
      ?auto_101647 - BLOCK
      ?auto_101648 - BLOCK
      ?auto_101649 - BLOCK
      ?auto_101650 - BLOCK
      ?auto_101651 - BLOCK
      ?auto_101652 - BLOCK
      ?auto_101653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101653 ) ( ON-TABLE ?auto_101644 ) ( ON ?auto_101645 ?auto_101644 ) ( not ( = ?auto_101644 ?auto_101645 ) ) ( not ( = ?auto_101644 ?auto_101646 ) ) ( not ( = ?auto_101644 ?auto_101647 ) ) ( not ( = ?auto_101644 ?auto_101648 ) ) ( not ( = ?auto_101644 ?auto_101649 ) ) ( not ( = ?auto_101644 ?auto_101650 ) ) ( not ( = ?auto_101644 ?auto_101651 ) ) ( not ( = ?auto_101644 ?auto_101652 ) ) ( not ( = ?auto_101644 ?auto_101653 ) ) ( not ( = ?auto_101645 ?auto_101646 ) ) ( not ( = ?auto_101645 ?auto_101647 ) ) ( not ( = ?auto_101645 ?auto_101648 ) ) ( not ( = ?auto_101645 ?auto_101649 ) ) ( not ( = ?auto_101645 ?auto_101650 ) ) ( not ( = ?auto_101645 ?auto_101651 ) ) ( not ( = ?auto_101645 ?auto_101652 ) ) ( not ( = ?auto_101645 ?auto_101653 ) ) ( not ( = ?auto_101646 ?auto_101647 ) ) ( not ( = ?auto_101646 ?auto_101648 ) ) ( not ( = ?auto_101646 ?auto_101649 ) ) ( not ( = ?auto_101646 ?auto_101650 ) ) ( not ( = ?auto_101646 ?auto_101651 ) ) ( not ( = ?auto_101646 ?auto_101652 ) ) ( not ( = ?auto_101646 ?auto_101653 ) ) ( not ( = ?auto_101647 ?auto_101648 ) ) ( not ( = ?auto_101647 ?auto_101649 ) ) ( not ( = ?auto_101647 ?auto_101650 ) ) ( not ( = ?auto_101647 ?auto_101651 ) ) ( not ( = ?auto_101647 ?auto_101652 ) ) ( not ( = ?auto_101647 ?auto_101653 ) ) ( not ( = ?auto_101648 ?auto_101649 ) ) ( not ( = ?auto_101648 ?auto_101650 ) ) ( not ( = ?auto_101648 ?auto_101651 ) ) ( not ( = ?auto_101648 ?auto_101652 ) ) ( not ( = ?auto_101648 ?auto_101653 ) ) ( not ( = ?auto_101649 ?auto_101650 ) ) ( not ( = ?auto_101649 ?auto_101651 ) ) ( not ( = ?auto_101649 ?auto_101652 ) ) ( not ( = ?auto_101649 ?auto_101653 ) ) ( not ( = ?auto_101650 ?auto_101651 ) ) ( not ( = ?auto_101650 ?auto_101652 ) ) ( not ( = ?auto_101650 ?auto_101653 ) ) ( not ( = ?auto_101651 ?auto_101652 ) ) ( not ( = ?auto_101651 ?auto_101653 ) ) ( not ( = ?auto_101652 ?auto_101653 ) ) ( ON ?auto_101652 ?auto_101653 ) ( ON ?auto_101651 ?auto_101652 ) ( ON ?auto_101650 ?auto_101651 ) ( ON ?auto_101649 ?auto_101650 ) ( ON ?auto_101648 ?auto_101649 ) ( ON ?auto_101647 ?auto_101648 ) ( CLEAR ?auto_101645 ) ( ON ?auto_101646 ?auto_101647 ) ( CLEAR ?auto_101646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101644 ?auto_101645 ?auto_101646 )
      ( MAKE-10PILE ?auto_101644 ?auto_101645 ?auto_101646 ?auto_101647 ?auto_101648 ?auto_101649 ?auto_101650 ?auto_101651 ?auto_101652 ?auto_101653 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101664 - BLOCK
      ?auto_101665 - BLOCK
      ?auto_101666 - BLOCK
      ?auto_101667 - BLOCK
      ?auto_101668 - BLOCK
      ?auto_101669 - BLOCK
      ?auto_101670 - BLOCK
      ?auto_101671 - BLOCK
      ?auto_101672 - BLOCK
      ?auto_101673 - BLOCK
    )
    :vars
    (
      ?auto_101674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101673 ?auto_101674 ) ( ON-TABLE ?auto_101664 ) ( not ( = ?auto_101664 ?auto_101665 ) ) ( not ( = ?auto_101664 ?auto_101666 ) ) ( not ( = ?auto_101664 ?auto_101667 ) ) ( not ( = ?auto_101664 ?auto_101668 ) ) ( not ( = ?auto_101664 ?auto_101669 ) ) ( not ( = ?auto_101664 ?auto_101670 ) ) ( not ( = ?auto_101664 ?auto_101671 ) ) ( not ( = ?auto_101664 ?auto_101672 ) ) ( not ( = ?auto_101664 ?auto_101673 ) ) ( not ( = ?auto_101664 ?auto_101674 ) ) ( not ( = ?auto_101665 ?auto_101666 ) ) ( not ( = ?auto_101665 ?auto_101667 ) ) ( not ( = ?auto_101665 ?auto_101668 ) ) ( not ( = ?auto_101665 ?auto_101669 ) ) ( not ( = ?auto_101665 ?auto_101670 ) ) ( not ( = ?auto_101665 ?auto_101671 ) ) ( not ( = ?auto_101665 ?auto_101672 ) ) ( not ( = ?auto_101665 ?auto_101673 ) ) ( not ( = ?auto_101665 ?auto_101674 ) ) ( not ( = ?auto_101666 ?auto_101667 ) ) ( not ( = ?auto_101666 ?auto_101668 ) ) ( not ( = ?auto_101666 ?auto_101669 ) ) ( not ( = ?auto_101666 ?auto_101670 ) ) ( not ( = ?auto_101666 ?auto_101671 ) ) ( not ( = ?auto_101666 ?auto_101672 ) ) ( not ( = ?auto_101666 ?auto_101673 ) ) ( not ( = ?auto_101666 ?auto_101674 ) ) ( not ( = ?auto_101667 ?auto_101668 ) ) ( not ( = ?auto_101667 ?auto_101669 ) ) ( not ( = ?auto_101667 ?auto_101670 ) ) ( not ( = ?auto_101667 ?auto_101671 ) ) ( not ( = ?auto_101667 ?auto_101672 ) ) ( not ( = ?auto_101667 ?auto_101673 ) ) ( not ( = ?auto_101667 ?auto_101674 ) ) ( not ( = ?auto_101668 ?auto_101669 ) ) ( not ( = ?auto_101668 ?auto_101670 ) ) ( not ( = ?auto_101668 ?auto_101671 ) ) ( not ( = ?auto_101668 ?auto_101672 ) ) ( not ( = ?auto_101668 ?auto_101673 ) ) ( not ( = ?auto_101668 ?auto_101674 ) ) ( not ( = ?auto_101669 ?auto_101670 ) ) ( not ( = ?auto_101669 ?auto_101671 ) ) ( not ( = ?auto_101669 ?auto_101672 ) ) ( not ( = ?auto_101669 ?auto_101673 ) ) ( not ( = ?auto_101669 ?auto_101674 ) ) ( not ( = ?auto_101670 ?auto_101671 ) ) ( not ( = ?auto_101670 ?auto_101672 ) ) ( not ( = ?auto_101670 ?auto_101673 ) ) ( not ( = ?auto_101670 ?auto_101674 ) ) ( not ( = ?auto_101671 ?auto_101672 ) ) ( not ( = ?auto_101671 ?auto_101673 ) ) ( not ( = ?auto_101671 ?auto_101674 ) ) ( not ( = ?auto_101672 ?auto_101673 ) ) ( not ( = ?auto_101672 ?auto_101674 ) ) ( not ( = ?auto_101673 ?auto_101674 ) ) ( ON ?auto_101672 ?auto_101673 ) ( ON ?auto_101671 ?auto_101672 ) ( ON ?auto_101670 ?auto_101671 ) ( ON ?auto_101669 ?auto_101670 ) ( ON ?auto_101668 ?auto_101669 ) ( ON ?auto_101667 ?auto_101668 ) ( ON ?auto_101666 ?auto_101667 ) ( CLEAR ?auto_101664 ) ( ON ?auto_101665 ?auto_101666 ) ( CLEAR ?auto_101665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101664 ?auto_101665 )
      ( MAKE-10PILE ?auto_101664 ?auto_101665 ?auto_101666 ?auto_101667 ?auto_101668 ?auto_101669 ?auto_101670 ?auto_101671 ?auto_101672 ?auto_101673 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101685 - BLOCK
      ?auto_101686 - BLOCK
      ?auto_101687 - BLOCK
      ?auto_101688 - BLOCK
      ?auto_101689 - BLOCK
      ?auto_101690 - BLOCK
      ?auto_101691 - BLOCK
      ?auto_101692 - BLOCK
      ?auto_101693 - BLOCK
      ?auto_101694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101694 ) ( ON-TABLE ?auto_101685 ) ( not ( = ?auto_101685 ?auto_101686 ) ) ( not ( = ?auto_101685 ?auto_101687 ) ) ( not ( = ?auto_101685 ?auto_101688 ) ) ( not ( = ?auto_101685 ?auto_101689 ) ) ( not ( = ?auto_101685 ?auto_101690 ) ) ( not ( = ?auto_101685 ?auto_101691 ) ) ( not ( = ?auto_101685 ?auto_101692 ) ) ( not ( = ?auto_101685 ?auto_101693 ) ) ( not ( = ?auto_101685 ?auto_101694 ) ) ( not ( = ?auto_101686 ?auto_101687 ) ) ( not ( = ?auto_101686 ?auto_101688 ) ) ( not ( = ?auto_101686 ?auto_101689 ) ) ( not ( = ?auto_101686 ?auto_101690 ) ) ( not ( = ?auto_101686 ?auto_101691 ) ) ( not ( = ?auto_101686 ?auto_101692 ) ) ( not ( = ?auto_101686 ?auto_101693 ) ) ( not ( = ?auto_101686 ?auto_101694 ) ) ( not ( = ?auto_101687 ?auto_101688 ) ) ( not ( = ?auto_101687 ?auto_101689 ) ) ( not ( = ?auto_101687 ?auto_101690 ) ) ( not ( = ?auto_101687 ?auto_101691 ) ) ( not ( = ?auto_101687 ?auto_101692 ) ) ( not ( = ?auto_101687 ?auto_101693 ) ) ( not ( = ?auto_101687 ?auto_101694 ) ) ( not ( = ?auto_101688 ?auto_101689 ) ) ( not ( = ?auto_101688 ?auto_101690 ) ) ( not ( = ?auto_101688 ?auto_101691 ) ) ( not ( = ?auto_101688 ?auto_101692 ) ) ( not ( = ?auto_101688 ?auto_101693 ) ) ( not ( = ?auto_101688 ?auto_101694 ) ) ( not ( = ?auto_101689 ?auto_101690 ) ) ( not ( = ?auto_101689 ?auto_101691 ) ) ( not ( = ?auto_101689 ?auto_101692 ) ) ( not ( = ?auto_101689 ?auto_101693 ) ) ( not ( = ?auto_101689 ?auto_101694 ) ) ( not ( = ?auto_101690 ?auto_101691 ) ) ( not ( = ?auto_101690 ?auto_101692 ) ) ( not ( = ?auto_101690 ?auto_101693 ) ) ( not ( = ?auto_101690 ?auto_101694 ) ) ( not ( = ?auto_101691 ?auto_101692 ) ) ( not ( = ?auto_101691 ?auto_101693 ) ) ( not ( = ?auto_101691 ?auto_101694 ) ) ( not ( = ?auto_101692 ?auto_101693 ) ) ( not ( = ?auto_101692 ?auto_101694 ) ) ( not ( = ?auto_101693 ?auto_101694 ) ) ( ON ?auto_101693 ?auto_101694 ) ( ON ?auto_101692 ?auto_101693 ) ( ON ?auto_101691 ?auto_101692 ) ( ON ?auto_101690 ?auto_101691 ) ( ON ?auto_101689 ?auto_101690 ) ( ON ?auto_101688 ?auto_101689 ) ( ON ?auto_101687 ?auto_101688 ) ( CLEAR ?auto_101685 ) ( ON ?auto_101686 ?auto_101687 ) ( CLEAR ?auto_101686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101685 ?auto_101686 )
      ( MAKE-10PILE ?auto_101685 ?auto_101686 ?auto_101687 ?auto_101688 ?auto_101689 ?auto_101690 ?auto_101691 ?auto_101692 ?auto_101693 ?auto_101694 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101705 - BLOCK
      ?auto_101706 - BLOCK
      ?auto_101707 - BLOCK
      ?auto_101708 - BLOCK
      ?auto_101709 - BLOCK
      ?auto_101710 - BLOCK
      ?auto_101711 - BLOCK
      ?auto_101712 - BLOCK
      ?auto_101713 - BLOCK
      ?auto_101714 - BLOCK
    )
    :vars
    (
      ?auto_101715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101714 ?auto_101715 ) ( not ( = ?auto_101705 ?auto_101706 ) ) ( not ( = ?auto_101705 ?auto_101707 ) ) ( not ( = ?auto_101705 ?auto_101708 ) ) ( not ( = ?auto_101705 ?auto_101709 ) ) ( not ( = ?auto_101705 ?auto_101710 ) ) ( not ( = ?auto_101705 ?auto_101711 ) ) ( not ( = ?auto_101705 ?auto_101712 ) ) ( not ( = ?auto_101705 ?auto_101713 ) ) ( not ( = ?auto_101705 ?auto_101714 ) ) ( not ( = ?auto_101705 ?auto_101715 ) ) ( not ( = ?auto_101706 ?auto_101707 ) ) ( not ( = ?auto_101706 ?auto_101708 ) ) ( not ( = ?auto_101706 ?auto_101709 ) ) ( not ( = ?auto_101706 ?auto_101710 ) ) ( not ( = ?auto_101706 ?auto_101711 ) ) ( not ( = ?auto_101706 ?auto_101712 ) ) ( not ( = ?auto_101706 ?auto_101713 ) ) ( not ( = ?auto_101706 ?auto_101714 ) ) ( not ( = ?auto_101706 ?auto_101715 ) ) ( not ( = ?auto_101707 ?auto_101708 ) ) ( not ( = ?auto_101707 ?auto_101709 ) ) ( not ( = ?auto_101707 ?auto_101710 ) ) ( not ( = ?auto_101707 ?auto_101711 ) ) ( not ( = ?auto_101707 ?auto_101712 ) ) ( not ( = ?auto_101707 ?auto_101713 ) ) ( not ( = ?auto_101707 ?auto_101714 ) ) ( not ( = ?auto_101707 ?auto_101715 ) ) ( not ( = ?auto_101708 ?auto_101709 ) ) ( not ( = ?auto_101708 ?auto_101710 ) ) ( not ( = ?auto_101708 ?auto_101711 ) ) ( not ( = ?auto_101708 ?auto_101712 ) ) ( not ( = ?auto_101708 ?auto_101713 ) ) ( not ( = ?auto_101708 ?auto_101714 ) ) ( not ( = ?auto_101708 ?auto_101715 ) ) ( not ( = ?auto_101709 ?auto_101710 ) ) ( not ( = ?auto_101709 ?auto_101711 ) ) ( not ( = ?auto_101709 ?auto_101712 ) ) ( not ( = ?auto_101709 ?auto_101713 ) ) ( not ( = ?auto_101709 ?auto_101714 ) ) ( not ( = ?auto_101709 ?auto_101715 ) ) ( not ( = ?auto_101710 ?auto_101711 ) ) ( not ( = ?auto_101710 ?auto_101712 ) ) ( not ( = ?auto_101710 ?auto_101713 ) ) ( not ( = ?auto_101710 ?auto_101714 ) ) ( not ( = ?auto_101710 ?auto_101715 ) ) ( not ( = ?auto_101711 ?auto_101712 ) ) ( not ( = ?auto_101711 ?auto_101713 ) ) ( not ( = ?auto_101711 ?auto_101714 ) ) ( not ( = ?auto_101711 ?auto_101715 ) ) ( not ( = ?auto_101712 ?auto_101713 ) ) ( not ( = ?auto_101712 ?auto_101714 ) ) ( not ( = ?auto_101712 ?auto_101715 ) ) ( not ( = ?auto_101713 ?auto_101714 ) ) ( not ( = ?auto_101713 ?auto_101715 ) ) ( not ( = ?auto_101714 ?auto_101715 ) ) ( ON ?auto_101713 ?auto_101714 ) ( ON ?auto_101712 ?auto_101713 ) ( ON ?auto_101711 ?auto_101712 ) ( ON ?auto_101710 ?auto_101711 ) ( ON ?auto_101709 ?auto_101710 ) ( ON ?auto_101708 ?auto_101709 ) ( ON ?auto_101707 ?auto_101708 ) ( ON ?auto_101706 ?auto_101707 ) ( ON ?auto_101705 ?auto_101706 ) ( CLEAR ?auto_101705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101705 )
      ( MAKE-10PILE ?auto_101705 ?auto_101706 ?auto_101707 ?auto_101708 ?auto_101709 ?auto_101710 ?auto_101711 ?auto_101712 ?auto_101713 ?auto_101714 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101726 - BLOCK
      ?auto_101727 - BLOCK
      ?auto_101728 - BLOCK
      ?auto_101729 - BLOCK
      ?auto_101730 - BLOCK
      ?auto_101731 - BLOCK
      ?auto_101732 - BLOCK
      ?auto_101733 - BLOCK
      ?auto_101734 - BLOCK
      ?auto_101735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101735 ) ( not ( = ?auto_101726 ?auto_101727 ) ) ( not ( = ?auto_101726 ?auto_101728 ) ) ( not ( = ?auto_101726 ?auto_101729 ) ) ( not ( = ?auto_101726 ?auto_101730 ) ) ( not ( = ?auto_101726 ?auto_101731 ) ) ( not ( = ?auto_101726 ?auto_101732 ) ) ( not ( = ?auto_101726 ?auto_101733 ) ) ( not ( = ?auto_101726 ?auto_101734 ) ) ( not ( = ?auto_101726 ?auto_101735 ) ) ( not ( = ?auto_101727 ?auto_101728 ) ) ( not ( = ?auto_101727 ?auto_101729 ) ) ( not ( = ?auto_101727 ?auto_101730 ) ) ( not ( = ?auto_101727 ?auto_101731 ) ) ( not ( = ?auto_101727 ?auto_101732 ) ) ( not ( = ?auto_101727 ?auto_101733 ) ) ( not ( = ?auto_101727 ?auto_101734 ) ) ( not ( = ?auto_101727 ?auto_101735 ) ) ( not ( = ?auto_101728 ?auto_101729 ) ) ( not ( = ?auto_101728 ?auto_101730 ) ) ( not ( = ?auto_101728 ?auto_101731 ) ) ( not ( = ?auto_101728 ?auto_101732 ) ) ( not ( = ?auto_101728 ?auto_101733 ) ) ( not ( = ?auto_101728 ?auto_101734 ) ) ( not ( = ?auto_101728 ?auto_101735 ) ) ( not ( = ?auto_101729 ?auto_101730 ) ) ( not ( = ?auto_101729 ?auto_101731 ) ) ( not ( = ?auto_101729 ?auto_101732 ) ) ( not ( = ?auto_101729 ?auto_101733 ) ) ( not ( = ?auto_101729 ?auto_101734 ) ) ( not ( = ?auto_101729 ?auto_101735 ) ) ( not ( = ?auto_101730 ?auto_101731 ) ) ( not ( = ?auto_101730 ?auto_101732 ) ) ( not ( = ?auto_101730 ?auto_101733 ) ) ( not ( = ?auto_101730 ?auto_101734 ) ) ( not ( = ?auto_101730 ?auto_101735 ) ) ( not ( = ?auto_101731 ?auto_101732 ) ) ( not ( = ?auto_101731 ?auto_101733 ) ) ( not ( = ?auto_101731 ?auto_101734 ) ) ( not ( = ?auto_101731 ?auto_101735 ) ) ( not ( = ?auto_101732 ?auto_101733 ) ) ( not ( = ?auto_101732 ?auto_101734 ) ) ( not ( = ?auto_101732 ?auto_101735 ) ) ( not ( = ?auto_101733 ?auto_101734 ) ) ( not ( = ?auto_101733 ?auto_101735 ) ) ( not ( = ?auto_101734 ?auto_101735 ) ) ( ON ?auto_101734 ?auto_101735 ) ( ON ?auto_101733 ?auto_101734 ) ( ON ?auto_101732 ?auto_101733 ) ( ON ?auto_101731 ?auto_101732 ) ( ON ?auto_101730 ?auto_101731 ) ( ON ?auto_101729 ?auto_101730 ) ( ON ?auto_101728 ?auto_101729 ) ( ON ?auto_101727 ?auto_101728 ) ( ON ?auto_101726 ?auto_101727 ) ( CLEAR ?auto_101726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101726 )
      ( MAKE-10PILE ?auto_101726 ?auto_101727 ?auto_101728 ?auto_101729 ?auto_101730 ?auto_101731 ?auto_101732 ?auto_101733 ?auto_101734 ?auto_101735 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_101746 - BLOCK
      ?auto_101747 - BLOCK
      ?auto_101748 - BLOCK
      ?auto_101749 - BLOCK
      ?auto_101750 - BLOCK
      ?auto_101751 - BLOCK
      ?auto_101752 - BLOCK
      ?auto_101753 - BLOCK
      ?auto_101754 - BLOCK
      ?auto_101755 - BLOCK
    )
    :vars
    (
      ?auto_101756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101746 ?auto_101747 ) ) ( not ( = ?auto_101746 ?auto_101748 ) ) ( not ( = ?auto_101746 ?auto_101749 ) ) ( not ( = ?auto_101746 ?auto_101750 ) ) ( not ( = ?auto_101746 ?auto_101751 ) ) ( not ( = ?auto_101746 ?auto_101752 ) ) ( not ( = ?auto_101746 ?auto_101753 ) ) ( not ( = ?auto_101746 ?auto_101754 ) ) ( not ( = ?auto_101746 ?auto_101755 ) ) ( not ( = ?auto_101747 ?auto_101748 ) ) ( not ( = ?auto_101747 ?auto_101749 ) ) ( not ( = ?auto_101747 ?auto_101750 ) ) ( not ( = ?auto_101747 ?auto_101751 ) ) ( not ( = ?auto_101747 ?auto_101752 ) ) ( not ( = ?auto_101747 ?auto_101753 ) ) ( not ( = ?auto_101747 ?auto_101754 ) ) ( not ( = ?auto_101747 ?auto_101755 ) ) ( not ( = ?auto_101748 ?auto_101749 ) ) ( not ( = ?auto_101748 ?auto_101750 ) ) ( not ( = ?auto_101748 ?auto_101751 ) ) ( not ( = ?auto_101748 ?auto_101752 ) ) ( not ( = ?auto_101748 ?auto_101753 ) ) ( not ( = ?auto_101748 ?auto_101754 ) ) ( not ( = ?auto_101748 ?auto_101755 ) ) ( not ( = ?auto_101749 ?auto_101750 ) ) ( not ( = ?auto_101749 ?auto_101751 ) ) ( not ( = ?auto_101749 ?auto_101752 ) ) ( not ( = ?auto_101749 ?auto_101753 ) ) ( not ( = ?auto_101749 ?auto_101754 ) ) ( not ( = ?auto_101749 ?auto_101755 ) ) ( not ( = ?auto_101750 ?auto_101751 ) ) ( not ( = ?auto_101750 ?auto_101752 ) ) ( not ( = ?auto_101750 ?auto_101753 ) ) ( not ( = ?auto_101750 ?auto_101754 ) ) ( not ( = ?auto_101750 ?auto_101755 ) ) ( not ( = ?auto_101751 ?auto_101752 ) ) ( not ( = ?auto_101751 ?auto_101753 ) ) ( not ( = ?auto_101751 ?auto_101754 ) ) ( not ( = ?auto_101751 ?auto_101755 ) ) ( not ( = ?auto_101752 ?auto_101753 ) ) ( not ( = ?auto_101752 ?auto_101754 ) ) ( not ( = ?auto_101752 ?auto_101755 ) ) ( not ( = ?auto_101753 ?auto_101754 ) ) ( not ( = ?auto_101753 ?auto_101755 ) ) ( not ( = ?auto_101754 ?auto_101755 ) ) ( ON ?auto_101746 ?auto_101756 ) ( not ( = ?auto_101755 ?auto_101756 ) ) ( not ( = ?auto_101754 ?auto_101756 ) ) ( not ( = ?auto_101753 ?auto_101756 ) ) ( not ( = ?auto_101752 ?auto_101756 ) ) ( not ( = ?auto_101751 ?auto_101756 ) ) ( not ( = ?auto_101750 ?auto_101756 ) ) ( not ( = ?auto_101749 ?auto_101756 ) ) ( not ( = ?auto_101748 ?auto_101756 ) ) ( not ( = ?auto_101747 ?auto_101756 ) ) ( not ( = ?auto_101746 ?auto_101756 ) ) ( ON ?auto_101747 ?auto_101746 ) ( ON ?auto_101748 ?auto_101747 ) ( ON ?auto_101749 ?auto_101748 ) ( ON ?auto_101750 ?auto_101749 ) ( ON ?auto_101751 ?auto_101750 ) ( ON ?auto_101752 ?auto_101751 ) ( ON ?auto_101753 ?auto_101752 ) ( ON ?auto_101754 ?auto_101753 ) ( ON ?auto_101755 ?auto_101754 ) ( CLEAR ?auto_101755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_101755 ?auto_101754 ?auto_101753 ?auto_101752 ?auto_101751 ?auto_101750 ?auto_101749 ?auto_101748 ?auto_101747 ?auto_101746 )
      ( MAKE-10PILE ?auto_101746 ?auto_101747 ?auto_101748 ?auto_101749 ?auto_101750 ?auto_101751 ?auto_101752 ?auto_101753 ?auto_101754 ?auto_101755 ) )
  )

)

