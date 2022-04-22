( define ( domain Rover )
  ( :requirements :strips :typing :equality :htn )
  ( :types camera lander mode objective rover store waypoint )
  ( :predicates
    ( AT ?R - ROVER ?Y - WAYPOINT )
    ( AT_LANDER ?L - LANDER ?Y - WAYPOINT )
    ( CAN_TRAVERSE ?R - ROVER ?X - WAYPOINT ?Y - WAYPOINT )
    ( EQUIPPED_FOR_SOIL_ANALYSIS ?R - ROVER )
    ( EQUIPPED_FOR_ROCK_ANALYSIS ?R - ROVER )
    ( EQUIPPED_FOR_IMAGING ?R - ROVER )
    ( EMPTY ?S - STORE )
    ( HAVE_ROCK_ANALYSIS ?R - ROVER ?W - WAYPOINT )
    ( HAVE_SOIL_ANALYSIS ?R - ROVER ?W - WAYPOINT )
    ( FULL ?S - STORE )
    ( CALIBRATED ?C - CAMERA ?R - ROVER )
    ( SUPPORTS ?C - CAMERA ?M - MODE )
    ( AVAILABLE ?R - ROVER )
    ( VISIBLE ?W - WAYPOINT ?P - WAYPOINT )
    ( HAVE_IMAGE ?R - ROVER ?O - OBJECTIVE ?M - MODE )
    ( COMMUNICATED_SOIL_DATA ?W - WAYPOINT )
    ( COMMUNICATED_ROCK_DATA ?W - WAYPOINT )
    ( COMMUNICATED_IMAGE_DATA ?O - OBJECTIVE ?M - MODE )
    ( AT_SOIL_SAMPLE ?W - WAYPOINT )
    ( AT_ROCK_SAMPLE ?W - WAYPOINT )
    ( VISIBLE_FROM ?O - OBJECTIVE ?W - WAYPOINT )
    ( STORE_OF ?S - STORE ?R - ROVER )
    ( CALIBRATION_TARGET ?I - CAMERA ?O - OBJECTIVE )
    ( ON_BOARD ?I - CAMERA ?R - ROVER )
    ( CHANNEL_FREE ?L - LANDER )
  )
  ( :action !NAVIGATE
    :parameters
    (
      ?R - ROVER
      ?Y - WAYPOINT
      ?Z - WAYPOINT
    )
    :precondition
    ( and ( CAN_TRAVERSE ?R ?Y ?Z ) ( AVAILABLE ?R ) ( AT ?R ?Y ) ( VISIBLE ?Y ?Z ) )
    :effect
    ( and ( not ( AT ?R ?Y ) ) ( AT ?R ?Z ) )
  )
  ( :action !SAMPLE_SOIL
    :parameters
    (
      ?R - ROVER
      ?S - STORE
      ?P - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?P ) ( AT_SOIL_SAMPLE ?P ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?R ) ( STORE_OF ?S ?R ) ( EMPTY ?S ) )
    :effect
    ( and ( not ( EMPTY ?S ) ) ( FULL ?S ) ( HAVE_SOIL_ANALYSIS ?R ?P ) ( not ( AT_SOIL_SAMPLE ?P ) ) )
  )
  ( :action !SAMPLE_ROCK
    :parameters
    (
      ?R - ROVER
      ?S - STORE
      ?P - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?P ) ( AT_ROCK_SAMPLE ?P ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?R ) ( STORE_OF ?S ?R ) ( EMPTY ?S ) )
    :effect
    ( and ( not ( EMPTY ?S ) ) ( FULL ?S ) ( HAVE_ROCK_ANALYSIS ?R ?P ) ( not ( AT_ROCK_SAMPLE ?P ) ) )
  )
  ( :action !DROP
    :parameters
    (
      ?R - ROVER
      ?S - STORE
    )
    :precondition
    ( and ( STORE_OF ?S ?R ) ( FULL ?S ) )
    :effect
    ( and ( not ( FULL ?S ) ) ( EMPTY ?S ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?R - ROVER
      ?I - CAMERA
      ?T - OBJECTIVE
      ?W - WAYPOINT
    )
    :precondition
    ( and ( EQUIPPED_FOR_IMAGING ?R ) ( CALIBRATION_TARGET ?I ?T ) ( AT ?R ?W ) ( VISIBLE_FROM ?T ?W ) ( ON_BOARD ?I ?R ) )
    :effect
    ( and ( CALIBRATED ?I ?R ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?R - ROVER
      ?P - WAYPOINT
      ?O - OBJECTIVE
      ?I - CAMERA
      ?M - MODE
    )
    :precondition
    ( and ( CALIBRATED ?I ?R ) ( ON_BOARD ?I ?R ) ( EQUIPPED_FOR_IMAGING ?R ) ( SUPPORTS ?I ?M ) ( VISIBLE_FROM ?O ?P ) ( AT ?R ?P ) )
    :effect
    ( and ( HAVE_IMAGE ?R ?O ?M ) ( not ( CALIBRATED ?I ?R ) ) )
  )
  ( :action !COMMUNICATE_SOIL_DATA
    :parameters
    (
      ?R - ROVER
      ?L - LANDER
      ?P - WAYPOINT
      ?X - WAYPOINT
      ?Y - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?X ) ( AT_LANDER ?L ?Y ) ( HAVE_SOIL_ANALYSIS ?R ?P ) ( VISIBLE ?X ?Y ) ( AVAILABLE ?R ) ( CHANNEL_FREE ?L ) )
    :effect
    ( and ( CHANNEL_FREE ?L ) ( COMMUNICATED_SOIL_DATA ?P ) ( AVAILABLE ?R ) )
  )
  ( :action !COMMUNICATE_ROCK_DATA
    :parameters
    (
      ?R - ROVER
      ?L - LANDER
      ?P - WAYPOINT
      ?X - WAYPOINT
      ?Y - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?X ) ( AT_LANDER ?L ?Y ) ( HAVE_ROCK_ANALYSIS ?R ?P ) ( VISIBLE ?X ?Y ) ( AVAILABLE ?R ) ( CHANNEL_FREE ?L ) )
    :effect
    ( and ( CHANNEL_FREE ?L ) ( COMMUNICATED_ROCK_DATA ?P ) ( AVAILABLE ?R ) )
  )
  ( :action !COMMUNICATE_IMAGE_DATA
    :parameters
    (
      ?R - ROVER
      ?L - LANDER
      ?O - OBJECTIVE
      ?M - MODE
      ?X - WAYPOINT
      ?Y - WAYPOINT
    )
    :precondition
    ( and ( AT ?R ?X ) ( AT_LANDER ?L ?Y ) ( HAVE_IMAGE ?R ?O ?M ) ( VISIBLE ?X ?Y ) ( AVAILABLE ?R ) ( CHANNEL_FREE ?L ) )
    :effect
    ( and ( CHANNEL_FREE ?L ) ( COMMUNICATED_IMAGE_DATA ?O ?M ) ( AVAILABLE ?R ) )
  )
  ( :method GET_SOIL_DATA
    :parameters
    (
      ?LOCATION - WAYPOINT
    )
    :precondition
    ( and ( COMMUNICATED_SOIL_DATA ?LOCATION ) )
    :subtasks
    (  )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?LOCATION - WAYPOINT
    )
    :precondition
    ( and ( COMMUNICATED_ROCK_DATA ?LOCATION ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?OBJECTIVE - OBJECTIVE
      ?MODE - MODE
    )
    :precondition
    ( and ( COMMUNICATED_IMAGE_DATA ?OBJECTIVE ?MODE ) )
    :subtasks
    (  )
  )

  ( :method GET_SOIL_DATA-VERIFY
    :parameters
    (
      ?LOCATION - WAYPOINT
    )
    :precondition
    ( and ( COMMUNICATED_SOIL_DATA ?LOCATION ) )
    :subtasks
    (  )
  )

  ( :method GET_ROCK_DATA-VERIFY
    :parameters
    (
      ?LOCATION - WAYPOINT
    )
    :precondition
    ( and ( COMMUNICATED_ROCK_DATA ?LOCATION ) )
    :subtasks
    (  )
  )

  ( :method GET_IMAGE_DATA-VERIFY
    :parameters
    (
      ?OBJECTIVE - OBJECTIVE
      ?MODE - MODE
    )
    :precondition
    ( and ( COMMUNICATED_IMAGE_DATA ?OBJECTIVE ?MODE ) )
    :subtasks
    (  )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2 - ROVER
      ?AUTO_5 - WAYPOINT
      ?AUTO_4 - LANDER
      ?AUTO_3 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_2 ?AUTO_5 ) ( AT_LANDER ?AUTO_4 ?AUTO_3 ) ( HAVE_SOIL_ANALYSIS ?AUTO_2 ?AUTO_1 ) ( VISIBLE ?AUTO_5 ?AUTO_3 ) ( AVAILABLE ?AUTO_2 ) ( CHANNEL_FREE ?AUTO_4 ) ( not ( = ?AUTO_1 ?AUTO_5 ) ) ( not ( = ?AUTO_1 ?AUTO_3 ) ) ( not ( = ?AUTO_5 ?AUTO_3 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_2 ?AUTO_4 ?AUTO_1 ?AUTO_5 ?AUTO_3 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9 - LANDER
      ?AUTO_8 - WAYPOINT
      ?AUTO_7 - ROVER
      ?AUTO_10 - WAYPOINT
      ?AUTO_11 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9 ?AUTO_8 ) ( HAVE_SOIL_ANALYSIS ?AUTO_7 ?AUTO_6 ) ( VISIBLE ?AUTO_10 ?AUTO_8 ) ( AVAILABLE ?AUTO_7 ) ( CHANNEL_FREE ?AUTO_9 ) ( not ( = ?AUTO_6 ?AUTO_10 ) ) ( not ( = ?AUTO_6 ?AUTO_8 ) ) ( not ( = ?AUTO_10 ?AUTO_8 ) ) ( CAN_TRAVERSE ?AUTO_7 ?AUTO_11 ?AUTO_10 ) ( AT ?AUTO_7 ?AUTO_11 ) ( VISIBLE ?AUTO_11 ?AUTO_10 ) ( not ( = ?AUTO_6 ?AUTO_11 ) ) ( not ( = ?AUTO_8 ?AUTO_11 ) ) ( not ( = ?AUTO_10 ?AUTO_11 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7 ?AUTO_11 ?AUTO_10 )
      ( GET_SOIL_DATA ?AUTO_6 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_14 - WAYPOINT
    )
    :vars
    (
      ?AUTO_19 - LANDER
      ?AUTO_15 - WAYPOINT
      ?AUTO_17 - ROVER
      ?AUTO_18 - WAYPOINT
      ?AUTO_16 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_19 ?AUTO_15 ) ( HAVE_SOIL_ANALYSIS ?AUTO_17 ?AUTO_14 ) ( VISIBLE ?AUTO_18 ?AUTO_15 ) ( AVAILABLE ?AUTO_17 ) ( CHANNEL_FREE ?AUTO_19 ) ( not ( = ?AUTO_14 ?AUTO_18 ) ) ( not ( = ?AUTO_14 ?AUTO_15 ) ) ( not ( = ?AUTO_18 ?AUTO_15 ) ) ( CAN_TRAVERSE ?AUTO_17 ?AUTO_16 ?AUTO_18 ) ( VISIBLE ?AUTO_16 ?AUTO_18 ) ( not ( = ?AUTO_14 ?AUTO_16 ) ) ( not ( = ?AUTO_15 ?AUTO_16 ) ) ( not ( = ?AUTO_18 ?AUTO_16 ) ) ( CAN_TRAVERSE ?AUTO_17 ?AUTO_14 ?AUTO_16 ) ( AT ?AUTO_17 ?AUTO_14 ) ( VISIBLE ?AUTO_14 ?AUTO_16 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_17 ?AUTO_14 ?AUTO_16 )
      ( GET_SOIL_DATA ?AUTO_14 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_14 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_20 - WAYPOINT
    )
    :vars
    (
      ?AUTO_23 - LANDER
      ?AUTO_22 - WAYPOINT
      ?AUTO_24 - WAYPOINT
      ?AUTO_25 - ROVER
      ?AUTO_21 - WAYPOINT
      ?AUTO_26 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_23 ?AUTO_22 ) ( VISIBLE ?AUTO_24 ?AUTO_22 ) ( AVAILABLE ?AUTO_25 ) ( CHANNEL_FREE ?AUTO_23 ) ( not ( = ?AUTO_20 ?AUTO_24 ) ) ( not ( = ?AUTO_20 ?AUTO_22 ) ) ( not ( = ?AUTO_24 ?AUTO_22 ) ) ( CAN_TRAVERSE ?AUTO_25 ?AUTO_21 ?AUTO_24 ) ( VISIBLE ?AUTO_21 ?AUTO_24 ) ( not ( = ?AUTO_20 ?AUTO_21 ) ) ( not ( = ?AUTO_22 ?AUTO_21 ) ) ( not ( = ?AUTO_24 ?AUTO_21 ) ) ( CAN_TRAVERSE ?AUTO_25 ?AUTO_20 ?AUTO_21 ) ( AT ?AUTO_25 ?AUTO_20 ) ( VISIBLE ?AUTO_20 ?AUTO_21 ) ( AT_SOIL_SAMPLE ?AUTO_20 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_25 ) ( STORE_OF ?AUTO_26 ?AUTO_25 ) ( EMPTY ?AUTO_26 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_25 ?AUTO_26 ?AUTO_20 )
      ( GET_SOIL_DATA ?AUTO_20 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_20 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_30 - OBJECTIVE
      ?AUTO_31 - MODE
    )
    :vars
    (
      ?AUTO_32 - ROVER
      ?AUTO_35 - WAYPOINT
      ?AUTO_34 - LANDER
      ?AUTO_33 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_32 ?AUTO_35 ) ( AT_LANDER ?AUTO_34 ?AUTO_33 ) ( HAVE_IMAGE ?AUTO_32 ?AUTO_30 ?AUTO_31 ) ( VISIBLE ?AUTO_35 ?AUTO_33 ) ( AVAILABLE ?AUTO_32 ) ( CHANNEL_FREE ?AUTO_34 ) ( not ( = ?AUTO_35 ?AUTO_33 ) ) )
    :subtasks
    ( ( !COMMUNICATE_IMAGE_DATA ?AUTO_32 ?AUTO_34 ?AUTO_30 ?AUTO_31 ?AUTO_35 ?AUTO_33 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_38 - OBJECTIVE
      ?AUTO_39 - MODE
    )
    :vars
    (
      ?AUTO_40 - LANDER
      ?AUTO_41 - WAYPOINT
      ?AUTO_42 - ROVER
      ?AUTO_43 - WAYPOINT
      ?AUTO_44 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_40 ?AUTO_41 ) ( HAVE_IMAGE ?AUTO_42 ?AUTO_38 ?AUTO_39 ) ( VISIBLE ?AUTO_43 ?AUTO_41 ) ( AVAILABLE ?AUTO_42 ) ( CHANNEL_FREE ?AUTO_40 ) ( not ( = ?AUTO_43 ?AUTO_41 ) ) ( CAN_TRAVERSE ?AUTO_42 ?AUTO_44 ?AUTO_43 ) ( AT ?AUTO_42 ?AUTO_44 ) ( VISIBLE ?AUTO_44 ?AUTO_43 ) ( not ( = ?AUTO_41 ?AUTO_44 ) ) ( not ( = ?AUTO_43 ?AUTO_44 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_42 ?AUTO_44 ?AUTO_43 )
      ( GET_IMAGE_DATA ?AUTO_38 ?AUTO_39 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_38 ?AUTO_39 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_45 - OBJECTIVE
      ?AUTO_46 - MODE
    )
    :vars
    (
      ?AUTO_48 - LANDER
      ?AUTO_49 - WAYPOINT
      ?AUTO_50 - WAYPOINT
      ?AUTO_47 - ROVER
      ?AUTO_51 - WAYPOINT
      ?AUTO_52 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_48 ?AUTO_49 ) ( VISIBLE ?AUTO_50 ?AUTO_49 ) ( AVAILABLE ?AUTO_47 ) ( CHANNEL_FREE ?AUTO_48 ) ( not ( = ?AUTO_50 ?AUTO_49 ) ) ( CAN_TRAVERSE ?AUTO_47 ?AUTO_51 ?AUTO_50 ) ( AT ?AUTO_47 ?AUTO_51 ) ( VISIBLE ?AUTO_51 ?AUTO_50 ) ( not ( = ?AUTO_49 ?AUTO_51 ) ) ( not ( = ?AUTO_50 ?AUTO_51 ) ) ( CALIBRATED ?AUTO_52 ?AUTO_47 ) ( ON_BOARD ?AUTO_52 ?AUTO_47 ) ( EQUIPPED_FOR_IMAGING ?AUTO_47 ) ( SUPPORTS ?AUTO_52 ?AUTO_46 ) ( VISIBLE_FROM ?AUTO_45 ?AUTO_51 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_47 ?AUTO_51 ?AUTO_45 ?AUTO_52 ?AUTO_46 )
      ( GET_IMAGE_DATA ?AUTO_45 ?AUTO_46 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_45 ?AUTO_46 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_53 - OBJECTIVE
      ?AUTO_54 - MODE
    )
    :vars
    (
      ?AUTO_56 - LANDER
      ?AUTO_59 - WAYPOINT
      ?AUTO_60 - WAYPOINT
      ?AUTO_55 - ROVER
      ?AUTO_58 - WAYPOINT
      ?AUTO_57 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_56 ?AUTO_59 ) ( VISIBLE ?AUTO_60 ?AUTO_59 ) ( AVAILABLE ?AUTO_55 ) ( CHANNEL_FREE ?AUTO_56 ) ( not ( = ?AUTO_60 ?AUTO_59 ) ) ( CAN_TRAVERSE ?AUTO_55 ?AUTO_58 ?AUTO_60 ) ( AT ?AUTO_55 ?AUTO_58 ) ( VISIBLE ?AUTO_58 ?AUTO_60 ) ( not ( = ?AUTO_59 ?AUTO_58 ) ) ( not ( = ?AUTO_60 ?AUTO_58 ) ) ( ON_BOARD ?AUTO_57 ?AUTO_55 ) ( EQUIPPED_FOR_IMAGING ?AUTO_55 ) ( SUPPORTS ?AUTO_57 ?AUTO_54 ) ( VISIBLE_FROM ?AUTO_53 ?AUTO_58 ) ( CALIBRATION_TARGET ?AUTO_57 ?AUTO_53 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_55 ?AUTO_57 ?AUTO_53 ?AUTO_58 )
      ( GET_IMAGE_DATA ?AUTO_53 ?AUTO_54 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_53 ?AUTO_54 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_61 - OBJECTIVE
      ?AUTO_62 - MODE
    )
    :vars
    (
      ?AUTO_63 - LANDER
      ?AUTO_68 - WAYPOINT
      ?AUTO_65 - WAYPOINT
      ?AUTO_64 - ROVER
      ?AUTO_66 - WAYPOINT
      ?AUTO_67 - CAMERA
      ?AUTO_69 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_63 ?AUTO_68 ) ( VISIBLE ?AUTO_65 ?AUTO_68 ) ( AVAILABLE ?AUTO_64 ) ( CHANNEL_FREE ?AUTO_63 ) ( not ( = ?AUTO_65 ?AUTO_68 ) ) ( CAN_TRAVERSE ?AUTO_64 ?AUTO_66 ?AUTO_65 ) ( VISIBLE ?AUTO_66 ?AUTO_65 ) ( not ( = ?AUTO_68 ?AUTO_66 ) ) ( not ( = ?AUTO_65 ?AUTO_66 ) ) ( ON_BOARD ?AUTO_67 ?AUTO_64 ) ( EQUIPPED_FOR_IMAGING ?AUTO_64 ) ( SUPPORTS ?AUTO_67 ?AUTO_62 ) ( VISIBLE_FROM ?AUTO_61 ?AUTO_66 ) ( CALIBRATION_TARGET ?AUTO_67 ?AUTO_61 ) ( CAN_TRAVERSE ?AUTO_64 ?AUTO_69 ?AUTO_66 ) ( AT ?AUTO_64 ?AUTO_69 ) ( VISIBLE ?AUTO_69 ?AUTO_66 ) ( not ( = ?AUTO_68 ?AUTO_69 ) ) ( not ( = ?AUTO_65 ?AUTO_69 ) ) ( not ( = ?AUTO_66 ?AUTO_69 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_64 ?AUTO_69 ?AUTO_66 )
      ( GET_IMAGE_DATA ?AUTO_61 ?AUTO_62 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_75 - WAYPOINT
    )
    :vars
    (
      ?AUTO_76 - ROVER
      ?AUTO_78 - LANDER
      ?AUTO_77 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_76 ?AUTO_75 ) ( AT_LANDER ?AUTO_78 ?AUTO_77 ) ( HAVE_SOIL_ANALYSIS ?AUTO_76 ?AUTO_75 ) ( VISIBLE ?AUTO_75 ?AUTO_77 ) ( AVAILABLE ?AUTO_76 ) ( CHANNEL_FREE ?AUTO_78 ) ( not ( = ?AUTO_75 ?AUTO_77 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_76 ?AUTO_78 ?AUTO_75 ?AUTO_75 ?AUTO_77 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_75 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_79 - WAYPOINT
    )
    :vars
    (
      ?AUTO_82 - ROVER
      ?AUTO_81 - LANDER
      ?AUTO_80 - WAYPOINT
      ?AUTO_83 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_82 ?AUTO_79 ) ( AT_LANDER ?AUTO_81 ?AUTO_80 ) ( VISIBLE ?AUTO_79 ?AUTO_80 ) ( AVAILABLE ?AUTO_82 ) ( CHANNEL_FREE ?AUTO_81 ) ( not ( = ?AUTO_79 ?AUTO_80 ) ) ( AT_SOIL_SAMPLE ?AUTO_79 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_82 ) ( STORE_OF ?AUTO_83 ?AUTO_82 ) ( EMPTY ?AUTO_83 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_82 ?AUTO_83 ?AUTO_79 )
      ( GET_SOIL_DATA ?AUTO_79 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_79 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_91 - WAYPOINT
    )
    :vars
    (
      ?AUTO_94 - LANDER
      ?AUTO_92 - WAYPOINT
      ?AUTO_95 - ROVER
      ?AUTO_93 - STORE
      ?AUTO_96 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_94 ?AUTO_92 ) ( VISIBLE ?AUTO_91 ?AUTO_92 ) ( AVAILABLE ?AUTO_95 ) ( CHANNEL_FREE ?AUTO_94 ) ( not ( = ?AUTO_91 ?AUTO_92 ) ) ( AT_SOIL_SAMPLE ?AUTO_91 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_95 ) ( STORE_OF ?AUTO_93 ?AUTO_95 ) ( EMPTY ?AUTO_93 ) ( CAN_TRAVERSE ?AUTO_95 ?AUTO_96 ?AUTO_91 ) ( AT ?AUTO_95 ?AUTO_96 ) ( VISIBLE ?AUTO_96 ?AUTO_91 ) ( not ( = ?AUTO_91 ?AUTO_96 ) ) ( not ( = ?AUTO_92 ?AUTO_96 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_95 ?AUTO_96 ?AUTO_91 )
      ( GET_SOIL_DATA ?AUTO_91 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_91 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_114 - WAYPOINT
    )
    :vars
    (
      ?AUTO_117 - LANDER
      ?AUTO_118 - WAYPOINT
      ?AUTO_116 - ROVER
      ?AUTO_115 - STORE
      ?AUTO_119 - WAYPOINT
      ?AUTO_120 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_117 ?AUTO_118 ) ( VISIBLE ?AUTO_114 ?AUTO_118 ) ( AVAILABLE ?AUTO_116 ) ( CHANNEL_FREE ?AUTO_117 ) ( not ( = ?AUTO_114 ?AUTO_118 ) ) ( AT_SOIL_SAMPLE ?AUTO_114 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_116 ) ( STORE_OF ?AUTO_115 ?AUTO_116 ) ( EMPTY ?AUTO_115 ) ( CAN_TRAVERSE ?AUTO_116 ?AUTO_119 ?AUTO_114 ) ( VISIBLE ?AUTO_119 ?AUTO_114 ) ( not ( = ?AUTO_114 ?AUTO_119 ) ) ( not ( = ?AUTO_118 ?AUTO_119 ) ) ( CAN_TRAVERSE ?AUTO_116 ?AUTO_120 ?AUTO_119 ) ( AT ?AUTO_116 ?AUTO_120 ) ( VISIBLE ?AUTO_120 ?AUTO_119 ) ( not ( = ?AUTO_114 ?AUTO_120 ) ) ( not ( = ?AUTO_118 ?AUTO_120 ) ) ( not ( = ?AUTO_119 ?AUTO_120 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_116 ?AUTO_120 ?AUTO_119 )
      ( GET_SOIL_DATA ?AUTO_114 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_114 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_129 - OBJECTIVE
      ?AUTO_130 - MODE
    )
    :vars
    (
      ?AUTO_134 - LANDER
      ?AUTO_132 - WAYPOINT
      ?AUTO_133 - ROVER
      ?AUTO_131 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_134 ?AUTO_132 ) ( HAVE_IMAGE ?AUTO_133 ?AUTO_129 ?AUTO_130 ) ( VISIBLE ?AUTO_131 ?AUTO_132 ) ( AVAILABLE ?AUTO_133 ) ( CHANNEL_FREE ?AUTO_134 ) ( not ( = ?AUTO_131 ?AUTO_132 ) ) ( CAN_TRAVERSE ?AUTO_133 ?AUTO_132 ?AUTO_131 ) ( AT ?AUTO_133 ?AUTO_132 ) ( VISIBLE ?AUTO_132 ?AUTO_131 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_133 ?AUTO_132 ?AUTO_131 )
      ( GET_IMAGE_DATA ?AUTO_129 ?AUTO_130 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_129 ?AUTO_130 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_135 - OBJECTIVE
      ?AUTO_136 - MODE
    )
    :vars
    (
      ?AUTO_137 - LANDER
      ?AUTO_138 - WAYPOINT
      ?AUTO_140 - WAYPOINT
      ?AUTO_139 - ROVER
      ?AUTO_141 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_137 ?AUTO_138 ) ( VISIBLE ?AUTO_140 ?AUTO_138 ) ( AVAILABLE ?AUTO_139 ) ( CHANNEL_FREE ?AUTO_137 ) ( not ( = ?AUTO_140 ?AUTO_138 ) ) ( CAN_TRAVERSE ?AUTO_139 ?AUTO_138 ?AUTO_140 ) ( AT ?AUTO_139 ?AUTO_138 ) ( VISIBLE ?AUTO_138 ?AUTO_140 ) ( CALIBRATED ?AUTO_141 ?AUTO_139 ) ( ON_BOARD ?AUTO_141 ?AUTO_139 ) ( EQUIPPED_FOR_IMAGING ?AUTO_139 ) ( SUPPORTS ?AUTO_141 ?AUTO_136 ) ( VISIBLE_FROM ?AUTO_135 ?AUTO_138 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_139 ?AUTO_138 ?AUTO_135 ?AUTO_141 ?AUTO_136 )
      ( GET_IMAGE_DATA ?AUTO_135 ?AUTO_136 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_135 ?AUTO_136 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_142 - OBJECTIVE
      ?AUTO_143 - MODE
    )
    :vars
    (
      ?AUTO_147 - LANDER
      ?AUTO_144 - WAYPOINT
      ?AUTO_145 - WAYPOINT
      ?AUTO_148 - ROVER
      ?AUTO_146 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_147 ?AUTO_144 ) ( VISIBLE ?AUTO_145 ?AUTO_144 ) ( AVAILABLE ?AUTO_148 ) ( CHANNEL_FREE ?AUTO_147 ) ( not ( = ?AUTO_145 ?AUTO_144 ) ) ( CAN_TRAVERSE ?AUTO_148 ?AUTO_144 ?AUTO_145 ) ( AT ?AUTO_148 ?AUTO_144 ) ( VISIBLE ?AUTO_144 ?AUTO_145 ) ( ON_BOARD ?AUTO_146 ?AUTO_148 ) ( EQUIPPED_FOR_IMAGING ?AUTO_148 ) ( SUPPORTS ?AUTO_146 ?AUTO_143 ) ( VISIBLE_FROM ?AUTO_142 ?AUTO_144 ) ( CALIBRATION_TARGET ?AUTO_146 ?AUTO_142 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_148 ?AUTO_146 ?AUTO_142 ?AUTO_144 )
      ( GET_IMAGE_DATA ?AUTO_142 ?AUTO_143 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_142 ?AUTO_143 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_149 - OBJECTIVE
      ?AUTO_150 - MODE
    )
    :vars
    (
      ?AUTO_154 - LANDER
      ?AUTO_152 - WAYPOINT
      ?AUTO_151 - WAYPOINT
      ?AUTO_155 - ROVER
      ?AUTO_153 - CAMERA
      ?AUTO_156 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_154 ?AUTO_152 ) ( VISIBLE ?AUTO_151 ?AUTO_152 ) ( AVAILABLE ?AUTO_155 ) ( CHANNEL_FREE ?AUTO_154 ) ( not ( = ?AUTO_151 ?AUTO_152 ) ) ( CAN_TRAVERSE ?AUTO_155 ?AUTO_152 ?AUTO_151 ) ( VISIBLE ?AUTO_152 ?AUTO_151 ) ( ON_BOARD ?AUTO_153 ?AUTO_155 ) ( EQUIPPED_FOR_IMAGING ?AUTO_155 ) ( SUPPORTS ?AUTO_153 ?AUTO_150 ) ( VISIBLE_FROM ?AUTO_149 ?AUTO_152 ) ( CALIBRATION_TARGET ?AUTO_153 ?AUTO_149 ) ( CAN_TRAVERSE ?AUTO_155 ?AUTO_156 ?AUTO_152 ) ( AT ?AUTO_155 ?AUTO_156 ) ( VISIBLE ?AUTO_156 ?AUTO_152 ) ( not ( = ?AUTO_152 ?AUTO_156 ) ) ( not ( = ?AUTO_151 ?AUTO_156 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_155 ?AUTO_156 ?AUTO_152 )
      ( GET_IMAGE_DATA ?AUTO_149 ?AUTO_150 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_149 ?AUTO_150 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_163 - OBJECTIVE
      ?AUTO_164 - MODE
    )
    :vars
    (
      ?AUTO_167 - LANDER
      ?AUTO_168 - WAYPOINT
      ?AUTO_169 - WAYPOINT
      ?AUTO_165 - ROVER
      ?AUTO_170 - CAMERA
      ?AUTO_166 - WAYPOINT
      ?AUTO_171 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_167 ?AUTO_168 ) ( VISIBLE ?AUTO_169 ?AUTO_168 ) ( AVAILABLE ?AUTO_165 ) ( CHANNEL_FREE ?AUTO_167 ) ( not ( = ?AUTO_169 ?AUTO_168 ) ) ( CAN_TRAVERSE ?AUTO_165 ?AUTO_168 ?AUTO_169 ) ( VISIBLE ?AUTO_168 ?AUTO_169 ) ( ON_BOARD ?AUTO_170 ?AUTO_165 ) ( EQUIPPED_FOR_IMAGING ?AUTO_165 ) ( SUPPORTS ?AUTO_170 ?AUTO_164 ) ( VISIBLE_FROM ?AUTO_163 ?AUTO_168 ) ( CALIBRATION_TARGET ?AUTO_170 ?AUTO_163 ) ( CAN_TRAVERSE ?AUTO_165 ?AUTO_166 ?AUTO_168 ) ( VISIBLE ?AUTO_166 ?AUTO_168 ) ( not ( = ?AUTO_168 ?AUTO_166 ) ) ( not ( = ?AUTO_169 ?AUTO_166 ) ) ( CAN_TRAVERSE ?AUTO_165 ?AUTO_171 ?AUTO_166 ) ( AT ?AUTO_165 ?AUTO_171 ) ( VISIBLE ?AUTO_171 ?AUTO_166 ) ( not ( = ?AUTO_168 ?AUTO_171 ) ) ( not ( = ?AUTO_169 ?AUTO_171 ) ) ( not ( = ?AUTO_166 ?AUTO_171 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_165 ?AUTO_171 ?AUTO_166 )
      ( GET_IMAGE_DATA ?AUTO_163 ?AUTO_164 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_200 - WAYPOINT
    )
    :vars
    (
      ?AUTO_201 - ROVER
      ?AUTO_204 - WAYPOINT
      ?AUTO_203 - LANDER
      ?AUTO_202 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_201 ?AUTO_204 ) ( AT_LANDER ?AUTO_203 ?AUTO_202 ) ( HAVE_ROCK_ANALYSIS ?AUTO_201 ?AUTO_200 ) ( VISIBLE ?AUTO_204 ?AUTO_202 ) ( AVAILABLE ?AUTO_201 ) ( CHANNEL_FREE ?AUTO_203 ) ( not ( = ?AUTO_200 ?AUTO_204 ) ) ( not ( = ?AUTO_200 ?AUTO_202 ) ) ( not ( = ?AUTO_204 ?AUTO_202 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_201 ?AUTO_203 ?AUTO_200 ?AUTO_204 ?AUTO_202 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_200 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_205 - WAYPOINT
    )
    :vars
    (
      ?AUTO_208 - LANDER
      ?AUTO_207 - WAYPOINT
      ?AUTO_206 - ROVER
      ?AUTO_209 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_208 ?AUTO_207 ) ( HAVE_ROCK_ANALYSIS ?AUTO_206 ?AUTO_205 ) ( VISIBLE ?AUTO_209 ?AUTO_207 ) ( AVAILABLE ?AUTO_206 ) ( CHANNEL_FREE ?AUTO_208 ) ( not ( = ?AUTO_205 ?AUTO_209 ) ) ( not ( = ?AUTO_205 ?AUTO_207 ) ) ( not ( = ?AUTO_209 ?AUTO_207 ) ) ( CAN_TRAVERSE ?AUTO_206 ?AUTO_205 ?AUTO_209 ) ( AT ?AUTO_206 ?AUTO_205 ) ( VISIBLE ?AUTO_205 ?AUTO_209 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_206 ?AUTO_205 ?AUTO_209 )
      ( GET_ROCK_DATA ?AUTO_205 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_205 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_210 - WAYPOINT
    )
    :vars
    (
      ?AUTO_213 - LANDER
      ?AUTO_212 - WAYPOINT
      ?AUTO_214 - WAYPOINT
      ?AUTO_211 - ROVER
      ?AUTO_215 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_213 ?AUTO_212 ) ( VISIBLE ?AUTO_214 ?AUTO_212 ) ( AVAILABLE ?AUTO_211 ) ( CHANNEL_FREE ?AUTO_213 ) ( not ( = ?AUTO_210 ?AUTO_214 ) ) ( not ( = ?AUTO_210 ?AUTO_212 ) ) ( not ( = ?AUTO_214 ?AUTO_212 ) ) ( CAN_TRAVERSE ?AUTO_211 ?AUTO_210 ?AUTO_214 ) ( AT ?AUTO_211 ?AUTO_210 ) ( VISIBLE ?AUTO_210 ?AUTO_214 ) ( AT_ROCK_SAMPLE ?AUTO_210 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_211 ) ( STORE_OF ?AUTO_215 ?AUTO_211 ) ( EMPTY ?AUTO_215 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_211 ?AUTO_215 ?AUTO_210 )
      ( GET_ROCK_DATA ?AUTO_210 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_210 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_216 - WAYPOINT
    )
    :vars
    (
      ?AUTO_218 - LANDER
      ?AUTO_221 - WAYPOINT
      ?AUTO_217 - WAYPOINT
      ?AUTO_220 - ROVER
      ?AUTO_219 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_218 ?AUTO_221 ) ( VISIBLE ?AUTO_217 ?AUTO_221 ) ( AVAILABLE ?AUTO_220 ) ( CHANNEL_FREE ?AUTO_218 ) ( not ( = ?AUTO_216 ?AUTO_217 ) ) ( not ( = ?AUTO_216 ?AUTO_221 ) ) ( not ( = ?AUTO_217 ?AUTO_221 ) ) ( CAN_TRAVERSE ?AUTO_220 ?AUTO_216 ?AUTO_217 ) ( VISIBLE ?AUTO_216 ?AUTO_217 ) ( AT_ROCK_SAMPLE ?AUTO_216 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_220 ) ( STORE_OF ?AUTO_219 ?AUTO_220 ) ( EMPTY ?AUTO_219 ) ( CAN_TRAVERSE ?AUTO_220 ?AUTO_217 ?AUTO_216 ) ( AT ?AUTO_220 ?AUTO_217 ) ( VISIBLE ?AUTO_217 ?AUTO_216 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_220 ?AUTO_217 ?AUTO_216 )
      ( GET_ROCK_DATA ?AUTO_216 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_216 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_222 - WAYPOINT
    )
    :vars
    (
      ?AUTO_223 - LANDER
      ?AUTO_225 - WAYPOINT
      ?AUTO_226 - WAYPOINT
      ?AUTO_224 - ROVER
      ?AUTO_227 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_223 ?AUTO_225 ) ( VISIBLE ?AUTO_226 ?AUTO_225 ) ( AVAILABLE ?AUTO_224 ) ( CHANNEL_FREE ?AUTO_223 ) ( not ( = ?AUTO_222 ?AUTO_226 ) ) ( not ( = ?AUTO_222 ?AUTO_225 ) ) ( not ( = ?AUTO_226 ?AUTO_225 ) ) ( CAN_TRAVERSE ?AUTO_224 ?AUTO_222 ?AUTO_226 ) ( VISIBLE ?AUTO_222 ?AUTO_226 ) ( AT_ROCK_SAMPLE ?AUTO_222 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_224 ) ( STORE_OF ?AUTO_227 ?AUTO_224 ) ( CAN_TRAVERSE ?AUTO_224 ?AUTO_226 ?AUTO_222 ) ( AT ?AUTO_224 ?AUTO_226 ) ( VISIBLE ?AUTO_226 ?AUTO_222 ) ( FULL ?AUTO_227 ) )
    :subtasks
    ( ( !DROP ?AUTO_224 ?AUTO_227 )
      ( GET_ROCK_DATA ?AUTO_222 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_222 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_269 - WAYPOINT
    )
    :vars
    (
      ?AUTO_270 - ROVER
      ?AUTO_272 - LANDER
      ?AUTO_271 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_270 ?AUTO_269 ) ( AT_LANDER ?AUTO_272 ?AUTO_271 ) ( HAVE_ROCK_ANALYSIS ?AUTO_270 ?AUTO_269 ) ( VISIBLE ?AUTO_269 ?AUTO_271 ) ( AVAILABLE ?AUTO_270 ) ( CHANNEL_FREE ?AUTO_272 ) ( not ( = ?AUTO_269 ?AUTO_271 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_270 ?AUTO_272 ?AUTO_269 ?AUTO_269 ?AUTO_271 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_269 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_273 - WAYPOINT
    )
    :vars
    (
      ?AUTO_274 - ROVER
      ?AUTO_276 - LANDER
      ?AUTO_275 - WAYPOINT
      ?AUTO_277 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_274 ?AUTO_273 ) ( AT_LANDER ?AUTO_276 ?AUTO_275 ) ( VISIBLE ?AUTO_273 ?AUTO_275 ) ( AVAILABLE ?AUTO_274 ) ( CHANNEL_FREE ?AUTO_276 ) ( not ( = ?AUTO_273 ?AUTO_275 ) ) ( AT_ROCK_SAMPLE ?AUTO_273 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_274 ) ( STORE_OF ?AUTO_277 ?AUTO_274 ) ( EMPTY ?AUTO_277 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_274 ?AUTO_277 ?AUTO_273 )
      ( GET_ROCK_DATA ?AUTO_273 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_273 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_278 - WAYPOINT
    )
    :vars
    (
      ?AUTO_279 - ROVER
      ?AUTO_280 - LANDER
      ?AUTO_281 - WAYPOINT
      ?AUTO_282 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_279 ?AUTO_278 ) ( AT_LANDER ?AUTO_280 ?AUTO_281 ) ( VISIBLE ?AUTO_278 ?AUTO_281 ) ( AVAILABLE ?AUTO_279 ) ( CHANNEL_FREE ?AUTO_280 ) ( not ( = ?AUTO_278 ?AUTO_281 ) ) ( AT_ROCK_SAMPLE ?AUTO_278 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_279 ) ( STORE_OF ?AUTO_282 ?AUTO_279 ) ( FULL ?AUTO_282 ) )
    :subtasks
    ( ( !DROP ?AUTO_279 ?AUTO_282 )
      ( GET_ROCK_DATA ?AUTO_278 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_278 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_304 - WAYPOINT
    )
    :vars
    (
      ?AUTO_305 - ROVER
      ?AUTO_307 - WAYPOINT
      ?AUTO_306 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_305 ?AUTO_307 ) ( AT_LANDER ?AUTO_306 ?AUTO_304 ) ( HAVE_ROCK_ANALYSIS ?AUTO_305 ?AUTO_304 ) ( VISIBLE ?AUTO_307 ?AUTO_304 ) ( AVAILABLE ?AUTO_305 ) ( CHANNEL_FREE ?AUTO_306 ) ( not ( = ?AUTO_304 ?AUTO_307 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_305 ?AUTO_306 ?AUTO_304 ?AUTO_307 ?AUTO_304 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_304 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_308 - WAYPOINT
    )
    :vars
    (
      ?AUTO_310 - LANDER
      ?AUTO_309 - ROVER
      ?AUTO_311 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_310 ?AUTO_308 ) ( HAVE_ROCK_ANALYSIS ?AUTO_309 ?AUTO_308 ) ( VISIBLE ?AUTO_311 ?AUTO_308 ) ( AVAILABLE ?AUTO_309 ) ( CHANNEL_FREE ?AUTO_310 ) ( not ( = ?AUTO_308 ?AUTO_311 ) ) ( CAN_TRAVERSE ?AUTO_309 ?AUTO_308 ?AUTO_311 ) ( AT ?AUTO_309 ?AUTO_308 ) ( VISIBLE ?AUTO_308 ?AUTO_311 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_309 ?AUTO_308 ?AUTO_311 )
      ( GET_ROCK_DATA ?AUTO_308 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_308 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_312 - WAYPOINT
    )
    :vars
    (
      ?AUTO_315 - LANDER
      ?AUTO_313 - WAYPOINT
      ?AUTO_314 - ROVER
      ?AUTO_316 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_315 ?AUTO_312 ) ( VISIBLE ?AUTO_313 ?AUTO_312 ) ( AVAILABLE ?AUTO_314 ) ( CHANNEL_FREE ?AUTO_315 ) ( not ( = ?AUTO_312 ?AUTO_313 ) ) ( CAN_TRAVERSE ?AUTO_314 ?AUTO_312 ?AUTO_313 ) ( AT ?AUTO_314 ?AUTO_312 ) ( VISIBLE ?AUTO_312 ?AUTO_313 ) ( AT_ROCK_SAMPLE ?AUTO_312 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_314 ) ( STORE_OF ?AUTO_316 ?AUTO_314 ) ( EMPTY ?AUTO_316 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_314 ?AUTO_316 ?AUTO_312 )
      ( GET_ROCK_DATA ?AUTO_312 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_312 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_317 - WAYPOINT
    )
    :vars
    (
      ?AUTO_319 - LANDER
      ?AUTO_318 - WAYPOINT
      ?AUTO_320 - ROVER
      ?AUTO_321 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_319 ?AUTO_317 ) ( VISIBLE ?AUTO_318 ?AUTO_317 ) ( AVAILABLE ?AUTO_320 ) ( CHANNEL_FREE ?AUTO_319 ) ( not ( = ?AUTO_317 ?AUTO_318 ) ) ( CAN_TRAVERSE ?AUTO_320 ?AUTO_317 ?AUTO_318 ) ( VISIBLE ?AUTO_317 ?AUTO_318 ) ( AT_ROCK_SAMPLE ?AUTO_317 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_320 ) ( STORE_OF ?AUTO_321 ?AUTO_320 ) ( EMPTY ?AUTO_321 ) ( CAN_TRAVERSE ?AUTO_320 ?AUTO_318 ?AUTO_317 ) ( AT ?AUTO_320 ?AUTO_318 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_320 ?AUTO_318 ?AUTO_317 )
      ( GET_ROCK_DATA ?AUTO_317 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_317 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_322 - WAYPOINT
    )
    :vars
    (
      ?AUTO_324 - LANDER
      ?AUTO_323 - WAYPOINT
      ?AUTO_325 - ROVER
      ?AUTO_326 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_324 ?AUTO_322 ) ( VISIBLE ?AUTO_323 ?AUTO_322 ) ( AVAILABLE ?AUTO_325 ) ( CHANNEL_FREE ?AUTO_324 ) ( not ( = ?AUTO_322 ?AUTO_323 ) ) ( CAN_TRAVERSE ?AUTO_325 ?AUTO_322 ?AUTO_323 ) ( VISIBLE ?AUTO_322 ?AUTO_323 ) ( AT_ROCK_SAMPLE ?AUTO_322 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_325 ) ( STORE_OF ?AUTO_326 ?AUTO_325 ) ( CAN_TRAVERSE ?AUTO_325 ?AUTO_323 ?AUTO_322 ) ( AT ?AUTO_325 ?AUTO_323 ) ( FULL ?AUTO_326 ) )
    :subtasks
    ( ( !DROP ?AUTO_325 ?AUTO_326 )
      ( GET_ROCK_DATA ?AUTO_322 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_322 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_335 - OBJECTIVE
      ?AUTO_336 - MODE
    )
    :vars
    (
      ?AUTO_337 - ROVER
      ?AUTO_340 - WAYPOINT
      ?AUTO_339 - LANDER
      ?AUTO_338 - WAYPOINT
      ?AUTO_341 - CAMERA
    )
    :precondition
    ( and ( AT ?AUTO_337 ?AUTO_340 ) ( AT_LANDER ?AUTO_339 ?AUTO_338 ) ( VISIBLE ?AUTO_340 ?AUTO_338 ) ( AVAILABLE ?AUTO_337 ) ( CHANNEL_FREE ?AUTO_339 ) ( not ( = ?AUTO_340 ?AUTO_338 ) ) ( CALIBRATED ?AUTO_341 ?AUTO_337 ) ( ON_BOARD ?AUTO_341 ?AUTO_337 ) ( EQUIPPED_FOR_IMAGING ?AUTO_337 ) ( SUPPORTS ?AUTO_341 ?AUTO_336 ) ( VISIBLE_FROM ?AUTO_335 ?AUTO_340 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_337 ?AUTO_340 ?AUTO_335 ?AUTO_341 ?AUTO_336 )
      ( GET_IMAGE_DATA ?AUTO_335 ?AUTO_336 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_335 ?AUTO_336 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_342 - OBJECTIVE
      ?AUTO_343 - MODE
    )
    :vars
    (
      ?AUTO_347 - ROVER
      ?AUTO_346 - WAYPOINT
      ?AUTO_345 - LANDER
      ?AUTO_344 - WAYPOINT
      ?AUTO_348 - CAMERA
    )
    :precondition
    ( and ( AT ?AUTO_347 ?AUTO_346 ) ( AT_LANDER ?AUTO_345 ?AUTO_344 ) ( VISIBLE ?AUTO_346 ?AUTO_344 ) ( AVAILABLE ?AUTO_347 ) ( CHANNEL_FREE ?AUTO_345 ) ( not ( = ?AUTO_346 ?AUTO_344 ) ) ( ON_BOARD ?AUTO_348 ?AUTO_347 ) ( EQUIPPED_FOR_IMAGING ?AUTO_347 ) ( SUPPORTS ?AUTO_348 ?AUTO_343 ) ( VISIBLE_FROM ?AUTO_342 ?AUTO_346 ) ( CALIBRATION_TARGET ?AUTO_348 ?AUTO_342 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_347 ?AUTO_348 ?AUTO_342 ?AUTO_346 )
      ( GET_IMAGE_DATA ?AUTO_342 ?AUTO_343 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_342 ?AUTO_343 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_349 - OBJECTIVE
      ?AUTO_350 - MODE
    )
    :vars
    (
      ?AUTO_354 - LANDER
      ?AUTO_352 - WAYPOINT
      ?AUTO_353 - WAYPOINT
      ?AUTO_355 - ROVER
      ?AUTO_351 - CAMERA
      ?AUTO_356 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_354 ?AUTO_352 ) ( VISIBLE ?AUTO_353 ?AUTO_352 ) ( AVAILABLE ?AUTO_355 ) ( CHANNEL_FREE ?AUTO_354 ) ( not ( = ?AUTO_353 ?AUTO_352 ) ) ( ON_BOARD ?AUTO_351 ?AUTO_355 ) ( EQUIPPED_FOR_IMAGING ?AUTO_355 ) ( SUPPORTS ?AUTO_351 ?AUTO_350 ) ( VISIBLE_FROM ?AUTO_349 ?AUTO_353 ) ( CALIBRATION_TARGET ?AUTO_351 ?AUTO_349 ) ( CAN_TRAVERSE ?AUTO_355 ?AUTO_356 ?AUTO_353 ) ( AT ?AUTO_355 ?AUTO_356 ) ( VISIBLE ?AUTO_356 ?AUTO_353 ) ( not ( = ?AUTO_352 ?AUTO_356 ) ) ( not ( = ?AUTO_353 ?AUTO_356 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_355 ?AUTO_356 ?AUTO_353 )
      ( GET_IMAGE_DATA ?AUTO_349 ?AUTO_350 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_349 ?AUTO_350 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_357 - OBJECTIVE
      ?AUTO_358 - MODE
    )
    :vars
    (
      ?AUTO_361 - LANDER
      ?AUTO_362 - WAYPOINT
      ?AUTO_360 - WAYPOINT
      ?AUTO_363 - ROVER
      ?AUTO_359 - CAMERA
      ?AUTO_364 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_361 ?AUTO_362 ) ( VISIBLE ?AUTO_360 ?AUTO_362 ) ( AVAILABLE ?AUTO_363 ) ( CHANNEL_FREE ?AUTO_361 ) ( not ( = ?AUTO_360 ?AUTO_362 ) ) ( ON_BOARD ?AUTO_359 ?AUTO_363 ) ( EQUIPPED_FOR_IMAGING ?AUTO_363 ) ( SUPPORTS ?AUTO_359 ?AUTO_358 ) ( VISIBLE_FROM ?AUTO_357 ?AUTO_360 ) ( CALIBRATION_TARGET ?AUTO_359 ?AUTO_357 ) ( CAN_TRAVERSE ?AUTO_363 ?AUTO_364 ?AUTO_360 ) ( VISIBLE ?AUTO_364 ?AUTO_360 ) ( not ( = ?AUTO_362 ?AUTO_364 ) ) ( not ( = ?AUTO_360 ?AUTO_364 ) ) ( CAN_TRAVERSE ?AUTO_363 ?AUTO_362 ?AUTO_364 ) ( AT ?AUTO_363 ?AUTO_362 ) ( VISIBLE ?AUTO_362 ?AUTO_364 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_363 ?AUTO_362 ?AUTO_364 )
      ( GET_IMAGE_DATA ?AUTO_357 ?AUTO_358 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_357 ?AUTO_358 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_384 - WAYPOINT
    )
    :vars
    (
      ?AUTO_387 - LANDER
      ?AUTO_385 - WAYPOINT
      ?AUTO_386 - ROVER
      ?AUTO_388 - STORE
      ?AUTO_389 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_387 ?AUTO_385 ) ( VISIBLE ?AUTO_384 ?AUTO_385 ) ( AVAILABLE ?AUTO_386 ) ( CHANNEL_FREE ?AUTO_387 ) ( not ( = ?AUTO_384 ?AUTO_385 ) ) ( AT_SOIL_SAMPLE ?AUTO_384 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_386 ) ( STORE_OF ?AUTO_388 ?AUTO_386 ) ( EMPTY ?AUTO_388 ) ( CAN_TRAVERSE ?AUTO_386 ?AUTO_389 ?AUTO_384 ) ( VISIBLE ?AUTO_389 ?AUTO_384 ) ( not ( = ?AUTO_384 ?AUTO_389 ) ) ( not ( = ?AUTO_385 ?AUTO_389 ) ) ( CAN_TRAVERSE ?AUTO_386 ?AUTO_385 ?AUTO_389 ) ( AT ?AUTO_386 ?AUTO_385 ) ( VISIBLE ?AUTO_385 ?AUTO_389 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_386 ?AUTO_385 ?AUTO_389 )
      ( GET_SOIL_DATA ?AUTO_384 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_384 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_417 - WAYPOINT
    )
    :vars
    (
      ?AUTO_419 - LANDER
      ?AUTO_420 - WAYPOINT
      ?AUTO_418 - ROVER
      ?AUTO_421 - STORE
      ?AUTO_422 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_419 ?AUTO_420 ) ( VISIBLE ?AUTO_417 ?AUTO_420 ) ( AVAILABLE ?AUTO_418 ) ( CHANNEL_FREE ?AUTO_419 ) ( not ( = ?AUTO_417 ?AUTO_420 ) ) ( AT_ROCK_SAMPLE ?AUTO_417 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_418 ) ( STORE_OF ?AUTO_421 ?AUTO_418 ) ( EMPTY ?AUTO_421 ) ( CAN_TRAVERSE ?AUTO_418 ?AUTO_422 ?AUTO_417 ) ( AT ?AUTO_418 ?AUTO_422 ) ( VISIBLE ?AUTO_422 ?AUTO_417 ) ( not ( = ?AUTO_417 ?AUTO_422 ) ) ( not ( = ?AUTO_420 ?AUTO_422 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_418 ?AUTO_422 ?AUTO_417 )
      ( GET_ROCK_DATA ?AUTO_417 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_417 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_423 - WAYPOINT
    )
    :vars
    (
      ?AUTO_425 - LANDER
      ?AUTO_428 - WAYPOINT
      ?AUTO_424 - ROVER
      ?AUTO_427 - STORE
      ?AUTO_426 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_425 ?AUTO_428 ) ( VISIBLE ?AUTO_423 ?AUTO_428 ) ( AVAILABLE ?AUTO_424 ) ( CHANNEL_FREE ?AUTO_425 ) ( not ( = ?AUTO_423 ?AUTO_428 ) ) ( AT_ROCK_SAMPLE ?AUTO_423 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_424 ) ( STORE_OF ?AUTO_427 ?AUTO_424 ) ( CAN_TRAVERSE ?AUTO_424 ?AUTO_426 ?AUTO_423 ) ( AT ?AUTO_424 ?AUTO_426 ) ( VISIBLE ?AUTO_426 ?AUTO_423 ) ( not ( = ?AUTO_423 ?AUTO_426 ) ) ( not ( = ?AUTO_428 ?AUTO_426 ) ) ( FULL ?AUTO_427 ) )
    :subtasks
    ( ( !DROP ?AUTO_424 ?AUTO_427 )
      ( GET_ROCK_DATA ?AUTO_423 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_423 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_429 - WAYPOINT
    )
    :vars
    (
      ?AUTO_430 - LANDER
      ?AUTO_433 - WAYPOINT
      ?AUTO_431 - ROVER
      ?AUTO_432 - STORE
      ?AUTO_434 - WAYPOINT
      ?AUTO_435 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_430 ?AUTO_433 ) ( VISIBLE ?AUTO_429 ?AUTO_433 ) ( AVAILABLE ?AUTO_431 ) ( CHANNEL_FREE ?AUTO_430 ) ( not ( = ?AUTO_429 ?AUTO_433 ) ) ( AT_ROCK_SAMPLE ?AUTO_429 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_431 ) ( STORE_OF ?AUTO_432 ?AUTO_431 ) ( CAN_TRAVERSE ?AUTO_431 ?AUTO_434 ?AUTO_429 ) ( VISIBLE ?AUTO_434 ?AUTO_429 ) ( not ( = ?AUTO_429 ?AUTO_434 ) ) ( not ( = ?AUTO_433 ?AUTO_434 ) ) ( FULL ?AUTO_432 ) ( CAN_TRAVERSE ?AUTO_431 ?AUTO_435 ?AUTO_434 ) ( AT ?AUTO_431 ?AUTO_435 ) ( VISIBLE ?AUTO_435 ?AUTO_434 ) ( not ( = ?AUTO_429 ?AUTO_435 ) ) ( not ( = ?AUTO_433 ?AUTO_435 ) ) ( not ( = ?AUTO_434 ?AUTO_435 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_431 ?AUTO_435 ?AUTO_434 )
      ( GET_ROCK_DATA ?AUTO_429 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_429 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_437 - WAYPOINT
    )
    :vars
    (
      ?AUTO_443 - LANDER
      ?AUTO_440 - WAYPOINT
      ?AUTO_438 - ROVER
      ?AUTO_441 - STORE
      ?AUTO_442 - WAYPOINT
      ?AUTO_439 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_443 ?AUTO_440 ) ( VISIBLE ?AUTO_437 ?AUTO_440 ) ( AVAILABLE ?AUTO_438 ) ( CHANNEL_FREE ?AUTO_443 ) ( not ( = ?AUTO_437 ?AUTO_440 ) ) ( AT_ROCK_SAMPLE ?AUTO_437 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_438 ) ( STORE_OF ?AUTO_441 ?AUTO_438 ) ( CAN_TRAVERSE ?AUTO_438 ?AUTO_442 ?AUTO_437 ) ( VISIBLE ?AUTO_442 ?AUTO_437 ) ( not ( = ?AUTO_437 ?AUTO_442 ) ) ( not ( = ?AUTO_440 ?AUTO_442 ) ) ( CAN_TRAVERSE ?AUTO_438 ?AUTO_439 ?AUTO_442 ) ( AT ?AUTO_438 ?AUTO_439 ) ( VISIBLE ?AUTO_439 ?AUTO_442 ) ( not ( = ?AUTO_437 ?AUTO_439 ) ) ( not ( = ?AUTO_440 ?AUTO_439 ) ) ( not ( = ?AUTO_442 ?AUTO_439 ) ) ( AT_ROCK_SAMPLE ?AUTO_439 ) ( EMPTY ?AUTO_441 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_438 ?AUTO_441 ?AUTO_439 )
      ( GET_ROCK_DATA ?AUTO_437 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_437 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_461 - WAYPOINT
    )
    :vars
    (
      ?AUTO_463 - LANDER
      ?AUTO_464 - WAYPOINT
      ?AUTO_462 - ROVER
      ?AUTO_465 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_463 ?AUTO_464 ) ( VISIBLE ?AUTO_461 ?AUTO_464 ) ( AVAILABLE ?AUTO_462 ) ( CHANNEL_FREE ?AUTO_463 ) ( not ( = ?AUTO_461 ?AUTO_464 ) ) ( AT_ROCK_SAMPLE ?AUTO_461 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_462 ) ( STORE_OF ?AUTO_465 ?AUTO_462 ) ( EMPTY ?AUTO_465 ) ( CAN_TRAVERSE ?AUTO_462 ?AUTO_464 ?AUTO_461 ) ( AT ?AUTO_462 ?AUTO_464 ) ( VISIBLE ?AUTO_464 ?AUTO_461 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_462 ?AUTO_464 ?AUTO_461 )
      ( GET_ROCK_DATA ?AUTO_461 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_461 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_466 - WAYPOINT
    )
    :vars
    (
      ?AUTO_468 - LANDER
      ?AUTO_470 - WAYPOINT
      ?AUTO_467 - ROVER
      ?AUTO_469 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_468 ?AUTO_470 ) ( VISIBLE ?AUTO_466 ?AUTO_470 ) ( AVAILABLE ?AUTO_467 ) ( CHANNEL_FREE ?AUTO_468 ) ( not ( = ?AUTO_466 ?AUTO_470 ) ) ( AT_ROCK_SAMPLE ?AUTO_466 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_467 ) ( STORE_OF ?AUTO_469 ?AUTO_467 ) ( CAN_TRAVERSE ?AUTO_467 ?AUTO_470 ?AUTO_466 ) ( AT ?AUTO_467 ?AUTO_470 ) ( VISIBLE ?AUTO_470 ?AUTO_466 ) ( FULL ?AUTO_469 ) )
    :subtasks
    ( ( !DROP ?AUTO_467 ?AUTO_469 )
      ( GET_ROCK_DATA ?AUTO_466 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_466 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_471 - WAYPOINT
    )
    :vars
    (
      ?AUTO_474 - LANDER
      ?AUTO_475 - WAYPOINT
      ?AUTO_472 - ROVER
      ?AUTO_473 - STORE
      ?AUTO_476 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_474 ?AUTO_475 ) ( VISIBLE ?AUTO_471 ?AUTO_475 ) ( AVAILABLE ?AUTO_472 ) ( CHANNEL_FREE ?AUTO_474 ) ( not ( = ?AUTO_471 ?AUTO_475 ) ) ( AT_ROCK_SAMPLE ?AUTO_471 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_472 ) ( STORE_OF ?AUTO_473 ?AUTO_472 ) ( CAN_TRAVERSE ?AUTO_472 ?AUTO_475 ?AUTO_471 ) ( VISIBLE ?AUTO_475 ?AUTO_471 ) ( FULL ?AUTO_473 ) ( CAN_TRAVERSE ?AUTO_472 ?AUTO_476 ?AUTO_475 ) ( AT ?AUTO_472 ?AUTO_476 ) ( VISIBLE ?AUTO_476 ?AUTO_475 ) ( not ( = ?AUTO_471 ?AUTO_476 ) ) ( not ( = ?AUTO_475 ?AUTO_476 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_472 ?AUTO_476 ?AUTO_475 )
      ( GET_ROCK_DATA ?AUTO_471 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_471 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_478 - WAYPOINT
    )
    :vars
    (
      ?AUTO_479 - LANDER
      ?AUTO_481 - WAYPOINT
      ?AUTO_483 - ROVER
      ?AUTO_482 - STORE
      ?AUTO_480 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_479 ?AUTO_481 ) ( VISIBLE ?AUTO_478 ?AUTO_481 ) ( AVAILABLE ?AUTO_483 ) ( CHANNEL_FREE ?AUTO_479 ) ( not ( = ?AUTO_478 ?AUTO_481 ) ) ( AT_ROCK_SAMPLE ?AUTO_478 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_483 ) ( STORE_OF ?AUTO_482 ?AUTO_483 ) ( CAN_TRAVERSE ?AUTO_483 ?AUTO_481 ?AUTO_478 ) ( VISIBLE ?AUTO_481 ?AUTO_478 ) ( CAN_TRAVERSE ?AUTO_483 ?AUTO_480 ?AUTO_481 ) ( AT ?AUTO_483 ?AUTO_480 ) ( VISIBLE ?AUTO_480 ?AUTO_481 ) ( not ( = ?AUTO_478 ?AUTO_480 ) ) ( not ( = ?AUTO_481 ?AUTO_480 ) ) ( AT_ROCK_SAMPLE ?AUTO_480 ) ( EMPTY ?AUTO_482 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_483 ?AUTO_482 ?AUTO_480 )
      ( GET_ROCK_DATA ?AUTO_478 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_478 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_506 - OBJECTIVE
      ?AUTO_507 - MODE
    )
    :vars
    (
      ?AUTO_509 - LANDER
      ?AUTO_511 - WAYPOINT
      ?AUTO_510 - WAYPOINT
      ?AUTO_508 - ROVER
      ?AUTO_512 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_509 ?AUTO_511 ) ( VISIBLE ?AUTO_510 ?AUTO_511 ) ( AVAILABLE ?AUTO_508 ) ( CHANNEL_FREE ?AUTO_509 ) ( not ( = ?AUTO_510 ?AUTO_511 ) ) ( ON_BOARD ?AUTO_512 ?AUTO_508 ) ( EQUIPPED_FOR_IMAGING ?AUTO_508 ) ( SUPPORTS ?AUTO_512 ?AUTO_507 ) ( VISIBLE_FROM ?AUTO_506 ?AUTO_510 ) ( CALIBRATION_TARGET ?AUTO_512 ?AUTO_506 ) ( CAN_TRAVERSE ?AUTO_508 ?AUTO_511 ?AUTO_510 ) ( AT ?AUTO_508 ?AUTO_511 ) ( VISIBLE ?AUTO_511 ?AUTO_510 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_508 ?AUTO_511 ?AUTO_510 )
      ( GET_IMAGE_DATA ?AUTO_506 ?AUTO_507 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_506 ?AUTO_507 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_573 - OBJECTIVE
      ?AUTO_574 - MODE
    )
    :vars
    (
      ?AUTO_576 - LANDER
      ?AUTO_575 - WAYPOINT
      ?AUTO_577 - WAYPOINT
      ?AUTO_578 - ROVER
      ?AUTO_579 - CAMERA
      ?AUTO_580 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_576 ?AUTO_575 ) ( VISIBLE ?AUTO_577 ?AUTO_575 ) ( AVAILABLE ?AUTO_578 ) ( CHANNEL_FREE ?AUTO_576 ) ( not ( = ?AUTO_577 ?AUTO_575 ) ) ( CALIBRATED ?AUTO_579 ?AUTO_578 ) ( ON_BOARD ?AUTO_579 ?AUTO_578 ) ( EQUIPPED_FOR_IMAGING ?AUTO_578 ) ( SUPPORTS ?AUTO_579 ?AUTO_574 ) ( VISIBLE_FROM ?AUTO_573 ?AUTO_577 ) ( CAN_TRAVERSE ?AUTO_578 ?AUTO_580 ?AUTO_577 ) ( AT ?AUTO_578 ?AUTO_580 ) ( VISIBLE ?AUTO_580 ?AUTO_577 ) ( not ( = ?AUTO_575 ?AUTO_580 ) ) ( not ( = ?AUTO_577 ?AUTO_580 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_578 ?AUTO_580 ?AUTO_577 )
      ( GET_IMAGE_DATA ?AUTO_573 ?AUTO_574 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_573 ?AUTO_574 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_581 - OBJECTIVE
      ?AUTO_582 - MODE
    )
    :vars
    (
      ?AUTO_585 - LANDER
      ?AUTO_583 - WAYPOINT
      ?AUTO_586 - WAYPOINT
      ?AUTO_588 - ROVER
      ?AUTO_587 - CAMERA
      ?AUTO_584 - WAYPOINT
      ?AUTO_589 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_585 ?AUTO_583 ) ( VISIBLE ?AUTO_586 ?AUTO_583 ) ( AVAILABLE ?AUTO_588 ) ( CHANNEL_FREE ?AUTO_585 ) ( not ( = ?AUTO_586 ?AUTO_583 ) ) ( ON_BOARD ?AUTO_587 ?AUTO_588 ) ( EQUIPPED_FOR_IMAGING ?AUTO_588 ) ( SUPPORTS ?AUTO_587 ?AUTO_582 ) ( VISIBLE_FROM ?AUTO_581 ?AUTO_586 ) ( CAN_TRAVERSE ?AUTO_588 ?AUTO_584 ?AUTO_586 ) ( AT ?AUTO_588 ?AUTO_584 ) ( VISIBLE ?AUTO_584 ?AUTO_586 ) ( not ( = ?AUTO_583 ?AUTO_584 ) ) ( not ( = ?AUTO_586 ?AUTO_584 ) ) ( CALIBRATION_TARGET ?AUTO_587 ?AUTO_589 ) ( VISIBLE_FROM ?AUTO_589 ?AUTO_584 ) ( not ( = ?AUTO_581 ?AUTO_589 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_588 ?AUTO_587 ?AUTO_589 ?AUTO_584 )
      ( GET_IMAGE_DATA ?AUTO_581 ?AUTO_582 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_581 ?AUTO_582 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_590 - OBJECTIVE
      ?AUTO_591 - MODE
    )
    :vars
    (
      ?AUTO_598 - LANDER
      ?AUTO_596 - WAYPOINT
      ?AUTO_593 - WAYPOINT
      ?AUTO_592 - ROVER
      ?AUTO_594 - CAMERA
      ?AUTO_595 - WAYPOINT
      ?AUTO_597 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_598 ?AUTO_596 ) ( VISIBLE ?AUTO_593 ?AUTO_596 ) ( AVAILABLE ?AUTO_592 ) ( CHANNEL_FREE ?AUTO_598 ) ( not ( = ?AUTO_593 ?AUTO_596 ) ) ( ON_BOARD ?AUTO_594 ?AUTO_592 ) ( EQUIPPED_FOR_IMAGING ?AUTO_592 ) ( SUPPORTS ?AUTO_594 ?AUTO_591 ) ( VISIBLE_FROM ?AUTO_590 ?AUTO_593 ) ( CAN_TRAVERSE ?AUTO_592 ?AUTO_595 ?AUTO_593 ) ( VISIBLE ?AUTO_595 ?AUTO_593 ) ( not ( = ?AUTO_596 ?AUTO_595 ) ) ( not ( = ?AUTO_593 ?AUTO_595 ) ) ( CALIBRATION_TARGET ?AUTO_594 ?AUTO_597 ) ( VISIBLE_FROM ?AUTO_597 ?AUTO_595 ) ( not ( = ?AUTO_590 ?AUTO_597 ) ) ( CAN_TRAVERSE ?AUTO_592 ?AUTO_593 ?AUTO_595 ) ( AT ?AUTO_592 ?AUTO_593 ) ( VISIBLE ?AUTO_593 ?AUTO_595 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_592 ?AUTO_593 ?AUTO_595 )
      ( GET_IMAGE_DATA ?AUTO_590 ?AUTO_591 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_590 ?AUTO_591 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_605 - OBJECTIVE
      ?AUTO_606 - MODE
    )
    :vars
    (
      ?AUTO_611 - LANDER
      ?AUTO_613 - WAYPOINT
      ?AUTO_607 - WAYPOINT
      ?AUTO_612 - ROVER
      ?AUTO_608 - CAMERA
      ?AUTO_610 - WAYPOINT
      ?AUTO_609 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_611 ?AUTO_613 ) ( VISIBLE ?AUTO_607 ?AUTO_613 ) ( AVAILABLE ?AUTO_612 ) ( CHANNEL_FREE ?AUTO_611 ) ( not ( = ?AUTO_607 ?AUTO_613 ) ) ( ON_BOARD ?AUTO_608 ?AUTO_612 ) ( EQUIPPED_FOR_IMAGING ?AUTO_612 ) ( SUPPORTS ?AUTO_608 ?AUTO_606 ) ( VISIBLE_FROM ?AUTO_605 ?AUTO_607 ) ( CAN_TRAVERSE ?AUTO_612 ?AUTO_610 ?AUTO_607 ) ( VISIBLE ?AUTO_610 ?AUTO_607 ) ( not ( = ?AUTO_613 ?AUTO_610 ) ) ( not ( = ?AUTO_607 ?AUTO_610 ) ) ( CALIBRATION_TARGET ?AUTO_608 ?AUTO_609 ) ( VISIBLE_FROM ?AUTO_609 ?AUTO_610 ) ( not ( = ?AUTO_605 ?AUTO_609 ) ) ( CAN_TRAVERSE ?AUTO_612 ?AUTO_607 ?AUTO_610 ) ( VISIBLE ?AUTO_607 ?AUTO_610 ) ( CAN_TRAVERSE ?AUTO_612 ?AUTO_613 ?AUTO_607 ) ( AT ?AUTO_612 ?AUTO_613 ) ( VISIBLE ?AUTO_613 ?AUTO_607 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_612 ?AUTO_613 ?AUTO_607 )
      ( GET_IMAGE_DATA ?AUTO_605 ?AUTO_606 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_605 ?AUTO_606 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_620 - WAYPOINT
    )
    :vars
    (
      ?AUTO_623 - LANDER
      ?AUTO_622 - WAYPOINT
      ?AUTO_621 - ROVER
      ?AUTO_624 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_623 ?AUTO_622 ) ( HAVE_SOIL_ANALYSIS ?AUTO_621 ?AUTO_620 ) ( VISIBLE ?AUTO_624 ?AUTO_622 ) ( AVAILABLE ?AUTO_621 ) ( CHANNEL_FREE ?AUTO_623 ) ( not ( = ?AUTO_620 ?AUTO_624 ) ) ( not ( = ?AUTO_620 ?AUTO_622 ) ) ( not ( = ?AUTO_624 ?AUTO_622 ) ) ( CAN_TRAVERSE ?AUTO_621 ?AUTO_620 ?AUTO_624 ) ( AT ?AUTO_621 ?AUTO_620 ) ( VISIBLE ?AUTO_620 ?AUTO_624 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_621 ?AUTO_620 ?AUTO_624 )
      ( GET_SOIL_DATA ?AUTO_620 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_620 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_625 - WAYPOINT
    )
    :vars
    (
      ?AUTO_629 - LANDER
      ?AUTO_627 - WAYPOINT
      ?AUTO_628 - WAYPOINT
      ?AUTO_626 - ROVER
      ?AUTO_630 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_629 ?AUTO_627 ) ( VISIBLE ?AUTO_628 ?AUTO_627 ) ( AVAILABLE ?AUTO_626 ) ( CHANNEL_FREE ?AUTO_629 ) ( not ( = ?AUTO_625 ?AUTO_628 ) ) ( not ( = ?AUTO_625 ?AUTO_627 ) ) ( not ( = ?AUTO_628 ?AUTO_627 ) ) ( CAN_TRAVERSE ?AUTO_626 ?AUTO_625 ?AUTO_628 ) ( AT ?AUTO_626 ?AUTO_625 ) ( VISIBLE ?AUTO_625 ?AUTO_628 ) ( AT_SOIL_SAMPLE ?AUTO_625 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_626 ) ( STORE_OF ?AUTO_630 ?AUTO_626 ) ( EMPTY ?AUTO_630 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_626 ?AUTO_630 ?AUTO_625 )
      ( GET_SOIL_DATA ?AUTO_625 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_625 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_671 - OBJECTIVE
      ?AUTO_672 - MODE
    )
    :vars
    (
      ?AUTO_677 - LANDER
      ?AUTO_678 - WAYPOINT
      ?AUTO_675 - WAYPOINT
      ?AUTO_676 - ROVER
      ?AUTO_673 - WAYPOINT
      ?AUTO_674 - CAMERA
      ?AUTO_679 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_677 ?AUTO_678 ) ( VISIBLE ?AUTO_675 ?AUTO_678 ) ( AVAILABLE ?AUTO_676 ) ( CHANNEL_FREE ?AUTO_677 ) ( not ( = ?AUTO_675 ?AUTO_678 ) ) ( CAN_TRAVERSE ?AUTO_676 ?AUTO_673 ?AUTO_675 ) ( VISIBLE ?AUTO_673 ?AUTO_675 ) ( not ( = ?AUTO_678 ?AUTO_673 ) ) ( not ( = ?AUTO_675 ?AUTO_673 ) ) ( ON_BOARD ?AUTO_674 ?AUTO_676 ) ( EQUIPPED_FOR_IMAGING ?AUTO_676 ) ( SUPPORTS ?AUTO_674 ?AUTO_672 ) ( VISIBLE_FROM ?AUTO_671 ?AUTO_673 ) ( CALIBRATION_TARGET ?AUTO_674 ?AUTO_671 ) ( CAN_TRAVERSE ?AUTO_676 ?AUTO_679 ?AUTO_673 ) ( VISIBLE ?AUTO_679 ?AUTO_673 ) ( not ( = ?AUTO_678 ?AUTO_679 ) ) ( not ( = ?AUTO_675 ?AUTO_679 ) ) ( not ( = ?AUTO_673 ?AUTO_679 ) ) ( CAN_TRAVERSE ?AUTO_676 ?AUTO_678 ?AUTO_679 ) ( AT ?AUTO_676 ?AUTO_678 ) ( VISIBLE ?AUTO_678 ?AUTO_679 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_676 ?AUTO_678 ?AUTO_679 )
      ( GET_IMAGE_DATA ?AUTO_671 ?AUTO_672 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_671 ?AUTO_672 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_680 - OBJECTIVE
      ?AUTO_681 - MODE
    )
    :vars
    (
      ?AUTO_682 - LANDER
      ?AUTO_683 - WAYPOINT
      ?AUTO_685 - WAYPOINT
      ?AUTO_688 - ROVER
      ?AUTO_684 - WAYPOINT
      ?AUTO_686 - CAMERA
      ?AUTO_687 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_682 ?AUTO_683 ) ( VISIBLE ?AUTO_685 ?AUTO_683 ) ( AVAILABLE ?AUTO_688 ) ( CHANNEL_FREE ?AUTO_682 ) ( not ( = ?AUTO_685 ?AUTO_683 ) ) ( CAN_TRAVERSE ?AUTO_688 ?AUTO_684 ?AUTO_685 ) ( VISIBLE ?AUTO_684 ?AUTO_685 ) ( not ( = ?AUTO_683 ?AUTO_684 ) ) ( not ( = ?AUTO_685 ?AUTO_684 ) ) ( ON_BOARD ?AUTO_686 ?AUTO_688 ) ( EQUIPPED_FOR_IMAGING ?AUTO_688 ) ( SUPPORTS ?AUTO_686 ?AUTO_681 ) ( VISIBLE_FROM ?AUTO_680 ?AUTO_684 ) ( CALIBRATION_TARGET ?AUTO_686 ?AUTO_680 ) ( CAN_TRAVERSE ?AUTO_688 ?AUTO_687 ?AUTO_684 ) ( VISIBLE ?AUTO_687 ?AUTO_684 ) ( not ( = ?AUTO_683 ?AUTO_687 ) ) ( not ( = ?AUTO_685 ?AUTO_687 ) ) ( not ( = ?AUTO_684 ?AUTO_687 ) ) ( CAN_TRAVERSE ?AUTO_688 ?AUTO_683 ?AUTO_687 ) ( VISIBLE ?AUTO_683 ?AUTO_687 ) ( CAN_TRAVERSE ?AUTO_688 ?AUTO_685 ?AUTO_683 ) ( AT ?AUTO_688 ?AUTO_685 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_688 ?AUTO_685 ?AUTO_683 )
      ( GET_IMAGE_DATA ?AUTO_680 ?AUTO_681 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_680 ?AUTO_681 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_753 - WAYPOINT
    )
    :vars
    (
      ?AUTO_758 - LANDER
      ?AUTO_757 - WAYPOINT
      ?AUTO_755 - ROVER
      ?AUTO_754 - STORE
      ?AUTO_756 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_758 ?AUTO_757 ) ( VISIBLE ?AUTO_753 ?AUTO_757 ) ( AVAILABLE ?AUTO_755 ) ( CHANNEL_FREE ?AUTO_758 ) ( not ( = ?AUTO_753 ?AUTO_757 ) ) ( AT_SOIL_SAMPLE ?AUTO_753 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_755 ) ( STORE_OF ?AUTO_754 ?AUTO_755 ) ( CAN_TRAVERSE ?AUTO_755 ?AUTO_756 ?AUTO_753 ) ( AT ?AUTO_755 ?AUTO_756 ) ( VISIBLE ?AUTO_756 ?AUTO_753 ) ( not ( = ?AUTO_753 ?AUTO_756 ) ) ( not ( = ?AUTO_757 ?AUTO_756 ) ) ( FULL ?AUTO_754 ) )
    :subtasks
    ( ( !DROP ?AUTO_755 ?AUTO_754 )
      ( GET_SOIL_DATA ?AUTO_753 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_753 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_768 - WAYPOINT
    )
    :vars
    (
      ?AUTO_773 - LANDER
      ?AUTO_769 - WAYPOINT
      ?AUTO_772 - ROVER
      ?AUTO_771 - STORE
      ?AUTO_770 - WAYPOINT
      ?AUTO_774 - WAYPOINT
      ?AUTO_775 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_773 ?AUTO_769 ) ( VISIBLE ?AUTO_768 ?AUTO_769 ) ( AVAILABLE ?AUTO_772 ) ( CHANNEL_FREE ?AUTO_773 ) ( not ( = ?AUTO_768 ?AUTO_769 ) ) ( AT_SOIL_SAMPLE ?AUTO_768 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_772 ) ( STORE_OF ?AUTO_771 ?AUTO_772 ) ( EMPTY ?AUTO_771 ) ( CAN_TRAVERSE ?AUTO_772 ?AUTO_770 ?AUTO_768 ) ( VISIBLE ?AUTO_770 ?AUTO_768 ) ( not ( = ?AUTO_768 ?AUTO_770 ) ) ( not ( = ?AUTO_769 ?AUTO_770 ) ) ( CAN_TRAVERSE ?AUTO_772 ?AUTO_774 ?AUTO_770 ) ( VISIBLE ?AUTO_774 ?AUTO_770 ) ( not ( = ?AUTO_768 ?AUTO_774 ) ) ( not ( = ?AUTO_769 ?AUTO_774 ) ) ( not ( = ?AUTO_770 ?AUTO_774 ) ) ( CAN_TRAVERSE ?AUTO_772 ?AUTO_775 ?AUTO_774 ) ( AT ?AUTO_772 ?AUTO_775 ) ( VISIBLE ?AUTO_775 ?AUTO_774 ) ( not ( = ?AUTO_768 ?AUTO_775 ) ) ( not ( = ?AUTO_769 ?AUTO_775 ) ) ( not ( = ?AUTO_770 ?AUTO_775 ) ) ( not ( = ?AUTO_774 ?AUTO_775 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_772 ?AUTO_775 ?AUTO_774 )
      ( GET_SOIL_DATA ?AUTO_768 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_768 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_789 - WAYPOINT
    )
    :vars
    (
      ?AUTO_793 - ROVER
      ?AUTO_791 - LANDER
      ?AUTO_792 - WAYPOINT
      ?AUTO_790 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_793 ?AUTO_789 ) ( AT_LANDER ?AUTO_791 ?AUTO_792 ) ( VISIBLE ?AUTO_789 ?AUTO_792 ) ( AVAILABLE ?AUTO_793 ) ( CHANNEL_FREE ?AUTO_791 ) ( not ( = ?AUTO_789 ?AUTO_792 ) ) ( AT_SOIL_SAMPLE ?AUTO_789 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_793 ) ( STORE_OF ?AUTO_790 ?AUTO_793 ) ( FULL ?AUTO_790 ) )
    :subtasks
    ( ( !DROP ?AUTO_793 ?AUTO_790 )
      ( GET_SOIL_DATA ?AUTO_789 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_789 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_794 - WAYPOINT
    )
    :vars
    (
      ?AUTO_795 - LANDER
      ?AUTO_798 - WAYPOINT
      ?AUTO_797 - ROVER
      ?AUTO_796 - STORE
      ?AUTO_799 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_795 ?AUTO_798 ) ( VISIBLE ?AUTO_794 ?AUTO_798 ) ( AVAILABLE ?AUTO_797 ) ( CHANNEL_FREE ?AUTO_795 ) ( not ( = ?AUTO_794 ?AUTO_798 ) ) ( AT_SOIL_SAMPLE ?AUTO_794 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_797 ) ( STORE_OF ?AUTO_796 ?AUTO_797 ) ( FULL ?AUTO_796 ) ( CAN_TRAVERSE ?AUTO_797 ?AUTO_799 ?AUTO_794 ) ( AT ?AUTO_797 ?AUTO_799 ) ( VISIBLE ?AUTO_799 ?AUTO_794 ) ( not ( = ?AUTO_794 ?AUTO_799 ) ) ( not ( = ?AUTO_798 ?AUTO_799 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_797 ?AUTO_799 ?AUTO_794 )
      ( GET_SOIL_DATA ?AUTO_794 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_794 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_800 - WAYPOINT
    )
    :vars
    (
      ?AUTO_803 - LANDER
      ?AUTO_801 - WAYPOINT
      ?AUTO_804 - ROVER
      ?AUTO_802 - STORE
      ?AUTO_805 - WAYPOINT
      ?AUTO_806 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_803 ?AUTO_801 ) ( VISIBLE ?AUTO_800 ?AUTO_801 ) ( AVAILABLE ?AUTO_804 ) ( CHANNEL_FREE ?AUTO_803 ) ( not ( = ?AUTO_800 ?AUTO_801 ) ) ( AT_SOIL_SAMPLE ?AUTO_800 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_804 ) ( STORE_OF ?AUTO_802 ?AUTO_804 ) ( FULL ?AUTO_802 ) ( CAN_TRAVERSE ?AUTO_804 ?AUTO_805 ?AUTO_800 ) ( VISIBLE ?AUTO_805 ?AUTO_800 ) ( not ( = ?AUTO_800 ?AUTO_805 ) ) ( not ( = ?AUTO_801 ?AUTO_805 ) ) ( CAN_TRAVERSE ?AUTO_804 ?AUTO_806 ?AUTO_805 ) ( AT ?AUTO_804 ?AUTO_806 ) ( VISIBLE ?AUTO_806 ?AUTO_805 ) ( not ( = ?AUTO_800 ?AUTO_806 ) ) ( not ( = ?AUTO_801 ?AUTO_806 ) ) ( not ( = ?AUTO_805 ?AUTO_806 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_804 ?AUTO_806 ?AUTO_805 )
      ( GET_SOIL_DATA ?AUTO_800 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_800 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_808 - WAYPOINT
    )
    :vars
    (
      ?AUTO_811 - LANDER
      ?AUTO_810 - WAYPOINT
      ?AUTO_814 - ROVER
      ?AUTO_812 - STORE
      ?AUTO_813 - WAYPOINT
      ?AUTO_809 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_811 ?AUTO_810 ) ( VISIBLE ?AUTO_808 ?AUTO_810 ) ( AVAILABLE ?AUTO_814 ) ( CHANNEL_FREE ?AUTO_811 ) ( not ( = ?AUTO_808 ?AUTO_810 ) ) ( AT_SOIL_SAMPLE ?AUTO_808 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_814 ) ( STORE_OF ?AUTO_812 ?AUTO_814 ) ( CAN_TRAVERSE ?AUTO_814 ?AUTO_813 ?AUTO_808 ) ( VISIBLE ?AUTO_813 ?AUTO_808 ) ( not ( = ?AUTO_808 ?AUTO_813 ) ) ( not ( = ?AUTO_810 ?AUTO_813 ) ) ( CAN_TRAVERSE ?AUTO_814 ?AUTO_809 ?AUTO_813 ) ( AT ?AUTO_814 ?AUTO_809 ) ( VISIBLE ?AUTO_809 ?AUTO_813 ) ( not ( = ?AUTO_808 ?AUTO_809 ) ) ( not ( = ?AUTO_810 ?AUTO_809 ) ) ( not ( = ?AUTO_813 ?AUTO_809 ) ) ( AT_SOIL_SAMPLE ?AUTO_809 ) ( EMPTY ?AUTO_812 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_814 ?AUTO_812 ?AUTO_809 )
      ( GET_SOIL_DATA ?AUTO_808 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_808 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_838 - OBJECTIVE
      ?AUTO_839 - MODE
    )
    :vars
    (
      ?AUTO_845 - LANDER
      ?AUTO_840 - WAYPOINT
      ?AUTO_842 - WAYPOINT
      ?AUTO_843 - ROVER
      ?AUTO_844 - WAYPOINT
      ?AUTO_841 - CAMERA
      ?AUTO_846 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_845 ?AUTO_840 ) ( VISIBLE ?AUTO_842 ?AUTO_840 ) ( AVAILABLE ?AUTO_843 ) ( CHANNEL_FREE ?AUTO_845 ) ( not ( = ?AUTO_842 ?AUTO_840 ) ) ( CAN_TRAVERSE ?AUTO_843 ?AUTO_844 ?AUTO_842 ) ( VISIBLE ?AUTO_844 ?AUTO_842 ) ( not ( = ?AUTO_840 ?AUTO_844 ) ) ( not ( = ?AUTO_842 ?AUTO_844 ) ) ( CALIBRATED ?AUTO_841 ?AUTO_843 ) ( ON_BOARD ?AUTO_841 ?AUTO_843 ) ( EQUIPPED_FOR_IMAGING ?AUTO_843 ) ( SUPPORTS ?AUTO_841 ?AUTO_839 ) ( VISIBLE_FROM ?AUTO_838 ?AUTO_844 ) ( CAN_TRAVERSE ?AUTO_843 ?AUTO_846 ?AUTO_844 ) ( AT ?AUTO_843 ?AUTO_846 ) ( VISIBLE ?AUTO_846 ?AUTO_844 ) ( not ( = ?AUTO_840 ?AUTO_846 ) ) ( not ( = ?AUTO_842 ?AUTO_846 ) ) ( not ( = ?AUTO_844 ?AUTO_846 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_843 ?AUTO_846 ?AUTO_844 )
      ( GET_IMAGE_DATA ?AUTO_838 ?AUTO_839 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_838 ?AUTO_839 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_847 - OBJECTIVE
      ?AUTO_848 - MODE
    )
    :vars
    (
      ?AUTO_854 - LANDER
      ?AUTO_849 - WAYPOINT
      ?AUTO_852 - WAYPOINT
      ?AUTO_853 - ROVER
      ?AUTO_851 - WAYPOINT
      ?AUTO_850 - CAMERA
      ?AUTO_855 - WAYPOINT
      ?AUTO_856 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_854 ?AUTO_849 ) ( VISIBLE ?AUTO_852 ?AUTO_849 ) ( AVAILABLE ?AUTO_853 ) ( CHANNEL_FREE ?AUTO_854 ) ( not ( = ?AUTO_852 ?AUTO_849 ) ) ( CAN_TRAVERSE ?AUTO_853 ?AUTO_851 ?AUTO_852 ) ( VISIBLE ?AUTO_851 ?AUTO_852 ) ( not ( = ?AUTO_849 ?AUTO_851 ) ) ( not ( = ?AUTO_852 ?AUTO_851 ) ) ( ON_BOARD ?AUTO_850 ?AUTO_853 ) ( EQUIPPED_FOR_IMAGING ?AUTO_853 ) ( SUPPORTS ?AUTO_850 ?AUTO_848 ) ( VISIBLE_FROM ?AUTO_847 ?AUTO_851 ) ( CAN_TRAVERSE ?AUTO_853 ?AUTO_855 ?AUTO_851 ) ( AT ?AUTO_853 ?AUTO_855 ) ( VISIBLE ?AUTO_855 ?AUTO_851 ) ( not ( = ?AUTO_849 ?AUTO_855 ) ) ( not ( = ?AUTO_852 ?AUTO_855 ) ) ( not ( = ?AUTO_851 ?AUTO_855 ) ) ( CALIBRATION_TARGET ?AUTO_850 ?AUTO_856 ) ( VISIBLE_FROM ?AUTO_856 ?AUTO_855 ) ( not ( = ?AUTO_847 ?AUTO_856 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_853 ?AUTO_850 ?AUTO_856 ?AUTO_855 )
      ( GET_IMAGE_DATA ?AUTO_847 ?AUTO_848 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_847 ?AUTO_848 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_857 - OBJECTIVE
      ?AUTO_858 - MODE
    )
    :vars
    (
      ?AUTO_862 - LANDER
      ?AUTO_861 - WAYPOINT
      ?AUTO_865 - WAYPOINT
      ?AUTO_866 - ROVER
      ?AUTO_864 - WAYPOINT
      ?AUTO_863 - CAMERA
      ?AUTO_860 - WAYPOINT
      ?AUTO_859 - OBJECTIVE
      ?AUTO_867 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_862 ?AUTO_861 ) ( VISIBLE ?AUTO_865 ?AUTO_861 ) ( AVAILABLE ?AUTO_866 ) ( CHANNEL_FREE ?AUTO_862 ) ( not ( = ?AUTO_865 ?AUTO_861 ) ) ( CAN_TRAVERSE ?AUTO_866 ?AUTO_864 ?AUTO_865 ) ( VISIBLE ?AUTO_864 ?AUTO_865 ) ( not ( = ?AUTO_861 ?AUTO_864 ) ) ( not ( = ?AUTO_865 ?AUTO_864 ) ) ( ON_BOARD ?AUTO_863 ?AUTO_866 ) ( EQUIPPED_FOR_IMAGING ?AUTO_866 ) ( SUPPORTS ?AUTO_863 ?AUTO_858 ) ( VISIBLE_FROM ?AUTO_857 ?AUTO_864 ) ( CAN_TRAVERSE ?AUTO_866 ?AUTO_860 ?AUTO_864 ) ( VISIBLE ?AUTO_860 ?AUTO_864 ) ( not ( = ?AUTO_861 ?AUTO_860 ) ) ( not ( = ?AUTO_865 ?AUTO_860 ) ) ( not ( = ?AUTO_864 ?AUTO_860 ) ) ( CALIBRATION_TARGET ?AUTO_863 ?AUTO_859 ) ( VISIBLE_FROM ?AUTO_859 ?AUTO_860 ) ( not ( = ?AUTO_857 ?AUTO_859 ) ) ( CAN_TRAVERSE ?AUTO_866 ?AUTO_867 ?AUTO_860 ) ( AT ?AUTO_866 ?AUTO_867 ) ( VISIBLE ?AUTO_867 ?AUTO_860 ) ( not ( = ?AUTO_861 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_867 ) ) ( not ( = ?AUTO_864 ?AUTO_867 ) ) ( not ( = ?AUTO_860 ?AUTO_867 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_866 ?AUTO_867 ?AUTO_860 )
      ( GET_IMAGE_DATA ?AUTO_857 ?AUTO_858 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_857 ?AUTO_858 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_886 - WAYPOINT
    )
    :vars
    (
      ?AUTO_891 - LANDER
      ?AUTO_887 - WAYPOINT
      ?AUTO_889 - ROVER
      ?AUTO_890 - STORE
      ?AUTO_888 - WAYPOINT
      ?AUTO_892 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_891 ?AUTO_887 ) ( VISIBLE ?AUTO_886 ?AUTO_887 ) ( AVAILABLE ?AUTO_889 ) ( CHANNEL_FREE ?AUTO_891 ) ( not ( = ?AUTO_886 ?AUTO_887 ) ) ( AT_ROCK_SAMPLE ?AUTO_886 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_889 ) ( STORE_OF ?AUTO_890 ?AUTO_889 ) ( EMPTY ?AUTO_890 ) ( CAN_TRAVERSE ?AUTO_889 ?AUTO_888 ?AUTO_886 ) ( VISIBLE ?AUTO_888 ?AUTO_886 ) ( not ( = ?AUTO_886 ?AUTO_888 ) ) ( not ( = ?AUTO_887 ?AUTO_888 ) ) ( CAN_TRAVERSE ?AUTO_889 ?AUTO_892 ?AUTO_888 ) ( AT ?AUTO_889 ?AUTO_892 ) ( VISIBLE ?AUTO_892 ?AUTO_888 ) ( not ( = ?AUTO_886 ?AUTO_892 ) ) ( not ( = ?AUTO_887 ?AUTO_892 ) ) ( not ( = ?AUTO_888 ?AUTO_892 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_889 ?AUTO_892 ?AUTO_888 )
      ( GET_ROCK_DATA ?AUTO_886 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_886 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_894 - WAYPOINT
    )
    :vars
    (
      ?AUTO_899 - LANDER
      ?AUTO_896 - WAYPOINT
      ?AUTO_897 - ROVER
      ?AUTO_898 - STORE
      ?AUTO_895 - WAYPOINT
      ?AUTO_900 - WAYPOINT
      ?AUTO_901 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_899 ?AUTO_896 ) ( VISIBLE ?AUTO_894 ?AUTO_896 ) ( AVAILABLE ?AUTO_897 ) ( CHANNEL_FREE ?AUTO_899 ) ( not ( = ?AUTO_894 ?AUTO_896 ) ) ( AT_ROCK_SAMPLE ?AUTO_894 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_897 ) ( STORE_OF ?AUTO_898 ?AUTO_897 ) ( EMPTY ?AUTO_898 ) ( CAN_TRAVERSE ?AUTO_897 ?AUTO_895 ?AUTO_894 ) ( VISIBLE ?AUTO_895 ?AUTO_894 ) ( not ( = ?AUTO_894 ?AUTO_895 ) ) ( not ( = ?AUTO_896 ?AUTO_895 ) ) ( CAN_TRAVERSE ?AUTO_897 ?AUTO_900 ?AUTO_895 ) ( VISIBLE ?AUTO_900 ?AUTO_895 ) ( not ( = ?AUTO_894 ?AUTO_900 ) ) ( not ( = ?AUTO_896 ?AUTO_900 ) ) ( not ( = ?AUTO_895 ?AUTO_900 ) ) ( CAN_TRAVERSE ?AUTO_897 ?AUTO_901 ?AUTO_900 ) ( AT ?AUTO_897 ?AUTO_901 ) ( VISIBLE ?AUTO_901 ?AUTO_900 ) ( not ( = ?AUTO_894 ?AUTO_901 ) ) ( not ( = ?AUTO_896 ?AUTO_901 ) ) ( not ( = ?AUTO_895 ?AUTO_901 ) ) ( not ( = ?AUTO_900 ?AUTO_901 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_897 ?AUTO_901 ?AUTO_900 )
      ( GET_ROCK_DATA ?AUTO_894 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_894 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_919 - WAYPOINT
    )
    :vars
    (
      ?AUTO_921 - LANDER
      ?AUTO_920 - WAYPOINT
      ?AUTO_923 - WAYPOINT
      ?AUTO_922 - ROVER
      ?AUTO_924 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_921 ?AUTO_920 ) ( VISIBLE ?AUTO_923 ?AUTO_920 ) ( AVAILABLE ?AUTO_922 ) ( CHANNEL_FREE ?AUTO_921 ) ( not ( = ?AUTO_919 ?AUTO_923 ) ) ( not ( = ?AUTO_919 ?AUTO_920 ) ) ( not ( = ?AUTO_923 ?AUTO_920 ) ) ( CAN_TRAVERSE ?AUTO_922 ?AUTO_919 ?AUTO_923 ) ( VISIBLE ?AUTO_919 ?AUTO_923 ) ( AT_SOIL_SAMPLE ?AUTO_919 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_922 ) ( STORE_OF ?AUTO_924 ?AUTO_922 ) ( EMPTY ?AUTO_924 ) ( CAN_TRAVERSE ?AUTO_922 ?AUTO_923 ?AUTO_919 ) ( AT ?AUTO_922 ?AUTO_923 ) ( VISIBLE ?AUTO_923 ?AUTO_919 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_922 ?AUTO_923 ?AUTO_919 )
      ( GET_SOIL_DATA ?AUTO_919 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_919 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_925 - WAYPOINT
    )
    :vars
    (
      ?AUTO_926 - LANDER
      ?AUTO_929 - WAYPOINT
      ?AUTO_930 - WAYPOINT
      ?AUTO_927 - ROVER
      ?AUTO_928 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_926 ?AUTO_929 ) ( VISIBLE ?AUTO_930 ?AUTO_929 ) ( AVAILABLE ?AUTO_927 ) ( CHANNEL_FREE ?AUTO_926 ) ( not ( = ?AUTO_925 ?AUTO_930 ) ) ( not ( = ?AUTO_925 ?AUTO_929 ) ) ( not ( = ?AUTO_930 ?AUTO_929 ) ) ( CAN_TRAVERSE ?AUTO_927 ?AUTO_925 ?AUTO_930 ) ( VISIBLE ?AUTO_925 ?AUTO_930 ) ( AT_SOIL_SAMPLE ?AUTO_925 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_927 ) ( STORE_OF ?AUTO_928 ?AUTO_927 ) ( CAN_TRAVERSE ?AUTO_927 ?AUTO_930 ?AUTO_925 ) ( AT ?AUTO_927 ?AUTO_930 ) ( VISIBLE ?AUTO_930 ?AUTO_925 ) ( FULL ?AUTO_928 ) )
    :subtasks
    ( ( !DROP ?AUTO_927 ?AUTO_928 )
      ( GET_SOIL_DATA ?AUTO_925 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_925 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_938 - WAYPOINT
    )
    :vars
    (
      ?AUTO_940 - LANDER
      ?AUTO_943 - WAYPOINT
      ?AUTO_939 - WAYPOINT
      ?AUTO_942 - ROVER
      ?AUTO_941 - STORE
      ?AUTO_944 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_940 ?AUTO_943 ) ( VISIBLE ?AUTO_939 ?AUTO_943 ) ( AVAILABLE ?AUTO_942 ) ( CHANNEL_FREE ?AUTO_940 ) ( not ( = ?AUTO_938 ?AUTO_939 ) ) ( not ( = ?AUTO_938 ?AUTO_943 ) ) ( not ( = ?AUTO_939 ?AUTO_943 ) ) ( CAN_TRAVERSE ?AUTO_942 ?AUTO_938 ?AUTO_939 ) ( VISIBLE ?AUTO_938 ?AUTO_939 ) ( AT_SOIL_SAMPLE ?AUTO_938 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_942 ) ( STORE_OF ?AUTO_941 ?AUTO_942 ) ( EMPTY ?AUTO_941 ) ( CAN_TRAVERSE ?AUTO_942 ?AUTO_939 ?AUTO_938 ) ( VISIBLE ?AUTO_939 ?AUTO_938 ) ( CAN_TRAVERSE ?AUTO_942 ?AUTO_944 ?AUTO_939 ) ( AT ?AUTO_942 ?AUTO_944 ) ( VISIBLE ?AUTO_944 ?AUTO_939 ) ( not ( = ?AUTO_938 ?AUTO_944 ) ) ( not ( = ?AUTO_943 ?AUTO_944 ) ) ( not ( = ?AUTO_939 ?AUTO_944 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_942 ?AUTO_944 ?AUTO_939 )
      ( GET_SOIL_DATA ?AUTO_938 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_938 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_960 - WAYPOINT
    )
    :vars
    (
      ?AUTO_961 - LANDER
      ?AUTO_963 - WAYPOINT
      ?AUTO_964 - ROVER
      ?AUTO_962 - STORE
      ?AUTO_965 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_961 ?AUTO_960 ) ( VISIBLE ?AUTO_963 ?AUTO_960 ) ( AVAILABLE ?AUTO_964 ) ( CHANNEL_FREE ?AUTO_961 ) ( not ( = ?AUTO_960 ?AUTO_963 ) ) ( CAN_TRAVERSE ?AUTO_964 ?AUTO_960 ?AUTO_963 ) ( VISIBLE ?AUTO_960 ?AUTO_963 ) ( AT_ROCK_SAMPLE ?AUTO_960 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_964 ) ( STORE_OF ?AUTO_962 ?AUTO_964 ) ( EMPTY ?AUTO_962 ) ( CAN_TRAVERSE ?AUTO_964 ?AUTO_965 ?AUTO_960 ) ( AT ?AUTO_964 ?AUTO_965 ) ( VISIBLE ?AUTO_965 ?AUTO_960 ) ( not ( = ?AUTO_960 ?AUTO_965 ) ) ( not ( = ?AUTO_963 ?AUTO_965 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_964 ?AUTO_965 ?AUTO_960 )
      ( GET_ROCK_DATA ?AUTO_960 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_960 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_966 - WAYPOINT
    )
    :vars
    (
      ?AUTO_971 - LANDER
      ?AUTO_969 - WAYPOINT
      ?AUTO_967 - ROVER
      ?AUTO_970 - STORE
      ?AUTO_968 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_971 ?AUTO_966 ) ( VISIBLE ?AUTO_969 ?AUTO_966 ) ( AVAILABLE ?AUTO_967 ) ( CHANNEL_FREE ?AUTO_971 ) ( not ( = ?AUTO_966 ?AUTO_969 ) ) ( CAN_TRAVERSE ?AUTO_967 ?AUTO_966 ?AUTO_969 ) ( VISIBLE ?AUTO_966 ?AUTO_969 ) ( AT_ROCK_SAMPLE ?AUTO_966 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_967 ) ( STORE_OF ?AUTO_970 ?AUTO_967 ) ( CAN_TRAVERSE ?AUTO_967 ?AUTO_968 ?AUTO_966 ) ( AT ?AUTO_967 ?AUTO_968 ) ( VISIBLE ?AUTO_968 ?AUTO_966 ) ( not ( = ?AUTO_966 ?AUTO_968 ) ) ( not ( = ?AUTO_969 ?AUTO_968 ) ) ( FULL ?AUTO_970 ) )
    :subtasks
    ( ( !DROP ?AUTO_967 ?AUTO_970 )
      ( GET_ROCK_DATA ?AUTO_966 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_966 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_973 - WAYPOINT
    )
    :vars
    (
      ?AUTO_977 - LANDER
      ?AUTO_978 - WAYPOINT
      ?AUTO_975 - ROVER
      ?AUTO_974 - STORE
      ?AUTO_976 - WAYPOINT
      ?AUTO_979 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_977 ?AUTO_973 ) ( VISIBLE ?AUTO_978 ?AUTO_973 ) ( AVAILABLE ?AUTO_975 ) ( CHANNEL_FREE ?AUTO_977 ) ( not ( = ?AUTO_973 ?AUTO_978 ) ) ( CAN_TRAVERSE ?AUTO_975 ?AUTO_973 ?AUTO_978 ) ( VISIBLE ?AUTO_973 ?AUTO_978 ) ( AT_ROCK_SAMPLE ?AUTO_973 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_975 ) ( STORE_OF ?AUTO_974 ?AUTO_975 ) ( CAN_TRAVERSE ?AUTO_975 ?AUTO_976 ?AUTO_973 ) ( VISIBLE ?AUTO_976 ?AUTO_973 ) ( not ( = ?AUTO_973 ?AUTO_976 ) ) ( not ( = ?AUTO_978 ?AUTO_976 ) ) ( FULL ?AUTO_974 ) ( CAN_TRAVERSE ?AUTO_975 ?AUTO_979 ?AUTO_976 ) ( AT ?AUTO_975 ?AUTO_979 ) ( VISIBLE ?AUTO_979 ?AUTO_976 ) ( not ( = ?AUTO_973 ?AUTO_979 ) ) ( not ( = ?AUTO_978 ?AUTO_979 ) ) ( not ( = ?AUTO_976 ?AUTO_979 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_975 ?AUTO_979 ?AUTO_976 )
      ( GET_ROCK_DATA ?AUTO_973 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_973 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_980 - WAYPOINT
    )
    :vars
    (
      ?AUTO_986 - LANDER
      ?AUTO_981 - WAYPOINT
      ?AUTO_984 - ROVER
      ?AUTO_983 - STORE
      ?AUTO_982 - WAYPOINT
      ?AUTO_985 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_986 ?AUTO_980 ) ( VISIBLE ?AUTO_981 ?AUTO_980 ) ( AVAILABLE ?AUTO_984 ) ( CHANNEL_FREE ?AUTO_986 ) ( not ( = ?AUTO_980 ?AUTO_981 ) ) ( CAN_TRAVERSE ?AUTO_984 ?AUTO_980 ?AUTO_981 ) ( VISIBLE ?AUTO_980 ?AUTO_981 ) ( AT_ROCK_SAMPLE ?AUTO_980 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_984 ) ( STORE_OF ?AUTO_983 ?AUTO_984 ) ( CAN_TRAVERSE ?AUTO_984 ?AUTO_982 ?AUTO_980 ) ( VISIBLE ?AUTO_982 ?AUTO_980 ) ( not ( = ?AUTO_980 ?AUTO_982 ) ) ( not ( = ?AUTO_981 ?AUTO_982 ) ) ( CAN_TRAVERSE ?AUTO_984 ?AUTO_985 ?AUTO_982 ) ( AT ?AUTO_984 ?AUTO_985 ) ( VISIBLE ?AUTO_985 ?AUTO_982 ) ( not ( = ?AUTO_980 ?AUTO_985 ) ) ( not ( = ?AUTO_981 ?AUTO_985 ) ) ( not ( = ?AUTO_982 ?AUTO_985 ) ) ( AT_SOIL_SAMPLE ?AUTO_985 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_984 ) ( EMPTY ?AUTO_983 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_984 ?AUTO_983 ?AUTO_985 )
      ( GET_ROCK_DATA ?AUTO_980 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_980 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4190 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4195 - LANDER
      ?AUTO_4192 - WAYPOINT
      ?AUTO_4194 - ROVER
      ?AUTO_4196 - STORE
      ?AUTO_4193 - WAYPOINT
      ?AUTO_4191 - WAYPOINT
      ?AUTO_4197 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4195 ?AUTO_4190 ) ( VISIBLE ?AUTO_4192 ?AUTO_4190 ) ( AVAILABLE ?AUTO_4194 ) ( CHANNEL_FREE ?AUTO_4195 ) ( not ( = ?AUTO_4190 ?AUTO_4192 ) ) ( CAN_TRAVERSE ?AUTO_4194 ?AUTO_4190 ?AUTO_4192 ) ( VISIBLE ?AUTO_4190 ?AUTO_4192 ) ( AT_ROCK_SAMPLE ?AUTO_4190 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4194 ) ( STORE_OF ?AUTO_4196 ?AUTO_4194 ) ( EMPTY ?AUTO_4196 ) ( CAN_TRAVERSE ?AUTO_4194 ?AUTO_4193 ?AUTO_4190 ) ( VISIBLE ?AUTO_4193 ?AUTO_4190 ) ( not ( = ?AUTO_4190 ?AUTO_4193 ) ) ( not ( = ?AUTO_4192 ?AUTO_4193 ) ) ( CAN_TRAVERSE ?AUTO_4194 ?AUTO_4191 ?AUTO_4193 ) ( VISIBLE ?AUTO_4191 ?AUTO_4193 ) ( not ( = ?AUTO_4190 ?AUTO_4191 ) ) ( not ( = ?AUTO_4192 ?AUTO_4191 ) ) ( not ( = ?AUTO_4193 ?AUTO_4191 ) ) ( CAN_TRAVERSE ?AUTO_4194 ?AUTO_4197 ?AUTO_4191 ) ( AT ?AUTO_4194 ?AUTO_4197 ) ( VISIBLE ?AUTO_4197 ?AUTO_4191 ) ( not ( = ?AUTO_4190 ?AUTO_4197 ) ) ( not ( = ?AUTO_4192 ?AUTO_4197 ) ) ( not ( = ?AUTO_4193 ?AUTO_4197 ) ) ( not ( = ?AUTO_4191 ?AUTO_4197 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4194 ?AUTO_4197 ?AUTO_4191 )
      ( GET_ROCK_DATA ?AUTO_4190 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4190 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1003 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1007 - LANDER
      ?AUTO_1008 - WAYPOINT
      ?AUTO_1005 - ROVER
      ?AUTO_1010 - STORE
      ?AUTO_1009 - WAYPOINT
      ?AUTO_1006 - WAYPOINT
      ?AUTO_1004 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1007 ?AUTO_1003 ) ( VISIBLE ?AUTO_1008 ?AUTO_1003 ) ( AVAILABLE ?AUTO_1005 ) ( CHANNEL_FREE ?AUTO_1007 ) ( not ( = ?AUTO_1003 ?AUTO_1008 ) ) ( CAN_TRAVERSE ?AUTO_1005 ?AUTO_1003 ?AUTO_1008 ) ( VISIBLE ?AUTO_1003 ?AUTO_1008 ) ( AT_ROCK_SAMPLE ?AUTO_1003 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1005 ) ( STORE_OF ?AUTO_1010 ?AUTO_1005 ) ( CAN_TRAVERSE ?AUTO_1005 ?AUTO_1009 ?AUTO_1003 ) ( VISIBLE ?AUTO_1009 ?AUTO_1003 ) ( not ( = ?AUTO_1003 ?AUTO_1009 ) ) ( not ( = ?AUTO_1008 ?AUTO_1009 ) ) ( CAN_TRAVERSE ?AUTO_1005 ?AUTO_1006 ?AUTO_1009 ) ( VISIBLE ?AUTO_1006 ?AUTO_1009 ) ( not ( = ?AUTO_1003 ?AUTO_1006 ) ) ( not ( = ?AUTO_1008 ?AUTO_1006 ) ) ( not ( = ?AUTO_1009 ?AUTO_1006 ) ) ( AT_SOIL_SAMPLE ?AUTO_1006 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1005 ) ( EMPTY ?AUTO_1010 ) ( CAN_TRAVERSE ?AUTO_1005 ?AUTO_1004 ?AUTO_1006 ) ( VISIBLE ?AUTO_1004 ?AUTO_1006 ) ( not ( = ?AUTO_1003 ?AUTO_1004 ) ) ( not ( = ?AUTO_1008 ?AUTO_1004 ) ) ( not ( = ?AUTO_1009 ?AUTO_1004 ) ) ( not ( = ?AUTO_1006 ?AUTO_1004 ) ) ( CAN_TRAVERSE ?AUTO_1005 ?AUTO_1008 ?AUTO_1004 ) ( AT ?AUTO_1005 ?AUTO_1008 ) ( VISIBLE ?AUTO_1008 ?AUTO_1004 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1005 ?AUTO_1008 ?AUTO_1004 )
      ( GET_ROCK_DATA ?AUTO_1003 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1003 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1022 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1024 - LANDER
      ?AUTO_1026 - WAYPOINT
      ?AUTO_1025 - ROVER
      ?AUTO_1023 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1024 ?AUTO_1026 ) ( VISIBLE ?AUTO_1022 ?AUTO_1026 ) ( AVAILABLE ?AUTO_1025 ) ( CHANNEL_FREE ?AUTO_1024 ) ( not ( = ?AUTO_1022 ?AUTO_1026 ) ) ( AT_SOIL_SAMPLE ?AUTO_1022 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1025 ) ( STORE_OF ?AUTO_1023 ?AUTO_1025 ) ( EMPTY ?AUTO_1023 ) ( CAN_TRAVERSE ?AUTO_1025 ?AUTO_1026 ?AUTO_1022 ) ( AT ?AUTO_1025 ?AUTO_1026 ) ( VISIBLE ?AUTO_1026 ?AUTO_1022 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1025 ?AUTO_1026 ?AUTO_1022 )
      ( GET_SOIL_DATA ?AUTO_1022 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1022 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1027 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1030 - LANDER
      ?AUTO_1031 - WAYPOINT
      ?AUTO_1029 - ROVER
      ?AUTO_1028 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1030 ?AUTO_1031 ) ( VISIBLE ?AUTO_1027 ?AUTO_1031 ) ( AVAILABLE ?AUTO_1029 ) ( CHANNEL_FREE ?AUTO_1030 ) ( not ( = ?AUTO_1027 ?AUTO_1031 ) ) ( AT_SOIL_SAMPLE ?AUTO_1027 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1029 ) ( STORE_OF ?AUTO_1028 ?AUTO_1029 ) ( CAN_TRAVERSE ?AUTO_1029 ?AUTO_1031 ?AUTO_1027 ) ( AT ?AUTO_1029 ?AUTO_1031 ) ( VISIBLE ?AUTO_1031 ?AUTO_1027 ) ( FULL ?AUTO_1028 ) )
    :subtasks
    ( ( !DROP ?AUTO_1029 ?AUTO_1028 )
      ( GET_SOIL_DATA ?AUTO_1027 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1027 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1033 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1035 - LANDER
      ?AUTO_1034 - WAYPOINT
      ?AUTO_1037 - ROVER
      ?AUTO_1036 - STORE
      ?AUTO_1038 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1035 ?AUTO_1034 ) ( VISIBLE ?AUTO_1033 ?AUTO_1034 ) ( AVAILABLE ?AUTO_1037 ) ( CHANNEL_FREE ?AUTO_1035 ) ( not ( = ?AUTO_1033 ?AUTO_1034 ) ) ( AT_SOIL_SAMPLE ?AUTO_1033 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1037 ) ( STORE_OF ?AUTO_1036 ?AUTO_1037 ) ( EMPTY ?AUTO_1036 ) ( CAN_TRAVERSE ?AUTO_1037 ?AUTO_1034 ?AUTO_1033 ) ( VISIBLE ?AUTO_1034 ?AUTO_1033 ) ( CAN_TRAVERSE ?AUTO_1037 ?AUTO_1038 ?AUTO_1034 ) ( AT ?AUTO_1037 ?AUTO_1038 ) ( VISIBLE ?AUTO_1038 ?AUTO_1034 ) ( not ( = ?AUTO_1033 ?AUTO_1038 ) ) ( not ( = ?AUTO_1034 ?AUTO_1038 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1037 ?AUTO_1038 ?AUTO_1034 )
      ( GET_SOIL_DATA ?AUTO_1033 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1033 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1039 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1041 - LANDER
      ?AUTO_1040 - WAYPOINT
      ?AUTO_1043 - ROVER
      ?AUTO_1042 - STORE
      ?AUTO_1044 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1041 ?AUTO_1040 ) ( VISIBLE ?AUTO_1039 ?AUTO_1040 ) ( AVAILABLE ?AUTO_1043 ) ( CHANNEL_FREE ?AUTO_1041 ) ( not ( = ?AUTO_1039 ?AUTO_1040 ) ) ( AT_SOIL_SAMPLE ?AUTO_1039 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1043 ) ( STORE_OF ?AUTO_1042 ?AUTO_1043 ) ( CAN_TRAVERSE ?AUTO_1043 ?AUTO_1040 ?AUTO_1039 ) ( VISIBLE ?AUTO_1040 ?AUTO_1039 ) ( CAN_TRAVERSE ?AUTO_1043 ?AUTO_1044 ?AUTO_1040 ) ( AT ?AUTO_1043 ?AUTO_1044 ) ( VISIBLE ?AUTO_1044 ?AUTO_1040 ) ( not ( = ?AUTO_1039 ?AUTO_1044 ) ) ( not ( = ?AUTO_1040 ?AUTO_1044 ) ) ( FULL ?AUTO_1042 ) )
    :subtasks
    ( ( !DROP ?AUTO_1043 ?AUTO_1042 )
      ( GET_SOIL_DATA ?AUTO_1039 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1039 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1046 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1048 - LANDER
      ?AUTO_1047 - WAYPOINT
      ?AUTO_1050 - ROVER
      ?AUTO_1049 - STORE
      ?AUTO_1051 - WAYPOINT
      ?AUTO_1052 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1048 ?AUTO_1047 ) ( VISIBLE ?AUTO_1046 ?AUTO_1047 ) ( AVAILABLE ?AUTO_1050 ) ( CHANNEL_FREE ?AUTO_1048 ) ( not ( = ?AUTO_1046 ?AUTO_1047 ) ) ( AT_SOIL_SAMPLE ?AUTO_1046 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1050 ) ( STORE_OF ?AUTO_1049 ?AUTO_1050 ) ( CAN_TRAVERSE ?AUTO_1050 ?AUTO_1047 ?AUTO_1046 ) ( VISIBLE ?AUTO_1047 ?AUTO_1046 ) ( CAN_TRAVERSE ?AUTO_1050 ?AUTO_1051 ?AUTO_1047 ) ( VISIBLE ?AUTO_1051 ?AUTO_1047 ) ( not ( = ?AUTO_1046 ?AUTO_1051 ) ) ( not ( = ?AUTO_1047 ?AUTO_1051 ) ) ( FULL ?AUTO_1049 ) ( CAN_TRAVERSE ?AUTO_1050 ?AUTO_1052 ?AUTO_1051 ) ( AT ?AUTO_1050 ?AUTO_1052 ) ( VISIBLE ?AUTO_1052 ?AUTO_1051 ) ( not ( = ?AUTO_1046 ?AUTO_1052 ) ) ( not ( = ?AUTO_1047 ?AUTO_1052 ) ) ( not ( = ?AUTO_1051 ?AUTO_1052 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1050 ?AUTO_1052 ?AUTO_1051 )
      ( GET_SOIL_DATA ?AUTO_1046 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1046 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1053 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1056 - LANDER
      ?AUTO_1054 - WAYPOINT
      ?AUTO_1059 - ROVER
      ?AUTO_1058 - STORE
      ?AUTO_1055 - WAYPOINT
      ?AUTO_1057 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1056 ?AUTO_1054 ) ( VISIBLE ?AUTO_1053 ?AUTO_1054 ) ( AVAILABLE ?AUTO_1059 ) ( CHANNEL_FREE ?AUTO_1056 ) ( not ( = ?AUTO_1053 ?AUTO_1054 ) ) ( AT_SOIL_SAMPLE ?AUTO_1053 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1059 ) ( STORE_OF ?AUTO_1058 ?AUTO_1059 ) ( CAN_TRAVERSE ?AUTO_1059 ?AUTO_1054 ?AUTO_1053 ) ( VISIBLE ?AUTO_1054 ?AUTO_1053 ) ( CAN_TRAVERSE ?AUTO_1059 ?AUTO_1055 ?AUTO_1054 ) ( VISIBLE ?AUTO_1055 ?AUTO_1054 ) ( not ( = ?AUTO_1053 ?AUTO_1055 ) ) ( not ( = ?AUTO_1054 ?AUTO_1055 ) ) ( CAN_TRAVERSE ?AUTO_1059 ?AUTO_1057 ?AUTO_1055 ) ( AT ?AUTO_1059 ?AUTO_1057 ) ( VISIBLE ?AUTO_1057 ?AUTO_1055 ) ( not ( = ?AUTO_1053 ?AUTO_1057 ) ) ( not ( = ?AUTO_1054 ?AUTO_1057 ) ) ( not ( = ?AUTO_1055 ?AUTO_1057 ) ) ( AT_SOIL_SAMPLE ?AUTO_1057 ) ( EMPTY ?AUTO_1058 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1059 ?AUTO_1058 ?AUTO_1057 )
      ( GET_SOIL_DATA ?AUTO_1053 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1053 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1114 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1115 - ROVER
      ?AUTO_1117 - WAYPOINT
      ?AUTO_1116 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_1115 ?AUTO_1117 ) ( AT_LANDER ?AUTO_1116 ?AUTO_1114 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1115 ?AUTO_1114 ) ( VISIBLE ?AUTO_1117 ?AUTO_1114 ) ( AVAILABLE ?AUTO_1115 ) ( CHANNEL_FREE ?AUTO_1116 ) ( not ( = ?AUTO_1114 ?AUTO_1117 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_1115 ?AUTO_1116 ?AUTO_1114 ?AUTO_1117 ?AUTO_1114 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1114 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1118 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1119 - LANDER
      ?AUTO_1120 - ROVER
      ?AUTO_1121 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1119 ?AUTO_1118 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1120 ?AUTO_1118 ) ( VISIBLE ?AUTO_1121 ?AUTO_1118 ) ( AVAILABLE ?AUTO_1120 ) ( CHANNEL_FREE ?AUTO_1119 ) ( not ( = ?AUTO_1118 ?AUTO_1121 ) ) ( CAN_TRAVERSE ?AUTO_1120 ?AUTO_1118 ?AUTO_1121 ) ( AT ?AUTO_1120 ?AUTO_1118 ) ( VISIBLE ?AUTO_1118 ?AUTO_1121 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1120 ?AUTO_1118 ?AUTO_1121 )
      ( GET_SOIL_DATA ?AUTO_1118 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1118 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1125 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1128 - LANDER
      ?AUTO_1127 - WAYPOINT
      ?AUTO_1126 - ROVER
      ?AUTO_1129 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1128 ?AUTO_1125 ) ( VISIBLE ?AUTO_1127 ?AUTO_1125 ) ( AVAILABLE ?AUTO_1126 ) ( CHANNEL_FREE ?AUTO_1128 ) ( not ( = ?AUTO_1125 ?AUTO_1127 ) ) ( CAN_TRAVERSE ?AUTO_1126 ?AUTO_1125 ?AUTO_1127 ) ( AT ?AUTO_1126 ?AUTO_1125 ) ( VISIBLE ?AUTO_1125 ?AUTO_1127 ) ( AT_SOIL_SAMPLE ?AUTO_1125 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1126 ) ( STORE_OF ?AUTO_1129 ?AUTO_1126 ) ( EMPTY ?AUTO_1129 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1126 ?AUTO_1129 ?AUTO_1125 )
      ( GET_SOIL_DATA ?AUTO_1125 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1125 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1152 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1154 - LANDER
      ?AUTO_1156 - WAYPOINT
      ?AUTO_1153 - ROVER
      ?AUTO_1155 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1154 ?AUTO_1152 ) ( VISIBLE ?AUTO_1156 ?AUTO_1152 ) ( AVAILABLE ?AUTO_1153 ) ( CHANNEL_FREE ?AUTO_1154 ) ( not ( = ?AUTO_1152 ?AUTO_1156 ) ) ( CAN_TRAVERSE ?AUTO_1153 ?AUTO_1152 ?AUTO_1156 ) ( AT ?AUTO_1153 ?AUTO_1152 ) ( VISIBLE ?AUTO_1152 ?AUTO_1156 ) ( AT_ROCK_SAMPLE ?AUTO_1152 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1153 ) ( STORE_OF ?AUTO_1155 ?AUTO_1153 ) ( FULL ?AUTO_1155 ) )
    :subtasks
    ( ( !DROP ?AUTO_1153 ?AUTO_1155 )
      ( GET_ROCK_DATA ?AUTO_1152 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1152 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1242 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1243 - LANDER
      ?AUTO_1246 - WAYPOINT
      ?AUTO_1245 - ROVER
      ?AUTO_1244 - STORE
      ?AUTO_1247 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1243 ?AUTO_1246 ) ( VISIBLE ?AUTO_1242 ?AUTO_1246 ) ( AVAILABLE ?AUTO_1245 ) ( CHANNEL_FREE ?AUTO_1243 ) ( not ( = ?AUTO_1242 ?AUTO_1246 ) ) ( AT_ROCK_SAMPLE ?AUTO_1242 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1245 ) ( STORE_OF ?AUTO_1244 ?AUTO_1245 ) ( EMPTY ?AUTO_1244 ) ( CAN_TRAVERSE ?AUTO_1245 ?AUTO_1246 ?AUTO_1242 ) ( VISIBLE ?AUTO_1246 ?AUTO_1242 ) ( CAN_TRAVERSE ?AUTO_1245 ?AUTO_1247 ?AUTO_1246 ) ( AT ?AUTO_1245 ?AUTO_1247 ) ( VISIBLE ?AUTO_1247 ?AUTO_1246 ) ( not ( = ?AUTO_1242 ?AUTO_1247 ) ) ( not ( = ?AUTO_1246 ?AUTO_1247 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1245 ?AUTO_1247 ?AUTO_1246 )
      ( GET_ROCK_DATA ?AUTO_1242 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1242 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1263 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1266 - LANDER
      ?AUTO_1265 - WAYPOINT
      ?AUTO_1264 - ROVER
      ?AUTO_1267 - STORE
      ?AUTO_1268 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1266 ?AUTO_1265 ) ( VISIBLE ?AUTO_1263 ?AUTO_1265 ) ( AVAILABLE ?AUTO_1264 ) ( CHANNEL_FREE ?AUTO_1266 ) ( not ( = ?AUTO_1263 ?AUTO_1265 ) ) ( AT_ROCK_SAMPLE ?AUTO_1263 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1264 ) ( STORE_OF ?AUTO_1267 ?AUTO_1264 ) ( FULL ?AUTO_1267 ) ( CAN_TRAVERSE ?AUTO_1264 ?AUTO_1268 ?AUTO_1263 ) ( AT ?AUTO_1264 ?AUTO_1268 ) ( VISIBLE ?AUTO_1268 ?AUTO_1263 ) ( not ( = ?AUTO_1263 ?AUTO_1268 ) ) ( not ( = ?AUTO_1265 ?AUTO_1268 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1264 ?AUTO_1268 ?AUTO_1263 )
      ( GET_ROCK_DATA ?AUTO_1263 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1263 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1270 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1272 - LANDER
      ?AUTO_1275 - WAYPOINT
      ?AUTO_1271 - ROVER
      ?AUTO_1274 - STORE
      ?AUTO_1273 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1272 ?AUTO_1275 ) ( VISIBLE ?AUTO_1270 ?AUTO_1275 ) ( AVAILABLE ?AUTO_1271 ) ( CHANNEL_FREE ?AUTO_1272 ) ( not ( = ?AUTO_1270 ?AUTO_1275 ) ) ( AT_ROCK_SAMPLE ?AUTO_1270 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1271 ) ( STORE_OF ?AUTO_1274 ?AUTO_1271 ) ( CAN_TRAVERSE ?AUTO_1271 ?AUTO_1273 ?AUTO_1270 ) ( AT ?AUTO_1271 ?AUTO_1273 ) ( VISIBLE ?AUTO_1273 ?AUTO_1270 ) ( not ( = ?AUTO_1270 ?AUTO_1273 ) ) ( not ( = ?AUTO_1275 ?AUTO_1273 ) ) ( AT_ROCK_SAMPLE ?AUTO_1273 ) ( EMPTY ?AUTO_1274 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1271 ?AUTO_1274 ?AUTO_1273 )
      ( GET_ROCK_DATA ?AUTO_1270 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1270 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4370 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4375 - LANDER
      ?AUTO_4374 - WAYPOINT
      ?AUTO_4372 - ROVER
      ?AUTO_4371 - STORE
      ?AUTO_4373 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4375 ?AUTO_4374 ) ( VISIBLE ?AUTO_4370 ?AUTO_4374 ) ( AVAILABLE ?AUTO_4372 ) ( CHANNEL_FREE ?AUTO_4375 ) ( not ( = ?AUTO_4370 ?AUTO_4374 ) ) ( AT_ROCK_SAMPLE ?AUTO_4370 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4372 ) ( STORE_OF ?AUTO_4371 ?AUTO_4372 ) ( EMPTY ?AUTO_4371 ) ( CAN_TRAVERSE ?AUTO_4372 ?AUTO_4373 ?AUTO_4370 ) ( VISIBLE ?AUTO_4373 ?AUTO_4370 ) ( not ( = ?AUTO_4370 ?AUTO_4373 ) ) ( not ( = ?AUTO_4374 ?AUTO_4373 ) ) ( CAN_TRAVERSE ?AUTO_4372 ?AUTO_4374 ?AUTO_4373 ) ( AT ?AUTO_4372 ?AUTO_4374 ) ( VISIBLE ?AUTO_4374 ?AUTO_4373 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4372 ?AUTO_4374 ?AUTO_4373 )
      ( GET_ROCK_DATA ?AUTO_4370 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4370 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1304 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1305 - LANDER
      ?AUTO_1306 - WAYPOINT
      ?AUTO_1307 - ROVER
      ?AUTO_1308 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1305 ?AUTO_1304 ) ( VISIBLE ?AUTO_1306 ?AUTO_1304 ) ( AVAILABLE ?AUTO_1307 ) ( CHANNEL_FREE ?AUTO_1305 ) ( not ( = ?AUTO_1304 ?AUTO_1306 ) ) ( CAN_TRAVERSE ?AUTO_1307 ?AUTO_1304 ?AUTO_1306 ) ( AT ?AUTO_1307 ?AUTO_1304 ) ( VISIBLE ?AUTO_1304 ?AUTO_1306 ) ( AT_SOIL_SAMPLE ?AUTO_1304 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1307 ) ( STORE_OF ?AUTO_1308 ?AUTO_1307 ) ( FULL ?AUTO_1308 ) )
    :subtasks
    ( ( !DROP ?AUTO_1307 ?AUTO_1308 )
      ( GET_SOIL_DATA ?AUTO_1304 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1304 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1309 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1310 - LANDER
      ?AUTO_1313 - WAYPOINT
      ?AUTO_1311 - ROVER
      ?AUTO_1312 - STORE
      ?AUTO_1314 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1310 ?AUTO_1309 ) ( VISIBLE ?AUTO_1313 ?AUTO_1309 ) ( AVAILABLE ?AUTO_1311 ) ( CHANNEL_FREE ?AUTO_1310 ) ( not ( = ?AUTO_1309 ?AUTO_1313 ) ) ( CAN_TRAVERSE ?AUTO_1311 ?AUTO_1309 ?AUTO_1313 ) ( VISIBLE ?AUTO_1309 ?AUTO_1313 ) ( AT_SOIL_SAMPLE ?AUTO_1309 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1311 ) ( STORE_OF ?AUTO_1312 ?AUTO_1311 ) ( FULL ?AUTO_1312 ) ( CAN_TRAVERSE ?AUTO_1311 ?AUTO_1314 ?AUTO_1309 ) ( AT ?AUTO_1311 ?AUTO_1314 ) ( VISIBLE ?AUTO_1314 ?AUTO_1309 ) ( not ( = ?AUTO_1309 ?AUTO_1314 ) ) ( not ( = ?AUTO_1313 ?AUTO_1314 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1311 ?AUTO_1314 ?AUTO_1309 )
      ( GET_SOIL_DATA ?AUTO_1309 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1309 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1316 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1320 - LANDER
      ?AUTO_1321 - WAYPOINT
      ?AUTO_1319 - ROVER
      ?AUTO_1317 - STORE
      ?AUTO_1318 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1320 ?AUTO_1316 ) ( VISIBLE ?AUTO_1321 ?AUTO_1316 ) ( AVAILABLE ?AUTO_1319 ) ( CHANNEL_FREE ?AUTO_1320 ) ( not ( = ?AUTO_1316 ?AUTO_1321 ) ) ( CAN_TRAVERSE ?AUTO_1319 ?AUTO_1316 ?AUTO_1321 ) ( VISIBLE ?AUTO_1316 ?AUTO_1321 ) ( AT_SOIL_SAMPLE ?AUTO_1316 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1319 ) ( STORE_OF ?AUTO_1317 ?AUTO_1319 ) ( CAN_TRAVERSE ?AUTO_1319 ?AUTO_1318 ?AUTO_1316 ) ( AT ?AUTO_1319 ?AUTO_1318 ) ( VISIBLE ?AUTO_1318 ?AUTO_1316 ) ( not ( = ?AUTO_1316 ?AUTO_1318 ) ) ( not ( = ?AUTO_1321 ?AUTO_1318 ) ) ( AT_ROCK_SAMPLE ?AUTO_1318 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1319 ) ( EMPTY ?AUTO_1317 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1319 ?AUTO_1317 ?AUTO_1318 )
      ( GET_SOIL_DATA ?AUTO_1316 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1316 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1357 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1359 - LANDER
      ?AUTO_1360 - WAYPOINT
      ?AUTO_1361 - ROVER
      ?AUTO_1358 - STORE
      ?AUTO_1362 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1359 ?AUTO_1360 ) ( VISIBLE ?AUTO_1357 ?AUTO_1360 ) ( AVAILABLE ?AUTO_1361 ) ( CHANNEL_FREE ?AUTO_1359 ) ( not ( = ?AUTO_1357 ?AUTO_1360 ) ) ( AT_SOIL_SAMPLE ?AUTO_1357 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1361 ) ( STORE_OF ?AUTO_1358 ?AUTO_1361 ) ( CAN_TRAVERSE ?AUTO_1361 ?AUTO_1360 ?AUTO_1357 ) ( VISIBLE ?AUTO_1360 ?AUTO_1357 ) ( FULL ?AUTO_1358 ) ( CAN_TRAVERSE ?AUTO_1361 ?AUTO_1362 ?AUTO_1360 ) ( AT ?AUTO_1361 ?AUTO_1362 ) ( VISIBLE ?AUTO_1362 ?AUTO_1360 ) ( not ( = ?AUTO_1357 ?AUTO_1362 ) ) ( not ( = ?AUTO_1360 ?AUTO_1362 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1361 ?AUTO_1362 ?AUTO_1360 )
      ( GET_SOIL_DATA ?AUTO_1357 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1357 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1364 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1368 - LANDER
      ?AUTO_1365 - WAYPOINT
      ?AUTO_1366 - ROVER
      ?AUTO_1369 - STORE
      ?AUTO_1367 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1368 ?AUTO_1365 ) ( VISIBLE ?AUTO_1364 ?AUTO_1365 ) ( AVAILABLE ?AUTO_1366 ) ( CHANNEL_FREE ?AUTO_1368 ) ( not ( = ?AUTO_1364 ?AUTO_1365 ) ) ( AT_SOIL_SAMPLE ?AUTO_1364 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1366 ) ( STORE_OF ?AUTO_1369 ?AUTO_1366 ) ( CAN_TRAVERSE ?AUTO_1366 ?AUTO_1365 ?AUTO_1364 ) ( VISIBLE ?AUTO_1365 ?AUTO_1364 ) ( CAN_TRAVERSE ?AUTO_1366 ?AUTO_1367 ?AUTO_1365 ) ( AT ?AUTO_1366 ?AUTO_1367 ) ( VISIBLE ?AUTO_1367 ?AUTO_1365 ) ( not ( = ?AUTO_1364 ?AUTO_1367 ) ) ( not ( = ?AUTO_1365 ?AUTO_1367 ) ) ( AT_ROCK_SAMPLE ?AUTO_1367 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1366 ) ( EMPTY ?AUTO_1369 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1366 ?AUTO_1369 ?AUTO_1367 )
      ( GET_SOIL_DATA ?AUTO_1364 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1364 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1422 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1427 - LANDER
      ?AUTO_1426 - WAYPOINT
      ?AUTO_1424 - ROVER
      ?AUTO_1425 - STORE
      ?AUTO_1423 - WAYPOINT
      ?AUTO_1428 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1427 ?AUTO_1426 ) ( VISIBLE ?AUTO_1422 ?AUTO_1426 ) ( AVAILABLE ?AUTO_1424 ) ( CHANNEL_FREE ?AUTO_1427 ) ( not ( = ?AUTO_1422 ?AUTO_1426 ) ) ( AT_ROCK_SAMPLE ?AUTO_1422 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1424 ) ( STORE_OF ?AUTO_1425 ?AUTO_1424 ) ( EMPTY ?AUTO_1425 ) ( CAN_TRAVERSE ?AUTO_1424 ?AUTO_1426 ?AUTO_1422 ) ( VISIBLE ?AUTO_1426 ?AUTO_1422 ) ( CAN_TRAVERSE ?AUTO_1424 ?AUTO_1423 ?AUTO_1426 ) ( VISIBLE ?AUTO_1423 ?AUTO_1426 ) ( not ( = ?AUTO_1422 ?AUTO_1423 ) ) ( not ( = ?AUTO_1426 ?AUTO_1423 ) ) ( CAN_TRAVERSE ?AUTO_1424 ?AUTO_1428 ?AUTO_1423 ) ( AT ?AUTO_1424 ?AUTO_1428 ) ( VISIBLE ?AUTO_1428 ?AUTO_1423 ) ( not ( = ?AUTO_1422 ?AUTO_1428 ) ) ( not ( = ?AUTO_1426 ?AUTO_1428 ) ) ( not ( = ?AUTO_1423 ?AUTO_1428 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1424 ?AUTO_1428 ?AUTO_1423 )
      ( GET_ROCK_DATA ?AUTO_1422 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1422 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1446 - OBJECTIVE
      ?AUTO_1447 - MODE
    )
    :vars
    (
      ?AUTO_1448 - ROVER
      ?AUTO_1450 - WAYPOINT
      ?AUTO_1451 - LANDER
      ?AUTO_1449 - WAYPOINT
      ?AUTO_1452 - CAMERA
      ?AUTO_1453 - OBJECTIVE
    )
    :precondition
    ( and ( AT ?AUTO_1448 ?AUTO_1450 ) ( AT_LANDER ?AUTO_1451 ?AUTO_1449 ) ( VISIBLE ?AUTO_1450 ?AUTO_1449 ) ( AVAILABLE ?AUTO_1448 ) ( CHANNEL_FREE ?AUTO_1451 ) ( not ( = ?AUTO_1450 ?AUTO_1449 ) ) ( ON_BOARD ?AUTO_1452 ?AUTO_1448 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1448 ) ( SUPPORTS ?AUTO_1452 ?AUTO_1447 ) ( VISIBLE_FROM ?AUTO_1446 ?AUTO_1450 ) ( CALIBRATION_TARGET ?AUTO_1452 ?AUTO_1453 ) ( VISIBLE_FROM ?AUTO_1453 ?AUTO_1450 ) ( not ( = ?AUTO_1446 ?AUTO_1453 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1448 ?AUTO_1452 ?AUTO_1453 ?AUTO_1450 )
      ( GET_IMAGE_DATA ?AUTO_1446 ?AUTO_1447 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1446 ?AUTO_1447 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1454 - OBJECTIVE
      ?AUTO_1455 - MODE
    )
    :vars
    (
      ?AUTO_1459 - LANDER
      ?AUTO_1460 - WAYPOINT
      ?AUTO_1456 - WAYPOINT
      ?AUTO_1458 - ROVER
      ?AUTO_1457 - CAMERA
      ?AUTO_1461 - OBJECTIVE
      ?AUTO_1462 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1459 ?AUTO_1460 ) ( VISIBLE ?AUTO_1456 ?AUTO_1460 ) ( AVAILABLE ?AUTO_1458 ) ( CHANNEL_FREE ?AUTO_1459 ) ( not ( = ?AUTO_1456 ?AUTO_1460 ) ) ( ON_BOARD ?AUTO_1457 ?AUTO_1458 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1458 ) ( SUPPORTS ?AUTO_1457 ?AUTO_1455 ) ( VISIBLE_FROM ?AUTO_1454 ?AUTO_1456 ) ( CALIBRATION_TARGET ?AUTO_1457 ?AUTO_1461 ) ( VISIBLE_FROM ?AUTO_1461 ?AUTO_1456 ) ( not ( = ?AUTO_1454 ?AUTO_1461 ) ) ( CAN_TRAVERSE ?AUTO_1458 ?AUTO_1462 ?AUTO_1456 ) ( AT ?AUTO_1458 ?AUTO_1462 ) ( VISIBLE ?AUTO_1462 ?AUTO_1456 ) ( not ( = ?AUTO_1460 ?AUTO_1462 ) ) ( not ( = ?AUTO_1456 ?AUTO_1462 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1458 ?AUTO_1462 ?AUTO_1456 )
      ( GET_IMAGE_DATA ?AUTO_1454 ?AUTO_1455 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1454 ?AUTO_1455 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1535 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1537 - LANDER
      ?AUTO_1539 - WAYPOINT
      ?AUTO_1538 - ROVER
      ?AUTO_1536 - STORE
      ?AUTO_1540 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1537 ?AUTO_1535 ) ( VISIBLE ?AUTO_1539 ?AUTO_1535 ) ( AVAILABLE ?AUTO_1538 ) ( CHANNEL_FREE ?AUTO_1537 ) ( not ( = ?AUTO_1535 ?AUTO_1539 ) ) ( CAN_TRAVERSE ?AUTO_1538 ?AUTO_1535 ?AUTO_1539 ) ( VISIBLE ?AUTO_1535 ?AUTO_1539 ) ( AT_SOIL_SAMPLE ?AUTO_1535 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1538 ) ( STORE_OF ?AUTO_1536 ?AUTO_1538 ) ( EMPTY ?AUTO_1536 ) ( CAN_TRAVERSE ?AUTO_1538 ?AUTO_1540 ?AUTO_1535 ) ( AT ?AUTO_1538 ?AUTO_1540 ) ( VISIBLE ?AUTO_1540 ?AUTO_1535 ) ( not ( = ?AUTO_1535 ?AUTO_1540 ) ) ( not ( = ?AUTO_1539 ?AUTO_1540 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1538 ?AUTO_1540 ?AUTO_1535 )
      ( GET_SOIL_DATA ?AUTO_1535 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1535 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1541 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1545 - LANDER
      ?AUTO_1544 - WAYPOINT
      ?AUTO_1546 - ROVER
      ?AUTO_1542 - STORE
      ?AUTO_1543 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1545 ?AUTO_1541 ) ( VISIBLE ?AUTO_1544 ?AUTO_1541 ) ( AVAILABLE ?AUTO_1546 ) ( CHANNEL_FREE ?AUTO_1545 ) ( not ( = ?AUTO_1541 ?AUTO_1544 ) ) ( CAN_TRAVERSE ?AUTO_1546 ?AUTO_1541 ?AUTO_1544 ) ( VISIBLE ?AUTO_1541 ?AUTO_1544 ) ( AT_SOIL_SAMPLE ?AUTO_1541 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1546 ) ( STORE_OF ?AUTO_1542 ?AUTO_1546 ) ( CAN_TRAVERSE ?AUTO_1546 ?AUTO_1543 ?AUTO_1541 ) ( AT ?AUTO_1546 ?AUTO_1543 ) ( VISIBLE ?AUTO_1543 ?AUTO_1541 ) ( not ( = ?AUTO_1541 ?AUTO_1543 ) ) ( not ( = ?AUTO_1544 ?AUTO_1543 ) ) ( FULL ?AUTO_1542 ) )
    :subtasks
    ( ( !DROP ?AUTO_1546 ?AUTO_1542 )
      ( GET_SOIL_DATA ?AUTO_1541 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1541 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1555 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1558 - LANDER
      ?AUTO_1556 - WAYPOINT
      ?AUTO_1557 - ROVER
      ?AUTO_1560 - STORE
      ?AUTO_1559 - WAYPOINT
      ?AUTO_1561 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1558 ?AUTO_1555 ) ( VISIBLE ?AUTO_1556 ?AUTO_1555 ) ( AVAILABLE ?AUTO_1557 ) ( CHANNEL_FREE ?AUTO_1558 ) ( not ( = ?AUTO_1555 ?AUTO_1556 ) ) ( CAN_TRAVERSE ?AUTO_1557 ?AUTO_1555 ?AUTO_1556 ) ( VISIBLE ?AUTO_1555 ?AUTO_1556 ) ( AT_SOIL_SAMPLE ?AUTO_1555 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1557 ) ( STORE_OF ?AUTO_1560 ?AUTO_1557 ) ( EMPTY ?AUTO_1560 ) ( CAN_TRAVERSE ?AUTO_1557 ?AUTO_1559 ?AUTO_1555 ) ( VISIBLE ?AUTO_1559 ?AUTO_1555 ) ( not ( = ?AUTO_1555 ?AUTO_1559 ) ) ( not ( = ?AUTO_1556 ?AUTO_1559 ) ) ( CAN_TRAVERSE ?AUTO_1557 ?AUTO_1561 ?AUTO_1559 ) ( AT ?AUTO_1557 ?AUTO_1561 ) ( VISIBLE ?AUTO_1561 ?AUTO_1559 ) ( not ( = ?AUTO_1555 ?AUTO_1561 ) ) ( not ( = ?AUTO_1556 ?AUTO_1561 ) ) ( not ( = ?AUTO_1559 ?AUTO_1561 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1557 ?AUTO_1561 ?AUTO_1559 )
      ( GET_SOIL_DATA ?AUTO_1555 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1555 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1629 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1630 - LANDER
      ?AUTO_1631 - WAYPOINT
      ?AUTO_1632 - ROVER
      ?AUTO_1634 - STORE
      ?AUTO_1633 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1630 ?AUTO_1631 ) ( VISIBLE ?AUTO_1629 ?AUTO_1631 ) ( AVAILABLE ?AUTO_1632 ) ( CHANNEL_FREE ?AUTO_1630 ) ( not ( = ?AUTO_1629 ?AUTO_1631 ) ) ( AT_ROCK_SAMPLE ?AUTO_1629 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1632 ) ( STORE_OF ?AUTO_1634 ?AUTO_1632 ) ( FULL ?AUTO_1634 ) ( CAN_TRAVERSE ?AUTO_1632 ?AUTO_1633 ?AUTO_1629 ) ( VISIBLE ?AUTO_1633 ?AUTO_1629 ) ( not ( = ?AUTO_1629 ?AUTO_1633 ) ) ( not ( = ?AUTO_1631 ?AUTO_1633 ) ) ( CAN_TRAVERSE ?AUTO_1632 ?AUTO_1631 ?AUTO_1633 ) ( AT ?AUTO_1632 ?AUTO_1631 ) ( VISIBLE ?AUTO_1631 ?AUTO_1633 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1632 ?AUTO_1631 ?AUTO_1633 )
      ( GET_ROCK_DATA ?AUTO_1629 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1629 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1635 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1638 - LANDER
      ?AUTO_1640 - WAYPOINT
      ?AUTO_1636 - ROVER
      ?AUTO_1637 - STORE
      ?AUTO_1639 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1638 ?AUTO_1640 ) ( VISIBLE ?AUTO_1635 ?AUTO_1640 ) ( AVAILABLE ?AUTO_1636 ) ( CHANNEL_FREE ?AUTO_1638 ) ( not ( = ?AUTO_1635 ?AUTO_1640 ) ) ( AT_ROCK_SAMPLE ?AUTO_1635 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1636 ) ( STORE_OF ?AUTO_1637 ?AUTO_1636 ) ( CAN_TRAVERSE ?AUTO_1636 ?AUTO_1639 ?AUTO_1635 ) ( VISIBLE ?AUTO_1639 ?AUTO_1635 ) ( not ( = ?AUTO_1635 ?AUTO_1639 ) ) ( not ( = ?AUTO_1640 ?AUTO_1639 ) ) ( CAN_TRAVERSE ?AUTO_1636 ?AUTO_1640 ?AUTO_1639 ) ( AT ?AUTO_1636 ?AUTO_1640 ) ( VISIBLE ?AUTO_1640 ?AUTO_1639 ) ( AT_SOIL_SAMPLE ?AUTO_1640 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1636 ) ( EMPTY ?AUTO_1637 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1636 ?AUTO_1637 ?AUTO_1640 )
      ( GET_ROCK_DATA ?AUTO_1635 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1635 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4376 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4380 - LANDER
      ?AUTO_4379 - WAYPOINT
      ?AUTO_4378 - ROVER
      ?AUTO_4377 - STORE
      ?AUTO_4381 - WAYPOINT
      ?AUTO_4382 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4380 ?AUTO_4379 ) ( VISIBLE ?AUTO_4376 ?AUTO_4379 ) ( AVAILABLE ?AUTO_4378 ) ( CHANNEL_FREE ?AUTO_4380 ) ( not ( = ?AUTO_4376 ?AUTO_4379 ) ) ( AT_ROCK_SAMPLE ?AUTO_4376 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4378 ) ( STORE_OF ?AUTO_4377 ?AUTO_4378 ) ( EMPTY ?AUTO_4377 ) ( CAN_TRAVERSE ?AUTO_4378 ?AUTO_4381 ?AUTO_4376 ) ( VISIBLE ?AUTO_4381 ?AUTO_4376 ) ( not ( = ?AUTO_4376 ?AUTO_4381 ) ) ( not ( = ?AUTO_4379 ?AUTO_4381 ) ) ( CAN_TRAVERSE ?AUTO_4378 ?AUTO_4379 ?AUTO_4381 ) ( VISIBLE ?AUTO_4379 ?AUTO_4381 ) ( CAN_TRAVERSE ?AUTO_4378 ?AUTO_4382 ?AUTO_4379 ) ( AT ?AUTO_4378 ?AUTO_4382 ) ( VISIBLE ?AUTO_4382 ?AUTO_4379 ) ( not ( = ?AUTO_4376 ?AUTO_4382 ) ) ( not ( = ?AUTO_4379 ?AUTO_4382 ) ) ( not ( = ?AUTO_4381 ?AUTO_4382 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4378 ?AUTO_4382 ?AUTO_4379 )
      ( GET_ROCK_DATA ?AUTO_4376 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4376 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1663 - OBJECTIVE
      ?AUTO_1664 - MODE
    )
    :vars
    (
      ?AUTO_1666 - LANDER
      ?AUTO_1665 - WAYPOINT
      ?AUTO_1667 - WAYPOINT
      ?AUTO_1668 - ROVER
      ?AUTO_1669 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1666 ?AUTO_1665 ) ( VISIBLE ?AUTO_1667 ?AUTO_1665 ) ( AVAILABLE ?AUTO_1668 ) ( CHANNEL_FREE ?AUTO_1666 ) ( not ( = ?AUTO_1667 ?AUTO_1665 ) ) ( CALIBRATED ?AUTO_1669 ?AUTO_1668 ) ( ON_BOARD ?AUTO_1669 ?AUTO_1668 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1668 ) ( SUPPORTS ?AUTO_1669 ?AUTO_1664 ) ( VISIBLE_FROM ?AUTO_1663 ?AUTO_1667 ) ( CAN_TRAVERSE ?AUTO_1668 ?AUTO_1665 ?AUTO_1667 ) ( AT ?AUTO_1668 ?AUTO_1665 ) ( VISIBLE ?AUTO_1665 ?AUTO_1667 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1668 ?AUTO_1665 ?AUTO_1667 )
      ( GET_IMAGE_DATA ?AUTO_1663 ?AUTO_1664 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1663 ?AUTO_1664 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1683 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1686 - LANDER
      ?AUTO_1685 - WAYPOINT
      ?AUTO_1684 - ROVER
      ?AUTO_1687 - WAYPOINT
      ?AUTO_1688 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1686 ?AUTO_1685 ) ( HAVE_ROCK_ANALYSIS ?AUTO_1684 ?AUTO_1683 ) ( VISIBLE ?AUTO_1687 ?AUTO_1685 ) ( AVAILABLE ?AUTO_1684 ) ( CHANNEL_FREE ?AUTO_1686 ) ( not ( = ?AUTO_1683 ?AUTO_1687 ) ) ( not ( = ?AUTO_1683 ?AUTO_1685 ) ) ( not ( = ?AUTO_1687 ?AUTO_1685 ) ) ( CAN_TRAVERSE ?AUTO_1684 ?AUTO_1688 ?AUTO_1687 ) ( AT ?AUTO_1684 ?AUTO_1688 ) ( VISIBLE ?AUTO_1688 ?AUTO_1687 ) ( not ( = ?AUTO_1683 ?AUTO_1688 ) ) ( not ( = ?AUTO_1685 ?AUTO_1688 ) ) ( not ( = ?AUTO_1687 ?AUTO_1688 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1684 ?AUTO_1688 ?AUTO_1687 )
      ( GET_ROCK_DATA ?AUTO_1683 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1683 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1689 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1694 - LANDER
      ?AUTO_1691 - WAYPOINT
      ?AUTO_1690 - ROVER
      ?AUTO_1693 - WAYPOINT
      ?AUTO_1692 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1694 ?AUTO_1691 ) ( HAVE_ROCK_ANALYSIS ?AUTO_1690 ?AUTO_1689 ) ( VISIBLE ?AUTO_1693 ?AUTO_1691 ) ( AVAILABLE ?AUTO_1690 ) ( CHANNEL_FREE ?AUTO_1694 ) ( not ( = ?AUTO_1689 ?AUTO_1693 ) ) ( not ( = ?AUTO_1689 ?AUTO_1691 ) ) ( not ( = ?AUTO_1693 ?AUTO_1691 ) ) ( CAN_TRAVERSE ?AUTO_1690 ?AUTO_1692 ?AUTO_1693 ) ( VISIBLE ?AUTO_1692 ?AUTO_1693 ) ( not ( = ?AUTO_1689 ?AUTO_1692 ) ) ( not ( = ?AUTO_1691 ?AUTO_1692 ) ) ( not ( = ?AUTO_1693 ?AUTO_1692 ) ) ( CAN_TRAVERSE ?AUTO_1690 ?AUTO_1689 ?AUTO_1692 ) ( AT ?AUTO_1690 ?AUTO_1689 ) ( VISIBLE ?AUTO_1689 ?AUTO_1692 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1690 ?AUTO_1689 ?AUTO_1692 )
      ( GET_ROCK_DATA ?AUTO_1689 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1689 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1695 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1698 - LANDER
      ?AUTO_1697 - WAYPOINT
      ?AUTO_1699 - WAYPOINT
      ?AUTO_1696 - ROVER
      ?AUTO_1700 - WAYPOINT
      ?AUTO_1701 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1698 ?AUTO_1697 ) ( VISIBLE ?AUTO_1699 ?AUTO_1697 ) ( AVAILABLE ?AUTO_1696 ) ( CHANNEL_FREE ?AUTO_1698 ) ( not ( = ?AUTO_1695 ?AUTO_1699 ) ) ( not ( = ?AUTO_1695 ?AUTO_1697 ) ) ( not ( = ?AUTO_1699 ?AUTO_1697 ) ) ( CAN_TRAVERSE ?AUTO_1696 ?AUTO_1700 ?AUTO_1699 ) ( VISIBLE ?AUTO_1700 ?AUTO_1699 ) ( not ( = ?AUTO_1695 ?AUTO_1700 ) ) ( not ( = ?AUTO_1697 ?AUTO_1700 ) ) ( not ( = ?AUTO_1699 ?AUTO_1700 ) ) ( CAN_TRAVERSE ?AUTO_1696 ?AUTO_1695 ?AUTO_1700 ) ( AT ?AUTO_1696 ?AUTO_1695 ) ( VISIBLE ?AUTO_1695 ?AUTO_1700 ) ( AT_ROCK_SAMPLE ?AUTO_1695 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1696 ) ( STORE_OF ?AUTO_1701 ?AUTO_1696 ) ( EMPTY ?AUTO_1701 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1696 ?AUTO_1701 ?AUTO_1695 )
      ( GET_ROCK_DATA ?AUTO_1695 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1695 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1702 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1705 - LANDER
      ?AUTO_1708 - WAYPOINT
      ?AUTO_1704 - WAYPOINT
      ?AUTO_1707 - ROVER
      ?AUTO_1703 - WAYPOINT
      ?AUTO_1706 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1705 ?AUTO_1708 ) ( VISIBLE ?AUTO_1704 ?AUTO_1708 ) ( AVAILABLE ?AUTO_1707 ) ( CHANNEL_FREE ?AUTO_1705 ) ( not ( = ?AUTO_1702 ?AUTO_1704 ) ) ( not ( = ?AUTO_1702 ?AUTO_1708 ) ) ( not ( = ?AUTO_1704 ?AUTO_1708 ) ) ( CAN_TRAVERSE ?AUTO_1707 ?AUTO_1703 ?AUTO_1704 ) ( VISIBLE ?AUTO_1703 ?AUTO_1704 ) ( not ( = ?AUTO_1702 ?AUTO_1703 ) ) ( not ( = ?AUTO_1708 ?AUTO_1703 ) ) ( not ( = ?AUTO_1704 ?AUTO_1703 ) ) ( CAN_TRAVERSE ?AUTO_1707 ?AUTO_1702 ?AUTO_1703 ) ( VISIBLE ?AUTO_1702 ?AUTO_1703 ) ( AT_ROCK_SAMPLE ?AUTO_1702 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1707 ) ( STORE_OF ?AUTO_1706 ?AUTO_1707 ) ( EMPTY ?AUTO_1706 ) ( CAN_TRAVERSE ?AUTO_1707 ?AUTO_1703 ?AUTO_1702 ) ( AT ?AUTO_1707 ?AUTO_1703 ) ( VISIBLE ?AUTO_1703 ?AUTO_1702 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1707 ?AUTO_1703 ?AUTO_1702 )
      ( GET_ROCK_DATA ?AUTO_1702 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1702 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1709 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1715 - LANDER
      ?AUTO_1711 - WAYPOINT
      ?AUTO_1712 - WAYPOINT
      ?AUTO_1713 - ROVER
      ?AUTO_1710 - WAYPOINT
      ?AUTO_1714 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1715 ?AUTO_1711 ) ( VISIBLE ?AUTO_1712 ?AUTO_1711 ) ( AVAILABLE ?AUTO_1713 ) ( CHANNEL_FREE ?AUTO_1715 ) ( not ( = ?AUTO_1709 ?AUTO_1712 ) ) ( not ( = ?AUTO_1709 ?AUTO_1711 ) ) ( not ( = ?AUTO_1712 ?AUTO_1711 ) ) ( CAN_TRAVERSE ?AUTO_1713 ?AUTO_1710 ?AUTO_1712 ) ( VISIBLE ?AUTO_1710 ?AUTO_1712 ) ( not ( = ?AUTO_1709 ?AUTO_1710 ) ) ( not ( = ?AUTO_1711 ?AUTO_1710 ) ) ( not ( = ?AUTO_1712 ?AUTO_1710 ) ) ( CAN_TRAVERSE ?AUTO_1713 ?AUTO_1709 ?AUTO_1710 ) ( VISIBLE ?AUTO_1709 ?AUTO_1710 ) ( AT_ROCK_SAMPLE ?AUTO_1709 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1713 ) ( STORE_OF ?AUTO_1714 ?AUTO_1713 ) ( EMPTY ?AUTO_1714 ) ( CAN_TRAVERSE ?AUTO_1713 ?AUTO_1710 ?AUTO_1709 ) ( VISIBLE ?AUTO_1710 ?AUTO_1709 ) ( CAN_TRAVERSE ?AUTO_1713 ?AUTO_1712 ?AUTO_1710 ) ( AT ?AUTO_1713 ?AUTO_1712 ) ( VISIBLE ?AUTO_1712 ?AUTO_1710 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1713 ?AUTO_1712 ?AUTO_1710 )
      ( GET_ROCK_DATA ?AUTO_1709 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1709 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1718 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1724 - LANDER
      ?AUTO_1723 - WAYPOINT
      ?AUTO_1719 - WAYPOINT
      ?AUTO_1720 - ROVER
      ?AUTO_1721 - WAYPOINT
      ?AUTO_1722 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1724 ?AUTO_1723 ) ( VISIBLE ?AUTO_1719 ?AUTO_1723 ) ( AVAILABLE ?AUTO_1720 ) ( CHANNEL_FREE ?AUTO_1724 ) ( not ( = ?AUTO_1718 ?AUTO_1719 ) ) ( not ( = ?AUTO_1718 ?AUTO_1723 ) ) ( not ( = ?AUTO_1719 ?AUTO_1723 ) ) ( CAN_TRAVERSE ?AUTO_1720 ?AUTO_1721 ?AUTO_1719 ) ( VISIBLE ?AUTO_1721 ?AUTO_1719 ) ( not ( = ?AUTO_1718 ?AUTO_1721 ) ) ( not ( = ?AUTO_1723 ?AUTO_1721 ) ) ( not ( = ?AUTO_1719 ?AUTO_1721 ) ) ( CAN_TRAVERSE ?AUTO_1720 ?AUTO_1718 ?AUTO_1721 ) ( VISIBLE ?AUTO_1718 ?AUTO_1721 ) ( AT_ROCK_SAMPLE ?AUTO_1718 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1720 ) ( STORE_OF ?AUTO_1722 ?AUTO_1720 ) ( EMPTY ?AUTO_1722 ) ( CAN_TRAVERSE ?AUTO_1720 ?AUTO_1721 ?AUTO_1718 ) ( VISIBLE ?AUTO_1721 ?AUTO_1718 ) ( CAN_TRAVERSE ?AUTO_1720 ?AUTO_1719 ?AUTO_1721 ) ( VISIBLE ?AUTO_1719 ?AUTO_1721 ) ( CAN_TRAVERSE ?AUTO_1720 ?AUTO_1723 ?AUTO_1719 ) ( AT ?AUTO_1720 ?AUTO_1723 ) ( VISIBLE ?AUTO_1723 ?AUTO_1719 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1720 ?AUTO_1723 ?AUTO_1719 )
      ( GET_ROCK_DATA ?AUTO_1718 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1718 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1758 - OBJECTIVE
      ?AUTO_1759 - MODE
    )
    :vars
    (
      ?AUTO_1761 - LANDER
      ?AUTO_1760 - WAYPOINT
      ?AUTO_1764 - WAYPOINT
      ?AUTO_1762 - ROVER
      ?AUTO_1763 - CAMERA
      ?AUTO_1765 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1761 ?AUTO_1760 ) ( VISIBLE ?AUTO_1764 ?AUTO_1760 ) ( AVAILABLE ?AUTO_1762 ) ( CHANNEL_FREE ?AUTO_1761 ) ( not ( = ?AUTO_1764 ?AUTO_1760 ) ) ( ON_BOARD ?AUTO_1763 ?AUTO_1762 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1762 ) ( SUPPORTS ?AUTO_1763 ?AUTO_1759 ) ( VISIBLE_FROM ?AUTO_1758 ?AUTO_1764 ) ( CAN_TRAVERSE ?AUTO_1762 ?AUTO_1760 ?AUTO_1764 ) ( AT ?AUTO_1762 ?AUTO_1760 ) ( VISIBLE ?AUTO_1760 ?AUTO_1764 ) ( CALIBRATION_TARGET ?AUTO_1763 ?AUTO_1765 ) ( VISIBLE_FROM ?AUTO_1765 ?AUTO_1760 ) ( not ( = ?AUTO_1758 ?AUTO_1765 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1762 ?AUTO_1763 ?AUTO_1765 ?AUTO_1760 )
      ( GET_IMAGE_DATA ?AUTO_1758 ?AUTO_1759 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1758 ?AUTO_1759 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1766 - OBJECTIVE
      ?AUTO_1767 - MODE
    )
    :vars
    (
      ?AUTO_1769 - LANDER
      ?AUTO_1773 - WAYPOINT
      ?AUTO_1768 - WAYPOINT
      ?AUTO_1770 - ROVER
      ?AUTO_1772 - CAMERA
      ?AUTO_1771 - OBJECTIVE
      ?AUTO_1774 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1769 ?AUTO_1773 ) ( VISIBLE ?AUTO_1768 ?AUTO_1773 ) ( AVAILABLE ?AUTO_1770 ) ( CHANNEL_FREE ?AUTO_1769 ) ( not ( = ?AUTO_1768 ?AUTO_1773 ) ) ( ON_BOARD ?AUTO_1772 ?AUTO_1770 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1770 ) ( SUPPORTS ?AUTO_1772 ?AUTO_1767 ) ( VISIBLE_FROM ?AUTO_1766 ?AUTO_1768 ) ( CAN_TRAVERSE ?AUTO_1770 ?AUTO_1773 ?AUTO_1768 ) ( VISIBLE ?AUTO_1773 ?AUTO_1768 ) ( CALIBRATION_TARGET ?AUTO_1772 ?AUTO_1771 ) ( VISIBLE_FROM ?AUTO_1771 ?AUTO_1773 ) ( not ( = ?AUTO_1766 ?AUTO_1771 ) ) ( CAN_TRAVERSE ?AUTO_1770 ?AUTO_1774 ?AUTO_1773 ) ( AT ?AUTO_1770 ?AUTO_1774 ) ( VISIBLE ?AUTO_1774 ?AUTO_1773 ) ( not ( = ?AUTO_1773 ?AUTO_1774 ) ) ( not ( = ?AUTO_1768 ?AUTO_1774 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1770 ?AUTO_1774 ?AUTO_1773 )
      ( GET_IMAGE_DATA ?AUTO_1766 ?AUTO_1767 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1766 ?AUTO_1767 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1779 - OBJECTIVE
      ?AUTO_1780 - MODE
    )
    :vars
    (
      ?AUTO_1786 - LANDER
      ?AUTO_1787 - WAYPOINT
      ?AUTO_1783 - WAYPOINT
      ?AUTO_1785 - ROVER
      ?AUTO_1781 - CAMERA
      ?AUTO_1782 - OBJECTIVE
      ?AUTO_1784 - WAYPOINT
      ?AUTO_1788 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1786 ?AUTO_1787 ) ( VISIBLE ?AUTO_1783 ?AUTO_1787 ) ( AVAILABLE ?AUTO_1785 ) ( CHANNEL_FREE ?AUTO_1786 ) ( not ( = ?AUTO_1783 ?AUTO_1787 ) ) ( ON_BOARD ?AUTO_1781 ?AUTO_1785 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1785 ) ( SUPPORTS ?AUTO_1781 ?AUTO_1780 ) ( VISIBLE_FROM ?AUTO_1779 ?AUTO_1783 ) ( CAN_TRAVERSE ?AUTO_1785 ?AUTO_1787 ?AUTO_1783 ) ( VISIBLE ?AUTO_1787 ?AUTO_1783 ) ( CALIBRATION_TARGET ?AUTO_1781 ?AUTO_1782 ) ( VISIBLE_FROM ?AUTO_1782 ?AUTO_1787 ) ( not ( = ?AUTO_1779 ?AUTO_1782 ) ) ( CAN_TRAVERSE ?AUTO_1785 ?AUTO_1784 ?AUTO_1787 ) ( VISIBLE ?AUTO_1784 ?AUTO_1787 ) ( not ( = ?AUTO_1787 ?AUTO_1784 ) ) ( not ( = ?AUTO_1783 ?AUTO_1784 ) ) ( CAN_TRAVERSE ?AUTO_1785 ?AUTO_1788 ?AUTO_1784 ) ( AT ?AUTO_1785 ?AUTO_1788 ) ( VISIBLE ?AUTO_1788 ?AUTO_1784 ) ( not ( = ?AUTO_1787 ?AUTO_1788 ) ) ( not ( = ?AUTO_1783 ?AUTO_1788 ) ) ( not ( = ?AUTO_1784 ?AUTO_1788 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1785 ?AUTO_1788 ?AUTO_1784 )
      ( GET_IMAGE_DATA ?AUTO_1779 ?AUTO_1780 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1779 ?AUTO_1780 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1814 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1816 - LANDER
      ?AUTO_1819 - WAYPOINT
      ?AUTO_1815 - ROVER
      ?AUTO_1817 - STORE
      ?AUTO_1818 - WAYPOINT
      ?AUTO_1820 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1816 ?AUTO_1819 ) ( VISIBLE ?AUTO_1814 ?AUTO_1819 ) ( AVAILABLE ?AUTO_1815 ) ( CHANNEL_FREE ?AUTO_1816 ) ( not ( = ?AUTO_1814 ?AUTO_1819 ) ) ( AT_SOIL_SAMPLE ?AUTO_1814 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1815 ) ( STORE_OF ?AUTO_1817 ?AUTO_1815 ) ( EMPTY ?AUTO_1817 ) ( CAN_TRAVERSE ?AUTO_1815 ?AUTO_1818 ?AUTO_1814 ) ( VISIBLE ?AUTO_1818 ?AUTO_1814 ) ( not ( = ?AUTO_1814 ?AUTO_1818 ) ) ( not ( = ?AUTO_1819 ?AUTO_1818 ) ) ( CAN_TRAVERSE ?AUTO_1815 ?AUTO_1819 ?AUTO_1818 ) ( VISIBLE ?AUTO_1819 ?AUTO_1818 ) ( CAN_TRAVERSE ?AUTO_1815 ?AUTO_1820 ?AUTO_1819 ) ( AT ?AUTO_1815 ?AUTO_1820 ) ( VISIBLE ?AUTO_1820 ?AUTO_1819 ) ( not ( = ?AUTO_1814 ?AUTO_1820 ) ) ( not ( = ?AUTO_1819 ?AUTO_1820 ) ) ( not ( = ?AUTO_1818 ?AUTO_1820 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1815 ?AUTO_1820 ?AUTO_1819 )
      ( GET_SOIL_DATA ?AUTO_1814 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1814 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1823 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1825 - LANDER
      ?AUTO_1829 - WAYPOINT
      ?AUTO_1827 - ROVER
      ?AUTO_1824 - STORE
      ?AUTO_1828 - WAYPOINT
      ?AUTO_1826 - WAYPOINT
      ?AUTO_1830 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1825 ?AUTO_1829 ) ( VISIBLE ?AUTO_1823 ?AUTO_1829 ) ( AVAILABLE ?AUTO_1827 ) ( CHANNEL_FREE ?AUTO_1825 ) ( not ( = ?AUTO_1823 ?AUTO_1829 ) ) ( AT_SOIL_SAMPLE ?AUTO_1823 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1827 ) ( STORE_OF ?AUTO_1824 ?AUTO_1827 ) ( EMPTY ?AUTO_1824 ) ( CAN_TRAVERSE ?AUTO_1827 ?AUTO_1828 ?AUTO_1823 ) ( VISIBLE ?AUTO_1828 ?AUTO_1823 ) ( not ( = ?AUTO_1823 ?AUTO_1828 ) ) ( not ( = ?AUTO_1829 ?AUTO_1828 ) ) ( CAN_TRAVERSE ?AUTO_1827 ?AUTO_1829 ?AUTO_1828 ) ( VISIBLE ?AUTO_1829 ?AUTO_1828 ) ( CAN_TRAVERSE ?AUTO_1827 ?AUTO_1826 ?AUTO_1829 ) ( VISIBLE ?AUTO_1826 ?AUTO_1829 ) ( not ( = ?AUTO_1823 ?AUTO_1826 ) ) ( not ( = ?AUTO_1829 ?AUTO_1826 ) ) ( not ( = ?AUTO_1828 ?AUTO_1826 ) ) ( CAN_TRAVERSE ?AUTO_1827 ?AUTO_1830 ?AUTO_1826 ) ( AT ?AUTO_1827 ?AUTO_1830 ) ( VISIBLE ?AUTO_1830 ?AUTO_1826 ) ( not ( = ?AUTO_1823 ?AUTO_1830 ) ) ( not ( = ?AUTO_1829 ?AUTO_1830 ) ) ( not ( = ?AUTO_1828 ?AUTO_1830 ) ) ( not ( = ?AUTO_1826 ?AUTO_1830 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1827 ?AUTO_1830 ?AUTO_1826 )
      ( GET_SOIL_DATA ?AUTO_1823 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1823 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1853 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1856 - LANDER
      ?AUTO_1855 - WAYPOINT
      ?AUTO_1858 - ROVER
      ?AUTO_1854 - STORE
      ?AUTO_1857 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1856 ?AUTO_1855 ) ( VISIBLE ?AUTO_1853 ?AUTO_1855 ) ( AVAILABLE ?AUTO_1858 ) ( CHANNEL_FREE ?AUTO_1856 ) ( not ( = ?AUTO_1853 ?AUTO_1855 ) ) ( AT_SOIL_SAMPLE ?AUTO_1853 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1858 ) ( STORE_OF ?AUTO_1854 ?AUTO_1858 ) ( CAN_TRAVERSE ?AUTO_1858 ?AUTO_1857 ?AUTO_1853 ) ( AT ?AUTO_1858 ?AUTO_1857 ) ( VISIBLE ?AUTO_1857 ?AUTO_1853 ) ( not ( = ?AUTO_1853 ?AUTO_1857 ) ) ( not ( = ?AUTO_1855 ?AUTO_1857 ) ) ( AT_SOIL_SAMPLE ?AUTO_1857 ) ( EMPTY ?AUTO_1854 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1858 ?AUTO_1854 ?AUTO_1857 )
      ( GET_SOIL_DATA ?AUTO_1853 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1853 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1890 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1894 - LANDER
      ?AUTO_1895 - WAYPOINT
      ?AUTO_1893 - ROVER
      ?AUTO_1892 - STORE
      ?AUTO_1891 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1894 ?AUTO_1895 ) ( VISIBLE ?AUTO_1890 ?AUTO_1895 ) ( AVAILABLE ?AUTO_1893 ) ( CHANNEL_FREE ?AUTO_1894 ) ( not ( = ?AUTO_1890 ?AUTO_1895 ) ) ( AT_ROCK_SAMPLE ?AUTO_1890 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1893 ) ( STORE_OF ?AUTO_1892 ?AUTO_1893 ) ( CAN_TRAVERSE ?AUTO_1893 ?AUTO_1891 ?AUTO_1890 ) ( AT ?AUTO_1893 ?AUTO_1891 ) ( VISIBLE ?AUTO_1891 ?AUTO_1890 ) ( not ( = ?AUTO_1890 ?AUTO_1891 ) ) ( not ( = ?AUTO_1895 ?AUTO_1891 ) ) ( AT_SOIL_SAMPLE ?AUTO_1891 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1893 ) ( EMPTY ?AUTO_1892 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1893 ?AUTO_1892 ?AUTO_1891 )
      ( GET_ROCK_DATA ?AUTO_1890 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1890 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1905 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1909 - LANDER
      ?AUTO_1911 - WAYPOINT
      ?AUTO_1910 - ROVER
      ?AUTO_1908 - STORE
      ?AUTO_1907 - WAYPOINT
      ?AUTO_1906 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1909 ?AUTO_1911 ) ( VISIBLE ?AUTO_1905 ?AUTO_1911 ) ( AVAILABLE ?AUTO_1910 ) ( CHANNEL_FREE ?AUTO_1909 ) ( not ( = ?AUTO_1905 ?AUTO_1911 ) ) ( AT_ROCK_SAMPLE ?AUTO_1905 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1910 ) ( STORE_OF ?AUTO_1908 ?AUTO_1910 ) ( CAN_TRAVERSE ?AUTO_1910 ?AUTO_1907 ?AUTO_1905 ) ( VISIBLE ?AUTO_1907 ?AUTO_1905 ) ( not ( = ?AUTO_1905 ?AUTO_1907 ) ) ( not ( = ?AUTO_1911 ?AUTO_1907 ) ) ( CAN_TRAVERSE ?AUTO_1910 ?AUTO_1906 ?AUTO_1907 ) ( AT ?AUTO_1910 ?AUTO_1906 ) ( VISIBLE ?AUTO_1906 ?AUTO_1907 ) ( not ( = ?AUTO_1905 ?AUTO_1906 ) ) ( not ( = ?AUTO_1911 ?AUTO_1906 ) ) ( not ( = ?AUTO_1907 ?AUTO_1906 ) ) ( AT_SOIL_SAMPLE ?AUTO_1906 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1910 ) ( EMPTY ?AUTO_1908 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1910 ?AUTO_1908 ?AUTO_1906 )
      ( GET_ROCK_DATA ?AUTO_1905 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1905 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1922 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1926 - LANDER
      ?AUTO_1929 - WAYPOINT
      ?AUTO_1928 - ROVER
      ?AUTO_1927 - STORE
      ?AUTO_1923 - WAYPOINT
      ?AUTO_1924 - WAYPOINT
      ?AUTO_1925 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1926 ?AUTO_1929 ) ( VISIBLE ?AUTO_1922 ?AUTO_1929 ) ( AVAILABLE ?AUTO_1928 ) ( CHANNEL_FREE ?AUTO_1926 ) ( not ( = ?AUTO_1922 ?AUTO_1929 ) ) ( AT_ROCK_SAMPLE ?AUTO_1922 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1928 ) ( STORE_OF ?AUTO_1927 ?AUTO_1928 ) ( CAN_TRAVERSE ?AUTO_1928 ?AUTO_1923 ?AUTO_1922 ) ( VISIBLE ?AUTO_1923 ?AUTO_1922 ) ( not ( = ?AUTO_1922 ?AUTO_1923 ) ) ( not ( = ?AUTO_1929 ?AUTO_1923 ) ) ( CAN_TRAVERSE ?AUTO_1928 ?AUTO_1924 ?AUTO_1923 ) ( VISIBLE ?AUTO_1924 ?AUTO_1923 ) ( not ( = ?AUTO_1922 ?AUTO_1924 ) ) ( not ( = ?AUTO_1929 ?AUTO_1924 ) ) ( not ( = ?AUTO_1923 ?AUTO_1924 ) ) ( AT_SOIL_SAMPLE ?AUTO_1924 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1928 ) ( EMPTY ?AUTO_1927 ) ( CAN_TRAVERSE ?AUTO_1928 ?AUTO_1925 ?AUTO_1924 ) ( VISIBLE ?AUTO_1925 ?AUTO_1924 ) ( not ( = ?AUTO_1922 ?AUTO_1925 ) ) ( not ( = ?AUTO_1929 ?AUTO_1925 ) ) ( not ( = ?AUTO_1923 ?AUTO_1925 ) ) ( not ( = ?AUTO_1924 ?AUTO_1925 ) ) ( CAN_TRAVERSE ?AUTO_1928 ?AUTO_1929 ?AUTO_1925 ) ( AT ?AUTO_1928 ?AUTO_1929 ) ( VISIBLE ?AUTO_1929 ?AUTO_1925 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1928 ?AUTO_1929 ?AUTO_1925 )
      ( GET_ROCK_DATA ?AUTO_1922 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1922 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1934 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1937 - LANDER
      ?AUTO_1935 - WAYPOINT
      ?AUTO_1939 - ROVER
      ?AUTO_1936 - STORE
      ?AUTO_1938 - WAYPOINT
      ?AUTO_1940 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1937 ?AUTO_1935 ) ( VISIBLE ?AUTO_1934 ?AUTO_1935 ) ( AVAILABLE ?AUTO_1939 ) ( CHANNEL_FREE ?AUTO_1937 ) ( not ( = ?AUTO_1934 ?AUTO_1935 ) ) ( AT_ROCK_SAMPLE ?AUTO_1934 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1939 ) ( STORE_OF ?AUTO_1936 ?AUTO_1939 ) ( CAN_TRAVERSE ?AUTO_1939 ?AUTO_1938 ?AUTO_1934 ) ( VISIBLE ?AUTO_1938 ?AUTO_1934 ) ( not ( = ?AUTO_1934 ?AUTO_1938 ) ) ( not ( = ?AUTO_1935 ?AUTO_1938 ) ) ( CAN_TRAVERSE ?AUTO_1939 ?AUTO_1940 ?AUTO_1938 ) ( VISIBLE ?AUTO_1940 ?AUTO_1938 ) ( not ( = ?AUTO_1934 ?AUTO_1940 ) ) ( not ( = ?AUTO_1935 ?AUTO_1940 ) ) ( not ( = ?AUTO_1938 ?AUTO_1940 ) ) ( AT_SOIL_SAMPLE ?AUTO_1940 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1939 ) ( EMPTY ?AUTO_1936 ) ( CAN_TRAVERSE ?AUTO_1939 ?AUTO_1938 ?AUTO_1940 ) ( AT ?AUTO_1939 ?AUTO_1938 ) ( VISIBLE ?AUTO_1938 ?AUTO_1940 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1939 ?AUTO_1938 ?AUTO_1940 )
      ( GET_ROCK_DATA ?AUTO_1934 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1934 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1955 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1958 - LANDER
      ?AUTO_1957 - WAYPOINT
      ?AUTO_1959 - ROVER
      ?AUTO_1956 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1958 ?AUTO_1955 ) ( VISIBLE ?AUTO_1957 ?AUTO_1955 ) ( AVAILABLE ?AUTO_1959 ) ( CHANNEL_FREE ?AUTO_1958 ) ( not ( = ?AUTO_1955 ?AUTO_1957 ) ) ( CAN_TRAVERSE ?AUTO_1959 ?AUTO_1955 ?AUTO_1957 ) ( VISIBLE ?AUTO_1955 ?AUTO_1957 ) ( AT_SOIL_SAMPLE ?AUTO_1955 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1959 ) ( STORE_OF ?AUTO_1956 ?AUTO_1959 ) ( EMPTY ?AUTO_1956 ) ( CAN_TRAVERSE ?AUTO_1959 ?AUTO_1957 ?AUTO_1955 ) ( AT ?AUTO_1959 ?AUTO_1957 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1959 ?AUTO_1957 ?AUTO_1955 )
      ( GET_SOIL_DATA ?AUTO_1955 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1955 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1960 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1963 - LANDER
      ?AUTO_1964 - WAYPOINT
      ?AUTO_1962 - ROVER
      ?AUTO_1961 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1963 ?AUTO_1960 ) ( VISIBLE ?AUTO_1964 ?AUTO_1960 ) ( AVAILABLE ?AUTO_1962 ) ( CHANNEL_FREE ?AUTO_1963 ) ( not ( = ?AUTO_1960 ?AUTO_1964 ) ) ( CAN_TRAVERSE ?AUTO_1962 ?AUTO_1960 ?AUTO_1964 ) ( VISIBLE ?AUTO_1960 ?AUTO_1964 ) ( AT_SOIL_SAMPLE ?AUTO_1960 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1962 ) ( STORE_OF ?AUTO_1961 ?AUTO_1962 ) ( CAN_TRAVERSE ?AUTO_1962 ?AUTO_1964 ?AUTO_1960 ) ( AT ?AUTO_1962 ?AUTO_1964 ) ( FULL ?AUTO_1961 ) )
    :subtasks
    ( ( !DROP ?AUTO_1962 ?AUTO_1961 )
      ( GET_SOIL_DATA ?AUTO_1960 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1960 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1968 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1970 - LANDER
      ?AUTO_1971 - WAYPOINT
      ?AUTO_1972 - ROVER
      ?AUTO_1969 - STORE
      ?AUTO_1973 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1970 ?AUTO_1968 ) ( VISIBLE ?AUTO_1971 ?AUTO_1968 ) ( AVAILABLE ?AUTO_1972 ) ( CHANNEL_FREE ?AUTO_1970 ) ( not ( = ?AUTO_1968 ?AUTO_1971 ) ) ( CAN_TRAVERSE ?AUTO_1972 ?AUTO_1968 ?AUTO_1971 ) ( VISIBLE ?AUTO_1968 ?AUTO_1971 ) ( AT_SOIL_SAMPLE ?AUTO_1968 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1972 ) ( STORE_OF ?AUTO_1969 ?AUTO_1972 ) ( CAN_TRAVERSE ?AUTO_1972 ?AUTO_1971 ?AUTO_1968 ) ( FULL ?AUTO_1969 ) ( CAN_TRAVERSE ?AUTO_1972 ?AUTO_1973 ?AUTO_1971 ) ( AT ?AUTO_1972 ?AUTO_1973 ) ( VISIBLE ?AUTO_1973 ?AUTO_1971 ) ( not ( = ?AUTO_1968 ?AUTO_1973 ) ) ( not ( = ?AUTO_1971 ?AUTO_1973 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1972 ?AUTO_1973 ?AUTO_1971 )
      ( GET_SOIL_DATA ?AUTO_1968 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1968 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1975 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1980 - LANDER
      ?AUTO_1976 - WAYPOINT
      ?AUTO_1978 - ROVER
      ?AUTO_1977 - STORE
      ?AUTO_1979 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1980 ?AUTO_1975 ) ( VISIBLE ?AUTO_1976 ?AUTO_1975 ) ( AVAILABLE ?AUTO_1978 ) ( CHANNEL_FREE ?AUTO_1980 ) ( not ( = ?AUTO_1975 ?AUTO_1976 ) ) ( CAN_TRAVERSE ?AUTO_1978 ?AUTO_1975 ?AUTO_1976 ) ( VISIBLE ?AUTO_1975 ?AUTO_1976 ) ( AT_SOIL_SAMPLE ?AUTO_1975 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1978 ) ( STORE_OF ?AUTO_1977 ?AUTO_1978 ) ( CAN_TRAVERSE ?AUTO_1978 ?AUTO_1976 ?AUTO_1975 ) ( CAN_TRAVERSE ?AUTO_1978 ?AUTO_1979 ?AUTO_1976 ) ( AT ?AUTO_1978 ?AUTO_1979 ) ( VISIBLE ?AUTO_1979 ?AUTO_1976 ) ( not ( = ?AUTO_1975 ?AUTO_1979 ) ) ( not ( = ?AUTO_1976 ?AUTO_1979 ) ) ( AT_SOIL_SAMPLE ?AUTO_1979 ) ( EMPTY ?AUTO_1977 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1978 ?AUTO_1977 ?AUTO_1979 )
      ( GET_SOIL_DATA ?AUTO_1975 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1975 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1982 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1983 - LANDER
      ?AUTO_1985 - WAYPOINT
      ?AUTO_1987 - ROVER
      ?AUTO_1986 - STORE
      ?AUTO_1984 - WAYPOINT
      ?AUTO_1988 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1983 ?AUTO_1982 ) ( VISIBLE ?AUTO_1985 ?AUTO_1982 ) ( AVAILABLE ?AUTO_1987 ) ( CHANNEL_FREE ?AUTO_1983 ) ( not ( = ?AUTO_1982 ?AUTO_1985 ) ) ( CAN_TRAVERSE ?AUTO_1987 ?AUTO_1982 ?AUTO_1985 ) ( VISIBLE ?AUTO_1982 ?AUTO_1985 ) ( AT_SOIL_SAMPLE ?AUTO_1982 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1987 ) ( STORE_OF ?AUTO_1986 ?AUTO_1987 ) ( CAN_TRAVERSE ?AUTO_1987 ?AUTO_1985 ?AUTO_1982 ) ( FULL ?AUTO_1986 ) ( CAN_TRAVERSE ?AUTO_1987 ?AUTO_1984 ?AUTO_1985 ) ( VISIBLE ?AUTO_1984 ?AUTO_1985 ) ( not ( = ?AUTO_1982 ?AUTO_1984 ) ) ( not ( = ?AUTO_1985 ?AUTO_1984 ) ) ( CAN_TRAVERSE ?AUTO_1987 ?AUTO_1988 ?AUTO_1984 ) ( AT ?AUTO_1987 ?AUTO_1988 ) ( VISIBLE ?AUTO_1988 ?AUTO_1984 ) ( not ( = ?AUTO_1982 ?AUTO_1988 ) ) ( not ( = ?AUTO_1985 ?AUTO_1988 ) ) ( not ( = ?AUTO_1984 ?AUTO_1988 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1987 ?AUTO_1988 ?AUTO_1984 )
      ( GET_SOIL_DATA ?AUTO_1982 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1982 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1990 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1991 - LANDER
      ?AUTO_1995 - WAYPOINT
      ?AUTO_1992 - ROVER
      ?AUTO_1993 - STORE
      ?AUTO_1994 - WAYPOINT
      ?AUTO_1996 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1991 ?AUTO_1990 ) ( VISIBLE ?AUTO_1995 ?AUTO_1990 ) ( AVAILABLE ?AUTO_1992 ) ( CHANNEL_FREE ?AUTO_1991 ) ( not ( = ?AUTO_1990 ?AUTO_1995 ) ) ( CAN_TRAVERSE ?AUTO_1992 ?AUTO_1990 ?AUTO_1995 ) ( VISIBLE ?AUTO_1990 ?AUTO_1995 ) ( AT_SOIL_SAMPLE ?AUTO_1990 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1992 ) ( STORE_OF ?AUTO_1993 ?AUTO_1992 ) ( CAN_TRAVERSE ?AUTO_1992 ?AUTO_1995 ?AUTO_1990 ) ( CAN_TRAVERSE ?AUTO_1992 ?AUTO_1994 ?AUTO_1995 ) ( VISIBLE ?AUTO_1994 ?AUTO_1995 ) ( not ( = ?AUTO_1990 ?AUTO_1994 ) ) ( not ( = ?AUTO_1995 ?AUTO_1994 ) ) ( CAN_TRAVERSE ?AUTO_1992 ?AUTO_1996 ?AUTO_1994 ) ( AT ?AUTO_1992 ?AUTO_1996 ) ( VISIBLE ?AUTO_1996 ?AUTO_1994 ) ( not ( = ?AUTO_1990 ?AUTO_1996 ) ) ( not ( = ?AUTO_1995 ?AUTO_1996 ) ) ( not ( = ?AUTO_1994 ?AUTO_1996 ) ) ( AT_SOIL_SAMPLE ?AUTO_1996 ) ( EMPTY ?AUTO_1993 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1992 ?AUTO_1993 ?AUTO_1996 )
      ( GET_SOIL_DATA ?AUTO_1990 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1990 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2005 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2010 - LANDER
      ?AUTO_2006 - WAYPOINT
      ?AUTO_2008 - ROVER
      ?AUTO_2011 - STORE
      ?AUTO_2009 - WAYPOINT
      ?AUTO_2007 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2010 ?AUTO_2005 ) ( VISIBLE ?AUTO_2006 ?AUTO_2005 ) ( AVAILABLE ?AUTO_2008 ) ( CHANNEL_FREE ?AUTO_2010 ) ( not ( = ?AUTO_2005 ?AUTO_2006 ) ) ( CAN_TRAVERSE ?AUTO_2008 ?AUTO_2005 ?AUTO_2006 ) ( VISIBLE ?AUTO_2005 ?AUTO_2006 ) ( AT_SOIL_SAMPLE ?AUTO_2005 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2008 ) ( STORE_OF ?AUTO_2011 ?AUTO_2008 ) ( CAN_TRAVERSE ?AUTO_2008 ?AUTO_2006 ?AUTO_2005 ) ( CAN_TRAVERSE ?AUTO_2008 ?AUTO_2009 ?AUTO_2006 ) ( VISIBLE ?AUTO_2009 ?AUTO_2006 ) ( not ( = ?AUTO_2005 ?AUTO_2009 ) ) ( not ( = ?AUTO_2006 ?AUTO_2009 ) ) ( CAN_TRAVERSE ?AUTO_2008 ?AUTO_2007 ?AUTO_2009 ) ( VISIBLE ?AUTO_2007 ?AUTO_2009 ) ( not ( = ?AUTO_2005 ?AUTO_2007 ) ) ( not ( = ?AUTO_2006 ?AUTO_2007 ) ) ( not ( = ?AUTO_2009 ?AUTO_2007 ) ) ( AT_SOIL_SAMPLE ?AUTO_2007 ) ( EMPTY ?AUTO_2011 ) ( CAN_TRAVERSE ?AUTO_2008 ?AUTO_2009 ?AUTO_2007 ) ( AT ?AUTO_2008 ?AUTO_2009 ) ( VISIBLE ?AUTO_2009 ?AUTO_2007 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2008 ?AUTO_2009 ?AUTO_2007 )
      ( GET_SOIL_DATA ?AUTO_2005 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2005 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2048 - OBJECTIVE
      ?AUTO_2049 - MODE
    )
    :vars
    (
      ?AUTO_2053 - LANDER
      ?AUTO_2052 - WAYPOINT
      ?AUTO_2051 - WAYPOINT
      ?AUTO_2054 - ROVER
      ?AUTO_2055 - CAMERA
      ?AUTO_2050 - WAYPOINT
      ?AUTO_2056 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2053 ?AUTO_2052 ) ( VISIBLE ?AUTO_2051 ?AUTO_2052 ) ( AVAILABLE ?AUTO_2054 ) ( CHANNEL_FREE ?AUTO_2053 ) ( not ( = ?AUTO_2051 ?AUTO_2052 ) ) ( CALIBRATED ?AUTO_2055 ?AUTO_2054 ) ( ON_BOARD ?AUTO_2055 ?AUTO_2054 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2054 ) ( SUPPORTS ?AUTO_2055 ?AUTO_2049 ) ( VISIBLE_FROM ?AUTO_2048 ?AUTO_2051 ) ( CAN_TRAVERSE ?AUTO_2054 ?AUTO_2050 ?AUTO_2051 ) ( VISIBLE ?AUTO_2050 ?AUTO_2051 ) ( not ( = ?AUTO_2052 ?AUTO_2050 ) ) ( not ( = ?AUTO_2051 ?AUTO_2050 ) ) ( CAN_TRAVERSE ?AUTO_2054 ?AUTO_2056 ?AUTO_2050 ) ( AT ?AUTO_2054 ?AUTO_2056 ) ( VISIBLE ?AUTO_2056 ?AUTO_2050 ) ( not ( = ?AUTO_2052 ?AUTO_2056 ) ) ( not ( = ?AUTO_2051 ?AUTO_2056 ) ) ( not ( = ?AUTO_2050 ?AUTO_2056 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2054 ?AUTO_2056 ?AUTO_2050 )
      ( GET_IMAGE_DATA ?AUTO_2048 ?AUTO_2049 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2048 ?AUTO_2049 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2061 - OBJECTIVE
      ?AUTO_2062 - MODE
    )
    :vars
    (
      ?AUTO_2065 - LANDER
      ?AUTO_2067 - WAYPOINT
      ?AUTO_2064 - WAYPOINT
      ?AUTO_2063 - ROVER
      ?AUTO_2066 - CAMERA
      ?AUTO_2068 - WAYPOINT
      ?AUTO_2069 - WAYPOINT
      ?AUTO_2070 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2065 ?AUTO_2067 ) ( VISIBLE ?AUTO_2064 ?AUTO_2067 ) ( AVAILABLE ?AUTO_2063 ) ( CHANNEL_FREE ?AUTO_2065 ) ( not ( = ?AUTO_2064 ?AUTO_2067 ) ) ( ON_BOARD ?AUTO_2066 ?AUTO_2063 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2063 ) ( SUPPORTS ?AUTO_2066 ?AUTO_2062 ) ( VISIBLE_FROM ?AUTO_2061 ?AUTO_2064 ) ( CAN_TRAVERSE ?AUTO_2063 ?AUTO_2068 ?AUTO_2064 ) ( VISIBLE ?AUTO_2068 ?AUTO_2064 ) ( not ( = ?AUTO_2067 ?AUTO_2068 ) ) ( not ( = ?AUTO_2064 ?AUTO_2068 ) ) ( CAN_TRAVERSE ?AUTO_2063 ?AUTO_2069 ?AUTO_2068 ) ( AT ?AUTO_2063 ?AUTO_2069 ) ( VISIBLE ?AUTO_2069 ?AUTO_2068 ) ( not ( = ?AUTO_2067 ?AUTO_2069 ) ) ( not ( = ?AUTO_2064 ?AUTO_2069 ) ) ( not ( = ?AUTO_2068 ?AUTO_2069 ) ) ( CALIBRATION_TARGET ?AUTO_2066 ?AUTO_2070 ) ( VISIBLE_FROM ?AUTO_2070 ?AUTO_2069 ) ( not ( = ?AUTO_2061 ?AUTO_2070 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2063 ?AUTO_2066 ?AUTO_2070 ?AUTO_2069 )
      ( GET_IMAGE_DATA ?AUTO_2061 ?AUTO_2062 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2061 ?AUTO_2062 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2103 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2107 - LANDER
      ?AUTO_2106 - WAYPOINT
      ?AUTO_2104 - ROVER
      ?AUTO_2105 - STORE
      ?AUTO_2109 - WAYPOINT
      ?AUTO_2108 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2107 ?AUTO_2106 ) ( VISIBLE ?AUTO_2103 ?AUTO_2106 ) ( AVAILABLE ?AUTO_2104 ) ( CHANNEL_FREE ?AUTO_2107 ) ( not ( = ?AUTO_2103 ?AUTO_2106 ) ) ( AT_SOIL_SAMPLE ?AUTO_2103 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2104 ) ( STORE_OF ?AUTO_2105 ?AUTO_2104 ) ( CAN_TRAVERSE ?AUTO_2104 ?AUTO_2109 ?AUTO_2103 ) ( VISIBLE ?AUTO_2109 ?AUTO_2103 ) ( not ( = ?AUTO_2103 ?AUTO_2109 ) ) ( not ( = ?AUTO_2106 ?AUTO_2109 ) ) ( CAN_TRAVERSE ?AUTO_2104 ?AUTO_2108 ?AUTO_2109 ) ( AT ?AUTO_2104 ?AUTO_2108 ) ( VISIBLE ?AUTO_2108 ?AUTO_2109 ) ( not ( = ?AUTO_2103 ?AUTO_2108 ) ) ( not ( = ?AUTO_2106 ?AUTO_2108 ) ) ( not ( = ?AUTO_2109 ?AUTO_2108 ) ) ( AT_ROCK_SAMPLE ?AUTO_2108 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2104 ) ( EMPTY ?AUTO_2105 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2104 ?AUTO_2105 ?AUTO_2108 )
      ( GET_SOIL_DATA ?AUTO_2103 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2103 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2203 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2205 - LANDER
      ?AUTO_2204 - WAYPOINT
      ?AUTO_2207 - WAYPOINT
      ?AUTO_2206 - ROVER
      ?AUTO_2208 - STORE
      ?AUTO_2209 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2205 ?AUTO_2204 ) ( VISIBLE ?AUTO_2207 ?AUTO_2204 ) ( AVAILABLE ?AUTO_2206 ) ( CHANNEL_FREE ?AUTO_2205 ) ( not ( = ?AUTO_2203 ?AUTO_2207 ) ) ( not ( = ?AUTO_2203 ?AUTO_2204 ) ) ( not ( = ?AUTO_2207 ?AUTO_2204 ) ) ( CAN_TRAVERSE ?AUTO_2206 ?AUTO_2203 ?AUTO_2207 ) ( VISIBLE ?AUTO_2203 ?AUTO_2207 ) ( AT_SOIL_SAMPLE ?AUTO_2203 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2206 ) ( STORE_OF ?AUTO_2208 ?AUTO_2206 ) ( EMPTY ?AUTO_2208 ) ( CAN_TRAVERSE ?AUTO_2206 ?AUTO_2209 ?AUTO_2203 ) ( AT ?AUTO_2206 ?AUTO_2209 ) ( VISIBLE ?AUTO_2209 ?AUTO_2203 ) ( not ( = ?AUTO_2203 ?AUTO_2209 ) ) ( not ( = ?AUTO_2204 ?AUTO_2209 ) ) ( not ( = ?AUTO_2207 ?AUTO_2209 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2206 ?AUTO_2209 ?AUTO_2203 )
      ( GET_SOIL_DATA ?AUTO_2203 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2203 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2210 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2212 - LANDER
      ?AUTO_2211 - WAYPOINT
      ?AUTO_2215 - WAYPOINT
      ?AUTO_2213 - ROVER
      ?AUTO_2216 - STORE
      ?AUTO_2214 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2212 ?AUTO_2211 ) ( VISIBLE ?AUTO_2215 ?AUTO_2211 ) ( AVAILABLE ?AUTO_2213 ) ( CHANNEL_FREE ?AUTO_2212 ) ( not ( = ?AUTO_2210 ?AUTO_2215 ) ) ( not ( = ?AUTO_2210 ?AUTO_2211 ) ) ( not ( = ?AUTO_2215 ?AUTO_2211 ) ) ( CAN_TRAVERSE ?AUTO_2213 ?AUTO_2210 ?AUTO_2215 ) ( VISIBLE ?AUTO_2210 ?AUTO_2215 ) ( AT_SOIL_SAMPLE ?AUTO_2210 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2213 ) ( STORE_OF ?AUTO_2216 ?AUTO_2213 ) ( CAN_TRAVERSE ?AUTO_2213 ?AUTO_2214 ?AUTO_2210 ) ( AT ?AUTO_2213 ?AUTO_2214 ) ( VISIBLE ?AUTO_2214 ?AUTO_2210 ) ( not ( = ?AUTO_2210 ?AUTO_2214 ) ) ( not ( = ?AUTO_2211 ?AUTO_2214 ) ) ( not ( = ?AUTO_2215 ?AUTO_2214 ) ) ( FULL ?AUTO_2216 ) )
    :subtasks
    ( ( !DROP ?AUTO_2213 ?AUTO_2216 )
      ( GET_SOIL_DATA ?AUTO_2210 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2210 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2221 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2227 - LANDER
      ?AUTO_2222 - WAYPOINT
      ?AUTO_2226 - WAYPOINT
      ?AUTO_2224 - ROVER
      ?AUTO_2223 - STORE
      ?AUTO_2225 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2227 ?AUTO_2222 ) ( VISIBLE ?AUTO_2226 ?AUTO_2222 ) ( AVAILABLE ?AUTO_2224 ) ( CHANNEL_FREE ?AUTO_2227 ) ( not ( = ?AUTO_2221 ?AUTO_2226 ) ) ( not ( = ?AUTO_2221 ?AUTO_2222 ) ) ( not ( = ?AUTO_2226 ?AUTO_2222 ) ) ( CAN_TRAVERSE ?AUTO_2224 ?AUTO_2221 ?AUTO_2226 ) ( VISIBLE ?AUTO_2221 ?AUTO_2226 ) ( AT_SOIL_SAMPLE ?AUTO_2221 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2224 ) ( STORE_OF ?AUTO_2223 ?AUTO_2224 ) ( EMPTY ?AUTO_2223 ) ( CAN_TRAVERSE ?AUTO_2224 ?AUTO_2225 ?AUTO_2221 ) ( VISIBLE ?AUTO_2225 ?AUTO_2221 ) ( not ( = ?AUTO_2221 ?AUTO_2225 ) ) ( not ( = ?AUTO_2222 ?AUTO_2225 ) ) ( not ( = ?AUTO_2226 ?AUTO_2225 ) ) ( CAN_TRAVERSE ?AUTO_2224 ?AUTO_2222 ?AUTO_2225 ) ( AT ?AUTO_2224 ?AUTO_2222 ) ( VISIBLE ?AUTO_2222 ?AUTO_2225 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2224 ?AUTO_2222 ?AUTO_2225 )
      ( GET_SOIL_DATA ?AUTO_2221 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2221 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2228 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2233 - LANDER
      ?AUTO_2229 - WAYPOINT
      ?AUTO_2230 - WAYPOINT
      ?AUTO_2234 - ROVER
      ?AUTO_2232 - STORE
      ?AUTO_2231 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2233 ?AUTO_2229 ) ( VISIBLE ?AUTO_2230 ?AUTO_2229 ) ( AVAILABLE ?AUTO_2234 ) ( CHANNEL_FREE ?AUTO_2233 ) ( not ( = ?AUTO_2228 ?AUTO_2230 ) ) ( not ( = ?AUTO_2228 ?AUTO_2229 ) ) ( not ( = ?AUTO_2230 ?AUTO_2229 ) ) ( CAN_TRAVERSE ?AUTO_2234 ?AUTO_2228 ?AUTO_2230 ) ( VISIBLE ?AUTO_2228 ?AUTO_2230 ) ( AT_SOIL_SAMPLE ?AUTO_2228 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2234 ) ( STORE_OF ?AUTO_2232 ?AUTO_2234 ) ( CAN_TRAVERSE ?AUTO_2234 ?AUTO_2231 ?AUTO_2228 ) ( VISIBLE ?AUTO_2231 ?AUTO_2228 ) ( not ( = ?AUTO_2228 ?AUTO_2231 ) ) ( not ( = ?AUTO_2229 ?AUTO_2231 ) ) ( not ( = ?AUTO_2230 ?AUTO_2231 ) ) ( CAN_TRAVERSE ?AUTO_2234 ?AUTO_2229 ?AUTO_2231 ) ( AT ?AUTO_2234 ?AUTO_2229 ) ( VISIBLE ?AUTO_2229 ?AUTO_2231 ) ( FULL ?AUTO_2232 ) )
    :subtasks
    ( ( !DROP ?AUTO_2234 ?AUTO_2232 )
      ( GET_SOIL_DATA ?AUTO_2228 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2228 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2256 - OBJECTIVE
      ?AUTO_2257 - MODE
    )
    :vars
    (
      ?AUTO_2261 - LANDER
      ?AUTO_2259 - WAYPOINT
      ?AUTO_2262 - WAYPOINT
      ?AUTO_2258 - ROVER
      ?AUTO_2260 - CAMERA
      ?AUTO_2263 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2261 ?AUTO_2259 ) ( VISIBLE ?AUTO_2262 ?AUTO_2259 ) ( AVAILABLE ?AUTO_2258 ) ( CHANNEL_FREE ?AUTO_2261 ) ( not ( = ?AUTO_2262 ?AUTO_2259 ) ) ( CAN_TRAVERSE ?AUTO_2258 ?AUTO_2259 ?AUTO_2262 ) ( AT ?AUTO_2258 ?AUTO_2259 ) ( VISIBLE ?AUTO_2259 ?AUTO_2262 ) ( ON_BOARD ?AUTO_2260 ?AUTO_2258 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2258 ) ( SUPPORTS ?AUTO_2260 ?AUTO_2257 ) ( VISIBLE_FROM ?AUTO_2256 ?AUTO_2259 ) ( CALIBRATION_TARGET ?AUTO_2260 ?AUTO_2263 ) ( VISIBLE_FROM ?AUTO_2263 ?AUTO_2259 ) ( not ( = ?AUTO_2256 ?AUTO_2263 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2258 ?AUTO_2260 ?AUTO_2263 ?AUTO_2259 )
      ( GET_IMAGE_DATA ?AUTO_2256 ?AUTO_2257 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2256 ?AUTO_2257 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2315 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2319 - LANDER
      ?AUTO_2317 - WAYPOINT
      ?AUTO_2320 - WAYPOINT
      ?AUTO_2318 - ROVER
      ?AUTO_2316 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2319 ?AUTO_2317 ) ( VISIBLE ?AUTO_2320 ?AUTO_2317 ) ( AVAILABLE ?AUTO_2318 ) ( CHANNEL_FREE ?AUTO_2319 ) ( not ( = ?AUTO_2315 ?AUTO_2320 ) ) ( not ( = ?AUTO_2315 ?AUTO_2317 ) ) ( not ( = ?AUTO_2320 ?AUTO_2317 ) ) ( CAN_TRAVERSE ?AUTO_2318 ?AUTO_2315 ?AUTO_2320 ) ( VISIBLE ?AUTO_2315 ?AUTO_2320 ) ( AT_ROCK_SAMPLE ?AUTO_2315 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2318 ) ( STORE_OF ?AUTO_2316 ?AUTO_2318 ) ( EMPTY ?AUTO_2316 ) ( CAN_TRAVERSE ?AUTO_2318 ?AUTO_2320 ?AUTO_2315 ) ( VISIBLE ?AUTO_2320 ?AUTO_2315 ) ( CAN_TRAVERSE ?AUTO_2318 ?AUTO_2317 ?AUTO_2320 ) ( AT ?AUTO_2318 ?AUTO_2317 ) ( VISIBLE ?AUTO_2317 ?AUTO_2320 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2318 ?AUTO_2317 ?AUTO_2320 )
      ( GET_ROCK_DATA ?AUTO_2315 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2315 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2352 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2358 - LANDER
      ?AUTO_2357 - WAYPOINT
      ?AUTO_2355 - ROVER
      ?AUTO_2354 - STORE
      ?AUTO_2356 - WAYPOINT
      ?AUTO_2353 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2358 ?AUTO_2357 ) ( VISIBLE ?AUTO_2352 ?AUTO_2357 ) ( AVAILABLE ?AUTO_2355 ) ( CHANNEL_FREE ?AUTO_2358 ) ( not ( = ?AUTO_2352 ?AUTO_2357 ) ) ( AT_ROCK_SAMPLE ?AUTO_2352 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2355 ) ( STORE_OF ?AUTO_2354 ?AUTO_2355 ) ( CAN_TRAVERSE ?AUTO_2355 ?AUTO_2357 ?AUTO_2352 ) ( VISIBLE ?AUTO_2357 ?AUTO_2352 ) ( CAN_TRAVERSE ?AUTO_2355 ?AUTO_2356 ?AUTO_2357 ) ( VISIBLE ?AUTO_2356 ?AUTO_2357 ) ( not ( = ?AUTO_2352 ?AUTO_2356 ) ) ( not ( = ?AUTO_2357 ?AUTO_2356 ) ) ( CAN_TRAVERSE ?AUTO_2355 ?AUTO_2353 ?AUTO_2356 ) ( AT ?AUTO_2355 ?AUTO_2353 ) ( VISIBLE ?AUTO_2353 ?AUTO_2356 ) ( not ( = ?AUTO_2352 ?AUTO_2353 ) ) ( not ( = ?AUTO_2357 ?AUTO_2353 ) ) ( not ( = ?AUTO_2356 ?AUTO_2353 ) ) ( FULL ?AUTO_2354 ) )
    :subtasks
    ( ( !DROP ?AUTO_2355 ?AUTO_2354 )
      ( GET_ROCK_DATA ?AUTO_2352 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2352 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2361 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2366 - LANDER
      ?AUTO_2364 - WAYPOINT
      ?AUTO_2365 - ROVER
      ?AUTO_2362 - STORE
      ?AUTO_2363 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2366 ?AUTO_2364 ) ( VISIBLE ?AUTO_2361 ?AUTO_2364 ) ( AVAILABLE ?AUTO_2365 ) ( CHANNEL_FREE ?AUTO_2366 ) ( not ( = ?AUTO_2361 ?AUTO_2364 ) ) ( AT_ROCK_SAMPLE ?AUTO_2361 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2365 ) ( STORE_OF ?AUTO_2362 ?AUTO_2365 ) ( CAN_TRAVERSE ?AUTO_2365 ?AUTO_2364 ?AUTO_2361 ) ( VISIBLE ?AUTO_2364 ?AUTO_2361 ) ( CAN_TRAVERSE ?AUTO_2365 ?AUTO_2363 ?AUTO_2364 ) ( AT ?AUTO_2365 ?AUTO_2363 ) ( VISIBLE ?AUTO_2363 ?AUTO_2364 ) ( not ( = ?AUTO_2361 ?AUTO_2363 ) ) ( not ( = ?AUTO_2364 ?AUTO_2363 ) ) ( FULL ?AUTO_2362 ) )
    :subtasks
    ( ( !DROP ?AUTO_2365 ?AUTO_2362 )
      ( GET_ROCK_DATA ?AUTO_2361 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2361 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2446 - OBJECTIVE
      ?AUTO_2447 - MODE
    )
    :vars
    (
      ?AUTO_2451 - LANDER
      ?AUTO_2449 - WAYPOINT
      ?AUTO_2452 - WAYPOINT
      ?AUTO_2448 - ROVER
      ?AUTO_2450 - CAMERA
      ?AUTO_2453 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2451 ?AUTO_2449 ) ( VISIBLE ?AUTO_2452 ?AUTO_2449 ) ( AVAILABLE ?AUTO_2448 ) ( CHANNEL_FREE ?AUTO_2451 ) ( not ( = ?AUTO_2452 ?AUTO_2449 ) ) ( CAN_TRAVERSE ?AUTO_2448 ?AUTO_2449 ?AUTO_2452 ) ( VISIBLE ?AUTO_2449 ?AUTO_2452 ) ( CALIBRATED ?AUTO_2450 ?AUTO_2448 ) ( ON_BOARD ?AUTO_2450 ?AUTO_2448 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2448 ) ( SUPPORTS ?AUTO_2450 ?AUTO_2447 ) ( VISIBLE_FROM ?AUTO_2446 ?AUTO_2449 ) ( CAN_TRAVERSE ?AUTO_2448 ?AUTO_2453 ?AUTO_2449 ) ( AT ?AUTO_2448 ?AUTO_2453 ) ( VISIBLE ?AUTO_2453 ?AUTO_2449 ) ( not ( = ?AUTO_2449 ?AUTO_2453 ) ) ( not ( = ?AUTO_2452 ?AUTO_2453 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2448 ?AUTO_2453 ?AUTO_2449 )
      ( GET_IMAGE_DATA ?AUTO_2446 ?AUTO_2447 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2446 ?AUTO_2447 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2454 - OBJECTIVE
      ?AUTO_2455 - MODE
    )
    :vars
    (
      ?AUTO_2457 - LANDER
      ?AUTO_2456 - WAYPOINT
      ?AUTO_2461 - WAYPOINT
      ?AUTO_2459 - ROVER
      ?AUTO_2458 - CAMERA
      ?AUTO_2460 - WAYPOINT
      ?AUTO_2462 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2457 ?AUTO_2456 ) ( VISIBLE ?AUTO_2461 ?AUTO_2456 ) ( AVAILABLE ?AUTO_2459 ) ( CHANNEL_FREE ?AUTO_2457 ) ( not ( = ?AUTO_2461 ?AUTO_2456 ) ) ( CAN_TRAVERSE ?AUTO_2459 ?AUTO_2456 ?AUTO_2461 ) ( VISIBLE ?AUTO_2456 ?AUTO_2461 ) ( CALIBRATED ?AUTO_2458 ?AUTO_2459 ) ( ON_BOARD ?AUTO_2458 ?AUTO_2459 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2459 ) ( SUPPORTS ?AUTO_2458 ?AUTO_2455 ) ( VISIBLE_FROM ?AUTO_2454 ?AUTO_2456 ) ( CAN_TRAVERSE ?AUTO_2459 ?AUTO_2460 ?AUTO_2456 ) ( VISIBLE ?AUTO_2460 ?AUTO_2456 ) ( not ( = ?AUTO_2456 ?AUTO_2460 ) ) ( not ( = ?AUTO_2461 ?AUTO_2460 ) ) ( CAN_TRAVERSE ?AUTO_2459 ?AUTO_2462 ?AUTO_2460 ) ( AT ?AUTO_2459 ?AUTO_2462 ) ( VISIBLE ?AUTO_2462 ?AUTO_2460 ) ( not ( = ?AUTO_2456 ?AUTO_2462 ) ) ( not ( = ?AUTO_2461 ?AUTO_2462 ) ) ( not ( = ?AUTO_2460 ?AUTO_2462 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2459 ?AUTO_2462 ?AUTO_2460 )
      ( GET_IMAGE_DATA ?AUTO_2454 ?AUTO_2455 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2454 ?AUTO_2455 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2463 - OBJECTIVE
      ?AUTO_2464 - MODE
    )
    :vars
    (
      ?AUTO_2465 - LANDER
      ?AUTO_2469 - WAYPOINT
      ?AUTO_2470 - WAYPOINT
      ?AUTO_2467 - ROVER
      ?AUTO_2471 - CAMERA
      ?AUTO_2466 - WAYPOINT
      ?AUTO_2468 - WAYPOINT
      ?AUTO_2472 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2465 ?AUTO_2469 ) ( VISIBLE ?AUTO_2470 ?AUTO_2469 ) ( AVAILABLE ?AUTO_2467 ) ( CHANNEL_FREE ?AUTO_2465 ) ( not ( = ?AUTO_2470 ?AUTO_2469 ) ) ( CAN_TRAVERSE ?AUTO_2467 ?AUTO_2469 ?AUTO_2470 ) ( VISIBLE ?AUTO_2469 ?AUTO_2470 ) ( ON_BOARD ?AUTO_2471 ?AUTO_2467 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2467 ) ( SUPPORTS ?AUTO_2471 ?AUTO_2464 ) ( VISIBLE_FROM ?AUTO_2463 ?AUTO_2469 ) ( CAN_TRAVERSE ?AUTO_2467 ?AUTO_2466 ?AUTO_2469 ) ( VISIBLE ?AUTO_2466 ?AUTO_2469 ) ( not ( = ?AUTO_2469 ?AUTO_2466 ) ) ( not ( = ?AUTO_2470 ?AUTO_2466 ) ) ( CAN_TRAVERSE ?AUTO_2467 ?AUTO_2468 ?AUTO_2466 ) ( AT ?AUTO_2467 ?AUTO_2468 ) ( VISIBLE ?AUTO_2468 ?AUTO_2466 ) ( not ( = ?AUTO_2469 ?AUTO_2468 ) ) ( not ( = ?AUTO_2470 ?AUTO_2468 ) ) ( not ( = ?AUTO_2466 ?AUTO_2468 ) ) ( CALIBRATION_TARGET ?AUTO_2471 ?AUTO_2472 ) ( VISIBLE_FROM ?AUTO_2472 ?AUTO_2468 ) ( not ( = ?AUTO_2463 ?AUTO_2472 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2467 ?AUTO_2471 ?AUTO_2472 ?AUTO_2468 )
      ( GET_IMAGE_DATA ?AUTO_2463 ?AUTO_2464 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2463 ?AUTO_2464 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2473 - OBJECTIVE
      ?AUTO_2474 - MODE
    )
    :vars
    (
      ?AUTO_2478 - LANDER
      ?AUTO_2479 - WAYPOINT
      ?AUTO_2476 - WAYPOINT
      ?AUTO_2475 - ROVER
      ?AUTO_2480 - CAMERA
      ?AUTO_2477 - WAYPOINT
      ?AUTO_2481 - WAYPOINT
      ?AUTO_2482 - OBJECTIVE
      ?AUTO_2483 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2478 ?AUTO_2479 ) ( VISIBLE ?AUTO_2476 ?AUTO_2479 ) ( AVAILABLE ?AUTO_2475 ) ( CHANNEL_FREE ?AUTO_2478 ) ( not ( = ?AUTO_2476 ?AUTO_2479 ) ) ( CAN_TRAVERSE ?AUTO_2475 ?AUTO_2479 ?AUTO_2476 ) ( VISIBLE ?AUTO_2479 ?AUTO_2476 ) ( ON_BOARD ?AUTO_2480 ?AUTO_2475 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2475 ) ( SUPPORTS ?AUTO_2480 ?AUTO_2474 ) ( VISIBLE_FROM ?AUTO_2473 ?AUTO_2479 ) ( CAN_TRAVERSE ?AUTO_2475 ?AUTO_2477 ?AUTO_2479 ) ( VISIBLE ?AUTO_2477 ?AUTO_2479 ) ( not ( = ?AUTO_2479 ?AUTO_2477 ) ) ( not ( = ?AUTO_2476 ?AUTO_2477 ) ) ( CAN_TRAVERSE ?AUTO_2475 ?AUTO_2481 ?AUTO_2477 ) ( VISIBLE ?AUTO_2481 ?AUTO_2477 ) ( not ( = ?AUTO_2479 ?AUTO_2481 ) ) ( not ( = ?AUTO_2476 ?AUTO_2481 ) ) ( not ( = ?AUTO_2477 ?AUTO_2481 ) ) ( CALIBRATION_TARGET ?AUTO_2480 ?AUTO_2482 ) ( VISIBLE_FROM ?AUTO_2482 ?AUTO_2481 ) ( not ( = ?AUTO_2473 ?AUTO_2482 ) ) ( CAN_TRAVERSE ?AUTO_2475 ?AUTO_2483 ?AUTO_2481 ) ( AT ?AUTO_2475 ?AUTO_2483 ) ( VISIBLE ?AUTO_2483 ?AUTO_2481 ) ( not ( = ?AUTO_2479 ?AUTO_2483 ) ) ( not ( = ?AUTO_2476 ?AUTO_2483 ) ) ( not ( = ?AUTO_2477 ?AUTO_2483 ) ) ( not ( = ?AUTO_2481 ?AUTO_2483 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2475 ?AUTO_2483 ?AUTO_2481 )
      ( GET_IMAGE_DATA ?AUTO_2473 ?AUTO_2474 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2473 ?AUTO_2474 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2484 - OBJECTIVE
      ?AUTO_2485 - MODE
    )
    :vars
    (
      ?AUTO_2488 - LANDER
      ?AUTO_2491 - WAYPOINT
      ?AUTO_2492 - WAYPOINT
      ?AUTO_2486 - ROVER
      ?AUTO_2490 - CAMERA
      ?AUTO_2489 - WAYPOINT
      ?AUTO_2493 - WAYPOINT
      ?AUTO_2487 - OBJECTIVE
      ?AUTO_2494 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2488 ?AUTO_2491 ) ( VISIBLE ?AUTO_2492 ?AUTO_2491 ) ( AVAILABLE ?AUTO_2486 ) ( CHANNEL_FREE ?AUTO_2488 ) ( not ( = ?AUTO_2492 ?AUTO_2491 ) ) ( CAN_TRAVERSE ?AUTO_2486 ?AUTO_2491 ?AUTO_2492 ) ( VISIBLE ?AUTO_2491 ?AUTO_2492 ) ( ON_BOARD ?AUTO_2490 ?AUTO_2486 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2486 ) ( SUPPORTS ?AUTO_2490 ?AUTO_2485 ) ( VISIBLE_FROM ?AUTO_2484 ?AUTO_2491 ) ( CAN_TRAVERSE ?AUTO_2486 ?AUTO_2489 ?AUTO_2491 ) ( VISIBLE ?AUTO_2489 ?AUTO_2491 ) ( not ( = ?AUTO_2491 ?AUTO_2489 ) ) ( not ( = ?AUTO_2492 ?AUTO_2489 ) ) ( CAN_TRAVERSE ?AUTO_2486 ?AUTO_2493 ?AUTO_2489 ) ( VISIBLE ?AUTO_2493 ?AUTO_2489 ) ( not ( = ?AUTO_2491 ?AUTO_2493 ) ) ( not ( = ?AUTO_2492 ?AUTO_2493 ) ) ( not ( = ?AUTO_2489 ?AUTO_2493 ) ) ( CALIBRATION_TARGET ?AUTO_2490 ?AUTO_2487 ) ( VISIBLE_FROM ?AUTO_2487 ?AUTO_2493 ) ( not ( = ?AUTO_2484 ?AUTO_2487 ) ) ( CAN_TRAVERSE ?AUTO_2486 ?AUTO_2494 ?AUTO_2493 ) ( VISIBLE ?AUTO_2494 ?AUTO_2493 ) ( not ( = ?AUTO_2491 ?AUTO_2494 ) ) ( not ( = ?AUTO_2492 ?AUTO_2494 ) ) ( not ( = ?AUTO_2489 ?AUTO_2494 ) ) ( not ( = ?AUTO_2493 ?AUTO_2494 ) ) ( CAN_TRAVERSE ?AUTO_2486 ?AUTO_2492 ?AUTO_2494 ) ( AT ?AUTO_2486 ?AUTO_2492 ) ( VISIBLE ?AUTO_2492 ?AUTO_2494 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2486 ?AUTO_2492 ?AUTO_2494 )
      ( GET_IMAGE_DATA ?AUTO_2484 ?AUTO_2485 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2484 ?AUTO_2485 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2495 - OBJECTIVE
      ?AUTO_2496 - MODE
    )
    :vars
    (
      ?AUTO_2500 - LANDER
      ?AUTO_2504 - WAYPOINT
      ?AUTO_2505 - WAYPOINT
      ?AUTO_2503 - ROVER
      ?AUTO_2501 - CAMERA
      ?AUTO_2499 - WAYPOINT
      ?AUTO_2498 - WAYPOINT
      ?AUTO_2497 - OBJECTIVE
      ?AUTO_2502 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2500 ?AUTO_2504 ) ( VISIBLE ?AUTO_2505 ?AUTO_2504 ) ( AVAILABLE ?AUTO_2503 ) ( CHANNEL_FREE ?AUTO_2500 ) ( not ( = ?AUTO_2505 ?AUTO_2504 ) ) ( CAN_TRAVERSE ?AUTO_2503 ?AUTO_2504 ?AUTO_2505 ) ( VISIBLE ?AUTO_2504 ?AUTO_2505 ) ( ON_BOARD ?AUTO_2501 ?AUTO_2503 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2503 ) ( SUPPORTS ?AUTO_2501 ?AUTO_2496 ) ( VISIBLE_FROM ?AUTO_2495 ?AUTO_2504 ) ( CAN_TRAVERSE ?AUTO_2503 ?AUTO_2499 ?AUTO_2504 ) ( VISIBLE ?AUTO_2499 ?AUTO_2504 ) ( not ( = ?AUTO_2504 ?AUTO_2499 ) ) ( not ( = ?AUTO_2505 ?AUTO_2499 ) ) ( CAN_TRAVERSE ?AUTO_2503 ?AUTO_2498 ?AUTO_2499 ) ( VISIBLE ?AUTO_2498 ?AUTO_2499 ) ( not ( = ?AUTO_2504 ?AUTO_2498 ) ) ( not ( = ?AUTO_2505 ?AUTO_2498 ) ) ( not ( = ?AUTO_2499 ?AUTO_2498 ) ) ( CALIBRATION_TARGET ?AUTO_2501 ?AUTO_2497 ) ( VISIBLE_FROM ?AUTO_2497 ?AUTO_2498 ) ( not ( = ?AUTO_2495 ?AUTO_2497 ) ) ( CAN_TRAVERSE ?AUTO_2503 ?AUTO_2502 ?AUTO_2498 ) ( VISIBLE ?AUTO_2502 ?AUTO_2498 ) ( not ( = ?AUTO_2504 ?AUTO_2502 ) ) ( not ( = ?AUTO_2505 ?AUTO_2502 ) ) ( not ( = ?AUTO_2499 ?AUTO_2502 ) ) ( not ( = ?AUTO_2498 ?AUTO_2502 ) ) ( CAN_TRAVERSE ?AUTO_2503 ?AUTO_2505 ?AUTO_2502 ) ( VISIBLE ?AUTO_2505 ?AUTO_2502 ) ( AT ?AUTO_2503 ?AUTO_2504 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2503 ?AUTO_2504 ?AUTO_2505 )
      ( GET_IMAGE_DATA ?AUTO_2495 ?AUTO_2496 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2495 ?AUTO_2496 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2606 - OBJECTIVE
      ?AUTO_2607 - MODE
    )
    :vars
    (
      ?AUTO_2612 - LANDER
      ?AUTO_2610 - WAYPOINT
      ?AUTO_2611 - WAYPOINT
      ?AUTO_2615 - ROVER
      ?AUTO_2609 - CAMERA
      ?AUTO_2613 - WAYPOINT
      ?AUTO_2608 - WAYPOINT
      ?AUTO_2614 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2612 ?AUTO_2610 ) ( VISIBLE ?AUTO_2611 ?AUTO_2610 ) ( AVAILABLE ?AUTO_2615 ) ( CHANNEL_FREE ?AUTO_2612 ) ( not ( = ?AUTO_2611 ?AUTO_2610 ) ) ( ON_BOARD ?AUTO_2609 ?AUTO_2615 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2615 ) ( SUPPORTS ?AUTO_2609 ?AUTO_2607 ) ( VISIBLE_FROM ?AUTO_2606 ?AUTO_2611 ) ( CAN_TRAVERSE ?AUTO_2615 ?AUTO_2613 ?AUTO_2611 ) ( VISIBLE ?AUTO_2613 ?AUTO_2611 ) ( not ( = ?AUTO_2610 ?AUTO_2613 ) ) ( not ( = ?AUTO_2611 ?AUTO_2613 ) ) ( CAN_TRAVERSE ?AUTO_2615 ?AUTO_2608 ?AUTO_2613 ) ( VISIBLE ?AUTO_2608 ?AUTO_2613 ) ( not ( = ?AUTO_2610 ?AUTO_2608 ) ) ( not ( = ?AUTO_2611 ?AUTO_2608 ) ) ( not ( = ?AUTO_2613 ?AUTO_2608 ) ) ( CALIBRATION_TARGET ?AUTO_2609 ?AUTO_2614 ) ( VISIBLE_FROM ?AUTO_2614 ?AUTO_2608 ) ( not ( = ?AUTO_2606 ?AUTO_2614 ) ) ( CAN_TRAVERSE ?AUTO_2615 ?AUTO_2611 ?AUTO_2608 ) ( AT ?AUTO_2615 ?AUTO_2611 ) ( VISIBLE ?AUTO_2611 ?AUTO_2608 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2615 ?AUTO_2611 ?AUTO_2608 )
      ( GET_IMAGE_DATA ?AUTO_2606 ?AUTO_2607 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2606 ?AUTO_2607 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2624 - OBJECTIVE
      ?AUTO_2625 - MODE
    )
    :vars
    (
      ?AUTO_2627 - LANDER
      ?AUTO_2630 - WAYPOINT
      ?AUTO_2628 - WAYPOINT
      ?AUTO_2626 - ROVER
      ?AUTO_2633 - CAMERA
      ?AUTO_2632 - WAYPOINT
      ?AUTO_2629 - WAYPOINT
      ?AUTO_2631 - OBJECTIVE
      ?AUTO_2634 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2627 ?AUTO_2630 ) ( VISIBLE ?AUTO_2628 ?AUTO_2630 ) ( AVAILABLE ?AUTO_2626 ) ( CHANNEL_FREE ?AUTO_2627 ) ( not ( = ?AUTO_2628 ?AUTO_2630 ) ) ( ON_BOARD ?AUTO_2633 ?AUTO_2626 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2626 ) ( SUPPORTS ?AUTO_2633 ?AUTO_2625 ) ( VISIBLE_FROM ?AUTO_2624 ?AUTO_2628 ) ( CAN_TRAVERSE ?AUTO_2626 ?AUTO_2632 ?AUTO_2628 ) ( VISIBLE ?AUTO_2632 ?AUTO_2628 ) ( not ( = ?AUTO_2630 ?AUTO_2632 ) ) ( not ( = ?AUTO_2628 ?AUTO_2632 ) ) ( CAN_TRAVERSE ?AUTO_2626 ?AUTO_2629 ?AUTO_2632 ) ( VISIBLE ?AUTO_2629 ?AUTO_2632 ) ( not ( = ?AUTO_2630 ?AUTO_2629 ) ) ( not ( = ?AUTO_2628 ?AUTO_2629 ) ) ( not ( = ?AUTO_2632 ?AUTO_2629 ) ) ( CALIBRATION_TARGET ?AUTO_2633 ?AUTO_2631 ) ( VISIBLE_FROM ?AUTO_2631 ?AUTO_2629 ) ( not ( = ?AUTO_2624 ?AUTO_2631 ) ) ( CAN_TRAVERSE ?AUTO_2626 ?AUTO_2628 ?AUTO_2629 ) ( VISIBLE ?AUTO_2628 ?AUTO_2629 ) ( CAN_TRAVERSE ?AUTO_2626 ?AUTO_2634 ?AUTO_2628 ) ( AT ?AUTO_2626 ?AUTO_2634 ) ( VISIBLE ?AUTO_2634 ?AUTO_2628 ) ( not ( = ?AUTO_2630 ?AUTO_2634 ) ) ( not ( = ?AUTO_2628 ?AUTO_2634 ) ) ( not ( = ?AUTO_2632 ?AUTO_2634 ) ) ( not ( = ?AUTO_2629 ?AUTO_2634 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2626 ?AUTO_2634 ?AUTO_2628 )
      ( GET_IMAGE_DATA ?AUTO_2624 ?AUTO_2625 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2624 ?AUTO_2625 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2641 - OBJECTIVE
      ?AUTO_2642 - MODE
    )
    :vars
    (
      ?AUTO_2650 - LANDER
      ?AUTO_2649 - WAYPOINT
      ?AUTO_2644 - WAYPOINT
      ?AUTO_2643 - ROVER
      ?AUTO_2651 - CAMERA
      ?AUTO_2648 - WAYPOINT
      ?AUTO_2645 - WAYPOINT
      ?AUTO_2646 - OBJECTIVE
      ?AUTO_2647 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2650 ?AUTO_2649 ) ( VISIBLE ?AUTO_2644 ?AUTO_2649 ) ( AVAILABLE ?AUTO_2643 ) ( CHANNEL_FREE ?AUTO_2650 ) ( not ( = ?AUTO_2644 ?AUTO_2649 ) ) ( ON_BOARD ?AUTO_2651 ?AUTO_2643 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2643 ) ( SUPPORTS ?AUTO_2651 ?AUTO_2642 ) ( VISIBLE_FROM ?AUTO_2641 ?AUTO_2644 ) ( CAN_TRAVERSE ?AUTO_2643 ?AUTO_2648 ?AUTO_2644 ) ( VISIBLE ?AUTO_2648 ?AUTO_2644 ) ( not ( = ?AUTO_2649 ?AUTO_2648 ) ) ( not ( = ?AUTO_2644 ?AUTO_2648 ) ) ( CAN_TRAVERSE ?AUTO_2643 ?AUTO_2645 ?AUTO_2648 ) ( VISIBLE ?AUTO_2645 ?AUTO_2648 ) ( not ( = ?AUTO_2649 ?AUTO_2645 ) ) ( not ( = ?AUTO_2644 ?AUTO_2645 ) ) ( not ( = ?AUTO_2648 ?AUTO_2645 ) ) ( CALIBRATION_TARGET ?AUTO_2651 ?AUTO_2646 ) ( VISIBLE_FROM ?AUTO_2646 ?AUTO_2645 ) ( not ( = ?AUTO_2641 ?AUTO_2646 ) ) ( CAN_TRAVERSE ?AUTO_2643 ?AUTO_2644 ?AUTO_2645 ) ( VISIBLE ?AUTO_2644 ?AUTO_2645 ) ( CAN_TRAVERSE ?AUTO_2643 ?AUTO_2647 ?AUTO_2644 ) ( VISIBLE ?AUTO_2647 ?AUTO_2644 ) ( not ( = ?AUTO_2649 ?AUTO_2647 ) ) ( not ( = ?AUTO_2644 ?AUTO_2647 ) ) ( not ( = ?AUTO_2648 ?AUTO_2647 ) ) ( not ( = ?AUTO_2645 ?AUTO_2647 ) ) ( CAN_TRAVERSE ?AUTO_2643 ?AUTO_2649 ?AUTO_2647 ) ( AT ?AUTO_2643 ?AUTO_2649 ) ( VISIBLE ?AUTO_2649 ?AUTO_2647 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2643 ?AUTO_2649 ?AUTO_2647 )
      ( GET_IMAGE_DATA ?AUTO_2641 ?AUTO_2642 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2641 ?AUTO_2642 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2674 - OBJECTIVE
      ?AUTO_2675 - MODE
    )
    :vars
    (
      ?AUTO_2677 - LANDER
      ?AUTO_2676 - WAYPOINT
      ?AUTO_2679 - WAYPOINT
      ?AUTO_2678 - ROVER
      ?AUTO_2680 - CAMERA
      ?AUTO_2681 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2677 ?AUTO_2676 ) ( VISIBLE ?AUTO_2679 ?AUTO_2676 ) ( AVAILABLE ?AUTO_2678 ) ( CHANNEL_FREE ?AUTO_2677 ) ( not ( = ?AUTO_2679 ?AUTO_2676 ) ) ( CALIBRATED ?AUTO_2680 ?AUTO_2678 ) ( ON_BOARD ?AUTO_2680 ?AUTO_2678 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2678 ) ( SUPPORTS ?AUTO_2680 ?AUTO_2675 ) ( VISIBLE_FROM ?AUTO_2674 ?AUTO_2679 ) ( CAN_TRAVERSE ?AUTO_2678 ?AUTO_2676 ?AUTO_2679 ) ( VISIBLE ?AUTO_2676 ?AUTO_2679 ) ( CAN_TRAVERSE ?AUTO_2678 ?AUTO_2681 ?AUTO_2676 ) ( AT ?AUTO_2678 ?AUTO_2681 ) ( VISIBLE ?AUTO_2681 ?AUTO_2676 ) ( not ( = ?AUTO_2676 ?AUTO_2681 ) ) ( not ( = ?AUTO_2679 ?AUTO_2681 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2678 ?AUTO_2681 ?AUTO_2676 )
      ( GET_IMAGE_DATA ?AUTO_2674 ?AUTO_2675 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2674 ?AUTO_2675 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2684 - OBJECTIVE
      ?AUTO_2685 - MODE
    )
    :vars
    (
      ?AUTO_2690 - LANDER
      ?AUTO_2687 - WAYPOINT
      ?AUTO_2686 - WAYPOINT
      ?AUTO_2688 - ROVER
      ?AUTO_2691 - CAMERA
      ?AUTO_2689 - WAYPOINT
      ?AUTO_2692 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2690 ?AUTO_2687 ) ( VISIBLE ?AUTO_2686 ?AUTO_2687 ) ( AVAILABLE ?AUTO_2688 ) ( CHANNEL_FREE ?AUTO_2690 ) ( not ( = ?AUTO_2686 ?AUTO_2687 ) ) ( ON_BOARD ?AUTO_2691 ?AUTO_2688 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2688 ) ( SUPPORTS ?AUTO_2691 ?AUTO_2685 ) ( VISIBLE_FROM ?AUTO_2684 ?AUTO_2686 ) ( CAN_TRAVERSE ?AUTO_2688 ?AUTO_2687 ?AUTO_2686 ) ( VISIBLE ?AUTO_2687 ?AUTO_2686 ) ( CAN_TRAVERSE ?AUTO_2688 ?AUTO_2689 ?AUTO_2687 ) ( AT ?AUTO_2688 ?AUTO_2689 ) ( VISIBLE ?AUTO_2689 ?AUTO_2687 ) ( not ( = ?AUTO_2687 ?AUTO_2689 ) ) ( not ( = ?AUTO_2686 ?AUTO_2689 ) ) ( CALIBRATION_TARGET ?AUTO_2691 ?AUTO_2692 ) ( VISIBLE_FROM ?AUTO_2692 ?AUTO_2689 ) ( not ( = ?AUTO_2684 ?AUTO_2692 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2688 ?AUTO_2691 ?AUTO_2692 ?AUTO_2689 )
      ( GET_IMAGE_DATA ?AUTO_2684 ?AUTO_2685 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2684 ?AUTO_2685 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2801 - OBJECTIVE
      ?AUTO_2802 - MODE
    )
    :vars
    (
      ?AUTO_2804 - LANDER
      ?AUTO_2805 - WAYPOINT
      ?AUTO_2806 - WAYPOINT
      ?AUTO_2803 - ROVER
      ?AUTO_2807 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2804 ?AUTO_2805 ) ( VISIBLE ?AUTO_2806 ?AUTO_2805 ) ( AVAILABLE ?AUTO_2803 ) ( CHANNEL_FREE ?AUTO_2804 ) ( not ( = ?AUTO_2806 ?AUTO_2805 ) ) ( CAN_TRAVERSE ?AUTO_2803 ?AUTO_2805 ?AUTO_2806 ) ( VISIBLE ?AUTO_2805 ?AUTO_2806 ) ( CALIBRATED ?AUTO_2807 ?AUTO_2803 ) ( ON_BOARD ?AUTO_2807 ?AUTO_2803 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2803 ) ( SUPPORTS ?AUTO_2807 ?AUTO_2802 ) ( VISIBLE_FROM ?AUTO_2801 ?AUTO_2805 ) ( CAN_TRAVERSE ?AUTO_2803 ?AUTO_2806 ?AUTO_2805 ) ( AT ?AUTO_2803 ?AUTO_2806 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2803 ?AUTO_2806 ?AUTO_2805 )
      ( GET_IMAGE_DATA ?AUTO_2801 ?AUTO_2802 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2801 ?AUTO_2802 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2810 - OBJECTIVE
      ?AUTO_2811 - MODE
    )
    :vars
    (
      ?AUTO_2814 - LANDER
      ?AUTO_2815 - WAYPOINT
      ?AUTO_2812 - WAYPOINT
      ?AUTO_2813 - ROVER
      ?AUTO_2816 - CAMERA
      ?AUTO_2817 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2814 ?AUTO_2815 ) ( VISIBLE ?AUTO_2812 ?AUTO_2815 ) ( AVAILABLE ?AUTO_2813 ) ( CHANNEL_FREE ?AUTO_2814 ) ( not ( = ?AUTO_2812 ?AUTO_2815 ) ) ( CAN_TRAVERSE ?AUTO_2813 ?AUTO_2815 ?AUTO_2812 ) ( VISIBLE ?AUTO_2815 ?AUTO_2812 ) ( ON_BOARD ?AUTO_2816 ?AUTO_2813 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2813 ) ( SUPPORTS ?AUTO_2816 ?AUTO_2811 ) ( VISIBLE_FROM ?AUTO_2810 ?AUTO_2815 ) ( CAN_TRAVERSE ?AUTO_2813 ?AUTO_2812 ?AUTO_2815 ) ( AT ?AUTO_2813 ?AUTO_2812 ) ( CALIBRATION_TARGET ?AUTO_2816 ?AUTO_2817 ) ( VISIBLE_FROM ?AUTO_2817 ?AUTO_2812 ) ( not ( = ?AUTO_2810 ?AUTO_2817 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2813 ?AUTO_2816 ?AUTO_2817 ?AUTO_2812 )
      ( GET_IMAGE_DATA ?AUTO_2810 ?AUTO_2811 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2810 ?AUTO_2811 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2886 - OBJECTIVE
      ?AUTO_2887 - MODE
    )
    :vars
    (
      ?AUTO_2892 - LANDER
      ?AUTO_2889 - WAYPOINT
      ?AUTO_2894 - WAYPOINT
      ?AUTO_2893 - ROVER
      ?AUTO_2890 - CAMERA
      ?AUTO_2891 - WAYPOINT
      ?AUTO_2888 - WAYPOINT
      ?AUTO_2895 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2892 ?AUTO_2889 ) ( VISIBLE ?AUTO_2894 ?AUTO_2889 ) ( AVAILABLE ?AUTO_2893 ) ( CHANNEL_FREE ?AUTO_2892 ) ( not ( = ?AUTO_2894 ?AUTO_2889 ) ) ( ON_BOARD ?AUTO_2890 ?AUTO_2893 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2893 ) ( SUPPORTS ?AUTO_2890 ?AUTO_2887 ) ( VISIBLE_FROM ?AUTO_2886 ?AUTO_2894 ) ( CAN_TRAVERSE ?AUTO_2893 ?AUTO_2891 ?AUTO_2894 ) ( VISIBLE ?AUTO_2891 ?AUTO_2894 ) ( not ( = ?AUTO_2889 ?AUTO_2891 ) ) ( not ( = ?AUTO_2894 ?AUTO_2891 ) ) ( CAN_TRAVERSE ?AUTO_2893 ?AUTO_2888 ?AUTO_2891 ) ( VISIBLE ?AUTO_2888 ?AUTO_2891 ) ( not ( = ?AUTO_2889 ?AUTO_2888 ) ) ( not ( = ?AUTO_2894 ?AUTO_2888 ) ) ( not ( = ?AUTO_2891 ?AUTO_2888 ) ) ( CALIBRATION_TARGET ?AUTO_2890 ?AUTO_2895 ) ( VISIBLE_FROM ?AUTO_2895 ?AUTO_2888 ) ( not ( = ?AUTO_2886 ?AUTO_2895 ) ) ( CAN_TRAVERSE ?AUTO_2893 ?AUTO_2889 ?AUTO_2888 ) ( AT ?AUTO_2893 ?AUTO_2889 ) ( VISIBLE ?AUTO_2889 ?AUTO_2888 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2893 ?AUTO_2889 ?AUTO_2888 )
      ( GET_IMAGE_DATA ?AUTO_2886 ?AUTO_2887 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2886 ?AUTO_2887 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2953 - OBJECTIVE
      ?AUTO_2954 - MODE
    )
    :vars
    (
      ?AUTO_2959 - LANDER
      ?AUTO_2957 - WAYPOINT
      ?AUTO_2955 - WAYPOINT
      ?AUTO_2958 - ROVER
      ?AUTO_2956 - WAYPOINT
      ?AUTO_2960 - CAMERA
      ?AUTO_2961 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2959 ?AUTO_2957 ) ( VISIBLE ?AUTO_2955 ?AUTO_2957 ) ( AVAILABLE ?AUTO_2958 ) ( CHANNEL_FREE ?AUTO_2959 ) ( not ( = ?AUTO_2955 ?AUTO_2957 ) ) ( CAN_TRAVERSE ?AUTO_2958 ?AUTO_2956 ?AUTO_2955 ) ( AT ?AUTO_2958 ?AUTO_2956 ) ( VISIBLE ?AUTO_2956 ?AUTO_2955 ) ( not ( = ?AUTO_2957 ?AUTO_2956 ) ) ( not ( = ?AUTO_2955 ?AUTO_2956 ) ) ( ON_BOARD ?AUTO_2960 ?AUTO_2958 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2958 ) ( SUPPORTS ?AUTO_2960 ?AUTO_2954 ) ( VISIBLE_FROM ?AUTO_2953 ?AUTO_2956 ) ( CALIBRATION_TARGET ?AUTO_2960 ?AUTO_2961 ) ( VISIBLE_FROM ?AUTO_2961 ?AUTO_2956 ) ( not ( = ?AUTO_2953 ?AUTO_2961 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2958 ?AUTO_2960 ?AUTO_2961 ?AUTO_2956 )
      ( GET_IMAGE_DATA ?AUTO_2953 ?AUTO_2954 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2953 ?AUTO_2954 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2992 - OBJECTIVE
      ?AUTO_2993 - MODE
    )
    :vars
    (
      ?AUTO_2999 - LANDER
      ?AUTO_2996 - WAYPOINT
      ?AUTO_2995 - WAYPOINT
      ?AUTO_2994 - ROVER
      ?AUTO_2998 - CAMERA
      ?AUTO_2997 - WAYPOINT
      ?AUTO_3000 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2999 ?AUTO_2996 ) ( VISIBLE ?AUTO_2995 ?AUTO_2996 ) ( AVAILABLE ?AUTO_2994 ) ( CHANNEL_FREE ?AUTO_2999 ) ( not ( = ?AUTO_2995 ?AUTO_2996 ) ) ( ON_BOARD ?AUTO_2998 ?AUTO_2994 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2994 ) ( SUPPORTS ?AUTO_2998 ?AUTO_2993 ) ( VISIBLE_FROM ?AUTO_2992 ?AUTO_2995 ) ( CALIBRATION_TARGET ?AUTO_2998 ?AUTO_2992 ) ( CAN_TRAVERSE ?AUTO_2994 ?AUTO_2997 ?AUTO_2995 ) ( VISIBLE ?AUTO_2997 ?AUTO_2995 ) ( not ( = ?AUTO_2996 ?AUTO_2997 ) ) ( not ( = ?AUTO_2995 ?AUTO_2997 ) ) ( CAN_TRAVERSE ?AUTO_2994 ?AUTO_3000 ?AUTO_2997 ) ( AT ?AUTO_2994 ?AUTO_3000 ) ( VISIBLE ?AUTO_3000 ?AUTO_2997 ) ( not ( = ?AUTO_2996 ?AUTO_3000 ) ) ( not ( = ?AUTO_2995 ?AUTO_3000 ) ) ( not ( = ?AUTO_2997 ?AUTO_3000 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2994 ?AUTO_3000 ?AUTO_2997 )
      ( GET_IMAGE_DATA ?AUTO_2992 ?AUTO_2993 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2992 ?AUTO_2993 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3001 - OBJECTIVE
      ?AUTO_3002 - MODE
    )
    :vars
    (
      ?AUTO_3003 - LANDER
      ?AUTO_3007 - WAYPOINT
      ?AUTO_3005 - WAYPOINT
      ?AUTO_3004 - ROVER
      ?AUTO_3006 - CAMERA
      ?AUTO_3008 - WAYPOINT
      ?AUTO_3009 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3003 ?AUTO_3007 ) ( VISIBLE ?AUTO_3005 ?AUTO_3007 ) ( AVAILABLE ?AUTO_3004 ) ( CHANNEL_FREE ?AUTO_3003 ) ( not ( = ?AUTO_3005 ?AUTO_3007 ) ) ( ON_BOARD ?AUTO_3006 ?AUTO_3004 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3004 ) ( SUPPORTS ?AUTO_3006 ?AUTO_3002 ) ( VISIBLE_FROM ?AUTO_3001 ?AUTO_3005 ) ( CALIBRATION_TARGET ?AUTO_3006 ?AUTO_3001 ) ( CAN_TRAVERSE ?AUTO_3004 ?AUTO_3008 ?AUTO_3005 ) ( VISIBLE ?AUTO_3008 ?AUTO_3005 ) ( not ( = ?AUTO_3007 ?AUTO_3008 ) ) ( not ( = ?AUTO_3005 ?AUTO_3008 ) ) ( CAN_TRAVERSE ?AUTO_3004 ?AUTO_3009 ?AUTO_3008 ) ( VISIBLE ?AUTO_3009 ?AUTO_3008 ) ( not ( = ?AUTO_3007 ?AUTO_3009 ) ) ( not ( = ?AUTO_3005 ?AUTO_3009 ) ) ( not ( = ?AUTO_3008 ?AUTO_3009 ) ) ( CAN_TRAVERSE ?AUTO_3004 ?AUTO_3007 ?AUTO_3009 ) ( AT ?AUTO_3004 ?AUTO_3007 ) ( VISIBLE ?AUTO_3007 ?AUTO_3009 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3004 ?AUTO_3007 ?AUTO_3009 )
      ( GET_IMAGE_DATA ?AUTO_3001 ?AUTO_3002 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3001 ?AUTO_3002 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3036 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3040 - LANDER
      ?AUTO_3041 - WAYPOINT
      ?AUTO_3038 - ROVER
      ?AUTO_3037 - STORE
      ?AUTO_3039 - WAYPOINT
      ?AUTO_3042 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3040 ?AUTO_3041 ) ( VISIBLE ?AUTO_3036 ?AUTO_3041 ) ( AVAILABLE ?AUTO_3038 ) ( CHANNEL_FREE ?AUTO_3040 ) ( not ( = ?AUTO_3036 ?AUTO_3041 ) ) ( AT_ROCK_SAMPLE ?AUTO_3036 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3038 ) ( STORE_OF ?AUTO_3037 ?AUTO_3038 ) ( EMPTY ?AUTO_3037 ) ( CAN_TRAVERSE ?AUTO_3038 ?AUTO_3039 ?AUTO_3036 ) ( VISIBLE ?AUTO_3039 ?AUTO_3036 ) ( not ( = ?AUTO_3036 ?AUTO_3039 ) ) ( not ( = ?AUTO_3041 ?AUTO_3039 ) ) ( CAN_TRAVERSE ?AUTO_3038 ?AUTO_3042 ?AUTO_3039 ) ( VISIBLE ?AUTO_3042 ?AUTO_3039 ) ( not ( = ?AUTO_3036 ?AUTO_3042 ) ) ( not ( = ?AUTO_3041 ?AUTO_3042 ) ) ( not ( = ?AUTO_3039 ?AUTO_3042 ) ) ( CAN_TRAVERSE ?AUTO_3038 ?AUTO_3041 ?AUTO_3042 ) ( AT ?AUTO_3038 ?AUTO_3041 ) ( VISIBLE ?AUTO_3041 ?AUTO_3042 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3038 ?AUTO_3041 ?AUTO_3042 )
      ( GET_ROCK_DATA ?AUTO_3036 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3036 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3075 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3076 - LANDER
      ?AUTO_3081 - WAYPOINT
      ?AUTO_3080 - WAYPOINT
      ?AUTO_3077 - ROVER
      ?AUTO_3078 - STORE
      ?AUTO_3079 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3076 ?AUTO_3081 ) ( VISIBLE ?AUTO_3080 ?AUTO_3081 ) ( AVAILABLE ?AUTO_3077 ) ( CHANNEL_FREE ?AUTO_3076 ) ( not ( = ?AUTO_3075 ?AUTO_3080 ) ) ( not ( = ?AUTO_3075 ?AUTO_3081 ) ) ( not ( = ?AUTO_3080 ?AUTO_3081 ) ) ( CAN_TRAVERSE ?AUTO_3077 ?AUTO_3075 ?AUTO_3080 ) ( VISIBLE ?AUTO_3075 ?AUTO_3080 ) ( AT_SOIL_SAMPLE ?AUTO_3075 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3077 ) ( STORE_OF ?AUTO_3078 ?AUTO_3077 ) ( EMPTY ?AUTO_3078 ) ( CAN_TRAVERSE ?AUTO_3077 ?AUTO_3079 ?AUTO_3075 ) ( VISIBLE ?AUTO_3079 ?AUTO_3075 ) ( not ( = ?AUTO_3075 ?AUTO_3079 ) ) ( not ( = ?AUTO_3081 ?AUTO_3079 ) ) ( not ( = ?AUTO_3080 ?AUTO_3079 ) ) ( CAN_TRAVERSE ?AUTO_3077 ?AUTO_3081 ?AUTO_3079 ) ( VISIBLE ?AUTO_3081 ?AUTO_3079 ) ( CAN_TRAVERSE ?AUTO_3077 ?AUTO_3080 ?AUTO_3081 ) ( AT ?AUTO_3077 ?AUTO_3080 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3077 ?AUTO_3080 ?AUTO_3081 )
      ( GET_SOIL_DATA ?AUTO_3075 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3075 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3121 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3123 - LANDER
      ?AUTO_3122 - WAYPOINT
      ?AUTO_3127 - WAYPOINT
      ?AUTO_3126 - ROVER
      ?AUTO_3125 - STORE
      ?AUTO_3124 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3123 ?AUTO_3122 ) ( VISIBLE ?AUTO_3127 ?AUTO_3122 ) ( AVAILABLE ?AUTO_3126 ) ( CHANNEL_FREE ?AUTO_3123 ) ( not ( = ?AUTO_3121 ?AUTO_3127 ) ) ( not ( = ?AUTO_3121 ?AUTO_3122 ) ) ( not ( = ?AUTO_3127 ?AUTO_3122 ) ) ( CAN_TRAVERSE ?AUTO_3126 ?AUTO_3121 ?AUTO_3127 ) ( VISIBLE ?AUTO_3121 ?AUTO_3127 ) ( AT_SOIL_SAMPLE ?AUTO_3121 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3126 ) ( STORE_OF ?AUTO_3125 ?AUTO_3126 ) ( CAN_TRAVERSE ?AUTO_3126 ?AUTO_3127 ?AUTO_3121 ) ( VISIBLE ?AUTO_3127 ?AUTO_3121 ) ( CAN_TRAVERSE ?AUTO_3126 ?AUTO_3124 ?AUTO_3127 ) ( AT ?AUTO_3126 ?AUTO_3124 ) ( VISIBLE ?AUTO_3124 ?AUTO_3127 ) ( not ( = ?AUTO_3121 ?AUTO_3124 ) ) ( not ( = ?AUTO_3122 ?AUTO_3124 ) ) ( not ( = ?AUTO_3127 ?AUTO_3124 ) ) ( FULL ?AUTO_3125 ) )
    :subtasks
    ( ( !DROP ?AUTO_3126 ?AUTO_3125 )
      ( GET_SOIL_DATA ?AUTO_3121 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3121 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3129 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3135 - LANDER
      ?AUTO_3130 - WAYPOINT
      ?AUTO_3134 - WAYPOINT
      ?AUTO_3132 - ROVER
      ?AUTO_3133 - STORE
      ?AUTO_3131 - WAYPOINT
      ?AUTO_3136 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3135 ?AUTO_3130 ) ( VISIBLE ?AUTO_3134 ?AUTO_3130 ) ( AVAILABLE ?AUTO_3132 ) ( CHANNEL_FREE ?AUTO_3135 ) ( not ( = ?AUTO_3129 ?AUTO_3134 ) ) ( not ( = ?AUTO_3129 ?AUTO_3130 ) ) ( not ( = ?AUTO_3134 ?AUTO_3130 ) ) ( CAN_TRAVERSE ?AUTO_3132 ?AUTO_3129 ?AUTO_3134 ) ( VISIBLE ?AUTO_3129 ?AUTO_3134 ) ( AT_SOIL_SAMPLE ?AUTO_3129 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3132 ) ( STORE_OF ?AUTO_3133 ?AUTO_3132 ) ( EMPTY ?AUTO_3133 ) ( CAN_TRAVERSE ?AUTO_3132 ?AUTO_3134 ?AUTO_3129 ) ( VISIBLE ?AUTO_3134 ?AUTO_3129 ) ( CAN_TRAVERSE ?AUTO_3132 ?AUTO_3131 ?AUTO_3134 ) ( VISIBLE ?AUTO_3131 ?AUTO_3134 ) ( not ( = ?AUTO_3129 ?AUTO_3131 ) ) ( not ( = ?AUTO_3130 ?AUTO_3131 ) ) ( not ( = ?AUTO_3134 ?AUTO_3131 ) ) ( CAN_TRAVERSE ?AUTO_3132 ?AUTO_3136 ?AUTO_3131 ) ( AT ?AUTO_3132 ?AUTO_3136 ) ( VISIBLE ?AUTO_3136 ?AUTO_3131 ) ( not ( = ?AUTO_3129 ?AUTO_3136 ) ) ( not ( = ?AUTO_3130 ?AUTO_3136 ) ) ( not ( = ?AUTO_3134 ?AUTO_3136 ) ) ( not ( = ?AUTO_3131 ?AUTO_3136 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3132 ?AUTO_3136 ?AUTO_3131 )
      ( GET_SOIL_DATA ?AUTO_3129 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3129 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3137 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3138 - LANDER
      ?AUTO_3139 - WAYPOINT
      ?AUTO_3144 - WAYPOINT
      ?AUTO_3140 - ROVER
      ?AUTO_3141 - STORE
      ?AUTO_3143 - WAYPOINT
      ?AUTO_3142 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3138 ?AUTO_3139 ) ( VISIBLE ?AUTO_3144 ?AUTO_3139 ) ( AVAILABLE ?AUTO_3140 ) ( CHANNEL_FREE ?AUTO_3138 ) ( not ( = ?AUTO_3137 ?AUTO_3144 ) ) ( not ( = ?AUTO_3137 ?AUTO_3139 ) ) ( not ( = ?AUTO_3144 ?AUTO_3139 ) ) ( CAN_TRAVERSE ?AUTO_3140 ?AUTO_3137 ?AUTO_3144 ) ( VISIBLE ?AUTO_3137 ?AUTO_3144 ) ( AT_SOIL_SAMPLE ?AUTO_3137 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3140 ) ( STORE_OF ?AUTO_3141 ?AUTO_3140 ) ( EMPTY ?AUTO_3141 ) ( CAN_TRAVERSE ?AUTO_3140 ?AUTO_3144 ?AUTO_3137 ) ( VISIBLE ?AUTO_3144 ?AUTO_3137 ) ( CAN_TRAVERSE ?AUTO_3140 ?AUTO_3143 ?AUTO_3144 ) ( VISIBLE ?AUTO_3143 ?AUTO_3144 ) ( not ( = ?AUTO_3137 ?AUTO_3143 ) ) ( not ( = ?AUTO_3139 ?AUTO_3143 ) ) ( not ( = ?AUTO_3144 ?AUTO_3143 ) ) ( CAN_TRAVERSE ?AUTO_3140 ?AUTO_3142 ?AUTO_3143 ) ( VISIBLE ?AUTO_3142 ?AUTO_3143 ) ( not ( = ?AUTO_3137 ?AUTO_3142 ) ) ( not ( = ?AUTO_3139 ?AUTO_3142 ) ) ( not ( = ?AUTO_3144 ?AUTO_3142 ) ) ( not ( = ?AUTO_3143 ?AUTO_3142 ) ) ( CAN_TRAVERSE ?AUTO_3140 ?AUTO_3139 ?AUTO_3142 ) ( AT ?AUTO_3140 ?AUTO_3139 ) ( VISIBLE ?AUTO_3139 ?AUTO_3142 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3140 ?AUTO_3139 ?AUTO_3142 )
      ( GET_SOIL_DATA ?AUTO_3137 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3137 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3185 - OBJECTIVE
      ?AUTO_3186 - MODE
    )
    :vars
    (
      ?AUTO_3190 - LANDER
      ?AUTO_3191 - WAYPOINT
      ?AUTO_3189 - WAYPOINT
      ?AUTO_3188 - ROVER
      ?AUTO_3187 - CAMERA
      ?AUTO_3192 - WAYPOINT
      ?AUTO_3193 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3190 ?AUTO_3191 ) ( VISIBLE ?AUTO_3189 ?AUTO_3191 ) ( AVAILABLE ?AUTO_3188 ) ( CHANNEL_FREE ?AUTO_3190 ) ( not ( = ?AUTO_3189 ?AUTO_3191 ) ) ( ON_BOARD ?AUTO_3187 ?AUTO_3188 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3188 ) ( SUPPORTS ?AUTO_3187 ?AUTO_3186 ) ( VISIBLE_FROM ?AUTO_3185 ?AUTO_3189 ) ( CALIBRATION_TARGET ?AUTO_3187 ?AUTO_3185 ) ( CAN_TRAVERSE ?AUTO_3188 ?AUTO_3192 ?AUTO_3189 ) ( VISIBLE ?AUTO_3192 ?AUTO_3189 ) ( not ( = ?AUTO_3191 ?AUTO_3192 ) ) ( not ( = ?AUTO_3189 ?AUTO_3192 ) ) ( CAN_TRAVERSE ?AUTO_3188 ?AUTO_3191 ?AUTO_3192 ) ( VISIBLE ?AUTO_3191 ?AUTO_3192 ) ( CAN_TRAVERSE ?AUTO_3188 ?AUTO_3193 ?AUTO_3191 ) ( AT ?AUTO_3188 ?AUTO_3193 ) ( VISIBLE ?AUTO_3193 ?AUTO_3191 ) ( not ( = ?AUTO_3191 ?AUTO_3193 ) ) ( not ( = ?AUTO_3189 ?AUTO_3193 ) ) ( not ( = ?AUTO_3192 ?AUTO_3193 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3188 ?AUTO_3193 ?AUTO_3191 )
      ( GET_IMAGE_DATA ?AUTO_3185 ?AUTO_3186 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3185 ?AUTO_3186 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3194 - OBJECTIVE
      ?AUTO_3195 - MODE
    )
    :vars
    (
      ?AUTO_3199 - LANDER
      ?AUTO_3197 - WAYPOINT
      ?AUTO_3198 - WAYPOINT
      ?AUTO_3201 - ROVER
      ?AUTO_3196 - CAMERA
      ?AUTO_3200 - WAYPOINT
      ?AUTO_3202 - WAYPOINT
      ?AUTO_3203 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3199 ?AUTO_3197 ) ( VISIBLE ?AUTO_3198 ?AUTO_3197 ) ( AVAILABLE ?AUTO_3201 ) ( CHANNEL_FREE ?AUTO_3199 ) ( not ( = ?AUTO_3198 ?AUTO_3197 ) ) ( ON_BOARD ?AUTO_3196 ?AUTO_3201 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3201 ) ( SUPPORTS ?AUTO_3196 ?AUTO_3195 ) ( VISIBLE_FROM ?AUTO_3194 ?AUTO_3198 ) ( CALIBRATION_TARGET ?AUTO_3196 ?AUTO_3194 ) ( CAN_TRAVERSE ?AUTO_3201 ?AUTO_3200 ?AUTO_3198 ) ( VISIBLE ?AUTO_3200 ?AUTO_3198 ) ( not ( = ?AUTO_3197 ?AUTO_3200 ) ) ( not ( = ?AUTO_3198 ?AUTO_3200 ) ) ( CAN_TRAVERSE ?AUTO_3201 ?AUTO_3197 ?AUTO_3200 ) ( VISIBLE ?AUTO_3197 ?AUTO_3200 ) ( CAN_TRAVERSE ?AUTO_3201 ?AUTO_3202 ?AUTO_3197 ) ( VISIBLE ?AUTO_3202 ?AUTO_3197 ) ( not ( = ?AUTO_3197 ?AUTO_3202 ) ) ( not ( = ?AUTO_3198 ?AUTO_3202 ) ) ( not ( = ?AUTO_3200 ?AUTO_3202 ) ) ( CAN_TRAVERSE ?AUTO_3201 ?AUTO_3203 ?AUTO_3202 ) ( AT ?AUTO_3201 ?AUTO_3203 ) ( VISIBLE ?AUTO_3203 ?AUTO_3202 ) ( not ( = ?AUTO_3197 ?AUTO_3203 ) ) ( not ( = ?AUTO_3198 ?AUTO_3203 ) ) ( not ( = ?AUTO_3200 ?AUTO_3203 ) ) ( not ( = ?AUTO_3202 ?AUTO_3203 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3201 ?AUTO_3203 ?AUTO_3202 )
      ( GET_IMAGE_DATA ?AUTO_3194 ?AUTO_3195 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3194 ?AUTO_3195 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3206 - OBJECTIVE
      ?AUTO_3207 - MODE
    )
    :vars
    (
      ?AUTO_3208 - LANDER
      ?AUTO_3209 - WAYPOINT
      ?AUTO_3212 - WAYPOINT
      ?AUTO_3213 - ROVER
      ?AUTO_3210 - CAMERA
      ?AUTO_3211 - WAYPOINT
      ?AUTO_3215 - WAYPOINT
      ?AUTO_3214 - WAYPOINT
      ?AUTO_3216 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3208 ?AUTO_3209 ) ( VISIBLE ?AUTO_3212 ?AUTO_3209 ) ( AVAILABLE ?AUTO_3213 ) ( CHANNEL_FREE ?AUTO_3208 ) ( not ( = ?AUTO_3212 ?AUTO_3209 ) ) ( ON_BOARD ?AUTO_3210 ?AUTO_3213 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3213 ) ( SUPPORTS ?AUTO_3210 ?AUTO_3207 ) ( VISIBLE_FROM ?AUTO_3206 ?AUTO_3212 ) ( CALIBRATION_TARGET ?AUTO_3210 ?AUTO_3206 ) ( CAN_TRAVERSE ?AUTO_3213 ?AUTO_3211 ?AUTO_3212 ) ( VISIBLE ?AUTO_3211 ?AUTO_3212 ) ( not ( = ?AUTO_3209 ?AUTO_3211 ) ) ( not ( = ?AUTO_3212 ?AUTO_3211 ) ) ( CAN_TRAVERSE ?AUTO_3213 ?AUTO_3209 ?AUTO_3211 ) ( VISIBLE ?AUTO_3209 ?AUTO_3211 ) ( CAN_TRAVERSE ?AUTO_3213 ?AUTO_3215 ?AUTO_3209 ) ( VISIBLE ?AUTO_3215 ?AUTO_3209 ) ( not ( = ?AUTO_3209 ?AUTO_3215 ) ) ( not ( = ?AUTO_3212 ?AUTO_3215 ) ) ( not ( = ?AUTO_3211 ?AUTO_3215 ) ) ( CAN_TRAVERSE ?AUTO_3213 ?AUTO_3214 ?AUTO_3215 ) ( VISIBLE ?AUTO_3214 ?AUTO_3215 ) ( not ( = ?AUTO_3209 ?AUTO_3214 ) ) ( not ( = ?AUTO_3212 ?AUTO_3214 ) ) ( not ( = ?AUTO_3211 ?AUTO_3214 ) ) ( not ( = ?AUTO_3215 ?AUTO_3214 ) ) ( CAN_TRAVERSE ?AUTO_3213 ?AUTO_3216 ?AUTO_3214 ) ( AT ?AUTO_3213 ?AUTO_3216 ) ( VISIBLE ?AUTO_3216 ?AUTO_3214 ) ( not ( = ?AUTO_3209 ?AUTO_3216 ) ) ( not ( = ?AUTO_3212 ?AUTO_3216 ) ) ( not ( = ?AUTO_3211 ?AUTO_3216 ) ) ( not ( = ?AUTO_3215 ?AUTO_3216 ) ) ( not ( = ?AUTO_3214 ?AUTO_3216 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3213 ?AUTO_3216 ?AUTO_3214 )
      ( GET_IMAGE_DATA ?AUTO_3206 ?AUTO_3207 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3206 ?AUTO_3207 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3320 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3322 - LANDER
      ?AUTO_3321 - WAYPOINT
      ?AUTO_3324 - ROVER
      ?AUTO_3325 - STORE
      ?AUTO_3323 - WAYPOINT
      ?AUTO_3326 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3322 ?AUTO_3320 ) ( VISIBLE ?AUTO_3321 ?AUTO_3320 ) ( AVAILABLE ?AUTO_3324 ) ( CHANNEL_FREE ?AUTO_3322 ) ( not ( = ?AUTO_3320 ?AUTO_3321 ) ) ( CAN_TRAVERSE ?AUTO_3324 ?AUTO_3320 ?AUTO_3321 ) ( VISIBLE ?AUTO_3320 ?AUTO_3321 ) ( AT_ROCK_SAMPLE ?AUTO_3320 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3324 ) ( STORE_OF ?AUTO_3325 ?AUTO_3324 ) ( EMPTY ?AUTO_3325 ) ( CAN_TRAVERSE ?AUTO_3324 ?AUTO_3323 ?AUTO_3320 ) ( VISIBLE ?AUTO_3323 ?AUTO_3320 ) ( not ( = ?AUTO_3320 ?AUTO_3323 ) ) ( not ( = ?AUTO_3321 ?AUTO_3323 ) ) ( CAN_TRAVERSE ?AUTO_3324 ?AUTO_3326 ?AUTO_3323 ) ( AT ?AUTO_3324 ?AUTO_3326 ) ( VISIBLE ?AUTO_3326 ?AUTO_3323 ) ( not ( = ?AUTO_3320 ?AUTO_3326 ) ) ( not ( = ?AUTO_3321 ?AUTO_3326 ) ) ( not ( = ?AUTO_3323 ?AUTO_3326 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3324 ?AUTO_3326 ?AUTO_3323 )
      ( GET_ROCK_DATA ?AUTO_3320 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3320 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3369 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3370 - LANDER
      ?AUTO_3373 - WAYPOINT
      ?AUTO_3374 - ROVER
      ?AUTO_3371 - STORE
      ?AUTO_3372 - WAYPOINT
      ?AUTO_3375 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3370 ?AUTO_3373 ) ( VISIBLE ?AUTO_3369 ?AUTO_3373 ) ( AVAILABLE ?AUTO_3374 ) ( CHANNEL_FREE ?AUTO_3370 ) ( not ( = ?AUTO_3369 ?AUTO_3373 ) ) ( AT_SOIL_SAMPLE ?AUTO_3369 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3374 ) ( STORE_OF ?AUTO_3371 ?AUTO_3374 ) ( EMPTY ?AUTO_3371 ) ( CAN_TRAVERSE ?AUTO_3374 ?AUTO_3373 ?AUTO_3369 ) ( VISIBLE ?AUTO_3373 ?AUTO_3369 ) ( CAN_TRAVERSE ?AUTO_3374 ?AUTO_3372 ?AUTO_3373 ) ( VISIBLE ?AUTO_3372 ?AUTO_3373 ) ( not ( = ?AUTO_3369 ?AUTO_3372 ) ) ( not ( = ?AUTO_3373 ?AUTO_3372 ) ) ( CAN_TRAVERSE ?AUTO_3374 ?AUTO_3375 ?AUTO_3372 ) ( AT ?AUTO_3374 ?AUTO_3375 ) ( VISIBLE ?AUTO_3375 ?AUTO_3372 ) ( not ( = ?AUTO_3369 ?AUTO_3375 ) ) ( not ( = ?AUTO_3373 ?AUTO_3375 ) ) ( not ( = ?AUTO_3372 ?AUTO_3375 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3374 ?AUTO_3375 ?AUTO_3372 )
      ( GET_SOIL_DATA ?AUTO_3369 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3369 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3408 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3412 - LANDER
      ?AUTO_3410 - WAYPOINT
      ?AUTO_3413 - WAYPOINT
      ?AUTO_3409 - ROVER
      ?AUTO_3411 - STORE
      ?AUTO_3414 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3412 ?AUTO_3410 ) ( VISIBLE ?AUTO_3413 ?AUTO_3410 ) ( AVAILABLE ?AUTO_3409 ) ( CHANNEL_FREE ?AUTO_3412 ) ( not ( = ?AUTO_3408 ?AUTO_3413 ) ) ( not ( = ?AUTO_3408 ?AUTO_3410 ) ) ( not ( = ?AUTO_3413 ?AUTO_3410 ) ) ( CAN_TRAVERSE ?AUTO_3409 ?AUTO_3408 ?AUTO_3413 ) ( VISIBLE ?AUTO_3408 ?AUTO_3413 ) ( AT_ROCK_SAMPLE ?AUTO_3408 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3409 ) ( STORE_OF ?AUTO_3411 ?AUTO_3409 ) ( EMPTY ?AUTO_3411 ) ( CAN_TRAVERSE ?AUTO_3409 ?AUTO_3413 ?AUTO_3408 ) ( VISIBLE ?AUTO_3413 ?AUTO_3408 ) ( CAN_TRAVERSE ?AUTO_3409 ?AUTO_3410 ?AUTO_3413 ) ( VISIBLE ?AUTO_3410 ?AUTO_3413 ) ( CAN_TRAVERSE ?AUTO_3409 ?AUTO_3414 ?AUTO_3410 ) ( AT ?AUTO_3409 ?AUTO_3414 ) ( VISIBLE ?AUTO_3414 ?AUTO_3410 ) ( not ( = ?AUTO_3408 ?AUTO_3414 ) ) ( not ( = ?AUTO_3410 ?AUTO_3414 ) ) ( not ( = ?AUTO_3413 ?AUTO_3414 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3409 ?AUTO_3414 ?AUTO_3410 )
      ( GET_ROCK_DATA ?AUTO_3408 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3408 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3415 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3419 - LANDER
      ?AUTO_3416 - WAYPOINT
      ?AUTO_3420 - WAYPOINT
      ?AUTO_3421 - ROVER
      ?AUTO_3418 - STORE
      ?AUTO_3417 - WAYPOINT
      ?AUTO_3422 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3419 ?AUTO_3416 ) ( VISIBLE ?AUTO_3420 ?AUTO_3416 ) ( AVAILABLE ?AUTO_3421 ) ( CHANNEL_FREE ?AUTO_3419 ) ( not ( = ?AUTO_3415 ?AUTO_3420 ) ) ( not ( = ?AUTO_3415 ?AUTO_3416 ) ) ( not ( = ?AUTO_3420 ?AUTO_3416 ) ) ( CAN_TRAVERSE ?AUTO_3421 ?AUTO_3415 ?AUTO_3420 ) ( VISIBLE ?AUTO_3415 ?AUTO_3420 ) ( AT_ROCK_SAMPLE ?AUTO_3415 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3421 ) ( STORE_OF ?AUTO_3418 ?AUTO_3421 ) ( EMPTY ?AUTO_3418 ) ( CAN_TRAVERSE ?AUTO_3421 ?AUTO_3420 ?AUTO_3415 ) ( VISIBLE ?AUTO_3420 ?AUTO_3415 ) ( CAN_TRAVERSE ?AUTO_3421 ?AUTO_3416 ?AUTO_3420 ) ( VISIBLE ?AUTO_3416 ?AUTO_3420 ) ( CAN_TRAVERSE ?AUTO_3421 ?AUTO_3417 ?AUTO_3416 ) ( VISIBLE ?AUTO_3417 ?AUTO_3416 ) ( not ( = ?AUTO_3415 ?AUTO_3417 ) ) ( not ( = ?AUTO_3416 ?AUTO_3417 ) ) ( not ( = ?AUTO_3420 ?AUTO_3417 ) ) ( CAN_TRAVERSE ?AUTO_3421 ?AUTO_3422 ?AUTO_3417 ) ( AT ?AUTO_3421 ?AUTO_3422 ) ( VISIBLE ?AUTO_3422 ?AUTO_3417 ) ( not ( = ?AUTO_3415 ?AUTO_3422 ) ) ( not ( = ?AUTO_3416 ?AUTO_3422 ) ) ( not ( = ?AUTO_3420 ?AUTO_3422 ) ) ( not ( = ?AUTO_3417 ?AUTO_3422 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3421 ?AUTO_3422 ?AUTO_3417 )
      ( GET_ROCK_DATA ?AUTO_3415 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3415 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3452 - OBJECTIVE
      ?AUTO_3453 - MODE
    )
    :vars
    (
      ?AUTO_3459 - LANDER
      ?AUTO_3454 - WAYPOINT
      ?AUTO_3458 - WAYPOINT
      ?AUTO_3455 - ROVER
      ?AUTO_3457 - WAYPOINT
      ?AUTO_3456 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3459 ?AUTO_3454 ) ( VISIBLE ?AUTO_3458 ?AUTO_3454 ) ( AVAILABLE ?AUTO_3455 ) ( CHANNEL_FREE ?AUTO_3459 ) ( not ( = ?AUTO_3458 ?AUTO_3454 ) ) ( CAN_TRAVERSE ?AUTO_3455 ?AUTO_3457 ?AUTO_3458 ) ( VISIBLE ?AUTO_3457 ?AUTO_3458 ) ( not ( = ?AUTO_3454 ?AUTO_3457 ) ) ( not ( = ?AUTO_3458 ?AUTO_3457 ) ) ( CALIBRATED ?AUTO_3456 ?AUTO_3455 ) ( ON_BOARD ?AUTO_3456 ?AUTO_3455 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3455 ) ( SUPPORTS ?AUTO_3456 ?AUTO_3453 ) ( VISIBLE_FROM ?AUTO_3452 ?AUTO_3457 ) ( CAN_TRAVERSE ?AUTO_3455 ?AUTO_3458 ?AUTO_3457 ) ( AT ?AUTO_3455 ?AUTO_3458 ) ( VISIBLE ?AUTO_3458 ?AUTO_3457 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3455 ?AUTO_3458 ?AUTO_3457 )
      ( GET_IMAGE_DATA ?AUTO_3452 ?AUTO_3453 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3452 ?AUTO_3453 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3460 - OBJECTIVE
      ?AUTO_3461 - MODE
    )
    :vars
    (
      ?AUTO_3462 - LANDER
      ?AUTO_3466 - WAYPOINT
      ?AUTO_3464 - WAYPOINT
      ?AUTO_3463 - ROVER
      ?AUTO_3465 - WAYPOINT
      ?AUTO_3467 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3462 ?AUTO_3466 ) ( VISIBLE ?AUTO_3464 ?AUTO_3466 ) ( AVAILABLE ?AUTO_3463 ) ( CHANNEL_FREE ?AUTO_3462 ) ( not ( = ?AUTO_3464 ?AUTO_3466 ) ) ( CAN_TRAVERSE ?AUTO_3463 ?AUTO_3465 ?AUTO_3464 ) ( VISIBLE ?AUTO_3465 ?AUTO_3464 ) ( not ( = ?AUTO_3466 ?AUTO_3465 ) ) ( not ( = ?AUTO_3464 ?AUTO_3465 ) ) ( CALIBRATED ?AUTO_3467 ?AUTO_3463 ) ( ON_BOARD ?AUTO_3467 ?AUTO_3463 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3463 ) ( SUPPORTS ?AUTO_3467 ?AUTO_3461 ) ( VISIBLE_FROM ?AUTO_3460 ?AUTO_3465 ) ( CAN_TRAVERSE ?AUTO_3463 ?AUTO_3464 ?AUTO_3465 ) ( VISIBLE ?AUTO_3464 ?AUTO_3465 ) ( CAN_TRAVERSE ?AUTO_3463 ?AUTO_3466 ?AUTO_3464 ) ( AT ?AUTO_3463 ?AUTO_3466 ) ( VISIBLE ?AUTO_3466 ?AUTO_3464 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3463 ?AUTO_3466 ?AUTO_3464 )
      ( GET_IMAGE_DATA ?AUTO_3460 ?AUTO_3461 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3460 ?AUTO_3461 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3468 - OBJECTIVE
      ?AUTO_3469 - MODE
    )
    :vars
    (
      ?AUTO_3475 - LANDER
      ?AUTO_3471 - WAYPOINT
      ?AUTO_3473 - WAYPOINT
      ?AUTO_3472 - ROVER
      ?AUTO_3474 - WAYPOINT
      ?AUTO_3470 - CAMERA
      ?AUTO_3476 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3475 ?AUTO_3471 ) ( VISIBLE ?AUTO_3473 ?AUTO_3471 ) ( AVAILABLE ?AUTO_3472 ) ( CHANNEL_FREE ?AUTO_3475 ) ( not ( = ?AUTO_3473 ?AUTO_3471 ) ) ( CAN_TRAVERSE ?AUTO_3472 ?AUTO_3474 ?AUTO_3473 ) ( VISIBLE ?AUTO_3474 ?AUTO_3473 ) ( not ( = ?AUTO_3471 ?AUTO_3474 ) ) ( not ( = ?AUTO_3473 ?AUTO_3474 ) ) ( ON_BOARD ?AUTO_3470 ?AUTO_3472 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3472 ) ( SUPPORTS ?AUTO_3470 ?AUTO_3469 ) ( VISIBLE_FROM ?AUTO_3468 ?AUTO_3474 ) ( CAN_TRAVERSE ?AUTO_3472 ?AUTO_3473 ?AUTO_3474 ) ( VISIBLE ?AUTO_3473 ?AUTO_3474 ) ( CAN_TRAVERSE ?AUTO_3472 ?AUTO_3471 ?AUTO_3473 ) ( AT ?AUTO_3472 ?AUTO_3471 ) ( VISIBLE ?AUTO_3471 ?AUTO_3473 ) ( CALIBRATION_TARGET ?AUTO_3470 ?AUTO_3476 ) ( VISIBLE_FROM ?AUTO_3476 ?AUTO_3471 ) ( not ( = ?AUTO_3468 ?AUTO_3476 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3472 ?AUTO_3470 ?AUTO_3476 ?AUTO_3471 )
      ( GET_IMAGE_DATA ?AUTO_3468 ?AUTO_3469 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3468 ?AUTO_3469 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3477 - OBJECTIVE
      ?AUTO_3478 - MODE
    )
    :vars
    (
      ?AUTO_3482 - LANDER
      ?AUTO_3483 - WAYPOINT
      ?AUTO_3484 - WAYPOINT
      ?AUTO_3485 - ROVER
      ?AUTO_3480 - WAYPOINT
      ?AUTO_3481 - CAMERA
      ?AUTO_3479 - OBJECTIVE
      ?AUTO_3486 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3482 ?AUTO_3483 ) ( VISIBLE ?AUTO_3484 ?AUTO_3483 ) ( AVAILABLE ?AUTO_3485 ) ( CHANNEL_FREE ?AUTO_3482 ) ( not ( = ?AUTO_3484 ?AUTO_3483 ) ) ( CAN_TRAVERSE ?AUTO_3485 ?AUTO_3480 ?AUTO_3484 ) ( VISIBLE ?AUTO_3480 ?AUTO_3484 ) ( not ( = ?AUTO_3483 ?AUTO_3480 ) ) ( not ( = ?AUTO_3484 ?AUTO_3480 ) ) ( ON_BOARD ?AUTO_3481 ?AUTO_3485 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3485 ) ( SUPPORTS ?AUTO_3481 ?AUTO_3478 ) ( VISIBLE_FROM ?AUTO_3477 ?AUTO_3480 ) ( CAN_TRAVERSE ?AUTO_3485 ?AUTO_3484 ?AUTO_3480 ) ( VISIBLE ?AUTO_3484 ?AUTO_3480 ) ( CAN_TRAVERSE ?AUTO_3485 ?AUTO_3483 ?AUTO_3484 ) ( VISIBLE ?AUTO_3483 ?AUTO_3484 ) ( CALIBRATION_TARGET ?AUTO_3481 ?AUTO_3479 ) ( VISIBLE_FROM ?AUTO_3479 ?AUTO_3483 ) ( not ( = ?AUTO_3477 ?AUTO_3479 ) ) ( CAN_TRAVERSE ?AUTO_3485 ?AUTO_3486 ?AUTO_3483 ) ( AT ?AUTO_3485 ?AUTO_3486 ) ( VISIBLE ?AUTO_3486 ?AUTO_3483 ) ( not ( = ?AUTO_3483 ?AUTO_3486 ) ) ( not ( = ?AUTO_3484 ?AUTO_3486 ) ) ( not ( = ?AUTO_3480 ?AUTO_3486 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3485 ?AUTO_3486 ?AUTO_3483 )
      ( GET_IMAGE_DATA ?AUTO_3477 ?AUTO_3478 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3477 ?AUTO_3478 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3487 - OBJECTIVE
      ?AUTO_3488 - MODE
    )
    :vars
    (
      ?AUTO_3493 - LANDER
      ?AUTO_3494 - WAYPOINT
      ?AUTO_3495 - WAYPOINT
      ?AUTO_3492 - ROVER
      ?AUTO_3489 - WAYPOINT
      ?AUTO_3491 - CAMERA
      ?AUTO_3490 - OBJECTIVE
      ?AUTO_3496 - WAYPOINT
      ?AUTO_3497 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3493 ?AUTO_3494 ) ( VISIBLE ?AUTO_3495 ?AUTO_3494 ) ( AVAILABLE ?AUTO_3492 ) ( CHANNEL_FREE ?AUTO_3493 ) ( not ( = ?AUTO_3495 ?AUTO_3494 ) ) ( CAN_TRAVERSE ?AUTO_3492 ?AUTO_3489 ?AUTO_3495 ) ( VISIBLE ?AUTO_3489 ?AUTO_3495 ) ( not ( = ?AUTO_3494 ?AUTO_3489 ) ) ( not ( = ?AUTO_3495 ?AUTO_3489 ) ) ( ON_BOARD ?AUTO_3491 ?AUTO_3492 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3492 ) ( SUPPORTS ?AUTO_3491 ?AUTO_3488 ) ( VISIBLE_FROM ?AUTO_3487 ?AUTO_3489 ) ( CAN_TRAVERSE ?AUTO_3492 ?AUTO_3495 ?AUTO_3489 ) ( VISIBLE ?AUTO_3495 ?AUTO_3489 ) ( CAN_TRAVERSE ?AUTO_3492 ?AUTO_3494 ?AUTO_3495 ) ( VISIBLE ?AUTO_3494 ?AUTO_3495 ) ( CALIBRATION_TARGET ?AUTO_3491 ?AUTO_3490 ) ( VISIBLE_FROM ?AUTO_3490 ?AUTO_3494 ) ( not ( = ?AUTO_3487 ?AUTO_3490 ) ) ( CAN_TRAVERSE ?AUTO_3492 ?AUTO_3496 ?AUTO_3494 ) ( VISIBLE ?AUTO_3496 ?AUTO_3494 ) ( not ( = ?AUTO_3494 ?AUTO_3496 ) ) ( not ( = ?AUTO_3495 ?AUTO_3496 ) ) ( not ( = ?AUTO_3489 ?AUTO_3496 ) ) ( CAN_TRAVERSE ?AUTO_3492 ?AUTO_3497 ?AUTO_3496 ) ( AT ?AUTO_3492 ?AUTO_3497 ) ( VISIBLE ?AUTO_3497 ?AUTO_3496 ) ( not ( = ?AUTO_3494 ?AUTO_3497 ) ) ( not ( = ?AUTO_3495 ?AUTO_3497 ) ) ( not ( = ?AUTO_3489 ?AUTO_3497 ) ) ( not ( = ?AUTO_3496 ?AUTO_3497 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3492 ?AUTO_3497 ?AUTO_3496 )
      ( GET_IMAGE_DATA ?AUTO_3487 ?AUTO_3488 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3487 ?AUTO_3488 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3547 - OBJECTIVE
      ?AUTO_3548 - MODE
    )
    :vars
    (
      ?AUTO_3549 - LANDER
      ?AUTO_3552 - WAYPOINT
      ?AUTO_3553 - WAYPOINT
      ?AUTO_3551 - ROVER
      ?AUTO_3550 - CAMERA
      ?AUTO_3554 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3549 ?AUTO_3552 ) ( VISIBLE ?AUTO_3553 ?AUTO_3552 ) ( AVAILABLE ?AUTO_3551 ) ( CHANNEL_FREE ?AUTO_3549 ) ( not ( = ?AUTO_3553 ?AUTO_3552 ) ) ( ON_BOARD ?AUTO_3550 ?AUTO_3551 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3551 ) ( SUPPORTS ?AUTO_3550 ?AUTO_3548 ) ( VISIBLE_FROM ?AUTO_3547 ?AUTO_3553 ) ( CALIBRATION_TARGET ?AUTO_3550 ?AUTO_3547 ) ( CAN_TRAVERSE ?AUTO_3551 ?AUTO_3552 ?AUTO_3553 ) ( VISIBLE ?AUTO_3552 ?AUTO_3553 ) ( CAN_TRAVERSE ?AUTO_3551 ?AUTO_3554 ?AUTO_3552 ) ( AT ?AUTO_3551 ?AUTO_3554 ) ( VISIBLE ?AUTO_3554 ?AUTO_3552 ) ( not ( = ?AUTO_3552 ?AUTO_3554 ) ) ( not ( = ?AUTO_3553 ?AUTO_3554 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3551 ?AUTO_3554 ?AUTO_3552 )
      ( GET_IMAGE_DATA ?AUTO_3547 ?AUTO_3548 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3547 ?AUTO_3548 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3555 - OBJECTIVE
      ?AUTO_3556 - MODE
    )
    :vars
    (
      ?AUTO_3561 - LANDER
      ?AUTO_3560 - WAYPOINT
      ?AUTO_3562 - WAYPOINT
      ?AUTO_3559 - ROVER
      ?AUTO_3558 - CAMERA
      ?AUTO_3557 - WAYPOINT
      ?AUTO_3563 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3561 ?AUTO_3560 ) ( VISIBLE ?AUTO_3562 ?AUTO_3560 ) ( AVAILABLE ?AUTO_3559 ) ( CHANNEL_FREE ?AUTO_3561 ) ( not ( = ?AUTO_3562 ?AUTO_3560 ) ) ( ON_BOARD ?AUTO_3558 ?AUTO_3559 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3559 ) ( SUPPORTS ?AUTO_3558 ?AUTO_3556 ) ( VISIBLE_FROM ?AUTO_3555 ?AUTO_3562 ) ( CALIBRATION_TARGET ?AUTO_3558 ?AUTO_3555 ) ( CAN_TRAVERSE ?AUTO_3559 ?AUTO_3560 ?AUTO_3562 ) ( VISIBLE ?AUTO_3560 ?AUTO_3562 ) ( CAN_TRAVERSE ?AUTO_3559 ?AUTO_3557 ?AUTO_3560 ) ( VISIBLE ?AUTO_3557 ?AUTO_3560 ) ( not ( = ?AUTO_3560 ?AUTO_3557 ) ) ( not ( = ?AUTO_3562 ?AUTO_3557 ) ) ( CAN_TRAVERSE ?AUTO_3559 ?AUTO_3563 ?AUTO_3557 ) ( AT ?AUTO_3559 ?AUTO_3563 ) ( VISIBLE ?AUTO_3563 ?AUTO_3557 ) ( not ( = ?AUTO_3560 ?AUTO_3563 ) ) ( not ( = ?AUTO_3562 ?AUTO_3563 ) ) ( not ( = ?AUTO_3557 ?AUTO_3563 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3559 ?AUTO_3563 ?AUTO_3557 )
      ( GET_IMAGE_DATA ?AUTO_3555 ?AUTO_3556 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3555 ?AUTO_3556 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3646 - OBJECTIVE
      ?AUTO_3647 - MODE
    )
    :vars
    (
      ?AUTO_3652 - LANDER
      ?AUTO_3650 - WAYPOINT
      ?AUTO_3653 - WAYPOINT
      ?AUTO_3651 - ROVER
      ?AUTO_3649 - WAYPOINT
      ?AUTO_3648 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3652 ?AUTO_3650 ) ( VISIBLE ?AUTO_3653 ?AUTO_3650 ) ( AVAILABLE ?AUTO_3651 ) ( CHANNEL_FREE ?AUTO_3652 ) ( not ( = ?AUTO_3653 ?AUTO_3650 ) ) ( CAN_TRAVERSE ?AUTO_3651 ?AUTO_3649 ?AUTO_3653 ) ( VISIBLE ?AUTO_3649 ?AUTO_3653 ) ( not ( = ?AUTO_3650 ?AUTO_3649 ) ) ( not ( = ?AUTO_3653 ?AUTO_3649 ) ) ( ON_BOARD ?AUTO_3648 ?AUTO_3651 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3651 ) ( SUPPORTS ?AUTO_3648 ?AUTO_3647 ) ( VISIBLE_FROM ?AUTO_3646 ?AUTO_3649 ) ( CALIBRATION_TARGET ?AUTO_3648 ?AUTO_3646 ) ( CAN_TRAVERSE ?AUTO_3651 ?AUTO_3653 ?AUTO_3649 ) ( AT ?AUTO_3651 ?AUTO_3653 ) ( VISIBLE ?AUTO_3653 ?AUTO_3649 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3651 ?AUTO_3653 ?AUTO_3649 )
      ( GET_IMAGE_DATA ?AUTO_3646 ?AUTO_3647 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3646 ?AUTO_3647 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3763 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3765 - LANDER
      ?AUTO_3766 - WAYPOINT
      ?AUTO_3767 - WAYPOINT
      ?AUTO_3764 - ROVER
      ?AUTO_3768 - STORE
      ?AUTO_3769 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3765 ?AUTO_3766 ) ( VISIBLE ?AUTO_3767 ?AUTO_3766 ) ( AVAILABLE ?AUTO_3764 ) ( CHANNEL_FREE ?AUTO_3765 ) ( not ( = ?AUTO_3763 ?AUTO_3767 ) ) ( not ( = ?AUTO_3763 ?AUTO_3766 ) ) ( not ( = ?AUTO_3767 ?AUTO_3766 ) ) ( CAN_TRAVERSE ?AUTO_3764 ?AUTO_3763 ?AUTO_3767 ) ( VISIBLE ?AUTO_3763 ?AUTO_3767 ) ( AT_ROCK_SAMPLE ?AUTO_3763 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3764 ) ( STORE_OF ?AUTO_3768 ?AUTO_3764 ) ( EMPTY ?AUTO_3768 ) ( CAN_TRAVERSE ?AUTO_3764 ?AUTO_3769 ?AUTO_3763 ) ( AT ?AUTO_3764 ?AUTO_3769 ) ( VISIBLE ?AUTO_3769 ?AUTO_3763 ) ( not ( = ?AUTO_3763 ?AUTO_3769 ) ) ( not ( = ?AUTO_3766 ?AUTO_3769 ) ) ( not ( = ?AUTO_3767 ?AUTO_3769 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3764 ?AUTO_3769 ?AUTO_3763 )
      ( GET_ROCK_DATA ?AUTO_3763 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3763 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3771 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3777 - LANDER
      ?AUTO_3773 - WAYPOINT
      ?AUTO_3772 - WAYPOINT
      ?AUTO_3775 - ROVER
      ?AUTO_3774 - STORE
      ?AUTO_3776 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3777 ?AUTO_3773 ) ( VISIBLE ?AUTO_3772 ?AUTO_3773 ) ( AVAILABLE ?AUTO_3775 ) ( CHANNEL_FREE ?AUTO_3777 ) ( not ( = ?AUTO_3771 ?AUTO_3772 ) ) ( not ( = ?AUTO_3771 ?AUTO_3773 ) ) ( not ( = ?AUTO_3772 ?AUTO_3773 ) ) ( CAN_TRAVERSE ?AUTO_3775 ?AUTO_3771 ?AUTO_3772 ) ( VISIBLE ?AUTO_3771 ?AUTO_3772 ) ( AT_ROCK_SAMPLE ?AUTO_3771 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3775 ) ( STORE_OF ?AUTO_3774 ?AUTO_3775 ) ( EMPTY ?AUTO_3774 ) ( CAN_TRAVERSE ?AUTO_3775 ?AUTO_3776 ?AUTO_3771 ) ( VISIBLE ?AUTO_3776 ?AUTO_3771 ) ( not ( = ?AUTO_3771 ?AUTO_3776 ) ) ( not ( = ?AUTO_3773 ?AUTO_3776 ) ) ( not ( = ?AUTO_3772 ?AUTO_3776 ) ) ( CAN_TRAVERSE ?AUTO_3775 ?AUTO_3773 ?AUTO_3776 ) ( AT ?AUTO_3775 ?AUTO_3773 ) ( VISIBLE ?AUTO_3773 ?AUTO_3776 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3775 ?AUTO_3773 ?AUTO_3776 )
      ( GET_ROCK_DATA ?AUTO_3771 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3771 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3778 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3780 - LANDER
      ?AUTO_3782 - WAYPOINT
      ?AUTO_3781 - WAYPOINT
      ?AUTO_3779 - ROVER
      ?AUTO_3783 - STORE
      ?AUTO_3784 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3780 ?AUTO_3782 ) ( VISIBLE ?AUTO_3781 ?AUTO_3782 ) ( AVAILABLE ?AUTO_3779 ) ( CHANNEL_FREE ?AUTO_3780 ) ( not ( = ?AUTO_3778 ?AUTO_3781 ) ) ( not ( = ?AUTO_3778 ?AUTO_3782 ) ) ( not ( = ?AUTO_3781 ?AUTO_3782 ) ) ( CAN_TRAVERSE ?AUTO_3779 ?AUTO_3778 ?AUTO_3781 ) ( VISIBLE ?AUTO_3778 ?AUTO_3781 ) ( AT_ROCK_SAMPLE ?AUTO_3778 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3779 ) ( STORE_OF ?AUTO_3783 ?AUTO_3779 ) ( CAN_TRAVERSE ?AUTO_3779 ?AUTO_3784 ?AUTO_3778 ) ( VISIBLE ?AUTO_3784 ?AUTO_3778 ) ( not ( = ?AUTO_3778 ?AUTO_3784 ) ) ( not ( = ?AUTO_3782 ?AUTO_3784 ) ) ( not ( = ?AUTO_3781 ?AUTO_3784 ) ) ( CAN_TRAVERSE ?AUTO_3779 ?AUTO_3782 ?AUTO_3784 ) ( AT ?AUTO_3779 ?AUTO_3782 ) ( VISIBLE ?AUTO_3782 ?AUTO_3784 ) ( FULL ?AUTO_3783 ) )
    :subtasks
    ( ( !DROP ?AUTO_3779 ?AUTO_3783 )
      ( GET_ROCK_DATA ?AUTO_3778 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3778 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3877 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3882 - LANDER
      ?AUTO_3878 - WAYPOINT
      ?AUTO_3883 - ROVER
      ?AUTO_3879 - STORE
      ?AUTO_3880 - WAYPOINT
      ?AUTO_3881 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3882 ?AUTO_3878 ) ( VISIBLE ?AUTO_3877 ?AUTO_3878 ) ( AVAILABLE ?AUTO_3883 ) ( CHANNEL_FREE ?AUTO_3882 ) ( not ( = ?AUTO_3877 ?AUTO_3878 ) ) ( AT_ROCK_SAMPLE ?AUTO_3877 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3883 ) ( STORE_OF ?AUTO_3879 ?AUTO_3883 ) ( CAN_TRAVERSE ?AUTO_3883 ?AUTO_3880 ?AUTO_3877 ) ( VISIBLE ?AUTO_3880 ?AUTO_3877 ) ( not ( = ?AUTO_3877 ?AUTO_3880 ) ) ( not ( = ?AUTO_3878 ?AUTO_3880 ) ) ( AT_ROCK_SAMPLE ?AUTO_3880 ) ( CAN_TRAVERSE ?AUTO_3883 ?AUTO_3881 ?AUTO_3880 ) ( AT ?AUTO_3883 ?AUTO_3881 ) ( VISIBLE ?AUTO_3881 ?AUTO_3880 ) ( not ( = ?AUTO_3877 ?AUTO_3881 ) ) ( not ( = ?AUTO_3878 ?AUTO_3881 ) ) ( not ( = ?AUTO_3880 ?AUTO_3881 ) ) ( FULL ?AUTO_3879 ) )
    :subtasks
    ( ( !DROP ?AUTO_3883 ?AUTO_3879 )
      ( GET_ROCK_DATA ?AUTO_3877 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3877 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3894 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3897 - LANDER
      ?AUTO_3895 - WAYPOINT
      ?AUTO_3900 - ROVER
      ?AUTO_3896 - STORE
      ?AUTO_3898 - WAYPOINT
      ?AUTO_3899 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3897 ?AUTO_3895 ) ( VISIBLE ?AUTO_3894 ?AUTO_3895 ) ( AVAILABLE ?AUTO_3900 ) ( CHANNEL_FREE ?AUTO_3897 ) ( not ( = ?AUTO_3894 ?AUTO_3895 ) ) ( AT_ROCK_SAMPLE ?AUTO_3894 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3900 ) ( STORE_OF ?AUTO_3896 ?AUTO_3900 ) ( CAN_TRAVERSE ?AUTO_3900 ?AUTO_3898 ?AUTO_3894 ) ( VISIBLE ?AUTO_3898 ?AUTO_3894 ) ( not ( = ?AUTO_3894 ?AUTO_3898 ) ) ( not ( = ?AUTO_3895 ?AUTO_3898 ) ) ( AT_ROCK_SAMPLE ?AUTO_3898 ) ( CAN_TRAVERSE ?AUTO_3900 ?AUTO_3899 ?AUTO_3898 ) ( VISIBLE ?AUTO_3899 ?AUTO_3898 ) ( not ( = ?AUTO_3894 ?AUTO_3899 ) ) ( not ( = ?AUTO_3895 ?AUTO_3899 ) ) ( not ( = ?AUTO_3898 ?AUTO_3899 ) ) ( CAN_TRAVERSE ?AUTO_3900 ?AUTO_3895 ?AUTO_3899 ) ( AT ?AUTO_3900 ?AUTO_3895 ) ( VISIBLE ?AUTO_3895 ?AUTO_3899 ) ( FULL ?AUTO_3896 ) )
    :subtasks
    ( ( !DROP ?AUTO_3900 ?AUTO_3896 )
      ( GET_ROCK_DATA ?AUTO_3894 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3894 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3929 - OBJECTIVE
      ?AUTO_3930 - MODE
    )
    :vars
    (
      ?AUTO_3934 - LANDER
      ?AUTO_3933 - WAYPOINT
      ?AUTO_3932 - WAYPOINT
      ?AUTO_3931 - ROVER
      ?AUTO_3935 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3934 ?AUTO_3933 ) ( VISIBLE ?AUTO_3932 ?AUTO_3933 ) ( AVAILABLE ?AUTO_3931 ) ( CHANNEL_FREE ?AUTO_3934 ) ( not ( = ?AUTO_3932 ?AUTO_3933 ) ) ( CAN_TRAVERSE ?AUTO_3931 ?AUTO_3933 ?AUTO_3932 ) ( VISIBLE ?AUTO_3933 ?AUTO_3932 ) ( ON_BOARD ?AUTO_3935 ?AUTO_3931 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3931 ) ( SUPPORTS ?AUTO_3935 ?AUTO_3930 ) ( VISIBLE_FROM ?AUTO_3929 ?AUTO_3933 ) ( CALIBRATION_TARGET ?AUTO_3935 ?AUTO_3929 ) ( CAN_TRAVERSE ?AUTO_3931 ?AUTO_3932 ?AUTO_3933 ) ( AT ?AUTO_3931 ?AUTO_3932 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3931 ?AUTO_3932 ?AUTO_3933 )
      ( GET_IMAGE_DATA ?AUTO_3929 ?AUTO_3930 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3929 ?AUTO_3930 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3936 - OBJECTIVE
      ?AUTO_3937 - MODE
    )
    :vars
    (
      ?AUTO_3938 - LANDER
      ?AUTO_3942 - WAYPOINT
      ?AUTO_3941 - WAYPOINT
      ?AUTO_3939 - ROVER
      ?AUTO_3940 - CAMERA
      ?AUTO_3943 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3938 ?AUTO_3942 ) ( VISIBLE ?AUTO_3941 ?AUTO_3942 ) ( AVAILABLE ?AUTO_3939 ) ( CHANNEL_FREE ?AUTO_3938 ) ( not ( = ?AUTO_3941 ?AUTO_3942 ) ) ( CAN_TRAVERSE ?AUTO_3939 ?AUTO_3942 ?AUTO_3941 ) ( VISIBLE ?AUTO_3942 ?AUTO_3941 ) ( ON_BOARD ?AUTO_3940 ?AUTO_3939 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3939 ) ( SUPPORTS ?AUTO_3940 ?AUTO_3937 ) ( VISIBLE_FROM ?AUTO_3936 ?AUTO_3942 ) ( CALIBRATION_TARGET ?AUTO_3940 ?AUTO_3936 ) ( CAN_TRAVERSE ?AUTO_3939 ?AUTO_3941 ?AUTO_3942 ) ( CAN_TRAVERSE ?AUTO_3939 ?AUTO_3943 ?AUTO_3941 ) ( AT ?AUTO_3939 ?AUTO_3943 ) ( VISIBLE ?AUTO_3943 ?AUTO_3941 ) ( not ( = ?AUTO_3942 ?AUTO_3943 ) ) ( not ( = ?AUTO_3941 ?AUTO_3943 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3939 ?AUTO_3943 ?AUTO_3941 )
      ( GET_IMAGE_DATA ?AUTO_3936 ?AUTO_3937 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3936 ?AUTO_3937 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3944 - OBJECTIVE
      ?AUTO_3945 - MODE
    )
    :vars
    (
      ?AUTO_3949 - LANDER
      ?AUTO_3948 - WAYPOINT
      ?AUTO_3946 - WAYPOINT
      ?AUTO_3947 - ROVER
      ?AUTO_3950 - CAMERA
      ?AUTO_3951 - WAYPOINT
      ?AUTO_3952 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3949 ?AUTO_3948 ) ( VISIBLE ?AUTO_3946 ?AUTO_3948 ) ( AVAILABLE ?AUTO_3947 ) ( CHANNEL_FREE ?AUTO_3949 ) ( not ( = ?AUTO_3946 ?AUTO_3948 ) ) ( CAN_TRAVERSE ?AUTO_3947 ?AUTO_3948 ?AUTO_3946 ) ( VISIBLE ?AUTO_3948 ?AUTO_3946 ) ( ON_BOARD ?AUTO_3950 ?AUTO_3947 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3947 ) ( SUPPORTS ?AUTO_3950 ?AUTO_3945 ) ( VISIBLE_FROM ?AUTO_3944 ?AUTO_3948 ) ( CALIBRATION_TARGET ?AUTO_3950 ?AUTO_3944 ) ( CAN_TRAVERSE ?AUTO_3947 ?AUTO_3946 ?AUTO_3948 ) ( CAN_TRAVERSE ?AUTO_3947 ?AUTO_3951 ?AUTO_3946 ) ( VISIBLE ?AUTO_3951 ?AUTO_3946 ) ( not ( = ?AUTO_3948 ?AUTO_3951 ) ) ( not ( = ?AUTO_3946 ?AUTO_3951 ) ) ( CAN_TRAVERSE ?AUTO_3947 ?AUTO_3952 ?AUTO_3951 ) ( AT ?AUTO_3947 ?AUTO_3952 ) ( VISIBLE ?AUTO_3952 ?AUTO_3951 ) ( not ( = ?AUTO_3948 ?AUTO_3952 ) ) ( not ( = ?AUTO_3946 ?AUTO_3952 ) ) ( not ( = ?AUTO_3951 ?AUTO_3952 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3947 ?AUTO_3952 ?AUTO_3951 )
      ( GET_IMAGE_DATA ?AUTO_3944 ?AUTO_3945 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3944 ?AUTO_3945 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3953 - OBJECTIVE
      ?AUTO_3954 - MODE
    )
    :vars
    (
      ?AUTO_3955 - LANDER
      ?AUTO_3956 - WAYPOINT
      ?AUTO_3957 - WAYPOINT
      ?AUTO_3959 - ROVER
      ?AUTO_3958 - CAMERA
      ?AUTO_3961 - WAYPOINT
      ?AUTO_3960 - WAYPOINT
      ?AUTO_3962 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3955 ?AUTO_3956 ) ( VISIBLE ?AUTO_3957 ?AUTO_3956 ) ( AVAILABLE ?AUTO_3959 ) ( CHANNEL_FREE ?AUTO_3955 ) ( not ( = ?AUTO_3957 ?AUTO_3956 ) ) ( CAN_TRAVERSE ?AUTO_3959 ?AUTO_3956 ?AUTO_3957 ) ( VISIBLE ?AUTO_3956 ?AUTO_3957 ) ( ON_BOARD ?AUTO_3958 ?AUTO_3959 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3959 ) ( SUPPORTS ?AUTO_3958 ?AUTO_3954 ) ( VISIBLE_FROM ?AUTO_3953 ?AUTO_3956 ) ( CALIBRATION_TARGET ?AUTO_3958 ?AUTO_3953 ) ( CAN_TRAVERSE ?AUTO_3959 ?AUTO_3957 ?AUTO_3956 ) ( CAN_TRAVERSE ?AUTO_3959 ?AUTO_3961 ?AUTO_3957 ) ( VISIBLE ?AUTO_3961 ?AUTO_3957 ) ( not ( = ?AUTO_3956 ?AUTO_3961 ) ) ( not ( = ?AUTO_3957 ?AUTO_3961 ) ) ( CAN_TRAVERSE ?AUTO_3959 ?AUTO_3960 ?AUTO_3961 ) ( VISIBLE ?AUTO_3960 ?AUTO_3961 ) ( not ( = ?AUTO_3956 ?AUTO_3960 ) ) ( not ( = ?AUTO_3957 ?AUTO_3960 ) ) ( not ( = ?AUTO_3961 ?AUTO_3960 ) ) ( CAN_TRAVERSE ?AUTO_3959 ?AUTO_3962 ?AUTO_3960 ) ( AT ?AUTO_3959 ?AUTO_3962 ) ( VISIBLE ?AUTO_3962 ?AUTO_3960 ) ( not ( = ?AUTO_3956 ?AUTO_3962 ) ) ( not ( = ?AUTO_3957 ?AUTO_3962 ) ) ( not ( = ?AUTO_3961 ?AUTO_3962 ) ) ( not ( = ?AUTO_3960 ?AUTO_3962 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3959 ?AUTO_3962 ?AUTO_3960 )
      ( GET_IMAGE_DATA ?AUTO_3953 ?AUTO_3954 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3953 ?AUTO_3954 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4015 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4020 - LANDER
      ?AUTO_4018 - WAYPOINT
      ?AUTO_4017 - ROVER
      ?AUTO_4019 - WAYPOINT
      ?AUTO_4016 - WAYPOINT
      ?AUTO_4021 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4020 ?AUTO_4018 ) ( HAVE_SOIL_ANALYSIS ?AUTO_4017 ?AUTO_4015 ) ( VISIBLE ?AUTO_4019 ?AUTO_4018 ) ( AVAILABLE ?AUTO_4017 ) ( CHANNEL_FREE ?AUTO_4020 ) ( not ( = ?AUTO_4015 ?AUTO_4019 ) ) ( not ( = ?AUTO_4015 ?AUTO_4018 ) ) ( not ( = ?AUTO_4019 ?AUTO_4018 ) ) ( CAN_TRAVERSE ?AUTO_4017 ?AUTO_4016 ?AUTO_4019 ) ( VISIBLE ?AUTO_4016 ?AUTO_4019 ) ( not ( = ?AUTO_4015 ?AUTO_4016 ) ) ( not ( = ?AUTO_4018 ?AUTO_4016 ) ) ( not ( = ?AUTO_4019 ?AUTO_4016 ) ) ( CAN_TRAVERSE ?AUTO_4017 ?AUTO_4021 ?AUTO_4016 ) ( AT ?AUTO_4017 ?AUTO_4021 ) ( VISIBLE ?AUTO_4021 ?AUTO_4016 ) ( not ( = ?AUTO_4015 ?AUTO_4021 ) ) ( not ( = ?AUTO_4018 ?AUTO_4021 ) ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4016 ?AUTO_4021 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4017 ?AUTO_4021 ?AUTO_4016 )
      ( GET_SOIL_DATA ?AUTO_4015 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4015 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4022 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4025 - LANDER
      ?AUTO_4024 - WAYPOINT
      ?AUTO_4026 - ROVER
      ?AUTO_4027 - WAYPOINT
      ?AUTO_4028 - WAYPOINT
      ?AUTO_4023 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4025 ?AUTO_4024 ) ( HAVE_SOIL_ANALYSIS ?AUTO_4026 ?AUTO_4022 ) ( VISIBLE ?AUTO_4027 ?AUTO_4024 ) ( AVAILABLE ?AUTO_4026 ) ( CHANNEL_FREE ?AUTO_4025 ) ( not ( = ?AUTO_4022 ?AUTO_4027 ) ) ( not ( = ?AUTO_4022 ?AUTO_4024 ) ) ( not ( = ?AUTO_4027 ?AUTO_4024 ) ) ( CAN_TRAVERSE ?AUTO_4026 ?AUTO_4028 ?AUTO_4027 ) ( VISIBLE ?AUTO_4028 ?AUTO_4027 ) ( not ( = ?AUTO_4022 ?AUTO_4028 ) ) ( not ( = ?AUTO_4024 ?AUTO_4028 ) ) ( not ( = ?AUTO_4027 ?AUTO_4028 ) ) ( CAN_TRAVERSE ?AUTO_4026 ?AUTO_4023 ?AUTO_4028 ) ( VISIBLE ?AUTO_4023 ?AUTO_4028 ) ( not ( = ?AUTO_4022 ?AUTO_4023 ) ) ( not ( = ?AUTO_4024 ?AUTO_4023 ) ) ( not ( = ?AUTO_4027 ?AUTO_4023 ) ) ( not ( = ?AUTO_4028 ?AUTO_4023 ) ) ( CAN_TRAVERSE ?AUTO_4026 ?AUTO_4022 ?AUTO_4023 ) ( AT ?AUTO_4026 ?AUTO_4022 ) ( VISIBLE ?AUTO_4022 ?AUTO_4023 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4026 ?AUTO_4022 ?AUTO_4023 )
      ( GET_SOIL_DATA ?AUTO_4022 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4022 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4029 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4030 - LANDER
      ?AUTO_4034 - WAYPOINT
      ?AUTO_4033 - WAYPOINT
      ?AUTO_4032 - ROVER
      ?AUTO_4031 - WAYPOINT
      ?AUTO_4035 - WAYPOINT
      ?AUTO_4036 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4030 ?AUTO_4034 ) ( VISIBLE ?AUTO_4033 ?AUTO_4034 ) ( AVAILABLE ?AUTO_4032 ) ( CHANNEL_FREE ?AUTO_4030 ) ( not ( = ?AUTO_4029 ?AUTO_4033 ) ) ( not ( = ?AUTO_4029 ?AUTO_4034 ) ) ( not ( = ?AUTO_4033 ?AUTO_4034 ) ) ( CAN_TRAVERSE ?AUTO_4032 ?AUTO_4031 ?AUTO_4033 ) ( VISIBLE ?AUTO_4031 ?AUTO_4033 ) ( not ( = ?AUTO_4029 ?AUTO_4031 ) ) ( not ( = ?AUTO_4034 ?AUTO_4031 ) ) ( not ( = ?AUTO_4033 ?AUTO_4031 ) ) ( CAN_TRAVERSE ?AUTO_4032 ?AUTO_4035 ?AUTO_4031 ) ( VISIBLE ?AUTO_4035 ?AUTO_4031 ) ( not ( = ?AUTO_4029 ?AUTO_4035 ) ) ( not ( = ?AUTO_4034 ?AUTO_4035 ) ) ( not ( = ?AUTO_4033 ?AUTO_4035 ) ) ( not ( = ?AUTO_4031 ?AUTO_4035 ) ) ( CAN_TRAVERSE ?AUTO_4032 ?AUTO_4029 ?AUTO_4035 ) ( AT ?AUTO_4032 ?AUTO_4029 ) ( VISIBLE ?AUTO_4029 ?AUTO_4035 ) ( AT_SOIL_SAMPLE ?AUTO_4029 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4032 ) ( STORE_OF ?AUTO_4036 ?AUTO_4032 ) ( EMPTY ?AUTO_4036 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4032 ?AUTO_4036 ?AUTO_4029 )
      ( GET_SOIL_DATA ?AUTO_4029 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4029 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4037 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4040 - LANDER
      ?AUTO_4039 - WAYPOINT
      ?AUTO_4042 - WAYPOINT
      ?AUTO_4043 - ROVER
      ?AUTO_4041 - WAYPOINT
      ?AUTO_4038 - WAYPOINT
      ?AUTO_4044 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4040 ?AUTO_4039 ) ( VISIBLE ?AUTO_4042 ?AUTO_4039 ) ( AVAILABLE ?AUTO_4043 ) ( CHANNEL_FREE ?AUTO_4040 ) ( not ( = ?AUTO_4037 ?AUTO_4042 ) ) ( not ( = ?AUTO_4037 ?AUTO_4039 ) ) ( not ( = ?AUTO_4042 ?AUTO_4039 ) ) ( CAN_TRAVERSE ?AUTO_4043 ?AUTO_4041 ?AUTO_4042 ) ( VISIBLE ?AUTO_4041 ?AUTO_4042 ) ( not ( = ?AUTO_4037 ?AUTO_4041 ) ) ( not ( = ?AUTO_4039 ?AUTO_4041 ) ) ( not ( = ?AUTO_4042 ?AUTO_4041 ) ) ( CAN_TRAVERSE ?AUTO_4043 ?AUTO_4038 ?AUTO_4041 ) ( VISIBLE ?AUTO_4038 ?AUTO_4041 ) ( not ( = ?AUTO_4037 ?AUTO_4038 ) ) ( not ( = ?AUTO_4039 ?AUTO_4038 ) ) ( not ( = ?AUTO_4042 ?AUTO_4038 ) ) ( not ( = ?AUTO_4041 ?AUTO_4038 ) ) ( CAN_TRAVERSE ?AUTO_4043 ?AUTO_4037 ?AUTO_4038 ) ( VISIBLE ?AUTO_4037 ?AUTO_4038 ) ( AT_SOIL_SAMPLE ?AUTO_4037 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4043 ) ( STORE_OF ?AUTO_4044 ?AUTO_4043 ) ( EMPTY ?AUTO_4044 ) ( CAN_TRAVERSE ?AUTO_4043 ?AUTO_4041 ?AUTO_4037 ) ( AT ?AUTO_4043 ?AUTO_4041 ) ( VISIBLE ?AUTO_4041 ?AUTO_4037 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4043 ?AUTO_4041 ?AUTO_4037 )
      ( GET_SOIL_DATA ?AUTO_4037 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4037 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4045 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4046 - LANDER
      ?AUTO_4048 - WAYPOINT
      ?AUTO_4052 - WAYPOINT
      ?AUTO_4051 - ROVER
      ?AUTO_4049 - WAYPOINT
      ?AUTO_4047 - WAYPOINT
      ?AUTO_4050 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4046 ?AUTO_4048 ) ( VISIBLE ?AUTO_4052 ?AUTO_4048 ) ( AVAILABLE ?AUTO_4051 ) ( CHANNEL_FREE ?AUTO_4046 ) ( not ( = ?AUTO_4045 ?AUTO_4052 ) ) ( not ( = ?AUTO_4045 ?AUTO_4048 ) ) ( not ( = ?AUTO_4052 ?AUTO_4048 ) ) ( CAN_TRAVERSE ?AUTO_4051 ?AUTO_4049 ?AUTO_4052 ) ( VISIBLE ?AUTO_4049 ?AUTO_4052 ) ( not ( = ?AUTO_4045 ?AUTO_4049 ) ) ( not ( = ?AUTO_4048 ?AUTO_4049 ) ) ( not ( = ?AUTO_4052 ?AUTO_4049 ) ) ( CAN_TRAVERSE ?AUTO_4051 ?AUTO_4047 ?AUTO_4049 ) ( VISIBLE ?AUTO_4047 ?AUTO_4049 ) ( not ( = ?AUTO_4045 ?AUTO_4047 ) ) ( not ( = ?AUTO_4048 ?AUTO_4047 ) ) ( not ( = ?AUTO_4052 ?AUTO_4047 ) ) ( not ( = ?AUTO_4049 ?AUTO_4047 ) ) ( CAN_TRAVERSE ?AUTO_4051 ?AUTO_4045 ?AUTO_4047 ) ( VISIBLE ?AUTO_4045 ?AUTO_4047 ) ( AT_SOIL_SAMPLE ?AUTO_4045 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4051 ) ( STORE_OF ?AUTO_4050 ?AUTO_4051 ) ( EMPTY ?AUTO_4050 ) ( CAN_TRAVERSE ?AUTO_4051 ?AUTO_4049 ?AUTO_4045 ) ( VISIBLE ?AUTO_4049 ?AUTO_4045 ) ( CAN_TRAVERSE ?AUTO_4051 ?AUTO_4052 ?AUTO_4049 ) ( AT ?AUTO_4051 ?AUTO_4052 ) ( VISIBLE ?AUTO_4052 ?AUTO_4049 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4051 ?AUTO_4052 ?AUTO_4049 )
      ( GET_SOIL_DATA ?AUTO_4045 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4045 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4053 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4056 - LANDER
      ?AUTO_4058 - WAYPOINT
      ?AUTO_4054 - WAYPOINT
      ?AUTO_4060 - ROVER
      ?AUTO_4057 - WAYPOINT
      ?AUTO_4055 - WAYPOINT
      ?AUTO_4059 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4056 ?AUTO_4058 ) ( VISIBLE ?AUTO_4054 ?AUTO_4058 ) ( AVAILABLE ?AUTO_4060 ) ( CHANNEL_FREE ?AUTO_4056 ) ( not ( = ?AUTO_4053 ?AUTO_4054 ) ) ( not ( = ?AUTO_4053 ?AUTO_4058 ) ) ( not ( = ?AUTO_4054 ?AUTO_4058 ) ) ( CAN_TRAVERSE ?AUTO_4060 ?AUTO_4057 ?AUTO_4054 ) ( VISIBLE ?AUTO_4057 ?AUTO_4054 ) ( not ( = ?AUTO_4053 ?AUTO_4057 ) ) ( not ( = ?AUTO_4058 ?AUTO_4057 ) ) ( not ( = ?AUTO_4054 ?AUTO_4057 ) ) ( CAN_TRAVERSE ?AUTO_4060 ?AUTO_4055 ?AUTO_4057 ) ( VISIBLE ?AUTO_4055 ?AUTO_4057 ) ( not ( = ?AUTO_4053 ?AUTO_4055 ) ) ( not ( = ?AUTO_4058 ?AUTO_4055 ) ) ( not ( = ?AUTO_4054 ?AUTO_4055 ) ) ( not ( = ?AUTO_4057 ?AUTO_4055 ) ) ( CAN_TRAVERSE ?AUTO_4060 ?AUTO_4053 ?AUTO_4055 ) ( VISIBLE ?AUTO_4053 ?AUTO_4055 ) ( AT_SOIL_SAMPLE ?AUTO_4053 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4060 ) ( STORE_OF ?AUTO_4059 ?AUTO_4060 ) ( CAN_TRAVERSE ?AUTO_4060 ?AUTO_4057 ?AUTO_4053 ) ( VISIBLE ?AUTO_4057 ?AUTO_4053 ) ( CAN_TRAVERSE ?AUTO_4060 ?AUTO_4054 ?AUTO_4057 ) ( AT ?AUTO_4060 ?AUTO_4054 ) ( VISIBLE ?AUTO_4054 ?AUTO_4057 ) ( FULL ?AUTO_4059 ) )
    :subtasks
    ( ( !DROP ?AUTO_4060 ?AUTO_4059 )
      ( GET_SOIL_DATA ?AUTO_4053 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4053 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4064 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4067 - LANDER
      ?AUTO_4071 - WAYPOINT
      ?AUTO_4065 - WAYPOINT
      ?AUTO_4066 - ROVER
      ?AUTO_4068 - WAYPOINT
      ?AUTO_4069 - WAYPOINT
      ?AUTO_4070 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4067 ?AUTO_4071 ) ( VISIBLE ?AUTO_4065 ?AUTO_4071 ) ( AVAILABLE ?AUTO_4066 ) ( CHANNEL_FREE ?AUTO_4067 ) ( not ( = ?AUTO_4064 ?AUTO_4065 ) ) ( not ( = ?AUTO_4064 ?AUTO_4071 ) ) ( not ( = ?AUTO_4065 ?AUTO_4071 ) ) ( CAN_TRAVERSE ?AUTO_4066 ?AUTO_4068 ?AUTO_4065 ) ( VISIBLE ?AUTO_4068 ?AUTO_4065 ) ( not ( = ?AUTO_4064 ?AUTO_4068 ) ) ( not ( = ?AUTO_4071 ?AUTO_4068 ) ) ( not ( = ?AUTO_4065 ?AUTO_4068 ) ) ( CAN_TRAVERSE ?AUTO_4066 ?AUTO_4069 ?AUTO_4068 ) ( VISIBLE ?AUTO_4069 ?AUTO_4068 ) ( not ( = ?AUTO_4064 ?AUTO_4069 ) ) ( not ( = ?AUTO_4071 ?AUTO_4069 ) ) ( not ( = ?AUTO_4065 ?AUTO_4069 ) ) ( not ( = ?AUTO_4068 ?AUTO_4069 ) ) ( CAN_TRAVERSE ?AUTO_4066 ?AUTO_4064 ?AUTO_4069 ) ( VISIBLE ?AUTO_4064 ?AUTO_4069 ) ( AT_SOIL_SAMPLE ?AUTO_4064 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4066 ) ( STORE_OF ?AUTO_4070 ?AUTO_4066 ) ( EMPTY ?AUTO_4070 ) ( CAN_TRAVERSE ?AUTO_4066 ?AUTO_4068 ?AUTO_4064 ) ( VISIBLE ?AUTO_4068 ?AUTO_4064 ) ( CAN_TRAVERSE ?AUTO_4066 ?AUTO_4065 ?AUTO_4068 ) ( VISIBLE ?AUTO_4065 ?AUTO_4068 ) ( CAN_TRAVERSE ?AUTO_4066 ?AUTO_4071 ?AUTO_4065 ) ( AT ?AUTO_4066 ?AUTO_4071 ) ( VISIBLE ?AUTO_4071 ?AUTO_4065 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4066 ?AUTO_4071 ?AUTO_4065 )
      ( GET_SOIL_DATA ?AUTO_4064 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4064 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4076 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4083 - LANDER
      ?AUTO_4077 - WAYPOINT
      ?AUTO_4080 - WAYPOINT
      ?AUTO_4082 - ROVER
      ?AUTO_4079 - WAYPOINT
      ?AUTO_4081 - WAYPOINT
      ?AUTO_4078 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4083 ?AUTO_4077 ) ( VISIBLE ?AUTO_4080 ?AUTO_4077 ) ( AVAILABLE ?AUTO_4082 ) ( CHANNEL_FREE ?AUTO_4083 ) ( not ( = ?AUTO_4076 ?AUTO_4080 ) ) ( not ( = ?AUTO_4076 ?AUTO_4077 ) ) ( not ( = ?AUTO_4080 ?AUTO_4077 ) ) ( CAN_TRAVERSE ?AUTO_4082 ?AUTO_4079 ?AUTO_4080 ) ( VISIBLE ?AUTO_4079 ?AUTO_4080 ) ( not ( = ?AUTO_4076 ?AUTO_4079 ) ) ( not ( = ?AUTO_4077 ?AUTO_4079 ) ) ( not ( = ?AUTO_4080 ?AUTO_4079 ) ) ( CAN_TRAVERSE ?AUTO_4082 ?AUTO_4081 ?AUTO_4079 ) ( VISIBLE ?AUTO_4081 ?AUTO_4079 ) ( not ( = ?AUTO_4076 ?AUTO_4081 ) ) ( not ( = ?AUTO_4077 ?AUTO_4081 ) ) ( not ( = ?AUTO_4080 ?AUTO_4081 ) ) ( not ( = ?AUTO_4079 ?AUTO_4081 ) ) ( CAN_TRAVERSE ?AUTO_4082 ?AUTO_4076 ?AUTO_4081 ) ( VISIBLE ?AUTO_4076 ?AUTO_4081 ) ( AT_SOIL_SAMPLE ?AUTO_4076 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4082 ) ( STORE_OF ?AUTO_4078 ?AUTO_4082 ) ( EMPTY ?AUTO_4078 ) ( CAN_TRAVERSE ?AUTO_4082 ?AUTO_4079 ?AUTO_4076 ) ( VISIBLE ?AUTO_4079 ?AUTO_4076 ) ( AT ?AUTO_4082 ?AUTO_4081 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4082 ?AUTO_4081 ?AUTO_4079 )
      ( GET_SOIL_DATA ?AUTO_4076 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4076 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4145 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4146 - LANDER
      ?AUTO_4151 - WAYPOINT
      ?AUTO_4150 - ROVER
      ?AUTO_4149 - STORE
      ?AUTO_4147 - WAYPOINT
      ?AUTO_4148 - WAYPOINT
      ?AUTO_4152 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4146 ?AUTO_4145 ) ( VISIBLE ?AUTO_4151 ?AUTO_4145 ) ( AVAILABLE ?AUTO_4150 ) ( CHANNEL_FREE ?AUTO_4146 ) ( not ( = ?AUTO_4145 ?AUTO_4151 ) ) ( CAN_TRAVERSE ?AUTO_4150 ?AUTO_4145 ?AUTO_4151 ) ( VISIBLE ?AUTO_4145 ?AUTO_4151 ) ( AT_SOIL_SAMPLE ?AUTO_4145 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4150 ) ( STORE_OF ?AUTO_4149 ?AUTO_4150 ) ( EMPTY ?AUTO_4149 ) ( CAN_TRAVERSE ?AUTO_4150 ?AUTO_4147 ?AUTO_4145 ) ( VISIBLE ?AUTO_4147 ?AUTO_4145 ) ( not ( = ?AUTO_4145 ?AUTO_4147 ) ) ( not ( = ?AUTO_4151 ?AUTO_4147 ) ) ( CAN_TRAVERSE ?AUTO_4150 ?AUTO_4148 ?AUTO_4147 ) ( VISIBLE ?AUTO_4148 ?AUTO_4147 ) ( not ( = ?AUTO_4145 ?AUTO_4148 ) ) ( not ( = ?AUTO_4151 ?AUTO_4148 ) ) ( not ( = ?AUTO_4147 ?AUTO_4148 ) ) ( CAN_TRAVERSE ?AUTO_4150 ?AUTO_4152 ?AUTO_4148 ) ( AT ?AUTO_4150 ?AUTO_4152 ) ( VISIBLE ?AUTO_4152 ?AUTO_4148 ) ( not ( = ?AUTO_4145 ?AUTO_4152 ) ) ( not ( = ?AUTO_4151 ?AUTO_4152 ) ) ( not ( = ?AUTO_4147 ?AUTO_4152 ) ) ( not ( = ?AUTO_4148 ?AUTO_4152 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4150 ?AUTO_4152 ?AUTO_4148 )
      ( GET_SOIL_DATA ?AUTO_4145 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4145 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4217 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4219 - LANDER
      ?AUTO_4221 - WAYPOINT
      ?AUTO_4220 - ROVER
      ?AUTO_4218 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4219 ?AUTO_4221 ) ( VISIBLE ?AUTO_4217 ?AUTO_4221 ) ( AVAILABLE ?AUTO_4220 ) ( CHANNEL_FREE ?AUTO_4219 ) ( not ( = ?AUTO_4217 ?AUTO_4221 ) ) ( AT_ROCK_SAMPLE ?AUTO_4217 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4220 ) ( STORE_OF ?AUTO_4218 ?AUTO_4220 ) ( FULL ?AUTO_4218 ) ( CAN_TRAVERSE ?AUTO_4220 ?AUTO_4221 ?AUTO_4217 ) ( AT ?AUTO_4220 ?AUTO_4221 ) ( VISIBLE ?AUTO_4221 ?AUTO_4217 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4220 ?AUTO_4221 ?AUTO_4217 )
      ( GET_ROCK_DATA ?AUTO_4217 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4217 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4222 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4225 - LANDER
      ?AUTO_4226 - WAYPOINT
      ?AUTO_4223 - ROVER
      ?AUTO_4224 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4225 ?AUTO_4226 ) ( VISIBLE ?AUTO_4222 ?AUTO_4226 ) ( AVAILABLE ?AUTO_4223 ) ( CHANNEL_FREE ?AUTO_4225 ) ( not ( = ?AUTO_4222 ?AUTO_4226 ) ) ( AT_ROCK_SAMPLE ?AUTO_4222 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4223 ) ( STORE_OF ?AUTO_4224 ?AUTO_4223 ) ( CAN_TRAVERSE ?AUTO_4223 ?AUTO_4226 ?AUTO_4222 ) ( AT ?AUTO_4223 ?AUTO_4226 ) ( VISIBLE ?AUTO_4226 ?AUTO_4222 ) ( AT_ROCK_SAMPLE ?AUTO_4226 ) ( EMPTY ?AUTO_4224 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_4223 ?AUTO_4224 ?AUTO_4226 )
      ( GET_ROCK_DATA ?AUTO_4222 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4222 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4269 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4271 - LANDER
      ?AUTO_4270 - WAYPOINT
      ?AUTO_4274 - WAYPOINT
      ?AUTO_4273 - ROVER
      ?AUTO_4272 - STORE
      ?AUTO_4275 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4271 ?AUTO_4270 ) ( VISIBLE ?AUTO_4274 ?AUTO_4270 ) ( AVAILABLE ?AUTO_4273 ) ( CHANNEL_FREE ?AUTO_4271 ) ( not ( = ?AUTO_4269 ?AUTO_4274 ) ) ( not ( = ?AUTO_4269 ?AUTO_4270 ) ) ( not ( = ?AUTO_4274 ?AUTO_4270 ) ) ( CAN_TRAVERSE ?AUTO_4273 ?AUTO_4269 ?AUTO_4274 ) ( VISIBLE ?AUTO_4269 ?AUTO_4274 ) ( AT_ROCK_SAMPLE ?AUTO_4269 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4273 ) ( STORE_OF ?AUTO_4272 ?AUTO_4273 ) ( CAN_TRAVERSE ?AUTO_4273 ?AUTO_4275 ?AUTO_4269 ) ( AT ?AUTO_4273 ?AUTO_4275 ) ( VISIBLE ?AUTO_4275 ?AUTO_4269 ) ( not ( = ?AUTO_4269 ?AUTO_4275 ) ) ( not ( = ?AUTO_4270 ?AUTO_4275 ) ) ( not ( = ?AUTO_4274 ?AUTO_4275 ) ) ( FULL ?AUTO_4272 ) )
    :subtasks
    ( ( !DROP ?AUTO_4273 ?AUTO_4272 )
      ( GET_ROCK_DATA ?AUTO_4269 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4269 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4276 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4280 - LANDER
      ?AUTO_4277 - WAYPOINT
      ?AUTO_4282 - WAYPOINT
      ?AUTO_4281 - ROVER
      ?AUTO_4278 - STORE
      ?AUTO_4279 - WAYPOINT
      ?AUTO_4283 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4280 ?AUTO_4277 ) ( VISIBLE ?AUTO_4282 ?AUTO_4277 ) ( AVAILABLE ?AUTO_4281 ) ( CHANNEL_FREE ?AUTO_4280 ) ( not ( = ?AUTO_4276 ?AUTO_4282 ) ) ( not ( = ?AUTO_4276 ?AUTO_4277 ) ) ( not ( = ?AUTO_4282 ?AUTO_4277 ) ) ( CAN_TRAVERSE ?AUTO_4281 ?AUTO_4276 ?AUTO_4282 ) ( VISIBLE ?AUTO_4276 ?AUTO_4282 ) ( AT_ROCK_SAMPLE ?AUTO_4276 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4281 ) ( STORE_OF ?AUTO_4278 ?AUTO_4281 ) ( CAN_TRAVERSE ?AUTO_4281 ?AUTO_4279 ?AUTO_4276 ) ( VISIBLE ?AUTO_4279 ?AUTO_4276 ) ( not ( = ?AUTO_4276 ?AUTO_4279 ) ) ( not ( = ?AUTO_4277 ?AUTO_4279 ) ) ( not ( = ?AUTO_4282 ?AUTO_4279 ) ) ( FULL ?AUTO_4278 ) ( CAN_TRAVERSE ?AUTO_4281 ?AUTO_4283 ?AUTO_4279 ) ( AT ?AUTO_4281 ?AUTO_4283 ) ( VISIBLE ?AUTO_4283 ?AUTO_4279 ) ( not ( = ?AUTO_4276 ?AUTO_4283 ) ) ( not ( = ?AUTO_4277 ?AUTO_4283 ) ) ( not ( = ?AUTO_4282 ?AUTO_4283 ) ) ( not ( = ?AUTO_4279 ?AUTO_4283 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4281 ?AUTO_4283 ?AUTO_4279 )
      ( GET_ROCK_DATA ?AUTO_4276 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4276 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4285 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4290 - LANDER
      ?AUTO_4289 - WAYPOINT
      ?AUTO_4292 - WAYPOINT
      ?AUTO_4288 - ROVER
      ?AUTO_4287 - STORE
      ?AUTO_4291 - WAYPOINT
      ?AUTO_4286 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4290 ?AUTO_4289 ) ( VISIBLE ?AUTO_4292 ?AUTO_4289 ) ( AVAILABLE ?AUTO_4288 ) ( CHANNEL_FREE ?AUTO_4290 ) ( not ( = ?AUTO_4285 ?AUTO_4292 ) ) ( not ( = ?AUTO_4285 ?AUTO_4289 ) ) ( not ( = ?AUTO_4292 ?AUTO_4289 ) ) ( CAN_TRAVERSE ?AUTO_4288 ?AUTO_4285 ?AUTO_4292 ) ( VISIBLE ?AUTO_4285 ?AUTO_4292 ) ( AT_ROCK_SAMPLE ?AUTO_4285 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4288 ) ( STORE_OF ?AUTO_4287 ?AUTO_4288 ) ( CAN_TRAVERSE ?AUTO_4288 ?AUTO_4291 ?AUTO_4285 ) ( VISIBLE ?AUTO_4291 ?AUTO_4285 ) ( not ( = ?AUTO_4285 ?AUTO_4291 ) ) ( not ( = ?AUTO_4289 ?AUTO_4291 ) ) ( not ( = ?AUTO_4292 ?AUTO_4291 ) ) ( CAN_TRAVERSE ?AUTO_4288 ?AUTO_4286 ?AUTO_4291 ) ( AT ?AUTO_4288 ?AUTO_4286 ) ( VISIBLE ?AUTO_4286 ?AUTO_4291 ) ( not ( = ?AUTO_4285 ?AUTO_4286 ) ) ( not ( = ?AUTO_4289 ?AUTO_4286 ) ) ( not ( = ?AUTO_4292 ?AUTO_4286 ) ) ( not ( = ?AUTO_4291 ?AUTO_4286 ) ) ( AT_ROCK_SAMPLE ?AUTO_4286 ) ( EMPTY ?AUTO_4287 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_4288 ?AUTO_4287 ?AUTO_4286 )
      ( GET_ROCK_DATA ?AUTO_4285 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4285 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4296 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4299 - LANDER
      ?AUTO_4302 - WAYPOINT
      ?AUTO_4301 - WAYPOINT
      ?AUTO_4298 - ROVER
      ?AUTO_4300 - STORE
      ?AUTO_4303 - WAYPOINT
      ?AUTO_4297 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4299 ?AUTO_4302 ) ( VISIBLE ?AUTO_4301 ?AUTO_4302 ) ( AVAILABLE ?AUTO_4298 ) ( CHANNEL_FREE ?AUTO_4299 ) ( not ( = ?AUTO_4296 ?AUTO_4301 ) ) ( not ( = ?AUTO_4296 ?AUTO_4302 ) ) ( not ( = ?AUTO_4301 ?AUTO_4302 ) ) ( CAN_TRAVERSE ?AUTO_4298 ?AUTO_4296 ?AUTO_4301 ) ( VISIBLE ?AUTO_4296 ?AUTO_4301 ) ( AT_ROCK_SAMPLE ?AUTO_4296 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4298 ) ( STORE_OF ?AUTO_4300 ?AUTO_4298 ) ( CAN_TRAVERSE ?AUTO_4298 ?AUTO_4303 ?AUTO_4296 ) ( VISIBLE ?AUTO_4303 ?AUTO_4296 ) ( not ( = ?AUTO_4296 ?AUTO_4303 ) ) ( not ( = ?AUTO_4302 ?AUTO_4303 ) ) ( not ( = ?AUTO_4301 ?AUTO_4303 ) ) ( FULL ?AUTO_4300 ) ( CAN_TRAVERSE ?AUTO_4298 ?AUTO_4297 ?AUTO_4303 ) ( VISIBLE ?AUTO_4297 ?AUTO_4303 ) ( not ( = ?AUTO_4296 ?AUTO_4297 ) ) ( not ( = ?AUTO_4302 ?AUTO_4297 ) ) ( not ( = ?AUTO_4301 ?AUTO_4297 ) ) ( not ( = ?AUTO_4303 ?AUTO_4297 ) ) ( CAN_TRAVERSE ?AUTO_4298 ?AUTO_4302 ?AUTO_4297 ) ( AT ?AUTO_4298 ?AUTO_4302 ) ( VISIBLE ?AUTO_4302 ?AUTO_4297 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4298 ?AUTO_4302 ?AUTO_4297 )
      ( GET_ROCK_DATA ?AUTO_4296 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4296 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4304 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4310 - LANDER
      ?AUTO_4307 - WAYPOINT
      ?AUTO_4311 - WAYPOINT
      ?AUTO_4308 - ROVER
      ?AUTO_4305 - STORE
      ?AUTO_4306 - WAYPOINT
      ?AUTO_4309 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4310 ?AUTO_4307 ) ( VISIBLE ?AUTO_4311 ?AUTO_4307 ) ( AVAILABLE ?AUTO_4308 ) ( CHANNEL_FREE ?AUTO_4310 ) ( not ( = ?AUTO_4304 ?AUTO_4311 ) ) ( not ( = ?AUTO_4304 ?AUTO_4307 ) ) ( not ( = ?AUTO_4311 ?AUTO_4307 ) ) ( CAN_TRAVERSE ?AUTO_4308 ?AUTO_4304 ?AUTO_4311 ) ( VISIBLE ?AUTO_4304 ?AUTO_4311 ) ( AT_ROCK_SAMPLE ?AUTO_4304 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4308 ) ( STORE_OF ?AUTO_4305 ?AUTO_4308 ) ( CAN_TRAVERSE ?AUTO_4308 ?AUTO_4306 ?AUTO_4304 ) ( VISIBLE ?AUTO_4306 ?AUTO_4304 ) ( not ( = ?AUTO_4304 ?AUTO_4306 ) ) ( not ( = ?AUTO_4307 ?AUTO_4306 ) ) ( not ( = ?AUTO_4311 ?AUTO_4306 ) ) ( CAN_TRAVERSE ?AUTO_4308 ?AUTO_4309 ?AUTO_4306 ) ( VISIBLE ?AUTO_4309 ?AUTO_4306 ) ( not ( = ?AUTO_4304 ?AUTO_4309 ) ) ( not ( = ?AUTO_4307 ?AUTO_4309 ) ) ( not ( = ?AUTO_4311 ?AUTO_4309 ) ) ( not ( = ?AUTO_4306 ?AUTO_4309 ) ) ( CAN_TRAVERSE ?AUTO_4308 ?AUTO_4307 ?AUTO_4309 ) ( AT ?AUTO_4308 ?AUTO_4307 ) ( VISIBLE ?AUTO_4307 ?AUTO_4309 ) ( AT_ROCK_SAMPLE ?AUTO_4307 ) ( EMPTY ?AUTO_4305 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_4308 ?AUTO_4305 ?AUTO_4307 )
      ( GET_ROCK_DATA ?AUTO_4304 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4304 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4314 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4321 - LANDER
      ?AUTO_4319 - WAYPOINT
      ?AUTO_4317 - WAYPOINT
      ?AUTO_4316 - ROVER
      ?AUTO_4318 - STORE
      ?AUTO_4320 - WAYPOINT
      ?AUTO_4315 - WAYPOINT
      ?AUTO_4322 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4321 ?AUTO_4319 ) ( VISIBLE ?AUTO_4317 ?AUTO_4319 ) ( AVAILABLE ?AUTO_4316 ) ( CHANNEL_FREE ?AUTO_4321 ) ( not ( = ?AUTO_4314 ?AUTO_4317 ) ) ( not ( = ?AUTO_4314 ?AUTO_4319 ) ) ( not ( = ?AUTO_4317 ?AUTO_4319 ) ) ( CAN_TRAVERSE ?AUTO_4316 ?AUTO_4314 ?AUTO_4317 ) ( VISIBLE ?AUTO_4314 ?AUTO_4317 ) ( AT_ROCK_SAMPLE ?AUTO_4314 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4316 ) ( STORE_OF ?AUTO_4318 ?AUTO_4316 ) ( CAN_TRAVERSE ?AUTO_4316 ?AUTO_4320 ?AUTO_4314 ) ( VISIBLE ?AUTO_4320 ?AUTO_4314 ) ( not ( = ?AUTO_4314 ?AUTO_4320 ) ) ( not ( = ?AUTO_4319 ?AUTO_4320 ) ) ( not ( = ?AUTO_4317 ?AUTO_4320 ) ) ( CAN_TRAVERSE ?AUTO_4316 ?AUTO_4315 ?AUTO_4320 ) ( VISIBLE ?AUTO_4315 ?AUTO_4320 ) ( not ( = ?AUTO_4314 ?AUTO_4315 ) ) ( not ( = ?AUTO_4319 ?AUTO_4315 ) ) ( not ( = ?AUTO_4317 ?AUTO_4315 ) ) ( not ( = ?AUTO_4320 ?AUTO_4315 ) ) ( CAN_TRAVERSE ?AUTO_4316 ?AUTO_4319 ?AUTO_4315 ) ( VISIBLE ?AUTO_4319 ?AUTO_4315 ) ( AT_ROCK_SAMPLE ?AUTO_4319 ) ( EMPTY ?AUTO_4318 ) ( CAN_TRAVERSE ?AUTO_4316 ?AUTO_4322 ?AUTO_4319 ) ( AT ?AUTO_4316 ?AUTO_4322 ) ( VISIBLE ?AUTO_4322 ?AUTO_4319 ) ( not ( = ?AUTO_4314 ?AUTO_4322 ) ) ( not ( = ?AUTO_4319 ?AUTO_4322 ) ) ( not ( = ?AUTO_4317 ?AUTO_4322 ) ) ( not ( = ?AUTO_4320 ?AUTO_4322 ) ) ( not ( = ?AUTO_4315 ?AUTO_4322 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4316 ?AUTO_4322 ?AUTO_4319 )
      ( GET_ROCK_DATA ?AUTO_4314 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4314 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4383 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4388 - LANDER
      ?AUTO_4389 - WAYPOINT
      ?AUTO_4385 - ROVER
      ?AUTO_4384 - STORE
      ?AUTO_4386 - WAYPOINT
      ?AUTO_4387 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4388 ?AUTO_4389 ) ( VISIBLE ?AUTO_4383 ?AUTO_4389 ) ( AVAILABLE ?AUTO_4385 ) ( CHANNEL_FREE ?AUTO_4388 ) ( not ( = ?AUTO_4383 ?AUTO_4389 ) ) ( AT_ROCK_SAMPLE ?AUTO_4383 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4385 ) ( STORE_OF ?AUTO_4384 ?AUTO_4385 ) ( CAN_TRAVERSE ?AUTO_4385 ?AUTO_4386 ?AUTO_4383 ) ( VISIBLE ?AUTO_4386 ?AUTO_4383 ) ( not ( = ?AUTO_4383 ?AUTO_4386 ) ) ( not ( = ?AUTO_4389 ?AUTO_4386 ) ) ( CAN_TRAVERSE ?AUTO_4385 ?AUTO_4389 ?AUTO_4386 ) ( VISIBLE ?AUTO_4389 ?AUTO_4386 ) ( CAN_TRAVERSE ?AUTO_4385 ?AUTO_4387 ?AUTO_4389 ) ( AT ?AUTO_4385 ?AUTO_4387 ) ( VISIBLE ?AUTO_4387 ?AUTO_4389 ) ( not ( = ?AUTO_4383 ?AUTO_4387 ) ) ( not ( = ?AUTO_4389 ?AUTO_4387 ) ) ( not ( = ?AUTO_4386 ?AUTO_4387 ) ) ( FULL ?AUTO_4384 ) )
    :subtasks
    ( ( !DROP ?AUTO_4385 ?AUTO_4384 )
      ( GET_ROCK_DATA ?AUTO_4383 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4383 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4462 - OBJECTIVE
      ?AUTO_4463 - MODE
    )
    :vars
    (
      ?AUTO_4465 - LANDER
      ?AUTO_4466 - WAYPOINT
      ?AUTO_4471 - WAYPOINT
      ?AUTO_4464 - ROVER
      ?AUTO_4472 - CAMERA
      ?AUTO_4470 - WAYPOINT
      ?AUTO_4468 - WAYPOINT
      ?AUTO_4467 - OBJECTIVE
      ?AUTO_4469 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4465 ?AUTO_4466 ) ( VISIBLE ?AUTO_4471 ?AUTO_4466 ) ( AVAILABLE ?AUTO_4464 ) ( CHANNEL_FREE ?AUTO_4465 ) ( not ( = ?AUTO_4471 ?AUTO_4466 ) ) ( CAN_TRAVERSE ?AUTO_4464 ?AUTO_4466 ?AUTO_4471 ) ( VISIBLE ?AUTO_4466 ?AUTO_4471 ) ( ON_BOARD ?AUTO_4472 ?AUTO_4464 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4464 ) ( SUPPORTS ?AUTO_4472 ?AUTO_4463 ) ( VISIBLE_FROM ?AUTO_4462 ?AUTO_4466 ) ( CAN_TRAVERSE ?AUTO_4464 ?AUTO_4470 ?AUTO_4466 ) ( VISIBLE ?AUTO_4470 ?AUTO_4466 ) ( not ( = ?AUTO_4466 ?AUTO_4470 ) ) ( not ( = ?AUTO_4471 ?AUTO_4470 ) ) ( CAN_TRAVERSE ?AUTO_4464 ?AUTO_4468 ?AUTO_4470 ) ( VISIBLE ?AUTO_4468 ?AUTO_4470 ) ( not ( = ?AUTO_4466 ?AUTO_4468 ) ) ( not ( = ?AUTO_4471 ?AUTO_4468 ) ) ( not ( = ?AUTO_4470 ?AUTO_4468 ) ) ( CALIBRATION_TARGET ?AUTO_4472 ?AUTO_4467 ) ( VISIBLE_FROM ?AUTO_4467 ?AUTO_4468 ) ( not ( = ?AUTO_4462 ?AUTO_4467 ) ) ( CAN_TRAVERSE ?AUTO_4464 ?AUTO_4469 ?AUTO_4468 ) ( VISIBLE ?AUTO_4469 ?AUTO_4468 ) ( not ( = ?AUTO_4466 ?AUTO_4469 ) ) ( not ( = ?AUTO_4471 ?AUTO_4469 ) ) ( not ( = ?AUTO_4470 ?AUTO_4469 ) ) ( not ( = ?AUTO_4468 ?AUTO_4469 ) ) ( CAN_TRAVERSE ?AUTO_4464 ?AUTO_4466 ?AUTO_4469 ) ( AT ?AUTO_4464 ?AUTO_4466 ) ( VISIBLE ?AUTO_4466 ?AUTO_4469 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4464 ?AUTO_4466 ?AUTO_4469 )
      ( GET_IMAGE_DATA ?AUTO_4462 ?AUTO_4463 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4462 ?AUTO_4463 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4473 - OBJECTIVE
      ?AUTO_4474 - MODE
    )
    :vars
    (
      ?AUTO_4479 - LANDER
      ?AUTO_4477 - WAYPOINT
      ?AUTO_4476 - WAYPOINT
      ?AUTO_4475 - ROVER
      ?AUTO_4482 - CAMERA
      ?AUTO_4483 - WAYPOINT
      ?AUTO_4481 - WAYPOINT
      ?AUTO_4480 - OBJECTIVE
      ?AUTO_4478 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4479 ?AUTO_4477 ) ( VISIBLE ?AUTO_4476 ?AUTO_4477 ) ( AVAILABLE ?AUTO_4475 ) ( CHANNEL_FREE ?AUTO_4479 ) ( not ( = ?AUTO_4476 ?AUTO_4477 ) ) ( CAN_TRAVERSE ?AUTO_4475 ?AUTO_4477 ?AUTO_4476 ) ( VISIBLE ?AUTO_4477 ?AUTO_4476 ) ( ON_BOARD ?AUTO_4482 ?AUTO_4475 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4475 ) ( SUPPORTS ?AUTO_4482 ?AUTO_4474 ) ( VISIBLE_FROM ?AUTO_4473 ?AUTO_4477 ) ( CAN_TRAVERSE ?AUTO_4475 ?AUTO_4483 ?AUTO_4477 ) ( VISIBLE ?AUTO_4483 ?AUTO_4477 ) ( not ( = ?AUTO_4477 ?AUTO_4483 ) ) ( not ( = ?AUTO_4476 ?AUTO_4483 ) ) ( CAN_TRAVERSE ?AUTO_4475 ?AUTO_4481 ?AUTO_4483 ) ( VISIBLE ?AUTO_4481 ?AUTO_4483 ) ( not ( = ?AUTO_4477 ?AUTO_4481 ) ) ( not ( = ?AUTO_4476 ?AUTO_4481 ) ) ( not ( = ?AUTO_4483 ?AUTO_4481 ) ) ( CALIBRATION_TARGET ?AUTO_4482 ?AUTO_4480 ) ( VISIBLE_FROM ?AUTO_4480 ?AUTO_4481 ) ( not ( = ?AUTO_4473 ?AUTO_4480 ) ) ( CAN_TRAVERSE ?AUTO_4475 ?AUTO_4478 ?AUTO_4481 ) ( VISIBLE ?AUTO_4478 ?AUTO_4481 ) ( not ( = ?AUTO_4477 ?AUTO_4478 ) ) ( not ( = ?AUTO_4476 ?AUTO_4478 ) ) ( not ( = ?AUTO_4483 ?AUTO_4478 ) ) ( not ( = ?AUTO_4481 ?AUTO_4478 ) ) ( CAN_TRAVERSE ?AUTO_4475 ?AUTO_4477 ?AUTO_4478 ) ( VISIBLE ?AUTO_4477 ?AUTO_4478 ) ( AT ?AUTO_4475 ?AUTO_4483 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4475 ?AUTO_4483 ?AUTO_4477 )
      ( GET_IMAGE_DATA ?AUTO_4473 ?AUTO_4474 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4473 ?AUTO_4474 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4534 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4536 - LANDER
      ?AUTO_4537 - WAYPOINT
      ?AUTO_4538 - ROVER
      ?AUTO_4539 - STORE
      ?AUTO_4540 - WAYPOINT
      ?AUTO_4535 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4536 ?AUTO_4534 ) ( VISIBLE ?AUTO_4537 ?AUTO_4534 ) ( AVAILABLE ?AUTO_4538 ) ( CHANNEL_FREE ?AUTO_4536 ) ( not ( = ?AUTO_4534 ?AUTO_4537 ) ) ( CAN_TRAVERSE ?AUTO_4538 ?AUTO_4534 ?AUTO_4537 ) ( VISIBLE ?AUTO_4534 ?AUTO_4537 ) ( AT_ROCK_SAMPLE ?AUTO_4534 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4538 ) ( STORE_OF ?AUTO_4539 ?AUTO_4538 ) ( CAN_TRAVERSE ?AUTO_4538 ?AUTO_4540 ?AUTO_4534 ) ( VISIBLE ?AUTO_4540 ?AUTO_4534 ) ( not ( = ?AUTO_4534 ?AUTO_4540 ) ) ( not ( = ?AUTO_4537 ?AUTO_4540 ) ) ( CAN_TRAVERSE ?AUTO_4538 ?AUTO_4535 ?AUTO_4540 ) ( AT ?AUTO_4538 ?AUTO_4535 ) ( VISIBLE ?AUTO_4535 ?AUTO_4540 ) ( not ( = ?AUTO_4534 ?AUTO_4535 ) ) ( not ( = ?AUTO_4537 ?AUTO_4535 ) ) ( not ( = ?AUTO_4540 ?AUTO_4535 ) ) ( AT_ROCK_SAMPLE ?AUTO_4535 ) ( EMPTY ?AUTO_4539 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_4538 ?AUTO_4539 ?AUTO_4535 )
      ( GET_ROCK_DATA ?AUTO_4534 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4534 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4580 - OBJECTIVE
      ?AUTO_4581 - MODE
    )
    :vars
    (
      ?AUTO_4585 - LANDER
      ?AUTO_4584 - WAYPOINT
      ?AUTO_4586 - WAYPOINT
      ?AUTO_4588 - ROVER
      ?AUTO_4587 - CAMERA
      ?AUTO_4582 - WAYPOINT
      ?AUTO_4583 - WAYPOINT
      ?AUTO_4589 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4585 ?AUTO_4584 ) ( VISIBLE ?AUTO_4586 ?AUTO_4584 ) ( AVAILABLE ?AUTO_4588 ) ( CHANNEL_FREE ?AUTO_4585 ) ( not ( = ?AUTO_4586 ?AUTO_4584 ) ) ( ON_BOARD ?AUTO_4587 ?AUTO_4588 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4588 ) ( SUPPORTS ?AUTO_4587 ?AUTO_4581 ) ( VISIBLE_FROM ?AUTO_4580 ?AUTO_4586 ) ( CALIBRATION_TARGET ?AUTO_4587 ?AUTO_4580 ) ( CAN_TRAVERSE ?AUTO_4588 ?AUTO_4582 ?AUTO_4586 ) ( VISIBLE ?AUTO_4582 ?AUTO_4586 ) ( not ( = ?AUTO_4584 ?AUTO_4582 ) ) ( not ( = ?AUTO_4586 ?AUTO_4582 ) ) ( CAN_TRAVERSE ?AUTO_4588 ?AUTO_4583 ?AUTO_4582 ) ( VISIBLE ?AUTO_4583 ?AUTO_4582 ) ( not ( = ?AUTO_4584 ?AUTO_4583 ) ) ( not ( = ?AUTO_4586 ?AUTO_4583 ) ) ( not ( = ?AUTO_4582 ?AUTO_4583 ) ) ( CAN_TRAVERSE ?AUTO_4588 ?AUTO_4589 ?AUTO_4583 ) ( AT ?AUTO_4588 ?AUTO_4589 ) ( VISIBLE ?AUTO_4589 ?AUTO_4583 ) ( not ( = ?AUTO_4584 ?AUTO_4589 ) ) ( not ( = ?AUTO_4586 ?AUTO_4589 ) ) ( not ( = ?AUTO_4582 ?AUTO_4589 ) ) ( not ( = ?AUTO_4583 ?AUTO_4589 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4588 ?AUTO_4589 ?AUTO_4583 )
      ( GET_IMAGE_DATA ?AUTO_4580 ?AUTO_4581 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4580 ?AUTO_4581 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4655 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4660 - LANDER
      ?AUTO_4656 - WAYPOINT
      ?AUTO_4657 - ROVER
      ?AUTO_4658 - STORE
      ?AUTO_4659 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4660 ?AUTO_4655 ) ( VISIBLE ?AUTO_4656 ?AUTO_4655 ) ( AVAILABLE ?AUTO_4657 ) ( CHANNEL_FREE ?AUTO_4660 ) ( not ( = ?AUTO_4655 ?AUTO_4656 ) ) ( CAN_TRAVERSE ?AUTO_4657 ?AUTO_4655 ?AUTO_4656 ) ( VISIBLE ?AUTO_4655 ?AUTO_4656 ) ( AT_SOIL_SAMPLE ?AUTO_4655 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4657 ) ( STORE_OF ?AUTO_4658 ?AUTO_4657 ) ( EMPTY ?AUTO_4658 ) ( CAN_TRAVERSE ?AUTO_4657 ?AUTO_4659 ?AUTO_4655 ) ( VISIBLE ?AUTO_4659 ?AUTO_4655 ) ( not ( = ?AUTO_4655 ?AUTO_4659 ) ) ( not ( = ?AUTO_4656 ?AUTO_4659 ) ) ( CAN_TRAVERSE ?AUTO_4657 ?AUTO_4656 ?AUTO_4659 ) ( AT ?AUTO_4657 ?AUTO_4656 ) ( VISIBLE ?AUTO_4656 ?AUTO_4659 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4657 ?AUTO_4656 ?AUTO_4659 )
      ( GET_SOIL_DATA ?AUTO_4655 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4655 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4696 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4701 - LANDER
      ?AUTO_4700 - WAYPOINT
      ?AUTO_4699 - WAYPOINT
      ?AUTO_4697 - ROVER
      ?AUTO_4698 - WAYPOINT
      ?AUTO_4702 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4701 ?AUTO_4700 ) ( VISIBLE ?AUTO_4699 ?AUTO_4700 ) ( AVAILABLE ?AUTO_4697 ) ( CHANNEL_FREE ?AUTO_4701 ) ( not ( = ?AUTO_4696 ?AUTO_4699 ) ) ( not ( = ?AUTO_4696 ?AUTO_4700 ) ) ( not ( = ?AUTO_4699 ?AUTO_4700 ) ) ( CAN_TRAVERSE ?AUTO_4697 ?AUTO_4698 ?AUTO_4699 ) ( VISIBLE ?AUTO_4698 ?AUTO_4699 ) ( not ( = ?AUTO_4696 ?AUTO_4698 ) ) ( not ( = ?AUTO_4700 ?AUTO_4698 ) ) ( not ( = ?AUTO_4699 ?AUTO_4698 ) ) ( CAN_TRAVERSE ?AUTO_4697 ?AUTO_4696 ?AUTO_4698 ) ( VISIBLE ?AUTO_4696 ?AUTO_4698 ) ( AT_SOIL_SAMPLE ?AUTO_4696 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4697 ) ( STORE_OF ?AUTO_4702 ?AUTO_4697 ) ( EMPTY ?AUTO_4702 ) ( CAN_TRAVERSE ?AUTO_4697 ?AUTO_4698 ?AUTO_4696 ) ( AT ?AUTO_4697 ?AUTO_4698 ) ( VISIBLE ?AUTO_4698 ?AUTO_4696 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4697 ?AUTO_4698 ?AUTO_4696 )
      ( GET_SOIL_DATA ?AUTO_4696 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4696 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4703 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4707 - LANDER
      ?AUTO_4709 - WAYPOINT
      ?AUTO_4708 - WAYPOINT
      ?AUTO_4705 - ROVER
      ?AUTO_4706 - WAYPOINT
      ?AUTO_4704 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4707 ?AUTO_4709 ) ( VISIBLE ?AUTO_4708 ?AUTO_4709 ) ( AVAILABLE ?AUTO_4705 ) ( CHANNEL_FREE ?AUTO_4707 ) ( not ( = ?AUTO_4703 ?AUTO_4708 ) ) ( not ( = ?AUTO_4703 ?AUTO_4709 ) ) ( not ( = ?AUTO_4708 ?AUTO_4709 ) ) ( CAN_TRAVERSE ?AUTO_4705 ?AUTO_4706 ?AUTO_4708 ) ( VISIBLE ?AUTO_4706 ?AUTO_4708 ) ( not ( = ?AUTO_4703 ?AUTO_4706 ) ) ( not ( = ?AUTO_4709 ?AUTO_4706 ) ) ( not ( = ?AUTO_4708 ?AUTO_4706 ) ) ( CAN_TRAVERSE ?AUTO_4705 ?AUTO_4703 ?AUTO_4706 ) ( VISIBLE ?AUTO_4703 ?AUTO_4706 ) ( AT_SOIL_SAMPLE ?AUTO_4703 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4705 ) ( STORE_OF ?AUTO_4704 ?AUTO_4705 ) ( CAN_TRAVERSE ?AUTO_4705 ?AUTO_4706 ?AUTO_4703 ) ( AT ?AUTO_4705 ?AUTO_4706 ) ( VISIBLE ?AUTO_4706 ?AUTO_4703 ) ( FULL ?AUTO_4704 ) )
    :subtasks
    ( ( !DROP ?AUTO_4705 ?AUTO_4704 )
      ( GET_SOIL_DATA ?AUTO_4703 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4703 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4711 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4716 - LANDER
      ?AUTO_4714 - WAYPOINT
      ?AUTO_4717 - WAYPOINT
      ?AUTO_4713 - ROVER
      ?AUTO_4715 - WAYPOINT
      ?AUTO_4712 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4716 ?AUTO_4714 ) ( VISIBLE ?AUTO_4717 ?AUTO_4714 ) ( AVAILABLE ?AUTO_4713 ) ( CHANNEL_FREE ?AUTO_4716 ) ( not ( = ?AUTO_4711 ?AUTO_4717 ) ) ( not ( = ?AUTO_4711 ?AUTO_4714 ) ) ( not ( = ?AUTO_4717 ?AUTO_4714 ) ) ( CAN_TRAVERSE ?AUTO_4713 ?AUTO_4715 ?AUTO_4717 ) ( VISIBLE ?AUTO_4715 ?AUTO_4717 ) ( not ( = ?AUTO_4711 ?AUTO_4715 ) ) ( not ( = ?AUTO_4714 ?AUTO_4715 ) ) ( not ( = ?AUTO_4717 ?AUTO_4715 ) ) ( CAN_TRAVERSE ?AUTO_4713 ?AUTO_4711 ?AUTO_4715 ) ( VISIBLE ?AUTO_4711 ?AUTO_4715 ) ( AT_SOIL_SAMPLE ?AUTO_4711 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4713 ) ( STORE_OF ?AUTO_4712 ?AUTO_4713 ) ( EMPTY ?AUTO_4712 ) ( CAN_TRAVERSE ?AUTO_4713 ?AUTO_4715 ?AUTO_4711 ) ( VISIBLE ?AUTO_4715 ?AUTO_4711 ) ( CAN_TRAVERSE ?AUTO_4713 ?AUTO_4717 ?AUTO_4715 ) ( AT ?AUTO_4713 ?AUTO_4717 ) ( VISIBLE ?AUTO_4717 ?AUTO_4715 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4713 ?AUTO_4717 ?AUTO_4715 )
      ( GET_SOIL_DATA ?AUTO_4711 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4711 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4718 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4724 - LANDER
      ?AUTO_4720 - WAYPOINT
      ?AUTO_4723 - WAYPOINT
      ?AUTO_4722 - ROVER
      ?AUTO_4721 - WAYPOINT
      ?AUTO_4719 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4724 ?AUTO_4720 ) ( VISIBLE ?AUTO_4723 ?AUTO_4720 ) ( AVAILABLE ?AUTO_4722 ) ( CHANNEL_FREE ?AUTO_4724 ) ( not ( = ?AUTO_4718 ?AUTO_4723 ) ) ( not ( = ?AUTO_4718 ?AUTO_4720 ) ) ( not ( = ?AUTO_4723 ?AUTO_4720 ) ) ( CAN_TRAVERSE ?AUTO_4722 ?AUTO_4721 ?AUTO_4723 ) ( VISIBLE ?AUTO_4721 ?AUTO_4723 ) ( not ( = ?AUTO_4718 ?AUTO_4721 ) ) ( not ( = ?AUTO_4720 ?AUTO_4721 ) ) ( not ( = ?AUTO_4723 ?AUTO_4721 ) ) ( CAN_TRAVERSE ?AUTO_4722 ?AUTO_4718 ?AUTO_4721 ) ( VISIBLE ?AUTO_4718 ?AUTO_4721 ) ( AT_SOIL_SAMPLE ?AUTO_4718 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4722 ) ( STORE_OF ?AUTO_4719 ?AUTO_4722 ) ( CAN_TRAVERSE ?AUTO_4722 ?AUTO_4721 ?AUTO_4718 ) ( VISIBLE ?AUTO_4721 ?AUTO_4718 ) ( CAN_TRAVERSE ?AUTO_4722 ?AUTO_4723 ?AUTO_4721 ) ( AT ?AUTO_4722 ?AUTO_4723 ) ( VISIBLE ?AUTO_4723 ?AUTO_4721 ) ( FULL ?AUTO_4719 ) )
    :subtasks
    ( ( !DROP ?AUTO_4722 ?AUTO_4719 )
      ( GET_SOIL_DATA ?AUTO_4718 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4718 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4726 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4729 - LANDER
      ?AUTO_4732 - WAYPOINT
      ?AUTO_4731 - WAYPOINT
      ?AUTO_4727 - ROVER
      ?AUTO_4728 - WAYPOINT
      ?AUTO_4730 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4729 ?AUTO_4732 ) ( VISIBLE ?AUTO_4731 ?AUTO_4732 ) ( AVAILABLE ?AUTO_4727 ) ( CHANNEL_FREE ?AUTO_4729 ) ( not ( = ?AUTO_4726 ?AUTO_4731 ) ) ( not ( = ?AUTO_4726 ?AUTO_4732 ) ) ( not ( = ?AUTO_4731 ?AUTO_4732 ) ) ( CAN_TRAVERSE ?AUTO_4727 ?AUTO_4728 ?AUTO_4731 ) ( VISIBLE ?AUTO_4728 ?AUTO_4731 ) ( not ( = ?AUTO_4726 ?AUTO_4728 ) ) ( not ( = ?AUTO_4732 ?AUTO_4728 ) ) ( not ( = ?AUTO_4731 ?AUTO_4728 ) ) ( CAN_TRAVERSE ?AUTO_4727 ?AUTO_4726 ?AUTO_4728 ) ( VISIBLE ?AUTO_4726 ?AUTO_4728 ) ( AT_SOIL_SAMPLE ?AUTO_4726 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4727 ) ( STORE_OF ?AUTO_4730 ?AUTO_4727 ) ( CAN_TRAVERSE ?AUTO_4727 ?AUTO_4728 ?AUTO_4726 ) ( VISIBLE ?AUTO_4728 ?AUTO_4726 ) ( CAN_TRAVERSE ?AUTO_4727 ?AUTO_4731 ?AUTO_4728 ) ( VISIBLE ?AUTO_4731 ?AUTO_4728 ) ( FULL ?AUTO_4730 ) ( CAN_TRAVERSE ?AUTO_4727 ?AUTO_4732 ?AUTO_4731 ) ( AT ?AUTO_4727 ?AUTO_4732 ) ( VISIBLE ?AUTO_4732 ?AUTO_4731 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4727 ?AUTO_4732 ?AUTO_4731 )
      ( GET_SOIL_DATA ?AUTO_4726 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4726 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4733 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4739 - LANDER
      ?AUTO_4737 - WAYPOINT
      ?AUTO_4736 - WAYPOINT
      ?AUTO_4738 - ROVER
      ?AUTO_4735 - WAYPOINT
      ?AUTO_4734 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4739 ?AUTO_4737 ) ( VISIBLE ?AUTO_4736 ?AUTO_4737 ) ( AVAILABLE ?AUTO_4738 ) ( CHANNEL_FREE ?AUTO_4739 ) ( not ( = ?AUTO_4733 ?AUTO_4736 ) ) ( not ( = ?AUTO_4733 ?AUTO_4737 ) ) ( not ( = ?AUTO_4736 ?AUTO_4737 ) ) ( CAN_TRAVERSE ?AUTO_4738 ?AUTO_4735 ?AUTO_4736 ) ( VISIBLE ?AUTO_4735 ?AUTO_4736 ) ( not ( = ?AUTO_4733 ?AUTO_4735 ) ) ( not ( = ?AUTO_4737 ?AUTO_4735 ) ) ( not ( = ?AUTO_4736 ?AUTO_4735 ) ) ( CAN_TRAVERSE ?AUTO_4738 ?AUTO_4733 ?AUTO_4735 ) ( VISIBLE ?AUTO_4733 ?AUTO_4735 ) ( AT_SOIL_SAMPLE ?AUTO_4733 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4738 ) ( STORE_OF ?AUTO_4734 ?AUTO_4738 ) ( CAN_TRAVERSE ?AUTO_4738 ?AUTO_4735 ?AUTO_4733 ) ( VISIBLE ?AUTO_4735 ?AUTO_4733 ) ( CAN_TRAVERSE ?AUTO_4738 ?AUTO_4736 ?AUTO_4735 ) ( VISIBLE ?AUTO_4736 ?AUTO_4735 ) ( CAN_TRAVERSE ?AUTO_4738 ?AUTO_4737 ?AUTO_4736 ) ( AT ?AUTO_4738 ?AUTO_4737 ) ( VISIBLE ?AUTO_4737 ?AUTO_4736 ) ( AT_SOIL_SAMPLE ?AUTO_4737 ) ( EMPTY ?AUTO_4734 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4738 ?AUTO_4734 ?AUTO_4737 )
      ( GET_SOIL_DATA ?AUTO_4733 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4733 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4740 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4745 - LANDER
      ?AUTO_4744 - WAYPOINT
      ?AUTO_4743 - WAYPOINT
      ?AUTO_4746 - ROVER
      ?AUTO_4741 - WAYPOINT
      ?AUTO_4742 - STORE
      ?AUTO_4747 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4745 ?AUTO_4744 ) ( VISIBLE ?AUTO_4743 ?AUTO_4744 ) ( AVAILABLE ?AUTO_4746 ) ( CHANNEL_FREE ?AUTO_4745 ) ( not ( = ?AUTO_4740 ?AUTO_4743 ) ) ( not ( = ?AUTO_4740 ?AUTO_4744 ) ) ( not ( = ?AUTO_4743 ?AUTO_4744 ) ) ( CAN_TRAVERSE ?AUTO_4746 ?AUTO_4741 ?AUTO_4743 ) ( VISIBLE ?AUTO_4741 ?AUTO_4743 ) ( not ( = ?AUTO_4740 ?AUTO_4741 ) ) ( not ( = ?AUTO_4744 ?AUTO_4741 ) ) ( not ( = ?AUTO_4743 ?AUTO_4741 ) ) ( CAN_TRAVERSE ?AUTO_4746 ?AUTO_4740 ?AUTO_4741 ) ( VISIBLE ?AUTO_4740 ?AUTO_4741 ) ( AT_SOIL_SAMPLE ?AUTO_4740 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4746 ) ( STORE_OF ?AUTO_4742 ?AUTO_4746 ) ( CAN_TRAVERSE ?AUTO_4746 ?AUTO_4741 ?AUTO_4740 ) ( VISIBLE ?AUTO_4741 ?AUTO_4740 ) ( CAN_TRAVERSE ?AUTO_4746 ?AUTO_4743 ?AUTO_4741 ) ( VISIBLE ?AUTO_4743 ?AUTO_4741 ) ( CAN_TRAVERSE ?AUTO_4746 ?AUTO_4744 ?AUTO_4743 ) ( VISIBLE ?AUTO_4744 ?AUTO_4743 ) ( AT_SOIL_SAMPLE ?AUTO_4744 ) ( EMPTY ?AUTO_4742 ) ( CAN_TRAVERSE ?AUTO_4746 ?AUTO_4747 ?AUTO_4744 ) ( AT ?AUTO_4746 ?AUTO_4747 ) ( VISIBLE ?AUTO_4747 ?AUTO_4744 ) ( not ( = ?AUTO_4740 ?AUTO_4747 ) ) ( not ( = ?AUTO_4744 ?AUTO_4747 ) ) ( not ( = ?AUTO_4743 ?AUTO_4747 ) ) ( not ( = ?AUTO_4741 ?AUTO_4747 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4746 ?AUTO_4747 ?AUTO_4744 )
      ( GET_SOIL_DATA ?AUTO_4740 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4740 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4748 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4750 - LANDER
      ?AUTO_4753 - WAYPOINT
      ?AUTO_4755 - WAYPOINT
      ?AUTO_4752 - ROVER
      ?AUTO_4749 - WAYPOINT
      ?AUTO_4751 - STORE
      ?AUTO_4754 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4750 ?AUTO_4753 ) ( VISIBLE ?AUTO_4755 ?AUTO_4753 ) ( AVAILABLE ?AUTO_4752 ) ( CHANNEL_FREE ?AUTO_4750 ) ( not ( = ?AUTO_4748 ?AUTO_4755 ) ) ( not ( = ?AUTO_4748 ?AUTO_4753 ) ) ( not ( = ?AUTO_4755 ?AUTO_4753 ) ) ( CAN_TRAVERSE ?AUTO_4752 ?AUTO_4749 ?AUTO_4755 ) ( VISIBLE ?AUTO_4749 ?AUTO_4755 ) ( not ( = ?AUTO_4748 ?AUTO_4749 ) ) ( not ( = ?AUTO_4753 ?AUTO_4749 ) ) ( not ( = ?AUTO_4755 ?AUTO_4749 ) ) ( CAN_TRAVERSE ?AUTO_4752 ?AUTO_4748 ?AUTO_4749 ) ( VISIBLE ?AUTO_4748 ?AUTO_4749 ) ( AT_SOIL_SAMPLE ?AUTO_4748 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4752 ) ( STORE_OF ?AUTO_4751 ?AUTO_4752 ) ( CAN_TRAVERSE ?AUTO_4752 ?AUTO_4749 ?AUTO_4748 ) ( VISIBLE ?AUTO_4749 ?AUTO_4748 ) ( CAN_TRAVERSE ?AUTO_4752 ?AUTO_4755 ?AUTO_4749 ) ( VISIBLE ?AUTO_4755 ?AUTO_4749 ) ( CAN_TRAVERSE ?AUTO_4752 ?AUTO_4753 ?AUTO_4755 ) ( VISIBLE ?AUTO_4753 ?AUTO_4755 ) ( AT_SOIL_SAMPLE ?AUTO_4753 ) ( CAN_TRAVERSE ?AUTO_4752 ?AUTO_4754 ?AUTO_4753 ) ( AT ?AUTO_4752 ?AUTO_4754 ) ( VISIBLE ?AUTO_4754 ?AUTO_4753 ) ( not ( = ?AUTO_4748 ?AUTO_4754 ) ) ( not ( = ?AUTO_4753 ?AUTO_4754 ) ) ( not ( = ?AUTO_4755 ?AUTO_4754 ) ) ( not ( = ?AUTO_4749 ?AUTO_4754 ) ) ( FULL ?AUTO_4751 ) )
    :subtasks
    ( ( !DROP ?AUTO_4752 ?AUTO_4751 )
      ( GET_SOIL_DATA ?AUTO_4748 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4748 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4758 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4764 - LANDER
      ?AUTO_4761 - WAYPOINT
      ?AUTO_4762 - WAYPOINT
      ?AUTO_4760 - ROVER
      ?AUTO_4765 - WAYPOINT
      ?AUTO_4763 - STORE
      ?AUTO_4759 - WAYPOINT
      ?AUTO_4766 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4764 ?AUTO_4761 ) ( VISIBLE ?AUTO_4762 ?AUTO_4761 ) ( AVAILABLE ?AUTO_4760 ) ( CHANNEL_FREE ?AUTO_4764 ) ( not ( = ?AUTO_4758 ?AUTO_4762 ) ) ( not ( = ?AUTO_4758 ?AUTO_4761 ) ) ( not ( = ?AUTO_4762 ?AUTO_4761 ) ) ( CAN_TRAVERSE ?AUTO_4760 ?AUTO_4765 ?AUTO_4762 ) ( VISIBLE ?AUTO_4765 ?AUTO_4762 ) ( not ( = ?AUTO_4758 ?AUTO_4765 ) ) ( not ( = ?AUTO_4761 ?AUTO_4765 ) ) ( not ( = ?AUTO_4762 ?AUTO_4765 ) ) ( CAN_TRAVERSE ?AUTO_4760 ?AUTO_4758 ?AUTO_4765 ) ( VISIBLE ?AUTO_4758 ?AUTO_4765 ) ( AT_SOIL_SAMPLE ?AUTO_4758 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4760 ) ( STORE_OF ?AUTO_4763 ?AUTO_4760 ) ( CAN_TRAVERSE ?AUTO_4760 ?AUTO_4765 ?AUTO_4758 ) ( VISIBLE ?AUTO_4765 ?AUTO_4758 ) ( CAN_TRAVERSE ?AUTO_4760 ?AUTO_4762 ?AUTO_4765 ) ( VISIBLE ?AUTO_4762 ?AUTO_4765 ) ( CAN_TRAVERSE ?AUTO_4760 ?AUTO_4761 ?AUTO_4762 ) ( VISIBLE ?AUTO_4761 ?AUTO_4762 ) ( AT_SOIL_SAMPLE ?AUTO_4761 ) ( EMPTY ?AUTO_4763 ) ( CAN_TRAVERSE ?AUTO_4760 ?AUTO_4759 ?AUTO_4761 ) ( VISIBLE ?AUTO_4759 ?AUTO_4761 ) ( not ( = ?AUTO_4758 ?AUTO_4759 ) ) ( not ( = ?AUTO_4761 ?AUTO_4759 ) ) ( not ( = ?AUTO_4762 ?AUTO_4759 ) ) ( not ( = ?AUTO_4765 ?AUTO_4759 ) ) ( CAN_TRAVERSE ?AUTO_4760 ?AUTO_4766 ?AUTO_4759 ) ( AT ?AUTO_4760 ?AUTO_4766 ) ( VISIBLE ?AUTO_4766 ?AUTO_4759 ) ( not ( = ?AUTO_4758 ?AUTO_4766 ) ) ( not ( = ?AUTO_4761 ?AUTO_4766 ) ) ( not ( = ?AUTO_4762 ?AUTO_4766 ) ) ( not ( = ?AUTO_4765 ?AUTO_4766 ) ) ( not ( = ?AUTO_4759 ?AUTO_4766 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4760 ?AUTO_4766 ?AUTO_4759 )
      ( GET_SOIL_DATA ?AUTO_4758 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4758 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4789 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4793 - LANDER
      ?AUTO_4791 - WAYPOINT
      ?AUTO_4790 - ROVER
      ?AUTO_4792 - WAYPOINT
      ?AUTO_4794 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4793 ?AUTO_4791 ) ( HAVE_SOIL_ANALYSIS ?AUTO_4790 ?AUTO_4789 ) ( VISIBLE ?AUTO_4792 ?AUTO_4791 ) ( AVAILABLE ?AUTO_4790 ) ( CHANNEL_FREE ?AUTO_4793 ) ( not ( = ?AUTO_4789 ?AUTO_4792 ) ) ( not ( = ?AUTO_4789 ?AUTO_4791 ) ) ( not ( = ?AUTO_4792 ?AUTO_4791 ) ) ( CAN_TRAVERSE ?AUTO_4790 ?AUTO_4789 ?AUTO_4792 ) ( VISIBLE ?AUTO_4789 ?AUTO_4792 ) ( CAN_TRAVERSE ?AUTO_4790 ?AUTO_4794 ?AUTO_4789 ) ( AT ?AUTO_4790 ?AUTO_4794 ) ( VISIBLE ?AUTO_4794 ?AUTO_4789 ) ( not ( = ?AUTO_4789 ?AUTO_4794 ) ) ( not ( = ?AUTO_4791 ?AUTO_4794 ) ) ( not ( = ?AUTO_4792 ?AUTO_4794 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4790 ?AUTO_4794 ?AUTO_4789 )
      ( GET_SOIL_DATA ?AUTO_4789 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4789 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4817 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4822 - LANDER
      ?AUTO_4821 - WAYPOINT
      ?AUTO_4818 - WAYPOINT
      ?AUTO_4820 - ROVER
      ?AUTO_4819 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4822 ?AUTO_4821 ) ( VISIBLE ?AUTO_4818 ?AUTO_4821 ) ( AVAILABLE ?AUTO_4820 ) ( CHANNEL_FREE ?AUTO_4822 ) ( not ( = ?AUTO_4817 ?AUTO_4818 ) ) ( not ( = ?AUTO_4817 ?AUTO_4821 ) ) ( not ( = ?AUTO_4818 ?AUTO_4821 ) ) ( CAN_TRAVERSE ?AUTO_4820 ?AUTO_4817 ?AUTO_4818 ) ( VISIBLE ?AUTO_4817 ?AUTO_4818 ) ( AT_SOIL_SAMPLE ?AUTO_4817 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4820 ) ( STORE_OF ?AUTO_4819 ?AUTO_4820 ) ( CAN_TRAVERSE ?AUTO_4820 ?AUTO_4818 ?AUTO_4817 ) ( VISIBLE ?AUTO_4818 ?AUTO_4817 ) ( FULL ?AUTO_4819 ) ( CAN_TRAVERSE ?AUTO_4820 ?AUTO_4821 ?AUTO_4818 ) ( AT ?AUTO_4820 ?AUTO_4821 ) ( VISIBLE ?AUTO_4821 ?AUTO_4818 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4820 ?AUTO_4821 ?AUTO_4818 )
      ( GET_SOIL_DATA ?AUTO_4817 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4817 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4823 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4825 - LANDER
      ?AUTO_4828 - WAYPOINT
      ?AUTO_4827 - WAYPOINT
      ?AUTO_4824 - ROVER
      ?AUTO_4826 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4825 ?AUTO_4828 ) ( VISIBLE ?AUTO_4827 ?AUTO_4828 ) ( AVAILABLE ?AUTO_4824 ) ( CHANNEL_FREE ?AUTO_4825 ) ( not ( = ?AUTO_4823 ?AUTO_4827 ) ) ( not ( = ?AUTO_4823 ?AUTO_4828 ) ) ( not ( = ?AUTO_4827 ?AUTO_4828 ) ) ( CAN_TRAVERSE ?AUTO_4824 ?AUTO_4823 ?AUTO_4827 ) ( VISIBLE ?AUTO_4823 ?AUTO_4827 ) ( AT_SOIL_SAMPLE ?AUTO_4823 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4824 ) ( STORE_OF ?AUTO_4826 ?AUTO_4824 ) ( CAN_TRAVERSE ?AUTO_4824 ?AUTO_4827 ?AUTO_4823 ) ( VISIBLE ?AUTO_4827 ?AUTO_4823 ) ( CAN_TRAVERSE ?AUTO_4824 ?AUTO_4828 ?AUTO_4827 ) ( AT ?AUTO_4824 ?AUTO_4828 ) ( VISIBLE ?AUTO_4828 ?AUTO_4827 ) ( AT_SOIL_SAMPLE ?AUTO_4828 ) ( EMPTY ?AUTO_4826 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4824 ?AUTO_4826 ?AUTO_4828 )
      ( GET_SOIL_DATA ?AUTO_4823 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4823 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10046 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10047 - LANDER
      ?AUTO_10050 - WAYPOINT
      ?AUTO_10048 - WAYPOINT
      ?AUTO_10051 - ROVER
      ?AUTO_10049 - STORE
      ?AUTO_10052 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10047 ?AUTO_10050 ) ( VISIBLE ?AUTO_10048 ?AUTO_10050 ) ( AVAILABLE ?AUTO_10051 ) ( CHANNEL_FREE ?AUTO_10047 ) ( not ( = ?AUTO_10046 ?AUTO_10048 ) ) ( not ( = ?AUTO_10046 ?AUTO_10050 ) ) ( not ( = ?AUTO_10048 ?AUTO_10050 ) ) ( CAN_TRAVERSE ?AUTO_10051 ?AUTO_10046 ?AUTO_10048 ) ( VISIBLE ?AUTO_10046 ?AUTO_10048 ) ( AT_SOIL_SAMPLE ?AUTO_10046 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10051 ) ( STORE_OF ?AUTO_10049 ?AUTO_10051 ) ( EMPTY ?AUTO_10049 ) ( CAN_TRAVERSE ?AUTO_10051 ?AUTO_10048 ?AUTO_10046 ) ( VISIBLE ?AUTO_10048 ?AUTO_10046 ) ( CAN_TRAVERSE ?AUTO_10051 ?AUTO_10050 ?AUTO_10048 ) ( VISIBLE ?AUTO_10050 ?AUTO_10048 ) ( CAN_TRAVERSE ?AUTO_10051 ?AUTO_10052 ?AUTO_10050 ) ( AT ?AUTO_10051 ?AUTO_10052 ) ( VISIBLE ?AUTO_10052 ?AUTO_10050 ) ( not ( = ?AUTO_10046 ?AUTO_10052 ) ) ( not ( = ?AUTO_10050 ?AUTO_10052 ) ) ( not ( = ?AUTO_10048 ?AUTO_10052 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10051 ?AUTO_10052 ?AUTO_10050 )
      ( GET_SOIL_DATA ?AUTO_10046 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10046 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4836 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4839 - LANDER
      ?AUTO_4838 - WAYPOINT
      ?AUTO_4842 - WAYPOINT
      ?AUTO_4837 - ROVER
      ?AUTO_4840 - STORE
      ?AUTO_4841 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4839 ?AUTO_4838 ) ( VISIBLE ?AUTO_4842 ?AUTO_4838 ) ( AVAILABLE ?AUTO_4837 ) ( CHANNEL_FREE ?AUTO_4839 ) ( not ( = ?AUTO_4836 ?AUTO_4842 ) ) ( not ( = ?AUTO_4836 ?AUTO_4838 ) ) ( not ( = ?AUTO_4842 ?AUTO_4838 ) ) ( CAN_TRAVERSE ?AUTO_4837 ?AUTO_4836 ?AUTO_4842 ) ( VISIBLE ?AUTO_4836 ?AUTO_4842 ) ( AT_SOIL_SAMPLE ?AUTO_4836 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4837 ) ( STORE_OF ?AUTO_4840 ?AUTO_4837 ) ( CAN_TRAVERSE ?AUTO_4837 ?AUTO_4842 ?AUTO_4836 ) ( VISIBLE ?AUTO_4842 ?AUTO_4836 ) ( CAN_TRAVERSE ?AUTO_4837 ?AUTO_4838 ?AUTO_4842 ) ( VISIBLE ?AUTO_4838 ?AUTO_4842 ) ( AT_SOIL_SAMPLE ?AUTO_4838 ) ( CAN_TRAVERSE ?AUTO_4837 ?AUTO_4841 ?AUTO_4838 ) ( AT ?AUTO_4837 ?AUTO_4841 ) ( VISIBLE ?AUTO_4841 ?AUTO_4838 ) ( not ( = ?AUTO_4836 ?AUTO_4841 ) ) ( not ( = ?AUTO_4838 ?AUTO_4841 ) ) ( not ( = ?AUTO_4842 ?AUTO_4841 ) ) ( FULL ?AUTO_4840 ) )
    :subtasks
    ( ( !DROP ?AUTO_4837 ?AUTO_4840 )
      ( GET_SOIL_DATA ?AUTO_4836 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4836 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4845 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4851 - LANDER
      ?AUTO_4850 - WAYPOINT
      ?AUTO_4849 - WAYPOINT
      ?AUTO_4848 - ROVER
      ?AUTO_4846 - STORE
      ?AUTO_4847 - WAYPOINT
      ?AUTO_4852 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4851 ?AUTO_4850 ) ( VISIBLE ?AUTO_4849 ?AUTO_4850 ) ( AVAILABLE ?AUTO_4848 ) ( CHANNEL_FREE ?AUTO_4851 ) ( not ( = ?AUTO_4845 ?AUTO_4849 ) ) ( not ( = ?AUTO_4845 ?AUTO_4850 ) ) ( not ( = ?AUTO_4849 ?AUTO_4850 ) ) ( CAN_TRAVERSE ?AUTO_4848 ?AUTO_4845 ?AUTO_4849 ) ( VISIBLE ?AUTO_4845 ?AUTO_4849 ) ( AT_SOIL_SAMPLE ?AUTO_4845 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4848 ) ( STORE_OF ?AUTO_4846 ?AUTO_4848 ) ( CAN_TRAVERSE ?AUTO_4848 ?AUTO_4849 ?AUTO_4845 ) ( VISIBLE ?AUTO_4849 ?AUTO_4845 ) ( CAN_TRAVERSE ?AUTO_4848 ?AUTO_4850 ?AUTO_4849 ) ( VISIBLE ?AUTO_4850 ?AUTO_4849 ) ( AT_SOIL_SAMPLE ?AUTO_4850 ) ( EMPTY ?AUTO_4846 ) ( CAN_TRAVERSE ?AUTO_4848 ?AUTO_4847 ?AUTO_4850 ) ( VISIBLE ?AUTO_4847 ?AUTO_4850 ) ( not ( = ?AUTO_4845 ?AUTO_4847 ) ) ( not ( = ?AUTO_4850 ?AUTO_4847 ) ) ( not ( = ?AUTO_4849 ?AUTO_4847 ) ) ( CAN_TRAVERSE ?AUTO_4848 ?AUTO_4852 ?AUTO_4847 ) ( AT ?AUTO_4848 ?AUTO_4852 ) ( VISIBLE ?AUTO_4852 ?AUTO_4847 ) ( not ( = ?AUTO_4845 ?AUTO_4852 ) ) ( not ( = ?AUTO_4850 ?AUTO_4852 ) ) ( not ( = ?AUTO_4849 ?AUTO_4852 ) ) ( not ( = ?AUTO_4847 ?AUTO_4852 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4848 ?AUTO_4852 ?AUTO_4847 )
      ( GET_SOIL_DATA ?AUTO_4845 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4845 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4943 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4946 - LANDER
      ?AUTO_4944 - WAYPOINT
      ?AUTO_4947 - WAYPOINT
      ?AUTO_4948 - ROVER
      ?AUTO_4945 - WAYPOINT
      ?AUTO_4949 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4946 ?AUTO_4944 ) ( VISIBLE ?AUTO_4947 ?AUTO_4944 ) ( AVAILABLE ?AUTO_4948 ) ( CHANNEL_FREE ?AUTO_4946 ) ( not ( = ?AUTO_4943 ?AUTO_4947 ) ) ( not ( = ?AUTO_4943 ?AUTO_4944 ) ) ( not ( = ?AUTO_4947 ?AUTO_4944 ) ) ( CAN_TRAVERSE ?AUTO_4948 ?AUTO_4945 ?AUTO_4947 ) ( VISIBLE ?AUTO_4945 ?AUTO_4947 ) ( not ( = ?AUTO_4943 ?AUTO_4945 ) ) ( not ( = ?AUTO_4944 ?AUTO_4945 ) ) ( not ( = ?AUTO_4947 ?AUTO_4945 ) ) ( CAN_TRAVERSE ?AUTO_4948 ?AUTO_4943 ?AUTO_4945 ) ( VISIBLE ?AUTO_4943 ?AUTO_4945 ) ( AT_ROCK_SAMPLE ?AUTO_4943 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4948 ) ( STORE_OF ?AUTO_4949 ?AUTO_4948 ) ( EMPTY ?AUTO_4949 ) ( CAN_TRAVERSE ?AUTO_4948 ?AUTO_4947 ?AUTO_4943 ) ( AT ?AUTO_4948 ?AUTO_4947 ) ( VISIBLE ?AUTO_4947 ?AUTO_4943 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4948 ?AUTO_4947 ?AUTO_4943 )
      ( GET_ROCK_DATA ?AUTO_4943 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4943 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4970 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4971 - LANDER
      ?AUTO_4972 - WAYPOINT
      ?AUTO_4975 - WAYPOINT
      ?AUTO_4976 - ROVER
      ?AUTO_4973 - WAYPOINT
      ?AUTO_4974 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4971 ?AUTO_4972 ) ( VISIBLE ?AUTO_4975 ?AUTO_4972 ) ( AVAILABLE ?AUTO_4976 ) ( CHANNEL_FREE ?AUTO_4971 ) ( not ( = ?AUTO_4970 ?AUTO_4975 ) ) ( not ( = ?AUTO_4970 ?AUTO_4972 ) ) ( not ( = ?AUTO_4975 ?AUTO_4972 ) ) ( CAN_TRAVERSE ?AUTO_4976 ?AUTO_4973 ?AUTO_4975 ) ( VISIBLE ?AUTO_4973 ?AUTO_4975 ) ( not ( = ?AUTO_4970 ?AUTO_4973 ) ) ( not ( = ?AUTO_4972 ?AUTO_4973 ) ) ( not ( = ?AUTO_4975 ?AUTO_4973 ) ) ( CAN_TRAVERSE ?AUTO_4976 ?AUTO_4970 ?AUTO_4973 ) ( VISIBLE ?AUTO_4970 ?AUTO_4973 ) ( AT_ROCK_SAMPLE ?AUTO_4970 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4976 ) ( STORE_OF ?AUTO_4974 ?AUTO_4976 ) ( EMPTY ?AUTO_4974 ) ( CAN_TRAVERSE ?AUTO_4976 ?AUTO_4975 ?AUTO_4970 ) ( VISIBLE ?AUTO_4975 ?AUTO_4970 ) ( AT ?AUTO_4976 ?AUTO_4973 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4976 ?AUTO_4973 ?AUTO_4975 )
      ( GET_ROCK_DATA ?AUTO_4970 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4970 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4977 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4981 - LANDER
      ?AUTO_4979 - WAYPOINT
      ?AUTO_4978 - WAYPOINT
      ?AUTO_4982 - ROVER
      ?AUTO_4983 - WAYPOINT
      ?AUTO_4980 - STORE
      ?AUTO_4984 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4981 ?AUTO_4979 ) ( VISIBLE ?AUTO_4978 ?AUTO_4979 ) ( AVAILABLE ?AUTO_4982 ) ( CHANNEL_FREE ?AUTO_4981 ) ( not ( = ?AUTO_4977 ?AUTO_4978 ) ) ( not ( = ?AUTO_4977 ?AUTO_4979 ) ) ( not ( = ?AUTO_4978 ?AUTO_4979 ) ) ( CAN_TRAVERSE ?AUTO_4982 ?AUTO_4983 ?AUTO_4978 ) ( VISIBLE ?AUTO_4983 ?AUTO_4978 ) ( not ( = ?AUTO_4977 ?AUTO_4983 ) ) ( not ( = ?AUTO_4979 ?AUTO_4983 ) ) ( not ( = ?AUTO_4978 ?AUTO_4983 ) ) ( CAN_TRAVERSE ?AUTO_4982 ?AUTO_4977 ?AUTO_4983 ) ( VISIBLE ?AUTO_4977 ?AUTO_4983 ) ( AT_ROCK_SAMPLE ?AUTO_4977 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4982 ) ( STORE_OF ?AUTO_4980 ?AUTO_4982 ) ( EMPTY ?AUTO_4980 ) ( CAN_TRAVERSE ?AUTO_4982 ?AUTO_4978 ?AUTO_4977 ) ( VISIBLE ?AUTO_4978 ?AUTO_4977 ) ( CAN_TRAVERSE ?AUTO_4982 ?AUTO_4984 ?AUTO_4983 ) ( AT ?AUTO_4982 ?AUTO_4984 ) ( VISIBLE ?AUTO_4984 ?AUTO_4983 ) ( not ( = ?AUTO_4977 ?AUTO_4984 ) ) ( not ( = ?AUTO_4979 ?AUTO_4984 ) ) ( not ( = ?AUTO_4978 ?AUTO_4984 ) ) ( not ( = ?AUTO_4983 ?AUTO_4984 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4982 ?AUTO_4984 ?AUTO_4983 )
      ( GET_ROCK_DATA ?AUTO_4977 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4977 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5021 - OBJECTIVE
      ?AUTO_5022 - MODE
    )
    :vars
    (
      ?AUTO_5025 - LANDER
      ?AUTO_5026 - WAYPOINT
      ?AUTO_5024 - WAYPOINT
      ?AUTO_5023 - ROVER
      ?AUTO_5027 - CAMERA
      ?AUTO_5028 - OBJECTIVE
      ?AUTO_5029 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5025 ?AUTO_5026 ) ( VISIBLE ?AUTO_5024 ?AUTO_5026 ) ( AVAILABLE ?AUTO_5023 ) ( CHANNEL_FREE ?AUTO_5025 ) ( not ( = ?AUTO_5024 ?AUTO_5026 ) ) ( CAN_TRAVERSE ?AUTO_5023 ?AUTO_5026 ?AUTO_5024 ) ( VISIBLE ?AUTO_5026 ?AUTO_5024 ) ( ON_BOARD ?AUTO_5027 ?AUTO_5023 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5023 ) ( SUPPORTS ?AUTO_5027 ?AUTO_5022 ) ( VISIBLE_FROM ?AUTO_5021 ?AUTO_5026 ) ( CAN_TRAVERSE ?AUTO_5023 ?AUTO_5024 ?AUTO_5026 ) ( CALIBRATION_TARGET ?AUTO_5027 ?AUTO_5028 ) ( VISIBLE_FROM ?AUTO_5028 ?AUTO_5024 ) ( not ( = ?AUTO_5021 ?AUTO_5028 ) ) ( CAN_TRAVERSE ?AUTO_5023 ?AUTO_5029 ?AUTO_5024 ) ( AT ?AUTO_5023 ?AUTO_5029 ) ( VISIBLE ?AUTO_5029 ?AUTO_5024 ) ( not ( = ?AUTO_5026 ?AUTO_5029 ) ) ( not ( = ?AUTO_5024 ?AUTO_5029 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5023 ?AUTO_5029 ?AUTO_5024 )
      ( GET_IMAGE_DATA ?AUTO_5021 ?AUTO_5022 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5021 ?AUTO_5022 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5087 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5089 - LANDER
      ?AUTO_5090 - WAYPOINT
      ?AUTO_5088 - ROVER
      ?AUTO_5091 - STORE
      ?AUTO_5092 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5089 ?AUTO_5087 ) ( VISIBLE ?AUTO_5090 ?AUTO_5087 ) ( AVAILABLE ?AUTO_5088 ) ( CHANNEL_FREE ?AUTO_5089 ) ( not ( = ?AUTO_5087 ?AUTO_5090 ) ) ( CAN_TRAVERSE ?AUTO_5088 ?AUTO_5087 ?AUTO_5090 ) ( VISIBLE ?AUTO_5087 ?AUTO_5090 ) ( AT_SOIL_SAMPLE ?AUTO_5087 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5088 ) ( STORE_OF ?AUTO_5091 ?AUTO_5088 ) ( EMPTY ?AUTO_5091 ) ( CAN_TRAVERSE ?AUTO_5088 ?AUTO_5090 ?AUTO_5087 ) ( CAN_TRAVERSE ?AUTO_5088 ?AUTO_5092 ?AUTO_5090 ) ( AT ?AUTO_5088 ?AUTO_5092 ) ( VISIBLE ?AUTO_5092 ?AUTO_5090 ) ( not ( = ?AUTO_5087 ?AUTO_5092 ) ) ( not ( = ?AUTO_5090 ?AUTO_5092 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5088 ?AUTO_5092 ?AUTO_5090 )
      ( GET_SOIL_DATA ?AUTO_5087 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5087 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5123 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5126 - LANDER
      ?AUTO_5124 - WAYPOINT
      ?AUTO_5127 - WAYPOINT
      ?AUTO_5125 - ROVER
      ?AUTO_5128 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5126 ?AUTO_5124 ) ( VISIBLE ?AUTO_5127 ?AUTO_5124 ) ( AVAILABLE ?AUTO_5125 ) ( CHANNEL_FREE ?AUTO_5126 ) ( not ( = ?AUTO_5123 ?AUTO_5127 ) ) ( not ( = ?AUTO_5123 ?AUTO_5124 ) ) ( not ( = ?AUTO_5127 ?AUTO_5124 ) ) ( CAN_TRAVERSE ?AUTO_5125 ?AUTO_5123 ?AUTO_5127 ) ( VISIBLE ?AUTO_5123 ?AUTO_5127 ) ( AT_ROCK_SAMPLE ?AUTO_5123 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5125 ) ( STORE_OF ?AUTO_5128 ?AUTO_5125 ) ( CAN_TRAVERSE ?AUTO_5125 ?AUTO_5127 ?AUTO_5123 ) ( VISIBLE ?AUTO_5127 ?AUTO_5123 ) ( CAN_TRAVERSE ?AUTO_5125 ?AUTO_5124 ?AUTO_5127 ) ( AT ?AUTO_5125 ?AUTO_5124 ) ( VISIBLE ?AUTO_5124 ?AUTO_5127 ) ( FULL ?AUTO_5128 ) )
    :subtasks
    ( ( !DROP ?AUTO_5125 ?AUTO_5128 )
      ( GET_ROCK_DATA ?AUTO_5123 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5123 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5190 - OBJECTIVE
      ?AUTO_5189 - MODE
    )
    :vars
    (
      ?AUTO_5193 - LANDER
      ?AUTO_5192 - WAYPOINT
      ?AUTO_5196 - WAYPOINT
      ?AUTO_5194 - ROVER
      ?AUTO_5197 - CAMERA
      ?AUTO_5191 - WAYPOINT
      ?AUTO_5195 - WAYPOINT
      ?AUTO_5198 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5193 ?AUTO_5192 ) ( VISIBLE ?AUTO_5196 ?AUTO_5192 ) ( AVAILABLE ?AUTO_5194 ) ( CHANNEL_FREE ?AUTO_5193 ) ( not ( = ?AUTO_5196 ?AUTO_5192 ) ) ( CALIBRATED ?AUTO_5197 ?AUTO_5194 ) ( ON_BOARD ?AUTO_5197 ?AUTO_5194 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5194 ) ( SUPPORTS ?AUTO_5197 ?AUTO_5189 ) ( VISIBLE_FROM ?AUTO_5190 ?AUTO_5196 ) ( CAN_TRAVERSE ?AUTO_5194 ?AUTO_5191 ?AUTO_5196 ) ( VISIBLE ?AUTO_5191 ?AUTO_5196 ) ( not ( = ?AUTO_5192 ?AUTO_5191 ) ) ( not ( = ?AUTO_5196 ?AUTO_5191 ) ) ( CAN_TRAVERSE ?AUTO_5194 ?AUTO_5195 ?AUTO_5191 ) ( VISIBLE ?AUTO_5195 ?AUTO_5191 ) ( not ( = ?AUTO_5192 ?AUTO_5195 ) ) ( not ( = ?AUTO_5196 ?AUTO_5195 ) ) ( not ( = ?AUTO_5191 ?AUTO_5195 ) ) ( CAN_TRAVERSE ?AUTO_5194 ?AUTO_5198 ?AUTO_5195 ) ( AT ?AUTO_5194 ?AUTO_5198 ) ( VISIBLE ?AUTO_5198 ?AUTO_5195 ) ( not ( = ?AUTO_5192 ?AUTO_5198 ) ) ( not ( = ?AUTO_5196 ?AUTO_5198 ) ) ( not ( = ?AUTO_5191 ?AUTO_5198 ) ) ( not ( = ?AUTO_5195 ?AUTO_5198 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5194 ?AUTO_5198 ?AUTO_5195 )
      ( GET_IMAGE_DATA ?AUTO_5190 ?AUTO_5189 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5190 ?AUTO_5189 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5200 - OBJECTIVE
      ?AUTO_5199 - MODE
    )
    :vars
    (
      ?AUTO_5204 - LANDER
      ?AUTO_5202 - WAYPOINT
      ?AUTO_5203 - WAYPOINT
      ?AUTO_5205 - ROVER
      ?AUTO_5207 - CAMERA
      ?AUTO_5201 - WAYPOINT
      ?AUTO_5206 - WAYPOINT
      ?AUTO_5208 - WAYPOINT
      ?AUTO_5209 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5204 ?AUTO_5202 ) ( VISIBLE ?AUTO_5203 ?AUTO_5202 ) ( AVAILABLE ?AUTO_5205 ) ( CHANNEL_FREE ?AUTO_5204 ) ( not ( = ?AUTO_5203 ?AUTO_5202 ) ) ( ON_BOARD ?AUTO_5207 ?AUTO_5205 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5205 ) ( SUPPORTS ?AUTO_5207 ?AUTO_5199 ) ( VISIBLE_FROM ?AUTO_5200 ?AUTO_5203 ) ( CAN_TRAVERSE ?AUTO_5205 ?AUTO_5201 ?AUTO_5203 ) ( VISIBLE ?AUTO_5201 ?AUTO_5203 ) ( not ( = ?AUTO_5202 ?AUTO_5201 ) ) ( not ( = ?AUTO_5203 ?AUTO_5201 ) ) ( CAN_TRAVERSE ?AUTO_5205 ?AUTO_5206 ?AUTO_5201 ) ( VISIBLE ?AUTO_5206 ?AUTO_5201 ) ( not ( = ?AUTO_5202 ?AUTO_5206 ) ) ( not ( = ?AUTO_5203 ?AUTO_5206 ) ) ( not ( = ?AUTO_5201 ?AUTO_5206 ) ) ( CAN_TRAVERSE ?AUTO_5205 ?AUTO_5208 ?AUTO_5206 ) ( AT ?AUTO_5205 ?AUTO_5208 ) ( VISIBLE ?AUTO_5208 ?AUTO_5206 ) ( not ( = ?AUTO_5202 ?AUTO_5208 ) ) ( not ( = ?AUTO_5203 ?AUTO_5208 ) ) ( not ( = ?AUTO_5201 ?AUTO_5208 ) ) ( not ( = ?AUTO_5206 ?AUTO_5208 ) ) ( CALIBRATION_TARGET ?AUTO_5207 ?AUTO_5209 ) ( VISIBLE_FROM ?AUTO_5209 ?AUTO_5208 ) ( not ( = ?AUTO_5200 ?AUTO_5209 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5205 ?AUTO_5207 ?AUTO_5209 ?AUTO_5208 )
      ( GET_IMAGE_DATA ?AUTO_5200 ?AUTO_5199 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5200 ?AUTO_5199 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5211 - OBJECTIVE
      ?AUTO_5210 - MODE
    )
    :vars
    (
      ?AUTO_5219 - LANDER
      ?AUTO_5218 - WAYPOINT
      ?AUTO_5215 - WAYPOINT
      ?AUTO_5214 - ROVER
      ?AUTO_5212 - CAMERA
      ?AUTO_5216 - WAYPOINT
      ?AUTO_5217 - WAYPOINT
      ?AUTO_5213 - WAYPOINT
      ?AUTO_5220 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5219 ?AUTO_5218 ) ( VISIBLE ?AUTO_5215 ?AUTO_5218 ) ( AVAILABLE ?AUTO_5214 ) ( CHANNEL_FREE ?AUTO_5219 ) ( not ( = ?AUTO_5215 ?AUTO_5218 ) ) ( ON_BOARD ?AUTO_5212 ?AUTO_5214 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5214 ) ( SUPPORTS ?AUTO_5212 ?AUTO_5210 ) ( VISIBLE_FROM ?AUTO_5211 ?AUTO_5215 ) ( CAN_TRAVERSE ?AUTO_5214 ?AUTO_5216 ?AUTO_5215 ) ( VISIBLE ?AUTO_5216 ?AUTO_5215 ) ( not ( = ?AUTO_5218 ?AUTO_5216 ) ) ( not ( = ?AUTO_5215 ?AUTO_5216 ) ) ( CAN_TRAVERSE ?AUTO_5214 ?AUTO_5217 ?AUTO_5216 ) ( VISIBLE ?AUTO_5217 ?AUTO_5216 ) ( not ( = ?AUTO_5218 ?AUTO_5217 ) ) ( not ( = ?AUTO_5215 ?AUTO_5217 ) ) ( not ( = ?AUTO_5216 ?AUTO_5217 ) ) ( CAN_TRAVERSE ?AUTO_5214 ?AUTO_5213 ?AUTO_5217 ) ( VISIBLE ?AUTO_5213 ?AUTO_5217 ) ( not ( = ?AUTO_5218 ?AUTO_5213 ) ) ( not ( = ?AUTO_5215 ?AUTO_5213 ) ) ( not ( = ?AUTO_5216 ?AUTO_5213 ) ) ( not ( = ?AUTO_5217 ?AUTO_5213 ) ) ( CALIBRATION_TARGET ?AUTO_5212 ?AUTO_5220 ) ( VISIBLE_FROM ?AUTO_5220 ?AUTO_5213 ) ( not ( = ?AUTO_5211 ?AUTO_5220 ) ) ( CAN_TRAVERSE ?AUTO_5214 ?AUTO_5216 ?AUTO_5213 ) ( AT ?AUTO_5214 ?AUTO_5216 ) ( VISIBLE ?AUTO_5216 ?AUTO_5213 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5214 ?AUTO_5216 ?AUTO_5213 )
      ( GET_IMAGE_DATA ?AUTO_5211 ?AUTO_5210 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5211 ?AUTO_5210 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5232 - OBJECTIVE
      ?AUTO_5231 - MODE
    )
    :vars
    (
      ?AUTO_5233 - LANDER
      ?AUTO_5240 - WAYPOINT
      ?AUTO_5236 - WAYPOINT
      ?AUTO_5235 - ROVER
      ?AUTO_5239 - CAMERA
      ?AUTO_5234 - WAYPOINT
      ?AUTO_5241 - WAYPOINT
      ?AUTO_5238 - WAYPOINT
      ?AUTO_5237 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5233 ?AUTO_5240 ) ( VISIBLE ?AUTO_5236 ?AUTO_5240 ) ( AVAILABLE ?AUTO_5235 ) ( CHANNEL_FREE ?AUTO_5233 ) ( not ( = ?AUTO_5236 ?AUTO_5240 ) ) ( ON_BOARD ?AUTO_5239 ?AUTO_5235 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5235 ) ( SUPPORTS ?AUTO_5239 ?AUTO_5231 ) ( VISIBLE_FROM ?AUTO_5232 ?AUTO_5236 ) ( CAN_TRAVERSE ?AUTO_5235 ?AUTO_5234 ?AUTO_5236 ) ( VISIBLE ?AUTO_5234 ?AUTO_5236 ) ( not ( = ?AUTO_5240 ?AUTO_5234 ) ) ( not ( = ?AUTO_5236 ?AUTO_5234 ) ) ( CAN_TRAVERSE ?AUTO_5235 ?AUTO_5241 ?AUTO_5234 ) ( VISIBLE ?AUTO_5241 ?AUTO_5234 ) ( not ( = ?AUTO_5240 ?AUTO_5241 ) ) ( not ( = ?AUTO_5236 ?AUTO_5241 ) ) ( not ( = ?AUTO_5234 ?AUTO_5241 ) ) ( CAN_TRAVERSE ?AUTO_5235 ?AUTO_5238 ?AUTO_5241 ) ( VISIBLE ?AUTO_5238 ?AUTO_5241 ) ( not ( = ?AUTO_5240 ?AUTO_5238 ) ) ( not ( = ?AUTO_5236 ?AUTO_5238 ) ) ( not ( = ?AUTO_5234 ?AUTO_5238 ) ) ( not ( = ?AUTO_5241 ?AUTO_5238 ) ) ( CALIBRATION_TARGET ?AUTO_5239 ?AUTO_5237 ) ( VISIBLE_FROM ?AUTO_5237 ?AUTO_5238 ) ( not ( = ?AUTO_5232 ?AUTO_5237 ) ) ( CAN_TRAVERSE ?AUTO_5235 ?AUTO_5234 ?AUTO_5238 ) ( VISIBLE ?AUTO_5234 ?AUTO_5238 ) ( CAN_TRAVERSE ?AUTO_5235 ?AUTO_5236 ?AUTO_5234 ) ( AT ?AUTO_5235 ?AUTO_5236 ) ( VISIBLE ?AUTO_5236 ?AUTO_5234 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5235 ?AUTO_5236 ?AUTO_5234 )
      ( GET_IMAGE_DATA ?AUTO_5232 ?AUTO_5231 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5232 ?AUTO_5231 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5325 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5329 - LANDER
      ?AUTO_5327 - WAYPOINT
      ?AUTO_5330 - WAYPOINT
      ?AUTO_5326 - ROVER
      ?AUTO_5328 - STORE
      ?AUTO_5331 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5329 ?AUTO_5327 ) ( VISIBLE ?AUTO_5330 ?AUTO_5327 ) ( AVAILABLE ?AUTO_5326 ) ( CHANNEL_FREE ?AUTO_5329 ) ( not ( = ?AUTO_5325 ?AUTO_5330 ) ) ( not ( = ?AUTO_5325 ?AUTO_5327 ) ) ( not ( = ?AUTO_5330 ?AUTO_5327 ) ) ( CAN_TRAVERSE ?AUTO_5326 ?AUTO_5325 ?AUTO_5330 ) ( VISIBLE ?AUTO_5325 ?AUTO_5330 ) ( AT_SOIL_SAMPLE ?AUTO_5325 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5326 ) ( STORE_OF ?AUTO_5328 ?AUTO_5326 ) ( CAN_TRAVERSE ?AUTO_5326 ?AUTO_5330 ?AUTO_5325 ) ( VISIBLE ?AUTO_5330 ?AUTO_5325 ) ( FULL ?AUTO_5328 ) ( CAN_TRAVERSE ?AUTO_5326 ?AUTO_5331 ?AUTO_5330 ) ( AT ?AUTO_5326 ?AUTO_5331 ) ( VISIBLE ?AUTO_5331 ?AUTO_5330 ) ( not ( = ?AUTO_5325 ?AUTO_5331 ) ) ( not ( = ?AUTO_5327 ?AUTO_5331 ) ) ( not ( = ?AUTO_5330 ?AUTO_5331 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5326 ?AUTO_5331 ?AUTO_5330 )
      ( GET_SOIL_DATA ?AUTO_5325 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5325 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5341 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5345 - LANDER
      ?AUTO_5344 - WAYPOINT
      ?AUTO_5343 - WAYPOINT
      ?AUTO_5342 - ROVER
      ?AUTO_5347 - STORE
      ?AUTO_5346 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5345 ?AUTO_5344 ) ( VISIBLE ?AUTO_5343 ?AUTO_5344 ) ( AVAILABLE ?AUTO_5342 ) ( CHANNEL_FREE ?AUTO_5345 ) ( not ( = ?AUTO_5341 ?AUTO_5343 ) ) ( not ( = ?AUTO_5341 ?AUTO_5344 ) ) ( not ( = ?AUTO_5343 ?AUTO_5344 ) ) ( CAN_TRAVERSE ?AUTO_5342 ?AUTO_5341 ?AUTO_5343 ) ( VISIBLE ?AUTO_5341 ?AUTO_5343 ) ( AT_SOIL_SAMPLE ?AUTO_5341 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5342 ) ( STORE_OF ?AUTO_5347 ?AUTO_5342 ) ( CAN_TRAVERSE ?AUTO_5342 ?AUTO_5343 ?AUTO_5341 ) ( VISIBLE ?AUTO_5343 ?AUTO_5341 ) ( CAN_TRAVERSE ?AUTO_5342 ?AUTO_5346 ?AUTO_5343 ) ( AT ?AUTO_5342 ?AUTO_5346 ) ( VISIBLE ?AUTO_5346 ?AUTO_5343 ) ( not ( = ?AUTO_5341 ?AUTO_5346 ) ) ( not ( = ?AUTO_5344 ?AUTO_5346 ) ) ( not ( = ?AUTO_5343 ?AUTO_5346 ) ) ( AT_SOIL_SAMPLE ?AUTO_5346 ) ( EMPTY ?AUTO_5347 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_5342 ?AUTO_5347 ?AUTO_5346 )
      ( GET_SOIL_DATA ?AUTO_5341 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5341 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5367 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5371 - LANDER
      ?AUTO_5368 - WAYPOINT
      ?AUTO_5370 - WAYPOINT
      ?AUTO_5369 - ROVER
      ?AUTO_5372 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5371 ?AUTO_5368 ) ( VISIBLE ?AUTO_5370 ?AUTO_5368 ) ( AVAILABLE ?AUTO_5369 ) ( CHANNEL_FREE ?AUTO_5371 ) ( not ( = ?AUTO_5367 ?AUTO_5370 ) ) ( not ( = ?AUTO_5367 ?AUTO_5368 ) ) ( not ( = ?AUTO_5370 ?AUTO_5368 ) ) ( CAN_TRAVERSE ?AUTO_5369 ?AUTO_5367 ?AUTO_5370 ) ( AT ?AUTO_5369 ?AUTO_5367 ) ( VISIBLE ?AUTO_5367 ?AUTO_5370 ) ( AT_ROCK_SAMPLE ?AUTO_5367 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5369 ) ( STORE_OF ?AUTO_5372 ?AUTO_5369 ) ( FULL ?AUTO_5372 ) )
    :subtasks
    ( ( !DROP ?AUTO_5369 ?AUTO_5372 )
      ( GET_ROCK_DATA ?AUTO_5367 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5367 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5390 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5391 - LANDER
      ?AUTO_5393 - WAYPOINT
      ?AUTO_5394 - WAYPOINT
      ?AUTO_5395 - ROVER
      ?AUTO_5392 - STORE
      ?AUTO_5396 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5391 ?AUTO_5393 ) ( VISIBLE ?AUTO_5394 ?AUTO_5393 ) ( AVAILABLE ?AUTO_5395 ) ( CHANNEL_FREE ?AUTO_5391 ) ( not ( = ?AUTO_5390 ?AUTO_5394 ) ) ( not ( = ?AUTO_5390 ?AUTO_5393 ) ) ( not ( = ?AUTO_5394 ?AUTO_5393 ) ) ( CAN_TRAVERSE ?AUTO_5395 ?AUTO_5390 ?AUTO_5394 ) ( VISIBLE ?AUTO_5390 ?AUTO_5394 ) ( AT_ROCK_SAMPLE ?AUTO_5390 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5395 ) ( STORE_OF ?AUTO_5392 ?AUTO_5395 ) ( CAN_TRAVERSE ?AUTO_5395 ?AUTO_5394 ?AUTO_5390 ) ( VISIBLE ?AUTO_5394 ?AUTO_5390 ) ( FULL ?AUTO_5392 ) ( CAN_TRAVERSE ?AUTO_5395 ?AUTO_5396 ?AUTO_5394 ) ( AT ?AUTO_5395 ?AUTO_5396 ) ( VISIBLE ?AUTO_5396 ?AUTO_5394 ) ( not ( = ?AUTO_5390 ?AUTO_5396 ) ) ( not ( = ?AUTO_5393 ?AUTO_5396 ) ) ( not ( = ?AUTO_5394 ?AUTO_5396 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5395 ?AUTO_5396 ?AUTO_5394 )
      ( GET_ROCK_DATA ?AUTO_5390 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5390 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5406 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5409 - LANDER
      ?AUTO_5412 - WAYPOINT
      ?AUTO_5407 - WAYPOINT
      ?AUTO_5408 - ROVER
      ?AUTO_5411 - STORE
      ?AUTO_5410 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5409 ?AUTO_5412 ) ( VISIBLE ?AUTO_5407 ?AUTO_5412 ) ( AVAILABLE ?AUTO_5408 ) ( CHANNEL_FREE ?AUTO_5409 ) ( not ( = ?AUTO_5406 ?AUTO_5407 ) ) ( not ( = ?AUTO_5406 ?AUTO_5412 ) ) ( not ( = ?AUTO_5407 ?AUTO_5412 ) ) ( CAN_TRAVERSE ?AUTO_5408 ?AUTO_5406 ?AUTO_5407 ) ( VISIBLE ?AUTO_5406 ?AUTO_5407 ) ( AT_ROCK_SAMPLE ?AUTO_5406 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5408 ) ( STORE_OF ?AUTO_5411 ?AUTO_5408 ) ( CAN_TRAVERSE ?AUTO_5408 ?AUTO_5407 ?AUTO_5406 ) ( VISIBLE ?AUTO_5407 ?AUTO_5406 ) ( CAN_TRAVERSE ?AUTO_5408 ?AUTO_5410 ?AUTO_5407 ) ( AT ?AUTO_5408 ?AUTO_5410 ) ( VISIBLE ?AUTO_5410 ?AUTO_5407 ) ( not ( = ?AUTO_5406 ?AUTO_5410 ) ) ( not ( = ?AUTO_5412 ?AUTO_5410 ) ) ( not ( = ?AUTO_5407 ?AUTO_5410 ) ) ( AT_SOIL_SAMPLE ?AUTO_5410 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5408 ) ( EMPTY ?AUTO_5411 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_5408 ?AUTO_5411 ?AUTO_5410 )
      ( GET_ROCK_DATA ?AUTO_5406 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5406 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5470 - OBJECTIVE
      ?AUTO_5471 - MODE
    )
    :vars
    (
      ?AUTO_5472 - LANDER
      ?AUTO_5474 - WAYPOINT
      ?AUTO_5477 - WAYPOINT
      ?AUTO_5475 - ROVER
      ?AUTO_5476 - CAMERA
      ?AUTO_5473 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5472 ?AUTO_5474 ) ( VISIBLE ?AUTO_5477 ?AUTO_5474 ) ( AVAILABLE ?AUTO_5475 ) ( CHANNEL_FREE ?AUTO_5472 ) ( not ( = ?AUTO_5477 ?AUTO_5474 ) ) ( CAN_TRAVERSE ?AUTO_5475 ?AUTO_5474 ?AUTO_5477 ) ( VISIBLE ?AUTO_5474 ?AUTO_5477 ) ( ON_BOARD ?AUTO_5476 ?AUTO_5475 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5475 ) ( SUPPORTS ?AUTO_5476 ?AUTO_5471 ) ( VISIBLE_FROM ?AUTO_5470 ?AUTO_5474 ) ( CALIBRATION_TARGET ?AUTO_5476 ?AUTO_5473 ) ( VISIBLE_FROM ?AUTO_5473 ?AUTO_5474 ) ( not ( = ?AUTO_5470 ?AUTO_5473 ) ) ( CAN_TRAVERSE ?AUTO_5475 ?AUTO_5477 ?AUTO_5474 ) ( AT ?AUTO_5475 ?AUTO_5477 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5475 ?AUTO_5477 ?AUTO_5474 )
      ( GET_IMAGE_DATA ?AUTO_5470 ?AUTO_5471 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5470 ?AUTO_5471 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5518 - OBJECTIVE
      ?AUTO_5519 - MODE
    )
    :vars
    (
      ?AUTO_5521 - LANDER
      ?AUTO_5520 - WAYPOINT
      ?AUTO_5524 - WAYPOINT
      ?AUTO_5522 - ROVER
      ?AUTO_5523 - CAMERA
      ?AUTO_5525 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5521 ?AUTO_5520 ) ( VISIBLE ?AUTO_5524 ?AUTO_5520 ) ( AVAILABLE ?AUTO_5522 ) ( CHANNEL_FREE ?AUTO_5521 ) ( not ( = ?AUTO_5524 ?AUTO_5520 ) ) ( ON_BOARD ?AUTO_5523 ?AUTO_5522 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5522 ) ( SUPPORTS ?AUTO_5523 ?AUTO_5519 ) ( VISIBLE_FROM ?AUTO_5518 ?AUTO_5524 ) ( CAN_TRAVERSE ?AUTO_5522 ?AUTO_5520 ?AUTO_5524 ) ( VISIBLE ?AUTO_5520 ?AUTO_5524 ) ( CALIBRATION_TARGET ?AUTO_5523 ?AUTO_5525 ) ( VISIBLE_FROM ?AUTO_5525 ?AUTO_5520 ) ( not ( = ?AUTO_5518 ?AUTO_5525 ) ) ( CAN_TRAVERSE ?AUTO_5522 ?AUTO_5524 ?AUTO_5520 ) ( AT ?AUTO_5522 ?AUTO_5524 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5522 ?AUTO_5524 ?AUTO_5520 )
      ( GET_IMAGE_DATA ?AUTO_5518 ?AUTO_5519 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5518 ?AUTO_5519 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5667 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5673 - LANDER
      ?AUTO_5672 - WAYPOINT
      ?AUTO_5668 - WAYPOINT
      ?AUTO_5671 - ROVER
      ?AUTO_5670 - WAYPOINT
      ?AUTO_5669 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5673 ?AUTO_5672 ) ( VISIBLE ?AUTO_5668 ?AUTO_5672 ) ( AVAILABLE ?AUTO_5671 ) ( CHANNEL_FREE ?AUTO_5673 ) ( not ( = ?AUTO_5667 ?AUTO_5668 ) ) ( not ( = ?AUTO_5667 ?AUTO_5672 ) ) ( not ( = ?AUTO_5668 ?AUTO_5672 ) ) ( CAN_TRAVERSE ?AUTO_5671 ?AUTO_5670 ?AUTO_5668 ) ( VISIBLE ?AUTO_5670 ?AUTO_5668 ) ( not ( = ?AUTO_5667 ?AUTO_5670 ) ) ( not ( = ?AUTO_5672 ?AUTO_5670 ) ) ( not ( = ?AUTO_5668 ?AUTO_5670 ) ) ( CAN_TRAVERSE ?AUTO_5671 ?AUTO_5667 ?AUTO_5670 ) ( VISIBLE ?AUTO_5667 ?AUTO_5670 ) ( AT_ROCK_SAMPLE ?AUTO_5667 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5671 ) ( STORE_OF ?AUTO_5669 ?AUTO_5671 ) ( CAN_TRAVERSE ?AUTO_5671 ?AUTO_5670 ?AUTO_5667 ) ( AT ?AUTO_5671 ?AUTO_5670 ) ( VISIBLE ?AUTO_5670 ?AUTO_5667 ) ( FULL ?AUTO_5669 ) )
    :subtasks
    ( ( !DROP ?AUTO_5671 ?AUTO_5669 )
      ( GET_ROCK_DATA ?AUTO_5667 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5667 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5751 - OBJECTIVE
      ?AUTO_5752 - MODE
    )
    :vars
    (
      ?AUTO_5757 - LANDER
      ?AUTO_5754 - WAYPOINT
      ?AUTO_5755 - ROVER
      ?AUTO_5756 - WAYPOINT
      ?AUTO_5753 - WAYPOINT
      ?AUTO_5758 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5757 ?AUTO_5754 ) ( HAVE_IMAGE ?AUTO_5755 ?AUTO_5751 ?AUTO_5752 ) ( VISIBLE ?AUTO_5756 ?AUTO_5754 ) ( AVAILABLE ?AUTO_5755 ) ( CHANNEL_FREE ?AUTO_5757 ) ( not ( = ?AUTO_5756 ?AUTO_5754 ) ) ( CAN_TRAVERSE ?AUTO_5755 ?AUTO_5753 ?AUTO_5756 ) ( VISIBLE ?AUTO_5753 ?AUTO_5756 ) ( not ( = ?AUTO_5754 ?AUTO_5753 ) ) ( not ( = ?AUTO_5756 ?AUTO_5753 ) ) ( CAN_TRAVERSE ?AUTO_5755 ?AUTO_5758 ?AUTO_5753 ) ( AT ?AUTO_5755 ?AUTO_5758 ) ( VISIBLE ?AUTO_5758 ?AUTO_5753 ) ( not ( = ?AUTO_5754 ?AUTO_5758 ) ) ( not ( = ?AUTO_5756 ?AUTO_5758 ) ) ( not ( = ?AUTO_5753 ?AUTO_5758 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5755 ?AUTO_5758 ?AUTO_5753 )
      ( GET_IMAGE_DATA ?AUTO_5751 ?AUTO_5752 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5751 ?AUTO_5752 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5767 - OBJECTIVE
      ?AUTO_5768 - MODE
    )
    :vars
    (
      ?AUTO_5774 - LANDER
      ?AUTO_5770 - WAYPOINT
      ?AUTO_5771 - WAYPOINT
      ?AUTO_5772 - ROVER
      ?AUTO_5769 - WAYPOINT
      ?AUTO_5773 - WAYPOINT
      ?AUTO_5775 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5774 ?AUTO_5770 ) ( VISIBLE ?AUTO_5771 ?AUTO_5770 ) ( AVAILABLE ?AUTO_5772 ) ( CHANNEL_FREE ?AUTO_5774 ) ( not ( = ?AUTO_5771 ?AUTO_5770 ) ) ( CAN_TRAVERSE ?AUTO_5772 ?AUTO_5769 ?AUTO_5771 ) ( VISIBLE ?AUTO_5769 ?AUTO_5771 ) ( not ( = ?AUTO_5770 ?AUTO_5769 ) ) ( not ( = ?AUTO_5771 ?AUTO_5769 ) ) ( CAN_TRAVERSE ?AUTO_5772 ?AUTO_5773 ?AUTO_5769 ) ( AT ?AUTO_5772 ?AUTO_5773 ) ( VISIBLE ?AUTO_5773 ?AUTO_5769 ) ( not ( = ?AUTO_5770 ?AUTO_5773 ) ) ( not ( = ?AUTO_5771 ?AUTO_5773 ) ) ( not ( = ?AUTO_5769 ?AUTO_5773 ) ) ( CALIBRATED ?AUTO_5775 ?AUTO_5772 ) ( ON_BOARD ?AUTO_5775 ?AUTO_5772 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5772 ) ( SUPPORTS ?AUTO_5775 ?AUTO_5768 ) ( VISIBLE_FROM ?AUTO_5767 ?AUTO_5773 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_5772 ?AUTO_5773 ?AUTO_5767 ?AUTO_5775 ?AUTO_5768 )
      ( GET_IMAGE_DATA ?AUTO_5767 ?AUTO_5768 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5767 ?AUTO_5768 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5776 - OBJECTIVE
      ?AUTO_5777 - MODE
    )
    :vars
    (
      ?AUTO_5782 - LANDER
      ?AUTO_5783 - WAYPOINT
      ?AUTO_5781 - WAYPOINT
      ?AUTO_5780 - ROVER
      ?AUTO_5778 - WAYPOINT
      ?AUTO_5779 - WAYPOINT
      ?AUTO_5784 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5782 ?AUTO_5783 ) ( VISIBLE ?AUTO_5781 ?AUTO_5783 ) ( AVAILABLE ?AUTO_5780 ) ( CHANNEL_FREE ?AUTO_5782 ) ( not ( = ?AUTO_5781 ?AUTO_5783 ) ) ( CAN_TRAVERSE ?AUTO_5780 ?AUTO_5778 ?AUTO_5781 ) ( VISIBLE ?AUTO_5778 ?AUTO_5781 ) ( not ( = ?AUTO_5783 ?AUTO_5778 ) ) ( not ( = ?AUTO_5781 ?AUTO_5778 ) ) ( CAN_TRAVERSE ?AUTO_5780 ?AUTO_5779 ?AUTO_5778 ) ( VISIBLE ?AUTO_5779 ?AUTO_5778 ) ( not ( = ?AUTO_5783 ?AUTO_5779 ) ) ( not ( = ?AUTO_5781 ?AUTO_5779 ) ) ( not ( = ?AUTO_5778 ?AUTO_5779 ) ) ( CALIBRATED ?AUTO_5784 ?AUTO_5780 ) ( ON_BOARD ?AUTO_5784 ?AUTO_5780 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5780 ) ( SUPPORTS ?AUTO_5784 ?AUTO_5777 ) ( VISIBLE_FROM ?AUTO_5776 ?AUTO_5779 ) ( CAN_TRAVERSE ?AUTO_5780 ?AUTO_5778 ?AUTO_5779 ) ( AT ?AUTO_5780 ?AUTO_5778 ) ( VISIBLE ?AUTO_5778 ?AUTO_5779 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5780 ?AUTO_5778 ?AUTO_5779 )
      ( GET_IMAGE_DATA ?AUTO_5776 ?AUTO_5777 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5776 ?AUTO_5777 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5785 - OBJECTIVE
      ?AUTO_5786 - MODE
    )
    :vars
    (
      ?AUTO_5792 - LANDER
      ?AUTO_5790 - WAYPOINT
      ?AUTO_5793 - WAYPOINT
      ?AUTO_5791 - ROVER
      ?AUTO_5788 - WAYPOINT
      ?AUTO_5789 - WAYPOINT
      ?AUTO_5787 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5792 ?AUTO_5790 ) ( VISIBLE ?AUTO_5793 ?AUTO_5790 ) ( AVAILABLE ?AUTO_5791 ) ( CHANNEL_FREE ?AUTO_5792 ) ( not ( = ?AUTO_5793 ?AUTO_5790 ) ) ( CAN_TRAVERSE ?AUTO_5791 ?AUTO_5788 ?AUTO_5793 ) ( VISIBLE ?AUTO_5788 ?AUTO_5793 ) ( not ( = ?AUTO_5790 ?AUTO_5788 ) ) ( not ( = ?AUTO_5793 ?AUTO_5788 ) ) ( CAN_TRAVERSE ?AUTO_5791 ?AUTO_5789 ?AUTO_5788 ) ( VISIBLE ?AUTO_5789 ?AUTO_5788 ) ( not ( = ?AUTO_5790 ?AUTO_5789 ) ) ( not ( = ?AUTO_5793 ?AUTO_5789 ) ) ( not ( = ?AUTO_5788 ?AUTO_5789 ) ) ( CALIBRATED ?AUTO_5787 ?AUTO_5791 ) ( ON_BOARD ?AUTO_5787 ?AUTO_5791 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5791 ) ( SUPPORTS ?AUTO_5787 ?AUTO_5786 ) ( VISIBLE_FROM ?AUTO_5785 ?AUTO_5789 ) ( CAN_TRAVERSE ?AUTO_5791 ?AUTO_5788 ?AUTO_5789 ) ( VISIBLE ?AUTO_5788 ?AUTO_5789 ) ( CAN_TRAVERSE ?AUTO_5791 ?AUTO_5793 ?AUTO_5788 ) ( AT ?AUTO_5791 ?AUTO_5793 ) ( VISIBLE ?AUTO_5793 ?AUTO_5788 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5791 ?AUTO_5793 ?AUTO_5788 )
      ( GET_IMAGE_DATA ?AUTO_5785 ?AUTO_5786 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5785 ?AUTO_5786 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5818 - OBJECTIVE
      ?AUTO_5819 - MODE
    )
    :vars
    (
      ?AUTO_5821 - LANDER
      ?AUTO_5824 - WAYPOINT
      ?AUTO_5820 - WAYPOINT
      ?AUTO_5825 - ROVER
      ?AUTO_5822 - WAYPOINT
      ?AUTO_5823 - WAYPOINT
      ?AUTO_5826 - CAMERA
      ?AUTO_5827 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5821 ?AUTO_5824 ) ( VISIBLE ?AUTO_5820 ?AUTO_5824 ) ( AVAILABLE ?AUTO_5825 ) ( CHANNEL_FREE ?AUTO_5821 ) ( not ( = ?AUTO_5820 ?AUTO_5824 ) ) ( CAN_TRAVERSE ?AUTO_5825 ?AUTO_5822 ?AUTO_5820 ) ( VISIBLE ?AUTO_5822 ?AUTO_5820 ) ( not ( = ?AUTO_5824 ?AUTO_5822 ) ) ( not ( = ?AUTO_5820 ?AUTO_5822 ) ) ( CAN_TRAVERSE ?AUTO_5825 ?AUTO_5823 ?AUTO_5822 ) ( VISIBLE ?AUTO_5823 ?AUTO_5822 ) ( not ( = ?AUTO_5824 ?AUTO_5823 ) ) ( not ( = ?AUTO_5820 ?AUTO_5823 ) ) ( not ( = ?AUTO_5822 ?AUTO_5823 ) ) ( ON_BOARD ?AUTO_5826 ?AUTO_5825 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5825 ) ( SUPPORTS ?AUTO_5826 ?AUTO_5819 ) ( VISIBLE_FROM ?AUTO_5818 ?AUTO_5823 ) ( CAN_TRAVERSE ?AUTO_5825 ?AUTO_5822 ?AUTO_5823 ) ( AT ?AUTO_5825 ?AUTO_5822 ) ( VISIBLE ?AUTO_5822 ?AUTO_5823 ) ( CALIBRATION_TARGET ?AUTO_5826 ?AUTO_5827 ) ( VISIBLE_FROM ?AUTO_5827 ?AUTO_5822 ) ( not ( = ?AUTO_5818 ?AUTO_5827 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5825 ?AUTO_5826 ?AUTO_5827 ?AUTO_5822 )
      ( GET_IMAGE_DATA ?AUTO_5818 ?AUTO_5819 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5818 ?AUTO_5819 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5828 - OBJECTIVE
      ?AUTO_5829 - MODE
    )
    :vars
    (
      ?AUTO_5833 - LANDER
      ?AUTO_5831 - WAYPOINT
      ?AUTO_5837 - WAYPOINT
      ?AUTO_5832 - ROVER
      ?AUTO_5834 - WAYPOINT
      ?AUTO_5835 - WAYPOINT
      ?AUTO_5836 - CAMERA
      ?AUTO_5830 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5833 ?AUTO_5831 ) ( VISIBLE ?AUTO_5837 ?AUTO_5831 ) ( AVAILABLE ?AUTO_5832 ) ( CHANNEL_FREE ?AUTO_5833 ) ( not ( = ?AUTO_5837 ?AUTO_5831 ) ) ( CAN_TRAVERSE ?AUTO_5832 ?AUTO_5834 ?AUTO_5837 ) ( VISIBLE ?AUTO_5834 ?AUTO_5837 ) ( not ( = ?AUTO_5831 ?AUTO_5834 ) ) ( not ( = ?AUTO_5837 ?AUTO_5834 ) ) ( CAN_TRAVERSE ?AUTO_5832 ?AUTO_5835 ?AUTO_5834 ) ( VISIBLE ?AUTO_5835 ?AUTO_5834 ) ( not ( = ?AUTO_5831 ?AUTO_5835 ) ) ( not ( = ?AUTO_5837 ?AUTO_5835 ) ) ( not ( = ?AUTO_5834 ?AUTO_5835 ) ) ( ON_BOARD ?AUTO_5836 ?AUTO_5832 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5832 ) ( SUPPORTS ?AUTO_5836 ?AUTO_5829 ) ( VISIBLE_FROM ?AUTO_5828 ?AUTO_5835 ) ( CAN_TRAVERSE ?AUTO_5832 ?AUTO_5834 ?AUTO_5835 ) ( VISIBLE ?AUTO_5834 ?AUTO_5835 ) ( CALIBRATION_TARGET ?AUTO_5836 ?AUTO_5830 ) ( VISIBLE_FROM ?AUTO_5830 ?AUTO_5834 ) ( not ( = ?AUTO_5828 ?AUTO_5830 ) ) ( CAN_TRAVERSE ?AUTO_5832 ?AUTO_5837 ?AUTO_5834 ) ( AT ?AUTO_5832 ?AUTO_5837 ) ( VISIBLE ?AUTO_5837 ?AUTO_5834 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5832 ?AUTO_5837 ?AUTO_5834 )
      ( GET_IMAGE_DATA ?AUTO_5828 ?AUTO_5829 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5828 ?AUTO_5829 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5856 - OBJECTIVE
      ?AUTO_5857 - MODE
    )
    :vars
    (
      ?AUTO_5865 - LANDER
      ?AUTO_5861 - WAYPOINT
      ?AUTO_5863 - WAYPOINT
      ?AUTO_5859 - ROVER
      ?AUTO_5864 - WAYPOINT
      ?AUTO_5862 - WAYPOINT
      ?AUTO_5858 - CAMERA
      ?AUTO_5860 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5865 ?AUTO_5861 ) ( VISIBLE ?AUTO_5863 ?AUTO_5861 ) ( AVAILABLE ?AUTO_5859 ) ( CHANNEL_FREE ?AUTO_5865 ) ( not ( = ?AUTO_5863 ?AUTO_5861 ) ) ( CAN_TRAVERSE ?AUTO_5859 ?AUTO_5864 ?AUTO_5863 ) ( VISIBLE ?AUTO_5864 ?AUTO_5863 ) ( not ( = ?AUTO_5861 ?AUTO_5864 ) ) ( not ( = ?AUTO_5863 ?AUTO_5864 ) ) ( CAN_TRAVERSE ?AUTO_5859 ?AUTO_5862 ?AUTO_5864 ) ( VISIBLE ?AUTO_5862 ?AUTO_5864 ) ( not ( = ?AUTO_5861 ?AUTO_5862 ) ) ( not ( = ?AUTO_5863 ?AUTO_5862 ) ) ( not ( = ?AUTO_5864 ?AUTO_5862 ) ) ( ON_BOARD ?AUTO_5858 ?AUTO_5859 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5859 ) ( SUPPORTS ?AUTO_5858 ?AUTO_5857 ) ( VISIBLE_FROM ?AUTO_5856 ?AUTO_5862 ) ( CAN_TRAVERSE ?AUTO_5859 ?AUTO_5864 ?AUTO_5862 ) ( VISIBLE ?AUTO_5864 ?AUTO_5862 ) ( CALIBRATION_TARGET ?AUTO_5858 ?AUTO_5860 ) ( VISIBLE_FROM ?AUTO_5860 ?AUTO_5864 ) ( not ( = ?AUTO_5856 ?AUTO_5860 ) ) ( CAN_TRAVERSE ?AUTO_5859 ?AUTO_5863 ?AUTO_5864 ) ( VISIBLE ?AUTO_5863 ?AUTO_5864 ) ( CAN_TRAVERSE ?AUTO_5859 ?AUTO_5861 ?AUTO_5863 ) ( AT ?AUTO_5859 ?AUTO_5861 ) ( VISIBLE ?AUTO_5861 ?AUTO_5863 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5859 ?AUTO_5861 ?AUTO_5863 )
      ( GET_IMAGE_DATA ?AUTO_5856 ?AUTO_5857 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5856 ?AUTO_5857 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5910 - OBJECTIVE
      ?AUTO_5911 - MODE
    )
    :vars
    (
      ?AUTO_5913 - LANDER
      ?AUTO_5917 - WAYPOINT
      ?AUTO_5914 - WAYPOINT
      ?AUTO_5912 - ROVER
      ?AUTO_5918 - WAYPOINT
      ?AUTO_5916 - WAYPOINT
      ?AUTO_5915 - CAMERA
      ?AUTO_5919 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5913 ?AUTO_5917 ) ( VISIBLE ?AUTO_5914 ?AUTO_5917 ) ( AVAILABLE ?AUTO_5912 ) ( CHANNEL_FREE ?AUTO_5913 ) ( not ( = ?AUTO_5914 ?AUTO_5917 ) ) ( CAN_TRAVERSE ?AUTO_5912 ?AUTO_5918 ?AUTO_5914 ) ( VISIBLE ?AUTO_5918 ?AUTO_5914 ) ( not ( = ?AUTO_5917 ?AUTO_5918 ) ) ( not ( = ?AUTO_5914 ?AUTO_5918 ) ) ( CAN_TRAVERSE ?AUTO_5912 ?AUTO_5916 ?AUTO_5918 ) ( VISIBLE ?AUTO_5916 ?AUTO_5918 ) ( not ( = ?AUTO_5917 ?AUTO_5916 ) ) ( not ( = ?AUTO_5914 ?AUTO_5916 ) ) ( not ( = ?AUTO_5918 ?AUTO_5916 ) ) ( ON_BOARD ?AUTO_5915 ?AUTO_5912 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5912 ) ( SUPPORTS ?AUTO_5915 ?AUTO_5911 ) ( VISIBLE_FROM ?AUTO_5910 ?AUTO_5916 ) ( CAN_TRAVERSE ?AUTO_5912 ?AUTO_5918 ?AUTO_5916 ) ( VISIBLE ?AUTO_5918 ?AUTO_5916 ) ( CALIBRATION_TARGET ?AUTO_5915 ?AUTO_5919 ) ( VISIBLE_FROM ?AUTO_5919 ?AUTO_5918 ) ( not ( = ?AUTO_5910 ?AUTO_5919 ) ) ( AT ?AUTO_5912 ?AUTO_5916 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5912 ?AUTO_5916 ?AUTO_5918 )
      ( GET_IMAGE_DATA ?AUTO_5910 ?AUTO_5911 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5910 ?AUTO_5911 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6001 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6002 - LANDER
      ?AUTO_6004 - WAYPOINT
      ?AUTO_6003 - WAYPOINT
      ?AUTO_6005 - ROVER
      ?AUTO_6006 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6002 ?AUTO_6004 ) ( VISIBLE ?AUTO_6003 ?AUTO_6004 ) ( AVAILABLE ?AUTO_6005 ) ( CHANNEL_FREE ?AUTO_6002 ) ( not ( = ?AUTO_6001 ?AUTO_6003 ) ) ( not ( = ?AUTO_6001 ?AUTO_6004 ) ) ( not ( = ?AUTO_6003 ?AUTO_6004 ) ) ( CAN_TRAVERSE ?AUTO_6005 ?AUTO_6001 ?AUTO_6003 ) ( AT ?AUTO_6005 ?AUTO_6001 ) ( VISIBLE ?AUTO_6001 ?AUTO_6003 ) ( AT_SOIL_SAMPLE ?AUTO_6001 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6005 ) ( STORE_OF ?AUTO_6006 ?AUTO_6005 ) ( FULL ?AUTO_6006 ) )
    :subtasks
    ( ( !DROP ?AUTO_6005 ?AUTO_6006 )
      ( GET_SOIL_DATA ?AUTO_6001 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6001 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6007 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6010 - LANDER
      ?AUTO_6012 - WAYPOINT
      ?AUTO_6009 - WAYPOINT
      ?AUTO_6011 - ROVER
      ?AUTO_6008 - STORE
      ?AUTO_6013 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6010 ?AUTO_6012 ) ( VISIBLE ?AUTO_6009 ?AUTO_6012 ) ( AVAILABLE ?AUTO_6011 ) ( CHANNEL_FREE ?AUTO_6010 ) ( not ( = ?AUTO_6007 ?AUTO_6009 ) ) ( not ( = ?AUTO_6007 ?AUTO_6012 ) ) ( not ( = ?AUTO_6009 ?AUTO_6012 ) ) ( CAN_TRAVERSE ?AUTO_6011 ?AUTO_6007 ?AUTO_6009 ) ( VISIBLE ?AUTO_6007 ?AUTO_6009 ) ( AT_SOIL_SAMPLE ?AUTO_6007 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6011 ) ( STORE_OF ?AUTO_6008 ?AUTO_6011 ) ( FULL ?AUTO_6008 ) ( CAN_TRAVERSE ?AUTO_6011 ?AUTO_6013 ?AUTO_6007 ) ( AT ?AUTO_6011 ?AUTO_6013 ) ( VISIBLE ?AUTO_6013 ?AUTO_6007 ) ( not ( = ?AUTO_6007 ?AUTO_6013 ) ) ( not ( = ?AUTO_6012 ?AUTO_6013 ) ) ( not ( = ?AUTO_6009 ?AUTO_6013 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6011 ?AUTO_6013 ?AUTO_6007 )
      ( GET_SOIL_DATA ?AUTO_6007 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6007 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6014 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6019 - LANDER
      ?AUTO_6015 - WAYPOINT
      ?AUTO_6016 - WAYPOINT
      ?AUTO_6017 - ROVER
      ?AUTO_6018 - STORE
      ?AUTO_6020 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6019 ?AUTO_6015 ) ( VISIBLE ?AUTO_6016 ?AUTO_6015 ) ( AVAILABLE ?AUTO_6017 ) ( CHANNEL_FREE ?AUTO_6019 ) ( not ( = ?AUTO_6014 ?AUTO_6016 ) ) ( not ( = ?AUTO_6014 ?AUTO_6015 ) ) ( not ( = ?AUTO_6016 ?AUTO_6015 ) ) ( CAN_TRAVERSE ?AUTO_6017 ?AUTO_6014 ?AUTO_6016 ) ( VISIBLE ?AUTO_6014 ?AUTO_6016 ) ( AT_SOIL_SAMPLE ?AUTO_6014 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6017 ) ( STORE_OF ?AUTO_6018 ?AUTO_6017 ) ( CAN_TRAVERSE ?AUTO_6017 ?AUTO_6020 ?AUTO_6014 ) ( AT ?AUTO_6017 ?AUTO_6020 ) ( VISIBLE ?AUTO_6020 ?AUTO_6014 ) ( not ( = ?AUTO_6014 ?AUTO_6020 ) ) ( not ( = ?AUTO_6015 ?AUTO_6020 ) ) ( not ( = ?AUTO_6016 ?AUTO_6020 ) ) ( AT_ROCK_SAMPLE ?AUTO_6020 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6017 ) ( EMPTY ?AUTO_6018 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_6017 ?AUTO_6018 ?AUTO_6020 )
      ( GET_SOIL_DATA ?AUTO_6014 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6014 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8950 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8953 - LANDER
      ?AUTO_8951 - WAYPOINT
      ?AUTO_8952 - WAYPOINT
      ?AUTO_8956 - ROVER
      ?AUTO_8954 - STORE
      ?AUTO_8955 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8953 ?AUTO_8951 ) ( VISIBLE ?AUTO_8952 ?AUTO_8951 ) ( AVAILABLE ?AUTO_8956 ) ( CHANNEL_FREE ?AUTO_8953 ) ( not ( = ?AUTO_8950 ?AUTO_8952 ) ) ( not ( = ?AUTO_8950 ?AUTO_8951 ) ) ( not ( = ?AUTO_8952 ?AUTO_8951 ) ) ( CAN_TRAVERSE ?AUTO_8956 ?AUTO_8950 ?AUTO_8952 ) ( VISIBLE ?AUTO_8950 ?AUTO_8952 ) ( AT_SOIL_SAMPLE ?AUTO_8950 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8956 ) ( STORE_OF ?AUTO_8954 ?AUTO_8956 ) ( EMPTY ?AUTO_8954 ) ( CAN_TRAVERSE ?AUTO_8956 ?AUTO_8955 ?AUTO_8950 ) ( VISIBLE ?AUTO_8955 ?AUTO_8950 ) ( not ( = ?AUTO_8950 ?AUTO_8955 ) ) ( not ( = ?AUTO_8951 ?AUTO_8955 ) ) ( not ( = ?AUTO_8952 ?AUTO_8955 ) ) ( CAN_TRAVERSE ?AUTO_8956 ?AUTO_8952 ?AUTO_8955 ) ( AT ?AUTO_8956 ?AUTO_8952 ) ( VISIBLE ?AUTO_8952 ?AUTO_8955 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8956 ?AUTO_8952 ?AUTO_8955 )
      ( GET_SOIL_DATA ?AUTO_8950 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8950 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6028 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6034 - LANDER
      ?AUTO_6030 - WAYPOINT
      ?AUTO_6033 - WAYPOINT
      ?AUTO_6032 - ROVER
      ?AUTO_6029 - STORE
      ?AUTO_6031 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6034 ?AUTO_6030 ) ( VISIBLE ?AUTO_6033 ?AUTO_6030 ) ( AVAILABLE ?AUTO_6032 ) ( CHANNEL_FREE ?AUTO_6034 ) ( not ( = ?AUTO_6028 ?AUTO_6033 ) ) ( not ( = ?AUTO_6028 ?AUTO_6030 ) ) ( not ( = ?AUTO_6033 ?AUTO_6030 ) ) ( CAN_TRAVERSE ?AUTO_6032 ?AUTO_6028 ?AUTO_6033 ) ( VISIBLE ?AUTO_6028 ?AUTO_6033 ) ( AT_SOIL_SAMPLE ?AUTO_6028 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6032 ) ( STORE_OF ?AUTO_6029 ?AUTO_6032 ) ( CAN_TRAVERSE ?AUTO_6032 ?AUTO_6031 ?AUTO_6028 ) ( VISIBLE ?AUTO_6031 ?AUTO_6028 ) ( not ( = ?AUTO_6028 ?AUTO_6031 ) ) ( not ( = ?AUTO_6030 ?AUTO_6031 ) ) ( not ( = ?AUTO_6033 ?AUTO_6031 ) ) ( AT_ROCK_SAMPLE ?AUTO_6031 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6032 ) ( CAN_TRAVERSE ?AUTO_6032 ?AUTO_6033 ?AUTO_6031 ) ( AT ?AUTO_6032 ?AUTO_6033 ) ( VISIBLE ?AUTO_6033 ?AUTO_6031 ) ( FULL ?AUTO_6029 ) )
    :subtasks
    ( ( !DROP ?AUTO_6032 ?AUTO_6029 )
      ( GET_SOIL_DATA ?AUTO_6028 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6028 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6035 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6040 - LANDER
      ?AUTO_6038 - WAYPOINT
      ?AUTO_6036 - WAYPOINT
      ?AUTO_6039 - ROVER
      ?AUTO_6037 - STORE
      ?AUTO_6041 - WAYPOINT
      ?AUTO_6042 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6040 ?AUTO_6038 ) ( VISIBLE ?AUTO_6036 ?AUTO_6038 ) ( AVAILABLE ?AUTO_6039 ) ( CHANNEL_FREE ?AUTO_6040 ) ( not ( = ?AUTO_6035 ?AUTO_6036 ) ) ( not ( = ?AUTO_6035 ?AUTO_6038 ) ) ( not ( = ?AUTO_6036 ?AUTO_6038 ) ) ( CAN_TRAVERSE ?AUTO_6039 ?AUTO_6035 ?AUTO_6036 ) ( VISIBLE ?AUTO_6035 ?AUTO_6036 ) ( AT_SOIL_SAMPLE ?AUTO_6035 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6039 ) ( STORE_OF ?AUTO_6037 ?AUTO_6039 ) ( CAN_TRAVERSE ?AUTO_6039 ?AUTO_6041 ?AUTO_6035 ) ( VISIBLE ?AUTO_6041 ?AUTO_6035 ) ( not ( = ?AUTO_6035 ?AUTO_6041 ) ) ( not ( = ?AUTO_6038 ?AUTO_6041 ) ) ( not ( = ?AUTO_6036 ?AUTO_6041 ) ) ( AT_ROCK_SAMPLE ?AUTO_6041 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6039 ) ( CAN_TRAVERSE ?AUTO_6039 ?AUTO_6036 ?AUTO_6041 ) ( VISIBLE ?AUTO_6036 ?AUTO_6041 ) ( FULL ?AUTO_6037 ) ( CAN_TRAVERSE ?AUTO_6039 ?AUTO_6042 ?AUTO_6036 ) ( AT ?AUTO_6039 ?AUTO_6042 ) ( VISIBLE ?AUTO_6042 ?AUTO_6036 ) ( not ( = ?AUTO_6035 ?AUTO_6042 ) ) ( not ( = ?AUTO_6038 ?AUTO_6042 ) ) ( not ( = ?AUTO_6036 ?AUTO_6042 ) ) ( not ( = ?AUTO_6041 ?AUTO_6042 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6039 ?AUTO_6042 ?AUTO_6036 )
      ( GET_SOIL_DATA ?AUTO_6035 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6035 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6044 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6045 - LANDER
      ?AUTO_6047 - WAYPOINT
      ?AUTO_6046 - WAYPOINT
      ?AUTO_6048 - ROVER
      ?AUTO_6051 - STORE
      ?AUTO_6050 - WAYPOINT
      ?AUTO_6049 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6045 ?AUTO_6047 ) ( VISIBLE ?AUTO_6046 ?AUTO_6047 ) ( AVAILABLE ?AUTO_6048 ) ( CHANNEL_FREE ?AUTO_6045 ) ( not ( = ?AUTO_6044 ?AUTO_6046 ) ) ( not ( = ?AUTO_6044 ?AUTO_6047 ) ) ( not ( = ?AUTO_6046 ?AUTO_6047 ) ) ( CAN_TRAVERSE ?AUTO_6048 ?AUTO_6044 ?AUTO_6046 ) ( VISIBLE ?AUTO_6044 ?AUTO_6046 ) ( AT_SOIL_SAMPLE ?AUTO_6044 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6048 ) ( STORE_OF ?AUTO_6051 ?AUTO_6048 ) ( CAN_TRAVERSE ?AUTO_6048 ?AUTO_6050 ?AUTO_6044 ) ( VISIBLE ?AUTO_6050 ?AUTO_6044 ) ( not ( = ?AUTO_6044 ?AUTO_6050 ) ) ( not ( = ?AUTO_6047 ?AUTO_6050 ) ) ( not ( = ?AUTO_6046 ?AUTO_6050 ) ) ( AT_ROCK_SAMPLE ?AUTO_6050 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6048 ) ( CAN_TRAVERSE ?AUTO_6048 ?AUTO_6046 ?AUTO_6050 ) ( VISIBLE ?AUTO_6046 ?AUTO_6050 ) ( CAN_TRAVERSE ?AUTO_6048 ?AUTO_6049 ?AUTO_6046 ) ( AT ?AUTO_6048 ?AUTO_6049 ) ( VISIBLE ?AUTO_6049 ?AUTO_6046 ) ( not ( = ?AUTO_6044 ?AUTO_6049 ) ) ( not ( = ?AUTO_6047 ?AUTO_6049 ) ) ( not ( = ?AUTO_6046 ?AUTO_6049 ) ) ( not ( = ?AUTO_6050 ?AUTO_6049 ) ) ( AT_ROCK_SAMPLE ?AUTO_6049 ) ( EMPTY ?AUTO_6051 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_6048 ?AUTO_6051 ?AUTO_6049 )
      ( GET_SOIL_DATA ?AUTO_6044 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6044 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6085 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6090 - LANDER
      ?AUTO_6087 - WAYPOINT
      ?AUTO_6088 - WAYPOINT
      ?AUTO_6086 - ROVER
      ?AUTO_6089 - STORE
      ?AUTO_6091 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6090 ?AUTO_6087 ) ( VISIBLE ?AUTO_6088 ?AUTO_6087 ) ( AVAILABLE ?AUTO_6086 ) ( CHANNEL_FREE ?AUTO_6090 ) ( not ( = ?AUTO_6085 ?AUTO_6088 ) ) ( not ( = ?AUTO_6085 ?AUTO_6087 ) ) ( not ( = ?AUTO_6088 ?AUTO_6087 ) ) ( CAN_TRAVERSE ?AUTO_6086 ?AUTO_6085 ?AUTO_6088 ) ( VISIBLE ?AUTO_6085 ?AUTO_6088 ) ( AT_ROCK_SAMPLE ?AUTO_6085 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6086 ) ( STORE_OF ?AUTO_6089 ?AUTO_6086 ) ( FULL ?AUTO_6089 ) ( CAN_TRAVERSE ?AUTO_6086 ?AUTO_6091 ?AUTO_6085 ) ( AT ?AUTO_6086 ?AUTO_6091 ) ( VISIBLE ?AUTO_6091 ?AUTO_6085 ) ( not ( = ?AUTO_6085 ?AUTO_6091 ) ) ( not ( = ?AUTO_6087 ?AUTO_6091 ) ) ( not ( = ?AUTO_6088 ?AUTO_6091 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6086 ?AUTO_6091 ?AUTO_6085 )
      ( GET_ROCK_DATA ?AUTO_6085 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6085 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6092 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6098 - LANDER
      ?AUTO_6093 - WAYPOINT
      ?AUTO_6095 - WAYPOINT
      ?AUTO_6096 - ROVER
      ?AUTO_6097 - STORE
      ?AUTO_6094 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6098 ?AUTO_6093 ) ( VISIBLE ?AUTO_6095 ?AUTO_6093 ) ( AVAILABLE ?AUTO_6096 ) ( CHANNEL_FREE ?AUTO_6098 ) ( not ( = ?AUTO_6092 ?AUTO_6095 ) ) ( not ( = ?AUTO_6092 ?AUTO_6093 ) ) ( not ( = ?AUTO_6095 ?AUTO_6093 ) ) ( CAN_TRAVERSE ?AUTO_6096 ?AUTO_6092 ?AUTO_6095 ) ( VISIBLE ?AUTO_6092 ?AUTO_6095 ) ( AT_ROCK_SAMPLE ?AUTO_6092 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6096 ) ( STORE_OF ?AUTO_6097 ?AUTO_6096 ) ( CAN_TRAVERSE ?AUTO_6096 ?AUTO_6094 ?AUTO_6092 ) ( AT ?AUTO_6096 ?AUTO_6094 ) ( VISIBLE ?AUTO_6094 ?AUTO_6092 ) ( not ( = ?AUTO_6092 ?AUTO_6094 ) ) ( not ( = ?AUTO_6093 ?AUTO_6094 ) ) ( not ( = ?AUTO_6095 ?AUTO_6094 ) ) ( AT_ROCK_SAMPLE ?AUTO_6094 ) ( EMPTY ?AUTO_6097 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_6096 ?AUTO_6097 ?AUTO_6094 )
      ( GET_ROCK_DATA ?AUTO_6092 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6092 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9032 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9036 - LANDER
      ?AUTO_9037 - WAYPOINT
      ?AUTO_9033 - WAYPOINT
      ?AUTO_9035 - ROVER
      ?AUTO_9034 - STORE
      ?AUTO_9038 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9036 ?AUTO_9037 ) ( VISIBLE ?AUTO_9033 ?AUTO_9037 ) ( AVAILABLE ?AUTO_9035 ) ( CHANNEL_FREE ?AUTO_9036 ) ( not ( = ?AUTO_9032 ?AUTO_9033 ) ) ( not ( = ?AUTO_9032 ?AUTO_9037 ) ) ( not ( = ?AUTO_9033 ?AUTO_9037 ) ) ( CAN_TRAVERSE ?AUTO_9035 ?AUTO_9032 ?AUTO_9033 ) ( VISIBLE ?AUTO_9032 ?AUTO_9033 ) ( AT_ROCK_SAMPLE ?AUTO_9032 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9035 ) ( STORE_OF ?AUTO_9034 ?AUTO_9035 ) ( EMPTY ?AUTO_9034 ) ( CAN_TRAVERSE ?AUTO_9035 ?AUTO_9038 ?AUTO_9032 ) ( VISIBLE ?AUTO_9038 ?AUTO_9032 ) ( not ( = ?AUTO_9032 ?AUTO_9038 ) ) ( not ( = ?AUTO_9037 ?AUTO_9038 ) ) ( not ( = ?AUTO_9033 ?AUTO_9038 ) ) ( CAN_TRAVERSE ?AUTO_9035 ?AUTO_9033 ?AUTO_9038 ) ( AT ?AUTO_9035 ?AUTO_9033 ) ( VISIBLE ?AUTO_9033 ?AUTO_9038 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9035 ?AUTO_9033 ?AUTO_9038 )
      ( GET_ROCK_DATA ?AUTO_9032 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9032 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6106 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6107 - LANDER
      ?AUTO_6108 - WAYPOINT
      ?AUTO_6112 - WAYPOINT
      ?AUTO_6110 - ROVER
      ?AUTO_6111 - STORE
      ?AUTO_6109 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6107 ?AUTO_6108 ) ( VISIBLE ?AUTO_6112 ?AUTO_6108 ) ( AVAILABLE ?AUTO_6110 ) ( CHANNEL_FREE ?AUTO_6107 ) ( not ( = ?AUTO_6106 ?AUTO_6112 ) ) ( not ( = ?AUTO_6106 ?AUTO_6108 ) ) ( not ( = ?AUTO_6112 ?AUTO_6108 ) ) ( CAN_TRAVERSE ?AUTO_6110 ?AUTO_6106 ?AUTO_6112 ) ( VISIBLE ?AUTO_6106 ?AUTO_6112 ) ( AT_ROCK_SAMPLE ?AUTO_6106 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6110 ) ( STORE_OF ?AUTO_6111 ?AUTO_6110 ) ( CAN_TRAVERSE ?AUTO_6110 ?AUTO_6109 ?AUTO_6106 ) ( VISIBLE ?AUTO_6109 ?AUTO_6106 ) ( not ( = ?AUTO_6106 ?AUTO_6109 ) ) ( not ( = ?AUTO_6108 ?AUTO_6109 ) ) ( not ( = ?AUTO_6112 ?AUTO_6109 ) ) ( AT_ROCK_SAMPLE ?AUTO_6109 ) ( CAN_TRAVERSE ?AUTO_6110 ?AUTO_6112 ?AUTO_6109 ) ( AT ?AUTO_6110 ?AUTO_6112 ) ( VISIBLE ?AUTO_6112 ?AUTO_6109 ) ( FULL ?AUTO_6111 ) )
    :subtasks
    ( ( !DROP ?AUTO_6110 ?AUTO_6111 )
      ( GET_ROCK_DATA ?AUTO_6106 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6106 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6113 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6118 - LANDER
      ?AUTO_6115 - WAYPOINT
      ?AUTO_6117 - WAYPOINT
      ?AUTO_6119 - ROVER
      ?AUTO_6114 - STORE
      ?AUTO_6116 - WAYPOINT
      ?AUTO_6120 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6118 ?AUTO_6115 ) ( VISIBLE ?AUTO_6117 ?AUTO_6115 ) ( AVAILABLE ?AUTO_6119 ) ( CHANNEL_FREE ?AUTO_6118 ) ( not ( = ?AUTO_6113 ?AUTO_6117 ) ) ( not ( = ?AUTO_6113 ?AUTO_6115 ) ) ( not ( = ?AUTO_6117 ?AUTO_6115 ) ) ( CAN_TRAVERSE ?AUTO_6119 ?AUTO_6113 ?AUTO_6117 ) ( VISIBLE ?AUTO_6113 ?AUTO_6117 ) ( AT_ROCK_SAMPLE ?AUTO_6113 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6119 ) ( STORE_OF ?AUTO_6114 ?AUTO_6119 ) ( CAN_TRAVERSE ?AUTO_6119 ?AUTO_6116 ?AUTO_6113 ) ( VISIBLE ?AUTO_6116 ?AUTO_6113 ) ( not ( = ?AUTO_6113 ?AUTO_6116 ) ) ( not ( = ?AUTO_6115 ?AUTO_6116 ) ) ( not ( = ?AUTO_6117 ?AUTO_6116 ) ) ( AT_ROCK_SAMPLE ?AUTO_6116 ) ( CAN_TRAVERSE ?AUTO_6119 ?AUTO_6117 ?AUTO_6116 ) ( VISIBLE ?AUTO_6117 ?AUTO_6116 ) ( FULL ?AUTO_6114 ) ( CAN_TRAVERSE ?AUTO_6119 ?AUTO_6120 ?AUTO_6117 ) ( AT ?AUTO_6119 ?AUTO_6120 ) ( VISIBLE ?AUTO_6120 ?AUTO_6117 ) ( not ( = ?AUTO_6113 ?AUTO_6120 ) ) ( not ( = ?AUTO_6115 ?AUTO_6120 ) ) ( not ( = ?AUTO_6117 ?AUTO_6120 ) ) ( not ( = ?AUTO_6116 ?AUTO_6120 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6119 ?AUTO_6120 ?AUTO_6117 )
      ( GET_ROCK_DATA ?AUTO_6113 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6113 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6122 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6124 - LANDER
      ?AUTO_6127 - WAYPOINT
      ?AUTO_6126 - WAYPOINT
      ?AUTO_6128 - ROVER
      ?AUTO_6129 - STORE
      ?AUTO_6125 - WAYPOINT
      ?AUTO_6123 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6124 ?AUTO_6127 ) ( VISIBLE ?AUTO_6126 ?AUTO_6127 ) ( AVAILABLE ?AUTO_6128 ) ( CHANNEL_FREE ?AUTO_6124 ) ( not ( = ?AUTO_6122 ?AUTO_6126 ) ) ( not ( = ?AUTO_6122 ?AUTO_6127 ) ) ( not ( = ?AUTO_6126 ?AUTO_6127 ) ) ( CAN_TRAVERSE ?AUTO_6128 ?AUTO_6122 ?AUTO_6126 ) ( VISIBLE ?AUTO_6122 ?AUTO_6126 ) ( AT_ROCK_SAMPLE ?AUTO_6122 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6128 ) ( STORE_OF ?AUTO_6129 ?AUTO_6128 ) ( CAN_TRAVERSE ?AUTO_6128 ?AUTO_6125 ?AUTO_6122 ) ( VISIBLE ?AUTO_6125 ?AUTO_6122 ) ( not ( = ?AUTO_6122 ?AUTO_6125 ) ) ( not ( = ?AUTO_6127 ?AUTO_6125 ) ) ( not ( = ?AUTO_6126 ?AUTO_6125 ) ) ( AT_ROCK_SAMPLE ?AUTO_6125 ) ( CAN_TRAVERSE ?AUTO_6128 ?AUTO_6126 ?AUTO_6125 ) ( VISIBLE ?AUTO_6126 ?AUTO_6125 ) ( CAN_TRAVERSE ?AUTO_6128 ?AUTO_6123 ?AUTO_6126 ) ( AT ?AUTO_6128 ?AUTO_6123 ) ( VISIBLE ?AUTO_6123 ?AUTO_6126 ) ( not ( = ?AUTO_6122 ?AUTO_6123 ) ) ( not ( = ?AUTO_6127 ?AUTO_6123 ) ) ( not ( = ?AUTO_6126 ?AUTO_6123 ) ) ( not ( = ?AUTO_6125 ?AUTO_6123 ) ) ( AT_ROCK_SAMPLE ?AUTO_6123 ) ( EMPTY ?AUTO_6129 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_6128 ?AUTO_6129 ?AUTO_6123 )
      ( GET_ROCK_DATA ?AUTO_6122 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6122 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6200 - OBJECTIVE
      ?AUTO_6201 - MODE
    )
    :vars
    (
      ?AUTO_6206 - LANDER
      ?AUTO_6204 - WAYPOINT
      ?AUTO_6203 - WAYPOINT
      ?AUTO_6205 - ROVER
      ?AUTO_6207 - CAMERA
      ?AUTO_6202 - WAYPOINT
      ?AUTO_6208 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6206 ?AUTO_6204 ) ( VISIBLE ?AUTO_6203 ?AUTO_6204 ) ( AVAILABLE ?AUTO_6205 ) ( CHANNEL_FREE ?AUTO_6206 ) ( not ( = ?AUTO_6203 ?AUTO_6204 ) ) ( CAN_TRAVERSE ?AUTO_6205 ?AUTO_6204 ?AUTO_6203 ) ( VISIBLE ?AUTO_6204 ?AUTO_6203 ) ( ON_BOARD ?AUTO_6207 ?AUTO_6205 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6205 ) ( SUPPORTS ?AUTO_6207 ?AUTO_6201 ) ( VISIBLE_FROM ?AUTO_6200 ?AUTO_6204 ) ( CAN_TRAVERSE ?AUTO_6205 ?AUTO_6202 ?AUTO_6204 ) ( AT ?AUTO_6205 ?AUTO_6202 ) ( VISIBLE ?AUTO_6202 ?AUTO_6204 ) ( not ( = ?AUTO_6204 ?AUTO_6202 ) ) ( not ( = ?AUTO_6203 ?AUTO_6202 ) ) ( CALIBRATION_TARGET ?AUTO_6207 ?AUTO_6208 ) ( VISIBLE_FROM ?AUTO_6208 ?AUTO_6202 ) ( not ( = ?AUTO_6200 ?AUTO_6208 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6205 ?AUTO_6207 ?AUTO_6208 ?AUTO_6202 )
      ( GET_IMAGE_DATA ?AUTO_6200 ?AUTO_6201 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6200 ?AUTO_6201 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6266 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6268 - LANDER
      ?AUTO_6267 - WAYPOINT
      ?AUTO_6269 - WAYPOINT
      ?AUTO_6271 - ROVER
      ?AUTO_6270 - STORE
      ?AUTO_6272 - WAYPOINT
      ?AUTO_6273 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6268 ?AUTO_6267 ) ( VISIBLE ?AUTO_6269 ?AUTO_6267 ) ( AVAILABLE ?AUTO_6271 ) ( CHANNEL_FREE ?AUTO_6268 ) ( not ( = ?AUTO_6266 ?AUTO_6269 ) ) ( not ( = ?AUTO_6266 ?AUTO_6267 ) ) ( not ( = ?AUTO_6269 ?AUTO_6267 ) ) ( CAN_TRAVERSE ?AUTO_6271 ?AUTO_6266 ?AUTO_6269 ) ( VISIBLE ?AUTO_6266 ?AUTO_6269 ) ( AT_SOIL_SAMPLE ?AUTO_6266 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6271 ) ( STORE_OF ?AUTO_6270 ?AUTO_6271 ) ( EMPTY ?AUTO_6270 ) ( CAN_TRAVERSE ?AUTO_6271 ?AUTO_6272 ?AUTO_6266 ) ( VISIBLE ?AUTO_6272 ?AUTO_6266 ) ( not ( = ?AUTO_6266 ?AUTO_6272 ) ) ( not ( = ?AUTO_6267 ?AUTO_6272 ) ) ( not ( = ?AUTO_6269 ?AUTO_6272 ) ) ( CAN_TRAVERSE ?AUTO_6271 ?AUTO_6273 ?AUTO_6272 ) ( AT ?AUTO_6271 ?AUTO_6273 ) ( VISIBLE ?AUTO_6273 ?AUTO_6272 ) ( not ( = ?AUTO_6266 ?AUTO_6273 ) ) ( not ( = ?AUTO_6267 ?AUTO_6273 ) ) ( not ( = ?AUTO_6269 ?AUTO_6273 ) ) ( not ( = ?AUTO_6272 ?AUTO_6273 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6271 ?AUTO_6273 ?AUTO_6272 )
      ( GET_SOIL_DATA ?AUTO_6266 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6266 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6275 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6280 - LANDER
      ?AUTO_6278 - WAYPOINT
      ?AUTO_6279 - WAYPOINT
      ?AUTO_6277 - ROVER
      ?AUTO_6281 - STORE
      ?AUTO_6282 - WAYPOINT
      ?AUTO_6276 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6280 ?AUTO_6278 ) ( VISIBLE ?AUTO_6279 ?AUTO_6278 ) ( AVAILABLE ?AUTO_6277 ) ( CHANNEL_FREE ?AUTO_6280 ) ( not ( = ?AUTO_6275 ?AUTO_6279 ) ) ( not ( = ?AUTO_6275 ?AUTO_6278 ) ) ( not ( = ?AUTO_6279 ?AUTO_6278 ) ) ( CAN_TRAVERSE ?AUTO_6277 ?AUTO_6275 ?AUTO_6279 ) ( VISIBLE ?AUTO_6275 ?AUTO_6279 ) ( AT_SOIL_SAMPLE ?AUTO_6275 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6277 ) ( STORE_OF ?AUTO_6281 ?AUTO_6277 ) ( EMPTY ?AUTO_6281 ) ( CAN_TRAVERSE ?AUTO_6277 ?AUTO_6282 ?AUTO_6275 ) ( VISIBLE ?AUTO_6282 ?AUTO_6275 ) ( not ( = ?AUTO_6275 ?AUTO_6282 ) ) ( not ( = ?AUTO_6278 ?AUTO_6282 ) ) ( not ( = ?AUTO_6279 ?AUTO_6282 ) ) ( CAN_TRAVERSE ?AUTO_6277 ?AUTO_6276 ?AUTO_6282 ) ( VISIBLE ?AUTO_6276 ?AUTO_6282 ) ( not ( = ?AUTO_6275 ?AUTO_6276 ) ) ( not ( = ?AUTO_6278 ?AUTO_6276 ) ) ( not ( = ?AUTO_6279 ?AUTO_6276 ) ) ( not ( = ?AUTO_6282 ?AUTO_6276 ) ) ( CAN_TRAVERSE ?AUTO_6277 ?AUTO_6278 ?AUTO_6276 ) ( AT ?AUTO_6277 ?AUTO_6278 ) ( VISIBLE ?AUTO_6278 ?AUTO_6276 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6277 ?AUTO_6278 ?AUTO_6276 )
      ( GET_SOIL_DATA ?AUTO_6275 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6275 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6283 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6289 - LANDER
      ?AUTO_6288 - WAYPOINT
      ?AUTO_6285 - WAYPOINT
      ?AUTO_6286 - ROVER
      ?AUTO_6290 - STORE
      ?AUTO_6287 - WAYPOINT
      ?AUTO_6284 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6289 ?AUTO_6288 ) ( VISIBLE ?AUTO_6285 ?AUTO_6288 ) ( AVAILABLE ?AUTO_6286 ) ( CHANNEL_FREE ?AUTO_6289 ) ( not ( = ?AUTO_6283 ?AUTO_6285 ) ) ( not ( = ?AUTO_6283 ?AUTO_6288 ) ) ( not ( = ?AUTO_6285 ?AUTO_6288 ) ) ( CAN_TRAVERSE ?AUTO_6286 ?AUTO_6283 ?AUTO_6285 ) ( VISIBLE ?AUTO_6283 ?AUTO_6285 ) ( AT_SOIL_SAMPLE ?AUTO_6283 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6286 ) ( STORE_OF ?AUTO_6290 ?AUTO_6286 ) ( CAN_TRAVERSE ?AUTO_6286 ?AUTO_6287 ?AUTO_6283 ) ( VISIBLE ?AUTO_6287 ?AUTO_6283 ) ( not ( = ?AUTO_6283 ?AUTO_6287 ) ) ( not ( = ?AUTO_6288 ?AUTO_6287 ) ) ( not ( = ?AUTO_6285 ?AUTO_6287 ) ) ( CAN_TRAVERSE ?AUTO_6286 ?AUTO_6284 ?AUTO_6287 ) ( VISIBLE ?AUTO_6284 ?AUTO_6287 ) ( not ( = ?AUTO_6283 ?AUTO_6284 ) ) ( not ( = ?AUTO_6288 ?AUTO_6284 ) ) ( not ( = ?AUTO_6285 ?AUTO_6284 ) ) ( not ( = ?AUTO_6287 ?AUTO_6284 ) ) ( CAN_TRAVERSE ?AUTO_6286 ?AUTO_6288 ?AUTO_6284 ) ( AT ?AUTO_6286 ?AUTO_6288 ) ( VISIBLE ?AUTO_6288 ?AUTO_6284 ) ( FULL ?AUTO_6290 ) )
    :subtasks
    ( ( !DROP ?AUTO_6286 ?AUTO_6290 )
      ( GET_SOIL_DATA ?AUTO_6283 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6283 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6388 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6394 - LANDER
      ?AUTO_6393 - WAYPOINT
      ?AUTO_6391 - WAYPOINT
      ?AUTO_6389 - ROVER
      ?AUTO_6392 - STORE
      ?AUTO_6390 - WAYPOINT
      ?AUTO_6395 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6394 ?AUTO_6393 ) ( VISIBLE ?AUTO_6391 ?AUTO_6393 ) ( AVAILABLE ?AUTO_6389 ) ( CHANNEL_FREE ?AUTO_6394 ) ( not ( = ?AUTO_6388 ?AUTO_6391 ) ) ( not ( = ?AUTO_6388 ?AUTO_6393 ) ) ( not ( = ?AUTO_6391 ?AUTO_6393 ) ) ( CAN_TRAVERSE ?AUTO_6389 ?AUTO_6388 ?AUTO_6391 ) ( VISIBLE ?AUTO_6388 ?AUTO_6391 ) ( AT_SOIL_SAMPLE ?AUTO_6388 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6389 ) ( STORE_OF ?AUTO_6392 ?AUTO_6389 ) ( CAN_TRAVERSE ?AUTO_6389 ?AUTO_6390 ?AUTO_6388 ) ( VISIBLE ?AUTO_6390 ?AUTO_6388 ) ( not ( = ?AUTO_6388 ?AUTO_6390 ) ) ( not ( = ?AUTO_6393 ?AUTO_6390 ) ) ( not ( = ?AUTO_6391 ?AUTO_6390 ) ) ( FULL ?AUTO_6392 ) ( CAN_TRAVERSE ?AUTO_6389 ?AUTO_6395 ?AUTO_6390 ) ( AT ?AUTO_6389 ?AUTO_6395 ) ( VISIBLE ?AUTO_6395 ?AUTO_6390 ) ( not ( = ?AUTO_6388 ?AUTO_6395 ) ) ( not ( = ?AUTO_6393 ?AUTO_6395 ) ) ( not ( = ?AUTO_6391 ?AUTO_6395 ) ) ( not ( = ?AUTO_6390 ?AUTO_6395 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6389 ?AUTO_6395 ?AUTO_6390 )
      ( GET_SOIL_DATA ?AUTO_6388 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6388 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6471 - OBJECTIVE
      ?AUTO_6472 - MODE
    )
    :vars
    (
      ?AUTO_6476 - LANDER
      ?AUTO_6477 - WAYPOINT
      ?AUTO_6475 - WAYPOINT
      ?AUTO_6473 - ROVER
      ?AUTO_6478 - CAMERA
      ?AUTO_6474 - WAYPOINT
      ?AUTO_6479 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6476 ?AUTO_6477 ) ( VISIBLE ?AUTO_6475 ?AUTO_6477 ) ( AVAILABLE ?AUTO_6473 ) ( CHANNEL_FREE ?AUTO_6476 ) ( not ( = ?AUTO_6475 ?AUTO_6477 ) ) ( CAN_TRAVERSE ?AUTO_6473 ?AUTO_6477 ?AUTO_6475 ) ( VISIBLE ?AUTO_6477 ?AUTO_6475 ) ( ON_BOARD ?AUTO_6478 ?AUTO_6473 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6473 ) ( SUPPORTS ?AUTO_6478 ?AUTO_6472 ) ( VISIBLE_FROM ?AUTO_6471 ?AUTO_6477 ) ( CAN_TRAVERSE ?AUTO_6473 ?AUTO_6474 ?AUTO_6477 ) ( VISIBLE ?AUTO_6474 ?AUTO_6477 ) ( not ( = ?AUTO_6477 ?AUTO_6474 ) ) ( not ( = ?AUTO_6475 ?AUTO_6474 ) ) ( CALIBRATION_TARGET ?AUTO_6478 ?AUTO_6479 ) ( VISIBLE_FROM ?AUTO_6479 ?AUTO_6474 ) ( not ( = ?AUTO_6471 ?AUTO_6479 ) ) ( CAN_TRAVERSE ?AUTO_6473 ?AUTO_6475 ?AUTO_6474 ) ( AT ?AUTO_6473 ?AUTO_6475 ) ( VISIBLE ?AUTO_6475 ?AUTO_6474 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6473 ?AUTO_6475 ?AUTO_6474 )
      ( GET_IMAGE_DATA ?AUTO_6471 ?AUTO_6472 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6471 ?AUTO_6472 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6492 - OBJECTIVE
      ?AUTO_6493 - MODE
    )
    :vars
    (
      ?AUTO_6496 - LANDER
      ?AUTO_6498 - WAYPOINT
      ?AUTO_6494 - WAYPOINT
      ?AUTO_6497 - ROVER
      ?AUTO_6500 - CAMERA
      ?AUTO_6495 - WAYPOINT
      ?AUTO_6499 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6496 ?AUTO_6498 ) ( VISIBLE ?AUTO_6494 ?AUTO_6498 ) ( AVAILABLE ?AUTO_6497 ) ( CHANNEL_FREE ?AUTO_6496 ) ( not ( = ?AUTO_6494 ?AUTO_6498 ) ) ( CAN_TRAVERSE ?AUTO_6497 ?AUTO_6498 ?AUTO_6494 ) ( VISIBLE ?AUTO_6498 ?AUTO_6494 ) ( ON_BOARD ?AUTO_6500 ?AUTO_6497 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6497 ) ( SUPPORTS ?AUTO_6500 ?AUTO_6493 ) ( VISIBLE_FROM ?AUTO_6492 ?AUTO_6498 ) ( CAN_TRAVERSE ?AUTO_6497 ?AUTO_6495 ?AUTO_6498 ) ( VISIBLE ?AUTO_6495 ?AUTO_6498 ) ( not ( = ?AUTO_6498 ?AUTO_6495 ) ) ( not ( = ?AUTO_6494 ?AUTO_6495 ) ) ( CALIBRATION_TARGET ?AUTO_6500 ?AUTO_6499 ) ( VISIBLE_FROM ?AUTO_6499 ?AUTO_6495 ) ( not ( = ?AUTO_6492 ?AUTO_6499 ) ) ( CAN_TRAVERSE ?AUTO_6497 ?AUTO_6494 ?AUTO_6495 ) ( VISIBLE ?AUTO_6494 ?AUTO_6495 ) ( AT ?AUTO_6497 ?AUTO_6498 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6497 ?AUTO_6498 ?AUTO_6494 )
      ( GET_IMAGE_DATA ?AUTO_6492 ?AUTO_6493 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6492 ?AUTO_6493 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6533 - OBJECTIVE
      ?AUTO_6534 - MODE
    )
    :vars
    (
      ?AUTO_6538 - LANDER
      ?AUTO_6539 - WAYPOINT
      ?AUTO_6536 - WAYPOINT
      ?AUTO_6535 - ROVER
      ?AUTO_6537 - CAMERA
      ?AUTO_6540 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6538 ?AUTO_6539 ) ( VISIBLE ?AUTO_6536 ?AUTO_6539 ) ( AVAILABLE ?AUTO_6535 ) ( CHANNEL_FREE ?AUTO_6538 ) ( not ( = ?AUTO_6536 ?AUTO_6539 ) ) ( CAN_TRAVERSE ?AUTO_6535 ?AUTO_6539 ?AUTO_6536 ) ( VISIBLE ?AUTO_6539 ?AUTO_6536 ) ( CALIBRATED ?AUTO_6537 ?AUTO_6535 ) ( ON_BOARD ?AUTO_6537 ?AUTO_6535 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6535 ) ( SUPPORTS ?AUTO_6537 ?AUTO_6534 ) ( VISIBLE_FROM ?AUTO_6533 ?AUTO_6539 ) ( CAN_TRAVERSE ?AUTO_6535 ?AUTO_6536 ?AUTO_6539 ) ( CAN_TRAVERSE ?AUTO_6535 ?AUTO_6540 ?AUTO_6536 ) ( AT ?AUTO_6535 ?AUTO_6540 ) ( VISIBLE ?AUTO_6540 ?AUTO_6536 ) ( not ( = ?AUTO_6539 ?AUTO_6540 ) ) ( not ( = ?AUTO_6536 ?AUTO_6540 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6535 ?AUTO_6540 ?AUTO_6536 )
      ( GET_IMAGE_DATA ?AUTO_6533 ?AUTO_6534 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6533 ?AUTO_6534 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6541 - OBJECTIVE
      ?AUTO_6542 - MODE
    )
    :vars
    (
      ?AUTO_6545 - LANDER
      ?AUTO_6548 - WAYPOINT
      ?AUTO_6543 - WAYPOINT
      ?AUTO_6544 - ROVER
      ?AUTO_6547 - CAMERA
      ?AUTO_6546 - WAYPOINT
      ?AUTO_6549 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6545 ?AUTO_6548 ) ( VISIBLE ?AUTO_6543 ?AUTO_6548 ) ( AVAILABLE ?AUTO_6544 ) ( CHANNEL_FREE ?AUTO_6545 ) ( not ( = ?AUTO_6543 ?AUTO_6548 ) ) ( CAN_TRAVERSE ?AUTO_6544 ?AUTO_6548 ?AUTO_6543 ) ( VISIBLE ?AUTO_6548 ?AUTO_6543 ) ( CALIBRATED ?AUTO_6547 ?AUTO_6544 ) ( ON_BOARD ?AUTO_6547 ?AUTO_6544 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6544 ) ( SUPPORTS ?AUTO_6547 ?AUTO_6542 ) ( VISIBLE_FROM ?AUTO_6541 ?AUTO_6548 ) ( CAN_TRAVERSE ?AUTO_6544 ?AUTO_6543 ?AUTO_6548 ) ( CAN_TRAVERSE ?AUTO_6544 ?AUTO_6546 ?AUTO_6543 ) ( VISIBLE ?AUTO_6546 ?AUTO_6543 ) ( not ( = ?AUTO_6548 ?AUTO_6546 ) ) ( not ( = ?AUTO_6543 ?AUTO_6546 ) ) ( CAN_TRAVERSE ?AUTO_6544 ?AUTO_6549 ?AUTO_6546 ) ( AT ?AUTO_6544 ?AUTO_6549 ) ( VISIBLE ?AUTO_6549 ?AUTO_6546 ) ( not ( = ?AUTO_6548 ?AUTO_6549 ) ) ( not ( = ?AUTO_6543 ?AUTO_6549 ) ) ( not ( = ?AUTO_6546 ?AUTO_6549 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6544 ?AUTO_6549 ?AUTO_6546 )
      ( GET_IMAGE_DATA ?AUTO_6541 ?AUTO_6542 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6541 ?AUTO_6542 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6550 - OBJECTIVE
      ?AUTO_6551 - MODE
    )
    :vars
    (
      ?AUTO_6556 - LANDER
      ?AUTO_6558 - WAYPOINT
      ?AUTO_6552 - WAYPOINT
      ?AUTO_6554 - ROVER
      ?AUTO_6555 - CAMERA
      ?AUTO_6553 - WAYPOINT
      ?AUTO_6557 - WAYPOINT
      ?AUTO_6559 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6556 ?AUTO_6558 ) ( VISIBLE ?AUTO_6552 ?AUTO_6558 ) ( AVAILABLE ?AUTO_6554 ) ( CHANNEL_FREE ?AUTO_6556 ) ( not ( = ?AUTO_6552 ?AUTO_6558 ) ) ( CAN_TRAVERSE ?AUTO_6554 ?AUTO_6558 ?AUTO_6552 ) ( VISIBLE ?AUTO_6558 ?AUTO_6552 ) ( ON_BOARD ?AUTO_6555 ?AUTO_6554 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6554 ) ( SUPPORTS ?AUTO_6555 ?AUTO_6551 ) ( VISIBLE_FROM ?AUTO_6550 ?AUTO_6558 ) ( CAN_TRAVERSE ?AUTO_6554 ?AUTO_6552 ?AUTO_6558 ) ( CAN_TRAVERSE ?AUTO_6554 ?AUTO_6553 ?AUTO_6552 ) ( VISIBLE ?AUTO_6553 ?AUTO_6552 ) ( not ( = ?AUTO_6558 ?AUTO_6553 ) ) ( not ( = ?AUTO_6552 ?AUTO_6553 ) ) ( CAN_TRAVERSE ?AUTO_6554 ?AUTO_6557 ?AUTO_6553 ) ( AT ?AUTO_6554 ?AUTO_6557 ) ( VISIBLE ?AUTO_6557 ?AUTO_6553 ) ( not ( = ?AUTO_6558 ?AUTO_6557 ) ) ( not ( = ?AUTO_6552 ?AUTO_6557 ) ) ( not ( = ?AUTO_6553 ?AUTO_6557 ) ) ( CALIBRATION_TARGET ?AUTO_6555 ?AUTO_6559 ) ( VISIBLE_FROM ?AUTO_6559 ?AUTO_6557 ) ( not ( = ?AUTO_6550 ?AUTO_6559 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6554 ?AUTO_6555 ?AUTO_6559 ?AUTO_6557 )
      ( GET_IMAGE_DATA ?AUTO_6550 ?AUTO_6551 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6550 ?AUTO_6551 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6560 - OBJECTIVE
      ?AUTO_6561 - MODE
    )
    :vars
    (
      ?AUTO_6564 - LANDER
      ?AUTO_6568 - WAYPOINT
      ?AUTO_6565 - WAYPOINT
      ?AUTO_6569 - ROVER
      ?AUTO_6562 - CAMERA
      ?AUTO_6566 - WAYPOINT
      ?AUTO_6567 - WAYPOINT
      ?AUTO_6563 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6564 ?AUTO_6568 ) ( VISIBLE ?AUTO_6565 ?AUTO_6568 ) ( AVAILABLE ?AUTO_6569 ) ( CHANNEL_FREE ?AUTO_6564 ) ( not ( = ?AUTO_6565 ?AUTO_6568 ) ) ( CAN_TRAVERSE ?AUTO_6569 ?AUTO_6568 ?AUTO_6565 ) ( VISIBLE ?AUTO_6568 ?AUTO_6565 ) ( ON_BOARD ?AUTO_6562 ?AUTO_6569 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6569 ) ( SUPPORTS ?AUTO_6562 ?AUTO_6561 ) ( VISIBLE_FROM ?AUTO_6560 ?AUTO_6568 ) ( CAN_TRAVERSE ?AUTO_6569 ?AUTO_6565 ?AUTO_6568 ) ( CAN_TRAVERSE ?AUTO_6569 ?AUTO_6566 ?AUTO_6565 ) ( VISIBLE ?AUTO_6566 ?AUTO_6565 ) ( not ( = ?AUTO_6568 ?AUTO_6566 ) ) ( not ( = ?AUTO_6565 ?AUTO_6566 ) ) ( CAN_TRAVERSE ?AUTO_6569 ?AUTO_6567 ?AUTO_6566 ) ( VISIBLE ?AUTO_6567 ?AUTO_6566 ) ( not ( = ?AUTO_6568 ?AUTO_6567 ) ) ( not ( = ?AUTO_6565 ?AUTO_6567 ) ) ( not ( = ?AUTO_6566 ?AUTO_6567 ) ) ( CALIBRATION_TARGET ?AUTO_6562 ?AUTO_6563 ) ( VISIBLE_FROM ?AUTO_6563 ?AUTO_6567 ) ( not ( = ?AUTO_6560 ?AUTO_6563 ) ) ( CAN_TRAVERSE ?AUTO_6569 ?AUTO_6566 ?AUTO_6567 ) ( AT ?AUTO_6569 ?AUTO_6566 ) ( VISIBLE ?AUTO_6566 ?AUTO_6567 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6569 ?AUTO_6566 ?AUTO_6567 )
      ( GET_IMAGE_DATA ?AUTO_6560 ?AUTO_6561 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6560 ?AUTO_6561 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6640 - OBJECTIVE
      ?AUTO_6641 - MODE
    )
    :vars
    (
      ?AUTO_6645 - LANDER
      ?AUTO_6647 - WAYPOINT
      ?AUTO_6644 - WAYPOINT
      ?AUTO_6643 - ROVER
      ?AUTO_6642 - CAMERA
      ?AUTO_6646 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6645 ?AUTO_6647 ) ( VISIBLE ?AUTO_6644 ?AUTO_6647 ) ( AVAILABLE ?AUTO_6643 ) ( CHANNEL_FREE ?AUTO_6645 ) ( not ( = ?AUTO_6644 ?AUTO_6647 ) ) ( ON_BOARD ?AUTO_6642 ?AUTO_6643 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6643 ) ( SUPPORTS ?AUTO_6642 ?AUTO_6641 ) ( VISIBLE_FROM ?AUTO_6640 ?AUTO_6644 ) ( CALIBRATION_TARGET ?AUTO_6642 ?AUTO_6646 ) ( VISIBLE_FROM ?AUTO_6646 ?AUTO_6644 ) ( not ( = ?AUTO_6640 ?AUTO_6646 ) ) ( CAN_TRAVERSE ?AUTO_6643 ?AUTO_6647 ?AUTO_6644 ) ( AT ?AUTO_6643 ?AUTO_6647 ) ( VISIBLE ?AUTO_6647 ?AUTO_6644 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6643 ?AUTO_6647 ?AUTO_6644 )
      ( GET_IMAGE_DATA ?AUTO_6640 ?AUTO_6641 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6640 ?AUTO_6641 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6648 - OBJECTIVE
      ?AUTO_6649 - MODE
    )
    :vars
    (
      ?AUTO_6651 - LANDER
      ?AUTO_6653 - WAYPOINT
      ?AUTO_6654 - WAYPOINT
      ?AUTO_6652 - ROVER
      ?AUTO_6655 - CAMERA
      ?AUTO_6650 - OBJECTIVE
      ?AUTO_6656 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6651 ?AUTO_6653 ) ( VISIBLE ?AUTO_6654 ?AUTO_6653 ) ( AVAILABLE ?AUTO_6652 ) ( CHANNEL_FREE ?AUTO_6651 ) ( not ( = ?AUTO_6654 ?AUTO_6653 ) ) ( ON_BOARD ?AUTO_6655 ?AUTO_6652 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6652 ) ( SUPPORTS ?AUTO_6655 ?AUTO_6649 ) ( VISIBLE_FROM ?AUTO_6648 ?AUTO_6654 ) ( CALIBRATION_TARGET ?AUTO_6655 ?AUTO_6650 ) ( VISIBLE_FROM ?AUTO_6650 ?AUTO_6654 ) ( not ( = ?AUTO_6648 ?AUTO_6650 ) ) ( CAN_TRAVERSE ?AUTO_6652 ?AUTO_6653 ?AUTO_6654 ) ( VISIBLE ?AUTO_6653 ?AUTO_6654 ) ( CAN_TRAVERSE ?AUTO_6652 ?AUTO_6656 ?AUTO_6653 ) ( AT ?AUTO_6652 ?AUTO_6656 ) ( VISIBLE ?AUTO_6656 ?AUTO_6653 ) ( not ( = ?AUTO_6653 ?AUTO_6656 ) ) ( not ( = ?AUTO_6654 ?AUTO_6656 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6652 ?AUTO_6656 ?AUTO_6653 )
      ( GET_IMAGE_DATA ?AUTO_6648 ?AUTO_6649 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6648 ?AUTO_6649 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6800 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6802 - LANDER
      ?AUTO_6804 - WAYPOINT
      ?AUTO_6805 - WAYPOINT
      ?AUTO_6803 - ROVER
      ?AUTO_6801 - STORE
      ?AUTO_6806 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6802 ?AUTO_6804 ) ( VISIBLE ?AUTO_6805 ?AUTO_6804 ) ( AVAILABLE ?AUTO_6803 ) ( CHANNEL_FREE ?AUTO_6802 ) ( not ( = ?AUTO_6800 ?AUTO_6805 ) ) ( not ( = ?AUTO_6800 ?AUTO_6804 ) ) ( not ( = ?AUTO_6805 ?AUTO_6804 ) ) ( CAN_TRAVERSE ?AUTO_6803 ?AUTO_6800 ?AUTO_6805 ) ( VISIBLE ?AUTO_6800 ?AUTO_6805 ) ( AT_SOIL_SAMPLE ?AUTO_6800 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6803 ) ( STORE_OF ?AUTO_6801 ?AUTO_6803 ) ( CAN_TRAVERSE ?AUTO_6803 ?AUTO_6806 ?AUTO_6800 ) ( VISIBLE ?AUTO_6806 ?AUTO_6800 ) ( not ( = ?AUTO_6800 ?AUTO_6806 ) ) ( not ( = ?AUTO_6804 ?AUTO_6806 ) ) ( not ( = ?AUTO_6805 ?AUTO_6806 ) ) ( FULL ?AUTO_6801 ) ( CAN_TRAVERSE ?AUTO_6803 ?AUTO_6805 ?AUTO_6806 ) ( AT ?AUTO_6803 ?AUTO_6805 ) ( VISIBLE ?AUTO_6805 ?AUTO_6806 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6803 ?AUTO_6805 ?AUTO_6806 )
      ( GET_SOIL_DATA ?AUTO_6800 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6800 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6808 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6809 - LANDER
      ?AUTO_6811 - WAYPOINT
      ?AUTO_6812 - WAYPOINT
      ?AUTO_6814 - ROVER
      ?AUTO_6813 - STORE
      ?AUTO_6810 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6809 ?AUTO_6811 ) ( VISIBLE ?AUTO_6812 ?AUTO_6811 ) ( AVAILABLE ?AUTO_6814 ) ( CHANNEL_FREE ?AUTO_6809 ) ( not ( = ?AUTO_6808 ?AUTO_6812 ) ) ( not ( = ?AUTO_6808 ?AUTO_6811 ) ) ( not ( = ?AUTO_6812 ?AUTO_6811 ) ) ( CAN_TRAVERSE ?AUTO_6814 ?AUTO_6808 ?AUTO_6812 ) ( VISIBLE ?AUTO_6808 ?AUTO_6812 ) ( AT_SOIL_SAMPLE ?AUTO_6808 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6814 ) ( STORE_OF ?AUTO_6813 ?AUTO_6814 ) ( CAN_TRAVERSE ?AUTO_6814 ?AUTO_6810 ?AUTO_6808 ) ( VISIBLE ?AUTO_6810 ?AUTO_6808 ) ( not ( = ?AUTO_6808 ?AUTO_6810 ) ) ( not ( = ?AUTO_6811 ?AUTO_6810 ) ) ( not ( = ?AUTO_6812 ?AUTO_6810 ) ) ( FULL ?AUTO_6813 ) ( CAN_TRAVERSE ?AUTO_6814 ?AUTO_6812 ?AUTO_6810 ) ( VISIBLE ?AUTO_6812 ?AUTO_6810 ) ( CAN_TRAVERSE ?AUTO_6814 ?AUTO_6811 ?AUTO_6812 ) ( AT ?AUTO_6814 ?AUTO_6811 ) ( VISIBLE ?AUTO_6811 ?AUTO_6812 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6814 ?AUTO_6811 ?AUTO_6812 )
      ( GET_SOIL_DATA ?AUTO_6808 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6808 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6815 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6820 - LANDER
      ?AUTO_6819 - WAYPOINT
      ?AUTO_6818 - WAYPOINT
      ?AUTO_6821 - ROVER
      ?AUTO_6817 - STORE
      ?AUTO_6816 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6820 ?AUTO_6819 ) ( VISIBLE ?AUTO_6818 ?AUTO_6819 ) ( AVAILABLE ?AUTO_6821 ) ( CHANNEL_FREE ?AUTO_6820 ) ( not ( = ?AUTO_6815 ?AUTO_6818 ) ) ( not ( = ?AUTO_6815 ?AUTO_6819 ) ) ( not ( = ?AUTO_6818 ?AUTO_6819 ) ) ( CAN_TRAVERSE ?AUTO_6821 ?AUTO_6815 ?AUTO_6818 ) ( VISIBLE ?AUTO_6815 ?AUTO_6818 ) ( AT_SOIL_SAMPLE ?AUTO_6815 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6821 ) ( STORE_OF ?AUTO_6817 ?AUTO_6821 ) ( CAN_TRAVERSE ?AUTO_6821 ?AUTO_6816 ?AUTO_6815 ) ( VISIBLE ?AUTO_6816 ?AUTO_6815 ) ( not ( = ?AUTO_6815 ?AUTO_6816 ) ) ( not ( = ?AUTO_6819 ?AUTO_6816 ) ) ( not ( = ?AUTO_6818 ?AUTO_6816 ) ) ( CAN_TRAVERSE ?AUTO_6821 ?AUTO_6818 ?AUTO_6816 ) ( VISIBLE ?AUTO_6818 ?AUTO_6816 ) ( CAN_TRAVERSE ?AUTO_6821 ?AUTO_6819 ?AUTO_6818 ) ( AT ?AUTO_6821 ?AUTO_6819 ) ( VISIBLE ?AUTO_6819 ?AUTO_6818 ) ( AT_SOIL_SAMPLE ?AUTO_6819 ) ( EMPTY ?AUTO_6817 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6821 ?AUTO_6817 ?AUTO_6819 )
      ( GET_SOIL_DATA ?AUTO_6815 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6815 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6822 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6828 - LANDER
      ?AUTO_6825 - WAYPOINT
      ?AUTO_6827 - WAYPOINT
      ?AUTO_6824 - ROVER
      ?AUTO_6823 - STORE
      ?AUTO_6826 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6828 ?AUTO_6825 ) ( VISIBLE ?AUTO_6827 ?AUTO_6825 ) ( AVAILABLE ?AUTO_6824 ) ( CHANNEL_FREE ?AUTO_6828 ) ( not ( = ?AUTO_6822 ?AUTO_6827 ) ) ( not ( = ?AUTO_6822 ?AUTO_6825 ) ) ( not ( = ?AUTO_6827 ?AUTO_6825 ) ) ( CAN_TRAVERSE ?AUTO_6824 ?AUTO_6822 ?AUTO_6827 ) ( VISIBLE ?AUTO_6822 ?AUTO_6827 ) ( AT_SOIL_SAMPLE ?AUTO_6822 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6824 ) ( STORE_OF ?AUTO_6823 ?AUTO_6824 ) ( CAN_TRAVERSE ?AUTO_6824 ?AUTO_6826 ?AUTO_6822 ) ( VISIBLE ?AUTO_6826 ?AUTO_6822 ) ( not ( = ?AUTO_6822 ?AUTO_6826 ) ) ( not ( = ?AUTO_6825 ?AUTO_6826 ) ) ( not ( = ?AUTO_6827 ?AUTO_6826 ) ) ( CAN_TRAVERSE ?AUTO_6824 ?AUTO_6827 ?AUTO_6826 ) ( VISIBLE ?AUTO_6827 ?AUTO_6826 ) ( CAN_TRAVERSE ?AUTO_6824 ?AUTO_6825 ?AUTO_6827 ) ( VISIBLE ?AUTO_6825 ?AUTO_6827 ) ( AT_SOIL_SAMPLE ?AUTO_6825 ) ( EMPTY ?AUTO_6823 ) ( CAN_TRAVERSE ?AUTO_6824 ?AUTO_6827 ?AUTO_6825 ) ( AT ?AUTO_6824 ?AUTO_6827 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6824 ?AUTO_6827 ?AUTO_6825 )
      ( GET_SOIL_DATA ?AUTO_6822 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6822 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6842 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6844 - LANDER
      ?AUTO_6845 - WAYPOINT
      ?AUTO_6843 - WAYPOINT
      ?AUTO_6847 - ROVER
      ?AUTO_6848 - STORE
      ?AUTO_6846 - WAYPOINT
      ?AUTO_6849 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6844 ?AUTO_6845 ) ( VISIBLE ?AUTO_6843 ?AUTO_6845 ) ( AVAILABLE ?AUTO_6847 ) ( CHANNEL_FREE ?AUTO_6844 ) ( not ( = ?AUTO_6842 ?AUTO_6843 ) ) ( not ( = ?AUTO_6842 ?AUTO_6845 ) ) ( not ( = ?AUTO_6843 ?AUTO_6845 ) ) ( CAN_TRAVERSE ?AUTO_6847 ?AUTO_6842 ?AUTO_6843 ) ( VISIBLE ?AUTO_6842 ?AUTO_6843 ) ( AT_SOIL_SAMPLE ?AUTO_6842 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6847 ) ( STORE_OF ?AUTO_6848 ?AUTO_6847 ) ( CAN_TRAVERSE ?AUTO_6847 ?AUTO_6846 ?AUTO_6842 ) ( VISIBLE ?AUTO_6846 ?AUTO_6842 ) ( not ( = ?AUTO_6842 ?AUTO_6846 ) ) ( not ( = ?AUTO_6845 ?AUTO_6846 ) ) ( not ( = ?AUTO_6843 ?AUTO_6846 ) ) ( CAN_TRAVERSE ?AUTO_6847 ?AUTO_6843 ?AUTO_6846 ) ( VISIBLE ?AUTO_6843 ?AUTO_6846 ) ( CAN_TRAVERSE ?AUTO_6847 ?AUTO_6845 ?AUTO_6843 ) ( VISIBLE ?AUTO_6845 ?AUTO_6843 ) ( AT_SOIL_SAMPLE ?AUTO_6845 ) ( EMPTY ?AUTO_6848 ) ( CAN_TRAVERSE ?AUTO_6847 ?AUTO_6849 ?AUTO_6845 ) ( AT ?AUTO_6847 ?AUTO_6849 ) ( VISIBLE ?AUTO_6849 ?AUTO_6845 ) ( not ( = ?AUTO_6842 ?AUTO_6849 ) ) ( not ( = ?AUTO_6845 ?AUTO_6849 ) ) ( not ( = ?AUTO_6843 ?AUTO_6849 ) ) ( not ( = ?AUTO_6846 ?AUTO_6849 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6847 ?AUTO_6849 ?AUTO_6845 )
      ( GET_SOIL_DATA ?AUTO_6842 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6842 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6882 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6889 - LANDER
      ?AUTO_6888 - WAYPOINT
      ?AUTO_6887 - ROVER
      ?AUTO_6883 - STORE
      ?AUTO_6886 - WAYPOINT
      ?AUTO_6885 - WAYPOINT
      ?AUTO_6884 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6889 ?AUTO_6888 ) ( VISIBLE ?AUTO_6882 ?AUTO_6888 ) ( AVAILABLE ?AUTO_6887 ) ( CHANNEL_FREE ?AUTO_6889 ) ( not ( = ?AUTO_6882 ?AUTO_6888 ) ) ( AT_ROCK_SAMPLE ?AUTO_6882 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6887 ) ( STORE_OF ?AUTO_6883 ?AUTO_6887 ) ( CAN_TRAVERSE ?AUTO_6887 ?AUTO_6886 ?AUTO_6882 ) ( VISIBLE ?AUTO_6886 ?AUTO_6882 ) ( not ( = ?AUTO_6882 ?AUTO_6886 ) ) ( not ( = ?AUTO_6888 ?AUTO_6886 ) ) ( CAN_TRAVERSE ?AUTO_6887 ?AUTO_6885 ?AUTO_6886 ) ( VISIBLE ?AUTO_6885 ?AUTO_6886 ) ( not ( = ?AUTO_6882 ?AUTO_6885 ) ) ( not ( = ?AUTO_6888 ?AUTO_6885 ) ) ( not ( = ?AUTO_6886 ?AUTO_6885 ) ) ( CAN_TRAVERSE ?AUTO_6887 ?AUTO_6884 ?AUTO_6885 ) ( AT ?AUTO_6887 ?AUTO_6884 ) ( VISIBLE ?AUTO_6884 ?AUTO_6885 ) ( not ( = ?AUTO_6882 ?AUTO_6884 ) ) ( not ( = ?AUTO_6888 ?AUTO_6884 ) ) ( not ( = ?AUTO_6886 ?AUTO_6884 ) ) ( not ( = ?AUTO_6885 ?AUTO_6884 ) ) ( FULL ?AUTO_6883 ) )
    :subtasks
    ( ( !DROP ?AUTO_6887 ?AUTO_6883 )
      ( GET_ROCK_DATA ?AUTO_6882 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6882 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6906 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6911 - LANDER
      ?AUTO_6912 - WAYPOINT
      ?AUTO_6910 - ROVER
      ?AUTO_6907 - STORE
      ?AUTO_6908 - WAYPOINT
      ?AUTO_6909 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6911 ?AUTO_6912 ) ( VISIBLE ?AUTO_6906 ?AUTO_6912 ) ( AVAILABLE ?AUTO_6910 ) ( CHANNEL_FREE ?AUTO_6911 ) ( not ( = ?AUTO_6906 ?AUTO_6912 ) ) ( AT_ROCK_SAMPLE ?AUTO_6906 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6910 ) ( STORE_OF ?AUTO_6907 ?AUTO_6910 ) ( CAN_TRAVERSE ?AUTO_6910 ?AUTO_6908 ?AUTO_6906 ) ( VISIBLE ?AUTO_6908 ?AUTO_6906 ) ( not ( = ?AUTO_6906 ?AUTO_6908 ) ) ( not ( = ?AUTO_6912 ?AUTO_6908 ) ) ( FULL ?AUTO_6907 ) ( CAN_TRAVERSE ?AUTO_6910 ?AUTO_6909 ?AUTO_6908 ) ( VISIBLE ?AUTO_6909 ?AUTO_6908 ) ( not ( = ?AUTO_6906 ?AUTO_6909 ) ) ( not ( = ?AUTO_6912 ?AUTO_6909 ) ) ( not ( = ?AUTO_6908 ?AUTO_6909 ) ) ( CAN_TRAVERSE ?AUTO_6910 ?AUTO_6912 ?AUTO_6909 ) ( AT ?AUTO_6910 ?AUTO_6912 ) ( VISIBLE ?AUTO_6912 ?AUTO_6909 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6910 ?AUTO_6912 ?AUTO_6909 )
      ( GET_ROCK_DATA ?AUTO_6906 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6906 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6913 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6914 - LANDER
      ?AUTO_6915 - WAYPOINT
      ?AUTO_6917 - ROVER
      ?AUTO_6916 - STORE
      ?AUTO_6918 - WAYPOINT
      ?AUTO_6919 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6914 ?AUTO_6915 ) ( VISIBLE ?AUTO_6913 ?AUTO_6915 ) ( AVAILABLE ?AUTO_6917 ) ( CHANNEL_FREE ?AUTO_6914 ) ( not ( = ?AUTO_6913 ?AUTO_6915 ) ) ( AT_ROCK_SAMPLE ?AUTO_6913 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6917 ) ( STORE_OF ?AUTO_6916 ?AUTO_6917 ) ( CAN_TRAVERSE ?AUTO_6917 ?AUTO_6918 ?AUTO_6913 ) ( VISIBLE ?AUTO_6918 ?AUTO_6913 ) ( not ( = ?AUTO_6913 ?AUTO_6918 ) ) ( not ( = ?AUTO_6915 ?AUTO_6918 ) ) ( CAN_TRAVERSE ?AUTO_6917 ?AUTO_6919 ?AUTO_6918 ) ( VISIBLE ?AUTO_6919 ?AUTO_6918 ) ( not ( = ?AUTO_6913 ?AUTO_6919 ) ) ( not ( = ?AUTO_6915 ?AUTO_6919 ) ) ( not ( = ?AUTO_6918 ?AUTO_6919 ) ) ( CAN_TRAVERSE ?AUTO_6917 ?AUTO_6915 ?AUTO_6919 ) ( AT ?AUTO_6917 ?AUTO_6915 ) ( VISIBLE ?AUTO_6915 ?AUTO_6919 ) ( AT_SOIL_SAMPLE ?AUTO_6915 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6917 ) ( EMPTY ?AUTO_6916 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6917 ?AUTO_6916 ?AUTO_6915 )
      ( GET_ROCK_DATA ?AUTO_6913 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6913 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6934 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6935 - LANDER
      ?AUTO_6936 - WAYPOINT
      ?AUTO_6938 - ROVER
      ?AUTO_6939 - STORE
      ?AUTO_6937 - WAYPOINT
      ?AUTO_6940 - WAYPOINT
      ?AUTO_6941 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6935 ?AUTO_6936 ) ( VISIBLE ?AUTO_6934 ?AUTO_6936 ) ( AVAILABLE ?AUTO_6938 ) ( CHANNEL_FREE ?AUTO_6935 ) ( not ( = ?AUTO_6934 ?AUTO_6936 ) ) ( AT_ROCK_SAMPLE ?AUTO_6934 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6938 ) ( STORE_OF ?AUTO_6939 ?AUTO_6938 ) ( CAN_TRAVERSE ?AUTO_6938 ?AUTO_6937 ?AUTO_6934 ) ( VISIBLE ?AUTO_6937 ?AUTO_6934 ) ( not ( = ?AUTO_6934 ?AUTO_6937 ) ) ( not ( = ?AUTO_6936 ?AUTO_6937 ) ) ( CAN_TRAVERSE ?AUTO_6938 ?AUTO_6940 ?AUTO_6937 ) ( VISIBLE ?AUTO_6940 ?AUTO_6937 ) ( not ( = ?AUTO_6934 ?AUTO_6940 ) ) ( not ( = ?AUTO_6936 ?AUTO_6940 ) ) ( not ( = ?AUTO_6937 ?AUTO_6940 ) ) ( CAN_TRAVERSE ?AUTO_6938 ?AUTO_6936 ?AUTO_6940 ) ( VISIBLE ?AUTO_6936 ?AUTO_6940 ) ( AT_SOIL_SAMPLE ?AUTO_6936 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6938 ) ( EMPTY ?AUTO_6939 ) ( CAN_TRAVERSE ?AUTO_6938 ?AUTO_6941 ?AUTO_6936 ) ( AT ?AUTO_6938 ?AUTO_6941 ) ( VISIBLE ?AUTO_6941 ?AUTO_6936 ) ( not ( = ?AUTO_6934 ?AUTO_6941 ) ) ( not ( = ?AUTO_6936 ?AUTO_6941 ) ) ( not ( = ?AUTO_6937 ?AUTO_6941 ) ) ( not ( = ?AUTO_6940 ?AUTO_6941 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6938 ?AUTO_6941 ?AUTO_6936 )
      ( GET_ROCK_DATA ?AUTO_6934 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6934 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6978 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6982 - LANDER
      ?AUTO_6984 - WAYPOINT
      ?AUTO_6983 - WAYPOINT
      ?AUTO_6979 - ROVER
      ?AUTO_6981 - WAYPOINT
      ?AUTO_6980 - STORE
      ?AUTO_6985 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6982 ?AUTO_6984 ) ( VISIBLE ?AUTO_6983 ?AUTO_6984 ) ( AVAILABLE ?AUTO_6979 ) ( CHANNEL_FREE ?AUTO_6982 ) ( not ( = ?AUTO_6978 ?AUTO_6983 ) ) ( not ( = ?AUTO_6978 ?AUTO_6984 ) ) ( not ( = ?AUTO_6983 ?AUTO_6984 ) ) ( CAN_TRAVERSE ?AUTO_6979 ?AUTO_6981 ?AUTO_6983 ) ( VISIBLE ?AUTO_6981 ?AUTO_6983 ) ( not ( = ?AUTO_6978 ?AUTO_6981 ) ) ( not ( = ?AUTO_6984 ?AUTO_6981 ) ) ( not ( = ?AUTO_6983 ?AUTO_6981 ) ) ( CAN_TRAVERSE ?AUTO_6979 ?AUTO_6978 ?AUTO_6981 ) ( VISIBLE ?AUTO_6978 ?AUTO_6981 ) ( AT_ROCK_SAMPLE ?AUTO_6978 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6979 ) ( STORE_OF ?AUTO_6980 ?AUTO_6979 ) ( EMPTY ?AUTO_6980 ) ( CAN_TRAVERSE ?AUTO_6979 ?AUTO_6985 ?AUTO_6978 ) ( AT ?AUTO_6979 ?AUTO_6985 ) ( VISIBLE ?AUTO_6985 ?AUTO_6978 ) ( not ( = ?AUTO_6978 ?AUTO_6985 ) ) ( not ( = ?AUTO_6984 ?AUTO_6985 ) ) ( not ( = ?AUTO_6983 ?AUTO_6985 ) ) ( not ( = ?AUTO_6981 ?AUTO_6985 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6979 ?AUTO_6985 ?AUTO_6978 )
      ( GET_ROCK_DATA ?AUTO_6978 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6978 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6986 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6992 - LANDER
      ?AUTO_6991 - WAYPOINT
      ?AUTO_6988 - WAYPOINT
      ?AUTO_6987 - ROVER
      ?AUTO_6989 - WAYPOINT
      ?AUTO_6990 - STORE
      ?AUTO_6993 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6992 ?AUTO_6991 ) ( VISIBLE ?AUTO_6988 ?AUTO_6991 ) ( AVAILABLE ?AUTO_6987 ) ( CHANNEL_FREE ?AUTO_6992 ) ( not ( = ?AUTO_6986 ?AUTO_6988 ) ) ( not ( = ?AUTO_6986 ?AUTO_6991 ) ) ( not ( = ?AUTO_6988 ?AUTO_6991 ) ) ( CAN_TRAVERSE ?AUTO_6987 ?AUTO_6989 ?AUTO_6988 ) ( VISIBLE ?AUTO_6989 ?AUTO_6988 ) ( not ( = ?AUTO_6986 ?AUTO_6989 ) ) ( not ( = ?AUTO_6991 ?AUTO_6989 ) ) ( not ( = ?AUTO_6988 ?AUTO_6989 ) ) ( CAN_TRAVERSE ?AUTO_6987 ?AUTO_6986 ?AUTO_6989 ) ( VISIBLE ?AUTO_6986 ?AUTO_6989 ) ( AT_ROCK_SAMPLE ?AUTO_6986 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6987 ) ( STORE_OF ?AUTO_6990 ?AUTO_6987 ) ( CAN_TRAVERSE ?AUTO_6987 ?AUTO_6993 ?AUTO_6986 ) ( AT ?AUTO_6987 ?AUTO_6993 ) ( VISIBLE ?AUTO_6993 ?AUTO_6986 ) ( not ( = ?AUTO_6986 ?AUTO_6993 ) ) ( not ( = ?AUTO_6991 ?AUTO_6993 ) ) ( not ( = ?AUTO_6988 ?AUTO_6993 ) ) ( not ( = ?AUTO_6989 ?AUTO_6993 ) ) ( FULL ?AUTO_6990 ) )
    :subtasks
    ( ( !DROP ?AUTO_6987 ?AUTO_6990 )
      ( GET_ROCK_DATA ?AUTO_6986 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6986 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7033 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7034 - LANDER
      ?AUTO_7040 - WAYPOINT
      ?AUTO_7039 - ROVER
      ?AUTO_7038 - STORE
      ?AUTO_7037 - WAYPOINT
      ?AUTO_7035 - WAYPOINT
      ?AUTO_7036 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7034 ?AUTO_7033 ) ( VISIBLE ?AUTO_7040 ?AUTO_7033 ) ( AVAILABLE ?AUTO_7039 ) ( CHANNEL_FREE ?AUTO_7034 ) ( not ( = ?AUTO_7033 ?AUTO_7040 ) ) ( CAN_TRAVERSE ?AUTO_7039 ?AUTO_7033 ?AUTO_7040 ) ( VISIBLE ?AUTO_7033 ?AUTO_7040 ) ( AT_SOIL_SAMPLE ?AUTO_7033 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7039 ) ( STORE_OF ?AUTO_7038 ?AUTO_7039 ) ( CAN_TRAVERSE ?AUTO_7039 ?AUTO_7037 ?AUTO_7033 ) ( VISIBLE ?AUTO_7037 ?AUTO_7033 ) ( not ( = ?AUTO_7033 ?AUTO_7037 ) ) ( not ( = ?AUTO_7040 ?AUTO_7037 ) ) ( CAN_TRAVERSE ?AUTO_7039 ?AUTO_7035 ?AUTO_7037 ) ( VISIBLE ?AUTO_7035 ?AUTO_7037 ) ( not ( = ?AUTO_7033 ?AUTO_7035 ) ) ( not ( = ?AUTO_7040 ?AUTO_7035 ) ) ( not ( = ?AUTO_7037 ?AUTO_7035 ) ) ( CAN_TRAVERSE ?AUTO_7039 ?AUTO_7036 ?AUTO_7035 ) ( AT ?AUTO_7039 ?AUTO_7036 ) ( VISIBLE ?AUTO_7036 ?AUTO_7035 ) ( not ( = ?AUTO_7033 ?AUTO_7036 ) ) ( not ( = ?AUTO_7040 ?AUTO_7036 ) ) ( not ( = ?AUTO_7037 ?AUTO_7036 ) ) ( not ( = ?AUTO_7035 ?AUTO_7036 ) ) ( FULL ?AUTO_7038 ) )
    :subtasks
    ( ( !DROP ?AUTO_7039 ?AUTO_7038 )
      ( GET_SOIL_DATA ?AUTO_7033 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7033 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7042 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7049 - LANDER
      ?AUTO_7044 - WAYPOINT
      ?AUTO_7046 - ROVER
      ?AUTO_7047 - STORE
      ?AUTO_7043 - WAYPOINT
      ?AUTO_7048 - WAYPOINT
      ?AUTO_7045 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7049 ?AUTO_7042 ) ( VISIBLE ?AUTO_7044 ?AUTO_7042 ) ( AVAILABLE ?AUTO_7046 ) ( CHANNEL_FREE ?AUTO_7049 ) ( not ( = ?AUTO_7042 ?AUTO_7044 ) ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7042 ?AUTO_7044 ) ( VISIBLE ?AUTO_7042 ?AUTO_7044 ) ( AT_SOIL_SAMPLE ?AUTO_7042 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7046 ) ( STORE_OF ?AUTO_7047 ?AUTO_7046 ) ( EMPTY ?AUTO_7047 ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7043 ?AUTO_7042 ) ( VISIBLE ?AUTO_7043 ?AUTO_7042 ) ( not ( = ?AUTO_7042 ?AUTO_7043 ) ) ( not ( = ?AUTO_7044 ?AUTO_7043 ) ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7048 ?AUTO_7043 ) ( VISIBLE ?AUTO_7048 ?AUTO_7043 ) ( not ( = ?AUTO_7042 ?AUTO_7048 ) ) ( not ( = ?AUTO_7044 ?AUTO_7048 ) ) ( not ( = ?AUTO_7043 ?AUTO_7048 ) ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7045 ?AUTO_7048 ) ( VISIBLE ?AUTO_7045 ?AUTO_7048 ) ( not ( = ?AUTO_7042 ?AUTO_7045 ) ) ( not ( = ?AUTO_7044 ?AUTO_7045 ) ) ( not ( = ?AUTO_7043 ?AUTO_7045 ) ) ( not ( = ?AUTO_7048 ?AUTO_7045 ) ) ( CAN_TRAVERSE ?AUTO_7046 ?AUTO_7044 ?AUTO_7045 ) ( AT ?AUTO_7046 ?AUTO_7044 ) ( VISIBLE ?AUTO_7044 ?AUTO_7045 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7046 ?AUTO_7044 ?AUTO_7045 )
      ( GET_SOIL_DATA ?AUTO_7042 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7042 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7050 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7057 - LANDER
      ?AUTO_7055 - WAYPOINT
      ?AUTO_7053 - ROVER
      ?AUTO_7056 - STORE
      ?AUTO_7051 - WAYPOINT
      ?AUTO_7052 - WAYPOINT
      ?AUTO_7054 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7057 ?AUTO_7050 ) ( VISIBLE ?AUTO_7055 ?AUTO_7050 ) ( AVAILABLE ?AUTO_7053 ) ( CHANNEL_FREE ?AUTO_7057 ) ( not ( = ?AUTO_7050 ?AUTO_7055 ) ) ( CAN_TRAVERSE ?AUTO_7053 ?AUTO_7050 ?AUTO_7055 ) ( VISIBLE ?AUTO_7050 ?AUTO_7055 ) ( AT_SOIL_SAMPLE ?AUTO_7050 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7053 ) ( STORE_OF ?AUTO_7056 ?AUTO_7053 ) ( CAN_TRAVERSE ?AUTO_7053 ?AUTO_7051 ?AUTO_7050 ) ( VISIBLE ?AUTO_7051 ?AUTO_7050 ) ( not ( = ?AUTO_7050 ?AUTO_7051 ) ) ( not ( = ?AUTO_7055 ?AUTO_7051 ) ) ( CAN_TRAVERSE ?AUTO_7053 ?AUTO_7052 ?AUTO_7051 ) ( VISIBLE ?AUTO_7052 ?AUTO_7051 ) ( not ( = ?AUTO_7050 ?AUTO_7052 ) ) ( not ( = ?AUTO_7055 ?AUTO_7052 ) ) ( not ( = ?AUTO_7051 ?AUTO_7052 ) ) ( CAN_TRAVERSE ?AUTO_7053 ?AUTO_7054 ?AUTO_7052 ) ( VISIBLE ?AUTO_7054 ?AUTO_7052 ) ( not ( = ?AUTO_7050 ?AUTO_7054 ) ) ( not ( = ?AUTO_7055 ?AUTO_7054 ) ) ( not ( = ?AUTO_7051 ?AUTO_7054 ) ) ( not ( = ?AUTO_7052 ?AUTO_7054 ) ) ( CAN_TRAVERSE ?AUTO_7053 ?AUTO_7055 ?AUTO_7054 ) ( AT ?AUTO_7053 ?AUTO_7055 ) ( VISIBLE ?AUTO_7055 ?AUTO_7054 ) ( FULL ?AUTO_7056 ) )
    :subtasks
    ( ( !DROP ?AUTO_7053 ?AUTO_7056 )
      ( GET_SOIL_DATA ?AUTO_7050 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7050 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7071 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7075 - LANDER
      ?AUTO_7073 - WAYPOINT
      ?AUTO_7072 - ROVER
      ?AUTO_7074 - WAYPOINT
      ?AUTO_7076 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7075 ?AUTO_7073 ) ( HAVE_ROCK_ANALYSIS ?AUTO_7072 ?AUTO_7071 ) ( VISIBLE ?AUTO_7074 ?AUTO_7073 ) ( AVAILABLE ?AUTO_7072 ) ( CHANNEL_FREE ?AUTO_7075 ) ( not ( = ?AUTO_7071 ?AUTO_7074 ) ) ( not ( = ?AUTO_7071 ?AUTO_7073 ) ) ( not ( = ?AUTO_7074 ?AUTO_7073 ) ) ( CAN_TRAVERSE ?AUTO_7072 ?AUTO_7071 ?AUTO_7074 ) ( VISIBLE ?AUTO_7071 ?AUTO_7074 ) ( CAN_TRAVERSE ?AUTO_7072 ?AUTO_7076 ?AUTO_7071 ) ( AT ?AUTO_7072 ?AUTO_7076 ) ( VISIBLE ?AUTO_7076 ?AUTO_7071 ) ( not ( = ?AUTO_7071 ?AUTO_7076 ) ) ( not ( = ?AUTO_7073 ?AUTO_7076 ) ) ( not ( = ?AUTO_7074 ?AUTO_7076 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7072 ?AUTO_7076 ?AUTO_7071 )
      ( GET_ROCK_DATA ?AUTO_7071 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7071 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7098 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7100 - LANDER
      ?AUTO_7099 - WAYPOINT
      ?AUTO_7102 - WAYPOINT
      ?AUTO_7103 - ROVER
      ?AUTO_7101 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7100 ?AUTO_7099 ) ( VISIBLE ?AUTO_7102 ?AUTO_7099 ) ( AVAILABLE ?AUTO_7103 ) ( CHANNEL_FREE ?AUTO_7100 ) ( not ( = ?AUTO_7098 ?AUTO_7102 ) ) ( not ( = ?AUTO_7098 ?AUTO_7099 ) ) ( not ( = ?AUTO_7102 ?AUTO_7099 ) ) ( CAN_TRAVERSE ?AUTO_7103 ?AUTO_7098 ?AUTO_7102 ) ( VISIBLE ?AUTO_7098 ?AUTO_7102 ) ( AT_ROCK_SAMPLE ?AUTO_7098 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7103 ) ( STORE_OF ?AUTO_7101 ?AUTO_7103 ) ( CAN_TRAVERSE ?AUTO_7103 ?AUTO_7102 ?AUTO_7098 ) ( VISIBLE ?AUTO_7102 ?AUTO_7098 ) ( FULL ?AUTO_7101 ) ( CAN_TRAVERSE ?AUTO_7103 ?AUTO_7099 ?AUTO_7102 ) ( AT ?AUTO_7103 ?AUTO_7099 ) ( VISIBLE ?AUTO_7099 ?AUTO_7102 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7103 ?AUTO_7099 ?AUTO_7102 )
      ( GET_ROCK_DATA ?AUTO_7098 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7098 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7104 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7108 - LANDER
      ?AUTO_7105 - WAYPOINT
      ?AUTO_7106 - WAYPOINT
      ?AUTO_7109 - ROVER
      ?AUTO_7107 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7108 ?AUTO_7105 ) ( VISIBLE ?AUTO_7106 ?AUTO_7105 ) ( AVAILABLE ?AUTO_7109 ) ( CHANNEL_FREE ?AUTO_7108 ) ( not ( = ?AUTO_7104 ?AUTO_7106 ) ) ( not ( = ?AUTO_7104 ?AUTO_7105 ) ) ( not ( = ?AUTO_7106 ?AUTO_7105 ) ) ( CAN_TRAVERSE ?AUTO_7109 ?AUTO_7104 ?AUTO_7106 ) ( VISIBLE ?AUTO_7104 ?AUTO_7106 ) ( AT_ROCK_SAMPLE ?AUTO_7104 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7109 ) ( STORE_OF ?AUTO_7107 ?AUTO_7109 ) ( CAN_TRAVERSE ?AUTO_7109 ?AUTO_7106 ?AUTO_7104 ) ( VISIBLE ?AUTO_7106 ?AUTO_7104 ) ( CAN_TRAVERSE ?AUTO_7109 ?AUTO_7105 ?AUTO_7106 ) ( AT ?AUTO_7109 ?AUTO_7105 ) ( VISIBLE ?AUTO_7105 ?AUTO_7106 ) ( AT_SOIL_SAMPLE ?AUTO_7105 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7109 ) ( EMPTY ?AUTO_7107 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_7109 ?AUTO_7107 ?AUTO_7105 )
      ( GET_ROCK_DATA ?AUTO_7104 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7104 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7129 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7132 - LANDER
      ?AUTO_7131 - WAYPOINT
      ?AUTO_7133 - WAYPOINT
      ?AUTO_7135 - ROVER
      ?AUTO_7130 - STORE
      ?AUTO_7134 - WAYPOINT
      ?AUTO_7136 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7132 ?AUTO_7131 ) ( VISIBLE ?AUTO_7133 ?AUTO_7131 ) ( AVAILABLE ?AUTO_7135 ) ( CHANNEL_FREE ?AUTO_7132 ) ( not ( = ?AUTO_7129 ?AUTO_7133 ) ) ( not ( = ?AUTO_7129 ?AUTO_7131 ) ) ( not ( = ?AUTO_7133 ?AUTO_7131 ) ) ( CAN_TRAVERSE ?AUTO_7135 ?AUTO_7129 ?AUTO_7133 ) ( VISIBLE ?AUTO_7129 ?AUTO_7133 ) ( AT_ROCK_SAMPLE ?AUTO_7129 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7135 ) ( STORE_OF ?AUTO_7130 ?AUTO_7135 ) ( EMPTY ?AUTO_7130 ) ( CAN_TRAVERSE ?AUTO_7135 ?AUTO_7134 ?AUTO_7129 ) ( VISIBLE ?AUTO_7134 ?AUTO_7129 ) ( not ( = ?AUTO_7129 ?AUTO_7134 ) ) ( not ( = ?AUTO_7131 ?AUTO_7134 ) ) ( not ( = ?AUTO_7133 ?AUTO_7134 ) ) ( CAN_TRAVERSE ?AUTO_7135 ?AUTO_7136 ?AUTO_7134 ) ( AT ?AUTO_7135 ?AUTO_7136 ) ( VISIBLE ?AUTO_7136 ?AUTO_7134 ) ( not ( = ?AUTO_7129 ?AUTO_7136 ) ) ( not ( = ?AUTO_7131 ?AUTO_7136 ) ) ( not ( = ?AUTO_7133 ?AUTO_7136 ) ) ( not ( = ?AUTO_7134 ?AUTO_7136 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7135 ?AUTO_7136 ?AUTO_7134 )
      ( GET_ROCK_DATA ?AUTO_7129 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7129 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7137 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7140 - LANDER
      ?AUTO_7143 - WAYPOINT
      ?AUTO_7142 - WAYPOINT
      ?AUTO_7139 - ROVER
      ?AUTO_7138 - STORE
      ?AUTO_7144 - WAYPOINT
      ?AUTO_7141 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7140 ?AUTO_7143 ) ( VISIBLE ?AUTO_7142 ?AUTO_7143 ) ( AVAILABLE ?AUTO_7139 ) ( CHANNEL_FREE ?AUTO_7140 ) ( not ( = ?AUTO_7137 ?AUTO_7142 ) ) ( not ( = ?AUTO_7137 ?AUTO_7143 ) ) ( not ( = ?AUTO_7142 ?AUTO_7143 ) ) ( CAN_TRAVERSE ?AUTO_7139 ?AUTO_7137 ?AUTO_7142 ) ( VISIBLE ?AUTO_7137 ?AUTO_7142 ) ( AT_ROCK_SAMPLE ?AUTO_7137 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7139 ) ( STORE_OF ?AUTO_7138 ?AUTO_7139 ) ( CAN_TRAVERSE ?AUTO_7139 ?AUTO_7144 ?AUTO_7137 ) ( VISIBLE ?AUTO_7144 ?AUTO_7137 ) ( not ( = ?AUTO_7137 ?AUTO_7144 ) ) ( not ( = ?AUTO_7143 ?AUTO_7144 ) ) ( not ( = ?AUTO_7142 ?AUTO_7144 ) ) ( CAN_TRAVERSE ?AUTO_7139 ?AUTO_7141 ?AUTO_7144 ) ( AT ?AUTO_7139 ?AUTO_7141 ) ( VISIBLE ?AUTO_7141 ?AUTO_7144 ) ( not ( = ?AUTO_7137 ?AUTO_7141 ) ) ( not ( = ?AUTO_7143 ?AUTO_7141 ) ) ( not ( = ?AUTO_7142 ?AUTO_7141 ) ) ( not ( = ?AUTO_7144 ?AUTO_7141 ) ) ( FULL ?AUTO_7138 ) )
    :subtasks
    ( ( !DROP ?AUTO_7139 ?AUTO_7138 )
      ( GET_ROCK_DATA ?AUTO_7137 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7137 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7205 - OBJECTIVE
      ?AUTO_7206 - MODE
    )
    :vars
    (
      ?AUTO_7207 - LANDER
      ?AUTO_7210 - WAYPOINT
      ?AUTO_7212 - WAYPOINT
      ?AUTO_7211 - ROVER
      ?AUTO_7213 - WAYPOINT
      ?AUTO_7209 - WAYPOINT
      ?AUTO_7208 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7207 ?AUTO_7210 ) ( VISIBLE ?AUTO_7212 ?AUTO_7210 ) ( AVAILABLE ?AUTO_7211 ) ( CHANNEL_FREE ?AUTO_7207 ) ( not ( = ?AUTO_7212 ?AUTO_7210 ) ) ( CAN_TRAVERSE ?AUTO_7211 ?AUTO_7213 ?AUTO_7212 ) ( VISIBLE ?AUTO_7213 ?AUTO_7212 ) ( not ( = ?AUTO_7210 ?AUTO_7213 ) ) ( not ( = ?AUTO_7212 ?AUTO_7213 ) ) ( CAN_TRAVERSE ?AUTO_7211 ?AUTO_7209 ?AUTO_7213 ) ( VISIBLE ?AUTO_7209 ?AUTO_7213 ) ( not ( = ?AUTO_7210 ?AUTO_7209 ) ) ( not ( = ?AUTO_7212 ?AUTO_7209 ) ) ( not ( = ?AUTO_7213 ?AUTO_7209 ) ) ( CALIBRATED ?AUTO_7208 ?AUTO_7211 ) ( ON_BOARD ?AUTO_7208 ?AUTO_7211 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7211 ) ( SUPPORTS ?AUTO_7208 ?AUTO_7206 ) ( VISIBLE_FROM ?AUTO_7205 ?AUTO_7209 ) ( CAN_TRAVERSE ?AUTO_7211 ?AUTO_7213 ?AUTO_7209 ) ( VISIBLE ?AUTO_7213 ?AUTO_7209 ) ( CAN_TRAVERSE ?AUTO_7211 ?AUTO_7212 ?AUTO_7213 ) ( VISIBLE ?AUTO_7212 ?AUTO_7213 ) ( CAN_TRAVERSE ?AUTO_7211 ?AUTO_7210 ?AUTO_7212 ) ( AT ?AUTO_7211 ?AUTO_7210 ) ( VISIBLE ?AUTO_7210 ?AUTO_7212 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7211 ?AUTO_7210 ?AUTO_7212 )
      ( GET_IMAGE_DATA ?AUTO_7205 ?AUTO_7206 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7205 ?AUTO_7206 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7216 - OBJECTIVE
      ?AUTO_7217 - MODE
    )
    :vars
    (
      ?AUTO_7221 - LANDER
      ?AUTO_7222 - WAYPOINT
      ?AUTO_7224 - WAYPOINT
      ?AUTO_7219 - ROVER
      ?AUTO_7220 - WAYPOINT
      ?AUTO_7218 - WAYPOINT
      ?AUTO_7223 - CAMERA
      ?AUTO_7225 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7221 ?AUTO_7222 ) ( VISIBLE ?AUTO_7224 ?AUTO_7222 ) ( AVAILABLE ?AUTO_7219 ) ( CHANNEL_FREE ?AUTO_7221 ) ( not ( = ?AUTO_7224 ?AUTO_7222 ) ) ( CAN_TRAVERSE ?AUTO_7219 ?AUTO_7220 ?AUTO_7224 ) ( VISIBLE ?AUTO_7220 ?AUTO_7224 ) ( not ( = ?AUTO_7222 ?AUTO_7220 ) ) ( not ( = ?AUTO_7224 ?AUTO_7220 ) ) ( CAN_TRAVERSE ?AUTO_7219 ?AUTO_7218 ?AUTO_7220 ) ( VISIBLE ?AUTO_7218 ?AUTO_7220 ) ( not ( = ?AUTO_7222 ?AUTO_7218 ) ) ( not ( = ?AUTO_7224 ?AUTO_7218 ) ) ( not ( = ?AUTO_7220 ?AUTO_7218 ) ) ( ON_BOARD ?AUTO_7223 ?AUTO_7219 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7219 ) ( SUPPORTS ?AUTO_7223 ?AUTO_7217 ) ( VISIBLE_FROM ?AUTO_7216 ?AUTO_7218 ) ( CAN_TRAVERSE ?AUTO_7219 ?AUTO_7220 ?AUTO_7218 ) ( VISIBLE ?AUTO_7220 ?AUTO_7218 ) ( CAN_TRAVERSE ?AUTO_7219 ?AUTO_7224 ?AUTO_7220 ) ( VISIBLE ?AUTO_7224 ?AUTO_7220 ) ( CAN_TRAVERSE ?AUTO_7219 ?AUTO_7222 ?AUTO_7224 ) ( AT ?AUTO_7219 ?AUTO_7222 ) ( VISIBLE ?AUTO_7222 ?AUTO_7224 ) ( CALIBRATION_TARGET ?AUTO_7223 ?AUTO_7225 ) ( VISIBLE_FROM ?AUTO_7225 ?AUTO_7222 ) ( not ( = ?AUTO_7216 ?AUTO_7225 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7219 ?AUTO_7223 ?AUTO_7225 ?AUTO_7222 )
      ( GET_IMAGE_DATA ?AUTO_7216 ?AUTO_7217 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7216 ?AUTO_7217 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7226 - OBJECTIVE
      ?AUTO_7227 - MODE
    )
    :vars
    (
      ?AUTO_7231 - LANDER
      ?AUTO_7235 - WAYPOINT
      ?AUTO_7233 - WAYPOINT
      ?AUTO_7228 - ROVER
      ?AUTO_7232 - WAYPOINT
      ?AUTO_7229 - WAYPOINT
      ?AUTO_7230 - CAMERA
      ?AUTO_7234 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7231 ?AUTO_7235 ) ( VISIBLE ?AUTO_7233 ?AUTO_7235 ) ( AVAILABLE ?AUTO_7228 ) ( CHANNEL_FREE ?AUTO_7231 ) ( not ( = ?AUTO_7233 ?AUTO_7235 ) ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7232 ?AUTO_7233 ) ( VISIBLE ?AUTO_7232 ?AUTO_7233 ) ( not ( = ?AUTO_7235 ?AUTO_7232 ) ) ( not ( = ?AUTO_7233 ?AUTO_7232 ) ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7229 ?AUTO_7232 ) ( VISIBLE ?AUTO_7229 ?AUTO_7232 ) ( not ( = ?AUTO_7235 ?AUTO_7229 ) ) ( not ( = ?AUTO_7233 ?AUTO_7229 ) ) ( not ( = ?AUTO_7232 ?AUTO_7229 ) ) ( ON_BOARD ?AUTO_7230 ?AUTO_7228 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7228 ) ( SUPPORTS ?AUTO_7230 ?AUTO_7227 ) ( VISIBLE_FROM ?AUTO_7226 ?AUTO_7229 ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7232 ?AUTO_7229 ) ( VISIBLE ?AUTO_7232 ?AUTO_7229 ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7233 ?AUTO_7232 ) ( VISIBLE ?AUTO_7233 ?AUTO_7232 ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7235 ?AUTO_7233 ) ( VISIBLE ?AUTO_7235 ?AUTO_7233 ) ( CALIBRATION_TARGET ?AUTO_7230 ?AUTO_7234 ) ( VISIBLE_FROM ?AUTO_7234 ?AUTO_7235 ) ( not ( = ?AUTO_7226 ?AUTO_7234 ) ) ( CAN_TRAVERSE ?AUTO_7228 ?AUTO_7233 ?AUTO_7235 ) ( AT ?AUTO_7228 ?AUTO_7233 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7228 ?AUTO_7233 ?AUTO_7235 )
      ( GET_IMAGE_DATA ?AUTO_7226 ?AUTO_7227 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7226 ?AUTO_7227 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7238 - OBJECTIVE
      ?AUTO_7239 - MODE
    )
    :vars
    (
      ?AUTO_7245 - LANDER
      ?AUTO_7246 - WAYPOINT
      ?AUTO_7247 - WAYPOINT
      ?AUTO_7242 - ROVER
      ?AUTO_7243 - WAYPOINT
      ?AUTO_7241 - WAYPOINT
      ?AUTO_7240 - CAMERA
      ?AUTO_7244 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7245 ?AUTO_7246 ) ( VISIBLE ?AUTO_7247 ?AUTO_7246 ) ( AVAILABLE ?AUTO_7242 ) ( CHANNEL_FREE ?AUTO_7245 ) ( not ( = ?AUTO_7247 ?AUTO_7246 ) ) ( CAN_TRAVERSE ?AUTO_7242 ?AUTO_7243 ?AUTO_7247 ) ( VISIBLE ?AUTO_7243 ?AUTO_7247 ) ( not ( = ?AUTO_7246 ?AUTO_7243 ) ) ( not ( = ?AUTO_7247 ?AUTO_7243 ) ) ( CAN_TRAVERSE ?AUTO_7242 ?AUTO_7241 ?AUTO_7243 ) ( VISIBLE ?AUTO_7241 ?AUTO_7243 ) ( not ( = ?AUTO_7246 ?AUTO_7241 ) ) ( not ( = ?AUTO_7247 ?AUTO_7241 ) ) ( not ( = ?AUTO_7243 ?AUTO_7241 ) ) ( ON_BOARD ?AUTO_7240 ?AUTO_7242 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7242 ) ( SUPPORTS ?AUTO_7240 ?AUTO_7239 ) ( VISIBLE_FROM ?AUTO_7238 ?AUTO_7241 ) ( CAN_TRAVERSE ?AUTO_7242 ?AUTO_7243 ?AUTO_7241 ) ( VISIBLE ?AUTO_7243 ?AUTO_7241 ) ( CAN_TRAVERSE ?AUTO_7242 ?AUTO_7247 ?AUTO_7243 ) ( VISIBLE ?AUTO_7247 ?AUTO_7243 ) ( CAN_TRAVERSE ?AUTO_7242 ?AUTO_7246 ?AUTO_7247 ) ( VISIBLE ?AUTO_7246 ?AUTO_7247 ) ( CALIBRATION_TARGET ?AUTO_7240 ?AUTO_7244 ) ( VISIBLE_FROM ?AUTO_7244 ?AUTO_7246 ) ( not ( = ?AUTO_7238 ?AUTO_7244 ) ) ( CAN_TRAVERSE ?AUTO_7242 ?AUTO_7247 ?AUTO_7246 ) ( AT ?AUTO_7242 ?AUTO_7243 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7242 ?AUTO_7243 ?AUTO_7247 )
      ( GET_IMAGE_DATA ?AUTO_7238 ?AUTO_7239 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7238 ?AUTO_7239 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7248 - OBJECTIVE
      ?AUTO_7249 - MODE
    )
    :vars
    (
      ?AUTO_7253 - LANDER
      ?AUTO_7254 - WAYPOINT
      ?AUTO_7251 - WAYPOINT
      ?AUTO_7252 - ROVER
      ?AUTO_7255 - WAYPOINT
      ?AUTO_7257 - WAYPOINT
      ?AUTO_7250 - CAMERA
      ?AUTO_7256 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7253 ?AUTO_7254 ) ( VISIBLE ?AUTO_7251 ?AUTO_7254 ) ( AVAILABLE ?AUTO_7252 ) ( CHANNEL_FREE ?AUTO_7253 ) ( not ( = ?AUTO_7251 ?AUTO_7254 ) ) ( CAN_TRAVERSE ?AUTO_7252 ?AUTO_7255 ?AUTO_7251 ) ( VISIBLE ?AUTO_7255 ?AUTO_7251 ) ( not ( = ?AUTO_7254 ?AUTO_7255 ) ) ( not ( = ?AUTO_7251 ?AUTO_7255 ) ) ( CAN_TRAVERSE ?AUTO_7252 ?AUTO_7257 ?AUTO_7255 ) ( VISIBLE ?AUTO_7257 ?AUTO_7255 ) ( not ( = ?AUTO_7254 ?AUTO_7257 ) ) ( not ( = ?AUTO_7251 ?AUTO_7257 ) ) ( not ( = ?AUTO_7255 ?AUTO_7257 ) ) ( ON_BOARD ?AUTO_7250 ?AUTO_7252 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7252 ) ( SUPPORTS ?AUTO_7250 ?AUTO_7249 ) ( VISIBLE_FROM ?AUTO_7248 ?AUTO_7257 ) ( CAN_TRAVERSE ?AUTO_7252 ?AUTO_7255 ?AUTO_7257 ) ( VISIBLE ?AUTO_7255 ?AUTO_7257 ) ( CAN_TRAVERSE ?AUTO_7252 ?AUTO_7251 ?AUTO_7255 ) ( VISIBLE ?AUTO_7251 ?AUTO_7255 ) ( CAN_TRAVERSE ?AUTO_7252 ?AUTO_7254 ?AUTO_7251 ) ( VISIBLE ?AUTO_7254 ?AUTO_7251 ) ( CALIBRATION_TARGET ?AUTO_7250 ?AUTO_7256 ) ( VISIBLE_FROM ?AUTO_7256 ?AUTO_7254 ) ( not ( = ?AUTO_7248 ?AUTO_7256 ) ) ( CAN_TRAVERSE ?AUTO_7252 ?AUTO_7251 ?AUTO_7254 ) ( AT ?AUTO_7252 ?AUTO_7257 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7252 ?AUTO_7257 ?AUTO_7255 )
      ( GET_IMAGE_DATA ?AUTO_7248 ?AUTO_7249 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7248 ?AUTO_7249 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7262 - OBJECTIVE
      ?AUTO_7263 - MODE
    )
    :vars
    (
      ?AUTO_7266 - LANDER
      ?AUTO_7268 - WAYPOINT
      ?AUTO_7269 - WAYPOINT
      ?AUTO_7270 - ROVER
      ?AUTO_7264 - WAYPOINT
      ?AUTO_7267 - WAYPOINT
      ?AUTO_7271 - CAMERA
      ?AUTO_7265 - OBJECTIVE
      ?AUTO_7272 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7266 ?AUTO_7268 ) ( VISIBLE ?AUTO_7269 ?AUTO_7268 ) ( AVAILABLE ?AUTO_7270 ) ( CHANNEL_FREE ?AUTO_7266 ) ( not ( = ?AUTO_7269 ?AUTO_7268 ) ) ( CAN_TRAVERSE ?AUTO_7270 ?AUTO_7264 ?AUTO_7269 ) ( VISIBLE ?AUTO_7264 ?AUTO_7269 ) ( not ( = ?AUTO_7268 ?AUTO_7264 ) ) ( not ( = ?AUTO_7269 ?AUTO_7264 ) ) ( CAN_TRAVERSE ?AUTO_7270 ?AUTO_7267 ?AUTO_7264 ) ( VISIBLE ?AUTO_7267 ?AUTO_7264 ) ( not ( = ?AUTO_7268 ?AUTO_7267 ) ) ( not ( = ?AUTO_7269 ?AUTO_7267 ) ) ( not ( = ?AUTO_7264 ?AUTO_7267 ) ) ( ON_BOARD ?AUTO_7271 ?AUTO_7270 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7270 ) ( SUPPORTS ?AUTO_7271 ?AUTO_7263 ) ( VISIBLE_FROM ?AUTO_7262 ?AUTO_7267 ) ( CAN_TRAVERSE ?AUTO_7270 ?AUTO_7264 ?AUTO_7267 ) ( VISIBLE ?AUTO_7264 ?AUTO_7267 ) ( CAN_TRAVERSE ?AUTO_7270 ?AUTO_7269 ?AUTO_7264 ) ( VISIBLE ?AUTO_7269 ?AUTO_7264 ) ( CAN_TRAVERSE ?AUTO_7270 ?AUTO_7268 ?AUTO_7269 ) ( VISIBLE ?AUTO_7268 ?AUTO_7269 ) ( CALIBRATION_TARGET ?AUTO_7271 ?AUTO_7265 ) ( VISIBLE_FROM ?AUTO_7265 ?AUTO_7268 ) ( not ( = ?AUTO_7262 ?AUTO_7265 ) ) ( CAN_TRAVERSE ?AUTO_7270 ?AUTO_7269 ?AUTO_7268 ) ( CAN_TRAVERSE ?AUTO_7270 ?AUTO_7272 ?AUTO_7267 ) ( AT ?AUTO_7270 ?AUTO_7272 ) ( VISIBLE ?AUTO_7272 ?AUTO_7267 ) ( not ( = ?AUTO_7268 ?AUTO_7272 ) ) ( not ( = ?AUTO_7269 ?AUTO_7272 ) ) ( not ( = ?AUTO_7264 ?AUTO_7272 ) ) ( not ( = ?AUTO_7267 ?AUTO_7272 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7270 ?AUTO_7272 ?AUTO_7267 )
      ( GET_IMAGE_DATA ?AUTO_7262 ?AUTO_7263 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7262 ?AUTO_7263 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7339 - OBJECTIVE
      ?AUTO_7340 - MODE
    )
    :vars
    (
      ?AUTO_7342 - LANDER
      ?AUTO_7346 - WAYPOINT
      ?AUTO_7344 - WAYPOINT
      ?AUTO_7341 - ROVER
      ?AUTO_7343 - CAMERA
      ?AUTO_7345 - WAYPOINT
      ?AUTO_7347 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7342 ?AUTO_7346 ) ( VISIBLE ?AUTO_7344 ?AUTO_7346 ) ( AVAILABLE ?AUTO_7341 ) ( CHANNEL_FREE ?AUTO_7342 ) ( not ( = ?AUTO_7344 ?AUTO_7346 ) ) ( CAN_TRAVERSE ?AUTO_7341 ?AUTO_7346 ?AUTO_7344 ) ( VISIBLE ?AUTO_7346 ?AUTO_7344 ) ( CALIBRATED ?AUTO_7343 ?AUTO_7341 ) ( ON_BOARD ?AUTO_7343 ?AUTO_7341 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7341 ) ( SUPPORTS ?AUTO_7343 ?AUTO_7340 ) ( VISIBLE_FROM ?AUTO_7339 ?AUTO_7346 ) ( CAN_TRAVERSE ?AUTO_7341 ?AUTO_7345 ?AUTO_7346 ) ( VISIBLE ?AUTO_7345 ?AUTO_7346 ) ( not ( = ?AUTO_7346 ?AUTO_7345 ) ) ( not ( = ?AUTO_7344 ?AUTO_7345 ) ) ( CAN_TRAVERSE ?AUTO_7341 ?AUTO_7347 ?AUTO_7345 ) ( VISIBLE ?AUTO_7347 ?AUTO_7345 ) ( not ( = ?AUTO_7346 ?AUTO_7347 ) ) ( not ( = ?AUTO_7344 ?AUTO_7347 ) ) ( not ( = ?AUTO_7345 ?AUTO_7347 ) ) ( CAN_TRAVERSE ?AUTO_7341 ?AUTO_7344 ?AUTO_7347 ) ( AT ?AUTO_7341 ?AUTO_7344 ) ( VISIBLE ?AUTO_7344 ?AUTO_7347 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7341 ?AUTO_7344 ?AUTO_7347 )
      ( GET_IMAGE_DATA ?AUTO_7339 ?AUTO_7340 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7339 ?AUTO_7340 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7348 - OBJECTIVE
      ?AUTO_7349 - MODE
    )
    :vars
    (
      ?AUTO_7351 - LANDER
      ?AUTO_7353 - WAYPOINT
      ?AUTO_7350 - WAYPOINT
      ?AUTO_7355 - ROVER
      ?AUTO_7356 - CAMERA
      ?AUTO_7354 - WAYPOINT
      ?AUTO_7352 - WAYPOINT
      ?AUTO_7357 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7351 ?AUTO_7353 ) ( VISIBLE ?AUTO_7350 ?AUTO_7353 ) ( AVAILABLE ?AUTO_7355 ) ( CHANNEL_FREE ?AUTO_7351 ) ( not ( = ?AUTO_7350 ?AUTO_7353 ) ) ( CAN_TRAVERSE ?AUTO_7355 ?AUTO_7353 ?AUTO_7350 ) ( VISIBLE ?AUTO_7353 ?AUTO_7350 ) ( ON_BOARD ?AUTO_7356 ?AUTO_7355 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7355 ) ( SUPPORTS ?AUTO_7356 ?AUTO_7349 ) ( VISIBLE_FROM ?AUTO_7348 ?AUTO_7353 ) ( CAN_TRAVERSE ?AUTO_7355 ?AUTO_7354 ?AUTO_7353 ) ( VISIBLE ?AUTO_7354 ?AUTO_7353 ) ( not ( = ?AUTO_7353 ?AUTO_7354 ) ) ( not ( = ?AUTO_7350 ?AUTO_7354 ) ) ( CAN_TRAVERSE ?AUTO_7355 ?AUTO_7352 ?AUTO_7354 ) ( VISIBLE ?AUTO_7352 ?AUTO_7354 ) ( not ( = ?AUTO_7353 ?AUTO_7352 ) ) ( not ( = ?AUTO_7350 ?AUTO_7352 ) ) ( not ( = ?AUTO_7354 ?AUTO_7352 ) ) ( CAN_TRAVERSE ?AUTO_7355 ?AUTO_7350 ?AUTO_7352 ) ( AT ?AUTO_7355 ?AUTO_7350 ) ( VISIBLE ?AUTO_7350 ?AUTO_7352 ) ( CALIBRATION_TARGET ?AUTO_7356 ?AUTO_7357 ) ( VISIBLE_FROM ?AUTO_7357 ?AUTO_7350 ) ( not ( = ?AUTO_7348 ?AUTO_7357 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7355 ?AUTO_7356 ?AUTO_7357 ?AUTO_7350 )
      ( GET_IMAGE_DATA ?AUTO_7348 ?AUTO_7349 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7348 ?AUTO_7349 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7433 - OBJECTIVE
      ?AUTO_7434 - MODE
    )
    :vars
    (
      ?AUTO_7440 - LANDER
      ?AUTO_7439 - WAYPOINT
      ?AUTO_7437 - WAYPOINT
      ?AUTO_7436 - ROVER
      ?AUTO_7438 - WAYPOINT
      ?AUTO_7435 - CAMERA
      ?AUTO_7441 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7440 ?AUTO_7439 ) ( VISIBLE ?AUTO_7437 ?AUTO_7439 ) ( AVAILABLE ?AUTO_7436 ) ( CHANNEL_FREE ?AUTO_7440 ) ( not ( = ?AUTO_7437 ?AUTO_7439 ) ) ( CAN_TRAVERSE ?AUTO_7436 ?AUTO_7438 ?AUTO_7437 ) ( VISIBLE ?AUTO_7438 ?AUTO_7437 ) ( not ( = ?AUTO_7439 ?AUTO_7438 ) ) ( not ( = ?AUTO_7437 ?AUTO_7438 ) ) ( ON_BOARD ?AUTO_7435 ?AUTO_7436 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7436 ) ( SUPPORTS ?AUTO_7435 ?AUTO_7434 ) ( VISIBLE_FROM ?AUTO_7433 ?AUTO_7438 ) ( CALIBRATION_TARGET ?AUTO_7435 ?AUTO_7433 ) ( CAN_TRAVERSE ?AUTO_7436 ?AUTO_7437 ?AUTO_7438 ) ( VISIBLE ?AUTO_7437 ?AUTO_7438 ) ( CAN_TRAVERSE ?AUTO_7436 ?AUTO_7441 ?AUTO_7437 ) ( AT ?AUTO_7436 ?AUTO_7441 ) ( VISIBLE ?AUTO_7441 ?AUTO_7437 ) ( not ( = ?AUTO_7439 ?AUTO_7441 ) ) ( not ( = ?AUTO_7437 ?AUTO_7441 ) ) ( not ( = ?AUTO_7438 ?AUTO_7441 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7436 ?AUTO_7441 ?AUTO_7437 )
      ( GET_IMAGE_DATA ?AUTO_7433 ?AUTO_7434 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7433 ?AUTO_7434 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7479 - OBJECTIVE
      ?AUTO_7480 - MODE
    )
    :vars
    (
      ?AUTO_7483 - LANDER
      ?AUTO_7487 - WAYPOINT
      ?AUTO_7484 - WAYPOINT
      ?AUTO_7485 - ROVER
      ?AUTO_7482 - WAYPOINT
      ?AUTO_7481 - CAMERA
      ?AUTO_7486 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7483 ?AUTO_7487 ) ( VISIBLE ?AUTO_7484 ?AUTO_7487 ) ( AVAILABLE ?AUTO_7485 ) ( CHANNEL_FREE ?AUTO_7483 ) ( not ( = ?AUTO_7484 ?AUTO_7487 ) ) ( CAN_TRAVERSE ?AUTO_7485 ?AUTO_7482 ?AUTO_7484 ) ( VISIBLE ?AUTO_7482 ?AUTO_7484 ) ( not ( = ?AUTO_7487 ?AUTO_7482 ) ) ( not ( = ?AUTO_7484 ?AUTO_7482 ) ) ( ON_BOARD ?AUTO_7481 ?AUTO_7485 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7485 ) ( SUPPORTS ?AUTO_7481 ?AUTO_7480 ) ( VISIBLE_FROM ?AUTO_7479 ?AUTO_7482 ) ( CALIBRATION_TARGET ?AUTO_7481 ?AUTO_7486 ) ( VISIBLE_FROM ?AUTO_7486 ?AUTO_7482 ) ( not ( = ?AUTO_7479 ?AUTO_7486 ) ) ( CAN_TRAVERSE ?AUTO_7485 ?AUTO_7484 ?AUTO_7482 ) ( AT ?AUTO_7485 ?AUTO_7484 ) ( VISIBLE ?AUTO_7484 ?AUTO_7482 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7485 ?AUTO_7484 ?AUTO_7482 )
      ( GET_IMAGE_DATA ?AUTO_7479 ?AUTO_7480 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7479 ?AUTO_7480 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7496 - OBJECTIVE
      ?AUTO_7497 - MODE
    )
    :vars
    (
      ?AUTO_7500 - LANDER
      ?AUTO_7503 - WAYPOINT
      ?AUTO_7499 - WAYPOINT
      ?AUTO_7498 - ROVER
      ?AUTO_7502 - WAYPOINT
      ?AUTO_7504 - CAMERA
      ?AUTO_7501 - OBJECTIVE
      ?AUTO_7505 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7500 ?AUTO_7503 ) ( VISIBLE ?AUTO_7499 ?AUTO_7503 ) ( AVAILABLE ?AUTO_7498 ) ( CHANNEL_FREE ?AUTO_7500 ) ( not ( = ?AUTO_7499 ?AUTO_7503 ) ) ( CAN_TRAVERSE ?AUTO_7498 ?AUTO_7502 ?AUTO_7499 ) ( VISIBLE ?AUTO_7502 ?AUTO_7499 ) ( not ( = ?AUTO_7503 ?AUTO_7502 ) ) ( not ( = ?AUTO_7499 ?AUTO_7502 ) ) ( ON_BOARD ?AUTO_7504 ?AUTO_7498 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7498 ) ( SUPPORTS ?AUTO_7504 ?AUTO_7497 ) ( VISIBLE_FROM ?AUTO_7496 ?AUTO_7502 ) ( CALIBRATION_TARGET ?AUTO_7504 ?AUTO_7501 ) ( VISIBLE_FROM ?AUTO_7501 ?AUTO_7502 ) ( not ( = ?AUTO_7496 ?AUTO_7501 ) ) ( CAN_TRAVERSE ?AUTO_7498 ?AUTO_7499 ?AUTO_7502 ) ( VISIBLE ?AUTO_7499 ?AUTO_7502 ) ( CAN_TRAVERSE ?AUTO_7498 ?AUTO_7505 ?AUTO_7499 ) ( AT ?AUTO_7498 ?AUTO_7505 ) ( VISIBLE ?AUTO_7505 ?AUTO_7499 ) ( not ( = ?AUTO_7503 ?AUTO_7505 ) ) ( not ( = ?AUTO_7499 ?AUTO_7505 ) ) ( not ( = ?AUTO_7502 ?AUTO_7505 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7498 ?AUTO_7505 ?AUTO_7499 )
      ( GET_IMAGE_DATA ?AUTO_7496 ?AUTO_7497 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7496 ?AUTO_7497 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7564 - OBJECTIVE
      ?AUTO_7565 - MODE
    )
    :vars
    (
      ?AUTO_7572 - LANDER
      ?AUTO_7568 - WAYPOINT
      ?AUTO_7571 - WAYPOINT
      ?AUTO_7570 - ROVER
      ?AUTO_7567 - CAMERA
      ?AUTO_7566 - OBJECTIVE
      ?AUTO_7569 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7572 ?AUTO_7568 ) ( VISIBLE ?AUTO_7571 ?AUTO_7568 ) ( AVAILABLE ?AUTO_7570 ) ( CHANNEL_FREE ?AUTO_7572 ) ( not ( = ?AUTO_7571 ?AUTO_7568 ) ) ( ON_BOARD ?AUTO_7567 ?AUTO_7570 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7570 ) ( SUPPORTS ?AUTO_7567 ?AUTO_7565 ) ( VISIBLE_FROM ?AUTO_7564 ?AUTO_7571 ) ( CALIBRATION_TARGET ?AUTO_7567 ?AUTO_7566 ) ( VISIBLE_FROM ?AUTO_7566 ?AUTO_7571 ) ( not ( = ?AUTO_7564 ?AUTO_7566 ) ) ( CAN_TRAVERSE ?AUTO_7570 ?AUTO_7569 ?AUTO_7571 ) ( VISIBLE ?AUTO_7569 ?AUTO_7571 ) ( not ( = ?AUTO_7568 ?AUTO_7569 ) ) ( not ( = ?AUTO_7571 ?AUTO_7569 ) ) ( CAN_TRAVERSE ?AUTO_7570 ?AUTO_7568 ?AUTO_7569 ) ( AT ?AUTO_7570 ?AUTO_7568 ) ( VISIBLE ?AUTO_7568 ?AUTO_7569 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7570 ?AUTO_7568 ?AUTO_7569 )
      ( GET_IMAGE_DATA ?AUTO_7564 ?AUTO_7565 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7564 ?AUTO_7565 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7679 - OBJECTIVE
      ?AUTO_7680 - MODE
    )
    :vars
    (
      ?AUTO_7686 - LANDER
      ?AUTO_7685 - WAYPOINT
      ?AUTO_7684 - WAYPOINT
      ?AUTO_7682 - ROVER
      ?AUTO_7683 - CAMERA
      ?AUTO_7681 - WAYPOINT
      ?AUTO_7687 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7686 ?AUTO_7685 ) ( VISIBLE ?AUTO_7684 ?AUTO_7685 ) ( AVAILABLE ?AUTO_7682 ) ( CHANNEL_FREE ?AUTO_7686 ) ( not ( = ?AUTO_7684 ?AUTO_7685 ) ) ( CAN_TRAVERSE ?AUTO_7682 ?AUTO_7685 ?AUTO_7684 ) ( VISIBLE ?AUTO_7685 ?AUTO_7684 ) ( ON_BOARD ?AUTO_7683 ?AUTO_7682 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7682 ) ( SUPPORTS ?AUTO_7683 ?AUTO_7680 ) ( VISIBLE_FROM ?AUTO_7679 ?AUTO_7685 ) ( CAN_TRAVERSE ?AUTO_7682 ?AUTO_7684 ?AUTO_7685 ) ( CAN_TRAVERSE ?AUTO_7682 ?AUTO_7681 ?AUTO_7684 ) ( AT ?AUTO_7682 ?AUTO_7681 ) ( VISIBLE ?AUTO_7681 ?AUTO_7684 ) ( not ( = ?AUTO_7685 ?AUTO_7681 ) ) ( not ( = ?AUTO_7684 ?AUTO_7681 ) ) ( CALIBRATION_TARGET ?AUTO_7683 ?AUTO_7687 ) ( VISIBLE_FROM ?AUTO_7687 ?AUTO_7681 ) ( not ( = ?AUTO_7679 ?AUTO_7687 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7682 ?AUTO_7683 ?AUTO_7687 ?AUTO_7681 )
      ( GET_IMAGE_DATA ?AUTO_7679 ?AUTO_7680 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7679 ?AUTO_7680 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7690 - OBJECTIVE
      ?AUTO_7691 - MODE
    )
    :vars
    (
      ?AUTO_7694 - LANDER
      ?AUTO_7696 - WAYPOINT
      ?AUTO_7693 - WAYPOINT
      ?AUTO_7698 - ROVER
      ?AUTO_7695 - CAMERA
      ?AUTO_7692 - WAYPOINT
      ?AUTO_7697 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7694 ?AUTO_7696 ) ( VISIBLE ?AUTO_7693 ?AUTO_7696 ) ( AVAILABLE ?AUTO_7698 ) ( CHANNEL_FREE ?AUTO_7694 ) ( not ( = ?AUTO_7693 ?AUTO_7696 ) ) ( CAN_TRAVERSE ?AUTO_7698 ?AUTO_7696 ?AUTO_7693 ) ( VISIBLE ?AUTO_7696 ?AUTO_7693 ) ( ON_BOARD ?AUTO_7695 ?AUTO_7698 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7698 ) ( SUPPORTS ?AUTO_7695 ?AUTO_7691 ) ( VISIBLE_FROM ?AUTO_7690 ?AUTO_7696 ) ( CAN_TRAVERSE ?AUTO_7698 ?AUTO_7693 ?AUTO_7696 ) ( CAN_TRAVERSE ?AUTO_7698 ?AUTO_7692 ?AUTO_7693 ) ( VISIBLE ?AUTO_7692 ?AUTO_7693 ) ( not ( = ?AUTO_7696 ?AUTO_7692 ) ) ( not ( = ?AUTO_7693 ?AUTO_7692 ) ) ( CALIBRATION_TARGET ?AUTO_7695 ?AUTO_7697 ) ( VISIBLE_FROM ?AUTO_7697 ?AUTO_7692 ) ( not ( = ?AUTO_7690 ?AUTO_7697 ) ) ( CAN_TRAVERSE ?AUTO_7698 ?AUTO_7693 ?AUTO_7692 ) ( AT ?AUTO_7698 ?AUTO_7693 ) ( VISIBLE ?AUTO_7693 ?AUTO_7692 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7698 ?AUTO_7693 ?AUTO_7692 )
      ( GET_IMAGE_DATA ?AUTO_7690 ?AUTO_7691 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7690 ?AUTO_7691 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7701 - OBJECTIVE
      ?AUTO_7702 - MODE
    )
    :vars
    (
      ?AUTO_7709 - LANDER
      ?AUTO_7704 - WAYPOINT
      ?AUTO_7703 - WAYPOINT
      ?AUTO_7708 - ROVER
      ?AUTO_7706 - CAMERA
      ?AUTO_7705 - WAYPOINT
      ?AUTO_7707 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7709 ?AUTO_7704 ) ( VISIBLE ?AUTO_7703 ?AUTO_7704 ) ( AVAILABLE ?AUTO_7708 ) ( CHANNEL_FREE ?AUTO_7709 ) ( not ( = ?AUTO_7703 ?AUTO_7704 ) ) ( CAN_TRAVERSE ?AUTO_7708 ?AUTO_7704 ?AUTO_7703 ) ( VISIBLE ?AUTO_7704 ?AUTO_7703 ) ( ON_BOARD ?AUTO_7706 ?AUTO_7708 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7708 ) ( SUPPORTS ?AUTO_7706 ?AUTO_7702 ) ( VISIBLE_FROM ?AUTO_7701 ?AUTO_7704 ) ( CAN_TRAVERSE ?AUTO_7708 ?AUTO_7703 ?AUTO_7704 ) ( CAN_TRAVERSE ?AUTO_7708 ?AUTO_7705 ?AUTO_7703 ) ( VISIBLE ?AUTO_7705 ?AUTO_7703 ) ( not ( = ?AUTO_7704 ?AUTO_7705 ) ) ( not ( = ?AUTO_7703 ?AUTO_7705 ) ) ( CALIBRATION_TARGET ?AUTO_7706 ?AUTO_7707 ) ( VISIBLE_FROM ?AUTO_7707 ?AUTO_7705 ) ( not ( = ?AUTO_7701 ?AUTO_7707 ) ) ( CAN_TRAVERSE ?AUTO_7708 ?AUTO_7703 ?AUTO_7705 ) ( VISIBLE ?AUTO_7703 ?AUTO_7705 ) ( AT ?AUTO_7708 ?AUTO_7704 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7708 ?AUTO_7704 ?AUTO_7703 )
      ( GET_IMAGE_DATA ?AUTO_7701 ?AUTO_7702 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7701 ?AUTO_7702 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7772 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7777 - LANDER
      ?AUTO_7773 - WAYPOINT
      ?AUTO_7775 - ROVER
      ?AUTO_7774 - STORE
      ?AUTO_7776 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7777 ?AUTO_7773 ) ( VISIBLE ?AUTO_7772 ?AUTO_7773 ) ( AVAILABLE ?AUTO_7775 ) ( CHANNEL_FREE ?AUTO_7777 ) ( not ( = ?AUTO_7772 ?AUTO_7773 ) ) ( AT_SOIL_SAMPLE ?AUTO_7772 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7775 ) ( STORE_OF ?AUTO_7774 ?AUTO_7775 ) ( FULL ?AUTO_7774 ) ( CAN_TRAVERSE ?AUTO_7775 ?AUTO_7776 ?AUTO_7772 ) ( VISIBLE ?AUTO_7776 ?AUTO_7772 ) ( not ( = ?AUTO_7772 ?AUTO_7776 ) ) ( not ( = ?AUTO_7773 ?AUTO_7776 ) ) ( CAN_TRAVERSE ?AUTO_7775 ?AUTO_7773 ?AUTO_7776 ) ( AT ?AUTO_7775 ?AUTO_7773 ) ( VISIBLE ?AUTO_7773 ?AUTO_7776 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7775 ?AUTO_7773 ?AUTO_7776 )
      ( GET_SOIL_DATA ?AUTO_7772 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7772 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7791 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7794 - LANDER
      ?AUTO_7796 - WAYPOINT
      ?AUTO_7793 - ROVER
      ?AUTO_7792 - STORE
      ?AUTO_7795 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7794 ?AUTO_7796 ) ( VISIBLE ?AUTO_7791 ?AUTO_7796 ) ( AVAILABLE ?AUTO_7793 ) ( CHANNEL_FREE ?AUTO_7794 ) ( not ( = ?AUTO_7791 ?AUTO_7796 ) ) ( AT_SOIL_SAMPLE ?AUTO_7791 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7793 ) ( STORE_OF ?AUTO_7792 ?AUTO_7793 ) ( CAN_TRAVERSE ?AUTO_7793 ?AUTO_7795 ?AUTO_7791 ) ( VISIBLE ?AUTO_7795 ?AUTO_7791 ) ( not ( = ?AUTO_7791 ?AUTO_7795 ) ) ( not ( = ?AUTO_7796 ?AUTO_7795 ) ) ( CAN_TRAVERSE ?AUTO_7793 ?AUTO_7796 ?AUTO_7795 ) ( AT ?AUTO_7793 ?AUTO_7796 ) ( VISIBLE ?AUTO_7796 ?AUTO_7795 ) ( AT_SOIL_SAMPLE ?AUTO_7796 ) ( EMPTY ?AUTO_7792 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_7793 ?AUTO_7792 ?AUTO_7796 )
      ( GET_SOIL_DATA ?AUTO_7791 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7791 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7797 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7802 - LANDER
      ?AUTO_7801 - WAYPOINT
      ?AUTO_7798 - ROVER
      ?AUTO_7799 - STORE
      ?AUTO_7800 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7802 ?AUTO_7801 ) ( VISIBLE ?AUTO_7797 ?AUTO_7801 ) ( AVAILABLE ?AUTO_7798 ) ( CHANNEL_FREE ?AUTO_7802 ) ( not ( = ?AUTO_7797 ?AUTO_7801 ) ) ( AT_SOIL_SAMPLE ?AUTO_7797 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7798 ) ( STORE_OF ?AUTO_7799 ?AUTO_7798 ) ( CAN_TRAVERSE ?AUTO_7798 ?AUTO_7800 ?AUTO_7797 ) ( VISIBLE ?AUTO_7800 ?AUTO_7797 ) ( not ( = ?AUTO_7797 ?AUTO_7800 ) ) ( not ( = ?AUTO_7801 ?AUTO_7800 ) ) ( CAN_TRAVERSE ?AUTO_7798 ?AUTO_7801 ?AUTO_7800 ) ( VISIBLE ?AUTO_7801 ?AUTO_7800 ) ( AT_SOIL_SAMPLE ?AUTO_7801 ) ( EMPTY ?AUTO_7799 ) ( CAN_TRAVERSE ?AUTO_7798 ?AUTO_7800 ?AUTO_7801 ) ( AT ?AUTO_7798 ?AUTO_7800 ) ( VISIBLE ?AUTO_7800 ?AUTO_7801 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7798 ?AUTO_7800 ?AUTO_7801 )
      ( GET_SOIL_DATA ?AUTO_7797 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7797 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7842 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7847 - LANDER
      ?AUTO_7848 - WAYPOINT
      ?AUTO_7846 - WAYPOINT
      ?AUTO_7844 - ROVER
      ?AUTO_7845 - STORE
      ?AUTO_7843 - WAYPOINT
      ?AUTO_7849 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7847 ?AUTO_7848 ) ( VISIBLE ?AUTO_7846 ?AUTO_7848 ) ( AVAILABLE ?AUTO_7844 ) ( CHANNEL_FREE ?AUTO_7847 ) ( not ( = ?AUTO_7842 ?AUTO_7846 ) ) ( not ( = ?AUTO_7842 ?AUTO_7848 ) ) ( not ( = ?AUTO_7846 ?AUTO_7848 ) ) ( CAN_TRAVERSE ?AUTO_7844 ?AUTO_7842 ?AUTO_7846 ) ( VISIBLE ?AUTO_7842 ?AUTO_7846 ) ( AT_ROCK_SAMPLE ?AUTO_7842 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7844 ) ( STORE_OF ?AUTO_7845 ?AUTO_7844 ) ( EMPTY ?AUTO_7845 ) ( CAN_TRAVERSE ?AUTO_7844 ?AUTO_7843 ?AUTO_7842 ) ( VISIBLE ?AUTO_7843 ?AUTO_7842 ) ( not ( = ?AUTO_7842 ?AUTO_7843 ) ) ( not ( = ?AUTO_7848 ?AUTO_7843 ) ) ( not ( = ?AUTO_7846 ?AUTO_7843 ) ) ( CAN_TRAVERSE ?AUTO_7844 ?AUTO_7849 ?AUTO_7843 ) ( VISIBLE ?AUTO_7849 ?AUTO_7843 ) ( not ( = ?AUTO_7842 ?AUTO_7849 ) ) ( not ( = ?AUTO_7848 ?AUTO_7849 ) ) ( not ( = ?AUTO_7846 ?AUTO_7849 ) ) ( not ( = ?AUTO_7843 ?AUTO_7849 ) ) ( CAN_TRAVERSE ?AUTO_7844 ?AUTO_7846 ?AUTO_7849 ) ( AT ?AUTO_7844 ?AUTO_7846 ) ( VISIBLE ?AUTO_7846 ?AUTO_7849 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7844 ?AUTO_7846 ?AUTO_7849 )
      ( GET_ROCK_DATA ?AUTO_7842 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7842 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7921 - OBJECTIVE
      ?AUTO_7922 - MODE
    )
    :vars
    (
      ?AUTO_7927 - LANDER
      ?AUTO_7929 - WAYPOINT
      ?AUTO_7928 - WAYPOINT
      ?AUTO_7925 - ROVER
      ?AUTO_7930 - WAYPOINT
      ?AUTO_7926 - WAYPOINT
      ?AUTO_7924 - CAMERA
      ?AUTO_7923 - OBJECTIVE
      ?AUTO_7931 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7927 ?AUTO_7929 ) ( VISIBLE ?AUTO_7928 ?AUTO_7929 ) ( AVAILABLE ?AUTO_7925 ) ( CHANNEL_FREE ?AUTO_7927 ) ( not ( = ?AUTO_7928 ?AUTO_7929 ) ) ( CAN_TRAVERSE ?AUTO_7925 ?AUTO_7930 ?AUTO_7928 ) ( VISIBLE ?AUTO_7930 ?AUTO_7928 ) ( not ( = ?AUTO_7929 ?AUTO_7930 ) ) ( not ( = ?AUTO_7928 ?AUTO_7930 ) ) ( CAN_TRAVERSE ?AUTO_7925 ?AUTO_7926 ?AUTO_7930 ) ( VISIBLE ?AUTO_7926 ?AUTO_7930 ) ( not ( = ?AUTO_7929 ?AUTO_7926 ) ) ( not ( = ?AUTO_7928 ?AUTO_7926 ) ) ( not ( = ?AUTO_7930 ?AUTO_7926 ) ) ( ON_BOARD ?AUTO_7924 ?AUTO_7925 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7925 ) ( SUPPORTS ?AUTO_7924 ?AUTO_7922 ) ( VISIBLE_FROM ?AUTO_7921 ?AUTO_7926 ) ( CAN_TRAVERSE ?AUTO_7925 ?AUTO_7930 ?AUTO_7926 ) ( VISIBLE ?AUTO_7930 ?AUTO_7926 ) ( CALIBRATION_TARGET ?AUTO_7924 ?AUTO_7923 ) ( VISIBLE_FROM ?AUTO_7923 ?AUTO_7930 ) ( not ( = ?AUTO_7921 ?AUTO_7923 ) ) ( CAN_TRAVERSE ?AUTO_7925 ?AUTO_7931 ?AUTO_7926 ) ( AT ?AUTO_7925 ?AUTO_7931 ) ( VISIBLE ?AUTO_7931 ?AUTO_7926 ) ( not ( = ?AUTO_7929 ?AUTO_7931 ) ) ( not ( = ?AUTO_7928 ?AUTO_7931 ) ) ( not ( = ?AUTO_7930 ?AUTO_7931 ) ) ( not ( = ?AUTO_7926 ?AUTO_7931 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7925 ?AUTO_7931 ?AUTO_7926 )
      ( GET_IMAGE_DATA ?AUTO_7921 ?AUTO_7922 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7921 ?AUTO_7922 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7932 - OBJECTIVE
      ?AUTO_7933 - MODE
    )
    :vars
    (
      ?AUTO_7937 - LANDER
      ?AUTO_7938 - WAYPOINT
      ?AUTO_7940 - WAYPOINT
      ?AUTO_7936 - ROVER
      ?AUTO_7935 - WAYPOINT
      ?AUTO_7942 - WAYPOINT
      ?AUTO_7934 - CAMERA
      ?AUTO_7941 - OBJECTIVE
      ?AUTO_7939 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7937 ?AUTO_7938 ) ( VISIBLE ?AUTO_7940 ?AUTO_7938 ) ( AVAILABLE ?AUTO_7936 ) ( CHANNEL_FREE ?AUTO_7937 ) ( not ( = ?AUTO_7940 ?AUTO_7938 ) ) ( CAN_TRAVERSE ?AUTO_7936 ?AUTO_7935 ?AUTO_7940 ) ( VISIBLE ?AUTO_7935 ?AUTO_7940 ) ( not ( = ?AUTO_7938 ?AUTO_7935 ) ) ( not ( = ?AUTO_7940 ?AUTO_7935 ) ) ( CAN_TRAVERSE ?AUTO_7936 ?AUTO_7942 ?AUTO_7935 ) ( VISIBLE ?AUTO_7942 ?AUTO_7935 ) ( not ( = ?AUTO_7938 ?AUTO_7942 ) ) ( not ( = ?AUTO_7940 ?AUTO_7942 ) ) ( not ( = ?AUTO_7935 ?AUTO_7942 ) ) ( ON_BOARD ?AUTO_7934 ?AUTO_7936 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7936 ) ( SUPPORTS ?AUTO_7934 ?AUTO_7933 ) ( VISIBLE_FROM ?AUTO_7932 ?AUTO_7942 ) ( CAN_TRAVERSE ?AUTO_7936 ?AUTO_7935 ?AUTO_7942 ) ( VISIBLE ?AUTO_7935 ?AUTO_7942 ) ( CALIBRATION_TARGET ?AUTO_7934 ?AUTO_7941 ) ( VISIBLE_FROM ?AUTO_7941 ?AUTO_7935 ) ( not ( = ?AUTO_7932 ?AUTO_7941 ) ) ( CAN_TRAVERSE ?AUTO_7936 ?AUTO_7939 ?AUTO_7942 ) ( VISIBLE ?AUTO_7939 ?AUTO_7942 ) ( not ( = ?AUTO_7938 ?AUTO_7939 ) ) ( not ( = ?AUTO_7940 ?AUTO_7939 ) ) ( not ( = ?AUTO_7935 ?AUTO_7939 ) ) ( not ( = ?AUTO_7942 ?AUTO_7939 ) ) ( CAN_TRAVERSE ?AUTO_7936 ?AUTO_7940 ?AUTO_7939 ) ( AT ?AUTO_7936 ?AUTO_7940 ) ( VISIBLE ?AUTO_7940 ?AUTO_7939 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7936 ?AUTO_7940 ?AUTO_7939 )
      ( GET_IMAGE_DATA ?AUTO_7932 ?AUTO_7933 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7932 ?AUTO_7933 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7994 - OBJECTIVE
      ?AUTO_7995 - MODE
    )
    :vars
    (
      ?AUTO_8000 - LANDER
      ?AUTO_7998 - WAYPOINT
      ?AUTO_7999 - WAYPOINT
      ?AUTO_8001 - ROVER
      ?AUTO_7996 - WAYPOINT
      ?AUTO_7997 - CAMERA
      ?AUTO_8002 - WAYPOINT
      ?AUTO_8003 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8000 ?AUTO_7998 ) ( VISIBLE ?AUTO_7999 ?AUTO_7998 ) ( AVAILABLE ?AUTO_8001 ) ( CHANNEL_FREE ?AUTO_8000 ) ( not ( = ?AUTO_7999 ?AUTO_7998 ) ) ( CAN_TRAVERSE ?AUTO_8001 ?AUTO_7996 ?AUTO_7999 ) ( VISIBLE ?AUTO_7996 ?AUTO_7999 ) ( not ( = ?AUTO_7998 ?AUTO_7996 ) ) ( not ( = ?AUTO_7999 ?AUTO_7996 ) ) ( ON_BOARD ?AUTO_7997 ?AUTO_8001 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8001 ) ( SUPPORTS ?AUTO_7997 ?AUTO_7995 ) ( VISIBLE_FROM ?AUTO_7994 ?AUTO_7996 ) ( CALIBRATION_TARGET ?AUTO_7997 ?AUTO_7994 ) ( CAN_TRAVERSE ?AUTO_8001 ?AUTO_8002 ?AUTO_7996 ) ( VISIBLE ?AUTO_8002 ?AUTO_7996 ) ( not ( = ?AUTO_7998 ?AUTO_8002 ) ) ( not ( = ?AUTO_7999 ?AUTO_8002 ) ) ( not ( = ?AUTO_7996 ?AUTO_8002 ) ) ( CAN_TRAVERSE ?AUTO_8001 ?AUTO_8003 ?AUTO_8002 ) ( AT ?AUTO_8001 ?AUTO_8003 ) ( VISIBLE ?AUTO_8003 ?AUTO_8002 ) ( not ( = ?AUTO_7998 ?AUTO_8003 ) ) ( not ( = ?AUTO_7999 ?AUTO_8003 ) ) ( not ( = ?AUTO_7996 ?AUTO_8003 ) ) ( not ( = ?AUTO_8002 ?AUTO_8003 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8001 ?AUTO_8003 ?AUTO_8002 )
      ( GET_IMAGE_DATA ?AUTO_7994 ?AUTO_7995 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7994 ?AUTO_7995 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8004 - OBJECTIVE
      ?AUTO_8005 - MODE
    )
    :vars
    (
      ?AUTO_8008 - LANDER
      ?AUTO_8009 - WAYPOINT
      ?AUTO_8010 - WAYPOINT
      ?AUTO_8011 - ROVER
      ?AUTO_8013 - WAYPOINT
      ?AUTO_8012 - CAMERA
      ?AUTO_8007 - WAYPOINT
      ?AUTO_8006 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8008 ?AUTO_8009 ) ( VISIBLE ?AUTO_8010 ?AUTO_8009 ) ( AVAILABLE ?AUTO_8011 ) ( CHANNEL_FREE ?AUTO_8008 ) ( not ( = ?AUTO_8010 ?AUTO_8009 ) ) ( CAN_TRAVERSE ?AUTO_8011 ?AUTO_8013 ?AUTO_8010 ) ( VISIBLE ?AUTO_8013 ?AUTO_8010 ) ( not ( = ?AUTO_8009 ?AUTO_8013 ) ) ( not ( = ?AUTO_8010 ?AUTO_8013 ) ) ( ON_BOARD ?AUTO_8012 ?AUTO_8011 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8011 ) ( SUPPORTS ?AUTO_8012 ?AUTO_8005 ) ( VISIBLE_FROM ?AUTO_8004 ?AUTO_8013 ) ( CALIBRATION_TARGET ?AUTO_8012 ?AUTO_8004 ) ( CAN_TRAVERSE ?AUTO_8011 ?AUTO_8007 ?AUTO_8013 ) ( VISIBLE ?AUTO_8007 ?AUTO_8013 ) ( not ( = ?AUTO_8009 ?AUTO_8007 ) ) ( not ( = ?AUTO_8010 ?AUTO_8007 ) ) ( not ( = ?AUTO_8013 ?AUTO_8007 ) ) ( CAN_TRAVERSE ?AUTO_8011 ?AUTO_8006 ?AUTO_8007 ) ( VISIBLE ?AUTO_8006 ?AUTO_8007 ) ( not ( = ?AUTO_8009 ?AUTO_8006 ) ) ( not ( = ?AUTO_8010 ?AUTO_8006 ) ) ( not ( = ?AUTO_8013 ?AUTO_8006 ) ) ( not ( = ?AUTO_8007 ?AUTO_8006 ) ) ( CAN_TRAVERSE ?AUTO_8011 ?AUTO_8010 ?AUTO_8006 ) ( AT ?AUTO_8011 ?AUTO_8010 ) ( VISIBLE ?AUTO_8010 ?AUTO_8006 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8011 ?AUTO_8010 ?AUTO_8006 )
      ( GET_IMAGE_DATA ?AUTO_8004 ?AUTO_8005 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8004 ?AUTO_8005 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8149 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8153 - LANDER
      ?AUTO_8152 - WAYPOINT
      ?AUTO_8151 - ROVER
      ?AUTO_8150 - STORE
      ?AUTO_8154 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8153 ?AUTO_8149 ) ( VISIBLE ?AUTO_8152 ?AUTO_8149 ) ( AVAILABLE ?AUTO_8151 ) ( CHANNEL_FREE ?AUTO_8153 ) ( not ( = ?AUTO_8149 ?AUTO_8152 ) ) ( CAN_TRAVERSE ?AUTO_8151 ?AUTO_8149 ?AUTO_8152 ) ( VISIBLE ?AUTO_8149 ?AUTO_8152 ) ( AT_ROCK_SAMPLE ?AUTO_8149 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8151 ) ( STORE_OF ?AUTO_8150 ?AUTO_8151 ) ( EMPTY ?AUTO_8150 ) ( CAN_TRAVERSE ?AUTO_8151 ?AUTO_8152 ?AUTO_8149 ) ( CAN_TRAVERSE ?AUTO_8151 ?AUTO_8154 ?AUTO_8152 ) ( AT ?AUTO_8151 ?AUTO_8154 ) ( VISIBLE ?AUTO_8154 ?AUTO_8152 ) ( not ( = ?AUTO_8149 ?AUTO_8154 ) ) ( not ( = ?AUTO_8152 ?AUTO_8154 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8151 ?AUTO_8154 ?AUTO_8152 )
      ( GET_ROCK_DATA ?AUTO_8149 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8149 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8155 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8159 - LANDER
      ?AUTO_8156 - WAYPOINT
      ?AUTO_8157 - ROVER
      ?AUTO_8160 - STORE
      ?AUTO_8158 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8159 ?AUTO_8155 ) ( VISIBLE ?AUTO_8156 ?AUTO_8155 ) ( AVAILABLE ?AUTO_8157 ) ( CHANNEL_FREE ?AUTO_8159 ) ( not ( = ?AUTO_8155 ?AUTO_8156 ) ) ( CAN_TRAVERSE ?AUTO_8157 ?AUTO_8155 ?AUTO_8156 ) ( VISIBLE ?AUTO_8155 ?AUTO_8156 ) ( AT_ROCK_SAMPLE ?AUTO_8155 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8157 ) ( STORE_OF ?AUTO_8160 ?AUTO_8157 ) ( CAN_TRAVERSE ?AUTO_8157 ?AUTO_8156 ?AUTO_8155 ) ( CAN_TRAVERSE ?AUTO_8157 ?AUTO_8158 ?AUTO_8156 ) ( AT ?AUTO_8157 ?AUTO_8158 ) ( VISIBLE ?AUTO_8158 ?AUTO_8156 ) ( not ( = ?AUTO_8155 ?AUTO_8158 ) ) ( not ( = ?AUTO_8156 ?AUTO_8158 ) ) ( FULL ?AUTO_8160 ) )
    :subtasks
    ( ( !DROP ?AUTO_8157 ?AUTO_8160 )
      ( GET_ROCK_DATA ?AUTO_8155 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8155 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8162 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8167 - LANDER
      ?AUTO_8165 - WAYPOINT
      ?AUTO_8166 - ROVER
      ?AUTO_8164 - STORE
      ?AUTO_8163 - WAYPOINT
      ?AUTO_8168 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8167 ?AUTO_8162 ) ( VISIBLE ?AUTO_8165 ?AUTO_8162 ) ( AVAILABLE ?AUTO_8166 ) ( CHANNEL_FREE ?AUTO_8167 ) ( not ( = ?AUTO_8162 ?AUTO_8165 ) ) ( CAN_TRAVERSE ?AUTO_8166 ?AUTO_8162 ?AUTO_8165 ) ( VISIBLE ?AUTO_8162 ?AUTO_8165 ) ( AT_ROCK_SAMPLE ?AUTO_8162 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8166 ) ( STORE_OF ?AUTO_8164 ?AUTO_8166 ) ( EMPTY ?AUTO_8164 ) ( CAN_TRAVERSE ?AUTO_8166 ?AUTO_8165 ?AUTO_8162 ) ( CAN_TRAVERSE ?AUTO_8166 ?AUTO_8163 ?AUTO_8165 ) ( VISIBLE ?AUTO_8163 ?AUTO_8165 ) ( not ( = ?AUTO_8162 ?AUTO_8163 ) ) ( not ( = ?AUTO_8165 ?AUTO_8163 ) ) ( CAN_TRAVERSE ?AUTO_8166 ?AUTO_8168 ?AUTO_8163 ) ( AT ?AUTO_8166 ?AUTO_8168 ) ( VISIBLE ?AUTO_8168 ?AUTO_8163 ) ( not ( = ?AUTO_8162 ?AUTO_8168 ) ) ( not ( = ?AUTO_8165 ?AUTO_8168 ) ) ( not ( = ?AUTO_8163 ?AUTO_8168 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8166 ?AUTO_8168 ?AUTO_8163 )
      ( GET_ROCK_DATA ?AUTO_8162 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8162 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8175 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8181 - LANDER
      ?AUTO_8176 - WAYPOINT
      ?AUTO_8177 - ROVER
      ?AUTO_8180 - STORE
      ?AUTO_8179 - WAYPOINT
      ?AUTO_8178 - WAYPOINT
      ?AUTO_8182 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8181 ?AUTO_8175 ) ( VISIBLE ?AUTO_8176 ?AUTO_8175 ) ( AVAILABLE ?AUTO_8177 ) ( CHANNEL_FREE ?AUTO_8181 ) ( not ( = ?AUTO_8175 ?AUTO_8176 ) ) ( CAN_TRAVERSE ?AUTO_8177 ?AUTO_8175 ?AUTO_8176 ) ( VISIBLE ?AUTO_8175 ?AUTO_8176 ) ( AT_ROCK_SAMPLE ?AUTO_8175 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8177 ) ( STORE_OF ?AUTO_8180 ?AUTO_8177 ) ( EMPTY ?AUTO_8180 ) ( CAN_TRAVERSE ?AUTO_8177 ?AUTO_8176 ?AUTO_8175 ) ( CAN_TRAVERSE ?AUTO_8177 ?AUTO_8179 ?AUTO_8176 ) ( VISIBLE ?AUTO_8179 ?AUTO_8176 ) ( not ( = ?AUTO_8175 ?AUTO_8179 ) ) ( not ( = ?AUTO_8176 ?AUTO_8179 ) ) ( CAN_TRAVERSE ?AUTO_8177 ?AUTO_8178 ?AUTO_8179 ) ( VISIBLE ?AUTO_8178 ?AUTO_8179 ) ( not ( = ?AUTO_8175 ?AUTO_8178 ) ) ( not ( = ?AUTO_8176 ?AUTO_8178 ) ) ( not ( = ?AUTO_8179 ?AUTO_8178 ) ) ( CAN_TRAVERSE ?AUTO_8177 ?AUTO_8182 ?AUTO_8178 ) ( AT ?AUTO_8177 ?AUTO_8182 ) ( VISIBLE ?AUTO_8182 ?AUTO_8178 ) ( not ( = ?AUTO_8175 ?AUTO_8182 ) ) ( not ( = ?AUTO_8176 ?AUTO_8182 ) ) ( not ( = ?AUTO_8179 ?AUTO_8182 ) ) ( not ( = ?AUTO_8178 ?AUTO_8182 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8177 ?AUTO_8182 ?AUTO_8178 )
      ( GET_ROCK_DATA ?AUTO_8175 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8175 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8243 - OBJECTIVE
      ?AUTO_8244 - MODE
    )
    :vars
    (
      ?AUTO_8248 - LANDER
      ?AUTO_8251 - WAYPOINT
      ?AUTO_8247 - WAYPOINT
      ?AUTO_8246 - ROVER
      ?AUTO_8250 - WAYPOINT
      ?AUTO_8249 - CAMERA
      ?AUTO_8245 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8248 ?AUTO_8251 ) ( VISIBLE ?AUTO_8247 ?AUTO_8251 ) ( AVAILABLE ?AUTO_8246 ) ( CHANNEL_FREE ?AUTO_8248 ) ( not ( = ?AUTO_8247 ?AUTO_8251 ) ) ( CAN_TRAVERSE ?AUTO_8246 ?AUTO_8250 ?AUTO_8247 ) ( VISIBLE ?AUTO_8250 ?AUTO_8247 ) ( not ( = ?AUTO_8251 ?AUTO_8250 ) ) ( not ( = ?AUTO_8247 ?AUTO_8250 ) ) ( ON_BOARD ?AUTO_8249 ?AUTO_8246 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8246 ) ( SUPPORTS ?AUTO_8249 ?AUTO_8244 ) ( VISIBLE_FROM ?AUTO_8243 ?AUTO_8250 ) ( CALIBRATION_TARGET ?AUTO_8249 ?AUTO_8245 ) ( VISIBLE_FROM ?AUTO_8245 ?AUTO_8250 ) ( not ( = ?AUTO_8243 ?AUTO_8245 ) ) ( CAN_TRAVERSE ?AUTO_8246 ?AUTO_8247 ?AUTO_8250 ) ( VISIBLE ?AUTO_8247 ?AUTO_8250 ) ( CAN_TRAVERSE ?AUTO_8246 ?AUTO_8251 ?AUTO_8247 ) ( AT ?AUTO_8246 ?AUTO_8251 ) ( VISIBLE ?AUTO_8251 ?AUTO_8247 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8246 ?AUTO_8251 ?AUTO_8247 )
      ( GET_IMAGE_DATA ?AUTO_8243 ?AUTO_8244 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8243 ?AUTO_8244 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8454 - OBJECTIVE
      ?AUTO_8455 - MODE
    )
    :vars
    (
      ?AUTO_8458 - LANDER
      ?AUTO_8460 - WAYPOINT
      ?AUTO_8462 - WAYPOINT
      ?AUTO_8461 - ROVER
      ?AUTO_8457 - CAMERA
      ?AUTO_8463 - WAYPOINT
      ?AUTO_8459 - WAYPOINT
      ?AUTO_8456 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8458 ?AUTO_8460 ) ( VISIBLE ?AUTO_8462 ?AUTO_8460 ) ( AVAILABLE ?AUTO_8461 ) ( CHANNEL_FREE ?AUTO_8458 ) ( not ( = ?AUTO_8462 ?AUTO_8460 ) ) ( ON_BOARD ?AUTO_8457 ?AUTO_8461 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8461 ) ( SUPPORTS ?AUTO_8457 ?AUTO_8455 ) ( VISIBLE_FROM ?AUTO_8454 ?AUTO_8462 ) ( CAN_TRAVERSE ?AUTO_8461 ?AUTO_8463 ?AUTO_8462 ) ( VISIBLE ?AUTO_8463 ?AUTO_8462 ) ( not ( = ?AUTO_8460 ?AUTO_8463 ) ) ( not ( = ?AUTO_8462 ?AUTO_8463 ) ) ( CAN_TRAVERSE ?AUTO_8461 ?AUTO_8459 ?AUTO_8463 ) ( VISIBLE ?AUTO_8459 ?AUTO_8463 ) ( not ( = ?AUTO_8460 ?AUTO_8459 ) ) ( not ( = ?AUTO_8462 ?AUTO_8459 ) ) ( not ( = ?AUTO_8463 ?AUTO_8459 ) ) ( CALIBRATION_TARGET ?AUTO_8457 ?AUTO_8456 ) ( VISIBLE_FROM ?AUTO_8456 ?AUTO_8459 ) ( not ( = ?AUTO_8454 ?AUTO_8456 ) ) ( CAN_TRAVERSE ?AUTO_8461 ?AUTO_8463 ?AUTO_8459 ) ( AT ?AUTO_8461 ?AUTO_8463 ) ( VISIBLE ?AUTO_8463 ?AUTO_8459 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8461 ?AUTO_8463 ?AUTO_8459 )
      ( GET_IMAGE_DATA ?AUTO_8454 ?AUTO_8455 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8454 ?AUTO_8455 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8466 - OBJECTIVE
      ?AUTO_8467 - MODE
    )
    :vars
    (
      ?AUTO_8470 - LANDER
      ?AUTO_8475 - WAYPOINT
      ?AUTO_8471 - WAYPOINT
      ?AUTO_8468 - ROVER
      ?AUTO_8474 - CAMERA
      ?AUTO_8473 - WAYPOINT
      ?AUTO_8472 - WAYPOINT
      ?AUTO_8469 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8470 ?AUTO_8475 ) ( VISIBLE ?AUTO_8471 ?AUTO_8475 ) ( AVAILABLE ?AUTO_8468 ) ( CHANNEL_FREE ?AUTO_8470 ) ( not ( = ?AUTO_8471 ?AUTO_8475 ) ) ( ON_BOARD ?AUTO_8474 ?AUTO_8468 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8468 ) ( SUPPORTS ?AUTO_8474 ?AUTO_8467 ) ( VISIBLE_FROM ?AUTO_8466 ?AUTO_8471 ) ( CAN_TRAVERSE ?AUTO_8468 ?AUTO_8473 ?AUTO_8471 ) ( VISIBLE ?AUTO_8473 ?AUTO_8471 ) ( not ( = ?AUTO_8475 ?AUTO_8473 ) ) ( not ( = ?AUTO_8471 ?AUTO_8473 ) ) ( CAN_TRAVERSE ?AUTO_8468 ?AUTO_8472 ?AUTO_8473 ) ( VISIBLE ?AUTO_8472 ?AUTO_8473 ) ( not ( = ?AUTO_8475 ?AUTO_8472 ) ) ( not ( = ?AUTO_8471 ?AUTO_8472 ) ) ( not ( = ?AUTO_8473 ?AUTO_8472 ) ) ( CALIBRATION_TARGET ?AUTO_8474 ?AUTO_8469 ) ( VISIBLE_FROM ?AUTO_8469 ?AUTO_8472 ) ( not ( = ?AUTO_8466 ?AUTO_8469 ) ) ( CAN_TRAVERSE ?AUTO_8468 ?AUTO_8473 ?AUTO_8472 ) ( VISIBLE ?AUTO_8473 ?AUTO_8472 ) ( CAN_TRAVERSE ?AUTO_8468 ?AUTO_8475 ?AUTO_8473 ) ( AT ?AUTO_8468 ?AUTO_8475 ) ( VISIBLE ?AUTO_8475 ?AUTO_8473 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8468 ?AUTO_8475 ?AUTO_8473 )
      ( GET_IMAGE_DATA ?AUTO_8466 ?AUTO_8467 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8466 ?AUTO_8467 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8506 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8507 - LANDER
      ?AUTO_8509 - WAYPOINT
      ?AUTO_8511 - ROVER
      ?AUTO_8508 - STORE
      ?AUTO_8510 - WAYPOINT
      ?AUTO_8512 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8507 ?AUTO_8509 ) ( VISIBLE ?AUTO_8506 ?AUTO_8509 ) ( AVAILABLE ?AUTO_8511 ) ( CHANNEL_FREE ?AUTO_8507 ) ( not ( = ?AUTO_8506 ?AUTO_8509 ) ) ( AT_SOIL_SAMPLE ?AUTO_8506 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8511 ) ( STORE_OF ?AUTO_8508 ?AUTO_8511 ) ( CAN_TRAVERSE ?AUTO_8511 ?AUTO_8510 ?AUTO_8506 ) ( VISIBLE ?AUTO_8510 ?AUTO_8506 ) ( not ( = ?AUTO_8506 ?AUTO_8510 ) ) ( not ( = ?AUTO_8509 ?AUTO_8510 ) ) ( CAN_TRAVERSE ?AUTO_8511 ?AUTO_8512 ?AUTO_8510 ) ( AT ?AUTO_8511 ?AUTO_8512 ) ( VISIBLE ?AUTO_8512 ?AUTO_8510 ) ( not ( = ?AUTO_8506 ?AUTO_8512 ) ) ( not ( = ?AUTO_8509 ?AUTO_8512 ) ) ( not ( = ?AUTO_8510 ?AUTO_8512 ) ) ( FULL ?AUTO_8508 ) )
    :subtasks
    ( ( !DROP ?AUTO_8511 ?AUTO_8508 )
      ( GET_SOIL_DATA ?AUTO_8506 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8506 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8539 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8542 - LANDER
      ?AUTO_8541 - WAYPOINT
      ?AUTO_8540 - ROVER
      ?AUTO_8543 - STORE
      ?AUTO_8544 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8542 ?AUTO_8541 ) ( VISIBLE ?AUTO_8539 ?AUTO_8541 ) ( AVAILABLE ?AUTO_8540 ) ( CHANNEL_FREE ?AUTO_8542 ) ( not ( = ?AUTO_8539 ?AUTO_8541 ) ) ( AT_SOIL_SAMPLE ?AUTO_8539 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8540 ) ( STORE_OF ?AUTO_8543 ?AUTO_8540 ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8544 ?AUTO_8539 ) ( VISIBLE ?AUTO_8544 ?AUTO_8539 ) ( not ( = ?AUTO_8539 ?AUTO_8544 ) ) ( not ( = ?AUTO_8541 ?AUTO_8544 ) ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8541 ?AUTO_8544 ) ( AT ?AUTO_8540 ?AUTO_8541 ) ( VISIBLE ?AUTO_8541 ?AUTO_8544 ) ( FULL ?AUTO_8543 ) )
    :subtasks
    ( ( !DROP ?AUTO_8540 ?AUTO_8543 )
      ( GET_SOIL_DATA ?AUTO_8539 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8539 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8602 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8607 - LANDER
      ?AUTO_8606 - WAYPOINT
      ?AUTO_8603 - ROVER
      ?AUTO_8604 - STORE
      ?AUTO_8608 - WAYPOINT
      ?AUTO_8605 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8607 ?AUTO_8606 ) ( VISIBLE ?AUTO_8602 ?AUTO_8606 ) ( AVAILABLE ?AUTO_8603 ) ( CHANNEL_FREE ?AUTO_8607 ) ( not ( = ?AUTO_8602 ?AUTO_8606 ) ) ( AT_ROCK_SAMPLE ?AUTO_8602 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8603 ) ( STORE_OF ?AUTO_8604 ?AUTO_8603 ) ( CAN_TRAVERSE ?AUTO_8603 ?AUTO_8608 ?AUTO_8602 ) ( VISIBLE ?AUTO_8608 ?AUTO_8602 ) ( not ( = ?AUTO_8602 ?AUTO_8608 ) ) ( not ( = ?AUTO_8606 ?AUTO_8608 ) ) ( AT_SOIL_SAMPLE ?AUTO_8608 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8603 ) ( CAN_TRAVERSE ?AUTO_8603 ?AUTO_8605 ?AUTO_8608 ) ( AT ?AUTO_8603 ?AUTO_8605 ) ( VISIBLE ?AUTO_8605 ?AUTO_8608 ) ( not ( = ?AUTO_8602 ?AUTO_8605 ) ) ( not ( = ?AUTO_8606 ?AUTO_8605 ) ) ( not ( = ?AUTO_8608 ?AUTO_8605 ) ) ( FULL ?AUTO_8604 ) )
    :subtasks
    ( ( !DROP ?AUTO_8603 ?AUTO_8604 )
      ( GET_ROCK_DATA ?AUTO_8602 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8602 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8731 - OBJECTIVE
      ?AUTO_8732 - MODE
    )
    :vars
    (
      ?AUTO_8733 - LANDER
      ?AUTO_8736 - WAYPOINT
      ?AUTO_8735 - WAYPOINT
      ?AUTO_8738 - ROVER
      ?AUTO_8737 - CAMERA
      ?AUTO_8734 - WAYPOINT
      ?AUTO_8739 - OBJECTIVE
      ?AUTO_8740 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8733 ?AUTO_8736 ) ( VISIBLE ?AUTO_8735 ?AUTO_8736 ) ( AVAILABLE ?AUTO_8738 ) ( CHANNEL_FREE ?AUTO_8733 ) ( not ( = ?AUTO_8735 ?AUTO_8736 ) ) ( CAN_TRAVERSE ?AUTO_8738 ?AUTO_8736 ?AUTO_8735 ) ( VISIBLE ?AUTO_8736 ?AUTO_8735 ) ( ON_BOARD ?AUTO_8737 ?AUTO_8738 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8738 ) ( SUPPORTS ?AUTO_8737 ?AUTO_8732 ) ( VISIBLE_FROM ?AUTO_8731 ?AUTO_8736 ) ( CAN_TRAVERSE ?AUTO_8738 ?AUTO_8734 ?AUTO_8736 ) ( VISIBLE ?AUTO_8734 ?AUTO_8736 ) ( not ( = ?AUTO_8736 ?AUTO_8734 ) ) ( not ( = ?AUTO_8735 ?AUTO_8734 ) ) ( CALIBRATION_TARGET ?AUTO_8737 ?AUTO_8739 ) ( VISIBLE_FROM ?AUTO_8739 ?AUTO_8734 ) ( not ( = ?AUTO_8731 ?AUTO_8739 ) ) ( CAN_TRAVERSE ?AUTO_8738 ?AUTO_8740 ?AUTO_8734 ) ( AT ?AUTO_8738 ?AUTO_8740 ) ( VISIBLE ?AUTO_8740 ?AUTO_8734 ) ( not ( = ?AUTO_8736 ?AUTO_8740 ) ) ( not ( = ?AUTO_8735 ?AUTO_8740 ) ) ( not ( = ?AUTO_8734 ?AUTO_8740 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8738 ?AUTO_8740 ?AUTO_8734 )
      ( GET_IMAGE_DATA ?AUTO_8731 ?AUTO_8732 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8731 ?AUTO_8732 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8865 - OBJECTIVE
      ?AUTO_8866 - MODE
    )
    :vars
    (
      ?AUTO_8868 - LANDER
      ?AUTO_8871 - WAYPOINT
      ?AUTO_8869 - WAYPOINT
      ?AUTO_8867 - ROVER
      ?AUTO_8870 - CAMERA
      ?AUTO_8873 - WAYPOINT
      ?AUTO_8872 - WAYPOINT
      ?AUTO_8874 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8868 ?AUTO_8871 ) ( VISIBLE ?AUTO_8869 ?AUTO_8871 ) ( AVAILABLE ?AUTO_8867 ) ( CHANNEL_FREE ?AUTO_8868 ) ( not ( = ?AUTO_8869 ?AUTO_8871 ) ) ( CAN_TRAVERSE ?AUTO_8867 ?AUTO_8871 ?AUTO_8869 ) ( VISIBLE ?AUTO_8871 ?AUTO_8869 ) ( ON_BOARD ?AUTO_8870 ?AUTO_8867 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8867 ) ( SUPPORTS ?AUTO_8870 ?AUTO_8866 ) ( VISIBLE_FROM ?AUTO_8865 ?AUTO_8871 ) ( CAN_TRAVERSE ?AUTO_8867 ?AUTO_8869 ?AUTO_8871 ) ( CAN_TRAVERSE ?AUTO_8867 ?AUTO_8873 ?AUTO_8869 ) ( VISIBLE ?AUTO_8873 ?AUTO_8869 ) ( not ( = ?AUTO_8871 ?AUTO_8873 ) ) ( not ( = ?AUTO_8869 ?AUTO_8873 ) ) ( CAN_TRAVERSE ?AUTO_8867 ?AUTO_8872 ?AUTO_8873 ) ( VISIBLE ?AUTO_8872 ?AUTO_8873 ) ( not ( = ?AUTO_8871 ?AUTO_8872 ) ) ( not ( = ?AUTO_8869 ?AUTO_8872 ) ) ( not ( = ?AUTO_8873 ?AUTO_8872 ) ) ( CALIBRATION_TARGET ?AUTO_8870 ?AUTO_8874 ) ( VISIBLE_FROM ?AUTO_8874 ?AUTO_8872 ) ( not ( = ?AUTO_8865 ?AUTO_8874 ) ) ( CAN_TRAVERSE ?AUTO_8867 ?AUTO_8869 ?AUTO_8872 ) ( AT ?AUTO_8867 ?AUTO_8869 ) ( VISIBLE ?AUTO_8869 ?AUTO_8872 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8867 ?AUTO_8869 ?AUTO_8872 )
      ( GET_IMAGE_DATA ?AUTO_8865 ?AUTO_8866 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8865 ?AUTO_8866 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8883 - OBJECTIVE
      ?AUTO_8884 - MODE
    )
    :vars
    (
      ?AUTO_8889 - LANDER
      ?AUTO_8885 - WAYPOINT
      ?AUTO_8888 - WAYPOINT
      ?AUTO_8892 - ROVER
      ?AUTO_8886 - CAMERA
      ?AUTO_8890 - WAYPOINT
      ?AUTO_8891 - WAYPOINT
      ?AUTO_8887 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8889 ?AUTO_8885 ) ( VISIBLE ?AUTO_8888 ?AUTO_8885 ) ( AVAILABLE ?AUTO_8892 ) ( CHANNEL_FREE ?AUTO_8889 ) ( not ( = ?AUTO_8888 ?AUTO_8885 ) ) ( CAN_TRAVERSE ?AUTO_8892 ?AUTO_8885 ?AUTO_8888 ) ( VISIBLE ?AUTO_8885 ?AUTO_8888 ) ( ON_BOARD ?AUTO_8886 ?AUTO_8892 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8892 ) ( SUPPORTS ?AUTO_8886 ?AUTO_8884 ) ( VISIBLE_FROM ?AUTO_8883 ?AUTO_8885 ) ( CAN_TRAVERSE ?AUTO_8892 ?AUTO_8888 ?AUTO_8885 ) ( CAN_TRAVERSE ?AUTO_8892 ?AUTO_8890 ?AUTO_8888 ) ( VISIBLE ?AUTO_8890 ?AUTO_8888 ) ( not ( = ?AUTO_8885 ?AUTO_8890 ) ) ( not ( = ?AUTO_8888 ?AUTO_8890 ) ) ( CAN_TRAVERSE ?AUTO_8892 ?AUTO_8891 ?AUTO_8890 ) ( VISIBLE ?AUTO_8891 ?AUTO_8890 ) ( not ( = ?AUTO_8885 ?AUTO_8891 ) ) ( not ( = ?AUTO_8888 ?AUTO_8891 ) ) ( not ( = ?AUTO_8890 ?AUTO_8891 ) ) ( CALIBRATION_TARGET ?AUTO_8886 ?AUTO_8887 ) ( VISIBLE_FROM ?AUTO_8887 ?AUTO_8891 ) ( not ( = ?AUTO_8883 ?AUTO_8887 ) ) ( CAN_TRAVERSE ?AUTO_8892 ?AUTO_8888 ?AUTO_8891 ) ( VISIBLE ?AUTO_8888 ?AUTO_8891 ) ( AT ?AUTO_8892 ?AUTO_8890 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8892 ?AUTO_8890 ?AUTO_8888 )
      ( GET_IMAGE_DATA ?AUTO_8883 ?AUTO_8884 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8883 ?AUTO_8884 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8903 - OBJECTIVE
      ?AUTO_8904 - MODE
    )
    :vars
    (
      ?AUTO_8911 - LANDER
      ?AUTO_8908 - WAYPOINT
      ?AUTO_8912 - WAYPOINT
      ?AUTO_8909 - ROVER
      ?AUTO_8910 - CAMERA
      ?AUTO_8906 - WAYPOINT
      ?AUTO_8905 - WAYPOINT
      ?AUTO_8907 - OBJECTIVE
      ?AUTO_8913 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8911 ?AUTO_8908 ) ( VISIBLE ?AUTO_8912 ?AUTO_8908 ) ( AVAILABLE ?AUTO_8909 ) ( CHANNEL_FREE ?AUTO_8911 ) ( not ( = ?AUTO_8912 ?AUTO_8908 ) ) ( CAN_TRAVERSE ?AUTO_8909 ?AUTO_8908 ?AUTO_8912 ) ( VISIBLE ?AUTO_8908 ?AUTO_8912 ) ( ON_BOARD ?AUTO_8910 ?AUTO_8909 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8909 ) ( SUPPORTS ?AUTO_8910 ?AUTO_8904 ) ( VISIBLE_FROM ?AUTO_8903 ?AUTO_8908 ) ( CAN_TRAVERSE ?AUTO_8909 ?AUTO_8912 ?AUTO_8908 ) ( CAN_TRAVERSE ?AUTO_8909 ?AUTO_8906 ?AUTO_8912 ) ( VISIBLE ?AUTO_8906 ?AUTO_8912 ) ( not ( = ?AUTO_8908 ?AUTO_8906 ) ) ( not ( = ?AUTO_8912 ?AUTO_8906 ) ) ( CAN_TRAVERSE ?AUTO_8909 ?AUTO_8905 ?AUTO_8906 ) ( VISIBLE ?AUTO_8905 ?AUTO_8906 ) ( not ( = ?AUTO_8908 ?AUTO_8905 ) ) ( not ( = ?AUTO_8912 ?AUTO_8905 ) ) ( not ( = ?AUTO_8906 ?AUTO_8905 ) ) ( CALIBRATION_TARGET ?AUTO_8910 ?AUTO_8907 ) ( VISIBLE_FROM ?AUTO_8907 ?AUTO_8905 ) ( not ( = ?AUTO_8903 ?AUTO_8907 ) ) ( CAN_TRAVERSE ?AUTO_8909 ?AUTO_8912 ?AUTO_8905 ) ( VISIBLE ?AUTO_8912 ?AUTO_8905 ) ( CAN_TRAVERSE ?AUTO_8909 ?AUTO_8913 ?AUTO_8906 ) ( AT ?AUTO_8909 ?AUTO_8913 ) ( VISIBLE ?AUTO_8913 ?AUTO_8906 ) ( not ( = ?AUTO_8908 ?AUTO_8913 ) ) ( not ( = ?AUTO_8912 ?AUTO_8913 ) ) ( not ( = ?AUTO_8906 ?AUTO_8913 ) ) ( not ( = ?AUTO_8905 ?AUTO_8913 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8909 ?AUTO_8913 ?AUTO_8906 )
      ( GET_IMAGE_DATA ?AUTO_8903 ?AUTO_8904 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8903 ?AUTO_8904 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8982 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8987 - LANDER
      ?AUTO_8985 - WAYPOINT
      ?AUTO_8984 - WAYPOINT
      ?AUTO_8986 - ROVER
      ?AUTO_8988 - STORE
      ?AUTO_8983 - WAYPOINT
      ?AUTO_8989 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8987 ?AUTO_8985 ) ( VISIBLE ?AUTO_8984 ?AUTO_8985 ) ( AVAILABLE ?AUTO_8986 ) ( CHANNEL_FREE ?AUTO_8987 ) ( not ( = ?AUTO_8982 ?AUTO_8984 ) ) ( not ( = ?AUTO_8982 ?AUTO_8985 ) ) ( not ( = ?AUTO_8984 ?AUTO_8985 ) ) ( CAN_TRAVERSE ?AUTO_8986 ?AUTO_8982 ?AUTO_8984 ) ( VISIBLE ?AUTO_8982 ?AUTO_8984 ) ( AT_SOIL_SAMPLE ?AUTO_8982 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8986 ) ( STORE_OF ?AUTO_8988 ?AUTO_8986 ) ( EMPTY ?AUTO_8988 ) ( CAN_TRAVERSE ?AUTO_8986 ?AUTO_8983 ?AUTO_8982 ) ( VISIBLE ?AUTO_8983 ?AUTO_8982 ) ( not ( = ?AUTO_8982 ?AUTO_8983 ) ) ( not ( = ?AUTO_8985 ?AUTO_8983 ) ) ( not ( = ?AUTO_8984 ?AUTO_8983 ) ) ( CAN_TRAVERSE ?AUTO_8986 ?AUTO_8984 ?AUTO_8983 ) ( VISIBLE ?AUTO_8984 ?AUTO_8983 ) ( CAN_TRAVERSE ?AUTO_8986 ?AUTO_8989 ?AUTO_8984 ) ( AT ?AUTO_8986 ?AUTO_8989 ) ( VISIBLE ?AUTO_8989 ?AUTO_8984 ) ( not ( = ?AUTO_8982 ?AUTO_8989 ) ) ( not ( = ?AUTO_8985 ?AUTO_8989 ) ) ( not ( = ?AUTO_8984 ?AUTO_8989 ) ) ( not ( = ?AUTO_8983 ?AUTO_8989 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8986 ?AUTO_8989 ?AUTO_8984 )
      ( GET_SOIL_DATA ?AUTO_8982 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8982 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9052 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9058 - LANDER
      ?AUTO_9055 - WAYPOINT
      ?AUTO_9057 - WAYPOINT
      ?AUTO_9054 - ROVER
      ?AUTO_9053 - STORE
      ?AUTO_9056 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9058 ?AUTO_9055 ) ( VISIBLE ?AUTO_9057 ?AUTO_9055 ) ( AVAILABLE ?AUTO_9054 ) ( CHANNEL_FREE ?AUTO_9058 ) ( not ( = ?AUTO_9052 ?AUTO_9057 ) ) ( not ( = ?AUTO_9052 ?AUTO_9055 ) ) ( not ( = ?AUTO_9057 ?AUTO_9055 ) ) ( CAN_TRAVERSE ?AUTO_9054 ?AUTO_9052 ?AUTO_9057 ) ( VISIBLE ?AUTO_9052 ?AUTO_9057 ) ( AT_ROCK_SAMPLE ?AUTO_9052 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9054 ) ( STORE_OF ?AUTO_9053 ?AUTO_9054 ) ( CAN_TRAVERSE ?AUTO_9054 ?AUTO_9056 ?AUTO_9052 ) ( VISIBLE ?AUTO_9056 ?AUTO_9052 ) ( not ( = ?AUTO_9052 ?AUTO_9056 ) ) ( not ( = ?AUTO_9055 ?AUTO_9056 ) ) ( not ( = ?AUTO_9057 ?AUTO_9056 ) ) ( FULL ?AUTO_9053 ) ( CAN_TRAVERSE ?AUTO_9054 ?AUTO_9057 ?AUTO_9056 ) ( AT ?AUTO_9054 ?AUTO_9057 ) ( VISIBLE ?AUTO_9057 ?AUTO_9056 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9054 ?AUTO_9057 ?AUTO_9056 )
      ( GET_ROCK_DATA ?AUTO_9052 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9052 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9064 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9068 - LANDER
      ?AUTO_9069 - WAYPOINT
      ?AUTO_9067 - WAYPOINT
      ?AUTO_9070 - ROVER
      ?AUTO_9065 - STORE
      ?AUTO_9066 - WAYPOINT
      ?AUTO_9071 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9068 ?AUTO_9069 ) ( VISIBLE ?AUTO_9067 ?AUTO_9069 ) ( AVAILABLE ?AUTO_9070 ) ( CHANNEL_FREE ?AUTO_9068 ) ( not ( = ?AUTO_9064 ?AUTO_9067 ) ) ( not ( = ?AUTO_9064 ?AUTO_9069 ) ) ( not ( = ?AUTO_9067 ?AUTO_9069 ) ) ( CAN_TRAVERSE ?AUTO_9070 ?AUTO_9064 ?AUTO_9067 ) ( VISIBLE ?AUTO_9064 ?AUTO_9067 ) ( AT_ROCK_SAMPLE ?AUTO_9064 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9070 ) ( STORE_OF ?AUTO_9065 ?AUTO_9070 ) ( EMPTY ?AUTO_9065 ) ( CAN_TRAVERSE ?AUTO_9070 ?AUTO_9066 ?AUTO_9064 ) ( VISIBLE ?AUTO_9066 ?AUTO_9064 ) ( not ( = ?AUTO_9064 ?AUTO_9066 ) ) ( not ( = ?AUTO_9069 ?AUTO_9066 ) ) ( not ( = ?AUTO_9067 ?AUTO_9066 ) ) ( CAN_TRAVERSE ?AUTO_9070 ?AUTO_9067 ?AUTO_9066 ) ( VISIBLE ?AUTO_9067 ?AUTO_9066 ) ( CAN_TRAVERSE ?AUTO_9070 ?AUTO_9071 ?AUTO_9067 ) ( AT ?AUTO_9070 ?AUTO_9071 ) ( VISIBLE ?AUTO_9071 ?AUTO_9067 ) ( not ( = ?AUTO_9064 ?AUTO_9071 ) ) ( not ( = ?AUTO_9069 ?AUTO_9071 ) ) ( not ( = ?AUTO_9067 ?AUTO_9071 ) ) ( not ( = ?AUTO_9066 ?AUTO_9071 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9070 ?AUTO_9071 ?AUTO_9067 )
      ( GET_ROCK_DATA ?AUTO_9064 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9064 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9169 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9170 - LANDER
      ?AUTO_9171 - WAYPOINT
      ?AUTO_9174 - WAYPOINT
      ?AUTO_9173 - ROVER
      ?AUTO_9172 - WAYPOINT
      ?AUTO_9175 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9170 ?AUTO_9171 ) ( VISIBLE ?AUTO_9174 ?AUTO_9171 ) ( AVAILABLE ?AUTO_9173 ) ( CHANNEL_FREE ?AUTO_9170 ) ( not ( = ?AUTO_9169 ?AUTO_9174 ) ) ( not ( = ?AUTO_9169 ?AUTO_9171 ) ) ( not ( = ?AUTO_9174 ?AUTO_9171 ) ) ( CAN_TRAVERSE ?AUTO_9173 ?AUTO_9172 ?AUTO_9174 ) ( VISIBLE ?AUTO_9172 ?AUTO_9174 ) ( not ( = ?AUTO_9169 ?AUTO_9172 ) ) ( not ( = ?AUTO_9171 ?AUTO_9172 ) ) ( not ( = ?AUTO_9174 ?AUTO_9172 ) ) ( CAN_TRAVERSE ?AUTO_9173 ?AUTO_9169 ?AUTO_9172 ) ( VISIBLE ?AUTO_9169 ?AUTO_9172 ) ( AT_SOIL_SAMPLE ?AUTO_9169 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9173 ) ( STORE_OF ?AUTO_9175 ?AUTO_9173 ) ( EMPTY ?AUTO_9175 ) ( CAN_TRAVERSE ?AUTO_9173 ?AUTO_9174 ?AUTO_9169 ) ( AT ?AUTO_9173 ?AUTO_9174 ) ( VISIBLE ?AUTO_9174 ?AUTO_9169 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9173 ?AUTO_9174 ?AUTO_9169 )
      ( GET_SOIL_DATA ?AUTO_9169 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9169 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9182 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9188 - LANDER
      ?AUTO_9187 - WAYPOINT
      ?AUTO_9183 - WAYPOINT
      ?AUTO_9184 - ROVER
      ?AUTO_9186 - WAYPOINT
      ?AUTO_9185 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9188 ?AUTO_9187 ) ( VISIBLE ?AUTO_9183 ?AUTO_9187 ) ( AVAILABLE ?AUTO_9184 ) ( CHANNEL_FREE ?AUTO_9188 ) ( not ( = ?AUTO_9182 ?AUTO_9183 ) ) ( not ( = ?AUTO_9182 ?AUTO_9187 ) ) ( not ( = ?AUTO_9183 ?AUTO_9187 ) ) ( CAN_TRAVERSE ?AUTO_9184 ?AUTO_9186 ?AUTO_9183 ) ( VISIBLE ?AUTO_9186 ?AUTO_9183 ) ( not ( = ?AUTO_9182 ?AUTO_9186 ) ) ( not ( = ?AUTO_9187 ?AUTO_9186 ) ) ( not ( = ?AUTO_9183 ?AUTO_9186 ) ) ( CAN_TRAVERSE ?AUTO_9184 ?AUTO_9182 ?AUTO_9186 ) ( VISIBLE ?AUTO_9182 ?AUTO_9186 ) ( AT_SOIL_SAMPLE ?AUTO_9182 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9184 ) ( STORE_OF ?AUTO_9185 ?AUTO_9184 ) ( EMPTY ?AUTO_9185 ) ( CAN_TRAVERSE ?AUTO_9184 ?AUTO_9183 ?AUTO_9182 ) ( VISIBLE ?AUTO_9183 ?AUTO_9182 ) ( CAN_TRAVERSE ?AUTO_9184 ?AUTO_9187 ?AUTO_9183 ) ( AT ?AUTO_9184 ?AUTO_9187 ) ( VISIBLE ?AUTO_9187 ?AUTO_9183 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9184 ?AUTO_9187 ?AUTO_9183 )
      ( GET_SOIL_DATA ?AUTO_9182 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9182 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9189 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9190 - LANDER
      ?AUTO_9194 - WAYPOINT
      ?AUTO_9192 - WAYPOINT
      ?AUTO_9191 - ROVER
      ?AUTO_9195 - WAYPOINT
      ?AUTO_9193 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9190 ?AUTO_9194 ) ( VISIBLE ?AUTO_9192 ?AUTO_9194 ) ( AVAILABLE ?AUTO_9191 ) ( CHANNEL_FREE ?AUTO_9190 ) ( not ( = ?AUTO_9189 ?AUTO_9192 ) ) ( not ( = ?AUTO_9189 ?AUTO_9194 ) ) ( not ( = ?AUTO_9192 ?AUTO_9194 ) ) ( CAN_TRAVERSE ?AUTO_9191 ?AUTO_9195 ?AUTO_9192 ) ( VISIBLE ?AUTO_9195 ?AUTO_9192 ) ( not ( = ?AUTO_9189 ?AUTO_9195 ) ) ( not ( = ?AUTO_9194 ?AUTO_9195 ) ) ( not ( = ?AUTO_9192 ?AUTO_9195 ) ) ( CAN_TRAVERSE ?AUTO_9191 ?AUTO_9189 ?AUTO_9195 ) ( VISIBLE ?AUTO_9189 ?AUTO_9195 ) ( AT_SOIL_SAMPLE ?AUTO_9189 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9191 ) ( STORE_OF ?AUTO_9193 ?AUTO_9191 ) ( CAN_TRAVERSE ?AUTO_9191 ?AUTO_9192 ?AUTO_9189 ) ( VISIBLE ?AUTO_9192 ?AUTO_9189 ) ( CAN_TRAVERSE ?AUTO_9191 ?AUTO_9194 ?AUTO_9192 ) ( AT ?AUTO_9191 ?AUTO_9194 ) ( VISIBLE ?AUTO_9194 ?AUTO_9192 ) ( FULL ?AUTO_9193 ) )
    :subtasks
    ( ( !DROP ?AUTO_9191 ?AUTO_9193 )
      ( GET_SOIL_DATA ?AUTO_9189 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9189 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9237 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9241 - LANDER
      ?AUTO_9243 - WAYPOINT
      ?AUTO_9239 - WAYPOINT
      ?AUTO_9242 - ROVER
      ?AUTO_9238 - STORE
      ?AUTO_9240 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9241 ?AUTO_9243 ) ( VISIBLE ?AUTO_9239 ?AUTO_9243 ) ( AVAILABLE ?AUTO_9242 ) ( CHANNEL_FREE ?AUTO_9241 ) ( not ( = ?AUTO_9237 ?AUTO_9239 ) ) ( not ( = ?AUTO_9237 ?AUTO_9243 ) ) ( not ( = ?AUTO_9239 ?AUTO_9243 ) ) ( CAN_TRAVERSE ?AUTO_9242 ?AUTO_9237 ?AUTO_9239 ) ( VISIBLE ?AUTO_9237 ?AUTO_9239 ) ( AT_SOIL_SAMPLE ?AUTO_9237 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9242 ) ( STORE_OF ?AUTO_9238 ?AUTO_9242 ) ( CAN_TRAVERSE ?AUTO_9242 ?AUTO_9240 ?AUTO_9237 ) ( AT ?AUTO_9242 ?AUTO_9240 ) ( VISIBLE ?AUTO_9240 ?AUTO_9237 ) ( not ( = ?AUTO_9237 ?AUTO_9240 ) ) ( not ( = ?AUTO_9243 ?AUTO_9240 ) ) ( not ( = ?AUTO_9239 ?AUTO_9240 ) ) ( AT_SOIL_SAMPLE ?AUTO_9240 ) ( EMPTY ?AUTO_9238 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9242 ?AUTO_9238 ?AUTO_9240 )
      ( GET_SOIL_DATA ?AUTO_9237 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9237 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9251 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9255 - LANDER
      ?AUTO_9253 - WAYPOINT
      ?AUTO_9252 - WAYPOINT
      ?AUTO_9256 - ROVER
      ?AUTO_9254 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9255 ?AUTO_9253 ) ( VISIBLE ?AUTO_9252 ?AUTO_9253 ) ( AVAILABLE ?AUTO_9256 ) ( CHANNEL_FREE ?AUTO_9255 ) ( not ( = ?AUTO_9251 ?AUTO_9252 ) ) ( not ( = ?AUTO_9251 ?AUTO_9253 ) ) ( not ( = ?AUTO_9252 ?AUTO_9253 ) ) ( CAN_TRAVERSE ?AUTO_9256 ?AUTO_9251 ?AUTO_9252 ) ( VISIBLE ?AUTO_9251 ?AUTO_9252 ) ( AT_SOIL_SAMPLE ?AUTO_9251 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9256 ) ( STORE_OF ?AUTO_9254 ?AUTO_9256 ) ( EMPTY ?AUTO_9254 ) ( CAN_TRAVERSE ?AUTO_9256 ?AUTO_9252 ?AUTO_9251 ) ( VISIBLE ?AUTO_9252 ?AUTO_9251 ) ( CAN_TRAVERSE ?AUTO_9256 ?AUTO_9253 ?AUTO_9252 ) ( AT ?AUTO_9256 ?AUTO_9253 ) ( VISIBLE ?AUTO_9253 ?AUTO_9252 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9256 ?AUTO_9253 ?AUTO_9252 )
      ( GET_SOIL_DATA ?AUTO_9251 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9251 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9257 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9262 - LANDER
      ?AUTO_9259 - WAYPOINT
      ?AUTO_9258 - WAYPOINT
      ?AUTO_9261 - ROVER
      ?AUTO_9260 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9262 ?AUTO_9259 ) ( VISIBLE ?AUTO_9258 ?AUTO_9259 ) ( AVAILABLE ?AUTO_9261 ) ( CHANNEL_FREE ?AUTO_9262 ) ( not ( = ?AUTO_9257 ?AUTO_9258 ) ) ( not ( = ?AUTO_9257 ?AUTO_9259 ) ) ( not ( = ?AUTO_9258 ?AUTO_9259 ) ) ( CAN_TRAVERSE ?AUTO_9261 ?AUTO_9257 ?AUTO_9258 ) ( VISIBLE ?AUTO_9257 ?AUTO_9258 ) ( AT_SOIL_SAMPLE ?AUTO_9257 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9261 ) ( STORE_OF ?AUTO_9260 ?AUTO_9261 ) ( CAN_TRAVERSE ?AUTO_9261 ?AUTO_9258 ?AUTO_9257 ) ( VISIBLE ?AUTO_9258 ?AUTO_9257 ) ( CAN_TRAVERSE ?AUTO_9261 ?AUTO_9259 ?AUTO_9258 ) ( AT ?AUTO_9261 ?AUTO_9259 ) ( VISIBLE ?AUTO_9259 ?AUTO_9258 ) ( FULL ?AUTO_9260 ) )
    :subtasks
    ( ( !DROP ?AUTO_9261 ?AUTO_9260 )
      ( GET_SOIL_DATA ?AUTO_9257 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9257 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9305 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9307 - LANDER
      ?AUTO_9308 - WAYPOINT
      ?AUTO_9306 - WAYPOINT
      ?AUTO_9310 - ROVER
      ?AUTO_9311 - STORE
      ?AUTO_9309 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9307 ?AUTO_9308 ) ( VISIBLE ?AUTO_9306 ?AUTO_9308 ) ( AVAILABLE ?AUTO_9310 ) ( CHANNEL_FREE ?AUTO_9307 ) ( not ( = ?AUTO_9305 ?AUTO_9306 ) ) ( not ( = ?AUTO_9305 ?AUTO_9308 ) ) ( not ( = ?AUTO_9306 ?AUTO_9308 ) ) ( CAN_TRAVERSE ?AUTO_9310 ?AUTO_9305 ?AUTO_9306 ) ( VISIBLE ?AUTO_9305 ?AUTO_9306 ) ( AT_ROCK_SAMPLE ?AUTO_9305 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9310 ) ( STORE_OF ?AUTO_9311 ?AUTO_9310 ) ( CAN_TRAVERSE ?AUTO_9310 ?AUTO_9309 ?AUTO_9305 ) ( AT ?AUTO_9310 ?AUTO_9309 ) ( VISIBLE ?AUTO_9309 ?AUTO_9305 ) ( not ( = ?AUTO_9305 ?AUTO_9309 ) ) ( not ( = ?AUTO_9308 ?AUTO_9309 ) ) ( not ( = ?AUTO_9306 ?AUTO_9309 ) ) ( AT_SOIL_SAMPLE ?AUTO_9309 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9310 ) ( EMPTY ?AUTO_9311 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9310 ?AUTO_9311 ?AUTO_9309 )
      ( GET_ROCK_DATA ?AUTO_9305 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9305 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9348 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9350 - LANDER
      ?AUTO_9352 - WAYPOINT
      ?AUTO_9349 - ROVER
      ?AUTO_9353 - STORE
      ?AUTO_9351 - WAYPOINT
      ?AUTO_9354 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9350 ?AUTO_9348 ) ( VISIBLE ?AUTO_9352 ?AUTO_9348 ) ( AVAILABLE ?AUTO_9349 ) ( CHANNEL_FREE ?AUTO_9350 ) ( not ( = ?AUTO_9348 ?AUTO_9352 ) ) ( CAN_TRAVERSE ?AUTO_9349 ?AUTO_9348 ?AUTO_9352 ) ( VISIBLE ?AUTO_9348 ?AUTO_9352 ) ( AT_SOIL_SAMPLE ?AUTO_9348 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9349 ) ( STORE_OF ?AUTO_9353 ?AUTO_9349 ) ( FULL ?AUTO_9353 ) ( CAN_TRAVERSE ?AUTO_9349 ?AUTO_9351 ?AUTO_9348 ) ( VISIBLE ?AUTO_9351 ?AUTO_9348 ) ( not ( = ?AUTO_9348 ?AUTO_9351 ) ) ( not ( = ?AUTO_9352 ?AUTO_9351 ) ) ( CAN_TRAVERSE ?AUTO_9349 ?AUTO_9354 ?AUTO_9351 ) ( AT ?AUTO_9349 ?AUTO_9354 ) ( VISIBLE ?AUTO_9354 ?AUTO_9351 ) ( not ( = ?AUTO_9348 ?AUTO_9354 ) ) ( not ( = ?AUTO_9352 ?AUTO_9354 ) ) ( not ( = ?AUTO_9351 ?AUTO_9354 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9349 ?AUTO_9354 ?AUTO_9351 )
      ( GET_SOIL_DATA ?AUTO_9348 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9348 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9356 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9360 - LANDER
      ?AUTO_9358 - WAYPOINT
      ?AUTO_9361 - ROVER
      ?AUTO_9359 - STORE
      ?AUTO_9357 - WAYPOINT
      ?AUTO_9362 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9360 ?AUTO_9356 ) ( VISIBLE ?AUTO_9358 ?AUTO_9356 ) ( AVAILABLE ?AUTO_9361 ) ( CHANNEL_FREE ?AUTO_9360 ) ( not ( = ?AUTO_9356 ?AUTO_9358 ) ) ( CAN_TRAVERSE ?AUTO_9361 ?AUTO_9356 ?AUTO_9358 ) ( VISIBLE ?AUTO_9356 ?AUTO_9358 ) ( AT_SOIL_SAMPLE ?AUTO_9356 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9361 ) ( STORE_OF ?AUTO_9359 ?AUTO_9361 ) ( CAN_TRAVERSE ?AUTO_9361 ?AUTO_9357 ?AUTO_9356 ) ( VISIBLE ?AUTO_9357 ?AUTO_9356 ) ( not ( = ?AUTO_9356 ?AUTO_9357 ) ) ( not ( = ?AUTO_9358 ?AUTO_9357 ) ) ( CAN_TRAVERSE ?AUTO_9361 ?AUTO_9362 ?AUTO_9357 ) ( AT ?AUTO_9361 ?AUTO_9362 ) ( VISIBLE ?AUTO_9362 ?AUTO_9357 ) ( not ( = ?AUTO_9356 ?AUTO_9362 ) ) ( not ( = ?AUTO_9358 ?AUTO_9362 ) ) ( not ( = ?AUTO_9357 ?AUTO_9362 ) ) ( AT_ROCK_SAMPLE ?AUTO_9362 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9361 ) ( EMPTY ?AUTO_9359 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_9361 ?AUTO_9359 ?AUTO_9362 )
      ( GET_SOIL_DATA ?AUTO_9356 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9356 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9392 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9395 - LANDER
      ?AUTO_9393 - WAYPOINT
      ?AUTO_9394 - ROVER
      ?AUTO_9396 - STORE
      ?AUTO_9397 - WAYPOINT
      ?AUTO_9398 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9395 ?AUTO_9393 ) ( VISIBLE ?AUTO_9392 ?AUTO_9393 ) ( AVAILABLE ?AUTO_9394 ) ( CHANNEL_FREE ?AUTO_9395 ) ( not ( = ?AUTO_9392 ?AUTO_9393 ) ) ( AT_ROCK_SAMPLE ?AUTO_9392 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9394 ) ( STORE_OF ?AUTO_9396 ?AUTO_9394 ) ( CAN_TRAVERSE ?AUTO_9394 ?AUTO_9393 ?AUTO_9392 ) ( VISIBLE ?AUTO_9393 ?AUTO_9392 ) ( FULL ?AUTO_9396 ) ( CAN_TRAVERSE ?AUTO_9394 ?AUTO_9397 ?AUTO_9393 ) ( VISIBLE ?AUTO_9397 ?AUTO_9393 ) ( not ( = ?AUTO_9392 ?AUTO_9397 ) ) ( not ( = ?AUTO_9393 ?AUTO_9397 ) ) ( CAN_TRAVERSE ?AUTO_9394 ?AUTO_9398 ?AUTO_9397 ) ( AT ?AUTO_9394 ?AUTO_9398 ) ( VISIBLE ?AUTO_9398 ?AUTO_9397 ) ( not ( = ?AUTO_9392 ?AUTO_9398 ) ) ( not ( = ?AUTO_9393 ?AUTO_9398 ) ) ( not ( = ?AUTO_9397 ?AUTO_9398 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9394 ?AUTO_9398 ?AUTO_9397 )
      ( GET_ROCK_DATA ?AUTO_9392 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9392 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9400 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9402 - LANDER
      ?AUTO_9406 - WAYPOINT
      ?AUTO_9404 - ROVER
      ?AUTO_9401 - STORE
      ?AUTO_9405 - WAYPOINT
      ?AUTO_9403 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9402 ?AUTO_9406 ) ( VISIBLE ?AUTO_9400 ?AUTO_9406 ) ( AVAILABLE ?AUTO_9404 ) ( CHANNEL_FREE ?AUTO_9402 ) ( not ( = ?AUTO_9400 ?AUTO_9406 ) ) ( AT_ROCK_SAMPLE ?AUTO_9400 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9404 ) ( STORE_OF ?AUTO_9401 ?AUTO_9404 ) ( CAN_TRAVERSE ?AUTO_9404 ?AUTO_9406 ?AUTO_9400 ) ( VISIBLE ?AUTO_9406 ?AUTO_9400 ) ( CAN_TRAVERSE ?AUTO_9404 ?AUTO_9405 ?AUTO_9406 ) ( VISIBLE ?AUTO_9405 ?AUTO_9406 ) ( not ( = ?AUTO_9400 ?AUTO_9405 ) ) ( not ( = ?AUTO_9406 ?AUTO_9405 ) ) ( CAN_TRAVERSE ?AUTO_9404 ?AUTO_9403 ?AUTO_9405 ) ( AT ?AUTO_9404 ?AUTO_9403 ) ( VISIBLE ?AUTO_9403 ?AUTO_9405 ) ( not ( = ?AUTO_9400 ?AUTO_9403 ) ) ( not ( = ?AUTO_9406 ?AUTO_9403 ) ) ( not ( = ?AUTO_9405 ?AUTO_9403 ) ) ( AT_ROCK_SAMPLE ?AUTO_9403 ) ( EMPTY ?AUTO_9401 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_9404 ?AUTO_9401 ?AUTO_9403 )
      ( GET_ROCK_DATA ?AUTO_9400 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9400 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9439 - OBJECTIVE
      ?AUTO_9440 - MODE
    )
    :vars
    (
      ?AUTO_9442 - LANDER
      ?AUTO_9441 - WAYPOINT
      ?AUTO_9444 - WAYPOINT
      ?AUTO_9446 - ROVER
      ?AUTO_9443 - WAYPOINT
      ?AUTO_9445 - CAMERA
      ?AUTO_9447 - OBJECTIVE
      ?AUTO_9448 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9442 ?AUTO_9441 ) ( VISIBLE ?AUTO_9444 ?AUTO_9441 ) ( AVAILABLE ?AUTO_9446 ) ( CHANNEL_FREE ?AUTO_9442 ) ( not ( = ?AUTO_9444 ?AUTO_9441 ) ) ( CAN_TRAVERSE ?AUTO_9446 ?AUTO_9443 ?AUTO_9444 ) ( VISIBLE ?AUTO_9443 ?AUTO_9444 ) ( not ( = ?AUTO_9441 ?AUTO_9443 ) ) ( not ( = ?AUTO_9444 ?AUTO_9443 ) ) ( ON_BOARD ?AUTO_9445 ?AUTO_9446 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9446 ) ( SUPPORTS ?AUTO_9445 ?AUTO_9440 ) ( VISIBLE_FROM ?AUTO_9439 ?AUTO_9443 ) ( CALIBRATION_TARGET ?AUTO_9445 ?AUTO_9447 ) ( VISIBLE_FROM ?AUTO_9447 ?AUTO_9443 ) ( not ( = ?AUTO_9439 ?AUTO_9447 ) ) ( CAN_TRAVERSE ?AUTO_9446 ?AUTO_9448 ?AUTO_9443 ) ( AT ?AUTO_9446 ?AUTO_9448 ) ( VISIBLE ?AUTO_9448 ?AUTO_9443 ) ( not ( = ?AUTO_9441 ?AUTO_9448 ) ) ( not ( = ?AUTO_9444 ?AUTO_9448 ) ) ( not ( = ?AUTO_9443 ?AUTO_9448 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9446 ?AUTO_9448 ?AUTO_9443 )
      ( GET_IMAGE_DATA ?AUTO_9439 ?AUTO_9440 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9439 ?AUTO_9440 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9455 - OBJECTIVE
      ?AUTO_9456 - MODE
    )
    :vars
    (
      ?AUTO_9461 - LANDER
      ?AUTO_9457 - WAYPOINT
      ?AUTO_9458 - WAYPOINT
      ?AUTO_9463 - ROVER
      ?AUTO_9460 - WAYPOINT
      ?AUTO_9459 - CAMERA
      ?AUTO_9462 - OBJECTIVE
      ?AUTO_9464 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9461 ?AUTO_9457 ) ( VISIBLE ?AUTO_9458 ?AUTO_9457 ) ( AVAILABLE ?AUTO_9463 ) ( CHANNEL_FREE ?AUTO_9461 ) ( not ( = ?AUTO_9458 ?AUTO_9457 ) ) ( CAN_TRAVERSE ?AUTO_9463 ?AUTO_9460 ?AUTO_9458 ) ( VISIBLE ?AUTO_9460 ?AUTO_9458 ) ( not ( = ?AUTO_9457 ?AUTO_9460 ) ) ( not ( = ?AUTO_9458 ?AUTO_9460 ) ) ( ON_BOARD ?AUTO_9459 ?AUTO_9463 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9463 ) ( SUPPORTS ?AUTO_9459 ?AUTO_9456 ) ( VISIBLE_FROM ?AUTO_9455 ?AUTO_9460 ) ( CALIBRATION_TARGET ?AUTO_9459 ?AUTO_9462 ) ( VISIBLE_FROM ?AUTO_9462 ?AUTO_9460 ) ( not ( = ?AUTO_9455 ?AUTO_9462 ) ) ( CAN_TRAVERSE ?AUTO_9463 ?AUTO_9464 ?AUTO_9460 ) ( VISIBLE ?AUTO_9464 ?AUTO_9460 ) ( not ( = ?AUTO_9457 ?AUTO_9464 ) ) ( not ( = ?AUTO_9458 ?AUTO_9464 ) ) ( not ( = ?AUTO_9460 ?AUTO_9464 ) ) ( CAN_TRAVERSE ?AUTO_9463 ?AUTO_9457 ?AUTO_9464 ) ( AT ?AUTO_9463 ?AUTO_9457 ) ( VISIBLE ?AUTO_9457 ?AUTO_9464 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9463 ?AUTO_9457 ?AUTO_9464 )
      ( GET_IMAGE_DATA ?AUTO_9455 ?AUTO_9456 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9455 ?AUTO_9456 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9471 - OBJECTIVE
      ?AUTO_9472 - MODE
    )
    :vars
    (
      ?AUTO_9479 - LANDER
      ?AUTO_9474 - WAYPOINT
      ?AUTO_9473 - WAYPOINT
      ?AUTO_9480 - ROVER
      ?AUTO_9475 - WAYPOINT
      ?AUTO_9478 - CAMERA
      ?AUTO_9477 - OBJECTIVE
      ?AUTO_9476 - WAYPOINT
      ?AUTO_9481 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9479 ?AUTO_9474 ) ( VISIBLE ?AUTO_9473 ?AUTO_9474 ) ( AVAILABLE ?AUTO_9480 ) ( CHANNEL_FREE ?AUTO_9479 ) ( not ( = ?AUTO_9473 ?AUTO_9474 ) ) ( CAN_TRAVERSE ?AUTO_9480 ?AUTO_9475 ?AUTO_9473 ) ( VISIBLE ?AUTO_9475 ?AUTO_9473 ) ( not ( = ?AUTO_9474 ?AUTO_9475 ) ) ( not ( = ?AUTO_9473 ?AUTO_9475 ) ) ( ON_BOARD ?AUTO_9478 ?AUTO_9480 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9480 ) ( SUPPORTS ?AUTO_9478 ?AUTO_9472 ) ( VISIBLE_FROM ?AUTO_9471 ?AUTO_9475 ) ( CALIBRATION_TARGET ?AUTO_9478 ?AUTO_9477 ) ( VISIBLE_FROM ?AUTO_9477 ?AUTO_9475 ) ( not ( = ?AUTO_9471 ?AUTO_9477 ) ) ( CAN_TRAVERSE ?AUTO_9480 ?AUTO_9476 ?AUTO_9475 ) ( VISIBLE ?AUTO_9476 ?AUTO_9475 ) ( not ( = ?AUTO_9474 ?AUTO_9476 ) ) ( not ( = ?AUTO_9473 ?AUTO_9476 ) ) ( not ( = ?AUTO_9475 ?AUTO_9476 ) ) ( CAN_TRAVERSE ?AUTO_9480 ?AUTO_9474 ?AUTO_9476 ) ( VISIBLE ?AUTO_9474 ?AUTO_9476 ) ( CAN_TRAVERSE ?AUTO_9480 ?AUTO_9481 ?AUTO_9474 ) ( AT ?AUTO_9480 ?AUTO_9481 ) ( VISIBLE ?AUTO_9481 ?AUTO_9474 ) ( not ( = ?AUTO_9474 ?AUTO_9481 ) ) ( not ( = ?AUTO_9473 ?AUTO_9481 ) ) ( not ( = ?AUTO_9475 ?AUTO_9481 ) ) ( not ( = ?AUTO_9476 ?AUTO_9481 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9480 ?AUTO_9481 ?AUTO_9474 )
      ( GET_IMAGE_DATA ?AUTO_9471 ?AUTO_9472 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9471 ?AUTO_9472 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9482 - OBJECTIVE
      ?AUTO_9483 - MODE
    )
    :vars
    (
      ?AUTO_9486 - LANDER
      ?AUTO_9487 - WAYPOINT
      ?AUTO_9489 - WAYPOINT
      ?AUTO_9485 - ROVER
      ?AUTO_9488 - WAYPOINT
      ?AUTO_9491 - CAMERA
      ?AUTO_9484 - OBJECTIVE
      ?AUTO_9490 - WAYPOINT
      ?AUTO_9492 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9486 ?AUTO_9487 ) ( VISIBLE ?AUTO_9489 ?AUTO_9487 ) ( AVAILABLE ?AUTO_9485 ) ( CHANNEL_FREE ?AUTO_9486 ) ( not ( = ?AUTO_9489 ?AUTO_9487 ) ) ( CAN_TRAVERSE ?AUTO_9485 ?AUTO_9488 ?AUTO_9489 ) ( VISIBLE ?AUTO_9488 ?AUTO_9489 ) ( not ( = ?AUTO_9487 ?AUTO_9488 ) ) ( not ( = ?AUTO_9489 ?AUTO_9488 ) ) ( ON_BOARD ?AUTO_9491 ?AUTO_9485 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9485 ) ( SUPPORTS ?AUTO_9491 ?AUTO_9483 ) ( VISIBLE_FROM ?AUTO_9482 ?AUTO_9488 ) ( CALIBRATION_TARGET ?AUTO_9491 ?AUTO_9484 ) ( VISIBLE_FROM ?AUTO_9484 ?AUTO_9488 ) ( not ( = ?AUTO_9482 ?AUTO_9484 ) ) ( CAN_TRAVERSE ?AUTO_9485 ?AUTO_9490 ?AUTO_9488 ) ( VISIBLE ?AUTO_9490 ?AUTO_9488 ) ( not ( = ?AUTO_9487 ?AUTO_9490 ) ) ( not ( = ?AUTO_9489 ?AUTO_9490 ) ) ( not ( = ?AUTO_9488 ?AUTO_9490 ) ) ( CAN_TRAVERSE ?AUTO_9485 ?AUTO_9487 ?AUTO_9490 ) ( VISIBLE ?AUTO_9487 ?AUTO_9490 ) ( CAN_TRAVERSE ?AUTO_9485 ?AUTO_9492 ?AUTO_9487 ) ( VISIBLE ?AUTO_9492 ?AUTO_9487 ) ( not ( = ?AUTO_9487 ?AUTO_9492 ) ) ( not ( = ?AUTO_9489 ?AUTO_9492 ) ) ( not ( = ?AUTO_9488 ?AUTO_9492 ) ) ( not ( = ?AUTO_9490 ?AUTO_9492 ) ) ( CAN_TRAVERSE ?AUTO_9485 ?AUTO_9489 ?AUTO_9492 ) ( AT ?AUTO_9485 ?AUTO_9489 ) ( VISIBLE ?AUTO_9489 ?AUTO_9492 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9485 ?AUTO_9489 ?AUTO_9492 )
      ( GET_IMAGE_DATA ?AUTO_9482 ?AUTO_9483 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9482 ?AUTO_9483 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9554 - OBJECTIVE
      ?AUTO_9555 - MODE
    )
    :vars
    (
      ?AUTO_9559 - LANDER
      ?AUTO_9557 - WAYPOINT
      ?AUTO_9560 - WAYPOINT
      ?AUTO_9558 - ROVER
      ?AUTO_9561 - CAMERA
      ?AUTO_9556 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9559 ?AUTO_9557 ) ( VISIBLE ?AUTO_9560 ?AUTO_9557 ) ( AVAILABLE ?AUTO_9558 ) ( CHANNEL_FREE ?AUTO_9559 ) ( not ( = ?AUTO_9560 ?AUTO_9557 ) ) ( CALIBRATED ?AUTO_9561 ?AUTO_9558 ) ( ON_BOARD ?AUTO_9561 ?AUTO_9558 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9558 ) ( SUPPORTS ?AUTO_9561 ?AUTO_9555 ) ( VISIBLE_FROM ?AUTO_9554 ?AUTO_9560 ) ( CAN_TRAVERSE ?AUTO_9558 ?AUTO_9556 ?AUTO_9560 ) ( VISIBLE ?AUTO_9556 ?AUTO_9560 ) ( not ( = ?AUTO_9557 ?AUTO_9556 ) ) ( not ( = ?AUTO_9560 ?AUTO_9556 ) ) ( CAN_TRAVERSE ?AUTO_9558 ?AUTO_9557 ?AUTO_9556 ) ( AT ?AUTO_9558 ?AUTO_9557 ) ( VISIBLE ?AUTO_9557 ?AUTO_9556 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9558 ?AUTO_9557 ?AUTO_9556 )
      ( GET_IMAGE_DATA ?AUTO_9554 ?AUTO_9555 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9554 ?AUTO_9555 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9564 - OBJECTIVE
      ?AUTO_9565 - MODE
    )
    :vars
    (
      ?AUTO_9566 - LANDER
      ?AUTO_9570 - WAYPOINT
      ?AUTO_9567 - WAYPOINT
      ?AUTO_9568 - ROVER
      ?AUTO_9571 - CAMERA
      ?AUTO_9569 - WAYPOINT
      ?AUTO_9572 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9566 ?AUTO_9570 ) ( VISIBLE ?AUTO_9567 ?AUTO_9570 ) ( AVAILABLE ?AUTO_9568 ) ( CHANNEL_FREE ?AUTO_9566 ) ( not ( = ?AUTO_9567 ?AUTO_9570 ) ) ( CALIBRATED ?AUTO_9571 ?AUTO_9568 ) ( ON_BOARD ?AUTO_9571 ?AUTO_9568 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9568 ) ( SUPPORTS ?AUTO_9571 ?AUTO_9565 ) ( VISIBLE_FROM ?AUTO_9564 ?AUTO_9567 ) ( CAN_TRAVERSE ?AUTO_9568 ?AUTO_9569 ?AUTO_9567 ) ( VISIBLE ?AUTO_9569 ?AUTO_9567 ) ( not ( = ?AUTO_9570 ?AUTO_9569 ) ) ( not ( = ?AUTO_9567 ?AUTO_9569 ) ) ( CAN_TRAVERSE ?AUTO_9568 ?AUTO_9570 ?AUTO_9569 ) ( VISIBLE ?AUTO_9570 ?AUTO_9569 ) ( CAN_TRAVERSE ?AUTO_9568 ?AUTO_9572 ?AUTO_9570 ) ( AT ?AUTO_9568 ?AUTO_9572 ) ( VISIBLE ?AUTO_9572 ?AUTO_9570 ) ( not ( = ?AUTO_9570 ?AUTO_9572 ) ) ( not ( = ?AUTO_9567 ?AUTO_9572 ) ) ( not ( = ?AUTO_9569 ?AUTO_9572 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9568 ?AUTO_9572 ?AUTO_9570 )
      ( GET_IMAGE_DATA ?AUTO_9564 ?AUTO_9565 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9564 ?AUTO_9565 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9579 - OBJECTIVE
      ?AUTO_9580 - MODE
    )
    :vars
    (
      ?AUTO_9586 - LANDER
      ?AUTO_9584 - WAYPOINT
      ?AUTO_9587 - WAYPOINT
      ?AUTO_9582 - ROVER
      ?AUTO_9585 - CAMERA
      ?AUTO_9581 - WAYPOINT
      ?AUTO_9583 - WAYPOINT
      ?AUTO_9588 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9586 ?AUTO_9584 ) ( VISIBLE ?AUTO_9587 ?AUTO_9584 ) ( AVAILABLE ?AUTO_9582 ) ( CHANNEL_FREE ?AUTO_9586 ) ( not ( = ?AUTO_9587 ?AUTO_9584 ) ) ( ON_BOARD ?AUTO_9585 ?AUTO_9582 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9582 ) ( SUPPORTS ?AUTO_9585 ?AUTO_9580 ) ( VISIBLE_FROM ?AUTO_9579 ?AUTO_9587 ) ( CAN_TRAVERSE ?AUTO_9582 ?AUTO_9581 ?AUTO_9587 ) ( VISIBLE ?AUTO_9581 ?AUTO_9587 ) ( not ( = ?AUTO_9584 ?AUTO_9581 ) ) ( not ( = ?AUTO_9587 ?AUTO_9581 ) ) ( CAN_TRAVERSE ?AUTO_9582 ?AUTO_9584 ?AUTO_9581 ) ( VISIBLE ?AUTO_9584 ?AUTO_9581 ) ( CAN_TRAVERSE ?AUTO_9582 ?AUTO_9583 ?AUTO_9584 ) ( AT ?AUTO_9582 ?AUTO_9583 ) ( VISIBLE ?AUTO_9583 ?AUTO_9584 ) ( not ( = ?AUTO_9584 ?AUTO_9583 ) ) ( not ( = ?AUTO_9587 ?AUTO_9583 ) ) ( not ( = ?AUTO_9581 ?AUTO_9583 ) ) ( CALIBRATION_TARGET ?AUTO_9585 ?AUTO_9588 ) ( VISIBLE_FROM ?AUTO_9588 ?AUTO_9583 ) ( not ( = ?AUTO_9579 ?AUTO_9588 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9582 ?AUTO_9585 ?AUTO_9588 ?AUTO_9583 )
      ( GET_IMAGE_DATA ?AUTO_9579 ?AUTO_9580 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9579 ?AUTO_9580 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9623 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9624 - LANDER
      ?AUTO_9627 - WAYPOINT
      ?AUTO_9625 - ROVER
      ?AUTO_9628 - STORE
      ?AUTO_9626 - WAYPOINT
      ?AUTO_9629 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9624 ?AUTO_9627 ) ( VISIBLE ?AUTO_9623 ?AUTO_9627 ) ( AVAILABLE ?AUTO_9625 ) ( CHANNEL_FREE ?AUTO_9624 ) ( not ( = ?AUTO_9623 ?AUTO_9627 ) ) ( AT_SOIL_SAMPLE ?AUTO_9623 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9625 ) ( STORE_OF ?AUTO_9628 ?AUTO_9625 ) ( CAN_TRAVERSE ?AUTO_9625 ?AUTO_9626 ?AUTO_9623 ) ( VISIBLE ?AUTO_9626 ?AUTO_9623 ) ( not ( = ?AUTO_9623 ?AUTO_9626 ) ) ( not ( = ?AUTO_9627 ?AUTO_9626 ) ) ( CAN_TRAVERSE ?AUTO_9625 ?AUTO_9627 ?AUTO_9626 ) ( VISIBLE ?AUTO_9627 ?AUTO_9626 ) ( FULL ?AUTO_9628 ) ( CAN_TRAVERSE ?AUTO_9625 ?AUTO_9629 ?AUTO_9627 ) ( AT ?AUTO_9625 ?AUTO_9629 ) ( VISIBLE ?AUTO_9629 ?AUTO_9627 ) ( not ( = ?AUTO_9623 ?AUTO_9629 ) ) ( not ( = ?AUTO_9627 ?AUTO_9629 ) ) ( not ( = ?AUTO_9626 ?AUTO_9629 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9625 ?AUTO_9629 ?AUTO_9627 )
      ( GET_SOIL_DATA ?AUTO_9623 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9623 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9631 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9635 - LANDER
      ?AUTO_9636 - WAYPOINT
      ?AUTO_9632 - ROVER
      ?AUTO_9633 - STORE
      ?AUTO_9637 - WAYPOINT
      ?AUTO_9634 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9635 ?AUTO_9636 ) ( VISIBLE ?AUTO_9631 ?AUTO_9636 ) ( AVAILABLE ?AUTO_9632 ) ( CHANNEL_FREE ?AUTO_9635 ) ( not ( = ?AUTO_9631 ?AUTO_9636 ) ) ( AT_SOIL_SAMPLE ?AUTO_9631 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9632 ) ( STORE_OF ?AUTO_9633 ?AUTO_9632 ) ( CAN_TRAVERSE ?AUTO_9632 ?AUTO_9637 ?AUTO_9631 ) ( VISIBLE ?AUTO_9637 ?AUTO_9631 ) ( not ( = ?AUTO_9631 ?AUTO_9637 ) ) ( not ( = ?AUTO_9636 ?AUTO_9637 ) ) ( CAN_TRAVERSE ?AUTO_9632 ?AUTO_9636 ?AUTO_9637 ) ( VISIBLE ?AUTO_9636 ?AUTO_9637 ) ( CAN_TRAVERSE ?AUTO_9632 ?AUTO_9634 ?AUTO_9636 ) ( AT ?AUTO_9632 ?AUTO_9634 ) ( VISIBLE ?AUTO_9634 ?AUTO_9636 ) ( not ( = ?AUTO_9631 ?AUTO_9634 ) ) ( not ( = ?AUTO_9636 ?AUTO_9634 ) ) ( not ( = ?AUTO_9637 ?AUTO_9634 ) ) ( AT_ROCK_SAMPLE ?AUTO_9634 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9632 ) ( EMPTY ?AUTO_9633 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_9632 ?AUTO_9633 ?AUTO_9634 )
      ( GET_SOIL_DATA ?AUTO_9631 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9631 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9677 - OBJECTIVE
      ?AUTO_9678 - MODE
    )
    :vars
    (
      ?AUTO_9683 - LANDER
      ?AUTO_9679 - WAYPOINT
      ?AUTO_9684 - WAYPOINT
      ?AUTO_9680 - ROVER
      ?AUTO_9681 - WAYPOINT
      ?AUTO_9682 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9683 ?AUTO_9679 ) ( VISIBLE ?AUTO_9684 ?AUTO_9679 ) ( AVAILABLE ?AUTO_9680 ) ( CHANNEL_FREE ?AUTO_9683 ) ( not ( = ?AUTO_9684 ?AUTO_9679 ) ) ( CAN_TRAVERSE ?AUTO_9680 ?AUTO_9681 ?AUTO_9684 ) ( VISIBLE ?AUTO_9681 ?AUTO_9684 ) ( not ( = ?AUTO_9679 ?AUTO_9681 ) ) ( not ( = ?AUTO_9684 ?AUTO_9681 ) ) ( ON_BOARD ?AUTO_9682 ?AUTO_9680 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9680 ) ( SUPPORTS ?AUTO_9682 ?AUTO_9678 ) ( VISIBLE_FROM ?AUTO_9677 ?AUTO_9681 ) ( CALIBRATION_TARGET ?AUTO_9682 ?AUTO_9677 ) ( CAN_TRAVERSE ?AUTO_9680 ?AUTO_9684 ?AUTO_9681 ) ( VISIBLE ?AUTO_9684 ?AUTO_9681 ) ( CAN_TRAVERSE ?AUTO_9680 ?AUTO_9679 ?AUTO_9684 ) ( AT ?AUTO_9680 ?AUTO_9679 ) ( VISIBLE ?AUTO_9679 ?AUTO_9684 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9680 ?AUTO_9679 ?AUTO_9684 )
      ( GET_IMAGE_DATA ?AUTO_9677 ?AUTO_9678 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9677 ?AUTO_9678 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9685 - OBJECTIVE
      ?AUTO_9686 - MODE
    )
    :vars
    (
      ?AUTO_9691 - LANDER
      ?AUTO_9687 - WAYPOINT
      ?AUTO_9692 - WAYPOINT
      ?AUTO_9690 - ROVER
      ?AUTO_9688 - WAYPOINT
      ?AUTO_9689 - CAMERA
      ?AUTO_9693 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9691 ?AUTO_9687 ) ( VISIBLE ?AUTO_9692 ?AUTO_9687 ) ( AVAILABLE ?AUTO_9690 ) ( CHANNEL_FREE ?AUTO_9691 ) ( not ( = ?AUTO_9692 ?AUTO_9687 ) ) ( CAN_TRAVERSE ?AUTO_9690 ?AUTO_9688 ?AUTO_9692 ) ( VISIBLE ?AUTO_9688 ?AUTO_9692 ) ( not ( = ?AUTO_9687 ?AUTO_9688 ) ) ( not ( = ?AUTO_9692 ?AUTO_9688 ) ) ( ON_BOARD ?AUTO_9689 ?AUTO_9690 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9690 ) ( SUPPORTS ?AUTO_9689 ?AUTO_9686 ) ( VISIBLE_FROM ?AUTO_9685 ?AUTO_9688 ) ( CALIBRATION_TARGET ?AUTO_9689 ?AUTO_9685 ) ( CAN_TRAVERSE ?AUTO_9690 ?AUTO_9692 ?AUTO_9688 ) ( VISIBLE ?AUTO_9692 ?AUTO_9688 ) ( CAN_TRAVERSE ?AUTO_9690 ?AUTO_9687 ?AUTO_9692 ) ( VISIBLE ?AUTO_9687 ?AUTO_9692 ) ( CAN_TRAVERSE ?AUTO_9690 ?AUTO_9693 ?AUTO_9687 ) ( AT ?AUTO_9690 ?AUTO_9693 ) ( VISIBLE ?AUTO_9693 ?AUTO_9687 ) ( not ( = ?AUTO_9687 ?AUTO_9693 ) ) ( not ( = ?AUTO_9692 ?AUTO_9693 ) ) ( not ( = ?AUTO_9688 ?AUTO_9693 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9690 ?AUTO_9693 ?AUTO_9687 )
      ( GET_IMAGE_DATA ?AUTO_9685 ?AUTO_9686 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9685 ?AUTO_9686 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9869 - OBJECTIVE
      ?AUTO_9870 - MODE
    )
    :vars
    (
      ?AUTO_9876 - LANDER
      ?AUTO_9874 - WAYPOINT
      ?AUTO_9875 - WAYPOINT
      ?AUTO_9877 - ROVER
      ?AUTO_9871 - CAMERA
      ?AUTO_9873 - WAYPOINT
      ?AUTO_9872 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9876 ?AUTO_9874 ) ( VISIBLE ?AUTO_9875 ?AUTO_9874 ) ( AVAILABLE ?AUTO_9877 ) ( CHANNEL_FREE ?AUTO_9876 ) ( not ( = ?AUTO_9875 ?AUTO_9874 ) ) ( ON_BOARD ?AUTO_9871 ?AUTO_9877 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9877 ) ( SUPPORTS ?AUTO_9871 ?AUTO_9870 ) ( VISIBLE_FROM ?AUTO_9869 ?AUTO_9875 ) ( CAN_TRAVERSE ?AUTO_9877 ?AUTO_9874 ?AUTO_9875 ) ( VISIBLE ?AUTO_9874 ?AUTO_9875 ) ( CAN_TRAVERSE ?AUTO_9877 ?AUTO_9873 ?AUTO_9874 ) ( VISIBLE ?AUTO_9873 ?AUTO_9874 ) ( not ( = ?AUTO_9874 ?AUTO_9873 ) ) ( not ( = ?AUTO_9875 ?AUTO_9873 ) ) ( CALIBRATION_TARGET ?AUTO_9871 ?AUTO_9872 ) ( VISIBLE_FROM ?AUTO_9872 ?AUTO_9873 ) ( not ( = ?AUTO_9869 ?AUTO_9872 ) ) ( CAN_TRAVERSE ?AUTO_9877 ?AUTO_9874 ?AUTO_9873 ) ( AT ?AUTO_9877 ?AUTO_9874 ) ( VISIBLE ?AUTO_9874 ?AUTO_9873 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9877 ?AUTO_9874 ?AUTO_9873 )
      ( GET_IMAGE_DATA ?AUTO_9869 ?AUTO_9870 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9869 ?AUTO_9870 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9926 - OBJECTIVE
      ?AUTO_9927 - MODE
    )
    :vars
    (
      ?AUTO_9931 - LANDER
      ?AUTO_9929 - WAYPOINT
      ?AUTO_9933 - WAYPOINT
      ?AUTO_9932 - ROVER
      ?AUTO_9930 - CAMERA
      ?AUTO_9934 - WAYPOINT
      ?AUTO_9928 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9931 ?AUTO_9929 ) ( VISIBLE ?AUTO_9933 ?AUTO_9929 ) ( AVAILABLE ?AUTO_9932 ) ( CHANNEL_FREE ?AUTO_9931 ) ( not ( = ?AUTO_9933 ?AUTO_9929 ) ) ( ON_BOARD ?AUTO_9930 ?AUTO_9932 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9932 ) ( SUPPORTS ?AUTO_9930 ?AUTO_9927 ) ( VISIBLE_FROM ?AUTO_9926 ?AUTO_9933 ) ( CAN_TRAVERSE ?AUTO_9932 ?AUTO_9929 ?AUTO_9933 ) ( VISIBLE ?AUTO_9929 ?AUTO_9933 ) ( CAN_TRAVERSE ?AUTO_9932 ?AUTO_9934 ?AUTO_9929 ) ( VISIBLE ?AUTO_9934 ?AUTO_9929 ) ( not ( = ?AUTO_9929 ?AUTO_9934 ) ) ( not ( = ?AUTO_9933 ?AUTO_9934 ) ) ( CALIBRATION_TARGET ?AUTO_9930 ?AUTO_9928 ) ( VISIBLE_FROM ?AUTO_9928 ?AUTO_9934 ) ( not ( = ?AUTO_9926 ?AUTO_9928 ) ) ( CAN_TRAVERSE ?AUTO_9932 ?AUTO_9929 ?AUTO_9934 ) ( VISIBLE ?AUTO_9929 ?AUTO_9934 ) ( CAN_TRAVERSE ?AUTO_9932 ?AUTO_9933 ?AUTO_9929 ) ( AT ?AUTO_9932 ?AUTO_9933 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9932 ?AUTO_9933 ?AUTO_9929 )
      ( GET_IMAGE_DATA ?AUTO_9926 ?AUTO_9927 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9926 ?AUTO_9927 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9968 - OBJECTIVE
      ?AUTO_9969 - MODE
    )
    :vars
    (
      ?AUTO_9972 - LANDER
      ?AUTO_9975 - WAYPOINT
      ?AUTO_9970 - WAYPOINT
      ?AUTO_9971 - ROVER
      ?AUTO_9973 - CAMERA
      ?AUTO_9974 - OBJECTIVE
      ?AUTO_9976 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9972 ?AUTO_9975 ) ( VISIBLE ?AUTO_9970 ?AUTO_9975 ) ( AVAILABLE ?AUTO_9971 ) ( CHANNEL_FREE ?AUTO_9972 ) ( not ( = ?AUTO_9970 ?AUTO_9975 ) ) ( CAN_TRAVERSE ?AUTO_9971 ?AUTO_9975 ?AUTO_9970 ) ( VISIBLE ?AUTO_9975 ?AUTO_9970 ) ( ON_BOARD ?AUTO_9973 ?AUTO_9971 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9971 ) ( SUPPORTS ?AUTO_9973 ?AUTO_9969 ) ( VISIBLE_FROM ?AUTO_9968 ?AUTO_9975 ) ( CALIBRATION_TARGET ?AUTO_9973 ?AUTO_9974 ) ( VISIBLE_FROM ?AUTO_9974 ?AUTO_9975 ) ( not ( = ?AUTO_9968 ?AUTO_9974 ) ) ( CAN_TRAVERSE ?AUTO_9971 ?AUTO_9976 ?AUTO_9975 ) ( AT ?AUTO_9971 ?AUTO_9976 ) ( VISIBLE ?AUTO_9976 ?AUTO_9975 ) ( not ( = ?AUTO_9975 ?AUTO_9976 ) ) ( not ( = ?AUTO_9970 ?AUTO_9976 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9971 ?AUTO_9976 ?AUTO_9975 )
      ( GET_IMAGE_DATA ?AUTO_9968 ?AUTO_9969 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9968 ?AUTO_9969 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10153 - OBJECTIVE
      ?AUTO_10154 - MODE
    )
    :vars
    (
      ?AUTO_10158 - LANDER
      ?AUTO_10159 - WAYPOINT
      ?AUTO_10157 - WAYPOINT
      ?AUTO_10155 - ROVER
      ?AUTO_10156 - WAYPOINT
      ?AUTO_10160 - CAMERA
      ?AUTO_10161 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10158 ?AUTO_10159 ) ( VISIBLE ?AUTO_10157 ?AUTO_10159 ) ( AVAILABLE ?AUTO_10155 ) ( CHANNEL_FREE ?AUTO_10158 ) ( not ( = ?AUTO_10157 ?AUTO_10159 ) ) ( CAN_TRAVERSE ?AUTO_10155 ?AUTO_10156 ?AUTO_10157 ) ( VISIBLE ?AUTO_10156 ?AUTO_10157 ) ( not ( = ?AUTO_10159 ?AUTO_10156 ) ) ( not ( = ?AUTO_10157 ?AUTO_10156 ) ) ( CALIBRATED ?AUTO_10160 ?AUTO_10155 ) ( ON_BOARD ?AUTO_10160 ?AUTO_10155 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10155 ) ( SUPPORTS ?AUTO_10160 ?AUTO_10154 ) ( VISIBLE_FROM ?AUTO_10153 ?AUTO_10156 ) ( CAN_TRAVERSE ?AUTO_10155 ?AUTO_10161 ?AUTO_10156 ) ( VISIBLE ?AUTO_10161 ?AUTO_10156 ) ( not ( = ?AUTO_10159 ?AUTO_10161 ) ) ( not ( = ?AUTO_10157 ?AUTO_10161 ) ) ( not ( = ?AUTO_10156 ?AUTO_10161 ) ) ( CAN_TRAVERSE ?AUTO_10155 ?AUTO_10157 ?AUTO_10161 ) ( AT ?AUTO_10155 ?AUTO_10157 ) ( VISIBLE ?AUTO_10157 ?AUTO_10161 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10155 ?AUTO_10157 ?AUTO_10161 )
      ( GET_IMAGE_DATA ?AUTO_10153 ?AUTO_10154 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10153 ?AUTO_10154 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10168 - OBJECTIVE
      ?AUTO_10169 - MODE
    )
    :vars
    (
      ?AUTO_10173 - LANDER
      ?AUTO_10170 - WAYPOINT
      ?AUTO_10172 - WAYPOINT
      ?AUTO_10175 - ROVER
      ?AUTO_10174 - WAYPOINT
      ?AUTO_10176 - CAMERA
      ?AUTO_10171 - WAYPOINT
      ?AUTO_10177 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10173 ?AUTO_10170 ) ( VISIBLE ?AUTO_10172 ?AUTO_10170 ) ( AVAILABLE ?AUTO_10175 ) ( CHANNEL_FREE ?AUTO_10173 ) ( not ( = ?AUTO_10172 ?AUTO_10170 ) ) ( CAN_TRAVERSE ?AUTO_10175 ?AUTO_10174 ?AUTO_10172 ) ( VISIBLE ?AUTO_10174 ?AUTO_10172 ) ( not ( = ?AUTO_10170 ?AUTO_10174 ) ) ( not ( = ?AUTO_10172 ?AUTO_10174 ) ) ( ON_BOARD ?AUTO_10176 ?AUTO_10175 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10175 ) ( SUPPORTS ?AUTO_10176 ?AUTO_10169 ) ( VISIBLE_FROM ?AUTO_10168 ?AUTO_10174 ) ( CAN_TRAVERSE ?AUTO_10175 ?AUTO_10171 ?AUTO_10174 ) ( VISIBLE ?AUTO_10171 ?AUTO_10174 ) ( not ( = ?AUTO_10170 ?AUTO_10171 ) ) ( not ( = ?AUTO_10172 ?AUTO_10171 ) ) ( not ( = ?AUTO_10174 ?AUTO_10171 ) ) ( CAN_TRAVERSE ?AUTO_10175 ?AUTO_10172 ?AUTO_10171 ) ( AT ?AUTO_10175 ?AUTO_10172 ) ( VISIBLE ?AUTO_10172 ?AUTO_10171 ) ( CALIBRATION_TARGET ?AUTO_10176 ?AUTO_10177 ) ( VISIBLE_FROM ?AUTO_10177 ?AUTO_10172 ) ( not ( = ?AUTO_10168 ?AUTO_10177 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10175 ?AUTO_10176 ?AUTO_10177 ?AUTO_10172 )
      ( GET_IMAGE_DATA ?AUTO_10168 ?AUTO_10169 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10168 ?AUTO_10169 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10428 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10429 - LANDER
      ?AUTO_10432 - WAYPOINT
      ?AUTO_10431 - ROVER
      ?AUTO_10430 - STORE
      ?AUTO_10433 - WAYPOINT
      ?AUTO_10434 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10429 ?AUTO_10428 ) ( VISIBLE ?AUTO_10432 ?AUTO_10428 ) ( AVAILABLE ?AUTO_10431 ) ( CHANNEL_FREE ?AUTO_10429 ) ( not ( = ?AUTO_10428 ?AUTO_10432 ) ) ( CAN_TRAVERSE ?AUTO_10431 ?AUTO_10428 ?AUTO_10432 ) ( VISIBLE ?AUTO_10428 ?AUTO_10432 ) ( AT_SOIL_SAMPLE ?AUTO_10428 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10431 ) ( STORE_OF ?AUTO_10430 ?AUTO_10431 ) ( CAN_TRAVERSE ?AUTO_10431 ?AUTO_10433 ?AUTO_10428 ) ( VISIBLE ?AUTO_10433 ?AUTO_10428 ) ( not ( = ?AUTO_10428 ?AUTO_10433 ) ) ( not ( = ?AUTO_10432 ?AUTO_10433 ) ) ( AT_ROCK_SAMPLE ?AUTO_10433 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10431 ) ( EMPTY ?AUTO_10430 ) ( CAN_TRAVERSE ?AUTO_10431 ?AUTO_10432 ?AUTO_10433 ) ( VISIBLE ?AUTO_10432 ?AUTO_10433 ) ( CAN_TRAVERSE ?AUTO_10431 ?AUTO_10434 ?AUTO_10432 ) ( AT ?AUTO_10431 ?AUTO_10434 ) ( VISIBLE ?AUTO_10434 ?AUTO_10432 ) ( not ( = ?AUTO_10428 ?AUTO_10434 ) ) ( not ( = ?AUTO_10432 ?AUTO_10434 ) ) ( not ( = ?AUTO_10433 ?AUTO_10434 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10431 ?AUTO_10434 ?AUTO_10432 )
      ( GET_SOIL_DATA ?AUTO_10428 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10428 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10561 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10567 - LANDER
      ?AUTO_10562 - WAYPOINT
      ?AUTO_10566 - WAYPOINT
      ?AUTO_10568 - ROVER
      ?AUTO_10565 - WAYPOINT
      ?AUTO_10563 - STORE
      ?AUTO_10564 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10567 ?AUTO_10562 ) ( VISIBLE ?AUTO_10566 ?AUTO_10562 ) ( AVAILABLE ?AUTO_10568 ) ( CHANNEL_FREE ?AUTO_10567 ) ( not ( = ?AUTO_10561 ?AUTO_10566 ) ) ( not ( = ?AUTO_10561 ?AUTO_10562 ) ) ( not ( = ?AUTO_10566 ?AUTO_10562 ) ) ( CAN_TRAVERSE ?AUTO_10568 ?AUTO_10565 ?AUTO_10566 ) ( VISIBLE ?AUTO_10565 ?AUTO_10566 ) ( not ( = ?AUTO_10561 ?AUTO_10565 ) ) ( not ( = ?AUTO_10562 ?AUTO_10565 ) ) ( not ( = ?AUTO_10566 ?AUTO_10565 ) ) ( CAN_TRAVERSE ?AUTO_10568 ?AUTO_10561 ?AUTO_10565 ) ( VISIBLE ?AUTO_10561 ?AUTO_10565 ) ( AT_ROCK_SAMPLE ?AUTO_10561 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10568 ) ( STORE_OF ?AUTO_10563 ?AUTO_10568 ) ( EMPTY ?AUTO_10563 ) ( CAN_TRAVERSE ?AUTO_10568 ?AUTO_10564 ?AUTO_10561 ) ( VISIBLE ?AUTO_10564 ?AUTO_10561 ) ( not ( = ?AUTO_10561 ?AUTO_10564 ) ) ( not ( = ?AUTO_10562 ?AUTO_10564 ) ) ( not ( = ?AUTO_10566 ?AUTO_10564 ) ) ( not ( = ?AUTO_10565 ?AUTO_10564 ) ) ( CAN_TRAVERSE ?AUTO_10568 ?AUTO_10566 ?AUTO_10564 ) ( AT ?AUTO_10568 ?AUTO_10566 ) ( VISIBLE ?AUTO_10566 ?AUTO_10564 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10568 ?AUTO_10566 ?AUTO_10564 )
      ( GET_ROCK_DATA ?AUTO_10561 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10561 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10615 - OBJECTIVE
      ?AUTO_10614 - MODE
    )
    :vars
    (
      ?AUTO_10617 - LANDER
      ?AUTO_10621 - WAYPOINT
      ?AUTO_10618 - WAYPOINT
      ?AUTO_10620 - ROVER
      ?AUTO_10616 - CAMERA
      ?AUTO_10622 - WAYPOINT
      ?AUTO_10619 - WAYPOINT
      ?AUTO_10623 - WAYPOINT
      ?AUTO_10624 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10617 ?AUTO_10621 ) ( VISIBLE ?AUTO_10618 ?AUTO_10621 ) ( AVAILABLE ?AUTO_10620 ) ( CHANNEL_FREE ?AUTO_10617 ) ( not ( = ?AUTO_10618 ?AUTO_10621 ) ) ( CALIBRATED ?AUTO_10616 ?AUTO_10620 ) ( ON_BOARD ?AUTO_10616 ?AUTO_10620 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10620 ) ( SUPPORTS ?AUTO_10616 ?AUTO_10614 ) ( VISIBLE_FROM ?AUTO_10615 ?AUTO_10618 ) ( CAN_TRAVERSE ?AUTO_10620 ?AUTO_10622 ?AUTO_10618 ) ( VISIBLE ?AUTO_10622 ?AUTO_10618 ) ( not ( = ?AUTO_10621 ?AUTO_10622 ) ) ( not ( = ?AUTO_10618 ?AUTO_10622 ) ) ( CAN_TRAVERSE ?AUTO_10620 ?AUTO_10619 ?AUTO_10622 ) ( VISIBLE ?AUTO_10619 ?AUTO_10622 ) ( not ( = ?AUTO_10621 ?AUTO_10619 ) ) ( not ( = ?AUTO_10618 ?AUTO_10619 ) ) ( not ( = ?AUTO_10622 ?AUTO_10619 ) ) ( CAN_TRAVERSE ?AUTO_10620 ?AUTO_10623 ?AUTO_10619 ) ( VISIBLE ?AUTO_10623 ?AUTO_10619 ) ( not ( = ?AUTO_10621 ?AUTO_10623 ) ) ( not ( = ?AUTO_10618 ?AUTO_10623 ) ) ( not ( = ?AUTO_10622 ?AUTO_10623 ) ) ( not ( = ?AUTO_10619 ?AUTO_10623 ) ) ( CAN_TRAVERSE ?AUTO_10620 ?AUTO_10624 ?AUTO_10623 ) ( AT ?AUTO_10620 ?AUTO_10624 ) ( VISIBLE ?AUTO_10624 ?AUTO_10623 ) ( not ( = ?AUTO_10621 ?AUTO_10624 ) ) ( not ( = ?AUTO_10618 ?AUTO_10624 ) ) ( not ( = ?AUTO_10622 ?AUTO_10624 ) ) ( not ( = ?AUTO_10619 ?AUTO_10624 ) ) ( not ( = ?AUTO_10623 ?AUTO_10624 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10620 ?AUTO_10624 ?AUTO_10623 )
      ( GET_IMAGE_DATA ?AUTO_10615 ?AUTO_10614 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10615 ?AUTO_10614 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10626 - OBJECTIVE
      ?AUTO_10625 - MODE
    )
    :vars
    (
      ?AUTO_10627 - LANDER
      ?AUTO_10633 - WAYPOINT
      ?AUTO_10635 - WAYPOINT
      ?AUTO_10632 - ROVER
      ?AUTO_10630 - CAMERA
      ?AUTO_10629 - WAYPOINT
      ?AUTO_10634 - WAYPOINT
      ?AUTO_10628 - WAYPOINT
      ?AUTO_10631 - WAYPOINT
      ?AUTO_10636 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10627 ?AUTO_10633 ) ( VISIBLE ?AUTO_10635 ?AUTO_10633 ) ( AVAILABLE ?AUTO_10632 ) ( CHANNEL_FREE ?AUTO_10627 ) ( not ( = ?AUTO_10635 ?AUTO_10633 ) ) ( ON_BOARD ?AUTO_10630 ?AUTO_10632 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10632 ) ( SUPPORTS ?AUTO_10630 ?AUTO_10625 ) ( VISIBLE_FROM ?AUTO_10626 ?AUTO_10635 ) ( CAN_TRAVERSE ?AUTO_10632 ?AUTO_10629 ?AUTO_10635 ) ( VISIBLE ?AUTO_10629 ?AUTO_10635 ) ( not ( = ?AUTO_10633 ?AUTO_10629 ) ) ( not ( = ?AUTO_10635 ?AUTO_10629 ) ) ( CAN_TRAVERSE ?AUTO_10632 ?AUTO_10634 ?AUTO_10629 ) ( VISIBLE ?AUTO_10634 ?AUTO_10629 ) ( not ( = ?AUTO_10633 ?AUTO_10634 ) ) ( not ( = ?AUTO_10635 ?AUTO_10634 ) ) ( not ( = ?AUTO_10629 ?AUTO_10634 ) ) ( CAN_TRAVERSE ?AUTO_10632 ?AUTO_10628 ?AUTO_10634 ) ( VISIBLE ?AUTO_10628 ?AUTO_10634 ) ( not ( = ?AUTO_10633 ?AUTO_10628 ) ) ( not ( = ?AUTO_10635 ?AUTO_10628 ) ) ( not ( = ?AUTO_10629 ?AUTO_10628 ) ) ( not ( = ?AUTO_10634 ?AUTO_10628 ) ) ( CAN_TRAVERSE ?AUTO_10632 ?AUTO_10631 ?AUTO_10628 ) ( AT ?AUTO_10632 ?AUTO_10631 ) ( VISIBLE ?AUTO_10631 ?AUTO_10628 ) ( not ( = ?AUTO_10633 ?AUTO_10631 ) ) ( not ( = ?AUTO_10635 ?AUTO_10631 ) ) ( not ( = ?AUTO_10629 ?AUTO_10631 ) ) ( not ( = ?AUTO_10634 ?AUTO_10631 ) ) ( not ( = ?AUTO_10628 ?AUTO_10631 ) ) ( CALIBRATION_TARGET ?AUTO_10630 ?AUTO_10636 ) ( VISIBLE_FROM ?AUTO_10636 ?AUTO_10631 ) ( not ( = ?AUTO_10626 ?AUTO_10636 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10632 ?AUTO_10630 ?AUTO_10636 ?AUTO_10631 )
      ( GET_IMAGE_DATA ?AUTO_10626 ?AUTO_10625 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10626 ?AUTO_10625 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10638 - OBJECTIVE
      ?AUTO_10637 - MODE
    )
    :vars
    (
      ?AUTO_10640 - LANDER
      ?AUTO_10646 - WAYPOINT
      ?AUTO_10643 - WAYPOINT
      ?AUTO_10645 - ROVER
      ?AUTO_10641 - CAMERA
      ?AUTO_10647 - WAYPOINT
      ?AUTO_10639 - WAYPOINT
      ?AUTO_10648 - WAYPOINT
      ?AUTO_10642 - WAYPOINT
      ?AUTO_10644 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10640 ?AUTO_10646 ) ( VISIBLE ?AUTO_10643 ?AUTO_10646 ) ( AVAILABLE ?AUTO_10645 ) ( CHANNEL_FREE ?AUTO_10640 ) ( not ( = ?AUTO_10643 ?AUTO_10646 ) ) ( ON_BOARD ?AUTO_10641 ?AUTO_10645 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10645 ) ( SUPPORTS ?AUTO_10641 ?AUTO_10637 ) ( VISIBLE_FROM ?AUTO_10638 ?AUTO_10643 ) ( CAN_TRAVERSE ?AUTO_10645 ?AUTO_10647 ?AUTO_10643 ) ( VISIBLE ?AUTO_10647 ?AUTO_10643 ) ( not ( = ?AUTO_10646 ?AUTO_10647 ) ) ( not ( = ?AUTO_10643 ?AUTO_10647 ) ) ( CAN_TRAVERSE ?AUTO_10645 ?AUTO_10639 ?AUTO_10647 ) ( VISIBLE ?AUTO_10639 ?AUTO_10647 ) ( not ( = ?AUTO_10646 ?AUTO_10639 ) ) ( not ( = ?AUTO_10643 ?AUTO_10639 ) ) ( not ( = ?AUTO_10647 ?AUTO_10639 ) ) ( CAN_TRAVERSE ?AUTO_10645 ?AUTO_10648 ?AUTO_10639 ) ( VISIBLE ?AUTO_10648 ?AUTO_10639 ) ( not ( = ?AUTO_10646 ?AUTO_10648 ) ) ( not ( = ?AUTO_10643 ?AUTO_10648 ) ) ( not ( = ?AUTO_10647 ?AUTO_10648 ) ) ( not ( = ?AUTO_10639 ?AUTO_10648 ) ) ( CAN_TRAVERSE ?AUTO_10645 ?AUTO_10642 ?AUTO_10648 ) ( VISIBLE ?AUTO_10642 ?AUTO_10648 ) ( not ( = ?AUTO_10646 ?AUTO_10642 ) ) ( not ( = ?AUTO_10643 ?AUTO_10642 ) ) ( not ( = ?AUTO_10647 ?AUTO_10642 ) ) ( not ( = ?AUTO_10639 ?AUTO_10642 ) ) ( not ( = ?AUTO_10648 ?AUTO_10642 ) ) ( CALIBRATION_TARGET ?AUTO_10641 ?AUTO_10644 ) ( VISIBLE_FROM ?AUTO_10644 ?AUTO_10642 ) ( not ( = ?AUTO_10638 ?AUTO_10644 ) ) ( CAN_TRAVERSE ?AUTO_10645 ?AUTO_10647 ?AUTO_10642 ) ( AT ?AUTO_10645 ?AUTO_10647 ) ( VISIBLE ?AUTO_10647 ?AUTO_10642 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10645 ?AUTO_10647 ?AUTO_10642 )
      ( GET_IMAGE_DATA ?AUTO_10638 ?AUTO_10637 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10638 ?AUTO_10637 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10652 - OBJECTIVE
      ?AUTO_10651 - MODE
    )
    :vars
    (
      ?AUTO_10661 - LANDER
      ?AUTO_10660 - WAYPOINT
      ?AUTO_10653 - WAYPOINT
      ?AUTO_10662 - ROVER
      ?AUTO_10658 - CAMERA
      ?AUTO_10656 - WAYPOINT
      ?AUTO_10659 - WAYPOINT
      ?AUTO_10657 - WAYPOINT
      ?AUTO_10654 - WAYPOINT
      ?AUTO_10655 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10661 ?AUTO_10660 ) ( VISIBLE ?AUTO_10653 ?AUTO_10660 ) ( AVAILABLE ?AUTO_10662 ) ( CHANNEL_FREE ?AUTO_10661 ) ( not ( = ?AUTO_10653 ?AUTO_10660 ) ) ( ON_BOARD ?AUTO_10658 ?AUTO_10662 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10662 ) ( SUPPORTS ?AUTO_10658 ?AUTO_10651 ) ( VISIBLE_FROM ?AUTO_10652 ?AUTO_10653 ) ( CAN_TRAVERSE ?AUTO_10662 ?AUTO_10656 ?AUTO_10653 ) ( VISIBLE ?AUTO_10656 ?AUTO_10653 ) ( not ( = ?AUTO_10660 ?AUTO_10656 ) ) ( not ( = ?AUTO_10653 ?AUTO_10656 ) ) ( CAN_TRAVERSE ?AUTO_10662 ?AUTO_10659 ?AUTO_10656 ) ( VISIBLE ?AUTO_10659 ?AUTO_10656 ) ( not ( = ?AUTO_10660 ?AUTO_10659 ) ) ( not ( = ?AUTO_10653 ?AUTO_10659 ) ) ( not ( = ?AUTO_10656 ?AUTO_10659 ) ) ( CAN_TRAVERSE ?AUTO_10662 ?AUTO_10657 ?AUTO_10659 ) ( VISIBLE ?AUTO_10657 ?AUTO_10659 ) ( not ( = ?AUTO_10660 ?AUTO_10657 ) ) ( not ( = ?AUTO_10653 ?AUTO_10657 ) ) ( not ( = ?AUTO_10656 ?AUTO_10657 ) ) ( not ( = ?AUTO_10659 ?AUTO_10657 ) ) ( CAN_TRAVERSE ?AUTO_10662 ?AUTO_10654 ?AUTO_10657 ) ( VISIBLE ?AUTO_10654 ?AUTO_10657 ) ( not ( = ?AUTO_10660 ?AUTO_10654 ) ) ( not ( = ?AUTO_10653 ?AUTO_10654 ) ) ( not ( = ?AUTO_10656 ?AUTO_10654 ) ) ( not ( = ?AUTO_10659 ?AUTO_10654 ) ) ( not ( = ?AUTO_10657 ?AUTO_10654 ) ) ( CALIBRATION_TARGET ?AUTO_10658 ?AUTO_10655 ) ( VISIBLE_FROM ?AUTO_10655 ?AUTO_10654 ) ( not ( = ?AUTO_10652 ?AUTO_10655 ) ) ( CAN_TRAVERSE ?AUTO_10662 ?AUTO_10656 ?AUTO_10654 ) ( VISIBLE ?AUTO_10656 ?AUTO_10654 ) ( AT ?AUTO_10662 ?AUTO_10659 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10662 ?AUTO_10659 ?AUTO_10656 )
      ( GET_IMAGE_DATA ?AUTO_10652 ?AUTO_10651 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10652 ?AUTO_10651 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10684 - OBJECTIVE
      ?AUTO_10683 - MODE
    )
    :vars
    (
      ?AUTO_10691 - LANDER
      ?AUTO_10692 - WAYPOINT
      ?AUTO_10690 - WAYPOINT
      ?AUTO_10694 - ROVER
      ?AUTO_10685 - CAMERA
      ?AUTO_10687 - WAYPOINT
      ?AUTO_10689 - WAYPOINT
      ?AUTO_10688 - WAYPOINT
      ?AUTO_10686 - WAYPOINT
      ?AUTO_10693 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10691 ?AUTO_10692 ) ( VISIBLE ?AUTO_10690 ?AUTO_10692 ) ( AVAILABLE ?AUTO_10694 ) ( CHANNEL_FREE ?AUTO_10691 ) ( not ( = ?AUTO_10690 ?AUTO_10692 ) ) ( ON_BOARD ?AUTO_10685 ?AUTO_10694 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10694 ) ( SUPPORTS ?AUTO_10685 ?AUTO_10683 ) ( VISIBLE_FROM ?AUTO_10684 ?AUTO_10690 ) ( CAN_TRAVERSE ?AUTO_10694 ?AUTO_10687 ?AUTO_10690 ) ( VISIBLE ?AUTO_10687 ?AUTO_10690 ) ( not ( = ?AUTO_10692 ?AUTO_10687 ) ) ( not ( = ?AUTO_10690 ?AUTO_10687 ) ) ( CAN_TRAVERSE ?AUTO_10694 ?AUTO_10689 ?AUTO_10687 ) ( VISIBLE ?AUTO_10689 ?AUTO_10687 ) ( not ( = ?AUTO_10692 ?AUTO_10689 ) ) ( not ( = ?AUTO_10690 ?AUTO_10689 ) ) ( not ( = ?AUTO_10687 ?AUTO_10689 ) ) ( CAN_TRAVERSE ?AUTO_10694 ?AUTO_10688 ?AUTO_10689 ) ( VISIBLE ?AUTO_10688 ?AUTO_10689 ) ( not ( = ?AUTO_10692 ?AUTO_10688 ) ) ( not ( = ?AUTO_10690 ?AUTO_10688 ) ) ( not ( = ?AUTO_10687 ?AUTO_10688 ) ) ( not ( = ?AUTO_10689 ?AUTO_10688 ) ) ( CAN_TRAVERSE ?AUTO_10694 ?AUTO_10686 ?AUTO_10688 ) ( VISIBLE ?AUTO_10686 ?AUTO_10688 ) ( not ( = ?AUTO_10692 ?AUTO_10686 ) ) ( not ( = ?AUTO_10690 ?AUTO_10686 ) ) ( not ( = ?AUTO_10687 ?AUTO_10686 ) ) ( not ( = ?AUTO_10689 ?AUTO_10686 ) ) ( not ( = ?AUTO_10688 ?AUTO_10686 ) ) ( CALIBRATION_TARGET ?AUTO_10685 ?AUTO_10693 ) ( VISIBLE_FROM ?AUTO_10693 ?AUTO_10686 ) ( not ( = ?AUTO_10684 ?AUTO_10693 ) ) ( CAN_TRAVERSE ?AUTO_10694 ?AUTO_10687 ?AUTO_10686 ) ( VISIBLE ?AUTO_10687 ?AUTO_10686 ) ( AT ?AUTO_10694 ?AUTO_10688 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10694 ?AUTO_10688 ?AUTO_10689 )
      ( GET_IMAGE_DATA ?AUTO_10684 ?AUTO_10683 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10684 ?AUTO_10683 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10696 - OBJECTIVE
      ?AUTO_10695 - MODE
    )
    :vars
    (
      ?AUTO_10700 - LANDER
      ?AUTO_10701 - WAYPOINT
      ?AUTO_10706 - WAYPOINT
      ?AUTO_10705 - ROVER
      ?AUTO_10702 - CAMERA
      ?AUTO_10698 - WAYPOINT
      ?AUTO_10699 - WAYPOINT
      ?AUTO_10697 - WAYPOINT
      ?AUTO_10703 - WAYPOINT
      ?AUTO_10704 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10700 ?AUTO_10701 ) ( VISIBLE ?AUTO_10706 ?AUTO_10701 ) ( AVAILABLE ?AUTO_10705 ) ( CHANNEL_FREE ?AUTO_10700 ) ( not ( = ?AUTO_10706 ?AUTO_10701 ) ) ( ON_BOARD ?AUTO_10702 ?AUTO_10705 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10705 ) ( SUPPORTS ?AUTO_10702 ?AUTO_10695 ) ( VISIBLE_FROM ?AUTO_10696 ?AUTO_10706 ) ( CAN_TRAVERSE ?AUTO_10705 ?AUTO_10698 ?AUTO_10706 ) ( VISIBLE ?AUTO_10698 ?AUTO_10706 ) ( not ( = ?AUTO_10701 ?AUTO_10698 ) ) ( not ( = ?AUTO_10706 ?AUTO_10698 ) ) ( CAN_TRAVERSE ?AUTO_10705 ?AUTO_10699 ?AUTO_10698 ) ( VISIBLE ?AUTO_10699 ?AUTO_10698 ) ( not ( = ?AUTO_10701 ?AUTO_10699 ) ) ( not ( = ?AUTO_10706 ?AUTO_10699 ) ) ( not ( = ?AUTO_10698 ?AUTO_10699 ) ) ( CAN_TRAVERSE ?AUTO_10705 ?AUTO_10697 ?AUTO_10699 ) ( VISIBLE ?AUTO_10697 ?AUTO_10699 ) ( not ( = ?AUTO_10701 ?AUTO_10697 ) ) ( not ( = ?AUTO_10706 ?AUTO_10697 ) ) ( not ( = ?AUTO_10698 ?AUTO_10697 ) ) ( not ( = ?AUTO_10699 ?AUTO_10697 ) ) ( CAN_TRAVERSE ?AUTO_10705 ?AUTO_10703 ?AUTO_10697 ) ( VISIBLE ?AUTO_10703 ?AUTO_10697 ) ( not ( = ?AUTO_10701 ?AUTO_10703 ) ) ( not ( = ?AUTO_10706 ?AUTO_10703 ) ) ( not ( = ?AUTO_10698 ?AUTO_10703 ) ) ( not ( = ?AUTO_10699 ?AUTO_10703 ) ) ( not ( = ?AUTO_10697 ?AUTO_10703 ) ) ( CALIBRATION_TARGET ?AUTO_10702 ?AUTO_10704 ) ( VISIBLE_FROM ?AUTO_10704 ?AUTO_10703 ) ( not ( = ?AUTO_10696 ?AUTO_10704 ) ) ( CAN_TRAVERSE ?AUTO_10705 ?AUTO_10698 ?AUTO_10703 ) ( VISIBLE ?AUTO_10698 ?AUTO_10703 ) ( CAN_TRAVERSE ?AUTO_10705 ?AUTO_10706 ?AUTO_10697 ) ( AT ?AUTO_10705 ?AUTO_10706 ) ( VISIBLE ?AUTO_10706 ?AUTO_10697 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10705 ?AUTO_10706 ?AUTO_10697 )
      ( GET_IMAGE_DATA ?AUTO_10696 ?AUTO_10695 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10696 ?AUTO_10695 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10813 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10815 - LANDER
      ?AUTO_10816 - WAYPOINT
      ?AUTO_10814 - ROVER
      ?AUTO_10817 - STORE
      ?AUTO_10818 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10815 ?AUTO_10816 ) ( VISIBLE ?AUTO_10813 ?AUTO_10816 ) ( AVAILABLE ?AUTO_10814 ) ( CHANNEL_FREE ?AUTO_10815 ) ( not ( = ?AUTO_10813 ?AUTO_10816 ) ) ( AT_SOIL_SAMPLE ?AUTO_10813 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10814 ) ( STORE_OF ?AUTO_10817 ?AUTO_10814 ) ( CAN_TRAVERSE ?AUTO_10814 ?AUTO_10818 ?AUTO_10813 ) ( AT ?AUTO_10814 ?AUTO_10818 ) ( VISIBLE ?AUTO_10818 ?AUTO_10813 ) ( not ( = ?AUTO_10813 ?AUTO_10818 ) ) ( not ( = ?AUTO_10816 ?AUTO_10818 ) ) ( AT_ROCK_SAMPLE ?AUTO_10818 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10814 ) ( EMPTY ?AUTO_10817 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_10814 ?AUTO_10817 ?AUTO_10818 )
      ( GET_SOIL_DATA ?AUTO_10813 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10813 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10838 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10840 - LANDER
      ?AUTO_10844 - WAYPOINT
      ?AUTO_10839 - ROVER
      ?AUTO_10842 - STORE
      ?AUTO_10841 - WAYPOINT
      ?AUTO_10843 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10840 ?AUTO_10844 ) ( VISIBLE ?AUTO_10838 ?AUTO_10844 ) ( AVAILABLE ?AUTO_10839 ) ( CHANNEL_FREE ?AUTO_10840 ) ( not ( = ?AUTO_10838 ?AUTO_10844 ) ) ( AT_SOIL_SAMPLE ?AUTO_10838 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10839 ) ( STORE_OF ?AUTO_10842 ?AUTO_10839 ) ( CAN_TRAVERSE ?AUTO_10839 ?AUTO_10841 ?AUTO_10838 ) ( VISIBLE ?AUTO_10841 ?AUTO_10838 ) ( not ( = ?AUTO_10838 ?AUTO_10841 ) ) ( not ( = ?AUTO_10844 ?AUTO_10841 ) ) ( CAN_TRAVERSE ?AUTO_10839 ?AUTO_10843 ?AUTO_10841 ) ( VISIBLE ?AUTO_10843 ?AUTO_10841 ) ( not ( = ?AUTO_10838 ?AUTO_10843 ) ) ( not ( = ?AUTO_10844 ?AUTO_10843 ) ) ( not ( = ?AUTO_10841 ?AUTO_10843 ) ) ( AT_SOIL_SAMPLE ?AUTO_10843 ) ( EMPTY ?AUTO_10842 ) ( CAN_TRAVERSE ?AUTO_10839 ?AUTO_10844 ?AUTO_10843 ) ( AT ?AUTO_10839 ?AUTO_10844 ) ( VISIBLE ?AUTO_10844 ?AUTO_10843 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10839 ?AUTO_10844 ?AUTO_10843 )
      ( GET_SOIL_DATA ?AUTO_10838 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10838 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10893 - OBJECTIVE
      ?AUTO_10894 - MODE
    )
    :vars
    (
      ?AUTO_10896 - LANDER
      ?AUTO_10895 - WAYPOINT
      ?AUTO_10899 - WAYPOINT
      ?AUTO_10898 - ROVER
      ?AUTO_10900 - WAYPOINT
      ?AUTO_10897 - CAMERA
      ?AUTO_10901 - WAYPOINT
      ?AUTO_10902 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10896 ?AUTO_10895 ) ( VISIBLE ?AUTO_10899 ?AUTO_10895 ) ( AVAILABLE ?AUTO_10898 ) ( CHANNEL_FREE ?AUTO_10896 ) ( not ( = ?AUTO_10899 ?AUTO_10895 ) ) ( CAN_TRAVERSE ?AUTO_10898 ?AUTO_10900 ?AUTO_10899 ) ( VISIBLE ?AUTO_10900 ?AUTO_10899 ) ( not ( = ?AUTO_10895 ?AUTO_10900 ) ) ( not ( = ?AUTO_10899 ?AUTO_10900 ) ) ( ON_BOARD ?AUTO_10897 ?AUTO_10898 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10898 ) ( SUPPORTS ?AUTO_10897 ?AUTO_10894 ) ( VISIBLE_FROM ?AUTO_10893 ?AUTO_10900 ) ( CALIBRATION_TARGET ?AUTO_10897 ?AUTO_10893 ) ( CAN_TRAVERSE ?AUTO_10898 ?AUTO_10899 ?AUTO_10900 ) ( VISIBLE ?AUTO_10899 ?AUTO_10900 ) ( CAN_TRAVERSE ?AUTO_10898 ?AUTO_10901 ?AUTO_10899 ) ( VISIBLE ?AUTO_10901 ?AUTO_10899 ) ( not ( = ?AUTO_10895 ?AUTO_10901 ) ) ( not ( = ?AUTO_10899 ?AUTO_10901 ) ) ( not ( = ?AUTO_10900 ?AUTO_10901 ) ) ( CAN_TRAVERSE ?AUTO_10898 ?AUTO_10902 ?AUTO_10901 ) ( AT ?AUTO_10898 ?AUTO_10902 ) ( VISIBLE ?AUTO_10902 ?AUTO_10901 ) ( not ( = ?AUTO_10895 ?AUTO_10902 ) ) ( not ( = ?AUTO_10899 ?AUTO_10902 ) ) ( not ( = ?AUTO_10900 ?AUTO_10902 ) ) ( not ( = ?AUTO_10901 ?AUTO_10902 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10898 ?AUTO_10902 ?AUTO_10901 )
      ( GET_IMAGE_DATA ?AUTO_10893 ?AUTO_10894 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10893 ?AUTO_10894 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10978 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10979 - LANDER
      ?AUTO_10982 - WAYPOINT
      ?AUTO_10984 - WAYPOINT
      ?AUTO_10980 - ROVER
      ?AUTO_10983 - STORE
      ?AUTO_10981 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10979 ?AUTO_10982 ) ( VISIBLE ?AUTO_10984 ?AUTO_10982 ) ( AVAILABLE ?AUTO_10980 ) ( CHANNEL_FREE ?AUTO_10979 ) ( not ( = ?AUTO_10978 ?AUTO_10984 ) ) ( not ( = ?AUTO_10978 ?AUTO_10982 ) ) ( not ( = ?AUTO_10984 ?AUTO_10982 ) ) ( CAN_TRAVERSE ?AUTO_10980 ?AUTO_10978 ?AUTO_10984 ) ( VISIBLE ?AUTO_10978 ?AUTO_10984 ) ( AT_SOIL_SAMPLE ?AUTO_10978 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10980 ) ( STORE_OF ?AUTO_10983 ?AUTO_10980 ) ( CAN_TRAVERSE ?AUTO_10980 ?AUTO_10984 ?AUTO_10978 ) ( VISIBLE ?AUTO_10984 ?AUTO_10978 ) ( CAN_TRAVERSE ?AUTO_10980 ?AUTO_10981 ?AUTO_10984 ) ( VISIBLE ?AUTO_10981 ?AUTO_10984 ) ( not ( = ?AUTO_10978 ?AUTO_10981 ) ) ( not ( = ?AUTO_10982 ?AUTO_10981 ) ) ( not ( = ?AUTO_10984 ?AUTO_10981 ) ) ( AT_SOIL_SAMPLE ?AUTO_10981 ) ( EMPTY ?AUTO_10983 ) ( CAN_TRAVERSE ?AUTO_10980 ?AUTO_10982 ?AUTO_10981 ) ( AT ?AUTO_10980 ?AUTO_10982 ) ( VISIBLE ?AUTO_10982 ?AUTO_10981 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10980 ?AUTO_10982 ?AUTO_10981 )
      ( GET_SOIL_DATA ?AUTO_10978 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10978 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11023 - OBJECTIVE
      ?AUTO_11024 - MODE
    )
    :vars
    (
      ?AUTO_11027 - LANDER
      ?AUTO_11029 - WAYPOINT
      ?AUTO_11028 - WAYPOINT
      ?AUTO_11030 - ROVER
      ?AUTO_11025 - CAMERA
      ?AUTO_11026 - OBJECTIVE
      ?AUTO_11031 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11027 ?AUTO_11029 ) ( VISIBLE ?AUTO_11028 ?AUTO_11029 ) ( AVAILABLE ?AUTO_11030 ) ( CHANNEL_FREE ?AUTO_11027 ) ( not ( = ?AUTO_11028 ?AUTO_11029 ) ) ( ON_BOARD ?AUTO_11025 ?AUTO_11030 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11030 ) ( SUPPORTS ?AUTO_11025 ?AUTO_11024 ) ( VISIBLE_FROM ?AUTO_11023 ?AUTO_11028 ) ( CAN_TRAVERSE ?AUTO_11030 ?AUTO_11029 ?AUTO_11028 ) ( VISIBLE ?AUTO_11029 ?AUTO_11028 ) ( CALIBRATION_TARGET ?AUTO_11025 ?AUTO_11026 ) ( VISIBLE_FROM ?AUTO_11026 ?AUTO_11029 ) ( not ( = ?AUTO_11023 ?AUTO_11026 ) ) ( CAN_TRAVERSE ?AUTO_11030 ?AUTO_11028 ?AUTO_11029 ) ( CAN_TRAVERSE ?AUTO_11030 ?AUTO_11031 ?AUTO_11028 ) ( AT ?AUTO_11030 ?AUTO_11031 ) ( VISIBLE ?AUTO_11031 ?AUTO_11028 ) ( not ( = ?AUTO_11029 ?AUTO_11031 ) ) ( not ( = ?AUTO_11028 ?AUTO_11031 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11030 ?AUTO_11031 ?AUTO_11028 )
      ( GET_IMAGE_DATA ?AUTO_11023 ?AUTO_11024 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11023 ?AUTO_11024 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11032 - OBJECTIVE
      ?AUTO_11033 - MODE
    )
    :vars
    (
      ?AUTO_11038 - LANDER
      ?AUTO_11035 - WAYPOINT
      ?AUTO_11036 - WAYPOINT
      ?AUTO_11037 - ROVER
      ?AUTO_11034 - CAMERA
      ?AUTO_11040 - OBJECTIVE
      ?AUTO_11039 - WAYPOINT
      ?AUTO_11041 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11038 ?AUTO_11035 ) ( VISIBLE ?AUTO_11036 ?AUTO_11035 ) ( AVAILABLE ?AUTO_11037 ) ( CHANNEL_FREE ?AUTO_11038 ) ( not ( = ?AUTO_11036 ?AUTO_11035 ) ) ( ON_BOARD ?AUTO_11034 ?AUTO_11037 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11037 ) ( SUPPORTS ?AUTO_11034 ?AUTO_11033 ) ( VISIBLE_FROM ?AUTO_11032 ?AUTO_11036 ) ( CAN_TRAVERSE ?AUTO_11037 ?AUTO_11035 ?AUTO_11036 ) ( VISIBLE ?AUTO_11035 ?AUTO_11036 ) ( CALIBRATION_TARGET ?AUTO_11034 ?AUTO_11040 ) ( VISIBLE_FROM ?AUTO_11040 ?AUTO_11035 ) ( not ( = ?AUTO_11032 ?AUTO_11040 ) ) ( CAN_TRAVERSE ?AUTO_11037 ?AUTO_11036 ?AUTO_11035 ) ( CAN_TRAVERSE ?AUTO_11037 ?AUTO_11039 ?AUTO_11036 ) ( VISIBLE ?AUTO_11039 ?AUTO_11036 ) ( not ( = ?AUTO_11035 ?AUTO_11039 ) ) ( not ( = ?AUTO_11036 ?AUTO_11039 ) ) ( CAN_TRAVERSE ?AUTO_11037 ?AUTO_11041 ?AUTO_11039 ) ( AT ?AUTO_11037 ?AUTO_11041 ) ( VISIBLE ?AUTO_11041 ?AUTO_11039 ) ( not ( = ?AUTO_11035 ?AUTO_11041 ) ) ( not ( = ?AUTO_11036 ?AUTO_11041 ) ) ( not ( = ?AUTO_11039 ?AUTO_11041 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11037 ?AUTO_11041 ?AUTO_11039 )
      ( GET_IMAGE_DATA ?AUTO_11032 ?AUTO_11033 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11032 ?AUTO_11033 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11085 - OBJECTIVE
      ?AUTO_11086 - MODE
    )
    :vars
    (
      ?AUTO_11089 - LANDER
      ?AUTO_11088 - WAYPOINT
      ?AUTO_11091 - WAYPOINT
      ?AUTO_11093 - ROVER
      ?AUTO_11087 - WAYPOINT
      ?AUTO_11092 - WAYPOINT
      ?AUTO_11090 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11089 ?AUTO_11088 ) ( VISIBLE ?AUTO_11091 ?AUTO_11088 ) ( AVAILABLE ?AUTO_11093 ) ( CHANNEL_FREE ?AUTO_11089 ) ( not ( = ?AUTO_11091 ?AUTO_11088 ) ) ( CAN_TRAVERSE ?AUTO_11093 ?AUTO_11087 ?AUTO_11091 ) ( VISIBLE ?AUTO_11087 ?AUTO_11091 ) ( not ( = ?AUTO_11088 ?AUTO_11087 ) ) ( not ( = ?AUTO_11091 ?AUTO_11087 ) ) ( CAN_TRAVERSE ?AUTO_11093 ?AUTO_11092 ?AUTO_11087 ) ( AT ?AUTO_11093 ?AUTO_11092 ) ( VISIBLE ?AUTO_11092 ?AUTO_11087 ) ( not ( = ?AUTO_11088 ?AUTO_11092 ) ) ( not ( = ?AUTO_11091 ?AUTO_11092 ) ) ( not ( = ?AUTO_11087 ?AUTO_11092 ) ) ( ON_BOARD ?AUTO_11090 ?AUTO_11093 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11093 ) ( SUPPORTS ?AUTO_11090 ?AUTO_11086 ) ( VISIBLE_FROM ?AUTO_11085 ?AUTO_11092 ) ( CALIBRATION_TARGET ?AUTO_11090 ?AUTO_11085 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_11093 ?AUTO_11090 ?AUTO_11085 ?AUTO_11092 )
      ( GET_IMAGE_DATA ?AUTO_11085 ?AUTO_11086 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11085 ?AUTO_11086 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11094 - OBJECTIVE
      ?AUTO_11095 - MODE
    )
    :vars
    (
      ?AUTO_11099 - LANDER
      ?AUTO_11097 - WAYPOINT
      ?AUTO_11102 - WAYPOINT
      ?AUTO_11100 - ROVER
      ?AUTO_11101 - WAYPOINT
      ?AUTO_11098 - WAYPOINT
      ?AUTO_11096 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11099 ?AUTO_11097 ) ( VISIBLE ?AUTO_11102 ?AUTO_11097 ) ( AVAILABLE ?AUTO_11100 ) ( CHANNEL_FREE ?AUTO_11099 ) ( not ( = ?AUTO_11102 ?AUTO_11097 ) ) ( CAN_TRAVERSE ?AUTO_11100 ?AUTO_11101 ?AUTO_11102 ) ( VISIBLE ?AUTO_11101 ?AUTO_11102 ) ( not ( = ?AUTO_11097 ?AUTO_11101 ) ) ( not ( = ?AUTO_11102 ?AUTO_11101 ) ) ( CAN_TRAVERSE ?AUTO_11100 ?AUTO_11098 ?AUTO_11101 ) ( VISIBLE ?AUTO_11098 ?AUTO_11101 ) ( not ( = ?AUTO_11097 ?AUTO_11098 ) ) ( not ( = ?AUTO_11102 ?AUTO_11098 ) ) ( not ( = ?AUTO_11101 ?AUTO_11098 ) ) ( ON_BOARD ?AUTO_11096 ?AUTO_11100 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11100 ) ( SUPPORTS ?AUTO_11096 ?AUTO_11095 ) ( VISIBLE_FROM ?AUTO_11094 ?AUTO_11098 ) ( CALIBRATION_TARGET ?AUTO_11096 ?AUTO_11094 ) ( CAN_TRAVERSE ?AUTO_11100 ?AUTO_11102 ?AUTO_11098 ) ( AT ?AUTO_11100 ?AUTO_11102 ) ( VISIBLE ?AUTO_11102 ?AUTO_11098 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11100 ?AUTO_11102 ?AUTO_11098 )
      ( GET_IMAGE_DATA ?AUTO_11094 ?AUTO_11095 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11094 ?AUTO_11095 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11107 - OBJECTIVE
      ?AUTO_11108 - MODE
    )
    :vars
    (
      ?AUTO_11109 - LANDER
      ?AUTO_11112 - WAYPOINT
      ?AUTO_11114 - WAYPOINT
      ?AUTO_11115 - ROVER
      ?AUTO_11110 - WAYPOINT
      ?AUTO_11111 - WAYPOINT
      ?AUTO_11113 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11109 ?AUTO_11112 ) ( VISIBLE ?AUTO_11114 ?AUTO_11112 ) ( AVAILABLE ?AUTO_11115 ) ( CHANNEL_FREE ?AUTO_11109 ) ( not ( = ?AUTO_11114 ?AUTO_11112 ) ) ( CAN_TRAVERSE ?AUTO_11115 ?AUTO_11110 ?AUTO_11114 ) ( VISIBLE ?AUTO_11110 ?AUTO_11114 ) ( not ( = ?AUTO_11112 ?AUTO_11110 ) ) ( not ( = ?AUTO_11114 ?AUTO_11110 ) ) ( CAN_TRAVERSE ?AUTO_11115 ?AUTO_11111 ?AUTO_11110 ) ( VISIBLE ?AUTO_11111 ?AUTO_11110 ) ( not ( = ?AUTO_11112 ?AUTO_11111 ) ) ( not ( = ?AUTO_11114 ?AUTO_11111 ) ) ( not ( = ?AUTO_11110 ?AUTO_11111 ) ) ( ON_BOARD ?AUTO_11113 ?AUTO_11115 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11115 ) ( SUPPORTS ?AUTO_11113 ?AUTO_11108 ) ( VISIBLE_FROM ?AUTO_11107 ?AUTO_11111 ) ( CALIBRATION_TARGET ?AUTO_11113 ?AUTO_11107 ) ( CAN_TRAVERSE ?AUTO_11115 ?AUTO_11114 ?AUTO_11111 ) ( VISIBLE ?AUTO_11114 ?AUTO_11111 ) ( CAN_TRAVERSE ?AUTO_11115 ?AUTO_11112 ?AUTO_11114 ) ( AT ?AUTO_11115 ?AUTO_11112 ) ( VISIBLE ?AUTO_11112 ?AUTO_11114 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11115 ?AUTO_11112 ?AUTO_11114 )
      ( GET_IMAGE_DATA ?AUTO_11107 ?AUTO_11108 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11107 ?AUTO_11108 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11262 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11266 - LANDER
      ?AUTO_11268 - WAYPOINT
      ?AUTO_11269 - WAYPOINT
      ?AUTO_11264 - ROVER
      ?AUTO_11265 - STORE
      ?AUTO_11263 - WAYPOINT
      ?AUTO_11267 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11266 ?AUTO_11268 ) ( VISIBLE ?AUTO_11269 ?AUTO_11268 ) ( AVAILABLE ?AUTO_11264 ) ( CHANNEL_FREE ?AUTO_11266 ) ( not ( = ?AUTO_11262 ?AUTO_11269 ) ) ( not ( = ?AUTO_11262 ?AUTO_11268 ) ) ( not ( = ?AUTO_11269 ?AUTO_11268 ) ) ( CAN_TRAVERSE ?AUTO_11264 ?AUTO_11262 ?AUTO_11269 ) ( VISIBLE ?AUTO_11262 ?AUTO_11269 ) ( AT_SOIL_SAMPLE ?AUTO_11262 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11264 ) ( STORE_OF ?AUTO_11265 ?AUTO_11264 ) ( CAN_TRAVERSE ?AUTO_11264 ?AUTO_11263 ?AUTO_11262 ) ( VISIBLE ?AUTO_11263 ?AUTO_11262 ) ( not ( = ?AUTO_11262 ?AUTO_11263 ) ) ( not ( = ?AUTO_11268 ?AUTO_11263 ) ) ( not ( = ?AUTO_11269 ?AUTO_11263 ) ) ( CAN_TRAVERSE ?AUTO_11264 ?AUTO_11267 ?AUTO_11263 ) ( AT ?AUTO_11264 ?AUTO_11267 ) ( VISIBLE ?AUTO_11267 ?AUTO_11263 ) ( not ( = ?AUTO_11262 ?AUTO_11267 ) ) ( not ( = ?AUTO_11268 ?AUTO_11267 ) ) ( not ( = ?AUTO_11269 ?AUTO_11267 ) ) ( not ( = ?AUTO_11263 ?AUTO_11267 ) ) ( FULL ?AUTO_11265 ) )
    :subtasks
    ( ( !DROP ?AUTO_11264 ?AUTO_11265 )
      ( GET_SOIL_DATA ?AUTO_11262 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11262 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11273 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11275 - LANDER
      ?AUTO_11276 - WAYPOINT
      ?AUTO_11279 - WAYPOINT
      ?AUTO_11277 - ROVER
      ?AUTO_11278 - STORE
      ?AUTO_11280 - WAYPOINT
      ?AUTO_11274 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11275 ?AUTO_11276 ) ( VISIBLE ?AUTO_11279 ?AUTO_11276 ) ( AVAILABLE ?AUTO_11277 ) ( CHANNEL_FREE ?AUTO_11275 ) ( not ( = ?AUTO_11273 ?AUTO_11279 ) ) ( not ( = ?AUTO_11273 ?AUTO_11276 ) ) ( not ( = ?AUTO_11279 ?AUTO_11276 ) ) ( CAN_TRAVERSE ?AUTO_11277 ?AUTO_11273 ?AUTO_11279 ) ( VISIBLE ?AUTO_11273 ?AUTO_11279 ) ( AT_SOIL_SAMPLE ?AUTO_11273 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11277 ) ( STORE_OF ?AUTO_11278 ?AUTO_11277 ) ( CAN_TRAVERSE ?AUTO_11277 ?AUTO_11280 ?AUTO_11273 ) ( VISIBLE ?AUTO_11280 ?AUTO_11273 ) ( not ( = ?AUTO_11273 ?AUTO_11280 ) ) ( not ( = ?AUTO_11276 ?AUTO_11280 ) ) ( not ( = ?AUTO_11279 ?AUTO_11280 ) ) ( CAN_TRAVERSE ?AUTO_11277 ?AUTO_11274 ?AUTO_11280 ) ( VISIBLE ?AUTO_11274 ?AUTO_11280 ) ( not ( = ?AUTO_11273 ?AUTO_11274 ) ) ( not ( = ?AUTO_11276 ?AUTO_11274 ) ) ( not ( = ?AUTO_11279 ?AUTO_11274 ) ) ( not ( = ?AUTO_11280 ?AUTO_11274 ) ) ( FULL ?AUTO_11278 ) ( CAN_TRAVERSE ?AUTO_11277 ?AUTO_11279 ?AUTO_11274 ) ( AT ?AUTO_11277 ?AUTO_11279 ) ( VISIBLE ?AUTO_11279 ?AUTO_11274 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11277 ?AUTO_11279 ?AUTO_11274 )
      ( GET_SOIL_DATA ?AUTO_11273 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11273 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11282 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11287 - LANDER
      ?AUTO_11288 - WAYPOINT
      ?AUTO_11286 - WAYPOINT
      ?AUTO_11285 - ROVER
      ?AUTO_11289 - STORE
      ?AUTO_11284 - WAYPOINT
      ?AUTO_11283 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11287 ?AUTO_11288 ) ( VISIBLE ?AUTO_11286 ?AUTO_11288 ) ( AVAILABLE ?AUTO_11285 ) ( CHANNEL_FREE ?AUTO_11287 ) ( not ( = ?AUTO_11282 ?AUTO_11286 ) ) ( not ( = ?AUTO_11282 ?AUTO_11288 ) ) ( not ( = ?AUTO_11286 ?AUTO_11288 ) ) ( CAN_TRAVERSE ?AUTO_11285 ?AUTO_11282 ?AUTO_11286 ) ( VISIBLE ?AUTO_11282 ?AUTO_11286 ) ( AT_SOIL_SAMPLE ?AUTO_11282 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11285 ) ( STORE_OF ?AUTO_11289 ?AUTO_11285 ) ( CAN_TRAVERSE ?AUTO_11285 ?AUTO_11284 ?AUTO_11282 ) ( VISIBLE ?AUTO_11284 ?AUTO_11282 ) ( not ( = ?AUTO_11282 ?AUTO_11284 ) ) ( not ( = ?AUTO_11288 ?AUTO_11284 ) ) ( not ( = ?AUTO_11286 ?AUTO_11284 ) ) ( CAN_TRAVERSE ?AUTO_11285 ?AUTO_11283 ?AUTO_11284 ) ( VISIBLE ?AUTO_11283 ?AUTO_11284 ) ( not ( = ?AUTO_11282 ?AUTO_11283 ) ) ( not ( = ?AUTO_11288 ?AUTO_11283 ) ) ( not ( = ?AUTO_11286 ?AUTO_11283 ) ) ( not ( = ?AUTO_11284 ?AUTO_11283 ) ) ( CAN_TRAVERSE ?AUTO_11285 ?AUTO_11286 ?AUTO_11283 ) ( AT ?AUTO_11285 ?AUTO_11286 ) ( VISIBLE ?AUTO_11286 ?AUTO_11283 ) ( AT_ROCK_SAMPLE ?AUTO_11286 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11285 ) ( EMPTY ?AUTO_11289 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11285 ?AUTO_11289 ?AUTO_11286 )
      ( GET_SOIL_DATA ?AUTO_11282 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11282 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11325 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11331 - LANDER
      ?AUTO_11329 - WAYPOINT
      ?AUTO_11326 - WAYPOINT
      ?AUTO_11327 - ROVER
      ?AUTO_11330 - WAYPOINT
      ?AUTO_11328 - STORE
      ?AUTO_11332 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11331 ?AUTO_11329 ) ( VISIBLE ?AUTO_11326 ?AUTO_11329 ) ( AVAILABLE ?AUTO_11327 ) ( CHANNEL_FREE ?AUTO_11331 ) ( not ( = ?AUTO_11325 ?AUTO_11326 ) ) ( not ( = ?AUTO_11325 ?AUTO_11329 ) ) ( not ( = ?AUTO_11326 ?AUTO_11329 ) ) ( CAN_TRAVERSE ?AUTO_11327 ?AUTO_11330 ?AUTO_11326 ) ( VISIBLE ?AUTO_11330 ?AUTO_11326 ) ( not ( = ?AUTO_11325 ?AUTO_11330 ) ) ( not ( = ?AUTO_11329 ?AUTO_11330 ) ) ( not ( = ?AUTO_11326 ?AUTO_11330 ) ) ( CAN_TRAVERSE ?AUTO_11327 ?AUTO_11325 ?AUTO_11330 ) ( VISIBLE ?AUTO_11325 ?AUTO_11330 ) ( AT_SOIL_SAMPLE ?AUTO_11325 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11327 ) ( STORE_OF ?AUTO_11328 ?AUTO_11327 ) ( EMPTY ?AUTO_11328 ) ( CAN_TRAVERSE ?AUTO_11327 ?AUTO_11332 ?AUTO_11325 ) ( AT ?AUTO_11327 ?AUTO_11332 ) ( VISIBLE ?AUTO_11332 ?AUTO_11325 ) ( not ( = ?AUTO_11325 ?AUTO_11332 ) ) ( not ( = ?AUTO_11329 ?AUTO_11332 ) ) ( not ( = ?AUTO_11326 ?AUTO_11332 ) ) ( not ( = ?AUTO_11330 ?AUTO_11332 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11327 ?AUTO_11332 ?AUTO_11325 )
      ( GET_SOIL_DATA ?AUTO_11325 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11325 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11333 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11339 - LANDER
      ?AUTO_11336 - WAYPOINT
      ?AUTO_11335 - WAYPOINT
      ?AUTO_11337 - ROVER
      ?AUTO_11334 - WAYPOINT
      ?AUTO_11338 - STORE
      ?AUTO_11340 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11339 ?AUTO_11336 ) ( VISIBLE ?AUTO_11335 ?AUTO_11336 ) ( AVAILABLE ?AUTO_11337 ) ( CHANNEL_FREE ?AUTO_11339 ) ( not ( = ?AUTO_11333 ?AUTO_11335 ) ) ( not ( = ?AUTO_11333 ?AUTO_11336 ) ) ( not ( = ?AUTO_11335 ?AUTO_11336 ) ) ( CAN_TRAVERSE ?AUTO_11337 ?AUTO_11334 ?AUTO_11335 ) ( VISIBLE ?AUTO_11334 ?AUTO_11335 ) ( not ( = ?AUTO_11333 ?AUTO_11334 ) ) ( not ( = ?AUTO_11336 ?AUTO_11334 ) ) ( not ( = ?AUTO_11335 ?AUTO_11334 ) ) ( CAN_TRAVERSE ?AUTO_11337 ?AUTO_11333 ?AUTO_11334 ) ( VISIBLE ?AUTO_11333 ?AUTO_11334 ) ( AT_SOIL_SAMPLE ?AUTO_11333 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11337 ) ( STORE_OF ?AUTO_11338 ?AUTO_11337 ) ( CAN_TRAVERSE ?AUTO_11337 ?AUTO_11340 ?AUTO_11333 ) ( AT ?AUTO_11337 ?AUTO_11340 ) ( VISIBLE ?AUTO_11340 ?AUTO_11333 ) ( not ( = ?AUTO_11333 ?AUTO_11340 ) ) ( not ( = ?AUTO_11336 ?AUTO_11340 ) ) ( not ( = ?AUTO_11335 ?AUTO_11340 ) ) ( not ( = ?AUTO_11334 ?AUTO_11340 ) ) ( FULL ?AUTO_11338 ) )
    :subtasks
    ( ( !DROP ?AUTO_11337 ?AUTO_11338 )
      ( GET_SOIL_DATA ?AUTO_11333 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11333 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11344 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11346 - LANDER
      ?AUTO_11345 - WAYPOINT
      ?AUTO_11351 - WAYPOINT
      ?AUTO_11350 - ROVER
      ?AUTO_11348 - WAYPOINT
      ?AUTO_11347 - STORE
      ?AUTO_11349 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11346 ?AUTO_11345 ) ( VISIBLE ?AUTO_11351 ?AUTO_11345 ) ( AVAILABLE ?AUTO_11350 ) ( CHANNEL_FREE ?AUTO_11346 ) ( not ( = ?AUTO_11344 ?AUTO_11351 ) ) ( not ( = ?AUTO_11344 ?AUTO_11345 ) ) ( not ( = ?AUTO_11351 ?AUTO_11345 ) ) ( CAN_TRAVERSE ?AUTO_11350 ?AUTO_11348 ?AUTO_11351 ) ( VISIBLE ?AUTO_11348 ?AUTO_11351 ) ( not ( = ?AUTO_11344 ?AUTO_11348 ) ) ( not ( = ?AUTO_11345 ?AUTO_11348 ) ) ( not ( = ?AUTO_11351 ?AUTO_11348 ) ) ( CAN_TRAVERSE ?AUTO_11350 ?AUTO_11344 ?AUTO_11348 ) ( VISIBLE ?AUTO_11344 ?AUTO_11348 ) ( AT_SOIL_SAMPLE ?AUTO_11344 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11350 ) ( STORE_OF ?AUTO_11347 ?AUTO_11350 ) ( CAN_TRAVERSE ?AUTO_11350 ?AUTO_11349 ?AUTO_11344 ) ( VISIBLE ?AUTO_11349 ?AUTO_11344 ) ( not ( = ?AUTO_11344 ?AUTO_11349 ) ) ( not ( = ?AUTO_11345 ?AUTO_11349 ) ) ( not ( = ?AUTO_11351 ?AUTO_11349 ) ) ( not ( = ?AUTO_11348 ?AUTO_11349 ) ) ( FULL ?AUTO_11347 ) ( CAN_TRAVERSE ?AUTO_11350 ?AUTO_11351 ?AUTO_11349 ) ( AT ?AUTO_11350 ?AUTO_11351 ) ( VISIBLE ?AUTO_11351 ?AUTO_11349 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11350 ?AUTO_11351 ?AUTO_11349 )
      ( GET_SOIL_DATA ?AUTO_11344 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11344 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11353 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11354 - LANDER
      ?AUTO_11358 - WAYPOINT
      ?AUTO_11357 - WAYPOINT
      ?AUTO_11360 - ROVER
      ?AUTO_11355 - WAYPOINT
      ?AUTO_11356 - STORE
      ?AUTO_11359 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11354 ?AUTO_11358 ) ( VISIBLE ?AUTO_11357 ?AUTO_11358 ) ( AVAILABLE ?AUTO_11360 ) ( CHANNEL_FREE ?AUTO_11354 ) ( not ( = ?AUTO_11353 ?AUTO_11357 ) ) ( not ( = ?AUTO_11353 ?AUTO_11358 ) ) ( not ( = ?AUTO_11357 ?AUTO_11358 ) ) ( CAN_TRAVERSE ?AUTO_11360 ?AUTO_11355 ?AUTO_11357 ) ( VISIBLE ?AUTO_11355 ?AUTO_11357 ) ( not ( = ?AUTO_11353 ?AUTO_11355 ) ) ( not ( = ?AUTO_11358 ?AUTO_11355 ) ) ( not ( = ?AUTO_11357 ?AUTO_11355 ) ) ( CAN_TRAVERSE ?AUTO_11360 ?AUTO_11353 ?AUTO_11355 ) ( VISIBLE ?AUTO_11353 ?AUTO_11355 ) ( AT_SOIL_SAMPLE ?AUTO_11353 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11360 ) ( STORE_OF ?AUTO_11356 ?AUTO_11360 ) ( CAN_TRAVERSE ?AUTO_11360 ?AUTO_11359 ?AUTO_11353 ) ( VISIBLE ?AUTO_11359 ?AUTO_11353 ) ( not ( = ?AUTO_11353 ?AUTO_11359 ) ) ( not ( = ?AUTO_11358 ?AUTO_11359 ) ) ( not ( = ?AUTO_11357 ?AUTO_11359 ) ) ( not ( = ?AUTO_11355 ?AUTO_11359 ) ) ( CAN_TRAVERSE ?AUTO_11360 ?AUTO_11357 ?AUTO_11359 ) ( AT ?AUTO_11360 ?AUTO_11357 ) ( VISIBLE ?AUTO_11357 ?AUTO_11359 ) ( AT_ROCK_SAMPLE ?AUTO_11357 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11360 ) ( EMPTY ?AUTO_11356 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11360 ?AUTO_11356 ?AUTO_11357 )
      ( GET_SOIL_DATA ?AUTO_11353 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11353 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11440 - OBJECTIVE
      ?AUTO_11441 - MODE
    )
    :vars
    (
      ?AUTO_11447 - LANDER
      ?AUTO_11446 - WAYPOINT
      ?AUTO_11443 - WAYPOINT
      ?AUTO_11445 - ROVER
      ?AUTO_11442 - CAMERA
      ?AUTO_11444 - WAYPOINT
      ?AUTO_11448 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11447 ?AUTO_11446 ) ( VISIBLE ?AUTO_11443 ?AUTO_11446 ) ( AVAILABLE ?AUTO_11445 ) ( CHANNEL_FREE ?AUTO_11447 ) ( not ( = ?AUTO_11443 ?AUTO_11446 ) ) ( CALIBRATED ?AUTO_11442 ?AUTO_11445 ) ( ON_BOARD ?AUTO_11442 ?AUTO_11445 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11445 ) ( SUPPORTS ?AUTO_11442 ?AUTO_11441 ) ( VISIBLE_FROM ?AUTO_11440 ?AUTO_11443 ) ( CAN_TRAVERSE ?AUTO_11445 ?AUTO_11444 ?AUTO_11443 ) ( VISIBLE ?AUTO_11444 ?AUTO_11443 ) ( not ( = ?AUTO_11446 ?AUTO_11444 ) ) ( not ( = ?AUTO_11443 ?AUTO_11444 ) ) ( CAN_TRAVERSE ?AUTO_11445 ?AUTO_11448 ?AUTO_11444 ) ( VISIBLE ?AUTO_11448 ?AUTO_11444 ) ( not ( = ?AUTO_11446 ?AUTO_11448 ) ) ( not ( = ?AUTO_11443 ?AUTO_11448 ) ) ( not ( = ?AUTO_11444 ?AUTO_11448 ) ) ( CAN_TRAVERSE ?AUTO_11445 ?AUTO_11446 ?AUTO_11448 ) ( AT ?AUTO_11445 ?AUTO_11446 ) ( VISIBLE ?AUTO_11446 ?AUTO_11448 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11445 ?AUTO_11446 ?AUTO_11448 )
      ( GET_IMAGE_DATA ?AUTO_11440 ?AUTO_11441 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11440 ?AUTO_11441 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11449 - OBJECTIVE
      ?AUTO_11450 - MODE
    )
    :vars
    (
      ?AUTO_11457 - LANDER
      ?AUTO_11454 - WAYPOINT
      ?AUTO_11452 - WAYPOINT
      ?AUTO_11456 - ROVER
      ?AUTO_11451 - CAMERA
      ?AUTO_11455 - WAYPOINT
      ?AUTO_11453 - WAYPOINT
      ?AUTO_11458 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11457 ?AUTO_11454 ) ( VISIBLE ?AUTO_11452 ?AUTO_11454 ) ( AVAILABLE ?AUTO_11456 ) ( CHANNEL_FREE ?AUTO_11457 ) ( not ( = ?AUTO_11452 ?AUTO_11454 ) ) ( ON_BOARD ?AUTO_11451 ?AUTO_11456 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11456 ) ( SUPPORTS ?AUTO_11451 ?AUTO_11450 ) ( VISIBLE_FROM ?AUTO_11449 ?AUTO_11452 ) ( CAN_TRAVERSE ?AUTO_11456 ?AUTO_11455 ?AUTO_11452 ) ( VISIBLE ?AUTO_11455 ?AUTO_11452 ) ( not ( = ?AUTO_11454 ?AUTO_11455 ) ) ( not ( = ?AUTO_11452 ?AUTO_11455 ) ) ( CAN_TRAVERSE ?AUTO_11456 ?AUTO_11453 ?AUTO_11455 ) ( VISIBLE ?AUTO_11453 ?AUTO_11455 ) ( not ( = ?AUTO_11454 ?AUTO_11453 ) ) ( not ( = ?AUTO_11452 ?AUTO_11453 ) ) ( not ( = ?AUTO_11455 ?AUTO_11453 ) ) ( CAN_TRAVERSE ?AUTO_11456 ?AUTO_11454 ?AUTO_11453 ) ( AT ?AUTO_11456 ?AUTO_11454 ) ( VISIBLE ?AUTO_11454 ?AUTO_11453 ) ( CALIBRATION_TARGET ?AUTO_11451 ?AUTO_11458 ) ( VISIBLE_FROM ?AUTO_11458 ?AUTO_11454 ) ( not ( = ?AUTO_11449 ?AUTO_11458 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_11456 ?AUTO_11451 ?AUTO_11458 ?AUTO_11454 )
      ( GET_IMAGE_DATA ?AUTO_11449 ?AUTO_11450 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11449 ?AUTO_11450 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11459 - OBJECTIVE
      ?AUTO_11460 - MODE
    )
    :vars
    (
      ?AUTO_11465 - LANDER
      ?AUTO_11462 - WAYPOINT
      ?AUTO_11461 - WAYPOINT
      ?AUTO_11467 - ROVER
      ?AUTO_11463 - CAMERA
      ?AUTO_11466 - WAYPOINT
      ?AUTO_11464 - WAYPOINT
      ?AUTO_11468 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11465 ?AUTO_11462 ) ( VISIBLE ?AUTO_11461 ?AUTO_11462 ) ( AVAILABLE ?AUTO_11467 ) ( CHANNEL_FREE ?AUTO_11465 ) ( not ( = ?AUTO_11461 ?AUTO_11462 ) ) ( ON_BOARD ?AUTO_11463 ?AUTO_11467 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11467 ) ( SUPPORTS ?AUTO_11463 ?AUTO_11460 ) ( VISIBLE_FROM ?AUTO_11459 ?AUTO_11461 ) ( CAN_TRAVERSE ?AUTO_11467 ?AUTO_11466 ?AUTO_11461 ) ( VISIBLE ?AUTO_11466 ?AUTO_11461 ) ( not ( = ?AUTO_11462 ?AUTO_11466 ) ) ( not ( = ?AUTO_11461 ?AUTO_11466 ) ) ( CAN_TRAVERSE ?AUTO_11467 ?AUTO_11464 ?AUTO_11466 ) ( VISIBLE ?AUTO_11464 ?AUTO_11466 ) ( not ( = ?AUTO_11462 ?AUTO_11464 ) ) ( not ( = ?AUTO_11461 ?AUTO_11464 ) ) ( not ( = ?AUTO_11466 ?AUTO_11464 ) ) ( CAN_TRAVERSE ?AUTO_11467 ?AUTO_11462 ?AUTO_11464 ) ( VISIBLE ?AUTO_11462 ?AUTO_11464 ) ( CALIBRATION_TARGET ?AUTO_11463 ?AUTO_11468 ) ( VISIBLE_FROM ?AUTO_11468 ?AUTO_11462 ) ( not ( = ?AUTO_11459 ?AUTO_11468 ) ) ( CAN_TRAVERSE ?AUTO_11467 ?AUTO_11461 ?AUTO_11462 ) ( AT ?AUTO_11467 ?AUTO_11461 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11467 ?AUTO_11461 ?AUTO_11462 )
      ( GET_IMAGE_DATA ?AUTO_11459 ?AUTO_11460 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11459 ?AUTO_11460 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11738 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11739 - LANDER
      ?AUTO_11740 - WAYPOINT
      ?AUTO_11741 - ROVER
      ?AUTO_11742 - STORE
      ?AUTO_11743 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11739 ?AUTO_11738 ) ( VISIBLE ?AUTO_11740 ?AUTO_11738 ) ( AVAILABLE ?AUTO_11741 ) ( CHANNEL_FREE ?AUTO_11739 ) ( not ( = ?AUTO_11738 ?AUTO_11740 ) ) ( CAN_TRAVERSE ?AUTO_11741 ?AUTO_11738 ?AUTO_11740 ) ( VISIBLE ?AUTO_11738 ?AUTO_11740 ) ( AT_ROCK_SAMPLE ?AUTO_11738 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11741 ) ( STORE_OF ?AUTO_11742 ?AUTO_11741 ) ( FULL ?AUTO_11742 ) ( CAN_TRAVERSE ?AUTO_11741 ?AUTO_11743 ?AUTO_11738 ) ( AT ?AUTO_11741 ?AUTO_11743 ) ( VISIBLE ?AUTO_11743 ?AUTO_11738 ) ( not ( = ?AUTO_11738 ?AUTO_11743 ) ) ( not ( = ?AUTO_11740 ?AUTO_11743 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11741 ?AUTO_11743 ?AUTO_11738 )
      ( GET_ROCK_DATA ?AUTO_11738 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11738 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11745 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11748 - LANDER
      ?AUTO_11749 - WAYPOINT
      ?AUTO_11750 - ROVER
      ?AUTO_11746 - STORE
      ?AUTO_11747 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11748 ?AUTO_11745 ) ( VISIBLE ?AUTO_11749 ?AUTO_11745 ) ( AVAILABLE ?AUTO_11750 ) ( CHANNEL_FREE ?AUTO_11748 ) ( not ( = ?AUTO_11745 ?AUTO_11749 ) ) ( CAN_TRAVERSE ?AUTO_11750 ?AUTO_11745 ?AUTO_11749 ) ( VISIBLE ?AUTO_11745 ?AUTO_11749 ) ( AT_ROCK_SAMPLE ?AUTO_11745 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11750 ) ( STORE_OF ?AUTO_11746 ?AUTO_11750 ) ( CAN_TRAVERSE ?AUTO_11750 ?AUTO_11747 ?AUTO_11745 ) ( AT ?AUTO_11750 ?AUTO_11747 ) ( VISIBLE ?AUTO_11747 ?AUTO_11745 ) ( not ( = ?AUTO_11745 ?AUTO_11747 ) ) ( not ( = ?AUTO_11749 ?AUTO_11747 ) ) ( AT_ROCK_SAMPLE ?AUTO_11747 ) ( EMPTY ?AUTO_11746 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11750 ?AUTO_11746 ?AUTO_11747 )
      ( GET_ROCK_DATA ?AUTO_11745 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11745 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11760 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11765 - LANDER
      ?AUTO_11764 - WAYPOINT
      ?AUTO_11761 - ROVER
      ?AUTO_11762 - STORE
      ?AUTO_11763 - WAYPOINT
      ?AUTO_11766 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11765 ?AUTO_11760 ) ( VISIBLE ?AUTO_11764 ?AUTO_11760 ) ( AVAILABLE ?AUTO_11761 ) ( CHANNEL_FREE ?AUTO_11765 ) ( not ( = ?AUTO_11760 ?AUTO_11764 ) ) ( CAN_TRAVERSE ?AUTO_11761 ?AUTO_11760 ?AUTO_11764 ) ( VISIBLE ?AUTO_11760 ?AUTO_11764 ) ( AT_ROCK_SAMPLE ?AUTO_11760 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11761 ) ( STORE_OF ?AUTO_11762 ?AUTO_11761 ) ( CAN_TRAVERSE ?AUTO_11761 ?AUTO_11763 ?AUTO_11760 ) ( VISIBLE ?AUTO_11763 ?AUTO_11760 ) ( not ( = ?AUTO_11760 ?AUTO_11763 ) ) ( not ( = ?AUTO_11764 ?AUTO_11763 ) ) ( AT_ROCK_SAMPLE ?AUTO_11763 ) ( CAN_TRAVERSE ?AUTO_11761 ?AUTO_11766 ?AUTO_11763 ) ( AT ?AUTO_11761 ?AUTO_11766 ) ( VISIBLE ?AUTO_11766 ?AUTO_11763 ) ( not ( = ?AUTO_11760 ?AUTO_11766 ) ) ( not ( = ?AUTO_11764 ?AUTO_11766 ) ) ( not ( = ?AUTO_11763 ?AUTO_11766 ) ) ( FULL ?AUTO_11762 ) )
    :subtasks
    ( ( !DROP ?AUTO_11761 ?AUTO_11762 )
      ( GET_ROCK_DATA ?AUTO_11760 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11760 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11825 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11830 - LANDER
      ?AUTO_11828 - WAYPOINT
      ?AUTO_11829 - WAYPOINT
      ?AUTO_11826 - ROVER
      ?AUTO_11831 - STORE
      ?AUTO_11827 - WAYPOINT
      ?AUTO_11832 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11830 ?AUTO_11828 ) ( VISIBLE ?AUTO_11829 ?AUTO_11828 ) ( AVAILABLE ?AUTO_11826 ) ( CHANNEL_FREE ?AUTO_11830 ) ( not ( = ?AUTO_11825 ?AUTO_11829 ) ) ( not ( = ?AUTO_11825 ?AUTO_11828 ) ) ( not ( = ?AUTO_11829 ?AUTO_11828 ) ) ( CAN_TRAVERSE ?AUTO_11826 ?AUTO_11825 ?AUTO_11829 ) ( VISIBLE ?AUTO_11825 ?AUTO_11829 ) ( AT_SOIL_SAMPLE ?AUTO_11825 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11826 ) ( STORE_OF ?AUTO_11831 ?AUTO_11826 ) ( CAN_TRAVERSE ?AUTO_11826 ?AUTO_11827 ?AUTO_11825 ) ( VISIBLE ?AUTO_11827 ?AUTO_11825 ) ( not ( = ?AUTO_11825 ?AUTO_11827 ) ) ( not ( = ?AUTO_11828 ?AUTO_11827 ) ) ( not ( = ?AUTO_11829 ?AUTO_11827 ) ) ( CAN_TRAVERSE ?AUTO_11826 ?AUTO_11828 ?AUTO_11827 ) ( VISIBLE ?AUTO_11828 ?AUTO_11827 ) ( FULL ?AUTO_11831 ) ( CAN_TRAVERSE ?AUTO_11826 ?AUTO_11832 ?AUTO_11828 ) ( AT ?AUTO_11826 ?AUTO_11832 ) ( VISIBLE ?AUTO_11832 ?AUTO_11828 ) ( not ( = ?AUTO_11825 ?AUTO_11832 ) ) ( not ( = ?AUTO_11828 ?AUTO_11832 ) ) ( not ( = ?AUTO_11829 ?AUTO_11832 ) ) ( not ( = ?AUTO_11827 ?AUTO_11832 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11826 ?AUTO_11832 ?AUTO_11828 )
      ( GET_SOIL_DATA ?AUTO_11825 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11825 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11834 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11837 - LANDER
      ?AUTO_11836 - WAYPOINT
      ?AUTO_11841 - WAYPOINT
      ?AUTO_11835 - ROVER
      ?AUTO_11840 - STORE
      ?AUTO_11838 - WAYPOINT
      ?AUTO_11839 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11837 ?AUTO_11836 ) ( VISIBLE ?AUTO_11841 ?AUTO_11836 ) ( AVAILABLE ?AUTO_11835 ) ( CHANNEL_FREE ?AUTO_11837 ) ( not ( = ?AUTO_11834 ?AUTO_11841 ) ) ( not ( = ?AUTO_11834 ?AUTO_11836 ) ) ( not ( = ?AUTO_11841 ?AUTO_11836 ) ) ( CAN_TRAVERSE ?AUTO_11835 ?AUTO_11834 ?AUTO_11841 ) ( VISIBLE ?AUTO_11834 ?AUTO_11841 ) ( AT_SOIL_SAMPLE ?AUTO_11834 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11835 ) ( STORE_OF ?AUTO_11840 ?AUTO_11835 ) ( CAN_TRAVERSE ?AUTO_11835 ?AUTO_11838 ?AUTO_11834 ) ( VISIBLE ?AUTO_11838 ?AUTO_11834 ) ( not ( = ?AUTO_11834 ?AUTO_11838 ) ) ( not ( = ?AUTO_11836 ?AUTO_11838 ) ) ( not ( = ?AUTO_11841 ?AUTO_11838 ) ) ( CAN_TRAVERSE ?AUTO_11835 ?AUTO_11836 ?AUTO_11838 ) ( VISIBLE ?AUTO_11836 ?AUTO_11838 ) ( CAN_TRAVERSE ?AUTO_11835 ?AUTO_11839 ?AUTO_11836 ) ( AT ?AUTO_11835 ?AUTO_11839 ) ( VISIBLE ?AUTO_11839 ?AUTO_11836 ) ( not ( = ?AUTO_11834 ?AUTO_11839 ) ) ( not ( = ?AUTO_11836 ?AUTO_11839 ) ) ( not ( = ?AUTO_11841 ?AUTO_11839 ) ) ( not ( = ?AUTO_11838 ?AUTO_11839 ) ) ( AT_ROCK_SAMPLE ?AUTO_11839 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11835 ) ( EMPTY ?AUTO_11840 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11835 ?AUTO_11840 ?AUTO_11839 )
      ( GET_SOIL_DATA ?AUTO_11834 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11834 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11864 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11869 - LANDER
      ?AUTO_11867 - WAYPOINT
      ?AUTO_11865 - WAYPOINT
      ?AUTO_11868 - ROVER
      ?AUTO_11866 - STORE
      ?AUTO_11870 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11869 ?AUTO_11867 ) ( VISIBLE ?AUTO_11865 ?AUTO_11867 ) ( AVAILABLE ?AUTO_11868 ) ( CHANNEL_FREE ?AUTO_11869 ) ( not ( = ?AUTO_11864 ?AUTO_11865 ) ) ( not ( = ?AUTO_11864 ?AUTO_11867 ) ) ( not ( = ?AUTO_11865 ?AUTO_11867 ) ) ( CAN_TRAVERSE ?AUTO_11868 ?AUTO_11864 ?AUTO_11865 ) ( VISIBLE ?AUTO_11864 ?AUTO_11865 ) ( AT_SOIL_SAMPLE ?AUTO_11864 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11868 ) ( STORE_OF ?AUTO_11866 ?AUTO_11868 ) ( CAN_TRAVERSE ?AUTO_11868 ?AUTO_11870 ?AUTO_11864 ) ( VISIBLE ?AUTO_11870 ?AUTO_11864 ) ( not ( = ?AUTO_11864 ?AUTO_11870 ) ) ( not ( = ?AUTO_11867 ?AUTO_11870 ) ) ( not ( = ?AUTO_11865 ?AUTO_11870 ) ) ( CAN_TRAVERSE ?AUTO_11868 ?AUTO_11865 ?AUTO_11870 ) ( AT ?AUTO_11868 ?AUTO_11865 ) ( VISIBLE ?AUTO_11865 ?AUTO_11870 ) ( AT_ROCK_SAMPLE ?AUTO_11865 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11868 ) ( EMPTY ?AUTO_11866 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11868 ?AUTO_11866 ?AUTO_11865 )
      ( GET_SOIL_DATA ?AUTO_11864 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11864 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11928 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11931 - LANDER
      ?AUTO_11933 - WAYPOINT
      ?AUTO_11934 - WAYPOINT
      ?AUTO_11932 - ROVER
      ?AUTO_11930 - STORE
      ?AUTO_11929 - WAYPOINT
      ?AUTO_11935 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11931 ?AUTO_11933 ) ( VISIBLE ?AUTO_11934 ?AUTO_11933 ) ( AVAILABLE ?AUTO_11932 ) ( CHANNEL_FREE ?AUTO_11931 ) ( not ( = ?AUTO_11928 ?AUTO_11934 ) ) ( not ( = ?AUTO_11928 ?AUTO_11933 ) ) ( not ( = ?AUTO_11934 ?AUTO_11933 ) ) ( CAN_TRAVERSE ?AUTO_11932 ?AUTO_11928 ?AUTO_11934 ) ( VISIBLE ?AUTO_11928 ?AUTO_11934 ) ( AT_ROCK_SAMPLE ?AUTO_11928 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11932 ) ( STORE_OF ?AUTO_11930 ?AUTO_11932 ) ( CAN_TRAVERSE ?AUTO_11932 ?AUTO_11929 ?AUTO_11928 ) ( VISIBLE ?AUTO_11929 ?AUTO_11928 ) ( not ( = ?AUTO_11928 ?AUTO_11929 ) ) ( not ( = ?AUTO_11933 ?AUTO_11929 ) ) ( not ( = ?AUTO_11934 ?AUTO_11929 ) ) ( CAN_TRAVERSE ?AUTO_11932 ?AUTO_11933 ?AUTO_11929 ) ( VISIBLE ?AUTO_11933 ?AUTO_11929 ) ( FULL ?AUTO_11930 ) ( CAN_TRAVERSE ?AUTO_11932 ?AUTO_11935 ?AUTO_11933 ) ( AT ?AUTO_11932 ?AUTO_11935 ) ( VISIBLE ?AUTO_11935 ?AUTO_11933 ) ( not ( = ?AUTO_11928 ?AUTO_11935 ) ) ( not ( = ?AUTO_11933 ?AUTO_11935 ) ) ( not ( = ?AUTO_11934 ?AUTO_11935 ) ) ( not ( = ?AUTO_11929 ?AUTO_11935 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11932 ?AUTO_11935 ?AUTO_11933 )
      ( GET_ROCK_DATA ?AUTO_11928 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11928 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11937 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11939 - LANDER
      ?AUTO_11943 - WAYPOINT
      ?AUTO_11941 - WAYPOINT
      ?AUTO_11944 - ROVER
      ?AUTO_11942 - STORE
      ?AUTO_11938 - WAYPOINT
      ?AUTO_11940 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11939 ?AUTO_11943 ) ( VISIBLE ?AUTO_11941 ?AUTO_11943 ) ( AVAILABLE ?AUTO_11944 ) ( CHANNEL_FREE ?AUTO_11939 ) ( not ( = ?AUTO_11937 ?AUTO_11941 ) ) ( not ( = ?AUTO_11937 ?AUTO_11943 ) ) ( not ( = ?AUTO_11941 ?AUTO_11943 ) ) ( CAN_TRAVERSE ?AUTO_11944 ?AUTO_11937 ?AUTO_11941 ) ( VISIBLE ?AUTO_11937 ?AUTO_11941 ) ( AT_ROCK_SAMPLE ?AUTO_11937 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11944 ) ( STORE_OF ?AUTO_11942 ?AUTO_11944 ) ( CAN_TRAVERSE ?AUTO_11944 ?AUTO_11938 ?AUTO_11937 ) ( VISIBLE ?AUTO_11938 ?AUTO_11937 ) ( not ( = ?AUTO_11937 ?AUTO_11938 ) ) ( not ( = ?AUTO_11943 ?AUTO_11938 ) ) ( not ( = ?AUTO_11941 ?AUTO_11938 ) ) ( CAN_TRAVERSE ?AUTO_11944 ?AUTO_11943 ?AUTO_11938 ) ( VISIBLE ?AUTO_11943 ?AUTO_11938 ) ( CAN_TRAVERSE ?AUTO_11944 ?AUTO_11940 ?AUTO_11943 ) ( AT ?AUTO_11944 ?AUTO_11940 ) ( VISIBLE ?AUTO_11940 ?AUTO_11943 ) ( not ( = ?AUTO_11937 ?AUTO_11940 ) ) ( not ( = ?AUTO_11943 ?AUTO_11940 ) ) ( not ( = ?AUTO_11941 ?AUTO_11940 ) ) ( not ( = ?AUTO_11938 ?AUTO_11940 ) ) ( AT_ROCK_SAMPLE ?AUTO_11940 ) ( EMPTY ?AUTO_11942 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11944 ?AUTO_11942 ?AUTO_11940 )
      ( GET_ROCK_DATA ?AUTO_11937 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11937 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11967 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11973 - LANDER
      ?AUTO_11970 - WAYPOINT
      ?AUTO_11969 - WAYPOINT
      ?AUTO_11968 - ROVER
      ?AUTO_11972 - STORE
      ?AUTO_11971 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11973 ?AUTO_11970 ) ( VISIBLE ?AUTO_11969 ?AUTO_11970 ) ( AVAILABLE ?AUTO_11968 ) ( CHANNEL_FREE ?AUTO_11973 ) ( not ( = ?AUTO_11967 ?AUTO_11969 ) ) ( not ( = ?AUTO_11967 ?AUTO_11970 ) ) ( not ( = ?AUTO_11969 ?AUTO_11970 ) ) ( CAN_TRAVERSE ?AUTO_11968 ?AUTO_11967 ?AUTO_11969 ) ( VISIBLE ?AUTO_11967 ?AUTO_11969 ) ( AT_ROCK_SAMPLE ?AUTO_11967 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11968 ) ( STORE_OF ?AUTO_11972 ?AUTO_11968 ) ( CAN_TRAVERSE ?AUTO_11968 ?AUTO_11971 ?AUTO_11967 ) ( VISIBLE ?AUTO_11971 ?AUTO_11967 ) ( not ( = ?AUTO_11967 ?AUTO_11971 ) ) ( not ( = ?AUTO_11970 ?AUTO_11971 ) ) ( not ( = ?AUTO_11969 ?AUTO_11971 ) ) ( CAN_TRAVERSE ?AUTO_11968 ?AUTO_11969 ?AUTO_11971 ) ( AT ?AUTO_11968 ?AUTO_11969 ) ( VISIBLE ?AUTO_11969 ?AUTO_11971 ) ( AT_ROCK_SAMPLE ?AUTO_11969 ) ( EMPTY ?AUTO_11972 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_11968 ?AUTO_11972 ?AUTO_11969 )
      ( GET_ROCK_DATA ?AUTO_11967 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11967 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12013 - OBJECTIVE
      ?AUTO_12014 - MODE
    )
    :vars
    (
      ?AUTO_12018 - LANDER
      ?AUTO_12015 - WAYPOINT
      ?AUTO_12021 - WAYPOINT
      ?AUTO_12016 - ROVER
      ?AUTO_12020 - CAMERA
      ?AUTO_12017 - OBJECTIVE
      ?AUTO_12019 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12018 ?AUTO_12015 ) ( VISIBLE ?AUTO_12021 ?AUTO_12015 ) ( AVAILABLE ?AUTO_12016 ) ( CHANNEL_FREE ?AUTO_12018 ) ( not ( = ?AUTO_12021 ?AUTO_12015 ) ) ( ON_BOARD ?AUTO_12020 ?AUTO_12016 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12016 ) ( SUPPORTS ?AUTO_12020 ?AUTO_12014 ) ( VISIBLE_FROM ?AUTO_12013 ?AUTO_12021 ) ( CAN_TRAVERSE ?AUTO_12016 ?AUTO_12015 ?AUTO_12021 ) ( VISIBLE ?AUTO_12015 ?AUTO_12021 ) ( CALIBRATION_TARGET ?AUTO_12020 ?AUTO_12017 ) ( VISIBLE_FROM ?AUTO_12017 ?AUTO_12015 ) ( not ( = ?AUTO_12013 ?AUTO_12017 ) ) ( CAN_TRAVERSE ?AUTO_12016 ?AUTO_12019 ?AUTO_12015 ) ( VISIBLE ?AUTO_12019 ?AUTO_12015 ) ( not ( = ?AUTO_12015 ?AUTO_12019 ) ) ( not ( = ?AUTO_12021 ?AUTO_12019 ) ) ( CAN_TRAVERSE ?AUTO_12016 ?AUTO_12021 ?AUTO_12019 ) ( AT ?AUTO_12016 ?AUTO_12021 ) ( VISIBLE ?AUTO_12021 ?AUTO_12019 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12016 ?AUTO_12021 ?AUTO_12019 )
      ( GET_IMAGE_DATA ?AUTO_12013 ?AUTO_12014 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12013 ?AUTO_12014 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12063 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12066 - LANDER
      ?AUTO_12065 - WAYPOINT
      ?AUTO_12064 - WAYPOINT
      ?AUTO_12069 - ROVER
      ?AUTO_12068 - WAYPOINT
      ?AUTO_12067 - STORE
      ?AUTO_12070 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12066 ?AUTO_12065 ) ( VISIBLE ?AUTO_12064 ?AUTO_12065 ) ( AVAILABLE ?AUTO_12069 ) ( CHANNEL_FREE ?AUTO_12066 ) ( not ( = ?AUTO_12063 ?AUTO_12064 ) ) ( not ( = ?AUTO_12063 ?AUTO_12065 ) ) ( not ( = ?AUTO_12064 ?AUTO_12065 ) ) ( CAN_TRAVERSE ?AUTO_12069 ?AUTO_12068 ?AUTO_12064 ) ( VISIBLE ?AUTO_12068 ?AUTO_12064 ) ( not ( = ?AUTO_12063 ?AUTO_12068 ) ) ( not ( = ?AUTO_12065 ?AUTO_12068 ) ) ( not ( = ?AUTO_12064 ?AUTO_12068 ) ) ( CAN_TRAVERSE ?AUTO_12069 ?AUTO_12063 ?AUTO_12068 ) ( VISIBLE ?AUTO_12063 ?AUTO_12068 ) ( AT_ROCK_SAMPLE ?AUTO_12063 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12069 ) ( STORE_OF ?AUTO_12067 ?AUTO_12069 ) ( EMPTY ?AUTO_12067 ) ( CAN_TRAVERSE ?AUTO_12069 ?AUTO_12068 ?AUTO_12063 ) ( VISIBLE ?AUTO_12068 ?AUTO_12063 ) ( CAN_TRAVERSE ?AUTO_12069 ?AUTO_12064 ?AUTO_12068 ) ( VISIBLE ?AUTO_12064 ?AUTO_12068 ) ( CAN_TRAVERSE ?AUTO_12069 ?AUTO_12070 ?AUTO_12064 ) ( AT ?AUTO_12069 ?AUTO_12070 ) ( VISIBLE ?AUTO_12070 ?AUTO_12064 ) ( not ( = ?AUTO_12063 ?AUTO_12070 ) ) ( not ( = ?AUTO_12065 ?AUTO_12070 ) ) ( not ( = ?AUTO_12064 ?AUTO_12070 ) ) ( not ( = ?AUTO_12068 ?AUTO_12070 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12069 ?AUTO_12070 ?AUTO_12064 )
      ( GET_ROCK_DATA ?AUTO_12063 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12063 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12073 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12080 - LANDER
      ?AUTO_12074 - WAYPOINT
      ?AUTO_12079 - WAYPOINT
      ?AUTO_12076 - ROVER
      ?AUTO_12075 - WAYPOINT
      ?AUTO_12077 - STORE
      ?AUTO_12078 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12080 ?AUTO_12074 ) ( VISIBLE ?AUTO_12079 ?AUTO_12074 ) ( AVAILABLE ?AUTO_12076 ) ( CHANNEL_FREE ?AUTO_12080 ) ( not ( = ?AUTO_12073 ?AUTO_12079 ) ) ( not ( = ?AUTO_12073 ?AUTO_12074 ) ) ( not ( = ?AUTO_12079 ?AUTO_12074 ) ) ( CAN_TRAVERSE ?AUTO_12076 ?AUTO_12075 ?AUTO_12079 ) ( VISIBLE ?AUTO_12075 ?AUTO_12079 ) ( not ( = ?AUTO_12073 ?AUTO_12075 ) ) ( not ( = ?AUTO_12074 ?AUTO_12075 ) ) ( not ( = ?AUTO_12079 ?AUTO_12075 ) ) ( CAN_TRAVERSE ?AUTO_12076 ?AUTO_12073 ?AUTO_12075 ) ( VISIBLE ?AUTO_12073 ?AUTO_12075 ) ( AT_ROCK_SAMPLE ?AUTO_12073 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12076 ) ( STORE_OF ?AUTO_12077 ?AUTO_12076 ) ( EMPTY ?AUTO_12077 ) ( CAN_TRAVERSE ?AUTO_12076 ?AUTO_12075 ?AUTO_12073 ) ( VISIBLE ?AUTO_12075 ?AUTO_12073 ) ( CAN_TRAVERSE ?AUTO_12076 ?AUTO_12079 ?AUTO_12075 ) ( VISIBLE ?AUTO_12079 ?AUTO_12075 ) ( CAN_TRAVERSE ?AUTO_12076 ?AUTO_12078 ?AUTO_12079 ) ( VISIBLE ?AUTO_12078 ?AUTO_12079 ) ( not ( = ?AUTO_12073 ?AUTO_12078 ) ) ( not ( = ?AUTO_12074 ?AUTO_12078 ) ) ( not ( = ?AUTO_12079 ?AUTO_12078 ) ) ( not ( = ?AUTO_12075 ?AUTO_12078 ) ) ( CAN_TRAVERSE ?AUTO_12076 ?AUTO_12074 ?AUTO_12078 ) ( AT ?AUTO_12076 ?AUTO_12074 ) ( VISIBLE ?AUTO_12074 ?AUTO_12078 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12076 ?AUTO_12074 ?AUTO_12078 )
      ( GET_ROCK_DATA ?AUTO_12073 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12073 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12179 - OBJECTIVE
      ?AUTO_12180 - MODE
    )
    :vars
    (
      ?AUTO_12184 - LANDER
      ?AUTO_12181 - WAYPOINT
      ?AUTO_12186 - WAYPOINT
      ?AUTO_12185 - ROVER
      ?AUTO_12182 - WAYPOINT
      ?AUTO_12183 - CAMERA
      ?AUTO_12187 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12184 ?AUTO_12181 ) ( VISIBLE ?AUTO_12186 ?AUTO_12181 ) ( AVAILABLE ?AUTO_12185 ) ( CHANNEL_FREE ?AUTO_12184 ) ( not ( = ?AUTO_12186 ?AUTO_12181 ) ) ( CAN_TRAVERSE ?AUTO_12185 ?AUTO_12182 ?AUTO_12186 ) ( VISIBLE ?AUTO_12182 ?AUTO_12186 ) ( not ( = ?AUTO_12181 ?AUTO_12182 ) ) ( not ( = ?AUTO_12186 ?AUTO_12182 ) ) ( ON_BOARD ?AUTO_12183 ?AUTO_12185 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12185 ) ( SUPPORTS ?AUTO_12183 ?AUTO_12180 ) ( VISIBLE_FROM ?AUTO_12179 ?AUTO_12182 ) ( CAN_TRAVERSE ?AUTO_12185 ?AUTO_12186 ?AUTO_12182 ) ( AT ?AUTO_12185 ?AUTO_12186 ) ( VISIBLE ?AUTO_12186 ?AUTO_12182 ) ( CALIBRATION_TARGET ?AUTO_12183 ?AUTO_12187 ) ( VISIBLE_FROM ?AUTO_12187 ?AUTO_12186 ) ( not ( = ?AUTO_12179 ?AUTO_12187 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_12185 ?AUTO_12183 ?AUTO_12187 ?AUTO_12186 )
      ( GET_IMAGE_DATA ?AUTO_12179 ?AUTO_12180 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12179 ?AUTO_12180 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12316 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12321 - LANDER
      ?AUTO_12319 - WAYPOINT
      ?AUTO_12320 - WAYPOINT
      ?AUTO_12318 - ROVER
      ?AUTO_12322 - WAYPOINT
      ?AUTO_12317 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12321 ?AUTO_12319 ) ( VISIBLE ?AUTO_12320 ?AUTO_12319 ) ( AVAILABLE ?AUTO_12318 ) ( CHANNEL_FREE ?AUTO_12321 ) ( not ( = ?AUTO_12316 ?AUTO_12320 ) ) ( not ( = ?AUTO_12316 ?AUTO_12319 ) ) ( not ( = ?AUTO_12320 ?AUTO_12319 ) ) ( CAN_TRAVERSE ?AUTO_12318 ?AUTO_12322 ?AUTO_12320 ) ( VISIBLE ?AUTO_12322 ?AUTO_12320 ) ( not ( = ?AUTO_12316 ?AUTO_12322 ) ) ( not ( = ?AUTO_12319 ?AUTO_12322 ) ) ( not ( = ?AUTO_12320 ?AUTO_12322 ) ) ( CAN_TRAVERSE ?AUTO_12318 ?AUTO_12316 ?AUTO_12322 ) ( VISIBLE ?AUTO_12316 ?AUTO_12322 ) ( AT_ROCK_SAMPLE ?AUTO_12316 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12318 ) ( STORE_OF ?AUTO_12317 ?AUTO_12318 ) ( CAN_TRAVERSE ?AUTO_12318 ?AUTO_12320 ?AUTO_12316 ) ( AT ?AUTO_12318 ?AUTO_12320 ) ( VISIBLE ?AUTO_12320 ?AUTO_12316 ) ( FULL ?AUTO_12317 ) )
    :subtasks
    ( ( !DROP ?AUTO_12318 ?AUTO_12317 )
      ( GET_ROCK_DATA ?AUTO_12316 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12316 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12369 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12375 - LANDER
      ?AUTO_12370 - WAYPOINT
      ?AUTO_12372 - WAYPOINT
      ?AUTO_12371 - ROVER
      ?AUTO_12374 - WAYPOINT
      ?AUTO_12373 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12375 ?AUTO_12370 ) ( VISIBLE ?AUTO_12372 ?AUTO_12370 ) ( AVAILABLE ?AUTO_12371 ) ( CHANNEL_FREE ?AUTO_12375 ) ( not ( = ?AUTO_12369 ?AUTO_12372 ) ) ( not ( = ?AUTO_12369 ?AUTO_12370 ) ) ( not ( = ?AUTO_12372 ?AUTO_12370 ) ) ( CAN_TRAVERSE ?AUTO_12371 ?AUTO_12374 ?AUTO_12372 ) ( VISIBLE ?AUTO_12374 ?AUTO_12372 ) ( not ( = ?AUTO_12369 ?AUTO_12374 ) ) ( not ( = ?AUTO_12370 ?AUTO_12374 ) ) ( not ( = ?AUTO_12372 ?AUTO_12374 ) ) ( CAN_TRAVERSE ?AUTO_12371 ?AUTO_12369 ?AUTO_12374 ) ( VISIBLE ?AUTO_12369 ?AUTO_12374 ) ( AT_ROCK_SAMPLE ?AUTO_12369 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12371 ) ( STORE_OF ?AUTO_12373 ?AUTO_12371 ) ( CAN_TRAVERSE ?AUTO_12371 ?AUTO_12372 ?AUTO_12369 ) ( VISIBLE ?AUTO_12372 ?AUTO_12369 ) ( AT ?AUTO_12371 ?AUTO_12374 ) ( FULL ?AUTO_12373 ) )
    :subtasks
    ( ( !DROP ?AUTO_12371 ?AUTO_12373 )
      ( GET_ROCK_DATA ?AUTO_12369 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12369 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12378 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12381 - LANDER
      ?AUTO_12383 - WAYPOINT
      ?AUTO_12382 - WAYPOINT
      ?AUTO_12384 - ROVER
      ?AUTO_12380 - WAYPOINT
      ?AUTO_12379 - STORE
      ?AUTO_12385 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12381 ?AUTO_12383 ) ( VISIBLE ?AUTO_12382 ?AUTO_12383 ) ( AVAILABLE ?AUTO_12384 ) ( CHANNEL_FREE ?AUTO_12381 ) ( not ( = ?AUTO_12378 ?AUTO_12382 ) ) ( not ( = ?AUTO_12378 ?AUTO_12383 ) ) ( not ( = ?AUTO_12382 ?AUTO_12383 ) ) ( CAN_TRAVERSE ?AUTO_12384 ?AUTO_12380 ?AUTO_12382 ) ( VISIBLE ?AUTO_12380 ?AUTO_12382 ) ( not ( = ?AUTO_12378 ?AUTO_12380 ) ) ( not ( = ?AUTO_12383 ?AUTO_12380 ) ) ( not ( = ?AUTO_12382 ?AUTO_12380 ) ) ( CAN_TRAVERSE ?AUTO_12384 ?AUTO_12378 ?AUTO_12380 ) ( VISIBLE ?AUTO_12378 ?AUTO_12380 ) ( AT_ROCK_SAMPLE ?AUTO_12378 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12384 ) ( STORE_OF ?AUTO_12379 ?AUTO_12384 ) ( CAN_TRAVERSE ?AUTO_12384 ?AUTO_12382 ?AUTO_12378 ) ( VISIBLE ?AUTO_12382 ?AUTO_12378 ) ( FULL ?AUTO_12379 ) ( CAN_TRAVERSE ?AUTO_12384 ?AUTO_12385 ?AUTO_12380 ) ( AT ?AUTO_12384 ?AUTO_12385 ) ( VISIBLE ?AUTO_12385 ?AUTO_12380 ) ( not ( = ?AUTO_12378 ?AUTO_12385 ) ) ( not ( = ?AUTO_12383 ?AUTO_12385 ) ) ( not ( = ?AUTO_12382 ?AUTO_12385 ) ) ( not ( = ?AUTO_12380 ?AUTO_12385 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12384 ?AUTO_12385 ?AUTO_12380 )
      ( GET_ROCK_DATA ?AUTO_12378 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12378 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12386 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12393 - LANDER
      ?AUTO_12391 - WAYPOINT
      ?AUTO_12392 - WAYPOINT
      ?AUTO_12389 - ROVER
      ?AUTO_12388 - WAYPOINT
      ?AUTO_12390 - STORE
      ?AUTO_12387 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12393 ?AUTO_12391 ) ( VISIBLE ?AUTO_12392 ?AUTO_12391 ) ( AVAILABLE ?AUTO_12389 ) ( CHANNEL_FREE ?AUTO_12393 ) ( not ( = ?AUTO_12386 ?AUTO_12392 ) ) ( not ( = ?AUTO_12386 ?AUTO_12391 ) ) ( not ( = ?AUTO_12392 ?AUTO_12391 ) ) ( CAN_TRAVERSE ?AUTO_12389 ?AUTO_12388 ?AUTO_12392 ) ( VISIBLE ?AUTO_12388 ?AUTO_12392 ) ( not ( = ?AUTO_12386 ?AUTO_12388 ) ) ( not ( = ?AUTO_12391 ?AUTO_12388 ) ) ( not ( = ?AUTO_12392 ?AUTO_12388 ) ) ( CAN_TRAVERSE ?AUTO_12389 ?AUTO_12386 ?AUTO_12388 ) ( VISIBLE ?AUTO_12386 ?AUTO_12388 ) ( AT_ROCK_SAMPLE ?AUTO_12386 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12389 ) ( STORE_OF ?AUTO_12390 ?AUTO_12389 ) ( CAN_TRAVERSE ?AUTO_12389 ?AUTO_12392 ?AUTO_12386 ) ( VISIBLE ?AUTO_12392 ?AUTO_12386 ) ( CAN_TRAVERSE ?AUTO_12389 ?AUTO_12387 ?AUTO_12388 ) ( AT ?AUTO_12389 ?AUTO_12387 ) ( VISIBLE ?AUTO_12387 ?AUTO_12388 ) ( not ( = ?AUTO_12386 ?AUTO_12387 ) ) ( not ( = ?AUTO_12391 ?AUTO_12387 ) ) ( not ( = ?AUTO_12392 ?AUTO_12387 ) ) ( not ( = ?AUTO_12388 ?AUTO_12387 ) ) ( AT_ROCK_SAMPLE ?AUTO_12387 ) ( EMPTY ?AUTO_12390 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_12389 ?AUTO_12390 ?AUTO_12387 )
      ( GET_ROCK_DATA ?AUTO_12386 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12386 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12479 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12483 - LANDER
      ?AUTO_12485 - WAYPOINT
      ?AUTO_12484 - WAYPOINT
      ?AUTO_12481 - ROVER
      ?AUTO_12480 - WAYPOINT
      ?AUTO_12482 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12483 ?AUTO_12485 ) ( VISIBLE ?AUTO_12484 ?AUTO_12485 ) ( AVAILABLE ?AUTO_12481 ) ( CHANNEL_FREE ?AUTO_12483 ) ( not ( = ?AUTO_12479 ?AUTO_12484 ) ) ( not ( = ?AUTO_12479 ?AUTO_12485 ) ) ( not ( = ?AUTO_12484 ?AUTO_12485 ) ) ( CAN_TRAVERSE ?AUTO_12481 ?AUTO_12480 ?AUTO_12484 ) ( VISIBLE ?AUTO_12480 ?AUTO_12484 ) ( not ( = ?AUTO_12479 ?AUTO_12480 ) ) ( not ( = ?AUTO_12485 ?AUTO_12480 ) ) ( not ( = ?AUTO_12484 ?AUTO_12480 ) ) ( CAN_TRAVERSE ?AUTO_12481 ?AUTO_12479 ?AUTO_12480 ) ( VISIBLE ?AUTO_12479 ?AUTO_12480 ) ( AT_ROCK_SAMPLE ?AUTO_12479 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12481 ) ( STORE_OF ?AUTO_12482 ?AUTO_12481 ) ( CAN_TRAVERSE ?AUTO_12481 ?AUTO_12480 ?AUTO_12479 ) ( VISIBLE ?AUTO_12480 ?AUTO_12479 ) ( CAN_TRAVERSE ?AUTO_12481 ?AUTO_12484 ?AUTO_12480 ) ( AT ?AUTO_12481 ?AUTO_12484 ) ( VISIBLE ?AUTO_12484 ?AUTO_12480 ) ( FULL ?AUTO_12482 ) )
    :subtasks
    ( ( !DROP ?AUTO_12481 ?AUTO_12482 )
      ( GET_ROCK_DATA ?AUTO_12479 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12479 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12496 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12498 - LANDER
      ?AUTO_12499 - WAYPOINT
      ?AUTO_12500 - WAYPOINT
      ?AUTO_12497 - ROVER
      ?AUTO_12502 - WAYPOINT
      ?AUTO_12501 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12498 ?AUTO_12499 ) ( VISIBLE ?AUTO_12500 ?AUTO_12499 ) ( AVAILABLE ?AUTO_12497 ) ( CHANNEL_FREE ?AUTO_12498 ) ( not ( = ?AUTO_12496 ?AUTO_12500 ) ) ( not ( = ?AUTO_12496 ?AUTO_12499 ) ) ( not ( = ?AUTO_12500 ?AUTO_12499 ) ) ( CAN_TRAVERSE ?AUTO_12497 ?AUTO_12502 ?AUTO_12500 ) ( VISIBLE ?AUTO_12502 ?AUTO_12500 ) ( not ( = ?AUTO_12496 ?AUTO_12502 ) ) ( not ( = ?AUTO_12499 ?AUTO_12502 ) ) ( not ( = ?AUTO_12500 ?AUTO_12502 ) ) ( CAN_TRAVERSE ?AUTO_12497 ?AUTO_12496 ?AUTO_12502 ) ( VISIBLE ?AUTO_12496 ?AUTO_12502 ) ( AT_ROCK_SAMPLE ?AUTO_12496 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12497 ) ( STORE_OF ?AUTO_12501 ?AUTO_12497 ) ( CAN_TRAVERSE ?AUTO_12497 ?AUTO_12502 ?AUTO_12496 ) ( VISIBLE ?AUTO_12502 ?AUTO_12496 ) ( CAN_TRAVERSE ?AUTO_12497 ?AUTO_12500 ?AUTO_12502 ) ( VISIBLE ?AUTO_12500 ?AUTO_12502 ) ( CAN_TRAVERSE ?AUTO_12497 ?AUTO_12499 ?AUTO_12500 ) ( AT ?AUTO_12497 ?AUTO_12499 ) ( VISIBLE ?AUTO_12499 ?AUTO_12500 ) ( FULL ?AUTO_12501 ) )
    :subtasks
    ( ( !DROP ?AUTO_12497 ?AUTO_12501 )
      ( GET_ROCK_DATA ?AUTO_12496 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12496 ) )
  )

)

