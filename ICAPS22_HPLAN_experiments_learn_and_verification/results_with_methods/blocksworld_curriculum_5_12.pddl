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
      ?auto_7993 - BLOCK
    )
    :vars
    (
      ?auto_7994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7993 ?auto_7994 ) ( CLEAR ?auto_7993 ) ( HAND-EMPTY ) ( not ( = ?auto_7993 ?auto_7994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7993 ?auto_7994 )
      ( !PUTDOWN ?auto_7993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7996 - BLOCK
    )
    :vars
    (
      ?auto_7997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7996 ?auto_7997 ) ( CLEAR ?auto_7996 ) ( HAND-EMPTY ) ( not ( = ?auto_7996 ?auto_7997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7996 ?auto_7997 )
      ( !PUTDOWN ?auto_7996 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8000 - BLOCK
      ?auto_8001 - BLOCK
    )
    :vars
    (
      ?auto_8002 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8000 ) ( ON ?auto_8001 ?auto_8002 ) ( CLEAR ?auto_8001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8000 ) ( not ( = ?auto_8000 ?auto_8001 ) ) ( not ( = ?auto_8000 ?auto_8002 ) ) ( not ( = ?auto_8001 ?auto_8002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8001 ?auto_8002 )
      ( !STACK ?auto_8001 ?auto_8000 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8005 - BLOCK
      ?auto_8006 - BLOCK
    )
    :vars
    (
      ?auto_8007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8005 ) ( ON ?auto_8006 ?auto_8007 ) ( CLEAR ?auto_8006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8005 ) ( not ( = ?auto_8005 ?auto_8006 ) ) ( not ( = ?auto_8005 ?auto_8007 ) ) ( not ( = ?auto_8006 ?auto_8007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8006 ?auto_8007 )
      ( !STACK ?auto_8006 ?auto_8005 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8010 - BLOCK
      ?auto_8011 - BLOCK
    )
    :vars
    (
      ?auto_8012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8011 ?auto_8012 ) ( not ( = ?auto_8010 ?auto_8011 ) ) ( not ( = ?auto_8010 ?auto_8012 ) ) ( not ( = ?auto_8011 ?auto_8012 ) ) ( ON ?auto_8010 ?auto_8011 ) ( CLEAR ?auto_8010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8010 )
      ( MAKE-2PILE ?auto_8010 ?auto_8011 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8015 - BLOCK
      ?auto_8016 - BLOCK
    )
    :vars
    (
      ?auto_8017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8016 ?auto_8017 ) ( not ( = ?auto_8015 ?auto_8016 ) ) ( not ( = ?auto_8015 ?auto_8017 ) ) ( not ( = ?auto_8016 ?auto_8017 ) ) ( ON ?auto_8015 ?auto_8016 ) ( CLEAR ?auto_8015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8015 )
      ( MAKE-2PILE ?auto_8015 ?auto_8016 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8021 - BLOCK
      ?auto_8022 - BLOCK
      ?auto_8023 - BLOCK
    )
    :vars
    (
      ?auto_8024 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8022 ) ( ON ?auto_8023 ?auto_8024 ) ( CLEAR ?auto_8023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8021 ) ( ON ?auto_8022 ?auto_8021 ) ( not ( = ?auto_8021 ?auto_8022 ) ) ( not ( = ?auto_8021 ?auto_8023 ) ) ( not ( = ?auto_8021 ?auto_8024 ) ) ( not ( = ?auto_8022 ?auto_8023 ) ) ( not ( = ?auto_8022 ?auto_8024 ) ) ( not ( = ?auto_8023 ?auto_8024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8023 ?auto_8024 )
      ( !STACK ?auto_8023 ?auto_8022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8028 - BLOCK
      ?auto_8029 - BLOCK
      ?auto_8030 - BLOCK
    )
    :vars
    (
      ?auto_8031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8029 ) ( ON ?auto_8030 ?auto_8031 ) ( CLEAR ?auto_8030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8028 ) ( ON ?auto_8029 ?auto_8028 ) ( not ( = ?auto_8028 ?auto_8029 ) ) ( not ( = ?auto_8028 ?auto_8030 ) ) ( not ( = ?auto_8028 ?auto_8031 ) ) ( not ( = ?auto_8029 ?auto_8030 ) ) ( not ( = ?auto_8029 ?auto_8031 ) ) ( not ( = ?auto_8030 ?auto_8031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8030 ?auto_8031 )
      ( !STACK ?auto_8030 ?auto_8029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8035 - BLOCK
      ?auto_8036 - BLOCK
      ?auto_8037 - BLOCK
    )
    :vars
    (
      ?auto_8038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8037 ?auto_8038 ) ( ON-TABLE ?auto_8035 ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8038 ) ) ( not ( = ?auto_8036 ?auto_8037 ) ) ( not ( = ?auto_8036 ?auto_8038 ) ) ( not ( = ?auto_8037 ?auto_8038 ) ) ( CLEAR ?auto_8035 ) ( ON ?auto_8036 ?auto_8037 ) ( CLEAR ?auto_8036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8035 ?auto_8036 )
      ( MAKE-3PILE ?auto_8035 ?auto_8036 ?auto_8037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8042 - BLOCK
      ?auto_8043 - BLOCK
      ?auto_8044 - BLOCK
    )
    :vars
    (
      ?auto_8045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8044 ?auto_8045 ) ( ON-TABLE ?auto_8042 ) ( not ( = ?auto_8042 ?auto_8043 ) ) ( not ( = ?auto_8042 ?auto_8044 ) ) ( not ( = ?auto_8042 ?auto_8045 ) ) ( not ( = ?auto_8043 ?auto_8044 ) ) ( not ( = ?auto_8043 ?auto_8045 ) ) ( not ( = ?auto_8044 ?auto_8045 ) ) ( CLEAR ?auto_8042 ) ( ON ?auto_8043 ?auto_8044 ) ( CLEAR ?auto_8043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8042 ?auto_8043 )
      ( MAKE-3PILE ?auto_8042 ?auto_8043 ?auto_8044 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8049 - BLOCK
      ?auto_8050 - BLOCK
      ?auto_8051 - BLOCK
    )
    :vars
    (
      ?auto_8052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8051 ?auto_8052 ) ( not ( = ?auto_8049 ?auto_8050 ) ) ( not ( = ?auto_8049 ?auto_8051 ) ) ( not ( = ?auto_8049 ?auto_8052 ) ) ( not ( = ?auto_8050 ?auto_8051 ) ) ( not ( = ?auto_8050 ?auto_8052 ) ) ( not ( = ?auto_8051 ?auto_8052 ) ) ( ON ?auto_8050 ?auto_8051 ) ( ON ?auto_8049 ?auto_8050 ) ( CLEAR ?auto_8049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8049 )
      ( MAKE-3PILE ?auto_8049 ?auto_8050 ?auto_8051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8056 - BLOCK
      ?auto_8057 - BLOCK
      ?auto_8058 - BLOCK
    )
    :vars
    (
      ?auto_8059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8058 ?auto_8059 ) ( not ( = ?auto_8056 ?auto_8057 ) ) ( not ( = ?auto_8056 ?auto_8058 ) ) ( not ( = ?auto_8056 ?auto_8059 ) ) ( not ( = ?auto_8057 ?auto_8058 ) ) ( not ( = ?auto_8057 ?auto_8059 ) ) ( not ( = ?auto_8058 ?auto_8059 ) ) ( ON ?auto_8057 ?auto_8058 ) ( ON ?auto_8056 ?auto_8057 ) ( CLEAR ?auto_8056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8056 )
      ( MAKE-3PILE ?auto_8056 ?auto_8057 ?auto_8058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8064 - BLOCK
      ?auto_8065 - BLOCK
      ?auto_8066 - BLOCK
      ?auto_8067 - BLOCK
    )
    :vars
    (
      ?auto_8068 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8066 ) ( ON ?auto_8067 ?auto_8068 ) ( CLEAR ?auto_8067 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8064 ) ( ON ?auto_8065 ?auto_8064 ) ( ON ?auto_8066 ?auto_8065 ) ( not ( = ?auto_8064 ?auto_8065 ) ) ( not ( = ?auto_8064 ?auto_8066 ) ) ( not ( = ?auto_8064 ?auto_8067 ) ) ( not ( = ?auto_8064 ?auto_8068 ) ) ( not ( = ?auto_8065 ?auto_8066 ) ) ( not ( = ?auto_8065 ?auto_8067 ) ) ( not ( = ?auto_8065 ?auto_8068 ) ) ( not ( = ?auto_8066 ?auto_8067 ) ) ( not ( = ?auto_8066 ?auto_8068 ) ) ( not ( = ?auto_8067 ?auto_8068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8067 ?auto_8068 )
      ( !STACK ?auto_8067 ?auto_8066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8073 - BLOCK
      ?auto_8074 - BLOCK
      ?auto_8075 - BLOCK
      ?auto_8076 - BLOCK
    )
    :vars
    (
      ?auto_8077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8075 ) ( ON ?auto_8076 ?auto_8077 ) ( CLEAR ?auto_8076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8073 ) ( ON ?auto_8074 ?auto_8073 ) ( ON ?auto_8075 ?auto_8074 ) ( not ( = ?auto_8073 ?auto_8074 ) ) ( not ( = ?auto_8073 ?auto_8075 ) ) ( not ( = ?auto_8073 ?auto_8076 ) ) ( not ( = ?auto_8073 ?auto_8077 ) ) ( not ( = ?auto_8074 ?auto_8075 ) ) ( not ( = ?auto_8074 ?auto_8076 ) ) ( not ( = ?auto_8074 ?auto_8077 ) ) ( not ( = ?auto_8075 ?auto_8076 ) ) ( not ( = ?auto_8075 ?auto_8077 ) ) ( not ( = ?auto_8076 ?auto_8077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8076 ?auto_8077 )
      ( !STACK ?auto_8076 ?auto_8075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8082 - BLOCK
      ?auto_8083 - BLOCK
      ?auto_8084 - BLOCK
      ?auto_8085 - BLOCK
    )
    :vars
    (
      ?auto_8086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8085 ?auto_8086 ) ( ON-TABLE ?auto_8082 ) ( ON ?auto_8083 ?auto_8082 ) ( not ( = ?auto_8082 ?auto_8083 ) ) ( not ( = ?auto_8082 ?auto_8084 ) ) ( not ( = ?auto_8082 ?auto_8085 ) ) ( not ( = ?auto_8082 ?auto_8086 ) ) ( not ( = ?auto_8083 ?auto_8084 ) ) ( not ( = ?auto_8083 ?auto_8085 ) ) ( not ( = ?auto_8083 ?auto_8086 ) ) ( not ( = ?auto_8084 ?auto_8085 ) ) ( not ( = ?auto_8084 ?auto_8086 ) ) ( not ( = ?auto_8085 ?auto_8086 ) ) ( CLEAR ?auto_8083 ) ( ON ?auto_8084 ?auto_8085 ) ( CLEAR ?auto_8084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8082 ?auto_8083 ?auto_8084 )
      ( MAKE-4PILE ?auto_8082 ?auto_8083 ?auto_8084 ?auto_8085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8091 - BLOCK
      ?auto_8092 - BLOCK
      ?auto_8093 - BLOCK
      ?auto_8094 - BLOCK
    )
    :vars
    (
      ?auto_8095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8094 ?auto_8095 ) ( ON-TABLE ?auto_8091 ) ( ON ?auto_8092 ?auto_8091 ) ( not ( = ?auto_8091 ?auto_8092 ) ) ( not ( = ?auto_8091 ?auto_8093 ) ) ( not ( = ?auto_8091 ?auto_8094 ) ) ( not ( = ?auto_8091 ?auto_8095 ) ) ( not ( = ?auto_8092 ?auto_8093 ) ) ( not ( = ?auto_8092 ?auto_8094 ) ) ( not ( = ?auto_8092 ?auto_8095 ) ) ( not ( = ?auto_8093 ?auto_8094 ) ) ( not ( = ?auto_8093 ?auto_8095 ) ) ( not ( = ?auto_8094 ?auto_8095 ) ) ( CLEAR ?auto_8092 ) ( ON ?auto_8093 ?auto_8094 ) ( CLEAR ?auto_8093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8091 ?auto_8092 ?auto_8093 )
      ( MAKE-4PILE ?auto_8091 ?auto_8092 ?auto_8093 ?auto_8094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8100 - BLOCK
      ?auto_8101 - BLOCK
      ?auto_8102 - BLOCK
      ?auto_8103 - BLOCK
    )
    :vars
    (
      ?auto_8104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8103 ?auto_8104 ) ( ON-TABLE ?auto_8100 ) ( not ( = ?auto_8100 ?auto_8101 ) ) ( not ( = ?auto_8100 ?auto_8102 ) ) ( not ( = ?auto_8100 ?auto_8103 ) ) ( not ( = ?auto_8100 ?auto_8104 ) ) ( not ( = ?auto_8101 ?auto_8102 ) ) ( not ( = ?auto_8101 ?auto_8103 ) ) ( not ( = ?auto_8101 ?auto_8104 ) ) ( not ( = ?auto_8102 ?auto_8103 ) ) ( not ( = ?auto_8102 ?auto_8104 ) ) ( not ( = ?auto_8103 ?auto_8104 ) ) ( ON ?auto_8102 ?auto_8103 ) ( CLEAR ?auto_8100 ) ( ON ?auto_8101 ?auto_8102 ) ( CLEAR ?auto_8101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8100 ?auto_8101 )
      ( MAKE-4PILE ?auto_8100 ?auto_8101 ?auto_8102 ?auto_8103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8109 - BLOCK
      ?auto_8110 - BLOCK
      ?auto_8111 - BLOCK
      ?auto_8112 - BLOCK
    )
    :vars
    (
      ?auto_8113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8112 ?auto_8113 ) ( ON-TABLE ?auto_8109 ) ( not ( = ?auto_8109 ?auto_8110 ) ) ( not ( = ?auto_8109 ?auto_8111 ) ) ( not ( = ?auto_8109 ?auto_8112 ) ) ( not ( = ?auto_8109 ?auto_8113 ) ) ( not ( = ?auto_8110 ?auto_8111 ) ) ( not ( = ?auto_8110 ?auto_8112 ) ) ( not ( = ?auto_8110 ?auto_8113 ) ) ( not ( = ?auto_8111 ?auto_8112 ) ) ( not ( = ?auto_8111 ?auto_8113 ) ) ( not ( = ?auto_8112 ?auto_8113 ) ) ( ON ?auto_8111 ?auto_8112 ) ( CLEAR ?auto_8109 ) ( ON ?auto_8110 ?auto_8111 ) ( CLEAR ?auto_8110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8109 ?auto_8110 )
      ( MAKE-4PILE ?auto_8109 ?auto_8110 ?auto_8111 ?auto_8112 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8118 - BLOCK
      ?auto_8119 - BLOCK
      ?auto_8120 - BLOCK
      ?auto_8121 - BLOCK
    )
    :vars
    (
      ?auto_8122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8121 ?auto_8122 ) ( not ( = ?auto_8118 ?auto_8119 ) ) ( not ( = ?auto_8118 ?auto_8120 ) ) ( not ( = ?auto_8118 ?auto_8121 ) ) ( not ( = ?auto_8118 ?auto_8122 ) ) ( not ( = ?auto_8119 ?auto_8120 ) ) ( not ( = ?auto_8119 ?auto_8121 ) ) ( not ( = ?auto_8119 ?auto_8122 ) ) ( not ( = ?auto_8120 ?auto_8121 ) ) ( not ( = ?auto_8120 ?auto_8122 ) ) ( not ( = ?auto_8121 ?auto_8122 ) ) ( ON ?auto_8120 ?auto_8121 ) ( ON ?auto_8119 ?auto_8120 ) ( ON ?auto_8118 ?auto_8119 ) ( CLEAR ?auto_8118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8118 )
      ( MAKE-4PILE ?auto_8118 ?auto_8119 ?auto_8120 ?auto_8121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8127 - BLOCK
      ?auto_8128 - BLOCK
      ?auto_8129 - BLOCK
      ?auto_8130 - BLOCK
    )
    :vars
    (
      ?auto_8131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8130 ?auto_8131 ) ( not ( = ?auto_8127 ?auto_8128 ) ) ( not ( = ?auto_8127 ?auto_8129 ) ) ( not ( = ?auto_8127 ?auto_8130 ) ) ( not ( = ?auto_8127 ?auto_8131 ) ) ( not ( = ?auto_8128 ?auto_8129 ) ) ( not ( = ?auto_8128 ?auto_8130 ) ) ( not ( = ?auto_8128 ?auto_8131 ) ) ( not ( = ?auto_8129 ?auto_8130 ) ) ( not ( = ?auto_8129 ?auto_8131 ) ) ( not ( = ?auto_8130 ?auto_8131 ) ) ( ON ?auto_8129 ?auto_8130 ) ( ON ?auto_8128 ?auto_8129 ) ( ON ?auto_8127 ?auto_8128 ) ( CLEAR ?auto_8127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8127 )
      ( MAKE-4PILE ?auto_8127 ?auto_8128 ?auto_8129 ?auto_8130 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8137 - BLOCK
      ?auto_8138 - BLOCK
      ?auto_8139 - BLOCK
      ?auto_8140 - BLOCK
      ?auto_8141 - BLOCK
    )
    :vars
    (
      ?auto_8142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8140 ) ( ON ?auto_8141 ?auto_8142 ) ( CLEAR ?auto_8141 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8137 ) ( ON ?auto_8138 ?auto_8137 ) ( ON ?auto_8139 ?auto_8138 ) ( ON ?auto_8140 ?auto_8139 ) ( not ( = ?auto_8137 ?auto_8138 ) ) ( not ( = ?auto_8137 ?auto_8139 ) ) ( not ( = ?auto_8137 ?auto_8140 ) ) ( not ( = ?auto_8137 ?auto_8141 ) ) ( not ( = ?auto_8137 ?auto_8142 ) ) ( not ( = ?auto_8138 ?auto_8139 ) ) ( not ( = ?auto_8138 ?auto_8140 ) ) ( not ( = ?auto_8138 ?auto_8141 ) ) ( not ( = ?auto_8138 ?auto_8142 ) ) ( not ( = ?auto_8139 ?auto_8140 ) ) ( not ( = ?auto_8139 ?auto_8141 ) ) ( not ( = ?auto_8139 ?auto_8142 ) ) ( not ( = ?auto_8140 ?auto_8141 ) ) ( not ( = ?auto_8140 ?auto_8142 ) ) ( not ( = ?auto_8141 ?auto_8142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8141 ?auto_8142 )
      ( !STACK ?auto_8141 ?auto_8140 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8148 - BLOCK
      ?auto_8149 - BLOCK
      ?auto_8150 - BLOCK
      ?auto_8151 - BLOCK
      ?auto_8152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8151 ) ( ON-TABLE ?auto_8152 ) ( CLEAR ?auto_8152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8148 ) ( ON ?auto_8149 ?auto_8148 ) ( ON ?auto_8150 ?auto_8149 ) ( ON ?auto_8151 ?auto_8150 ) ( not ( = ?auto_8148 ?auto_8149 ) ) ( not ( = ?auto_8148 ?auto_8150 ) ) ( not ( = ?auto_8148 ?auto_8151 ) ) ( not ( = ?auto_8148 ?auto_8152 ) ) ( not ( = ?auto_8149 ?auto_8150 ) ) ( not ( = ?auto_8149 ?auto_8151 ) ) ( not ( = ?auto_8149 ?auto_8152 ) ) ( not ( = ?auto_8150 ?auto_8151 ) ) ( not ( = ?auto_8150 ?auto_8152 ) ) ( not ( = ?auto_8151 ?auto_8152 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_8152 )
      ( !STACK ?auto_8152 ?auto_8151 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8158 - BLOCK
      ?auto_8159 - BLOCK
      ?auto_8160 - BLOCK
      ?auto_8161 - BLOCK
      ?auto_8162 - BLOCK
    )
    :vars
    (
      ?auto_8163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8162 ?auto_8163 ) ( ON-TABLE ?auto_8158 ) ( ON ?auto_8159 ?auto_8158 ) ( ON ?auto_8160 ?auto_8159 ) ( not ( = ?auto_8158 ?auto_8159 ) ) ( not ( = ?auto_8158 ?auto_8160 ) ) ( not ( = ?auto_8158 ?auto_8161 ) ) ( not ( = ?auto_8158 ?auto_8162 ) ) ( not ( = ?auto_8158 ?auto_8163 ) ) ( not ( = ?auto_8159 ?auto_8160 ) ) ( not ( = ?auto_8159 ?auto_8161 ) ) ( not ( = ?auto_8159 ?auto_8162 ) ) ( not ( = ?auto_8159 ?auto_8163 ) ) ( not ( = ?auto_8160 ?auto_8161 ) ) ( not ( = ?auto_8160 ?auto_8162 ) ) ( not ( = ?auto_8160 ?auto_8163 ) ) ( not ( = ?auto_8161 ?auto_8162 ) ) ( not ( = ?auto_8161 ?auto_8163 ) ) ( not ( = ?auto_8162 ?auto_8163 ) ) ( CLEAR ?auto_8160 ) ( ON ?auto_8161 ?auto_8162 ) ( CLEAR ?auto_8161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8158 ?auto_8159 ?auto_8160 ?auto_8161 )
      ( MAKE-5PILE ?auto_8158 ?auto_8159 ?auto_8160 ?auto_8161 ?auto_8162 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8169 - BLOCK
      ?auto_8170 - BLOCK
      ?auto_8171 - BLOCK
      ?auto_8172 - BLOCK
      ?auto_8173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8173 ) ( ON-TABLE ?auto_8169 ) ( ON ?auto_8170 ?auto_8169 ) ( ON ?auto_8171 ?auto_8170 ) ( not ( = ?auto_8169 ?auto_8170 ) ) ( not ( = ?auto_8169 ?auto_8171 ) ) ( not ( = ?auto_8169 ?auto_8172 ) ) ( not ( = ?auto_8169 ?auto_8173 ) ) ( not ( = ?auto_8170 ?auto_8171 ) ) ( not ( = ?auto_8170 ?auto_8172 ) ) ( not ( = ?auto_8170 ?auto_8173 ) ) ( not ( = ?auto_8171 ?auto_8172 ) ) ( not ( = ?auto_8171 ?auto_8173 ) ) ( not ( = ?auto_8172 ?auto_8173 ) ) ( CLEAR ?auto_8171 ) ( ON ?auto_8172 ?auto_8173 ) ( CLEAR ?auto_8172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8169 ?auto_8170 ?auto_8171 ?auto_8172 )
      ( MAKE-5PILE ?auto_8169 ?auto_8170 ?auto_8171 ?auto_8172 ?auto_8173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8179 - BLOCK
      ?auto_8180 - BLOCK
      ?auto_8181 - BLOCK
      ?auto_8182 - BLOCK
      ?auto_8183 - BLOCK
    )
    :vars
    (
      ?auto_8184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8183 ?auto_8184 ) ( ON-TABLE ?auto_8179 ) ( ON ?auto_8180 ?auto_8179 ) ( not ( = ?auto_8179 ?auto_8180 ) ) ( not ( = ?auto_8179 ?auto_8181 ) ) ( not ( = ?auto_8179 ?auto_8182 ) ) ( not ( = ?auto_8179 ?auto_8183 ) ) ( not ( = ?auto_8179 ?auto_8184 ) ) ( not ( = ?auto_8180 ?auto_8181 ) ) ( not ( = ?auto_8180 ?auto_8182 ) ) ( not ( = ?auto_8180 ?auto_8183 ) ) ( not ( = ?auto_8180 ?auto_8184 ) ) ( not ( = ?auto_8181 ?auto_8182 ) ) ( not ( = ?auto_8181 ?auto_8183 ) ) ( not ( = ?auto_8181 ?auto_8184 ) ) ( not ( = ?auto_8182 ?auto_8183 ) ) ( not ( = ?auto_8182 ?auto_8184 ) ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( ON ?auto_8182 ?auto_8183 ) ( CLEAR ?auto_8180 ) ( ON ?auto_8181 ?auto_8182 ) ( CLEAR ?auto_8181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8179 ?auto_8180 ?auto_8181 )
      ( MAKE-5PILE ?auto_8179 ?auto_8180 ?auto_8181 ?auto_8182 ?auto_8183 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8190 - BLOCK
      ?auto_8191 - BLOCK
      ?auto_8192 - BLOCK
      ?auto_8193 - BLOCK
      ?auto_8194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8194 ) ( ON-TABLE ?auto_8190 ) ( ON ?auto_8191 ?auto_8190 ) ( not ( = ?auto_8190 ?auto_8191 ) ) ( not ( = ?auto_8190 ?auto_8192 ) ) ( not ( = ?auto_8190 ?auto_8193 ) ) ( not ( = ?auto_8190 ?auto_8194 ) ) ( not ( = ?auto_8191 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8193 ) ) ( not ( = ?auto_8191 ?auto_8194 ) ) ( not ( = ?auto_8192 ?auto_8193 ) ) ( not ( = ?auto_8192 ?auto_8194 ) ) ( not ( = ?auto_8193 ?auto_8194 ) ) ( ON ?auto_8193 ?auto_8194 ) ( CLEAR ?auto_8191 ) ( ON ?auto_8192 ?auto_8193 ) ( CLEAR ?auto_8192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8190 ?auto_8191 ?auto_8192 )
      ( MAKE-5PILE ?auto_8190 ?auto_8191 ?auto_8192 ?auto_8193 ?auto_8194 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8200 - BLOCK
      ?auto_8201 - BLOCK
      ?auto_8202 - BLOCK
      ?auto_8203 - BLOCK
      ?auto_8204 - BLOCK
    )
    :vars
    (
      ?auto_8205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8204 ?auto_8205 ) ( ON-TABLE ?auto_8200 ) ( not ( = ?auto_8200 ?auto_8201 ) ) ( not ( = ?auto_8200 ?auto_8202 ) ) ( not ( = ?auto_8200 ?auto_8203 ) ) ( not ( = ?auto_8200 ?auto_8204 ) ) ( not ( = ?auto_8200 ?auto_8205 ) ) ( not ( = ?auto_8201 ?auto_8202 ) ) ( not ( = ?auto_8201 ?auto_8203 ) ) ( not ( = ?auto_8201 ?auto_8204 ) ) ( not ( = ?auto_8201 ?auto_8205 ) ) ( not ( = ?auto_8202 ?auto_8203 ) ) ( not ( = ?auto_8202 ?auto_8204 ) ) ( not ( = ?auto_8202 ?auto_8205 ) ) ( not ( = ?auto_8203 ?auto_8204 ) ) ( not ( = ?auto_8203 ?auto_8205 ) ) ( not ( = ?auto_8204 ?auto_8205 ) ) ( ON ?auto_8203 ?auto_8204 ) ( ON ?auto_8202 ?auto_8203 ) ( CLEAR ?auto_8200 ) ( ON ?auto_8201 ?auto_8202 ) ( CLEAR ?auto_8201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8200 ?auto_8201 )
      ( MAKE-5PILE ?auto_8200 ?auto_8201 ?auto_8202 ?auto_8203 ?auto_8204 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8211 - BLOCK
      ?auto_8212 - BLOCK
      ?auto_8213 - BLOCK
      ?auto_8214 - BLOCK
      ?auto_8215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8215 ) ( ON-TABLE ?auto_8211 ) ( not ( = ?auto_8211 ?auto_8212 ) ) ( not ( = ?auto_8211 ?auto_8213 ) ) ( not ( = ?auto_8211 ?auto_8214 ) ) ( not ( = ?auto_8211 ?auto_8215 ) ) ( not ( = ?auto_8212 ?auto_8213 ) ) ( not ( = ?auto_8212 ?auto_8214 ) ) ( not ( = ?auto_8212 ?auto_8215 ) ) ( not ( = ?auto_8213 ?auto_8214 ) ) ( not ( = ?auto_8213 ?auto_8215 ) ) ( not ( = ?auto_8214 ?auto_8215 ) ) ( ON ?auto_8214 ?auto_8215 ) ( ON ?auto_8213 ?auto_8214 ) ( CLEAR ?auto_8211 ) ( ON ?auto_8212 ?auto_8213 ) ( CLEAR ?auto_8212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8211 ?auto_8212 )
      ( MAKE-5PILE ?auto_8211 ?auto_8212 ?auto_8213 ?auto_8214 ?auto_8215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8221 - BLOCK
      ?auto_8222 - BLOCK
      ?auto_8223 - BLOCK
      ?auto_8224 - BLOCK
      ?auto_8225 - BLOCK
    )
    :vars
    (
      ?auto_8226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8225 ?auto_8226 ) ( not ( = ?auto_8221 ?auto_8222 ) ) ( not ( = ?auto_8221 ?auto_8223 ) ) ( not ( = ?auto_8221 ?auto_8224 ) ) ( not ( = ?auto_8221 ?auto_8225 ) ) ( not ( = ?auto_8221 ?auto_8226 ) ) ( not ( = ?auto_8222 ?auto_8223 ) ) ( not ( = ?auto_8222 ?auto_8224 ) ) ( not ( = ?auto_8222 ?auto_8225 ) ) ( not ( = ?auto_8222 ?auto_8226 ) ) ( not ( = ?auto_8223 ?auto_8224 ) ) ( not ( = ?auto_8223 ?auto_8225 ) ) ( not ( = ?auto_8223 ?auto_8226 ) ) ( not ( = ?auto_8224 ?auto_8225 ) ) ( not ( = ?auto_8224 ?auto_8226 ) ) ( not ( = ?auto_8225 ?auto_8226 ) ) ( ON ?auto_8224 ?auto_8225 ) ( ON ?auto_8223 ?auto_8224 ) ( ON ?auto_8222 ?auto_8223 ) ( ON ?auto_8221 ?auto_8222 ) ( CLEAR ?auto_8221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8221 )
      ( MAKE-5PILE ?auto_8221 ?auto_8222 ?auto_8223 ?auto_8224 ?auto_8225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8232 - BLOCK
      ?auto_8233 - BLOCK
      ?auto_8234 - BLOCK
      ?auto_8235 - BLOCK
      ?auto_8236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8236 ) ( not ( = ?auto_8232 ?auto_8233 ) ) ( not ( = ?auto_8232 ?auto_8234 ) ) ( not ( = ?auto_8232 ?auto_8235 ) ) ( not ( = ?auto_8232 ?auto_8236 ) ) ( not ( = ?auto_8233 ?auto_8234 ) ) ( not ( = ?auto_8233 ?auto_8235 ) ) ( not ( = ?auto_8233 ?auto_8236 ) ) ( not ( = ?auto_8234 ?auto_8235 ) ) ( not ( = ?auto_8234 ?auto_8236 ) ) ( not ( = ?auto_8235 ?auto_8236 ) ) ( ON ?auto_8235 ?auto_8236 ) ( ON ?auto_8234 ?auto_8235 ) ( ON ?auto_8233 ?auto_8234 ) ( ON ?auto_8232 ?auto_8233 ) ( CLEAR ?auto_8232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8232 )
      ( MAKE-5PILE ?auto_8232 ?auto_8233 ?auto_8234 ?auto_8235 ?auto_8236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8242 - BLOCK
      ?auto_8243 - BLOCK
      ?auto_8244 - BLOCK
      ?auto_8245 - BLOCK
      ?auto_8246 - BLOCK
    )
    :vars
    (
      ?auto_8247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8242 ?auto_8243 ) ) ( not ( = ?auto_8242 ?auto_8244 ) ) ( not ( = ?auto_8242 ?auto_8245 ) ) ( not ( = ?auto_8242 ?auto_8246 ) ) ( not ( = ?auto_8243 ?auto_8244 ) ) ( not ( = ?auto_8243 ?auto_8245 ) ) ( not ( = ?auto_8243 ?auto_8246 ) ) ( not ( = ?auto_8244 ?auto_8245 ) ) ( not ( = ?auto_8244 ?auto_8246 ) ) ( not ( = ?auto_8245 ?auto_8246 ) ) ( ON ?auto_8242 ?auto_8247 ) ( not ( = ?auto_8246 ?auto_8247 ) ) ( not ( = ?auto_8245 ?auto_8247 ) ) ( not ( = ?auto_8244 ?auto_8247 ) ) ( not ( = ?auto_8243 ?auto_8247 ) ) ( not ( = ?auto_8242 ?auto_8247 ) ) ( ON ?auto_8243 ?auto_8242 ) ( ON ?auto_8244 ?auto_8243 ) ( ON ?auto_8245 ?auto_8244 ) ( ON ?auto_8246 ?auto_8245 ) ( CLEAR ?auto_8246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_8246 ?auto_8245 ?auto_8244 ?auto_8243 ?auto_8242 )
      ( MAKE-5PILE ?auto_8242 ?auto_8243 ?auto_8244 ?auto_8245 ?auto_8246 ) )
  )

)

