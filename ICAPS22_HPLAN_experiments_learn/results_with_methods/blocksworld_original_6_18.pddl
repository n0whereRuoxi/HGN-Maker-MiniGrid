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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72108 - BLOCK
      ?auto_72109 - BLOCK
      ?auto_72110 - BLOCK
      ?auto_72111 - BLOCK
      ?auto_72112 - BLOCK
      ?auto_72113 - BLOCK
    )
    :vars
    (
      ?auto_72114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72114 ?auto_72113 ) ( CLEAR ?auto_72114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72108 ) ( ON ?auto_72109 ?auto_72108 ) ( ON ?auto_72110 ?auto_72109 ) ( ON ?auto_72111 ?auto_72110 ) ( ON ?auto_72112 ?auto_72111 ) ( ON ?auto_72113 ?auto_72112 ) ( not ( = ?auto_72108 ?auto_72109 ) ) ( not ( = ?auto_72108 ?auto_72110 ) ) ( not ( = ?auto_72108 ?auto_72111 ) ) ( not ( = ?auto_72108 ?auto_72112 ) ) ( not ( = ?auto_72108 ?auto_72113 ) ) ( not ( = ?auto_72108 ?auto_72114 ) ) ( not ( = ?auto_72109 ?auto_72110 ) ) ( not ( = ?auto_72109 ?auto_72111 ) ) ( not ( = ?auto_72109 ?auto_72112 ) ) ( not ( = ?auto_72109 ?auto_72113 ) ) ( not ( = ?auto_72109 ?auto_72114 ) ) ( not ( = ?auto_72110 ?auto_72111 ) ) ( not ( = ?auto_72110 ?auto_72112 ) ) ( not ( = ?auto_72110 ?auto_72113 ) ) ( not ( = ?auto_72110 ?auto_72114 ) ) ( not ( = ?auto_72111 ?auto_72112 ) ) ( not ( = ?auto_72111 ?auto_72113 ) ) ( not ( = ?auto_72111 ?auto_72114 ) ) ( not ( = ?auto_72112 ?auto_72113 ) ) ( not ( = ?auto_72112 ?auto_72114 ) ) ( not ( = ?auto_72113 ?auto_72114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72114 ?auto_72113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72116 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_72116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72117 - BLOCK
    )
    :vars
    (
      ?auto_72118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72117 ?auto_72118 ) ( CLEAR ?auto_72117 ) ( HAND-EMPTY ) ( not ( = ?auto_72117 ?auto_72118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72117 ?auto_72118 )
      ( MAKE-1PILE ?auto_72117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72124 - BLOCK
      ?auto_72125 - BLOCK
      ?auto_72126 - BLOCK
      ?auto_72127 - BLOCK
      ?auto_72128 - BLOCK
    )
    :vars
    (
      ?auto_72129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72129 ?auto_72128 ) ( CLEAR ?auto_72129 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72124 ) ( ON ?auto_72125 ?auto_72124 ) ( ON ?auto_72126 ?auto_72125 ) ( ON ?auto_72127 ?auto_72126 ) ( ON ?auto_72128 ?auto_72127 ) ( not ( = ?auto_72124 ?auto_72125 ) ) ( not ( = ?auto_72124 ?auto_72126 ) ) ( not ( = ?auto_72124 ?auto_72127 ) ) ( not ( = ?auto_72124 ?auto_72128 ) ) ( not ( = ?auto_72124 ?auto_72129 ) ) ( not ( = ?auto_72125 ?auto_72126 ) ) ( not ( = ?auto_72125 ?auto_72127 ) ) ( not ( = ?auto_72125 ?auto_72128 ) ) ( not ( = ?auto_72125 ?auto_72129 ) ) ( not ( = ?auto_72126 ?auto_72127 ) ) ( not ( = ?auto_72126 ?auto_72128 ) ) ( not ( = ?auto_72126 ?auto_72129 ) ) ( not ( = ?auto_72127 ?auto_72128 ) ) ( not ( = ?auto_72127 ?auto_72129 ) ) ( not ( = ?auto_72128 ?auto_72129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72129 ?auto_72128 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72130 - BLOCK
      ?auto_72131 - BLOCK
      ?auto_72132 - BLOCK
      ?auto_72133 - BLOCK
      ?auto_72134 - BLOCK
    )
    :vars
    (
      ?auto_72135 - BLOCK
      ?auto_72136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72135 ?auto_72134 ) ( CLEAR ?auto_72135 ) ( ON-TABLE ?auto_72130 ) ( ON ?auto_72131 ?auto_72130 ) ( ON ?auto_72132 ?auto_72131 ) ( ON ?auto_72133 ?auto_72132 ) ( ON ?auto_72134 ?auto_72133 ) ( not ( = ?auto_72130 ?auto_72131 ) ) ( not ( = ?auto_72130 ?auto_72132 ) ) ( not ( = ?auto_72130 ?auto_72133 ) ) ( not ( = ?auto_72130 ?auto_72134 ) ) ( not ( = ?auto_72130 ?auto_72135 ) ) ( not ( = ?auto_72131 ?auto_72132 ) ) ( not ( = ?auto_72131 ?auto_72133 ) ) ( not ( = ?auto_72131 ?auto_72134 ) ) ( not ( = ?auto_72131 ?auto_72135 ) ) ( not ( = ?auto_72132 ?auto_72133 ) ) ( not ( = ?auto_72132 ?auto_72134 ) ) ( not ( = ?auto_72132 ?auto_72135 ) ) ( not ( = ?auto_72133 ?auto_72134 ) ) ( not ( = ?auto_72133 ?auto_72135 ) ) ( not ( = ?auto_72134 ?auto_72135 ) ) ( HOLDING ?auto_72136 ) ( not ( = ?auto_72130 ?auto_72136 ) ) ( not ( = ?auto_72131 ?auto_72136 ) ) ( not ( = ?auto_72132 ?auto_72136 ) ) ( not ( = ?auto_72133 ?auto_72136 ) ) ( not ( = ?auto_72134 ?auto_72136 ) ) ( not ( = ?auto_72135 ?auto_72136 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_72136 )
      ( MAKE-5PILE ?auto_72130 ?auto_72131 ?auto_72132 ?auto_72133 ?auto_72134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72137 - BLOCK
      ?auto_72138 - BLOCK
      ?auto_72139 - BLOCK
      ?auto_72140 - BLOCK
      ?auto_72141 - BLOCK
    )
    :vars
    (
      ?auto_72143 - BLOCK
      ?auto_72142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72143 ?auto_72141 ) ( ON-TABLE ?auto_72137 ) ( ON ?auto_72138 ?auto_72137 ) ( ON ?auto_72139 ?auto_72138 ) ( ON ?auto_72140 ?auto_72139 ) ( ON ?auto_72141 ?auto_72140 ) ( not ( = ?auto_72137 ?auto_72138 ) ) ( not ( = ?auto_72137 ?auto_72139 ) ) ( not ( = ?auto_72137 ?auto_72140 ) ) ( not ( = ?auto_72137 ?auto_72141 ) ) ( not ( = ?auto_72137 ?auto_72143 ) ) ( not ( = ?auto_72138 ?auto_72139 ) ) ( not ( = ?auto_72138 ?auto_72140 ) ) ( not ( = ?auto_72138 ?auto_72141 ) ) ( not ( = ?auto_72138 ?auto_72143 ) ) ( not ( = ?auto_72139 ?auto_72140 ) ) ( not ( = ?auto_72139 ?auto_72141 ) ) ( not ( = ?auto_72139 ?auto_72143 ) ) ( not ( = ?auto_72140 ?auto_72141 ) ) ( not ( = ?auto_72140 ?auto_72143 ) ) ( not ( = ?auto_72141 ?auto_72143 ) ) ( not ( = ?auto_72137 ?auto_72142 ) ) ( not ( = ?auto_72138 ?auto_72142 ) ) ( not ( = ?auto_72139 ?auto_72142 ) ) ( not ( = ?auto_72140 ?auto_72142 ) ) ( not ( = ?auto_72141 ?auto_72142 ) ) ( not ( = ?auto_72143 ?auto_72142 ) ) ( ON ?auto_72142 ?auto_72143 ) ( CLEAR ?auto_72142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72137 ?auto_72138 ?auto_72139 ?auto_72140 ?auto_72141 ?auto_72143 )
      ( MAKE-5PILE ?auto_72137 ?auto_72138 ?auto_72139 ?auto_72140 ?auto_72141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72146 - BLOCK
      ?auto_72147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72147 ) ( CLEAR ?auto_72146 ) ( ON-TABLE ?auto_72146 ) ( not ( = ?auto_72146 ?auto_72147 ) ) )
    :subtasks
    ( ( !STACK ?auto_72147 ?auto_72146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72148 - BLOCK
      ?auto_72149 - BLOCK
    )
    :vars
    (
      ?auto_72150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72148 ) ( ON-TABLE ?auto_72148 ) ( not ( = ?auto_72148 ?auto_72149 ) ) ( ON ?auto_72149 ?auto_72150 ) ( CLEAR ?auto_72149 ) ( HAND-EMPTY ) ( not ( = ?auto_72148 ?auto_72150 ) ) ( not ( = ?auto_72149 ?auto_72150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72149 ?auto_72150 )
      ( MAKE-2PILE ?auto_72148 ?auto_72149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72151 - BLOCK
      ?auto_72152 - BLOCK
    )
    :vars
    (
      ?auto_72153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72151 ?auto_72152 ) ) ( ON ?auto_72152 ?auto_72153 ) ( CLEAR ?auto_72152 ) ( not ( = ?auto_72151 ?auto_72153 ) ) ( not ( = ?auto_72152 ?auto_72153 ) ) ( HOLDING ?auto_72151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72151 )
      ( MAKE-2PILE ?auto_72151 ?auto_72152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72154 - BLOCK
      ?auto_72155 - BLOCK
    )
    :vars
    (
      ?auto_72156 - BLOCK
      ?auto_72158 - BLOCK
      ?auto_72160 - BLOCK
      ?auto_72159 - BLOCK
      ?auto_72157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72154 ?auto_72155 ) ) ( ON ?auto_72155 ?auto_72156 ) ( not ( = ?auto_72154 ?auto_72156 ) ) ( not ( = ?auto_72155 ?auto_72156 ) ) ( ON ?auto_72154 ?auto_72155 ) ( CLEAR ?auto_72154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72158 ) ( ON ?auto_72160 ?auto_72158 ) ( ON ?auto_72159 ?auto_72160 ) ( ON ?auto_72157 ?auto_72159 ) ( ON ?auto_72156 ?auto_72157 ) ( not ( = ?auto_72158 ?auto_72160 ) ) ( not ( = ?auto_72158 ?auto_72159 ) ) ( not ( = ?auto_72158 ?auto_72157 ) ) ( not ( = ?auto_72158 ?auto_72156 ) ) ( not ( = ?auto_72158 ?auto_72155 ) ) ( not ( = ?auto_72158 ?auto_72154 ) ) ( not ( = ?auto_72160 ?auto_72159 ) ) ( not ( = ?auto_72160 ?auto_72157 ) ) ( not ( = ?auto_72160 ?auto_72156 ) ) ( not ( = ?auto_72160 ?auto_72155 ) ) ( not ( = ?auto_72160 ?auto_72154 ) ) ( not ( = ?auto_72159 ?auto_72157 ) ) ( not ( = ?auto_72159 ?auto_72156 ) ) ( not ( = ?auto_72159 ?auto_72155 ) ) ( not ( = ?auto_72159 ?auto_72154 ) ) ( not ( = ?auto_72157 ?auto_72156 ) ) ( not ( = ?auto_72157 ?auto_72155 ) ) ( not ( = ?auto_72157 ?auto_72154 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72158 ?auto_72160 ?auto_72159 ?auto_72157 ?auto_72156 ?auto_72155 )
      ( MAKE-2PILE ?auto_72154 ?auto_72155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72165 - BLOCK
      ?auto_72166 - BLOCK
      ?auto_72167 - BLOCK
      ?auto_72168 - BLOCK
    )
    :vars
    (
      ?auto_72169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72169 ?auto_72168 ) ( CLEAR ?auto_72169 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72165 ) ( ON ?auto_72166 ?auto_72165 ) ( ON ?auto_72167 ?auto_72166 ) ( ON ?auto_72168 ?auto_72167 ) ( not ( = ?auto_72165 ?auto_72166 ) ) ( not ( = ?auto_72165 ?auto_72167 ) ) ( not ( = ?auto_72165 ?auto_72168 ) ) ( not ( = ?auto_72165 ?auto_72169 ) ) ( not ( = ?auto_72166 ?auto_72167 ) ) ( not ( = ?auto_72166 ?auto_72168 ) ) ( not ( = ?auto_72166 ?auto_72169 ) ) ( not ( = ?auto_72167 ?auto_72168 ) ) ( not ( = ?auto_72167 ?auto_72169 ) ) ( not ( = ?auto_72168 ?auto_72169 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72169 ?auto_72168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72170 - BLOCK
      ?auto_72171 - BLOCK
      ?auto_72172 - BLOCK
      ?auto_72173 - BLOCK
    )
    :vars
    (
      ?auto_72174 - BLOCK
      ?auto_72175 - BLOCK
      ?auto_72176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72174 ?auto_72173 ) ( CLEAR ?auto_72174 ) ( ON-TABLE ?auto_72170 ) ( ON ?auto_72171 ?auto_72170 ) ( ON ?auto_72172 ?auto_72171 ) ( ON ?auto_72173 ?auto_72172 ) ( not ( = ?auto_72170 ?auto_72171 ) ) ( not ( = ?auto_72170 ?auto_72172 ) ) ( not ( = ?auto_72170 ?auto_72173 ) ) ( not ( = ?auto_72170 ?auto_72174 ) ) ( not ( = ?auto_72171 ?auto_72172 ) ) ( not ( = ?auto_72171 ?auto_72173 ) ) ( not ( = ?auto_72171 ?auto_72174 ) ) ( not ( = ?auto_72172 ?auto_72173 ) ) ( not ( = ?auto_72172 ?auto_72174 ) ) ( not ( = ?auto_72173 ?auto_72174 ) ) ( HOLDING ?auto_72175 ) ( CLEAR ?auto_72176 ) ( not ( = ?auto_72170 ?auto_72175 ) ) ( not ( = ?auto_72170 ?auto_72176 ) ) ( not ( = ?auto_72171 ?auto_72175 ) ) ( not ( = ?auto_72171 ?auto_72176 ) ) ( not ( = ?auto_72172 ?auto_72175 ) ) ( not ( = ?auto_72172 ?auto_72176 ) ) ( not ( = ?auto_72173 ?auto_72175 ) ) ( not ( = ?auto_72173 ?auto_72176 ) ) ( not ( = ?auto_72174 ?auto_72175 ) ) ( not ( = ?auto_72174 ?auto_72176 ) ) ( not ( = ?auto_72175 ?auto_72176 ) ) )
    :subtasks
    ( ( !STACK ?auto_72175 ?auto_72176 )
      ( MAKE-4PILE ?auto_72170 ?auto_72171 ?auto_72172 ?auto_72173 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72177 - BLOCK
      ?auto_72178 - BLOCK
      ?auto_72179 - BLOCK
      ?auto_72180 - BLOCK
    )
    :vars
    (
      ?auto_72183 - BLOCK
      ?auto_72181 - BLOCK
      ?auto_72182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72183 ?auto_72180 ) ( ON-TABLE ?auto_72177 ) ( ON ?auto_72178 ?auto_72177 ) ( ON ?auto_72179 ?auto_72178 ) ( ON ?auto_72180 ?auto_72179 ) ( not ( = ?auto_72177 ?auto_72178 ) ) ( not ( = ?auto_72177 ?auto_72179 ) ) ( not ( = ?auto_72177 ?auto_72180 ) ) ( not ( = ?auto_72177 ?auto_72183 ) ) ( not ( = ?auto_72178 ?auto_72179 ) ) ( not ( = ?auto_72178 ?auto_72180 ) ) ( not ( = ?auto_72178 ?auto_72183 ) ) ( not ( = ?auto_72179 ?auto_72180 ) ) ( not ( = ?auto_72179 ?auto_72183 ) ) ( not ( = ?auto_72180 ?auto_72183 ) ) ( CLEAR ?auto_72181 ) ( not ( = ?auto_72177 ?auto_72182 ) ) ( not ( = ?auto_72177 ?auto_72181 ) ) ( not ( = ?auto_72178 ?auto_72182 ) ) ( not ( = ?auto_72178 ?auto_72181 ) ) ( not ( = ?auto_72179 ?auto_72182 ) ) ( not ( = ?auto_72179 ?auto_72181 ) ) ( not ( = ?auto_72180 ?auto_72182 ) ) ( not ( = ?auto_72180 ?auto_72181 ) ) ( not ( = ?auto_72183 ?auto_72182 ) ) ( not ( = ?auto_72183 ?auto_72181 ) ) ( not ( = ?auto_72182 ?auto_72181 ) ) ( ON ?auto_72182 ?auto_72183 ) ( CLEAR ?auto_72182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72177 ?auto_72178 ?auto_72179 ?auto_72180 ?auto_72183 )
      ( MAKE-4PILE ?auto_72177 ?auto_72178 ?auto_72179 ?auto_72180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72184 - BLOCK
      ?auto_72185 - BLOCK
      ?auto_72186 - BLOCK
      ?auto_72187 - BLOCK
    )
    :vars
    (
      ?auto_72189 - BLOCK
      ?auto_72188 - BLOCK
      ?auto_72190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72189 ?auto_72187 ) ( ON-TABLE ?auto_72184 ) ( ON ?auto_72185 ?auto_72184 ) ( ON ?auto_72186 ?auto_72185 ) ( ON ?auto_72187 ?auto_72186 ) ( not ( = ?auto_72184 ?auto_72185 ) ) ( not ( = ?auto_72184 ?auto_72186 ) ) ( not ( = ?auto_72184 ?auto_72187 ) ) ( not ( = ?auto_72184 ?auto_72189 ) ) ( not ( = ?auto_72185 ?auto_72186 ) ) ( not ( = ?auto_72185 ?auto_72187 ) ) ( not ( = ?auto_72185 ?auto_72189 ) ) ( not ( = ?auto_72186 ?auto_72187 ) ) ( not ( = ?auto_72186 ?auto_72189 ) ) ( not ( = ?auto_72187 ?auto_72189 ) ) ( not ( = ?auto_72184 ?auto_72188 ) ) ( not ( = ?auto_72184 ?auto_72190 ) ) ( not ( = ?auto_72185 ?auto_72188 ) ) ( not ( = ?auto_72185 ?auto_72190 ) ) ( not ( = ?auto_72186 ?auto_72188 ) ) ( not ( = ?auto_72186 ?auto_72190 ) ) ( not ( = ?auto_72187 ?auto_72188 ) ) ( not ( = ?auto_72187 ?auto_72190 ) ) ( not ( = ?auto_72189 ?auto_72188 ) ) ( not ( = ?auto_72189 ?auto_72190 ) ) ( not ( = ?auto_72188 ?auto_72190 ) ) ( ON ?auto_72188 ?auto_72189 ) ( CLEAR ?auto_72188 ) ( HOLDING ?auto_72190 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72190 )
      ( MAKE-4PILE ?auto_72184 ?auto_72185 ?auto_72186 ?auto_72187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72191 - BLOCK
      ?auto_72192 - BLOCK
      ?auto_72193 - BLOCK
      ?auto_72194 - BLOCK
    )
    :vars
    (
      ?auto_72195 - BLOCK
      ?auto_72196 - BLOCK
      ?auto_72197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72195 ?auto_72194 ) ( ON-TABLE ?auto_72191 ) ( ON ?auto_72192 ?auto_72191 ) ( ON ?auto_72193 ?auto_72192 ) ( ON ?auto_72194 ?auto_72193 ) ( not ( = ?auto_72191 ?auto_72192 ) ) ( not ( = ?auto_72191 ?auto_72193 ) ) ( not ( = ?auto_72191 ?auto_72194 ) ) ( not ( = ?auto_72191 ?auto_72195 ) ) ( not ( = ?auto_72192 ?auto_72193 ) ) ( not ( = ?auto_72192 ?auto_72194 ) ) ( not ( = ?auto_72192 ?auto_72195 ) ) ( not ( = ?auto_72193 ?auto_72194 ) ) ( not ( = ?auto_72193 ?auto_72195 ) ) ( not ( = ?auto_72194 ?auto_72195 ) ) ( not ( = ?auto_72191 ?auto_72196 ) ) ( not ( = ?auto_72191 ?auto_72197 ) ) ( not ( = ?auto_72192 ?auto_72196 ) ) ( not ( = ?auto_72192 ?auto_72197 ) ) ( not ( = ?auto_72193 ?auto_72196 ) ) ( not ( = ?auto_72193 ?auto_72197 ) ) ( not ( = ?auto_72194 ?auto_72196 ) ) ( not ( = ?auto_72194 ?auto_72197 ) ) ( not ( = ?auto_72195 ?auto_72196 ) ) ( not ( = ?auto_72195 ?auto_72197 ) ) ( not ( = ?auto_72196 ?auto_72197 ) ) ( ON ?auto_72196 ?auto_72195 ) ( ON ?auto_72197 ?auto_72196 ) ( CLEAR ?auto_72197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72191 ?auto_72192 ?auto_72193 ?auto_72194 ?auto_72195 ?auto_72196 )
      ( MAKE-4PILE ?auto_72191 ?auto_72192 ?auto_72193 ?auto_72194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72201 - BLOCK
      ?auto_72202 - BLOCK
      ?auto_72203 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72203 ) ( CLEAR ?auto_72202 ) ( ON-TABLE ?auto_72201 ) ( ON ?auto_72202 ?auto_72201 ) ( not ( = ?auto_72201 ?auto_72202 ) ) ( not ( = ?auto_72201 ?auto_72203 ) ) ( not ( = ?auto_72202 ?auto_72203 ) ) )
    :subtasks
    ( ( !STACK ?auto_72203 ?auto_72202 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72204 - BLOCK
      ?auto_72205 - BLOCK
      ?auto_72206 - BLOCK
    )
    :vars
    (
      ?auto_72207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72205 ) ( ON-TABLE ?auto_72204 ) ( ON ?auto_72205 ?auto_72204 ) ( not ( = ?auto_72204 ?auto_72205 ) ) ( not ( = ?auto_72204 ?auto_72206 ) ) ( not ( = ?auto_72205 ?auto_72206 ) ) ( ON ?auto_72206 ?auto_72207 ) ( CLEAR ?auto_72206 ) ( HAND-EMPTY ) ( not ( = ?auto_72204 ?auto_72207 ) ) ( not ( = ?auto_72205 ?auto_72207 ) ) ( not ( = ?auto_72206 ?auto_72207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72206 ?auto_72207 )
      ( MAKE-3PILE ?auto_72204 ?auto_72205 ?auto_72206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72208 - BLOCK
      ?auto_72209 - BLOCK
      ?auto_72210 - BLOCK
    )
    :vars
    (
      ?auto_72211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72208 ) ( not ( = ?auto_72208 ?auto_72209 ) ) ( not ( = ?auto_72208 ?auto_72210 ) ) ( not ( = ?auto_72209 ?auto_72210 ) ) ( ON ?auto_72210 ?auto_72211 ) ( CLEAR ?auto_72210 ) ( not ( = ?auto_72208 ?auto_72211 ) ) ( not ( = ?auto_72209 ?auto_72211 ) ) ( not ( = ?auto_72210 ?auto_72211 ) ) ( HOLDING ?auto_72209 ) ( CLEAR ?auto_72208 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72208 ?auto_72209 )
      ( MAKE-3PILE ?auto_72208 ?auto_72209 ?auto_72210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72212 - BLOCK
      ?auto_72213 - BLOCK
      ?auto_72214 - BLOCK
    )
    :vars
    (
      ?auto_72215 - BLOCK
      ?auto_72218 - BLOCK
      ?auto_72217 - BLOCK
      ?auto_72216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72212 ) ( not ( = ?auto_72212 ?auto_72213 ) ) ( not ( = ?auto_72212 ?auto_72214 ) ) ( not ( = ?auto_72213 ?auto_72214 ) ) ( ON ?auto_72214 ?auto_72215 ) ( not ( = ?auto_72212 ?auto_72215 ) ) ( not ( = ?auto_72213 ?auto_72215 ) ) ( not ( = ?auto_72214 ?auto_72215 ) ) ( CLEAR ?auto_72212 ) ( ON ?auto_72213 ?auto_72214 ) ( CLEAR ?auto_72213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72218 ) ( ON ?auto_72217 ?auto_72218 ) ( ON ?auto_72216 ?auto_72217 ) ( ON ?auto_72215 ?auto_72216 ) ( not ( = ?auto_72218 ?auto_72217 ) ) ( not ( = ?auto_72218 ?auto_72216 ) ) ( not ( = ?auto_72218 ?auto_72215 ) ) ( not ( = ?auto_72218 ?auto_72214 ) ) ( not ( = ?auto_72218 ?auto_72213 ) ) ( not ( = ?auto_72217 ?auto_72216 ) ) ( not ( = ?auto_72217 ?auto_72215 ) ) ( not ( = ?auto_72217 ?auto_72214 ) ) ( not ( = ?auto_72217 ?auto_72213 ) ) ( not ( = ?auto_72216 ?auto_72215 ) ) ( not ( = ?auto_72216 ?auto_72214 ) ) ( not ( = ?auto_72216 ?auto_72213 ) ) ( not ( = ?auto_72212 ?auto_72218 ) ) ( not ( = ?auto_72212 ?auto_72217 ) ) ( not ( = ?auto_72212 ?auto_72216 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72218 ?auto_72217 ?auto_72216 ?auto_72215 ?auto_72214 )
      ( MAKE-3PILE ?auto_72212 ?auto_72213 ?auto_72214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72219 - BLOCK
      ?auto_72220 - BLOCK
      ?auto_72221 - BLOCK
    )
    :vars
    (
      ?auto_72225 - BLOCK
      ?auto_72222 - BLOCK
      ?auto_72223 - BLOCK
      ?auto_72224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72219 ?auto_72220 ) ) ( not ( = ?auto_72219 ?auto_72221 ) ) ( not ( = ?auto_72220 ?auto_72221 ) ) ( ON ?auto_72221 ?auto_72225 ) ( not ( = ?auto_72219 ?auto_72225 ) ) ( not ( = ?auto_72220 ?auto_72225 ) ) ( not ( = ?auto_72221 ?auto_72225 ) ) ( ON ?auto_72220 ?auto_72221 ) ( CLEAR ?auto_72220 ) ( ON-TABLE ?auto_72222 ) ( ON ?auto_72223 ?auto_72222 ) ( ON ?auto_72224 ?auto_72223 ) ( ON ?auto_72225 ?auto_72224 ) ( not ( = ?auto_72222 ?auto_72223 ) ) ( not ( = ?auto_72222 ?auto_72224 ) ) ( not ( = ?auto_72222 ?auto_72225 ) ) ( not ( = ?auto_72222 ?auto_72221 ) ) ( not ( = ?auto_72222 ?auto_72220 ) ) ( not ( = ?auto_72223 ?auto_72224 ) ) ( not ( = ?auto_72223 ?auto_72225 ) ) ( not ( = ?auto_72223 ?auto_72221 ) ) ( not ( = ?auto_72223 ?auto_72220 ) ) ( not ( = ?auto_72224 ?auto_72225 ) ) ( not ( = ?auto_72224 ?auto_72221 ) ) ( not ( = ?auto_72224 ?auto_72220 ) ) ( not ( = ?auto_72219 ?auto_72222 ) ) ( not ( = ?auto_72219 ?auto_72223 ) ) ( not ( = ?auto_72219 ?auto_72224 ) ) ( HOLDING ?auto_72219 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72219 )
      ( MAKE-3PILE ?auto_72219 ?auto_72220 ?auto_72221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72226 - BLOCK
      ?auto_72227 - BLOCK
      ?auto_72228 - BLOCK
    )
    :vars
    (
      ?auto_72229 - BLOCK
      ?auto_72230 - BLOCK
      ?auto_72231 - BLOCK
      ?auto_72232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72226 ?auto_72227 ) ) ( not ( = ?auto_72226 ?auto_72228 ) ) ( not ( = ?auto_72227 ?auto_72228 ) ) ( ON ?auto_72228 ?auto_72229 ) ( not ( = ?auto_72226 ?auto_72229 ) ) ( not ( = ?auto_72227 ?auto_72229 ) ) ( not ( = ?auto_72228 ?auto_72229 ) ) ( ON ?auto_72227 ?auto_72228 ) ( ON-TABLE ?auto_72230 ) ( ON ?auto_72231 ?auto_72230 ) ( ON ?auto_72232 ?auto_72231 ) ( ON ?auto_72229 ?auto_72232 ) ( not ( = ?auto_72230 ?auto_72231 ) ) ( not ( = ?auto_72230 ?auto_72232 ) ) ( not ( = ?auto_72230 ?auto_72229 ) ) ( not ( = ?auto_72230 ?auto_72228 ) ) ( not ( = ?auto_72230 ?auto_72227 ) ) ( not ( = ?auto_72231 ?auto_72232 ) ) ( not ( = ?auto_72231 ?auto_72229 ) ) ( not ( = ?auto_72231 ?auto_72228 ) ) ( not ( = ?auto_72231 ?auto_72227 ) ) ( not ( = ?auto_72232 ?auto_72229 ) ) ( not ( = ?auto_72232 ?auto_72228 ) ) ( not ( = ?auto_72232 ?auto_72227 ) ) ( not ( = ?auto_72226 ?auto_72230 ) ) ( not ( = ?auto_72226 ?auto_72231 ) ) ( not ( = ?auto_72226 ?auto_72232 ) ) ( ON ?auto_72226 ?auto_72227 ) ( CLEAR ?auto_72226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72230 ?auto_72231 ?auto_72232 ?auto_72229 ?auto_72228 ?auto_72227 )
      ( MAKE-3PILE ?auto_72226 ?auto_72227 ?auto_72228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72236 - BLOCK
      ?auto_72237 - BLOCK
      ?auto_72238 - BLOCK
    )
    :vars
    (
      ?auto_72239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72239 ?auto_72238 ) ( CLEAR ?auto_72239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72236 ) ( ON ?auto_72237 ?auto_72236 ) ( ON ?auto_72238 ?auto_72237 ) ( not ( = ?auto_72236 ?auto_72237 ) ) ( not ( = ?auto_72236 ?auto_72238 ) ) ( not ( = ?auto_72236 ?auto_72239 ) ) ( not ( = ?auto_72237 ?auto_72238 ) ) ( not ( = ?auto_72237 ?auto_72239 ) ) ( not ( = ?auto_72238 ?auto_72239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72239 ?auto_72238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72240 - BLOCK
      ?auto_72241 - BLOCK
      ?auto_72242 - BLOCK
    )
    :vars
    (
      ?auto_72243 - BLOCK
      ?auto_72244 - BLOCK
      ?auto_72245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72243 ?auto_72242 ) ( CLEAR ?auto_72243 ) ( ON-TABLE ?auto_72240 ) ( ON ?auto_72241 ?auto_72240 ) ( ON ?auto_72242 ?auto_72241 ) ( not ( = ?auto_72240 ?auto_72241 ) ) ( not ( = ?auto_72240 ?auto_72242 ) ) ( not ( = ?auto_72240 ?auto_72243 ) ) ( not ( = ?auto_72241 ?auto_72242 ) ) ( not ( = ?auto_72241 ?auto_72243 ) ) ( not ( = ?auto_72242 ?auto_72243 ) ) ( HOLDING ?auto_72244 ) ( CLEAR ?auto_72245 ) ( not ( = ?auto_72240 ?auto_72244 ) ) ( not ( = ?auto_72240 ?auto_72245 ) ) ( not ( = ?auto_72241 ?auto_72244 ) ) ( not ( = ?auto_72241 ?auto_72245 ) ) ( not ( = ?auto_72242 ?auto_72244 ) ) ( not ( = ?auto_72242 ?auto_72245 ) ) ( not ( = ?auto_72243 ?auto_72244 ) ) ( not ( = ?auto_72243 ?auto_72245 ) ) ( not ( = ?auto_72244 ?auto_72245 ) ) )
    :subtasks
    ( ( !STACK ?auto_72244 ?auto_72245 )
      ( MAKE-3PILE ?auto_72240 ?auto_72241 ?auto_72242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72246 - BLOCK
      ?auto_72247 - BLOCK
      ?auto_72248 - BLOCK
    )
    :vars
    (
      ?auto_72250 - BLOCK
      ?auto_72251 - BLOCK
      ?auto_72249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72250 ?auto_72248 ) ( ON-TABLE ?auto_72246 ) ( ON ?auto_72247 ?auto_72246 ) ( ON ?auto_72248 ?auto_72247 ) ( not ( = ?auto_72246 ?auto_72247 ) ) ( not ( = ?auto_72246 ?auto_72248 ) ) ( not ( = ?auto_72246 ?auto_72250 ) ) ( not ( = ?auto_72247 ?auto_72248 ) ) ( not ( = ?auto_72247 ?auto_72250 ) ) ( not ( = ?auto_72248 ?auto_72250 ) ) ( CLEAR ?auto_72251 ) ( not ( = ?auto_72246 ?auto_72249 ) ) ( not ( = ?auto_72246 ?auto_72251 ) ) ( not ( = ?auto_72247 ?auto_72249 ) ) ( not ( = ?auto_72247 ?auto_72251 ) ) ( not ( = ?auto_72248 ?auto_72249 ) ) ( not ( = ?auto_72248 ?auto_72251 ) ) ( not ( = ?auto_72250 ?auto_72249 ) ) ( not ( = ?auto_72250 ?auto_72251 ) ) ( not ( = ?auto_72249 ?auto_72251 ) ) ( ON ?auto_72249 ?auto_72250 ) ( CLEAR ?auto_72249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72246 ?auto_72247 ?auto_72248 ?auto_72250 )
      ( MAKE-3PILE ?auto_72246 ?auto_72247 ?auto_72248 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72252 - BLOCK
      ?auto_72253 - BLOCK
      ?auto_72254 - BLOCK
    )
    :vars
    (
      ?auto_72255 - BLOCK
      ?auto_72257 - BLOCK
      ?auto_72256 - BLOCK
      ?auto_72258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72255 ?auto_72254 ) ( ON-TABLE ?auto_72252 ) ( ON ?auto_72253 ?auto_72252 ) ( ON ?auto_72254 ?auto_72253 ) ( not ( = ?auto_72252 ?auto_72253 ) ) ( not ( = ?auto_72252 ?auto_72254 ) ) ( not ( = ?auto_72252 ?auto_72255 ) ) ( not ( = ?auto_72253 ?auto_72254 ) ) ( not ( = ?auto_72253 ?auto_72255 ) ) ( not ( = ?auto_72254 ?auto_72255 ) ) ( not ( = ?auto_72252 ?auto_72257 ) ) ( not ( = ?auto_72252 ?auto_72256 ) ) ( not ( = ?auto_72253 ?auto_72257 ) ) ( not ( = ?auto_72253 ?auto_72256 ) ) ( not ( = ?auto_72254 ?auto_72257 ) ) ( not ( = ?auto_72254 ?auto_72256 ) ) ( not ( = ?auto_72255 ?auto_72257 ) ) ( not ( = ?auto_72255 ?auto_72256 ) ) ( not ( = ?auto_72257 ?auto_72256 ) ) ( ON ?auto_72257 ?auto_72255 ) ( CLEAR ?auto_72257 ) ( HOLDING ?auto_72256 ) ( CLEAR ?auto_72258 ) ( ON-TABLE ?auto_72258 ) ( not ( = ?auto_72258 ?auto_72256 ) ) ( not ( = ?auto_72252 ?auto_72258 ) ) ( not ( = ?auto_72253 ?auto_72258 ) ) ( not ( = ?auto_72254 ?auto_72258 ) ) ( not ( = ?auto_72255 ?auto_72258 ) ) ( not ( = ?auto_72257 ?auto_72258 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72258 ?auto_72256 )
      ( MAKE-3PILE ?auto_72252 ?auto_72253 ?auto_72254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72259 - BLOCK
      ?auto_72260 - BLOCK
      ?auto_72261 - BLOCK
    )
    :vars
    (
      ?auto_72264 - BLOCK
      ?auto_72265 - BLOCK
      ?auto_72262 - BLOCK
      ?auto_72263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72264 ?auto_72261 ) ( ON-TABLE ?auto_72259 ) ( ON ?auto_72260 ?auto_72259 ) ( ON ?auto_72261 ?auto_72260 ) ( not ( = ?auto_72259 ?auto_72260 ) ) ( not ( = ?auto_72259 ?auto_72261 ) ) ( not ( = ?auto_72259 ?auto_72264 ) ) ( not ( = ?auto_72260 ?auto_72261 ) ) ( not ( = ?auto_72260 ?auto_72264 ) ) ( not ( = ?auto_72261 ?auto_72264 ) ) ( not ( = ?auto_72259 ?auto_72265 ) ) ( not ( = ?auto_72259 ?auto_72262 ) ) ( not ( = ?auto_72260 ?auto_72265 ) ) ( not ( = ?auto_72260 ?auto_72262 ) ) ( not ( = ?auto_72261 ?auto_72265 ) ) ( not ( = ?auto_72261 ?auto_72262 ) ) ( not ( = ?auto_72264 ?auto_72265 ) ) ( not ( = ?auto_72264 ?auto_72262 ) ) ( not ( = ?auto_72265 ?auto_72262 ) ) ( ON ?auto_72265 ?auto_72264 ) ( CLEAR ?auto_72263 ) ( ON-TABLE ?auto_72263 ) ( not ( = ?auto_72263 ?auto_72262 ) ) ( not ( = ?auto_72259 ?auto_72263 ) ) ( not ( = ?auto_72260 ?auto_72263 ) ) ( not ( = ?auto_72261 ?auto_72263 ) ) ( not ( = ?auto_72264 ?auto_72263 ) ) ( not ( = ?auto_72265 ?auto_72263 ) ) ( ON ?auto_72262 ?auto_72265 ) ( CLEAR ?auto_72262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72259 ?auto_72260 ?auto_72261 ?auto_72264 ?auto_72265 )
      ( MAKE-3PILE ?auto_72259 ?auto_72260 ?auto_72261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72266 - BLOCK
      ?auto_72267 - BLOCK
      ?auto_72268 - BLOCK
    )
    :vars
    (
      ?auto_72270 - BLOCK
      ?auto_72269 - BLOCK
      ?auto_72271 - BLOCK
      ?auto_72272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72270 ?auto_72268 ) ( ON-TABLE ?auto_72266 ) ( ON ?auto_72267 ?auto_72266 ) ( ON ?auto_72268 ?auto_72267 ) ( not ( = ?auto_72266 ?auto_72267 ) ) ( not ( = ?auto_72266 ?auto_72268 ) ) ( not ( = ?auto_72266 ?auto_72270 ) ) ( not ( = ?auto_72267 ?auto_72268 ) ) ( not ( = ?auto_72267 ?auto_72270 ) ) ( not ( = ?auto_72268 ?auto_72270 ) ) ( not ( = ?auto_72266 ?auto_72269 ) ) ( not ( = ?auto_72266 ?auto_72271 ) ) ( not ( = ?auto_72267 ?auto_72269 ) ) ( not ( = ?auto_72267 ?auto_72271 ) ) ( not ( = ?auto_72268 ?auto_72269 ) ) ( not ( = ?auto_72268 ?auto_72271 ) ) ( not ( = ?auto_72270 ?auto_72269 ) ) ( not ( = ?auto_72270 ?auto_72271 ) ) ( not ( = ?auto_72269 ?auto_72271 ) ) ( ON ?auto_72269 ?auto_72270 ) ( not ( = ?auto_72272 ?auto_72271 ) ) ( not ( = ?auto_72266 ?auto_72272 ) ) ( not ( = ?auto_72267 ?auto_72272 ) ) ( not ( = ?auto_72268 ?auto_72272 ) ) ( not ( = ?auto_72270 ?auto_72272 ) ) ( not ( = ?auto_72269 ?auto_72272 ) ) ( ON ?auto_72271 ?auto_72269 ) ( CLEAR ?auto_72271 ) ( HOLDING ?auto_72272 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72272 )
      ( MAKE-3PILE ?auto_72266 ?auto_72267 ?auto_72268 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72273 - BLOCK
      ?auto_72274 - BLOCK
      ?auto_72275 - BLOCK
    )
    :vars
    (
      ?auto_72276 - BLOCK
      ?auto_72278 - BLOCK
      ?auto_72277 - BLOCK
      ?auto_72279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72276 ?auto_72275 ) ( ON-TABLE ?auto_72273 ) ( ON ?auto_72274 ?auto_72273 ) ( ON ?auto_72275 ?auto_72274 ) ( not ( = ?auto_72273 ?auto_72274 ) ) ( not ( = ?auto_72273 ?auto_72275 ) ) ( not ( = ?auto_72273 ?auto_72276 ) ) ( not ( = ?auto_72274 ?auto_72275 ) ) ( not ( = ?auto_72274 ?auto_72276 ) ) ( not ( = ?auto_72275 ?auto_72276 ) ) ( not ( = ?auto_72273 ?auto_72278 ) ) ( not ( = ?auto_72273 ?auto_72277 ) ) ( not ( = ?auto_72274 ?auto_72278 ) ) ( not ( = ?auto_72274 ?auto_72277 ) ) ( not ( = ?auto_72275 ?auto_72278 ) ) ( not ( = ?auto_72275 ?auto_72277 ) ) ( not ( = ?auto_72276 ?auto_72278 ) ) ( not ( = ?auto_72276 ?auto_72277 ) ) ( not ( = ?auto_72278 ?auto_72277 ) ) ( ON ?auto_72278 ?auto_72276 ) ( not ( = ?auto_72279 ?auto_72277 ) ) ( not ( = ?auto_72273 ?auto_72279 ) ) ( not ( = ?auto_72274 ?auto_72279 ) ) ( not ( = ?auto_72275 ?auto_72279 ) ) ( not ( = ?auto_72276 ?auto_72279 ) ) ( not ( = ?auto_72278 ?auto_72279 ) ) ( ON ?auto_72277 ?auto_72278 ) ( ON ?auto_72279 ?auto_72277 ) ( CLEAR ?auto_72279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72273 ?auto_72274 ?auto_72275 ?auto_72276 ?auto_72278 ?auto_72277 )
      ( MAKE-3PILE ?auto_72273 ?auto_72274 ?auto_72275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72284 - BLOCK
      ?auto_72285 - BLOCK
      ?auto_72286 - BLOCK
      ?auto_72287 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72287 ) ( CLEAR ?auto_72286 ) ( ON-TABLE ?auto_72284 ) ( ON ?auto_72285 ?auto_72284 ) ( ON ?auto_72286 ?auto_72285 ) ( not ( = ?auto_72284 ?auto_72285 ) ) ( not ( = ?auto_72284 ?auto_72286 ) ) ( not ( = ?auto_72284 ?auto_72287 ) ) ( not ( = ?auto_72285 ?auto_72286 ) ) ( not ( = ?auto_72285 ?auto_72287 ) ) ( not ( = ?auto_72286 ?auto_72287 ) ) )
    :subtasks
    ( ( !STACK ?auto_72287 ?auto_72286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72288 - BLOCK
      ?auto_72289 - BLOCK
      ?auto_72290 - BLOCK
      ?auto_72291 - BLOCK
    )
    :vars
    (
      ?auto_72292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72290 ) ( ON-TABLE ?auto_72288 ) ( ON ?auto_72289 ?auto_72288 ) ( ON ?auto_72290 ?auto_72289 ) ( not ( = ?auto_72288 ?auto_72289 ) ) ( not ( = ?auto_72288 ?auto_72290 ) ) ( not ( = ?auto_72288 ?auto_72291 ) ) ( not ( = ?auto_72289 ?auto_72290 ) ) ( not ( = ?auto_72289 ?auto_72291 ) ) ( not ( = ?auto_72290 ?auto_72291 ) ) ( ON ?auto_72291 ?auto_72292 ) ( CLEAR ?auto_72291 ) ( HAND-EMPTY ) ( not ( = ?auto_72288 ?auto_72292 ) ) ( not ( = ?auto_72289 ?auto_72292 ) ) ( not ( = ?auto_72290 ?auto_72292 ) ) ( not ( = ?auto_72291 ?auto_72292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72291 ?auto_72292 )
      ( MAKE-4PILE ?auto_72288 ?auto_72289 ?auto_72290 ?auto_72291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72293 - BLOCK
      ?auto_72294 - BLOCK
      ?auto_72295 - BLOCK
      ?auto_72296 - BLOCK
    )
    :vars
    (
      ?auto_72297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72293 ) ( ON ?auto_72294 ?auto_72293 ) ( not ( = ?auto_72293 ?auto_72294 ) ) ( not ( = ?auto_72293 ?auto_72295 ) ) ( not ( = ?auto_72293 ?auto_72296 ) ) ( not ( = ?auto_72294 ?auto_72295 ) ) ( not ( = ?auto_72294 ?auto_72296 ) ) ( not ( = ?auto_72295 ?auto_72296 ) ) ( ON ?auto_72296 ?auto_72297 ) ( CLEAR ?auto_72296 ) ( not ( = ?auto_72293 ?auto_72297 ) ) ( not ( = ?auto_72294 ?auto_72297 ) ) ( not ( = ?auto_72295 ?auto_72297 ) ) ( not ( = ?auto_72296 ?auto_72297 ) ) ( HOLDING ?auto_72295 ) ( CLEAR ?auto_72294 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72293 ?auto_72294 ?auto_72295 )
      ( MAKE-4PILE ?auto_72293 ?auto_72294 ?auto_72295 ?auto_72296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72298 - BLOCK
      ?auto_72299 - BLOCK
      ?auto_72300 - BLOCK
      ?auto_72301 - BLOCK
    )
    :vars
    (
      ?auto_72302 - BLOCK
      ?auto_72304 - BLOCK
      ?auto_72303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72298 ) ( ON ?auto_72299 ?auto_72298 ) ( not ( = ?auto_72298 ?auto_72299 ) ) ( not ( = ?auto_72298 ?auto_72300 ) ) ( not ( = ?auto_72298 ?auto_72301 ) ) ( not ( = ?auto_72299 ?auto_72300 ) ) ( not ( = ?auto_72299 ?auto_72301 ) ) ( not ( = ?auto_72300 ?auto_72301 ) ) ( ON ?auto_72301 ?auto_72302 ) ( not ( = ?auto_72298 ?auto_72302 ) ) ( not ( = ?auto_72299 ?auto_72302 ) ) ( not ( = ?auto_72300 ?auto_72302 ) ) ( not ( = ?auto_72301 ?auto_72302 ) ) ( CLEAR ?auto_72299 ) ( ON ?auto_72300 ?auto_72301 ) ( CLEAR ?auto_72300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72304 ) ( ON ?auto_72303 ?auto_72304 ) ( ON ?auto_72302 ?auto_72303 ) ( not ( = ?auto_72304 ?auto_72303 ) ) ( not ( = ?auto_72304 ?auto_72302 ) ) ( not ( = ?auto_72304 ?auto_72301 ) ) ( not ( = ?auto_72304 ?auto_72300 ) ) ( not ( = ?auto_72303 ?auto_72302 ) ) ( not ( = ?auto_72303 ?auto_72301 ) ) ( not ( = ?auto_72303 ?auto_72300 ) ) ( not ( = ?auto_72298 ?auto_72304 ) ) ( not ( = ?auto_72298 ?auto_72303 ) ) ( not ( = ?auto_72299 ?auto_72304 ) ) ( not ( = ?auto_72299 ?auto_72303 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72304 ?auto_72303 ?auto_72302 ?auto_72301 )
      ( MAKE-4PILE ?auto_72298 ?auto_72299 ?auto_72300 ?auto_72301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72305 - BLOCK
      ?auto_72306 - BLOCK
      ?auto_72307 - BLOCK
      ?auto_72308 - BLOCK
    )
    :vars
    (
      ?auto_72311 - BLOCK
      ?auto_72310 - BLOCK
      ?auto_72309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72305 ) ( not ( = ?auto_72305 ?auto_72306 ) ) ( not ( = ?auto_72305 ?auto_72307 ) ) ( not ( = ?auto_72305 ?auto_72308 ) ) ( not ( = ?auto_72306 ?auto_72307 ) ) ( not ( = ?auto_72306 ?auto_72308 ) ) ( not ( = ?auto_72307 ?auto_72308 ) ) ( ON ?auto_72308 ?auto_72311 ) ( not ( = ?auto_72305 ?auto_72311 ) ) ( not ( = ?auto_72306 ?auto_72311 ) ) ( not ( = ?auto_72307 ?auto_72311 ) ) ( not ( = ?auto_72308 ?auto_72311 ) ) ( ON ?auto_72307 ?auto_72308 ) ( CLEAR ?auto_72307 ) ( ON-TABLE ?auto_72310 ) ( ON ?auto_72309 ?auto_72310 ) ( ON ?auto_72311 ?auto_72309 ) ( not ( = ?auto_72310 ?auto_72309 ) ) ( not ( = ?auto_72310 ?auto_72311 ) ) ( not ( = ?auto_72310 ?auto_72308 ) ) ( not ( = ?auto_72310 ?auto_72307 ) ) ( not ( = ?auto_72309 ?auto_72311 ) ) ( not ( = ?auto_72309 ?auto_72308 ) ) ( not ( = ?auto_72309 ?auto_72307 ) ) ( not ( = ?auto_72305 ?auto_72310 ) ) ( not ( = ?auto_72305 ?auto_72309 ) ) ( not ( = ?auto_72306 ?auto_72310 ) ) ( not ( = ?auto_72306 ?auto_72309 ) ) ( HOLDING ?auto_72306 ) ( CLEAR ?auto_72305 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72305 ?auto_72306 )
      ( MAKE-4PILE ?auto_72305 ?auto_72306 ?auto_72307 ?auto_72308 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72312 - BLOCK
      ?auto_72313 - BLOCK
      ?auto_72314 - BLOCK
      ?auto_72315 - BLOCK
    )
    :vars
    (
      ?auto_72316 - BLOCK
      ?auto_72317 - BLOCK
      ?auto_72318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72312 ) ( not ( = ?auto_72312 ?auto_72313 ) ) ( not ( = ?auto_72312 ?auto_72314 ) ) ( not ( = ?auto_72312 ?auto_72315 ) ) ( not ( = ?auto_72313 ?auto_72314 ) ) ( not ( = ?auto_72313 ?auto_72315 ) ) ( not ( = ?auto_72314 ?auto_72315 ) ) ( ON ?auto_72315 ?auto_72316 ) ( not ( = ?auto_72312 ?auto_72316 ) ) ( not ( = ?auto_72313 ?auto_72316 ) ) ( not ( = ?auto_72314 ?auto_72316 ) ) ( not ( = ?auto_72315 ?auto_72316 ) ) ( ON ?auto_72314 ?auto_72315 ) ( ON-TABLE ?auto_72317 ) ( ON ?auto_72318 ?auto_72317 ) ( ON ?auto_72316 ?auto_72318 ) ( not ( = ?auto_72317 ?auto_72318 ) ) ( not ( = ?auto_72317 ?auto_72316 ) ) ( not ( = ?auto_72317 ?auto_72315 ) ) ( not ( = ?auto_72317 ?auto_72314 ) ) ( not ( = ?auto_72318 ?auto_72316 ) ) ( not ( = ?auto_72318 ?auto_72315 ) ) ( not ( = ?auto_72318 ?auto_72314 ) ) ( not ( = ?auto_72312 ?auto_72317 ) ) ( not ( = ?auto_72312 ?auto_72318 ) ) ( not ( = ?auto_72313 ?auto_72317 ) ) ( not ( = ?auto_72313 ?auto_72318 ) ) ( CLEAR ?auto_72312 ) ( ON ?auto_72313 ?auto_72314 ) ( CLEAR ?auto_72313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72317 ?auto_72318 ?auto_72316 ?auto_72315 ?auto_72314 )
      ( MAKE-4PILE ?auto_72312 ?auto_72313 ?auto_72314 ?auto_72315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72319 - BLOCK
      ?auto_72320 - BLOCK
      ?auto_72321 - BLOCK
      ?auto_72322 - BLOCK
    )
    :vars
    (
      ?auto_72325 - BLOCK
      ?auto_72324 - BLOCK
      ?auto_72323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72319 ?auto_72320 ) ) ( not ( = ?auto_72319 ?auto_72321 ) ) ( not ( = ?auto_72319 ?auto_72322 ) ) ( not ( = ?auto_72320 ?auto_72321 ) ) ( not ( = ?auto_72320 ?auto_72322 ) ) ( not ( = ?auto_72321 ?auto_72322 ) ) ( ON ?auto_72322 ?auto_72325 ) ( not ( = ?auto_72319 ?auto_72325 ) ) ( not ( = ?auto_72320 ?auto_72325 ) ) ( not ( = ?auto_72321 ?auto_72325 ) ) ( not ( = ?auto_72322 ?auto_72325 ) ) ( ON ?auto_72321 ?auto_72322 ) ( ON-TABLE ?auto_72324 ) ( ON ?auto_72323 ?auto_72324 ) ( ON ?auto_72325 ?auto_72323 ) ( not ( = ?auto_72324 ?auto_72323 ) ) ( not ( = ?auto_72324 ?auto_72325 ) ) ( not ( = ?auto_72324 ?auto_72322 ) ) ( not ( = ?auto_72324 ?auto_72321 ) ) ( not ( = ?auto_72323 ?auto_72325 ) ) ( not ( = ?auto_72323 ?auto_72322 ) ) ( not ( = ?auto_72323 ?auto_72321 ) ) ( not ( = ?auto_72319 ?auto_72324 ) ) ( not ( = ?auto_72319 ?auto_72323 ) ) ( not ( = ?auto_72320 ?auto_72324 ) ) ( not ( = ?auto_72320 ?auto_72323 ) ) ( ON ?auto_72320 ?auto_72321 ) ( CLEAR ?auto_72320 ) ( HOLDING ?auto_72319 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72319 )
      ( MAKE-4PILE ?auto_72319 ?auto_72320 ?auto_72321 ?auto_72322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72326 - BLOCK
      ?auto_72327 - BLOCK
      ?auto_72328 - BLOCK
      ?auto_72329 - BLOCK
    )
    :vars
    (
      ?auto_72330 - BLOCK
      ?auto_72332 - BLOCK
      ?auto_72331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72326 ?auto_72327 ) ) ( not ( = ?auto_72326 ?auto_72328 ) ) ( not ( = ?auto_72326 ?auto_72329 ) ) ( not ( = ?auto_72327 ?auto_72328 ) ) ( not ( = ?auto_72327 ?auto_72329 ) ) ( not ( = ?auto_72328 ?auto_72329 ) ) ( ON ?auto_72329 ?auto_72330 ) ( not ( = ?auto_72326 ?auto_72330 ) ) ( not ( = ?auto_72327 ?auto_72330 ) ) ( not ( = ?auto_72328 ?auto_72330 ) ) ( not ( = ?auto_72329 ?auto_72330 ) ) ( ON ?auto_72328 ?auto_72329 ) ( ON-TABLE ?auto_72332 ) ( ON ?auto_72331 ?auto_72332 ) ( ON ?auto_72330 ?auto_72331 ) ( not ( = ?auto_72332 ?auto_72331 ) ) ( not ( = ?auto_72332 ?auto_72330 ) ) ( not ( = ?auto_72332 ?auto_72329 ) ) ( not ( = ?auto_72332 ?auto_72328 ) ) ( not ( = ?auto_72331 ?auto_72330 ) ) ( not ( = ?auto_72331 ?auto_72329 ) ) ( not ( = ?auto_72331 ?auto_72328 ) ) ( not ( = ?auto_72326 ?auto_72332 ) ) ( not ( = ?auto_72326 ?auto_72331 ) ) ( not ( = ?auto_72327 ?auto_72332 ) ) ( not ( = ?auto_72327 ?auto_72331 ) ) ( ON ?auto_72327 ?auto_72328 ) ( ON ?auto_72326 ?auto_72327 ) ( CLEAR ?auto_72326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72332 ?auto_72331 ?auto_72330 ?auto_72329 ?auto_72328 ?auto_72327 )
      ( MAKE-4PILE ?auto_72326 ?auto_72327 ?auto_72328 ?auto_72329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72335 - BLOCK
      ?auto_72336 - BLOCK
    )
    :vars
    (
      ?auto_72337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72337 ?auto_72336 ) ( CLEAR ?auto_72337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72335 ) ( ON ?auto_72336 ?auto_72335 ) ( not ( = ?auto_72335 ?auto_72336 ) ) ( not ( = ?auto_72335 ?auto_72337 ) ) ( not ( = ?auto_72336 ?auto_72337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72337 ?auto_72336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72338 - BLOCK
      ?auto_72339 - BLOCK
    )
    :vars
    (
      ?auto_72340 - BLOCK
      ?auto_72341 - BLOCK
      ?auto_72342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72340 ?auto_72339 ) ( CLEAR ?auto_72340 ) ( ON-TABLE ?auto_72338 ) ( ON ?auto_72339 ?auto_72338 ) ( not ( = ?auto_72338 ?auto_72339 ) ) ( not ( = ?auto_72338 ?auto_72340 ) ) ( not ( = ?auto_72339 ?auto_72340 ) ) ( HOLDING ?auto_72341 ) ( CLEAR ?auto_72342 ) ( not ( = ?auto_72338 ?auto_72341 ) ) ( not ( = ?auto_72338 ?auto_72342 ) ) ( not ( = ?auto_72339 ?auto_72341 ) ) ( not ( = ?auto_72339 ?auto_72342 ) ) ( not ( = ?auto_72340 ?auto_72341 ) ) ( not ( = ?auto_72340 ?auto_72342 ) ) ( not ( = ?auto_72341 ?auto_72342 ) ) )
    :subtasks
    ( ( !STACK ?auto_72341 ?auto_72342 )
      ( MAKE-2PILE ?auto_72338 ?auto_72339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72343 - BLOCK
      ?auto_72344 - BLOCK
    )
    :vars
    (
      ?auto_72345 - BLOCK
      ?auto_72347 - BLOCK
      ?auto_72346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72345 ?auto_72344 ) ( ON-TABLE ?auto_72343 ) ( ON ?auto_72344 ?auto_72343 ) ( not ( = ?auto_72343 ?auto_72344 ) ) ( not ( = ?auto_72343 ?auto_72345 ) ) ( not ( = ?auto_72344 ?auto_72345 ) ) ( CLEAR ?auto_72347 ) ( not ( = ?auto_72343 ?auto_72346 ) ) ( not ( = ?auto_72343 ?auto_72347 ) ) ( not ( = ?auto_72344 ?auto_72346 ) ) ( not ( = ?auto_72344 ?auto_72347 ) ) ( not ( = ?auto_72345 ?auto_72346 ) ) ( not ( = ?auto_72345 ?auto_72347 ) ) ( not ( = ?auto_72346 ?auto_72347 ) ) ( ON ?auto_72346 ?auto_72345 ) ( CLEAR ?auto_72346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72343 ?auto_72344 ?auto_72345 )
      ( MAKE-2PILE ?auto_72343 ?auto_72344 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72348 - BLOCK
      ?auto_72349 - BLOCK
    )
    :vars
    (
      ?auto_72350 - BLOCK
      ?auto_72352 - BLOCK
      ?auto_72351 - BLOCK
      ?auto_72354 - BLOCK
      ?auto_72353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72350 ?auto_72349 ) ( ON-TABLE ?auto_72348 ) ( ON ?auto_72349 ?auto_72348 ) ( not ( = ?auto_72348 ?auto_72349 ) ) ( not ( = ?auto_72348 ?auto_72350 ) ) ( not ( = ?auto_72349 ?auto_72350 ) ) ( not ( = ?auto_72348 ?auto_72352 ) ) ( not ( = ?auto_72348 ?auto_72351 ) ) ( not ( = ?auto_72349 ?auto_72352 ) ) ( not ( = ?auto_72349 ?auto_72351 ) ) ( not ( = ?auto_72350 ?auto_72352 ) ) ( not ( = ?auto_72350 ?auto_72351 ) ) ( not ( = ?auto_72352 ?auto_72351 ) ) ( ON ?auto_72352 ?auto_72350 ) ( CLEAR ?auto_72352 ) ( HOLDING ?auto_72351 ) ( CLEAR ?auto_72354 ) ( ON-TABLE ?auto_72353 ) ( ON ?auto_72354 ?auto_72353 ) ( not ( = ?auto_72353 ?auto_72354 ) ) ( not ( = ?auto_72353 ?auto_72351 ) ) ( not ( = ?auto_72354 ?auto_72351 ) ) ( not ( = ?auto_72348 ?auto_72354 ) ) ( not ( = ?auto_72348 ?auto_72353 ) ) ( not ( = ?auto_72349 ?auto_72354 ) ) ( not ( = ?auto_72349 ?auto_72353 ) ) ( not ( = ?auto_72350 ?auto_72354 ) ) ( not ( = ?auto_72350 ?auto_72353 ) ) ( not ( = ?auto_72352 ?auto_72354 ) ) ( not ( = ?auto_72352 ?auto_72353 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72353 ?auto_72354 ?auto_72351 )
      ( MAKE-2PILE ?auto_72348 ?auto_72349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72355 - BLOCK
      ?auto_72356 - BLOCK
    )
    :vars
    (
      ?auto_72359 - BLOCK
      ?auto_72360 - BLOCK
      ?auto_72358 - BLOCK
      ?auto_72357 - BLOCK
      ?auto_72361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72359 ?auto_72356 ) ( ON-TABLE ?auto_72355 ) ( ON ?auto_72356 ?auto_72355 ) ( not ( = ?auto_72355 ?auto_72356 ) ) ( not ( = ?auto_72355 ?auto_72359 ) ) ( not ( = ?auto_72356 ?auto_72359 ) ) ( not ( = ?auto_72355 ?auto_72360 ) ) ( not ( = ?auto_72355 ?auto_72358 ) ) ( not ( = ?auto_72356 ?auto_72360 ) ) ( not ( = ?auto_72356 ?auto_72358 ) ) ( not ( = ?auto_72359 ?auto_72360 ) ) ( not ( = ?auto_72359 ?auto_72358 ) ) ( not ( = ?auto_72360 ?auto_72358 ) ) ( ON ?auto_72360 ?auto_72359 ) ( CLEAR ?auto_72357 ) ( ON-TABLE ?auto_72361 ) ( ON ?auto_72357 ?auto_72361 ) ( not ( = ?auto_72361 ?auto_72357 ) ) ( not ( = ?auto_72361 ?auto_72358 ) ) ( not ( = ?auto_72357 ?auto_72358 ) ) ( not ( = ?auto_72355 ?auto_72357 ) ) ( not ( = ?auto_72355 ?auto_72361 ) ) ( not ( = ?auto_72356 ?auto_72357 ) ) ( not ( = ?auto_72356 ?auto_72361 ) ) ( not ( = ?auto_72359 ?auto_72357 ) ) ( not ( = ?auto_72359 ?auto_72361 ) ) ( not ( = ?auto_72360 ?auto_72357 ) ) ( not ( = ?auto_72360 ?auto_72361 ) ) ( ON ?auto_72358 ?auto_72360 ) ( CLEAR ?auto_72358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72355 ?auto_72356 ?auto_72359 ?auto_72360 )
      ( MAKE-2PILE ?auto_72355 ?auto_72356 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72362 - BLOCK
      ?auto_72363 - BLOCK
    )
    :vars
    (
      ?auto_72365 - BLOCK
      ?auto_72364 - BLOCK
      ?auto_72366 - BLOCK
      ?auto_72367 - BLOCK
      ?auto_72368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72365 ?auto_72363 ) ( ON-TABLE ?auto_72362 ) ( ON ?auto_72363 ?auto_72362 ) ( not ( = ?auto_72362 ?auto_72363 ) ) ( not ( = ?auto_72362 ?auto_72365 ) ) ( not ( = ?auto_72363 ?auto_72365 ) ) ( not ( = ?auto_72362 ?auto_72364 ) ) ( not ( = ?auto_72362 ?auto_72366 ) ) ( not ( = ?auto_72363 ?auto_72364 ) ) ( not ( = ?auto_72363 ?auto_72366 ) ) ( not ( = ?auto_72365 ?auto_72364 ) ) ( not ( = ?auto_72365 ?auto_72366 ) ) ( not ( = ?auto_72364 ?auto_72366 ) ) ( ON ?auto_72364 ?auto_72365 ) ( ON-TABLE ?auto_72367 ) ( not ( = ?auto_72367 ?auto_72368 ) ) ( not ( = ?auto_72367 ?auto_72366 ) ) ( not ( = ?auto_72368 ?auto_72366 ) ) ( not ( = ?auto_72362 ?auto_72368 ) ) ( not ( = ?auto_72362 ?auto_72367 ) ) ( not ( = ?auto_72363 ?auto_72368 ) ) ( not ( = ?auto_72363 ?auto_72367 ) ) ( not ( = ?auto_72365 ?auto_72368 ) ) ( not ( = ?auto_72365 ?auto_72367 ) ) ( not ( = ?auto_72364 ?auto_72368 ) ) ( not ( = ?auto_72364 ?auto_72367 ) ) ( ON ?auto_72366 ?auto_72364 ) ( CLEAR ?auto_72366 ) ( HOLDING ?auto_72368 ) ( CLEAR ?auto_72367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72367 ?auto_72368 )
      ( MAKE-2PILE ?auto_72362 ?auto_72363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72369 - BLOCK
      ?auto_72370 - BLOCK
    )
    :vars
    (
      ?auto_72375 - BLOCK
      ?auto_72374 - BLOCK
      ?auto_72373 - BLOCK
      ?auto_72372 - BLOCK
      ?auto_72371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72375 ?auto_72370 ) ( ON-TABLE ?auto_72369 ) ( ON ?auto_72370 ?auto_72369 ) ( not ( = ?auto_72369 ?auto_72370 ) ) ( not ( = ?auto_72369 ?auto_72375 ) ) ( not ( = ?auto_72370 ?auto_72375 ) ) ( not ( = ?auto_72369 ?auto_72374 ) ) ( not ( = ?auto_72369 ?auto_72373 ) ) ( not ( = ?auto_72370 ?auto_72374 ) ) ( not ( = ?auto_72370 ?auto_72373 ) ) ( not ( = ?auto_72375 ?auto_72374 ) ) ( not ( = ?auto_72375 ?auto_72373 ) ) ( not ( = ?auto_72374 ?auto_72373 ) ) ( ON ?auto_72374 ?auto_72375 ) ( ON-TABLE ?auto_72372 ) ( not ( = ?auto_72372 ?auto_72371 ) ) ( not ( = ?auto_72372 ?auto_72373 ) ) ( not ( = ?auto_72371 ?auto_72373 ) ) ( not ( = ?auto_72369 ?auto_72371 ) ) ( not ( = ?auto_72369 ?auto_72372 ) ) ( not ( = ?auto_72370 ?auto_72371 ) ) ( not ( = ?auto_72370 ?auto_72372 ) ) ( not ( = ?auto_72375 ?auto_72371 ) ) ( not ( = ?auto_72375 ?auto_72372 ) ) ( not ( = ?auto_72374 ?auto_72371 ) ) ( not ( = ?auto_72374 ?auto_72372 ) ) ( ON ?auto_72373 ?auto_72374 ) ( CLEAR ?auto_72372 ) ( ON ?auto_72371 ?auto_72373 ) ( CLEAR ?auto_72371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72369 ?auto_72370 ?auto_72375 ?auto_72374 ?auto_72373 )
      ( MAKE-2PILE ?auto_72369 ?auto_72370 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72376 - BLOCK
      ?auto_72377 - BLOCK
    )
    :vars
    (
      ?auto_72382 - BLOCK
      ?auto_72379 - BLOCK
      ?auto_72381 - BLOCK
      ?auto_72380 - BLOCK
      ?auto_72378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72382 ?auto_72377 ) ( ON-TABLE ?auto_72376 ) ( ON ?auto_72377 ?auto_72376 ) ( not ( = ?auto_72376 ?auto_72377 ) ) ( not ( = ?auto_72376 ?auto_72382 ) ) ( not ( = ?auto_72377 ?auto_72382 ) ) ( not ( = ?auto_72376 ?auto_72379 ) ) ( not ( = ?auto_72376 ?auto_72381 ) ) ( not ( = ?auto_72377 ?auto_72379 ) ) ( not ( = ?auto_72377 ?auto_72381 ) ) ( not ( = ?auto_72382 ?auto_72379 ) ) ( not ( = ?auto_72382 ?auto_72381 ) ) ( not ( = ?auto_72379 ?auto_72381 ) ) ( ON ?auto_72379 ?auto_72382 ) ( not ( = ?auto_72380 ?auto_72378 ) ) ( not ( = ?auto_72380 ?auto_72381 ) ) ( not ( = ?auto_72378 ?auto_72381 ) ) ( not ( = ?auto_72376 ?auto_72378 ) ) ( not ( = ?auto_72376 ?auto_72380 ) ) ( not ( = ?auto_72377 ?auto_72378 ) ) ( not ( = ?auto_72377 ?auto_72380 ) ) ( not ( = ?auto_72382 ?auto_72378 ) ) ( not ( = ?auto_72382 ?auto_72380 ) ) ( not ( = ?auto_72379 ?auto_72378 ) ) ( not ( = ?auto_72379 ?auto_72380 ) ) ( ON ?auto_72381 ?auto_72379 ) ( ON ?auto_72378 ?auto_72381 ) ( CLEAR ?auto_72378 ) ( HOLDING ?auto_72380 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72380 )
      ( MAKE-2PILE ?auto_72376 ?auto_72377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72383 - BLOCK
      ?auto_72384 - BLOCK
    )
    :vars
    (
      ?auto_72385 - BLOCK
      ?auto_72387 - BLOCK
      ?auto_72386 - BLOCK
      ?auto_72389 - BLOCK
      ?auto_72388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72385 ?auto_72384 ) ( ON-TABLE ?auto_72383 ) ( ON ?auto_72384 ?auto_72383 ) ( not ( = ?auto_72383 ?auto_72384 ) ) ( not ( = ?auto_72383 ?auto_72385 ) ) ( not ( = ?auto_72384 ?auto_72385 ) ) ( not ( = ?auto_72383 ?auto_72387 ) ) ( not ( = ?auto_72383 ?auto_72386 ) ) ( not ( = ?auto_72384 ?auto_72387 ) ) ( not ( = ?auto_72384 ?auto_72386 ) ) ( not ( = ?auto_72385 ?auto_72387 ) ) ( not ( = ?auto_72385 ?auto_72386 ) ) ( not ( = ?auto_72387 ?auto_72386 ) ) ( ON ?auto_72387 ?auto_72385 ) ( not ( = ?auto_72389 ?auto_72388 ) ) ( not ( = ?auto_72389 ?auto_72386 ) ) ( not ( = ?auto_72388 ?auto_72386 ) ) ( not ( = ?auto_72383 ?auto_72388 ) ) ( not ( = ?auto_72383 ?auto_72389 ) ) ( not ( = ?auto_72384 ?auto_72388 ) ) ( not ( = ?auto_72384 ?auto_72389 ) ) ( not ( = ?auto_72385 ?auto_72388 ) ) ( not ( = ?auto_72385 ?auto_72389 ) ) ( not ( = ?auto_72387 ?auto_72388 ) ) ( not ( = ?auto_72387 ?auto_72389 ) ) ( ON ?auto_72386 ?auto_72387 ) ( ON ?auto_72388 ?auto_72386 ) ( ON ?auto_72389 ?auto_72388 ) ( CLEAR ?auto_72389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72383 ?auto_72384 ?auto_72385 ?auto_72387 ?auto_72386 ?auto_72388 )
      ( MAKE-2PILE ?auto_72383 ?auto_72384 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72395 - BLOCK
      ?auto_72396 - BLOCK
      ?auto_72397 - BLOCK
      ?auto_72398 - BLOCK
      ?auto_72399 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72399 ) ( CLEAR ?auto_72398 ) ( ON-TABLE ?auto_72395 ) ( ON ?auto_72396 ?auto_72395 ) ( ON ?auto_72397 ?auto_72396 ) ( ON ?auto_72398 ?auto_72397 ) ( not ( = ?auto_72395 ?auto_72396 ) ) ( not ( = ?auto_72395 ?auto_72397 ) ) ( not ( = ?auto_72395 ?auto_72398 ) ) ( not ( = ?auto_72395 ?auto_72399 ) ) ( not ( = ?auto_72396 ?auto_72397 ) ) ( not ( = ?auto_72396 ?auto_72398 ) ) ( not ( = ?auto_72396 ?auto_72399 ) ) ( not ( = ?auto_72397 ?auto_72398 ) ) ( not ( = ?auto_72397 ?auto_72399 ) ) ( not ( = ?auto_72398 ?auto_72399 ) ) )
    :subtasks
    ( ( !STACK ?auto_72399 ?auto_72398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72400 - BLOCK
      ?auto_72401 - BLOCK
      ?auto_72402 - BLOCK
      ?auto_72403 - BLOCK
      ?auto_72404 - BLOCK
    )
    :vars
    (
      ?auto_72405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72403 ) ( ON-TABLE ?auto_72400 ) ( ON ?auto_72401 ?auto_72400 ) ( ON ?auto_72402 ?auto_72401 ) ( ON ?auto_72403 ?auto_72402 ) ( not ( = ?auto_72400 ?auto_72401 ) ) ( not ( = ?auto_72400 ?auto_72402 ) ) ( not ( = ?auto_72400 ?auto_72403 ) ) ( not ( = ?auto_72400 ?auto_72404 ) ) ( not ( = ?auto_72401 ?auto_72402 ) ) ( not ( = ?auto_72401 ?auto_72403 ) ) ( not ( = ?auto_72401 ?auto_72404 ) ) ( not ( = ?auto_72402 ?auto_72403 ) ) ( not ( = ?auto_72402 ?auto_72404 ) ) ( not ( = ?auto_72403 ?auto_72404 ) ) ( ON ?auto_72404 ?auto_72405 ) ( CLEAR ?auto_72404 ) ( HAND-EMPTY ) ( not ( = ?auto_72400 ?auto_72405 ) ) ( not ( = ?auto_72401 ?auto_72405 ) ) ( not ( = ?auto_72402 ?auto_72405 ) ) ( not ( = ?auto_72403 ?auto_72405 ) ) ( not ( = ?auto_72404 ?auto_72405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72404 ?auto_72405 )
      ( MAKE-5PILE ?auto_72400 ?auto_72401 ?auto_72402 ?auto_72403 ?auto_72404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72406 - BLOCK
      ?auto_72407 - BLOCK
      ?auto_72408 - BLOCK
      ?auto_72409 - BLOCK
      ?auto_72410 - BLOCK
    )
    :vars
    (
      ?auto_72411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72406 ) ( ON ?auto_72407 ?auto_72406 ) ( ON ?auto_72408 ?auto_72407 ) ( not ( = ?auto_72406 ?auto_72407 ) ) ( not ( = ?auto_72406 ?auto_72408 ) ) ( not ( = ?auto_72406 ?auto_72409 ) ) ( not ( = ?auto_72406 ?auto_72410 ) ) ( not ( = ?auto_72407 ?auto_72408 ) ) ( not ( = ?auto_72407 ?auto_72409 ) ) ( not ( = ?auto_72407 ?auto_72410 ) ) ( not ( = ?auto_72408 ?auto_72409 ) ) ( not ( = ?auto_72408 ?auto_72410 ) ) ( not ( = ?auto_72409 ?auto_72410 ) ) ( ON ?auto_72410 ?auto_72411 ) ( CLEAR ?auto_72410 ) ( not ( = ?auto_72406 ?auto_72411 ) ) ( not ( = ?auto_72407 ?auto_72411 ) ) ( not ( = ?auto_72408 ?auto_72411 ) ) ( not ( = ?auto_72409 ?auto_72411 ) ) ( not ( = ?auto_72410 ?auto_72411 ) ) ( HOLDING ?auto_72409 ) ( CLEAR ?auto_72408 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72406 ?auto_72407 ?auto_72408 ?auto_72409 )
      ( MAKE-5PILE ?auto_72406 ?auto_72407 ?auto_72408 ?auto_72409 ?auto_72410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72412 - BLOCK
      ?auto_72413 - BLOCK
      ?auto_72414 - BLOCK
      ?auto_72415 - BLOCK
      ?auto_72416 - BLOCK
    )
    :vars
    (
      ?auto_72417 - BLOCK
      ?auto_72418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72412 ) ( ON ?auto_72413 ?auto_72412 ) ( ON ?auto_72414 ?auto_72413 ) ( not ( = ?auto_72412 ?auto_72413 ) ) ( not ( = ?auto_72412 ?auto_72414 ) ) ( not ( = ?auto_72412 ?auto_72415 ) ) ( not ( = ?auto_72412 ?auto_72416 ) ) ( not ( = ?auto_72413 ?auto_72414 ) ) ( not ( = ?auto_72413 ?auto_72415 ) ) ( not ( = ?auto_72413 ?auto_72416 ) ) ( not ( = ?auto_72414 ?auto_72415 ) ) ( not ( = ?auto_72414 ?auto_72416 ) ) ( not ( = ?auto_72415 ?auto_72416 ) ) ( ON ?auto_72416 ?auto_72417 ) ( not ( = ?auto_72412 ?auto_72417 ) ) ( not ( = ?auto_72413 ?auto_72417 ) ) ( not ( = ?auto_72414 ?auto_72417 ) ) ( not ( = ?auto_72415 ?auto_72417 ) ) ( not ( = ?auto_72416 ?auto_72417 ) ) ( CLEAR ?auto_72414 ) ( ON ?auto_72415 ?auto_72416 ) ( CLEAR ?auto_72415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72418 ) ( ON ?auto_72417 ?auto_72418 ) ( not ( = ?auto_72418 ?auto_72417 ) ) ( not ( = ?auto_72418 ?auto_72416 ) ) ( not ( = ?auto_72418 ?auto_72415 ) ) ( not ( = ?auto_72412 ?auto_72418 ) ) ( not ( = ?auto_72413 ?auto_72418 ) ) ( not ( = ?auto_72414 ?auto_72418 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72418 ?auto_72417 ?auto_72416 )
      ( MAKE-5PILE ?auto_72412 ?auto_72413 ?auto_72414 ?auto_72415 ?auto_72416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72419 - BLOCK
      ?auto_72420 - BLOCK
      ?auto_72421 - BLOCK
      ?auto_72422 - BLOCK
      ?auto_72423 - BLOCK
    )
    :vars
    (
      ?auto_72425 - BLOCK
      ?auto_72424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72419 ) ( ON ?auto_72420 ?auto_72419 ) ( not ( = ?auto_72419 ?auto_72420 ) ) ( not ( = ?auto_72419 ?auto_72421 ) ) ( not ( = ?auto_72419 ?auto_72422 ) ) ( not ( = ?auto_72419 ?auto_72423 ) ) ( not ( = ?auto_72420 ?auto_72421 ) ) ( not ( = ?auto_72420 ?auto_72422 ) ) ( not ( = ?auto_72420 ?auto_72423 ) ) ( not ( = ?auto_72421 ?auto_72422 ) ) ( not ( = ?auto_72421 ?auto_72423 ) ) ( not ( = ?auto_72422 ?auto_72423 ) ) ( ON ?auto_72423 ?auto_72425 ) ( not ( = ?auto_72419 ?auto_72425 ) ) ( not ( = ?auto_72420 ?auto_72425 ) ) ( not ( = ?auto_72421 ?auto_72425 ) ) ( not ( = ?auto_72422 ?auto_72425 ) ) ( not ( = ?auto_72423 ?auto_72425 ) ) ( ON ?auto_72422 ?auto_72423 ) ( CLEAR ?auto_72422 ) ( ON-TABLE ?auto_72424 ) ( ON ?auto_72425 ?auto_72424 ) ( not ( = ?auto_72424 ?auto_72425 ) ) ( not ( = ?auto_72424 ?auto_72423 ) ) ( not ( = ?auto_72424 ?auto_72422 ) ) ( not ( = ?auto_72419 ?auto_72424 ) ) ( not ( = ?auto_72420 ?auto_72424 ) ) ( not ( = ?auto_72421 ?auto_72424 ) ) ( HOLDING ?auto_72421 ) ( CLEAR ?auto_72420 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72419 ?auto_72420 ?auto_72421 )
      ( MAKE-5PILE ?auto_72419 ?auto_72420 ?auto_72421 ?auto_72422 ?auto_72423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72426 - BLOCK
      ?auto_72427 - BLOCK
      ?auto_72428 - BLOCK
      ?auto_72429 - BLOCK
      ?auto_72430 - BLOCK
    )
    :vars
    (
      ?auto_72432 - BLOCK
      ?auto_72431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72426 ) ( ON ?auto_72427 ?auto_72426 ) ( not ( = ?auto_72426 ?auto_72427 ) ) ( not ( = ?auto_72426 ?auto_72428 ) ) ( not ( = ?auto_72426 ?auto_72429 ) ) ( not ( = ?auto_72426 ?auto_72430 ) ) ( not ( = ?auto_72427 ?auto_72428 ) ) ( not ( = ?auto_72427 ?auto_72429 ) ) ( not ( = ?auto_72427 ?auto_72430 ) ) ( not ( = ?auto_72428 ?auto_72429 ) ) ( not ( = ?auto_72428 ?auto_72430 ) ) ( not ( = ?auto_72429 ?auto_72430 ) ) ( ON ?auto_72430 ?auto_72432 ) ( not ( = ?auto_72426 ?auto_72432 ) ) ( not ( = ?auto_72427 ?auto_72432 ) ) ( not ( = ?auto_72428 ?auto_72432 ) ) ( not ( = ?auto_72429 ?auto_72432 ) ) ( not ( = ?auto_72430 ?auto_72432 ) ) ( ON ?auto_72429 ?auto_72430 ) ( ON-TABLE ?auto_72431 ) ( ON ?auto_72432 ?auto_72431 ) ( not ( = ?auto_72431 ?auto_72432 ) ) ( not ( = ?auto_72431 ?auto_72430 ) ) ( not ( = ?auto_72431 ?auto_72429 ) ) ( not ( = ?auto_72426 ?auto_72431 ) ) ( not ( = ?auto_72427 ?auto_72431 ) ) ( not ( = ?auto_72428 ?auto_72431 ) ) ( CLEAR ?auto_72427 ) ( ON ?auto_72428 ?auto_72429 ) ( CLEAR ?auto_72428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72431 ?auto_72432 ?auto_72430 ?auto_72429 )
      ( MAKE-5PILE ?auto_72426 ?auto_72427 ?auto_72428 ?auto_72429 ?auto_72430 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72433 - BLOCK
      ?auto_72434 - BLOCK
      ?auto_72435 - BLOCK
      ?auto_72436 - BLOCK
      ?auto_72437 - BLOCK
    )
    :vars
    (
      ?auto_72439 - BLOCK
      ?auto_72438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72433 ) ( not ( = ?auto_72433 ?auto_72434 ) ) ( not ( = ?auto_72433 ?auto_72435 ) ) ( not ( = ?auto_72433 ?auto_72436 ) ) ( not ( = ?auto_72433 ?auto_72437 ) ) ( not ( = ?auto_72434 ?auto_72435 ) ) ( not ( = ?auto_72434 ?auto_72436 ) ) ( not ( = ?auto_72434 ?auto_72437 ) ) ( not ( = ?auto_72435 ?auto_72436 ) ) ( not ( = ?auto_72435 ?auto_72437 ) ) ( not ( = ?auto_72436 ?auto_72437 ) ) ( ON ?auto_72437 ?auto_72439 ) ( not ( = ?auto_72433 ?auto_72439 ) ) ( not ( = ?auto_72434 ?auto_72439 ) ) ( not ( = ?auto_72435 ?auto_72439 ) ) ( not ( = ?auto_72436 ?auto_72439 ) ) ( not ( = ?auto_72437 ?auto_72439 ) ) ( ON ?auto_72436 ?auto_72437 ) ( ON-TABLE ?auto_72438 ) ( ON ?auto_72439 ?auto_72438 ) ( not ( = ?auto_72438 ?auto_72439 ) ) ( not ( = ?auto_72438 ?auto_72437 ) ) ( not ( = ?auto_72438 ?auto_72436 ) ) ( not ( = ?auto_72433 ?auto_72438 ) ) ( not ( = ?auto_72434 ?auto_72438 ) ) ( not ( = ?auto_72435 ?auto_72438 ) ) ( ON ?auto_72435 ?auto_72436 ) ( CLEAR ?auto_72435 ) ( HOLDING ?auto_72434 ) ( CLEAR ?auto_72433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72433 ?auto_72434 )
      ( MAKE-5PILE ?auto_72433 ?auto_72434 ?auto_72435 ?auto_72436 ?auto_72437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72440 - BLOCK
      ?auto_72441 - BLOCK
      ?auto_72442 - BLOCK
      ?auto_72443 - BLOCK
      ?auto_72444 - BLOCK
    )
    :vars
    (
      ?auto_72446 - BLOCK
      ?auto_72445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72440 ) ( not ( = ?auto_72440 ?auto_72441 ) ) ( not ( = ?auto_72440 ?auto_72442 ) ) ( not ( = ?auto_72440 ?auto_72443 ) ) ( not ( = ?auto_72440 ?auto_72444 ) ) ( not ( = ?auto_72441 ?auto_72442 ) ) ( not ( = ?auto_72441 ?auto_72443 ) ) ( not ( = ?auto_72441 ?auto_72444 ) ) ( not ( = ?auto_72442 ?auto_72443 ) ) ( not ( = ?auto_72442 ?auto_72444 ) ) ( not ( = ?auto_72443 ?auto_72444 ) ) ( ON ?auto_72444 ?auto_72446 ) ( not ( = ?auto_72440 ?auto_72446 ) ) ( not ( = ?auto_72441 ?auto_72446 ) ) ( not ( = ?auto_72442 ?auto_72446 ) ) ( not ( = ?auto_72443 ?auto_72446 ) ) ( not ( = ?auto_72444 ?auto_72446 ) ) ( ON ?auto_72443 ?auto_72444 ) ( ON-TABLE ?auto_72445 ) ( ON ?auto_72446 ?auto_72445 ) ( not ( = ?auto_72445 ?auto_72446 ) ) ( not ( = ?auto_72445 ?auto_72444 ) ) ( not ( = ?auto_72445 ?auto_72443 ) ) ( not ( = ?auto_72440 ?auto_72445 ) ) ( not ( = ?auto_72441 ?auto_72445 ) ) ( not ( = ?auto_72442 ?auto_72445 ) ) ( ON ?auto_72442 ?auto_72443 ) ( CLEAR ?auto_72440 ) ( ON ?auto_72441 ?auto_72442 ) ( CLEAR ?auto_72441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72445 ?auto_72446 ?auto_72444 ?auto_72443 ?auto_72442 )
      ( MAKE-5PILE ?auto_72440 ?auto_72441 ?auto_72442 ?auto_72443 ?auto_72444 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72447 - BLOCK
      ?auto_72448 - BLOCK
      ?auto_72449 - BLOCK
      ?auto_72450 - BLOCK
      ?auto_72451 - BLOCK
    )
    :vars
    (
      ?auto_72453 - BLOCK
      ?auto_72452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72447 ?auto_72448 ) ) ( not ( = ?auto_72447 ?auto_72449 ) ) ( not ( = ?auto_72447 ?auto_72450 ) ) ( not ( = ?auto_72447 ?auto_72451 ) ) ( not ( = ?auto_72448 ?auto_72449 ) ) ( not ( = ?auto_72448 ?auto_72450 ) ) ( not ( = ?auto_72448 ?auto_72451 ) ) ( not ( = ?auto_72449 ?auto_72450 ) ) ( not ( = ?auto_72449 ?auto_72451 ) ) ( not ( = ?auto_72450 ?auto_72451 ) ) ( ON ?auto_72451 ?auto_72453 ) ( not ( = ?auto_72447 ?auto_72453 ) ) ( not ( = ?auto_72448 ?auto_72453 ) ) ( not ( = ?auto_72449 ?auto_72453 ) ) ( not ( = ?auto_72450 ?auto_72453 ) ) ( not ( = ?auto_72451 ?auto_72453 ) ) ( ON ?auto_72450 ?auto_72451 ) ( ON-TABLE ?auto_72452 ) ( ON ?auto_72453 ?auto_72452 ) ( not ( = ?auto_72452 ?auto_72453 ) ) ( not ( = ?auto_72452 ?auto_72451 ) ) ( not ( = ?auto_72452 ?auto_72450 ) ) ( not ( = ?auto_72447 ?auto_72452 ) ) ( not ( = ?auto_72448 ?auto_72452 ) ) ( not ( = ?auto_72449 ?auto_72452 ) ) ( ON ?auto_72449 ?auto_72450 ) ( ON ?auto_72448 ?auto_72449 ) ( CLEAR ?auto_72448 ) ( HOLDING ?auto_72447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72447 )
      ( MAKE-5PILE ?auto_72447 ?auto_72448 ?auto_72449 ?auto_72450 ?auto_72451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72454 - BLOCK
      ?auto_72455 - BLOCK
      ?auto_72456 - BLOCK
      ?auto_72457 - BLOCK
      ?auto_72458 - BLOCK
    )
    :vars
    (
      ?auto_72460 - BLOCK
      ?auto_72459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72454 ?auto_72455 ) ) ( not ( = ?auto_72454 ?auto_72456 ) ) ( not ( = ?auto_72454 ?auto_72457 ) ) ( not ( = ?auto_72454 ?auto_72458 ) ) ( not ( = ?auto_72455 ?auto_72456 ) ) ( not ( = ?auto_72455 ?auto_72457 ) ) ( not ( = ?auto_72455 ?auto_72458 ) ) ( not ( = ?auto_72456 ?auto_72457 ) ) ( not ( = ?auto_72456 ?auto_72458 ) ) ( not ( = ?auto_72457 ?auto_72458 ) ) ( ON ?auto_72458 ?auto_72460 ) ( not ( = ?auto_72454 ?auto_72460 ) ) ( not ( = ?auto_72455 ?auto_72460 ) ) ( not ( = ?auto_72456 ?auto_72460 ) ) ( not ( = ?auto_72457 ?auto_72460 ) ) ( not ( = ?auto_72458 ?auto_72460 ) ) ( ON ?auto_72457 ?auto_72458 ) ( ON-TABLE ?auto_72459 ) ( ON ?auto_72460 ?auto_72459 ) ( not ( = ?auto_72459 ?auto_72460 ) ) ( not ( = ?auto_72459 ?auto_72458 ) ) ( not ( = ?auto_72459 ?auto_72457 ) ) ( not ( = ?auto_72454 ?auto_72459 ) ) ( not ( = ?auto_72455 ?auto_72459 ) ) ( not ( = ?auto_72456 ?auto_72459 ) ) ( ON ?auto_72456 ?auto_72457 ) ( ON ?auto_72455 ?auto_72456 ) ( ON ?auto_72454 ?auto_72455 ) ( CLEAR ?auto_72454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72459 ?auto_72460 ?auto_72458 ?auto_72457 ?auto_72456 ?auto_72455 )
      ( MAKE-5PILE ?auto_72454 ?auto_72455 ?auto_72456 ?auto_72457 ?auto_72458 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72462 - BLOCK
    )
    :vars
    (
      ?auto_72463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72463 ?auto_72462 ) ( CLEAR ?auto_72463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72462 ) ( not ( = ?auto_72462 ?auto_72463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72463 ?auto_72462 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72464 - BLOCK
    )
    :vars
    (
      ?auto_72465 - BLOCK
      ?auto_72466 - BLOCK
      ?auto_72467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72465 ?auto_72464 ) ( CLEAR ?auto_72465 ) ( ON-TABLE ?auto_72464 ) ( not ( = ?auto_72464 ?auto_72465 ) ) ( HOLDING ?auto_72466 ) ( CLEAR ?auto_72467 ) ( not ( = ?auto_72464 ?auto_72466 ) ) ( not ( = ?auto_72464 ?auto_72467 ) ) ( not ( = ?auto_72465 ?auto_72466 ) ) ( not ( = ?auto_72465 ?auto_72467 ) ) ( not ( = ?auto_72466 ?auto_72467 ) ) )
    :subtasks
    ( ( !STACK ?auto_72466 ?auto_72467 )
      ( MAKE-1PILE ?auto_72464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72468 - BLOCK
    )
    :vars
    (
      ?auto_72469 - BLOCK
      ?auto_72470 - BLOCK
      ?auto_72471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72469 ?auto_72468 ) ( ON-TABLE ?auto_72468 ) ( not ( = ?auto_72468 ?auto_72469 ) ) ( CLEAR ?auto_72470 ) ( not ( = ?auto_72468 ?auto_72471 ) ) ( not ( = ?auto_72468 ?auto_72470 ) ) ( not ( = ?auto_72469 ?auto_72471 ) ) ( not ( = ?auto_72469 ?auto_72470 ) ) ( not ( = ?auto_72471 ?auto_72470 ) ) ( ON ?auto_72471 ?auto_72469 ) ( CLEAR ?auto_72471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72468 ?auto_72469 )
      ( MAKE-1PILE ?auto_72468 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72472 - BLOCK
    )
    :vars
    (
      ?auto_72474 - BLOCK
      ?auto_72475 - BLOCK
      ?auto_72473 - BLOCK
      ?auto_72476 - BLOCK
      ?auto_72478 - BLOCK
      ?auto_72477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72474 ?auto_72472 ) ( ON-TABLE ?auto_72472 ) ( not ( = ?auto_72472 ?auto_72474 ) ) ( not ( = ?auto_72472 ?auto_72475 ) ) ( not ( = ?auto_72472 ?auto_72473 ) ) ( not ( = ?auto_72474 ?auto_72475 ) ) ( not ( = ?auto_72474 ?auto_72473 ) ) ( not ( = ?auto_72475 ?auto_72473 ) ) ( ON ?auto_72475 ?auto_72474 ) ( CLEAR ?auto_72475 ) ( HOLDING ?auto_72473 ) ( CLEAR ?auto_72476 ) ( ON-TABLE ?auto_72478 ) ( ON ?auto_72477 ?auto_72478 ) ( ON ?auto_72476 ?auto_72477 ) ( not ( = ?auto_72478 ?auto_72477 ) ) ( not ( = ?auto_72478 ?auto_72476 ) ) ( not ( = ?auto_72478 ?auto_72473 ) ) ( not ( = ?auto_72477 ?auto_72476 ) ) ( not ( = ?auto_72477 ?auto_72473 ) ) ( not ( = ?auto_72476 ?auto_72473 ) ) ( not ( = ?auto_72472 ?auto_72476 ) ) ( not ( = ?auto_72472 ?auto_72478 ) ) ( not ( = ?auto_72472 ?auto_72477 ) ) ( not ( = ?auto_72474 ?auto_72476 ) ) ( not ( = ?auto_72474 ?auto_72478 ) ) ( not ( = ?auto_72474 ?auto_72477 ) ) ( not ( = ?auto_72475 ?auto_72476 ) ) ( not ( = ?auto_72475 ?auto_72478 ) ) ( not ( = ?auto_72475 ?auto_72477 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72478 ?auto_72477 ?auto_72476 ?auto_72473 )
      ( MAKE-1PILE ?auto_72472 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72479 - BLOCK
    )
    :vars
    (
      ?auto_72480 - BLOCK
      ?auto_72483 - BLOCK
      ?auto_72482 - BLOCK
      ?auto_72485 - BLOCK
      ?auto_72481 - BLOCK
      ?auto_72484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72480 ?auto_72479 ) ( ON-TABLE ?auto_72479 ) ( not ( = ?auto_72479 ?auto_72480 ) ) ( not ( = ?auto_72479 ?auto_72483 ) ) ( not ( = ?auto_72479 ?auto_72482 ) ) ( not ( = ?auto_72480 ?auto_72483 ) ) ( not ( = ?auto_72480 ?auto_72482 ) ) ( not ( = ?auto_72483 ?auto_72482 ) ) ( ON ?auto_72483 ?auto_72480 ) ( CLEAR ?auto_72485 ) ( ON-TABLE ?auto_72481 ) ( ON ?auto_72484 ?auto_72481 ) ( ON ?auto_72485 ?auto_72484 ) ( not ( = ?auto_72481 ?auto_72484 ) ) ( not ( = ?auto_72481 ?auto_72485 ) ) ( not ( = ?auto_72481 ?auto_72482 ) ) ( not ( = ?auto_72484 ?auto_72485 ) ) ( not ( = ?auto_72484 ?auto_72482 ) ) ( not ( = ?auto_72485 ?auto_72482 ) ) ( not ( = ?auto_72479 ?auto_72485 ) ) ( not ( = ?auto_72479 ?auto_72481 ) ) ( not ( = ?auto_72479 ?auto_72484 ) ) ( not ( = ?auto_72480 ?auto_72485 ) ) ( not ( = ?auto_72480 ?auto_72481 ) ) ( not ( = ?auto_72480 ?auto_72484 ) ) ( not ( = ?auto_72483 ?auto_72485 ) ) ( not ( = ?auto_72483 ?auto_72481 ) ) ( not ( = ?auto_72483 ?auto_72484 ) ) ( ON ?auto_72482 ?auto_72483 ) ( CLEAR ?auto_72482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72479 ?auto_72480 ?auto_72483 )
      ( MAKE-1PILE ?auto_72479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72486 - BLOCK
    )
    :vars
    (
      ?auto_72492 - BLOCK
      ?auto_72489 - BLOCK
      ?auto_72490 - BLOCK
      ?auto_72488 - BLOCK
      ?auto_72487 - BLOCK
      ?auto_72491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72492 ?auto_72486 ) ( ON-TABLE ?auto_72486 ) ( not ( = ?auto_72486 ?auto_72492 ) ) ( not ( = ?auto_72486 ?auto_72489 ) ) ( not ( = ?auto_72486 ?auto_72490 ) ) ( not ( = ?auto_72492 ?auto_72489 ) ) ( not ( = ?auto_72492 ?auto_72490 ) ) ( not ( = ?auto_72489 ?auto_72490 ) ) ( ON ?auto_72489 ?auto_72492 ) ( ON-TABLE ?auto_72488 ) ( ON ?auto_72487 ?auto_72488 ) ( not ( = ?auto_72488 ?auto_72487 ) ) ( not ( = ?auto_72488 ?auto_72491 ) ) ( not ( = ?auto_72488 ?auto_72490 ) ) ( not ( = ?auto_72487 ?auto_72491 ) ) ( not ( = ?auto_72487 ?auto_72490 ) ) ( not ( = ?auto_72491 ?auto_72490 ) ) ( not ( = ?auto_72486 ?auto_72491 ) ) ( not ( = ?auto_72486 ?auto_72488 ) ) ( not ( = ?auto_72486 ?auto_72487 ) ) ( not ( = ?auto_72492 ?auto_72491 ) ) ( not ( = ?auto_72492 ?auto_72488 ) ) ( not ( = ?auto_72492 ?auto_72487 ) ) ( not ( = ?auto_72489 ?auto_72491 ) ) ( not ( = ?auto_72489 ?auto_72488 ) ) ( not ( = ?auto_72489 ?auto_72487 ) ) ( ON ?auto_72490 ?auto_72489 ) ( CLEAR ?auto_72490 ) ( HOLDING ?auto_72491 ) ( CLEAR ?auto_72487 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72488 ?auto_72487 ?auto_72491 )
      ( MAKE-1PILE ?auto_72486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72493 - BLOCK
    )
    :vars
    (
      ?auto_72495 - BLOCK
      ?auto_72499 - BLOCK
      ?auto_72498 - BLOCK
      ?auto_72494 - BLOCK
      ?auto_72497 - BLOCK
      ?auto_72496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72495 ?auto_72493 ) ( ON-TABLE ?auto_72493 ) ( not ( = ?auto_72493 ?auto_72495 ) ) ( not ( = ?auto_72493 ?auto_72499 ) ) ( not ( = ?auto_72493 ?auto_72498 ) ) ( not ( = ?auto_72495 ?auto_72499 ) ) ( not ( = ?auto_72495 ?auto_72498 ) ) ( not ( = ?auto_72499 ?auto_72498 ) ) ( ON ?auto_72499 ?auto_72495 ) ( ON-TABLE ?auto_72494 ) ( ON ?auto_72497 ?auto_72494 ) ( not ( = ?auto_72494 ?auto_72497 ) ) ( not ( = ?auto_72494 ?auto_72496 ) ) ( not ( = ?auto_72494 ?auto_72498 ) ) ( not ( = ?auto_72497 ?auto_72496 ) ) ( not ( = ?auto_72497 ?auto_72498 ) ) ( not ( = ?auto_72496 ?auto_72498 ) ) ( not ( = ?auto_72493 ?auto_72496 ) ) ( not ( = ?auto_72493 ?auto_72494 ) ) ( not ( = ?auto_72493 ?auto_72497 ) ) ( not ( = ?auto_72495 ?auto_72496 ) ) ( not ( = ?auto_72495 ?auto_72494 ) ) ( not ( = ?auto_72495 ?auto_72497 ) ) ( not ( = ?auto_72499 ?auto_72496 ) ) ( not ( = ?auto_72499 ?auto_72494 ) ) ( not ( = ?auto_72499 ?auto_72497 ) ) ( ON ?auto_72498 ?auto_72499 ) ( CLEAR ?auto_72497 ) ( ON ?auto_72496 ?auto_72498 ) ( CLEAR ?auto_72496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72493 ?auto_72495 ?auto_72499 ?auto_72498 )
      ( MAKE-1PILE ?auto_72493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72500 - BLOCK
    )
    :vars
    (
      ?auto_72502 - BLOCK
      ?auto_72504 - BLOCK
      ?auto_72506 - BLOCK
      ?auto_72505 - BLOCK
      ?auto_72503 - BLOCK
      ?auto_72501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72502 ?auto_72500 ) ( ON-TABLE ?auto_72500 ) ( not ( = ?auto_72500 ?auto_72502 ) ) ( not ( = ?auto_72500 ?auto_72504 ) ) ( not ( = ?auto_72500 ?auto_72506 ) ) ( not ( = ?auto_72502 ?auto_72504 ) ) ( not ( = ?auto_72502 ?auto_72506 ) ) ( not ( = ?auto_72504 ?auto_72506 ) ) ( ON ?auto_72504 ?auto_72502 ) ( ON-TABLE ?auto_72505 ) ( not ( = ?auto_72505 ?auto_72503 ) ) ( not ( = ?auto_72505 ?auto_72501 ) ) ( not ( = ?auto_72505 ?auto_72506 ) ) ( not ( = ?auto_72503 ?auto_72501 ) ) ( not ( = ?auto_72503 ?auto_72506 ) ) ( not ( = ?auto_72501 ?auto_72506 ) ) ( not ( = ?auto_72500 ?auto_72501 ) ) ( not ( = ?auto_72500 ?auto_72505 ) ) ( not ( = ?auto_72500 ?auto_72503 ) ) ( not ( = ?auto_72502 ?auto_72501 ) ) ( not ( = ?auto_72502 ?auto_72505 ) ) ( not ( = ?auto_72502 ?auto_72503 ) ) ( not ( = ?auto_72504 ?auto_72501 ) ) ( not ( = ?auto_72504 ?auto_72505 ) ) ( not ( = ?auto_72504 ?auto_72503 ) ) ( ON ?auto_72506 ?auto_72504 ) ( ON ?auto_72501 ?auto_72506 ) ( CLEAR ?auto_72501 ) ( HOLDING ?auto_72503 ) ( CLEAR ?auto_72505 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72505 ?auto_72503 )
      ( MAKE-1PILE ?auto_72500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72507 - BLOCK
    )
    :vars
    (
      ?auto_72508 - BLOCK
      ?auto_72510 - BLOCK
      ?auto_72511 - BLOCK
      ?auto_72509 - BLOCK
      ?auto_72512 - BLOCK
      ?auto_72513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72508 ?auto_72507 ) ( ON-TABLE ?auto_72507 ) ( not ( = ?auto_72507 ?auto_72508 ) ) ( not ( = ?auto_72507 ?auto_72510 ) ) ( not ( = ?auto_72507 ?auto_72511 ) ) ( not ( = ?auto_72508 ?auto_72510 ) ) ( not ( = ?auto_72508 ?auto_72511 ) ) ( not ( = ?auto_72510 ?auto_72511 ) ) ( ON ?auto_72510 ?auto_72508 ) ( ON-TABLE ?auto_72509 ) ( not ( = ?auto_72509 ?auto_72512 ) ) ( not ( = ?auto_72509 ?auto_72513 ) ) ( not ( = ?auto_72509 ?auto_72511 ) ) ( not ( = ?auto_72512 ?auto_72513 ) ) ( not ( = ?auto_72512 ?auto_72511 ) ) ( not ( = ?auto_72513 ?auto_72511 ) ) ( not ( = ?auto_72507 ?auto_72513 ) ) ( not ( = ?auto_72507 ?auto_72509 ) ) ( not ( = ?auto_72507 ?auto_72512 ) ) ( not ( = ?auto_72508 ?auto_72513 ) ) ( not ( = ?auto_72508 ?auto_72509 ) ) ( not ( = ?auto_72508 ?auto_72512 ) ) ( not ( = ?auto_72510 ?auto_72513 ) ) ( not ( = ?auto_72510 ?auto_72509 ) ) ( not ( = ?auto_72510 ?auto_72512 ) ) ( ON ?auto_72511 ?auto_72510 ) ( ON ?auto_72513 ?auto_72511 ) ( CLEAR ?auto_72509 ) ( ON ?auto_72512 ?auto_72513 ) ( CLEAR ?auto_72512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72507 ?auto_72508 ?auto_72510 ?auto_72511 ?auto_72513 )
      ( MAKE-1PILE ?auto_72507 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72514 - BLOCK
    )
    :vars
    (
      ?auto_72515 - BLOCK
      ?auto_72516 - BLOCK
      ?auto_72517 - BLOCK
      ?auto_72520 - BLOCK
      ?auto_72518 - BLOCK
      ?auto_72519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72515 ?auto_72514 ) ( ON-TABLE ?auto_72514 ) ( not ( = ?auto_72514 ?auto_72515 ) ) ( not ( = ?auto_72514 ?auto_72516 ) ) ( not ( = ?auto_72514 ?auto_72517 ) ) ( not ( = ?auto_72515 ?auto_72516 ) ) ( not ( = ?auto_72515 ?auto_72517 ) ) ( not ( = ?auto_72516 ?auto_72517 ) ) ( ON ?auto_72516 ?auto_72515 ) ( not ( = ?auto_72520 ?auto_72518 ) ) ( not ( = ?auto_72520 ?auto_72519 ) ) ( not ( = ?auto_72520 ?auto_72517 ) ) ( not ( = ?auto_72518 ?auto_72519 ) ) ( not ( = ?auto_72518 ?auto_72517 ) ) ( not ( = ?auto_72519 ?auto_72517 ) ) ( not ( = ?auto_72514 ?auto_72519 ) ) ( not ( = ?auto_72514 ?auto_72520 ) ) ( not ( = ?auto_72514 ?auto_72518 ) ) ( not ( = ?auto_72515 ?auto_72519 ) ) ( not ( = ?auto_72515 ?auto_72520 ) ) ( not ( = ?auto_72515 ?auto_72518 ) ) ( not ( = ?auto_72516 ?auto_72519 ) ) ( not ( = ?auto_72516 ?auto_72520 ) ) ( not ( = ?auto_72516 ?auto_72518 ) ) ( ON ?auto_72517 ?auto_72516 ) ( ON ?auto_72519 ?auto_72517 ) ( ON ?auto_72518 ?auto_72519 ) ( CLEAR ?auto_72518 ) ( HOLDING ?auto_72520 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72520 )
      ( MAKE-1PILE ?auto_72514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72521 - BLOCK
    )
    :vars
    (
      ?auto_72524 - BLOCK
      ?auto_72522 - BLOCK
      ?auto_72526 - BLOCK
      ?auto_72525 - BLOCK
      ?auto_72523 - BLOCK
      ?auto_72527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72524 ?auto_72521 ) ( ON-TABLE ?auto_72521 ) ( not ( = ?auto_72521 ?auto_72524 ) ) ( not ( = ?auto_72521 ?auto_72522 ) ) ( not ( = ?auto_72521 ?auto_72526 ) ) ( not ( = ?auto_72524 ?auto_72522 ) ) ( not ( = ?auto_72524 ?auto_72526 ) ) ( not ( = ?auto_72522 ?auto_72526 ) ) ( ON ?auto_72522 ?auto_72524 ) ( not ( = ?auto_72525 ?auto_72523 ) ) ( not ( = ?auto_72525 ?auto_72527 ) ) ( not ( = ?auto_72525 ?auto_72526 ) ) ( not ( = ?auto_72523 ?auto_72527 ) ) ( not ( = ?auto_72523 ?auto_72526 ) ) ( not ( = ?auto_72527 ?auto_72526 ) ) ( not ( = ?auto_72521 ?auto_72527 ) ) ( not ( = ?auto_72521 ?auto_72525 ) ) ( not ( = ?auto_72521 ?auto_72523 ) ) ( not ( = ?auto_72524 ?auto_72527 ) ) ( not ( = ?auto_72524 ?auto_72525 ) ) ( not ( = ?auto_72524 ?auto_72523 ) ) ( not ( = ?auto_72522 ?auto_72527 ) ) ( not ( = ?auto_72522 ?auto_72525 ) ) ( not ( = ?auto_72522 ?auto_72523 ) ) ( ON ?auto_72526 ?auto_72522 ) ( ON ?auto_72527 ?auto_72526 ) ( ON ?auto_72523 ?auto_72527 ) ( ON ?auto_72525 ?auto_72523 ) ( CLEAR ?auto_72525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72521 ?auto_72524 ?auto_72522 ?auto_72526 ?auto_72527 ?auto_72523 )
      ( MAKE-1PILE ?auto_72521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72534 - BLOCK
      ?auto_72535 - BLOCK
      ?auto_72536 - BLOCK
      ?auto_72537 - BLOCK
      ?auto_72538 - BLOCK
      ?auto_72539 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72539 ) ( CLEAR ?auto_72538 ) ( ON-TABLE ?auto_72534 ) ( ON ?auto_72535 ?auto_72534 ) ( ON ?auto_72536 ?auto_72535 ) ( ON ?auto_72537 ?auto_72536 ) ( ON ?auto_72538 ?auto_72537 ) ( not ( = ?auto_72534 ?auto_72535 ) ) ( not ( = ?auto_72534 ?auto_72536 ) ) ( not ( = ?auto_72534 ?auto_72537 ) ) ( not ( = ?auto_72534 ?auto_72538 ) ) ( not ( = ?auto_72534 ?auto_72539 ) ) ( not ( = ?auto_72535 ?auto_72536 ) ) ( not ( = ?auto_72535 ?auto_72537 ) ) ( not ( = ?auto_72535 ?auto_72538 ) ) ( not ( = ?auto_72535 ?auto_72539 ) ) ( not ( = ?auto_72536 ?auto_72537 ) ) ( not ( = ?auto_72536 ?auto_72538 ) ) ( not ( = ?auto_72536 ?auto_72539 ) ) ( not ( = ?auto_72537 ?auto_72538 ) ) ( not ( = ?auto_72537 ?auto_72539 ) ) ( not ( = ?auto_72538 ?auto_72539 ) ) )
    :subtasks
    ( ( !STACK ?auto_72539 ?auto_72538 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72540 - BLOCK
      ?auto_72541 - BLOCK
      ?auto_72542 - BLOCK
      ?auto_72543 - BLOCK
      ?auto_72544 - BLOCK
      ?auto_72545 - BLOCK
    )
    :vars
    (
      ?auto_72546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72544 ) ( ON-TABLE ?auto_72540 ) ( ON ?auto_72541 ?auto_72540 ) ( ON ?auto_72542 ?auto_72541 ) ( ON ?auto_72543 ?auto_72542 ) ( ON ?auto_72544 ?auto_72543 ) ( not ( = ?auto_72540 ?auto_72541 ) ) ( not ( = ?auto_72540 ?auto_72542 ) ) ( not ( = ?auto_72540 ?auto_72543 ) ) ( not ( = ?auto_72540 ?auto_72544 ) ) ( not ( = ?auto_72540 ?auto_72545 ) ) ( not ( = ?auto_72541 ?auto_72542 ) ) ( not ( = ?auto_72541 ?auto_72543 ) ) ( not ( = ?auto_72541 ?auto_72544 ) ) ( not ( = ?auto_72541 ?auto_72545 ) ) ( not ( = ?auto_72542 ?auto_72543 ) ) ( not ( = ?auto_72542 ?auto_72544 ) ) ( not ( = ?auto_72542 ?auto_72545 ) ) ( not ( = ?auto_72543 ?auto_72544 ) ) ( not ( = ?auto_72543 ?auto_72545 ) ) ( not ( = ?auto_72544 ?auto_72545 ) ) ( ON ?auto_72545 ?auto_72546 ) ( CLEAR ?auto_72545 ) ( HAND-EMPTY ) ( not ( = ?auto_72540 ?auto_72546 ) ) ( not ( = ?auto_72541 ?auto_72546 ) ) ( not ( = ?auto_72542 ?auto_72546 ) ) ( not ( = ?auto_72543 ?auto_72546 ) ) ( not ( = ?auto_72544 ?auto_72546 ) ) ( not ( = ?auto_72545 ?auto_72546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72545 ?auto_72546 )
      ( MAKE-6PILE ?auto_72540 ?auto_72541 ?auto_72542 ?auto_72543 ?auto_72544 ?auto_72545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72547 - BLOCK
      ?auto_72548 - BLOCK
      ?auto_72549 - BLOCK
      ?auto_72550 - BLOCK
      ?auto_72551 - BLOCK
      ?auto_72552 - BLOCK
    )
    :vars
    (
      ?auto_72553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72547 ) ( ON ?auto_72548 ?auto_72547 ) ( ON ?auto_72549 ?auto_72548 ) ( ON ?auto_72550 ?auto_72549 ) ( not ( = ?auto_72547 ?auto_72548 ) ) ( not ( = ?auto_72547 ?auto_72549 ) ) ( not ( = ?auto_72547 ?auto_72550 ) ) ( not ( = ?auto_72547 ?auto_72551 ) ) ( not ( = ?auto_72547 ?auto_72552 ) ) ( not ( = ?auto_72548 ?auto_72549 ) ) ( not ( = ?auto_72548 ?auto_72550 ) ) ( not ( = ?auto_72548 ?auto_72551 ) ) ( not ( = ?auto_72548 ?auto_72552 ) ) ( not ( = ?auto_72549 ?auto_72550 ) ) ( not ( = ?auto_72549 ?auto_72551 ) ) ( not ( = ?auto_72549 ?auto_72552 ) ) ( not ( = ?auto_72550 ?auto_72551 ) ) ( not ( = ?auto_72550 ?auto_72552 ) ) ( not ( = ?auto_72551 ?auto_72552 ) ) ( ON ?auto_72552 ?auto_72553 ) ( CLEAR ?auto_72552 ) ( not ( = ?auto_72547 ?auto_72553 ) ) ( not ( = ?auto_72548 ?auto_72553 ) ) ( not ( = ?auto_72549 ?auto_72553 ) ) ( not ( = ?auto_72550 ?auto_72553 ) ) ( not ( = ?auto_72551 ?auto_72553 ) ) ( not ( = ?auto_72552 ?auto_72553 ) ) ( HOLDING ?auto_72551 ) ( CLEAR ?auto_72550 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72547 ?auto_72548 ?auto_72549 ?auto_72550 ?auto_72551 )
      ( MAKE-6PILE ?auto_72547 ?auto_72548 ?auto_72549 ?auto_72550 ?auto_72551 ?auto_72552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72554 - BLOCK
      ?auto_72555 - BLOCK
      ?auto_72556 - BLOCK
      ?auto_72557 - BLOCK
      ?auto_72558 - BLOCK
      ?auto_72559 - BLOCK
    )
    :vars
    (
      ?auto_72560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72554 ) ( ON ?auto_72555 ?auto_72554 ) ( ON ?auto_72556 ?auto_72555 ) ( ON ?auto_72557 ?auto_72556 ) ( not ( = ?auto_72554 ?auto_72555 ) ) ( not ( = ?auto_72554 ?auto_72556 ) ) ( not ( = ?auto_72554 ?auto_72557 ) ) ( not ( = ?auto_72554 ?auto_72558 ) ) ( not ( = ?auto_72554 ?auto_72559 ) ) ( not ( = ?auto_72555 ?auto_72556 ) ) ( not ( = ?auto_72555 ?auto_72557 ) ) ( not ( = ?auto_72555 ?auto_72558 ) ) ( not ( = ?auto_72555 ?auto_72559 ) ) ( not ( = ?auto_72556 ?auto_72557 ) ) ( not ( = ?auto_72556 ?auto_72558 ) ) ( not ( = ?auto_72556 ?auto_72559 ) ) ( not ( = ?auto_72557 ?auto_72558 ) ) ( not ( = ?auto_72557 ?auto_72559 ) ) ( not ( = ?auto_72558 ?auto_72559 ) ) ( ON ?auto_72559 ?auto_72560 ) ( not ( = ?auto_72554 ?auto_72560 ) ) ( not ( = ?auto_72555 ?auto_72560 ) ) ( not ( = ?auto_72556 ?auto_72560 ) ) ( not ( = ?auto_72557 ?auto_72560 ) ) ( not ( = ?auto_72558 ?auto_72560 ) ) ( not ( = ?auto_72559 ?auto_72560 ) ) ( CLEAR ?auto_72557 ) ( ON ?auto_72558 ?auto_72559 ) ( CLEAR ?auto_72558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72560 ?auto_72559 )
      ( MAKE-6PILE ?auto_72554 ?auto_72555 ?auto_72556 ?auto_72557 ?auto_72558 ?auto_72559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72561 - BLOCK
      ?auto_72562 - BLOCK
      ?auto_72563 - BLOCK
      ?auto_72564 - BLOCK
      ?auto_72565 - BLOCK
      ?auto_72566 - BLOCK
    )
    :vars
    (
      ?auto_72567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72561 ) ( ON ?auto_72562 ?auto_72561 ) ( ON ?auto_72563 ?auto_72562 ) ( not ( = ?auto_72561 ?auto_72562 ) ) ( not ( = ?auto_72561 ?auto_72563 ) ) ( not ( = ?auto_72561 ?auto_72564 ) ) ( not ( = ?auto_72561 ?auto_72565 ) ) ( not ( = ?auto_72561 ?auto_72566 ) ) ( not ( = ?auto_72562 ?auto_72563 ) ) ( not ( = ?auto_72562 ?auto_72564 ) ) ( not ( = ?auto_72562 ?auto_72565 ) ) ( not ( = ?auto_72562 ?auto_72566 ) ) ( not ( = ?auto_72563 ?auto_72564 ) ) ( not ( = ?auto_72563 ?auto_72565 ) ) ( not ( = ?auto_72563 ?auto_72566 ) ) ( not ( = ?auto_72564 ?auto_72565 ) ) ( not ( = ?auto_72564 ?auto_72566 ) ) ( not ( = ?auto_72565 ?auto_72566 ) ) ( ON ?auto_72566 ?auto_72567 ) ( not ( = ?auto_72561 ?auto_72567 ) ) ( not ( = ?auto_72562 ?auto_72567 ) ) ( not ( = ?auto_72563 ?auto_72567 ) ) ( not ( = ?auto_72564 ?auto_72567 ) ) ( not ( = ?auto_72565 ?auto_72567 ) ) ( not ( = ?auto_72566 ?auto_72567 ) ) ( ON ?auto_72565 ?auto_72566 ) ( CLEAR ?auto_72565 ) ( ON-TABLE ?auto_72567 ) ( HOLDING ?auto_72564 ) ( CLEAR ?auto_72563 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72561 ?auto_72562 ?auto_72563 ?auto_72564 )
      ( MAKE-6PILE ?auto_72561 ?auto_72562 ?auto_72563 ?auto_72564 ?auto_72565 ?auto_72566 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72568 - BLOCK
      ?auto_72569 - BLOCK
      ?auto_72570 - BLOCK
      ?auto_72571 - BLOCK
      ?auto_72572 - BLOCK
      ?auto_72573 - BLOCK
    )
    :vars
    (
      ?auto_72574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72568 ) ( ON ?auto_72569 ?auto_72568 ) ( ON ?auto_72570 ?auto_72569 ) ( not ( = ?auto_72568 ?auto_72569 ) ) ( not ( = ?auto_72568 ?auto_72570 ) ) ( not ( = ?auto_72568 ?auto_72571 ) ) ( not ( = ?auto_72568 ?auto_72572 ) ) ( not ( = ?auto_72568 ?auto_72573 ) ) ( not ( = ?auto_72569 ?auto_72570 ) ) ( not ( = ?auto_72569 ?auto_72571 ) ) ( not ( = ?auto_72569 ?auto_72572 ) ) ( not ( = ?auto_72569 ?auto_72573 ) ) ( not ( = ?auto_72570 ?auto_72571 ) ) ( not ( = ?auto_72570 ?auto_72572 ) ) ( not ( = ?auto_72570 ?auto_72573 ) ) ( not ( = ?auto_72571 ?auto_72572 ) ) ( not ( = ?auto_72571 ?auto_72573 ) ) ( not ( = ?auto_72572 ?auto_72573 ) ) ( ON ?auto_72573 ?auto_72574 ) ( not ( = ?auto_72568 ?auto_72574 ) ) ( not ( = ?auto_72569 ?auto_72574 ) ) ( not ( = ?auto_72570 ?auto_72574 ) ) ( not ( = ?auto_72571 ?auto_72574 ) ) ( not ( = ?auto_72572 ?auto_72574 ) ) ( not ( = ?auto_72573 ?auto_72574 ) ) ( ON ?auto_72572 ?auto_72573 ) ( ON-TABLE ?auto_72574 ) ( CLEAR ?auto_72570 ) ( ON ?auto_72571 ?auto_72572 ) ( CLEAR ?auto_72571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72574 ?auto_72573 ?auto_72572 )
      ( MAKE-6PILE ?auto_72568 ?auto_72569 ?auto_72570 ?auto_72571 ?auto_72572 ?auto_72573 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72575 - BLOCK
      ?auto_72576 - BLOCK
      ?auto_72577 - BLOCK
      ?auto_72578 - BLOCK
      ?auto_72579 - BLOCK
      ?auto_72580 - BLOCK
    )
    :vars
    (
      ?auto_72581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72575 ) ( ON ?auto_72576 ?auto_72575 ) ( not ( = ?auto_72575 ?auto_72576 ) ) ( not ( = ?auto_72575 ?auto_72577 ) ) ( not ( = ?auto_72575 ?auto_72578 ) ) ( not ( = ?auto_72575 ?auto_72579 ) ) ( not ( = ?auto_72575 ?auto_72580 ) ) ( not ( = ?auto_72576 ?auto_72577 ) ) ( not ( = ?auto_72576 ?auto_72578 ) ) ( not ( = ?auto_72576 ?auto_72579 ) ) ( not ( = ?auto_72576 ?auto_72580 ) ) ( not ( = ?auto_72577 ?auto_72578 ) ) ( not ( = ?auto_72577 ?auto_72579 ) ) ( not ( = ?auto_72577 ?auto_72580 ) ) ( not ( = ?auto_72578 ?auto_72579 ) ) ( not ( = ?auto_72578 ?auto_72580 ) ) ( not ( = ?auto_72579 ?auto_72580 ) ) ( ON ?auto_72580 ?auto_72581 ) ( not ( = ?auto_72575 ?auto_72581 ) ) ( not ( = ?auto_72576 ?auto_72581 ) ) ( not ( = ?auto_72577 ?auto_72581 ) ) ( not ( = ?auto_72578 ?auto_72581 ) ) ( not ( = ?auto_72579 ?auto_72581 ) ) ( not ( = ?auto_72580 ?auto_72581 ) ) ( ON ?auto_72579 ?auto_72580 ) ( ON-TABLE ?auto_72581 ) ( ON ?auto_72578 ?auto_72579 ) ( CLEAR ?auto_72578 ) ( HOLDING ?auto_72577 ) ( CLEAR ?auto_72576 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72575 ?auto_72576 ?auto_72577 )
      ( MAKE-6PILE ?auto_72575 ?auto_72576 ?auto_72577 ?auto_72578 ?auto_72579 ?auto_72580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72582 - BLOCK
      ?auto_72583 - BLOCK
      ?auto_72584 - BLOCK
      ?auto_72585 - BLOCK
      ?auto_72586 - BLOCK
      ?auto_72587 - BLOCK
    )
    :vars
    (
      ?auto_72588 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72582 ) ( ON ?auto_72583 ?auto_72582 ) ( not ( = ?auto_72582 ?auto_72583 ) ) ( not ( = ?auto_72582 ?auto_72584 ) ) ( not ( = ?auto_72582 ?auto_72585 ) ) ( not ( = ?auto_72582 ?auto_72586 ) ) ( not ( = ?auto_72582 ?auto_72587 ) ) ( not ( = ?auto_72583 ?auto_72584 ) ) ( not ( = ?auto_72583 ?auto_72585 ) ) ( not ( = ?auto_72583 ?auto_72586 ) ) ( not ( = ?auto_72583 ?auto_72587 ) ) ( not ( = ?auto_72584 ?auto_72585 ) ) ( not ( = ?auto_72584 ?auto_72586 ) ) ( not ( = ?auto_72584 ?auto_72587 ) ) ( not ( = ?auto_72585 ?auto_72586 ) ) ( not ( = ?auto_72585 ?auto_72587 ) ) ( not ( = ?auto_72586 ?auto_72587 ) ) ( ON ?auto_72587 ?auto_72588 ) ( not ( = ?auto_72582 ?auto_72588 ) ) ( not ( = ?auto_72583 ?auto_72588 ) ) ( not ( = ?auto_72584 ?auto_72588 ) ) ( not ( = ?auto_72585 ?auto_72588 ) ) ( not ( = ?auto_72586 ?auto_72588 ) ) ( not ( = ?auto_72587 ?auto_72588 ) ) ( ON ?auto_72586 ?auto_72587 ) ( ON-TABLE ?auto_72588 ) ( ON ?auto_72585 ?auto_72586 ) ( CLEAR ?auto_72583 ) ( ON ?auto_72584 ?auto_72585 ) ( CLEAR ?auto_72584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72588 ?auto_72587 ?auto_72586 ?auto_72585 )
      ( MAKE-6PILE ?auto_72582 ?auto_72583 ?auto_72584 ?auto_72585 ?auto_72586 ?auto_72587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72589 - BLOCK
      ?auto_72590 - BLOCK
      ?auto_72591 - BLOCK
      ?auto_72592 - BLOCK
      ?auto_72593 - BLOCK
      ?auto_72594 - BLOCK
    )
    :vars
    (
      ?auto_72595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72589 ) ( not ( = ?auto_72589 ?auto_72590 ) ) ( not ( = ?auto_72589 ?auto_72591 ) ) ( not ( = ?auto_72589 ?auto_72592 ) ) ( not ( = ?auto_72589 ?auto_72593 ) ) ( not ( = ?auto_72589 ?auto_72594 ) ) ( not ( = ?auto_72590 ?auto_72591 ) ) ( not ( = ?auto_72590 ?auto_72592 ) ) ( not ( = ?auto_72590 ?auto_72593 ) ) ( not ( = ?auto_72590 ?auto_72594 ) ) ( not ( = ?auto_72591 ?auto_72592 ) ) ( not ( = ?auto_72591 ?auto_72593 ) ) ( not ( = ?auto_72591 ?auto_72594 ) ) ( not ( = ?auto_72592 ?auto_72593 ) ) ( not ( = ?auto_72592 ?auto_72594 ) ) ( not ( = ?auto_72593 ?auto_72594 ) ) ( ON ?auto_72594 ?auto_72595 ) ( not ( = ?auto_72589 ?auto_72595 ) ) ( not ( = ?auto_72590 ?auto_72595 ) ) ( not ( = ?auto_72591 ?auto_72595 ) ) ( not ( = ?auto_72592 ?auto_72595 ) ) ( not ( = ?auto_72593 ?auto_72595 ) ) ( not ( = ?auto_72594 ?auto_72595 ) ) ( ON ?auto_72593 ?auto_72594 ) ( ON-TABLE ?auto_72595 ) ( ON ?auto_72592 ?auto_72593 ) ( ON ?auto_72591 ?auto_72592 ) ( CLEAR ?auto_72591 ) ( HOLDING ?auto_72590 ) ( CLEAR ?auto_72589 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72589 ?auto_72590 )
      ( MAKE-6PILE ?auto_72589 ?auto_72590 ?auto_72591 ?auto_72592 ?auto_72593 ?auto_72594 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72596 - BLOCK
      ?auto_72597 - BLOCK
      ?auto_72598 - BLOCK
      ?auto_72599 - BLOCK
      ?auto_72600 - BLOCK
      ?auto_72601 - BLOCK
    )
    :vars
    (
      ?auto_72602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72596 ) ( not ( = ?auto_72596 ?auto_72597 ) ) ( not ( = ?auto_72596 ?auto_72598 ) ) ( not ( = ?auto_72596 ?auto_72599 ) ) ( not ( = ?auto_72596 ?auto_72600 ) ) ( not ( = ?auto_72596 ?auto_72601 ) ) ( not ( = ?auto_72597 ?auto_72598 ) ) ( not ( = ?auto_72597 ?auto_72599 ) ) ( not ( = ?auto_72597 ?auto_72600 ) ) ( not ( = ?auto_72597 ?auto_72601 ) ) ( not ( = ?auto_72598 ?auto_72599 ) ) ( not ( = ?auto_72598 ?auto_72600 ) ) ( not ( = ?auto_72598 ?auto_72601 ) ) ( not ( = ?auto_72599 ?auto_72600 ) ) ( not ( = ?auto_72599 ?auto_72601 ) ) ( not ( = ?auto_72600 ?auto_72601 ) ) ( ON ?auto_72601 ?auto_72602 ) ( not ( = ?auto_72596 ?auto_72602 ) ) ( not ( = ?auto_72597 ?auto_72602 ) ) ( not ( = ?auto_72598 ?auto_72602 ) ) ( not ( = ?auto_72599 ?auto_72602 ) ) ( not ( = ?auto_72600 ?auto_72602 ) ) ( not ( = ?auto_72601 ?auto_72602 ) ) ( ON ?auto_72600 ?auto_72601 ) ( ON-TABLE ?auto_72602 ) ( ON ?auto_72599 ?auto_72600 ) ( ON ?auto_72598 ?auto_72599 ) ( CLEAR ?auto_72596 ) ( ON ?auto_72597 ?auto_72598 ) ( CLEAR ?auto_72597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72602 ?auto_72601 ?auto_72600 ?auto_72599 ?auto_72598 )
      ( MAKE-6PILE ?auto_72596 ?auto_72597 ?auto_72598 ?auto_72599 ?auto_72600 ?auto_72601 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72603 - BLOCK
      ?auto_72604 - BLOCK
      ?auto_72605 - BLOCK
      ?auto_72606 - BLOCK
      ?auto_72607 - BLOCK
      ?auto_72608 - BLOCK
    )
    :vars
    (
      ?auto_72609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72603 ?auto_72604 ) ) ( not ( = ?auto_72603 ?auto_72605 ) ) ( not ( = ?auto_72603 ?auto_72606 ) ) ( not ( = ?auto_72603 ?auto_72607 ) ) ( not ( = ?auto_72603 ?auto_72608 ) ) ( not ( = ?auto_72604 ?auto_72605 ) ) ( not ( = ?auto_72604 ?auto_72606 ) ) ( not ( = ?auto_72604 ?auto_72607 ) ) ( not ( = ?auto_72604 ?auto_72608 ) ) ( not ( = ?auto_72605 ?auto_72606 ) ) ( not ( = ?auto_72605 ?auto_72607 ) ) ( not ( = ?auto_72605 ?auto_72608 ) ) ( not ( = ?auto_72606 ?auto_72607 ) ) ( not ( = ?auto_72606 ?auto_72608 ) ) ( not ( = ?auto_72607 ?auto_72608 ) ) ( ON ?auto_72608 ?auto_72609 ) ( not ( = ?auto_72603 ?auto_72609 ) ) ( not ( = ?auto_72604 ?auto_72609 ) ) ( not ( = ?auto_72605 ?auto_72609 ) ) ( not ( = ?auto_72606 ?auto_72609 ) ) ( not ( = ?auto_72607 ?auto_72609 ) ) ( not ( = ?auto_72608 ?auto_72609 ) ) ( ON ?auto_72607 ?auto_72608 ) ( ON-TABLE ?auto_72609 ) ( ON ?auto_72606 ?auto_72607 ) ( ON ?auto_72605 ?auto_72606 ) ( ON ?auto_72604 ?auto_72605 ) ( CLEAR ?auto_72604 ) ( HOLDING ?auto_72603 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72603 )
      ( MAKE-6PILE ?auto_72603 ?auto_72604 ?auto_72605 ?auto_72606 ?auto_72607 ?auto_72608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72610 - BLOCK
      ?auto_72611 - BLOCK
      ?auto_72612 - BLOCK
      ?auto_72613 - BLOCK
      ?auto_72614 - BLOCK
      ?auto_72615 - BLOCK
    )
    :vars
    (
      ?auto_72616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72610 ?auto_72611 ) ) ( not ( = ?auto_72610 ?auto_72612 ) ) ( not ( = ?auto_72610 ?auto_72613 ) ) ( not ( = ?auto_72610 ?auto_72614 ) ) ( not ( = ?auto_72610 ?auto_72615 ) ) ( not ( = ?auto_72611 ?auto_72612 ) ) ( not ( = ?auto_72611 ?auto_72613 ) ) ( not ( = ?auto_72611 ?auto_72614 ) ) ( not ( = ?auto_72611 ?auto_72615 ) ) ( not ( = ?auto_72612 ?auto_72613 ) ) ( not ( = ?auto_72612 ?auto_72614 ) ) ( not ( = ?auto_72612 ?auto_72615 ) ) ( not ( = ?auto_72613 ?auto_72614 ) ) ( not ( = ?auto_72613 ?auto_72615 ) ) ( not ( = ?auto_72614 ?auto_72615 ) ) ( ON ?auto_72615 ?auto_72616 ) ( not ( = ?auto_72610 ?auto_72616 ) ) ( not ( = ?auto_72611 ?auto_72616 ) ) ( not ( = ?auto_72612 ?auto_72616 ) ) ( not ( = ?auto_72613 ?auto_72616 ) ) ( not ( = ?auto_72614 ?auto_72616 ) ) ( not ( = ?auto_72615 ?auto_72616 ) ) ( ON ?auto_72614 ?auto_72615 ) ( ON-TABLE ?auto_72616 ) ( ON ?auto_72613 ?auto_72614 ) ( ON ?auto_72612 ?auto_72613 ) ( ON ?auto_72611 ?auto_72612 ) ( ON ?auto_72610 ?auto_72611 ) ( CLEAR ?auto_72610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72616 ?auto_72615 ?auto_72614 ?auto_72613 ?auto_72612 ?auto_72611 )
      ( MAKE-6PILE ?auto_72610 ?auto_72611 ?auto_72612 ?auto_72613 ?auto_72614 ?auto_72615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72622 - BLOCK
      ?auto_72623 - BLOCK
      ?auto_72624 - BLOCK
      ?auto_72625 - BLOCK
      ?auto_72626 - BLOCK
    )
    :vars
    (
      ?auto_72627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72627 ?auto_72626 ) ( CLEAR ?auto_72627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72622 ) ( ON ?auto_72623 ?auto_72622 ) ( ON ?auto_72624 ?auto_72623 ) ( ON ?auto_72625 ?auto_72624 ) ( ON ?auto_72626 ?auto_72625 ) ( not ( = ?auto_72622 ?auto_72623 ) ) ( not ( = ?auto_72622 ?auto_72624 ) ) ( not ( = ?auto_72622 ?auto_72625 ) ) ( not ( = ?auto_72622 ?auto_72626 ) ) ( not ( = ?auto_72622 ?auto_72627 ) ) ( not ( = ?auto_72623 ?auto_72624 ) ) ( not ( = ?auto_72623 ?auto_72625 ) ) ( not ( = ?auto_72623 ?auto_72626 ) ) ( not ( = ?auto_72623 ?auto_72627 ) ) ( not ( = ?auto_72624 ?auto_72625 ) ) ( not ( = ?auto_72624 ?auto_72626 ) ) ( not ( = ?auto_72624 ?auto_72627 ) ) ( not ( = ?auto_72625 ?auto_72626 ) ) ( not ( = ?auto_72625 ?auto_72627 ) ) ( not ( = ?auto_72626 ?auto_72627 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72627 ?auto_72626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72641 - BLOCK
      ?auto_72642 - BLOCK
      ?auto_72643 - BLOCK
      ?auto_72644 - BLOCK
      ?auto_72645 - BLOCK
    )
    :vars
    (
      ?auto_72646 - BLOCK
      ?auto_72647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72641 ) ( ON ?auto_72642 ?auto_72641 ) ( ON ?auto_72643 ?auto_72642 ) ( ON ?auto_72644 ?auto_72643 ) ( not ( = ?auto_72641 ?auto_72642 ) ) ( not ( = ?auto_72641 ?auto_72643 ) ) ( not ( = ?auto_72641 ?auto_72644 ) ) ( not ( = ?auto_72641 ?auto_72645 ) ) ( not ( = ?auto_72641 ?auto_72646 ) ) ( not ( = ?auto_72642 ?auto_72643 ) ) ( not ( = ?auto_72642 ?auto_72644 ) ) ( not ( = ?auto_72642 ?auto_72645 ) ) ( not ( = ?auto_72642 ?auto_72646 ) ) ( not ( = ?auto_72643 ?auto_72644 ) ) ( not ( = ?auto_72643 ?auto_72645 ) ) ( not ( = ?auto_72643 ?auto_72646 ) ) ( not ( = ?auto_72644 ?auto_72645 ) ) ( not ( = ?auto_72644 ?auto_72646 ) ) ( not ( = ?auto_72645 ?auto_72646 ) ) ( ON ?auto_72646 ?auto_72647 ) ( CLEAR ?auto_72646 ) ( not ( = ?auto_72641 ?auto_72647 ) ) ( not ( = ?auto_72642 ?auto_72647 ) ) ( not ( = ?auto_72643 ?auto_72647 ) ) ( not ( = ?auto_72644 ?auto_72647 ) ) ( not ( = ?auto_72645 ?auto_72647 ) ) ( not ( = ?auto_72646 ?auto_72647 ) ) ( HOLDING ?auto_72645 ) ( CLEAR ?auto_72644 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72641 ?auto_72642 ?auto_72643 ?auto_72644 ?auto_72645 ?auto_72646 )
      ( MAKE-5PILE ?auto_72641 ?auto_72642 ?auto_72643 ?auto_72644 ?auto_72645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72648 - BLOCK
      ?auto_72649 - BLOCK
      ?auto_72650 - BLOCK
      ?auto_72651 - BLOCK
      ?auto_72652 - BLOCK
    )
    :vars
    (
      ?auto_72654 - BLOCK
      ?auto_72653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72648 ) ( ON ?auto_72649 ?auto_72648 ) ( ON ?auto_72650 ?auto_72649 ) ( ON ?auto_72651 ?auto_72650 ) ( not ( = ?auto_72648 ?auto_72649 ) ) ( not ( = ?auto_72648 ?auto_72650 ) ) ( not ( = ?auto_72648 ?auto_72651 ) ) ( not ( = ?auto_72648 ?auto_72652 ) ) ( not ( = ?auto_72648 ?auto_72654 ) ) ( not ( = ?auto_72649 ?auto_72650 ) ) ( not ( = ?auto_72649 ?auto_72651 ) ) ( not ( = ?auto_72649 ?auto_72652 ) ) ( not ( = ?auto_72649 ?auto_72654 ) ) ( not ( = ?auto_72650 ?auto_72651 ) ) ( not ( = ?auto_72650 ?auto_72652 ) ) ( not ( = ?auto_72650 ?auto_72654 ) ) ( not ( = ?auto_72651 ?auto_72652 ) ) ( not ( = ?auto_72651 ?auto_72654 ) ) ( not ( = ?auto_72652 ?auto_72654 ) ) ( ON ?auto_72654 ?auto_72653 ) ( not ( = ?auto_72648 ?auto_72653 ) ) ( not ( = ?auto_72649 ?auto_72653 ) ) ( not ( = ?auto_72650 ?auto_72653 ) ) ( not ( = ?auto_72651 ?auto_72653 ) ) ( not ( = ?auto_72652 ?auto_72653 ) ) ( not ( = ?auto_72654 ?auto_72653 ) ) ( CLEAR ?auto_72651 ) ( ON ?auto_72652 ?auto_72654 ) ( CLEAR ?auto_72652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72653 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72653 ?auto_72654 )
      ( MAKE-5PILE ?auto_72648 ?auto_72649 ?auto_72650 ?auto_72651 ?auto_72652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72655 - BLOCK
      ?auto_72656 - BLOCK
      ?auto_72657 - BLOCK
      ?auto_72658 - BLOCK
      ?auto_72659 - BLOCK
    )
    :vars
    (
      ?auto_72660 - BLOCK
      ?auto_72661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72655 ) ( ON ?auto_72656 ?auto_72655 ) ( ON ?auto_72657 ?auto_72656 ) ( not ( = ?auto_72655 ?auto_72656 ) ) ( not ( = ?auto_72655 ?auto_72657 ) ) ( not ( = ?auto_72655 ?auto_72658 ) ) ( not ( = ?auto_72655 ?auto_72659 ) ) ( not ( = ?auto_72655 ?auto_72660 ) ) ( not ( = ?auto_72656 ?auto_72657 ) ) ( not ( = ?auto_72656 ?auto_72658 ) ) ( not ( = ?auto_72656 ?auto_72659 ) ) ( not ( = ?auto_72656 ?auto_72660 ) ) ( not ( = ?auto_72657 ?auto_72658 ) ) ( not ( = ?auto_72657 ?auto_72659 ) ) ( not ( = ?auto_72657 ?auto_72660 ) ) ( not ( = ?auto_72658 ?auto_72659 ) ) ( not ( = ?auto_72658 ?auto_72660 ) ) ( not ( = ?auto_72659 ?auto_72660 ) ) ( ON ?auto_72660 ?auto_72661 ) ( not ( = ?auto_72655 ?auto_72661 ) ) ( not ( = ?auto_72656 ?auto_72661 ) ) ( not ( = ?auto_72657 ?auto_72661 ) ) ( not ( = ?auto_72658 ?auto_72661 ) ) ( not ( = ?auto_72659 ?auto_72661 ) ) ( not ( = ?auto_72660 ?auto_72661 ) ) ( ON ?auto_72659 ?auto_72660 ) ( CLEAR ?auto_72659 ) ( ON-TABLE ?auto_72661 ) ( HOLDING ?auto_72658 ) ( CLEAR ?auto_72657 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72655 ?auto_72656 ?auto_72657 ?auto_72658 )
      ( MAKE-5PILE ?auto_72655 ?auto_72656 ?auto_72657 ?auto_72658 ?auto_72659 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72662 - BLOCK
      ?auto_72663 - BLOCK
      ?auto_72664 - BLOCK
      ?auto_72665 - BLOCK
      ?auto_72666 - BLOCK
    )
    :vars
    (
      ?auto_72667 - BLOCK
      ?auto_72668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72662 ) ( ON ?auto_72663 ?auto_72662 ) ( ON ?auto_72664 ?auto_72663 ) ( not ( = ?auto_72662 ?auto_72663 ) ) ( not ( = ?auto_72662 ?auto_72664 ) ) ( not ( = ?auto_72662 ?auto_72665 ) ) ( not ( = ?auto_72662 ?auto_72666 ) ) ( not ( = ?auto_72662 ?auto_72667 ) ) ( not ( = ?auto_72663 ?auto_72664 ) ) ( not ( = ?auto_72663 ?auto_72665 ) ) ( not ( = ?auto_72663 ?auto_72666 ) ) ( not ( = ?auto_72663 ?auto_72667 ) ) ( not ( = ?auto_72664 ?auto_72665 ) ) ( not ( = ?auto_72664 ?auto_72666 ) ) ( not ( = ?auto_72664 ?auto_72667 ) ) ( not ( = ?auto_72665 ?auto_72666 ) ) ( not ( = ?auto_72665 ?auto_72667 ) ) ( not ( = ?auto_72666 ?auto_72667 ) ) ( ON ?auto_72667 ?auto_72668 ) ( not ( = ?auto_72662 ?auto_72668 ) ) ( not ( = ?auto_72663 ?auto_72668 ) ) ( not ( = ?auto_72664 ?auto_72668 ) ) ( not ( = ?auto_72665 ?auto_72668 ) ) ( not ( = ?auto_72666 ?auto_72668 ) ) ( not ( = ?auto_72667 ?auto_72668 ) ) ( ON ?auto_72666 ?auto_72667 ) ( ON-TABLE ?auto_72668 ) ( CLEAR ?auto_72664 ) ( ON ?auto_72665 ?auto_72666 ) ( CLEAR ?auto_72665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72668 ?auto_72667 ?auto_72666 )
      ( MAKE-5PILE ?auto_72662 ?auto_72663 ?auto_72664 ?auto_72665 ?auto_72666 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72669 - BLOCK
      ?auto_72670 - BLOCK
      ?auto_72671 - BLOCK
      ?auto_72672 - BLOCK
      ?auto_72673 - BLOCK
    )
    :vars
    (
      ?auto_72675 - BLOCK
      ?auto_72674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72669 ) ( ON ?auto_72670 ?auto_72669 ) ( not ( = ?auto_72669 ?auto_72670 ) ) ( not ( = ?auto_72669 ?auto_72671 ) ) ( not ( = ?auto_72669 ?auto_72672 ) ) ( not ( = ?auto_72669 ?auto_72673 ) ) ( not ( = ?auto_72669 ?auto_72675 ) ) ( not ( = ?auto_72670 ?auto_72671 ) ) ( not ( = ?auto_72670 ?auto_72672 ) ) ( not ( = ?auto_72670 ?auto_72673 ) ) ( not ( = ?auto_72670 ?auto_72675 ) ) ( not ( = ?auto_72671 ?auto_72672 ) ) ( not ( = ?auto_72671 ?auto_72673 ) ) ( not ( = ?auto_72671 ?auto_72675 ) ) ( not ( = ?auto_72672 ?auto_72673 ) ) ( not ( = ?auto_72672 ?auto_72675 ) ) ( not ( = ?auto_72673 ?auto_72675 ) ) ( ON ?auto_72675 ?auto_72674 ) ( not ( = ?auto_72669 ?auto_72674 ) ) ( not ( = ?auto_72670 ?auto_72674 ) ) ( not ( = ?auto_72671 ?auto_72674 ) ) ( not ( = ?auto_72672 ?auto_72674 ) ) ( not ( = ?auto_72673 ?auto_72674 ) ) ( not ( = ?auto_72675 ?auto_72674 ) ) ( ON ?auto_72673 ?auto_72675 ) ( ON-TABLE ?auto_72674 ) ( ON ?auto_72672 ?auto_72673 ) ( CLEAR ?auto_72672 ) ( HOLDING ?auto_72671 ) ( CLEAR ?auto_72670 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72669 ?auto_72670 ?auto_72671 )
      ( MAKE-5PILE ?auto_72669 ?auto_72670 ?auto_72671 ?auto_72672 ?auto_72673 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72676 - BLOCK
      ?auto_72677 - BLOCK
      ?auto_72678 - BLOCK
      ?auto_72679 - BLOCK
      ?auto_72680 - BLOCK
    )
    :vars
    (
      ?auto_72682 - BLOCK
      ?auto_72681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72676 ) ( ON ?auto_72677 ?auto_72676 ) ( not ( = ?auto_72676 ?auto_72677 ) ) ( not ( = ?auto_72676 ?auto_72678 ) ) ( not ( = ?auto_72676 ?auto_72679 ) ) ( not ( = ?auto_72676 ?auto_72680 ) ) ( not ( = ?auto_72676 ?auto_72682 ) ) ( not ( = ?auto_72677 ?auto_72678 ) ) ( not ( = ?auto_72677 ?auto_72679 ) ) ( not ( = ?auto_72677 ?auto_72680 ) ) ( not ( = ?auto_72677 ?auto_72682 ) ) ( not ( = ?auto_72678 ?auto_72679 ) ) ( not ( = ?auto_72678 ?auto_72680 ) ) ( not ( = ?auto_72678 ?auto_72682 ) ) ( not ( = ?auto_72679 ?auto_72680 ) ) ( not ( = ?auto_72679 ?auto_72682 ) ) ( not ( = ?auto_72680 ?auto_72682 ) ) ( ON ?auto_72682 ?auto_72681 ) ( not ( = ?auto_72676 ?auto_72681 ) ) ( not ( = ?auto_72677 ?auto_72681 ) ) ( not ( = ?auto_72678 ?auto_72681 ) ) ( not ( = ?auto_72679 ?auto_72681 ) ) ( not ( = ?auto_72680 ?auto_72681 ) ) ( not ( = ?auto_72682 ?auto_72681 ) ) ( ON ?auto_72680 ?auto_72682 ) ( ON-TABLE ?auto_72681 ) ( ON ?auto_72679 ?auto_72680 ) ( CLEAR ?auto_72677 ) ( ON ?auto_72678 ?auto_72679 ) ( CLEAR ?auto_72678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72681 ?auto_72682 ?auto_72680 ?auto_72679 )
      ( MAKE-5PILE ?auto_72676 ?auto_72677 ?auto_72678 ?auto_72679 ?auto_72680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72683 - BLOCK
      ?auto_72684 - BLOCK
      ?auto_72685 - BLOCK
      ?auto_72686 - BLOCK
      ?auto_72687 - BLOCK
    )
    :vars
    (
      ?auto_72689 - BLOCK
      ?auto_72688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72683 ) ( not ( = ?auto_72683 ?auto_72684 ) ) ( not ( = ?auto_72683 ?auto_72685 ) ) ( not ( = ?auto_72683 ?auto_72686 ) ) ( not ( = ?auto_72683 ?auto_72687 ) ) ( not ( = ?auto_72683 ?auto_72689 ) ) ( not ( = ?auto_72684 ?auto_72685 ) ) ( not ( = ?auto_72684 ?auto_72686 ) ) ( not ( = ?auto_72684 ?auto_72687 ) ) ( not ( = ?auto_72684 ?auto_72689 ) ) ( not ( = ?auto_72685 ?auto_72686 ) ) ( not ( = ?auto_72685 ?auto_72687 ) ) ( not ( = ?auto_72685 ?auto_72689 ) ) ( not ( = ?auto_72686 ?auto_72687 ) ) ( not ( = ?auto_72686 ?auto_72689 ) ) ( not ( = ?auto_72687 ?auto_72689 ) ) ( ON ?auto_72689 ?auto_72688 ) ( not ( = ?auto_72683 ?auto_72688 ) ) ( not ( = ?auto_72684 ?auto_72688 ) ) ( not ( = ?auto_72685 ?auto_72688 ) ) ( not ( = ?auto_72686 ?auto_72688 ) ) ( not ( = ?auto_72687 ?auto_72688 ) ) ( not ( = ?auto_72689 ?auto_72688 ) ) ( ON ?auto_72687 ?auto_72689 ) ( ON-TABLE ?auto_72688 ) ( ON ?auto_72686 ?auto_72687 ) ( ON ?auto_72685 ?auto_72686 ) ( CLEAR ?auto_72685 ) ( HOLDING ?auto_72684 ) ( CLEAR ?auto_72683 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72683 ?auto_72684 )
      ( MAKE-5PILE ?auto_72683 ?auto_72684 ?auto_72685 ?auto_72686 ?auto_72687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72690 - BLOCK
      ?auto_72691 - BLOCK
      ?auto_72692 - BLOCK
      ?auto_72693 - BLOCK
      ?auto_72694 - BLOCK
    )
    :vars
    (
      ?auto_72695 - BLOCK
      ?auto_72696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72690 ) ( not ( = ?auto_72690 ?auto_72691 ) ) ( not ( = ?auto_72690 ?auto_72692 ) ) ( not ( = ?auto_72690 ?auto_72693 ) ) ( not ( = ?auto_72690 ?auto_72694 ) ) ( not ( = ?auto_72690 ?auto_72695 ) ) ( not ( = ?auto_72691 ?auto_72692 ) ) ( not ( = ?auto_72691 ?auto_72693 ) ) ( not ( = ?auto_72691 ?auto_72694 ) ) ( not ( = ?auto_72691 ?auto_72695 ) ) ( not ( = ?auto_72692 ?auto_72693 ) ) ( not ( = ?auto_72692 ?auto_72694 ) ) ( not ( = ?auto_72692 ?auto_72695 ) ) ( not ( = ?auto_72693 ?auto_72694 ) ) ( not ( = ?auto_72693 ?auto_72695 ) ) ( not ( = ?auto_72694 ?auto_72695 ) ) ( ON ?auto_72695 ?auto_72696 ) ( not ( = ?auto_72690 ?auto_72696 ) ) ( not ( = ?auto_72691 ?auto_72696 ) ) ( not ( = ?auto_72692 ?auto_72696 ) ) ( not ( = ?auto_72693 ?auto_72696 ) ) ( not ( = ?auto_72694 ?auto_72696 ) ) ( not ( = ?auto_72695 ?auto_72696 ) ) ( ON ?auto_72694 ?auto_72695 ) ( ON-TABLE ?auto_72696 ) ( ON ?auto_72693 ?auto_72694 ) ( ON ?auto_72692 ?auto_72693 ) ( CLEAR ?auto_72690 ) ( ON ?auto_72691 ?auto_72692 ) ( CLEAR ?auto_72691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72696 ?auto_72695 ?auto_72694 ?auto_72693 ?auto_72692 )
      ( MAKE-5PILE ?auto_72690 ?auto_72691 ?auto_72692 ?auto_72693 ?auto_72694 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72697 - BLOCK
      ?auto_72698 - BLOCK
      ?auto_72699 - BLOCK
      ?auto_72700 - BLOCK
      ?auto_72701 - BLOCK
    )
    :vars
    (
      ?auto_72702 - BLOCK
      ?auto_72703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72697 ?auto_72698 ) ) ( not ( = ?auto_72697 ?auto_72699 ) ) ( not ( = ?auto_72697 ?auto_72700 ) ) ( not ( = ?auto_72697 ?auto_72701 ) ) ( not ( = ?auto_72697 ?auto_72702 ) ) ( not ( = ?auto_72698 ?auto_72699 ) ) ( not ( = ?auto_72698 ?auto_72700 ) ) ( not ( = ?auto_72698 ?auto_72701 ) ) ( not ( = ?auto_72698 ?auto_72702 ) ) ( not ( = ?auto_72699 ?auto_72700 ) ) ( not ( = ?auto_72699 ?auto_72701 ) ) ( not ( = ?auto_72699 ?auto_72702 ) ) ( not ( = ?auto_72700 ?auto_72701 ) ) ( not ( = ?auto_72700 ?auto_72702 ) ) ( not ( = ?auto_72701 ?auto_72702 ) ) ( ON ?auto_72702 ?auto_72703 ) ( not ( = ?auto_72697 ?auto_72703 ) ) ( not ( = ?auto_72698 ?auto_72703 ) ) ( not ( = ?auto_72699 ?auto_72703 ) ) ( not ( = ?auto_72700 ?auto_72703 ) ) ( not ( = ?auto_72701 ?auto_72703 ) ) ( not ( = ?auto_72702 ?auto_72703 ) ) ( ON ?auto_72701 ?auto_72702 ) ( ON-TABLE ?auto_72703 ) ( ON ?auto_72700 ?auto_72701 ) ( ON ?auto_72699 ?auto_72700 ) ( ON ?auto_72698 ?auto_72699 ) ( CLEAR ?auto_72698 ) ( HOLDING ?auto_72697 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72697 )
      ( MAKE-5PILE ?auto_72697 ?auto_72698 ?auto_72699 ?auto_72700 ?auto_72701 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72704 - BLOCK
      ?auto_72705 - BLOCK
      ?auto_72706 - BLOCK
      ?auto_72707 - BLOCK
      ?auto_72708 - BLOCK
    )
    :vars
    (
      ?auto_72710 - BLOCK
      ?auto_72709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72704 ?auto_72705 ) ) ( not ( = ?auto_72704 ?auto_72706 ) ) ( not ( = ?auto_72704 ?auto_72707 ) ) ( not ( = ?auto_72704 ?auto_72708 ) ) ( not ( = ?auto_72704 ?auto_72710 ) ) ( not ( = ?auto_72705 ?auto_72706 ) ) ( not ( = ?auto_72705 ?auto_72707 ) ) ( not ( = ?auto_72705 ?auto_72708 ) ) ( not ( = ?auto_72705 ?auto_72710 ) ) ( not ( = ?auto_72706 ?auto_72707 ) ) ( not ( = ?auto_72706 ?auto_72708 ) ) ( not ( = ?auto_72706 ?auto_72710 ) ) ( not ( = ?auto_72707 ?auto_72708 ) ) ( not ( = ?auto_72707 ?auto_72710 ) ) ( not ( = ?auto_72708 ?auto_72710 ) ) ( ON ?auto_72710 ?auto_72709 ) ( not ( = ?auto_72704 ?auto_72709 ) ) ( not ( = ?auto_72705 ?auto_72709 ) ) ( not ( = ?auto_72706 ?auto_72709 ) ) ( not ( = ?auto_72707 ?auto_72709 ) ) ( not ( = ?auto_72708 ?auto_72709 ) ) ( not ( = ?auto_72710 ?auto_72709 ) ) ( ON ?auto_72708 ?auto_72710 ) ( ON-TABLE ?auto_72709 ) ( ON ?auto_72707 ?auto_72708 ) ( ON ?auto_72706 ?auto_72707 ) ( ON ?auto_72705 ?auto_72706 ) ( ON ?auto_72704 ?auto_72705 ) ( CLEAR ?auto_72704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72709 ?auto_72710 ?auto_72708 ?auto_72707 ?auto_72706 ?auto_72705 )
      ( MAKE-5PILE ?auto_72704 ?auto_72705 ?auto_72706 ?auto_72707 ?auto_72708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72712 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72712 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_72712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72713 - BLOCK
    )
    :vars
    (
      ?auto_72714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72713 ?auto_72714 ) ( CLEAR ?auto_72713 ) ( HAND-EMPTY ) ( not ( = ?auto_72713 ?auto_72714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72713 ?auto_72714 )
      ( MAKE-1PILE ?auto_72713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72715 - BLOCK
    )
    :vars
    (
      ?auto_72716 - BLOCK
      ?auto_72718 - BLOCK
      ?auto_72719 - BLOCK
      ?auto_72720 - BLOCK
      ?auto_72717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72715 ?auto_72716 ) ) ( HOLDING ?auto_72715 ) ( CLEAR ?auto_72716 ) ( ON-TABLE ?auto_72718 ) ( ON ?auto_72719 ?auto_72718 ) ( ON ?auto_72720 ?auto_72719 ) ( ON ?auto_72717 ?auto_72720 ) ( ON ?auto_72716 ?auto_72717 ) ( not ( = ?auto_72718 ?auto_72719 ) ) ( not ( = ?auto_72718 ?auto_72720 ) ) ( not ( = ?auto_72718 ?auto_72717 ) ) ( not ( = ?auto_72718 ?auto_72716 ) ) ( not ( = ?auto_72718 ?auto_72715 ) ) ( not ( = ?auto_72719 ?auto_72720 ) ) ( not ( = ?auto_72719 ?auto_72717 ) ) ( not ( = ?auto_72719 ?auto_72716 ) ) ( not ( = ?auto_72719 ?auto_72715 ) ) ( not ( = ?auto_72720 ?auto_72717 ) ) ( not ( = ?auto_72720 ?auto_72716 ) ) ( not ( = ?auto_72720 ?auto_72715 ) ) ( not ( = ?auto_72717 ?auto_72716 ) ) ( not ( = ?auto_72717 ?auto_72715 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72718 ?auto_72719 ?auto_72720 ?auto_72717 ?auto_72716 ?auto_72715 )
      ( MAKE-1PILE ?auto_72715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72721 - BLOCK
    )
    :vars
    (
      ?auto_72724 - BLOCK
      ?auto_72722 - BLOCK
      ?auto_72723 - BLOCK
      ?auto_72726 - BLOCK
      ?auto_72725 - BLOCK
      ?auto_72727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72721 ?auto_72724 ) ) ( CLEAR ?auto_72724 ) ( ON-TABLE ?auto_72722 ) ( ON ?auto_72723 ?auto_72722 ) ( ON ?auto_72726 ?auto_72723 ) ( ON ?auto_72725 ?auto_72726 ) ( ON ?auto_72724 ?auto_72725 ) ( not ( = ?auto_72722 ?auto_72723 ) ) ( not ( = ?auto_72722 ?auto_72726 ) ) ( not ( = ?auto_72722 ?auto_72725 ) ) ( not ( = ?auto_72722 ?auto_72724 ) ) ( not ( = ?auto_72722 ?auto_72721 ) ) ( not ( = ?auto_72723 ?auto_72726 ) ) ( not ( = ?auto_72723 ?auto_72725 ) ) ( not ( = ?auto_72723 ?auto_72724 ) ) ( not ( = ?auto_72723 ?auto_72721 ) ) ( not ( = ?auto_72726 ?auto_72725 ) ) ( not ( = ?auto_72726 ?auto_72724 ) ) ( not ( = ?auto_72726 ?auto_72721 ) ) ( not ( = ?auto_72725 ?auto_72724 ) ) ( not ( = ?auto_72725 ?auto_72721 ) ) ( ON ?auto_72721 ?auto_72727 ) ( CLEAR ?auto_72721 ) ( HAND-EMPTY ) ( not ( = ?auto_72721 ?auto_72727 ) ) ( not ( = ?auto_72724 ?auto_72727 ) ) ( not ( = ?auto_72722 ?auto_72727 ) ) ( not ( = ?auto_72723 ?auto_72727 ) ) ( not ( = ?auto_72726 ?auto_72727 ) ) ( not ( = ?auto_72725 ?auto_72727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72721 ?auto_72727 )
      ( MAKE-1PILE ?auto_72721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72728 - BLOCK
    )
    :vars
    (
      ?auto_72730 - BLOCK
      ?auto_72729 - BLOCK
      ?auto_72731 - BLOCK
      ?auto_72734 - BLOCK
      ?auto_72732 - BLOCK
      ?auto_72733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72728 ?auto_72730 ) ) ( ON-TABLE ?auto_72729 ) ( ON ?auto_72731 ?auto_72729 ) ( ON ?auto_72734 ?auto_72731 ) ( ON ?auto_72732 ?auto_72734 ) ( not ( = ?auto_72729 ?auto_72731 ) ) ( not ( = ?auto_72729 ?auto_72734 ) ) ( not ( = ?auto_72729 ?auto_72732 ) ) ( not ( = ?auto_72729 ?auto_72730 ) ) ( not ( = ?auto_72729 ?auto_72728 ) ) ( not ( = ?auto_72731 ?auto_72734 ) ) ( not ( = ?auto_72731 ?auto_72732 ) ) ( not ( = ?auto_72731 ?auto_72730 ) ) ( not ( = ?auto_72731 ?auto_72728 ) ) ( not ( = ?auto_72734 ?auto_72732 ) ) ( not ( = ?auto_72734 ?auto_72730 ) ) ( not ( = ?auto_72734 ?auto_72728 ) ) ( not ( = ?auto_72732 ?auto_72730 ) ) ( not ( = ?auto_72732 ?auto_72728 ) ) ( ON ?auto_72728 ?auto_72733 ) ( CLEAR ?auto_72728 ) ( not ( = ?auto_72728 ?auto_72733 ) ) ( not ( = ?auto_72730 ?auto_72733 ) ) ( not ( = ?auto_72729 ?auto_72733 ) ) ( not ( = ?auto_72731 ?auto_72733 ) ) ( not ( = ?auto_72734 ?auto_72733 ) ) ( not ( = ?auto_72732 ?auto_72733 ) ) ( HOLDING ?auto_72730 ) ( CLEAR ?auto_72732 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72729 ?auto_72731 ?auto_72734 ?auto_72732 ?auto_72730 )
      ( MAKE-1PILE ?auto_72728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72735 - BLOCK
    )
    :vars
    (
      ?auto_72736 - BLOCK
      ?auto_72738 - BLOCK
      ?auto_72739 - BLOCK
      ?auto_72741 - BLOCK
      ?auto_72740 - BLOCK
      ?auto_72737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72735 ?auto_72736 ) ) ( ON-TABLE ?auto_72738 ) ( ON ?auto_72739 ?auto_72738 ) ( ON ?auto_72741 ?auto_72739 ) ( ON ?auto_72740 ?auto_72741 ) ( not ( = ?auto_72738 ?auto_72739 ) ) ( not ( = ?auto_72738 ?auto_72741 ) ) ( not ( = ?auto_72738 ?auto_72740 ) ) ( not ( = ?auto_72738 ?auto_72736 ) ) ( not ( = ?auto_72738 ?auto_72735 ) ) ( not ( = ?auto_72739 ?auto_72741 ) ) ( not ( = ?auto_72739 ?auto_72740 ) ) ( not ( = ?auto_72739 ?auto_72736 ) ) ( not ( = ?auto_72739 ?auto_72735 ) ) ( not ( = ?auto_72741 ?auto_72740 ) ) ( not ( = ?auto_72741 ?auto_72736 ) ) ( not ( = ?auto_72741 ?auto_72735 ) ) ( not ( = ?auto_72740 ?auto_72736 ) ) ( not ( = ?auto_72740 ?auto_72735 ) ) ( ON ?auto_72735 ?auto_72737 ) ( not ( = ?auto_72735 ?auto_72737 ) ) ( not ( = ?auto_72736 ?auto_72737 ) ) ( not ( = ?auto_72738 ?auto_72737 ) ) ( not ( = ?auto_72739 ?auto_72737 ) ) ( not ( = ?auto_72741 ?auto_72737 ) ) ( not ( = ?auto_72740 ?auto_72737 ) ) ( CLEAR ?auto_72740 ) ( ON ?auto_72736 ?auto_72735 ) ( CLEAR ?auto_72736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72737 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72737 ?auto_72735 )
      ( MAKE-1PILE ?auto_72735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72742 - BLOCK
    )
    :vars
    (
      ?auto_72745 - BLOCK
      ?auto_72744 - BLOCK
      ?auto_72748 - BLOCK
      ?auto_72746 - BLOCK
      ?auto_72747 - BLOCK
      ?auto_72743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72742 ?auto_72745 ) ) ( ON-TABLE ?auto_72744 ) ( ON ?auto_72748 ?auto_72744 ) ( ON ?auto_72746 ?auto_72748 ) ( not ( = ?auto_72744 ?auto_72748 ) ) ( not ( = ?auto_72744 ?auto_72746 ) ) ( not ( = ?auto_72744 ?auto_72747 ) ) ( not ( = ?auto_72744 ?auto_72745 ) ) ( not ( = ?auto_72744 ?auto_72742 ) ) ( not ( = ?auto_72748 ?auto_72746 ) ) ( not ( = ?auto_72748 ?auto_72747 ) ) ( not ( = ?auto_72748 ?auto_72745 ) ) ( not ( = ?auto_72748 ?auto_72742 ) ) ( not ( = ?auto_72746 ?auto_72747 ) ) ( not ( = ?auto_72746 ?auto_72745 ) ) ( not ( = ?auto_72746 ?auto_72742 ) ) ( not ( = ?auto_72747 ?auto_72745 ) ) ( not ( = ?auto_72747 ?auto_72742 ) ) ( ON ?auto_72742 ?auto_72743 ) ( not ( = ?auto_72742 ?auto_72743 ) ) ( not ( = ?auto_72745 ?auto_72743 ) ) ( not ( = ?auto_72744 ?auto_72743 ) ) ( not ( = ?auto_72748 ?auto_72743 ) ) ( not ( = ?auto_72746 ?auto_72743 ) ) ( not ( = ?auto_72747 ?auto_72743 ) ) ( ON ?auto_72745 ?auto_72742 ) ( CLEAR ?auto_72745 ) ( ON-TABLE ?auto_72743 ) ( HOLDING ?auto_72747 ) ( CLEAR ?auto_72746 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72744 ?auto_72748 ?auto_72746 ?auto_72747 )
      ( MAKE-1PILE ?auto_72742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72749 - BLOCK
    )
    :vars
    (
      ?auto_72755 - BLOCK
      ?auto_72751 - BLOCK
      ?auto_72754 - BLOCK
      ?auto_72753 - BLOCK
      ?auto_72750 - BLOCK
      ?auto_72752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72749 ?auto_72755 ) ) ( ON-TABLE ?auto_72751 ) ( ON ?auto_72754 ?auto_72751 ) ( ON ?auto_72753 ?auto_72754 ) ( not ( = ?auto_72751 ?auto_72754 ) ) ( not ( = ?auto_72751 ?auto_72753 ) ) ( not ( = ?auto_72751 ?auto_72750 ) ) ( not ( = ?auto_72751 ?auto_72755 ) ) ( not ( = ?auto_72751 ?auto_72749 ) ) ( not ( = ?auto_72754 ?auto_72753 ) ) ( not ( = ?auto_72754 ?auto_72750 ) ) ( not ( = ?auto_72754 ?auto_72755 ) ) ( not ( = ?auto_72754 ?auto_72749 ) ) ( not ( = ?auto_72753 ?auto_72750 ) ) ( not ( = ?auto_72753 ?auto_72755 ) ) ( not ( = ?auto_72753 ?auto_72749 ) ) ( not ( = ?auto_72750 ?auto_72755 ) ) ( not ( = ?auto_72750 ?auto_72749 ) ) ( ON ?auto_72749 ?auto_72752 ) ( not ( = ?auto_72749 ?auto_72752 ) ) ( not ( = ?auto_72755 ?auto_72752 ) ) ( not ( = ?auto_72751 ?auto_72752 ) ) ( not ( = ?auto_72754 ?auto_72752 ) ) ( not ( = ?auto_72753 ?auto_72752 ) ) ( not ( = ?auto_72750 ?auto_72752 ) ) ( ON ?auto_72755 ?auto_72749 ) ( ON-TABLE ?auto_72752 ) ( CLEAR ?auto_72753 ) ( ON ?auto_72750 ?auto_72755 ) ( CLEAR ?auto_72750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72752 ?auto_72749 ?auto_72755 )
      ( MAKE-1PILE ?auto_72749 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72756 - BLOCK
    )
    :vars
    (
      ?auto_72762 - BLOCK
      ?auto_72759 - BLOCK
      ?auto_72761 - BLOCK
      ?auto_72758 - BLOCK
      ?auto_72760 - BLOCK
      ?auto_72757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72756 ?auto_72762 ) ) ( ON-TABLE ?auto_72759 ) ( ON ?auto_72761 ?auto_72759 ) ( not ( = ?auto_72759 ?auto_72761 ) ) ( not ( = ?auto_72759 ?auto_72758 ) ) ( not ( = ?auto_72759 ?auto_72760 ) ) ( not ( = ?auto_72759 ?auto_72762 ) ) ( not ( = ?auto_72759 ?auto_72756 ) ) ( not ( = ?auto_72761 ?auto_72758 ) ) ( not ( = ?auto_72761 ?auto_72760 ) ) ( not ( = ?auto_72761 ?auto_72762 ) ) ( not ( = ?auto_72761 ?auto_72756 ) ) ( not ( = ?auto_72758 ?auto_72760 ) ) ( not ( = ?auto_72758 ?auto_72762 ) ) ( not ( = ?auto_72758 ?auto_72756 ) ) ( not ( = ?auto_72760 ?auto_72762 ) ) ( not ( = ?auto_72760 ?auto_72756 ) ) ( ON ?auto_72756 ?auto_72757 ) ( not ( = ?auto_72756 ?auto_72757 ) ) ( not ( = ?auto_72762 ?auto_72757 ) ) ( not ( = ?auto_72759 ?auto_72757 ) ) ( not ( = ?auto_72761 ?auto_72757 ) ) ( not ( = ?auto_72758 ?auto_72757 ) ) ( not ( = ?auto_72760 ?auto_72757 ) ) ( ON ?auto_72762 ?auto_72756 ) ( ON-TABLE ?auto_72757 ) ( ON ?auto_72760 ?auto_72762 ) ( CLEAR ?auto_72760 ) ( HOLDING ?auto_72758 ) ( CLEAR ?auto_72761 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72759 ?auto_72761 ?auto_72758 )
      ( MAKE-1PILE ?auto_72756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72763 - BLOCK
    )
    :vars
    (
      ?auto_72766 - BLOCK
      ?auto_72765 - BLOCK
      ?auto_72767 - BLOCK
      ?auto_72769 - BLOCK
      ?auto_72768 - BLOCK
      ?auto_72764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72763 ?auto_72766 ) ) ( ON-TABLE ?auto_72765 ) ( ON ?auto_72767 ?auto_72765 ) ( not ( = ?auto_72765 ?auto_72767 ) ) ( not ( = ?auto_72765 ?auto_72769 ) ) ( not ( = ?auto_72765 ?auto_72768 ) ) ( not ( = ?auto_72765 ?auto_72766 ) ) ( not ( = ?auto_72765 ?auto_72763 ) ) ( not ( = ?auto_72767 ?auto_72769 ) ) ( not ( = ?auto_72767 ?auto_72768 ) ) ( not ( = ?auto_72767 ?auto_72766 ) ) ( not ( = ?auto_72767 ?auto_72763 ) ) ( not ( = ?auto_72769 ?auto_72768 ) ) ( not ( = ?auto_72769 ?auto_72766 ) ) ( not ( = ?auto_72769 ?auto_72763 ) ) ( not ( = ?auto_72768 ?auto_72766 ) ) ( not ( = ?auto_72768 ?auto_72763 ) ) ( ON ?auto_72763 ?auto_72764 ) ( not ( = ?auto_72763 ?auto_72764 ) ) ( not ( = ?auto_72766 ?auto_72764 ) ) ( not ( = ?auto_72765 ?auto_72764 ) ) ( not ( = ?auto_72767 ?auto_72764 ) ) ( not ( = ?auto_72769 ?auto_72764 ) ) ( not ( = ?auto_72768 ?auto_72764 ) ) ( ON ?auto_72766 ?auto_72763 ) ( ON-TABLE ?auto_72764 ) ( ON ?auto_72768 ?auto_72766 ) ( CLEAR ?auto_72767 ) ( ON ?auto_72769 ?auto_72768 ) ( CLEAR ?auto_72769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72764 ?auto_72763 ?auto_72766 ?auto_72768 )
      ( MAKE-1PILE ?auto_72763 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72770 - BLOCK
    )
    :vars
    (
      ?auto_72774 - BLOCK
      ?auto_72775 - BLOCK
      ?auto_72771 - BLOCK
      ?auto_72776 - BLOCK
      ?auto_72773 - BLOCK
      ?auto_72772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72770 ?auto_72774 ) ) ( ON-TABLE ?auto_72775 ) ( not ( = ?auto_72775 ?auto_72771 ) ) ( not ( = ?auto_72775 ?auto_72776 ) ) ( not ( = ?auto_72775 ?auto_72773 ) ) ( not ( = ?auto_72775 ?auto_72774 ) ) ( not ( = ?auto_72775 ?auto_72770 ) ) ( not ( = ?auto_72771 ?auto_72776 ) ) ( not ( = ?auto_72771 ?auto_72773 ) ) ( not ( = ?auto_72771 ?auto_72774 ) ) ( not ( = ?auto_72771 ?auto_72770 ) ) ( not ( = ?auto_72776 ?auto_72773 ) ) ( not ( = ?auto_72776 ?auto_72774 ) ) ( not ( = ?auto_72776 ?auto_72770 ) ) ( not ( = ?auto_72773 ?auto_72774 ) ) ( not ( = ?auto_72773 ?auto_72770 ) ) ( ON ?auto_72770 ?auto_72772 ) ( not ( = ?auto_72770 ?auto_72772 ) ) ( not ( = ?auto_72774 ?auto_72772 ) ) ( not ( = ?auto_72775 ?auto_72772 ) ) ( not ( = ?auto_72771 ?auto_72772 ) ) ( not ( = ?auto_72776 ?auto_72772 ) ) ( not ( = ?auto_72773 ?auto_72772 ) ) ( ON ?auto_72774 ?auto_72770 ) ( ON-TABLE ?auto_72772 ) ( ON ?auto_72773 ?auto_72774 ) ( ON ?auto_72776 ?auto_72773 ) ( CLEAR ?auto_72776 ) ( HOLDING ?auto_72771 ) ( CLEAR ?auto_72775 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72775 ?auto_72771 )
      ( MAKE-1PILE ?auto_72770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72777 - BLOCK
    )
    :vars
    (
      ?auto_72783 - BLOCK
      ?auto_72779 - BLOCK
      ?auto_72782 - BLOCK
      ?auto_72781 - BLOCK
      ?auto_72778 - BLOCK
      ?auto_72780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72777 ?auto_72783 ) ) ( ON-TABLE ?auto_72779 ) ( not ( = ?auto_72779 ?auto_72782 ) ) ( not ( = ?auto_72779 ?auto_72781 ) ) ( not ( = ?auto_72779 ?auto_72778 ) ) ( not ( = ?auto_72779 ?auto_72783 ) ) ( not ( = ?auto_72779 ?auto_72777 ) ) ( not ( = ?auto_72782 ?auto_72781 ) ) ( not ( = ?auto_72782 ?auto_72778 ) ) ( not ( = ?auto_72782 ?auto_72783 ) ) ( not ( = ?auto_72782 ?auto_72777 ) ) ( not ( = ?auto_72781 ?auto_72778 ) ) ( not ( = ?auto_72781 ?auto_72783 ) ) ( not ( = ?auto_72781 ?auto_72777 ) ) ( not ( = ?auto_72778 ?auto_72783 ) ) ( not ( = ?auto_72778 ?auto_72777 ) ) ( ON ?auto_72777 ?auto_72780 ) ( not ( = ?auto_72777 ?auto_72780 ) ) ( not ( = ?auto_72783 ?auto_72780 ) ) ( not ( = ?auto_72779 ?auto_72780 ) ) ( not ( = ?auto_72782 ?auto_72780 ) ) ( not ( = ?auto_72781 ?auto_72780 ) ) ( not ( = ?auto_72778 ?auto_72780 ) ) ( ON ?auto_72783 ?auto_72777 ) ( ON-TABLE ?auto_72780 ) ( ON ?auto_72778 ?auto_72783 ) ( ON ?auto_72781 ?auto_72778 ) ( CLEAR ?auto_72779 ) ( ON ?auto_72782 ?auto_72781 ) ( CLEAR ?auto_72782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72780 ?auto_72777 ?auto_72783 ?auto_72778 ?auto_72781 )
      ( MAKE-1PILE ?auto_72777 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72784 - BLOCK
    )
    :vars
    (
      ?auto_72788 - BLOCK
      ?auto_72789 - BLOCK
      ?auto_72785 - BLOCK
      ?auto_72787 - BLOCK
      ?auto_72786 - BLOCK
      ?auto_72790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72784 ?auto_72788 ) ) ( not ( = ?auto_72789 ?auto_72785 ) ) ( not ( = ?auto_72789 ?auto_72787 ) ) ( not ( = ?auto_72789 ?auto_72786 ) ) ( not ( = ?auto_72789 ?auto_72788 ) ) ( not ( = ?auto_72789 ?auto_72784 ) ) ( not ( = ?auto_72785 ?auto_72787 ) ) ( not ( = ?auto_72785 ?auto_72786 ) ) ( not ( = ?auto_72785 ?auto_72788 ) ) ( not ( = ?auto_72785 ?auto_72784 ) ) ( not ( = ?auto_72787 ?auto_72786 ) ) ( not ( = ?auto_72787 ?auto_72788 ) ) ( not ( = ?auto_72787 ?auto_72784 ) ) ( not ( = ?auto_72786 ?auto_72788 ) ) ( not ( = ?auto_72786 ?auto_72784 ) ) ( ON ?auto_72784 ?auto_72790 ) ( not ( = ?auto_72784 ?auto_72790 ) ) ( not ( = ?auto_72788 ?auto_72790 ) ) ( not ( = ?auto_72789 ?auto_72790 ) ) ( not ( = ?auto_72785 ?auto_72790 ) ) ( not ( = ?auto_72787 ?auto_72790 ) ) ( not ( = ?auto_72786 ?auto_72790 ) ) ( ON ?auto_72788 ?auto_72784 ) ( ON-TABLE ?auto_72790 ) ( ON ?auto_72786 ?auto_72788 ) ( ON ?auto_72787 ?auto_72786 ) ( ON ?auto_72785 ?auto_72787 ) ( CLEAR ?auto_72785 ) ( HOLDING ?auto_72789 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72789 )
      ( MAKE-1PILE ?auto_72784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72791 - BLOCK
    )
    :vars
    (
      ?auto_72794 - BLOCK
      ?auto_72792 - BLOCK
      ?auto_72797 - BLOCK
      ?auto_72796 - BLOCK
      ?auto_72795 - BLOCK
      ?auto_72793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72791 ?auto_72794 ) ) ( not ( = ?auto_72792 ?auto_72797 ) ) ( not ( = ?auto_72792 ?auto_72796 ) ) ( not ( = ?auto_72792 ?auto_72795 ) ) ( not ( = ?auto_72792 ?auto_72794 ) ) ( not ( = ?auto_72792 ?auto_72791 ) ) ( not ( = ?auto_72797 ?auto_72796 ) ) ( not ( = ?auto_72797 ?auto_72795 ) ) ( not ( = ?auto_72797 ?auto_72794 ) ) ( not ( = ?auto_72797 ?auto_72791 ) ) ( not ( = ?auto_72796 ?auto_72795 ) ) ( not ( = ?auto_72796 ?auto_72794 ) ) ( not ( = ?auto_72796 ?auto_72791 ) ) ( not ( = ?auto_72795 ?auto_72794 ) ) ( not ( = ?auto_72795 ?auto_72791 ) ) ( ON ?auto_72791 ?auto_72793 ) ( not ( = ?auto_72791 ?auto_72793 ) ) ( not ( = ?auto_72794 ?auto_72793 ) ) ( not ( = ?auto_72792 ?auto_72793 ) ) ( not ( = ?auto_72797 ?auto_72793 ) ) ( not ( = ?auto_72796 ?auto_72793 ) ) ( not ( = ?auto_72795 ?auto_72793 ) ) ( ON ?auto_72794 ?auto_72791 ) ( ON-TABLE ?auto_72793 ) ( ON ?auto_72795 ?auto_72794 ) ( ON ?auto_72796 ?auto_72795 ) ( ON ?auto_72797 ?auto_72796 ) ( ON ?auto_72792 ?auto_72797 ) ( CLEAR ?auto_72792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72793 ?auto_72791 ?auto_72794 ?auto_72795 ?auto_72796 ?auto_72797 )
      ( MAKE-1PILE ?auto_72791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72802 - BLOCK
      ?auto_72803 - BLOCK
      ?auto_72804 - BLOCK
      ?auto_72805 - BLOCK
    )
    :vars
    (
      ?auto_72806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72806 ?auto_72805 ) ( CLEAR ?auto_72806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72802 ) ( ON ?auto_72803 ?auto_72802 ) ( ON ?auto_72804 ?auto_72803 ) ( ON ?auto_72805 ?auto_72804 ) ( not ( = ?auto_72802 ?auto_72803 ) ) ( not ( = ?auto_72802 ?auto_72804 ) ) ( not ( = ?auto_72802 ?auto_72805 ) ) ( not ( = ?auto_72802 ?auto_72806 ) ) ( not ( = ?auto_72803 ?auto_72804 ) ) ( not ( = ?auto_72803 ?auto_72805 ) ) ( not ( = ?auto_72803 ?auto_72806 ) ) ( not ( = ?auto_72804 ?auto_72805 ) ) ( not ( = ?auto_72804 ?auto_72806 ) ) ( not ( = ?auto_72805 ?auto_72806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72806 ?auto_72805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72807 - BLOCK
      ?auto_72808 - BLOCK
      ?auto_72809 - BLOCK
      ?auto_72810 - BLOCK
    )
    :vars
    (
      ?auto_72811 - BLOCK
      ?auto_72812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72811 ?auto_72810 ) ( CLEAR ?auto_72811 ) ( ON-TABLE ?auto_72807 ) ( ON ?auto_72808 ?auto_72807 ) ( ON ?auto_72809 ?auto_72808 ) ( ON ?auto_72810 ?auto_72809 ) ( not ( = ?auto_72807 ?auto_72808 ) ) ( not ( = ?auto_72807 ?auto_72809 ) ) ( not ( = ?auto_72807 ?auto_72810 ) ) ( not ( = ?auto_72807 ?auto_72811 ) ) ( not ( = ?auto_72808 ?auto_72809 ) ) ( not ( = ?auto_72808 ?auto_72810 ) ) ( not ( = ?auto_72808 ?auto_72811 ) ) ( not ( = ?auto_72809 ?auto_72810 ) ) ( not ( = ?auto_72809 ?auto_72811 ) ) ( not ( = ?auto_72810 ?auto_72811 ) ) ( HOLDING ?auto_72812 ) ( not ( = ?auto_72807 ?auto_72812 ) ) ( not ( = ?auto_72808 ?auto_72812 ) ) ( not ( = ?auto_72809 ?auto_72812 ) ) ( not ( = ?auto_72810 ?auto_72812 ) ) ( not ( = ?auto_72811 ?auto_72812 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_72812 )
      ( MAKE-4PILE ?auto_72807 ?auto_72808 ?auto_72809 ?auto_72810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72813 - BLOCK
      ?auto_72814 - BLOCK
      ?auto_72815 - BLOCK
      ?auto_72816 - BLOCK
    )
    :vars
    (
      ?auto_72818 - BLOCK
      ?auto_72817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72818 ?auto_72816 ) ( ON-TABLE ?auto_72813 ) ( ON ?auto_72814 ?auto_72813 ) ( ON ?auto_72815 ?auto_72814 ) ( ON ?auto_72816 ?auto_72815 ) ( not ( = ?auto_72813 ?auto_72814 ) ) ( not ( = ?auto_72813 ?auto_72815 ) ) ( not ( = ?auto_72813 ?auto_72816 ) ) ( not ( = ?auto_72813 ?auto_72818 ) ) ( not ( = ?auto_72814 ?auto_72815 ) ) ( not ( = ?auto_72814 ?auto_72816 ) ) ( not ( = ?auto_72814 ?auto_72818 ) ) ( not ( = ?auto_72815 ?auto_72816 ) ) ( not ( = ?auto_72815 ?auto_72818 ) ) ( not ( = ?auto_72816 ?auto_72818 ) ) ( not ( = ?auto_72813 ?auto_72817 ) ) ( not ( = ?auto_72814 ?auto_72817 ) ) ( not ( = ?auto_72815 ?auto_72817 ) ) ( not ( = ?auto_72816 ?auto_72817 ) ) ( not ( = ?auto_72818 ?auto_72817 ) ) ( ON ?auto_72817 ?auto_72818 ) ( CLEAR ?auto_72817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72813 ?auto_72814 ?auto_72815 ?auto_72816 ?auto_72818 )
      ( MAKE-4PILE ?auto_72813 ?auto_72814 ?auto_72815 ?auto_72816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72819 - BLOCK
      ?auto_72820 - BLOCK
      ?auto_72821 - BLOCK
      ?auto_72822 - BLOCK
    )
    :vars
    (
      ?auto_72823 - BLOCK
      ?auto_72824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72823 ?auto_72822 ) ( ON-TABLE ?auto_72819 ) ( ON ?auto_72820 ?auto_72819 ) ( ON ?auto_72821 ?auto_72820 ) ( ON ?auto_72822 ?auto_72821 ) ( not ( = ?auto_72819 ?auto_72820 ) ) ( not ( = ?auto_72819 ?auto_72821 ) ) ( not ( = ?auto_72819 ?auto_72822 ) ) ( not ( = ?auto_72819 ?auto_72823 ) ) ( not ( = ?auto_72820 ?auto_72821 ) ) ( not ( = ?auto_72820 ?auto_72822 ) ) ( not ( = ?auto_72820 ?auto_72823 ) ) ( not ( = ?auto_72821 ?auto_72822 ) ) ( not ( = ?auto_72821 ?auto_72823 ) ) ( not ( = ?auto_72822 ?auto_72823 ) ) ( not ( = ?auto_72819 ?auto_72824 ) ) ( not ( = ?auto_72820 ?auto_72824 ) ) ( not ( = ?auto_72821 ?auto_72824 ) ) ( not ( = ?auto_72822 ?auto_72824 ) ) ( not ( = ?auto_72823 ?auto_72824 ) ) ( HOLDING ?auto_72824 ) ( CLEAR ?auto_72823 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72819 ?auto_72820 ?auto_72821 ?auto_72822 ?auto_72823 ?auto_72824 )
      ( MAKE-4PILE ?auto_72819 ?auto_72820 ?auto_72821 ?auto_72822 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72825 - BLOCK
      ?auto_72826 - BLOCK
      ?auto_72827 - BLOCK
      ?auto_72828 - BLOCK
    )
    :vars
    (
      ?auto_72829 - BLOCK
      ?auto_72830 - BLOCK
      ?auto_72831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72829 ?auto_72828 ) ( ON-TABLE ?auto_72825 ) ( ON ?auto_72826 ?auto_72825 ) ( ON ?auto_72827 ?auto_72826 ) ( ON ?auto_72828 ?auto_72827 ) ( not ( = ?auto_72825 ?auto_72826 ) ) ( not ( = ?auto_72825 ?auto_72827 ) ) ( not ( = ?auto_72825 ?auto_72828 ) ) ( not ( = ?auto_72825 ?auto_72829 ) ) ( not ( = ?auto_72826 ?auto_72827 ) ) ( not ( = ?auto_72826 ?auto_72828 ) ) ( not ( = ?auto_72826 ?auto_72829 ) ) ( not ( = ?auto_72827 ?auto_72828 ) ) ( not ( = ?auto_72827 ?auto_72829 ) ) ( not ( = ?auto_72828 ?auto_72829 ) ) ( not ( = ?auto_72825 ?auto_72830 ) ) ( not ( = ?auto_72826 ?auto_72830 ) ) ( not ( = ?auto_72827 ?auto_72830 ) ) ( not ( = ?auto_72828 ?auto_72830 ) ) ( not ( = ?auto_72829 ?auto_72830 ) ) ( CLEAR ?auto_72829 ) ( ON ?auto_72830 ?auto_72831 ) ( CLEAR ?auto_72830 ) ( HAND-EMPTY ) ( not ( = ?auto_72825 ?auto_72831 ) ) ( not ( = ?auto_72826 ?auto_72831 ) ) ( not ( = ?auto_72827 ?auto_72831 ) ) ( not ( = ?auto_72828 ?auto_72831 ) ) ( not ( = ?auto_72829 ?auto_72831 ) ) ( not ( = ?auto_72830 ?auto_72831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72830 ?auto_72831 )
      ( MAKE-4PILE ?auto_72825 ?auto_72826 ?auto_72827 ?auto_72828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72846 - BLOCK
      ?auto_72847 - BLOCK
      ?auto_72848 - BLOCK
      ?auto_72849 - BLOCK
    )
    :vars
    (
      ?auto_72850 - BLOCK
      ?auto_72852 - BLOCK
      ?auto_72851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72846 ) ( ON ?auto_72847 ?auto_72846 ) ( ON ?auto_72848 ?auto_72847 ) ( not ( = ?auto_72846 ?auto_72847 ) ) ( not ( = ?auto_72846 ?auto_72848 ) ) ( not ( = ?auto_72846 ?auto_72849 ) ) ( not ( = ?auto_72846 ?auto_72850 ) ) ( not ( = ?auto_72847 ?auto_72848 ) ) ( not ( = ?auto_72847 ?auto_72849 ) ) ( not ( = ?auto_72847 ?auto_72850 ) ) ( not ( = ?auto_72848 ?auto_72849 ) ) ( not ( = ?auto_72848 ?auto_72850 ) ) ( not ( = ?auto_72849 ?auto_72850 ) ) ( not ( = ?auto_72846 ?auto_72852 ) ) ( not ( = ?auto_72847 ?auto_72852 ) ) ( not ( = ?auto_72848 ?auto_72852 ) ) ( not ( = ?auto_72849 ?auto_72852 ) ) ( not ( = ?auto_72850 ?auto_72852 ) ) ( ON ?auto_72852 ?auto_72851 ) ( not ( = ?auto_72846 ?auto_72851 ) ) ( not ( = ?auto_72847 ?auto_72851 ) ) ( not ( = ?auto_72848 ?auto_72851 ) ) ( not ( = ?auto_72849 ?auto_72851 ) ) ( not ( = ?auto_72850 ?auto_72851 ) ) ( not ( = ?auto_72852 ?auto_72851 ) ) ( ON ?auto_72850 ?auto_72852 ) ( CLEAR ?auto_72850 ) ( HOLDING ?auto_72849 ) ( CLEAR ?auto_72848 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72846 ?auto_72847 ?auto_72848 ?auto_72849 ?auto_72850 )
      ( MAKE-4PILE ?auto_72846 ?auto_72847 ?auto_72848 ?auto_72849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72853 - BLOCK
      ?auto_72854 - BLOCK
      ?auto_72855 - BLOCK
      ?auto_72856 - BLOCK
    )
    :vars
    (
      ?auto_72858 - BLOCK
      ?auto_72857 - BLOCK
      ?auto_72859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72853 ) ( ON ?auto_72854 ?auto_72853 ) ( ON ?auto_72855 ?auto_72854 ) ( not ( = ?auto_72853 ?auto_72854 ) ) ( not ( = ?auto_72853 ?auto_72855 ) ) ( not ( = ?auto_72853 ?auto_72856 ) ) ( not ( = ?auto_72853 ?auto_72858 ) ) ( not ( = ?auto_72854 ?auto_72855 ) ) ( not ( = ?auto_72854 ?auto_72856 ) ) ( not ( = ?auto_72854 ?auto_72858 ) ) ( not ( = ?auto_72855 ?auto_72856 ) ) ( not ( = ?auto_72855 ?auto_72858 ) ) ( not ( = ?auto_72856 ?auto_72858 ) ) ( not ( = ?auto_72853 ?auto_72857 ) ) ( not ( = ?auto_72854 ?auto_72857 ) ) ( not ( = ?auto_72855 ?auto_72857 ) ) ( not ( = ?auto_72856 ?auto_72857 ) ) ( not ( = ?auto_72858 ?auto_72857 ) ) ( ON ?auto_72857 ?auto_72859 ) ( not ( = ?auto_72853 ?auto_72859 ) ) ( not ( = ?auto_72854 ?auto_72859 ) ) ( not ( = ?auto_72855 ?auto_72859 ) ) ( not ( = ?auto_72856 ?auto_72859 ) ) ( not ( = ?auto_72858 ?auto_72859 ) ) ( not ( = ?auto_72857 ?auto_72859 ) ) ( ON ?auto_72858 ?auto_72857 ) ( CLEAR ?auto_72855 ) ( ON ?auto_72856 ?auto_72858 ) ( CLEAR ?auto_72856 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72859 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72859 ?auto_72857 ?auto_72858 )
      ( MAKE-4PILE ?auto_72853 ?auto_72854 ?auto_72855 ?auto_72856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72860 - BLOCK
      ?auto_72861 - BLOCK
      ?auto_72862 - BLOCK
      ?auto_72863 - BLOCK
    )
    :vars
    (
      ?auto_72865 - BLOCK
      ?auto_72864 - BLOCK
      ?auto_72866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72860 ) ( ON ?auto_72861 ?auto_72860 ) ( not ( = ?auto_72860 ?auto_72861 ) ) ( not ( = ?auto_72860 ?auto_72862 ) ) ( not ( = ?auto_72860 ?auto_72863 ) ) ( not ( = ?auto_72860 ?auto_72865 ) ) ( not ( = ?auto_72861 ?auto_72862 ) ) ( not ( = ?auto_72861 ?auto_72863 ) ) ( not ( = ?auto_72861 ?auto_72865 ) ) ( not ( = ?auto_72862 ?auto_72863 ) ) ( not ( = ?auto_72862 ?auto_72865 ) ) ( not ( = ?auto_72863 ?auto_72865 ) ) ( not ( = ?auto_72860 ?auto_72864 ) ) ( not ( = ?auto_72861 ?auto_72864 ) ) ( not ( = ?auto_72862 ?auto_72864 ) ) ( not ( = ?auto_72863 ?auto_72864 ) ) ( not ( = ?auto_72865 ?auto_72864 ) ) ( ON ?auto_72864 ?auto_72866 ) ( not ( = ?auto_72860 ?auto_72866 ) ) ( not ( = ?auto_72861 ?auto_72866 ) ) ( not ( = ?auto_72862 ?auto_72866 ) ) ( not ( = ?auto_72863 ?auto_72866 ) ) ( not ( = ?auto_72865 ?auto_72866 ) ) ( not ( = ?auto_72864 ?auto_72866 ) ) ( ON ?auto_72865 ?auto_72864 ) ( ON ?auto_72863 ?auto_72865 ) ( CLEAR ?auto_72863 ) ( ON-TABLE ?auto_72866 ) ( HOLDING ?auto_72862 ) ( CLEAR ?auto_72861 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72860 ?auto_72861 ?auto_72862 )
      ( MAKE-4PILE ?auto_72860 ?auto_72861 ?auto_72862 ?auto_72863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72867 - BLOCK
      ?auto_72868 - BLOCK
      ?auto_72869 - BLOCK
      ?auto_72870 - BLOCK
    )
    :vars
    (
      ?auto_72871 - BLOCK
      ?auto_72873 - BLOCK
      ?auto_72872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72867 ) ( ON ?auto_72868 ?auto_72867 ) ( not ( = ?auto_72867 ?auto_72868 ) ) ( not ( = ?auto_72867 ?auto_72869 ) ) ( not ( = ?auto_72867 ?auto_72870 ) ) ( not ( = ?auto_72867 ?auto_72871 ) ) ( not ( = ?auto_72868 ?auto_72869 ) ) ( not ( = ?auto_72868 ?auto_72870 ) ) ( not ( = ?auto_72868 ?auto_72871 ) ) ( not ( = ?auto_72869 ?auto_72870 ) ) ( not ( = ?auto_72869 ?auto_72871 ) ) ( not ( = ?auto_72870 ?auto_72871 ) ) ( not ( = ?auto_72867 ?auto_72873 ) ) ( not ( = ?auto_72868 ?auto_72873 ) ) ( not ( = ?auto_72869 ?auto_72873 ) ) ( not ( = ?auto_72870 ?auto_72873 ) ) ( not ( = ?auto_72871 ?auto_72873 ) ) ( ON ?auto_72873 ?auto_72872 ) ( not ( = ?auto_72867 ?auto_72872 ) ) ( not ( = ?auto_72868 ?auto_72872 ) ) ( not ( = ?auto_72869 ?auto_72872 ) ) ( not ( = ?auto_72870 ?auto_72872 ) ) ( not ( = ?auto_72871 ?auto_72872 ) ) ( not ( = ?auto_72873 ?auto_72872 ) ) ( ON ?auto_72871 ?auto_72873 ) ( ON ?auto_72870 ?auto_72871 ) ( ON-TABLE ?auto_72872 ) ( CLEAR ?auto_72868 ) ( ON ?auto_72869 ?auto_72870 ) ( CLEAR ?auto_72869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72872 ?auto_72873 ?auto_72871 ?auto_72870 )
      ( MAKE-4PILE ?auto_72867 ?auto_72868 ?auto_72869 ?auto_72870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72874 - BLOCK
      ?auto_72875 - BLOCK
      ?auto_72876 - BLOCK
      ?auto_72877 - BLOCK
    )
    :vars
    (
      ?auto_72879 - BLOCK
      ?auto_72878 - BLOCK
      ?auto_72880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72874 ) ( not ( = ?auto_72874 ?auto_72875 ) ) ( not ( = ?auto_72874 ?auto_72876 ) ) ( not ( = ?auto_72874 ?auto_72877 ) ) ( not ( = ?auto_72874 ?auto_72879 ) ) ( not ( = ?auto_72875 ?auto_72876 ) ) ( not ( = ?auto_72875 ?auto_72877 ) ) ( not ( = ?auto_72875 ?auto_72879 ) ) ( not ( = ?auto_72876 ?auto_72877 ) ) ( not ( = ?auto_72876 ?auto_72879 ) ) ( not ( = ?auto_72877 ?auto_72879 ) ) ( not ( = ?auto_72874 ?auto_72878 ) ) ( not ( = ?auto_72875 ?auto_72878 ) ) ( not ( = ?auto_72876 ?auto_72878 ) ) ( not ( = ?auto_72877 ?auto_72878 ) ) ( not ( = ?auto_72879 ?auto_72878 ) ) ( ON ?auto_72878 ?auto_72880 ) ( not ( = ?auto_72874 ?auto_72880 ) ) ( not ( = ?auto_72875 ?auto_72880 ) ) ( not ( = ?auto_72876 ?auto_72880 ) ) ( not ( = ?auto_72877 ?auto_72880 ) ) ( not ( = ?auto_72879 ?auto_72880 ) ) ( not ( = ?auto_72878 ?auto_72880 ) ) ( ON ?auto_72879 ?auto_72878 ) ( ON ?auto_72877 ?auto_72879 ) ( ON-TABLE ?auto_72880 ) ( ON ?auto_72876 ?auto_72877 ) ( CLEAR ?auto_72876 ) ( HOLDING ?auto_72875 ) ( CLEAR ?auto_72874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72874 ?auto_72875 )
      ( MAKE-4PILE ?auto_72874 ?auto_72875 ?auto_72876 ?auto_72877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72881 - BLOCK
      ?auto_72882 - BLOCK
      ?auto_72883 - BLOCK
      ?auto_72884 - BLOCK
    )
    :vars
    (
      ?auto_72886 - BLOCK
      ?auto_72885 - BLOCK
      ?auto_72887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72881 ) ( not ( = ?auto_72881 ?auto_72882 ) ) ( not ( = ?auto_72881 ?auto_72883 ) ) ( not ( = ?auto_72881 ?auto_72884 ) ) ( not ( = ?auto_72881 ?auto_72886 ) ) ( not ( = ?auto_72882 ?auto_72883 ) ) ( not ( = ?auto_72882 ?auto_72884 ) ) ( not ( = ?auto_72882 ?auto_72886 ) ) ( not ( = ?auto_72883 ?auto_72884 ) ) ( not ( = ?auto_72883 ?auto_72886 ) ) ( not ( = ?auto_72884 ?auto_72886 ) ) ( not ( = ?auto_72881 ?auto_72885 ) ) ( not ( = ?auto_72882 ?auto_72885 ) ) ( not ( = ?auto_72883 ?auto_72885 ) ) ( not ( = ?auto_72884 ?auto_72885 ) ) ( not ( = ?auto_72886 ?auto_72885 ) ) ( ON ?auto_72885 ?auto_72887 ) ( not ( = ?auto_72881 ?auto_72887 ) ) ( not ( = ?auto_72882 ?auto_72887 ) ) ( not ( = ?auto_72883 ?auto_72887 ) ) ( not ( = ?auto_72884 ?auto_72887 ) ) ( not ( = ?auto_72886 ?auto_72887 ) ) ( not ( = ?auto_72885 ?auto_72887 ) ) ( ON ?auto_72886 ?auto_72885 ) ( ON ?auto_72884 ?auto_72886 ) ( ON-TABLE ?auto_72887 ) ( ON ?auto_72883 ?auto_72884 ) ( CLEAR ?auto_72881 ) ( ON ?auto_72882 ?auto_72883 ) ( CLEAR ?auto_72882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72887 ?auto_72885 ?auto_72886 ?auto_72884 ?auto_72883 )
      ( MAKE-4PILE ?auto_72881 ?auto_72882 ?auto_72883 ?auto_72884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72888 - BLOCK
      ?auto_72889 - BLOCK
      ?auto_72890 - BLOCK
      ?auto_72891 - BLOCK
    )
    :vars
    (
      ?auto_72892 - BLOCK
      ?auto_72893 - BLOCK
      ?auto_72894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72888 ?auto_72889 ) ) ( not ( = ?auto_72888 ?auto_72890 ) ) ( not ( = ?auto_72888 ?auto_72891 ) ) ( not ( = ?auto_72888 ?auto_72892 ) ) ( not ( = ?auto_72889 ?auto_72890 ) ) ( not ( = ?auto_72889 ?auto_72891 ) ) ( not ( = ?auto_72889 ?auto_72892 ) ) ( not ( = ?auto_72890 ?auto_72891 ) ) ( not ( = ?auto_72890 ?auto_72892 ) ) ( not ( = ?auto_72891 ?auto_72892 ) ) ( not ( = ?auto_72888 ?auto_72893 ) ) ( not ( = ?auto_72889 ?auto_72893 ) ) ( not ( = ?auto_72890 ?auto_72893 ) ) ( not ( = ?auto_72891 ?auto_72893 ) ) ( not ( = ?auto_72892 ?auto_72893 ) ) ( ON ?auto_72893 ?auto_72894 ) ( not ( = ?auto_72888 ?auto_72894 ) ) ( not ( = ?auto_72889 ?auto_72894 ) ) ( not ( = ?auto_72890 ?auto_72894 ) ) ( not ( = ?auto_72891 ?auto_72894 ) ) ( not ( = ?auto_72892 ?auto_72894 ) ) ( not ( = ?auto_72893 ?auto_72894 ) ) ( ON ?auto_72892 ?auto_72893 ) ( ON ?auto_72891 ?auto_72892 ) ( ON-TABLE ?auto_72894 ) ( ON ?auto_72890 ?auto_72891 ) ( ON ?auto_72889 ?auto_72890 ) ( CLEAR ?auto_72889 ) ( HOLDING ?auto_72888 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72888 )
      ( MAKE-4PILE ?auto_72888 ?auto_72889 ?auto_72890 ?auto_72891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72895 - BLOCK
      ?auto_72896 - BLOCK
      ?auto_72897 - BLOCK
      ?auto_72898 - BLOCK
    )
    :vars
    (
      ?auto_72900 - BLOCK
      ?auto_72899 - BLOCK
      ?auto_72901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72895 ?auto_72896 ) ) ( not ( = ?auto_72895 ?auto_72897 ) ) ( not ( = ?auto_72895 ?auto_72898 ) ) ( not ( = ?auto_72895 ?auto_72900 ) ) ( not ( = ?auto_72896 ?auto_72897 ) ) ( not ( = ?auto_72896 ?auto_72898 ) ) ( not ( = ?auto_72896 ?auto_72900 ) ) ( not ( = ?auto_72897 ?auto_72898 ) ) ( not ( = ?auto_72897 ?auto_72900 ) ) ( not ( = ?auto_72898 ?auto_72900 ) ) ( not ( = ?auto_72895 ?auto_72899 ) ) ( not ( = ?auto_72896 ?auto_72899 ) ) ( not ( = ?auto_72897 ?auto_72899 ) ) ( not ( = ?auto_72898 ?auto_72899 ) ) ( not ( = ?auto_72900 ?auto_72899 ) ) ( ON ?auto_72899 ?auto_72901 ) ( not ( = ?auto_72895 ?auto_72901 ) ) ( not ( = ?auto_72896 ?auto_72901 ) ) ( not ( = ?auto_72897 ?auto_72901 ) ) ( not ( = ?auto_72898 ?auto_72901 ) ) ( not ( = ?auto_72900 ?auto_72901 ) ) ( not ( = ?auto_72899 ?auto_72901 ) ) ( ON ?auto_72900 ?auto_72899 ) ( ON ?auto_72898 ?auto_72900 ) ( ON-TABLE ?auto_72901 ) ( ON ?auto_72897 ?auto_72898 ) ( ON ?auto_72896 ?auto_72897 ) ( ON ?auto_72895 ?auto_72896 ) ( CLEAR ?auto_72895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72901 ?auto_72899 ?auto_72900 ?auto_72898 ?auto_72897 ?auto_72896 )
      ( MAKE-4PILE ?auto_72895 ?auto_72896 ?auto_72897 ?auto_72898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72904 - BLOCK
      ?auto_72905 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72905 ) ( CLEAR ?auto_72904 ) ( ON-TABLE ?auto_72904 ) ( not ( = ?auto_72904 ?auto_72905 ) ) )
    :subtasks
    ( ( !STACK ?auto_72905 ?auto_72904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72906 - BLOCK
      ?auto_72907 - BLOCK
    )
    :vars
    (
      ?auto_72908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72906 ) ( ON-TABLE ?auto_72906 ) ( not ( = ?auto_72906 ?auto_72907 ) ) ( ON ?auto_72907 ?auto_72908 ) ( CLEAR ?auto_72907 ) ( HAND-EMPTY ) ( not ( = ?auto_72906 ?auto_72908 ) ) ( not ( = ?auto_72907 ?auto_72908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72907 ?auto_72908 )
      ( MAKE-2PILE ?auto_72906 ?auto_72907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72909 - BLOCK
      ?auto_72910 - BLOCK
    )
    :vars
    (
      ?auto_72911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72909 ?auto_72910 ) ) ( ON ?auto_72910 ?auto_72911 ) ( CLEAR ?auto_72910 ) ( not ( = ?auto_72909 ?auto_72911 ) ) ( not ( = ?auto_72910 ?auto_72911 ) ) ( HOLDING ?auto_72909 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72909 )
      ( MAKE-2PILE ?auto_72909 ?auto_72910 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72912 - BLOCK
      ?auto_72913 - BLOCK
    )
    :vars
    (
      ?auto_72914 - BLOCK
      ?auto_72917 - BLOCK
      ?auto_72915 - BLOCK
      ?auto_72916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72912 ?auto_72913 ) ) ( ON ?auto_72913 ?auto_72914 ) ( not ( = ?auto_72912 ?auto_72914 ) ) ( not ( = ?auto_72913 ?auto_72914 ) ) ( ON ?auto_72912 ?auto_72913 ) ( CLEAR ?auto_72912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72917 ) ( ON ?auto_72915 ?auto_72917 ) ( ON ?auto_72916 ?auto_72915 ) ( ON ?auto_72914 ?auto_72916 ) ( not ( = ?auto_72917 ?auto_72915 ) ) ( not ( = ?auto_72917 ?auto_72916 ) ) ( not ( = ?auto_72917 ?auto_72914 ) ) ( not ( = ?auto_72917 ?auto_72913 ) ) ( not ( = ?auto_72917 ?auto_72912 ) ) ( not ( = ?auto_72915 ?auto_72916 ) ) ( not ( = ?auto_72915 ?auto_72914 ) ) ( not ( = ?auto_72915 ?auto_72913 ) ) ( not ( = ?auto_72915 ?auto_72912 ) ) ( not ( = ?auto_72916 ?auto_72914 ) ) ( not ( = ?auto_72916 ?auto_72913 ) ) ( not ( = ?auto_72916 ?auto_72912 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72917 ?auto_72915 ?auto_72916 ?auto_72914 ?auto_72913 )
      ( MAKE-2PILE ?auto_72912 ?auto_72913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72918 - BLOCK
      ?auto_72919 - BLOCK
    )
    :vars
    (
      ?auto_72922 - BLOCK
      ?auto_72921 - BLOCK
      ?auto_72923 - BLOCK
      ?auto_72920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72918 ?auto_72919 ) ) ( ON ?auto_72919 ?auto_72922 ) ( not ( = ?auto_72918 ?auto_72922 ) ) ( not ( = ?auto_72919 ?auto_72922 ) ) ( ON-TABLE ?auto_72921 ) ( ON ?auto_72923 ?auto_72921 ) ( ON ?auto_72920 ?auto_72923 ) ( ON ?auto_72922 ?auto_72920 ) ( not ( = ?auto_72921 ?auto_72923 ) ) ( not ( = ?auto_72921 ?auto_72920 ) ) ( not ( = ?auto_72921 ?auto_72922 ) ) ( not ( = ?auto_72921 ?auto_72919 ) ) ( not ( = ?auto_72921 ?auto_72918 ) ) ( not ( = ?auto_72923 ?auto_72920 ) ) ( not ( = ?auto_72923 ?auto_72922 ) ) ( not ( = ?auto_72923 ?auto_72919 ) ) ( not ( = ?auto_72923 ?auto_72918 ) ) ( not ( = ?auto_72920 ?auto_72922 ) ) ( not ( = ?auto_72920 ?auto_72919 ) ) ( not ( = ?auto_72920 ?auto_72918 ) ) ( HOLDING ?auto_72918 ) ( CLEAR ?auto_72919 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72921 ?auto_72923 ?auto_72920 ?auto_72922 ?auto_72919 ?auto_72918 )
      ( MAKE-2PILE ?auto_72918 ?auto_72919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72924 - BLOCK
      ?auto_72925 - BLOCK
    )
    :vars
    (
      ?auto_72929 - BLOCK
      ?auto_72926 - BLOCK
      ?auto_72927 - BLOCK
      ?auto_72928 - BLOCK
      ?auto_72930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72924 ?auto_72925 ) ) ( ON ?auto_72925 ?auto_72929 ) ( not ( = ?auto_72924 ?auto_72929 ) ) ( not ( = ?auto_72925 ?auto_72929 ) ) ( ON-TABLE ?auto_72926 ) ( ON ?auto_72927 ?auto_72926 ) ( ON ?auto_72928 ?auto_72927 ) ( ON ?auto_72929 ?auto_72928 ) ( not ( = ?auto_72926 ?auto_72927 ) ) ( not ( = ?auto_72926 ?auto_72928 ) ) ( not ( = ?auto_72926 ?auto_72929 ) ) ( not ( = ?auto_72926 ?auto_72925 ) ) ( not ( = ?auto_72926 ?auto_72924 ) ) ( not ( = ?auto_72927 ?auto_72928 ) ) ( not ( = ?auto_72927 ?auto_72929 ) ) ( not ( = ?auto_72927 ?auto_72925 ) ) ( not ( = ?auto_72927 ?auto_72924 ) ) ( not ( = ?auto_72928 ?auto_72929 ) ) ( not ( = ?auto_72928 ?auto_72925 ) ) ( not ( = ?auto_72928 ?auto_72924 ) ) ( CLEAR ?auto_72925 ) ( ON ?auto_72924 ?auto_72930 ) ( CLEAR ?auto_72924 ) ( HAND-EMPTY ) ( not ( = ?auto_72924 ?auto_72930 ) ) ( not ( = ?auto_72925 ?auto_72930 ) ) ( not ( = ?auto_72929 ?auto_72930 ) ) ( not ( = ?auto_72926 ?auto_72930 ) ) ( not ( = ?auto_72927 ?auto_72930 ) ) ( not ( = ?auto_72928 ?auto_72930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72924 ?auto_72930 )
      ( MAKE-2PILE ?auto_72924 ?auto_72925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72931 - BLOCK
      ?auto_72932 - BLOCK
    )
    :vars
    (
      ?auto_72935 - BLOCK
      ?auto_72937 - BLOCK
      ?auto_72933 - BLOCK
      ?auto_72936 - BLOCK
      ?auto_72934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72931 ?auto_72932 ) ) ( not ( = ?auto_72931 ?auto_72935 ) ) ( not ( = ?auto_72932 ?auto_72935 ) ) ( ON-TABLE ?auto_72937 ) ( ON ?auto_72933 ?auto_72937 ) ( ON ?auto_72936 ?auto_72933 ) ( ON ?auto_72935 ?auto_72936 ) ( not ( = ?auto_72937 ?auto_72933 ) ) ( not ( = ?auto_72937 ?auto_72936 ) ) ( not ( = ?auto_72937 ?auto_72935 ) ) ( not ( = ?auto_72937 ?auto_72932 ) ) ( not ( = ?auto_72937 ?auto_72931 ) ) ( not ( = ?auto_72933 ?auto_72936 ) ) ( not ( = ?auto_72933 ?auto_72935 ) ) ( not ( = ?auto_72933 ?auto_72932 ) ) ( not ( = ?auto_72933 ?auto_72931 ) ) ( not ( = ?auto_72936 ?auto_72935 ) ) ( not ( = ?auto_72936 ?auto_72932 ) ) ( not ( = ?auto_72936 ?auto_72931 ) ) ( ON ?auto_72931 ?auto_72934 ) ( CLEAR ?auto_72931 ) ( not ( = ?auto_72931 ?auto_72934 ) ) ( not ( = ?auto_72932 ?auto_72934 ) ) ( not ( = ?auto_72935 ?auto_72934 ) ) ( not ( = ?auto_72937 ?auto_72934 ) ) ( not ( = ?auto_72933 ?auto_72934 ) ) ( not ( = ?auto_72936 ?auto_72934 ) ) ( HOLDING ?auto_72932 ) ( CLEAR ?auto_72935 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72937 ?auto_72933 ?auto_72936 ?auto_72935 ?auto_72932 )
      ( MAKE-2PILE ?auto_72931 ?auto_72932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72938 - BLOCK
      ?auto_72939 - BLOCK
    )
    :vars
    (
      ?auto_72944 - BLOCK
      ?auto_72942 - BLOCK
      ?auto_72943 - BLOCK
      ?auto_72941 - BLOCK
      ?auto_72940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72938 ?auto_72939 ) ) ( not ( = ?auto_72938 ?auto_72944 ) ) ( not ( = ?auto_72939 ?auto_72944 ) ) ( ON-TABLE ?auto_72942 ) ( ON ?auto_72943 ?auto_72942 ) ( ON ?auto_72941 ?auto_72943 ) ( ON ?auto_72944 ?auto_72941 ) ( not ( = ?auto_72942 ?auto_72943 ) ) ( not ( = ?auto_72942 ?auto_72941 ) ) ( not ( = ?auto_72942 ?auto_72944 ) ) ( not ( = ?auto_72942 ?auto_72939 ) ) ( not ( = ?auto_72942 ?auto_72938 ) ) ( not ( = ?auto_72943 ?auto_72941 ) ) ( not ( = ?auto_72943 ?auto_72944 ) ) ( not ( = ?auto_72943 ?auto_72939 ) ) ( not ( = ?auto_72943 ?auto_72938 ) ) ( not ( = ?auto_72941 ?auto_72944 ) ) ( not ( = ?auto_72941 ?auto_72939 ) ) ( not ( = ?auto_72941 ?auto_72938 ) ) ( ON ?auto_72938 ?auto_72940 ) ( not ( = ?auto_72938 ?auto_72940 ) ) ( not ( = ?auto_72939 ?auto_72940 ) ) ( not ( = ?auto_72944 ?auto_72940 ) ) ( not ( = ?auto_72942 ?auto_72940 ) ) ( not ( = ?auto_72943 ?auto_72940 ) ) ( not ( = ?auto_72941 ?auto_72940 ) ) ( CLEAR ?auto_72944 ) ( ON ?auto_72939 ?auto_72938 ) ( CLEAR ?auto_72939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72940 ?auto_72938 )
      ( MAKE-2PILE ?auto_72938 ?auto_72939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72945 - BLOCK
      ?auto_72946 - BLOCK
    )
    :vars
    (
      ?auto_72951 - BLOCK
      ?auto_72950 - BLOCK
      ?auto_72947 - BLOCK
      ?auto_72949 - BLOCK
      ?auto_72948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72945 ?auto_72946 ) ) ( not ( = ?auto_72945 ?auto_72951 ) ) ( not ( = ?auto_72946 ?auto_72951 ) ) ( ON-TABLE ?auto_72950 ) ( ON ?auto_72947 ?auto_72950 ) ( ON ?auto_72949 ?auto_72947 ) ( not ( = ?auto_72950 ?auto_72947 ) ) ( not ( = ?auto_72950 ?auto_72949 ) ) ( not ( = ?auto_72950 ?auto_72951 ) ) ( not ( = ?auto_72950 ?auto_72946 ) ) ( not ( = ?auto_72950 ?auto_72945 ) ) ( not ( = ?auto_72947 ?auto_72949 ) ) ( not ( = ?auto_72947 ?auto_72951 ) ) ( not ( = ?auto_72947 ?auto_72946 ) ) ( not ( = ?auto_72947 ?auto_72945 ) ) ( not ( = ?auto_72949 ?auto_72951 ) ) ( not ( = ?auto_72949 ?auto_72946 ) ) ( not ( = ?auto_72949 ?auto_72945 ) ) ( ON ?auto_72945 ?auto_72948 ) ( not ( = ?auto_72945 ?auto_72948 ) ) ( not ( = ?auto_72946 ?auto_72948 ) ) ( not ( = ?auto_72951 ?auto_72948 ) ) ( not ( = ?auto_72950 ?auto_72948 ) ) ( not ( = ?auto_72947 ?auto_72948 ) ) ( not ( = ?auto_72949 ?auto_72948 ) ) ( ON ?auto_72946 ?auto_72945 ) ( CLEAR ?auto_72946 ) ( ON-TABLE ?auto_72948 ) ( HOLDING ?auto_72951 ) ( CLEAR ?auto_72949 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72950 ?auto_72947 ?auto_72949 ?auto_72951 )
      ( MAKE-2PILE ?auto_72945 ?auto_72946 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72952 - BLOCK
      ?auto_72953 - BLOCK
    )
    :vars
    (
      ?auto_72958 - BLOCK
      ?auto_72955 - BLOCK
      ?auto_72956 - BLOCK
      ?auto_72957 - BLOCK
      ?auto_72954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72952 ?auto_72953 ) ) ( not ( = ?auto_72952 ?auto_72958 ) ) ( not ( = ?auto_72953 ?auto_72958 ) ) ( ON-TABLE ?auto_72955 ) ( ON ?auto_72956 ?auto_72955 ) ( ON ?auto_72957 ?auto_72956 ) ( not ( = ?auto_72955 ?auto_72956 ) ) ( not ( = ?auto_72955 ?auto_72957 ) ) ( not ( = ?auto_72955 ?auto_72958 ) ) ( not ( = ?auto_72955 ?auto_72953 ) ) ( not ( = ?auto_72955 ?auto_72952 ) ) ( not ( = ?auto_72956 ?auto_72957 ) ) ( not ( = ?auto_72956 ?auto_72958 ) ) ( not ( = ?auto_72956 ?auto_72953 ) ) ( not ( = ?auto_72956 ?auto_72952 ) ) ( not ( = ?auto_72957 ?auto_72958 ) ) ( not ( = ?auto_72957 ?auto_72953 ) ) ( not ( = ?auto_72957 ?auto_72952 ) ) ( ON ?auto_72952 ?auto_72954 ) ( not ( = ?auto_72952 ?auto_72954 ) ) ( not ( = ?auto_72953 ?auto_72954 ) ) ( not ( = ?auto_72958 ?auto_72954 ) ) ( not ( = ?auto_72955 ?auto_72954 ) ) ( not ( = ?auto_72956 ?auto_72954 ) ) ( not ( = ?auto_72957 ?auto_72954 ) ) ( ON ?auto_72953 ?auto_72952 ) ( ON-TABLE ?auto_72954 ) ( CLEAR ?auto_72957 ) ( ON ?auto_72958 ?auto_72953 ) ( CLEAR ?auto_72958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72954 ?auto_72952 ?auto_72953 )
      ( MAKE-2PILE ?auto_72952 ?auto_72953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72959 - BLOCK
      ?auto_72960 - BLOCK
    )
    :vars
    (
      ?auto_72965 - BLOCK
      ?auto_72962 - BLOCK
      ?auto_72964 - BLOCK
      ?auto_72961 - BLOCK
      ?auto_72963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72959 ?auto_72960 ) ) ( not ( = ?auto_72959 ?auto_72965 ) ) ( not ( = ?auto_72960 ?auto_72965 ) ) ( ON-TABLE ?auto_72962 ) ( ON ?auto_72964 ?auto_72962 ) ( not ( = ?auto_72962 ?auto_72964 ) ) ( not ( = ?auto_72962 ?auto_72961 ) ) ( not ( = ?auto_72962 ?auto_72965 ) ) ( not ( = ?auto_72962 ?auto_72960 ) ) ( not ( = ?auto_72962 ?auto_72959 ) ) ( not ( = ?auto_72964 ?auto_72961 ) ) ( not ( = ?auto_72964 ?auto_72965 ) ) ( not ( = ?auto_72964 ?auto_72960 ) ) ( not ( = ?auto_72964 ?auto_72959 ) ) ( not ( = ?auto_72961 ?auto_72965 ) ) ( not ( = ?auto_72961 ?auto_72960 ) ) ( not ( = ?auto_72961 ?auto_72959 ) ) ( ON ?auto_72959 ?auto_72963 ) ( not ( = ?auto_72959 ?auto_72963 ) ) ( not ( = ?auto_72960 ?auto_72963 ) ) ( not ( = ?auto_72965 ?auto_72963 ) ) ( not ( = ?auto_72962 ?auto_72963 ) ) ( not ( = ?auto_72964 ?auto_72963 ) ) ( not ( = ?auto_72961 ?auto_72963 ) ) ( ON ?auto_72960 ?auto_72959 ) ( ON-TABLE ?auto_72963 ) ( ON ?auto_72965 ?auto_72960 ) ( CLEAR ?auto_72965 ) ( HOLDING ?auto_72961 ) ( CLEAR ?auto_72964 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72962 ?auto_72964 ?auto_72961 )
      ( MAKE-2PILE ?auto_72959 ?auto_72960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72966 - BLOCK
      ?auto_72967 - BLOCK
    )
    :vars
    (
      ?auto_72972 - BLOCK
      ?auto_72969 - BLOCK
      ?auto_72970 - BLOCK
      ?auto_72971 - BLOCK
      ?auto_72968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72966 ?auto_72967 ) ) ( not ( = ?auto_72966 ?auto_72972 ) ) ( not ( = ?auto_72967 ?auto_72972 ) ) ( ON-TABLE ?auto_72969 ) ( ON ?auto_72970 ?auto_72969 ) ( not ( = ?auto_72969 ?auto_72970 ) ) ( not ( = ?auto_72969 ?auto_72971 ) ) ( not ( = ?auto_72969 ?auto_72972 ) ) ( not ( = ?auto_72969 ?auto_72967 ) ) ( not ( = ?auto_72969 ?auto_72966 ) ) ( not ( = ?auto_72970 ?auto_72971 ) ) ( not ( = ?auto_72970 ?auto_72972 ) ) ( not ( = ?auto_72970 ?auto_72967 ) ) ( not ( = ?auto_72970 ?auto_72966 ) ) ( not ( = ?auto_72971 ?auto_72972 ) ) ( not ( = ?auto_72971 ?auto_72967 ) ) ( not ( = ?auto_72971 ?auto_72966 ) ) ( ON ?auto_72966 ?auto_72968 ) ( not ( = ?auto_72966 ?auto_72968 ) ) ( not ( = ?auto_72967 ?auto_72968 ) ) ( not ( = ?auto_72972 ?auto_72968 ) ) ( not ( = ?auto_72969 ?auto_72968 ) ) ( not ( = ?auto_72970 ?auto_72968 ) ) ( not ( = ?auto_72971 ?auto_72968 ) ) ( ON ?auto_72967 ?auto_72966 ) ( ON-TABLE ?auto_72968 ) ( ON ?auto_72972 ?auto_72967 ) ( CLEAR ?auto_72970 ) ( ON ?auto_72971 ?auto_72972 ) ( CLEAR ?auto_72971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72968 ?auto_72966 ?auto_72967 ?auto_72972 )
      ( MAKE-2PILE ?auto_72966 ?auto_72967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72973 - BLOCK
      ?auto_72974 - BLOCK
    )
    :vars
    (
      ?auto_72976 - BLOCK
      ?auto_72979 - BLOCK
      ?auto_72978 - BLOCK
      ?auto_72977 - BLOCK
      ?auto_72975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72973 ?auto_72974 ) ) ( not ( = ?auto_72973 ?auto_72976 ) ) ( not ( = ?auto_72974 ?auto_72976 ) ) ( ON-TABLE ?auto_72979 ) ( not ( = ?auto_72979 ?auto_72978 ) ) ( not ( = ?auto_72979 ?auto_72977 ) ) ( not ( = ?auto_72979 ?auto_72976 ) ) ( not ( = ?auto_72979 ?auto_72974 ) ) ( not ( = ?auto_72979 ?auto_72973 ) ) ( not ( = ?auto_72978 ?auto_72977 ) ) ( not ( = ?auto_72978 ?auto_72976 ) ) ( not ( = ?auto_72978 ?auto_72974 ) ) ( not ( = ?auto_72978 ?auto_72973 ) ) ( not ( = ?auto_72977 ?auto_72976 ) ) ( not ( = ?auto_72977 ?auto_72974 ) ) ( not ( = ?auto_72977 ?auto_72973 ) ) ( ON ?auto_72973 ?auto_72975 ) ( not ( = ?auto_72973 ?auto_72975 ) ) ( not ( = ?auto_72974 ?auto_72975 ) ) ( not ( = ?auto_72976 ?auto_72975 ) ) ( not ( = ?auto_72979 ?auto_72975 ) ) ( not ( = ?auto_72978 ?auto_72975 ) ) ( not ( = ?auto_72977 ?auto_72975 ) ) ( ON ?auto_72974 ?auto_72973 ) ( ON-TABLE ?auto_72975 ) ( ON ?auto_72976 ?auto_72974 ) ( ON ?auto_72977 ?auto_72976 ) ( CLEAR ?auto_72977 ) ( HOLDING ?auto_72978 ) ( CLEAR ?auto_72979 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72979 ?auto_72978 )
      ( MAKE-2PILE ?auto_72973 ?auto_72974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72980 - BLOCK
      ?auto_72981 - BLOCK
    )
    :vars
    (
      ?auto_72984 - BLOCK
      ?auto_72985 - BLOCK
      ?auto_72983 - BLOCK
      ?auto_72982 - BLOCK
      ?auto_72986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72980 ?auto_72981 ) ) ( not ( = ?auto_72980 ?auto_72984 ) ) ( not ( = ?auto_72981 ?auto_72984 ) ) ( ON-TABLE ?auto_72985 ) ( not ( = ?auto_72985 ?auto_72983 ) ) ( not ( = ?auto_72985 ?auto_72982 ) ) ( not ( = ?auto_72985 ?auto_72984 ) ) ( not ( = ?auto_72985 ?auto_72981 ) ) ( not ( = ?auto_72985 ?auto_72980 ) ) ( not ( = ?auto_72983 ?auto_72982 ) ) ( not ( = ?auto_72983 ?auto_72984 ) ) ( not ( = ?auto_72983 ?auto_72981 ) ) ( not ( = ?auto_72983 ?auto_72980 ) ) ( not ( = ?auto_72982 ?auto_72984 ) ) ( not ( = ?auto_72982 ?auto_72981 ) ) ( not ( = ?auto_72982 ?auto_72980 ) ) ( ON ?auto_72980 ?auto_72986 ) ( not ( = ?auto_72980 ?auto_72986 ) ) ( not ( = ?auto_72981 ?auto_72986 ) ) ( not ( = ?auto_72984 ?auto_72986 ) ) ( not ( = ?auto_72985 ?auto_72986 ) ) ( not ( = ?auto_72983 ?auto_72986 ) ) ( not ( = ?auto_72982 ?auto_72986 ) ) ( ON ?auto_72981 ?auto_72980 ) ( ON-TABLE ?auto_72986 ) ( ON ?auto_72984 ?auto_72981 ) ( ON ?auto_72982 ?auto_72984 ) ( CLEAR ?auto_72985 ) ( ON ?auto_72983 ?auto_72982 ) ( CLEAR ?auto_72983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72986 ?auto_72980 ?auto_72981 ?auto_72984 ?auto_72982 )
      ( MAKE-2PILE ?auto_72980 ?auto_72981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72987 - BLOCK
      ?auto_72988 - BLOCK
    )
    :vars
    (
      ?auto_72990 - BLOCK
      ?auto_72993 - BLOCK
      ?auto_72989 - BLOCK
      ?auto_72992 - BLOCK
      ?auto_72991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72987 ?auto_72988 ) ) ( not ( = ?auto_72987 ?auto_72990 ) ) ( not ( = ?auto_72988 ?auto_72990 ) ) ( not ( = ?auto_72993 ?auto_72989 ) ) ( not ( = ?auto_72993 ?auto_72992 ) ) ( not ( = ?auto_72993 ?auto_72990 ) ) ( not ( = ?auto_72993 ?auto_72988 ) ) ( not ( = ?auto_72993 ?auto_72987 ) ) ( not ( = ?auto_72989 ?auto_72992 ) ) ( not ( = ?auto_72989 ?auto_72990 ) ) ( not ( = ?auto_72989 ?auto_72988 ) ) ( not ( = ?auto_72989 ?auto_72987 ) ) ( not ( = ?auto_72992 ?auto_72990 ) ) ( not ( = ?auto_72992 ?auto_72988 ) ) ( not ( = ?auto_72992 ?auto_72987 ) ) ( ON ?auto_72987 ?auto_72991 ) ( not ( = ?auto_72987 ?auto_72991 ) ) ( not ( = ?auto_72988 ?auto_72991 ) ) ( not ( = ?auto_72990 ?auto_72991 ) ) ( not ( = ?auto_72993 ?auto_72991 ) ) ( not ( = ?auto_72989 ?auto_72991 ) ) ( not ( = ?auto_72992 ?auto_72991 ) ) ( ON ?auto_72988 ?auto_72987 ) ( ON-TABLE ?auto_72991 ) ( ON ?auto_72990 ?auto_72988 ) ( ON ?auto_72992 ?auto_72990 ) ( ON ?auto_72989 ?auto_72992 ) ( CLEAR ?auto_72989 ) ( HOLDING ?auto_72993 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72993 )
      ( MAKE-2PILE ?auto_72987 ?auto_72988 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72994 - BLOCK
      ?auto_72995 - BLOCK
    )
    :vars
    (
      ?auto_72997 - BLOCK
      ?auto_73000 - BLOCK
      ?auto_72999 - BLOCK
      ?auto_72998 - BLOCK
      ?auto_72996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72994 ?auto_72995 ) ) ( not ( = ?auto_72994 ?auto_72997 ) ) ( not ( = ?auto_72995 ?auto_72997 ) ) ( not ( = ?auto_73000 ?auto_72999 ) ) ( not ( = ?auto_73000 ?auto_72998 ) ) ( not ( = ?auto_73000 ?auto_72997 ) ) ( not ( = ?auto_73000 ?auto_72995 ) ) ( not ( = ?auto_73000 ?auto_72994 ) ) ( not ( = ?auto_72999 ?auto_72998 ) ) ( not ( = ?auto_72999 ?auto_72997 ) ) ( not ( = ?auto_72999 ?auto_72995 ) ) ( not ( = ?auto_72999 ?auto_72994 ) ) ( not ( = ?auto_72998 ?auto_72997 ) ) ( not ( = ?auto_72998 ?auto_72995 ) ) ( not ( = ?auto_72998 ?auto_72994 ) ) ( ON ?auto_72994 ?auto_72996 ) ( not ( = ?auto_72994 ?auto_72996 ) ) ( not ( = ?auto_72995 ?auto_72996 ) ) ( not ( = ?auto_72997 ?auto_72996 ) ) ( not ( = ?auto_73000 ?auto_72996 ) ) ( not ( = ?auto_72999 ?auto_72996 ) ) ( not ( = ?auto_72998 ?auto_72996 ) ) ( ON ?auto_72995 ?auto_72994 ) ( ON-TABLE ?auto_72996 ) ( ON ?auto_72997 ?auto_72995 ) ( ON ?auto_72998 ?auto_72997 ) ( ON ?auto_72999 ?auto_72998 ) ( ON ?auto_73000 ?auto_72999 ) ( CLEAR ?auto_73000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72996 ?auto_72994 ?auto_72995 ?auto_72997 ?auto_72998 ?auto_72999 )
      ( MAKE-2PILE ?auto_72994 ?auto_72995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73004 - BLOCK
      ?auto_73005 - BLOCK
      ?auto_73006 - BLOCK
    )
    :vars
    (
      ?auto_73007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73007 ?auto_73006 ) ( CLEAR ?auto_73007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73004 ) ( ON ?auto_73005 ?auto_73004 ) ( ON ?auto_73006 ?auto_73005 ) ( not ( = ?auto_73004 ?auto_73005 ) ) ( not ( = ?auto_73004 ?auto_73006 ) ) ( not ( = ?auto_73004 ?auto_73007 ) ) ( not ( = ?auto_73005 ?auto_73006 ) ) ( not ( = ?auto_73005 ?auto_73007 ) ) ( not ( = ?auto_73006 ?auto_73007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73007 ?auto_73006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73008 - BLOCK
      ?auto_73009 - BLOCK
      ?auto_73010 - BLOCK
    )
    :vars
    (
      ?auto_73011 - BLOCK
      ?auto_73012 - BLOCK
      ?auto_73013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73011 ?auto_73010 ) ( CLEAR ?auto_73011 ) ( ON-TABLE ?auto_73008 ) ( ON ?auto_73009 ?auto_73008 ) ( ON ?auto_73010 ?auto_73009 ) ( not ( = ?auto_73008 ?auto_73009 ) ) ( not ( = ?auto_73008 ?auto_73010 ) ) ( not ( = ?auto_73008 ?auto_73011 ) ) ( not ( = ?auto_73009 ?auto_73010 ) ) ( not ( = ?auto_73009 ?auto_73011 ) ) ( not ( = ?auto_73010 ?auto_73011 ) ) ( HOLDING ?auto_73012 ) ( CLEAR ?auto_73013 ) ( not ( = ?auto_73008 ?auto_73012 ) ) ( not ( = ?auto_73008 ?auto_73013 ) ) ( not ( = ?auto_73009 ?auto_73012 ) ) ( not ( = ?auto_73009 ?auto_73013 ) ) ( not ( = ?auto_73010 ?auto_73012 ) ) ( not ( = ?auto_73010 ?auto_73013 ) ) ( not ( = ?auto_73011 ?auto_73012 ) ) ( not ( = ?auto_73011 ?auto_73013 ) ) ( not ( = ?auto_73012 ?auto_73013 ) ) )
    :subtasks
    ( ( !STACK ?auto_73012 ?auto_73013 )
      ( MAKE-3PILE ?auto_73008 ?auto_73009 ?auto_73010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73014 - BLOCK
      ?auto_73015 - BLOCK
      ?auto_73016 - BLOCK
    )
    :vars
    (
      ?auto_73019 - BLOCK
      ?auto_73018 - BLOCK
      ?auto_73017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73019 ?auto_73016 ) ( ON-TABLE ?auto_73014 ) ( ON ?auto_73015 ?auto_73014 ) ( ON ?auto_73016 ?auto_73015 ) ( not ( = ?auto_73014 ?auto_73015 ) ) ( not ( = ?auto_73014 ?auto_73016 ) ) ( not ( = ?auto_73014 ?auto_73019 ) ) ( not ( = ?auto_73015 ?auto_73016 ) ) ( not ( = ?auto_73015 ?auto_73019 ) ) ( not ( = ?auto_73016 ?auto_73019 ) ) ( CLEAR ?auto_73018 ) ( not ( = ?auto_73014 ?auto_73017 ) ) ( not ( = ?auto_73014 ?auto_73018 ) ) ( not ( = ?auto_73015 ?auto_73017 ) ) ( not ( = ?auto_73015 ?auto_73018 ) ) ( not ( = ?auto_73016 ?auto_73017 ) ) ( not ( = ?auto_73016 ?auto_73018 ) ) ( not ( = ?auto_73019 ?auto_73017 ) ) ( not ( = ?auto_73019 ?auto_73018 ) ) ( not ( = ?auto_73017 ?auto_73018 ) ) ( ON ?auto_73017 ?auto_73019 ) ( CLEAR ?auto_73017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73014 ?auto_73015 ?auto_73016 ?auto_73019 )
      ( MAKE-3PILE ?auto_73014 ?auto_73015 ?auto_73016 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73020 - BLOCK
      ?auto_73021 - BLOCK
      ?auto_73022 - BLOCK
    )
    :vars
    (
      ?auto_73025 - BLOCK
      ?auto_73023 - BLOCK
      ?auto_73024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73025 ?auto_73022 ) ( ON-TABLE ?auto_73020 ) ( ON ?auto_73021 ?auto_73020 ) ( ON ?auto_73022 ?auto_73021 ) ( not ( = ?auto_73020 ?auto_73021 ) ) ( not ( = ?auto_73020 ?auto_73022 ) ) ( not ( = ?auto_73020 ?auto_73025 ) ) ( not ( = ?auto_73021 ?auto_73022 ) ) ( not ( = ?auto_73021 ?auto_73025 ) ) ( not ( = ?auto_73022 ?auto_73025 ) ) ( not ( = ?auto_73020 ?auto_73023 ) ) ( not ( = ?auto_73020 ?auto_73024 ) ) ( not ( = ?auto_73021 ?auto_73023 ) ) ( not ( = ?auto_73021 ?auto_73024 ) ) ( not ( = ?auto_73022 ?auto_73023 ) ) ( not ( = ?auto_73022 ?auto_73024 ) ) ( not ( = ?auto_73025 ?auto_73023 ) ) ( not ( = ?auto_73025 ?auto_73024 ) ) ( not ( = ?auto_73023 ?auto_73024 ) ) ( ON ?auto_73023 ?auto_73025 ) ( CLEAR ?auto_73023 ) ( HOLDING ?auto_73024 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73024 )
      ( MAKE-3PILE ?auto_73020 ?auto_73021 ?auto_73022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73026 - BLOCK
      ?auto_73027 - BLOCK
      ?auto_73028 - BLOCK
    )
    :vars
    (
      ?auto_73031 - BLOCK
      ?auto_73029 - BLOCK
      ?auto_73030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73031 ?auto_73028 ) ( ON-TABLE ?auto_73026 ) ( ON ?auto_73027 ?auto_73026 ) ( ON ?auto_73028 ?auto_73027 ) ( not ( = ?auto_73026 ?auto_73027 ) ) ( not ( = ?auto_73026 ?auto_73028 ) ) ( not ( = ?auto_73026 ?auto_73031 ) ) ( not ( = ?auto_73027 ?auto_73028 ) ) ( not ( = ?auto_73027 ?auto_73031 ) ) ( not ( = ?auto_73028 ?auto_73031 ) ) ( not ( = ?auto_73026 ?auto_73029 ) ) ( not ( = ?auto_73026 ?auto_73030 ) ) ( not ( = ?auto_73027 ?auto_73029 ) ) ( not ( = ?auto_73027 ?auto_73030 ) ) ( not ( = ?auto_73028 ?auto_73029 ) ) ( not ( = ?auto_73028 ?auto_73030 ) ) ( not ( = ?auto_73031 ?auto_73029 ) ) ( not ( = ?auto_73031 ?auto_73030 ) ) ( not ( = ?auto_73029 ?auto_73030 ) ) ( ON ?auto_73029 ?auto_73031 ) ( ON ?auto_73030 ?auto_73029 ) ( CLEAR ?auto_73030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73026 ?auto_73027 ?auto_73028 ?auto_73031 ?auto_73029 )
      ( MAKE-3PILE ?auto_73026 ?auto_73027 ?auto_73028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73032 - BLOCK
      ?auto_73033 - BLOCK
      ?auto_73034 - BLOCK
    )
    :vars
    (
      ?auto_73035 - BLOCK
      ?auto_73037 - BLOCK
      ?auto_73036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73035 ?auto_73034 ) ( ON-TABLE ?auto_73032 ) ( ON ?auto_73033 ?auto_73032 ) ( ON ?auto_73034 ?auto_73033 ) ( not ( = ?auto_73032 ?auto_73033 ) ) ( not ( = ?auto_73032 ?auto_73034 ) ) ( not ( = ?auto_73032 ?auto_73035 ) ) ( not ( = ?auto_73033 ?auto_73034 ) ) ( not ( = ?auto_73033 ?auto_73035 ) ) ( not ( = ?auto_73034 ?auto_73035 ) ) ( not ( = ?auto_73032 ?auto_73037 ) ) ( not ( = ?auto_73032 ?auto_73036 ) ) ( not ( = ?auto_73033 ?auto_73037 ) ) ( not ( = ?auto_73033 ?auto_73036 ) ) ( not ( = ?auto_73034 ?auto_73037 ) ) ( not ( = ?auto_73034 ?auto_73036 ) ) ( not ( = ?auto_73035 ?auto_73037 ) ) ( not ( = ?auto_73035 ?auto_73036 ) ) ( not ( = ?auto_73037 ?auto_73036 ) ) ( ON ?auto_73037 ?auto_73035 ) ( HOLDING ?auto_73036 ) ( CLEAR ?auto_73037 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73032 ?auto_73033 ?auto_73034 ?auto_73035 ?auto_73037 ?auto_73036 )
      ( MAKE-3PILE ?auto_73032 ?auto_73033 ?auto_73034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73038 - BLOCK
      ?auto_73039 - BLOCK
      ?auto_73040 - BLOCK
    )
    :vars
    (
      ?auto_73041 - BLOCK
      ?auto_73043 - BLOCK
      ?auto_73042 - BLOCK
      ?auto_73044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73041 ?auto_73040 ) ( ON-TABLE ?auto_73038 ) ( ON ?auto_73039 ?auto_73038 ) ( ON ?auto_73040 ?auto_73039 ) ( not ( = ?auto_73038 ?auto_73039 ) ) ( not ( = ?auto_73038 ?auto_73040 ) ) ( not ( = ?auto_73038 ?auto_73041 ) ) ( not ( = ?auto_73039 ?auto_73040 ) ) ( not ( = ?auto_73039 ?auto_73041 ) ) ( not ( = ?auto_73040 ?auto_73041 ) ) ( not ( = ?auto_73038 ?auto_73043 ) ) ( not ( = ?auto_73038 ?auto_73042 ) ) ( not ( = ?auto_73039 ?auto_73043 ) ) ( not ( = ?auto_73039 ?auto_73042 ) ) ( not ( = ?auto_73040 ?auto_73043 ) ) ( not ( = ?auto_73040 ?auto_73042 ) ) ( not ( = ?auto_73041 ?auto_73043 ) ) ( not ( = ?auto_73041 ?auto_73042 ) ) ( not ( = ?auto_73043 ?auto_73042 ) ) ( ON ?auto_73043 ?auto_73041 ) ( CLEAR ?auto_73043 ) ( ON ?auto_73042 ?auto_73044 ) ( CLEAR ?auto_73042 ) ( HAND-EMPTY ) ( not ( = ?auto_73038 ?auto_73044 ) ) ( not ( = ?auto_73039 ?auto_73044 ) ) ( not ( = ?auto_73040 ?auto_73044 ) ) ( not ( = ?auto_73041 ?auto_73044 ) ) ( not ( = ?auto_73043 ?auto_73044 ) ) ( not ( = ?auto_73042 ?auto_73044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73042 ?auto_73044 )
      ( MAKE-3PILE ?auto_73038 ?auto_73039 ?auto_73040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73045 - BLOCK
      ?auto_73046 - BLOCK
      ?auto_73047 - BLOCK
    )
    :vars
    (
      ?auto_73050 - BLOCK
      ?auto_73049 - BLOCK
      ?auto_73048 - BLOCK
      ?auto_73051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73050 ?auto_73047 ) ( ON-TABLE ?auto_73045 ) ( ON ?auto_73046 ?auto_73045 ) ( ON ?auto_73047 ?auto_73046 ) ( not ( = ?auto_73045 ?auto_73046 ) ) ( not ( = ?auto_73045 ?auto_73047 ) ) ( not ( = ?auto_73045 ?auto_73050 ) ) ( not ( = ?auto_73046 ?auto_73047 ) ) ( not ( = ?auto_73046 ?auto_73050 ) ) ( not ( = ?auto_73047 ?auto_73050 ) ) ( not ( = ?auto_73045 ?auto_73049 ) ) ( not ( = ?auto_73045 ?auto_73048 ) ) ( not ( = ?auto_73046 ?auto_73049 ) ) ( not ( = ?auto_73046 ?auto_73048 ) ) ( not ( = ?auto_73047 ?auto_73049 ) ) ( not ( = ?auto_73047 ?auto_73048 ) ) ( not ( = ?auto_73050 ?auto_73049 ) ) ( not ( = ?auto_73050 ?auto_73048 ) ) ( not ( = ?auto_73049 ?auto_73048 ) ) ( ON ?auto_73048 ?auto_73051 ) ( CLEAR ?auto_73048 ) ( not ( = ?auto_73045 ?auto_73051 ) ) ( not ( = ?auto_73046 ?auto_73051 ) ) ( not ( = ?auto_73047 ?auto_73051 ) ) ( not ( = ?auto_73050 ?auto_73051 ) ) ( not ( = ?auto_73049 ?auto_73051 ) ) ( not ( = ?auto_73048 ?auto_73051 ) ) ( HOLDING ?auto_73049 ) ( CLEAR ?auto_73050 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73045 ?auto_73046 ?auto_73047 ?auto_73050 ?auto_73049 )
      ( MAKE-3PILE ?auto_73045 ?auto_73046 ?auto_73047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73052 - BLOCK
      ?auto_73053 - BLOCK
      ?auto_73054 - BLOCK
    )
    :vars
    (
      ?auto_73057 - BLOCK
      ?auto_73058 - BLOCK
      ?auto_73055 - BLOCK
      ?auto_73056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73057 ?auto_73054 ) ( ON-TABLE ?auto_73052 ) ( ON ?auto_73053 ?auto_73052 ) ( ON ?auto_73054 ?auto_73053 ) ( not ( = ?auto_73052 ?auto_73053 ) ) ( not ( = ?auto_73052 ?auto_73054 ) ) ( not ( = ?auto_73052 ?auto_73057 ) ) ( not ( = ?auto_73053 ?auto_73054 ) ) ( not ( = ?auto_73053 ?auto_73057 ) ) ( not ( = ?auto_73054 ?auto_73057 ) ) ( not ( = ?auto_73052 ?auto_73058 ) ) ( not ( = ?auto_73052 ?auto_73055 ) ) ( not ( = ?auto_73053 ?auto_73058 ) ) ( not ( = ?auto_73053 ?auto_73055 ) ) ( not ( = ?auto_73054 ?auto_73058 ) ) ( not ( = ?auto_73054 ?auto_73055 ) ) ( not ( = ?auto_73057 ?auto_73058 ) ) ( not ( = ?auto_73057 ?auto_73055 ) ) ( not ( = ?auto_73058 ?auto_73055 ) ) ( ON ?auto_73055 ?auto_73056 ) ( not ( = ?auto_73052 ?auto_73056 ) ) ( not ( = ?auto_73053 ?auto_73056 ) ) ( not ( = ?auto_73054 ?auto_73056 ) ) ( not ( = ?auto_73057 ?auto_73056 ) ) ( not ( = ?auto_73058 ?auto_73056 ) ) ( not ( = ?auto_73055 ?auto_73056 ) ) ( CLEAR ?auto_73057 ) ( ON ?auto_73058 ?auto_73055 ) ( CLEAR ?auto_73058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73056 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73056 ?auto_73055 )
      ( MAKE-3PILE ?auto_73052 ?auto_73053 ?auto_73054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73073 - BLOCK
      ?auto_73074 - BLOCK
      ?auto_73075 - BLOCK
    )
    :vars
    (
      ?auto_73077 - BLOCK
      ?auto_73076 - BLOCK
      ?auto_73078 - BLOCK
      ?auto_73079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73073 ) ( ON ?auto_73074 ?auto_73073 ) ( not ( = ?auto_73073 ?auto_73074 ) ) ( not ( = ?auto_73073 ?auto_73075 ) ) ( not ( = ?auto_73073 ?auto_73077 ) ) ( not ( = ?auto_73074 ?auto_73075 ) ) ( not ( = ?auto_73074 ?auto_73077 ) ) ( not ( = ?auto_73075 ?auto_73077 ) ) ( not ( = ?auto_73073 ?auto_73076 ) ) ( not ( = ?auto_73073 ?auto_73078 ) ) ( not ( = ?auto_73074 ?auto_73076 ) ) ( not ( = ?auto_73074 ?auto_73078 ) ) ( not ( = ?auto_73075 ?auto_73076 ) ) ( not ( = ?auto_73075 ?auto_73078 ) ) ( not ( = ?auto_73077 ?auto_73076 ) ) ( not ( = ?auto_73077 ?auto_73078 ) ) ( not ( = ?auto_73076 ?auto_73078 ) ) ( ON ?auto_73078 ?auto_73079 ) ( not ( = ?auto_73073 ?auto_73079 ) ) ( not ( = ?auto_73074 ?auto_73079 ) ) ( not ( = ?auto_73075 ?auto_73079 ) ) ( not ( = ?auto_73077 ?auto_73079 ) ) ( not ( = ?auto_73076 ?auto_73079 ) ) ( not ( = ?auto_73078 ?auto_73079 ) ) ( ON ?auto_73076 ?auto_73078 ) ( ON-TABLE ?auto_73079 ) ( ON ?auto_73077 ?auto_73076 ) ( CLEAR ?auto_73077 ) ( HOLDING ?auto_73075 ) ( CLEAR ?auto_73074 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73073 ?auto_73074 ?auto_73075 ?auto_73077 )
      ( MAKE-3PILE ?auto_73073 ?auto_73074 ?auto_73075 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73080 - BLOCK
      ?auto_73081 - BLOCK
      ?auto_73082 - BLOCK
    )
    :vars
    (
      ?auto_73086 - BLOCK
      ?auto_73085 - BLOCK
      ?auto_73084 - BLOCK
      ?auto_73083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73080 ) ( ON ?auto_73081 ?auto_73080 ) ( not ( = ?auto_73080 ?auto_73081 ) ) ( not ( = ?auto_73080 ?auto_73082 ) ) ( not ( = ?auto_73080 ?auto_73086 ) ) ( not ( = ?auto_73081 ?auto_73082 ) ) ( not ( = ?auto_73081 ?auto_73086 ) ) ( not ( = ?auto_73082 ?auto_73086 ) ) ( not ( = ?auto_73080 ?auto_73085 ) ) ( not ( = ?auto_73080 ?auto_73084 ) ) ( not ( = ?auto_73081 ?auto_73085 ) ) ( not ( = ?auto_73081 ?auto_73084 ) ) ( not ( = ?auto_73082 ?auto_73085 ) ) ( not ( = ?auto_73082 ?auto_73084 ) ) ( not ( = ?auto_73086 ?auto_73085 ) ) ( not ( = ?auto_73086 ?auto_73084 ) ) ( not ( = ?auto_73085 ?auto_73084 ) ) ( ON ?auto_73084 ?auto_73083 ) ( not ( = ?auto_73080 ?auto_73083 ) ) ( not ( = ?auto_73081 ?auto_73083 ) ) ( not ( = ?auto_73082 ?auto_73083 ) ) ( not ( = ?auto_73086 ?auto_73083 ) ) ( not ( = ?auto_73085 ?auto_73083 ) ) ( not ( = ?auto_73084 ?auto_73083 ) ) ( ON ?auto_73085 ?auto_73084 ) ( ON-TABLE ?auto_73083 ) ( ON ?auto_73086 ?auto_73085 ) ( CLEAR ?auto_73081 ) ( ON ?auto_73082 ?auto_73086 ) ( CLEAR ?auto_73082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73083 ?auto_73084 ?auto_73085 ?auto_73086 )
      ( MAKE-3PILE ?auto_73080 ?auto_73081 ?auto_73082 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73087 - BLOCK
      ?auto_73088 - BLOCK
      ?auto_73089 - BLOCK
    )
    :vars
    (
      ?auto_73091 - BLOCK
      ?auto_73090 - BLOCK
      ?auto_73093 - BLOCK
      ?auto_73092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73087 ) ( not ( = ?auto_73087 ?auto_73088 ) ) ( not ( = ?auto_73087 ?auto_73089 ) ) ( not ( = ?auto_73087 ?auto_73091 ) ) ( not ( = ?auto_73088 ?auto_73089 ) ) ( not ( = ?auto_73088 ?auto_73091 ) ) ( not ( = ?auto_73089 ?auto_73091 ) ) ( not ( = ?auto_73087 ?auto_73090 ) ) ( not ( = ?auto_73087 ?auto_73093 ) ) ( not ( = ?auto_73088 ?auto_73090 ) ) ( not ( = ?auto_73088 ?auto_73093 ) ) ( not ( = ?auto_73089 ?auto_73090 ) ) ( not ( = ?auto_73089 ?auto_73093 ) ) ( not ( = ?auto_73091 ?auto_73090 ) ) ( not ( = ?auto_73091 ?auto_73093 ) ) ( not ( = ?auto_73090 ?auto_73093 ) ) ( ON ?auto_73093 ?auto_73092 ) ( not ( = ?auto_73087 ?auto_73092 ) ) ( not ( = ?auto_73088 ?auto_73092 ) ) ( not ( = ?auto_73089 ?auto_73092 ) ) ( not ( = ?auto_73091 ?auto_73092 ) ) ( not ( = ?auto_73090 ?auto_73092 ) ) ( not ( = ?auto_73093 ?auto_73092 ) ) ( ON ?auto_73090 ?auto_73093 ) ( ON-TABLE ?auto_73092 ) ( ON ?auto_73091 ?auto_73090 ) ( ON ?auto_73089 ?auto_73091 ) ( CLEAR ?auto_73089 ) ( HOLDING ?auto_73088 ) ( CLEAR ?auto_73087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73087 ?auto_73088 )
      ( MAKE-3PILE ?auto_73087 ?auto_73088 ?auto_73089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73094 - BLOCK
      ?auto_73095 - BLOCK
      ?auto_73096 - BLOCK
    )
    :vars
    (
      ?auto_73099 - BLOCK
      ?auto_73100 - BLOCK
      ?auto_73097 - BLOCK
      ?auto_73098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73094 ) ( not ( = ?auto_73094 ?auto_73095 ) ) ( not ( = ?auto_73094 ?auto_73096 ) ) ( not ( = ?auto_73094 ?auto_73099 ) ) ( not ( = ?auto_73095 ?auto_73096 ) ) ( not ( = ?auto_73095 ?auto_73099 ) ) ( not ( = ?auto_73096 ?auto_73099 ) ) ( not ( = ?auto_73094 ?auto_73100 ) ) ( not ( = ?auto_73094 ?auto_73097 ) ) ( not ( = ?auto_73095 ?auto_73100 ) ) ( not ( = ?auto_73095 ?auto_73097 ) ) ( not ( = ?auto_73096 ?auto_73100 ) ) ( not ( = ?auto_73096 ?auto_73097 ) ) ( not ( = ?auto_73099 ?auto_73100 ) ) ( not ( = ?auto_73099 ?auto_73097 ) ) ( not ( = ?auto_73100 ?auto_73097 ) ) ( ON ?auto_73097 ?auto_73098 ) ( not ( = ?auto_73094 ?auto_73098 ) ) ( not ( = ?auto_73095 ?auto_73098 ) ) ( not ( = ?auto_73096 ?auto_73098 ) ) ( not ( = ?auto_73099 ?auto_73098 ) ) ( not ( = ?auto_73100 ?auto_73098 ) ) ( not ( = ?auto_73097 ?auto_73098 ) ) ( ON ?auto_73100 ?auto_73097 ) ( ON-TABLE ?auto_73098 ) ( ON ?auto_73099 ?auto_73100 ) ( ON ?auto_73096 ?auto_73099 ) ( CLEAR ?auto_73094 ) ( ON ?auto_73095 ?auto_73096 ) ( CLEAR ?auto_73095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73098 ?auto_73097 ?auto_73100 ?auto_73099 ?auto_73096 )
      ( MAKE-3PILE ?auto_73094 ?auto_73095 ?auto_73096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73101 - BLOCK
      ?auto_73102 - BLOCK
      ?auto_73103 - BLOCK
    )
    :vars
    (
      ?auto_73105 - BLOCK
      ?auto_73107 - BLOCK
      ?auto_73104 - BLOCK
      ?auto_73106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73101 ?auto_73102 ) ) ( not ( = ?auto_73101 ?auto_73103 ) ) ( not ( = ?auto_73101 ?auto_73105 ) ) ( not ( = ?auto_73102 ?auto_73103 ) ) ( not ( = ?auto_73102 ?auto_73105 ) ) ( not ( = ?auto_73103 ?auto_73105 ) ) ( not ( = ?auto_73101 ?auto_73107 ) ) ( not ( = ?auto_73101 ?auto_73104 ) ) ( not ( = ?auto_73102 ?auto_73107 ) ) ( not ( = ?auto_73102 ?auto_73104 ) ) ( not ( = ?auto_73103 ?auto_73107 ) ) ( not ( = ?auto_73103 ?auto_73104 ) ) ( not ( = ?auto_73105 ?auto_73107 ) ) ( not ( = ?auto_73105 ?auto_73104 ) ) ( not ( = ?auto_73107 ?auto_73104 ) ) ( ON ?auto_73104 ?auto_73106 ) ( not ( = ?auto_73101 ?auto_73106 ) ) ( not ( = ?auto_73102 ?auto_73106 ) ) ( not ( = ?auto_73103 ?auto_73106 ) ) ( not ( = ?auto_73105 ?auto_73106 ) ) ( not ( = ?auto_73107 ?auto_73106 ) ) ( not ( = ?auto_73104 ?auto_73106 ) ) ( ON ?auto_73107 ?auto_73104 ) ( ON-TABLE ?auto_73106 ) ( ON ?auto_73105 ?auto_73107 ) ( ON ?auto_73103 ?auto_73105 ) ( ON ?auto_73102 ?auto_73103 ) ( CLEAR ?auto_73102 ) ( HOLDING ?auto_73101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73101 )
      ( MAKE-3PILE ?auto_73101 ?auto_73102 ?auto_73103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73108 - BLOCK
      ?auto_73109 - BLOCK
      ?auto_73110 - BLOCK
    )
    :vars
    (
      ?auto_73112 - BLOCK
      ?auto_73111 - BLOCK
      ?auto_73114 - BLOCK
      ?auto_73113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73108 ?auto_73109 ) ) ( not ( = ?auto_73108 ?auto_73110 ) ) ( not ( = ?auto_73108 ?auto_73112 ) ) ( not ( = ?auto_73109 ?auto_73110 ) ) ( not ( = ?auto_73109 ?auto_73112 ) ) ( not ( = ?auto_73110 ?auto_73112 ) ) ( not ( = ?auto_73108 ?auto_73111 ) ) ( not ( = ?auto_73108 ?auto_73114 ) ) ( not ( = ?auto_73109 ?auto_73111 ) ) ( not ( = ?auto_73109 ?auto_73114 ) ) ( not ( = ?auto_73110 ?auto_73111 ) ) ( not ( = ?auto_73110 ?auto_73114 ) ) ( not ( = ?auto_73112 ?auto_73111 ) ) ( not ( = ?auto_73112 ?auto_73114 ) ) ( not ( = ?auto_73111 ?auto_73114 ) ) ( ON ?auto_73114 ?auto_73113 ) ( not ( = ?auto_73108 ?auto_73113 ) ) ( not ( = ?auto_73109 ?auto_73113 ) ) ( not ( = ?auto_73110 ?auto_73113 ) ) ( not ( = ?auto_73112 ?auto_73113 ) ) ( not ( = ?auto_73111 ?auto_73113 ) ) ( not ( = ?auto_73114 ?auto_73113 ) ) ( ON ?auto_73111 ?auto_73114 ) ( ON-TABLE ?auto_73113 ) ( ON ?auto_73112 ?auto_73111 ) ( ON ?auto_73110 ?auto_73112 ) ( ON ?auto_73109 ?auto_73110 ) ( ON ?auto_73108 ?auto_73109 ) ( CLEAR ?auto_73108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73113 ?auto_73114 ?auto_73111 ?auto_73112 ?auto_73110 ?auto_73109 )
      ( MAKE-3PILE ?auto_73108 ?auto_73109 ?auto_73110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73118 - BLOCK
      ?auto_73119 - BLOCK
      ?auto_73120 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_73120 ) ( CLEAR ?auto_73119 ) ( ON-TABLE ?auto_73118 ) ( ON ?auto_73119 ?auto_73118 ) ( not ( = ?auto_73118 ?auto_73119 ) ) ( not ( = ?auto_73118 ?auto_73120 ) ) ( not ( = ?auto_73119 ?auto_73120 ) ) )
    :subtasks
    ( ( !STACK ?auto_73120 ?auto_73119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73121 - BLOCK
      ?auto_73122 - BLOCK
      ?auto_73123 - BLOCK
    )
    :vars
    (
      ?auto_73124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73122 ) ( ON-TABLE ?auto_73121 ) ( ON ?auto_73122 ?auto_73121 ) ( not ( = ?auto_73121 ?auto_73122 ) ) ( not ( = ?auto_73121 ?auto_73123 ) ) ( not ( = ?auto_73122 ?auto_73123 ) ) ( ON ?auto_73123 ?auto_73124 ) ( CLEAR ?auto_73123 ) ( HAND-EMPTY ) ( not ( = ?auto_73121 ?auto_73124 ) ) ( not ( = ?auto_73122 ?auto_73124 ) ) ( not ( = ?auto_73123 ?auto_73124 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73123 ?auto_73124 )
      ( MAKE-3PILE ?auto_73121 ?auto_73122 ?auto_73123 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73125 - BLOCK
      ?auto_73126 - BLOCK
      ?auto_73127 - BLOCK
    )
    :vars
    (
      ?auto_73128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73125 ) ( not ( = ?auto_73125 ?auto_73126 ) ) ( not ( = ?auto_73125 ?auto_73127 ) ) ( not ( = ?auto_73126 ?auto_73127 ) ) ( ON ?auto_73127 ?auto_73128 ) ( CLEAR ?auto_73127 ) ( not ( = ?auto_73125 ?auto_73128 ) ) ( not ( = ?auto_73126 ?auto_73128 ) ) ( not ( = ?auto_73127 ?auto_73128 ) ) ( HOLDING ?auto_73126 ) ( CLEAR ?auto_73125 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73125 ?auto_73126 )
      ( MAKE-3PILE ?auto_73125 ?auto_73126 ?auto_73127 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73129 - BLOCK
      ?auto_73130 - BLOCK
      ?auto_73131 - BLOCK
    )
    :vars
    (
      ?auto_73132 - BLOCK
      ?auto_73134 - BLOCK
      ?auto_73133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73129 ) ( not ( = ?auto_73129 ?auto_73130 ) ) ( not ( = ?auto_73129 ?auto_73131 ) ) ( not ( = ?auto_73130 ?auto_73131 ) ) ( ON ?auto_73131 ?auto_73132 ) ( not ( = ?auto_73129 ?auto_73132 ) ) ( not ( = ?auto_73130 ?auto_73132 ) ) ( not ( = ?auto_73131 ?auto_73132 ) ) ( CLEAR ?auto_73129 ) ( ON ?auto_73130 ?auto_73131 ) ( CLEAR ?auto_73130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73134 ) ( ON ?auto_73133 ?auto_73134 ) ( ON ?auto_73132 ?auto_73133 ) ( not ( = ?auto_73134 ?auto_73133 ) ) ( not ( = ?auto_73134 ?auto_73132 ) ) ( not ( = ?auto_73134 ?auto_73131 ) ) ( not ( = ?auto_73134 ?auto_73130 ) ) ( not ( = ?auto_73133 ?auto_73132 ) ) ( not ( = ?auto_73133 ?auto_73131 ) ) ( not ( = ?auto_73133 ?auto_73130 ) ) ( not ( = ?auto_73129 ?auto_73134 ) ) ( not ( = ?auto_73129 ?auto_73133 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73134 ?auto_73133 ?auto_73132 ?auto_73131 )
      ( MAKE-3PILE ?auto_73129 ?auto_73130 ?auto_73131 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73135 - BLOCK
      ?auto_73136 - BLOCK
      ?auto_73137 - BLOCK
    )
    :vars
    (
      ?auto_73140 - BLOCK
      ?auto_73138 - BLOCK
      ?auto_73139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73135 ?auto_73136 ) ) ( not ( = ?auto_73135 ?auto_73137 ) ) ( not ( = ?auto_73136 ?auto_73137 ) ) ( ON ?auto_73137 ?auto_73140 ) ( not ( = ?auto_73135 ?auto_73140 ) ) ( not ( = ?auto_73136 ?auto_73140 ) ) ( not ( = ?auto_73137 ?auto_73140 ) ) ( ON ?auto_73136 ?auto_73137 ) ( CLEAR ?auto_73136 ) ( ON-TABLE ?auto_73138 ) ( ON ?auto_73139 ?auto_73138 ) ( ON ?auto_73140 ?auto_73139 ) ( not ( = ?auto_73138 ?auto_73139 ) ) ( not ( = ?auto_73138 ?auto_73140 ) ) ( not ( = ?auto_73138 ?auto_73137 ) ) ( not ( = ?auto_73138 ?auto_73136 ) ) ( not ( = ?auto_73139 ?auto_73140 ) ) ( not ( = ?auto_73139 ?auto_73137 ) ) ( not ( = ?auto_73139 ?auto_73136 ) ) ( not ( = ?auto_73135 ?auto_73138 ) ) ( not ( = ?auto_73135 ?auto_73139 ) ) ( HOLDING ?auto_73135 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73135 )
      ( MAKE-3PILE ?auto_73135 ?auto_73136 ?auto_73137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73141 - BLOCK
      ?auto_73142 - BLOCK
      ?auto_73143 - BLOCK
    )
    :vars
    (
      ?auto_73145 - BLOCK
      ?auto_73144 - BLOCK
      ?auto_73146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73141 ?auto_73142 ) ) ( not ( = ?auto_73141 ?auto_73143 ) ) ( not ( = ?auto_73142 ?auto_73143 ) ) ( ON ?auto_73143 ?auto_73145 ) ( not ( = ?auto_73141 ?auto_73145 ) ) ( not ( = ?auto_73142 ?auto_73145 ) ) ( not ( = ?auto_73143 ?auto_73145 ) ) ( ON ?auto_73142 ?auto_73143 ) ( ON-TABLE ?auto_73144 ) ( ON ?auto_73146 ?auto_73144 ) ( ON ?auto_73145 ?auto_73146 ) ( not ( = ?auto_73144 ?auto_73146 ) ) ( not ( = ?auto_73144 ?auto_73145 ) ) ( not ( = ?auto_73144 ?auto_73143 ) ) ( not ( = ?auto_73144 ?auto_73142 ) ) ( not ( = ?auto_73146 ?auto_73145 ) ) ( not ( = ?auto_73146 ?auto_73143 ) ) ( not ( = ?auto_73146 ?auto_73142 ) ) ( not ( = ?auto_73141 ?auto_73144 ) ) ( not ( = ?auto_73141 ?auto_73146 ) ) ( ON ?auto_73141 ?auto_73142 ) ( CLEAR ?auto_73141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73144 ?auto_73146 ?auto_73145 ?auto_73143 ?auto_73142 )
      ( MAKE-3PILE ?auto_73141 ?auto_73142 ?auto_73143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73147 - BLOCK
      ?auto_73148 - BLOCK
      ?auto_73149 - BLOCK
    )
    :vars
    (
      ?auto_73152 - BLOCK
      ?auto_73151 - BLOCK
      ?auto_73150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73147 ?auto_73148 ) ) ( not ( = ?auto_73147 ?auto_73149 ) ) ( not ( = ?auto_73148 ?auto_73149 ) ) ( ON ?auto_73149 ?auto_73152 ) ( not ( = ?auto_73147 ?auto_73152 ) ) ( not ( = ?auto_73148 ?auto_73152 ) ) ( not ( = ?auto_73149 ?auto_73152 ) ) ( ON ?auto_73148 ?auto_73149 ) ( ON-TABLE ?auto_73151 ) ( ON ?auto_73150 ?auto_73151 ) ( ON ?auto_73152 ?auto_73150 ) ( not ( = ?auto_73151 ?auto_73150 ) ) ( not ( = ?auto_73151 ?auto_73152 ) ) ( not ( = ?auto_73151 ?auto_73149 ) ) ( not ( = ?auto_73151 ?auto_73148 ) ) ( not ( = ?auto_73150 ?auto_73152 ) ) ( not ( = ?auto_73150 ?auto_73149 ) ) ( not ( = ?auto_73150 ?auto_73148 ) ) ( not ( = ?auto_73147 ?auto_73151 ) ) ( not ( = ?auto_73147 ?auto_73150 ) ) ( HOLDING ?auto_73147 ) ( CLEAR ?auto_73148 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73151 ?auto_73150 ?auto_73152 ?auto_73149 ?auto_73148 ?auto_73147 )
      ( MAKE-3PILE ?auto_73147 ?auto_73148 ?auto_73149 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73153 - BLOCK
      ?auto_73154 - BLOCK
      ?auto_73155 - BLOCK
    )
    :vars
    (
      ?auto_73156 - BLOCK
      ?auto_73158 - BLOCK
      ?auto_73157 - BLOCK
      ?auto_73159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73153 ?auto_73154 ) ) ( not ( = ?auto_73153 ?auto_73155 ) ) ( not ( = ?auto_73154 ?auto_73155 ) ) ( ON ?auto_73155 ?auto_73156 ) ( not ( = ?auto_73153 ?auto_73156 ) ) ( not ( = ?auto_73154 ?auto_73156 ) ) ( not ( = ?auto_73155 ?auto_73156 ) ) ( ON ?auto_73154 ?auto_73155 ) ( ON-TABLE ?auto_73158 ) ( ON ?auto_73157 ?auto_73158 ) ( ON ?auto_73156 ?auto_73157 ) ( not ( = ?auto_73158 ?auto_73157 ) ) ( not ( = ?auto_73158 ?auto_73156 ) ) ( not ( = ?auto_73158 ?auto_73155 ) ) ( not ( = ?auto_73158 ?auto_73154 ) ) ( not ( = ?auto_73157 ?auto_73156 ) ) ( not ( = ?auto_73157 ?auto_73155 ) ) ( not ( = ?auto_73157 ?auto_73154 ) ) ( not ( = ?auto_73153 ?auto_73158 ) ) ( not ( = ?auto_73153 ?auto_73157 ) ) ( CLEAR ?auto_73154 ) ( ON ?auto_73153 ?auto_73159 ) ( CLEAR ?auto_73153 ) ( HAND-EMPTY ) ( not ( = ?auto_73153 ?auto_73159 ) ) ( not ( = ?auto_73154 ?auto_73159 ) ) ( not ( = ?auto_73155 ?auto_73159 ) ) ( not ( = ?auto_73156 ?auto_73159 ) ) ( not ( = ?auto_73158 ?auto_73159 ) ) ( not ( = ?auto_73157 ?auto_73159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73153 ?auto_73159 )
      ( MAKE-3PILE ?auto_73153 ?auto_73154 ?auto_73155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73160 - BLOCK
      ?auto_73161 - BLOCK
      ?auto_73162 - BLOCK
    )
    :vars
    (
      ?auto_73166 - BLOCK
      ?auto_73164 - BLOCK
      ?auto_73165 - BLOCK
      ?auto_73163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73160 ?auto_73161 ) ) ( not ( = ?auto_73160 ?auto_73162 ) ) ( not ( = ?auto_73161 ?auto_73162 ) ) ( ON ?auto_73162 ?auto_73166 ) ( not ( = ?auto_73160 ?auto_73166 ) ) ( not ( = ?auto_73161 ?auto_73166 ) ) ( not ( = ?auto_73162 ?auto_73166 ) ) ( ON-TABLE ?auto_73164 ) ( ON ?auto_73165 ?auto_73164 ) ( ON ?auto_73166 ?auto_73165 ) ( not ( = ?auto_73164 ?auto_73165 ) ) ( not ( = ?auto_73164 ?auto_73166 ) ) ( not ( = ?auto_73164 ?auto_73162 ) ) ( not ( = ?auto_73164 ?auto_73161 ) ) ( not ( = ?auto_73165 ?auto_73166 ) ) ( not ( = ?auto_73165 ?auto_73162 ) ) ( not ( = ?auto_73165 ?auto_73161 ) ) ( not ( = ?auto_73160 ?auto_73164 ) ) ( not ( = ?auto_73160 ?auto_73165 ) ) ( ON ?auto_73160 ?auto_73163 ) ( CLEAR ?auto_73160 ) ( not ( = ?auto_73160 ?auto_73163 ) ) ( not ( = ?auto_73161 ?auto_73163 ) ) ( not ( = ?auto_73162 ?auto_73163 ) ) ( not ( = ?auto_73166 ?auto_73163 ) ) ( not ( = ?auto_73164 ?auto_73163 ) ) ( not ( = ?auto_73165 ?auto_73163 ) ) ( HOLDING ?auto_73161 ) ( CLEAR ?auto_73162 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73164 ?auto_73165 ?auto_73166 ?auto_73162 ?auto_73161 )
      ( MAKE-3PILE ?auto_73160 ?auto_73161 ?auto_73162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73167 - BLOCK
      ?auto_73168 - BLOCK
      ?auto_73169 - BLOCK
    )
    :vars
    (
      ?auto_73173 - BLOCK
      ?auto_73170 - BLOCK
      ?auto_73171 - BLOCK
      ?auto_73172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73167 ?auto_73168 ) ) ( not ( = ?auto_73167 ?auto_73169 ) ) ( not ( = ?auto_73168 ?auto_73169 ) ) ( ON ?auto_73169 ?auto_73173 ) ( not ( = ?auto_73167 ?auto_73173 ) ) ( not ( = ?auto_73168 ?auto_73173 ) ) ( not ( = ?auto_73169 ?auto_73173 ) ) ( ON-TABLE ?auto_73170 ) ( ON ?auto_73171 ?auto_73170 ) ( ON ?auto_73173 ?auto_73171 ) ( not ( = ?auto_73170 ?auto_73171 ) ) ( not ( = ?auto_73170 ?auto_73173 ) ) ( not ( = ?auto_73170 ?auto_73169 ) ) ( not ( = ?auto_73170 ?auto_73168 ) ) ( not ( = ?auto_73171 ?auto_73173 ) ) ( not ( = ?auto_73171 ?auto_73169 ) ) ( not ( = ?auto_73171 ?auto_73168 ) ) ( not ( = ?auto_73167 ?auto_73170 ) ) ( not ( = ?auto_73167 ?auto_73171 ) ) ( ON ?auto_73167 ?auto_73172 ) ( not ( = ?auto_73167 ?auto_73172 ) ) ( not ( = ?auto_73168 ?auto_73172 ) ) ( not ( = ?auto_73169 ?auto_73172 ) ) ( not ( = ?auto_73173 ?auto_73172 ) ) ( not ( = ?auto_73170 ?auto_73172 ) ) ( not ( = ?auto_73171 ?auto_73172 ) ) ( CLEAR ?auto_73169 ) ( ON ?auto_73168 ?auto_73167 ) ( CLEAR ?auto_73168 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73172 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73172 ?auto_73167 )
      ( MAKE-3PILE ?auto_73167 ?auto_73168 ?auto_73169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73174 - BLOCK
      ?auto_73175 - BLOCK
      ?auto_73176 - BLOCK
    )
    :vars
    (
      ?auto_73178 - BLOCK
      ?auto_73179 - BLOCK
      ?auto_73177 - BLOCK
      ?auto_73180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73174 ?auto_73175 ) ) ( not ( = ?auto_73174 ?auto_73176 ) ) ( not ( = ?auto_73175 ?auto_73176 ) ) ( not ( = ?auto_73174 ?auto_73178 ) ) ( not ( = ?auto_73175 ?auto_73178 ) ) ( not ( = ?auto_73176 ?auto_73178 ) ) ( ON-TABLE ?auto_73179 ) ( ON ?auto_73177 ?auto_73179 ) ( ON ?auto_73178 ?auto_73177 ) ( not ( = ?auto_73179 ?auto_73177 ) ) ( not ( = ?auto_73179 ?auto_73178 ) ) ( not ( = ?auto_73179 ?auto_73176 ) ) ( not ( = ?auto_73179 ?auto_73175 ) ) ( not ( = ?auto_73177 ?auto_73178 ) ) ( not ( = ?auto_73177 ?auto_73176 ) ) ( not ( = ?auto_73177 ?auto_73175 ) ) ( not ( = ?auto_73174 ?auto_73179 ) ) ( not ( = ?auto_73174 ?auto_73177 ) ) ( ON ?auto_73174 ?auto_73180 ) ( not ( = ?auto_73174 ?auto_73180 ) ) ( not ( = ?auto_73175 ?auto_73180 ) ) ( not ( = ?auto_73176 ?auto_73180 ) ) ( not ( = ?auto_73178 ?auto_73180 ) ) ( not ( = ?auto_73179 ?auto_73180 ) ) ( not ( = ?auto_73177 ?auto_73180 ) ) ( ON ?auto_73175 ?auto_73174 ) ( CLEAR ?auto_73175 ) ( ON-TABLE ?auto_73180 ) ( HOLDING ?auto_73176 ) ( CLEAR ?auto_73178 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73179 ?auto_73177 ?auto_73178 ?auto_73176 )
      ( MAKE-3PILE ?auto_73174 ?auto_73175 ?auto_73176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73181 - BLOCK
      ?auto_73182 - BLOCK
      ?auto_73183 - BLOCK
    )
    :vars
    (
      ?auto_73186 - BLOCK
      ?auto_73185 - BLOCK
      ?auto_73184 - BLOCK
      ?auto_73187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73181 ?auto_73182 ) ) ( not ( = ?auto_73181 ?auto_73183 ) ) ( not ( = ?auto_73182 ?auto_73183 ) ) ( not ( = ?auto_73181 ?auto_73186 ) ) ( not ( = ?auto_73182 ?auto_73186 ) ) ( not ( = ?auto_73183 ?auto_73186 ) ) ( ON-TABLE ?auto_73185 ) ( ON ?auto_73184 ?auto_73185 ) ( ON ?auto_73186 ?auto_73184 ) ( not ( = ?auto_73185 ?auto_73184 ) ) ( not ( = ?auto_73185 ?auto_73186 ) ) ( not ( = ?auto_73185 ?auto_73183 ) ) ( not ( = ?auto_73185 ?auto_73182 ) ) ( not ( = ?auto_73184 ?auto_73186 ) ) ( not ( = ?auto_73184 ?auto_73183 ) ) ( not ( = ?auto_73184 ?auto_73182 ) ) ( not ( = ?auto_73181 ?auto_73185 ) ) ( not ( = ?auto_73181 ?auto_73184 ) ) ( ON ?auto_73181 ?auto_73187 ) ( not ( = ?auto_73181 ?auto_73187 ) ) ( not ( = ?auto_73182 ?auto_73187 ) ) ( not ( = ?auto_73183 ?auto_73187 ) ) ( not ( = ?auto_73186 ?auto_73187 ) ) ( not ( = ?auto_73185 ?auto_73187 ) ) ( not ( = ?auto_73184 ?auto_73187 ) ) ( ON ?auto_73182 ?auto_73181 ) ( ON-TABLE ?auto_73187 ) ( CLEAR ?auto_73186 ) ( ON ?auto_73183 ?auto_73182 ) ( CLEAR ?auto_73183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73187 ?auto_73181 ?auto_73182 )
      ( MAKE-3PILE ?auto_73181 ?auto_73182 ?auto_73183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73188 - BLOCK
      ?auto_73189 - BLOCK
      ?auto_73190 - BLOCK
    )
    :vars
    (
      ?auto_73193 - BLOCK
      ?auto_73191 - BLOCK
      ?auto_73192 - BLOCK
      ?auto_73194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73188 ?auto_73189 ) ) ( not ( = ?auto_73188 ?auto_73190 ) ) ( not ( = ?auto_73189 ?auto_73190 ) ) ( not ( = ?auto_73188 ?auto_73193 ) ) ( not ( = ?auto_73189 ?auto_73193 ) ) ( not ( = ?auto_73190 ?auto_73193 ) ) ( ON-TABLE ?auto_73191 ) ( ON ?auto_73192 ?auto_73191 ) ( not ( = ?auto_73191 ?auto_73192 ) ) ( not ( = ?auto_73191 ?auto_73193 ) ) ( not ( = ?auto_73191 ?auto_73190 ) ) ( not ( = ?auto_73191 ?auto_73189 ) ) ( not ( = ?auto_73192 ?auto_73193 ) ) ( not ( = ?auto_73192 ?auto_73190 ) ) ( not ( = ?auto_73192 ?auto_73189 ) ) ( not ( = ?auto_73188 ?auto_73191 ) ) ( not ( = ?auto_73188 ?auto_73192 ) ) ( ON ?auto_73188 ?auto_73194 ) ( not ( = ?auto_73188 ?auto_73194 ) ) ( not ( = ?auto_73189 ?auto_73194 ) ) ( not ( = ?auto_73190 ?auto_73194 ) ) ( not ( = ?auto_73193 ?auto_73194 ) ) ( not ( = ?auto_73191 ?auto_73194 ) ) ( not ( = ?auto_73192 ?auto_73194 ) ) ( ON ?auto_73189 ?auto_73188 ) ( ON-TABLE ?auto_73194 ) ( ON ?auto_73190 ?auto_73189 ) ( CLEAR ?auto_73190 ) ( HOLDING ?auto_73193 ) ( CLEAR ?auto_73192 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73191 ?auto_73192 ?auto_73193 )
      ( MAKE-3PILE ?auto_73188 ?auto_73189 ?auto_73190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73195 - BLOCK
      ?auto_73196 - BLOCK
      ?auto_73197 - BLOCK
    )
    :vars
    (
      ?auto_73198 - BLOCK
      ?auto_73199 - BLOCK
      ?auto_73200 - BLOCK
      ?auto_73201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73195 ?auto_73196 ) ) ( not ( = ?auto_73195 ?auto_73197 ) ) ( not ( = ?auto_73196 ?auto_73197 ) ) ( not ( = ?auto_73195 ?auto_73198 ) ) ( not ( = ?auto_73196 ?auto_73198 ) ) ( not ( = ?auto_73197 ?auto_73198 ) ) ( ON-TABLE ?auto_73199 ) ( ON ?auto_73200 ?auto_73199 ) ( not ( = ?auto_73199 ?auto_73200 ) ) ( not ( = ?auto_73199 ?auto_73198 ) ) ( not ( = ?auto_73199 ?auto_73197 ) ) ( not ( = ?auto_73199 ?auto_73196 ) ) ( not ( = ?auto_73200 ?auto_73198 ) ) ( not ( = ?auto_73200 ?auto_73197 ) ) ( not ( = ?auto_73200 ?auto_73196 ) ) ( not ( = ?auto_73195 ?auto_73199 ) ) ( not ( = ?auto_73195 ?auto_73200 ) ) ( ON ?auto_73195 ?auto_73201 ) ( not ( = ?auto_73195 ?auto_73201 ) ) ( not ( = ?auto_73196 ?auto_73201 ) ) ( not ( = ?auto_73197 ?auto_73201 ) ) ( not ( = ?auto_73198 ?auto_73201 ) ) ( not ( = ?auto_73199 ?auto_73201 ) ) ( not ( = ?auto_73200 ?auto_73201 ) ) ( ON ?auto_73196 ?auto_73195 ) ( ON-TABLE ?auto_73201 ) ( ON ?auto_73197 ?auto_73196 ) ( CLEAR ?auto_73200 ) ( ON ?auto_73198 ?auto_73197 ) ( CLEAR ?auto_73198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73201 ?auto_73195 ?auto_73196 ?auto_73197 )
      ( MAKE-3PILE ?auto_73195 ?auto_73196 ?auto_73197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73202 - BLOCK
      ?auto_73203 - BLOCK
      ?auto_73204 - BLOCK
    )
    :vars
    (
      ?auto_73207 - BLOCK
      ?auto_73206 - BLOCK
      ?auto_73205 - BLOCK
      ?auto_73208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73202 ?auto_73203 ) ) ( not ( = ?auto_73202 ?auto_73204 ) ) ( not ( = ?auto_73203 ?auto_73204 ) ) ( not ( = ?auto_73202 ?auto_73207 ) ) ( not ( = ?auto_73203 ?auto_73207 ) ) ( not ( = ?auto_73204 ?auto_73207 ) ) ( ON-TABLE ?auto_73206 ) ( not ( = ?auto_73206 ?auto_73205 ) ) ( not ( = ?auto_73206 ?auto_73207 ) ) ( not ( = ?auto_73206 ?auto_73204 ) ) ( not ( = ?auto_73206 ?auto_73203 ) ) ( not ( = ?auto_73205 ?auto_73207 ) ) ( not ( = ?auto_73205 ?auto_73204 ) ) ( not ( = ?auto_73205 ?auto_73203 ) ) ( not ( = ?auto_73202 ?auto_73206 ) ) ( not ( = ?auto_73202 ?auto_73205 ) ) ( ON ?auto_73202 ?auto_73208 ) ( not ( = ?auto_73202 ?auto_73208 ) ) ( not ( = ?auto_73203 ?auto_73208 ) ) ( not ( = ?auto_73204 ?auto_73208 ) ) ( not ( = ?auto_73207 ?auto_73208 ) ) ( not ( = ?auto_73206 ?auto_73208 ) ) ( not ( = ?auto_73205 ?auto_73208 ) ) ( ON ?auto_73203 ?auto_73202 ) ( ON-TABLE ?auto_73208 ) ( ON ?auto_73204 ?auto_73203 ) ( ON ?auto_73207 ?auto_73204 ) ( CLEAR ?auto_73207 ) ( HOLDING ?auto_73205 ) ( CLEAR ?auto_73206 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73206 ?auto_73205 )
      ( MAKE-3PILE ?auto_73202 ?auto_73203 ?auto_73204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73209 - BLOCK
      ?auto_73210 - BLOCK
      ?auto_73211 - BLOCK
    )
    :vars
    (
      ?auto_73212 - BLOCK
      ?auto_73215 - BLOCK
      ?auto_73213 - BLOCK
      ?auto_73214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73209 ?auto_73210 ) ) ( not ( = ?auto_73209 ?auto_73211 ) ) ( not ( = ?auto_73210 ?auto_73211 ) ) ( not ( = ?auto_73209 ?auto_73212 ) ) ( not ( = ?auto_73210 ?auto_73212 ) ) ( not ( = ?auto_73211 ?auto_73212 ) ) ( ON-TABLE ?auto_73215 ) ( not ( = ?auto_73215 ?auto_73213 ) ) ( not ( = ?auto_73215 ?auto_73212 ) ) ( not ( = ?auto_73215 ?auto_73211 ) ) ( not ( = ?auto_73215 ?auto_73210 ) ) ( not ( = ?auto_73213 ?auto_73212 ) ) ( not ( = ?auto_73213 ?auto_73211 ) ) ( not ( = ?auto_73213 ?auto_73210 ) ) ( not ( = ?auto_73209 ?auto_73215 ) ) ( not ( = ?auto_73209 ?auto_73213 ) ) ( ON ?auto_73209 ?auto_73214 ) ( not ( = ?auto_73209 ?auto_73214 ) ) ( not ( = ?auto_73210 ?auto_73214 ) ) ( not ( = ?auto_73211 ?auto_73214 ) ) ( not ( = ?auto_73212 ?auto_73214 ) ) ( not ( = ?auto_73215 ?auto_73214 ) ) ( not ( = ?auto_73213 ?auto_73214 ) ) ( ON ?auto_73210 ?auto_73209 ) ( ON-TABLE ?auto_73214 ) ( ON ?auto_73211 ?auto_73210 ) ( ON ?auto_73212 ?auto_73211 ) ( CLEAR ?auto_73215 ) ( ON ?auto_73213 ?auto_73212 ) ( CLEAR ?auto_73213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73214 ?auto_73209 ?auto_73210 ?auto_73211 ?auto_73212 )
      ( MAKE-3PILE ?auto_73209 ?auto_73210 ?auto_73211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73216 - BLOCK
      ?auto_73217 - BLOCK
      ?auto_73218 - BLOCK
    )
    :vars
    (
      ?auto_73221 - BLOCK
      ?auto_73219 - BLOCK
      ?auto_73220 - BLOCK
      ?auto_73222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73216 ?auto_73217 ) ) ( not ( = ?auto_73216 ?auto_73218 ) ) ( not ( = ?auto_73217 ?auto_73218 ) ) ( not ( = ?auto_73216 ?auto_73221 ) ) ( not ( = ?auto_73217 ?auto_73221 ) ) ( not ( = ?auto_73218 ?auto_73221 ) ) ( not ( = ?auto_73219 ?auto_73220 ) ) ( not ( = ?auto_73219 ?auto_73221 ) ) ( not ( = ?auto_73219 ?auto_73218 ) ) ( not ( = ?auto_73219 ?auto_73217 ) ) ( not ( = ?auto_73220 ?auto_73221 ) ) ( not ( = ?auto_73220 ?auto_73218 ) ) ( not ( = ?auto_73220 ?auto_73217 ) ) ( not ( = ?auto_73216 ?auto_73219 ) ) ( not ( = ?auto_73216 ?auto_73220 ) ) ( ON ?auto_73216 ?auto_73222 ) ( not ( = ?auto_73216 ?auto_73222 ) ) ( not ( = ?auto_73217 ?auto_73222 ) ) ( not ( = ?auto_73218 ?auto_73222 ) ) ( not ( = ?auto_73221 ?auto_73222 ) ) ( not ( = ?auto_73219 ?auto_73222 ) ) ( not ( = ?auto_73220 ?auto_73222 ) ) ( ON ?auto_73217 ?auto_73216 ) ( ON-TABLE ?auto_73222 ) ( ON ?auto_73218 ?auto_73217 ) ( ON ?auto_73221 ?auto_73218 ) ( ON ?auto_73220 ?auto_73221 ) ( CLEAR ?auto_73220 ) ( HOLDING ?auto_73219 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73219 )
      ( MAKE-3PILE ?auto_73216 ?auto_73217 ?auto_73218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73223 - BLOCK
      ?auto_73224 - BLOCK
      ?auto_73225 - BLOCK
    )
    :vars
    (
      ?auto_73228 - BLOCK
      ?auto_73229 - BLOCK
      ?auto_73227 - BLOCK
      ?auto_73226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73223 ?auto_73224 ) ) ( not ( = ?auto_73223 ?auto_73225 ) ) ( not ( = ?auto_73224 ?auto_73225 ) ) ( not ( = ?auto_73223 ?auto_73228 ) ) ( not ( = ?auto_73224 ?auto_73228 ) ) ( not ( = ?auto_73225 ?auto_73228 ) ) ( not ( = ?auto_73229 ?auto_73227 ) ) ( not ( = ?auto_73229 ?auto_73228 ) ) ( not ( = ?auto_73229 ?auto_73225 ) ) ( not ( = ?auto_73229 ?auto_73224 ) ) ( not ( = ?auto_73227 ?auto_73228 ) ) ( not ( = ?auto_73227 ?auto_73225 ) ) ( not ( = ?auto_73227 ?auto_73224 ) ) ( not ( = ?auto_73223 ?auto_73229 ) ) ( not ( = ?auto_73223 ?auto_73227 ) ) ( ON ?auto_73223 ?auto_73226 ) ( not ( = ?auto_73223 ?auto_73226 ) ) ( not ( = ?auto_73224 ?auto_73226 ) ) ( not ( = ?auto_73225 ?auto_73226 ) ) ( not ( = ?auto_73228 ?auto_73226 ) ) ( not ( = ?auto_73229 ?auto_73226 ) ) ( not ( = ?auto_73227 ?auto_73226 ) ) ( ON ?auto_73224 ?auto_73223 ) ( ON-TABLE ?auto_73226 ) ( ON ?auto_73225 ?auto_73224 ) ( ON ?auto_73228 ?auto_73225 ) ( ON ?auto_73227 ?auto_73228 ) ( ON ?auto_73229 ?auto_73227 ) ( CLEAR ?auto_73229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73226 ?auto_73223 ?auto_73224 ?auto_73225 ?auto_73228 ?auto_73227 )
      ( MAKE-3PILE ?auto_73223 ?auto_73224 ?auto_73225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73232 - BLOCK
      ?auto_73233 - BLOCK
    )
    :vars
    (
      ?auto_73234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73234 ?auto_73233 ) ( CLEAR ?auto_73234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73232 ) ( ON ?auto_73233 ?auto_73232 ) ( not ( = ?auto_73232 ?auto_73233 ) ) ( not ( = ?auto_73232 ?auto_73234 ) ) ( not ( = ?auto_73233 ?auto_73234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73234 ?auto_73233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73235 - BLOCK
      ?auto_73236 - BLOCK
    )
    :vars
    (
      ?auto_73237 - BLOCK
      ?auto_73238 - BLOCK
      ?auto_73239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73237 ?auto_73236 ) ( CLEAR ?auto_73237 ) ( ON-TABLE ?auto_73235 ) ( ON ?auto_73236 ?auto_73235 ) ( not ( = ?auto_73235 ?auto_73236 ) ) ( not ( = ?auto_73235 ?auto_73237 ) ) ( not ( = ?auto_73236 ?auto_73237 ) ) ( HOLDING ?auto_73238 ) ( CLEAR ?auto_73239 ) ( not ( = ?auto_73235 ?auto_73238 ) ) ( not ( = ?auto_73235 ?auto_73239 ) ) ( not ( = ?auto_73236 ?auto_73238 ) ) ( not ( = ?auto_73236 ?auto_73239 ) ) ( not ( = ?auto_73237 ?auto_73238 ) ) ( not ( = ?auto_73237 ?auto_73239 ) ) ( not ( = ?auto_73238 ?auto_73239 ) ) )
    :subtasks
    ( ( !STACK ?auto_73238 ?auto_73239 )
      ( MAKE-2PILE ?auto_73235 ?auto_73236 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73240 - BLOCK
      ?auto_73241 - BLOCK
    )
    :vars
    (
      ?auto_73244 - BLOCK
      ?auto_73242 - BLOCK
      ?auto_73243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73244 ?auto_73241 ) ( ON-TABLE ?auto_73240 ) ( ON ?auto_73241 ?auto_73240 ) ( not ( = ?auto_73240 ?auto_73241 ) ) ( not ( = ?auto_73240 ?auto_73244 ) ) ( not ( = ?auto_73241 ?auto_73244 ) ) ( CLEAR ?auto_73242 ) ( not ( = ?auto_73240 ?auto_73243 ) ) ( not ( = ?auto_73240 ?auto_73242 ) ) ( not ( = ?auto_73241 ?auto_73243 ) ) ( not ( = ?auto_73241 ?auto_73242 ) ) ( not ( = ?auto_73244 ?auto_73243 ) ) ( not ( = ?auto_73244 ?auto_73242 ) ) ( not ( = ?auto_73243 ?auto_73242 ) ) ( ON ?auto_73243 ?auto_73244 ) ( CLEAR ?auto_73243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73240 ?auto_73241 ?auto_73244 )
      ( MAKE-2PILE ?auto_73240 ?auto_73241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73245 - BLOCK
      ?auto_73246 - BLOCK
    )
    :vars
    (
      ?auto_73249 - BLOCK
      ?auto_73248 - BLOCK
      ?auto_73247 - BLOCK
      ?auto_73250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73249 ?auto_73246 ) ( ON-TABLE ?auto_73245 ) ( ON ?auto_73246 ?auto_73245 ) ( not ( = ?auto_73245 ?auto_73246 ) ) ( not ( = ?auto_73245 ?auto_73249 ) ) ( not ( = ?auto_73246 ?auto_73249 ) ) ( not ( = ?auto_73245 ?auto_73248 ) ) ( not ( = ?auto_73245 ?auto_73247 ) ) ( not ( = ?auto_73246 ?auto_73248 ) ) ( not ( = ?auto_73246 ?auto_73247 ) ) ( not ( = ?auto_73249 ?auto_73248 ) ) ( not ( = ?auto_73249 ?auto_73247 ) ) ( not ( = ?auto_73248 ?auto_73247 ) ) ( ON ?auto_73248 ?auto_73249 ) ( CLEAR ?auto_73248 ) ( HOLDING ?auto_73247 ) ( CLEAR ?auto_73250 ) ( ON-TABLE ?auto_73250 ) ( not ( = ?auto_73250 ?auto_73247 ) ) ( not ( = ?auto_73245 ?auto_73250 ) ) ( not ( = ?auto_73246 ?auto_73250 ) ) ( not ( = ?auto_73249 ?auto_73250 ) ) ( not ( = ?auto_73248 ?auto_73250 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73250 ?auto_73247 )
      ( MAKE-2PILE ?auto_73245 ?auto_73246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73251 - BLOCK
      ?auto_73252 - BLOCK
    )
    :vars
    (
      ?auto_73255 - BLOCK
      ?auto_73254 - BLOCK
      ?auto_73253 - BLOCK
      ?auto_73256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73255 ?auto_73252 ) ( ON-TABLE ?auto_73251 ) ( ON ?auto_73252 ?auto_73251 ) ( not ( = ?auto_73251 ?auto_73252 ) ) ( not ( = ?auto_73251 ?auto_73255 ) ) ( not ( = ?auto_73252 ?auto_73255 ) ) ( not ( = ?auto_73251 ?auto_73254 ) ) ( not ( = ?auto_73251 ?auto_73253 ) ) ( not ( = ?auto_73252 ?auto_73254 ) ) ( not ( = ?auto_73252 ?auto_73253 ) ) ( not ( = ?auto_73255 ?auto_73254 ) ) ( not ( = ?auto_73255 ?auto_73253 ) ) ( not ( = ?auto_73254 ?auto_73253 ) ) ( ON ?auto_73254 ?auto_73255 ) ( CLEAR ?auto_73256 ) ( ON-TABLE ?auto_73256 ) ( not ( = ?auto_73256 ?auto_73253 ) ) ( not ( = ?auto_73251 ?auto_73256 ) ) ( not ( = ?auto_73252 ?auto_73256 ) ) ( not ( = ?auto_73255 ?auto_73256 ) ) ( not ( = ?auto_73254 ?auto_73256 ) ) ( ON ?auto_73253 ?auto_73254 ) ( CLEAR ?auto_73253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73251 ?auto_73252 ?auto_73255 ?auto_73254 )
      ( MAKE-2PILE ?auto_73251 ?auto_73252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73257 - BLOCK
      ?auto_73258 - BLOCK
    )
    :vars
    (
      ?auto_73259 - BLOCK
      ?auto_73262 - BLOCK
      ?auto_73260 - BLOCK
      ?auto_73261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73259 ?auto_73258 ) ( ON-TABLE ?auto_73257 ) ( ON ?auto_73258 ?auto_73257 ) ( not ( = ?auto_73257 ?auto_73258 ) ) ( not ( = ?auto_73257 ?auto_73259 ) ) ( not ( = ?auto_73258 ?auto_73259 ) ) ( not ( = ?auto_73257 ?auto_73262 ) ) ( not ( = ?auto_73257 ?auto_73260 ) ) ( not ( = ?auto_73258 ?auto_73262 ) ) ( not ( = ?auto_73258 ?auto_73260 ) ) ( not ( = ?auto_73259 ?auto_73262 ) ) ( not ( = ?auto_73259 ?auto_73260 ) ) ( not ( = ?auto_73262 ?auto_73260 ) ) ( ON ?auto_73262 ?auto_73259 ) ( not ( = ?auto_73261 ?auto_73260 ) ) ( not ( = ?auto_73257 ?auto_73261 ) ) ( not ( = ?auto_73258 ?auto_73261 ) ) ( not ( = ?auto_73259 ?auto_73261 ) ) ( not ( = ?auto_73262 ?auto_73261 ) ) ( ON ?auto_73260 ?auto_73262 ) ( CLEAR ?auto_73260 ) ( HOLDING ?auto_73261 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73261 )
      ( MAKE-2PILE ?auto_73257 ?auto_73258 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73263 - BLOCK
      ?auto_73264 - BLOCK
    )
    :vars
    (
      ?auto_73267 - BLOCK
      ?auto_73265 - BLOCK
      ?auto_73266 - BLOCK
      ?auto_73268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73267 ?auto_73264 ) ( ON-TABLE ?auto_73263 ) ( ON ?auto_73264 ?auto_73263 ) ( not ( = ?auto_73263 ?auto_73264 ) ) ( not ( = ?auto_73263 ?auto_73267 ) ) ( not ( = ?auto_73264 ?auto_73267 ) ) ( not ( = ?auto_73263 ?auto_73265 ) ) ( not ( = ?auto_73263 ?auto_73266 ) ) ( not ( = ?auto_73264 ?auto_73265 ) ) ( not ( = ?auto_73264 ?auto_73266 ) ) ( not ( = ?auto_73267 ?auto_73265 ) ) ( not ( = ?auto_73267 ?auto_73266 ) ) ( not ( = ?auto_73265 ?auto_73266 ) ) ( ON ?auto_73265 ?auto_73267 ) ( not ( = ?auto_73268 ?auto_73266 ) ) ( not ( = ?auto_73263 ?auto_73268 ) ) ( not ( = ?auto_73264 ?auto_73268 ) ) ( not ( = ?auto_73267 ?auto_73268 ) ) ( not ( = ?auto_73265 ?auto_73268 ) ) ( ON ?auto_73266 ?auto_73265 ) ( ON ?auto_73268 ?auto_73266 ) ( CLEAR ?auto_73268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73263 ?auto_73264 ?auto_73267 ?auto_73265 ?auto_73266 )
      ( MAKE-2PILE ?auto_73263 ?auto_73264 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73269 - BLOCK
      ?auto_73270 - BLOCK
    )
    :vars
    (
      ?auto_73271 - BLOCK
      ?auto_73274 - BLOCK
      ?auto_73273 - BLOCK
      ?auto_73272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73271 ?auto_73270 ) ( ON-TABLE ?auto_73269 ) ( ON ?auto_73270 ?auto_73269 ) ( not ( = ?auto_73269 ?auto_73270 ) ) ( not ( = ?auto_73269 ?auto_73271 ) ) ( not ( = ?auto_73270 ?auto_73271 ) ) ( not ( = ?auto_73269 ?auto_73274 ) ) ( not ( = ?auto_73269 ?auto_73273 ) ) ( not ( = ?auto_73270 ?auto_73274 ) ) ( not ( = ?auto_73270 ?auto_73273 ) ) ( not ( = ?auto_73271 ?auto_73274 ) ) ( not ( = ?auto_73271 ?auto_73273 ) ) ( not ( = ?auto_73274 ?auto_73273 ) ) ( ON ?auto_73274 ?auto_73271 ) ( not ( = ?auto_73272 ?auto_73273 ) ) ( not ( = ?auto_73269 ?auto_73272 ) ) ( not ( = ?auto_73270 ?auto_73272 ) ) ( not ( = ?auto_73271 ?auto_73272 ) ) ( not ( = ?auto_73274 ?auto_73272 ) ) ( ON ?auto_73273 ?auto_73274 ) ( HOLDING ?auto_73272 ) ( CLEAR ?auto_73273 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73269 ?auto_73270 ?auto_73271 ?auto_73274 ?auto_73273 ?auto_73272 )
      ( MAKE-2PILE ?auto_73269 ?auto_73270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73275 - BLOCK
      ?auto_73276 - BLOCK
    )
    :vars
    (
      ?auto_73279 - BLOCK
      ?auto_73277 - BLOCK
      ?auto_73278 - BLOCK
      ?auto_73280 - BLOCK
      ?auto_73281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73279 ?auto_73276 ) ( ON-TABLE ?auto_73275 ) ( ON ?auto_73276 ?auto_73275 ) ( not ( = ?auto_73275 ?auto_73276 ) ) ( not ( = ?auto_73275 ?auto_73279 ) ) ( not ( = ?auto_73276 ?auto_73279 ) ) ( not ( = ?auto_73275 ?auto_73277 ) ) ( not ( = ?auto_73275 ?auto_73278 ) ) ( not ( = ?auto_73276 ?auto_73277 ) ) ( not ( = ?auto_73276 ?auto_73278 ) ) ( not ( = ?auto_73279 ?auto_73277 ) ) ( not ( = ?auto_73279 ?auto_73278 ) ) ( not ( = ?auto_73277 ?auto_73278 ) ) ( ON ?auto_73277 ?auto_73279 ) ( not ( = ?auto_73280 ?auto_73278 ) ) ( not ( = ?auto_73275 ?auto_73280 ) ) ( not ( = ?auto_73276 ?auto_73280 ) ) ( not ( = ?auto_73279 ?auto_73280 ) ) ( not ( = ?auto_73277 ?auto_73280 ) ) ( ON ?auto_73278 ?auto_73277 ) ( CLEAR ?auto_73278 ) ( ON ?auto_73280 ?auto_73281 ) ( CLEAR ?auto_73280 ) ( HAND-EMPTY ) ( not ( = ?auto_73275 ?auto_73281 ) ) ( not ( = ?auto_73276 ?auto_73281 ) ) ( not ( = ?auto_73279 ?auto_73281 ) ) ( not ( = ?auto_73277 ?auto_73281 ) ) ( not ( = ?auto_73278 ?auto_73281 ) ) ( not ( = ?auto_73280 ?auto_73281 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73280 ?auto_73281 )
      ( MAKE-2PILE ?auto_73275 ?auto_73276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73282 - BLOCK
      ?auto_73283 - BLOCK
    )
    :vars
    (
      ?auto_73288 - BLOCK
      ?auto_73284 - BLOCK
      ?auto_73287 - BLOCK
      ?auto_73285 - BLOCK
      ?auto_73286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73288 ?auto_73283 ) ( ON-TABLE ?auto_73282 ) ( ON ?auto_73283 ?auto_73282 ) ( not ( = ?auto_73282 ?auto_73283 ) ) ( not ( = ?auto_73282 ?auto_73288 ) ) ( not ( = ?auto_73283 ?auto_73288 ) ) ( not ( = ?auto_73282 ?auto_73284 ) ) ( not ( = ?auto_73282 ?auto_73287 ) ) ( not ( = ?auto_73283 ?auto_73284 ) ) ( not ( = ?auto_73283 ?auto_73287 ) ) ( not ( = ?auto_73288 ?auto_73284 ) ) ( not ( = ?auto_73288 ?auto_73287 ) ) ( not ( = ?auto_73284 ?auto_73287 ) ) ( ON ?auto_73284 ?auto_73288 ) ( not ( = ?auto_73285 ?auto_73287 ) ) ( not ( = ?auto_73282 ?auto_73285 ) ) ( not ( = ?auto_73283 ?auto_73285 ) ) ( not ( = ?auto_73288 ?auto_73285 ) ) ( not ( = ?auto_73284 ?auto_73285 ) ) ( ON ?auto_73285 ?auto_73286 ) ( CLEAR ?auto_73285 ) ( not ( = ?auto_73282 ?auto_73286 ) ) ( not ( = ?auto_73283 ?auto_73286 ) ) ( not ( = ?auto_73288 ?auto_73286 ) ) ( not ( = ?auto_73284 ?auto_73286 ) ) ( not ( = ?auto_73287 ?auto_73286 ) ) ( not ( = ?auto_73285 ?auto_73286 ) ) ( HOLDING ?auto_73287 ) ( CLEAR ?auto_73284 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73282 ?auto_73283 ?auto_73288 ?auto_73284 ?auto_73287 )
      ( MAKE-2PILE ?auto_73282 ?auto_73283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73289 - BLOCK
      ?auto_73290 - BLOCK
    )
    :vars
    (
      ?auto_73293 - BLOCK
      ?auto_73295 - BLOCK
      ?auto_73291 - BLOCK
      ?auto_73292 - BLOCK
      ?auto_73294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73293 ?auto_73290 ) ( ON-TABLE ?auto_73289 ) ( ON ?auto_73290 ?auto_73289 ) ( not ( = ?auto_73289 ?auto_73290 ) ) ( not ( = ?auto_73289 ?auto_73293 ) ) ( not ( = ?auto_73290 ?auto_73293 ) ) ( not ( = ?auto_73289 ?auto_73295 ) ) ( not ( = ?auto_73289 ?auto_73291 ) ) ( not ( = ?auto_73290 ?auto_73295 ) ) ( not ( = ?auto_73290 ?auto_73291 ) ) ( not ( = ?auto_73293 ?auto_73295 ) ) ( not ( = ?auto_73293 ?auto_73291 ) ) ( not ( = ?auto_73295 ?auto_73291 ) ) ( ON ?auto_73295 ?auto_73293 ) ( not ( = ?auto_73292 ?auto_73291 ) ) ( not ( = ?auto_73289 ?auto_73292 ) ) ( not ( = ?auto_73290 ?auto_73292 ) ) ( not ( = ?auto_73293 ?auto_73292 ) ) ( not ( = ?auto_73295 ?auto_73292 ) ) ( ON ?auto_73292 ?auto_73294 ) ( not ( = ?auto_73289 ?auto_73294 ) ) ( not ( = ?auto_73290 ?auto_73294 ) ) ( not ( = ?auto_73293 ?auto_73294 ) ) ( not ( = ?auto_73295 ?auto_73294 ) ) ( not ( = ?auto_73291 ?auto_73294 ) ) ( not ( = ?auto_73292 ?auto_73294 ) ) ( CLEAR ?auto_73295 ) ( ON ?auto_73291 ?auto_73292 ) ( CLEAR ?auto_73291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73294 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73294 ?auto_73292 )
      ( MAKE-2PILE ?auto_73289 ?auto_73290 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73296 - BLOCK
      ?auto_73297 - BLOCK
    )
    :vars
    (
      ?auto_73298 - BLOCK
      ?auto_73299 - BLOCK
      ?auto_73300 - BLOCK
      ?auto_73302 - BLOCK
      ?auto_73301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73298 ?auto_73297 ) ( ON-TABLE ?auto_73296 ) ( ON ?auto_73297 ?auto_73296 ) ( not ( = ?auto_73296 ?auto_73297 ) ) ( not ( = ?auto_73296 ?auto_73298 ) ) ( not ( = ?auto_73297 ?auto_73298 ) ) ( not ( = ?auto_73296 ?auto_73299 ) ) ( not ( = ?auto_73296 ?auto_73300 ) ) ( not ( = ?auto_73297 ?auto_73299 ) ) ( not ( = ?auto_73297 ?auto_73300 ) ) ( not ( = ?auto_73298 ?auto_73299 ) ) ( not ( = ?auto_73298 ?auto_73300 ) ) ( not ( = ?auto_73299 ?auto_73300 ) ) ( not ( = ?auto_73302 ?auto_73300 ) ) ( not ( = ?auto_73296 ?auto_73302 ) ) ( not ( = ?auto_73297 ?auto_73302 ) ) ( not ( = ?auto_73298 ?auto_73302 ) ) ( not ( = ?auto_73299 ?auto_73302 ) ) ( ON ?auto_73302 ?auto_73301 ) ( not ( = ?auto_73296 ?auto_73301 ) ) ( not ( = ?auto_73297 ?auto_73301 ) ) ( not ( = ?auto_73298 ?auto_73301 ) ) ( not ( = ?auto_73299 ?auto_73301 ) ) ( not ( = ?auto_73300 ?auto_73301 ) ) ( not ( = ?auto_73302 ?auto_73301 ) ) ( ON ?auto_73300 ?auto_73302 ) ( CLEAR ?auto_73300 ) ( ON-TABLE ?auto_73301 ) ( HOLDING ?auto_73299 ) ( CLEAR ?auto_73298 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73296 ?auto_73297 ?auto_73298 ?auto_73299 )
      ( MAKE-2PILE ?auto_73296 ?auto_73297 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73303 - BLOCK
      ?auto_73304 - BLOCK
    )
    :vars
    (
      ?auto_73309 - BLOCK
      ?auto_73306 - BLOCK
      ?auto_73305 - BLOCK
      ?auto_73308 - BLOCK
      ?auto_73307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73309 ?auto_73304 ) ( ON-TABLE ?auto_73303 ) ( ON ?auto_73304 ?auto_73303 ) ( not ( = ?auto_73303 ?auto_73304 ) ) ( not ( = ?auto_73303 ?auto_73309 ) ) ( not ( = ?auto_73304 ?auto_73309 ) ) ( not ( = ?auto_73303 ?auto_73306 ) ) ( not ( = ?auto_73303 ?auto_73305 ) ) ( not ( = ?auto_73304 ?auto_73306 ) ) ( not ( = ?auto_73304 ?auto_73305 ) ) ( not ( = ?auto_73309 ?auto_73306 ) ) ( not ( = ?auto_73309 ?auto_73305 ) ) ( not ( = ?auto_73306 ?auto_73305 ) ) ( not ( = ?auto_73308 ?auto_73305 ) ) ( not ( = ?auto_73303 ?auto_73308 ) ) ( not ( = ?auto_73304 ?auto_73308 ) ) ( not ( = ?auto_73309 ?auto_73308 ) ) ( not ( = ?auto_73306 ?auto_73308 ) ) ( ON ?auto_73308 ?auto_73307 ) ( not ( = ?auto_73303 ?auto_73307 ) ) ( not ( = ?auto_73304 ?auto_73307 ) ) ( not ( = ?auto_73309 ?auto_73307 ) ) ( not ( = ?auto_73306 ?auto_73307 ) ) ( not ( = ?auto_73305 ?auto_73307 ) ) ( not ( = ?auto_73308 ?auto_73307 ) ) ( ON ?auto_73305 ?auto_73308 ) ( ON-TABLE ?auto_73307 ) ( CLEAR ?auto_73309 ) ( ON ?auto_73306 ?auto_73305 ) ( CLEAR ?auto_73306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73307 ?auto_73308 ?auto_73305 )
      ( MAKE-2PILE ?auto_73303 ?auto_73304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73324 - BLOCK
      ?auto_73325 - BLOCK
    )
    :vars
    (
      ?auto_73330 - BLOCK
      ?auto_73327 - BLOCK
      ?auto_73326 - BLOCK
      ?auto_73328 - BLOCK
      ?auto_73329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73324 ) ( not ( = ?auto_73324 ?auto_73325 ) ) ( not ( = ?auto_73324 ?auto_73330 ) ) ( not ( = ?auto_73325 ?auto_73330 ) ) ( not ( = ?auto_73324 ?auto_73327 ) ) ( not ( = ?auto_73324 ?auto_73326 ) ) ( not ( = ?auto_73325 ?auto_73327 ) ) ( not ( = ?auto_73325 ?auto_73326 ) ) ( not ( = ?auto_73330 ?auto_73327 ) ) ( not ( = ?auto_73330 ?auto_73326 ) ) ( not ( = ?auto_73327 ?auto_73326 ) ) ( not ( = ?auto_73328 ?auto_73326 ) ) ( not ( = ?auto_73324 ?auto_73328 ) ) ( not ( = ?auto_73325 ?auto_73328 ) ) ( not ( = ?auto_73330 ?auto_73328 ) ) ( not ( = ?auto_73327 ?auto_73328 ) ) ( ON ?auto_73328 ?auto_73329 ) ( not ( = ?auto_73324 ?auto_73329 ) ) ( not ( = ?auto_73325 ?auto_73329 ) ) ( not ( = ?auto_73330 ?auto_73329 ) ) ( not ( = ?auto_73327 ?auto_73329 ) ) ( not ( = ?auto_73326 ?auto_73329 ) ) ( not ( = ?auto_73328 ?auto_73329 ) ) ( ON ?auto_73326 ?auto_73328 ) ( ON-TABLE ?auto_73329 ) ( ON ?auto_73327 ?auto_73326 ) ( ON ?auto_73330 ?auto_73327 ) ( CLEAR ?auto_73330 ) ( HOLDING ?auto_73325 ) ( CLEAR ?auto_73324 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73324 ?auto_73325 ?auto_73330 )
      ( MAKE-2PILE ?auto_73324 ?auto_73325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73331 - BLOCK
      ?auto_73332 - BLOCK
    )
    :vars
    (
      ?auto_73335 - BLOCK
      ?auto_73334 - BLOCK
      ?auto_73337 - BLOCK
      ?auto_73333 - BLOCK
      ?auto_73336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73331 ) ( not ( = ?auto_73331 ?auto_73332 ) ) ( not ( = ?auto_73331 ?auto_73335 ) ) ( not ( = ?auto_73332 ?auto_73335 ) ) ( not ( = ?auto_73331 ?auto_73334 ) ) ( not ( = ?auto_73331 ?auto_73337 ) ) ( not ( = ?auto_73332 ?auto_73334 ) ) ( not ( = ?auto_73332 ?auto_73337 ) ) ( not ( = ?auto_73335 ?auto_73334 ) ) ( not ( = ?auto_73335 ?auto_73337 ) ) ( not ( = ?auto_73334 ?auto_73337 ) ) ( not ( = ?auto_73333 ?auto_73337 ) ) ( not ( = ?auto_73331 ?auto_73333 ) ) ( not ( = ?auto_73332 ?auto_73333 ) ) ( not ( = ?auto_73335 ?auto_73333 ) ) ( not ( = ?auto_73334 ?auto_73333 ) ) ( ON ?auto_73333 ?auto_73336 ) ( not ( = ?auto_73331 ?auto_73336 ) ) ( not ( = ?auto_73332 ?auto_73336 ) ) ( not ( = ?auto_73335 ?auto_73336 ) ) ( not ( = ?auto_73334 ?auto_73336 ) ) ( not ( = ?auto_73337 ?auto_73336 ) ) ( not ( = ?auto_73333 ?auto_73336 ) ) ( ON ?auto_73337 ?auto_73333 ) ( ON-TABLE ?auto_73336 ) ( ON ?auto_73334 ?auto_73337 ) ( ON ?auto_73335 ?auto_73334 ) ( CLEAR ?auto_73331 ) ( ON ?auto_73332 ?auto_73335 ) ( CLEAR ?auto_73332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73336 ?auto_73333 ?auto_73337 ?auto_73334 ?auto_73335 )
      ( MAKE-2PILE ?auto_73331 ?auto_73332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73338 - BLOCK
      ?auto_73339 - BLOCK
    )
    :vars
    (
      ?auto_73343 - BLOCK
      ?auto_73342 - BLOCK
      ?auto_73341 - BLOCK
      ?auto_73340 - BLOCK
      ?auto_73344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73338 ?auto_73339 ) ) ( not ( = ?auto_73338 ?auto_73343 ) ) ( not ( = ?auto_73339 ?auto_73343 ) ) ( not ( = ?auto_73338 ?auto_73342 ) ) ( not ( = ?auto_73338 ?auto_73341 ) ) ( not ( = ?auto_73339 ?auto_73342 ) ) ( not ( = ?auto_73339 ?auto_73341 ) ) ( not ( = ?auto_73343 ?auto_73342 ) ) ( not ( = ?auto_73343 ?auto_73341 ) ) ( not ( = ?auto_73342 ?auto_73341 ) ) ( not ( = ?auto_73340 ?auto_73341 ) ) ( not ( = ?auto_73338 ?auto_73340 ) ) ( not ( = ?auto_73339 ?auto_73340 ) ) ( not ( = ?auto_73343 ?auto_73340 ) ) ( not ( = ?auto_73342 ?auto_73340 ) ) ( ON ?auto_73340 ?auto_73344 ) ( not ( = ?auto_73338 ?auto_73344 ) ) ( not ( = ?auto_73339 ?auto_73344 ) ) ( not ( = ?auto_73343 ?auto_73344 ) ) ( not ( = ?auto_73342 ?auto_73344 ) ) ( not ( = ?auto_73341 ?auto_73344 ) ) ( not ( = ?auto_73340 ?auto_73344 ) ) ( ON ?auto_73341 ?auto_73340 ) ( ON-TABLE ?auto_73344 ) ( ON ?auto_73342 ?auto_73341 ) ( ON ?auto_73343 ?auto_73342 ) ( ON ?auto_73339 ?auto_73343 ) ( CLEAR ?auto_73339 ) ( HOLDING ?auto_73338 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73338 )
      ( MAKE-2PILE ?auto_73338 ?auto_73339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73345 - BLOCK
      ?auto_73346 - BLOCK
    )
    :vars
    (
      ?auto_73349 - BLOCK
      ?auto_73351 - BLOCK
      ?auto_73350 - BLOCK
      ?auto_73347 - BLOCK
      ?auto_73348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73345 ?auto_73346 ) ) ( not ( = ?auto_73345 ?auto_73349 ) ) ( not ( = ?auto_73346 ?auto_73349 ) ) ( not ( = ?auto_73345 ?auto_73351 ) ) ( not ( = ?auto_73345 ?auto_73350 ) ) ( not ( = ?auto_73346 ?auto_73351 ) ) ( not ( = ?auto_73346 ?auto_73350 ) ) ( not ( = ?auto_73349 ?auto_73351 ) ) ( not ( = ?auto_73349 ?auto_73350 ) ) ( not ( = ?auto_73351 ?auto_73350 ) ) ( not ( = ?auto_73347 ?auto_73350 ) ) ( not ( = ?auto_73345 ?auto_73347 ) ) ( not ( = ?auto_73346 ?auto_73347 ) ) ( not ( = ?auto_73349 ?auto_73347 ) ) ( not ( = ?auto_73351 ?auto_73347 ) ) ( ON ?auto_73347 ?auto_73348 ) ( not ( = ?auto_73345 ?auto_73348 ) ) ( not ( = ?auto_73346 ?auto_73348 ) ) ( not ( = ?auto_73349 ?auto_73348 ) ) ( not ( = ?auto_73351 ?auto_73348 ) ) ( not ( = ?auto_73350 ?auto_73348 ) ) ( not ( = ?auto_73347 ?auto_73348 ) ) ( ON ?auto_73350 ?auto_73347 ) ( ON-TABLE ?auto_73348 ) ( ON ?auto_73351 ?auto_73350 ) ( ON ?auto_73349 ?auto_73351 ) ( ON ?auto_73346 ?auto_73349 ) ( ON ?auto_73345 ?auto_73346 ) ( CLEAR ?auto_73345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73348 ?auto_73347 ?auto_73350 ?auto_73351 ?auto_73349 ?auto_73346 )
      ( MAKE-2PILE ?auto_73345 ?auto_73346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73356 - BLOCK
      ?auto_73357 - BLOCK
      ?auto_73358 - BLOCK
      ?auto_73359 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_73359 ) ( CLEAR ?auto_73358 ) ( ON-TABLE ?auto_73356 ) ( ON ?auto_73357 ?auto_73356 ) ( ON ?auto_73358 ?auto_73357 ) ( not ( = ?auto_73356 ?auto_73357 ) ) ( not ( = ?auto_73356 ?auto_73358 ) ) ( not ( = ?auto_73356 ?auto_73359 ) ) ( not ( = ?auto_73357 ?auto_73358 ) ) ( not ( = ?auto_73357 ?auto_73359 ) ) ( not ( = ?auto_73358 ?auto_73359 ) ) )
    :subtasks
    ( ( !STACK ?auto_73359 ?auto_73358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73360 - BLOCK
      ?auto_73361 - BLOCK
      ?auto_73362 - BLOCK
      ?auto_73363 - BLOCK
    )
    :vars
    (
      ?auto_73364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73362 ) ( ON-TABLE ?auto_73360 ) ( ON ?auto_73361 ?auto_73360 ) ( ON ?auto_73362 ?auto_73361 ) ( not ( = ?auto_73360 ?auto_73361 ) ) ( not ( = ?auto_73360 ?auto_73362 ) ) ( not ( = ?auto_73360 ?auto_73363 ) ) ( not ( = ?auto_73361 ?auto_73362 ) ) ( not ( = ?auto_73361 ?auto_73363 ) ) ( not ( = ?auto_73362 ?auto_73363 ) ) ( ON ?auto_73363 ?auto_73364 ) ( CLEAR ?auto_73363 ) ( HAND-EMPTY ) ( not ( = ?auto_73360 ?auto_73364 ) ) ( not ( = ?auto_73361 ?auto_73364 ) ) ( not ( = ?auto_73362 ?auto_73364 ) ) ( not ( = ?auto_73363 ?auto_73364 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73363 ?auto_73364 )
      ( MAKE-4PILE ?auto_73360 ?auto_73361 ?auto_73362 ?auto_73363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73365 - BLOCK
      ?auto_73366 - BLOCK
      ?auto_73367 - BLOCK
      ?auto_73368 - BLOCK
    )
    :vars
    (
      ?auto_73369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73365 ) ( ON ?auto_73366 ?auto_73365 ) ( not ( = ?auto_73365 ?auto_73366 ) ) ( not ( = ?auto_73365 ?auto_73367 ) ) ( not ( = ?auto_73365 ?auto_73368 ) ) ( not ( = ?auto_73366 ?auto_73367 ) ) ( not ( = ?auto_73366 ?auto_73368 ) ) ( not ( = ?auto_73367 ?auto_73368 ) ) ( ON ?auto_73368 ?auto_73369 ) ( CLEAR ?auto_73368 ) ( not ( = ?auto_73365 ?auto_73369 ) ) ( not ( = ?auto_73366 ?auto_73369 ) ) ( not ( = ?auto_73367 ?auto_73369 ) ) ( not ( = ?auto_73368 ?auto_73369 ) ) ( HOLDING ?auto_73367 ) ( CLEAR ?auto_73366 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73365 ?auto_73366 ?auto_73367 )
      ( MAKE-4PILE ?auto_73365 ?auto_73366 ?auto_73367 ?auto_73368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73370 - BLOCK
      ?auto_73371 - BLOCK
      ?auto_73372 - BLOCK
      ?auto_73373 - BLOCK
    )
    :vars
    (
      ?auto_73374 - BLOCK
      ?auto_73375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73370 ) ( ON ?auto_73371 ?auto_73370 ) ( not ( = ?auto_73370 ?auto_73371 ) ) ( not ( = ?auto_73370 ?auto_73372 ) ) ( not ( = ?auto_73370 ?auto_73373 ) ) ( not ( = ?auto_73371 ?auto_73372 ) ) ( not ( = ?auto_73371 ?auto_73373 ) ) ( not ( = ?auto_73372 ?auto_73373 ) ) ( ON ?auto_73373 ?auto_73374 ) ( not ( = ?auto_73370 ?auto_73374 ) ) ( not ( = ?auto_73371 ?auto_73374 ) ) ( not ( = ?auto_73372 ?auto_73374 ) ) ( not ( = ?auto_73373 ?auto_73374 ) ) ( CLEAR ?auto_73371 ) ( ON ?auto_73372 ?auto_73373 ) ( CLEAR ?auto_73372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73375 ) ( ON ?auto_73374 ?auto_73375 ) ( not ( = ?auto_73375 ?auto_73374 ) ) ( not ( = ?auto_73375 ?auto_73373 ) ) ( not ( = ?auto_73375 ?auto_73372 ) ) ( not ( = ?auto_73370 ?auto_73375 ) ) ( not ( = ?auto_73371 ?auto_73375 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73375 ?auto_73374 ?auto_73373 )
      ( MAKE-4PILE ?auto_73370 ?auto_73371 ?auto_73372 ?auto_73373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73376 - BLOCK
      ?auto_73377 - BLOCK
      ?auto_73378 - BLOCK
      ?auto_73379 - BLOCK
    )
    :vars
    (
      ?auto_73381 - BLOCK
      ?auto_73380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73376 ) ( not ( = ?auto_73376 ?auto_73377 ) ) ( not ( = ?auto_73376 ?auto_73378 ) ) ( not ( = ?auto_73376 ?auto_73379 ) ) ( not ( = ?auto_73377 ?auto_73378 ) ) ( not ( = ?auto_73377 ?auto_73379 ) ) ( not ( = ?auto_73378 ?auto_73379 ) ) ( ON ?auto_73379 ?auto_73381 ) ( not ( = ?auto_73376 ?auto_73381 ) ) ( not ( = ?auto_73377 ?auto_73381 ) ) ( not ( = ?auto_73378 ?auto_73381 ) ) ( not ( = ?auto_73379 ?auto_73381 ) ) ( ON ?auto_73378 ?auto_73379 ) ( CLEAR ?auto_73378 ) ( ON-TABLE ?auto_73380 ) ( ON ?auto_73381 ?auto_73380 ) ( not ( = ?auto_73380 ?auto_73381 ) ) ( not ( = ?auto_73380 ?auto_73379 ) ) ( not ( = ?auto_73380 ?auto_73378 ) ) ( not ( = ?auto_73376 ?auto_73380 ) ) ( not ( = ?auto_73377 ?auto_73380 ) ) ( HOLDING ?auto_73377 ) ( CLEAR ?auto_73376 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73376 ?auto_73377 )
      ( MAKE-4PILE ?auto_73376 ?auto_73377 ?auto_73378 ?auto_73379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73382 - BLOCK
      ?auto_73383 - BLOCK
      ?auto_73384 - BLOCK
      ?auto_73385 - BLOCK
    )
    :vars
    (
      ?auto_73387 - BLOCK
      ?auto_73386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73382 ) ( not ( = ?auto_73382 ?auto_73383 ) ) ( not ( = ?auto_73382 ?auto_73384 ) ) ( not ( = ?auto_73382 ?auto_73385 ) ) ( not ( = ?auto_73383 ?auto_73384 ) ) ( not ( = ?auto_73383 ?auto_73385 ) ) ( not ( = ?auto_73384 ?auto_73385 ) ) ( ON ?auto_73385 ?auto_73387 ) ( not ( = ?auto_73382 ?auto_73387 ) ) ( not ( = ?auto_73383 ?auto_73387 ) ) ( not ( = ?auto_73384 ?auto_73387 ) ) ( not ( = ?auto_73385 ?auto_73387 ) ) ( ON ?auto_73384 ?auto_73385 ) ( ON-TABLE ?auto_73386 ) ( ON ?auto_73387 ?auto_73386 ) ( not ( = ?auto_73386 ?auto_73387 ) ) ( not ( = ?auto_73386 ?auto_73385 ) ) ( not ( = ?auto_73386 ?auto_73384 ) ) ( not ( = ?auto_73382 ?auto_73386 ) ) ( not ( = ?auto_73383 ?auto_73386 ) ) ( CLEAR ?auto_73382 ) ( ON ?auto_73383 ?auto_73384 ) ( CLEAR ?auto_73383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73386 ?auto_73387 ?auto_73385 ?auto_73384 )
      ( MAKE-4PILE ?auto_73382 ?auto_73383 ?auto_73384 ?auto_73385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73388 - BLOCK
      ?auto_73389 - BLOCK
      ?auto_73390 - BLOCK
      ?auto_73391 - BLOCK
    )
    :vars
    (
      ?auto_73393 - BLOCK
      ?auto_73392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73388 ?auto_73389 ) ) ( not ( = ?auto_73388 ?auto_73390 ) ) ( not ( = ?auto_73388 ?auto_73391 ) ) ( not ( = ?auto_73389 ?auto_73390 ) ) ( not ( = ?auto_73389 ?auto_73391 ) ) ( not ( = ?auto_73390 ?auto_73391 ) ) ( ON ?auto_73391 ?auto_73393 ) ( not ( = ?auto_73388 ?auto_73393 ) ) ( not ( = ?auto_73389 ?auto_73393 ) ) ( not ( = ?auto_73390 ?auto_73393 ) ) ( not ( = ?auto_73391 ?auto_73393 ) ) ( ON ?auto_73390 ?auto_73391 ) ( ON-TABLE ?auto_73392 ) ( ON ?auto_73393 ?auto_73392 ) ( not ( = ?auto_73392 ?auto_73393 ) ) ( not ( = ?auto_73392 ?auto_73391 ) ) ( not ( = ?auto_73392 ?auto_73390 ) ) ( not ( = ?auto_73388 ?auto_73392 ) ) ( not ( = ?auto_73389 ?auto_73392 ) ) ( ON ?auto_73389 ?auto_73390 ) ( CLEAR ?auto_73389 ) ( HOLDING ?auto_73388 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73388 )
      ( MAKE-4PILE ?auto_73388 ?auto_73389 ?auto_73390 ?auto_73391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73394 - BLOCK
      ?auto_73395 - BLOCK
      ?auto_73396 - BLOCK
      ?auto_73397 - BLOCK
    )
    :vars
    (
      ?auto_73399 - BLOCK
      ?auto_73398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73394 ?auto_73395 ) ) ( not ( = ?auto_73394 ?auto_73396 ) ) ( not ( = ?auto_73394 ?auto_73397 ) ) ( not ( = ?auto_73395 ?auto_73396 ) ) ( not ( = ?auto_73395 ?auto_73397 ) ) ( not ( = ?auto_73396 ?auto_73397 ) ) ( ON ?auto_73397 ?auto_73399 ) ( not ( = ?auto_73394 ?auto_73399 ) ) ( not ( = ?auto_73395 ?auto_73399 ) ) ( not ( = ?auto_73396 ?auto_73399 ) ) ( not ( = ?auto_73397 ?auto_73399 ) ) ( ON ?auto_73396 ?auto_73397 ) ( ON-TABLE ?auto_73398 ) ( ON ?auto_73399 ?auto_73398 ) ( not ( = ?auto_73398 ?auto_73399 ) ) ( not ( = ?auto_73398 ?auto_73397 ) ) ( not ( = ?auto_73398 ?auto_73396 ) ) ( not ( = ?auto_73394 ?auto_73398 ) ) ( not ( = ?auto_73395 ?auto_73398 ) ) ( ON ?auto_73395 ?auto_73396 ) ( ON ?auto_73394 ?auto_73395 ) ( CLEAR ?auto_73394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73398 ?auto_73399 ?auto_73397 ?auto_73396 ?auto_73395 )
      ( MAKE-4PILE ?auto_73394 ?auto_73395 ?auto_73396 ?auto_73397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73400 - BLOCK
      ?auto_73401 - BLOCK
      ?auto_73402 - BLOCK
      ?auto_73403 - BLOCK
    )
    :vars
    (
      ?auto_73405 - BLOCK
      ?auto_73404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73400 ?auto_73401 ) ) ( not ( = ?auto_73400 ?auto_73402 ) ) ( not ( = ?auto_73400 ?auto_73403 ) ) ( not ( = ?auto_73401 ?auto_73402 ) ) ( not ( = ?auto_73401 ?auto_73403 ) ) ( not ( = ?auto_73402 ?auto_73403 ) ) ( ON ?auto_73403 ?auto_73405 ) ( not ( = ?auto_73400 ?auto_73405 ) ) ( not ( = ?auto_73401 ?auto_73405 ) ) ( not ( = ?auto_73402 ?auto_73405 ) ) ( not ( = ?auto_73403 ?auto_73405 ) ) ( ON ?auto_73402 ?auto_73403 ) ( ON-TABLE ?auto_73404 ) ( ON ?auto_73405 ?auto_73404 ) ( not ( = ?auto_73404 ?auto_73405 ) ) ( not ( = ?auto_73404 ?auto_73403 ) ) ( not ( = ?auto_73404 ?auto_73402 ) ) ( not ( = ?auto_73400 ?auto_73404 ) ) ( not ( = ?auto_73401 ?auto_73404 ) ) ( ON ?auto_73401 ?auto_73402 ) ( HOLDING ?auto_73400 ) ( CLEAR ?auto_73401 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73404 ?auto_73405 ?auto_73403 ?auto_73402 ?auto_73401 ?auto_73400 )
      ( MAKE-4PILE ?auto_73400 ?auto_73401 ?auto_73402 ?auto_73403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73406 - BLOCK
      ?auto_73407 - BLOCK
      ?auto_73408 - BLOCK
      ?auto_73409 - BLOCK
    )
    :vars
    (
      ?auto_73411 - BLOCK
      ?auto_73410 - BLOCK
      ?auto_73412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73406 ?auto_73407 ) ) ( not ( = ?auto_73406 ?auto_73408 ) ) ( not ( = ?auto_73406 ?auto_73409 ) ) ( not ( = ?auto_73407 ?auto_73408 ) ) ( not ( = ?auto_73407 ?auto_73409 ) ) ( not ( = ?auto_73408 ?auto_73409 ) ) ( ON ?auto_73409 ?auto_73411 ) ( not ( = ?auto_73406 ?auto_73411 ) ) ( not ( = ?auto_73407 ?auto_73411 ) ) ( not ( = ?auto_73408 ?auto_73411 ) ) ( not ( = ?auto_73409 ?auto_73411 ) ) ( ON ?auto_73408 ?auto_73409 ) ( ON-TABLE ?auto_73410 ) ( ON ?auto_73411 ?auto_73410 ) ( not ( = ?auto_73410 ?auto_73411 ) ) ( not ( = ?auto_73410 ?auto_73409 ) ) ( not ( = ?auto_73410 ?auto_73408 ) ) ( not ( = ?auto_73406 ?auto_73410 ) ) ( not ( = ?auto_73407 ?auto_73410 ) ) ( ON ?auto_73407 ?auto_73408 ) ( CLEAR ?auto_73407 ) ( ON ?auto_73406 ?auto_73412 ) ( CLEAR ?auto_73406 ) ( HAND-EMPTY ) ( not ( = ?auto_73406 ?auto_73412 ) ) ( not ( = ?auto_73407 ?auto_73412 ) ) ( not ( = ?auto_73408 ?auto_73412 ) ) ( not ( = ?auto_73409 ?auto_73412 ) ) ( not ( = ?auto_73411 ?auto_73412 ) ) ( not ( = ?auto_73410 ?auto_73412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73406 ?auto_73412 )
      ( MAKE-4PILE ?auto_73406 ?auto_73407 ?auto_73408 ?auto_73409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73413 - BLOCK
      ?auto_73414 - BLOCK
      ?auto_73415 - BLOCK
      ?auto_73416 - BLOCK
    )
    :vars
    (
      ?auto_73419 - BLOCK
      ?auto_73418 - BLOCK
      ?auto_73417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73413 ?auto_73414 ) ) ( not ( = ?auto_73413 ?auto_73415 ) ) ( not ( = ?auto_73413 ?auto_73416 ) ) ( not ( = ?auto_73414 ?auto_73415 ) ) ( not ( = ?auto_73414 ?auto_73416 ) ) ( not ( = ?auto_73415 ?auto_73416 ) ) ( ON ?auto_73416 ?auto_73419 ) ( not ( = ?auto_73413 ?auto_73419 ) ) ( not ( = ?auto_73414 ?auto_73419 ) ) ( not ( = ?auto_73415 ?auto_73419 ) ) ( not ( = ?auto_73416 ?auto_73419 ) ) ( ON ?auto_73415 ?auto_73416 ) ( ON-TABLE ?auto_73418 ) ( ON ?auto_73419 ?auto_73418 ) ( not ( = ?auto_73418 ?auto_73419 ) ) ( not ( = ?auto_73418 ?auto_73416 ) ) ( not ( = ?auto_73418 ?auto_73415 ) ) ( not ( = ?auto_73413 ?auto_73418 ) ) ( not ( = ?auto_73414 ?auto_73418 ) ) ( ON ?auto_73413 ?auto_73417 ) ( CLEAR ?auto_73413 ) ( not ( = ?auto_73413 ?auto_73417 ) ) ( not ( = ?auto_73414 ?auto_73417 ) ) ( not ( = ?auto_73415 ?auto_73417 ) ) ( not ( = ?auto_73416 ?auto_73417 ) ) ( not ( = ?auto_73419 ?auto_73417 ) ) ( not ( = ?auto_73418 ?auto_73417 ) ) ( HOLDING ?auto_73414 ) ( CLEAR ?auto_73415 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73418 ?auto_73419 ?auto_73416 ?auto_73415 ?auto_73414 )
      ( MAKE-4PILE ?auto_73413 ?auto_73414 ?auto_73415 ?auto_73416 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73420 - BLOCK
      ?auto_73421 - BLOCK
      ?auto_73422 - BLOCK
      ?auto_73423 - BLOCK
    )
    :vars
    (
      ?auto_73424 - BLOCK
      ?auto_73425 - BLOCK
      ?auto_73426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73420 ?auto_73421 ) ) ( not ( = ?auto_73420 ?auto_73422 ) ) ( not ( = ?auto_73420 ?auto_73423 ) ) ( not ( = ?auto_73421 ?auto_73422 ) ) ( not ( = ?auto_73421 ?auto_73423 ) ) ( not ( = ?auto_73422 ?auto_73423 ) ) ( ON ?auto_73423 ?auto_73424 ) ( not ( = ?auto_73420 ?auto_73424 ) ) ( not ( = ?auto_73421 ?auto_73424 ) ) ( not ( = ?auto_73422 ?auto_73424 ) ) ( not ( = ?auto_73423 ?auto_73424 ) ) ( ON ?auto_73422 ?auto_73423 ) ( ON-TABLE ?auto_73425 ) ( ON ?auto_73424 ?auto_73425 ) ( not ( = ?auto_73425 ?auto_73424 ) ) ( not ( = ?auto_73425 ?auto_73423 ) ) ( not ( = ?auto_73425 ?auto_73422 ) ) ( not ( = ?auto_73420 ?auto_73425 ) ) ( not ( = ?auto_73421 ?auto_73425 ) ) ( ON ?auto_73420 ?auto_73426 ) ( not ( = ?auto_73420 ?auto_73426 ) ) ( not ( = ?auto_73421 ?auto_73426 ) ) ( not ( = ?auto_73422 ?auto_73426 ) ) ( not ( = ?auto_73423 ?auto_73426 ) ) ( not ( = ?auto_73424 ?auto_73426 ) ) ( not ( = ?auto_73425 ?auto_73426 ) ) ( CLEAR ?auto_73422 ) ( ON ?auto_73421 ?auto_73420 ) ( CLEAR ?auto_73421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73426 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73426 ?auto_73420 )
      ( MAKE-4PILE ?auto_73420 ?auto_73421 ?auto_73422 ?auto_73423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73427 - BLOCK
      ?auto_73428 - BLOCK
      ?auto_73429 - BLOCK
      ?auto_73430 - BLOCK
    )
    :vars
    (
      ?auto_73431 - BLOCK
      ?auto_73432 - BLOCK
      ?auto_73433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73427 ?auto_73428 ) ) ( not ( = ?auto_73427 ?auto_73429 ) ) ( not ( = ?auto_73427 ?auto_73430 ) ) ( not ( = ?auto_73428 ?auto_73429 ) ) ( not ( = ?auto_73428 ?auto_73430 ) ) ( not ( = ?auto_73429 ?auto_73430 ) ) ( ON ?auto_73430 ?auto_73431 ) ( not ( = ?auto_73427 ?auto_73431 ) ) ( not ( = ?auto_73428 ?auto_73431 ) ) ( not ( = ?auto_73429 ?auto_73431 ) ) ( not ( = ?auto_73430 ?auto_73431 ) ) ( ON-TABLE ?auto_73432 ) ( ON ?auto_73431 ?auto_73432 ) ( not ( = ?auto_73432 ?auto_73431 ) ) ( not ( = ?auto_73432 ?auto_73430 ) ) ( not ( = ?auto_73432 ?auto_73429 ) ) ( not ( = ?auto_73427 ?auto_73432 ) ) ( not ( = ?auto_73428 ?auto_73432 ) ) ( ON ?auto_73427 ?auto_73433 ) ( not ( = ?auto_73427 ?auto_73433 ) ) ( not ( = ?auto_73428 ?auto_73433 ) ) ( not ( = ?auto_73429 ?auto_73433 ) ) ( not ( = ?auto_73430 ?auto_73433 ) ) ( not ( = ?auto_73431 ?auto_73433 ) ) ( not ( = ?auto_73432 ?auto_73433 ) ) ( ON ?auto_73428 ?auto_73427 ) ( CLEAR ?auto_73428 ) ( ON-TABLE ?auto_73433 ) ( HOLDING ?auto_73429 ) ( CLEAR ?auto_73430 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73432 ?auto_73431 ?auto_73430 ?auto_73429 )
      ( MAKE-4PILE ?auto_73427 ?auto_73428 ?auto_73429 ?auto_73430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73434 - BLOCK
      ?auto_73435 - BLOCK
      ?auto_73436 - BLOCK
      ?auto_73437 - BLOCK
    )
    :vars
    (
      ?auto_73439 - BLOCK
      ?auto_73438 - BLOCK
      ?auto_73440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73434 ?auto_73435 ) ) ( not ( = ?auto_73434 ?auto_73436 ) ) ( not ( = ?auto_73434 ?auto_73437 ) ) ( not ( = ?auto_73435 ?auto_73436 ) ) ( not ( = ?auto_73435 ?auto_73437 ) ) ( not ( = ?auto_73436 ?auto_73437 ) ) ( ON ?auto_73437 ?auto_73439 ) ( not ( = ?auto_73434 ?auto_73439 ) ) ( not ( = ?auto_73435 ?auto_73439 ) ) ( not ( = ?auto_73436 ?auto_73439 ) ) ( not ( = ?auto_73437 ?auto_73439 ) ) ( ON-TABLE ?auto_73438 ) ( ON ?auto_73439 ?auto_73438 ) ( not ( = ?auto_73438 ?auto_73439 ) ) ( not ( = ?auto_73438 ?auto_73437 ) ) ( not ( = ?auto_73438 ?auto_73436 ) ) ( not ( = ?auto_73434 ?auto_73438 ) ) ( not ( = ?auto_73435 ?auto_73438 ) ) ( ON ?auto_73434 ?auto_73440 ) ( not ( = ?auto_73434 ?auto_73440 ) ) ( not ( = ?auto_73435 ?auto_73440 ) ) ( not ( = ?auto_73436 ?auto_73440 ) ) ( not ( = ?auto_73437 ?auto_73440 ) ) ( not ( = ?auto_73439 ?auto_73440 ) ) ( not ( = ?auto_73438 ?auto_73440 ) ) ( ON ?auto_73435 ?auto_73434 ) ( ON-TABLE ?auto_73440 ) ( CLEAR ?auto_73437 ) ( ON ?auto_73436 ?auto_73435 ) ( CLEAR ?auto_73436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73440 ?auto_73434 ?auto_73435 )
      ( MAKE-4PILE ?auto_73434 ?auto_73435 ?auto_73436 ?auto_73437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73441 - BLOCK
      ?auto_73442 - BLOCK
      ?auto_73443 - BLOCK
      ?auto_73444 - BLOCK
    )
    :vars
    (
      ?auto_73446 - BLOCK
      ?auto_73447 - BLOCK
      ?auto_73445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73441 ?auto_73442 ) ) ( not ( = ?auto_73441 ?auto_73443 ) ) ( not ( = ?auto_73441 ?auto_73444 ) ) ( not ( = ?auto_73442 ?auto_73443 ) ) ( not ( = ?auto_73442 ?auto_73444 ) ) ( not ( = ?auto_73443 ?auto_73444 ) ) ( not ( = ?auto_73441 ?auto_73446 ) ) ( not ( = ?auto_73442 ?auto_73446 ) ) ( not ( = ?auto_73443 ?auto_73446 ) ) ( not ( = ?auto_73444 ?auto_73446 ) ) ( ON-TABLE ?auto_73447 ) ( ON ?auto_73446 ?auto_73447 ) ( not ( = ?auto_73447 ?auto_73446 ) ) ( not ( = ?auto_73447 ?auto_73444 ) ) ( not ( = ?auto_73447 ?auto_73443 ) ) ( not ( = ?auto_73441 ?auto_73447 ) ) ( not ( = ?auto_73442 ?auto_73447 ) ) ( ON ?auto_73441 ?auto_73445 ) ( not ( = ?auto_73441 ?auto_73445 ) ) ( not ( = ?auto_73442 ?auto_73445 ) ) ( not ( = ?auto_73443 ?auto_73445 ) ) ( not ( = ?auto_73444 ?auto_73445 ) ) ( not ( = ?auto_73446 ?auto_73445 ) ) ( not ( = ?auto_73447 ?auto_73445 ) ) ( ON ?auto_73442 ?auto_73441 ) ( ON-TABLE ?auto_73445 ) ( ON ?auto_73443 ?auto_73442 ) ( CLEAR ?auto_73443 ) ( HOLDING ?auto_73444 ) ( CLEAR ?auto_73446 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73447 ?auto_73446 ?auto_73444 )
      ( MAKE-4PILE ?auto_73441 ?auto_73442 ?auto_73443 ?auto_73444 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73448 - BLOCK
      ?auto_73449 - BLOCK
      ?auto_73450 - BLOCK
      ?auto_73451 - BLOCK
    )
    :vars
    (
      ?auto_73452 - BLOCK
      ?auto_73454 - BLOCK
      ?auto_73453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73448 ?auto_73449 ) ) ( not ( = ?auto_73448 ?auto_73450 ) ) ( not ( = ?auto_73448 ?auto_73451 ) ) ( not ( = ?auto_73449 ?auto_73450 ) ) ( not ( = ?auto_73449 ?auto_73451 ) ) ( not ( = ?auto_73450 ?auto_73451 ) ) ( not ( = ?auto_73448 ?auto_73452 ) ) ( not ( = ?auto_73449 ?auto_73452 ) ) ( not ( = ?auto_73450 ?auto_73452 ) ) ( not ( = ?auto_73451 ?auto_73452 ) ) ( ON-TABLE ?auto_73454 ) ( ON ?auto_73452 ?auto_73454 ) ( not ( = ?auto_73454 ?auto_73452 ) ) ( not ( = ?auto_73454 ?auto_73451 ) ) ( not ( = ?auto_73454 ?auto_73450 ) ) ( not ( = ?auto_73448 ?auto_73454 ) ) ( not ( = ?auto_73449 ?auto_73454 ) ) ( ON ?auto_73448 ?auto_73453 ) ( not ( = ?auto_73448 ?auto_73453 ) ) ( not ( = ?auto_73449 ?auto_73453 ) ) ( not ( = ?auto_73450 ?auto_73453 ) ) ( not ( = ?auto_73451 ?auto_73453 ) ) ( not ( = ?auto_73452 ?auto_73453 ) ) ( not ( = ?auto_73454 ?auto_73453 ) ) ( ON ?auto_73449 ?auto_73448 ) ( ON-TABLE ?auto_73453 ) ( ON ?auto_73450 ?auto_73449 ) ( CLEAR ?auto_73452 ) ( ON ?auto_73451 ?auto_73450 ) ( CLEAR ?auto_73451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73453 ?auto_73448 ?auto_73449 ?auto_73450 )
      ( MAKE-4PILE ?auto_73448 ?auto_73449 ?auto_73450 ?auto_73451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73455 - BLOCK
      ?auto_73456 - BLOCK
      ?auto_73457 - BLOCK
      ?auto_73458 - BLOCK
    )
    :vars
    (
      ?auto_73461 - BLOCK
      ?auto_73460 - BLOCK
      ?auto_73459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73455 ?auto_73456 ) ) ( not ( = ?auto_73455 ?auto_73457 ) ) ( not ( = ?auto_73455 ?auto_73458 ) ) ( not ( = ?auto_73456 ?auto_73457 ) ) ( not ( = ?auto_73456 ?auto_73458 ) ) ( not ( = ?auto_73457 ?auto_73458 ) ) ( not ( = ?auto_73455 ?auto_73461 ) ) ( not ( = ?auto_73456 ?auto_73461 ) ) ( not ( = ?auto_73457 ?auto_73461 ) ) ( not ( = ?auto_73458 ?auto_73461 ) ) ( ON-TABLE ?auto_73460 ) ( not ( = ?auto_73460 ?auto_73461 ) ) ( not ( = ?auto_73460 ?auto_73458 ) ) ( not ( = ?auto_73460 ?auto_73457 ) ) ( not ( = ?auto_73455 ?auto_73460 ) ) ( not ( = ?auto_73456 ?auto_73460 ) ) ( ON ?auto_73455 ?auto_73459 ) ( not ( = ?auto_73455 ?auto_73459 ) ) ( not ( = ?auto_73456 ?auto_73459 ) ) ( not ( = ?auto_73457 ?auto_73459 ) ) ( not ( = ?auto_73458 ?auto_73459 ) ) ( not ( = ?auto_73461 ?auto_73459 ) ) ( not ( = ?auto_73460 ?auto_73459 ) ) ( ON ?auto_73456 ?auto_73455 ) ( ON-TABLE ?auto_73459 ) ( ON ?auto_73457 ?auto_73456 ) ( ON ?auto_73458 ?auto_73457 ) ( CLEAR ?auto_73458 ) ( HOLDING ?auto_73461 ) ( CLEAR ?auto_73460 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73460 ?auto_73461 )
      ( MAKE-4PILE ?auto_73455 ?auto_73456 ?auto_73457 ?auto_73458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73462 - BLOCK
      ?auto_73463 - BLOCK
      ?auto_73464 - BLOCK
      ?auto_73465 - BLOCK
    )
    :vars
    (
      ?auto_73468 - BLOCK
      ?auto_73467 - BLOCK
      ?auto_73466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73462 ?auto_73463 ) ) ( not ( = ?auto_73462 ?auto_73464 ) ) ( not ( = ?auto_73462 ?auto_73465 ) ) ( not ( = ?auto_73463 ?auto_73464 ) ) ( not ( = ?auto_73463 ?auto_73465 ) ) ( not ( = ?auto_73464 ?auto_73465 ) ) ( not ( = ?auto_73462 ?auto_73468 ) ) ( not ( = ?auto_73463 ?auto_73468 ) ) ( not ( = ?auto_73464 ?auto_73468 ) ) ( not ( = ?auto_73465 ?auto_73468 ) ) ( ON-TABLE ?auto_73467 ) ( not ( = ?auto_73467 ?auto_73468 ) ) ( not ( = ?auto_73467 ?auto_73465 ) ) ( not ( = ?auto_73467 ?auto_73464 ) ) ( not ( = ?auto_73462 ?auto_73467 ) ) ( not ( = ?auto_73463 ?auto_73467 ) ) ( ON ?auto_73462 ?auto_73466 ) ( not ( = ?auto_73462 ?auto_73466 ) ) ( not ( = ?auto_73463 ?auto_73466 ) ) ( not ( = ?auto_73464 ?auto_73466 ) ) ( not ( = ?auto_73465 ?auto_73466 ) ) ( not ( = ?auto_73468 ?auto_73466 ) ) ( not ( = ?auto_73467 ?auto_73466 ) ) ( ON ?auto_73463 ?auto_73462 ) ( ON-TABLE ?auto_73466 ) ( ON ?auto_73464 ?auto_73463 ) ( ON ?auto_73465 ?auto_73464 ) ( CLEAR ?auto_73467 ) ( ON ?auto_73468 ?auto_73465 ) ( CLEAR ?auto_73468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73466 ?auto_73462 ?auto_73463 ?auto_73464 ?auto_73465 )
      ( MAKE-4PILE ?auto_73462 ?auto_73463 ?auto_73464 ?auto_73465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73469 - BLOCK
      ?auto_73470 - BLOCK
      ?auto_73471 - BLOCK
      ?auto_73472 - BLOCK
    )
    :vars
    (
      ?auto_73475 - BLOCK
      ?auto_73473 - BLOCK
      ?auto_73474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73469 ?auto_73470 ) ) ( not ( = ?auto_73469 ?auto_73471 ) ) ( not ( = ?auto_73469 ?auto_73472 ) ) ( not ( = ?auto_73470 ?auto_73471 ) ) ( not ( = ?auto_73470 ?auto_73472 ) ) ( not ( = ?auto_73471 ?auto_73472 ) ) ( not ( = ?auto_73469 ?auto_73475 ) ) ( not ( = ?auto_73470 ?auto_73475 ) ) ( not ( = ?auto_73471 ?auto_73475 ) ) ( not ( = ?auto_73472 ?auto_73475 ) ) ( not ( = ?auto_73473 ?auto_73475 ) ) ( not ( = ?auto_73473 ?auto_73472 ) ) ( not ( = ?auto_73473 ?auto_73471 ) ) ( not ( = ?auto_73469 ?auto_73473 ) ) ( not ( = ?auto_73470 ?auto_73473 ) ) ( ON ?auto_73469 ?auto_73474 ) ( not ( = ?auto_73469 ?auto_73474 ) ) ( not ( = ?auto_73470 ?auto_73474 ) ) ( not ( = ?auto_73471 ?auto_73474 ) ) ( not ( = ?auto_73472 ?auto_73474 ) ) ( not ( = ?auto_73475 ?auto_73474 ) ) ( not ( = ?auto_73473 ?auto_73474 ) ) ( ON ?auto_73470 ?auto_73469 ) ( ON-TABLE ?auto_73474 ) ( ON ?auto_73471 ?auto_73470 ) ( ON ?auto_73472 ?auto_73471 ) ( ON ?auto_73475 ?auto_73472 ) ( CLEAR ?auto_73475 ) ( HOLDING ?auto_73473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73473 )
      ( MAKE-4PILE ?auto_73469 ?auto_73470 ?auto_73471 ?auto_73472 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73476 - BLOCK
      ?auto_73477 - BLOCK
      ?auto_73478 - BLOCK
      ?auto_73479 - BLOCK
    )
    :vars
    (
      ?auto_73482 - BLOCK
      ?auto_73481 - BLOCK
      ?auto_73480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73476 ?auto_73477 ) ) ( not ( = ?auto_73476 ?auto_73478 ) ) ( not ( = ?auto_73476 ?auto_73479 ) ) ( not ( = ?auto_73477 ?auto_73478 ) ) ( not ( = ?auto_73477 ?auto_73479 ) ) ( not ( = ?auto_73478 ?auto_73479 ) ) ( not ( = ?auto_73476 ?auto_73482 ) ) ( not ( = ?auto_73477 ?auto_73482 ) ) ( not ( = ?auto_73478 ?auto_73482 ) ) ( not ( = ?auto_73479 ?auto_73482 ) ) ( not ( = ?auto_73481 ?auto_73482 ) ) ( not ( = ?auto_73481 ?auto_73479 ) ) ( not ( = ?auto_73481 ?auto_73478 ) ) ( not ( = ?auto_73476 ?auto_73481 ) ) ( not ( = ?auto_73477 ?auto_73481 ) ) ( ON ?auto_73476 ?auto_73480 ) ( not ( = ?auto_73476 ?auto_73480 ) ) ( not ( = ?auto_73477 ?auto_73480 ) ) ( not ( = ?auto_73478 ?auto_73480 ) ) ( not ( = ?auto_73479 ?auto_73480 ) ) ( not ( = ?auto_73482 ?auto_73480 ) ) ( not ( = ?auto_73481 ?auto_73480 ) ) ( ON ?auto_73477 ?auto_73476 ) ( ON-TABLE ?auto_73480 ) ( ON ?auto_73478 ?auto_73477 ) ( ON ?auto_73479 ?auto_73478 ) ( ON ?auto_73482 ?auto_73479 ) ( ON ?auto_73481 ?auto_73482 ) ( CLEAR ?auto_73481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73480 ?auto_73476 ?auto_73477 ?auto_73478 ?auto_73479 ?auto_73482 )
      ( MAKE-4PILE ?auto_73476 ?auto_73477 ?auto_73478 ?auto_73479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73484 - BLOCK
    )
    :vars
    (
      ?auto_73485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73485 ?auto_73484 ) ( CLEAR ?auto_73485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73484 ) ( not ( = ?auto_73484 ?auto_73485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73485 ?auto_73484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73486 - BLOCK
    )
    :vars
    (
      ?auto_73487 - BLOCK
      ?auto_73488 - BLOCK
      ?auto_73489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73487 ?auto_73486 ) ( CLEAR ?auto_73487 ) ( ON-TABLE ?auto_73486 ) ( not ( = ?auto_73486 ?auto_73487 ) ) ( HOLDING ?auto_73488 ) ( CLEAR ?auto_73489 ) ( not ( = ?auto_73486 ?auto_73488 ) ) ( not ( = ?auto_73486 ?auto_73489 ) ) ( not ( = ?auto_73487 ?auto_73488 ) ) ( not ( = ?auto_73487 ?auto_73489 ) ) ( not ( = ?auto_73488 ?auto_73489 ) ) )
    :subtasks
    ( ( !STACK ?auto_73488 ?auto_73489 )
      ( MAKE-1PILE ?auto_73486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73490 - BLOCK
    )
    :vars
    (
      ?auto_73491 - BLOCK
      ?auto_73492 - BLOCK
      ?auto_73493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73491 ?auto_73490 ) ( ON-TABLE ?auto_73490 ) ( not ( = ?auto_73490 ?auto_73491 ) ) ( CLEAR ?auto_73492 ) ( not ( = ?auto_73490 ?auto_73493 ) ) ( not ( = ?auto_73490 ?auto_73492 ) ) ( not ( = ?auto_73491 ?auto_73493 ) ) ( not ( = ?auto_73491 ?auto_73492 ) ) ( not ( = ?auto_73493 ?auto_73492 ) ) ( ON ?auto_73493 ?auto_73491 ) ( CLEAR ?auto_73493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73490 ?auto_73491 )
      ( MAKE-1PILE ?auto_73490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73494 - BLOCK
    )
    :vars
    (
      ?auto_73495 - BLOCK
      ?auto_73496 - BLOCK
      ?auto_73497 - BLOCK
      ?auto_73498 - BLOCK
      ?auto_73499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73495 ?auto_73494 ) ( ON-TABLE ?auto_73494 ) ( not ( = ?auto_73494 ?auto_73495 ) ) ( not ( = ?auto_73494 ?auto_73496 ) ) ( not ( = ?auto_73494 ?auto_73497 ) ) ( not ( = ?auto_73495 ?auto_73496 ) ) ( not ( = ?auto_73495 ?auto_73497 ) ) ( not ( = ?auto_73496 ?auto_73497 ) ) ( ON ?auto_73496 ?auto_73495 ) ( CLEAR ?auto_73496 ) ( HOLDING ?auto_73497 ) ( CLEAR ?auto_73498 ) ( ON-TABLE ?auto_73499 ) ( ON ?auto_73498 ?auto_73499 ) ( not ( = ?auto_73499 ?auto_73498 ) ) ( not ( = ?auto_73499 ?auto_73497 ) ) ( not ( = ?auto_73498 ?auto_73497 ) ) ( not ( = ?auto_73494 ?auto_73498 ) ) ( not ( = ?auto_73494 ?auto_73499 ) ) ( not ( = ?auto_73495 ?auto_73498 ) ) ( not ( = ?auto_73495 ?auto_73499 ) ) ( not ( = ?auto_73496 ?auto_73498 ) ) ( not ( = ?auto_73496 ?auto_73499 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73499 ?auto_73498 ?auto_73497 )
      ( MAKE-1PILE ?auto_73494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73500 - BLOCK
    )
    :vars
    (
      ?auto_73501 - BLOCK
      ?auto_73505 - BLOCK
      ?auto_73504 - BLOCK
      ?auto_73502 - BLOCK
      ?auto_73503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73501 ?auto_73500 ) ( ON-TABLE ?auto_73500 ) ( not ( = ?auto_73500 ?auto_73501 ) ) ( not ( = ?auto_73500 ?auto_73505 ) ) ( not ( = ?auto_73500 ?auto_73504 ) ) ( not ( = ?auto_73501 ?auto_73505 ) ) ( not ( = ?auto_73501 ?auto_73504 ) ) ( not ( = ?auto_73505 ?auto_73504 ) ) ( ON ?auto_73505 ?auto_73501 ) ( CLEAR ?auto_73502 ) ( ON-TABLE ?auto_73503 ) ( ON ?auto_73502 ?auto_73503 ) ( not ( = ?auto_73503 ?auto_73502 ) ) ( not ( = ?auto_73503 ?auto_73504 ) ) ( not ( = ?auto_73502 ?auto_73504 ) ) ( not ( = ?auto_73500 ?auto_73502 ) ) ( not ( = ?auto_73500 ?auto_73503 ) ) ( not ( = ?auto_73501 ?auto_73502 ) ) ( not ( = ?auto_73501 ?auto_73503 ) ) ( not ( = ?auto_73505 ?auto_73502 ) ) ( not ( = ?auto_73505 ?auto_73503 ) ) ( ON ?auto_73504 ?auto_73505 ) ( CLEAR ?auto_73504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73500 ?auto_73501 ?auto_73505 )
      ( MAKE-1PILE ?auto_73500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73506 - BLOCK
    )
    :vars
    (
      ?auto_73508 - BLOCK
      ?auto_73509 - BLOCK
      ?auto_73507 - BLOCK
      ?auto_73510 - BLOCK
      ?auto_73511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73508 ?auto_73506 ) ( ON-TABLE ?auto_73506 ) ( not ( = ?auto_73506 ?auto_73508 ) ) ( not ( = ?auto_73506 ?auto_73509 ) ) ( not ( = ?auto_73506 ?auto_73507 ) ) ( not ( = ?auto_73508 ?auto_73509 ) ) ( not ( = ?auto_73508 ?auto_73507 ) ) ( not ( = ?auto_73509 ?auto_73507 ) ) ( ON ?auto_73509 ?auto_73508 ) ( ON-TABLE ?auto_73510 ) ( not ( = ?auto_73510 ?auto_73511 ) ) ( not ( = ?auto_73510 ?auto_73507 ) ) ( not ( = ?auto_73511 ?auto_73507 ) ) ( not ( = ?auto_73506 ?auto_73511 ) ) ( not ( = ?auto_73506 ?auto_73510 ) ) ( not ( = ?auto_73508 ?auto_73511 ) ) ( not ( = ?auto_73508 ?auto_73510 ) ) ( not ( = ?auto_73509 ?auto_73511 ) ) ( not ( = ?auto_73509 ?auto_73510 ) ) ( ON ?auto_73507 ?auto_73509 ) ( CLEAR ?auto_73507 ) ( HOLDING ?auto_73511 ) ( CLEAR ?auto_73510 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73510 ?auto_73511 )
      ( MAKE-1PILE ?auto_73506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73512 - BLOCK
    )
    :vars
    (
      ?auto_73516 - BLOCK
      ?auto_73513 - BLOCK
      ?auto_73517 - BLOCK
      ?auto_73514 - BLOCK
      ?auto_73515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73516 ?auto_73512 ) ( ON-TABLE ?auto_73512 ) ( not ( = ?auto_73512 ?auto_73516 ) ) ( not ( = ?auto_73512 ?auto_73513 ) ) ( not ( = ?auto_73512 ?auto_73517 ) ) ( not ( = ?auto_73516 ?auto_73513 ) ) ( not ( = ?auto_73516 ?auto_73517 ) ) ( not ( = ?auto_73513 ?auto_73517 ) ) ( ON ?auto_73513 ?auto_73516 ) ( ON-TABLE ?auto_73514 ) ( not ( = ?auto_73514 ?auto_73515 ) ) ( not ( = ?auto_73514 ?auto_73517 ) ) ( not ( = ?auto_73515 ?auto_73517 ) ) ( not ( = ?auto_73512 ?auto_73515 ) ) ( not ( = ?auto_73512 ?auto_73514 ) ) ( not ( = ?auto_73516 ?auto_73515 ) ) ( not ( = ?auto_73516 ?auto_73514 ) ) ( not ( = ?auto_73513 ?auto_73515 ) ) ( not ( = ?auto_73513 ?auto_73514 ) ) ( ON ?auto_73517 ?auto_73513 ) ( CLEAR ?auto_73514 ) ( ON ?auto_73515 ?auto_73517 ) ( CLEAR ?auto_73515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73512 ?auto_73516 ?auto_73513 ?auto_73517 )
      ( MAKE-1PILE ?auto_73512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73518 - BLOCK
    )
    :vars
    (
      ?auto_73520 - BLOCK
      ?auto_73522 - BLOCK
      ?auto_73523 - BLOCK
      ?auto_73521 - BLOCK
      ?auto_73519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73520 ?auto_73518 ) ( ON-TABLE ?auto_73518 ) ( not ( = ?auto_73518 ?auto_73520 ) ) ( not ( = ?auto_73518 ?auto_73522 ) ) ( not ( = ?auto_73518 ?auto_73523 ) ) ( not ( = ?auto_73520 ?auto_73522 ) ) ( not ( = ?auto_73520 ?auto_73523 ) ) ( not ( = ?auto_73522 ?auto_73523 ) ) ( ON ?auto_73522 ?auto_73520 ) ( not ( = ?auto_73521 ?auto_73519 ) ) ( not ( = ?auto_73521 ?auto_73523 ) ) ( not ( = ?auto_73519 ?auto_73523 ) ) ( not ( = ?auto_73518 ?auto_73519 ) ) ( not ( = ?auto_73518 ?auto_73521 ) ) ( not ( = ?auto_73520 ?auto_73519 ) ) ( not ( = ?auto_73520 ?auto_73521 ) ) ( not ( = ?auto_73522 ?auto_73519 ) ) ( not ( = ?auto_73522 ?auto_73521 ) ) ( ON ?auto_73523 ?auto_73522 ) ( ON ?auto_73519 ?auto_73523 ) ( CLEAR ?auto_73519 ) ( HOLDING ?auto_73521 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73521 )
      ( MAKE-1PILE ?auto_73518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73524 - BLOCK
    )
    :vars
    (
      ?auto_73526 - BLOCK
      ?auto_73527 - BLOCK
      ?auto_73528 - BLOCK
      ?auto_73525 - BLOCK
      ?auto_73529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73526 ?auto_73524 ) ( ON-TABLE ?auto_73524 ) ( not ( = ?auto_73524 ?auto_73526 ) ) ( not ( = ?auto_73524 ?auto_73527 ) ) ( not ( = ?auto_73524 ?auto_73528 ) ) ( not ( = ?auto_73526 ?auto_73527 ) ) ( not ( = ?auto_73526 ?auto_73528 ) ) ( not ( = ?auto_73527 ?auto_73528 ) ) ( ON ?auto_73527 ?auto_73526 ) ( not ( = ?auto_73525 ?auto_73529 ) ) ( not ( = ?auto_73525 ?auto_73528 ) ) ( not ( = ?auto_73529 ?auto_73528 ) ) ( not ( = ?auto_73524 ?auto_73529 ) ) ( not ( = ?auto_73524 ?auto_73525 ) ) ( not ( = ?auto_73526 ?auto_73529 ) ) ( not ( = ?auto_73526 ?auto_73525 ) ) ( not ( = ?auto_73527 ?auto_73529 ) ) ( not ( = ?auto_73527 ?auto_73525 ) ) ( ON ?auto_73528 ?auto_73527 ) ( ON ?auto_73529 ?auto_73528 ) ( ON ?auto_73525 ?auto_73529 ) ( CLEAR ?auto_73525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73524 ?auto_73526 ?auto_73527 ?auto_73528 ?auto_73529 )
      ( MAKE-1PILE ?auto_73524 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73530 - BLOCK
    )
    :vars
    (
      ?auto_73533 - BLOCK
      ?auto_73534 - BLOCK
      ?auto_73535 - BLOCK
      ?auto_73531 - BLOCK
      ?auto_73532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73533 ?auto_73530 ) ( ON-TABLE ?auto_73530 ) ( not ( = ?auto_73530 ?auto_73533 ) ) ( not ( = ?auto_73530 ?auto_73534 ) ) ( not ( = ?auto_73530 ?auto_73535 ) ) ( not ( = ?auto_73533 ?auto_73534 ) ) ( not ( = ?auto_73533 ?auto_73535 ) ) ( not ( = ?auto_73534 ?auto_73535 ) ) ( ON ?auto_73534 ?auto_73533 ) ( not ( = ?auto_73531 ?auto_73532 ) ) ( not ( = ?auto_73531 ?auto_73535 ) ) ( not ( = ?auto_73532 ?auto_73535 ) ) ( not ( = ?auto_73530 ?auto_73532 ) ) ( not ( = ?auto_73530 ?auto_73531 ) ) ( not ( = ?auto_73533 ?auto_73532 ) ) ( not ( = ?auto_73533 ?auto_73531 ) ) ( not ( = ?auto_73534 ?auto_73532 ) ) ( not ( = ?auto_73534 ?auto_73531 ) ) ( ON ?auto_73535 ?auto_73534 ) ( ON ?auto_73532 ?auto_73535 ) ( HOLDING ?auto_73531 ) ( CLEAR ?auto_73532 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73530 ?auto_73533 ?auto_73534 ?auto_73535 ?auto_73532 ?auto_73531 )
      ( MAKE-1PILE ?auto_73530 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73536 - BLOCK
    )
    :vars
    (
      ?auto_73538 - BLOCK
      ?auto_73537 - BLOCK
      ?auto_73540 - BLOCK
      ?auto_73541 - BLOCK
      ?auto_73539 - BLOCK
      ?auto_73542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73538 ?auto_73536 ) ( ON-TABLE ?auto_73536 ) ( not ( = ?auto_73536 ?auto_73538 ) ) ( not ( = ?auto_73536 ?auto_73537 ) ) ( not ( = ?auto_73536 ?auto_73540 ) ) ( not ( = ?auto_73538 ?auto_73537 ) ) ( not ( = ?auto_73538 ?auto_73540 ) ) ( not ( = ?auto_73537 ?auto_73540 ) ) ( ON ?auto_73537 ?auto_73538 ) ( not ( = ?auto_73541 ?auto_73539 ) ) ( not ( = ?auto_73541 ?auto_73540 ) ) ( not ( = ?auto_73539 ?auto_73540 ) ) ( not ( = ?auto_73536 ?auto_73539 ) ) ( not ( = ?auto_73536 ?auto_73541 ) ) ( not ( = ?auto_73538 ?auto_73539 ) ) ( not ( = ?auto_73538 ?auto_73541 ) ) ( not ( = ?auto_73537 ?auto_73539 ) ) ( not ( = ?auto_73537 ?auto_73541 ) ) ( ON ?auto_73540 ?auto_73537 ) ( ON ?auto_73539 ?auto_73540 ) ( CLEAR ?auto_73539 ) ( ON ?auto_73541 ?auto_73542 ) ( CLEAR ?auto_73541 ) ( HAND-EMPTY ) ( not ( = ?auto_73536 ?auto_73542 ) ) ( not ( = ?auto_73538 ?auto_73542 ) ) ( not ( = ?auto_73537 ?auto_73542 ) ) ( not ( = ?auto_73540 ?auto_73542 ) ) ( not ( = ?auto_73541 ?auto_73542 ) ) ( not ( = ?auto_73539 ?auto_73542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73541 ?auto_73542 )
      ( MAKE-1PILE ?auto_73536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73543 - BLOCK
    )
    :vars
    (
      ?auto_73547 - BLOCK
      ?auto_73548 - BLOCK
      ?auto_73544 - BLOCK
      ?auto_73545 - BLOCK
      ?auto_73546 - BLOCK
      ?auto_73549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73547 ?auto_73543 ) ( ON-TABLE ?auto_73543 ) ( not ( = ?auto_73543 ?auto_73547 ) ) ( not ( = ?auto_73543 ?auto_73548 ) ) ( not ( = ?auto_73543 ?auto_73544 ) ) ( not ( = ?auto_73547 ?auto_73548 ) ) ( not ( = ?auto_73547 ?auto_73544 ) ) ( not ( = ?auto_73548 ?auto_73544 ) ) ( ON ?auto_73548 ?auto_73547 ) ( not ( = ?auto_73545 ?auto_73546 ) ) ( not ( = ?auto_73545 ?auto_73544 ) ) ( not ( = ?auto_73546 ?auto_73544 ) ) ( not ( = ?auto_73543 ?auto_73546 ) ) ( not ( = ?auto_73543 ?auto_73545 ) ) ( not ( = ?auto_73547 ?auto_73546 ) ) ( not ( = ?auto_73547 ?auto_73545 ) ) ( not ( = ?auto_73548 ?auto_73546 ) ) ( not ( = ?auto_73548 ?auto_73545 ) ) ( ON ?auto_73544 ?auto_73548 ) ( ON ?auto_73545 ?auto_73549 ) ( CLEAR ?auto_73545 ) ( not ( = ?auto_73543 ?auto_73549 ) ) ( not ( = ?auto_73547 ?auto_73549 ) ) ( not ( = ?auto_73548 ?auto_73549 ) ) ( not ( = ?auto_73544 ?auto_73549 ) ) ( not ( = ?auto_73545 ?auto_73549 ) ) ( not ( = ?auto_73546 ?auto_73549 ) ) ( HOLDING ?auto_73546 ) ( CLEAR ?auto_73544 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73543 ?auto_73547 ?auto_73548 ?auto_73544 ?auto_73546 )
      ( MAKE-1PILE ?auto_73543 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73550 - BLOCK
    )
    :vars
    (
      ?auto_73552 - BLOCK
      ?auto_73554 - BLOCK
      ?auto_73555 - BLOCK
      ?auto_73551 - BLOCK
      ?auto_73553 - BLOCK
      ?auto_73556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73552 ?auto_73550 ) ( ON-TABLE ?auto_73550 ) ( not ( = ?auto_73550 ?auto_73552 ) ) ( not ( = ?auto_73550 ?auto_73554 ) ) ( not ( = ?auto_73550 ?auto_73555 ) ) ( not ( = ?auto_73552 ?auto_73554 ) ) ( not ( = ?auto_73552 ?auto_73555 ) ) ( not ( = ?auto_73554 ?auto_73555 ) ) ( ON ?auto_73554 ?auto_73552 ) ( not ( = ?auto_73551 ?auto_73553 ) ) ( not ( = ?auto_73551 ?auto_73555 ) ) ( not ( = ?auto_73553 ?auto_73555 ) ) ( not ( = ?auto_73550 ?auto_73553 ) ) ( not ( = ?auto_73550 ?auto_73551 ) ) ( not ( = ?auto_73552 ?auto_73553 ) ) ( not ( = ?auto_73552 ?auto_73551 ) ) ( not ( = ?auto_73554 ?auto_73553 ) ) ( not ( = ?auto_73554 ?auto_73551 ) ) ( ON ?auto_73555 ?auto_73554 ) ( ON ?auto_73551 ?auto_73556 ) ( not ( = ?auto_73550 ?auto_73556 ) ) ( not ( = ?auto_73552 ?auto_73556 ) ) ( not ( = ?auto_73554 ?auto_73556 ) ) ( not ( = ?auto_73555 ?auto_73556 ) ) ( not ( = ?auto_73551 ?auto_73556 ) ) ( not ( = ?auto_73553 ?auto_73556 ) ) ( CLEAR ?auto_73555 ) ( ON ?auto_73553 ?auto_73551 ) ( CLEAR ?auto_73553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73556 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73556 ?auto_73551 )
      ( MAKE-1PILE ?auto_73550 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73557 - BLOCK
    )
    :vars
    (
      ?auto_73560 - BLOCK
      ?auto_73561 - BLOCK
      ?auto_73558 - BLOCK
      ?auto_73562 - BLOCK
      ?auto_73559 - BLOCK
      ?auto_73563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73560 ?auto_73557 ) ( ON-TABLE ?auto_73557 ) ( not ( = ?auto_73557 ?auto_73560 ) ) ( not ( = ?auto_73557 ?auto_73561 ) ) ( not ( = ?auto_73557 ?auto_73558 ) ) ( not ( = ?auto_73560 ?auto_73561 ) ) ( not ( = ?auto_73560 ?auto_73558 ) ) ( not ( = ?auto_73561 ?auto_73558 ) ) ( ON ?auto_73561 ?auto_73560 ) ( not ( = ?auto_73562 ?auto_73559 ) ) ( not ( = ?auto_73562 ?auto_73558 ) ) ( not ( = ?auto_73559 ?auto_73558 ) ) ( not ( = ?auto_73557 ?auto_73559 ) ) ( not ( = ?auto_73557 ?auto_73562 ) ) ( not ( = ?auto_73560 ?auto_73559 ) ) ( not ( = ?auto_73560 ?auto_73562 ) ) ( not ( = ?auto_73561 ?auto_73559 ) ) ( not ( = ?auto_73561 ?auto_73562 ) ) ( ON ?auto_73562 ?auto_73563 ) ( not ( = ?auto_73557 ?auto_73563 ) ) ( not ( = ?auto_73560 ?auto_73563 ) ) ( not ( = ?auto_73561 ?auto_73563 ) ) ( not ( = ?auto_73558 ?auto_73563 ) ) ( not ( = ?auto_73562 ?auto_73563 ) ) ( not ( = ?auto_73559 ?auto_73563 ) ) ( ON ?auto_73559 ?auto_73562 ) ( CLEAR ?auto_73559 ) ( ON-TABLE ?auto_73563 ) ( HOLDING ?auto_73558 ) ( CLEAR ?auto_73561 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73557 ?auto_73560 ?auto_73561 ?auto_73558 )
      ( MAKE-1PILE ?auto_73557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73564 - BLOCK
    )
    :vars
    (
      ?auto_73566 - BLOCK
      ?auto_73565 - BLOCK
      ?auto_73567 - BLOCK
      ?auto_73568 - BLOCK
      ?auto_73570 - BLOCK
      ?auto_73569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73566 ?auto_73564 ) ( ON-TABLE ?auto_73564 ) ( not ( = ?auto_73564 ?auto_73566 ) ) ( not ( = ?auto_73564 ?auto_73565 ) ) ( not ( = ?auto_73564 ?auto_73567 ) ) ( not ( = ?auto_73566 ?auto_73565 ) ) ( not ( = ?auto_73566 ?auto_73567 ) ) ( not ( = ?auto_73565 ?auto_73567 ) ) ( ON ?auto_73565 ?auto_73566 ) ( not ( = ?auto_73568 ?auto_73570 ) ) ( not ( = ?auto_73568 ?auto_73567 ) ) ( not ( = ?auto_73570 ?auto_73567 ) ) ( not ( = ?auto_73564 ?auto_73570 ) ) ( not ( = ?auto_73564 ?auto_73568 ) ) ( not ( = ?auto_73566 ?auto_73570 ) ) ( not ( = ?auto_73566 ?auto_73568 ) ) ( not ( = ?auto_73565 ?auto_73570 ) ) ( not ( = ?auto_73565 ?auto_73568 ) ) ( ON ?auto_73568 ?auto_73569 ) ( not ( = ?auto_73564 ?auto_73569 ) ) ( not ( = ?auto_73566 ?auto_73569 ) ) ( not ( = ?auto_73565 ?auto_73569 ) ) ( not ( = ?auto_73567 ?auto_73569 ) ) ( not ( = ?auto_73568 ?auto_73569 ) ) ( not ( = ?auto_73570 ?auto_73569 ) ) ( ON ?auto_73570 ?auto_73568 ) ( ON-TABLE ?auto_73569 ) ( CLEAR ?auto_73565 ) ( ON ?auto_73567 ?auto_73570 ) ( CLEAR ?auto_73567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73569 ?auto_73568 ?auto_73570 )
      ( MAKE-1PILE ?auto_73564 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73571 - BLOCK
    )
    :vars
    (
      ?auto_73574 - BLOCK
      ?auto_73572 - BLOCK
      ?auto_73576 - BLOCK
      ?auto_73575 - BLOCK
      ?auto_73577 - BLOCK
      ?auto_73573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73574 ?auto_73571 ) ( ON-TABLE ?auto_73571 ) ( not ( = ?auto_73571 ?auto_73574 ) ) ( not ( = ?auto_73571 ?auto_73572 ) ) ( not ( = ?auto_73571 ?auto_73576 ) ) ( not ( = ?auto_73574 ?auto_73572 ) ) ( not ( = ?auto_73574 ?auto_73576 ) ) ( not ( = ?auto_73572 ?auto_73576 ) ) ( not ( = ?auto_73575 ?auto_73577 ) ) ( not ( = ?auto_73575 ?auto_73576 ) ) ( not ( = ?auto_73577 ?auto_73576 ) ) ( not ( = ?auto_73571 ?auto_73577 ) ) ( not ( = ?auto_73571 ?auto_73575 ) ) ( not ( = ?auto_73574 ?auto_73577 ) ) ( not ( = ?auto_73574 ?auto_73575 ) ) ( not ( = ?auto_73572 ?auto_73577 ) ) ( not ( = ?auto_73572 ?auto_73575 ) ) ( ON ?auto_73575 ?auto_73573 ) ( not ( = ?auto_73571 ?auto_73573 ) ) ( not ( = ?auto_73574 ?auto_73573 ) ) ( not ( = ?auto_73572 ?auto_73573 ) ) ( not ( = ?auto_73576 ?auto_73573 ) ) ( not ( = ?auto_73575 ?auto_73573 ) ) ( not ( = ?auto_73577 ?auto_73573 ) ) ( ON ?auto_73577 ?auto_73575 ) ( ON-TABLE ?auto_73573 ) ( ON ?auto_73576 ?auto_73577 ) ( CLEAR ?auto_73576 ) ( HOLDING ?auto_73572 ) ( CLEAR ?auto_73574 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73571 ?auto_73574 ?auto_73572 )
      ( MAKE-1PILE ?auto_73571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73578 - BLOCK
    )
    :vars
    (
      ?auto_73581 - BLOCK
      ?auto_73584 - BLOCK
      ?auto_73583 - BLOCK
      ?auto_73582 - BLOCK
      ?auto_73579 - BLOCK
      ?auto_73580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73581 ?auto_73578 ) ( ON-TABLE ?auto_73578 ) ( not ( = ?auto_73578 ?auto_73581 ) ) ( not ( = ?auto_73578 ?auto_73584 ) ) ( not ( = ?auto_73578 ?auto_73583 ) ) ( not ( = ?auto_73581 ?auto_73584 ) ) ( not ( = ?auto_73581 ?auto_73583 ) ) ( not ( = ?auto_73584 ?auto_73583 ) ) ( not ( = ?auto_73582 ?auto_73579 ) ) ( not ( = ?auto_73582 ?auto_73583 ) ) ( not ( = ?auto_73579 ?auto_73583 ) ) ( not ( = ?auto_73578 ?auto_73579 ) ) ( not ( = ?auto_73578 ?auto_73582 ) ) ( not ( = ?auto_73581 ?auto_73579 ) ) ( not ( = ?auto_73581 ?auto_73582 ) ) ( not ( = ?auto_73584 ?auto_73579 ) ) ( not ( = ?auto_73584 ?auto_73582 ) ) ( ON ?auto_73582 ?auto_73580 ) ( not ( = ?auto_73578 ?auto_73580 ) ) ( not ( = ?auto_73581 ?auto_73580 ) ) ( not ( = ?auto_73584 ?auto_73580 ) ) ( not ( = ?auto_73583 ?auto_73580 ) ) ( not ( = ?auto_73582 ?auto_73580 ) ) ( not ( = ?auto_73579 ?auto_73580 ) ) ( ON ?auto_73579 ?auto_73582 ) ( ON-TABLE ?auto_73580 ) ( ON ?auto_73583 ?auto_73579 ) ( CLEAR ?auto_73581 ) ( ON ?auto_73584 ?auto_73583 ) ( CLEAR ?auto_73584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73580 ?auto_73582 ?auto_73579 ?auto_73583 )
      ( MAKE-1PILE ?auto_73578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73599 - BLOCK
    )
    :vars
    (
      ?auto_73602 - BLOCK
      ?auto_73604 - BLOCK
      ?auto_73601 - BLOCK
      ?auto_73600 - BLOCK
      ?auto_73605 - BLOCK
      ?auto_73603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73599 ?auto_73602 ) ) ( not ( = ?auto_73599 ?auto_73604 ) ) ( not ( = ?auto_73599 ?auto_73601 ) ) ( not ( = ?auto_73602 ?auto_73604 ) ) ( not ( = ?auto_73602 ?auto_73601 ) ) ( not ( = ?auto_73604 ?auto_73601 ) ) ( not ( = ?auto_73600 ?auto_73605 ) ) ( not ( = ?auto_73600 ?auto_73601 ) ) ( not ( = ?auto_73605 ?auto_73601 ) ) ( not ( = ?auto_73599 ?auto_73605 ) ) ( not ( = ?auto_73599 ?auto_73600 ) ) ( not ( = ?auto_73602 ?auto_73605 ) ) ( not ( = ?auto_73602 ?auto_73600 ) ) ( not ( = ?auto_73604 ?auto_73605 ) ) ( not ( = ?auto_73604 ?auto_73600 ) ) ( ON ?auto_73600 ?auto_73603 ) ( not ( = ?auto_73599 ?auto_73603 ) ) ( not ( = ?auto_73602 ?auto_73603 ) ) ( not ( = ?auto_73604 ?auto_73603 ) ) ( not ( = ?auto_73601 ?auto_73603 ) ) ( not ( = ?auto_73600 ?auto_73603 ) ) ( not ( = ?auto_73605 ?auto_73603 ) ) ( ON ?auto_73605 ?auto_73600 ) ( ON-TABLE ?auto_73603 ) ( ON ?auto_73601 ?auto_73605 ) ( ON ?auto_73604 ?auto_73601 ) ( ON ?auto_73602 ?auto_73604 ) ( CLEAR ?auto_73602 ) ( HOLDING ?auto_73599 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73599 ?auto_73602 )
      ( MAKE-1PILE ?auto_73599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73606 - BLOCK
    )
    :vars
    (
      ?auto_73607 - BLOCK
      ?auto_73608 - BLOCK
      ?auto_73611 - BLOCK
      ?auto_73610 - BLOCK
      ?auto_73612 - BLOCK
      ?auto_73609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73606 ?auto_73607 ) ) ( not ( = ?auto_73606 ?auto_73608 ) ) ( not ( = ?auto_73606 ?auto_73611 ) ) ( not ( = ?auto_73607 ?auto_73608 ) ) ( not ( = ?auto_73607 ?auto_73611 ) ) ( not ( = ?auto_73608 ?auto_73611 ) ) ( not ( = ?auto_73610 ?auto_73612 ) ) ( not ( = ?auto_73610 ?auto_73611 ) ) ( not ( = ?auto_73612 ?auto_73611 ) ) ( not ( = ?auto_73606 ?auto_73612 ) ) ( not ( = ?auto_73606 ?auto_73610 ) ) ( not ( = ?auto_73607 ?auto_73612 ) ) ( not ( = ?auto_73607 ?auto_73610 ) ) ( not ( = ?auto_73608 ?auto_73612 ) ) ( not ( = ?auto_73608 ?auto_73610 ) ) ( ON ?auto_73610 ?auto_73609 ) ( not ( = ?auto_73606 ?auto_73609 ) ) ( not ( = ?auto_73607 ?auto_73609 ) ) ( not ( = ?auto_73608 ?auto_73609 ) ) ( not ( = ?auto_73611 ?auto_73609 ) ) ( not ( = ?auto_73610 ?auto_73609 ) ) ( not ( = ?auto_73612 ?auto_73609 ) ) ( ON ?auto_73612 ?auto_73610 ) ( ON-TABLE ?auto_73609 ) ( ON ?auto_73611 ?auto_73612 ) ( ON ?auto_73608 ?auto_73611 ) ( ON ?auto_73607 ?auto_73608 ) ( ON ?auto_73606 ?auto_73607 ) ( CLEAR ?auto_73606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73609 ?auto_73610 ?auto_73612 ?auto_73611 ?auto_73608 ?auto_73607 )
      ( MAKE-1PILE ?auto_73606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73618 - BLOCK
      ?auto_73619 - BLOCK
      ?auto_73620 - BLOCK
      ?auto_73621 - BLOCK
      ?auto_73622 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_73622 ) ( CLEAR ?auto_73621 ) ( ON-TABLE ?auto_73618 ) ( ON ?auto_73619 ?auto_73618 ) ( ON ?auto_73620 ?auto_73619 ) ( ON ?auto_73621 ?auto_73620 ) ( not ( = ?auto_73618 ?auto_73619 ) ) ( not ( = ?auto_73618 ?auto_73620 ) ) ( not ( = ?auto_73618 ?auto_73621 ) ) ( not ( = ?auto_73618 ?auto_73622 ) ) ( not ( = ?auto_73619 ?auto_73620 ) ) ( not ( = ?auto_73619 ?auto_73621 ) ) ( not ( = ?auto_73619 ?auto_73622 ) ) ( not ( = ?auto_73620 ?auto_73621 ) ) ( not ( = ?auto_73620 ?auto_73622 ) ) ( not ( = ?auto_73621 ?auto_73622 ) ) )
    :subtasks
    ( ( !STACK ?auto_73622 ?auto_73621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73623 - BLOCK
      ?auto_73624 - BLOCK
      ?auto_73625 - BLOCK
      ?auto_73626 - BLOCK
      ?auto_73627 - BLOCK
    )
    :vars
    (
      ?auto_73628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73626 ) ( ON-TABLE ?auto_73623 ) ( ON ?auto_73624 ?auto_73623 ) ( ON ?auto_73625 ?auto_73624 ) ( ON ?auto_73626 ?auto_73625 ) ( not ( = ?auto_73623 ?auto_73624 ) ) ( not ( = ?auto_73623 ?auto_73625 ) ) ( not ( = ?auto_73623 ?auto_73626 ) ) ( not ( = ?auto_73623 ?auto_73627 ) ) ( not ( = ?auto_73624 ?auto_73625 ) ) ( not ( = ?auto_73624 ?auto_73626 ) ) ( not ( = ?auto_73624 ?auto_73627 ) ) ( not ( = ?auto_73625 ?auto_73626 ) ) ( not ( = ?auto_73625 ?auto_73627 ) ) ( not ( = ?auto_73626 ?auto_73627 ) ) ( ON ?auto_73627 ?auto_73628 ) ( CLEAR ?auto_73627 ) ( HAND-EMPTY ) ( not ( = ?auto_73623 ?auto_73628 ) ) ( not ( = ?auto_73624 ?auto_73628 ) ) ( not ( = ?auto_73625 ?auto_73628 ) ) ( not ( = ?auto_73626 ?auto_73628 ) ) ( not ( = ?auto_73627 ?auto_73628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73627 ?auto_73628 )
      ( MAKE-5PILE ?auto_73623 ?auto_73624 ?auto_73625 ?auto_73626 ?auto_73627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73629 - BLOCK
      ?auto_73630 - BLOCK
      ?auto_73631 - BLOCK
      ?auto_73632 - BLOCK
      ?auto_73633 - BLOCK
    )
    :vars
    (
      ?auto_73634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73629 ) ( ON ?auto_73630 ?auto_73629 ) ( ON ?auto_73631 ?auto_73630 ) ( not ( = ?auto_73629 ?auto_73630 ) ) ( not ( = ?auto_73629 ?auto_73631 ) ) ( not ( = ?auto_73629 ?auto_73632 ) ) ( not ( = ?auto_73629 ?auto_73633 ) ) ( not ( = ?auto_73630 ?auto_73631 ) ) ( not ( = ?auto_73630 ?auto_73632 ) ) ( not ( = ?auto_73630 ?auto_73633 ) ) ( not ( = ?auto_73631 ?auto_73632 ) ) ( not ( = ?auto_73631 ?auto_73633 ) ) ( not ( = ?auto_73632 ?auto_73633 ) ) ( ON ?auto_73633 ?auto_73634 ) ( CLEAR ?auto_73633 ) ( not ( = ?auto_73629 ?auto_73634 ) ) ( not ( = ?auto_73630 ?auto_73634 ) ) ( not ( = ?auto_73631 ?auto_73634 ) ) ( not ( = ?auto_73632 ?auto_73634 ) ) ( not ( = ?auto_73633 ?auto_73634 ) ) ( HOLDING ?auto_73632 ) ( CLEAR ?auto_73631 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73629 ?auto_73630 ?auto_73631 ?auto_73632 )
      ( MAKE-5PILE ?auto_73629 ?auto_73630 ?auto_73631 ?auto_73632 ?auto_73633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73635 - BLOCK
      ?auto_73636 - BLOCK
      ?auto_73637 - BLOCK
      ?auto_73638 - BLOCK
      ?auto_73639 - BLOCK
    )
    :vars
    (
      ?auto_73640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73635 ) ( ON ?auto_73636 ?auto_73635 ) ( ON ?auto_73637 ?auto_73636 ) ( not ( = ?auto_73635 ?auto_73636 ) ) ( not ( = ?auto_73635 ?auto_73637 ) ) ( not ( = ?auto_73635 ?auto_73638 ) ) ( not ( = ?auto_73635 ?auto_73639 ) ) ( not ( = ?auto_73636 ?auto_73637 ) ) ( not ( = ?auto_73636 ?auto_73638 ) ) ( not ( = ?auto_73636 ?auto_73639 ) ) ( not ( = ?auto_73637 ?auto_73638 ) ) ( not ( = ?auto_73637 ?auto_73639 ) ) ( not ( = ?auto_73638 ?auto_73639 ) ) ( ON ?auto_73639 ?auto_73640 ) ( not ( = ?auto_73635 ?auto_73640 ) ) ( not ( = ?auto_73636 ?auto_73640 ) ) ( not ( = ?auto_73637 ?auto_73640 ) ) ( not ( = ?auto_73638 ?auto_73640 ) ) ( not ( = ?auto_73639 ?auto_73640 ) ) ( CLEAR ?auto_73637 ) ( ON ?auto_73638 ?auto_73639 ) ( CLEAR ?auto_73638 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73640 ?auto_73639 )
      ( MAKE-5PILE ?auto_73635 ?auto_73636 ?auto_73637 ?auto_73638 ?auto_73639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73641 - BLOCK
      ?auto_73642 - BLOCK
      ?auto_73643 - BLOCK
      ?auto_73644 - BLOCK
      ?auto_73645 - BLOCK
    )
    :vars
    (
      ?auto_73646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73641 ) ( ON ?auto_73642 ?auto_73641 ) ( not ( = ?auto_73641 ?auto_73642 ) ) ( not ( = ?auto_73641 ?auto_73643 ) ) ( not ( = ?auto_73641 ?auto_73644 ) ) ( not ( = ?auto_73641 ?auto_73645 ) ) ( not ( = ?auto_73642 ?auto_73643 ) ) ( not ( = ?auto_73642 ?auto_73644 ) ) ( not ( = ?auto_73642 ?auto_73645 ) ) ( not ( = ?auto_73643 ?auto_73644 ) ) ( not ( = ?auto_73643 ?auto_73645 ) ) ( not ( = ?auto_73644 ?auto_73645 ) ) ( ON ?auto_73645 ?auto_73646 ) ( not ( = ?auto_73641 ?auto_73646 ) ) ( not ( = ?auto_73642 ?auto_73646 ) ) ( not ( = ?auto_73643 ?auto_73646 ) ) ( not ( = ?auto_73644 ?auto_73646 ) ) ( not ( = ?auto_73645 ?auto_73646 ) ) ( ON ?auto_73644 ?auto_73645 ) ( CLEAR ?auto_73644 ) ( ON-TABLE ?auto_73646 ) ( HOLDING ?auto_73643 ) ( CLEAR ?auto_73642 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73641 ?auto_73642 ?auto_73643 )
      ( MAKE-5PILE ?auto_73641 ?auto_73642 ?auto_73643 ?auto_73644 ?auto_73645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73647 - BLOCK
      ?auto_73648 - BLOCK
      ?auto_73649 - BLOCK
      ?auto_73650 - BLOCK
      ?auto_73651 - BLOCK
    )
    :vars
    (
      ?auto_73652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73647 ) ( ON ?auto_73648 ?auto_73647 ) ( not ( = ?auto_73647 ?auto_73648 ) ) ( not ( = ?auto_73647 ?auto_73649 ) ) ( not ( = ?auto_73647 ?auto_73650 ) ) ( not ( = ?auto_73647 ?auto_73651 ) ) ( not ( = ?auto_73648 ?auto_73649 ) ) ( not ( = ?auto_73648 ?auto_73650 ) ) ( not ( = ?auto_73648 ?auto_73651 ) ) ( not ( = ?auto_73649 ?auto_73650 ) ) ( not ( = ?auto_73649 ?auto_73651 ) ) ( not ( = ?auto_73650 ?auto_73651 ) ) ( ON ?auto_73651 ?auto_73652 ) ( not ( = ?auto_73647 ?auto_73652 ) ) ( not ( = ?auto_73648 ?auto_73652 ) ) ( not ( = ?auto_73649 ?auto_73652 ) ) ( not ( = ?auto_73650 ?auto_73652 ) ) ( not ( = ?auto_73651 ?auto_73652 ) ) ( ON ?auto_73650 ?auto_73651 ) ( ON-TABLE ?auto_73652 ) ( CLEAR ?auto_73648 ) ( ON ?auto_73649 ?auto_73650 ) ( CLEAR ?auto_73649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73652 ?auto_73651 ?auto_73650 )
      ( MAKE-5PILE ?auto_73647 ?auto_73648 ?auto_73649 ?auto_73650 ?auto_73651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73653 - BLOCK
      ?auto_73654 - BLOCK
      ?auto_73655 - BLOCK
      ?auto_73656 - BLOCK
      ?auto_73657 - BLOCK
    )
    :vars
    (
      ?auto_73658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73653 ) ( not ( = ?auto_73653 ?auto_73654 ) ) ( not ( = ?auto_73653 ?auto_73655 ) ) ( not ( = ?auto_73653 ?auto_73656 ) ) ( not ( = ?auto_73653 ?auto_73657 ) ) ( not ( = ?auto_73654 ?auto_73655 ) ) ( not ( = ?auto_73654 ?auto_73656 ) ) ( not ( = ?auto_73654 ?auto_73657 ) ) ( not ( = ?auto_73655 ?auto_73656 ) ) ( not ( = ?auto_73655 ?auto_73657 ) ) ( not ( = ?auto_73656 ?auto_73657 ) ) ( ON ?auto_73657 ?auto_73658 ) ( not ( = ?auto_73653 ?auto_73658 ) ) ( not ( = ?auto_73654 ?auto_73658 ) ) ( not ( = ?auto_73655 ?auto_73658 ) ) ( not ( = ?auto_73656 ?auto_73658 ) ) ( not ( = ?auto_73657 ?auto_73658 ) ) ( ON ?auto_73656 ?auto_73657 ) ( ON-TABLE ?auto_73658 ) ( ON ?auto_73655 ?auto_73656 ) ( CLEAR ?auto_73655 ) ( HOLDING ?auto_73654 ) ( CLEAR ?auto_73653 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73653 ?auto_73654 )
      ( MAKE-5PILE ?auto_73653 ?auto_73654 ?auto_73655 ?auto_73656 ?auto_73657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73659 - BLOCK
      ?auto_73660 - BLOCK
      ?auto_73661 - BLOCK
      ?auto_73662 - BLOCK
      ?auto_73663 - BLOCK
    )
    :vars
    (
      ?auto_73664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73659 ) ( not ( = ?auto_73659 ?auto_73660 ) ) ( not ( = ?auto_73659 ?auto_73661 ) ) ( not ( = ?auto_73659 ?auto_73662 ) ) ( not ( = ?auto_73659 ?auto_73663 ) ) ( not ( = ?auto_73660 ?auto_73661 ) ) ( not ( = ?auto_73660 ?auto_73662 ) ) ( not ( = ?auto_73660 ?auto_73663 ) ) ( not ( = ?auto_73661 ?auto_73662 ) ) ( not ( = ?auto_73661 ?auto_73663 ) ) ( not ( = ?auto_73662 ?auto_73663 ) ) ( ON ?auto_73663 ?auto_73664 ) ( not ( = ?auto_73659 ?auto_73664 ) ) ( not ( = ?auto_73660 ?auto_73664 ) ) ( not ( = ?auto_73661 ?auto_73664 ) ) ( not ( = ?auto_73662 ?auto_73664 ) ) ( not ( = ?auto_73663 ?auto_73664 ) ) ( ON ?auto_73662 ?auto_73663 ) ( ON-TABLE ?auto_73664 ) ( ON ?auto_73661 ?auto_73662 ) ( CLEAR ?auto_73659 ) ( ON ?auto_73660 ?auto_73661 ) ( CLEAR ?auto_73660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73664 ?auto_73663 ?auto_73662 ?auto_73661 )
      ( MAKE-5PILE ?auto_73659 ?auto_73660 ?auto_73661 ?auto_73662 ?auto_73663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73665 - BLOCK
      ?auto_73666 - BLOCK
      ?auto_73667 - BLOCK
      ?auto_73668 - BLOCK
      ?auto_73669 - BLOCK
    )
    :vars
    (
      ?auto_73670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73665 ?auto_73666 ) ) ( not ( = ?auto_73665 ?auto_73667 ) ) ( not ( = ?auto_73665 ?auto_73668 ) ) ( not ( = ?auto_73665 ?auto_73669 ) ) ( not ( = ?auto_73666 ?auto_73667 ) ) ( not ( = ?auto_73666 ?auto_73668 ) ) ( not ( = ?auto_73666 ?auto_73669 ) ) ( not ( = ?auto_73667 ?auto_73668 ) ) ( not ( = ?auto_73667 ?auto_73669 ) ) ( not ( = ?auto_73668 ?auto_73669 ) ) ( ON ?auto_73669 ?auto_73670 ) ( not ( = ?auto_73665 ?auto_73670 ) ) ( not ( = ?auto_73666 ?auto_73670 ) ) ( not ( = ?auto_73667 ?auto_73670 ) ) ( not ( = ?auto_73668 ?auto_73670 ) ) ( not ( = ?auto_73669 ?auto_73670 ) ) ( ON ?auto_73668 ?auto_73669 ) ( ON-TABLE ?auto_73670 ) ( ON ?auto_73667 ?auto_73668 ) ( ON ?auto_73666 ?auto_73667 ) ( CLEAR ?auto_73666 ) ( HOLDING ?auto_73665 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73665 )
      ( MAKE-5PILE ?auto_73665 ?auto_73666 ?auto_73667 ?auto_73668 ?auto_73669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73671 - BLOCK
      ?auto_73672 - BLOCK
      ?auto_73673 - BLOCK
      ?auto_73674 - BLOCK
      ?auto_73675 - BLOCK
    )
    :vars
    (
      ?auto_73676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73671 ?auto_73672 ) ) ( not ( = ?auto_73671 ?auto_73673 ) ) ( not ( = ?auto_73671 ?auto_73674 ) ) ( not ( = ?auto_73671 ?auto_73675 ) ) ( not ( = ?auto_73672 ?auto_73673 ) ) ( not ( = ?auto_73672 ?auto_73674 ) ) ( not ( = ?auto_73672 ?auto_73675 ) ) ( not ( = ?auto_73673 ?auto_73674 ) ) ( not ( = ?auto_73673 ?auto_73675 ) ) ( not ( = ?auto_73674 ?auto_73675 ) ) ( ON ?auto_73675 ?auto_73676 ) ( not ( = ?auto_73671 ?auto_73676 ) ) ( not ( = ?auto_73672 ?auto_73676 ) ) ( not ( = ?auto_73673 ?auto_73676 ) ) ( not ( = ?auto_73674 ?auto_73676 ) ) ( not ( = ?auto_73675 ?auto_73676 ) ) ( ON ?auto_73674 ?auto_73675 ) ( ON-TABLE ?auto_73676 ) ( ON ?auto_73673 ?auto_73674 ) ( ON ?auto_73672 ?auto_73673 ) ( ON ?auto_73671 ?auto_73672 ) ( CLEAR ?auto_73671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73676 ?auto_73675 ?auto_73674 ?auto_73673 ?auto_73672 )
      ( MAKE-5PILE ?auto_73671 ?auto_73672 ?auto_73673 ?auto_73674 ?auto_73675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73677 - BLOCK
      ?auto_73678 - BLOCK
      ?auto_73679 - BLOCK
      ?auto_73680 - BLOCK
      ?auto_73681 - BLOCK
    )
    :vars
    (
      ?auto_73682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73677 ?auto_73678 ) ) ( not ( = ?auto_73677 ?auto_73679 ) ) ( not ( = ?auto_73677 ?auto_73680 ) ) ( not ( = ?auto_73677 ?auto_73681 ) ) ( not ( = ?auto_73678 ?auto_73679 ) ) ( not ( = ?auto_73678 ?auto_73680 ) ) ( not ( = ?auto_73678 ?auto_73681 ) ) ( not ( = ?auto_73679 ?auto_73680 ) ) ( not ( = ?auto_73679 ?auto_73681 ) ) ( not ( = ?auto_73680 ?auto_73681 ) ) ( ON ?auto_73681 ?auto_73682 ) ( not ( = ?auto_73677 ?auto_73682 ) ) ( not ( = ?auto_73678 ?auto_73682 ) ) ( not ( = ?auto_73679 ?auto_73682 ) ) ( not ( = ?auto_73680 ?auto_73682 ) ) ( not ( = ?auto_73681 ?auto_73682 ) ) ( ON ?auto_73680 ?auto_73681 ) ( ON-TABLE ?auto_73682 ) ( ON ?auto_73679 ?auto_73680 ) ( ON ?auto_73678 ?auto_73679 ) ( HOLDING ?auto_73677 ) ( CLEAR ?auto_73678 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73682 ?auto_73681 ?auto_73680 ?auto_73679 ?auto_73678 ?auto_73677 )
      ( MAKE-5PILE ?auto_73677 ?auto_73678 ?auto_73679 ?auto_73680 ?auto_73681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73683 - BLOCK
      ?auto_73684 - BLOCK
      ?auto_73685 - BLOCK
      ?auto_73686 - BLOCK
      ?auto_73687 - BLOCK
    )
    :vars
    (
      ?auto_73688 - BLOCK
      ?auto_73689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73683 ?auto_73684 ) ) ( not ( = ?auto_73683 ?auto_73685 ) ) ( not ( = ?auto_73683 ?auto_73686 ) ) ( not ( = ?auto_73683 ?auto_73687 ) ) ( not ( = ?auto_73684 ?auto_73685 ) ) ( not ( = ?auto_73684 ?auto_73686 ) ) ( not ( = ?auto_73684 ?auto_73687 ) ) ( not ( = ?auto_73685 ?auto_73686 ) ) ( not ( = ?auto_73685 ?auto_73687 ) ) ( not ( = ?auto_73686 ?auto_73687 ) ) ( ON ?auto_73687 ?auto_73688 ) ( not ( = ?auto_73683 ?auto_73688 ) ) ( not ( = ?auto_73684 ?auto_73688 ) ) ( not ( = ?auto_73685 ?auto_73688 ) ) ( not ( = ?auto_73686 ?auto_73688 ) ) ( not ( = ?auto_73687 ?auto_73688 ) ) ( ON ?auto_73686 ?auto_73687 ) ( ON-TABLE ?auto_73688 ) ( ON ?auto_73685 ?auto_73686 ) ( ON ?auto_73684 ?auto_73685 ) ( CLEAR ?auto_73684 ) ( ON ?auto_73683 ?auto_73689 ) ( CLEAR ?auto_73683 ) ( HAND-EMPTY ) ( not ( = ?auto_73683 ?auto_73689 ) ) ( not ( = ?auto_73684 ?auto_73689 ) ) ( not ( = ?auto_73685 ?auto_73689 ) ) ( not ( = ?auto_73686 ?auto_73689 ) ) ( not ( = ?auto_73687 ?auto_73689 ) ) ( not ( = ?auto_73688 ?auto_73689 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73683 ?auto_73689 )
      ( MAKE-5PILE ?auto_73683 ?auto_73684 ?auto_73685 ?auto_73686 ?auto_73687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73690 - BLOCK
      ?auto_73691 - BLOCK
      ?auto_73692 - BLOCK
      ?auto_73693 - BLOCK
      ?auto_73694 - BLOCK
    )
    :vars
    (
      ?auto_73696 - BLOCK
      ?auto_73695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73690 ?auto_73691 ) ) ( not ( = ?auto_73690 ?auto_73692 ) ) ( not ( = ?auto_73690 ?auto_73693 ) ) ( not ( = ?auto_73690 ?auto_73694 ) ) ( not ( = ?auto_73691 ?auto_73692 ) ) ( not ( = ?auto_73691 ?auto_73693 ) ) ( not ( = ?auto_73691 ?auto_73694 ) ) ( not ( = ?auto_73692 ?auto_73693 ) ) ( not ( = ?auto_73692 ?auto_73694 ) ) ( not ( = ?auto_73693 ?auto_73694 ) ) ( ON ?auto_73694 ?auto_73696 ) ( not ( = ?auto_73690 ?auto_73696 ) ) ( not ( = ?auto_73691 ?auto_73696 ) ) ( not ( = ?auto_73692 ?auto_73696 ) ) ( not ( = ?auto_73693 ?auto_73696 ) ) ( not ( = ?auto_73694 ?auto_73696 ) ) ( ON ?auto_73693 ?auto_73694 ) ( ON-TABLE ?auto_73696 ) ( ON ?auto_73692 ?auto_73693 ) ( ON ?auto_73690 ?auto_73695 ) ( CLEAR ?auto_73690 ) ( not ( = ?auto_73690 ?auto_73695 ) ) ( not ( = ?auto_73691 ?auto_73695 ) ) ( not ( = ?auto_73692 ?auto_73695 ) ) ( not ( = ?auto_73693 ?auto_73695 ) ) ( not ( = ?auto_73694 ?auto_73695 ) ) ( not ( = ?auto_73696 ?auto_73695 ) ) ( HOLDING ?auto_73691 ) ( CLEAR ?auto_73692 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73696 ?auto_73694 ?auto_73693 ?auto_73692 ?auto_73691 )
      ( MAKE-5PILE ?auto_73690 ?auto_73691 ?auto_73692 ?auto_73693 ?auto_73694 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73697 - BLOCK
      ?auto_73698 - BLOCK
      ?auto_73699 - BLOCK
      ?auto_73700 - BLOCK
      ?auto_73701 - BLOCK
    )
    :vars
    (
      ?auto_73702 - BLOCK
      ?auto_73703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73697 ?auto_73698 ) ) ( not ( = ?auto_73697 ?auto_73699 ) ) ( not ( = ?auto_73697 ?auto_73700 ) ) ( not ( = ?auto_73697 ?auto_73701 ) ) ( not ( = ?auto_73698 ?auto_73699 ) ) ( not ( = ?auto_73698 ?auto_73700 ) ) ( not ( = ?auto_73698 ?auto_73701 ) ) ( not ( = ?auto_73699 ?auto_73700 ) ) ( not ( = ?auto_73699 ?auto_73701 ) ) ( not ( = ?auto_73700 ?auto_73701 ) ) ( ON ?auto_73701 ?auto_73702 ) ( not ( = ?auto_73697 ?auto_73702 ) ) ( not ( = ?auto_73698 ?auto_73702 ) ) ( not ( = ?auto_73699 ?auto_73702 ) ) ( not ( = ?auto_73700 ?auto_73702 ) ) ( not ( = ?auto_73701 ?auto_73702 ) ) ( ON ?auto_73700 ?auto_73701 ) ( ON-TABLE ?auto_73702 ) ( ON ?auto_73699 ?auto_73700 ) ( ON ?auto_73697 ?auto_73703 ) ( not ( = ?auto_73697 ?auto_73703 ) ) ( not ( = ?auto_73698 ?auto_73703 ) ) ( not ( = ?auto_73699 ?auto_73703 ) ) ( not ( = ?auto_73700 ?auto_73703 ) ) ( not ( = ?auto_73701 ?auto_73703 ) ) ( not ( = ?auto_73702 ?auto_73703 ) ) ( CLEAR ?auto_73699 ) ( ON ?auto_73698 ?auto_73697 ) ( CLEAR ?auto_73698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73703 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73703 ?auto_73697 )
      ( MAKE-5PILE ?auto_73697 ?auto_73698 ?auto_73699 ?auto_73700 ?auto_73701 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73704 - BLOCK
      ?auto_73705 - BLOCK
      ?auto_73706 - BLOCK
      ?auto_73707 - BLOCK
      ?auto_73708 - BLOCK
    )
    :vars
    (
      ?auto_73709 - BLOCK
      ?auto_73710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73704 ?auto_73705 ) ) ( not ( = ?auto_73704 ?auto_73706 ) ) ( not ( = ?auto_73704 ?auto_73707 ) ) ( not ( = ?auto_73704 ?auto_73708 ) ) ( not ( = ?auto_73705 ?auto_73706 ) ) ( not ( = ?auto_73705 ?auto_73707 ) ) ( not ( = ?auto_73705 ?auto_73708 ) ) ( not ( = ?auto_73706 ?auto_73707 ) ) ( not ( = ?auto_73706 ?auto_73708 ) ) ( not ( = ?auto_73707 ?auto_73708 ) ) ( ON ?auto_73708 ?auto_73709 ) ( not ( = ?auto_73704 ?auto_73709 ) ) ( not ( = ?auto_73705 ?auto_73709 ) ) ( not ( = ?auto_73706 ?auto_73709 ) ) ( not ( = ?auto_73707 ?auto_73709 ) ) ( not ( = ?auto_73708 ?auto_73709 ) ) ( ON ?auto_73707 ?auto_73708 ) ( ON-TABLE ?auto_73709 ) ( ON ?auto_73704 ?auto_73710 ) ( not ( = ?auto_73704 ?auto_73710 ) ) ( not ( = ?auto_73705 ?auto_73710 ) ) ( not ( = ?auto_73706 ?auto_73710 ) ) ( not ( = ?auto_73707 ?auto_73710 ) ) ( not ( = ?auto_73708 ?auto_73710 ) ) ( not ( = ?auto_73709 ?auto_73710 ) ) ( ON ?auto_73705 ?auto_73704 ) ( CLEAR ?auto_73705 ) ( ON-TABLE ?auto_73710 ) ( HOLDING ?auto_73706 ) ( CLEAR ?auto_73707 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73709 ?auto_73708 ?auto_73707 ?auto_73706 )
      ( MAKE-5PILE ?auto_73704 ?auto_73705 ?auto_73706 ?auto_73707 ?auto_73708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73711 - BLOCK
      ?auto_73712 - BLOCK
      ?auto_73713 - BLOCK
      ?auto_73714 - BLOCK
      ?auto_73715 - BLOCK
    )
    :vars
    (
      ?auto_73716 - BLOCK
      ?auto_73717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73711 ?auto_73712 ) ) ( not ( = ?auto_73711 ?auto_73713 ) ) ( not ( = ?auto_73711 ?auto_73714 ) ) ( not ( = ?auto_73711 ?auto_73715 ) ) ( not ( = ?auto_73712 ?auto_73713 ) ) ( not ( = ?auto_73712 ?auto_73714 ) ) ( not ( = ?auto_73712 ?auto_73715 ) ) ( not ( = ?auto_73713 ?auto_73714 ) ) ( not ( = ?auto_73713 ?auto_73715 ) ) ( not ( = ?auto_73714 ?auto_73715 ) ) ( ON ?auto_73715 ?auto_73716 ) ( not ( = ?auto_73711 ?auto_73716 ) ) ( not ( = ?auto_73712 ?auto_73716 ) ) ( not ( = ?auto_73713 ?auto_73716 ) ) ( not ( = ?auto_73714 ?auto_73716 ) ) ( not ( = ?auto_73715 ?auto_73716 ) ) ( ON ?auto_73714 ?auto_73715 ) ( ON-TABLE ?auto_73716 ) ( ON ?auto_73711 ?auto_73717 ) ( not ( = ?auto_73711 ?auto_73717 ) ) ( not ( = ?auto_73712 ?auto_73717 ) ) ( not ( = ?auto_73713 ?auto_73717 ) ) ( not ( = ?auto_73714 ?auto_73717 ) ) ( not ( = ?auto_73715 ?auto_73717 ) ) ( not ( = ?auto_73716 ?auto_73717 ) ) ( ON ?auto_73712 ?auto_73711 ) ( ON-TABLE ?auto_73717 ) ( CLEAR ?auto_73714 ) ( ON ?auto_73713 ?auto_73712 ) ( CLEAR ?auto_73713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73717 ?auto_73711 ?auto_73712 )
      ( MAKE-5PILE ?auto_73711 ?auto_73712 ?auto_73713 ?auto_73714 ?auto_73715 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73718 - BLOCK
      ?auto_73719 - BLOCK
      ?auto_73720 - BLOCK
      ?auto_73721 - BLOCK
      ?auto_73722 - BLOCK
    )
    :vars
    (
      ?auto_73723 - BLOCK
      ?auto_73724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73718 ?auto_73719 ) ) ( not ( = ?auto_73718 ?auto_73720 ) ) ( not ( = ?auto_73718 ?auto_73721 ) ) ( not ( = ?auto_73718 ?auto_73722 ) ) ( not ( = ?auto_73719 ?auto_73720 ) ) ( not ( = ?auto_73719 ?auto_73721 ) ) ( not ( = ?auto_73719 ?auto_73722 ) ) ( not ( = ?auto_73720 ?auto_73721 ) ) ( not ( = ?auto_73720 ?auto_73722 ) ) ( not ( = ?auto_73721 ?auto_73722 ) ) ( ON ?auto_73722 ?auto_73723 ) ( not ( = ?auto_73718 ?auto_73723 ) ) ( not ( = ?auto_73719 ?auto_73723 ) ) ( not ( = ?auto_73720 ?auto_73723 ) ) ( not ( = ?auto_73721 ?auto_73723 ) ) ( not ( = ?auto_73722 ?auto_73723 ) ) ( ON-TABLE ?auto_73723 ) ( ON ?auto_73718 ?auto_73724 ) ( not ( = ?auto_73718 ?auto_73724 ) ) ( not ( = ?auto_73719 ?auto_73724 ) ) ( not ( = ?auto_73720 ?auto_73724 ) ) ( not ( = ?auto_73721 ?auto_73724 ) ) ( not ( = ?auto_73722 ?auto_73724 ) ) ( not ( = ?auto_73723 ?auto_73724 ) ) ( ON ?auto_73719 ?auto_73718 ) ( ON-TABLE ?auto_73724 ) ( ON ?auto_73720 ?auto_73719 ) ( CLEAR ?auto_73720 ) ( HOLDING ?auto_73721 ) ( CLEAR ?auto_73722 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73723 ?auto_73722 ?auto_73721 )
      ( MAKE-5PILE ?auto_73718 ?auto_73719 ?auto_73720 ?auto_73721 ?auto_73722 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73725 - BLOCK
      ?auto_73726 - BLOCK
      ?auto_73727 - BLOCK
      ?auto_73728 - BLOCK
      ?auto_73729 - BLOCK
    )
    :vars
    (
      ?auto_73731 - BLOCK
      ?auto_73730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73725 ?auto_73726 ) ) ( not ( = ?auto_73725 ?auto_73727 ) ) ( not ( = ?auto_73725 ?auto_73728 ) ) ( not ( = ?auto_73725 ?auto_73729 ) ) ( not ( = ?auto_73726 ?auto_73727 ) ) ( not ( = ?auto_73726 ?auto_73728 ) ) ( not ( = ?auto_73726 ?auto_73729 ) ) ( not ( = ?auto_73727 ?auto_73728 ) ) ( not ( = ?auto_73727 ?auto_73729 ) ) ( not ( = ?auto_73728 ?auto_73729 ) ) ( ON ?auto_73729 ?auto_73731 ) ( not ( = ?auto_73725 ?auto_73731 ) ) ( not ( = ?auto_73726 ?auto_73731 ) ) ( not ( = ?auto_73727 ?auto_73731 ) ) ( not ( = ?auto_73728 ?auto_73731 ) ) ( not ( = ?auto_73729 ?auto_73731 ) ) ( ON-TABLE ?auto_73731 ) ( ON ?auto_73725 ?auto_73730 ) ( not ( = ?auto_73725 ?auto_73730 ) ) ( not ( = ?auto_73726 ?auto_73730 ) ) ( not ( = ?auto_73727 ?auto_73730 ) ) ( not ( = ?auto_73728 ?auto_73730 ) ) ( not ( = ?auto_73729 ?auto_73730 ) ) ( not ( = ?auto_73731 ?auto_73730 ) ) ( ON ?auto_73726 ?auto_73725 ) ( ON-TABLE ?auto_73730 ) ( ON ?auto_73727 ?auto_73726 ) ( CLEAR ?auto_73729 ) ( ON ?auto_73728 ?auto_73727 ) ( CLEAR ?auto_73728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73730 ?auto_73725 ?auto_73726 ?auto_73727 )
      ( MAKE-5PILE ?auto_73725 ?auto_73726 ?auto_73727 ?auto_73728 ?auto_73729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73732 - BLOCK
      ?auto_73733 - BLOCK
      ?auto_73734 - BLOCK
      ?auto_73735 - BLOCK
      ?auto_73736 - BLOCK
    )
    :vars
    (
      ?auto_73737 - BLOCK
      ?auto_73738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73732 ?auto_73733 ) ) ( not ( = ?auto_73732 ?auto_73734 ) ) ( not ( = ?auto_73732 ?auto_73735 ) ) ( not ( = ?auto_73732 ?auto_73736 ) ) ( not ( = ?auto_73733 ?auto_73734 ) ) ( not ( = ?auto_73733 ?auto_73735 ) ) ( not ( = ?auto_73733 ?auto_73736 ) ) ( not ( = ?auto_73734 ?auto_73735 ) ) ( not ( = ?auto_73734 ?auto_73736 ) ) ( not ( = ?auto_73735 ?auto_73736 ) ) ( not ( = ?auto_73732 ?auto_73737 ) ) ( not ( = ?auto_73733 ?auto_73737 ) ) ( not ( = ?auto_73734 ?auto_73737 ) ) ( not ( = ?auto_73735 ?auto_73737 ) ) ( not ( = ?auto_73736 ?auto_73737 ) ) ( ON-TABLE ?auto_73737 ) ( ON ?auto_73732 ?auto_73738 ) ( not ( = ?auto_73732 ?auto_73738 ) ) ( not ( = ?auto_73733 ?auto_73738 ) ) ( not ( = ?auto_73734 ?auto_73738 ) ) ( not ( = ?auto_73735 ?auto_73738 ) ) ( not ( = ?auto_73736 ?auto_73738 ) ) ( not ( = ?auto_73737 ?auto_73738 ) ) ( ON ?auto_73733 ?auto_73732 ) ( ON-TABLE ?auto_73738 ) ( ON ?auto_73734 ?auto_73733 ) ( ON ?auto_73735 ?auto_73734 ) ( CLEAR ?auto_73735 ) ( HOLDING ?auto_73736 ) ( CLEAR ?auto_73737 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73737 ?auto_73736 )
      ( MAKE-5PILE ?auto_73732 ?auto_73733 ?auto_73734 ?auto_73735 ?auto_73736 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73739 - BLOCK
      ?auto_73740 - BLOCK
      ?auto_73741 - BLOCK
      ?auto_73742 - BLOCK
      ?auto_73743 - BLOCK
    )
    :vars
    (
      ?auto_73744 - BLOCK
      ?auto_73745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73739 ?auto_73740 ) ) ( not ( = ?auto_73739 ?auto_73741 ) ) ( not ( = ?auto_73739 ?auto_73742 ) ) ( not ( = ?auto_73739 ?auto_73743 ) ) ( not ( = ?auto_73740 ?auto_73741 ) ) ( not ( = ?auto_73740 ?auto_73742 ) ) ( not ( = ?auto_73740 ?auto_73743 ) ) ( not ( = ?auto_73741 ?auto_73742 ) ) ( not ( = ?auto_73741 ?auto_73743 ) ) ( not ( = ?auto_73742 ?auto_73743 ) ) ( not ( = ?auto_73739 ?auto_73744 ) ) ( not ( = ?auto_73740 ?auto_73744 ) ) ( not ( = ?auto_73741 ?auto_73744 ) ) ( not ( = ?auto_73742 ?auto_73744 ) ) ( not ( = ?auto_73743 ?auto_73744 ) ) ( ON-TABLE ?auto_73744 ) ( ON ?auto_73739 ?auto_73745 ) ( not ( = ?auto_73739 ?auto_73745 ) ) ( not ( = ?auto_73740 ?auto_73745 ) ) ( not ( = ?auto_73741 ?auto_73745 ) ) ( not ( = ?auto_73742 ?auto_73745 ) ) ( not ( = ?auto_73743 ?auto_73745 ) ) ( not ( = ?auto_73744 ?auto_73745 ) ) ( ON ?auto_73740 ?auto_73739 ) ( ON-TABLE ?auto_73745 ) ( ON ?auto_73741 ?auto_73740 ) ( ON ?auto_73742 ?auto_73741 ) ( CLEAR ?auto_73744 ) ( ON ?auto_73743 ?auto_73742 ) ( CLEAR ?auto_73743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73745 ?auto_73739 ?auto_73740 ?auto_73741 ?auto_73742 )
      ( MAKE-5PILE ?auto_73739 ?auto_73740 ?auto_73741 ?auto_73742 ?auto_73743 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73746 - BLOCK
      ?auto_73747 - BLOCK
      ?auto_73748 - BLOCK
      ?auto_73749 - BLOCK
      ?auto_73750 - BLOCK
    )
    :vars
    (
      ?auto_73751 - BLOCK
      ?auto_73752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73746 ?auto_73747 ) ) ( not ( = ?auto_73746 ?auto_73748 ) ) ( not ( = ?auto_73746 ?auto_73749 ) ) ( not ( = ?auto_73746 ?auto_73750 ) ) ( not ( = ?auto_73747 ?auto_73748 ) ) ( not ( = ?auto_73747 ?auto_73749 ) ) ( not ( = ?auto_73747 ?auto_73750 ) ) ( not ( = ?auto_73748 ?auto_73749 ) ) ( not ( = ?auto_73748 ?auto_73750 ) ) ( not ( = ?auto_73749 ?auto_73750 ) ) ( not ( = ?auto_73746 ?auto_73751 ) ) ( not ( = ?auto_73747 ?auto_73751 ) ) ( not ( = ?auto_73748 ?auto_73751 ) ) ( not ( = ?auto_73749 ?auto_73751 ) ) ( not ( = ?auto_73750 ?auto_73751 ) ) ( ON ?auto_73746 ?auto_73752 ) ( not ( = ?auto_73746 ?auto_73752 ) ) ( not ( = ?auto_73747 ?auto_73752 ) ) ( not ( = ?auto_73748 ?auto_73752 ) ) ( not ( = ?auto_73749 ?auto_73752 ) ) ( not ( = ?auto_73750 ?auto_73752 ) ) ( not ( = ?auto_73751 ?auto_73752 ) ) ( ON ?auto_73747 ?auto_73746 ) ( ON-TABLE ?auto_73752 ) ( ON ?auto_73748 ?auto_73747 ) ( ON ?auto_73749 ?auto_73748 ) ( ON ?auto_73750 ?auto_73749 ) ( CLEAR ?auto_73750 ) ( HOLDING ?auto_73751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73751 )
      ( MAKE-5PILE ?auto_73746 ?auto_73747 ?auto_73748 ?auto_73749 ?auto_73750 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73753 - BLOCK
      ?auto_73754 - BLOCK
      ?auto_73755 - BLOCK
      ?auto_73756 - BLOCK
      ?auto_73757 - BLOCK
    )
    :vars
    (
      ?auto_73759 - BLOCK
      ?auto_73758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73753 ?auto_73754 ) ) ( not ( = ?auto_73753 ?auto_73755 ) ) ( not ( = ?auto_73753 ?auto_73756 ) ) ( not ( = ?auto_73753 ?auto_73757 ) ) ( not ( = ?auto_73754 ?auto_73755 ) ) ( not ( = ?auto_73754 ?auto_73756 ) ) ( not ( = ?auto_73754 ?auto_73757 ) ) ( not ( = ?auto_73755 ?auto_73756 ) ) ( not ( = ?auto_73755 ?auto_73757 ) ) ( not ( = ?auto_73756 ?auto_73757 ) ) ( not ( = ?auto_73753 ?auto_73759 ) ) ( not ( = ?auto_73754 ?auto_73759 ) ) ( not ( = ?auto_73755 ?auto_73759 ) ) ( not ( = ?auto_73756 ?auto_73759 ) ) ( not ( = ?auto_73757 ?auto_73759 ) ) ( ON ?auto_73753 ?auto_73758 ) ( not ( = ?auto_73753 ?auto_73758 ) ) ( not ( = ?auto_73754 ?auto_73758 ) ) ( not ( = ?auto_73755 ?auto_73758 ) ) ( not ( = ?auto_73756 ?auto_73758 ) ) ( not ( = ?auto_73757 ?auto_73758 ) ) ( not ( = ?auto_73759 ?auto_73758 ) ) ( ON ?auto_73754 ?auto_73753 ) ( ON-TABLE ?auto_73758 ) ( ON ?auto_73755 ?auto_73754 ) ( ON ?auto_73756 ?auto_73755 ) ( ON ?auto_73757 ?auto_73756 ) ( ON ?auto_73759 ?auto_73757 ) ( CLEAR ?auto_73759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73758 ?auto_73753 ?auto_73754 ?auto_73755 ?auto_73756 ?auto_73757 )
      ( MAKE-5PILE ?auto_73753 ?auto_73754 ?auto_73755 ?auto_73756 ?auto_73757 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73766 - BLOCK
      ?auto_73767 - BLOCK
      ?auto_73768 - BLOCK
      ?auto_73769 - BLOCK
      ?auto_73770 - BLOCK
      ?auto_73771 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_73771 ) ( CLEAR ?auto_73770 ) ( ON-TABLE ?auto_73766 ) ( ON ?auto_73767 ?auto_73766 ) ( ON ?auto_73768 ?auto_73767 ) ( ON ?auto_73769 ?auto_73768 ) ( ON ?auto_73770 ?auto_73769 ) ( not ( = ?auto_73766 ?auto_73767 ) ) ( not ( = ?auto_73766 ?auto_73768 ) ) ( not ( = ?auto_73766 ?auto_73769 ) ) ( not ( = ?auto_73766 ?auto_73770 ) ) ( not ( = ?auto_73766 ?auto_73771 ) ) ( not ( = ?auto_73767 ?auto_73768 ) ) ( not ( = ?auto_73767 ?auto_73769 ) ) ( not ( = ?auto_73767 ?auto_73770 ) ) ( not ( = ?auto_73767 ?auto_73771 ) ) ( not ( = ?auto_73768 ?auto_73769 ) ) ( not ( = ?auto_73768 ?auto_73770 ) ) ( not ( = ?auto_73768 ?auto_73771 ) ) ( not ( = ?auto_73769 ?auto_73770 ) ) ( not ( = ?auto_73769 ?auto_73771 ) ) ( not ( = ?auto_73770 ?auto_73771 ) ) )
    :subtasks
    ( ( !STACK ?auto_73771 ?auto_73770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73772 - BLOCK
      ?auto_73773 - BLOCK
      ?auto_73774 - BLOCK
      ?auto_73775 - BLOCK
      ?auto_73776 - BLOCK
      ?auto_73777 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73776 ) ( ON-TABLE ?auto_73772 ) ( ON ?auto_73773 ?auto_73772 ) ( ON ?auto_73774 ?auto_73773 ) ( ON ?auto_73775 ?auto_73774 ) ( ON ?auto_73776 ?auto_73775 ) ( not ( = ?auto_73772 ?auto_73773 ) ) ( not ( = ?auto_73772 ?auto_73774 ) ) ( not ( = ?auto_73772 ?auto_73775 ) ) ( not ( = ?auto_73772 ?auto_73776 ) ) ( not ( = ?auto_73772 ?auto_73777 ) ) ( not ( = ?auto_73773 ?auto_73774 ) ) ( not ( = ?auto_73773 ?auto_73775 ) ) ( not ( = ?auto_73773 ?auto_73776 ) ) ( not ( = ?auto_73773 ?auto_73777 ) ) ( not ( = ?auto_73774 ?auto_73775 ) ) ( not ( = ?auto_73774 ?auto_73776 ) ) ( not ( = ?auto_73774 ?auto_73777 ) ) ( not ( = ?auto_73775 ?auto_73776 ) ) ( not ( = ?auto_73775 ?auto_73777 ) ) ( not ( = ?auto_73776 ?auto_73777 ) ) ( ON-TABLE ?auto_73777 ) ( CLEAR ?auto_73777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_73777 )
      ( MAKE-6PILE ?auto_73772 ?auto_73773 ?auto_73774 ?auto_73775 ?auto_73776 ?auto_73777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73778 - BLOCK
      ?auto_73779 - BLOCK
      ?auto_73780 - BLOCK
      ?auto_73781 - BLOCK
      ?auto_73782 - BLOCK
      ?auto_73783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73778 ) ( ON ?auto_73779 ?auto_73778 ) ( ON ?auto_73780 ?auto_73779 ) ( ON ?auto_73781 ?auto_73780 ) ( not ( = ?auto_73778 ?auto_73779 ) ) ( not ( = ?auto_73778 ?auto_73780 ) ) ( not ( = ?auto_73778 ?auto_73781 ) ) ( not ( = ?auto_73778 ?auto_73782 ) ) ( not ( = ?auto_73778 ?auto_73783 ) ) ( not ( = ?auto_73779 ?auto_73780 ) ) ( not ( = ?auto_73779 ?auto_73781 ) ) ( not ( = ?auto_73779 ?auto_73782 ) ) ( not ( = ?auto_73779 ?auto_73783 ) ) ( not ( = ?auto_73780 ?auto_73781 ) ) ( not ( = ?auto_73780 ?auto_73782 ) ) ( not ( = ?auto_73780 ?auto_73783 ) ) ( not ( = ?auto_73781 ?auto_73782 ) ) ( not ( = ?auto_73781 ?auto_73783 ) ) ( not ( = ?auto_73782 ?auto_73783 ) ) ( ON-TABLE ?auto_73783 ) ( CLEAR ?auto_73783 ) ( HOLDING ?auto_73782 ) ( CLEAR ?auto_73781 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73778 ?auto_73779 ?auto_73780 ?auto_73781 ?auto_73782 )
      ( MAKE-6PILE ?auto_73778 ?auto_73779 ?auto_73780 ?auto_73781 ?auto_73782 ?auto_73783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73784 - BLOCK
      ?auto_73785 - BLOCK
      ?auto_73786 - BLOCK
      ?auto_73787 - BLOCK
      ?auto_73788 - BLOCK
      ?auto_73789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73784 ) ( ON ?auto_73785 ?auto_73784 ) ( ON ?auto_73786 ?auto_73785 ) ( ON ?auto_73787 ?auto_73786 ) ( not ( = ?auto_73784 ?auto_73785 ) ) ( not ( = ?auto_73784 ?auto_73786 ) ) ( not ( = ?auto_73784 ?auto_73787 ) ) ( not ( = ?auto_73784 ?auto_73788 ) ) ( not ( = ?auto_73784 ?auto_73789 ) ) ( not ( = ?auto_73785 ?auto_73786 ) ) ( not ( = ?auto_73785 ?auto_73787 ) ) ( not ( = ?auto_73785 ?auto_73788 ) ) ( not ( = ?auto_73785 ?auto_73789 ) ) ( not ( = ?auto_73786 ?auto_73787 ) ) ( not ( = ?auto_73786 ?auto_73788 ) ) ( not ( = ?auto_73786 ?auto_73789 ) ) ( not ( = ?auto_73787 ?auto_73788 ) ) ( not ( = ?auto_73787 ?auto_73789 ) ) ( not ( = ?auto_73788 ?auto_73789 ) ) ( ON-TABLE ?auto_73789 ) ( CLEAR ?auto_73787 ) ( ON ?auto_73788 ?auto_73789 ) ( CLEAR ?auto_73788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73789 )
      ( MAKE-6PILE ?auto_73784 ?auto_73785 ?auto_73786 ?auto_73787 ?auto_73788 ?auto_73789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73790 - BLOCK
      ?auto_73791 - BLOCK
      ?auto_73792 - BLOCK
      ?auto_73793 - BLOCK
      ?auto_73794 - BLOCK
      ?auto_73795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73790 ) ( ON ?auto_73791 ?auto_73790 ) ( ON ?auto_73792 ?auto_73791 ) ( not ( = ?auto_73790 ?auto_73791 ) ) ( not ( = ?auto_73790 ?auto_73792 ) ) ( not ( = ?auto_73790 ?auto_73793 ) ) ( not ( = ?auto_73790 ?auto_73794 ) ) ( not ( = ?auto_73790 ?auto_73795 ) ) ( not ( = ?auto_73791 ?auto_73792 ) ) ( not ( = ?auto_73791 ?auto_73793 ) ) ( not ( = ?auto_73791 ?auto_73794 ) ) ( not ( = ?auto_73791 ?auto_73795 ) ) ( not ( = ?auto_73792 ?auto_73793 ) ) ( not ( = ?auto_73792 ?auto_73794 ) ) ( not ( = ?auto_73792 ?auto_73795 ) ) ( not ( = ?auto_73793 ?auto_73794 ) ) ( not ( = ?auto_73793 ?auto_73795 ) ) ( not ( = ?auto_73794 ?auto_73795 ) ) ( ON-TABLE ?auto_73795 ) ( ON ?auto_73794 ?auto_73795 ) ( CLEAR ?auto_73794 ) ( HOLDING ?auto_73793 ) ( CLEAR ?auto_73792 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73790 ?auto_73791 ?auto_73792 ?auto_73793 )
      ( MAKE-6PILE ?auto_73790 ?auto_73791 ?auto_73792 ?auto_73793 ?auto_73794 ?auto_73795 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73796 - BLOCK
      ?auto_73797 - BLOCK
      ?auto_73798 - BLOCK
      ?auto_73799 - BLOCK
      ?auto_73800 - BLOCK
      ?auto_73801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73796 ) ( ON ?auto_73797 ?auto_73796 ) ( ON ?auto_73798 ?auto_73797 ) ( not ( = ?auto_73796 ?auto_73797 ) ) ( not ( = ?auto_73796 ?auto_73798 ) ) ( not ( = ?auto_73796 ?auto_73799 ) ) ( not ( = ?auto_73796 ?auto_73800 ) ) ( not ( = ?auto_73796 ?auto_73801 ) ) ( not ( = ?auto_73797 ?auto_73798 ) ) ( not ( = ?auto_73797 ?auto_73799 ) ) ( not ( = ?auto_73797 ?auto_73800 ) ) ( not ( = ?auto_73797 ?auto_73801 ) ) ( not ( = ?auto_73798 ?auto_73799 ) ) ( not ( = ?auto_73798 ?auto_73800 ) ) ( not ( = ?auto_73798 ?auto_73801 ) ) ( not ( = ?auto_73799 ?auto_73800 ) ) ( not ( = ?auto_73799 ?auto_73801 ) ) ( not ( = ?auto_73800 ?auto_73801 ) ) ( ON-TABLE ?auto_73801 ) ( ON ?auto_73800 ?auto_73801 ) ( CLEAR ?auto_73798 ) ( ON ?auto_73799 ?auto_73800 ) ( CLEAR ?auto_73799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73801 ?auto_73800 )
      ( MAKE-6PILE ?auto_73796 ?auto_73797 ?auto_73798 ?auto_73799 ?auto_73800 ?auto_73801 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73802 - BLOCK
      ?auto_73803 - BLOCK
      ?auto_73804 - BLOCK
      ?auto_73805 - BLOCK
      ?auto_73806 - BLOCK
      ?auto_73807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73802 ) ( ON ?auto_73803 ?auto_73802 ) ( not ( = ?auto_73802 ?auto_73803 ) ) ( not ( = ?auto_73802 ?auto_73804 ) ) ( not ( = ?auto_73802 ?auto_73805 ) ) ( not ( = ?auto_73802 ?auto_73806 ) ) ( not ( = ?auto_73802 ?auto_73807 ) ) ( not ( = ?auto_73803 ?auto_73804 ) ) ( not ( = ?auto_73803 ?auto_73805 ) ) ( not ( = ?auto_73803 ?auto_73806 ) ) ( not ( = ?auto_73803 ?auto_73807 ) ) ( not ( = ?auto_73804 ?auto_73805 ) ) ( not ( = ?auto_73804 ?auto_73806 ) ) ( not ( = ?auto_73804 ?auto_73807 ) ) ( not ( = ?auto_73805 ?auto_73806 ) ) ( not ( = ?auto_73805 ?auto_73807 ) ) ( not ( = ?auto_73806 ?auto_73807 ) ) ( ON-TABLE ?auto_73807 ) ( ON ?auto_73806 ?auto_73807 ) ( ON ?auto_73805 ?auto_73806 ) ( CLEAR ?auto_73805 ) ( HOLDING ?auto_73804 ) ( CLEAR ?auto_73803 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73802 ?auto_73803 ?auto_73804 )
      ( MAKE-6PILE ?auto_73802 ?auto_73803 ?auto_73804 ?auto_73805 ?auto_73806 ?auto_73807 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73808 - BLOCK
      ?auto_73809 - BLOCK
      ?auto_73810 - BLOCK
      ?auto_73811 - BLOCK
      ?auto_73812 - BLOCK
      ?auto_73813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73808 ) ( ON ?auto_73809 ?auto_73808 ) ( not ( = ?auto_73808 ?auto_73809 ) ) ( not ( = ?auto_73808 ?auto_73810 ) ) ( not ( = ?auto_73808 ?auto_73811 ) ) ( not ( = ?auto_73808 ?auto_73812 ) ) ( not ( = ?auto_73808 ?auto_73813 ) ) ( not ( = ?auto_73809 ?auto_73810 ) ) ( not ( = ?auto_73809 ?auto_73811 ) ) ( not ( = ?auto_73809 ?auto_73812 ) ) ( not ( = ?auto_73809 ?auto_73813 ) ) ( not ( = ?auto_73810 ?auto_73811 ) ) ( not ( = ?auto_73810 ?auto_73812 ) ) ( not ( = ?auto_73810 ?auto_73813 ) ) ( not ( = ?auto_73811 ?auto_73812 ) ) ( not ( = ?auto_73811 ?auto_73813 ) ) ( not ( = ?auto_73812 ?auto_73813 ) ) ( ON-TABLE ?auto_73813 ) ( ON ?auto_73812 ?auto_73813 ) ( ON ?auto_73811 ?auto_73812 ) ( CLEAR ?auto_73809 ) ( ON ?auto_73810 ?auto_73811 ) ( CLEAR ?auto_73810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73813 ?auto_73812 ?auto_73811 )
      ( MAKE-6PILE ?auto_73808 ?auto_73809 ?auto_73810 ?auto_73811 ?auto_73812 ?auto_73813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73814 - BLOCK
      ?auto_73815 - BLOCK
      ?auto_73816 - BLOCK
      ?auto_73817 - BLOCK
      ?auto_73818 - BLOCK
      ?auto_73819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73814 ) ( not ( = ?auto_73814 ?auto_73815 ) ) ( not ( = ?auto_73814 ?auto_73816 ) ) ( not ( = ?auto_73814 ?auto_73817 ) ) ( not ( = ?auto_73814 ?auto_73818 ) ) ( not ( = ?auto_73814 ?auto_73819 ) ) ( not ( = ?auto_73815 ?auto_73816 ) ) ( not ( = ?auto_73815 ?auto_73817 ) ) ( not ( = ?auto_73815 ?auto_73818 ) ) ( not ( = ?auto_73815 ?auto_73819 ) ) ( not ( = ?auto_73816 ?auto_73817 ) ) ( not ( = ?auto_73816 ?auto_73818 ) ) ( not ( = ?auto_73816 ?auto_73819 ) ) ( not ( = ?auto_73817 ?auto_73818 ) ) ( not ( = ?auto_73817 ?auto_73819 ) ) ( not ( = ?auto_73818 ?auto_73819 ) ) ( ON-TABLE ?auto_73819 ) ( ON ?auto_73818 ?auto_73819 ) ( ON ?auto_73817 ?auto_73818 ) ( ON ?auto_73816 ?auto_73817 ) ( CLEAR ?auto_73816 ) ( HOLDING ?auto_73815 ) ( CLEAR ?auto_73814 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73814 ?auto_73815 )
      ( MAKE-6PILE ?auto_73814 ?auto_73815 ?auto_73816 ?auto_73817 ?auto_73818 ?auto_73819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73820 - BLOCK
      ?auto_73821 - BLOCK
      ?auto_73822 - BLOCK
      ?auto_73823 - BLOCK
      ?auto_73824 - BLOCK
      ?auto_73825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73820 ) ( not ( = ?auto_73820 ?auto_73821 ) ) ( not ( = ?auto_73820 ?auto_73822 ) ) ( not ( = ?auto_73820 ?auto_73823 ) ) ( not ( = ?auto_73820 ?auto_73824 ) ) ( not ( = ?auto_73820 ?auto_73825 ) ) ( not ( = ?auto_73821 ?auto_73822 ) ) ( not ( = ?auto_73821 ?auto_73823 ) ) ( not ( = ?auto_73821 ?auto_73824 ) ) ( not ( = ?auto_73821 ?auto_73825 ) ) ( not ( = ?auto_73822 ?auto_73823 ) ) ( not ( = ?auto_73822 ?auto_73824 ) ) ( not ( = ?auto_73822 ?auto_73825 ) ) ( not ( = ?auto_73823 ?auto_73824 ) ) ( not ( = ?auto_73823 ?auto_73825 ) ) ( not ( = ?auto_73824 ?auto_73825 ) ) ( ON-TABLE ?auto_73825 ) ( ON ?auto_73824 ?auto_73825 ) ( ON ?auto_73823 ?auto_73824 ) ( ON ?auto_73822 ?auto_73823 ) ( CLEAR ?auto_73820 ) ( ON ?auto_73821 ?auto_73822 ) ( CLEAR ?auto_73821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73825 ?auto_73824 ?auto_73823 ?auto_73822 )
      ( MAKE-6PILE ?auto_73820 ?auto_73821 ?auto_73822 ?auto_73823 ?auto_73824 ?auto_73825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73826 - BLOCK
      ?auto_73827 - BLOCK
      ?auto_73828 - BLOCK
      ?auto_73829 - BLOCK
      ?auto_73830 - BLOCK
      ?auto_73831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73826 ?auto_73827 ) ) ( not ( = ?auto_73826 ?auto_73828 ) ) ( not ( = ?auto_73826 ?auto_73829 ) ) ( not ( = ?auto_73826 ?auto_73830 ) ) ( not ( = ?auto_73826 ?auto_73831 ) ) ( not ( = ?auto_73827 ?auto_73828 ) ) ( not ( = ?auto_73827 ?auto_73829 ) ) ( not ( = ?auto_73827 ?auto_73830 ) ) ( not ( = ?auto_73827 ?auto_73831 ) ) ( not ( = ?auto_73828 ?auto_73829 ) ) ( not ( = ?auto_73828 ?auto_73830 ) ) ( not ( = ?auto_73828 ?auto_73831 ) ) ( not ( = ?auto_73829 ?auto_73830 ) ) ( not ( = ?auto_73829 ?auto_73831 ) ) ( not ( = ?auto_73830 ?auto_73831 ) ) ( ON-TABLE ?auto_73831 ) ( ON ?auto_73830 ?auto_73831 ) ( ON ?auto_73829 ?auto_73830 ) ( ON ?auto_73828 ?auto_73829 ) ( ON ?auto_73827 ?auto_73828 ) ( CLEAR ?auto_73827 ) ( HOLDING ?auto_73826 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73826 )
      ( MAKE-6PILE ?auto_73826 ?auto_73827 ?auto_73828 ?auto_73829 ?auto_73830 ?auto_73831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73832 - BLOCK
      ?auto_73833 - BLOCK
      ?auto_73834 - BLOCK
      ?auto_73835 - BLOCK
      ?auto_73836 - BLOCK
      ?auto_73837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73832 ?auto_73833 ) ) ( not ( = ?auto_73832 ?auto_73834 ) ) ( not ( = ?auto_73832 ?auto_73835 ) ) ( not ( = ?auto_73832 ?auto_73836 ) ) ( not ( = ?auto_73832 ?auto_73837 ) ) ( not ( = ?auto_73833 ?auto_73834 ) ) ( not ( = ?auto_73833 ?auto_73835 ) ) ( not ( = ?auto_73833 ?auto_73836 ) ) ( not ( = ?auto_73833 ?auto_73837 ) ) ( not ( = ?auto_73834 ?auto_73835 ) ) ( not ( = ?auto_73834 ?auto_73836 ) ) ( not ( = ?auto_73834 ?auto_73837 ) ) ( not ( = ?auto_73835 ?auto_73836 ) ) ( not ( = ?auto_73835 ?auto_73837 ) ) ( not ( = ?auto_73836 ?auto_73837 ) ) ( ON-TABLE ?auto_73837 ) ( ON ?auto_73836 ?auto_73837 ) ( ON ?auto_73835 ?auto_73836 ) ( ON ?auto_73834 ?auto_73835 ) ( ON ?auto_73833 ?auto_73834 ) ( ON ?auto_73832 ?auto_73833 ) ( CLEAR ?auto_73832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73837 ?auto_73836 ?auto_73835 ?auto_73834 ?auto_73833 )
      ( MAKE-6PILE ?auto_73832 ?auto_73833 ?auto_73834 ?auto_73835 ?auto_73836 ?auto_73837 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73838 - BLOCK
      ?auto_73839 - BLOCK
      ?auto_73840 - BLOCK
      ?auto_73841 - BLOCK
      ?auto_73842 - BLOCK
      ?auto_73843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73838 ?auto_73839 ) ) ( not ( = ?auto_73838 ?auto_73840 ) ) ( not ( = ?auto_73838 ?auto_73841 ) ) ( not ( = ?auto_73838 ?auto_73842 ) ) ( not ( = ?auto_73838 ?auto_73843 ) ) ( not ( = ?auto_73839 ?auto_73840 ) ) ( not ( = ?auto_73839 ?auto_73841 ) ) ( not ( = ?auto_73839 ?auto_73842 ) ) ( not ( = ?auto_73839 ?auto_73843 ) ) ( not ( = ?auto_73840 ?auto_73841 ) ) ( not ( = ?auto_73840 ?auto_73842 ) ) ( not ( = ?auto_73840 ?auto_73843 ) ) ( not ( = ?auto_73841 ?auto_73842 ) ) ( not ( = ?auto_73841 ?auto_73843 ) ) ( not ( = ?auto_73842 ?auto_73843 ) ) ( ON-TABLE ?auto_73843 ) ( ON ?auto_73842 ?auto_73843 ) ( ON ?auto_73841 ?auto_73842 ) ( ON ?auto_73840 ?auto_73841 ) ( ON ?auto_73839 ?auto_73840 ) ( HOLDING ?auto_73838 ) ( CLEAR ?auto_73839 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73843 ?auto_73842 ?auto_73841 ?auto_73840 ?auto_73839 ?auto_73838 )
      ( MAKE-6PILE ?auto_73838 ?auto_73839 ?auto_73840 ?auto_73841 ?auto_73842 ?auto_73843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73844 - BLOCK
      ?auto_73845 - BLOCK
      ?auto_73846 - BLOCK
      ?auto_73847 - BLOCK
      ?auto_73848 - BLOCK
      ?auto_73849 - BLOCK
    )
    :vars
    (
      ?auto_73850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73844 ?auto_73845 ) ) ( not ( = ?auto_73844 ?auto_73846 ) ) ( not ( = ?auto_73844 ?auto_73847 ) ) ( not ( = ?auto_73844 ?auto_73848 ) ) ( not ( = ?auto_73844 ?auto_73849 ) ) ( not ( = ?auto_73845 ?auto_73846 ) ) ( not ( = ?auto_73845 ?auto_73847 ) ) ( not ( = ?auto_73845 ?auto_73848 ) ) ( not ( = ?auto_73845 ?auto_73849 ) ) ( not ( = ?auto_73846 ?auto_73847 ) ) ( not ( = ?auto_73846 ?auto_73848 ) ) ( not ( = ?auto_73846 ?auto_73849 ) ) ( not ( = ?auto_73847 ?auto_73848 ) ) ( not ( = ?auto_73847 ?auto_73849 ) ) ( not ( = ?auto_73848 ?auto_73849 ) ) ( ON-TABLE ?auto_73849 ) ( ON ?auto_73848 ?auto_73849 ) ( ON ?auto_73847 ?auto_73848 ) ( ON ?auto_73846 ?auto_73847 ) ( ON ?auto_73845 ?auto_73846 ) ( CLEAR ?auto_73845 ) ( ON ?auto_73844 ?auto_73850 ) ( CLEAR ?auto_73844 ) ( HAND-EMPTY ) ( not ( = ?auto_73844 ?auto_73850 ) ) ( not ( = ?auto_73845 ?auto_73850 ) ) ( not ( = ?auto_73846 ?auto_73850 ) ) ( not ( = ?auto_73847 ?auto_73850 ) ) ( not ( = ?auto_73848 ?auto_73850 ) ) ( not ( = ?auto_73849 ?auto_73850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73844 ?auto_73850 )
      ( MAKE-6PILE ?auto_73844 ?auto_73845 ?auto_73846 ?auto_73847 ?auto_73848 ?auto_73849 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73851 - BLOCK
      ?auto_73852 - BLOCK
      ?auto_73853 - BLOCK
      ?auto_73854 - BLOCK
      ?auto_73855 - BLOCK
      ?auto_73856 - BLOCK
    )
    :vars
    (
      ?auto_73857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73851 ?auto_73852 ) ) ( not ( = ?auto_73851 ?auto_73853 ) ) ( not ( = ?auto_73851 ?auto_73854 ) ) ( not ( = ?auto_73851 ?auto_73855 ) ) ( not ( = ?auto_73851 ?auto_73856 ) ) ( not ( = ?auto_73852 ?auto_73853 ) ) ( not ( = ?auto_73852 ?auto_73854 ) ) ( not ( = ?auto_73852 ?auto_73855 ) ) ( not ( = ?auto_73852 ?auto_73856 ) ) ( not ( = ?auto_73853 ?auto_73854 ) ) ( not ( = ?auto_73853 ?auto_73855 ) ) ( not ( = ?auto_73853 ?auto_73856 ) ) ( not ( = ?auto_73854 ?auto_73855 ) ) ( not ( = ?auto_73854 ?auto_73856 ) ) ( not ( = ?auto_73855 ?auto_73856 ) ) ( ON-TABLE ?auto_73856 ) ( ON ?auto_73855 ?auto_73856 ) ( ON ?auto_73854 ?auto_73855 ) ( ON ?auto_73853 ?auto_73854 ) ( ON ?auto_73851 ?auto_73857 ) ( CLEAR ?auto_73851 ) ( not ( = ?auto_73851 ?auto_73857 ) ) ( not ( = ?auto_73852 ?auto_73857 ) ) ( not ( = ?auto_73853 ?auto_73857 ) ) ( not ( = ?auto_73854 ?auto_73857 ) ) ( not ( = ?auto_73855 ?auto_73857 ) ) ( not ( = ?auto_73856 ?auto_73857 ) ) ( HOLDING ?auto_73852 ) ( CLEAR ?auto_73853 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73856 ?auto_73855 ?auto_73854 ?auto_73853 ?auto_73852 )
      ( MAKE-6PILE ?auto_73851 ?auto_73852 ?auto_73853 ?auto_73854 ?auto_73855 ?auto_73856 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73858 - BLOCK
      ?auto_73859 - BLOCK
      ?auto_73860 - BLOCK
      ?auto_73861 - BLOCK
      ?auto_73862 - BLOCK
      ?auto_73863 - BLOCK
    )
    :vars
    (
      ?auto_73864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73858 ?auto_73859 ) ) ( not ( = ?auto_73858 ?auto_73860 ) ) ( not ( = ?auto_73858 ?auto_73861 ) ) ( not ( = ?auto_73858 ?auto_73862 ) ) ( not ( = ?auto_73858 ?auto_73863 ) ) ( not ( = ?auto_73859 ?auto_73860 ) ) ( not ( = ?auto_73859 ?auto_73861 ) ) ( not ( = ?auto_73859 ?auto_73862 ) ) ( not ( = ?auto_73859 ?auto_73863 ) ) ( not ( = ?auto_73860 ?auto_73861 ) ) ( not ( = ?auto_73860 ?auto_73862 ) ) ( not ( = ?auto_73860 ?auto_73863 ) ) ( not ( = ?auto_73861 ?auto_73862 ) ) ( not ( = ?auto_73861 ?auto_73863 ) ) ( not ( = ?auto_73862 ?auto_73863 ) ) ( ON-TABLE ?auto_73863 ) ( ON ?auto_73862 ?auto_73863 ) ( ON ?auto_73861 ?auto_73862 ) ( ON ?auto_73860 ?auto_73861 ) ( ON ?auto_73858 ?auto_73864 ) ( not ( = ?auto_73858 ?auto_73864 ) ) ( not ( = ?auto_73859 ?auto_73864 ) ) ( not ( = ?auto_73860 ?auto_73864 ) ) ( not ( = ?auto_73861 ?auto_73864 ) ) ( not ( = ?auto_73862 ?auto_73864 ) ) ( not ( = ?auto_73863 ?auto_73864 ) ) ( CLEAR ?auto_73860 ) ( ON ?auto_73859 ?auto_73858 ) ( CLEAR ?auto_73859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73864 ?auto_73858 )
      ( MAKE-6PILE ?auto_73858 ?auto_73859 ?auto_73860 ?auto_73861 ?auto_73862 ?auto_73863 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73865 - BLOCK
      ?auto_73866 - BLOCK
      ?auto_73867 - BLOCK
      ?auto_73868 - BLOCK
      ?auto_73869 - BLOCK
      ?auto_73870 - BLOCK
    )
    :vars
    (
      ?auto_73871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73865 ?auto_73866 ) ) ( not ( = ?auto_73865 ?auto_73867 ) ) ( not ( = ?auto_73865 ?auto_73868 ) ) ( not ( = ?auto_73865 ?auto_73869 ) ) ( not ( = ?auto_73865 ?auto_73870 ) ) ( not ( = ?auto_73866 ?auto_73867 ) ) ( not ( = ?auto_73866 ?auto_73868 ) ) ( not ( = ?auto_73866 ?auto_73869 ) ) ( not ( = ?auto_73866 ?auto_73870 ) ) ( not ( = ?auto_73867 ?auto_73868 ) ) ( not ( = ?auto_73867 ?auto_73869 ) ) ( not ( = ?auto_73867 ?auto_73870 ) ) ( not ( = ?auto_73868 ?auto_73869 ) ) ( not ( = ?auto_73868 ?auto_73870 ) ) ( not ( = ?auto_73869 ?auto_73870 ) ) ( ON-TABLE ?auto_73870 ) ( ON ?auto_73869 ?auto_73870 ) ( ON ?auto_73868 ?auto_73869 ) ( ON ?auto_73865 ?auto_73871 ) ( not ( = ?auto_73865 ?auto_73871 ) ) ( not ( = ?auto_73866 ?auto_73871 ) ) ( not ( = ?auto_73867 ?auto_73871 ) ) ( not ( = ?auto_73868 ?auto_73871 ) ) ( not ( = ?auto_73869 ?auto_73871 ) ) ( not ( = ?auto_73870 ?auto_73871 ) ) ( ON ?auto_73866 ?auto_73865 ) ( CLEAR ?auto_73866 ) ( ON-TABLE ?auto_73871 ) ( HOLDING ?auto_73867 ) ( CLEAR ?auto_73868 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73870 ?auto_73869 ?auto_73868 ?auto_73867 )
      ( MAKE-6PILE ?auto_73865 ?auto_73866 ?auto_73867 ?auto_73868 ?auto_73869 ?auto_73870 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73872 - BLOCK
      ?auto_73873 - BLOCK
      ?auto_73874 - BLOCK
      ?auto_73875 - BLOCK
      ?auto_73876 - BLOCK
      ?auto_73877 - BLOCK
    )
    :vars
    (
      ?auto_73878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73872 ?auto_73873 ) ) ( not ( = ?auto_73872 ?auto_73874 ) ) ( not ( = ?auto_73872 ?auto_73875 ) ) ( not ( = ?auto_73872 ?auto_73876 ) ) ( not ( = ?auto_73872 ?auto_73877 ) ) ( not ( = ?auto_73873 ?auto_73874 ) ) ( not ( = ?auto_73873 ?auto_73875 ) ) ( not ( = ?auto_73873 ?auto_73876 ) ) ( not ( = ?auto_73873 ?auto_73877 ) ) ( not ( = ?auto_73874 ?auto_73875 ) ) ( not ( = ?auto_73874 ?auto_73876 ) ) ( not ( = ?auto_73874 ?auto_73877 ) ) ( not ( = ?auto_73875 ?auto_73876 ) ) ( not ( = ?auto_73875 ?auto_73877 ) ) ( not ( = ?auto_73876 ?auto_73877 ) ) ( ON-TABLE ?auto_73877 ) ( ON ?auto_73876 ?auto_73877 ) ( ON ?auto_73875 ?auto_73876 ) ( ON ?auto_73872 ?auto_73878 ) ( not ( = ?auto_73872 ?auto_73878 ) ) ( not ( = ?auto_73873 ?auto_73878 ) ) ( not ( = ?auto_73874 ?auto_73878 ) ) ( not ( = ?auto_73875 ?auto_73878 ) ) ( not ( = ?auto_73876 ?auto_73878 ) ) ( not ( = ?auto_73877 ?auto_73878 ) ) ( ON ?auto_73873 ?auto_73872 ) ( ON-TABLE ?auto_73878 ) ( CLEAR ?auto_73875 ) ( ON ?auto_73874 ?auto_73873 ) ( CLEAR ?auto_73874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73878 ?auto_73872 ?auto_73873 )
      ( MAKE-6PILE ?auto_73872 ?auto_73873 ?auto_73874 ?auto_73875 ?auto_73876 ?auto_73877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73879 - BLOCK
      ?auto_73880 - BLOCK
      ?auto_73881 - BLOCK
      ?auto_73882 - BLOCK
      ?auto_73883 - BLOCK
      ?auto_73884 - BLOCK
    )
    :vars
    (
      ?auto_73885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73879 ?auto_73880 ) ) ( not ( = ?auto_73879 ?auto_73881 ) ) ( not ( = ?auto_73879 ?auto_73882 ) ) ( not ( = ?auto_73879 ?auto_73883 ) ) ( not ( = ?auto_73879 ?auto_73884 ) ) ( not ( = ?auto_73880 ?auto_73881 ) ) ( not ( = ?auto_73880 ?auto_73882 ) ) ( not ( = ?auto_73880 ?auto_73883 ) ) ( not ( = ?auto_73880 ?auto_73884 ) ) ( not ( = ?auto_73881 ?auto_73882 ) ) ( not ( = ?auto_73881 ?auto_73883 ) ) ( not ( = ?auto_73881 ?auto_73884 ) ) ( not ( = ?auto_73882 ?auto_73883 ) ) ( not ( = ?auto_73882 ?auto_73884 ) ) ( not ( = ?auto_73883 ?auto_73884 ) ) ( ON-TABLE ?auto_73884 ) ( ON ?auto_73883 ?auto_73884 ) ( ON ?auto_73879 ?auto_73885 ) ( not ( = ?auto_73879 ?auto_73885 ) ) ( not ( = ?auto_73880 ?auto_73885 ) ) ( not ( = ?auto_73881 ?auto_73885 ) ) ( not ( = ?auto_73882 ?auto_73885 ) ) ( not ( = ?auto_73883 ?auto_73885 ) ) ( not ( = ?auto_73884 ?auto_73885 ) ) ( ON ?auto_73880 ?auto_73879 ) ( ON-TABLE ?auto_73885 ) ( ON ?auto_73881 ?auto_73880 ) ( CLEAR ?auto_73881 ) ( HOLDING ?auto_73882 ) ( CLEAR ?auto_73883 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73884 ?auto_73883 ?auto_73882 )
      ( MAKE-6PILE ?auto_73879 ?auto_73880 ?auto_73881 ?auto_73882 ?auto_73883 ?auto_73884 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73886 - BLOCK
      ?auto_73887 - BLOCK
      ?auto_73888 - BLOCK
      ?auto_73889 - BLOCK
      ?auto_73890 - BLOCK
      ?auto_73891 - BLOCK
    )
    :vars
    (
      ?auto_73892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73886 ?auto_73887 ) ) ( not ( = ?auto_73886 ?auto_73888 ) ) ( not ( = ?auto_73886 ?auto_73889 ) ) ( not ( = ?auto_73886 ?auto_73890 ) ) ( not ( = ?auto_73886 ?auto_73891 ) ) ( not ( = ?auto_73887 ?auto_73888 ) ) ( not ( = ?auto_73887 ?auto_73889 ) ) ( not ( = ?auto_73887 ?auto_73890 ) ) ( not ( = ?auto_73887 ?auto_73891 ) ) ( not ( = ?auto_73888 ?auto_73889 ) ) ( not ( = ?auto_73888 ?auto_73890 ) ) ( not ( = ?auto_73888 ?auto_73891 ) ) ( not ( = ?auto_73889 ?auto_73890 ) ) ( not ( = ?auto_73889 ?auto_73891 ) ) ( not ( = ?auto_73890 ?auto_73891 ) ) ( ON-TABLE ?auto_73891 ) ( ON ?auto_73890 ?auto_73891 ) ( ON ?auto_73886 ?auto_73892 ) ( not ( = ?auto_73886 ?auto_73892 ) ) ( not ( = ?auto_73887 ?auto_73892 ) ) ( not ( = ?auto_73888 ?auto_73892 ) ) ( not ( = ?auto_73889 ?auto_73892 ) ) ( not ( = ?auto_73890 ?auto_73892 ) ) ( not ( = ?auto_73891 ?auto_73892 ) ) ( ON ?auto_73887 ?auto_73886 ) ( ON-TABLE ?auto_73892 ) ( ON ?auto_73888 ?auto_73887 ) ( CLEAR ?auto_73890 ) ( ON ?auto_73889 ?auto_73888 ) ( CLEAR ?auto_73889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73892 ?auto_73886 ?auto_73887 ?auto_73888 )
      ( MAKE-6PILE ?auto_73886 ?auto_73887 ?auto_73888 ?auto_73889 ?auto_73890 ?auto_73891 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73893 - BLOCK
      ?auto_73894 - BLOCK
      ?auto_73895 - BLOCK
      ?auto_73896 - BLOCK
      ?auto_73897 - BLOCK
      ?auto_73898 - BLOCK
    )
    :vars
    (
      ?auto_73899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73893 ?auto_73894 ) ) ( not ( = ?auto_73893 ?auto_73895 ) ) ( not ( = ?auto_73893 ?auto_73896 ) ) ( not ( = ?auto_73893 ?auto_73897 ) ) ( not ( = ?auto_73893 ?auto_73898 ) ) ( not ( = ?auto_73894 ?auto_73895 ) ) ( not ( = ?auto_73894 ?auto_73896 ) ) ( not ( = ?auto_73894 ?auto_73897 ) ) ( not ( = ?auto_73894 ?auto_73898 ) ) ( not ( = ?auto_73895 ?auto_73896 ) ) ( not ( = ?auto_73895 ?auto_73897 ) ) ( not ( = ?auto_73895 ?auto_73898 ) ) ( not ( = ?auto_73896 ?auto_73897 ) ) ( not ( = ?auto_73896 ?auto_73898 ) ) ( not ( = ?auto_73897 ?auto_73898 ) ) ( ON-TABLE ?auto_73898 ) ( ON ?auto_73893 ?auto_73899 ) ( not ( = ?auto_73893 ?auto_73899 ) ) ( not ( = ?auto_73894 ?auto_73899 ) ) ( not ( = ?auto_73895 ?auto_73899 ) ) ( not ( = ?auto_73896 ?auto_73899 ) ) ( not ( = ?auto_73897 ?auto_73899 ) ) ( not ( = ?auto_73898 ?auto_73899 ) ) ( ON ?auto_73894 ?auto_73893 ) ( ON-TABLE ?auto_73899 ) ( ON ?auto_73895 ?auto_73894 ) ( ON ?auto_73896 ?auto_73895 ) ( CLEAR ?auto_73896 ) ( HOLDING ?auto_73897 ) ( CLEAR ?auto_73898 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73898 ?auto_73897 )
      ( MAKE-6PILE ?auto_73893 ?auto_73894 ?auto_73895 ?auto_73896 ?auto_73897 ?auto_73898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73900 - BLOCK
      ?auto_73901 - BLOCK
      ?auto_73902 - BLOCK
      ?auto_73903 - BLOCK
      ?auto_73904 - BLOCK
      ?auto_73905 - BLOCK
    )
    :vars
    (
      ?auto_73906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73900 ?auto_73901 ) ) ( not ( = ?auto_73900 ?auto_73902 ) ) ( not ( = ?auto_73900 ?auto_73903 ) ) ( not ( = ?auto_73900 ?auto_73904 ) ) ( not ( = ?auto_73900 ?auto_73905 ) ) ( not ( = ?auto_73901 ?auto_73902 ) ) ( not ( = ?auto_73901 ?auto_73903 ) ) ( not ( = ?auto_73901 ?auto_73904 ) ) ( not ( = ?auto_73901 ?auto_73905 ) ) ( not ( = ?auto_73902 ?auto_73903 ) ) ( not ( = ?auto_73902 ?auto_73904 ) ) ( not ( = ?auto_73902 ?auto_73905 ) ) ( not ( = ?auto_73903 ?auto_73904 ) ) ( not ( = ?auto_73903 ?auto_73905 ) ) ( not ( = ?auto_73904 ?auto_73905 ) ) ( ON-TABLE ?auto_73905 ) ( ON ?auto_73900 ?auto_73906 ) ( not ( = ?auto_73900 ?auto_73906 ) ) ( not ( = ?auto_73901 ?auto_73906 ) ) ( not ( = ?auto_73902 ?auto_73906 ) ) ( not ( = ?auto_73903 ?auto_73906 ) ) ( not ( = ?auto_73904 ?auto_73906 ) ) ( not ( = ?auto_73905 ?auto_73906 ) ) ( ON ?auto_73901 ?auto_73900 ) ( ON-TABLE ?auto_73906 ) ( ON ?auto_73902 ?auto_73901 ) ( ON ?auto_73903 ?auto_73902 ) ( CLEAR ?auto_73905 ) ( ON ?auto_73904 ?auto_73903 ) ( CLEAR ?auto_73904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73906 ?auto_73900 ?auto_73901 ?auto_73902 ?auto_73903 )
      ( MAKE-6PILE ?auto_73900 ?auto_73901 ?auto_73902 ?auto_73903 ?auto_73904 ?auto_73905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73907 - BLOCK
      ?auto_73908 - BLOCK
      ?auto_73909 - BLOCK
      ?auto_73910 - BLOCK
      ?auto_73911 - BLOCK
      ?auto_73912 - BLOCK
    )
    :vars
    (
      ?auto_73913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73907 ?auto_73908 ) ) ( not ( = ?auto_73907 ?auto_73909 ) ) ( not ( = ?auto_73907 ?auto_73910 ) ) ( not ( = ?auto_73907 ?auto_73911 ) ) ( not ( = ?auto_73907 ?auto_73912 ) ) ( not ( = ?auto_73908 ?auto_73909 ) ) ( not ( = ?auto_73908 ?auto_73910 ) ) ( not ( = ?auto_73908 ?auto_73911 ) ) ( not ( = ?auto_73908 ?auto_73912 ) ) ( not ( = ?auto_73909 ?auto_73910 ) ) ( not ( = ?auto_73909 ?auto_73911 ) ) ( not ( = ?auto_73909 ?auto_73912 ) ) ( not ( = ?auto_73910 ?auto_73911 ) ) ( not ( = ?auto_73910 ?auto_73912 ) ) ( not ( = ?auto_73911 ?auto_73912 ) ) ( ON ?auto_73907 ?auto_73913 ) ( not ( = ?auto_73907 ?auto_73913 ) ) ( not ( = ?auto_73908 ?auto_73913 ) ) ( not ( = ?auto_73909 ?auto_73913 ) ) ( not ( = ?auto_73910 ?auto_73913 ) ) ( not ( = ?auto_73911 ?auto_73913 ) ) ( not ( = ?auto_73912 ?auto_73913 ) ) ( ON ?auto_73908 ?auto_73907 ) ( ON-TABLE ?auto_73913 ) ( ON ?auto_73909 ?auto_73908 ) ( ON ?auto_73910 ?auto_73909 ) ( ON ?auto_73911 ?auto_73910 ) ( CLEAR ?auto_73911 ) ( HOLDING ?auto_73912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73912 )
      ( MAKE-6PILE ?auto_73907 ?auto_73908 ?auto_73909 ?auto_73910 ?auto_73911 ?auto_73912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73914 - BLOCK
      ?auto_73915 - BLOCK
      ?auto_73916 - BLOCK
      ?auto_73917 - BLOCK
      ?auto_73918 - BLOCK
      ?auto_73919 - BLOCK
    )
    :vars
    (
      ?auto_73920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73914 ?auto_73915 ) ) ( not ( = ?auto_73914 ?auto_73916 ) ) ( not ( = ?auto_73914 ?auto_73917 ) ) ( not ( = ?auto_73914 ?auto_73918 ) ) ( not ( = ?auto_73914 ?auto_73919 ) ) ( not ( = ?auto_73915 ?auto_73916 ) ) ( not ( = ?auto_73915 ?auto_73917 ) ) ( not ( = ?auto_73915 ?auto_73918 ) ) ( not ( = ?auto_73915 ?auto_73919 ) ) ( not ( = ?auto_73916 ?auto_73917 ) ) ( not ( = ?auto_73916 ?auto_73918 ) ) ( not ( = ?auto_73916 ?auto_73919 ) ) ( not ( = ?auto_73917 ?auto_73918 ) ) ( not ( = ?auto_73917 ?auto_73919 ) ) ( not ( = ?auto_73918 ?auto_73919 ) ) ( ON ?auto_73914 ?auto_73920 ) ( not ( = ?auto_73914 ?auto_73920 ) ) ( not ( = ?auto_73915 ?auto_73920 ) ) ( not ( = ?auto_73916 ?auto_73920 ) ) ( not ( = ?auto_73917 ?auto_73920 ) ) ( not ( = ?auto_73918 ?auto_73920 ) ) ( not ( = ?auto_73919 ?auto_73920 ) ) ( ON ?auto_73915 ?auto_73914 ) ( ON-TABLE ?auto_73920 ) ( ON ?auto_73916 ?auto_73915 ) ( ON ?auto_73917 ?auto_73916 ) ( ON ?auto_73918 ?auto_73917 ) ( ON ?auto_73919 ?auto_73918 ) ( CLEAR ?auto_73919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73920 ?auto_73914 ?auto_73915 ?auto_73916 ?auto_73917 ?auto_73918 )
      ( MAKE-6PILE ?auto_73914 ?auto_73915 ?auto_73916 ?auto_73917 ?auto_73918 ?auto_73919 ) )
  )

)

