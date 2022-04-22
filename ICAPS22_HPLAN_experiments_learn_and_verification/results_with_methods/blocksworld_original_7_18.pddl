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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127119 - BLOCK
      ?auto_127120 - BLOCK
      ?auto_127121 - BLOCK
      ?auto_127122 - BLOCK
      ?auto_127123 - BLOCK
      ?auto_127124 - BLOCK
      ?auto_127125 - BLOCK
    )
    :vars
    (
      ?auto_127126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127126 ?auto_127125 ) ( CLEAR ?auto_127126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127119 ) ( ON ?auto_127120 ?auto_127119 ) ( ON ?auto_127121 ?auto_127120 ) ( ON ?auto_127122 ?auto_127121 ) ( ON ?auto_127123 ?auto_127122 ) ( ON ?auto_127124 ?auto_127123 ) ( ON ?auto_127125 ?auto_127124 ) ( not ( = ?auto_127119 ?auto_127120 ) ) ( not ( = ?auto_127119 ?auto_127121 ) ) ( not ( = ?auto_127119 ?auto_127122 ) ) ( not ( = ?auto_127119 ?auto_127123 ) ) ( not ( = ?auto_127119 ?auto_127124 ) ) ( not ( = ?auto_127119 ?auto_127125 ) ) ( not ( = ?auto_127119 ?auto_127126 ) ) ( not ( = ?auto_127120 ?auto_127121 ) ) ( not ( = ?auto_127120 ?auto_127122 ) ) ( not ( = ?auto_127120 ?auto_127123 ) ) ( not ( = ?auto_127120 ?auto_127124 ) ) ( not ( = ?auto_127120 ?auto_127125 ) ) ( not ( = ?auto_127120 ?auto_127126 ) ) ( not ( = ?auto_127121 ?auto_127122 ) ) ( not ( = ?auto_127121 ?auto_127123 ) ) ( not ( = ?auto_127121 ?auto_127124 ) ) ( not ( = ?auto_127121 ?auto_127125 ) ) ( not ( = ?auto_127121 ?auto_127126 ) ) ( not ( = ?auto_127122 ?auto_127123 ) ) ( not ( = ?auto_127122 ?auto_127124 ) ) ( not ( = ?auto_127122 ?auto_127125 ) ) ( not ( = ?auto_127122 ?auto_127126 ) ) ( not ( = ?auto_127123 ?auto_127124 ) ) ( not ( = ?auto_127123 ?auto_127125 ) ) ( not ( = ?auto_127123 ?auto_127126 ) ) ( not ( = ?auto_127124 ?auto_127125 ) ) ( not ( = ?auto_127124 ?auto_127126 ) ) ( not ( = ?auto_127125 ?auto_127126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127126 ?auto_127125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_127128 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_127128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127129 - BLOCK
    )
    :vars
    (
      ?auto_127130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127129 ?auto_127130 ) ( CLEAR ?auto_127129 ) ( HAND-EMPTY ) ( not ( = ?auto_127129 ?auto_127130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127129 ?auto_127130 )
      ( MAKE-1PILE ?auto_127129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127137 - BLOCK
      ?auto_127138 - BLOCK
      ?auto_127139 - BLOCK
      ?auto_127140 - BLOCK
      ?auto_127141 - BLOCK
      ?auto_127142 - BLOCK
    )
    :vars
    (
      ?auto_127143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127143 ?auto_127142 ) ( CLEAR ?auto_127143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127137 ) ( ON ?auto_127138 ?auto_127137 ) ( ON ?auto_127139 ?auto_127138 ) ( ON ?auto_127140 ?auto_127139 ) ( ON ?auto_127141 ?auto_127140 ) ( ON ?auto_127142 ?auto_127141 ) ( not ( = ?auto_127137 ?auto_127138 ) ) ( not ( = ?auto_127137 ?auto_127139 ) ) ( not ( = ?auto_127137 ?auto_127140 ) ) ( not ( = ?auto_127137 ?auto_127141 ) ) ( not ( = ?auto_127137 ?auto_127142 ) ) ( not ( = ?auto_127137 ?auto_127143 ) ) ( not ( = ?auto_127138 ?auto_127139 ) ) ( not ( = ?auto_127138 ?auto_127140 ) ) ( not ( = ?auto_127138 ?auto_127141 ) ) ( not ( = ?auto_127138 ?auto_127142 ) ) ( not ( = ?auto_127138 ?auto_127143 ) ) ( not ( = ?auto_127139 ?auto_127140 ) ) ( not ( = ?auto_127139 ?auto_127141 ) ) ( not ( = ?auto_127139 ?auto_127142 ) ) ( not ( = ?auto_127139 ?auto_127143 ) ) ( not ( = ?auto_127140 ?auto_127141 ) ) ( not ( = ?auto_127140 ?auto_127142 ) ) ( not ( = ?auto_127140 ?auto_127143 ) ) ( not ( = ?auto_127141 ?auto_127142 ) ) ( not ( = ?auto_127141 ?auto_127143 ) ) ( not ( = ?auto_127142 ?auto_127143 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127143 ?auto_127142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127144 - BLOCK
      ?auto_127145 - BLOCK
      ?auto_127146 - BLOCK
      ?auto_127147 - BLOCK
      ?auto_127148 - BLOCK
      ?auto_127149 - BLOCK
    )
    :vars
    (
      ?auto_127150 - BLOCK
      ?auto_127151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127150 ?auto_127149 ) ( CLEAR ?auto_127150 ) ( ON-TABLE ?auto_127144 ) ( ON ?auto_127145 ?auto_127144 ) ( ON ?auto_127146 ?auto_127145 ) ( ON ?auto_127147 ?auto_127146 ) ( ON ?auto_127148 ?auto_127147 ) ( ON ?auto_127149 ?auto_127148 ) ( not ( = ?auto_127144 ?auto_127145 ) ) ( not ( = ?auto_127144 ?auto_127146 ) ) ( not ( = ?auto_127144 ?auto_127147 ) ) ( not ( = ?auto_127144 ?auto_127148 ) ) ( not ( = ?auto_127144 ?auto_127149 ) ) ( not ( = ?auto_127144 ?auto_127150 ) ) ( not ( = ?auto_127145 ?auto_127146 ) ) ( not ( = ?auto_127145 ?auto_127147 ) ) ( not ( = ?auto_127145 ?auto_127148 ) ) ( not ( = ?auto_127145 ?auto_127149 ) ) ( not ( = ?auto_127145 ?auto_127150 ) ) ( not ( = ?auto_127146 ?auto_127147 ) ) ( not ( = ?auto_127146 ?auto_127148 ) ) ( not ( = ?auto_127146 ?auto_127149 ) ) ( not ( = ?auto_127146 ?auto_127150 ) ) ( not ( = ?auto_127147 ?auto_127148 ) ) ( not ( = ?auto_127147 ?auto_127149 ) ) ( not ( = ?auto_127147 ?auto_127150 ) ) ( not ( = ?auto_127148 ?auto_127149 ) ) ( not ( = ?auto_127148 ?auto_127150 ) ) ( not ( = ?auto_127149 ?auto_127150 ) ) ( HOLDING ?auto_127151 ) ( not ( = ?auto_127144 ?auto_127151 ) ) ( not ( = ?auto_127145 ?auto_127151 ) ) ( not ( = ?auto_127146 ?auto_127151 ) ) ( not ( = ?auto_127147 ?auto_127151 ) ) ( not ( = ?auto_127148 ?auto_127151 ) ) ( not ( = ?auto_127149 ?auto_127151 ) ) ( not ( = ?auto_127150 ?auto_127151 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_127151 )
      ( MAKE-6PILE ?auto_127144 ?auto_127145 ?auto_127146 ?auto_127147 ?auto_127148 ?auto_127149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127152 - BLOCK
      ?auto_127153 - BLOCK
      ?auto_127154 - BLOCK
      ?auto_127155 - BLOCK
      ?auto_127156 - BLOCK
      ?auto_127157 - BLOCK
    )
    :vars
    (
      ?auto_127158 - BLOCK
      ?auto_127159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127158 ?auto_127157 ) ( ON-TABLE ?auto_127152 ) ( ON ?auto_127153 ?auto_127152 ) ( ON ?auto_127154 ?auto_127153 ) ( ON ?auto_127155 ?auto_127154 ) ( ON ?auto_127156 ?auto_127155 ) ( ON ?auto_127157 ?auto_127156 ) ( not ( = ?auto_127152 ?auto_127153 ) ) ( not ( = ?auto_127152 ?auto_127154 ) ) ( not ( = ?auto_127152 ?auto_127155 ) ) ( not ( = ?auto_127152 ?auto_127156 ) ) ( not ( = ?auto_127152 ?auto_127157 ) ) ( not ( = ?auto_127152 ?auto_127158 ) ) ( not ( = ?auto_127153 ?auto_127154 ) ) ( not ( = ?auto_127153 ?auto_127155 ) ) ( not ( = ?auto_127153 ?auto_127156 ) ) ( not ( = ?auto_127153 ?auto_127157 ) ) ( not ( = ?auto_127153 ?auto_127158 ) ) ( not ( = ?auto_127154 ?auto_127155 ) ) ( not ( = ?auto_127154 ?auto_127156 ) ) ( not ( = ?auto_127154 ?auto_127157 ) ) ( not ( = ?auto_127154 ?auto_127158 ) ) ( not ( = ?auto_127155 ?auto_127156 ) ) ( not ( = ?auto_127155 ?auto_127157 ) ) ( not ( = ?auto_127155 ?auto_127158 ) ) ( not ( = ?auto_127156 ?auto_127157 ) ) ( not ( = ?auto_127156 ?auto_127158 ) ) ( not ( = ?auto_127157 ?auto_127158 ) ) ( not ( = ?auto_127152 ?auto_127159 ) ) ( not ( = ?auto_127153 ?auto_127159 ) ) ( not ( = ?auto_127154 ?auto_127159 ) ) ( not ( = ?auto_127155 ?auto_127159 ) ) ( not ( = ?auto_127156 ?auto_127159 ) ) ( not ( = ?auto_127157 ?auto_127159 ) ) ( not ( = ?auto_127158 ?auto_127159 ) ) ( ON ?auto_127159 ?auto_127158 ) ( CLEAR ?auto_127159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127152 ?auto_127153 ?auto_127154 ?auto_127155 ?auto_127156 ?auto_127157 ?auto_127158 )
      ( MAKE-6PILE ?auto_127152 ?auto_127153 ?auto_127154 ?auto_127155 ?auto_127156 ?auto_127157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127162 - BLOCK
      ?auto_127163 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_127163 ) ( CLEAR ?auto_127162 ) ( ON-TABLE ?auto_127162 ) ( not ( = ?auto_127162 ?auto_127163 ) ) )
    :subtasks
    ( ( !STACK ?auto_127163 ?auto_127162 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127164 - BLOCK
      ?auto_127165 - BLOCK
    )
    :vars
    (
      ?auto_127166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127164 ) ( ON-TABLE ?auto_127164 ) ( not ( = ?auto_127164 ?auto_127165 ) ) ( ON ?auto_127165 ?auto_127166 ) ( CLEAR ?auto_127165 ) ( HAND-EMPTY ) ( not ( = ?auto_127164 ?auto_127166 ) ) ( not ( = ?auto_127165 ?auto_127166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127165 ?auto_127166 )
      ( MAKE-2PILE ?auto_127164 ?auto_127165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127167 - BLOCK
      ?auto_127168 - BLOCK
    )
    :vars
    (
      ?auto_127169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127167 ?auto_127168 ) ) ( ON ?auto_127168 ?auto_127169 ) ( CLEAR ?auto_127168 ) ( not ( = ?auto_127167 ?auto_127169 ) ) ( not ( = ?auto_127168 ?auto_127169 ) ) ( HOLDING ?auto_127167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127167 )
      ( MAKE-2PILE ?auto_127167 ?auto_127168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127170 - BLOCK
      ?auto_127171 - BLOCK
    )
    :vars
    (
      ?auto_127172 - BLOCK
      ?auto_127173 - BLOCK
      ?auto_127174 - BLOCK
      ?auto_127175 - BLOCK
      ?auto_127176 - BLOCK
      ?auto_127177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127170 ?auto_127171 ) ) ( ON ?auto_127171 ?auto_127172 ) ( not ( = ?auto_127170 ?auto_127172 ) ) ( not ( = ?auto_127171 ?auto_127172 ) ) ( ON ?auto_127170 ?auto_127171 ) ( CLEAR ?auto_127170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127173 ) ( ON ?auto_127174 ?auto_127173 ) ( ON ?auto_127175 ?auto_127174 ) ( ON ?auto_127176 ?auto_127175 ) ( ON ?auto_127177 ?auto_127176 ) ( ON ?auto_127172 ?auto_127177 ) ( not ( = ?auto_127173 ?auto_127174 ) ) ( not ( = ?auto_127173 ?auto_127175 ) ) ( not ( = ?auto_127173 ?auto_127176 ) ) ( not ( = ?auto_127173 ?auto_127177 ) ) ( not ( = ?auto_127173 ?auto_127172 ) ) ( not ( = ?auto_127173 ?auto_127171 ) ) ( not ( = ?auto_127173 ?auto_127170 ) ) ( not ( = ?auto_127174 ?auto_127175 ) ) ( not ( = ?auto_127174 ?auto_127176 ) ) ( not ( = ?auto_127174 ?auto_127177 ) ) ( not ( = ?auto_127174 ?auto_127172 ) ) ( not ( = ?auto_127174 ?auto_127171 ) ) ( not ( = ?auto_127174 ?auto_127170 ) ) ( not ( = ?auto_127175 ?auto_127176 ) ) ( not ( = ?auto_127175 ?auto_127177 ) ) ( not ( = ?auto_127175 ?auto_127172 ) ) ( not ( = ?auto_127175 ?auto_127171 ) ) ( not ( = ?auto_127175 ?auto_127170 ) ) ( not ( = ?auto_127176 ?auto_127177 ) ) ( not ( = ?auto_127176 ?auto_127172 ) ) ( not ( = ?auto_127176 ?auto_127171 ) ) ( not ( = ?auto_127176 ?auto_127170 ) ) ( not ( = ?auto_127177 ?auto_127172 ) ) ( not ( = ?auto_127177 ?auto_127171 ) ) ( not ( = ?auto_127177 ?auto_127170 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127173 ?auto_127174 ?auto_127175 ?auto_127176 ?auto_127177 ?auto_127172 ?auto_127171 )
      ( MAKE-2PILE ?auto_127170 ?auto_127171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127183 - BLOCK
      ?auto_127184 - BLOCK
      ?auto_127185 - BLOCK
      ?auto_127186 - BLOCK
      ?auto_127187 - BLOCK
    )
    :vars
    (
      ?auto_127188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127188 ?auto_127187 ) ( CLEAR ?auto_127188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127183 ) ( ON ?auto_127184 ?auto_127183 ) ( ON ?auto_127185 ?auto_127184 ) ( ON ?auto_127186 ?auto_127185 ) ( ON ?auto_127187 ?auto_127186 ) ( not ( = ?auto_127183 ?auto_127184 ) ) ( not ( = ?auto_127183 ?auto_127185 ) ) ( not ( = ?auto_127183 ?auto_127186 ) ) ( not ( = ?auto_127183 ?auto_127187 ) ) ( not ( = ?auto_127183 ?auto_127188 ) ) ( not ( = ?auto_127184 ?auto_127185 ) ) ( not ( = ?auto_127184 ?auto_127186 ) ) ( not ( = ?auto_127184 ?auto_127187 ) ) ( not ( = ?auto_127184 ?auto_127188 ) ) ( not ( = ?auto_127185 ?auto_127186 ) ) ( not ( = ?auto_127185 ?auto_127187 ) ) ( not ( = ?auto_127185 ?auto_127188 ) ) ( not ( = ?auto_127186 ?auto_127187 ) ) ( not ( = ?auto_127186 ?auto_127188 ) ) ( not ( = ?auto_127187 ?auto_127188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127188 ?auto_127187 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127189 - BLOCK
      ?auto_127190 - BLOCK
      ?auto_127191 - BLOCK
      ?auto_127192 - BLOCK
      ?auto_127193 - BLOCK
    )
    :vars
    (
      ?auto_127194 - BLOCK
      ?auto_127195 - BLOCK
      ?auto_127196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127194 ?auto_127193 ) ( CLEAR ?auto_127194 ) ( ON-TABLE ?auto_127189 ) ( ON ?auto_127190 ?auto_127189 ) ( ON ?auto_127191 ?auto_127190 ) ( ON ?auto_127192 ?auto_127191 ) ( ON ?auto_127193 ?auto_127192 ) ( not ( = ?auto_127189 ?auto_127190 ) ) ( not ( = ?auto_127189 ?auto_127191 ) ) ( not ( = ?auto_127189 ?auto_127192 ) ) ( not ( = ?auto_127189 ?auto_127193 ) ) ( not ( = ?auto_127189 ?auto_127194 ) ) ( not ( = ?auto_127190 ?auto_127191 ) ) ( not ( = ?auto_127190 ?auto_127192 ) ) ( not ( = ?auto_127190 ?auto_127193 ) ) ( not ( = ?auto_127190 ?auto_127194 ) ) ( not ( = ?auto_127191 ?auto_127192 ) ) ( not ( = ?auto_127191 ?auto_127193 ) ) ( not ( = ?auto_127191 ?auto_127194 ) ) ( not ( = ?auto_127192 ?auto_127193 ) ) ( not ( = ?auto_127192 ?auto_127194 ) ) ( not ( = ?auto_127193 ?auto_127194 ) ) ( HOLDING ?auto_127195 ) ( CLEAR ?auto_127196 ) ( not ( = ?auto_127189 ?auto_127195 ) ) ( not ( = ?auto_127189 ?auto_127196 ) ) ( not ( = ?auto_127190 ?auto_127195 ) ) ( not ( = ?auto_127190 ?auto_127196 ) ) ( not ( = ?auto_127191 ?auto_127195 ) ) ( not ( = ?auto_127191 ?auto_127196 ) ) ( not ( = ?auto_127192 ?auto_127195 ) ) ( not ( = ?auto_127192 ?auto_127196 ) ) ( not ( = ?auto_127193 ?auto_127195 ) ) ( not ( = ?auto_127193 ?auto_127196 ) ) ( not ( = ?auto_127194 ?auto_127195 ) ) ( not ( = ?auto_127194 ?auto_127196 ) ) ( not ( = ?auto_127195 ?auto_127196 ) ) )
    :subtasks
    ( ( !STACK ?auto_127195 ?auto_127196 )
      ( MAKE-5PILE ?auto_127189 ?auto_127190 ?auto_127191 ?auto_127192 ?auto_127193 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127197 - BLOCK
      ?auto_127198 - BLOCK
      ?auto_127199 - BLOCK
      ?auto_127200 - BLOCK
      ?auto_127201 - BLOCK
    )
    :vars
    (
      ?auto_127203 - BLOCK
      ?auto_127204 - BLOCK
      ?auto_127202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127203 ?auto_127201 ) ( ON-TABLE ?auto_127197 ) ( ON ?auto_127198 ?auto_127197 ) ( ON ?auto_127199 ?auto_127198 ) ( ON ?auto_127200 ?auto_127199 ) ( ON ?auto_127201 ?auto_127200 ) ( not ( = ?auto_127197 ?auto_127198 ) ) ( not ( = ?auto_127197 ?auto_127199 ) ) ( not ( = ?auto_127197 ?auto_127200 ) ) ( not ( = ?auto_127197 ?auto_127201 ) ) ( not ( = ?auto_127197 ?auto_127203 ) ) ( not ( = ?auto_127198 ?auto_127199 ) ) ( not ( = ?auto_127198 ?auto_127200 ) ) ( not ( = ?auto_127198 ?auto_127201 ) ) ( not ( = ?auto_127198 ?auto_127203 ) ) ( not ( = ?auto_127199 ?auto_127200 ) ) ( not ( = ?auto_127199 ?auto_127201 ) ) ( not ( = ?auto_127199 ?auto_127203 ) ) ( not ( = ?auto_127200 ?auto_127201 ) ) ( not ( = ?auto_127200 ?auto_127203 ) ) ( not ( = ?auto_127201 ?auto_127203 ) ) ( CLEAR ?auto_127204 ) ( not ( = ?auto_127197 ?auto_127202 ) ) ( not ( = ?auto_127197 ?auto_127204 ) ) ( not ( = ?auto_127198 ?auto_127202 ) ) ( not ( = ?auto_127198 ?auto_127204 ) ) ( not ( = ?auto_127199 ?auto_127202 ) ) ( not ( = ?auto_127199 ?auto_127204 ) ) ( not ( = ?auto_127200 ?auto_127202 ) ) ( not ( = ?auto_127200 ?auto_127204 ) ) ( not ( = ?auto_127201 ?auto_127202 ) ) ( not ( = ?auto_127201 ?auto_127204 ) ) ( not ( = ?auto_127203 ?auto_127202 ) ) ( not ( = ?auto_127203 ?auto_127204 ) ) ( not ( = ?auto_127202 ?auto_127204 ) ) ( ON ?auto_127202 ?auto_127203 ) ( CLEAR ?auto_127202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127197 ?auto_127198 ?auto_127199 ?auto_127200 ?auto_127201 ?auto_127203 )
      ( MAKE-5PILE ?auto_127197 ?auto_127198 ?auto_127199 ?auto_127200 ?auto_127201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127205 - BLOCK
      ?auto_127206 - BLOCK
      ?auto_127207 - BLOCK
      ?auto_127208 - BLOCK
      ?auto_127209 - BLOCK
    )
    :vars
    (
      ?auto_127212 - BLOCK
      ?auto_127210 - BLOCK
      ?auto_127211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127212 ?auto_127209 ) ( ON-TABLE ?auto_127205 ) ( ON ?auto_127206 ?auto_127205 ) ( ON ?auto_127207 ?auto_127206 ) ( ON ?auto_127208 ?auto_127207 ) ( ON ?auto_127209 ?auto_127208 ) ( not ( = ?auto_127205 ?auto_127206 ) ) ( not ( = ?auto_127205 ?auto_127207 ) ) ( not ( = ?auto_127205 ?auto_127208 ) ) ( not ( = ?auto_127205 ?auto_127209 ) ) ( not ( = ?auto_127205 ?auto_127212 ) ) ( not ( = ?auto_127206 ?auto_127207 ) ) ( not ( = ?auto_127206 ?auto_127208 ) ) ( not ( = ?auto_127206 ?auto_127209 ) ) ( not ( = ?auto_127206 ?auto_127212 ) ) ( not ( = ?auto_127207 ?auto_127208 ) ) ( not ( = ?auto_127207 ?auto_127209 ) ) ( not ( = ?auto_127207 ?auto_127212 ) ) ( not ( = ?auto_127208 ?auto_127209 ) ) ( not ( = ?auto_127208 ?auto_127212 ) ) ( not ( = ?auto_127209 ?auto_127212 ) ) ( not ( = ?auto_127205 ?auto_127210 ) ) ( not ( = ?auto_127205 ?auto_127211 ) ) ( not ( = ?auto_127206 ?auto_127210 ) ) ( not ( = ?auto_127206 ?auto_127211 ) ) ( not ( = ?auto_127207 ?auto_127210 ) ) ( not ( = ?auto_127207 ?auto_127211 ) ) ( not ( = ?auto_127208 ?auto_127210 ) ) ( not ( = ?auto_127208 ?auto_127211 ) ) ( not ( = ?auto_127209 ?auto_127210 ) ) ( not ( = ?auto_127209 ?auto_127211 ) ) ( not ( = ?auto_127212 ?auto_127210 ) ) ( not ( = ?auto_127212 ?auto_127211 ) ) ( not ( = ?auto_127210 ?auto_127211 ) ) ( ON ?auto_127210 ?auto_127212 ) ( CLEAR ?auto_127210 ) ( HOLDING ?auto_127211 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127211 )
      ( MAKE-5PILE ?auto_127205 ?auto_127206 ?auto_127207 ?auto_127208 ?auto_127209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127213 - BLOCK
      ?auto_127214 - BLOCK
      ?auto_127215 - BLOCK
      ?auto_127216 - BLOCK
      ?auto_127217 - BLOCK
    )
    :vars
    (
      ?auto_127220 - BLOCK
      ?auto_127219 - BLOCK
      ?auto_127218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127220 ?auto_127217 ) ( ON-TABLE ?auto_127213 ) ( ON ?auto_127214 ?auto_127213 ) ( ON ?auto_127215 ?auto_127214 ) ( ON ?auto_127216 ?auto_127215 ) ( ON ?auto_127217 ?auto_127216 ) ( not ( = ?auto_127213 ?auto_127214 ) ) ( not ( = ?auto_127213 ?auto_127215 ) ) ( not ( = ?auto_127213 ?auto_127216 ) ) ( not ( = ?auto_127213 ?auto_127217 ) ) ( not ( = ?auto_127213 ?auto_127220 ) ) ( not ( = ?auto_127214 ?auto_127215 ) ) ( not ( = ?auto_127214 ?auto_127216 ) ) ( not ( = ?auto_127214 ?auto_127217 ) ) ( not ( = ?auto_127214 ?auto_127220 ) ) ( not ( = ?auto_127215 ?auto_127216 ) ) ( not ( = ?auto_127215 ?auto_127217 ) ) ( not ( = ?auto_127215 ?auto_127220 ) ) ( not ( = ?auto_127216 ?auto_127217 ) ) ( not ( = ?auto_127216 ?auto_127220 ) ) ( not ( = ?auto_127217 ?auto_127220 ) ) ( not ( = ?auto_127213 ?auto_127219 ) ) ( not ( = ?auto_127213 ?auto_127218 ) ) ( not ( = ?auto_127214 ?auto_127219 ) ) ( not ( = ?auto_127214 ?auto_127218 ) ) ( not ( = ?auto_127215 ?auto_127219 ) ) ( not ( = ?auto_127215 ?auto_127218 ) ) ( not ( = ?auto_127216 ?auto_127219 ) ) ( not ( = ?auto_127216 ?auto_127218 ) ) ( not ( = ?auto_127217 ?auto_127219 ) ) ( not ( = ?auto_127217 ?auto_127218 ) ) ( not ( = ?auto_127220 ?auto_127219 ) ) ( not ( = ?auto_127220 ?auto_127218 ) ) ( not ( = ?auto_127219 ?auto_127218 ) ) ( ON ?auto_127219 ?auto_127220 ) ( ON ?auto_127218 ?auto_127219 ) ( CLEAR ?auto_127218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127213 ?auto_127214 ?auto_127215 ?auto_127216 ?auto_127217 ?auto_127220 ?auto_127219 )
      ( MAKE-5PILE ?auto_127213 ?auto_127214 ?auto_127215 ?auto_127216 ?auto_127217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127224 - BLOCK
      ?auto_127225 - BLOCK
      ?auto_127226 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_127226 ) ( CLEAR ?auto_127225 ) ( ON-TABLE ?auto_127224 ) ( ON ?auto_127225 ?auto_127224 ) ( not ( = ?auto_127224 ?auto_127225 ) ) ( not ( = ?auto_127224 ?auto_127226 ) ) ( not ( = ?auto_127225 ?auto_127226 ) ) )
    :subtasks
    ( ( !STACK ?auto_127226 ?auto_127225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127227 - BLOCK
      ?auto_127228 - BLOCK
      ?auto_127229 - BLOCK
    )
    :vars
    (
      ?auto_127230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127228 ) ( ON-TABLE ?auto_127227 ) ( ON ?auto_127228 ?auto_127227 ) ( not ( = ?auto_127227 ?auto_127228 ) ) ( not ( = ?auto_127227 ?auto_127229 ) ) ( not ( = ?auto_127228 ?auto_127229 ) ) ( ON ?auto_127229 ?auto_127230 ) ( CLEAR ?auto_127229 ) ( HAND-EMPTY ) ( not ( = ?auto_127227 ?auto_127230 ) ) ( not ( = ?auto_127228 ?auto_127230 ) ) ( not ( = ?auto_127229 ?auto_127230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127229 ?auto_127230 )
      ( MAKE-3PILE ?auto_127227 ?auto_127228 ?auto_127229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127231 - BLOCK
      ?auto_127232 - BLOCK
      ?auto_127233 - BLOCK
    )
    :vars
    (
      ?auto_127234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127231 ) ( not ( = ?auto_127231 ?auto_127232 ) ) ( not ( = ?auto_127231 ?auto_127233 ) ) ( not ( = ?auto_127232 ?auto_127233 ) ) ( ON ?auto_127233 ?auto_127234 ) ( CLEAR ?auto_127233 ) ( not ( = ?auto_127231 ?auto_127234 ) ) ( not ( = ?auto_127232 ?auto_127234 ) ) ( not ( = ?auto_127233 ?auto_127234 ) ) ( HOLDING ?auto_127232 ) ( CLEAR ?auto_127231 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127231 ?auto_127232 )
      ( MAKE-3PILE ?auto_127231 ?auto_127232 ?auto_127233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127235 - BLOCK
      ?auto_127236 - BLOCK
      ?auto_127237 - BLOCK
    )
    :vars
    (
      ?auto_127238 - BLOCK
      ?auto_127242 - BLOCK
      ?auto_127240 - BLOCK
      ?auto_127239 - BLOCK
      ?auto_127241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127235 ) ( not ( = ?auto_127235 ?auto_127236 ) ) ( not ( = ?auto_127235 ?auto_127237 ) ) ( not ( = ?auto_127236 ?auto_127237 ) ) ( ON ?auto_127237 ?auto_127238 ) ( not ( = ?auto_127235 ?auto_127238 ) ) ( not ( = ?auto_127236 ?auto_127238 ) ) ( not ( = ?auto_127237 ?auto_127238 ) ) ( CLEAR ?auto_127235 ) ( ON ?auto_127236 ?auto_127237 ) ( CLEAR ?auto_127236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127242 ) ( ON ?auto_127240 ?auto_127242 ) ( ON ?auto_127239 ?auto_127240 ) ( ON ?auto_127241 ?auto_127239 ) ( ON ?auto_127238 ?auto_127241 ) ( not ( = ?auto_127242 ?auto_127240 ) ) ( not ( = ?auto_127242 ?auto_127239 ) ) ( not ( = ?auto_127242 ?auto_127241 ) ) ( not ( = ?auto_127242 ?auto_127238 ) ) ( not ( = ?auto_127242 ?auto_127237 ) ) ( not ( = ?auto_127242 ?auto_127236 ) ) ( not ( = ?auto_127240 ?auto_127239 ) ) ( not ( = ?auto_127240 ?auto_127241 ) ) ( not ( = ?auto_127240 ?auto_127238 ) ) ( not ( = ?auto_127240 ?auto_127237 ) ) ( not ( = ?auto_127240 ?auto_127236 ) ) ( not ( = ?auto_127239 ?auto_127241 ) ) ( not ( = ?auto_127239 ?auto_127238 ) ) ( not ( = ?auto_127239 ?auto_127237 ) ) ( not ( = ?auto_127239 ?auto_127236 ) ) ( not ( = ?auto_127241 ?auto_127238 ) ) ( not ( = ?auto_127241 ?auto_127237 ) ) ( not ( = ?auto_127241 ?auto_127236 ) ) ( not ( = ?auto_127235 ?auto_127242 ) ) ( not ( = ?auto_127235 ?auto_127240 ) ) ( not ( = ?auto_127235 ?auto_127239 ) ) ( not ( = ?auto_127235 ?auto_127241 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127242 ?auto_127240 ?auto_127239 ?auto_127241 ?auto_127238 ?auto_127237 )
      ( MAKE-3PILE ?auto_127235 ?auto_127236 ?auto_127237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127243 - BLOCK
      ?auto_127244 - BLOCK
      ?auto_127245 - BLOCK
    )
    :vars
    (
      ?auto_127250 - BLOCK
      ?auto_127248 - BLOCK
      ?auto_127246 - BLOCK
      ?auto_127247 - BLOCK
      ?auto_127249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127243 ?auto_127244 ) ) ( not ( = ?auto_127243 ?auto_127245 ) ) ( not ( = ?auto_127244 ?auto_127245 ) ) ( ON ?auto_127245 ?auto_127250 ) ( not ( = ?auto_127243 ?auto_127250 ) ) ( not ( = ?auto_127244 ?auto_127250 ) ) ( not ( = ?auto_127245 ?auto_127250 ) ) ( ON ?auto_127244 ?auto_127245 ) ( CLEAR ?auto_127244 ) ( ON-TABLE ?auto_127248 ) ( ON ?auto_127246 ?auto_127248 ) ( ON ?auto_127247 ?auto_127246 ) ( ON ?auto_127249 ?auto_127247 ) ( ON ?auto_127250 ?auto_127249 ) ( not ( = ?auto_127248 ?auto_127246 ) ) ( not ( = ?auto_127248 ?auto_127247 ) ) ( not ( = ?auto_127248 ?auto_127249 ) ) ( not ( = ?auto_127248 ?auto_127250 ) ) ( not ( = ?auto_127248 ?auto_127245 ) ) ( not ( = ?auto_127248 ?auto_127244 ) ) ( not ( = ?auto_127246 ?auto_127247 ) ) ( not ( = ?auto_127246 ?auto_127249 ) ) ( not ( = ?auto_127246 ?auto_127250 ) ) ( not ( = ?auto_127246 ?auto_127245 ) ) ( not ( = ?auto_127246 ?auto_127244 ) ) ( not ( = ?auto_127247 ?auto_127249 ) ) ( not ( = ?auto_127247 ?auto_127250 ) ) ( not ( = ?auto_127247 ?auto_127245 ) ) ( not ( = ?auto_127247 ?auto_127244 ) ) ( not ( = ?auto_127249 ?auto_127250 ) ) ( not ( = ?auto_127249 ?auto_127245 ) ) ( not ( = ?auto_127249 ?auto_127244 ) ) ( not ( = ?auto_127243 ?auto_127248 ) ) ( not ( = ?auto_127243 ?auto_127246 ) ) ( not ( = ?auto_127243 ?auto_127247 ) ) ( not ( = ?auto_127243 ?auto_127249 ) ) ( HOLDING ?auto_127243 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127243 )
      ( MAKE-3PILE ?auto_127243 ?auto_127244 ?auto_127245 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127251 - BLOCK
      ?auto_127252 - BLOCK
      ?auto_127253 - BLOCK
    )
    :vars
    (
      ?auto_127254 - BLOCK
      ?auto_127257 - BLOCK
      ?auto_127256 - BLOCK
      ?auto_127258 - BLOCK
      ?auto_127255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127251 ?auto_127252 ) ) ( not ( = ?auto_127251 ?auto_127253 ) ) ( not ( = ?auto_127252 ?auto_127253 ) ) ( ON ?auto_127253 ?auto_127254 ) ( not ( = ?auto_127251 ?auto_127254 ) ) ( not ( = ?auto_127252 ?auto_127254 ) ) ( not ( = ?auto_127253 ?auto_127254 ) ) ( ON ?auto_127252 ?auto_127253 ) ( ON-TABLE ?auto_127257 ) ( ON ?auto_127256 ?auto_127257 ) ( ON ?auto_127258 ?auto_127256 ) ( ON ?auto_127255 ?auto_127258 ) ( ON ?auto_127254 ?auto_127255 ) ( not ( = ?auto_127257 ?auto_127256 ) ) ( not ( = ?auto_127257 ?auto_127258 ) ) ( not ( = ?auto_127257 ?auto_127255 ) ) ( not ( = ?auto_127257 ?auto_127254 ) ) ( not ( = ?auto_127257 ?auto_127253 ) ) ( not ( = ?auto_127257 ?auto_127252 ) ) ( not ( = ?auto_127256 ?auto_127258 ) ) ( not ( = ?auto_127256 ?auto_127255 ) ) ( not ( = ?auto_127256 ?auto_127254 ) ) ( not ( = ?auto_127256 ?auto_127253 ) ) ( not ( = ?auto_127256 ?auto_127252 ) ) ( not ( = ?auto_127258 ?auto_127255 ) ) ( not ( = ?auto_127258 ?auto_127254 ) ) ( not ( = ?auto_127258 ?auto_127253 ) ) ( not ( = ?auto_127258 ?auto_127252 ) ) ( not ( = ?auto_127255 ?auto_127254 ) ) ( not ( = ?auto_127255 ?auto_127253 ) ) ( not ( = ?auto_127255 ?auto_127252 ) ) ( not ( = ?auto_127251 ?auto_127257 ) ) ( not ( = ?auto_127251 ?auto_127256 ) ) ( not ( = ?auto_127251 ?auto_127258 ) ) ( not ( = ?auto_127251 ?auto_127255 ) ) ( ON ?auto_127251 ?auto_127252 ) ( CLEAR ?auto_127251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127257 ?auto_127256 ?auto_127258 ?auto_127255 ?auto_127254 ?auto_127253 ?auto_127252 )
      ( MAKE-3PILE ?auto_127251 ?auto_127252 ?auto_127253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127263 - BLOCK
      ?auto_127264 - BLOCK
      ?auto_127265 - BLOCK
      ?auto_127266 - BLOCK
    )
    :vars
    (
      ?auto_127267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127267 ?auto_127266 ) ( CLEAR ?auto_127267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127263 ) ( ON ?auto_127264 ?auto_127263 ) ( ON ?auto_127265 ?auto_127264 ) ( ON ?auto_127266 ?auto_127265 ) ( not ( = ?auto_127263 ?auto_127264 ) ) ( not ( = ?auto_127263 ?auto_127265 ) ) ( not ( = ?auto_127263 ?auto_127266 ) ) ( not ( = ?auto_127263 ?auto_127267 ) ) ( not ( = ?auto_127264 ?auto_127265 ) ) ( not ( = ?auto_127264 ?auto_127266 ) ) ( not ( = ?auto_127264 ?auto_127267 ) ) ( not ( = ?auto_127265 ?auto_127266 ) ) ( not ( = ?auto_127265 ?auto_127267 ) ) ( not ( = ?auto_127266 ?auto_127267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127267 ?auto_127266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127268 - BLOCK
      ?auto_127269 - BLOCK
      ?auto_127270 - BLOCK
      ?auto_127271 - BLOCK
    )
    :vars
    (
      ?auto_127272 - BLOCK
      ?auto_127273 - BLOCK
      ?auto_127274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127272 ?auto_127271 ) ( CLEAR ?auto_127272 ) ( ON-TABLE ?auto_127268 ) ( ON ?auto_127269 ?auto_127268 ) ( ON ?auto_127270 ?auto_127269 ) ( ON ?auto_127271 ?auto_127270 ) ( not ( = ?auto_127268 ?auto_127269 ) ) ( not ( = ?auto_127268 ?auto_127270 ) ) ( not ( = ?auto_127268 ?auto_127271 ) ) ( not ( = ?auto_127268 ?auto_127272 ) ) ( not ( = ?auto_127269 ?auto_127270 ) ) ( not ( = ?auto_127269 ?auto_127271 ) ) ( not ( = ?auto_127269 ?auto_127272 ) ) ( not ( = ?auto_127270 ?auto_127271 ) ) ( not ( = ?auto_127270 ?auto_127272 ) ) ( not ( = ?auto_127271 ?auto_127272 ) ) ( HOLDING ?auto_127273 ) ( CLEAR ?auto_127274 ) ( not ( = ?auto_127268 ?auto_127273 ) ) ( not ( = ?auto_127268 ?auto_127274 ) ) ( not ( = ?auto_127269 ?auto_127273 ) ) ( not ( = ?auto_127269 ?auto_127274 ) ) ( not ( = ?auto_127270 ?auto_127273 ) ) ( not ( = ?auto_127270 ?auto_127274 ) ) ( not ( = ?auto_127271 ?auto_127273 ) ) ( not ( = ?auto_127271 ?auto_127274 ) ) ( not ( = ?auto_127272 ?auto_127273 ) ) ( not ( = ?auto_127272 ?auto_127274 ) ) ( not ( = ?auto_127273 ?auto_127274 ) ) )
    :subtasks
    ( ( !STACK ?auto_127273 ?auto_127274 )
      ( MAKE-4PILE ?auto_127268 ?auto_127269 ?auto_127270 ?auto_127271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127275 - BLOCK
      ?auto_127276 - BLOCK
      ?auto_127277 - BLOCK
      ?auto_127278 - BLOCK
    )
    :vars
    (
      ?auto_127281 - BLOCK
      ?auto_127279 - BLOCK
      ?auto_127280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127281 ?auto_127278 ) ( ON-TABLE ?auto_127275 ) ( ON ?auto_127276 ?auto_127275 ) ( ON ?auto_127277 ?auto_127276 ) ( ON ?auto_127278 ?auto_127277 ) ( not ( = ?auto_127275 ?auto_127276 ) ) ( not ( = ?auto_127275 ?auto_127277 ) ) ( not ( = ?auto_127275 ?auto_127278 ) ) ( not ( = ?auto_127275 ?auto_127281 ) ) ( not ( = ?auto_127276 ?auto_127277 ) ) ( not ( = ?auto_127276 ?auto_127278 ) ) ( not ( = ?auto_127276 ?auto_127281 ) ) ( not ( = ?auto_127277 ?auto_127278 ) ) ( not ( = ?auto_127277 ?auto_127281 ) ) ( not ( = ?auto_127278 ?auto_127281 ) ) ( CLEAR ?auto_127279 ) ( not ( = ?auto_127275 ?auto_127280 ) ) ( not ( = ?auto_127275 ?auto_127279 ) ) ( not ( = ?auto_127276 ?auto_127280 ) ) ( not ( = ?auto_127276 ?auto_127279 ) ) ( not ( = ?auto_127277 ?auto_127280 ) ) ( not ( = ?auto_127277 ?auto_127279 ) ) ( not ( = ?auto_127278 ?auto_127280 ) ) ( not ( = ?auto_127278 ?auto_127279 ) ) ( not ( = ?auto_127281 ?auto_127280 ) ) ( not ( = ?auto_127281 ?auto_127279 ) ) ( not ( = ?auto_127280 ?auto_127279 ) ) ( ON ?auto_127280 ?auto_127281 ) ( CLEAR ?auto_127280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127275 ?auto_127276 ?auto_127277 ?auto_127278 ?auto_127281 )
      ( MAKE-4PILE ?auto_127275 ?auto_127276 ?auto_127277 ?auto_127278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127282 - BLOCK
      ?auto_127283 - BLOCK
      ?auto_127284 - BLOCK
      ?auto_127285 - BLOCK
    )
    :vars
    (
      ?auto_127287 - BLOCK
      ?auto_127288 - BLOCK
      ?auto_127286 - BLOCK
      ?auto_127289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127287 ?auto_127285 ) ( ON-TABLE ?auto_127282 ) ( ON ?auto_127283 ?auto_127282 ) ( ON ?auto_127284 ?auto_127283 ) ( ON ?auto_127285 ?auto_127284 ) ( not ( = ?auto_127282 ?auto_127283 ) ) ( not ( = ?auto_127282 ?auto_127284 ) ) ( not ( = ?auto_127282 ?auto_127285 ) ) ( not ( = ?auto_127282 ?auto_127287 ) ) ( not ( = ?auto_127283 ?auto_127284 ) ) ( not ( = ?auto_127283 ?auto_127285 ) ) ( not ( = ?auto_127283 ?auto_127287 ) ) ( not ( = ?auto_127284 ?auto_127285 ) ) ( not ( = ?auto_127284 ?auto_127287 ) ) ( not ( = ?auto_127285 ?auto_127287 ) ) ( not ( = ?auto_127282 ?auto_127288 ) ) ( not ( = ?auto_127282 ?auto_127286 ) ) ( not ( = ?auto_127283 ?auto_127288 ) ) ( not ( = ?auto_127283 ?auto_127286 ) ) ( not ( = ?auto_127284 ?auto_127288 ) ) ( not ( = ?auto_127284 ?auto_127286 ) ) ( not ( = ?auto_127285 ?auto_127288 ) ) ( not ( = ?auto_127285 ?auto_127286 ) ) ( not ( = ?auto_127287 ?auto_127288 ) ) ( not ( = ?auto_127287 ?auto_127286 ) ) ( not ( = ?auto_127288 ?auto_127286 ) ) ( ON ?auto_127288 ?auto_127287 ) ( CLEAR ?auto_127288 ) ( HOLDING ?auto_127286 ) ( CLEAR ?auto_127289 ) ( ON-TABLE ?auto_127289 ) ( not ( = ?auto_127289 ?auto_127286 ) ) ( not ( = ?auto_127282 ?auto_127289 ) ) ( not ( = ?auto_127283 ?auto_127289 ) ) ( not ( = ?auto_127284 ?auto_127289 ) ) ( not ( = ?auto_127285 ?auto_127289 ) ) ( not ( = ?auto_127287 ?auto_127289 ) ) ( not ( = ?auto_127288 ?auto_127289 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127289 ?auto_127286 )
      ( MAKE-4PILE ?auto_127282 ?auto_127283 ?auto_127284 ?auto_127285 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127290 - BLOCK
      ?auto_127291 - BLOCK
      ?auto_127292 - BLOCK
      ?auto_127293 - BLOCK
    )
    :vars
    (
      ?auto_127294 - BLOCK
      ?auto_127295 - BLOCK
      ?auto_127296 - BLOCK
      ?auto_127297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127294 ?auto_127293 ) ( ON-TABLE ?auto_127290 ) ( ON ?auto_127291 ?auto_127290 ) ( ON ?auto_127292 ?auto_127291 ) ( ON ?auto_127293 ?auto_127292 ) ( not ( = ?auto_127290 ?auto_127291 ) ) ( not ( = ?auto_127290 ?auto_127292 ) ) ( not ( = ?auto_127290 ?auto_127293 ) ) ( not ( = ?auto_127290 ?auto_127294 ) ) ( not ( = ?auto_127291 ?auto_127292 ) ) ( not ( = ?auto_127291 ?auto_127293 ) ) ( not ( = ?auto_127291 ?auto_127294 ) ) ( not ( = ?auto_127292 ?auto_127293 ) ) ( not ( = ?auto_127292 ?auto_127294 ) ) ( not ( = ?auto_127293 ?auto_127294 ) ) ( not ( = ?auto_127290 ?auto_127295 ) ) ( not ( = ?auto_127290 ?auto_127296 ) ) ( not ( = ?auto_127291 ?auto_127295 ) ) ( not ( = ?auto_127291 ?auto_127296 ) ) ( not ( = ?auto_127292 ?auto_127295 ) ) ( not ( = ?auto_127292 ?auto_127296 ) ) ( not ( = ?auto_127293 ?auto_127295 ) ) ( not ( = ?auto_127293 ?auto_127296 ) ) ( not ( = ?auto_127294 ?auto_127295 ) ) ( not ( = ?auto_127294 ?auto_127296 ) ) ( not ( = ?auto_127295 ?auto_127296 ) ) ( ON ?auto_127295 ?auto_127294 ) ( CLEAR ?auto_127297 ) ( ON-TABLE ?auto_127297 ) ( not ( = ?auto_127297 ?auto_127296 ) ) ( not ( = ?auto_127290 ?auto_127297 ) ) ( not ( = ?auto_127291 ?auto_127297 ) ) ( not ( = ?auto_127292 ?auto_127297 ) ) ( not ( = ?auto_127293 ?auto_127297 ) ) ( not ( = ?auto_127294 ?auto_127297 ) ) ( not ( = ?auto_127295 ?auto_127297 ) ) ( ON ?auto_127296 ?auto_127295 ) ( CLEAR ?auto_127296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127290 ?auto_127291 ?auto_127292 ?auto_127293 ?auto_127294 ?auto_127295 )
      ( MAKE-4PILE ?auto_127290 ?auto_127291 ?auto_127292 ?auto_127293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127298 - BLOCK
      ?auto_127299 - BLOCK
      ?auto_127300 - BLOCK
      ?auto_127301 - BLOCK
    )
    :vars
    (
      ?auto_127304 - BLOCK
      ?auto_127303 - BLOCK
      ?auto_127302 - BLOCK
      ?auto_127305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127304 ?auto_127301 ) ( ON-TABLE ?auto_127298 ) ( ON ?auto_127299 ?auto_127298 ) ( ON ?auto_127300 ?auto_127299 ) ( ON ?auto_127301 ?auto_127300 ) ( not ( = ?auto_127298 ?auto_127299 ) ) ( not ( = ?auto_127298 ?auto_127300 ) ) ( not ( = ?auto_127298 ?auto_127301 ) ) ( not ( = ?auto_127298 ?auto_127304 ) ) ( not ( = ?auto_127299 ?auto_127300 ) ) ( not ( = ?auto_127299 ?auto_127301 ) ) ( not ( = ?auto_127299 ?auto_127304 ) ) ( not ( = ?auto_127300 ?auto_127301 ) ) ( not ( = ?auto_127300 ?auto_127304 ) ) ( not ( = ?auto_127301 ?auto_127304 ) ) ( not ( = ?auto_127298 ?auto_127303 ) ) ( not ( = ?auto_127298 ?auto_127302 ) ) ( not ( = ?auto_127299 ?auto_127303 ) ) ( not ( = ?auto_127299 ?auto_127302 ) ) ( not ( = ?auto_127300 ?auto_127303 ) ) ( not ( = ?auto_127300 ?auto_127302 ) ) ( not ( = ?auto_127301 ?auto_127303 ) ) ( not ( = ?auto_127301 ?auto_127302 ) ) ( not ( = ?auto_127304 ?auto_127303 ) ) ( not ( = ?auto_127304 ?auto_127302 ) ) ( not ( = ?auto_127303 ?auto_127302 ) ) ( ON ?auto_127303 ?auto_127304 ) ( not ( = ?auto_127305 ?auto_127302 ) ) ( not ( = ?auto_127298 ?auto_127305 ) ) ( not ( = ?auto_127299 ?auto_127305 ) ) ( not ( = ?auto_127300 ?auto_127305 ) ) ( not ( = ?auto_127301 ?auto_127305 ) ) ( not ( = ?auto_127304 ?auto_127305 ) ) ( not ( = ?auto_127303 ?auto_127305 ) ) ( ON ?auto_127302 ?auto_127303 ) ( CLEAR ?auto_127302 ) ( HOLDING ?auto_127305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127305 )
      ( MAKE-4PILE ?auto_127298 ?auto_127299 ?auto_127300 ?auto_127301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127306 - BLOCK
      ?auto_127307 - BLOCK
      ?auto_127308 - BLOCK
      ?auto_127309 - BLOCK
    )
    :vars
    (
      ?auto_127311 - BLOCK
      ?auto_127312 - BLOCK
      ?auto_127310 - BLOCK
      ?auto_127313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127311 ?auto_127309 ) ( ON-TABLE ?auto_127306 ) ( ON ?auto_127307 ?auto_127306 ) ( ON ?auto_127308 ?auto_127307 ) ( ON ?auto_127309 ?auto_127308 ) ( not ( = ?auto_127306 ?auto_127307 ) ) ( not ( = ?auto_127306 ?auto_127308 ) ) ( not ( = ?auto_127306 ?auto_127309 ) ) ( not ( = ?auto_127306 ?auto_127311 ) ) ( not ( = ?auto_127307 ?auto_127308 ) ) ( not ( = ?auto_127307 ?auto_127309 ) ) ( not ( = ?auto_127307 ?auto_127311 ) ) ( not ( = ?auto_127308 ?auto_127309 ) ) ( not ( = ?auto_127308 ?auto_127311 ) ) ( not ( = ?auto_127309 ?auto_127311 ) ) ( not ( = ?auto_127306 ?auto_127312 ) ) ( not ( = ?auto_127306 ?auto_127310 ) ) ( not ( = ?auto_127307 ?auto_127312 ) ) ( not ( = ?auto_127307 ?auto_127310 ) ) ( not ( = ?auto_127308 ?auto_127312 ) ) ( not ( = ?auto_127308 ?auto_127310 ) ) ( not ( = ?auto_127309 ?auto_127312 ) ) ( not ( = ?auto_127309 ?auto_127310 ) ) ( not ( = ?auto_127311 ?auto_127312 ) ) ( not ( = ?auto_127311 ?auto_127310 ) ) ( not ( = ?auto_127312 ?auto_127310 ) ) ( ON ?auto_127312 ?auto_127311 ) ( not ( = ?auto_127313 ?auto_127310 ) ) ( not ( = ?auto_127306 ?auto_127313 ) ) ( not ( = ?auto_127307 ?auto_127313 ) ) ( not ( = ?auto_127308 ?auto_127313 ) ) ( not ( = ?auto_127309 ?auto_127313 ) ) ( not ( = ?auto_127311 ?auto_127313 ) ) ( not ( = ?auto_127312 ?auto_127313 ) ) ( ON ?auto_127310 ?auto_127312 ) ( ON ?auto_127313 ?auto_127310 ) ( CLEAR ?auto_127313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127306 ?auto_127307 ?auto_127308 ?auto_127309 ?auto_127311 ?auto_127312 ?auto_127310 )
      ( MAKE-4PILE ?auto_127306 ?auto_127307 ?auto_127308 ?auto_127309 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127318 - BLOCK
      ?auto_127319 - BLOCK
      ?auto_127320 - BLOCK
      ?auto_127321 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_127321 ) ( CLEAR ?auto_127320 ) ( ON-TABLE ?auto_127318 ) ( ON ?auto_127319 ?auto_127318 ) ( ON ?auto_127320 ?auto_127319 ) ( not ( = ?auto_127318 ?auto_127319 ) ) ( not ( = ?auto_127318 ?auto_127320 ) ) ( not ( = ?auto_127318 ?auto_127321 ) ) ( not ( = ?auto_127319 ?auto_127320 ) ) ( not ( = ?auto_127319 ?auto_127321 ) ) ( not ( = ?auto_127320 ?auto_127321 ) ) )
    :subtasks
    ( ( !STACK ?auto_127321 ?auto_127320 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127322 - BLOCK
      ?auto_127323 - BLOCK
      ?auto_127324 - BLOCK
      ?auto_127325 - BLOCK
    )
    :vars
    (
      ?auto_127326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127324 ) ( ON-TABLE ?auto_127322 ) ( ON ?auto_127323 ?auto_127322 ) ( ON ?auto_127324 ?auto_127323 ) ( not ( = ?auto_127322 ?auto_127323 ) ) ( not ( = ?auto_127322 ?auto_127324 ) ) ( not ( = ?auto_127322 ?auto_127325 ) ) ( not ( = ?auto_127323 ?auto_127324 ) ) ( not ( = ?auto_127323 ?auto_127325 ) ) ( not ( = ?auto_127324 ?auto_127325 ) ) ( ON ?auto_127325 ?auto_127326 ) ( CLEAR ?auto_127325 ) ( HAND-EMPTY ) ( not ( = ?auto_127322 ?auto_127326 ) ) ( not ( = ?auto_127323 ?auto_127326 ) ) ( not ( = ?auto_127324 ?auto_127326 ) ) ( not ( = ?auto_127325 ?auto_127326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127325 ?auto_127326 )
      ( MAKE-4PILE ?auto_127322 ?auto_127323 ?auto_127324 ?auto_127325 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127327 - BLOCK
      ?auto_127328 - BLOCK
      ?auto_127329 - BLOCK
      ?auto_127330 - BLOCK
    )
    :vars
    (
      ?auto_127331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127327 ) ( ON ?auto_127328 ?auto_127327 ) ( not ( = ?auto_127327 ?auto_127328 ) ) ( not ( = ?auto_127327 ?auto_127329 ) ) ( not ( = ?auto_127327 ?auto_127330 ) ) ( not ( = ?auto_127328 ?auto_127329 ) ) ( not ( = ?auto_127328 ?auto_127330 ) ) ( not ( = ?auto_127329 ?auto_127330 ) ) ( ON ?auto_127330 ?auto_127331 ) ( CLEAR ?auto_127330 ) ( not ( = ?auto_127327 ?auto_127331 ) ) ( not ( = ?auto_127328 ?auto_127331 ) ) ( not ( = ?auto_127329 ?auto_127331 ) ) ( not ( = ?auto_127330 ?auto_127331 ) ) ( HOLDING ?auto_127329 ) ( CLEAR ?auto_127328 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127327 ?auto_127328 ?auto_127329 )
      ( MAKE-4PILE ?auto_127327 ?auto_127328 ?auto_127329 ?auto_127330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127332 - BLOCK
      ?auto_127333 - BLOCK
      ?auto_127334 - BLOCK
      ?auto_127335 - BLOCK
    )
    :vars
    (
      ?auto_127336 - BLOCK
      ?auto_127337 - BLOCK
      ?auto_127339 - BLOCK
      ?auto_127338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127332 ) ( ON ?auto_127333 ?auto_127332 ) ( not ( = ?auto_127332 ?auto_127333 ) ) ( not ( = ?auto_127332 ?auto_127334 ) ) ( not ( = ?auto_127332 ?auto_127335 ) ) ( not ( = ?auto_127333 ?auto_127334 ) ) ( not ( = ?auto_127333 ?auto_127335 ) ) ( not ( = ?auto_127334 ?auto_127335 ) ) ( ON ?auto_127335 ?auto_127336 ) ( not ( = ?auto_127332 ?auto_127336 ) ) ( not ( = ?auto_127333 ?auto_127336 ) ) ( not ( = ?auto_127334 ?auto_127336 ) ) ( not ( = ?auto_127335 ?auto_127336 ) ) ( CLEAR ?auto_127333 ) ( ON ?auto_127334 ?auto_127335 ) ( CLEAR ?auto_127334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127337 ) ( ON ?auto_127339 ?auto_127337 ) ( ON ?auto_127338 ?auto_127339 ) ( ON ?auto_127336 ?auto_127338 ) ( not ( = ?auto_127337 ?auto_127339 ) ) ( not ( = ?auto_127337 ?auto_127338 ) ) ( not ( = ?auto_127337 ?auto_127336 ) ) ( not ( = ?auto_127337 ?auto_127335 ) ) ( not ( = ?auto_127337 ?auto_127334 ) ) ( not ( = ?auto_127339 ?auto_127338 ) ) ( not ( = ?auto_127339 ?auto_127336 ) ) ( not ( = ?auto_127339 ?auto_127335 ) ) ( not ( = ?auto_127339 ?auto_127334 ) ) ( not ( = ?auto_127338 ?auto_127336 ) ) ( not ( = ?auto_127338 ?auto_127335 ) ) ( not ( = ?auto_127338 ?auto_127334 ) ) ( not ( = ?auto_127332 ?auto_127337 ) ) ( not ( = ?auto_127332 ?auto_127339 ) ) ( not ( = ?auto_127332 ?auto_127338 ) ) ( not ( = ?auto_127333 ?auto_127337 ) ) ( not ( = ?auto_127333 ?auto_127339 ) ) ( not ( = ?auto_127333 ?auto_127338 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127337 ?auto_127339 ?auto_127338 ?auto_127336 ?auto_127335 )
      ( MAKE-4PILE ?auto_127332 ?auto_127333 ?auto_127334 ?auto_127335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127340 - BLOCK
      ?auto_127341 - BLOCK
      ?auto_127342 - BLOCK
      ?auto_127343 - BLOCK
    )
    :vars
    (
      ?auto_127344 - BLOCK
      ?auto_127347 - BLOCK
      ?auto_127346 - BLOCK
      ?auto_127345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127340 ) ( not ( = ?auto_127340 ?auto_127341 ) ) ( not ( = ?auto_127340 ?auto_127342 ) ) ( not ( = ?auto_127340 ?auto_127343 ) ) ( not ( = ?auto_127341 ?auto_127342 ) ) ( not ( = ?auto_127341 ?auto_127343 ) ) ( not ( = ?auto_127342 ?auto_127343 ) ) ( ON ?auto_127343 ?auto_127344 ) ( not ( = ?auto_127340 ?auto_127344 ) ) ( not ( = ?auto_127341 ?auto_127344 ) ) ( not ( = ?auto_127342 ?auto_127344 ) ) ( not ( = ?auto_127343 ?auto_127344 ) ) ( ON ?auto_127342 ?auto_127343 ) ( CLEAR ?auto_127342 ) ( ON-TABLE ?auto_127347 ) ( ON ?auto_127346 ?auto_127347 ) ( ON ?auto_127345 ?auto_127346 ) ( ON ?auto_127344 ?auto_127345 ) ( not ( = ?auto_127347 ?auto_127346 ) ) ( not ( = ?auto_127347 ?auto_127345 ) ) ( not ( = ?auto_127347 ?auto_127344 ) ) ( not ( = ?auto_127347 ?auto_127343 ) ) ( not ( = ?auto_127347 ?auto_127342 ) ) ( not ( = ?auto_127346 ?auto_127345 ) ) ( not ( = ?auto_127346 ?auto_127344 ) ) ( not ( = ?auto_127346 ?auto_127343 ) ) ( not ( = ?auto_127346 ?auto_127342 ) ) ( not ( = ?auto_127345 ?auto_127344 ) ) ( not ( = ?auto_127345 ?auto_127343 ) ) ( not ( = ?auto_127345 ?auto_127342 ) ) ( not ( = ?auto_127340 ?auto_127347 ) ) ( not ( = ?auto_127340 ?auto_127346 ) ) ( not ( = ?auto_127340 ?auto_127345 ) ) ( not ( = ?auto_127341 ?auto_127347 ) ) ( not ( = ?auto_127341 ?auto_127346 ) ) ( not ( = ?auto_127341 ?auto_127345 ) ) ( HOLDING ?auto_127341 ) ( CLEAR ?auto_127340 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127340 ?auto_127341 )
      ( MAKE-4PILE ?auto_127340 ?auto_127341 ?auto_127342 ?auto_127343 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127348 - BLOCK
      ?auto_127349 - BLOCK
      ?auto_127350 - BLOCK
      ?auto_127351 - BLOCK
    )
    :vars
    (
      ?auto_127353 - BLOCK
      ?auto_127355 - BLOCK
      ?auto_127352 - BLOCK
      ?auto_127354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127348 ) ( not ( = ?auto_127348 ?auto_127349 ) ) ( not ( = ?auto_127348 ?auto_127350 ) ) ( not ( = ?auto_127348 ?auto_127351 ) ) ( not ( = ?auto_127349 ?auto_127350 ) ) ( not ( = ?auto_127349 ?auto_127351 ) ) ( not ( = ?auto_127350 ?auto_127351 ) ) ( ON ?auto_127351 ?auto_127353 ) ( not ( = ?auto_127348 ?auto_127353 ) ) ( not ( = ?auto_127349 ?auto_127353 ) ) ( not ( = ?auto_127350 ?auto_127353 ) ) ( not ( = ?auto_127351 ?auto_127353 ) ) ( ON ?auto_127350 ?auto_127351 ) ( ON-TABLE ?auto_127355 ) ( ON ?auto_127352 ?auto_127355 ) ( ON ?auto_127354 ?auto_127352 ) ( ON ?auto_127353 ?auto_127354 ) ( not ( = ?auto_127355 ?auto_127352 ) ) ( not ( = ?auto_127355 ?auto_127354 ) ) ( not ( = ?auto_127355 ?auto_127353 ) ) ( not ( = ?auto_127355 ?auto_127351 ) ) ( not ( = ?auto_127355 ?auto_127350 ) ) ( not ( = ?auto_127352 ?auto_127354 ) ) ( not ( = ?auto_127352 ?auto_127353 ) ) ( not ( = ?auto_127352 ?auto_127351 ) ) ( not ( = ?auto_127352 ?auto_127350 ) ) ( not ( = ?auto_127354 ?auto_127353 ) ) ( not ( = ?auto_127354 ?auto_127351 ) ) ( not ( = ?auto_127354 ?auto_127350 ) ) ( not ( = ?auto_127348 ?auto_127355 ) ) ( not ( = ?auto_127348 ?auto_127352 ) ) ( not ( = ?auto_127348 ?auto_127354 ) ) ( not ( = ?auto_127349 ?auto_127355 ) ) ( not ( = ?auto_127349 ?auto_127352 ) ) ( not ( = ?auto_127349 ?auto_127354 ) ) ( CLEAR ?auto_127348 ) ( ON ?auto_127349 ?auto_127350 ) ( CLEAR ?auto_127349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127355 ?auto_127352 ?auto_127354 ?auto_127353 ?auto_127351 ?auto_127350 )
      ( MAKE-4PILE ?auto_127348 ?auto_127349 ?auto_127350 ?auto_127351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127356 - BLOCK
      ?auto_127357 - BLOCK
      ?auto_127358 - BLOCK
      ?auto_127359 - BLOCK
    )
    :vars
    (
      ?auto_127361 - BLOCK
      ?auto_127360 - BLOCK
      ?auto_127363 - BLOCK
      ?auto_127362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127356 ?auto_127357 ) ) ( not ( = ?auto_127356 ?auto_127358 ) ) ( not ( = ?auto_127356 ?auto_127359 ) ) ( not ( = ?auto_127357 ?auto_127358 ) ) ( not ( = ?auto_127357 ?auto_127359 ) ) ( not ( = ?auto_127358 ?auto_127359 ) ) ( ON ?auto_127359 ?auto_127361 ) ( not ( = ?auto_127356 ?auto_127361 ) ) ( not ( = ?auto_127357 ?auto_127361 ) ) ( not ( = ?auto_127358 ?auto_127361 ) ) ( not ( = ?auto_127359 ?auto_127361 ) ) ( ON ?auto_127358 ?auto_127359 ) ( ON-TABLE ?auto_127360 ) ( ON ?auto_127363 ?auto_127360 ) ( ON ?auto_127362 ?auto_127363 ) ( ON ?auto_127361 ?auto_127362 ) ( not ( = ?auto_127360 ?auto_127363 ) ) ( not ( = ?auto_127360 ?auto_127362 ) ) ( not ( = ?auto_127360 ?auto_127361 ) ) ( not ( = ?auto_127360 ?auto_127359 ) ) ( not ( = ?auto_127360 ?auto_127358 ) ) ( not ( = ?auto_127363 ?auto_127362 ) ) ( not ( = ?auto_127363 ?auto_127361 ) ) ( not ( = ?auto_127363 ?auto_127359 ) ) ( not ( = ?auto_127363 ?auto_127358 ) ) ( not ( = ?auto_127362 ?auto_127361 ) ) ( not ( = ?auto_127362 ?auto_127359 ) ) ( not ( = ?auto_127362 ?auto_127358 ) ) ( not ( = ?auto_127356 ?auto_127360 ) ) ( not ( = ?auto_127356 ?auto_127363 ) ) ( not ( = ?auto_127356 ?auto_127362 ) ) ( not ( = ?auto_127357 ?auto_127360 ) ) ( not ( = ?auto_127357 ?auto_127363 ) ) ( not ( = ?auto_127357 ?auto_127362 ) ) ( ON ?auto_127357 ?auto_127358 ) ( CLEAR ?auto_127357 ) ( HOLDING ?auto_127356 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127356 )
      ( MAKE-4PILE ?auto_127356 ?auto_127357 ?auto_127358 ?auto_127359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_127364 - BLOCK
      ?auto_127365 - BLOCK
      ?auto_127366 - BLOCK
      ?auto_127367 - BLOCK
    )
    :vars
    (
      ?auto_127371 - BLOCK
      ?auto_127369 - BLOCK
      ?auto_127368 - BLOCK
      ?auto_127370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127364 ?auto_127365 ) ) ( not ( = ?auto_127364 ?auto_127366 ) ) ( not ( = ?auto_127364 ?auto_127367 ) ) ( not ( = ?auto_127365 ?auto_127366 ) ) ( not ( = ?auto_127365 ?auto_127367 ) ) ( not ( = ?auto_127366 ?auto_127367 ) ) ( ON ?auto_127367 ?auto_127371 ) ( not ( = ?auto_127364 ?auto_127371 ) ) ( not ( = ?auto_127365 ?auto_127371 ) ) ( not ( = ?auto_127366 ?auto_127371 ) ) ( not ( = ?auto_127367 ?auto_127371 ) ) ( ON ?auto_127366 ?auto_127367 ) ( ON-TABLE ?auto_127369 ) ( ON ?auto_127368 ?auto_127369 ) ( ON ?auto_127370 ?auto_127368 ) ( ON ?auto_127371 ?auto_127370 ) ( not ( = ?auto_127369 ?auto_127368 ) ) ( not ( = ?auto_127369 ?auto_127370 ) ) ( not ( = ?auto_127369 ?auto_127371 ) ) ( not ( = ?auto_127369 ?auto_127367 ) ) ( not ( = ?auto_127369 ?auto_127366 ) ) ( not ( = ?auto_127368 ?auto_127370 ) ) ( not ( = ?auto_127368 ?auto_127371 ) ) ( not ( = ?auto_127368 ?auto_127367 ) ) ( not ( = ?auto_127368 ?auto_127366 ) ) ( not ( = ?auto_127370 ?auto_127371 ) ) ( not ( = ?auto_127370 ?auto_127367 ) ) ( not ( = ?auto_127370 ?auto_127366 ) ) ( not ( = ?auto_127364 ?auto_127369 ) ) ( not ( = ?auto_127364 ?auto_127368 ) ) ( not ( = ?auto_127364 ?auto_127370 ) ) ( not ( = ?auto_127365 ?auto_127369 ) ) ( not ( = ?auto_127365 ?auto_127368 ) ) ( not ( = ?auto_127365 ?auto_127370 ) ) ( ON ?auto_127365 ?auto_127366 ) ( ON ?auto_127364 ?auto_127365 ) ( CLEAR ?auto_127364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127369 ?auto_127368 ?auto_127370 ?auto_127371 ?auto_127367 ?auto_127366 ?auto_127365 )
      ( MAKE-4PILE ?auto_127364 ?auto_127365 ?auto_127366 ?auto_127367 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127375 - BLOCK
      ?auto_127376 - BLOCK
      ?auto_127377 - BLOCK
    )
    :vars
    (
      ?auto_127378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127378 ?auto_127377 ) ( CLEAR ?auto_127378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127375 ) ( ON ?auto_127376 ?auto_127375 ) ( ON ?auto_127377 ?auto_127376 ) ( not ( = ?auto_127375 ?auto_127376 ) ) ( not ( = ?auto_127375 ?auto_127377 ) ) ( not ( = ?auto_127375 ?auto_127378 ) ) ( not ( = ?auto_127376 ?auto_127377 ) ) ( not ( = ?auto_127376 ?auto_127378 ) ) ( not ( = ?auto_127377 ?auto_127378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127378 ?auto_127377 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127379 - BLOCK
      ?auto_127380 - BLOCK
      ?auto_127381 - BLOCK
    )
    :vars
    (
      ?auto_127382 - BLOCK
      ?auto_127383 - BLOCK
      ?auto_127384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127382 ?auto_127381 ) ( CLEAR ?auto_127382 ) ( ON-TABLE ?auto_127379 ) ( ON ?auto_127380 ?auto_127379 ) ( ON ?auto_127381 ?auto_127380 ) ( not ( = ?auto_127379 ?auto_127380 ) ) ( not ( = ?auto_127379 ?auto_127381 ) ) ( not ( = ?auto_127379 ?auto_127382 ) ) ( not ( = ?auto_127380 ?auto_127381 ) ) ( not ( = ?auto_127380 ?auto_127382 ) ) ( not ( = ?auto_127381 ?auto_127382 ) ) ( HOLDING ?auto_127383 ) ( CLEAR ?auto_127384 ) ( not ( = ?auto_127379 ?auto_127383 ) ) ( not ( = ?auto_127379 ?auto_127384 ) ) ( not ( = ?auto_127380 ?auto_127383 ) ) ( not ( = ?auto_127380 ?auto_127384 ) ) ( not ( = ?auto_127381 ?auto_127383 ) ) ( not ( = ?auto_127381 ?auto_127384 ) ) ( not ( = ?auto_127382 ?auto_127383 ) ) ( not ( = ?auto_127382 ?auto_127384 ) ) ( not ( = ?auto_127383 ?auto_127384 ) ) )
    :subtasks
    ( ( !STACK ?auto_127383 ?auto_127384 )
      ( MAKE-3PILE ?auto_127379 ?auto_127380 ?auto_127381 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127385 - BLOCK
      ?auto_127386 - BLOCK
      ?auto_127387 - BLOCK
    )
    :vars
    (
      ?auto_127388 - BLOCK
      ?auto_127389 - BLOCK
      ?auto_127390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127388 ?auto_127387 ) ( ON-TABLE ?auto_127385 ) ( ON ?auto_127386 ?auto_127385 ) ( ON ?auto_127387 ?auto_127386 ) ( not ( = ?auto_127385 ?auto_127386 ) ) ( not ( = ?auto_127385 ?auto_127387 ) ) ( not ( = ?auto_127385 ?auto_127388 ) ) ( not ( = ?auto_127386 ?auto_127387 ) ) ( not ( = ?auto_127386 ?auto_127388 ) ) ( not ( = ?auto_127387 ?auto_127388 ) ) ( CLEAR ?auto_127389 ) ( not ( = ?auto_127385 ?auto_127390 ) ) ( not ( = ?auto_127385 ?auto_127389 ) ) ( not ( = ?auto_127386 ?auto_127390 ) ) ( not ( = ?auto_127386 ?auto_127389 ) ) ( not ( = ?auto_127387 ?auto_127390 ) ) ( not ( = ?auto_127387 ?auto_127389 ) ) ( not ( = ?auto_127388 ?auto_127390 ) ) ( not ( = ?auto_127388 ?auto_127389 ) ) ( not ( = ?auto_127390 ?auto_127389 ) ) ( ON ?auto_127390 ?auto_127388 ) ( CLEAR ?auto_127390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127385 ?auto_127386 ?auto_127387 ?auto_127388 )
      ( MAKE-3PILE ?auto_127385 ?auto_127386 ?auto_127387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127391 - BLOCK
      ?auto_127392 - BLOCK
      ?auto_127393 - BLOCK
    )
    :vars
    (
      ?auto_127396 - BLOCK
      ?auto_127394 - BLOCK
      ?auto_127395 - BLOCK
      ?auto_127398 - BLOCK
      ?auto_127397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127396 ?auto_127393 ) ( ON-TABLE ?auto_127391 ) ( ON ?auto_127392 ?auto_127391 ) ( ON ?auto_127393 ?auto_127392 ) ( not ( = ?auto_127391 ?auto_127392 ) ) ( not ( = ?auto_127391 ?auto_127393 ) ) ( not ( = ?auto_127391 ?auto_127396 ) ) ( not ( = ?auto_127392 ?auto_127393 ) ) ( not ( = ?auto_127392 ?auto_127396 ) ) ( not ( = ?auto_127393 ?auto_127396 ) ) ( not ( = ?auto_127391 ?auto_127394 ) ) ( not ( = ?auto_127391 ?auto_127395 ) ) ( not ( = ?auto_127392 ?auto_127394 ) ) ( not ( = ?auto_127392 ?auto_127395 ) ) ( not ( = ?auto_127393 ?auto_127394 ) ) ( not ( = ?auto_127393 ?auto_127395 ) ) ( not ( = ?auto_127396 ?auto_127394 ) ) ( not ( = ?auto_127396 ?auto_127395 ) ) ( not ( = ?auto_127394 ?auto_127395 ) ) ( ON ?auto_127394 ?auto_127396 ) ( CLEAR ?auto_127394 ) ( HOLDING ?auto_127395 ) ( CLEAR ?auto_127398 ) ( ON-TABLE ?auto_127397 ) ( ON ?auto_127398 ?auto_127397 ) ( not ( = ?auto_127397 ?auto_127398 ) ) ( not ( = ?auto_127397 ?auto_127395 ) ) ( not ( = ?auto_127398 ?auto_127395 ) ) ( not ( = ?auto_127391 ?auto_127398 ) ) ( not ( = ?auto_127391 ?auto_127397 ) ) ( not ( = ?auto_127392 ?auto_127398 ) ) ( not ( = ?auto_127392 ?auto_127397 ) ) ( not ( = ?auto_127393 ?auto_127398 ) ) ( not ( = ?auto_127393 ?auto_127397 ) ) ( not ( = ?auto_127396 ?auto_127398 ) ) ( not ( = ?auto_127396 ?auto_127397 ) ) ( not ( = ?auto_127394 ?auto_127398 ) ) ( not ( = ?auto_127394 ?auto_127397 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127397 ?auto_127398 ?auto_127395 )
      ( MAKE-3PILE ?auto_127391 ?auto_127392 ?auto_127393 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127399 - BLOCK
      ?auto_127400 - BLOCK
      ?auto_127401 - BLOCK
    )
    :vars
    (
      ?auto_127405 - BLOCK
      ?auto_127404 - BLOCK
      ?auto_127403 - BLOCK
      ?auto_127406 - BLOCK
      ?auto_127402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127405 ?auto_127401 ) ( ON-TABLE ?auto_127399 ) ( ON ?auto_127400 ?auto_127399 ) ( ON ?auto_127401 ?auto_127400 ) ( not ( = ?auto_127399 ?auto_127400 ) ) ( not ( = ?auto_127399 ?auto_127401 ) ) ( not ( = ?auto_127399 ?auto_127405 ) ) ( not ( = ?auto_127400 ?auto_127401 ) ) ( not ( = ?auto_127400 ?auto_127405 ) ) ( not ( = ?auto_127401 ?auto_127405 ) ) ( not ( = ?auto_127399 ?auto_127404 ) ) ( not ( = ?auto_127399 ?auto_127403 ) ) ( not ( = ?auto_127400 ?auto_127404 ) ) ( not ( = ?auto_127400 ?auto_127403 ) ) ( not ( = ?auto_127401 ?auto_127404 ) ) ( not ( = ?auto_127401 ?auto_127403 ) ) ( not ( = ?auto_127405 ?auto_127404 ) ) ( not ( = ?auto_127405 ?auto_127403 ) ) ( not ( = ?auto_127404 ?auto_127403 ) ) ( ON ?auto_127404 ?auto_127405 ) ( CLEAR ?auto_127406 ) ( ON-TABLE ?auto_127402 ) ( ON ?auto_127406 ?auto_127402 ) ( not ( = ?auto_127402 ?auto_127406 ) ) ( not ( = ?auto_127402 ?auto_127403 ) ) ( not ( = ?auto_127406 ?auto_127403 ) ) ( not ( = ?auto_127399 ?auto_127406 ) ) ( not ( = ?auto_127399 ?auto_127402 ) ) ( not ( = ?auto_127400 ?auto_127406 ) ) ( not ( = ?auto_127400 ?auto_127402 ) ) ( not ( = ?auto_127401 ?auto_127406 ) ) ( not ( = ?auto_127401 ?auto_127402 ) ) ( not ( = ?auto_127405 ?auto_127406 ) ) ( not ( = ?auto_127405 ?auto_127402 ) ) ( not ( = ?auto_127404 ?auto_127406 ) ) ( not ( = ?auto_127404 ?auto_127402 ) ) ( ON ?auto_127403 ?auto_127404 ) ( CLEAR ?auto_127403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127399 ?auto_127400 ?auto_127401 ?auto_127405 ?auto_127404 )
      ( MAKE-3PILE ?auto_127399 ?auto_127400 ?auto_127401 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127407 - BLOCK
      ?auto_127408 - BLOCK
      ?auto_127409 - BLOCK
    )
    :vars
    (
      ?auto_127411 - BLOCK
      ?auto_127410 - BLOCK
      ?auto_127414 - BLOCK
      ?auto_127413 - BLOCK
      ?auto_127412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127411 ?auto_127409 ) ( ON-TABLE ?auto_127407 ) ( ON ?auto_127408 ?auto_127407 ) ( ON ?auto_127409 ?auto_127408 ) ( not ( = ?auto_127407 ?auto_127408 ) ) ( not ( = ?auto_127407 ?auto_127409 ) ) ( not ( = ?auto_127407 ?auto_127411 ) ) ( not ( = ?auto_127408 ?auto_127409 ) ) ( not ( = ?auto_127408 ?auto_127411 ) ) ( not ( = ?auto_127409 ?auto_127411 ) ) ( not ( = ?auto_127407 ?auto_127410 ) ) ( not ( = ?auto_127407 ?auto_127414 ) ) ( not ( = ?auto_127408 ?auto_127410 ) ) ( not ( = ?auto_127408 ?auto_127414 ) ) ( not ( = ?auto_127409 ?auto_127410 ) ) ( not ( = ?auto_127409 ?auto_127414 ) ) ( not ( = ?auto_127411 ?auto_127410 ) ) ( not ( = ?auto_127411 ?auto_127414 ) ) ( not ( = ?auto_127410 ?auto_127414 ) ) ( ON ?auto_127410 ?auto_127411 ) ( ON-TABLE ?auto_127413 ) ( not ( = ?auto_127413 ?auto_127412 ) ) ( not ( = ?auto_127413 ?auto_127414 ) ) ( not ( = ?auto_127412 ?auto_127414 ) ) ( not ( = ?auto_127407 ?auto_127412 ) ) ( not ( = ?auto_127407 ?auto_127413 ) ) ( not ( = ?auto_127408 ?auto_127412 ) ) ( not ( = ?auto_127408 ?auto_127413 ) ) ( not ( = ?auto_127409 ?auto_127412 ) ) ( not ( = ?auto_127409 ?auto_127413 ) ) ( not ( = ?auto_127411 ?auto_127412 ) ) ( not ( = ?auto_127411 ?auto_127413 ) ) ( not ( = ?auto_127410 ?auto_127412 ) ) ( not ( = ?auto_127410 ?auto_127413 ) ) ( ON ?auto_127414 ?auto_127410 ) ( CLEAR ?auto_127414 ) ( HOLDING ?auto_127412 ) ( CLEAR ?auto_127413 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127413 ?auto_127412 )
      ( MAKE-3PILE ?auto_127407 ?auto_127408 ?auto_127409 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127415 - BLOCK
      ?auto_127416 - BLOCK
      ?auto_127417 - BLOCK
    )
    :vars
    (
      ?auto_127419 - BLOCK
      ?auto_127421 - BLOCK
      ?auto_127418 - BLOCK
      ?auto_127422 - BLOCK
      ?auto_127420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127419 ?auto_127417 ) ( ON-TABLE ?auto_127415 ) ( ON ?auto_127416 ?auto_127415 ) ( ON ?auto_127417 ?auto_127416 ) ( not ( = ?auto_127415 ?auto_127416 ) ) ( not ( = ?auto_127415 ?auto_127417 ) ) ( not ( = ?auto_127415 ?auto_127419 ) ) ( not ( = ?auto_127416 ?auto_127417 ) ) ( not ( = ?auto_127416 ?auto_127419 ) ) ( not ( = ?auto_127417 ?auto_127419 ) ) ( not ( = ?auto_127415 ?auto_127421 ) ) ( not ( = ?auto_127415 ?auto_127418 ) ) ( not ( = ?auto_127416 ?auto_127421 ) ) ( not ( = ?auto_127416 ?auto_127418 ) ) ( not ( = ?auto_127417 ?auto_127421 ) ) ( not ( = ?auto_127417 ?auto_127418 ) ) ( not ( = ?auto_127419 ?auto_127421 ) ) ( not ( = ?auto_127419 ?auto_127418 ) ) ( not ( = ?auto_127421 ?auto_127418 ) ) ( ON ?auto_127421 ?auto_127419 ) ( ON-TABLE ?auto_127422 ) ( not ( = ?auto_127422 ?auto_127420 ) ) ( not ( = ?auto_127422 ?auto_127418 ) ) ( not ( = ?auto_127420 ?auto_127418 ) ) ( not ( = ?auto_127415 ?auto_127420 ) ) ( not ( = ?auto_127415 ?auto_127422 ) ) ( not ( = ?auto_127416 ?auto_127420 ) ) ( not ( = ?auto_127416 ?auto_127422 ) ) ( not ( = ?auto_127417 ?auto_127420 ) ) ( not ( = ?auto_127417 ?auto_127422 ) ) ( not ( = ?auto_127419 ?auto_127420 ) ) ( not ( = ?auto_127419 ?auto_127422 ) ) ( not ( = ?auto_127421 ?auto_127420 ) ) ( not ( = ?auto_127421 ?auto_127422 ) ) ( ON ?auto_127418 ?auto_127421 ) ( CLEAR ?auto_127422 ) ( ON ?auto_127420 ?auto_127418 ) ( CLEAR ?auto_127420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127415 ?auto_127416 ?auto_127417 ?auto_127419 ?auto_127421 ?auto_127418 )
      ( MAKE-3PILE ?auto_127415 ?auto_127416 ?auto_127417 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127423 - BLOCK
      ?auto_127424 - BLOCK
      ?auto_127425 - BLOCK
    )
    :vars
    (
      ?auto_127430 - BLOCK
      ?auto_127426 - BLOCK
      ?auto_127429 - BLOCK
      ?auto_127427 - BLOCK
      ?auto_127428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127430 ?auto_127425 ) ( ON-TABLE ?auto_127423 ) ( ON ?auto_127424 ?auto_127423 ) ( ON ?auto_127425 ?auto_127424 ) ( not ( = ?auto_127423 ?auto_127424 ) ) ( not ( = ?auto_127423 ?auto_127425 ) ) ( not ( = ?auto_127423 ?auto_127430 ) ) ( not ( = ?auto_127424 ?auto_127425 ) ) ( not ( = ?auto_127424 ?auto_127430 ) ) ( not ( = ?auto_127425 ?auto_127430 ) ) ( not ( = ?auto_127423 ?auto_127426 ) ) ( not ( = ?auto_127423 ?auto_127429 ) ) ( not ( = ?auto_127424 ?auto_127426 ) ) ( not ( = ?auto_127424 ?auto_127429 ) ) ( not ( = ?auto_127425 ?auto_127426 ) ) ( not ( = ?auto_127425 ?auto_127429 ) ) ( not ( = ?auto_127430 ?auto_127426 ) ) ( not ( = ?auto_127430 ?auto_127429 ) ) ( not ( = ?auto_127426 ?auto_127429 ) ) ( ON ?auto_127426 ?auto_127430 ) ( not ( = ?auto_127427 ?auto_127428 ) ) ( not ( = ?auto_127427 ?auto_127429 ) ) ( not ( = ?auto_127428 ?auto_127429 ) ) ( not ( = ?auto_127423 ?auto_127428 ) ) ( not ( = ?auto_127423 ?auto_127427 ) ) ( not ( = ?auto_127424 ?auto_127428 ) ) ( not ( = ?auto_127424 ?auto_127427 ) ) ( not ( = ?auto_127425 ?auto_127428 ) ) ( not ( = ?auto_127425 ?auto_127427 ) ) ( not ( = ?auto_127430 ?auto_127428 ) ) ( not ( = ?auto_127430 ?auto_127427 ) ) ( not ( = ?auto_127426 ?auto_127428 ) ) ( not ( = ?auto_127426 ?auto_127427 ) ) ( ON ?auto_127429 ?auto_127426 ) ( ON ?auto_127428 ?auto_127429 ) ( CLEAR ?auto_127428 ) ( HOLDING ?auto_127427 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127427 )
      ( MAKE-3PILE ?auto_127423 ?auto_127424 ?auto_127425 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_127431 - BLOCK
      ?auto_127432 - BLOCK
      ?auto_127433 - BLOCK
    )
    :vars
    (
      ?auto_127434 - BLOCK
      ?auto_127436 - BLOCK
      ?auto_127437 - BLOCK
      ?auto_127438 - BLOCK
      ?auto_127435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127434 ?auto_127433 ) ( ON-TABLE ?auto_127431 ) ( ON ?auto_127432 ?auto_127431 ) ( ON ?auto_127433 ?auto_127432 ) ( not ( = ?auto_127431 ?auto_127432 ) ) ( not ( = ?auto_127431 ?auto_127433 ) ) ( not ( = ?auto_127431 ?auto_127434 ) ) ( not ( = ?auto_127432 ?auto_127433 ) ) ( not ( = ?auto_127432 ?auto_127434 ) ) ( not ( = ?auto_127433 ?auto_127434 ) ) ( not ( = ?auto_127431 ?auto_127436 ) ) ( not ( = ?auto_127431 ?auto_127437 ) ) ( not ( = ?auto_127432 ?auto_127436 ) ) ( not ( = ?auto_127432 ?auto_127437 ) ) ( not ( = ?auto_127433 ?auto_127436 ) ) ( not ( = ?auto_127433 ?auto_127437 ) ) ( not ( = ?auto_127434 ?auto_127436 ) ) ( not ( = ?auto_127434 ?auto_127437 ) ) ( not ( = ?auto_127436 ?auto_127437 ) ) ( ON ?auto_127436 ?auto_127434 ) ( not ( = ?auto_127438 ?auto_127435 ) ) ( not ( = ?auto_127438 ?auto_127437 ) ) ( not ( = ?auto_127435 ?auto_127437 ) ) ( not ( = ?auto_127431 ?auto_127435 ) ) ( not ( = ?auto_127431 ?auto_127438 ) ) ( not ( = ?auto_127432 ?auto_127435 ) ) ( not ( = ?auto_127432 ?auto_127438 ) ) ( not ( = ?auto_127433 ?auto_127435 ) ) ( not ( = ?auto_127433 ?auto_127438 ) ) ( not ( = ?auto_127434 ?auto_127435 ) ) ( not ( = ?auto_127434 ?auto_127438 ) ) ( not ( = ?auto_127436 ?auto_127435 ) ) ( not ( = ?auto_127436 ?auto_127438 ) ) ( ON ?auto_127437 ?auto_127436 ) ( ON ?auto_127435 ?auto_127437 ) ( ON ?auto_127438 ?auto_127435 ) ( CLEAR ?auto_127438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127431 ?auto_127432 ?auto_127433 ?auto_127434 ?auto_127436 ?auto_127437 ?auto_127435 )
      ( MAKE-3PILE ?auto_127431 ?auto_127432 ?auto_127433 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127444 - BLOCK
      ?auto_127445 - BLOCK
      ?auto_127446 - BLOCK
      ?auto_127447 - BLOCK
      ?auto_127448 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_127448 ) ( CLEAR ?auto_127447 ) ( ON-TABLE ?auto_127444 ) ( ON ?auto_127445 ?auto_127444 ) ( ON ?auto_127446 ?auto_127445 ) ( ON ?auto_127447 ?auto_127446 ) ( not ( = ?auto_127444 ?auto_127445 ) ) ( not ( = ?auto_127444 ?auto_127446 ) ) ( not ( = ?auto_127444 ?auto_127447 ) ) ( not ( = ?auto_127444 ?auto_127448 ) ) ( not ( = ?auto_127445 ?auto_127446 ) ) ( not ( = ?auto_127445 ?auto_127447 ) ) ( not ( = ?auto_127445 ?auto_127448 ) ) ( not ( = ?auto_127446 ?auto_127447 ) ) ( not ( = ?auto_127446 ?auto_127448 ) ) ( not ( = ?auto_127447 ?auto_127448 ) ) )
    :subtasks
    ( ( !STACK ?auto_127448 ?auto_127447 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127449 - BLOCK
      ?auto_127450 - BLOCK
      ?auto_127451 - BLOCK
      ?auto_127452 - BLOCK
      ?auto_127453 - BLOCK
    )
    :vars
    (
      ?auto_127454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127452 ) ( ON-TABLE ?auto_127449 ) ( ON ?auto_127450 ?auto_127449 ) ( ON ?auto_127451 ?auto_127450 ) ( ON ?auto_127452 ?auto_127451 ) ( not ( = ?auto_127449 ?auto_127450 ) ) ( not ( = ?auto_127449 ?auto_127451 ) ) ( not ( = ?auto_127449 ?auto_127452 ) ) ( not ( = ?auto_127449 ?auto_127453 ) ) ( not ( = ?auto_127450 ?auto_127451 ) ) ( not ( = ?auto_127450 ?auto_127452 ) ) ( not ( = ?auto_127450 ?auto_127453 ) ) ( not ( = ?auto_127451 ?auto_127452 ) ) ( not ( = ?auto_127451 ?auto_127453 ) ) ( not ( = ?auto_127452 ?auto_127453 ) ) ( ON ?auto_127453 ?auto_127454 ) ( CLEAR ?auto_127453 ) ( HAND-EMPTY ) ( not ( = ?auto_127449 ?auto_127454 ) ) ( not ( = ?auto_127450 ?auto_127454 ) ) ( not ( = ?auto_127451 ?auto_127454 ) ) ( not ( = ?auto_127452 ?auto_127454 ) ) ( not ( = ?auto_127453 ?auto_127454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127453 ?auto_127454 )
      ( MAKE-5PILE ?auto_127449 ?auto_127450 ?auto_127451 ?auto_127452 ?auto_127453 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127455 - BLOCK
      ?auto_127456 - BLOCK
      ?auto_127457 - BLOCK
      ?auto_127458 - BLOCK
      ?auto_127459 - BLOCK
    )
    :vars
    (
      ?auto_127460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127455 ) ( ON ?auto_127456 ?auto_127455 ) ( ON ?auto_127457 ?auto_127456 ) ( not ( = ?auto_127455 ?auto_127456 ) ) ( not ( = ?auto_127455 ?auto_127457 ) ) ( not ( = ?auto_127455 ?auto_127458 ) ) ( not ( = ?auto_127455 ?auto_127459 ) ) ( not ( = ?auto_127456 ?auto_127457 ) ) ( not ( = ?auto_127456 ?auto_127458 ) ) ( not ( = ?auto_127456 ?auto_127459 ) ) ( not ( = ?auto_127457 ?auto_127458 ) ) ( not ( = ?auto_127457 ?auto_127459 ) ) ( not ( = ?auto_127458 ?auto_127459 ) ) ( ON ?auto_127459 ?auto_127460 ) ( CLEAR ?auto_127459 ) ( not ( = ?auto_127455 ?auto_127460 ) ) ( not ( = ?auto_127456 ?auto_127460 ) ) ( not ( = ?auto_127457 ?auto_127460 ) ) ( not ( = ?auto_127458 ?auto_127460 ) ) ( not ( = ?auto_127459 ?auto_127460 ) ) ( HOLDING ?auto_127458 ) ( CLEAR ?auto_127457 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127455 ?auto_127456 ?auto_127457 ?auto_127458 )
      ( MAKE-5PILE ?auto_127455 ?auto_127456 ?auto_127457 ?auto_127458 ?auto_127459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127461 - BLOCK
      ?auto_127462 - BLOCK
      ?auto_127463 - BLOCK
      ?auto_127464 - BLOCK
      ?auto_127465 - BLOCK
    )
    :vars
    (
      ?auto_127466 - BLOCK
      ?auto_127468 - BLOCK
      ?auto_127467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127461 ) ( ON ?auto_127462 ?auto_127461 ) ( ON ?auto_127463 ?auto_127462 ) ( not ( = ?auto_127461 ?auto_127462 ) ) ( not ( = ?auto_127461 ?auto_127463 ) ) ( not ( = ?auto_127461 ?auto_127464 ) ) ( not ( = ?auto_127461 ?auto_127465 ) ) ( not ( = ?auto_127462 ?auto_127463 ) ) ( not ( = ?auto_127462 ?auto_127464 ) ) ( not ( = ?auto_127462 ?auto_127465 ) ) ( not ( = ?auto_127463 ?auto_127464 ) ) ( not ( = ?auto_127463 ?auto_127465 ) ) ( not ( = ?auto_127464 ?auto_127465 ) ) ( ON ?auto_127465 ?auto_127466 ) ( not ( = ?auto_127461 ?auto_127466 ) ) ( not ( = ?auto_127462 ?auto_127466 ) ) ( not ( = ?auto_127463 ?auto_127466 ) ) ( not ( = ?auto_127464 ?auto_127466 ) ) ( not ( = ?auto_127465 ?auto_127466 ) ) ( CLEAR ?auto_127463 ) ( ON ?auto_127464 ?auto_127465 ) ( CLEAR ?auto_127464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127468 ) ( ON ?auto_127467 ?auto_127468 ) ( ON ?auto_127466 ?auto_127467 ) ( not ( = ?auto_127468 ?auto_127467 ) ) ( not ( = ?auto_127468 ?auto_127466 ) ) ( not ( = ?auto_127468 ?auto_127465 ) ) ( not ( = ?auto_127468 ?auto_127464 ) ) ( not ( = ?auto_127467 ?auto_127466 ) ) ( not ( = ?auto_127467 ?auto_127465 ) ) ( not ( = ?auto_127467 ?auto_127464 ) ) ( not ( = ?auto_127461 ?auto_127468 ) ) ( not ( = ?auto_127461 ?auto_127467 ) ) ( not ( = ?auto_127462 ?auto_127468 ) ) ( not ( = ?auto_127462 ?auto_127467 ) ) ( not ( = ?auto_127463 ?auto_127468 ) ) ( not ( = ?auto_127463 ?auto_127467 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127468 ?auto_127467 ?auto_127466 ?auto_127465 )
      ( MAKE-5PILE ?auto_127461 ?auto_127462 ?auto_127463 ?auto_127464 ?auto_127465 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127469 - BLOCK
      ?auto_127470 - BLOCK
      ?auto_127471 - BLOCK
      ?auto_127472 - BLOCK
      ?auto_127473 - BLOCK
    )
    :vars
    (
      ?auto_127475 - BLOCK
      ?auto_127476 - BLOCK
      ?auto_127474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127469 ) ( ON ?auto_127470 ?auto_127469 ) ( not ( = ?auto_127469 ?auto_127470 ) ) ( not ( = ?auto_127469 ?auto_127471 ) ) ( not ( = ?auto_127469 ?auto_127472 ) ) ( not ( = ?auto_127469 ?auto_127473 ) ) ( not ( = ?auto_127470 ?auto_127471 ) ) ( not ( = ?auto_127470 ?auto_127472 ) ) ( not ( = ?auto_127470 ?auto_127473 ) ) ( not ( = ?auto_127471 ?auto_127472 ) ) ( not ( = ?auto_127471 ?auto_127473 ) ) ( not ( = ?auto_127472 ?auto_127473 ) ) ( ON ?auto_127473 ?auto_127475 ) ( not ( = ?auto_127469 ?auto_127475 ) ) ( not ( = ?auto_127470 ?auto_127475 ) ) ( not ( = ?auto_127471 ?auto_127475 ) ) ( not ( = ?auto_127472 ?auto_127475 ) ) ( not ( = ?auto_127473 ?auto_127475 ) ) ( ON ?auto_127472 ?auto_127473 ) ( CLEAR ?auto_127472 ) ( ON-TABLE ?auto_127476 ) ( ON ?auto_127474 ?auto_127476 ) ( ON ?auto_127475 ?auto_127474 ) ( not ( = ?auto_127476 ?auto_127474 ) ) ( not ( = ?auto_127476 ?auto_127475 ) ) ( not ( = ?auto_127476 ?auto_127473 ) ) ( not ( = ?auto_127476 ?auto_127472 ) ) ( not ( = ?auto_127474 ?auto_127475 ) ) ( not ( = ?auto_127474 ?auto_127473 ) ) ( not ( = ?auto_127474 ?auto_127472 ) ) ( not ( = ?auto_127469 ?auto_127476 ) ) ( not ( = ?auto_127469 ?auto_127474 ) ) ( not ( = ?auto_127470 ?auto_127476 ) ) ( not ( = ?auto_127470 ?auto_127474 ) ) ( not ( = ?auto_127471 ?auto_127476 ) ) ( not ( = ?auto_127471 ?auto_127474 ) ) ( HOLDING ?auto_127471 ) ( CLEAR ?auto_127470 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127469 ?auto_127470 ?auto_127471 )
      ( MAKE-5PILE ?auto_127469 ?auto_127470 ?auto_127471 ?auto_127472 ?auto_127473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127477 - BLOCK
      ?auto_127478 - BLOCK
      ?auto_127479 - BLOCK
      ?auto_127480 - BLOCK
      ?auto_127481 - BLOCK
    )
    :vars
    (
      ?auto_127483 - BLOCK
      ?auto_127482 - BLOCK
      ?auto_127484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127477 ) ( ON ?auto_127478 ?auto_127477 ) ( not ( = ?auto_127477 ?auto_127478 ) ) ( not ( = ?auto_127477 ?auto_127479 ) ) ( not ( = ?auto_127477 ?auto_127480 ) ) ( not ( = ?auto_127477 ?auto_127481 ) ) ( not ( = ?auto_127478 ?auto_127479 ) ) ( not ( = ?auto_127478 ?auto_127480 ) ) ( not ( = ?auto_127478 ?auto_127481 ) ) ( not ( = ?auto_127479 ?auto_127480 ) ) ( not ( = ?auto_127479 ?auto_127481 ) ) ( not ( = ?auto_127480 ?auto_127481 ) ) ( ON ?auto_127481 ?auto_127483 ) ( not ( = ?auto_127477 ?auto_127483 ) ) ( not ( = ?auto_127478 ?auto_127483 ) ) ( not ( = ?auto_127479 ?auto_127483 ) ) ( not ( = ?auto_127480 ?auto_127483 ) ) ( not ( = ?auto_127481 ?auto_127483 ) ) ( ON ?auto_127480 ?auto_127481 ) ( ON-TABLE ?auto_127482 ) ( ON ?auto_127484 ?auto_127482 ) ( ON ?auto_127483 ?auto_127484 ) ( not ( = ?auto_127482 ?auto_127484 ) ) ( not ( = ?auto_127482 ?auto_127483 ) ) ( not ( = ?auto_127482 ?auto_127481 ) ) ( not ( = ?auto_127482 ?auto_127480 ) ) ( not ( = ?auto_127484 ?auto_127483 ) ) ( not ( = ?auto_127484 ?auto_127481 ) ) ( not ( = ?auto_127484 ?auto_127480 ) ) ( not ( = ?auto_127477 ?auto_127482 ) ) ( not ( = ?auto_127477 ?auto_127484 ) ) ( not ( = ?auto_127478 ?auto_127482 ) ) ( not ( = ?auto_127478 ?auto_127484 ) ) ( not ( = ?auto_127479 ?auto_127482 ) ) ( not ( = ?auto_127479 ?auto_127484 ) ) ( CLEAR ?auto_127478 ) ( ON ?auto_127479 ?auto_127480 ) ( CLEAR ?auto_127479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127482 ?auto_127484 ?auto_127483 ?auto_127481 ?auto_127480 )
      ( MAKE-5PILE ?auto_127477 ?auto_127478 ?auto_127479 ?auto_127480 ?auto_127481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127485 - BLOCK
      ?auto_127486 - BLOCK
      ?auto_127487 - BLOCK
      ?auto_127488 - BLOCK
      ?auto_127489 - BLOCK
    )
    :vars
    (
      ?auto_127491 - BLOCK
      ?auto_127492 - BLOCK
      ?auto_127490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127485 ) ( not ( = ?auto_127485 ?auto_127486 ) ) ( not ( = ?auto_127485 ?auto_127487 ) ) ( not ( = ?auto_127485 ?auto_127488 ) ) ( not ( = ?auto_127485 ?auto_127489 ) ) ( not ( = ?auto_127486 ?auto_127487 ) ) ( not ( = ?auto_127486 ?auto_127488 ) ) ( not ( = ?auto_127486 ?auto_127489 ) ) ( not ( = ?auto_127487 ?auto_127488 ) ) ( not ( = ?auto_127487 ?auto_127489 ) ) ( not ( = ?auto_127488 ?auto_127489 ) ) ( ON ?auto_127489 ?auto_127491 ) ( not ( = ?auto_127485 ?auto_127491 ) ) ( not ( = ?auto_127486 ?auto_127491 ) ) ( not ( = ?auto_127487 ?auto_127491 ) ) ( not ( = ?auto_127488 ?auto_127491 ) ) ( not ( = ?auto_127489 ?auto_127491 ) ) ( ON ?auto_127488 ?auto_127489 ) ( ON-TABLE ?auto_127492 ) ( ON ?auto_127490 ?auto_127492 ) ( ON ?auto_127491 ?auto_127490 ) ( not ( = ?auto_127492 ?auto_127490 ) ) ( not ( = ?auto_127492 ?auto_127491 ) ) ( not ( = ?auto_127492 ?auto_127489 ) ) ( not ( = ?auto_127492 ?auto_127488 ) ) ( not ( = ?auto_127490 ?auto_127491 ) ) ( not ( = ?auto_127490 ?auto_127489 ) ) ( not ( = ?auto_127490 ?auto_127488 ) ) ( not ( = ?auto_127485 ?auto_127492 ) ) ( not ( = ?auto_127485 ?auto_127490 ) ) ( not ( = ?auto_127486 ?auto_127492 ) ) ( not ( = ?auto_127486 ?auto_127490 ) ) ( not ( = ?auto_127487 ?auto_127492 ) ) ( not ( = ?auto_127487 ?auto_127490 ) ) ( ON ?auto_127487 ?auto_127488 ) ( CLEAR ?auto_127487 ) ( HOLDING ?auto_127486 ) ( CLEAR ?auto_127485 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127485 ?auto_127486 )
      ( MAKE-5PILE ?auto_127485 ?auto_127486 ?auto_127487 ?auto_127488 ?auto_127489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127493 - BLOCK
      ?auto_127494 - BLOCK
      ?auto_127495 - BLOCK
      ?auto_127496 - BLOCK
      ?auto_127497 - BLOCK
    )
    :vars
    (
      ?auto_127499 - BLOCK
      ?auto_127500 - BLOCK
      ?auto_127498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127493 ) ( not ( = ?auto_127493 ?auto_127494 ) ) ( not ( = ?auto_127493 ?auto_127495 ) ) ( not ( = ?auto_127493 ?auto_127496 ) ) ( not ( = ?auto_127493 ?auto_127497 ) ) ( not ( = ?auto_127494 ?auto_127495 ) ) ( not ( = ?auto_127494 ?auto_127496 ) ) ( not ( = ?auto_127494 ?auto_127497 ) ) ( not ( = ?auto_127495 ?auto_127496 ) ) ( not ( = ?auto_127495 ?auto_127497 ) ) ( not ( = ?auto_127496 ?auto_127497 ) ) ( ON ?auto_127497 ?auto_127499 ) ( not ( = ?auto_127493 ?auto_127499 ) ) ( not ( = ?auto_127494 ?auto_127499 ) ) ( not ( = ?auto_127495 ?auto_127499 ) ) ( not ( = ?auto_127496 ?auto_127499 ) ) ( not ( = ?auto_127497 ?auto_127499 ) ) ( ON ?auto_127496 ?auto_127497 ) ( ON-TABLE ?auto_127500 ) ( ON ?auto_127498 ?auto_127500 ) ( ON ?auto_127499 ?auto_127498 ) ( not ( = ?auto_127500 ?auto_127498 ) ) ( not ( = ?auto_127500 ?auto_127499 ) ) ( not ( = ?auto_127500 ?auto_127497 ) ) ( not ( = ?auto_127500 ?auto_127496 ) ) ( not ( = ?auto_127498 ?auto_127499 ) ) ( not ( = ?auto_127498 ?auto_127497 ) ) ( not ( = ?auto_127498 ?auto_127496 ) ) ( not ( = ?auto_127493 ?auto_127500 ) ) ( not ( = ?auto_127493 ?auto_127498 ) ) ( not ( = ?auto_127494 ?auto_127500 ) ) ( not ( = ?auto_127494 ?auto_127498 ) ) ( not ( = ?auto_127495 ?auto_127500 ) ) ( not ( = ?auto_127495 ?auto_127498 ) ) ( ON ?auto_127495 ?auto_127496 ) ( CLEAR ?auto_127493 ) ( ON ?auto_127494 ?auto_127495 ) ( CLEAR ?auto_127494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127500 ?auto_127498 ?auto_127499 ?auto_127497 ?auto_127496 ?auto_127495 )
      ( MAKE-5PILE ?auto_127493 ?auto_127494 ?auto_127495 ?auto_127496 ?auto_127497 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127501 - BLOCK
      ?auto_127502 - BLOCK
      ?auto_127503 - BLOCK
      ?auto_127504 - BLOCK
      ?auto_127505 - BLOCK
    )
    :vars
    (
      ?auto_127507 - BLOCK
      ?auto_127508 - BLOCK
      ?auto_127506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127501 ?auto_127502 ) ) ( not ( = ?auto_127501 ?auto_127503 ) ) ( not ( = ?auto_127501 ?auto_127504 ) ) ( not ( = ?auto_127501 ?auto_127505 ) ) ( not ( = ?auto_127502 ?auto_127503 ) ) ( not ( = ?auto_127502 ?auto_127504 ) ) ( not ( = ?auto_127502 ?auto_127505 ) ) ( not ( = ?auto_127503 ?auto_127504 ) ) ( not ( = ?auto_127503 ?auto_127505 ) ) ( not ( = ?auto_127504 ?auto_127505 ) ) ( ON ?auto_127505 ?auto_127507 ) ( not ( = ?auto_127501 ?auto_127507 ) ) ( not ( = ?auto_127502 ?auto_127507 ) ) ( not ( = ?auto_127503 ?auto_127507 ) ) ( not ( = ?auto_127504 ?auto_127507 ) ) ( not ( = ?auto_127505 ?auto_127507 ) ) ( ON ?auto_127504 ?auto_127505 ) ( ON-TABLE ?auto_127508 ) ( ON ?auto_127506 ?auto_127508 ) ( ON ?auto_127507 ?auto_127506 ) ( not ( = ?auto_127508 ?auto_127506 ) ) ( not ( = ?auto_127508 ?auto_127507 ) ) ( not ( = ?auto_127508 ?auto_127505 ) ) ( not ( = ?auto_127508 ?auto_127504 ) ) ( not ( = ?auto_127506 ?auto_127507 ) ) ( not ( = ?auto_127506 ?auto_127505 ) ) ( not ( = ?auto_127506 ?auto_127504 ) ) ( not ( = ?auto_127501 ?auto_127508 ) ) ( not ( = ?auto_127501 ?auto_127506 ) ) ( not ( = ?auto_127502 ?auto_127508 ) ) ( not ( = ?auto_127502 ?auto_127506 ) ) ( not ( = ?auto_127503 ?auto_127508 ) ) ( not ( = ?auto_127503 ?auto_127506 ) ) ( ON ?auto_127503 ?auto_127504 ) ( ON ?auto_127502 ?auto_127503 ) ( CLEAR ?auto_127502 ) ( HOLDING ?auto_127501 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127501 )
      ( MAKE-5PILE ?auto_127501 ?auto_127502 ?auto_127503 ?auto_127504 ?auto_127505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_127509 - BLOCK
      ?auto_127510 - BLOCK
      ?auto_127511 - BLOCK
      ?auto_127512 - BLOCK
      ?auto_127513 - BLOCK
    )
    :vars
    (
      ?auto_127516 - BLOCK
      ?auto_127514 - BLOCK
      ?auto_127515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127509 ?auto_127510 ) ) ( not ( = ?auto_127509 ?auto_127511 ) ) ( not ( = ?auto_127509 ?auto_127512 ) ) ( not ( = ?auto_127509 ?auto_127513 ) ) ( not ( = ?auto_127510 ?auto_127511 ) ) ( not ( = ?auto_127510 ?auto_127512 ) ) ( not ( = ?auto_127510 ?auto_127513 ) ) ( not ( = ?auto_127511 ?auto_127512 ) ) ( not ( = ?auto_127511 ?auto_127513 ) ) ( not ( = ?auto_127512 ?auto_127513 ) ) ( ON ?auto_127513 ?auto_127516 ) ( not ( = ?auto_127509 ?auto_127516 ) ) ( not ( = ?auto_127510 ?auto_127516 ) ) ( not ( = ?auto_127511 ?auto_127516 ) ) ( not ( = ?auto_127512 ?auto_127516 ) ) ( not ( = ?auto_127513 ?auto_127516 ) ) ( ON ?auto_127512 ?auto_127513 ) ( ON-TABLE ?auto_127514 ) ( ON ?auto_127515 ?auto_127514 ) ( ON ?auto_127516 ?auto_127515 ) ( not ( = ?auto_127514 ?auto_127515 ) ) ( not ( = ?auto_127514 ?auto_127516 ) ) ( not ( = ?auto_127514 ?auto_127513 ) ) ( not ( = ?auto_127514 ?auto_127512 ) ) ( not ( = ?auto_127515 ?auto_127516 ) ) ( not ( = ?auto_127515 ?auto_127513 ) ) ( not ( = ?auto_127515 ?auto_127512 ) ) ( not ( = ?auto_127509 ?auto_127514 ) ) ( not ( = ?auto_127509 ?auto_127515 ) ) ( not ( = ?auto_127510 ?auto_127514 ) ) ( not ( = ?auto_127510 ?auto_127515 ) ) ( not ( = ?auto_127511 ?auto_127514 ) ) ( not ( = ?auto_127511 ?auto_127515 ) ) ( ON ?auto_127511 ?auto_127512 ) ( ON ?auto_127510 ?auto_127511 ) ( ON ?auto_127509 ?auto_127510 ) ( CLEAR ?auto_127509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127514 ?auto_127515 ?auto_127516 ?auto_127513 ?auto_127512 ?auto_127511 ?auto_127510 )
      ( MAKE-5PILE ?auto_127509 ?auto_127510 ?auto_127511 ?auto_127512 ?auto_127513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127519 - BLOCK
      ?auto_127520 - BLOCK
    )
    :vars
    (
      ?auto_127521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127521 ?auto_127520 ) ( CLEAR ?auto_127521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127519 ) ( ON ?auto_127520 ?auto_127519 ) ( not ( = ?auto_127519 ?auto_127520 ) ) ( not ( = ?auto_127519 ?auto_127521 ) ) ( not ( = ?auto_127520 ?auto_127521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127521 ?auto_127520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127522 - BLOCK
      ?auto_127523 - BLOCK
    )
    :vars
    (
      ?auto_127524 - BLOCK
      ?auto_127525 - BLOCK
      ?auto_127526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127524 ?auto_127523 ) ( CLEAR ?auto_127524 ) ( ON-TABLE ?auto_127522 ) ( ON ?auto_127523 ?auto_127522 ) ( not ( = ?auto_127522 ?auto_127523 ) ) ( not ( = ?auto_127522 ?auto_127524 ) ) ( not ( = ?auto_127523 ?auto_127524 ) ) ( HOLDING ?auto_127525 ) ( CLEAR ?auto_127526 ) ( not ( = ?auto_127522 ?auto_127525 ) ) ( not ( = ?auto_127522 ?auto_127526 ) ) ( not ( = ?auto_127523 ?auto_127525 ) ) ( not ( = ?auto_127523 ?auto_127526 ) ) ( not ( = ?auto_127524 ?auto_127525 ) ) ( not ( = ?auto_127524 ?auto_127526 ) ) ( not ( = ?auto_127525 ?auto_127526 ) ) )
    :subtasks
    ( ( !STACK ?auto_127525 ?auto_127526 )
      ( MAKE-2PILE ?auto_127522 ?auto_127523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127527 - BLOCK
      ?auto_127528 - BLOCK
    )
    :vars
    (
      ?auto_127530 - BLOCK
      ?auto_127529 - BLOCK
      ?auto_127531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127530 ?auto_127528 ) ( ON-TABLE ?auto_127527 ) ( ON ?auto_127528 ?auto_127527 ) ( not ( = ?auto_127527 ?auto_127528 ) ) ( not ( = ?auto_127527 ?auto_127530 ) ) ( not ( = ?auto_127528 ?auto_127530 ) ) ( CLEAR ?auto_127529 ) ( not ( = ?auto_127527 ?auto_127531 ) ) ( not ( = ?auto_127527 ?auto_127529 ) ) ( not ( = ?auto_127528 ?auto_127531 ) ) ( not ( = ?auto_127528 ?auto_127529 ) ) ( not ( = ?auto_127530 ?auto_127531 ) ) ( not ( = ?auto_127530 ?auto_127529 ) ) ( not ( = ?auto_127531 ?auto_127529 ) ) ( ON ?auto_127531 ?auto_127530 ) ( CLEAR ?auto_127531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127527 ?auto_127528 ?auto_127530 )
      ( MAKE-2PILE ?auto_127527 ?auto_127528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127532 - BLOCK
      ?auto_127533 - BLOCK
    )
    :vars
    (
      ?auto_127536 - BLOCK
      ?auto_127534 - BLOCK
      ?auto_127535 - BLOCK
      ?auto_127538 - BLOCK
      ?auto_127537 - BLOCK
      ?auto_127539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127536 ?auto_127533 ) ( ON-TABLE ?auto_127532 ) ( ON ?auto_127533 ?auto_127532 ) ( not ( = ?auto_127532 ?auto_127533 ) ) ( not ( = ?auto_127532 ?auto_127536 ) ) ( not ( = ?auto_127533 ?auto_127536 ) ) ( not ( = ?auto_127532 ?auto_127534 ) ) ( not ( = ?auto_127532 ?auto_127535 ) ) ( not ( = ?auto_127533 ?auto_127534 ) ) ( not ( = ?auto_127533 ?auto_127535 ) ) ( not ( = ?auto_127536 ?auto_127534 ) ) ( not ( = ?auto_127536 ?auto_127535 ) ) ( not ( = ?auto_127534 ?auto_127535 ) ) ( ON ?auto_127534 ?auto_127536 ) ( CLEAR ?auto_127534 ) ( HOLDING ?auto_127535 ) ( CLEAR ?auto_127538 ) ( ON-TABLE ?auto_127537 ) ( ON ?auto_127539 ?auto_127537 ) ( ON ?auto_127538 ?auto_127539 ) ( not ( = ?auto_127537 ?auto_127539 ) ) ( not ( = ?auto_127537 ?auto_127538 ) ) ( not ( = ?auto_127537 ?auto_127535 ) ) ( not ( = ?auto_127539 ?auto_127538 ) ) ( not ( = ?auto_127539 ?auto_127535 ) ) ( not ( = ?auto_127538 ?auto_127535 ) ) ( not ( = ?auto_127532 ?auto_127538 ) ) ( not ( = ?auto_127532 ?auto_127537 ) ) ( not ( = ?auto_127532 ?auto_127539 ) ) ( not ( = ?auto_127533 ?auto_127538 ) ) ( not ( = ?auto_127533 ?auto_127537 ) ) ( not ( = ?auto_127533 ?auto_127539 ) ) ( not ( = ?auto_127536 ?auto_127538 ) ) ( not ( = ?auto_127536 ?auto_127537 ) ) ( not ( = ?auto_127536 ?auto_127539 ) ) ( not ( = ?auto_127534 ?auto_127538 ) ) ( not ( = ?auto_127534 ?auto_127537 ) ) ( not ( = ?auto_127534 ?auto_127539 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127537 ?auto_127539 ?auto_127538 ?auto_127535 )
      ( MAKE-2PILE ?auto_127532 ?auto_127533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127540 - BLOCK
      ?auto_127541 - BLOCK
    )
    :vars
    (
      ?auto_127547 - BLOCK
      ?auto_127542 - BLOCK
      ?auto_127546 - BLOCK
      ?auto_127543 - BLOCK
      ?auto_127545 - BLOCK
      ?auto_127544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127547 ?auto_127541 ) ( ON-TABLE ?auto_127540 ) ( ON ?auto_127541 ?auto_127540 ) ( not ( = ?auto_127540 ?auto_127541 ) ) ( not ( = ?auto_127540 ?auto_127547 ) ) ( not ( = ?auto_127541 ?auto_127547 ) ) ( not ( = ?auto_127540 ?auto_127542 ) ) ( not ( = ?auto_127540 ?auto_127546 ) ) ( not ( = ?auto_127541 ?auto_127542 ) ) ( not ( = ?auto_127541 ?auto_127546 ) ) ( not ( = ?auto_127547 ?auto_127542 ) ) ( not ( = ?auto_127547 ?auto_127546 ) ) ( not ( = ?auto_127542 ?auto_127546 ) ) ( ON ?auto_127542 ?auto_127547 ) ( CLEAR ?auto_127543 ) ( ON-TABLE ?auto_127545 ) ( ON ?auto_127544 ?auto_127545 ) ( ON ?auto_127543 ?auto_127544 ) ( not ( = ?auto_127545 ?auto_127544 ) ) ( not ( = ?auto_127545 ?auto_127543 ) ) ( not ( = ?auto_127545 ?auto_127546 ) ) ( not ( = ?auto_127544 ?auto_127543 ) ) ( not ( = ?auto_127544 ?auto_127546 ) ) ( not ( = ?auto_127543 ?auto_127546 ) ) ( not ( = ?auto_127540 ?auto_127543 ) ) ( not ( = ?auto_127540 ?auto_127545 ) ) ( not ( = ?auto_127540 ?auto_127544 ) ) ( not ( = ?auto_127541 ?auto_127543 ) ) ( not ( = ?auto_127541 ?auto_127545 ) ) ( not ( = ?auto_127541 ?auto_127544 ) ) ( not ( = ?auto_127547 ?auto_127543 ) ) ( not ( = ?auto_127547 ?auto_127545 ) ) ( not ( = ?auto_127547 ?auto_127544 ) ) ( not ( = ?auto_127542 ?auto_127543 ) ) ( not ( = ?auto_127542 ?auto_127545 ) ) ( not ( = ?auto_127542 ?auto_127544 ) ) ( ON ?auto_127546 ?auto_127542 ) ( CLEAR ?auto_127546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127540 ?auto_127541 ?auto_127547 ?auto_127542 )
      ( MAKE-2PILE ?auto_127540 ?auto_127541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127548 - BLOCK
      ?auto_127549 - BLOCK
    )
    :vars
    (
      ?auto_127552 - BLOCK
      ?auto_127553 - BLOCK
      ?auto_127550 - BLOCK
      ?auto_127555 - BLOCK
      ?auto_127554 - BLOCK
      ?auto_127551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127552 ?auto_127549 ) ( ON-TABLE ?auto_127548 ) ( ON ?auto_127549 ?auto_127548 ) ( not ( = ?auto_127548 ?auto_127549 ) ) ( not ( = ?auto_127548 ?auto_127552 ) ) ( not ( = ?auto_127549 ?auto_127552 ) ) ( not ( = ?auto_127548 ?auto_127553 ) ) ( not ( = ?auto_127548 ?auto_127550 ) ) ( not ( = ?auto_127549 ?auto_127553 ) ) ( not ( = ?auto_127549 ?auto_127550 ) ) ( not ( = ?auto_127552 ?auto_127553 ) ) ( not ( = ?auto_127552 ?auto_127550 ) ) ( not ( = ?auto_127553 ?auto_127550 ) ) ( ON ?auto_127553 ?auto_127552 ) ( ON-TABLE ?auto_127555 ) ( ON ?auto_127554 ?auto_127555 ) ( not ( = ?auto_127555 ?auto_127554 ) ) ( not ( = ?auto_127555 ?auto_127551 ) ) ( not ( = ?auto_127555 ?auto_127550 ) ) ( not ( = ?auto_127554 ?auto_127551 ) ) ( not ( = ?auto_127554 ?auto_127550 ) ) ( not ( = ?auto_127551 ?auto_127550 ) ) ( not ( = ?auto_127548 ?auto_127551 ) ) ( not ( = ?auto_127548 ?auto_127555 ) ) ( not ( = ?auto_127548 ?auto_127554 ) ) ( not ( = ?auto_127549 ?auto_127551 ) ) ( not ( = ?auto_127549 ?auto_127555 ) ) ( not ( = ?auto_127549 ?auto_127554 ) ) ( not ( = ?auto_127552 ?auto_127551 ) ) ( not ( = ?auto_127552 ?auto_127555 ) ) ( not ( = ?auto_127552 ?auto_127554 ) ) ( not ( = ?auto_127553 ?auto_127551 ) ) ( not ( = ?auto_127553 ?auto_127555 ) ) ( not ( = ?auto_127553 ?auto_127554 ) ) ( ON ?auto_127550 ?auto_127553 ) ( CLEAR ?auto_127550 ) ( HOLDING ?auto_127551 ) ( CLEAR ?auto_127554 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127555 ?auto_127554 ?auto_127551 )
      ( MAKE-2PILE ?auto_127548 ?auto_127549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127556 - BLOCK
      ?auto_127557 - BLOCK
    )
    :vars
    (
      ?auto_127559 - BLOCK
      ?auto_127563 - BLOCK
      ?auto_127560 - BLOCK
      ?auto_127558 - BLOCK
      ?auto_127562 - BLOCK
      ?auto_127561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127559 ?auto_127557 ) ( ON-TABLE ?auto_127556 ) ( ON ?auto_127557 ?auto_127556 ) ( not ( = ?auto_127556 ?auto_127557 ) ) ( not ( = ?auto_127556 ?auto_127559 ) ) ( not ( = ?auto_127557 ?auto_127559 ) ) ( not ( = ?auto_127556 ?auto_127563 ) ) ( not ( = ?auto_127556 ?auto_127560 ) ) ( not ( = ?auto_127557 ?auto_127563 ) ) ( not ( = ?auto_127557 ?auto_127560 ) ) ( not ( = ?auto_127559 ?auto_127563 ) ) ( not ( = ?auto_127559 ?auto_127560 ) ) ( not ( = ?auto_127563 ?auto_127560 ) ) ( ON ?auto_127563 ?auto_127559 ) ( ON-TABLE ?auto_127558 ) ( ON ?auto_127562 ?auto_127558 ) ( not ( = ?auto_127558 ?auto_127562 ) ) ( not ( = ?auto_127558 ?auto_127561 ) ) ( not ( = ?auto_127558 ?auto_127560 ) ) ( not ( = ?auto_127562 ?auto_127561 ) ) ( not ( = ?auto_127562 ?auto_127560 ) ) ( not ( = ?auto_127561 ?auto_127560 ) ) ( not ( = ?auto_127556 ?auto_127561 ) ) ( not ( = ?auto_127556 ?auto_127558 ) ) ( not ( = ?auto_127556 ?auto_127562 ) ) ( not ( = ?auto_127557 ?auto_127561 ) ) ( not ( = ?auto_127557 ?auto_127558 ) ) ( not ( = ?auto_127557 ?auto_127562 ) ) ( not ( = ?auto_127559 ?auto_127561 ) ) ( not ( = ?auto_127559 ?auto_127558 ) ) ( not ( = ?auto_127559 ?auto_127562 ) ) ( not ( = ?auto_127563 ?auto_127561 ) ) ( not ( = ?auto_127563 ?auto_127558 ) ) ( not ( = ?auto_127563 ?auto_127562 ) ) ( ON ?auto_127560 ?auto_127563 ) ( CLEAR ?auto_127562 ) ( ON ?auto_127561 ?auto_127560 ) ( CLEAR ?auto_127561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127556 ?auto_127557 ?auto_127559 ?auto_127563 ?auto_127560 )
      ( MAKE-2PILE ?auto_127556 ?auto_127557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127564 - BLOCK
      ?auto_127565 - BLOCK
    )
    :vars
    (
      ?auto_127568 - BLOCK
      ?auto_127570 - BLOCK
      ?auto_127566 - BLOCK
      ?auto_127569 - BLOCK
      ?auto_127571 - BLOCK
      ?auto_127567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127568 ?auto_127565 ) ( ON-TABLE ?auto_127564 ) ( ON ?auto_127565 ?auto_127564 ) ( not ( = ?auto_127564 ?auto_127565 ) ) ( not ( = ?auto_127564 ?auto_127568 ) ) ( not ( = ?auto_127565 ?auto_127568 ) ) ( not ( = ?auto_127564 ?auto_127570 ) ) ( not ( = ?auto_127564 ?auto_127566 ) ) ( not ( = ?auto_127565 ?auto_127570 ) ) ( not ( = ?auto_127565 ?auto_127566 ) ) ( not ( = ?auto_127568 ?auto_127570 ) ) ( not ( = ?auto_127568 ?auto_127566 ) ) ( not ( = ?auto_127570 ?auto_127566 ) ) ( ON ?auto_127570 ?auto_127568 ) ( ON-TABLE ?auto_127569 ) ( not ( = ?auto_127569 ?auto_127571 ) ) ( not ( = ?auto_127569 ?auto_127567 ) ) ( not ( = ?auto_127569 ?auto_127566 ) ) ( not ( = ?auto_127571 ?auto_127567 ) ) ( not ( = ?auto_127571 ?auto_127566 ) ) ( not ( = ?auto_127567 ?auto_127566 ) ) ( not ( = ?auto_127564 ?auto_127567 ) ) ( not ( = ?auto_127564 ?auto_127569 ) ) ( not ( = ?auto_127564 ?auto_127571 ) ) ( not ( = ?auto_127565 ?auto_127567 ) ) ( not ( = ?auto_127565 ?auto_127569 ) ) ( not ( = ?auto_127565 ?auto_127571 ) ) ( not ( = ?auto_127568 ?auto_127567 ) ) ( not ( = ?auto_127568 ?auto_127569 ) ) ( not ( = ?auto_127568 ?auto_127571 ) ) ( not ( = ?auto_127570 ?auto_127567 ) ) ( not ( = ?auto_127570 ?auto_127569 ) ) ( not ( = ?auto_127570 ?auto_127571 ) ) ( ON ?auto_127566 ?auto_127570 ) ( ON ?auto_127567 ?auto_127566 ) ( CLEAR ?auto_127567 ) ( HOLDING ?auto_127571 ) ( CLEAR ?auto_127569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127569 ?auto_127571 )
      ( MAKE-2PILE ?auto_127564 ?auto_127565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127572 - BLOCK
      ?auto_127573 - BLOCK
    )
    :vars
    (
      ?auto_127577 - BLOCK
      ?auto_127574 - BLOCK
      ?auto_127575 - BLOCK
      ?auto_127579 - BLOCK
      ?auto_127576 - BLOCK
      ?auto_127578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127577 ?auto_127573 ) ( ON-TABLE ?auto_127572 ) ( ON ?auto_127573 ?auto_127572 ) ( not ( = ?auto_127572 ?auto_127573 ) ) ( not ( = ?auto_127572 ?auto_127577 ) ) ( not ( = ?auto_127573 ?auto_127577 ) ) ( not ( = ?auto_127572 ?auto_127574 ) ) ( not ( = ?auto_127572 ?auto_127575 ) ) ( not ( = ?auto_127573 ?auto_127574 ) ) ( not ( = ?auto_127573 ?auto_127575 ) ) ( not ( = ?auto_127577 ?auto_127574 ) ) ( not ( = ?auto_127577 ?auto_127575 ) ) ( not ( = ?auto_127574 ?auto_127575 ) ) ( ON ?auto_127574 ?auto_127577 ) ( ON-TABLE ?auto_127579 ) ( not ( = ?auto_127579 ?auto_127576 ) ) ( not ( = ?auto_127579 ?auto_127578 ) ) ( not ( = ?auto_127579 ?auto_127575 ) ) ( not ( = ?auto_127576 ?auto_127578 ) ) ( not ( = ?auto_127576 ?auto_127575 ) ) ( not ( = ?auto_127578 ?auto_127575 ) ) ( not ( = ?auto_127572 ?auto_127578 ) ) ( not ( = ?auto_127572 ?auto_127579 ) ) ( not ( = ?auto_127572 ?auto_127576 ) ) ( not ( = ?auto_127573 ?auto_127578 ) ) ( not ( = ?auto_127573 ?auto_127579 ) ) ( not ( = ?auto_127573 ?auto_127576 ) ) ( not ( = ?auto_127577 ?auto_127578 ) ) ( not ( = ?auto_127577 ?auto_127579 ) ) ( not ( = ?auto_127577 ?auto_127576 ) ) ( not ( = ?auto_127574 ?auto_127578 ) ) ( not ( = ?auto_127574 ?auto_127579 ) ) ( not ( = ?auto_127574 ?auto_127576 ) ) ( ON ?auto_127575 ?auto_127574 ) ( ON ?auto_127578 ?auto_127575 ) ( CLEAR ?auto_127579 ) ( ON ?auto_127576 ?auto_127578 ) ( CLEAR ?auto_127576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127572 ?auto_127573 ?auto_127577 ?auto_127574 ?auto_127575 ?auto_127578 )
      ( MAKE-2PILE ?auto_127572 ?auto_127573 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127580 - BLOCK
      ?auto_127581 - BLOCK
    )
    :vars
    (
      ?auto_127586 - BLOCK
      ?auto_127583 - BLOCK
      ?auto_127582 - BLOCK
      ?auto_127585 - BLOCK
      ?auto_127587 - BLOCK
      ?auto_127584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127586 ?auto_127581 ) ( ON-TABLE ?auto_127580 ) ( ON ?auto_127581 ?auto_127580 ) ( not ( = ?auto_127580 ?auto_127581 ) ) ( not ( = ?auto_127580 ?auto_127586 ) ) ( not ( = ?auto_127581 ?auto_127586 ) ) ( not ( = ?auto_127580 ?auto_127583 ) ) ( not ( = ?auto_127580 ?auto_127582 ) ) ( not ( = ?auto_127581 ?auto_127583 ) ) ( not ( = ?auto_127581 ?auto_127582 ) ) ( not ( = ?auto_127586 ?auto_127583 ) ) ( not ( = ?auto_127586 ?auto_127582 ) ) ( not ( = ?auto_127583 ?auto_127582 ) ) ( ON ?auto_127583 ?auto_127586 ) ( not ( = ?auto_127585 ?auto_127587 ) ) ( not ( = ?auto_127585 ?auto_127584 ) ) ( not ( = ?auto_127585 ?auto_127582 ) ) ( not ( = ?auto_127587 ?auto_127584 ) ) ( not ( = ?auto_127587 ?auto_127582 ) ) ( not ( = ?auto_127584 ?auto_127582 ) ) ( not ( = ?auto_127580 ?auto_127584 ) ) ( not ( = ?auto_127580 ?auto_127585 ) ) ( not ( = ?auto_127580 ?auto_127587 ) ) ( not ( = ?auto_127581 ?auto_127584 ) ) ( not ( = ?auto_127581 ?auto_127585 ) ) ( not ( = ?auto_127581 ?auto_127587 ) ) ( not ( = ?auto_127586 ?auto_127584 ) ) ( not ( = ?auto_127586 ?auto_127585 ) ) ( not ( = ?auto_127586 ?auto_127587 ) ) ( not ( = ?auto_127583 ?auto_127584 ) ) ( not ( = ?auto_127583 ?auto_127585 ) ) ( not ( = ?auto_127583 ?auto_127587 ) ) ( ON ?auto_127582 ?auto_127583 ) ( ON ?auto_127584 ?auto_127582 ) ( ON ?auto_127587 ?auto_127584 ) ( CLEAR ?auto_127587 ) ( HOLDING ?auto_127585 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127585 )
      ( MAKE-2PILE ?auto_127580 ?auto_127581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_127588 - BLOCK
      ?auto_127589 - BLOCK
    )
    :vars
    (
      ?auto_127590 - BLOCK
      ?auto_127595 - BLOCK
      ?auto_127591 - BLOCK
      ?auto_127592 - BLOCK
      ?auto_127593 - BLOCK
      ?auto_127594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127590 ?auto_127589 ) ( ON-TABLE ?auto_127588 ) ( ON ?auto_127589 ?auto_127588 ) ( not ( = ?auto_127588 ?auto_127589 ) ) ( not ( = ?auto_127588 ?auto_127590 ) ) ( not ( = ?auto_127589 ?auto_127590 ) ) ( not ( = ?auto_127588 ?auto_127595 ) ) ( not ( = ?auto_127588 ?auto_127591 ) ) ( not ( = ?auto_127589 ?auto_127595 ) ) ( not ( = ?auto_127589 ?auto_127591 ) ) ( not ( = ?auto_127590 ?auto_127595 ) ) ( not ( = ?auto_127590 ?auto_127591 ) ) ( not ( = ?auto_127595 ?auto_127591 ) ) ( ON ?auto_127595 ?auto_127590 ) ( not ( = ?auto_127592 ?auto_127593 ) ) ( not ( = ?auto_127592 ?auto_127594 ) ) ( not ( = ?auto_127592 ?auto_127591 ) ) ( not ( = ?auto_127593 ?auto_127594 ) ) ( not ( = ?auto_127593 ?auto_127591 ) ) ( not ( = ?auto_127594 ?auto_127591 ) ) ( not ( = ?auto_127588 ?auto_127594 ) ) ( not ( = ?auto_127588 ?auto_127592 ) ) ( not ( = ?auto_127588 ?auto_127593 ) ) ( not ( = ?auto_127589 ?auto_127594 ) ) ( not ( = ?auto_127589 ?auto_127592 ) ) ( not ( = ?auto_127589 ?auto_127593 ) ) ( not ( = ?auto_127590 ?auto_127594 ) ) ( not ( = ?auto_127590 ?auto_127592 ) ) ( not ( = ?auto_127590 ?auto_127593 ) ) ( not ( = ?auto_127595 ?auto_127594 ) ) ( not ( = ?auto_127595 ?auto_127592 ) ) ( not ( = ?auto_127595 ?auto_127593 ) ) ( ON ?auto_127591 ?auto_127595 ) ( ON ?auto_127594 ?auto_127591 ) ( ON ?auto_127593 ?auto_127594 ) ( ON ?auto_127592 ?auto_127593 ) ( CLEAR ?auto_127592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127588 ?auto_127589 ?auto_127590 ?auto_127595 ?auto_127591 ?auto_127594 ?auto_127593 )
      ( MAKE-2PILE ?auto_127588 ?auto_127589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127602 - BLOCK
      ?auto_127603 - BLOCK
      ?auto_127604 - BLOCK
      ?auto_127605 - BLOCK
      ?auto_127606 - BLOCK
      ?auto_127607 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_127607 ) ( CLEAR ?auto_127606 ) ( ON-TABLE ?auto_127602 ) ( ON ?auto_127603 ?auto_127602 ) ( ON ?auto_127604 ?auto_127603 ) ( ON ?auto_127605 ?auto_127604 ) ( ON ?auto_127606 ?auto_127605 ) ( not ( = ?auto_127602 ?auto_127603 ) ) ( not ( = ?auto_127602 ?auto_127604 ) ) ( not ( = ?auto_127602 ?auto_127605 ) ) ( not ( = ?auto_127602 ?auto_127606 ) ) ( not ( = ?auto_127602 ?auto_127607 ) ) ( not ( = ?auto_127603 ?auto_127604 ) ) ( not ( = ?auto_127603 ?auto_127605 ) ) ( not ( = ?auto_127603 ?auto_127606 ) ) ( not ( = ?auto_127603 ?auto_127607 ) ) ( not ( = ?auto_127604 ?auto_127605 ) ) ( not ( = ?auto_127604 ?auto_127606 ) ) ( not ( = ?auto_127604 ?auto_127607 ) ) ( not ( = ?auto_127605 ?auto_127606 ) ) ( not ( = ?auto_127605 ?auto_127607 ) ) ( not ( = ?auto_127606 ?auto_127607 ) ) )
    :subtasks
    ( ( !STACK ?auto_127607 ?auto_127606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127608 - BLOCK
      ?auto_127609 - BLOCK
      ?auto_127610 - BLOCK
      ?auto_127611 - BLOCK
      ?auto_127612 - BLOCK
      ?auto_127613 - BLOCK
    )
    :vars
    (
      ?auto_127614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127612 ) ( ON-TABLE ?auto_127608 ) ( ON ?auto_127609 ?auto_127608 ) ( ON ?auto_127610 ?auto_127609 ) ( ON ?auto_127611 ?auto_127610 ) ( ON ?auto_127612 ?auto_127611 ) ( not ( = ?auto_127608 ?auto_127609 ) ) ( not ( = ?auto_127608 ?auto_127610 ) ) ( not ( = ?auto_127608 ?auto_127611 ) ) ( not ( = ?auto_127608 ?auto_127612 ) ) ( not ( = ?auto_127608 ?auto_127613 ) ) ( not ( = ?auto_127609 ?auto_127610 ) ) ( not ( = ?auto_127609 ?auto_127611 ) ) ( not ( = ?auto_127609 ?auto_127612 ) ) ( not ( = ?auto_127609 ?auto_127613 ) ) ( not ( = ?auto_127610 ?auto_127611 ) ) ( not ( = ?auto_127610 ?auto_127612 ) ) ( not ( = ?auto_127610 ?auto_127613 ) ) ( not ( = ?auto_127611 ?auto_127612 ) ) ( not ( = ?auto_127611 ?auto_127613 ) ) ( not ( = ?auto_127612 ?auto_127613 ) ) ( ON ?auto_127613 ?auto_127614 ) ( CLEAR ?auto_127613 ) ( HAND-EMPTY ) ( not ( = ?auto_127608 ?auto_127614 ) ) ( not ( = ?auto_127609 ?auto_127614 ) ) ( not ( = ?auto_127610 ?auto_127614 ) ) ( not ( = ?auto_127611 ?auto_127614 ) ) ( not ( = ?auto_127612 ?auto_127614 ) ) ( not ( = ?auto_127613 ?auto_127614 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127613 ?auto_127614 )
      ( MAKE-6PILE ?auto_127608 ?auto_127609 ?auto_127610 ?auto_127611 ?auto_127612 ?auto_127613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127615 - BLOCK
      ?auto_127616 - BLOCK
      ?auto_127617 - BLOCK
      ?auto_127618 - BLOCK
      ?auto_127619 - BLOCK
      ?auto_127620 - BLOCK
    )
    :vars
    (
      ?auto_127621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127615 ) ( ON ?auto_127616 ?auto_127615 ) ( ON ?auto_127617 ?auto_127616 ) ( ON ?auto_127618 ?auto_127617 ) ( not ( = ?auto_127615 ?auto_127616 ) ) ( not ( = ?auto_127615 ?auto_127617 ) ) ( not ( = ?auto_127615 ?auto_127618 ) ) ( not ( = ?auto_127615 ?auto_127619 ) ) ( not ( = ?auto_127615 ?auto_127620 ) ) ( not ( = ?auto_127616 ?auto_127617 ) ) ( not ( = ?auto_127616 ?auto_127618 ) ) ( not ( = ?auto_127616 ?auto_127619 ) ) ( not ( = ?auto_127616 ?auto_127620 ) ) ( not ( = ?auto_127617 ?auto_127618 ) ) ( not ( = ?auto_127617 ?auto_127619 ) ) ( not ( = ?auto_127617 ?auto_127620 ) ) ( not ( = ?auto_127618 ?auto_127619 ) ) ( not ( = ?auto_127618 ?auto_127620 ) ) ( not ( = ?auto_127619 ?auto_127620 ) ) ( ON ?auto_127620 ?auto_127621 ) ( CLEAR ?auto_127620 ) ( not ( = ?auto_127615 ?auto_127621 ) ) ( not ( = ?auto_127616 ?auto_127621 ) ) ( not ( = ?auto_127617 ?auto_127621 ) ) ( not ( = ?auto_127618 ?auto_127621 ) ) ( not ( = ?auto_127619 ?auto_127621 ) ) ( not ( = ?auto_127620 ?auto_127621 ) ) ( HOLDING ?auto_127619 ) ( CLEAR ?auto_127618 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127615 ?auto_127616 ?auto_127617 ?auto_127618 ?auto_127619 )
      ( MAKE-6PILE ?auto_127615 ?auto_127616 ?auto_127617 ?auto_127618 ?auto_127619 ?auto_127620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127622 - BLOCK
      ?auto_127623 - BLOCK
      ?auto_127624 - BLOCK
      ?auto_127625 - BLOCK
      ?auto_127626 - BLOCK
      ?auto_127627 - BLOCK
    )
    :vars
    (
      ?auto_127628 - BLOCK
      ?auto_127629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127622 ) ( ON ?auto_127623 ?auto_127622 ) ( ON ?auto_127624 ?auto_127623 ) ( ON ?auto_127625 ?auto_127624 ) ( not ( = ?auto_127622 ?auto_127623 ) ) ( not ( = ?auto_127622 ?auto_127624 ) ) ( not ( = ?auto_127622 ?auto_127625 ) ) ( not ( = ?auto_127622 ?auto_127626 ) ) ( not ( = ?auto_127622 ?auto_127627 ) ) ( not ( = ?auto_127623 ?auto_127624 ) ) ( not ( = ?auto_127623 ?auto_127625 ) ) ( not ( = ?auto_127623 ?auto_127626 ) ) ( not ( = ?auto_127623 ?auto_127627 ) ) ( not ( = ?auto_127624 ?auto_127625 ) ) ( not ( = ?auto_127624 ?auto_127626 ) ) ( not ( = ?auto_127624 ?auto_127627 ) ) ( not ( = ?auto_127625 ?auto_127626 ) ) ( not ( = ?auto_127625 ?auto_127627 ) ) ( not ( = ?auto_127626 ?auto_127627 ) ) ( ON ?auto_127627 ?auto_127628 ) ( not ( = ?auto_127622 ?auto_127628 ) ) ( not ( = ?auto_127623 ?auto_127628 ) ) ( not ( = ?auto_127624 ?auto_127628 ) ) ( not ( = ?auto_127625 ?auto_127628 ) ) ( not ( = ?auto_127626 ?auto_127628 ) ) ( not ( = ?auto_127627 ?auto_127628 ) ) ( CLEAR ?auto_127625 ) ( ON ?auto_127626 ?auto_127627 ) ( CLEAR ?auto_127626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127629 ) ( ON ?auto_127628 ?auto_127629 ) ( not ( = ?auto_127629 ?auto_127628 ) ) ( not ( = ?auto_127629 ?auto_127627 ) ) ( not ( = ?auto_127629 ?auto_127626 ) ) ( not ( = ?auto_127622 ?auto_127629 ) ) ( not ( = ?auto_127623 ?auto_127629 ) ) ( not ( = ?auto_127624 ?auto_127629 ) ) ( not ( = ?auto_127625 ?auto_127629 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127629 ?auto_127628 ?auto_127627 )
      ( MAKE-6PILE ?auto_127622 ?auto_127623 ?auto_127624 ?auto_127625 ?auto_127626 ?auto_127627 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127630 - BLOCK
      ?auto_127631 - BLOCK
      ?auto_127632 - BLOCK
      ?auto_127633 - BLOCK
      ?auto_127634 - BLOCK
      ?auto_127635 - BLOCK
    )
    :vars
    (
      ?auto_127636 - BLOCK
      ?auto_127637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127630 ) ( ON ?auto_127631 ?auto_127630 ) ( ON ?auto_127632 ?auto_127631 ) ( not ( = ?auto_127630 ?auto_127631 ) ) ( not ( = ?auto_127630 ?auto_127632 ) ) ( not ( = ?auto_127630 ?auto_127633 ) ) ( not ( = ?auto_127630 ?auto_127634 ) ) ( not ( = ?auto_127630 ?auto_127635 ) ) ( not ( = ?auto_127631 ?auto_127632 ) ) ( not ( = ?auto_127631 ?auto_127633 ) ) ( not ( = ?auto_127631 ?auto_127634 ) ) ( not ( = ?auto_127631 ?auto_127635 ) ) ( not ( = ?auto_127632 ?auto_127633 ) ) ( not ( = ?auto_127632 ?auto_127634 ) ) ( not ( = ?auto_127632 ?auto_127635 ) ) ( not ( = ?auto_127633 ?auto_127634 ) ) ( not ( = ?auto_127633 ?auto_127635 ) ) ( not ( = ?auto_127634 ?auto_127635 ) ) ( ON ?auto_127635 ?auto_127636 ) ( not ( = ?auto_127630 ?auto_127636 ) ) ( not ( = ?auto_127631 ?auto_127636 ) ) ( not ( = ?auto_127632 ?auto_127636 ) ) ( not ( = ?auto_127633 ?auto_127636 ) ) ( not ( = ?auto_127634 ?auto_127636 ) ) ( not ( = ?auto_127635 ?auto_127636 ) ) ( ON ?auto_127634 ?auto_127635 ) ( CLEAR ?auto_127634 ) ( ON-TABLE ?auto_127637 ) ( ON ?auto_127636 ?auto_127637 ) ( not ( = ?auto_127637 ?auto_127636 ) ) ( not ( = ?auto_127637 ?auto_127635 ) ) ( not ( = ?auto_127637 ?auto_127634 ) ) ( not ( = ?auto_127630 ?auto_127637 ) ) ( not ( = ?auto_127631 ?auto_127637 ) ) ( not ( = ?auto_127632 ?auto_127637 ) ) ( not ( = ?auto_127633 ?auto_127637 ) ) ( HOLDING ?auto_127633 ) ( CLEAR ?auto_127632 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127630 ?auto_127631 ?auto_127632 ?auto_127633 )
      ( MAKE-6PILE ?auto_127630 ?auto_127631 ?auto_127632 ?auto_127633 ?auto_127634 ?auto_127635 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127638 - BLOCK
      ?auto_127639 - BLOCK
      ?auto_127640 - BLOCK
      ?auto_127641 - BLOCK
      ?auto_127642 - BLOCK
      ?auto_127643 - BLOCK
    )
    :vars
    (
      ?auto_127645 - BLOCK
      ?auto_127644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127638 ) ( ON ?auto_127639 ?auto_127638 ) ( ON ?auto_127640 ?auto_127639 ) ( not ( = ?auto_127638 ?auto_127639 ) ) ( not ( = ?auto_127638 ?auto_127640 ) ) ( not ( = ?auto_127638 ?auto_127641 ) ) ( not ( = ?auto_127638 ?auto_127642 ) ) ( not ( = ?auto_127638 ?auto_127643 ) ) ( not ( = ?auto_127639 ?auto_127640 ) ) ( not ( = ?auto_127639 ?auto_127641 ) ) ( not ( = ?auto_127639 ?auto_127642 ) ) ( not ( = ?auto_127639 ?auto_127643 ) ) ( not ( = ?auto_127640 ?auto_127641 ) ) ( not ( = ?auto_127640 ?auto_127642 ) ) ( not ( = ?auto_127640 ?auto_127643 ) ) ( not ( = ?auto_127641 ?auto_127642 ) ) ( not ( = ?auto_127641 ?auto_127643 ) ) ( not ( = ?auto_127642 ?auto_127643 ) ) ( ON ?auto_127643 ?auto_127645 ) ( not ( = ?auto_127638 ?auto_127645 ) ) ( not ( = ?auto_127639 ?auto_127645 ) ) ( not ( = ?auto_127640 ?auto_127645 ) ) ( not ( = ?auto_127641 ?auto_127645 ) ) ( not ( = ?auto_127642 ?auto_127645 ) ) ( not ( = ?auto_127643 ?auto_127645 ) ) ( ON ?auto_127642 ?auto_127643 ) ( ON-TABLE ?auto_127644 ) ( ON ?auto_127645 ?auto_127644 ) ( not ( = ?auto_127644 ?auto_127645 ) ) ( not ( = ?auto_127644 ?auto_127643 ) ) ( not ( = ?auto_127644 ?auto_127642 ) ) ( not ( = ?auto_127638 ?auto_127644 ) ) ( not ( = ?auto_127639 ?auto_127644 ) ) ( not ( = ?auto_127640 ?auto_127644 ) ) ( not ( = ?auto_127641 ?auto_127644 ) ) ( CLEAR ?auto_127640 ) ( ON ?auto_127641 ?auto_127642 ) ( CLEAR ?auto_127641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127644 ?auto_127645 ?auto_127643 ?auto_127642 )
      ( MAKE-6PILE ?auto_127638 ?auto_127639 ?auto_127640 ?auto_127641 ?auto_127642 ?auto_127643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127646 - BLOCK
      ?auto_127647 - BLOCK
      ?auto_127648 - BLOCK
      ?auto_127649 - BLOCK
      ?auto_127650 - BLOCK
      ?auto_127651 - BLOCK
    )
    :vars
    (
      ?auto_127652 - BLOCK
      ?auto_127653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127646 ) ( ON ?auto_127647 ?auto_127646 ) ( not ( = ?auto_127646 ?auto_127647 ) ) ( not ( = ?auto_127646 ?auto_127648 ) ) ( not ( = ?auto_127646 ?auto_127649 ) ) ( not ( = ?auto_127646 ?auto_127650 ) ) ( not ( = ?auto_127646 ?auto_127651 ) ) ( not ( = ?auto_127647 ?auto_127648 ) ) ( not ( = ?auto_127647 ?auto_127649 ) ) ( not ( = ?auto_127647 ?auto_127650 ) ) ( not ( = ?auto_127647 ?auto_127651 ) ) ( not ( = ?auto_127648 ?auto_127649 ) ) ( not ( = ?auto_127648 ?auto_127650 ) ) ( not ( = ?auto_127648 ?auto_127651 ) ) ( not ( = ?auto_127649 ?auto_127650 ) ) ( not ( = ?auto_127649 ?auto_127651 ) ) ( not ( = ?auto_127650 ?auto_127651 ) ) ( ON ?auto_127651 ?auto_127652 ) ( not ( = ?auto_127646 ?auto_127652 ) ) ( not ( = ?auto_127647 ?auto_127652 ) ) ( not ( = ?auto_127648 ?auto_127652 ) ) ( not ( = ?auto_127649 ?auto_127652 ) ) ( not ( = ?auto_127650 ?auto_127652 ) ) ( not ( = ?auto_127651 ?auto_127652 ) ) ( ON ?auto_127650 ?auto_127651 ) ( ON-TABLE ?auto_127653 ) ( ON ?auto_127652 ?auto_127653 ) ( not ( = ?auto_127653 ?auto_127652 ) ) ( not ( = ?auto_127653 ?auto_127651 ) ) ( not ( = ?auto_127653 ?auto_127650 ) ) ( not ( = ?auto_127646 ?auto_127653 ) ) ( not ( = ?auto_127647 ?auto_127653 ) ) ( not ( = ?auto_127648 ?auto_127653 ) ) ( not ( = ?auto_127649 ?auto_127653 ) ) ( ON ?auto_127649 ?auto_127650 ) ( CLEAR ?auto_127649 ) ( HOLDING ?auto_127648 ) ( CLEAR ?auto_127647 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127646 ?auto_127647 ?auto_127648 )
      ( MAKE-6PILE ?auto_127646 ?auto_127647 ?auto_127648 ?auto_127649 ?auto_127650 ?auto_127651 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127654 - BLOCK
      ?auto_127655 - BLOCK
      ?auto_127656 - BLOCK
      ?auto_127657 - BLOCK
      ?auto_127658 - BLOCK
      ?auto_127659 - BLOCK
    )
    :vars
    (
      ?auto_127660 - BLOCK
      ?auto_127661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127654 ) ( ON ?auto_127655 ?auto_127654 ) ( not ( = ?auto_127654 ?auto_127655 ) ) ( not ( = ?auto_127654 ?auto_127656 ) ) ( not ( = ?auto_127654 ?auto_127657 ) ) ( not ( = ?auto_127654 ?auto_127658 ) ) ( not ( = ?auto_127654 ?auto_127659 ) ) ( not ( = ?auto_127655 ?auto_127656 ) ) ( not ( = ?auto_127655 ?auto_127657 ) ) ( not ( = ?auto_127655 ?auto_127658 ) ) ( not ( = ?auto_127655 ?auto_127659 ) ) ( not ( = ?auto_127656 ?auto_127657 ) ) ( not ( = ?auto_127656 ?auto_127658 ) ) ( not ( = ?auto_127656 ?auto_127659 ) ) ( not ( = ?auto_127657 ?auto_127658 ) ) ( not ( = ?auto_127657 ?auto_127659 ) ) ( not ( = ?auto_127658 ?auto_127659 ) ) ( ON ?auto_127659 ?auto_127660 ) ( not ( = ?auto_127654 ?auto_127660 ) ) ( not ( = ?auto_127655 ?auto_127660 ) ) ( not ( = ?auto_127656 ?auto_127660 ) ) ( not ( = ?auto_127657 ?auto_127660 ) ) ( not ( = ?auto_127658 ?auto_127660 ) ) ( not ( = ?auto_127659 ?auto_127660 ) ) ( ON ?auto_127658 ?auto_127659 ) ( ON-TABLE ?auto_127661 ) ( ON ?auto_127660 ?auto_127661 ) ( not ( = ?auto_127661 ?auto_127660 ) ) ( not ( = ?auto_127661 ?auto_127659 ) ) ( not ( = ?auto_127661 ?auto_127658 ) ) ( not ( = ?auto_127654 ?auto_127661 ) ) ( not ( = ?auto_127655 ?auto_127661 ) ) ( not ( = ?auto_127656 ?auto_127661 ) ) ( not ( = ?auto_127657 ?auto_127661 ) ) ( ON ?auto_127657 ?auto_127658 ) ( CLEAR ?auto_127655 ) ( ON ?auto_127656 ?auto_127657 ) ( CLEAR ?auto_127656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127661 ?auto_127660 ?auto_127659 ?auto_127658 ?auto_127657 )
      ( MAKE-6PILE ?auto_127654 ?auto_127655 ?auto_127656 ?auto_127657 ?auto_127658 ?auto_127659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127662 - BLOCK
      ?auto_127663 - BLOCK
      ?auto_127664 - BLOCK
      ?auto_127665 - BLOCK
      ?auto_127666 - BLOCK
      ?auto_127667 - BLOCK
    )
    :vars
    (
      ?auto_127668 - BLOCK
      ?auto_127669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127662 ) ( not ( = ?auto_127662 ?auto_127663 ) ) ( not ( = ?auto_127662 ?auto_127664 ) ) ( not ( = ?auto_127662 ?auto_127665 ) ) ( not ( = ?auto_127662 ?auto_127666 ) ) ( not ( = ?auto_127662 ?auto_127667 ) ) ( not ( = ?auto_127663 ?auto_127664 ) ) ( not ( = ?auto_127663 ?auto_127665 ) ) ( not ( = ?auto_127663 ?auto_127666 ) ) ( not ( = ?auto_127663 ?auto_127667 ) ) ( not ( = ?auto_127664 ?auto_127665 ) ) ( not ( = ?auto_127664 ?auto_127666 ) ) ( not ( = ?auto_127664 ?auto_127667 ) ) ( not ( = ?auto_127665 ?auto_127666 ) ) ( not ( = ?auto_127665 ?auto_127667 ) ) ( not ( = ?auto_127666 ?auto_127667 ) ) ( ON ?auto_127667 ?auto_127668 ) ( not ( = ?auto_127662 ?auto_127668 ) ) ( not ( = ?auto_127663 ?auto_127668 ) ) ( not ( = ?auto_127664 ?auto_127668 ) ) ( not ( = ?auto_127665 ?auto_127668 ) ) ( not ( = ?auto_127666 ?auto_127668 ) ) ( not ( = ?auto_127667 ?auto_127668 ) ) ( ON ?auto_127666 ?auto_127667 ) ( ON-TABLE ?auto_127669 ) ( ON ?auto_127668 ?auto_127669 ) ( not ( = ?auto_127669 ?auto_127668 ) ) ( not ( = ?auto_127669 ?auto_127667 ) ) ( not ( = ?auto_127669 ?auto_127666 ) ) ( not ( = ?auto_127662 ?auto_127669 ) ) ( not ( = ?auto_127663 ?auto_127669 ) ) ( not ( = ?auto_127664 ?auto_127669 ) ) ( not ( = ?auto_127665 ?auto_127669 ) ) ( ON ?auto_127665 ?auto_127666 ) ( ON ?auto_127664 ?auto_127665 ) ( CLEAR ?auto_127664 ) ( HOLDING ?auto_127663 ) ( CLEAR ?auto_127662 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127662 ?auto_127663 )
      ( MAKE-6PILE ?auto_127662 ?auto_127663 ?auto_127664 ?auto_127665 ?auto_127666 ?auto_127667 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127670 - BLOCK
      ?auto_127671 - BLOCK
      ?auto_127672 - BLOCK
      ?auto_127673 - BLOCK
      ?auto_127674 - BLOCK
      ?auto_127675 - BLOCK
    )
    :vars
    (
      ?auto_127677 - BLOCK
      ?auto_127676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127670 ) ( not ( = ?auto_127670 ?auto_127671 ) ) ( not ( = ?auto_127670 ?auto_127672 ) ) ( not ( = ?auto_127670 ?auto_127673 ) ) ( not ( = ?auto_127670 ?auto_127674 ) ) ( not ( = ?auto_127670 ?auto_127675 ) ) ( not ( = ?auto_127671 ?auto_127672 ) ) ( not ( = ?auto_127671 ?auto_127673 ) ) ( not ( = ?auto_127671 ?auto_127674 ) ) ( not ( = ?auto_127671 ?auto_127675 ) ) ( not ( = ?auto_127672 ?auto_127673 ) ) ( not ( = ?auto_127672 ?auto_127674 ) ) ( not ( = ?auto_127672 ?auto_127675 ) ) ( not ( = ?auto_127673 ?auto_127674 ) ) ( not ( = ?auto_127673 ?auto_127675 ) ) ( not ( = ?auto_127674 ?auto_127675 ) ) ( ON ?auto_127675 ?auto_127677 ) ( not ( = ?auto_127670 ?auto_127677 ) ) ( not ( = ?auto_127671 ?auto_127677 ) ) ( not ( = ?auto_127672 ?auto_127677 ) ) ( not ( = ?auto_127673 ?auto_127677 ) ) ( not ( = ?auto_127674 ?auto_127677 ) ) ( not ( = ?auto_127675 ?auto_127677 ) ) ( ON ?auto_127674 ?auto_127675 ) ( ON-TABLE ?auto_127676 ) ( ON ?auto_127677 ?auto_127676 ) ( not ( = ?auto_127676 ?auto_127677 ) ) ( not ( = ?auto_127676 ?auto_127675 ) ) ( not ( = ?auto_127676 ?auto_127674 ) ) ( not ( = ?auto_127670 ?auto_127676 ) ) ( not ( = ?auto_127671 ?auto_127676 ) ) ( not ( = ?auto_127672 ?auto_127676 ) ) ( not ( = ?auto_127673 ?auto_127676 ) ) ( ON ?auto_127673 ?auto_127674 ) ( ON ?auto_127672 ?auto_127673 ) ( CLEAR ?auto_127670 ) ( ON ?auto_127671 ?auto_127672 ) ( CLEAR ?auto_127671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127676 ?auto_127677 ?auto_127675 ?auto_127674 ?auto_127673 ?auto_127672 )
      ( MAKE-6PILE ?auto_127670 ?auto_127671 ?auto_127672 ?auto_127673 ?auto_127674 ?auto_127675 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127678 - BLOCK
      ?auto_127679 - BLOCK
      ?auto_127680 - BLOCK
      ?auto_127681 - BLOCK
      ?auto_127682 - BLOCK
      ?auto_127683 - BLOCK
    )
    :vars
    (
      ?auto_127684 - BLOCK
      ?auto_127685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127678 ?auto_127679 ) ) ( not ( = ?auto_127678 ?auto_127680 ) ) ( not ( = ?auto_127678 ?auto_127681 ) ) ( not ( = ?auto_127678 ?auto_127682 ) ) ( not ( = ?auto_127678 ?auto_127683 ) ) ( not ( = ?auto_127679 ?auto_127680 ) ) ( not ( = ?auto_127679 ?auto_127681 ) ) ( not ( = ?auto_127679 ?auto_127682 ) ) ( not ( = ?auto_127679 ?auto_127683 ) ) ( not ( = ?auto_127680 ?auto_127681 ) ) ( not ( = ?auto_127680 ?auto_127682 ) ) ( not ( = ?auto_127680 ?auto_127683 ) ) ( not ( = ?auto_127681 ?auto_127682 ) ) ( not ( = ?auto_127681 ?auto_127683 ) ) ( not ( = ?auto_127682 ?auto_127683 ) ) ( ON ?auto_127683 ?auto_127684 ) ( not ( = ?auto_127678 ?auto_127684 ) ) ( not ( = ?auto_127679 ?auto_127684 ) ) ( not ( = ?auto_127680 ?auto_127684 ) ) ( not ( = ?auto_127681 ?auto_127684 ) ) ( not ( = ?auto_127682 ?auto_127684 ) ) ( not ( = ?auto_127683 ?auto_127684 ) ) ( ON ?auto_127682 ?auto_127683 ) ( ON-TABLE ?auto_127685 ) ( ON ?auto_127684 ?auto_127685 ) ( not ( = ?auto_127685 ?auto_127684 ) ) ( not ( = ?auto_127685 ?auto_127683 ) ) ( not ( = ?auto_127685 ?auto_127682 ) ) ( not ( = ?auto_127678 ?auto_127685 ) ) ( not ( = ?auto_127679 ?auto_127685 ) ) ( not ( = ?auto_127680 ?auto_127685 ) ) ( not ( = ?auto_127681 ?auto_127685 ) ) ( ON ?auto_127681 ?auto_127682 ) ( ON ?auto_127680 ?auto_127681 ) ( ON ?auto_127679 ?auto_127680 ) ( CLEAR ?auto_127679 ) ( HOLDING ?auto_127678 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127678 )
      ( MAKE-6PILE ?auto_127678 ?auto_127679 ?auto_127680 ?auto_127681 ?auto_127682 ?auto_127683 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127686 - BLOCK
      ?auto_127687 - BLOCK
      ?auto_127688 - BLOCK
      ?auto_127689 - BLOCK
      ?auto_127690 - BLOCK
      ?auto_127691 - BLOCK
    )
    :vars
    (
      ?auto_127693 - BLOCK
      ?auto_127692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127686 ?auto_127687 ) ) ( not ( = ?auto_127686 ?auto_127688 ) ) ( not ( = ?auto_127686 ?auto_127689 ) ) ( not ( = ?auto_127686 ?auto_127690 ) ) ( not ( = ?auto_127686 ?auto_127691 ) ) ( not ( = ?auto_127687 ?auto_127688 ) ) ( not ( = ?auto_127687 ?auto_127689 ) ) ( not ( = ?auto_127687 ?auto_127690 ) ) ( not ( = ?auto_127687 ?auto_127691 ) ) ( not ( = ?auto_127688 ?auto_127689 ) ) ( not ( = ?auto_127688 ?auto_127690 ) ) ( not ( = ?auto_127688 ?auto_127691 ) ) ( not ( = ?auto_127689 ?auto_127690 ) ) ( not ( = ?auto_127689 ?auto_127691 ) ) ( not ( = ?auto_127690 ?auto_127691 ) ) ( ON ?auto_127691 ?auto_127693 ) ( not ( = ?auto_127686 ?auto_127693 ) ) ( not ( = ?auto_127687 ?auto_127693 ) ) ( not ( = ?auto_127688 ?auto_127693 ) ) ( not ( = ?auto_127689 ?auto_127693 ) ) ( not ( = ?auto_127690 ?auto_127693 ) ) ( not ( = ?auto_127691 ?auto_127693 ) ) ( ON ?auto_127690 ?auto_127691 ) ( ON-TABLE ?auto_127692 ) ( ON ?auto_127693 ?auto_127692 ) ( not ( = ?auto_127692 ?auto_127693 ) ) ( not ( = ?auto_127692 ?auto_127691 ) ) ( not ( = ?auto_127692 ?auto_127690 ) ) ( not ( = ?auto_127686 ?auto_127692 ) ) ( not ( = ?auto_127687 ?auto_127692 ) ) ( not ( = ?auto_127688 ?auto_127692 ) ) ( not ( = ?auto_127689 ?auto_127692 ) ) ( ON ?auto_127689 ?auto_127690 ) ( ON ?auto_127688 ?auto_127689 ) ( ON ?auto_127687 ?auto_127688 ) ( ON ?auto_127686 ?auto_127687 ) ( CLEAR ?auto_127686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127692 ?auto_127693 ?auto_127691 ?auto_127690 ?auto_127689 ?auto_127688 ?auto_127687 )
      ( MAKE-6PILE ?auto_127686 ?auto_127687 ?auto_127688 ?auto_127689 ?auto_127690 ?auto_127691 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127695 - BLOCK
    )
    :vars
    (
      ?auto_127696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127696 ?auto_127695 ) ( CLEAR ?auto_127696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127695 ) ( not ( = ?auto_127695 ?auto_127696 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127696 ?auto_127695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127697 - BLOCK
    )
    :vars
    (
      ?auto_127698 - BLOCK
      ?auto_127699 - BLOCK
      ?auto_127700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127698 ?auto_127697 ) ( CLEAR ?auto_127698 ) ( ON-TABLE ?auto_127697 ) ( not ( = ?auto_127697 ?auto_127698 ) ) ( HOLDING ?auto_127699 ) ( CLEAR ?auto_127700 ) ( not ( = ?auto_127697 ?auto_127699 ) ) ( not ( = ?auto_127697 ?auto_127700 ) ) ( not ( = ?auto_127698 ?auto_127699 ) ) ( not ( = ?auto_127698 ?auto_127700 ) ) ( not ( = ?auto_127699 ?auto_127700 ) ) )
    :subtasks
    ( ( !STACK ?auto_127699 ?auto_127700 )
      ( MAKE-1PILE ?auto_127697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127701 - BLOCK
    )
    :vars
    (
      ?auto_127703 - BLOCK
      ?auto_127702 - BLOCK
      ?auto_127704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127703 ?auto_127701 ) ( ON-TABLE ?auto_127701 ) ( not ( = ?auto_127701 ?auto_127703 ) ) ( CLEAR ?auto_127702 ) ( not ( = ?auto_127701 ?auto_127704 ) ) ( not ( = ?auto_127701 ?auto_127702 ) ) ( not ( = ?auto_127703 ?auto_127704 ) ) ( not ( = ?auto_127703 ?auto_127702 ) ) ( not ( = ?auto_127704 ?auto_127702 ) ) ( ON ?auto_127704 ?auto_127703 ) ( CLEAR ?auto_127704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127701 ?auto_127703 )
      ( MAKE-1PILE ?auto_127701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127705 - BLOCK
    )
    :vars
    (
      ?auto_127706 - BLOCK
      ?auto_127707 - BLOCK
      ?auto_127708 - BLOCK
      ?auto_127709 - BLOCK
      ?auto_127711 - BLOCK
      ?auto_127712 - BLOCK
      ?auto_127710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127706 ?auto_127705 ) ( ON-TABLE ?auto_127705 ) ( not ( = ?auto_127705 ?auto_127706 ) ) ( not ( = ?auto_127705 ?auto_127707 ) ) ( not ( = ?auto_127705 ?auto_127708 ) ) ( not ( = ?auto_127706 ?auto_127707 ) ) ( not ( = ?auto_127706 ?auto_127708 ) ) ( not ( = ?auto_127707 ?auto_127708 ) ) ( ON ?auto_127707 ?auto_127706 ) ( CLEAR ?auto_127707 ) ( HOLDING ?auto_127708 ) ( CLEAR ?auto_127709 ) ( ON-TABLE ?auto_127711 ) ( ON ?auto_127712 ?auto_127711 ) ( ON ?auto_127710 ?auto_127712 ) ( ON ?auto_127709 ?auto_127710 ) ( not ( = ?auto_127711 ?auto_127712 ) ) ( not ( = ?auto_127711 ?auto_127710 ) ) ( not ( = ?auto_127711 ?auto_127709 ) ) ( not ( = ?auto_127711 ?auto_127708 ) ) ( not ( = ?auto_127712 ?auto_127710 ) ) ( not ( = ?auto_127712 ?auto_127709 ) ) ( not ( = ?auto_127712 ?auto_127708 ) ) ( not ( = ?auto_127710 ?auto_127709 ) ) ( not ( = ?auto_127710 ?auto_127708 ) ) ( not ( = ?auto_127709 ?auto_127708 ) ) ( not ( = ?auto_127705 ?auto_127709 ) ) ( not ( = ?auto_127705 ?auto_127711 ) ) ( not ( = ?auto_127705 ?auto_127712 ) ) ( not ( = ?auto_127705 ?auto_127710 ) ) ( not ( = ?auto_127706 ?auto_127709 ) ) ( not ( = ?auto_127706 ?auto_127711 ) ) ( not ( = ?auto_127706 ?auto_127712 ) ) ( not ( = ?auto_127706 ?auto_127710 ) ) ( not ( = ?auto_127707 ?auto_127709 ) ) ( not ( = ?auto_127707 ?auto_127711 ) ) ( not ( = ?auto_127707 ?auto_127712 ) ) ( not ( = ?auto_127707 ?auto_127710 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127711 ?auto_127712 ?auto_127710 ?auto_127709 ?auto_127708 )
      ( MAKE-1PILE ?auto_127705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127713 - BLOCK
    )
    :vars
    (
      ?auto_127719 - BLOCK
      ?auto_127716 - BLOCK
      ?auto_127717 - BLOCK
      ?auto_127718 - BLOCK
      ?auto_127715 - BLOCK
      ?auto_127714 - BLOCK
      ?auto_127720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127719 ?auto_127713 ) ( ON-TABLE ?auto_127713 ) ( not ( = ?auto_127713 ?auto_127719 ) ) ( not ( = ?auto_127713 ?auto_127716 ) ) ( not ( = ?auto_127713 ?auto_127717 ) ) ( not ( = ?auto_127719 ?auto_127716 ) ) ( not ( = ?auto_127719 ?auto_127717 ) ) ( not ( = ?auto_127716 ?auto_127717 ) ) ( ON ?auto_127716 ?auto_127719 ) ( CLEAR ?auto_127718 ) ( ON-TABLE ?auto_127715 ) ( ON ?auto_127714 ?auto_127715 ) ( ON ?auto_127720 ?auto_127714 ) ( ON ?auto_127718 ?auto_127720 ) ( not ( = ?auto_127715 ?auto_127714 ) ) ( not ( = ?auto_127715 ?auto_127720 ) ) ( not ( = ?auto_127715 ?auto_127718 ) ) ( not ( = ?auto_127715 ?auto_127717 ) ) ( not ( = ?auto_127714 ?auto_127720 ) ) ( not ( = ?auto_127714 ?auto_127718 ) ) ( not ( = ?auto_127714 ?auto_127717 ) ) ( not ( = ?auto_127720 ?auto_127718 ) ) ( not ( = ?auto_127720 ?auto_127717 ) ) ( not ( = ?auto_127718 ?auto_127717 ) ) ( not ( = ?auto_127713 ?auto_127718 ) ) ( not ( = ?auto_127713 ?auto_127715 ) ) ( not ( = ?auto_127713 ?auto_127714 ) ) ( not ( = ?auto_127713 ?auto_127720 ) ) ( not ( = ?auto_127719 ?auto_127718 ) ) ( not ( = ?auto_127719 ?auto_127715 ) ) ( not ( = ?auto_127719 ?auto_127714 ) ) ( not ( = ?auto_127719 ?auto_127720 ) ) ( not ( = ?auto_127716 ?auto_127718 ) ) ( not ( = ?auto_127716 ?auto_127715 ) ) ( not ( = ?auto_127716 ?auto_127714 ) ) ( not ( = ?auto_127716 ?auto_127720 ) ) ( ON ?auto_127717 ?auto_127716 ) ( CLEAR ?auto_127717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127713 ?auto_127719 ?auto_127716 )
      ( MAKE-1PILE ?auto_127713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127721 - BLOCK
    )
    :vars
    (
      ?auto_127728 - BLOCK
      ?auto_127726 - BLOCK
      ?auto_127725 - BLOCK
      ?auto_127727 - BLOCK
      ?auto_127723 - BLOCK
      ?auto_127724 - BLOCK
      ?auto_127722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127728 ?auto_127721 ) ( ON-TABLE ?auto_127721 ) ( not ( = ?auto_127721 ?auto_127728 ) ) ( not ( = ?auto_127721 ?auto_127726 ) ) ( not ( = ?auto_127721 ?auto_127725 ) ) ( not ( = ?auto_127728 ?auto_127726 ) ) ( not ( = ?auto_127728 ?auto_127725 ) ) ( not ( = ?auto_127726 ?auto_127725 ) ) ( ON ?auto_127726 ?auto_127728 ) ( ON-TABLE ?auto_127727 ) ( ON ?auto_127723 ?auto_127727 ) ( ON ?auto_127724 ?auto_127723 ) ( not ( = ?auto_127727 ?auto_127723 ) ) ( not ( = ?auto_127727 ?auto_127724 ) ) ( not ( = ?auto_127727 ?auto_127722 ) ) ( not ( = ?auto_127727 ?auto_127725 ) ) ( not ( = ?auto_127723 ?auto_127724 ) ) ( not ( = ?auto_127723 ?auto_127722 ) ) ( not ( = ?auto_127723 ?auto_127725 ) ) ( not ( = ?auto_127724 ?auto_127722 ) ) ( not ( = ?auto_127724 ?auto_127725 ) ) ( not ( = ?auto_127722 ?auto_127725 ) ) ( not ( = ?auto_127721 ?auto_127722 ) ) ( not ( = ?auto_127721 ?auto_127727 ) ) ( not ( = ?auto_127721 ?auto_127723 ) ) ( not ( = ?auto_127721 ?auto_127724 ) ) ( not ( = ?auto_127728 ?auto_127722 ) ) ( not ( = ?auto_127728 ?auto_127727 ) ) ( not ( = ?auto_127728 ?auto_127723 ) ) ( not ( = ?auto_127728 ?auto_127724 ) ) ( not ( = ?auto_127726 ?auto_127722 ) ) ( not ( = ?auto_127726 ?auto_127727 ) ) ( not ( = ?auto_127726 ?auto_127723 ) ) ( not ( = ?auto_127726 ?auto_127724 ) ) ( ON ?auto_127725 ?auto_127726 ) ( CLEAR ?auto_127725 ) ( HOLDING ?auto_127722 ) ( CLEAR ?auto_127724 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127727 ?auto_127723 ?auto_127724 ?auto_127722 )
      ( MAKE-1PILE ?auto_127721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127729 - BLOCK
    )
    :vars
    (
      ?auto_127733 - BLOCK
      ?auto_127735 - BLOCK
      ?auto_127731 - BLOCK
      ?auto_127732 - BLOCK
      ?auto_127736 - BLOCK
      ?auto_127734 - BLOCK
      ?auto_127730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127733 ?auto_127729 ) ( ON-TABLE ?auto_127729 ) ( not ( = ?auto_127729 ?auto_127733 ) ) ( not ( = ?auto_127729 ?auto_127735 ) ) ( not ( = ?auto_127729 ?auto_127731 ) ) ( not ( = ?auto_127733 ?auto_127735 ) ) ( not ( = ?auto_127733 ?auto_127731 ) ) ( not ( = ?auto_127735 ?auto_127731 ) ) ( ON ?auto_127735 ?auto_127733 ) ( ON-TABLE ?auto_127732 ) ( ON ?auto_127736 ?auto_127732 ) ( ON ?auto_127734 ?auto_127736 ) ( not ( = ?auto_127732 ?auto_127736 ) ) ( not ( = ?auto_127732 ?auto_127734 ) ) ( not ( = ?auto_127732 ?auto_127730 ) ) ( not ( = ?auto_127732 ?auto_127731 ) ) ( not ( = ?auto_127736 ?auto_127734 ) ) ( not ( = ?auto_127736 ?auto_127730 ) ) ( not ( = ?auto_127736 ?auto_127731 ) ) ( not ( = ?auto_127734 ?auto_127730 ) ) ( not ( = ?auto_127734 ?auto_127731 ) ) ( not ( = ?auto_127730 ?auto_127731 ) ) ( not ( = ?auto_127729 ?auto_127730 ) ) ( not ( = ?auto_127729 ?auto_127732 ) ) ( not ( = ?auto_127729 ?auto_127736 ) ) ( not ( = ?auto_127729 ?auto_127734 ) ) ( not ( = ?auto_127733 ?auto_127730 ) ) ( not ( = ?auto_127733 ?auto_127732 ) ) ( not ( = ?auto_127733 ?auto_127736 ) ) ( not ( = ?auto_127733 ?auto_127734 ) ) ( not ( = ?auto_127735 ?auto_127730 ) ) ( not ( = ?auto_127735 ?auto_127732 ) ) ( not ( = ?auto_127735 ?auto_127736 ) ) ( not ( = ?auto_127735 ?auto_127734 ) ) ( ON ?auto_127731 ?auto_127735 ) ( CLEAR ?auto_127734 ) ( ON ?auto_127730 ?auto_127731 ) ( CLEAR ?auto_127730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127729 ?auto_127733 ?auto_127735 ?auto_127731 )
      ( MAKE-1PILE ?auto_127729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127737 - BLOCK
    )
    :vars
    (
      ?auto_127741 - BLOCK
      ?auto_127742 - BLOCK
      ?auto_127740 - BLOCK
      ?auto_127738 - BLOCK
      ?auto_127739 - BLOCK
      ?auto_127743 - BLOCK
      ?auto_127744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127741 ?auto_127737 ) ( ON-TABLE ?auto_127737 ) ( not ( = ?auto_127737 ?auto_127741 ) ) ( not ( = ?auto_127737 ?auto_127742 ) ) ( not ( = ?auto_127737 ?auto_127740 ) ) ( not ( = ?auto_127741 ?auto_127742 ) ) ( not ( = ?auto_127741 ?auto_127740 ) ) ( not ( = ?auto_127742 ?auto_127740 ) ) ( ON ?auto_127742 ?auto_127741 ) ( ON-TABLE ?auto_127738 ) ( ON ?auto_127739 ?auto_127738 ) ( not ( = ?auto_127738 ?auto_127739 ) ) ( not ( = ?auto_127738 ?auto_127743 ) ) ( not ( = ?auto_127738 ?auto_127744 ) ) ( not ( = ?auto_127738 ?auto_127740 ) ) ( not ( = ?auto_127739 ?auto_127743 ) ) ( not ( = ?auto_127739 ?auto_127744 ) ) ( not ( = ?auto_127739 ?auto_127740 ) ) ( not ( = ?auto_127743 ?auto_127744 ) ) ( not ( = ?auto_127743 ?auto_127740 ) ) ( not ( = ?auto_127744 ?auto_127740 ) ) ( not ( = ?auto_127737 ?auto_127744 ) ) ( not ( = ?auto_127737 ?auto_127738 ) ) ( not ( = ?auto_127737 ?auto_127739 ) ) ( not ( = ?auto_127737 ?auto_127743 ) ) ( not ( = ?auto_127741 ?auto_127744 ) ) ( not ( = ?auto_127741 ?auto_127738 ) ) ( not ( = ?auto_127741 ?auto_127739 ) ) ( not ( = ?auto_127741 ?auto_127743 ) ) ( not ( = ?auto_127742 ?auto_127744 ) ) ( not ( = ?auto_127742 ?auto_127738 ) ) ( not ( = ?auto_127742 ?auto_127739 ) ) ( not ( = ?auto_127742 ?auto_127743 ) ) ( ON ?auto_127740 ?auto_127742 ) ( ON ?auto_127744 ?auto_127740 ) ( CLEAR ?auto_127744 ) ( HOLDING ?auto_127743 ) ( CLEAR ?auto_127739 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127738 ?auto_127739 ?auto_127743 )
      ( MAKE-1PILE ?auto_127737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127745 - BLOCK
    )
    :vars
    (
      ?auto_127746 - BLOCK
      ?auto_127750 - BLOCK
      ?auto_127748 - BLOCK
      ?auto_127747 - BLOCK
      ?auto_127752 - BLOCK
      ?auto_127751 - BLOCK
      ?auto_127749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127746 ?auto_127745 ) ( ON-TABLE ?auto_127745 ) ( not ( = ?auto_127745 ?auto_127746 ) ) ( not ( = ?auto_127745 ?auto_127750 ) ) ( not ( = ?auto_127745 ?auto_127748 ) ) ( not ( = ?auto_127746 ?auto_127750 ) ) ( not ( = ?auto_127746 ?auto_127748 ) ) ( not ( = ?auto_127750 ?auto_127748 ) ) ( ON ?auto_127750 ?auto_127746 ) ( ON-TABLE ?auto_127747 ) ( ON ?auto_127752 ?auto_127747 ) ( not ( = ?auto_127747 ?auto_127752 ) ) ( not ( = ?auto_127747 ?auto_127751 ) ) ( not ( = ?auto_127747 ?auto_127749 ) ) ( not ( = ?auto_127747 ?auto_127748 ) ) ( not ( = ?auto_127752 ?auto_127751 ) ) ( not ( = ?auto_127752 ?auto_127749 ) ) ( not ( = ?auto_127752 ?auto_127748 ) ) ( not ( = ?auto_127751 ?auto_127749 ) ) ( not ( = ?auto_127751 ?auto_127748 ) ) ( not ( = ?auto_127749 ?auto_127748 ) ) ( not ( = ?auto_127745 ?auto_127749 ) ) ( not ( = ?auto_127745 ?auto_127747 ) ) ( not ( = ?auto_127745 ?auto_127752 ) ) ( not ( = ?auto_127745 ?auto_127751 ) ) ( not ( = ?auto_127746 ?auto_127749 ) ) ( not ( = ?auto_127746 ?auto_127747 ) ) ( not ( = ?auto_127746 ?auto_127752 ) ) ( not ( = ?auto_127746 ?auto_127751 ) ) ( not ( = ?auto_127750 ?auto_127749 ) ) ( not ( = ?auto_127750 ?auto_127747 ) ) ( not ( = ?auto_127750 ?auto_127752 ) ) ( not ( = ?auto_127750 ?auto_127751 ) ) ( ON ?auto_127748 ?auto_127750 ) ( ON ?auto_127749 ?auto_127748 ) ( CLEAR ?auto_127752 ) ( ON ?auto_127751 ?auto_127749 ) ( CLEAR ?auto_127751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127745 ?auto_127746 ?auto_127750 ?auto_127748 ?auto_127749 )
      ( MAKE-1PILE ?auto_127745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127753 - BLOCK
    )
    :vars
    (
      ?auto_127760 - BLOCK
      ?auto_127754 - BLOCK
      ?auto_127756 - BLOCK
      ?auto_127759 - BLOCK
      ?auto_127758 - BLOCK
      ?auto_127757 - BLOCK
      ?auto_127755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127760 ?auto_127753 ) ( ON-TABLE ?auto_127753 ) ( not ( = ?auto_127753 ?auto_127760 ) ) ( not ( = ?auto_127753 ?auto_127754 ) ) ( not ( = ?auto_127753 ?auto_127756 ) ) ( not ( = ?auto_127760 ?auto_127754 ) ) ( not ( = ?auto_127760 ?auto_127756 ) ) ( not ( = ?auto_127754 ?auto_127756 ) ) ( ON ?auto_127754 ?auto_127760 ) ( ON-TABLE ?auto_127759 ) ( not ( = ?auto_127759 ?auto_127758 ) ) ( not ( = ?auto_127759 ?auto_127757 ) ) ( not ( = ?auto_127759 ?auto_127755 ) ) ( not ( = ?auto_127759 ?auto_127756 ) ) ( not ( = ?auto_127758 ?auto_127757 ) ) ( not ( = ?auto_127758 ?auto_127755 ) ) ( not ( = ?auto_127758 ?auto_127756 ) ) ( not ( = ?auto_127757 ?auto_127755 ) ) ( not ( = ?auto_127757 ?auto_127756 ) ) ( not ( = ?auto_127755 ?auto_127756 ) ) ( not ( = ?auto_127753 ?auto_127755 ) ) ( not ( = ?auto_127753 ?auto_127759 ) ) ( not ( = ?auto_127753 ?auto_127758 ) ) ( not ( = ?auto_127753 ?auto_127757 ) ) ( not ( = ?auto_127760 ?auto_127755 ) ) ( not ( = ?auto_127760 ?auto_127759 ) ) ( not ( = ?auto_127760 ?auto_127758 ) ) ( not ( = ?auto_127760 ?auto_127757 ) ) ( not ( = ?auto_127754 ?auto_127755 ) ) ( not ( = ?auto_127754 ?auto_127759 ) ) ( not ( = ?auto_127754 ?auto_127758 ) ) ( not ( = ?auto_127754 ?auto_127757 ) ) ( ON ?auto_127756 ?auto_127754 ) ( ON ?auto_127755 ?auto_127756 ) ( ON ?auto_127757 ?auto_127755 ) ( CLEAR ?auto_127757 ) ( HOLDING ?auto_127758 ) ( CLEAR ?auto_127759 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127759 ?auto_127758 )
      ( MAKE-1PILE ?auto_127753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127761 - BLOCK
    )
    :vars
    (
      ?auto_127763 - BLOCK
      ?auto_127768 - BLOCK
      ?auto_127767 - BLOCK
      ?auto_127764 - BLOCK
      ?auto_127762 - BLOCK
      ?auto_127765 - BLOCK
      ?auto_127766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127763 ?auto_127761 ) ( ON-TABLE ?auto_127761 ) ( not ( = ?auto_127761 ?auto_127763 ) ) ( not ( = ?auto_127761 ?auto_127768 ) ) ( not ( = ?auto_127761 ?auto_127767 ) ) ( not ( = ?auto_127763 ?auto_127768 ) ) ( not ( = ?auto_127763 ?auto_127767 ) ) ( not ( = ?auto_127768 ?auto_127767 ) ) ( ON ?auto_127768 ?auto_127763 ) ( ON-TABLE ?auto_127764 ) ( not ( = ?auto_127764 ?auto_127762 ) ) ( not ( = ?auto_127764 ?auto_127765 ) ) ( not ( = ?auto_127764 ?auto_127766 ) ) ( not ( = ?auto_127764 ?auto_127767 ) ) ( not ( = ?auto_127762 ?auto_127765 ) ) ( not ( = ?auto_127762 ?auto_127766 ) ) ( not ( = ?auto_127762 ?auto_127767 ) ) ( not ( = ?auto_127765 ?auto_127766 ) ) ( not ( = ?auto_127765 ?auto_127767 ) ) ( not ( = ?auto_127766 ?auto_127767 ) ) ( not ( = ?auto_127761 ?auto_127766 ) ) ( not ( = ?auto_127761 ?auto_127764 ) ) ( not ( = ?auto_127761 ?auto_127762 ) ) ( not ( = ?auto_127761 ?auto_127765 ) ) ( not ( = ?auto_127763 ?auto_127766 ) ) ( not ( = ?auto_127763 ?auto_127764 ) ) ( not ( = ?auto_127763 ?auto_127762 ) ) ( not ( = ?auto_127763 ?auto_127765 ) ) ( not ( = ?auto_127768 ?auto_127766 ) ) ( not ( = ?auto_127768 ?auto_127764 ) ) ( not ( = ?auto_127768 ?auto_127762 ) ) ( not ( = ?auto_127768 ?auto_127765 ) ) ( ON ?auto_127767 ?auto_127768 ) ( ON ?auto_127766 ?auto_127767 ) ( ON ?auto_127765 ?auto_127766 ) ( CLEAR ?auto_127764 ) ( ON ?auto_127762 ?auto_127765 ) ( CLEAR ?auto_127762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127761 ?auto_127763 ?auto_127768 ?auto_127767 ?auto_127766 ?auto_127765 )
      ( MAKE-1PILE ?auto_127761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127769 - BLOCK
    )
    :vars
    (
      ?auto_127771 - BLOCK
      ?auto_127772 - BLOCK
      ?auto_127775 - BLOCK
      ?auto_127776 - BLOCK
      ?auto_127773 - BLOCK
      ?auto_127774 - BLOCK
      ?auto_127770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127771 ?auto_127769 ) ( ON-TABLE ?auto_127769 ) ( not ( = ?auto_127769 ?auto_127771 ) ) ( not ( = ?auto_127769 ?auto_127772 ) ) ( not ( = ?auto_127769 ?auto_127775 ) ) ( not ( = ?auto_127771 ?auto_127772 ) ) ( not ( = ?auto_127771 ?auto_127775 ) ) ( not ( = ?auto_127772 ?auto_127775 ) ) ( ON ?auto_127772 ?auto_127771 ) ( not ( = ?auto_127776 ?auto_127773 ) ) ( not ( = ?auto_127776 ?auto_127774 ) ) ( not ( = ?auto_127776 ?auto_127770 ) ) ( not ( = ?auto_127776 ?auto_127775 ) ) ( not ( = ?auto_127773 ?auto_127774 ) ) ( not ( = ?auto_127773 ?auto_127770 ) ) ( not ( = ?auto_127773 ?auto_127775 ) ) ( not ( = ?auto_127774 ?auto_127770 ) ) ( not ( = ?auto_127774 ?auto_127775 ) ) ( not ( = ?auto_127770 ?auto_127775 ) ) ( not ( = ?auto_127769 ?auto_127770 ) ) ( not ( = ?auto_127769 ?auto_127776 ) ) ( not ( = ?auto_127769 ?auto_127773 ) ) ( not ( = ?auto_127769 ?auto_127774 ) ) ( not ( = ?auto_127771 ?auto_127770 ) ) ( not ( = ?auto_127771 ?auto_127776 ) ) ( not ( = ?auto_127771 ?auto_127773 ) ) ( not ( = ?auto_127771 ?auto_127774 ) ) ( not ( = ?auto_127772 ?auto_127770 ) ) ( not ( = ?auto_127772 ?auto_127776 ) ) ( not ( = ?auto_127772 ?auto_127773 ) ) ( not ( = ?auto_127772 ?auto_127774 ) ) ( ON ?auto_127775 ?auto_127772 ) ( ON ?auto_127770 ?auto_127775 ) ( ON ?auto_127774 ?auto_127770 ) ( ON ?auto_127773 ?auto_127774 ) ( CLEAR ?auto_127773 ) ( HOLDING ?auto_127776 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127776 )
      ( MAKE-1PILE ?auto_127769 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_127777 - BLOCK
    )
    :vars
    (
      ?auto_127781 - BLOCK
      ?auto_127778 - BLOCK
      ?auto_127779 - BLOCK
      ?auto_127783 - BLOCK
      ?auto_127780 - BLOCK
      ?auto_127782 - BLOCK
      ?auto_127784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127781 ?auto_127777 ) ( ON-TABLE ?auto_127777 ) ( not ( = ?auto_127777 ?auto_127781 ) ) ( not ( = ?auto_127777 ?auto_127778 ) ) ( not ( = ?auto_127777 ?auto_127779 ) ) ( not ( = ?auto_127781 ?auto_127778 ) ) ( not ( = ?auto_127781 ?auto_127779 ) ) ( not ( = ?auto_127778 ?auto_127779 ) ) ( ON ?auto_127778 ?auto_127781 ) ( not ( = ?auto_127783 ?auto_127780 ) ) ( not ( = ?auto_127783 ?auto_127782 ) ) ( not ( = ?auto_127783 ?auto_127784 ) ) ( not ( = ?auto_127783 ?auto_127779 ) ) ( not ( = ?auto_127780 ?auto_127782 ) ) ( not ( = ?auto_127780 ?auto_127784 ) ) ( not ( = ?auto_127780 ?auto_127779 ) ) ( not ( = ?auto_127782 ?auto_127784 ) ) ( not ( = ?auto_127782 ?auto_127779 ) ) ( not ( = ?auto_127784 ?auto_127779 ) ) ( not ( = ?auto_127777 ?auto_127784 ) ) ( not ( = ?auto_127777 ?auto_127783 ) ) ( not ( = ?auto_127777 ?auto_127780 ) ) ( not ( = ?auto_127777 ?auto_127782 ) ) ( not ( = ?auto_127781 ?auto_127784 ) ) ( not ( = ?auto_127781 ?auto_127783 ) ) ( not ( = ?auto_127781 ?auto_127780 ) ) ( not ( = ?auto_127781 ?auto_127782 ) ) ( not ( = ?auto_127778 ?auto_127784 ) ) ( not ( = ?auto_127778 ?auto_127783 ) ) ( not ( = ?auto_127778 ?auto_127780 ) ) ( not ( = ?auto_127778 ?auto_127782 ) ) ( ON ?auto_127779 ?auto_127778 ) ( ON ?auto_127784 ?auto_127779 ) ( ON ?auto_127782 ?auto_127784 ) ( ON ?auto_127780 ?auto_127782 ) ( ON ?auto_127783 ?auto_127780 ) ( CLEAR ?auto_127783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127777 ?auto_127781 ?auto_127778 ?auto_127779 ?auto_127784 ?auto_127782 ?auto_127780 )
      ( MAKE-1PILE ?auto_127777 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127792 - BLOCK
      ?auto_127793 - BLOCK
      ?auto_127794 - BLOCK
      ?auto_127795 - BLOCK
      ?auto_127796 - BLOCK
      ?auto_127797 - BLOCK
      ?auto_127798 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_127798 ) ( CLEAR ?auto_127797 ) ( ON-TABLE ?auto_127792 ) ( ON ?auto_127793 ?auto_127792 ) ( ON ?auto_127794 ?auto_127793 ) ( ON ?auto_127795 ?auto_127794 ) ( ON ?auto_127796 ?auto_127795 ) ( ON ?auto_127797 ?auto_127796 ) ( not ( = ?auto_127792 ?auto_127793 ) ) ( not ( = ?auto_127792 ?auto_127794 ) ) ( not ( = ?auto_127792 ?auto_127795 ) ) ( not ( = ?auto_127792 ?auto_127796 ) ) ( not ( = ?auto_127792 ?auto_127797 ) ) ( not ( = ?auto_127792 ?auto_127798 ) ) ( not ( = ?auto_127793 ?auto_127794 ) ) ( not ( = ?auto_127793 ?auto_127795 ) ) ( not ( = ?auto_127793 ?auto_127796 ) ) ( not ( = ?auto_127793 ?auto_127797 ) ) ( not ( = ?auto_127793 ?auto_127798 ) ) ( not ( = ?auto_127794 ?auto_127795 ) ) ( not ( = ?auto_127794 ?auto_127796 ) ) ( not ( = ?auto_127794 ?auto_127797 ) ) ( not ( = ?auto_127794 ?auto_127798 ) ) ( not ( = ?auto_127795 ?auto_127796 ) ) ( not ( = ?auto_127795 ?auto_127797 ) ) ( not ( = ?auto_127795 ?auto_127798 ) ) ( not ( = ?auto_127796 ?auto_127797 ) ) ( not ( = ?auto_127796 ?auto_127798 ) ) ( not ( = ?auto_127797 ?auto_127798 ) ) )
    :subtasks
    ( ( !STACK ?auto_127798 ?auto_127797 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127799 - BLOCK
      ?auto_127800 - BLOCK
      ?auto_127801 - BLOCK
      ?auto_127802 - BLOCK
      ?auto_127803 - BLOCK
      ?auto_127804 - BLOCK
      ?auto_127805 - BLOCK
    )
    :vars
    (
      ?auto_127806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_127804 ) ( ON-TABLE ?auto_127799 ) ( ON ?auto_127800 ?auto_127799 ) ( ON ?auto_127801 ?auto_127800 ) ( ON ?auto_127802 ?auto_127801 ) ( ON ?auto_127803 ?auto_127802 ) ( ON ?auto_127804 ?auto_127803 ) ( not ( = ?auto_127799 ?auto_127800 ) ) ( not ( = ?auto_127799 ?auto_127801 ) ) ( not ( = ?auto_127799 ?auto_127802 ) ) ( not ( = ?auto_127799 ?auto_127803 ) ) ( not ( = ?auto_127799 ?auto_127804 ) ) ( not ( = ?auto_127799 ?auto_127805 ) ) ( not ( = ?auto_127800 ?auto_127801 ) ) ( not ( = ?auto_127800 ?auto_127802 ) ) ( not ( = ?auto_127800 ?auto_127803 ) ) ( not ( = ?auto_127800 ?auto_127804 ) ) ( not ( = ?auto_127800 ?auto_127805 ) ) ( not ( = ?auto_127801 ?auto_127802 ) ) ( not ( = ?auto_127801 ?auto_127803 ) ) ( not ( = ?auto_127801 ?auto_127804 ) ) ( not ( = ?auto_127801 ?auto_127805 ) ) ( not ( = ?auto_127802 ?auto_127803 ) ) ( not ( = ?auto_127802 ?auto_127804 ) ) ( not ( = ?auto_127802 ?auto_127805 ) ) ( not ( = ?auto_127803 ?auto_127804 ) ) ( not ( = ?auto_127803 ?auto_127805 ) ) ( not ( = ?auto_127804 ?auto_127805 ) ) ( ON ?auto_127805 ?auto_127806 ) ( CLEAR ?auto_127805 ) ( HAND-EMPTY ) ( not ( = ?auto_127799 ?auto_127806 ) ) ( not ( = ?auto_127800 ?auto_127806 ) ) ( not ( = ?auto_127801 ?auto_127806 ) ) ( not ( = ?auto_127802 ?auto_127806 ) ) ( not ( = ?auto_127803 ?auto_127806 ) ) ( not ( = ?auto_127804 ?auto_127806 ) ) ( not ( = ?auto_127805 ?auto_127806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127805 ?auto_127806 )
      ( MAKE-7PILE ?auto_127799 ?auto_127800 ?auto_127801 ?auto_127802 ?auto_127803 ?auto_127804 ?auto_127805 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127807 - BLOCK
      ?auto_127808 - BLOCK
      ?auto_127809 - BLOCK
      ?auto_127810 - BLOCK
      ?auto_127811 - BLOCK
      ?auto_127812 - BLOCK
      ?auto_127813 - BLOCK
    )
    :vars
    (
      ?auto_127814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127807 ) ( ON ?auto_127808 ?auto_127807 ) ( ON ?auto_127809 ?auto_127808 ) ( ON ?auto_127810 ?auto_127809 ) ( ON ?auto_127811 ?auto_127810 ) ( not ( = ?auto_127807 ?auto_127808 ) ) ( not ( = ?auto_127807 ?auto_127809 ) ) ( not ( = ?auto_127807 ?auto_127810 ) ) ( not ( = ?auto_127807 ?auto_127811 ) ) ( not ( = ?auto_127807 ?auto_127812 ) ) ( not ( = ?auto_127807 ?auto_127813 ) ) ( not ( = ?auto_127808 ?auto_127809 ) ) ( not ( = ?auto_127808 ?auto_127810 ) ) ( not ( = ?auto_127808 ?auto_127811 ) ) ( not ( = ?auto_127808 ?auto_127812 ) ) ( not ( = ?auto_127808 ?auto_127813 ) ) ( not ( = ?auto_127809 ?auto_127810 ) ) ( not ( = ?auto_127809 ?auto_127811 ) ) ( not ( = ?auto_127809 ?auto_127812 ) ) ( not ( = ?auto_127809 ?auto_127813 ) ) ( not ( = ?auto_127810 ?auto_127811 ) ) ( not ( = ?auto_127810 ?auto_127812 ) ) ( not ( = ?auto_127810 ?auto_127813 ) ) ( not ( = ?auto_127811 ?auto_127812 ) ) ( not ( = ?auto_127811 ?auto_127813 ) ) ( not ( = ?auto_127812 ?auto_127813 ) ) ( ON ?auto_127813 ?auto_127814 ) ( CLEAR ?auto_127813 ) ( not ( = ?auto_127807 ?auto_127814 ) ) ( not ( = ?auto_127808 ?auto_127814 ) ) ( not ( = ?auto_127809 ?auto_127814 ) ) ( not ( = ?auto_127810 ?auto_127814 ) ) ( not ( = ?auto_127811 ?auto_127814 ) ) ( not ( = ?auto_127812 ?auto_127814 ) ) ( not ( = ?auto_127813 ?auto_127814 ) ) ( HOLDING ?auto_127812 ) ( CLEAR ?auto_127811 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127807 ?auto_127808 ?auto_127809 ?auto_127810 ?auto_127811 ?auto_127812 )
      ( MAKE-7PILE ?auto_127807 ?auto_127808 ?auto_127809 ?auto_127810 ?auto_127811 ?auto_127812 ?auto_127813 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127815 - BLOCK
      ?auto_127816 - BLOCK
      ?auto_127817 - BLOCK
      ?auto_127818 - BLOCK
      ?auto_127819 - BLOCK
      ?auto_127820 - BLOCK
      ?auto_127821 - BLOCK
    )
    :vars
    (
      ?auto_127822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127815 ) ( ON ?auto_127816 ?auto_127815 ) ( ON ?auto_127817 ?auto_127816 ) ( ON ?auto_127818 ?auto_127817 ) ( ON ?auto_127819 ?auto_127818 ) ( not ( = ?auto_127815 ?auto_127816 ) ) ( not ( = ?auto_127815 ?auto_127817 ) ) ( not ( = ?auto_127815 ?auto_127818 ) ) ( not ( = ?auto_127815 ?auto_127819 ) ) ( not ( = ?auto_127815 ?auto_127820 ) ) ( not ( = ?auto_127815 ?auto_127821 ) ) ( not ( = ?auto_127816 ?auto_127817 ) ) ( not ( = ?auto_127816 ?auto_127818 ) ) ( not ( = ?auto_127816 ?auto_127819 ) ) ( not ( = ?auto_127816 ?auto_127820 ) ) ( not ( = ?auto_127816 ?auto_127821 ) ) ( not ( = ?auto_127817 ?auto_127818 ) ) ( not ( = ?auto_127817 ?auto_127819 ) ) ( not ( = ?auto_127817 ?auto_127820 ) ) ( not ( = ?auto_127817 ?auto_127821 ) ) ( not ( = ?auto_127818 ?auto_127819 ) ) ( not ( = ?auto_127818 ?auto_127820 ) ) ( not ( = ?auto_127818 ?auto_127821 ) ) ( not ( = ?auto_127819 ?auto_127820 ) ) ( not ( = ?auto_127819 ?auto_127821 ) ) ( not ( = ?auto_127820 ?auto_127821 ) ) ( ON ?auto_127821 ?auto_127822 ) ( not ( = ?auto_127815 ?auto_127822 ) ) ( not ( = ?auto_127816 ?auto_127822 ) ) ( not ( = ?auto_127817 ?auto_127822 ) ) ( not ( = ?auto_127818 ?auto_127822 ) ) ( not ( = ?auto_127819 ?auto_127822 ) ) ( not ( = ?auto_127820 ?auto_127822 ) ) ( not ( = ?auto_127821 ?auto_127822 ) ) ( CLEAR ?auto_127819 ) ( ON ?auto_127820 ?auto_127821 ) ( CLEAR ?auto_127820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127822 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127822 ?auto_127821 )
      ( MAKE-7PILE ?auto_127815 ?auto_127816 ?auto_127817 ?auto_127818 ?auto_127819 ?auto_127820 ?auto_127821 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127823 - BLOCK
      ?auto_127824 - BLOCK
      ?auto_127825 - BLOCK
      ?auto_127826 - BLOCK
      ?auto_127827 - BLOCK
      ?auto_127828 - BLOCK
      ?auto_127829 - BLOCK
    )
    :vars
    (
      ?auto_127830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127823 ) ( ON ?auto_127824 ?auto_127823 ) ( ON ?auto_127825 ?auto_127824 ) ( ON ?auto_127826 ?auto_127825 ) ( not ( = ?auto_127823 ?auto_127824 ) ) ( not ( = ?auto_127823 ?auto_127825 ) ) ( not ( = ?auto_127823 ?auto_127826 ) ) ( not ( = ?auto_127823 ?auto_127827 ) ) ( not ( = ?auto_127823 ?auto_127828 ) ) ( not ( = ?auto_127823 ?auto_127829 ) ) ( not ( = ?auto_127824 ?auto_127825 ) ) ( not ( = ?auto_127824 ?auto_127826 ) ) ( not ( = ?auto_127824 ?auto_127827 ) ) ( not ( = ?auto_127824 ?auto_127828 ) ) ( not ( = ?auto_127824 ?auto_127829 ) ) ( not ( = ?auto_127825 ?auto_127826 ) ) ( not ( = ?auto_127825 ?auto_127827 ) ) ( not ( = ?auto_127825 ?auto_127828 ) ) ( not ( = ?auto_127825 ?auto_127829 ) ) ( not ( = ?auto_127826 ?auto_127827 ) ) ( not ( = ?auto_127826 ?auto_127828 ) ) ( not ( = ?auto_127826 ?auto_127829 ) ) ( not ( = ?auto_127827 ?auto_127828 ) ) ( not ( = ?auto_127827 ?auto_127829 ) ) ( not ( = ?auto_127828 ?auto_127829 ) ) ( ON ?auto_127829 ?auto_127830 ) ( not ( = ?auto_127823 ?auto_127830 ) ) ( not ( = ?auto_127824 ?auto_127830 ) ) ( not ( = ?auto_127825 ?auto_127830 ) ) ( not ( = ?auto_127826 ?auto_127830 ) ) ( not ( = ?auto_127827 ?auto_127830 ) ) ( not ( = ?auto_127828 ?auto_127830 ) ) ( not ( = ?auto_127829 ?auto_127830 ) ) ( ON ?auto_127828 ?auto_127829 ) ( CLEAR ?auto_127828 ) ( ON-TABLE ?auto_127830 ) ( HOLDING ?auto_127827 ) ( CLEAR ?auto_127826 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127823 ?auto_127824 ?auto_127825 ?auto_127826 ?auto_127827 )
      ( MAKE-7PILE ?auto_127823 ?auto_127824 ?auto_127825 ?auto_127826 ?auto_127827 ?auto_127828 ?auto_127829 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127831 - BLOCK
      ?auto_127832 - BLOCK
      ?auto_127833 - BLOCK
      ?auto_127834 - BLOCK
      ?auto_127835 - BLOCK
      ?auto_127836 - BLOCK
      ?auto_127837 - BLOCK
    )
    :vars
    (
      ?auto_127838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127831 ) ( ON ?auto_127832 ?auto_127831 ) ( ON ?auto_127833 ?auto_127832 ) ( ON ?auto_127834 ?auto_127833 ) ( not ( = ?auto_127831 ?auto_127832 ) ) ( not ( = ?auto_127831 ?auto_127833 ) ) ( not ( = ?auto_127831 ?auto_127834 ) ) ( not ( = ?auto_127831 ?auto_127835 ) ) ( not ( = ?auto_127831 ?auto_127836 ) ) ( not ( = ?auto_127831 ?auto_127837 ) ) ( not ( = ?auto_127832 ?auto_127833 ) ) ( not ( = ?auto_127832 ?auto_127834 ) ) ( not ( = ?auto_127832 ?auto_127835 ) ) ( not ( = ?auto_127832 ?auto_127836 ) ) ( not ( = ?auto_127832 ?auto_127837 ) ) ( not ( = ?auto_127833 ?auto_127834 ) ) ( not ( = ?auto_127833 ?auto_127835 ) ) ( not ( = ?auto_127833 ?auto_127836 ) ) ( not ( = ?auto_127833 ?auto_127837 ) ) ( not ( = ?auto_127834 ?auto_127835 ) ) ( not ( = ?auto_127834 ?auto_127836 ) ) ( not ( = ?auto_127834 ?auto_127837 ) ) ( not ( = ?auto_127835 ?auto_127836 ) ) ( not ( = ?auto_127835 ?auto_127837 ) ) ( not ( = ?auto_127836 ?auto_127837 ) ) ( ON ?auto_127837 ?auto_127838 ) ( not ( = ?auto_127831 ?auto_127838 ) ) ( not ( = ?auto_127832 ?auto_127838 ) ) ( not ( = ?auto_127833 ?auto_127838 ) ) ( not ( = ?auto_127834 ?auto_127838 ) ) ( not ( = ?auto_127835 ?auto_127838 ) ) ( not ( = ?auto_127836 ?auto_127838 ) ) ( not ( = ?auto_127837 ?auto_127838 ) ) ( ON ?auto_127836 ?auto_127837 ) ( ON-TABLE ?auto_127838 ) ( CLEAR ?auto_127834 ) ( ON ?auto_127835 ?auto_127836 ) ( CLEAR ?auto_127835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127838 ?auto_127837 ?auto_127836 )
      ( MAKE-7PILE ?auto_127831 ?auto_127832 ?auto_127833 ?auto_127834 ?auto_127835 ?auto_127836 ?auto_127837 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127839 - BLOCK
      ?auto_127840 - BLOCK
      ?auto_127841 - BLOCK
      ?auto_127842 - BLOCK
      ?auto_127843 - BLOCK
      ?auto_127844 - BLOCK
      ?auto_127845 - BLOCK
    )
    :vars
    (
      ?auto_127846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127839 ) ( ON ?auto_127840 ?auto_127839 ) ( ON ?auto_127841 ?auto_127840 ) ( not ( = ?auto_127839 ?auto_127840 ) ) ( not ( = ?auto_127839 ?auto_127841 ) ) ( not ( = ?auto_127839 ?auto_127842 ) ) ( not ( = ?auto_127839 ?auto_127843 ) ) ( not ( = ?auto_127839 ?auto_127844 ) ) ( not ( = ?auto_127839 ?auto_127845 ) ) ( not ( = ?auto_127840 ?auto_127841 ) ) ( not ( = ?auto_127840 ?auto_127842 ) ) ( not ( = ?auto_127840 ?auto_127843 ) ) ( not ( = ?auto_127840 ?auto_127844 ) ) ( not ( = ?auto_127840 ?auto_127845 ) ) ( not ( = ?auto_127841 ?auto_127842 ) ) ( not ( = ?auto_127841 ?auto_127843 ) ) ( not ( = ?auto_127841 ?auto_127844 ) ) ( not ( = ?auto_127841 ?auto_127845 ) ) ( not ( = ?auto_127842 ?auto_127843 ) ) ( not ( = ?auto_127842 ?auto_127844 ) ) ( not ( = ?auto_127842 ?auto_127845 ) ) ( not ( = ?auto_127843 ?auto_127844 ) ) ( not ( = ?auto_127843 ?auto_127845 ) ) ( not ( = ?auto_127844 ?auto_127845 ) ) ( ON ?auto_127845 ?auto_127846 ) ( not ( = ?auto_127839 ?auto_127846 ) ) ( not ( = ?auto_127840 ?auto_127846 ) ) ( not ( = ?auto_127841 ?auto_127846 ) ) ( not ( = ?auto_127842 ?auto_127846 ) ) ( not ( = ?auto_127843 ?auto_127846 ) ) ( not ( = ?auto_127844 ?auto_127846 ) ) ( not ( = ?auto_127845 ?auto_127846 ) ) ( ON ?auto_127844 ?auto_127845 ) ( ON-TABLE ?auto_127846 ) ( ON ?auto_127843 ?auto_127844 ) ( CLEAR ?auto_127843 ) ( HOLDING ?auto_127842 ) ( CLEAR ?auto_127841 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127839 ?auto_127840 ?auto_127841 ?auto_127842 )
      ( MAKE-7PILE ?auto_127839 ?auto_127840 ?auto_127841 ?auto_127842 ?auto_127843 ?auto_127844 ?auto_127845 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127847 - BLOCK
      ?auto_127848 - BLOCK
      ?auto_127849 - BLOCK
      ?auto_127850 - BLOCK
      ?auto_127851 - BLOCK
      ?auto_127852 - BLOCK
      ?auto_127853 - BLOCK
    )
    :vars
    (
      ?auto_127854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127847 ) ( ON ?auto_127848 ?auto_127847 ) ( ON ?auto_127849 ?auto_127848 ) ( not ( = ?auto_127847 ?auto_127848 ) ) ( not ( = ?auto_127847 ?auto_127849 ) ) ( not ( = ?auto_127847 ?auto_127850 ) ) ( not ( = ?auto_127847 ?auto_127851 ) ) ( not ( = ?auto_127847 ?auto_127852 ) ) ( not ( = ?auto_127847 ?auto_127853 ) ) ( not ( = ?auto_127848 ?auto_127849 ) ) ( not ( = ?auto_127848 ?auto_127850 ) ) ( not ( = ?auto_127848 ?auto_127851 ) ) ( not ( = ?auto_127848 ?auto_127852 ) ) ( not ( = ?auto_127848 ?auto_127853 ) ) ( not ( = ?auto_127849 ?auto_127850 ) ) ( not ( = ?auto_127849 ?auto_127851 ) ) ( not ( = ?auto_127849 ?auto_127852 ) ) ( not ( = ?auto_127849 ?auto_127853 ) ) ( not ( = ?auto_127850 ?auto_127851 ) ) ( not ( = ?auto_127850 ?auto_127852 ) ) ( not ( = ?auto_127850 ?auto_127853 ) ) ( not ( = ?auto_127851 ?auto_127852 ) ) ( not ( = ?auto_127851 ?auto_127853 ) ) ( not ( = ?auto_127852 ?auto_127853 ) ) ( ON ?auto_127853 ?auto_127854 ) ( not ( = ?auto_127847 ?auto_127854 ) ) ( not ( = ?auto_127848 ?auto_127854 ) ) ( not ( = ?auto_127849 ?auto_127854 ) ) ( not ( = ?auto_127850 ?auto_127854 ) ) ( not ( = ?auto_127851 ?auto_127854 ) ) ( not ( = ?auto_127852 ?auto_127854 ) ) ( not ( = ?auto_127853 ?auto_127854 ) ) ( ON ?auto_127852 ?auto_127853 ) ( ON-TABLE ?auto_127854 ) ( ON ?auto_127851 ?auto_127852 ) ( CLEAR ?auto_127849 ) ( ON ?auto_127850 ?auto_127851 ) ( CLEAR ?auto_127850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127854 ?auto_127853 ?auto_127852 ?auto_127851 )
      ( MAKE-7PILE ?auto_127847 ?auto_127848 ?auto_127849 ?auto_127850 ?auto_127851 ?auto_127852 ?auto_127853 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127855 - BLOCK
      ?auto_127856 - BLOCK
      ?auto_127857 - BLOCK
      ?auto_127858 - BLOCK
      ?auto_127859 - BLOCK
      ?auto_127860 - BLOCK
      ?auto_127861 - BLOCK
    )
    :vars
    (
      ?auto_127862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127855 ) ( ON ?auto_127856 ?auto_127855 ) ( not ( = ?auto_127855 ?auto_127856 ) ) ( not ( = ?auto_127855 ?auto_127857 ) ) ( not ( = ?auto_127855 ?auto_127858 ) ) ( not ( = ?auto_127855 ?auto_127859 ) ) ( not ( = ?auto_127855 ?auto_127860 ) ) ( not ( = ?auto_127855 ?auto_127861 ) ) ( not ( = ?auto_127856 ?auto_127857 ) ) ( not ( = ?auto_127856 ?auto_127858 ) ) ( not ( = ?auto_127856 ?auto_127859 ) ) ( not ( = ?auto_127856 ?auto_127860 ) ) ( not ( = ?auto_127856 ?auto_127861 ) ) ( not ( = ?auto_127857 ?auto_127858 ) ) ( not ( = ?auto_127857 ?auto_127859 ) ) ( not ( = ?auto_127857 ?auto_127860 ) ) ( not ( = ?auto_127857 ?auto_127861 ) ) ( not ( = ?auto_127858 ?auto_127859 ) ) ( not ( = ?auto_127858 ?auto_127860 ) ) ( not ( = ?auto_127858 ?auto_127861 ) ) ( not ( = ?auto_127859 ?auto_127860 ) ) ( not ( = ?auto_127859 ?auto_127861 ) ) ( not ( = ?auto_127860 ?auto_127861 ) ) ( ON ?auto_127861 ?auto_127862 ) ( not ( = ?auto_127855 ?auto_127862 ) ) ( not ( = ?auto_127856 ?auto_127862 ) ) ( not ( = ?auto_127857 ?auto_127862 ) ) ( not ( = ?auto_127858 ?auto_127862 ) ) ( not ( = ?auto_127859 ?auto_127862 ) ) ( not ( = ?auto_127860 ?auto_127862 ) ) ( not ( = ?auto_127861 ?auto_127862 ) ) ( ON ?auto_127860 ?auto_127861 ) ( ON-TABLE ?auto_127862 ) ( ON ?auto_127859 ?auto_127860 ) ( ON ?auto_127858 ?auto_127859 ) ( CLEAR ?auto_127858 ) ( HOLDING ?auto_127857 ) ( CLEAR ?auto_127856 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127855 ?auto_127856 ?auto_127857 )
      ( MAKE-7PILE ?auto_127855 ?auto_127856 ?auto_127857 ?auto_127858 ?auto_127859 ?auto_127860 ?auto_127861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127863 - BLOCK
      ?auto_127864 - BLOCK
      ?auto_127865 - BLOCK
      ?auto_127866 - BLOCK
      ?auto_127867 - BLOCK
      ?auto_127868 - BLOCK
      ?auto_127869 - BLOCK
    )
    :vars
    (
      ?auto_127870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127863 ) ( ON ?auto_127864 ?auto_127863 ) ( not ( = ?auto_127863 ?auto_127864 ) ) ( not ( = ?auto_127863 ?auto_127865 ) ) ( not ( = ?auto_127863 ?auto_127866 ) ) ( not ( = ?auto_127863 ?auto_127867 ) ) ( not ( = ?auto_127863 ?auto_127868 ) ) ( not ( = ?auto_127863 ?auto_127869 ) ) ( not ( = ?auto_127864 ?auto_127865 ) ) ( not ( = ?auto_127864 ?auto_127866 ) ) ( not ( = ?auto_127864 ?auto_127867 ) ) ( not ( = ?auto_127864 ?auto_127868 ) ) ( not ( = ?auto_127864 ?auto_127869 ) ) ( not ( = ?auto_127865 ?auto_127866 ) ) ( not ( = ?auto_127865 ?auto_127867 ) ) ( not ( = ?auto_127865 ?auto_127868 ) ) ( not ( = ?auto_127865 ?auto_127869 ) ) ( not ( = ?auto_127866 ?auto_127867 ) ) ( not ( = ?auto_127866 ?auto_127868 ) ) ( not ( = ?auto_127866 ?auto_127869 ) ) ( not ( = ?auto_127867 ?auto_127868 ) ) ( not ( = ?auto_127867 ?auto_127869 ) ) ( not ( = ?auto_127868 ?auto_127869 ) ) ( ON ?auto_127869 ?auto_127870 ) ( not ( = ?auto_127863 ?auto_127870 ) ) ( not ( = ?auto_127864 ?auto_127870 ) ) ( not ( = ?auto_127865 ?auto_127870 ) ) ( not ( = ?auto_127866 ?auto_127870 ) ) ( not ( = ?auto_127867 ?auto_127870 ) ) ( not ( = ?auto_127868 ?auto_127870 ) ) ( not ( = ?auto_127869 ?auto_127870 ) ) ( ON ?auto_127868 ?auto_127869 ) ( ON-TABLE ?auto_127870 ) ( ON ?auto_127867 ?auto_127868 ) ( ON ?auto_127866 ?auto_127867 ) ( CLEAR ?auto_127864 ) ( ON ?auto_127865 ?auto_127866 ) ( CLEAR ?auto_127865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127870 ?auto_127869 ?auto_127868 ?auto_127867 ?auto_127866 )
      ( MAKE-7PILE ?auto_127863 ?auto_127864 ?auto_127865 ?auto_127866 ?auto_127867 ?auto_127868 ?auto_127869 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127871 - BLOCK
      ?auto_127872 - BLOCK
      ?auto_127873 - BLOCK
      ?auto_127874 - BLOCK
      ?auto_127875 - BLOCK
      ?auto_127876 - BLOCK
      ?auto_127877 - BLOCK
    )
    :vars
    (
      ?auto_127878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127871 ) ( not ( = ?auto_127871 ?auto_127872 ) ) ( not ( = ?auto_127871 ?auto_127873 ) ) ( not ( = ?auto_127871 ?auto_127874 ) ) ( not ( = ?auto_127871 ?auto_127875 ) ) ( not ( = ?auto_127871 ?auto_127876 ) ) ( not ( = ?auto_127871 ?auto_127877 ) ) ( not ( = ?auto_127872 ?auto_127873 ) ) ( not ( = ?auto_127872 ?auto_127874 ) ) ( not ( = ?auto_127872 ?auto_127875 ) ) ( not ( = ?auto_127872 ?auto_127876 ) ) ( not ( = ?auto_127872 ?auto_127877 ) ) ( not ( = ?auto_127873 ?auto_127874 ) ) ( not ( = ?auto_127873 ?auto_127875 ) ) ( not ( = ?auto_127873 ?auto_127876 ) ) ( not ( = ?auto_127873 ?auto_127877 ) ) ( not ( = ?auto_127874 ?auto_127875 ) ) ( not ( = ?auto_127874 ?auto_127876 ) ) ( not ( = ?auto_127874 ?auto_127877 ) ) ( not ( = ?auto_127875 ?auto_127876 ) ) ( not ( = ?auto_127875 ?auto_127877 ) ) ( not ( = ?auto_127876 ?auto_127877 ) ) ( ON ?auto_127877 ?auto_127878 ) ( not ( = ?auto_127871 ?auto_127878 ) ) ( not ( = ?auto_127872 ?auto_127878 ) ) ( not ( = ?auto_127873 ?auto_127878 ) ) ( not ( = ?auto_127874 ?auto_127878 ) ) ( not ( = ?auto_127875 ?auto_127878 ) ) ( not ( = ?auto_127876 ?auto_127878 ) ) ( not ( = ?auto_127877 ?auto_127878 ) ) ( ON ?auto_127876 ?auto_127877 ) ( ON-TABLE ?auto_127878 ) ( ON ?auto_127875 ?auto_127876 ) ( ON ?auto_127874 ?auto_127875 ) ( ON ?auto_127873 ?auto_127874 ) ( CLEAR ?auto_127873 ) ( HOLDING ?auto_127872 ) ( CLEAR ?auto_127871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127871 ?auto_127872 )
      ( MAKE-7PILE ?auto_127871 ?auto_127872 ?auto_127873 ?auto_127874 ?auto_127875 ?auto_127876 ?auto_127877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127879 - BLOCK
      ?auto_127880 - BLOCK
      ?auto_127881 - BLOCK
      ?auto_127882 - BLOCK
      ?auto_127883 - BLOCK
      ?auto_127884 - BLOCK
      ?auto_127885 - BLOCK
    )
    :vars
    (
      ?auto_127886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127879 ) ( not ( = ?auto_127879 ?auto_127880 ) ) ( not ( = ?auto_127879 ?auto_127881 ) ) ( not ( = ?auto_127879 ?auto_127882 ) ) ( not ( = ?auto_127879 ?auto_127883 ) ) ( not ( = ?auto_127879 ?auto_127884 ) ) ( not ( = ?auto_127879 ?auto_127885 ) ) ( not ( = ?auto_127880 ?auto_127881 ) ) ( not ( = ?auto_127880 ?auto_127882 ) ) ( not ( = ?auto_127880 ?auto_127883 ) ) ( not ( = ?auto_127880 ?auto_127884 ) ) ( not ( = ?auto_127880 ?auto_127885 ) ) ( not ( = ?auto_127881 ?auto_127882 ) ) ( not ( = ?auto_127881 ?auto_127883 ) ) ( not ( = ?auto_127881 ?auto_127884 ) ) ( not ( = ?auto_127881 ?auto_127885 ) ) ( not ( = ?auto_127882 ?auto_127883 ) ) ( not ( = ?auto_127882 ?auto_127884 ) ) ( not ( = ?auto_127882 ?auto_127885 ) ) ( not ( = ?auto_127883 ?auto_127884 ) ) ( not ( = ?auto_127883 ?auto_127885 ) ) ( not ( = ?auto_127884 ?auto_127885 ) ) ( ON ?auto_127885 ?auto_127886 ) ( not ( = ?auto_127879 ?auto_127886 ) ) ( not ( = ?auto_127880 ?auto_127886 ) ) ( not ( = ?auto_127881 ?auto_127886 ) ) ( not ( = ?auto_127882 ?auto_127886 ) ) ( not ( = ?auto_127883 ?auto_127886 ) ) ( not ( = ?auto_127884 ?auto_127886 ) ) ( not ( = ?auto_127885 ?auto_127886 ) ) ( ON ?auto_127884 ?auto_127885 ) ( ON-TABLE ?auto_127886 ) ( ON ?auto_127883 ?auto_127884 ) ( ON ?auto_127882 ?auto_127883 ) ( ON ?auto_127881 ?auto_127882 ) ( CLEAR ?auto_127879 ) ( ON ?auto_127880 ?auto_127881 ) ( CLEAR ?auto_127880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_127886 ?auto_127885 ?auto_127884 ?auto_127883 ?auto_127882 ?auto_127881 )
      ( MAKE-7PILE ?auto_127879 ?auto_127880 ?auto_127881 ?auto_127882 ?auto_127883 ?auto_127884 ?auto_127885 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127887 - BLOCK
      ?auto_127888 - BLOCK
      ?auto_127889 - BLOCK
      ?auto_127890 - BLOCK
      ?auto_127891 - BLOCK
      ?auto_127892 - BLOCK
      ?auto_127893 - BLOCK
    )
    :vars
    (
      ?auto_127894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127887 ?auto_127888 ) ) ( not ( = ?auto_127887 ?auto_127889 ) ) ( not ( = ?auto_127887 ?auto_127890 ) ) ( not ( = ?auto_127887 ?auto_127891 ) ) ( not ( = ?auto_127887 ?auto_127892 ) ) ( not ( = ?auto_127887 ?auto_127893 ) ) ( not ( = ?auto_127888 ?auto_127889 ) ) ( not ( = ?auto_127888 ?auto_127890 ) ) ( not ( = ?auto_127888 ?auto_127891 ) ) ( not ( = ?auto_127888 ?auto_127892 ) ) ( not ( = ?auto_127888 ?auto_127893 ) ) ( not ( = ?auto_127889 ?auto_127890 ) ) ( not ( = ?auto_127889 ?auto_127891 ) ) ( not ( = ?auto_127889 ?auto_127892 ) ) ( not ( = ?auto_127889 ?auto_127893 ) ) ( not ( = ?auto_127890 ?auto_127891 ) ) ( not ( = ?auto_127890 ?auto_127892 ) ) ( not ( = ?auto_127890 ?auto_127893 ) ) ( not ( = ?auto_127891 ?auto_127892 ) ) ( not ( = ?auto_127891 ?auto_127893 ) ) ( not ( = ?auto_127892 ?auto_127893 ) ) ( ON ?auto_127893 ?auto_127894 ) ( not ( = ?auto_127887 ?auto_127894 ) ) ( not ( = ?auto_127888 ?auto_127894 ) ) ( not ( = ?auto_127889 ?auto_127894 ) ) ( not ( = ?auto_127890 ?auto_127894 ) ) ( not ( = ?auto_127891 ?auto_127894 ) ) ( not ( = ?auto_127892 ?auto_127894 ) ) ( not ( = ?auto_127893 ?auto_127894 ) ) ( ON ?auto_127892 ?auto_127893 ) ( ON-TABLE ?auto_127894 ) ( ON ?auto_127891 ?auto_127892 ) ( ON ?auto_127890 ?auto_127891 ) ( ON ?auto_127889 ?auto_127890 ) ( ON ?auto_127888 ?auto_127889 ) ( CLEAR ?auto_127888 ) ( HOLDING ?auto_127887 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_127887 )
      ( MAKE-7PILE ?auto_127887 ?auto_127888 ?auto_127889 ?auto_127890 ?auto_127891 ?auto_127892 ?auto_127893 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_127895 - BLOCK
      ?auto_127896 - BLOCK
      ?auto_127897 - BLOCK
      ?auto_127898 - BLOCK
      ?auto_127899 - BLOCK
      ?auto_127900 - BLOCK
      ?auto_127901 - BLOCK
    )
    :vars
    (
      ?auto_127902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_127895 ?auto_127896 ) ) ( not ( = ?auto_127895 ?auto_127897 ) ) ( not ( = ?auto_127895 ?auto_127898 ) ) ( not ( = ?auto_127895 ?auto_127899 ) ) ( not ( = ?auto_127895 ?auto_127900 ) ) ( not ( = ?auto_127895 ?auto_127901 ) ) ( not ( = ?auto_127896 ?auto_127897 ) ) ( not ( = ?auto_127896 ?auto_127898 ) ) ( not ( = ?auto_127896 ?auto_127899 ) ) ( not ( = ?auto_127896 ?auto_127900 ) ) ( not ( = ?auto_127896 ?auto_127901 ) ) ( not ( = ?auto_127897 ?auto_127898 ) ) ( not ( = ?auto_127897 ?auto_127899 ) ) ( not ( = ?auto_127897 ?auto_127900 ) ) ( not ( = ?auto_127897 ?auto_127901 ) ) ( not ( = ?auto_127898 ?auto_127899 ) ) ( not ( = ?auto_127898 ?auto_127900 ) ) ( not ( = ?auto_127898 ?auto_127901 ) ) ( not ( = ?auto_127899 ?auto_127900 ) ) ( not ( = ?auto_127899 ?auto_127901 ) ) ( not ( = ?auto_127900 ?auto_127901 ) ) ( ON ?auto_127901 ?auto_127902 ) ( not ( = ?auto_127895 ?auto_127902 ) ) ( not ( = ?auto_127896 ?auto_127902 ) ) ( not ( = ?auto_127897 ?auto_127902 ) ) ( not ( = ?auto_127898 ?auto_127902 ) ) ( not ( = ?auto_127899 ?auto_127902 ) ) ( not ( = ?auto_127900 ?auto_127902 ) ) ( not ( = ?auto_127901 ?auto_127902 ) ) ( ON ?auto_127900 ?auto_127901 ) ( ON-TABLE ?auto_127902 ) ( ON ?auto_127899 ?auto_127900 ) ( ON ?auto_127898 ?auto_127899 ) ( ON ?auto_127897 ?auto_127898 ) ( ON ?auto_127896 ?auto_127897 ) ( ON ?auto_127895 ?auto_127896 ) ( CLEAR ?auto_127895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127902 ?auto_127901 ?auto_127900 ?auto_127899 ?auto_127898 ?auto_127897 ?auto_127896 )
      ( MAKE-7PILE ?auto_127895 ?auto_127896 ?auto_127897 ?auto_127898 ?auto_127899 ?auto_127900 ?auto_127901 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127909 - BLOCK
      ?auto_127910 - BLOCK
      ?auto_127911 - BLOCK
      ?auto_127912 - BLOCK
      ?auto_127913 - BLOCK
      ?auto_127914 - BLOCK
    )
    :vars
    (
      ?auto_127915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_127915 ?auto_127914 ) ( CLEAR ?auto_127915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127909 ) ( ON ?auto_127910 ?auto_127909 ) ( ON ?auto_127911 ?auto_127910 ) ( ON ?auto_127912 ?auto_127911 ) ( ON ?auto_127913 ?auto_127912 ) ( ON ?auto_127914 ?auto_127913 ) ( not ( = ?auto_127909 ?auto_127910 ) ) ( not ( = ?auto_127909 ?auto_127911 ) ) ( not ( = ?auto_127909 ?auto_127912 ) ) ( not ( = ?auto_127909 ?auto_127913 ) ) ( not ( = ?auto_127909 ?auto_127914 ) ) ( not ( = ?auto_127909 ?auto_127915 ) ) ( not ( = ?auto_127910 ?auto_127911 ) ) ( not ( = ?auto_127910 ?auto_127912 ) ) ( not ( = ?auto_127910 ?auto_127913 ) ) ( not ( = ?auto_127910 ?auto_127914 ) ) ( not ( = ?auto_127910 ?auto_127915 ) ) ( not ( = ?auto_127911 ?auto_127912 ) ) ( not ( = ?auto_127911 ?auto_127913 ) ) ( not ( = ?auto_127911 ?auto_127914 ) ) ( not ( = ?auto_127911 ?auto_127915 ) ) ( not ( = ?auto_127912 ?auto_127913 ) ) ( not ( = ?auto_127912 ?auto_127914 ) ) ( not ( = ?auto_127912 ?auto_127915 ) ) ( not ( = ?auto_127913 ?auto_127914 ) ) ( not ( = ?auto_127913 ?auto_127915 ) ) ( not ( = ?auto_127914 ?auto_127915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_127915 ?auto_127914 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127931 - BLOCK
      ?auto_127932 - BLOCK
      ?auto_127933 - BLOCK
      ?auto_127934 - BLOCK
      ?auto_127935 - BLOCK
      ?auto_127936 - BLOCK
    )
    :vars
    (
      ?auto_127937 - BLOCK
      ?auto_127938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127931 ) ( ON ?auto_127932 ?auto_127931 ) ( ON ?auto_127933 ?auto_127932 ) ( ON ?auto_127934 ?auto_127933 ) ( ON ?auto_127935 ?auto_127934 ) ( not ( = ?auto_127931 ?auto_127932 ) ) ( not ( = ?auto_127931 ?auto_127933 ) ) ( not ( = ?auto_127931 ?auto_127934 ) ) ( not ( = ?auto_127931 ?auto_127935 ) ) ( not ( = ?auto_127931 ?auto_127936 ) ) ( not ( = ?auto_127931 ?auto_127937 ) ) ( not ( = ?auto_127932 ?auto_127933 ) ) ( not ( = ?auto_127932 ?auto_127934 ) ) ( not ( = ?auto_127932 ?auto_127935 ) ) ( not ( = ?auto_127932 ?auto_127936 ) ) ( not ( = ?auto_127932 ?auto_127937 ) ) ( not ( = ?auto_127933 ?auto_127934 ) ) ( not ( = ?auto_127933 ?auto_127935 ) ) ( not ( = ?auto_127933 ?auto_127936 ) ) ( not ( = ?auto_127933 ?auto_127937 ) ) ( not ( = ?auto_127934 ?auto_127935 ) ) ( not ( = ?auto_127934 ?auto_127936 ) ) ( not ( = ?auto_127934 ?auto_127937 ) ) ( not ( = ?auto_127935 ?auto_127936 ) ) ( not ( = ?auto_127935 ?auto_127937 ) ) ( not ( = ?auto_127936 ?auto_127937 ) ) ( ON ?auto_127937 ?auto_127938 ) ( CLEAR ?auto_127937 ) ( not ( = ?auto_127931 ?auto_127938 ) ) ( not ( = ?auto_127932 ?auto_127938 ) ) ( not ( = ?auto_127933 ?auto_127938 ) ) ( not ( = ?auto_127934 ?auto_127938 ) ) ( not ( = ?auto_127935 ?auto_127938 ) ) ( not ( = ?auto_127936 ?auto_127938 ) ) ( not ( = ?auto_127937 ?auto_127938 ) ) ( HOLDING ?auto_127936 ) ( CLEAR ?auto_127935 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_127931 ?auto_127932 ?auto_127933 ?auto_127934 ?auto_127935 ?auto_127936 ?auto_127937 )
      ( MAKE-6PILE ?auto_127931 ?auto_127932 ?auto_127933 ?auto_127934 ?auto_127935 ?auto_127936 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127939 - BLOCK
      ?auto_127940 - BLOCK
      ?auto_127941 - BLOCK
      ?auto_127942 - BLOCK
      ?auto_127943 - BLOCK
      ?auto_127944 - BLOCK
    )
    :vars
    (
      ?auto_127945 - BLOCK
      ?auto_127946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127939 ) ( ON ?auto_127940 ?auto_127939 ) ( ON ?auto_127941 ?auto_127940 ) ( ON ?auto_127942 ?auto_127941 ) ( ON ?auto_127943 ?auto_127942 ) ( not ( = ?auto_127939 ?auto_127940 ) ) ( not ( = ?auto_127939 ?auto_127941 ) ) ( not ( = ?auto_127939 ?auto_127942 ) ) ( not ( = ?auto_127939 ?auto_127943 ) ) ( not ( = ?auto_127939 ?auto_127944 ) ) ( not ( = ?auto_127939 ?auto_127945 ) ) ( not ( = ?auto_127940 ?auto_127941 ) ) ( not ( = ?auto_127940 ?auto_127942 ) ) ( not ( = ?auto_127940 ?auto_127943 ) ) ( not ( = ?auto_127940 ?auto_127944 ) ) ( not ( = ?auto_127940 ?auto_127945 ) ) ( not ( = ?auto_127941 ?auto_127942 ) ) ( not ( = ?auto_127941 ?auto_127943 ) ) ( not ( = ?auto_127941 ?auto_127944 ) ) ( not ( = ?auto_127941 ?auto_127945 ) ) ( not ( = ?auto_127942 ?auto_127943 ) ) ( not ( = ?auto_127942 ?auto_127944 ) ) ( not ( = ?auto_127942 ?auto_127945 ) ) ( not ( = ?auto_127943 ?auto_127944 ) ) ( not ( = ?auto_127943 ?auto_127945 ) ) ( not ( = ?auto_127944 ?auto_127945 ) ) ( ON ?auto_127945 ?auto_127946 ) ( not ( = ?auto_127939 ?auto_127946 ) ) ( not ( = ?auto_127940 ?auto_127946 ) ) ( not ( = ?auto_127941 ?auto_127946 ) ) ( not ( = ?auto_127942 ?auto_127946 ) ) ( not ( = ?auto_127943 ?auto_127946 ) ) ( not ( = ?auto_127944 ?auto_127946 ) ) ( not ( = ?auto_127945 ?auto_127946 ) ) ( CLEAR ?auto_127943 ) ( ON ?auto_127944 ?auto_127945 ) ( CLEAR ?auto_127944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_127946 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127946 ?auto_127945 )
      ( MAKE-6PILE ?auto_127939 ?auto_127940 ?auto_127941 ?auto_127942 ?auto_127943 ?auto_127944 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127947 - BLOCK
      ?auto_127948 - BLOCK
      ?auto_127949 - BLOCK
      ?auto_127950 - BLOCK
      ?auto_127951 - BLOCK
      ?auto_127952 - BLOCK
    )
    :vars
    (
      ?auto_127953 - BLOCK
      ?auto_127954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127947 ) ( ON ?auto_127948 ?auto_127947 ) ( ON ?auto_127949 ?auto_127948 ) ( ON ?auto_127950 ?auto_127949 ) ( not ( = ?auto_127947 ?auto_127948 ) ) ( not ( = ?auto_127947 ?auto_127949 ) ) ( not ( = ?auto_127947 ?auto_127950 ) ) ( not ( = ?auto_127947 ?auto_127951 ) ) ( not ( = ?auto_127947 ?auto_127952 ) ) ( not ( = ?auto_127947 ?auto_127953 ) ) ( not ( = ?auto_127948 ?auto_127949 ) ) ( not ( = ?auto_127948 ?auto_127950 ) ) ( not ( = ?auto_127948 ?auto_127951 ) ) ( not ( = ?auto_127948 ?auto_127952 ) ) ( not ( = ?auto_127948 ?auto_127953 ) ) ( not ( = ?auto_127949 ?auto_127950 ) ) ( not ( = ?auto_127949 ?auto_127951 ) ) ( not ( = ?auto_127949 ?auto_127952 ) ) ( not ( = ?auto_127949 ?auto_127953 ) ) ( not ( = ?auto_127950 ?auto_127951 ) ) ( not ( = ?auto_127950 ?auto_127952 ) ) ( not ( = ?auto_127950 ?auto_127953 ) ) ( not ( = ?auto_127951 ?auto_127952 ) ) ( not ( = ?auto_127951 ?auto_127953 ) ) ( not ( = ?auto_127952 ?auto_127953 ) ) ( ON ?auto_127953 ?auto_127954 ) ( not ( = ?auto_127947 ?auto_127954 ) ) ( not ( = ?auto_127948 ?auto_127954 ) ) ( not ( = ?auto_127949 ?auto_127954 ) ) ( not ( = ?auto_127950 ?auto_127954 ) ) ( not ( = ?auto_127951 ?auto_127954 ) ) ( not ( = ?auto_127952 ?auto_127954 ) ) ( not ( = ?auto_127953 ?auto_127954 ) ) ( ON ?auto_127952 ?auto_127953 ) ( CLEAR ?auto_127952 ) ( ON-TABLE ?auto_127954 ) ( HOLDING ?auto_127951 ) ( CLEAR ?auto_127950 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127947 ?auto_127948 ?auto_127949 ?auto_127950 ?auto_127951 )
      ( MAKE-6PILE ?auto_127947 ?auto_127948 ?auto_127949 ?auto_127950 ?auto_127951 ?auto_127952 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127955 - BLOCK
      ?auto_127956 - BLOCK
      ?auto_127957 - BLOCK
      ?auto_127958 - BLOCK
      ?auto_127959 - BLOCK
      ?auto_127960 - BLOCK
    )
    :vars
    (
      ?auto_127961 - BLOCK
      ?auto_127962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127955 ) ( ON ?auto_127956 ?auto_127955 ) ( ON ?auto_127957 ?auto_127956 ) ( ON ?auto_127958 ?auto_127957 ) ( not ( = ?auto_127955 ?auto_127956 ) ) ( not ( = ?auto_127955 ?auto_127957 ) ) ( not ( = ?auto_127955 ?auto_127958 ) ) ( not ( = ?auto_127955 ?auto_127959 ) ) ( not ( = ?auto_127955 ?auto_127960 ) ) ( not ( = ?auto_127955 ?auto_127961 ) ) ( not ( = ?auto_127956 ?auto_127957 ) ) ( not ( = ?auto_127956 ?auto_127958 ) ) ( not ( = ?auto_127956 ?auto_127959 ) ) ( not ( = ?auto_127956 ?auto_127960 ) ) ( not ( = ?auto_127956 ?auto_127961 ) ) ( not ( = ?auto_127957 ?auto_127958 ) ) ( not ( = ?auto_127957 ?auto_127959 ) ) ( not ( = ?auto_127957 ?auto_127960 ) ) ( not ( = ?auto_127957 ?auto_127961 ) ) ( not ( = ?auto_127958 ?auto_127959 ) ) ( not ( = ?auto_127958 ?auto_127960 ) ) ( not ( = ?auto_127958 ?auto_127961 ) ) ( not ( = ?auto_127959 ?auto_127960 ) ) ( not ( = ?auto_127959 ?auto_127961 ) ) ( not ( = ?auto_127960 ?auto_127961 ) ) ( ON ?auto_127961 ?auto_127962 ) ( not ( = ?auto_127955 ?auto_127962 ) ) ( not ( = ?auto_127956 ?auto_127962 ) ) ( not ( = ?auto_127957 ?auto_127962 ) ) ( not ( = ?auto_127958 ?auto_127962 ) ) ( not ( = ?auto_127959 ?auto_127962 ) ) ( not ( = ?auto_127960 ?auto_127962 ) ) ( not ( = ?auto_127961 ?auto_127962 ) ) ( ON ?auto_127960 ?auto_127961 ) ( ON-TABLE ?auto_127962 ) ( CLEAR ?auto_127958 ) ( ON ?auto_127959 ?auto_127960 ) ( CLEAR ?auto_127959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127962 ?auto_127961 ?auto_127960 )
      ( MAKE-6PILE ?auto_127955 ?auto_127956 ?auto_127957 ?auto_127958 ?auto_127959 ?auto_127960 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127963 - BLOCK
      ?auto_127964 - BLOCK
      ?auto_127965 - BLOCK
      ?auto_127966 - BLOCK
      ?auto_127967 - BLOCK
      ?auto_127968 - BLOCK
    )
    :vars
    (
      ?auto_127969 - BLOCK
      ?auto_127970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127963 ) ( ON ?auto_127964 ?auto_127963 ) ( ON ?auto_127965 ?auto_127964 ) ( not ( = ?auto_127963 ?auto_127964 ) ) ( not ( = ?auto_127963 ?auto_127965 ) ) ( not ( = ?auto_127963 ?auto_127966 ) ) ( not ( = ?auto_127963 ?auto_127967 ) ) ( not ( = ?auto_127963 ?auto_127968 ) ) ( not ( = ?auto_127963 ?auto_127969 ) ) ( not ( = ?auto_127964 ?auto_127965 ) ) ( not ( = ?auto_127964 ?auto_127966 ) ) ( not ( = ?auto_127964 ?auto_127967 ) ) ( not ( = ?auto_127964 ?auto_127968 ) ) ( not ( = ?auto_127964 ?auto_127969 ) ) ( not ( = ?auto_127965 ?auto_127966 ) ) ( not ( = ?auto_127965 ?auto_127967 ) ) ( not ( = ?auto_127965 ?auto_127968 ) ) ( not ( = ?auto_127965 ?auto_127969 ) ) ( not ( = ?auto_127966 ?auto_127967 ) ) ( not ( = ?auto_127966 ?auto_127968 ) ) ( not ( = ?auto_127966 ?auto_127969 ) ) ( not ( = ?auto_127967 ?auto_127968 ) ) ( not ( = ?auto_127967 ?auto_127969 ) ) ( not ( = ?auto_127968 ?auto_127969 ) ) ( ON ?auto_127969 ?auto_127970 ) ( not ( = ?auto_127963 ?auto_127970 ) ) ( not ( = ?auto_127964 ?auto_127970 ) ) ( not ( = ?auto_127965 ?auto_127970 ) ) ( not ( = ?auto_127966 ?auto_127970 ) ) ( not ( = ?auto_127967 ?auto_127970 ) ) ( not ( = ?auto_127968 ?auto_127970 ) ) ( not ( = ?auto_127969 ?auto_127970 ) ) ( ON ?auto_127968 ?auto_127969 ) ( ON-TABLE ?auto_127970 ) ( ON ?auto_127967 ?auto_127968 ) ( CLEAR ?auto_127967 ) ( HOLDING ?auto_127966 ) ( CLEAR ?auto_127965 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127963 ?auto_127964 ?auto_127965 ?auto_127966 )
      ( MAKE-6PILE ?auto_127963 ?auto_127964 ?auto_127965 ?auto_127966 ?auto_127967 ?auto_127968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127971 - BLOCK
      ?auto_127972 - BLOCK
      ?auto_127973 - BLOCK
      ?auto_127974 - BLOCK
      ?auto_127975 - BLOCK
      ?auto_127976 - BLOCK
    )
    :vars
    (
      ?auto_127977 - BLOCK
      ?auto_127978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127971 ) ( ON ?auto_127972 ?auto_127971 ) ( ON ?auto_127973 ?auto_127972 ) ( not ( = ?auto_127971 ?auto_127972 ) ) ( not ( = ?auto_127971 ?auto_127973 ) ) ( not ( = ?auto_127971 ?auto_127974 ) ) ( not ( = ?auto_127971 ?auto_127975 ) ) ( not ( = ?auto_127971 ?auto_127976 ) ) ( not ( = ?auto_127971 ?auto_127977 ) ) ( not ( = ?auto_127972 ?auto_127973 ) ) ( not ( = ?auto_127972 ?auto_127974 ) ) ( not ( = ?auto_127972 ?auto_127975 ) ) ( not ( = ?auto_127972 ?auto_127976 ) ) ( not ( = ?auto_127972 ?auto_127977 ) ) ( not ( = ?auto_127973 ?auto_127974 ) ) ( not ( = ?auto_127973 ?auto_127975 ) ) ( not ( = ?auto_127973 ?auto_127976 ) ) ( not ( = ?auto_127973 ?auto_127977 ) ) ( not ( = ?auto_127974 ?auto_127975 ) ) ( not ( = ?auto_127974 ?auto_127976 ) ) ( not ( = ?auto_127974 ?auto_127977 ) ) ( not ( = ?auto_127975 ?auto_127976 ) ) ( not ( = ?auto_127975 ?auto_127977 ) ) ( not ( = ?auto_127976 ?auto_127977 ) ) ( ON ?auto_127977 ?auto_127978 ) ( not ( = ?auto_127971 ?auto_127978 ) ) ( not ( = ?auto_127972 ?auto_127978 ) ) ( not ( = ?auto_127973 ?auto_127978 ) ) ( not ( = ?auto_127974 ?auto_127978 ) ) ( not ( = ?auto_127975 ?auto_127978 ) ) ( not ( = ?auto_127976 ?auto_127978 ) ) ( not ( = ?auto_127977 ?auto_127978 ) ) ( ON ?auto_127976 ?auto_127977 ) ( ON-TABLE ?auto_127978 ) ( ON ?auto_127975 ?auto_127976 ) ( CLEAR ?auto_127973 ) ( ON ?auto_127974 ?auto_127975 ) ( CLEAR ?auto_127974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_127978 ?auto_127977 ?auto_127976 ?auto_127975 )
      ( MAKE-6PILE ?auto_127971 ?auto_127972 ?auto_127973 ?auto_127974 ?auto_127975 ?auto_127976 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127979 - BLOCK
      ?auto_127980 - BLOCK
      ?auto_127981 - BLOCK
      ?auto_127982 - BLOCK
      ?auto_127983 - BLOCK
      ?auto_127984 - BLOCK
    )
    :vars
    (
      ?auto_127985 - BLOCK
      ?auto_127986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127979 ) ( ON ?auto_127980 ?auto_127979 ) ( not ( = ?auto_127979 ?auto_127980 ) ) ( not ( = ?auto_127979 ?auto_127981 ) ) ( not ( = ?auto_127979 ?auto_127982 ) ) ( not ( = ?auto_127979 ?auto_127983 ) ) ( not ( = ?auto_127979 ?auto_127984 ) ) ( not ( = ?auto_127979 ?auto_127985 ) ) ( not ( = ?auto_127980 ?auto_127981 ) ) ( not ( = ?auto_127980 ?auto_127982 ) ) ( not ( = ?auto_127980 ?auto_127983 ) ) ( not ( = ?auto_127980 ?auto_127984 ) ) ( not ( = ?auto_127980 ?auto_127985 ) ) ( not ( = ?auto_127981 ?auto_127982 ) ) ( not ( = ?auto_127981 ?auto_127983 ) ) ( not ( = ?auto_127981 ?auto_127984 ) ) ( not ( = ?auto_127981 ?auto_127985 ) ) ( not ( = ?auto_127982 ?auto_127983 ) ) ( not ( = ?auto_127982 ?auto_127984 ) ) ( not ( = ?auto_127982 ?auto_127985 ) ) ( not ( = ?auto_127983 ?auto_127984 ) ) ( not ( = ?auto_127983 ?auto_127985 ) ) ( not ( = ?auto_127984 ?auto_127985 ) ) ( ON ?auto_127985 ?auto_127986 ) ( not ( = ?auto_127979 ?auto_127986 ) ) ( not ( = ?auto_127980 ?auto_127986 ) ) ( not ( = ?auto_127981 ?auto_127986 ) ) ( not ( = ?auto_127982 ?auto_127986 ) ) ( not ( = ?auto_127983 ?auto_127986 ) ) ( not ( = ?auto_127984 ?auto_127986 ) ) ( not ( = ?auto_127985 ?auto_127986 ) ) ( ON ?auto_127984 ?auto_127985 ) ( ON-TABLE ?auto_127986 ) ( ON ?auto_127983 ?auto_127984 ) ( ON ?auto_127982 ?auto_127983 ) ( CLEAR ?auto_127982 ) ( HOLDING ?auto_127981 ) ( CLEAR ?auto_127980 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_127979 ?auto_127980 ?auto_127981 )
      ( MAKE-6PILE ?auto_127979 ?auto_127980 ?auto_127981 ?auto_127982 ?auto_127983 ?auto_127984 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127987 - BLOCK
      ?auto_127988 - BLOCK
      ?auto_127989 - BLOCK
      ?auto_127990 - BLOCK
      ?auto_127991 - BLOCK
      ?auto_127992 - BLOCK
    )
    :vars
    (
      ?auto_127994 - BLOCK
      ?auto_127993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127987 ) ( ON ?auto_127988 ?auto_127987 ) ( not ( = ?auto_127987 ?auto_127988 ) ) ( not ( = ?auto_127987 ?auto_127989 ) ) ( not ( = ?auto_127987 ?auto_127990 ) ) ( not ( = ?auto_127987 ?auto_127991 ) ) ( not ( = ?auto_127987 ?auto_127992 ) ) ( not ( = ?auto_127987 ?auto_127994 ) ) ( not ( = ?auto_127988 ?auto_127989 ) ) ( not ( = ?auto_127988 ?auto_127990 ) ) ( not ( = ?auto_127988 ?auto_127991 ) ) ( not ( = ?auto_127988 ?auto_127992 ) ) ( not ( = ?auto_127988 ?auto_127994 ) ) ( not ( = ?auto_127989 ?auto_127990 ) ) ( not ( = ?auto_127989 ?auto_127991 ) ) ( not ( = ?auto_127989 ?auto_127992 ) ) ( not ( = ?auto_127989 ?auto_127994 ) ) ( not ( = ?auto_127990 ?auto_127991 ) ) ( not ( = ?auto_127990 ?auto_127992 ) ) ( not ( = ?auto_127990 ?auto_127994 ) ) ( not ( = ?auto_127991 ?auto_127992 ) ) ( not ( = ?auto_127991 ?auto_127994 ) ) ( not ( = ?auto_127992 ?auto_127994 ) ) ( ON ?auto_127994 ?auto_127993 ) ( not ( = ?auto_127987 ?auto_127993 ) ) ( not ( = ?auto_127988 ?auto_127993 ) ) ( not ( = ?auto_127989 ?auto_127993 ) ) ( not ( = ?auto_127990 ?auto_127993 ) ) ( not ( = ?auto_127991 ?auto_127993 ) ) ( not ( = ?auto_127992 ?auto_127993 ) ) ( not ( = ?auto_127994 ?auto_127993 ) ) ( ON ?auto_127992 ?auto_127994 ) ( ON-TABLE ?auto_127993 ) ( ON ?auto_127991 ?auto_127992 ) ( ON ?auto_127990 ?auto_127991 ) ( CLEAR ?auto_127988 ) ( ON ?auto_127989 ?auto_127990 ) ( CLEAR ?auto_127989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_127993 ?auto_127994 ?auto_127992 ?auto_127991 ?auto_127990 )
      ( MAKE-6PILE ?auto_127987 ?auto_127988 ?auto_127989 ?auto_127990 ?auto_127991 ?auto_127992 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_127995 - BLOCK
      ?auto_127996 - BLOCK
      ?auto_127997 - BLOCK
      ?auto_127998 - BLOCK
      ?auto_127999 - BLOCK
      ?auto_128000 - BLOCK
    )
    :vars
    (
      ?auto_128002 - BLOCK
      ?auto_128001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_127995 ) ( not ( = ?auto_127995 ?auto_127996 ) ) ( not ( = ?auto_127995 ?auto_127997 ) ) ( not ( = ?auto_127995 ?auto_127998 ) ) ( not ( = ?auto_127995 ?auto_127999 ) ) ( not ( = ?auto_127995 ?auto_128000 ) ) ( not ( = ?auto_127995 ?auto_128002 ) ) ( not ( = ?auto_127996 ?auto_127997 ) ) ( not ( = ?auto_127996 ?auto_127998 ) ) ( not ( = ?auto_127996 ?auto_127999 ) ) ( not ( = ?auto_127996 ?auto_128000 ) ) ( not ( = ?auto_127996 ?auto_128002 ) ) ( not ( = ?auto_127997 ?auto_127998 ) ) ( not ( = ?auto_127997 ?auto_127999 ) ) ( not ( = ?auto_127997 ?auto_128000 ) ) ( not ( = ?auto_127997 ?auto_128002 ) ) ( not ( = ?auto_127998 ?auto_127999 ) ) ( not ( = ?auto_127998 ?auto_128000 ) ) ( not ( = ?auto_127998 ?auto_128002 ) ) ( not ( = ?auto_127999 ?auto_128000 ) ) ( not ( = ?auto_127999 ?auto_128002 ) ) ( not ( = ?auto_128000 ?auto_128002 ) ) ( ON ?auto_128002 ?auto_128001 ) ( not ( = ?auto_127995 ?auto_128001 ) ) ( not ( = ?auto_127996 ?auto_128001 ) ) ( not ( = ?auto_127997 ?auto_128001 ) ) ( not ( = ?auto_127998 ?auto_128001 ) ) ( not ( = ?auto_127999 ?auto_128001 ) ) ( not ( = ?auto_128000 ?auto_128001 ) ) ( not ( = ?auto_128002 ?auto_128001 ) ) ( ON ?auto_128000 ?auto_128002 ) ( ON-TABLE ?auto_128001 ) ( ON ?auto_127999 ?auto_128000 ) ( ON ?auto_127998 ?auto_127999 ) ( ON ?auto_127997 ?auto_127998 ) ( CLEAR ?auto_127997 ) ( HOLDING ?auto_127996 ) ( CLEAR ?auto_127995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_127995 ?auto_127996 )
      ( MAKE-6PILE ?auto_127995 ?auto_127996 ?auto_127997 ?auto_127998 ?auto_127999 ?auto_128000 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128003 - BLOCK
      ?auto_128004 - BLOCK
      ?auto_128005 - BLOCK
      ?auto_128006 - BLOCK
      ?auto_128007 - BLOCK
      ?auto_128008 - BLOCK
    )
    :vars
    (
      ?auto_128010 - BLOCK
      ?auto_128009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128003 ) ( not ( = ?auto_128003 ?auto_128004 ) ) ( not ( = ?auto_128003 ?auto_128005 ) ) ( not ( = ?auto_128003 ?auto_128006 ) ) ( not ( = ?auto_128003 ?auto_128007 ) ) ( not ( = ?auto_128003 ?auto_128008 ) ) ( not ( = ?auto_128003 ?auto_128010 ) ) ( not ( = ?auto_128004 ?auto_128005 ) ) ( not ( = ?auto_128004 ?auto_128006 ) ) ( not ( = ?auto_128004 ?auto_128007 ) ) ( not ( = ?auto_128004 ?auto_128008 ) ) ( not ( = ?auto_128004 ?auto_128010 ) ) ( not ( = ?auto_128005 ?auto_128006 ) ) ( not ( = ?auto_128005 ?auto_128007 ) ) ( not ( = ?auto_128005 ?auto_128008 ) ) ( not ( = ?auto_128005 ?auto_128010 ) ) ( not ( = ?auto_128006 ?auto_128007 ) ) ( not ( = ?auto_128006 ?auto_128008 ) ) ( not ( = ?auto_128006 ?auto_128010 ) ) ( not ( = ?auto_128007 ?auto_128008 ) ) ( not ( = ?auto_128007 ?auto_128010 ) ) ( not ( = ?auto_128008 ?auto_128010 ) ) ( ON ?auto_128010 ?auto_128009 ) ( not ( = ?auto_128003 ?auto_128009 ) ) ( not ( = ?auto_128004 ?auto_128009 ) ) ( not ( = ?auto_128005 ?auto_128009 ) ) ( not ( = ?auto_128006 ?auto_128009 ) ) ( not ( = ?auto_128007 ?auto_128009 ) ) ( not ( = ?auto_128008 ?auto_128009 ) ) ( not ( = ?auto_128010 ?auto_128009 ) ) ( ON ?auto_128008 ?auto_128010 ) ( ON-TABLE ?auto_128009 ) ( ON ?auto_128007 ?auto_128008 ) ( ON ?auto_128006 ?auto_128007 ) ( ON ?auto_128005 ?auto_128006 ) ( CLEAR ?auto_128003 ) ( ON ?auto_128004 ?auto_128005 ) ( CLEAR ?auto_128004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128009 ?auto_128010 ?auto_128008 ?auto_128007 ?auto_128006 ?auto_128005 )
      ( MAKE-6PILE ?auto_128003 ?auto_128004 ?auto_128005 ?auto_128006 ?auto_128007 ?auto_128008 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128011 - BLOCK
      ?auto_128012 - BLOCK
      ?auto_128013 - BLOCK
      ?auto_128014 - BLOCK
      ?auto_128015 - BLOCK
      ?auto_128016 - BLOCK
    )
    :vars
    (
      ?auto_128018 - BLOCK
      ?auto_128017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128011 ?auto_128012 ) ) ( not ( = ?auto_128011 ?auto_128013 ) ) ( not ( = ?auto_128011 ?auto_128014 ) ) ( not ( = ?auto_128011 ?auto_128015 ) ) ( not ( = ?auto_128011 ?auto_128016 ) ) ( not ( = ?auto_128011 ?auto_128018 ) ) ( not ( = ?auto_128012 ?auto_128013 ) ) ( not ( = ?auto_128012 ?auto_128014 ) ) ( not ( = ?auto_128012 ?auto_128015 ) ) ( not ( = ?auto_128012 ?auto_128016 ) ) ( not ( = ?auto_128012 ?auto_128018 ) ) ( not ( = ?auto_128013 ?auto_128014 ) ) ( not ( = ?auto_128013 ?auto_128015 ) ) ( not ( = ?auto_128013 ?auto_128016 ) ) ( not ( = ?auto_128013 ?auto_128018 ) ) ( not ( = ?auto_128014 ?auto_128015 ) ) ( not ( = ?auto_128014 ?auto_128016 ) ) ( not ( = ?auto_128014 ?auto_128018 ) ) ( not ( = ?auto_128015 ?auto_128016 ) ) ( not ( = ?auto_128015 ?auto_128018 ) ) ( not ( = ?auto_128016 ?auto_128018 ) ) ( ON ?auto_128018 ?auto_128017 ) ( not ( = ?auto_128011 ?auto_128017 ) ) ( not ( = ?auto_128012 ?auto_128017 ) ) ( not ( = ?auto_128013 ?auto_128017 ) ) ( not ( = ?auto_128014 ?auto_128017 ) ) ( not ( = ?auto_128015 ?auto_128017 ) ) ( not ( = ?auto_128016 ?auto_128017 ) ) ( not ( = ?auto_128018 ?auto_128017 ) ) ( ON ?auto_128016 ?auto_128018 ) ( ON-TABLE ?auto_128017 ) ( ON ?auto_128015 ?auto_128016 ) ( ON ?auto_128014 ?auto_128015 ) ( ON ?auto_128013 ?auto_128014 ) ( ON ?auto_128012 ?auto_128013 ) ( CLEAR ?auto_128012 ) ( HOLDING ?auto_128011 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128011 )
      ( MAKE-6PILE ?auto_128011 ?auto_128012 ?auto_128013 ?auto_128014 ?auto_128015 ?auto_128016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_128019 - BLOCK
      ?auto_128020 - BLOCK
      ?auto_128021 - BLOCK
      ?auto_128022 - BLOCK
      ?auto_128023 - BLOCK
      ?auto_128024 - BLOCK
    )
    :vars
    (
      ?auto_128025 - BLOCK
      ?auto_128026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128019 ?auto_128020 ) ) ( not ( = ?auto_128019 ?auto_128021 ) ) ( not ( = ?auto_128019 ?auto_128022 ) ) ( not ( = ?auto_128019 ?auto_128023 ) ) ( not ( = ?auto_128019 ?auto_128024 ) ) ( not ( = ?auto_128019 ?auto_128025 ) ) ( not ( = ?auto_128020 ?auto_128021 ) ) ( not ( = ?auto_128020 ?auto_128022 ) ) ( not ( = ?auto_128020 ?auto_128023 ) ) ( not ( = ?auto_128020 ?auto_128024 ) ) ( not ( = ?auto_128020 ?auto_128025 ) ) ( not ( = ?auto_128021 ?auto_128022 ) ) ( not ( = ?auto_128021 ?auto_128023 ) ) ( not ( = ?auto_128021 ?auto_128024 ) ) ( not ( = ?auto_128021 ?auto_128025 ) ) ( not ( = ?auto_128022 ?auto_128023 ) ) ( not ( = ?auto_128022 ?auto_128024 ) ) ( not ( = ?auto_128022 ?auto_128025 ) ) ( not ( = ?auto_128023 ?auto_128024 ) ) ( not ( = ?auto_128023 ?auto_128025 ) ) ( not ( = ?auto_128024 ?auto_128025 ) ) ( ON ?auto_128025 ?auto_128026 ) ( not ( = ?auto_128019 ?auto_128026 ) ) ( not ( = ?auto_128020 ?auto_128026 ) ) ( not ( = ?auto_128021 ?auto_128026 ) ) ( not ( = ?auto_128022 ?auto_128026 ) ) ( not ( = ?auto_128023 ?auto_128026 ) ) ( not ( = ?auto_128024 ?auto_128026 ) ) ( not ( = ?auto_128025 ?auto_128026 ) ) ( ON ?auto_128024 ?auto_128025 ) ( ON-TABLE ?auto_128026 ) ( ON ?auto_128023 ?auto_128024 ) ( ON ?auto_128022 ?auto_128023 ) ( ON ?auto_128021 ?auto_128022 ) ( ON ?auto_128020 ?auto_128021 ) ( ON ?auto_128019 ?auto_128020 ) ( CLEAR ?auto_128019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128026 ?auto_128025 ?auto_128024 ?auto_128023 ?auto_128022 ?auto_128021 ?auto_128020 )
      ( MAKE-6PILE ?auto_128019 ?auto_128020 ?auto_128021 ?auto_128022 ?auto_128023 ?auto_128024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128028 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128028 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_128028 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128029 - BLOCK
    )
    :vars
    (
      ?auto_128030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128029 ?auto_128030 ) ( CLEAR ?auto_128029 ) ( HAND-EMPTY ) ( not ( = ?auto_128029 ?auto_128030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128029 ?auto_128030 )
      ( MAKE-1PILE ?auto_128029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128031 - BLOCK
    )
    :vars
    (
      ?auto_128032 - BLOCK
      ?auto_128034 - BLOCK
      ?auto_128033 - BLOCK
      ?auto_128035 - BLOCK
      ?auto_128037 - BLOCK
      ?auto_128036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128031 ?auto_128032 ) ) ( HOLDING ?auto_128031 ) ( CLEAR ?auto_128032 ) ( ON-TABLE ?auto_128034 ) ( ON ?auto_128033 ?auto_128034 ) ( ON ?auto_128035 ?auto_128033 ) ( ON ?auto_128037 ?auto_128035 ) ( ON ?auto_128036 ?auto_128037 ) ( ON ?auto_128032 ?auto_128036 ) ( not ( = ?auto_128034 ?auto_128033 ) ) ( not ( = ?auto_128034 ?auto_128035 ) ) ( not ( = ?auto_128034 ?auto_128037 ) ) ( not ( = ?auto_128034 ?auto_128036 ) ) ( not ( = ?auto_128034 ?auto_128032 ) ) ( not ( = ?auto_128034 ?auto_128031 ) ) ( not ( = ?auto_128033 ?auto_128035 ) ) ( not ( = ?auto_128033 ?auto_128037 ) ) ( not ( = ?auto_128033 ?auto_128036 ) ) ( not ( = ?auto_128033 ?auto_128032 ) ) ( not ( = ?auto_128033 ?auto_128031 ) ) ( not ( = ?auto_128035 ?auto_128037 ) ) ( not ( = ?auto_128035 ?auto_128036 ) ) ( not ( = ?auto_128035 ?auto_128032 ) ) ( not ( = ?auto_128035 ?auto_128031 ) ) ( not ( = ?auto_128037 ?auto_128036 ) ) ( not ( = ?auto_128037 ?auto_128032 ) ) ( not ( = ?auto_128037 ?auto_128031 ) ) ( not ( = ?auto_128036 ?auto_128032 ) ) ( not ( = ?auto_128036 ?auto_128031 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128034 ?auto_128033 ?auto_128035 ?auto_128037 ?auto_128036 ?auto_128032 ?auto_128031 )
      ( MAKE-1PILE ?auto_128031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128038 - BLOCK
    )
    :vars
    (
      ?auto_128041 - BLOCK
      ?auto_128039 - BLOCK
      ?auto_128042 - BLOCK
      ?auto_128044 - BLOCK
      ?auto_128043 - BLOCK
      ?auto_128040 - BLOCK
      ?auto_128045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128038 ?auto_128041 ) ) ( CLEAR ?auto_128041 ) ( ON-TABLE ?auto_128039 ) ( ON ?auto_128042 ?auto_128039 ) ( ON ?auto_128044 ?auto_128042 ) ( ON ?auto_128043 ?auto_128044 ) ( ON ?auto_128040 ?auto_128043 ) ( ON ?auto_128041 ?auto_128040 ) ( not ( = ?auto_128039 ?auto_128042 ) ) ( not ( = ?auto_128039 ?auto_128044 ) ) ( not ( = ?auto_128039 ?auto_128043 ) ) ( not ( = ?auto_128039 ?auto_128040 ) ) ( not ( = ?auto_128039 ?auto_128041 ) ) ( not ( = ?auto_128039 ?auto_128038 ) ) ( not ( = ?auto_128042 ?auto_128044 ) ) ( not ( = ?auto_128042 ?auto_128043 ) ) ( not ( = ?auto_128042 ?auto_128040 ) ) ( not ( = ?auto_128042 ?auto_128041 ) ) ( not ( = ?auto_128042 ?auto_128038 ) ) ( not ( = ?auto_128044 ?auto_128043 ) ) ( not ( = ?auto_128044 ?auto_128040 ) ) ( not ( = ?auto_128044 ?auto_128041 ) ) ( not ( = ?auto_128044 ?auto_128038 ) ) ( not ( = ?auto_128043 ?auto_128040 ) ) ( not ( = ?auto_128043 ?auto_128041 ) ) ( not ( = ?auto_128043 ?auto_128038 ) ) ( not ( = ?auto_128040 ?auto_128041 ) ) ( not ( = ?auto_128040 ?auto_128038 ) ) ( ON ?auto_128038 ?auto_128045 ) ( CLEAR ?auto_128038 ) ( HAND-EMPTY ) ( not ( = ?auto_128038 ?auto_128045 ) ) ( not ( = ?auto_128041 ?auto_128045 ) ) ( not ( = ?auto_128039 ?auto_128045 ) ) ( not ( = ?auto_128042 ?auto_128045 ) ) ( not ( = ?auto_128044 ?auto_128045 ) ) ( not ( = ?auto_128043 ?auto_128045 ) ) ( not ( = ?auto_128040 ?auto_128045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128038 ?auto_128045 )
      ( MAKE-1PILE ?auto_128038 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128046 - BLOCK
    )
    :vars
    (
      ?auto_128050 - BLOCK
      ?auto_128052 - BLOCK
      ?auto_128049 - BLOCK
      ?auto_128053 - BLOCK
      ?auto_128047 - BLOCK
      ?auto_128048 - BLOCK
      ?auto_128051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128046 ?auto_128050 ) ) ( ON-TABLE ?auto_128052 ) ( ON ?auto_128049 ?auto_128052 ) ( ON ?auto_128053 ?auto_128049 ) ( ON ?auto_128047 ?auto_128053 ) ( ON ?auto_128048 ?auto_128047 ) ( not ( = ?auto_128052 ?auto_128049 ) ) ( not ( = ?auto_128052 ?auto_128053 ) ) ( not ( = ?auto_128052 ?auto_128047 ) ) ( not ( = ?auto_128052 ?auto_128048 ) ) ( not ( = ?auto_128052 ?auto_128050 ) ) ( not ( = ?auto_128052 ?auto_128046 ) ) ( not ( = ?auto_128049 ?auto_128053 ) ) ( not ( = ?auto_128049 ?auto_128047 ) ) ( not ( = ?auto_128049 ?auto_128048 ) ) ( not ( = ?auto_128049 ?auto_128050 ) ) ( not ( = ?auto_128049 ?auto_128046 ) ) ( not ( = ?auto_128053 ?auto_128047 ) ) ( not ( = ?auto_128053 ?auto_128048 ) ) ( not ( = ?auto_128053 ?auto_128050 ) ) ( not ( = ?auto_128053 ?auto_128046 ) ) ( not ( = ?auto_128047 ?auto_128048 ) ) ( not ( = ?auto_128047 ?auto_128050 ) ) ( not ( = ?auto_128047 ?auto_128046 ) ) ( not ( = ?auto_128048 ?auto_128050 ) ) ( not ( = ?auto_128048 ?auto_128046 ) ) ( ON ?auto_128046 ?auto_128051 ) ( CLEAR ?auto_128046 ) ( not ( = ?auto_128046 ?auto_128051 ) ) ( not ( = ?auto_128050 ?auto_128051 ) ) ( not ( = ?auto_128052 ?auto_128051 ) ) ( not ( = ?auto_128049 ?auto_128051 ) ) ( not ( = ?auto_128053 ?auto_128051 ) ) ( not ( = ?auto_128047 ?auto_128051 ) ) ( not ( = ?auto_128048 ?auto_128051 ) ) ( HOLDING ?auto_128050 ) ( CLEAR ?auto_128048 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128052 ?auto_128049 ?auto_128053 ?auto_128047 ?auto_128048 ?auto_128050 )
      ( MAKE-1PILE ?auto_128046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128054 - BLOCK
    )
    :vars
    (
      ?auto_128055 - BLOCK
      ?auto_128056 - BLOCK
      ?auto_128058 - BLOCK
      ?auto_128060 - BLOCK
      ?auto_128059 - BLOCK
      ?auto_128061 - BLOCK
      ?auto_128057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128054 ?auto_128055 ) ) ( ON-TABLE ?auto_128056 ) ( ON ?auto_128058 ?auto_128056 ) ( ON ?auto_128060 ?auto_128058 ) ( ON ?auto_128059 ?auto_128060 ) ( ON ?auto_128061 ?auto_128059 ) ( not ( = ?auto_128056 ?auto_128058 ) ) ( not ( = ?auto_128056 ?auto_128060 ) ) ( not ( = ?auto_128056 ?auto_128059 ) ) ( not ( = ?auto_128056 ?auto_128061 ) ) ( not ( = ?auto_128056 ?auto_128055 ) ) ( not ( = ?auto_128056 ?auto_128054 ) ) ( not ( = ?auto_128058 ?auto_128060 ) ) ( not ( = ?auto_128058 ?auto_128059 ) ) ( not ( = ?auto_128058 ?auto_128061 ) ) ( not ( = ?auto_128058 ?auto_128055 ) ) ( not ( = ?auto_128058 ?auto_128054 ) ) ( not ( = ?auto_128060 ?auto_128059 ) ) ( not ( = ?auto_128060 ?auto_128061 ) ) ( not ( = ?auto_128060 ?auto_128055 ) ) ( not ( = ?auto_128060 ?auto_128054 ) ) ( not ( = ?auto_128059 ?auto_128061 ) ) ( not ( = ?auto_128059 ?auto_128055 ) ) ( not ( = ?auto_128059 ?auto_128054 ) ) ( not ( = ?auto_128061 ?auto_128055 ) ) ( not ( = ?auto_128061 ?auto_128054 ) ) ( ON ?auto_128054 ?auto_128057 ) ( not ( = ?auto_128054 ?auto_128057 ) ) ( not ( = ?auto_128055 ?auto_128057 ) ) ( not ( = ?auto_128056 ?auto_128057 ) ) ( not ( = ?auto_128058 ?auto_128057 ) ) ( not ( = ?auto_128060 ?auto_128057 ) ) ( not ( = ?auto_128059 ?auto_128057 ) ) ( not ( = ?auto_128061 ?auto_128057 ) ) ( CLEAR ?auto_128061 ) ( ON ?auto_128055 ?auto_128054 ) ( CLEAR ?auto_128055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128057 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128057 ?auto_128054 )
      ( MAKE-1PILE ?auto_128054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128062 - BLOCK
    )
    :vars
    (
      ?auto_128065 - BLOCK
      ?auto_128066 - BLOCK
      ?auto_128069 - BLOCK
      ?auto_128068 - BLOCK
      ?auto_128063 - BLOCK
      ?auto_128064 - BLOCK
      ?auto_128067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128062 ?auto_128065 ) ) ( ON-TABLE ?auto_128066 ) ( ON ?auto_128069 ?auto_128066 ) ( ON ?auto_128068 ?auto_128069 ) ( ON ?auto_128063 ?auto_128068 ) ( not ( = ?auto_128066 ?auto_128069 ) ) ( not ( = ?auto_128066 ?auto_128068 ) ) ( not ( = ?auto_128066 ?auto_128063 ) ) ( not ( = ?auto_128066 ?auto_128064 ) ) ( not ( = ?auto_128066 ?auto_128065 ) ) ( not ( = ?auto_128066 ?auto_128062 ) ) ( not ( = ?auto_128069 ?auto_128068 ) ) ( not ( = ?auto_128069 ?auto_128063 ) ) ( not ( = ?auto_128069 ?auto_128064 ) ) ( not ( = ?auto_128069 ?auto_128065 ) ) ( not ( = ?auto_128069 ?auto_128062 ) ) ( not ( = ?auto_128068 ?auto_128063 ) ) ( not ( = ?auto_128068 ?auto_128064 ) ) ( not ( = ?auto_128068 ?auto_128065 ) ) ( not ( = ?auto_128068 ?auto_128062 ) ) ( not ( = ?auto_128063 ?auto_128064 ) ) ( not ( = ?auto_128063 ?auto_128065 ) ) ( not ( = ?auto_128063 ?auto_128062 ) ) ( not ( = ?auto_128064 ?auto_128065 ) ) ( not ( = ?auto_128064 ?auto_128062 ) ) ( ON ?auto_128062 ?auto_128067 ) ( not ( = ?auto_128062 ?auto_128067 ) ) ( not ( = ?auto_128065 ?auto_128067 ) ) ( not ( = ?auto_128066 ?auto_128067 ) ) ( not ( = ?auto_128069 ?auto_128067 ) ) ( not ( = ?auto_128068 ?auto_128067 ) ) ( not ( = ?auto_128063 ?auto_128067 ) ) ( not ( = ?auto_128064 ?auto_128067 ) ) ( ON ?auto_128065 ?auto_128062 ) ( CLEAR ?auto_128065 ) ( ON-TABLE ?auto_128067 ) ( HOLDING ?auto_128064 ) ( CLEAR ?auto_128063 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128066 ?auto_128069 ?auto_128068 ?auto_128063 ?auto_128064 )
      ( MAKE-1PILE ?auto_128062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128070 - BLOCK
    )
    :vars
    (
      ?auto_128075 - BLOCK
      ?auto_128072 - BLOCK
      ?auto_128074 - BLOCK
      ?auto_128077 - BLOCK
      ?auto_128073 - BLOCK
      ?auto_128076 - BLOCK
      ?auto_128071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128070 ?auto_128075 ) ) ( ON-TABLE ?auto_128072 ) ( ON ?auto_128074 ?auto_128072 ) ( ON ?auto_128077 ?auto_128074 ) ( ON ?auto_128073 ?auto_128077 ) ( not ( = ?auto_128072 ?auto_128074 ) ) ( not ( = ?auto_128072 ?auto_128077 ) ) ( not ( = ?auto_128072 ?auto_128073 ) ) ( not ( = ?auto_128072 ?auto_128076 ) ) ( not ( = ?auto_128072 ?auto_128075 ) ) ( not ( = ?auto_128072 ?auto_128070 ) ) ( not ( = ?auto_128074 ?auto_128077 ) ) ( not ( = ?auto_128074 ?auto_128073 ) ) ( not ( = ?auto_128074 ?auto_128076 ) ) ( not ( = ?auto_128074 ?auto_128075 ) ) ( not ( = ?auto_128074 ?auto_128070 ) ) ( not ( = ?auto_128077 ?auto_128073 ) ) ( not ( = ?auto_128077 ?auto_128076 ) ) ( not ( = ?auto_128077 ?auto_128075 ) ) ( not ( = ?auto_128077 ?auto_128070 ) ) ( not ( = ?auto_128073 ?auto_128076 ) ) ( not ( = ?auto_128073 ?auto_128075 ) ) ( not ( = ?auto_128073 ?auto_128070 ) ) ( not ( = ?auto_128076 ?auto_128075 ) ) ( not ( = ?auto_128076 ?auto_128070 ) ) ( ON ?auto_128070 ?auto_128071 ) ( not ( = ?auto_128070 ?auto_128071 ) ) ( not ( = ?auto_128075 ?auto_128071 ) ) ( not ( = ?auto_128072 ?auto_128071 ) ) ( not ( = ?auto_128074 ?auto_128071 ) ) ( not ( = ?auto_128077 ?auto_128071 ) ) ( not ( = ?auto_128073 ?auto_128071 ) ) ( not ( = ?auto_128076 ?auto_128071 ) ) ( ON ?auto_128075 ?auto_128070 ) ( ON-TABLE ?auto_128071 ) ( CLEAR ?auto_128073 ) ( ON ?auto_128076 ?auto_128075 ) ( CLEAR ?auto_128076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128071 ?auto_128070 ?auto_128075 )
      ( MAKE-1PILE ?auto_128070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128078 - BLOCK
    )
    :vars
    (
      ?auto_128085 - BLOCK
      ?auto_128084 - BLOCK
      ?auto_128081 - BLOCK
      ?auto_128080 - BLOCK
      ?auto_128083 - BLOCK
      ?auto_128082 - BLOCK
      ?auto_128079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128078 ?auto_128085 ) ) ( ON-TABLE ?auto_128084 ) ( ON ?auto_128081 ?auto_128084 ) ( ON ?auto_128080 ?auto_128081 ) ( not ( = ?auto_128084 ?auto_128081 ) ) ( not ( = ?auto_128084 ?auto_128080 ) ) ( not ( = ?auto_128084 ?auto_128083 ) ) ( not ( = ?auto_128084 ?auto_128082 ) ) ( not ( = ?auto_128084 ?auto_128085 ) ) ( not ( = ?auto_128084 ?auto_128078 ) ) ( not ( = ?auto_128081 ?auto_128080 ) ) ( not ( = ?auto_128081 ?auto_128083 ) ) ( not ( = ?auto_128081 ?auto_128082 ) ) ( not ( = ?auto_128081 ?auto_128085 ) ) ( not ( = ?auto_128081 ?auto_128078 ) ) ( not ( = ?auto_128080 ?auto_128083 ) ) ( not ( = ?auto_128080 ?auto_128082 ) ) ( not ( = ?auto_128080 ?auto_128085 ) ) ( not ( = ?auto_128080 ?auto_128078 ) ) ( not ( = ?auto_128083 ?auto_128082 ) ) ( not ( = ?auto_128083 ?auto_128085 ) ) ( not ( = ?auto_128083 ?auto_128078 ) ) ( not ( = ?auto_128082 ?auto_128085 ) ) ( not ( = ?auto_128082 ?auto_128078 ) ) ( ON ?auto_128078 ?auto_128079 ) ( not ( = ?auto_128078 ?auto_128079 ) ) ( not ( = ?auto_128085 ?auto_128079 ) ) ( not ( = ?auto_128084 ?auto_128079 ) ) ( not ( = ?auto_128081 ?auto_128079 ) ) ( not ( = ?auto_128080 ?auto_128079 ) ) ( not ( = ?auto_128083 ?auto_128079 ) ) ( not ( = ?auto_128082 ?auto_128079 ) ) ( ON ?auto_128085 ?auto_128078 ) ( ON-TABLE ?auto_128079 ) ( ON ?auto_128082 ?auto_128085 ) ( CLEAR ?auto_128082 ) ( HOLDING ?auto_128083 ) ( CLEAR ?auto_128080 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128084 ?auto_128081 ?auto_128080 ?auto_128083 )
      ( MAKE-1PILE ?auto_128078 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128086 - BLOCK
    )
    :vars
    (
      ?auto_128087 - BLOCK
      ?auto_128092 - BLOCK
      ?auto_128088 - BLOCK
      ?auto_128091 - BLOCK
      ?auto_128090 - BLOCK
      ?auto_128089 - BLOCK
      ?auto_128093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128086 ?auto_128087 ) ) ( ON-TABLE ?auto_128092 ) ( ON ?auto_128088 ?auto_128092 ) ( ON ?auto_128091 ?auto_128088 ) ( not ( = ?auto_128092 ?auto_128088 ) ) ( not ( = ?auto_128092 ?auto_128091 ) ) ( not ( = ?auto_128092 ?auto_128090 ) ) ( not ( = ?auto_128092 ?auto_128089 ) ) ( not ( = ?auto_128092 ?auto_128087 ) ) ( not ( = ?auto_128092 ?auto_128086 ) ) ( not ( = ?auto_128088 ?auto_128091 ) ) ( not ( = ?auto_128088 ?auto_128090 ) ) ( not ( = ?auto_128088 ?auto_128089 ) ) ( not ( = ?auto_128088 ?auto_128087 ) ) ( not ( = ?auto_128088 ?auto_128086 ) ) ( not ( = ?auto_128091 ?auto_128090 ) ) ( not ( = ?auto_128091 ?auto_128089 ) ) ( not ( = ?auto_128091 ?auto_128087 ) ) ( not ( = ?auto_128091 ?auto_128086 ) ) ( not ( = ?auto_128090 ?auto_128089 ) ) ( not ( = ?auto_128090 ?auto_128087 ) ) ( not ( = ?auto_128090 ?auto_128086 ) ) ( not ( = ?auto_128089 ?auto_128087 ) ) ( not ( = ?auto_128089 ?auto_128086 ) ) ( ON ?auto_128086 ?auto_128093 ) ( not ( = ?auto_128086 ?auto_128093 ) ) ( not ( = ?auto_128087 ?auto_128093 ) ) ( not ( = ?auto_128092 ?auto_128093 ) ) ( not ( = ?auto_128088 ?auto_128093 ) ) ( not ( = ?auto_128091 ?auto_128093 ) ) ( not ( = ?auto_128090 ?auto_128093 ) ) ( not ( = ?auto_128089 ?auto_128093 ) ) ( ON ?auto_128087 ?auto_128086 ) ( ON-TABLE ?auto_128093 ) ( ON ?auto_128089 ?auto_128087 ) ( CLEAR ?auto_128091 ) ( ON ?auto_128090 ?auto_128089 ) ( CLEAR ?auto_128090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128093 ?auto_128086 ?auto_128087 ?auto_128089 )
      ( MAKE-1PILE ?auto_128086 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128094 - BLOCK
    )
    :vars
    (
      ?auto_128099 - BLOCK
      ?auto_128098 - BLOCK
      ?auto_128100 - BLOCK
      ?auto_128095 - BLOCK
      ?auto_128101 - BLOCK
      ?auto_128096 - BLOCK
      ?auto_128097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128094 ?auto_128099 ) ) ( ON-TABLE ?auto_128098 ) ( ON ?auto_128100 ?auto_128098 ) ( not ( = ?auto_128098 ?auto_128100 ) ) ( not ( = ?auto_128098 ?auto_128095 ) ) ( not ( = ?auto_128098 ?auto_128101 ) ) ( not ( = ?auto_128098 ?auto_128096 ) ) ( not ( = ?auto_128098 ?auto_128099 ) ) ( not ( = ?auto_128098 ?auto_128094 ) ) ( not ( = ?auto_128100 ?auto_128095 ) ) ( not ( = ?auto_128100 ?auto_128101 ) ) ( not ( = ?auto_128100 ?auto_128096 ) ) ( not ( = ?auto_128100 ?auto_128099 ) ) ( not ( = ?auto_128100 ?auto_128094 ) ) ( not ( = ?auto_128095 ?auto_128101 ) ) ( not ( = ?auto_128095 ?auto_128096 ) ) ( not ( = ?auto_128095 ?auto_128099 ) ) ( not ( = ?auto_128095 ?auto_128094 ) ) ( not ( = ?auto_128101 ?auto_128096 ) ) ( not ( = ?auto_128101 ?auto_128099 ) ) ( not ( = ?auto_128101 ?auto_128094 ) ) ( not ( = ?auto_128096 ?auto_128099 ) ) ( not ( = ?auto_128096 ?auto_128094 ) ) ( ON ?auto_128094 ?auto_128097 ) ( not ( = ?auto_128094 ?auto_128097 ) ) ( not ( = ?auto_128099 ?auto_128097 ) ) ( not ( = ?auto_128098 ?auto_128097 ) ) ( not ( = ?auto_128100 ?auto_128097 ) ) ( not ( = ?auto_128095 ?auto_128097 ) ) ( not ( = ?auto_128101 ?auto_128097 ) ) ( not ( = ?auto_128096 ?auto_128097 ) ) ( ON ?auto_128099 ?auto_128094 ) ( ON-TABLE ?auto_128097 ) ( ON ?auto_128096 ?auto_128099 ) ( ON ?auto_128101 ?auto_128096 ) ( CLEAR ?auto_128101 ) ( HOLDING ?auto_128095 ) ( CLEAR ?auto_128100 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128098 ?auto_128100 ?auto_128095 )
      ( MAKE-1PILE ?auto_128094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128102 - BLOCK
    )
    :vars
    (
      ?auto_128108 - BLOCK
      ?auto_128103 - BLOCK
      ?auto_128109 - BLOCK
      ?auto_128106 - BLOCK
      ?auto_128107 - BLOCK
      ?auto_128104 - BLOCK
      ?auto_128105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128102 ?auto_128108 ) ) ( ON-TABLE ?auto_128103 ) ( ON ?auto_128109 ?auto_128103 ) ( not ( = ?auto_128103 ?auto_128109 ) ) ( not ( = ?auto_128103 ?auto_128106 ) ) ( not ( = ?auto_128103 ?auto_128107 ) ) ( not ( = ?auto_128103 ?auto_128104 ) ) ( not ( = ?auto_128103 ?auto_128108 ) ) ( not ( = ?auto_128103 ?auto_128102 ) ) ( not ( = ?auto_128109 ?auto_128106 ) ) ( not ( = ?auto_128109 ?auto_128107 ) ) ( not ( = ?auto_128109 ?auto_128104 ) ) ( not ( = ?auto_128109 ?auto_128108 ) ) ( not ( = ?auto_128109 ?auto_128102 ) ) ( not ( = ?auto_128106 ?auto_128107 ) ) ( not ( = ?auto_128106 ?auto_128104 ) ) ( not ( = ?auto_128106 ?auto_128108 ) ) ( not ( = ?auto_128106 ?auto_128102 ) ) ( not ( = ?auto_128107 ?auto_128104 ) ) ( not ( = ?auto_128107 ?auto_128108 ) ) ( not ( = ?auto_128107 ?auto_128102 ) ) ( not ( = ?auto_128104 ?auto_128108 ) ) ( not ( = ?auto_128104 ?auto_128102 ) ) ( ON ?auto_128102 ?auto_128105 ) ( not ( = ?auto_128102 ?auto_128105 ) ) ( not ( = ?auto_128108 ?auto_128105 ) ) ( not ( = ?auto_128103 ?auto_128105 ) ) ( not ( = ?auto_128109 ?auto_128105 ) ) ( not ( = ?auto_128106 ?auto_128105 ) ) ( not ( = ?auto_128107 ?auto_128105 ) ) ( not ( = ?auto_128104 ?auto_128105 ) ) ( ON ?auto_128108 ?auto_128102 ) ( ON-TABLE ?auto_128105 ) ( ON ?auto_128104 ?auto_128108 ) ( ON ?auto_128107 ?auto_128104 ) ( CLEAR ?auto_128109 ) ( ON ?auto_128106 ?auto_128107 ) ( CLEAR ?auto_128106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128105 ?auto_128102 ?auto_128108 ?auto_128104 ?auto_128107 )
      ( MAKE-1PILE ?auto_128102 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128110 - BLOCK
    )
    :vars
    (
      ?auto_128112 - BLOCK
      ?auto_128111 - BLOCK
      ?auto_128116 - BLOCK
      ?auto_128114 - BLOCK
      ?auto_128113 - BLOCK
      ?auto_128115 - BLOCK
      ?auto_128117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128110 ?auto_128112 ) ) ( ON-TABLE ?auto_128111 ) ( not ( = ?auto_128111 ?auto_128116 ) ) ( not ( = ?auto_128111 ?auto_128114 ) ) ( not ( = ?auto_128111 ?auto_128113 ) ) ( not ( = ?auto_128111 ?auto_128115 ) ) ( not ( = ?auto_128111 ?auto_128112 ) ) ( not ( = ?auto_128111 ?auto_128110 ) ) ( not ( = ?auto_128116 ?auto_128114 ) ) ( not ( = ?auto_128116 ?auto_128113 ) ) ( not ( = ?auto_128116 ?auto_128115 ) ) ( not ( = ?auto_128116 ?auto_128112 ) ) ( not ( = ?auto_128116 ?auto_128110 ) ) ( not ( = ?auto_128114 ?auto_128113 ) ) ( not ( = ?auto_128114 ?auto_128115 ) ) ( not ( = ?auto_128114 ?auto_128112 ) ) ( not ( = ?auto_128114 ?auto_128110 ) ) ( not ( = ?auto_128113 ?auto_128115 ) ) ( not ( = ?auto_128113 ?auto_128112 ) ) ( not ( = ?auto_128113 ?auto_128110 ) ) ( not ( = ?auto_128115 ?auto_128112 ) ) ( not ( = ?auto_128115 ?auto_128110 ) ) ( ON ?auto_128110 ?auto_128117 ) ( not ( = ?auto_128110 ?auto_128117 ) ) ( not ( = ?auto_128112 ?auto_128117 ) ) ( not ( = ?auto_128111 ?auto_128117 ) ) ( not ( = ?auto_128116 ?auto_128117 ) ) ( not ( = ?auto_128114 ?auto_128117 ) ) ( not ( = ?auto_128113 ?auto_128117 ) ) ( not ( = ?auto_128115 ?auto_128117 ) ) ( ON ?auto_128112 ?auto_128110 ) ( ON-TABLE ?auto_128117 ) ( ON ?auto_128115 ?auto_128112 ) ( ON ?auto_128113 ?auto_128115 ) ( ON ?auto_128114 ?auto_128113 ) ( CLEAR ?auto_128114 ) ( HOLDING ?auto_128116 ) ( CLEAR ?auto_128111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128111 ?auto_128116 )
      ( MAKE-1PILE ?auto_128110 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128118 - BLOCK
    )
    :vars
    (
      ?auto_128124 - BLOCK
      ?auto_128122 - BLOCK
      ?auto_128123 - BLOCK
      ?auto_128119 - BLOCK
      ?auto_128121 - BLOCK
      ?auto_128120 - BLOCK
      ?auto_128125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128118 ?auto_128124 ) ) ( ON-TABLE ?auto_128122 ) ( not ( = ?auto_128122 ?auto_128123 ) ) ( not ( = ?auto_128122 ?auto_128119 ) ) ( not ( = ?auto_128122 ?auto_128121 ) ) ( not ( = ?auto_128122 ?auto_128120 ) ) ( not ( = ?auto_128122 ?auto_128124 ) ) ( not ( = ?auto_128122 ?auto_128118 ) ) ( not ( = ?auto_128123 ?auto_128119 ) ) ( not ( = ?auto_128123 ?auto_128121 ) ) ( not ( = ?auto_128123 ?auto_128120 ) ) ( not ( = ?auto_128123 ?auto_128124 ) ) ( not ( = ?auto_128123 ?auto_128118 ) ) ( not ( = ?auto_128119 ?auto_128121 ) ) ( not ( = ?auto_128119 ?auto_128120 ) ) ( not ( = ?auto_128119 ?auto_128124 ) ) ( not ( = ?auto_128119 ?auto_128118 ) ) ( not ( = ?auto_128121 ?auto_128120 ) ) ( not ( = ?auto_128121 ?auto_128124 ) ) ( not ( = ?auto_128121 ?auto_128118 ) ) ( not ( = ?auto_128120 ?auto_128124 ) ) ( not ( = ?auto_128120 ?auto_128118 ) ) ( ON ?auto_128118 ?auto_128125 ) ( not ( = ?auto_128118 ?auto_128125 ) ) ( not ( = ?auto_128124 ?auto_128125 ) ) ( not ( = ?auto_128122 ?auto_128125 ) ) ( not ( = ?auto_128123 ?auto_128125 ) ) ( not ( = ?auto_128119 ?auto_128125 ) ) ( not ( = ?auto_128121 ?auto_128125 ) ) ( not ( = ?auto_128120 ?auto_128125 ) ) ( ON ?auto_128124 ?auto_128118 ) ( ON-TABLE ?auto_128125 ) ( ON ?auto_128120 ?auto_128124 ) ( ON ?auto_128121 ?auto_128120 ) ( ON ?auto_128119 ?auto_128121 ) ( CLEAR ?auto_128122 ) ( ON ?auto_128123 ?auto_128119 ) ( CLEAR ?auto_128123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128125 ?auto_128118 ?auto_128124 ?auto_128120 ?auto_128121 ?auto_128119 )
      ( MAKE-1PILE ?auto_128118 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128126 - BLOCK
    )
    :vars
    (
      ?auto_128132 - BLOCK
      ?auto_128128 - BLOCK
      ?auto_128130 - BLOCK
      ?auto_128133 - BLOCK
      ?auto_128127 - BLOCK
      ?auto_128131 - BLOCK
      ?auto_128129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128126 ?auto_128132 ) ) ( not ( = ?auto_128128 ?auto_128130 ) ) ( not ( = ?auto_128128 ?auto_128133 ) ) ( not ( = ?auto_128128 ?auto_128127 ) ) ( not ( = ?auto_128128 ?auto_128131 ) ) ( not ( = ?auto_128128 ?auto_128132 ) ) ( not ( = ?auto_128128 ?auto_128126 ) ) ( not ( = ?auto_128130 ?auto_128133 ) ) ( not ( = ?auto_128130 ?auto_128127 ) ) ( not ( = ?auto_128130 ?auto_128131 ) ) ( not ( = ?auto_128130 ?auto_128132 ) ) ( not ( = ?auto_128130 ?auto_128126 ) ) ( not ( = ?auto_128133 ?auto_128127 ) ) ( not ( = ?auto_128133 ?auto_128131 ) ) ( not ( = ?auto_128133 ?auto_128132 ) ) ( not ( = ?auto_128133 ?auto_128126 ) ) ( not ( = ?auto_128127 ?auto_128131 ) ) ( not ( = ?auto_128127 ?auto_128132 ) ) ( not ( = ?auto_128127 ?auto_128126 ) ) ( not ( = ?auto_128131 ?auto_128132 ) ) ( not ( = ?auto_128131 ?auto_128126 ) ) ( ON ?auto_128126 ?auto_128129 ) ( not ( = ?auto_128126 ?auto_128129 ) ) ( not ( = ?auto_128132 ?auto_128129 ) ) ( not ( = ?auto_128128 ?auto_128129 ) ) ( not ( = ?auto_128130 ?auto_128129 ) ) ( not ( = ?auto_128133 ?auto_128129 ) ) ( not ( = ?auto_128127 ?auto_128129 ) ) ( not ( = ?auto_128131 ?auto_128129 ) ) ( ON ?auto_128132 ?auto_128126 ) ( ON-TABLE ?auto_128129 ) ( ON ?auto_128131 ?auto_128132 ) ( ON ?auto_128127 ?auto_128131 ) ( ON ?auto_128133 ?auto_128127 ) ( ON ?auto_128130 ?auto_128133 ) ( CLEAR ?auto_128130 ) ( HOLDING ?auto_128128 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128128 )
      ( MAKE-1PILE ?auto_128126 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_128134 - BLOCK
    )
    :vars
    (
      ?auto_128140 - BLOCK
      ?auto_128135 - BLOCK
      ?auto_128139 - BLOCK
      ?auto_128136 - BLOCK
      ?auto_128138 - BLOCK
      ?auto_128141 - BLOCK
      ?auto_128137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128134 ?auto_128140 ) ) ( not ( = ?auto_128135 ?auto_128139 ) ) ( not ( = ?auto_128135 ?auto_128136 ) ) ( not ( = ?auto_128135 ?auto_128138 ) ) ( not ( = ?auto_128135 ?auto_128141 ) ) ( not ( = ?auto_128135 ?auto_128140 ) ) ( not ( = ?auto_128135 ?auto_128134 ) ) ( not ( = ?auto_128139 ?auto_128136 ) ) ( not ( = ?auto_128139 ?auto_128138 ) ) ( not ( = ?auto_128139 ?auto_128141 ) ) ( not ( = ?auto_128139 ?auto_128140 ) ) ( not ( = ?auto_128139 ?auto_128134 ) ) ( not ( = ?auto_128136 ?auto_128138 ) ) ( not ( = ?auto_128136 ?auto_128141 ) ) ( not ( = ?auto_128136 ?auto_128140 ) ) ( not ( = ?auto_128136 ?auto_128134 ) ) ( not ( = ?auto_128138 ?auto_128141 ) ) ( not ( = ?auto_128138 ?auto_128140 ) ) ( not ( = ?auto_128138 ?auto_128134 ) ) ( not ( = ?auto_128141 ?auto_128140 ) ) ( not ( = ?auto_128141 ?auto_128134 ) ) ( ON ?auto_128134 ?auto_128137 ) ( not ( = ?auto_128134 ?auto_128137 ) ) ( not ( = ?auto_128140 ?auto_128137 ) ) ( not ( = ?auto_128135 ?auto_128137 ) ) ( not ( = ?auto_128139 ?auto_128137 ) ) ( not ( = ?auto_128136 ?auto_128137 ) ) ( not ( = ?auto_128138 ?auto_128137 ) ) ( not ( = ?auto_128141 ?auto_128137 ) ) ( ON ?auto_128140 ?auto_128134 ) ( ON-TABLE ?auto_128137 ) ( ON ?auto_128141 ?auto_128140 ) ( ON ?auto_128138 ?auto_128141 ) ( ON ?auto_128136 ?auto_128138 ) ( ON ?auto_128139 ?auto_128136 ) ( ON ?auto_128135 ?auto_128139 ) ( CLEAR ?auto_128135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128137 ?auto_128134 ?auto_128140 ?auto_128141 ?auto_128138 ?auto_128136 ?auto_128139 )
      ( MAKE-1PILE ?auto_128134 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128147 - BLOCK
      ?auto_128148 - BLOCK
      ?auto_128149 - BLOCK
      ?auto_128150 - BLOCK
      ?auto_128151 - BLOCK
    )
    :vars
    (
      ?auto_128152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128152 ?auto_128151 ) ( CLEAR ?auto_128152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128147 ) ( ON ?auto_128148 ?auto_128147 ) ( ON ?auto_128149 ?auto_128148 ) ( ON ?auto_128150 ?auto_128149 ) ( ON ?auto_128151 ?auto_128150 ) ( not ( = ?auto_128147 ?auto_128148 ) ) ( not ( = ?auto_128147 ?auto_128149 ) ) ( not ( = ?auto_128147 ?auto_128150 ) ) ( not ( = ?auto_128147 ?auto_128151 ) ) ( not ( = ?auto_128147 ?auto_128152 ) ) ( not ( = ?auto_128148 ?auto_128149 ) ) ( not ( = ?auto_128148 ?auto_128150 ) ) ( not ( = ?auto_128148 ?auto_128151 ) ) ( not ( = ?auto_128148 ?auto_128152 ) ) ( not ( = ?auto_128149 ?auto_128150 ) ) ( not ( = ?auto_128149 ?auto_128151 ) ) ( not ( = ?auto_128149 ?auto_128152 ) ) ( not ( = ?auto_128150 ?auto_128151 ) ) ( not ( = ?auto_128150 ?auto_128152 ) ) ( not ( = ?auto_128151 ?auto_128152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128152 ?auto_128151 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128153 - BLOCK
      ?auto_128154 - BLOCK
      ?auto_128155 - BLOCK
      ?auto_128156 - BLOCK
      ?auto_128157 - BLOCK
    )
    :vars
    (
      ?auto_128158 - BLOCK
      ?auto_128159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128158 ?auto_128157 ) ( CLEAR ?auto_128158 ) ( ON-TABLE ?auto_128153 ) ( ON ?auto_128154 ?auto_128153 ) ( ON ?auto_128155 ?auto_128154 ) ( ON ?auto_128156 ?auto_128155 ) ( ON ?auto_128157 ?auto_128156 ) ( not ( = ?auto_128153 ?auto_128154 ) ) ( not ( = ?auto_128153 ?auto_128155 ) ) ( not ( = ?auto_128153 ?auto_128156 ) ) ( not ( = ?auto_128153 ?auto_128157 ) ) ( not ( = ?auto_128153 ?auto_128158 ) ) ( not ( = ?auto_128154 ?auto_128155 ) ) ( not ( = ?auto_128154 ?auto_128156 ) ) ( not ( = ?auto_128154 ?auto_128157 ) ) ( not ( = ?auto_128154 ?auto_128158 ) ) ( not ( = ?auto_128155 ?auto_128156 ) ) ( not ( = ?auto_128155 ?auto_128157 ) ) ( not ( = ?auto_128155 ?auto_128158 ) ) ( not ( = ?auto_128156 ?auto_128157 ) ) ( not ( = ?auto_128156 ?auto_128158 ) ) ( not ( = ?auto_128157 ?auto_128158 ) ) ( HOLDING ?auto_128159 ) ( not ( = ?auto_128153 ?auto_128159 ) ) ( not ( = ?auto_128154 ?auto_128159 ) ) ( not ( = ?auto_128155 ?auto_128159 ) ) ( not ( = ?auto_128156 ?auto_128159 ) ) ( not ( = ?auto_128157 ?auto_128159 ) ) ( not ( = ?auto_128158 ?auto_128159 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_128159 )
      ( MAKE-5PILE ?auto_128153 ?auto_128154 ?auto_128155 ?auto_128156 ?auto_128157 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128160 - BLOCK
      ?auto_128161 - BLOCK
      ?auto_128162 - BLOCK
      ?auto_128163 - BLOCK
      ?auto_128164 - BLOCK
    )
    :vars
    (
      ?auto_128165 - BLOCK
      ?auto_128166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128165 ?auto_128164 ) ( ON-TABLE ?auto_128160 ) ( ON ?auto_128161 ?auto_128160 ) ( ON ?auto_128162 ?auto_128161 ) ( ON ?auto_128163 ?auto_128162 ) ( ON ?auto_128164 ?auto_128163 ) ( not ( = ?auto_128160 ?auto_128161 ) ) ( not ( = ?auto_128160 ?auto_128162 ) ) ( not ( = ?auto_128160 ?auto_128163 ) ) ( not ( = ?auto_128160 ?auto_128164 ) ) ( not ( = ?auto_128160 ?auto_128165 ) ) ( not ( = ?auto_128161 ?auto_128162 ) ) ( not ( = ?auto_128161 ?auto_128163 ) ) ( not ( = ?auto_128161 ?auto_128164 ) ) ( not ( = ?auto_128161 ?auto_128165 ) ) ( not ( = ?auto_128162 ?auto_128163 ) ) ( not ( = ?auto_128162 ?auto_128164 ) ) ( not ( = ?auto_128162 ?auto_128165 ) ) ( not ( = ?auto_128163 ?auto_128164 ) ) ( not ( = ?auto_128163 ?auto_128165 ) ) ( not ( = ?auto_128164 ?auto_128165 ) ) ( not ( = ?auto_128160 ?auto_128166 ) ) ( not ( = ?auto_128161 ?auto_128166 ) ) ( not ( = ?auto_128162 ?auto_128166 ) ) ( not ( = ?auto_128163 ?auto_128166 ) ) ( not ( = ?auto_128164 ?auto_128166 ) ) ( not ( = ?auto_128165 ?auto_128166 ) ) ( ON ?auto_128166 ?auto_128165 ) ( CLEAR ?auto_128166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128160 ?auto_128161 ?auto_128162 ?auto_128163 ?auto_128164 ?auto_128165 )
      ( MAKE-5PILE ?auto_128160 ?auto_128161 ?auto_128162 ?auto_128163 ?auto_128164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128167 - BLOCK
      ?auto_128168 - BLOCK
      ?auto_128169 - BLOCK
      ?auto_128170 - BLOCK
      ?auto_128171 - BLOCK
    )
    :vars
    (
      ?auto_128173 - BLOCK
      ?auto_128172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128173 ?auto_128171 ) ( ON-TABLE ?auto_128167 ) ( ON ?auto_128168 ?auto_128167 ) ( ON ?auto_128169 ?auto_128168 ) ( ON ?auto_128170 ?auto_128169 ) ( ON ?auto_128171 ?auto_128170 ) ( not ( = ?auto_128167 ?auto_128168 ) ) ( not ( = ?auto_128167 ?auto_128169 ) ) ( not ( = ?auto_128167 ?auto_128170 ) ) ( not ( = ?auto_128167 ?auto_128171 ) ) ( not ( = ?auto_128167 ?auto_128173 ) ) ( not ( = ?auto_128168 ?auto_128169 ) ) ( not ( = ?auto_128168 ?auto_128170 ) ) ( not ( = ?auto_128168 ?auto_128171 ) ) ( not ( = ?auto_128168 ?auto_128173 ) ) ( not ( = ?auto_128169 ?auto_128170 ) ) ( not ( = ?auto_128169 ?auto_128171 ) ) ( not ( = ?auto_128169 ?auto_128173 ) ) ( not ( = ?auto_128170 ?auto_128171 ) ) ( not ( = ?auto_128170 ?auto_128173 ) ) ( not ( = ?auto_128171 ?auto_128173 ) ) ( not ( = ?auto_128167 ?auto_128172 ) ) ( not ( = ?auto_128168 ?auto_128172 ) ) ( not ( = ?auto_128169 ?auto_128172 ) ) ( not ( = ?auto_128170 ?auto_128172 ) ) ( not ( = ?auto_128171 ?auto_128172 ) ) ( not ( = ?auto_128173 ?auto_128172 ) ) ( HOLDING ?auto_128172 ) ( CLEAR ?auto_128173 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128167 ?auto_128168 ?auto_128169 ?auto_128170 ?auto_128171 ?auto_128173 ?auto_128172 )
      ( MAKE-5PILE ?auto_128167 ?auto_128168 ?auto_128169 ?auto_128170 ?auto_128171 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128174 - BLOCK
      ?auto_128175 - BLOCK
      ?auto_128176 - BLOCK
      ?auto_128177 - BLOCK
      ?auto_128178 - BLOCK
    )
    :vars
    (
      ?auto_128180 - BLOCK
      ?auto_128179 - BLOCK
      ?auto_128181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128180 ?auto_128178 ) ( ON-TABLE ?auto_128174 ) ( ON ?auto_128175 ?auto_128174 ) ( ON ?auto_128176 ?auto_128175 ) ( ON ?auto_128177 ?auto_128176 ) ( ON ?auto_128178 ?auto_128177 ) ( not ( = ?auto_128174 ?auto_128175 ) ) ( not ( = ?auto_128174 ?auto_128176 ) ) ( not ( = ?auto_128174 ?auto_128177 ) ) ( not ( = ?auto_128174 ?auto_128178 ) ) ( not ( = ?auto_128174 ?auto_128180 ) ) ( not ( = ?auto_128175 ?auto_128176 ) ) ( not ( = ?auto_128175 ?auto_128177 ) ) ( not ( = ?auto_128175 ?auto_128178 ) ) ( not ( = ?auto_128175 ?auto_128180 ) ) ( not ( = ?auto_128176 ?auto_128177 ) ) ( not ( = ?auto_128176 ?auto_128178 ) ) ( not ( = ?auto_128176 ?auto_128180 ) ) ( not ( = ?auto_128177 ?auto_128178 ) ) ( not ( = ?auto_128177 ?auto_128180 ) ) ( not ( = ?auto_128178 ?auto_128180 ) ) ( not ( = ?auto_128174 ?auto_128179 ) ) ( not ( = ?auto_128175 ?auto_128179 ) ) ( not ( = ?auto_128176 ?auto_128179 ) ) ( not ( = ?auto_128177 ?auto_128179 ) ) ( not ( = ?auto_128178 ?auto_128179 ) ) ( not ( = ?auto_128180 ?auto_128179 ) ) ( CLEAR ?auto_128180 ) ( ON ?auto_128179 ?auto_128181 ) ( CLEAR ?auto_128179 ) ( HAND-EMPTY ) ( not ( = ?auto_128174 ?auto_128181 ) ) ( not ( = ?auto_128175 ?auto_128181 ) ) ( not ( = ?auto_128176 ?auto_128181 ) ) ( not ( = ?auto_128177 ?auto_128181 ) ) ( not ( = ?auto_128178 ?auto_128181 ) ) ( not ( = ?auto_128180 ?auto_128181 ) ) ( not ( = ?auto_128179 ?auto_128181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128179 ?auto_128181 )
      ( MAKE-5PILE ?auto_128174 ?auto_128175 ?auto_128176 ?auto_128177 ?auto_128178 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128198 - BLOCK
      ?auto_128199 - BLOCK
      ?auto_128200 - BLOCK
      ?auto_128201 - BLOCK
      ?auto_128202 - BLOCK
    )
    :vars
    (
      ?auto_128203 - BLOCK
      ?auto_128205 - BLOCK
      ?auto_128204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128198 ) ( ON ?auto_128199 ?auto_128198 ) ( ON ?auto_128200 ?auto_128199 ) ( ON ?auto_128201 ?auto_128200 ) ( not ( = ?auto_128198 ?auto_128199 ) ) ( not ( = ?auto_128198 ?auto_128200 ) ) ( not ( = ?auto_128198 ?auto_128201 ) ) ( not ( = ?auto_128198 ?auto_128202 ) ) ( not ( = ?auto_128198 ?auto_128203 ) ) ( not ( = ?auto_128199 ?auto_128200 ) ) ( not ( = ?auto_128199 ?auto_128201 ) ) ( not ( = ?auto_128199 ?auto_128202 ) ) ( not ( = ?auto_128199 ?auto_128203 ) ) ( not ( = ?auto_128200 ?auto_128201 ) ) ( not ( = ?auto_128200 ?auto_128202 ) ) ( not ( = ?auto_128200 ?auto_128203 ) ) ( not ( = ?auto_128201 ?auto_128202 ) ) ( not ( = ?auto_128201 ?auto_128203 ) ) ( not ( = ?auto_128202 ?auto_128203 ) ) ( not ( = ?auto_128198 ?auto_128205 ) ) ( not ( = ?auto_128199 ?auto_128205 ) ) ( not ( = ?auto_128200 ?auto_128205 ) ) ( not ( = ?auto_128201 ?auto_128205 ) ) ( not ( = ?auto_128202 ?auto_128205 ) ) ( not ( = ?auto_128203 ?auto_128205 ) ) ( ON ?auto_128205 ?auto_128204 ) ( not ( = ?auto_128198 ?auto_128204 ) ) ( not ( = ?auto_128199 ?auto_128204 ) ) ( not ( = ?auto_128200 ?auto_128204 ) ) ( not ( = ?auto_128201 ?auto_128204 ) ) ( not ( = ?auto_128202 ?auto_128204 ) ) ( not ( = ?auto_128203 ?auto_128204 ) ) ( not ( = ?auto_128205 ?auto_128204 ) ) ( ON ?auto_128203 ?auto_128205 ) ( CLEAR ?auto_128203 ) ( HOLDING ?auto_128202 ) ( CLEAR ?auto_128201 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128198 ?auto_128199 ?auto_128200 ?auto_128201 ?auto_128202 ?auto_128203 )
      ( MAKE-5PILE ?auto_128198 ?auto_128199 ?auto_128200 ?auto_128201 ?auto_128202 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128206 - BLOCK
      ?auto_128207 - BLOCK
      ?auto_128208 - BLOCK
      ?auto_128209 - BLOCK
      ?auto_128210 - BLOCK
    )
    :vars
    (
      ?auto_128213 - BLOCK
      ?auto_128211 - BLOCK
      ?auto_128212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128206 ) ( ON ?auto_128207 ?auto_128206 ) ( ON ?auto_128208 ?auto_128207 ) ( ON ?auto_128209 ?auto_128208 ) ( not ( = ?auto_128206 ?auto_128207 ) ) ( not ( = ?auto_128206 ?auto_128208 ) ) ( not ( = ?auto_128206 ?auto_128209 ) ) ( not ( = ?auto_128206 ?auto_128210 ) ) ( not ( = ?auto_128206 ?auto_128213 ) ) ( not ( = ?auto_128207 ?auto_128208 ) ) ( not ( = ?auto_128207 ?auto_128209 ) ) ( not ( = ?auto_128207 ?auto_128210 ) ) ( not ( = ?auto_128207 ?auto_128213 ) ) ( not ( = ?auto_128208 ?auto_128209 ) ) ( not ( = ?auto_128208 ?auto_128210 ) ) ( not ( = ?auto_128208 ?auto_128213 ) ) ( not ( = ?auto_128209 ?auto_128210 ) ) ( not ( = ?auto_128209 ?auto_128213 ) ) ( not ( = ?auto_128210 ?auto_128213 ) ) ( not ( = ?auto_128206 ?auto_128211 ) ) ( not ( = ?auto_128207 ?auto_128211 ) ) ( not ( = ?auto_128208 ?auto_128211 ) ) ( not ( = ?auto_128209 ?auto_128211 ) ) ( not ( = ?auto_128210 ?auto_128211 ) ) ( not ( = ?auto_128213 ?auto_128211 ) ) ( ON ?auto_128211 ?auto_128212 ) ( not ( = ?auto_128206 ?auto_128212 ) ) ( not ( = ?auto_128207 ?auto_128212 ) ) ( not ( = ?auto_128208 ?auto_128212 ) ) ( not ( = ?auto_128209 ?auto_128212 ) ) ( not ( = ?auto_128210 ?auto_128212 ) ) ( not ( = ?auto_128213 ?auto_128212 ) ) ( not ( = ?auto_128211 ?auto_128212 ) ) ( ON ?auto_128213 ?auto_128211 ) ( CLEAR ?auto_128209 ) ( ON ?auto_128210 ?auto_128213 ) ( CLEAR ?auto_128210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128212 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128212 ?auto_128211 ?auto_128213 )
      ( MAKE-5PILE ?auto_128206 ?auto_128207 ?auto_128208 ?auto_128209 ?auto_128210 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128214 - BLOCK
      ?auto_128215 - BLOCK
      ?auto_128216 - BLOCK
      ?auto_128217 - BLOCK
      ?auto_128218 - BLOCK
    )
    :vars
    (
      ?auto_128219 - BLOCK
      ?auto_128221 - BLOCK
      ?auto_128220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128214 ) ( ON ?auto_128215 ?auto_128214 ) ( ON ?auto_128216 ?auto_128215 ) ( not ( = ?auto_128214 ?auto_128215 ) ) ( not ( = ?auto_128214 ?auto_128216 ) ) ( not ( = ?auto_128214 ?auto_128217 ) ) ( not ( = ?auto_128214 ?auto_128218 ) ) ( not ( = ?auto_128214 ?auto_128219 ) ) ( not ( = ?auto_128215 ?auto_128216 ) ) ( not ( = ?auto_128215 ?auto_128217 ) ) ( not ( = ?auto_128215 ?auto_128218 ) ) ( not ( = ?auto_128215 ?auto_128219 ) ) ( not ( = ?auto_128216 ?auto_128217 ) ) ( not ( = ?auto_128216 ?auto_128218 ) ) ( not ( = ?auto_128216 ?auto_128219 ) ) ( not ( = ?auto_128217 ?auto_128218 ) ) ( not ( = ?auto_128217 ?auto_128219 ) ) ( not ( = ?auto_128218 ?auto_128219 ) ) ( not ( = ?auto_128214 ?auto_128221 ) ) ( not ( = ?auto_128215 ?auto_128221 ) ) ( not ( = ?auto_128216 ?auto_128221 ) ) ( not ( = ?auto_128217 ?auto_128221 ) ) ( not ( = ?auto_128218 ?auto_128221 ) ) ( not ( = ?auto_128219 ?auto_128221 ) ) ( ON ?auto_128221 ?auto_128220 ) ( not ( = ?auto_128214 ?auto_128220 ) ) ( not ( = ?auto_128215 ?auto_128220 ) ) ( not ( = ?auto_128216 ?auto_128220 ) ) ( not ( = ?auto_128217 ?auto_128220 ) ) ( not ( = ?auto_128218 ?auto_128220 ) ) ( not ( = ?auto_128219 ?auto_128220 ) ) ( not ( = ?auto_128221 ?auto_128220 ) ) ( ON ?auto_128219 ?auto_128221 ) ( ON ?auto_128218 ?auto_128219 ) ( CLEAR ?auto_128218 ) ( ON-TABLE ?auto_128220 ) ( HOLDING ?auto_128217 ) ( CLEAR ?auto_128216 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128214 ?auto_128215 ?auto_128216 ?auto_128217 )
      ( MAKE-5PILE ?auto_128214 ?auto_128215 ?auto_128216 ?auto_128217 ?auto_128218 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128222 - BLOCK
      ?auto_128223 - BLOCK
      ?auto_128224 - BLOCK
      ?auto_128225 - BLOCK
      ?auto_128226 - BLOCK
    )
    :vars
    (
      ?auto_128227 - BLOCK
      ?auto_128229 - BLOCK
      ?auto_128228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128222 ) ( ON ?auto_128223 ?auto_128222 ) ( ON ?auto_128224 ?auto_128223 ) ( not ( = ?auto_128222 ?auto_128223 ) ) ( not ( = ?auto_128222 ?auto_128224 ) ) ( not ( = ?auto_128222 ?auto_128225 ) ) ( not ( = ?auto_128222 ?auto_128226 ) ) ( not ( = ?auto_128222 ?auto_128227 ) ) ( not ( = ?auto_128223 ?auto_128224 ) ) ( not ( = ?auto_128223 ?auto_128225 ) ) ( not ( = ?auto_128223 ?auto_128226 ) ) ( not ( = ?auto_128223 ?auto_128227 ) ) ( not ( = ?auto_128224 ?auto_128225 ) ) ( not ( = ?auto_128224 ?auto_128226 ) ) ( not ( = ?auto_128224 ?auto_128227 ) ) ( not ( = ?auto_128225 ?auto_128226 ) ) ( not ( = ?auto_128225 ?auto_128227 ) ) ( not ( = ?auto_128226 ?auto_128227 ) ) ( not ( = ?auto_128222 ?auto_128229 ) ) ( not ( = ?auto_128223 ?auto_128229 ) ) ( not ( = ?auto_128224 ?auto_128229 ) ) ( not ( = ?auto_128225 ?auto_128229 ) ) ( not ( = ?auto_128226 ?auto_128229 ) ) ( not ( = ?auto_128227 ?auto_128229 ) ) ( ON ?auto_128229 ?auto_128228 ) ( not ( = ?auto_128222 ?auto_128228 ) ) ( not ( = ?auto_128223 ?auto_128228 ) ) ( not ( = ?auto_128224 ?auto_128228 ) ) ( not ( = ?auto_128225 ?auto_128228 ) ) ( not ( = ?auto_128226 ?auto_128228 ) ) ( not ( = ?auto_128227 ?auto_128228 ) ) ( not ( = ?auto_128229 ?auto_128228 ) ) ( ON ?auto_128227 ?auto_128229 ) ( ON ?auto_128226 ?auto_128227 ) ( ON-TABLE ?auto_128228 ) ( CLEAR ?auto_128224 ) ( ON ?auto_128225 ?auto_128226 ) ( CLEAR ?auto_128225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128228 ?auto_128229 ?auto_128227 ?auto_128226 )
      ( MAKE-5PILE ?auto_128222 ?auto_128223 ?auto_128224 ?auto_128225 ?auto_128226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128230 - BLOCK
      ?auto_128231 - BLOCK
      ?auto_128232 - BLOCK
      ?auto_128233 - BLOCK
      ?auto_128234 - BLOCK
    )
    :vars
    (
      ?auto_128235 - BLOCK
      ?auto_128237 - BLOCK
      ?auto_128236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128230 ) ( ON ?auto_128231 ?auto_128230 ) ( not ( = ?auto_128230 ?auto_128231 ) ) ( not ( = ?auto_128230 ?auto_128232 ) ) ( not ( = ?auto_128230 ?auto_128233 ) ) ( not ( = ?auto_128230 ?auto_128234 ) ) ( not ( = ?auto_128230 ?auto_128235 ) ) ( not ( = ?auto_128231 ?auto_128232 ) ) ( not ( = ?auto_128231 ?auto_128233 ) ) ( not ( = ?auto_128231 ?auto_128234 ) ) ( not ( = ?auto_128231 ?auto_128235 ) ) ( not ( = ?auto_128232 ?auto_128233 ) ) ( not ( = ?auto_128232 ?auto_128234 ) ) ( not ( = ?auto_128232 ?auto_128235 ) ) ( not ( = ?auto_128233 ?auto_128234 ) ) ( not ( = ?auto_128233 ?auto_128235 ) ) ( not ( = ?auto_128234 ?auto_128235 ) ) ( not ( = ?auto_128230 ?auto_128237 ) ) ( not ( = ?auto_128231 ?auto_128237 ) ) ( not ( = ?auto_128232 ?auto_128237 ) ) ( not ( = ?auto_128233 ?auto_128237 ) ) ( not ( = ?auto_128234 ?auto_128237 ) ) ( not ( = ?auto_128235 ?auto_128237 ) ) ( ON ?auto_128237 ?auto_128236 ) ( not ( = ?auto_128230 ?auto_128236 ) ) ( not ( = ?auto_128231 ?auto_128236 ) ) ( not ( = ?auto_128232 ?auto_128236 ) ) ( not ( = ?auto_128233 ?auto_128236 ) ) ( not ( = ?auto_128234 ?auto_128236 ) ) ( not ( = ?auto_128235 ?auto_128236 ) ) ( not ( = ?auto_128237 ?auto_128236 ) ) ( ON ?auto_128235 ?auto_128237 ) ( ON ?auto_128234 ?auto_128235 ) ( ON-TABLE ?auto_128236 ) ( ON ?auto_128233 ?auto_128234 ) ( CLEAR ?auto_128233 ) ( HOLDING ?auto_128232 ) ( CLEAR ?auto_128231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128230 ?auto_128231 ?auto_128232 )
      ( MAKE-5PILE ?auto_128230 ?auto_128231 ?auto_128232 ?auto_128233 ?auto_128234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128238 - BLOCK
      ?auto_128239 - BLOCK
      ?auto_128240 - BLOCK
      ?auto_128241 - BLOCK
      ?auto_128242 - BLOCK
    )
    :vars
    (
      ?auto_128243 - BLOCK
      ?auto_128244 - BLOCK
      ?auto_128245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128238 ) ( ON ?auto_128239 ?auto_128238 ) ( not ( = ?auto_128238 ?auto_128239 ) ) ( not ( = ?auto_128238 ?auto_128240 ) ) ( not ( = ?auto_128238 ?auto_128241 ) ) ( not ( = ?auto_128238 ?auto_128242 ) ) ( not ( = ?auto_128238 ?auto_128243 ) ) ( not ( = ?auto_128239 ?auto_128240 ) ) ( not ( = ?auto_128239 ?auto_128241 ) ) ( not ( = ?auto_128239 ?auto_128242 ) ) ( not ( = ?auto_128239 ?auto_128243 ) ) ( not ( = ?auto_128240 ?auto_128241 ) ) ( not ( = ?auto_128240 ?auto_128242 ) ) ( not ( = ?auto_128240 ?auto_128243 ) ) ( not ( = ?auto_128241 ?auto_128242 ) ) ( not ( = ?auto_128241 ?auto_128243 ) ) ( not ( = ?auto_128242 ?auto_128243 ) ) ( not ( = ?auto_128238 ?auto_128244 ) ) ( not ( = ?auto_128239 ?auto_128244 ) ) ( not ( = ?auto_128240 ?auto_128244 ) ) ( not ( = ?auto_128241 ?auto_128244 ) ) ( not ( = ?auto_128242 ?auto_128244 ) ) ( not ( = ?auto_128243 ?auto_128244 ) ) ( ON ?auto_128244 ?auto_128245 ) ( not ( = ?auto_128238 ?auto_128245 ) ) ( not ( = ?auto_128239 ?auto_128245 ) ) ( not ( = ?auto_128240 ?auto_128245 ) ) ( not ( = ?auto_128241 ?auto_128245 ) ) ( not ( = ?auto_128242 ?auto_128245 ) ) ( not ( = ?auto_128243 ?auto_128245 ) ) ( not ( = ?auto_128244 ?auto_128245 ) ) ( ON ?auto_128243 ?auto_128244 ) ( ON ?auto_128242 ?auto_128243 ) ( ON-TABLE ?auto_128245 ) ( ON ?auto_128241 ?auto_128242 ) ( CLEAR ?auto_128239 ) ( ON ?auto_128240 ?auto_128241 ) ( CLEAR ?auto_128240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128245 ?auto_128244 ?auto_128243 ?auto_128242 ?auto_128241 )
      ( MAKE-5PILE ?auto_128238 ?auto_128239 ?auto_128240 ?auto_128241 ?auto_128242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128246 - BLOCK
      ?auto_128247 - BLOCK
      ?auto_128248 - BLOCK
      ?auto_128249 - BLOCK
      ?auto_128250 - BLOCK
    )
    :vars
    (
      ?auto_128252 - BLOCK
      ?auto_128251 - BLOCK
      ?auto_128253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128246 ) ( not ( = ?auto_128246 ?auto_128247 ) ) ( not ( = ?auto_128246 ?auto_128248 ) ) ( not ( = ?auto_128246 ?auto_128249 ) ) ( not ( = ?auto_128246 ?auto_128250 ) ) ( not ( = ?auto_128246 ?auto_128252 ) ) ( not ( = ?auto_128247 ?auto_128248 ) ) ( not ( = ?auto_128247 ?auto_128249 ) ) ( not ( = ?auto_128247 ?auto_128250 ) ) ( not ( = ?auto_128247 ?auto_128252 ) ) ( not ( = ?auto_128248 ?auto_128249 ) ) ( not ( = ?auto_128248 ?auto_128250 ) ) ( not ( = ?auto_128248 ?auto_128252 ) ) ( not ( = ?auto_128249 ?auto_128250 ) ) ( not ( = ?auto_128249 ?auto_128252 ) ) ( not ( = ?auto_128250 ?auto_128252 ) ) ( not ( = ?auto_128246 ?auto_128251 ) ) ( not ( = ?auto_128247 ?auto_128251 ) ) ( not ( = ?auto_128248 ?auto_128251 ) ) ( not ( = ?auto_128249 ?auto_128251 ) ) ( not ( = ?auto_128250 ?auto_128251 ) ) ( not ( = ?auto_128252 ?auto_128251 ) ) ( ON ?auto_128251 ?auto_128253 ) ( not ( = ?auto_128246 ?auto_128253 ) ) ( not ( = ?auto_128247 ?auto_128253 ) ) ( not ( = ?auto_128248 ?auto_128253 ) ) ( not ( = ?auto_128249 ?auto_128253 ) ) ( not ( = ?auto_128250 ?auto_128253 ) ) ( not ( = ?auto_128252 ?auto_128253 ) ) ( not ( = ?auto_128251 ?auto_128253 ) ) ( ON ?auto_128252 ?auto_128251 ) ( ON ?auto_128250 ?auto_128252 ) ( ON-TABLE ?auto_128253 ) ( ON ?auto_128249 ?auto_128250 ) ( ON ?auto_128248 ?auto_128249 ) ( CLEAR ?auto_128248 ) ( HOLDING ?auto_128247 ) ( CLEAR ?auto_128246 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128246 ?auto_128247 )
      ( MAKE-5PILE ?auto_128246 ?auto_128247 ?auto_128248 ?auto_128249 ?auto_128250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128254 - BLOCK
      ?auto_128255 - BLOCK
      ?auto_128256 - BLOCK
      ?auto_128257 - BLOCK
      ?auto_128258 - BLOCK
    )
    :vars
    (
      ?auto_128260 - BLOCK
      ?auto_128259 - BLOCK
      ?auto_128261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128254 ) ( not ( = ?auto_128254 ?auto_128255 ) ) ( not ( = ?auto_128254 ?auto_128256 ) ) ( not ( = ?auto_128254 ?auto_128257 ) ) ( not ( = ?auto_128254 ?auto_128258 ) ) ( not ( = ?auto_128254 ?auto_128260 ) ) ( not ( = ?auto_128255 ?auto_128256 ) ) ( not ( = ?auto_128255 ?auto_128257 ) ) ( not ( = ?auto_128255 ?auto_128258 ) ) ( not ( = ?auto_128255 ?auto_128260 ) ) ( not ( = ?auto_128256 ?auto_128257 ) ) ( not ( = ?auto_128256 ?auto_128258 ) ) ( not ( = ?auto_128256 ?auto_128260 ) ) ( not ( = ?auto_128257 ?auto_128258 ) ) ( not ( = ?auto_128257 ?auto_128260 ) ) ( not ( = ?auto_128258 ?auto_128260 ) ) ( not ( = ?auto_128254 ?auto_128259 ) ) ( not ( = ?auto_128255 ?auto_128259 ) ) ( not ( = ?auto_128256 ?auto_128259 ) ) ( not ( = ?auto_128257 ?auto_128259 ) ) ( not ( = ?auto_128258 ?auto_128259 ) ) ( not ( = ?auto_128260 ?auto_128259 ) ) ( ON ?auto_128259 ?auto_128261 ) ( not ( = ?auto_128254 ?auto_128261 ) ) ( not ( = ?auto_128255 ?auto_128261 ) ) ( not ( = ?auto_128256 ?auto_128261 ) ) ( not ( = ?auto_128257 ?auto_128261 ) ) ( not ( = ?auto_128258 ?auto_128261 ) ) ( not ( = ?auto_128260 ?auto_128261 ) ) ( not ( = ?auto_128259 ?auto_128261 ) ) ( ON ?auto_128260 ?auto_128259 ) ( ON ?auto_128258 ?auto_128260 ) ( ON-TABLE ?auto_128261 ) ( ON ?auto_128257 ?auto_128258 ) ( ON ?auto_128256 ?auto_128257 ) ( CLEAR ?auto_128254 ) ( ON ?auto_128255 ?auto_128256 ) ( CLEAR ?auto_128255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128261 ?auto_128259 ?auto_128260 ?auto_128258 ?auto_128257 ?auto_128256 )
      ( MAKE-5PILE ?auto_128254 ?auto_128255 ?auto_128256 ?auto_128257 ?auto_128258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128262 - BLOCK
      ?auto_128263 - BLOCK
      ?auto_128264 - BLOCK
      ?auto_128265 - BLOCK
      ?auto_128266 - BLOCK
    )
    :vars
    (
      ?auto_128268 - BLOCK
      ?auto_128269 - BLOCK
      ?auto_128267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128262 ?auto_128263 ) ) ( not ( = ?auto_128262 ?auto_128264 ) ) ( not ( = ?auto_128262 ?auto_128265 ) ) ( not ( = ?auto_128262 ?auto_128266 ) ) ( not ( = ?auto_128262 ?auto_128268 ) ) ( not ( = ?auto_128263 ?auto_128264 ) ) ( not ( = ?auto_128263 ?auto_128265 ) ) ( not ( = ?auto_128263 ?auto_128266 ) ) ( not ( = ?auto_128263 ?auto_128268 ) ) ( not ( = ?auto_128264 ?auto_128265 ) ) ( not ( = ?auto_128264 ?auto_128266 ) ) ( not ( = ?auto_128264 ?auto_128268 ) ) ( not ( = ?auto_128265 ?auto_128266 ) ) ( not ( = ?auto_128265 ?auto_128268 ) ) ( not ( = ?auto_128266 ?auto_128268 ) ) ( not ( = ?auto_128262 ?auto_128269 ) ) ( not ( = ?auto_128263 ?auto_128269 ) ) ( not ( = ?auto_128264 ?auto_128269 ) ) ( not ( = ?auto_128265 ?auto_128269 ) ) ( not ( = ?auto_128266 ?auto_128269 ) ) ( not ( = ?auto_128268 ?auto_128269 ) ) ( ON ?auto_128269 ?auto_128267 ) ( not ( = ?auto_128262 ?auto_128267 ) ) ( not ( = ?auto_128263 ?auto_128267 ) ) ( not ( = ?auto_128264 ?auto_128267 ) ) ( not ( = ?auto_128265 ?auto_128267 ) ) ( not ( = ?auto_128266 ?auto_128267 ) ) ( not ( = ?auto_128268 ?auto_128267 ) ) ( not ( = ?auto_128269 ?auto_128267 ) ) ( ON ?auto_128268 ?auto_128269 ) ( ON ?auto_128266 ?auto_128268 ) ( ON-TABLE ?auto_128267 ) ( ON ?auto_128265 ?auto_128266 ) ( ON ?auto_128264 ?auto_128265 ) ( ON ?auto_128263 ?auto_128264 ) ( CLEAR ?auto_128263 ) ( HOLDING ?auto_128262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128262 )
      ( MAKE-5PILE ?auto_128262 ?auto_128263 ?auto_128264 ?auto_128265 ?auto_128266 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_128270 - BLOCK
      ?auto_128271 - BLOCK
      ?auto_128272 - BLOCK
      ?auto_128273 - BLOCK
      ?auto_128274 - BLOCK
    )
    :vars
    (
      ?auto_128277 - BLOCK
      ?auto_128276 - BLOCK
      ?auto_128275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128270 ?auto_128271 ) ) ( not ( = ?auto_128270 ?auto_128272 ) ) ( not ( = ?auto_128270 ?auto_128273 ) ) ( not ( = ?auto_128270 ?auto_128274 ) ) ( not ( = ?auto_128270 ?auto_128277 ) ) ( not ( = ?auto_128271 ?auto_128272 ) ) ( not ( = ?auto_128271 ?auto_128273 ) ) ( not ( = ?auto_128271 ?auto_128274 ) ) ( not ( = ?auto_128271 ?auto_128277 ) ) ( not ( = ?auto_128272 ?auto_128273 ) ) ( not ( = ?auto_128272 ?auto_128274 ) ) ( not ( = ?auto_128272 ?auto_128277 ) ) ( not ( = ?auto_128273 ?auto_128274 ) ) ( not ( = ?auto_128273 ?auto_128277 ) ) ( not ( = ?auto_128274 ?auto_128277 ) ) ( not ( = ?auto_128270 ?auto_128276 ) ) ( not ( = ?auto_128271 ?auto_128276 ) ) ( not ( = ?auto_128272 ?auto_128276 ) ) ( not ( = ?auto_128273 ?auto_128276 ) ) ( not ( = ?auto_128274 ?auto_128276 ) ) ( not ( = ?auto_128277 ?auto_128276 ) ) ( ON ?auto_128276 ?auto_128275 ) ( not ( = ?auto_128270 ?auto_128275 ) ) ( not ( = ?auto_128271 ?auto_128275 ) ) ( not ( = ?auto_128272 ?auto_128275 ) ) ( not ( = ?auto_128273 ?auto_128275 ) ) ( not ( = ?auto_128274 ?auto_128275 ) ) ( not ( = ?auto_128277 ?auto_128275 ) ) ( not ( = ?auto_128276 ?auto_128275 ) ) ( ON ?auto_128277 ?auto_128276 ) ( ON ?auto_128274 ?auto_128277 ) ( ON-TABLE ?auto_128275 ) ( ON ?auto_128273 ?auto_128274 ) ( ON ?auto_128272 ?auto_128273 ) ( ON ?auto_128271 ?auto_128272 ) ( ON ?auto_128270 ?auto_128271 ) ( CLEAR ?auto_128270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128275 ?auto_128276 ?auto_128277 ?auto_128274 ?auto_128273 ?auto_128272 ?auto_128271 )
      ( MAKE-5PILE ?auto_128270 ?auto_128271 ?auto_128272 ?auto_128273 ?auto_128274 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128280 - BLOCK
      ?auto_128281 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128281 ) ( CLEAR ?auto_128280 ) ( ON-TABLE ?auto_128280 ) ( not ( = ?auto_128280 ?auto_128281 ) ) )
    :subtasks
    ( ( !STACK ?auto_128281 ?auto_128280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128282 - BLOCK
      ?auto_128283 - BLOCK
    )
    :vars
    (
      ?auto_128284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128282 ) ( ON-TABLE ?auto_128282 ) ( not ( = ?auto_128282 ?auto_128283 ) ) ( ON ?auto_128283 ?auto_128284 ) ( CLEAR ?auto_128283 ) ( HAND-EMPTY ) ( not ( = ?auto_128282 ?auto_128284 ) ) ( not ( = ?auto_128283 ?auto_128284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128283 ?auto_128284 )
      ( MAKE-2PILE ?auto_128282 ?auto_128283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128285 - BLOCK
      ?auto_128286 - BLOCK
    )
    :vars
    (
      ?auto_128287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128285 ?auto_128286 ) ) ( ON ?auto_128286 ?auto_128287 ) ( CLEAR ?auto_128286 ) ( not ( = ?auto_128285 ?auto_128287 ) ) ( not ( = ?auto_128286 ?auto_128287 ) ) ( HOLDING ?auto_128285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128285 )
      ( MAKE-2PILE ?auto_128285 ?auto_128286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128288 - BLOCK
      ?auto_128289 - BLOCK
    )
    :vars
    (
      ?auto_128290 - BLOCK
      ?auto_128291 - BLOCK
      ?auto_128292 - BLOCK
      ?auto_128293 - BLOCK
      ?auto_128294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128288 ?auto_128289 ) ) ( ON ?auto_128289 ?auto_128290 ) ( not ( = ?auto_128288 ?auto_128290 ) ) ( not ( = ?auto_128289 ?auto_128290 ) ) ( ON ?auto_128288 ?auto_128289 ) ( CLEAR ?auto_128288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128291 ) ( ON ?auto_128292 ?auto_128291 ) ( ON ?auto_128293 ?auto_128292 ) ( ON ?auto_128294 ?auto_128293 ) ( ON ?auto_128290 ?auto_128294 ) ( not ( = ?auto_128291 ?auto_128292 ) ) ( not ( = ?auto_128291 ?auto_128293 ) ) ( not ( = ?auto_128291 ?auto_128294 ) ) ( not ( = ?auto_128291 ?auto_128290 ) ) ( not ( = ?auto_128291 ?auto_128289 ) ) ( not ( = ?auto_128291 ?auto_128288 ) ) ( not ( = ?auto_128292 ?auto_128293 ) ) ( not ( = ?auto_128292 ?auto_128294 ) ) ( not ( = ?auto_128292 ?auto_128290 ) ) ( not ( = ?auto_128292 ?auto_128289 ) ) ( not ( = ?auto_128292 ?auto_128288 ) ) ( not ( = ?auto_128293 ?auto_128294 ) ) ( not ( = ?auto_128293 ?auto_128290 ) ) ( not ( = ?auto_128293 ?auto_128289 ) ) ( not ( = ?auto_128293 ?auto_128288 ) ) ( not ( = ?auto_128294 ?auto_128290 ) ) ( not ( = ?auto_128294 ?auto_128289 ) ) ( not ( = ?auto_128294 ?auto_128288 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128291 ?auto_128292 ?auto_128293 ?auto_128294 ?auto_128290 ?auto_128289 )
      ( MAKE-2PILE ?auto_128288 ?auto_128289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128295 - BLOCK
      ?auto_128296 - BLOCK
    )
    :vars
    (
      ?auto_128297 - BLOCK
      ?auto_128301 - BLOCK
      ?auto_128298 - BLOCK
      ?auto_128300 - BLOCK
      ?auto_128299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128295 ?auto_128296 ) ) ( ON ?auto_128296 ?auto_128297 ) ( not ( = ?auto_128295 ?auto_128297 ) ) ( not ( = ?auto_128296 ?auto_128297 ) ) ( ON-TABLE ?auto_128301 ) ( ON ?auto_128298 ?auto_128301 ) ( ON ?auto_128300 ?auto_128298 ) ( ON ?auto_128299 ?auto_128300 ) ( ON ?auto_128297 ?auto_128299 ) ( not ( = ?auto_128301 ?auto_128298 ) ) ( not ( = ?auto_128301 ?auto_128300 ) ) ( not ( = ?auto_128301 ?auto_128299 ) ) ( not ( = ?auto_128301 ?auto_128297 ) ) ( not ( = ?auto_128301 ?auto_128296 ) ) ( not ( = ?auto_128301 ?auto_128295 ) ) ( not ( = ?auto_128298 ?auto_128300 ) ) ( not ( = ?auto_128298 ?auto_128299 ) ) ( not ( = ?auto_128298 ?auto_128297 ) ) ( not ( = ?auto_128298 ?auto_128296 ) ) ( not ( = ?auto_128298 ?auto_128295 ) ) ( not ( = ?auto_128300 ?auto_128299 ) ) ( not ( = ?auto_128300 ?auto_128297 ) ) ( not ( = ?auto_128300 ?auto_128296 ) ) ( not ( = ?auto_128300 ?auto_128295 ) ) ( not ( = ?auto_128299 ?auto_128297 ) ) ( not ( = ?auto_128299 ?auto_128296 ) ) ( not ( = ?auto_128299 ?auto_128295 ) ) ( HOLDING ?auto_128295 ) ( CLEAR ?auto_128296 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128301 ?auto_128298 ?auto_128300 ?auto_128299 ?auto_128297 ?auto_128296 ?auto_128295 )
      ( MAKE-2PILE ?auto_128295 ?auto_128296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128302 - BLOCK
      ?auto_128303 - BLOCK
    )
    :vars
    (
      ?auto_128307 - BLOCK
      ?auto_128304 - BLOCK
      ?auto_128305 - BLOCK
      ?auto_128306 - BLOCK
      ?auto_128308 - BLOCK
      ?auto_128309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128302 ?auto_128303 ) ) ( ON ?auto_128303 ?auto_128307 ) ( not ( = ?auto_128302 ?auto_128307 ) ) ( not ( = ?auto_128303 ?auto_128307 ) ) ( ON-TABLE ?auto_128304 ) ( ON ?auto_128305 ?auto_128304 ) ( ON ?auto_128306 ?auto_128305 ) ( ON ?auto_128308 ?auto_128306 ) ( ON ?auto_128307 ?auto_128308 ) ( not ( = ?auto_128304 ?auto_128305 ) ) ( not ( = ?auto_128304 ?auto_128306 ) ) ( not ( = ?auto_128304 ?auto_128308 ) ) ( not ( = ?auto_128304 ?auto_128307 ) ) ( not ( = ?auto_128304 ?auto_128303 ) ) ( not ( = ?auto_128304 ?auto_128302 ) ) ( not ( = ?auto_128305 ?auto_128306 ) ) ( not ( = ?auto_128305 ?auto_128308 ) ) ( not ( = ?auto_128305 ?auto_128307 ) ) ( not ( = ?auto_128305 ?auto_128303 ) ) ( not ( = ?auto_128305 ?auto_128302 ) ) ( not ( = ?auto_128306 ?auto_128308 ) ) ( not ( = ?auto_128306 ?auto_128307 ) ) ( not ( = ?auto_128306 ?auto_128303 ) ) ( not ( = ?auto_128306 ?auto_128302 ) ) ( not ( = ?auto_128308 ?auto_128307 ) ) ( not ( = ?auto_128308 ?auto_128303 ) ) ( not ( = ?auto_128308 ?auto_128302 ) ) ( CLEAR ?auto_128303 ) ( ON ?auto_128302 ?auto_128309 ) ( CLEAR ?auto_128302 ) ( HAND-EMPTY ) ( not ( = ?auto_128302 ?auto_128309 ) ) ( not ( = ?auto_128303 ?auto_128309 ) ) ( not ( = ?auto_128307 ?auto_128309 ) ) ( not ( = ?auto_128304 ?auto_128309 ) ) ( not ( = ?auto_128305 ?auto_128309 ) ) ( not ( = ?auto_128306 ?auto_128309 ) ) ( not ( = ?auto_128308 ?auto_128309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128302 ?auto_128309 )
      ( MAKE-2PILE ?auto_128302 ?auto_128303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128310 - BLOCK
      ?auto_128311 - BLOCK
    )
    :vars
    (
      ?auto_128313 - BLOCK
      ?auto_128316 - BLOCK
      ?auto_128317 - BLOCK
      ?auto_128312 - BLOCK
      ?auto_128315 - BLOCK
      ?auto_128314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128310 ?auto_128311 ) ) ( not ( = ?auto_128310 ?auto_128313 ) ) ( not ( = ?auto_128311 ?auto_128313 ) ) ( ON-TABLE ?auto_128316 ) ( ON ?auto_128317 ?auto_128316 ) ( ON ?auto_128312 ?auto_128317 ) ( ON ?auto_128315 ?auto_128312 ) ( ON ?auto_128313 ?auto_128315 ) ( not ( = ?auto_128316 ?auto_128317 ) ) ( not ( = ?auto_128316 ?auto_128312 ) ) ( not ( = ?auto_128316 ?auto_128315 ) ) ( not ( = ?auto_128316 ?auto_128313 ) ) ( not ( = ?auto_128316 ?auto_128311 ) ) ( not ( = ?auto_128316 ?auto_128310 ) ) ( not ( = ?auto_128317 ?auto_128312 ) ) ( not ( = ?auto_128317 ?auto_128315 ) ) ( not ( = ?auto_128317 ?auto_128313 ) ) ( not ( = ?auto_128317 ?auto_128311 ) ) ( not ( = ?auto_128317 ?auto_128310 ) ) ( not ( = ?auto_128312 ?auto_128315 ) ) ( not ( = ?auto_128312 ?auto_128313 ) ) ( not ( = ?auto_128312 ?auto_128311 ) ) ( not ( = ?auto_128312 ?auto_128310 ) ) ( not ( = ?auto_128315 ?auto_128313 ) ) ( not ( = ?auto_128315 ?auto_128311 ) ) ( not ( = ?auto_128315 ?auto_128310 ) ) ( ON ?auto_128310 ?auto_128314 ) ( CLEAR ?auto_128310 ) ( not ( = ?auto_128310 ?auto_128314 ) ) ( not ( = ?auto_128311 ?auto_128314 ) ) ( not ( = ?auto_128313 ?auto_128314 ) ) ( not ( = ?auto_128316 ?auto_128314 ) ) ( not ( = ?auto_128317 ?auto_128314 ) ) ( not ( = ?auto_128312 ?auto_128314 ) ) ( not ( = ?auto_128315 ?auto_128314 ) ) ( HOLDING ?auto_128311 ) ( CLEAR ?auto_128313 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128316 ?auto_128317 ?auto_128312 ?auto_128315 ?auto_128313 ?auto_128311 )
      ( MAKE-2PILE ?auto_128310 ?auto_128311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128318 - BLOCK
      ?auto_128319 - BLOCK
    )
    :vars
    (
      ?auto_128320 - BLOCK
      ?auto_128323 - BLOCK
      ?auto_128325 - BLOCK
      ?auto_128322 - BLOCK
      ?auto_128324 - BLOCK
      ?auto_128321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128318 ?auto_128319 ) ) ( not ( = ?auto_128318 ?auto_128320 ) ) ( not ( = ?auto_128319 ?auto_128320 ) ) ( ON-TABLE ?auto_128323 ) ( ON ?auto_128325 ?auto_128323 ) ( ON ?auto_128322 ?auto_128325 ) ( ON ?auto_128324 ?auto_128322 ) ( ON ?auto_128320 ?auto_128324 ) ( not ( = ?auto_128323 ?auto_128325 ) ) ( not ( = ?auto_128323 ?auto_128322 ) ) ( not ( = ?auto_128323 ?auto_128324 ) ) ( not ( = ?auto_128323 ?auto_128320 ) ) ( not ( = ?auto_128323 ?auto_128319 ) ) ( not ( = ?auto_128323 ?auto_128318 ) ) ( not ( = ?auto_128325 ?auto_128322 ) ) ( not ( = ?auto_128325 ?auto_128324 ) ) ( not ( = ?auto_128325 ?auto_128320 ) ) ( not ( = ?auto_128325 ?auto_128319 ) ) ( not ( = ?auto_128325 ?auto_128318 ) ) ( not ( = ?auto_128322 ?auto_128324 ) ) ( not ( = ?auto_128322 ?auto_128320 ) ) ( not ( = ?auto_128322 ?auto_128319 ) ) ( not ( = ?auto_128322 ?auto_128318 ) ) ( not ( = ?auto_128324 ?auto_128320 ) ) ( not ( = ?auto_128324 ?auto_128319 ) ) ( not ( = ?auto_128324 ?auto_128318 ) ) ( ON ?auto_128318 ?auto_128321 ) ( not ( = ?auto_128318 ?auto_128321 ) ) ( not ( = ?auto_128319 ?auto_128321 ) ) ( not ( = ?auto_128320 ?auto_128321 ) ) ( not ( = ?auto_128323 ?auto_128321 ) ) ( not ( = ?auto_128325 ?auto_128321 ) ) ( not ( = ?auto_128322 ?auto_128321 ) ) ( not ( = ?auto_128324 ?auto_128321 ) ) ( CLEAR ?auto_128320 ) ( ON ?auto_128319 ?auto_128318 ) ( CLEAR ?auto_128319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128321 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128321 ?auto_128318 )
      ( MAKE-2PILE ?auto_128318 ?auto_128319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128326 - BLOCK
      ?auto_128327 - BLOCK
    )
    :vars
    (
      ?auto_128329 - BLOCK
      ?auto_128332 - BLOCK
      ?auto_128328 - BLOCK
      ?auto_128331 - BLOCK
      ?auto_128330 - BLOCK
      ?auto_128333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128326 ?auto_128327 ) ) ( not ( = ?auto_128326 ?auto_128329 ) ) ( not ( = ?auto_128327 ?auto_128329 ) ) ( ON-TABLE ?auto_128332 ) ( ON ?auto_128328 ?auto_128332 ) ( ON ?auto_128331 ?auto_128328 ) ( ON ?auto_128330 ?auto_128331 ) ( not ( = ?auto_128332 ?auto_128328 ) ) ( not ( = ?auto_128332 ?auto_128331 ) ) ( not ( = ?auto_128332 ?auto_128330 ) ) ( not ( = ?auto_128332 ?auto_128329 ) ) ( not ( = ?auto_128332 ?auto_128327 ) ) ( not ( = ?auto_128332 ?auto_128326 ) ) ( not ( = ?auto_128328 ?auto_128331 ) ) ( not ( = ?auto_128328 ?auto_128330 ) ) ( not ( = ?auto_128328 ?auto_128329 ) ) ( not ( = ?auto_128328 ?auto_128327 ) ) ( not ( = ?auto_128328 ?auto_128326 ) ) ( not ( = ?auto_128331 ?auto_128330 ) ) ( not ( = ?auto_128331 ?auto_128329 ) ) ( not ( = ?auto_128331 ?auto_128327 ) ) ( not ( = ?auto_128331 ?auto_128326 ) ) ( not ( = ?auto_128330 ?auto_128329 ) ) ( not ( = ?auto_128330 ?auto_128327 ) ) ( not ( = ?auto_128330 ?auto_128326 ) ) ( ON ?auto_128326 ?auto_128333 ) ( not ( = ?auto_128326 ?auto_128333 ) ) ( not ( = ?auto_128327 ?auto_128333 ) ) ( not ( = ?auto_128329 ?auto_128333 ) ) ( not ( = ?auto_128332 ?auto_128333 ) ) ( not ( = ?auto_128328 ?auto_128333 ) ) ( not ( = ?auto_128331 ?auto_128333 ) ) ( not ( = ?auto_128330 ?auto_128333 ) ) ( ON ?auto_128327 ?auto_128326 ) ( CLEAR ?auto_128327 ) ( ON-TABLE ?auto_128333 ) ( HOLDING ?auto_128329 ) ( CLEAR ?auto_128330 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128332 ?auto_128328 ?auto_128331 ?auto_128330 ?auto_128329 )
      ( MAKE-2PILE ?auto_128326 ?auto_128327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128334 - BLOCK
      ?auto_128335 - BLOCK
    )
    :vars
    (
      ?auto_128336 - BLOCK
      ?auto_128341 - BLOCK
      ?auto_128339 - BLOCK
      ?auto_128338 - BLOCK
      ?auto_128340 - BLOCK
      ?auto_128337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128334 ?auto_128335 ) ) ( not ( = ?auto_128334 ?auto_128336 ) ) ( not ( = ?auto_128335 ?auto_128336 ) ) ( ON-TABLE ?auto_128341 ) ( ON ?auto_128339 ?auto_128341 ) ( ON ?auto_128338 ?auto_128339 ) ( ON ?auto_128340 ?auto_128338 ) ( not ( = ?auto_128341 ?auto_128339 ) ) ( not ( = ?auto_128341 ?auto_128338 ) ) ( not ( = ?auto_128341 ?auto_128340 ) ) ( not ( = ?auto_128341 ?auto_128336 ) ) ( not ( = ?auto_128341 ?auto_128335 ) ) ( not ( = ?auto_128341 ?auto_128334 ) ) ( not ( = ?auto_128339 ?auto_128338 ) ) ( not ( = ?auto_128339 ?auto_128340 ) ) ( not ( = ?auto_128339 ?auto_128336 ) ) ( not ( = ?auto_128339 ?auto_128335 ) ) ( not ( = ?auto_128339 ?auto_128334 ) ) ( not ( = ?auto_128338 ?auto_128340 ) ) ( not ( = ?auto_128338 ?auto_128336 ) ) ( not ( = ?auto_128338 ?auto_128335 ) ) ( not ( = ?auto_128338 ?auto_128334 ) ) ( not ( = ?auto_128340 ?auto_128336 ) ) ( not ( = ?auto_128340 ?auto_128335 ) ) ( not ( = ?auto_128340 ?auto_128334 ) ) ( ON ?auto_128334 ?auto_128337 ) ( not ( = ?auto_128334 ?auto_128337 ) ) ( not ( = ?auto_128335 ?auto_128337 ) ) ( not ( = ?auto_128336 ?auto_128337 ) ) ( not ( = ?auto_128341 ?auto_128337 ) ) ( not ( = ?auto_128339 ?auto_128337 ) ) ( not ( = ?auto_128338 ?auto_128337 ) ) ( not ( = ?auto_128340 ?auto_128337 ) ) ( ON ?auto_128335 ?auto_128334 ) ( ON-TABLE ?auto_128337 ) ( CLEAR ?auto_128340 ) ( ON ?auto_128336 ?auto_128335 ) ( CLEAR ?auto_128336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128337 ?auto_128334 ?auto_128335 )
      ( MAKE-2PILE ?auto_128334 ?auto_128335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128342 - BLOCK
      ?auto_128343 - BLOCK
    )
    :vars
    (
      ?auto_128349 - BLOCK
      ?auto_128344 - BLOCK
      ?auto_128346 - BLOCK
      ?auto_128345 - BLOCK
      ?auto_128348 - BLOCK
      ?auto_128347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128342 ?auto_128343 ) ) ( not ( = ?auto_128342 ?auto_128349 ) ) ( not ( = ?auto_128343 ?auto_128349 ) ) ( ON-TABLE ?auto_128344 ) ( ON ?auto_128346 ?auto_128344 ) ( ON ?auto_128345 ?auto_128346 ) ( not ( = ?auto_128344 ?auto_128346 ) ) ( not ( = ?auto_128344 ?auto_128345 ) ) ( not ( = ?auto_128344 ?auto_128348 ) ) ( not ( = ?auto_128344 ?auto_128349 ) ) ( not ( = ?auto_128344 ?auto_128343 ) ) ( not ( = ?auto_128344 ?auto_128342 ) ) ( not ( = ?auto_128346 ?auto_128345 ) ) ( not ( = ?auto_128346 ?auto_128348 ) ) ( not ( = ?auto_128346 ?auto_128349 ) ) ( not ( = ?auto_128346 ?auto_128343 ) ) ( not ( = ?auto_128346 ?auto_128342 ) ) ( not ( = ?auto_128345 ?auto_128348 ) ) ( not ( = ?auto_128345 ?auto_128349 ) ) ( not ( = ?auto_128345 ?auto_128343 ) ) ( not ( = ?auto_128345 ?auto_128342 ) ) ( not ( = ?auto_128348 ?auto_128349 ) ) ( not ( = ?auto_128348 ?auto_128343 ) ) ( not ( = ?auto_128348 ?auto_128342 ) ) ( ON ?auto_128342 ?auto_128347 ) ( not ( = ?auto_128342 ?auto_128347 ) ) ( not ( = ?auto_128343 ?auto_128347 ) ) ( not ( = ?auto_128349 ?auto_128347 ) ) ( not ( = ?auto_128344 ?auto_128347 ) ) ( not ( = ?auto_128346 ?auto_128347 ) ) ( not ( = ?auto_128345 ?auto_128347 ) ) ( not ( = ?auto_128348 ?auto_128347 ) ) ( ON ?auto_128343 ?auto_128342 ) ( ON-TABLE ?auto_128347 ) ( ON ?auto_128349 ?auto_128343 ) ( CLEAR ?auto_128349 ) ( HOLDING ?auto_128348 ) ( CLEAR ?auto_128345 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128344 ?auto_128346 ?auto_128345 ?auto_128348 )
      ( MAKE-2PILE ?auto_128342 ?auto_128343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128350 - BLOCK
      ?auto_128351 - BLOCK
    )
    :vars
    (
      ?auto_128357 - BLOCK
      ?auto_128354 - BLOCK
      ?auto_128353 - BLOCK
      ?auto_128352 - BLOCK
      ?auto_128355 - BLOCK
      ?auto_128356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128350 ?auto_128351 ) ) ( not ( = ?auto_128350 ?auto_128357 ) ) ( not ( = ?auto_128351 ?auto_128357 ) ) ( ON-TABLE ?auto_128354 ) ( ON ?auto_128353 ?auto_128354 ) ( ON ?auto_128352 ?auto_128353 ) ( not ( = ?auto_128354 ?auto_128353 ) ) ( not ( = ?auto_128354 ?auto_128352 ) ) ( not ( = ?auto_128354 ?auto_128355 ) ) ( not ( = ?auto_128354 ?auto_128357 ) ) ( not ( = ?auto_128354 ?auto_128351 ) ) ( not ( = ?auto_128354 ?auto_128350 ) ) ( not ( = ?auto_128353 ?auto_128352 ) ) ( not ( = ?auto_128353 ?auto_128355 ) ) ( not ( = ?auto_128353 ?auto_128357 ) ) ( not ( = ?auto_128353 ?auto_128351 ) ) ( not ( = ?auto_128353 ?auto_128350 ) ) ( not ( = ?auto_128352 ?auto_128355 ) ) ( not ( = ?auto_128352 ?auto_128357 ) ) ( not ( = ?auto_128352 ?auto_128351 ) ) ( not ( = ?auto_128352 ?auto_128350 ) ) ( not ( = ?auto_128355 ?auto_128357 ) ) ( not ( = ?auto_128355 ?auto_128351 ) ) ( not ( = ?auto_128355 ?auto_128350 ) ) ( ON ?auto_128350 ?auto_128356 ) ( not ( = ?auto_128350 ?auto_128356 ) ) ( not ( = ?auto_128351 ?auto_128356 ) ) ( not ( = ?auto_128357 ?auto_128356 ) ) ( not ( = ?auto_128354 ?auto_128356 ) ) ( not ( = ?auto_128353 ?auto_128356 ) ) ( not ( = ?auto_128352 ?auto_128356 ) ) ( not ( = ?auto_128355 ?auto_128356 ) ) ( ON ?auto_128351 ?auto_128350 ) ( ON-TABLE ?auto_128356 ) ( ON ?auto_128357 ?auto_128351 ) ( CLEAR ?auto_128352 ) ( ON ?auto_128355 ?auto_128357 ) ( CLEAR ?auto_128355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128356 ?auto_128350 ?auto_128351 ?auto_128357 )
      ( MAKE-2PILE ?auto_128350 ?auto_128351 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128358 - BLOCK
      ?auto_128359 - BLOCK
    )
    :vars
    (
      ?auto_128365 - BLOCK
      ?auto_128360 - BLOCK
      ?auto_128364 - BLOCK
      ?auto_128362 - BLOCK
      ?auto_128363 - BLOCK
      ?auto_128361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128358 ?auto_128359 ) ) ( not ( = ?auto_128358 ?auto_128365 ) ) ( not ( = ?auto_128359 ?auto_128365 ) ) ( ON-TABLE ?auto_128360 ) ( ON ?auto_128364 ?auto_128360 ) ( not ( = ?auto_128360 ?auto_128364 ) ) ( not ( = ?auto_128360 ?auto_128362 ) ) ( not ( = ?auto_128360 ?auto_128363 ) ) ( not ( = ?auto_128360 ?auto_128365 ) ) ( not ( = ?auto_128360 ?auto_128359 ) ) ( not ( = ?auto_128360 ?auto_128358 ) ) ( not ( = ?auto_128364 ?auto_128362 ) ) ( not ( = ?auto_128364 ?auto_128363 ) ) ( not ( = ?auto_128364 ?auto_128365 ) ) ( not ( = ?auto_128364 ?auto_128359 ) ) ( not ( = ?auto_128364 ?auto_128358 ) ) ( not ( = ?auto_128362 ?auto_128363 ) ) ( not ( = ?auto_128362 ?auto_128365 ) ) ( not ( = ?auto_128362 ?auto_128359 ) ) ( not ( = ?auto_128362 ?auto_128358 ) ) ( not ( = ?auto_128363 ?auto_128365 ) ) ( not ( = ?auto_128363 ?auto_128359 ) ) ( not ( = ?auto_128363 ?auto_128358 ) ) ( ON ?auto_128358 ?auto_128361 ) ( not ( = ?auto_128358 ?auto_128361 ) ) ( not ( = ?auto_128359 ?auto_128361 ) ) ( not ( = ?auto_128365 ?auto_128361 ) ) ( not ( = ?auto_128360 ?auto_128361 ) ) ( not ( = ?auto_128364 ?auto_128361 ) ) ( not ( = ?auto_128362 ?auto_128361 ) ) ( not ( = ?auto_128363 ?auto_128361 ) ) ( ON ?auto_128359 ?auto_128358 ) ( ON-TABLE ?auto_128361 ) ( ON ?auto_128365 ?auto_128359 ) ( ON ?auto_128363 ?auto_128365 ) ( CLEAR ?auto_128363 ) ( HOLDING ?auto_128362 ) ( CLEAR ?auto_128364 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128360 ?auto_128364 ?auto_128362 )
      ( MAKE-2PILE ?auto_128358 ?auto_128359 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128366 - BLOCK
      ?auto_128367 - BLOCK
    )
    :vars
    (
      ?auto_128370 - BLOCK
      ?auto_128368 - BLOCK
      ?auto_128369 - BLOCK
      ?auto_128372 - BLOCK
      ?auto_128373 - BLOCK
      ?auto_128371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128366 ?auto_128367 ) ) ( not ( = ?auto_128366 ?auto_128370 ) ) ( not ( = ?auto_128367 ?auto_128370 ) ) ( ON-TABLE ?auto_128368 ) ( ON ?auto_128369 ?auto_128368 ) ( not ( = ?auto_128368 ?auto_128369 ) ) ( not ( = ?auto_128368 ?auto_128372 ) ) ( not ( = ?auto_128368 ?auto_128373 ) ) ( not ( = ?auto_128368 ?auto_128370 ) ) ( not ( = ?auto_128368 ?auto_128367 ) ) ( not ( = ?auto_128368 ?auto_128366 ) ) ( not ( = ?auto_128369 ?auto_128372 ) ) ( not ( = ?auto_128369 ?auto_128373 ) ) ( not ( = ?auto_128369 ?auto_128370 ) ) ( not ( = ?auto_128369 ?auto_128367 ) ) ( not ( = ?auto_128369 ?auto_128366 ) ) ( not ( = ?auto_128372 ?auto_128373 ) ) ( not ( = ?auto_128372 ?auto_128370 ) ) ( not ( = ?auto_128372 ?auto_128367 ) ) ( not ( = ?auto_128372 ?auto_128366 ) ) ( not ( = ?auto_128373 ?auto_128370 ) ) ( not ( = ?auto_128373 ?auto_128367 ) ) ( not ( = ?auto_128373 ?auto_128366 ) ) ( ON ?auto_128366 ?auto_128371 ) ( not ( = ?auto_128366 ?auto_128371 ) ) ( not ( = ?auto_128367 ?auto_128371 ) ) ( not ( = ?auto_128370 ?auto_128371 ) ) ( not ( = ?auto_128368 ?auto_128371 ) ) ( not ( = ?auto_128369 ?auto_128371 ) ) ( not ( = ?auto_128372 ?auto_128371 ) ) ( not ( = ?auto_128373 ?auto_128371 ) ) ( ON ?auto_128367 ?auto_128366 ) ( ON-TABLE ?auto_128371 ) ( ON ?auto_128370 ?auto_128367 ) ( ON ?auto_128373 ?auto_128370 ) ( CLEAR ?auto_128369 ) ( ON ?auto_128372 ?auto_128373 ) ( CLEAR ?auto_128372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128371 ?auto_128366 ?auto_128367 ?auto_128370 ?auto_128373 )
      ( MAKE-2PILE ?auto_128366 ?auto_128367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128374 - BLOCK
      ?auto_128375 - BLOCK
    )
    :vars
    (
      ?auto_128381 - BLOCK
      ?auto_128378 - BLOCK
      ?auto_128379 - BLOCK
      ?auto_128377 - BLOCK
      ?auto_128380 - BLOCK
      ?auto_128376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128374 ?auto_128375 ) ) ( not ( = ?auto_128374 ?auto_128381 ) ) ( not ( = ?auto_128375 ?auto_128381 ) ) ( ON-TABLE ?auto_128378 ) ( not ( = ?auto_128378 ?auto_128379 ) ) ( not ( = ?auto_128378 ?auto_128377 ) ) ( not ( = ?auto_128378 ?auto_128380 ) ) ( not ( = ?auto_128378 ?auto_128381 ) ) ( not ( = ?auto_128378 ?auto_128375 ) ) ( not ( = ?auto_128378 ?auto_128374 ) ) ( not ( = ?auto_128379 ?auto_128377 ) ) ( not ( = ?auto_128379 ?auto_128380 ) ) ( not ( = ?auto_128379 ?auto_128381 ) ) ( not ( = ?auto_128379 ?auto_128375 ) ) ( not ( = ?auto_128379 ?auto_128374 ) ) ( not ( = ?auto_128377 ?auto_128380 ) ) ( not ( = ?auto_128377 ?auto_128381 ) ) ( not ( = ?auto_128377 ?auto_128375 ) ) ( not ( = ?auto_128377 ?auto_128374 ) ) ( not ( = ?auto_128380 ?auto_128381 ) ) ( not ( = ?auto_128380 ?auto_128375 ) ) ( not ( = ?auto_128380 ?auto_128374 ) ) ( ON ?auto_128374 ?auto_128376 ) ( not ( = ?auto_128374 ?auto_128376 ) ) ( not ( = ?auto_128375 ?auto_128376 ) ) ( not ( = ?auto_128381 ?auto_128376 ) ) ( not ( = ?auto_128378 ?auto_128376 ) ) ( not ( = ?auto_128379 ?auto_128376 ) ) ( not ( = ?auto_128377 ?auto_128376 ) ) ( not ( = ?auto_128380 ?auto_128376 ) ) ( ON ?auto_128375 ?auto_128374 ) ( ON-TABLE ?auto_128376 ) ( ON ?auto_128381 ?auto_128375 ) ( ON ?auto_128380 ?auto_128381 ) ( ON ?auto_128377 ?auto_128380 ) ( CLEAR ?auto_128377 ) ( HOLDING ?auto_128379 ) ( CLEAR ?auto_128378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128378 ?auto_128379 )
      ( MAKE-2PILE ?auto_128374 ?auto_128375 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128382 - BLOCK
      ?auto_128383 - BLOCK
    )
    :vars
    (
      ?auto_128384 - BLOCK
      ?auto_128386 - BLOCK
      ?auto_128387 - BLOCK
      ?auto_128389 - BLOCK
      ?auto_128388 - BLOCK
      ?auto_128385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128382 ?auto_128383 ) ) ( not ( = ?auto_128382 ?auto_128384 ) ) ( not ( = ?auto_128383 ?auto_128384 ) ) ( ON-TABLE ?auto_128386 ) ( not ( = ?auto_128386 ?auto_128387 ) ) ( not ( = ?auto_128386 ?auto_128389 ) ) ( not ( = ?auto_128386 ?auto_128388 ) ) ( not ( = ?auto_128386 ?auto_128384 ) ) ( not ( = ?auto_128386 ?auto_128383 ) ) ( not ( = ?auto_128386 ?auto_128382 ) ) ( not ( = ?auto_128387 ?auto_128389 ) ) ( not ( = ?auto_128387 ?auto_128388 ) ) ( not ( = ?auto_128387 ?auto_128384 ) ) ( not ( = ?auto_128387 ?auto_128383 ) ) ( not ( = ?auto_128387 ?auto_128382 ) ) ( not ( = ?auto_128389 ?auto_128388 ) ) ( not ( = ?auto_128389 ?auto_128384 ) ) ( not ( = ?auto_128389 ?auto_128383 ) ) ( not ( = ?auto_128389 ?auto_128382 ) ) ( not ( = ?auto_128388 ?auto_128384 ) ) ( not ( = ?auto_128388 ?auto_128383 ) ) ( not ( = ?auto_128388 ?auto_128382 ) ) ( ON ?auto_128382 ?auto_128385 ) ( not ( = ?auto_128382 ?auto_128385 ) ) ( not ( = ?auto_128383 ?auto_128385 ) ) ( not ( = ?auto_128384 ?auto_128385 ) ) ( not ( = ?auto_128386 ?auto_128385 ) ) ( not ( = ?auto_128387 ?auto_128385 ) ) ( not ( = ?auto_128389 ?auto_128385 ) ) ( not ( = ?auto_128388 ?auto_128385 ) ) ( ON ?auto_128383 ?auto_128382 ) ( ON-TABLE ?auto_128385 ) ( ON ?auto_128384 ?auto_128383 ) ( ON ?auto_128388 ?auto_128384 ) ( ON ?auto_128389 ?auto_128388 ) ( CLEAR ?auto_128386 ) ( ON ?auto_128387 ?auto_128389 ) ( CLEAR ?auto_128387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128385 ?auto_128382 ?auto_128383 ?auto_128384 ?auto_128388 ?auto_128389 )
      ( MAKE-2PILE ?auto_128382 ?auto_128383 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128390 - BLOCK
      ?auto_128391 - BLOCK
    )
    :vars
    (
      ?auto_128397 - BLOCK
      ?auto_128394 - BLOCK
      ?auto_128392 - BLOCK
      ?auto_128396 - BLOCK
      ?auto_128393 - BLOCK
      ?auto_128395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128390 ?auto_128391 ) ) ( not ( = ?auto_128390 ?auto_128397 ) ) ( not ( = ?auto_128391 ?auto_128397 ) ) ( not ( = ?auto_128394 ?auto_128392 ) ) ( not ( = ?auto_128394 ?auto_128396 ) ) ( not ( = ?auto_128394 ?auto_128393 ) ) ( not ( = ?auto_128394 ?auto_128397 ) ) ( not ( = ?auto_128394 ?auto_128391 ) ) ( not ( = ?auto_128394 ?auto_128390 ) ) ( not ( = ?auto_128392 ?auto_128396 ) ) ( not ( = ?auto_128392 ?auto_128393 ) ) ( not ( = ?auto_128392 ?auto_128397 ) ) ( not ( = ?auto_128392 ?auto_128391 ) ) ( not ( = ?auto_128392 ?auto_128390 ) ) ( not ( = ?auto_128396 ?auto_128393 ) ) ( not ( = ?auto_128396 ?auto_128397 ) ) ( not ( = ?auto_128396 ?auto_128391 ) ) ( not ( = ?auto_128396 ?auto_128390 ) ) ( not ( = ?auto_128393 ?auto_128397 ) ) ( not ( = ?auto_128393 ?auto_128391 ) ) ( not ( = ?auto_128393 ?auto_128390 ) ) ( ON ?auto_128390 ?auto_128395 ) ( not ( = ?auto_128390 ?auto_128395 ) ) ( not ( = ?auto_128391 ?auto_128395 ) ) ( not ( = ?auto_128397 ?auto_128395 ) ) ( not ( = ?auto_128394 ?auto_128395 ) ) ( not ( = ?auto_128392 ?auto_128395 ) ) ( not ( = ?auto_128396 ?auto_128395 ) ) ( not ( = ?auto_128393 ?auto_128395 ) ) ( ON ?auto_128391 ?auto_128390 ) ( ON-TABLE ?auto_128395 ) ( ON ?auto_128397 ?auto_128391 ) ( ON ?auto_128393 ?auto_128397 ) ( ON ?auto_128396 ?auto_128393 ) ( ON ?auto_128392 ?auto_128396 ) ( CLEAR ?auto_128392 ) ( HOLDING ?auto_128394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128394 )
      ( MAKE-2PILE ?auto_128390 ?auto_128391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_128398 - BLOCK
      ?auto_128399 - BLOCK
    )
    :vars
    (
      ?auto_128402 - BLOCK
      ?auto_128403 - BLOCK
      ?auto_128405 - BLOCK
      ?auto_128400 - BLOCK
      ?auto_128401 - BLOCK
      ?auto_128404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128398 ?auto_128399 ) ) ( not ( = ?auto_128398 ?auto_128402 ) ) ( not ( = ?auto_128399 ?auto_128402 ) ) ( not ( = ?auto_128403 ?auto_128405 ) ) ( not ( = ?auto_128403 ?auto_128400 ) ) ( not ( = ?auto_128403 ?auto_128401 ) ) ( not ( = ?auto_128403 ?auto_128402 ) ) ( not ( = ?auto_128403 ?auto_128399 ) ) ( not ( = ?auto_128403 ?auto_128398 ) ) ( not ( = ?auto_128405 ?auto_128400 ) ) ( not ( = ?auto_128405 ?auto_128401 ) ) ( not ( = ?auto_128405 ?auto_128402 ) ) ( not ( = ?auto_128405 ?auto_128399 ) ) ( not ( = ?auto_128405 ?auto_128398 ) ) ( not ( = ?auto_128400 ?auto_128401 ) ) ( not ( = ?auto_128400 ?auto_128402 ) ) ( not ( = ?auto_128400 ?auto_128399 ) ) ( not ( = ?auto_128400 ?auto_128398 ) ) ( not ( = ?auto_128401 ?auto_128402 ) ) ( not ( = ?auto_128401 ?auto_128399 ) ) ( not ( = ?auto_128401 ?auto_128398 ) ) ( ON ?auto_128398 ?auto_128404 ) ( not ( = ?auto_128398 ?auto_128404 ) ) ( not ( = ?auto_128399 ?auto_128404 ) ) ( not ( = ?auto_128402 ?auto_128404 ) ) ( not ( = ?auto_128403 ?auto_128404 ) ) ( not ( = ?auto_128405 ?auto_128404 ) ) ( not ( = ?auto_128400 ?auto_128404 ) ) ( not ( = ?auto_128401 ?auto_128404 ) ) ( ON ?auto_128399 ?auto_128398 ) ( ON-TABLE ?auto_128404 ) ( ON ?auto_128402 ?auto_128399 ) ( ON ?auto_128401 ?auto_128402 ) ( ON ?auto_128400 ?auto_128401 ) ( ON ?auto_128405 ?auto_128400 ) ( ON ?auto_128403 ?auto_128405 ) ( CLEAR ?auto_128403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128404 ?auto_128398 ?auto_128399 ?auto_128402 ?auto_128401 ?auto_128400 ?auto_128405 )
      ( MAKE-2PILE ?auto_128398 ?auto_128399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128410 - BLOCK
      ?auto_128411 - BLOCK
      ?auto_128412 - BLOCK
      ?auto_128413 - BLOCK
    )
    :vars
    (
      ?auto_128414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128414 ?auto_128413 ) ( CLEAR ?auto_128414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128410 ) ( ON ?auto_128411 ?auto_128410 ) ( ON ?auto_128412 ?auto_128411 ) ( ON ?auto_128413 ?auto_128412 ) ( not ( = ?auto_128410 ?auto_128411 ) ) ( not ( = ?auto_128410 ?auto_128412 ) ) ( not ( = ?auto_128410 ?auto_128413 ) ) ( not ( = ?auto_128410 ?auto_128414 ) ) ( not ( = ?auto_128411 ?auto_128412 ) ) ( not ( = ?auto_128411 ?auto_128413 ) ) ( not ( = ?auto_128411 ?auto_128414 ) ) ( not ( = ?auto_128412 ?auto_128413 ) ) ( not ( = ?auto_128412 ?auto_128414 ) ) ( not ( = ?auto_128413 ?auto_128414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128414 ?auto_128413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128415 - BLOCK
      ?auto_128416 - BLOCK
      ?auto_128417 - BLOCK
      ?auto_128418 - BLOCK
    )
    :vars
    (
      ?auto_128419 - BLOCK
      ?auto_128420 - BLOCK
      ?auto_128421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128419 ?auto_128418 ) ( CLEAR ?auto_128419 ) ( ON-TABLE ?auto_128415 ) ( ON ?auto_128416 ?auto_128415 ) ( ON ?auto_128417 ?auto_128416 ) ( ON ?auto_128418 ?auto_128417 ) ( not ( = ?auto_128415 ?auto_128416 ) ) ( not ( = ?auto_128415 ?auto_128417 ) ) ( not ( = ?auto_128415 ?auto_128418 ) ) ( not ( = ?auto_128415 ?auto_128419 ) ) ( not ( = ?auto_128416 ?auto_128417 ) ) ( not ( = ?auto_128416 ?auto_128418 ) ) ( not ( = ?auto_128416 ?auto_128419 ) ) ( not ( = ?auto_128417 ?auto_128418 ) ) ( not ( = ?auto_128417 ?auto_128419 ) ) ( not ( = ?auto_128418 ?auto_128419 ) ) ( HOLDING ?auto_128420 ) ( CLEAR ?auto_128421 ) ( not ( = ?auto_128415 ?auto_128420 ) ) ( not ( = ?auto_128415 ?auto_128421 ) ) ( not ( = ?auto_128416 ?auto_128420 ) ) ( not ( = ?auto_128416 ?auto_128421 ) ) ( not ( = ?auto_128417 ?auto_128420 ) ) ( not ( = ?auto_128417 ?auto_128421 ) ) ( not ( = ?auto_128418 ?auto_128420 ) ) ( not ( = ?auto_128418 ?auto_128421 ) ) ( not ( = ?auto_128419 ?auto_128420 ) ) ( not ( = ?auto_128419 ?auto_128421 ) ) ( not ( = ?auto_128420 ?auto_128421 ) ) )
    :subtasks
    ( ( !STACK ?auto_128420 ?auto_128421 )
      ( MAKE-4PILE ?auto_128415 ?auto_128416 ?auto_128417 ?auto_128418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128422 - BLOCK
      ?auto_128423 - BLOCK
      ?auto_128424 - BLOCK
      ?auto_128425 - BLOCK
    )
    :vars
    (
      ?auto_128428 - BLOCK
      ?auto_128426 - BLOCK
      ?auto_128427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128428 ?auto_128425 ) ( ON-TABLE ?auto_128422 ) ( ON ?auto_128423 ?auto_128422 ) ( ON ?auto_128424 ?auto_128423 ) ( ON ?auto_128425 ?auto_128424 ) ( not ( = ?auto_128422 ?auto_128423 ) ) ( not ( = ?auto_128422 ?auto_128424 ) ) ( not ( = ?auto_128422 ?auto_128425 ) ) ( not ( = ?auto_128422 ?auto_128428 ) ) ( not ( = ?auto_128423 ?auto_128424 ) ) ( not ( = ?auto_128423 ?auto_128425 ) ) ( not ( = ?auto_128423 ?auto_128428 ) ) ( not ( = ?auto_128424 ?auto_128425 ) ) ( not ( = ?auto_128424 ?auto_128428 ) ) ( not ( = ?auto_128425 ?auto_128428 ) ) ( CLEAR ?auto_128426 ) ( not ( = ?auto_128422 ?auto_128427 ) ) ( not ( = ?auto_128422 ?auto_128426 ) ) ( not ( = ?auto_128423 ?auto_128427 ) ) ( not ( = ?auto_128423 ?auto_128426 ) ) ( not ( = ?auto_128424 ?auto_128427 ) ) ( not ( = ?auto_128424 ?auto_128426 ) ) ( not ( = ?auto_128425 ?auto_128427 ) ) ( not ( = ?auto_128425 ?auto_128426 ) ) ( not ( = ?auto_128428 ?auto_128427 ) ) ( not ( = ?auto_128428 ?auto_128426 ) ) ( not ( = ?auto_128427 ?auto_128426 ) ) ( ON ?auto_128427 ?auto_128428 ) ( CLEAR ?auto_128427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128422 ?auto_128423 ?auto_128424 ?auto_128425 ?auto_128428 )
      ( MAKE-4PILE ?auto_128422 ?auto_128423 ?auto_128424 ?auto_128425 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128429 - BLOCK
      ?auto_128430 - BLOCK
      ?auto_128431 - BLOCK
      ?auto_128432 - BLOCK
    )
    :vars
    (
      ?auto_128434 - BLOCK
      ?auto_128435 - BLOCK
      ?auto_128433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128434 ?auto_128432 ) ( ON-TABLE ?auto_128429 ) ( ON ?auto_128430 ?auto_128429 ) ( ON ?auto_128431 ?auto_128430 ) ( ON ?auto_128432 ?auto_128431 ) ( not ( = ?auto_128429 ?auto_128430 ) ) ( not ( = ?auto_128429 ?auto_128431 ) ) ( not ( = ?auto_128429 ?auto_128432 ) ) ( not ( = ?auto_128429 ?auto_128434 ) ) ( not ( = ?auto_128430 ?auto_128431 ) ) ( not ( = ?auto_128430 ?auto_128432 ) ) ( not ( = ?auto_128430 ?auto_128434 ) ) ( not ( = ?auto_128431 ?auto_128432 ) ) ( not ( = ?auto_128431 ?auto_128434 ) ) ( not ( = ?auto_128432 ?auto_128434 ) ) ( not ( = ?auto_128429 ?auto_128435 ) ) ( not ( = ?auto_128429 ?auto_128433 ) ) ( not ( = ?auto_128430 ?auto_128435 ) ) ( not ( = ?auto_128430 ?auto_128433 ) ) ( not ( = ?auto_128431 ?auto_128435 ) ) ( not ( = ?auto_128431 ?auto_128433 ) ) ( not ( = ?auto_128432 ?auto_128435 ) ) ( not ( = ?auto_128432 ?auto_128433 ) ) ( not ( = ?auto_128434 ?auto_128435 ) ) ( not ( = ?auto_128434 ?auto_128433 ) ) ( not ( = ?auto_128435 ?auto_128433 ) ) ( ON ?auto_128435 ?auto_128434 ) ( CLEAR ?auto_128435 ) ( HOLDING ?auto_128433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128433 )
      ( MAKE-4PILE ?auto_128429 ?auto_128430 ?auto_128431 ?auto_128432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128436 - BLOCK
      ?auto_128437 - BLOCK
      ?auto_128438 - BLOCK
      ?auto_128439 - BLOCK
    )
    :vars
    (
      ?auto_128440 - BLOCK
      ?auto_128442 - BLOCK
      ?auto_128441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128440 ?auto_128439 ) ( ON-TABLE ?auto_128436 ) ( ON ?auto_128437 ?auto_128436 ) ( ON ?auto_128438 ?auto_128437 ) ( ON ?auto_128439 ?auto_128438 ) ( not ( = ?auto_128436 ?auto_128437 ) ) ( not ( = ?auto_128436 ?auto_128438 ) ) ( not ( = ?auto_128436 ?auto_128439 ) ) ( not ( = ?auto_128436 ?auto_128440 ) ) ( not ( = ?auto_128437 ?auto_128438 ) ) ( not ( = ?auto_128437 ?auto_128439 ) ) ( not ( = ?auto_128437 ?auto_128440 ) ) ( not ( = ?auto_128438 ?auto_128439 ) ) ( not ( = ?auto_128438 ?auto_128440 ) ) ( not ( = ?auto_128439 ?auto_128440 ) ) ( not ( = ?auto_128436 ?auto_128442 ) ) ( not ( = ?auto_128436 ?auto_128441 ) ) ( not ( = ?auto_128437 ?auto_128442 ) ) ( not ( = ?auto_128437 ?auto_128441 ) ) ( not ( = ?auto_128438 ?auto_128442 ) ) ( not ( = ?auto_128438 ?auto_128441 ) ) ( not ( = ?auto_128439 ?auto_128442 ) ) ( not ( = ?auto_128439 ?auto_128441 ) ) ( not ( = ?auto_128440 ?auto_128442 ) ) ( not ( = ?auto_128440 ?auto_128441 ) ) ( not ( = ?auto_128442 ?auto_128441 ) ) ( ON ?auto_128442 ?auto_128440 ) ( ON ?auto_128441 ?auto_128442 ) ( CLEAR ?auto_128441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128436 ?auto_128437 ?auto_128438 ?auto_128439 ?auto_128440 ?auto_128442 )
      ( MAKE-4PILE ?auto_128436 ?auto_128437 ?auto_128438 ?auto_128439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128443 - BLOCK
      ?auto_128444 - BLOCK
      ?auto_128445 - BLOCK
      ?auto_128446 - BLOCK
    )
    :vars
    (
      ?auto_128449 - BLOCK
      ?auto_128448 - BLOCK
      ?auto_128447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128449 ?auto_128446 ) ( ON-TABLE ?auto_128443 ) ( ON ?auto_128444 ?auto_128443 ) ( ON ?auto_128445 ?auto_128444 ) ( ON ?auto_128446 ?auto_128445 ) ( not ( = ?auto_128443 ?auto_128444 ) ) ( not ( = ?auto_128443 ?auto_128445 ) ) ( not ( = ?auto_128443 ?auto_128446 ) ) ( not ( = ?auto_128443 ?auto_128449 ) ) ( not ( = ?auto_128444 ?auto_128445 ) ) ( not ( = ?auto_128444 ?auto_128446 ) ) ( not ( = ?auto_128444 ?auto_128449 ) ) ( not ( = ?auto_128445 ?auto_128446 ) ) ( not ( = ?auto_128445 ?auto_128449 ) ) ( not ( = ?auto_128446 ?auto_128449 ) ) ( not ( = ?auto_128443 ?auto_128448 ) ) ( not ( = ?auto_128443 ?auto_128447 ) ) ( not ( = ?auto_128444 ?auto_128448 ) ) ( not ( = ?auto_128444 ?auto_128447 ) ) ( not ( = ?auto_128445 ?auto_128448 ) ) ( not ( = ?auto_128445 ?auto_128447 ) ) ( not ( = ?auto_128446 ?auto_128448 ) ) ( not ( = ?auto_128446 ?auto_128447 ) ) ( not ( = ?auto_128449 ?auto_128448 ) ) ( not ( = ?auto_128449 ?auto_128447 ) ) ( not ( = ?auto_128448 ?auto_128447 ) ) ( ON ?auto_128448 ?auto_128449 ) ( HOLDING ?auto_128447 ) ( CLEAR ?auto_128448 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128443 ?auto_128444 ?auto_128445 ?auto_128446 ?auto_128449 ?auto_128448 ?auto_128447 )
      ( MAKE-4PILE ?auto_128443 ?auto_128444 ?auto_128445 ?auto_128446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128450 - BLOCK
      ?auto_128451 - BLOCK
      ?auto_128452 - BLOCK
      ?auto_128453 - BLOCK
    )
    :vars
    (
      ?auto_128455 - BLOCK
      ?auto_128454 - BLOCK
      ?auto_128456 - BLOCK
      ?auto_128457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128455 ?auto_128453 ) ( ON-TABLE ?auto_128450 ) ( ON ?auto_128451 ?auto_128450 ) ( ON ?auto_128452 ?auto_128451 ) ( ON ?auto_128453 ?auto_128452 ) ( not ( = ?auto_128450 ?auto_128451 ) ) ( not ( = ?auto_128450 ?auto_128452 ) ) ( not ( = ?auto_128450 ?auto_128453 ) ) ( not ( = ?auto_128450 ?auto_128455 ) ) ( not ( = ?auto_128451 ?auto_128452 ) ) ( not ( = ?auto_128451 ?auto_128453 ) ) ( not ( = ?auto_128451 ?auto_128455 ) ) ( not ( = ?auto_128452 ?auto_128453 ) ) ( not ( = ?auto_128452 ?auto_128455 ) ) ( not ( = ?auto_128453 ?auto_128455 ) ) ( not ( = ?auto_128450 ?auto_128454 ) ) ( not ( = ?auto_128450 ?auto_128456 ) ) ( not ( = ?auto_128451 ?auto_128454 ) ) ( not ( = ?auto_128451 ?auto_128456 ) ) ( not ( = ?auto_128452 ?auto_128454 ) ) ( not ( = ?auto_128452 ?auto_128456 ) ) ( not ( = ?auto_128453 ?auto_128454 ) ) ( not ( = ?auto_128453 ?auto_128456 ) ) ( not ( = ?auto_128455 ?auto_128454 ) ) ( not ( = ?auto_128455 ?auto_128456 ) ) ( not ( = ?auto_128454 ?auto_128456 ) ) ( ON ?auto_128454 ?auto_128455 ) ( CLEAR ?auto_128454 ) ( ON ?auto_128456 ?auto_128457 ) ( CLEAR ?auto_128456 ) ( HAND-EMPTY ) ( not ( = ?auto_128450 ?auto_128457 ) ) ( not ( = ?auto_128451 ?auto_128457 ) ) ( not ( = ?auto_128452 ?auto_128457 ) ) ( not ( = ?auto_128453 ?auto_128457 ) ) ( not ( = ?auto_128455 ?auto_128457 ) ) ( not ( = ?auto_128454 ?auto_128457 ) ) ( not ( = ?auto_128456 ?auto_128457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128456 ?auto_128457 )
      ( MAKE-4PILE ?auto_128450 ?auto_128451 ?auto_128452 ?auto_128453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128458 - BLOCK
      ?auto_128459 - BLOCK
      ?auto_128460 - BLOCK
      ?auto_128461 - BLOCK
    )
    :vars
    (
      ?auto_128465 - BLOCK
      ?auto_128464 - BLOCK
      ?auto_128463 - BLOCK
      ?auto_128462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128465 ?auto_128461 ) ( ON-TABLE ?auto_128458 ) ( ON ?auto_128459 ?auto_128458 ) ( ON ?auto_128460 ?auto_128459 ) ( ON ?auto_128461 ?auto_128460 ) ( not ( = ?auto_128458 ?auto_128459 ) ) ( not ( = ?auto_128458 ?auto_128460 ) ) ( not ( = ?auto_128458 ?auto_128461 ) ) ( not ( = ?auto_128458 ?auto_128465 ) ) ( not ( = ?auto_128459 ?auto_128460 ) ) ( not ( = ?auto_128459 ?auto_128461 ) ) ( not ( = ?auto_128459 ?auto_128465 ) ) ( not ( = ?auto_128460 ?auto_128461 ) ) ( not ( = ?auto_128460 ?auto_128465 ) ) ( not ( = ?auto_128461 ?auto_128465 ) ) ( not ( = ?auto_128458 ?auto_128464 ) ) ( not ( = ?auto_128458 ?auto_128463 ) ) ( not ( = ?auto_128459 ?auto_128464 ) ) ( not ( = ?auto_128459 ?auto_128463 ) ) ( not ( = ?auto_128460 ?auto_128464 ) ) ( not ( = ?auto_128460 ?auto_128463 ) ) ( not ( = ?auto_128461 ?auto_128464 ) ) ( not ( = ?auto_128461 ?auto_128463 ) ) ( not ( = ?auto_128465 ?auto_128464 ) ) ( not ( = ?auto_128465 ?auto_128463 ) ) ( not ( = ?auto_128464 ?auto_128463 ) ) ( ON ?auto_128463 ?auto_128462 ) ( CLEAR ?auto_128463 ) ( not ( = ?auto_128458 ?auto_128462 ) ) ( not ( = ?auto_128459 ?auto_128462 ) ) ( not ( = ?auto_128460 ?auto_128462 ) ) ( not ( = ?auto_128461 ?auto_128462 ) ) ( not ( = ?auto_128465 ?auto_128462 ) ) ( not ( = ?auto_128464 ?auto_128462 ) ) ( not ( = ?auto_128463 ?auto_128462 ) ) ( HOLDING ?auto_128464 ) ( CLEAR ?auto_128465 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128458 ?auto_128459 ?auto_128460 ?auto_128461 ?auto_128465 ?auto_128464 )
      ( MAKE-4PILE ?auto_128458 ?auto_128459 ?auto_128460 ?auto_128461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128466 - BLOCK
      ?auto_128467 - BLOCK
      ?auto_128468 - BLOCK
      ?auto_128469 - BLOCK
    )
    :vars
    (
      ?auto_128471 - BLOCK
      ?auto_128472 - BLOCK
      ?auto_128470 - BLOCK
      ?auto_128473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128471 ?auto_128469 ) ( ON-TABLE ?auto_128466 ) ( ON ?auto_128467 ?auto_128466 ) ( ON ?auto_128468 ?auto_128467 ) ( ON ?auto_128469 ?auto_128468 ) ( not ( = ?auto_128466 ?auto_128467 ) ) ( not ( = ?auto_128466 ?auto_128468 ) ) ( not ( = ?auto_128466 ?auto_128469 ) ) ( not ( = ?auto_128466 ?auto_128471 ) ) ( not ( = ?auto_128467 ?auto_128468 ) ) ( not ( = ?auto_128467 ?auto_128469 ) ) ( not ( = ?auto_128467 ?auto_128471 ) ) ( not ( = ?auto_128468 ?auto_128469 ) ) ( not ( = ?auto_128468 ?auto_128471 ) ) ( not ( = ?auto_128469 ?auto_128471 ) ) ( not ( = ?auto_128466 ?auto_128472 ) ) ( not ( = ?auto_128466 ?auto_128470 ) ) ( not ( = ?auto_128467 ?auto_128472 ) ) ( not ( = ?auto_128467 ?auto_128470 ) ) ( not ( = ?auto_128468 ?auto_128472 ) ) ( not ( = ?auto_128468 ?auto_128470 ) ) ( not ( = ?auto_128469 ?auto_128472 ) ) ( not ( = ?auto_128469 ?auto_128470 ) ) ( not ( = ?auto_128471 ?auto_128472 ) ) ( not ( = ?auto_128471 ?auto_128470 ) ) ( not ( = ?auto_128472 ?auto_128470 ) ) ( ON ?auto_128470 ?auto_128473 ) ( not ( = ?auto_128466 ?auto_128473 ) ) ( not ( = ?auto_128467 ?auto_128473 ) ) ( not ( = ?auto_128468 ?auto_128473 ) ) ( not ( = ?auto_128469 ?auto_128473 ) ) ( not ( = ?auto_128471 ?auto_128473 ) ) ( not ( = ?auto_128472 ?auto_128473 ) ) ( not ( = ?auto_128470 ?auto_128473 ) ) ( CLEAR ?auto_128471 ) ( ON ?auto_128472 ?auto_128470 ) ( CLEAR ?auto_128472 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128473 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128473 ?auto_128470 )
      ( MAKE-4PILE ?auto_128466 ?auto_128467 ?auto_128468 ?auto_128469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128490 - BLOCK
      ?auto_128491 - BLOCK
      ?auto_128492 - BLOCK
      ?auto_128493 - BLOCK
    )
    :vars
    (
      ?auto_128497 - BLOCK
      ?auto_128496 - BLOCK
      ?auto_128494 - BLOCK
      ?auto_128495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128490 ) ( ON ?auto_128491 ?auto_128490 ) ( ON ?auto_128492 ?auto_128491 ) ( not ( = ?auto_128490 ?auto_128491 ) ) ( not ( = ?auto_128490 ?auto_128492 ) ) ( not ( = ?auto_128490 ?auto_128493 ) ) ( not ( = ?auto_128490 ?auto_128497 ) ) ( not ( = ?auto_128491 ?auto_128492 ) ) ( not ( = ?auto_128491 ?auto_128493 ) ) ( not ( = ?auto_128491 ?auto_128497 ) ) ( not ( = ?auto_128492 ?auto_128493 ) ) ( not ( = ?auto_128492 ?auto_128497 ) ) ( not ( = ?auto_128493 ?auto_128497 ) ) ( not ( = ?auto_128490 ?auto_128496 ) ) ( not ( = ?auto_128490 ?auto_128494 ) ) ( not ( = ?auto_128491 ?auto_128496 ) ) ( not ( = ?auto_128491 ?auto_128494 ) ) ( not ( = ?auto_128492 ?auto_128496 ) ) ( not ( = ?auto_128492 ?auto_128494 ) ) ( not ( = ?auto_128493 ?auto_128496 ) ) ( not ( = ?auto_128493 ?auto_128494 ) ) ( not ( = ?auto_128497 ?auto_128496 ) ) ( not ( = ?auto_128497 ?auto_128494 ) ) ( not ( = ?auto_128496 ?auto_128494 ) ) ( ON ?auto_128494 ?auto_128495 ) ( not ( = ?auto_128490 ?auto_128495 ) ) ( not ( = ?auto_128491 ?auto_128495 ) ) ( not ( = ?auto_128492 ?auto_128495 ) ) ( not ( = ?auto_128493 ?auto_128495 ) ) ( not ( = ?auto_128497 ?auto_128495 ) ) ( not ( = ?auto_128496 ?auto_128495 ) ) ( not ( = ?auto_128494 ?auto_128495 ) ) ( ON ?auto_128496 ?auto_128494 ) ( ON-TABLE ?auto_128495 ) ( ON ?auto_128497 ?auto_128496 ) ( CLEAR ?auto_128497 ) ( HOLDING ?auto_128493 ) ( CLEAR ?auto_128492 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128490 ?auto_128491 ?auto_128492 ?auto_128493 ?auto_128497 )
      ( MAKE-4PILE ?auto_128490 ?auto_128491 ?auto_128492 ?auto_128493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128498 - BLOCK
      ?auto_128499 - BLOCK
      ?auto_128500 - BLOCK
      ?auto_128501 - BLOCK
    )
    :vars
    (
      ?auto_128505 - BLOCK
      ?auto_128504 - BLOCK
      ?auto_128503 - BLOCK
      ?auto_128502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128498 ) ( ON ?auto_128499 ?auto_128498 ) ( ON ?auto_128500 ?auto_128499 ) ( not ( = ?auto_128498 ?auto_128499 ) ) ( not ( = ?auto_128498 ?auto_128500 ) ) ( not ( = ?auto_128498 ?auto_128501 ) ) ( not ( = ?auto_128498 ?auto_128505 ) ) ( not ( = ?auto_128499 ?auto_128500 ) ) ( not ( = ?auto_128499 ?auto_128501 ) ) ( not ( = ?auto_128499 ?auto_128505 ) ) ( not ( = ?auto_128500 ?auto_128501 ) ) ( not ( = ?auto_128500 ?auto_128505 ) ) ( not ( = ?auto_128501 ?auto_128505 ) ) ( not ( = ?auto_128498 ?auto_128504 ) ) ( not ( = ?auto_128498 ?auto_128503 ) ) ( not ( = ?auto_128499 ?auto_128504 ) ) ( not ( = ?auto_128499 ?auto_128503 ) ) ( not ( = ?auto_128500 ?auto_128504 ) ) ( not ( = ?auto_128500 ?auto_128503 ) ) ( not ( = ?auto_128501 ?auto_128504 ) ) ( not ( = ?auto_128501 ?auto_128503 ) ) ( not ( = ?auto_128505 ?auto_128504 ) ) ( not ( = ?auto_128505 ?auto_128503 ) ) ( not ( = ?auto_128504 ?auto_128503 ) ) ( ON ?auto_128503 ?auto_128502 ) ( not ( = ?auto_128498 ?auto_128502 ) ) ( not ( = ?auto_128499 ?auto_128502 ) ) ( not ( = ?auto_128500 ?auto_128502 ) ) ( not ( = ?auto_128501 ?auto_128502 ) ) ( not ( = ?auto_128505 ?auto_128502 ) ) ( not ( = ?auto_128504 ?auto_128502 ) ) ( not ( = ?auto_128503 ?auto_128502 ) ) ( ON ?auto_128504 ?auto_128503 ) ( ON-TABLE ?auto_128502 ) ( ON ?auto_128505 ?auto_128504 ) ( CLEAR ?auto_128500 ) ( ON ?auto_128501 ?auto_128505 ) ( CLEAR ?auto_128501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128502 ?auto_128503 ?auto_128504 ?auto_128505 )
      ( MAKE-4PILE ?auto_128498 ?auto_128499 ?auto_128500 ?auto_128501 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128506 - BLOCK
      ?auto_128507 - BLOCK
      ?auto_128508 - BLOCK
      ?auto_128509 - BLOCK
    )
    :vars
    (
      ?auto_128512 - BLOCK
      ?auto_128513 - BLOCK
      ?auto_128511 - BLOCK
      ?auto_128510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128506 ) ( ON ?auto_128507 ?auto_128506 ) ( not ( = ?auto_128506 ?auto_128507 ) ) ( not ( = ?auto_128506 ?auto_128508 ) ) ( not ( = ?auto_128506 ?auto_128509 ) ) ( not ( = ?auto_128506 ?auto_128512 ) ) ( not ( = ?auto_128507 ?auto_128508 ) ) ( not ( = ?auto_128507 ?auto_128509 ) ) ( not ( = ?auto_128507 ?auto_128512 ) ) ( not ( = ?auto_128508 ?auto_128509 ) ) ( not ( = ?auto_128508 ?auto_128512 ) ) ( not ( = ?auto_128509 ?auto_128512 ) ) ( not ( = ?auto_128506 ?auto_128513 ) ) ( not ( = ?auto_128506 ?auto_128511 ) ) ( not ( = ?auto_128507 ?auto_128513 ) ) ( not ( = ?auto_128507 ?auto_128511 ) ) ( not ( = ?auto_128508 ?auto_128513 ) ) ( not ( = ?auto_128508 ?auto_128511 ) ) ( not ( = ?auto_128509 ?auto_128513 ) ) ( not ( = ?auto_128509 ?auto_128511 ) ) ( not ( = ?auto_128512 ?auto_128513 ) ) ( not ( = ?auto_128512 ?auto_128511 ) ) ( not ( = ?auto_128513 ?auto_128511 ) ) ( ON ?auto_128511 ?auto_128510 ) ( not ( = ?auto_128506 ?auto_128510 ) ) ( not ( = ?auto_128507 ?auto_128510 ) ) ( not ( = ?auto_128508 ?auto_128510 ) ) ( not ( = ?auto_128509 ?auto_128510 ) ) ( not ( = ?auto_128512 ?auto_128510 ) ) ( not ( = ?auto_128513 ?auto_128510 ) ) ( not ( = ?auto_128511 ?auto_128510 ) ) ( ON ?auto_128513 ?auto_128511 ) ( ON-TABLE ?auto_128510 ) ( ON ?auto_128512 ?auto_128513 ) ( ON ?auto_128509 ?auto_128512 ) ( CLEAR ?auto_128509 ) ( HOLDING ?auto_128508 ) ( CLEAR ?auto_128507 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128506 ?auto_128507 ?auto_128508 )
      ( MAKE-4PILE ?auto_128506 ?auto_128507 ?auto_128508 ?auto_128509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128514 - BLOCK
      ?auto_128515 - BLOCK
      ?auto_128516 - BLOCK
      ?auto_128517 - BLOCK
    )
    :vars
    (
      ?auto_128521 - BLOCK
      ?auto_128518 - BLOCK
      ?auto_128519 - BLOCK
      ?auto_128520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128514 ) ( ON ?auto_128515 ?auto_128514 ) ( not ( = ?auto_128514 ?auto_128515 ) ) ( not ( = ?auto_128514 ?auto_128516 ) ) ( not ( = ?auto_128514 ?auto_128517 ) ) ( not ( = ?auto_128514 ?auto_128521 ) ) ( not ( = ?auto_128515 ?auto_128516 ) ) ( not ( = ?auto_128515 ?auto_128517 ) ) ( not ( = ?auto_128515 ?auto_128521 ) ) ( not ( = ?auto_128516 ?auto_128517 ) ) ( not ( = ?auto_128516 ?auto_128521 ) ) ( not ( = ?auto_128517 ?auto_128521 ) ) ( not ( = ?auto_128514 ?auto_128518 ) ) ( not ( = ?auto_128514 ?auto_128519 ) ) ( not ( = ?auto_128515 ?auto_128518 ) ) ( not ( = ?auto_128515 ?auto_128519 ) ) ( not ( = ?auto_128516 ?auto_128518 ) ) ( not ( = ?auto_128516 ?auto_128519 ) ) ( not ( = ?auto_128517 ?auto_128518 ) ) ( not ( = ?auto_128517 ?auto_128519 ) ) ( not ( = ?auto_128521 ?auto_128518 ) ) ( not ( = ?auto_128521 ?auto_128519 ) ) ( not ( = ?auto_128518 ?auto_128519 ) ) ( ON ?auto_128519 ?auto_128520 ) ( not ( = ?auto_128514 ?auto_128520 ) ) ( not ( = ?auto_128515 ?auto_128520 ) ) ( not ( = ?auto_128516 ?auto_128520 ) ) ( not ( = ?auto_128517 ?auto_128520 ) ) ( not ( = ?auto_128521 ?auto_128520 ) ) ( not ( = ?auto_128518 ?auto_128520 ) ) ( not ( = ?auto_128519 ?auto_128520 ) ) ( ON ?auto_128518 ?auto_128519 ) ( ON-TABLE ?auto_128520 ) ( ON ?auto_128521 ?auto_128518 ) ( ON ?auto_128517 ?auto_128521 ) ( CLEAR ?auto_128515 ) ( ON ?auto_128516 ?auto_128517 ) ( CLEAR ?auto_128516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128520 ?auto_128519 ?auto_128518 ?auto_128521 ?auto_128517 )
      ( MAKE-4PILE ?auto_128514 ?auto_128515 ?auto_128516 ?auto_128517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128522 - BLOCK
      ?auto_128523 - BLOCK
      ?auto_128524 - BLOCK
      ?auto_128525 - BLOCK
    )
    :vars
    (
      ?auto_128527 - BLOCK
      ?auto_128526 - BLOCK
      ?auto_128529 - BLOCK
      ?auto_128528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128522 ) ( not ( = ?auto_128522 ?auto_128523 ) ) ( not ( = ?auto_128522 ?auto_128524 ) ) ( not ( = ?auto_128522 ?auto_128525 ) ) ( not ( = ?auto_128522 ?auto_128527 ) ) ( not ( = ?auto_128523 ?auto_128524 ) ) ( not ( = ?auto_128523 ?auto_128525 ) ) ( not ( = ?auto_128523 ?auto_128527 ) ) ( not ( = ?auto_128524 ?auto_128525 ) ) ( not ( = ?auto_128524 ?auto_128527 ) ) ( not ( = ?auto_128525 ?auto_128527 ) ) ( not ( = ?auto_128522 ?auto_128526 ) ) ( not ( = ?auto_128522 ?auto_128529 ) ) ( not ( = ?auto_128523 ?auto_128526 ) ) ( not ( = ?auto_128523 ?auto_128529 ) ) ( not ( = ?auto_128524 ?auto_128526 ) ) ( not ( = ?auto_128524 ?auto_128529 ) ) ( not ( = ?auto_128525 ?auto_128526 ) ) ( not ( = ?auto_128525 ?auto_128529 ) ) ( not ( = ?auto_128527 ?auto_128526 ) ) ( not ( = ?auto_128527 ?auto_128529 ) ) ( not ( = ?auto_128526 ?auto_128529 ) ) ( ON ?auto_128529 ?auto_128528 ) ( not ( = ?auto_128522 ?auto_128528 ) ) ( not ( = ?auto_128523 ?auto_128528 ) ) ( not ( = ?auto_128524 ?auto_128528 ) ) ( not ( = ?auto_128525 ?auto_128528 ) ) ( not ( = ?auto_128527 ?auto_128528 ) ) ( not ( = ?auto_128526 ?auto_128528 ) ) ( not ( = ?auto_128529 ?auto_128528 ) ) ( ON ?auto_128526 ?auto_128529 ) ( ON-TABLE ?auto_128528 ) ( ON ?auto_128527 ?auto_128526 ) ( ON ?auto_128525 ?auto_128527 ) ( ON ?auto_128524 ?auto_128525 ) ( CLEAR ?auto_128524 ) ( HOLDING ?auto_128523 ) ( CLEAR ?auto_128522 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128522 ?auto_128523 )
      ( MAKE-4PILE ?auto_128522 ?auto_128523 ?auto_128524 ?auto_128525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128530 - BLOCK
      ?auto_128531 - BLOCK
      ?auto_128532 - BLOCK
      ?auto_128533 - BLOCK
    )
    :vars
    (
      ?auto_128537 - BLOCK
      ?auto_128536 - BLOCK
      ?auto_128534 - BLOCK
      ?auto_128535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128530 ) ( not ( = ?auto_128530 ?auto_128531 ) ) ( not ( = ?auto_128530 ?auto_128532 ) ) ( not ( = ?auto_128530 ?auto_128533 ) ) ( not ( = ?auto_128530 ?auto_128537 ) ) ( not ( = ?auto_128531 ?auto_128532 ) ) ( not ( = ?auto_128531 ?auto_128533 ) ) ( not ( = ?auto_128531 ?auto_128537 ) ) ( not ( = ?auto_128532 ?auto_128533 ) ) ( not ( = ?auto_128532 ?auto_128537 ) ) ( not ( = ?auto_128533 ?auto_128537 ) ) ( not ( = ?auto_128530 ?auto_128536 ) ) ( not ( = ?auto_128530 ?auto_128534 ) ) ( not ( = ?auto_128531 ?auto_128536 ) ) ( not ( = ?auto_128531 ?auto_128534 ) ) ( not ( = ?auto_128532 ?auto_128536 ) ) ( not ( = ?auto_128532 ?auto_128534 ) ) ( not ( = ?auto_128533 ?auto_128536 ) ) ( not ( = ?auto_128533 ?auto_128534 ) ) ( not ( = ?auto_128537 ?auto_128536 ) ) ( not ( = ?auto_128537 ?auto_128534 ) ) ( not ( = ?auto_128536 ?auto_128534 ) ) ( ON ?auto_128534 ?auto_128535 ) ( not ( = ?auto_128530 ?auto_128535 ) ) ( not ( = ?auto_128531 ?auto_128535 ) ) ( not ( = ?auto_128532 ?auto_128535 ) ) ( not ( = ?auto_128533 ?auto_128535 ) ) ( not ( = ?auto_128537 ?auto_128535 ) ) ( not ( = ?auto_128536 ?auto_128535 ) ) ( not ( = ?auto_128534 ?auto_128535 ) ) ( ON ?auto_128536 ?auto_128534 ) ( ON-TABLE ?auto_128535 ) ( ON ?auto_128537 ?auto_128536 ) ( ON ?auto_128533 ?auto_128537 ) ( ON ?auto_128532 ?auto_128533 ) ( CLEAR ?auto_128530 ) ( ON ?auto_128531 ?auto_128532 ) ( CLEAR ?auto_128531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128535 ?auto_128534 ?auto_128536 ?auto_128537 ?auto_128533 ?auto_128532 )
      ( MAKE-4PILE ?auto_128530 ?auto_128531 ?auto_128532 ?auto_128533 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128538 - BLOCK
      ?auto_128539 - BLOCK
      ?auto_128540 - BLOCK
      ?auto_128541 - BLOCK
    )
    :vars
    (
      ?auto_128543 - BLOCK
      ?auto_128542 - BLOCK
      ?auto_128545 - BLOCK
      ?auto_128544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128538 ?auto_128539 ) ) ( not ( = ?auto_128538 ?auto_128540 ) ) ( not ( = ?auto_128538 ?auto_128541 ) ) ( not ( = ?auto_128538 ?auto_128543 ) ) ( not ( = ?auto_128539 ?auto_128540 ) ) ( not ( = ?auto_128539 ?auto_128541 ) ) ( not ( = ?auto_128539 ?auto_128543 ) ) ( not ( = ?auto_128540 ?auto_128541 ) ) ( not ( = ?auto_128540 ?auto_128543 ) ) ( not ( = ?auto_128541 ?auto_128543 ) ) ( not ( = ?auto_128538 ?auto_128542 ) ) ( not ( = ?auto_128538 ?auto_128545 ) ) ( not ( = ?auto_128539 ?auto_128542 ) ) ( not ( = ?auto_128539 ?auto_128545 ) ) ( not ( = ?auto_128540 ?auto_128542 ) ) ( not ( = ?auto_128540 ?auto_128545 ) ) ( not ( = ?auto_128541 ?auto_128542 ) ) ( not ( = ?auto_128541 ?auto_128545 ) ) ( not ( = ?auto_128543 ?auto_128542 ) ) ( not ( = ?auto_128543 ?auto_128545 ) ) ( not ( = ?auto_128542 ?auto_128545 ) ) ( ON ?auto_128545 ?auto_128544 ) ( not ( = ?auto_128538 ?auto_128544 ) ) ( not ( = ?auto_128539 ?auto_128544 ) ) ( not ( = ?auto_128540 ?auto_128544 ) ) ( not ( = ?auto_128541 ?auto_128544 ) ) ( not ( = ?auto_128543 ?auto_128544 ) ) ( not ( = ?auto_128542 ?auto_128544 ) ) ( not ( = ?auto_128545 ?auto_128544 ) ) ( ON ?auto_128542 ?auto_128545 ) ( ON-TABLE ?auto_128544 ) ( ON ?auto_128543 ?auto_128542 ) ( ON ?auto_128541 ?auto_128543 ) ( ON ?auto_128540 ?auto_128541 ) ( ON ?auto_128539 ?auto_128540 ) ( CLEAR ?auto_128539 ) ( HOLDING ?auto_128538 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128538 )
      ( MAKE-4PILE ?auto_128538 ?auto_128539 ?auto_128540 ?auto_128541 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128546 - BLOCK
      ?auto_128547 - BLOCK
      ?auto_128548 - BLOCK
      ?auto_128549 - BLOCK
    )
    :vars
    (
      ?auto_128553 - BLOCK
      ?auto_128550 - BLOCK
      ?auto_128552 - BLOCK
      ?auto_128551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128546 ?auto_128547 ) ) ( not ( = ?auto_128546 ?auto_128548 ) ) ( not ( = ?auto_128546 ?auto_128549 ) ) ( not ( = ?auto_128546 ?auto_128553 ) ) ( not ( = ?auto_128547 ?auto_128548 ) ) ( not ( = ?auto_128547 ?auto_128549 ) ) ( not ( = ?auto_128547 ?auto_128553 ) ) ( not ( = ?auto_128548 ?auto_128549 ) ) ( not ( = ?auto_128548 ?auto_128553 ) ) ( not ( = ?auto_128549 ?auto_128553 ) ) ( not ( = ?auto_128546 ?auto_128550 ) ) ( not ( = ?auto_128546 ?auto_128552 ) ) ( not ( = ?auto_128547 ?auto_128550 ) ) ( not ( = ?auto_128547 ?auto_128552 ) ) ( not ( = ?auto_128548 ?auto_128550 ) ) ( not ( = ?auto_128548 ?auto_128552 ) ) ( not ( = ?auto_128549 ?auto_128550 ) ) ( not ( = ?auto_128549 ?auto_128552 ) ) ( not ( = ?auto_128553 ?auto_128550 ) ) ( not ( = ?auto_128553 ?auto_128552 ) ) ( not ( = ?auto_128550 ?auto_128552 ) ) ( ON ?auto_128552 ?auto_128551 ) ( not ( = ?auto_128546 ?auto_128551 ) ) ( not ( = ?auto_128547 ?auto_128551 ) ) ( not ( = ?auto_128548 ?auto_128551 ) ) ( not ( = ?auto_128549 ?auto_128551 ) ) ( not ( = ?auto_128553 ?auto_128551 ) ) ( not ( = ?auto_128550 ?auto_128551 ) ) ( not ( = ?auto_128552 ?auto_128551 ) ) ( ON ?auto_128550 ?auto_128552 ) ( ON-TABLE ?auto_128551 ) ( ON ?auto_128553 ?auto_128550 ) ( ON ?auto_128549 ?auto_128553 ) ( ON ?auto_128548 ?auto_128549 ) ( ON ?auto_128547 ?auto_128548 ) ( ON ?auto_128546 ?auto_128547 ) ( CLEAR ?auto_128546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128551 ?auto_128552 ?auto_128550 ?auto_128553 ?auto_128549 ?auto_128548 ?auto_128547 )
      ( MAKE-4PILE ?auto_128546 ?auto_128547 ?auto_128548 ?auto_128549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128557 - BLOCK
      ?auto_128558 - BLOCK
      ?auto_128559 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128559 ) ( CLEAR ?auto_128558 ) ( ON-TABLE ?auto_128557 ) ( ON ?auto_128558 ?auto_128557 ) ( not ( = ?auto_128557 ?auto_128558 ) ) ( not ( = ?auto_128557 ?auto_128559 ) ) ( not ( = ?auto_128558 ?auto_128559 ) ) )
    :subtasks
    ( ( !STACK ?auto_128559 ?auto_128558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128560 - BLOCK
      ?auto_128561 - BLOCK
      ?auto_128562 - BLOCK
    )
    :vars
    (
      ?auto_128563 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128561 ) ( ON-TABLE ?auto_128560 ) ( ON ?auto_128561 ?auto_128560 ) ( not ( = ?auto_128560 ?auto_128561 ) ) ( not ( = ?auto_128560 ?auto_128562 ) ) ( not ( = ?auto_128561 ?auto_128562 ) ) ( ON ?auto_128562 ?auto_128563 ) ( CLEAR ?auto_128562 ) ( HAND-EMPTY ) ( not ( = ?auto_128560 ?auto_128563 ) ) ( not ( = ?auto_128561 ?auto_128563 ) ) ( not ( = ?auto_128562 ?auto_128563 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128562 ?auto_128563 )
      ( MAKE-3PILE ?auto_128560 ?auto_128561 ?auto_128562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128564 - BLOCK
      ?auto_128565 - BLOCK
      ?auto_128566 - BLOCK
    )
    :vars
    (
      ?auto_128567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128564 ) ( not ( = ?auto_128564 ?auto_128565 ) ) ( not ( = ?auto_128564 ?auto_128566 ) ) ( not ( = ?auto_128565 ?auto_128566 ) ) ( ON ?auto_128566 ?auto_128567 ) ( CLEAR ?auto_128566 ) ( not ( = ?auto_128564 ?auto_128567 ) ) ( not ( = ?auto_128565 ?auto_128567 ) ) ( not ( = ?auto_128566 ?auto_128567 ) ) ( HOLDING ?auto_128565 ) ( CLEAR ?auto_128564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128564 ?auto_128565 )
      ( MAKE-3PILE ?auto_128564 ?auto_128565 ?auto_128566 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128568 - BLOCK
      ?auto_128569 - BLOCK
      ?auto_128570 - BLOCK
    )
    :vars
    (
      ?auto_128571 - BLOCK
      ?auto_128572 - BLOCK
      ?auto_128574 - BLOCK
      ?auto_128573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128568 ) ( not ( = ?auto_128568 ?auto_128569 ) ) ( not ( = ?auto_128568 ?auto_128570 ) ) ( not ( = ?auto_128569 ?auto_128570 ) ) ( ON ?auto_128570 ?auto_128571 ) ( not ( = ?auto_128568 ?auto_128571 ) ) ( not ( = ?auto_128569 ?auto_128571 ) ) ( not ( = ?auto_128570 ?auto_128571 ) ) ( CLEAR ?auto_128568 ) ( ON ?auto_128569 ?auto_128570 ) ( CLEAR ?auto_128569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128572 ) ( ON ?auto_128574 ?auto_128572 ) ( ON ?auto_128573 ?auto_128574 ) ( ON ?auto_128571 ?auto_128573 ) ( not ( = ?auto_128572 ?auto_128574 ) ) ( not ( = ?auto_128572 ?auto_128573 ) ) ( not ( = ?auto_128572 ?auto_128571 ) ) ( not ( = ?auto_128572 ?auto_128570 ) ) ( not ( = ?auto_128572 ?auto_128569 ) ) ( not ( = ?auto_128574 ?auto_128573 ) ) ( not ( = ?auto_128574 ?auto_128571 ) ) ( not ( = ?auto_128574 ?auto_128570 ) ) ( not ( = ?auto_128574 ?auto_128569 ) ) ( not ( = ?auto_128573 ?auto_128571 ) ) ( not ( = ?auto_128573 ?auto_128570 ) ) ( not ( = ?auto_128573 ?auto_128569 ) ) ( not ( = ?auto_128568 ?auto_128572 ) ) ( not ( = ?auto_128568 ?auto_128574 ) ) ( not ( = ?auto_128568 ?auto_128573 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128572 ?auto_128574 ?auto_128573 ?auto_128571 ?auto_128570 )
      ( MAKE-3PILE ?auto_128568 ?auto_128569 ?auto_128570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128575 - BLOCK
      ?auto_128576 - BLOCK
      ?auto_128577 - BLOCK
    )
    :vars
    (
      ?auto_128580 - BLOCK
      ?auto_128581 - BLOCK
      ?auto_128578 - BLOCK
      ?auto_128579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128575 ?auto_128576 ) ) ( not ( = ?auto_128575 ?auto_128577 ) ) ( not ( = ?auto_128576 ?auto_128577 ) ) ( ON ?auto_128577 ?auto_128580 ) ( not ( = ?auto_128575 ?auto_128580 ) ) ( not ( = ?auto_128576 ?auto_128580 ) ) ( not ( = ?auto_128577 ?auto_128580 ) ) ( ON ?auto_128576 ?auto_128577 ) ( CLEAR ?auto_128576 ) ( ON-TABLE ?auto_128581 ) ( ON ?auto_128578 ?auto_128581 ) ( ON ?auto_128579 ?auto_128578 ) ( ON ?auto_128580 ?auto_128579 ) ( not ( = ?auto_128581 ?auto_128578 ) ) ( not ( = ?auto_128581 ?auto_128579 ) ) ( not ( = ?auto_128581 ?auto_128580 ) ) ( not ( = ?auto_128581 ?auto_128577 ) ) ( not ( = ?auto_128581 ?auto_128576 ) ) ( not ( = ?auto_128578 ?auto_128579 ) ) ( not ( = ?auto_128578 ?auto_128580 ) ) ( not ( = ?auto_128578 ?auto_128577 ) ) ( not ( = ?auto_128578 ?auto_128576 ) ) ( not ( = ?auto_128579 ?auto_128580 ) ) ( not ( = ?auto_128579 ?auto_128577 ) ) ( not ( = ?auto_128579 ?auto_128576 ) ) ( not ( = ?auto_128575 ?auto_128581 ) ) ( not ( = ?auto_128575 ?auto_128578 ) ) ( not ( = ?auto_128575 ?auto_128579 ) ) ( HOLDING ?auto_128575 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128575 )
      ( MAKE-3PILE ?auto_128575 ?auto_128576 ?auto_128577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128582 - BLOCK
      ?auto_128583 - BLOCK
      ?auto_128584 - BLOCK
    )
    :vars
    (
      ?auto_128586 - BLOCK
      ?auto_128585 - BLOCK
      ?auto_128587 - BLOCK
      ?auto_128588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128582 ?auto_128583 ) ) ( not ( = ?auto_128582 ?auto_128584 ) ) ( not ( = ?auto_128583 ?auto_128584 ) ) ( ON ?auto_128584 ?auto_128586 ) ( not ( = ?auto_128582 ?auto_128586 ) ) ( not ( = ?auto_128583 ?auto_128586 ) ) ( not ( = ?auto_128584 ?auto_128586 ) ) ( ON ?auto_128583 ?auto_128584 ) ( ON-TABLE ?auto_128585 ) ( ON ?auto_128587 ?auto_128585 ) ( ON ?auto_128588 ?auto_128587 ) ( ON ?auto_128586 ?auto_128588 ) ( not ( = ?auto_128585 ?auto_128587 ) ) ( not ( = ?auto_128585 ?auto_128588 ) ) ( not ( = ?auto_128585 ?auto_128586 ) ) ( not ( = ?auto_128585 ?auto_128584 ) ) ( not ( = ?auto_128585 ?auto_128583 ) ) ( not ( = ?auto_128587 ?auto_128588 ) ) ( not ( = ?auto_128587 ?auto_128586 ) ) ( not ( = ?auto_128587 ?auto_128584 ) ) ( not ( = ?auto_128587 ?auto_128583 ) ) ( not ( = ?auto_128588 ?auto_128586 ) ) ( not ( = ?auto_128588 ?auto_128584 ) ) ( not ( = ?auto_128588 ?auto_128583 ) ) ( not ( = ?auto_128582 ?auto_128585 ) ) ( not ( = ?auto_128582 ?auto_128587 ) ) ( not ( = ?auto_128582 ?auto_128588 ) ) ( ON ?auto_128582 ?auto_128583 ) ( CLEAR ?auto_128582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128585 ?auto_128587 ?auto_128588 ?auto_128586 ?auto_128584 ?auto_128583 )
      ( MAKE-3PILE ?auto_128582 ?auto_128583 ?auto_128584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128589 - BLOCK
      ?auto_128590 - BLOCK
      ?auto_128591 - BLOCK
    )
    :vars
    (
      ?auto_128592 - BLOCK
      ?auto_128593 - BLOCK
      ?auto_128595 - BLOCK
      ?auto_128594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128589 ?auto_128590 ) ) ( not ( = ?auto_128589 ?auto_128591 ) ) ( not ( = ?auto_128590 ?auto_128591 ) ) ( ON ?auto_128591 ?auto_128592 ) ( not ( = ?auto_128589 ?auto_128592 ) ) ( not ( = ?auto_128590 ?auto_128592 ) ) ( not ( = ?auto_128591 ?auto_128592 ) ) ( ON ?auto_128590 ?auto_128591 ) ( ON-TABLE ?auto_128593 ) ( ON ?auto_128595 ?auto_128593 ) ( ON ?auto_128594 ?auto_128595 ) ( ON ?auto_128592 ?auto_128594 ) ( not ( = ?auto_128593 ?auto_128595 ) ) ( not ( = ?auto_128593 ?auto_128594 ) ) ( not ( = ?auto_128593 ?auto_128592 ) ) ( not ( = ?auto_128593 ?auto_128591 ) ) ( not ( = ?auto_128593 ?auto_128590 ) ) ( not ( = ?auto_128595 ?auto_128594 ) ) ( not ( = ?auto_128595 ?auto_128592 ) ) ( not ( = ?auto_128595 ?auto_128591 ) ) ( not ( = ?auto_128595 ?auto_128590 ) ) ( not ( = ?auto_128594 ?auto_128592 ) ) ( not ( = ?auto_128594 ?auto_128591 ) ) ( not ( = ?auto_128594 ?auto_128590 ) ) ( not ( = ?auto_128589 ?auto_128593 ) ) ( not ( = ?auto_128589 ?auto_128595 ) ) ( not ( = ?auto_128589 ?auto_128594 ) ) ( HOLDING ?auto_128589 ) ( CLEAR ?auto_128590 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128593 ?auto_128595 ?auto_128594 ?auto_128592 ?auto_128591 ?auto_128590 ?auto_128589 )
      ( MAKE-3PILE ?auto_128589 ?auto_128590 ?auto_128591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128596 - BLOCK
      ?auto_128597 - BLOCK
      ?auto_128598 - BLOCK
    )
    :vars
    (
      ?auto_128599 - BLOCK
      ?auto_128602 - BLOCK
      ?auto_128601 - BLOCK
      ?auto_128600 - BLOCK
      ?auto_128603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128596 ?auto_128597 ) ) ( not ( = ?auto_128596 ?auto_128598 ) ) ( not ( = ?auto_128597 ?auto_128598 ) ) ( ON ?auto_128598 ?auto_128599 ) ( not ( = ?auto_128596 ?auto_128599 ) ) ( not ( = ?auto_128597 ?auto_128599 ) ) ( not ( = ?auto_128598 ?auto_128599 ) ) ( ON ?auto_128597 ?auto_128598 ) ( ON-TABLE ?auto_128602 ) ( ON ?auto_128601 ?auto_128602 ) ( ON ?auto_128600 ?auto_128601 ) ( ON ?auto_128599 ?auto_128600 ) ( not ( = ?auto_128602 ?auto_128601 ) ) ( not ( = ?auto_128602 ?auto_128600 ) ) ( not ( = ?auto_128602 ?auto_128599 ) ) ( not ( = ?auto_128602 ?auto_128598 ) ) ( not ( = ?auto_128602 ?auto_128597 ) ) ( not ( = ?auto_128601 ?auto_128600 ) ) ( not ( = ?auto_128601 ?auto_128599 ) ) ( not ( = ?auto_128601 ?auto_128598 ) ) ( not ( = ?auto_128601 ?auto_128597 ) ) ( not ( = ?auto_128600 ?auto_128599 ) ) ( not ( = ?auto_128600 ?auto_128598 ) ) ( not ( = ?auto_128600 ?auto_128597 ) ) ( not ( = ?auto_128596 ?auto_128602 ) ) ( not ( = ?auto_128596 ?auto_128601 ) ) ( not ( = ?auto_128596 ?auto_128600 ) ) ( CLEAR ?auto_128597 ) ( ON ?auto_128596 ?auto_128603 ) ( CLEAR ?auto_128596 ) ( HAND-EMPTY ) ( not ( = ?auto_128596 ?auto_128603 ) ) ( not ( = ?auto_128597 ?auto_128603 ) ) ( not ( = ?auto_128598 ?auto_128603 ) ) ( not ( = ?auto_128599 ?auto_128603 ) ) ( not ( = ?auto_128602 ?auto_128603 ) ) ( not ( = ?auto_128601 ?auto_128603 ) ) ( not ( = ?auto_128600 ?auto_128603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128596 ?auto_128603 )
      ( MAKE-3PILE ?auto_128596 ?auto_128597 ?auto_128598 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128604 - BLOCK
      ?auto_128605 - BLOCK
      ?auto_128606 - BLOCK
    )
    :vars
    (
      ?auto_128610 - BLOCK
      ?auto_128607 - BLOCK
      ?auto_128609 - BLOCK
      ?auto_128611 - BLOCK
      ?auto_128608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128604 ?auto_128605 ) ) ( not ( = ?auto_128604 ?auto_128606 ) ) ( not ( = ?auto_128605 ?auto_128606 ) ) ( ON ?auto_128606 ?auto_128610 ) ( not ( = ?auto_128604 ?auto_128610 ) ) ( not ( = ?auto_128605 ?auto_128610 ) ) ( not ( = ?auto_128606 ?auto_128610 ) ) ( ON-TABLE ?auto_128607 ) ( ON ?auto_128609 ?auto_128607 ) ( ON ?auto_128611 ?auto_128609 ) ( ON ?auto_128610 ?auto_128611 ) ( not ( = ?auto_128607 ?auto_128609 ) ) ( not ( = ?auto_128607 ?auto_128611 ) ) ( not ( = ?auto_128607 ?auto_128610 ) ) ( not ( = ?auto_128607 ?auto_128606 ) ) ( not ( = ?auto_128607 ?auto_128605 ) ) ( not ( = ?auto_128609 ?auto_128611 ) ) ( not ( = ?auto_128609 ?auto_128610 ) ) ( not ( = ?auto_128609 ?auto_128606 ) ) ( not ( = ?auto_128609 ?auto_128605 ) ) ( not ( = ?auto_128611 ?auto_128610 ) ) ( not ( = ?auto_128611 ?auto_128606 ) ) ( not ( = ?auto_128611 ?auto_128605 ) ) ( not ( = ?auto_128604 ?auto_128607 ) ) ( not ( = ?auto_128604 ?auto_128609 ) ) ( not ( = ?auto_128604 ?auto_128611 ) ) ( ON ?auto_128604 ?auto_128608 ) ( CLEAR ?auto_128604 ) ( not ( = ?auto_128604 ?auto_128608 ) ) ( not ( = ?auto_128605 ?auto_128608 ) ) ( not ( = ?auto_128606 ?auto_128608 ) ) ( not ( = ?auto_128610 ?auto_128608 ) ) ( not ( = ?auto_128607 ?auto_128608 ) ) ( not ( = ?auto_128609 ?auto_128608 ) ) ( not ( = ?auto_128611 ?auto_128608 ) ) ( HOLDING ?auto_128605 ) ( CLEAR ?auto_128606 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128607 ?auto_128609 ?auto_128611 ?auto_128610 ?auto_128606 ?auto_128605 )
      ( MAKE-3PILE ?auto_128604 ?auto_128605 ?auto_128606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128612 - BLOCK
      ?auto_128613 - BLOCK
      ?auto_128614 - BLOCK
    )
    :vars
    (
      ?auto_128618 - BLOCK
      ?auto_128616 - BLOCK
      ?auto_128617 - BLOCK
      ?auto_128619 - BLOCK
      ?auto_128615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128612 ?auto_128613 ) ) ( not ( = ?auto_128612 ?auto_128614 ) ) ( not ( = ?auto_128613 ?auto_128614 ) ) ( ON ?auto_128614 ?auto_128618 ) ( not ( = ?auto_128612 ?auto_128618 ) ) ( not ( = ?auto_128613 ?auto_128618 ) ) ( not ( = ?auto_128614 ?auto_128618 ) ) ( ON-TABLE ?auto_128616 ) ( ON ?auto_128617 ?auto_128616 ) ( ON ?auto_128619 ?auto_128617 ) ( ON ?auto_128618 ?auto_128619 ) ( not ( = ?auto_128616 ?auto_128617 ) ) ( not ( = ?auto_128616 ?auto_128619 ) ) ( not ( = ?auto_128616 ?auto_128618 ) ) ( not ( = ?auto_128616 ?auto_128614 ) ) ( not ( = ?auto_128616 ?auto_128613 ) ) ( not ( = ?auto_128617 ?auto_128619 ) ) ( not ( = ?auto_128617 ?auto_128618 ) ) ( not ( = ?auto_128617 ?auto_128614 ) ) ( not ( = ?auto_128617 ?auto_128613 ) ) ( not ( = ?auto_128619 ?auto_128618 ) ) ( not ( = ?auto_128619 ?auto_128614 ) ) ( not ( = ?auto_128619 ?auto_128613 ) ) ( not ( = ?auto_128612 ?auto_128616 ) ) ( not ( = ?auto_128612 ?auto_128617 ) ) ( not ( = ?auto_128612 ?auto_128619 ) ) ( ON ?auto_128612 ?auto_128615 ) ( not ( = ?auto_128612 ?auto_128615 ) ) ( not ( = ?auto_128613 ?auto_128615 ) ) ( not ( = ?auto_128614 ?auto_128615 ) ) ( not ( = ?auto_128618 ?auto_128615 ) ) ( not ( = ?auto_128616 ?auto_128615 ) ) ( not ( = ?auto_128617 ?auto_128615 ) ) ( not ( = ?auto_128619 ?auto_128615 ) ) ( CLEAR ?auto_128614 ) ( ON ?auto_128613 ?auto_128612 ) ( CLEAR ?auto_128613 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128615 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128615 ?auto_128612 )
      ( MAKE-3PILE ?auto_128612 ?auto_128613 ?auto_128614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128620 - BLOCK
      ?auto_128621 - BLOCK
      ?auto_128622 - BLOCK
    )
    :vars
    (
      ?auto_128625 - BLOCK
      ?auto_128623 - BLOCK
      ?auto_128627 - BLOCK
      ?auto_128626 - BLOCK
      ?auto_128624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128620 ?auto_128621 ) ) ( not ( = ?auto_128620 ?auto_128622 ) ) ( not ( = ?auto_128621 ?auto_128622 ) ) ( not ( = ?auto_128620 ?auto_128625 ) ) ( not ( = ?auto_128621 ?auto_128625 ) ) ( not ( = ?auto_128622 ?auto_128625 ) ) ( ON-TABLE ?auto_128623 ) ( ON ?auto_128627 ?auto_128623 ) ( ON ?auto_128626 ?auto_128627 ) ( ON ?auto_128625 ?auto_128626 ) ( not ( = ?auto_128623 ?auto_128627 ) ) ( not ( = ?auto_128623 ?auto_128626 ) ) ( not ( = ?auto_128623 ?auto_128625 ) ) ( not ( = ?auto_128623 ?auto_128622 ) ) ( not ( = ?auto_128623 ?auto_128621 ) ) ( not ( = ?auto_128627 ?auto_128626 ) ) ( not ( = ?auto_128627 ?auto_128625 ) ) ( not ( = ?auto_128627 ?auto_128622 ) ) ( not ( = ?auto_128627 ?auto_128621 ) ) ( not ( = ?auto_128626 ?auto_128625 ) ) ( not ( = ?auto_128626 ?auto_128622 ) ) ( not ( = ?auto_128626 ?auto_128621 ) ) ( not ( = ?auto_128620 ?auto_128623 ) ) ( not ( = ?auto_128620 ?auto_128627 ) ) ( not ( = ?auto_128620 ?auto_128626 ) ) ( ON ?auto_128620 ?auto_128624 ) ( not ( = ?auto_128620 ?auto_128624 ) ) ( not ( = ?auto_128621 ?auto_128624 ) ) ( not ( = ?auto_128622 ?auto_128624 ) ) ( not ( = ?auto_128625 ?auto_128624 ) ) ( not ( = ?auto_128623 ?auto_128624 ) ) ( not ( = ?auto_128627 ?auto_128624 ) ) ( not ( = ?auto_128626 ?auto_128624 ) ) ( ON ?auto_128621 ?auto_128620 ) ( CLEAR ?auto_128621 ) ( ON-TABLE ?auto_128624 ) ( HOLDING ?auto_128622 ) ( CLEAR ?auto_128625 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128623 ?auto_128627 ?auto_128626 ?auto_128625 ?auto_128622 )
      ( MAKE-3PILE ?auto_128620 ?auto_128621 ?auto_128622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128628 - BLOCK
      ?auto_128629 - BLOCK
      ?auto_128630 - BLOCK
    )
    :vars
    (
      ?auto_128635 - BLOCK
      ?auto_128631 - BLOCK
      ?auto_128634 - BLOCK
      ?auto_128632 - BLOCK
      ?auto_128633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128628 ?auto_128629 ) ) ( not ( = ?auto_128628 ?auto_128630 ) ) ( not ( = ?auto_128629 ?auto_128630 ) ) ( not ( = ?auto_128628 ?auto_128635 ) ) ( not ( = ?auto_128629 ?auto_128635 ) ) ( not ( = ?auto_128630 ?auto_128635 ) ) ( ON-TABLE ?auto_128631 ) ( ON ?auto_128634 ?auto_128631 ) ( ON ?auto_128632 ?auto_128634 ) ( ON ?auto_128635 ?auto_128632 ) ( not ( = ?auto_128631 ?auto_128634 ) ) ( not ( = ?auto_128631 ?auto_128632 ) ) ( not ( = ?auto_128631 ?auto_128635 ) ) ( not ( = ?auto_128631 ?auto_128630 ) ) ( not ( = ?auto_128631 ?auto_128629 ) ) ( not ( = ?auto_128634 ?auto_128632 ) ) ( not ( = ?auto_128634 ?auto_128635 ) ) ( not ( = ?auto_128634 ?auto_128630 ) ) ( not ( = ?auto_128634 ?auto_128629 ) ) ( not ( = ?auto_128632 ?auto_128635 ) ) ( not ( = ?auto_128632 ?auto_128630 ) ) ( not ( = ?auto_128632 ?auto_128629 ) ) ( not ( = ?auto_128628 ?auto_128631 ) ) ( not ( = ?auto_128628 ?auto_128634 ) ) ( not ( = ?auto_128628 ?auto_128632 ) ) ( ON ?auto_128628 ?auto_128633 ) ( not ( = ?auto_128628 ?auto_128633 ) ) ( not ( = ?auto_128629 ?auto_128633 ) ) ( not ( = ?auto_128630 ?auto_128633 ) ) ( not ( = ?auto_128635 ?auto_128633 ) ) ( not ( = ?auto_128631 ?auto_128633 ) ) ( not ( = ?auto_128634 ?auto_128633 ) ) ( not ( = ?auto_128632 ?auto_128633 ) ) ( ON ?auto_128629 ?auto_128628 ) ( ON-TABLE ?auto_128633 ) ( CLEAR ?auto_128635 ) ( ON ?auto_128630 ?auto_128629 ) ( CLEAR ?auto_128630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128633 ?auto_128628 ?auto_128629 )
      ( MAKE-3PILE ?auto_128628 ?auto_128629 ?auto_128630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128636 - BLOCK
      ?auto_128637 - BLOCK
      ?auto_128638 - BLOCK
    )
    :vars
    (
      ?auto_128643 - BLOCK
      ?auto_128640 - BLOCK
      ?auto_128639 - BLOCK
      ?auto_128642 - BLOCK
      ?auto_128641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128636 ?auto_128637 ) ) ( not ( = ?auto_128636 ?auto_128638 ) ) ( not ( = ?auto_128637 ?auto_128638 ) ) ( not ( = ?auto_128636 ?auto_128643 ) ) ( not ( = ?auto_128637 ?auto_128643 ) ) ( not ( = ?auto_128638 ?auto_128643 ) ) ( ON-TABLE ?auto_128640 ) ( ON ?auto_128639 ?auto_128640 ) ( ON ?auto_128642 ?auto_128639 ) ( not ( = ?auto_128640 ?auto_128639 ) ) ( not ( = ?auto_128640 ?auto_128642 ) ) ( not ( = ?auto_128640 ?auto_128643 ) ) ( not ( = ?auto_128640 ?auto_128638 ) ) ( not ( = ?auto_128640 ?auto_128637 ) ) ( not ( = ?auto_128639 ?auto_128642 ) ) ( not ( = ?auto_128639 ?auto_128643 ) ) ( not ( = ?auto_128639 ?auto_128638 ) ) ( not ( = ?auto_128639 ?auto_128637 ) ) ( not ( = ?auto_128642 ?auto_128643 ) ) ( not ( = ?auto_128642 ?auto_128638 ) ) ( not ( = ?auto_128642 ?auto_128637 ) ) ( not ( = ?auto_128636 ?auto_128640 ) ) ( not ( = ?auto_128636 ?auto_128639 ) ) ( not ( = ?auto_128636 ?auto_128642 ) ) ( ON ?auto_128636 ?auto_128641 ) ( not ( = ?auto_128636 ?auto_128641 ) ) ( not ( = ?auto_128637 ?auto_128641 ) ) ( not ( = ?auto_128638 ?auto_128641 ) ) ( not ( = ?auto_128643 ?auto_128641 ) ) ( not ( = ?auto_128640 ?auto_128641 ) ) ( not ( = ?auto_128639 ?auto_128641 ) ) ( not ( = ?auto_128642 ?auto_128641 ) ) ( ON ?auto_128637 ?auto_128636 ) ( ON-TABLE ?auto_128641 ) ( ON ?auto_128638 ?auto_128637 ) ( CLEAR ?auto_128638 ) ( HOLDING ?auto_128643 ) ( CLEAR ?auto_128642 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128640 ?auto_128639 ?auto_128642 ?auto_128643 )
      ( MAKE-3PILE ?auto_128636 ?auto_128637 ?auto_128638 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128644 - BLOCK
      ?auto_128645 - BLOCK
      ?auto_128646 - BLOCK
    )
    :vars
    (
      ?auto_128650 - BLOCK
      ?auto_128647 - BLOCK
      ?auto_128649 - BLOCK
      ?auto_128648 - BLOCK
      ?auto_128651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128644 ?auto_128645 ) ) ( not ( = ?auto_128644 ?auto_128646 ) ) ( not ( = ?auto_128645 ?auto_128646 ) ) ( not ( = ?auto_128644 ?auto_128650 ) ) ( not ( = ?auto_128645 ?auto_128650 ) ) ( not ( = ?auto_128646 ?auto_128650 ) ) ( ON-TABLE ?auto_128647 ) ( ON ?auto_128649 ?auto_128647 ) ( ON ?auto_128648 ?auto_128649 ) ( not ( = ?auto_128647 ?auto_128649 ) ) ( not ( = ?auto_128647 ?auto_128648 ) ) ( not ( = ?auto_128647 ?auto_128650 ) ) ( not ( = ?auto_128647 ?auto_128646 ) ) ( not ( = ?auto_128647 ?auto_128645 ) ) ( not ( = ?auto_128649 ?auto_128648 ) ) ( not ( = ?auto_128649 ?auto_128650 ) ) ( not ( = ?auto_128649 ?auto_128646 ) ) ( not ( = ?auto_128649 ?auto_128645 ) ) ( not ( = ?auto_128648 ?auto_128650 ) ) ( not ( = ?auto_128648 ?auto_128646 ) ) ( not ( = ?auto_128648 ?auto_128645 ) ) ( not ( = ?auto_128644 ?auto_128647 ) ) ( not ( = ?auto_128644 ?auto_128649 ) ) ( not ( = ?auto_128644 ?auto_128648 ) ) ( ON ?auto_128644 ?auto_128651 ) ( not ( = ?auto_128644 ?auto_128651 ) ) ( not ( = ?auto_128645 ?auto_128651 ) ) ( not ( = ?auto_128646 ?auto_128651 ) ) ( not ( = ?auto_128650 ?auto_128651 ) ) ( not ( = ?auto_128647 ?auto_128651 ) ) ( not ( = ?auto_128649 ?auto_128651 ) ) ( not ( = ?auto_128648 ?auto_128651 ) ) ( ON ?auto_128645 ?auto_128644 ) ( ON-TABLE ?auto_128651 ) ( ON ?auto_128646 ?auto_128645 ) ( CLEAR ?auto_128648 ) ( ON ?auto_128650 ?auto_128646 ) ( CLEAR ?auto_128650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128651 ?auto_128644 ?auto_128645 ?auto_128646 )
      ( MAKE-3PILE ?auto_128644 ?auto_128645 ?auto_128646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128652 - BLOCK
      ?auto_128653 - BLOCK
      ?auto_128654 - BLOCK
    )
    :vars
    (
      ?auto_128658 - BLOCK
      ?auto_128655 - BLOCK
      ?auto_128657 - BLOCK
      ?auto_128659 - BLOCK
      ?auto_128656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128652 ?auto_128653 ) ) ( not ( = ?auto_128652 ?auto_128654 ) ) ( not ( = ?auto_128653 ?auto_128654 ) ) ( not ( = ?auto_128652 ?auto_128658 ) ) ( not ( = ?auto_128653 ?auto_128658 ) ) ( not ( = ?auto_128654 ?auto_128658 ) ) ( ON-TABLE ?auto_128655 ) ( ON ?auto_128657 ?auto_128655 ) ( not ( = ?auto_128655 ?auto_128657 ) ) ( not ( = ?auto_128655 ?auto_128659 ) ) ( not ( = ?auto_128655 ?auto_128658 ) ) ( not ( = ?auto_128655 ?auto_128654 ) ) ( not ( = ?auto_128655 ?auto_128653 ) ) ( not ( = ?auto_128657 ?auto_128659 ) ) ( not ( = ?auto_128657 ?auto_128658 ) ) ( not ( = ?auto_128657 ?auto_128654 ) ) ( not ( = ?auto_128657 ?auto_128653 ) ) ( not ( = ?auto_128659 ?auto_128658 ) ) ( not ( = ?auto_128659 ?auto_128654 ) ) ( not ( = ?auto_128659 ?auto_128653 ) ) ( not ( = ?auto_128652 ?auto_128655 ) ) ( not ( = ?auto_128652 ?auto_128657 ) ) ( not ( = ?auto_128652 ?auto_128659 ) ) ( ON ?auto_128652 ?auto_128656 ) ( not ( = ?auto_128652 ?auto_128656 ) ) ( not ( = ?auto_128653 ?auto_128656 ) ) ( not ( = ?auto_128654 ?auto_128656 ) ) ( not ( = ?auto_128658 ?auto_128656 ) ) ( not ( = ?auto_128655 ?auto_128656 ) ) ( not ( = ?auto_128657 ?auto_128656 ) ) ( not ( = ?auto_128659 ?auto_128656 ) ) ( ON ?auto_128653 ?auto_128652 ) ( ON-TABLE ?auto_128656 ) ( ON ?auto_128654 ?auto_128653 ) ( ON ?auto_128658 ?auto_128654 ) ( CLEAR ?auto_128658 ) ( HOLDING ?auto_128659 ) ( CLEAR ?auto_128657 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128655 ?auto_128657 ?auto_128659 )
      ( MAKE-3PILE ?auto_128652 ?auto_128653 ?auto_128654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128660 - BLOCK
      ?auto_128661 - BLOCK
      ?auto_128662 - BLOCK
    )
    :vars
    (
      ?auto_128663 - BLOCK
      ?auto_128666 - BLOCK
      ?auto_128665 - BLOCK
      ?auto_128664 - BLOCK
      ?auto_128667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128660 ?auto_128661 ) ) ( not ( = ?auto_128660 ?auto_128662 ) ) ( not ( = ?auto_128661 ?auto_128662 ) ) ( not ( = ?auto_128660 ?auto_128663 ) ) ( not ( = ?auto_128661 ?auto_128663 ) ) ( not ( = ?auto_128662 ?auto_128663 ) ) ( ON-TABLE ?auto_128666 ) ( ON ?auto_128665 ?auto_128666 ) ( not ( = ?auto_128666 ?auto_128665 ) ) ( not ( = ?auto_128666 ?auto_128664 ) ) ( not ( = ?auto_128666 ?auto_128663 ) ) ( not ( = ?auto_128666 ?auto_128662 ) ) ( not ( = ?auto_128666 ?auto_128661 ) ) ( not ( = ?auto_128665 ?auto_128664 ) ) ( not ( = ?auto_128665 ?auto_128663 ) ) ( not ( = ?auto_128665 ?auto_128662 ) ) ( not ( = ?auto_128665 ?auto_128661 ) ) ( not ( = ?auto_128664 ?auto_128663 ) ) ( not ( = ?auto_128664 ?auto_128662 ) ) ( not ( = ?auto_128664 ?auto_128661 ) ) ( not ( = ?auto_128660 ?auto_128666 ) ) ( not ( = ?auto_128660 ?auto_128665 ) ) ( not ( = ?auto_128660 ?auto_128664 ) ) ( ON ?auto_128660 ?auto_128667 ) ( not ( = ?auto_128660 ?auto_128667 ) ) ( not ( = ?auto_128661 ?auto_128667 ) ) ( not ( = ?auto_128662 ?auto_128667 ) ) ( not ( = ?auto_128663 ?auto_128667 ) ) ( not ( = ?auto_128666 ?auto_128667 ) ) ( not ( = ?auto_128665 ?auto_128667 ) ) ( not ( = ?auto_128664 ?auto_128667 ) ) ( ON ?auto_128661 ?auto_128660 ) ( ON-TABLE ?auto_128667 ) ( ON ?auto_128662 ?auto_128661 ) ( ON ?auto_128663 ?auto_128662 ) ( CLEAR ?auto_128665 ) ( ON ?auto_128664 ?auto_128663 ) ( CLEAR ?auto_128664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128667 ?auto_128660 ?auto_128661 ?auto_128662 ?auto_128663 )
      ( MAKE-3PILE ?auto_128660 ?auto_128661 ?auto_128662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128668 - BLOCK
      ?auto_128669 - BLOCK
      ?auto_128670 - BLOCK
    )
    :vars
    (
      ?auto_128672 - BLOCK
      ?auto_128673 - BLOCK
      ?auto_128671 - BLOCK
      ?auto_128674 - BLOCK
      ?auto_128675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128668 ?auto_128669 ) ) ( not ( = ?auto_128668 ?auto_128670 ) ) ( not ( = ?auto_128669 ?auto_128670 ) ) ( not ( = ?auto_128668 ?auto_128672 ) ) ( not ( = ?auto_128669 ?auto_128672 ) ) ( not ( = ?auto_128670 ?auto_128672 ) ) ( ON-TABLE ?auto_128673 ) ( not ( = ?auto_128673 ?auto_128671 ) ) ( not ( = ?auto_128673 ?auto_128674 ) ) ( not ( = ?auto_128673 ?auto_128672 ) ) ( not ( = ?auto_128673 ?auto_128670 ) ) ( not ( = ?auto_128673 ?auto_128669 ) ) ( not ( = ?auto_128671 ?auto_128674 ) ) ( not ( = ?auto_128671 ?auto_128672 ) ) ( not ( = ?auto_128671 ?auto_128670 ) ) ( not ( = ?auto_128671 ?auto_128669 ) ) ( not ( = ?auto_128674 ?auto_128672 ) ) ( not ( = ?auto_128674 ?auto_128670 ) ) ( not ( = ?auto_128674 ?auto_128669 ) ) ( not ( = ?auto_128668 ?auto_128673 ) ) ( not ( = ?auto_128668 ?auto_128671 ) ) ( not ( = ?auto_128668 ?auto_128674 ) ) ( ON ?auto_128668 ?auto_128675 ) ( not ( = ?auto_128668 ?auto_128675 ) ) ( not ( = ?auto_128669 ?auto_128675 ) ) ( not ( = ?auto_128670 ?auto_128675 ) ) ( not ( = ?auto_128672 ?auto_128675 ) ) ( not ( = ?auto_128673 ?auto_128675 ) ) ( not ( = ?auto_128671 ?auto_128675 ) ) ( not ( = ?auto_128674 ?auto_128675 ) ) ( ON ?auto_128669 ?auto_128668 ) ( ON-TABLE ?auto_128675 ) ( ON ?auto_128670 ?auto_128669 ) ( ON ?auto_128672 ?auto_128670 ) ( ON ?auto_128674 ?auto_128672 ) ( CLEAR ?auto_128674 ) ( HOLDING ?auto_128671 ) ( CLEAR ?auto_128673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128673 ?auto_128671 )
      ( MAKE-3PILE ?auto_128668 ?auto_128669 ?auto_128670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128676 - BLOCK
      ?auto_128677 - BLOCK
      ?auto_128678 - BLOCK
    )
    :vars
    (
      ?auto_128682 - BLOCK
      ?auto_128681 - BLOCK
      ?auto_128679 - BLOCK
      ?auto_128680 - BLOCK
      ?auto_128683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128676 ?auto_128677 ) ) ( not ( = ?auto_128676 ?auto_128678 ) ) ( not ( = ?auto_128677 ?auto_128678 ) ) ( not ( = ?auto_128676 ?auto_128682 ) ) ( not ( = ?auto_128677 ?auto_128682 ) ) ( not ( = ?auto_128678 ?auto_128682 ) ) ( ON-TABLE ?auto_128681 ) ( not ( = ?auto_128681 ?auto_128679 ) ) ( not ( = ?auto_128681 ?auto_128680 ) ) ( not ( = ?auto_128681 ?auto_128682 ) ) ( not ( = ?auto_128681 ?auto_128678 ) ) ( not ( = ?auto_128681 ?auto_128677 ) ) ( not ( = ?auto_128679 ?auto_128680 ) ) ( not ( = ?auto_128679 ?auto_128682 ) ) ( not ( = ?auto_128679 ?auto_128678 ) ) ( not ( = ?auto_128679 ?auto_128677 ) ) ( not ( = ?auto_128680 ?auto_128682 ) ) ( not ( = ?auto_128680 ?auto_128678 ) ) ( not ( = ?auto_128680 ?auto_128677 ) ) ( not ( = ?auto_128676 ?auto_128681 ) ) ( not ( = ?auto_128676 ?auto_128679 ) ) ( not ( = ?auto_128676 ?auto_128680 ) ) ( ON ?auto_128676 ?auto_128683 ) ( not ( = ?auto_128676 ?auto_128683 ) ) ( not ( = ?auto_128677 ?auto_128683 ) ) ( not ( = ?auto_128678 ?auto_128683 ) ) ( not ( = ?auto_128682 ?auto_128683 ) ) ( not ( = ?auto_128681 ?auto_128683 ) ) ( not ( = ?auto_128679 ?auto_128683 ) ) ( not ( = ?auto_128680 ?auto_128683 ) ) ( ON ?auto_128677 ?auto_128676 ) ( ON-TABLE ?auto_128683 ) ( ON ?auto_128678 ?auto_128677 ) ( ON ?auto_128682 ?auto_128678 ) ( ON ?auto_128680 ?auto_128682 ) ( CLEAR ?auto_128681 ) ( ON ?auto_128679 ?auto_128680 ) ( CLEAR ?auto_128679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128683 ?auto_128676 ?auto_128677 ?auto_128678 ?auto_128682 ?auto_128680 )
      ( MAKE-3PILE ?auto_128676 ?auto_128677 ?auto_128678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128684 - BLOCK
      ?auto_128685 - BLOCK
      ?auto_128686 - BLOCK
    )
    :vars
    (
      ?auto_128687 - BLOCK
      ?auto_128691 - BLOCK
      ?auto_128688 - BLOCK
      ?auto_128689 - BLOCK
      ?auto_128690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128684 ?auto_128685 ) ) ( not ( = ?auto_128684 ?auto_128686 ) ) ( not ( = ?auto_128685 ?auto_128686 ) ) ( not ( = ?auto_128684 ?auto_128687 ) ) ( not ( = ?auto_128685 ?auto_128687 ) ) ( not ( = ?auto_128686 ?auto_128687 ) ) ( not ( = ?auto_128691 ?auto_128688 ) ) ( not ( = ?auto_128691 ?auto_128689 ) ) ( not ( = ?auto_128691 ?auto_128687 ) ) ( not ( = ?auto_128691 ?auto_128686 ) ) ( not ( = ?auto_128691 ?auto_128685 ) ) ( not ( = ?auto_128688 ?auto_128689 ) ) ( not ( = ?auto_128688 ?auto_128687 ) ) ( not ( = ?auto_128688 ?auto_128686 ) ) ( not ( = ?auto_128688 ?auto_128685 ) ) ( not ( = ?auto_128689 ?auto_128687 ) ) ( not ( = ?auto_128689 ?auto_128686 ) ) ( not ( = ?auto_128689 ?auto_128685 ) ) ( not ( = ?auto_128684 ?auto_128691 ) ) ( not ( = ?auto_128684 ?auto_128688 ) ) ( not ( = ?auto_128684 ?auto_128689 ) ) ( ON ?auto_128684 ?auto_128690 ) ( not ( = ?auto_128684 ?auto_128690 ) ) ( not ( = ?auto_128685 ?auto_128690 ) ) ( not ( = ?auto_128686 ?auto_128690 ) ) ( not ( = ?auto_128687 ?auto_128690 ) ) ( not ( = ?auto_128691 ?auto_128690 ) ) ( not ( = ?auto_128688 ?auto_128690 ) ) ( not ( = ?auto_128689 ?auto_128690 ) ) ( ON ?auto_128685 ?auto_128684 ) ( ON-TABLE ?auto_128690 ) ( ON ?auto_128686 ?auto_128685 ) ( ON ?auto_128687 ?auto_128686 ) ( ON ?auto_128689 ?auto_128687 ) ( ON ?auto_128688 ?auto_128689 ) ( CLEAR ?auto_128688 ) ( HOLDING ?auto_128691 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128691 )
      ( MAKE-3PILE ?auto_128684 ?auto_128685 ?auto_128686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128692 - BLOCK
      ?auto_128693 - BLOCK
      ?auto_128694 - BLOCK
    )
    :vars
    (
      ?auto_128696 - BLOCK
      ?auto_128698 - BLOCK
      ?auto_128697 - BLOCK
      ?auto_128699 - BLOCK
      ?auto_128695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128692 ?auto_128693 ) ) ( not ( = ?auto_128692 ?auto_128694 ) ) ( not ( = ?auto_128693 ?auto_128694 ) ) ( not ( = ?auto_128692 ?auto_128696 ) ) ( not ( = ?auto_128693 ?auto_128696 ) ) ( not ( = ?auto_128694 ?auto_128696 ) ) ( not ( = ?auto_128698 ?auto_128697 ) ) ( not ( = ?auto_128698 ?auto_128699 ) ) ( not ( = ?auto_128698 ?auto_128696 ) ) ( not ( = ?auto_128698 ?auto_128694 ) ) ( not ( = ?auto_128698 ?auto_128693 ) ) ( not ( = ?auto_128697 ?auto_128699 ) ) ( not ( = ?auto_128697 ?auto_128696 ) ) ( not ( = ?auto_128697 ?auto_128694 ) ) ( not ( = ?auto_128697 ?auto_128693 ) ) ( not ( = ?auto_128699 ?auto_128696 ) ) ( not ( = ?auto_128699 ?auto_128694 ) ) ( not ( = ?auto_128699 ?auto_128693 ) ) ( not ( = ?auto_128692 ?auto_128698 ) ) ( not ( = ?auto_128692 ?auto_128697 ) ) ( not ( = ?auto_128692 ?auto_128699 ) ) ( ON ?auto_128692 ?auto_128695 ) ( not ( = ?auto_128692 ?auto_128695 ) ) ( not ( = ?auto_128693 ?auto_128695 ) ) ( not ( = ?auto_128694 ?auto_128695 ) ) ( not ( = ?auto_128696 ?auto_128695 ) ) ( not ( = ?auto_128698 ?auto_128695 ) ) ( not ( = ?auto_128697 ?auto_128695 ) ) ( not ( = ?auto_128699 ?auto_128695 ) ) ( ON ?auto_128693 ?auto_128692 ) ( ON-TABLE ?auto_128695 ) ( ON ?auto_128694 ?auto_128693 ) ( ON ?auto_128696 ?auto_128694 ) ( ON ?auto_128699 ?auto_128696 ) ( ON ?auto_128697 ?auto_128699 ) ( ON ?auto_128698 ?auto_128697 ) ( CLEAR ?auto_128698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128695 ?auto_128692 ?auto_128693 ?auto_128694 ?auto_128696 ?auto_128699 ?auto_128697 )
      ( MAKE-3PILE ?auto_128692 ?auto_128693 ?auto_128694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128703 - BLOCK
      ?auto_128704 - BLOCK
      ?auto_128705 - BLOCK
    )
    :vars
    (
      ?auto_128706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128706 ?auto_128705 ) ( CLEAR ?auto_128706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128703 ) ( ON ?auto_128704 ?auto_128703 ) ( ON ?auto_128705 ?auto_128704 ) ( not ( = ?auto_128703 ?auto_128704 ) ) ( not ( = ?auto_128703 ?auto_128705 ) ) ( not ( = ?auto_128703 ?auto_128706 ) ) ( not ( = ?auto_128704 ?auto_128705 ) ) ( not ( = ?auto_128704 ?auto_128706 ) ) ( not ( = ?auto_128705 ?auto_128706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128706 ?auto_128705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128707 - BLOCK
      ?auto_128708 - BLOCK
      ?auto_128709 - BLOCK
    )
    :vars
    (
      ?auto_128710 - BLOCK
      ?auto_128711 - BLOCK
      ?auto_128712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128710 ?auto_128709 ) ( CLEAR ?auto_128710 ) ( ON-TABLE ?auto_128707 ) ( ON ?auto_128708 ?auto_128707 ) ( ON ?auto_128709 ?auto_128708 ) ( not ( = ?auto_128707 ?auto_128708 ) ) ( not ( = ?auto_128707 ?auto_128709 ) ) ( not ( = ?auto_128707 ?auto_128710 ) ) ( not ( = ?auto_128708 ?auto_128709 ) ) ( not ( = ?auto_128708 ?auto_128710 ) ) ( not ( = ?auto_128709 ?auto_128710 ) ) ( HOLDING ?auto_128711 ) ( CLEAR ?auto_128712 ) ( not ( = ?auto_128707 ?auto_128711 ) ) ( not ( = ?auto_128707 ?auto_128712 ) ) ( not ( = ?auto_128708 ?auto_128711 ) ) ( not ( = ?auto_128708 ?auto_128712 ) ) ( not ( = ?auto_128709 ?auto_128711 ) ) ( not ( = ?auto_128709 ?auto_128712 ) ) ( not ( = ?auto_128710 ?auto_128711 ) ) ( not ( = ?auto_128710 ?auto_128712 ) ) ( not ( = ?auto_128711 ?auto_128712 ) ) )
    :subtasks
    ( ( !STACK ?auto_128711 ?auto_128712 )
      ( MAKE-3PILE ?auto_128707 ?auto_128708 ?auto_128709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128713 - BLOCK
      ?auto_128714 - BLOCK
      ?auto_128715 - BLOCK
    )
    :vars
    (
      ?auto_128716 - BLOCK
      ?auto_128718 - BLOCK
      ?auto_128717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128716 ?auto_128715 ) ( ON-TABLE ?auto_128713 ) ( ON ?auto_128714 ?auto_128713 ) ( ON ?auto_128715 ?auto_128714 ) ( not ( = ?auto_128713 ?auto_128714 ) ) ( not ( = ?auto_128713 ?auto_128715 ) ) ( not ( = ?auto_128713 ?auto_128716 ) ) ( not ( = ?auto_128714 ?auto_128715 ) ) ( not ( = ?auto_128714 ?auto_128716 ) ) ( not ( = ?auto_128715 ?auto_128716 ) ) ( CLEAR ?auto_128718 ) ( not ( = ?auto_128713 ?auto_128717 ) ) ( not ( = ?auto_128713 ?auto_128718 ) ) ( not ( = ?auto_128714 ?auto_128717 ) ) ( not ( = ?auto_128714 ?auto_128718 ) ) ( not ( = ?auto_128715 ?auto_128717 ) ) ( not ( = ?auto_128715 ?auto_128718 ) ) ( not ( = ?auto_128716 ?auto_128717 ) ) ( not ( = ?auto_128716 ?auto_128718 ) ) ( not ( = ?auto_128717 ?auto_128718 ) ) ( ON ?auto_128717 ?auto_128716 ) ( CLEAR ?auto_128717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128713 ?auto_128714 ?auto_128715 ?auto_128716 )
      ( MAKE-3PILE ?auto_128713 ?auto_128714 ?auto_128715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128719 - BLOCK
      ?auto_128720 - BLOCK
      ?auto_128721 - BLOCK
    )
    :vars
    (
      ?auto_128723 - BLOCK
      ?auto_128724 - BLOCK
      ?auto_128722 - BLOCK
      ?auto_128725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128723 ?auto_128721 ) ( ON-TABLE ?auto_128719 ) ( ON ?auto_128720 ?auto_128719 ) ( ON ?auto_128721 ?auto_128720 ) ( not ( = ?auto_128719 ?auto_128720 ) ) ( not ( = ?auto_128719 ?auto_128721 ) ) ( not ( = ?auto_128719 ?auto_128723 ) ) ( not ( = ?auto_128720 ?auto_128721 ) ) ( not ( = ?auto_128720 ?auto_128723 ) ) ( not ( = ?auto_128721 ?auto_128723 ) ) ( not ( = ?auto_128719 ?auto_128724 ) ) ( not ( = ?auto_128719 ?auto_128722 ) ) ( not ( = ?auto_128720 ?auto_128724 ) ) ( not ( = ?auto_128720 ?auto_128722 ) ) ( not ( = ?auto_128721 ?auto_128724 ) ) ( not ( = ?auto_128721 ?auto_128722 ) ) ( not ( = ?auto_128723 ?auto_128724 ) ) ( not ( = ?auto_128723 ?auto_128722 ) ) ( not ( = ?auto_128724 ?auto_128722 ) ) ( ON ?auto_128724 ?auto_128723 ) ( CLEAR ?auto_128724 ) ( HOLDING ?auto_128722 ) ( CLEAR ?auto_128725 ) ( ON-TABLE ?auto_128725 ) ( not ( = ?auto_128725 ?auto_128722 ) ) ( not ( = ?auto_128719 ?auto_128725 ) ) ( not ( = ?auto_128720 ?auto_128725 ) ) ( not ( = ?auto_128721 ?auto_128725 ) ) ( not ( = ?auto_128723 ?auto_128725 ) ) ( not ( = ?auto_128724 ?auto_128725 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128725 ?auto_128722 )
      ( MAKE-3PILE ?auto_128719 ?auto_128720 ?auto_128721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128726 - BLOCK
      ?auto_128727 - BLOCK
      ?auto_128728 - BLOCK
    )
    :vars
    (
      ?auto_128731 - BLOCK
      ?auto_128732 - BLOCK
      ?auto_128729 - BLOCK
      ?auto_128730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128731 ?auto_128728 ) ( ON-TABLE ?auto_128726 ) ( ON ?auto_128727 ?auto_128726 ) ( ON ?auto_128728 ?auto_128727 ) ( not ( = ?auto_128726 ?auto_128727 ) ) ( not ( = ?auto_128726 ?auto_128728 ) ) ( not ( = ?auto_128726 ?auto_128731 ) ) ( not ( = ?auto_128727 ?auto_128728 ) ) ( not ( = ?auto_128727 ?auto_128731 ) ) ( not ( = ?auto_128728 ?auto_128731 ) ) ( not ( = ?auto_128726 ?auto_128732 ) ) ( not ( = ?auto_128726 ?auto_128729 ) ) ( not ( = ?auto_128727 ?auto_128732 ) ) ( not ( = ?auto_128727 ?auto_128729 ) ) ( not ( = ?auto_128728 ?auto_128732 ) ) ( not ( = ?auto_128728 ?auto_128729 ) ) ( not ( = ?auto_128731 ?auto_128732 ) ) ( not ( = ?auto_128731 ?auto_128729 ) ) ( not ( = ?auto_128732 ?auto_128729 ) ) ( ON ?auto_128732 ?auto_128731 ) ( CLEAR ?auto_128730 ) ( ON-TABLE ?auto_128730 ) ( not ( = ?auto_128730 ?auto_128729 ) ) ( not ( = ?auto_128726 ?auto_128730 ) ) ( not ( = ?auto_128727 ?auto_128730 ) ) ( not ( = ?auto_128728 ?auto_128730 ) ) ( not ( = ?auto_128731 ?auto_128730 ) ) ( not ( = ?auto_128732 ?auto_128730 ) ) ( ON ?auto_128729 ?auto_128732 ) ( CLEAR ?auto_128729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128726 ?auto_128727 ?auto_128728 ?auto_128731 ?auto_128732 )
      ( MAKE-3PILE ?auto_128726 ?auto_128727 ?auto_128728 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128733 - BLOCK
      ?auto_128734 - BLOCK
      ?auto_128735 - BLOCK
    )
    :vars
    (
      ?auto_128737 - BLOCK
      ?auto_128736 - BLOCK
      ?auto_128738 - BLOCK
      ?auto_128739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128737 ?auto_128735 ) ( ON-TABLE ?auto_128733 ) ( ON ?auto_128734 ?auto_128733 ) ( ON ?auto_128735 ?auto_128734 ) ( not ( = ?auto_128733 ?auto_128734 ) ) ( not ( = ?auto_128733 ?auto_128735 ) ) ( not ( = ?auto_128733 ?auto_128737 ) ) ( not ( = ?auto_128734 ?auto_128735 ) ) ( not ( = ?auto_128734 ?auto_128737 ) ) ( not ( = ?auto_128735 ?auto_128737 ) ) ( not ( = ?auto_128733 ?auto_128736 ) ) ( not ( = ?auto_128733 ?auto_128738 ) ) ( not ( = ?auto_128734 ?auto_128736 ) ) ( not ( = ?auto_128734 ?auto_128738 ) ) ( not ( = ?auto_128735 ?auto_128736 ) ) ( not ( = ?auto_128735 ?auto_128738 ) ) ( not ( = ?auto_128737 ?auto_128736 ) ) ( not ( = ?auto_128737 ?auto_128738 ) ) ( not ( = ?auto_128736 ?auto_128738 ) ) ( ON ?auto_128736 ?auto_128737 ) ( not ( = ?auto_128739 ?auto_128738 ) ) ( not ( = ?auto_128733 ?auto_128739 ) ) ( not ( = ?auto_128734 ?auto_128739 ) ) ( not ( = ?auto_128735 ?auto_128739 ) ) ( not ( = ?auto_128737 ?auto_128739 ) ) ( not ( = ?auto_128736 ?auto_128739 ) ) ( ON ?auto_128738 ?auto_128736 ) ( CLEAR ?auto_128738 ) ( HOLDING ?auto_128739 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128739 )
      ( MAKE-3PILE ?auto_128733 ?auto_128734 ?auto_128735 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128740 - BLOCK
      ?auto_128741 - BLOCK
      ?auto_128742 - BLOCK
    )
    :vars
    (
      ?auto_128744 - BLOCK
      ?auto_128743 - BLOCK
      ?auto_128746 - BLOCK
      ?auto_128745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128744 ?auto_128742 ) ( ON-TABLE ?auto_128740 ) ( ON ?auto_128741 ?auto_128740 ) ( ON ?auto_128742 ?auto_128741 ) ( not ( = ?auto_128740 ?auto_128741 ) ) ( not ( = ?auto_128740 ?auto_128742 ) ) ( not ( = ?auto_128740 ?auto_128744 ) ) ( not ( = ?auto_128741 ?auto_128742 ) ) ( not ( = ?auto_128741 ?auto_128744 ) ) ( not ( = ?auto_128742 ?auto_128744 ) ) ( not ( = ?auto_128740 ?auto_128743 ) ) ( not ( = ?auto_128740 ?auto_128746 ) ) ( not ( = ?auto_128741 ?auto_128743 ) ) ( not ( = ?auto_128741 ?auto_128746 ) ) ( not ( = ?auto_128742 ?auto_128743 ) ) ( not ( = ?auto_128742 ?auto_128746 ) ) ( not ( = ?auto_128744 ?auto_128743 ) ) ( not ( = ?auto_128744 ?auto_128746 ) ) ( not ( = ?auto_128743 ?auto_128746 ) ) ( ON ?auto_128743 ?auto_128744 ) ( not ( = ?auto_128745 ?auto_128746 ) ) ( not ( = ?auto_128740 ?auto_128745 ) ) ( not ( = ?auto_128741 ?auto_128745 ) ) ( not ( = ?auto_128742 ?auto_128745 ) ) ( not ( = ?auto_128744 ?auto_128745 ) ) ( not ( = ?auto_128743 ?auto_128745 ) ) ( ON ?auto_128746 ?auto_128743 ) ( ON ?auto_128745 ?auto_128746 ) ( CLEAR ?auto_128745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128740 ?auto_128741 ?auto_128742 ?auto_128744 ?auto_128743 ?auto_128746 )
      ( MAKE-3PILE ?auto_128740 ?auto_128741 ?auto_128742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128747 - BLOCK
      ?auto_128748 - BLOCK
      ?auto_128749 - BLOCK
    )
    :vars
    (
      ?auto_128750 - BLOCK
      ?auto_128751 - BLOCK
      ?auto_128753 - BLOCK
      ?auto_128752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128750 ?auto_128749 ) ( ON-TABLE ?auto_128747 ) ( ON ?auto_128748 ?auto_128747 ) ( ON ?auto_128749 ?auto_128748 ) ( not ( = ?auto_128747 ?auto_128748 ) ) ( not ( = ?auto_128747 ?auto_128749 ) ) ( not ( = ?auto_128747 ?auto_128750 ) ) ( not ( = ?auto_128748 ?auto_128749 ) ) ( not ( = ?auto_128748 ?auto_128750 ) ) ( not ( = ?auto_128749 ?auto_128750 ) ) ( not ( = ?auto_128747 ?auto_128751 ) ) ( not ( = ?auto_128747 ?auto_128753 ) ) ( not ( = ?auto_128748 ?auto_128751 ) ) ( not ( = ?auto_128748 ?auto_128753 ) ) ( not ( = ?auto_128749 ?auto_128751 ) ) ( not ( = ?auto_128749 ?auto_128753 ) ) ( not ( = ?auto_128750 ?auto_128751 ) ) ( not ( = ?auto_128750 ?auto_128753 ) ) ( not ( = ?auto_128751 ?auto_128753 ) ) ( ON ?auto_128751 ?auto_128750 ) ( not ( = ?auto_128752 ?auto_128753 ) ) ( not ( = ?auto_128747 ?auto_128752 ) ) ( not ( = ?auto_128748 ?auto_128752 ) ) ( not ( = ?auto_128749 ?auto_128752 ) ) ( not ( = ?auto_128750 ?auto_128752 ) ) ( not ( = ?auto_128751 ?auto_128752 ) ) ( ON ?auto_128753 ?auto_128751 ) ( HOLDING ?auto_128752 ) ( CLEAR ?auto_128753 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128747 ?auto_128748 ?auto_128749 ?auto_128750 ?auto_128751 ?auto_128753 ?auto_128752 )
      ( MAKE-3PILE ?auto_128747 ?auto_128748 ?auto_128749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128754 - BLOCK
      ?auto_128755 - BLOCK
      ?auto_128756 - BLOCK
    )
    :vars
    (
      ?auto_128759 - BLOCK
      ?auto_128760 - BLOCK
      ?auto_128757 - BLOCK
      ?auto_128758 - BLOCK
      ?auto_128761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128759 ?auto_128756 ) ( ON-TABLE ?auto_128754 ) ( ON ?auto_128755 ?auto_128754 ) ( ON ?auto_128756 ?auto_128755 ) ( not ( = ?auto_128754 ?auto_128755 ) ) ( not ( = ?auto_128754 ?auto_128756 ) ) ( not ( = ?auto_128754 ?auto_128759 ) ) ( not ( = ?auto_128755 ?auto_128756 ) ) ( not ( = ?auto_128755 ?auto_128759 ) ) ( not ( = ?auto_128756 ?auto_128759 ) ) ( not ( = ?auto_128754 ?auto_128760 ) ) ( not ( = ?auto_128754 ?auto_128757 ) ) ( not ( = ?auto_128755 ?auto_128760 ) ) ( not ( = ?auto_128755 ?auto_128757 ) ) ( not ( = ?auto_128756 ?auto_128760 ) ) ( not ( = ?auto_128756 ?auto_128757 ) ) ( not ( = ?auto_128759 ?auto_128760 ) ) ( not ( = ?auto_128759 ?auto_128757 ) ) ( not ( = ?auto_128760 ?auto_128757 ) ) ( ON ?auto_128760 ?auto_128759 ) ( not ( = ?auto_128758 ?auto_128757 ) ) ( not ( = ?auto_128754 ?auto_128758 ) ) ( not ( = ?auto_128755 ?auto_128758 ) ) ( not ( = ?auto_128756 ?auto_128758 ) ) ( not ( = ?auto_128759 ?auto_128758 ) ) ( not ( = ?auto_128760 ?auto_128758 ) ) ( ON ?auto_128757 ?auto_128760 ) ( CLEAR ?auto_128757 ) ( ON ?auto_128758 ?auto_128761 ) ( CLEAR ?auto_128758 ) ( HAND-EMPTY ) ( not ( = ?auto_128754 ?auto_128761 ) ) ( not ( = ?auto_128755 ?auto_128761 ) ) ( not ( = ?auto_128756 ?auto_128761 ) ) ( not ( = ?auto_128759 ?auto_128761 ) ) ( not ( = ?auto_128760 ?auto_128761 ) ) ( not ( = ?auto_128757 ?auto_128761 ) ) ( not ( = ?auto_128758 ?auto_128761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128758 ?auto_128761 )
      ( MAKE-3PILE ?auto_128754 ?auto_128755 ?auto_128756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128762 - BLOCK
      ?auto_128763 - BLOCK
      ?auto_128764 - BLOCK
    )
    :vars
    (
      ?auto_128765 - BLOCK
      ?auto_128769 - BLOCK
      ?auto_128768 - BLOCK
      ?auto_128766 - BLOCK
      ?auto_128767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128765 ?auto_128764 ) ( ON-TABLE ?auto_128762 ) ( ON ?auto_128763 ?auto_128762 ) ( ON ?auto_128764 ?auto_128763 ) ( not ( = ?auto_128762 ?auto_128763 ) ) ( not ( = ?auto_128762 ?auto_128764 ) ) ( not ( = ?auto_128762 ?auto_128765 ) ) ( not ( = ?auto_128763 ?auto_128764 ) ) ( not ( = ?auto_128763 ?auto_128765 ) ) ( not ( = ?auto_128764 ?auto_128765 ) ) ( not ( = ?auto_128762 ?auto_128769 ) ) ( not ( = ?auto_128762 ?auto_128768 ) ) ( not ( = ?auto_128763 ?auto_128769 ) ) ( not ( = ?auto_128763 ?auto_128768 ) ) ( not ( = ?auto_128764 ?auto_128769 ) ) ( not ( = ?auto_128764 ?auto_128768 ) ) ( not ( = ?auto_128765 ?auto_128769 ) ) ( not ( = ?auto_128765 ?auto_128768 ) ) ( not ( = ?auto_128769 ?auto_128768 ) ) ( ON ?auto_128769 ?auto_128765 ) ( not ( = ?auto_128766 ?auto_128768 ) ) ( not ( = ?auto_128762 ?auto_128766 ) ) ( not ( = ?auto_128763 ?auto_128766 ) ) ( not ( = ?auto_128764 ?auto_128766 ) ) ( not ( = ?auto_128765 ?auto_128766 ) ) ( not ( = ?auto_128769 ?auto_128766 ) ) ( ON ?auto_128766 ?auto_128767 ) ( CLEAR ?auto_128766 ) ( not ( = ?auto_128762 ?auto_128767 ) ) ( not ( = ?auto_128763 ?auto_128767 ) ) ( not ( = ?auto_128764 ?auto_128767 ) ) ( not ( = ?auto_128765 ?auto_128767 ) ) ( not ( = ?auto_128769 ?auto_128767 ) ) ( not ( = ?auto_128768 ?auto_128767 ) ) ( not ( = ?auto_128766 ?auto_128767 ) ) ( HOLDING ?auto_128768 ) ( CLEAR ?auto_128769 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128762 ?auto_128763 ?auto_128764 ?auto_128765 ?auto_128769 ?auto_128768 )
      ( MAKE-3PILE ?auto_128762 ?auto_128763 ?auto_128764 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128770 - BLOCK
      ?auto_128771 - BLOCK
      ?auto_128772 - BLOCK
    )
    :vars
    (
      ?auto_128774 - BLOCK
      ?auto_128776 - BLOCK
      ?auto_128777 - BLOCK
      ?auto_128775 - BLOCK
      ?auto_128773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128774 ?auto_128772 ) ( ON-TABLE ?auto_128770 ) ( ON ?auto_128771 ?auto_128770 ) ( ON ?auto_128772 ?auto_128771 ) ( not ( = ?auto_128770 ?auto_128771 ) ) ( not ( = ?auto_128770 ?auto_128772 ) ) ( not ( = ?auto_128770 ?auto_128774 ) ) ( not ( = ?auto_128771 ?auto_128772 ) ) ( not ( = ?auto_128771 ?auto_128774 ) ) ( not ( = ?auto_128772 ?auto_128774 ) ) ( not ( = ?auto_128770 ?auto_128776 ) ) ( not ( = ?auto_128770 ?auto_128777 ) ) ( not ( = ?auto_128771 ?auto_128776 ) ) ( not ( = ?auto_128771 ?auto_128777 ) ) ( not ( = ?auto_128772 ?auto_128776 ) ) ( not ( = ?auto_128772 ?auto_128777 ) ) ( not ( = ?auto_128774 ?auto_128776 ) ) ( not ( = ?auto_128774 ?auto_128777 ) ) ( not ( = ?auto_128776 ?auto_128777 ) ) ( ON ?auto_128776 ?auto_128774 ) ( not ( = ?auto_128775 ?auto_128777 ) ) ( not ( = ?auto_128770 ?auto_128775 ) ) ( not ( = ?auto_128771 ?auto_128775 ) ) ( not ( = ?auto_128772 ?auto_128775 ) ) ( not ( = ?auto_128774 ?auto_128775 ) ) ( not ( = ?auto_128776 ?auto_128775 ) ) ( ON ?auto_128775 ?auto_128773 ) ( not ( = ?auto_128770 ?auto_128773 ) ) ( not ( = ?auto_128771 ?auto_128773 ) ) ( not ( = ?auto_128772 ?auto_128773 ) ) ( not ( = ?auto_128774 ?auto_128773 ) ) ( not ( = ?auto_128776 ?auto_128773 ) ) ( not ( = ?auto_128777 ?auto_128773 ) ) ( not ( = ?auto_128775 ?auto_128773 ) ) ( CLEAR ?auto_128776 ) ( ON ?auto_128777 ?auto_128775 ) ( CLEAR ?auto_128777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128773 ?auto_128775 )
      ( MAKE-3PILE ?auto_128770 ?auto_128771 ?auto_128772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128778 - BLOCK
      ?auto_128779 - BLOCK
      ?auto_128780 - BLOCK
    )
    :vars
    (
      ?auto_128783 - BLOCK
      ?auto_128785 - BLOCK
      ?auto_128784 - BLOCK
      ?auto_128782 - BLOCK
      ?auto_128781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128783 ?auto_128780 ) ( ON-TABLE ?auto_128778 ) ( ON ?auto_128779 ?auto_128778 ) ( ON ?auto_128780 ?auto_128779 ) ( not ( = ?auto_128778 ?auto_128779 ) ) ( not ( = ?auto_128778 ?auto_128780 ) ) ( not ( = ?auto_128778 ?auto_128783 ) ) ( not ( = ?auto_128779 ?auto_128780 ) ) ( not ( = ?auto_128779 ?auto_128783 ) ) ( not ( = ?auto_128780 ?auto_128783 ) ) ( not ( = ?auto_128778 ?auto_128785 ) ) ( not ( = ?auto_128778 ?auto_128784 ) ) ( not ( = ?auto_128779 ?auto_128785 ) ) ( not ( = ?auto_128779 ?auto_128784 ) ) ( not ( = ?auto_128780 ?auto_128785 ) ) ( not ( = ?auto_128780 ?auto_128784 ) ) ( not ( = ?auto_128783 ?auto_128785 ) ) ( not ( = ?auto_128783 ?auto_128784 ) ) ( not ( = ?auto_128785 ?auto_128784 ) ) ( not ( = ?auto_128782 ?auto_128784 ) ) ( not ( = ?auto_128778 ?auto_128782 ) ) ( not ( = ?auto_128779 ?auto_128782 ) ) ( not ( = ?auto_128780 ?auto_128782 ) ) ( not ( = ?auto_128783 ?auto_128782 ) ) ( not ( = ?auto_128785 ?auto_128782 ) ) ( ON ?auto_128782 ?auto_128781 ) ( not ( = ?auto_128778 ?auto_128781 ) ) ( not ( = ?auto_128779 ?auto_128781 ) ) ( not ( = ?auto_128780 ?auto_128781 ) ) ( not ( = ?auto_128783 ?auto_128781 ) ) ( not ( = ?auto_128785 ?auto_128781 ) ) ( not ( = ?auto_128784 ?auto_128781 ) ) ( not ( = ?auto_128782 ?auto_128781 ) ) ( ON ?auto_128784 ?auto_128782 ) ( CLEAR ?auto_128784 ) ( ON-TABLE ?auto_128781 ) ( HOLDING ?auto_128785 ) ( CLEAR ?auto_128783 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128778 ?auto_128779 ?auto_128780 ?auto_128783 ?auto_128785 )
      ( MAKE-3PILE ?auto_128778 ?auto_128779 ?auto_128780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128786 - BLOCK
      ?auto_128787 - BLOCK
      ?auto_128788 - BLOCK
    )
    :vars
    (
      ?auto_128791 - BLOCK
      ?auto_128790 - BLOCK
      ?auto_128792 - BLOCK
      ?auto_128793 - BLOCK
      ?auto_128789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_128791 ?auto_128788 ) ( ON-TABLE ?auto_128786 ) ( ON ?auto_128787 ?auto_128786 ) ( ON ?auto_128788 ?auto_128787 ) ( not ( = ?auto_128786 ?auto_128787 ) ) ( not ( = ?auto_128786 ?auto_128788 ) ) ( not ( = ?auto_128786 ?auto_128791 ) ) ( not ( = ?auto_128787 ?auto_128788 ) ) ( not ( = ?auto_128787 ?auto_128791 ) ) ( not ( = ?auto_128788 ?auto_128791 ) ) ( not ( = ?auto_128786 ?auto_128790 ) ) ( not ( = ?auto_128786 ?auto_128792 ) ) ( not ( = ?auto_128787 ?auto_128790 ) ) ( not ( = ?auto_128787 ?auto_128792 ) ) ( not ( = ?auto_128788 ?auto_128790 ) ) ( not ( = ?auto_128788 ?auto_128792 ) ) ( not ( = ?auto_128791 ?auto_128790 ) ) ( not ( = ?auto_128791 ?auto_128792 ) ) ( not ( = ?auto_128790 ?auto_128792 ) ) ( not ( = ?auto_128793 ?auto_128792 ) ) ( not ( = ?auto_128786 ?auto_128793 ) ) ( not ( = ?auto_128787 ?auto_128793 ) ) ( not ( = ?auto_128788 ?auto_128793 ) ) ( not ( = ?auto_128791 ?auto_128793 ) ) ( not ( = ?auto_128790 ?auto_128793 ) ) ( ON ?auto_128793 ?auto_128789 ) ( not ( = ?auto_128786 ?auto_128789 ) ) ( not ( = ?auto_128787 ?auto_128789 ) ) ( not ( = ?auto_128788 ?auto_128789 ) ) ( not ( = ?auto_128791 ?auto_128789 ) ) ( not ( = ?auto_128790 ?auto_128789 ) ) ( not ( = ?auto_128792 ?auto_128789 ) ) ( not ( = ?auto_128793 ?auto_128789 ) ) ( ON ?auto_128792 ?auto_128793 ) ( ON-TABLE ?auto_128789 ) ( CLEAR ?auto_128791 ) ( ON ?auto_128790 ?auto_128792 ) ( CLEAR ?auto_128790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128789 ?auto_128793 ?auto_128792 )
      ( MAKE-3PILE ?auto_128786 ?auto_128787 ?auto_128788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128810 - BLOCK
      ?auto_128811 - BLOCK
      ?auto_128812 - BLOCK
    )
    :vars
    (
      ?auto_128817 - BLOCK
      ?auto_128815 - BLOCK
      ?auto_128814 - BLOCK
      ?auto_128816 - BLOCK
      ?auto_128813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128810 ) ( ON ?auto_128811 ?auto_128810 ) ( not ( = ?auto_128810 ?auto_128811 ) ) ( not ( = ?auto_128810 ?auto_128812 ) ) ( not ( = ?auto_128810 ?auto_128817 ) ) ( not ( = ?auto_128811 ?auto_128812 ) ) ( not ( = ?auto_128811 ?auto_128817 ) ) ( not ( = ?auto_128812 ?auto_128817 ) ) ( not ( = ?auto_128810 ?auto_128815 ) ) ( not ( = ?auto_128810 ?auto_128814 ) ) ( not ( = ?auto_128811 ?auto_128815 ) ) ( not ( = ?auto_128811 ?auto_128814 ) ) ( not ( = ?auto_128812 ?auto_128815 ) ) ( not ( = ?auto_128812 ?auto_128814 ) ) ( not ( = ?auto_128817 ?auto_128815 ) ) ( not ( = ?auto_128817 ?auto_128814 ) ) ( not ( = ?auto_128815 ?auto_128814 ) ) ( not ( = ?auto_128816 ?auto_128814 ) ) ( not ( = ?auto_128810 ?auto_128816 ) ) ( not ( = ?auto_128811 ?auto_128816 ) ) ( not ( = ?auto_128812 ?auto_128816 ) ) ( not ( = ?auto_128817 ?auto_128816 ) ) ( not ( = ?auto_128815 ?auto_128816 ) ) ( ON ?auto_128816 ?auto_128813 ) ( not ( = ?auto_128810 ?auto_128813 ) ) ( not ( = ?auto_128811 ?auto_128813 ) ) ( not ( = ?auto_128812 ?auto_128813 ) ) ( not ( = ?auto_128817 ?auto_128813 ) ) ( not ( = ?auto_128815 ?auto_128813 ) ) ( not ( = ?auto_128814 ?auto_128813 ) ) ( not ( = ?auto_128816 ?auto_128813 ) ) ( ON ?auto_128814 ?auto_128816 ) ( ON-TABLE ?auto_128813 ) ( ON ?auto_128815 ?auto_128814 ) ( ON ?auto_128817 ?auto_128815 ) ( CLEAR ?auto_128817 ) ( HOLDING ?auto_128812 ) ( CLEAR ?auto_128811 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128810 ?auto_128811 ?auto_128812 ?auto_128817 )
      ( MAKE-3PILE ?auto_128810 ?auto_128811 ?auto_128812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128818 - BLOCK
      ?auto_128819 - BLOCK
      ?auto_128820 - BLOCK
    )
    :vars
    (
      ?auto_128824 - BLOCK
      ?auto_128825 - BLOCK
      ?auto_128823 - BLOCK
      ?auto_128822 - BLOCK
      ?auto_128821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128818 ) ( ON ?auto_128819 ?auto_128818 ) ( not ( = ?auto_128818 ?auto_128819 ) ) ( not ( = ?auto_128818 ?auto_128820 ) ) ( not ( = ?auto_128818 ?auto_128824 ) ) ( not ( = ?auto_128819 ?auto_128820 ) ) ( not ( = ?auto_128819 ?auto_128824 ) ) ( not ( = ?auto_128820 ?auto_128824 ) ) ( not ( = ?auto_128818 ?auto_128825 ) ) ( not ( = ?auto_128818 ?auto_128823 ) ) ( not ( = ?auto_128819 ?auto_128825 ) ) ( not ( = ?auto_128819 ?auto_128823 ) ) ( not ( = ?auto_128820 ?auto_128825 ) ) ( not ( = ?auto_128820 ?auto_128823 ) ) ( not ( = ?auto_128824 ?auto_128825 ) ) ( not ( = ?auto_128824 ?auto_128823 ) ) ( not ( = ?auto_128825 ?auto_128823 ) ) ( not ( = ?auto_128822 ?auto_128823 ) ) ( not ( = ?auto_128818 ?auto_128822 ) ) ( not ( = ?auto_128819 ?auto_128822 ) ) ( not ( = ?auto_128820 ?auto_128822 ) ) ( not ( = ?auto_128824 ?auto_128822 ) ) ( not ( = ?auto_128825 ?auto_128822 ) ) ( ON ?auto_128822 ?auto_128821 ) ( not ( = ?auto_128818 ?auto_128821 ) ) ( not ( = ?auto_128819 ?auto_128821 ) ) ( not ( = ?auto_128820 ?auto_128821 ) ) ( not ( = ?auto_128824 ?auto_128821 ) ) ( not ( = ?auto_128825 ?auto_128821 ) ) ( not ( = ?auto_128823 ?auto_128821 ) ) ( not ( = ?auto_128822 ?auto_128821 ) ) ( ON ?auto_128823 ?auto_128822 ) ( ON-TABLE ?auto_128821 ) ( ON ?auto_128825 ?auto_128823 ) ( ON ?auto_128824 ?auto_128825 ) ( CLEAR ?auto_128819 ) ( ON ?auto_128820 ?auto_128824 ) ( CLEAR ?auto_128820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128821 ?auto_128822 ?auto_128823 ?auto_128825 ?auto_128824 )
      ( MAKE-3PILE ?auto_128818 ?auto_128819 ?auto_128820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128826 - BLOCK
      ?auto_128827 - BLOCK
      ?auto_128828 - BLOCK
    )
    :vars
    (
      ?auto_128831 - BLOCK
      ?auto_128832 - BLOCK
      ?auto_128830 - BLOCK
      ?auto_128829 - BLOCK
      ?auto_128833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128826 ) ( not ( = ?auto_128826 ?auto_128827 ) ) ( not ( = ?auto_128826 ?auto_128828 ) ) ( not ( = ?auto_128826 ?auto_128831 ) ) ( not ( = ?auto_128827 ?auto_128828 ) ) ( not ( = ?auto_128827 ?auto_128831 ) ) ( not ( = ?auto_128828 ?auto_128831 ) ) ( not ( = ?auto_128826 ?auto_128832 ) ) ( not ( = ?auto_128826 ?auto_128830 ) ) ( not ( = ?auto_128827 ?auto_128832 ) ) ( not ( = ?auto_128827 ?auto_128830 ) ) ( not ( = ?auto_128828 ?auto_128832 ) ) ( not ( = ?auto_128828 ?auto_128830 ) ) ( not ( = ?auto_128831 ?auto_128832 ) ) ( not ( = ?auto_128831 ?auto_128830 ) ) ( not ( = ?auto_128832 ?auto_128830 ) ) ( not ( = ?auto_128829 ?auto_128830 ) ) ( not ( = ?auto_128826 ?auto_128829 ) ) ( not ( = ?auto_128827 ?auto_128829 ) ) ( not ( = ?auto_128828 ?auto_128829 ) ) ( not ( = ?auto_128831 ?auto_128829 ) ) ( not ( = ?auto_128832 ?auto_128829 ) ) ( ON ?auto_128829 ?auto_128833 ) ( not ( = ?auto_128826 ?auto_128833 ) ) ( not ( = ?auto_128827 ?auto_128833 ) ) ( not ( = ?auto_128828 ?auto_128833 ) ) ( not ( = ?auto_128831 ?auto_128833 ) ) ( not ( = ?auto_128832 ?auto_128833 ) ) ( not ( = ?auto_128830 ?auto_128833 ) ) ( not ( = ?auto_128829 ?auto_128833 ) ) ( ON ?auto_128830 ?auto_128829 ) ( ON-TABLE ?auto_128833 ) ( ON ?auto_128832 ?auto_128830 ) ( ON ?auto_128831 ?auto_128832 ) ( ON ?auto_128828 ?auto_128831 ) ( CLEAR ?auto_128828 ) ( HOLDING ?auto_128827 ) ( CLEAR ?auto_128826 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128826 ?auto_128827 )
      ( MAKE-3PILE ?auto_128826 ?auto_128827 ?auto_128828 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128834 - BLOCK
      ?auto_128835 - BLOCK
      ?auto_128836 - BLOCK
    )
    :vars
    (
      ?auto_128838 - BLOCK
      ?auto_128837 - BLOCK
      ?auto_128839 - BLOCK
      ?auto_128840 - BLOCK
      ?auto_128841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128834 ) ( not ( = ?auto_128834 ?auto_128835 ) ) ( not ( = ?auto_128834 ?auto_128836 ) ) ( not ( = ?auto_128834 ?auto_128838 ) ) ( not ( = ?auto_128835 ?auto_128836 ) ) ( not ( = ?auto_128835 ?auto_128838 ) ) ( not ( = ?auto_128836 ?auto_128838 ) ) ( not ( = ?auto_128834 ?auto_128837 ) ) ( not ( = ?auto_128834 ?auto_128839 ) ) ( not ( = ?auto_128835 ?auto_128837 ) ) ( not ( = ?auto_128835 ?auto_128839 ) ) ( not ( = ?auto_128836 ?auto_128837 ) ) ( not ( = ?auto_128836 ?auto_128839 ) ) ( not ( = ?auto_128838 ?auto_128837 ) ) ( not ( = ?auto_128838 ?auto_128839 ) ) ( not ( = ?auto_128837 ?auto_128839 ) ) ( not ( = ?auto_128840 ?auto_128839 ) ) ( not ( = ?auto_128834 ?auto_128840 ) ) ( not ( = ?auto_128835 ?auto_128840 ) ) ( not ( = ?auto_128836 ?auto_128840 ) ) ( not ( = ?auto_128838 ?auto_128840 ) ) ( not ( = ?auto_128837 ?auto_128840 ) ) ( ON ?auto_128840 ?auto_128841 ) ( not ( = ?auto_128834 ?auto_128841 ) ) ( not ( = ?auto_128835 ?auto_128841 ) ) ( not ( = ?auto_128836 ?auto_128841 ) ) ( not ( = ?auto_128838 ?auto_128841 ) ) ( not ( = ?auto_128837 ?auto_128841 ) ) ( not ( = ?auto_128839 ?auto_128841 ) ) ( not ( = ?auto_128840 ?auto_128841 ) ) ( ON ?auto_128839 ?auto_128840 ) ( ON-TABLE ?auto_128841 ) ( ON ?auto_128837 ?auto_128839 ) ( ON ?auto_128838 ?auto_128837 ) ( ON ?auto_128836 ?auto_128838 ) ( CLEAR ?auto_128834 ) ( ON ?auto_128835 ?auto_128836 ) ( CLEAR ?auto_128835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128841 ?auto_128840 ?auto_128839 ?auto_128837 ?auto_128838 ?auto_128836 )
      ( MAKE-3PILE ?auto_128834 ?auto_128835 ?auto_128836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128842 - BLOCK
      ?auto_128843 - BLOCK
      ?auto_128844 - BLOCK
    )
    :vars
    (
      ?auto_128845 - BLOCK
      ?auto_128849 - BLOCK
      ?auto_128846 - BLOCK
      ?auto_128847 - BLOCK
      ?auto_128848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128842 ?auto_128843 ) ) ( not ( = ?auto_128842 ?auto_128844 ) ) ( not ( = ?auto_128842 ?auto_128845 ) ) ( not ( = ?auto_128843 ?auto_128844 ) ) ( not ( = ?auto_128843 ?auto_128845 ) ) ( not ( = ?auto_128844 ?auto_128845 ) ) ( not ( = ?auto_128842 ?auto_128849 ) ) ( not ( = ?auto_128842 ?auto_128846 ) ) ( not ( = ?auto_128843 ?auto_128849 ) ) ( not ( = ?auto_128843 ?auto_128846 ) ) ( not ( = ?auto_128844 ?auto_128849 ) ) ( not ( = ?auto_128844 ?auto_128846 ) ) ( not ( = ?auto_128845 ?auto_128849 ) ) ( not ( = ?auto_128845 ?auto_128846 ) ) ( not ( = ?auto_128849 ?auto_128846 ) ) ( not ( = ?auto_128847 ?auto_128846 ) ) ( not ( = ?auto_128842 ?auto_128847 ) ) ( not ( = ?auto_128843 ?auto_128847 ) ) ( not ( = ?auto_128844 ?auto_128847 ) ) ( not ( = ?auto_128845 ?auto_128847 ) ) ( not ( = ?auto_128849 ?auto_128847 ) ) ( ON ?auto_128847 ?auto_128848 ) ( not ( = ?auto_128842 ?auto_128848 ) ) ( not ( = ?auto_128843 ?auto_128848 ) ) ( not ( = ?auto_128844 ?auto_128848 ) ) ( not ( = ?auto_128845 ?auto_128848 ) ) ( not ( = ?auto_128849 ?auto_128848 ) ) ( not ( = ?auto_128846 ?auto_128848 ) ) ( not ( = ?auto_128847 ?auto_128848 ) ) ( ON ?auto_128846 ?auto_128847 ) ( ON-TABLE ?auto_128848 ) ( ON ?auto_128849 ?auto_128846 ) ( ON ?auto_128845 ?auto_128849 ) ( ON ?auto_128844 ?auto_128845 ) ( ON ?auto_128843 ?auto_128844 ) ( CLEAR ?auto_128843 ) ( HOLDING ?auto_128842 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128842 )
      ( MAKE-3PILE ?auto_128842 ?auto_128843 ?auto_128844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_128850 - BLOCK
      ?auto_128851 - BLOCK
      ?auto_128852 - BLOCK
    )
    :vars
    (
      ?auto_128854 - BLOCK
      ?auto_128855 - BLOCK
      ?auto_128853 - BLOCK
      ?auto_128857 - BLOCK
      ?auto_128856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128850 ?auto_128851 ) ) ( not ( = ?auto_128850 ?auto_128852 ) ) ( not ( = ?auto_128850 ?auto_128854 ) ) ( not ( = ?auto_128851 ?auto_128852 ) ) ( not ( = ?auto_128851 ?auto_128854 ) ) ( not ( = ?auto_128852 ?auto_128854 ) ) ( not ( = ?auto_128850 ?auto_128855 ) ) ( not ( = ?auto_128850 ?auto_128853 ) ) ( not ( = ?auto_128851 ?auto_128855 ) ) ( not ( = ?auto_128851 ?auto_128853 ) ) ( not ( = ?auto_128852 ?auto_128855 ) ) ( not ( = ?auto_128852 ?auto_128853 ) ) ( not ( = ?auto_128854 ?auto_128855 ) ) ( not ( = ?auto_128854 ?auto_128853 ) ) ( not ( = ?auto_128855 ?auto_128853 ) ) ( not ( = ?auto_128857 ?auto_128853 ) ) ( not ( = ?auto_128850 ?auto_128857 ) ) ( not ( = ?auto_128851 ?auto_128857 ) ) ( not ( = ?auto_128852 ?auto_128857 ) ) ( not ( = ?auto_128854 ?auto_128857 ) ) ( not ( = ?auto_128855 ?auto_128857 ) ) ( ON ?auto_128857 ?auto_128856 ) ( not ( = ?auto_128850 ?auto_128856 ) ) ( not ( = ?auto_128851 ?auto_128856 ) ) ( not ( = ?auto_128852 ?auto_128856 ) ) ( not ( = ?auto_128854 ?auto_128856 ) ) ( not ( = ?auto_128855 ?auto_128856 ) ) ( not ( = ?auto_128853 ?auto_128856 ) ) ( not ( = ?auto_128857 ?auto_128856 ) ) ( ON ?auto_128853 ?auto_128857 ) ( ON-TABLE ?auto_128856 ) ( ON ?auto_128855 ?auto_128853 ) ( ON ?auto_128854 ?auto_128855 ) ( ON ?auto_128852 ?auto_128854 ) ( ON ?auto_128851 ?auto_128852 ) ( ON ?auto_128850 ?auto_128851 ) ( CLEAR ?auto_128850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128856 ?auto_128857 ?auto_128853 ?auto_128855 ?auto_128854 ?auto_128852 ?auto_128851 )
      ( MAKE-3PILE ?auto_128850 ?auto_128851 ?auto_128852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128862 - BLOCK
      ?auto_128863 - BLOCK
      ?auto_128864 - BLOCK
      ?auto_128865 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_128865 ) ( CLEAR ?auto_128864 ) ( ON-TABLE ?auto_128862 ) ( ON ?auto_128863 ?auto_128862 ) ( ON ?auto_128864 ?auto_128863 ) ( not ( = ?auto_128862 ?auto_128863 ) ) ( not ( = ?auto_128862 ?auto_128864 ) ) ( not ( = ?auto_128862 ?auto_128865 ) ) ( not ( = ?auto_128863 ?auto_128864 ) ) ( not ( = ?auto_128863 ?auto_128865 ) ) ( not ( = ?auto_128864 ?auto_128865 ) ) )
    :subtasks
    ( ( !STACK ?auto_128865 ?auto_128864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128866 - BLOCK
      ?auto_128867 - BLOCK
      ?auto_128868 - BLOCK
      ?auto_128869 - BLOCK
    )
    :vars
    (
      ?auto_128870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_128868 ) ( ON-TABLE ?auto_128866 ) ( ON ?auto_128867 ?auto_128866 ) ( ON ?auto_128868 ?auto_128867 ) ( not ( = ?auto_128866 ?auto_128867 ) ) ( not ( = ?auto_128866 ?auto_128868 ) ) ( not ( = ?auto_128866 ?auto_128869 ) ) ( not ( = ?auto_128867 ?auto_128868 ) ) ( not ( = ?auto_128867 ?auto_128869 ) ) ( not ( = ?auto_128868 ?auto_128869 ) ) ( ON ?auto_128869 ?auto_128870 ) ( CLEAR ?auto_128869 ) ( HAND-EMPTY ) ( not ( = ?auto_128866 ?auto_128870 ) ) ( not ( = ?auto_128867 ?auto_128870 ) ) ( not ( = ?auto_128868 ?auto_128870 ) ) ( not ( = ?auto_128869 ?auto_128870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128869 ?auto_128870 )
      ( MAKE-4PILE ?auto_128866 ?auto_128867 ?auto_128868 ?auto_128869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128871 - BLOCK
      ?auto_128872 - BLOCK
      ?auto_128873 - BLOCK
      ?auto_128874 - BLOCK
    )
    :vars
    (
      ?auto_128875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128871 ) ( ON ?auto_128872 ?auto_128871 ) ( not ( = ?auto_128871 ?auto_128872 ) ) ( not ( = ?auto_128871 ?auto_128873 ) ) ( not ( = ?auto_128871 ?auto_128874 ) ) ( not ( = ?auto_128872 ?auto_128873 ) ) ( not ( = ?auto_128872 ?auto_128874 ) ) ( not ( = ?auto_128873 ?auto_128874 ) ) ( ON ?auto_128874 ?auto_128875 ) ( CLEAR ?auto_128874 ) ( not ( = ?auto_128871 ?auto_128875 ) ) ( not ( = ?auto_128872 ?auto_128875 ) ) ( not ( = ?auto_128873 ?auto_128875 ) ) ( not ( = ?auto_128874 ?auto_128875 ) ) ( HOLDING ?auto_128873 ) ( CLEAR ?auto_128872 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128871 ?auto_128872 ?auto_128873 )
      ( MAKE-4PILE ?auto_128871 ?auto_128872 ?auto_128873 ?auto_128874 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128876 - BLOCK
      ?auto_128877 - BLOCK
      ?auto_128878 - BLOCK
      ?auto_128879 - BLOCK
    )
    :vars
    (
      ?auto_128880 - BLOCK
      ?auto_128881 - BLOCK
      ?auto_128882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128876 ) ( ON ?auto_128877 ?auto_128876 ) ( not ( = ?auto_128876 ?auto_128877 ) ) ( not ( = ?auto_128876 ?auto_128878 ) ) ( not ( = ?auto_128876 ?auto_128879 ) ) ( not ( = ?auto_128877 ?auto_128878 ) ) ( not ( = ?auto_128877 ?auto_128879 ) ) ( not ( = ?auto_128878 ?auto_128879 ) ) ( ON ?auto_128879 ?auto_128880 ) ( not ( = ?auto_128876 ?auto_128880 ) ) ( not ( = ?auto_128877 ?auto_128880 ) ) ( not ( = ?auto_128878 ?auto_128880 ) ) ( not ( = ?auto_128879 ?auto_128880 ) ) ( CLEAR ?auto_128877 ) ( ON ?auto_128878 ?auto_128879 ) ( CLEAR ?auto_128878 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128881 ) ( ON ?auto_128882 ?auto_128881 ) ( ON ?auto_128880 ?auto_128882 ) ( not ( = ?auto_128881 ?auto_128882 ) ) ( not ( = ?auto_128881 ?auto_128880 ) ) ( not ( = ?auto_128881 ?auto_128879 ) ) ( not ( = ?auto_128881 ?auto_128878 ) ) ( not ( = ?auto_128882 ?auto_128880 ) ) ( not ( = ?auto_128882 ?auto_128879 ) ) ( not ( = ?auto_128882 ?auto_128878 ) ) ( not ( = ?auto_128876 ?auto_128881 ) ) ( not ( = ?auto_128876 ?auto_128882 ) ) ( not ( = ?auto_128877 ?auto_128881 ) ) ( not ( = ?auto_128877 ?auto_128882 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128881 ?auto_128882 ?auto_128880 ?auto_128879 )
      ( MAKE-4PILE ?auto_128876 ?auto_128877 ?auto_128878 ?auto_128879 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128883 - BLOCK
      ?auto_128884 - BLOCK
      ?auto_128885 - BLOCK
      ?auto_128886 - BLOCK
    )
    :vars
    (
      ?auto_128889 - BLOCK
      ?auto_128888 - BLOCK
      ?auto_128887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128883 ) ( not ( = ?auto_128883 ?auto_128884 ) ) ( not ( = ?auto_128883 ?auto_128885 ) ) ( not ( = ?auto_128883 ?auto_128886 ) ) ( not ( = ?auto_128884 ?auto_128885 ) ) ( not ( = ?auto_128884 ?auto_128886 ) ) ( not ( = ?auto_128885 ?auto_128886 ) ) ( ON ?auto_128886 ?auto_128889 ) ( not ( = ?auto_128883 ?auto_128889 ) ) ( not ( = ?auto_128884 ?auto_128889 ) ) ( not ( = ?auto_128885 ?auto_128889 ) ) ( not ( = ?auto_128886 ?auto_128889 ) ) ( ON ?auto_128885 ?auto_128886 ) ( CLEAR ?auto_128885 ) ( ON-TABLE ?auto_128888 ) ( ON ?auto_128887 ?auto_128888 ) ( ON ?auto_128889 ?auto_128887 ) ( not ( = ?auto_128888 ?auto_128887 ) ) ( not ( = ?auto_128888 ?auto_128889 ) ) ( not ( = ?auto_128888 ?auto_128886 ) ) ( not ( = ?auto_128888 ?auto_128885 ) ) ( not ( = ?auto_128887 ?auto_128889 ) ) ( not ( = ?auto_128887 ?auto_128886 ) ) ( not ( = ?auto_128887 ?auto_128885 ) ) ( not ( = ?auto_128883 ?auto_128888 ) ) ( not ( = ?auto_128883 ?auto_128887 ) ) ( not ( = ?auto_128884 ?auto_128888 ) ) ( not ( = ?auto_128884 ?auto_128887 ) ) ( HOLDING ?auto_128884 ) ( CLEAR ?auto_128883 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128883 ?auto_128884 )
      ( MAKE-4PILE ?auto_128883 ?auto_128884 ?auto_128885 ?auto_128886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128890 - BLOCK
      ?auto_128891 - BLOCK
      ?auto_128892 - BLOCK
      ?auto_128893 - BLOCK
    )
    :vars
    (
      ?auto_128896 - BLOCK
      ?auto_128894 - BLOCK
      ?auto_128895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_128890 ) ( not ( = ?auto_128890 ?auto_128891 ) ) ( not ( = ?auto_128890 ?auto_128892 ) ) ( not ( = ?auto_128890 ?auto_128893 ) ) ( not ( = ?auto_128891 ?auto_128892 ) ) ( not ( = ?auto_128891 ?auto_128893 ) ) ( not ( = ?auto_128892 ?auto_128893 ) ) ( ON ?auto_128893 ?auto_128896 ) ( not ( = ?auto_128890 ?auto_128896 ) ) ( not ( = ?auto_128891 ?auto_128896 ) ) ( not ( = ?auto_128892 ?auto_128896 ) ) ( not ( = ?auto_128893 ?auto_128896 ) ) ( ON ?auto_128892 ?auto_128893 ) ( ON-TABLE ?auto_128894 ) ( ON ?auto_128895 ?auto_128894 ) ( ON ?auto_128896 ?auto_128895 ) ( not ( = ?auto_128894 ?auto_128895 ) ) ( not ( = ?auto_128894 ?auto_128896 ) ) ( not ( = ?auto_128894 ?auto_128893 ) ) ( not ( = ?auto_128894 ?auto_128892 ) ) ( not ( = ?auto_128895 ?auto_128896 ) ) ( not ( = ?auto_128895 ?auto_128893 ) ) ( not ( = ?auto_128895 ?auto_128892 ) ) ( not ( = ?auto_128890 ?auto_128894 ) ) ( not ( = ?auto_128890 ?auto_128895 ) ) ( not ( = ?auto_128891 ?auto_128894 ) ) ( not ( = ?auto_128891 ?auto_128895 ) ) ( CLEAR ?auto_128890 ) ( ON ?auto_128891 ?auto_128892 ) ( CLEAR ?auto_128891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128894 ?auto_128895 ?auto_128896 ?auto_128893 ?auto_128892 )
      ( MAKE-4PILE ?auto_128890 ?auto_128891 ?auto_128892 ?auto_128893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128897 - BLOCK
      ?auto_128898 - BLOCK
      ?auto_128899 - BLOCK
      ?auto_128900 - BLOCK
    )
    :vars
    (
      ?auto_128901 - BLOCK
      ?auto_128902 - BLOCK
      ?auto_128903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128897 ?auto_128898 ) ) ( not ( = ?auto_128897 ?auto_128899 ) ) ( not ( = ?auto_128897 ?auto_128900 ) ) ( not ( = ?auto_128898 ?auto_128899 ) ) ( not ( = ?auto_128898 ?auto_128900 ) ) ( not ( = ?auto_128899 ?auto_128900 ) ) ( ON ?auto_128900 ?auto_128901 ) ( not ( = ?auto_128897 ?auto_128901 ) ) ( not ( = ?auto_128898 ?auto_128901 ) ) ( not ( = ?auto_128899 ?auto_128901 ) ) ( not ( = ?auto_128900 ?auto_128901 ) ) ( ON ?auto_128899 ?auto_128900 ) ( ON-TABLE ?auto_128902 ) ( ON ?auto_128903 ?auto_128902 ) ( ON ?auto_128901 ?auto_128903 ) ( not ( = ?auto_128902 ?auto_128903 ) ) ( not ( = ?auto_128902 ?auto_128901 ) ) ( not ( = ?auto_128902 ?auto_128900 ) ) ( not ( = ?auto_128902 ?auto_128899 ) ) ( not ( = ?auto_128903 ?auto_128901 ) ) ( not ( = ?auto_128903 ?auto_128900 ) ) ( not ( = ?auto_128903 ?auto_128899 ) ) ( not ( = ?auto_128897 ?auto_128902 ) ) ( not ( = ?auto_128897 ?auto_128903 ) ) ( not ( = ?auto_128898 ?auto_128902 ) ) ( not ( = ?auto_128898 ?auto_128903 ) ) ( ON ?auto_128898 ?auto_128899 ) ( CLEAR ?auto_128898 ) ( HOLDING ?auto_128897 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_128897 )
      ( MAKE-4PILE ?auto_128897 ?auto_128898 ?auto_128899 ?auto_128900 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128904 - BLOCK
      ?auto_128905 - BLOCK
      ?auto_128906 - BLOCK
      ?auto_128907 - BLOCK
    )
    :vars
    (
      ?auto_128910 - BLOCK
      ?auto_128909 - BLOCK
      ?auto_128908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128904 ?auto_128905 ) ) ( not ( = ?auto_128904 ?auto_128906 ) ) ( not ( = ?auto_128904 ?auto_128907 ) ) ( not ( = ?auto_128905 ?auto_128906 ) ) ( not ( = ?auto_128905 ?auto_128907 ) ) ( not ( = ?auto_128906 ?auto_128907 ) ) ( ON ?auto_128907 ?auto_128910 ) ( not ( = ?auto_128904 ?auto_128910 ) ) ( not ( = ?auto_128905 ?auto_128910 ) ) ( not ( = ?auto_128906 ?auto_128910 ) ) ( not ( = ?auto_128907 ?auto_128910 ) ) ( ON ?auto_128906 ?auto_128907 ) ( ON-TABLE ?auto_128909 ) ( ON ?auto_128908 ?auto_128909 ) ( ON ?auto_128910 ?auto_128908 ) ( not ( = ?auto_128909 ?auto_128908 ) ) ( not ( = ?auto_128909 ?auto_128910 ) ) ( not ( = ?auto_128909 ?auto_128907 ) ) ( not ( = ?auto_128909 ?auto_128906 ) ) ( not ( = ?auto_128908 ?auto_128910 ) ) ( not ( = ?auto_128908 ?auto_128907 ) ) ( not ( = ?auto_128908 ?auto_128906 ) ) ( not ( = ?auto_128904 ?auto_128909 ) ) ( not ( = ?auto_128904 ?auto_128908 ) ) ( not ( = ?auto_128905 ?auto_128909 ) ) ( not ( = ?auto_128905 ?auto_128908 ) ) ( ON ?auto_128905 ?auto_128906 ) ( ON ?auto_128904 ?auto_128905 ) ( CLEAR ?auto_128904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128909 ?auto_128908 ?auto_128910 ?auto_128907 ?auto_128906 ?auto_128905 )
      ( MAKE-4PILE ?auto_128904 ?auto_128905 ?auto_128906 ?auto_128907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128911 - BLOCK
      ?auto_128912 - BLOCK
      ?auto_128913 - BLOCK
      ?auto_128914 - BLOCK
    )
    :vars
    (
      ?auto_128917 - BLOCK
      ?auto_128916 - BLOCK
      ?auto_128915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128911 ?auto_128912 ) ) ( not ( = ?auto_128911 ?auto_128913 ) ) ( not ( = ?auto_128911 ?auto_128914 ) ) ( not ( = ?auto_128912 ?auto_128913 ) ) ( not ( = ?auto_128912 ?auto_128914 ) ) ( not ( = ?auto_128913 ?auto_128914 ) ) ( ON ?auto_128914 ?auto_128917 ) ( not ( = ?auto_128911 ?auto_128917 ) ) ( not ( = ?auto_128912 ?auto_128917 ) ) ( not ( = ?auto_128913 ?auto_128917 ) ) ( not ( = ?auto_128914 ?auto_128917 ) ) ( ON ?auto_128913 ?auto_128914 ) ( ON-TABLE ?auto_128916 ) ( ON ?auto_128915 ?auto_128916 ) ( ON ?auto_128917 ?auto_128915 ) ( not ( = ?auto_128916 ?auto_128915 ) ) ( not ( = ?auto_128916 ?auto_128917 ) ) ( not ( = ?auto_128916 ?auto_128914 ) ) ( not ( = ?auto_128916 ?auto_128913 ) ) ( not ( = ?auto_128915 ?auto_128917 ) ) ( not ( = ?auto_128915 ?auto_128914 ) ) ( not ( = ?auto_128915 ?auto_128913 ) ) ( not ( = ?auto_128911 ?auto_128916 ) ) ( not ( = ?auto_128911 ?auto_128915 ) ) ( not ( = ?auto_128912 ?auto_128916 ) ) ( not ( = ?auto_128912 ?auto_128915 ) ) ( ON ?auto_128912 ?auto_128913 ) ( HOLDING ?auto_128911 ) ( CLEAR ?auto_128912 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_128916 ?auto_128915 ?auto_128917 ?auto_128914 ?auto_128913 ?auto_128912 ?auto_128911 )
      ( MAKE-4PILE ?auto_128911 ?auto_128912 ?auto_128913 ?auto_128914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128918 - BLOCK
      ?auto_128919 - BLOCK
      ?auto_128920 - BLOCK
      ?auto_128921 - BLOCK
    )
    :vars
    (
      ?auto_128922 - BLOCK
      ?auto_128924 - BLOCK
      ?auto_128923 - BLOCK
      ?auto_128925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128918 ?auto_128919 ) ) ( not ( = ?auto_128918 ?auto_128920 ) ) ( not ( = ?auto_128918 ?auto_128921 ) ) ( not ( = ?auto_128919 ?auto_128920 ) ) ( not ( = ?auto_128919 ?auto_128921 ) ) ( not ( = ?auto_128920 ?auto_128921 ) ) ( ON ?auto_128921 ?auto_128922 ) ( not ( = ?auto_128918 ?auto_128922 ) ) ( not ( = ?auto_128919 ?auto_128922 ) ) ( not ( = ?auto_128920 ?auto_128922 ) ) ( not ( = ?auto_128921 ?auto_128922 ) ) ( ON ?auto_128920 ?auto_128921 ) ( ON-TABLE ?auto_128924 ) ( ON ?auto_128923 ?auto_128924 ) ( ON ?auto_128922 ?auto_128923 ) ( not ( = ?auto_128924 ?auto_128923 ) ) ( not ( = ?auto_128924 ?auto_128922 ) ) ( not ( = ?auto_128924 ?auto_128921 ) ) ( not ( = ?auto_128924 ?auto_128920 ) ) ( not ( = ?auto_128923 ?auto_128922 ) ) ( not ( = ?auto_128923 ?auto_128921 ) ) ( not ( = ?auto_128923 ?auto_128920 ) ) ( not ( = ?auto_128918 ?auto_128924 ) ) ( not ( = ?auto_128918 ?auto_128923 ) ) ( not ( = ?auto_128919 ?auto_128924 ) ) ( not ( = ?auto_128919 ?auto_128923 ) ) ( ON ?auto_128919 ?auto_128920 ) ( CLEAR ?auto_128919 ) ( ON ?auto_128918 ?auto_128925 ) ( CLEAR ?auto_128918 ) ( HAND-EMPTY ) ( not ( = ?auto_128918 ?auto_128925 ) ) ( not ( = ?auto_128919 ?auto_128925 ) ) ( not ( = ?auto_128920 ?auto_128925 ) ) ( not ( = ?auto_128921 ?auto_128925 ) ) ( not ( = ?auto_128922 ?auto_128925 ) ) ( not ( = ?auto_128924 ?auto_128925 ) ) ( not ( = ?auto_128923 ?auto_128925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_128918 ?auto_128925 )
      ( MAKE-4PILE ?auto_128918 ?auto_128919 ?auto_128920 ?auto_128921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128926 - BLOCK
      ?auto_128927 - BLOCK
      ?auto_128928 - BLOCK
      ?auto_128929 - BLOCK
    )
    :vars
    (
      ?auto_128932 - BLOCK
      ?auto_128933 - BLOCK
      ?auto_128931 - BLOCK
      ?auto_128930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128926 ?auto_128927 ) ) ( not ( = ?auto_128926 ?auto_128928 ) ) ( not ( = ?auto_128926 ?auto_128929 ) ) ( not ( = ?auto_128927 ?auto_128928 ) ) ( not ( = ?auto_128927 ?auto_128929 ) ) ( not ( = ?auto_128928 ?auto_128929 ) ) ( ON ?auto_128929 ?auto_128932 ) ( not ( = ?auto_128926 ?auto_128932 ) ) ( not ( = ?auto_128927 ?auto_128932 ) ) ( not ( = ?auto_128928 ?auto_128932 ) ) ( not ( = ?auto_128929 ?auto_128932 ) ) ( ON ?auto_128928 ?auto_128929 ) ( ON-TABLE ?auto_128933 ) ( ON ?auto_128931 ?auto_128933 ) ( ON ?auto_128932 ?auto_128931 ) ( not ( = ?auto_128933 ?auto_128931 ) ) ( not ( = ?auto_128933 ?auto_128932 ) ) ( not ( = ?auto_128933 ?auto_128929 ) ) ( not ( = ?auto_128933 ?auto_128928 ) ) ( not ( = ?auto_128931 ?auto_128932 ) ) ( not ( = ?auto_128931 ?auto_128929 ) ) ( not ( = ?auto_128931 ?auto_128928 ) ) ( not ( = ?auto_128926 ?auto_128933 ) ) ( not ( = ?auto_128926 ?auto_128931 ) ) ( not ( = ?auto_128927 ?auto_128933 ) ) ( not ( = ?auto_128927 ?auto_128931 ) ) ( ON ?auto_128926 ?auto_128930 ) ( CLEAR ?auto_128926 ) ( not ( = ?auto_128926 ?auto_128930 ) ) ( not ( = ?auto_128927 ?auto_128930 ) ) ( not ( = ?auto_128928 ?auto_128930 ) ) ( not ( = ?auto_128929 ?auto_128930 ) ) ( not ( = ?auto_128932 ?auto_128930 ) ) ( not ( = ?auto_128933 ?auto_128930 ) ) ( not ( = ?auto_128931 ?auto_128930 ) ) ( HOLDING ?auto_128927 ) ( CLEAR ?auto_128928 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_128933 ?auto_128931 ?auto_128932 ?auto_128929 ?auto_128928 ?auto_128927 )
      ( MAKE-4PILE ?auto_128926 ?auto_128927 ?auto_128928 ?auto_128929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128934 - BLOCK
      ?auto_128935 - BLOCK
      ?auto_128936 - BLOCK
      ?auto_128937 - BLOCK
    )
    :vars
    (
      ?auto_128941 - BLOCK
      ?auto_128938 - BLOCK
      ?auto_128939 - BLOCK
      ?auto_128940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128934 ?auto_128935 ) ) ( not ( = ?auto_128934 ?auto_128936 ) ) ( not ( = ?auto_128934 ?auto_128937 ) ) ( not ( = ?auto_128935 ?auto_128936 ) ) ( not ( = ?auto_128935 ?auto_128937 ) ) ( not ( = ?auto_128936 ?auto_128937 ) ) ( ON ?auto_128937 ?auto_128941 ) ( not ( = ?auto_128934 ?auto_128941 ) ) ( not ( = ?auto_128935 ?auto_128941 ) ) ( not ( = ?auto_128936 ?auto_128941 ) ) ( not ( = ?auto_128937 ?auto_128941 ) ) ( ON ?auto_128936 ?auto_128937 ) ( ON-TABLE ?auto_128938 ) ( ON ?auto_128939 ?auto_128938 ) ( ON ?auto_128941 ?auto_128939 ) ( not ( = ?auto_128938 ?auto_128939 ) ) ( not ( = ?auto_128938 ?auto_128941 ) ) ( not ( = ?auto_128938 ?auto_128937 ) ) ( not ( = ?auto_128938 ?auto_128936 ) ) ( not ( = ?auto_128939 ?auto_128941 ) ) ( not ( = ?auto_128939 ?auto_128937 ) ) ( not ( = ?auto_128939 ?auto_128936 ) ) ( not ( = ?auto_128934 ?auto_128938 ) ) ( not ( = ?auto_128934 ?auto_128939 ) ) ( not ( = ?auto_128935 ?auto_128938 ) ) ( not ( = ?auto_128935 ?auto_128939 ) ) ( ON ?auto_128934 ?auto_128940 ) ( not ( = ?auto_128934 ?auto_128940 ) ) ( not ( = ?auto_128935 ?auto_128940 ) ) ( not ( = ?auto_128936 ?auto_128940 ) ) ( not ( = ?auto_128937 ?auto_128940 ) ) ( not ( = ?auto_128941 ?auto_128940 ) ) ( not ( = ?auto_128938 ?auto_128940 ) ) ( not ( = ?auto_128939 ?auto_128940 ) ) ( CLEAR ?auto_128936 ) ( ON ?auto_128935 ?auto_128934 ) ( CLEAR ?auto_128935 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_128940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128940 ?auto_128934 )
      ( MAKE-4PILE ?auto_128934 ?auto_128935 ?auto_128936 ?auto_128937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128942 - BLOCK
      ?auto_128943 - BLOCK
      ?auto_128944 - BLOCK
      ?auto_128945 - BLOCK
    )
    :vars
    (
      ?auto_128948 - BLOCK
      ?auto_128949 - BLOCK
      ?auto_128947 - BLOCK
      ?auto_128946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128942 ?auto_128943 ) ) ( not ( = ?auto_128942 ?auto_128944 ) ) ( not ( = ?auto_128942 ?auto_128945 ) ) ( not ( = ?auto_128943 ?auto_128944 ) ) ( not ( = ?auto_128943 ?auto_128945 ) ) ( not ( = ?auto_128944 ?auto_128945 ) ) ( ON ?auto_128945 ?auto_128948 ) ( not ( = ?auto_128942 ?auto_128948 ) ) ( not ( = ?auto_128943 ?auto_128948 ) ) ( not ( = ?auto_128944 ?auto_128948 ) ) ( not ( = ?auto_128945 ?auto_128948 ) ) ( ON-TABLE ?auto_128949 ) ( ON ?auto_128947 ?auto_128949 ) ( ON ?auto_128948 ?auto_128947 ) ( not ( = ?auto_128949 ?auto_128947 ) ) ( not ( = ?auto_128949 ?auto_128948 ) ) ( not ( = ?auto_128949 ?auto_128945 ) ) ( not ( = ?auto_128949 ?auto_128944 ) ) ( not ( = ?auto_128947 ?auto_128948 ) ) ( not ( = ?auto_128947 ?auto_128945 ) ) ( not ( = ?auto_128947 ?auto_128944 ) ) ( not ( = ?auto_128942 ?auto_128949 ) ) ( not ( = ?auto_128942 ?auto_128947 ) ) ( not ( = ?auto_128943 ?auto_128949 ) ) ( not ( = ?auto_128943 ?auto_128947 ) ) ( ON ?auto_128942 ?auto_128946 ) ( not ( = ?auto_128942 ?auto_128946 ) ) ( not ( = ?auto_128943 ?auto_128946 ) ) ( not ( = ?auto_128944 ?auto_128946 ) ) ( not ( = ?auto_128945 ?auto_128946 ) ) ( not ( = ?auto_128948 ?auto_128946 ) ) ( not ( = ?auto_128949 ?auto_128946 ) ) ( not ( = ?auto_128947 ?auto_128946 ) ) ( ON ?auto_128943 ?auto_128942 ) ( CLEAR ?auto_128943 ) ( ON-TABLE ?auto_128946 ) ( HOLDING ?auto_128944 ) ( CLEAR ?auto_128945 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128949 ?auto_128947 ?auto_128948 ?auto_128945 ?auto_128944 )
      ( MAKE-4PILE ?auto_128942 ?auto_128943 ?auto_128944 ?auto_128945 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128950 - BLOCK
      ?auto_128951 - BLOCK
      ?auto_128952 - BLOCK
      ?auto_128953 - BLOCK
    )
    :vars
    (
      ?auto_128956 - BLOCK
      ?auto_128954 - BLOCK
      ?auto_128957 - BLOCK
      ?auto_128955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128950 ?auto_128951 ) ) ( not ( = ?auto_128950 ?auto_128952 ) ) ( not ( = ?auto_128950 ?auto_128953 ) ) ( not ( = ?auto_128951 ?auto_128952 ) ) ( not ( = ?auto_128951 ?auto_128953 ) ) ( not ( = ?auto_128952 ?auto_128953 ) ) ( ON ?auto_128953 ?auto_128956 ) ( not ( = ?auto_128950 ?auto_128956 ) ) ( not ( = ?auto_128951 ?auto_128956 ) ) ( not ( = ?auto_128952 ?auto_128956 ) ) ( not ( = ?auto_128953 ?auto_128956 ) ) ( ON-TABLE ?auto_128954 ) ( ON ?auto_128957 ?auto_128954 ) ( ON ?auto_128956 ?auto_128957 ) ( not ( = ?auto_128954 ?auto_128957 ) ) ( not ( = ?auto_128954 ?auto_128956 ) ) ( not ( = ?auto_128954 ?auto_128953 ) ) ( not ( = ?auto_128954 ?auto_128952 ) ) ( not ( = ?auto_128957 ?auto_128956 ) ) ( not ( = ?auto_128957 ?auto_128953 ) ) ( not ( = ?auto_128957 ?auto_128952 ) ) ( not ( = ?auto_128950 ?auto_128954 ) ) ( not ( = ?auto_128950 ?auto_128957 ) ) ( not ( = ?auto_128951 ?auto_128954 ) ) ( not ( = ?auto_128951 ?auto_128957 ) ) ( ON ?auto_128950 ?auto_128955 ) ( not ( = ?auto_128950 ?auto_128955 ) ) ( not ( = ?auto_128951 ?auto_128955 ) ) ( not ( = ?auto_128952 ?auto_128955 ) ) ( not ( = ?auto_128953 ?auto_128955 ) ) ( not ( = ?auto_128956 ?auto_128955 ) ) ( not ( = ?auto_128954 ?auto_128955 ) ) ( not ( = ?auto_128957 ?auto_128955 ) ) ( ON ?auto_128951 ?auto_128950 ) ( ON-TABLE ?auto_128955 ) ( CLEAR ?auto_128953 ) ( ON ?auto_128952 ?auto_128951 ) ( CLEAR ?auto_128952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128955 ?auto_128950 ?auto_128951 )
      ( MAKE-4PILE ?auto_128950 ?auto_128951 ?auto_128952 ?auto_128953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128958 - BLOCK
      ?auto_128959 - BLOCK
      ?auto_128960 - BLOCK
      ?auto_128961 - BLOCK
    )
    :vars
    (
      ?auto_128964 - BLOCK
      ?auto_128963 - BLOCK
      ?auto_128965 - BLOCK
      ?auto_128962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128958 ?auto_128959 ) ) ( not ( = ?auto_128958 ?auto_128960 ) ) ( not ( = ?auto_128958 ?auto_128961 ) ) ( not ( = ?auto_128959 ?auto_128960 ) ) ( not ( = ?auto_128959 ?auto_128961 ) ) ( not ( = ?auto_128960 ?auto_128961 ) ) ( not ( = ?auto_128958 ?auto_128964 ) ) ( not ( = ?auto_128959 ?auto_128964 ) ) ( not ( = ?auto_128960 ?auto_128964 ) ) ( not ( = ?auto_128961 ?auto_128964 ) ) ( ON-TABLE ?auto_128963 ) ( ON ?auto_128965 ?auto_128963 ) ( ON ?auto_128964 ?auto_128965 ) ( not ( = ?auto_128963 ?auto_128965 ) ) ( not ( = ?auto_128963 ?auto_128964 ) ) ( not ( = ?auto_128963 ?auto_128961 ) ) ( not ( = ?auto_128963 ?auto_128960 ) ) ( not ( = ?auto_128965 ?auto_128964 ) ) ( not ( = ?auto_128965 ?auto_128961 ) ) ( not ( = ?auto_128965 ?auto_128960 ) ) ( not ( = ?auto_128958 ?auto_128963 ) ) ( not ( = ?auto_128958 ?auto_128965 ) ) ( not ( = ?auto_128959 ?auto_128963 ) ) ( not ( = ?auto_128959 ?auto_128965 ) ) ( ON ?auto_128958 ?auto_128962 ) ( not ( = ?auto_128958 ?auto_128962 ) ) ( not ( = ?auto_128959 ?auto_128962 ) ) ( not ( = ?auto_128960 ?auto_128962 ) ) ( not ( = ?auto_128961 ?auto_128962 ) ) ( not ( = ?auto_128964 ?auto_128962 ) ) ( not ( = ?auto_128963 ?auto_128962 ) ) ( not ( = ?auto_128965 ?auto_128962 ) ) ( ON ?auto_128959 ?auto_128958 ) ( ON-TABLE ?auto_128962 ) ( ON ?auto_128960 ?auto_128959 ) ( CLEAR ?auto_128960 ) ( HOLDING ?auto_128961 ) ( CLEAR ?auto_128964 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128963 ?auto_128965 ?auto_128964 ?auto_128961 )
      ( MAKE-4PILE ?auto_128958 ?auto_128959 ?auto_128960 ?auto_128961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128966 - BLOCK
      ?auto_128967 - BLOCK
      ?auto_128968 - BLOCK
      ?auto_128969 - BLOCK
    )
    :vars
    (
      ?auto_128970 - BLOCK
      ?auto_128973 - BLOCK
      ?auto_128972 - BLOCK
      ?auto_128971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128966 ?auto_128967 ) ) ( not ( = ?auto_128966 ?auto_128968 ) ) ( not ( = ?auto_128966 ?auto_128969 ) ) ( not ( = ?auto_128967 ?auto_128968 ) ) ( not ( = ?auto_128967 ?auto_128969 ) ) ( not ( = ?auto_128968 ?auto_128969 ) ) ( not ( = ?auto_128966 ?auto_128970 ) ) ( not ( = ?auto_128967 ?auto_128970 ) ) ( not ( = ?auto_128968 ?auto_128970 ) ) ( not ( = ?auto_128969 ?auto_128970 ) ) ( ON-TABLE ?auto_128973 ) ( ON ?auto_128972 ?auto_128973 ) ( ON ?auto_128970 ?auto_128972 ) ( not ( = ?auto_128973 ?auto_128972 ) ) ( not ( = ?auto_128973 ?auto_128970 ) ) ( not ( = ?auto_128973 ?auto_128969 ) ) ( not ( = ?auto_128973 ?auto_128968 ) ) ( not ( = ?auto_128972 ?auto_128970 ) ) ( not ( = ?auto_128972 ?auto_128969 ) ) ( not ( = ?auto_128972 ?auto_128968 ) ) ( not ( = ?auto_128966 ?auto_128973 ) ) ( not ( = ?auto_128966 ?auto_128972 ) ) ( not ( = ?auto_128967 ?auto_128973 ) ) ( not ( = ?auto_128967 ?auto_128972 ) ) ( ON ?auto_128966 ?auto_128971 ) ( not ( = ?auto_128966 ?auto_128971 ) ) ( not ( = ?auto_128967 ?auto_128971 ) ) ( not ( = ?auto_128968 ?auto_128971 ) ) ( not ( = ?auto_128969 ?auto_128971 ) ) ( not ( = ?auto_128970 ?auto_128971 ) ) ( not ( = ?auto_128973 ?auto_128971 ) ) ( not ( = ?auto_128972 ?auto_128971 ) ) ( ON ?auto_128967 ?auto_128966 ) ( ON-TABLE ?auto_128971 ) ( ON ?auto_128968 ?auto_128967 ) ( CLEAR ?auto_128970 ) ( ON ?auto_128969 ?auto_128968 ) ( CLEAR ?auto_128969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_128971 ?auto_128966 ?auto_128967 ?auto_128968 )
      ( MAKE-4PILE ?auto_128966 ?auto_128967 ?auto_128968 ?auto_128969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128974 - BLOCK
      ?auto_128975 - BLOCK
      ?auto_128976 - BLOCK
      ?auto_128977 - BLOCK
    )
    :vars
    (
      ?auto_128979 - BLOCK
      ?auto_128980 - BLOCK
      ?auto_128978 - BLOCK
      ?auto_128981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128974 ?auto_128975 ) ) ( not ( = ?auto_128974 ?auto_128976 ) ) ( not ( = ?auto_128974 ?auto_128977 ) ) ( not ( = ?auto_128975 ?auto_128976 ) ) ( not ( = ?auto_128975 ?auto_128977 ) ) ( not ( = ?auto_128976 ?auto_128977 ) ) ( not ( = ?auto_128974 ?auto_128979 ) ) ( not ( = ?auto_128975 ?auto_128979 ) ) ( not ( = ?auto_128976 ?auto_128979 ) ) ( not ( = ?auto_128977 ?auto_128979 ) ) ( ON-TABLE ?auto_128980 ) ( ON ?auto_128978 ?auto_128980 ) ( not ( = ?auto_128980 ?auto_128978 ) ) ( not ( = ?auto_128980 ?auto_128979 ) ) ( not ( = ?auto_128980 ?auto_128977 ) ) ( not ( = ?auto_128980 ?auto_128976 ) ) ( not ( = ?auto_128978 ?auto_128979 ) ) ( not ( = ?auto_128978 ?auto_128977 ) ) ( not ( = ?auto_128978 ?auto_128976 ) ) ( not ( = ?auto_128974 ?auto_128980 ) ) ( not ( = ?auto_128974 ?auto_128978 ) ) ( not ( = ?auto_128975 ?auto_128980 ) ) ( not ( = ?auto_128975 ?auto_128978 ) ) ( ON ?auto_128974 ?auto_128981 ) ( not ( = ?auto_128974 ?auto_128981 ) ) ( not ( = ?auto_128975 ?auto_128981 ) ) ( not ( = ?auto_128976 ?auto_128981 ) ) ( not ( = ?auto_128977 ?auto_128981 ) ) ( not ( = ?auto_128979 ?auto_128981 ) ) ( not ( = ?auto_128980 ?auto_128981 ) ) ( not ( = ?auto_128978 ?auto_128981 ) ) ( ON ?auto_128975 ?auto_128974 ) ( ON-TABLE ?auto_128981 ) ( ON ?auto_128976 ?auto_128975 ) ( ON ?auto_128977 ?auto_128976 ) ( CLEAR ?auto_128977 ) ( HOLDING ?auto_128979 ) ( CLEAR ?auto_128978 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_128980 ?auto_128978 ?auto_128979 )
      ( MAKE-4PILE ?auto_128974 ?auto_128975 ?auto_128976 ?auto_128977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128982 - BLOCK
      ?auto_128983 - BLOCK
      ?auto_128984 - BLOCK
      ?auto_128985 - BLOCK
    )
    :vars
    (
      ?auto_128989 - BLOCK
      ?auto_128987 - BLOCK
      ?auto_128986 - BLOCK
      ?auto_128988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128982 ?auto_128983 ) ) ( not ( = ?auto_128982 ?auto_128984 ) ) ( not ( = ?auto_128982 ?auto_128985 ) ) ( not ( = ?auto_128983 ?auto_128984 ) ) ( not ( = ?auto_128983 ?auto_128985 ) ) ( not ( = ?auto_128984 ?auto_128985 ) ) ( not ( = ?auto_128982 ?auto_128989 ) ) ( not ( = ?auto_128983 ?auto_128989 ) ) ( not ( = ?auto_128984 ?auto_128989 ) ) ( not ( = ?auto_128985 ?auto_128989 ) ) ( ON-TABLE ?auto_128987 ) ( ON ?auto_128986 ?auto_128987 ) ( not ( = ?auto_128987 ?auto_128986 ) ) ( not ( = ?auto_128987 ?auto_128989 ) ) ( not ( = ?auto_128987 ?auto_128985 ) ) ( not ( = ?auto_128987 ?auto_128984 ) ) ( not ( = ?auto_128986 ?auto_128989 ) ) ( not ( = ?auto_128986 ?auto_128985 ) ) ( not ( = ?auto_128986 ?auto_128984 ) ) ( not ( = ?auto_128982 ?auto_128987 ) ) ( not ( = ?auto_128982 ?auto_128986 ) ) ( not ( = ?auto_128983 ?auto_128987 ) ) ( not ( = ?auto_128983 ?auto_128986 ) ) ( ON ?auto_128982 ?auto_128988 ) ( not ( = ?auto_128982 ?auto_128988 ) ) ( not ( = ?auto_128983 ?auto_128988 ) ) ( not ( = ?auto_128984 ?auto_128988 ) ) ( not ( = ?auto_128985 ?auto_128988 ) ) ( not ( = ?auto_128989 ?auto_128988 ) ) ( not ( = ?auto_128987 ?auto_128988 ) ) ( not ( = ?auto_128986 ?auto_128988 ) ) ( ON ?auto_128983 ?auto_128982 ) ( ON-TABLE ?auto_128988 ) ( ON ?auto_128984 ?auto_128983 ) ( ON ?auto_128985 ?auto_128984 ) ( CLEAR ?auto_128986 ) ( ON ?auto_128989 ?auto_128985 ) ( CLEAR ?auto_128989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_128988 ?auto_128982 ?auto_128983 ?auto_128984 ?auto_128985 )
      ( MAKE-4PILE ?auto_128982 ?auto_128983 ?auto_128984 ?auto_128985 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128990 - BLOCK
      ?auto_128991 - BLOCK
      ?auto_128992 - BLOCK
      ?auto_128993 - BLOCK
    )
    :vars
    (
      ?auto_128996 - BLOCK
      ?auto_128997 - BLOCK
      ?auto_128994 - BLOCK
      ?auto_128995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128990 ?auto_128991 ) ) ( not ( = ?auto_128990 ?auto_128992 ) ) ( not ( = ?auto_128990 ?auto_128993 ) ) ( not ( = ?auto_128991 ?auto_128992 ) ) ( not ( = ?auto_128991 ?auto_128993 ) ) ( not ( = ?auto_128992 ?auto_128993 ) ) ( not ( = ?auto_128990 ?auto_128996 ) ) ( not ( = ?auto_128991 ?auto_128996 ) ) ( not ( = ?auto_128992 ?auto_128996 ) ) ( not ( = ?auto_128993 ?auto_128996 ) ) ( ON-TABLE ?auto_128997 ) ( not ( = ?auto_128997 ?auto_128994 ) ) ( not ( = ?auto_128997 ?auto_128996 ) ) ( not ( = ?auto_128997 ?auto_128993 ) ) ( not ( = ?auto_128997 ?auto_128992 ) ) ( not ( = ?auto_128994 ?auto_128996 ) ) ( not ( = ?auto_128994 ?auto_128993 ) ) ( not ( = ?auto_128994 ?auto_128992 ) ) ( not ( = ?auto_128990 ?auto_128997 ) ) ( not ( = ?auto_128990 ?auto_128994 ) ) ( not ( = ?auto_128991 ?auto_128997 ) ) ( not ( = ?auto_128991 ?auto_128994 ) ) ( ON ?auto_128990 ?auto_128995 ) ( not ( = ?auto_128990 ?auto_128995 ) ) ( not ( = ?auto_128991 ?auto_128995 ) ) ( not ( = ?auto_128992 ?auto_128995 ) ) ( not ( = ?auto_128993 ?auto_128995 ) ) ( not ( = ?auto_128996 ?auto_128995 ) ) ( not ( = ?auto_128997 ?auto_128995 ) ) ( not ( = ?auto_128994 ?auto_128995 ) ) ( ON ?auto_128991 ?auto_128990 ) ( ON-TABLE ?auto_128995 ) ( ON ?auto_128992 ?auto_128991 ) ( ON ?auto_128993 ?auto_128992 ) ( ON ?auto_128996 ?auto_128993 ) ( CLEAR ?auto_128996 ) ( HOLDING ?auto_128994 ) ( CLEAR ?auto_128997 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_128997 ?auto_128994 )
      ( MAKE-4PILE ?auto_128990 ?auto_128991 ?auto_128992 ?auto_128993 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_128998 - BLOCK
      ?auto_128999 - BLOCK
      ?auto_129000 - BLOCK
      ?auto_129001 - BLOCK
    )
    :vars
    (
      ?auto_129004 - BLOCK
      ?auto_129005 - BLOCK
      ?auto_129002 - BLOCK
      ?auto_129003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_128998 ?auto_128999 ) ) ( not ( = ?auto_128998 ?auto_129000 ) ) ( not ( = ?auto_128998 ?auto_129001 ) ) ( not ( = ?auto_128999 ?auto_129000 ) ) ( not ( = ?auto_128999 ?auto_129001 ) ) ( not ( = ?auto_129000 ?auto_129001 ) ) ( not ( = ?auto_128998 ?auto_129004 ) ) ( not ( = ?auto_128999 ?auto_129004 ) ) ( not ( = ?auto_129000 ?auto_129004 ) ) ( not ( = ?auto_129001 ?auto_129004 ) ) ( ON-TABLE ?auto_129005 ) ( not ( = ?auto_129005 ?auto_129002 ) ) ( not ( = ?auto_129005 ?auto_129004 ) ) ( not ( = ?auto_129005 ?auto_129001 ) ) ( not ( = ?auto_129005 ?auto_129000 ) ) ( not ( = ?auto_129002 ?auto_129004 ) ) ( not ( = ?auto_129002 ?auto_129001 ) ) ( not ( = ?auto_129002 ?auto_129000 ) ) ( not ( = ?auto_128998 ?auto_129005 ) ) ( not ( = ?auto_128998 ?auto_129002 ) ) ( not ( = ?auto_128999 ?auto_129005 ) ) ( not ( = ?auto_128999 ?auto_129002 ) ) ( ON ?auto_128998 ?auto_129003 ) ( not ( = ?auto_128998 ?auto_129003 ) ) ( not ( = ?auto_128999 ?auto_129003 ) ) ( not ( = ?auto_129000 ?auto_129003 ) ) ( not ( = ?auto_129001 ?auto_129003 ) ) ( not ( = ?auto_129004 ?auto_129003 ) ) ( not ( = ?auto_129005 ?auto_129003 ) ) ( not ( = ?auto_129002 ?auto_129003 ) ) ( ON ?auto_128999 ?auto_128998 ) ( ON-TABLE ?auto_129003 ) ( ON ?auto_129000 ?auto_128999 ) ( ON ?auto_129001 ?auto_129000 ) ( ON ?auto_129004 ?auto_129001 ) ( CLEAR ?auto_129005 ) ( ON ?auto_129002 ?auto_129004 ) ( CLEAR ?auto_129002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129003 ?auto_128998 ?auto_128999 ?auto_129000 ?auto_129001 ?auto_129004 )
      ( MAKE-4PILE ?auto_128998 ?auto_128999 ?auto_129000 ?auto_129001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_129006 - BLOCK
      ?auto_129007 - BLOCK
      ?auto_129008 - BLOCK
      ?auto_129009 - BLOCK
    )
    :vars
    (
      ?auto_129012 - BLOCK
      ?auto_129011 - BLOCK
      ?auto_129010 - BLOCK
      ?auto_129013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129006 ?auto_129007 ) ) ( not ( = ?auto_129006 ?auto_129008 ) ) ( not ( = ?auto_129006 ?auto_129009 ) ) ( not ( = ?auto_129007 ?auto_129008 ) ) ( not ( = ?auto_129007 ?auto_129009 ) ) ( not ( = ?auto_129008 ?auto_129009 ) ) ( not ( = ?auto_129006 ?auto_129012 ) ) ( not ( = ?auto_129007 ?auto_129012 ) ) ( not ( = ?auto_129008 ?auto_129012 ) ) ( not ( = ?auto_129009 ?auto_129012 ) ) ( not ( = ?auto_129011 ?auto_129010 ) ) ( not ( = ?auto_129011 ?auto_129012 ) ) ( not ( = ?auto_129011 ?auto_129009 ) ) ( not ( = ?auto_129011 ?auto_129008 ) ) ( not ( = ?auto_129010 ?auto_129012 ) ) ( not ( = ?auto_129010 ?auto_129009 ) ) ( not ( = ?auto_129010 ?auto_129008 ) ) ( not ( = ?auto_129006 ?auto_129011 ) ) ( not ( = ?auto_129006 ?auto_129010 ) ) ( not ( = ?auto_129007 ?auto_129011 ) ) ( not ( = ?auto_129007 ?auto_129010 ) ) ( ON ?auto_129006 ?auto_129013 ) ( not ( = ?auto_129006 ?auto_129013 ) ) ( not ( = ?auto_129007 ?auto_129013 ) ) ( not ( = ?auto_129008 ?auto_129013 ) ) ( not ( = ?auto_129009 ?auto_129013 ) ) ( not ( = ?auto_129012 ?auto_129013 ) ) ( not ( = ?auto_129011 ?auto_129013 ) ) ( not ( = ?auto_129010 ?auto_129013 ) ) ( ON ?auto_129007 ?auto_129006 ) ( ON-TABLE ?auto_129013 ) ( ON ?auto_129008 ?auto_129007 ) ( ON ?auto_129009 ?auto_129008 ) ( ON ?auto_129012 ?auto_129009 ) ( ON ?auto_129010 ?auto_129012 ) ( CLEAR ?auto_129010 ) ( HOLDING ?auto_129011 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129011 )
      ( MAKE-4PILE ?auto_129006 ?auto_129007 ?auto_129008 ?auto_129009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_129014 - BLOCK
      ?auto_129015 - BLOCK
      ?auto_129016 - BLOCK
      ?auto_129017 - BLOCK
    )
    :vars
    (
      ?auto_129019 - BLOCK
      ?auto_129021 - BLOCK
      ?auto_129018 - BLOCK
      ?auto_129020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129014 ?auto_129015 ) ) ( not ( = ?auto_129014 ?auto_129016 ) ) ( not ( = ?auto_129014 ?auto_129017 ) ) ( not ( = ?auto_129015 ?auto_129016 ) ) ( not ( = ?auto_129015 ?auto_129017 ) ) ( not ( = ?auto_129016 ?auto_129017 ) ) ( not ( = ?auto_129014 ?auto_129019 ) ) ( not ( = ?auto_129015 ?auto_129019 ) ) ( not ( = ?auto_129016 ?auto_129019 ) ) ( not ( = ?auto_129017 ?auto_129019 ) ) ( not ( = ?auto_129021 ?auto_129018 ) ) ( not ( = ?auto_129021 ?auto_129019 ) ) ( not ( = ?auto_129021 ?auto_129017 ) ) ( not ( = ?auto_129021 ?auto_129016 ) ) ( not ( = ?auto_129018 ?auto_129019 ) ) ( not ( = ?auto_129018 ?auto_129017 ) ) ( not ( = ?auto_129018 ?auto_129016 ) ) ( not ( = ?auto_129014 ?auto_129021 ) ) ( not ( = ?auto_129014 ?auto_129018 ) ) ( not ( = ?auto_129015 ?auto_129021 ) ) ( not ( = ?auto_129015 ?auto_129018 ) ) ( ON ?auto_129014 ?auto_129020 ) ( not ( = ?auto_129014 ?auto_129020 ) ) ( not ( = ?auto_129015 ?auto_129020 ) ) ( not ( = ?auto_129016 ?auto_129020 ) ) ( not ( = ?auto_129017 ?auto_129020 ) ) ( not ( = ?auto_129019 ?auto_129020 ) ) ( not ( = ?auto_129021 ?auto_129020 ) ) ( not ( = ?auto_129018 ?auto_129020 ) ) ( ON ?auto_129015 ?auto_129014 ) ( ON-TABLE ?auto_129020 ) ( ON ?auto_129016 ?auto_129015 ) ( ON ?auto_129017 ?auto_129016 ) ( ON ?auto_129019 ?auto_129017 ) ( ON ?auto_129018 ?auto_129019 ) ( ON ?auto_129021 ?auto_129018 ) ( CLEAR ?auto_129021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129020 ?auto_129014 ?auto_129015 ?auto_129016 ?auto_129017 ?auto_129019 ?auto_129018 )
      ( MAKE-4PILE ?auto_129014 ?auto_129015 ?auto_129016 ?auto_129017 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129024 - BLOCK
      ?auto_129025 - BLOCK
    )
    :vars
    (
      ?auto_129026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129026 ?auto_129025 ) ( CLEAR ?auto_129026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129024 ) ( ON ?auto_129025 ?auto_129024 ) ( not ( = ?auto_129024 ?auto_129025 ) ) ( not ( = ?auto_129024 ?auto_129026 ) ) ( not ( = ?auto_129025 ?auto_129026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129026 ?auto_129025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129027 - BLOCK
      ?auto_129028 - BLOCK
    )
    :vars
    (
      ?auto_129029 - BLOCK
      ?auto_129030 - BLOCK
      ?auto_129031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129029 ?auto_129028 ) ( CLEAR ?auto_129029 ) ( ON-TABLE ?auto_129027 ) ( ON ?auto_129028 ?auto_129027 ) ( not ( = ?auto_129027 ?auto_129028 ) ) ( not ( = ?auto_129027 ?auto_129029 ) ) ( not ( = ?auto_129028 ?auto_129029 ) ) ( HOLDING ?auto_129030 ) ( CLEAR ?auto_129031 ) ( not ( = ?auto_129027 ?auto_129030 ) ) ( not ( = ?auto_129027 ?auto_129031 ) ) ( not ( = ?auto_129028 ?auto_129030 ) ) ( not ( = ?auto_129028 ?auto_129031 ) ) ( not ( = ?auto_129029 ?auto_129030 ) ) ( not ( = ?auto_129029 ?auto_129031 ) ) ( not ( = ?auto_129030 ?auto_129031 ) ) )
    :subtasks
    ( ( !STACK ?auto_129030 ?auto_129031 )
      ( MAKE-2PILE ?auto_129027 ?auto_129028 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129032 - BLOCK
      ?auto_129033 - BLOCK
    )
    :vars
    (
      ?auto_129034 - BLOCK
      ?auto_129036 - BLOCK
      ?auto_129035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129034 ?auto_129033 ) ( ON-TABLE ?auto_129032 ) ( ON ?auto_129033 ?auto_129032 ) ( not ( = ?auto_129032 ?auto_129033 ) ) ( not ( = ?auto_129032 ?auto_129034 ) ) ( not ( = ?auto_129033 ?auto_129034 ) ) ( CLEAR ?auto_129036 ) ( not ( = ?auto_129032 ?auto_129035 ) ) ( not ( = ?auto_129032 ?auto_129036 ) ) ( not ( = ?auto_129033 ?auto_129035 ) ) ( not ( = ?auto_129033 ?auto_129036 ) ) ( not ( = ?auto_129034 ?auto_129035 ) ) ( not ( = ?auto_129034 ?auto_129036 ) ) ( not ( = ?auto_129035 ?auto_129036 ) ) ( ON ?auto_129035 ?auto_129034 ) ( CLEAR ?auto_129035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129032 ?auto_129033 ?auto_129034 )
      ( MAKE-2PILE ?auto_129032 ?auto_129033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129037 - BLOCK
      ?auto_129038 - BLOCK
    )
    :vars
    (
      ?auto_129041 - BLOCK
      ?auto_129040 - BLOCK
      ?auto_129039 - BLOCK
      ?auto_129043 - BLOCK
      ?auto_129042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129041 ?auto_129038 ) ( ON-TABLE ?auto_129037 ) ( ON ?auto_129038 ?auto_129037 ) ( not ( = ?auto_129037 ?auto_129038 ) ) ( not ( = ?auto_129037 ?auto_129041 ) ) ( not ( = ?auto_129038 ?auto_129041 ) ) ( not ( = ?auto_129037 ?auto_129040 ) ) ( not ( = ?auto_129037 ?auto_129039 ) ) ( not ( = ?auto_129038 ?auto_129040 ) ) ( not ( = ?auto_129038 ?auto_129039 ) ) ( not ( = ?auto_129041 ?auto_129040 ) ) ( not ( = ?auto_129041 ?auto_129039 ) ) ( not ( = ?auto_129040 ?auto_129039 ) ) ( ON ?auto_129040 ?auto_129041 ) ( CLEAR ?auto_129040 ) ( HOLDING ?auto_129039 ) ( CLEAR ?auto_129043 ) ( ON-TABLE ?auto_129042 ) ( ON ?auto_129043 ?auto_129042 ) ( not ( = ?auto_129042 ?auto_129043 ) ) ( not ( = ?auto_129042 ?auto_129039 ) ) ( not ( = ?auto_129043 ?auto_129039 ) ) ( not ( = ?auto_129037 ?auto_129043 ) ) ( not ( = ?auto_129037 ?auto_129042 ) ) ( not ( = ?auto_129038 ?auto_129043 ) ) ( not ( = ?auto_129038 ?auto_129042 ) ) ( not ( = ?auto_129041 ?auto_129043 ) ) ( not ( = ?auto_129041 ?auto_129042 ) ) ( not ( = ?auto_129040 ?auto_129043 ) ) ( not ( = ?auto_129040 ?auto_129042 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129042 ?auto_129043 ?auto_129039 )
      ( MAKE-2PILE ?auto_129037 ?auto_129038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129044 - BLOCK
      ?auto_129045 - BLOCK
    )
    :vars
    (
      ?auto_129050 - BLOCK
      ?auto_129049 - BLOCK
      ?auto_129048 - BLOCK
      ?auto_129046 - BLOCK
      ?auto_129047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129050 ?auto_129045 ) ( ON-TABLE ?auto_129044 ) ( ON ?auto_129045 ?auto_129044 ) ( not ( = ?auto_129044 ?auto_129045 ) ) ( not ( = ?auto_129044 ?auto_129050 ) ) ( not ( = ?auto_129045 ?auto_129050 ) ) ( not ( = ?auto_129044 ?auto_129049 ) ) ( not ( = ?auto_129044 ?auto_129048 ) ) ( not ( = ?auto_129045 ?auto_129049 ) ) ( not ( = ?auto_129045 ?auto_129048 ) ) ( not ( = ?auto_129050 ?auto_129049 ) ) ( not ( = ?auto_129050 ?auto_129048 ) ) ( not ( = ?auto_129049 ?auto_129048 ) ) ( ON ?auto_129049 ?auto_129050 ) ( CLEAR ?auto_129046 ) ( ON-TABLE ?auto_129047 ) ( ON ?auto_129046 ?auto_129047 ) ( not ( = ?auto_129047 ?auto_129046 ) ) ( not ( = ?auto_129047 ?auto_129048 ) ) ( not ( = ?auto_129046 ?auto_129048 ) ) ( not ( = ?auto_129044 ?auto_129046 ) ) ( not ( = ?auto_129044 ?auto_129047 ) ) ( not ( = ?auto_129045 ?auto_129046 ) ) ( not ( = ?auto_129045 ?auto_129047 ) ) ( not ( = ?auto_129050 ?auto_129046 ) ) ( not ( = ?auto_129050 ?auto_129047 ) ) ( not ( = ?auto_129049 ?auto_129046 ) ) ( not ( = ?auto_129049 ?auto_129047 ) ) ( ON ?auto_129048 ?auto_129049 ) ( CLEAR ?auto_129048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129044 ?auto_129045 ?auto_129050 ?auto_129049 )
      ( MAKE-2PILE ?auto_129044 ?auto_129045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129051 - BLOCK
      ?auto_129052 - BLOCK
    )
    :vars
    (
      ?auto_129054 - BLOCK
      ?auto_129056 - BLOCK
      ?auto_129057 - BLOCK
      ?auto_129055 - BLOCK
      ?auto_129053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129054 ?auto_129052 ) ( ON-TABLE ?auto_129051 ) ( ON ?auto_129052 ?auto_129051 ) ( not ( = ?auto_129051 ?auto_129052 ) ) ( not ( = ?auto_129051 ?auto_129054 ) ) ( not ( = ?auto_129052 ?auto_129054 ) ) ( not ( = ?auto_129051 ?auto_129056 ) ) ( not ( = ?auto_129051 ?auto_129057 ) ) ( not ( = ?auto_129052 ?auto_129056 ) ) ( not ( = ?auto_129052 ?auto_129057 ) ) ( not ( = ?auto_129054 ?auto_129056 ) ) ( not ( = ?auto_129054 ?auto_129057 ) ) ( not ( = ?auto_129056 ?auto_129057 ) ) ( ON ?auto_129056 ?auto_129054 ) ( ON-TABLE ?auto_129055 ) ( not ( = ?auto_129055 ?auto_129053 ) ) ( not ( = ?auto_129055 ?auto_129057 ) ) ( not ( = ?auto_129053 ?auto_129057 ) ) ( not ( = ?auto_129051 ?auto_129053 ) ) ( not ( = ?auto_129051 ?auto_129055 ) ) ( not ( = ?auto_129052 ?auto_129053 ) ) ( not ( = ?auto_129052 ?auto_129055 ) ) ( not ( = ?auto_129054 ?auto_129053 ) ) ( not ( = ?auto_129054 ?auto_129055 ) ) ( not ( = ?auto_129056 ?auto_129053 ) ) ( not ( = ?auto_129056 ?auto_129055 ) ) ( ON ?auto_129057 ?auto_129056 ) ( CLEAR ?auto_129057 ) ( HOLDING ?auto_129053 ) ( CLEAR ?auto_129055 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129055 ?auto_129053 )
      ( MAKE-2PILE ?auto_129051 ?auto_129052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129058 - BLOCK
      ?auto_129059 - BLOCK
    )
    :vars
    (
      ?auto_129061 - BLOCK
      ?auto_129060 - BLOCK
      ?auto_129062 - BLOCK
      ?auto_129063 - BLOCK
      ?auto_129064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129061 ?auto_129059 ) ( ON-TABLE ?auto_129058 ) ( ON ?auto_129059 ?auto_129058 ) ( not ( = ?auto_129058 ?auto_129059 ) ) ( not ( = ?auto_129058 ?auto_129061 ) ) ( not ( = ?auto_129059 ?auto_129061 ) ) ( not ( = ?auto_129058 ?auto_129060 ) ) ( not ( = ?auto_129058 ?auto_129062 ) ) ( not ( = ?auto_129059 ?auto_129060 ) ) ( not ( = ?auto_129059 ?auto_129062 ) ) ( not ( = ?auto_129061 ?auto_129060 ) ) ( not ( = ?auto_129061 ?auto_129062 ) ) ( not ( = ?auto_129060 ?auto_129062 ) ) ( ON ?auto_129060 ?auto_129061 ) ( ON-TABLE ?auto_129063 ) ( not ( = ?auto_129063 ?auto_129064 ) ) ( not ( = ?auto_129063 ?auto_129062 ) ) ( not ( = ?auto_129064 ?auto_129062 ) ) ( not ( = ?auto_129058 ?auto_129064 ) ) ( not ( = ?auto_129058 ?auto_129063 ) ) ( not ( = ?auto_129059 ?auto_129064 ) ) ( not ( = ?auto_129059 ?auto_129063 ) ) ( not ( = ?auto_129061 ?auto_129064 ) ) ( not ( = ?auto_129061 ?auto_129063 ) ) ( not ( = ?auto_129060 ?auto_129064 ) ) ( not ( = ?auto_129060 ?auto_129063 ) ) ( ON ?auto_129062 ?auto_129060 ) ( CLEAR ?auto_129063 ) ( ON ?auto_129064 ?auto_129062 ) ( CLEAR ?auto_129064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129058 ?auto_129059 ?auto_129061 ?auto_129060 ?auto_129062 )
      ( MAKE-2PILE ?auto_129058 ?auto_129059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129065 - BLOCK
      ?auto_129066 - BLOCK
    )
    :vars
    (
      ?auto_129068 - BLOCK
      ?auto_129067 - BLOCK
      ?auto_129069 - BLOCK
      ?auto_129070 - BLOCK
      ?auto_129071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129068 ?auto_129066 ) ( ON-TABLE ?auto_129065 ) ( ON ?auto_129066 ?auto_129065 ) ( not ( = ?auto_129065 ?auto_129066 ) ) ( not ( = ?auto_129065 ?auto_129068 ) ) ( not ( = ?auto_129066 ?auto_129068 ) ) ( not ( = ?auto_129065 ?auto_129067 ) ) ( not ( = ?auto_129065 ?auto_129069 ) ) ( not ( = ?auto_129066 ?auto_129067 ) ) ( not ( = ?auto_129066 ?auto_129069 ) ) ( not ( = ?auto_129068 ?auto_129067 ) ) ( not ( = ?auto_129068 ?auto_129069 ) ) ( not ( = ?auto_129067 ?auto_129069 ) ) ( ON ?auto_129067 ?auto_129068 ) ( not ( = ?auto_129070 ?auto_129071 ) ) ( not ( = ?auto_129070 ?auto_129069 ) ) ( not ( = ?auto_129071 ?auto_129069 ) ) ( not ( = ?auto_129065 ?auto_129071 ) ) ( not ( = ?auto_129065 ?auto_129070 ) ) ( not ( = ?auto_129066 ?auto_129071 ) ) ( not ( = ?auto_129066 ?auto_129070 ) ) ( not ( = ?auto_129068 ?auto_129071 ) ) ( not ( = ?auto_129068 ?auto_129070 ) ) ( not ( = ?auto_129067 ?auto_129071 ) ) ( not ( = ?auto_129067 ?auto_129070 ) ) ( ON ?auto_129069 ?auto_129067 ) ( ON ?auto_129071 ?auto_129069 ) ( CLEAR ?auto_129071 ) ( HOLDING ?auto_129070 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129070 )
      ( MAKE-2PILE ?auto_129065 ?auto_129066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129072 - BLOCK
      ?auto_129073 - BLOCK
    )
    :vars
    (
      ?auto_129078 - BLOCK
      ?auto_129074 - BLOCK
      ?auto_129077 - BLOCK
      ?auto_129076 - BLOCK
      ?auto_129075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129078 ?auto_129073 ) ( ON-TABLE ?auto_129072 ) ( ON ?auto_129073 ?auto_129072 ) ( not ( = ?auto_129072 ?auto_129073 ) ) ( not ( = ?auto_129072 ?auto_129078 ) ) ( not ( = ?auto_129073 ?auto_129078 ) ) ( not ( = ?auto_129072 ?auto_129074 ) ) ( not ( = ?auto_129072 ?auto_129077 ) ) ( not ( = ?auto_129073 ?auto_129074 ) ) ( not ( = ?auto_129073 ?auto_129077 ) ) ( not ( = ?auto_129078 ?auto_129074 ) ) ( not ( = ?auto_129078 ?auto_129077 ) ) ( not ( = ?auto_129074 ?auto_129077 ) ) ( ON ?auto_129074 ?auto_129078 ) ( not ( = ?auto_129076 ?auto_129075 ) ) ( not ( = ?auto_129076 ?auto_129077 ) ) ( not ( = ?auto_129075 ?auto_129077 ) ) ( not ( = ?auto_129072 ?auto_129075 ) ) ( not ( = ?auto_129072 ?auto_129076 ) ) ( not ( = ?auto_129073 ?auto_129075 ) ) ( not ( = ?auto_129073 ?auto_129076 ) ) ( not ( = ?auto_129078 ?auto_129075 ) ) ( not ( = ?auto_129078 ?auto_129076 ) ) ( not ( = ?auto_129074 ?auto_129075 ) ) ( not ( = ?auto_129074 ?auto_129076 ) ) ( ON ?auto_129077 ?auto_129074 ) ( ON ?auto_129075 ?auto_129077 ) ( ON ?auto_129076 ?auto_129075 ) ( CLEAR ?auto_129076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129072 ?auto_129073 ?auto_129078 ?auto_129074 ?auto_129077 ?auto_129075 )
      ( MAKE-2PILE ?auto_129072 ?auto_129073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129079 - BLOCK
      ?auto_129080 - BLOCK
    )
    :vars
    (
      ?auto_129082 - BLOCK
      ?auto_129084 - BLOCK
      ?auto_129085 - BLOCK
      ?auto_129081 - BLOCK
      ?auto_129083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129082 ?auto_129080 ) ( ON-TABLE ?auto_129079 ) ( ON ?auto_129080 ?auto_129079 ) ( not ( = ?auto_129079 ?auto_129080 ) ) ( not ( = ?auto_129079 ?auto_129082 ) ) ( not ( = ?auto_129080 ?auto_129082 ) ) ( not ( = ?auto_129079 ?auto_129084 ) ) ( not ( = ?auto_129079 ?auto_129085 ) ) ( not ( = ?auto_129080 ?auto_129084 ) ) ( not ( = ?auto_129080 ?auto_129085 ) ) ( not ( = ?auto_129082 ?auto_129084 ) ) ( not ( = ?auto_129082 ?auto_129085 ) ) ( not ( = ?auto_129084 ?auto_129085 ) ) ( ON ?auto_129084 ?auto_129082 ) ( not ( = ?auto_129081 ?auto_129083 ) ) ( not ( = ?auto_129081 ?auto_129085 ) ) ( not ( = ?auto_129083 ?auto_129085 ) ) ( not ( = ?auto_129079 ?auto_129083 ) ) ( not ( = ?auto_129079 ?auto_129081 ) ) ( not ( = ?auto_129080 ?auto_129083 ) ) ( not ( = ?auto_129080 ?auto_129081 ) ) ( not ( = ?auto_129082 ?auto_129083 ) ) ( not ( = ?auto_129082 ?auto_129081 ) ) ( not ( = ?auto_129084 ?auto_129083 ) ) ( not ( = ?auto_129084 ?auto_129081 ) ) ( ON ?auto_129085 ?auto_129084 ) ( ON ?auto_129083 ?auto_129085 ) ( HOLDING ?auto_129081 ) ( CLEAR ?auto_129083 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129079 ?auto_129080 ?auto_129082 ?auto_129084 ?auto_129085 ?auto_129083 ?auto_129081 )
      ( MAKE-2PILE ?auto_129079 ?auto_129080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129086 - BLOCK
      ?auto_129087 - BLOCK
    )
    :vars
    (
      ?auto_129088 - BLOCK
      ?auto_129090 - BLOCK
      ?auto_129091 - BLOCK
      ?auto_129092 - BLOCK
      ?auto_129089 - BLOCK
      ?auto_129093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129088 ?auto_129087 ) ( ON-TABLE ?auto_129086 ) ( ON ?auto_129087 ?auto_129086 ) ( not ( = ?auto_129086 ?auto_129087 ) ) ( not ( = ?auto_129086 ?auto_129088 ) ) ( not ( = ?auto_129087 ?auto_129088 ) ) ( not ( = ?auto_129086 ?auto_129090 ) ) ( not ( = ?auto_129086 ?auto_129091 ) ) ( not ( = ?auto_129087 ?auto_129090 ) ) ( not ( = ?auto_129087 ?auto_129091 ) ) ( not ( = ?auto_129088 ?auto_129090 ) ) ( not ( = ?auto_129088 ?auto_129091 ) ) ( not ( = ?auto_129090 ?auto_129091 ) ) ( ON ?auto_129090 ?auto_129088 ) ( not ( = ?auto_129092 ?auto_129089 ) ) ( not ( = ?auto_129092 ?auto_129091 ) ) ( not ( = ?auto_129089 ?auto_129091 ) ) ( not ( = ?auto_129086 ?auto_129089 ) ) ( not ( = ?auto_129086 ?auto_129092 ) ) ( not ( = ?auto_129087 ?auto_129089 ) ) ( not ( = ?auto_129087 ?auto_129092 ) ) ( not ( = ?auto_129088 ?auto_129089 ) ) ( not ( = ?auto_129088 ?auto_129092 ) ) ( not ( = ?auto_129090 ?auto_129089 ) ) ( not ( = ?auto_129090 ?auto_129092 ) ) ( ON ?auto_129091 ?auto_129090 ) ( ON ?auto_129089 ?auto_129091 ) ( CLEAR ?auto_129089 ) ( ON ?auto_129092 ?auto_129093 ) ( CLEAR ?auto_129092 ) ( HAND-EMPTY ) ( not ( = ?auto_129086 ?auto_129093 ) ) ( not ( = ?auto_129087 ?auto_129093 ) ) ( not ( = ?auto_129088 ?auto_129093 ) ) ( not ( = ?auto_129090 ?auto_129093 ) ) ( not ( = ?auto_129091 ?auto_129093 ) ) ( not ( = ?auto_129092 ?auto_129093 ) ) ( not ( = ?auto_129089 ?auto_129093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129092 ?auto_129093 )
      ( MAKE-2PILE ?auto_129086 ?auto_129087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129094 - BLOCK
      ?auto_129095 - BLOCK
    )
    :vars
    (
      ?auto_129100 - BLOCK
      ?auto_129098 - BLOCK
      ?auto_129096 - BLOCK
      ?auto_129099 - BLOCK
      ?auto_129097 - BLOCK
      ?auto_129101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129100 ?auto_129095 ) ( ON-TABLE ?auto_129094 ) ( ON ?auto_129095 ?auto_129094 ) ( not ( = ?auto_129094 ?auto_129095 ) ) ( not ( = ?auto_129094 ?auto_129100 ) ) ( not ( = ?auto_129095 ?auto_129100 ) ) ( not ( = ?auto_129094 ?auto_129098 ) ) ( not ( = ?auto_129094 ?auto_129096 ) ) ( not ( = ?auto_129095 ?auto_129098 ) ) ( not ( = ?auto_129095 ?auto_129096 ) ) ( not ( = ?auto_129100 ?auto_129098 ) ) ( not ( = ?auto_129100 ?auto_129096 ) ) ( not ( = ?auto_129098 ?auto_129096 ) ) ( ON ?auto_129098 ?auto_129100 ) ( not ( = ?auto_129099 ?auto_129097 ) ) ( not ( = ?auto_129099 ?auto_129096 ) ) ( not ( = ?auto_129097 ?auto_129096 ) ) ( not ( = ?auto_129094 ?auto_129097 ) ) ( not ( = ?auto_129094 ?auto_129099 ) ) ( not ( = ?auto_129095 ?auto_129097 ) ) ( not ( = ?auto_129095 ?auto_129099 ) ) ( not ( = ?auto_129100 ?auto_129097 ) ) ( not ( = ?auto_129100 ?auto_129099 ) ) ( not ( = ?auto_129098 ?auto_129097 ) ) ( not ( = ?auto_129098 ?auto_129099 ) ) ( ON ?auto_129096 ?auto_129098 ) ( ON ?auto_129099 ?auto_129101 ) ( CLEAR ?auto_129099 ) ( not ( = ?auto_129094 ?auto_129101 ) ) ( not ( = ?auto_129095 ?auto_129101 ) ) ( not ( = ?auto_129100 ?auto_129101 ) ) ( not ( = ?auto_129098 ?auto_129101 ) ) ( not ( = ?auto_129096 ?auto_129101 ) ) ( not ( = ?auto_129099 ?auto_129101 ) ) ( not ( = ?auto_129097 ?auto_129101 ) ) ( HOLDING ?auto_129097 ) ( CLEAR ?auto_129096 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129094 ?auto_129095 ?auto_129100 ?auto_129098 ?auto_129096 ?auto_129097 )
      ( MAKE-2PILE ?auto_129094 ?auto_129095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129102 - BLOCK
      ?auto_129103 - BLOCK
    )
    :vars
    (
      ?auto_129105 - BLOCK
      ?auto_129108 - BLOCK
      ?auto_129104 - BLOCK
      ?auto_129106 - BLOCK
      ?auto_129107 - BLOCK
      ?auto_129109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129105 ?auto_129103 ) ( ON-TABLE ?auto_129102 ) ( ON ?auto_129103 ?auto_129102 ) ( not ( = ?auto_129102 ?auto_129103 ) ) ( not ( = ?auto_129102 ?auto_129105 ) ) ( not ( = ?auto_129103 ?auto_129105 ) ) ( not ( = ?auto_129102 ?auto_129108 ) ) ( not ( = ?auto_129102 ?auto_129104 ) ) ( not ( = ?auto_129103 ?auto_129108 ) ) ( not ( = ?auto_129103 ?auto_129104 ) ) ( not ( = ?auto_129105 ?auto_129108 ) ) ( not ( = ?auto_129105 ?auto_129104 ) ) ( not ( = ?auto_129108 ?auto_129104 ) ) ( ON ?auto_129108 ?auto_129105 ) ( not ( = ?auto_129106 ?auto_129107 ) ) ( not ( = ?auto_129106 ?auto_129104 ) ) ( not ( = ?auto_129107 ?auto_129104 ) ) ( not ( = ?auto_129102 ?auto_129107 ) ) ( not ( = ?auto_129102 ?auto_129106 ) ) ( not ( = ?auto_129103 ?auto_129107 ) ) ( not ( = ?auto_129103 ?auto_129106 ) ) ( not ( = ?auto_129105 ?auto_129107 ) ) ( not ( = ?auto_129105 ?auto_129106 ) ) ( not ( = ?auto_129108 ?auto_129107 ) ) ( not ( = ?auto_129108 ?auto_129106 ) ) ( ON ?auto_129104 ?auto_129108 ) ( ON ?auto_129106 ?auto_129109 ) ( not ( = ?auto_129102 ?auto_129109 ) ) ( not ( = ?auto_129103 ?auto_129109 ) ) ( not ( = ?auto_129105 ?auto_129109 ) ) ( not ( = ?auto_129108 ?auto_129109 ) ) ( not ( = ?auto_129104 ?auto_129109 ) ) ( not ( = ?auto_129106 ?auto_129109 ) ) ( not ( = ?auto_129107 ?auto_129109 ) ) ( CLEAR ?auto_129104 ) ( ON ?auto_129107 ?auto_129106 ) ( CLEAR ?auto_129107 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129109 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129109 ?auto_129106 )
      ( MAKE-2PILE ?auto_129102 ?auto_129103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129110 - BLOCK
      ?auto_129111 - BLOCK
    )
    :vars
    (
      ?auto_129113 - BLOCK
      ?auto_129114 - BLOCK
      ?auto_129116 - BLOCK
      ?auto_129117 - BLOCK
      ?auto_129112 - BLOCK
      ?auto_129115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129113 ?auto_129111 ) ( ON-TABLE ?auto_129110 ) ( ON ?auto_129111 ?auto_129110 ) ( not ( = ?auto_129110 ?auto_129111 ) ) ( not ( = ?auto_129110 ?auto_129113 ) ) ( not ( = ?auto_129111 ?auto_129113 ) ) ( not ( = ?auto_129110 ?auto_129114 ) ) ( not ( = ?auto_129110 ?auto_129116 ) ) ( not ( = ?auto_129111 ?auto_129114 ) ) ( not ( = ?auto_129111 ?auto_129116 ) ) ( not ( = ?auto_129113 ?auto_129114 ) ) ( not ( = ?auto_129113 ?auto_129116 ) ) ( not ( = ?auto_129114 ?auto_129116 ) ) ( ON ?auto_129114 ?auto_129113 ) ( not ( = ?auto_129117 ?auto_129112 ) ) ( not ( = ?auto_129117 ?auto_129116 ) ) ( not ( = ?auto_129112 ?auto_129116 ) ) ( not ( = ?auto_129110 ?auto_129112 ) ) ( not ( = ?auto_129110 ?auto_129117 ) ) ( not ( = ?auto_129111 ?auto_129112 ) ) ( not ( = ?auto_129111 ?auto_129117 ) ) ( not ( = ?auto_129113 ?auto_129112 ) ) ( not ( = ?auto_129113 ?auto_129117 ) ) ( not ( = ?auto_129114 ?auto_129112 ) ) ( not ( = ?auto_129114 ?auto_129117 ) ) ( ON ?auto_129117 ?auto_129115 ) ( not ( = ?auto_129110 ?auto_129115 ) ) ( not ( = ?auto_129111 ?auto_129115 ) ) ( not ( = ?auto_129113 ?auto_129115 ) ) ( not ( = ?auto_129114 ?auto_129115 ) ) ( not ( = ?auto_129116 ?auto_129115 ) ) ( not ( = ?auto_129117 ?auto_129115 ) ) ( not ( = ?auto_129112 ?auto_129115 ) ) ( ON ?auto_129112 ?auto_129117 ) ( CLEAR ?auto_129112 ) ( ON-TABLE ?auto_129115 ) ( HOLDING ?auto_129116 ) ( CLEAR ?auto_129114 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129110 ?auto_129111 ?auto_129113 ?auto_129114 ?auto_129116 )
      ( MAKE-2PILE ?auto_129110 ?auto_129111 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129118 - BLOCK
      ?auto_129119 - BLOCK
    )
    :vars
    (
      ?auto_129121 - BLOCK
      ?auto_129120 - BLOCK
      ?auto_129122 - BLOCK
      ?auto_129123 - BLOCK
      ?auto_129125 - BLOCK
      ?auto_129124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129121 ?auto_129119 ) ( ON-TABLE ?auto_129118 ) ( ON ?auto_129119 ?auto_129118 ) ( not ( = ?auto_129118 ?auto_129119 ) ) ( not ( = ?auto_129118 ?auto_129121 ) ) ( not ( = ?auto_129119 ?auto_129121 ) ) ( not ( = ?auto_129118 ?auto_129120 ) ) ( not ( = ?auto_129118 ?auto_129122 ) ) ( not ( = ?auto_129119 ?auto_129120 ) ) ( not ( = ?auto_129119 ?auto_129122 ) ) ( not ( = ?auto_129121 ?auto_129120 ) ) ( not ( = ?auto_129121 ?auto_129122 ) ) ( not ( = ?auto_129120 ?auto_129122 ) ) ( ON ?auto_129120 ?auto_129121 ) ( not ( = ?auto_129123 ?auto_129125 ) ) ( not ( = ?auto_129123 ?auto_129122 ) ) ( not ( = ?auto_129125 ?auto_129122 ) ) ( not ( = ?auto_129118 ?auto_129125 ) ) ( not ( = ?auto_129118 ?auto_129123 ) ) ( not ( = ?auto_129119 ?auto_129125 ) ) ( not ( = ?auto_129119 ?auto_129123 ) ) ( not ( = ?auto_129121 ?auto_129125 ) ) ( not ( = ?auto_129121 ?auto_129123 ) ) ( not ( = ?auto_129120 ?auto_129125 ) ) ( not ( = ?auto_129120 ?auto_129123 ) ) ( ON ?auto_129123 ?auto_129124 ) ( not ( = ?auto_129118 ?auto_129124 ) ) ( not ( = ?auto_129119 ?auto_129124 ) ) ( not ( = ?auto_129121 ?auto_129124 ) ) ( not ( = ?auto_129120 ?auto_129124 ) ) ( not ( = ?auto_129122 ?auto_129124 ) ) ( not ( = ?auto_129123 ?auto_129124 ) ) ( not ( = ?auto_129125 ?auto_129124 ) ) ( ON ?auto_129125 ?auto_129123 ) ( ON-TABLE ?auto_129124 ) ( CLEAR ?auto_129120 ) ( ON ?auto_129122 ?auto_129125 ) ( CLEAR ?auto_129122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129124 ?auto_129123 ?auto_129125 )
      ( MAKE-2PILE ?auto_129118 ?auto_129119 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129126 - BLOCK
      ?auto_129127 - BLOCK
    )
    :vars
    (
      ?auto_129130 - BLOCK
      ?auto_129129 - BLOCK
      ?auto_129133 - BLOCK
      ?auto_129131 - BLOCK
      ?auto_129132 - BLOCK
      ?auto_129128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129130 ?auto_129127 ) ( ON-TABLE ?auto_129126 ) ( ON ?auto_129127 ?auto_129126 ) ( not ( = ?auto_129126 ?auto_129127 ) ) ( not ( = ?auto_129126 ?auto_129130 ) ) ( not ( = ?auto_129127 ?auto_129130 ) ) ( not ( = ?auto_129126 ?auto_129129 ) ) ( not ( = ?auto_129126 ?auto_129133 ) ) ( not ( = ?auto_129127 ?auto_129129 ) ) ( not ( = ?auto_129127 ?auto_129133 ) ) ( not ( = ?auto_129130 ?auto_129129 ) ) ( not ( = ?auto_129130 ?auto_129133 ) ) ( not ( = ?auto_129129 ?auto_129133 ) ) ( not ( = ?auto_129131 ?auto_129132 ) ) ( not ( = ?auto_129131 ?auto_129133 ) ) ( not ( = ?auto_129132 ?auto_129133 ) ) ( not ( = ?auto_129126 ?auto_129132 ) ) ( not ( = ?auto_129126 ?auto_129131 ) ) ( not ( = ?auto_129127 ?auto_129132 ) ) ( not ( = ?auto_129127 ?auto_129131 ) ) ( not ( = ?auto_129130 ?auto_129132 ) ) ( not ( = ?auto_129130 ?auto_129131 ) ) ( not ( = ?auto_129129 ?auto_129132 ) ) ( not ( = ?auto_129129 ?auto_129131 ) ) ( ON ?auto_129131 ?auto_129128 ) ( not ( = ?auto_129126 ?auto_129128 ) ) ( not ( = ?auto_129127 ?auto_129128 ) ) ( not ( = ?auto_129130 ?auto_129128 ) ) ( not ( = ?auto_129129 ?auto_129128 ) ) ( not ( = ?auto_129133 ?auto_129128 ) ) ( not ( = ?auto_129131 ?auto_129128 ) ) ( not ( = ?auto_129132 ?auto_129128 ) ) ( ON ?auto_129132 ?auto_129131 ) ( ON-TABLE ?auto_129128 ) ( ON ?auto_129133 ?auto_129132 ) ( CLEAR ?auto_129133 ) ( HOLDING ?auto_129129 ) ( CLEAR ?auto_129130 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129126 ?auto_129127 ?auto_129130 ?auto_129129 )
      ( MAKE-2PILE ?auto_129126 ?auto_129127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129134 - BLOCK
      ?auto_129135 - BLOCK
    )
    :vars
    (
      ?auto_129136 - BLOCK
      ?auto_129137 - BLOCK
      ?auto_129138 - BLOCK
      ?auto_129139 - BLOCK
      ?auto_129140 - BLOCK
      ?auto_129141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129136 ?auto_129135 ) ( ON-TABLE ?auto_129134 ) ( ON ?auto_129135 ?auto_129134 ) ( not ( = ?auto_129134 ?auto_129135 ) ) ( not ( = ?auto_129134 ?auto_129136 ) ) ( not ( = ?auto_129135 ?auto_129136 ) ) ( not ( = ?auto_129134 ?auto_129137 ) ) ( not ( = ?auto_129134 ?auto_129138 ) ) ( not ( = ?auto_129135 ?auto_129137 ) ) ( not ( = ?auto_129135 ?auto_129138 ) ) ( not ( = ?auto_129136 ?auto_129137 ) ) ( not ( = ?auto_129136 ?auto_129138 ) ) ( not ( = ?auto_129137 ?auto_129138 ) ) ( not ( = ?auto_129139 ?auto_129140 ) ) ( not ( = ?auto_129139 ?auto_129138 ) ) ( not ( = ?auto_129140 ?auto_129138 ) ) ( not ( = ?auto_129134 ?auto_129140 ) ) ( not ( = ?auto_129134 ?auto_129139 ) ) ( not ( = ?auto_129135 ?auto_129140 ) ) ( not ( = ?auto_129135 ?auto_129139 ) ) ( not ( = ?auto_129136 ?auto_129140 ) ) ( not ( = ?auto_129136 ?auto_129139 ) ) ( not ( = ?auto_129137 ?auto_129140 ) ) ( not ( = ?auto_129137 ?auto_129139 ) ) ( ON ?auto_129139 ?auto_129141 ) ( not ( = ?auto_129134 ?auto_129141 ) ) ( not ( = ?auto_129135 ?auto_129141 ) ) ( not ( = ?auto_129136 ?auto_129141 ) ) ( not ( = ?auto_129137 ?auto_129141 ) ) ( not ( = ?auto_129138 ?auto_129141 ) ) ( not ( = ?auto_129139 ?auto_129141 ) ) ( not ( = ?auto_129140 ?auto_129141 ) ) ( ON ?auto_129140 ?auto_129139 ) ( ON-TABLE ?auto_129141 ) ( ON ?auto_129138 ?auto_129140 ) ( CLEAR ?auto_129136 ) ( ON ?auto_129137 ?auto_129138 ) ( CLEAR ?auto_129137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129141 ?auto_129139 ?auto_129140 ?auto_129138 )
      ( MAKE-2PILE ?auto_129134 ?auto_129135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129158 - BLOCK
      ?auto_129159 - BLOCK
    )
    :vars
    (
      ?auto_129164 - BLOCK
      ?auto_129163 - BLOCK
      ?auto_129165 - BLOCK
      ?auto_129162 - BLOCK
      ?auto_129160 - BLOCK
      ?auto_129161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129158 ) ( not ( = ?auto_129158 ?auto_129159 ) ) ( not ( = ?auto_129158 ?auto_129164 ) ) ( not ( = ?auto_129159 ?auto_129164 ) ) ( not ( = ?auto_129158 ?auto_129163 ) ) ( not ( = ?auto_129158 ?auto_129165 ) ) ( not ( = ?auto_129159 ?auto_129163 ) ) ( not ( = ?auto_129159 ?auto_129165 ) ) ( not ( = ?auto_129164 ?auto_129163 ) ) ( not ( = ?auto_129164 ?auto_129165 ) ) ( not ( = ?auto_129163 ?auto_129165 ) ) ( not ( = ?auto_129162 ?auto_129160 ) ) ( not ( = ?auto_129162 ?auto_129165 ) ) ( not ( = ?auto_129160 ?auto_129165 ) ) ( not ( = ?auto_129158 ?auto_129160 ) ) ( not ( = ?auto_129158 ?auto_129162 ) ) ( not ( = ?auto_129159 ?auto_129160 ) ) ( not ( = ?auto_129159 ?auto_129162 ) ) ( not ( = ?auto_129164 ?auto_129160 ) ) ( not ( = ?auto_129164 ?auto_129162 ) ) ( not ( = ?auto_129163 ?auto_129160 ) ) ( not ( = ?auto_129163 ?auto_129162 ) ) ( ON ?auto_129162 ?auto_129161 ) ( not ( = ?auto_129158 ?auto_129161 ) ) ( not ( = ?auto_129159 ?auto_129161 ) ) ( not ( = ?auto_129164 ?auto_129161 ) ) ( not ( = ?auto_129163 ?auto_129161 ) ) ( not ( = ?auto_129165 ?auto_129161 ) ) ( not ( = ?auto_129162 ?auto_129161 ) ) ( not ( = ?auto_129160 ?auto_129161 ) ) ( ON ?auto_129160 ?auto_129162 ) ( ON-TABLE ?auto_129161 ) ( ON ?auto_129165 ?auto_129160 ) ( ON ?auto_129163 ?auto_129165 ) ( ON ?auto_129164 ?auto_129163 ) ( CLEAR ?auto_129164 ) ( HOLDING ?auto_129159 ) ( CLEAR ?auto_129158 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129158 ?auto_129159 ?auto_129164 )
      ( MAKE-2PILE ?auto_129158 ?auto_129159 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129166 - BLOCK
      ?auto_129167 - BLOCK
    )
    :vars
    (
      ?auto_129169 - BLOCK
      ?auto_129170 - BLOCK
      ?auto_129168 - BLOCK
      ?auto_129172 - BLOCK
      ?auto_129173 - BLOCK
      ?auto_129171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129166 ) ( not ( = ?auto_129166 ?auto_129167 ) ) ( not ( = ?auto_129166 ?auto_129169 ) ) ( not ( = ?auto_129167 ?auto_129169 ) ) ( not ( = ?auto_129166 ?auto_129170 ) ) ( not ( = ?auto_129166 ?auto_129168 ) ) ( not ( = ?auto_129167 ?auto_129170 ) ) ( not ( = ?auto_129167 ?auto_129168 ) ) ( not ( = ?auto_129169 ?auto_129170 ) ) ( not ( = ?auto_129169 ?auto_129168 ) ) ( not ( = ?auto_129170 ?auto_129168 ) ) ( not ( = ?auto_129172 ?auto_129173 ) ) ( not ( = ?auto_129172 ?auto_129168 ) ) ( not ( = ?auto_129173 ?auto_129168 ) ) ( not ( = ?auto_129166 ?auto_129173 ) ) ( not ( = ?auto_129166 ?auto_129172 ) ) ( not ( = ?auto_129167 ?auto_129173 ) ) ( not ( = ?auto_129167 ?auto_129172 ) ) ( not ( = ?auto_129169 ?auto_129173 ) ) ( not ( = ?auto_129169 ?auto_129172 ) ) ( not ( = ?auto_129170 ?auto_129173 ) ) ( not ( = ?auto_129170 ?auto_129172 ) ) ( ON ?auto_129172 ?auto_129171 ) ( not ( = ?auto_129166 ?auto_129171 ) ) ( not ( = ?auto_129167 ?auto_129171 ) ) ( not ( = ?auto_129169 ?auto_129171 ) ) ( not ( = ?auto_129170 ?auto_129171 ) ) ( not ( = ?auto_129168 ?auto_129171 ) ) ( not ( = ?auto_129172 ?auto_129171 ) ) ( not ( = ?auto_129173 ?auto_129171 ) ) ( ON ?auto_129173 ?auto_129172 ) ( ON-TABLE ?auto_129171 ) ( ON ?auto_129168 ?auto_129173 ) ( ON ?auto_129170 ?auto_129168 ) ( ON ?auto_129169 ?auto_129170 ) ( CLEAR ?auto_129166 ) ( ON ?auto_129167 ?auto_129169 ) ( CLEAR ?auto_129167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129171 ?auto_129172 ?auto_129173 ?auto_129168 ?auto_129170 ?auto_129169 )
      ( MAKE-2PILE ?auto_129166 ?auto_129167 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129174 - BLOCK
      ?auto_129175 - BLOCK
    )
    :vars
    (
      ?auto_129178 - BLOCK
      ?auto_129177 - BLOCK
      ?auto_129180 - BLOCK
      ?auto_129181 - BLOCK
      ?auto_129179 - BLOCK
      ?auto_129176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129174 ?auto_129175 ) ) ( not ( = ?auto_129174 ?auto_129178 ) ) ( not ( = ?auto_129175 ?auto_129178 ) ) ( not ( = ?auto_129174 ?auto_129177 ) ) ( not ( = ?auto_129174 ?auto_129180 ) ) ( not ( = ?auto_129175 ?auto_129177 ) ) ( not ( = ?auto_129175 ?auto_129180 ) ) ( not ( = ?auto_129178 ?auto_129177 ) ) ( not ( = ?auto_129178 ?auto_129180 ) ) ( not ( = ?auto_129177 ?auto_129180 ) ) ( not ( = ?auto_129181 ?auto_129179 ) ) ( not ( = ?auto_129181 ?auto_129180 ) ) ( not ( = ?auto_129179 ?auto_129180 ) ) ( not ( = ?auto_129174 ?auto_129179 ) ) ( not ( = ?auto_129174 ?auto_129181 ) ) ( not ( = ?auto_129175 ?auto_129179 ) ) ( not ( = ?auto_129175 ?auto_129181 ) ) ( not ( = ?auto_129178 ?auto_129179 ) ) ( not ( = ?auto_129178 ?auto_129181 ) ) ( not ( = ?auto_129177 ?auto_129179 ) ) ( not ( = ?auto_129177 ?auto_129181 ) ) ( ON ?auto_129181 ?auto_129176 ) ( not ( = ?auto_129174 ?auto_129176 ) ) ( not ( = ?auto_129175 ?auto_129176 ) ) ( not ( = ?auto_129178 ?auto_129176 ) ) ( not ( = ?auto_129177 ?auto_129176 ) ) ( not ( = ?auto_129180 ?auto_129176 ) ) ( not ( = ?auto_129181 ?auto_129176 ) ) ( not ( = ?auto_129179 ?auto_129176 ) ) ( ON ?auto_129179 ?auto_129181 ) ( ON-TABLE ?auto_129176 ) ( ON ?auto_129180 ?auto_129179 ) ( ON ?auto_129177 ?auto_129180 ) ( ON ?auto_129178 ?auto_129177 ) ( ON ?auto_129175 ?auto_129178 ) ( CLEAR ?auto_129175 ) ( HOLDING ?auto_129174 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129174 )
      ( MAKE-2PILE ?auto_129174 ?auto_129175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_129182 - BLOCK
      ?auto_129183 - BLOCK
    )
    :vars
    (
      ?auto_129185 - BLOCK
      ?auto_129187 - BLOCK
      ?auto_129189 - BLOCK
      ?auto_129186 - BLOCK
      ?auto_129184 - BLOCK
      ?auto_129188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129182 ?auto_129183 ) ) ( not ( = ?auto_129182 ?auto_129185 ) ) ( not ( = ?auto_129183 ?auto_129185 ) ) ( not ( = ?auto_129182 ?auto_129187 ) ) ( not ( = ?auto_129182 ?auto_129189 ) ) ( not ( = ?auto_129183 ?auto_129187 ) ) ( not ( = ?auto_129183 ?auto_129189 ) ) ( not ( = ?auto_129185 ?auto_129187 ) ) ( not ( = ?auto_129185 ?auto_129189 ) ) ( not ( = ?auto_129187 ?auto_129189 ) ) ( not ( = ?auto_129186 ?auto_129184 ) ) ( not ( = ?auto_129186 ?auto_129189 ) ) ( not ( = ?auto_129184 ?auto_129189 ) ) ( not ( = ?auto_129182 ?auto_129184 ) ) ( not ( = ?auto_129182 ?auto_129186 ) ) ( not ( = ?auto_129183 ?auto_129184 ) ) ( not ( = ?auto_129183 ?auto_129186 ) ) ( not ( = ?auto_129185 ?auto_129184 ) ) ( not ( = ?auto_129185 ?auto_129186 ) ) ( not ( = ?auto_129187 ?auto_129184 ) ) ( not ( = ?auto_129187 ?auto_129186 ) ) ( ON ?auto_129186 ?auto_129188 ) ( not ( = ?auto_129182 ?auto_129188 ) ) ( not ( = ?auto_129183 ?auto_129188 ) ) ( not ( = ?auto_129185 ?auto_129188 ) ) ( not ( = ?auto_129187 ?auto_129188 ) ) ( not ( = ?auto_129189 ?auto_129188 ) ) ( not ( = ?auto_129186 ?auto_129188 ) ) ( not ( = ?auto_129184 ?auto_129188 ) ) ( ON ?auto_129184 ?auto_129186 ) ( ON-TABLE ?auto_129188 ) ( ON ?auto_129189 ?auto_129184 ) ( ON ?auto_129187 ?auto_129189 ) ( ON ?auto_129185 ?auto_129187 ) ( ON ?auto_129183 ?auto_129185 ) ( ON ?auto_129182 ?auto_129183 ) ( CLEAR ?auto_129182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129188 ?auto_129186 ?auto_129184 ?auto_129189 ?auto_129187 ?auto_129185 ?auto_129183 )
      ( MAKE-2PILE ?auto_129182 ?auto_129183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129195 - BLOCK
      ?auto_129196 - BLOCK
      ?auto_129197 - BLOCK
      ?auto_129198 - BLOCK
      ?auto_129199 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_129199 ) ( CLEAR ?auto_129198 ) ( ON-TABLE ?auto_129195 ) ( ON ?auto_129196 ?auto_129195 ) ( ON ?auto_129197 ?auto_129196 ) ( ON ?auto_129198 ?auto_129197 ) ( not ( = ?auto_129195 ?auto_129196 ) ) ( not ( = ?auto_129195 ?auto_129197 ) ) ( not ( = ?auto_129195 ?auto_129198 ) ) ( not ( = ?auto_129195 ?auto_129199 ) ) ( not ( = ?auto_129196 ?auto_129197 ) ) ( not ( = ?auto_129196 ?auto_129198 ) ) ( not ( = ?auto_129196 ?auto_129199 ) ) ( not ( = ?auto_129197 ?auto_129198 ) ) ( not ( = ?auto_129197 ?auto_129199 ) ) ( not ( = ?auto_129198 ?auto_129199 ) ) )
    :subtasks
    ( ( !STACK ?auto_129199 ?auto_129198 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129200 - BLOCK
      ?auto_129201 - BLOCK
      ?auto_129202 - BLOCK
      ?auto_129203 - BLOCK
      ?auto_129204 - BLOCK
    )
    :vars
    (
      ?auto_129205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_129203 ) ( ON-TABLE ?auto_129200 ) ( ON ?auto_129201 ?auto_129200 ) ( ON ?auto_129202 ?auto_129201 ) ( ON ?auto_129203 ?auto_129202 ) ( not ( = ?auto_129200 ?auto_129201 ) ) ( not ( = ?auto_129200 ?auto_129202 ) ) ( not ( = ?auto_129200 ?auto_129203 ) ) ( not ( = ?auto_129200 ?auto_129204 ) ) ( not ( = ?auto_129201 ?auto_129202 ) ) ( not ( = ?auto_129201 ?auto_129203 ) ) ( not ( = ?auto_129201 ?auto_129204 ) ) ( not ( = ?auto_129202 ?auto_129203 ) ) ( not ( = ?auto_129202 ?auto_129204 ) ) ( not ( = ?auto_129203 ?auto_129204 ) ) ( ON ?auto_129204 ?auto_129205 ) ( CLEAR ?auto_129204 ) ( HAND-EMPTY ) ( not ( = ?auto_129200 ?auto_129205 ) ) ( not ( = ?auto_129201 ?auto_129205 ) ) ( not ( = ?auto_129202 ?auto_129205 ) ) ( not ( = ?auto_129203 ?auto_129205 ) ) ( not ( = ?auto_129204 ?auto_129205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129204 ?auto_129205 )
      ( MAKE-5PILE ?auto_129200 ?auto_129201 ?auto_129202 ?auto_129203 ?auto_129204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129206 - BLOCK
      ?auto_129207 - BLOCK
      ?auto_129208 - BLOCK
      ?auto_129209 - BLOCK
      ?auto_129210 - BLOCK
    )
    :vars
    (
      ?auto_129211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129206 ) ( ON ?auto_129207 ?auto_129206 ) ( ON ?auto_129208 ?auto_129207 ) ( not ( = ?auto_129206 ?auto_129207 ) ) ( not ( = ?auto_129206 ?auto_129208 ) ) ( not ( = ?auto_129206 ?auto_129209 ) ) ( not ( = ?auto_129206 ?auto_129210 ) ) ( not ( = ?auto_129207 ?auto_129208 ) ) ( not ( = ?auto_129207 ?auto_129209 ) ) ( not ( = ?auto_129207 ?auto_129210 ) ) ( not ( = ?auto_129208 ?auto_129209 ) ) ( not ( = ?auto_129208 ?auto_129210 ) ) ( not ( = ?auto_129209 ?auto_129210 ) ) ( ON ?auto_129210 ?auto_129211 ) ( CLEAR ?auto_129210 ) ( not ( = ?auto_129206 ?auto_129211 ) ) ( not ( = ?auto_129207 ?auto_129211 ) ) ( not ( = ?auto_129208 ?auto_129211 ) ) ( not ( = ?auto_129209 ?auto_129211 ) ) ( not ( = ?auto_129210 ?auto_129211 ) ) ( HOLDING ?auto_129209 ) ( CLEAR ?auto_129208 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129206 ?auto_129207 ?auto_129208 ?auto_129209 )
      ( MAKE-5PILE ?auto_129206 ?auto_129207 ?auto_129208 ?auto_129209 ?auto_129210 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129212 - BLOCK
      ?auto_129213 - BLOCK
      ?auto_129214 - BLOCK
      ?auto_129215 - BLOCK
      ?auto_129216 - BLOCK
    )
    :vars
    (
      ?auto_129217 - BLOCK
      ?auto_129218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129212 ) ( ON ?auto_129213 ?auto_129212 ) ( ON ?auto_129214 ?auto_129213 ) ( not ( = ?auto_129212 ?auto_129213 ) ) ( not ( = ?auto_129212 ?auto_129214 ) ) ( not ( = ?auto_129212 ?auto_129215 ) ) ( not ( = ?auto_129212 ?auto_129216 ) ) ( not ( = ?auto_129213 ?auto_129214 ) ) ( not ( = ?auto_129213 ?auto_129215 ) ) ( not ( = ?auto_129213 ?auto_129216 ) ) ( not ( = ?auto_129214 ?auto_129215 ) ) ( not ( = ?auto_129214 ?auto_129216 ) ) ( not ( = ?auto_129215 ?auto_129216 ) ) ( ON ?auto_129216 ?auto_129217 ) ( not ( = ?auto_129212 ?auto_129217 ) ) ( not ( = ?auto_129213 ?auto_129217 ) ) ( not ( = ?auto_129214 ?auto_129217 ) ) ( not ( = ?auto_129215 ?auto_129217 ) ) ( not ( = ?auto_129216 ?auto_129217 ) ) ( CLEAR ?auto_129214 ) ( ON ?auto_129215 ?auto_129216 ) ( CLEAR ?auto_129215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129218 ) ( ON ?auto_129217 ?auto_129218 ) ( not ( = ?auto_129218 ?auto_129217 ) ) ( not ( = ?auto_129218 ?auto_129216 ) ) ( not ( = ?auto_129218 ?auto_129215 ) ) ( not ( = ?auto_129212 ?auto_129218 ) ) ( not ( = ?auto_129213 ?auto_129218 ) ) ( not ( = ?auto_129214 ?auto_129218 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129218 ?auto_129217 ?auto_129216 )
      ( MAKE-5PILE ?auto_129212 ?auto_129213 ?auto_129214 ?auto_129215 ?auto_129216 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129219 - BLOCK
      ?auto_129220 - BLOCK
      ?auto_129221 - BLOCK
      ?auto_129222 - BLOCK
      ?auto_129223 - BLOCK
    )
    :vars
    (
      ?auto_129225 - BLOCK
      ?auto_129224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129219 ) ( ON ?auto_129220 ?auto_129219 ) ( not ( = ?auto_129219 ?auto_129220 ) ) ( not ( = ?auto_129219 ?auto_129221 ) ) ( not ( = ?auto_129219 ?auto_129222 ) ) ( not ( = ?auto_129219 ?auto_129223 ) ) ( not ( = ?auto_129220 ?auto_129221 ) ) ( not ( = ?auto_129220 ?auto_129222 ) ) ( not ( = ?auto_129220 ?auto_129223 ) ) ( not ( = ?auto_129221 ?auto_129222 ) ) ( not ( = ?auto_129221 ?auto_129223 ) ) ( not ( = ?auto_129222 ?auto_129223 ) ) ( ON ?auto_129223 ?auto_129225 ) ( not ( = ?auto_129219 ?auto_129225 ) ) ( not ( = ?auto_129220 ?auto_129225 ) ) ( not ( = ?auto_129221 ?auto_129225 ) ) ( not ( = ?auto_129222 ?auto_129225 ) ) ( not ( = ?auto_129223 ?auto_129225 ) ) ( ON ?auto_129222 ?auto_129223 ) ( CLEAR ?auto_129222 ) ( ON-TABLE ?auto_129224 ) ( ON ?auto_129225 ?auto_129224 ) ( not ( = ?auto_129224 ?auto_129225 ) ) ( not ( = ?auto_129224 ?auto_129223 ) ) ( not ( = ?auto_129224 ?auto_129222 ) ) ( not ( = ?auto_129219 ?auto_129224 ) ) ( not ( = ?auto_129220 ?auto_129224 ) ) ( not ( = ?auto_129221 ?auto_129224 ) ) ( HOLDING ?auto_129221 ) ( CLEAR ?auto_129220 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129219 ?auto_129220 ?auto_129221 )
      ( MAKE-5PILE ?auto_129219 ?auto_129220 ?auto_129221 ?auto_129222 ?auto_129223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129226 - BLOCK
      ?auto_129227 - BLOCK
      ?auto_129228 - BLOCK
      ?auto_129229 - BLOCK
      ?auto_129230 - BLOCK
    )
    :vars
    (
      ?auto_129231 - BLOCK
      ?auto_129232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129226 ) ( ON ?auto_129227 ?auto_129226 ) ( not ( = ?auto_129226 ?auto_129227 ) ) ( not ( = ?auto_129226 ?auto_129228 ) ) ( not ( = ?auto_129226 ?auto_129229 ) ) ( not ( = ?auto_129226 ?auto_129230 ) ) ( not ( = ?auto_129227 ?auto_129228 ) ) ( not ( = ?auto_129227 ?auto_129229 ) ) ( not ( = ?auto_129227 ?auto_129230 ) ) ( not ( = ?auto_129228 ?auto_129229 ) ) ( not ( = ?auto_129228 ?auto_129230 ) ) ( not ( = ?auto_129229 ?auto_129230 ) ) ( ON ?auto_129230 ?auto_129231 ) ( not ( = ?auto_129226 ?auto_129231 ) ) ( not ( = ?auto_129227 ?auto_129231 ) ) ( not ( = ?auto_129228 ?auto_129231 ) ) ( not ( = ?auto_129229 ?auto_129231 ) ) ( not ( = ?auto_129230 ?auto_129231 ) ) ( ON ?auto_129229 ?auto_129230 ) ( ON-TABLE ?auto_129232 ) ( ON ?auto_129231 ?auto_129232 ) ( not ( = ?auto_129232 ?auto_129231 ) ) ( not ( = ?auto_129232 ?auto_129230 ) ) ( not ( = ?auto_129232 ?auto_129229 ) ) ( not ( = ?auto_129226 ?auto_129232 ) ) ( not ( = ?auto_129227 ?auto_129232 ) ) ( not ( = ?auto_129228 ?auto_129232 ) ) ( CLEAR ?auto_129227 ) ( ON ?auto_129228 ?auto_129229 ) ( CLEAR ?auto_129228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129232 ?auto_129231 ?auto_129230 ?auto_129229 )
      ( MAKE-5PILE ?auto_129226 ?auto_129227 ?auto_129228 ?auto_129229 ?auto_129230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129233 - BLOCK
      ?auto_129234 - BLOCK
      ?auto_129235 - BLOCK
      ?auto_129236 - BLOCK
      ?auto_129237 - BLOCK
    )
    :vars
    (
      ?auto_129239 - BLOCK
      ?auto_129238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129233 ) ( not ( = ?auto_129233 ?auto_129234 ) ) ( not ( = ?auto_129233 ?auto_129235 ) ) ( not ( = ?auto_129233 ?auto_129236 ) ) ( not ( = ?auto_129233 ?auto_129237 ) ) ( not ( = ?auto_129234 ?auto_129235 ) ) ( not ( = ?auto_129234 ?auto_129236 ) ) ( not ( = ?auto_129234 ?auto_129237 ) ) ( not ( = ?auto_129235 ?auto_129236 ) ) ( not ( = ?auto_129235 ?auto_129237 ) ) ( not ( = ?auto_129236 ?auto_129237 ) ) ( ON ?auto_129237 ?auto_129239 ) ( not ( = ?auto_129233 ?auto_129239 ) ) ( not ( = ?auto_129234 ?auto_129239 ) ) ( not ( = ?auto_129235 ?auto_129239 ) ) ( not ( = ?auto_129236 ?auto_129239 ) ) ( not ( = ?auto_129237 ?auto_129239 ) ) ( ON ?auto_129236 ?auto_129237 ) ( ON-TABLE ?auto_129238 ) ( ON ?auto_129239 ?auto_129238 ) ( not ( = ?auto_129238 ?auto_129239 ) ) ( not ( = ?auto_129238 ?auto_129237 ) ) ( not ( = ?auto_129238 ?auto_129236 ) ) ( not ( = ?auto_129233 ?auto_129238 ) ) ( not ( = ?auto_129234 ?auto_129238 ) ) ( not ( = ?auto_129235 ?auto_129238 ) ) ( ON ?auto_129235 ?auto_129236 ) ( CLEAR ?auto_129235 ) ( HOLDING ?auto_129234 ) ( CLEAR ?auto_129233 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129233 ?auto_129234 )
      ( MAKE-5PILE ?auto_129233 ?auto_129234 ?auto_129235 ?auto_129236 ?auto_129237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129240 - BLOCK
      ?auto_129241 - BLOCK
      ?auto_129242 - BLOCK
      ?auto_129243 - BLOCK
      ?auto_129244 - BLOCK
    )
    :vars
    (
      ?auto_129246 - BLOCK
      ?auto_129245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129240 ) ( not ( = ?auto_129240 ?auto_129241 ) ) ( not ( = ?auto_129240 ?auto_129242 ) ) ( not ( = ?auto_129240 ?auto_129243 ) ) ( not ( = ?auto_129240 ?auto_129244 ) ) ( not ( = ?auto_129241 ?auto_129242 ) ) ( not ( = ?auto_129241 ?auto_129243 ) ) ( not ( = ?auto_129241 ?auto_129244 ) ) ( not ( = ?auto_129242 ?auto_129243 ) ) ( not ( = ?auto_129242 ?auto_129244 ) ) ( not ( = ?auto_129243 ?auto_129244 ) ) ( ON ?auto_129244 ?auto_129246 ) ( not ( = ?auto_129240 ?auto_129246 ) ) ( not ( = ?auto_129241 ?auto_129246 ) ) ( not ( = ?auto_129242 ?auto_129246 ) ) ( not ( = ?auto_129243 ?auto_129246 ) ) ( not ( = ?auto_129244 ?auto_129246 ) ) ( ON ?auto_129243 ?auto_129244 ) ( ON-TABLE ?auto_129245 ) ( ON ?auto_129246 ?auto_129245 ) ( not ( = ?auto_129245 ?auto_129246 ) ) ( not ( = ?auto_129245 ?auto_129244 ) ) ( not ( = ?auto_129245 ?auto_129243 ) ) ( not ( = ?auto_129240 ?auto_129245 ) ) ( not ( = ?auto_129241 ?auto_129245 ) ) ( not ( = ?auto_129242 ?auto_129245 ) ) ( ON ?auto_129242 ?auto_129243 ) ( CLEAR ?auto_129240 ) ( ON ?auto_129241 ?auto_129242 ) ( CLEAR ?auto_129241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129245 ?auto_129246 ?auto_129244 ?auto_129243 ?auto_129242 )
      ( MAKE-5PILE ?auto_129240 ?auto_129241 ?auto_129242 ?auto_129243 ?auto_129244 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129247 - BLOCK
      ?auto_129248 - BLOCK
      ?auto_129249 - BLOCK
      ?auto_129250 - BLOCK
      ?auto_129251 - BLOCK
    )
    :vars
    (
      ?auto_129252 - BLOCK
      ?auto_129253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129247 ?auto_129248 ) ) ( not ( = ?auto_129247 ?auto_129249 ) ) ( not ( = ?auto_129247 ?auto_129250 ) ) ( not ( = ?auto_129247 ?auto_129251 ) ) ( not ( = ?auto_129248 ?auto_129249 ) ) ( not ( = ?auto_129248 ?auto_129250 ) ) ( not ( = ?auto_129248 ?auto_129251 ) ) ( not ( = ?auto_129249 ?auto_129250 ) ) ( not ( = ?auto_129249 ?auto_129251 ) ) ( not ( = ?auto_129250 ?auto_129251 ) ) ( ON ?auto_129251 ?auto_129252 ) ( not ( = ?auto_129247 ?auto_129252 ) ) ( not ( = ?auto_129248 ?auto_129252 ) ) ( not ( = ?auto_129249 ?auto_129252 ) ) ( not ( = ?auto_129250 ?auto_129252 ) ) ( not ( = ?auto_129251 ?auto_129252 ) ) ( ON ?auto_129250 ?auto_129251 ) ( ON-TABLE ?auto_129253 ) ( ON ?auto_129252 ?auto_129253 ) ( not ( = ?auto_129253 ?auto_129252 ) ) ( not ( = ?auto_129253 ?auto_129251 ) ) ( not ( = ?auto_129253 ?auto_129250 ) ) ( not ( = ?auto_129247 ?auto_129253 ) ) ( not ( = ?auto_129248 ?auto_129253 ) ) ( not ( = ?auto_129249 ?auto_129253 ) ) ( ON ?auto_129249 ?auto_129250 ) ( ON ?auto_129248 ?auto_129249 ) ( CLEAR ?auto_129248 ) ( HOLDING ?auto_129247 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129247 )
      ( MAKE-5PILE ?auto_129247 ?auto_129248 ?auto_129249 ?auto_129250 ?auto_129251 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129254 - BLOCK
      ?auto_129255 - BLOCK
      ?auto_129256 - BLOCK
      ?auto_129257 - BLOCK
      ?auto_129258 - BLOCK
    )
    :vars
    (
      ?auto_129260 - BLOCK
      ?auto_129259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129254 ?auto_129255 ) ) ( not ( = ?auto_129254 ?auto_129256 ) ) ( not ( = ?auto_129254 ?auto_129257 ) ) ( not ( = ?auto_129254 ?auto_129258 ) ) ( not ( = ?auto_129255 ?auto_129256 ) ) ( not ( = ?auto_129255 ?auto_129257 ) ) ( not ( = ?auto_129255 ?auto_129258 ) ) ( not ( = ?auto_129256 ?auto_129257 ) ) ( not ( = ?auto_129256 ?auto_129258 ) ) ( not ( = ?auto_129257 ?auto_129258 ) ) ( ON ?auto_129258 ?auto_129260 ) ( not ( = ?auto_129254 ?auto_129260 ) ) ( not ( = ?auto_129255 ?auto_129260 ) ) ( not ( = ?auto_129256 ?auto_129260 ) ) ( not ( = ?auto_129257 ?auto_129260 ) ) ( not ( = ?auto_129258 ?auto_129260 ) ) ( ON ?auto_129257 ?auto_129258 ) ( ON-TABLE ?auto_129259 ) ( ON ?auto_129260 ?auto_129259 ) ( not ( = ?auto_129259 ?auto_129260 ) ) ( not ( = ?auto_129259 ?auto_129258 ) ) ( not ( = ?auto_129259 ?auto_129257 ) ) ( not ( = ?auto_129254 ?auto_129259 ) ) ( not ( = ?auto_129255 ?auto_129259 ) ) ( not ( = ?auto_129256 ?auto_129259 ) ) ( ON ?auto_129256 ?auto_129257 ) ( ON ?auto_129255 ?auto_129256 ) ( ON ?auto_129254 ?auto_129255 ) ( CLEAR ?auto_129254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129259 ?auto_129260 ?auto_129258 ?auto_129257 ?auto_129256 ?auto_129255 )
      ( MAKE-5PILE ?auto_129254 ?auto_129255 ?auto_129256 ?auto_129257 ?auto_129258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129261 - BLOCK
      ?auto_129262 - BLOCK
      ?auto_129263 - BLOCK
      ?auto_129264 - BLOCK
      ?auto_129265 - BLOCK
    )
    :vars
    (
      ?auto_129267 - BLOCK
      ?auto_129266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129261 ?auto_129262 ) ) ( not ( = ?auto_129261 ?auto_129263 ) ) ( not ( = ?auto_129261 ?auto_129264 ) ) ( not ( = ?auto_129261 ?auto_129265 ) ) ( not ( = ?auto_129262 ?auto_129263 ) ) ( not ( = ?auto_129262 ?auto_129264 ) ) ( not ( = ?auto_129262 ?auto_129265 ) ) ( not ( = ?auto_129263 ?auto_129264 ) ) ( not ( = ?auto_129263 ?auto_129265 ) ) ( not ( = ?auto_129264 ?auto_129265 ) ) ( ON ?auto_129265 ?auto_129267 ) ( not ( = ?auto_129261 ?auto_129267 ) ) ( not ( = ?auto_129262 ?auto_129267 ) ) ( not ( = ?auto_129263 ?auto_129267 ) ) ( not ( = ?auto_129264 ?auto_129267 ) ) ( not ( = ?auto_129265 ?auto_129267 ) ) ( ON ?auto_129264 ?auto_129265 ) ( ON-TABLE ?auto_129266 ) ( ON ?auto_129267 ?auto_129266 ) ( not ( = ?auto_129266 ?auto_129267 ) ) ( not ( = ?auto_129266 ?auto_129265 ) ) ( not ( = ?auto_129266 ?auto_129264 ) ) ( not ( = ?auto_129261 ?auto_129266 ) ) ( not ( = ?auto_129262 ?auto_129266 ) ) ( not ( = ?auto_129263 ?auto_129266 ) ) ( ON ?auto_129263 ?auto_129264 ) ( ON ?auto_129262 ?auto_129263 ) ( HOLDING ?auto_129261 ) ( CLEAR ?auto_129262 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129266 ?auto_129267 ?auto_129265 ?auto_129264 ?auto_129263 ?auto_129262 ?auto_129261 )
      ( MAKE-5PILE ?auto_129261 ?auto_129262 ?auto_129263 ?auto_129264 ?auto_129265 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129268 - BLOCK
      ?auto_129269 - BLOCK
      ?auto_129270 - BLOCK
      ?auto_129271 - BLOCK
      ?auto_129272 - BLOCK
    )
    :vars
    (
      ?auto_129273 - BLOCK
      ?auto_129274 - BLOCK
      ?auto_129275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129268 ?auto_129269 ) ) ( not ( = ?auto_129268 ?auto_129270 ) ) ( not ( = ?auto_129268 ?auto_129271 ) ) ( not ( = ?auto_129268 ?auto_129272 ) ) ( not ( = ?auto_129269 ?auto_129270 ) ) ( not ( = ?auto_129269 ?auto_129271 ) ) ( not ( = ?auto_129269 ?auto_129272 ) ) ( not ( = ?auto_129270 ?auto_129271 ) ) ( not ( = ?auto_129270 ?auto_129272 ) ) ( not ( = ?auto_129271 ?auto_129272 ) ) ( ON ?auto_129272 ?auto_129273 ) ( not ( = ?auto_129268 ?auto_129273 ) ) ( not ( = ?auto_129269 ?auto_129273 ) ) ( not ( = ?auto_129270 ?auto_129273 ) ) ( not ( = ?auto_129271 ?auto_129273 ) ) ( not ( = ?auto_129272 ?auto_129273 ) ) ( ON ?auto_129271 ?auto_129272 ) ( ON-TABLE ?auto_129274 ) ( ON ?auto_129273 ?auto_129274 ) ( not ( = ?auto_129274 ?auto_129273 ) ) ( not ( = ?auto_129274 ?auto_129272 ) ) ( not ( = ?auto_129274 ?auto_129271 ) ) ( not ( = ?auto_129268 ?auto_129274 ) ) ( not ( = ?auto_129269 ?auto_129274 ) ) ( not ( = ?auto_129270 ?auto_129274 ) ) ( ON ?auto_129270 ?auto_129271 ) ( ON ?auto_129269 ?auto_129270 ) ( CLEAR ?auto_129269 ) ( ON ?auto_129268 ?auto_129275 ) ( CLEAR ?auto_129268 ) ( HAND-EMPTY ) ( not ( = ?auto_129268 ?auto_129275 ) ) ( not ( = ?auto_129269 ?auto_129275 ) ) ( not ( = ?auto_129270 ?auto_129275 ) ) ( not ( = ?auto_129271 ?auto_129275 ) ) ( not ( = ?auto_129272 ?auto_129275 ) ) ( not ( = ?auto_129273 ?auto_129275 ) ) ( not ( = ?auto_129274 ?auto_129275 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129268 ?auto_129275 )
      ( MAKE-5PILE ?auto_129268 ?auto_129269 ?auto_129270 ?auto_129271 ?auto_129272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129276 - BLOCK
      ?auto_129277 - BLOCK
      ?auto_129278 - BLOCK
      ?auto_129279 - BLOCK
      ?auto_129280 - BLOCK
    )
    :vars
    (
      ?auto_129281 - BLOCK
      ?auto_129283 - BLOCK
      ?auto_129282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129276 ?auto_129277 ) ) ( not ( = ?auto_129276 ?auto_129278 ) ) ( not ( = ?auto_129276 ?auto_129279 ) ) ( not ( = ?auto_129276 ?auto_129280 ) ) ( not ( = ?auto_129277 ?auto_129278 ) ) ( not ( = ?auto_129277 ?auto_129279 ) ) ( not ( = ?auto_129277 ?auto_129280 ) ) ( not ( = ?auto_129278 ?auto_129279 ) ) ( not ( = ?auto_129278 ?auto_129280 ) ) ( not ( = ?auto_129279 ?auto_129280 ) ) ( ON ?auto_129280 ?auto_129281 ) ( not ( = ?auto_129276 ?auto_129281 ) ) ( not ( = ?auto_129277 ?auto_129281 ) ) ( not ( = ?auto_129278 ?auto_129281 ) ) ( not ( = ?auto_129279 ?auto_129281 ) ) ( not ( = ?auto_129280 ?auto_129281 ) ) ( ON ?auto_129279 ?auto_129280 ) ( ON-TABLE ?auto_129283 ) ( ON ?auto_129281 ?auto_129283 ) ( not ( = ?auto_129283 ?auto_129281 ) ) ( not ( = ?auto_129283 ?auto_129280 ) ) ( not ( = ?auto_129283 ?auto_129279 ) ) ( not ( = ?auto_129276 ?auto_129283 ) ) ( not ( = ?auto_129277 ?auto_129283 ) ) ( not ( = ?auto_129278 ?auto_129283 ) ) ( ON ?auto_129278 ?auto_129279 ) ( ON ?auto_129276 ?auto_129282 ) ( CLEAR ?auto_129276 ) ( not ( = ?auto_129276 ?auto_129282 ) ) ( not ( = ?auto_129277 ?auto_129282 ) ) ( not ( = ?auto_129278 ?auto_129282 ) ) ( not ( = ?auto_129279 ?auto_129282 ) ) ( not ( = ?auto_129280 ?auto_129282 ) ) ( not ( = ?auto_129281 ?auto_129282 ) ) ( not ( = ?auto_129283 ?auto_129282 ) ) ( HOLDING ?auto_129277 ) ( CLEAR ?auto_129278 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129283 ?auto_129281 ?auto_129280 ?auto_129279 ?auto_129278 ?auto_129277 )
      ( MAKE-5PILE ?auto_129276 ?auto_129277 ?auto_129278 ?auto_129279 ?auto_129280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129284 - BLOCK
      ?auto_129285 - BLOCK
      ?auto_129286 - BLOCK
      ?auto_129287 - BLOCK
      ?auto_129288 - BLOCK
    )
    :vars
    (
      ?auto_129290 - BLOCK
      ?auto_129289 - BLOCK
      ?auto_129291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129284 ?auto_129285 ) ) ( not ( = ?auto_129284 ?auto_129286 ) ) ( not ( = ?auto_129284 ?auto_129287 ) ) ( not ( = ?auto_129284 ?auto_129288 ) ) ( not ( = ?auto_129285 ?auto_129286 ) ) ( not ( = ?auto_129285 ?auto_129287 ) ) ( not ( = ?auto_129285 ?auto_129288 ) ) ( not ( = ?auto_129286 ?auto_129287 ) ) ( not ( = ?auto_129286 ?auto_129288 ) ) ( not ( = ?auto_129287 ?auto_129288 ) ) ( ON ?auto_129288 ?auto_129290 ) ( not ( = ?auto_129284 ?auto_129290 ) ) ( not ( = ?auto_129285 ?auto_129290 ) ) ( not ( = ?auto_129286 ?auto_129290 ) ) ( not ( = ?auto_129287 ?auto_129290 ) ) ( not ( = ?auto_129288 ?auto_129290 ) ) ( ON ?auto_129287 ?auto_129288 ) ( ON-TABLE ?auto_129289 ) ( ON ?auto_129290 ?auto_129289 ) ( not ( = ?auto_129289 ?auto_129290 ) ) ( not ( = ?auto_129289 ?auto_129288 ) ) ( not ( = ?auto_129289 ?auto_129287 ) ) ( not ( = ?auto_129284 ?auto_129289 ) ) ( not ( = ?auto_129285 ?auto_129289 ) ) ( not ( = ?auto_129286 ?auto_129289 ) ) ( ON ?auto_129286 ?auto_129287 ) ( ON ?auto_129284 ?auto_129291 ) ( not ( = ?auto_129284 ?auto_129291 ) ) ( not ( = ?auto_129285 ?auto_129291 ) ) ( not ( = ?auto_129286 ?auto_129291 ) ) ( not ( = ?auto_129287 ?auto_129291 ) ) ( not ( = ?auto_129288 ?auto_129291 ) ) ( not ( = ?auto_129290 ?auto_129291 ) ) ( not ( = ?auto_129289 ?auto_129291 ) ) ( CLEAR ?auto_129286 ) ( ON ?auto_129285 ?auto_129284 ) ( CLEAR ?auto_129285 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129291 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129291 ?auto_129284 )
      ( MAKE-5PILE ?auto_129284 ?auto_129285 ?auto_129286 ?auto_129287 ?auto_129288 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129292 - BLOCK
      ?auto_129293 - BLOCK
      ?auto_129294 - BLOCK
      ?auto_129295 - BLOCK
      ?auto_129296 - BLOCK
    )
    :vars
    (
      ?auto_129299 - BLOCK
      ?auto_129297 - BLOCK
      ?auto_129298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129292 ?auto_129293 ) ) ( not ( = ?auto_129292 ?auto_129294 ) ) ( not ( = ?auto_129292 ?auto_129295 ) ) ( not ( = ?auto_129292 ?auto_129296 ) ) ( not ( = ?auto_129293 ?auto_129294 ) ) ( not ( = ?auto_129293 ?auto_129295 ) ) ( not ( = ?auto_129293 ?auto_129296 ) ) ( not ( = ?auto_129294 ?auto_129295 ) ) ( not ( = ?auto_129294 ?auto_129296 ) ) ( not ( = ?auto_129295 ?auto_129296 ) ) ( ON ?auto_129296 ?auto_129299 ) ( not ( = ?auto_129292 ?auto_129299 ) ) ( not ( = ?auto_129293 ?auto_129299 ) ) ( not ( = ?auto_129294 ?auto_129299 ) ) ( not ( = ?auto_129295 ?auto_129299 ) ) ( not ( = ?auto_129296 ?auto_129299 ) ) ( ON ?auto_129295 ?auto_129296 ) ( ON-TABLE ?auto_129297 ) ( ON ?auto_129299 ?auto_129297 ) ( not ( = ?auto_129297 ?auto_129299 ) ) ( not ( = ?auto_129297 ?auto_129296 ) ) ( not ( = ?auto_129297 ?auto_129295 ) ) ( not ( = ?auto_129292 ?auto_129297 ) ) ( not ( = ?auto_129293 ?auto_129297 ) ) ( not ( = ?auto_129294 ?auto_129297 ) ) ( ON ?auto_129292 ?auto_129298 ) ( not ( = ?auto_129292 ?auto_129298 ) ) ( not ( = ?auto_129293 ?auto_129298 ) ) ( not ( = ?auto_129294 ?auto_129298 ) ) ( not ( = ?auto_129295 ?auto_129298 ) ) ( not ( = ?auto_129296 ?auto_129298 ) ) ( not ( = ?auto_129299 ?auto_129298 ) ) ( not ( = ?auto_129297 ?auto_129298 ) ) ( ON ?auto_129293 ?auto_129292 ) ( CLEAR ?auto_129293 ) ( ON-TABLE ?auto_129298 ) ( HOLDING ?auto_129294 ) ( CLEAR ?auto_129295 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129297 ?auto_129299 ?auto_129296 ?auto_129295 ?auto_129294 )
      ( MAKE-5PILE ?auto_129292 ?auto_129293 ?auto_129294 ?auto_129295 ?auto_129296 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129300 - BLOCK
      ?auto_129301 - BLOCK
      ?auto_129302 - BLOCK
      ?auto_129303 - BLOCK
      ?auto_129304 - BLOCK
    )
    :vars
    (
      ?auto_129307 - BLOCK
      ?auto_129306 - BLOCK
      ?auto_129305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129300 ?auto_129301 ) ) ( not ( = ?auto_129300 ?auto_129302 ) ) ( not ( = ?auto_129300 ?auto_129303 ) ) ( not ( = ?auto_129300 ?auto_129304 ) ) ( not ( = ?auto_129301 ?auto_129302 ) ) ( not ( = ?auto_129301 ?auto_129303 ) ) ( not ( = ?auto_129301 ?auto_129304 ) ) ( not ( = ?auto_129302 ?auto_129303 ) ) ( not ( = ?auto_129302 ?auto_129304 ) ) ( not ( = ?auto_129303 ?auto_129304 ) ) ( ON ?auto_129304 ?auto_129307 ) ( not ( = ?auto_129300 ?auto_129307 ) ) ( not ( = ?auto_129301 ?auto_129307 ) ) ( not ( = ?auto_129302 ?auto_129307 ) ) ( not ( = ?auto_129303 ?auto_129307 ) ) ( not ( = ?auto_129304 ?auto_129307 ) ) ( ON ?auto_129303 ?auto_129304 ) ( ON-TABLE ?auto_129306 ) ( ON ?auto_129307 ?auto_129306 ) ( not ( = ?auto_129306 ?auto_129307 ) ) ( not ( = ?auto_129306 ?auto_129304 ) ) ( not ( = ?auto_129306 ?auto_129303 ) ) ( not ( = ?auto_129300 ?auto_129306 ) ) ( not ( = ?auto_129301 ?auto_129306 ) ) ( not ( = ?auto_129302 ?auto_129306 ) ) ( ON ?auto_129300 ?auto_129305 ) ( not ( = ?auto_129300 ?auto_129305 ) ) ( not ( = ?auto_129301 ?auto_129305 ) ) ( not ( = ?auto_129302 ?auto_129305 ) ) ( not ( = ?auto_129303 ?auto_129305 ) ) ( not ( = ?auto_129304 ?auto_129305 ) ) ( not ( = ?auto_129307 ?auto_129305 ) ) ( not ( = ?auto_129306 ?auto_129305 ) ) ( ON ?auto_129301 ?auto_129300 ) ( ON-TABLE ?auto_129305 ) ( CLEAR ?auto_129303 ) ( ON ?auto_129302 ?auto_129301 ) ( CLEAR ?auto_129302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129305 ?auto_129300 ?auto_129301 )
      ( MAKE-5PILE ?auto_129300 ?auto_129301 ?auto_129302 ?auto_129303 ?auto_129304 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129308 - BLOCK
      ?auto_129309 - BLOCK
      ?auto_129310 - BLOCK
      ?auto_129311 - BLOCK
      ?auto_129312 - BLOCK
    )
    :vars
    (
      ?auto_129313 - BLOCK
      ?auto_129314 - BLOCK
      ?auto_129315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129308 ?auto_129309 ) ) ( not ( = ?auto_129308 ?auto_129310 ) ) ( not ( = ?auto_129308 ?auto_129311 ) ) ( not ( = ?auto_129308 ?auto_129312 ) ) ( not ( = ?auto_129309 ?auto_129310 ) ) ( not ( = ?auto_129309 ?auto_129311 ) ) ( not ( = ?auto_129309 ?auto_129312 ) ) ( not ( = ?auto_129310 ?auto_129311 ) ) ( not ( = ?auto_129310 ?auto_129312 ) ) ( not ( = ?auto_129311 ?auto_129312 ) ) ( ON ?auto_129312 ?auto_129313 ) ( not ( = ?auto_129308 ?auto_129313 ) ) ( not ( = ?auto_129309 ?auto_129313 ) ) ( not ( = ?auto_129310 ?auto_129313 ) ) ( not ( = ?auto_129311 ?auto_129313 ) ) ( not ( = ?auto_129312 ?auto_129313 ) ) ( ON-TABLE ?auto_129314 ) ( ON ?auto_129313 ?auto_129314 ) ( not ( = ?auto_129314 ?auto_129313 ) ) ( not ( = ?auto_129314 ?auto_129312 ) ) ( not ( = ?auto_129314 ?auto_129311 ) ) ( not ( = ?auto_129308 ?auto_129314 ) ) ( not ( = ?auto_129309 ?auto_129314 ) ) ( not ( = ?auto_129310 ?auto_129314 ) ) ( ON ?auto_129308 ?auto_129315 ) ( not ( = ?auto_129308 ?auto_129315 ) ) ( not ( = ?auto_129309 ?auto_129315 ) ) ( not ( = ?auto_129310 ?auto_129315 ) ) ( not ( = ?auto_129311 ?auto_129315 ) ) ( not ( = ?auto_129312 ?auto_129315 ) ) ( not ( = ?auto_129313 ?auto_129315 ) ) ( not ( = ?auto_129314 ?auto_129315 ) ) ( ON ?auto_129309 ?auto_129308 ) ( ON-TABLE ?auto_129315 ) ( ON ?auto_129310 ?auto_129309 ) ( CLEAR ?auto_129310 ) ( HOLDING ?auto_129311 ) ( CLEAR ?auto_129312 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129314 ?auto_129313 ?auto_129312 ?auto_129311 )
      ( MAKE-5PILE ?auto_129308 ?auto_129309 ?auto_129310 ?auto_129311 ?auto_129312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129316 - BLOCK
      ?auto_129317 - BLOCK
      ?auto_129318 - BLOCK
      ?auto_129319 - BLOCK
      ?auto_129320 - BLOCK
    )
    :vars
    (
      ?auto_129321 - BLOCK
      ?auto_129323 - BLOCK
      ?auto_129322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129316 ?auto_129317 ) ) ( not ( = ?auto_129316 ?auto_129318 ) ) ( not ( = ?auto_129316 ?auto_129319 ) ) ( not ( = ?auto_129316 ?auto_129320 ) ) ( not ( = ?auto_129317 ?auto_129318 ) ) ( not ( = ?auto_129317 ?auto_129319 ) ) ( not ( = ?auto_129317 ?auto_129320 ) ) ( not ( = ?auto_129318 ?auto_129319 ) ) ( not ( = ?auto_129318 ?auto_129320 ) ) ( not ( = ?auto_129319 ?auto_129320 ) ) ( ON ?auto_129320 ?auto_129321 ) ( not ( = ?auto_129316 ?auto_129321 ) ) ( not ( = ?auto_129317 ?auto_129321 ) ) ( not ( = ?auto_129318 ?auto_129321 ) ) ( not ( = ?auto_129319 ?auto_129321 ) ) ( not ( = ?auto_129320 ?auto_129321 ) ) ( ON-TABLE ?auto_129323 ) ( ON ?auto_129321 ?auto_129323 ) ( not ( = ?auto_129323 ?auto_129321 ) ) ( not ( = ?auto_129323 ?auto_129320 ) ) ( not ( = ?auto_129323 ?auto_129319 ) ) ( not ( = ?auto_129316 ?auto_129323 ) ) ( not ( = ?auto_129317 ?auto_129323 ) ) ( not ( = ?auto_129318 ?auto_129323 ) ) ( ON ?auto_129316 ?auto_129322 ) ( not ( = ?auto_129316 ?auto_129322 ) ) ( not ( = ?auto_129317 ?auto_129322 ) ) ( not ( = ?auto_129318 ?auto_129322 ) ) ( not ( = ?auto_129319 ?auto_129322 ) ) ( not ( = ?auto_129320 ?auto_129322 ) ) ( not ( = ?auto_129321 ?auto_129322 ) ) ( not ( = ?auto_129323 ?auto_129322 ) ) ( ON ?auto_129317 ?auto_129316 ) ( ON-TABLE ?auto_129322 ) ( ON ?auto_129318 ?auto_129317 ) ( CLEAR ?auto_129320 ) ( ON ?auto_129319 ?auto_129318 ) ( CLEAR ?auto_129319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129322 ?auto_129316 ?auto_129317 ?auto_129318 )
      ( MAKE-5PILE ?auto_129316 ?auto_129317 ?auto_129318 ?auto_129319 ?auto_129320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129324 - BLOCK
      ?auto_129325 - BLOCK
      ?auto_129326 - BLOCK
      ?auto_129327 - BLOCK
      ?auto_129328 - BLOCK
    )
    :vars
    (
      ?auto_129331 - BLOCK
      ?auto_129329 - BLOCK
      ?auto_129330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129324 ?auto_129325 ) ) ( not ( = ?auto_129324 ?auto_129326 ) ) ( not ( = ?auto_129324 ?auto_129327 ) ) ( not ( = ?auto_129324 ?auto_129328 ) ) ( not ( = ?auto_129325 ?auto_129326 ) ) ( not ( = ?auto_129325 ?auto_129327 ) ) ( not ( = ?auto_129325 ?auto_129328 ) ) ( not ( = ?auto_129326 ?auto_129327 ) ) ( not ( = ?auto_129326 ?auto_129328 ) ) ( not ( = ?auto_129327 ?auto_129328 ) ) ( not ( = ?auto_129324 ?auto_129331 ) ) ( not ( = ?auto_129325 ?auto_129331 ) ) ( not ( = ?auto_129326 ?auto_129331 ) ) ( not ( = ?auto_129327 ?auto_129331 ) ) ( not ( = ?auto_129328 ?auto_129331 ) ) ( ON-TABLE ?auto_129329 ) ( ON ?auto_129331 ?auto_129329 ) ( not ( = ?auto_129329 ?auto_129331 ) ) ( not ( = ?auto_129329 ?auto_129328 ) ) ( not ( = ?auto_129329 ?auto_129327 ) ) ( not ( = ?auto_129324 ?auto_129329 ) ) ( not ( = ?auto_129325 ?auto_129329 ) ) ( not ( = ?auto_129326 ?auto_129329 ) ) ( ON ?auto_129324 ?auto_129330 ) ( not ( = ?auto_129324 ?auto_129330 ) ) ( not ( = ?auto_129325 ?auto_129330 ) ) ( not ( = ?auto_129326 ?auto_129330 ) ) ( not ( = ?auto_129327 ?auto_129330 ) ) ( not ( = ?auto_129328 ?auto_129330 ) ) ( not ( = ?auto_129331 ?auto_129330 ) ) ( not ( = ?auto_129329 ?auto_129330 ) ) ( ON ?auto_129325 ?auto_129324 ) ( ON-TABLE ?auto_129330 ) ( ON ?auto_129326 ?auto_129325 ) ( ON ?auto_129327 ?auto_129326 ) ( CLEAR ?auto_129327 ) ( HOLDING ?auto_129328 ) ( CLEAR ?auto_129331 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129329 ?auto_129331 ?auto_129328 )
      ( MAKE-5PILE ?auto_129324 ?auto_129325 ?auto_129326 ?auto_129327 ?auto_129328 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129332 - BLOCK
      ?auto_129333 - BLOCK
      ?auto_129334 - BLOCK
      ?auto_129335 - BLOCK
      ?auto_129336 - BLOCK
    )
    :vars
    (
      ?auto_129339 - BLOCK
      ?auto_129338 - BLOCK
      ?auto_129337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129332 ?auto_129333 ) ) ( not ( = ?auto_129332 ?auto_129334 ) ) ( not ( = ?auto_129332 ?auto_129335 ) ) ( not ( = ?auto_129332 ?auto_129336 ) ) ( not ( = ?auto_129333 ?auto_129334 ) ) ( not ( = ?auto_129333 ?auto_129335 ) ) ( not ( = ?auto_129333 ?auto_129336 ) ) ( not ( = ?auto_129334 ?auto_129335 ) ) ( not ( = ?auto_129334 ?auto_129336 ) ) ( not ( = ?auto_129335 ?auto_129336 ) ) ( not ( = ?auto_129332 ?auto_129339 ) ) ( not ( = ?auto_129333 ?auto_129339 ) ) ( not ( = ?auto_129334 ?auto_129339 ) ) ( not ( = ?auto_129335 ?auto_129339 ) ) ( not ( = ?auto_129336 ?auto_129339 ) ) ( ON-TABLE ?auto_129338 ) ( ON ?auto_129339 ?auto_129338 ) ( not ( = ?auto_129338 ?auto_129339 ) ) ( not ( = ?auto_129338 ?auto_129336 ) ) ( not ( = ?auto_129338 ?auto_129335 ) ) ( not ( = ?auto_129332 ?auto_129338 ) ) ( not ( = ?auto_129333 ?auto_129338 ) ) ( not ( = ?auto_129334 ?auto_129338 ) ) ( ON ?auto_129332 ?auto_129337 ) ( not ( = ?auto_129332 ?auto_129337 ) ) ( not ( = ?auto_129333 ?auto_129337 ) ) ( not ( = ?auto_129334 ?auto_129337 ) ) ( not ( = ?auto_129335 ?auto_129337 ) ) ( not ( = ?auto_129336 ?auto_129337 ) ) ( not ( = ?auto_129339 ?auto_129337 ) ) ( not ( = ?auto_129338 ?auto_129337 ) ) ( ON ?auto_129333 ?auto_129332 ) ( ON-TABLE ?auto_129337 ) ( ON ?auto_129334 ?auto_129333 ) ( ON ?auto_129335 ?auto_129334 ) ( CLEAR ?auto_129339 ) ( ON ?auto_129336 ?auto_129335 ) ( CLEAR ?auto_129336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129337 ?auto_129332 ?auto_129333 ?auto_129334 ?auto_129335 )
      ( MAKE-5PILE ?auto_129332 ?auto_129333 ?auto_129334 ?auto_129335 ?auto_129336 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129340 - BLOCK
      ?auto_129341 - BLOCK
      ?auto_129342 - BLOCK
      ?auto_129343 - BLOCK
      ?auto_129344 - BLOCK
    )
    :vars
    (
      ?auto_129347 - BLOCK
      ?auto_129345 - BLOCK
      ?auto_129346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129340 ?auto_129341 ) ) ( not ( = ?auto_129340 ?auto_129342 ) ) ( not ( = ?auto_129340 ?auto_129343 ) ) ( not ( = ?auto_129340 ?auto_129344 ) ) ( not ( = ?auto_129341 ?auto_129342 ) ) ( not ( = ?auto_129341 ?auto_129343 ) ) ( not ( = ?auto_129341 ?auto_129344 ) ) ( not ( = ?auto_129342 ?auto_129343 ) ) ( not ( = ?auto_129342 ?auto_129344 ) ) ( not ( = ?auto_129343 ?auto_129344 ) ) ( not ( = ?auto_129340 ?auto_129347 ) ) ( not ( = ?auto_129341 ?auto_129347 ) ) ( not ( = ?auto_129342 ?auto_129347 ) ) ( not ( = ?auto_129343 ?auto_129347 ) ) ( not ( = ?auto_129344 ?auto_129347 ) ) ( ON-TABLE ?auto_129345 ) ( not ( = ?auto_129345 ?auto_129347 ) ) ( not ( = ?auto_129345 ?auto_129344 ) ) ( not ( = ?auto_129345 ?auto_129343 ) ) ( not ( = ?auto_129340 ?auto_129345 ) ) ( not ( = ?auto_129341 ?auto_129345 ) ) ( not ( = ?auto_129342 ?auto_129345 ) ) ( ON ?auto_129340 ?auto_129346 ) ( not ( = ?auto_129340 ?auto_129346 ) ) ( not ( = ?auto_129341 ?auto_129346 ) ) ( not ( = ?auto_129342 ?auto_129346 ) ) ( not ( = ?auto_129343 ?auto_129346 ) ) ( not ( = ?auto_129344 ?auto_129346 ) ) ( not ( = ?auto_129347 ?auto_129346 ) ) ( not ( = ?auto_129345 ?auto_129346 ) ) ( ON ?auto_129341 ?auto_129340 ) ( ON-TABLE ?auto_129346 ) ( ON ?auto_129342 ?auto_129341 ) ( ON ?auto_129343 ?auto_129342 ) ( ON ?auto_129344 ?auto_129343 ) ( CLEAR ?auto_129344 ) ( HOLDING ?auto_129347 ) ( CLEAR ?auto_129345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129345 ?auto_129347 )
      ( MAKE-5PILE ?auto_129340 ?auto_129341 ?auto_129342 ?auto_129343 ?auto_129344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129348 - BLOCK
      ?auto_129349 - BLOCK
      ?auto_129350 - BLOCK
      ?auto_129351 - BLOCK
      ?auto_129352 - BLOCK
    )
    :vars
    (
      ?auto_129353 - BLOCK
      ?auto_129355 - BLOCK
      ?auto_129354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129348 ?auto_129349 ) ) ( not ( = ?auto_129348 ?auto_129350 ) ) ( not ( = ?auto_129348 ?auto_129351 ) ) ( not ( = ?auto_129348 ?auto_129352 ) ) ( not ( = ?auto_129349 ?auto_129350 ) ) ( not ( = ?auto_129349 ?auto_129351 ) ) ( not ( = ?auto_129349 ?auto_129352 ) ) ( not ( = ?auto_129350 ?auto_129351 ) ) ( not ( = ?auto_129350 ?auto_129352 ) ) ( not ( = ?auto_129351 ?auto_129352 ) ) ( not ( = ?auto_129348 ?auto_129353 ) ) ( not ( = ?auto_129349 ?auto_129353 ) ) ( not ( = ?auto_129350 ?auto_129353 ) ) ( not ( = ?auto_129351 ?auto_129353 ) ) ( not ( = ?auto_129352 ?auto_129353 ) ) ( ON-TABLE ?auto_129355 ) ( not ( = ?auto_129355 ?auto_129353 ) ) ( not ( = ?auto_129355 ?auto_129352 ) ) ( not ( = ?auto_129355 ?auto_129351 ) ) ( not ( = ?auto_129348 ?auto_129355 ) ) ( not ( = ?auto_129349 ?auto_129355 ) ) ( not ( = ?auto_129350 ?auto_129355 ) ) ( ON ?auto_129348 ?auto_129354 ) ( not ( = ?auto_129348 ?auto_129354 ) ) ( not ( = ?auto_129349 ?auto_129354 ) ) ( not ( = ?auto_129350 ?auto_129354 ) ) ( not ( = ?auto_129351 ?auto_129354 ) ) ( not ( = ?auto_129352 ?auto_129354 ) ) ( not ( = ?auto_129353 ?auto_129354 ) ) ( not ( = ?auto_129355 ?auto_129354 ) ) ( ON ?auto_129349 ?auto_129348 ) ( ON-TABLE ?auto_129354 ) ( ON ?auto_129350 ?auto_129349 ) ( ON ?auto_129351 ?auto_129350 ) ( ON ?auto_129352 ?auto_129351 ) ( CLEAR ?auto_129355 ) ( ON ?auto_129353 ?auto_129352 ) ( CLEAR ?auto_129353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129354 ?auto_129348 ?auto_129349 ?auto_129350 ?auto_129351 ?auto_129352 )
      ( MAKE-5PILE ?auto_129348 ?auto_129349 ?auto_129350 ?auto_129351 ?auto_129352 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129356 - BLOCK
      ?auto_129357 - BLOCK
      ?auto_129358 - BLOCK
      ?auto_129359 - BLOCK
      ?auto_129360 - BLOCK
    )
    :vars
    (
      ?auto_129363 - BLOCK
      ?auto_129361 - BLOCK
      ?auto_129362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129356 ?auto_129357 ) ) ( not ( = ?auto_129356 ?auto_129358 ) ) ( not ( = ?auto_129356 ?auto_129359 ) ) ( not ( = ?auto_129356 ?auto_129360 ) ) ( not ( = ?auto_129357 ?auto_129358 ) ) ( not ( = ?auto_129357 ?auto_129359 ) ) ( not ( = ?auto_129357 ?auto_129360 ) ) ( not ( = ?auto_129358 ?auto_129359 ) ) ( not ( = ?auto_129358 ?auto_129360 ) ) ( not ( = ?auto_129359 ?auto_129360 ) ) ( not ( = ?auto_129356 ?auto_129363 ) ) ( not ( = ?auto_129357 ?auto_129363 ) ) ( not ( = ?auto_129358 ?auto_129363 ) ) ( not ( = ?auto_129359 ?auto_129363 ) ) ( not ( = ?auto_129360 ?auto_129363 ) ) ( not ( = ?auto_129361 ?auto_129363 ) ) ( not ( = ?auto_129361 ?auto_129360 ) ) ( not ( = ?auto_129361 ?auto_129359 ) ) ( not ( = ?auto_129356 ?auto_129361 ) ) ( not ( = ?auto_129357 ?auto_129361 ) ) ( not ( = ?auto_129358 ?auto_129361 ) ) ( ON ?auto_129356 ?auto_129362 ) ( not ( = ?auto_129356 ?auto_129362 ) ) ( not ( = ?auto_129357 ?auto_129362 ) ) ( not ( = ?auto_129358 ?auto_129362 ) ) ( not ( = ?auto_129359 ?auto_129362 ) ) ( not ( = ?auto_129360 ?auto_129362 ) ) ( not ( = ?auto_129363 ?auto_129362 ) ) ( not ( = ?auto_129361 ?auto_129362 ) ) ( ON ?auto_129357 ?auto_129356 ) ( ON-TABLE ?auto_129362 ) ( ON ?auto_129358 ?auto_129357 ) ( ON ?auto_129359 ?auto_129358 ) ( ON ?auto_129360 ?auto_129359 ) ( ON ?auto_129363 ?auto_129360 ) ( CLEAR ?auto_129363 ) ( HOLDING ?auto_129361 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129361 )
      ( MAKE-5PILE ?auto_129356 ?auto_129357 ?auto_129358 ?auto_129359 ?auto_129360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_129364 - BLOCK
      ?auto_129365 - BLOCK
      ?auto_129366 - BLOCK
      ?auto_129367 - BLOCK
      ?auto_129368 - BLOCK
    )
    :vars
    (
      ?auto_129370 - BLOCK
      ?auto_129371 - BLOCK
      ?auto_129369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129364 ?auto_129365 ) ) ( not ( = ?auto_129364 ?auto_129366 ) ) ( not ( = ?auto_129364 ?auto_129367 ) ) ( not ( = ?auto_129364 ?auto_129368 ) ) ( not ( = ?auto_129365 ?auto_129366 ) ) ( not ( = ?auto_129365 ?auto_129367 ) ) ( not ( = ?auto_129365 ?auto_129368 ) ) ( not ( = ?auto_129366 ?auto_129367 ) ) ( not ( = ?auto_129366 ?auto_129368 ) ) ( not ( = ?auto_129367 ?auto_129368 ) ) ( not ( = ?auto_129364 ?auto_129370 ) ) ( not ( = ?auto_129365 ?auto_129370 ) ) ( not ( = ?auto_129366 ?auto_129370 ) ) ( not ( = ?auto_129367 ?auto_129370 ) ) ( not ( = ?auto_129368 ?auto_129370 ) ) ( not ( = ?auto_129371 ?auto_129370 ) ) ( not ( = ?auto_129371 ?auto_129368 ) ) ( not ( = ?auto_129371 ?auto_129367 ) ) ( not ( = ?auto_129364 ?auto_129371 ) ) ( not ( = ?auto_129365 ?auto_129371 ) ) ( not ( = ?auto_129366 ?auto_129371 ) ) ( ON ?auto_129364 ?auto_129369 ) ( not ( = ?auto_129364 ?auto_129369 ) ) ( not ( = ?auto_129365 ?auto_129369 ) ) ( not ( = ?auto_129366 ?auto_129369 ) ) ( not ( = ?auto_129367 ?auto_129369 ) ) ( not ( = ?auto_129368 ?auto_129369 ) ) ( not ( = ?auto_129370 ?auto_129369 ) ) ( not ( = ?auto_129371 ?auto_129369 ) ) ( ON ?auto_129365 ?auto_129364 ) ( ON-TABLE ?auto_129369 ) ( ON ?auto_129366 ?auto_129365 ) ( ON ?auto_129367 ?auto_129366 ) ( ON ?auto_129368 ?auto_129367 ) ( ON ?auto_129370 ?auto_129368 ) ( ON ?auto_129371 ?auto_129370 ) ( CLEAR ?auto_129371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129369 ?auto_129364 ?auto_129365 ?auto_129366 ?auto_129367 ?auto_129368 ?auto_129370 )
      ( MAKE-5PILE ?auto_129364 ?auto_129365 ?auto_129366 ?auto_129367 ?auto_129368 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129373 - BLOCK
    )
    :vars
    (
      ?auto_129374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129374 ?auto_129373 ) ( CLEAR ?auto_129374 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129373 ) ( not ( = ?auto_129373 ?auto_129374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129374 ?auto_129373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129375 - BLOCK
    )
    :vars
    (
      ?auto_129376 - BLOCK
      ?auto_129377 - BLOCK
      ?auto_129378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129376 ?auto_129375 ) ( CLEAR ?auto_129376 ) ( ON-TABLE ?auto_129375 ) ( not ( = ?auto_129375 ?auto_129376 ) ) ( HOLDING ?auto_129377 ) ( CLEAR ?auto_129378 ) ( not ( = ?auto_129375 ?auto_129377 ) ) ( not ( = ?auto_129375 ?auto_129378 ) ) ( not ( = ?auto_129376 ?auto_129377 ) ) ( not ( = ?auto_129376 ?auto_129378 ) ) ( not ( = ?auto_129377 ?auto_129378 ) ) )
    :subtasks
    ( ( !STACK ?auto_129377 ?auto_129378 )
      ( MAKE-1PILE ?auto_129375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129379 - BLOCK
    )
    :vars
    (
      ?auto_129381 - BLOCK
      ?auto_129382 - BLOCK
      ?auto_129380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129381 ?auto_129379 ) ( ON-TABLE ?auto_129379 ) ( not ( = ?auto_129379 ?auto_129381 ) ) ( CLEAR ?auto_129382 ) ( not ( = ?auto_129379 ?auto_129380 ) ) ( not ( = ?auto_129379 ?auto_129382 ) ) ( not ( = ?auto_129381 ?auto_129380 ) ) ( not ( = ?auto_129381 ?auto_129382 ) ) ( not ( = ?auto_129380 ?auto_129382 ) ) ( ON ?auto_129380 ?auto_129381 ) ( CLEAR ?auto_129380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129379 ?auto_129381 )
      ( MAKE-1PILE ?auto_129379 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129383 - BLOCK
    )
    :vars
    (
      ?auto_129385 - BLOCK
      ?auto_129384 - BLOCK
      ?auto_129386 - BLOCK
      ?auto_129387 - BLOCK
      ?auto_129388 - BLOCK
      ?auto_129389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129385 ?auto_129383 ) ( ON-TABLE ?auto_129383 ) ( not ( = ?auto_129383 ?auto_129385 ) ) ( not ( = ?auto_129383 ?auto_129384 ) ) ( not ( = ?auto_129383 ?auto_129386 ) ) ( not ( = ?auto_129385 ?auto_129384 ) ) ( not ( = ?auto_129385 ?auto_129386 ) ) ( not ( = ?auto_129384 ?auto_129386 ) ) ( ON ?auto_129384 ?auto_129385 ) ( CLEAR ?auto_129384 ) ( HOLDING ?auto_129386 ) ( CLEAR ?auto_129387 ) ( ON-TABLE ?auto_129388 ) ( ON ?auto_129389 ?auto_129388 ) ( ON ?auto_129387 ?auto_129389 ) ( not ( = ?auto_129388 ?auto_129389 ) ) ( not ( = ?auto_129388 ?auto_129387 ) ) ( not ( = ?auto_129388 ?auto_129386 ) ) ( not ( = ?auto_129389 ?auto_129387 ) ) ( not ( = ?auto_129389 ?auto_129386 ) ) ( not ( = ?auto_129387 ?auto_129386 ) ) ( not ( = ?auto_129383 ?auto_129387 ) ) ( not ( = ?auto_129383 ?auto_129388 ) ) ( not ( = ?auto_129383 ?auto_129389 ) ) ( not ( = ?auto_129385 ?auto_129387 ) ) ( not ( = ?auto_129385 ?auto_129388 ) ) ( not ( = ?auto_129385 ?auto_129389 ) ) ( not ( = ?auto_129384 ?auto_129387 ) ) ( not ( = ?auto_129384 ?auto_129388 ) ) ( not ( = ?auto_129384 ?auto_129389 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129388 ?auto_129389 ?auto_129387 ?auto_129386 )
      ( MAKE-1PILE ?auto_129383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129390 - BLOCK
    )
    :vars
    (
      ?auto_129392 - BLOCK
      ?auto_129396 - BLOCK
      ?auto_129391 - BLOCK
      ?auto_129393 - BLOCK
      ?auto_129395 - BLOCK
      ?auto_129394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129392 ?auto_129390 ) ( ON-TABLE ?auto_129390 ) ( not ( = ?auto_129390 ?auto_129392 ) ) ( not ( = ?auto_129390 ?auto_129396 ) ) ( not ( = ?auto_129390 ?auto_129391 ) ) ( not ( = ?auto_129392 ?auto_129396 ) ) ( not ( = ?auto_129392 ?auto_129391 ) ) ( not ( = ?auto_129396 ?auto_129391 ) ) ( ON ?auto_129396 ?auto_129392 ) ( CLEAR ?auto_129393 ) ( ON-TABLE ?auto_129395 ) ( ON ?auto_129394 ?auto_129395 ) ( ON ?auto_129393 ?auto_129394 ) ( not ( = ?auto_129395 ?auto_129394 ) ) ( not ( = ?auto_129395 ?auto_129393 ) ) ( not ( = ?auto_129395 ?auto_129391 ) ) ( not ( = ?auto_129394 ?auto_129393 ) ) ( not ( = ?auto_129394 ?auto_129391 ) ) ( not ( = ?auto_129393 ?auto_129391 ) ) ( not ( = ?auto_129390 ?auto_129393 ) ) ( not ( = ?auto_129390 ?auto_129395 ) ) ( not ( = ?auto_129390 ?auto_129394 ) ) ( not ( = ?auto_129392 ?auto_129393 ) ) ( not ( = ?auto_129392 ?auto_129395 ) ) ( not ( = ?auto_129392 ?auto_129394 ) ) ( not ( = ?auto_129396 ?auto_129393 ) ) ( not ( = ?auto_129396 ?auto_129395 ) ) ( not ( = ?auto_129396 ?auto_129394 ) ) ( ON ?auto_129391 ?auto_129396 ) ( CLEAR ?auto_129391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129390 ?auto_129392 ?auto_129396 )
      ( MAKE-1PILE ?auto_129390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129397 - BLOCK
    )
    :vars
    (
      ?auto_129399 - BLOCK
      ?auto_129401 - BLOCK
      ?auto_129403 - BLOCK
      ?auto_129402 - BLOCK
      ?auto_129400 - BLOCK
      ?auto_129398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129399 ?auto_129397 ) ( ON-TABLE ?auto_129397 ) ( not ( = ?auto_129397 ?auto_129399 ) ) ( not ( = ?auto_129397 ?auto_129401 ) ) ( not ( = ?auto_129397 ?auto_129403 ) ) ( not ( = ?auto_129399 ?auto_129401 ) ) ( not ( = ?auto_129399 ?auto_129403 ) ) ( not ( = ?auto_129401 ?auto_129403 ) ) ( ON ?auto_129401 ?auto_129399 ) ( ON-TABLE ?auto_129402 ) ( ON ?auto_129400 ?auto_129402 ) ( not ( = ?auto_129402 ?auto_129400 ) ) ( not ( = ?auto_129402 ?auto_129398 ) ) ( not ( = ?auto_129402 ?auto_129403 ) ) ( not ( = ?auto_129400 ?auto_129398 ) ) ( not ( = ?auto_129400 ?auto_129403 ) ) ( not ( = ?auto_129398 ?auto_129403 ) ) ( not ( = ?auto_129397 ?auto_129398 ) ) ( not ( = ?auto_129397 ?auto_129402 ) ) ( not ( = ?auto_129397 ?auto_129400 ) ) ( not ( = ?auto_129399 ?auto_129398 ) ) ( not ( = ?auto_129399 ?auto_129402 ) ) ( not ( = ?auto_129399 ?auto_129400 ) ) ( not ( = ?auto_129401 ?auto_129398 ) ) ( not ( = ?auto_129401 ?auto_129402 ) ) ( not ( = ?auto_129401 ?auto_129400 ) ) ( ON ?auto_129403 ?auto_129401 ) ( CLEAR ?auto_129403 ) ( HOLDING ?auto_129398 ) ( CLEAR ?auto_129400 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129402 ?auto_129400 ?auto_129398 )
      ( MAKE-1PILE ?auto_129397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129404 - BLOCK
    )
    :vars
    (
      ?auto_129408 - BLOCK
      ?auto_129406 - BLOCK
      ?auto_129410 - BLOCK
      ?auto_129409 - BLOCK
      ?auto_129405 - BLOCK
      ?auto_129407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129408 ?auto_129404 ) ( ON-TABLE ?auto_129404 ) ( not ( = ?auto_129404 ?auto_129408 ) ) ( not ( = ?auto_129404 ?auto_129406 ) ) ( not ( = ?auto_129404 ?auto_129410 ) ) ( not ( = ?auto_129408 ?auto_129406 ) ) ( not ( = ?auto_129408 ?auto_129410 ) ) ( not ( = ?auto_129406 ?auto_129410 ) ) ( ON ?auto_129406 ?auto_129408 ) ( ON-TABLE ?auto_129409 ) ( ON ?auto_129405 ?auto_129409 ) ( not ( = ?auto_129409 ?auto_129405 ) ) ( not ( = ?auto_129409 ?auto_129407 ) ) ( not ( = ?auto_129409 ?auto_129410 ) ) ( not ( = ?auto_129405 ?auto_129407 ) ) ( not ( = ?auto_129405 ?auto_129410 ) ) ( not ( = ?auto_129407 ?auto_129410 ) ) ( not ( = ?auto_129404 ?auto_129407 ) ) ( not ( = ?auto_129404 ?auto_129409 ) ) ( not ( = ?auto_129404 ?auto_129405 ) ) ( not ( = ?auto_129408 ?auto_129407 ) ) ( not ( = ?auto_129408 ?auto_129409 ) ) ( not ( = ?auto_129408 ?auto_129405 ) ) ( not ( = ?auto_129406 ?auto_129407 ) ) ( not ( = ?auto_129406 ?auto_129409 ) ) ( not ( = ?auto_129406 ?auto_129405 ) ) ( ON ?auto_129410 ?auto_129406 ) ( CLEAR ?auto_129405 ) ( ON ?auto_129407 ?auto_129410 ) ( CLEAR ?auto_129407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129404 ?auto_129408 ?auto_129406 ?auto_129410 )
      ( MAKE-1PILE ?auto_129404 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129411 - BLOCK
    )
    :vars
    (
      ?auto_129414 - BLOCK
      ?auto_129413 - BLOCK
      ?auto_129417 - BLOCK
      ?auto_129416 - BLOCK
      ?auto_129412 - BLOCK
      ?auto_129415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129414 ?auto_129411 ) ( ON-TABLE ?auto_129411 ) ( not ( = ?auto_129411 ?auto_129414 ) ) ( not ( = ?auto_129411 ?auto_129413 ) ) ( not ( = ?auto_129411 ?auto_129417 ) ) ( not ( = ?auto_129414 ?auto_129413 ) ) ( not ( = ?auto_129414 ?auto_129417 ) ) ( not ( = ?auto_129413 ?auto_129417 ) ) ( ON ?auto_129413 ?auto_129414 ) ( ON-TABLE ?auto_129416 ) ( not ( = ?auto_129416 ?auto_129412 ) ) ( not ( = ?auto_129416 ?auto_129415 ) ) ( not ( = ?auto_129416 ?auto_129417 ) ) ( not ( = ?auto_129412 ?auto_129415 ) ) ( not ( = ?auto_129412 ?auto_129417 ) ) ( not ( = ?auto_129415 ?auto_129417 ) ) ( not ( = ?auto_129411 ?auto_129415 ) ) ( not ( = ?auto_129411 ?auto_129416 ) ) ( not ( = ?auto_129411 ?auto_129412 ) ) ( not ( = ?auto_129414 ?auto_129415 ) ) ( not ( = ?auto_129414 ?auto_129416 ) ) ( not ( = ?auto_129414 ?auto_129412 ) ) ( not ( = ?auto_129413 ?auto_129415 ) ) ( not ( = ?auto_129413 ?auto_129416 ) ) ( not ( = ?auto_129413 ?auto_129412 ) ) ( ON ?auto_129417 ?auto_129413 ) ( ON ?auto_129415 ?auto_129417 ) ( CLEAR ?auto_129415 ) ( HOLDING ?auto_129412 ) ( CLEAR ?auto_129416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129416 ?auto_129412 )
      ( MAKE-1PILE ?auto_129411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129418 - BLOCK
    )
    :vars
    (
      ?auto_129423 - BLOCK
      ?auto_129424 - BLOCK
      ?auto_129421 - BLOCK
      ?auto_129420 - BLOCK
      ?auto_129419 - BLOCK
      ?auto_129422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129423 ?auto_129418 ) ( ON-TABLE ?auto_129418 ) ( not ( = ?auto_129418 ?auto_129423 ) ) ( not ( = ?auto_129418 ?auto_129424 ) ) ( not ( = ?auto_129418 ?auto_129421 ) ) ( not ( = ?auto_129423 ?auto_129424 ) ) ( not ( = ?auto_129423 ?auto_129421 ) ) ( not ( = ?auto_129424 ?auto_129421 ) ) ( ON ?auto_129424 ?auto_129423 ) ( ON-TABLE ?auto_129420 ) ( not ( = ?auto_129420 ?auto_129419 ) ) ( not ( = ?auto_129420 ?auto_129422 ) ) ( not ( = ?auto_129420 ?auto_129421 ) ) ( not ( = ?auto_129419 ?auto_129422 ) ) ( not ( = ?auto_129419 ?auto_129421 ) ) ( not ( = ?auto_129422 ?auto_129421 ) ) ( not ( = ?auto_129418 ?auto_129422 ) ) ( not ( = ?auto_129418 ?auto_129420 ) ) ( not ( = ?auto_129418 ?auto_129419 ) ) ( not ( = ?auto_129423 ?auto_129422 ) ) ( not ( = ?auto_129423 ?auto_129420 ) ) ( not ( = ?auto_129423 ?auto_129419 ) ) ( not ( = ?auto_129424 ?auto_129422 ) ) ( not ( = ?auto_129424 ?auto_129420 ) ) ( not ( = ?auto_129424 ?auto_129419 ) ) ( ON ?auto_129421 ?auto_129424 ) ( ON ?auto_129422 ?auto_129421 ) ( CLEAR ?auto_129420 ) ( ON ?auto_129419 ?auto_129422 ) ( CLEAR ?auto_129419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129418 ?auto_129423 ?auto_129424 ?auto_129421 ?auto_129422 )
      ( MAKE-1PILE ?auto_129418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129425 - BLOCK
    )
    :vars
    (
      ?auto_129431 - BLOCK
      ?auto_129427 - BLOCK
      ?auto_129428 - BLOCK
      ?auto_129426 - BLOCK
      ?auto_129430 - BLOCK
      ?auto_129429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129431 ?auto_129425 ) ( ON-TABLE ?auto_129425 ) ( not ( = ?auto_129425 ?auto_129431 ) ) ( not ( = ?auto_129425 ?auto_129427 ) ) ( not ( = ?auto_129425 ?auto_129428 ) ) ( not ( = ?auto_129431 ?auto_129427 ) ) ( not ( = ?auto_129431 ?auto_129428 ) ) ( not ( = ?auto_129427 ?auto_129428 ) ) ( ON ?auto_129427 ?auto_129431 ) ( not ( = ?auto_129426 ?auto_129430 ) ) ( not ( = ?auto_129426 ?auto_129429 ) ) ( not ( = ?auto_129426 ?auto_129428 ) ) ( not ( = ?auto_129430 ?auto_129429 ) ) ( not ( = ?auto_129430 ?auto_129428 ) ) ( not ( = ?auto_129429 ?auto_129428 ) ) ( not ( = ?auto_129425 ?auto_129429 ) ) ( not ( = ?auto_129425 ?auto_129426 ) ) ( not ( = ?auto_129425 ?auto_129430 ) ) ( not ( = ?auto_129431 ?auto_129429 ) ) ( not ( = ?auto_129431 ?auto_129426 ) ) ( not ( = ?auto_129431 ?auto_129430 ) ) ( not ( = ?auto_129427 ?auto_129429 ) ) ( not ( = ?auto_129427 ?auto_129426 ) ) ( not ( = ?auto_129427 ?auto_129430 ) ) ( ON ?auto_129428 ?auto_129427 ) ( ON ?auto_129429 ?auto_129428 ) ( ON ?auto_129430 ?auto_129429 ) ( CLEAR ?auto_129430 ) ( HOLDING ?auto_129426 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129426 )
      ( MAKE-1PILE ?auto_129425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129432 - BLOCK
    )
    :vars
    (
      ?auto_129437 - BLOCK
      ?auto_129434 - BLOCK
      ?auto_129435 - BLOCK
      ?auto_129433 - BLOCK
      ?auto_129438 - BLOCK
      ?auto_129436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129437 ?auto_129432 ) ( ON-TABLE ?auto_129432 ) ( not ( = ?auto_129432 ?auto_129437 ) ) ( not ( = ?auto_129432 ?auto_129434 ) ) ( not ( = ?auto_129432 ?auto_129435 ) ) ( not ( = ?auto_129437 ?auto_129434 ) ) ( not ( = ?auto_129437 ?auto_129435 ) ) ( not ( = ?auto_129434 ?auto_129435 ) ) ( ON ?auto_129434 ?auto_129437 ) ( not ( = ?auto_129433 ?auto_129438 ) ) ( not ( = ?auto_129433 ?auto_129436 ) ) ( not ( = ?auto_129433 ?auto_129435 ) ) ( not ( = ?auto_129438 ?auto_129436 ) ) ( not ( = ?auto_129438 ?auto_129435 ) ) ( not ( = ?auto_129436 ?auto_129435 ) ) ( not ( = ?auto_129432 ?auto_129436 ) ) ( not ( = ?auto_129432 ?auto_129433 ) ) ( not ( = ?auto_129432 ?auto_129438 ) ) ( not ( = ?auto_129437 ?auto_129436 ) ) ( not ( = ?auto_129437 ?auto_129433 ) ) ( not ( = ?auto_129437 ?auto_129438 ) ) ( not ( = ?auto_129434 ?auto_129436 ) ) ( not ( = ?auto_129434 ?auto_129433 ) ) ( not ( = ?auto_129434 ?auto_129438 ) ) ( ON ?auto_129435 ?auto_129434 ) ( ON ?auto_129436 ?auto_129435 ) ( ON ?auto_129438 ?auto_129436 ) ( ON ?auto_129433 ?auto_129438 ) ( CLEAR ?auto_129433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129432 ?auto_129437 ?auto_129434 ?auto_129435 ?auto_129436 ?auto_129438 )
      ( MAKE-1PILE ?auto_129432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129439 - BLOCK
    )
    :vars
    (
      ?auto_129440 - BLOCK
      ?auto_129442 - BLOCK
      ?auto_129445 - BLOCK
      ?auto_129441 - BLOCK
      ?auto_129444 - BLOCK
      ?auto_129443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129440 ?auto_129439 ) ( ON-TABLE ?auto_129439 ) ( not ( = ?auto_129439 ?auto_129440 ) ) ( not ( = ?auto_129439 ?auto_129442 ) ) ( not ( = ?auto_129439 ?auto_129445 ) ) ( not ( = ?auto_129440 ?auto_129442 ) ) ( not ( = ?auto_129440 ?auto_129445 ) ) ( not ( = ?auto_129442 ?auto_129445 ) ) ( ON ?auto_129442 ?auto_129440 ) ( not ( = ?auto_129441 ?auto_129444 ) ) ( not ( = ?auto_129441 ?auto_129443 ) ) ( not ( = ?auto_129441 ?auto_129445 ) ) ( not ( = ?auto_129444 ?auto_129443 ) ) ( not ( = ?auto_129444 ?auto_129445 ) ) ( not ( = ?auto_129443 ?auto_129445 ) ) ( not ( = ?auto_129439 ?auto_129443 ) ) ( not ( = ?auto_129439 ?auto_129441 ) ) ( not ( = ?auto_129439 ?auto_129444 ) ) ( not ( = ?auto_129440 ?auto_129443 ) ) ( not ( = ?auto_129440 ?auto_129441 ) ) ( not ( = ?auto_129440 ?auto_129444 ) ) ( not ( = ?auto_129442 ?auto_129443 ) ) ( not ( = ?auto_129442 ?auto_129441 ) ) ( not ( = ?auto_129442 ?auto_129444 ) ) ( ON ?auto_129445 ?auto_129442 ) ( ON ?auto_129443 ?auto_129445 ) ( ON ?auto_129444 ?auto_129443 ) ( HOLDING ?auto_129441 ) ( CLEAR ?auto_129444 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129439 ?auto_129440 ?auto_129442 ?auto_129445 ?auto_129443 ?auto_129444 ?auto_129441 )
      ( MAKE-1PILE ?auto_129439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129446 - BLOCK
    )
    :vars
    (
      ?auto_129450 - BLOCK
      ?auto_129452 - BLOCK
      ?auto_129449 - BLOCK
      ?auto_129447 - BLOCK
      ?auto_129448 - BLOCK
      ?auto_129451 - BLOCK
      ?auto_129453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129450 ?auto_129446 ) ( ON-TABLE ?auto_129446 ) ( not ( = ?auto_129446 ?auto_129450 ) ) ( not ( = ?auto_129446 ?auto_129452 ) ) ( not ( = ?auto_129446 ?auto_129449 ) ) ( not ( = ?auto_129450 ?auto_129452 ) ) ( not ( = ?auto_129450 ?auto_129449 ) ) ( not ( = ?auto_129452 ?auto_129449 ) ) ( ON ?auto_129452 ?auto_129450 ) ( not ( = ?auto_129447 ?auto_129448 ) ) ( not ( = ?auto_129447 ?auto_129451 ) ) ( not ( = ?auto_129447 ?auto_129449 ) ) ( not ( = ?auto_129448 ?auto_129451 ) ) ( not ( = ?auto_129448 ?auto_129449 ) ) ( not ( = ?auto_129451 ?auto_129449 ) ) ( not ( = ?auto_129446 ?auto_129451 ) ) ( not ( = ?auto_129446 ?auto_129447 ) ) ( not ( = ?auto_129446 ?auto_129448 ) ) ( not ( = ?auto_129450 ?auto_129451 ) ) ( not ( = ?auto_129450 ?auto_129447 ) ) ( not ( = ?auto_129450 ?auto_129448 ) ) ( not ( = ?auto_129452 ?auto_129451 ) ) ( not ( = ?auto_129452 ?auto_129447 ) ) ( not ( = ?auto_129452 ?auto_129448 ) ) ( ON ?auto_129449 ?auto_129452 ) ( ON ?auto_129451 ?auto_129449 ) ( ON ?auto_129448 ?auto_129451 ) ( CLEAR ?auto_129448 ) ( ON ?auto_129447 ?auto_129453 ) ( CLEAR ?auto_129447 ) ( HAND-EMPTY ) ( not ( = ?auto_129446 ?auto_129453 ) ) ( not ( = ?auto_129450 ?auto_129453 ) ) ( not ( = ?auto_129452 ?auto_129453 ) ) ( not ( = ?auto_129449 ?auto_129453 ) ) ( not ( = ?auto_129447 ?auto_129453 ) ) ( not ( = ?auto_129448 ?auto_129453 ) ) ( not ( = ?auto_129451 ?auto_129453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129447 ?auto_129453 )
      ( MAKE-1PILE ?auto_129446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129454 - BLOCK
    )
    :vars
    (
      ?auto_129457 - BLOCK
      ?auto_129458 - BLOCK
      ?auto_129455 - BLOCK
      ?auto_129459 - BLOCK
      ?auto_129460 - BLOCK
      ?auto_129456 - BLOCK
      ?auto_129461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129457 ?auto_129454 ) ( ON-TABLE ?auto_129454 ) ( not ( = ?auto_129454 ?auto_129457 ) ) ( not ( = ?auto_129454 ?auto_129458 ) ) ( not ( = ?auto_129454 ?auto_129455 ) ) ( not ( = ?auto_129457 ?auto_129458 ) ) ( not ( = ?auto_129457 ?auto_129455 ) ) ( not ( = ?auto_129458 ?auto_129455 ) ) ( ON ?auto_129458 ?auto_129457 ) ( not ( = ?auto_129459 ?auto_129460 ) ) ( not ( = ?auto_129459 ?auto_129456 ) ) ( not ( = ?auto_129459 ?auto_129455 ) ) ( not ( = ?auto_129460 ?auto_129456 ) ) ( not ( = ?auto_129460 ?auto_129455 ) ) ( not ( = ?auto_129456 ?auto_129455 ) ) ( not ( = ?auto_129454 ?auto_129456 ) ) ( not ( = ?auto_129454 ?auto_129459 ) ) ( not ( = ?auto_129454 ?auto_129460 ) ) ( not ( = ?auto_129457 ?auto_129456 ) ) ( not ( = ?auto_129457 ?auto_129459 ) ) ( not ( = ?auto_129457 ?auto_129460 ) ) ( not ( = ?auto_129458 ?auto_129456 ) ) ( not ( = ?auto_129458 ?auto_129459 ) ) ( not ( = ?auto_129458 ?auto_129460 ) ) ( ON ?auto_129455 ?auto_129458 ) ( ON ?auto_129456 ?auto_129455 ) ( ON ?auto_129459 ?auto_129461 ) ( CLEAR ?auto_129459 ) ( not ( = ?auto_129454 ?auto_129461 ) ) ( not ( = ?auto_129457 ?auto_129461 ) ) ( not ( = ?auto_129458 ?auto_129461 ) ) ( not ( = ?auto_129455 ?auto_129461 ) ) ( not ( = ?auto_129459 ?auto_129461 ) ) ( not ( = ?auto_129460 ?auto_129461 ) ) ( not ( = ?auto_129456 ?auto_129461 ) ) ( HOLDING ?auto_129460 ) ( CLEAR ?auto_129456 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129454 ?auto_129457 ?auto_129458 ?auto_129455 ?auto_129456 ?auto_129460 )
      ( MAKE-1PILE ?auto_129454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129462 - BLOCK
    )
    :vars
    (
      ?auto_129467 - BLOCK
      ?auto_129468 - BLOCK
      ?auto_129466 - BLOCK
      ?auto_129469 - BLOCK
      ?auto_129464 - BLOCK
      ?auto_129465 - BLOCK
      ?auto_129463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129467 ?auto_129462 ) ( ON-TABLE ?auto_129462 ) ( not ( = ?auto_129462 ?auto_129467 ) ) ( not ( = ?auto_129462 ?auto_129468 ) ) ( not ( = ?auto_129462 ?auto_129466 ) ) ( not ( = ?auto_129467 ?auto_129468 ) ) ( not ( = ?auto_129467 ?auto_129466 ) ) ( not ( = ?auto_129468 ?auto_129466 ) ) ( ON ?auto_129468 ?auto_129467 ) ( not ( = ?auto_129469 ?auto_129464 ) ) ( not ( = ?auto_129469 ?auto_129465 ) ) ( not ( = ?auto_129469 ?auto_129466 ) ) ( not ( = ?auto_129464 ?auto_129465 ) ) ( not ( = ?auto_129464 ?auto_129466 ) ) ( not ( = ?auto_129465 ?auto_129466 ) ) ( not ( = ?auto_129462 ?auto_129465 ) ) ( not ( = ?auto_129462 ?auto_129469 ) ) ( not ( = ?auto_129462 ?auto_129464 ) ) ( not ( = ?auto_129467 ?auto_129465 ) ) ( not ( = ?auto_129467 ?auto_129469 ) ) ( not ( = ?auto_129467 ?auto_129464 ) ) ( not ( = ?auto_129468 ?auto_129465 ) ) ( not ( = ?auto_129468 ?auto_129469 ) ) ( not ( = ?auto_129468 ?auto_129464 ) ) ( ON ?auto_129466 ?auto_129468 ) ( ON ?auto_129465 ?auto_129466 ) ( ON ?auto_129469 ?auto_129463 ) ( not ( = ?auto_129462 ?auto_129463 ) ) ( not ( = ?auto_129467 ?auto_129463 ) ) ( not ( = ?auto_129468 ?auto_129463 ) ) ( not ( = ?auto_129466 ?auto_129463 ) ) ( not ( = ?auto_129469 ?auto_129463 ) ) ( not ( = ?auto_129464 ?auto_129463 ) ) ( not ( = ?auto_129465 ?auto_129463 ) ) ( CLEAR ?auto_129465 ) ( ON ?auto_129464 ?auto_129469 ) ( CLEAR ?auto_129464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129463 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129463 ?auto_129469 )
      ( MAKE-1PILE ?auto_129462 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129470 - BLOCK
    )
    :vars
    (
      ?auto_129477 - BLOCK
      ?auto_129476 - BLOCK
      ?auto_129471 - BLOCK
      ?auto_129473 - BLOCK
      ?auto_129474 - BLOCK
      ?auto_129472 - BLOCK
      ?auto_129475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129477 ?auto_129470 ) ( ON-TABLE ?auto_129470 ) ( not ( = ?auto_129470 ?auto_129477 ) ) ( not ( = ?auto_129470 ?auto_129476 ) ) ( not ( = ?auto_129470 ?auto_129471 ) ) ( not ( = ?auto_129477 ?auto_129476 ) ) ( not ( = ?auto_129477 ?auto_129471 ) ) ( not ( = ?auto_129476 ?auto_129471 ) ) ( ON ?auto_129476 ?auto_129477 ) ( not ( = ?auto_129473 ?auto_129474 ) ) ( not ( = ?auto_129473 ?auto_129472 ) ) ( not ( = ?auto_129473 ?auto_129471 ) ) ( not ( = ?auto_129474 ?auto_129472 ) ) ( not ( = ?auto_129474 ?auto_129471 ) ) ( not ( = ?auto_129472 ?auto_129471 ) ) ( not ( = ?auto_129470 ?auto_129472 ) ) ( not ( = ?auto_129470 ?auto_129473 ) ) ( not ( = ?auto_129470 ?auto_129474 ) ) ( not ( = ?auto_129477 ?auto_129472 ) ) ( not ( = ?auto_129477 ?auto_129473 ) ) ( not ( = ?auto_129477 ?auto_129474 ) ) ( not ( = ?auto_129476 ?auto_129472 ) ) ( not ( = ?auto_129476 ?auto_129473 ) ) ( not ( = ?auto_129476 ?auto_129474 ) ) ( ON ?auto_129471 ?auto_129476 ) ( ON ?auto_129473 ?auto_129475 ) ( not ( = ?auto_129470 ?auto_129475 ) ) ( not ( = ?auto_129477 ?auto_129475 ) ) ( not ( = ?auto_129476 ?auto_129475 ) ) ( not ( = ?auto_129471 ?auto_129475 ) ) ( not ( = ?auto_129473 ?auto_129475 ) ) ( not ( = ?auto_129474 ?auto_129475 ) ) ( not ( = ?auto_129472 ?auto_129475 ) ) ( ON ?auto_129474 ?auto_129473 ) ( CLEAR ?auto_129474 ) ( ON-TABLE ?auto_129475 ) ( HOLDING ?auto_129472 ) ( CLEAR ?auto_129471 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129470 ?auto_129477 ?auto_129476 ?auto_129471 ?auto_129472 )
      ( MAKE-1PILE ?auto_129470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129478 - BLOCK
    )
    :vars
    (
      ?auto_129484 - BLOCK
      ?auto_129480 - BLOCK
      ?auto_129479 - BLOCK
      ?auto_129481 - BLOCK
      ?auto_129482 - BLOCK
      ?auto_129483 - BLOCK
      ?auto_129485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129484 ?auto_129478 ) ( ON-TABLE ?auto_129478 ) ( not ( = ?auto_129478 ?auto_129484 ) ) ( not ( = ?auto_129478 ?auto_129480 ) ) ( not ( = ?auto_129478 ?auto_129479 ) ) ( not ( = ?auto_129484 ?auto_129480 ) ) ( not ( = ?auto_129484 ?auto_129479 ) ) ( not ( = ?auto_129480 ?auto_129479 ) ) ( ON ?auto_129480 ?auto_129484 ) ( not ( = ?auto_129481 ?auto_129482 ) ) ( not ( = ?auto_129481 ?auto_129483 ) ) ( not ( = ?auto_129481 ?auto_129479 ) ) ( not ( = ?auto_129482 ?auto_129483 ) ) ( not ( = ?auto_129482 ?auto_129479 ) ) ( not ( = ?auto_129483 ?auto_129479 ) ) ( not ( = ?auto_129478 ?auto_129483 ) ) ( not ( = ?auto_129478 ?auto_129481 ) ) ( not ( = ?auto_129478 ?auto_129482 ) ) ( not ( = ?auto_129484 ?auto_129483 ) ) ( not ( = ?auto_129484 ?auto_129481 ) ) ( not ( = ?auto_129484 ?auto_129482 ) ) ( not ( = ?auto_129480 ?auto_129483 ) ) ( not ( = ?auto_129480 ?auto_129481 ) ) ( not ( = ?auto_129480 ?auto_129482 ) ) ( ON ?auto_129479 ?auto_129480 ) ( ON ?auto_129481 ?auto_129485 ) ( not ( = ?auto_129478 ?auto_129485 ) ) ( not ( = ?auto_129484 ?auto_129485 ) ) ( not ( = ?auto_129480 ?auto_129485 ) ) ( not ( = ?auto_129479 ?auto_129485 ) ) ( not ( = ?auto_129481 ?auto_129485 ) ) ( not ( = ?auto_129482 ?auto_129485 ) ) ( not ( = ?auto_129483 ?auto_129485 ) ) ( ON ?auto_129482 ?auto_129481 ) ( ON-TABLE ?auto_129485 ) ( CLEAR ?auto_129479 ) ( ON ?auto_129483 ?auto_129482 ) ( CLEAR ?auto_129483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129485 ?auto_129481 ?auto_129482 )
      ( MAKE-1PILE ?auto_129478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129486 - BLOCK
    )
    :vars
    (
      ?auto_129489 - BLOCK
      ?auto_129491 - BLOCK
      ?auto_129488 - BLOCK
      ?auto_129492 - BLOCK
      ?auto_129493 - BLOCK
      ?auto_129490 - BLOCK
      ?auto_129487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129489 ?auto_129486 ) ( ON-TABLE ?auto_129486 ) ( not ( = ?auto_129486 ?auto_129489 ) ) ( not ( = ?auto_129486 ?auto_129491 ) ) ( not ( = ?auto_129486 ?auto_129488 ) ) ( not ( = ?auto_129489 ?auto_129491 ) ) ( not ( = ?auto_129489 ?auto_129488 ) ) ( not ( = ?auto_129491 ?auto_129488 ) ) ( ON ?auto_129491 ?auto_129489 ) ( not ( = ?auto_129492 ?auto_129493 ) ) ( not ( = ?auto_129492 ?auto_129490 ) ) ( not ( = ?auto_129492 ?auto_129488 ) ) ( not ( = ?auto_129493 ?auto_129490 ) ) ( not ( = ?auto_129493 ?auto_129488 ) ) ( not ( = ?auto_129490 ?auto_129488 ) ) ( not ( = ?auto_129486 ?auto_129490 ) ) ( not ( = ?auto_129486 ?auto_129492 ) ) ( not ( = ?auto_129486 ?auto_129493 ) ) ( not ( = ?auto_129489 ?auto_129490 ) ) ( not ( = ?auto_129489 ?auto_129492 ) ) ( not ( = ?auto_129489 ?auto_129493 ) ) ( not ( = ?auto_129491 ?auto_129490 ) ) ( not ( = ?auto_129491 ?auto_129492 ) ) ( not ( = ?auto_129491 ?auto_129493 ) ) ( ON ?auto_129492 ?auto_129487 ) ( not ( = ?auto_129486 ?auto_129487 ) ) ( not ( = ?auto_129489 ?auto_129487 ) ) ( not ( = ?auto_129491 ?auto_129487 ) ) ( not ( = ?auto_129488 ?auto_129487 ) ) ( not ( = ?auto_129492 ?auto_129487 ) ) ( not ( = ?auto_129493 ?auto_129487 ) ) ( not ( = ?auto_129490 ?auto_129487 ) ) ( ON ?auto_129493 ?auto_129492 ) ( ON-TABLE ?auto_129487 ) ( ON ?auto_129490 ?auto_129493 ) ( CLEAR ?auto_129490 ) ( HOLDING ?auto_129488 ) ( CLEAR ?auto_129491 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129486 ?auto_129489 ?auto_129491 ?auto_129488 )
      ( MAKE-1PILE ?auto_129486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129494 - BLOCK
    )
    :vars
    (
      ?auto_129497 - BLOCK
      ?auto_129501 - BLOCK
      ?auto_129499 - BLOCK
      ?auto_129496 - BLOCK
      ?auto_129495 - BLOCK
      ?auto_129500 - BLOCK
      ?auto_129498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129497 ?auto_129494 ) ( ON-TABLE ?auto_129494 ) ( not ( = ?auto_129494 ?auto_129497 ) ) ( not ( = ?auto_129494 ?auto_129501 ) ) ( not ( = ?auto_129494 ?auto_129499 ) ) ( not ( = ?auto_129497 ?auto_129501 ) ) ( not ( = ?auto_129497 ?auto_129499 ) ) ( not ( = ?auto_129501 ?auto_129499 ) ) ( ON ?auto_129501 ?auto_129497 ) ( not ( = ?auto_129496 ?auto_129495 ) ) ( not ( = ?auto_129496 ?auto_129500 ) ) ( not ( = ?auto_129496 ?auto_129499 ) ) ( not ( = ?auto_129495 ?auto_129500 ) ) ( not ( = ?auto_129495 ?auto_129499 ) ) ( not ( = ?auto_129500 ?auto_129499 ) ) ( not ( = ?auto_129494 ?auto_129500 ) ) ( not ( = ?auto_129494 ?auto_129496 ) ) ( not ( = ?auto_129494 ?auto_129495 ) ) ( not ( = ?auto_129497 ?auto_129500 ) ) ( not ( = ?auto_129497 ?auto_129496 ) ) ( not ( = ?auto_129497 ?auto_129495 ) ) ( not ( = ?auto_129501 ?auto_129500 ) ) ( not ( = ?auto_129501 ?auto_129496 ) ) ( not ( = ?auto_129501 ?auto_129495 ) ) ( ON ?auto_129496 ?auto_129498 ) ( not ( = ?auto_129494 ?auto_129498 ) ) ( not ( = ?auto_129497 ?auto_129498 ) ) ( not ( = ?auto_129501 ?auto_129498 ) ) ( not ( = ?auto_129499 ?auto_129498 ) ) ( not ( = ?auto_129496 ?auto_129498 ) ) ( not ( = ?auto_129495 ?auto_129498 ) ) ( not ( = ?auto_129500 ?auto_129498 ) ) ( ON ?auto_129495 ?auto_129496 ) ( ON-TABLE ?auto_129498 ) ( ON ?auto_129500 ?auto_129495 ) ( CLEAR ?auto_129501 ) ( ON ?auto_129499 ?auto_129500 ) ( CLEAR ?auto_129499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129498 ?auto_129496 ?auto_129495 ?auto_129500 )
      ( MAKE-1PILE ?auto_129494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129502 - BLOCK
    )
    :vars
    (
      ?auto_129503 - BLOCK
      ?auto_129504 - BLOCK
      ?auto_129505 - BLOCK
      ?auto_129506 - BLOCK
      ?auto_129509 - BLOCK
      ?auto_129507 - BLOCK
      ?auto_129508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129503 ?auto_129502 ) ( ON-TABLE ?auto_129502 ) ( not ( = ?auto_129502 ?auto_129503 ) ) ( not ( = ?auto_129502 ?auto_129504 ) ) ( not ( = ?auto_129502 ?auto_129505 ) ) ( not ( = ?auto_129503 ?auto_129504 ) ) ( not ( = ?auto_129503 ?auto_129505 ) ) ( not ( = ?auto_129504 ?auto_129505 ) ) ( not ( = ?auto_129506 ?auto_129509 ) ) ( not ( = ?auto_129506 ?auto_129507 ) ) ( not ( = ?auto_129506 ?auto_129505 ) ) ( not ( = ?auto_129509 ?auto_129507 ) ) ( not ( = ?auto_129509 ?auto_129505 ) ) ( not ( = ?auto_129507 ?auto_129505 ) ) ( not ( = ?auto_129502 ?auto_129507 ) ) ( not ( = ?auto_129502 ?auto_129506 ) ) ( not ( = ?auto_129502 ?auto_129509 ) ) ( not ( = ?auto_129503 ?auto_129507 ) ) ( not ( = ?auto_129503 ?auto_129506 ) ) ( not ( = ?auto_129503 ?auto_129509 ) ) ( not ( = ?auto_129504 ?auto_129507 ) ) ( not ( = ?auto_129504 ?auto_129506 ) ) ( not ( = ?auto_129504 ?auto_129509 ) ) ( ON ?auto_129506 ?auto_129508 ) ( not ( = ?auto_129502 ?auto_129508 ) ) ( not ( = ?auto_129503 ?auto_129508 ) ) ( not ( = ?auto_129504 ?auto_129508 ) ) ( not ( = ?auto_129505 ?auto_129508 ) ) ( not ( = ?auto_129506 ?auto_129508 ) ) ( not ( = ?auto_129509 ?auto_129508 ) ) ( not ( = ?auto_129507 ?auto_129508 ) ) ( ON ?auto_129509 ?auto_129506 ) ( ON-TABLE ?auto_129508 ) ( ON ?auto_129507 ?auto_129509 ) ( ON ?auto_129505 ?auto_129507 ) ( CLEAR ?auto_129505 ) ( HOLDING ?auto_129504 ) ( CLEAR ?auto_129503 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129502 ?auto_129503 ?auto_129504 )
      ( MAKE-1PILE ?auto_129502 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129510 - BLOCK
    )
    :vars
    (
      ?auto_129511 - BLOCK
      ?auto_129514 - BLOCK
      ?auto_129516 - BLOCK
      ?auto_129517 - BLOCK
      ?auto_129515 - BLOCK
      ?auto_129512 - BLOCK
      ?auto_129513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_129511 ?auto_129510 ) ( ON-TABLE ?auto_129510 ) ( not ( = ?auto_129510 ?auto_129511 ) ) ( not ( = ?auto_129510 ?auto_129514 ) ) ( not ( = ?auto_129510 ?auto_129516 ) ) ( not ( = ?auto_129511 ?auto_129514 ) ) ( not ( = ?auto_129511 ?auto_129516 ) ) ( not ( = ?auto_129514 ?auto_129516 ) ) ( not ( = ?auto_129517 ?auto_129515 ) ) ( not ( = ?auto_129517 ?auto_129512 ) ) ( not ( = ?auto_129517 ?auto_129516 ) ) ( not ( = ?auto_129515 ?auto_129512 ) ) ( not ( = ?auto_129515 ?auto_129516 ) ) ( not ( = ?auto_129512 ?auto_129516 ) ) ( not ( = ?auto_129510 ?auto_129512 ) ) ( not ( = ?auto_129510 ?auto_129517 ) ) ( not ( = ?auto_129510 ?auto_129515 ) ) ( not ( = ?auto_129511 ?auto_129512 ) ) ( not ( = ?auto_129511 ?auto_129517 ) ) ( not ( = ?auto_129511 ?auto_129515 ) ) ( not ( = ?auto_129514 ?auto_129512 ) ) ( not ( = ?auto_129514 ?auto_129517 ) ) ( not ( = ?auto_129514 ?auto_129515 ) ) ( ON ?auto_129517 ?auto_129513 ) ( not ( = ?auto_129510 ?auto_129513 ) ) ( not ( = ?auto_129511 ?auto_129513 ) ) ( not ( = ?auto_129514 ?auto_129513 ) ) ( not ( = ?auto_129516 ?auto_129513 ) ) ( not ( = ?auto_129517 ?auto_129513 ) ) ( not ( = ?auto_129515 ?auto_129513 ) ) ( not ( = ?auto_129512 ?auto_129513 ) ) ( ON ?auto_129515 ?auto_129517 ) ( ON-TABLE ?auto_129513 ) ( ON ?auto_129512 ?auto_129515 ) ( ON ?auto_129516 ?auto_129512 ) ( CLEAR ?auto_129511 ) ( ON ?auto_129514 ?auto_129516 ) ( CLEAR ?auto_129514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129513 ?auto_129517 ?auto_129515 ?auto_129512 ?auto_129516 )
      ( MAKE-1PILE ?auto_129510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129534 - BLOCK
    )
    :vars
    (
      ?auto_129541 - BLOCK
      ?auto_129538 - BLOCK
      ?auto_129536 - BLOCK
      ?auto_129540 - BLOCK
      ?auto_129535 - BLOCK
      ?auto_129537 - BLOCK
      ?auto_129539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129534 ?auto_129541 ) ) ( not ( = ?auto_129534 ?auto_129538 ) ) ( not ( = ?auto_129534 ?auto_129536 ) ) ( not ( = ?auto_129541 ?auto_129538 ) ) ( not ( = ?auto_129541 ?auto_129536 ) ) ( not ( = ?auto_129538 ?auto_129536 ) ) ( not ( = ?auto_129540 ?auto_129535 ) ) ( not ( = ?auto_129540 ?auto_129537 ) ) ( not ( = ?auto_129540 ?auto_129536 ) ) ( not ( = ?auto_129535 ?auto_129537 ) ) ( not ( = ?auto_129535 ?auto_129536 ) ) ( not ( = ?auto_129537 ?auto_129536 ) ) ( not ( = ?auto_129534 ?auto_129537 ) ) ( not ( = ?auto_129534 ?auto_129540 ) ) ( not ( = ?auto_129534 ?auto_129535 ) ) ( not ( = ?auto_129541 ?auto_129537 ) ) ( not ( = ?auto_129541 ?auto_129540 ) ) ( not ( = ?auto_129541 ?auto_129535 ) ) ( not ( = ?auto_129538 ?auto_129537 ) ) ( not ( = ?auto_129538 ?auto_129540 ) ) ( not ( = ?auto_129538 ?auto_129535 ) ) ( ON ?auto_129540 ?auto_129539 ) ( not ( = ?auto_129534 ?auto_129539 ) ) ( not ( = ?auto_129541 ?auto_129539 ) ) ( not ( = ?auto_129538 ?auto_129539 ) ) ( not ( = ?auto_129536 ?auto_129539 ) ) ( not ( = ?auto_129540 ?auto_129539 ) ) ( not ( = ?auto_129535 ?auto_129539 ) ) ( not ( = ?auto_129537 ?auto_129539 ) ) ( ON ?auto_129535 ?auto_129540 ) ( ON-TABLE ?auto_129539 ) ( ON ?auto_129537 ?auto_129535 ) ( ON ?auto_129536 ?auto_129537 ) ( ON ?auto_129538 ?auto_129536 ) ( ON ?auto_129541 ?auto_129538 ) ( CLEAR ?auto_129541 ) ( HOLDING ?auto_129534 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129534 ?auto_129541 )
      ( MAKE-1PILE ?auto_129534 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_129542 - BLOCK
    )
    :vars
    (
      ?auto_129546 - BLOCK
      ?auto_129543 - BLOCK
      ?auto_129545 - BLOCK
      ?auto_129548 - BLOCK
      ?auto_129549 - BLOCK
      ?auto_129547 - BLOCK
      ?auto_129544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129542 ?auto_129546 ) ) ( not ( = ?auto_129542 ?auto_129543 ) ) ( not ( = ?auto_129542 ?auto_129545 ) ) ( not ( = ?auto_129546 ?auto_129543 ) ) ( not ( = ?auto_129546 ?auto_129545 ) ) ( not ( = ?auto_129543 ?auto_129545 ) ) ( not ( = ?auto_129548 ?auto_129549 ) ) ( not ( = ?auto_129548 ?auto_129547 ) ) ( not ( = ?auto_129548 ?auto_129545 ) ) ( not ( = ?auto_129549 ?auto_129547 ) ) ( not ( = ?auto_129549 ?auto_129545 ) ) ( not ( = ?auto_129547 ?auto_129545 ) ) ( not ( = ?auto_129542 ?auto_129547 ) ) ( not ( = ?auto_129542 ?auto_129548 ) ) ( not ( = ?auto_129542 ?auto_129549 ) ) ( not ( = ?auto_129546 ?auto_129547 ) ) ( not ( = ?auto_129546 ?auto_129548 ) ) ( not ( = ?auto_129546 ?auto_129549 ) ) ( not ( = ?auto_129543 ?auto_129547 ) ) ( not ( = ?auto_129543 ?auto_129548 ) ) ( not ( = ?auto_129543 ?auto_129549 ) ) ( ON ?auto_129548 ?auto_129544 ) ( not ( = ?auto_129542 ?auto_129544 ) ) ( not ( = ?auto_129546 ?auto_129544 ) ) ( not ( = ?auto_129543 ?auto_129544 ) ) ( not ( = ?auto_129545 ?auto_129544 ) ) ( not ( = ?auto_129548 ?auto_129544 ) ) ( not ( = ?auto_129549 ?auto_129544 ) ) ( not ( = ?auto_129547 ?auto_129544 ) ) ( ON ?auto_129549 ?auto_129548 ) ( ON-TABLE ?auto_129544 ) ( ON ?auto_129547 ?auto_129549 ) ( ON ?auto_129545 ?auto_129547 ) ( ON ?auto_129543 ?auto_129545 ) ( ON ?auto_129546 ?auto_129543 ) ( ON ?auto_129542 ?auto_129546 ) ( CLEAR ?auto_129542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129544 ?auto_129548 ?auto_129549 ?auto_129547 ?auto_129545 ?auto_129543 ?auto_129546 )
      ( MAKE-1PILE ?auto_129542 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129556 - BLOCK
      ?auto_129557 - BLOCK
      ?auto_129558 - BLOCK
      ?auto_129559 - BLOCK
      ?auto_129560 - BLOCK
      ?auto_129561 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_129561 ) ( CLEAR ?auto_129560 ) ( ON-TABLE ?auto_129556 ) ( ON ?auto_129557 ?auto_129556 ) ( ON ?auto_129558 ?auto_129557 ) ( ON ?auto_129559 ?auto_129558 ) ( ON ?auto_129560 ?auto_129559 ) ( not ( = ?auto_129556 ?auto_129557 ) ) ( not ( = ?auto_129556 ?auto_129558 ) ) ( not ( = ?auto_129556 ?auto_129559 ) ) ( not ( = ?auto_129556 ?auto_129560 ) ) ( not ( = ?auto_129556 ?auto_129561 ) ) ( not ( = ?auto_129557 ?auto_129558 ) ) ( not ( = ?auto_129557 ?auto_129559 ) ) ( not ( = ?auto_129557 ?auto_129560 ) ) ( not ( = ?auto_129557 ?auto_129561 ) ) ( not ( = ?auto_129558 ?auto_129559 ) ) ( not ( = ?auto_129558 ?auto_129560 ) ) ( not ( = ?auto_129558 ?auto_129561 ) ) ( not ( = ?auto_129559 ?auto_129560 ) ) ( not ( = ?auto_129559 ?auto_129561 ) ) ( not ( = ?auto_129560 ?auto_129561 ) ) )
    :subtasks
    ( ( !STACK ?auto_129561 ?auto_129560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129562 - BLOCK
      ?auto_129563 - BLOCK
      ?auto_129564 - BLOCK
      ?auto_129565 - BLOCK
      ?auto_129566 - BLOCK
      ?auto_129567 - BLOCK
    )
    :vars
    (
      ?auto_129568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_129566 ) ( ON-TABLE ?auto_129562 ) ( ON ?auto_129563 ?auto_129562 ) ( ON ?auto_129564 ?auto_129563 ) ( ON ?auto_129565 ?auto_129564 ) ( ON ?auto_129566 ?auto_129565 ) ( not ( = ?auto_129562 ?auto_129563 ) ) ( not ( = ?auto_129562 ?auto_129564 ) ) ( not ( = ?auto_129562 ?auto_129565 ) ) ( not ( = ?auto_129562 ?auto_129566 ) ) ( not ( = ?auto_129562 ?auto_129567 ) ) ( not ( = ?auto_129563 ?auto_129564 ) ) ( not ( = ?auto_129563 ?auto_129565 ) ) ( not ( = ?auto_129563 ?auto_129566 ) ) ( not ( = ?auto_129563 ?auto_129567 ) ) ( not ( = ?auto_129564 ?auto_129565 ) ) ( not ( = ?auto_129564 ?auto_129566 ) ) ( not ( = ?auto_129564 ?auto_129567 ) ) ( not ( = ?auto_129565 ?auto_129566 ) ) ( not ( = ?auto_129565 ?auto_129567 ) ) ( not ( = ?auto_129566 ?auto_129567 ) ) ( ON ?auto_129567 ?auto_129568 ) ( CLEAR ?auto_129567 ) ( HAND-EMPTY ) ( not ( = ?auto_129562 ?auto_129568 ) ) ( not ( = ?auto_129563 ?auto_129568 ) ) ( not ( = ?auto_129564 ?auto_129568 ) ) ( not ( = ?auto_129565 ?auto_129568 ) ) ( not ( = ?auto_129566 ?auto_129568 ) ) ( not ( = ?auto_129567 ?auto_129568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129567 ?auto_129568 )
      ( MAKE-6PILE ?auto_129562 ?auto_129563 ?auto_129564 ?auto_129565 ?auto_129566 ?auto_129567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129569 - BLOCK
      ?auto_129570 - BLOCK
      ?auto_129571 - BLOCK
      ?auto_129572 - BLOCK
      ?auto_129573 - BLOCK
      ?auto_129574 - BLOCK
    )
    :vars
    (
      ?auto_129575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129569 ) ( ON ?auto_129570 ?auto_129569 ) ( ON ?auto_129571 ?auto_129570 ) ( ON ?auto_129572 ?auto_129571 ) ( not ( = ?auto_129569 ?auto_129570 ) ) ( not ( = ?auto_129569 ?auto_129571 ) ) ( not ( = ?auto_129569 ?auto_129572 ) ) ( not ( = ?auto_129569 ?auto_129573 ) ) ( not ( = ?auto_129569 ?auto_129574 ) ) ( not ( = ?auto_129570 ?auto_129571 ) ) ( not ( = ?auto_129570 ?auto_129572 ) ) ( not ( = ?auto_129570 ?auto_129573 ) ) ( not ( = ?auto_129570 ?auto_129574 ) ) ( not ( = ?auto_129571 ?auto_129572 ) ) ( not ( = ?auto_129571 ?auto_129573 ) ) ( not ( = ?auto_129571 ?auto_129574 ) ) ( not ( = ?auto_129572 ?auto_129573 ) ) ( not ( = ?auto_129572 ?auto_129574 ) ) ( not ( = ?auto_129573 ?auto_129574 ) ) ( ON ?auto_129574 ?auto_129575 ) ( CLEAR ?auto_129574 ) ( not ( = ?auto_129569 ?auto_129575 ) ) ( not ( = ?auto_129570 ?auto_129575 ) ) ( not ( = ?auto_129571 ?auto_129575 ) ) ( not ( = ?auto_129572 ?auto_129575 ) ) ( not ( = ?auto_129573 ?auto_129575 ) ) ( not ( = ?auto_129574 ?auto_129575 ) ) ( HOLDING ?auto_129573 ) ( CLEAR ?auto_129572 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129569 ?auto_129570 ?auto_129571 ?auto_129572 ?auto_129573 )
      ( MAKE-6PILE ?auto_129569 ?auto_129570 ?auto_129571 ?auto_129572 ?auto_129573 ?auto_129574 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129576 - BLOCK
      ?auto_129577 - BLOCK
      ?auto_129578 - BLOCK
      ?auto_129579 - BLOCK
      ?auto_129580 - BLOCK
      ?auto_129581 - BLOCK
    )
    :vars
    (
      ?auto_129582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129576 ) ( ON ?auto_129577 ?auto_129576 ) ( ON ?auto_129578 ?auto_129577 ) ( ON ?auto_129579 ?auto_129578 ) ( not ( = ?auto_129576 ?auto_129577 ) ) ( not ( = ?auto_129576 ?auto_129578 ) ) ( not ( = ?auto_129576 ?auto_129579 ) ) ( not ( = ?auto_129576 ?auto_129580 ) ) ( not ( = ?auto_129576 ?auto_129581 ) ) ( not ( = ?auto_129577 ?auto_129578 ) ) ( not ( = ?auto_129577 ?auto_129579 ) ) ( not ( = ?auto_129577 ?auto_129580 ) ) ( not ( = ?auto_129577 ?auto_129581 ) ) ( not ( = ?auto_129578 ?auto_129579 ) ) ( not ( = ?auto_129578 ?auto_129580 ) ) ( not ( = ?auto_129578 ?auto_129581 ) ) ( not ( = ?auto_129579 ?auto_129580 ) ) ( not ( = ?auto_129579 ?auto_129581 ) ) ( not ( = ?auto_129580 ?auto_129581 ) ) ( ON ?auto_129581 ?auto_129582 ) ( not ( = ?auto_129576 ?auto_129582 ) ) ( not ( = ?auto_129577 ?auto_129582 ) ) ( not ( = ?auto_129578 ?auto_129582 ) ) ( not ( = ?auto_129579 ?auto_129582 ) ) ( not ( = ?auto_129580 ?auto_129582 ) ) ( not ( = ?auto_129581 ?auto_129582 ) ) ( CLEAR ?auto_129579 ) ( ON ?auto_129580 ?auto_129581 ) ( CLEAR ?auto_129580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129582 ?auto_129581 )
      ( MAKE-6PILE ?auto_129576 ?auto_129577 ?auto_129578 ?auto_129579 ?auto_129580 ?auto_129581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129583 - BLOCK
      ?auto_129584 - BLOCK
      ?auto_129585 - BLOCK
      ?auto_129586 - BLOCK
      ?auto_129587 - BLOCK
      ?auto_129588 - BLOCK
    )
    :vars
    (
      ?auto_129589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129583 ) ( ON ?auto_129584 ?auto_129583 ) ( ON ?auto_129585 ?auto_129584 ) ( not ( = ?auto_129583 ?auto_129584 ) ) ( not ( = ?auto_129583 ?auto_129585 ) ) ( not ( = ?auto_129583 ?auto_129586 ) ) ( not ( = ?auto_129583 ?auto_129587 ) ) ( not ( = ?auto_129583 ?auto_129588 ) ) ( not ( = ?auto_129584 ?auto_129585 ) ) ( not ( = ?auto_129584 ?auto_129586 ) ) ( not ( = ?auto_129584 ?auto_129587 ) ) ( not ( = ?auto_129584 ?auto_129588 ) ) ( not ( = ?auto_129585 ?auto_129586 ) ) ( not ( = ?auto_129585 ?auto_129587 ) ) ( not ( = ?auto_129585 ?auto_129588 ) ) ( not ( = ?auto_129586 ?auto_129587 ) ) ( not ( = ?auto_129586 ?auto_129588 ) ) ( not ( = ?auto_129587 ?auto_129588 ) ) ( ON ?auto_129588 ?auto_129589 ) ( not ( = ?auto_129583 ?auto_129589 ) ) ( not ( = ?auto_129584 ?auto_129589 ) ) ( not ( = ?auto_129585 ?auto_129589 ) ) ( not ( = ?auto_129586 ?auto_129589 ) ) ( not ( = ?auto_129587 ?auto_129589 ) ) ( not ( = ?auto_129588 ?auto_129589 ) ) ( ON ?auto_129587 ?auto_129588 ) ( CLEAR ?auto_129587 ) ( ON-TABLE ?auto_129589 ) ( HOLDING ?auto_129586 ) ( CLEAR ?auto_129585 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129583 ?auto_129584 ?auto_129585 ?auto_129586 )
      ( MAKE-6PILE ?auto_129583 ?auto_129584 ?auto_129585 ?auto_129586 ?auto_129587 ?auto_129588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129590 - BLOCK
      ?auto_129591 - BLOCK
      ?auto_129592 - BLOCK
      ?auto_129593 - BLOCK
      ?auto_129594 - BLOCK
      ?auto_129595 - BLOCK
    )
    :vars
    (
      ?auto_129596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129590 ) ( ON ?auto_129591 ?auto_129590 ) ( ON ?auto_129592 ?auto_129591 ) ( not ( = ?auto_129590 ?auto_129591 ) ) ( not ( = ?auto_129590 ?auto_129592 ) ) ( not ( = ?auto_129590 ?auto_129593 ) ) ( not ( = ?auto_129590 ?auto_129594 ) ) ( not ( = ?auto_129590 ?auto_129595 ) ) ( not ( = ?auto_129591 ?auto_129592 ) ) ( not ( = ?auto_129591 ?auto_129593 ) ) ( not ( = ?auto_129591 ?auto_129594 ) ) ( not ( = ?auto_129591 ?auto_129595 ) ) ( not ( = ?auto_129592 ?auto_129593 ) ) ( not ( = ?auto_129592 ?auto_129594 ) ) ( not ( = ?auto_129592 ?auto_129595 ) ) ( not ( = ?auto_129593 ?auto_129594 ) ) ( not ( = ?auto_129593 ?auto_129595 ) ) ( not ( = ?auto_129594 ?auto_129595 ) ) ( ON ?auto_129595 ?auto_129596 ) ( not ( = ?auto_129590 ?auto_129596 ) ) ( not ( = ?auto_129591 ?auto_129596 ) ) ( not ( = ?auto_129592 ?auto_129596 ) ) ( not ( = ?auto_129593 ?auto_129596 ) ) ( not ( = ?auto_129594 ?auto_129596 ) ) ( not ( = ?auto_129595 ?auto_129596 ) ) ( ON ?auto_129594 ?auto_129595 ) ( ON-TABLE ?auto_129596 ) ( CLEAR ?auto_129592 ) ( ON ?auto_129593 ?auto_129594 ) ( CLEAR ?auto_129593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129596 ?auto_129595 ?auto_129594 )
      ( MAKE-6PILE ?auto_129590 ?auto_129591 ?auto_129592 ?auto_129593 ?auto_129594 ?auto_129595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129597 - BLOCK
      ?auto_129598 - BLOCK
      ?auto_129599 - BLOCK
      ?auto_129600 - BLOCK
      ?auto_129601 - BLOCK
      ?auto_129602 - BLOCK
    )
    :vars
    (
      ?auto_129603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129597 ) ( ON ?auto_129598 ?auto_129597 ) ( not ( = ?auto_129597 ?auto_129598 ) ) ( not ( = ?auto_129597 ?auto_129599 ) ) ( not ( = ?auto_129597 ?auto_129600 ) ) ( not ( = ?auto_129597 ?auto_129601 ) ) ( not ( = ?auto_129597 ?auto_129602 ) ) ( not ( = ?auto_129598 ?auto_129599 ) ) ( not ( = ?auto_129598 ?auto_129600 ) ) ( not ( = ?auto_129598 ?auto_129601 ) ) ( not ( = ?auto_129598 ?auto_129602 ) ) ( not ( = ?auto_129599 ?auto_129600 ) ) ( not ( = ?auto_129599 ?auto_129601 ) ) ( not ( = ?auto_129599 ?auto_129602 ) ) ( not ( = ?auto_129600 ?auto_129601 ) ) ( not ( = ?auto_129600 ?auto_129602 ) ) ( not ( = ?auto_129601 ?auto_129602 ) ) ( ON ?auto_129602 ?auto_129603 ) ( not ( = ?auto_129597 ?auto_129603 ) ) ( not ( = ?auto_129598 ?auto_129603 ) ) ( not ( = ?auto_129599 ?auto_129603 ) ) ( not ( = ?auto_129600 ?auto_129603 ) ) ( not ( = ?auto_129601 ?auto_129603 ) ) ( not ( = ?auto_129602 ?auto_129603 ) ) ( ON ?auto_129601 ?auto_129602 ) ( ON-TABLE ?auto_129603 ) ( ON ?auto_129600 ?auto_129601 ) ( CLEAR ?auto_129600 ) ( HOLDING ?auto_129599 ) ( CLEAR ?auto_129598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129597 ?auto_129598 ?auto_129599 )
      ( MAKE-6PILE ?auto_129597 ?auto_129598 ?auto_129599 ?auto_129600 ?auto_129601 ?auto_129602 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129604 - BLOCK
      ?auto_129605 - BLOCK
      ?auto_129606 - BLOCK
      ?auto_129607 - BLOCK
      ?auto_129608 - BLOCK
      ?auto_129609 - BLOCK
    )
    :vars
    (
      ?auto_129610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129604 ) ( ON ?auto_129605 ?auto_129604 ) ( not ( = ?auto_129604 ?auto_129605 ) ) ( not ( = ?auto_129604 ?auto_129606 ) ) ( not ( = ?auto_129604 ?auto_129607 ) ) ( not ( = ?auto_129604 ?auto_129608 ) ) ( not ( = ?auto_129604 ?auto_129609 ) ) ( not ( = ?auto_129605 ?auto_129606 ) ) ( not ( = ?auto_129605 ?auto_129607 ) ) ( not ( = ?auto_129605 ?auto_129608 ) ) ( not ( = ?auto_129605 ?auto_129609 ) ) ( not ( = ?auto_129606 ?auto_129607 ) ) ( not ( = ?auto_129606 ?auto_129608 ) ) ( not ( = ?auto_129606 ?auto_129609 ) ) ( not ( = ?auto_129607 ?auto_129608 ) ) ( not ( = ?auto_129607 ?auto_129609 ) ) ( not ( = ?auto_129608 ?auto_129609 ) ) ( ON ?auto_129609 ?auto_129610 ) ( not ( = ?auto_129604 ?auto_129610 ) ) ( not ( = ?auto_129605 ?auto_129610 ) ) ( not ( = ?auto_129606 ?auto_129610 ) ) ( not ( = ?auto_129607 ?auto_129610 ) ) ( not ( = ?auto_129608 ?auto_129610 ) ) ( not ( = ?auto_129609 ?auto_129610 ) ) ( ON ?auto_129608 ?auto_129609 ) ( ON-TABLE ?auto_129610 ) ( ON ?auto_129607 ?auto_129608 ) ( CLEAR ?auto_129605 ) ( ON ?auto_129606 ?auto_129607 ) ( CLEAR ?auto_129606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129610 ?auto_129609 ?auto_129608 ?auto_129607 )
      ( MAKE-6PILE ?auto_129604 ?auto_129605 ?auto_129606 ?auto_129607 ?auto_129608 ?auto_129609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129611 - BLOCK
      ?auto_129612 - BLOCK
      ?auto_129613 - BLOCK
      ?auto_129614 - BLOCK
      ?auto_129615 - BLOCK
      ?auto_129616 - BLOCK
    )
    :vars
    (
      ?auto_129617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129611 ) ( not ( = ?auto_129611 ?auto_129612 ) ) ( not ( = ?auto_129611 ?auto_129613 ) ) ( not ( = ?auto_129611 ?auto_129614 ) ) ( not ( = ?auto_129611 ?auto_129615 ) ) ( not ( = ?auto_129611 ?auto_129616 ) ) ( not ( = ?auto_129612 ?auto_129613 ) ) ( not ( = ?auto_129612 ?auto_129614 ) ) ( not ( = ?auto_129612 ?auto_129615 ) ) ( not ( = ?auto_129612 ?auto_129616 ) ) ( not ( = ?auto_129613 ?auto_129614 ) ) ( not ( = ?auto_129613 ?auto_129615 ) ) ( not ( = ?auto_129613 ?auto_129616 ) ) ( not ( = ?auto_129614 ?auto_129615 ) ) ( not ( = ?auto_129614 ?auto_129616 ) ) ( not ( = ?auto_129615 ?auto_129616 ) ) ( ON ?auto_129616 ?auto_129617 ) ( not ( = ?auto_129611 ?auto_129617 ) ) ( not ( = ?auto_129612 ?auto_129617 ) ) ( not ( = ?auto_129613 ?auto_129617 ) ) ( not ( = ?auto_129614 ?auto_129617 ) ) ( not ( = ?auto_129615 ?auto_129617 ) ) ( not ( = ?auto_129616 ?auto_129617 ) ) ( ON ?auto_129615 ?auto_129616 ) ( ON-TABLE ?auto_129617 ) ( ON ?auto_129614 ?auto_129615 ) ( ON ?auto_129613 ?auto_129614 ) ( CLEAR ?auto_129613 ) ( HOLDING ?auto_129612 ) ( CLEAR ?auto_129611 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129611 ?auto_129612 )
      ( MAKE-6PILE ?auto_129611 ?auto_129612 ?auto_129613 ?auto_129614 ?auto_129615 ?auto_129616 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129618 - BLOCK
      ?auto_129619 - BLOCK
      ?auto_129620 - BLOCK
      ?auto_129621 - BLOCK
      ?auto_129622 - BLOCK
      ?auto_129623 - BLOCK
    )
    :vars
    (
      ?auto_129624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129618 ) ( not ( = ?auto_129618 ?auto_129619 ) ) ( not ( = ?auto_129618 ?auto_129620 ) ) ( not ( = ?auto_129618 ?auto_129621 ) ) ( not ( = ?auto_129618 ?auto_129622 ) ) ( not ( = ?auto_129618 ?auto_129623 ) ) ( not ( = ?auto_129619 ?auto_129620 ) ) ( not ( = ?auto_129619 ?auto_129621 ) ) ( not ( = ?auto_129619 ?auto_129622 ) ) ( not ( = ?auto_129619 ?auto_129623 ) ) ( not ( = ?auto_129620 ?auto_129621 ) ) ( not ( = ?auto_129620 ?auto_129622 ) ) ( not ( = ?auto_129620 ?auto_129623 ) ) ( not ( = ?auto_129621 ?auto_129622 ) ) ( not ( = ?auto_129621 ?auto_129623 ) ) ( not ( = ?auto_129622 ?auto_129623 ) ) ( ON ?auto_129623 ?auto_129624 ) ( not ( = ?auto_129618 ?auto_129624 ) ) ( not ( = ?auto_129619 ?auto_129624 ) ) ( not ( = ?auto_129620 ?auto_129624 ) ) ( not ( = ?auto_129621 ?auto_129624 ) ) ( not ( = ?auto_129622 ?auto_129624 ) ) ( not ( = ?auto_129623 ?auto_129624 ) ) ( ON ?auto_129622 ?auto_129623 ) ( ON-TABLE ?auto_129624 ) ( ON ?auto_129621 ?auto_129622 ) ( ON ?auto_129620 ?auto_129621 ) ( CLEAR ?auto_129618 ) ( ON ?auto_129619 ?auto_129620 ) ( CLEAR ?auto_129619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129624 ?auto_129623 ?auto_129622 ?auto_129621 ?auto_129620 )
      ( MAKE-6PILE ?auto_129618 ?auto_129619 ?auto_129620 ?auto_129621 ?auto_129622 ?auto_129623 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129625 - BLOCK
      ?auto_129626 - BLOCK
      ?auto_129627 - BLOCK
      ?auto_129628 - BLOCK
      ?auto_129629 - BLOCK
      ?auto_129630 - BLOCK
    )
    :vars
    (
      ?auto_129631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129625 ?auto_129626 ) ) ( not ( = ?auto_129625 ?auto_129627 ) ) ( not ( = ?auto_129625 ?auto_129628 ) ) ( not ( = ?auto_129625 ?auto_129629 ) ) ( not ( = ?auto_129625 ?auto_129630 ) ) ( not ( = ?auto_129626 ?auto_129627 ) ) ( not ( = ?auto_129626 ?auto_129628 ) ) ( not ( = ?auto_129626 ?auto_129629 ) ) ( not ( = ?auto_129626 ?auto_129630 ) ) ( not ( = ?auto_129627 ?auto_129628 ) ) ( not ( = ?auto_129627 ?auto_129629 ) ) ( not ( = ?auto_129627 ?auto_129630 ) ) ( not ( = ?auto_129628 ?auto_129629 ) ) ( not ( = ?auto_129628 ?auto_129630 ) ) ( not ( = ?auto_129629 ?auto_129630 ) ) ( ON ?auto_129630 ?auto_129631 ) ( not ( = ?auto_129625 ?auto_129631 ) ) ( not ( = ?auto_129626 ?auto_129631 ) ) ( not ( = ?auto_129627 ?auto_129631 ) ) ( not ( = ?auto_129628 ?auto_129631 ) ) ( not ( = ?auto_129629 ?auto_129631 ) ) ( not ( = ?auto_129630 ?auto_129631 ) ) ( ON ?auto_129629 ?auto_129630 ) ( ON-TABLE ?auto_129631 ) ( ON ?auto_129628 ?auto_129629 ) ( ON ?auto_129627 ?auto_129628 ) ( ON ?auto_129626 ?auto_129627 ) ( CLEAR ?auto_129626 ) ( HOLDING ?auto_129625 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129625 )
      ( MAKE-6PILE ?auto_129625 ?auto_129626 ?auto_129627 ?auto_129628 ?auto_129629 ?auto_129630 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129632 - BLOCK
      ?auto_129633 - BLOCK
      ?auto_129634 - BLOCK
      ?auto_129635 - BLOCK
      ?auto_129636 - BLOCK
      ?auto_129637 - BLOCK
    )
    :vars
    (
      ?auto_129638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129632 ?auto_129633 ) ) ( not ( = ?auto_129632 ?auto_129634 ) ) ( not ( = ?auto_129632 ?auto_129635 ) ) ( not ( = ?auto_129632 ?auto_129636 ) ) ( not ( = ?auto_129632 ?auto_129637 ) ) ( not ( = ?auto_129633 ?auto_129634 ) ) ( not ( = ?auto_129633 ?auto_129635 ) ) ( not ( = ?auto_129633 ?auto_129636 ) ) ( not ( = ?auto_129633 ?auto_129637 ) ) ( not ( = ?auto_129634 ?auto_129635 ) ) ( not ( = ?auto_129634 ?auto_129636 ) ) ( not ( = ?auto_129634 ?auto_129637 ) ) ( not ( = ?auto_129635 ?auto_129636 ) ) ( not ( = ?auto_129635 ?auto_129637 ) ) ( not ( = ?auto_129636 ?auto_129637 ) ) ( ON ?auto_129637 ?auto_129638 ) ( not ( = ?auto_129632 ?auto_129638 ) ) ( not ( = ?auto_129633 ?auto_129638 ) ) ( not ( = ?auto_129634 ?auto_129638 ) ) ( not ( = ?auto_129635 ?auto_129638 ) ) ( not ( = ?auto_129636 ?auto_129638 ) ) ( not ( = ?auto_129637 ?auto_129638 ) ) ( ON ?auto_129636 ?auto_129637 ) ( ON-TABLE ?auto_129638 ) ( ON ?auto_129635 ?auto_129636 ) ( ON ?auto_129634 ?auto_129635 ) ( ON ?auto_129633 ?auto_129634 ) ( ON ?auto_129632 ?auto_129633 ) ( CLEAR ?auto_129632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129638 ?auto_129637 ?auto_129636 ?auto_129635 ?auto_129634 ?auto_129633 )
      ( MAKE-6PILE ?auto_129632 ?auto_129633 ?auto_129634 ?auto_129635 ?auto_129636 ?auto_129637 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129639 - BLOCK
      ?auto_129640 - BLOCK
      ?auto_129641 - BLOCK
      ?auto_129642 - BLOCK
      ?auto_129643 - BLOCK
      ?auto_129644 - BLOCK
    )
    :vars
    (
      ?auto_129645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129639 ?auto_129640 ) ) ( not ( = ?auto_129639 ?auto_129641 ) ) ( not ( = ?auto_129639 ?auto_129642 ) ) ( not ( = ?auto_129639 ?auto_129643 ) ) ( not ( = ?auto_129639 ?auto_129644 ) ) ( not ( = ?auto_129640 ?auto_129641 ) ) ( not ( = ?auto_129640 ?auto_129642 ) ) ( not ( = ?auto_129640 ?auto_129643 ) ) ( not ( = ?auto_129640 ?auto_129644 ) ) ( not ( = ?auto_129641 ?auto_129642 ) ) ( not ( = ?auto_129641 ?auto_129643 ) ) ( not ( = ?auto_129641 ?auto_129644 ) ) ( not ( = ?auto_129642 ?auto_129643 ) ) ( not ( = ?auto_129642 ?auto_129644 ) ) ( not ( = ?auto_129643 ?auto_129644 ) ) ( ON ?auto_129644 ?auto_129645 ) ( not ( = ?auto_129639 ?auto_129645 ) ) ( not ( = ?auto_129640 ?auto_129645 ) ) ( not ( = ?auto_129641 ?auto_129645 ) ) ( not ( = ?auto_129642 ?auto_129645 ) ) ( not ( = ?auto_129643 ?auto_129645 ) ) ( not ( = ?auto_129644 ?auto_129645 ) ) ( ON ?auto_129643 ?auto_129644 ) ( ON-TABLE ?auto_129645 ) ( ON ?auto_129642 ?auto_129643 ) ( ON ?auto_129641 ?auto_129642 ) ( ON ?auto_129640 ?auto_129641 ) ( HOLDING ?auto_129639 ) ( CLEAR ?auto_129640 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129645 ?auto_129644 ?auto_129643 ?auto_129642 ?auto_129641 ?auto_129640 ?auto_129639 )
      ( MAKE-6PILE ?auto_129639 ?auto_129640 ?auto_129641 ?auto_129642 ?auto_129643 ?auto_129644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129646 - BLOCK
      ?auto_129647 - BLOCK
      ?auto_129648 - BLOCK
      ?auto_129649 - BLOCK
      ?auto_129650 - BLOCK
      ?auto_129651 - BLOCK
    )
    :vars
    (
      ?auto_129652 - BLOCK
      ?auto_129653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129646 ?auto_129647 ) ) ( not ( = ?auto_129646 ?auto_129648 ) ) ( not ( = ?auto_129646 ?auto_129649 ) ) ( not ( = ?auto_129646 ?auto_129650 ) ) ( not ( = ?auto_129646 ?auto_129651 ) ) ( not ( = ?auto_129647 ?auto_129648 ) ) ( not ( = ?auto_129647 ?auto_129649 ) ) ( not ( = ?auto_129647 ?auto_129650 ) ) ( not ( = ?auto_129647 ?auto_129651 ) ) ( not ( = ?auto_129648 ?auto_129649 ) ) ( not ( = ?auto_129648 ?auto_129650 ) ) ( not ( = ?auto_129648 ?auto_129651 ) ) ( not ( = ?auto_129649 ?auto_129650 ) ) ( not ( = ?auto_129649 ?auto_129651 ) ) ( not ( = ?auto_129650 ?auto_129651 ) ) ( ON ?auto_129651 ?auto_129652 ) ( not ( = ?auto_129646 ?auto_129652 ) ) ( not ( = ?auto_129647 ?auto_129652 ) ) ( not ( = ?auto_129648 ?auto_129652 ) ) ( not ( = ?auto_129649 ?auto_129652 ) ) ( not ( = ?auto_129650 ?auto_129652 ) ) ( not ( = ?auto_129651 ?auto_129652 ) ) ( ON ?auto_129650 ?auto_129651 ) ( ON-TABLE ?auto_129652 ) ( ON ?auto_129649 ?auto_129650 ) ( ON ?auto_129648 ?auto_129649 ) ( ON ?auto_129647 ?auto_129648 ) ( CLEAR ?auto_129647 ) ( ON ?auto_129646 ?auto_129653 ) ( CLEAR ?auto_129646 ) ( HAND-EMPTY ) ( not ( = ?auto_129646 ?auto_129653 ) ) ( not ( = ?auto_129647 ?auto_129653 ) ) ( not ( = ?auto_129648 ?auto_129653 ) ) ( not ( = ?auto_129649 ?auto_129653 ) ) ( not ( = ?auto_129650 ?auto_129653 ) ) ( not ( = ?auto_129651 ?auto_129653 ) ) ( not ( = ?auto_129652 ?auto_129653 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129646 ?auto_129653 )
      ( MAKE-6PILE ?auto_129646 ?auto_129647 ?auto_129648 ?auto_129649 ?auto_129650 ?auto_129651 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129654 - BLOCK
      ?auto_129655 - BLOCK
      ?auto_129656 - BLOCK
      ?auto_129657 - BLOCK
      ?auto_129658 - BLOCK
      ?auto_129659 - BLOCK
    )
    :vars
    (
      ?auto_129661 - BLOCK
      ?auto_129660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129654 ?auto_129655 ) ) ( not ( = ?auto_129654 ?auto_129656 ) ) ( not ( = ?auto_129654 ?auto_129657 ) ) ( not ( = ?auto_129654 ?auto_129658 ) ) ( not ( = ?auto_129654 ?auto_129659 ) ) ( not ( = ?auto_129655 ?auto_129656 ) ) ( not ( = ?auto_129655 ?auto_129657 ) ) ( not ( = ?auto_129655 ?auto_129658 ) ) ( not ( = ?auto_129655 ?auto_129659 ) ) ( not ( = ?auto_129656 ?auto_129657 ) ) ( not ( = ?auto_129656 ?auto_129658 ) ) ( not ( = ?auto_129656 ?auto_129659 ) ) ( not ( = ?auto_129657 ?auto_129658 ) ) ( not ( = ?auto_129657 ?auto_129659 ) ) ( not ( = ?auto_129658 ?auto_129659 ) ) ( ON ?auto_129659 ?auto_129661 ) ( not ( = ?auto_129654 ?auto_129661 ) ) ( not ( = ?auto_129655 ?auto_129661 ) ) ( not ( = ?auto_129656 ?auto_129661 ) ) ( not ( = ?auto_129657 ?auto_129661 ) ) ( not ( = ?auto_129658 ?auto_129661 ) ) ( not ( = ?auto_129659 ?auto_129661 ) ) ( ON ?auto_129658 ?auto_129659 ) ( ON-TABLE ?auto_129661 ) ( ON ?auto_129657 ?auto_129658 ) ( ON ?auto_129656 ?auto_129657 ) ( ON ?auto_129654 ?auto_129660 ) ( CLEAR ?auto_129654 ) ( not ( = ?auto_129654 ?auto_129660 ) ) ( not ( = ?auto_129655 ?auto_129660 ) ) ( not ( = ?auto_129656 ?auto_129660 ) ) ( not ( = ?auto_129657 ?auto_129660 ) ) ( not ( = ?auto_129658 ?auto_129660 ) ) ( not ( = ?auto_129659 ?auto_129660 ) ) ( not ( = ?auto_129661 ?auto_129660 ) ) ( HOLDING ?auto_129655 ) ( CLEAR ?auto_129656 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129661 ?auto_129659 ?auto_129658 ?auto_129657 ?auto_129656 ?auto_129655 )
      ( MAKE-6PILE ?auto_129654 ?auto_129655 ?auto_129656 ?auto_129657 ?auto_129658 ?auto_129659 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129662 - BLOCK
      ?auto_129663 - BLOCK
      ?auto_129664 - BLOCK
      ?auto_129665 - BLOCK
      ?auto_129666 - BLOCK
      ?auto_129667 - BLOCK
    )
    :vars
    (
      ?auto_129669 - BLOCK
      ?auto_129668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129662 ?auto_129663 ) ) ( not ( = ?auto_129662 ?auto_129664 ) ) ( not ( = ?auto_129662 ?auto_129665 ) ) ( not ( = ?auto_129662 ?auto_129666 ) ) ( not ( = ?auto_129662 ?auto_129667 ) ) ( not ( = ?auto_129663 ?auto_129664 ) ) ( not ( = ?auto_129663 ?auto_129665 ) ) ( not ( = ?auto_129663 ?auto_129666 ) ) ( not ( = ?auto_129663 ?auto_129667 ) ) ( not ( = ?auto_129664 ?auto_129665 ) ) ( not ( = ?auto_129664 ?auto_129666 ) ) ( not ( = ?auto_129664 ?auto_129667 ) ) ( not ( = ?auto_129665 ?auto_129666 ) ) ( not ( = ?auto_129665 ?auto_129667 ) ) ( not ( = ?auto_129666 ?auto_129667 ) ) ( ON ?auto_129667 ?auto_129669 ) ( not ( = ?auto_129662 ?auto_129669 ) ) ( not ( = ?auto_129663 ?auto_129669 ) ) ( not ( = ?auto_129664 ?auto_129669 ) ) ( not ( = ?auto_129665 ?auto_129669 ) ) ( not ( = ?auto_129666 ?auto_129669 ) ) ( not ( = ?auto_129667 ?auto_129669 ) ) ( ON ?auto_129666 ?auto_129667 ) ( ON-TABLE ?auto_129669 ) ( ON ?auto_129665 ?auto_129666 ) ( ON ?auto_129664 ?auto_129665 ) ( ON ?auto_129662 ?auto_129668 ) ( not ( = ?auto_129662 ?auto_129668 ) ) ( not ( = ?auto_129663 ?auto_129668 ) ) ( not ( = ?auto_129664 ?auto_129668 ) ) ( not ( = ?auto_129665 ?auto_129668 ) ) ( not ( = ?auto_129666 ?auto_129668 ) ) ( not ( = ?auto_129667 ?auto_129668 ) ) ( not ( = ?auto_129669 ?auto_129668 ) ) ( CLEAR ?auto_129664 ) ( ON ?auto_129663 ?auto_129662 ) ( CLEAR ?auto_129663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129668 ?auto_129662 )
      ( MAKE-6PILE ?auto_129662 ?auto_129663 ?auto_129664 ?auto_129665 ?auto_129666 ?auto_129667 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129670 - BLOCK
      ?auto_129671 - BLOCK
      ?auto_129672 - BLOCK
      ?auto_129673 - BLOCK
      ?auto_129674 - BLOCK
      ?auto_129675 - BLOCK
    )
    :vars
    (
      ?auto_129677 - BLOCK
      ?auto_129676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129670 ?auto_129671 ) ) ( not ( = ?auto_129670 ?auto_129672 ) ) ( not ( = ?auto_129670 ?auto_129673 ) ) ( not ( = ?auto_129670 ?auto_129674 ) ) ( not ( = ?auto_129670 ?auto_129675 ) ) ( not ( = ?auto_129671 ?auto_129672 ) ) ( not ( = ?auto_129671 ?auto_129673 ) ) ( not ( = ?auto_129671 ?auto_129674 ) ) ( not ( = ?auto_129671 ?auto_129675 ) ) ( not ( = ?auto_129672 ?auto_129673 ) ) ( not ( = ?auto_129672 ?auto_129674 ) ) ( not ( = ?auto_129672 ?auto_129675 ) ) ( not ( = ?auto_129673 ?auto_129674 ) ) ( not ( = ?auto_129673 ?auto_129675 ) ) ( not ( = ?auto_129674 ?auto_129675 ) ) ( ON ?auto_129675 ?auto_129677 ) ( not ( = ?auto_129670 ?auto_129677 ) ) ( not ( = ?auto_129671 ?auto_129677 ) ) ( not ( = ?auto_129672 ?auto_129677 ) ) ( not ( = ?auto_129673 ?auto_129677 ) ) ( not ( = ?auto_129674 ?auto_129677 ) ) ( not ( = ?auto_129675 ?auto_129677 ) ) ( ON ?auto_129674 ?auto_129675 ) ( ON-TABLE ?auto_129677 ) ( ON ?auto_129673 ?auto_129674 ) ( ON ?auto_129670 ?auto_129676 ) ( not ( = ?auto_129670 ?auto_129676 ) ) ( not ( = ?auto_129671 ?auto_129676 ) ) ( not ( = ?auto_129672 ?auto_129676 ) ) ( not ( = ?auto_129673 ?auto_129676 ) ) ( not ( = ?auto_129674 ?auto_129676 ) ) ( not ( = ?auto_129675 ?auto_129676 ) ) ( not ( = ?auto_129677 ?auto_129676 ) ) ( ON ?auto_129671 ?auto_129670 ) ( CLEAR ?auto_129671 ) ( ON-TABLE ?auto_129676 ) ( HOLDING ?auto_129672 ) ( CLEAR ?auto_129673 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129677 ?auto_129675 ?auto_129674 ?auto_129673 ?auto_129672 )
      ( MAKE-6PILE ?auto_129670 ?auto_129671 ?auto_129672 ?auto_129673 ?auto_129674 ?auto_129675 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129678 - BLOCK
      ?auto_129679 - BLOCK
      ?auto_129680 - BLOCK
      ?auto_129681 - BLOCK
      ?auto_129682 - BLOCK
      ?auto_129683 - BLOCK
    )
    :vars
    (
      ?auto_129685 - BLOCK
      ?auto_129684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129678 ?auto_129679 ) ) ( not ( = ?auto_129678 ?auto_129680 ) ) ( not ( = ?auto_129678 ?auto_129681 ) ) ( not ( = ?auto_129678 ?auto_129682 ) ) ( not ( = ?auto_129678 ?auto_129683 ) ) ( not ( = ?auto_129679 ?auto_129680 ) ) ( not ( = ?auto_129679 ?auto_129681 ) ) ( not ( = ?auto_129679 ?auto_129682 ) ) ( not ( = ?auto_129679 ?auto_129683 ) ) ( not ( = ?auto_129680 ?auto_129681 ) ) ( not ( = ?auto_129680 ?auto_129682 ) ) ( not ( = ?auto_129680 ?auto_129683 ) ) ( not ( = ?auto_129681 ?auto_129682 ) ) ( not ( = ?auto_129681 ?auto_129683 ) ) ( not ( = ?auto_129682 ?auto_129683 ) ) ( ON ?auto_129683 ?auto_129685 ) ( not ( = ?auto_129678 ?auto_129685 ) ) ( not ( = ?auto_129679 ?auto_129685 ) ) ( not ( = ?auto_129680 ?auto_129685 ) ) ( not ( = ?auto_129681 ?auto_129685 ) ) ( not ( = ?auto_129682 ?auto_129685 ) ) ( not ( = ?auto_129683 ?auto_129685 ) ) ( ON ?auto_129682 ?auto_129683 ) ( ON-TABLE ?auto_129685 ) ( ON ?auto_129681 ?auto_129682 ) ( ON ?auto_129678 ?auto_129684 ) ( not ( = ?auto_129678 ?auto_129684 ) ) ( not ( = ?auto_129679 ?auto_129684 ) ) ( not ( = ?auto_129680 ?auto_129684 ) ) ( not ( = ?auto_129681 ?auto_129684 ) ) ( not ( = ?auto_129682 ?auto_129684 ) ) ( not ( = ?auto_129683 ?auto_129684 ) ) ( not ( = ?auto_129685 ?auto_129684 ) ) ( ON ?auto_129679 ?auto_129678 ) ( ON-TABLE ?auto_129684 ) ( CLEAR ?auto_129681 ) ( ON ?auto_129680 ?auto_129679 ) ( CLEAR ?auto_129680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129684 ?auto_129678 ?auto_129679 )
      ( MAKE-6PILE ?auto_129678 ?auto_129679 ?auto_129680 ?auto_129681 ?auto_129682 ?auto_129683 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129686 - BLOCK
      ?auto_129687 - BLOCK
      ?auto_129688 - BLOCK
      ?auto_129689 - BLOCK
      ?auto_129690 - BLOCK
      ?auto_129691 - BLOCK
    )
    :vars
    (
      ?auto_129693 - BLOCK
      ?auto_129692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129686 ?auto_129687 ) ) ( not ( = ?auto_129686 ?auto_129688 ) ) ( not ( = ?auto_129686 ?auto_129689 ) ) ( not ( = ?auto_129686 ?auto_129690 ) ) ( not ( = ?auto_129686 ?auto_129691 ) ) ( not ( = ?auto_129687 ?auto_129688 ) ) ( not ( = ?auto_129687 ?auto_129689 ) ) ( not ( = ?auto_129687 ?auto_129690 ) ) ( not ( = ?auto_129687 ?auto_129691 ) ) ( not ( = ?auto_129688 ?auto_129689 ) ) ( not ( = ?auto_129688 ?auto_129690 ) ) ( not ( = ?auto_129688 ?auto_129691 ) ) ( not ( = ?auto_129689 ?auto_129690 ) ) ( not ( = ?auto_129689 ?auto_129691 ) ) ( not ( = ?auto_129690 ?auto_129691 ) ) ( ON ?auto_129691 ?auto_129693 ) ( not ( = ?auto_129686 ?auto_129693 ) ) ( not ( = ?auto_129687 ?auto_129693 ) ) ( not ( = ?auto_129688 ?auto_129693 ) ) ( not ( = ?auto_129689 ?auto_129693 ) ) ( not ( = ?auto_129690 ?auto_129693 ) ) ( not ( = ?auto_129691 ?auto_129693 ) ) ( ON ?auto_129690 ?auto_129691 ) ( ON-TABLE ?auto_129693 ) ( ON ?auto_129686 ?auto_129692 ) ( not ( = ?auto_129686 ?auto_129692 ) ) ( not ( = ?auto_129687 ?auto_129692 ) ) ( not ( = ?auto_129688 ?auto_129692 ) ) ( not ( = ?auto_129689 ?auto_129692 ) ) ( not ( = ?auto_129690 ?auto_129692 ) ) ( not ( = ?auto_129691 ?auto_129692 ) ) ( not ( = ?auto_129693 ?auto_129692 ) ) ( ON ?auto_129687 ?auto_129686 ) ( ON-TABLE ?auto_129692 ) ( ON ?auto_129688 ?auto_129687 ) ( CLEAR ?auto_129688 ) ( HOLDING ?auto_129689 ) ( CLEAR ?auto_129690 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129693 ?auto_129691 ?auto_129690 ?auto_129689 )
      ( MAKE-6PILE ?auto_129686 ?auto_129687 ?auto_129688 ?auto_129689 ?auto_129690 ?auto_129691 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129694 - BLOCK
      ?auto_129695 - BLOCK
      ?auto_129696 - BLOCK
      ?auto_129697 - BLOCK
      ?auto_129698 - BLOCK
      ?auto_129699 - BLOCK
    )
    :vars
    (
      ?auto_129700 - BLOCK
      ?auto_129701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129694 ?auto_129695 ) ) ( not ( = ?auto_129694 ?auto_129696 ) ) ( not ( = ?auto_129694 ?auto_129697 ) ) ( not ( = ?auto_129694 ?auto_129698 ) ) ( not ( = ?auto_129694 ?auto_129699 ) ) ( not ( = ?auto_129695 ?auto_129696 ) ) ( not ( = ?auto_129695 ?auto_129697 ) ) ( not ( = ?auto_129695 ?auto_129698 ) ) ( not ( = ?auto_129695 ?auto_129699 ) ) ( not ( = ?auto_129696 ?auto_129697 ) ) ( not ( = ?auto_129696 ?auto_129698 ) ) ( not ( = ?auto_129696 ?auto_129699 ) ) ( not ( = ?auto_129697 ?auto_129698 ) ) ( not ( = ?auto_129697 ?auto_129699 ) ) ( not ( = ?auto_129698 ?auto_129699 ) ) ( ON ?auto_129699 ?auto_129700 ) ( not ( = ?auto_129694 ?auto_129700 ) ) ( not ( = ?auto_129695 ?auto_129700 ) ) ( not ( = ?auto_129696 ?auto_129700 ) ) ( not ( = ?auto_129697 ?auto_129700 ) ) ( not ( = ?auto_129698 ?auto_129700 ) ) ( not ( = ?auto_129699 ?auto_129700 ) ) ( ON ?auto_129698 ?auto_129699 ) ( ON-TABLE ?auto_129700 ) ( ON ?auto_129694 ?auto_129701 ) ( not ( = ?auto_129694 ?auto_129701 ) ) ( not ( = ?auto_129695 ?auto_129701 ) ) ( not ( = ?auto_129696 ?auto_129701 ) ) ( not ( = ?auto_129697 ?auto_129701 ) ) ( not ( = ?auto_129698 ?auto_129701 ) ) ( not ( = ?auto_129699 ?auto_129701 ) ) ( not ( = ?auto_129700 ?auto_129701 ) ) ( ON ?auto_129695 ?auto_129694 ) ( ON-TABLE ?auto_129701 ) ( ON ?auto_129696 ?auto_129695 ) ( CLEAR ?auto_129698 ) ( ON ?auto_129697 ?auto_129696 ) ( CLEAR ?auto_129697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129701 ?auto_129694 ?auto_129695 ?auto_129696 )
      ( MAKE-6PILE ?auto_129694 ?auto_129695 ?auto_129696 ?auto_129697 ?auto_129698 ?auto_129699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129702 - BLOCK
      ?auto_129703 - BLOCK
      ?auto_129704 - BLOCK
      ?auto_129705 - BLOCK
      ?auto_129706 - BLOCK
      ?auto_129707 - BLOCK
    )
    :vars
    (
      ?auto_129708 - BLOCK
      ?auto_129709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129702 ?auto_129703 ) ) ( not ( = ?auto_129702 ?auto_129704 ) ) ( not ( = ?auto_129702 ?auto_129705 ) ) ( not ( = ?auto_129702 ?auto_129706 ) ) ( not ( = ?auto_129702 ?auto_129707 ) ) ( not ( = ?auto_129703 ?auto_129704 ) ) ( not ( = ?auto_129703 ?auto_129705 ) ) ( not ( = ?auto_129703 ?auto_129706 ) ) ( not ( = ?auto_129703 ?auto_129707 ) ) ( not ( = ?auto_129704 ?auto_129705 ) ) ( not ( = ?auto_129704 ?auto_129706 ) ) ( not ( = ?auto_129704 ?auto_129707 ) ) ( not ( = ?auto_129705 ?auto_129706 ) ) ( not ( = ?auto_129705 ?auto_129707 ) ) ( not ( = ?auto_129706 ?auto_129707 ) ) ( ON ?auto_129707 ?auto_129708 ) ( not ( = ?auto_129702 ?auto_129708 ) ) ( not ( = ?auto_129703 ?auto_129708 ) ) ( not ( = ?auto_129704 ?auto_129708 ) ) ( not ( = ?auto_129705 ?auto_129708 ) ) ( not ( = ?auto_129706 ?auto_129708 ) ) ( not ( = ?auto_129707 ?auto_129708 ) ) ( ON-TABLE ?auto_129708 ) ( ON ?auto_129702 ?auto_129709 ) ( not ( = ?auto_129702 ?auto_129709 ) ) ( not ( = ?auto_129703 ?auto_129709 ) ) ( not ( = ?auto_129704 ?auto_129709 ) ) ( not ( = ?auto_129705 ?auto_129709 ) ) ( not ( = ?auto_129706 ?auto_129709 ) ) ( not ( = ?auto_129707 ?auto_129709 ) ) ( not ( = ?auto_129708 ?auto_129709 ) ) ( ON ?auto_129703 ?auto_129702 ) ( ON-TABLE ?auto_129709 ) ( ON ?auto_129704 ?auto_129703 ) ( ON ?auto_129705 ?auto_129704 ) ( CLEAR ?auto_129705 ) ( HOLDING ?auto_129706 ) ( CLEAR ?auto_129707 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129708 ?auto_129707 ?auto_129706 )
      ( MAKE-6PILE ?auto_129702 ?auto_129703 ?auto_129704 ?auto_129705 ?auto_129706 ?auto_129707 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129710 - BLOCK
      ?auto_129711 - BLOCK
      ?auto_129712 - BLOCK
      ?auto_129713 - BLOCK
      ?auto_129714 - BLOCK
      ?auto_129715 - BLOCK
    )
    :vars
    (
      ?auto_129717 - BLOCK
      ?auto_129716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129710 ?auto_129711 ) ) ( not ( = ?auto_129710 ?auto_129712 ) ) ( not ( = ?auto_129710 ?auto_129713 ) ) ( not ( = ?auto_129710 ?auto_129714 ) ) ( not ( = ?auto_129710 ?auto_129715 ) ) ( not ( = ?auto_129711 ?auto_129712 ) ) ( not ( = ?auto_129711 ?auto_129713 ) ) ( not ( = ?auto_129711 ?auto_129714 ) ) ( not ( = ?auto_129711 ?auto_129715 ) ) ( not ( = ?auto_129712 ?auto_129713 ) ) ( not ( = ?auto_129712 ?auto_129714 ) ) ( not ( = ?auto_129712 ?auto_129715 ) ) ( not ( = ?auto_129713 ?auto_129714 ) ) ( not ( = ?auto_129713 ?auto_129715 ) ) ( not ( = ?auto_129714 ?auto_129715 ) ) ( ON ?auto_129715 ?auto_129717 ) ( not ( = ?auto_129710 ?auto_129717 ) ) ( not ( = ?auto_129711 ?auto_129717 ) ) ( not ( = ?auto_129712 ?auto_129717 ) ) ( not ( = ?auto_129713 ?auto_129717 ) ) ( not ( = ?auto_129714 ?auto_129717 ) ) ( not ( = ?auto_129715 ?auto_129717 ) ) ( ON-TABLE ?auto_129717 ) ( ON ?auto_129710 ?auto_129716 ) ( not ( = ?auto_129710 ?auto_129716 ) ) ( not ( = ?auto_129711 ?auto_129716 ) ) ( not ( = ?auto_129712 ?auto_129716 ) ) ( not ( = ?auto_129713 ?auto_129716 ) ) ( not ( = ?auto_129714 ?auto_129716 ) ) ( not ( = ?auto_129715 ?auto_129716 ) ) ( not ( = ?auto_129717 ?auto_129716 ) ) ( ON ?auto_129711 ?auto_129710 ) ( ON-TABLE ?auto_129716 ) ( ON ?auto_129712 ?auto_129711 ) ( ON ?auto_129713 ?auto_129712 ) ( CLEAR ?auto_129715 ) ( ON ?auto_129714 ?auto_129713 ) ( CLEAR ?auto_129714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129716 ?auto_129710 ?auto_129711 ?auto_129712 ?auto_129713 )
      ( MAKE-6PILE ?auto_129710 ?auto_129711 ?auto_129712 ?auto_129713 ?auto_129714 ?auto_129715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129718 - BLOCK
      ?auto_129719 - BLOCK
      ?auto_129720 - BLOCK
      ?auto_129721 - BLOCK
      ?auto_129722 - BLOCK
      ?auto_129723 - BLOCK
    )
    :vars
    (
      ?auto_129725 - BLOCK
      ?auto_129724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129718 ?auto_129719 ) ) ( not ( = ?auto_129718 ?auto_129720 ) ) ( not ( = ?auto_129718 ?auto_129721 ) ) ( not ( = ?auto_129718 ?auto_129722 ) ) ( not ( = ?auto_129718 ?auto_129723 ) ) ( not ( = ?auto_129719 ?auto_129720 ) ) ( not ( = ?auto_129719 ?auto_129721 ) ) ( not ( = ?auto_129719 ?auto_129722 ) ) ( not ( = ?auto_129719 ?auto_129723 ) ) ( not ( = ?auto_129720 ?auto_129721 ) ) ( not ( = ?auto_129720 ?auto_129722 ) ) ( not ( = ?auto_129720 ?auto_129723 ) ) ( not ( = ?auto_129721 ?auto_129722 ) ) ( not ( = ?auto_129721 ?auto_129723 ) ) ( not ( = ?auto_129722 ?auto_129723 ) ) ( not ( = ?auto_129718 ?auto_129725 ) ) ( not ( = ?auto_129719 ?auto_129725 ) ) ( not ( = ?auto_129720 ?auto_129725 ) ) ( not ( = ?auto_129721 ?auto_129725 ) ) ( not ( = ?auto_129722 ?auto_129725 ) ) ( not ( = ?auto_129723 ?auto_129725 ) ) ( ON-TABLE ?auto_129725 ) ( ON ?auto_129718 ?auto_129724 ) ( not ( = ?auto_129718 ?auto_129724 ) ) ( not ( = ?auto_129719 ?auto_129724 ) ) ( not ( = ?auto_129720 ?auto_129724 ) ) ( not ( = ?auto_129721 ?auto_129724 ) ) ( not ( = ?auto_129722 ?auto_129724 ) ) ( not ( = ?auto_129723 ?auto_129724 ) ) ( not ( = ?auto_129725 ?auto_129724 ) ) ( ON ?auto_129719 ?auto_129718 ) ( ON-TABLE ?auto_129724 ) ( ON ?auto_129720 ?auto_129719 ) ( ON ?auto_129721 ?auto_129720 ) ( ON ?auto_129722 ?auto_129721 ) ( CLEAR ?auto_129722 ) ( HOLDING ?auto_129723 ) ( CLEAR ?auto_129725 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129725 ?auto_129723 )
      ( MAKE-6PILE ?auto_129718 ?auto_129719 ?auto_129720 ?auto_129721 ?auto_129722 ?auto_129723 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129726 - BLOCK
      ?auto_129727 - BLOCK
      ?auto_129728 - BLOCK
      ?auto_129729 - BLOCK
      ?auto_129730 - BLOCK
      ?auto_129731 - BLOCK
    )
    :vars
    (
      ?auto_129733 - BLOCK
      ?auto_129732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129726 ?auto_129727 ) ) ( not ( = ?auto_129726 ?auto_129728 ) ) ( not ( = ?auto_129726 ?auto_129729 ) ) ( not ( = ?auto_129726 ?auto_129730 ) ) ( not ( = ?auto_129726 ?auto_129731 ) ) ( not ( = ?auto_129727 ?auto_129728 ) ) ( not ( = ?auto_129727 ?auto_129729 ) ) ( not ( = ?auto_129727 ?auto_129730 ) ) ( not ( = ?auto_129727 ?auto_129731 ) ) ( not ( = ?auto_129728 ?auto_129729 ) ) ( not ( = ?auto_129728 ?auto_129730 ) ) ( not ( = ?auto_129728 ?auto_129731 ) ) ( not ( = ?auto_129729 ?auto_129730 ) ) ( not ( = ?auto_129729 ?auto_129731 ) ) ( not ( = ?auto_129730 ?auto_129731 ) ) ( not ( = ?auto_129726 ?auto_129733 ) ) ( not ( = ?auto_129727 ?auto_129733 ) ) ( not ( = ?auto_129728 ?auto_129733 ) ) ( not ( = ?auto_129729 ?auto_129733 ) ) ( not ( = ?auto_129730 ?auto_129733 ) ) ( not ( = ?auto_129731 ?auto_129733 ) ) ( ON-TABLE ?auto_129733 ) ( ON ?auto_129726 ?auto_129732 ) ( not ( = ?auto_129726 ?auto_129732 ) ) ( not ( = ?auto_129727 ?auto_129732 ) ) ( not ( = ?auto_129728 ?auto_129732 ) ) ( not ( = ?auto_129729 ?auto_129732 ) ) ( not ( = ?auto_129730 ?auto_129732 ) ) ( not ( = ?auto_129731 ?auto_129732 ) ) ( not ( = ?auto_129733 ?auto_129732 ) ) ( ON ?auto_129727 ?auto_129726 ) ( ON-TABLE ?auto_129732 ) ( ON ?auto_129728 ?auto_129727 ) ( ON ?auto_129729 ?auto_129728 ) ( ON ?auto_129730 ?auto_129729 ) ( CLEAR ?auto_129733 ) ( ON ?auto_129731 ?auto_129730 ) ( CLEAR ?auto_129731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129732 ?auto_129726 ?auto_129727 ?auto_129728 ?auto_129729 ?auto_129730 )
      ( MAKE-6PILE ?auto_129726 ?auto_129727 ?auto_129728 ?auto_129729 ?auto_129730 ?auto_129731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129734 - BLOCK
      ?auto_129735 - BLOCK
      ?auto_129736 - BLOCK
      ?auto_129737 - BLOCK
      ?auto_129738 - BLOCK
      ?auto_129739 - BLOCK
    )
    :vars
    (
      ?auto_129741 - BLOCK
      ?auto_129740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129734 ?auto_129735 ) ) ( not ( = ?auto_129734 ?auto_129736 ) ) ( not ( = ?auto_129734 ?auto_129737 ) ) ( not ( = ?auto_129734 ?auto_129738 ) ) ( not ( = ?auto_129734 ?auto_129739 ) ) ( not ( = ?auto_129735 ?auto_129736 ) ) ( not ( = ?auto_129735 ?auto_129737 ) ) ( not ( = ?auto_129735 ?auto_129738 ) ) ( not ( = ?auto_129735 ?auto_129739 ) ) ( not ( = ?auto_129736 ?auto_129737 ) ) ( not ( = ?auto_129736 ?auto_129738 ) ) ( not ( = ?auto_129736 ?auto_129739 ) ) ( not ( = ?auto_129737 ?auto_129738 ) ) ( not ( = ?auto_129737 ?auto_129739 ) ) ( not ( = ?auto_129738 ?auto_129739 ) ) ( not ( = ?auto_129734 ?auto_129741 ) ) ( not ( = ?auto_129735 ?auto_129741 ) ) ( not ( = ?auto_129736 ?auto_129741 ) ) ( not ( = ?auto_129737 ?auto_129741 ) ) ( not ( = ?auto_129738 ?auto_129741 ) ) ( not ( = ?auto_129739 ?auto_129741 ) ) ( ON ?auto_129734 ?auto_129740 ) ( not ( = ?auto_129734 ?auto_129740 ) ) ( not ( = ?auto_129735 ?auto_129740 ) ) ( not ( = ?auto_129736 ?auto_129740 ) ) ( not ( = ?auto_129737 ?auto_129740 ) ) ( not ( = ?auto_129738 ?auto_129740 ) ) ( not ( = ?auto_129739 ?auto_129740 ) ) ( not ( = ?auto_129741 ?auto_129740 ) ) ( ON ?auto_129735 ?auto_129734 ) ( ON-TABLE ?auto_129740 ) ( ON ?auto_129736 ?auto_129735 ) ( ON ?auto_129737 ?auto_129736 ) ( ON ?auto_129738 ?auto_129737 ) ( ON ?auto_129739 ?auto_129738 ) ( CLEAR ?auto_129739 ) ( HOLDING ?auto_129741 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129741 )
      ( MAKE-6PILE ?auto_129734 ?auto_129735 ?auto_129736 ?auto_129737 ?auto_129738 ?auto_129739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_129742 - BLOCK
      ?auto_129743 - BLOCK
      ?auto_129744 - BLOCK
      ?auto_129745 - BLOCK
      ?auto_129746 - BLOCK
      ?auto_129747 - BLOCK
    )
    :vars
    (
      ?auto_129749 - BLOCK
      ?auto_129748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129742 ?auto_129743 ) ) ( not ( = ?auto_129742 ?auto_129744 ) ) ( not ( = ?auto_129742 ?auto_129745 ) ) ( not ( = ?auto_129742 ?auto_129746 ) ) ( not ( = ?auto_129742 ?auto_129747 ) ) ( not ( = ?auto_129743 ?auto_129744 ) ) ( not ( = ?auto_129743 ?auto_129745 ) ) ( not ( = ?auto_129743 ?auto_129746 ) ) ( not ( = ?auto_129743 ?auto_129747 ) ) ( not ( = ?auto_129744 ?auto_129745 ) ) ( not ( = ?auto_129744 ?auto_129746 ) ) ( not ( = ?auto_129744 ?auto_129747 ) ) ( not ( = ?auto_129745 ?auto_129746 ) ) ( not ( = ?auto_129745 ?auto_129747 ) ) ( not ( = ?auto_129746 ?auto_129747 ) ) ( not ( = ?auto_129742 ?auto_129749 ) ) ( not ( = ?auto_129743 ?auto_129749 ) ) ( not ( = ?auto_129744 ?auto_129749 ) ) ( not ( = ?auto_129745 ?auto_129749 ) ) ( not ( = ?auto_129746 ?auto_129749 ) ) ( not ( = ?auto_129747 ?auto_129749 ) ) ( ON ?auto_129742 ?auto_129748 ) ( not ( = ?auto_129742 ?auto_129748 ) ) ( not ( = ?auto_129743 ?auto_129748 ) ) ( not ( = ?auto_129744 ?auto_129748 ) ) ( not ( = ?auto_129745 ?auto_129748 ) ) ( not ( = ?auto_129746 ?auto_129748 ) ) ( not ( = ?auto_129747 ?auto_129748 ) ) ( not ( = ?auto_129749 ?auto_129748 ) ) ( ON ?auto_129743 ?auto_129742 ) ( ON-TABLE ?auto_129748 ) ( ON ?auto_129744 ?auto_129743 ) ( ON ?auto_129745 ?auto_129744 ) ( ON ?auto_129746 ?auto_129745 ) ( ON ?auto_129747 ?auto_129746 ) ( ON ?auto_129749 ?auto_129747 ) ( CLEAR ?auto_129749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129748 ?auto_129742 ?auto_129743 ?auto_129744 ?auto_129745 ?auto_129746 ?auto_129747 )
      ( MAKE-6PILE ?auto_129742 ?auto_129743 ?auto_129744 ?auto_129745 ?auto_129746 ?auto_129747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129757 - BLOCK
      ?auto_129758 - BLOCK
      ?auto_129759 - BLOCK
      ?auto_129760 - BLOCK
      ?auto_129761 - BLOCK
      ?auto_129762 - BLOCK
      ?auto_129763 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_129763 ) ( CLEAR ?auto_129762 ) ( ON-TABLE ?auto_129757 ) ( ON ?auto_129758 ?auto_129757 ) ( ON ?auto_129759 ?auto_129758 ) ( ON ?auto_129760 ?auto_129759 ) ( ON ?auto_129761 ?auto_129760 ) ( ON ?auto_129762 ?auto_129761 ) ( not ( = ?auto_129757 ?auto_129758 ) ) ( not ( = ?auto_129757 ?auto_129759 ) ) ( not ( = ?auto_129757 ?auto_129760 ) ) ( not ( = ?auto_129757 ?auto_129761 ) ) ( not ( = ?auto_129757 ?auto_129762 ) ) ( not ( = ?auto_129757 ?auto_129763 ) ) ( not ( = ?auto_129758 ?auto_129759 ) ) ( not ( = ?auto_129758 ?auto_129760 ) ) ( not ( = ?auto_129758 ?auto_129761 ) ) ( not ( = ?auto_129758 ?auto_129762 ) ) ( not ( = ?auto_129758 ?auto_129763 ) ) ( not ( = ?auto_129759 ?auto_129760 ) ) ( not ( = ?auto_129759 ?auto_129761 ) ) ( not ( = ?auto_129759 ?auto_129762 ) ) ( not ( = ?auto_129759 ?auto_129763 ) ) ( not ( = ?auto_129760 ?auto_129761 ) ) ( not ( = ?auto_129760 ?auto_129762 ) ) ( not ( = ?auto_129760 ?auto_129763 ) ) ( not ( = ?auto_129761 ?auto_129762 ) ) ( not ( = ?auto_129761 ?auto_129763 ) ) ( not ( = ?auto_129762 ?auto_129763 ) ) )
    :subtasks
    ( ( !STACK ?auto_129763 ?auto_129762 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129764 - BLOCK
      ?auto_129765 - BLOCK
      ?auto_129766 - BLOCK
      ?auto_129767 - BLOCK
      ?auto_129768 - BLOCK
      ?auto_129769 - BLOCK
      ?auto_129770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_129769 ) ( ON-TABLE ?auto_129764 ) ( ON ?auto_129765 ?auto_129764 ) ( ON ?auto_129766 ?auto_129765 ) ( ON ?auto_129767 ?auto_129766 ) ( ON ?auto_129768 ?auto_129767 ) ( ON ?auto_129769 ?auto_129768 ) ( not ( = ?auto_129764 ?auto_129765 ) ) ( not ( = ?auto_129764 ?auto_129766 ) ) ( not ( = ?auto_129764 ?auto_129767 ) ) ( not ( = ?auto_129764 ?auto_129768 ) ) ( not ( = ?auto_129764 ?auto_129769 ) ) ( not ( = ?auto_129764 ?auto_129770 ) ) ( not ( = ?auto_129765 ?auto_129766 ) ) ( not ( = ?auto_129765 ?auto_129767 ) ) ( not ( = ?auto_129765 ?auto_129768 ) ) ( not ( = ?auto_129765 ?auto_129769 ) ) ( not ( = ?auto_129765 ?auto_129770 ) ) ( not ( = ?auto_129766 ?auto_129767 ) ) ( not ( = ?auto_129766 ?auto_129768 ) ) ( not ( = ?auto_129766 ?auto_129769 ) ) ( not ( = ?auto_129766 ?auto_129770 ) ) ( not ( = ?auto_129767 ?auto_129768 ) ) ( not ( = ?auto_129767 ?auto_129769 ) ) ( not ( = ?auto_129767 ?auto_129770 ) ) ( not ( = ?auto_129768 ?auto_129769 ) ) ( not ( = ?auto_129768 ?auto_129770 ) ) ( not ( = ?auto_129769 ?auto_129770 ) ) ( ON-TABLE ?auto_129770 ) ( CLEAR ?auto_129770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_129770 )
      ( MAKE-7PILE ?auto_129764 ?auto_129765 ?auto_129766 ?auto_129767 ?auto_129768 ?auto_129769 ?auto_129770 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129771 - BLOCK
      ?auto_129772 - BLOCK
      ?auto_129773 - BLOCK
      ?auto_129774 - BLOCK
      ?auto_129775 - BLOCK
      ?auto_129776 - BLOCK
      ?auto_129777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129771 ) ( ON ?auto_129772 ?auto_129771 ) ( ON ?auto_129773 ?auto_129772 ) ( ON ?auto_129774 ?auto_129773 ) ( ON ?auto_129775 ?auto_129774 ) ( not ( = ?auto_129771 ?auto_129772 ) ) ( not ( = ?auto_129771 ?auto_129773 ) ) ( not ( = ?auto_129771 ?auto_129774 ) ) ( not ( = ?auto_129771 ?auto_129775 ) ) ( not ( = ?auto_129771 ?auto_129776 ) ) ( not ( = ?auto_129771 ?auto_129777 ) ) ( not ( = ?auto_129772 ?auto_129773 ) ) ( not ( = ?auto_129772 ?auto_129774 ) ) ( not ( = ?auto_129772 ?auto_129775 ) ) ( not ( = ?auto_129772 ?auto_129776 ) ) ( not ( = ?auto_129772 ?auto_129777 ) ) ( not ( = ?auto_129773 ?auto_129774 ) ) ( not ( = ?auto_129773 ?auto_129775 ) ) ( not ( = ?auto_129773 ?auto_129776 ) ) ( not ( = ?auto_129773 ?auto_129777 ) ) ( not ( = ?auto_129774 ?auto_129775 ) ) ( not ( = ?auto_129774 ?auto_129776 ) ) ( not ( = ?auto_129774 ?auto_129777 ) ) ( not ( = ?auto_129775 ?auto_129776 ) ) ( not ( = ?auto_129775 ?auto_129777 ) ) ( not ( = ?auto_129776 ?auto_129777 ) ) ( ON-TABLE ?auto_129777 ) ( CLEAR ?auto_129777 ) ( HOLDING ?auto_129776 ) ( CLEAR ?auto_129775 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129771 ?auto_129772 ?auto_129773 ?auto_129774 ?auto_129775 ?auto_129776 )
      ( MAKE-7PILE ?auto_129771 ?auto_129772 ?auto_129773 ?auto_129774 ?auto_129775 ?auto_129776 ?auto_129777 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129778 - BLOCK
      ?auto_129779 - BLOCK
      ?auto_129780 - BLOCK
      ?auto_129781 - BLOCK
      ?auto_129782 - BLOCK
      ?auto_129783 - BLOCK
      ?auto_129784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129778 ) ( ON ?auto_129779 ?auto_129778 ) ( ON ?auto_129780 ?auto_129779 ) ( ON ?auto_129781 ?auto_129780 ) ( ON ?auto_129782 ?auto_129781 ) ( not ( = ?auto_129778 ?auto_129779 ) ) ( not ( = ?auto_129778 ?auto_129780 ) ) ( not ( = ?auto_129778 ?auto_129781 ) ) ( not ( = ?auto_129778 ?auto_129782 ) ) ( not ( = ?auto_129778 ?auto_129783 ) ) ( not ( = ?auto_129778 ?auto_129784 ) ) ( not ( = ?auto_129779 ?auto_129780 ) ) ( not ( = ?auto_129779 ?auto_129781 ) ) ( not ( = ?auto_129779 ?auto_129782 ) ) ( not ( = ?auto_129779 ?auto_129783 ) ) ( not ( = ?auto_129779 ?auto_129784 ) ) ( not ( = ?auto_129780 ?auto_129781 ) ) ( not ( = ?auto_129780 ?auto_129782 ) ) ( not ( = ?auto_129780 ?auto_129783 ) ) ( not ( = ?auto_129780 ?auto_129784 ) ) ( not ( = ?auto_129781 ?auto_129782 ) ) ( not ( = ?auto_129781 ?auto_129783 ) ) ( not ( = ?auto_129781 ?auto_129784 ) ) ( not ( = ?auto_129782 ?auto_129783 ) ) ( not ( = ?auto_129782 ?auto_129784 ) ) ( not ( = ?auto_129783 ?auto_129784 ) ) ( ON-TABLE ?auto_129784 ) ( CLEAR ?auto_129782 ) ( ON ?auto_129783 ?auto_129784 ) ( CLEAR ?auto_129783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129784 )
      ( MAKE-7PILE ?auto_129778 ?auto_129779 ?auto_129780 ?auto_129781 ?auto_129782 ?auto_129783 ?auto_129784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129785 - BLOCK
      ?auto_129786 - BLOCK
      ?auto_129787 - BLOCK
      ?auto_129788 - BLOCK
      ?auto_129789 - BLOCK
      ?auto_129790 - BLOCK
      ?auto_129791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129785 ) ( ON ?auto_129786 ?auto_129785 ) ( ON ?auto_129787 ?auto_129786 ) ( ON ?auto_129788 ?auto_129787 ) ( not ( = ?auto_129785 ?auto_129786 ) ) ( not ( = ?auto_129785 ?auto_129787 ) ) ( not ( = ?auto_129785 ?auto_129788 ) ) ( not ( = ?auto_129785 ?auto_129789 ) ) ( not ( = ?auto_129785 ?auto_129790 ) ) ( not ( = ?auto_129785 ?auto_129791 ) ) ( not ( = ?auto_129786 ?auto_129787 ) ) ( not ( = ?auto_129786 ?auto_129788 ) ) ( not ( = ?auto_129786 ?auto_129789 ) ) ( not ( = ?auto_129786 ?auto_129790 ) ) ( not ( = ?auto_129786 ?auto_129791 ) ) ( not ( = ?auto_129787 ?auto_129788 ) ) ( not ( = ?auto_129787 ?auto_129789 ) ) ( not ( = ?auto_129787 ?auto_129790 ) ) ( not ( = ?auto_129787 ?auto_129791 ) ) ( not ( = ?auto_129788 ?auto_129789 ) ) ( not ( = ?auto_129788 ?auto_129790 ) ) ( not ( = ?auto_129788 ?auto_129791 ) ) ( not ( = ?auto_129789 ?auto_129790 ) ) ( not ( = ?auto_129789 ?auto_129791 ) ) ( not ( = ?auto_129790 ?auto_129791 ) ) ( ON-TABLE ?auto_129791 ) ( ON ?auto_129790 ?auto_129791 ) ( CLEAR ?auto_129790 ) ( HOLDING ?auto_129789 ) ( CLEAR ?auto_129788 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129785 ?auto_129786 ?auto_129787 ?auto_129788 ?auto_129789 )
      ( MAKE-7PILE ?auto_129785 ?auto_129786 ?auto_129787 ?auto_129788 ?auto_129789 ?auto_129790 ?auto_129791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129792 - BLOCK
      ?auto_129793 - BLOCK
      ?auto_129794 - BLOCK
      ?auto_129795 - BLOCK
      ?auto_129796 - BLOCK
      ?auto_129797 - BLOCK
      ?auto_129798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129792 ) ( ON ?auto_129793 ?auto_129792 ) ( ON ?auto_129794 ?auto_129793 ) ( ON ?auto_129795 ?auto_129794 ) ( not ( = ?auto_129792 ?auto_129793 ) ) ( not ( = ?auto_129792 ?auto_129794 ) ) ( not ( = ?auto_129792 ?auto_129795 ) ) ( not ( = ?auto_129792 ?auto_129796 ) ) ( not ( = ?auto_129792 ?auto_129797 ) ) ( not ( = ?auto_129792 ?auto_129798 ) ) ( not ( = ?auto_129793 ?auto_129794 ) ) ( not ( = ?auto_129793 ?auto_129795 ) ) ( not ( = ?auto_129793 ?auto_129796 ) ) ( not ( = ?auto_129793 ?auto_129797 ) ) ( not ( = ?auto_129793 ?auto_129798 ) ) ( not ( = ?auto_129794 ?auto_129795 ) ) ( not ( = ?auto_129794 ?auto_129796 ) ) ( not ( = ?auto_129794 ?auto_129797 ) ) ( not ( = ?auto_129794 ?auto_129798 ) ) ( not ( = ?auto_129795 ?auto_129796 ) ) ( not ( = ?auto_129795 ?auto_129797 ) ) ( not ( = ?auto_129795 ?auto_129798 ) ) ( not ( = ?auto_129796 ?auto_129797 ) ) ( not ( = ?auto_129796 ?auto_129798 ) ) ( not ( = ?auto_129797 ?auto_129798 ) ) ( ON-TABLE ?auto_129798 ) ( ON ?auto_129797 ?auto_129798 ) ( CLEAR ?auto_129795 ) ( ON ?auto_129796 ?auto_129797 ) ( CLEAR ?auto_129796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129798 ?auto_129797 )
      ( MAKE-7PILE ?auto_129792 ?auto_129793 ?auto_129794 ?auto_129795 ?auto_129796 ?auto_129797 ?auto_129798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129799 - BLOCK
      ?auto_129800 - BLOCK
      ?auto_129801 - BLOCK
      ?auto_129802 - BLOCK
      ?auto_129803 - BLOCK
      ?auto_129804 - BLOCK
      ?auto_129805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129799 ) ( ON ?auto_129800 ?auto_129799 ) ( ON ?auto_129801 ?auto_129800 ) ( not ( = ?auto_129799 ?auto_129800 ) ) ( not ( = ?auto_129799 ?auto_129801 ) ) ( not ( = ?auto_129799 ?auto_129802 ) ) ( not ( = ?auto_129799 ?auto_129803 ) ) ( not ( = ?auto_129799 ?auto_129804 ) ) ( not ( = ?auto_129799 ?auto_129805 ) ) ( not ( = ?auto_129800 ?auto_129801 ) ) ( not ( = ?auto_129800 ?auto_129802 ) ) ( not ( = ?auto_129800 ?auto_129803 ) ) ( not ( = ?auto_129800 ?auto_129804 ) ) ( not ( = ?auto_129800 ?auto_129805 ) ) ( not ( = ?auto_129801 ?auto_129802 ) ) ( not ( = ?auto_129801 ?auto_129803 ) ) ( not ( = ?auto_129801 ?auto_129804 ) ) ( not ( = ?auto_129801 ?auto_129805 ) ) ( not ( = ?auto_129802 ?auto_129803 ) ) ( not ( = ?auto_129802 ?auto_129804 ) ) ( not ( = ?auto_129802 ?auto_129805 ) ) ( not ( = ?auto_129803 ?auto_129804 ) ) ( not ( = ?auto_129803 ?auto_129805 ) ) ( not ( = ?auto_129804 ?auto_129805 ) ) ( ON-TABLE ?auto_129805 ) ( ON ?auto_129804 ?auto_129805 ) ( ON ?auto_129803 ?auto_129804 ) ( CLEAR ?auto_129803 ) ( HOLDING ?auto_129802 ) ( CLEAR ?auto_129801 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129799 ?auto_129800 ?auto_129801 ?auto_129802 )
      ( MAKE-7PILE ?auto_129799 ?auto_129800 ?auto_129801 ?auto_129802 ?auto_129803 ?auto_129804 ?auto_129805 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129806 - BLOCK
      ?auto_129807 - BLOCK
      ?auto_129808 - BLOCK
      ?auto_129809 - BLOCK
      ?auto_129810 - BLOCK
      ?auto_129811 - BLOCK
      ?auto_129812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129806 ) ( ON ?auto_129807 ?auto_129806 ) ( ON ?auto_129808 ?auto_129807 ) ( not ( = ?auto_129806 ?auto_129807 ) ) ( not ( = ?auto_129806 ?auto_129808 ) ) ( not ( = ?auto_129806 ?auto_129809 ) ) ( not ( = ?auto_129806 ?auto_129810 ) ) ( not ( = ?auto_129806 ?auto_129811 ) ) ( not ( = ?auto_129806 ?auto_129812 ) ) ( not ( = ?auto_129807 ?auto_129808 ) ) ( not ( = ?auto_129807 ?auto_129809 ) ) ( not ( = ?auto_129807 ?auto_129810 ) ) ( not ( = ?auto_129807 ?auto_129811 ) ) ( not ( = ?auto_129807 ?auto_129812 ) ) ( not ( = ?auto_129808 ?auto_129809 ) ) ( not ( = ?auto_129808 ?auto_129810 ) ) ( not ( = ?auto_129808 ?auto_129811 ) ) ( not ( = ?auto_129808 ?auto_129812 ) ) ( not ( = ?auto_129809 ?auto_129810 ) ) ( not ( = ?auto_129809 ?auto_129811 ) ) ( not ( = ?auto_129809 ?auto_129812 ) ) ( not ( = ?auto_129810 ?auto_129811 ) ) ( not ( = ?auto_129810 ?auto_129812 ) ) ( not ( = ?auto_129811 ?auto_129812 ) ) ( ON-TABLE ?auto_129812 ) ( ON ?auto_129811 ?auto_129812 ) ( ON ?auto_129810 ?auto_129811 ) ( CLEAR ?auto_129808 ) ( ON ?auto_129809 ?auto_129810 ) ( CLEAR ?auto_129809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129812 ?auto_129811 ?auto_129810 )
      ( MAKE-7PILE ?auto_129806 ?auto_129807 ?auto_129808 ?auto_129809 ?auto_129810 ?auto_129811 ?auto_129812 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129813 - BLOCK
      ?auto_129814 - BLOCK
      ?auto_129815 - BLOCK
      ?auto_129816 - BLOCK
      ?auto_129817 - BLOCK
      ?auto_129818 - BLOCK
      ?auto_129819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129813 ) ( ON ?auto_129814 ?auto_129813 ) ( not ( = ?auto_129813 ?auto_129814 ) ) ( not ( = ?auto_129813 ?auto_129815 ) ) ( not ( = ?auto_129813 ?auto_129816 ) ) ( not ( = ?auto_129813 ?auto_129817 ) ) ( not ( = ?auto_129813 ?auto_129818 ) ) ( not ( = ?auto_129813 ?auto_129819 ) ) ( not ( = ?auto_129814 ?auto_129815 ) ) ( not ( = ?auto_129814 ?auto_129816 ) ) ( not ( = ?auto_129814 ?auto_129817 ) ) ( not ( = ?auto_129814 ?auto_129818 ) ) ( not ( = ?auto_129814 ?auto_129819 ) ) ( not ( = ?auto_129815 ?auto_129816 ) ) ( not ( = ?auto_129815 ?auto_129817 ) ) ( not ( = ?auto_129815 ?auto_129818 ) ) ( not ( = ?auto_129815 ?auto_129819 ) ) ( not ( = ?auto_129816 ?auto_129817 ) ) ( not ( = ?auto_129816 ?auto_129818 ) ) ( not ( = ?auto_129816 ?auto_129819 ) ) ( not ( = ?auto_129817 ?auto_129818 ) ) ( not ( = ?auto_129817 ?auto_129819 ) ) ( not ( = ?auto_129818 ?auto_129819 ) ) ( ON-TABLE ?auto_129819 ) ( ON ?auto_129818 ?auto_129819 ) ( ON ?auto_129817 ?auto_129818 ) ( ON ?auto_129816 ?auto_129817 ) ( CLEAR ?auto_129816 ) ( HOLDING ?auto_129815 ) ( CLEAR ?auto_129814 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129813 ?auto_129814 ?auto_129815 )
      ( MAKE-7PILE ?auto_129813 ?auto_129814 ?auto_129815 ?auto_129816 ?auto_129817 ?auto_129818 ?auto_129819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129820 - BLOCK
      ?auto_129821 - BLOCK
      ?auto_129822 - BLOCK
      ?auto_129823 - BLOCK
      ?auto_129824 - BLOCK
      ?auto_129825 - BLOCK
      ?auto_129826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129820 ) ( ON ?auto_129821 ?auto_129820 ) ( not ( = ?auto_129820 ?auto_129821 ) ) ( not ( = ?auto_129820 ?auto_129822 ) ) ( not ( = ?auto_129820 ?auto_129823 ) ) ( not ( = ?auto_129820 ?auto_129824 ) ) ( not ( = ?auto_129820 ?auto_129825 ) ) ( not ( = ?auto_129820 ?auto_129826 ) ) ( not ( = ?auto_129821 ?auto_129822 ) ) ( not ( = ?auto_129821 ?auto_129823 ) ) ( not ( = ?auto_129821 ?auto_129824 ) ) ( not ( = ?auto_129821 ?auto_129825 ) ) ( not ( = ?auto_129821 ?auto_129826 ) ) ( not ( = ?auto_129822 ?auto_129823 ) ) ( not ( = ?auto_129822 ?auto_129824 ) ) ( not ( = ?auto_129822 ?auto_129825 ) ) ( not ( = ?auto_129822 ?auto_129826 ) ) ( not ( = ?auto_129823 ?auto_129824 ) ) ( not ( = ?auto_129823 ?auto_129825 ) ) ( not ( = ?auto_129823 ?auto_129826 ) ) ( not ( = ?auto_129824 ?auto_129825 ) ) ( not ( = ?auto_129824 ?auto_129826 ) ) ( not ( = ?auto_129825 ?auto_129826 ) ) ( ON-TABLE ?auto_129826 ) ( ON ?auto_129825 ?auto_129826 ) ( ON ?auto_129824 ?auto_129825 ) ( ON ?auto_129823 ?auto_129824 ) ( CLEAR ?auto_129821 ) ( ON ?auto_129822 ?auto_129823 ) ( CLEAR ?auto_129822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129826 ?auto_129825 ?auto_129824 ?auto_129823 )
      ( MAKE-7PILE ?auto_129820 ?auto_129821 ?auto_129822 ?auto_129823 ?auto_129824 ?auto_129825 ?auto_129826 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129827 - BLOCK
      ?auto_129828 - BLOCK
      ?auto_129829 - BLOCK
      ?auto_129830 - BLOCK
      ?auto_129831 - BLOCK
      ?auto_129832 - BLOCK
      ?auto_129833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129827 ) ( not ( = ?auto_129827 ?auto_129828 ) ) ( not ( = ?auto_129827 ?auto_129829 ) ) ( not ( = ?auto_129827 ?auto_129830 ) ) ( not ( = ?auto_129827 ?auto_129831 ) ) ( not ( = ?auto_129827 ?auto_129832 ) ) ( not ( = ?auto_129827 ?auto_129833 ) ) ( not ( = ?auto_129828 ?auto_129829 ) ) ( not ( = ?auto_129828 ?auto_129830 ) ) ( not ( = ?auto_129828 ?auto_129831 ) ) ( not ( = ?auto_129828 ?auto_129832 ) ) ( not ( = ?auto_129828 ?auto_129833 ) ) ( not ( = ?auto_129829 ?auto_129830 ) ) ( not ( = ?auto_129829 ?auto_129831 ) ) ( not ( = ?auto_129829 ?auto_129832 ) ) ( not ( = ?auto_129829 ?auto_129833 ) ) ( not ( = ?auto_129830 ?auto_129831 ) ) ( not ( = ?auto_129830 ?auto_129832 ) ) ( not ( = ?auto_129830 ?auto_129833 ) ) ( not ( = ?auto_129831 ?auto_129832 ) ) ( not ( = ?auto_129831 ?auto_129833 ) ) ( not ( = ?auto_129832 ?auto_129833 ) ) ( ON-TABLE ?auto_129833 ) ( ON ?auto_129832 ?auto_129833 ) ( ON ?auto_129831 ?auto_129832 ) ( ON ?auto_129830 ?auto_129831 ) ( ON ?auto_129829 ?auto_129830 ) ( CLEAR ?auto_129829 ) ( HOLDING ?auto_129828 ) ( CLEAR ?auto_129827 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129827 ?auto_129828 )
      ( MAKE-7PILE ?auto_129827 ?auto_129828 ?auto_129829 ?auto_129830 ?auto_129831 ?auto_129832 ?auto_129833 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129834 - BLOCK
      ?auto_129835 - BLOCK
      ?auto_129836 - BLOCK
      ?auto_129837 - BLOCK
      ?auto_129838 - BLOCK
      ?auto_129839 - BLOCK
      ?auto_129840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_129834 ) ( not ( = ?auto_129834 ?auto_129835 ) ) ( not ( = ?auto_129834 ?auto_129836 ) ) ( not ( = ?auto_129834 ?auto_129837 ) ) ( not ( = ?auto_129834 ?auto_129838 ) ) ( not ( = ?auto_129834 ?auto_129839 ) ) ( not ( = ?auto_129834 ?auto_129840 ) ) ( not ( = ?auto_129835 ?auto_129836 ) ) ( not ( = ?auto_129835 ?auto_129837 ) ) ( not ( = ?auto_129835 ?auto_129838 ) ) ( not ( = ?auto_129835 ?auto_129839 ) ) ( not ( = ?auto_129835 ?auto_129840 ) ) ( not ( = ?auto_129836 ?auto_129837 ) ) ( not ( = ?auto_129836 ?auto_129838 ) ) ( not ( = ?auto_129836 ?auto_129839 ) ) ( not ( = ?auto_129836 ?auto_129840 ) ) ( not ( = ?auto_129837 ?auto_129838 ) ) ( not ( = ?auto_129837 ?auto_129839 ) ) ( not ( = ?auto_129837 ?auto_129840 ) ) ( not ( = ?auto_129838 ?auto_129839 ) ) ( not ( = ?auto_129838 ?auto_129840 ) ) ( not ( = ?auto_129839 ?auto_129840 ) ) ( ON-TABLE ?auto_129840 ) ( ON ?auto_129839 ?auto_129840 ) ( ON ?auto_129838 ?auto_129839 ) ( ON ?auto_129837 ?auto_129838 ) ( ON ?auto_129836 ?auto_129837 ) ( CLEAR ?auto_129834 ) ( ON ?auto_129835 ?auto_129836 ) ( CLEAR ?auto_129835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129840 ?auto_129839 ?auto_129838 ?auto_129837 ?auto_129836 )
      ( MAKE-7PILE ?auto_129834 ?auto_129835 ?auto_129836 ?auto_129837 ?auto_129838 ?auto_129839 ?auto_129840 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129841 - BLOCK
      ?auto_129842 - BLOCK
      ?auto_129843 - BLOCK
      ?auto_129844 - BLOCK
      ?auto_129845 - BLOCK
      ?auto_129846 - BLOCK
      ?auto_129847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129841 ?auto_129842 ) ) ( not ( = ?auto_129841 ?auto_129843 ) ) ( not ( = ?auto_129841 ?auto_129844 ) ) ( not ( = ?auto_129841 ?auto_129845 ) ) ( not ( = ?auto_129841 ?auto_129846 ) ) ( not ( = ?auto_129841 ?auto_129847 ) ) ( not ( = ?auto_129842 ?auto_129843 ) ) ( not ( = ?auto_129842 ?auto_129844 ) ) ( not ( = ?auto_129842 ?auto_129845 ) ) ( not ( = ?auto_129842 ?auto_129846 ) ) ( not ( = ?auto_129842 ?auto_129847 ) ) ( not ( = ?auto_129843 ?auto_129844 ) ) ( not ( = ?auto_129843 ?auto_129845 ) ) ( not ( = ?auto_129843 ?auto_129846 ) ) ( not ( = ?auto_129843 ?auto_129847 ) ) ( not ( = ?auto_129844 ?auto_129845 ) ) ( not ( = ?auto_129844 ?auto_129846 ) ) ( not ( = ?auto_129844 ?auto_129847 ) ) ( not ( = ?auto_129845 ?auto_129846 ) ) ( not ( = ?auto_129845 ?auto_129847 ) ) ( not ( = ?auto_129846 ?auto_129847 ) ) ( ON-TABLE ?auto_129847 ) ( ON ?auto_129846 ?auto_129847 ) ( ON ?auto_129845 ?auto_129846 ) ( ON ?auto_129844 ?auto_129845 ) ( ON ?auto_129843 ?auto_129844 ) ( ON ?auto_129842 ?auto_129843 ) ( CLEAR ?auto_129842 ) ( HOLDING ?auto_129841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129841 )
      ( MAKE-7PILE ?auto_129841 ?auto_129842 ?auto_129843 ?auto_129844 ?auto_129845 ?auto_129846 ?auto_129847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129848 - BLOCK
      ?auto_129849 - BLOCK
      ?auto_129850 - BLOCK
      ?auto_129851 - BLOCK
      ?auto_129852 - BLOCK
      ?auto_129853 - BLOCK
      ?auto_129854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129848 ?auto_129849 ) ) ( not ( = ?auto_129848 ?auto_129850 ) ) ( not ( = ?auto_129848 ?auto_129851 ) ) ( not ( = ?auto_129848 ?auto_129852 ) ) ( not ( = ?auto_129848 ?auto_129853 ) ) ( not ( = ?auto_129848 ?auto_129854 ) ) ( not ( = ?auto_129849 ?auto_129850 ) ) ( not ( = ?auto_129849 ?auto_129851 ) ) ( not ( = ?auto_129849 ?auto_129852 ) ) ( not ( = ?auto_129849 ?auto_129853 ) ) ( not ( = ?auto_129849 ?auto_129854 ) ) ( not ( = ?auto_129850 ?auto_129851 ) ) ( not ( = ?auto_129850 ?auto_129852 ) ) ( not ( = ?auto_129850 ?auto_129853 ) ) ( not ( = ?auto_129850 ?auto_129854 ) ) ( not ( = ?auto_129851 ?auto_129852 ) ) ( not ( = ?auto_129851 ?auto_129853 ) ) ( not ( = ?auto_129851 ?auto_129854 ) ) ( not ( = ?auto_129852 ?auto_129853 ) ) ( not ( = ?auto_129852 ?auto_129854 ) ) ( not ( = ?auto_129853 ?auto_129854 ) ) ( ON-TABLE ?auto_129854 ) ( ON ?auto_129853 ?auto_129854 ) ( ON ?auto_129852 ?auto_129853 ) ( ON ?auto_129851 ?auto_129852 ) ( ON ?auto_129850 ?auto_129851 ) ( ON ?auto_129849 ?auto_129850 ) ( ON ?auto_129848 ?auto_129849 ) ( CLEAR ?auto_129848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129854 ?auto_129853 ?auto_129852 ?auto_129851 ?auto_129850 ?auto_129849 )
      ( MAKE-7PILE ?auto_129848 ?auto_129849 ?auto_129850 ?auto_129851 ?auto_129852 ?auto_129853 ?auto_129854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129855 - BLOCK
      ?auto_129856 - BLOCK
      ?auto_129857 - BLOCK
      ?auto_129858 - BLOCK
      ?auto_129859 - BLOCK
      ?auto_129860 - BLOCK
      ?auto_129861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129855 ?auto_129856 ) ) ( not ( = ?auto_129855 ?auto_129857 ) ) ( not ( = ?auto_129855 ?auto_129858 ) ) ( not ( = ?auto_129855 ?auto_129859 ) ) ( not ( = ?auto_129855 ?auto_129860 ) ) ( not ( = ?auto_129855 ?auto_129861 ) ) ( not ( = ?auto_129856 ?auto_129857 ) ) ( not ( = ?auto_129856 ?auto_129858 ) ) ( not ( = ?auto_129856 ?auto_129859 ) ) ( not ( = ?auto_129856 ?auto_129860 ) ) ( not ( = ?auto_129856 ?auto_129861 ) ) ( not ( = ?auto_129857 ?auto_129858 ) ) ( not ( = ?auto_129857 ?auto_129859 ) ) ( not ( = ?auto_129857 ?auto_129860 ) ) ( not ( = ?auto_129857 ?auto_129861 ) ) ( not ( = ?auto_129858 ?auto_129859 ) ) ( not ( = ?auto_129858 ?auto_129860 ) ) ( not ( = ?auto_129858 ?auto_129861 ) ) ( not ( = ?auto_129859 ?auto_129860 ) ) ( not ( = ?auto_129859 ?auto_129861 ) ) ( not ( = ?auto_129860 ?auto_129861 ) ) ( ON-TABLE ?auto_129861 ) ( ON ?auto_129860 ?auto_129861 ) ( ON ?auto_129859 ?auto_129860 ) ( ON ?auto_129858 ?auto_129859 ) ( ON ?auto_129857 ?auto_129858 ) ( ON ?auto_129856 ?auto_129857 ) ( HOLDING ?auto_129855 ) ( CLEAR ?auto_129856 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129861 ?auto_129860 ?auto_129859 ?auto_129858 ?auto_129857 ?auto_129856 ?auto_129855 )
      ( MAKE-7PILE ?auto_129855 ?auto_129856 ?auto_129857 ?auto_129858 ?auto_129859 ?auto_129860 ?auto_129861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129862 - BLOCK
      ?auto_129863 - BLOCK
      ?auto_129864 - BLOCK
      ?auto_129865 - BLOCK
      ?auto_129866 - BLOCK
      ?auto_129867 - BLOCK
      ?auto_129868 - BLOCK
    )
    :vars
    (
      ?auto_129869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129862 ?auto_129863 ) ) ( not ( = ?auto_129862 ?auto_129864 ) ) ( not ( = ?auto_129862 ?auto_129865 ) ) ( not ( = ?auto_129862 ?auto_129866 ) ) ( not ( = ?auto_129862 ?auto_129867 ) ) ( not ( = ?auto_129862 ?auto_129868 ) ) ( not ( = ?auto_129863 ?auto_129864 ) ) ( not ( = ?auto_129863 ?auto_129865 ) ) ( not ( = ?auto_129863 ?auto_129866 ) ) ( not ( = ?auto_129863 ?auto_129867 ) ) ( not ( = ?auto_129863 ?auto_129868 ) ) ( not ( = ?auto_129864 ?auto_129865 ) ) ( not ( = ?auto_129864 ?auto_129866 ) ) ( not ( = ?auto_129864 ?auto_129867 ) ) ( not ( = ?auto_129864 ?auto_129868 ) ) ( not ( = ?auto_129865 ?auto_129866 ) ) ( not ( = ?auto_129865 ?auto_129867 ) ) ( not ( = ?auto_129865 ?auto_129868 ) ) ( not ( = ?auto_129866 ?auto_129867 ) ) ( not ( = ?auto_129866 ?auto_129868 ) ) ( not ( = ?auto_129867 ?auto_129868 ) ) ( ON-TABLE ?auto_129868 ) ( ON ?auto_129867 ?auto_129868 ) ( ON ?auto_129866 ?auto_129867 ) ( ON ?auto_129865 ?auto_129866 ) ( ON ?auto_129864 ?auto_129865 ) ( ON ?auto_129863 ?auto_129864 ) ( CLEAR ?auto_129863 ) ( ON ?auto_129862 ?auto_129869 ) ( CLEAR ?auto_129862 ) ( HAND-EMPTY ) ( not ( = ?auto_129862 ?auto_129869 ) ) ( not ( = ?auto_129863 ?auto_129869 ) ) ( not ( = ?auto_129864 ?auto_129869 ) ) ( not ( = ?auto_129865 ?auto_129869 ) ) ( not ( = ?auto_129866 ?auto_129869 ) ) ( not ( = ?auto_129867 ?auto_129869 ) ) ( not ( = ?auto_129868 ?auto_129869 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_129862 ?auto_129869 )
      ( MAKE-7PILE ?auto_129862 ?auto_129863 ?auto_129864 ?auto_129865 ?auto_129866 ?auto_129867 ?auto_129868 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129870 - BLOCK
      ?auto_129871 - BLOCK
      ?auto_129872 - BLOCK
      ?auto_129873 - BLOCK
      ?auto_129874 - BLOCK
      ?auto_129875 - BLOCK
      ?auto_129876 - BLOCK
    )
    :vars
    (
      ?auto_129877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129870 ?auto_129871 ) ) ( not ( = ?auto_129870 ?auto_129872 ) ) ( not ( = ?auto_129870 ?auto_129873 ) ) ( not ( = ?auto_129870 ?auto_129874 ) ) ( not ( = ?auto_129870 ?auto_129875 ) ) ( not ( = ?auto_129870 ?auto_129876 ) ) ( not ( = ?auto_129871 ?auto_129872 ) ) ( not ( = ?auto_129871 ?auto_129873 ) ) ( not ( = ?auto_129871 ?auto_129874 ) ) ( not ( = ?auto_129871 ?auto_129875 ) ) ( not ( = ?auto_129871 ?auto_129876 ) ) ( not ( = ?auto_129872 ?auto_129873 ) ) ( not ( = ?auto_129872 ?auto_129874 ) ) ( not ( = ?auto_129872 ?auto_129875 ) ) ( not ( = ?auto_129872 ?auto_129876 ) ) ( not ( = ?auto_129873 ?auto_129874 ) ) ( not ( = ?auto_129873 ?auto_129875 ) ) ( not ( = ?auto_129873 ?auto_129876 ) ) ( not ( = ?auto_129874 ?auto_129875 ) ) ( not ( = ?auto_129874 ?auto_129876 ) ) ( not ( = ?auto_129875 ?auto_129876 ) ) ( ON-TABLE ?auto_129876 ) ( ON ?auto_129875 ?auto_129876 ) ( ON ?auto_129874 ?auto_129875 ) ( ON ?auto_129873 ?auto_129874 ) ( ON ?auto_129872 ?auto_129873 ) ( ON ?auto_129870 ?auto_129877 ) ( CLEAR ?auto_129870 ) ( not ( = ?auto_129870 ?auto_129877 ) ) ( not ( = ?auto_129871 ?auto_129877 ) ) ( not ( = ?auto_129872 ?auto_129877 ) ) ( not ( = ?auto_129873 ?auto_129877 ) ) ( not ( = ?auto_129874 ?auto_129877 ) ) ( not ( = ?auto_129875 ?auto_129877 ) ) ( not ( = ?auto_129876 ?auto_129877 ) ) ( HOLDING ?auto_129871 ) ( CLEAR ?auto_129872 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129876 ?auto_129875 ?auto_129874 ?auto_129873 ?auto_129872 ?auto_129871 )
      ( MAKE-7PILE ?auto_129870 ?auto_129871 ?auto_129872 ?auto_129873 ?auto_129874 ?auto_129875 ?auto_129876 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129878 - BLOCK
      ?auto_129879 - BLOCK
      ?auto_129880 - BLOCK
      ?auto_129881 - BLOCK
      ?auto_129882 - BLOCK
      ?auto_129883 - BLOCK
      ?auto_129884 - BLOCK
    )
    :vars
    (
      ?auto_129885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129878 ?auto_129879 ) ) ( not ( = ?auto_129878 ?auto_129880 ) ) ( not ( = ?auto_129878 ?auto_129881 ) ) ( not ( = ?auto_129878 ?auto_129882 ) ) ( not ( = ?auto_129878 ?auto_129883 ) ) ( not ( = ?auto_129878 ?auto_129884 ) ) ( not ( = ?auto_129879 ?auto_129880 ) ) ( not ( = ?auto_129879 ?auto_129881 ) ) ( not ( = ?auto_129879 ?auto_129882 ) ) ( not ( = ?auto_129879 ?auto_129883 ) ) ( not ( = ?auto_129879 ?auto_129884 ) ) ( not ( = ?auto_129880 ?auto_129881 ) ) ( not ( = ?auto_129880 ?auto_129882 ) ) ( not ( = ?auto_129880 ?auto_129883 ) ) ( not ( = ?auto_129880 ?auto_129884 ) ) ( not ( = ?auto_129881 ?auto_129882 ) ) ( not ( = ?auto_129881 ?auto_129883 ) ) ( not ( = ?auto_129881 ?auto_129884 ) ) ( not ( = ?auto_129882 ?auto_129883 ) ) ( not ( = ?auto_129882 ?auto_129884 ) ) ( not ( = ?auto_129883 ?auto_129884 ) ) ( ON-TABLE ?auto_129884 ) ( ON ?auto_129883 ?auto_129884 ) ( ON ?auto_129882 ?auto_129883 ) ( ON ?auto_129881 ?auto_129882 ) ( ON ?auto_129880 ?auto_129881 ) ( ON ?auto_129878 ?auto_129885 ) ( not ( = ?auto_129878 ?auto_129885 ) ) ( not ( = ?auto_129879 ?auto_129885 ) ) ( not ( = ?auto_129880 ?auto_129885 ) ) ( not ( = ?auto_129881 ?auto_129885 ) ) ( not ( = ?auto_129882 ?auto_129885 ) ) ( not ( = ?auto_129883 ?auto_129885 ) ) ( not ( = ?auto_129884 ?auto_129885 ) ) ( CLEAR ?auto_129880 ) ( ON ?auto_129879 ?auto_129878 ) ( CLEAR ?auto_129879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_129885 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129885 ?auto_129878 )
      ( MAKE-7PILE ?auto_129878 ?auto_129879 ?auto_129880 ?auto_129881 ?auto_129882 ?auto_129883 ?auto_129884 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129886 - BLOCK
      ?auto_129887 - BLOCK
      ?auto_129888 - BLOCK
      ?auto_129889 - BLOCK
      ?auto_129890 - BLOCK
      ?auto_129891 - BLOCK
      ?auto_129892 - BLOCK
    )
    :vars
    (
      ?auto_129893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129886 ?auto_129887 ) ) ( not ( = ?auto_129886 ?auto_129888 ) ) ( not ( = ?auto_129886 ?auto_129889 ) ) ( not ( = ?auto_129886 ?auto_129890 ) ) ( not ( = ?auto_129886 ?auto_129891 ) ) ( not ( = ?auto_129886 ?auto_129892 ) ) ( not ( = ?auto_129887 ?auto_129888 ) ) ( not ( = ?auto_129887 ?auto_129889 ) ) ( not ( = ?auto_129887 ?auto_129890 ) ) ( not ( = ?auto_129887 ?auto_129891 ) ) ( not ( = ?auto_129887 ?auto_129892 ) ) ( not ( = ?auto_129888 ?auto_129889 ) ) ( not ( = ?auto_129888 ?auto_129890 ) ) ( not ( = ?auto_129888 ?auto_129891 ) ) ( not ( = ?auto_129888 ?auto_129892 ) ) ( not ( = ?auto_129889 ?auto_129890 ) ) ( not ( = ?auto_129889 ?auto_129891 ) ) ( not ( = ?auto_129889 ?auto_129892 ) ) ( not ( = ?auto_129890 ?auto_129891 ) ) ( not ( = ?auto_129890 ?auto_129892 ) ) ( not ( = ?auto_129891 ?auto_129892 ) ) ( ON-TABLE ?auto_129892 ) ( ON ?auto_129891 ?auto_129892 ) ( ON ?auto_129890 ?auto_129891 ) ( ON ?auto_129889 ?auto_129890 ) ( ON ?auto_129886 ?auto_129893 ) ( not ( = ?auto_129886 ?auto_129893 ) ) ( not ( = ?auto_129887 ?auto_129893 ) ) ( not ( = ?auto_129888 ?auto_129893 ) ) ( not ( = ?auto_129889 ?auto_129893 ) ) ( not ( = ?auto_129890 ?auto_129893 ) ) ( not ( = ?auto_129891 ?auto_129893 ) ) ( not ( = ?auto_129892 ?auto_129893 ) ) ( ON ?auto_129887 ?auto_129886 ) ( CLEAR ?auto_129887 ) ( ON-TABLE ?auto_129893 ) ( HOLDING ?auto_129888 ) ( CLEAR ?auto_129889 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129892 ?auto_129891 ?auto_129890 ?auto_129889 ?auto_129888 )
      ( MAKE-7PILE ?auto_129886 ?auto_129887 ?auto_129888 ?auto_129889 ?auto_129890 ?auto_129891 ?auto_129892 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129894 - BLOCK
      ?auto_129895 - BLOCK
      ?auto_129896 - BLOCK
      ?auto_129897 - BLOCK
      ?auto_129898 - BLOCK
      ?auto_129899 - BLOCK
      ?auto_129900 - BLOCK
    )
    :vars
    (
      ?auto_129901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129894 ?auto_129895 ) ) ( not ( = ?auto_129894 ?auto_129896 ) ) ( not ( = ?auto_129894 ?auto_129897 ) ) ( not ( = ?auto_129894 ?auto_129898 ) ) ( not ( = ?auto_129894 ?auto_129899 ) ) ( not ( = ?auto_129894 ?auto_129900 ) ) ( not ( = ?auto_129895 ?auto_129896 ) ) ( not ( = ?auto_129895 ?auto_129897 ) ) ( not ( = ?auto_129895 ?auto_129898 ) ) ( not ( = ?auto_129895 ?auto_129899 ) ) ( not ( = ?auto_129895 ?auto_129900 ) ) ( not ( = ?auto_129896 ?auto_129897 ) ) ( not ( = ?auto_129896 ?auto_129898 ) ) ( not ( = ?auto_129896 ?auto_129899 ) ) ( not ( = ?auto_129896 ?auto_129900 ) ) ( not ( = ?auto_129897 ?auto_129898 ) ) ( not ( = ?auto_129897 ?auto_129899 ) ) ( not ( = ?auto_129897 ?auto_129900 ) ) ( not ( = ?auto_129898 ?auto_129899 ) ) ( not ( = ?auto_129898 ?auto_129900 ) ) ( not ( = ?auto_129899 ?auto_129900 ) ) ( ON-TABLE ?auto_129900 ) ( ON ?auto_129899 ?auto_129900 ) ( ON ?auto_129898 ?auto_129899 ) ( ON ?auto_129897 ?auto_129898 ) ( ON ?auto_129894 ?auto_129901 ) ( not ( = ?auto_129894 ?auto_129901 ) ) ( not ( = ?auto_129895 ?auto_129901 ) ) ( not ( = ?auto_129896 ?auto_129901 ) ) ( not ( = ?auto_129897 ?auto_129901 ) ) ( not ( = ?auto_129898 ?auto_129901 ) ) ( not ( = ?auto_129899 ?auto_129901 ) ) ( not ( = ?auto_129900 ?auto_129901 ) ) ( ON ?auto_129895 ?auto_129894 ) ( ON-TABLE ?auto_129901 ) ( CLEAR ?auto_129897 ) ( ON ?auto_129896 ?auto_129895 ) ( CLEAR ?auto_129896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129901 ?auto_129894 ?auto_129895 )
      ( MAKE-7PILE ?auto_129894 ?auto_129895 ?auto_129896 ?auto_129897 ?auto_129898 ?auto_129899 ?auto_129900 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129902 - BLOCK
      ?auto_129903 - BLOCK
      ?auto_129904 - BLOCK
      ?auto_129905 - BLOCK
      ?auto_129906 - BLOCK
      ?auto_129907 - BLOCK
      ?auto_129908 - BLOCK
    )
    :vars
    (
      ?auto_129909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129902 ?auto_129903 ) ) ( not ( = ?auto_129902 ?auto_129904 ) ) ( not ( = ?auto_129902 ?auto_129905 ) ) ( not ( = ?auto_129902 ?auto_129906 ) ) ( not ( = ?auto_129902 ?auto_129907 ) ) ( not ( = ?auto_129902 ?auto_129908 ) ) ( not ( = ?auto_129903 ?auto_129904 ) ) ( not ( = ?auto_129903 ?auto_129905 ) ) ( not ( = ?auto_129903 ?auto_129906 ) ) ( not ( = ?auto_129903 ?auto_129907 ) ) ( not ( = ?auto_129903 ?auto_129908 ) ) ( not ( = ?auto_129904 ?auto_129905 ) ) ( not ( = ?auto_129904 ?auto_129906 ) ) ( not ( = ?auto_129904 ?auto_129907 ) ) ( not ( = ?auto_129904 ?auto_129908 ) ) ( not ( = ?auto_129905 ?auto_129906 ) ) ( not ( = ?auto_129905 ?auto_129907 ) ) ( not ( = ?auto_129905 ?auto_129908 ) ) ( not ( = ?auto_129906 ?auto_129907 ) ) ( not ( = ?auto_129906 ?auto_129908 ) ) ( not ( = ?auto_129907 ?auto_129908 ) ) ( ON-TABLE ?auto_129908 ) ( ON ?auto_129907 ?auto_129908 ) ( ON ?auto_129906 ?auto_129907 ) ( ON ?auto_129902 ?auto_129909 ) ( not ( = ?auto_129902 ?auto_129909 ) ) ( not ( = ?auto_129903 ?auto_129909 ) ) ( not ( = ?auto_129904 ?auto_129909 ) ) ( not ( = ?auto_129905 ?auto_129909 ) ) ( not ( = ?auto_129906 ?auto_129909 ) ) ( not ( = ?auto_129907 ?auto_129909 ) ) ( not ( = ?auto_129908 ?auto_129909 ) ) ( ON ?auto_129903 ?auto_129902 ) ( ON-TABLE ?auto_129909 ) ( ON ?auto_129904 ?auto_129903 ) ( CLEAR ?auto_129904 ) ( HOLDING ?auto_129905 ) ( CLEAR ?auto_129906 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129908 ?auto_129907 ?auto_129906 ?auto_129905 )
      ( MAKE-7PILE ?auto_129902 ?auto_129903 ?auto_129904 ?auto_129905 ?auto_129906 ?auto_129907 ?auto_129908 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129910 - BLOCK
      ?auto_129911 - BLOCK
      ?auto_129912 - BLOCK
      ?auto_129913 - BLOCK
      ?auto_129914 - BLOCK
      ?auto_129915 - BLOCK
      ?auto_129916 - BLOCK
    )
    :vars
    (
      ?auto_129917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129910 ?auto_129911 ) ) ( not ( = ?auto_129910 ?auto_129912 ) ) ( not ( = ?auto_129910 ?auto_129913 ) ) ( not ( = ?auto_129910 ?auto_129914 ) ) ( not ( = ?auto_129910 ?auto_129915 ) ) ( not ( = ?auto_129910 ?auto_129916 ) ) ( not ( = ?auto_129911 ?auto_129912 ) ) ( not ( = ?auto_129911 ?auto_129913 ) ) ( not ( = ?auto_129911 ?auto_129914 ) ) ( not ( = ?auto_129911 ?auto_129915 ) ) ( not ( = ?auto_129911 ?auto_129916 ) ) ( not ( = ?auto_129912 ?auto_129913 ) ) ( not ( = ?auto_129912 ?auto_129914 ) ) ( not ( = ?auto_129912 ?auto_129915 ) ) ( not ( = ?auto_129912 ?auto_129916 ) ) ( not ( = ?auto_129913 ?auto_129914 ) ) ( not ( = ?auto_129913 ?auto_129915 ) ) ( not ( = ?auto_129913 ?auto_129916 ) ) ( not ( = ?auto_129914 ?auto_129915 ) ) ( not ( = ?auto_129914 ?auto_129916 ) ) ( not ( = ?auto_129915 ?auto_129916 ) ) ( ON-TABLE ?auto_129916 ) ( ON ?auto_129915 ?auto_129916 ) ( ON ?auto_129914 ?auto_129915 ) ( ON ?auto_129910 ?auto_129917 ) ( not ( = ?auto_129910 ?auto_129917 ) ) ( not ( = ?auto_129911 ?auto_129917 ) ) ( not ( = ?auto_129912 ?auto_129917 ) ) ( not ( = ?auto_129913 ?auto_129917 ) ) ( not ( = ?auto_129914 ?auto_129917 ) ) ( not ( = ?auto_129915 ?auto_129917 ) ) ( not ( = ?auto_129916 ?auto_129917 ) ) ( ON ?auto_129911 ?auto_129910 ) ( ON-TABLE ?auto_129917 ) ( ON ?auto_129912 ?auto_129911 ) ( CLEAR ?auto_129914 ) ( ON ?auto_129913 ?auto_129912 ) ( CLEAR ?auto_129913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_129917 ?auto_129910 ?auto_129911 ?auto_129912 )
      ( MAKE-7PILE ?auto_129910 ?auto_129911 ?auto_129912 ?auto_129913 ?auto_129914 ?auto_129915 ?auto_129916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129918 - BLOCK
      ?auto_129919 - BLOCK
      ?auto_129920 - BLOCK
      ?auto_129921 - BLOCK
      ?auto_129922 - BLOCK
      ?auto_129923 - BLOCK
      ?auto_129924 - BLOCK
    )
    :vars
    (
      ?auto_129925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129918 ?auto_129919 ) ) ( not ( = ?auto_129918 ?auto_129920 ) ) ( not ( = ?auto_129918 ?auto_129921 ) ) ( not ( = ?auto_129918 ?auto_129922 ) ) ( not ( = ?auto_129918 ?auto_129923 ) ) ( not ( = ?auto_129918 ?auto_129924 ) ) ( not ( = ?auto_129919 ?auto_129920 ) ) ( not ( = ?auto_129919 ?auto_129921 ) ) ( not ( = ?auto_129919 ?auto_129922 ) ) ( not ( = ?auto_129919 ?auto_129923 ) ) ( not ( = ?auto_129919 ?auto_129924 ) ) ( not ( = ?auto_129920 ?auto_129921 ) ) ( not ( = ?auto_129920 ?auto_129922 ) ) ( not ( = ?auto_129920 ?auto_129923 ) ) ( not ( = ?auto_129920 ?auto_129924 ) ) ( not ( = ?auto_129921 ?auto_129922 ) ) ( not ( = ?auto_129921 ?auto_129923 ) ) ( not ( = ?auto_129921 ?auto_129924 ) ) ( not ( = ?auto_129922 ?auto_129923 ) ) ( not ( = ?auto_129922 ?auto_129924 ) ) ( not ( = ?auto_129923 ?auto_129924 ) ) ( ON-TABLE ?auto_129924 ) ( ON ?auto_129923 ?auto_129924 ) ( ON ?auto_129918 ?auto_129925 ) ( not ( = ?auto_129918 ?auto_129925 ) ) ( not ( = ?auto_129919 ?auto_129925 ) ) ( not ( = ?auto_129920 ?auto_129925 ) ) ( not ( = ?auto_129921 ?auto_129925 ) ) ( not ( = ?auto_129922 ?auto_129925 ) ) ( not ( = ?auto_129923 ?auto_129925 ) ) ( not ( = ?auto_129924 ?auto_129925 ) ) ( ON ?auto_129919 ?auto_129918 ) ( ON-TABLE ?auto_129925 ) ( ON ?auto_129920 ?auto_129919 ) ( ON ?auto_129921 ?auto_129920 ) ( CLEAR ?auto_129921 ) ( HOLDING ?auto_129922 ) ( CLEAR ?auto_129923 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_129924 ?auto_129923 ?auto_129922 )
      ( MAKE-7PILE ?auto_129918 ?auto_129919 ?auto_129920 ?auto_129921 ?auto_129922 ?auto_129923 ?auto_129924 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129926 - BLOCK
      ?auto_129927 - BLOCK
      ?auto_129928 - BLOCK
      ?auto_129929 - BLOCK
      ?auto_129930 - BLOCK
      ?auto_129931 - BLOCK
      ?auto_129932 - BLOCK
    )
    :vars
    (
      ?auto_129933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129926 ?auto_129927 ) ) ( not ( = ?auto_129926 ?auto_129928 ) ) ( not ( = ?auto_129926 ?auto_129929 ) ) ( not ( = ?auto_129926 ?auto_129930 ) ) ( not ( = ?auto_129926 ?auto_129931 ) ) ( not ( = ?auto_129926 ?auto_129932 ) ) ( not ( = ?auto_129927 ?auto_129928 ) ) ( not ( = ?auto_129927 ?auto_129929 ) ) ( not ( = ?auto_129927 ?auto_129930 ) ) ( not ( = ?auto_129927 ?auto_129931 ) ) ( not ( = ?auto_129927 ?auto_129932 ) ) ( not ( = ?auto_129928 ?auto_129929 ) ) ( not ( = ?auto_129928 ?auto_129930 ) ) ( not ( = ?auto_129928 ?auto_129931 ) ) ( not ( = ?auto_129928 ?auto_129932 ) ) ( not ( = ?auto_129929 ?auto_129930 ) ) ( not ( = ?auto_129929 ?auto_129931 ) ) ( not ( = ?auto_129929 ?auto_129932 ) ) ( not ( = ?auto_129930 ?auto_129931 ) ) ( not ( = ?auto_129930 ?auto_129932 ) ) ( not ( = ?auto_129931 ?auto_129932 ) ) ( ON-TABLE ?auto_129932 ) ( ON ?auto_129931 ?auto_129932 ) ( ON ?auto_129926 ?auto_129933 ) ( not ( = ?auto_129926 ?auto_129933 ) ) ( not ( = ?auto_129927 ?auto_129933 ) ) ( not ( = ?auto_129928 ?auto_129933 ) ) ( not ( = ?auto_129929 ?auto_129933 ) ) ( not ( = ?auto_129930 ?auto_129933 ) ) ( not ( = ?auto_129931 ?auto_129933 ) ) ( not ( = ?auto_129932 ?auto_129933 ) ) ( ON ?auto_129927 ?auto_129926 ) ( ON-TABLE ?auto_129933 ) ( ON ?auto_129928 ?auto_129927 ) ( ON ?auto_129929 ?auto_129928 ) ( CLEAR ?auto_129931 ) ( ON ?auto_129930 ?auto_129929 ) ( CLEAR ?auto_129930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_129933 ?auto_129926 ?auto_129927 ?auto_129928 ?auto_129929 )
      ( MAKE-7PILE ?auto_129926 ?auto_129927 ?auto_129928 ?auto_129929 ?auto_129930 ?auto_129931 ?auto_129932 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129934 - BLOCK
      ?auto_129935 - BLOCK
      ?auto_129936 - BLOCK
      ?auto_129937 - BLOCK
      ?auto_129938 - BLOCK
      ?auto_129939 - BLOCK
      ?auto_129940 - BLOCK
    )
    :vars
    (
      ?auto_129941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129934 ?auto_129935 ) ) ( not ( = ?auto_129934 ?auto_129936 ) ) ( not ( = ?auto_129934 ?auto_129937 ) ) ( not ( = ?auto_129934 ?auto_129938 ) ) ( not ( = ?auto_129934 ?auto_129939 ) ) ( not ( = ?auto_129934 ?auto_129940 ) ) ( not ( = ?auto_129935 ?auto_129936 ) ) ( not ( = ?auto_129935 ?auto_129937 ) ) ( not ( = ?auto_129935 ?auto_129938 ) ) ( not ( = ?auto_129935 ?auto_129939 ) ) ( not ( = ?auto_129935 ?auto_129940 ) ) ( not ( = ?auto_129936 ?auto_129937 ) ) ( not ( = ?auto_129936 ?auto_129938 ) ) ( not ( = ?auto_129936 ?auto_129939 ) ) ( not ( = ?auto_129936 ?auto_129940 ) ) ( not ( = ?auto_129937 ?auto_129938 ) ) ( not ( = ?auto_129937 ?auto_129939 ) ) ( not ( = ?auto_129937 ?auto_129940 ) ) ( not ( = ?auto_129938 ?auto_129939 ) ) ( not ( = ?auto_129938 ?auto_129940 ) ) ( not ( = ?auto_129939 ?auto_129940 ) ) ( ON-TABLE ?auto_129940 ) ( ON ?auto_129934 ?auto_129941 ) ( not ( = ?auto_129934 ?auto_129941 ) ) ( not ( = ?auto_129935 ?auto_129941 ) ) ( not ( = ?auto_129936 ?auto_129941 ) ) ( not ( = ?auto_129937 ?auto_129941 ) ) ( not ( = ?auto_129938 ?auto_129941 ) ) ( not ( = ?auto_129939 ?auto_129941 ) ) ( not ( = ?auto_129940 ?auto_129941 ) ) ( ON ?auto_129935 ?auto_129934 ) ( ON-TABLE ?auto_129941 ) ( ON ?auto_129936 ?auto_129935 ) ( ON ?auto_129937 ?auto_129936 ) ( ON ?auto_129938 ?auto_129937 ) ( CLEAR ?auto_129938 ) ( HOLDING ?auto_129939 ) ( CLEAR ?auto_129940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_129940 ?auto_129939 )
      ( MAKE-7PILE ?auto_129934 ?auto_129935 ?auto_129936 ?auto_129937 ?auto_129938 ?auto_129939 ?auto_129940 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129942 - BLOCK
      ?auto_129943 - BLOCK
      ?auto_129944 - BLOCK
      ?auto_129945 - BLOCK
      ?auto_129946 - BLOCK
      ?auto_129947 - BLOCK
      ?auto_129948 - BLOCK
    )
    :vars
    (
      ?auto_129949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129942 ?auto_129943 ) ) ( not ( = ?auto_129942 ?auto_129944 ) ) ( not ( = ?auto_129942 ?auto_129945 ) ) ( not ( = ?auto_129942 ?auto_129946 ) ) ( not ( = ?auto_129942 ?auto_129947 ) ) ( not ( = ?auto_129942 ?auto_129948 ) ) ( not ( = ?auto_129943 ?auto_129944 ) ) ( not ( = ?auto_129943 ?auto_129945 ) ) ( not ( = ?auto_129943 ?auto_129946 ) ) ( not ( = ?auto_129943 ?auto_129947 ) ) ( not ( = ?auto_129943 ?auto_129948 ) ) ( not ( = ?auto_129944 ?auto_129945 ) ) ( not ( = ?auto_129944 ?auto_129946 ) ) ( not ( = ?auto_129944 ?auto_129947 ) ) ( not ( = ?auto_129944 ?auto_129948 ) ) ( not ( = ?auto_129945 ?auto_129946 ) ) ( not ( = ?auto_129945 ?auto_129947 ) ) ( not ( = ?auto_129945 ?auto_129948 ) ) ( not ( = ?auto_129946 ?auto_129947 ) ) ( not ( = ?auto_129946 ?auto_129948 ) ) ( not ( = ?auto_129947 ?auto_129948 ) ) ( ON-TABLE ?auto_129948 ) ( ON ?auto_129942 ?auto_129949 ) ( not ( = ?auto_129942 ?auto_129949 ) ) ( not ( = ?auto_129943 ?auto_129949 ) ) ( not ( = ?auto_129944 ?auto_129949 ) ) ( not ( = ?auto_129945 ?auto_129949 ) ) ( not ( = ?auto_129946 ?auto_129949 ) ) ( not ( = ?auto_129947 ?auto_129949 ) ) ( not ( = ?auto_129948 ?auto_129949 ) ) ( ON ?auto_129943 ?auto_129942 ) ( ON-TABLE ?auto_129949 ) ( ON ?auto_129944 ?auto_129943 ) ( ON ?auto_129945 ?auto_129944 ) ( ON ?auto_129946 ?auto_129945 ) ( CLEAR ?auto_129948 ) ( ON ?auto_129947 ?auto_129946 ) ( CLEAR ?auto_129947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_129949 ?auto_129942 ?auto_129943 ?auto_129944 ?auto_129945 ?auto_129946 )
      ( MAKE-7PILE ?auto_129942 ?auto_129943 ?auto_129944 ?auto_129945 ?auto_129946 ?auto_129947 ?auto_129948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129950 - BLOCK
      ?auto_129951 - BLOCK
      ?auto_129952 - BLOCK
      ?auto_129953 - BLOCK
      ?auto_129954 - BLOCK
      ?auto_129955 - BLOCK
      ?auto_129956 - BLOCK
    )
    :vars
    (
      ?auto_129957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129950 ?auto_129951 ) ) ( not ( = ?auto_129950 ?auto_129952 ) ) ( not ( = ?auto_129950 ?auto_129953 ) ) ( not ( = ?auto_129950 ?auto_129954 ) ) ( not ( = ?auto_129950 ?auto_129955 ) ) ( not ( = ?auto_129950 ?auto_129956 ) ) ( not ( = ?auto_129951 ?auto_129952 ) ) ( not ( = ?auto_129951 ?auto_129953 ) ) ( not ( = ?auto_129951 ?auto_129954 ) ) ( not ( = ?auto_129951 ?auto_129955 ) ) ( not ( = ?auto_129951 ?auto_129956 ) ) ( not ( = ?auto_129952 ?auto_129953 ) ) ( not ( = ?auto_129952 ?auto_129954 ) ) ( not ( = ?auto_129952 ?auto_129955 ) ) ( not ( = ?auto_129952 ?auto_129956 ) ) ( not ( = ?auto_129953 ?auto_129954 ) ) ( not ( = ?auto_129953 ?auto_129955 ) ) ( not ( = ?auto_129953 ?auto_129956 ) ) ( not ( = ?auto_129954 ?auto_129955 ) ) ( not ( = ?auto_129954 ?auto_129956 ) ) ( not ( = ?auto_129955 ?auto_129956 ) ) ( ON ?auto_129950 ?auto_129957 ) ( not ( = ?auto_129950 ?auto_129957 ) ) ( not ( = ?auto_129951 ?auto_129957 ) ) ( not ( = ?auto_129952 ?auto_129957 ) ) ( not ( = ?auto_129953 ?auto_129957 ) ) ( not ( = ?auto_129954 ?auto_129957 ) ) ( not ( = ?auto_129955 ?auto_129957 ) ) ( not ( = ?auto_129956 ?auto_129957 ) ) ( ON ?auto_129951 ?auto_129950 ) ( ON-TABLE ?auto_129957 ) ( ON ?auto_129952 ?auto_129951 ) ( ON ?auto_129953 ?auto_129952 ) ( ON ?auto_129954 ?auto_129953 ) ( ON ?auto_129955 ?auto_129954 ) ( CLEAR ?auto_129955 ) ( HOLDING ?auto_129956 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_129956 )
      ( MAKE-7PILE ?auto_129950 ?auto_129951 ?auto_129952 ?auto_129953 ?auto_129954 ?auto_129955 ?auto_129956 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_129958 - BLOCK
      ?auto_129959 - BLOCK
      ?auto_129960 - BLOCK
      ?auto_129961 - BLOCK
      ?auto_129962 - BLOCK
      ?auto_129963 - BLOCK
      ?auto_129964 - BLOCK
    )
    :vars
    (
      ?auto_129965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_129958 ?auto_129959 ) ) ( not ( = ?auto_129958 ?auto_129960 ) ) ( not ( = ?auto_129958 ?auto_129961 ) ) ( not ( = ?auto_129958 ?auto_129962 ) ) ( not ( = ?auto_129958 ?auto_129963 ) ) ( not ( = ?auto_129958 ?auto_129964 ) ) ( not ( = ?auto_129959 ?auto_129960 ) ) ( not ( = ?auto_129959 ?auto_129961 ) ) ( not ( = ?auto_129959 ?auto_129962 ) ) ( not ( = ?auto_129959 ?auto_129963 ) ) ( not ( = ?auto_129959 ?auto_129964 ) ) ( not ( = ?auto_129960 ?auto_129961 ) ) ( not ( = ?auto_129960 ?auto_129962 ) ) ( not ( = ?auto_129960 ?auto_129963 ) ) ( not ( = ?auto_129960 ?auto_129964 ) ) ( not ( = ?auto_129961 ?auto_129962 ) ) ( not ( = ?auto_129961 ?auto_129963 ) ) ( not ( = ?auto_129961 ?auto_129964 ) ) ( not ( = ?auto_129962 ?auto_129963 ) ) ( not ( = ?auto_129962 ?auto_129964 ) ) ( not ( = ?auto_129963 ?auto_129964 ) ) ( ON ?auto_129958 ?auto_129965 ) ( not ( = ?auto_129958 ?auto_129965 ) ) ( not ( = ?auto_129959 ?auto_129965 ) ) ( not ( = ?auto_129960 ?auto_129965 ) ) ( not ( = ?auto_129961 ?auto_129965 ) ) ( not ( = ?auto_129962 ?auto_129965 ) ) ( not ( = ?auto_129963 ?auto_129965 ) ) ( not ( = ?auto_129964 ?auto_129965 ) ) ( ON ?auto_129959 ?auto_129958 ) ( ON-TABLE ?auto_129965 ) ( ON ?auto_129960 ?auto_129959 ) ( ON ?auto_129961 ?auto_129960 ) ( ON ?auto_129962 ?auto_129961 ) ( ON ?auto_129963 ?auto_129962 ) ( ON ?auto_129964 ?auto_129963 ) ( CLEAR ?auto_129964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_129965 ?auto_129958 ?auto_129959 ?auto_129960 ?auto_129961 ?auto_129962 ?auto_129963 )
      ( MAKE-7PILE ?auto_129958 ?auto_129959 ?auto_129960 ?auto_129961 ?auto_129962 ?auto_129963 ?auto_129964 ) )
  )

)

