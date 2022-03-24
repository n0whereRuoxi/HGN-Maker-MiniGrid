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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20069 - BLOCK
      ?auto_20070 - BLOCK
      ?auto_20071 - BLOCK
      ?auto_20072 - BLOCK
      ?auto_20073 - BLOCK
    )
    :vars
    (
      ?auto_20074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20074 ?auto_20073 ) ( CLEAR ?auto_20074 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20069 ) ( ON ?auto_20070 ?auto_20069 ) ( ON ?auto_20071 ?auto_20070 ) ( ON ?auto_20072 ?auto_20071 ) ( ON ?auto_20073 ?auto_20072 ) ( not ( = ?auto_20069 ?auto_20070 ) ) ( not ( = ?auto_20069 ?auto_20071 ) ) ( not ( = ?auto_20069 ?auto_20072 ) ) ( not ( = ?auto_20069 ?auto_20073 ) ) ( not ( = ?auto_20069 ?auto_20074 ) ) ( not ( = ?auto_20070 ?auto_20071 ) ) ( not ( = ?auto_20070 ?auto_20072 ) ) ( not ( = ?auto_20070 ?auto_20073 ) ) ( not ( = ?auto_20070 ?auto_20074 ) ) ( not ( = ?auto_20071 ?auto_20072 ) ) ( not ( = ?auto_20071 ?auto_20073 ) ) ( not ( = ?auto_20071 ?auto_20074 ) ) ( not ( = ?auto_20072 ?auto_20073 ) ) ( not ( = ?auto_20072 ?auto_20074 ) ) ( not ( = ?auto_20073 ?auto_20074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20074 ?auto_20073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20076 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20076 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_20076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20077 - BLOCK
    )
    :vars
    (
      ?auto_20078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20077 ?auto_20078 ) ( CLEAR ?auto_20077 ) ( HAND-EMPTY ) ( not ( = ?auto_20077 ?auto_20078 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20077 ?auto_20078 )
      ( MAKE-1PILE ?auto_20077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20083 - BLOCK
      ?auto_20084 - BLOCK
      ?auto_20085 - BLOCK
      ?auto_20086 - BLOCK
    )
    :vars
    (
      ?auto_20087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20087 ?auto_20086 ) ( CLEAR ?auto_20087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20083 ) ( ON ?auto_20084 ?auto_20083 ) ( ON ?auto_20085 ?auto_20084 ) ( ON ?auto_20086 ?auto_20085 ) ( not ( = ?auto_20083 ?auto_20084 ) ) ( not ( = ?auto_20083 ?auto_20085 ) ) ( not ( = ?auto_20083 ?auto_20086 ) ) ( not ( = ?auto_20083 ?auto_20087 ) ) ( not ( = ?auto_20084 ?auto_20085 ) ) ( not ( = ?auto_20084 ?auto_20086 ) ) ( not ( = ?auto_20084 ?auto_20087 ) ) ( not ( = ?auto_20085 ?auto_20086 ) ) ( not ( = ?auto_20085 ?auto_20087 ) ) ( not ( = ?auto_20086 ?auto_20087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20087 ?auto_20086 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20088 - BLOCK
      ?auto_20089 - BLOCK
      ?auto_20090 - BLOCK
      ?auto_20091 - BLOCK
    )
    :vars
    (
      ?auto_20092 - BLOCK
      ?auto_20093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20092 ?auto_20091 ) ( CLEAR ?auto_20092 ) ( ON-TABLE ?auto_20088 ) ( ON ?auto_20089 ?auto_20088 ) ( ON ?auto_20090 ?auto_20089 ) ( ON ?auto_20091 ?auto_20090 ) ( not ( = ?auto_20088 ?auto_20089 ) ) ( not ( = ?auto_20088 ?auto_20090 ) ) ( not ( = ?auto_20088 ?auto_20091 ) ) ( not ( = ?auto_20088 ?auto_20092 ) ) ( not ( = ?auto_20089 ?auto_20090 ) ) ( not ( = ?auto_20089 ?auto_20091 ) ) ( not ( = ?auto_20089 ?auto_20092 ) ) ( not ( = ?auto_20090 ?auto_20091 ) ) ( not ( = ?auto_20090 ?auto_20092 ) ) ( not ( = ?auto_20091 ?auto_20092 ) ) ( HOLDING ?auto_20093 ) ( not ( = ?auto_20088 ?auto_20093 ) ) ( not ( = ?auto_20089 ?auto_20093 ) ) ( not ( = ?auto_20090 ?auto_20093 ) ) ( not ( = ?auto_20091 ?auto_20093 ) ) ( not ( = ?auto_20092 ?auto_20093 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_20093 )
      ( MAKE-4PILE ?auto_20088 ?auto_20089 ?auto_20090 ?auto_20091 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20094 - BLOCK
      ?auto_20095 - BLOCK
      ?auto_20096 - BLOCK
      ?auto_20097 - BLOCK
    )
    :vars
    (
      ?auto_20098 - BLOCK
      ?auto_20099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20098 ?auto_20097 ) ( ON-TABLE ?auto_20094 ) ( ON ?auto_20095 ?auto_20094 ) ( ON ?auto_20096 ?auto_20095 ) ( ON ?auto_20097 ?auto_20096 ) ( not ( = ?auto_20094 ?auto_20095 ) ) ( not ( = ?auto_20094 ?auto_20096 ) ) ( not ( = ?auto_20094 ?auto_20097 ) ) ( not ( = ?auto_20094 ?auto_20098 ) ) ( not ( = ?auto_20095 ?auto_20096 ) ) ( not ( = ?auto_20095 ?auto_20097 ) ) ( not ( = ?auto_20095 ?auto_20098 ) ) ( not ( = ?auto_20096 ?auto_20097 ) ) ( not ( = ?auto_20096 ?auto_20098 ) ) ( not ( = ?auto_20097 ?auto_20098 ) ) ( not ( = ?auto_20094 ?auto_20099 ) ) ( not ( = ?auto_20095 ?auto_20099 ) ) ( not ( = ?auto_20096 ?auto_20099 ) ) ( not ( = ?auto_20097 ?auto_20099 ) ) ( not ( = ?auto_20098 ?auto_20099 ) ) ( ON ?auto_20099 ?auto_20098 ) ( CLEAR ?auto_20099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20094 ?auto_20095 ?auto_20096 ?auto_20097 ?auto_20098 )
      ( MAKE-4PILE ?auto_20094 ?auto_20095 ?auto_20096 ?auto_20097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20102 - BLOCK
      ?auto_20103 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20103 ) ( CLEAR ?auto_20102 ) ( ON-TABLE ?auto_20102 ) ( not ( = ?auto_20102 ?auto_20103 ) ) )
    :subtasks
    ( ( !STACK ?auto_20103 ?auto_20102 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20104 - BLOCK
      ?auto_20105 - BLOCK
    )
    :vars
    (
      ?auto_20106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20104 ) ( ON-TABLE ?auto_20104 ) ( not ( = ?auto_20104 ?auto_20105 ) ) ( ON ?auto_20105 ?auto_20106 ) ( CLEAR ?auto_20105 ) ( HAND-EMPTY ) ( not ( = ?auto_20104 ?auto_20106 ) ) ( not ( = ?auto_20105 ?auto_20106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20105 ?auto_20106 )
      ( MAKE-2PILE ?auto_20104 ?auto_20105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20107 - BLOCK
      ?auto_20108 - BLOCK
    )
    :vars
    (
      ?auto_20109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20107 ?auto_20108 ) ) ( ON ?auto_20108 ?auto_20109 ) ( CLEAR ?auto_20108 ) ( not ( = ?auto_20107 ?auto_20109 ) ) ( not ( = ?auto_20108 ?auto_20109 ) ) ( HOLDING ?auto_20107 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20107 )
      ( MAKE-2PILE ?auto_20107 ?auto_20108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20110 - BLOCK
      ?auto_20111 - BLOCK
    )
    :vars
    (
      ?auto_20112 - BLOCK
      ?auto_20114 - BLOCK
      ?auto_20115 - BLOCK
      ?auto_20113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20110 ?auto_20111 ) ) ( ON ?auto_20111 ?auto_20112 ) ( not ( = ?auto_20110 ?auto_20112 ) ) ( not ( = ?auto_20111 ?auto_20112 ) ) ( ON ?auto_20110 ?auto_20111 ) ( CLEAR ?auto_20110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20114 ) ( ON ?auto_20115 ?auto_20114 ) ( ON ?auto_20113 ?auto_20115 ) ( ON ?auto_20112 ?auto_20113 ) ( not ( = ?auto_20114 ?auto_20115 ) ) ( not ( = ?auto_20114 ?auto_20113 ) ) ( not ( = ?auto_20114 ?auto_20112 ) ) ( not ( = ?auto_20114 ?auto_20111 ) ) ( not ( = ?auto_20114 ?auto_20110 ) ) ( not ( = ?auto_20115 ?auto_20113 ) ) ( not ( = ?auto_20115 ?auto_20112 ) ) ( not ( = ?auto_20115 ?auto_20111 ) ) ( not ( = ?auto_20115 ?auto_20110 ) ) ( not ( = ?auto_20113 ?auto_20112 ) ) ( not ( = ?auto_20113 ?auto_20111 ) ) ( not ( = ?auto_20113 ?auto_20110 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20114 ?auto_20115 ?auto_20113 ?auto_20112 ?auto_20111 )
      ( MAKE-2PILE ?auto_20110 ?auto_20111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20119 - BLOCK
      ?auto_20120 - BLOCK
      ?auto_20121 - BLOCK
    )
    :vars
    (
      ?auto_20122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20122 ?auto_20121 ) ( CLEAR ?auto_20122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20119 ) ( ON ?auto_20120 ?auto_20119 ) ( ON ?auto_20121 ?auto_20120 ) ( not ( = ?auto_20119 ?auto_20120 ) ) ( not ( = ?auto_20119 ?auto_20121 ) ) ( not ( = ?auto_20119 ?auto_20122 ) ) ( not ( = ?auto_20120 ?auto_20121 ) ) ( not ( = ?auto_20120 ?auto_20122 ) ) ( not ( = ?auto_20121 ?auto_20122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20122 ?auto_20121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20123 - BLOCK
      ?auto_20124 - BLOCK
      ?auto_20125 - BLOCK
    )
    :vars
    (
      ?auto_20126 - BLOCK
      ?auto_20127 - BLOCK
      ?auto_20128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20126 ?auto_20125 ) ( CLEAR ?auto_20126 ) ( ON-TABLE ?auto_20123 ) ( ON ?auto_20124 ?auto_20123 ) ( ON ?auto_20125 ?auto_20124 ) ( not ( = ?auto_20123 ?auto_20124 ) ) ( not ( = ?auto_20123 ?auto_20125 ) ) ( not ( = ?auto_20123 ?auto_20126 ) ) ( not ( = ?auto_20124 ?auto_20125 ) ) ( not ( = ?auto_20124 ?auto_20126 ) ) ( not ( = ?auto_20125 ?auto_20126 ) ) ( HOLDING ?auto_20127 ) ( CLEAR ?auto_20128 ) ( not ( = ?auto_20123 ?auto_20127 ) ) ( not ( = ?auto_20123 ?auto_20128 ) ) ( not ( = ?auto_20124 ?auto_20127 ) ) ( not ( = ?auto_20124 ?auto_20128 ) ) ( not ( = ?auto_20125 ?auto_20127 ) ) ( not ( = ?auto_20125 ?auto_20128 ) ) ( not ( = ?auto_20126 ?auto_20127 ) ) ( not ( = ?auto_20126 ?auto_20128 ) ) ( not ( = ?auto_20127 ?auto_20128 ) ) )
    :subtasks
    ( ( !STACK ?auto_20127 ?auto_20128 )
      ( MAKE-3PILE ?auto_20123 ?auto_20124 ?auto_20125 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20129 - BLOCK
      ?auto_20130 - BLOCK
      ?auto_20131 - BLOCK
    )
    :vars
    (
      ?auto_20133 - BLOCK
      ?auto_20132 - BLOCK
      ?auto_20134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20133 ?auto_20131 ) ( ON-TABLE ?auto_20129 ) ( ON ?auto_20130 ?auto_20129 ) ( ON ?auto_20131 ?auto_20130 ) ( not ( = ?auto_20129 ?auto_20130 ) ) ( not ( = ?auto_20129 ?auto_20131 ) ) ( not ( = ?auto_20129 ?auto_20133 ) ) ( not ( = ?auto_20130 ?auto_20131 ) ) ( not ( = ?auto_20130 ?auto_20133 ) ) ( not ( = ?auto_20131 ?auto_20133 ) ) ( CLEAR ?auto_20132 ) ( not ( = ?auto_20129 ?auto_20134 ) ) ( not ( = ?auto_20129 ?auto_20132 ) ) ( not ( = ?auto_20130 ?auto_20134 ) ) ( not ( = ?auto_20130 ?auto_20132 ) ) ( not ( = ?auto_20131 ?auto_20134 ) ) ( not ( = ?auto_20131 ?auto_20132 ) ) ( not ( = ?auto_20133 ?auto_20134 ) ) ( not ( = ?auto_20133 ?auto_20132 ) ) ( not ( = ?auto_20134 ?auto_20132 ) ) ( ON ?auto_20134 ?auto_20133 ) ( CLEAR ?auto_20134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20129 ?auto_20130 ?auto_20131 ?auto_20133 )
      ( MAKE-3PILE ?auto_20129 ?auto_20130 ?auto_20131 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20135 - BLOCK
      ?auto_20136 - BLOCK
      ?auto_20137 - BLOCK
    )
    :vars
    (
      ?auto_20140 - BLOCK
      ?auto_20138 - BLOCK
      ?auto_20139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20140 ?auto_20137 ) ( ON-TABLE ?auto_20135 ) ( ON ?auto_20136 ?auto_20135 ) ( ON ?auto_20137 ?auto_20136 ) ( not ( = ?auto_20135 ?auto_20136 ) ) ( not ( = ?auto_20135 ?auto_20137 ) ) ( not ( = ?auto_20135 ?auto_20140 ) ) ( not ( = ?auto_20136 ?auto_20137 ) ) ( not ( = ?auto_20136 ?auto_20140 ) ) ( not ( = ?auto_20137 ?auto_20140 ) ) ( not ( = ?auto_20135 ?auto_20138 ) ) ( not ( = ?auto_20135 ?auto_20139 ) ) ( not ( = ?auto_20136 ?auto_20138 ) ) ( not ( = ?auto_20136 ?auto_20139 ) ) ( not ( = ?auto_20137 ?auto_20138 ) ) ( not ( = ?auto_20137 ?auto_20139 ) ) ( not ( = ?auto_20140 ?auto_20138 ) ) ( not ( = ?auto_20140 ?auto_20139 ) ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( ON ?auto_20138 ?auto_20140 ) ( CLEAR ?auto_20138 ) ( HOLDING ?auto_20139 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20139 )
      ( MAKE-3PILE ?auto_20135 ?auto_20136 ?auto_20137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20141 - BLOCK
      ?auto_20142 - BLOCK
      ?auto_20143 - BLOCK
    )
    :vars
    (
      ?auto_20144 - BLOCK
      ?auto_20146 - BLOCK
      ?auto_20145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20144 ?auto_20143 ) ( ON-TABLE ?auto_20141 ) ( ON ?auto_20142 ?auto_20141 ) ( ON ?auto_20143 ?auto_20142 ) ( not ( = ?auto_20141 ?auto_20142 ) ) ( not ( = ?auto_20141 ?auto_20143 ) ) ( not ( = ?auto_20141 ?auto_20144 ) ) ( not ( = ?auto_20142 ?auto_20143 ) ) ( not ( = ?auto_20142 ?auto_20144 ) ) ( not ( = ?auto_20143 ?auto_20144 ) ) ( not ( = ?auto_20141 ?auto_20146 ) ) ( not ( = ?auto_20141 ?auto_20145 ) ) ( not ( = ?auto_20142 ?auto_20146 ) ) ( not ( = ?auto_20142 ?auto_20145 ) ) ( not ( = ?auto_20143 ?auto_20146 ) ) ( not ( = ?auto_20143 ?auto_20145 ) ) ( not ( = ?auto_20144 ?auto_20146 ) ) ( not ( = ?auto_20144 ?auto_20145 ) ) ( not ( = ?auto_20146 ?auto_20145 ) ) ( ON ?auto_20146 ?auto_20144 ) ( ON ?auto_20145 ?auto_20146 ) ( CLEAR ?auto_20145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20141 ?auto_20142 ?auto_20143 ?auto_20144 ?auto_20146 )
      ( MAKE-3PILE ?auto_20141 ?auto_20142 ?auto_20143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20150 - BLOCK
      ?auto_20151 - BLOCK
      ?auto_20152 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20152 ) ( CLEAR ?auto_20151 ) ( ON-TABLE ?auto_20150 ) ( ON ?auto_20151 ?auto_20150 ) ( not ( = ?auto_20150 ?auto_20151 ) ) ( not ( = ?auto_20150 ?auto_20152 ) ) ( not ( = ?auto_20151 ?auto_20152 ) ) )
    :subtasks
    ( ( !STACK ?auto_20152 ?auto_20151 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20153 - BLOCK
      ?auto_20154 - BLOCK
      ?auto_20155 - BLOCK
    )
    :vars
    (
      ?auto_20156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20154 ) ( ON-TABLE ?auto_20153 ) ( ON ?auto_20154 ?auto_20153 ) ( not ( = ?auto_20153 ?auto_20154 ) ) ( not ( = ?auto_20153 ?auto_20155 ) ) ( not ( = ?auto_20154 ?auto_20155 ) ) ( ON ?auto_20155 ?auto_20156 ) ( CLEAR ?auto_20155 ) ( HAND-EMPTY ) ( not ( = ?auto_20153 ?auto_20156 ) ) ( not ( = ?auto_20154 ?auto_20156 ) ) ( not ( = ?auto_20155 ?auto_20156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20155 ?auto_20156 )
      ( MAKE-3PILE ?auto_20153 ?auto_20154 ?auto_20155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20157 - BLOCK
      ?auto_20158 - BLOCK
      ?auto_20159 - BLOCK
    )
    :vars
    (
      ?auto_20160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20157 ) ( not ( = ?auto_20157 ?auto_20158 ) ) ( not ( = ?auto_20157 ?auto_20159 ) ) ( not ( = ?auto_20158 ?auto_20159 ) ) ( ON ?auto_20159 ?auto_20160 ) ( CLEAR ?auto_20159 ) ( not ( = ?auto_20157 ?auto_20160 ) ) ( not ( = ?auto_20158 ?auto_20160 ) ) ( not ( = ?auto_20159 ?auto_20160 ) ) ( HOLDING ?auto_20158 ) ( CLEAR ?auto_20157 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20157 ?auto_20158 )
      ( MAKE-3PILE ?auto_20157 ?auto_20158 ?auto_20159 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20161 - BLOCK
      ?auto_20162 - BLOCK
      ?auto_20163 - BLOCK
    )
    :vars
    (
      ?auto_20164 - BLOCK
      ?auto_20165 - BLOCK
      ?auto_20166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20161 ) ( not ( = ?auto_20161 ?auto_20162 ) ) ( not ( = ?auto_20161 ?auto_20163 ) ) ( not ( = ?auto_20162 ?auto_20163 ) ) ( ON ?auto_20163 ?auto_20164 ) ( not ( = ?auto_20161 ?auto_20164 ) ) ( not ( = ?auto_20162 ?auto_20164 ) ) ( not ( = ?auto_20163 ?auto_20164 ) ) ( CLEAR ?auto_20161 ) ( ON ?auto_20162 ?auto_20163 ) ( CLEAR ?auto_20162 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20165 ) ( ON ?auto_20166 ?auto_20165 ) ( ON ?auto_20164 ?auto_20166 ) ( not ( = ?auto_20165 ?auto_20166 ) ) ( not ( = ?auto_20165 ?auto_20164 ) ) ( not ( = ?auto_20165 ?auto_20163 ) ) ( not ( = ?auto_20165 ?auto_20162 ) ) ( not ( = ?auto_20166 ?auto_20164 ) ) ( not ( = ?auto_20166 ?auto_20163 ) ) ( not ( = ?auto_20166 ?auto_20162 ) ) ( not ( = ?auto_20161 ?auto_20165 ) ) ( not ( = ?auto_20161 ?auto_20166 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20165 ?auto_20166 ?auto_20164 ?auto_20163 )
      ( MAKE-3PILE ?auto_20161 ?auto_20162 ?auto_20163 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20167 - BLOCK
      ?auto_20168 - BLOCK
      ?auto_20169 - BLOCK
    )
    :vars
    (
      ?auto_20170 - BLOCK
      ?auto_20172 - BLOCK
      ?auto_20171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20167 ?auto_20168 ) ) ( not ( = ?auto_20167 ?auto_20169 ) ) ( not ( = ?auto_20168 ?auto_20169 ) ) ( ON ?auto_20169 ?auto_20170 ) ( not ( = ?auto_20167 ?auto_20170 ) ) ( not ( = ?auto_20168 ?auto_20170 ) ) ( not ( = ?auto_20169 ?auto_20170 ) ) ( ON ?auto_20168 ?auto_20169 ) ( CLEAR ?auto_20168 ) ( ON-TABLE ?auto_20172 ) ( ON ?auto_20171 ?auto_20172 ) ( ON ?auto_20170 ?auto_20171 ) ( not ( = ?auto_20172 ?auto_20171 ) ) ( not ( = ?auto_20172 ?auto_20170 ) ) ( not ( = ?auto_20172 ?auto_20169 ) ) ( not ( = ?auto_20172 ?auto_20168 ) ) ( not ( = ?auto_20171 ?auto_20170 ) ) ( not ( = ?auto_20171 ?auto_20169 ) ) ( not ( = ?auto_20171 ?auto_20168 ) ) ( not ( = ?auto_20167 ?auto_20172 ) ) ( not ( = ?auto_20167 ?auto_20171 ) ) ( HOLDING ?auto_20167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20167 )
      ( MAKE-3PILE ?auto_20167 ?auto_20168 ?auto_20169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20173 - BLOCK
      ?auto_20174 - BLOCK
      ?auto_20175 - BLOCK
    )
    :vars
    (
      ?auto_20176 - BLOCK
      ?auto_20177 - BLOCK
      ?auto_20178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20173 ?auto_20174 ) ) ( not ( = ?auto_20173 ?auto_20175 ) ) ( not ( = ?auto_20174 ?auto_20175 ) ) ( ON ?auto_20175 ?auto_20176 ) ( not ( = ?auto_20173 ?auto_20176 ) ) ( not ( = ?auto_20174 ?auto_20176 ) ) ( not ( = ?auto_20175 ?auto_20176 ) ) ( ON ?auto_20174 ?auto_20175 ) ( ON-TABLE ?auto_20177 ) ( ON ?auto_20178 ?auto_20177 ) ( ON ?auto_20176 ?auto_20178 ) ( not ( = ?auto_20177 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20176 ) ) ( not ( = ?auto_20177 ?auto_20175 ) ) ( not ( = ?auto_20177 ?auto_20174 ) ) ( not ( = ?auto_20178 ?auto_20176 ) ) ( not ( = ?auto_20178 ?auto_20175 ) ) ( not ( = ?auto_20178 ?auto_20174 ) ) ( not ( = ?auto_20173 ?auto_20177 ) ) ( not ( = ?auto_20173 ?auto_20178 ) ) ( ON ?auto_20173 ?auto_20174 ) ( CLEAR ?auto_20173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20177 ?auto_20178 ?auto_20176 ?auto_20175 ?auto_20174 )
      ( MAKE-3PILE ?auto_20173 ?auto_20174 ?auto_20175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20181 - BLOCK
      ?auto_20182 - BLOCK
    )
    :vars
    (
      ?auto_20183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20183 ?auto_20182 ) ( CLEAR ?auto_20183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20181 ) ( ON ?auto_20182 ?auto_20181 ) ( not ( = ?auto_20181 ?auto_20182 ) ) ( not ( = ?auto_20181 ?auto_20183 ) ) ( not ( = ?auto_20182 ?auto_20183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20183 ?auto_20182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20184 - BLOCK
      ?auto_20185 - BLOCK
    )
    :vars
    (
      ?auto_20186 - BLOCK
      ?auto_20187 - BLOCK
      ?auto_20188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20186 ?auto_20185 ) ( CLEAR ?auto_20186 ) ( ON-TABLE ?auto_20184 ) ( ON ?auto_20185 ?auto_20184 ) ( not ( = ?auto_20184 ?auto_20185 ) ) ( not ( = ?auto_20184 ?auto_20186 ) ) ( not ( = ?auto_20185 ?auto_20186 ) ) ( HOLDING ?auto_20187 ) ( CLEAR ?auto_20188 ) ( not ( = ?auto_20184 ?auto_20187 ) ) ( not ( = ?auto_20184 ?auto_20188 ) ) ( not ( = ?auto_20185 ?auto_20187 ) ) ( not ( = ?auto_20185 ?auto_20188 ) ) ( not ( = ?auto_20186 ?auto_20187 ) ) ( not ( = ?auto_20186 ?auto_20188 ) ) ( not ( = ?auto_20187 ?auto_20188 ) ) )
    :subtasks
    ( ( !STACK ?auto_20187 ?auto_20188 )
      ( MAKE-2PILE ?auto_20184 ?auto_20185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20189 - BLOCK
      ?auto_20190 - BLOCK
    )
    :vars
    (
      ?auto_20191 - BLOCK
      ?auto_20193 - BLOCK
      ?auto_20192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20191 ?auto_20190 ) ( ON-TABLE ?auto_20189 ) ( ON ?auto_20190 ?auto_20189 ) ( not ( = ?auto_20189 ?auto_20190 ) ) ( not ( = ?auto_20189 ?auto_20191 ) ) ( not ( = ?auto_20190 ?auto_20191 ) ) ( CLEAR ?auto_20193 ) ( not ( = ?auto_20189 ?auto_20192 ) ) ( not ( = ?auto_20189 ?auto_20193 ) ) ( not ( = ?auto_20190 ?auto_20192 ) ) ( not ( = ?auto_20190 ?auto_20193 ) ) ( not ( = ?auto_20191 ?auto_20192 ) ) ( not ( = ?auto_20191 ?auto_20193 ) ) ( not ( = ?auto_20192 ?auto_20193 ) ) ( ON ?auto_20192 ?auto_20191 ) ( CLEAR ?auto_20192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20189 ?auto_20190 ?auto_20191 )
      ( MAKE-2PILE ?auto_20189 ?auto_20190 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20194 - BLOCK
      ?auto_20195 - BLOCK
    )
    :vars
    (
      ?auto_20196 - BLOCK
      ?auto_20197 - BLOCK
      ?auto_20198 - BLOCK
      ?auto_20199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20196 ?auto_20195 ) ( ON-TABLE ?auto_20194 ) ( ON ?auto_20195 ?auto_20194 ) ( not ( = ?auto_20194 ?auto_20195 ) ) ( not ( = ?auto_20194 ?auto_20196 ) ) ( not ( = ?auto_20195 ?auto_20196 ) ) ( not ( = ?auto_20194 ?auto_20197 ) ) ( not ( = ?auto_20194 ?auto_20198 ) ) ( not ( = ?auto_20195 ?auto_20197 ) ) ( not ( = ?auto_20195 ?auto_20198 ) ) ( not ( = ?auto_20196 ?auto_20197 ) ) ( not ( = ?auto_20196 ?auto_20198 ) ) ( not ( = ?auto_20197 ?auto_20198 ) ) ( ON ?auto_20197 ?auto_20196 ) ( CLEAR ?auto_20197 ) ( HOLDING ?auto_20198 ) ( CLEAR ?auto_20199 ) ( ON-TABLE ?auto_20199 ) ( not ( = ?auto_20199 ?auto_20198 ) ) ( not ( = ?auto_20194 ?auto_20199 ) ) ( not ( = ?auto_20195 ?auto_20199 ) ) ( not ( = ?auto_20196 ?auto_20199 ) ) ( not ( = ?auto_20197 ?auto_20199 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20199 ?auto_20198 )
      ( MAKE-2PILE ?auto_20194 ?auto_20195 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20200 - BLOCK
      ?auto_20201 - BLOCK
    )
    :vars
    (
      ?auto_20204 - BLOCK
      ?auto_20205 - BLOCK
      ?auto_20203 - BLOCK
      ?auto_20202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20204 ?auto_20201 ) ( ON-TABLE ?auto_20200 ) ( ON ?auto_20201 ?auto_20200 ) ( not ( = ?auto_20200 ?auto_20201 ) ) ( not ( = ?auto_20200 ?auto_20204 ) ) ( not ( = ?auto_20201 ?auto_20204 ) ) ( not ( = ?auto_20200 ?auto_20205 ) ) ( not ( = ?auto_20200 ?auto_20203 ) ) ( not ( = ?auto_20201 ?auto_20205 ) ) ( not ( = ?auto_20201 ?auto_20203 ) ) ( not ( = ?auto_20204 ?auto_20205 ) ) ( not ( = ?auto_20204 ?auto_20203 ) ) ( not ( = ?auto_20205 ?auto_20203 ) ) ( ON ?auto_20205 ?auto_20204 ) ( CLEAR ?auto_20202 ) ( ON-TABLE ?auto_20202 ) ( not ( = ?auto_20202 ?auto_20203 ) ) ( not ( = ?auto_20200 ?auto_20202 ) ) ( not ( = ?auto_20201 ?auto_20202 ) ) ( not ( = ?auto_20204 ?auto_20202 ) ) ( not ( = ?auto_20205 ?auto_20202 ) ) ( ON ?auto_20203 ?auto_20205 ) ( CLEAR ?auto_20203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20200 ?auto_20201 ?auto_20204 ?auto_20205 )
      ( MAKE-2PILE ?auto_20200 ?auto_20201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20206 - BLOCK
      ?auto_20207 - BLOCK
    )
    :vars
    (
      ?auto_20208 - BLOCK
      ?auto_20210 - BLOCK
      ?auto_20209 - BLOCK
      ?auto_20211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20208 ?auto_20207 ) ( ON-TABLE ?auto_20206 ) ( ON ?auto_20207 ?auto_20206 ) ( not ( = ?auto_20206 ?auto_20207 ) ) ( not ( = ?auto_20206 ?auto_20208 ) ) ( not ( = ?auto_20207 ?auto_20208 ) ) ( not ( = ?auto_20206 ?auto_20210 ) ) ( not ( = ?auto_20206 ?auto_20209 ) ) ( not ( = ?auto_20207 ?auto_20210 ) ) ( not ( = ?auto_20207 ?auto_20209 ) ) ( not ( = ?auto_20208 ?auto_20210 ) ) ( not ( = ?auto_20208 ?auto_20209 ) ) ( not ( = ?auto_20210 ?auto_20209 ) ) ( ON ?auto_20210 ?auto_20208 ) ( not ( = ?auto_20211 ?auto_20209 ) ) ( not ( = ?auto_20206 ?auto_20211 ) ) ( not ( = ?auto_20207 ?auto_20211 ) ) ( not ( = ?auto_20208 ?auto_20211 ) ) ( not ( = ?auto_20210 ?auto_20211 ) ) ( ON ?auto_20209 ?auto_20210 ) ( CLEAR ?auto_20209 ) ( HOLDING ?auto_20211 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20211 )
      ( MAKE-2PILE ?auto_20206 ?auto_20207 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20212 - BLOCK
      ?auto_20213 - BLOCK
    )
    :vars
    (
      ?auto_20215 - BLOCK
      ?auto_20217 - BLOCK
      ?auto_20214 - BLOCK
      ?auto_20216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20215 ?auto_20213 ) ( ON-TABLE ?auto_20212 ) ( ON ?auto_20213 ?auto_20212 ) ( not ( = ?auto_20212 ?auto_20213 ) ) ( not ( = ?auto_20212 ?auto_20215 ) ) ( not ( = ?auto_20213 ?auto_20215 ) ) ( not ( = ?auto_20212 ?auto_20217 ) ) ( not ( = ?auto_20212 ?auto_20214 ) ) ( not ( = ?auto_20213 ?auto_20217 ) ) ( not ( = ?auto_20213 ?auto_20214 ) ) ( not ( = ?auto_20215 ?auto_20217 ) ) ( not ( = ?auto_20215 ?auto_20214 ) ) ( not ( = ?auto_20217 ?auto_20214 ) ) ( ON ?auto_20217 ?auto_20215 ) ( not ( = ?auto_20216 ?auto_20214 ) ) ( not ( = ?auto_20212 ?auto_20216 ) ) ( not ( = ?auto_20213 ?auto_20216 ) ) ( not ( = ?auto_20215 ?auto_20216 ) ) ( not ( = ?auto_20217 ?auto_20216 ) ) ( ON ?auto_20214 ?auto_20217 ) ( ON ?auto_20216 ?auto_20214 ) ( CLEAR ?auto_20216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20212 ?auto_20213 ?auto_20215 ?auto_20217 ?auto_20214 )
      ( MAKE-2PILE ?auto_20212 ?auto_20213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20222 - BLOCK
      ?auto_20223 - BLOCK
      ?auto_20224 - BLOCK
      ?auto_20225 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20225 ) ( CLEAR ?auto_20224 ) ( ON-TABLE ?auto_20222 ) ( ON ?auto_20223 ?auto_20222 ) ( ON ?auto_20224 ?auto_20223 ) ( not ( = ?auto_20222 ?auto_20223 ) ) ( not ( = ?auto_20222 ?auto_20224 ) ) ( not ( = ?auto_20222 ?auto_20225 ) ) ( not ( = ?auto_20223 ?auto_20224 ) ) ( not ( = ?auto_20223 ?auto_20225 ) ) ( not ( = ?auto_20224 ?auto_20225 ) ) )
    :subtasks
    ( ( !STACK ?auto_20225 ?auto_20224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20226 - BLOCK
      ?auto_20227 - BLOCK
      ?auto_20228 - BLOCK
      ?auto_20229 - BLOCK
    )
    :vars
    (
      ?auto_20230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20228 ) ( ON-TABLE ?auto_20226 ) ( ON ?auto_20227 ?auto_20226 ) ( ON ?auto_20228 ?auto_20227 ) ( not ( = ?auto_20226 ?auto_20227 ) ) ( not ( = ?auto_20226 ?auto_20228 ) ) ( not ( = ?auto_20226 ?auto_20229 ) ) ( not ( = ?auto_20227 ?auto_20228 ) ) ( not ( = ?auto_20227 ?auto_20229 ) ) ( not ( = ?auto_20228 ?auto_20229 ) ) ( ON ?auto_20229 ?auto_20230 ) ( CLEAR ?auto_20229 ) ( HAND-EMPTY ) ( not ( = ?auto_20226 ?auto_20230 ) ) ( not ( = ?auto_20227 ?auto_20230 ) ) ( not ( = ?auto_20228 ?auto_20230 ) ) ( not ( = ?auto_20229 ?auto_20230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20229 ?auto_20230 )
      ( MAKE-4PILE ?auto_20226 ?auto_20227 ?auto_20228 ?auto_20229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20231 - BLOCK
      ?auto_20232 - BLOCK
      ?auto_20233 - BLOCK
      ?auto_20234 - BLOCK
    )
    :vars
    (
      ?auto_20235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20231 ) ( ON ?auto_20232 ?auto_20231 ) ( not ( = ?auto_20231 ?auto_20232 ) ) ( not ( = ?auto_20231 ?auto_20233 ) ) ( not ( = ?auto_20231 ?auto_20234 ) ) ( not ( = ?auto_20232 ?auto_20233 ) ) ( not ( = ?auto_20232 ?auto_20234 ) ) ( not ( = ?auto_20233 ?auto_20234 ) ) ( ON ?auto_20234 ?auto_20235 ) ( CLEAR ?auto_20234 ) ( not ( = ?auto_20231 ?auto_20235 ) ) ( not ( = ?auto_20232 ?auto_20235 ) ) ( not ( = ?auto_20233 ?auto_20235 ) ) ( not ( = ?auto_20234 ?auto_20235 ) ) ( HOLDING ?auto_20233 ) ( CLEAR ?auto_20232 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20231 ?auto_20232 ?auto_20233 )
      ( MAKE-4PILE ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20234 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20236 - BLOCK
      ?auto_20237 - BLOCK
      ?auto_20238 - BLOCK
      ?auto_20239 - BLOCK
    )
    :vars
    (
      ?auto_20240 - BLOCK
      ?auto_20241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20236 ) ( ON ?auto_20237 ?auto_20236 ) ( not ( = ?auto_20236 ?auto_20237 ) ) ( not ( = ?auto_20236 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20239 ) ) ( not ( = ?auto_20237 ?auto_20238 ) ) ( not ( = ?auto_20237 ?auto_20239 ) ) ( not ( = ?auto_20238 ?auto_20239 ) ) ( ON ?auto_20239 ?auto_20240 ) ( not ( = ?auto_20236 ?auto_20240 ) ) ( not ( = ?auto_20237 ?auto_20240 ) ) ( not ( = ?auto_20238 ?auto_20240 ) ) ( not ( = ?auto_20239 ?auto_20240 ) ) ( CLEAR ?auto_20237 ) ( ON ?auto_20238 ?auto_20239 ) ( CLEAR ?auto_20238 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20241 ) ( ON ?auto_20240 ?auto_20241 ) ( not ( = ?auto_20241 ?auto_20240 ) ) ( not ( = ?auto_20241 ?auto_20239 ) ) ( not ( = ?auto_20241 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20241 ) ) ( not ( = ?auto_20237 ?auto_20241 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20241 ?auto_20240 ?auto_20239 )
      ( MAKE-4PILE ?auto_20236 ?auto_20237 ?auto_20238 ?auto_20239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20242 - BLOCK
      ?auto_20243 - BLOCK
      ?auto_20244 - BLOCK
      ?auto_20245 - BLOCK
    )
    :vars
    (
      ?auto_20247 - BLOCK
      ?auto_20246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20242 ) ( not ( = ?auto_20242 ?auto_20243 ) ) ( not ( = ?auto_20242 ?auto_20244 ) ) ( not ( = ?auto_20242 ?auto_20245 ) ) ( not ( = ?auto_20243 ?auto_20244 ) ) ( not ( = ?auto_20243 ?auto_20245 ) ) ( not ( = ?auto_20244 ?auto_20245 ) ) ( ON ?auto_20245 ?auto_20247 ) ( not ( = ?auto_20242 ?auto_20247 ) ) ( not ( = ?auto_20243 ?auto_20247 ) ) ( not ( = ?auto_20244 ?auto_20247 ) ) ( not ( = ?auto_20245 ?auto_20247 ) ) ( ON ?auto_20244 ?auto_20245 ) ( CLEAR ?auto_20244 ) ( ON-TABLE ?auto_20246 ) ( ON ?auto_20247 ?auto_20246 ) ( not ( = ?auto_20246 ?auto_20247 ) ) ( not ( = ?auto_20246 ?auto_20245 ) ) ( not ( = ?auto_20246 ?auto_20244 ) ) ( not ( = ?auto_20242 ?auto_20246 ) ) ( not ( = ?auto_20243 ?auto_20246 ) ) ( HOLDING ?auto_20243 ) ( CLEAR ?auto_20242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20242 ?auto_20243 )
      ( MAKE-4PILE ?auto_20242 ?auto_20243 ?auto_20244 ?auto_20245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20248 - BLOCK
      ?auto_20249 - BLOCK
      ?auto_20250 - BLOCK
      ?auto_20251 - BLOCK
    )
    :vars
    (
      ?auto_20253 - BLOCK
      ?auto_20252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20248 ) ( not ( = ?auto_20248 ?auto_20249 ) ) ( not ( = ?auto_20248 ?auto_20250 ) ) ( not ( = ?auto_20248 ?auto_20251 ) ) ( not ( = ?auto_20249 ?auto_20250 ) ) ( not ( = ?auto_20249 ?auto_20251 ) ) ( not ( = ?auto_20250 ?auto_20251 ) ) ( ON ?auto_20251 ?auto_20253 ) ( not ( = ?auto_20248 ?auto_20253 ) ) ( not ( = ?auto_20249 ?auto_20253 ) ) ( not ( = ?auto_20250 ?auto_20253 ) ) ( not ( = ?auto_20251 ?auto_20253 ) ) ( ON ?auto_20250 ?auto_20251 ) ( ON-TABLE ?auto_20252 ) ( ON ?auto_20253 ?auto_20252 ) ( not ( = ?auto_20252 ?auto_20253 ) ) ( not ( = ?auto_20252 ?auto_20251 ) ) ( not ( = ?auto_20252 ?auto_20250 ) ) ( not ( = ?auto_20248 ?auto_20252 ) ) ( not ( = ?auto_20249 ?auto_20252 ) ) ( CLEAR ?auto_20248 ) ( ON ?auto_20249 ?auto_20250 ) ( CLEAR ?auto_20249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20252 ?auto_20253 ?auto_20251 ?auto_20250 )
      ( MAKE-4PILE ?auto_20248 ?auto_20249 ?auto_20250 ?auto_20251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20254 - BLOCK
      ?auto_20255 - BLOCK
      ?auto_20256 - BLOCK
      ?auto_20257 - BLOCK
    )
    :vars
    (
      ?auto_20259 - BLOCK
      ?auto_20258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20254 ?auto_20255 ) ) ( not ( = ?auto_20254 ?auto_20256 ) ) ( not ( = ?auto_20254 ?auto_20257 ) ) ( not ( = ?auto_20255 ?auto_20256 ) ) ( not ( = ?auto_20255 ?auto_20257 ) ) ( not ( = ?auto_20256 ?auto_20257 ) ) ( ON ?auto_20257 ?auto_20259 ) ( not ( = ?auto_20254 ?auto_20259 ) ) ( not ( = ?auto_20255 ?auto_20259 ) ) ( not ( = ?auto_20256 ?auto_20259 ) ) ( not ( = ?auto_20257 ?auto_20259 ) ) ( ON ?auto_20256 ?auto_20257 ) ( ON-TABLE ?auto_20258 ) ( ON ?auto_20259 ?auto_20258 ) ( not ( = ?auto_20258 ?auto_20259 ) ) ( not ( = ?auto_20258 ?auto_20257 ) ) ( not ( = ?auto_20258 ?auto_20256 ) ) ( not ( = ?auto_20254 ?auto_20258 ) ) ( not ( = ?auto_20255 ?auto_20258 ) ) ( ON ?auto_20255 ?auto_20256 ) ( CLEAR ?auto_20255 ) ( HOLDING ?auto_20254 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20254 )
      ( MAKE-4PILE ?auto_20254 ?auto_20255 ?auto_20256 ?auto_20257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20260 - BLOCK
      ?auto_20261 - BLOCK
      ?auto_20262 - BLOCK
      ?auto_20263 - BLOCK
    )
    :vars
    (
      ?auto_20265 - BLOCK
      ?auto_20264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20260 ?auto_20261 ) ) ( not ( = ?auto_20260 ?auto_20262 ) ) ( not ( = ?auto_20260 ?auto_20263 ) ) ( not ( = ?auto_20261 ?auto_20262 ) ) ( not ( = ?auto_20261 ?auto_20263 ) ) ( not ( = ?auto_20262 ?auto_20263 ) ) ( ON ?auto_20263 ?auto_20265 ) ( not ( = ?auto_20260 ?auto_20265 ) ) ( not ( = ?auto_20261 ?auto_20265 ) ) ( not ( = ?auto_20262 ?auto_20265 ) ) ( not ( = ?auto_20263 ?auto_20265 ) ) ( ON ?auto_20262 ?auto_20263 ) ( ON-TABLE ?auto_20264 ) ( ON ?auto_20265 ?auto_20264 ) ( not ( = ?auto_20264 ?auto_20265 ) ) ( not ( = ?auto_20264 ?auto_20263 ) ) ( not ( = ?auto_20264 ?auto_20262 ) ) ( not ( = ?auto_20260 ?auto_20264 ) ) ( not ( = ?auto_20261 ?auto_20264 ) ) ( ON ?auto_20261 ?auto_20262 ) ( ON ?auto_20260 ?auto_20261 ) ( CLEAR ?auto_20260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20264 ?auto_20265 ?auto_20263 ?auto_20262 ?auto_20261 )
      ( MAKE-4PILE ?auto_20260 ?auto_20261 ?auto_20262 ?auto_20263 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20267 - BLOCK
    )
    :vars
    (
      ?auto_20268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20268 ?auto_20267 ) ( CLEAR ?auto_20268 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20267 ) ( not ( = ?auto_20267 ?auto_20268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20268 ?auto_20267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20269 - BLOCK
    )
    :vars
    (
      ?auto_20270 - BLOCK
      ?auto_20271 - BLOCK
      ?auto_20272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20270 ?auto_20269 ) ( CLEAR ?auto_20270 ) ( ON-TABLE ?auto_20269 ) ( not ( = ?auto_20269 ?auto_20270 ) ) ( HOLDING ?auto_20271 ) ( CLEAR ?auto_20272 ) ( not ( = ?auto_20269 ?auto_20271 ) ) ( not ( = ?auto_20269 ?auto_20272 ) ) ( not ( = ?auto_20270 ?auto_20271 ) ) ( not ( = ?auto_20270 ?auto_20272 ) ) ( not ( = ?auto_20271 ?auto_20272 ) ) )
    :subtasks
    ( ( !STACK ?auto_20271 ?auto_20272 )
      ( MAKE-1PILE ?auto_20269 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20273 - BLOCK
    )
    :vars
    (
      ?auto_20275 - BLOCK
      ?auto_20274 - BLOCK
      ?auto_20276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20275 ?auto_20273 ) ( ON-TABLE ?auto_20273 ) ( not ( = ?auto_20273 ?auto_20275 ) ) ( CLEAR ?auto_20274 ) ( not ( = ?auto_20273 ?auto_20276 ) ) ( not ( = ?auto_20273 ?auto_20274 ) ) ( not ( = ?auto_20275 ?auto_20276 ) ) ( not ( = ?auto_20275 ?auto_20274 ) ) ( not ( = ?auto_20276 ?auto_20274 ) ) ( ON ?auto_20276 ?auto_20275 ) ( CLEAR ?auto_20276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20273 ?auto_20275 )
      ( MAKE-1PILE ?auto_20273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20277 - BLOCK
    )
    :vars
    (
      ?auto_20279 - BLOCK
      ?auto_20280 - BLOCK
      ?auto_20278 - BLOCK
      ?auto_20282 - BLOCK
      ?auto_20281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20279 ?auto_20277 ) ( ON-TABLE ?auto_20277 ) ( not ( = ?auto_20277 ?auto_20279 ) ) ( not ( = ?auto_20277 ?auto_20280 ) ) ( not ( = ?auto_20277 ?auto_20278 ) ) ( not ( = ?auto_20279 ?auto_20280 ) ) ( not ( = ?auto_20279 ?auto_20278 ) ) ( not ( = ?auto_20280 ?auto_20278 ) ) ( ON ?auto_20280 ?auto_20279 ) ( CLEAR ?auto_20280 ) ( HOLDING ?auto_20278 ) ( CLEAR ?auto_20282 ) ( ON-TABLE ?auto_20281 ) ( ON ?auto_20282 ?auto_20281 ) ( not ( = ?auto_20281 ?auto_20282 ) ) ( not ( = ?auto_20281 ?auto_20278 ) ) ( not ( = ?auto_20282 ?auto_20278 ) ) ( not ( = ?auto_20277 ?auto_20282 ) ) ( not ( = ?auto_20277 ?auto_20281 ) ) ( not ( = ?auto_20279 ?auto_20282 ) ) ( not ( = ?auto_20279 ?auto_20281 ) ) ( not ( = ?auto_20280 ?auto_20282 ) ) ( not ( = ?auto_20280 ?auto_20281 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20281 ?auto_20282 ?auto_20278 )
      ( MAKE-1PILE ?auto_20277 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20283 - BLOCK
    )
    :vars
    (
      ?auto_20288 - BLOCK
      ?auto_20284 - BLOCK
      ?auto_20287 - BLOCK
      ?auto_20286 - BLOCK
      ?auto_20285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20288 ?auto_20283 ) ( ON-TABLE ?auto_20283 ) ( not ( = ?auto_20283 ?auto_20288 ) ) ( not ( = ?auto_20283 ?auto_20284 ) ) ( not ( = ?auto_20283 ?auto_20287 ) ) ( not ( = ?auto_20288 ?auto_20284 ) ) ( not ( = ?auto_20288 ?auto_20287 ) ) ( not ( = ?auto_20284 ?auto_20287 ) ) ( ON ?auto_20284 ?auto_20288 ) ( CLEAR ?auto_20286 ) ( ON-TABLE ?auto_20285 ) ( ON ?auto_20286 ?auto_20285 ) ( not ( = ?auto_20285 ?auto_20286 ) ) ( not ( = ?auto_20285 ?auto_20287 ) ) ( not ( = ?auto_20286 ?auto_20287 ) ) ( not ( = ?auto_20283 ?auto_20286 ) ) ( not ( = ?auto_20283 ?auto_20285 ) ) ( not ( = ?auto_20288 ?auto_20286 ) ) ( not ( = ?auto_20288 ?auto_20285 ) ) ( not ( = ?auto_20284 ?auto_20286 ) ) ( not ( = ?auto_20284 ?auto_20285 ) ) ( ON ?auto_20287 ?auto_20284 ) ( CLEAR ?auto_20287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20283 ?auto_20288 ?auto_20284 )
      ( MAKE-1PILE ?auto_20283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20289 - BLOCK
    )
    :vars
    (
      ?auto_20290 - BLOCK
      ?auto_20294 - BLOCK
      ?auto_20291 - BLOCK
      ?auto_20293 - BLOCK
      ?auto_20292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20290 ?auto_20289 ) ( ON-TABLE ?auto_20289 ) ( not ( = ?auto_20289 ?auto_20290 ) ) ( not ( = ?auto_20289 ?auto_20294 ) ) ( not ( = ?auto_20289 ?auto_20291 ) ) ( not ( = ?auto_20290 ?auto_20294 ) ) ( not ( = ?auto_20290 ?auto_20291 ) ) ( not ( = ?auto_20294 ?auto_20291 ) ) ( ON ?auto_20294 ?auto_20290 ) ( ON-TABLE ?auto_20293 ) ( not ( = ?auto_20293 ?auto_20292 ) ) ( not ( = ?auto_20293 ?auto_20291 ) ) ( not ( = ?auto_20292 ?auto_20291 ) ) ( not ( = ?auto_20289 ?auto_20292 ) ) ( not ( = ?auto_20289 ?auto_20293 ) ) ( not ( = ?auto_20290 ?auto_20292 ) ) ( not ( = ?auto_20290 ?auto_20293 ) ) ( not ( = ?auto_20294 ?auto_20292 ) ) ( not ( = ?auto_20294 ?auto_20293 ) ) ( ON ?auto_20291 ?auto_20294 ) ( CLEAR ?auto_20291 ) ( HOLDING ?auto_20292 ) ( CLEAR ?auto_20293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20293 ?auto_20292 )
      ( MAKE-1PILE ?auto_20289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20295 - BLOCK
    )
    :vars
    (
      ?auto_20296 - BLOCK
      ?auto_20299 - BLOCK
      ?auto_20297 - BLOCK
      ?auto_20298 - BLOCK
      ?auto_20300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20296 ?auto_20295 ) ( ON-TABLE ?auto_20295 ) ( not ( = ?auto_20295 ?auto_20296 ) ) ( not ( = ?auto_20295 ?auto_20299 ) ) ( not ( = ?auto_20295 ?auto_20297 ) ) ( not ( = ?auto_20296 ?auto_20299 ) ) ( not ( = ?auto_20296 ?auto_20297 ) ) ( not ( = ?auto_20299 ?auto_20297 ) ) ( ON ?auto_20299 ?auto_20296 ) ( ON-TABLE ?auto_20298 ) ( not ( = ?auto_20298 ?auto_20300 ) ) ( not ( = ?auto_20298 ?auto_20297 ) ) ( not ( = ?auto_20300 ?auto_20297 ) ) ( not ( = ?auto_20295 ?auto_20300 ) ) ( not ( = ?auto_20295 ?auto_20298 ) ) ( not ( = ?auto_20296 ?auto_20300 ) ) ( not ( = ?auto_20296 ?auto_20298 ) ) ( not ( = ?auto_20299 ?auto_20300 ) ) ( not ( = ?auto_20299 ?auto_20298 ) ) ( ON ?auto_20297 ?auto_20299 ) ( CLEAR ?auto_20298 ) ( ON ?auto_20300 ?auto_20297 ) ( CLEAR ?auto_20300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20295 ?auto_20296 ?auto_20299 ?auto_20297 )
      ( MAKE-1PILE ?auto_20295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20301 - BLOCK
    )
    :vars
    (
      ?auto_20304 - BLOCK
      ?auto_20303 - BLOCK
      ?auto_20302 - BLOCK
      ?auto_20305 - BLOCK
      ?auto_20306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20304 ?auto_20301 ) ( ON-TABLE ?auto_20301 ) ( not ( = ?auto_20301 ?auto_20304 ) ) ( not ( = ?auto_20301 ?auto_20303 ) ) ( not ( = ?auto_20301 ?auto_20302 ) ) ( not ( = ?auto_20304 ?auto_20303 ) ) ( not ( = ?auto_20304 ?auto_20302 ) ) ( not ( = ?auto_20303 ?auto_20302 ) ) ( ON ?auto_20303 ?auto_20304 ) ( not ( = ?auto_20305 ?auto_20306 ) ) ( not ( = ?auto_20305 ?auto_20302 ) ) ( not ( = ?auto_20306 ?auto_20302 ) ) ( not ( = ?auto_20301 ?auto_20306 ) ) ( not ( = ?auto_20301 ?auto_20305 ) ) ( not ( = ?auto_20304 ?auto_20306 ) ) ( not ( = ?auto_20304 ?auto_20305 ) ) ( not ( = ?auto_20303 ?auto_20306 ) ) ( not ( = ?auto_20303 ?auto_20305 ) ) ( ON ?auto_20302 ?auto_20303 ) ( ON ?auto_20306 ?auto_20302 ) ( CLEAR ?auto_20306 ) ( HOLDING ?auto_20305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20305 )
      ( MAKE-1PILE ?auto_20301 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20307 - BLOCK
    )
    :vars
    (
      ?auto_20309 - BLOCK
      ?auto_20310 - BLOCK
      ?auto_20308 - BLOCK
      ?auto_20311 - BLOCK
      ?auto_20312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20309 ?auto_20307 ) ( ON-TABLE ?auto_20307 ) ( not ( = ?auto_20307 ?auto_20309 ) ) ( not ( = ?auto_20307 ?auto_20310 ) ) ( not ( = ?auto_20307 ?auto_20308 ) ) ( not ( = ?auto_20309 ?auto_20310 ) ) ( not ( = ?auto_20309 ?auto_20308 ) ) ( not ( = ?auto_20310 ?auto_20308 ) ) ( ON ?auto_20310 ?auto_20309 ) ( not ( = ?auto_20311 ?auto_20312 ) ) ( not ( = ?auto_20311 ?auto_20308 ) ) ( not ( = ?auto_20312 ?auto_20308 ) ) ( not ( = ?auto_20307 ?auto_20312 ) ) ( not ( = ?auto_20307 ?auto_20311 ) ) ( not ( = ?auto_20309 ?auto_20312 ) ) ( not ( = ?auto_20309 ?auto_20311 ) ) ( not ( = ?auto_20310 ?auto_20312 ) ) ( not ( = ?auto_20310 ?auto_20311 ) ) ( ON ?auto_20308 ?auto_20310 ) ( ON ?auto_20312 ?auto_20308 ) ( ON ?auto_20311 ?auto_20312 ) ( CLEAR ?auto_20311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20307 ?auto_20309 ?auto_20310 ?auto_20308 ?auto_20312 )
      ( MAKE-1PILE ?auto_20307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20318 - BLOCK
      ?auto_20319 - BLOCK
      ?auto_20320 - BLOCK
      ?auto_20321 - BLOCK
      ?auto_20322 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20322 ) ( CLEAR ?auto_20321 ) ( ON-TABLE ?auto_20318 ) ( ON ?auto_20319 ?auto_20318 ) ( ON ?auto_20320 ?auto_20319 ) ( ON ?auto_20321 ?auto_20320 ) ( not ( = ?auto_20318 ?auto_20319 ) ) ( not ( = ?auto_20318 ?auto_20320 ) ) ( not ( = ?auto_20318 ?auto_20321 ) ) ( not ( = ?auto_20318 ?auto_20322 ) ) ( not ( = ?auto_20319 ?auto_20320 ) ) ( not ( = ?auto_20319 ?auto_20321 ) ) ( not ( = ?auto_20319 ?auto_20322 ) ) ( not ( = ?auto_20320 ?auto_20321 ) ) ( not ( = ?auto_20320 ?auto_20322 ) ) ( not ( = ?auto_20321 ?auto_20322 ) ) )
    :subtasks
    ( ( !STACK ?auto_20322 ?auto_20321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20323 - BLOCK
      ?auto_20324 - BLOCK
      ?auto_20325 - BLOCK
      ?auto_20326 - BLOCK
      ?auto_20327 - BLOCK
    )
    :vars
    (
      ?auto_20328 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20326 ) ( ON-TABLE ?auto_20323 ) ( ON ?auto_20324 ?auto_20323 ) ( ON ?auto_20325 ?auto_20324 ) ( ON ?auto_20326 ?auto_20325 ) ( not ( = ?auto_20323 ?auto_20324 ) ) ( not ( = ?auto_20323 ?auto_20325 ) ) ( not ( = ?auto_20323 ?auto_20326 ) ) ( not ( = ?auto_20323 ?auto_20327 ) ) ( not ( = ?auto_20324 ?auto_20325 ) ) ( not ( = ?auto_20324 ?auto_20326 ) ) ( not ( = ?auto_20324 ?auto_20327 ) ) ( not ( = ?auto_20325 ?auto_20326 ) ) ( not ( = ?auto_20325 ?auto_20327 ) ) ( not ( = ?auto_20326 ?auto_20327 ) ) ( ON ?auto_20327 ?auto_20328 ) ( CLEAR ?auto_20327 ) ( HAND-EMPTY ) ( not ( = ?auto_20323 ?auto_20328 ) ) ( not ( = ?auto_20324 ?auto_20328 ) ) ( not ( = ?auto_20325 ?auto_20328 ) ) ( not ( = ?auto_20326 ?auto_20328 ) ) ( not ( = ?auto_20327 ?auto_20328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20327 ?auto_20328 )
      ( MAKE-5PILE ?auto_20323 ?auto_20324 ?auto_20325 ?auto_20326 ?auto_20327 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20329 - BLOCK
      ?auto_20330 - BLOCK
      ?auto_20331 - BLOCK
      ?auto_20332 - BLOCK
      ?auto_20333 - BLOCK
    )
    :vars
    (
      ?auto_20334 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20329 ) ( ON ?auto_20330 ?auto_20329 ) ( ON ?auto_20331 ?auto_20330 ) ( not ( = ?auto_20329 ?auto_20330 ) ) ( not ( = ?auto_20329 ?auto_20331 ) ) ( not ( = ?auto_20329 ?auto_20332 ) ) ( not ( = ?auto_20329 ?auto_20333 ) ) ( not ( = ?auto_20330 ?auto_20331 ) ) ( not ( = ?auto_20330 ?auto_20332 ) ) ( not ( = ?auto_20330 ?auto_20333 ) ) ( not ( = ?auto_20331 ?auto_20332 ) ) ( not ( = ?auto_20331 ?auto_20333 ) ) ( not ( = ?auto_20332 ?auto_20333 ) ) ( ON ?auto_20333 ?auto_20334 ) ( CLEAR ?auto_20333 ) ( not ( = ?auto_20329 ?auto_20334 ) ) ( not ( = ?auto_20330 ?auto_20334 ) ) ( not ( = ?auto_20331 ?auto_20334 ) ) ( not ( = ?auto_20332 ?auto_20334 ) ) ( not ( = ?auto_20333 ?auto_20334 ) ) ( HOLDING ?auto_20332 ) ( CLEAR ?auto_20331 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20329 ?auto_20330 ?auto_20331 ?auto_20332 )
      ( MAKE-5PILE ?auto_20329 ?auto_20330 ?auto_20331 ?auto_20332 ?auto_20333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20335 - BLOCK
      ?auto_20336 - BLOCK
      ?auto_20337 - BLOCK
      ?auto_20338 - BLOCK
      ?auto_20339 - BLOCK
    )
    :vars
    (
      ?auto_20340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20335 ) ( ON ?auto_20336 ?auto_20335 ) ( ON ?auto_20337 ?auto_20336 ) ( not ( = ?auto_20335 ?auto_20336 ) ) ( not ( = ?auto_20335 ?auto_20337 ) ) ( not ( = ?auto_20335 ?auto_20338 ) ) ( not ( = ?auto_20335 ?auto_20339 ) ) ( not ( = ?auto_20336 ?auto_20337 ) ) ( not ( = ?auto_20336 ?auto_20338 ) ) ( not ( = ?auto_20336 ?auto_20339 ) ) ( not ( = ?auto_20337 ?auto_20338 ) ) ( not ( = ?auto_20337 ?auto_20339 ) ) ( not ( = ?auto_20338 ?auto_20339 ) ) ( ON ?auto_20339 ?auto_20340 ) ( not ( = ?auto_20335 ?auto_20340 ) ) ( not ( = ?auto_20336 ?auto_20340 ) ) ( not ( = ?auto_20337 ?auto_20340 ) ) ( not ( = ?auto_20338 ?auto_20340 ) ) ( not ( = ?auto_20339 ?auto_20340 ) ) ( CLEAR ?auto_20337 ) ( ON ?auto_20338 ?auto_20339 ) ( CLEAR ?auto_20338 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20340 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20340 ?auto_20339 )
      ( MAKE-5PILE ?auto_20335 ?auto_20336 ?auto_20337 ?auto_20338 ?auto_20339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20341 - BLOCK
      ?auto_20342 - BLOCK
      ?auto_20343 - BLOCK
      ?auto_20344 - BLOCK
      ?auto_20345 - BLOCK
    )
    :vars
    (
      ?auto_20346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20341 ) ( ON ?auto_20342 ?auto_20341 ) ( not ( = ?auto_20341 ?auto_20342 ) ) ( not ( = ?auto_20341 ?auto_20343 ) ) ( not ( = ?auto_20341 ?auto_20344 ) ) ( not ( = ?auto_20341 ?auto_20345 ) ) ( not ( = ?auto_20342 ?auto_20343 ) ) ( not ( = ?auto_20342 ?auto_20344 ) ) ( not ( = ?auto_20342 ?auto_20345 ) ) ( not ( = ?auto_20343 ?auto_20344 ) ) ( not ( = ?auto_20343 ?auto_20345 ) ) ( not ( = ?auto_20344 ?auto_20345 ) ) ( ON ?auto_20345 ?auto_20346 ) ( not ( = ?auto_20341 ?auto_20346 ) ) ( not ( = ?auto_20342 ?auto_20346 ) ) ( not ( = ?auto_20343 ?auto_20346 ) ) ( not ( = ?auto_20344 ?auto_20346 ) ) ( not ( = ?auto_20345 ?auto_20346 ) ) ( ON ?auto_20344 ?auto_20345 ) ( CLEAR ?auto_20344 ) ( ON-TABLE ?auto_20346 ) ( HOLDING ?auto_20343 ) ( CLEAR ?auto_20342 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20341 ?auto_20342 ?auto_20343 )
      ( MAKE-5PILE ?auto_20341 ?auto_20342 ?auto_20343 ?auto_20344 ?auto_20345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20347 - BLOCK
      ?auto_20348 - BLOCK
      ?auto_20349 - BLOCK
      ?auto_20350 - BLOCK
      ?auto_20351 - BLOCK
    )
    :vars
    (
      ?auto_20352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20347 ) ( ON ?auto_20348 ?auto_20347 ) ( not ( = ?auto_20347 ?auto_20348 ) ) ( not ( = ?auto_20347 ?auto_20349 ) ) ( not ( = ?auto_20347 ?auto_20350 ) ) ( not ( = ?auto_20347 ?auto_20351 ) ) ( not ( = ?auto_20348 ?auto_20349 ) ) ( not ( = ?auto_20348 ?auto_20350 ) ) ( not ( = ?auto_20348 ?auto_20351 ) ) ( not ( = ?auto_20349 ?auto_20350 ) ) ( not ( = ?auto_20349 ?auto_20351 ) ) ( not ( = ?auto_20350 ?auto_20351 ) ) ( ON ?auto_20351 ?auto_20352 ) ( not ( = ?auto_20347 ?auto_20352 ) ) ( not ( = ?auto_20348 ?auto_20352 ) ) ( not ( = ?auto_20349 ?auto_20352 ) ) ( not ( = ?auto_20350 ?auto_20352 ) ) ( not ( = ?auto_20351 ?auto_20352 ) ) ( ON ?auto_20350 ?auto_20351 ) ( ON-TABLE ?auto_20352 ) ( CLEAR ?auto_20348 ) ( ON ?auto_20349 ?auto_20350 ) ( CLEAR ?auto_20349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20352 ?auto_20351 ?auto_20350 )
      ( MAKE-5PILE ?auto_20347 ?auto_20348 ?auto_20349 ?auto_20350 ?auto_20351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20353 - BLOCK
      ?auto_20354 - BLOCK
      ?auto_20355 - BLOCK
      ?auto_20356 - BLOCK
      ?auto_20357 - BLOCK
    )
    :vars
    (
      ?auto_20358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20353 ) ( not ( = ?auto_20353 ?auto_20354 ) ) ( not ( = ?auto_20353 ?auto_20355 ) ) ( not ( = ?auto_20353 ?auto_20356 ) ) ( not ( = ?auto_20353 ?auto_20357 ) ) ( not ( = ?auto_20354 ?auto_20355 ) ) ( not ( = ?auto_20354 ?auto_20356 ) ) ( not ( = ?auto_20354 ?auto_20357 ) ) ( not ( = ?auto_20355 ?auto_20356 ) ) ( not ( = ?auto_20355 ?auto_20357 ) ) ( not ( = ?auto_20356 ?auto_20357 ) ) ( ON ?auto_20357 ?auto_20358 ) ( not ( = ?auto_20353 ?auto_20358 ) ) ( not ( = ?auto_20354 ?auto_20358 ) ) ( not ( = ?auto_20355 ?auto_20358 ) ) ( not ( = ?auto_20356 ?auto_20358 ) ) ( not ( = ?auto_20357 ?auto_20358 ) ) ( ON ?auto_20356 ?auto_20357 ) ( ON-TABLE ?auto_20358 ) ( ON ?auto_20355 ?auto_20356 ) ( CLEAR ?auto_20355 ) ( HOLDING ?auto_20354 ) ( CLEAR ?auto_20353 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20353 ?auto_20354 )
      ( MAKE-5PILE ?auto_20353 ?auto_20354 ?auto_20355 ?auto_20356 ?auto_20357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20359 - BLOCK
      ?auto_20360 - BLOCK
      ?auto_20361 - BLOCK
      ?auto_20362 - BLOCK
      ?auto_20363 - BLOCK
    )
    :vars
    (
      ?auto_20364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20359 ) ( not ( = ?auto_20359 ?auto_20360 ) ) ( not ( = ?auto_20359 ?auto_20361 ) ) ( not ( = ?auto_20359 ?auto_20362 ) ) ( not ( = ?auto_20359 ?auto_20363 ) ) ( not ( = ?auto_20360 ?auto_20361 ) ) ( not ( = ?auto_20360 ?auto_20362 ) ) ( not ( = ?auto_20360 ?auto_20363 ) ) ( not ( = ?auto_20361 ?auto_20362 ) ) ( not ( = ?auto_20361 ?auto_20363 ) ) ( not ( = ?auto_20362 ?auto_20363 ) ) ( ON ?auto_20363 ?auto_20364 ) ( not ( = ?auto_20359 ?auto_20364 ) ) ( not ( = ?auto_20360 ?auto_20364 ) ) ( not ( = ?auto_20361 ?auto_20364 ) ) ( not ( = ?auto_20362 ?auto_20364 ) ) ( not ( = ?auto_20363 ?auto_20364 ) ) ( ON ?auto_20362 ?auto_20363 ) ( ON-TABLE ?auto_20364 ) ( ON ?auto_20361 ?auto_20362 ) ( CLEAR ?auto_20359 ) ( ON ?auto_20360 ?auto_20361 ) ( CLEAR ?auto_20360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20364 ?auto_20363 ?auto_20362 ?auto_20361 )
      ( MAKE-5PILE ?auto_20359 ?auto_20360 ?auto_20361 ?auto_20362 ?auto_20363 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20365 - BLOCK
      ?auto_20366 - BLOCK
      ?auto_20367 - BLOCK
      ?auto_20368 - BLOCK
      ?auto_20369 - BLOCK
    )
    :vars
    (
      ?auto_20370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20365 ?auto_20366 ) ) ( not ( = ?auto_20365 ?auto_20367 ) ) ( not ( = ?auto_20365 ?auto_20368 ) ) ( not ( = ?auto_20365 ?auto_20369 ) ) ( not ( = ?auto_20366 ?auto_20367 ) ) ( not ( = ?auto_20366 ?auto_20368 ) ) ( not ( = ?auto_20366 ?auto_20369 ) ) ( not ( = ?auto_20367 ?auto_20368 ) ) ( not ( = ?auto_20367 ?auto_20369 ) ) ( not ( = ?auto_20368 ?auto_20369 ) ) ( ON ?auto_20369 ?auto_20370 ) ( not ( = ?auto_20365 ?auto_20370 ) ) ( not ( = ?auto_20366 ?auto_20370 ) ) ( not ( = ?auto_20367 ?auto_20370 ) ) ( not ( = ?auto_20368 ?auto_20370 ) ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( ON ?auto_20368 ?auto_20369 ) ( ON-TABLE ?auto_20370 ) ( ON ?auto_20367 ?auto_20368 ) ( ON ?auto_20366 ?auto_20367 ) ( CLEAR ?auto_20366 ) ( HOLDING ?auto_20365 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20365 )
      ( MAKE-5PILE ?auto_20365 ?auto_20366 ?auto_20367 ?auto_20368 ?auto_20369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_20371 - BLOCK
      ?auto_20372 - BLOCK
      ?auto_20373 - BLOCK
      ?auto_20374 - BLOCK
      ?auto_20375 - BLOCK
    )
    :vars
    (
      ?auto_20376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20371 ?auto_20373 ) ) ( not ( = ?auto_20371 ?auto_20374 ) ) ( not ( = ?auto_20371 ?auto_20375 ) ) ( not ( = ?auto_20372 ?auto_20373 ) ) ( not ( = ?auto_20372 ?auto_20374 ) ) ( not ( = ?auto_20372 ?auto_20375 ) ) ( not ( = ?auto_20373 ?auto_20374 ) ) ( not ( = ?auto_20373 ?auto_20375 ) ) ( not ( = ?auto_20374 ?auto_20375 ) ) ( ON ?auto_20375 ?auto_20376 ) ( not ( = ?auto_20371 ?auto_20376 ) ) ( not ( = ?auto_20372 ?auto_20376 ) ) ( not ( = ?auto_20373 ?auto_20376 ) ) ( not ( = ?auto_20374 ?auto_20376 ) ) ( not ( = ?auto_20375 ?auto_20376 ) ) ( ON ?auto_20374 ?auto_20375 ) ( ON-TABLE ?auto_20376 ) ( ON ?auto_20373 ?auto_20374 ) ( ON ?auto_20372 ?auto_20373 ) ( ON ?auto_20371 ?auto_20372 ) ( CLEAR ?auto_20371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20376 ?auto_20375 ?auto_20374 ?auto_20373 ?auto_20372 )
      ( MAKE-5PILE ?auto_20371 ?auto_20372 ?auto_20373 ?auto_20374 ?auto_20375 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20381 - BLOCK
      ?auto_20382 - BLOCK
      ?auto_20383 - BLOCK
      ?auto_20384 - BLOCK
    )
    :vars
    (
      ?auto_20385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20385 ?auto_20384 ) ( CLEAR ?auto_20385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20381 ) ( ON ?auto_20382 ?auto_20381 ) ( ON ?auto_20383 ?auto_20382 ) ( ON ?auto_20384 ?auto_20383 ) ( not ( = ?auto_20381 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20383 ) ) ( not ( = ?auto_20381 ?auto_20384 ) ) ( not ( = ?auto_20381 ?auto_20385 ) ) ( not ( = ?auto_20382 ?auto_20383 ) ) ( not ( = ?auto_20382 ?auto_20384 ) ) ( not ( = ?auto_20382 ?auto_20385 ) ) ( not ( = ?auto_20383 ?auto_20384 ) ) ( not ( = ?auto_20383 ?auto_20385 ) ) ( not ( = ?auto_20384 ?auto_20385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20385 ?auto_20384 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20397 - BLOCK
      ?auto_20398 - BLOCK
      ?auto_20399 - BLOCK
      ?auto_20400 - BLOCK
    )
    :vars
    (
      ?auto_20401 - BLOCK
      ?auto_20402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20397 ) ( ON ?auto_20398 ?auto_20397 ) ( ON ?auto_20399 ?auto_20398 ) ( not ( = ?auto_20397 ?auto_20398 ) ) ( not ( = ?auto_20397 ?auto_20399 ) ) ( not ( = ?auto_20397 ?auto_20400 ) ) ( not ( = ?auto_20397 ?auto_20401 ) ) ( not ( = ?auto_20398 ?auto_20399 ) ) ( not ( = ?auto_20398 ?auto_20400 ) ) ( not ( = ?auto_20398 ?auto_20401 ) ) ( not ( = ?auto_20399 ?auto_20400 ) ) ( not ( = ?auto_20399 ?auto_20401 ) ) ( not ( = ?auto_20400 ?auto_20401 ) ) ( ON ?auto_20401 ?auto_20402 ) ( CLEAR ?auto_20401 ) ( not ( = ?auto_20397 ?auto_20402 ) ) ( not ( = ?auto_20398 ?auto_20402 ) ) ( not ( = ?auto_20399 ?auto_20402 ) ) ( not ( = ?auto_20400 ?auto_20402 ) ) ( not ( = ?auto_20401 ?auto_20402 ) ) ( HOLDING ?auto_20400 ) ( CLEAR ?auto_20399 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20397 ?auto_20398 ?auto_20399 ?auto_20400 ?auto_20401 )
      ( MAKE-4PILE ?auto_20397 ?auto_20398 ?auto_20399 ?auto_20400 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20403 - BLOCK
      ?auto_20404 - BLOCK
      ?auto_20405 - BLOCK
      ?auto_20406 - BLOCK
    )
    :vars
    (
      ?auto_20408 - BLOCK
      ?auto_20407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20403 ) ( ON ?auto_20404 ?auto_20403 ) ( ON ?auto_20405 ?auto_20404 ) ( not ( = ?auto_20403 ?auto_20404 ) ) ( not ( = ?auto_20403 ?auto_20405 ) ) ( not ( = ?auto_20403 ?auto_20406 ) ) ( not ( = ?auto_20403 ?auto_20408 ) ) ( not ( = ?auto_20404 ?auto_20405 ) ) ( not ( = ?auto_20404 ?auto_20406 ) ) ( not ( = ?auto_20404 ?auto_20408 ) ) ( not ( = ?auto_20405 ?auto_20406 ) ) ( not ( = ?auto_20405 ?auto_20408 ) ) ( not ( = ?auto_20406 ?auto_20408 ) ) ( ON ?auto_20408 ?auto_20407 ) ( not ( = ?auto_20403 ?auto_20407 ) ) ( not ( = ?auto_20404 ?auto_20407 ) ) ( not ( = ?auto_20405 ?auto_20407 ) ) ( not ( = ?auto_20406 ?auto_20407 ) ) ( not ( = ?auto_20408 ?auto_20407 ) ) ( CLEAR ?auto_20405 ) ( ON ?auto_20406 ?auto_20408 ) ( CLEAR ?auto_20406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20407 ?auto_20408 )
      ( MAKE-4PILE ?auto_20403 ?auto_20404 ?auto_20405 ?auto_20406 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20409 - BLOCK
      ?auto_20410 - BLOCK
      ?auto_20411 - BLOCK
      ?auto_20412 - BLOCK
    )
    :vars
    (
      ?auto_20414 - BLOCK
      ?auto_20413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20409 ) ( ON ?auto_20410 ?auto_20409 ) ( not ( = ?auto_20409 ?auto_20410 ) ) ( not ( = ?auto_20409 ?auto_20411 ) ) ( not ( = ?auto_20409 ?auto_20412 ) ) ( not ( = ?auto_20409 ?auto_20414 ) ) ( not ( = ?auto_20410 ?auto_20411 ) ) ( not ( = ?auto_20410 ?auto_20412 ) ) ( not ( = ?auto_20410 ?auto_20414 ) ) ( not ( = ?auto_20411 ?auto_20412 ) ) ( not ( = ?auto_20411 ?auto_20414 ) ) ( not ( = ?auto_20412 ?auto_20414 ) ) ( ON ?auto_20414 ?auto_20413 ) ( not ( = ?auto_20409 ?auto_20413 ) ) ( not ( = ?auto_20410 ?auto_20413 ) ) ( not ( = ?auto_20411 ?auto_20413 ) ) ( not ( = ?auto_20412 ?auto_20413 ) ) ( not ( = ?auto_20414 ?auto_20413 ) ) ( ON ?auto_20412 ?auto_20414 ) ( CLEAR ?auto_20412 ) ( ON-TABLE ?auto_20413 ) ( HOLDING ?auto_20411 ) ( CLEAR ?auto_20410 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20409 ?auto_20410 ?auto_20411 )
      ( MAKE-4PILE ?auto_20409 ?auto_20410 ?auto_20411 ?auto_20412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20415 - BLOCK
      ?auto_20416 - BLOCK
      ?auto_20417 - BLOCK
      ?auto_20418 - BLOCK
    )
    :vars
    (
      ?auto_20420 - BLOCK
      ?auto_20419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20415 ) ( ON ?auto_20416 ?auto_20415 ) ( not ( = ?auto_20415 ?auto_20416 ) ) ( not ( = ?auto_20415 ?auto_20417 ) ) ( not ( = ?auto_20415 ?auto_20418 ) ) ( not ( = ?auto_20415 ?auto_20420 ) ) ( not ( = ?auto_20416 ?auto_20417 ) ) ( not ( = ?auto_20416 ?auto_20418 ) ) ( not ( = ?auto_20416 ?auto_20420 ) ) ( not ( = ?auto_20417 ?auto_20418 ) ) ( not ( = ?auto_20417 ?auto_20420 ) ) ( not ( = ?auto_20418 ?auto_20420 ) ) ( ON ?auto_20420 ?auto_20419 ) ( not ( = ?auto_20415 ?auto_20419 ) ) ( not ( = ?auto_20416 ?auto_20419 ) ) ( not ( = ?auto_20417 ?auto_20419 ) ) ( not ( = ?auto_20418 ?auto_20419 ) ) ( not ( = ?auto_20420 ?auto_20419 ) ) ( ON ?auto_20418 ?auto_20420 ) ( ON-TABLE ?auto_20419 ) ( CLEAR ?auto_20416 ) ( ON ?auto_20417 ?auto_20418 ) ( CLEAR ?auto_20417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20419 ?auto_20420 ?auto_20418 )
      ( MAKE-4PILE ?auto_20415 ?auto_20416 ?auto_20417 ?auto_20418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20421 - BLOCK
      ?auto_20422 - BLOCK
      ?auto_20423 - BLOCK
      ?auto_20424 - BLOCK
    )
    :vars
    (
      ?auto_20425 - BLOCK
      ?auto_20426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20421 ) ( not ( = ?auto_20421 ?auto_20422 ) ) ( not ( = ?auto_20421 ?auto_20423 ) ) ( not ( = ?auto_20421 ?auto_20424 ) ) ( not ( = ?auto_20421 ?auto_20425 ) ) ( not ( = ?auto_20422 ?auto_20423 ) ) ( not ( = ?auto_20422 ?auto_20424 ) ) ( not ( = ?auto_20422 ?auto_20425 ) ) ( not ( = ?auto_20423 ?auto_20424 ) ) ( not ( = ?auto_20423 ?auto_20425 ) ) ( not ( = ?auto_20424 ?auto_20425 ) ) ( ON ?auto_20425 ?auto_20426 ) ( not ( = ?auto_20421 ?auto_20426 ) ) ( not ( = ?auto_20422 ?auto_20426 ) ) ( not ( = ?auto_20423 ?auto_20426 ) ) ( not ( = ?auto_20424 ?auto_20426 ) ) ( not ( = ?auto_20425 ?auto_20426 ) ) ( ON ?auto_20424 ?auto_20425 ) ( ON-TABLE ?auto_20426 ) ( ON ?auto_20423 ?auto_20424 ) ( CLEAR ?auto_20423 ) ( HOLDING ?auto_20422 ) ( CLEAR ?auto_20421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20421 ?auto_20422 )
      ( MAKE-4PILE ?auto_20421 ?auto_20422 ?auto_20423 ?auto_20424 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20427 - BLOCK
      ?auto_20428 - BLOCK
      ?auto_20429 - BLOCK
      ?auto_20430 - BLOCK
    )
    :vars
    (
      ?auto_20431 - BLOCK
      ?auto_20432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20427 ) ( not ( = ?auto_20427 ?auto_20428 ) ) ( not ( = ?auto_20427 ?auto_20429 ) ) ( not ( = ?auto_20427 ?auto_20430 ) ) ( not ( = ?auto_20427 ?auto_20431 ) ) ( not ( = ?auto_20428 ?auto_20429 ) ) ( not ( = ?auto_20428 ?auto_20430 ) ) ( not ( = ?auto_20428 ?auto_20431 ) ) ( not ( = ?auto_20429 ?auto_20430 ) ) ( not ( = ?auto_20429 ?auto_20431 ) ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( ON ?auto_20431 ?auto_20432 ) ( not ( = ?auto_20427 ?auto_20432 ) ) ( not ( = ?auto_20428 ?auto_20432 ) ) ( not ( = ?auto_20429 ?auto_20432 ) ) ( not ( = ?auto_20430 ?auto_20432 ) ) ( not ( = ?auto_20431 ?auto_20432 ) ) ( ON ?auto_20430 ?auto_20431 ) ( ON-TABLE ?auto_20432 ) ( ON ?auto_20429 ?auto_20430 ) ( CLEAR ?auto_20427 ) ( ON ?auto_20428 ?auto_20429 ) ( CLEAR ?auto_20428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20432 ?auto_20431 ?auto_20430 ?auto_20429 )
      ( MAKE-4PILE ?auto_20427 ?auto_20428 ?auto_20429 ?auto_20430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20433 - BLOCK
      ?auto_20434 - BLOCK
      ?auto_20435 - BLOCK
      ?auto_20436 - BLOCK
    )
    :vars
    (
      ?auto_20438 - BLOCK
      ?auto_20437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20433 ?auto_20434 ) ) ( not ( = ?auto_20433 ?auto_20435 ) ) ( not ( = ?auto_20433 ?auto_20436 ) ) ( not ( = ?auto_20433 ?auto_20438 ) ) ( not ( = ?auto_20434 ?auto_20435 ) ) ( not ( = ?auto_20434 ?auto_20436 ) ) ( not ( = ?auto_20434 ?auto_20438 ) ) ( not ( = ?auto_20435 ?auto_20436 ) ) ( not ( = ?auto_20435 ?auto_20438 ) ) ( not ( = ?auto_20436 ?auto_20438 ) ) ( ON ?auto_20438 ?auto_20437 ) ( not ( = ?auto_20433 ?auto_20437 ) ) ( not ( = ?auto_20434 ?auto_20437 ) ) ( not ( = ?auto_20435 ?auto_20437 ) ) ( not ( = ?auto_20436 ?auto_20437 ) ) ( not ( = ?auto_20438 ?auto_20437 ) ) ( ON ?auto_20436 ?auto_20438 ) ( ON-TABLE ?auto_20437 ) ( ON ?auto_20435 ?auto_20436 ) ( ON ?auto_20434 ?auto_20435 ) ( CLEAR ?auto_20434 ) ( HOLDING ?auto_20433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20433 )
      ( MAKE-4PILE ?auto_20433 ?auto_20434 ?auto_20435 ?auto_20436 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20439 - BLOCK
      ?auto_20440 - BLOCK
      ?auto_20441 - BLOCK
      ?auto_20442 - BLOCK
    )
    :vars
    (
      ?auto_20443 - BLOCK
      ?auto_20444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20439 ?auto_20440 ) ) ( not ( = ?auto_20439 ?auto_20441 ) ) ( not ( = ?auto_20439 ?auto_20442 ) ) ( not ( = ?auto_20439 ?auto_20443 ) ) ( not ( = ?auto_20440 ?auto_20441 ) ) ( not ( = ?auto_20440 ?auto_20442 ) ) ( not ( = ?auto_20440 ?auto_20443 ) ) ( not ( = ?auto_20441 ?auto_20442 ) ) ( not ( = ?auto_20441 ?auto_20443 ) ) ( not ( = ?auto_20442 ?auto_20443 ) ) ( ON ?auto_20443 ?auto_20444 ) ( not ( = ?auto_20439 ?auto_20444 ) ) ( not ( = ?auto_20440 ?auto_20444 ) ) ( not ( = ?auto_20441 ?auto_20444 ) ) ( not ( = ?auto_20442 ?auto_20444 ) ) ( not ( = ?auto_20443 ?auto_20444 ) ) ( ON ?auto_20442 ?auto_20443 ) ( ON-TABLE ?auto_20444 ) ( ON ?auto_20441 ?auto_20442 ) ( ON ?auto_20440 ?auto_20441 ) ( ON ?auto_20439 ?auto_20440 ) ( CLEAR ?auto_20439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20444 ?auto_20443 ?auto_20442 ?auto_20441 ?auto_20440 )
      ( MAKE-4PILE ?auto_20439 ?auto_20440 ?auto_20441 ?auto_20442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20446 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20446 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_20446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20447 - BLOCK
    )
    :vars
    (
      ?auto_20448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20447 ?auto_20448 ) ( CLEAR ?auto_20447 ) ( HAND-EMPTY ) ( not ( = ?auto_20447 ?auto_20448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20447 ?auto_20448 )
      ( MAKE-1PILE ?auto_20447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20449 - BLOCK
    )
    :vars
    (
      ?auto_20450 - BLOCK
      ?auto_20453 - BLOCK
      ?auto_20452 - BLOCK
      ?auto_20451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20449 ?auto_20450 ) ) ( HOLDING ?auto_20449 ) ( CLEAR ?auto_20450 ) ( ON-TABLE ?auto_20453 ) ( ON ?auto_20452 ?auto_20453 ) ( ON ?auto_20451 ?auto_20452 ) ( ON ?auto_20450 ?auto_20451 ) ( not ( = ?auto_20453 ?auto_20452 ) ) ( not ( = ?auto_20453 ?auto_20451 ) ) ( not ( = ?auto_20453 ?auto_20450 ) ) ( not ( = ?auto_20453 ?auto_20449 ) ) ( not ( = ?auto_20452 ?auto_20451 ) ) ( not ( = ?auto_20452 ?auto_20450 ) ) ( not ( = ?auto_20452 ?auto_20449 ) ) ( not ( = ?auto_20451 ?auto_20450 ) ) ( not ( = ?auto_20451 ?auto_20449 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20453 ?auto_20452 ?auto_20451 ?auto_20450 ?auto_20449 )
      ( MAKE-1PILE ?auto_20449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20454 - BLOCK
    )
    :vars
    (
      ?auto_20455 - BLOCK
      ?auto_20456 - BLOCK
      ?auto_20458 - BLOCK
      ?auto_20457 - BLOCK
      ?auto_20459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20454 ?auto_20455 ) ) ( CLEAR ?auto_20455 ) ( ON-TABLE ?auto_20456 ) ( ON ?auto_20458 ?auto_20456 ) ( ON ?auto_20457 ?auto_20458 ) ( ON ?auto_20455 ?auto_20457 ) ( not ( = ?auto_20456 ?auto_20458 ) ) ( not ( = ?auto_20456 ?auto_20457 ) ) ( not ( = ?auto_20456 ?auto_20455 ) ) ( not ( = ?auto_20456 ?auto_20454 ) ) ( not ( = ?auto_20458 ?auto_20457 ) ) ( not ( = ?auto_20458 ?auto_20455 ) ) ( not ( = ?auto_20458 ?auto_20454 ) ) ( not ( = ?auto_20457 ?auto_20455 ) ) ( not ( = ?auto_20457 ?auto_20454 ) ) ( ON ?auto_20454 ?auto_20459 ) ( CLEAR ?auto_20454 ) ( HAND-EMPTY ) ( not ( = ?auto_20454 ?auto_20459 ) ) ( not ( = ?auto_20455 ?auto_20459 ) ) ( not ( = ?auto_20456 ?auto_20459 ) ) ( not ( = ?auto_20458 ?auto_20459 ) ) ( not ( = ?auto_20457 ?auto_20459 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20454 ?auto_20459 )
      ( MAKE-1PILE ?auto_20454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20460 - BLOCK
    )
    :vars
    (
      ?auto_20464 - BLOCK
      ?auto_20462 - BLOCK
      ?auto_20465 - BLOCK
      ?auto_20463 - BLOCK
      ?auto_20461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20460 ?auto_20464 ) ) ( ON-TABLE ?auto_20462 ) ( ON ?auto_20465 ?auto_20462 ) ( ON ?auto_20463 ?auto_20465 ) ( not ( = ?auto_20462 ?auto_20465 ) ) ( not ( = ?auto_20462 ?auto_20463 ) ) ( not ( = ?auto_20462 ?auto_20464 ) ) ( not ( = ?auto_20462 ?auto_20460 ) ) ( not ( = ?auto_20465 ?auto_20463 ) ) ( not ( = ?auto_20465 ?auto_20464 ) ) ( not ( = ?auto_20465 ?auto_20460 ) ) ( not ( = ?auto_20463 ?auto_20464 ) ) ( not ( = ?auto_20463 ?auto_20460 ) ) ( ON ?auto_20460 ?auto_20461 ) ( CLEAR ?auto_20460 ) ( not ( = ?auto_20460 ?auto_20461 ) ) ( not ( = ?auto_20464 ?auto_20461 ) ) ( not ( = ?auto_20462 ?auto_20461 ) ) ( not ( = ?auto_20465 ?auto_20461 ) ) ( not ( = ?auto_20463 ?auto_20461 ) ) ( HOLDING ?auto_20464 ) ( CLEAR ?auto_20463 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20462 ?auto_20465 ?auto_20463 ?auto_20464 )
      ( MAKE-1PILE ?auto_20460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20466 - BLOCK
    )
    :vars
    (
      ?auto_20467 - BLOCK
      ?auto_20470 - BLOCK
      ?auto_20471 - BLOCK
      ?auto_20469 - BLOCK
      ?auto_20468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20466 ?auto_20467 ) ) ( ON-TABLE ?auto_20470 ) ( ON ?auto_20471 ?auto_20470 ) ( ON ?auto_20469 ?auto_20471 ) ( not ( = ?auto_20470 ?auto_20471 ) ) ( not ( = ?auto_20470 ?auto_20469 ) ) ( not ( = ?auto_20470 ?auto_20467 ) ) ( not ( = ?auto_20470 ?auto_20466 ) ) ( not ( = ?auto_20471 ?auto_20469 ) ) ( not ( = ?auto_20471 ?auto_20467 ) ) ( not ( = ?auto_20471 ?auto_20466 ) ) ( not ( = ?auto_20469 ?auto_20467 ) ) ( not ( = ?auto_20469 ?auto_20466 ) ) ( ON ?auto_20466 ?auto_20468 ) ( not ( = ?auto_20466 ?auto_20468 ) ) ( not ( = ?auto_20467 ?auto_20468 ) ) ( not ( = ?auto_20470 ?auto_20468 ) ) ( not ( = ?auto_20471 ?auto_20468 ) ) ( not ( = ?auto_20469 ?auto_20468 ) ) ( CLEAR ?auto_20469 ) ( ON ?auto_20467 ?auto_20466 ) ( CLEAR ?auto_20467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20468 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20468 ?auto_20466 )
      ( MAKE-1PILE ?auto_20466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20472 - BLOCK
    )
    :vars
    (
      ?auto_20477 - BLOCK
      ?auto_20475 - BLOCK
      ?auto_20476 - BLOCK
      ?auto_20473 - BLOCK
      ?auto_20474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20472 ?auto_20477 ) ) ( ON-TABLE ?auto_20475 ) ( ON ?auto_20476 ?auto_20475 ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( not ( = ?auto_20475 ?auto_20473 ) ) ( not ( = ?auto_20475 ?auto_20477 ) ) ( not ( = ?auto_20475 ?auto_20472 ) ) ( not ( = ?auto_20476 ?auto_20473 ) ) ( not ( = ?auto_20476 ?auto_20477 ) ) ( not ( = ?auto_20476 ?auto_20472 ) ) ( not ( = ?auto_20473 ?auto_20477 ) ) ( not ( = ?auto_20473 ?auto_20472 ) ) ( ON ?auto_20472 ?auto_20474 ) ( not ( = ?auto_20472 ?auto_20474 ) ) ( not ( = ?auto_20477 ?auto_20474 ) ) ( not ( = ?auto_20475 ?auto_20474 ) ) ( not ( = ?auto_20476 ?auto_20474 ) ) ( not ( = ?auto_20473 ?auto_20474 ) ) ( ON ?auto_20477 ?auto_20472 ) ( CLEAR ?auto_20477 ) ( ON-TABLE ?auto_20474 ) ( HOLDING ?auto_20473 ) ( CLEAR ?auto_20476 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20475 ?auto_20476 ?auto_20473 )
      ( MAKE-1PILE ?auto_20472 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20478 - BLOCK
    )
    :vars
    (
      ?auto_20479 - BLOCK
      ?auto_20483 - BLOCK
      ?auto_20481 - BLOCK
      ?auto_20480 - BLOCK
      ?auto_20482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20478 ?auto_20479 ) ) ( ON-TABLE ?auto_20483 ) ( ON ?auto_20481 ?auto_20483 ) ( not ( = ?auto_20483 ?auto_20481 ) ) ( not ( = ?auto_20483 ?auto_20480 ) ) ( not ( = ?auto_20483 ?auto_20479 ) ) ( not ( = ?auto_20483 ?auto_20478 ) ) ( not ( = ?auto_20481 ?auto_20480 ) ) ( not ( = ?auto_20481 ?auto_20479 ) ) ( not ( = ?auto_20481 ?auto_20478 ) ) ( not ( = ?auto_20480 ?auto_20479 ) ) ( not ( = ?auto_20480 ?auto_20478 ) ) ( ON ?auto_20478 ?auto_20482 ) ( not ( = ?auto_20478 ?auto_20482 ) ) ( not ( = ?auto_20479 ?auto_20482 ) ) ( not ( = ?auto_20483 ?auto_20482 ) ) ( not ( = ?auto_20481 ?auto_20482 ) ) ( not ( = ?auto_20480 ?auto_20482 ) ) ( ON ?auto_20479 ?auto_20478 ) ( ON-TABLE ?auto_20482 ) ( CLEAR ?auto_20481 ) ( ON ?auto_20480 ?auto_20479 ) ( CLEAR ?auto_20480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20482 ?auto_20478 ?auto_20479 )
      ( MAKE-1PILE ?auto_20478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20484 - BLOCK
    )
    :vars
    (
      ?auto_20487 - BLOCK
      ?auto_20489 - BLOCK
      ?auto_20486 - BLOCK
      ?auto_20485 - BLOCK
      ?auto_20488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20484 ?auto_20487 ) ) ( ON-TABLE ?auto_20489 ) ( not ( = ?auto_20489 ?auto_20486 ) ) ( not ( = ?auto_20489 ?auto_20485 ) ) ( not ( = ?auto_20489 ?auto_20487 ) ) ( not ( = ?auto_20489 ?auto_20484 ) ) ( not ( = ?auto_20486 ?auto_20485 ) ) ( not ( = ?auto_20486 ?auto_20487 ) ) ( not ( = ?auto_20486 ?auto_20484 ) ) ( not ( = ?auto_20485 ?auto_20487 ) ) ( not ( = ?auto_20485 ?auto_20484 ) ) ( ON ?auto_20484 ?auto_20488 ) ( not ( = ?auto_20484 ?auto_20488 ) ) ( not ( = ?auto_20487 ?auto_20488 ) ) ( not ( = ?auto_20489 ?auto_20488 ) ) ( not ( = ?auto_20486 ?auto_20488 ) ) ( not ( = ?auto_20485 ?auto_20488 ) ) ( ON ?auto_20487 ?auto_20484 ) ( ON-TABLE ?auto_20488 ) ( ON ?auto_20485 ?auto_20487 ) ( CLEAR ?auto_20485 ) ( HOLDING ?auto_20486 ) ( CLEAR ?auto_20489 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20489 ?auto_20486 )
      ( MAKE-1PILE ?auto_20484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20490 - BLOCK
    )
    :vars
    (
      ?auto_20494 - BLOCK
      ?auto_20493 - BLOCK
      ?auto_20495 - BLOCK
      ?auto_20492 - BLOCK
      ?auto_20491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20490 ?auto_20494 ) ) ( ON-TABLE ?auto_20493 ) ( not ( = ?auto_20493 ?auto_20495 ) ) ( not ( = ?auto_20493 ?auto_20492 ) ) ( not ( = ?auto_20493 ?auto_20494 ) ) ( not ( = ?auto_20493 ?auto_20490 ) ) ( not ( = ?auto_20495 ?auto_20492 ) ) ( not ( = ?auto_20495 ?auto_20494 ) ) ( not ( = ?auto_20495 ?auto_20490 ) ) ( not ( = ?auto_20492 ?auto_20494 ) ) ( not ( = ?auto_20492 ?auto_20490 ) ) ( ON ?auto_20490 ?auto_20491 ) ( not ( = ?auto_20490 ?auto_20491 ) ) ( not ( = ?auto_20494 ?auto_20491 ) ) ( not ( = ?auto_20493 ?auto_20491 ) ) ( not ( = ?auto_20495 ?auto_20491 ) ) ( not ( = ?auto_20492 ?auto_20491 ) ) ( ON ?auto_20494 ?auto_20490 ) ( ON-TABLE ?auto_20491 ) ( ON ?auto_20492 ?auto_20494 ) ( CLEAR ?auto_20493 ) ( ON ?auto_20495 ?auto_20492 ) ( CLEAR ?auto_20495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20491 ?auto_20490 ?auto_20494 ?auto_20492 )
      ( MAKE-1PILE ?auto_20490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20496 - BLOCK
    )
    :vars
    (
      ?auto_20497 - BLOCK
      ?auto_20499 - BLOCK
      ?auto_20501 - BLOCK
      ?auto_20500 - BLOCK
      ?auto_20498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20496 ?auto_20497 ) ) ( not ( = ?auto_20499 ?auto_20501 ) ) ( not ( = ?auto_20499 ?auto_20500 ) ) ( not ( = ?auto_20499 ?auto_20497 ) ) ( not ( = ?auto_20499 ?auto_20496 ) ) ( not ( = ?auto_20501 ?auto_20500 ) ) ( not ( = ?auto_20501 ?auto_20497 ) ) ( not ( = ?auto_20501 ?auto_20496 ) ) ( not ( = ?auto_20500 ?auto_20497 ) ) ( not ( = ?auto_20500 ?auto_20496 ) ) ( ON ?auto_20496 ?auto_20498 ) ( not ( = ?auto_20496 ?auto_20498 ) ) ( not ( = ?auto_20497 ?auto_20498 ) ) ( not ( = ?auto_20499 ?auto_20498 ) ) ( not ( = ?auto_20501 ?auto_20498 ) ) ( not ( = ?auto_20500 ?auto_20498 ) ) ( ON ?auto_20497 ?auto_20496 ) ( ON-TABLE ?auto_20498 ) ( ON ?auto_20500 ?auto_20497 ) ( ON ?auto_20501 ?auto_20500 ) ( CLEAR ?auto_20501 ) ( HOLDING ?auto_20499 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20499 )
      ( MAKE-1PILE ?auto_20496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20502 - BLOCK
    )
    :vars
    (
      ?auto_20504 - BLOCK
      ?auto_20503 - BLOCK
      ?auto_20505 - BLOCK
      ?auto_20507 - BLOCK
      ?auto_20506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20502 ?auto_20504 ) ) ( not ( = ?auto_20503 ?auto_20505 ) ) ( not ( = ?auto_20503 ?auto_20507 ) ) ( not ( = ?auto_20503 ?auto_20504 ) ) ( not ( = ?auto_20503 ?auto_20502 ) ) ( not ( = ?auto_20505 ?auto_20507 ) ) ( not ( = ?auto_20505 ?auto_20504 ) ) ( not ( = ?auto_20505 ?auto_20502 ) ) ( not ( = ?auto_20507 ?auto_20504 ) ) ( not ( = ?auto_20507 ?auto_20502 ) ) ( ON ?auto_20502 ?auto_20506 ) ( not ( = ?auto_20502 ?auto_20506 ) ) ( not ( = ?auto_20504 ?auto_20506 ) ) ( not ( = ?auto_20503 ?auto_20506 ) ) ( not ( = ?auto_20505 ?auto_20506 ) ) ( not ( = ?auto_20507 ?auto_20506 ) ) ( ON ?auto_20504 ?auto_20502 ) ( ON-TABLE ?auto_20506 ) ( ON ?auto_20507 ?auto_20504 ) ( ON ?auto_20505 ?auto_20507 ) ( ON ?auto_20503 ?auto_20505 ) ( CLEAR ?auto_20503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20506 ?auto_20502 ?auto_20504 ?auto_20507 ?auto_20505 )
      ( MAKE-1PILE ?auto_20502 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20511 - BLOCK
      ?auto_20512 - BLOCK
      ?auto_20513 - BLOCK
    )
    :vars
    (
      ?auto_20514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20514 ?auto_20513 ) ( CLEAR ?auto_20514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20511 ) ( ON ?auto_20512 ?auto_20511 ) ( ON ?auto_20513 ?auto_20512 ) ( not ( = ?auto_20511 ?auto_20512 ) ) ( not ( = ?auto_20511 ?auto_20513 ) ) ( not ( = ?auto_20511 ?auto_20514 ) ) ( not ( = ?auto_20512 ?auto_20513 ) ) ( not ( = ?auto_20512 ?auto_20514 ) ) ( not ( = ?auto_20513 ?auto_20514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20514 ?auto_20513 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20515 - BLOCK
      ?auto_20516 - BLOCK
      ?auto_20517 - BLOCK
    )
    :vars
    (
      ?auto_20518 - BLOCK
      ?auto_20519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20518 ?auto_20517 ) ( CLEAR ?auto_20518 ) ( ON-TABLE ?auto_20515 ) ( ON ?auto_20516 ?auto_20515 ) ( ON ?auto_20517 ?auto_20516 ) ( not ( = ?auto_20515 ?auto_20516 ) ) ( not ( = ?auto_20515 ?auto_20517 ) ) ( not ( = ?auto_20515 ?auto_20518 ) ) ( not ( = ?auto_20516 ?auto_20517 ) ) ( not ( = ?auto_20516 ?auto_20518 ) ) ( not ( = ?auto_20517 ?auto_20518 ) ) ( HOLDING ?auto_20519 ) ( not ( = ?auto_20515 ?auto_20519 ) ) ( not ( = ?auto_20516 ?auto_20519 ) ) ( not ( = ?auto_20517 ?auto_20519 ) ) ( not ( = ?auto_20518 ?auto_20519 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_20519 )
      ( MAKE-3PILE ?auto_20515 ?auto_20516 ?auto_20517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20520 - BLOCK
      ?auto_20521 - BLOCK
      ?auto_20522 - BLOCK
    )
    :vars
    (
      ?auto_20524 - BLOCK
      ?auto_20523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20524 ?auto_20522 ) ( ON-TABLE ?auto_20520 ) ( ON ?auto_20521 ?auto_20520 ) ( ON ?auto_20522 ?auto_20521 ) ( not ( = ?auto_20520 ?auto_20521 ) ) ( not ( = ?auto_20520 ?auto_20522 ) ) ( not ( = ?auto_20520 ?auto_20524 ) ) ( not ( = ?auto_20521 ?auto_20522 ) ) ( not ( = ?auto_20521 ?auto_20524 ) ) ( not ( = ?auto_20522 ?auto_20524 ) ) ( not ( = ?auto_20520 ?auto_20523 ) ) ( not ( = ?auto_20521 ?auto_20523 ) ) ( not ( = ?auto_20522 ?auto_20523 ) ) ( not ( = ?auto_20524 ?auto_20523 ) ) ( ON ?auto_20523 ?auto_20524 ) ( CLEAR ?auto_20523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20520 ?auto_20521 ?auto_20522 ?auto_20524 )
      ( MAKE-3PILE ?auto_20520 ?auto_20521 ?auto_20522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20525 - BLOCK
      ?auto_20526 - BLOCK
      ?auto_20527 - BLOCK
    )
    :vars
    (
      ?auto_20528 - BLOCK
      ?auto_20529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20528 ?auto_20527 ) ( ON-TABLE ?auto_20525 ) ( ON ?auto_20526 ?auto_20525 ) ( ON ?auto_20527 ?auto_20526 ) ( not ( = ?auto_20525 ?auto_20526 ) ) ( not ( = ?auto_20525 ?auto_20527 ) ) ( not ( = ?auto_20525 ?auto_20528 ) ) ( not ( = ?auto_20526 ?auto_20527 ) ) ( not ( = ?auto_20526 ?auto_20528 ) ) ( not ( = ?auto_20527 ?auto_20528 ) ) ( not ( = ?auto_20525 ?auto_20529 ) ) ( not ( = ?auto_20526 ?auto_20529 ) ) ( not ( = ?auto_20527 ?auto_20529 ) ) ( not ( = ?auto_20528 ?auto_20529 ) ) ( HOLDING ?auto_20529 ) ( CLEAR ?auto_20528 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20525 ?auto_20526 ?auto_20527 ?auto_20528 ?auto_20529 )
      ( MAKE-3PILE ?auto_20525 ?auto_20526 ?auto_20527 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20530 - BLOCK
      ?auto_20531 - BLOCK
      ?auto_20532 - BLOCK
    )
    :vars
    (
      ?auto_20533 - BLOCK
      ?auto_20534 - BLOCK
      ?auto_20535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20533 ?auto_20532 ) ( ON-TABLE ?auto_20530 ) ( ON ?auto_20531 ?auto_20530 ) ( ON ?auto_20532 ?auto_20531 ) ( not ( = ?auto_20530 ?auto_20531 ) ) ( not ( = ?auto_20530 ?auto_20532 ) ) ( not ( = ?auto_20530 ?auto_20533 ) ) ( not ( = ?auto_20531 ?auto_20532 ) ) ( not ( = ?auto_20531 ?auto_20533 ) ) ( not ( = ?auto_20532 ?auto_20533 ) ) ( not ( = ?auto_20530 ?auto_20534 ) ) ( not ( = ?auto_20531 ?auto_20534 ) ) ( not ( = ?auto_20532 ?auto_20534 ) ) ( not ( = ?auto_20533 ?auto_20534 ) ) ( CLEAR ?auto_20533 ) ( ON ?auto_20534 ?auto_20535 ) ( CLEAR ?auto_20534 ) ( HAND-EMPTY ) ( not ( = ?auto_20530 ?auto_20535 ) ) ( not ( = ?auto_20531 ?auto_20535 ) ) ( not ( = ?auto_20532 ?auto_20535 ) ) ( not ( = ?auto_20533 ?auto_20535 ) ) ( not ( = ?auto_20534 ?auto_20535 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20534 ?auto_20535 )
      ( MAKE-3PILE ?auto_20530 ?auto_20531 ?auto_20532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20548 - BLOCK
      ?auto_20549 - BLOCK
      ?auto_20550 - BLOCK
    )
    :vars
    (
      ?auto_20552 - BLOCK
      ?auto_20553 - BLOCK
      ?auto_20551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20548 ) ( ON ?auto_20549 ?auto_20548 ) ( not ( = ?auto_20548 ?auto_20549 ) ) ( not ( = ?auto_20548 ?auto_20550 ) ) ( not ( = ?auto_20548 ?auto_20552 ) ) ( not ( = ?auto_20549 ?auto_20550 ) ) ( not ( = ?auto_20549 ?auto_20552 ) ) ( not ( = ?auto_20550 ?auto_20552 ) ) ( not ( = ?auto_20548 ?auto_20553 ) ) ( not ( = ?auto_20549 ?auto_20553 ) ) ( not ( = ?auto_20550 ?auto_20553 ) ) ( not ( = ?auto_20552 ?auto_20553 ) ) ( ON ?auto_20553 ?auto_20551 ) ( not ( = ?auto_20548 ?auto_20551 ) ) ( not ( = ?auto_20549 ?auto_20551 ) ) ( not ( = ?auto_20550 ?auto_20551 ) ) ( not ( = ?auto_20552 ?auto_20551 ) ) ( not ( = ?auto_20553 ?auto_20551 ) ) ( ON ?auto_20552 ?auto_20553 ) ( CLEAR ?auto_20552 ) ( HOLDING ?auto_20550 ) ( CLEAR ?auto_20549 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20548 ?auto_20549 ?auto_20550 ?auto_20552 )
      ( MAKE-3PILE ?auto_20548 ?auto_20549 ?auto_20550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20554 - BLOCK
      ?auto_20555 - BLOCK
      ?auto_20556 - BLOCK
    )
    :vars
    (
      ?auto_20557 - BLOCK
      ?auto_20559 - BLOCK
      ?auto_20558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20554 ) ( ON ?auto_20555 ?auto_20554 ) ( not ( = ?auto_20554 ?auto_20555 ) ) ( not ( = ?auto_20554 ?auto_20556 ) ) ( not ( = ?auto_20554 ?auto_20557 ) ) ( not ( = ?auto_20555 ?auto_20556 ) ) ( not ( = ?auto_20555 ?auto_20557 ) ) ( not ( = ?auto_20556 ?auto_20557 ) ) ( not ( = ?auto_20554 ?auto_20559 ) ) ( not ( = ?auto_20555 ?auto_20559 ) ) ( not ( = ?auto_20556 ?auto_20559 ) ) ( not ( = ?auto_20557 ?auto_20559 ) ) ( ON ?auto_20559 ?auto_20558 ) ( not ( = ?auto_20554 ?auto_20558 ) ) ( not ( = ?auto_20555 ?auto_20558 ) ) ( not ( = ?auto_20556 ?auto_20558 ) ) ( not ( = ?auto_20557 ?auto_20558 ) ) ( not ( = ?auto_20559 ?auto_20558 ) ) ( ON ?auto_20557 ?auto_20559 ) ( CLEAR ?auto_20555 ) ( ON ?auto_20556 ?auto_20557 ) ( CLEAR ?auto_20556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20558 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20558 ?auto_20559 ?auto_20557 )
      ( MAKE-3PILE ?auto_20554 ?auto_20555 ?auto_20556 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20560 - BLOCK
      ?auto_20561 - BLOCK
      ?auto_20562 - BLOCK
    )
    :vars
    (
      ?auto_20564 - BLOCK
      ?auto_20565 - BLOCK
      ?auto_20563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20560 ) ( not ( = ?auto_20560 ?auto_20561 ) ) ( not ( = ?auto_20560 ?auto_20562 ) ) ( not ( = ?auto_20560 ?auto_20564 ) ) ( not ( = ?auto_20561 ?auto_20562 ) ) ( not ( = ?auto_20561 ?auto_20564 ) ) ( not ( = ?auto_20562 ?auto_20564 ) ) ( not ( = ?auto_20560 ?auto_20565 ) ) ( not ( = ?auto_20561 ?auto_20565 ) ) ( not ( = ?auto_20562 ?auto_20565 ) ) ( not ( = ?auto_20564 ?auto_20565 ) ) ( ON ?auto_20565 ?auto_20563 ) ( not ( = ?auto_20560 ?auto_20563 ) ) ( not ( = ?auto_20561 ?auto_20563 ) ) ( not ( = ?auto_20562 ?auto_20563 ) ) ( not ( = ?auto_20564 ?auto_20563 ) ) ( not ( = ?auto_20565 ?auto_20563 ) ) ( ON ?auto_20564 ?auto_20565 ) ( ON ?auto_20562 ?auto_20564 ) ( CLEAR ?auto_20562 ) ( ON-TABLE ?auto_20563 ) ( HOLDING ?auto_20561 ) ( CLEAR ?auto_20560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20560 ?auto_20561 )
      ( MAKE-3PILE ?auto_20560 ?auto_20561 ?auto_20562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20566 - BLOCK
      ?auto_20567 - BLOCK
      ?auto_20568 - BLOCK
    )
    :vars
    (
      ?auto_20571 - BLOCK
      ?auto_20569 - BLOCK
      ?auto_20570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20566 ) ( not ( = ?auto_20566 ?auto_20567 ) ) ( not ( = ?auto_20566 ?auto_20568 ) ) ( not ( = ?auto_20566 ?auto_20571 ) ) ( not ( = ?auto_20567 ?auto_20568 ) ) ( not ( = ?auto_20567 ?auto_20571 ) ) ( not ( = ?auto_20568 ?auto_20571 ) ) ( not ( = ?auto_20566 ?auto_20569 ) ) ( not ( = ?auto_20567 ?auto_20569 ) ) ( not ( = ?auto_20568 ?auto_20569 ) ) ( not ( = ?auto_20571 ?auto_20569 ) ) ( ON ?auto_20569 ?auto_20570 ) ( not ( = ?auto_20566 ?auto_20570 ) ) ( not ( = ?auto_20567 ?auto_20570 ) ) ( not ( = ?auto_20568 ?auto_20570 ) ) ( not ( = ?auto_20571 ?auto_20570 ) ) ( not ( = ?auto_20569 ?auto_20570 ) ) ( ON ?auto_20571 ?auto_20569 ) ( ON ?auto_20568 ?auto_20571 ) ( ON-TABLE ?auto_20570 ) ( CLEAR ?auto_20566 ) ( ON ?auto_20567 ?auto_20568 ) ( CLEAR ?auto_20567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20570 ?auto_20569 ?auto_20571 ?auto_20568 )
      ( MAKE-3PILE ?auto_20566 ?auto_20567 ?auto_20568 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20572 - BLOCK
      ?auto_20573 - BLOCK
      ?auto_20574 - BLOCK
    )
    :vars
    (
      ?auto_20577 - BLOCK
      ?auto_20576 - BLOCK
      ?auto_20575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20572 ?auto_20573 ) ) ( not ( = ?auto_20572 ?auto_20574 ) ) ( not ( = ?auto_20572 ?auto_20577 ) ) ( not ( = ?auto_20573 ?auto_20574 ) ) ( not ( = ?auto_20573 ?auto_20577 ) ) ( not ( = ?auto_20574 ?auto_20577 ) ) ( not ( = ?auto_20572 ?auto_20576 ) ) ( not ( = ?auto_20573 ?auto_20576 ) ) ( not ( = ?auto_20574 ?auto_20576 ) ) ( not ( = ?auto_20577 ?auto_20576 ) ) ( ON ?auto_20576 ?auto_20575 ) ( not ( = ?auto_20572 ?auto_20575 ) ) ( not ( = ?auto_20573 ?auto_20575 ) ) ( not ( = ?auto_20574 ?auto_20575 ) ) ( not ( = ?auto_20577 ?auto_20575 ) ) ( not ( = ?auto_20576 ?auto_20575 ) ) ( ON ?auto_20577 ?auto_20576 ) ( ON ?auto_20574 ?auto_20577 ) ( ON-TABLE ?auto_20575 ) ( ON ?auto_20573 ?auto_20574 ) ( CLEAR ?auto_20573 ) ( HOLDING ?auto_20572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20572 )
      ( MAKE-3PILE ?auto_20572 ?auto_20573 ?auto_20574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20578 - BLOCK
      ?auto_20579 - BLOCK
      ?auto_20580 - BLOCK
    )
    :vars
    (
      ?auto_20581 - BLOCK
      ?auto_20582 - BLOCK
      ?auto_20583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20578 ?auto_20579 ) ) ( not ( = ?auto_20578 ?auto_20580 ) ) ( not ( = ?auto_20578 ?auto_20581 ) ) ( not ( = ?auto_20579 ?auto_20580 ) ) ( not ( = ?auto_20579 ?auto_20581 ) ) ( not ( = ?auto_20580 ?auto_20581 ) ) ( not ( = ?auto_20578 ?auto_20582 ) ) ( not ( = ?auto_20579 ?auto_20582 ) ) ( not ( = ?auto_20580 ?auto_20582 ) ) ( not ( = ?auto_20581 ?auto_20582 ) ) ( ON ?auto_20582 ?auto_20583 ) ( not ( = ?auto_20578 ?auto_20583 ) ) ( not ( = ?auto_20579 ?auto_20583 ) ) ( not ( = ?auto_20580 ?auto_20583 ) ) ( not ( = ?auto_20581 ?auto_20583 ) ) ( not ( = ?auto_20582 ?auto_20583 ) ) ( ON ?auto_20581 ?auto_20582 ) ( ON ?auto_20580 ?auto_20581 ) ( ON-TABLE ?auto_20583 ) ( ON ?auto_20579 ?auto_20580 ) ( ON ?auto_20578 ?auto_20579 ) ( CLEAR ?auto_20578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20583 ?auto_20582 ?auto_20581 ?auto_20580 ?auto_20579 )
      ( MAKE-3PILE ?auto_20578 ?auto_20579 ?auto_20580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20586 - BLOCK
      ?auto_20587 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20587 ) ( CLEAR ?auto_20586 ) ( ON-TABLE ?auto_20586 ) ( not ( = ?auto_20586 ?auto_20587 ) ) )
    :subtasks
    ( ( !STACK ?auto_20587 ?auto_20586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20588 - BLOCK
      ?auto_20589 - BLOCK
    )
    :vars
    (
      ?auto_20590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20588 ) ( ON-TABLE ?auto_20588 ) ( not ( = ?auto_20588 ?auto_20589 ) ) ( ON ?auto_20589 ?auto_20590 ) ( CLEAR ?auto_20589 ) ( HAND-EMPTY ) ( not ( = ?auto_20588 ?auto_20590 ) ) ( not ( = ?auto_20589 ?auto_20590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20589 ?auto_20590 )
      ( MAKE-2PILE ?auto_20588 ?auto_20589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20591 - BLOCK
      ?auto_20592 - BLOCK
    )
    :vars
    (
      ?auto_20593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20591 ?auto_20592 ) ) ( ON ?auto_20592 ?auto_20593 ) ( CLEAR ?auto_20592 ) ( not ( = ?auto_20591 ?auto_20593 ) ) ( not ( = ?auto_20592 ?auto_20593 ) ) ( HOLDING ?auto_20591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20591 )
      ( MAKE-2PILE ?auto_20591 ?auto_20592 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20594 - BLOCK
      ?auto_20595 - BLOCK
    )
    :vars
    (
      ?auto_20596 - BLOCK
      ?auto_20597 - BLOCK
      ?auto_20598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20594 ?auto_20595 ) ) ( ON ?auto_20595 ?auto_20596 ) ( not ( = ?auto_20594 ?auto_20596 ) ) ( not ( = ?auto_20595 ?auto_20596 ) ) ( ON ?auto_20594 ?auto_20595 ) ( CLEAR ?auto_20594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20597 ) ( ON ?auto_20598 ?auto_20597 ) ( ON ?auto_20596 ?auto_20598 ) ( not ( = ?auto_20597 ?auto_20598 ) ) ( not ( = ?auto_20597 ?auto_20596 ) ) ( not ( = ?auto_20597 ?auto_20595 ) ) ( not ( = ?auto_20597 ?auto_20594 ) ) ( not ( = ?auto_20598 ?auto_20596 ) ) ( not ( = ?auto_20598 ?auto_20595 ) ) ( not ( = ?auto_20598 ?auto_20594 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20597 ?auto_20598 ?auto_20596 ?auto_20595 )
      ( MAKE-2PILE ?auto_20594 ?auto_20595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20599 - BLOCK
      ?auto_20600 - BLOCK
    )
    :vars
    (
      ?auto_20601 - BLOCK
      ?auto_20603 - BLOCK
      ?auto_20602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20599 ?auto_20600 ) ) ( ON ?auto_20600 ?auto_20601 ) ( not ( = ?auto_20599 ?auto_20601 ) ) ( not ( = ?auto_20600 ?auto_20601 ) ) ( ON-TABLE ?auto_20603 ) ( ON ?auto_20602 ?auto_20603 ) ( ON ?auto_20601 ?auto_20602 ) ( not ( = ?auto_20603 ?auto_20602 ) ) ( not ( = ?auto_20603 ?auto_20601 ) ) ( not ( = ?auto_20603 ?auto_20600 ) ) ( not ( = ?auto_20603 ?auto_20599 ) ) ( not ( = ?auto_20602 ?auto_20601 ) ) ( not ( = ?auto_20602 ?auto_20600 ) ) ( not ( = ?auto_20602 ?auto_20599 ) ) ( HOLDING ?auto_20599 ) ( CLEAR ?auto_20600 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20603 ?auto_20602 ?auto_20601 ?auto_20600 ?auto_20599 )
      ( MAKE-2PILE ?auto_20599 ?auto_20600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20604 - BLOCK
      ?auto_20605 - BLOCK
    )
    :vars
    (
      ?auto_20608 - BLOCK
      ?auto_20607 - BLOCK
      ?auto_20606 - BLOCK
      ?auto_20609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20604 ?auto_20605 ) ) ( ON ?auto_20605 ?auto_20608 ) ( not ( = ?auto_20604 ?auto_20608 ) ) ( not ( = ?auto_20605 ?auto_20608 ) ) ( ON-TABLE ?auto_20607 ) ( ON ?auto_20606 ?auto_20607 ) ( ON ?auto_20608 ?auto_20606 ) ( not ( = ?auto_20607 ?auto_20606 ) ) ( not ( = ?auto_20607 ?auto_20608 ) ) ( not ( = ?auto_20607 ?auto_20605 ) ) ( not ( = ?auto_20607 ?auto_20604 ) ) ( not ( = ?auto_20606 ?auto_20608 ) ) ( not ( = ?auto_20606 ?auto_20605 ) ) ( not ( = ?auto_20606 ?auto_20604 ) ) ( CLEAR ?auto_20605 ) ( ON ?auto_20604 ?auto_20609 ) ( CLEAR ?auto_20604 ) ( HAND-EMPTY ) ( not ( = ?auto_20604 ?auto_20609 ) ) ( not ( = ?auto_20605 ?auto_20609 ) ) ( not ( = ?auto_20608 ?auto_20609 ) ) ( not ( = ?auto_20607 ?auto_20609 ) ) ( not ( = ?auto_20606 ?auto_20609 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20604 ?auto_20609 )
      ( MAKE-2PILE ?auto_20604 ?auto_20605 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20610 - BLOCK
      ?auto_20611 - BLOCK
    )
    :vars
    (
      ?auto_20615 - BLOCK
      ?auto_20613 - BLOCK
      ?auto_20614 - BLOCK
      ?auto_20612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20610 ?auto_20611 ) ) ( not ( = ?auto_20610 ?auto_20615 ) ) ( not ( = ?auto_20611 ?auto_20615 ) ) ( ON-TABLE ?auto_20613 ) ( ON ?auto_20614 ?auto_20613 ) ( ON ?auto_20615 ?auto_20614 ) ( not ( = ?auto_20613 ?auto_20614 ) ) ( not ( = ?auto_20613 ?auto_20615 ) ) ( not ( = ?auto_20613 ?auto_20611 ) ) ( not ( = ?auto_20613 ?auto_20610 ) ) ( not ( = ?auto_20614 ?auto_20615 ) ) ( not ( = ?auto_20614 ?auto_20611 ) ) ( not ( = ?auto_20614 ?auto_20610 ) ) ( ON ?auto_20610 ?auto_20612 ) ( CLEAR ?auto_20610 ) ( not ( = ?auto_20610 ?auto_20612 ) ) ( not ( = ?auto_20611 ?auto_20612 ) ) ( not ( = ?auto_20615 ?auto_20612 ) ) ( not ( = ?auto_20613 ?auto_20612 ) ) ( not ( = ?auto_20614 ?auto_20612 ) ) ( HOLDING ?auto_20611 ) ( CLEAR ?auto_20615 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20613 ?auto_20614 ?auto_20615 ?auto_20611 )
      ( MAKE-2PILE ?auto_20610 ?auto_20611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20616 - BLOCK
      ?auto_20617 - BLOCK
    )
    :vars
    (
      ?auto_20620 - BLOCK
      ?auto_20621 - BLOCK
      ?auto_20619 - BLOCK
      ?auto_20618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20616 ?auto_20617 ) ) ( not ( = ?auto_20616 ?auto_20620 ) ) ( not ( = ?auto_20617 ?auto_20620 ) ) ( ON-TABLE ?auto_20621 ) ( ON ?auto_20619 ?auto_20621 ) ( ON ?auto_20620 ?auto_20619 ) ( not ( = ?auto_20621 ?auto_20619 ) ) ( not ( = ?auto_20621 ?auto_20620 ) ) ( not ( = ?auto_20621 ?auto_20617 ) ) ( not ( = ?auto_20621 ?auto_20616 ) ) ( not ( = ?auto_20619 ?auto_20620 ) ) ( not ( = ?auto_20619 ?auto_20617 ) ) ( not ( = ?auto_20619 ?auto_20616 ) ) ( ON ?auto_20616 ?auto_20618 ) ( not ( = ?auto_20616 ?auto_20618 ) ) ( not ( = ?auto_20617 ?auto_20618 ) ) ( not ( = ?auto_20620 ?auto_20618 ) ) ( not ( = ?auto_20621 ?auto_20618 ) ) ( not ( = ?auto_20619 ?auto_20618 ) ) ( CLEAR ?auto_20620 ) ( ON ?auto_20617 ?auto_20616 ) ( CLEAR ?auto_20617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20618 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20618 ?auto_20616 )
      ( MAKE-2PILE ?auto_20616 ?auto_20617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20622 - BLOCK
      ?auto_20623 - BLOCK
    )
    :vars
    (
      ?auto_20625 - BLOCK
      ?auto_20627 - BLOCK
      ?auto_20626 - BLOCK
      ?auto_20624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20622 ?auto_20623 ) ) ( not ( = ?auto_20622 ?auto_20625 ) ) ( not ( = ?auto_20623 ?auto_20625 ) ) ( ON-TABLE ?auto_20627 ) ( ON ?auto_20626 ?auto_20627 ) ( not ( = ?auto_20627 ?auto_20626 ) ) ( not ( = ?auto_20627 ?auto_20625 ) ) ( not ( = ?auto_20627 ?auto_20623 ) ) ( not ( = ?auto_20627 ?auto_20622 ) ) ( not ( = ?auto_20626 ?auto_20625 ) ) ( not ( = ?auto_20626 ?auto_20623 ) ) ( not ( = ?auto_20626 ?auto_20622 ) ) ( ON ?auto_20622 ?auto_20624 ) ( not ( = ?auto_20622 ?auto_20624 ) ) ( not ( = ?auto_20623 ?auto_20624 ) ) ( not ( = ?auto_20625 ?auto_20624 ) ) ( not ( = ?auto_20627 ?auto_20624 ) ) ( not ( = ?auto_20626 ?auto_20624 ) ) ( ON ?auto_20623 ?auto_20622 ) ( CLEAR ?auto_20623 ) ( ON-TABLE ?auto_20624 ) ( HOLDING ?auto_20625 ) ( CLEAR ?auto_20626 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20627 ?auto_20626 ?auto_20625 )
      ( MAKE-2PILE ?auto_20622 ?auto_20623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20628 - BLOCK
      ?auto_20629 - BLOCK
    )
    :vars
    (
      ?auto_20632 - BLOCK
      ?auto_20631 - BLOCK
      ?auto_20630 - BLOCK
      ?auto_20633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20628 ?auto_20629 ) ) ( not ( = ?auto_20628 ?auto_20632 ) ) ( not ( = ?auto_20629 ?auto_20632 ) ) ( ON-TABLE ?auto_20631 ) ( ON ?auto_20630 ?auto_20631 ) ( not ( = ?auto_20631 ?auto_20630 ) ) ( not ( = ?auto_20631 ?auto_20632 ) ) ( not ( = ?auto_20631 ?auto_20629 ) ) ( not ( = ?auto_20631 ?auto_20628 ) ) ( not ( = ?auto_20630 ?auto_20632 ) ) ( not ( = ?auto_20630 ?auto_20629 ) ) ( not ( = ?auto_20630 ?auto_20628 ) ) ( ON ?auto_20628 ?auto_20633 ) ( not ( = ?auto_20628 ?auto_20633 ) ) ( not ( = ?auto_20629 ?auto_20633 ) ) ( not ( = ?auto_20632 ?auto_20633 ) ) ( not ( = ?auto_20631 ?auto_20633 ) ) ( not ( = ?auto_20630 ?auto_20633 ) ) ( ON ?auto_20629 ?auto_20628 ) ( ON-TABLE ?auto_20633 ) ( CLEAR ?auto_20630 ) ( ON ?auto_20632 ?auto_20629 ) ( CLEAR ?auto_20632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20633 ?auto_20628 ?auto_20629 )
      ( MAKE-2PILE ?auto_20628 ?auto_20629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20634 - BLOCK
      ?auto_20635 - BLOCK
    )
    :vars
    (
      ?auto_20636 - BLOCK
      ?auto_20637 - BLOCK
      ?auto_20638 - BLOCK
      ?auto_20639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20634 ?auto_20635 ) ) ( not ( = ?auto_20634 ?auto_20636 ) ) ( not ( = ?auto_20635 ?auto_20636 ) ) ( ON-TABLE ?auto_20637 ) ( not ( = ?auto_20637 ?auto_20638 ) ) ( not ( = ?auto_20637 ?auto_20636 ) ) ( not ( = ?auto_20637 ?auto_20635 ) ) ( not ( = ?auto_20637 ?auto_20634 ) ) ( not ( = ?auto_20638 ?auto_20636 ) ) ( not ( = ?auto_20638 ?auto_20635 ) ) ( not ( = ?auto_20638 ?auto_20634 ) ) ( ON ?auto_20634 ?auto_20639 ) ( not ( = ?auto_20634 ?auto_20639 ) ) ( not ( = ?auto_20635 ?auto_20639 ) ) ( not ( = ?auto_20636 ?auto_20639 ) ) ( not ( = ?auto_20637 ?auto_20639 ) ) ( not ( = ?auto_20638 ?auto_20639 ) ) ( ON ?auto_20635 ?auto_20634 ) ( ON-TABLE ?auto_20639 ) ( ON ?auto_20636 ?auto_20635 ) ( CLEAR ?auto_20636 ) ( HOLDING ?auto_20638 ) ( CLEAR ?auto_20637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20637 ?auto_20638 )
      ( MAKE-2PILE ?auto_20634 ?auto_20635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20640 - BLOCK
      ?auto_20641 - BLOCK
    )
    :vars
    (
      ?auto_20645 - BLOCK
      ?auto_20644 - BLOCK
      ?auto_20642 - BLOCK
      ?auto_20643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20640 ?auto_20641 ) ) ( not ( = ?auto_20640 ?auto_20645 ) ) ( not ( = ?auto_20641 ?auto_20645 ) ) ( ON-TABLE ?auto_20644 ) ( not ( = ?auto_20644 ?auto_20642 ) ) ( not ( = ?auto_20644 ?auto_20645 ) ) ( not ( = ?auto_20644 ?auto_20641 ) ) ( not ( = ?auto_20644 ?auto_20640 ) ) ( not ( = ?auto_20642 ?auto_20645 ) ) ( not ( = ?auto_20642 ?auto_20641 ) ) ( not ( = ?auto_20642 ?auto_20640 ) ) ( ON ?auto_20640 ?auto_20643 ) ( not ( = ?auto_20640 ?auto_20643 ) ) ( not ( = ?auto_20641 ?auto_20643 ) ) ( not ( = ?auto_20645 ?auto_20643 ) ) ( not ( = ?auto_20644 ?auto_20643 ) ) ( not ( = ?auto_20642 ?auto_20643 ) ) ( ON ?auto_20641 ?auto_20640 ) ( ON-TABLE ?auto_20643 ) ( ON ?auto_20645 ?auto_20641 ) ( CLEAR ?auto_20644 ) ( ON ?auto_20642 ?auto_20645 ) ( CLEAR ?auto_20642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20643 ?auto_20640 ?auto_20641 ?auto_20645 )
      ( MAKE-2PILE ?auto_20640 ?auto_20641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20646 - BLOCK
      ?auto_20647 - BLOCK
    )
    :vars
    (
      ?auto_20651 - BLOCK
      ?auto_20650 - BLOCK
      ?auto_20648 - BLOCK
      ?auto_20649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20646 ?auto_20647 ) ) ( not ( = ?auto_20646 ?auto_20651 ) ) ( not ( = ?auto_20647 ?auto_20651 ) ) ( not ( = ?auto_20650 ?auto_20648 ) ) ( not ( = ?auto_20650 ?auto_20651 ) ) ( not ( = ?auto_20650 ?auto_20647 ) ) ( not ( = ?auto_20650 ?auto_20646 ) ) ( not ( = ?auto_20648 ?auto_20651 ) ) ( not ( = ?auto_20648 ?auto_20647 ) ) ( not ( = ?auto_20648 ?auto_20646 ) ) ( ON ?auto_20646 ?auto_20649 ) ( not ( = ?auto_20646 ?auto_20649 ) ) ( not ( = ?auto_20647 ?auto_20649 ) ) ( not ( = ?auto_20651 ?auto_20649 ) ) ( not ( = ?auto_20650 ?auto_20649 ) ) ( not ( = ?auto_20648 ?auto_20649 ) ) ( ON ?auto_20647 ?auto_20646 ) ( ON-TABLE ?auto_20649 ) ( ON ?auto_20651 ?auto_20647 ) ( ON ?auto_20648 ?auto_20651 ) ( CLEAR ?auto_20648 ) ( HOLDING ?auto_20650 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20650 )
      ( MAKE-2PILE ?auto_20646 ?auto_20647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20652 - BLOCK
      ?auto_20653 - BLOCK
    )
    :vars
    (
      ?auto_20654 - BLOCK
      ?auto_20657 - BLOCK
      ?auto_20655 - BLOCK
      ?auto_20656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20652 ?auto_20653 ) ) ( not ( = ?auto_20652 ?auto_20654 ) ) ( not ( = ?auto_20653 ?auto_20654 ) ) ( not ( = ?auto_20657 ?auto_20655 ) ) ( not ( = ?auto_20657 ?auto_20654 ) ) ( not ( = ?auto_20657 ?auto_20653 ) ) ( not ( = ?auto_20657 ?auto_20652 ) ) ( not ( = ?auto_20655 ?auto_20654 ) ) ( not ( = ?auto_20655 ?auto_20653 ) ) ( not ( = ?auto_20655 ?auto_20652 ) ) ( ON ?auto_20652 ?auto_20656 ) ( not ( = ?auto_20652 ?auto_20656 ) ) ( not ( = ?auto_20653 ?auto_20656 ) ) ( not ( = ?auto_20654 ?auto_20656 ) ) ( not ( = ?auto_20657 ?auto_20656 ) ) ( not ( = ?auto_20655 ?auto_20656 ) ) ( ON ?auto_20653 ?auto_20652 ) ( ON-TABLE ?auto_20656 ) ( ON ?auto_20654 ?auto_20653 ) ( ON ?auto_20655 ?auto_20654 ) ( ON ?auto_20657 ?auto_20655 ) ( CLEAR ?auto_20657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20656 ?auto_20652 ?auto_20653 ?auto_20654 ?auto_20655 )
      ( MAKE-2PILE ?auto_20652 ?auto_20653 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20660 - BLOCK
      ?auto_20661 - BLOCK
    )
    :vars
    (
      ?auto_20662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20662 ?auto_20661 ) ( CLEAR ?auto_20662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20660 ) ( ON ?auto_20661 ?auto_20660 ) ( not ( = ?auto_20660 ?auto_20661 ) ) ( not ( = ?auto_20660 ?auto_20662 ) ) ( not ( = ?auto_20661 ?auto_20662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20662 ?auto_20661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20663 - BLOCK
      ?auto_20664 - BLOCK
    )
    :vars
    (
      ?auto_20665 - BLOCK
      ?auto_20666 - BLOCK
      ?auto_20667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20665 ?auto_20664 ) ( CLEAR ?auto_20665 ) ( ON-TABLE ?auto_20663 ) ( ON ?auto_20664 ?auto_20663 ) ( not ( = ?auto_20663 ?auto_20664 ) ) ( not ( = ?auto_20663 ?auto_20665 ) ) ( not ( = ?auto_20664 ?auto_20665 ) ) ( HOLDING ?auto_20666 ) ( CLEAR ?auto_20667 ) ( not ( = ?auto_20663 ?auto_20666 ) ) ( not ( = ?auto_20663 ?auto_20667 ) ) ( not ( = ?auto_20664 ?auto_20666 ) ) ( not ( = ?auto_20664 ?auto_20667 ) ) ( not ( = ?auto_20665 ?auto_20666 ) ) ( not ( = ?auto_20665 ?auto_20667 ) ) ( not ( = ?auto_20666 ?auto_20667 ) ) )
    :subtasks
    ( ( !STACK ?auto_20666 ?auto_20667 )
      ( MAKE-2PILE ?auto_20663 ?auto_20664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20668 - BLOCK
      ?auto_20669 - BLOCK
    )
    :vars
    (
      ?auto_20670 - BLOCK
      ?auto_20671 - BLOCK
      ?auto_20672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20670 ?auto_20669 ) ( ON-TABLE ?auto_20668 ) ( ON ?auto_20669 ?auto_20668 ) ( not ( = ?auto_20668 ?auto_20669 ) ) ( not ( = ?auto_20668 ?auto_20670 ) ) ( not ( = ?auto_20669 ?auto_20670 ) ) ( CLEAR ?auto_20671 ) ( not ( = ?auto_20668 ?auto_20672 ) ) ( not ( = ?auto_20668 ?auto_20671 ) ) ( not ( = ?auto_20669 ?auto_20672 ) ) ( not ( = ?auto_20669 ?auto_20671 ) ) ( not ( = ?auto_20670 ?auto_20672 ) ) ( not ( = ?auto_20670 ?auto_20671 ) ) ( not ( = ?auto_20672 ?auto_20671 ) ) ( ON ?auto_20672 ?auto_20670 ) ( CLEAR ?auto_20672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20668 ?auto_20669 ?auto_20670 )
      ( MAKE-2PILE ?auto_20668 ?auto_20669 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20673 - BLOCK
      ?auto_20674 - BLOCK
    )
    :vars
    (
      ?auto_20676 - BLOCK
      ?auto_20677 - BLOCK
      ?auto_20675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20676 ?auto_20674 ) ( ON-TABLE ?auto_20673 ) ( ON ?auto_20674 ?auto_20673 ) ( not ( = ?auto_20673 ?auto_20674 ) ) ( not ( = ?auto_20673 ?auto_20676 ) ) ( not ( = ?auto_20674 ?auto_20676 ) ) ( not ( = ?auto_20673 ?auto_20677 ) ) ( not ( = ?auto_20673 ?auto_20675 ) ) ( not ( = ?auto_20674 ?auto_20677 ) ) ( not ( = ?auto_20674 ?auto_20675 ) ) ( not ( = ?auto_20676 ?auto_20677 ) ) ( not ( = ?auto_20676 ?auto_20675 ) ) ( not ( = ?auto_20677 ?auto_20675 ) ) ( ON ?auto_20677 ?auto_20676 ) ( CLEAR ?auto_20677 ) ( HOLDING ?auto_20675 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20675 )
      ( MAKE-2PILE ?auto_20673 ?auto_20674 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20678 - BLOCK
      ?auto_20679 - BLOCK
    )
    :vars
    (
      ?auto_20681 - BLOCK
      ?auto_20682 - BLOCK
      ?auto_20680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20681 ?auto_20679 ) ( ON-TABLE ?auto_20678 ) ( ON ?auto_20679 ?auto_20678 ) ( not ( = ?auto_20678 ?auto_20679 ) ) ( not ( = ?auto_20678 ?auto_20681 ) ) ( not ( = ?auto_20679 ?auto_20681 ) ) ( not ( = ?auto_20678 ?auto_20682 ) ) ( not ( = ?auto_20678 ?auto_20680 ) ) ( not ( = ?auto_20679 ?auto_20682 ) ) ( not ( = ?auto_20679 ?auto_20680 ) ) ( not ( = ?auto_20681 ?auto_20682 ) ) ( not ( = ?auto_20681 ?auto_20680 ) ) ( not ( = ?auto_20682 ?auto_20680 ) ) ( ON ?auto_20682 ?auto_20681 ) ( ON ?auto_20680 ?auto_20682 ) ( CLEAR ?auto_20680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20678 ?auto_20679 ?auto_20681 ?auto_20682 )
      ( MAKE-2PILE ?auto_20678 ?auto_20679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20683 - BLOCK
      ?auto_20684 - BLOCK
    )
    :vars
    (
      ?auto_20685 - BLOCK
      ?auto_20687 - BLOCK
      ?auto_20686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20685 ?auto_20684 ) ( ON-TABLE ?auto_20683 ) ( ON ?auto_20684 ?auto_20683 ) ( not ( = ?auto_20683 ?auto_20684 ) ) ( not ( = ?auto_20683 ?auto_20685 ) ) ( not ( = ?auto_20684 ?auto_20685 ) ) ( not ( = ?auto_20683 ?auto_20687 ) ) ( not ( = ?auto_20683 ?auto_20686 ) ) ( not ( = ?auto_20684 ?auto_20687 ) ) ( not ( = ?auto_20684 ?auto_20686 ) ) ( not ( = ?auto_20685 ?auto_20687 ) ) ( not ( = ?auto_20685 ?auto_20686 ) ) ( not ( = ?auto_20687 ?auto_20686 ) ) ( ON ?auto_20687 ?auto_20685 ) ( HOLDING ?auto_20686 ) ( CLEAR ?auto_20687 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20683 ?auto_20684 ?auto_20685 ?auto_20687 ?auto_20686 )
      ( MAKE-2PILE ?auto_20683 ?auto_20684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20688 - BLOCK
      ?auto_20689 - BLOCK
    )
    :vars
    (
      ?auto_20691 - BLOCK
      ?auto_20692 - BLOCK
      ?auto_20690 - BLOCK
      ?auto_20693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20691 ?auto_20689 ) ( ON-TABLE ?auto_20688 ) ( ON ?auto_20689 ?auto_20688 ) ( not ( = ?auto_20688 ?auto_20689 ) ) ( not ( = ?auto_20688 ?auto_20691 ) ) ( not ( = ?auto_20689 ?auto_20691 ) ) ( not ( = ?auto_20688 ?auto_20692 ) ) ( not ( = ?auto_20688 ?auto_20690 ) ) ( not ( = ?auto_20689 ?auto_20692 ) ) ( not ( = ?auto_20689 ?auto_20690 ) ) ( not ( = ?auto_20691 ?auto_20692 ) ) ( not ( = ?auto_20691 ?auto_20690 ) ) ( not ( = ?auto_20692 ?auto_20690 ) ) ( ON ?auto_20692 ?auto_20691 ) ( CLEAR ?auto_20692 ) ( ON ?auto_20690 ?auto_20693 ) ( CLEAR ?auto_20690 ) ( HAND-EMPTY ) ( not ( = ?auto_20688 ?auto_20693 ) ) ( not ( = ?auto_20689 ?auto_20693 ) ) ( not ( = ?auto_20691 ?auto_20693 ) ) ( not ( = ?auto_20692 ?auto_20693 ) ) ( not ( = ?auto_20690 ?auto_20693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20690 ?auto_20693 )
      ( MAKE-2PILE ?auto_20688 ?auto_20689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20694 - BLOCK
      ?auto_20695 - BLOCK
    )
    :vars
    (
      ?auto_20697 - BLOCK
      ?auto_20698 - BLOCK
      ?auto_20696 - BLOCK
      ?auto_20699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20697 ?auto_20695 ) ( ON-TABLE ?auto_20694 ) ( ON ?auto_20695 ?auto_20694 ) ( not ( = ?auto_20694 ?auto_20695 ) ) ( not ( = ?auto_20694 ?auto_20697 ) ) ( not ( = ?auto_20695 ?auto_20697 ) ) ( not ( = ?auto_20694 ?auto_20698 ) ) ( not ( = ?auto_20694 ?auto_20696 ) ) ( not ( = ?auto_20695 ?auto_20698 ) ) ( not ( = ?auto_20695 ?auto_20696 ) ) ( not ( = ?auto_20697 ?auto_20698 ) ) ( not ( = ?auto_20697 ?auto_20696 ) ) ( not ( = ?auto_20698 ?auto_20696 ) ) ( ON ?auto_20696 ?auto_20699 ) ( CLEAR ?auto_20696 ) ( not ( = ?auto_20694 ?auto_20699 ) ) ( not ( = ?auto_20695 ?auto_20699 ) ) ( not ( = ?auto_20697 ?auto_20699 ) ) ( not ( = ?auto_20698 ?auto_20699 ) ) ( not ( = ?auto_20696 ?auto_20699 ) ) ( HOLDING ?auto_20698 ) ( CLEAR ?auto_20697 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20694 ?auto_20695 ?auto_20697 ?auto_20698 )
      ( MAKE-2PILE ?auto_20694 ?auto_20695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20700 - BLOCK
      ?auto_20701 - BLOCK
    )
    :vars
    (
      ?auto_20705 - BLOCK
      ?auto_20702 - BLOCK
      ?auto_20703 - BLOCK
      ?auto_20704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20705 ?auto_20701 ) ( ON-TABLE ?auto_20700 ) ( ON ?auto_20701 ?auto_20700 ) ( not ( = ?auto_20700 ?auto_20701 ) ) ( not ( = ?auto_20700 ?auto_20705 ) ) ( not ( = ?auto_20701 ?auto_20705 ) ) ( not ( = ?auto_20700 ?auto_20702 ) ) ( not ( = ?auto_20700 ?auto_20703 ) ) ( not ( = ?auto_20701 ?auto_20702 ) ) ( not ( = ?auto_20701 ?auto_20703 ) ) ( not ( = ?auto_20705 ?auto_20702 ) ) ( not ( = ?auto_20705 ?auto_20703 ) ) ( not ( = ?auto_20702 ?auto_20703 ) ) ( ON ?auto_20703 ?auto_20704 ) ( not ( = ?auto_20700 ?auto_20704 ) ) ( not ( = ?auto_20701 ?auto_20704 ) ) ( not ( = ?auto_20705 ?auto_20704 ) ) ( not ( = ?auto_20702 ?auto_20704 ) ) ( not ( = ?auto_20703 ?auto_20704 ) ) ( CLEAR ?auto_20705 ) ( ON ?auto_20702 ?auto_20703 ) ( CLEAR ?auto_20702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20704 ?auto_20703 )
      ( MAKE-2PILE ?auto_20700 ?auto_20701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20718 - BLOCK
      ?auto_20719 - BLOCK
    )
    :vars
    (
      ?auto_20722 - BLOCK
      ?auto_20723 - BLOCK
      ?auto_20721 - BLOCK
      ?auto_20720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20718 ) ( not ( = ?auto_20718 ?auto_20719 ) ) ( not ( = ?auto_20718 ?auto_20722 ) ) ( not ( = ?auto_20719 ?auto_20722 ) ) ( not ( = ?auto_20718 ?auto_20723 ) ) ( not ( = ?auto_20718 ?auto_20721 ) ) ( not ( = ?auto_20719 ?auto_20723 ) ) ( not ( = ?auto_20719 ?auto_20721 ) ) ( not ( = ?auto_20722 ?auto_20723 ) ) ( not ( = ?auto_20722 ?auto_20721 ) ) ( not ( = ?auto_20723 ?auto_20721 ) ) ( ON ?auto_20721 ?auto_20720 ) ( not ( = ?auto_20718 ?auto_20720 ) ) ( not ( = ?auto_20719 ?auto_20720 ) ) ( not ( = ?auto_20722 ?auto_20720 ) ) ( not ( = ?auto_20723 ?auto_20720 ) ) ( not ( = ?auto_20721 ?auto_20720 ) ) ( ON ?auto_20723 ?auto_20721 ) ( ON-TABLE ?auto_20720 ) ( ON ?auto_20722 ?auto_20723 ) ( CLEAR ?auto_20722 ) ( HOLDING ?auto_20719 ) ( CLEAR ?auto_20718 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20718 ?auto_20719 ?auto_20722 )
      ( MAKE-2PILE ?auto_20718 ?auto_20719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20724 - BLOCK
      ?auto_20725 - BLOCK
    )
    :vars
    (
      ?auto_20728 - BLOCK
      ?auto_20727 - BLOCK
      ?auto_20729 - BLOCK
      ?auto_20726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20724 ) ( not ( = ?auto_20724 ?auto_20725 ) ) ( not ( = ?auto_20724 ?auto_20728 ) ) ( not ( = ?auto_20725 ?auto_20728 ) ) ( not ( = ?auto_20724 ?auto_20727 ) ) ( not ( = ?auto_20724 ?auto_20729 ) ) ( not ( = ?auto_20725 ?auto_20727 ) ) ( not ( = ?auto_20725 ?auto_20729 ) ) ( not ( = ?auto_20728 ?auto_20727 ) ) ( not ( = ?auto_20728 ?auto_20729 ) ) ( not ( = ?auto_20727 ?auto_20729 ) ) ( ON ?auto_20729 ?auto_20726 ) ( not ( = ?auto_20724 ?auto_20726 ) ) ( not ( = ?auto_20725 ?auto_20726 ) ) ( not ( = ?auto_20728 ?auto_20726 ) ) ( not ( = ?auto_20727 ?auto_20726 ) ) ( not ( = ?auto_20729 ?auto_20726 ) ) ( ON ?auto_20727 ?auto_20729 ) ( ON-TABLE ?auto_20726 ) ( ON ?auto_20728 ?auto_20727 ) ( CLEAR ?auto_20724 ) ( ON ?auto_20725 ?auto_20728 ) ( CLEAR ?auto_20725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20726 ?auto_20729 ?auto_20727 ?auto_20728 )
      ( MAKE-2PILE ?auto_20724 ?auto_20725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20730 - BLOCK
      ?auto_20731 - BLOCK
    )
    :vars
    (
      ?auto_20734 - BLOCK
      ?auto_20733 - BLOCK
      ?auto_20732 - BLOCK
      ?auto_20735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20730 ?auto_20731 ) ) ( not ( = ?auto_20730 ?auto_20734 ) ) ( not ( = ?auto_20731 ?auto_20734 ) ) ( not ( = ?auto_20730 ?auto_20733 ) ) ( not ( = ?auto_20730 ?auto_20732 ) ) ( not ( = ?auto_20731 ?auto_20733 ) ) ( not ( = ?auto_20731 ?auto_20732 ) ) ( not ( = ?auto_20734 ?auto_20733 ) ) ( not ( = ?auto_20734 ?auto_20732 ) ) ( not ( = ?auto_20733 ?auto_20732 ) ) ( ON ?auto_20732 ?auto_20735 ) ( not ( = ?auto_20730 ?auto_20735 ) ) ( not ( = ?auto_20731 ?auto_20735 ) ) ( not ( = ?auto_20734 ?auto_20735 ) ) ( not ( = ?auto_20733 ?auto_20735 ) ) ( not ( = ?auto_20732 ?auto_20735 ) ) ( ON ?auto_20733 ?auto_20732 ) ( ON-TABLE ?auto_20735 ) ( ON ?auto_20734 ?auto_20733 ) ( ON ?auto_20731 ?auto_20734 ) ( CLEAR ?auto_20731 ) ( HOLDING ?auto_20730 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20730 )
      ( MAKE-2PILE ?auto_20730 ?auto_20731 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20736 - BLOCK
      ?auto_20737 - BLOCK
    )
    :vars
    (
      ?auto_20740 - BLOCK
      ?auto_20739 - BLOCK
      ?auto_20741 - BLOCK
      ?auto_20738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20736 ?auto_20737 ) ) ( not ( = ?auto_20736 ?auto_20740 ) ) ( not ( = ?auto_20737 ?auto_20740 ) ) ( not ( = ?auto_20736 ?auto_20739 ) ) ( not ( = ?auto_20736 ?auto_20741 ) ) ( not ( = ?auto_20737 ?auto_20739 ) ) ( not ( = ?auto_20737 ?auto_20741 ) ) ( not ( = ?auto_20740 ?auto_20739 ) ) ( not ( = ?auto_20740 ?auto_20741 ) ) ( not ( = ?auto_20739 ?auto_20741 ) ) ( ON ?auto_20741 ?auto_20738 ) ( not ( = ?auto_20736 ?auto_20738 ) ) ( not ( = ?auto_20737 ?auto_20738 ) ) ( not ( = ?auto_20740 ?auto_20738 ) ) ( not ( = ?auto_20739 ?auto_20738 ) ) ( not ( = ?auto_20741 ?auto_20738 ) ) ( ON ?auto_20739 ?auto_20741 ) ( ON-TABLE ?auto_20738 ) ( ON ?auto_20740 ?auto_20739 ) ( ON ?auto_20737 ?auto_20740 ) ( ON ?auto_20736 ?auto_20737 ) ( CLEAR ?auto_20736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20738 ?auto_20741 ?auto_20739 ?auto_20740 ?auto_20737 )
      ( MAKE-2PILE ?auto_20736 ?auto_20737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20745 - BLOCK
      ?auto_20746 - BLOCK
      ?auto_20747 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20747 ) ( CLEAR ?auto_20746 ) ( ON-TABLE ?auto_20745 ) ( ON ?auto_20746 ?auto_20745 ) ( not ( = ?auto_20745 ?auto_20746 ) ) ( not ( = ?auto_20745 ?auto_20747 ) ) ( not ( = ?auto_20746 ?auto_20747 ) ) )
    :subtasks
    ( ( !STACK ?auto_20747 ?auto_20746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20748 - BLOCK
      ?auto_20749 - BLOCK
      ?auto_20750 - BLOCK
    )
    :vars
    (
      ?auto_20751 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20749 ) ( ON-TABLE ?auto_20748 ) ( ON ?auto_20749 ?auto_20748 ) ( not ( = ?auto_20748 ?auto_20749 ) ) ( not ( = ?auto_20748 ?auto_20750 ) ) ( not ( = ?auto_20749 ?auto_20750 ) ) ( ON ?auto_20750 ?auto_20751 ) ( CLEAR ?auto_20750 ) ( HAND-EMPTY ) ( not ( = ?auto_20748 ?auto_20751 ) ) ( not ( = ?auto_20749 ?auto_20751 ) ) ( not ( = ?auto_20750 ?auto_20751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20750 ?auto_20751 )
      ( MAKE-3PILE ?auto_20748 ?auto_20749 ?auto_20750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20752 - BLOCK
      ?auto_20753 - BLOCK
      ?auto_20754 - BLOCK
    )
    :vars
    (
      ?auto_20755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20752 ) ( not ( = ?auto_20752 ?auto_20753 ) ) ( not ( = ?auto_20752 ?auto_20754 ) ) ( not ( = ?auto_20753 ?auto_20754 ) ) ( ON ?auto_20754 ?auto_20755 ) ( CLEAR ?auto_20754 ) ( not ( = ?auto_20752 ?auto_20755 ) ) ( not ( = ?auto_20753 ?auto_20755 ) ) ( not ( = ?auto_20754 ?auto_20755 ) ) ( HOLDING ?auto_20753 ) ( CLEAR ?auto_20752 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20752 ?auto_20753 )
      ( MAKE-3PILE ?auto_20752 ?auto_20753 ?auto_20754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20756 - BLOCK
      ?auto_20757 - BLOCK
      ?auto_20758 - BLOCK
    )
    :vars
    (
      ?auto_20759 - BLOCK
      ?auto_20760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20756 ) ( not ( = ?auto_20756 ?auto_20757 ) ) ( not ( = ?auto_20756 ?auto_20758 ) ) ( not ( = ?auto_20757 ?auto_20758 ) ) ( ON ?auto_20758 ?auto_20759 ) ( not ( = ?auto_20756 ?auto_20759 ) ) ( not ( = ?auto_20757 ?auto_20759 ) ) ( not ( = ?auto_20758 ?auto_20759 ) ) ( CLEAR ?auto_20756 ) ( ON ?auto_20757 ?auto_20758 ) ( CLEAR ?auto_20757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20760 ) ( ON ?auto_20759 ?auto_20760 ) ( not ( = ?auto_20760 ?auto_20759 ) ) ( not ( = ?auto_20760 ?auto_20758 ) ) ( not ( = ?auto_20760 ?auto_20757 ) ) ( not ( = ?auto_20756 ?auto_20760 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20760 ?auto_20759 ?auto_20758 )
      ( MAKE-3PILE ?auto_20756 ?auto_20757 ?auto_20758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20761 - BLOCK
      ?auto_20762 - BLOCK
      ?auto_20763 - BLOCK
    )
    :vars
    (
      ?auto_20765 - BLOCK
      ?auto_20764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20761 ?auto_20762 ) ) ( not ( = ?auto_20761 ?auto_20763 ) ) ( not ( = ?auto_20762 ?auto_20763 ) ) ( ON ?auto_20763 ?auto_20765 ) ( not ( = ?auto_20761 ?auto_20765 ) ) ( not ( = ?auto_20762 ?auto_20765 ) ) ( not ( = ?auto_20763 ?auto_20765 ) ) ( ON ?auto_20762 ?auto_20763 ) ( CLEAR ?auto_20762 ) ( ON-TABLE ?auto_20764 ) ( ON ?auto_20765 ?auto_20764 ) ( not ( = ?auto_20764 ?auto_20765 ) ) ( not ( = ?auto_20764 ?auto_20763 ) ) ( not ( = ?auto_20764 ?auto_20762 ) ) ( not ( = ?auto_20761 ?auto_20764 ) ) ( HOLDING ?auto_20761 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20761 )
      ( MAKE-3PILE ?auto_20761 ?auto_20762 ?auto_20763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20766 - BLOCK
      ?auto_20767 - BLOCK
      ?auto_20768 - BLOCK
    )
    :vars
    (
      ?auto_20770 - BLOCK
      ?auto_20769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20766 ?auto_20767 ) ) ( not ( = ?auto_20766 ?auto_20768 ) ) ( not ( = ?auto_20767 ?auto_20768 ) ) ( ON ?auto_20768 ?auto_20770 ) ( not ( = ?auto_20766 ?auto_20770 ) ) ( not ( = ?auto_20767 ?auto_20770 ) ) ( not ( = ?auto_20768 ?auto_20770 ) ) ( ON ?auto_20767 ?auto_20768 ) ( ON-TABLE ?auto_20769 ) ( ON ?auto_20770 ?auto_20769 ) ( not ( = ?auto_20769 ?auto_20770 ) ) ( not ( = ?auto_20769 ?auto_20768 ) ) ( not ( = ?auto_20769 ?auto_20767 ) ) ( not ( = ?auto_20766 ?auto_20769 ) ) ( ON ?auto_20766 ?auto_20767 ) ( CLEAR ?auto_20766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20769 ?auto_20770 ?auto_20768 ?auto_20767 )
      ( MAKE-3PILE ?auto_20766 ?auto_20767 ?auto_20768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20771 - BLOCK
      ?auto_20772 - BLOCK
      ?auto_20773 - BLOCK
    )
    :vars
    (
      ?auto_20774 - BLOCK
      ?auto_20775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20771 ?auto_20772 ) ) ( not ( = ?auto_20771 ?auto_20773 ) ) ( not ( = ?auto_20772 ?auto_20773 ) ) ( ON ?auto_20773 ?auto_20774 ) ( not ( = ?auto_20771 ?auto_20774 ) ) ( not ( = ?auto_20772 ?auto_20774 ) ) ( not ( = ?auto_20773 ?auto_20774 ) ) ( ON ?auto_20772 ?auto_20773 ) ( ON-TABLE ?auto_20775 ) ( ON ?auto_20774 ?auto_20775 ) ( not ( = ?auto_20775 ?auto_20774 ) ) ( not ( = ?auto_20775 ?auto_20773 ) ) ( not ( = ?auto_20775 ?auto_20772 ) ) ( not ( = ?auto_20771 ?auto_20775 ) ) ( HOLDING ?auto_20771 ) ( CLEAR ?auto_20772 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20775 ?auto_20774 ?auto_20773 ?auto_20772 ?auto_20771 )
      ( MAKE-3PILE ?auto_20771 ?auto_20772 ?auto_20773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20776 - BLOCK
      ?auto_20777 - BLOCK
      ?auto_20778 - BLOCK
    )
    :vars
    (
      ?auto_20780 - BLOCK
      ?auto_20779 - BLOCK
      ?auto_20781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20776 ?auto_20777 ) ) ( not ( = ?auto_20776 ?auto_20778 ) ) ( not ( = ?auto_20777 ?auto_20778 ) ) ( ON ?auto_20778 ?auto_20780 ) ( not ( = ?auto_20776 ?auto_20780 ) ) ( not ( = ?auto_20777 ?auto_20780 ) ) ( not ( = ?auto_20778 ?auto_20780 ) ) ( ON ?auto_20777 ?auto_20778 ) ( ON-TABLE ?auto_20779 ) ( ON ?auto_20780 ?auto_20779 ) ( not ( = ?auto_20779 ?auto_20780 ) ) ( not ( = ?auto_20779 ?auto_20778 ) ) ( not ( = ?auto_20779 ?auto_20777 ) ) ( not ( = ?auto_20776 ?auto_20779 ) ) ( CLEAR ?auto_20777 ) ( ON ?auto_20776 ?auto_20781 ) ( CLEAR ?auto_20776 ) ( HAND-EMPTY ) ( not ( = ?auto_20776 ?auto_20781 ) ) ( not ( = ?auto_20777 ?auto_20781 ) ) ( not ( = ?auto_20778 ?auto_20781 ) ) ( not ( = ?auto_20780 ?auto_20781 ) ) ( not ( = ?auto_20779 ?auto_20781 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20776 ?auto_20781 )
      ( MAKE-3PILE ?auto_20776 ?auto_20777 ?auto_20778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20782 - BLOCK
      ?auto_20783 - BLOCK
      ?auto_20784 - BLOCK
    )
    :vars
    (
      ?auto_20786 - BLOCK
      ?auto_20785 - BLOCK
      ?auto_20787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20782 ?auto_20783 ) ) ( not ( = ?auto_20782 ?auto_20784 ) ) ( not ( = ?auto_20783 ?auto_20784 ) ) ( ON ?auto_20784 ?auto_20786 ) ( not ( = ?auto_20782 ?auto_20786 ) ) ( not ( = ?auto_20783 ?auto_20786 ) ) ( not ( = ?auto_20784 ?auto_20786 ) ) ( ON-TABLE ?auto_20785 ) ( ON ?auto_20786 ?auto_20785 ) ( not ( = ?auto_20785 ?auto_20786 ) ) ( not ( = ?auto_20785 ?auto_20784 ) ) ( not ( = ?auto_20785 ?auto_20783 ) ) ( not ( = ?auto_20782 ?auto_20785 ) ) ( ON ?auto_20782 ?auto_20787 ) ( CLEAR ?auto_20782 ) ( not ( = ?auto_20782 ?auto_20787 ) ) ( not ( = ?auto_20783 ?auto_20787 ) ) ( not ( = ?auto_20784 ?auto_20787 ) ) ( not ( = ?auto_20786 ?auto_20787 ) ) ( not ( = ?auto_20785 ?auto_20787 ) ) ( HOLDING ?auto_20783 ) ( CLEAR ?auto_20784 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20785 ?auto_20786 ?auto_20784 ?auto_20783 )
      ( MAKE-3PILE ?auto_20782 ?auto_20783 ?auto_20784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20788 - BLOCK
      ?auto_20789 - BLOCK
      ?auto_20790 - BLOCK
    )
    :vars
    (
      ?auto_20792 - BLOCK
      ?auto_20791 - BLOCK
      ?auto_20793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20788 ?auto_20789 ) ) ( not ( = ?auto_20788 ?auto_20790 ) ) ( not ( = ?auto_20789 ?auto_20790 ) ) ( ON ?auto_20790 ?auto_20792 ) ( not ( = ?auto_20788 ?auto_20792 ) ) ( not ( = ?auto_20789 ?auto_20792 ) ) ( not ( = ?auto_20790 ?auto_20792 ) ) ( ON-TABLE ?auto_20791 ) ( ON ?auto_20792 ?auto_20791 ) ( not ( = ?auto_20791 ?auto_20792 ) ) ( not ( = ?auto_20791 ?auto_20790 ) ) ( not ( = ?auto_20791 ?auto_20789 ) ) ( not ( = ?auto_20788 ?auto_20791 ) ) ( ON ?auto_20788 ?auto_20793 ) ( not ( = ?auto_20788 ?auto_20793 ) ) ( not ( = ?auto_20789 ?auto_20793 ) ) ( not ( = ?auto_20790 ?auto_20793 ) ) ( not ( = ?auto_20792 ?auto_20793 ) ) ( not ( = ?auto_20791 ?auto_20793 ) ) ( CLEAR ?auto_20790 ) ( ON ?auto_20789 ?auto_20788 ) ( CLEAR ?auto_20789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20793 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20793 ?auto_20788 )
      ( MAKE-3PILE ?auto_20788 ?auto_20789 ?auto_20790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20794 - BLOCK
      ?auto_20795 - BLOCK
      ?auto_20796 - BLOCK
    )
    :vars
    (
      ?auto_20799 - BLOCK
      ?auto_20797 - BLOCK
      ?auto_20798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20794 ?auto_20795 ) ) ( not ( = ?auto_20794 ?auto_20796 ) ) ( not ( = ?auto_20795 ?auto_20796 ) ) ( not ( = ?auto_20794 ?auto_20799 ) ) ( not ( = ?auto_20795 ?auto_20799 ) ) ( not ( = ?auto_20796 ?auto_20799 ) ) ( ON-TABLE ?auto_20797 ) ( ON ?auto_20799 ?auto_20797 ) ( not ( = ?auto_20797 ?auto_20799 ) ) ( not ( = ?auto_20797 ?auto_20796 ) ) ( not ( = ?auto_20797 ?auto_20795 ) ) ( not ( = ?auto_20794 ?auto_20797 ) ) ( ON ?auto_20794 ?auto_20798 ) ( not ( = ?auto_20794 ?auto_20798 ) ) ( not ( = ?auto_20795 ?auto_20798 ) ) ( not ( = ?auto_20796 ?auto_20798 ) ) ( not ( = ?auto_20799 ?auto_20798 ) ) ( not ( = ?auto_20797 ?auto_20798 ) ) ( ON ?auto_20795 ?auto_20794 ) ( CLEAR ?auto_20795 ) ( ON-TABLE ?auto_20798 ) ( HOLDING ?auto_20796 ) ( CLEAR ?auto_20799 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20797 ?auto_20799 ?auto_20796 )
      ( MAKE-3PILE ?auto_20794 ?auto_20795 ?auto_20796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20800 - BLOCK
      ?auto_20801 - BLOCK
      ?auto_20802 - BLOCK
    )
    :vars
    (
      ?auto_20803 - BLOCK
      ?auto_20804 - BLOCK
      ?auto_20805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20800 ?auto_20801 ) ) ( not ( = ?auto_20800 ?auto_20802 ) ) ( not ( = ?auto_20801 ?auto_20802 ) ) ( not ( = ?auto_20800 ?auto_20803 ) ) ( not ( = ?auto_20801 ?auto_20803 ) ) ( not ( = ?auto_20802 ?auto_20803 ) ) ( ON-TABLE ?auto_20804 ) ( ON ?auto_20803 ?auto_20804 ) ( not ( = ?auto_20804 ?auto_20803 ) ) ( not ( = ?auto_20804 ?auto_20802 ) ) ( not ( = ?auto_20804 ?auto_20801 ) ) ( not ( = ?auto_20800 ?auto_20804 ) ) ( ON ?auto_20800 ?auto_20805 ) ( not ( = ?auto_20800 ?auto_20805 ) ) ( not ( = ?auto_20801 ?auto_20805 ) ) ( not ( = ?auto_20802 ?auto_20805 ) ) ( not ( = ?auto_20803 ?auto_20805 ) ) ( not ( = ?auto_20804 ?auto_20805 ) ) ( ON ?auto_20801 ?auto_20800 ) ( ON-TABLE ?auto_20805 ) ( CLEAR ?auto_20803 ) ( ON ?auto_20802 ?auto_20801 ) ( CLEAR ?auto_20802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20805 ?auto_20800 ?auto_20801 )
      ( MAKE-3PILE ?auto_20800 ?auto_20801 ?auto_20802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20806 - BLOCK
      ?auto_20807 - BLOCK
      ?auto_20808 - BLOCK
    )
    :vars
    (
      ?auto_20810 - BLOCK
      ?auto_20809 - BLOCK
      ?auto_20811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20806 ?auto_20807 ) ) ( not ( = ?auto_20806 ?auto_20808 ) ) ( not ( = ?auto_20807 ?auto_20808 ) ) ( not ( = ?auto_20806 ?auto_20810 ) ) ( not ( = ?auto_20807 ?auto_20810 ) ) ( not ( = ?auto_20808 ?auto_20810 ) ) ( ON-TABLE ?auto_20809 ) ( not ( = ?auto_20809 ?auto_20810 ) ) ( not ( = ?auto_20809 ?auto_20808 ) ) ( not ( = ?auto_20809 ?auto_20807 ) ) ( not ( = ?auto_20806 ?auto_20809 ) ) ( ON ?auto_20806 ?auto_20811 ) ( not ( = ?auto_20806 ?auto_20811 ) ) ( not ( = ?auto_20807 ?auto_20811 ) ) ( not ( = ?auto_20808 ?auto_20811 ) ) ( not ( = ?auto_20810 ?auto_20811 ) ) ( not ( = ?auto_20809 ?auto_20811 ) ) ( ON ?auto_20807 ?auto_20806 ) ( ON-TABLE ?auto_20811 ) ( ON ?auto_20808 ?auto_20807 ) ( CLEAR ?auto_20808 ) ( HOLDING ?auto_20810 ) ( CLEAR ?auto_20809 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20809 ?auto_20810 )
      ( MAKE-3PILE ?auto_20806 ?auto_20807 ?auto_20808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20812 - BLOCK
      ?auto_20813 - BLOCK
      ?auto_20814 - BLOCK
    )
    :vars
    (
      ?auto_20817 - BLOCK
      ?auto_20815 - BLOCK
      ?auto_20816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20812 ?auto_20813 ) ) ( not ( = ?auto_20812 ?auto_20814 ) ) ( not ( = ?auto_20813 ?auto_20814 ) ) ( not ( = ?auto_20812 ?auto_20817 ) ) ( not ( = ?auto_20813 ?auto_20817 ) ) ( not ( = ?auto_20814 ?auto_20817 ) ) ( ON-TABLE ?auto_20815 ) ( not ( = ?auto_20815 ?auto_20817 ) ) ( not ( = ?auto_20815 ?auto_20814 ) ) ( not ( = ?auto_20815 ?auto_20813 ) ) ( not ( = ?auto_20812 ?auto_20815 ) ) ( ON ?auto_20812 ?auto_20816 ) ( not ( = ?auto_20812 ?auto_20816 ) ) ( not ( = ?auto_20813 ?auto_20816 ) ) ( not ( = ?auto_20814 ?auto_20816 ) ) ( not ( = ?auto_20817 ?auto_20816 ) ) ( not ( = ?auto_20815 ?auto_20816 ) ) ( ON ?auto_20813 ?auto_20812 ) ( ON-TABLE ?auto_20816 ) ( ON ?auto_20814 ?auto_20813 ) ( CLEAR ?auto_20815 ) ( ON ?auto_20817 ?auto_20814 ) ( CLEAR ?auto_20817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20816 ?auto_20812 ?auto_20813 ?auto_20814 )
      ( MAKE-3PILE ?auto_20812 ?auto_20813 ?auto_20814 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20818 - BLOCK
      ?auto_20819 - BLOCK
      ?auto_20820 - BLOCK
    )
    :vars
    (
      ?auto_20822 - BLOCK
      ?auto_20821 - BLOCK
      ?auto_20823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20818 ?auto_20819 ) ) ( not ( = ?auto_20818 ?auto_20820 ) ) ( not ( = ?auto_20819 ?auto_20820 ) ) ( not ( = ?auto_20818 ?auto_20822 ) ) ( not ( = ?auto_20819 ?auto_20822 ) ) ( not ( = ?auto_20820 ?auto_20822 ) ) ( not ( = ?auto_20821 ?auto_20822 ) ) ( not ( = ?auto_20821 ?auto_20820 ) ) ( not ( = ?auto_20821 ?auto_20819 ) ) ( not ( = ?auto_20818 ?auto_20821 ) ) ( ON ?auto_20818 ?auto_20823 ) ( not ( = ?auto_20818 ?auto_20823 ) ) ( not ( = ?auto_20819 ?auto_20823 ) ) ( not ( = ?auto_20820 ?auto_20823 ) ) ( not ( = ?auto_20822 ?auto_20823 ) ) ( not ( = ?auto_20821 ?auto_20823 ) ) ( ON ?auto_20819 ?auto_20818 ) ( ON-TABLE ?auto_20823 ) ( ON ?auto_20820 ?auto_20819 ) ( ON ?auto_20822 ?auto_20820 ) ( CLEAR ?auto_20822 ) ( HOLDING ?auto_20821 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20821 )
      ( MAKE-3PILE ?auto_20818 ?auto_20819 ?auto_20820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_20824 - BLOCK
      ?auto_20825 - BLOCK
      ?auto_20826 - BLOCK
    )
    :vars
    (
      ?auto_20828 - BLOCK
      ?auto_20829 - BLOCK
      ?auto_20827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20824 ?auto_20825 ) ) ( not ( = ?auto_20824 ?auto_20826 ) ) ( not ( = ?auto_20825 ?auto_20826 ) ) ( not ( = ?auto_20824 ?auto_20828 ) ) ( not ( = ?auto_20825 ?auto_20828 ) ) ( not ( = ?auto_20826 ?auto_20828 ) ) ( not ( = ?auto_20829 ?auto_20828 ) ) ( not ( = ?auto_20829 ?auto_20826 ) ) ( not ( = ?auto_20829 ?auto_20825 ) ) ( not ( = ?auto_20824 ?auto_20829 ) ) ( ON ?auto_20824 ?auto_20827 ) ( not ( = ?auto_20824 ?auto_20827 ) ) ( not ( = ?auto_20825 ?auto_20827 ) ) ( not ( = ?auto_20826 ?auto_20827 ) ) ( not ( = ?auto_20828 ?auto_20827 ) ) ( not ( = ?auto_20829 ?auto_20827 ) ) ( ON ?auto_20825 ?auto_20824 ) ( ON-TABLE ?auto_20827 ) ( ON ?auto_20826 ?auto_20825 ) ( ON ?auto_20828 ?auto_20826 ) ( ON ?auto_20829 ?auto_20828 ) ( CLEAR ?auto_20829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20827 ?auto_20824 ?auto_20825 ?auto_20826 ?auto_20828 )
      ( MAKE-3PILE ?auto_20824 ?auto_20825 ?auto_20826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20831 - BLOCK
    )
    :vars
    (
      ?auto_20832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20832 ?auto_20831 ) ( CLEAR ?auto_20832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20831 ) ( not ( = ?auto_20831 ?auto_20832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20832 ?auto_20831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20833 - BLOCK
    )
    :vars
    (
      ?auto_20834 - BLOCK
      ?auto_20835 - BLOCK
      ?auto_20836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20834 ?auto_20833 ) ( CLEAR ?auto_20834 ) ( ON-TABLE ?auto_20833 ) ( not ( = ?auto_20833 ?auto_20834 ) ) ( HOLDING ?auto_20835 ) ( CLEAR ?auto_20836 ) ( not ( = ?auto_20833 ?auto_20835 ) ) ( not ( = ?auto_20833 ?auto_20836 ) ) ( not ( = ?auto_20834 ?auto_20835 ) ) ( not ( = ?auto_20834 ?auto_20836 ) ) ( not ( = ?auto_20835 ?auto_20836 ) ) )
    :subtasks
    ( ( !STACK ?auto_20835 ?auto_20836 )
      ( MAKE-1PILE ?auto_20833 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20837 - BLOCK
    )
    :vars
    (
      ?auto_20839 - BLOCK
      ?auto_20840 - BLOCK
      ?auto_20838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20839 ?auto_20837 ) ( ON-TABLE ?auto_20837 ) ( not ( = ?auto_20837 ?auto_20839 ) ) ( CLEAR ?auto_20840 ) ( not ( = ?auto_20837 ?auto_20838 ) ) ( not ( = ?auto_20837 ?auto_20840 ) ) ( not ( = ?auto_20839 ?auto_20838 ) ) ( not ( = ?auto_20839 ?auto_20840 ) ) ( not ( = ?auto_20838 ?auto_20840 ) ) ( ON ?auto_20838 ?auto_20839 ) ( CLEAR ?auto_20838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20837 ?auto_20839 )
      ( MAKE-1PILE ?auto_20837 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20841 - BLOCK
    )
    :vars
    (
      ?auto_20843 - BLOCK
      ?auto_20842 - BLOCK
      ?auto_20844 - BLOCK
      ?auto_20845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20843 ?auto_20841 ) ( ON-TABLE ?auto_20841 ) ( not ( = ?auto_20841 ?auto_20843 ) ) ( not ( = ?auto_20841 ?auto_20842 ) ) ( not ( = ?auto_20841 ?auto_20844 ) ) ( not ( = ?auto_20843 ?auto_20842 ) ) ( not ( = ?auto_20843 ?auto_20844 ) ) ( not ( = ?auto_20842 ?auto_20844 ) ) ( ON ?auto_20842 ?auto_20843 ) ( CLEAR ?auto_20842 ) ( HOLDING ?auto_20844 ) ( CLEAR ?auto_20845 ) ( ON-TABLE ?auto_20845 ) ( not ( = ?auto_20845 ?auto_20844 ) ) ( not ( = ?auto_20841 ?auto_20845 ) ) ( not ( = ?auto_20843 ?auto_20845 ) ) ( not ( = ?auto_20842 ?auto_20845 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20845 ?auto_20844 )
      ( MAKE-1PILE ?auto_20841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20846 - BLOCK
    )
    :vars
    (
      ?auto_20847 - BLOCK
      ?auto_20849 - BLOCK
      ?auto_20848 - BLOCK
      ?auto_20850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20847 ?auto_20846 ) ( ON-TABLE ?auto_20846 ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20846 ?auto_20849 ) ) ( not ( = ?auto_20846 ?auto_20848 ) ) ( not ( = ?auto_20847 ?auto_20849 ) ) ( not ( = ?auto_20847 ?auto_20848 ) ) ( not ( = ?auto_20849 ?auto_20848 ) ) ( ON ?auto_20849 ?auto_20847 ) ( CLEAR ?auto_20850 ) ( ON-TABLE ?auto_20850 ) ( not ( = ?auto_20850 ?auto_20848 ) ) ( not ( = ?auto_20846 ?auto_20850 ) ) ( not ( = ?auto_20847 ?auto_20850 ) ) ( not ( = ?auto_20849 ?auto_20850 ) ) ( ON ?auto_20848 ?auto_20849 ) ( CLEAR ?auto_20848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20846 ?auto_20847 ?auto_20849 )
      ( MAKE-1PILE ?auto_20846 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20851 - BLOCK
    )
    :vars
    (
      ?auto_20854 - BLOCK
      ?auto_20852 - BLOCK
      ?auto_20853 - BLOCK
      ?auto_20855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20854 ?auto_20851 ) ( ON-TABLE ?auto_20851 ) ( not ( = ?auto_20851 ?auto_20854 ) ) ( not ( = ?auto_20851 ?auto_20852 ) ) ( not ( = ?auto_20851 ?auto_20853 ) ) ( not ( = ?auto_20854 ?auto_20852 ) ) ( not ( = ?auto_20854 ?auto_20853 ) ) ( not ( = ?auto_20852 ?auto_20853 ) ) ( ON ?auto_20852 ?auto_20854 ) ( not ( = ?auto_20855 ?auto_20853 ) ) ( not ( = ?auto_20851 ?auto_20855 ) ) ( not ( = ?auto_20854 ?auto_20855 ) ) ( not ( = ?auto_20852 ?auto_20855 ) ) ( ON ?auto_20853 ?auto_20852 ) ( CLEAR ?auto_20853 ) ( HOLDING ?auto_20855 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20855 )
      ( MAKE-1PILE ?auto_20851 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20856 - BLOCK
    )
    :vars
    (
      ?auto_20859 - BLOCK
      ?auto_20857 - BLOCK
      ?auto_20858 - BLOCK
      ?auto_20860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20859 ?auto_20856 ) ( ON-TABLE ?auto_20856 ) ( not ( = ?auto_20856 ?auto_20859 ) ) ( not ( = ?auto_20856 ?auto_20857 ) ) ( not ( = ?auto_20856 ?auto_20858 ) ) ( not ( = ?auto_20859 ?auto_20857 ) ) ( not ( = ?auto_20859 ?auto_20858 ) ) ( not ( = ?auto_20857 ?auto_20858 ) ) ( ON ?auto_20857 ?auto_20859 ) ( not ( = ?auto_20860 ?auto_20858 ) ) ( not ( = ?auto_20856 ?auto_20860 ) ) ( not ( = ?auto_20859 ?auto_20860 ) ) ( not ( = ?auto_20857 ?auto_20860 ) ) ( ON ?auto_20858 ?auto_20857 ) ( ON ?auto_20860 ?auto_20858 ) ( CLEAR ?auto_20860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20856 ?auto_20859 ?auto_20857 ?auto_20858 )
      ( MAKE-1PILE ?auto_20856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20861 - BLOCK
    )
    :vars
    (
      ?auto_20862 - BLOCK
      ?auto_20864 - BLOCK
      ?auto_20863 - BLOCK
      ?auto_20865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20862 ?auto_20861 ) ( ON-TABLE ?auto_20861 ) ( not ( = ?auto_20861 ?auto_20862 ) ) ( not ( = ?auto_20861 ?auto_20864 ) ) ( not ( = ?auto_20861 ?auto_20863 ) ) ( not ( = ?auto_20862 ?auto_20864 ) ) ( not ( = ?auto_20862 ?auto_20863 ) ) ( not ( = ?auto_20864 ?auto_20863 ) ) ( ON ?auto_20864 ?auto_20862 ) ( not ( = ?auto_20865 ?auto_20863 ) ) ( not ( = ?auto_20861 ?auto_20865 ) ) ( not ( = ?auto_20862 ?auto_20865 ) ) ( not ( = ?auto_20864 ?auto_20865 ) ) ( ON ?auto_20863 ?auto_20864 ) ( HOLDING ?auto_20865 ) ( CLEAR ?auto_20863 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20861 ?auto_20862 ?auto_20864 ?auto_20863 ?auto_20865 )
      ( MAKE-1PILE ?auto_20861 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20866 - BLOCK
    )
    :vars
    (
      ?auto_20867 - BLOCK
      ?auto_20868 - BLOCK
      ?auto_20869 - BLOCK
      ?auto_20870 - BLOCK
      ?auto_20871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20867 ?auto_20866 ) ( ON-TABLE ?auto_20866 ) ( not ( = ?auto_20866 ?auto_20867 ) ) ( not ( = ?auto_20866 ?auto_20868 ) ) ( not ( = ?auto_20866 ?auto_20869 ) ) ( not ( = ?auto_20867 ?auto_20868 ) ) ( not ( = ?auto_20867 ?auto_20869 ) ) ( not ( = ?auto_20868 ?auto_20869 ) ) ( ON ?auto_20868 ?auto_20867 ) ( not ( = ?auto_20870 ?auto_20869 ) ) ( not ( = ?auto_20866 ?auto_20870 ) ) ( not ( = ?auto_20867 ?auto_20870 ) ) ( not ( = ?auto_20868 ?auto_20870 ) ) ( ON ?auto_20869 ?auto_20868 ) ( CLEAR ?auto_20869 ) ( ON ?auto_20870 ?auto_20871 ) ( CLEAR ?auto_20870 ) ( HAND-EMPTY ) ( not ( = ?auto_20866 ?auto_20871 ) ) ( not ( = ?auto_20867 ?auto_20871 ) ) ( not ( = ?auto_20868 ?auto_20871 ) ) ( not ( = ?auto_20869 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20870 ?auto_20871 )
      ( MAKE-1PILE ?auto_20866 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20872 - BLOCK
    )
    :vars
    (
      ?auto_20873 - BLOCK
      ?auto_20877 - BLOCK
      ?auto_20876 - BLOCK
      ?auto_20875 - BLOCK
      ?auto_20874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20873 ?auto_20872 ) ( ON-TABLE ?auto_20872 ) ( not ( = ?auto_20872 ?auto_20873 ) ) ( not ( = ?auto_20872 ?auto_20877 ) ) ( not ( = ?auto_20872 ?auto_20876 ) ) ( not ( = ?auto_20873 ?auto_20877 ) ) ( not ( = ?auto_20873 ?auto_20876 ) ) ( not ( = ?auto_20877 ?auto_20876 ) ) ( ON ?auto_20877 ?auto_20873 ) ( not ( = ?auto_20875 ?auto_20876 ) ) ( not ( = ?auto_20872 ?auto_20875 ) ) ( not ( = ?auto_20873 ?auto_20875 ) ) ( not ( = ?auto_20877 ?auto_20875 ) ) ( ON ?auto_20875 ?auto_20874 ) ( CLEAR ?auto_20875 ) ( not ( = ?auto_20872 ?auto_20874 ) ) ( not ( = ?auto_20873 ?auto_20874 ) ) ( not ( = ?auto_20877 ?auto_20874 ) ) ( not ( = ?auto_20876 ?auto_20874 ) ) ( not ( = ?auto_20875 ?auto_20874 ) ) ( HOLDING ?auto_20876 ) ( CLEAR ?auto_20877 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20872 ?auto_20873 ?auto_20877 ?auto_20876 )
      ( MAKE-1PILE ?auto_20872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20878 - BLOCK
    )
    :vars
    (
      ?auto_20879 - BLOCK
      ?auto_20883 - BLOCK
      ?auto_20882 - BLOCK
      ?auto_20880 - BLOCK
      ?auto_20881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20879 ?auto_20878 ) ( ON-TABLE ?auto_20878 ) ( not ( = ?auto_20878 ?auto_20879 ) ) ( not ( = ?auto_20878 ?auto_20883 ) ) ( not ( = ?auto_20878 ?auto_20882 ) ) ( not ( = ?auto_20879 ?auto_20883 ) ) ( not ( = ?auto_20879 ?auto_20882 ) ) ( not ( = ?auto_20883 ?auto_20882 ) ) ( ON ?auto_20883 ?auto_20879 ) ( not ( = ?auto_20880 ?auto_20882 ) ) ( not ( = ?auto_20878 ?auto_20880 ) ) ( not ( = ?auto_20879 ?auto_20880 ) ) ( not ( = ?auto_20883 ?auto_20880 ) ) ( ON ?auto_20880 ?auto_20881 ) ( not ( = ?auto_20878 ?auto_20881 ) ) ( not ( = ?auto_20879 ?auto_20881 ) ) ( not ( = ?auto_20883 ?auto_20881 ) ) ( not ( = ?auto_20882 ?auto_20881 ) ) ( not ( = ?auto_20880 ?auto_20881 ) ) ( CLEAR ?auto_20883 ) ( ON ?auto_20882 ?auto_20880 ) ( CLEAR ?auto_20882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20881 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20881 ?auto_20880 )
      ( MAKE-1PILE ?auto_20878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20884 - BLOCK
    )
    :vars
    (
      ?auto_20885 - BLOCK
      ?auto_20886 - BLOCK
      ?auto_20887 - BLOCK
      ?auto_20889 - BLOCK
      ?auto_20888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20885 ?auto_20884 ) ( ON-TABLE ?auto_20884 ) ( not ( = ?auto_20884 ?auto_20885 ) ) ( not ( = ?auto_20884 ?auto_20886 ) ) ( not ( = ?auto_20884 ?auto_20887 ) ) ( not ( = ?auto_20885 ?auto_20886 ) ) ( not ( = ?auto_20885 ?auto_20887 ) ) ( not ( = ?auto_20886 ?auto_20887 ) ) ( not ( = ?auto_20889 ?auto_20887 ) ) ( not ( = ?auto_20884 ?auto_20889 ) ) ( not ( = ?auto_20885 ?auto_20889 ) ) ( not ( = ?auto_20886 ?auto_20889 ) ) ( ON ?auto_20889 ?auto_20888 ) ( not ( = ?auto_20884 ?auto_20888 ) ) ( not ( = ?auto_20885 ?auto_20888 ) ) ( not ( = ?auto_20886 ?auto_20888 ) ) ( not ( = ?auto_20887 ?auto_20888 ) ) ( not ( = ?auto_20889 ?auto_20888 ) ) ( ON ?auto_20887 ?auto_20889 ) ( CLEAR ?auto_20887 ) ( ON-TABLE ?auto_20888 ) ( HOLDING ?auto_20886 ) ( CLEAR ?auto_20885 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20884 ?auto_20885 ?auto_20886 )
      ( MAKE-1PILE ?auto_20884 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20890 - BLOCK
    )
    :vars
    (
      ?auto_20894 - BLOCK
      ?auto_20893 - BLOCK
      ?auto_20891 - BLOCK
      ?auto_20892 - BLOCK
      ?auto_20895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_20894 ?auto_20890 ) ( ON-TABLE ?auto_20890 ) ( not ( = ?auto_20890 ?auto_20894 ) ) ( not ( = ?auto_20890 ?auto_20893 ) ) ( not ( = ?auto_20890 ?auto_20891 ) ) ( not ( = ?auto_20894 ?auto_20893 ) ) ( not ( = ?auto_20894 ?auto_20891 ) ) ( not ( = ?auto_20893 ?auto_20891 ) ) ( not ( = ?auto_20892 ?auto_20891 ) ) ( not ( = ?auto_20890 ?auto_20892 ) ) ( not ( = ?auto_20894 ?auto_20892 ) ) ( not ( = ?auto_20893 ?auto_20892 ) ) ( ON ?auto_20892 ?auto_20895 ) ( not ( = ?auto_20890 ?auto_20895 ) ) ( not ( = ?auto_20894 ?auto_20895 ) ) ( not ( = ?auto_20893 ?auto_20895 ) ) ( not ( = ?auto_20891 ?auto_20895 ) ) ( not ( = ?auto_20892 ?auto_20895 ) ) ( ON ?auto_20891 ?auto_20892 ) ( ON-TABLE ?auto_20895 ) ( CLEAR ?auto_20894 ) ( ON ?auto_20893 ?auto_20891 ) ( CLEAR ?auto_20893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20895 ?auto_20892 ?auto_20891 )
      ( MAKE-1PILE ?auto_20890 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20908 - BLOCK
    )
    :vars
    (
      ?auto_20909 - BLOCK
      ?auto_20910 - BLOCK
      ?auto_20911 - BLOCK
      ?auto_20912 - BLOCK
      ?auto_20913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20908 ?auto_20909 ) ) ( not ( = ?auto_20908 ?auto_20910 ) ) ( not ( = ?auto_20908 ?auto_20911 ) ) ( not ( = ?auto_20909 ?auto_20910 ) ) ( not ( = ?auto_20909 ?auto_20911 ) ) ( not ( = ?auto_20910 ?auto_20911 ) ) ( not ( = ?auto_20912 ?auto_20911 ) ) ( not ( = ?auto_20908 ?auto_20912 ) ) ( not ( = ?auto_20909 ?auto_20912 ) ) ( not ( = ?auto_20910 ?auto_20912 ) ) ( ON ?auto_20912 ?auto_20913 ) ( not ( = ?auto_20908 ?auto_20913 ) ) ( not ( = ?auto_20909 ?auto_20913 ) ) ( not ( = ?auto_20910 ?auto_20913 ) ) ( not ( = ?auto_20911 ?auto_20913 ) ) ( not ( = ?auto_20912 ?auto_20913 ) ) ( ON ?auto_20911 ?auto_20912 ) ( ON-TABLE ?auto_20913 ) ( ON ?auto_20910 ?auto_20911 ) ( ON ?auto_20909 ?auto_20910 ) ( CLEAR ?auto_20909 ) ( HOLDING ?auto_20908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20908 ?auto_20909 )
      ( MAKE-1PILE ?auto_20908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_20914 - BLOCK
    )
    :vars
    (
      ?auto_20917 - BLOCK
      ?auto_20916 - BLOCK
      ?auto_20919 - BLOCK
      ?auto_20918 - BLOCK
      ?auto_20915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20914 ?auto_20917 ) ) ( not ( = ?auto_20914 ?auto_20916 ) ) ( not ( = ?auto_20914 ?auto_20919 ) ) ( not ( = ?auto_20917 ?auto_20916 ) ) ( not ( = ?auto_20917 ?auto_20919 ) ) ( not ( = ?auto_20916 ?auto_20919 ) ) ( not ( = ?auto_20918 ?auto_20919 ) ) ( not ( = ?auto_20914 ?auto_20918 ) ) ( not ( = ?auto_20917 ?auto_20918 ) ) ( not ( = ?auto_20916 ?auto_20918 ) ) ( ON ?auto_20918 ?auto_20915 ) ( not ( = ?auto_20914 ?auto_20915 ) ) ( not ( = ?auto_20917 ?auto_20915 ) ) ( not ( = ?auto_20916 ?auto_20915 ) ) ( not ( = ?auto_20919 ?auto_20915 ) ) ( not ( = ?auto_20918 ?auto_20915 ) ) ( ON ?auto_20919 ?auto_20918 ) ( ON-TABLE ?auto_20915 ) ( ON ?auto_20916 ?auto_20919 ) ( ON ?auto_20917 ?auto_20916 ) ( ON ?auto_20914 ?auto_20917 ) ( CLEAR ?auto_20914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20915 ?auto_20918 ?auto_20919 ?auto_20916 ?auto_20917 )
      ( MAKE-1PILE ?auto_20914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20924 - BLOCK
      ?auto_20925 - BLOCK
      ?auto_20926 - BLOCK
      ?auto_20927 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_20927 ) ( CLEAR ?auto_20926 ) ( ON-TABLE ?auto_20924 ) ( ON ?auto_20925 ?auto_20924 ) ( ON ?auto_20926 ?auto_20925 ) ( not ( = ?auto_20924 ?auto_20925 ) ) ( not ( = ?auto_20924 ?auto_20926 ) ) ( not ( = ?auto_20924 ?auto_20927 ) ) ( not ( = ?auto_20925 ?auto_20926 ) ) ( not ( = ?auto_20925 ?auto_20927 ) ) ( not ( = ?auto_20926 ?auto_20927 ) ) )
    :subtasks
    ( ( !STACK ?auto_20927 ?auto_20926 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20928 - BLOCK
      ?auto_20929 - BLOCK
      ?auto_20930 - BLOCK
      ?auto_20931 - BLOCK
    )
    :vars
    (
      ?auto_20932 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_20930 ) ( ON-TABLE ?auto_20928 ) ( ON ?auto_20929 ?auto_20928 ) ( ON ?auto_20930 ?auto_20929 ) ( not ( = ?auto_20928 ?auto_20929 ) ) ( not ( = ?auto_20928 ?auto_20930 ) ) ( not ( = ?auto_20928 ?auto_20931 ) ) ( not ( = ?auto_20929 ?auto_20930 ) ) ( not ( = ?auto_20929 ?auto_20931 ) ) ( not ( = ?auto_20930 ?auto_20931 ) ) ( ON ?auto_20931 ?auto_20932 ) ( CLEAR ?auto_20931 ) ( HAND-EMPTY ) ( not ( = ?auto_20928 ?auto_20932 ) ) ( not ( = ?auto_20929 ?auto_20932 ) ) ( not ( = ?auto_20930 ?auto_20932 ) ) ( not ( = ?auto_20931 ?auto_20932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20931 ?auto_20932 )
      ( MAKE-4PILE ?auto_20928 ?auto_20929 ?auto_20930 ?auto_20931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20933 - BLOCK
      ?auto_20934 - BLOCK
      ?auto_20935 - BLOCK
      ?auto_20936 - BLOCK
    )
    :vars
    (
      ?auto_20937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20933 ) ( ON ?auto_20934 ?auto_20933 ) ( not ( = ?auto_20933 ?auto_20934 ) ) ( not ( = ?auto_20933 ?auto_20935 ) ) ( not ( = ?auto_20933 ?auto_20936 ) ) ( not ( = ?auto_20934 ?auto_20935 ) ) ( not ( = ?auto_20934 ?auto_20936 ) ) ( not ( = ?auto_20935 ?auto_20936 ) ) ( ON ?auto_20936 ?auto_20937 ) ( CLEAR ?auto_20936 ) ( not ( = ?auto_20933 ?auto_20937 ) ) ( not ( = ?auto_20934 ?auto_20937 ) ) ( not ( = ?auto_20935 ?auto_20937 ) ) ( not ( = ?auto_20936 ?auto_20937 ) ) ( HOLDING ?auto_20935 ) ( CLEAR ?auto_20934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20933 ?auto_20934 ?auto_20935 )
      ( MAKE-4PILE ?auto_20933 ?auto_20934 ?auto_20935 ?auto_20936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20938 - BLOCK
      ?auto_20939 - BLOCK
      ?auto_20940 - BLOCK
      ?auto_20941 - BLOCK
    )
    :vars
    (
      ?auto_20942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20938 ) ( ON ?auto_20939 ?auto_20938 ) ( not ( = ?auto_20938 ?auto_20939 ) ) ( not ( = ?auto_20938 ?auto_20940 ) ) ( not ( = ?auto_20938 ?auto_20941 ) ) ( not ( = ?auto_20939 ?auto_20940 ) ) ( not ( = ?auto_20939 ?auto_20941 ) ) ( not ( = ?auto_20940 ?auto_20941 ) ) ( ON ?auto_20941 ?auto_20942 ) ( not ( = ?auto_20938 ?auto_20942 ) ) ( not ( = ?auto_20939 ?auto_20942 ) ) ( not ( = ?auto_20940 ?auto_20942 ) ) ( not ( = ?auto_20941 ?auto_20942 ) ) ( CLEAR ?auto_20939 ) ( ON ?auto_20940 ?auto_20941 ) ( CLEAR ?auto_20940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20942 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20942 ?auto_20941 )
      ( MAKE-4PILE ?auto_20938 ?auto_20939 ?auto_20940 ?auto_20941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20943 - BLOCK
      ?auto_20944 - BLOCK
      ?auto_20945 - BLOCK
      ?auto_20946 - BLOCK
    )
    :vars
    (
      ?auto_20947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20943 ) ( not ( = ?auto_20943 ?auto_20944 ) ) ( not ( = ?auto_20943 ?auto_20945 ) ) ( not ( = ?auto_20943 ?auto_20946 ) ) ( not ( = ?auto_20944 ?auto_20945 ) ) ( not ( = ?auto_20944 ?auto_20946 ) ) ( not ( = ?auto_20945 ?auto_20946 ) ) ( ON ?auto_20946 ?auto_20947 ) ( not ( = ?auto_20943 ?auto_20947 ) ) ( not ( = ?auto_20944 ?auto_20947 ) ) ( not ( = ?auto_20945 ?auto_20947 ) ) ( not ( = ?auto_20946 ?auto_20947 ) ) ( ON ?auto_20945 ?auto_20946 ) ( CLEAR ?auto_20945 ) ( ON-TABLE ?auto_20947 ) ( HOLDING ?auto_20944 ) ( CLEAR ?auto_20943 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20943 ?auto_20944 )
      ( MAKE-4PILE ?auto_20943 ?auto_20944 ?auto_20945 ?auto_20946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20948 - BLOCK
      ?auto_20949 - BLOCK
      ?auto_20950 - BLOCK
      ?auto_20951 - BLOCK
    )
    :vars
    (
      ?auto_20952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_20948 ) ( not ( = ?auto_20948 ?auto_20949 ) ) ( not ( = ?auto_20948 ?auto_20950 ) ) ( not ( = ?auto_20948 ?auto_20951 ) ) ( not ( = ?auto_20949 ?auto_20950 ) ) ( not ( = ?auto_20949 ?auto_20951 ) ) ( not ( = ?auto_20950 ?auto_20951 ) ) ( ON ?auto_20951 ?auto_20952 ) ( not ( = ?auto_20948 ?auto_20952 ) ) ( not ( = ?auto_20949 ?auto_20952 ) ) ( not ( = ?auto_20950 ?auto_20952 ) ) ( not ( = ?auto_20951 ?auto_20952 ) ) ( ON ?auto_20950 ?auto_20951 ) ( ON-TABLE ?auto_20952 ) ( CLEAR ?auto_20948 ) ( ON ?auto_20949 ?auto_20950 ) ( CLEAR ?auto_20949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20952 ?auto_20951 ?auto_20950 )
      ( MAKE-4PILE ?auto_20948 ?auto_20949 ?auto_20950 ?auto_20951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20953 - BLOCK
      ?auto_20954 - BLOCK
      ?auto_20955 - BLOCK
      ?auto_20956 - BLOCK
    )
    :vars
    (
      ?auto_20957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20953 ?auto_20954 ) ) ( not ( = ?auto_20953 ?auto_20955 ) ) ( not ( = ?auto_20953 ?auto_20956 ) ) ( not ( = ?auto_20954 ?auto_20955 ) ) ( not ( = ?auto_20954 ?auto_20956 ) ) ( not ( = ?auto_20955 ?auto_20956 ) ) ( ON ?auto_20956 ?auto_20957 ) ( not ( = ?auto_20953 ?auto_20957 ) ) ( not ( = ?auto_20954 ?auto_20957 ) ) ( not ( = ?auto_20955 ?auto_20957 ) ) ( not ( = ?auto_20956 ?auto_20957 ) ) ( ON ?auto_20955 ?auto_20956 ) ( ON-TABLE ?auto_20957 ) ( ON ?auto_20954 ?auto_20955 ) ( CLEAR ?auto_20954 ) ( HOLDING ?auto_20953 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_20953 )
      ( MAKE-4PILE ?auto_20953 ?auto_20954 ?auto_20955 ?auto_20956 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20958 - BLOCK
      ?auto_20959 - BLOCK
      ?auto_20960 - BLOCK
      ?auto_20961 - BLOCK
    )
    :vars
    (
      ?auto_20962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20958 ?auto_20959 ) ) ( not ( = ?auto_20958 ?auto_20960 ) ) ( not ( = ?auto_20958 ?auto_20961 ) ) ( not ( = ?auto_20959 ?auto_20960 ) ) ( not ( = ?auto_20959 ?auto_20961 ) ) ( not ( = ?auto_20960 ?auto_20961 ) ) ( ON ?auto_20961 ?auto_20962 ) ( not ( = ?auto_20958 ?auto_20962 ) ) ( not ( = ?auto_20959 ?auto_20962 ) ) ( not ( = ?auto_20960 ?auto_20962 ) ) ( not ( = ?auto_20961 ?auto_20962 ) ) ( ON ?auto_20960 ?auto_20961 ) ( ON-TABLE ?auto_20962 ) ( ON ?auto_20959 ?auto_20960 ) ( ON ?auto_20958 ?auto_20959 ) ( CLEAR ?auto_20958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20962 ?auto_20961 ?auto_20960 ?auto_20959 )
      ( MAKE-4PILE ?auto_20958 ?auto_20959 ?auto_20960 ?auto_20961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20963 - BLOCK
      ?auto_20964 - BLOCK
      ?auto_20965 - BLOCK
      ?auto_20966 - BLOCK
    )
    :vars
    (
      ?auto_20967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20963 ?auto_20964 ) ) ( not ( = ?auto_20963 ?auto_20965 ) ) ( not ( = ?auto_20963 ?auto_20966 ) ) ( not ( = ?auto_20964 ?auto_20965 ) ) ( not ( = ?auto_20964 ?auto_20966 ) ) ( not ( = ?auto_20965 ?auto_20966 ) ) ( ON ?auto_20966 ?auto_20967 ) ( not ( = ?auto_20963 ?auto_20967 ) ) ( not ( = ?auto_20964 ?auto_20967 ) ) ( not ( = ?auto_20965 ?auto_20967 ) ) ( not ( = ?auto_20966 ?auto_20967 ) ) ( ON ?auto_20965 ?auto_20966 ) ( ON-TABLE ?auto_20967 ) ( ON ?auto_20964 ?auto_20965 ) ( HOLDING ?auto_20963 ) ( CLEAR ?auto_20964 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_20967 ?auto_20966 ?auto_20965 ?auto_20964 ?auto_20963 )
      ( MAKE-4PILE ?auto_20963 ?auto_20964 ?auto_20965 ?auto_20966 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20968 - BLOCK
      ?auto_20969 - BLOCK
      ?auto_20970 - BLOCK
      ?auto_20971 - BLOCK
    )
    :vars
    (
      ?auto_20972 - BLOCK
      ?auto_20973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20968 ?auto_20969 ) ) ( not ( = ?auto_20968 ?auto_20970 ) ) ( not ( = ?auto_20968 ?auto_20971 ) ) ( not ( = ?auto_20969 ?auto_20970 ) ) ( not ( = ?auto_20969 ?auto_20971 ) ) ( not ( = ?auto_20970 ?auto_20971 ) ) ( ON ?auto_20971 ?auto_20972 ) ( not ( = ?auto_20968 ?auto_20972 ) ) ( not ( = ?auto_20969 ?auto_20972 ) ) ( not ( = ?auto_20970 ?auto_20972 ) ) ( not ( = ?auto_20971 ?auto_20972 ) ) ( ON ?auto_20970 ?auto_20971 ) ( ON-TABLE ?auto_20972 ) ( ON ?auto_20969 ?auto_20970 ) ( CLEAR ?auto_20969 ) ( ON ?auto_20968 ?auto_20973 ) ( CLEAR ?auto_20968 ) ( HAND-EMPTY ) ( not ( = ?auto_20968 ?auto_20973 ) ) ( not ( = ?auto_20969 ?auto_20973 ) ) ( not ( = ?auto_20970 ?auto_20973 ) ) ( not ( = ?auto_20971 ?auto_20973 ) ) ( not ( = ?auto_20972 ?auto_20973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_20968 ?auto_20973 )
      ( MAKE-4PILE ?auto_20968 ?auto_20969 ?auto_20970 ?auto_20971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20974 - BLOCK
      ?auto_20975 - BLOCK
      ?auto_20976 - BLOCK
      ?auto_20977 - BLOCK
    )
    :vars
    (
      ?auto_20979 - BLOCK
      ?auto_20978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20974 ?auto_20975 ) ) ( not ( = ?auto_20974 ?auto_20976 ) ) ( not ( = ?auto_20974 ?auto_20977 ) ) ( not ( = ?auto_20975 ?auto_20976 ) ) ( not ( = ?auto_20975 ?auto_20977 ) ) ( not ( = ?auto_20976 ?auto_20977 ) ) ( ON ?auto_20977 ?auto_20979 ) ( not ( = ?auto_20974 ?auto_20979 ) ) ( not ( = ?auto_20975 ?auto_20979 ) ) ( not ( = ?auto_20976 ?auto_20979 ) ) ( not ( = ?auto_20977 ?auto_20979 ) ) ( ON ?auto_20976 ?auto_20977 ) ( ON-TABLE ?auto_20979 ) ( ON ?auto_20974 ?auto_20978 ) ( CLEAR ?auto_20974 ) ( not ( = ?auto_20974 ?auto_20978 ) ) ( not ( = ?auto_20975 ?auto_20978 ) ) ( not ( = ?auto_20976 ?auto_20978 ) ) ( not ( = ?auto_20977 ?auto_20978 ) ) ( not ( = ?auto_20979 ?auto_20978 ) ) ( HOLDING ?auto_20975 ) ( CLEAR ?auto_20976 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_20979 ?auto_20977 ?auto_20976 ?auto_20975 )
      ( MAKE-4PILE ?auto_20974 ?auto_20975 ?auto_20976 ?auto_20977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20980 - BLOCK
      ?auto_20981 - BLOCK
      ?auto_20982 - BLOCK
      ?auto_20983 - BLOCK
    )
    :vars
    (
      ?auto_20984 - BLOCK
      ?auto_20985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20980 ?auto_20981 ) ) ( not ( = ?auto_20980 ?auto_20982 ) ) ( not ( = ?auto_20980 ?auto_20983 ) ) ( not ( = ?auto_20981 ?auto_20982 ) ) ( not ( = ?auto_20981 ?auto_20983 ) ) ( not ( = ?auto_20982 ?auto_20983 ) ) ( ON ?auto_20983 ?auto_20984 ) ( not ( = ?auto_20980 ?auto_20984 ) ) ( not ( = ?auto_20981 ?auto_20984 ) ) ( not ( = ?auto_20982 ?auto_20984 ) ) ( not ( = ?auto_20983 ?auto_20984 ) ) ( ON ?auto_20982 ?auto_20983 ) ( ON-TABLE ?auto_20984 ) ( ON ?auto_20980 ?auto_20985 ) ( not ( = ?auto_20980 ?auto_20985 ) ) ( not ( = ?auto_20981 ?auto_20985 ) ) ( not ( = ?auto_20982 ?auto_20985 ) ) ( not ( = ?auto_20983 ?auto_20985 ) ) ( not ( = ?auto_20984 ?auto_20985 ) ) ( CLEAR ?auto_20982 ) ( ON ?auto_20981 ?auto_20980 ) ( CLEAR ?auto_20981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_20985 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_20985 ?auto_20980 )
      ( MAKE-4PILE ?auto_20980 ?auto_20981 ?auto_20982 ?auto_20983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20986 - BLOCK
      ?auto_20987 - BLOCK
      ?auto_20988 - BLOCK
      ?auto_20989 - BLOCK
    )
    :vars
    (
      ?auto_20990 - BLOCK
      ?auto_20991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20986 ?auto_20987 ) ) ( not ( = ?auto_20986 ?auto_20988 ) ) ( not ( = ?auto_20986 ?auto_20989 ) ) ( not ( = ?auto_20987 ?auto_20988 ) ) ( not ( = ?auto_20987 ?auto_20989 ) ) ( not ( = ?auto_20988 ?auto_20989 ) ) ( ON ?auto_20989 ?auto_20990 ) ( not ( = ?auto_20986 ?auto_20990 ) ) ( not ( = ?auto_20987 ?auto_20990 ) ) ( not ( = ?auto_20988 ?auto_20990 ) ) ( not ( = ?auto_20989 ?auto_20990 ) ) ( ON-TABLE ?auto_20990 ) ( ON ?auto_20986 ?auto_20991 ) ( not ( = ?auto_20986 ?auto_20991 ) ) ( not ( = ?auto_20987 ?auto_20991 ) ) ( not ( = ?auto_20988 ?auto_20991 ) ) ( not ( = ?auto_20989 ?auto_20991 ) ) ( not ( = ?auto_20990 ?auto_20991 ) ) ( ON ?auto_20987 ?auto_20986 ) ( CLEAR ?auto_20987 ) ( ON-TABLE ?auto_20991 ) ( HOLDING ?auto_20988 ) ( CLEAR ?auto_20989 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20990 ?auto_20989 ?auto_20988 )
      ( MAKE-4PILE ?auto_20986 ?auto_20987 ?auto_20988 ?auto_20989 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20992 - BLOCK
      ?auto_20993 - BLOCK
      ?auto_20994 - BLOCK
      ?auto_20995 - BLOCK
    )
    :vars
    (
      ?auto_20997 - BLOCK
      ?auto_20996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20992 ?auto_20993 ) ) ( not ( = ?auto_20992 ?auto_20994 ) ) ( not ( = ?auto_20992 ?auto_20995 ) ) ( not ( = ?auto_20993 ?auto_20994 ) ) ( not ( = ?auto_20993 ?auto_20995 ) ) ( not ( = ?auto_20994 ?auto_20995 ) ) ( ON ?auto_20995 ?auto_20997 ) ( not ( = ?auto_20992 ?auto_20997 ) ) ( not ( = ?auto_20993 ?auto_20997 ) ) ( not ( = ?auto_20994 ?auto_20997 ) ) ( not ( = ?auto_20995 ?auto_20997 ) ) ( ON-TABLE ?auto_20997 ) ( ON ?auto_20992 ?auto_20996 ) ( not ( = ?auto_20992 ?auto_20996 ) ) ( not ( = ?auto_20993 ?auto_20996 ) ) ( not ( = ?auto_20994 ?auto_20996 ) ) ( not ( = ?auto_20995 ?auto_20996 ) ) ( not ( = ?auto_20997 ?auto_20996 ) ) ( ON ?auto_20993 ?auto_20992 ) ( ON-TABLE ?auto_20996 ) ( CLEAR ?auto_20995 ) ( ON ?auto_20994 ?auto_20993 ) ( CLEAR ?auto_20994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_20996 ?auto_20992 ?auto_20993 )
      ( MAKE-4PILE ?auto_20992 ?auto_20993 ?auto_20994 ?auto_20995 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_20998 - BLOCK
      ?auto_20999 - BLOCK
      ?auto_21000 - BLOCK
      ?auto_21001 - BLOCK
    )
    :vars
    (
      ?auto_21003 - BLOCK
      ?auto_21002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_20998 ?auto_20999 ) ) ( not ( = ?auto_20998 ?auto_21000 ) ) ( not ( = ?auto_20998 ?auto_21001 ) ) ( not ( = ?auto_20999 ?auto_21000 ) ) ( not ( = ?auto_20999 ?auto_21001 ) ) ( not ( = ?auto_21000 ?auto_21001 ) ) ( not ( = ?auto_20998 ?auto_21003 ) ) ( not ( = ?auto_20999 ?auto_21003 ) ) ( not ( = ?auto_21000 ?auto_21003 ) ) ( not ( = ?auto_21001 ?auto_21003 ) ) ( ON-TABLE ?auto_21003 ) ( ON ?auto_20998 ?auto_21002 ) ( not ( = ?auto_20998 ?auto_21002 ) ) ( not ( = ?auto_20999 ?auto_21002 ) ) ( not ( = ?auto_21000 ?auto_21002 ) ) ( not ( = ?auto_21001 ?auto_21002 ) ) ( not ( = ?auto_21003 ?auto_21002 ) ) ( ON ?auto_20999 ?auto_20998 ) ( ON-TABLE ?auto_21002 ) ( ON ?auto_21000 ?auto_20999 ) ( CLEAR ?auto_21000 ) ( HOLDING ?auto_21001 ) ( CLEAR ?auto_21003 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21003 ?auto_21001 )
      ( MAKE-4PILE ?auto_20998 ?auto_20999 ?auto_21000 ?auto_21001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21004 - BLOCK
      ?auto_21005 - BLOCK
      ?auto_21006 - BLOCK
      ?auto_21007 - BLOCK
    )
    :vars
    (
      ?auto_21008 - BLOCK
      ?auto_21009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21004 ?auto_21005 ) ) ( not ( = ?auto_21004 ?auto_21006 ) ) ( not ( = ?auto_21004 ?auto_21007 ) ) ( not ( = ?auto_21005 ?auto_21006 ) ) ( not ( = ?auto_21005 ?auto_21007 ) ) ( not ( = ?auto_21006 ?auto_21007 ) ) ( not ( = ?auto_21004 ?auto_21008 ) ) ( not ( = ?auto_21005 ?auto_21008 ) ) ( not ( = ?auto_21006 ?auto_21008 ) ) ( not ( = ?auto_21007 ?auto_21008 ) ) ( ON-TABLE ?auto_21008 ) ( ON ?auto_21004 ?auto_21009 ) ( not ( = ?auto_21004 ?auto_21009 ) ) ( not ( = ?auto_21005 ?auto_21009 ) ) ( not ( = ?auto_21006 ?auto_21009 ) ) ( not ( = ?auto_21007 ?auto_21009 ) ) ( not ( = ?auto_21008 ?auto_21009 ) ) ( ON ?auto_21005 ?auto_21004 ) ( ON-TABLE ?auto_21009 ) ( ON ?auto_21006 ?auto_21005 ) ( CLEAR ?auto_21008 ) ( ON ?auto_21007 ?auto_21006 ) ( CLEAR ?auto_21007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21009 ?auto_21004 ?auto_21005 ?auto_21006 )
      ( MAKE-4PILE ?auto_21004 ?auto_21005 ?auto_21006 ?auto_21007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21010 - BLOCK
      ?auto_21011 - BLOCK
      ?auto_21012 - BLOCK
      ?auto_21013 - BLOCK
    )
    :vars
    (
      ?auto_21014 - BLOCK
      ?auto_21015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21010 ?auto_21011 ) ) ( not ( = ?auto_21010 ?auto_21012 ) ) ( not ( = ?auto_21010 ?auto_21013 ) ) ( not ( = ?auto_21011 ?auto_21012 ) ) ( not ( = ?auto_21011 ?auto_21013 ) ) ( not ( = ?auto_21012 ?auto_21013 ) ) ( not ( = ?auto_21010 ?auto_21014 ) ) ( not ( = ?auto_21011 ?auto_21014 ) ) ( not ( = ?auto_21012 ?auto_21014 ) ) ( not ( = ?auto_21013 ?auto_21014 ) ) ( ON ?auto_21010 ?auto_21015 ) ( not ( = ?auto_21010 ?auto_21015 ) ) ( not ( = ?auto_21011 ?auto_21015 ) ) ( not ( = ?auto_21012 ?auto_21015 ) ) ( not ( = ?auto_21013 ?auto_21015 ) ) ( not ( = ?auto_21014 ?auto_21015 ) ) ( ON ?auto_21011 ?auto_21010 ) ( ON-TABLE ?auto_21015 ) ( ON ?auto_21012 ?auto_21011 ) ( ON ?auto_21013 ?auto_21012 ) ( CLEAR ?auto_21013 ) ( HOLDING ?auto_21014 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21014 )
      ( MAKE-4PILE ?auto_21010 ?auto_21011 ?auto_21012 ?auto_21013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21016 - BLOCK
      ?auto_21017 - BLOCK
      ?auto_21018 - BLOCK
      ?auto_21019 - BLOCK
    )
    :vars
    (
      ?auto_21020 - BLOCK
      ?auto_21021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21016 ?auto_21017 ) ) ( not ( = ?auto_21016 ?auto_21018 ) ) ( not ( = ?auto_21016 ?auto_21019 ) ) ( not ( = ?auto_21017 ?auto_21018 ) ) ( not ( = ?auto_21017 ?auto_21019 ) ) ( not ( = ?auto_21018 ?auto_21019 ) ) ( not ( = ?auto_21016 ?auto_21020 ) ) ( not ( = ?auto_21017 ?auto_21020 ) ) ( not ( = ?auto_21018 ?auto_21020 ) ) ( not ( = ?auto_21019 ?auto_21020 ) ) ( ON ?auto_21016 ?auto_21021 ) ( not ( = ?auto_21016 ?auto_21021 ) ) ( not ( = ?auto_21017 ?auto_21021 ) ) ( not ( = ?auto_21018 ?auto_21021 ) ) ( not ( = ?auto_21019 ?auto_21021 ) ) ( not ( = ?auto_21020 ?auto_21021 ) ) ( ON ?auto_21017 ?auto_21016 ) ( ON-TABLE ?auto_21021 ) ( ON ?auto_21018 ?auto_21017 ) ( ON ?auto_21019 ?auto_21018 ) ( ON ?auto_21020 ?auto_21019 ) ( CLEAR ?auto_21020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21021 ?auto_21016 ?auto_21017 ?auto_21018 ?auto_21019 )
      ( MAKE-4PILE ?auto_21016 ?auto_21017 ?auto_21018 ?auto_21019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21027 - BLOCK
      ?auto_21028 - BLOCK
      ?auto_21029 - BLOCK
      ?auto_21030 - BLOCK
      ?auto_21031 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21031 ) ( CLEAR ?auto_21030 ) ( ON-TABLE ?auto_21027 ) ( ON ?auto_21028 ?auto_21027 ) ( ON ?auto_21029 ?auto_21028 ) ( ON ?auto_21030 ?auto_21029 ) ( not ( = ?auto_21027 ?auto_21028 ) ) ( not ( = ?auto_21027 ?auto_21029 ) ) ( not ( = ?auto_21027 ?auto_21030 ) ) ( not ( = ?auto_21027 ?auto_21031 ) ) ( not ( = ?auto_21028 ?auto_21029 ) ) ( not ( = ?auto_21028 ?auto_21030 ) ) ( not ( = ?auto_21028 ?auto_21031 ) ) ( not ( = ?auto_21029 ?auto_21030 ) ) ( not ( = ?auto_21029 ?auto_21031 ) ) ( not ( = ?auto_21030 ?auto_21031 ) ) )
    :subtasks
    ( ( !STACK ?auto_21031 ?auto_21030 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21032 - BLOCK
      ?auto_21033 - BLOCK
      ?auto_21034 - BLOCK
      ?auto_21035 - BLOCK
      ?auto_21036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21035 ) ( ON-TABLE ?auto_21032 ) ( ON ?auto_21033 ?auto_21032 ) ( ON ?auto_21034 ?auto_21033 ) ( ON ?auto_21035 ?auto_21034 ) ( not ( = ?auto_21032 ?auto_21033 ) ) ( not ( = ?auto_21032 ?auto_21034 ) ) ( not ( = ?auto_21032 ?auto_21035 ) ) ( not ( = ?auto_21032 ?auto_21036 ) ) ( not ( = ?auto_21033 ?auto_21034 ) ) ( not ( = ?auto_21033 ?auto_21035 ) ) ( not ( = ?auto_21033 ?auto_21036 ) ) ( not ( = ?auto_21034 ?auto_21035 ) ) ( not ( = ?auto_21034 ?auto_21036 ) ) ( not ( = ?auto_21035 ?auto_21036 ) ) ( ON-TABLE ?auto_21036 ) ( CLEAR ?auto_21036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_21036 )
      ( MAKE-5PILE ?auto_21032 ?auto_21033 ?auto_21034 ?auto_21035 ?auto_21036 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21037 - BLOCK
      ?auto_21038 - BLOCK
      ?auto_21039 - BLOCK
      ?auto_21040 - BLOCK
      ?auto_21041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21037 ) ( ON ?auto_21038 ?auto_21037 ) ( ON ?auto_21039 ?auto_21038 ) ( not ( = ?auto_21037 ?auto_21038 ) ) ( not ( = ?auto_21037 ?auto_21039 ) ) ( not ( = ?auto_21037 ?auto_21040 ) ) ( not ( = ?auto_21037 ?auto_21041 ) ) ( not ( = ?auto_21038 ?auto_21039 ) ) ( not ( = ?auto_21038 ?auto_21040 ) ) ( not ( = ?auto_21038 ?auto_21041 ) ) ( not ( = ?auto_21039 ?auto_21040 ) ) ( not ( = ?auto_21039 ?auto_21041 ) ) ( not ( = ?auto_21040 ?auto_21041 ) ) ( ON-TABLE ?auto_21041 ) ( CLEAR ?auto_21041 ) ( HOLDING ?auto_21040 ) ( CLEAR ?auto_21039 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21037 ?auto_21038 ?auto_21039 ?auto_21040 )
      ( MAKE-5PILE ?auto_21037 ?auto_21038 ?auto_21039 ?auto_21040 ?auto_21041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21042 - BLOCK
      ?auto_21043 - BLOCK
      ?auto_21044 - BLOCK
      ?auto_21045 - BLOCK
      ?auto_21046 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21042 ) ( ON ?auto_21043 ?auto_21042 ) ( ON ?auto_21044 ?auto_21043 ) ( not ( = ?auto_21042 ?auto_21043 ) ) ( not ( = ?auto_21042 ?auto_21044 ) ) ( not ( = ?auto_21042 ?auto_21045 ) ) ( not ( = ?auto_21042 ?auto_21046 ) ) ( not ( = ?auto_21043 ?auto_21044 ) ) ( not ( = ?auto_21043 ?auto_21045 ) ) ( not ( = ?auto_21043 ?auto_21046 ) ) ( not ( = ?auto_21044 ?auto_21045 ) ) ( not ( = ?auto_21044 ?auto_21046 ) ) ( not ( = ?auto_21045 ?auto_21046 ) ) ( ON-TABLE ?auto_21046 ) ( CLEAR ?auto_21044 ) ( ON ?auto_21045 ?auto_21046 ) ( CLEAR ?auto_21045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21046 )
      ( MAKE-5PILE ?auto_21042 ?auto_21043 ?auto_21044 ?auto_21045 ?auto_21046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21047 - BLOCK
      ?auto_21048 - BLOCK
      ?auto_21049 - BLOCK
      ?auto_21050 - BLOCK
      ?auto_21051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21047 ) ( ON ?auto_21048 ?auto_21047 ) ( not ( = ?auto_21047 ?auto_21048 ) ) ( not ( = ?auto_21047 ?auto_21049 ) ) ( not ( = ?auto_21047 ?auto_21050 ) ) ( not ( = ?auto_21047 ?auto_21051 ) ) ( not ( = ?auto_21048 ?auto_21049 ) ) ( not ( = ?auto_21048 ?auto_21050 ) ) ( not ( = ?auto_21048 ?auto_21051 ) ) ( not ( = ?auto_21049 ?auto_21050 ) ) ( not ( = ?auto_21049 ?auto_21051 ) ) ( not ( = ?auto_21050 ?auto_21051 ) ) ( ON-TABLE ?auto_21051 ) ( ON ?auto_21050 ?auto_21051 ) ( CLEAR ?auto_21050 ) ( HOLDING ?auto_21049 ) ( CLEAR ?auto_21048 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21047 ?auto_21048 ?auto_21049 )
      ( MAKE-5PILE ?auto_21047 ?auto_21048 ?auto_21049 ?auto_21050 ?auto_21051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21052 - BLOCK
      ?auto_21053 - BLOCK
      ?auto_21054 - BLOCK
      ?auto_21055 - BLOCK
      ?auto_21056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21052 ) ( ON ?auto_21053 ?auto_21052 ) ( not ( = ?auto_21052 ?auto_21053 ) ) ( not ( = ?auto_21052 ?auto_21054 ) ) ( not ( = ?auto_21052 ?auto_21055 ) ) ( not ( = ?auto_21052 ?auto_21056 ) ) ( not ( = ?auto_21053 ?auto_21054 ) ) ( not ( = ?auto_21053 ?auto_21055 ) ) ( not ( = ?auto_21053 ?auto_21056 ) ) ( not ( = ?auto_21054 ?auto_21055 ) ) ( not ( = ?auto_21054 ?auto_21056 ) ) ( not ( = ?auto_21055 ?auto_21056 ) ) ( ON-TABLE ?auto_21056 ) ( ON ?auto_21055 ?auto_21056 ) ( CLEAR ?auto_21053 ) ( ON ?auto_21054 ?auto_21055 ) ( CLEAR ?auto_21054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21056 ?auto_21055 )
      ( MAKE-5PILE ?auto_21052 ?auto_21053 ?auto_21054 ?auto_21055 ?auto_21056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21057 - BLOCK
      ?auto_21058 - BLOCK
      ?auto_21059 - BLOCK
      ?auto_21060 - BLOCK
      ?auto_21061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21057 ) ( not ( = ?auto_21057 ?auto_21058 ) ) ( not ( = ?auto_21057 ?auto_21059 ) ) ( not ( = ?auto_21057 ?auto_21060 ) ) ( not ( = ?auto_21057 ?auto_21061 ) ) ( not ( = ?auto_21058 ?auto_21059 ) ) ( not ( = ?auto_21058 ?auto_21060 ) ) ( not ( = ?auto_21058 ?auto_21061 ) ) ( not ( = ?auto_21059 ?auto_21060 ) ) ( not ( = ?auto_21059 ?auto_21061 ) ) ( not ( = ?auto_21060 ?auto_21061 ) ) ( ON-TABLE ?auto_21061 ) ( ON ?auto_21060 ?auto_21061 ) ( ON ?auto_21059 ?auto_21060 ) ( CLEAR ?auto_21059 ) ( HOLDING ?auto_21058 ) ( CLEAR ?auto_21057 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21057 ?auto_21058 )
      ( MAKE-5PILE ?auto_21057 ?auto_21058 ?auto_21059 ?auto_21060 ?auto_21061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21062 - BLOCK
      ?auto_21063 - BLOCK
      ?auto_21064 - BLOCK
      ?auto_21065 - BLOCK
      ?auto_21066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21062 ) ( not ( = ?auto_21062 ?auto_21063 ) ) ( not ( = ?auto_21062 ?auto_21064 ) ) ( not ( = ?auto_21062 ?auto_21065 ) ) ( not ( = ?auto_21062 ?auto_21066 ) ) ( not ( = ?auto_21063 ?auto_21064 ) ) ( not ( = ?auto_21063 ?auto_21065 ) ) ( not ( = ?auto_21063 ?auto_21066 ) ) ( not ( = ?auto_21064 ?auto_21065 ) ) ( not ( = ?auto_21064 ?auto_21066 ) ) ( not ( = ?auto_21065 ?auto_21066 ) ) ( ON-TABLE ?auto_21066 ) ( ON ?auto_21065 ?auto_21066 ) ( ON ?auto_21064 ?auto_21065 ) ( CLEAR ?auto_21062 ) ( ON ?auto_21063 ?auto_21064 ) ( CLEAR ?auto_21063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21066 ?auto_21065 ?auto_21064 )
      ( MAKE-5PILE ?auto_21062 ?auto_21063 ?auto_21064 ?auto_21065 ?auto_21066 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21067 - BLOCK
      ?auto_21068 - BLOCK
      ?auto_21069 - BLOCK
      ?auto_21070 - BLOCK
      ?auto_21071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21067 ?auto_21068 ) ) ( not ( = ?auto_21067 ?auto_21069 ) ) ( not ( = ?auto_21067 ?auto_21070 ) ) ( not ( = ?auto_21067 ?auto_21071 ) ) ( not ( = ?auto_21068 ?auto_21069 ) ) ( not ( = ?auto_21068 ?auto_21070 ) ) ( not ( = ?auto_21068 ?auto_21071 ) ) ( not ( = ?auto_21069 ?auto_21070 ) ) ( not ( = ?auto_21069 ?auto_21071 ) ) ( not ( = ?auto_21070 ?auto_21071 ) ) ( ON-TABLE ?auto_21071 ) ( ON ?auto_21070 ?auto_21071 ) ( ON ?auto_21069 ?auto_21070 ) ( ON ?auto_21068 ?auto_21069 ) ( CLEAR ?auto_21068 ) ( HOLDING ?auto_21067 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21067 )
      ( MAKE-5PILE ?auto_21067 ?auto_21068 ?auto_21069 ?auto_21070 ?auto_21071 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21072 - BLOCK
      ?auto_21073 - BLOCK
      ?auto_21074 - BLOCK
      ?auto_21075 - BLOCK
      ?auto_21076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21072 ?auto_21073 ) ) ( not ( = ?auto_21072 ?auto_21074 ) ) ( not ( = ?auto_21072 ?auto_21075 ) ) ( not ( = ?auto_21072 ?auto_21076 ) ) ( not ( = ?auto_21073 ?auto_21074 ) ) ( not ( = ?auto_21073 ?auto_21075 ) ) ( not ( = ?auto_21073 ?auto_21076 ) ) ( not ( = ?auto_21074 ?auto_21075 ) ) ( not ( = ?auto_21074 ?auto_21076 ) ) ( not ( = ?auto_21075 ?auto_21076 ) ) ( ON-TABLE ?auto_21076 ) ( ON ?auto_21075 ?auto_21076 ) ( ON ?auto_21074 ?auto_21075 ) ( ON ?auto_21073 ?auto_21074 ) ( ON ?auto_21072 ?auto_21073 ) ( CLEAR ?auto_21072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21076 ?auto_21075 ?auto_21074 ?auto_21073 )
      ( MAKE-5PILE ?auto_21072 ?auto_21073 ?auto_21074 ?auto_21075 ?auto_21076 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21077 - BLOCK
      ?auto_21078 - BLOCK
      ?auto_21079 - BLOCK
      ?auto_21080 - BLOCK
      ?auto_21081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21077 ?auto_21078 ) ) ( not ( = ?auto_21077 ?auto_21079 ) ) ( not ( = ?auto_21077 ?auto_21080 ) ) ( not ( = ?auto_21077 ?auto_21081 ) ) ( not ( = ?auto_21078 ?auto_21079 ) ) ( not ( = ?auto_21078 ?auto_21080 ) ) ( not ( = ?auto_21078 ?auto_21081 ) ) ( not ( = ?auto_21079 ?auto_21080 ) ) ( not ( = ?auto_21079 ?auto_21081 ) ) ( not ( = ?auto_21080 ?auto_21081 ) ) ( ON-TABLE ?auto_21081 ) ( ON ?auto_21080 ?auto_21081 ) ( ON ?auto_21079 ?auto_21080 ) ( ON ?auto_21078 ?auto_21079 ) ( HOLDING ?auto_21077 ) ( CLEAR ?auto_21078 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21081 ?auto_21080 ?auto_21079 ?auto_21078 ?auto_21077 )
      ( MAKE-5PILE ?auto_21077 ?auto_21078 ?auto_21079 ?auto_21080 ?auto_21081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21082 - BLOCK
      ?auto_21083 - BLOCK
      ?auto_21084 - BLOCK
      ?auto_21085 - BLOCK
      ?auto_21086 - BLOCK
    )
    :vars
    (
      ?auto_21087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21082 ?auto_21083 ) ) ( not ( = ?auto_21082 ?auto_21084 ) ) ( not ( = ?auto_21082 ?auto_21085 ) ) ( not ( = ?auto_21082 ?auto_21086 ) ) ( not ( = ?auto_21083 ?auto_21084 ) ) ( not ( = ?auto_21083 ?auto_21085 ) ) ( not ( = ?auto_21083 ?auto_21086 ) ) ( not ( = ?auto_21084 ?auto_21085 ) ) ( not ( = ?auto_21084 ?auto_21086 ) ) ( not ( = ?auto_21085 ?auto_21086 ) ) ( ON-TABLE ?auto_21086 ) ( ON ?auto_21085 ?auto_21086 ) ( ON ?auto_21084 ?auto_21085 ) ( ON ?auto_21083 ?auto_21084 ) ( CLEAR ?auto_21083 ) ( ON ?auto_21082 ?auto_21087 ) ( CLEAR ?auto_21082 ) ( HAND-EMPTY ) ( not ( = ?auto_21082 ?auto_21087 ) ) ( not ( = ?auto_21083 ?auto_21087 ) ) ( not ( = ?auto_21084 ?auto_21087 ) ) ( not ( = ?auto_21085 ?auto_21087 ) ) ( not ( = ?auto_21086 ?auto_21087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21082 ?auto_21087 )
      ( MAKE-5PILE ?auto_21082 ?auto_21083 ?auto_21084 ?auto_21085 ?auto_21086 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21088 - BLOCK
      ?auto_21089 - BLOCK
      ?auto_21090 - BLOCK
      ?auto_21091 - BLOCK
      ?auto_21092 - BLOCK
    )
    :vars
    (
      ?auto_21093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21088 ?auto_21089 ) ) ( not ( = ?auto_21088 ?auto_21090 ) ) ( not ( = ?auto_21088 ?auto_21091 ) ) ( not ( = ?auto_21088 ?auto_21092 ) ) ( not ( = ?auto_21089 ?auto_21090 ) ) ( not ( = ?auto_21089 ?auto_21091 ) ) ( not ( = ?auto_21089 ?auto_21092 ) ) ( not ( = ?auto_21090 ?auto_21091 ) ) ( not ( = ?auto_21090 ?auto_21092 ) ) ( not ( = ?auto_21091 ?auto_21092 ) ) ( ON-TABLE ?auto_21092 ) ( ON ?auto_21091 ?auto_21092 ) ( ON ?auto_21090 ?auto_21091 ) ( ON ?auto_21088 ?auto_21093 ) ( CLEAR ?auto_21088 ) ( not ( = ?auto_21088 ?auto_21093 ) ) ( not ( = ?auto_21089 ?auto_21093 ) ) ( not ( = ?auto_21090 ?auto_21093 ) ) ( not ( = ?auto_21091 ?auto_21093 ) ) ( not ( = ?auto_21092 ?auto_21093 ) ) ( HOLDING ?auto_21089 ) ( CLEAR ?auto_21090 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21092 ?auto_21091 ?auto_21090 ?auto_21089 )
      ( MAKE-5PILE ?auto_21088 ?auto_21089 ?auto_21090 ?auto_21091 ?auto_21092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21094 - BLOCK
      ?auto_21095 - BLOCK
      ?auto_21096 - BLOCK
      ?auto_21097 - BLOCK
      ?auto_21098 - BLOCK
    )
    :vars
    (
      ?auto_21099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21094 ?auto_21095 ) ) ( not ( = ?auto_21094 ?auto_21096 ) ) ( not ( = ?auto_21094 ?auto_21097 ) ) ( not ( = ?auto_21094 ?auto_21098 ) ) ( not ( = ?auto_21095 ?auto_21096 ) ) ( not ( = ?auto_21095 ?auto_21097 ) ) ( not ( = ?auto_21095 ?auto_21098 ) ) ( not ( = ?auto_21096 ?auto_21097 ) ) ( not ( = ?auto_21096 ?auto_21098 ) ) ( not ( = ?auto_21097 ?auto_21098 ) ) ( ON-TABLE ?auto_21098 ) ( ON ?auto_21097 ?auto_21098 ) ( ON ?auto_21096 ?auto_21097 ) ( ON ?auto_21094 ?auto_21099 ) ( not ( = ?auto_21094 ?auto_21099 ) ) ( not ( = ?auto_21095 ?auto_21099 ) ) ( not ( = ?auto_21096 ?auto_21099 ) ) ( not ( = ?auto_21097 ?auto_21099 ) ) ( not ( = ?auto_21098 ?auto_21099 ) ) ( CLEAR ?auto_21096 ) ( ON ?auto_21095 ?auto_21094 ) ( CLEAR ?auto_21095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21099 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21099 ?auto_21094 )
      ( MAKE-5PILE ?auto_21094 ?auto_21095 ?auto_21096 ?auto_21097 ?auto_21098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21100 - BLOCK
      ?auto_21101 - BLOCK
      ?auto_21102 - BLOCK
      ?auto_21103 - BLOCK
      ?auto_21104 - BLOCK
    )
    :vars
    (
      ?auto_21105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21100 ?auto_21101 ) ) ( not ( = ?auto_21100 ?auto_21102 ) ) ( not ( = ?auto_21100 ?auto_21103 ) ) ( not ( = ?auto_21100 ?auto_21104 ) ) ( not ( = ?auto_21101 ?auto_21102 ) ) ( not ( = ?auto_21101 ?auto_21103 ) ) ( not ( = ?auto_21101 ?auto_21104 ) ) ( not ( = ?auto_21102 ?auto_21103 ) ) ( not ( = ?auto_21102 ?auto_21104 ) ) ( not ( = ?auto_21103 ?auto_21104 ) ) ( ON-TABLE ?auto_21104 ) ( ON ?auto_21103 ?auto_21104 ) ( ON ?auto_21100 ?auto_21105 ) ( not ( = ?auto_21100 ?auto_21105 ) ) ( not ( = ?auto_21101 ?auto_21105 ) ) ( not ( = ?auto_21102 ?auto_21105 ) ) ( not ( = ?auto_21103 ?auto_21105 ) ) ( not ( = ?auto_21104 ?auto_21105 ) ) ( ON ?auto_21101 ?auto_21100 ) ( CLEAR ?auto_21101 ) ( ON-TABLE ?auto_21105 ) ( HOLDING ?auto_21102 ) ( CLEAR ?auto_21103 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21104 ?auto_21103 ?auto_21102 )
      ( MAKE-5PILE ?auto_21100 ?auto_21101 ?auto_21102 ?auto_21103 ?auto_21104 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21106 - BLOCK
      ?auto_21107 - BLOCK
      ?auto_21108 - BLOCK
      ?auto_21109 - BLOCK
      ?auto_21110 - BLOCK
    )
    :vars
    (
      ?auto_21111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21106 ?auto_21107 ) ) ( not ( = ?auto_21106 ?auto_21108 ) ) ( not ( = ?auto_21106 ?auto_21109 ) ) ( not ( = ?auto_21106 ?auto_21110 ) ) ( not ( = ?auto_21107 ?auto_21108 ) ) ( not ( = ?auto_21107 ?auto_21109 ) ) ( not ( = ?auto_21107 ?auto_21110 ) ) ( not ( = ?auto_21108 ?auto_21109 ) ) ( not ( = ?auto_21108 ?auto_21110 ) ) ( not ( = ?auto_21109 ?auto_21110 ) ) ( ON-TABLE ?auto_21110 ) ( ON ?auto_21109 ?auto_21110 ) ( ON ?auto_21106 ?auto_21111 ) ( not ( = ?auto_21106 ?auto_21111 ) ) ( not ( = ?auto_21107 ?auto_21111 ) ) ( not ( = ?auto_21108 ?auto_21111 ) ) ( not ( = ?auto_21109 ?auto_21111 ) ) ( not ( = ?auto_21110 ?auto_21111 ) ) ( ON ?auto_21107 ?auto_21106 ) ( ON-TABLE ?auto_21111 ) ( CLEAR ?auto_21109 ) ( ON ?auto_21108 ?auto_21107 ) ( CLEAR ?auto_21108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21111 ?auto_21106 ?auto_21107 )
      ( MAKE-5PILE ?auto_21106 ?auto_21107 ?auto_21108 ?auto_21109 ?auto_21110 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21112 - BLOCK
      ?auto_21113 - BLOCK
      ?auto_21114 - BLOCK
      ?auto_21115 - BLOCK
      ?auto_21116 - BLOCK
    )
    :vars
    (
      ?auto_21117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21112 ?auto_21113 ) ) ( not ( = ?auto_21112 ?auto_21114 ) ) ( not ( = ?auto_21112 ?auto_21115 ) ) ( not ( = ?auto_21112 ?auto_21116 ) ) ( not ( = ?auto_21113 ?auto_21114 ) ) ( not ( = ?auto_21113 ?auto_21115 ) ) ( not ( = ?auto_21113 ?auto_21116 ) ) ( not ( = ?auto_21114 ?auto_21115 ) ) ( not ( = ?auto_21114 ?auto_21116 ) ) ( not ( = ?auto_21115 ?auto_21116 ) ) ( ON-TABLE ?auto_21116 ) ( ON ?auto_21112 ?auto_21117 ) ( not ( = ?auto_21112 ?auto_21117 ) ) ( not ( = ?auto_21113 ?auto_21117 ) ) ( not ( = ?auto_21114 ?auto_21117 ) ) ( not ( = ?auto_21115 ?auto_21117 ) ) ( not ( = ?auto_21116 ?auto_21117 ) ) ( ON ?auto_21113 ?auto_21112 ) ( ON-TABLE ?auto_21117 ) ( ON ?auto_21114 ?auto_21113 ) ( CLEAR ?auto_21114 ) ( HOLDING ?auto_21115 ) ( CLEAR ?auto_21116 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21116 ?auto_21115 )
      ( MAKE-5PILE ?auto_21112 ?auto_21113 ?auto_21114 ?auto_21115 ?auto_21116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21118 - BLOCK
      ?auto_21119 - BLOCK
      ?auto_21120 - BLOCK
      ?auto_21121 - BLOCK
      ?auto_21122 - BLOCK
    )
    :vars
    (
      ?auto_21123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21118 ?auto_21119 ) ) ( not ( = ?auto_21118 ?auto_21120 ) ) ( not ( = ?auto_21118 ?auto_21121 ) ) ( not ( = ?auto_21118 ?auto_21122 ) ) ( not ( = ?auto_21119 ?auto_21120 ) ) ( not ( = ?auto_21119 ?auto_21121 ) ) ( not ( = ?auto_21119 ?auto_21122 ) ) ( not ( = ?auto_21120 ?auto_21121 ) ) ( not ( = ?auto_21120 ?auto_21122 ) ) ( not ( = ?auto_21121 ?auto_21122 ) ) ( ON-TABLE ?auto_21122 ) ( ON ?auto_21118 ?auto_21123 ) ( not ( = ?auto_21118 ?auto_21123 ) ) ( not ( = ?auto_21119 ?auto_21123 ) ) ( not ( = ?auto_21120 ?auto_21123 ) ) ( not ( = ?auto_21121 ?auto_21123 ) ) ( not ( = ?auto_21122 ?auto_21123 ) ) ( ON ?auto_21119 ?auto_21118 ) ( ON-TABLE ?auto_21123 ) ( ON ?auto_21120 ?auto_21119 ) ( CLEAR ?auto_21122 ) ( ON ?auto_21121 ?auto_21120 ) ( CLEAR ?auto_21121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21123 ?auto_21118 ?auto_21119 ?auto_21120 )
      ( MAKE-5PILE ?auto_21118 ?auto_21119 ?auto_21120 ?auto_21121 ?auto_21122 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21124 - BLOCK
      ?auto_21125 - BLOCK
      ?auto_21126 - BLOCK
      ?auto_21127 - BLOCK
      ?auto_21128 - BLOCK
    )
    :vars
    (
      ?auto_21129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21124 ?auto_21125 ) ) ( not ( = ?auto_21124 ?auto_21126 ) ) ( not ( = ?auto_21124 ?auto_21127 ) ) ( not ( = ?auto_21124 ?auto_21128 ) ) ( not ( = ?auto_21125 ?auto_21126 ) ) ( not ( = ?auto_21125 ?auto_21127 ) ) ( not ( = ?auto_21125 ?auto_21128 ) ) ( not ( = ?auto_21126 ?auto_21127 ) ) ( not ( = ?auto_21126 ?auto_21128 ) ) ( not ( = ?auto_21127 ?auto_21128 ) ) ( ON ?auto_21124 ?auto_21129 ) ( not ( = ?auto_21124 ?auto_21129 ) ) ( not ( = ?auto_21125 ?auto_21129 ) ) ( not ( = ?auto_21126 ?auto_21129 ) ) ( not ( = ?auto_21127 ?auto_21129 ) ) ( not ( = ?auto_21128 ?auto_21129 ) ) ( ON ?auto_21125 ?auto_21124 ) ( ON-TABLE ?auto_21129 ) ( ON ?auto_21126 ?auto_21125 ) ( ON ?auto_21127 ?auto_21126 ) ( CLEAR ?auto_21127 ) ( HOLDING ?auto_21128 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21128 )
      ( MAKE-5PILE ?auto_21124 ?auto_21125 ?auto_21126 ?auto_21127 ?auto_21128 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21130 - BLOCK
      ?auto_21131 - BLOCK
      ?auto_21132 - BLOCK
      ?auto_21133 - BLOCK
      ?auto_21134 - BLOCK
    )
    :vars
    (
      ?auto_21135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_21130 ?auto_21131 ) ) ( not ( = ?auto_21130 ?auto_21132 ) ) ( not ( = ?auto_21130 ?auto_21133 ) ) ( not ( = ?auto_21130 ?auto_21134 ) ) ( not ( = ?auto_21131 ?auto_21132 ) ) ( not ( = ?auto_21131 ?auto_21133 ) ) ( not ( = ?auto_21131 ?auto_21134 ) ) ( not ( = ?auto_21132 ?auto_21133 ) ) ( not ( = ?auto_21132 ?auto_21134 ) ) ( not ( = ?auto_21133 ?auto_21134 ) ) ( ON ?auto_21130 ?auto_21135 ) ( not ( = ?auto_21130 ?auto_21135 ) ) ( not ( = ?auto_21131 ?auto_21135 ) ) ( not ( = ?auto_21132 ?auto_21135 ) ) ( not ( = ?auto_21133 ?auto_21135 ) ) ( not ( = ?auto_21134 ?auto_21135 ) ) ( ON ?auto_21131 ?auto_21130 ) ( ON-TABLE ?auto_21135 ) ( ON ?auto_21132 ?auto_21131 ) ( ON ?auto_21133 ?auto_21132 ) ( ON ?auto_21134 ?auto_21133 ) ( CLEAR ?auto_21134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21135 ?auto_21130 ?auto_21131 ?auto_21132 ?auto_21133 )
      ( MAKE-5PILE ?auto_21130 ?auto_21131 ?auto_21132 ?auto_21133 ?auto_21134 ) )
  )

)

