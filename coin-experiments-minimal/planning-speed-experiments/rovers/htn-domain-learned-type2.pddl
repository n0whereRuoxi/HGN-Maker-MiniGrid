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
      ?AUTO_4 - LANDER
      ?AUTO_3 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_2 ?AUTO_1 ) ( AT_LANDER ?AUTO_4 ?AUTO_3 ) ( HAVE_SOIL_ANALYSIS ?AUTO_2 ?AUTO_1 ) ( VISIBLE ?AUTO_1 ?AUTO_3 ) ( AVAILABLE ?AUTO_2 ) ( CHANNEL_FREE ?AUTO_4 ) ( not ( = ?AUTO_1 ?AUTO_3 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_2 ?AUTO_4 ?AUTO_1 ?AUTO_1 ?AUTO_3 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6 - ROVER
      ?AUTO_8 - LANDER
      ?AUTO_7 - WAYPOINT
      ?AUTO_9 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_6 ?AUTO_5 ) ( AT_LANDER ?AUTO_8 ?AUTO_7 ) ( VISIBLE ?AUTO_5 ?AUTO_7 ) ( AVAILABLE ?AUTO_6 ) ( CHANNEL_FREE ?AUTO_8 ) ( not ( = ?AUTO_5 ?AUTO_7 ) ) ( AT_SOIL_SAMPLE ?AUTO_5 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6 ) ( STORE_OF ?AUTO_9 ?AUTO_6 ) ( EMPTY ?AUTO_9 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6 ?AUTO_9 ?AUTO_5 )
      ( GET_SOIL_DATA ?AUTO_5 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12 - LANDER
      ?AUTO_13 - WAYPOINT
      ?AUTO_11 - ROVER
      ?AUTO_14 - STORE
      ?AUTO_15 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12 ?AUTO_13 ) ( VISIBLE ?AUTO_10 ?AUTO_13 ) ( AVAILABLE ?AUTO_11 ) ( CHANNEL_FREE ?AUTO_12 ) ( not ( = ?AUTO_10 ?AUTO_13 ) ) ( AT_SOIL_SAMPLE ?AUTO_10 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11 ) ( STORE_OF ?AUTO_14 ?AUTO_11 ) ( EMPTY ?AUTO_14 ) ( CAN_TRAVERSE ?AUTO_11 ?AUTO_15 ?AUTO_10 ) ( AT ?AUTO_11 ?AUTO_15 ) ( VISIBLE ?AUTO_15 ?AUTO_10 ) ( not ( = ?AUTO_10 ?AUTO_15 ) ) ( not ( = ?AUTO_13 ?AUTO_15 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11 ?AUTO_15 ?AUTO_10 )
      ( GET_SOIL_DATA ?AUTO_10 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_16 - WAYPOINT
    )
    :vars
    (
      ?AUTO_18 - LANDER
      ?AUTO_21 - WAYPOINT
      ?AUTO_17 - ROVER
      ?AUTO_20 - STORE
      ?AUTO_19 - WAYPOINT
      ?AUTO_22 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_18 ?AUTO_21 ) ( VISIBLE ?AUTO_16 ?AUTO_21 ) ( AVAILABLE ?AUTO_17 ) ( CHANNEL_FREE ?AUTO_18 ) ( not ( = ?AUTO_16 ?AUTO_21 ) ) ( AT_SOIL_SAMPLE ?AUTO_16 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_17 ) ( STORE_OF ?AUTO_20 ?AUTO_17 ) ( EMPTY ?AUTO_20 ) ( CAN_TRAVERSE ?AUTO_17 ?AUTO_19 ?AUTO_16 ) ( VISIBLE ?AUTO_19 ?AUTO_16 ) ( not ( = ?AUTO_16 ?AUTO_19 ) ) ( not ( = ?AUTO_21 ?AUTO_19 ) ) ( CAN_TRAVERSE ?AUTO_17 ?AUTO_22 ?AUTO_19 ) ( AT ?AUTO_17 ?AUTO_22 ) ( VISIBLE ?AUTO_22 ?AUTO_19 ) ( not ( = ?AUTO_16 ?AUTO_22 ) ) ( not ( = ?AUTO_21 ?AUTO_22 ) ) ( not ( = ?AUTO_19 ?AUTO_22 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_17 ?AUTO_22 ?AUTO_19 )
      ( GET_SOIL_DATA ?AUTO_16 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_16 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_24 - WAYPOINT
    )
    :vars
    (
      ?AUTO_25 - ROVER
      ?AUTO_27 - LANDER
      ?AUTO_26 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_25 ?AUTO_24 ) ( AT_LANDER ?AUTO_27 ?AUTO_26 ) ( HAVE_ROCK_ANALYSIS ?AUTO_25 ?AUTO_24 ) ( VISIBLE ?AUTO_24 ?AUTO_26 ) ( AVAILABLE ?AUTO_25 ) ( CHANNEL_FREE ?AUTO_27 ) ( not ( = ?AUTO_24 ?AUTO_26 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_25 ?AUTO_27 ?AUTO_24 ?AUTO_24 ?AUTO_26 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_24 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_28 - WAYPOINT
    )
    :vars
    (
      ?AUTO_30 - ROVER
      ?AUTO_31 - LANDER
      ?AUTO_29 - WAYPOINT
      ?AUTO_32 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_30 ?AUTO_28 ) ( AT_LANDER ?AUTO_31 ?AUTO_29 ) ( VISIBLE ?AUTO_28 ?AUTO_29 ) ( AVAILABLE ?AUTO_30 ) ( CHANNEL_FREE ?AUTO_31 ) ( not ( = ?AUTO_28 ?AUTO_29 ) ) ( AT_ROCK_SAMPLE ?AUTO_28 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_30 ) ( STORE_OF ?AUTO_32 ?AUTO_30 ) ( EMPTY ?AUTO_32 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_30 ?AUTO_32 ?AUTO_28 )
      ( GET_ROCK_DATA ?AUTO_28 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_28 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_33 - WAYPOINT
    )
    :vars
    (
      ?AUTO_36 - ROVER
      ?AUTO_35 - LANDER
      ?AUTO_34 - WAYPOINT
      ?AUTO_37 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_36 ?AUTO_33 ) ( AT_LANDER ?AUTO_35 ?AUTO_34 ) ( VISIBLE ?AUTO_33 ?AUTO_34 ) ( AVAILABLE ?AUTO_36 ) ( CHANNEL_FREE ?AUTO_35 ) ( not ( = ?AUTO_33 ?AUTO_34 ) ) ( AT_ROCK_SAMPLE ?AUTO_33 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_36 ) ( STORE_OF ?AUTO_37 ?AUTO_36 ) ( FULL ?AUTO_37 ) )
    :subtasks
    ( ( !DROP ?AUTO_36 ?AUTO_37 )
      ( GET_ROCK_DATA ?AUTO_33 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_33 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_40 - WAYPOINT
    )
    :vars
    (
      ?AUTO_43 - LANDER
      ?AUTO_44 - WAYPOINT
      ?AUTO_42 - ROVER
      ?AUTO_41 - STORE
      ?AUTO_45 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_43 ?AUTO_44 ) ( VISIBLE ?AUTO_40 ?AUTO_44 ) ( AVAILABLE ?AUTO_42 ) ( CHANNEL_FREE ?AUTO_43 ) ( not ( = ?AUTO_40 ?AUTO_44 ) ) ( AT_ROCK_SAMPLE ?AUTO_40 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_42 ) ( STORE_OF ?AUTO_41 ?AUTO_42 ) ( EMPTY ?AUTO_41 ) ( CAN_TRAVERSE ?AUTO_42 ?AUTO_45 ?AUTO_40 ) ( AT ?AUTO_42 ?AUTO_45 ) ( VISIBLE ?AUTO_45 ?AUTO_40 ) ( not ( = ?AUTO_40 ?AUTO_45 ) ) ( not ( = ?AUTO_44 ?AUTO_45 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_42 ?AUTO_45 ?AUTO_40 )
      ( GET_ROCK_DATA ?AUTO_40 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_40 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_46 - WAYPOINT
    )
    :vars
    (
      ?AUTO_50 - LANDER
      ?AUTO_49 - WAYPOINT
      ?AUTO_48 - ROVER
      ?AUTO_47 - STORE
      ?AUTO_51 - WAYPOINT
      ?AUTO_52 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_50 ?AUTO_49 ) ( VISIBLE ?AUTO_46 ?AUTO_49 ) ( AVAILABLE ?AUTO_48 ) ( CHANNEL_FREE ?AUTO_50 ) ( not ( = ?AUTO_46 ?AUTO_49 ) ) ( AT_ROCK_SAMPLE ?AUTO_46 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_48 ) ( STORE_OF ?AUTO_47 ?AUTO_48 ) ( EMPTY ?AUTO_47 ) ( CAN_TRAVERSE ?AUTO_48 ?AUTO_51 ?AUTO_46 ) ( VISIBLE ?AUTO_51 ?AUTO_46 ) ( not ( = ?AUTO_46 ?AUTO_51 ) ) ( not ( = ?AUTO_49 ?AUTO_51 ) ) ( CAN_TRAVERSE ?AUTO_48 ?AUTO_52 ?AUTO_51 ) ( AT ?AUTO_48 ?AUTO_52 ) ( VISIBLE ?AUTO_52 ?AUTO_51 ) ( not ( = ?AUTO_46 ?AUTO_52 ) ) ( not ( = ?AUTO_49 ?AUTO_52 ) ) ( not ( = ?AUTO_51 ?AUTO_52 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_48 ?AUTO_52 ?AUTO_51 )
      ( GET_ROCK_DATA ?AUTO_46 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_46 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_71 - WAYPOINT
    )
    :vars
    (
      ?AUTO_72 - ROVER
      ?AUTO_75 - WAYPOINT
      ?AUTO_74 - LANDER
      ?AUTO_73 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_72 ?AUTO_75 ) ( AT_LANDER ?AUTO_74 ?AUTO_73 ) ( HAVE_ROCK_ANALYSIS ?AUTO_72 ?AUTO_71 ) ( VISIBLE ?AUTO_75 ?AUTO_73 ) ( AVAILABLE ?AUTO_72 ) ( CHANNEL_FREE ?AUTO_74 ) ( not ( = ?AUTO_71 ?AUTO_75 ) ) ( not ( = ?AUTO_71 ?AUTO_73 ) ) ( not ( = ?AUTO_75 ?AUTO_73 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_72 ?AUTO_74 ?AUTO_71 ?AUTO_75 ?AUTO_73 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_71 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_76 - WAYPOINT
    )
    :vars
    (
      ?AUTO_78 - LANDER
      ?AUTO_77 - WAYPOINT
      ?AUTO_79 - ROVER
      ?AUTO_80 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_78 ?AUTO_77 ) ( HAVE_ROCK_ANALYSIS ?AUTO_79 ?AUTO_76 ) ( VISIBLE ?AUTO_80 ?AUTO_77 ) ( AVAILABLE ?AUTO_79 ) ( CHANNEL_FREE ?AUTO_78 ) ( not ( = ?AUTO_76 ?AUTO_80 ) ) ( not ( = ?AUTO_76 ?AUTO_77 ) ) ( not ( = ?AUTO_80 ?AUTO_77 ) ) ( CAN_TRAVERSE ?AUTO_79 ?AUTO_76 ?AUTO_80 ) ( AT ?AUTO_79 ?AUTO_76 ) ( VISIBLE ?AUTO_76 ?AUTO_80 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_79 ?AUTO_76 ?AUTO_80 )
      ( GET_ROCK_DATA ?AUTO_76 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_76 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_81 - WAYPOINT
    )
    :vars
    (
      ?AUTO_83 - LANDER
      ?AUTO_82 - WAYPOINT
      ?AUTO_84 - WAYPOINT
      ?AUTO_85 - ROVER
      ?AUTO_86 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_83 ?AUTO_82 ) ( VISIBLE ?AUTO_84 ?AUTO_82 ) ( AVAILABLE ?AUTO_85 ) ( CHANNEL_FREE ?AUTO_83 ) ( not ( = ?AUTO_81 ?AUTO_84 ) ) ( not ( = ?AUTO_81 ?AUTO_82 ) ) ( not ( = ?AUTO_84 ?AUTO_82 ) ) ( CAN_TRAVERSE ?AUTO_85 ?AUTO_81 ?AUTO_84 ) ( AT ?AUTO_85 ?AUTO_81 ) ( VISIBLE ?AUTO_81 ?AUTO_84 ) ( AT_ROCK_SAMPLE ?AUTO_81 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_85 ) ( STORE_OF ?AUTO_86 ?AUTO_85 ) ( EMPTY ?AUTO_86 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_85 ?AUTO_86 ?AUTO_81 )
      ( GET_ROCK_DATA ?AUTO_81 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_81 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_89 - WAYPOINT
    )
    :vars
    (
      ?AUTO_93 - LANDER
      ?AUTO_92 - WAYPOINT
      ?AUTO_91 - WAYPOINT
      ?AUTO_90 - ROVER
      ?AUTO_94 - STORE
      ?AUTO_95 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_93 ?AUTO_92 ) ( VISIBLE ?AUTO_91 ?AUTO_92 ) ( AVAILABLE ?AUTO_90 ) ( CHANNEL_FREE ?AUTO_93 ) ( not ( = ?AUTO_89 ?AUTO_91 ) ) ( not ( = ?AUTO_89 ?AUTO_92 ) ) ( not ( = ?AUTO_91 ?AUTO_92 ) ) ( CAN_TRAVERSE ?AUTO_90 ?AUTO_89 ?AUTO_91 ) ( VISIBLE ?AUTO_89 ?AUTO_91 ) ( AT_ROCK_SAMPLE ?AUTO_89 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_90 ) ( STORE_OF ?AUTO_94 ?AUTO_90 ) ( EMPTY ?AUTO_94 ) ( CAN_TRAVERSE ?AUTO_90 ?AUTO_95 ?AUTO_89 ) ( AT ?AUTO_90 ?AUTO_95 ) ( VISIBLE ?AUTO_95 ?AUTO_89 ) ( not ( = ?AUTO_89 ?AUTO_95 ) ) ( not ( = ?AUTO_92 ?AUTO_95 ) ) ( not ( = ?AUTO_91 ?AUTO_95 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_90 ?AUTO_95 ?AUTO_89 )
      ( GET_ROCK_DATA ?AUTO_89 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_89 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_96 - WAYPOINT
    )
    :vars
    (
      ?AUTO_100 - LANDER
      ?AUTO_101 - WAYPOINT
      ?AUTO_97 - WAYPOINT
      ?AUTO_99 - ROVER
      ?AUTO_98 - STORE
      ?AUTO_102 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_100 ?AUTO_101 ) ( VISIBLE ?AUTO_97 ?AUTO_101 ) ( AVAILABLE ?AUTO_99 ) ( CHANNEL_FREE ?AUTO_100 ) ( not ( = ?AUTO_96 ?AUTO_97 ) ) ( not ( = ?AUTO_96 ?AUTO_101 ) ) ( not ( = ?AUTO_97 ?AUTO_101 ) ) ( CAN_TRAVERSE ?AUTO_99 ?AUTO_96 ?AUTO_97 ) ( VISIBLE ?AUTO_96 ?AUTO_97 ) ( AT_ROCK_SAMPLE ?AUTO_96 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_99 ) ( STORE_OF ?AUTO_98 ?AUTO_99 ) ( CAN_TRAVERSE ?AUTO_99 ?AUTO_102 ?AUTO_96 ) ( AT ?AUTO_99 ?AUTO_102 ) ( VISIBLE ?AUTO_102 ?AUTO_96 ) ( not ( = ?AUTO_96 ?AUTO_102 ) ) ( not ( = ?AUTO_101 ?AUTO_102 ) ) ( not ( = ?AUTO_97 ?AUTO_102 ) ) ( FULL ?AUTO_98 ) )
    :subtasks
    ( ( !DROP ?AUTO_99 ?AUTO_98 )
      ( GET_ROCK_DATA ?AUTO_96 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_96 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_114 - OBJECTIVE
      ?AUTO_115 - MODE
    )
    :vars
    (
      ?AUTO_116 - ROVER
      ?AUTO_119 - WAYPOINT
      ?AUTO_118 - LANDER
      ?AUTO_117 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_116 ?AUTO_119 ) ( AT_LANDER ?AUTO_118 ?AUTO_117 ) ( HAVE_IMAGE ?AUTO_116 ?AUTO_114 ?AUTO_115 ) ( VISIBLE ?AUTO_119 ?AUTO_117 ) ( AVAILABLE ?AUTO_116 ) ( CHANNEL_FREE ?AUTO_118 ) ( not ( = ?AUTO_119 ?AUTO_117 ) ) )
    :subtasks
    ( ( !COMMUNICATE_IMAGE_DATA ?AUTO_116 ?AUTO_118 ?AUTO_114 ?AUTO_115 ?AUTO_119 ?AUTO_117 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_114 ?AUTO_115 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_122 - OBJECTIVE
      ?AUTO_123 - MODE
    )
    :vars
    (
      ?AUTO_127 - LANDER
      ?AUTO_124 - WAYPOINT
      ?AUTO_126 - ROVER
      ?AUTO_125 - WAYPOINT
      ?AUTO_128 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_127 ?AUTO_124 ) ( HAVE_IMAGE ?AUTO_126 ?AUTO_122 ?AUTO_123 ) ( VISIBLE ?AUTO_125 ?AUTO_124 ) ( AVAILABLE ?AUTO_126 ) ( CHANNEL_FREE ?AUTO_127 ) ( not ( = ?AUTO_125 ?AUTO_124 ) ) ( CAN_TRAVERSE ?AUTO_126 ?AUTO_128 ?AUTO_125 ) ( AT ?AUTO_126 ?AUTO_128 ) ( VISIBLE ?AUTO_128 ?AUTO_125 ) ( not ( = ?AUTO_124 ?AUTO_128 ) ) ( not ( = ?AUTO_125 ?AUTO_128 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_126 ?AUTO_128 ?AUTO_125 )
      ( GET_IMAGE_DATA ?AUTO_122 ?AUTO_123 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_122 ?AUTO_123 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_131 - OBJECTIVE
      ?AUTO_132 - MODE
    )
    :vars
    (
      ?AUTO_134 - LANDER
      ?AUTO_137 - WAYPOINT
      ?AUTO_133 - WAYPOINT
      ?AUTO_136 - ROVER
      ?AUTO_135 - WAYPOINT
      ?AUTO_138 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_134 ?AUTO_137 ) ( VISIBLE ?AUTO_133 ?AUTO_137 ) ( AVAILABLE ?AUTO_136 ) ( CHANNEL_FREE ?AUTO_134 ) ( not ( = ?AUTO_133 ?AUTO_137 ) ) ( CAN_TRAVERSE ?AUTO_136 ?AUTO_135 ?AUTO_133 ) ( AT ?AUTO_136 ?AUTO_135 ) ( VISIBLE ?AUTO_135 ?AUTO_133 ) ( not ( = ?AUTO_137 ?AUTO_135 ) ) ( not ( = ?AUTO_133 ?AUTO_135 ) ) ( CALIBRATED ?AUTO_138 ?AUTO_136 ) ( ON_BOARD ?AUTO_138 ?AUTO_136 ) ( EQUIPPED_FOR_IMAGING ?AUTO_136 ) ( SUPPORTS ?AUTO_138 ?AUTO_132 ) ( VISIBLE_FROM ?AUTO_131 ?AUTO_135 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_136 ?AUTO_135 ?AUTO_131 ?AUTO_138 ?AUTO_132 )
      ( GET_IMAGE_DATA ?AUTO_131 ?AUTO_132 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_131 ?AUTO_132 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_139 - OBJECTIVE
      ?AUTO_140 - MODE
    )
    :vars
    (
      ?AUTO_144 - LANDER
      ?AUTO_141 - WAYPOINT
      ?AUTO_143 - WAYPOINT
      ?AUTO_145 - ROVER
      ?AUTO_142 - WAYPOINT
      ?AUTO_146 - CAMERA
      ?AUTO_147 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_144 ?AUTO_141 ) ( VISIBLE ?AUTO_143 ?AUTO_141 ) ( AVAILABLE ?AUTO_145 ) ( CHANNEL_FREE ?AUTO_144 ) ( not ( = ?AUTO_143 ?AUTO_141 ) ) ( CAN_TRAVERSE ?AUTO_145 ?AUTO_142 ?AUTO_143 ) ( AT ?AUTO_145 ?AUTO_142 ) ( VISIBLE ?AUTO_142 ?AUTO_143 ) ( not ( = ?AUTO_141 ?AUTO_142 ) ) ( not ( = ?AUTO_143 ?AUTO_142 ) ) ( ON_BOARD ?AUTO_146 ?AUTO_145 ) ( EQUIPPED_FOR_IMAGING ?AUTO_145 ) ( SUPPORTS ?AUTO_146 ?AUTO_140 ) ( VISIBLE_FROM ?AUTO_139 ?AUTO_142 ) ( CALIBRATION_TARGET ?AUTO_146 ?AUTO_147 ) ( VISIBLE_FROM ?AUTO_147 ?AUTO_142 ) ( not ( = ?AUTO_139 ?AUTO_147 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_145 ?AUTO_146 ?AUTO_147 ?AUTO_142 )
      ( GET_IMAGE_DATA ?AUTO_139 ?AUTO_140 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_139 ?AUTO_140 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_148 - OBJECTIVE
      ?AUTO_149 - MODE
    )
    :vars
    (
      ?AUTO_152 - LANDER
      ?AUTO_154 - WAYPOINT
      ?AUTO_156 - WAYPOINT
      ?AUTO_153 - ROVER
      ?AUTO_155 - WAYPOINT
      ?AUTO_150 - CAMERA
      ?AUTO_151 - OBJECTIVE
      ?AUTO_157 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_152 ?AUTO_154 ) ( VISIBLE ?AUTO_156 ?AUTO_154 ) ( AVAILABLE ?AUTO_153 ) ( CHANNEL_FREE ?AUTO_152 ) ( not ( = ?AUTO_156 ?AUTO_154 ) ) ( CAN_TRAVERSE ?AUTO_153 ?AUTO_155 ?AUTO_156 ) ( VISIBLE ?AUTO_155 ?AUTO_156 ) ( not ( = ?AUTO_154 ?AUTO_155 ) ) ( not ( = ?AUTO_156 ?AUTO_155 ) ) ( ON_BOARD ?AUTO_150 ?AUTO_153 ) ( EQUIPPED_FOR_IMAGING ?AUTO_153 ) ( SUPPORTS ?AUTO_150 ?AUTO_149 ) ( VISIBLE_FROM ?AUTO_148 ?AUTO_155 ) ( CALIBRATION_TARGET ?AUTO_150 ?AUTO_151 ) ( VISIBLE_FROM ?AUTO_151 ?AUTO_155 ) ( not ( = ?AUTO_148 ?AUTO_151 ) ) ( CAN_TRAVERSE ?AUTO_153 ?AUTO_157 ?AUTO_155 ) ( AT ?AUTO_153 ?AUTO_157 ) ( VISIBLE ?AUTO_157 ?AUTO_155 ) ( not ( = ?AUTO_154 ?AUTO_157 ) ) ( not ( = ?AUTO_156 ?AUTO_157 ) ) ( not ( = ?AUTO_155 ?AUTO_157 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_153 ?AUTO_157 ?AUTO_155 )
      ( GET_IMAGE_DATA ?AUTO_148 ?AUTO_149 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_148 ?AUTO_149 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_166 - OBJECTIVE
      ?AUTO_167 - MODE
    )
    :vars
    (
      ?AUTO_168 - ROVER
      ?AUTO_171 - WAYPOINT
      ?AUTO_170 - LANDER
      ?AUTO_169 - WAYPOINT
      ?AUTO_172 - CAMERA
    )
    :precondition
    ( and ( AT ?AUTO_168 ?AUTO_171 ) ( AT_LANDER ?AUTO_170 ?AUTO_169 ) ( VISIBLE ?AUTO_171 ?AUTO_169 ) ( AVAILABLE ?AUTO_168 ) ( CHANNEL_FREE ?AUTO_170 ) ( not ( = ?AUTO_171 ?AUTO_169 ) ) ( CALIBRATED ?AUTO_172 ?AUTO_168 ) ( ON_BOARD ?AUTO_172 ?AUTO_168 ) ( EQUIPPED_FOR_IMAGING ?AUTO_168 ) ( SUPPORTS ?AUTO_172 ?AUTO_167 ) ( VISIBLE_FROM ?AUTO_166 ?AUTO_171 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_168 ?AUTO_171 ?AUTO_166 ?AUTO_172 ?AUTO_167 )
      ( GET_IMAGE_DATA ?AUTO_166 ?AUTO_167 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_166 ?AUTO_167 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_173 - OBJECTIVE
      ?AUTO_174 - MODE
    )
    :vars
    (
      ?AUTO_178 - ROVER
      ?AUTO_177 - WAYPOINT
      ?AUTO_176 - LANDER
      ?AUTO_175 - WAYPOINT
      ?AUTO_179 - CAMERA
    )
    :precondition
    ( and ( AT ?AUTO_178 ?AUTO_177 ) ( AT_LANDER ?AUTO_176 ?AUTO_175 ) ( VISIBLE ?AUTO_177 ?AUTO_175 ) ( AVAILABLE ?AUTO_178 ) ( CHANNEL_FREE ?AUTO_176 ) ( not ( = ?AUTO_177 ?AUTO_175 ) ) ( ON_BOARD ?AUTO_179 ?AUTO_178 ) ( EQUIPPED_FOR_IMAGING ?AUTO_178 ) ( SUPPORTS ?AUTO_179 ?AUTO_174 ) ( VISIBLE_FROM ?AUTO_173 ?AUTO_177 ) ( CALIBRATION_TARGET ?AUTO_179 ?AUTO_173 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_178 ?AUTO_179 ?AUTO_173 ?AUTO_177 )
      ( GET_IMAGE_DATA ?AUTO_173 ?AUTO_174 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_173 ?AUTO_174 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_181 - WAYPOINT
    )
    :vars
    (
      ?AUTO_182 - ROVER
      ?AUTO_185 - WAYPOINT
      ?AUTO_184 - LANDER
      ?AUTO_183 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_182 ?AUTO_185 ) ( AT_LANDER ?AUTO_184 ?AUTO_183 ) ( HAVE_SOIL_ANALYSIS ?AUTO_182 ?AUTO_181 ) ( VISIBLE ?AUTO_185 ?AUTO_183 ) ( AVAILABLE ?AUTO_182 ) ( CHANNEL_FREE ?AUTO_184 ) ( not ( = ?AUTO_181 ?AUTO_185 ) ) ( not ( = ?AUTO_181 ?AUTO_183 ) ) ( not ( = ?AUTO_185 ?AUTO_183 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_182 ?AUTO_184 ?AUTO_181 ?AUTO_185 ?AUTO_183 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_181 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_186 - WAYPOINT
    )
    :vars
    (
      ?AUTO_189 - LANDER
      ?AUTO_188 - WAYPOINT
      ?AUTO_187 - ROVER
      ?AUTO_190 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_189 ?AUTO_188 ) ( HAVE_SOIL_ANALYSIS ?AUTO_187 ?AUTO_186 ) ( VISIBLE ?AUTO_190 ?AUTO_188 ) ( AVAILABLE ?AUTO_187 ) ( CHANNEL_FREE ?AUTO_189 ) ( not ( = ?AUTO_186 ?AUTO_190 ) ) ( not ( = ?AUTO_186 ?AUTO_188 ) ) ( not ( = ?AUTO_190 ?AUTO_188 ) ) ( CAN_TRAVERSE ?AUTO_187 ?AUTO_186 ?AUTO_190 ) ( AT ?AUTO_187 ?AUTO_186 ) ( VISIBLE ?AUTO_186 ?AUTO_190 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_187 ?AUTO_186 ?AUTO_190 )
      ( GET_SOIL_DATA ?AUTO_186 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_186 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_191 - WAYPOINT
    )
    :vars
    (
      ?AUTO_195 - LANDER
      ?AUTO_193 - WAYPOINT
      ?AUTO_194 - WAYPOINT
      ?AUTO_192 - ROVER
      ?AUTO_196 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_195 ?AUTO_193 ) ( VISIBLE ?AUTO_194 ?AUTO_193 ) ( AVAILABLE ?AUTO_192 ) ( CHANNEL_FREE ?AUTO_195 ) ( not ( = ?AUTO_191 ?AUTO_194 ) ) ( not ( = ?AUTO_191 ?AUTO_193 ) ) ( not ( = ?AUTO_194 ?AUTO_193 ) ) ( CAN_TRAVERSE ?AUTO_192 ?AUTO_191 ?AUTO_194 ) ( AT ?AUTO_192 ?AUTO_191 ) ( VISIBLE ?AUTO_191 ?AUTO_194 ) ( AT_SOIL_SAMPLE ?AUTO_191 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_192 ) ( STORE_OF ?AUTO_196 ?AUTO_192 ) ( EMPTY ?AUTO_196 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_192 ?AUTO_196 ?AUTO_191 )
      ( GET_SOIL_DATA ?AUTO_191 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_191 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_220 - OBJECTIVE
      ?AUTO_221 - MODE
    )
    :vars
    (
      ?AUTO_225 - LANDER
      ?AUTO_223 - WAYPOINT
      ?AUTO_227 - WAYPOINT
      ?AUTO_224 - ROVER
      ?AUTO_226 - WAYPOINT
      ?AUTO_222 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_225 ?AUTO_223 ) ( VISIBLE ?AUTO_227 ?AUTO_223 ) ( AVAILABLE ?AUTO_224 ) ( CHANNEL_FREE ?AUTO_225 ) ( not ( = ?AUTO_227 ?AUTO_223 ) ) ( CAN_TRAVERSE ?AUTO_224 ?AUTO_226 ?AUTO_227 ) ( AT ?AUTO_224 ?AUTO_226 ) ( VISIBLE ?AUTO_226 ?AUTO_227 ) ( not ( = ?AUTO_223 ?AUTO_226 ) ) ( not ( = ?AUTO_227 ?AUTO_226 ) ) ( ON_BOARD ?AUTO_222 ?AUTO_224 ) ( EQUIPPED_FOR_IMAGING ?AUTO_224 ) ( SUPPORTS ?AUTO_222 ?AUTO_221 ) ( VISIBLE_FROM ?AUTO_220 ?AUTO_226 ) ( CALIBRATION_TARGET ?AUTO_222 ?AUTO_220 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_224 ?AUTO_222 ?AUTO_220 ?AUTO_226 )
      ( GET_IMAGE_DATA ?AUTO_220 ?AUTO_221 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_220 ?AUTO_221 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_228 - OBJECTIVE
      ?AUTO_229 - MODE
    )
    :vars
    (
      ?AUTO_234 - LANDER
      ?AUTO_230 - WAYPOINT
      ?AUTO_232 - WAYPOINT
      ?AUTO_235 - ROVER
      ?AUTO_233 - WAYPOINT
      ?AUTO_231 - CAMERA
      ?AUTO_236 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_234 ?AUTO_230 ) ( VISIBLE ?AUTO_232 ?AUTO_230 ) ( AVAILABLE ?AUTO_235 ) ( CHANNEL_FREE ?AUTO_234 ) ( not ( = ?AUTO_232 ?AUTO_230 ) ) ( CAN_TRAVERSE ?AUTO_235 ?AUTO_233 ?AUTO_232 ) ( VISIBLE ?AUTO_233 ?AUTO_232 ) ( not ( = ?AUTO_230 ?AUTO_233 ) ) ( not ( = ?AUTO_232 ?AUTO_233 ) ) ( ON_BOARD ?AUTO_231 ?AUTO_235 ) ( EQUIPPED_FOR_IMAGING ?AUTO_235 ) ( SUPPORTS ?AUTO_231 ?AUTO_229 ) ( VISIBLE_FROM ?AUTO_228 ?AUTO_233 ) ( CALIBRATION_TARGET ?AUTO_231 ?AUTO_228 ) ( CAN_TRAVERSE ?AUTO_235 ?AUTO_236 ?AUTO_233 ) ( AT ?AUTO_235 ?AUTO_236 ) ( VISIBLE ?AUTO_236 ?AUTO_233 ) ( not ( = ?AUTO_230 ?AUTO_236 ) ) ( not ( = ?AUTO_232 ?AUTO_236 ) ) ( not ( = ?AUTO_233 ?AUTO_236 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_235 ?AUTO_236 ?AUTO_233 )
      ( GET_IMAGE_DATA ?AUTO_228 ?AUTO_229 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_228 ?AUTO_229 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_237 - OBJECTIVE
      ?AUTO_238 - MODE
    )
    :vars
    (
      ?AUTO_245 - LANDER
      ?AUTO_242 - WAYPOINT
      ?AUTO_239 - WAYPOINT
      ?AUTO_243 - ROVER
      ?AUTO_241 - WAYPOINT
      ?AUTO_244 - CAMERA
      ?AUTO_240 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_245 ?AUTO_242 ) ( VISIBLE ?AUTO_239 ?AUTO_242 ) ( AVAILABLE ?AUTO_243 ) ( CHANNEL_FREE ?AUTO_245 ) ( not ( = ?AUTO_239 ?AUTO_242 ) ) ( CAN_TRAVERSE ?AUTO_243 ?AUTO_241 ?AUTO_239 ) ( VISIBLE ?AUTO_241 ?AUTO_239 ) ( not ( = ?AUTO_242 ?AUTO_241 ) ) ( not ( = ?AUTO_239 ?AUTO_241 ) ) ( ON_BOARD ?AUTO_244 ?AUTO_243 ) ( EQUIPPED_FOR_IMAGING ?AUTO_243 ) ( SUPPORTS ?AUTO_244 ?AUTO_238 ) ( VISIBLE_FROM ?AUTO_237 ?AUTO_241 ) ( CALIBRATION_TARGET ?AUTO_244 ?AUTO_237 ) ( CAN_TRAVERSE ?AUTO_243 ?AUTO_240 ?AUTO_241 ) ( VISIBLE ?AUTO_240 ?AUTO_241 ) ( not ( = ?AUTO_242 ?AUTO_240 ) ) ( not ( = ?AUTO_239 ?AUTO_240 ) ) ( not ( = ?AUTO_241 ?AUTO_240 ) ) ( CAN_TRAVERSE ?AUTO_243 ?AUTO_242 ?AUTO_240 ) ( AT ?AUTO_243 ?AUTO_242 ) ( VISIBLE ?AUTO_242 ?AUTO_240 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_243 ?AUTO_242 ?AUTO_240 )
      ( GET_IMAGE_DATA ?AUTO_237 ?AUTO_238 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_237 ?AUTO_238 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_246 - OBJECTIVE
      ?AUTO_247 - MODE
    )
    :vars
    (
      ?AUTO_251 - LANDER
      ?AUTO_253 - WAYPOINT
      ?AUTO_250 - WAYPOINT
      ?AUTO_252 - ROVER
      ?AUTO_254 - WAYPOINT
      ?AUTO_249 - CAMERA
      ?AUTO_248 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_251 ?AUTO_253 ) ( VISIBLE ?AUTO_250 ?AUTO_253 ) ( AVAILABLE ?AUTO_252 ) ( CHANNEL_FREE ?AUTO_251 ) ( not ( = ?AUTO_250 ?AUTO_253 ) ) ( CAN_TRAVERSE ?AUTO_252 ?AUTO_254 ?AUTO_250 ) ( VISIBLE ?AUTO_254 ?AUTO_250 ) ( not ( = ?AUTO_253 ?AUTO_254 ) ) ( not ( = ?AUTO_250 ?AUTO_254 ) ) ( ON_BOARD ?AUTO_249 ?AUTO_252 ) ( EQUIPPED_FOR_IMAGING ?AUTO_252 ) ( SUPPORTS ?AUTO_249 ?AUTO_247 ) ( VISIBLE_FROM ?AUTO_246 ?AUTO_254 ) ( CALIBRATION_TARGET ?AUTO_249 ?AUTO_246 ) ( CAN_TRAVERSE ?AUTO_252 ?AUTO_248 ?AUTO_254 ) ( VISIBLE ?AUTO_248 ?AUTO_254 ) ( not ( = ?AUTO_253 ?AUTO_248 ) ) ( not ( = ?AUTO_250 ?AUTO_248 ) ) ( not ( = ?AUTO_254 ?AUTO_248 ) ) ( CAN_TRAVERSE ?AUTO_252 ?AUTO_253 ?AUTO_248 ) ( VISIBLE ?AUTO_253 ?AUTO_248 ) ( CAN_TRAVERSE ?AUTO_252 ?AUTO_250 ?AUTO_253 ) ( AT ?AUTO_252 ?AUTO_250 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_252 ?AUTO_250 ?AUTO_253 )
      ( GET_IMAGE_DATA ?AUTO_246 ?AUTO_247 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_246 ?AUTO_247 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_297 - WAYPOINT
    )
    :vars
    (
      ?AUTO_299 - LANDER
      ?AUTO_302 - WAYPOINT
      ?AUTO_298 - ROVER
      ?AUTO_300 - STORE
      ?AUTO_301 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_299 ?AUTO_302 ) ( VISIBLE ?AUTO_297 ?AUTO_302 ) ( AVAILABLE ?AUTO_298 ) ( CHANNEL_FREE ?AUTO_299 ) ( not ( = ?AUTO_297 ?AUTO_302 ) ) ( AT_ROCK_SAMPLE ?AUTO_297 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_298 ) ( STORE_OF ?AUTO_300 ?AUTO_298 ) ( CAN_TRAVERSE ?AUTO_298 ?AUTO_301 ?AUTO_297 ) ( AT ?AUTO_298 ?AUTO_301 ) ( VISIBLE ?AUTO_301 ?AUTO_297 ) ( not ( = ?AUTO_297 ?AUTO_301 ) ) ( not ( = ?AUTO_302 ?AUTO_301 ) ) ( FULL ?AUTO_300 ) )
    :subtasks
    ( ( !DROP ?AUTO_298 ?AUTO_300 )
      ( GET_ROCK_DATA ?AUTO_297 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_297 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_303 - WAYPOINT
    )
    :vars
    (
      ?AUTO_307 - LANDER
      ?AUTO_305 - WAYPOINT
      ?AUTO_304 - ROVER
      ?AUTO_306 - STORE
      ?AUTO_308 - WAYPOINT
      ?AUTO_309 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_307 ?AUTO_305 ) ( VISIBLE ?AUTO_303 ?AUTO_305 ) ( AVAILABLE ?AUTO_304 ) ( CHANNEL_FREE ?AUTO_307 ) ( not ( = ?AUTO_303 ?AUTO_305 ) ) ( AT_ROCK_SAMPLE ?AUTO_303 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_304 ) ( STORE_OF ?AUTO_306 ?AUTO_304 ) ( CAN_TRAVERSE ?AUTO_304 ?AUTO_308 ?AUTO_303 ) ( VISIBLE ?AUTO_308 ?AUTO_303 ) ( not ( = ?AUTO_303 ?AUTO_308 ) ) ( not ( = ?AUTO_305 ?AUTO_308 ) ) ( FULL ?AUTO_306 ) ( CAN_TRAVERSE ?AUTO_304 ?AUTO_309 ?AUTO_308 ) ( AT ?AUTO_304 ?AUTO_309 ) ( VISIBLE ?AUTO_309 ?AUTO_308 ) ( not ( = ?AUTO_303 ?AUTO_309 ) ) ( not ( = ?AUTO_305 ?AUTO_309 ) ) ( not ( = ?AUTO_308 ?AUTO_309 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_304 ?AUTO_309 ?AUTO_308 )
      ( GET_ROCK_DATA ?AUTO_303 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_303 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_311 - WAYPOINT
    )
    :vars
    (
      ?AUTO_313 - LANDER
      ?AUTO_315 - WAYPOINT
      ?AUTO_314 - ROVER
      ?AUTO_316 - STORE
      ?AUTO_317 - WAYPOINT
      ?AUTO_312 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_313 ?AUTO_315 ) ( VISIBLE ?AUTO_311 ?AUTO_315 ) ( AVAILABLE ?AUTO_314 ) ( CHANNEL_FREE ?AUTO_313 ) ( not ( = ?AUTO_311 ?AUTO_315 ) ) ( AT_ROCK_SAMPLE ?AUTO_311 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_314 ) ( STORE_OF ?AUTO_316 ?AUTO_314 ) ( CAN_TRAVERSE ?AUTO_314 ?AUTO_317 ?AUTO_311 ) ( VISIBLE ?AUTO_317 ?AUTO_311 ) ( not ( = ?AUTO_311 ?AUTO_317 ) ) ( not ( = ?AUTO_315 ?AUTO_317 ) ) ( CAN_TRAVERSE ?AUTO_314 ?AUTO_312 ?AUTO_317 ) ( AT ?AUTO_314 ?AUTO_312 ) ( VISIBLE ?AUTO_312 ?AUTO_317 ) ( not ( = ?AUTO_311 ?AUTO_312 ) ) ( not ( = ?AUTO_315 ?AUTO_312 ) ) ( not ( = ?AUTO_317 ?AUTO_312 ) ) ( AT_ROCK_SAMPLE ?AUTO_312 ) ( EMPTY ?AUTO_316 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_314 ?AUTO_316 ?AUTO_312 )
      ( GET_ROCK_DATA ?AUTO_311 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_311 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_326 - OBJECTIVE
      ?AUTO_327 - MODE
    )
    :vars
    (
      ?AUTO_330 - LANDER
      ?AUTO_329 - WAYPOINT
      ?AUTO_328 - ROVER
      ?AUTO_331 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_330 ?AUTO_329 ) ( HAVE_IMAGE ?AUTO_328 ?AUTO_326 ?AUTO_327 ) ( VISIBLE ?AUTO_331 ?AUTO_329 ) ( AVAILABLE ?AUTO_328 ) ( CHANNEL_FREE ?AUTO_330 ) ( not ( = ?AUTO_331 ?AUTO_329 ) ) ( CAN_TRAVERSE ?AUTO_328 ?AUTO_329 ?AUTO_331 ) ( AT ?AUTO_328 ?AUTO_329 ) ( VISIBLE ?AUTO_329 ?AUTO_331 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_328 ?AUTO_329 ?AUTO_331 )
      ( GET_IMAGE_DATA ?AUTO_326 ?AUTO_327 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_326 ?AUTO_327 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_336 - OBJECTIVE
      ?AUTO_337 - MODE
    )
    :vars
    (
      ?AUTO_339 - LANDER
      ?AUTO_340 - WAYPOINT
      ?AUTO_338 - WAYPOINT
      ?AUTO_341 - ROVER
      ?AUTO_342 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_339 ?AUTO_340 ) ( VISIBLE ?AUTO_338 ?AUTO_340 ) ( AVAILABLE ?AUTO_341 ) ( CHANNEL_FREE ?AUTO_339 ) ( not ( = ?AUTO_338 ?AUTO_340 ) ) ( CAN_TRAVERSE ?AUTO_341 ?AUTO_340 ?AUTO_338 ) ( AT ?AUTO_341 ?AUTO_340 ) ( VISIBLE ?AUTO_340 ?AUTO_338 ) ( CALIBRATED ?AUTO_342 ?AUTO_341 ) ( ON_BOARD ?AUTO_342 ?AUTO_341 ) ( EQUIPPED_FOR_IMAGING ?AUTO_341 ) ( SUPPORTS ?AUTO_342 ?AUTO_337 ) ( VISIBLE_FROM ?AUTO_336 ?AUTO_340 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_341 ?AUTO_340 ?AUTO_336 ?AUTO_342 ?AUTO_337 )
      ( GET_IMAGE_DATA ?AUTO_336 ?AUTO_337 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_336 ?AUTO_337 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_343 - OBJECTIVE
      ?AUTO_344 - MODE
    )
    :vars
    (
      ?AUTO_346 - LANDER
      ?AUTO_348 - WAYPOINT
      ?AUTO_347 - WAYPOINT
      ?AUTO_345 - ROVER
      ?AUTO_349 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_346 ?AUTO_348 ) ( VISIBLE ?AUTO_347 ?AUTO_348 ) ( AVAILABLE ?AUTO_345 ) ( CHANNEL_FREE ?AUTO_346 ) ( not ( = ?AUTO_347 ?AUTO_348 ) ) ( CAN_TRAVERSE ?AUTO_345 ?AUTO_348 ?AUTO_347 ) ( AT ?AUTO_345 ?AUTO_348 ) ( VISIBLE ?AUTO_348 ?AUTO_347 ) ( ON_BOARD ?AUTO_349 ?AUTO_345 ) ( EQUIPPED_FOR_IMAGING ?AUTO_345 ) ( SUPPORTS ?AUTO_349 ?AUTO_344 ) ( VISIBLE_FROM ?AUTO_343 ?AUTO_348 ) ( CALIBRATION_TARGET ?AUTO_349 ?AUTO_343 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_345 ?AUTO_349 ?AUTO_343 ?AUTO_348 )
      ( GET_IMAGE_DATA ?AUTO_343 ?AUTO_344 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_343 ?AUTO_344 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_369 - OBJECTIVE
      ?AUTO_370 - MODE
    )
    :vars
    (
      ?AUTO_373 - LANDER
      ?AUTO_372 - WAYPOINT
      ?AUTO_374 - WAYPOINT
      ?AUTO_371 - ROVER
      ?AUTO_375 - CAMERA
      ?AUTO_376 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_373 ?AUTO_372 ) ( VISIBLE ?AUTO_374 ?AUTO_372 ) ( AVAILABLE ?AUTO_371 ) ( CHANNEL_FREE ?AUTO_373 ) ( not ( = ?AUTO_374 ?AUTO_372 ) ) ( CAN_TRAVERSE ?AUTO_371 ?AUTO_372 ?AUTO_374 ) ( AT ?AUTO_371 ?AUTO_372 ) ( VISIBLE ?AUTO_372 ?AUTO_374 ) ( ON_BOARD ?AUTO_375 ?AUTO_371 ) ( EQUIPPED_FOR_IMAGING ?AUTO_371 ) ( SUPPORTS ?AUTO_375 ?AUTO_370 ) ( VISIBLE_FROM ?AUTO_369 ?AUTO_372 ) ( CALIBRATION_TARGET ?AUTO_375 ?AUTO_376 ) ( VISIBLE_FROM ?AUTO_376 ?AUTO_372 ) ( not ( = ?AUTO_369 ?AUTO_376 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_371 ?AUTO_375 ?AUTO_376 ?AUTO_372 )
      ( GET_IMAGE_DATA ?AUTO_369 ?AUTO_370 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_369 ?AUTO_370 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_398 - WAYPOINT
    )
    :vars
    (
      ?AUTO_402 - LANDER
      ?AUTO_399 - WAYPOINT
      ?AUTO_401 - WAYPOINT
      ?AUTO_400 - ROVER
      ?AUTO_403 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_402 ?AUTO_399 ) ( VISIBLE ?AUTO_401 ?AUTO_399 ) ( AVAILABLE ?AUTO_400 ) ( CHANNEL_FREE ?AUTO_402 ) ( not ( = ?AUTO_398 ?AUTO_401 ) ) ( not ( = ?AUTO_398 ?AUTO_399 ) ) ( not ( = ?AUTO_401 ?AUTO_399 ) ) ( CAN_TRAVERSE ?AUTO_400 ?AUTO_398 ?AUTO_401 ) ( VISIBLE ?AUTO_398 ?AUTO_401 ) ( AT_ROCK_SAMPLE ?AUTO_398 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_400 ) ( STORE_OF ?AUTO_403 ?AUTO_400 ) ( EMPTY ?AUTO_403 ) ( CAN_TRAVERSE ?AUTO_400 ?AUTO_401 ?AUTO_398 ) ( AT ?AUTO_400 ?AUTO_401 ) ( VISIBLE ?AUTO_401 ?AUTO_398 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_400 ?AUTO_401 ?AUTO_398 )
      ( GET_ROCK_DATA ?AUTO_398 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_398 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_406 - WAYPOINT
    )
    :vars
    (
      ?AUTO_411 - LANDER
      ?AUTO_409 - WAYPOINT
      ?AUTO_407 - WAYPOINT
      ?AUTO_410 - ROVER
      ?AUTO_408 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_411 ?AUTO_409 ) ( VISIBLE ?AUTO_407 ?AUTO_409 ) ( AVAILABLE ?AUTO_410 ) ( CHANNEL_FREE ?AUTO_411 ) ( not ( = ?AUTO_406 ?AUTO_407 ) ) ( not ( = ?AUTO_406 ?AUTO_409 ) ) ( not ( = ?AUTO_407 ?AUTO_409 ) ) ( CAN_TRAVERSE ?AUTO_410 ?AUTO_406 ?AUTO_407 ) ( VISIBLE ?AUTO_406 ?AUTO_407 ) ( AT_ROCK_SAMPLE ?AUTO_406 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_410 ) ( STORE_OF ?AUTO_408 ?AUTO_410 ) ( EMPTY ?AUTO_408 ) ( CAN_TRAVERSE ?AUTO_410 ?AUTO_407 ?AUTO_406 ) ( VISIBLE ?AUTO_407 ?AUTO_406 ) ( CAN_TRAVERSE ?AUTO_410 ?AUTO_409 ?AUTO_407 ) ( AT ?AUTO_410 ?AUTO_409 ) ( VISIBLE ?AUTO_409 ?AUTO_407 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_410 ?AUTO_409 ?AUTO_407 )
      ( GET_ROCK_DATA ?AUTO_406 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_406 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_435 - WAYPOINT
    )
    :vars
    (
      ?AUTO_436 - ROVER
      ?AUTO_438 - WAYPOINT
      ?AUTO_437 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_436 ?AUTO_438 ) ( AT_LANDER ?AUTO_437 ?AUTO_435 ) ( HAVE_ROCK_ANALYSIS ?AUTO_436 ?AUTO_435 ) ( VISIBLE ?AUTO_438 ?AUTO_435 ) ( AVAILABLE ?AUTO_436 ) ( CHANNEL_FREE ?AUTO_437 ) ( not ( = ?AUTO_435 ?AUTO_438 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_436 ?AUTO_437 ?AUTO_435 ?AUTO_438 ?AUTO_435 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_435 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_439 - WAYPOINT
    )
    :vars
    (
      ?AUTO_440 - LANDER
      ?AUTO_441 - ROVER
      ?AUTO_442 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_440 ?AUTO_439 ) ( HAVE_ROCK_ANALYSIS ?AUTO_441 ?AUTO_439 ) ( VISIBLE ?AUTO_442 ?AUTO_439 ) ( AVAILABLE ?AUTO_441 ) ( CHANNEL_FREE ?AUTO_440 ) ( not ( = ?AUTO_439 ?AUTO_442 ) ) ( CAN_TRAVERSE ?AUTO_441 ?AUTO_439 ?AUTO_442 ) ( AT ?AUTO_441 ?AUTO_439 ) ( VISIBLE ?AUTO_439 ?AUTO_442 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_441 ?AUTO_439 ?AUTO_442 )
      ( GET_ROCK_DATA ?AUTO_439 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_439 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_443 - WAYPOINT
    )
    :vars
    (
      ?AUTO_444 - LANDER
      ?AUTO_446 - WAYPOINT
      ?AUTO_445 - ROVER
      ?AUTO_447 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_444 ?AUTO_443 ) ( VISIBLE ?AUTO_446 ?AUTO_443 ) ( AVAILABLE ?AUTO_445 ) ( CHANNEL_FREE ?AUTO_444 ) ( not ( = ?AUTO_443 ?AUTO_446 ) ) ( CAN_TRAVERSE ?AUTO_445 ?AUTO_443 ?AUTO_446 ) ( AT ?AUTO_445 ?AUTO_443 ) ( VISIBLE ?AUTO_443 ?AUTO_446 ) ( AT_ROCK_SAMPLE ?AUTO_443 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_445 ) ( STORE_OF ?AUTO_447 ?AUTO_445 ) ( EMPTY ?AUTO_447 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_445 ?AUTO_447 ?AUTO_443 )
      ( GET_ROCK_DATA ?AUTO_443 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_443 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_448 - WAYPOINT
    )
    :vars
    (
      ?AUTO_449 - LANDER
      ?AUTO_450 - WAYPOINT
      ?AUTO_451 - ROVER
      ?AUTO_452 - STORE
      ?AUTO_453 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_449 ?AUTO_448 ) ( VISIBLE ?AUTO_450 ?AUTO_448 ) ( AVAILABLE ?AUTO_451 ) ( CHANNEL_FREE ?AUTO_449 ) ( not ( = ?AUTO_448 ?AUTO_450 ) ) ( CAN_TRAVERSE ?AUTO_451 ?AUTO_448 ?AUTO_450 ) ( VISIBLE ?AUTO_448 ?AUTO_450 ) ( AT_ROCK_SAMPLE ?AUTO_448 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_451 ) ( STORE_OF ?AUTO_452 ?AUTO_451 ) ( EMPTY ?AUTO_452 ) ( CAN_TRAVERSE ?AUTO_451 ?AUTO_453 ?AUTO_448 ) ( AT ?AUTO_451 ?AUTO_453 ) ( VISIBLE ?AUTO_453 ?AUTO_448 ) ( not ( = ?AUTO_448 ?AUTO_453 ) ) ( not ( = ?AUTO_450 ?AUTO_453 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_451 ?AUTO_453 ?AUTO_448 )
      ( GET_ROCK_DATA ?AUTO_448 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_448 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_490 - WAYPOINT
    )
    :vars
    (
      ?AUTO_491 - ROVER
      ?AUTO_493 - WAYPOINT
      ?AUTO_492 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_491 ?AUTO_493 ) ( AT_LANDER ?AUTO_492 ?AUTO_490 ) ( HAVE_SOIL_ANALYSIS ?AUTO_491 ?AUTO_490 ) ( VISIBLE ?AUTO_493 ?AUTO_490 ) ( AVAILABLE ?AUTO_491 ) ( CHANNEL_FREE ?AUTO_492 ) ( not ( = ?AUTO_490 ?AUTO_493 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_491 ?AUTO_492 ?AUTO_490 ?AUTO_493 ?AUTO_490 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_490 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_494 - WAYPOINT
    )
    :vars
    (
      ?AUTO_496 - LANDER
      ?AUTO_495 - ROVER
      ?AUTO_497 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_496 ?AUTO_494 ) ( HAVE_SOIL_ANALYSIS ?AUTO_495 ?AUTO_494 ) ( VISIBLE ?AUTO_497 ?AUTO_494 ) ( AVAILABLE ?AUTO_495 ) ( CHANNEL_FREE ?AUTO_496 ) ( not ( = ?AUTO_494 ?AUTO_497 ) ) ( CAN_TRAVERSE ?AUTO_495 ?AUTO_494 ?AUTO_497 ) ( AT ?AUTO_495 ?AUTO_494 ) ( VISIBLE ?AUTO_494 ?AUTO_497 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_495 ?AUTO_494 ?AUTO_497 )
      ( GET_SOIL_DATA ?AUTO_494 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_494 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_498 - WAYPOINT
    )
    :vars
    (
      ?AUTO_500 - LANDER
      ?AUTO_501 - WAYPOINT
      ?AUTO_499 - ROVER
      ?AUTO_502 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_500 ?AUTO_498 ) ( VISIBLE ?AUTO_501 ?AUTO_498 ) ( AVAILABLE ?AUTO_499 ) ( CHANNEL_FREE ?AUTO_500 ) ( not ( = ?AUTO_498 ?AUTO_501 ) ) ( CAN_TRAVERSE ?AUTO_499 ?AUTO_498 ?AUTO_501 ) ( AT ?AUTO_499 ?AUTO_498 ) ( VISIBLE ?AUTO_498 ?AUTO_501 ) ( AT_SOIL_SAMPLE ?AUTO_498 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_499 ) ( STORE_OF ?AUTO_502 ?AUTO_499 ) ( EMPTY ?AUTO_502 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_499 ?AUTO_502 ?AUTO_498 )
      ( GET_SOIL_DATA ?AUTO_498 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_498 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_503 - WAYPOINT
    )
    :vars
    (
      ?AUTO_506 - LANDER
      ?AUTO_505 - WAYPOINT
      ?AUTO_504 - ROVER
      ?AUTO_507 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_506 ?AUTO_503 ) ( VISIBLE ?AUTO_505 ?AUTO_503 ) ( AVAILABLE ?AUTO_504 ) ( CHANNEL_FREE ?AUTO_506 ) ( not ( = ?AUTO_503 ?AUTO_505 ) ) ( CAN_TRAVERSE ?AUTO_504 ?AUTO_503 ?AUTO_505 ) ( VISIBLE ?AUTO_503 ?AUTO_505 ) ( AT_SOIL_SAMPLE ?AUTO_503 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_504 ) ( STORE_OF ?AUTO_507 ?AUTO_504 ) ( EMPTY ?AUTO_507 ) ( CAN_TRAVERSE ?AUTO_504 ?AUTO_505 ?AUTO_503 ) ( AT ?AUTO_504 ?AUTO_505 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_504 ?AUTO_505 ?AUTO_503 )
      ( GET_SOIL_DATA ?AUTO_503 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_503 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_508 - WAYPOINT
    )
    :vars
    (
      ?AUTO_511 - LANDER
      ?AUTO_510 - WAYPOINT
      ?AUTO_509 - ROVER
      ?AUTO_512 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_511 ?AUTO_508 ) ( VISIBLE ?AUTO_510 ?AUTO_508 ) ( AVAILABLE ?AUTO_509 ) ( CHANNEL_FREE ?AUTO_511 ) ( not ( = ?AUTO_508 ?AUTO_510 ) ) ( CAN_TRAVERSE ?AUTO_509 ?AUTO_508 ?AUTO_510 ) ( VISIBLE ?AUTO_508 ?AUTO_510 ) ( AT_SOIL_SAMPLE ?AUTO_508 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_509 ) ( STORE_OF ?AUTO_512 ?AUTO_509 ) ( CAN_TRAVERSE ?AUTO_509 ?AUTO_510 ?AUTO_508 ) ( AT ?AUTO_509 ?AUTO_510 ) ( FULL ?AUTO_512 ) )
    :subtasks
    ( ( !DROP ?AUTO_509 ?AUTO_512 )
      ( GET_SOIL_DATA ?AUTO_508 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_508 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_519 - WAYPOINT
    )
    :vars
    (
      ?AUTO_522 - LANDER
      ?AUTO_521 - WAYPOINT
      ?AUTO_523 - ROVER
      ?AUTO_520 - STORE
      ?AUTO_524 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_522 ?AUTO_519 ) ( VISIBLE ?AUTO_521 ?AUTO_519 ) ( AVAILABLE ?AUTO_523 ) ( CHANNEL_FREE ?AUTO_522 ) ( not ( = ?AUTO_519 ?AUTO_521 ) ) ( CAN_TRAVERSE ?AUTO_523 ?AUTO_519 ?AUTO_521 ) ( VISIBLE ?AUTO_519 ?AUTO_521 ) ( AT_SOIL_SAMPLE ?AUTO_519 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_523 ) ( STORE_OF ?AUTO_520 ?AUTO_523 ) ( EMPTY ?AUTO_520 ) ( CAN_TRAVERSE ?AUTO_523 ?AUTO_521 ?AUTO_519 ) ( CAN_TRAVERSE ?AUTO_523 ?AUTO_524 ?AUTO_521 ) ( AT ?AUTO_523 ?AUTO_524 ) ( VISIBLE ?AUTO_524 ?AUTO_521 ) ( not ( = ?AUTO_519 ?AUTO_524 ) ) ( not ( = ?AUTO_521 ?AUTO_524 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_523 ?AUTO_524 ?AUTO_521 )
      ( GET_SOIL_DATA ?AUTO_519 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_519 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_525 - WAYPOINT
    )
    :vars
    (
      ?AUTO_528 - LANDER
      ?AUTO_527 - WAYPOINT
      ?AUTO_529 - ROVER
      ?AUTO_526 - STORE
      ?AUTO_530 - WAYPOINT
      ?AUTO_531 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_528 ?AUTO_525 ) ( VISIBLE ?AUTO_527 ?AUTO_525 ) ( AVAILABLE ?AUTO_529 ) ( CHANNEL_FREE ?AUTO_528 ) ( not ( = ?AUTO_525 ?AUTO_527 ) ) ( CAN_TRAVERSE ?AUTO_529 ?AUTO_525 ?AUTO_527 ) ( VISIBLE ?AUTO_525 ?AUTO_527 ) ( AT_SOIL_SAMPLE ?AUTO_525 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_529 ) ( STORE_OF ?AUTO_526 ?AUTO_529 ) ( EMPTY ?AUTO_526 ) ( CAN_TRAVERSE ?AUTO_529 ?AUTO_527 ?AUTO_525 ) ( CAN_TRAVERSE ?AUTO_529 ?AUTO_530 ?AUTO_527 ) ( VISIBLE ?AUTO_530 ?AUTO_527 ) ( not ( = ?AUTO_525 ?AUTO_530 ) ) ( not ( = ?AUTO_527 ?AUTO_530 ) ) ( CAN_TRAVERSE ?AUTO_529 ?AUTO_531 ?AUTO_530 ) ( AT ?AUTO_529 ?AUTO_531 ) ( VISIBLE ?AUTO_531 ?AUTO_530 ) ( not ( = ?AUTO_525 ?AUTO_531 ) ) ( not ( = ?AUTO_527 ?AUTO_531 ) ) ( not ( = ?AUTO_530 ?AUTO_531 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_529 ?AUTO_531 ?AUTO_530 )
      ( GET_SOIL_DATA ?AUTO_525 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_525 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_570 - OBJECTIVE
      ?AUTO_571 - MODE
    )
    :vars
    (
      ?AUTO_576 - LANDER
      ?AUTO_573 - WAYPOINT
      ?AUTO_575 - WAYPOINT
      ?AUTO_572 - ROVER
      ?AUTO_574 - CAMERA
      ?AUTO_577 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_576 ?AUTO_573 ) ( VISIBLE ?AUTO_575 ?AUTO_573 ) ( AVAILABLE ?AUTO_572 ) ( CHANNEL_FREE ?AUTO_576 ) ( not ( = ?AUTO_575 ?AUTO_573 ) ) ( CAN_TRAVERSE ?AUTO_572 ?AUTO_573 ?AUTO_575 ) ( VISIBLE ?AUTO_573 ?AUTO_575 ) ( CALIBRATED ?AUTO_574 ?AUTO_572 ) ( ON_BOARD ?AUTO_574 ?AUTO_572 ) ( EQUIPPED_FOR_IMAGING ?AUTO_572 ) ( SUPPORTS ?AUTO_574 ?AUTO_571 ) ( VISIBLE_FROM ?AUTO_570 ?AUTO_573 ) ( CAN_TRAVERSE ?AUTO_572 ?AUTO_577 ?AUTO_573 ) ( AT ?AUTO_572 ?AUTO_577 ) ( VISIBLE ?AUTO_577 ?AUTO_573 ) ( not ( = ?AUTO_573 ?AUTO_577 ) ) ( not ( = ?AUTO_575 ?AUTO_577 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_572 ?AUTO_577 ?AUTO_573 )
      ( GET_IMAGE_DATA ?AUTO_570 ?AUTO_571 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_570 ?AUTO_571 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_582 - OBJECTIVE
      ?AUTO_583 - MODE
    )
    :vars
    (
      ?AUTO_586 - LANDER
      ?AUTO_585 - WAYPOINT
      ?AUTO_584 - WAYPOINT
      ?AUTO_588 - ROVER
      ?AUTO_587 - CAMERA
      ?AUTO_589 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_586 ?AUTO_585 ) ( VISIBLE ?AUTO_584 ?AUTO_585 ) ( AVAILABLE ?AUTO_588 ) ( CHANNEL_FREE ?AUTO_586 ) ( not ( = ?AUTO_584 ?AUTO_585 ) ) ( CAN_TRAVERSE ?AUTO_588 ?AUTO_585 ?AUTO_584 ) ( VISIBLE ?AUTO_585 ?AUTO_584 ) ( CALIBRATED ?AUTO_587 ?AUTO_588 ) ( ON_BOARD ?AUTO_587 ?AUTO_588 ) ( EQUIPPED_FOR_IMAGING ?AUTO_588 ) ( SUPPORTS ?AUTO_587 ?AUTO_583 ) ( VISIBLE_FROM ?AUTO_582 ?AUTO_585 ) ( CAN_TRAVERSE ?AUTO_588 ?AUTO_589 ?AUTO_585 ) ( VISIBLE ?AUTO_589 ?AUTO_585 ) ( not ( = ?AUTO_585 ?AUTO_589 ) ) ( not ( = ?AUTO_584 ?AUTO_589 ) ) ( CAN_TRAVERSE ?AUTO_588 ?AUTO_584 ?AUTO_589 ) ( AT ?AUTO_588 ?AUTO_584 ) ( VISIBLE ?AUTO_584 ?AUTO_589 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_588 ?AUTO_584 ?AUTO_589 )
      ( GET_IMAGE_DATA ?AUTO_582 ?AUTO_583 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_582 ?AUTO_583 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_590 - OBJECTIVE
      ?AUTO_591 - MODE
    )
    :vars
    (
      ?AUTO_595 - LANDER
      ?AUTO_596 - WAYPOINT
      ?AUTO_597 - WAYPOINT
      ?AUTO_592 - ROVER
      ?AUTO_594 - CAMERA
      ?AUTO_593 - WAYPOINT
      ?AUTO_598 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_595 ?AUTO_596 ) ( VISIBLE ?AUTO_597 ?AUTO_596 ) ( AVAILABLE ?AUTO_592 ) ( CHANNEL_FREE ?AUTO_595 ) ( not ( = ?AUTO_597 ?AUTO_596 ) ) ( CAN_TRAVERSE ?AUTO_592 ?AUTO_596 ?AUTO_597 ) ( VISIBLE ?AUTO_596 ?AUTO_597 ) ( ON_BOARD ?AUTO_594 ?AUTO_592 ) ( EQUIPPED_FOR_IMAGING ?AUTO_592 ) ( SUPPORTS ?AUTO_594 ?AUTO_591 ) ( VISIBLE_FROM ?AUTO_590 ?AUTO_596 ) ( CAN_TRAVERSE ?AUTO_592 ?AUTO_593 ?AUTO_596 ) ( VISIBLE ?AUTO_593 ?AUTO_596 ) ( not ( = ?AUTO_596 ?AUTO_593 ) ) ( not ( = ?AUTO_597 ?AUTO_593 ) ) ( CAN_TRAVERSE ?AUTO_592 ?AUTO_597 ?AUTO_593 ) ( AT ?AUTO_592 ?AUTO_597 ) ( VISIBLE ?AUTO_597 ?AUTO_593 ) ( CALIBRATION_TARGET ?AUTO_594 ?AUTO_598 ) ( VISIBLE_FROM ?AUTO_598 ?AUTO_597 ) ( not ( = ?AUTO_590 ?AUTO_598 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_592 ?AUTO_594 ?AUTO_598 ?AUTO_597 )
      ( GET_IMAGE_DATA ?AUTO_590 ?AUTO_591 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_590 ?AUTO_591 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_653 - OBJECTIVE
      ?AUTO_654 - MODE
    )
    :vars
    (
      ?AUTO_656 - LANDER
      ?AUTO_660 - WAYPOINT
      ?AUTO_655 - WAYPOINT
      ?AUTO_657 - ROVER
      ?AUTO_659 - CAMERA
      ?AUTO_658 - WAYPOINT
      ?AUTO_661 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_656 ?AUTO_660 ) ( VISIBLE ?AUTO_655 ?AUTO_660 ) ( AVAILABLE ?AUTO_657 ) ( CHANNEL_FREE ?AUTO_656 ) ( not ( = ?AUTO_655 ?AUTO_660 ) ) ( CAN_TRAVERSE ?AUTO_657 ?AUTO_660 ?AUTO_655 ) ( VISIBLE ?AUTO_660 ?AUTO_655 ) ( ON_BOARD ?AUTO_659 ?AUTO_657 ) ( EQUIPPED_FOR_IMAGING ?AUTO_657 ) ( SUPPORTS ?AUTO_659 ?AUTO_654 ) ( VISIBLE_FROM ?AUTO_653 ?AUTO_660 ) ( CAN_TRAVERSE ?AUTO_657 ?AUTO_658 ?AUTO_660 ) ( AT ?AUTO_657 ?AUTO_658 ) ( VISIBLE ?AUTO_658 ?AUTO_660 ) ( not ( = ?AUTO_660 ?AUTO_658 ) ) ( not ( = ?AUTO_655 ?AUTO_658 ) ) ( CALIBRATION_TARGET ?AUTO_659 ?AUTO_661 ) ( VISIBLE_FROM ?AUTO_661 ?AUTO_658 ) ( not ( = ?AUTO_653 ?AUTO_661 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_657 ?AUTO_659 ?AUTO_661 ?AUTO_658 )
      ( GET_IMAGE_DATA ?AUTO_653 ?AUTO_654 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_653 ?AUTO_654 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_673 - WAYPOINT
    )
    :vars
    (
      ?AUTO_674 - LANDER
      ?AUTO_676 - WAYPOINT
      ?AUTO_675 - ROVER
      ?AUTO_677 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_674 ?AUTO_676 ) ( VISIBLE ?AUTO_673 ?AUTO_676 ) ( AVAILABLE ?AUTO_675 ) ( CHANNEL_FREE ?AUTO_674 ) ( not ( = ?AUTO_673 ?AUTO_676 ) ) ( AT_SOIL_SAMPLE ?AUTO_673 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_675 ) ( STORE_OF ?AUTO_677 ?AUTO_675 ) ( EMPTY ?AUTO_677 ) ( CAN_TRAVERSE ?AUTO_675 ?AUTO_676 ?AUTO_673 ) ( AT ?AUTO_675 ?AUTO_676 ) ( VISIBLE ?AUTO_676 ?AUTO_673 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_675 ?AUTO_676 ?AUTO_673 )
      ( GET_SOIL_DATA ?AUTO_673 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_673 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_679 - WAYPOINT
    )
    :vars
    (
      ?AUTO_683 - LANDER
      ?AUTO_680 - WAYPOINT
      ?AUTO_682 - ROVER
      ?AUTO_681 - STORE
      ?AUTO_684 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_683 ?AUTO_680 ) ( VISIBLE ?AUTO_679 ?AUTO_680 ) ( AVAILABLE ?AUTO_682 ) ( CHANNEL_FREE ?AUTO_683 ) ( not ( = ?AUTO_679 ?AUTO_680 ) ) ( AT_SOIL_SAMPLE ?AUTO_679 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_682 ) ( STORE_OF ?AUTO_681 ?AUTO_682 ) ( EMPTY ?AUTO_681 ) ( CAN_TRAVERSE ?AUTO_682 ?AUTO_680 ?AUTO_679 ) ( VISIBLE ?AUTO_680 ?AUTO_679 ) ( CAN_TRAVERSE ?AUTO_682 ?AUTO_684 ?AUTO_680 ) ( AT ?AUTO_682 ?AUTO_684 ) ( VISIBLE ?AUTO_684 ?AUTO_680 ) ( not ( = ?AUTO_679 ?AUTO_684 ) ) ( not ( = ?AUTO_680 ?AUTO_684 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_682 ?AUTO_684 ?AUTO_680 )
      ( GET_SOIL_DATA ?AUTO_679 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_679 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_685 - WAYPOINT
    )
    :vars
    (
      ?AUTO_688 - LANDER
      ?AUTO_689 - WAYPOINT
      ?AUTO_687 - ROVER
      ?AUTO_686 - STORE
      ?AUTO_690 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_688 ?AUTO_689 ) ( VISIBLE ?AUTO_685 ?AUTO_689 ) ( AVAILABLE ?AUTO_687 ) ( CHANNEL_FREE ?AUTO_688 ) ( not ( = ?AUTO_685 ?AUTO_689 ) ) ( AT_SOIL_SAMPLE ?AUTO_685 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_687 ) ( STORE_OF ?AUTO_686 ?AUTO_687 ) ( CAN_TRAVERSE ?AUTO_687 ?AUTO_689 ?AUTO_685 ) ( VISIBLE ?AUTO_689 ?AUTO_685 ) ( CAN_TRAVERSE ?AUTO_687 ?AUTO_690 ?AUTO_689 ) ( AT ?AUTO_687 ?AUTO_690 ) ( VISIBLE ?AUTO_690 ?AUTO_689 ) ( not ( = ?AUTO_685 ?AUTO_690 ) ) ( not ( = ?AUTO_689 ?AUTO_690 ) ) ( FULL ?AUTO_686 ) )
    :subtasks
    ( ( !DROP ?AUTO_687 ?AUTO_686 )
      ( GET_SOIL_DATA ?AUTO_685 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_685 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_713 - WAYPOINT
    )
    :vars
    (
      ?AUTO_717 - LANDER
      ?AUTO_715 - WAYPOINT
      ?AUTO_714 - ROVER
      ?AUTO_716 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_717 ?AUTO_715 ) ( VISIBLE ?AUTO_713 ?AUTO_715 ) ( AVAILABLE ?AUTO_714 ) ( CHANNEL_FREE ?AUTO_717 ) ( not ( = ?AUTO_713 ?AUTO_715 ) ) ( AT_ROCK_SAMPLE ?AUTO_713 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_714 ) ( STORE_OF ?AUTO_716 ?AUTO_714 ) ( EMPTY ?AUTO_716 ) ( CAN_TRAVERSE ?AUTO_714 ?AUTO_715 ?AUTO_713 ) ( AT ?AUTO_714 ?AUTO_715 ) ( VISIBLE ?AUTO_715 ?AUTO_713 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_714 ?AUTO_715 ?AUTO_713 )
      ( GET_ROCK_DATA ?AUTO_713 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_713 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_719 - WAYPOINT
    )
    :vars
    (
      ?AUTO_723 - LANDER
      ?AUTO_721 - WAYPOINT
      ?AUTO_722 - ROVER
      ?AUTO_720 - STORE
      ?AUTO_724 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_723 ?AUTO_721 ) ( VISIBLE ?AUTO_719 ?AUTO_721 ) ( AVAILABLE ?AUTO_722 ) ( CHANNEL_FREE ?AUTO_723 ) ( not ( = ?AUTO_719 ?AUTO_721 ) ) ( AT_ROCK_SAMPLE ?AUTO_719 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_722 ) ( STORE_OF ?AUTO_720 ?AUTO_722 ) ( EMPTY ?AUTO_720 ) ( CAN_TRAVERSE ?AUTO_722 ?AUTO_721 ?AUTO_719 ) ( VISIBLE ?AUTO_721 ?AUTO_719 ) ( CAN_TRAVERSE ?AUTO_722 ?AUTO_724 ?AUTO_721 ) ( AT ?AUTO_722 ?AUTO_724 ) ( VISIBLE ?AUTO_724 ?AUTO_721 ) ( not ( = ?AUTO_719 ?AUTO_724 ) ) ( not ( = ?AUTO_721 ?AUTO_724 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_722 ?AUTO_724 ?AUTO_721 )
      ( GET_ROCK_DATA ?AUTO_719 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_719 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_725 - WAYPOINT
    )
    :vars
    (
      ?AUTO_729 - LANDER
      ?AUTO_726 - WAYPOINT
      ?AUTO_728 - ROVER
      ?AUTO_727 - STORE
      ?AUTO_730 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_729 ?AUTO_726 ) ( VISIBLE ?AUTO_725 ?AUTO_726 ) ( AVAILABLE ?AUTO_728 ) ( CHANNEL_FREE ?AUTO_729 ) ( not ( = ?AUTO_725 ?AUTO_726 ) ) ( AT_ROCK_SAMPLE ?AUTO_725 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_728 ) ( STORE_OF ?AUTO_727 ?AUTO_728 ) ( CAN_TRAVERSE ?AUTO_728 ?AUTO_726 ?AUTO_725 ) ( VISIBLE ?AUTO_726 ?AUTO_725 ) ( CAN_TRAVERSE ?AUTO_728 ?AUTO_730 ?AUTO_726 ) ( AT ?AUTO_728 ?AUTO_730 ) ( VISIBLE ?AUTO_730 ?AUTO_726 ) ( not ( = ?AUTO_725 ?AUTO_730 ) ) ( not ( = ?AUTO_726 ?AUTO_730 ) ) ( FULL ?AUTO_727 ) )
    :subtasks
    ( ( !DROP ?AUTO_728 ?AUTO_727 )
      ( GET_ROCK_DATA ?AUTO_725 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_725 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_750 - WAYPOINT
    )
    :vars
    (
      ?AUTO_752 - LANDER
      ?AUTO_753 - WAYPOINT
      ?AUTO_751 - ROVER
      ?AUTO_754 - STORE
      ?AUTO_755 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_752 ?AUTO_753 ) ( VISIBLE ?AUTO_750 ?AUTO_753 ) ( AVAILABLE ?AUTO_751 ) ( CHANNEL_FREE ?AUTO_752 ) ( not ( = ?AUTO_750 ?AUTO_753 ) ) ( AT_ROCK_SAMPLE ?AUTO_750 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_751 ) ( STORE_OF ?AUTO_754 ?AUTO_751 ) ( FULL ?AUTO_754 ) ( CAN_TRAVERSE ?AUTO_751 ?AUTO_755 ?AUTO_750 ) ( AT ?AUTO_751 ?AUTO_755 ) ( VISIBLE ?AUTO_755 ?AUTO_750 ) ( not ( = ?AUTO_750 ?AUTO_755 ) ) ( not ( = ?AUTO_753 ?AUTO_755 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_751 ?AUTO_755 ?AUTO_750 )
      ( GET_ROCK_DATA ?AUTO_750 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_750 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_757 - WAYPOINT
    )
    :vars
    (
      ?AUTO_759 - LANDER
      ?AUTO_758 - WAYPOINT
      ?AUTO_760 - ROVER
      ?AUTO_761 - STORE
      ?AUTO_762 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_759 ?AUTO_758 ) ( VISIBLE ?AUTO_757 ?AUTO_758 ) ( AVAILABLE ?AUTO_760 ) ( CHANNEL_FREE ?AUTO_759 ) ( not ( = ?AUTO_757 ?AUTO_758 ) ) ( AT_ROCK_SAMPLE ?AUTO_757 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_760 ) ( STORE_OF ?AUTO_761 ?AUTO_760 ) ( CAN_TRAVERSE ?AUTO_760 ?AUTO_762 ?AUTO_757 ) ( AT ?AUTO_760 ?AUTO_762 ) ( VISIBLE ?AUTO_762 ?AUTO_757 ) ( not ( = ?AUTO_757 ?AUTO_762 ) ) ( not ( = ?AUTO_758 ?AUTO_762 ) ) ( AT_ROCK_SAMPLE ?AUTO_762 ) ( EMPTY ?AUTO_761 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_760 ?AUTO_761 ?AUTO_762 )
      ( GET_ROCK_DATA ?AUTO_757 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_757 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3032 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3035 - LANDER
      ?AUTO_3034 - WAYPOINT
      ?AUTO_3036 - ROVER
      ?AUTO_3033 - STORE
      ?AUTO_3037 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3035 ?AUTO_3034 ) ( VISIBLE ?AUTO_3032 ?AUTO_3034 ) ( AVAILABLE ?AUTO_3036 ) ( CHANNEL_FREE ?AUTO_3035 ) ( not ( = ?AUTO_3032 ?AUTO_3034 ) ) ( AT_ROCK_SAMPLE ?AUTO_3032 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3036 ) ( STORE_OF ?AUTO_3033 ?AUTO_3036 ) ( EMPTY ?AUTO_3033 ) ( CAN_TRAVERSE ?AUTO_3036 ?AUTO_3037 ?AUTO_3032 ) ( VISIBLE ?AUTO_3037 ?AUTO_3032 ) ( not ( = ?AUTO_3032 ?AUTO_3037 ) ) ( not ( = ?AUTO_3034 ?AUTO_3037 ) ) ( CAN_TRAVERSE ?AUTO_3036 ?AUTO_3034 ?AUTO_3037 ) ( AT ?AUTO_3036 ?AUTO_3034 ) ( VISIBLE ?AUTO_3034 ?AUTO_3037 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3036 ?AUTO_3034 ?AUTO_3037 )
      ( GET_ROCK_DATA ?AUTO_3032 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3032 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3038 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3041 - LANDER
      ?AUTO_3039 - WAYPOINT
      ?AUTO_3043 - ROVER
      ?AUTO_3040 - STORE
      ?AUTO_3042 - WAYPOINT
      ?AUTO_3044 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3041 ?AUTO_3039 ) ( VISIBLE ?AUTO_3038 ?AUTO_3039 ) ( AVAILABLE ?AUTO_3043 ) ( CHANNEL_FREE ?AUTO_3041 ) ( not ( = ?AUTO_3038 ?AUTO_3039 ) ) ( AT_ROCK_SAMPLE ?AUTO_3038 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3043 ) ( STORE_OF ?AUTO_3040 ?AUTO_3043 ) ( EMPTY ?AUTO_3040 ) ( CAN_TRAVERSE ?AUTO_3043 ?AUTO_3042 ?AUTO_3038 ) ( VISIBLE ?AUTO_3042 ?AUTO_3038 ) ( not ( = ?AUTO_3038 ?AUTO_3042 ) ) ( not ( = ?AUTO_3039 ?AUTO_3042 ) ) ( CAN_TRAVERSE ?AUTO_3043 ?AUTO_3039 ?AUTO_3042 ) ( VISIBLE ?AUTO_3039 ?AUTO_3042 ) ( CAN_TRAVERSE ?AUTO_3043 ?AUTO_3044 ?AUTO_3039 ) ( AT ?AUTO_3043 ?AUTO_3044 ) ( VISIBLE ?AUTO_3044 ?AUTO_3039 ) ( not ( = ?AUTO_3038 ?AUTO_3044 ) ) ( not ( = ?AUTO_3039 ?AUTO_3044 ) ) ( not ( = ?AUTO_3042 ?AUTO_3044 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3043 ?AUTO_3044 ?AUTO_3039 )
      ( GET_ROCK_DATA ?AUTO_3038 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3038 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6162 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6167 - LANDER
      ?AUTO_6164 - WAYPOINT
      ?AUTO_6163 - ROVER
      ?AUTO_6165 - STORE
      ?AUTO_6166 - WAYPOINT
      ?AUTO_6168 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6167 ?AUTO_6164 ) ( VISIBLE ?AUTO_6162 ?AUTO_6164 ) ( AVAILABLE ?AUTO_6163 ) ( CHANNEL_FREE ?AUTO_6167 ) ( not ( = ?AUTO_6162 ?AUTO_6164 ) ) ( AT_ROCK_SAMPLE ?AUTO_6162 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6163 ) ( STORE_OF ?AUTO_6165 ?AUTO_6163 ) ( CAN_TRAVERSE ?AUTO_6163 ?AUTO_6166 ?AUTO_6162 ) ( VISIBLE ?AUTO_6166 ?AUTO_6162 ) ( not ( = ?AUTO_6162 ?AUTO_6166 ) ) ( not ( = ?AUTO_6164 ?AUTO_6166 ) ) ( CAN_TRAVERSE ?AUTO_6163 ?AUTO_6164 ?AUTO_6166 ) ( VISIBLE ?AUTO_6164 ?AUTO_6166 ) ( CAN_TRAVERSE ?AUTO_6163 ?AUTO_6168 ?AUTO_6164 ) ( AT ?AUTO_6163 ?AUTO_6168 ) ( VISIBLE ?AUTO_6168 ?AUTO_6164 ) ( not ( = ?AUTO_6162 ?AUTO_6168 ) ) ( not ( = ?AUTO_6164 ?AUTO_6168 ) ) ( not ( = ?AUTO_6166 ?AUTO_6168 ) ) ( FULL ?AUTO_6165 ) )
    :subtasks
    ( ( !DROP ?AUTO_6163 ?AUTO_6165 )
      ( GET_ROCK_DATA ?AUTO_6162 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6162 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_837 - OBJECTIVE
      ?AUTO_838 - MODE
    )
    :vars
    (
      ?AUTO_844 - LANDER
      ?AUTO_842 - WAYPOINT
      ?AUTO_841 - WAYPOINT
      ?AUTO_843 - ROVER
      ?AUTO_840 - CAMERA
      ?AUTO_839 - OBJECTIVE
      ?AUTO_845 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_844 ?AUTO_842 ) ( VISIBLE ?AUTO_841 ?AUTO_842 ) ( AVAILABLE ?AUTO_843 ) ( CHANNEL_FREE ?AUTO_844 ) ( not ( = ?AUTO_841 ?AUTO_842 ) ) ( CAN_TRAVERSE ?AUTO_843 ?AUTO_842 ?AUTO_841 ) ( VISIBLE ?AUTO_842 ?AUTO_841 ) ( ON_BOARD ?AUTO_840 ?AUTO_843 ) ( EQUIPPED_FOR_IMAGING ?AUTO_843 ) ( SUPPORTS ?AUTO_840 ?AUTO_838 ) ( VISIBLE_FROM ?AUTO_837 ?AUTO_842 ) ( CALIBRATION_TARGET ?AUTO_840 ?AUTO_839 ) ( VISIBLE_FROM ?AUTO_839 ?AUTO_842 ) ( not ( = ?AUTO_837 ?AUTO_839 ) ) ( CAN_TRAVERSE ?AUTO_843 ?AUTO_845 ?AUTO_842 ) ( AT ?AUTO_843 ?AUTO_845 ) ( VISIBLE ?AUTO_845 ?AUTO_842 ) ( not ( = ?AUTO_842 ?AUTO_845 ) ) ( not ( = ?AUTO_841 ?AUTO_845 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_843 ?AUTO_845 ?AUTO_842 )
      ( GET_IMAGE_DATA ?AUTO_837 ?AUTO_838 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_837 ?AUTO_838 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_880 - OBJECTIVE
      ?AUTO_881 - MODE
    )
    :vars
    (
      ?AUTO_886 - LANDER
      ?AUTO_883 - WAYPOINT
      ?AUTO_885 - WAYPOINT
      ?AUTO_882 - ROVER
      ?AUTO_884 - CAMERA
      ?AUTO_887 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_886 ?AUTO_883 ) ( VISIBLE ?AUTO_885 ?AUTO_883 ) ( AVAILABLE ?AUTO_882 ) ( CHANNEL_FREE ?AUTO_886 ) ( not ( = ?AUTO_885 ?AUTO_883 ) ) ( CAN_TRAVERSE ?AUTO_882 ?AUTO_883 ?AUTO_885 ) ( VISIBLE ?AUTO_883 ?AUTO_885 ) ( ON_BOARD ?AUTO_884 ?AUTO_882 ) ( EQUIPPED_FOR_IMAGING ?AUTO_882 ) ( SUPPORTS ?AUTO_884 ?AUTO_881 ) ( VISIBLE_FROM ?AUTO_880 ?AUTO_883 ) ( CALIBRATION_TARGET ?AUTO_884 ?AUTO_880 ) ( CAN_TRAVERSE ?AUTO_882 ?AUTO_887 ?AUTO_883 ) ( AT ?AUTO_882 ?AUTO_887 ) ( VISIBLE ?AUTO_887 ?AUTO_883 ) ( not ( = ?AUTO_883 ?AUTO_887 ) ) ( not ( = ?AUTO_885 ?AUTO_887 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_882 ?AUTO_887 ?AUTO_883 )
      ( GET_IMAGE_DATA ?AUTO_880 ?AUTO_881 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_880 ?AUTO_881 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_931 - WAYPOINT
    )
    :vars
    (
      ?AUTO_933 - LANDER
      ?AUTO_934 - WAYPOINT
      ?AUTO_932 - ROVER
      ?AUTO_935 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_933 ?AUTO_931 ) ( VISIBLE ?AUTO_934 ?AUTO_931 ) ( AVAILABLE ?AUTO_932 ) ( CHANNEL_FREE ?AUTO_933 ) ( not ( = ?AUTO_931 ?AUTO_934 ) ) ( CAN_TRAVERSE ?AUTO_932 ?AUTO_931 ?AUTO_934 ) ( VISIBLE ?AUTO_931 ?AUTO_934 ) ( AT_ROCK_SAMPLE ?AUTO_931 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_932 ) ( STORE_OF ?AUTO_935 ?AUTO_932 ) ( EMPTY ?AUTO_935 ) ( CAN_TRAVERSE ?AUTO_932 ?AUTO_934 ?AUTO_931 ) ( AT ?AUTO_932 ?AUTO_934 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_932 ?AUTO_934 ?AUTO_931 )
      ( GET_ROCK_DATA ?AUTO_931 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_931 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_936 - WAYPOINT
    )
    :vars
    (
      ?AUTO_940 - LANDER
      ?AUTO_937 - WAYPOINT
      ?AUTO_938 - ROVER
      ?AUTO_939 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_940 ?AUTO_936 ) ( VISIBLE ?AUTO_937 ?AUTO_936 ) ( AVAILABLE ?AUTO_938 ) ( CHANNEL_FREE ?AUTO_940 ) ( not ( = ?AUTO_936 ?AUTO_937 ) ) ( CAN_TRAVERSE ?AUTO_938 ?AUTO_936 ?AUTO_937 ) ( VISIBLE ?AUTO_936 ?AUTO_937 ) ( AT_ROCK_SAMPLE ?AUTO_936 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_938 ) ( STORE_OF ?AUTO_939 ?AUTO_938 ) ( CAN_TRAVERSE ?AUTO_938 ?AUTO_937 ?AUTO_936 ) ( AT ?AUTO_938 ?AUTO_937 ) ( FULL ?AUTO_939 ) )
    :subtasks
    ( ( !DROP ?AUTO_938 ?AUTO_939 )
      ( GET_ROCK_DATA ?AUTO_936 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_936 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_962 - WAYPOINT
    )
    :vars
    (
      ?AUTO_964 - LANDER
      ?AUTO_966 - WAYPOINT
      ?AUTO_963 - WAYPOINT
      ?AUTO_967 - ROVER
      ?AUTO_965 - STORE
      ?AUTO_968 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_964 ?AUTO_966 ) ( VISIBLE ?AUTO_963 ?AUTO_966 ) ( AVAILABLE ?AUTO_967 ) ( CHANNEL_FREE ?AUTO_964 ) ( not ( = ?AUTO_962 ?AUTO_963 ) ) ( not ( = ?AUTO_962 ?AUTO_966 ) ) ( not ( = ?AUTO_963 ?AUTO_966 ) ) ( CAN_TRAVERSE ?AUTO_967 ?AUTO_962 ?AUTO_963 ) ( VISIBLE ?AUTO_962 ?AUTO_963 ) ( AT_SOIL_SAMPLE ?AUTO_962 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_967 ) ( STORE_OF ?AUTO_965 ?AUTO_967 ) ( EMPTY ?AUTO_965 ) ( CAN_TRAVERSE ?AUTO_967 ?AUTO_968 ?AUTO_962 ) ( AT ?AUTO_967 ?AUTO_968 ) ( VISIBLE ?AUTO_968 ?AUTO_962 ) ( not ( = ?AUTO_962 ?AUTO_968 ) ) ( not ( = ?AUTO_966 ?AUTO_968 ) ) ( not ( = ?AUTO_963 ?AUTO_968 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_967 ?AUTO_968 ?AUTO_962 )
      ( GET_SOIL_DATA ?AUTO_962 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_962 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_969 - WAYPOINT
    )
    :vars
    (
      ?AUTO_971 - LANDER
      ?AUTO_970 - WAYPOINT
      ?AUTO_973 - WAYPOINT
      ?AUTO_972 - ROVER
      ?AUTO_974 - STORE
      ?AUTO_975 - WAYPOINT
      ?AUTO_976 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_971 ?AUTO_970 ) ( VISIBLE ?AUTO_973 ?AUTO_970 ) ( AVAILABLE ?AUTO_972 ) ( CHANNEL_FREE ?AUTO_971 ) ( not ( = ?AUTO_969 ?AUTO_973 ) ) ( not ( = ?AUTO_969 ?AUTO_970 ) ) ( not ( = ?AUTO_973 ?AUTO_970 ) ) ( CAN_TRAVERSE ?AUTO_972 ?AUTO_969 ?AUTO_973 ) ( VISIBLE ?AUTO_969 ?AUTO_973 ) ( AT_SOIL_SAMPLE ?AUTO_969 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_972 ) ( STORE_OF ?AUTO_974 ?AUTO_972 ) ( EMPTY ?AUTO_974 ) ( CAN_TRAVERSE ?AUTO_972 ?AUTO_975 ?AUTO_969 ) ( VISIBLE ?AUTO_975 ?AUTO_969 ) ( not ( = ?AUTO_969 ?AUTO_975 ) ) ( not ( = ?AUTO_970 ?AUTO_975 ) ) ( not ( = ?AUTO_973 ?AUTO_975 ) ) ( CAN_TRAVERSE ?AUTO_972 ?AUTO_976 ?AUTO_975 ) ( AT ?AUTO_972 ?AUTO_976 ) ( VISIBLE ?AUTO_976 ?AUTO_975 ) ( not ( = ?AUTO_969 ?AUTO_976 ) ) ( not ( = ?AUTO_970 ?AUTO_976 ) ) ( not ( = ?AUTO_973 ?AUTO_976 ) ) ( not ( = ?AUTO_975 ?AUTO_976 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_972 ?AUTO_976 ?AUTO_975 )
      ( GET_SOIL_DATA ?AUTO_969 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_969 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_996 - WAYPOINT
    )
    :vars
    (
      ?AUTO_998 - LANDER
      ?AUTO_1000 - WAYPOINT
      ?AUTO_999 - WAYPOINT
      ?AUTO_997 - ROVER
      ?AUTO_1001 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_998 ?AUTO_1000 ) ( VISIBLE ?AUTO_999 ?AUTO_1000 ) ( AVAILABLE ?AUTO_997 ) ( CHANNEL_FREE ?AUTO_998 ) ( not ( = ?AUTO_996 ?AUTO_999 ) ) ( not ( = ?AUTO_996 ?AUTO_1000 ) ) ( not ( = ?AUTO_999 ?AUTO_1000 ) ) ( CAN_TRAVERSE ?AUTO_997 ?AUTO_996 ?AUTO_999 ) ( AT ?AUTO_997 ?AUTO_996 ) ( VISIBLE ?AUTO_996 ?AUTO_999 ) ( AT_ROCK_SAMPLE ?AUTO_996 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_997 ) ( STORE_OF ?AUTO_1001 ?AUTO_997 ) ( FULL ?AUTO_1001 ) )
    :subtasks
    ( ( !DROP ?AUTO_997 ?AUTO_1001 )
      ( GET_ROCK_DATA ?AUTO_996 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_996 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1011 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1017 - LANDER
      ?AUTO_1013 - WAYPOINT
      ?AUTO_1014 - WAYPOINT
      ?AUTO_1016 - ROVER
      ?AUTO_1012 - STORE
      ?AUTO_1015 - WAYPOINT
      ?AUTO_1018 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1017 ?AUTO_1013 ) ( VISIBLE ?AUTO_1014 ?AUTO_1013 ) ( AVAILABLE ?AUTO_1016 ) ( CHANNEL_FREE ?AUTO_1017 ) ( not ( = ?AUTO_1011 ?AUTO_1014 ) ) ( not ( = ?AUTO_1011 ?AUTO_1013 ) ) ( not ( = ?AUTO_1014 ?AUTO_1013 ) ) ( CAN_TRAVERSE ?AUTO_1016 ?AUTO_1011 ?AUTO_1014 ) ( VISIBLE ?AUTO_1011 ?AUTO_1014 ) ( AT_ROCK_SAMPLE ?AUTO_1011 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1016 ) ( STORE_OF ?AUTO_1012 ?AUTO_1016 ) ( EMPTY ?AUTO_1012 ) ( CAN_TRAVERSE ?AUTO_1016 ?AUTO_1015 ?AUTO_1011 ) ( VISIBLE ?AUTO_1015 ?AUTO_1011 ) ( not ( = ?AUTO_1011 ?AUTO_1015 ) ) ( not ( = ?AUTO_1013 ?AUTO_1015 ) ) ( not ( = ?AUTO_1014 ?AUTO_1015 ) ) ( CAN_TRAVERSE ?AUTO_1016 ?AUTO_1018 ?AUTO_1015 ) ( AT ?AUTO_1016 ?AUTO_1018 ) ( VISIBLE ?AUTO_1018 ?AUTO_1015 ) ( not ( = ?AUTO_1011 ?AUTO_1018 ) ) ( not ( = ?AUTO_1013 ?AUTO_1018 ) ) ( not ( = ?AUTO_1014 ?AUTO_1018 ) ) ( not ( = ?AUTO_1015 ?AUTO_1018 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1016 ?AUTO_1018 ?AUTO_1015 )
      ( GET_ROCK_DATA ?AUTO_1011 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1011 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1037 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1039 - LANDER
      ?AUTO_1041 - WAYPOINT
      ?AUTO_1040 - ROVER
      ?AUTO_1038 - STORE
      ?AUTO_1042 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1039 ?AUTO_1041 ) ( VISIBLE ?AUTO_1037 ?AUTO_1041 ) ( AVAILABLE ?AUTO_1040 ) ( CHANNEL_FREE ?AUTO_1039 ) ( not ( = ?AUTO_1037 ?AUTO_1041 ) ) ( AT_SOIL_SAMPLE ?AUTO_1037 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1040 ) ( STORE_OF ?AUTO_1038 ?AUTO_1040 ) ( CAN_TRAVERSE ?AUTO_1040 ?AUTO_1042 ?AUTO_1037 ) ( AT ?AUTO_1040 ?AUTO_1042 ) ( VISIBLE ?AUTO_1042 ?AUTO_1037 ) ( not ( = ?AUTO_1037 ?AUTO_1042 ) ) ( not ( = ?AUTO_1041 ?AUTO_1042 ) ) ( FULL ?AUTO_1038 ) )
    :subtasks
    ( ( !DROP ?AUTO_1040 ?AUTO_1038 )
      ( GET_SOIL_DATA ?AUTO_1037 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1037 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1054 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1058 - LANDER
      ?AUTO_1059 - WAYPOINT
      ?AUTO_1055 - ROVER
      ?AUTO_1060 - STORE
      ?AUTO_1056 - WAYPOINT
      ?AUTO_1057 - WAYPOINT
      ?AUTO_1061 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1058 ?AUTO_1059 ) ( VISIBLE ?AUTO_1054 ?AUTO_1059 ) ( AVAILABLE ?AUTO_1055 ) ( CHANNEL_FREE ?AUTO_1058 ) ( not ( = ?AUTO_1054 ?AUTO_1059 ) ) ( AT_SOIL_SAMPLE ?AUTO_1054 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1055 ) ( STORE_OF ?AUTO_1060 ?AUTO_1055 ) ( EMPTY ?AUTO_1060 ) ( CAN_TRAVERSE ?AUTO_1055 ?AUTO_1056 ?AUTO_1054 ) ( VISIBLE ?AUTO_1056 ?AUTO_1054 ) ( not ( = ?AUTO_1054 ?AUTO_1056 ) ) ( not ( = ?AUTO_1059 ?AUTO_1056 ) ) ( CAN_TRAVERSE ?AUTO_1055 ?AUTO_1057 ?AUTO_1056 ) ( VISIBLE ?AUTO_1057 ?AUTO_1056 ) ( not ( = ?AUTO_1054 ?AUTO_1057 ) ) ( not ( = ?AUTO_1059 ?AUTO_1057 ) ) ( not ( = ?AUTO_1056 ?AUTO_1057 ) ) ( CAN_TRAVERSE ?AUTO_1055 ?AUTO_1061 ?AUTO_1057 ) ( AT ?AUTO_1055 ?AUTO_1061 ) ( VISIBLE ?AUTO_1061 ?AUTO_1057 ) ( not ( = ?AUTO_1054 ?AUTO_1061 ) ) ( not ( = ?AUTO_1059 ?AUTO_1061 ) ) ( not ( = ?AUTO_1056 ?AUTO_1061 ) ) ( not ( = ?AUTO_1057 ?AUTO_1061 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1055 ?AUTO_1061 ?AUTO_1057 )
      ( GET_SOIL_DATA ?AUTO_1054 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1054 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1104 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1108 - LANDER
      ?AUTO_1105 - WAYPOINT
      ?AUTO_1109 - ROVER
      ?AUTO_1110 - STORE
      ?AUTO_1107 - WAYPOINT
      ?AUTO_1106 - WAYPOINT
      ?AUTO_1111 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1108 ?AUTO_1105 ) ( VISIBLE ?AUTO_1104 ?AUTO_1105 ) ( AVAILABLE ?AUTO_1109 ) ( CHANNEL_FREE ?AUTO_1108 ) ( not ( = ?AUTO_1104 ?AUTO_1105 ) ) ( AT_ROCK_SAMPLE ?AUTO_1104 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1109 ) ( STORE_OF ?AUTO_1110 ?AUTO_1109 ) ( EMPTY ?AUTO_1110 ) ( CAN_TRAVERSE ?AUTO_1109 ?AUTO_1107 ?AUTO_1104 ) ( VISIBLE ?AUTO_1107 ?AUTO_1104 ) ( not ( = ?AUTO_1104 ?AUTO_1107 ) ) ( not ( = ?AUTO_1105 ?AUTO_1107 ) ) ( CAN_TRAVERSE ?AUTO_1109 ?AUTO_1106 ?AUTO_1107 ) ( VISIBLE ?AUTO_1106 ?AUTO_1107 ) ( not ( = ?AUTO_1104 ?AUTO_1106 ) ) ( not ( = ?AUTO_1105 ?AUTO_1106 ) ) ( not ( = ?AUTO_1107 ?AUTO_1106 ) ) ( CAN_TRAVERSE ?AUTO_1109 ?AUTO_1111 ?AUTO_1106 ) ( AT ?AUTO_1109 ?AUTO_1111 ) ( VISIBLE ?AUTO_1111 ?AUTO_1106 ) ( not ( = ?AUTO_1104 ?AUTO_1111 ) ) ( not ( = ?AUTO_1105 ?AUTO_1111 ) ) ( not ( = ?AUTO_1107 ?AUTO_1111 ) ) ( not ( = ?AUTO_1106 ?AUTO_1111 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1109 ?AUTO_1111 ?AUTO_1106 )
      ( GET_ROCK_DATA ?AUTO_1104 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1104 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1157 - OBJECTIVE
      ?AUTO_1158 - MODE
    )
    :vars
    (
      ?AUTO_1161 - LANDER
      ?AUTO_1160 - WAYPOINT
      ?AUTO_1163 - WAYPOINT
      ?AUTO_1164 - ROVER
      ?AUTO_1162 - CAMERA
      ?AUTO_1159 - WAYPOINT
      ?AUTO_1165 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1161 ?AUTO_1160 ) ( VISIBLE ?AUTO_1163 ?AUTO_1160 ) ( AVAILABLE ?AUTO_1164 ) ( CHANNEL_FREE ?AUTO_1161 ) ( not ( = ?AUTO_1163 ?AUTO_1160 ) ) ( CAN_TRAVERSE ?AUTO_1164 ?AUTO_1160 ?AUTO_1163 ) ( VISIBLE ?AUTO_1160 ?AUTO_1163 ) ( CALIBRATED ?AUTO_1162 ?AUTO_1164 ) ( ON_BOARD ?AUTO_1162 ?AUTO_1164 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1164 ) ( SUPPORTS ?AUTO_1162 ?AUTO_1158 ) ( VISIBLE_FROM ?AUTO_1157 ?AUTO_1160 ) ( CAN_TRAVERSE ?AUTO_1164 ?AUTO_1159 ?AUTO_1160 ) ( VISIBLE ?AUTO_1159 ?AUTO_1160 ) ( not ( = ?AUTO_1160 ?AUTO_1159 ) ) ( not ( = ?AUTO_1163 ?AUTO_1159 ) ) ( CAN_TRAVERSE ?AUTO_1164 ?AUTO_1165 ?AUTO_1159 ) ( AT ?AUTO_1164 ?AUTO_1165 ) ( VISIBLE ?AUTO_1165 ?AUTO_1159 ) ( not ( = ?AUTO_1160 ?AUTO_1165 ) ) ( not ( = ?AUTO_1163 ?AUTO_1165 ) ) ( not ( = ?AUTO_1159 ?AUTO_1165 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1164 ?AUTO_1165 ?AUTO_1159 )
      ( GET_IMAGE_DATA ?AUTO_1157 ?AUTO_1158 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1157 ?AUTO_1158 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1174 - OBJECTIVE
      ?AUTO_1175 - MODE
    )
    :vars
    (
      ?AUTO_1179 - LANDER
      ?AUTO_1182 - WAYPOINT
      ?AUTO_1180 - WAYPOINT
      ?AUTO_1181 - ROVER
      ?AUTO_1176 - CAMERA
      ?AUTO_1177 - WAYPOINT
      ?AUTO_1178 - WAYPOINT
      ?AUTO_1183 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1179 ?AUTO_1182 ) ( VISIBLE ?AUTO_1180 ?AUTO_1182 ) ( AVAILABLE ?AUTO_1181 ) ( CHANNEL_FREE ?AUTO_1179 ) ( not ( = ?AUTO_1180 ?AUTO_1182 ) ) ( CAN_TRAVERSE ?AUTO_1181 ?AUTO_1182 ?AUTO_1180 ) ( VISIBLE ?AUTO_1182 ?AUTO_1180 ) ( ON_BOARD ?AUTO_1176 ?AUTO_1181 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1181 ) ( SUPPORTS ?AUTO_1176 ?AUTO_1175 ) ( VISIBLE_FROM ?AUTO_1174 ?AUTO_1182 ) ( CAN_TRAVERSE ?AUTO_1181 ?AUTO_1177 ?AUTO_1182 ) ( VISIBLE ?AUTO_1177 ?AUTO_1182 ) ( not ( = ?AUTO_1182 ?AUTO_1177 ) ) ( not ( = ?AUTO_1180 ?AUTO_1177 ) ) ( CAN_TRAVERSE ?AUTO_1181 ?AUTO_1178 ?AUTO_1177 ) ( AT ?AUTO_1181 ?AUTO_1178 ) ( VISIBLE ?AUTO_1178 ?AUTO_1177 ) ( not ( = ?AUTO_1182 ?AUTO_1178 ) ) ( not ( = ?AUTO_1180 ?AUTO_1178 ) ) ( not ( = ?AUTO_1177 ?AUTO_1178 ) ) ( CALIBRATION_TARGET ?AUTO_1176 ?AUTO_1183 ) ( VISIBLE_FROM ?AUTO_1183 ?AUTO_1178 ) ( not ( = ?AUTO_1174 ?AUTO_1183 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1181 ?AUTO_1176 ?AUTO_1183 ?AUTO_1178 )
      ( GET_IMAGE_DATA ?AUTO_1174 ?AUTO_1175 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1174 ?AUTO_1175 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1184 - OBJECTIVE
      ?AUTO_1185 - MODE
    )
    :vars
    (
      ?AUTO_1188 - LANDER
      ?AUTO_1190 - WAYPOINT
      ?AUTO_1186 - WAYPOINT
      ?AUTO_1187 - ROVER
      ?AUTO_1189 - CAMERA
      ?AUTO_1193 - WAYPOINT
      ?AUTO_1191 - WAYPOINT
      ?AUTO_1192 - OBJECTIVE
      ?AUTO_1194 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1188 ?AUTO_1190 ) ( VISIBLE ?AUTO_1186 ?AUTO_1190 ) ( AVAILABLE ?AUTO_1187 ) ( CHANNEL_FREE ?AUTO_1188 ) ( not ( = ?AUTO_1186 ?AUTO_1190 ) ) ( CAN_TRAVERSE ?AUTO_1187 ?AUTO_1190 ?AUTO_1186 ) ( VISIBLE ?AUTO_1190 ?AUTO_1186 ) ( ON_BOARD ?AUTO_1189 ?AUTO_1187 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1187 ) ( SUPPORTS ?AUTO_1189 ?AUTO_1185 ) ( VISIBLE_FROM ?AUTO_1184 ?AUTO_1190 ) ( CAN_TRAVERSE ?AUTO_1187 ?AUTO_1193 ?AUTO_1190 ) ( VISIBLE ?AUTO_1193 ?AUTO_1190 ) ( not ( = ?AUTO_1190 ?AUTO_1193 ) ) ( not ( = ?AUTO_1186 ?AUTO_1193 ) ) ( CAN_TRAVERSE ?AUTO_1187 ?AUTO_1191 ?AUTO_1193 ) ( VISIBLE ?AUTO_1191 ?AUTO_1193 ) ( not ( = ?AUTO_1190 ?AUTO_1191 ) ) ( not ( = ?AUTO_1186 ?AUTO_1191 ) ) ( not ( = ?AUTO_1193 ?AUTO_1191 ) ) ( CALIBRATION_TARGET ?AUTO_1189 ?AUTO_1192 ) ( VISIBLE_FROM ?AUTO_1192 ?AUTO_1191 ) ( not ( = ?AUTO_1184 ?AUTO_1192 ) ) ( CAN_TRAVERSE ?AUTO_1187 ?AUTO_1194 ?AUTO_1191 ) ( AT ?AUTO_1187 ?AUTO_1194 ) ( VISIBLE ?AUTO_1194 ?AUTO_1191 ) ( not ( = ?AUTO_1190 ?AUTO_1194 ) ) ( not ( = ?AUTO_1186 ?AUTO_1194 ) ) ( not ( = ?AUTO_1193 ?AUTO_1194 ) ) ( not ( = ?AUTO_1191 ?AUTO_1194 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1187 ?AUTO_1194 ?AUTO_1191 )
      ( GET_IMAGE_DATA ?AUTO_1184 ?AUTO_1185 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1184 ?AUTO_1185 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1195 - OBJECTIVE
      ?AUTO_1196 - MODE
    )
    :vars
    (
      ?AUTO_1205 - LANDER
      ?AUTO_1197 - WAYPOINT
      ?AUTO_1201 - WAYPOINT
      ?AUTO_1199 - ROVER
      ?AUTO_1204 - CAMERA
      ?AUTO_1200 - WAYPOINT
      ?AUTO_1198 - WAYPOINT
      ?AUTO_1202 - OBJECTIVE
      ?AUTO_1203 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1205 ?AUTO_1197 ) ( VISIBLE ?AUTO_1201 ?AUTO_1197 ) ( AVAILABLE ?AUTO_1199 ) ( CHANNEL_FREE ?AUTO_1205 ) ( not ( = ?AUTO_1201 ?AUTO_1197 ) ) ( CAN_TRAVERSE ?AUTO_1199 ?AUTO_1197 ?AUTO_1201 ) ( VISIBLE ?AUTO_1197 ?AUTO_1201 ) ( ON_BOARD ?AUTO_1204 ?AUTO_1199 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1199 ) ( SUPPORTS ?AUTO_1204 ?AUTO_1196 ) ( VISIBLE_FROM ?AUTO_1195 ?AUTO_1197 ) ( CAN_TRAVERSE ?AUTO_1199 ?AUTO_1200 ?AUTO_1197 ) ( VISIBLE ?AUTO_1200 ?AUTO_1197 ) ( not ( = ?AUTO_1197 ?AUTO_1200 ) ) ( not ( = ?AUTO_1201 ?AUTO_1200 ) ) ( CAN_TRAVERSE ?AUTO_1199 ?AUTO_1198 ?AUTO_1200 ) ( VISIBLE ?AUTO_1198 ?AUTO_1200 ) ( not ( = ?AUTO_1197 ?AUTO_1198 ) ) ( not ( = ?AUTO_1201 ?AUTO_1198 ) ) ( not ( = ?AUTO_1200 ?AUTO_1198 ) ) ( CALIBRATION_TARGET ?AUTO_1204 ?AUTO_1202 ) ( VISIBLE_FROM ?AUTO_1202 ?AUTO_1198 ) ( not ( = ?AUTO_1195 ?AUTO_1202 ) ) ( CAN_TRAVERSE ?AUTO_1199 ?AUTO_1203 ?AUTO_1198 ) ( VISIBLE ?AUTO_1203 ?AUTO_1198 ) ( not ( = ?AUTO_1197 ?AUTO_1203 ) ) ( not ( = ?AUTO_1201 ?AUTO_1203 ) ) ( not ( = ?AUTO_1200 ?AUTO_1203 ) ) ( not ( = ?AUTO_1198 ?AUTO_1203 ) ) ( CAN_TRAVERSE ?AUTO_1199 ?AUTO_1201 ?AUTO_1203 ) ( AT ?AUTO_1199 ?AUTO_1201 ) ( VISIBLE ?AUTO_1201 ?AUTO_1203 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1199 ?AUTO_1201 ?AUTO_1203 )
      ( GET_IMAGE_DATA ?AUTO_1195 ?AUTO_1196 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1195 ?AUTO_1196 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1223 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1226 - LANDER
      ?AUTO_1225 - WAYPOINT
      ?AUTO_1227 - ROVER
      ?AUTO_1224 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1226 ?AUTO_1225 ) ( VISIBLE ?AUTO_1223 ?AUTO_1225 ) ( AVAILABLE ?AUTO_1227 ) ( CHANNEL_FREE ?AUTO_1226 ) ( not ( = ?AUTO_1223 ?AUTO_1225 ) ) ( AT_SOIL_SAMPLE ?AUTO_1223 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1227 ) ( STORE_OF ?AUTO_1224 ?AUTO_1227 ) ( CAN_TRAVERSE ?AUTO_1227 ?AUTO_1225 ?AUTO_1223 ) ( AT ?AUTO_1227 ?AUTO_1225 ) ( VISIBLE ?AUTO_1225 ?AUTO_1223 ) ( FULL ?AUTO_1224 ) )
    :subtasks
    ( ( !DROP ?AUTO_1227 ?AUTO_1224 )
      ( GET_SOIL_DATA ?AUTO_1223 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1223 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1228 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1230 - LANDER
      ?AUTO_1229 - WAYPOINT
      ?AUTO_1232 - ROVER
      ?AUTO_1231 - STORE
      ?AUTO_1233 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1230 ?AUTO_1229 ) ( VISIBLE ?AUTO_1228 ?AUTO_1229 ) ( AVAILABLE ?AUTO_1232 ) ( CHANNEL_FREE ?AUTO_1230 ) ( not ( = ?AUTO_1228 ?AUTO_1229 ) ) ( AT_SOIL_SAMPLE ?AUTO_1228 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1232 ) ( STORE_OF ?AUTO_1231 ?AUTO_1232 ) ( CAN_TRAVERSE ?AUTO_1232 ?AUTO_1229 ?AUTO_1228 ) ( VISIBLE ?AUTO_1229 ?AUTO_1228 ) ( FULL ?AUTO_1231 ) ( CAN_TRAVERSE ?AUTO_1232 ?AUTO_1233 ?AUTO_1229 ) ( AT ?AUTO_1232 ?AUTO_1233 ) ( VISIBLE ?AUTO_1233 ?AUTO_1229 ) ( not ( = ?AUTO_1228 ?AUTO_1233 ) ) ( not ( = ?AUTO_1229 ?AUTO_1233 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1232 ?AUTO_1233 ?AUTO_1229 )
      ( GET_SOIL_DATA ?AUTO_1228 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1228 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1235 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1240 - LANDER
      ?AUTO_1237 - WAYPOINT
      ?AUTO_1236 - ROVER
      ?AUTO_1239 - STORE
      ?AUTO_1238 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1240 ?AUTO_1237 ) ( VISIBLE ?AUTO_1235 ?AUTO_1237 ) ( AVAILABLE ?AUTO_1236 ) ( CHANNEL_FREE ?AUTO_1240 ) ( not ( = ?AUTO_1235 ?AUTO_1237 ) ) ( AT_SOIL_SAMPLE ?AUTO_1235 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1236 ) ( STORE_OF ?AUTO_1239 ?AUTO_1236 ) ( CAN_TRAVERSE ?AUTO_1236 ?AUTO_1237 ?AUTO_1235 ) ( VISIBLE ?AUTO_1237 ?AUTO_1235 ) ( CAN_TRAVERSE ?AUTO_1236 ?AUTO_1238 ?AUTO_1237 ) ( AT ?AUTO_1236 ?AUTO_1238 ) ( VISIBLE ?AUTO_1238 ?AUTO_1237 ) ( not ( = ?AUTO_1235 ?AUTO_1238 ) ) ( not ( = ?AUTO_1237 ?AUTO_1238 ) ) ( AT_ROCK_SAMPLE ?AUTO_1238 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1236 ) ( EMPTY ?AUTO_1239 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1236 ?AUTO_1239 ?AUTO_1238 )
      ( GET_SOIL_DATA ?AUTO_1235 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1235 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2025 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2029 - LANDER
      ?AUTO_2026 - WAYPOINT
      ?AUTO_2028 - ROVER
      ?AUTO_2027 - STORE
      ?AUTO_2030 - WAYPOINT
      ?AUTO_2031 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2029 ?AUTO_2026 ) ( VISIBLE ?AUTO_2025 ?AUTO_2026 ) ( AVAILABLE ?AUTO_2028 ) ( CHANNEL_FREE ?AUTO_2029 ) ( not ( = ?AUTO_2025 ?AUTO_2026 ) ) ( AT_SOIL_SAMPLE ?AUTO_2025 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2028 ) ( STORE_OF ?AUTO_2027 ?AUTO_2028 ) ( EMPTY ?AUTO_2027 ) ( CAN_TRAVERSE ?AUTO_2028 ?AUTO_2026 ?AUTO_2025 ) ( VISIBLE ?AUTO_2026 ?AUTO_2025 ) ( CAN_TRAVERSE ?AUTO_2028 ?AUTO_2030 ?AUTO_2026 ) ( VISIBLE ?AUTO_2030 ?AUTO_2026 ) ( not ( = ?AUTO_2025 ?AUTO_2030 ) ) ( not ( = ?AUTO_2026 ?AUTO_2030 ) ) ( CAN_TRAVERSE ?AUTO_2028 ?AUTO_2031 ?AUTO_2030 ) ( AT ?AUTO_2028 ?AUTO_2031 ) ( VISIBLE ?AUTO_2031 ?AUTO_2030 ) ( not ( = ?AUTO_2025 ?AUTO_2031 ) ) ( not ( = ?AUTO_2026 ?AUTO_2031 ) ) ( not ( = ?AUTO_2030 ?AUTO_2031 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2028 ?AUTO_2031 ?AUTO_2030 )
      ( GET_SOIL_DATA ?AUTO_2025 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2025 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1253 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1257 - LANDER
      ?AUTO_1258 - WAYPOINT
      ?AUTO_1254 - ROVER
      ?AUTO_1256 - STORE
      ?AUTO_1255 - WAYPOINT
      ?AUTO_1259 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1257 ?AUTO_1258 ) ( VISIBLE ?AUTO_1253 ?AUTO_1258 ) ( AVAILABLE ?AUTO_1254 ) ( CHANNEL_FREE ?AUTO_1257 ) ( not ( = ?AUTO_1253 ?AUTO_1258 ) ) ( AT_SOIL_SAMPLE ?AUTO_1253 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1254 ) ( STORE_OF ?AUTO_1256 ?AUTO_1254 ) ( CAN_TRAVERSE ?AUTO_1254 ?AUTO_1258 ?AUTO_1253 ) ( VISIBLE ?AUTO_1258 ?AUTO_1253 ) ( CAN_TRAVERSE ?AUTO_1254 ?AUTO_1255 ?AUTO_1258 ) ( VISIBLE ?AUTO_1255 ?AUTO_1258 ) ( not ( = ?AUTO_1253 ?AUTO_1255 ) ) ( not ( = ?AUTO_1258 ?AUTO_1255 ) ) ( AT_ROCK_SAMPLE ?AUTO_1255 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1254 ) ( CAN_TRAVERSE ?AUTO_1254 ?AUTO_1259 ?AUTO_1255 ) ( AT ?AUTO_1254 ?AUTO_1259 ) ( VISIBLE ?AUTO_1259 ?AUTO_1255 ) ( not ( = ?AUTO_1253 ?AUTO_1259 ) ) ( not ( = ?AUTO_1258 ?AUTO_1259 ) ) ( not ( = ?AUTO_1255 ?AUTO_1259 ) ) ( FULL ?AUTO_1256 ) )
    :subtasks
    ( ( !DROP ?AUTO_1254 ?AUTO_1256 )
      ( GET_SOIL_DATA ?AUTO_1253 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1253 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1295 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1299 - LANDER
      ?AUTO_1296 - WAYPOINT
      ?AUTO_1298 - ROVER
      ?AUTO_1297 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1299 ?AUTO_1295 ) ( VISIBLE ?AUTO_1296 ?AUTO_1295 ) ( AVAILABLE ?AUTO_1298 ) ( CHANNEL_FREE ?AUTO_1299 ) ( not ( = ?AUTO_1295 ?AUTO_1296 ) ) ( CAN_TRAVERSE ?AUTO_1298 ?AUTO_1295 ?AUTO_1296 ) ( AT ?AUTO_1298 ?AUTO_1295 ) ( VISIBLE ?AUTO_1295 ?AUTO_1296 ) ( AT_ROCK_SAMPLE ?AUTO_1295 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1298 ) ( STORE_OF ?AUTO_1297 ?AUTO_1298 ) ( FULL ?AUTO_1297 ) )
    :subtasks
    ( ( !DROP ?AUTO_1298 ?AUTO_1297 )
      ( GET_ROCK_DATA ?AUTO_1295 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1295 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1300 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1302 - LANDER
      ?AUTO_1301 - WAYPOINT
      ?AUTO_1303 - ROVER
      ?AUTO_1304 - STORE
      ?AUTO_1305 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1302 ?AUTO_1300 ) ( VISIBLE ?AUTO_1301 ?AUTO_1300 ) ( AVAILABLE ?AUTO_1303 ) ( CHANNEL_FREE ?AUTO_1302 ) ( not ( = ?AUTO_1300 ?AUTO_1301 ) ) ( CAN_TRAVERSE ?AUTO_1303 ?AUTO_1300 ?AUTO_1301 ) ( VISIBLE ?AUTO_1300 ?AUTO_1301 ) ( AT_ROCK_SAMPLE ?AUTO_1300 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1303 ) ( STORE_OF ?AUTO_1304 ?AUTO_1303 ) ( FULL ?AUTO_1304 ) ( CAN_TRAVERSE ?AUTO_1303 ?AUTO_1305 ?AUTO_1300 ) ( AT ?AUTO_1303 ?AUTO_1305 ) ( VISIBLE ?AUTO_1305 ?AUTO_1300 ) ( not ( = ?AUTO_1300 ?AUTO_1305 ) ) ( not ( = ?AUTO_1301 ?AUTO_1305 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1303 ?AUTO_1305 ?AUTO_1300 )
      ( GET_ROCK_DATA ?AUTO_1300 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1300 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1307 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1308 - LANDER
      ?AUTO_1312 - WAYPOINT
      ?AUTO_1309 - ROVER
      ?AUTO_1311 - STORE
      ?AUTO_1310 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1308 ?AUTO_1307 ) ( VISIBLE ?AUTO_1312 ?AUTO_1307 ) ( AVAILABLE ?AUTO_1309 ) ( CHANNEL_FREE ?AUTO_1308 ) ( not ( = ?AUTO_1307 ?AUTO_1312 ) ) ( CAN_TRAVERSE ?AUTO_1309 ?AUTO_1307 ?AUTO_1312 ) ( VISIBLE ?AUTO_1307 ?AUTO_1312 ) ( AT_ROCK_SAMPLE ?AUTO_1307 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1309 ) ( STORE_OF ?AUTO_1311 ?AUTO_1309 ) ( CAN_TRAVERSE ?AUTO_1309 ?AUTO_1310 ?AUTO_1307 ) ( AT ?AUTO_1309 ?AUTO_1310 ) ( VISIBLE ?AUTO_1310 ?AUTO_1307 ) ( not ( = ?AUTO_1307 ?AUTO_1310 ) ) ( not ( = ?AUTO_1312 ?AUTO_1310 ) ) ( AT_ROCK_SAMPLE ?AUTO_1310 ) ( EMPTY ?AUTO_1311 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1309 ?AUTO_1311 ?AUTO_1310 )
      ( GET_ROCK_DATA ?AUTO_1307 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1307 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5198 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5199 - LANDER
      ?AUTO_5203 - WAYPOINT
      ?AUTO_5200 - ROVER
      ?AUTO_5202 - STORE
      ?AUTO_5201 - WAYPOINT
      ?AUTO_5204 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5199 ?AUTO_5198 ) ( VISIBLE ?AUTO_5203 ?AUTO_5198 ) ( AVAILABLE ?AUTO_5200 ) ( CHANNEL_FREE ?AUTO_5199 ) ( not ( = ?AUTO_5198 ?AUTO_5203 ) ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5198 ?AUTO_5203 ) ( VISIBLE ?AUTO_5198 ?AUTO_5203 ) ( AT_ROCK_SAMPLE ?AUTO_5198 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5200 ) ( STORE_OF ?AUTO_5202 ?AUTO_5200 ) ( EMPTY ?AUTO_5202 ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5201 ?AUTO_5198 ) ( VISIBLE ?AUTO_5201 ?AUTO_5198 ) ( not ( = ?AUTO_5198 ?AUTO_5201 ) ) ( not ( = ?AUTO_5203 ?AUTO_5201 ) ) ( CAN_TRAVERSE ?AUTO_5200 ?AUTO_5204 ?AUTO_5201 ) ( AT ?AUTO_5200 ?AUTO_5204 ) ( VISIBLE ?AUTO_5204 ?AUTO_5201 ) ( not ( = ?AUTO_5198 ?AUTO_5204 ) ) ( not ( = ?AUTO_5203 ?AUTO_5204 ) ) ( not ( = ?AUTO_5201 ?AUTO_5204 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5200 ?AUTO_5204 ?AUTO_5201 )
      ( GET_ROCK_DATA ?AUTO_5198 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5198 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7662 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7667 - LANDER
      ?AUTO_7664 - WAYPOINT
      ?AUTO_7666 - ROVER
      ?AUTO_7665 - STORE
      ?AUTO_7663 - WAYPOINT
      ?AUTO_7668 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7667 ?AUTO_7662 ) ( VISIBLE ?AUTO_7664 ?AUTO_7662 ) ( AVAILABLE ?AUTO_7666 ) ( CHANNEL_FREE ?AUTO_7667 ) ( not ( = ?AUTO_7662 ?AUTO_7664 ) ) ( CAN_TRAVERSE ?AUTO_7666 ?AUTO_7662 ?AUTO_7664 ) ( VISIBLE ?AUTO_7662 ?AUTO_7664 ) ( AT_ROCK_SAMPLE ?AUTO_7662 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7666 ) ( STORE_OF ?AUTO_7665 ?AUTO_7666 ) ( CAN_TRAVERSE ?AUTO_7666 ?AUTO_7663 ?AUTO_7662 ) ( VISIBLE ?AUTO_7663 ?AUTO_7662 ) ( not ( = ?AUTO_7662 ?AUTO_7663 ) ) ( not ( = ?AUTO_7664 ?AUTO_7663 ) ) ( CAN_TRAVERSE ?AUTO_7666 ?AUTO_7668 ?AUTO_7663 ) ( AT ?AUTO_7666 ?AUTO_7668 ) ( VISIBLE ?AUTO_7668 ?AUTO_7663 ) ( not ( = ?AUTO_7662 ?AUTO_7668 ) ) ( not ( = ?AUTO_7664 ?AUTO_7668 ) ) ( not ( = ?AUTO_7663 ?AUTO_7668 ) ) ( FULL ?AUTO_7665 ) )
    :subtasks
    ( ( !DROP ?AUTO_7666 ?AUTO_7665 )
      ( GET_ROCK_DATA ?AUTO_7662 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7662 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1394 - OBJECTIVE
      ?AUTO_1395 - MODE
    )
    :vars
    (
      ?AUTO_1401 - LANDER
      ?AUTO_1400 - WAYPOINT
      ?AUTO_1399 - WAYPOINT
      ?AUTO_1402 - ROVER
      ?AUTO_1397 - CAMERA
      ?AUTO_1398 - WAYPOINT
      ?AUTO_1396 - OBJECTIVE
      ?AUTO_1403 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1401 ?AUTO_1400 ) ( VISIBLE ?AUTO_1399 ?AUTO_1400 ) ( AVAILABLE ?AUTO_1402 ) ( CHANNEL_FREE ?AUTO_1401 ) ( not ( = ?AUTO_1399 ?AUTO_1400 ) ) ( CAN_TRAVERSE ?AUTO_1402 ?AUTO_1400 ?AUTO_1399 ) ( VISIBLE ?AUTO_1400 ?AUTO_1399 ) ( ON_BOARD ?AUTO_1397 ?AUTO_1402 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1402 ) ( SUPPORTS ?AUTO_1397 ?AUTO_1395 ) ( VISIBLE_FROM ?AUTO_1394 ?AUTO_1400 ) ( CAN_TRAVERSE ?AUTO_1402 ?AUTO_1398 ?AUTO_1400 ) ( VISIBLE ?AUTO_1398 ?AUTO_1400 ) ( not ( = ?AUTO_1400 ?AUTO_1398 ) ) ( not ( = ?AUTO_1399 ?AUTO_1398 ) ) ( CALIBRATION_TARGET ?AUTO_1397 ?AUTO_1396 ) ( VISIBLE_FROM ?AUTO_1396 ?AUTO_1398 ) ( not ( = ?AUTO_1394 ?AUTO_1396 ) ) ( CAN_TRAVERSE ?AUTO_1402 ?AUTO_1403 ?AUTO_1398 ) ( AT ?AUTO_1402 ?AUTO_1403 ) ( VISIBLE ?AUTO_1403 ?AUTO_1398 ) ( not ( = ?AUTO_1400 ?AUTO_1403 ) ) ( not ( = ?AUTO_1399 ?AUTO_1403 ) ) ( not ( = ?AUTO_1398 ?AUTO_1403 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1402 ?AUTO_1403 ?AUTO_1398 )
      ( GET_IMAGE_DATA ?AUTO_1394 ?AUTO_1395 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1394 ?AUTO_1395 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1419 - OBJECTIVE
      ?AUTO_1420 - MODE
    )
    :vars
    (
      ?AUTO_1424 - ROVER
      ?AUTO_1423 - WAYPOINT
      ?AUTO_1422 - LANDER
      ?AUTO_1421 - WAYPOINT
      ?AUTO_1425 - CAMERA
      ?AUTO_1426 - OBJECTIVE
    )
    :precondition
    ( and ( AT ?AUTO_1424 ?AUTO_1423 ) ( AT_LANDER ?AUTO_1422 ?AUTO_1421 ) ( VISIBLE ?AUTO_1423 ?AUTO_1421 ) ( AVAILABLE ?AUTO_1424 ) ( CHANNEL_FREE ?AUTO_1422 ) ( not ( = ?AUTO_1423 ?AUTO_1421 ) ) ( ON_BOARD ?AUTO_1425 ?AUTO_1424 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1424 ) ( SUPPORTS ?AUTO_1425 ?AUTO_1420 ) ( VISIBLE_FROM ?AUTO_1419 ?AUTO_1423 ) ( CALIBRATION_TARGET ?AUTO_1425 ?AUTO_1426 ) ( VISIBLE_FROM ?AUTO_1426 ?AUTO_1423 ) ( not ( = ?AUTO_1419 ?AUTO_1426 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1424 ?AUTO_1425 ?AUTO_1426 ?AUTO_1423 )
      ( GET_IMAGE_DATA ?AUTO_1419 ?AUTO_1420 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1419 ?AUTO_1420 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1449 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1451 - LANDER
      ?AUTO_1454 - WAYPOINT
      ?AUTO_1452 - ROVER
      ?AUTO_1450 - STORE
      ?AUTO_1453 - WAYPOINT
      ?AUTO_1455 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1451 ?AUTO_1454 ) ( VISIBLE ?AUTO_1449 ?AUTO_1454 ) ( AVAILABLE ?AUTO_1452 ) ( CHANNEL_FREE ?AUTO_1451 ) ( not ( = ?AUTO_1449 ?AUTO_1454 ) ) ( AT_ROCK_SAMPLE ?AUTO_1449 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1452 ) ( STORE_OF ?AUTO_1450 ?AUTO_1452 ) ( EMPTY ?AUTO_1450 ) ( CAN_TRAVERSE ?AUTO_1452 ?AUTO_1454 ?AUTO_1449 ) ( VISIBLE ?AUTO_1454 ?AUTO_1449 ) ( CAN_TRAVERSE ?AUTO_1452 ?AUTO_1453 ?AUTO_1454 ) ( VISIBLE ?AUTO_1453 ?AUTO_1454 ) ( not ( = ?AUTO_1449 ?AUTO_1453 ) ) ( not ( = ?AUTO_1454 ?AUTO_1453 ) ) ( CAN_TRAVERSE ?AUTO_1452 ?AUTO_1455 ?AUTO_1453 ) ( AT ?AUTO_1452 ?AUTO_1455 ) ( VISIBLE ?AUTO_1455 ?AUTO_1453 ) ( not ( = ?AUTO_1449 ?AUTO_1455 ) ) ( not ( = ?AUTO_1454 ?AUTO_1455 ) ) ( not ( = ?AUTO_1453 ?AUTO_1455 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1452 ?AUTO_1455 ?AUTO_1453 )
      ( GET_ROCK_DATA ?AUTO_1449 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1449 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1497 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1498 - LANDER
      ?AUTO_1500 - WAYPOINT
      ?AUTO_1499 - ROVER
      ?AUTO_1501 - STORE
      ?AUTO_1502 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1498 ?AUTO_1497 ) ( VISIBLE ?AUTO_1500 ?AUTO_1497 ) ( AVAILABLE ?AUTO_1499 ) ( CHANNEL_FREE ?AUTO_1498 ) ( not ( = ?AUTO_1497 ?AUTO_1500 ) ) ( CAN_TRAVERSE ?AUTO_1499 ?AUTO_1497 ?AUTO_1500 ) ( VISIBLE ?AUTO_1497 ?AUTO_1500 ) ( AT_SOIL_SAMPLE ?AUTO_1497 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1499 ) ( STORE_OF ?AUTO_1501 ?AUTO_1499 ) ( EMPTY ?AUTO_1501 ) ( CAN_TRAVERSE ?AUTO_1499 ?AUTO_1502 ?AUTO_1497 ) ( AT ?AUTO_1499 ?AUTO_1502 ) ( VISIBLE ?AUTO_1502 ?AUTO_1497 ) ( not ( = ?AUTO_1497 ?AUTO_1502 ) ) ( not ( = ?AUTO_1500 ?AUTO_1502 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1499 ?AUTO_1502 ?AUTO_1497 )
      ( GET_SOIL_DATA ?AUTO_1497 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1497 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1503 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1504 - LANDER
      ?AUTO_1507 - WAYPOINT
      ?AUTO_1505 - ROVER
      ?AUTO_1508 - STORE
      ?AUTO_1506 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1504 ?AUTO_1503 ) ( VISIBLE ?AUTO_1507 ?AUTO_1503 ) ( AVAILABLE ?AUTO_1505 ) ( CHANNEL_FREE ?AUTO_1504 ) ( not ( = ?AUTO_1503 ?AUTO_1507 ) ) ( CAN_TRAVERSE ?AUTO_1505 ?AUTO_1503 ?AUTO_1507 ) ( VISIBLE ?AUTO_1503 ?AUTO_1507 ) ( AT_SOIL_SAMPLE ?AUTO_1503 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1505 ) ( STORE_OF ?AUTO_1508 ?AUTO_1505 ) ( CAN_TRAVERSE ?AUTO_1505 ?AUTO_1506 ?AUTO_1503 ) ( AT ?AUTO_1505 ?AUTO_1506 ) ( VISIBLE ?AUTO_1506 ?AUTO_1503 ) ( not ( = ?AUTO_1503 ?AUTO_1506 ) ) ( not ( = ?AUTO_1507 ?AUTO_1506 ) ) ( FULL ?AUTO_1508 ) )
    :subtasks
    ( ( !DROP ?AUTO_1505 ?AUTO_1508 )
      ( GET_SOIL_DATA ?AUTO_1503 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1503 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1515 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1520 - LANDER
      ?AUTO_1518 - WAYPOINT
      ?AUTO_1519 - ROVER
      ?AUTO_1517 - STORE
      ?AUTO_1516 - WAYPOINT
      ?AUTO_1521 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1520 ?AUTO_1515 ) ( VISIBLE ?AUTO_1518 ?AUTO_1515 ) ( AVAILABLE ?AUTO_1519 ) ( CHANNEL_FREE ?AUTO_1520 ) ( not ( = ?AUTO_1515 ?AUTO_1518 ) ) ( CAN_TRAVERSE ?AUTO_1519 ?AUTO_1515 ?AUTO_1518 ) ( VISIBLE ?AUTO_1515 ?AUTO_1518 ) ( AT_SOIL_SAMPLE ?AUTO_1515 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1519 ) ( STORE_OF ?AUTO_1517 ?AUTO_1519 ) ( EMPTY ?AUTO_1517 ) ( CAN_TRAVERSE ?AUTO_1519 ?AUTO_1516 ?AUTO_1515 ) ( VISIBLE ?AUTO_1516 ?AUTO_1515 ) ( not ( = ?AUTO_1515 ?AUTO_1516 ) ) ( not ( = ?AUTO_1518 ?AUTO_1516 ) ) ( CAN_TRAVERSE ?AUTO_1519 ?AUTO_1521 ?AUTO_1516 ) ( AT ?AUTO_1519 ?AUTO_1521 ) ( VISIBLE ?AUTO_1521 ?AUTO_1516 ) ( not ( = ?AUTO_1515 ?AUTO_1521 ) ) ( not ( = ?AUTO_1518 ?AUTO_1521 ) ) ( not ( = ?AUTO_1516 ?AUTO_1521 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1519 ?AUTO_1521 ?AUTO_1516 )
      ( GET_SOIL_DATA ?AUTO_1515 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1515 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1536 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1537 - ROVER
      ?AUTO_1539 - LANDER
      ?AUTO_1538 - WAYPOINT
      ?AUTO_1540 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_1537 ?AUTO_1536 ) ( AT_LANDER ?AUTO_1539 ?AUTO_1538 ) ( VISIBLE ?AUTO_1536 ?AUTO_1538 ) ( AVAILABLE ?AUTO_1537 ) ( CHANNEL_FREE ?AUTO_1539 ) ( not ( = ?AUTO_1536 ?AUTO_1538 ) ) ( AT_SOIL_SAMPLE ?AUTO_1536 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1537 ) ( STORE_OF ?AUTO_1540 ?AUTO_1537 ) ( FULL ?AUTO_1540 ) )
    :subtasks
    ( ( !DROP ?AUTO_1537 ?AUTO_1540 )
      ( GET_SOIL_DATA ?AUTO_1536 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1536 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1542 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1544 - LANDER
      ?AUTO_1546 - WAYPOINT
      ?AUTO_1543 - ROVER
      ?AUTO_1545 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1544 ?AUTO_1546 ) ( VISIBLE ?AUTO_1542 ?AUTO_1546 ) ( AVAILABLE ?AUTO_1543 ) ( CHANNEL_FREE ?AUTO_1544 ) ( not ( = ?AUTO_1542 ?AUTO_1546 ) ) ( AT_SOIL_SAMPLE ?AUTO_1542 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1543 ) ( STORE_OF ?AUTO_1545 ?AUTO_1543 ) ( FULL ?AUTO_1545 ) ( CAN_TRAVERSE ?AUTO_1543 ?AUTO_1546 ?AUTO_1542 ) ( AT ?AUTO_1543 ?AUTO_1546 ) ( VISIBLE ?AUTO_1546 ?AUTO_1542 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1543 ?AUTO_1546 ?AUTO_1542 )
      ( GET_SOIL_DATA ?AUTO_1542 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1542 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1547 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1550 - LANDER
      ?AUTO_1549 - WAYPOINT
      ?AUTO_1551 - ROVER
      ?AUTO_1548 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1550 ?AUTO_1549 ) ( VISIBLE ?AUTO_1547 ?AUTO_1549 ) ( AVAILABLE ?AUTO_1551 ) ( CHANNEL_FREE ?AUTO_1550 ) ( not ( = ?AUTO_1547 ?AUTO_1549 ) ) ( AT_SOIL_SAMPLE ?AUTO_1547 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1551 ) ( STORE_OF ?AUTO_1548 ?AUTO_1551 ) ( CAN_TRAVERSE ?AUTO_1551 ?AUTO_1549 ?AUTO_1547 ) ( AT ?AUTO_1551 ?AUTO_1549 ) ( VISIBLE ?AUTO_1549 ?AUTO_1547 ) ( AT_SOIL_SAMPLE ?AUTO_1549 ) ( EMPTY ?AUTO_1548 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1551 ?AUTO_1548 ?AUTO_1549 )
      ( GET_SOIL_DATA ?AUTO_1547 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1547 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1594 - OBJECTIVE
      ?AUTO_1595 - MODE
    )
    :vars
    (
      ?AUTO_1596 - LANDER
      ?AUTO_1601 - WAYPOINT
      ?AUTO_1600 - WAYPOINT
      ?AUTO_1597 - ROVER
      ?AUTO_1599 - CAMERA
      ?AUTO_1598 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1596 ?AUTO_1601 ) ( VISIBLE ?AUTO_1600 ?AUTO_1601 ) ( AVAILABLE ?AUTO_1597 ) ( CHANNEL_FREE ?AUTO_1596 ) ( not ( = ?AUTO_1600 ?AUTO_1601 ) ) ( ON_BOARD ?AUTO_1599 ?AUTO_1597 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1597 ) ( SUPPORTS ?AUTO_1599 ?AUTO_1595 ) ( VISIBLE_FROM ?AUTO_1594 ?AUTO_1600 ) ( CALIBRATION_TARGET ?AUTO_1599 ?AUTO_1598 ) ( VISIBLE_FROM ?AUTO_1598 ?AUTO_1600 ) ( not ( = ?AUTO_1594 ?AUTO_1598 ) ) ( CAN_TRAVERSE ?AUTO_1597 ?AUTO_1601 ?AUTO_1600 ) ( AT ?AUTO_1597 ?AUTO_1601 ) ( VISIBLE ?AUTO_1601 ?AUTO_1600 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1597 ?AUTO_1601 ?AUTO_1600 )
      ( GET_IMAGE_DATA ?AUTO_1594 ?AUTO_1595 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1594 ?AUTO_1595 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1679 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1681 - LANDER
      ?AUTO_1680 - WAYPOINT
      ?AUTO_1682 - ROVER
      ?AUTO_1683 - WAYPOINT
      ?AUTO_1684 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1681 ?AUTO_1680 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1682 ?AUTO_1679 ) ( VISIBLE ?AUTO_1683 ?AUTO_1680 ) ( AVAILABLE ?AUTO_1682 ) ( CHANNEL_FREE ?AUTO_1681 ) ( not ( = ?AUTO_1679 ?AUTO_1683 ) ) ( not ( = ?AUTO_1679 ?AUTO_1680 ) ) ( not ( = ?AUTO_1683 ?AUTO_1680 ) ) ( CAN_TRAVERSE ?AUTO_1682 ?AUTO_1684 ?AUTO_1683 ) ( AT ?AUTO_1682 ?AUTO_1684 ) ( VISIBLE ?AUTO_1684 ?AUTO_1683 ) ( not ( = ?AUTO_1679 ?AUTO_1684 ) ) ( not ( = ?AUTO_1680 ?AUTO_1684 ) ) ( not ( = ?AUTO_1683 ?AUTO_1684 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1682 ?AUTO_1684 ?AUTO_1683 )
      ( GET_SOIL_DATA ?AUTO_1679 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1679 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1685 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1689 - LANDER
      ?AUTO_1690 - WAYPOINT
      ?AUTO_1688 - ROVER
      ?AUTO_1687 - WAYPOINT
      ?AUTO_1686 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1689 ?AUTO_1690 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1688 ?AUTO_1685 ) ( VISIBLE ?AUTO_1687 ?AUTO_1690 ) ( AVAILABLE ?AUTO_1688 ) ( CHANNEL_FREE ?AUTO_1689 ) ( not ( = ?AUTO_1685 ?AUTO_1687 ) ) ( not ( = ?AUTO_1685 ?AUTO_1690 ) ) ( not ( = ?AUTO_1687 ?AUTO_1690 ) ) ( CAN_TRAVERSE ?AUTO_1688 ?AUTO_1686 ?AUTO_1687 ) ( VISIBLE ?AUTO_1686 ?AUTO_1687 ) ( not ( = ?AUTO_1685 ?AUTO_1686 ) ) ( not ( = ?AUTO_1690 ?AUTO_1686 ) ) ( not ( = ?AUTO_1687 ?AUTO_1686 ) ) ( CAN_TRAVERSE ?AUTO_1688 ?AUTO_1685 ?AUTO_1686 ) ( AT ?AUTO_1688 ?AUTO_1685 ) ( VISIBLE ?AUTO_1685 ?AUTO_1686 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1688 ?AUTO_1685 ?AUTO_1686 )
      ( GET_SOIL_DATA ?AUTO_1685 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1685 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1691 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1695 - LANDER
      ?AUTO_1693 - WAYPOINT
      ?AUTO_1692 - WAYPOINT
      ?AUTO_1696 - ROVER
      ?AUTO_1694 - WAYPOINT
      ?AUTO_1697 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1695 ?AUTO_1693 ) ( VISIBLE ?AUTO_1692 ?AUTO_1693 ) ( AVAILABLE ?AUTO_1696 ) ( CHANNEL_FREE ?AUTO_1695 ) ( not ( = ?AUTO_1691 ?AUTO_1692 ) ) ( not ( = ?AUTO_1691 ?AUTO_1693 ) ) ( not ( = ?AUTO_1692 ?AUTO_1693 ) ) ( CAN_TRAVERSE ?AUTO_1696 ?AUTO_1694 ?AUTO_1692 ) ( VISIBLE ?AUTO_1694 ?AUTO_1692 ) ( not ( = ?AUTO_1691 ?AUTO_1694 ) ) ( not ( = ?AUTO_1693 ?AUTO_1694 ) ) ( not ( = ?AUTO_1692 ?AUTO_1694 ) ) ( CAN_TRAVERSE ?AUTO_1696 ?AUTO_1691 ?AUTO_1694 ) ( AT ?AUTO_1696 ?AUTO_1691 ) ( VISIBLE ?AUTO_1691 ?AUTO_1694 ) ( AT_SOIL_SAMPLE ?AUTO_1691 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1696 ) ( STORE_OF ?AUTO_1697 ?AUTO_1696 ) ( EMPTY ?AUTO_1697 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1696 ?AUTO_1697 ?AUTO_1691 )
      ( GET_SOIL_DATA ?AUTO_1691 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1691 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1698 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1704 - LANDER
      ?AUTO_1699 - WAYPOINT
      ?AUTO_1701 - WAYPOINT
      ?AUTO_1700 - ROVER
      ?AUTO_1703 - WAYPOINT
      ?AUTO_1702 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1704 ?AUTO_1699 ) ( VISIBLE ?AUTO_1701 ?AUTO_1699 ) ( AVAILABLE ?AUTO_1700 ) ( CHANNEL_FREE ?AUTO_1704 ) ( not ( = ?AUTO_1698 ?AUTO_1701 ) ) ( not ( = ?AUTO_1698 ?AUTO_1699 ) ) ( not ( = ?AUTO_1701 ?AUTO_1699 ) ) ( CAN_TRAVERSE ?AUTO_1700 ?AUTO_1703 ?AUTO_1701 ) ( VISIBLE ?AUTO_1703 ?AUTO_1701 ) ( not ( = ?AUTO_1698 ?AUTO_1703 ) ) ( not ( = ?AUTO_1699 ?AUTO_1703 ) ) ( not ( = ?AUTO_1701 ?AUTO_1703 ) ) ( CAN_TRAVERSE ?AUTO_1700 ?AUTO_1698 ?AUTO_1703 ) ( VISIBLE ?AUTO_1698 ?AUTO_1703 ) ( AT_SOIL_SAMPLE ?AUTO_1698 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1700 ) ( STORE_OF ?AUTO_1702 ?AUTO_1700 ) ( EMPTY ?AUTO_1702 ) ( CAN_TRAVERSE ?AUTO_1700 ?AUTO_1703 ?AUTO_1698 ) ( AT ?AUTO_1700 ?AUTO_1703 ) ( VISIBLE ?AUTO_1703 ?AUTO_1698 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1700 ?AUTO_1703 ?AUTO_1698 )
      ( GET_SOIL_DATA ?AUTO_1698 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1698 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1705 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1706 - LANDER
      ?AUTO_1707 - WAYPOINT
      ?AUTO_1711 - WAYPOINT
      ?AUTO_1708 - ROVER
      ?AUTO_1709 - WAYPOINT
      ?AUTO_1710 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1706 ?AUTO_1707 ) ( VISIBLE ?AUTO_1711 ?AUTO_1707 ) ( AVAILABLE ?AUTO_1708 ) ( CHANNEL_FREE ?AUTO_1706 ) ( not ( = ?AUTO_1705 ?AUTO_1711 ) ) ( not ( = ?AUTO_1705 ?AUTO_1707 ) ) ( not ( = ?AUTO_1711 ?AUTO_1707 ) ) ( CAN_TRAVERSE ?AUTO_1708 ?AUTO_1709 ?AUTO_1711 ) ( VISIBLE ?AUTO_1709 ?AUTO_1711 ) ( not ( = ?AUTO_1705 ?AUTO_1709 ) ) ( not ( = ?AUTO_1707 ?AUTO_1709 ) ) ( not ( = ?AUTO_1711 ?AUTO_1709 ) ) ( CAN_TRAVERSE ?AUTO_1708 ?AUTO_1705 ?AUTO_1709 ) ( VISIBLE ?AUTO_1705 ?AUTO_1709 ) ( AT_SOIL_SAMPLE ?AUTO_1705 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1708 ) ( STORE_OF ?AUTO_1710 ?AUTO_1708 ) ( CAN_TRAVERSE ?AUTO_1708 ?AUTO_1709 ?AUTO_1705 ) ( AT ?AUTO_1708 ?AUTO_1709 ) ( VISIBLE ?AUTO_1709 ?AUTO_1705 ) ( FULL ?AUTO_1710 ) )
    :subtasks
    ( ( !DROP ?AUTO_1708 ?AUTO_1710 )
      ( GET_SOIL_DATA ?AUTO_1705 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1705 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1713 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1714 - LANDER
      ?AUTO_1716 - WAYPOINT
      ?AUTO_1715 - WAYPOINT
      ?AUTO_1718 - ROVER
      ?AUTO_1717 - WAYPOINT
      ?AUTO_1719 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1714 ?AUTO_1716 ) ( VISIBLE ?AUTO_1715 ?AUTO_1716 ) ( AVAILABLE ?AUTO_1718 ) ( CHANNEL_FREE ?AUTO_1714 ) ( not ( = ?AUTO_1713 ?AUTO_1715 ) ) ( not ( = ?AUTO_1713 ?AUTO_1716 ) ) ( not ( = ?AUTO_1715 ?AUTO_1716 ) ) ( CAN_TRAVERSE ?AUTO_1718 ?AUTO_1717 ?AUTO_1715 ) ( VISIBLE ?AUTO_1717 ?AUTO_1715 ) ( not ( = ?AUTO_1713 ?AUTO_1717 ) ) ( not ( = ?AUTO_1716 ?AUTO_1717 ) ) ( not ( = ?AUTO_1715 ?AUTO_1717 ) ) ( CAN_TRAVERSE ?AUTO_1718 ?AUTO_1713 ?AUTO_1717 ) ( VISIBLE ?AUTO_1713 ?AUTO_1717 ) ( AT_SOIL_SAMPLE ?AUTO_1713 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1718 ) ( STORE_OF ?AUTO_1719 ?AUTO_1718 ) ( EMPTY ?AUTO_1719 ) ( CAN_TRAVERSE ?AUTO_1718 ?AUTO_1717 ?AUTO_1713 ) ( VISIBLE ?AUTO_1717 ?AUTO_1713 ) ( CAN_TRAVERSE ?AUTO_1718 ?AUTO_1715 ?AUTO_1717 ) ( AT ?AUTO_1718 ?AUTO_1715 ) ( VISIBLE ?AUTO_1715 ?AUTO_1717 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1718 ?AUTO_1715 ?AUTO_1717 )
      ( GET_SOIL_DATA ?AUTO_1713 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1713 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1720 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1722 - LANDER
      ?AUTO_1726 - WAYPOINT
      ?AUTO_1723 - WAYPOINT
      ?AUTO_1724 - ROVER
      ?AUTO_1725 - WAYPOINT
      ?AUTO_1721 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1722 ?AUTO_1726 ) ( VISIBLE ?AUTO_1723 ?AUTO_1726 ) ( AVAILABLE ?AUTO_1724 ) ( CHANNEL_FREE ?AUTO_1722 ) ( not ( = ?AUTO_1720 ?AUTO_1723 ) ) ( not ( = ?AUTO_1720 ?AUTO_1726 ) ) ( not ( = ?AUTO_1723 ?AUTO_1726 ) ) ( CAN_TRAVERSE ?AUTO_1724 ?AUTO_1725 ?AUTO_1723 ) ( VISIBLE ?AUTO_1725 ?AUTO_1723 ) ( not ( = ?AUTO_1720 ?AUTO_1725 ) ) ( not ( = ?AUTO_1726 ?AUTO_1725 ) ) ( not ( = ?AUTO_1723 ?AUTO_1725 ) ) ( CAN_TRAVERSE ?AUTO_1724 ?AUTO_1720 ?AUTO_1725 ) ( VISIBLE ?AUTO_1720 ?AUTO_1725 ) ( AT_SOIL_SAMPLE ?AUTO_1720 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1724 ) ( STORE_OF ?AUTO_1721 ?AUTO_1724 ) ( CAN_TRAVERSE ?AUTO_1724 ?AUTO_1725 ?AUTO_1720 ) ( VISIBLE ?AUTO_1725 ?AUTO_1720 ) ( CAN_TRAVERSE ?AUTO_1724 ?AUTO_1723 ?AUTO_1725 ) ( AT ?AUTO_1724 ?AUTO_1723 ) ( VISIBLE ?AUTO_1723 ?AUTO_1725 ) ( FULL ?AUTO_1721 ) )
    :subtasks
    ( ( !DROP ?AUTO_1724 ?AUTO_1721 )
      ( GET_SOIL_DATA ?AUTO_1720 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1720 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1752 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1754 - LANDER
      ?AUTO_1755 - WAYPOINT
      ?AUTO_1753 - ROVER
      ?AUTO_1756 - WAYPOINT
      ?AUTO_1757 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1754 ?AUTO_1755 ) ( HAVE_ROCK_ANALYSIS ?AUTO_1753 ?AUTO_1752 ) ( VISIBLE ?AUTO_1756 ?AUTO_1755 ) ( AVAILABLE ?AUTO_1753 ) ( CHANNEL_FREE ?AUTO_1754 ) ( not ( = ?AUTO_1752 ?AUTO_1756 ) ) ( not ( = ?AUTO_1752 ?AUTO_1755 ) ) ( not ( = ?AUTO_1756 ?AUTO_1755 ) ) ( CAN_TRAVERSE ?AUTO_1753 ?AUTO_1752 ?AUTO_1756 ) ( VISIBLE ?AUTO_1752 ?AUTO_1756 ) ( CAN_TRAVERSE ?AUTO_1753 ?AUTO_1757 ?AUTO_1752 ) ( AT ?AUTO_1753 ?AUTO_1757 ) ( VISIBLE ?AUTO_1757 ?AUTO_1752 ) ( not ( = ?AUTO_1752 ?AUTO_1757 ) ) ( not ( = ?AUTO_1755 ?AUTO_1757 ) ) ( not ( = ?AUTO_1756 ?AUTO_1757 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1753 ?AUTO_1757 ?AUTO_1752 )
      ( GET_ROCK_DATA ?AUTO_1752 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1752 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1773 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1775 - LANDER
      ?AUTO_1778 - WAYPOINT
      ?AUTO_1776 - WAYPOINT
      ?AUTO_1777 - ROVER
      ?AUTO_1774 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1775 ?AUTO_1778 ) ( VISIBLE ?AUTO_1776 ?AUTO_1778 ) ( AVAILABLE ?AUTO_1777 ) ( CHANNEL_FREE ?AUTO_1775 ) ( not ( = ?AUTO_1773 ?AUTO_1776 ) ) ( not ( = ?AUTO_1773 ?AUTO_1778 ) ) ( not ( = ?AUTO_1776 ?AUTO_1778 ) ) ( CAN_TRAVERSE ?AUTO_1777 ?AUTO_1773 ?AUTO_1776 ) ( VISIBLE ?AUTO_1773 ?AUTO_1776 ) ( AT_ROCK_SAMPLE ?AUTO_1773 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1777 ) ( STORE_OF ?AUTO_1774 ?AUTO_1777 ) ( CAN_TRAVERSE ?AUTO_1777 ?AUTO_1776 ?AUTO_1773 ) ( AT ?AUTO_1777 ?AUTO_1776 ) ( VISIBLE ?AUTO_1776 ?AUTO_1773 ) ( FULL ?AUTO_1774 ) )
    :subtasks
    ( ( !DROP ?AUTO_1777 ?AUTO_1774 )
      ( GET_ROCK_DATA ?AUTO_1773 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1773 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1836 - OBJECTIVE
      ?AUTO_1835 - MODE
    )
    :vars
    (
      ?AUTO_1839 - LANDER
      ?AUTO_1837 - WAYPOINT
      ?AUTO_1838 - WAYPOINT
      ?AUTO_1840 - ROVER
      ?AUTO_1841 - WAYPOINT
      ?AUTO_1842 - CAMERA
      ?AUTO_1843 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1839 ?AUTO_1837 ) ( VISIBLE ?AUTO_1838 ?AUTO_1837 ) ( AVAILABLE ?AUTO_1840 ) ( CHANNEL_FREE ?AUTO_1839 ) ( not ( = ?AUTO_1838 ?AUTO_1837 ) ) ( CAN_TRAVERSE ?AUTO_1840 ?AUTO_1841 ?AUTO_1838 ) ( VISIBLE ?AUTO_1841 ?AUTO_1838 ) ( not ( = ?AUTO_1837 ?AUTO_1841 ) ) ( not ( = ?AUTO_1838 ?AUTO_1841 ) ) ( CALIBRATED ?AUTO_1842 ?AUTO_1840 ) ( ON_BOARD ?AUTO_1842 ?AUTO_1840 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1840 ) ( SUPPORTS ?AUTO_1842 ?AUTO_1835 ) ( VISIBLE_FROM ?AUTO_1836 ?AUTO_1841 ) ( CAN_TRAVERSE ?AUTO_1840 ?AUTO_1843 ?AUTO_1841 ) ( AT ?AUTO_1840 ?AUTO_1843 ) ( VISIBLE ?AUTO_1843 ?AUTO_1841 ) ( not ( = ?AUTO_1837 ?AUTO_1843 ) ) ( not ( = ?AUTO_1838 ?AUTO_1843 ) ) ( not ( = ?AUTO_1841 ?AUTO_1843 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1840 ?AUTO_1843 ?AUTO_1841 )
      ( GET_IMAGE_DATA ?AUTO_1836 ?AUTO_1835 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1836 ?AUTO_1835 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1855 - OBJECTIVE
      ?AUTO_1854 - MODE
    )
    :vars
    (
      ?AUTO_1862 - LANDER
      ?AUTO_1858 - WAYPOINT
      ?AUTO_1861 - WAYPOINT
      ?AUTO_1859 - ROVER
      ?AUTO_1857 - WAYPOINT
      ?AUTO_1860 - CAMERA
      ?AUTO_1856 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1862 ?AUTO_1858 ) ( VISIBLE ?AUTO_1861 ?AUTO_1858 ) ( AVAILABLE ?AUTO_1859 ) ( CHANNEL_FREE ?AUTO_1862 ) ( not ( = ?AUTO_1861 ?AUTO_1858 ) ) ( CAN_TRAVERSE ?AUTO_1859 ?AUTO_1857 ?AUTO_1861 ) ( VISIBLE ?AUTO_1857 ?AUTO_1861 ) ( not ( = ?AUTO_1858 ?AUTO_1857 ) ) ( not ( = ?AUTO_1861 ?AUTO_1857 ) ) ( CALIBRATED ?AUTO_1860 ?AUTO_1859 ) ( ON_BOARD ?AUTO_1860 ?AUTO_1859 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1859 ) ( SUPPORTS ?AUTO_1860 ?AUTO_1854 ) ( VISIBLE_FROM ?AUTO_1855 ?AUTO_1857 ) ( CAN_TRAVERSE ?AUTO_1859 ?AUTO_1856 ?AUTO_1857 ) ( VISIBLE ?AUTO_1856 ?AUTO_1857 ) ( not ( = ?AUTO_1858 ?AUTO_1856 ) ) ( not ( = ?AUTO_1861 ?AUTO_1856 ) ) ( not ( = ?AUTO_1857 ?AUTO_1856 ) ) ( CAN_TRAVERSE ?AUTO_1859 ?AUTO_1861 ?AUTO_1856 ) ( AT ?AUTO_1859 ?AUTO_1861 ) ( VISIBLE ?AUTO_1861 ?AUTO_1856 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1859 ?AUTO_1861 ?AUTO_1856 )
      ( GET_IMAGE_DATA ?AUTO_1855 ?AUTO_1854 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1855 ?AUTO_1854 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1864 - OBJECTIVE
      ?AUTO_1863 - MODE
    )
    :vars
    (
      ?AUTO_1866 - LANDER
      ?AUTO_1865 - WAYPOINT
      ?AUTO_1867 - WAYPOINT
      ?AUTO_1868 - ROVER
      ?AUTO_1871 - WAYPOINT
      ?AUTO_1870 - CAMERA
      ?AUTO_1869 - WAYPOINT
      ?AUTO_1872 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1866 ?AUTO_1865 ) ( VISIBLE ?AUTO_1867 ?AUTO_1865 ) ( AVAILABLE ?AUTO_1868 ) ( CHANNEL_FREE ?AUTO_1866 ) ( not ( = ?AUTO_1867 ?AUTO_1865 ) ) ( CAN_TRAVERSE ?AUTO_1868 ?AUTO_1871 ?AUTO_1867 ) ( VISIBLE ?AUTO_1871 ?AUTO_1867 ) ( not ( = ?AUTO_1865 ?AUTO_1871 ) ) ( not ( = ?AUTO_1867 ?AUTO_1871 ) ) ( ON_BOARD ?AUTO_1870 ?AUTO_1868 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1868 ) ( SUPPORTS ?AUTO_1870 ?AUTO_1863 ) ( VISIBLE_FROM ?AUTO_1864 ?AUTO_1871 ) ( CAN_TRAVERSE ?AUTO_1868 ?AUTO_1869 ?AUTO_1871 ) ( VISIBLE ?AUTO_1869 ?AUTO_1871 ) ( not ( = ?AUTO_1865 ?AUTO_1869 ) ) ( not ( = ?AUTO_1867 ?AUTO_1869 ) ) ( not ( = ?AUTO_1871 ?AUTO_1869 ) ) ( CAN_TRAVERSE ?AUTO_1868 ?AUTO_1867 ?AUTO_1869 ) ( AT ?AUTO_1868 ?AUTO_1867 ) ( VISIBLE ?AUTO_1867 ?AUTO_1869 ) ( CALIBRATION_TARGET ?AUTO_1870 ?AUTO_1872 ) ( VISIBLE_FROM ?AUTO_1872 ?AUTO_1867 ) ( not ( = ?AUTO_1864 ?AUTO_1872 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1868 ?AUTO_1870 ?AUTO_1872 ?AUTO_1867 )
      ( GET_IMAGE_DATA ?AUTO_1864 ?AUTO_1863 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1864 ?AUTO_1863 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1923 - OBJECTIVE
      ?AUTO_1922 - MODE
    )
    :vars
    (
      ?AUTO_1930 - LANDER
      ?AUTO_1927 - WAYPOINT
      ?AUTO_1926 - WAYPOINT
      ?AUTO_1929 - ROVER
      ?AUTO_1924 - WAYPOINT
      ?AUTO_1925 - CAMERA
      ?AUTO_1928 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1930 ?AUTO_1927 ) ( VISIBLE ?AUTO_1926 ?AUTO_1927 ) ( AVAILABLE ?AUTO_1929 ) ( CHANNEL_FREE ?AUTO_1930 ) ( not ( = ?AUTO_1926 ?AUTO_1927 ) ) ( CAN_TRAVERSE ?AUTO_1929 ?AUTO_1924 ?AUTO_1926 ) ( VISIBLE ?AUTO_1924 ?AUTO_1926 ) ( not ( = ?AUTO_1927 ?AUTO_1924 ) ) ( not ( = ?AUTO_1926 ?AUTO_1924 ) ) ( ON_BOARD ?AUTO_1925 ?AUTO_1929 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1929 ) ( SUPPORTS ?AUTO_1925 ?AUTO_1922 ) ( VISIBLE_FROM ?AUTO_1923 ?AUTO_1924 ) ( CALIBRATION_TARGET ?AUTO_1925 ?AUTO_1923 ) ( CAN_TRAVERSE ?AUTO_1929 ?AUTO_1928 ?AUTO_1924 ) ( VISIBLE ?AUTO_1928 ?AUTO_1924 ) ( not ( = ?AUTO_1927 ?AUTO_1928 ) ) ( not ( = ?AUTO_1926 ?AUTO_1928 ) ) ( not ( = ?AUTO_1924 ?AUTO_1928 ) ) ( CAN_TRAVERSE ?AUTO_1929 ?AUTO_1926 ?AUTO_1928 ) ( AT ?AUTO_1929 ?AUTO_1926 ) ( VISIBLE ?AUTO_1926 ?AUTO_1928 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1929 ?AUTO_1926 ?AUTO_1928 )
      ( GET_IMAGE_DATA ?AUTO_1923 ?AUTO_1922 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1923 ?AUTO_1922 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1953 - OBJECTIVE
      ?AUTO_1954 - MODE
    )
    :vars
    (
      ?AUTO_1958 - LANDER
      ?AUTO_1957 - WAYPOINT
      ?AUTO_1956 - WAYPOINT
      ?AUTO_1955 - ROVER
      ?AUTO_1959 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1958 ?AUTO_1957 ) ( VISIBLE ?AUTO_1956 ?AUTO_1957 ) ( AVAILABLE ?AUTO_1955 ) ( CHANNEL_FREE ?AUTO_1958 ) ( not ( = ?AUTO_1956 ?AUTO_1957 ) ) ( ON_BOARD ?AUTO_1959 ?AUTO_1955 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1955 ) ( SUPPORTS ?AUTO_1959 ?AUTO_1954 ) ( VISIBLE_FROM ?AUTO_1953 ?AUTO_1956 ) ( CALIBRATION_TARGET ?AUTO_1959 ?AUTO_1953 ) ( CAN_TRAVERSE ?AUTO_1955 ?AUTO_1957 ?AUTO_1956 ) ( AT ?AUTO_1955 ?AUTO_1957 ) ( VISIBLE ?AUTO_1957 ?AUTO_1956 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1955 ?AUTO_1957 ?AUTO_1956 )
      ( GET_IMAGE_DATA ?AUTO_1953 ?AUTO_1954 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1953 ?AUTO_1954 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1960 - OBJECTIVE
      ?AUTO_1961 - MODE
    )
    :vars
    (
      ?AUTO_1966 - LANDER
      ?AUTO_1964 - WAYPOINT
      ?AUTO_1965 - WAYPOINT
      ?AUTO_1963 - ROVER
      ?AUTO_1962 - CAMERA
      ?AUTO_1967 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1966 ?AUTO_1964 ) ( VISIBLE ?AUTO_1965 ?AUTO_1964 ) ( AVAILABLE ?AUTO_1963 ) ( CHANNEL_FREE ?AUTO_1966 ) ( not ( = ?AUTO_1965 ?AUTO_1964 ) ) ( ON_BOARD ?AUTO_1962 ?AUTO_1963 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1963 ) ( SUPPORTS ?AUTO_1962 ?AUTO_1961 ) ( VISIBLE_FROM ?AUTO_1960 ?AUTO_1965 ) ( CALIBRATION_TARGET ?AUTO_1962 ?AUTO_1960 ) ( CAN_TRAVERSE ?AUTO_1963 ?AUTO_1964 ?AUTO_1965 ) ( VISIBLE ?AUTO_1964 ?AUTO_1965 ) ( CAN_TRAVERSE ?AUTO_1963 ?AUTO_1967 ?AUTO_1964 ) ( AT ?AUTO_1963 ?AUTO_1967 ) ( VISIBLE ?AUTO_1967 ?AUTO_1964 ) ( not ( = ?AUTO_1964 ?AUTO_1967 ) ) ( not ( = ?AUTO_1965 ?AUTO_1967 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1963 ?AUTO_1967 ?AUTO_1964 )
      ( GET_IMAGE_DATA ?AUTO_1960 ?AUTO_1961 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1960 ?AUTO_1961 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2138 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2142 - LANDER
      ?AUTO_2144 - WAYPOINT
      ?AUTO_2139 - ROVER
      ?AUTO_2140 - STORE
      ?AUTO_2141 - WAYPOINT
      ?AUTO_2143 - WAYPOINT
      ?AUTO_2145 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2142 ?AUTO_2144 ) ( VISIBLE ?AUTO_2138 ?AUTO_2144 ) ( AVAILABLE ?AUTO_2139 ) ( CHANNEL_FREE ?AUTO_2142 ) ( not ( = ?AUTO_2138 ?AUTO_2144 ) ) ( AT_ROCK_SAMPLE ?AUTO_2138 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2139 ) ( STORE_OF ?AUTO_2140 ?AUTO_2139 ) ( CAN_TRAVERSE ?AUTO_2139 ?AUTO_2141 ?AUTO_2138 ) ( VISIBLE ?AUTO_2141 ?AUTO_2138 ) ( not ( = ?AUTO_2138 ?AUTO_2141 ) ) ( not ( = ?AUTO_2144 ?AUTO_2141 ) ) ( AT_ROCK_SAMPLE ?AUTO_2141 ) ( EMPTY ?AUTO_2140 ) ( CAN_TRAVERSE ?AUTO_2139 ?AUTO_2144 ?AUTO_2141 ) ( VISIBLE ?AUTO_2144 ?AUTO_2141 ) ( CAN_TRAVERSE ?AUTO_2139 ?AUTO_2143 ?AUTO_2144 ) ( VISIBLE ?AUTO_2143 ?AUTO_2144 ) ( not ( = ?AUTO_2138 ?AUTO_2143 ) ) ( not ( = ?AUTO_2144 ?AUTO_2143 ) ) ( not ( = ?AUTO_2141 ?AUTO_2143 ) ) ( CAN_TRAVERSE ?AUTO_2139 ?AUTO_2145 ?AUTO_2143 ) ( AT ?AUTO_2139 ?AUTO_2145 ) ( VISIBLE ?AUTO_2145 ?AUTO_2143 ) ( not ( = ?AUTO_2138 ?AUTO_2145 ) ) ( not ( = ?AUTO_2144 ?AUTO_2145 ) ) ( not ( = ?AUTO_2141 ?AUTO_2145 ) ) ( not ( = ?AUTO_2143 ?AUTO_2145 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2139 ?AUTO_2145 ?AUTO_2143 )
      ( GET_ROCK_DATA ?AUTO_2138 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2138 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2181 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2183 - LANDER
      ?AUTO_2184 - WAYPOINT
      ?AUTO_2185 - ROVER
      ?AUTO_2182 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2183 ?AUTO_2184 ) ( VISIBLE ?AUTO_2181 ?AUTO_2184 ) ( AVAILABLE ?AUTO_2185 ) ( CHANNEL_FREE ?AUTO_2183 ) ( not ( = ?AUTO_2181 ?AUTO_2184 ) ) ( AT_SOIL_SAMPLE ?AUTO_2181 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2185 ) ( STORE_OF ?AUTO_2182 ?AUTO_2185 ) ( CAN_TRAVERSE ?AUTO_2185 ?AUTO_2184 ?AUTO_2181 ) ( AT ?AUTO_2185 ?AUTO_2184 ) ( VISIBLE ?AUTO_2184 ?AUTO_2181 ) ( AT_ROCK_SAMPLE ?AUTO_2184 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2185 ) ( EMPTY ?AUTO_2182 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2185 ?AUTO_2182 ?AUTO_2184 )
      ( GET_SOIL_DATA ?AUTO_2181 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2181 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2205 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2207 - LANDER
      ?AUTO_2208 - WAYPOINT
      ?AUTO_2209 - ROVER
      ?AUTO_2206 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2207 ?AUTO_2208 ) ( VISIBLE ?AUTO_2205 ?AUTO_2208 ) ( AVAILABLE ?AUTO_2209 ) ( CHANNEL_FREE ?AUTO_2207 ) ( not ( = ?AUTO_2205 ?AUTO_2208 ) ) ( AT_ROCK_SAMPLE ?AUTO_2205 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2209 ) ( STORE_OF ?AUTO_2206 ?AUTO_2209 ) ( FULL ?AUTO_2206 ) ( CAN_TRAVERSE ?AUTO_2209 ?AUTO_2208 ?AUTO_2205 ) ( AT ?AUTO_2209 ?AUTO_2208 ) ( VISIBLE ?AUTO_2208 ?AUTO_2205 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2209 ?AUTO_2208 ?AUTO_2205 )
      ( GET_ROCK_DATA ?AUTO_2205 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2205 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2210 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2213 - LANDER
      ?AUTO_2211 - WAYPOINT
      ?AUTO_2212 - ROVER
      ?AUTO_2214 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2213 ?AUTO_2211 ) ( VISIBLE ?AUTO_2210 ?AUTO_2211 ) ( AVAILABLE ?AUTO_2212 ) ( CHANNEL_FREE ?AUTO_2213 ) ( not ( = ?AUTO_2210 ?AUTO_2211 ) ) ( AT_ROCK_SAMPLE ?AUTO_2210 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2212 ) ( STORE_OF ?AUTO_2214 ?AUTO_2212 ) ( CAN_TRAVERSE ?AUTO_2212 ?AUTO_2211 ?AUTO_2210 ) ( AT ?AUTO_2212 ?AUTO_2211 ) ( VISIBLE ?AUTO_2211 ?AUTO_2210 ) ( AT_ROCK_SAMPLE ?AUTO_2211 ) ( EMPTY ?AUTO_2214 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2212 ?AUTO_2214 ?AUTO_2211 )
      ( GET_ROCK_DATA ?AUTO_2210 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2210 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2248 - OBJECTIVE
      ?AUTO_2249 - MODE
    )
    :vars
    (
      ?AUTO_2251 - LANDER
      ?AUTO_2250 - WAYPOINT
      ?AUTO_2252 - WAYPOINT
      ?AUTO_2253 - ROVER
      ?AUTO_2255 - WAYPOINT
      ?AUTO_2254 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2251 ?AUTO_2250 ) ( VISIBLE ?AUTO_2252 ?AUTO_2250 ) ( AVAILABLE ?AUTO_2253 ) ( CHANNEL_FREE ?AUTO_2251 ) ( not ( = ?AUTO_2252 ?AUTO_2250 ) ) ( CAN_TRAVERSE ?AUTO_2253 ?AUTO_2255 ?AUTO_2252 ) ( VISIBLE ?AUTO_2255 ?AUTO_2252 ) ( not ( = ?AUTO_2250 ?AUTO_2255 ) ) ( not ( = ?AUTO_2252 ?AUTO_2255 ) ) ( ON_BOARD ?AUTO_2254 ?AUTO_2253 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2253 ) ( SUPPORTS ?AUTO_2254 ?AUTO_2249 ) ( VISIBLE_FROM ?AUTO_2248 ?AUTO_2255 ) ( CALIBRATION_TARGET ?AUTO_2254 ?AUTO_2248 ) ( CAN_TRAVERSE ?AUTO_2253 ?AUTO_2252 ?AUTO_2255 ) ( AT ?AUTO_2253 ?AUTO_2252 ) ( VISIBLE ?AUTO_2252 ?AUTO_2255 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2253 ?AUTO_2252 ?AUTO_2255 )
      ( GET_IMAGE_DATA ?AUTO_2248 ?AUTO_2249 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2248 ?AUTO_2249 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2256 - OBJECTIVE
      ?AUTO_2257 - MODE
    )
    :vars
    (
      ?AUTO_2262 - LANDER
      ?AUTO_2259 - WAYPOINT
      ?AUTO_2263 - WAYPOINT
      ?AUTO_2261 - ROVER
      ?AUTO_2260 - WAYPOINT
      ?AUTO_2258 - CAMERA
      ?AUTO_2264 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2262 ?AUTO_2259 ) ( VISIBLE ?AUTO_2263 ?AUTO_2259 ) ( AVAILABLE ?AUTO_2261 ) ( CHANNEL_FREE ?AUTO_2262 ) ( not ( = ?AUTO_2263 ?AUTO_2259 ) ) ( CAN_TRAVERSE ?AUTO_2261 ?AUTO_2260 ?AUTO_2263 ) ( VISIBLE ?AUTO_2260 ?AUTO_2263 ) ( not ( = ?AUTO_2259 ?AUTO_2260 ) ) ( not ( = ?AUTO_2263 ?AUTO_2260 ) ) ( ON_BOARD ?AUTO_2258 ?AUTO_2261 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2261 ) ( SUPPORTS ?AUTO_2258 ?AUTO_2257 ) ( VISIBLE_FROM ?AUTO_2256 ?AUTO_2260 ) ( CALIBRATION_TARGET ?AUTO_2258 ?AUTO_2256 ) ( CAN_TRAVERSE ?AUTO_2261 ?AUTO_2263 ?AUTO_2260 ) ( VISIBLE ?AUTO_2263 ?AUTO_2260 ) ( CAN_TRAVERSE ?AUTO_2261 ?AUTO_2264 ?AUTO_2263 ) ( AT ?AUTO_2261 ?AUTO_2264 ) ( VISIBLE ?AUTO_2264 ?AUTO_2263 ) ( not ( = ?AUTO_2259 ?AUTO_2264 ) ) ( not ( = ?AUTO_2263 ?AUTO_2264 ) ) ( not ( = ?AUTO_2260 ?AUTO_2264 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2261 ?AUTO_2264 ?AUTO_2263 )
      ( GET_IMAGE_DATA ?AUTO_2256 ?AUTO_2257 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2256 ?AUTO_2257 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2281 - OBJECTIVE
      ?AUTO_2282 - MODE
    )
    :vars
    (
      ?AUTO_2284 - LANDER
      ?AUTO_2288 - WAYPOINT
      ?AUTO_2287 - WAYPOINT
      ?AUTO_2289 - ROVER
      ?AUTO_2286 - WAYPOINT
      ?AUTO_2283 - CAMERA
      ?AUTO_2285 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2284 ?AUTO_2288 ) ( VISIBLE ?AUTO_2287 ?AUTO_2288 ) ( AVAILABLE ?AUTO_2289 ) ( CHANNEL_FREE ?AUTO_2284 ) ( not ( = ?AUTO_2287 ?AUTO_2288 ) ) ( CAN_TRAVERSE ?AUTO_2289 ?AUTO_2286 ?AUTO_2287 ) ( VISIBLE ?AUTO_2286 ?AUTO_2287 ) ( not ( = ?AUTO_2288 ?AUTO_2286 ) ) ( not ( = ?AUTO_2287 ?AUTO_2286 ) ) ( ON_BOARD ?AUTO_2283 ?AUTO_2289 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2289 ) ( SUPPORTS ?AUTO_2283 ?AUTO_2282 ) ( VISIBLE_FROM ?AUTO_2281 ?AUTO_2286 ) ( CALIBRATION_TARGET ?AUTO_2283 ?AUTO_2281 ) ( CAN_TRAVERSE ?AUTO_2289 ?AUTO_2287 ?AUTO_2286 ) ( VISIBLE ?AUTO_2287 ?AUTO_2286 ) ( CAN_TRAVERSE ?AUTO_2289 ?AUTO_2285 ?AUTO_2287 ) ( VISIBLE ?AUTO_2285 ?AUTO_2287 ) ( not ( = ?AUTO_2288 ?AUTO_2285 ) ) ( not ( = ?AUTO_2287 ?AUTO_2285 ) ) ( not ( = ?AUTO_2286 ?AUTO_2285 ) ) ( CAN_TRAVERSE ?AUTO_2289 ?AUTO_2288 ?AUTO_2285 ) ( AT ?AUTO_2289 ?AUTO_2288 ) ( VISIBLE ?AUTO_2288 ?AUTO_2285 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2289 ?AUTO_2288 ?AUTO_2285 )
      ( GET_IMAGE_DATA ?AUTO_2281 ?AUTO_2282 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2281 ?AUTO_2282 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2309 - OBJECTIVE
      ?AUTO_2310 - MODE
    )
    :vars
    (
      ?AUTO_2313 - LANDER
      ?AUTO_2315 - WAYPOINT
      ?AUTO_2312 - WAYPOINT
      ?AUTO_2314 - ROVER
      ?AUTO_2311 - CAMERA
      ?AUTO_2316 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2313 ?AUTO_2315 ) ( VISIBLE ?AUTO_2312 ?AUTO_2315 ) ( AVAILABLE ?AUTO_2314 ) ( CHANNEL_FREE ?AUTO_2313 ) ( not ( = ?AUTO_2312 ?AUTO_2315 ) ) ( CALIBRATED ?AUTO_2311 ?AUTO_2314 ) ( ON_BOARD ?AUTO_2311 ?AUTO_2314 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2314 ) ( SUPPORTS ?AUTO_2311 ?AUTO_2310 ) ( VISIBLE_FROM ?AUTO_2309 ?AUTO_2312 ) ( CAN_TRAVERSE ?AUTO_2314 ?AUTO_2316 ?AUTO_2312 ) ( AT ?AUTO_2314 ?AUTO_2316 ) ( VISIBLE ?AUTO_2316 ?AUTO_2312 ) ( not ( = ?AUTO_2315 ?AUTO_2316 ) ) ( not ( = ?AUTO_2312 ?AUTO_2316 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2314 ?AUTO_2316 ?AUTO_2312 )
      ( GET_IMAGE_DATA ?AUTO_2309 ?AUTO_2310 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2309 ?AUTO_2310 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2317 - OBJECTIVE
      ?AUTO_2318 - MODE
    )
    :vars
    (
      ?AUTO_2319 - LANDER
      ?AUTO_2324 - WAYPOINT
      ?AUTO_2323 - WAYPOINT
      ?AUTO_2321 - ROVER
      ?AUTO_2320 - CAMERA
      ?AUTO_2322 - WAYPOINT
      ?AUTO_2325 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2319 ?AUTO_2324 ) ( VISIBLE ?AUTO_2323 ?AUTO_2324 ) ( AVAILABLE ?AUTO_2321 ) ( CHANNEL_FREE ?AUTO_2319 ) ( not ( = ?AUTO_2323 ?AUTO_2324 ) ) ( ON_BOARD ?AUTO_2320 ?AUTO_2321 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2321 ) ( SUPPORTS ?AUTO_2320 ?AUTO_2318 ) ( VISIBLE_FROM ?AUTO_2317 ?AUTO_2323 ) ( CAN_TRAVERSE ?AUTO_2321 ?AUTO_2322 ?AUTO_2323 ) ( AT ?AUTO_2321 ?AUTO_2322 ) ( VISIBLE ?AUTO_2322 ?AUTO_2323 ) ( not ( = ?AUTO_2324 ?AUTO_2322 ) ) ( not ( = ?AUTO_2323 ?AUTO_2322 ) ) ( CALIBRATION_TARGET ?AUTO_2320 ?AUTO_2325 ) ( VISIBLE_FROM ?AUTO_2325 ?AUTO_2322 ) ( not ( = ?AUTO_2317 ?AUTO_2325 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2321 ?AUTO_2320 ?AUTO_2325 ?AUTO_2322 )
      ( GET_IMAGE_DATA ?AUTO_2317 ?AUTO_2318 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2317 ?AUTO_2318 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2330 - OBJECTIVE
      ?AUTO_2331 - MODE
    )
    :vars
    (
      ?AUTO_2338 - LANDER
      ?AUTO_2334 - WAYPOINT
      ?AUTO_2332 - WAYPOINT
      ?AUTO_2336 - ROVER
      ?AUTO_2333 - CAMERA
      ?AUTO_2335 - WAYPOINT
      ?AUTO_2337 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2338 ?AUTO_2334 ) ( VISIBLE ?AUTO_2332 ?AUTO_2334 ) ( AVAILABLE ?AUTO_2336 ) ( CHANNEL_FREE ?AUTO_2338 ) ( not ( = ?AUTO_2332 ?AUTO_2334 ) ) ( ON_BOARD ?AUTO_2333 ?AUTO_2336 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2336 ) ( SUPPORTS ?AUTO_2333 ?AUTO_2331 ) ( VISIBLE_FROM ?AUTO_2330 ?AUTO_2332 ) ( CAN_TRAVERSE ?AUTO_2336 ?AUTO_2335 ?AUTO_2332 ) ( VISIBLE ?AUTO_2335 ?AUTO_2332 ) ( not ( = ?AUTO_2334 ?AUTO_2335 ) ) ( not ( = ?AUTO_2332 ?AUTO_2335 ) ) ( CALIBRATION_TARGET ?AUTO_2333 ?AUTO_2337 ) ( VISIBLE_FROM ?AUTO_2337 ?AUTO_2335 ) ( not ( = ?AUTO_2330 ?AUTO_2337 ) ) ( CAN_TRAVERSE ?AUTO_2336 ?AUTO_2332 ?AUTO_2335 ) ( AT ?AUTO_2336 ?AUTO_2332 ) ( VISIBLE ?AUTO_2332 ?AUTO_2335 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2336 ?AUTO_2332 ?AUTO_2335 )
      ( GET_IMAGE_DATA ?AUTO_2330 ?AUTO_2331 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2330 ?AUTO_2331 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2339 - OBJECTIVE
      ?AUTO_2340 - MODE
    )
    :vars
    (
      ?AUTO_2346 - LANDER
      ?AUTO_2347 - WAYPOINT
      ?AUTO_2344 - WAYPOINT
      ?AUTO_2345 - ROVER
      ?AUTO_2343 - CAMERA
      ?AUTO_2341 - WAYPOINT
      ?AUTO_2342 - OBJECTIVE
      ?AUTO_2348 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2346 ?AUTO_2347 ) ( VISIBLE ?AUTO_2344 ?AUTO_2347 ) ( AVAILABLE ?AUTO_2345 ) ( CHANNEL_FREE ?AUTO_2346 ) ( not ( = ?AUTO_2344 ?AUTO_2347 ) ) ( ON_BOARD ?AUTO_2343 ?AUTO_2345 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2345 ) ( SUPPORTS ?AUTO_2343 ?AUTO_2340 ) ( VISIBLE_FROM ?AUTO_2339 ?AUTO_2344 ) ( CAN_TRAVERSE ?AUTO_2345 ?AUTO_2341 ?AUTO_2344 ) ( VISIBLE ?AUTO_2341 ?AUTO_2344 ) ( not ( = ?AUTO_2347 ?AUTO_2341 ) ) ( not ( = ?AUTO_2344 ?AUTO_2341 ) ) ( CALIBRATION_TARGET ?AUTO_2343 ?AUTO_2342 ) ( VISIBLE_FROM ?AUTO_2342 ?AUTO_2341 ) ( not ( = ?AUTO_2339 ?AUTO_2342 ) ) ( CAN_TRAVERSE ?AUTO_2345 ?AUTO_2344 ?AUTO_2341 ) ( VISIBLE ?AUTO_2344 ?AUTO_2341 ) ( CAN_TRAVERSE ?AUTO_2345 ?AUTO_2348 ?AUTO_2344 ) ( AT ?AUTO_2345 ?AUTO_2348 ) ( VISIBLE ?AUTO_2348 ?AUTO_2344 ) ( not ( = ?AUTO_2347 ?AUTO_2348 ) ) ( not ( = ?AUTO_2344 ?AUTO_2348 ) ) ( not ( = ?AUTO_2341 ?AUTO_2348 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2345 ?AUTO_2348 ?AUTO_2344 )
      ( GET_IMAGE_DATA ?AUTO_2339 ?AUTO_2340 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2339 ?AUTO_2340 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2365 - OBJECTIVE
      ?AUTO_2366 - MODE
    )
    :vars
    (
      ?AUTO_2370 - LANDER
      ?AUTO_2372 - WAYPOINT
      ?AUTO_2373 - WAYPOINT
      ?AUTO_2367 - ROVER
      ?AUTO_2369 - CAMERA
      ?AUTO_2371 - WAYPOINT
      ?AUTO_2368 - OBJECTIVE
      ?AUTO_2374 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2370 ?AUTO_2372 ) ( VISIBLE ?AUTO_2373 ?AUTO_2372 ) ( AVAILABLE ?AUTO_2367 ) ( CHANNEL_FREE ?AUTO_2370 ) ( not ( = ?AUTO_2373 ?AUTO_2372 ) ) ( ON_BOARD ?AUTO_2369 ?AUTO_2367 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2367 ) ( SUPPORTS ?AUTO_2369 ?AUTO_2366 ) ( VISIBLE_FROM ?AUTO_2365 ?AUTO_2373 ) ( CAN_TRAVERSE ?AUTO_2367 ?AUTO_2371 ?AUTO_2373 ) ( VISIBLE ?AUTO_2371 ?AUTO_2373 ) ( not ( = ?AUTO_2372 ?AUTO_2371 ) ) ( not ( = ?AUTO_2373 ?AUTO_2371 ) ) ( CALIBRATION_TARGET ?AUTO_2369 ?AUTO_2368 ) ( VISIBLE_FROM ?AUTO_2368 ?AUTO_2371 ) ( not ( = ?AUTO_2365 ?AUTO_2368 ) ) ( CAN_TRAVERSE ?AUTO_2367 ?AUTO_2373 ?AUTO_2371 ) ( VISIBLE ?AUTO_2373 ?AUTO_2371 ) ( CAN_TRAVERSE ?AUTO_2367 ?AUTO_2374 ?AUTO_2373 ) ( VISIBLE ?AUTO_2374 ?AUTO_2373 ) ( not ( = ?AUTO_2372 ?AUTO_2374 ) ) ( not ( = ?AUTO_2373 ?AUTO_2374 ) ) ( not ( = ?AUTO_2371 ?AUTO_2374 ) ) ( CAN_TRAVERSE ?AUTO_2367 ?AUTO_2372 ?AUTO_2374 ) ( AT ?AUTO_2367 ?AUTO_2372 ) ( VISIBLE ?AUTO_2372 ?AUTO_2374 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2367 ?AUTO_2372 ?AUTO_2374 )
      ( GET_IMAGE_DATA ?AUTO_2365 ?AUTO_2366 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2365 ?AUTO_2366 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2410 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2413 - LANDER
      ?AUTO_2412 - WAYPOINT
      ?AUTO_2411 - WAYPOINT
      ?AUTO_2415 - ROVER
      ?AUTO_2414 - STORE
      ?AUTO_2416 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2413 ?AUTO_2412 ) ( VISIBLE ?AUTO_2411 ?AUTO_2412 ) ( AVAILABLE ?AUTO_2415 ) ( CHANNEL_FREE ?AUTO_2413 ) ( not ( = ?AUTO_2410 ?AUTO_2411 ) ) ( not ( = ?AUTO_2410 ?AUTO_2412 ) ) ( not ( = ?AUTO_2411 ?AUTO_2412 ) ) ( CAN_TRAVERSE ?AUTO_2415 ?AUTO_2410 ?AUTO_2411 ) ( VISIBLE ?AUTO_2410 ?AUTO_2411 ) ( AT_ROCK_SAMPLE ?AUTO_2410 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2415 ) ( STORE_OF ?AUTO_2414 ?AUTO_2415 ) ( EMPTY ?AUTO_2414 ) ( CAN_TRAVERSE ?AUTO_2415 ?AUTO_2411 ?AUTO_2410 ) ( VISIBLE ?AUTO_2411 ?AUTO_2410 ) ( CAN_TRAVERSE ?AUTO_2415 ?AUTO_2416 ?AUTO_2411 ) ( AT ?AUTO_2415 ?AUTO_2416 ) ( VISIBLE ?AUTO_2416 ?AUTO_2411 ) ( not ( = ?AUTO_2410 ?AUTO_2416 ) ) ( not ( = ?AUTO_2412 ?AUTO_2416 ) ) ( not ( = ?AUTO_2411 ?AUTO_2416 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2415 ?AUTO_2416 ?AUTO_2411 )
      ( GET_ROCK_DATA ?AUTO_2410 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2410 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2417 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2421 - LANDER
      ?AUTO_2418 - WAYPOINT
      ?AUTO_2419 - WAYPOINT
      ?AUTO_2422 - ROVER
      ?AUTO_2420 - STORE
      ?AUTO_2423 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2421 ?AUTO_2418 ) ( VISIBLE ?AUTO_2419 ?AUTO_2418 ) ( AVAILABLE ?AUTO_2422 ) ( CHANNEL_FREE ?AUTO_2421 ) ( not ( = ?AUTO_2417 ?AUTO_2419 ) ) ( not ( = ?AUTO_2417 ?AUTO_2418 ) ) ( not ( = ?AUTO_2419 ?AUTO_2418 ) ) ( CAN_TRAVERSE ?AUTO_2422 ?AUTO_2417 ?AUTO_2419 ) ( VISIBLE ?AUTO_2417 ?AUTO_2419 ) ( AT_ROCK_SAMPLE ?AUTO_2417 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2422 ) ( STORE_OF ?AUTO_2420 ?AUTO_2422 ) ( CAN_TRAVERSE ?AUTO_2422 ?AUTO_2419 ?AUTO_2417 ) ( VISIBLE ?AUTO_2419 ?AUTO_2417 ) ( CAN_TRAVERSE ?AUTO_2422 ?AUTO_2423 ?AUTO_2419 ) ( AT ?AUTO_2422 ?AUTO_2423 ) ( VISIBLE ?AUTO_2423 ?AUTO_2419 ) ( not ( = ?AUTO_2417 ?AUTO_2423 ) ) ( not ( = ?AUTO_2418 ?AUTO_2423 ) ) ( not ( = ?AUTO_2419 ?AUTO_2423 ) ) ( FULL ?AUTO_2420 ) )
    :subtasks
    ( ( !DROP ?AUTO_2422 ?AUTO_2420 )
      ( GET_ROCK_DATA ?AUTO_2417 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2417 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2431 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2434 - LANDER
      ?AUTO_2436 - WAYPOINT
      ?AUTO_2435 - WAYPOINT
      ?AUTO_2433 - ROVER
      ?AUTO_2432 - STORE
      ?AUTO_2437 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2434 ?AUTO_2436 ) ( VISIBLE ?AUTO_2435 ?AUTO_2436 ) ( AVAILABLE ?AUTO_2433 ) ( CHANNEL_FREE ?AUTO_2434 ) ( not ( = ?AUTO_2431 ?AUTO_2435 ) ) ( not ( = ?AUTO_2431 ?AUTO_2436 ) ) ( not ( = ?AUTO_2435 ?AUTO_2436 ) ) ( CAN_TRAVERSE ?AUTO_2433 ?AUTO_2431 ?AUTO_2435 ) ( VISIBLE ?AUTO_2431 ?AUTO_2435 ) ( AT_ROCK_SAMPLE ?AUTO_2431 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2433 ) ( STORE_OF ?AUTO_2432 ?AUTO_2433 ) ( CAN_TRAVERSE ?AUTO_2433 ?AUTO_2435 ?AUTO_2431 ) ( VISIBLE ?AUTO_2435 ?AUTO_2431 ) ( CAN_TRAVERSE ?AUTO_2433 ?AUTO_2437 ?AUTO_2435 ) ( VISIBLE ?AUTO_2437 ?AUTO_2435 ) ( not ( = ?AUTO_2431 ?AUTO_2437 ) ) ( not ( = ?AUTO_2436 ?AUTO_2437 ) ) ( not ( = ?AUTO_2435 ?AUTO_2437 ) ) ( FULL ?AUTO_2432 ) ( CAN_TRAVERSE ?AUTO_2433 ?AUTO_2436 ?AUTO_2437 ) ( AT ?AUTO_2433 ?AUTO_2436 ) ( VISIBLE ?AUTO_2436 ?AUTO_2437 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2433 ?AUTO_2436 ?AUTO_2437 )
      ( GET_ROCK_DATA ?AUTO_2431 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2431 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2438 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2441 - LANDER
      ?AUTO_2443 - WAYPOINT
      ?AUTO_2444 - WAYPOINT
      ?AUTO_2440 - ROVER
      ?AUTO_2439 - STORE
      ?AUTO_2442 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2441 ?AUTO_2443 ) ( VISIBLE ?AUTO_2444 ?AUTO_2443 ) ( AVAILABLE ?AUTO_2440 ) ( CHANNEL_FREE ?AUTO_2441 ) ( not ( = ?AUTO_2438 ?AUTO_2444 ) ) ( not ( = ?AUTO_2438 ?AUTO_2443 ) ) ( not ( = ?AUTO_2444 ?AUTO_2443 ) ) ( CAN_TRAVERSE ?AUTO_2440 ?AUTO_2438 ?AUTO_2444 ) ( VISIBLE ?AUTO_2438 ?AUTO_2444 ) ( AT_ROCK_SAMPLE ?AUTO_2438 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2440 ) ( STORE_OF ?AUTO_2439 ?AUTO_2440 ) ( CAN_TRAVERSE ?AUTO_2440 ?AUTO_2444 ?AUTO_2438 ) ( VISIBLE ?AUTO_2444 ?AUTO_2438 ) ( CAN_TRAVERSE ?AUTO_2440 ?AUTO_2442 ?AUTO_2444 ) ( VISIBLE ?AUTO_2442 ?AUTO_2444 ) ( not ( = ?AUTO_2438 ?AUTO_2442 ) ) ( not ( = ?AUTO_2443 ?AUTO_2442 ) ) ( not ( = ?AUTO_2444 ?AUTO_2442 ) ) ( CAN_TRAVERSE ?AUTO_2440 ?AUTO_2443 ?AUTO_2442 ) ( AT ?AUTO_2440 ?AUTO_2443 ) ( VISIBLE ?AUTO_2443 ?AUTO_2442 ) ( AT_ROCK_SAMPLE ?AUTO_2443 ) ( EMPTY ?AUTO_2439 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2440 ?AUTO_2439 ?AUTO_2443 )
      ( GET_ROCK_DATA ?AUTO_2438 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2438 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2532 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2535 - LANDER
      ?AUTO_2537 - WAYPOINT
      ?AUTO_2533 - WAYPOINT
      ?AUTO_2536 - ROVER
      ?AUTO_2538 - STORE
      ?AUTO_2534 - WAYPOINT
      ?AUTO_2539 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2535 ?AUTO_2537 ) ( VISIBLE ?AUTO_2533 ?AUTO_2537 ) ( AVAILABLE ?AUTO_2536 ) ( CHANNEL_FREE ?AUTO_2535 ) ( not ( = ?AUTO_2532 ?AUTO_2533 ) ) ( not ( = ?AUTO_2532 ?AUTO_2537 ) ) ( not ( = ?AUTO_2533 ?AUTO_2537 ) ) ( CAN_TRAVERSE ?AUTO_2536 ?AUTO_2532 ?AUTO_2533 ) ( VISIBLE ?AUTO_2532 ?AUTO_2533 ) ( AT_ROCK_SAMPLE ?AUTO_2532 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2536 ) ( STORE_OF ?AUTO_2538 ?AUTO_2536 ) ( CAN_TRAVERSE ?AUTO_2536 ?AUTO_2534 ?AUTO_2532 ) ( VISIBLE ?AUTO_2534 ?AUTO_2532 ) ( not ( = ?AUTO_2532 ?AUTO_2534 ) ) ( not ( = ?AUTO_2537 ?AUTO_2534 ) ) ( not ( = ?AUTO_2533 ?AUTO_2534 ) ) ( CAN_TRAVERSE ?AUTO_2536 ?AUTO_2539 ?AUTO_2534 ) ( AT ?AUTO_2536 ?AUTO_2539 ) ( VISIBLE ?AUTO_2539 ?AUTO_2534 ) ( not ( = ?AUTO_2532 ?AUTO_2539 ) ) ( not ( = ?AUTO_2537 ?AUTO_2539 ) ) ( not ( = ?AUTO_2533 ?AUTO_2539 ) ) ( not ( = ?AUTO_2534 ?AUTO_2539 ) ) ( FULL ?AUTO_2538 ) )
    :subtasks
    ( ( !DROP ?AUTO_2536 ?AUTO_2538 )
      ( GET_ROCK_DATA ?AUTO_2532 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2532 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2551 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2553 - LANDER
      ?AUTO_2552 - WAYPOINT
      ?AUTO_2557 - WAYPOINT
      ?AUTO_2554 - ROVER
      ?AUTO_2555 - STORE
      ?AUTO_2556 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2553 ?AUTO_2552 ) ( VISIBLE ?AUTO_2557 ?AUTO_2552 ) ( AVAILABLE ?AUTO_2554 ) ( CHANNEL_FREE ?AUTO_2553 ) ( not ( = ?AUTO_2551 ?AUTO_2557 ) ) ( not ( = ?AUTO_2551 ?AUTO_2552 ) ) ( not ( = ?AUTO_2557 ?AUTO_2552 ) ) ( CAN_TRAVERSE ?AUTO_2554 ?AUTO_2551 ?AUTO_2557 ) ( VISIBLE ?AUTO_2551 ?AUTO_2557 ) ( AT_ROCK_SAMPLE ?AUTO_2551 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2554 ) ( STORE_OF ?AUTO_2555 ?AUTO_2554 ) ( EMPTY ?AUTO_2555 ) ( CAN_TRAVERSE ?AUTO_2554 ?AUTO_2556 ?AUTO_2551 ) ( VISIBLE ?AUTO_2556 ?AUTO_2551 ) ( not ( = ?AUTO_2551 ?AUTO_2556 ) ) ( not ( = ?AUTO_2552 ?AUTO_2556 ) ) ( not ( = ?AUTO_2557 ?AUTO_2556 ) ) ( CAN_TRAVERSE ?AUTO_2554 ?AUTO_2557 ?AUTO_2556 ) ( AT ?AUTO_2554 ?AUTO_2557 ) ( VISIBLE ?AUTO_2557 ?AUTO_2556 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2554 ?AUTO_2557 ?AUTO_2556 )
      ( GET_ROCK_DATA ?AUTO_2551 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2551 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2558 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2562 - LANDER
      ?AUTO_2563 - WAYPOINT
      ?AUTO_2560 - WAYPOINT
      ?AUTO_2559 - ROVER
      ?AUTO_2561 - STORE
      ?AUTO_2564 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2562 ?AUTO_2563 ) ( VISIBLE ?AUTO_2560 ?AUTO_2563 ) ( AVAILABLE ?AUTO_2559 ) ( CHANNEL_FREE ?AUTO_2562 ) ( not ( = ?AUTO_2558 ?AUTO_2560 ) ) ( not ( = ?AUTO_2558 ?AUTO_2563 ) ) ( not ( = ?AUTO_2560 ?AUTO_2563 ) ) ( CAN_TRAVERSE ?AUTO_2559 ?AUTO_2558 ?AUTO_2560 ) ( VISIBLE ?AUTO_2558 ?AUTO_2560 ) ( AT_ROCK_SAMPLE ?AUTO_2558 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2559 ) ( STORE_OF ?AUTO_2561 ?AUTO_2559 ) ( CAN_TRAVERSE ?AUTO_2559 ?AUTO_2564 ?AUTO_2558 ) ( VISIBLE ?AUTO_2564 ?AUTO_2558 ) ( not ( = ?AUTO_2558 ?AUTO_2564 ) ) ( not ( = ?AUTO_2563 ?AUTO_2564 ) ) ( not ( = ?AUTO_2560 ?AUTO_2564 ) ) ( CAN_TRAVERSE ?AUTO_2559 ?AUTO_2560 ?AUTO_2564 ) ( AT ?AUTO_2559 ?AUTO_2560 ) ( VISIBLE ?AUTO_2560 ?AUTO_2564 ) ( FULL ?AUTO_2561 ) )
    :subtasks
    ( ( !DROP ?AUTO_2559 ?AUTO_2561 )
      ( GET_ROCK_DATA ?AUTO_2558 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2558 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2572 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2574 - LANDER
      ?AUTO_2575 - WAYPOINT
      ?AUTO_2577 - WAYPOINT
      ?AUTO_2573 - ROVER
      ?AUTO_2576 - STORE
      ?AUTO_2578 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2574 ?AUTO_2575 ) ( VISIBLE ?AUTO_2577 ?AUTO_2575 ) ( AVAILABLE ?AUTO_2573 ) ( CHANNEL_FREE ?AUTO_2574 ) ( not ( = ?AUTO_2572 ?AUTO_2577 ) ) ( not ( = ?AUTO_2572 ?AUTO_2575 ) ) ( not ( = ?AUTO_2577 ?AUTO_2575 ) ) ( CAN_TRAVERSE ?AUTO_2573 ?AUTO_2572 ?AUTO_2577 ) ( VISIBLE ?AUTO_2572 ?AUTO_2577 ) ( AT_ROCK_SAMPLE ?AUTO_2572 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2573 ) ( STORE_OF ?AUTO_2576 ?AUTO_2573 ) ( CAN_TRAVERSE ?AUTO_2573 ?AUTO_2578 ?AUTO_2572 ) ( VISIBLE ?AUTO_2578 ?AUTO_2572 ) ( not ( = ?AUTO_2572 ?AUTO_2578 ) ) ( not ( = ?AUTO_2575 ?AUTO_2578 ) ) ( not ( = ?AUTO_2577 ?AUTO_2578 ) ) ( CAN_TRAVERSE ?AUTO_2573 ?AUTO_2577 ?AUTO_2578 ) ( VISIBLE ?AUTO_2577 ?AUTO_2578 ) ( FULL ?AUTO_2576 ) ( CAN_TRAVERSE ?AUTO_2573 ?AUTO_2575 ?AUTO_2577 ) ( AT ?AUTO_2573 ?AUTO_2575 ) ( VISIBLE ?AUTO_2575 ?AUTO_2577 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2573 ?AUTO_2575 ?AUTO_2577 )
      ( GET_ROCK_DATA ?AUTO_2572 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2572 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2579 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2582 - LANDER
      ?AUTO_2585 - WAYPOINT
      ?AUTO_2584 - WAYPOINT
      ?AUTO_2581 - ROVER
      ?AUTO_2580 - STORE
      ?AUTO_2583 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2582 ?AUTO_2585 ) ( VISIBLE ?AUTO_2584 ?AUTO_2585 ) ( AVAILABLE ?AUTO_2581 ) ( CHANNEL_FREE ?AUTO_2582 ) ( not ( = ?AUTO_2579 ?AUTO_2584 ) ) ( not ( = ?AUTO_2579 ?AUTO_2585 ) ) ( not ( = ?AUTO_2584 ?AUTO_2585 ) ) ( CAN_TRAVERSE ?AUTO_2581 ?AUTO_2579 ?AUTO_2584 ) ( VISIBLE ?AUTO_2579 ?AUTO_2584 ) ( AT_ROCK_SAMPLE ?AUTO_2579 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2581 ) ( STORE_OF ?AUTO_2580 ?AUTO_2581 ) ( CAN_TRAVERSE ?AUTO_2581 ?AUTO_2583 ?AUTO_2579 ) ( VISIBLE ?AUTO_2583 ?AUTO_2579 ) ( not ( = ?AUTO_2579 ?AUTO_2583 ) ) ( not ( = ?AUTO_2585 ?AUTO_2583 ) ) ( not ( = ?AUTO_2584 ?AUTO_2583 ) ) ( CAN_TRAVERSE ?AUTO_2581 ?AUTO_2584 ?AUTO_2583 ) ( VISIBLE ?AUTO_2584 ?AUTO_2583 ) ( CAN_TRAVERSE ?AUTO_2581 ?AUTO_2585 ?AUTO_2584 ) ( AT ?AUTO_2581 ?AUTO_2585 ) ( VISIBLE ?AUTO_2585 ?AUTO_2584 ) ( AT_ROCK_SAMPLE ?AUTO_2585 ) ( EMPTY ?AUTO_2580 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2581 ?AUTO_2580 ?AUTO_2585 )
      ( GET_ROCK_DATA ?AUTO_2579 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2579 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2611 - OBJECTIVE
      ?AUTO_2612 - MODE
    )
    :vars
    (
      ?AUTO_2618 - LANDER
      ?AUTO_2616 - WAYPOINT
      ?AUTO_2613 - WAYPOINT
      ?AUTO_2617 - ROVER
      ?AUTO_2615 - CAMERA
      ?AUTO_2614 - WAYPOINT
      ?AUTO_2619 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2618 ?AUTO_2616 ) ( VISIBLE ?AUTO_2613 ?AUTO_2616 ) ( AVAILABLE ?AUTO_2617 ) ( CHANNEL_FREE ?AUTO_2618 ) ( not ( = ?AUTO_2613 ?AUTO_2616 ) ) ( CALIBRATED ?AUTO_2615 ?AUTO_2617 ) ( ON_BOARD ?AUTO_2615 ?AUTO_2617 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2617 ) ( SUPPORTS ?AUTO_2615 ?AUTO_2612 ) ( VISIBLE_FROM ?AUTO_2611 ?AUTO_2613 ) ( CAN_TRAVERSE ?AUTO_2617 ?AUTO_2614 ?AUTO_2613 ) ( VISIBLE ?AUTO_2614 ?AUTO_2613 ) ( not ( = ?AUTO_2616 ?AUTO_2614 ) ) ( not ( = ?AUTO_2613 ?AUTO_2614 ) ) ( CAN_TRAVERSE ?AUTO_2617 ?AUTO_2619 ?AUTO_2614 ) ( AT ?AUTO_2617 ?AUTO_2619 ) ( VISIBLE ?AUTO_2619 ?AUTO_2614 ) ( not ( = ?AUTO_2616 ?AUTO_2619 ) ) ( not ( = ?AUTO_2613 ?AUTO_2619 ) ) ( not ( = ?AUTO_2614 ?AUTO_2619 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2617 ?AUTO_2619 ?AUTO_2614 )
      ( GET_IMAGE_DATA ?AUTO_2611 ?AUTO_2612 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2611 ?AUTO_2612 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2652 - OBJECTIVE
      ?AUTO_2653 - MODE
    )
    :vars
    (
      ?AUTO_2658 - LANDER
      ?AUTO_2657 - WAYPOINT
      ?AUTO_2655 - WAYPOINT
      ?AUTO_2654 - ROVER
      ?AUTO_2656 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2658 ?AUTO_2657 ) ( VISIBLE ?AUTO_2655 ?AUTO_2657 ) ( AVAILABLE ?AUTO_2654 ) ( CHANNEL_FREE ?AUTO_2658 ) ( not ( = ?AUTO_2655 ?AUTO_2657 ) ) ( CAN_TRAVERSE ?AUTO_2654 ?AUTO_2657 ?AUTO_2655 ) ( VISIBLE ?AUTO_2657 ?AUTO_2655 ) ( ON_BOARD ?AUTO_2656 ?AUTO_2654 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2654 ) ( SUPPORTS ?AUTO_2656 ?AUTO_2653 ) ( VISIBLE_FROM ?AUTO_2652 ?AUTO_2657 ) ( CALIBRATION_TARGET ?AUTO_2656 ?AUTO_2652 ) ( CAN_TRAVERSE ?AUTO_2654 ?AUTO_2655 ?AUTO_2657 ) ( AT ?AUTO_2654 ?AUTO_2655 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2654 ?AUTO_2655 ?AUTO_2657 )
      ( GET_IMAGE_DATA ?AUTO_2652 ?AUTO_2653 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2652 ?AUTO_2653 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2659 - OBJECTIVE
      ?AUTO_2660 - MODE
    )
    :vars
    (
      ?AUTO_2664 - LANDER
      ?AUTO_2663 - WAYPOINT
      ?AUTO_2662 - WAYPOINT
      ?AUTO_2661 - ROVER
      ?AUTO_2665 - CAMERA
      ?AUTO_2666 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2664 ?AUTO_2663 ) ( VISIBLE ?AUTO_2662 ?AUTO_2663 ) ( AVAILABLE ?AUTO_2661 ) ( CHANNEL_FREE ?AUTO_2664 ) ( not ( = ?AUTO_2662 ?AUTO_2663 ) ) ( CAN_TRAVERSE ?AUTO_2661 ?AUTO_2663 ?AUTO_2662 ) ( VISIBLE ?AUTO_2663 ?AUTO_2662 ) ( ON_BOARD ?AUTO_2665 ?AUTO_2661 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2661 ) ( SUPPORTS ?AUTO_2665 ?AUTO_2660 ) ( VISIBLE_FROM ?AUTO_2659 ?AUTO_2663 ) ( CALIBRATION_TARGET ?AUTO_2665 ?AUTO_2659 ) ( CAN_TRAVERSE ?AUTO_2661 ?AUTO_2662 ?AUTO_2663 ) ( CAN_TRAVERSE ?AUTO_2661 ?AUTO_2666 ?AUTO_2662 ) ( AT ?AUTO_2661 ?AUTO_2666 ) ( VISIBLE ?AUTO_2666 ?AUTO_2662 ) ( not ( = ?AUTO_2663 ?AUTO_2666 ) ) ( not ( = ?AUTO_2662 ?AUTO_2666 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2661 ?AUTO_2666 ?AUTO_2662 )
      ( GET_IMAGE_DATA ?AUTO_2659 ?AUTO_2660 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2659 ?AUTO_2660 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2701 - OBJECTIVE
      ?AUTO_2702 - MODE
    )
    :vars
    (
      ?AUTO_2709 - LANDER
      ?AUTO_2707 - WAYPOINT
      ?AUTO_2704 - WAYPOINT
      ?AUTO_2705 - ROVER
      ?AUTO_2706 - CAMERA
      ?AUTO_2708 - WAYPOINT
      ?AUTO_2703 - WAYPOINT
      ?AUTO_2710 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2709 ?AUTO_2707 ) ( VISIBLE ?AUTO_2704 ?AUTO_2707 ) ( AVAILABLE ?AUTO_2705 ) ( CHANNEL_FREE ?AUTO_2709 ) ( not ( = ?AUTO_2704 ?AUTO_2707 ) ) ( ON_BOARD ?AUTO_2706 ?AUTO_2705 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2705 ) ( SUPPORTS ?AUTO_2706 ?AUTO_2702 ) ( VISIBLE_FROM ?AUTO_2701 ?AUTO_2704 ) ( CAN_TRAVERSE ?AUTO_2705 ?AUTO_2708 ?AUTO_2704 ) ( VISIBLE ?AUTO_2708 ?AUTO_2704 ) ( not ( = ?AUTO_2707 ?AUTO_2708 ) ) ( not ( = ?AUTO_2704 ?AUTO_2708 ) ) ( CAN_TRAVERSE ?AUTO_2705 ?AUTO_2703 ?AUTO_2708 ) ( AT ?AUTO_2705 ?AUTO_2703 ) ( VISIBLE ?AUTO_2703 ?AUTO_2708 ) ( not ( = ?AUTO_2707 ?AUTO_2703 ) ) ( not ( = ?AUTO_2704 ?AUTO_2703 ) ) ( not ( = ?AUTO_2708 ?AUTO_2703 ) ) ( CALIBRATION_TARGET ?AUTO_2706 ?AUTO_2710 ) ( VISIBLE_FROM ?AUTO_2710 ?AUTO_2703 ) ( not ( = ?AUTO_2701 ?AUTO_2710 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2705 ?AUTO_2706 ?AUTO_2710 ?AUTO_2703 )
      ( GET_IMAGE_DATA ?AUTO_2701 ?AUTO_2702 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2701 ?AUTO_2702 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2883 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2885 - LANDER
      ?AUTO_2887 - WAYPOINT
      ?AUTO_2884 - ROVER
      ?AUTO_2886 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2885 ?AUTO_2883 ) ( VISIBLE ?AUTO_2887 ?AUTO_2883 ) ( AVAILABLE ?AUTO_2884 ) ( CHANNEL_FREE ?AUTO_2885 ) ( not ( = ?AUTO_2883 ?AUTO_2887 ) ) ( CAN_TRAVERSE ?AUTO_2884 ?AUTO_2883 ?AUTO_2887 ) ( AT ?AUTO_2884 ?AUTO_2883 ) ( VISIBLE ?AUTO_2883 ?AUTO_2887 ) ( AT_SOIL_SAMPLE ?AUTO_2883 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2884 ) ( STORE_OF ?AUTO_2886 ?AUTO_2884 ) ( FULL ?AUTO_2886 ) )
    :subtasks
    ( ( !DROP ?AUTO_2884 ?AUTO_2886 )
      ( GET_SOIL_DATA ?AUTO_2883 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2883 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2888 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2890 - LANDER
      ?AUTO_2892 - WAYPOINT
      ?AUTO_2891 - ROVER
      ?AUTO_2889 - STORE
      ?AUTO_2893 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2890 ?AUTO_2888 ) ( VISIBLE ?AUTO_2892 ?AUTO_2888 ) ( AVAILABLE ?AUTO_2891 ) ( CHANNEL_FREE ?AUTO_2890 ) ( not ( = ?AUTO_2888 ?AUTO_2892 ) ) ( CAN_TRAVERSE ?AUTO_2891 ?AUTO_2888 ?AUTO_2892 ) ( VISIBLE ?AUTO_2888 ?AUTO_2892 ) ( AT_SOIL_SAMPLE ?AUTO_2888 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2891 ) ( STORE_OF ?AUTO_2889 ?AUTO_2891 ) ( FULL ?AUTO_2889 ) ( CAN_TRAVERSE ?AUTO_2891 ?AUTO_2893 ?AUTO_2888 ) ( AT ?AUTO_2891 ?AUTO_2893 ) ( VISIBLE ?AUTO_2893 ?AUTO_2888 ) ( not ( = ?AUTO_2888 ?AUTO_2893 ) ) ( not ( = ?AUTO_2892 ?AUTO_2893 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2891 ?AUTO_2893 ?AUTO_2888 )
      ( GET_SOIL_DATA ?AUTO_2888 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2888 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2895 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2899 - LANDER
      ?AUTO_2897 - WAYPOINT
      ?AUTO_2900 - ROVER
      ?AUTO_2898 - STORE
      ?AUTO_2896 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2899 ?AUTO_2895 ) ( VISIBLE ?AUTO_2897 ?AUTO_2895 ) ( AVAILABLE ?AUTO_2900 ) ( CHANNEL_FREE ?AUTO_2899 ) ( not ( = ?AUTO_2895 ?AUTO_2897 ) ) ( CAN_TRAVERSE ?AUTO_2900 ?AUTO_2895 ?AUTO_2897 ) ( VISIBLE ?AUTO_2895 ?AUTO_2897 ) ( AT_SOIL_SAMPLE ?AUTO_2895 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2900 ) ( STORE_OF ?AUTO_2898 ?AUTO_2900 ) ( CAN_TRAVERSE ?AUTO_2900 ?AUTO_2896 ?AUTO_2895 ) ( AT ?AUTO_2900 ?AUTO_2896 ) ( VISIBLE ?AUTO_2896 ?AUTO_2895 ) ( not ( = ?AUTO_2895 ?AUTO_2896 ) ) ( not ( = ?AUTO_2897 ?AUTO_2896 ) ) ( AT_ROCK_SAMPLE ?AUTO_2896 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2900 ) ( EMPTY ?AUTO_2898 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2900 ?AUTO_2898 ?AUTO_2896 )
      ( GET_SOIL_DATA ?AUTO_2895 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2895 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4288 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4290 - LANDER
      ?AUTO_4293 - WAYPOINT
      ?AUTO_4292 - ROVER
      ?AUTO_4291 - STORE
      ?AUTO_4289 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4290 ?AUTO_4288 ) ( VISIBLE ?AUTO_4293 ?AUTO_4288 ) ( AVAILABLE ?AUTO_4292 ) ( CHANNEL_FREE ?AUTO_4290 ) ( not ( = ?AUTO_4288 ?AUTO_4293 ) ) ( CAN_TRAVERSE ?AUTO_4292 ?AUTO_4288 ?AUTO_4293 ) ( VISIBLE ?AUTO_4288 ?AUTO_4293 ) ( AT_SOIL_SAMPLE ?AUTO_4288 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4292 ) ( STORE_OF ?AUTO_4291 ?AUTO_4292 ) ( EMPTY ?AUTO_4291 ) ( CAN_TRAVERSE ?AUTO_4292 ?AUTO_4289 ?AUTO_4288 ) ( VISIBLE ?AUTO_4289 ?AUTO_4288 ) ( not ( = ?AUTO_4288 ?AUTO_4289 ) ) ( not ( = ?AUTO_4293 ?AUTO_4289 ) ) ( CAN_TRAVERSE ?AUTO_4292 ?AUTO_4293 ?AUTO_4289 ) ( AT ?AUTO_4292 ?AUTO_4293 ) ( VISIBLE ?AUTO_4293 ?AUTO_4289 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4292 ?AUTO_4293 ?AUTO_4289 )
      ( GET_SOIL_DATA ?AUTO_4288 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4288 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2917 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2919 - LANDER
      ?AUTO_2918 - WAYPOINT
      ?AUTO_2920 - ROVER
      ?AUTO_2922 - STORE
      ?AUTO_2921 - WAYPOINT
      ?AUTO_2923 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2919 ?AUTO_2917 ) ( VISIBLE ?AUTO_2918 ?AUTO_2917 ) ( AVAILABLE ?AUTO_2920 ) ( CHANNEL_FREE ?AUTO_2919 ) ( not ( = ?AUTO_2917 ?AUTO_2918 ) ) ( CAN_TRAVERSE ?AUTO_2920 ?AUTO_2917 ?AUTO_2918 ) ( VISIBLE ?AUTO_2917 ?AUTO_2918 ) ( AT_SOIL_SAMPLE ?AUTO_2917 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2920 ) ( STORE_OF ?AUTO_2922 ?AUTO_2920 ) ( CAN_TRAVERSE ?AUTO_2920 ?AUTO_2921 ?AUTO_2917 ) ( VISIBLE ?AUTO_2921 ?AUTO_2917 ) ( not ( = ?AUTO_2917 ?AUTO_2921 ) ) ( not ( = ?AUTO_2918 ?AUTO_2921 ) ) ( AT_ROCK_SAMPLE ?AUTO_2921 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2920 ) ( EMPTY ?AUTO_2922 ) ( CAN_TRAVERSE ?AUTO_2920 ?AUTO_2918 ?AUTO_2921 ) ( VISIBLE ?AUTO_2918 ?AUTO_2921 ) ( CAN_TRAVERSE ?AUTO_2920 ?AUTO_2923 ?AUTO_2918 ) ( AT ?AUTO_2920 ?AUTO_2923 ) ( VISIBLE ?AUTO_2923 ?AUTO_2918 ) ( not ( = ?AUTO_2917 ?AUTO_2923 ) ) ( not ( = ?AUTO_2918 ?AUTO_2923 ) ) ( not ( = ?AUTO_2921 ?AUTO_2923 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2920 ?AUTO_2923 ?AUTO_2918 )
      ( GET_SOIL_DATA ?AUTO_2917 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2917 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2942 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2943 - LANDER
      ?AUTO_2946 - WAYPOINT
      ?AUTO_2945 - ROVER
      ?AUTO_2944 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2943 ?AUTO_2946 ) ( VISIBLE ?AUTO_2942 ?AUTO_2946 ) ( AVAILABLE ?AUTO_2945 ) ( CHANNEL_FREE ?AUTO_2943 ) ( not ( = ?AUTO_2942 ?AUTO_2946 ) ) ( AT_ROCK_SAMPLE ?AUTO_2942 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2945 ) ( STORE_OF ?AUTO_2944 ?AUTO_2945 ) ( CAN_TRAVERSE ?AUTO_2945 ?AUTO_2946 ?AUTO_2942 ) ( AT ?AUTO_2945 ?AUTO_2946 ) ( VISIBLE ?AUTO_2946 ?AUTO_2942 ) ( FULL ?AUTO_2944 ) )
    :subtasks
    ( ( !DROP ?AUTO_2945 ?AUTO_2944 )
      ( GET_ROCK_DATA ?AUTO_2942 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2942 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2949 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2952 - LANDER
      ?AUTO_2950 - WAYPOINT
      ?AUTO_2953 - ROVER
      ?AUTO_2951 - STORE
      ?AUTO_2954 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2952 ?AUTO_2950 ) ( VISIBLE ?AUTO_2949 ?AUTO_2950 ) ( AVAILABLE ?AUTO_2953 ) ( CHANNEL_FREE ?AUTO_2952 ) ( not ( = ?AUTO_2949 ?AUTO_2950 ) ) ( AT_ROCK_SAMPLE ?AUTO_2949 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2953 ) ( STORE_OF ?AUTO_2951 ?AUTO_2953 ) ( CAN_TRAVERSE ?AUTO_2953 ?AUTO_2950 ?AUTO_2949 ) ( VISIBLE ?AUTO_2950 ?AUTO_2949 ) ( FULL ?AUTO_2951 ) ( CAN_TRAVERSE ?AUTO_2953 ?AUTO_2954 ?AUTO_2950 ) ( AT ?AUTO_2953 ?AUTO_2954 ) ( VISIBLE ?AUTO_2954 ?AUTO_2950 ) ( not ( = ?AUTO_2949 ?AUTO_2954 ) ) ( not ( = ?AUTO_2950 ?AUTO_2954 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2953 ?AUTO_2954 ?AUTO_2950 )
      ( GET_ROCK_DATA ?AUTO_2949 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2949 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2956 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2961 - LANDER
      ?AUTO_2960 - WAYPOINT
      ?AUTO_2959 - ROVER
      ?AUTO_2957 - STORE
      ?AUTO_2958 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2961 ?AUTO_2960 ) ( VISIBLE ?AUTO_2956 ?AUTO_2960 ) ( AVAILABLE ?AUTO_2959 ) ( CHANNEL_FREE ?AUTO_2961 ) ( not ( = ?AUTO_2956 ?AUTO_2960 ) ) ( AT_ROCK_SAMPLE ?AUTO_2956 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2959 ) ( STORE_OF ?AUTO_2957 ?AUTO_2959 ) ( CAN_TRAVERSE ?AUTO_2959 ?AUTO_2960 ?AUTO_2956 ) ( VISIBLE ?AUTO_2960 ?AUTO_2956 ) ( CAN_TRAVERSE ?AUTO_2959 ?AUTO_2958 ?AUTO_2960 ) ( AT ?AUTO_2959 ?AUTO_2958 ) ( VISIBLE ?AUTO_2958 ?AUTO_2960 ) ( not ( = ?AUTO_2956 ?AUTO_2958 ) ) ( not ( = ?AUTO_2960 ?AUTO_2958 ) ) ( AT_ROCK_SAMPLE ?AUTO_2958 ) ( EMPTY ?AUTO_2957 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2959 ?AUTO_2957 ?AUTO_2958 )
      ( GET_ROCK_DATA ?AUTO_2956 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2956 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2985 - OBJECTIVE
      ?AUTO_2986 - MODE
    )
    :vars
    (
      ?AUTO_2992 - LANDER
      ?AUTO_2988 - WAYPOINT
      ?AUTO_2990 - WAYPOINT
      ?AUTO_2989 - ROVER
      ?AUTO_2991 - CAMERA
      ?AUTO_2987 - OBJECTIVE
      ?AUTO_2993 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2992 ?AUTO_2988 ) ( VISIBLE ?AUTO_2990 ?AUTO_2988 ) ( AVAILABLE ?AUTO_2989 ) ( CHANNEL_FREE ?AUTO_2992 ) ( not ( = ?AUTO_2990 ?AUTO_2988 ) ) ( ON_BOARD ?AUTO_2991 ?AUTO_2989 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2989 ) ( SUPPORTS ?AUTO_2991 ?AUTO_2986 ) ( VISIBLE_FROM ?AUTO_2985 ?AUTO_2990 ) ( CALIBRATION_TARGET ?AUTO_2991 ?AUTO_2987 ) ( VISIBLE_FROM ?AUTO_2987 ?AUTO_2990 ) ( not ( = ?AUTO_2985 ?AUTO_2987 ) ) ( CAN_TRAVERSE ?AUTO_2989 ?AUTO_2993 ?AUTO_2990 ) ( AT ?AUTO_2989 ?AUTO_2993 ) ( VISIBLE ?AUTO_2993 ?AUTO_2990 ) ( not ( = ?AUTO_2988 ?AUTO_2993 ) ) ( not ( = ?AUTO_2990 ?AUTO_2993 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2989 ?AUTO_2993 ?AUTO_2990 )
      ( GET_IMAGE_DATA ?AUTO_2985 ?AUTO_2986 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2985 ?AUTO_2986 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2994 - OBJECTIVE
      ?AUTO_2995 - MODE
    )
    :vars
    (
      ?AUTO_2998 - LANDER
      ?AUTO_2997 - WAYPOINT
      ?AUTO_3000 - WAYPOINT
      ?AUTO_2999 - ROVER
      ?AUTO_3001 - CAMERA
      ?AUTO_2996 - OBJECTIVE
      ?AUTO_3002 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2998 ?AUTO_2997 ) ( VISIBLE ?AUTO_3000 ?AUTO_2997 ) ( AVAILABLE ?AUTO_2999 ) ( CHANNEL_FREE ?AUTO_2998 ) ( not ( = ?AUTO_3000 ?AUTO_2997 ) ) ( ON_BOARD ?AUTO_3001 ?AUTO_2999 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2999 ) ( SUPPORTS ?AUTO_3001 ?AUTO_2995 ) ( VISIBLE_FROM ?AUTO_2994 ?AUTO_3000 ) ( CALIBRATION_TARGET ?AUTO_3001 ?AUTO_2996 ) ( VISIBLE_FROM ?AUTO_2996 ?AUTO_3000 ) ( not ( = ?AUTO_2994 ?AUTO_2996 ) ) ( CAN_TRAVERSE ?AUTO_2999 ?AUTO_3002 ?AUTO_3000 ) ( VISIBLE ?AUTO_3002 ?AUTO_3000 ) ( not ( = ?AUTO_2997 ?AUTO_3002 ) ) ( not ( = ?AUTO_3000 ?AUTO_3002 ) ) ( CAN_TRAVERSE ?AUTO_2999 ?AUTO_2997 ?AUTO_3002 ) ( AT ?AUTO_2999 ?AUTO_2997 ) ( VISIBLE ?AUTO_2997 ?AUTO_3002 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2999 ?AUTO_2997 ?AUTO_3002 )
      ( GET_IMAGE_DATA ?AUTO_2994 ?AUTO_2995 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2994 ?AUTO_2995 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3003 - OBJECTIVE
      ?AUTO_3004 - MODE
    )
    :vars
    (
      ?AUTO_3009 - LANDER
      ?AUTO_3006 - WAYPOINT
      ?AUTO_3010 - WAYPOINT
      ?AUTO_3008 - ROVER
      ?AUTO_3011 - CAMERA
      ?AUTO_3007 - OBJECTIVE
      ?AUTO_3005 - WAYPOINT
      ?AUTO_3012 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3009 ?AUTO_3006 ) ( VISIBLE ?AUTO_3010 ?AUTO_3006 ) ( AVAILABLE ?AUTO_3008 ) ( CHANNEL_FREE ?AUTO_3009 ) ( not ( = ?AUTO_3010 ?AUTO_3006 ) ) ( ON_BOARD ?AUTO_3011 ?AUTO_3008 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3008 ) ( SUPPORTS ?AUTO_3011 ?AUTO_3004 ) ( VISIBLE_FROM ?AUTO_3003 ?AUTO_3010 ) ( CALIBRATION_TARGET ?AUTO_3011 ?AUTO_3007 ) ( VISIBLE_FROM ?AUTO_3007 ?AUTO_3010 ) ( not ( = ?AUTO_3003 ?AUTO_3007 ) ) ( CAN_TRAVERSE ?AUTO_3008 ?AUTO_3005 ?AUTO_3010 ) ( VISIBLE ?AUTO_3005 ?AUTO_3010 ) ( not ( = ?AUTO_3006 ?AUTO_3005 ) ) ( not ( = ?AUTO_3010 ?AUTO_3005 ) ) ( CAN_TRAVERSE ?AUTO_3008 ?AUTO_3006 ?AUTO_3005 ) ( VISIBLE ?AUTO_3006 ?AUTO_3005 ) ( CAN_TRAVERSE ?AUTO_3008 ?AUTO_3012 ?AUTO_3006 ) ( AT ?AUTO_3008 ?AUTO_3012 ) ( VISIBLE ?AUTO_3012 ?AUTO_3006 ) ( not ( = ?AUTO_3006 ?AUTO_3012 ) ) ( not ( = ?AUTO_3010 ?AUTO_3012 ) ) ( not ( = ?AUTO_3005 ?AUTO_3012 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3008 ?AUTO_3012 ?AUTO_3006 )
      ( GET_IMAGE_DATA ?AUTO_3003 ?AUTO_3004 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3003 ?AUTO_3004 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3060 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3064 - LANDER
      ?AUTO_3062 - WAYPOINT
      ?AUTO_3063 - ROVER
      ?AUTO_3061 - STORE
      ?AUTO_3065 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3064 ?AUTO_3062 ) ( VISIBLE ?AUTO_3060 ?AUTO_3062 ) ( AVAILABLE ?AUTO_3063 ) ( CHANNEL_FREE ?AUTO_3064 ) ( not ( = ?AUTO_3060 ?AUTO_3062 ) ) ( AT_SOIL_SAMPLE ?AUTO_3060 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3063 ) ( STORE_OF ?AUTO_3061 ?AUTO_3063 ) ( FULL ?AUTO_3061 ) ( CAN_TRAVERSE ?AUTO_3063 ?AUTO_3065 ?AUTO_3060 ) ( AT ?AUTO_3063 ?AUTO_3065 ) ( VISIBLE ?AUTO_3065 ?AUTO_3060 ) ( not ( = ?AUTO_3060 ?AUTO_3065 ) ) ( not ( = ?AUTO_3062 ?AUTO_3065 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3063 ?AUTO_3065 ?AUTO_3060 )
      ( GET_SOIL_DATA ?AUTO_3060 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3060 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3067 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3070 - LANDER
      ?AUTO_3072 - WAYPOINT
      ?AUTO_3069 - ROVER
      ?AUTO_3071 - STORE
      ?AUTO_3068 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3070 ?AUTO_3072 ) ( VISIBLE ?AUTO_3067 ?AUTO_3072 ) ( AVAILABLE ?AUTO_3069 ) ( CHANNEL_FREE ?AUTO_3070 ) ( not ( = ?AUTO_3067 ?AUTO_3072 ) ) ( AT_SOIL_SAMPLE ?AUTO_3067 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3069 ) ( STORE_OF ?AUTO_3071 ?AUTO_3069 ) ( CAN_TRAVERSE ?AUTO_3069 ?AUTO_3068 ?AUTO_3067 ) ( AT ?AUTO_3069 ?AUTO_3068 ) ( VISIBLE ?AUTO_3068 ?AUTO_3067 ) ( not ( = ?AUTO_3067 ?AUTO_3068 ) ) ( not ( = ?AUTO_3072 ?AUTO_3068 ) ) ( AT_ROCK_SAMPLE ?AUTO_3068 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3069 ) ( EMPTY ?AUTO_3071 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_3069 ?AUTO_3071 ?AUTO_3068 )
      ( GET_SOIL_DATA ?AUTO_3067 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3067 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3083 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3087 - LANDER
      ?AUTO_3085 - WAYPOINT
      ?AUTO_3086 - ROVER
      ?AUTO_3084 - STORE
      ?AUTO_3088 - WAYPOINT
      ?AUTO_3089 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3087 ?AUTO_3085 ) ( VISIBLE ?AUTO_3083 ?AUTO_3085 ) ( AVAILABLE ?AUTO_3086 ) ( CHANNEL_FREE ?AUTO_3087 ) ( not ( = ?AUTO_3083 ?AUTO_3085 ) ) ( AT_SOIL_SAMPLE ?AUTO_3083 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3086 ) ( STORE_OF ?AUTO_3084 ?AUTO_3086 ) ( CAN_TRAVERSE ?AUTO_3086 ?AUTO_3088 ?AUTO_3083 ) ( VISIBLE ?AUTO_3088 ?AUTO_3083 ) ( not ( = ?AUTO_3083 ?AUTO_3088 ) ) ( not ( = ?AUTO_3085 ?AUTO_3088 ) ) ( AT_ROCK_SAMPLE ?AUTO_3088 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3086 ) ( EMPTY ?AUTO_3084 ) ( CAN_TRAVERSE ?AUTO_3086 ?AUTO_3089 ?AUTO_3088 ) ( VISIBLE ?AUTO_3089 ?AUTO_3088 ) ( not ( = ?AUTO_3083 ?AUTO_3089 ) ) ( not ( = ?AUTO_3085 ?AUTO_3089 ) ) ( not ( = ?AUTO_3088 ?AUTO_3089 ) ) ( CAN_TRAVERSE ?AUTO_3086 ?AUTO_3085 ?AUTO_3089 ) ( AT ?AUTO_3086 ?AUTO_3085 ) ( VISIBLE ?AUTO_3085 ?AUTO_3089 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3086 ?AUTO_3085 ?AUTO_3089 )
      ( GET_SOIL_DATA ?AUTO_3083 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3083 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3090 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3091 - LANDER
      ?AUTO_3095 - WAYPOINT
      ?AUTO_3096 - ROVER
      ?AUTO_3092 - STORE
      ?AUTO_3094 - WAYPOINT
      ?AUTO_3093 - WAYPOINT
      ?AUTO_3097 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3091 ?AUTO_3095 ) ( VISIBLE ?AUTO_3090 ?AUTO_3095 ) ( AVAILABLE ?AUTO_3096 ) ( CHANNEL_FREE ?AUTO_3091 ) ( not ( = ?AUTO_3090 ?AUTO_3095 ) ) ( AT_SOIL_SAMPLE ?AUTO_3090 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3096 ) ( STORE_OF ?AUTO_3092 ?AUTO_3096 ) ( CAN_TRAVERSE ?AUTO_3096 ?AUTO_3094 ?AUTO_3090 ) ( VISIBLE ?AUTO_3094 ?AUTO_3090 ) ( not ( = ?AUTO_3090 ?AUTO_3094 ) ) ( not ( = ?AUTO_3095 ?AUTO_3094 ) ) ( AT_ROCK_SAMPLE ?AUTO_3094 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3096 ) ( EMPTY ?AUTO_3092 ) ( CAN_TRAVERSE ?AUTO_3096 ?AUTO_3093 ?AUTO_3094 ) ( VISIBLE ?AUTO_3093 ?AUTO_3094 ) ( not ( = ?AUTO_3090 ?AUTO_3093 ) ) ( not ( = ?AUTO_3095 ?AUTO_3093 ) ) ( not ( = ?AUTO_3094 ?AUTO_3093 ) ) ( CAN_TRAVERSE ?AUTO_3096 ?AUTO_3095 ?AUTO_3093 ) ( VISIBLE ?AUTO_3095 ?AUTO_3093 ) ( CAN_TRAVERSE ?AUTO_3096 ?AUTO_3097 ?AUTO_3095 ) ( AT ?AUTO_3096 ?AUTO_3097 ) ( VISIBLE ?AUTO_3097 ?AUTO_3095 ) ( not ( = ?AUTO_3090 ?AUTO_3097 ) ) ( not ( = ?AUTO_3095 ?AUTO_3097 ) ) ( not ( = ?AUTO_3094 ?AUTO_3097 ) ) ( not ( = ?AUTO_3093 ?AUTO_3097 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3096 ?AUTO_3097 ?AUTO_3095 )
      ( GET_SOIL_DATA ?AUTO_3090 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3090 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3120 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3123 - LANDER
      ?AUTO_3124 - WAYPOINT
      ?AUTO_3121 - ROVER
      ?AUTO_3122 - STORE
      ?AUTO_3125 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3123 ?AUTO_3124 ) ( VISIBLE ?AUTO_3120 ?AUTO_3124 ) ( AVAILABLE ?AUTO_3121 ) ( CHANNEL_FREE ?AUTO_3123 ) ( not ( = ?AUTO_3120 ?AUTO_3124 ) ) ( AT_ROCK_SAMPLE ?AUTO_3120 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3121 ) ( STORE_OF ?AUTO_3122 ?AUTO_3121 ) ( CAN_TRAVERSE ?AUTO_3121 ?AUTO_3125 ?AUTO_3120 ) ( AT ?AUTO_3121 ?AUTO_3125 ) ( VISIBLE ?AUTO_3125 ?AUTO_3120 ) ( not ( = ?AUTO_3120 ?AUTO_3125 ) ) ( not ( = ?AUTO_3124 ?AUTO_3125 ) ) ( AT_SOIL_SAMPLE ?AUTO_3125 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3121 ) ( EMPTY ?AUTO_3122 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_3121 ?AUTO_3122 ?AUTO_3125 )
      ( GET_ROCK_DATA ?AUTO_3120 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3120 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3153 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3156 - LANDER
      ?AUTO_3155 - WAYPOINT
      ?AUTO_3159 - ROVER
      ?AUTO_3157 - STORE
      ?AUTO_3158 - WAYPOINT
      ?AUTO_3154 - WAYPOINT
      ?AUTO_3160 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3156 ?AUTO_3155 ) ( VISIBLE ?AUTO_3153 ?AUTO_3155 ) ( AVAILABLE ?AUTO_3159 ) ( CHANNEL_FREE ?AUTO_3156 ) ( not ( = ?AUTO_3153 ?AUTO_3155 ) ) ( AT_ROCK_SAMPLE ?AUTO_3153 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3159 ) ( STORE_OF ?AUTO_3157 ?AUTO_3159 ) ( CAN_TRAVERSE ?AUTO_3159 ?AUTO_3158 ?AUTO_3153 ) ( VISIBLE ?AUTO_3158 ?AUTO_3153 ) ( not ( = ?AUTO_3153 ?AUTO_3158 ) ) ( not ( = ?AUTO_3155 ?AUTO_3158 ) ) ( CAN_TRAVERSE ?AUTO_3159 ?AUTO_3154 ?AUTO_3158 ) ( VISIBLE ?AUTO_3154 ?AUTO_3158 ) ( not ( = ?AUTO_3153 ?AUTO_3154 ) ) ( not ( = ?AUTO_3155 ?AUTO_3154 ) ) ( not ( = ?AUTO_3158 ?AUTO_3154 ) ) ( AT_ROCK_SAMPLE ?AUTO_3154 ) ( EMPTY ?AUTO_3157 ) ( CAN_TRAVERSE ?AUTO_3159 ?AUTO_3160 ?AUTO_3154 ) ( VISIBLE ?AUTO_3160 ?AUTO_3154 ) ( not ( = ?AUTO_3153 ?AUTO_3160 ) ) ( not ( = ?AUTO_3155 ?AUTO_3160 ) ) ( not ( = ?AUTO_3158 ?AUTO_3160 ) ) ( not ( = ?AUTO_3154 ?AUTO_3160 ) ) ( CAN_TRAVERSE ?AUTO_3159 ?AUTO_3155 ?AUTO_3160 ) ( AT ?AUTO_3159 ?AUTO_3155 ) ( VISIBLE ?AUTO_3155 ?AUTO_3160 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3159 ?AUTO_3155 ?AUTO_3160 )
      ( GET_ROCK_DATA ?AUTO_3153 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3153 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3177 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3180 - LANDER
      ?AUTO_3182 - WAYPOINT
      ?AUTO_3179 - ROVER
      ?AUTO_3181 - STORE
      ?AUTO_3178 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3180 ?AUTO_3182 ) ( VISIBLE ?AUTO_3177 ?AUTO_3182 ) ( AVAILABLE ?AUTO_3179 ) ( CHANNEL_FREE ?AUTO_3180 ) ( not ( = ?AUTO_3177 ?AUTO_3182 ) ) ( AT_SOIL_SAMPLE ?AUTO_3177 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3179 ) ( STORE_OF ?AUTO_3181 ?AUTO_3179 ) ( EMPTY ?AUTO_3181 ) ( CAN_TRAVERSE ?AUTO_3179 ?AUTO_3178 ?AUTO_3177 ) ( VISIBLE ?AUTO_3178 ?AUTO_3177 ) ( not ( = ?AUTO_3177 ?AUTO_3178 ) ) ( not ( = ?AUTO_3182 ?AUTO_3178 ) ) ( CAN_TRAVERSE ?AUTO_3179 ?AUTO_3182 ?AUTO_3178 ) ( AT ?AUTO_3179 ?AUTO_3182 ) ( VISIBLE ?AUTO_3182 ?AUTO_3178 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3179 ?AUTO_3182 ?AUTO_3178 )
      ( GET_SOIL_DATA ?AUTO_3177 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3177 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3282 - OBJECTIVE
      ?AUTO_3283 - MODE
    )
    :vars
    (
      ?AUTO_3287 - LANDER
      ?AUTO_3284 - WAYPOINT
      ?AUTO_3285 - WAYPOINT
      ?AUTO_3286 - ROVER
      ?AUTO_3288 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3287 ?AUTO_3284 ) ( VISIBLE ?AUTO_3285 ?AUTO_3284 ) ( AVAILABLE ?AUTO_3286 ) ( CHANNEL_FREE ?AUTO_3287 ) ( not ( = ?AUTO_3285 ?AUTO_3284 ) ) ( CALIBRATED ?AUTO_3288 ?AUTO_3286 ) ( ON_BOARD ?AUTO_3288 ?AUTO_3286 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3286 ) ( SUPPORTS ?AUTO_3288 ?AUTO_3283 ) ( VISIBLE_FROM ?AUTO_3282 ?AUTO_3285 ) ( CAN_TRAVERSE ?AUTO_3286 ?AUTO_3284 ?AUTO_3285 ) ( AT ?AUTO_3286 ?AUTO_3284 ) ( VISIBLE ?AUTO_3284 ?AUTO_3285 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3286 ?AUTO_3284 ?AUTO_3285 )
      ( GET_IMAGE_DATA ?AUTO_3282 ?AUTO_3283 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3282 ?AUTO_3283 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3289 - OBJECTIVE
      ?AUTO_3290 - MODE
    )
    :vars
    (
      ?AUTO_3293 - LANDER
      ?AUTO_3292 - WAYPOINT
      ?AUTO_3291 - WAYPOINT
      ?AUTO_3294 - ROVER
      ?AUTO_3295 - CAMERA
      ?AUTO_3296 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3293 ?AUTO_3292 ) ( VISIBLE ?AUTO_3291 ?AUTO_3292 ) ( AVAILABLE ?AUTO_3294 ) ( CHANNEL_FREE ?AUTO_3293 ) ( not ( = ?AUTO_3291 ?AUTO_3292 ) ) ( ON_BOARD ?AUTO_3295 ?AUTO_3294 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3294 ) ( SUPPORTS ?AUTO_3295 ?AUTO_3290 ) ( VISIBLE_FROM ?AUTO_3289 ?AUTO_3291 ) ( CAN_TRAVERSE ?AUTO_3294 ?AUTO_3292 ?AUTO_3291 ) ( AT ?AUTO_3294 ?AUTO_3292 ) ( VISIBLE ?AUTO_3292 ?AUTO_3291 ) ( CALIBRATION_TARGET ?AUTO_3295 ?AUTO_3296 ) ( VISIBLE_FROM ?AUTO_3296 ?AUTO_3292 ) ( not ( = ?AUTO_3289 ?AUTO_3296 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3294 ?AUTO_3295 ?AUTO_3296 ?AUTO_3292 )
      ( GET_IMAGE_DATA ?AUTO_3289 ?AUTO_3290 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3289 ?AUTO_3290 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3305 - OBJECTIVE
      ?AUTO_3306 - MODE
    )
    :vars
    (
      ?AUTO_3309 - LANDER
      ?AUTO_3310 - WAYPOINT
      ?AUTO_3311 - WAYPOINT
      ?AUTO_3308 - ROVER
      ?AUTO_3307 - CAMERA
      ?AUTO_3312 - OBJECTIVE
      ?AUTO_3313 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3309 ?AUTO_3310 ) ( VISIBLE ?AUTO_3311 ?AUTO_3310 ) ( AVAILABLE ?AUTO_3308 ) ( CHANNEL_FREE ?AUTO_3309 ) ( not ( = ?AUTO_3311 ?AUTO_3310 ) ) ( ON_BOARD ?AUTO_3307 ?AUTO_3308 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3308 ) ( SUPPORTS ?AUTO_3307 ?AUTO_3306 ) ( VISIBLE_FROM ?AUTO_3305 ?AUTO_3311 ) ( CAN_TRAVERSE ?AUTO_3308 ?AUTO_3310 ?AUTO_3311 ) ( VISIBLE ?AUTO_3310 ?AUTO_3311 ) ( CALIBRATION_TARGET ?AUTO_3307 ?AUTO_3312 ) ( VISIBLE_FROM ?AUTO_3312 ?AUTO_3310 ) ( not ( = ?AUTO_3305 ?AUTO_3312 ) ) ( CAN_TRAVERSE ?AUTO_3308 ?AUTO_3313 ?AUTO_3310 ) ( AT ?AUTO_3308 ?AUTO_3313 ) ( VISIBLE ?AUTO_3313 ?AUTO_3310 ) ( not ( = ?AUTO_3310 ?AUTO_3313 ) ) ( not ( = ?AUTO_3311 ?AUTO_3313 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3308 ?AUTO_3313 ?AUTO_3310 )
      ( GET_IMAGE_DATA ?AUTO_3305 ?AUTO_3306 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3305 ?AUTO_3306 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3370 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3372 - LANDER
      ?AUTO_3374 - WAYPOINT
      ?AUTO_3371 - ROVER
      ?AUTO_3375 - STORE
      ?AUTO_3373 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3372 ?AUTO_3370 ) ( VISIBLE ?AUTO_3374 ?AUTO_3370 ) ( AVAILABLE ?AUTO_3371 ) ( CHANNEL_FREE ?AUTO_3372 ) ( not ( = ?AUTO_3370 ?AUTO_3374 ) ) ( CAN_TRAVERSE ?AUTO_3371 ?AUTO_3370 ?AUTO_3374 ) ( VISIBLE ?AUTO_3370 ?AUTO_3374 ) ( AT_ROCK_SAMPLE ?AUTO_3370 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3371 ) ( STORE_OF ?AUTO_3375 ?AUTO_3371 ) ( CAN_TRAVERSE ?AUTO_3371 ?AUTO_3373 ?AUTO_3370 ) ( AT ?AUTO_3371 ?AUTO_3373 ) ( VISIBLE ?AUTO_3373 ?AUTO_3370 ) ( not ( = ?AUTO_3370 ?AUTO_3373 ) ) ( not ( = ?AUTO_3374 ?AUTO_3373 ) ) ( FULL ?AUTO_3375 ) )
    :subtasks
    ( ( !DROP ?AUTO_3371 ?AUTO_3375 )
      ( GET_ROCK_DATA ?AUTO_3370 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3370 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3463 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3466 - LANDER
      ?AUTO_3467 - WAYPOINT
      ?AUTO_3465 - ROVER
      ?AUTO_3464 - STORE
      ?AUTO_3468 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3466 ?AUTO_3463 ) ( VISIBLE ?AUTO_3467 ?AUTO_3463 ) ( AVAILABLE ?AUTO_3465 ) ( CHANNEL_FREE ?AUTO_3466 ) ( not ( = ?AUTO_3463 ?AUTO_3467 ) ) ( CAN_TRAVERSE ?AUTO_3465 ?AUTO_3463 ?AUTO_3467 ) ( VISIBLE ?AUTO_3463 ?AUTO_3467 ) ( AT_ROCK_SAMPLE ?AUTO_3463 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3465 ) ( STORE_OF ?AUTO_3464 ?AUTO_3465 ) ( EMPTY ?AUTO_3464 ) ( CAN_TRAVERSE ?AUTO_3465 ?AUTO_3467 ?AUTO_3463 ) ( CAN_TRAVERSE ?AUTO_3465 ?AUTO_3468 ?AUTO_3467 ) ( AT ?AUTO_3465 ?AUTO_3468 ) ( VISIBLE ?AUTO_3468 ?AUTO_3467 ) ( not ( = ?AUTO_3463 ?AUTO_3468 ) ) ( not ( = ?AUTO_3467 ?AUTO_3468 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3465 ?AUTO_3468 ?AUTO_3467 )
      ( GET_ROCK_DATA ?AUTO_3463 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3463 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3491 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3494 - LANDER
      ?AUTO_3492 - WAYPOINT
      ?AUTO_3495 - WAYPOINT
      ?AUTO_3493 - ROVER
      ?AUTO_3496 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3494 ?AUTO_3492 ) ( VISIBLE ?AUTO_3495 ?AUTO_3492 ) ( AVAILABLE ?AUTO_3493 ) ( CHANNEL_FREE ?AUTO_3494 ) ( not ( = ?AUTO_3491 ?AUTO_3495 ) ) ( not ( = ?AUTO_3491 ?AUTO_3492 ) ) ( not ( = ?AUTO_3495 ?AUTO_3492 ) ) ( CAN_TRAVERSE ?AUTO_3493 ?AUTO_3491 ?AUTO_3495 ) ( VISIBLE ?AUTO_3491 ?AUTO_3495 ) ( AT_SOIL_SAMPLE ?AUTO_3491 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3493 ) ( STORE_OF ?AUTO_3496 ?AUTO_3493 ) ( EMPTY ?AUTO_3496 ) ( CAN_TRAVERSE ?AUTO_3493 ?AUTO_3495 ?AUTO_3491 ) ( AT ?AUTO_3493 ?AUTO_3495 ) ( VISIBLE ?AUTO_3495 ?AUTO_3491 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3493 ?AUTO_3495 ?AUTO_3491 )
      ( GET_SOIL_DATA ?AUTO_3491 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3491 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3498 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3499 - LANDER
      ?AUTO_3502 - WAYPOINT
      ?AUTO_3500 - WAYPOINT
      ?AUTO_3501 - ROVER
      ?AUTO_3503 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3499 ?AUTO_3502 ) ( VISIBLE ?AUTO_3500 ?AUTO_3502 ) ( AVAILABLE ?AUTO_3501 ) ( CHANNEL_FREE ?AUTO_3499 ) ( not ( = ?AUTO_3498 ?AUTO_3500 ) ) ( not ( = ?AUTO_3498 ?AUTO_3502 ) ) ( not ( = ?AUTO_3500 ?AUTO_3502 ) ) ( CAN_TRAVERSE ?AUTO_3501 ?AUTO_3498 ?AUTO_3500 ) ( VISIBLE ?AUTO_3498 ?AUTO_3500 ) ( AT_SOIL_SAMPLE ?AUTO_3498 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3501 ) ( STORE_OF ?AUTO_3503 ?AUTO_3501 ) ( EMPTY ?AUTO_3503 ) ( CAN_TRAVERSE ?AUTO_3501 ?AUTO_3500 ?AUTO_3498 ) ( VISIBLE ?AUTO_3500 ?AUTO_3498 ) ( CAN_TRAVERSE ?AUTO_3501 ?AUTO_3502 ?AUTO_3500 ) ( AT ?AUTO_3501 ?AUTO_3502 ) ( VISIBLE ?AUTO_3502 ?AUTO_3500 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3501 ?AUTO_3502 ?AUTO_3500 )
      ( GET_SOIL_DATA ?AUTO_3498 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3498 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3504 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3506 - LANDER
      ?AUTO_3508 - WAYPOINT
      ?AUTO_3505 - WAYPOINT
      ?AUTO_3509 - ROVER
      ?AUTO_3507 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3506 ?AUTO_3508 ) ( VISIBLE ?AUTO_3505 ?AUTO_3508 ) ( AVAILABLE ?AUTO_3509 ) ( CHANNEL_FREE ?AUTO_3506 ) ( not ( = ?AUTO_3504 ?AUTO_3505 ) ) ( not ( = ?AUTO_3504 ?AUTO_3508 ) ) ( not ( = ?AUTO_3505 ?AUTO_3508 ) ) ( CAN_TRAVERSE ?AUTO_3509 ?AUTO_3504 ?AUTO_3505 ) ( VISIBLE ?AUTO_3504 ?AUTO_3505 ) ( AT_SOIL_SAMPLE ?AUTO_3504 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3509 ) ( STORE_OF ?AUTO_3507 ?AUTO_3509 ) ( CAN_TRAVERSE ?AUTO_3509 ?AUTO_3505 ?AUTO_3504 ) ( VISIBLE ?AUTO_3505 ?AUTO_3504 ) ( CAN_TRAVERSE ?AUTO_3509 ?AUTO_3508 ?AUTO_3505 ) ( AT ?AUTO_3509 ?AUTO_3508 ) ( VISIBLE ?AUTO_3508 ?AUTO_3505 ) ( FULL ?AUTO_3507 ) )
    :subtasks
    ( ( !DROP ?AUTO_3509 ?AUTO_3507 )
      ( GET_SOIL_DATA ?AUTO_3504 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3504 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3512 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3515 - LANDER
      ?AUTO_3517 - WAYPOINT
      ?AUTO_3513 - WAYPOINT
      ?AUTO_3516 - ROVER
      ?AUTO_3514 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3515 ?AUTO_3517 ) ( VISIBLE ?AUTO_3513 ?AUTO_3517 ) ( AVAILABLE ?AUTO_3516 ) ( CHANNEL_FREE ?AUTO_3515 ) ( not ( = ?AUTO_3512 ?AUTO_3513 ) ) ( not ( = ?AUTO_3512 ?AUTO_3517 ) ) ( not ( = ?AUTO_3513 ?AUTO_3517 ) ) ( CAN_TRAVERSE ?AUTO_3516 ?AUTO_3512 ?AUTO_3513 ) ( VISIBLE ?AUTO_3512 ?AUTO_3513 ) ( AT_SOIL_SAMPLE ?AUTO_3512 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3516 ) ( STORE_OF ?AUTO_3514 ?AUTO_3516 ) ( CAN_TRAVERSE ?AUTO_3516 ?AUTO_3513 ?AUTO_3512 ) ( AT ?AUTO_3516 ?AUTO_3513 ) ( VISIBLE ?AUTO_3513 ?AUTO_3512 ) ( FULL ?AUTO_3514 ) )
    :subtasks
    ( ( !DROP ?AUTO_3516 ?AUTO_3514 )
      ( GET_SOIL_DATA ?AUTO_3512 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3512 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3563 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3565 - LANDER
      ?AUTO_3564 - WAYPOINT
      ?AUTO_3567 - WAYPOINT
      ?AUTO_3566 - ROVER
      ?AUTO_3568 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3565 ?AUTO_3564 ) ( VISIBLE ?AUTO_3567 ?AUTO_3564 ) ( AVAILABLE ?AUTO_3566 ) ( CHANNEL_FREE ?AUTO_3565 ) ( not ( = ?AUTO_3563 ?AUTO_3567 ) ) ( not ( = ?AUTO_3563 ?AUTO_3564 ) ) ( not ( = ?AUTO_3567 ?AUTO_3564 ) ) ( CAN_TRAVERSE ?AUTO_3566 ?AUTO_3563 ?AUTO_3567 ) ( VISIBLE ?AUTO_3563 ?AUTO_3567 ) ( AT_ROCK_SAMPLE ?AUTO_3563 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3566 ) ( STORE_OF ?AUTO_3568 ?AUTO_3566 ) ( CAN_TRAVERSE ?AUTO_3566 ?AUTO_3567 ?AUTO_3563 ) ( VISIBLE ?AUTO_3567 ?AUTO_3563 ) ( CAN_TRAVERSE ?AUTO_3566 ?AUTO_3564 ?AUTO_3567 ) ( AT ?AUTO_3566 ?AUTO_3564 ) ( VISIBLE ?AUTO_3564 ?AUTO_3567 ) ( FULL ?AUTO_3568 ) )
    :subtasks
    ( ( !DROP ?AUTO_3566 ?AUTO_3568 )
      ( GET_ROCK_DATA ?AUTO_3563 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3563 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3714 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3717 - LANDER
      ?AUTO_3721 - WAYPOINT
      ?AUTO_3720 - WAYPOINT
      ?AUTO_3716 - ROVER
      ?AUTO_3718 - STORE
      ?AUTO_3715 - WAYPOINT
      ?AUTO_3719 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3717 ?AUTO_3721 ) ( VISIBLE ?AUTO_3720 ?AUTO_3721 ) ( AVAILABLE ?AUTO_3716 ) ( CHANNEL_FREE ?AUTO_3717 ) ( not ( = ?AUTO_3714 ?AUTO_3720 ) ) ( not ( = ?AUTO_3714 ?AUTO_3721 ) ) ( not ( = ?AUTO_3720 ?AUTO_3721 ) ) ( CAN_TRAVERSE ?AUTO_3716 ?AUTO_3714 ?AUTO_3720 ) ( VISIBLE ?AUTO_3714 ?AUTO_3720 ) ( AT_SOIL_SAMPLE ?AUTO_3714 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3716 ) ( STORE_OF ?AUTO_3718 ?AUTO_3716 ) ( EMPTY ?AUTO_3718 ) ( CAN_TRAVERSE ?AUTO_3716 ?AUTO_3715 ?AUTO_3714 ) ( VISIBLE ?AUTO_3715 ?AUTO_3714 ) ( not ( = ?AUTO_3714 ?AUTO_3715 ) ) ( not ( = ?AUTO_3721 ?AUTO_3715 ) ) ( not ( = ?AUTO_3720 ?AUTO_3715 ) ) ( CAN_TRAVERSE ?AUTO_3716 ?AUTO_3719 ?AUTO_3715 ) ( VISIBLE ?AUTO_3719 ?AUTO_3715 ) ( not ( = ?AUTO_3714 ?AUTO_3719 ) ) ( not ( = ?AUTO_3721 ?AUTO_3719 ) ) ( not ( = ?AUTO_3720 ?AUTO_3719 ) ) ( not ( = ?AUTO_3715 ?AUTO_3719 ) ) ( CAN_TRAVERSE ?AUTO_3716 ?AUTO_3721 ?AUTO_3719 ) ( AT ?AUTO_3716 ?AUTO_3721 ) ( VISIBLE ?AUTO_3721 ?AUTO_3719 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3716 ?AUTO_3721 ?AUTO_3719 )
      ( GET_SOIL_DATA ?AUTO_3714 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3714 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3722 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3728 - LANDER
      ?AUTO_3725 - WAYPOINT
      ?AUTO_3729 - WAYPOINT
      ?AUTO_3726 - ROVER
      ?AUTO_3723 - STORE
      ?AUTO_3727 - WAYPOINT
      ?AUTO_3724 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3728 ?AUTO_3725 ) ( VISIBLE ?AUTO_3729 ?AUTO_3725 ) ( AVAILABLE ?AUTO_3726 ) ( CHANNEL_FREE ?AUTO_3728 ) ( not ( = ?AUTO_3722 ?AUTO_3729 ) ) ( not ( = ?AUTO_3722 ?AUTO_3725 ) ) ( not ( = ?AUTO_3729 ?AUTO_3725 ) ) ( CAN_TRAVERSE ?AUTO_3726 ?AUTO_3722 ?AUTO_3729 ) ( VISIBLE ?AUTO_3722 ?AUTO_3729 ) ( AT_SOIL_SAMPLE ?AUTO_3722 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3726 ) ( STORE_OF ?AUTO_3723 ?AUTO_3726 ) ( CAN_TRAVERSE ?AUTO_3726 ?AUTO_3727 ?AUTO_3722 ) ( VISIBLE ?AUTO_3727 ?AUTO_3722 ) ( not ( = ?AUTO_3722 ?AUTO_3727 ) ) ( not ( = ?AUTO_3725 ?AUTO_3727 ) ) ( not ( = ?AUTO_3729 ?AUTO_3727 ) ) ( CAN_TRAVERSE ?AUTO_3726 ?AUTO_3724 ?AUTO_3727 ) ( VISIBLE ?AUTO_3724 ?AUTO_3727 ) ( not ( = ?AUTO_3722 ?AUTO_3724 ) ) ( not ( = ?AUTO_3725 ?AUTO_3724 ) ) ( not ( = ?AUTO_3729 ?AUTO_3724 ) ) ( not ( = ?AUTO_3727 ?AUTO_3724 ) ) ( CAN_TRAVERSE ?AUTO_3726 ?AUTO_3725 ?AUTO_3724 ) ( AT ?AUTO_3726 ?AUTO_3725 ) ( VISIBLE ?AUTO_3725 ?AUTO_3724 ) ( FULL ?AUTO_3723 ) )
    :subtasks
    ( ( !DROP ?AUTO_3726 ?AUTO_3723 )
      ( GET_SOIL_DATA ?AUTO_3722 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3722 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3751 - OBJECTIVE
      ?AUTO_3752 - MODE
    )
    :vars
    (
      ?AUTO_3756 - LANDER
      ?AUTO_3754 - WAYPOINT
      ?AUTO_3757 - WAYPOINT
      ?AUTO_3753 - ROVER
      ?AUTO_3755 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3756 ?AUTO_3754 ) ( VISIBLE ?AUTO_3757 ?AUTO_3754 ) ( AVAILABLE ?AUTO_3753 ) ( CHANNEL_FREE ?AUTO_3756 ) ( not ( = ?AUTO_3757 ?AUTO_3754 ) ) ( CAN_TRAVERSE ?AUTO_3753 ?AUTO_3754 ?AUTO_3757 ) ( VISIBLE ?AUTO_3754 ?AUTO_3757 ) ( CALIBRATED ?AUTO_3755 ?AUTO_3753 ) ( ON_BOARD ?AUTO_3755 ?AUTO_3753 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3753 ) ( SUPPORTS ?AUTO_3755 ?AUTO_3752 ) ( VISIBLE_FROM ?AUTO_3751 ?AUTO_3754 ) ( CAN_TRAVERSE ?AUTO_3753 ?AUTO_3757 ?AUTO_3754 ) ( AT ?AUTO_3753 ?AUTO_3757 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3753 ?AUTO_3757 ?AUTO_3754 )
      ( GET_IMAGE_DATA ?AUTO_3751 ?AUTO_3752 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3751 ?AUTO_3752 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3758 - OBJECTIVE
      ?AUTO_3759 - MODE
    )
    :vars
    (
      ?AUTO_3761 - LANDER
      ?AUTO_3760 - WAYPOINT
      ?AUTO_3764 - WAYPOINT
      ?AUTO_3763 - ROVER
      ?AUTO_3762 - CAMERA
      ?AUTO_3765 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3761 ?AUTO_3760 ) ( VISIBLE ?AUTO_3764 ?AUTO_3760 ) ( AVAILABLE ?AUTO_3763 ) ( CHANNEL_FREE ?AUTO_3761 ) ( not ( = ?AUTO_3764 ?AUTO_3760 ) ) ( CAN_TRAVERSE ?AUTO_3763 ?AUTO_3760 ?AUTO_3764 ) ( VISIBLE ?AUTO_3760 ?AUTO_3764 ) ( ON_BOARD ?AUTO_3762 ?AUTO_3763 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3763 ) ( SUPPORTS ?AUTO_3762 ?AUTO_3759 ) ( VISIBLE_FROM ?AUTO_3758 ?AUTO_3760 ) ( CAN_TRAVERSE ?AUTO_3763 ?AUTO_3764 ?AUTO_3760 ) ( AT ?AUTO_3763 ?AUTO_3764 ) ( CALIBRATION_TARGET ?AUTO_3762 ?AUTO_3765 ) ( VISIBLE_FROM ?AUTO_3765 ?AUTO_3764 ) ( not ( = ?AUTO_3758 ?AUTO_3765 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3763 ?AUTO_3762 ?AUTO_3765 ?AUTO_3764 )
      ( GET_IMAGE_DATA ?AUTO_3758 ?AUTO_3759 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3758 ?AUTO_3759 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3766 - OBJECTIVE
      ?AUTO_3767 - MODE
    )
    :vars
    (
      ?AUTO_3768 - LANDER
      ?AUTO_3771 - WAYPOINT
      ?AUTO_3770 - WAYPOINT
      ?AUTO_3769 - ROVER
      ?AUTO_3772 - CAMERA
      ?AUTO_3773 - OBJECTIVE
      ?AUTO_3774 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3768 ?AUTO_3771 ) ( VISIBLE ?AUTO_3770 ?AUTO_3771 ) ( AVAILABLE ?AUTO_3769 ) ( CHANNEL_FREE ?AUTO_3768 ) ( not ( = ?AUTO_3770 ?AUTO_3771 ) ) ( CAN_TRAVERSE ?AUTO_3769 ?AUTO_3771 ?AUTO_3770 ) ( VISIBLE ?AUTO_3771 ?AUTO_3770 ) ( ON_BOARD ?AUTO_3772 ?AUTO_3769 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3769 ) ( SUPPORTS ?AUTO_3772 ?AUTO_3767 ) ( VISIBLE_FROM ?AUTO_3766 ?AUTO_3771 ) ( CAN_TRAVERSE ?AUTO_3769 ?AUTO_3770 ?AUTO_3771 ) ( CALIBRATION_TARGET ?AUTO_3772 ?AUTO_3773 ) ( VISIBLE_FROM ?AUTO_3773 ?AUTO_3770 ) ( not ( = ?AUTO_3766 ?AUTO_3773 ) ) ( CAN_TRAVERSE ?AUTO_3769 ?AUTO_3774 ?AUTO_3770 ) ( AT ?AUTO_3769 ?AUTO_3774 ) ( VISIBLE ?AUTO_3774 ?AUTO_3770 ) ( not ( = ?AUTO_3771 ?AUTO_3774 ) ) ( not ( = ?AUTO_3770 ?AUTO_3774 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3769 ?AUTO_3774 ?AUTO_3770 )
      ( GET_IMAGE_DATA ?AUTO_3766 ?AUTO_3767 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3766 ?AUTO_3767 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3940 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3943 - LANDER
      ?AUTO_3942 - WAYPOINT
      ?AUTO_3941 - ROVER
      ?AUTO_3944 - WAYPOINT
      ?AUTO_3945 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3943 ?AUTO_3942 ) ( HAVE_ROCK_ANALYSIS ?AUTO_3941 ?AUTO_3940 ) ( VISIBLE ?AUTO_3944 ?AUTO_3942 ) ( AVAILABLE ?AUTO_3941 ) ( CHANNEL_FREE ?AUTO_3943 ) ( not ( = ?AUTO_3940 ?AUTO_3944 ) ) ( not ( = ?AUTO_3940 ?AUTO_3942 ) ) ( not ( = ?AUTO_3944 ?AUTO_3942 ) ) ( CAN_TRAVERSE ?AUTO_3941 ?AUTO_3945 ?AUTO_3944 ) ( AT ?AUTO_3941 ?AUTO_3945 ) ( VISIBLE ?AUTO_3945 ?AUTO_3944 ) ( not ( = ?AUTO_3940 ?AUTO_3945 ) ) ( not ( = ?AUTO_3942 ?AUTO_3945 ) ) ( not ( = ?AUTO_3944 ?AUTO_3945 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3941 ?AUTO_3945 ?AUTO_3944 )
      ( GET_ROCK_DATA ?AUTO_3940 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3940 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3946 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3951 - LANDER
      ?AUTO_3949 - WAYPOINT
      ?AUTO_3948 - ROVER
      ?AUTO_3950 - WAYPOINT
      ?AUTO_3947 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3951 ?AUTO_3949 ) ( HAVE_ROCK_ANALYSIS ?AUTO_3948 ?AUTO_3946 ) ( VISIBLE ?AUTO_3950 ?AUTO_3949 ) ( AVAILABLE ?AUTO_3948 ) ( CHANNEL_FREE ?AUTO_3951 ) ( not ( = ?AUTO_3946 ?AUTO_3950 ) ) ( not ( = ?AUTO_3946 ?AUTO_3949 ) ) ( not ( = ?AUTO_3950 ?AUTO_3949 ) ) ( CAN_TRAVERSE ?AUTO_3948 ?AUTO_3947 ?AUTO_3950 ) ( VISIBLE ?AUTO_3947 ?AUTO_3950 ) ( not ( = ?AUTO_3946 ?AUTO_3947 ) ) ( not ( = ?AUTO_3949 ?AUTO_3947 ) ) ( not ( = ?AUTO_3950 ?AUTO_3947 ) ) ( CAN_TRAVERSE ?AUTO_3948 ?AUTO_3946 ?AUTO_3947 ) ( AT ?AUTO_3948 ?AUTO_3946 ) ( VISIBLE ?AUTO_3946 ?AUTO_3947 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3948 ?AUTO_3946 ?AUTO_3947 )
      ( GET_ROCK_DATA ?AUTO_3946 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3946 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3952 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3955 - LANDER
      ?AUTO_3957 - WAYPOINT
      ?AUTO_3956 - WAYPOINT
      ?AUTO_3954 - ROVER
      ?AUTO_3953 - WAYPOINT
      ?AUTO_3958 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3955 ?AUTO_3957 ) ( VISIBLE ?AUTO_3956 ?AUTO_3957 ) ( AVAILABLE ?AUTO_3954 ) ( CHANNEL_FREE ?AUTO_3955 ) ( not ( = ?AUTO_3952 ?AUTO_3956 ) ) ( not ( = ?AUTO_3952 ?AUTO_3957 ) ) ( not ( = ?AUTO_3956 ?AUTO_3957 ) ) ( CAN_TRAVERSE ?AUTO_3954 ?AUTO_3953 ?AUTO_3956 ) ( VISIBLE ?AUTO_3953 ?AUTO_3956 ) ( not ( = ?AUTO_3952 ?AUTO_3953 ) ) ( not ( = ?AUTO_3957 ?AUTO_3953 ) ) ( not ( = ?AUTO_3956 ?AUTO_3953 ) ) ( CAN_TRAVERSE ?AUTO_3954 ?AUTO_3952 ?AUTO_3953 ) ( AT ?AUTO_3954 ?AUTO_3952 ) ( VISIBLE ?AUTO_3952 ?AUTO_3953 ) ( AT_ROCK_SAMPLE ?AUTO_3952 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3954 ) ( STORE_OF ?AUTO_3958 ?AUTO_3954 ) ( EMPTY ?AUTO_3958 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_3954 ?AUTO_3958 ?AUTO_3952 )
      ( GET_ROCK_DATA ?AUTO_3952 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3952 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3959 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3964 - LANDER
      ?AUTO_3962 - WAYPOINT
      ?AUTO_3963 - WAYPOINT
      ?AUTO_3960 - ROVER
      ?AUTO_3961 - WAYPOINT
      ?AUTO_3965 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3964 ?AUTO_3962 ) ( VISIBLE ?AUTO_3963 ?AUTO_3962 ) ( AVAILABLE ?AUTO_3960 ) ( CHANNEL_FREE ?AUTO_3964 ) ( not ( = ?AUTO_3959 ?AUTO_3963 ) ) ( not ( = ?AUTO_3959 ?AUTO_3962 ) ) ( not ( = ?AUTO_3963 ?AUTO_3962 ) ) ( CAN_TRAVERSE ?AUTO_3960 ?AUTO_3961 ?AUTO_3963 ) ( VISIBLE ?AUTO_3961 ?AUTO_3963 ) ( not ( = ?AUTO_3959 ?AUTO_3961 ) ) ( not ( = ?AUTO_3962 ?AUTO_3961 ) ) ( not ( = ?AUTO_3963 ?AUTO_3961 ) ) ( CAN_TRAVERSE ?AUTO_3960 ?AUTO_3959 ?AUTO_3961 ) ( VISIBLE ?AUTO_3959 ?AUTO_3961 ) ( AT_ROCK_SAMPLE ?AUTO_3959 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3960 ) ( STORE_OF ?AUTO_3965 ?AUTO_3960 ) ( EMPTY ?AUTO_3965 ) ( CAN_TRAVERSE ?AUTO_3960 ?AUTO_3961 ?AUTO_3959 ) ( AT ?AUTO_3960 ?AUTO_3961 ) ( VISIBLE ?AUTO_3961 ?AUTO_3959 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3960 ?AUTO_3961 ?AUTO_3959 )
      ( GET_ROCK_DATA ?AUTO_3959 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3959 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3966 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3972 - LANDER
      ?AUTO_3970 - WAYPOINT
      ?AUTO_3971 - WAYPOINT
      ?AUTO_3968 - ROVER
      ?AUTO_3969 - WAYPOINT
      ?AUTO_3967 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3972 ?AUTO_3970 ) ( VISIBLE ?AUTO_3971 ?AUTO_3970 ) ( AVAILABLE ?AUTO_3968 ) ( CHANNEL_FREE ?AUTO_3972 ) ( not ( = ?AUTO_3966 ?AUTO_3971 ) ) ( not ( = ?AUTO_3966 ?AUTO_3970 ) ) ( not ( = ?AUTO_3971 ?AUTO_3970 ) ) ( CAN_TRAVERSE ?AUTO_3968 ?AUTO_3969 ?AUTO_3971 ) ( VISIBLE ?AUTO_3969 ?AUTO_3971 ) ( not ( = ?AUTO_3966 ?AUTO_3969 ) ) ( not ( = ?AUTO_3970 ?AUTO_3969 ) ) ( not ( = ?AUTO_3971 ?AUTO_3969 ) ) ( CAN_TRAVERSE ?AUTO_3968 ?AUTO_3966 ?AUTO_3969 ) ( VISIBLE ?AUTO_3966 ?AUTO_3969 ) ( AT_ROCK_SAMPLE ?AUTO_3966 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3968 ) ( STORE_OF ?AUTO_3967 ?AUTO_3968 ) ( EMPTY ?AUTO_3967 ) ( CAN_TRAVERSE ?AUTO_3968 ?AUTO_3969 ?AUTO_3966 ) ( VISIBLE ?AUTO_3969 ?AUTO_3966 ) ( CAN_TRAVERSE ?AUTO_3968 ?AUTO_3971 ?AUTO_3969 ) ( AT ?AUTO_3968 ?AUTO_3971 ) ( VISIBLE ?AUTO_3971 ?AUTO_3969 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3968 ?AUTO_3971 ?AUTO_3969 )
      ( GET_ROCK_DATA ?AUTO_3966 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3966 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3973 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3974 - LANDER
      ?AUTO_3978 - WAYPOINT
      ?AUTO_3975 - WAYPOINT
      ?AUTO_3976 - ROVER
      ?AUTO_3979 - WAYPOINT
      ?AUTO_3977 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3974 ?AUTO_3978 ) ( VISIBLE ?AUTO_3975 ?AUTO_3978 ) ( AVAILABLE ?AUTO_3976 ) ( CHANNEL_FREE ?AUTO_3974 ) ( not ( = ?AUTO_3973 ?AUTO_3975 ) ) ( not ( = ?AUTO_3973 ?AUTO_3978 ) ) ( not ( = ?AUTO_3975 ?AUTO_3978 ) ) ( CAN_TRAVERSE ?AUTO_3976 ?AUTO_3979 ?AUTO_3975 ) ( VISIBLE ?AUTO_3979 ?AUTO_3975 ) ( not ( = ?AUTO_3973 ?AUTO_3979 ) ) ( not ( = ?AUTO_3978 ?AUTO_3979 ) ) ( not ( = ?AUTO_3975 ?AUTO_3979 ) ) ( CAN_TRAVERSE ?AUTO_3976 ?AUTO_3973 ?AUTO_3979 ) ( VISIBLE ?AUTO_3973 ?AUTO_3979 ) ( AT_ROCK_SAMPLE ?AUTO_3973 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3976 ) ( STORE_OF ?AUTO_3977 ?AUTO_3976 ) ( CAN_TRAVERSE ?AUTO_3976 ?AUTO_3979 ?AUTO_3973 ) ( VISIBLE ?AUTO_3979 ?AUTO_3973 ) ( CAN_TRAVERSE ?AUTO_3976 ?AUTO_3975 ?AUTO_3979 ) ( AT ?AUTO_3976 ?AUTO_3975 ) ( VISIBLE ?AUTO_3975 ?AUTO_3979 ) ( FULL ?AUTO_3977 ) )
    :subtasks
    ( ( !DROP ?AUTO_3976 ?AUTO_3977 )
      ( GET_ROCK_DATA ?AUTO_3973 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3973 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3994 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3995 - LANDER
      ?AUTO_3997 - WAYPOINT
      ?AUTO_3999 - WAYPOINT
      ?AUTO_3998 - ROVER
      ?AUTO_4000 - WAYPOINT
      ?AUTO_3996 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3995 ?AUTO_3997 ) ( VISIBLE ?AUTO_3999 ?AUTO_3997 ) ( AVAILABLE ?AUTO_3998 ) ( CHANNEL_FREE ?AUTO_3995 ) ( not ( = ?AUTO_3994 ?AUTO_3999 ) ) ( not ( = ?AUTO_3994 ?AUTO_3997 ) ) ( not ( = ?AUTO_3999 ?AUTO_3997 ) ) ( CAN_TRAVERSE ?AUTO_3998 ?AUTO_4000 ?AUTO_3999 ) ( VISIBLE ?AUTO_4000 ?AUTO_3999 ) ( not ( = ?AUTO_3994 ?AUTO_4000 ) ) ( not ( = ?AUTO_3997 ?AUTO_4000 ) ) ( not ( = ?AUTO_3999 ?AUTO_4000 ) ) ( CAN_TRAVERSE ?AUTO_3998 ?AUTO_3994 ?AUTO_4000 ) ( VISIBLE ?AUTO_3994 ?AUTO_4000 ) ( AT_ROCK_SAMPLE ?AUTO_3994 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3998 ) ( STORE_OF ?AUTO_3996 ?AUTO_3998 ) ( EMPTY ?AUTO_3996 ) ( CAN_TRAVERSE ?AUTO_3998 ?AUTO_4000 ?AUTO_3994 ) ( VISIBLE ?AUTO_4000 ?AUTO_3994 ) ( CAN_TRAVERSE ?AUTO_3998 ?AUTO_3999 ?AUTO_4000 ) ( VISIBLE ?AUTO_3999 ?AUTO_4000 ) ( CAN_TRAVERSE ?AUTO_3998 ?AUTO_3997 ?AUTO_3999 ) ( AT ?AUTO_3998 ?AUTO_3997 ) ( VISIBLE ?AUTO_3997 ?AUTO_3999 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3998 ?AUTO_3997 ?AUTO_3999 )
      ( GET_ROCK_DATA ?AUTO_3994 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3994 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4080 - OBJECTIVE
      ?AUTO_4081 - MODE
    )
    :vars
    (
      ?AUTO_4082 - LANDER
      ?AUTO_4084 - WAYPOINT
      ?AUTO_4086 - WAYPOINT
      ?AUTO_4085 - ROVER
      ?AUTO_4083 - CAMERA
      ?AUTO_4087 - WAYPOINT
      ?AUTO_4088 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4082 ?AUTO_4084 ) ( VISIBLE ?AUTO_4086 ?AUTO_4084 ) ( AVAILABLE ?AUTO_4085 ) ( CHANNEL_FREE ?AUTO_4082 ) ( not ( = ?AUTO_4086 ?AUTO_4084 ) ) ( CALIBRATED ?AUTO_4083 ?AUTO_4085 ) ( ON_BOARD ?AUTO_4083 ?AUTO_4085 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4085 ) ( SUPPORTS ?AUTO_4083 ?AUTO_4081 ) ( VISIBLE_FROM ?AUTO_4080 ?AUTO_4086 ) ( CAN_TRAVERSE ?AUTO_4085 ?AUTO_4087 ?AUTO_4086 ) ( VISIBLE ?AUTO_4087 ?AUTO_4086 ) ( not ( = ?AUTO_4084 ?AUTO_4087 ) ) ( not ( = ?AUTO_4086 ?AUTO_4087 ) ) ( CAN_TRAVERSE ?AUTO_4085 ?AUTO_4088 ?AUTO_4087 ) ( VISIBLE ?AUTO_4088 ?AUTO_4087 ) ( not ( = ?AUTO_4084 ?AUTO_4088 ) ) ( not ( = ?AUTO_4086 ?AUTO_4088 ) ) ( not ( = ?AUTO_4087 ?AUTO_4088 ) ) ( CAN_TRAVERSE ?AUTO_4085 ?AUTO_4084 ?AUTO_4088 ) ( AT ?AUTO_4085 ?AUTO_4084 ) ( VISIBLE ?AUTO_4084 ?AUTO_4088 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4085 ?AUTO_4084 ?AUTO_4088 )
      ( GET_IMAGE_DATA ?AUTO_4080 ?AUTO_4081 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4080 ?AUTO_4081 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4089 - OBJECTIVE
      ?AUTO_4090 - MODE
    )
    :vars
    (
      ?AUTO_4096 - LANDER
      ?AUTO_4095 - WAYPOINT
      ?AUTO_4094 - WAYPOINT
      ?AUTO_4097 - ROVER
      ?AUTO_4091 - CAMERA
      ?AUTO_4093 - WAYPOINT
      ?AUTO_4092 - WAYPOINT
      ?AUTO_4098 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4096 ?AUTO_4095 ) ( VISIBLE ?AUTO_4094 ?AUTO_4095 ) ( AVAILABLE ?AUTO_4097 ) ( CHANNEL_FREE ?AUTO_4096 ) ( not ( = ?AUTO_4094 ?AUTO_4095 ) ) ( ON_BOARD ?AUTO_4091 ?AUTO_4097 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4097 ) ( SUPPORTS ?AUTO_4091 ?AUTO_4090 ) ( VISIBLE_FROM ?AUTO_4089 ?AUTO_4094 ) ( CAN_TRAVERSE ?AUTO_4097 ?AUTO_4093 ?AUTO_4094 ) ( VISIBLE ?AUTO_4093 ?AUTO_4094 ) ( not ( = ?AUTO_4095 ?AUTO_4093 ) ) ( not ( = ?AUTO_4094 ?AUTO_4093 ) ) ( CAN_TRAVERSE ?AUTO_4097 ?AUTO_4092 ?AUTO_4093 ) ( VISIBLE ?AUTO_4092 ?AUTO_4093 ) ( not ( = ?AUTO_4095 ?AUTO_4092 ) ) ( not ( = ?AUTO_4094 ?AUTO_4092 ) ) ( not ( = ?AUTO_4093 ?AUTO_4092 ) ) ( CAN_TRAVERSE ?AUTO_4097 ?AUTO_4095 ?AUTO_4092 ) ( AT ?AUTO_4097 ?AUTO_4095 ) ( VISIBLE ?AUTO_4095 ?AUTO_4092 ) ( CALIBRATION_TARGET ?AUTO_4091 ?AUTO_4098 ) ( VISIBLE_FROM ?AUTO_4098 ?AUTO_4095 ) ( not ( = ?AUTO_4089 ?AUTO_4098 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4097 ?AUTO_4091 ?AUTO_4098 ?AUTO_4095 )
      ( GET_IMAGE_DATA ?AUTO_4089 ?AUTO_4090 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4089 ?AUTO_4090 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4099 - OBJECTIVE
      ?AUTO_4100 - MODE
    )
    :vars
    (
      ?AUTO_4101 - LANDER
      ?AUTO_4108 - WAYPOINT
      ?AUTO_4102 - WAYPOINT
      ?AUTO_4104 - ROVER
      ?AUTO_4103 - CAMERA
      ?AUTO_4105 - WAYPOINT
      ?AUTO_4106 - WAYPOINT
      ?AUTO_4107 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4101 ?AUTO_4108 ) ( VISIBLE ?AUTO_4102 ?AUTO_4108 ) ( AVAILABLE ?AUTO_4104 ) ( CHANNEL_FREE ?AUTO_4101 ) ( not ( = ?AUTO_4102 ?AUTO_4108 ) ) ( ON_BOARD ?AUTO_4103 ?AUTO_4104 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4104 ) ( SUPPORTS ?AUTO_4103 ?AUTO_4100 ) ( VISIBLE_FROM ?AUTO_4099 ?AUTO_4102 ) ( CAN_TRAVERSE ?AUTO_4104 ?AUTO_4105 ?AUTO_4102 ) ( VISIBLE ?AUTO_4105 ?AUTO_4102 ) ( not ( = ?AUTO_4108 ?AUTO_4105 ) ) ( not ( = ?AUTO_4102 ?AUTO_4105 ) ) ( CAN_TRAVERSE ?AUTO_4104 ?AUTO_4106 ?AUTO_4105 ) ( VISIBLE ?AUTO_4106 ?AUTO_4105 ) ( not ( = ?AUTO_4108 ?AUTO_4106 ) ) ( not ( = ?AUTO_4102 ?AUTO_4106 ) ) ( not ( = ?AUTO_4105 ?AUTO_4106 ) ) ( CAN_TRAVERSE ?AUTO_4104 ?AUTO_4108 ?AUTO_4106 ) ( VISIBLE ?AUTO_4108 ?AUTO_4106 ) ( CALIBRATION_TARGET ?AUTO_4103 ?AUTO_4107 ) ( VISIBLE_FROM ?AUTO_4107 ?AUTO_4108 ) ( not ( = ?AUTO_4099 ?AUTO_4107 ) ) ( CAN_TRAVERSE ?AUTO_4104 ?AUTO_4102 ?AUTO_4108 ) ( AT ?AUTO_4104 ?AUTO_4102 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4104 ?AUTO_4102 ?AUTO_4108 )
      ( GET_IMAGE_DATA ?AUTO_4099 ?AUTO_4100 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4099 ?AUTO_4100 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4170 - OBJECTIVE
      ?AUTO_4171 - MODE
    )
    :vars
    (
      ?AUTO_4173 - LANDER
      ?AUTO_4176 - WAYPOINT
      ?AUTO_4177 - WAYPOINT
      ?AUTO_4175 - ROVER
      ?AUTO_4174 - CAMERA
      ?AUTO_4172 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4173 ?AUTO_4176 ) ( VISIBLE ?AUTO_4177 ?AUTO_4176 ) ( AVAILABLE ?AUTO_4175 ) ( CHANNEL_FREE ?AUTO_4173 ) ( not ( = ?AUTO_4177 ?AUTO_4176 ) ) ( CALIBRATED ?AUTO_4174 ?AUTO_4175 ) ( ON_BOARD ?AUTO_4174 ?AUTO_4175 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4175 ) ( SUPPORTS ?AUTO_4174 ?AUTO_4171 ) ( VISIBLE_FROM ?AUTO_4170 ?AUTO_4177 ) ( CAN_TRAVERSE ?AUTO_4175 ?AUTO_4172 ?AUTO_4177 ) ( VISIBLE ?AUTO_4172 ?AUTO_4177 ) ( not ( = ?AUTO_4176 ?AUTO_4172 ) ) ( not ( = ?AUTO_4177 ?AUTO_4172 ) ) ( CAN_TRAVERSE ?AUTO_4175 ?AUTO_4176 ?AUTO_4172 ) ( AT ?AUTO_4175 ?AUTO_4176 ) ( VISIBLE ?AUTO_4176 ?AUTO_4172 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4175 ?AUTO_4176 ?AUTO_4172 )
      ( GET_IMAGE_DATA ?AUTO_4170 ?AUTO_4171 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4170 ?AUTO_4171 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4180 - OBJECTIVE
      ?AUTO_4181 - MODE
    )
    :vars
    (
      ?AUTO_4182 - LANDER
      ?AUTO_4187 - WAYPOINT
      ?AUTO_4186 - WAYPOINT
      ?AUTO_4185 - ROVER
      ?AUTO_4184 - CAMERA
      ?AUTO_4183 - WAYPOINT
      ?AUTO_4188 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4182 ?AUTO_4187 ) ( VISIBLE ?AUTO_4186 ?AUTO_4187 ) ( AVAILABLE ?AUTO_4185 ) ( CHANNEL_FREE ?AUTO_4182 ) ( not ( = ?AUTO_4186 ?AUTO_4187 ) ) ( CALIBRATED ?AUTO_4184 ?AUTO_4185 ) ( ON_BOARD ?AUTO_4184 ?AUTO_4185 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4185 ) ( SUPPORTS ?AUTO_4184 ?AUTO_4181 ) ( VISIBLE_FROM ?AUTO_4180 ?AUTO_4186 ) ( CAN_TRAVERSE ?AUTO_4185 ?AUTO_4183 ?AUTO_4186 ) ( VISIBLE ?AUTO_4183 ?AUTO_4186 ) ( not ( = ?AUTO_4187 ?AUTO_4183 ) ) ( not ( = ?AUTO_4186 ?AUTO_4183 ) ) ( CAN_TRAVERSE ?AUTO_4185 ?AUTO_4187 ?AUTO_4183 ) ( VISIBLE ?AUTO_4187 ?AUTO_4183 ) ( CAN_TRAVERSE ?AUTO_4185 ?AUTO_4188 ?AUTO_4187 ) ( AT ?AUTO_4185 ?AUTO_4188 ) ( VISIBLE ?AUTO_4188 ?AUTO_4187 ) ( not ( = ?AUTO_4187 ?AUTO_4188 ) ) ( not ( = ?AUTO_4186 ?AUTO_4188 ) ) ( not ( = ?AUTO_4183 ?AUTO_4188 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4185 ?AUTO_4188 ?AUTO_4187 )
      ( GET_IMAGE_DATA ?AUTO_4180 ?AUTO_4181 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4180 ?AUTO_4181 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4195 - OBJECTIVE
      ?AUTO_4196 - MODE
    )
    :vars
    (
      ?AUTO_4201 - LANDER
      ?AUTO_4202 - WAYPOINT
      ?AUTO_4203 - WAYPOINT
      ?AUTO_4200 - ROVER
      ?AUTO_4197 - CAMERA
      ?AUTO_4199 - WAYPOINT
      ?AUTO_4198 - WAYPOINT
      ?AUTO_4204 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4201 ?AUTO_4202 ) ( VISIBLE ?AUTO_4203 ?AUTO_4202 ) ( AVAILABLE ?AUTO_4200 ) ( CHANNEL_FREE ?AUTO_4201 ) ( not ( = ?AUTO_4203 ?AUTO_4202 ) ) ( ON_BOARD ?AUTO_4197 ?AUTO_4200 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4200 ) ( SUPPORTS ?AUTO_4197 ?AUTO_4196 ) ( VISIBLE_FROM ?AUTO_4195 ?AUTO_4203 ) ( CAN_TRAVERSE ?AUTO_4200 ?AUTO_4199 ?AUTO_4203 ) ( VISIBLE ?AUTO_4199 ?AUTO_4203 ) ( not ( = ?AUTO_4202 ?AUTO_4199 ) ) ( not ( = ?AUTO_4203 ?AUTO_4199 ) ) ( CAN_TRAVERSE ?AUTO_4200 ?AUTO_4202 ?AUTO_4199 ) ( VISIBLE ?AUTO_4202 ?AUTO_4199 ) ( CAN_TRAVERSE ?AUTO_4200 ?AUTO_4198 ?AUTO_4202 ) ( AT ?AUTO_4200 ?AUTO_4198 ) ( VISIBLE ?AUTO_4198 ?AUTO_4202 ) ( not ( = ?AUTO_4202 ?AUTO_4198 ) ) ( not ( = ?AUTO_4203 ?AUTO_4198 ) ) ( not ( = ?AUTO_4199 ?AUTO_4198 ) ) ( CALIBRATION_TARGET ?AUTO_4197 ?AUTO_4204 ) ( VISIBLE_FROM ?AUTO_4204 ?AUTO_4198 ) ( not ( = ?AUTO_4195 ?AUTO_4204 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4200 ?AUTO_4197 ?AUTO_4204 ?AUTO_4198 )
      ( GET_IMAGE_DATA ?AUTO_4195 ?AUTO_4196 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4195 ?AUTO_4196 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4233 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4234 - LANDER
      ?AUTO_4237 - WAYPOINT
      ?AUTO_4238 - ROVER
      ?AUTO_4235 - STORE
      ?AUTO_4236 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4234 ?AUTO_4237 ) ( VISIBLE ?AUTO_4233 ?AUTO_4237 ) ( AVAILABLE ?AUTO_4238 ) ( CHANNEL_FREE ?AUTO_4234 ) ( not ( = ?AUTO_4233 ?AUTO_4237 ) ) ( AT_SOIL_SAMPLE ?AUTO_4233 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4238 ) ( STORE_OF ?AUTO_4235 ?AUTO_4238 ) ( CAN_TRAVERSE ?AUTO_4238 ?AUTO_4236 ?AUTO_4233 ) ( VISIBLE ?AUTO_4236 ?AUTO_4233 ) ( not ( = ?AUTO_4233 ?AUTO_4236 ) ) ( not ( = ?AUTO_4237 ?AUTO_4236 ) ) ( CAN_TRAVERSE ?AUTO_4238 ?AUTO_4237 ?AUTO_4236 ) ( AT ?AUTO_4238 ?AUTO_4237 ) ( VISIBLE ?AUTO_4237 ?AUTO_4236 ) ( FULL ?AUTO_4235 ) )
    :subtasks
    ( ( !DROP ?AUTO_4238 ?AUTO_4235 )
      ( GET_SOIL_DATA ?AUTO_4233 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4233 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4239 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4244 - LANDER
      ?AUTO_4243 - WAYPOINT
      ?AUTO_4240 - ROVER
      ?AUTO_4241 - STORE
      ?AUTO_4242 - WAYPOINT
      ?AUTO_4245 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4244 ?AUTO_4243 ) ( VISIBLE ?AUTO_4239 ?AUTO_4243 ) ( AVAILABLE ?AUTO_4240 ) ( CHANNEL_FREE ?AUTO_4244 ) ( not ( = ?AUTO_4239 ?AUTO_4243 ) ) ( AT_SOIL_SAMPLE ?AUTO_4239 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4240 ) ( STORE_OF ?AUTO_4241 ?AUTO_4240 ) ( CAN_TRAVERSE ?AUTO_4240 ?AUTO_4242 ?AUTO_4239 ) ( VISIBLE ?AUTO_4242 ?AUTO_4239 ) ( not ( = ?AUTO_4239 ?AUTO_4242 ) ) ( not ( = ?AUTO_4243 ?AUTO_4242 ) ) ( CAN_TRAVERSE ?AUTO_4240 ?AUTO_4243 ?AUTO_4242 ) ( VISIBLE ?AUTO_4243 ?AUTO_4242 ) ( FULL ?AUTO_4241 ) ( CAN_TRAVERSE ?AUTO_4240 ?AUTO_4245 ?AUTO_4243 ) ( AT ?AUTO_4240 ?AUTO_4245 ) ( VISIBLE ?AUTO_4245 ?AUTO_4243 ) ( not ( = ?AUTO_4239 ?AUTO_4245 ) ) ( not ( = ?AUTO_4243 ?AUTO_4245 ) ) ( not ( = ?AUTO_4242 ?AUTO_4245 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4240 ?AUTO_4245 ?AUTO_4243 )
      ( GET_SOIL_DATA ?AUTO_4239 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4239 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4247 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4253 - LANDER
      ?AUTO_4251 - WAYPOINT
      ?AUTO_4250 - ROVER
      ?AUTO_4249 - STORE
      ?AUTO_4252 - WAYPOINT
      ?AUTO_4248 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4253 ?AUTO_4251 ) ( VISIBLE ?AUTO_4247 ?AUTO_4251 ) ( AVAILABLE ?AUTO_4250 ) ( CHANNEL_FREE ?AUTO_4253 ) ( not ( = ?AUTO_4247 ?AUTO_4251 ) ) ( AT_SOIL_SAMPLE ?AUTO_4247 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4250 ) ( STORE_OF ?AUTO_4249 ?AUTO_4250 ) ( CAN_TRAVERSE ?AUTO_4250 ?AUTO_4252 ?AUTO_4247 ) ( VISIBLE ?AUTO_4252 ?AUTO_4247 ) ( not ( = ?AUTO_4247 ?AUTO_4252 ) ) ( not ( = ?AUTO_4251 ?AUTO_4252 ) ) ( CAN_TRAVERSE ?AUTO_4250 ?AUTO_4251 ?AUTO_4252 ) ( VISIBLE ?AUTO_4251 ?AUTO_4252 ) ( CAN_TRAVERSE ?AUTO_4250 ?AUTO_4248 ?AUTO_4251 ) ( AT ?AUTO_4250 ?AUTO_4248 ) ( VISIBLE ?AUTO_4248 ?AUTO_4251 ) ( not ( = ?AUTO_4247 ?AUTO_4248 ) ) ( not ( = ?AUTO_4251 ?AUTO_4248 ) ) ( not ( = ?AUTO_4252 ?AUTO_4248 ) ) ( AT_ROCK_SAMPLE ?AUTO_4248 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4250 ) ( EMPTY ?AUTO_4249 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_4250 ?AUTO_4249 ?AUTO_4248 )
      ( GET_SOIL_DATA ?AUTO_4247 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4247 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4376 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4378 - LANDER
      ?AUTO_4377 - WAYPOINT
      ?AUTO_4379 - ROVER
      ?AUTO_4381 - STORE
      ?AUTO_4380 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4378 ?AUTO_4377 ) ( VISIBLE ?AUTO_4376 ?AUTO_4377 ) ( AVAILABLE ?AUTO_4379 ) ( CHANNEL_FREE ?AUTO_4378 ) ( not ( = ?AUTO_4376 ?AUTO_4377 ) ) ( AT_ROCK_SAMPLE ?AUTO_4376 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4379 ) ( STORE_OF ?AUTO_4381 ?AUTO_4379 ) ( CAN_TRAVERSE ?AUTO_4379 ?AUTO_4377 ?AUTO_4376 ) ( VISIBLE ?AUTO_4377 ?AUTO_4376 ) ( CAN_TRAVERSE ?AUTO_4379 ?AUTO_4380 ?AUTO_4377 ) ( AT ?AUTO_4379 ?AUTO_4380 ) ( VISIBLE ?AUTO_4380 ?AUTO_4377 ) ( not ( = ?AUTO_4376 ?AUTO_4380 ) ) ( not ( = ?AUTO_4377 ?AUTO_4380 ) ) ( AT_SOIL_SAMPLE ?AUTO_4380 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4379 ) ( EMPTY ?AUTO_4381 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4379 ?AUTO_4381 ?AUTO_4380 )
      ( GET_ROCK_DATA ?AUTO_4376 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4376 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4482 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4483 - LANDER
      ?AUTO_4487 - WAYPOINT
      ?AUTO_4484 - WAYPOINT
      ?AUTO_4485 - ROVER
      ?AUTO_4486 - STORE
      ?AUTO_4488 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4483 ?AUTO_4487 ) ( VISIBLE ?AUTO_4484 ?AUTO_4487 ) ( AVAILABLE ?AUTO_4485 ) ( CHANNEL_FREE ?AUTO_4483 ) ( not ( = ?AUTO_4482 ?AUTO_4484 ) ) ( not ( = ?AUTO_4482 ?AUTO_4487 ) ) ( not ( = ?AUTO_4484 ?AUTO_4487 ) ) ( CAN_TRAVERSE ?AUTO_4485 ?AUTO_4482 ?AUTO_4484 ) ( VISIBLE ?AUTO_4482 ?AUTO_4484 ) ( AT_SOIL_SAMPLE ?AUTO_4482 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4485 ) ( STORE_OF ?AUTO_4486 ?AUTO_4485 ) ( CAN_TRAVERSE ?AUTO_4485 ?AUTO_4488 ?AUTO_4482 ) ( AT ?AUTO_4485 ?AUTO_4488 ) ( VISIBLE ?AUTO_4488 ?AUTO_4482 ) ( not ( = ?AUTO_4482 ?AUTO_4488 ) ) ( not ( = ?AUTO_4487 ?AUTO_4488 ) ) ( not ( = ?AUTO_4484 ?AUTO_4488 ) ) ( FULL ?AUTO_4486 ) )
    :subtasks
    ( ( !DROP ?AUTO_4485 ?AUTO_4486 )
      ( GET_SOIL_DATA ?AUTO_4482 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4482 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4493 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4494 - LANDER
      ?AUTO_4495 - WAYPOINT
      ?AUTO_4499 - WAYPOINT
      ?AUTO_4497 - ROVER
      ?AUTO_4496 - STORE
      ?AUTO_4498 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4494 ?AUTO_4495 ) ( VISIBLE ?AUTO_4499 ?AUTO_4495 ) ( AVAILABLE ?AUTO_4497 ) ( CHANNEL_FREE ?AUTO_4494 ) ( not ( = ?AUTO_4493 ?AUTO_4499 ) ) ( not ( = ?AUTO_4493 ?AUTO_4495 ) ) ( not ( = ?AUTO_4499 ?AUTO_4495 ) ) ( CAN_TRAVERSE ?AUTO_4497 ?AUTO_4493 ?AUTO_4499 ) ( VISIBLE ?AUTO_4493 ?AUTO_4499 ) ( AT_SOIL_SAMPLE ?AUTO_4493 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4497 ) ( STORE_OF ?AUTO_4496 ?AUTO_4497 ) ( EMPTY ?AUTO_4496 ) ( CAN_TRAVERSE ?AUTO_4497 ?AUTO_4498 ?AUTO_4493 ) ( VISIBLE ?AUTO_4498 ?AUTO_4493 ) ( not ( = ?AUTO_4493 ?AUTO_4498 ) ) ( not ( = ?AUTO_4495 ?AUTO_4498 ) ) ( not ( = ?AUTO_4499 ?AUTO_4498 ) ) ( CAN_TRAVERSE ?AUTO_4497 ?AUTO_4495 ?AUTO_4498 ) ( AT ?AUTO_4497 ?AUTO_4495 ) ( VISIBLE ?AUTO_4495 ?AUTO_4498 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4497 ?AUTO_4495 ?AUTO_4498 )
      ( GET_SOIL_DATA ?AUTO_4493 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4493 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4500 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4501 - LANDER
      ?AUTO_4504 - WAYPOINT
      ?AUTO_4505 - WAYPOINT
      ?AUTO_4503 - ROVER
      ?AUTO_4506 - STORE
      ?AUTO_4502 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4501 ?AUTO_4504 ) ( VISIBLE ?AUTO_4505 ?AUTO_4504 ) ( AVAILABLE ?AUTO_4503 ) ( CHANNEL_FREE ?AUTO_4501 ) ( not ( = ?AUTO_4500 ?AUTO_4505 ) ) ( not ( = ?AUTO_4500 ?AUTO_4504 ) ) ( not ( = ?AUTO_4505 ?AUTO_4504 ) ) ( CAN_TRAVERSE ?AUTO_4503 ?AUTO_4500 ?AUTO_4505 ) ( VISIBLE ?AUTO_4500 ?AUTO_4505 ) ( AT_SOIL_SAMPLE ?AUTO_4500 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4503 ) ( STORE_OF ?AUTO_4506 ?AUTO_4503 ) ( CAN_TRAVERSE ?AUTO_4503 ?AUTO_4502 ?AUTO_4500 ) ( VISIBLE ?AUTO_4502 ?AUTO_4500 ) ( not ( = ?AUTO_4500 ?AUTO_4502 ) ) ( not ( = ?AUTO_4504 ?AUTO_4502 ) ) ( not ( = ?AUTO_4505 ?AUTO_4502 ) ) ( CAN_TRAVERSE ?AUTO_4503 ?AUTO_4504 ?AUTO_4502 ) ( AT ?AUTO_4503 ?AUTO_4504 ) ( VISIBLE ?AUTO_4504 ?AUTO_4502 ) ( FULL ?AUTO_4506 ) )
    :subtasks
    ( ( !DROP ?AUTO_4503 ?AUTO_4506 )
      ( GET_SOIL_DATA ?AUTO_4500 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4500 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4529 - OBJECTIVE
      ?AUTO_4530 - MODE
    )
    :vars
    (
      ?AUTO_4535 - LANDER
      ?AUTO_4534 - WAYPOINT
      ?AUTO_4533 - WAYPOINT
      ?AUTO_4531 - ROVER
      ?AUTO_4532 - CAMERA
      ?AUTO_4536 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4535 ?AUTO_4534 ) ( VISIBLE ?AUTO_4533 ?AUTO_4534 ) ( AVAILABLE ?AUTO_4531 ) ( CHANNEL_FREE ?AUTO_4535 ) ( not ( = ?AUTO_4533 ?AUTO_4534 ) ) ( ON_BOARD ?AUTO_4532 ?AUTO_4531 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4531 ) ( SUPPORTS ?AUTO_4532 ?AUTO_4530 ) ( VISIBLE_FROM ?AUTO_4529 ?AUTO_4533 ) ( CALIBRATION_TARGET ?AUTO_4532 ?AUTO_4529 ) ( CAN_TRAVERSE ?AUTO_4531 ?AUTO_4536 ?AUTO_4533 ) ( AT ?AUTO_4531 ?AUTO_4536 ) ( VISIBLE ?AUTO_4536 ?AUTO_4533 ) ( not ( = ?AUTO_4534 ?AUTO_4536 ) ) ( not ( = ?AUTO_4533 ?AUTO_4536 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4531 ?AUTO_4536 ?AUTO_4533 )
      ( GET_IMAGE_DATA ?AUTO_4529 ?AUTO_4530 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4529 ?AUTO_4530 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4537 - OBJECTIVE
      ?AUTO_4538 - MODE
    )
    :vars
    (
      ?AUTO_4540 - LANDER
      ?AUTO_4539 - WAYPOINT
      ?AUTO_4544 - WAYPOINT
      ?AUTO_4541 - ROVER
      ?AUTO_4542 - CAMERA
      ?AUTO_4543 - WAYPOINT
      ?AUTO_4545 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4540 ?AUTO_4539 ) ( VISIBLE ?AUTO_4544 ?AUTO_4539 ) ( AVAILABLE ?AUTO_4541 ) ( CHANNEL_FREE ?AUTO_4540 ) ( not ( = ?AUTO_4544 ?AUTO_4539 ) ) ( ON_BOARD ?AUTO_4542 ?AUTO_4541 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4541 ) ( SUPPORTS ?AUTO_4542 ?AUTO_4538 ) ( VISIBLE_FROM ?AUTO_4537 ?AUTO_4544 ) ( CALIBRATION_TARGET ?AUTO_4542 ?AUTO_4537 ) ( CAN_TRAVERSE ?AUTO_4541 ?AUTO_4543 ?AUTO_4544 ) ( VISIBLE ?AUTO_4543 ?AUTO_4544 ) ( not ( = ?AUTO_4539 ?AUTO_4543 ) ) ( not ( = ?AUTO_4544 ?AUTO_4543 ) ) ( CAN_TRAVERSE ?AUTO_4541 ?AUTO_4545 ?AUTO_4543 ) ( AT ?AUTO_4541 ?AUTO_4545 ) ( VISIBLE ?AUTO_4545 ?AUTO_4543 ) ( not ( = ?AUTO_4539 ?AUTO_4545 ) ) ( not ( = ?AUTO_4544 ?AUTO_4545 ) ) ( not ( = ?AUTO_4543 ?AUTO_4545 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4541 ?AUTO_4545 ?AUTO_4543 )
      ( GET_IMAGE_DATA ?AUTO_4537 ?AUTO_4538 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4537 ?AUTO_4538 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4546 - OBJECTIVE
      ?AUTO_4547 - MODE
    )
    :vars
    (
      ?AUTO_4552 - LANDER
      ?AUTO_4551 - WAYPOINT
      ?AUTO_4548 - WAYPOINT
      ?AUTO_4549 - ROVER
      ?AUTO_4553 - CAMERA
      ?AUTO_4550 - WAYPOINT
      ?AUTO_4554 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4552 ?AUTO_4551 ) ( VISIBLE ?AUTO_4548 ?AUTO_4551 ) ( AVAILABLE ?AUTO_4549 ) ( CHANNEL_FREE ?AUTO_4552 ) ( not ( = ?AUTO_4548 ?AUTO_4551 ) ) ( ON_BOARD ?AUTO_4553 ?AUTO_4549 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4549 ) ( SUPPORTS ?AUTO_4553 ?AUTO_4547 ) ( VISIBLE_FROM ?AUTO_4546 ?AUTO_4548 ) ( CALIBRATION_TARGET ?AUTO_4553 ?AUTO_4546 ) ( CAN_TRAVERSE ?AUTO_4549 ?AUTO_4550 ?AUTO_4548 ) ( VISIBLE ?AUTO_4550 ?AUTO_4548 ) ( not ( = ?AUTO_4551 ?AUTO_4550 ) ) ( not ( = ?AUTO_4548 ?AUTO_4550 ) ) ( CAN_TRAVERSE ?AUTO_4549 ?AUTO_4554 ?AUTO_4550 ) ( VISIBLE ?AUTO_4554 ?AUTO_4550 ) ( not ( = ?AUTO_4551 ?AUTO_4554 ) ) ( not ( = ?AUTO_4548 ?AUTO_4554 ) ) ( not ( = ?AUTO_4550 ?AUTO_4554 ) ) ( CAN_TRAVERSE ?AUTO_4549 ?AUTO_4551 ?AUTO_4554 ) ( AT ?AUTO_4549 ?AUTO_4551 ) ( VISIBLE ?AUTO_4551 ?AUTO_4554 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4549 ?AUTO_4551 ?AUTO_4554 )
      ( GET_IMAGE_DATA ?AUTO_4546 ?AUTO_4547 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4546 ?AUTO_4547 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4607 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4611 - LANDER
      ?AUTO_4609 - WAYPOINT
      ?AUTO_4612 - WAYPOINT
      ?AUTO_4608 - ROVER
      ?AUTO_4610 - STORE
      ?AUTO_4613 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4611 ?AUTO_4609 ) ( VISIBLE ?AUTO_4612 ?AUTO_4609 ) ( AVAILABLE ?AUTO_4608 ) ( CHANNEL_FREE ?AUTO_4611 ) ( not ( = ?AUTO_4607 ?AUTO_4612 ) ) ( not ( = ?AUTO_4607 ?AUTO_4609 ) ) ( not ( = ?AUTO_4612 ?AUTO_4609 ) ) ( CAN_TRAVERSE ?AUTO_4608 ?AUTO_4607 ?AUTO_4612 ) ( VISIBLE ?AUTO_4607 ?AUTO_4612 ) ( AT_SOIL_SAMPLE ?AUTO_4607 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4608 ) ( STORE_OF ?AUTO_4610 ?AUTO_4608 ) ( CAN_TRAVERSE ?AUTO_4608 ?AUTO_4612 ?AUTO_4607 ) ( VISIBLE ?AUTO_4612 ?AUTO_4607 ) ( FULL ?AUTO_4610 ) ( CAN_TRAVERSE ?AUTO_4608 ?AUTO_4613 ?AUTO_4612 ) ( AT ?AUTO_4608 ?AUTO_4613 ) ( VISIBLE ?AUTO_4613 ?AUTO_4612 ) ( not ( = ?AUTO_4607 ?AUTO_4613 ) ) ( not ( = ?AUTO_4609 ?AUTO_4613 ) ) ( not ( = ?AUTO_4612 ?AUTO_4613 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4608 ?AUTO_4613 ?AUTO_4612 )
      ( GET_SOIL_DATA ?AUTO_4607 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4607 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4614 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4620 - LANDER
      ?AUTO_4617 - WAYPOINT
      ?AUTO_4616 - WAYPOINT
      ?AUTO_4615 - ROVER
      ?AUTO_4618 - STORE
      ?AUTO_4619 - WAYPOINT
      ?AUTO_4621 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4620 ?AUTO_4617 ) ( VISIBLE ?AUTO_4616 ?AUTO_4617 ) ( AVAILABLE ?AUTO_4615 ) ( CHANNEL_FREE ?AUTO_4620 ) ( not ( = ?AUTO_4614 ?AUTO_4616 ) ) ( not ( = ?AUTO_4614 ?AUTO_4617 ) ) ( not ( = ?AUTO_4616 ?AUTO_4617 ) ) ( CAN_TRAVERSE ?AUTO_4615 ?AUTO_4614 ?AUTO_4616 ) ( VISIBLE ?AUTO_4614 ?AUTO_4616 ) ( AT_SOIL_SAMPLE ?AUTO_4614 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4615 ) ( STORE_OF ?AUTO_4618 ?AUTO_4615 ) ( CAN_TRAVERSE ?AUTO_4615 ?AUTO_4616 ?AUTO_4614 ) ( VISIBLE ?AUTO_4616 ?AUTO_4614 ) ( FULL ?AUTO_4618 ) ( CAN_TRAVERSE ?AUTO_4615 ?AUTO_4619 ?AUTO_4616 ) ( VISIBLE ?AUTO_4619 ?AUTO_4616 ) ( not ( = ?AUTO_4614 ?AUTO_4619 ) ) ( not ( = ?AUTO_4617 ?AUTO_4619 ) ) ( not ( = ?AUTO_4616 ?AUTO_4619 ) ) ( CAN_TRAVERSE ?AUTO_4615 ?AUTO_4621 ?AUTO_4619 ) ( AT ?AUTO_4615 ?AUTO_4621 ) ( VISIBLE ?AUTO_4621 ?AUTO_4619 ) ( not ( = ?AUTO_4614 ?AUTO_4621 ) ) ( not ( = ?AUTO_4617 ?AUTO_4621 ) ) ( not ( = ?AUTO_4616 ?AUTO_4621 ) ) ( not ( = ?AUTO_4619 ?AUTO_4621 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4615 ?AUTO_4621 ?AUTO_4619 )
      ( GET_SOIL_DATA ?AUTO_4614 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4614 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4623 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4625 - LANDER
      ?AUTO_4628 - WAYPOINT
      ?AUTO_4629 - WAYPOINT
      ?AUTO_4630 - ROVER
      ?AUTO_4624 - STORE
      ?AUTO_4627 - WAYPOINT
      ?AUTO_4626 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4625 ?AUTO_4628 ) ( VISIBLE ?AUTO_4629 ?AUTO_4628 ) ( AVAILABLE ?AUTO_4630 ) ( CHANNEL_FREE ?AUTO_4625 ) ( not ( = ?AUTO_4623 ?AUTO_4629 ) ) ( not ( = ?AUTO_4623 ?AUTO_4628 ) ) ( not ( = ?AUTO_4629 ?AUTO_4628 ) ) ( CAN_TRAVERSE ?AUTO_4630 ?AUTO_4623 ?AUTO_4629 ) ( VISIBLE ?AUTO_4623 ?AUTO_4629 ) ( AT_SOIL_SAMPLE ?AUTO_4623 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4630 ) ( STORE_OF ?AUTO_4624 ?AUTO_4630 ) ( CAN_TRAVERSE ?AUTO_4630 ?AUTO_4629 ?AUTO_4623 ) ( VISIBLE ?AUTO_4629 ?AUTO_4623 ) ( CAN_TRAVERSE ?AUTO_4630 ?AUTO_4627 ?AUTO_4629 ) ( VISIBLE ?AUTO_4627 ?AUTO_4629 ) ( not ( = ?AUTO_4623 ?AUTO_4627 ) ) ( not ( = ?AUTO_4628 ?AUTO_4627 ) ) ( not ( = ?AUTO_4629 ?AUTO_4627 ) ) ( CAN_TRAVERSE ?AUTO_4630 ?AUTO_4626 ?AUTO_4627 ) ( AT ?AUTO_4630 ?AUTO_4626 ) ( VISIBLE ?AUTO_4626 ?AUTO_4627 ) ( not ( = ?AUTO_4623 ?AUTO_4626 ) ) ( not ( = ?AUTO_4628 ?AUTO_4626 ) ) ( not ( = ?AUTO_4629 ?AUTO_4626 ) ) ( not ( = ?AUTO_4627 ?AUTO_4626 ) ) ( AT_SOIL_SAMPLE ?AUTO_4626 ) ( EMPTY ?AUTO_4624 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4630 ?AUTO_4624 ?AUTO_4626 )
      ( GET_SOIL_DATA ?AUTO_4623 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4623 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13023 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13025 - LANDER
      ?AUTO_13030 - WAYPOINT
      ?AUTO_13026 - WAYPOINT
      ?AUTO_13027 - ROVER
      ?AUTO_13029 - STORE
      ?AUTO_13028 - WAYPOINT
      ?AUTO_13024 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13025 ?AUTO_13030 ) ( VISIBLE ?AUTO_13026 ?AUTO_13030 ) ( AVAILABLE ?AUTO_13027 ) ( CHANNEL_FREE ?AUTO_13025 ) ( not ( = ?AUTO_13023 ?AUTO_13026 ) ) ( not ( = ?AUTO_13023 ?AUTO_13030 ) ) ( not ( = ?AUTO_13026 ?AUTO_13030 ) ) ( CAN_TRAVERSE ?AUTO_13027 ?AUTO_13023 ?AUTO_13026 ) ( VISIBLE ?AUTO_13023 ?AUTO_13026 ) ( AT_SOIL_SAMPLE ?AUTO_13023 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13027 ) ( STORE_OF ?AUTO_13029 ?AUTO_13027 ) ( EMPTY ?AUTO_13029 ) ( CAN_TRAVERSE ?AUTO_13027 ?AUTO_13026 ?AUTO_13023 ) ( VISIBLE ?AUTO_13026 ?AUTO_13023 ) ( CAN_TRAVERSE ?AUTO_13027 ?AUTO_13028 ?AUTO_13026 ) ( VISIBLE ?AUTO_13028 ?AUTO_13026 ) ( not ( = ?AUTO_13023 ?AUTO_13028 ) ) ( not ( = ?AUTO_13030 ?AUTO_13028 ) ) ( not ( = ?AUTO_13026 ?AUTO_13028 ) ) ( CAN_TRAVERSE ?AUTO_13027 ?AUTO_13024 ?AUTO_13028 ) ( VISIBLE ?AUTO_13024 ?AUTO_13028 ) ( not ( = ?AUTO_13023 ?AUTO_13024 ) ) ( not ( = ?AUTO_13030 ?AUTO_13024 ) ) ( not ( = ?AUTO_13026 ?AUTO_13024 ) ) ( not ( = ?AUTO_13028 ?AUTO_13024 ) ) ( CAN_TRAVERSE ?AUTO_13027 ?AUTO_13030 ?AUTO_13024 ) ( AT ?AUTO_13027 ?AUTO_13030 ) ( VISIBLE ?AUTO_13030 ?AUTO_13024 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13027 ?AUTO_13030 ?AUTO_13024 )
      ( GET_SOIL_DATA ?AUTO_13023 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13023 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4660 - OBJECTIVE
      ?AUTO_4661 - MODE
    )
    :vars
    (
      ?AUTO_4666 - LANDER
      ?AUTO_4663 - WAYPOINT
      ?AUTO_4664 - ROVER
      ?AUTO_4665 - WAYPOINT
      ?AUTO_4662 - WAYPOINT
      ?AUTO_4667 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4666 ?AUTO_4663 ) ( HAVE_IMAGE ?AUTO_4664 ?AUTO_4660 ?AUTO_4661 ) ( VISIBLE ?AUTO_4665 ?AUTO_4663 ) ( AVAILABLE ?AUTO_4664 ) ( CHANNEL_FREE ?AUTO_4666 ) ( not ( = ?AUTO_4665 ?AUTO_4663 ) ) ( CAN_TRAVERSE ?AUTO_4664 ?AUTO_4662 ?AUTO_4665 ) ( VISIBLE ?AUTO_4662 ?AUTO_4665 ) ( not ( = ?AUTO_4663 ?AUTO_4662 ) ) ( not ( = ?AUTO_4665 ?AUTO_4662 ) ) ( CAN_TRAVERSE ?AUTO_4664 ?AUTO_4667 ?AUTO_4662 ) ( AT ?AUTO_4664 ?AUTO_4667 ) ( VISIBLE ?AUTO_4667 ?AUTO_4662 ) ( not ( = ?AUTO_4663 ?AUTO_4667 ) ) ( not ( = ?AUTO_4665 ?AUTO_4667 ) ) ( not ( = ?AUTO_4662 ?AUTO_4667 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4664 ?AUTO_4667 ?AUTO_4662 )
      ( GET_IMAGE_DATA ?AUTO_4660 ?AUTO_4661 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4660 ?AUTO_4661 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4668 - OBJECTIVE
      ?AUTO_4669 - MODE
    )
    :vars
    (
      ?AUTO_4673 - LANDER
      ?AUTO_4671 - WAYPOINT
      ?AUTO_4675 - WAYPOINT
      ?AUTO_4674 - ROVER
      ?AUTO_4670 - WAYPOINT
      ?AUTO_4672 - WAYPOINT
      ?AUTO_4676 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4673 ?AUTO_4671 ) ( VISIBLE ?AUTO_4675 ?AUTO_4671 ) ( AVAILABLE ?AUTO_4674 ) ( CHANNEL_FREE ?AUTO_4673 ) ( not ( = ?AUTO_4675 ?AUTO_4671 ) ) ( CAN_TRAVERSE ?AUTO_4674 ?AUTO_4670 ?AUTO_4675 ) ( VISIBLE ?AUTO_4670 ?AUTO_4675 ) ( not ( = ?AUTO_4671 ?AUTO_4670 ) ) ( not ( = ?AUTO_4675 ?AUTO_4670 ) ) ( CAN_TRAVERSE ?AUTO_4674 ?AUTO_4672 ?AUTO_4670 ) ( AT ?AUTO_4674 ?AUTO_4672 ) ( VISIBLE ?AUTO_4672 ?AUTO_4670 ) ( not ( = ?AUTO_4671 ?AUTO_4672 ) ) ( not ( = ?AUTO_4675 ?AUTO_4672 ) ) ( not ( = ?AUTO_4670 ?AUTO_4672 ) ) ( CALIBRATED ?AUTO_4676 ?AUTO_4674 ) ( ON_BOARD ?AUTO_4676 ?AUTO_4674 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4674 ) ( SUPPORTS ?AUTO_4676 ?AUTO_4669 ) ( VISIBLE_FROM ?AUTO_4668 ?AUTO_4672 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_4674 ?AUTO_4672 ?AUTO_4668 ?AUTO_4676 ?AUTO_4669 )
      ( GET_IMAGE_DATA ?AUTO_4668 ?AUTO_4669 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4668 ?AUTO_4669 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4677 - OBJECTIVE
      ?AUTO_4678 - MODE
    )
    :vars
    (
      ?AUTO_4682 - LANDER
      ?AUTO_4679 - WAYPOINT
      ?AUTO_4680 - WAYPOINT
      ?AUTO_4683 - ROVER
      ?AUTO_4681 - WAYPOINT
      ?AUTO_4684 - WAYPOINT
      ?AUTO_4685 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4682 ?AUTO_4679 ) ( VISIBLE ?AUTO_4680 ?AUTO_4679 ) ( AVAILABLE ?AUTO_4683 ) ( CHANNEL_FREE ?AUTO_4682 ) ( not ( = ?AUTO_4680 ?AUTO_4679 ) ) ( CAN_TRAVERSE ?AUTO_4683 ?AUTO_4681 ?AUTO_4680 ) ( VISIBLE ?AUTO_4681 ?AUTO_4680 ) ( not ( = ?AUTO_4679 ?AUTO_4681 ) ) ( not ( = ?AUTO_4680 ?AUTO_4681 ) ) ( CAN_TRAVERSE ?AUTO_4683 ?AUTO_4684 ?AUTO_4681 ) ( AT ?AUTO_4683 ?AUTO_4684 ) ( VISIBLE ?AUTO_4684 ?AUTO_4681 ) ( not ( = ?AUTO_4679 ?AUTO_4684 ) ) ( not ( = ?AUTO_4680 ?AUTO_4684 ) ) ( not ( = ?AUTO_4681 ?AUTO_4684 ) ) ( ON_BOARD ?AUTO_4685 ?AUTO_4683 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4683 ) ( SUPPORTS ?AUTO_4685 ?AUTO_4678 ) ( VISIBLE_FROM ?AUTO_4677 ?AUTO_4684 ) ( CALIBRATION_TARGET ?AUTO_4685 ?AUTO_4677 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4683 ?AUTO_4685 ?AUTO_4677 ?AUTO_4684 )
      ( GET_IMAGE_DATA ?AUTO_4677 ?AUTO_4678 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4677 ?AUTO_4678 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4805 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4806 - LANDER
      ?AUTO_4809 - WAYPOINT
      ?AUTO_4811 - ROVER
      ?AUTO_4808 - STORE
      ?AUTO_4807 - WAYPOINT
      ?AUTO_4810 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4806 ?AUTO_4805 ) ( VISIBLE ?AUTO_4809 ?AUTO_4805 ) ( AVAILABLE ?AUTO_4811 ) ( CHANNEL_FREE ?AUTO_4806 ) ( not ( = ?AUTO_4805 ?AUTO_4809 ) ) ( CAN_TRAVERSE ?AUTO_4811 ?AUTO_4805 ?AUTO_4809 ) ( VISIBLE ?AUTO_4805 ?AUTO_4809 ) ( AT_SOIL_SAMPLE ?AUTO_4805 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4811 ) ( STORE_OF ?AUTO_4808 ?AUTO_4811 ) ( EMPTY ?AUTO_4808 ) ( CAN_TRAVERSE ?AUTO_4811 ?AUTO_4807 ?AUTO_4805 ) ( VISIBLE ?AUTO_4807 ?AUTO_4805 ) ( not ( = ?AUTO_4805 ?AUTO_4807 ) ) ( not ( = ?AUTO_4809 ?AUTO_4807 ) ) ( CAN_TRAVERSE ?AUTO_4811 ?AUTO_4810 ?AUTO_4807 ) ( VISIBLE ?AUTO_4810 ?AUTO_4807 ) ( not ( = ?AUTO_4805 ?AUTO_4810 ) ) ( not ( = ?AUTO_4809 ?AUTO_4810 ) ) ( not ( = ?AUTO_4807 ?AUTO_4810 ) ) ( CAN_TRAVERSE ?AUTO_4811 ?AUTO_4809 ?AUTO_4810 ) ( AT ?AUTO_4811 ?AUTO_4809 ) ( VISIBLE ?AUTO_4809 ?AUTO_4810 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4811 ?AUTO_4809 ?AUTO_4810 )
      ( GET_SOIL_DATA ?AUTO_4805 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4805 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4812 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4815 - LANDER
      ?AUTO_4814 - WAYPOINT
      ?AUTO_4813 - ROVER
      ?AUTO_4816 - STORE
      ?AUTO_4817 - WAYPOINT
      ?AUTO_4818 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4815 ?AUTO_4812 ) ( VISIBLE ?AUTO_4814 ?AUTO_4812 ) ( AVAILABLE ?AUTO_4813 ) ( CHANNEL_FREE ?AUTO_4815 ) ( not ( = ?AUTO_4812 ?AUTO_4814 ) ) ( CAN_TRAVERSE ?AUTO_4813 ?AUTO_4812 ?AUTO_4814 ) ( VISIBLE ?AUTO_4812 ?AUTO_4814 ) ( AT_SOIL_SAMPLE ?AUTO_4812 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4813 ) ( STORE_OF ?AUTO_4816 ?AUTO_4813 ) ( CAN_TRAVERSE ?AUTO_4813 ?AUTO_4817 ?AUTO_4812 ) ( VISIBLE ?AUTO_4817 ?AUTO_4812 ) ( not ( = ?AUTO_4812 ?AUTO_4817 ) ) ( not ( = ?AUTO_4814 ?AUTO_4817 ) ) ( CAN_TRAVERSE ?AUTO_4813 ?AUTO_4818 ?AUTO_4817 ) ( VISIBLE ?AUTO_4818 ?AUTO_4817 ) ( not ( = ?AUTO_4812 ?AUTO_4818 ) ) ( not ( = ?AUTO_4814 ?AUTO_4818 ) ) ( not ( = ?AUTO_4817 ?AUTO_4818 ) ) ( CAN_TRAVERSE ?AUTO_4813 ?AUTO_4814 ?AUTO_4818 ) ( AT ?AUTO_4813 ?AUTO_4814 ) ( VISIBLE ?AUTO_4814 ?AUTO_4818 ) ( FULL ?AUTO_4816 ) )
    :subtasks
    ( ( !DROP ?AUTO_4813 ?AUTO_4816 )
      ( GET_SOIL_DATA ?AUTO_4812 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4812 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4819 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4822 - LANDER
      ?AUTO_4824 - WAYPOINT
      ?AUTO_4820 - ROVER
      ?AUTO_4825 - STORE
      ?AUTO_4823 - WAYPOINT
      ?AUTO_4821 - WAYPOINT
      ?AUTO_4826 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4822 ?AUTO_4819 ) ( VISIBLE ?AUTO_4824 ?AUTO_4819 ) ( AVAILABLE ?AUTO_4820 ) ( CHANNEL_FREE ?AUTO_4822 ) ( not ( = ?AUTO_4819 ?AUTO_4824 ) ) ( CAN_TRAVERSE ?AUTO_4820 ?AUTO_4819 ?AUTO_4824 ) ( VISIBLE ?AUTO_4819 ?AUTO_4824 ) ( AT_SOIL_SAMPLE ?AUTO_4819 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4820 ) ( STORE_OF ?AUTO_4825 ?AUTO_4820 ) ( CAN_TRAVERSE ?AUTO_4820 ?AUTO_4823 ?AUTO_4819 ) ( VISIBLE ?AUTO_4823 ?AUTO_4819 ) ( not ( = ?AUTO_4819 ?AUTO_4823 ) ) ( not ( = ?AUTO_4824 ?AUTO_4823 ) ) ( CAN_TRAVERSE ?AUTO_4820 ?AUTO_4821 ?AUTO_4823 ) ( VISIBLE ?AUTO_4821 ?AUTO_4823 ) ( not ( = ?AUTO_4819 ?AUTO_4821 ) ) ( not ( = ?AUTO_4824 ?AUTO_4821 ) ) ( not ( = ?AUTO_4823 ?AUTO_4821 ) ) ( CAN_TRAVERSE ?AUTO_4820 ?AUTO_4824 ?AUTO_4821 ) ( VISIBLE ?AUTO_4824 ?AUTO_4821 ) ( FULL ?AUTO_4825 ) ( CAN_TRAVERSE ?AUTO_4820 ?AUTO_4826 ?AUTO_4824 ) ( AT ?AUTO_4820 ?AUTO_4826 ) ( VISIBLE ?AUTO_4826 ?AUTO_4824 ) ( not ( = ?AUTO_4819 ?AUTO_4826 ) ) ( not ( = ?AUTO_4824 ?AUTO_4826 ) ) ( not ( = ?AUTO_4823 ?AUTO_4826 ) ) ( not ( = ?AUTO_4821 ?AUTO_4826 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4820 ?AUTO_4826 ?AUTO_4824 )
      ( GET_SOIL_DATA ?AUTO_4819 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4819 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4828 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4834 - LANDER
      ?AUTO_4832 - WAYPOINT
      ?AUTO_4829 - ROVER
      ?AUTO_4835 - STORE
      ?AUTO_4830 - WAYPOINT
      ?AUTO_4833 - WAYPOINT
      ?AUTO_4831 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4834 ?AUTO_4828 ) ( VISIBLE ?AUTO_4832 ?AUTO_4828 ) ( AVAILABLE ?AUTO_4829 ) ( CHANNEL_FREE ?AUTO_4834 ) ( not ( = ?AUTO_4828 ?AUTO_4832 ) ) ( CAN_TRAVERSE ?AUTO_4829 ?AUTO_4828 ?AUTO_4832 ) ( VISIBLE ?AUTO_4828 ?AUTO_4832 ) ( AT_SOIL_SAMPLE ?AUTO_4828 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4829 ) ( STORE_OF ?AUTO_4835 ?AUTO_4829 ) ( CAN_TRAVERSE ?AUTO_4829 ?AUTO_4830 ?AUTO_4828 ) ( VISIBLE ?AUTO_4830 ?AUTO_4828 ) ( not ( = ?AUTO_4828 ?AUTO_4830 ) ) ( not ( = ?AUTO_4832 ?AUTO_4830 ) ) ( CAN_TRAVERSE ?AUTO_4829 ?AUTO_4833 ?AUTO_4830 ) ( VISIBLE ?AUTO_4833 ?AUTO_4830 ) ( not ( = ?AUTO_4828 ?AUTO_4833 ) ) ( not ( = ?AUTO_4832 ?AUTO_4833 ) ) ( not ( = ?AUTO_4830 ?AUTO_4833 ) ) ( CAN_TRAVERSE ?AUTO_4829 ?AUTO_4832 ?AUTO_4833 ) ( VISIBLE ?AUTO_4832 ?AUTO_4833 ) ( CAN_TRAVERSE ?AUTO_4829 ?AUTO_4831 ?AUTO_4832 ) ( AT ?AUTO_4829 ?AUTO_4831 ) ( VISIBLE ?AUTO_4831 ?AUTO_4832 ) ( not ( = ?AUTO_4828 ?AUTO_4831 ) ) ( not ( = ?AUTO_4832 ?AUTO_4831 ) ) ( not ( = ?AUTO_4830 ?AUTO_4831 ) ) ( not ( = ?AUTO_4833 ?AUTO_4831 ) ) ( AT_ROCK_SAMPLE ?AUTO_4831 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4829 ) ( EMPTY ?AUTO_4835 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_4829 ?AUTO_4835 ?AUTO_4831 )
      ( GET_SOIL_DATA ?AUTO_4828 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4828 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4858 - OBJECTIVE
      ?AUTO_4859 - MODE
    )
    :vars
    (
      ?AUTO_4861 - LANDER
      ?AUTO_4860 - WAYPOINT
      ?AUTO_4862 - WAYPOINT
      ?AUTO_4864 - ROVER
      ?AUTO_4863 - CAMERA
      ?AUTO_4865 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4861 ?AUTO_4860 ) ( VISIBLE ?AUTO_4862 ?AUTO_4860 ) ( AVAILABLE ?AUTO_4864 ) ( CHANNEL_FREE ?AUTO_4861 ) ( not ( = ?AUTO_4862 ?AUTO_4860 ) ) ( CALIBRATED ?AUTO_4863 ?AUTO_4864 ) ( ON_BOARD ?AUTO_4863 ?AUTO_4864 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4864 ) ( SUPPORTS ?AUTO_4863 ?AUTO_4859 ) ( VISIBLE_FROM ?AUTO_4858 ?AUTO_4862 ) ( CAN_TRAVERSE ?AUTO_4864 ?AUTO_4860 ?AUTO_4862 ) ( VISIBLE ?AUTO_4860 ?AUTO_4862 ) ( CAN_TRAVERSE ?AUTO_4864 ?AUTO_4865 ?AUTO_4860 ) ( AT ?AUTO_4864 ?AUTO_4865 ) ( VISIBLE ?AUTO_4865 ?AUTO_4860 ) ( not ( = ?AUTO_4860 ?AUTO_4865 ) ) ( not ( = ?AUTO_4862 ?AUTO_4865 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4864 ?AUTO_4865 ?AUTO_4860 )
      ( GET_IMAGE_DATA ?AUTO_4858 ?AUTO_4859 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4858 ?AUTO_4859 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4866 - OBJECTIVE
      ?AUTO_4867 - MODE
    )
    :vars
    (
      ?AUTO_4870 - LANDER
      ?AUTO_4871 - WAYPOINT
      ?AUTO_4873 - WAYPOINT
      ?AUTO_4868 - ROVER
      ?AUTO_4872 - CAMERA
      ?AUTO_4869 - WAYPOINT
      ?AUTO_4874 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4870 ?AUTO_4871 ) ( VISIBLE ?AUTO_4873 ?AUTO_4871 ) ( AVAILABLE ?AUTO_4868 ) ( CHANNEL_FREE ?AUTO_4870 ) ( not ( = ?AUTO_4873 ?AUTO_4871 ) ) ( ON_BOARD ?AUTO_4872 ?AUTO_4868 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4868 ) ( SUPPORTS ?AUTO_4872 ?AUTO_4867 ) ( VISIBLE_FROM ?AUTO_4866 ?AUTO_4873 ) ( CAN_TRAVERSE ?AUTO_4868 ?AUTO_4871 ?AUTO_4873 ) ( VISIBLE ?AUTO_4871 ?AUTO_4873 ) ( CAN_TRAVERSE ?AUTO_4868 ?AUTO_4869 ?AUTO_4871 ) ( AT ?AUTO_4868 ?AUTO_4869 ) ( VISIBLE ?AUTO_4869 ?AUTO_4871 ) ( not ( = ?AUTO_4871 ?AUTO_4869 ) ) ( not ( = ?AUTO_4873 ?AUTO_4869 ) ) ( CALIBRATION_TARGET ?AUTO_4872 ?AUTO_4874 ) ( VISIBLE_FROM ?AUTO_4874 ?AUTO_4869 ) ( not ( = ?AUTO_4866 ?AUTO_4874 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4868 ?AUTO_4872 ?AUTO_4874 ?AUTO_4869 )
      ( GET_IMAGE_DATA ?AUTO_4866 ?AUTO_4867 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4866 ?AUTO_4867 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4914 - OBJECTIVE
      ?AUTO_4915 - MODE
    )
    :vars
    (
      ?AUTO_4922 - LANDER
      ?AUTO_4919 - WAYPOINT
      ?AUTO_4918 - WAYPOINT
      ?AUTO_4917 - ROVER
      ?AUTO_4921 - CAMERA
      ?AUTO_4916 - WAYPOINT
      ?AUTO_4920 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4922 ?AUTO_4919 ) ( VISIBLE ?AUTO_4918 ?AUTO_4919 ) ( AVAILABLE ?AUTO_4917 ) ( CHANNEL_FREE ?AUTO_4922 ) ( not ( = ?AUTO_4918 ?AUTO_4919 ) ) ( ON_BOARD ?AUTO_4921 ?AUTO_4917 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4917 ) ( SUPPORTS ?AUTO_4921 ?AUTO_4915 ) ( VISIBLE_FROM ?AUTO_4914 ?AUTO_4918 ) ( CAN_TRAVERSE ?AUTO_4917 ?AUTO_4919 ?AUTO_4918 ) ( VISIBLE ?AUTO_4919 ?AUTO_4918 ) ( CAN_TRAVERSE ?AUTO_4917 ?AUTO_4916 ?AUTO_4919 ) ( VISIBLE ?AUTO_4916 ?AUTO_4919 ) ( not ( = ?AUTO_4919 ?AUTO_4916 ) ) ( not ( = ?AUTO_4918 ?AUTO_4916 ) ) ( CALIBRATION_TARGET ?AUTO_4921 ?AUTO_4920 ) ( VISIBLE_FROM ?AUTO_4920 ?AUTO_4916 ) ( not ( = ?AUTO_4914 ?AUTO_4920 ) ) ( CAN_TRAVERSE ?AUTO_4917 ?AUTO_4918 ?AUTO_4916 ) ( AT ?AUTO_4917 ?AUTO_4918 ) ( VISIBLE ?AUTO_4918 ?AUTO_4916 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4917 ?AUTO_4918 ?AUTO_4916 )
      ( GET_IMAGE_DATA ?AUTO_4914 ?AUTO_4915 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4914 ?AUTO_4915 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4987 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4989 - LANDER
      ?AUTO_4992 - WAYPOINT
      ?AUTO_4988 - ROVER
      ?AUTO_4990 - STORE
      ?AUTO_4991 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4989 ?AUTO_4992 ) ( VISIBLE ?AUTO_4987 ?AUTO_4992 ) ( AVAILABLE ?AUTO_4988 ) ( CHANNEL_FREE ?AUTO_4989 ) ( not ( = ?AUTO_4987 ?AUTO_4992 ) ) ( AT_ROCK_SAMPLE ?AUTO_4987 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4988 ) ( STORE_OF ?AUTO_4990 ?AUTO_4988 ) ( CAN_TRAVERSE ?AUTO_4988 ?AUTO_4991 ?AUTO_4987 ) ( VISIBLE ?AUTO_4991 ?AUTO_4987 ) ( not ( = ?AUTO_4987 ?AUTO_4991 ) ) ( not ( = ?AUTO_4992 ?AUTO_4991 ) ) ( CAN_TRAVERSE ?AUTO_4988 ?AUTO_4992 ?AUTO_4991 ) ( AT ?AUTO_4988 ?AUTO_4992 ) ( VISIBLE ?AUTO_4992 ?AUTO_4991 ) ( FULL ?AUTO_4990 ) )
    :subtasks
    ( ( !DROP ?AUTO_4988 ?AUTO_4990 )
      ( GET_ROCK_DATA ?AUTO_4987 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4987 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4993 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4995 - LANDER
      ?AUTO_4994 - WAYPOINT
      ?AUTO_4996 - ROVER
      ?AUTO_4997 - STORE
      ?AUTO_4998 - WAYPOINT
      ?AUTO_4999 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4995 ?AUTO_4994 ) ( VISIBLE ?AUTO_4993 ?AUTO_4994 ) ( AVAILABLE ?AUTO_4996 ) ( CHANNEL_FREE ?AUTO_4995 ) ( not ( = ?AUTO_4993 ?AUTO_4994 ) ) ( AT_ROCK_SAMPLE ?AUTO_4993 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4996 ) ( STORE_OF ?AUTO_4997 ?AUTO_4996 ) ( CAN_TRAVERSE ?AUTO_4996 ?AUTO_4998 ?AUTO_4993 ) ( VISIBLE ?AUTO_4998 ?AUTO_4993 ) ( not ( = ?AUTO_4993 ?AUTO_4998 ) ) ( not ( = ?AUTO_4994 ?AUTO_4998 ) ) ( CAN_TRAVERSE ?AUTO_4996 ?AUTO_4994 ?AUTO_4998 ) ( VISIBLE ?AUTO_4994 ?AUTO_4998 ) ( FULL ?AUTO_4997 ) ( CAN_TRAVERSE ?AUTO_4996 ?AUTO_4999 ?AUTO_4994 ) ( AT ?AUTO_4996 ?AUTO_4999 ) ( VISIBLE ?AUTO_4999 ?AUTO_4994 ) ( not ( = ?AUTO_4993 ?AUTO_4999 ) ) ( not ( = ?AUTO_4994 ?AUTO_4999 ) ) ( not ( = ?AUTO_4998 ?AUTO_4999 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4996 ?AUTO_4999 ?AUTO_4994 )
      ( GET_ROCK_DATA ?AUTO_4993 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4993 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5001 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5002 - LANDER
      ?AUTO_5003 - WAYPOINT
      ?AUTO_5004 - ROVER
      ?AUTO_5006 - STORE
      ?AUTO_5007 - WAYPOINT
      ?AUTO_5005 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5002 ?AUTO_5003 ) ( VISIBLE ?AUTO_5001 ?AUTO_5003 ) ( AVAILABLE ?AUTO_5004 ) ( CHANNEL_FREE ?AUTO_5002 ) ( not ( = ?AUTO_5001 ?AUTO_5003 ) ) ( AT_ROCK_SAMPLE ?AUTO_5001 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5004 ) ( STORE_OF ?AUTO_5006 ?AUTO_5004 ) ( CAN_TRAVERSE ?AUTO_5004 ?AUTO_5007 ?AUTO_5001 ) ( VISIBLE ?AUTO_5007 ?AUTO_5001 ) ( not ( = ?AUTO_5001 ?AUTO_5007 ) ) ( not ( = ?AUTO_5003 ?AUTO_5007 ) ) ( CAN_TRAVERSE ?AUTO_5004 ?AUTO_5003 ?AUTO_5007 ) ( VISIBLE ?AUTO_5003 ?AUTO_5007 ) ( CAN_TRAVERSE ?AUTO_5004 ?AUTO_5005 ?AUTO_5003 ) ( AT ?AUTO_5004 ?AUTO_5005 ) ( VISIBLE ?AUTO_5005 ?AUTO_5003 ) ( not ( = ?AUTO_5001 ?AUTO_5005 ) ) ( not ( = ?AUTO_5003 ?AUTO_5005 ) ) ( not ( = ?AUTO_5007 ?AUTO_5005 ) ) ( AT_SOIL_SAMPLE ?AUTO_5005 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5004 ) ( EMPTY ?AUTO_5006 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_5004 ?AUTO_5006 ?AUTO_5005 )
      ( GET_ROCK_DATA ?AUTO_5001 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5001 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5038 - OBJECTIVE
      ?AUTO_5039 - MODE
    )
    :vars
    (
      ?AUTO_5041 - LANDER
      ?AUTO_5040 - WAYPOINT
      ?AUTO_5045 - WAYPOINT
      ?AUTO_5044 - ROVER
      ?AUTO_5042 - CAMERA
      ?AUTO_5043 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5041 ?AUTO_5040 ) ( VISIBLE ?AUTO_5045 ?AUTO_5040 ) ( AVAILABLE ?AUTO_5044 ) ( CHANNEL_FREE ?AUTO_5041 ) ( not ( = ?AUTO_5045 ?AUTO_5040 ) ) ( ON_BOARD ?AUTO_5042 ?AUTO_5044 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5044 ) ( SUPPORTS ?AUTO_5042 ?AUTO_5039 ) ( VISIBLE_FROM ?AUTO_5038 ?AUTO_5045 ) ( CAN_TRAVERSE ?AUTO_5044 ?AUTO_5040 ?AUTO_5045 ) ( VISIBLE ?AUTO_5040 ?AUTO_5045 ) ( CALIBRATION_TARGET ?AUTO_5042 ?AUTO_5043 ) ( VISIBLE_FROM ?AUTO_5043 ?AUTO_5040 ) ( not ( = ?AUTO_5038 ?AUTO_5043 ) ) ( CAN_TRAVERSE ?AUTO_5044 ?AUTO_5045 ?AUTO_5040 ) ( AT ?AUTO_5044 ?AUTO_5045 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5044 ?AUTO_5045 ?AUTO_5040 )
      ( GET_IMAGE_DATA ?AUTO_5038 ?AUTO_5039 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5038 ?AUTO_5039 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5046 - OBJECTIVE
      ?AUTO_5047 - MODE
    )
    :vars
    (
      ?AUTO_5049 - LANDER
      ?AUTO_5050 - WAYPOINT
      ?AUTO_5053 - WAYPOINT
      ?AUTO_5051 - ROVER
      ?AUTO_5048 - CAMERA
      ?AUTO_5052 - OBJECTIVE
      ?AUTO_5054 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5049 ?AUTO_5050 ) ( VISIBLE ?AUTO_5053 ?AUTO_5050 ) ( AVAILABLE ?AUTO_5051 ) ( CHANNEL_FREE ?AUTO_5049 ) ( not ( = ?AUTO_5053 ?AUTO_5050 ) ) ( ON_BOARD ?AUTO_5048 ?AUTO_5051 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5051 ) ( SUPPORTS ?AUTO_5048 ?AUTO_5047 ) ( VISIBLE_FROM ?AUTO_5046 ?AUTO_5053 ) ( CAN_TRAVERSE ?AUTO_5051 ?AUTO_5050 ?AUTO_5053 ) ( VISIBLE ?AUTO_5050 ?AUTO_5053 ) ( CALIBRATION_TARGET ?AUTO_5048 ?AUTO_5052 ) ( VISIBLE_FROM ?AUTO_5052 ?AUTO_5050 ) ( not ( = ?AUTO_5046 ?AUTO_5052 ) ) ( CAN_TRAVERSE ?AUTO_5051 ?AUTO_5053 ?AUTO_5050 ) ( CAN_TRAVERSE ?AUTO_5051 ?AUTO_5054 ?AUTO_5053 ) ( AT ?AUTO_5051 ?AUTO_5054 ) ( VISIBLE ?AUTO_5054 ?AUTO_5053 ) ( not ( = ?AUTO_5050 ?AUTO_5054 ) ) ( not ( = ?AUTO_5053 ?AUTO_5054 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5051 ?AUTO_5054 ?AUTO_5053 )
      ( GET_IMAGE_DATA ?AUTO_5046 ?AUTO_5047 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5046 ?AUTO_5047 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5055 - OBJECTIVE
      ?AUTO_5056 - MODE
    )
    :vars
    (
      ?AUTO_5057 - LANDER
      ?AUTO_5062 - WAYPOINT
      ?AUTO_5061 - WAYPOINT
      ?AUTO_5060 - ROVER
      ?AUTO_5059 - CAMERA
      ?AUTO_5058 - OBJECTIVE
      ?AUTO_5063 - WAYPOINT
      ?AUTO_5064 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5057 ?AUTO_5062 ) ( VISIBLE ?AUTO_5061 ?AUTO_5062 ) ( AVAILABLE ?AUTO_5060 ) ( CHANNEL_FREE ?AUTO_5057 ) ( not ( = ?AUTO_5061 ?AUTO_5062 ) ) ( ON_BOARD ?AUTO_5059 ?AUTO_5060 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5060 ) ( SUPPORTS ?AUTO_5059 ?AUTO_5056 ) ( VISIBLE_FROM ?AUTO_5055 ?AUTO_5061 ) ( CAN_TRAVERSE ?AUTO_5060 ?AUTO_5062 ?AUTO_5061 ) ( VISIBLE ?AUTO_5062 ?AUTO_5061 ) ( CALIBRATION_TARGET ?AUTO_5059 ?AUTO_5058 ) ( VISIBLE_FROM ?AUTO_5058 ?AUTO_5062 ) ( not ( = ?AUTO_5055 ?AUTO_5058 ) ) ( CAN_TRAVERSE ?AUTO_5060 ?AUTO_5061 ?AUTO_5062 ) ( CAN_TRAVERSE ?AUTO_5060 ?AUTO_5063 ?AUTO_5061 ) ( VISIBLE ?AUTO_5063 ?AUTO_5061 ) ( not ( = ?AUTO_5062 ?AUTO_5063 ) ) ( not ( = ?AUTO_5061 ?AUTO_5063 ) ) ( CAN_TRAVERSE ?AUTO_5060 ?AUTO_5064 ?AUTO_5063 ) ( AT ?AUTO_5060 ?AUTO_5064 ) ( VISIBLE ?AUTO_5064 ?AUTO_5063 ) ( not ( = ?AUTO_5062 ?AUTO_5064 ) ) ( not ( = ?AUTO_5061 ?AUTO_5064 ) ) ( not ( = ?AUTO_5063 ?AUTO_5064 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5060 ?AUTO_5064 ?AUTO_5063 )
      ( GET_IMAGE_DATA ?AUTO_5055 ?AUTO_5056 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5055 ?AUTO_5056 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5138 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5140 - LANDER
      ?AUTO_5139 - WAYPOINT
      ?AUTO_5143 - ROVER
      ?AUTO_5142 - STORE
      ?AUTO_5141 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5140 ?AUTO_5139 ) ( VISIBLE ?AUTO_5138 ?AUTO_5139 ) ( AVAILABLE ?AUTO_5143 ) ( CHANNEL_FREE ?AUTO_5140 ) ( not ( = ?AUTO_5138 ?AUTO_5139 ) ) ( AT_SOIL_SAMPLE ?AUTO_5138 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5143 ) ( STORE_OF ?AUTO_5142 ?AUTO_5143 ) ( CAN_TRAVERSE ?AUTO_5143 ?AUTO_5141 ?AUTO_5138 ) ( AT ?AUTO_5143 ?AUTO_5141 ) ( VISIBLE ?AUTO_5141 ?AUTO_5138 ) ( not ( = ?AUTO_5138 ?AUTO_5141 ) ) ( not ( = ?AUTO_5139 ?AUTO_5141 ) ) ( AT_SOIL_SAMPLE ?AUTO_5141 ) ( EMPTY ?AUTO_5142 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_5143 ?AUTO_5142 ?AUTO_5141 )
      ( GET_SOIL_DATA ?AUTO_5138 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5138 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5254 - OBJECTIVE
      ?AUTO_5255 - MODE
    )
    :vars
    (
      ?AUTO_5261 - LANDER
      ?AUTO_5260 - WAYPOINT
      ?AUTO_5257 - WAYPOINT
      ?AUTO_5256 - ROVER
      ?AUTO_5258 - CAMERA
      ?AUTO_5259 - WAYPOINT
      ?AUTO_5262 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5261 ?AUTO_5260 ) ( VISIBLE ?AUTO_5257 ?AUTO_5260 ) ( AVAILABLE ?AUTO_5256 ) ( CHANNEL_FREE ?AUTO_5261 ) ( not ( = ?AUTO_5257 ?AUTO_5260 ) ) ( CAN_TRAVERSE ?AUTO_5256 ?AUTO_5260 ?AUTO_5257 ) ( VISIBLE ?AUTO_5260 ?AUTO_5257 ) ( ON_BOARD ?AUTO_5258 ?AUTO_5256 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5256 ) ( SUPPORTS ?AUTO_5258 ?AUTO_5255 ) ( VISIBLE_FROM ?AUTO_5254 ?AUTO_5260 ) ( CALIBRATION_TARGET ?AUTO_5258 ?AUTO_5254 ) ( CAN_TRAVERSE ?AUTO_5256 ?AUTO_5259 ?AUTO_5260 ) ( VISIBLE ?AUTO_5259 ?AUTO_5260 ) ( not ( = ?AUTO_5260 ?AUTO_5259 ) ) ( not ( = ?AUTO_5257 ?AUTO_5259 ) ) ( CAN_TRAVERSE ?AUTO_5256 ?AUTO_5262 ?AUTO_5259 ) ( AT ?AUTO_5256 ?AUTO_5262 ) ( VISIBLE ?AUTO_5262 ?AUTO_5259 ) ( not ( = ?AUTO_5260 ?AUTO_5262 ) ) ( not ( = ?AUTO_5257 ?AUTO_5262 ) ) ( not ( = ?AUTO_5259 ?AUTO_5262 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5256 ?AUTO_5262 ?AUTO_5259 )
      ( GET_IMAGE_DATA ?AUTO_5254 ?AUTO_5255 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5254 ?AUTO_5255 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5313 - OBJECTIVE
      ?AUTO_5314 - MODE
    )
    :vars
    (
      ?AUTO_5321 - LANDER
      ?AUTO_5318 - WAYPOINT
      ?AUTO_5319 - WAYPOINT
      ?AUTO_5317 - ROVER
      ?AUTO_5316 - WAYPOINT
      ?AUTO_5320 - CAMERA
      ?AUTO_5315 - WAYPOINT
      ?AUTO_5322 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5321 ?AUTO_5318 ) ( VISIBLE ?AUTO_5319 ?AUTO_5318 ) ( AVAILABLE ?AUTO_5317 ) ( CHANNEL_FREE ?AUTO_5321 ) ( not ( = ?AUTO_5319 ?AUTO_5318 ) ) ( CAN_TRAVERSE ?AUTO_5317 ?AUTO_5316 ?AUTO_5319 ) ( VISIBLE ?AUTO_5316 ?AUTO_5319 ) ( not ( = ?AUTO_5318 ?AUTO_5316 ) ) ( not ( = ?AUTO_5319 ?AUTO_5316 ) ) ( ON_BOARD ?AUTO_5320 ?AUTO_5317 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5317 ) ( SUPPORTS ?AUTO_5320 ?AUTO_5314 ) ( VISIBLE_FROM ?AUTO_5313 ?AUTO_5316 ) ( CALIBRATION_TARGET ?AUTO_5320 ?AUTO_5313 ) ( CAN_TRAVERSE ?AUTO_5317 ?AUTO_5315 ?AUTO_5316 ) ( VISIBLE ?AUTO_5315 ?AUTO_5316 ) ( not ( = ?AUTO_5318 ?AUTO_5315 ) ) ( not ( = ?AUTO_5319 ?AUTO_5315 ) ) ( not ( = ?AUTO_5316 ?AUTO_5315 ) ) ( CAN_TRAVERSE ?AUTO_5317 ?AUTO_5322 ?AUTO_5315 ) ( AT ?AUTO_5317 ?AUTO_5322 ) ( VISIBLE ?AUTO_5322 ?AUTO_5315 ) ( not ( = ?AUTO_5318 ?AUTO_5322 ) ) ( not ( = ?AUTO_5319 ?AUTO_5322 ) ) ( not ( = ?AUTO_5316 ?AUTO_5322 ) ) ( not ( = ?AUTO_5315 ?AUTO_5322 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5317 ?AUTO_5322 ?AUTO_5315 )
      ( GET_IMAGE_DATA ?AUTO_5313 ?AUTO_5314 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5313 ?AUTO_5314 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5325 - OBJECTIVE
      ?AUTO_5326 - MODE
    )
    :vars
    (
      ?AUTO_5333 - LANDER
      ?AUTO_5327 - WAYPOINT
      ?AUTO_5332 - WAYPOINT
      ?AUTO_5331 - ROVER
      ?AUTO_5328 - WAYPOINT
      ?AUTO_5330 - CAMERA
      ?AUTO_5334 - WAYPOINT
      ?AUTO_5329 - WAYPOINT
      ?AUTO_5335 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5333 ?AUTO_5327 ) ( VISIBLE ?AUTO_5332 ?AUTO_5327 ) ( AVAILABLE ?AUTO_5331 ) ( CHANNEL_FREE ?AUTO_5333 ) ( not ( = ?AUTO_5332 ?AUTO_5327 ) ) ( CAN_TRAVERSE ?AUTO_5331 ?AUTO_5328 ?AUTO_5332 ) ( VISIBLE ?AUTO_5328 ?AUTO_5332 ) ( not ( = ?AUTO_5327 ?AUTO_5328 ) ) ( not ( = ?AUTO_5332 ?AUTO_5328 ) ) ( ON_BOARD ?AUTO_5330 ?AUTO_5331 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5331 ) ( SUPPORTS ?AUTO_5330 ?AUTO_5326 ) ( VISIBLE_FROM ?AUTO_5325 ?AUTO_5328 ) ( CALIBRATION_TARGET ?AUTO_5330 ?AUTO_5325 ) ( CAN_TRAVERSE ?AUTO_5331 ?AUTO_5334 ?AUTO_5328 ) ( VISIBLE ?AUTO_5334 ?AUTO_5328 ) ( not ( = ?AUTO_5327 ?AUTO_5334 ) ) ( not ( = ?AUTO_5332 ?AUTO_5334 ) ) ( not ( = ?AUTO_5328 ?AUTO_5334 ) ) ( CAN_TRAVERSE ?AUTO_5331 ?AUTO_5329 ?AUTO_5334 ) ( VISIBLE ?AUTO_5329 ?AUTO_5334 ) ( not ( = ?AUTO_5327 ?AUTO_5329 ) ) ( not ( = ?AUTO_5332 ?AUTO_5329 ) ) ( not ( = ?AUTO_5328 ?AUTO_5329 ) ) ( not ( = ?AUTO_5334 ?AUTO_5329 ) ) ( CAN_TRAVERSE ?AUTO_5331 ?AUTO_5335 ?AUTO_5329 ) ( AT ?AUTO_5331 ?AUTO_5335 ) ( VISIBLE ?AUTO_5335 ?AUTO_5329 ) ( not ( = ?AUTO_5327 ?AUTO_5335 ) ) ( not ( = ?AUTO_5332 ?AUTO_5335 ) ) ( not ( = ?AUTO_5328 ?AUTO_5335 ) ) ( not ( = ?AUTO_5334 ?AUTO_5335 ) ) ( not ( = ?AUTO_5329 ?AUTO_5335 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5331 ?AUTO_5335 ?AUTO_5329 )
      ( GET_IMAGE_DATA ?AUTO_5325 ?AUTO_5326 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5325 ?AUTO_5326 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5374 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5378 - LANDER
      ?AUTO_5375 - WAYPOINT
      ?AUTO_5379 - ROVER
      ?AUTO_5380 - STORE
      ?AUTO_5376 - WAYPOINT
      ?AUTO_5377 - WAYPOINT
      ?AUTO_5381 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5378 ?AUTO_5375 ) ( VISIBLE ?AUTO_5374 ?AUTO_5375 ) ( AVAILABLE ?AUTO_5379 ) ( CHANNEL_FREE ?AUTO_5378 ) ( not ( = ?AUTO_5374 ?AUTO_5375 ) ) ( AT_ROCK_SAMPLE ?AUTO_5374 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5379 ) ( STORE_OF ?AUTO_5380 ?AUTO_5379 ) ( CAN_TRAVERSE ?AUTO_5379 ?AUTO_5376 ?AUTO_5374 ) ( VISIBLE ?AUTO_5376 ?AUTO_5374 ) ( not ( = ?AUTO_5374 ?AUTO_5376 ) ) ( not ( = ?AUTO_5375 ?AUTO_5376 ) ) ( CAN_TRAVERSE ?AUTO_5379 ?AUTO_5377 ?AUTO_5376 ) ( VISIBLE ?AUTO_5377 ?AUTO_5376 ) ( not ( = ?AUTO_5374 ?AUTO_5377 ) ) ( not ( = ?AUTO_5375 ?AUTO_5377 ) ) ( not ( = ?AUTO_5376 ?AUTO_5377 ) ) ( CAN_TRAVERSE ?AUTO_5379 ?AUTO_5381 ?AUTO_5377 ) ( AT ?AUTO_5379 ?AUTO_5381 ) ( VISIBLE ?AUTO_5381 ?AUTO_5377 ) ( not ( = ?AUTO_5374 ?AUTO_5381 ) ) ( not ( = ?AUTO_5375 ?AUTO_5381 ) ) ( not ( = ?AUTO_5376 ?AUTO_5381 ) ) ( not ( = ?AUTO_5377 ?AUTO_5381 ) ) ( FULL ?AUTO_5380 ) )
    :subtasks
    ( ( !DROP ?AUTO_5379 ?AUTO_5380 )
      ( GET_ROCK_DATA ?AUTO_5374 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5374 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5382 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5387 - LANDER
      ?AUTO_5385 - WAYPOINT
      ?AUTO_5389 - ROVER
      ?AUTO_5384 - STORE
      ?AUTO_5388 - WAYPOINT
      ?AUTO_5383 - WAYPOINT
      ?AUTO_5386 - WAYPOINT
      ?AUTO_5390 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5387 ?AUTO_5385 ) ( VISIBLE ?AUTO_5382 ?AUTO_5385 ) ( AVAILABLE ?AUTO_5389 ) ( CHANNEL_FREE ?AUTO_5387 ) ( not ( = ?AUTO_5382 ?AUTO_5385 ) ) ( AT_ROCK_SAMPLE ?AUTO_5382 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5389 ) ( STORE_OF ?AUTO_5384 ?AUTO_5389 ) ( CAN_TRAVERSE ?AUTO_5389 ?AUTO_5388 ?AUTO_5382 ) ( VISIBLE ?AUTO_5388 ?AUTO_5382 ) ( not ( = ?AUTO_5382 ?AUTO_5388 ) ) ( not ( = ?AUTO_5385 ?AUTO_5388 ) ) ( CAN_TRAVERSE ?AUTO_5389 ?AUTO_5383 ?AUTO_5388 ) ( VISIBLE ?AUTO_5383 ?AUTO_5388 ) ( not ( = ?AUTO_5382 ?AUTO_5383 ) ) ( not ( = ?AUTO_5385 ?AUTO_5383 ) ) ( not ( = ?AUTO_5388 ?AUTO_5383 ) ) ( CAN_TRAVERSE ?AUTO_5389 ?AUTO_5386 ?AUTO_5383 ) ( VISIBLE ?AUTO_5386 ?AUTO_5383 ) ( not ( = ?AUTO_5382 ?AUTO_5386 ) ) ( not ( = ?AUTO_5385 ?AUTO_5386 ) ) ( not ( = ?AUTO_5388 ?AUTO_5386 ) ) ( not ( = ?AUTO_5383 ?AUTO_5386 ) ) ( FULL ?AUTO_5384 ) ( CAN_TRAVERSE ?AUTO_5389 ?AUTO_5390 ?AUTO_5386 ) ( AT ?AUTO_5389 ?AUTO_5390 ) ( VISIBLE ?AUTO_5390 ?AUTO_5386 ) ( not ( = ?AUTO_5382 ?AUTO_5390 ) ) ( not ( = ?AUTO_5385 ?AUTO_5390 ) ) ( not ( = ?AUTO_5388 ?AUTO_5390 ) ) ( not ( = ?AUTO_5383 ?AUTO_5390 ) ) ( not ( = ?AUTO_5386 ?AUTO_5390 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5389 ?AUTO_5390 ?AUTO_5386 )
      ( GET_ROCK_DATA ?AUTO_5382 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5382 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5392 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5397 - LANDER
      ?AUTO_5396 - WAYPOINT
      ?AUTO_5393 - ROVER
      ?AUTO_5395 - STORE
      ?AUTO_5394 - WAYPOINT
      ?AUTO_5398 - WAYPOINT
      ?AUTO_5400 - WAYPOINT
      ?AUTO_5399 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5397 ?AUTO_5396 ) ( VISIBLE ?AUTO_5392 ?AUTO_5396 ) ( AVAILABLE ?AUTO_5393 ) ( CHANNEL_FREE ?AUTO_5397 ) ( not ( = ?AUTO_5392 ?AUTO_5396 ) ) ( AT_ROCK_SAMPLE ?AUTO_5392 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5393 ) ( STORE_OF ?AUTO_5395 ?AUTO_5393 ) ( CAN_TRAVERSE ?AUTO_5393 ?AUTO_5394 ?AUTO_5392 ) ( VISIBLE ?AUTO_5394 ?AUTO_5392 ) ( not ( = ?AUTO_5392 ?AUTO_5394 ) ) ( not ( = ?AUTO_5396 ?AUTO_5394 ) ) ( CAN_TRAVERSE ?AUTO_5393 ?AUTO_5398 ?AUTO_5394 ) ( VISIBLE ?AUTO_5398 ?AUTO_5394 ) ( not ( = ?AUTO_5392 ?AUTO_5398 ) ) ( not ( = ?AUTO_5396 ?AUTO_5398 ) ) ( not ( = ?AUTO_5394 ?AUTO_5398 ) ) ( CAN_TRAVERSE ?AUTO_5393 ?AUTO_5400 ?AUTO_5398 ) ( VISIBLE ?AUTO_5400 ?AUTO_5398 ) ( not ( = ?AUTO_5392 ?AUTO_5400 ) ) ( not ( = ?AUTO_5396 ?AUTO_5400 ) ) ( not ( = ?AUTO_5394 ?AUTO_5400 ) ) ( not ( = ?AUTO_5398 ?AUTO_5400 ) ) ( CAN_TRAVERSE ?AUTO_5393 ?AUTO_5399 ?AUTO_5400 ) ( AT ?AUTO_5393 ?AUTO_5399 ) ( VISIBLE ?AUTO_5399 ?AUTO_5400 ) ( not ( = ?AUTO_5392 ?AUTO_5399 ) ) ( not ( = ?AUTO_5396 ?AUTO_5399 ) ) ( not ( = ?AUTO_5394 ?AUTO_5399 ) ) ( not ( = ?AUTO_5398 ?AUTO_5399 ) ) ( not ( = ?AUTO_5400 ?AUTO_5399 ) ) ( AT_ROCK_SAMPLE ?AUTO_5399 ) ( EMPTY ?AUTO_5395 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5393 ?AUTO_5395 ?AUTO_5399 )
      ( GET_ROCK_DATA ?AUTO_5392 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5392 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5433 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5437 - LANDER
      ?AUTO_5436 - WAYPOINT
      ?AUTO_5439 - WAYPOINT
      ?AUTO_5434 - ROVER
      ?AUTO_5438 - STORE
      ?AUTO_5435 - WAYPOINT
      ?AUTO_5440 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5437 ?AUTO_5436 ) ( VISIBLE ?AUTO_5439 ?AUTO_5436 ) ( AVAILABLE ?AUTO_5434 ) ( CHANNEL_FREE ?AUTO_5437 ) ( not ( = ?AUTO_5433 ?AUTO_5439 ) ) ( not ( = ?AUTO_5433 ?AUTO_5436 ) ) ( not ( = ?AUTO_5439 ?AUTO_5436 ) ) ( CAN_TRAVERSE ?AUTO_5434 ?AUTO_5433 ?AUTO_5439 ) ( VISIBLE ?AUTO_5433 ?AUTO_5439 ) ( AT_SOIL_SAMPLE ?AUTO_5433 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5434 ) ( STORE_OF ?AUTO_5438 ?AUTO_5434 ) ( CAN_TRAVERSE ?AUTO_5434 ?AUTO_5435 ?AUTO_5433 ) ( VISIBLE ?AUTO_5435 ?AUTO_5433 ) ( not ( = ?AUTO_5433 ?AUTO_5435 ) ) ( not ( = ?AUTO_5436 ?AUTO_5435 ) ) ( not ( = ?AUTO_5439 ?AUTO_5435 ) ) ( FULL ?AUTO_5438 ) ( CAN_TRAVERSE ?AUTO_5434 ?AUTO_5440 ?AUTO_5435 ) ( AT ?AUTO_5434 ?AUTO_5440 ) ( VISIBLE ?AUTO_5440 ?AUTO_5435 ) ( not ( = ?AUTO_5433 ?AUTO_5440 ) ) ( not ( = ?AUTO_5436 ?AUTO_5440 ) ) ( not ( = ?AUTO_5439 ?AUTO_5440 ) ) ( not ( = ?AUTO_5435 ?AUTO_5440 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5434 ?AUTO_5440 ?AUTO_5435 )
      ( GET_SOIL_DATA ?AUTO_5433 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5433 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5442 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5448 - LANDER
      ?AUTO_5445 - WAYPOINT
      ?AUTO_5444 - WAYPOINT
      ?AUTO_5446 - ROVER
      ?AUTO_5447 - STORE
      ?AUTO_5443 - WAYPOINT
      ?AUTO_5449 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5448 ?AUTO_5445 ) ( VISIBLE ?AUTO_5444 ?AUTO_5445 ) ( AVAILABLE ?AUTO_5446 ) ( CHANNEL_FREE ?AUTO_5448 ) ( not ( = ?AUTO_5442 ?AUTO_5444 ) ) ( not ( = ?AUTO_5442 ?AUTO_5445 ) ) ( not ( = ?AUTO_5444 ?AUTO_5445 ) ) ( CAN_TRAVERSE ?AUTO_5446 ?AUTO_5442 ?AUTO_5444 ) ( VISIBLE ?AUTO_5442 ?AUTO_5444 ) ( AT_SOIL_SAMPLE ?AUTO_5442 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5446 ) ( STORE_OF ?AUTO_5447 ?AUTO_5446 ) ( CAN_TRAVERSE ?AUTO_5446 ?AUTO_5443 ?AUTO_5442 ) ( VISIBLE ?AUTO_5443 ?AUTO_5442 ) ( not ( = ?AUTO_5442 ?AUTO_5443 ) ) ( not ( = ?AUTO_5445 ?AUTO_5443 ) ) ( not ( = ?AUTO_5444 ?AUTO_5443 ) ) ( CAN_TRAVERSE ?AUTO_5446 ?AUTO_5449 ?AUTO_5443 ) ( AT ?AUTO_5446 ?AUTO_5449 ) ( VISIBLE ?AUTO_5449 ?AUTO_5443 ) ( not ( = ?AUTO_5442 ?AUTO_5449 ) ) ( not ( = ?AUTO_5445 ?AUTO_5449 ) ) ( not ( = ?AUTO_5444 ?AUTO_5449 ) ) ( not ( = ?AUTO_5443 ?AUTO_5449 ) ) ( AT_ROCK_SAMPLE ?AUTO_5449 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5446 ) ( EMPTY ?AUTO_5447 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5446 ?AUTO_5447 ?AUTO_5449 )
      ( GET_SOIL_DATA ?AUTO_5442 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5442 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5457 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5463 - LANDER
      ?AUTO_5462 - WAYPOINT
      ?AUTO_5460 - WAYPOINT
      ?AUTO_5459 - ROVER
      ?AUTO_5461 - STORE
      ?AUTO_5458 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5463 ?AUTO_5462 ) ( VISIBLE ?AUTO_5460 ?AUTO_5462 ) ( AVAILABLE ?AUTO_5459 ) ( CHANNEL_FREE ?AUTO_5463 ) ( not ( = ?AUTO_5457 ?AUTO_5460 ) ) ( not ( = ?AUTO_5457 ?AUTO_5462 ) ) ( not ( = ?AUTO_5460 ?AUTO_5462 ) ) ( CAN_TRAVERSE ?AUTO_5459 ?AUTO_5457 ?AUTO_5460 ) ( VISIBLE ?AUTO_5457 ?AUTO_5460 ) ( AT_SOIL_SAMPLE ?AUTO_5457 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5459 ) ( STORE_OF ?AUTO_5461 ?AUTO_5459 ) ( CAN_TRAVERSE ?AUTO_5459 ?AUTO_5458 ?AUTO_5457 ) ( VISIBLE ?AUTO_5458 ?AUTO_5457 ) ( not ( = ?AUTO_5457 ?AUTO_5458 ) ) ( not ( = ?AUTO_5462 ?AUTO_5458 ) ) ( not ( = ?AUTO_5460 ?AUTO_5458 ) ) ( FULL ?AUTO_5461 ) ( CAN_TRAVERSE ?AUTO_5459 ?AUTO_5460 ?AUTO_5458 ) ( AT ?AUTO_5459 ?AUTO_5460 ) ( VISIBLE ?AUTO_5460 ?AUTO_5458 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5459 ?AUTO_5460 ?AUTO_5458 )
      ( GET_SOIL_DATA ?AUTO_5457 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5457 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5465 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5466 - LANDER
      ?AUTO_5471 - WAYPOINT
      ?AUTO_5470 - WAYPOINT
      ?AUTO_5469 - ROVER
      ?AUTO_5467 - STORE
      ?AUTO_5468 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5466 ?AUTO_5471 ) ( VISIBLE ?AUTO_5470 ?AUTO_5471 ) ( AVAILABLE ?AUTO_5469 ) ( CHANNEL_FREE ?AUTO_5466 ) ( not ( = ?AUTO_5465 ?AUTO_5470 ) ) ( not ( = ?AUTO_5465 ?AUTO_5471 ) ) ( not ( = ?AUTO_5470 ?AUTO_5471 ) ) ( CAN_TRAVERSE ?AUTO_5469 ?AUTO_5465 ?AUTO_5470 ) ( VISIBLE ?AUTO_5465 ?AUTO_5470 ) ( AT_SOIL_SAMPLE ?AUTO_5465 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5469 ) ( STORE_OF ?AUTO_5467 ?AUTO_5469 ) ( CAN_TRAVERSE ?AUTO_5469 ?AUTO_5468 ?AUTO_5465 ) ( VISIBLE ?AUTO_5468 ?AUTO_5465 ) ( not ( = ?AUTO_5465 ?AUTO_5468 ) ) ( not ( = ?AUTO_5471 ?AUTO_5468 ) ) ( not ( = ?AUTO_5470 ?AUTO_5468 ) ) ( CAN_TRAVERSE ?AUTO_5469 ?AUTO_5470 ?AUTO_5468 ) ( AT ?AUTO_5469 ?AUTO_5470 ) ( VISIBLE ?AUTO_5470 ?AUTO_5468 ) ( AT_ROCK_SAMPLE ?AUTO_5470 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5469 ) ( EMPTY ?AUTO_5467 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5469 ?AUTO_5467 ?AUTO_5470 )
      ( GET_SOIL_DATA ?AUTO_5465 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5465 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5492 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5493 - LANDER
      ?AUTO_5495 - WAYPOINT
      ?AUTO_5496 - ROVER
      ?AUTO_5494 - STORE
      ?AUTO_5497 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5493 ?AUTO_5492 ) ( VISIBLE ?AUTO_5495 ?AUTO_5492 ) ( AVAILABLE ?AUTO_5496 ) ( CHANNEL_FREE ?AUTO_5493 ) ( not ( = ?AUTO_5492 ?AUTO_5495 ) ) ( CAN_TRAVERSE ?AUTO_5496 ?AUTO_5492 ?AUTO_5495 ) ( VISIBLE ?AUTO_5492 ?AUTO_5495 ) ( AT_ROCK_SAMPLE ?AUTO_5492 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5496 ) ( STORE_OF ?AUTO_5494 ?AUTO_5496 ) ( EMPTY ?AUTO_5494 ) ( CAN_TRAVERSE ?AUTO_5496 ?AUTO_5497 ?AUTO_5492 ) ( VISIBLE ?AUTO_5497 ?AUTO_5492 ) ( not ( = ?AUTO_5492 ?AUTO_5497 ) ) ( not ( = ?AUTO_5495 ?AUTO_5497 ) ) ( CAN_TRAVERSE ?AUTO_5496 ?AUTO_5495 ?AUTO_5497 ) ( AT ?AUTO_5496 ?AUTO_5495 ) ( VISIBLE ?AUTO_5495 ?AUTO_5497 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5496 ?AUTO_5495 ?AUTO_5497 )
      ( GET_ROCK_DATA ?AUTO_5492 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5492 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5499 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5500 - LANDER
      ?AUTO_5502 - WAYPOINT
      ?AUTO_5503 - ROVER
      ?AUTO_5504 - STORE
      ?AUTO_5501 - WAYPOINT
      ?AUTO_5505 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5500 ?AUTO_5499 ) ( VISIBLE ?AUTO_5502 ?AUTO_5499 ) ( AVAILABLE ?AUTO_5503 ) ( CHANNEL_FREE ?AUTO_5500 ) ( not ( = ?AUTO_5499 ?AUTO_5502 ) ) ( CAN_TRAVERSE ?AUTO_5503 ?AUTO_5499 ?AUTO_5502 ) ( VISIBLE ?AUTO_5499 ?AUTO_5502 ) ( AT_ROCK_SAMPLE ?AUTO_5499 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5503 ) ( STORE_OF ?AUTO_5504 ?AUTO_5503 ) ( EMPTY ?AUTO_5504 ) ( CAN_TRAVERSE ?AUTO_5503 ?AUTO_5501 ?AUTO_5499 ) ( VISIBLE ?AUTO_5501 ?AUTO_5499 ) ( not ( = ?AUTO_5499 ?AUTO_5501 ) ) ( not ( = ?AUTO_5502 ?AUTO_5501 ) ) ( CAN_TRAVERSE ?AUTO_5503 ?AUTO_5502 ?AUTO_5501 ) ( VISIBLE ?AUTO_5502 ?AUTO_5501 ) ( CAN_TRAVERSE ?AUTO_5503 ?AUTO_5505 ?AUTO_5502 ) ( AT ?AUTO_5503 ?AUTO_5505 ) ( VISIBLE ?AUTO_5505 ?AUTO_5502 ) ( not ( = ?AUTO_5499 ?AUTO_5505 ) ) ( not ( = ?AUTO_5502 ?AUTO_5505 ) ) ( not ( = ?AUTO_5501 ?AUTO_5505 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5503 ?AUTO_5505 ?AUTO_5502 )
      ( GET_ROCK_DATA ?AUTO_5499 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5499 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5506 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5512 - LANDER
      ?AUTO_5509 - WAYPOINT
      ?AUTO_5508 - ROVER
      ?AUTO_5510 - STORE
      ?AUTO_5507 - WAYPOINT
      ?AUTO_5511 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5512 ?AUTO_5506 ) ( VISIBLE ?AUTO_5509 ?AUTO_5506 ) ( AVAILABLE ?AUTO_5508 ) ( CHANNEL_FREE ?AUTO_5512 ) ( not ( = ?AUTO_5506 ?AUTO_5509 ) ) ( CAN_TRAVERSE ?AUTO_5508 ?AUTO_5506 ?AUTO_5509 ) ( VISIBLE ?AUTO_5506 ?AUTO_5509 ) ( AT_ROCK_SAMPLE ?AUTO_5506 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5508 ) ( STORE_OF ?AUTO_5510 ?AUTO_5508 ) ( CAN_TRAVERSE ?AUTO_5508 ?AUTO_5507 ?AUTO_5506 ) ( VISIBLE ?AUTO_5507 ?AUTO_5506 ) ( not ( = ?AUTO_5506 ?AUTO_5507 ) ) ( not ( = ?AUTO_5509 ?AUTO_5507 ) ) ( CAN_TRAVERSE ?AUTO_5508 ?AUTO_5509 ?AUTO_5507 ) ( VISIBLE ?AUTO_5509 ?AUTO_5507 ) ( CAN_TRAVERSE ?AUTO_5508 ?AUTO_5511 ?AUTO_5509 ) ( AT ?AUTO_5508 ?AUTO_5511 ) ( VISIBLE ?AUTO_5511 ?AUTO_5509 ) ( not ( = ?AUTO_5506 ?AUTO_5511 ) ) ( not ( = ?AUTO_5509 ?AUTO_5511 ) ) ( not ( = ?AUTO_5507 ?AUTO_5511 ) ) ( FULL ?AUTO_5510 ) )
    :subtasks
    ( ( !DROP ?AUTO_5508 ?AUTO_5510 )
      ( GET_ROCK_DATA ?AUTO_5506 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5506 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5521 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5523 - LANDER
      ?AUTO_5525 - WAYPOINT
      ?AUTO_5524 - ROVER
      ?AUTO_5522 - STORE
      ?AUTO_5526 - WAYPOINT
      ?AUTO_5527 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5523 ?AUTO_5521 ) ( VISIBLE ?AUTO_5525 ?AUTO_5521 ) ( AVAILABLE ?AUTO_5524 ) ( CHANNEL_FREE ?AUTO_5523 ) ( not ( = ?AUTO_5521 ?AUTO_5525 ) ) ( CAN_TRAVERSE ?AUTO_5524 ?AUTO_5521 ?AUTO_5525 ) ( VISIBLE ?AUTO_5521 ?AUTO_5525 ) ( AT_ROCK_SAMPLE ?AUTO_5521 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5524 ) ( STORE_OF ?AUTO_5522 ?AUTO_5524 ) ( CAN_TRAVERSE ?AUTO_5524 ?AUTO_5526 ?AUTO_5521 ) ( VISIBLE ?AUTO_5526 ?AUTO_5521 ) ( not ( = ?AUTO_5521 ?AUTO_5526 ) ) ( not ( = ?AUTO_5525 ?AUTO_5526 ) ) ( FULL ?AUTO_5522 ) ( CAN_TRAVERSE ?AUTO_5524 ?AUTO_5527 ?AUTO_5526 ) ( AT ?AUTO_5524 ?AUTO_5527 ) ( VISIBLE ?AUTO_5527 ?AUTO_5526 ) ( not ( = ?AUTO_5521 ?AUTO_5527 ) ) ( not ( = ?AUTO_5525 ?AUTO_5527 ) ) ( not ( = ?AUTO_5526 ?AUTO_5527 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5524 ?AUTO_5527 ?AUTO_5526 )
      ( GET_ROCK_DATA ?AUTO_5521 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5521 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5529 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5531 - LANDER
      ?AUTO_5533 - WAYPOINT
      ?AUTO_5530 - ROVER
      ?AUTO_5534 - STORE
      ?AUTO_5532 - WAYPOINT
      ?AUTO_5535 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5531 ?AUTO_5529 ) ( VISIBLE ?AUTO_5533 ?AUTO_5529 ) ( AVAILABLE ?AUTO_5530 ) ( CHANNEL_FREE ?AUTO_5531 ) ( not ( = ?AUTO_5529 ?AUTO_5533 ) ) ( CAN_TRAVERSE ?AUTO_5530 ?AUTO_5529 ?AUTO_5533 ) ( VISIBLE ?AUTO_5529 ?AUTO_5533 ) ( AT_ROCK_SAMPLE ?AUTO_5529 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5530 ) ( STORE_OF ?AUTO_5534 ?AUTO_5530 ) ( CAN_TRAVERSE ?AUTO_5530 ?AUTO_5532 ?AUTO_5529 ) ( VISIBLE ?AUTO_5532 ?AUTO_5529 ) ( not ( = ?AUTO_5529 ?AUTO_5532 ) ) ( not ( = ?AUTO_5533 ?AUTO_5532 ) ) ( CAN_TRAVERSE ?AUTO_5530 ?AUTO_5535 ?AUTO_5532 ) ( AT ?AUTO_5530 ?AUTO_5535 ) ( VISIBLE ?AUTO_5535 ?AUTO_5532 ) ( not ( = ?AUTO_5529 ?AUTO_5535 ) ) ( not ( = ?AUTO_5533 ?AUTO_5535 ) ) ( not ( = ?AUTO_5532 ?AUTO_5535 ) ) ( AT_ROCK_SAMPLE ?AUTO_5535 ) ( EMPTY ?AUTO_5534 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5530 ?AUTO_5534 ?AUTO_5535 )
      ( GET_ROCK_DATA ?AUTO_5529 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5529 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5543 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5546 - LANDER
      ?AUTO_5544 - WAYPOINT
      ?AUTO_5547 - ROVER
      ?AUTO_5545 - STORE
      ?AUTO_5548 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5546 ?AUTO_5543 ) ( VISIBLE ?AUTO_5544 ?AUTO_5543 ) ( AVAILABLE ?AUTO_5547 ) ( CHANNEL_FREE ?AUTO_5546 ) ( not ( = ?AUTO_5543 ?AUTO_5544 ) ) ( CAN_TRAVERSE ?AUTO_5547 ?AUTO_5543 ?AUTO_5544 ) ( VISIBLE ?AUTO_5543 ?AUTO_5544 ) ( AT_ROCK_SAMPLE ?AUTO_5543 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5547 ) ( STORE_OF ?AUTO_5545 ?AUTO_5547 ) ( CAN_TRAVERSE ?AUTO_5547 ?AUTO_5548 ?AUTO_5543 ) ( VISIBLE ?AUTO_5548 ?AUTO_5543 ) ( not ( = ?AUTO_5543 ?AUTO_5548 ) ) ( not ( = ?AUTO_5544 ?AUTO_5548 ) ) ( FULL ?AUTO_5545 ) ( CAN_TRAVERSE ?AUTO_5547 ?AUTO_5544 ?AUTO_5548 ) ( AT ?AUTO_5547 ?AUTO_5544 ) ( VISIBLE ?AUTO_5544 ?AUTO_5548 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5547 ?AUTO_5544 ?AUTO_5548 )
      ( GET_ROCK_DATA ?AUTO_5543 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5543 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5585 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5587 - LANDER
      ?AUTO_5586 - WAYPOINT
      ?AUTO_5588 - ROVER
      ?AUTO_5590 - STORE
      ?AUTO_5589 - WAYPOINT
      ?AUTO_5591 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5587 ?AUTO_5585 ) ( VISIBLE ?AUTO_5586 ?AUTO_5585 ) ( AVAILABLE ?AUTO_5588 ) ( CHANNEL_FREE ?AUTO_5587 ) ( not ( = ?AUTO_5585 ?AUTO_5586 ) ) ( CAN_TRAVERSE ?AUTO_5588 ?AUTO_5585 ?AUTO_5586 ) ( VISIBLE ?AUTO_5585 ?AUTO_5586 ) ( AT_SOIL_SAMPLE ?AUTO_5585 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5588 ) ( STORE_OF ?AUTO_5590 ?AUTO_5588 ) ( FULL ?AUTO_5590 ) ( CAN_TRAVERSE ?AUTO_5588 ?AUTO_5589 ?AUTO_5585 ) ( VISIBLE ?AUTO_5589 ?AUTO_5585 ) ( not ( = ?AUTO_5585 ?AUTO_5589 ) ) ( not ( = ?AUTO_5586 ?AUTO_5589 ) ) ( CAN_TRAVERSE ?AUTO_5588 ?AUTO_5591 ?AUTO_5589 ) ( AT ?AUTO_5588 ?AUTO_5591 ) ( VISIBLE ?AUTO_5591 ?AUTO_5589 ) ( not ( = ?AUTO_5585 ?AUTO_5591 ) ) ( not ( = ?AUTO_5586 ?AUTO_5591 ) ) ( not ( = ?AUTO_5589 ?AUTO_5591 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5588 ?AUTO_5591 ?AUTO_5589 )
      ( GET_SOIL_DATA ?AUTO_5585 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5585 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5593 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5596 - LANDER
      ?AUTO_5598 - WAYPOINT
      ?AUTO_5594 - ROVER
      ?AUTO_5597 - STORE
      ?AUTO_5599 - WAYPOINT
      ?AUTO_5595 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5596 ?AUTO_5593 ) ( VISIBLE ?AUTO_5598 ?AUTO_5593 ) ( AVAILABLE ?AUTO_5594 ) ( CHANNEL_FREE ?AUTO_5596 ) ( not ( = ?AUTO_5593 ?AUTO_5598 ) ) ( CAN_TRAVERSE ?AUTO_5594 ?AUTO_5593 ?AUTO_5598 ) ( VISIBLE ?AUTO_5593 ?AUTO_5598 ) ( AT_SOIL_SAMPLE ?AUTO_5593 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5594 ) ( STORE_OF ?AUTO_5597 ?AUTO_5594 ) ( CAN_TRAVERSE ?AUTO_5594 ?AUTO_5599 ?AUTO_5593 ) ( VISIBLE ?AUTO_5599 ?AUTO_5593 ) ( not ( = ?AUTO_5593 ?AUTO_5599 ) ) ( not ( = ?AUTO_5598 ?AUTO_5599 ) ) ( CAN_TRAVERSE ?AUTO_5594 ?AUTO_5595 ?AUTO_5599 ) ( AT ?AUTO_5594 ?AUTO_5595 ) ( VISIBLE ?AUTO_5595 ?AUTO_5599 ) ( not ( = ?AUTO_5593 ?AUTO_5595 ) ) ( not ( = ?AUTO_5598 ?AUTO_5595 ) ) ( not ( = ?AUTO_5599 ?AUTO_5595 ) ) ( AT_ROCK_SAMPLE ?AUTO_5595 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5594 ) ( EMPTY ?AUTO_5597 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5594 ?AUTO_5597 ?AUTO_5595 )
      ( GET_SOIL_DATA ?AUTO_5593 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5593 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5629 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5630 - LANDER
      ?AUTO_5633 - WAYPOINT
      ?AUTO_5631 - ROVER
      ?AUTO_5632 - STORE
      ?AUTO_5634 - WAYPOINT
      ?AUTO_5635 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5630 ?AUTO_5633 ) ( VISIBLE ?AUTO_5629 ?AUTO_5633 ) ( AVAILABLE ?AUTO_5631 ) ( CHANNEL_FREE ?AUTO_5630 ) ( not ( = ?AUTO_5629 ?AUTO_5633 ) ) ( AT_ROCK_SAMPLE ?AUTO_5629 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5631 ) ( STORE_OF ?AUTO_5632 ?AUTO_5631 ) ( CAN_TRAVERSE ?AUTO_5631 ?AUTO_5633 ?AUTO_5629 ) ( VISIBLE ?AUTO_5633 ?AUTO_5629 ) ( FULL ?AUTO_5632 ) ( CAN_TRAVERSE ?AUTO_5631 ?AUTO_5634 ?AUTO_5633 ) ( VISIBLE ?AUTO_5634 ?AUTO_5633 ) ( not ( = ?AUTO_5629 ?AUTO_5634 ) ) ( not ( = ?AUTO_5633 ?AUTO_5634 ) ) ( CAN_TRAVERSE ?AUTO_5631 ?AUTO_5635 ?AUTO_5634 ) ( AT ?AUTO_5631 ?AUTO_5635 ) ( VISIBLE ?AUTO_5635 ?AUTO_5634 ) ( not ( = ?AUTO_5629 ?AUTO_5635 ) ) ( not ( = ?AUTO_5633 ?AUTO_5635 ) ) ( not ( = ?AUTO_5634 ?AUTO_5635 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5631 ?AUTO_5635 ?AUTO_5634 )
      ( GET_ROCK_DATA ?AUTO_5629 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5629 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5637 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5641 - LANDER
      ?AUTO_5639 - WAYPOINT
      ?AUTO_5640 - ROVER
      ?AUTO_5638 - STORE
      ?AUTO_5643 - WAYPOINT
      ?AUTO_5642 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5641 ?AUTO_5639 ) ( VISIBLE ?AUTO_5637 ?AUTO_5639 ) ( AVAILABLE ?AUTO_5640 ) ( CHANNEL_FREE ?AUTO_5641 ) ( not ( = ?AUTO_5637 ?AUTO_5639 ) ) ( AT_ROCK_SAMPLE ?AUTO_5637 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5640 ) ( STORE_OF ?AUTO_5638 ?AUTO_5640 ) ( CAN_TRAVERSE ?AUTO_5640 ?AUTO_5639 ?AUTO_5637 ) ( VISIBLE ?AUTO_5639 ?AUTO_5637 ) ( CAN_TRAVERSE ?AUTO_5640 ?AUTO_5643 ?AUTO_5639 ) ( VISIBLE ?AUTO_5643 ?AUTO_5639 ) ( not ( = ?AUTO_5637 ?AUTO_5643 ) ) ( not ( = ?AUTO_5639 ?AUTO_5643 ) ) ( CAN_TRAVERSE ?AUTO_5640 ?AUTO_5642 ?AUTO_5643 ) ( AT ?AUTO_5640 ?AUTO_5642 ) ( VISIBLE ?AUTO_5642 ?AUTO_5643 ) ( not ( = ?AUTO_5637 ?AUTO_5642 ) ) ( not ( = ?AUTO_5639 ?AUTO_5642 ) ) ( not ( = ?AUTO_5643 ?AUTO_5642 ) ) ( AT_ROCK_SAMPLE ?AUTO_5642 ) ( EMPTY ?AUTO_5638 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5640 ?AUTO_5638 ?AUTO_5642 )
      ( GET_ROCK_DATA ?AUTO_5637 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5637 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5692 - OBJECTIVE
      ?AUTO_5693 - MODE
    )
    :vars
    (
      ?AUTO_5695 - LANDER
      ?AUTO_5694 - WAYPOINT
      ?AUTO_5699 - WAYPOINT
      ?AUTO_5696 - ROVER
      ?AUTO_5697 - WAYPOINT
      ?AUTO_5701 - CAMERA
      ?AUTO_5698 - OBJECTIVE
      ?AUTO_5700 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5695 ?AUTO_5694 ) ( VISIBLE ?AUTO_5699 ?AUTO_5694 ) ( AVAILABLE ?AUTO_5696 ) ( CHANNEL_FREE ?AUTO_5695 ) ( not ( = ?AUTO_5699 ?AUTO_5694 ) ) ( CAN_TRAVERSE ?AUTO_5696 ?AUTO_5697 ?AUTO_5699 ) ( VISIBLE ?AUTO_5697 ?AUTO_5699 ) ( not ( = ?AUTO_5694 ?AUTO_5697 ) ) ( not ( = ?AUTO_5699 ?AUTO_5697 ) ) ( ON_BOARD ?AUTO_5701 ?AUTO_5696 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5696 ) ( SUPPORTS ?AUTO_5701 ?AUTO_5693 ) ( VISIBLE_FROM ?AUTO_5692 ?AUTO_5697 ) ( CALIBRATION_TARGET ?AUTO_5701 ?AUTO_5698 ) ( VISIBLE_FROM ?AUTO_5698 ?AUTO_5697 ) ( not ( = ?AUTO_5692 ?AUTO_5698 ) ) ( CAN_TRAVERSE ?AUTO_5696 ?AUTO_5700 ?AUTO_5697 ) ( VISIBLE ?AUTO_5700 ?AUTO_5697 ) ( not ( = ?AUTO_5694 ?AUTO_5700 ) ) ( not ( = ?AUTO_5699 ?AUTO_5700 ) ) ( not ( = ?AUTO_5697 ?AUTO_5700 ) ) ( CAN_TRAVERSE ?AUTO_5696 ?AUTO_5694 ?AUTO_5700 ) ( AT ?AUTO_5696 ?AUTO_5694 ) ( VISIBLE ?AUTO_5694 ?AUTO_5700 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5696 ?AUTO_5694 ?AUTO_5700 )
      ( GET_IMAGE_DATA ?AUTO_5692 ?AUTO_5693 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5692 ?AUTO_5693 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5708 - OBJECTIVE
      ?AUTO_5709 - MODE
    )
    :vars
    (
      ?AUTO_5717 - LANDER
      ?AUTO_5713 - WAYPOINT
      ?AUTO_5710 - WAYPOINT
      ?AUTO_5716 - ROVER
      ?AUTO_5711 - WAYPOINT
      ?AUTO_5714 - CAMERA
      ?AUTO_5712 - OBJECTIVE
      ?AUTO_5715 - WAYPOINT
      ?AUTO_5718 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5717 ?AUTO_5713 ) ( VISIBLE ?AUTO_5710 ?AUTO_5713 ) ( AVAILABLE ?AUTO_5716 ) ( CHANNEL_FREE ?AUTO_5717 ) ( not ( = ?AUTO_5710 ?AUTO_5713 ) ) ( CAN_TRAVERSE ?AUTO_5716 ?AUTO_5711 ?AUTO_5710 ) ( VISIBLE ?AUTO_5711 ?AUTO_5710 ) ( not ( = ?AUTO_5713 ?AUTO_5711 ) ) ( not ( = ?AUTO_5710 ?AUTO_5711 ) ) ( ON_BOARD ?AUTO_5714 ?AUTO_5716 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5716 ) ( SUPPORTS ?AUTO_5714 ?AUTO_5709 ) ( VISIBLE_FROM ?AUTO_5708 ?AUTO_5711 ) ( CALIBRATION_TARGET ?AUTO_5714 ?AUTO_5712 ) ( VISIBLE_FROM ?AUTO_5712 ?AUTO_5711 ) ( not ( = ?AUTO_5708 ?AUTO_5712 ) ) ( CAN_TRAVERSE ?AUTO_5716 ?AUTO_5715 ?AUTO_5711 ) ( VISIBLE ?AUTO_5715 ?AUTO_5711 ) ( not ( = ?AUTO_5713 ?AUTO_5715 ) ) ( not ( = ?AUTO_5710 ?AUTO_5715 ) ) ( not ( = ?AUTO_5711 ?AUTO_5715 ) ) ( CAN_TRAVERSE ?AUTO_5716 ?AUTO_5713 ?AUTO_5715 ) ( VISIBLE ?AUTO_5713 ?AUTO_5715 ) ( CAN_TRAVERSE ?AUTO_5716 ?AUTO_5718 ?AUTO_5713 ) ( AT ?AUTO_5716 ?AUTO_5718 ) ( VISIBLE ?AUTO_5718 ?AUTO_5713 ) ( not ( = ?AUTO_5713 ?AUTO_5718 ) ) ( not ( = ?AUTO_5710 ?AUTO_5718 ) ) ( not ( = ?AUTO_5711 ?AUTO_5718 ) ) ( not ( = ?AUTO_5715 ?AUTO_5718 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5716 ?AUTO_5718 ?AUTO_5713 )
      ( GET_IMAGE_DATA ?AUTO_5708 ?AUTO_5709 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5708 ?AUTO_5709 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5719 - OBJECTIVE
      ?AUTO_5720 - MODE
    )
    :vars
    (
      ?AUTO_5727 - LANDER
      ?AUTO_5723 - WAYPOINT
      ?AUTO_5729 - WAYPOINT
      ?AUTO_5728 - ROVER
      ?AUTO_5721 - WAYPOINT
      ?AUTO_5726 - CAMERA
      ?AUTO_5722 - OBJECTIVE
      ?AUTO_5724 - WAYPOINT
      ?AUTO_5725 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5727 ?AUTO_5723 ) ( VISIBLE ?AUTO_5729 ?AUTO_5723 ) ( AVAILABLE ?AUTO_5728 ) ( CHANNEL_FREE ?AUTO_5727 ) ( not ( = ?AUTO_5729 ?AUTO_5723 ) ) ( CAN_TRAVERSE ?AUTO_5728 ?AUTO_5721 ?AUTO_5729 ) ( VISIBLE ?AUTO_5721 ?AUTO_5729 ) ( not ( = ?AUTO_5723 ?AUTO_5721 ) ) ( not ( = ?AUTO_5729 ?AUTO_5721 ) ) ( ON_BOARD ?AUTO_5726 ?AUTO_5728 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5728 ) ( SUPPORTS ?AUTO_5726 ?AUTO_5720 ) ( VISIBLE_FROM ?AUTO_5719 ?AUTO_5721 ) ( CALIBRATION_TARGET ?AUTO_5726 ?AUTO_5722 ) ( VISIBLE_FROM ?AUTO_5722 ?AUTO_5721 ) ( not ( = ?AUTO_5719 ?AUTO_5722 ) ) ( CAN_TRAVERSE ?AUTO_5728 ?AUTO_5724 ?AUTO_5721 ) ( VISIBLE ?AUTO_5724 ?AUTO_5721 ) ( not ( = ?AUTO_5723 ?AUTO_5724 ) ) ( not ( = ?AUTO_5729 ?AUTO_5724 ) ) ( not ( = ?AUTO_5721 ?AUTO_5724 ) ) ( CAN_TRAVERSE ?AUTO_5728 ?AUTO_5723 ?AUTO_5724 ) ( VISIBLE ?AUTO_5723 ?AUTO_5724 ) ( CAN_TRAVERSE ?AUTO_5728 ?AUTO_5725 ?AUTO_5723 ) ( VISIBLE ?AUTO_5725 ?AUTO_5723 ) ( not ( = ?AUTO_5723 ?AUTO_5725 ) ) ( not ( = ?AUTO_5729 ?AUTO_5725 ) ) ( not ( = ?AUTO_5721 ?AUTO_5725 ) ) ( not ( = ?AUTO_5724 ?AUTO_5725 ) ) ( CAN_TRAVERSE ?AUTO_5728 ?AUTO_5729 ?AUTO_5725 ) ( AT ?AUTO_5728 ?AUTO_5729 ) ( VISIBLE ?AUTO_5729 ?AUTO_5725 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5728 ?AUTO_5729 ?AUTO_5725 )
      ( GET_IMAGE_DATA ?AUTO_5719 ?AUTO_5720 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5719 ?AUTO_5720 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5767 - OBJECTIVE
      ?AUTO_5768 - MODE
    )
    :vars
    (
      ?AUTO_5771 - LANDER
      ?AUTO_5772 - WAYPOINT
      ?AUTO_5774 - WAYPOINT
      ?AUTO_5770 - ROVER
      ?AUTO_5769 - CAMERA
      ?AUTO_5773 - OBJECTIVE
      ?AUTO_5775 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5771 ?AUTO_5772 ) ( VISIBLE ?AUTO_5774 ?AUTO_5772 ) ( AVAILABLE ?AUTO_5770 ) ( CHANNEL_FREE ?AUTO_5771 ) ( not ( = ?AUTO_5774 ?AUTO_5772 ) ) ( ON_BOARD ?AUTO_5769 ?AUTO_5770 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5770 ) ( SUPPORTS ?AUTO_5769 ?AUTO_5768 ) ( VISIBLE_FROM ?AUTO_5767 ?AUTO_5774 ) ( CALIBRATION_TARGET ?AUTO_5769 ?AUTO_5773 ) ( VISIBLE_FROM ?AUTO_5773 ?AUTO_5774 ) ( not ( = ?AUTO_5767 ?AUTO_5773 ) ) ( CAN_TRAVERSE ?AUTO_5770 ?AUTO_5772 ?AUTO_5774 ) ( VISIBLE ?AUTO_5772 ?AUTO_5774 ) ( CAN_TRAVERSE ?AUTO_5770 ?AUTO_5775 ?AUTO_5772 ) ( AT ?AUTO_5770 ?AUTO_5775 ) ( VISIBLE ?AUTO_5775 ?AUTO_5772 ) ( not ( = ?AUTO_5772 ?AUTO_5775 ) ) ( not ( = ?AUTO_5774 ?AUTO_5775 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5770 ?AUTO_5775 ?AUTO_5772 )
      ( GET_IMAGE_DATA ?AUTO_5767 ?AUTO_5768 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5767 ?AUTO_5768 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5808 - OBJECTIVE
      ?AUTO_5809 - MODE
    )
    :vars
    (
      ?AUTO_5814 - LANDER
      ?AUTO_5810 - WAYPOINT
      ?AUTO_5815 - WAYPOINT
      ?AUTO_5811 - ROVER
      ?AUTO_5812 - CAMERA
      ?AUTO_5813 - WAYPOINT
      ?AUTO_5816 - OBJECTIVE
      ?AUTO_5817 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5814 ?AUTO_5810 ) ( VISIBLE ?AUTO_5815 ?AUTO_5810 ) ( AVAILABLE ?AUTO_5811 ) ( CHANNEL_FREE ?AUTO_5814 ) ( not ( = ?AUTO_5815 ?AUTO_5810 ) ) ( ON_BOARD ?AUTO_5812 ?AUTO_5811 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5811 ) ( SUPPORTS ?AUTO_5812 ?AUTO_5809 ) ( VISIBLE_FROM ?AUTO_5808 ?AUTO_5815 ) ( CAN_TRAVERSE ?AUTO_5811 ?AUTO_5813 ?AUTO_5815 ) ( VISIBLE ?AUTO_5813 ?AUTO_5815 ) ( not ( = ?AUTO_5810 ?AUTO_5813 ) ) ( not ( = ?AUTO_5815 ?AUTO_5813 ) ) ( CALIBRATION_TARGET ?AUTO_5812 ?AUTO_5816 ) ( VISIBLE_FROM ?AUTO_5816 ?AUTO_5813 ) ( not ( = ?AUTO_5808 ?AUTO_5816 ) ) ( CAN_TRAVERSE ?AUTO_5811 ?AUTO_5817 ?AUTO_5813 ) ( AT ?AUTO_5811 ?AUTO_5817 ) ( VISIBLE ?AUTO_5817 ?AUTO_5813 ) ( not ( = ?AUTO_5810 ?AUTO_5817 ) ) ( not ( = ?AUTO_5815 ?AUTO_5817 ) ) ( not ( = ?AUTO_5813 ?AUTO_5817 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5811 ?AUTO_5817 ?AUTO_5813 )
      ( GET_IMAGE_DATA ?AUTO_5808 ?AUTO_5809 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5808 ?AUTO_5809 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5879 - OBJECTIVE
      ?AUTO_5878 - MODE
    )
    :vars
    (
      ?AUTO_5881 - LANDER
      ?AUTO_5886 - WAYPOINT
      ?AUTO_5882 - WAYPOINT
      ?AUTO_5885 - ROVER
      ?AUTO_5883 - CAMERA
      ?AUTO_5880 - WAYPOINT
      ?AUTO_5884 - WAYPOINT
      ?AUTO_5887 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5881 ?AUTO_5886 ) ( VISIBLE ?AUTO_5882 ?AUTO_5886 ) ( AVAILABLE ?AUTO_5885 ) ( CHANNEL_FREE ?AUTO_5881 ) ( not ( = ?AUTO_5882 ?AUTO_5886 ) ) ( CALIBRATED ?AUTO_5883 ?AUTO_5885 ) ( ON_BOARD ?AUTO_5883 ?AUTO_5885 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5885 ) ( SUPPORTS ?AUTO_5883 ?AUTO_5878 ) ( VISIBLE_FROM ?AUTO_5879 ?AUTO_5882 ) ( CAN_TRAVERSE ?AUTO_5885 ?AUTO_5880 ?AUTO_5882 ) ( VISIBLE ?AUTO_5880 ?AUTO_5882 ) ( not ( = ?AUTO_5886 ?AUTO_5880 ) ) ( not ( = ?AUTO_5882 ?AUTO_5880 ) ) ( CAN_TRAVERSE ?AUTO_5885 ?AUTO_5884 ?AUTO_5880 ) ( VISIBLE ?AUTO_5884 ?AUTO_5880 ) ( not ( = ?AUTO_5886 ?AUTO_5884 ) ) ( not ( = ?AUTO_5882 ?AUTO_5884 ) ) ( not ( = ?AUTO_5880 ?AUTO_5884 ) ) ( CAN_TRAVERSE ?AUTO_5885 ?AUTO_5887 ?AUTO_5884 ) ( AT ?AUTO_5885 ?AUTO_5887 ) ( VISIBLE ?AUTO_5887 ?AUTO_5884 ) ( not ( = ?AUTO_5886 ?AUTO_5887 ) ) ( not ( = ?AUTO_5882 ?AUTO_5887 ) ) ( not ( = ?AUTO_5880 ?AUTO_5887 ) ) ( not ( = ?AUTO_5884 ?AUTO_5887 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5885 ?AUTO_5887 ?AUTO_5884 )
      ( GET_IMAGE_DATA ?AUTO_5879 ?AUTO_5878 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5879 ?AUTO_5878 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5889 - OBJECTIVE
      ?AUTO_5888 - MODE
    )
    :vars
    (
      ?AUTO_5890 - LANDER
      ?AUTO_5895 - WAYPOINT
      ?AUTO_5892 - WAYPOINT
      ?AUTO_5891 - ROVER
      ?AUTO_5894 - CAMERA
      ?AUTO_5896 - WAYPOINT
      ?AUTO_5893 - WAYPOINT
      ?AUTO_5897 - WAYPOINT
      ?AUTO_5898 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5890 ?AUTO_5895 ) ( VISIBLE ?AUTO_5892 ?AUTO_5895 ) ( AVAILABLE ?AUTO_5891 ) ( CHANNEL_FREE ?AUTO_5890 ) ( not ( = ?AUTO_5892 ?AUTO_5895 ) ) ( ON_BOARD ?AUTO_5894 ?AUTO_5891 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5891 ) ( SUPPORTS ?AUTO_5894 ?AUTO_5888 ) ( VISIBLE_FROM ?AUTO_5889 ?AUTO_5892 ) ( CAN_TRAVERSE ?AUTO_5891 ?AUTO_5896 ?AUTO_5892 ) ( VISIBLE ?AUTO_5896 ?AUTO_5892 ) ( not ( = ?AUTO_5895 ?AUTO_5896 ) ) ( not ( = ?AUTO_5892 ?AUTO_5896 ) ) ( CAN_TRAVERSE ?AUTO_5891 ?AUTO_5893 ?AUTO_5896 ) ( VISIBLE ?AUTO_5893 ?AUTO_5896 ) ( not ( = ?AUTO_5895 ?AUTO_5893 ) ) ( not ( = ?AUTO_5892 ?AUTO_5893 ) ) ( not ( = ?AUTO_5896 ?AUTO_5893 ) ) ( CAN_TRAVERSE ?AUTO_5891 ?AUTO_5897 ?AUTO_5893 ) ( AT ?AUTO_5891 ?AUTO_5897 ) ( VISIBLE ?AUTO_5897 ?AUTO_5893 ) ( not ( = ?AUTO_5895 ?AUTO_5897 ) ) ( not ( = ?AUTO_5892 ?AUTO_5897 ) ) ( not ( = ?AUTO_5896 ?AUTO_5897 ) ) ( not ( = ?AUTO_5893 ?AUTO_5897 ) ) ( CALIBRATION_TARGET ?AUTO_5894 ?AUTO_5898 ) ( VISIBLE_FROM ?AUTO_5898 ?AUTO_5897 ) ( not ( = ?AUTO_5889 ?AUTO_5898 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5891 ?AUTO_5894 ?AUTO_5898 ?AUTO_5897 )
      ( GET_IMAGE_DATA ?AUTO_5889 ?AUTO_5888 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5889 ?AUTO_5888 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5900 - OBJECTIVE
      ?AUTO_5899 - MODE
    )
    :vars
    (
      ?AUTO_5906 - LANDER
      ?AUTO_5907 - WAYPOINT
      ?AUTO_5902 - WAYPOINT
      ?AUTO_5904 - ROVER
      ?AUTO_5901 - CAMERA
      ?AUTO_5905 - WAYPOINT
      ?AUTO_5908 - WAYPOINT
      ?AUTO_5903 - WAYPOINT
      ?AUTO_5909 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5906 ?AUTO_5907 ) ( VISIBLE ?AUTO_5902 ?AUTO_5907 ) ( AVAILABLE ?AUTO_5904 ) ( CHANNEL_FREE ?AUTO_5906 ) ( not ( = ?AUTO_5902 ?AUTO_5907 ) ) ( ON_BOARD ?AUTO_5901 ?AUTO_5904 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5904 ) ( SUPPORTS ?AUTO_5901 ?AUTO_5899 ) ( VISIBLE_FROM ?AUTO_5900 ?AUTO_5902 ) ( CAN_TRAVERSE ?AUTO_5904 ?AUTO_5905 ?AUTO_5902 ) ( VISIBLE ?AUTO_5905 ?AUTO_5902 ) ( not ( = ?AUTO_5907 ?AUTO_5905 ) ) ( not ( = ?AUTO_5902 ?AUTO_5905 ) ) ( CAN_TRAVERSE ?AUTO_5904 ?AUTO_5908 ?AUTO_5905 ) ( VISIBLE ?AUTO_5908 ?AUTO_5905 ) ( not ( = ?AUTO_5907 ?AUTO_5908 ) ) ( not ( = ?AUTO_5902 ?AUTO_5908 ) ) ( not ( = ?AUTO_5905 ?AUTO_5908 ) ) ( CAN_TRAVERSE ?AUTO_5904 ?AUTO_5903 ?AUTO_5908 ) ( VISIBLE ?AUTO_5903 ?AUTO_5908 ) ( not ( = ?AUTO_5907 ?AUTO_5903 ) ) ( not ( = ?AUTO_5902 ?AUTO_5903 ) ) ( not ( = ?AUTO_5905 ?AUTO_5903 ) ) ( not ( = ?AUTO_5908 ?AUTO_5903 ) ) ( CALIBRATION_TARGET ?AUTO_5901 ?AUTO_5909 ) ( VISIBLE_FROM ?AUTO_5909 ?AUTO_5903 ) ( not ( = ?AUTO_5900 ?AUTO_5909 ) ) ( CAN_TRAVERSE ?AUTO_5904 ?AUTO_5905 ?AUTO_5903 ) ( AT ?AUTO_5904 ?AUTO_5905 ) ( VISIBLE ?AUTO_5905 ?AUTO_5903 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5904 ?AUTO_5905 ?AUTO_5903 )
      ( GET_IMAGE_DATA ?AUTO_5900 ?AUTO_5899 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5900 ?AUTO_5899 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5921 - OBJECTIVE
      ?AUTO_5920 - MODE
    )
    :vars
    (
      ?AUTO_5924 - LANDER
      ?AUTO_5929 - WAYPOINT
      ?AUTO_5927 - WAYPOINT
      ?AUTO_5925 - ROVER
      ?AUTO_5922 - CAMERA
      ?AUTO_5930 - WAYPOINT
      ?AUTO_5928 - WAYPOINT
      ?AUTO_5926 - WAYPOINT
      ?AUTO_5923 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5924 ?AUTO_5929 ) ( VISIBLE ?AUTO_5927 ?AUTO_5929 ) ( AVAILABLE ?AUTO_5925 ) ( CHANNEL_FREE ?AUTO_5924 ) ( not ( = ?AUTO_5927 ?AUTO_5929 ) ) ( ON_BOARD ?AUTO_5922 ?AUTO_5925 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5925 ) ( SUPPORTS ?AUTO_5922 ?AUTO_5920 ) ( VISIBLE_FROM ?AUTO_5921 ?AUTO_5927 ) ( CAN_TRAVERSE ?AUTO_5925 ?AUTO_5930 ?AUTO_5927 ) ( VISIBLE ?AUTO_5930 ?AUTO_5927 ) ( not ( = ?AUTO_5929 ?AUTO_5930 ) ) ( not ( = ?AUTO_5927 ?AUTO_5930 ) ) ( CAN_TRAVERSE ?AUTO_5925 ?AUTO_5928 ?AUTO_5930 ) ( VISIBLE ?AUTO_5928 ?AUTO_5930 ) ( not ( = ?AUTO_5929 ?AUTO_5928 ) ) ( not ( = ?AUTO_5927 ?AUTO_5928 ) ) ( not ( = ?AUTO_5930 ?AUTO_5928 ) ) ( CAN_TRAVERSE ?AUTO_5925 ?AUTO_5926 ?AUTO_5928 ) ( VISIBLE ?AUTO_5926 ?AUTO_5928 ) ( not ( = ?AUTO_5929 ?AUTO_5926 ) ) ( not ( = ?AUTO_5927 ?AUTO_5926 ) ) ( not ( = ?AUTO_5930 ?AUTO_5926 ) ) ( not ( = ?AUTO_5928 ?AUTO_5926 ) ) ( CALIBRATION_TARGET ?AUTO_5922 ?AUTO_5923 ) ( VISIBLE_FROM ?AUTO_5923 ?AUTO_5926 ) ( not ( = ?AUTO_5921 ?AUTO_5923 ) ) ( CAN_TRAVERSE ?AUTO_5925 ?AUTO_5930 ?AUTO_5926 ) ( VISIBLE ?AUTO_5930 ?AUTO_5926 ) ( CAN_TRAVERSE ?AUTO_5925 ?AUTO_5927 ?AUTO_5930 ) ( AT ?AUTO_5925 ?AUTO_5927 ) ( VISIBLE ?AUTO_5927 ?AUTO_5930 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5925 ?AUTO_5927 ?AUTO_5930 )
      ( GET_IMAGE_DATA ?AUTO_5921 ?AUTO_5920 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5921 ?AUTO_5920 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6030 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6036 - LANDER
      ?AUTO_6032 - WAYPOINT
      ?AUTO_6033 - WAYPOINT
      ?AUTO_6034 - ROVER
      ?AUTO_6035 - STORE
      ?AUTO_6031 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6036 ?AUTO_6032 ) ( VISIBLE ?AUTO_6033 ?AUTO_6032 ) ( AVAILABLE ?AUTO_6034 ) ( CHANNEL_FREE ?AUTO_6036 ) ( not ( = ?AUTO_6030 ?AUTO_6033 ) ) ( not ( = ?AUTO_6030 ?AUTO_6032 ) ) ( not ( = ?AUTO_6033 ?AUTO_6032 ) ) ( CAN_TRAVERSE ?AUTO_6034 ?AUTO_6030 ?AUTO_6033 ) ( VISIBLE ?AUTO_6030 ?AUTO_6033 ) ( AT_SOIL_SAMPLE ?AUTO_6030 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6034 ) ( STORE_OF ?AUTO_6035 ?AUTO_6034 ) ( CAN_TRAVERSE ?AUTO_6034 ?AUTO_6033 ?AUTO_6030 ) ( VISIBLE ?AUTO_6033 ?AUTO_6030 ) ( CAN_TRAVERSE ?AUTO_6034 ?AUTO_6031 ?AUTO_6033 ) ( AT ?AUTO_6034 ?AUTO_6031 ) ( VISIBLE ?AUTO_6031 ?AUTO_6033 ) ( not ( = ?AUTO_6030 ?AUTO_6031 ) ) ( not ( = ?AUTO_6032 ?AUTO_6031 ) ) ( not ( = ?AUTO_6033 ?AUTO_6031 ) ) ( AT_SOIL_SAMPLE ?AUTO_6031 ) ( EMPTY ?AUTO_6035 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6034 ?AUTO_6035 ?AUTO_6031 )
      ( GET_SOIL_DATA ?AUTO_6030 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6030 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6079 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6081 - LANDER
      ?AUTO_6082 - WAYPOINT
      ?AUTO_6080 - WAYPOINT
      ?AUTO_6084 - ROVER
      ?AUTO_6083 - STORE
      ?AUTO_6085 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6081 ?AUTO_6082 ) ( VISIBLE ?AUTO_6080 ?AUTO_6082 ) ( AVAILABLE ?AUTO_6084 ) ( CHANNEL_FREE ?AUTO_6081 ) ( not ( = ?AUTO_6079 ?AUTO_6080 ) ) ( not ( = ?AUTO_6079 ?AUTO_6082 ) ) ( not ( = ?AUTO_6080 ?AUTO_6082 ) ) ( CAN_TRAVERSE ?AUTO_6084 ?AUTO_6079 ?AUTO_6080 ) ( VISIBLE ?AUTO_6079 ?AUTO_6080 ) ( AT_ROCK_SAMPLE ?AUTO_6079 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6084 ) ( STORE_OF ?AUTO_6083 ?AUTO_6084 ) ( CAN_TRAVERSE ?AUTO_6084 ?AUTO_6080 ?AUTO_6079 ) ( VISIBLE ?AUTO_6080 ?AUTO_6079 ) ( FULL ?AUTO_6083 ) ( CAN_TRAVERSE ?AUTO_6084 ?AUTO_6085 ?AUTO_6080 ) ( AT ?AUTO_6084 ?AUTO_6085 ) ( VISIBLE ?AUTO_6085 ?AUTO_6080 ) ( not ( = ?AUTO_6079 ?AUTO_6085 ) ) ( not ( = ?AUTO_6082 ?AUTO_6085 ) ) ( not ( = ?AUTO_6080 ?AUTO_6085 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6084 ?AUTO_6085 ?AUTO_6080 )
      ( GET_ROCK_DATA ?AUTO_6079 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6079 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6095 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6096 - LANDER
      ?AUTO_6097 - WAYPOINT
      ?AUTO_6100 - WAYPOINT
      ?AUTO_6101 - ROVER
      ?AUTO_6098 - STORE
      ?AUTO_6099 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6096 ?AUTO_6097 ) ( VISIBLE ?AUTO_6100 ?AUTO_6097 ) ( AVAILABLE ?AUTO_6101 ) ( CHANNEL_FREE ?AUTO_6096 ) ( not ( = ?AUTO_6095 ?AUTO_6100 ) ) ( not ( = ?AUTO_6095 ?AUTO_6097 ) ) ( not ( = ?AUTO_6100 ?AUTO_6097 ) ) ( CAN_TRAVERSE ?AUTO_6101 ?AUTO_6095 ?AUTO_6100 ) ( VISIBLE ?AUTO_6095 ?AUTO_6100 ) ( AT_ROCK_SAMPLE ?AUTO_6095 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6101 ) ( STORE_OF ?AUTO_6098 ?AUTO_6101 ) ( CAN_TRAVERSE ?AUTO_6101 ?AUTO_6100 ?AUTO_6095 ) ( VISIBLE ?AUTO_6100 ?AUTO_6095 ) ( CAN_TRAVERSE ?AUTO_6101 ?AUTO_6099 ?AUTO_6100 ) ( AT ?AUTO_6101 ?AUTO_6099 ) ( VISIBLE ?AUTO_6099 ?AUTO_6100 ) ( not ( = ?AUTO_6095 ?AUTO_6099 ) ) ( not ( = ?AUTO_6097 ?AUTO_6099 ) ) ( not ( = ?AUTO_6100 ?AUTO_6099 ) ) ( AT_SOIL_SAMPLE ?AUTO_6099 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6101 ) ( EMPTY ?AUTO_6098 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6101 ?AUTO_6098 ?AUTO_6099 )
      ( GET_ROCK_DATA ?AUTO_6095 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6095 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6241 - OBJECTIVE
      ?AUTO_6242 - MODE
    )
    :vars
    (
      ?AUTO_6244 - LANDER
      ?AUTO_6250 - WAYPOINT
      ?AUTO_6251 - WAYPOINT
      ?AUTO_6249 - ROVER
      ?AUTO_6246 - CAMERA
      ?AUTO_6243 - WAYPOINT
      ?AUTO_6247 - WAYPOINT
      ?AUTO_6245 - OBJECTIVE
      ?AUTO_6248 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6244 ?AUTO_6250 ) ( VISIBLE ?AUTO_6251 ?AUTO_6250 ) ( AVAILABLE ?AUTO_6249 ) ( CHANNEL_FREE ?AUTO_6244 ) ( not ( = ?AUTO_6251 ?AUTO_6250 ) ) ( CAN_TRAVERSE ?AUTO_6249 ?AUTO_6250 ?AUTO_6251 ) ( VISIBLE ?AUTO_6250 ?AUTO_6251 ) ( ON_BOARD ?AUTO_6246 ?AUTO_6249 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6249 ) ( SUPPORTS ?AUTO_6246 ?AUTO_6242 ) ( VISIBLE_FROM ?AUTO_6241 ?AUTO_6250 ) ( CAN_TRAVERSE ?AUTO_6249 ?AUTO_6243 ?AUTO_6250 ) ( VISIBLE ?AUTO_6243 ?AUTO_6250 ) ( not ( = ?AUTO_6250 ?AUTO_6243 ) ) ( not ( = ?AUTO_6251 ?AUTO_6243 ) ) ( CAN_TRAVERSE ?AUTO_6249 ?AUTO_6247 ?AUTO_6243 ) ( VISIBLE ?AUTO_6247 ?AUTO_6243 ) ( not ( = ?AUTO_6250 ?AUTO_6247 ) ) ( not ( = ?AUTO_6251 ?AUTO_6247 ) ) ( not ( = ?AUTO_6243 ?AUTO_6247 ) ) ( CALIBRATION_TARGET ?AUTO_6246 ?AUTO_6245 ) ( VISIBLE_FROM ?AUTO_6245 ?AUTO_6247 ) ( not ( = ?AUTO_6241 ?AUTO_6245 ) ) ( CAN_TRAVERSE ?AUTO_6249 ?AUTO_6248 ?AUTO_6247 ) ( VISIBLE ?AUTO_6248 ?AUTO_6247 ) ( not ( = ?AUTO_6250 ?AUTO_6248 ) ) ( not ( = ?AUTO_6251 ?AUTO_6248 ) ) ( not ( = ?AUTO_6243 ?AUTO_6248 ) ) ( not ( = ?AUTO_6247 ?AUTO_6248 ) ) ( CAN_TRAVERSE ?AUTO_6249 ?AUTO_6250 ?AUTO_6248 ) ( AT ?AUTO_6249 ?AUTO_6250 ) ( VISIBLE ?AUTO_6250 ?AUTO_6248 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6249 ?AUTO_6250 ?AUTO_6248 )
      ( GET_IMAGE_DATA ?AUTO_6241 ?AUTO_6242 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6241 ?AUTO_6242 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6252 - OBJECTIVE
      ?AUTO_6253 - MODE
    )
    :vars
    (
      ?AUTO_6260 - LANDER
      ?AUTO_6256 - WAYPOINT
      ?AUTO_6261 - WAYPOINT
      ?AUTO_6259 - ROVER
      ?AUTO_6258 - CAMERA
      ?AUTO_6257 - WAYPOINT
      ?AUTO_6262 - WAYPOINT
      ?AUTO_6254 - OBJECTIVE
      ?AUTO_6255 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6260 ?AUTO_6256 ) ( VISIBLE ?AUTO_6261 ?AUTO_6256 ) ( AVAILABLE ?AUTO_6259 ) ( CHANNEL_FREE ?AUTO_6260 ) ( not ( = ?AUTO_6261 ?AUTO_6256 ) ) ( CAN_TRAVERSE ?AUTO_6259 ?AUTO_6256 ?AUTO_6261 ) ( VISIBLE ?AUTO_6256 ?AUTO_6261 ) ( ON_BOARD ?AUTO_6258 ?AUTO_6259 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6259 ) ( SUPPORTS ?AUTO_6258 ?AUTO_6253 ) ( VISIBLE_FROM ?AUTO_6252 ?AUTO_6256 ) ( CAN_TRAVERSE ?AUTO_6259 ?AUTO_6257 ?AUTO_6256 ) ( VISIBLE ?AUTO_6257 ?AUTO_6256 ) ( not ( = ?AUTO_6256 ?AUTO_6257 ) ) ( not ( = ?AUTO_6261 ?AUTO_6257 ) ) ( CAN_TRAVERSE ?AUTO_6259 ?AUTO_6262 ?AUTO_6257 ) ( VISIBLE ?AUTO_6262 ?AUTO_6257 ) ( not ( = ?AUTO_6256 ?AUTO_6262 ) ) ( not ( = ?AUTO_6261 ?AUTO_6262 ) ) ( not ( = ?AUTO_6257 ?AUTO_6262 ) ) ( CALIBRATION_TARGET ?AUTO_6258 ?AUTO_6254 ) ( VISIBLE_FROM ?AUTO_6254 ?AUTO_6262 ) ( not ( = ?AUTO_6252 ?AUTO_6254 ) ) ( CAN_TRAVERSE ?AUTO_6259 ?AUTO_6255 ?AUTO_6262 ) ( VISIBLE ?AUTO_6255 ?AUTO_6262 ) ( not ( = ?AUTO_6256 ?AUTO_6255 ) ) ( not ( = ?AUTO_6261 ?AUTO_6255 ) ) ( not ( = ?AUTO_6257 ?AUTO_6255 ) ) ( not ( = ?AUTO_6262 ?AUTO_6255 ) ) ( CAN_TRAVERSE ?AUTO_6259 ?AUTO_6256 ?AUTO_6255 ) ( VISIBLE ?AUTO_6256 ?AUTO_6255 ) ( AT ?AUTO_6259 ?AUTO_6257 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6259 ?AUTO_6257 ?AUTO_6256 )
      ( GET_IMAGE_DATA ?AUTO_6252 ?AUTO_6253 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6252 ?AUTO_6253 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6320 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6324 - LANDER
      ?AUTO_6325 - WAYPOINT
      ?AUTO_6322 - ROVER
      ?AUTO_6326 - STORE
      ?AUTO_6323 - WAYPOINT
      ?AUTO_6321 - WAYPOINT
      ?AUTO_6327 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6324 ?AUTO_6320 ) ( VISIBLE ?AUTO_6325 ?AUTO_6320 ) ( AVAILABLE ?AUTO_6322 ) ( CHANNEL_FREE ?AUTO_6324 ) ( not ( = ?AUTO_6320 ?AUTO_6325 ) ) ( CAN_TRAVERSE ?AUTO_6322 ?AUTO_6320 ?AUTO_6325 ) ( VISIBLE ?AUTO_6320 ?AUTO_6325 ) ( AT_ROCK_SAMPLE ?AUTO_6320 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6322 ) ( STORE_OF ?AUTO_6326 ?AUTO_6322 ) ( CAN_TRAVERSE ?AUTO_6322 ?AUTO_6323 ?AUTO_6320 ) ( VISIBLE ?AUTO_6323 ?AUTO_6320 ) ( not ( = ?AUTO_6320 ?AUTO_6323 ) ) ( not ( = ?AUTO_6325 ?AUTO_6323 ) ) ( CAN_TRAVERSE ?AUTO_6322 ?AUTO_6321 ?AUTO_6323 ) ( VISIBLE ?AUTO_6321 ?AUTO_6323 ) ( not ( = ?AUTO_6320 ?AUTO_6321 ) ) ( not ( = ?AUTO_6325 ?AUTO_6321 ) ) ( not ( = ?AUTO_6323 ?AUTO_6321 ) ) ( AT_ROCK_SAMPLE ?AUTO_6321 ) ( EMPTY ?AUTO_6326 ) ( CAN_TRAVERSE ?AUTO_6322 ?AUTO_6327 ?AUTO_6321 ) ( AT ?AUTO_6322 ?AUTO_6327 ) ( VISIBLE ?AUTO_6327 ?AUTO_6321 ) ( not ( = ?AUTO_6320 ?AUTO_6327 ) ) ( not ( = ?AUTO_6325 ?AUTO_6327 ) ) ( not ( = ?AUTO_6323 ?AUTO_6327 ) ) ( not ( = ?AUTO_6321 ?AUTO_6327 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6322 ?AUTO_6327 ?AUTO_6321 )
      ( GET_ROCK_DATA ?AUTO_6320 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6320 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6428 - OBJECTIVE
      ?AUTO_6429 - MODE
    )
    :vars
    (
      ?AUTO_6434 - LANDER
      ?AUTO_6430 - WAYPOINT
      ?AUTO_6433 - WAYPOINT
      ?AUTO_6435 - ROVER
      ?AUTO_6437 - CAMERA
      ?AUTO_6436 - WAYPOINT
      ?AUTO_6432 - WAYPOINT
      ?AUTO_6431 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6434 ?AUTO_6430 ) ( VISIBLE ?AUTO_6433 ?AUTO_6430 ) ( AVAILABLE ?AUTO_6435 ) ( CHANNEL_FREE ?AUTO_6434 ) ( not ( = ?AUTO_6433 ?AUTO_6430 ) ) ( ON_BOARD ?AUTO_6437 ?AUTO_6435 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6435 ) ( SUPPORTS ?AUTO_6437 ?AUTO_6429 ) ( VISIBLE_FROM ?AUTO_6428 ?AUTO_6433 ) ( CAN_TRAVERSE ?AUTO_6435 ?AUTO_6436 ?AUTO_6433 ) ( VISIBLE ?AUTO_6436 ?AUTO_6433 ) ( not ( = ?AUTO_6430 ?AUTO_6436 ) ) ( not ( = ?AUTO_6433 ?AUTO_6436 ) ) ( CAN_TRAVERSE ?AUTO_6435 ?AUTO_6432 ?AUTO_6436 ) ( VISIBLE ?AUTO_6432 ?AUTO_6436 ) ( not ( = ?AUTO_6430 ?AUTO_6432 ) ) ( not ( = ?AUTO_6433 ?AUTO_6432 ) ) ( not ( = ?AUTO_6436 ?AUTO_6432 ) ) ( CALIBRATION_TARGET ?AUTO_6437 ?AUTO_6431 ) ( VISIBLE_FROM ?AUTO_6431 ?AUTO_6432 ) ( not ( = ?AUTO_6428 ?AUTO_6431 ) ) ( CAN_TRAVERSE ?AUTO_6435 ?AUTO_6433 ?AUTO_6432 ) ( AT ?AUTO_6435 ?AUTO_6433 ) ( VISIBLE ?AUTO_6433 ?AUTO_6432 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6435 ?AUTO_6433 ?AUTO_6432 )
      ( GET_IMAGE_DATA ?AUTO_6428 ?AUTO_6429 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6428 ?AUTO_6429 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6446 - OBJECTIVE
      ?AUTO_6447 - MODE
    )
    :vars
    (
      ?AUTO_6451 - LANDER
      ?AUTO_6450 - WAYPOINT
      ?AUTO_6453 - WAYPOINT
      ?AUTO_6454 - ROVER
      ?AUTO_6455 - CAMERA
      ?AUTO_6449 - WAYPOINT
      ?AUTO_6452 - WAYPOINT
      ?AUTO_6448 - OBJECTIVE
      ?AUTO_6456 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6451 ?AUTO_6450 ) ( VISIBLE ?AUTO_6453 ?AUTO_6450 ) ( AVAILABLE ?AUTO_6454 ) ( CHANNEL_FREE ?AUTO_6451 ) ( not ( = ?AUTO_6453 ?AUTO_6450 ) ) ( ON_BOARD ?AUTO_6455 ?AUTO_6454 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6454 ) ( SUPPORTS ?AUTO_6455 ?AUTO_6447 ) ( VISIBLE_FROM ?AUTO_6446 ?AUTO_6453 ) ( CAN_TRAVERSE ?AUTO_6454 ?AUTO_6449 ?AUTO_6453 ) ( VISIBLE ?AUTO_6449 ?AUTO_6453 ) ( not ( = ?AUTO_6450 ?AUTO_6449 ) ) ( not ( = ?AUTO_6453 ?AUTO_6449 ) ) ( CAN_TRAVERSE ?AUTO_6454 ?AUTO_6452 ?AUTO_6449 ) ( VISIBLE ?AUTO_6452 ?AUTO_6449 ) ( not ( = ?AUTO_6450 ?AUTO_6452 ) ) ( not ( = ?AUTO_6453 ?AUTO_6452 ) ) ( not ( = ?AUTO_6449 ?AUTO_6452 ) ) ( CALIBRATION_TARGET ?AUTO_6455 ?AUTO_6448 ) ( VISIBLE_FROM ?AUTO_6448 ?AUTO_6452 ) ( not ( = ?AUTO_6446 ?AUTO_6448 ) ) ( CAN_TRAVERSE ?AUTO_6454 ?AUTO_6453 ?AUTO_6452 ) ( VISIBLE ?AUTO_6453 ?AUTO_6452 ) ( CAN_TRAVERSE ?AUTO_6454 ?AUTO_6456 ?AUTO_6453 ) ( AT ?AUTO_6454 ?AUTO_6456 ) ( VISIBLE ?AUTO_6456 ?AUTO_6453 ) ( not ( = ?AUTO_6450 ?AUTO_6456 ) ) ( not ( = ?AUTO_6453 ?AUTO_6456 ) ) ( not ( = ?AUTO_6449 ?AUTO_6456 ) ) ( not ( = ?AUTO_6452 ?AUTO_6456 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6454 ?AUTO_6456 ?AUTO_6453 )
      ( GET_IMAGE_DATA ?AUTO_6446 ?AUTO_6447 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6446 ?AUTO_6447 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6463 - OBJECTIVE
      ?AUTO_6464 - MODE
    )
    :vars
    (
      ?AUTO_6467 - LANDER
      ?AUTO_6468 - WAYPOINT
      ?AUTO_6465 - WAYPOINT
      ?AUTO_6466 - ROVER
      ?AUTO_6470 - CAMERA
      ?AUTO_6469 - WAYPOINT
      ?AUTO_6473 - WAYPOINT
      ?AUTO_6472 - OBJECTIVE
      ?AUTO_6471 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6467 ?AUTO_6468 ) ( VISIBLE ?AUTO_6465 ?AUTO_6468 ) ( AVAILABLE ?AUTO_6466 ) ( CHANNEL_FREE ?AUTO_6467 ) ( not ( = ?AUTO_6465 ?AUTO_6468 ) ) ( ON_BOARD ?AUTO_6470 ?AUTO_6466 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6466 ) ( SUPPORTS ?AUTO_6470 ?AUTO_6464 ) ( VISIBLE_FROM ?AUTO_6463 ?AUTO_6465 ) ( CAN_TRAVERSE ?AUTO_6466 ?AUTO_6469 ?AUTO_6465 ) ( VISIBLE ?AUTO_6469 ?AUTO_6465 ) ( not ( = ?AUTO_6468 ?AUTO_6469 ) ) ( not ( = ?AUTO_6465 ?AUTO_6469 ) ) ( CAN_TRAVERSE ?AUTO_6466 ?AUTO_6473 ?AUTO_6469 ) ( VISIBLE ?AUTO_6473 ?AUTO_6469 ) ( not ( = ?AUTO_6468 ?AUTO_6473 ) ) ( not ( = ?AUTO_6465 ?AUTO_6473 ) ) ( not ( = ?AUTO_6469 ?AUTO_6473 ) ) ( CALIBRATION_TARGET ?AUTO_6470 ?AUTO_6472 ) ( VISIBLE_FROM ?AUTO_6472 ?AUTO_6473 ) ( not ( = ?AUTO_6463 ?AUTO_6472 ) ) ( CAN_TRAVERSE ?AUTO_6466 ?AUTO_6465 ?AUTO_6473 ) ( VISIBLE ?AUTO_6465 ?AUTO_6473 ) ( CAN_TRAVERSE ?AUTO_6466 ?AUTO_6471 ?AUTO_6465 ) ( VISIBLE ?AUTO_6471 ?AUTO_6465 ) ( not ( = ?AUTO_6468 ?AUTO_6471 ) ) ( not ( = ?AUTO_6465 ?AUTO_6471 ) ) ( not ( = ?AUTO_6469 ?AUTO_6471 ) ) ( not ( = ?AUTO_6473 ?AUTO_6471 ) ) ( CAN_TRAVERSE ?AUTO_6466 ?AUTO_6468 ?AUTO_6471 ) ( AT ?AUTO_6466 ?AUTO_6468 ) ( VISIBLE ?AUTO_6468 ?AUTO_6471 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6466 ?AUTO_6468 ?AUTO_6471 )
      ( GET_IMAGE_DATA ?AUTO_6463 ?AUTO_6464 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6463 ?AUTO_6464 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6528 - OBJECTIVE
      ?AUTO_6529 - MODE
    )
    :vars
    (
      ?AUTO_6532 - LANDER
      ?AUTO_6533 - WAYPOINT
      ?AUTO_6530 - WAYPOINT
      ?AUTO_6535 - ROVER
      ?AUTO_6536 - CAMERA
      ?AUTO_6531 - OBJECTIVE
      ?AUTO_6534 - WAYPOINT
      ?AUTO_6537 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6532 ?AUTO_6533 ) ( VISIBLE ?AUTO_6530 ?AUTO_6533 ) ( AVAILABLE ?AUTO_6535 ) ( CHANNEL_FREE ?AUTO_6532 ) ( not ( = ?AUTO_6530 ?AUTO_6533 ) ) ( ON_BOARD ?AUTO_6536 ?AUTO_6535 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6535 ) ( SUPPORTS ?AUTO_6536 ?AUTO_6529 ) ( VISIBLE_FROM ?AUTO_6528 ?AUTO_6530 ) ( CAN_TRAVERSE ?AUTO_6535 ?AUTO_6533 ?AUTO_6530 ) ( VISIBLE ?AUTO_6533 ?AUTO_6530 ) ( CALIBRATION_TARGET ?AUTO_6536 ?AUTO_6531 ) ( VISIBLE_FROM ?AUTO_6531 ?AUTO_6533 ) ( not ( = ?AUTO_6528 ?AUTO_6531 ) ) ( CAN_TRAVERSE ?AUTO_6535 ?AUTO_6534 ?AUTO_6533 ) ( VISIBLE ?AUTO_6534 ?AUTO_6533 ) ( not ( = ?AUTO_6533 ?AUTO_6534 ) ) ( not ( = ?AUTO_6530 ?AUTO_6534 ) ) ( CAN_TRAVERSE ?AUTO_6535 ?AUTO_6537 ?AUTO_6534 ) ( AT ?AUTO_6535 ?AUTO_6537 ) ( VISIBLE ?AUTO_6537 ?AUTO_6534 ) ( not ( = ?AUTO_6533 ?AUTO_6537 ) ) ( not ( = ?AUTO_6530 ?AUTO_6537 ) ) ( not ( = ?AUTO_6534 ?AUTO_6537 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6535 ?AUTO_6537 ?AUTO_6534 )
      ( GET_IMAGE_DATA ?AUTO_6528 ?AUTO_6529 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6528 ?AUTO_6529 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6563 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6564 - LANDER
      ?AUTO_6566 - WAYPOINT
      ?AUTO_6565 - ROVER
      ?AUTO_6567 - STORE
      ?AUTO_6568 - WAYPOINT
      ?AUTO_6569 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6564 ?AUTO_6566 ) ( VISIBLE ?AUTO_6563 ?AUTO_6566 ) ( AVAILABLE ?AUTO_6565 ) ( CHANNEL_FREE ?AUTO_6564 ) ( not ( = ?AUTO_6563 ?AUTO_6566 ) ) ( AT_SOIL_SAMPLE ?AUTO_6563 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6565 ) ( STORE_OF ?AUTO_6567 ?AUTO_6565 ) ( EMPTY ?AUTO_6567 ) ( CAN_TRAVERSE ?AUTO_6565 ?AUTO_6568 ?AUTO_6563 ) ( VISIBLE ?AUTO_6568 ?AUTO_6563 ) ( not ( = ?AUTO_6563 ?AUTO_6568 ) ) ( not ( = ?AUTO_6566 ?AUTO_6568 ) ) ( CAN_TRAVERSE ?AUTO_6565 ?AUTO_6566 ?AUTO_6568 ) ( VISIBLE ?AUTO_6566 ?AUTO_6568 ) ( CAN_TRAVERSE ?AUTO_6565 ?AUTO_6569 ?AUTO_6566 ) ( AT ?AUTO_6565 ?AUTO_6569 ) ( VISIBLE ?AUTO_6569 ?AUTO_6566 ) ( not ( = ?AUTO_6563 ?AUTO_6569 ) ) ( not ( = ?AUTO_6566 ?AUTO_6569 ) ) ( not ( = ?AUTO_6568 ?AUTO_6569 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6565 ?AUTO_6569 ?AUTO_6566 )
      ( GET_SOIL_DATA ?AUTO_6563 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6563 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6572 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6576 - LANDER
      ?AUTO_6578 - WAYPOINT
      ?AUTO_6573 - ROVER
      ?AUTO_6575 - STORE
      ?AUTO_6574 - WAYPOINT
      ?AUTO_6577 - WAYPOINT
      ?AUTO_6579 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6576 ?AUTO_6578 ) ( VISIBLE ?AUTO_6572 ?AUTO_6578 ) ( AVAILABLE ?AUTO_6573 ) ( CHANNEL_FREE ?AUTO_6576 ) ( not ( = ?AUTO_6572 ?AUTO_6578 ) ) ( AT_SOIL_SAMPLE ?AUTO_6572 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6573 ) ( STORE_OF ?AUTO_6575 ?AUTO_6573 ) ( EMPTY ?AUTO_6575 ) ( CAN_TRAVERSE ?AUTO_6573 ?AUTO_6574 ?AUTO_6572 ) ( VISIBLE ?AUTO_6574 ?AUTO_6572 ) ( not ( = ?AUTO_6572 ?AUTO_6574 ) ) ( not ( = ?AUTO_6578 ?AUTO_6574 ) ) ( CAN_TRAVERSE ?AUTO_6573 ?AUTO_6578 ?AUTO_6574 ) ( VISIBLE ?AUTO_6578 ?AUTO_6574 ) ( CAN_TRAVERSE ?AUTO_6573 ?AUTO_6577 ?AUTO_6578 ) ( VISIBLE ?AUTO_6577 ?AUTO_6578 ) ( not ( = ?AUTO_6572 ?AUTO_6577 ) ) ( not ( = ?AUTO_6578 ?AUTO_6577 ) ) ( not ( = ?AUTO_6574 ?AUTO_6577 ) ) ( CAN_TRAVERSE ?AUTO_6573 ?AUTO_6579 ?AUTO_6577 ) ( AT ?AUTO_6573 ?AUTO_6579 ) ( VISIBLE ?AUTO_6579 ?AUTO_6577 ) ( not ( = ?AUTO_6572 ?AUTO_6579 ) ) ( not ( = ?AUTO_6578 ?AUTO_6579 ) ) ( not ( = ?AUTO_6574 ?AUTO_6579 ) ) ( not ( = ?AUTO_6577 ?AUTO_6579 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6573 ?AUTO_6579 ?AUTO_6577 )
      ( GET_SOIL_DATA ?AUTO_6572 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6572 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6654 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6655 - LANDER
      ?AUTO_6658 - WAYPOINT
      ?AUTO_6656 - ROVER
      ?AUTO_6659 - STORE
      ?AUTO_6660 - WAYPOINT
      ?AUTO_6657 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6655 ?AUTO_6658 ) ( VISIBLE ?AUTO_6654 ?AUTO_6658 ) ( AVAILABLE ?AUTO_6656 ) ( CHANNEL_FREE ?AUTO_6655 ) ( not ( = ?AUTO_6654 ?AUTO_6658 ) ) ( AT_ROCK_SAMPLE ?AUTO_6654 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6656 ) ( STORE_OF ?AUTO_6659 ?AUTO_6656 ) ( CAN_TRAVERSE ?AUTO_6656 ?AUTO_6660 ?AUTO_6654 ) ( VISIBLE ?AUTO_6660 ?AUTO_6654 ) ( not ( = ?AUTO_6654 ?AUTO_6660 ) ) ( not ( = ?AUTO_6658 ?AUTO_6660 ) ) ( CAN_TRAVERSE ?AUTO_6656 ?AUTO_6657 ?AUTO_6660 ) ( AT ?AUTO_6656 ?AUTO_6657 ) ( VISIBLE ?AUTO_6657 ?AUTO_6660 ) ( not ( = ?AUTO_6654 ?AUTO_6657 ) ) ( not ( = ?AUTO_6658 ?AUTO_6657 ) ) ( not ( = ?AUTO_6660 ?AUTO_6657 ) ) ( AT_SOIL_SAMPLE ?AUTO_6657 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6656 ) ( EMPTY ?AUTO_6659 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6656 ?AUTO_6659 ?AUTO_6657 )
      ( GET_ROCK_DATA ?AUTO_6654 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6654 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6671 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6673 - LANDER
      ?AUTO_6672 - WAYPOINT
      ?AUTO_6674 - ROVER
      ?AUTO_6676 - STORE
      ?AUTO_6677 - WAYPOINT
      ?AUTO_6675 - WAYPOINT
      ?AUTO_6678 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6673 ?AUTO_6672 ) ( VISIBLE ?AUTO_6671 ?AUTO_6672 ) ( AVAILABLE ?AUTO_6674 ) ( CHANNEL_FREE ?AUTO_6673 ) ( not ( = ?AUTO_6671 ?AUTO_6672 ) ) ( AT_ROCK_SAMPLE ?AUTO_6671 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6674 ) ( STORE_OF ?AUTO_6676 ?AUTO_6674 ) ( CAN_TRAVERSE ?AUTO_6674 ?AUTO_6677 ?AUTO_6671 ) ( VISIBLE ?AUTO_6677 ?AUTO_6671 ) ( not ( = ?AUTO_6671 ?AUTO_6677 ) ) ( not ( = ?AUTO_6672 ?AUTO_6677 ) ) ( CAN_TRAVERSE ?AUTO_6674 ?AUTO_6675 ?AUTO_6677 ) ( VISIBLE ?AUTO_6675 ?AUTO_6677 ) ( not ( = ?AUTO_6671 ?AUTO_6675 ) ) ( not ( = ?AUTO_6672 ?AUTO_6675 ) ) ( not ( = ?AUTO_6677 ?AUTO_6675 ) ) ( AT_SOIL_SAMPLE ?AUTO_6675 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6674 ) ( EMPTY ?AUTO_6676 ) ( CAN_TRAVERSE ?AUTO_6674 ?AUTO_6678 ?AUTO_6675 ) ( VISIBLE ?AUTO_6678 ?AUTO_6675 ) ( not ( = ?AUTO_6671 ?AUTO_6678 ) ) ( not ( = ?AUTO_6672 ?AUTO_6678 ) ) ( not ( = ?AUTO_6677 ?AUTO_6678 ) ) ( not ( = ?AUTO_6675 ?AUTO_6678 ) ) ( CAN_TRAVERSE ?AUTO_6674 ?AUTO_6672 ?AUTO_6678 ) ( AT ?AUTO_6674 ?AUTO_6672 ) ( VISIBLE ?AUTO_6672 ?AUTO_6678 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6674 ?AUTO_6672 ?AUTO_6678 )
      ( GET_ROCK_DATA ?AUTO_6671 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6671 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6683 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6687 - LANDER
      ?AUTO_6685 - WAYPOINT
      ?AUTO_6684 - ROVER
      ?AUTO_6688 - STORE
      ?AUTO_6689 - WAYPOINT
      ?AUTO_6686 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6687 ?AUTO_6685 ) ( VISIBLE ?AUTO_6683 ?AUTO_6685 ) ( AVAILABLE ?AUTO_6684 ) ( CHANNEL_FREE ?AUTO_6687 ) ( not ( = ?AUTO_6683 ?AUTO_6685 ) ) ( AT_ROCK_SAMPLE ?AUTO_6683 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6684 ) ( STORE_OF ?AUTO_6688 ?AUTO_6684 ) ( CAN_TRAVERSE ?AUTO_6684 ?AUTO_6689 ?AUTO_6683 ) ( VISIBLE ?AUTO_6689 ?AUTO_6683 ) ( not ( = ?AUTO_6683 ?AUTO_6689 ) ) ( not ( = ?AUTO_6685 ?AUTO_6689 ) ) ( CAN_TRAVERSE ?AUTO_6684 ?AUTO_6686 ?AUTO_6689 ) ( VISIBLE ?AUTO_6686 ?AUTO_6689 ) ( not ( = ?AUTO_6683 ?AUTO_6686 ) ) ( not ( = ?AUTO_6685 ?AUTO_6686 ) ) ( not ( = ?AUTO_6689 ?AUTO_6686 ) ) ( AT_SOIL_SAMPLE ?AUTO_6686 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6684 ) ( EMPTY ?AUTO_6688 ) ( CAN_TRAVERSE ?AUTO_6684 ?AUTO_6689 ?AUTO_6686 ) ( AT ?AUTO_6684 ?AUTO_6689 ) ( VISIBLE ?AUTO_6689 ?AUTO_6686 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6684 ?AUTO_6689 ?AUTO_6686 )
      ( GET_ROCK_DATA ?AUTO_6683 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6683 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6717 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6719 - LANDER
      ?AUTO_6718 - WAYPOINT
      ?AUTO_6720 - ROVER
      ?AUTO_6721 - STORE
      ?AUTO_6722 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6719 ?AUTO_6717 ) ( VISIBLE ?AUTO_6718 ?AUTO_6717 ) ( AVAILABLE ?AUTO_6720 ) ( CHANNEL_FREE ?AUTO_6719 ) ( not ( = ?AUTO_6717 ?AUTO_6718 ) ) ( CAN_TRAVERSE ?AUTO_6720 ?AUTO_6717 ?AUTO_6718 ) ( VISIBLE ?AUTO_6717 ?AUTO_6718 ) ( AT_SOIL_SAMPLE ?AUTO_6717 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6720 ) ( STORE_OF ?AUTO_6721 ?AUTO_6720 ) ( CAN_TRAVERSE ?AUTO_6720 ?AUTO_6718 ?AUTO_6717 ) ( FULL ?AUTO_6721 ) ( CAN_TRAVERSE ?AUTO_6720 ?AUTO_6722 ?AUTO_6718 ) ( AT ?AUTO_6720 ?AUTO_6722 ) ( VISIBLE ?AUTO_6722 ?AUTO_6718 ) ( not ( = ?AUTO_6717 ?AUTO_6722 ) ) ( not ( = ?AUTO_6718 ?AUTO_6722 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6720 ?AUTO_6722 ?AUTO_6718 )
      ( GET_SOIL_DATA ?AUTO_6717 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6717 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6724 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6729 - LANDER
      ?AUTO_6726 - WAYPOINT
      ?AUTO_6725 - ROVER
      ?AUTO_6727 - STORE
      ?AUTO_6728 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6729 ?AUTO_6724 ) ( VISIBLE ?AUTO_6726 ?AUTO_6724 ) ( AVAILABLE ?AUTO_6725 ) ( CHANNEL_FREE ?AUTO_6729 ) ( not ( = ?AUTO_6724 ?AUTO_6726 ) ) ( CAN_TRAVERSE ?AUTO_6725 ?AUTO_6724 ?AUTO_6726 ) ( VISIBLE ?AUTO_6724 ?AUTO_6726 ) ( AT_SOIL_SAMPLE ?AUTO_6724 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6725 ) ( STORE_OF ?AUTO_6727 ?AUTO_6725 ) ( CAN_TRAVERSE ?AUTO_6725 ?AUTO_6726 ?AUTO_6724 ) ( CAN_TRAVERSE ?AUTO_6725 ?AUTO_6728 ?AUTO_6726 ) ( AT ?AUTO_6725 ?AUTO_6728 ) ( VISIBLE ?AUTO_6728 ?AUTO_6726 ) ( not ( = ?AUTO_6724 ?AUTO_6728 ) ) ( not ( = ?AUTO_6726 ?AUTO_6728 ) ) ( AT_SOIL_SAMPLE ?AUTO_6728 ) ( EMPTY ?AUTO_6727 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6725 ?AUTO_6727 ?AUTO_6728 )
      ( GET_SOIL_DATA ?AUTO_6724 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6724 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6731 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6732 - LANDER
      ?AUTO_6734 - WAYPOINT
      ?AUTO_6736 - ROVER
      ?AUTO_6735 - STORE
      ?AUTO_6733 - WAYPOINT
      ?AUTO_6737 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6732 ?AUTO_6731 ) ( VISIBLE ?AUTO_6734 ?AUTO_6731 ) ( AVAILABLE ?AUTO_6736 ) ( CHANNEL_FREE ?AUTO_6732 ) ( not ( = ?AUTO_6731 ?AUTO_6734 ) ) ( CAN_TRAVERSE ?AUTO_6736 ?AUTO_6731 ?AUTO_6734 ) ( VISIBLE ?AUTO_6731 ?AUTO_6734 ) ( AT_SOIL_SAMPLE ?AUTO_6731 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6736 ) ( STORE_OF ?AUTO_6735 ?AUTO_6736 ) ( CAN_TRAVERSE ?AUTO_6736 ?AUTO_6734 ?AUTO_6731 ) ( FULL ?AUTO_6735 ) ( CAN_TRAVERSE ?AUTO_6736 ?AUTO_6733 ?AUTO_6734 ) ( VISIBLE ?AUTO_6733 ?AUTO_6734 ) ( not ( = ?AUTO_6731 ?AUTO_6733 ) ) ( not ( = ?AUTO_6734 ?AUTO_6733 ) ) ( CAN_TRAVERSE ?AUTO_6736 ?AUTO_6737 ?AUTO_6733 ) ( AT ?AUTO_6736 ?AUTO_6737 ) ( VISIBLE ?AUTO_6737 ?AUTO_6733 ) ( not ( = ?AUTO_6731 ?AUTO_6737 ) ) ( not ( = ?AUTO_6734 ?AUTO_6737 ) ) ( not ( = ?AUTO_6733 ?AUTO_6737 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6736 ?AUTO_6737 ?AUTO_6733 )
      ( GET_SOIL_DATA ?AUTO_6731 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6731 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6739 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6743 - LANDER
      ?AUTO_6740 - WAYPOINT
      ?AUTO_6744 - ROVER
      ?AUTO_6742 - STORE
      ?AUTO_6741 - WAYPOINT
      ?AUTO_6745 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6743 ?AUTO_6739 ) ( VISIBLE ?AUTO_6740 ?AUTO_6739 ) ( AVAILABLE ?AUTO_6744 ) ( CHANNEL_FREE ?AUTO_6743 ) ( not ( = ?AUTO_6739 ?AUTO_6740 ) ) ( CAN_TRAVERSE ?AUTO_6744 ?AUTO_6739 ?AUTO_6740 ) ( VISIBLE ?AUTO_6739 ?AUTO_6740 ) ( AT_SOIL_SAMPLE ?AUTO_6739 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6744 ) ( STORE_OF ?AUTO_6742 ?AUTO_6744 ) ( CAN_TRAVERSE ?AUTO_6744 ?AUTO_6740 ?AUTO_6739 ) ( CAN_TRAVERSE ?AUTO_6744 ?AUTO_6741 ?AUTO_6740 ) ( VISIBLE ?AUTO_6741 ?AUTO_6740 ) ( not ( = ?AUTO_6739 ?AUTO_6741 ) ) ( not ( = ?AUTO_6740 ?AUTO_6741 ) ) ( CAN_TRAVERSE ?AUTO_6744 ?AUTO_6745 ?AUTO_6741 ) ( AT ?AUTO_6744 ?AUTO_6745 ) ( VISIBLE ?AUTO_6745 ?AUTO_6741 ) ( not ( = ?AUTO_6739 ?AUTO_6745 ) ) ( not ( = ?AUTO_6740 ?AUTO_6745 ) ) ( not ( = ?AUTO_6741 ?AUTO_6745 ) ) ( AT_SOIL_SAMPLE ?AUTO_6745 ) ( EMPTY ?AUTO_6742 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_6744 ?AUTO_6742 ?AUTO_6745 )
      ( GET_SOIL_DATA ?AUTO_6739 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6739 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6754 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6758 - LANDER
      ?AUTO_6757 - WAYPOINT
      ?AUTO_6759 - ROVER
      ?AUTO_6756 - STORE
      ?AUTO_6760 - WAYPOINT
      ?AUTO_6755 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6758 ?AUTO_6754 ) ( VISIBLE ?AUTO_6757 ?AUTO_6754 ) ( AVAILABLE ?AUTO_6759 ) ( CHANNEL_FREE ?AUTO_6758 ) ( not ( = ?AUTO_6754 ?AUTO_6757 ) ) ( CAN_TRAVERSE ?AUTO_6759 ?AUTO_6754 ?AUTO_6757 ) ( VISIBLE ?AUTO_6754 ?AUTO_6757 ) ( AT_SOIL_SAMPLE ?AUTO_6754 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6759 ) ( STORE_OF ?AUTO_6756 ?AUTO_6759 ) ( CAN_TRAVERSE ?AUTO_6759 ?AUTO_6757 ?AUTO_6754 ) ( CAN_TRAVERSE ?AUTO_6759 ?AUTO_6760 ?AUTO_6757 ) ( VISIBLE ?AUTO_6760 ?AUTO_6757 ) ( not ( = ?AUTO_6754 ?AUTO_6760 ) ) ( not ( = ?AUTO_6757 ?AUTO_6760 ) ) ( CAN_TRAVERSE ?AUTO_6759 ?AUTO_6755 ?AUTO_6760 ) ( VISIBLE ?AUTO_6755 ?AUTO_6760 ) ( not ( = ?AUTO_6754 ?AUTO_6755 ) ) ( not ( = ?AUTO_6757 ?AUTO_6755 ) ) ( not ( = ?AUTO_6760 ?AUTO_6755 ) ) ( AT_SOIL_SAMPLE ?AUTO_6755 ) ( EMPTY ?AUTO_6756 ) ( CAN_TRAVERSE ?AUTO_6759 ?AUTO_6760 ?AUTO_6755 ) ( AT ?AUTO_6759 ?AUTO_6760 ) ( VISIBLE ?AUTO_6760 ?AUTO_6755 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6759 ?AUTO_6760 ?AUTO_6755 )
      ( GET_SOIL_DATA ?AUTO_6754 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6754 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6793 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6797 - LANDER
      ?AUTO_6794 - WAYPOINT
      ?AUTO_6795 - WAYPOINT
      ?AUTO_6798 - ROVER
      ?AUTO_6796 - STORE
      ?AUTO_6799 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6797 ?AUTO_6794 ) ( VISIBLE ?AUTO_6795 ?AUTO_6794 ) ( AVAILABLE ?AUTO_6798 ) ( CHANNEL_FREE ?AUTO_6797 ) ( not ( = ?AUTO_6793 ?AUTO_6795 ) ) ( not ( = ?AUTO_6793 ?AUTO_6794 ) ) ( not ( = ?AUTO_6795 ?AUTO_6794 ) ) ( CAN_TRAVERSE ?AUTO_6798 ?AUTO_6793 ?AUTO_6795 ) ( VISIBLE ?AUTO_6793 ?AUTO_6795 ) ( AT_ROCK_SAMPLE ?AUTO_6793 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6798 ) ( STORE_OF ?AUTO_6796 ?AUTO_6798 ) ( EMPTY ?AUTO_6796 ) ( CAN_TRAVERSE ?AUTO_6798 ?AUTO_6795 ?AUTO_6793 ) ( VISIBLE ?AUTO_6795 ?AUTO_6793 ) ( CAN_TRAVERSE ?AUTO_6798 ?AUTO_6794 ?AUTO_6795 ) ( VISIBLE ?AUTO_6794 ?AUTO_6795 ) ( CAN_TRAVERSE ?AUTO_6798 ?AUTO_6799 ?AUTO_6794 ) ( AT ?AUTO_6798 ?AUTO_6799 ) ( VISIBLE ?AUTO_6799 ?AUTO_6794 ) ( not ( = ?AUTO_6793 ?AUTO_6799 ) ) ( not ( = ?AUTO_6794 ?AUTO_6799 ) ) ( not ( = ?AUTO_6795 ?AUTO_6799 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6798 ?AUTO_6799 ?AUTO_6794 )
      ( GET_ROCK_DATA ?AUTO_6793 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6793 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6800 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6805 - LANDER
      ?AUTO_6803 - WAYPOINT
      ?AUTO_6804 - WAYPOINT
      ?AUTO_6802 - ROVER
      ?AUTO_6806 - STORE
      ?AUTO_6801 - WAYPOINT
      ?AUTO_6807 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6805 ?AUTO_6803 ) ( VISIBLE ?AUTO_6804 ?AUTO_6803 ) ( AVAILABLE ?AUTO_6802 ) ( CHANNEL_FREE ?AUTO_6805 ) ( not ( = ?AUTO_6800 ?AUTO_6804 ) ) ( not ( = ?AUTO_6800 ?AUTO_6803 ) ) ( not ( = ?AUTO_6804 ?AUTO_6803 ) ) ( CAN_TRAVERSE ?AUTO_6802 ?AUTO_6800 ?AUTO_6804 ) ( VISIBLE ?AUTO_6800 ?AUTO_6804 ) ( AT_ROCK_SAMPLE ?AUTO_6800 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6802 ) ( STORE_OF ?AUTO_6806 ?AUTO_6802 ) ( EMPTY ?AUTO_6806 ) ( CAN_TRAVERSE ?AUTO_6802 ?AUTO_6804 ?AUTO_6800 ) ( VISIBLE ?AUTO_6804 ?AUTO_6800 ) ( CAN_TRAVERSE ?AUTO_6802 ?AUTO_6803 ?AUTO_6804 ) ( VISIBLE ?AUTO_6803 ?AUTO_6804 ) ( CAN_TRAVERSE ?AUTO_6802 ?AUTO_6801 ?AUTO_6803 ) ( VISIBLE ?AUTO_6801 ?AUTO_6803 ) ( not ( = ?AUTO_6800 ?AUTO_6801 ) ) ( not ( = ?AUTO_6803 ?AUTO_6801 ) ) ( not ( = ?AUTO_6804 ?AUTO_6801 ) ) ( CAN_TRAVERSE ?AUTO_6802 ?AUTO_6807 ?AUTO_6801 ) ( AT ?AUTO_6802 ?AUTO_6807 ) ( VISIBLE ?AUTO_6807 ?AUTO_6801 ) ( not ( = ?AUTO_6800 ?AUTO_6807 ) ) ( not ( = ?AUTO_6803 ?AUTO_6807 ) ) ( not ( = ?AUTO_6804 ?AUTO_6807 ) ) ( not ( = ?AUTO_6801 ?AUTO_6807 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6802 ?AUTO_6807 ?AUTO_6801 )
      ( GET_ROCK_DATA ?AUTO_6800 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6800 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6837 - OBJECTIVE
      ?AUTO_6838 - MODE
    )
    :vars
    (
      ?AUTO_6842 - LANDER
      ?AUTO_6843 - WAYPOINT
      ?AUTO_6839 - WAYPOINT
      ?AUTO_6840 - ROVER
      ?AUTO_6844 - WAYPOINT
      ?AUTO_6841 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6842 ?AUTO_6843 ) ( VISIBLE ?AUTO_6839 ?AUTO_6843 ) ( AVAILABLE ?AUTO_6840 ) ( CHANNEL_FREE ?AUTO_6842 ) ( not ( = ?AUTO_6839 ?AUTO_6843 ) ) ( CAN_TRAVERSE ?AUTO_6840 ?AUTO_6844 ?AUTO_6839 ) ( VISIBLE ?AUTO_6844 ?AUTO_6839 ) ( not ( = ?AUTO_6843 ?AUTO_6844 ) ) ( not ( = ?AUTO_6839 ?AUTO_6844 ) ) ( CALIBRATED ?AUTO_6841 ?AUTO_6840 ) ( ON_BOARD ?AUTO_6841 ?AUTO_6840 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6840 ) ( SUPPORTS ?AUTO_6841 ?AUTO_6838 ) ( VISIBLE_FROM ?AUTO_6837 ?AUTO_6844 ) ( CAN_TRAVERSE ?AUTO_6840 ?AUTO_6839 ?AUTO_6844 ) ( AT ?AUTO_6840 ?AUTO_6839 ) ( VISIBLE ?AUTO_6839 ?AUTO_6844 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6840 ?AUTO_6839 ?AUTO_6844 )
      ( GET_IMAGE_DATA ?AUTO_6837 ?AUTO_6838 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6837 ?AUTO_6838 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6845 - OBJECTIVE
      ?AUTO_6846 - MODE
    )
    :vars
    (
      ?AUTO_6849 - LANDER
      ?AUTO_6848 - WAYPOINT
      ?AUTO_6850 - WAYPOINT
      ?AUTO_6852 - ROVER
      ?AUTO_6847 - WAYPOINT
      ?AUTO_6851 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6849 ?AUTO_6848 ) ( VISIBLE ?AUTO_6850 ?AUTO_6848 ) ( AVAILABLE ?AUTO_6852 ) ( CHANNEL_FREE ?AUTO_6849 ) ( not ( = ?AUTO_6850 ?AUTO_6848 ) ) ( CAN_TRAVERSE ?AUTO_6852 ?AUTO_6847 ?AUTO_6850 ) ( VISIBLE ?AUTO_6847 ?AUTO_6850 ) ( not ( = ?AUTO_6848 ?AUTO_6847 ) ) ( not ( = ?AUTO_6850 ?AUTO_6847 ) ) ( CALIBRATED ?AUTO_6851 ?AUTO_6852 ) ( ON_BOARD ?AUTO_6851 ?AUTO_6852 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6852 ) ( SUPPORTS ?AUTO_6851 ?AUTO_6846 ) ( VISIBLE_FROM ?AUTO_6845 ?AUTO_6847 ) ( CAN_TRAVERSE ?AUTO_6852 ?AUTO_6850 ?AUTO_6847 ) ( VISIBLE ?AUTO_6850 ?AUTO_6847 ) ( CAN_TRAVERSE ?AUTO_6852 ?AUTO_6848 ?AUTO_6850 ) ( AT ?AUTO_6852 ?AUTO_6848 ) ( VISIBLE ?AUTO_6848 ?AUTO_6850 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6852 ?AUTO_6848 ?AUTO_6850 )
      ( GET_IMAGE_DATA ?AUTO_6845 ?AUTO_6846 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6845 ?AUTO_6846 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6853 - OBJECTIVE
      ?AUTO_6854 - MODE
    )
    :vars
    (
      ?AUTO_6860 - LANDER
      ?AUTO_6857 - WAYPOINT
      ?AUTO_6855 - WAYPOINT
      ?AUTO_6858 - ROVER
      ?AUTO_6856 - WAYPOINT
      ?AUTO_6859 - CAMERA
      ?AUTO_6861 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6860 ?AUTO_6857 ) ( VISIBLE ?AUTO_6855 ?AUTO_6857 ) ( AVAILABLE ?AUTO_6858 ) ( CHANNEL_FREE ?AUTO_6860 ) ( not ( = ?AUTO_6855 ?AUTO_6857 ) ) ( CAN_TRAVERSE ?AUTO_6858 ?AUTO_6856 ?AUTO_6855 ) ( VISIBLE ?AUTO_6856 ?AUTO_6855 ) ( not ( = ?AUTO_6857 ?AUTO_6856 ) ) ( not ( = ?AUTO_6855 ?AUTO_6856 ) ) ( ON_BOARD ?AUTO_6859 ?AUTO_6858 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6858 ) ( SUPPORTS ?AUTO_6859 ?AUTO_6854 ) ( VISIBLE_FROM ?AUTO_6853 ?AUTO_6856 ) ( CAN_TRAVERSE ?AUTO_6858 ?AUTO_6855 ?AUTO_6856 ) ( VISIBLE ?AUTO_6855 ?AUTO_6856 ) ( CAN_TRAVERSE ?AUTO_6858 ?AUTO_6857 ?AUTO_6855 ) ( AT ?AUTO_6858 ?AUTO_6857 ) ( VISIBLE ?AUTO_6857 ?AUTO_6855 ) ( CALIBRATION_TARGET ?AUTO_6859 ?AUTO_6861 ) ( VISIBLE_FROM ?AUTO_6861 ?AUTO_6857 ) ( not ( = ?AUTO_6853 ?AUTO_6861 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6858 ?AUTO_6859 ?AUTO_6861 ?AUTO_6857 )
      ( GET_IMAGE_DATA ?AUTO_6853 ?AUTO_6854 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6853 ?AUTO_6854 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6862 - OBJECTIVE
      ?AUTO_6863 - MODE
    )
    :vars
    (
      ?AUTO_6866 - LANDER
      ?AUTO_6869 - WAYPOINT
      ?AUTO_6865 - WAYPOINT
      ?AUTO_6867 - ROVER
      ?AUTO_6868 - WAYPOINT
      ?AUTO_6864 - CAMERA
      ?AUTO_6870 - OBJECTIVE
      ?AUTO_6871 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6866 ?AUTO_6869 ) ( VISIBLE ?AUTO_6865 ?AUTO_6869 ) ( AVAILABLE ?AUTO_6867 ) ( CHANNEL_FREE ?AUTO_6866 ) ( not ( = ?AUTO_6865 ?AUTO_6869 ) ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6868 ?AUTO_6865 ) ( VISIBLE ?AUTO_6868 ?AUTO_6865 ) ( not ( = ?AUTO_6869 ?AUTO_6868 ) ) ( not ( = ?AUTO_6865 ?AUTO_6868 ) ) ( ON_BOARD ?AUTO_6864 ?AUTO_6867 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6867 ) ( SUPPORTS ?AUTO_6864 ?AUTO_6863 ) ( VISIBLE_FROM ?AUTO_6862 ?AUTO_6868 ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6865 ?AUTO_6868 ) ( VISIBLE ?AUTO_6865 ?AUTO_6868 ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6869 ?AUTO_6865 ) ( VISIBLE ?AUTO_6869 ?AUTO_6865 ) ( CALIBRATION_TARGET ?AUTO_6864 ?AUTO_6870 ) ( VISIBLE_FROM ?AUTO_6870 ?AUTO_6869 ) ( not ( = ?AUTO_6862 ?AUTO_6870 ) ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6871 ?AUTO_6869 ) ( AT ?AUTO_6867 ?AUTO_6871 ) ( VISIBLE ?AUTO_6871 ?AUTO_6869 ) ( not ( = ?AUTO_6869 ?AUTO_6871 ) ) ( not ( = ?AUTO_6865 ?AUTO_6871 ) ) ( not ( = ?AUTO_6868 ?AUTO_6871 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6867 ?AUTO_6871 ?AUTO_6869 )
      ( GET_IMAGE_DATA ?AUTO_6862 ?AUTO_6863 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6862 ?AUTO_6863 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6872 - OBJECTIVE
      ?AUTO_6873 - MODE
    )
    :vars
    (
      ?AUTO_6879 - LANDER
      ?AUTO_6880 - WAYPOINT
      ?AUTO_6874 - WAYPOINT
      ?AUTO_6877 - ROVER
      ?AUTO_6881 - WAYPOINT
      ?AUTO_6876 - CAMERA
      ?AUTO_6875 - OBJECTIVE
      ?AUTO_6878 - WAYPOINT
      ?AUTO_6882 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6879 ?AUTO_6880 ) ( VISIBLE ?AUTO_6874 ?AUTO_6880 ) ( AVAILABLE ?AUTO_6877 ) ( CHANNEL_FREE ?AUTO_6879 ) ( not ( = ?AUTO_6874 ?AUTO_6880 ) ) ( CAN_TRAVERSE ?AUTO_6877 ?AUTO_6881 ?AUTO_6874 ) ( VISIBLE ?AUTO_6881 ?AUTO_6874 ) ( not ( = ?AUTO_6880 ?AUTO_6881 ) ) ( not ( = ?AUTO_6874 ?AUTO_6881 ) ) ( ON_BOARD ?AUTO_6876 ?AUTO_6877 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6877 ) ( SUPPORTS ?AUTO_6876 ?AUTO_6873 ) ( VISIBLE_FROM ?AUTO_6872 ?AUTO_6881 ) ( CAN_TRAVERSE ?AUTO_6877 ?AUTO_6874 ?AUTO_6881 ) ( VISIBLE ?AUTO_6874 ?AUTO_6881 ) ( CAN_TRAVERSE ?AUTO_6877 ?AUTO_6880 ?AUTO_6874 ) ( VISIBLE ?AUTO_6880 ?AUTO_6874 ) ( CALIBRATION_TARGET ?AUTO_6876 ?AUTO_6875 ) ( VISIBLE_FROM ?AUTO_6875 ?AUTO_6880 ) ( not ( = ?AUTO_6872 ?AUTO_6875 ) ) ( CAN_TRAVERSE ?AUTO_6877 ?AUTO_6878 ?AUTO_6880 ) ( VISIBLE ?AUTO_6878 ?AUTO_6880 ) ( not ( = ?AUTO_6880 ?AUTO_6878 ) ) ( not ( = ?AUTO_6874 ?AUTO_6878 ) ) ( not ( = ?AUTO_6881 ?AUTO_6878 ) ) ( CAN_TRAVERSE ?AUTO_6877 ?AUTO_6882 ?AUTO_6878 ) ( AT ?AUTO_6877 ?AUTO_6882 ) ( VISIBLE ?AUTO_6882 ?AUTO_6878 ) ( not ( = ?AUTO_6880 ?AUTO_6882 ) ) ( not ( = ?AUTO_6874 ?AUTO_6882 ) ) ( not ( = ?AUTO_6881 ?AUTO_6882 ) ) ( not ( = ?AUTO_6878 ?AUTO_6882 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6877 ?AUTO_6882 ?AUTO_6878 )
      ( GET_IMAGE_DATA ?AUTO_6872 ?AUTO_6873 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6872 ?AUTO_6873 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6940 - OBJECTIVE
      ?AUTO_6941 - MODE
    )
    :vars
    (
      ?AUTO_6946 - LANDER
      ?AUTO_6944 - WAYPOINT
      ?AUTO_6942 - WAYPOINT
      ?AUTO_6945 - ROVER
      ?AUTO_6943 - CAMERA
      ?AUTO_6947 - WAYPOINT
      ?AUTO_6948 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6946 ?AUTO_6944 ) ( VISIBLE ?AUTO_6942 ?AUTO_6944 ) ( AVAILABLE ?AUTO_6945 ) ( CHANNEL_FREE ?AUTO_6946 ) ( not ( = ?AUTO_6942 ?AUTO_6944 ) ) ( ON_BOARD ?AUTO_6943 ?AUTO_6945 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6945 ) ( SUPPORTS ?AUTO_6943 ?AUTO_6941 ) ( VISIBLE_FROM ?AUTO_6940 ?AUTO_6942 ) ( CALIBRATION_TARGET ?AUTO_6943 ?AUTO_6940 ) ( CAN_TRAVERSE ?AUTO_6945 ?AUTO_6944 ?AUTO_6942 ) ( VISIBLE ?AUTO_6944 ?AUTO_6942 ) ( CAN_TRAVERSE ?AUTO_6945 ?AUTO_6947 ?AUTO_6944 ) ( VISIBLE ?AUTO_6947 ?AUTO_6944 ) ( not ( = ?AUTO_6944 ?AUTO_6947 ) ) ( not ( = ?AUTO_6942 ?AUTO_6947 ) ) ( CAN_TRAVERSE ?AUTO_6945 ?AUTO_6948 ?AUTO_6947 ) ( AT ?AUTO_6945 ?AUTO_6948 ) ( VISIBLE ?AUTO_6948 ?AUTO_6947 ) ( not ( = ?AUTO_6944 ?AUTO_6948 ) ) ( not ( = ?AUTO_6942 ?AUTO_6948 ) ) ( not ( = ?AUTO_6947 ?AUTO_6948 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6945 ?AUTO_6948 ?AUTO_6947 )
      ( GET_IMAGE_DATA ?AUTO_6940 ?AUTO_6941 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6940 ?AUTO_6941 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6996 - OBJECTIVE
      ?AUTO_6997 - MODE
    )
    :vars
    (
      ?AUTO_7003 - LANDER
      ?AUTO_6999 - WAYPOINT
      ?AUTO_7004 - WAYPOINT
      ?AUTO_7002 - ROVER
      ?AUTO_6998 - WAYPOINT
      ?AUTO_7001 - CAMERA
      ?AUTO_7000 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7003 ?AUTO_6999 ) ( VISIBLE ?AUTO_7004 ?AUTO_6999 ) ( AVAILABLE ?AUTO_7002 ) ( CHANNEL_FREE ?AUTO_7003 ) ( not ( = ?AUTO_7004 ?AUTO_6999 ) ) ( CAN_TRAVERSE ?AUTO_7002 ?AUTO_6998 ?AUTO_7004 ) ( VISIBLE ?AUTO_6998 ?AUTO_7004 ) ( not ( = ?AUTO_6999 ?AUTO_6998 ) ) ( not ( = ?AUTO_7004 ?AUTO_6998 ) ) ( ON_BOARD ?AUTO_7001 ?AUTO_7002 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7002 ) ( SUPPORTS ?AUTO_7001 ?AUTO_6997 ) ( VISIBLE_FROM ?AUTO_6996 ?AUTO_6998 ) ( CALIBRATION_TARGET ?AUTO_7001 ?AUTO_7000 ) ( VISIBLE_FROM ?AUTO_7000 ?AUTO_6998 ) ( not ( = ?AUTO_6996 ?AUTO_7000 ) ) ( CAN_TRAVERSE ?AUTO_7002 ?AUTO_7004 ?AUTO_6998 ) ( AT ?AUTO_7002 ?AUTO_7004 ) ( VISIBLE ?AUTO_7004 ?AUTO_6998 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7002 ?AUTO_7004 ?AUTO_6998 )
      ( GET_IMAGE_DATA ?AUTO_6996 ?AUTO_6997 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6996 ?AUTO_6997 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7007 - OBJECTIVE
      ?AUTO_7008 - MODE
    )
    :vars
    (
      ?AUTO_7012 - LANDER
      ?AUTO_7011 - WAYPOINT
      ?AUTO_7010 - WAYPOINT
      ?AUTO_7014 - ROVER
      ?AUTO_7015 - WAYPOINT
      ?AUTO_7009 - CAMERA
      ?AUTO_7013 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7012 ?AUTO_7011 ) ( VISIBLE ?AUTO_7010 ?AUTO_7011 ) ( AVAILABLE ?AUTO_7014 ) ( CHANNEL_FREE ?AUTO_7012 ) ( not ( = ?AUTO_7010 ?AUTO_7011 ) ) ( CAN_TRAVERSE ?AUTO_7014 ?AUTO_7015 ?AUTO_7010 ) ( VISIBLE ?AUTO_7015 ?AUTO_7010 ) ( not ( = ?AUTO_7011 ?AUTO_7015 ) ) ( not ( = ?AUTO_7010 ?AUTO_7015 ) ) ( ON_BOARD ?AUTO_7009 ?AUTO_7014 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7014 ) ( SUPPORTS ?AUTO_7009 ?AUTO_7008 ) ( VISIBLE_FROM ?AUTO_7007 ?AUTO_7015 ) ( CALIBRATION_TARGET ?AUTO_7009 ?AUTO_7013 ) ( VISIBLE_FROM ?AUTO_7013 ?AUTO_7015 ) ( not ( = ?AUTO_7007 ?AUTO_7013 ) ) ( CAN_TRAVERSE ?AUTO_7014 ?AUTO_7010 ?AUTO_7015 ) ( VISIBLE ?AUTO_7010 ?AUTO_7015 ) ( CAN_TRAVERSE ?AUTO_7014 ?AUTO_7011 ?AUTO_7010 ) ( AT ?AUTO_7014 ?AUTO_7011 ) ( VISIBLE ?AUTO_7011 ?AUTO_7010 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7014 ?AUTO_7011 ?AUTO_7010 )
      ( GET_IMAGE_DATA ?AUTO_7007 ?AUTO_7008 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7007 ?AUTO_7008 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7046 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7051 - LANDER
      ?AUTO_7047 - WAYPOINT
      ?AUTO_7050 - WAYPOINT
      ?AUTO_7052 - ROVER
      ?AUTO_7048 - WAYPOINT
      ?AUTO_7049 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7051 ?AUTO_7047 ) ( VISIBLE ?AUTO_7050 ?AUTO_7047 ) ( AVAILABLE ?AUTO_7052 ) ( CHANNEL_FREE ?AUTO_7051 ) ( not ( = ?AUTO_7046 ?AUTO_7050 ) ) ( not ( = ?AUTO_7046 ?AUTO_7047 ) ) ( not ( = ?AUTO_7050 ?AUTO_7047 ) ) ( CAN_TRAVERSE ?AUTO_7052 ?AUTO_7048 ?AUTO_7050 ) ( VISIBLE ?AUTO_7048 ?AUTO_7050 ) ( not ( = ?AUTO_7046 ?AUTO_7048 ) ) ( not ( = ?AUTO_7047 ?AUTO_7048 ) ) ( not ( = ?AUTO_7050 ?AUTO_7048 ) ) ( CAN_TRAVERSE ?AUTO_7052 ?AUTO_7046 ?AUTO_7048 ) ( VISIBLE ?AUTO_7046 ?AUTO_7048 ) ( AT_SOIL_SAMPLE ?AUTO_7046 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7052 ) ( STORE_OF ?AUTO_7049 ?AUTO_7052 ) ( EMPTY ?AUTO_7049 ) ( CAN_TRAVERSE ?AUTO_7052 ?AUTO_7050 ?AUTO_7046 ) ( AT ?AUTO_7052 ?AUTO_7050 ) ( VISIBLE ?AUTO_7050 ?AUTO_7046 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7052 ?AUTO_7050 ?AUTO_7046 )
      ( GET_SOIL_DATA ?AUTO_7046 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7046 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7059 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7061 - LANDER
      ?AUTO_7063 - WAYPOINT
      ?AUTO_7062 - WAYPOINT
      ?AUTO_7064 - ROVER
      ?AUTO_7065 - WAYPOINT
      ?AUTO_7060 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7061 ?AUTO_7063 ) ( VISIBLE ?AUTO_7062 ?AUTO_7063 ) ( AVAILABLE ?AUTO_7064 ) ( CHANNEL_FREE ?AUTO_7061 ) ( not ( = ?AUTO_7059 ?AUTO_7062 ) ) ( not ( = ?AUTO_7059 ?AUTO_7063 ) ) ( not ( = ?AUTO_7062 ?AUTO_7063 ) ) ( CAN_TRAVERSE ?AUTO_7064 ?AUTO_7065 ?AUTO_7062 ) ( VISIBLE ?AUTO_7065 ?AUTO_7062 ) ( not ( = ?AUTO_7059 ?AUTO_7065 ) ) ( not ( = ?AUTO_7063 ?AUTO_7065 ) ) ( not ( = ?AUTO_7062 ?AUTO_7065 ) ) ( CAN_TRAVERSE ?AUTO_7064 ?AUTO_7059 ?AUTO_7065 ) ( VISIBLE ?AUTO_7059 ?AUTO_7065 ) ( AT_SOIL_SAMPLE ?AUTO_7059 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7064 ) ( STORE_OF ?AUTO_7060 ?AUTO_7064 ) ( EMPTY ?AUTO_7060 ) ( CAN_TRAVERSE ?AUTO_7064 ?AUTO_7062 ?AUTO_7059 ) ( VISIBLE ?AUTO_7062 ?AUTO_7059 ) ( CAN_TRAVERSE ?AUTO_7064 ?AUTO_7063 ?AUTO_7062 ) ( AT ?AUTO_7064 ?AUTO_7063 ) ( VISIBLE ?AUTO_7063 ?AUTO_7062 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7064 ?AUTO_7063 ?AUTO_7062 )
      ( GET_SOIL_DATA ?AUTO_7059 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7059 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7066 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7068 - LANDER
      ?AUTO_7071 - WAYPOINT
      ?AUTO_7072 - WAYPOINT
      ?AUTO_7069 - ROVER
      ?AUTO_7067 - WAYPOINT
      ?AUTO_7070 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7068 ?AUTO_7071 ) ( VISIBLE ?AUTO_7072 ?AUTO_7071 ) ( AVAILABLE ?AUTO_7069 ) ( CHANNEL_FREE ?AUTO_7068 ) ( not ( = ?AUTO_7066 ?AUTO_7072 ) ) ( not ( = ?AUTO_7066 ?AUTO_7071 ) ) ( not ( = ?AUTO_7072 ?AUTO_7071 ) ) ( CAN_TRAVERSE ?AUTO_7069 ?AUTO_7067 ?AUTO_7072 ) ( VISIBLE ?AUTO_7067 ?AUTO_7072 ) ( not ( = ?AUTO_7066 ?AUTO_7067 ) ) ( not ( = ?AUTO_7071 ?AUTO_7067 ) ) ( not ( = ?AUTO_7072 ?AUTO_7067 ) ) ( CAN_TRAVERSE ?AUTO_7069 ?AUTO_7066 ?AUTO_7067 ) ( VISIBLE ?AUTO_7066 ?AUTO_7067 ) ( AT_SOIL_SAMPLE ?AUTO_7066 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7069 ) ( STORE_OF ?AUTO_7070 ?AUTO_7069 ) ( CAN_TRAVERSE ?AUTO_7069 ?AUTO_7072 ?AUTO_7066 ) ( VISIBLE ?AUTO_7072 ?AUTO_7066 ) ( CAN_TRAVERSE ?AUTO_7069 ?AUTO_7071 ?AUTO_7072 ) ( AT ?AUTO_7069 ?AUTO_7071 ) ( VISIBLE ?AUTO_7071 ?AUTO_7072 ) ( FULL ?AUTO_7070 ) )
    :subtasks
    ( ( !DROP ?AUTO_7069 ?AUTO_7070 )
      ( GET_SOIL_DATA ?AUTO_7066 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7066 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7101 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7106 - LANDER
      ?AUTO_7105 - WAYPOINT
      ?AUTO_7103 - WAYPOINT
      ?AUTO_7102 - ROVER
      ?AUTO_7104 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7106 ?AUTO_7105 ) ( VISIBLE ?AUTO_7103 ?AUTO_7105 ) ( AVAILABLE ?AUTO_7102 ) ( CHANNEL_FREE ?AUTO_7106 ) ( not ( = ?AUTO_7101 ?AUTO_7103 ) ) ( not ( = ?AUTO_7101 ?AUTO_7105 ) ) ( not ( = ?AUTO_7103 ?AUTO_7105 ) ) ( CAN_TRAVERSE ?AUTO_7102 ?AUTO_7101 ?AUTO_7103 ) ( AT ?AUTO_7102 ?AUTO_7101 ) ( VISIBLE ?AUTO_7101 ?AUTO_7103 ) ( AT_SOIL_SAMPLE ?AUTO_7101 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7102 ) ( STORE_OF ?AUTO_7104 ?AUTO_7102 ) ( FULL ?AUTO_7104 ) )
    :subtasks
    ( ( !DROP ?AUTO_7102 ?AUTO_7104 )
      ( GET_SOIL_DATA ?AUTO_7101 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7101 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7107 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7109 - LANDER
      ?AUTO_7111 - WAYPOINT
      ?AUTO_7110 - WAYPOINT
      ?AUTO_7108 - ROVER
      ?AUTO_7112 - STORE
      ?AUTO_7113 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7109 ?AUTO_7111 ) ( VISIBLE ?AUTO_7110 ?AUTO_7111 ) ( AVAILABLE ?AUTO_7108 ) ( CHANNEL_FREE ?AUTO_7109 ) ( not ( = ?AUTO_7107 ?AUTO_7110 ) ) ( not ( = ?AUTO_7107 ?AUTO_7111 ) ) ( not ( = ?AUTO_7110 ?AUTO_7111 ) ) ( CAN_TRAVERSE ?AUTO_7108 ?AUTO_7107 ?AUTO_7110 ) ( VISIBLE ?AUTO_7107 ?AUTO_7110 ) ( AT_SOIL_SAMPLE ?AUTO_7107 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7108 ) ( STORE_OF ?AUTO_7112 ?AUTO_7108 ) ( FULL ?AUTO_7112 ) ( CAN_TRAVERSE ?AUTO_7108 ?AUTO_7113 ?AUTO_7107 ) ( AT ?AUTO_7108 ?AUTO_7113 ) ( VISIBLE ?AUTO_7113 ?AUTO_7107 ) ( not ( = ?AUTO_7107 ?AUTO_7113 ) ) ( not ( = ?AUTO_7111 ?AUTO_7113 ) ) ( not ( = ?AUTO_7110 ?AUTO_7113 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7108 ?AUTO_7113 ?AUTO_7107 )
      ( GET_SOIL_DATA ?AUTO_7107 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7107 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7114 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7115 - LANDER
      ?AUTO_7116 - WAYPOINT
      ?AUTO_7118 - WAYPOINT
      ?AUTO_7119 - ROVER
      ?AUTO_7120 - STORE
      ?AUTO_7117 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7115 ?AUTO_7116 ) ( VISIBLE ?AUTO_7118 ?AUTO_7116 ) ( AVAILABLE ?AUTO_7119 ) ( CHANNEL_FREE ?AUTO_7115 ) ( not ( = ?AUTO_7114 ?AUTO_7118 ) ) ( not ( = ?AUTO_7114 ?AUTO_7116 ) ) ( not ( = ?AUTO_7118 ?AUTO_7116 ) ) ( CAN_TRAVERSE ?AUTO_7119 ?AUTO_7114 ?AUTO_7118 ) ( VISIBLE ?AUTO_7114 ?AUTO_7118 ) ( AT_SOIL_SAMPLE ?AUTO_7114 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7119 ) ( STORE_OF ?AUTO_7120 ?AUTO_7119 ) ( CAN_TRAVERSE ?AUTO_7119 ?AUTO_7117 ?AUTO_7114 ) ( AT ?AUTO_7119 ?AUTO_7117 ) ( VISIBLE ?AUTO_7117 ?AUTO_7114 ) ( not ( = ?AUTO_7114 ?AUTO_7117 ) ) ( not ( = ?AUTO_7116 ?AUTO_7117 ) ) ( not ( = ?AUTO_7118 ?AUTO_7117 ) ) ( AT_SOIL_SAMPLE ?AUTO_7117 ) ( EMPTY ?AUTO_7120 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_7119 ?AUTO_7120 ?AUTO_7117 )
      ( GET_SOIL_DATA ?AUTO_7114 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7114 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7175 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7178 - LANDER
      ?AUTO_7179 - WAYPOINT
      ?AUTO_7176 - WAYPOINT
      ?AUTO_7180 - ROVER
      ?AUTO_7177 - STORE
      ?AUTO_7181 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7178 ?AUTO_7179 ) ( VISIBLE ?AUTO_7176 ?AUTO_7179 ) ( AVAILABLE ?AUTO_7180 ) ( CHANNEL_FREE ?AUTO_7178 ) ( not ( = ?AUTO_7175 ?AUTO_7176 ) ) ( not ( = ?AUTO_7175 ?AUTO_7179 ) ) ( not ( = ?AUTO_7176 ?AUTO_7179 ) ) ( CAN_TRAVERSE ?AUTO_7180 ?AUTO_7175 ?AUTO_7176 ) ( VISIBLE ?AUTO_7175 ?AUTO_7176 ) ( AT_ROCK_SAMPLE ?AUTO_7175 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7180 ) ( STORE_OF ?AUTO_7177 ?AUTO_7180 ) ( FULL ?AUTO_7177 ) ( CAN_TRAVERSE ?AUTO_7180 ?AUTO_7181 ?AUTO_7175 ) ( AT ?AUTO_7180 ?AUTO_7181 ) ( VISIBLE ?AUTO_7181 ?AUTO_7175 ) ( not ( = ?AUTO_7175 ?AUTO_7181 ) ) ( not ( = ?AUTO_7179 ?AUTO_7181 ) ) ( not ( = ?AUTO_7176 ?AUTO_7181 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7180 ?AUTO_7181 ?AUTO_7175 )
      ( GET_ROCK_DATA ?AUTO_7175 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7175 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7182 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7185 - LANDER
      ?AUTO_7184 - WAYPOINT
      ?AUTO_7187 - WAYPOINT
      ?AUTO_7188 - ROVER
      ?AUTO_7183 - STORE
      ?AUTO_7186 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7185 ?AUTO_7184 ) ( VISIBLE ?AUTO_7187 ?AUTO_7184 ) ( AVAILABLE ?AUTO_7188 ) ( CHANNEL_FREE ?AUTO_7185 ) ( not ( = ?AUTO_7182 ?AUTO_7187 ) ) ( not ( = ?AUTO_7182 ?AUTO_7184 ) ) ( not ( = ?AUTO_7187 ?AUTO_7184 ) ) ( CAN_TRAVERSE ?AUTO_7188 ?AUTO_7182 ?AUTO_7187 ) ( VISIBLE ?AUTO_7182 ?AUTO_7187 ) ( AT_ROCK_SAMPLE ?AUTO_7182 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7188 ) ( STORE_OF ?AUTO_7183 ?AUTO_7188 ) ( CAN_TRAVERSE ?AUTO_7188 ?AUTO_7186 ?AUTO_7182 ) ( AT ?AUTO_7188 ?AUTO_7186 ) ( VISIBLE ?AUTO_7186 ?AUTO_7182 ) ( not ( = ?AUTO_7182 ?AUTO_7186 ) ) ( not ( = ?AUTO_7184 ?AUTO_7186 ) ) ( not ( = ?AUTO_7187 ?AUTO_7186 ) ) ( AT_SOIL_SAMPLE ?AUTO_7186 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7188 ) ( EMPTY ?AUTO_7183 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_7188 ?AUTO_7183 ?AUTO_7186 )
      ( GET_ROCK_DATA ?AUTO_7182 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7182 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7228 - OBJECTIVE
      ?AUTO_7229 - MODE
    )
    :vars
    (
      ?AUTO_7234 - LANDER
      ?AUTO_7230 - WAYPOINT
      ?AUTO_7235 - WAYPOINT
      ?AUTO_7231 - ROVER
      ?AUTO_7232 - WAYPOINT
      ?AUTO_7233 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7234 ?AUTO_7230 ) ( VISIBLE ?AUTO_7235 ?AUTO_7230 ) ( AVAILABLE ?AUTO_7231 ) ( CHANNEL_FREE ?AUTO_7234 ) ( not ( = ?AUTO_7235 ?AUTO_7230 ) ) ( CAN_TRAVERSE ?AUTO_7231 ?AUTO_7232 ?AUTO_7235 ) ( VISIBLE ?AUTO_7232 ?AUTO_7235 ) ( not ( = ?AUTO_7230 ?AUTO_7232 ) ) ( not ( = ?AUTO_7235 ?AUTO_7232 ) ) ( ON_BOARD ?AUTO_7233 ?AUTO_7231 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7231 ) ( SUPPORTS ?AUTO_7233 ?AUTO_7229 ) ( VISIBLE_FROM ?AUTO_7228 ?AUTO_7232 ) ( CALIBRATION_TARGET ?AUTO_7233 ?AUTO_7228 ) ( CAN_TRAVERSE ?AUTO_7231 ?AUTO_7235 ?AUTO_7232 ) ( VISIBLE ?AUTO_7235 ?AUTO_7232 ) ( CAN_TRAVERSE ?AUTO_7231 ?AUTO_7230 ?AUTO_7235 ) ( AT ?AUTO_7231 ?AUTO_7230 ) ( VISIBLE ?AUTO_7230 ?AUTO_7235 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7231 ?AUTO_7230 ?AUTO_7235 )
      ( GET_IMAGE_DATA ?AUTO_7228 ?AUTO_7229 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7228 ?AUTO_7229 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7236 - OBJECTIVE
      ?AUTO_7237 - MODE
    )
    :vars
    (
      ?AUTO_7239 - LANDER
      ?AUTO_7240 - WAYPOINT
      ?AUTO_7242 - WAYPOINT
      ?AUTO_7238 - ROVER
      ?AUTO_7243 - WAYPOINT
      ?AUTO_7241 - CAMERA
      ?AUTO_7244 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7239 ?AUTO_7240 ) ( VISIBLE ?AUTO_7242 ?AUTO_7240 ) ( AVAILABLE ?AUTO_7238 ) ( CHANNEL_FREE ?AUTO_7239 ) ( not ( = ?AUTO_7242 ?AUTO_7240 ) ) ( CAN_TRAVERSE ?AUTO_7238 ?AUTO_7243 ?AUTO_7242 ) ( VISIBLE ?AUTO_7243 ?AUTO_7242 ) ( not ( = ?AUTO_7240 ?AUTO_7243 ) ) ( not ( = ?AUTO_7242 ?AUTO_7243 ) ) ( ON_BOARD ?AUTO_7241 ?AUTO_7238 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7238 ) ( SUPPORTS ?AUTO_7241 ?AUTO_7237 ) ( VISIBLE_FROM ?AUTO_7236 ?AUTO_7243 ) ( CALIBRATION_TARGET ?AUTO_7241 ?AUTO_7236 ) ( CAN_TRAVERSE ?AUTO_7238 ?AUTO_7242 ?AUTO_7243 ) ( VISIBLE ?AUTO_7242 ?AUTO_7243 ) ( CAN_TRAVERSE ?AUTO_7238 ?AUTO_7240 ?AUTO_7242 ) ( VISIBLE ?AUTO_7240 ?AUTO_7242 ) ( CAN_TRAVERSE ?AUTO_7238 ?AUTO_7244 ?AUTO_7240 ) ( AT ?AUTO_7238 ?AUTO_7244 ) ( VISIBLE ?AUTO_7244 ?AUTO_7240 ) ( not ( = ?AUTO_7240 ?AUTO_7244 ) ) ( not ( = ?AUTO_7242 ?AUTO_7244 ) ) ( not ( = ?AUTO_7243 ?AUTO_7244 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7238 ?AUTO_7244 ?AUTO_7240 )
      ( GET_IMAGE_DATA ?AUTO_7236 ?AUTO_7237 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7236 ?AUTO_7237 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7277 - OBJECTIVE
      ?AUTO_7278 - MODE
    )
    :vars
    (
      ?AUTO_7280 - LANDER
      ?AUTO_7283 - WAYPOINT
      ?AUTO_7279 - WAYPOINT
      ?AUTO_7281 - ROVER
      ?AUTO_7284 - CAMERA
      ?AUTO_7282 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7280 ?AUTO_7283 ) ( VISIBLE ?AUTO_7279 ?AUTO_7283 ) ( AVAILABLE ?AUTO_7281 ) ( CHANNEL_FREE ?AUTO_7280 ) ( not ( = ?AUTO_7279 ?AUTO_7283 ) ) ( ON_BOARD ?AUTO_7284 ?AUTO_7281 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7281 ) ( SUPPORTS ?AUTO_7284 ?AUTO_7278 ) ( VISIBLE_FROM ?AUTO_7277 ?AUTO_7279 ) ( CALIBRATION_TARGET ?AUTO_7284 ?AUTO_7277 ) ( CAN_TRAVERSE ?AUTO_7281 ?AUTO_7282 ?AUTO_7279 ) ( VISIBLE ?AUTO_7282 ?AUTO_7279 ) ( not ( = ?AUTO_7283 ?AUTO_7282 ) ) ( not ( = ?AUTO_7279 ?AUTO_7282 ) ) ( CAN_TRAVERSE ?AUTO_7281 ?AUTO_7283 ?AUTO_7282 ) ( AT ?AUTO_7281 ?AUTO_7283 ) ( VISIBLE ?AUTO_7283 ?AUTO_7282 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7281 ?AUTO_7283 ?AUTO_7282 )
      ( GET_IMAGE_DATA ?AUTO_7277 ?AUTO_7278 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7277 ?AUTO_7278 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7285 - OBJECTIVE
      ?AUTO_7286 - MODE
    )
    :vars
    (
      ?AUTO_7292 - LANDER
      ?AUTO_7290 - WAYPOINT
      ?AUTO_7291 - WAYPOINT
      ?AUTO_7289 - ROVER
      ?AUTO_7288 - CAMERA
      ?AUTO_7287 - WAYPOINT
      ?AUTO_7293 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7292 ?AUTO_7290 ) ( VISIBLE ?AUTO_7291 ?AUTO_7290 ) ( AVAILABLE ?AUTO_7289 ) ( CHANNEL_FREE ?AUTO_7292 ) ( not ( = ?AUTO_7291 ?AUTO_7290 ) ) ( ON_BOARD ?AUTO_7288 ?AUTO_7289 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7289 ) ( SUPPORTS ?AUTO_7288 ?AUTO_7286 ) ( VISIBLE_FROM ?AUTO_7285 ?AUTO_7291 ) ( CALIBRATION_TARGET ?AUTO_7288 ?AUTO_7285 ) ( CAN_TRAVERSE ?AUTO_7289 ?AUTO_7287 ?AUTO_7291 ) ( VISIBLE ?AUTO_7287 ?AUTO_7291 ) ( not ( = ?AUTO_7290 ?AUTO_7287 ) ) ( not ( = ?AUTO_7291 ?AUTO_7287 ) ) ( CAN_TRAVERSE ?AUTO_7289 ?AUTO_7290 ?AUTO_7287 ) ( VISIBLE ?AUTO_7290 ?AUTO_7287 ) ( CAN_TRAVERSE ?AUTO_7289 ?AUTO_7293 ?AUTO_7290 ) ( AT ?AUTO_7289 ?AUTO_7293 ) ( VISIBLE ?AUTO_7293 ?AUTO_7290 ) ( not ( = ?AUTO_7290 ?AUTO_7293 ) ) ( not ( = ?AUTO_7291 ?AUTO_7293 ) ) ( not ( = ?AUTO_7287 ?AUTO_7293 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7289 ?AUTO_7293 ?AUTO_7290 )
      ( GET_IMAGE_DATA ?AUTO_7285 ?AUTO_7286 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7285 ?AUTO_7286 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7294 - OBJECTIVE
      ?AUTO_7295 - MODE
    )
    :vars
    (
      ?AUTO_7299 - LANDER
      ?AUTO_7298 - WAYPOINT
      ?AUTO_7301 - WAYPOINT
      ?AUTO_7302 - ROVER
      ?AUTO_7296 - CAMERA
      ?AUTO_7300 - WAYPOINT
      ?AUTO_7297 - WAYPOINT
      ?AUTO_7303 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7299 ?AUTO_7298 ) ( VISIBLE ?AUTO_7301 ?AUTO_7298 ) ( AVAILABLE ?AUTO_7302 ) ( CHANNEL_FREE ?AUTO_7299 ) ( not ( = ?AUTO_7301 ?AUTO_7298 ) ) ( ON_BOARD ?AUTO_7296 ?AUTO_7302 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7302 ) ( SUPPORTS ?AUTO_7296 ?AUTO_7295 ) ( VISIBLE_FROM ?AUTO_7294 ?AUTO_7301 ) ( CALIBRATION_TARGET ?AUTO_7296 ?AUTO_7294 ) ( CAN_TRAVERSE ?AUTO_7302 ?AUTO_7300 ?AUTO_7301 ) ( VISIBLE ?AUTO_7300 ?AUTO_7301 ) ( not ( = ?AUTO_7298 ?AUTO_7300 ) ) ( not ( = ?AUTO_7301 ?AUTO_7300 ) ) ( CAN_TRAVERSE ?AUTO_7302 ?AUTO_7298 ?AUTO_7300 ) ( VISIBLE ?AUTO_7298 ?AUTO_7300 ) ( CAN_TRAVERSE ?AUTO_7302 ?AUTO_7297 ?AUTO_7298 ) ( VISIBLE ?AUTO_7297 ?AUTO_7298 ) ( not ( = ?AUTO_7298 ?AUTO_7297 ) ) ( not ( = ?AUTO_7301 ?AUTO_7297 ) ) ( not ( = ?AUTO_7300 ?AUTO_7297 ) ) ( CAN_TRAVERSE ?AUTO_7302 ?AUTO_7303 ?AUTO_7297 ) ( AT ?AUTO_7302 ?AUTO_7303 ) ( VISIBLE ?AUTO_7303 ?AUTO_7297 ) ( not ( = ?AUTO_7298 ?AUTO_7303 ) ) ( not ( = ?AUTO_7301 ?AUTO_7303 ) ) ( not ( = ?AUTO_7300 ?AUTO_7303 ) ) ( not ( = ?AUTO_7297 ?AUTO_7303 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7302 ?AUTO_7303 ?AUTO_7297 )
      ( GET_IMAGE_DATA ?AUTO_7294 ?AUTO_7295 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7294 ?AUTO_7295 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7306 - OBJECTIVE
      ?AUTO_7307 - MODE
    )
    :vars
    (
      ?AUTO_7311 - LANDER
      ?AUTO_7314 - WAYPOINT
      ?AUTO_7308 - WAYPOINT
      ?AUTO_7310 - ROVER
      ?AUTO_7315 - CAMERA
      ?AUTO_7309 - WAYPOINT
      ?AUTO_7312 - WAYPOINT
      ?AUTO_7313 - WAYPOINT
      ?AUTO_7316 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7311 ?AUTO_7314 ) ( VISIBLE ?AUTO_7308 ?AUTO_7314 ) ( AVAILABLE ?AUTO_7310 ) ( CHANNEL_FREE ?AUTO_7311 ) ( not ( = ?AUTO_7308 ?AUTO_7314 ) ) ( ON_BOARD ?AUTO_7315 ?AUTO_7310 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7310 ) ( SUPPORTS ?AUTO_7315 ?AUTO_7307 ) ( VISIBLE_FROM ?AUTO_7306 ?AUTO_7308 ) ( CALIBRATION_TARGET ?AUTO_7315 ?AUTO_7306 ) ( CAN_TRAVERSE ?AUTO_7310 ?AUTO_7309 ?AUTO_7308 ) ( VISIBLE ?AUTO_7309 ?AUTO_7308 ) ( not ( = ?AUTO_7314 ?AUTO_7309 ) ) ( not ( = ?AUTO_7308 ?AUTO_7309 ) ) ( CAN_TRAVERSE ?AUTO_7310 ?AUTO_7314 ?AUTO_7309 ) ( VISIBLE ?AUTO_7314 ?AUTO_7309 ) ( CAN_TRAVERSE ?AUTO_7310 ?AUTO_7312 ?AUTO_7314 ) ( VISIBLE ?AUTO_7312 ?AUTO_7314 ) ( not ( = ?AUTO_7314 ?AUTO_7312 ) ) ( not ( = ?AUTO_7308 ?AUTO_7312 ) ) ( not ( = ?AUTO_7309 ?AUTO_7312 ) ) ( CAN_TRAVERSE ?AUTO_7310 ?AUTO_7313 ?AUTO_7312 ) ( VISIBLE ?AUTO_7313 ?AUTO_7312 ) ( not ( = ?AUTO_7314 ?AUTO_7313 ) ) ( not ( = ?AUTO_7308 ?AUTO_7313 ) ) ( not ( = ?AUTO_7309 ?AUTO_7313 ) ) ( not ( = ?AUTO_7312 ?AUTO_7313 ) ) ( CAN_TRAVERSE ?AUTO_7310 ?AUTO_7316 ?AUTO_7313 ) ( AT ?AUTO_7310 ?AUTO_7316 ) ( VISIBLE ?AUTO_7316 ?AUTO_7313 ) ( not ( = ?AUTO_7314 ?AUTO_7316 ) ) ( not ( = ?AUTO_7308 ?AUTO_7316 ) ) ( not ( = ?AUTO_7309 ?AUTO_7316 ) ) ( not ( = ?AUTO_7312 ?AUTO_7316 ) ) ( not ( = ?AUTO_7313 ?AUTO_7316 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7310 ?AUTO_7316 ?AUTO_7313 )
      ( GET_IMAGE_DATA ?AUTO_7306 ?AUTO_7307 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7306 ?AUTO_7307 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7342 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7346 - LANDER
      ?AUTO_7343 - WAYPOINT
      ?AUTO_7345 - WAYPOINT
      ?AUTO_7347 - ROVER
      ?AUTO_7344 - WAYPOINT
      ?AUTO_7348 - STORE
      ?AUTO_7349 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7346 ?AUTO_7343 ) ( VISIBLE ?AUTO_7345 ?AUTO_7343 ) ( AVAILABLE ?AUTO_7347 ) ( CHANNEL_FREE ?AUTO_7346 ) ( not ( = ?AUTO_7342 ?AUTO_7345 ) ) ( not ( = ?AUTO_7342 ?AUTO_7343 ) ) ( not ( = ?AUTO_7345 ?AUTO_7343 ) ) ( CAN_TRAVERSE ?AUTO_7347 ?AUTO_7344 ?AUTO_7345 ) ( VISIBLE ?AUTO_7344 ?AUTO_7345 ) ( not ( = ?AUTO_7342 ?AUTO_7344 ) ) ( not ( = ?AUTO_7343 ?AUTO_7344 ) ) ( not ( = ?AUTO_7345 ?AUTO_7344 ) ) ( CAN_TRAVERSE ?AUTO_7347 ?AUTO_7342 ?AUTO_7344 ) ( VISIBLE ?AUTO_7342 ?AUTO_7344 ) ( AT_ROCK_SAMPLE ?AUTO_7342 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7347 ) ( STORE_OF ?AUTO_7348 ?AUTO_7347 ) ( EMPTY ?AUTO_7348 ) ( CAN_TRAVERSE ?AUTO_7347 ?AUTO_7349 ?AUTO_7342 ) ( AT ?AUTO_7347 ?AUTO_7349 ) ( VISIBLE ?AUTO_7349 ?AUTO_7342 ) ( not ( = ?AUTO_7342 ?AUTO_7349 ) ) ( not ( = ?AUTO_7343 ?AUTO_7349 ) ) ( not ( = ?AUTO_7345 ?AUTO_7349 ) ) ( not ( = ?AUTO_7344 ?AUTO_7349 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7347 ?AUTO_7349 ?AUTO_7342 )
      ( GET_ROCK_DATA ?AUTO_7342 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7342 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7384 - OBJECTIVE
      ?AUTO_7385 - MODE
    )
    :vars
    (
      ?AUTO_7390 - LANDER
      ?AUTO_7386 - WAYPOINT
      ?AUTO_7391 - WAYPOINT
      ?AUTO_7387 - ROVER
      ?AUTO_7389 - WAYPOINT
      ?AUTO_7388 - WAYPOINT
      ?AUTO_7392 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7390 ?AUTO_7386 ) ( VISIBLE ?AUTO_7391 ?AUTO_7386 ) ( AVAILABLE ?AUTO_7387 ) ( CHANNEL_FREE ?AUTO_7390 ) ( not ( = ?AUTO_7391 ?AUTO_7386 ) ) ( CAN_TRAVERSE ?AUTO_7387 ?AUTO_7389 ?AUTO_7391 ) ( VISIBLE ?AUTO_7389 ?AUTO_7391 ) ( not ( = ?AUTO_7386 ?AUTO_7389 ) ) ( not ( = ?AUTO_7391 ?AUTO_7389 ) ) ( CAN_TRAVERSE ?AUTO_7387 ?AUTO_7388 ?AUTO_7389 ) ( VISIBLE ?AUTO_7388 ?AUTO_7389 ) ( not ( = ?AUTO_7386 ?AUTO_7388 ) ) ( not ( = ?AUTO_7391 ?AUTO_7388 ) ) ( not ( = ?AUTO_7389 ?AUTO_7388 ) ) ( CALIBRATED ?AUTO_7392 ?AUTO_7387 ) ( ON_BOARD ?AUTO_7392 ?AUTO_7387 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7387 ) ( SUPPORTS ?AUTO_7392 ?AUTO_7385 ) ( VISIBLE_FROM ?AUTO_7384 ?AUTO_7388 ) ( CAN_TRAVERSE ?AUTO_7387 ?AUTO_7389 ?AUTO_7388 ) ( AT ?AUTO_7387 ?AUTO_7389 ) ( VISIBLE ?AUTO_7389 ?AUTO_7388 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7387 ?AUTO_7389 ?AUTO_7388 )
      ( GET_IMAGE_DATA ?AUTO_7384 ?AUTO_7385 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7384 ?AUTO_7385 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7405 - OBJECTIVE
      ?AUTO_7406 - MODE
    )
    :vars
    (
      ?AUTO_7407 - LANDER
      ?AUTO_7412 - WAYPOINT
      ?AUTO_7411 - WAYPOINT
      ?AUTO_7409 - ROVER
      ?AUTO_7408 - WAYPOINT
      ?AUTO_7410 - WAYPOINT
      ?AUTO_7413 - CAMERA
      ?AUTO_7414 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7407 ?AUTO_7412 ) ( VISIBLE ?AUTO_7411 ?AUTO_7412 ) ( AVAILABLE ?AUTO_7409 ) ( CHANNEL_FREE ?AUTO_7407 ) ( not ( = ?AUTO_7411 ?AUTO_7412 ) ) ( CAN_TRAVERSE ?AUTO_7409 ?AUTO_7408 ?AUTO_7411 ) ( VISIBLE ?AUTO_7408 ?AUTO_7411 ) ( not ( = ?AUTO_7412 ?AUTO_7408 ) ) ( not ( = ?AUTO_7411 ?AUTO_7408 ) ) ( CAN_TRAVERSE ?AUTO_7409 ?AUTO_7410 ?AUTO_7408 ) ( VISIBLE ?AUTO_7410 ?AUTO_7408 ) ( not ( = ?AUTO_7412 ?AUTO_7410 ) ) ( not ( = ?AUTO_7411 ?AUTO_7410 ) ) ( not ( = ?AUTO_7408 ?AUTO_7410 ) ) ( ON_BOARD ?AUTO_7413 ?AUTO_7409 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7409 ) ( SUPPORTS ?AUTO_7413 ?AUTO_7406 ) ( VISIBLE_FROM ?AUTO_7405 ?AUTO_7410 ) ( CAN_TRAVERSE ?AUTO_7409 ?AUTO_7408 ?AUTO_7410 ) ( AT ?AUTO_7409 ?AUTO_7408 ) ( VISIBLE ?AUTO_7408 ?AUTO_7410 ) ( CALIBRATION_TARGET ?AUTO_7413 ?AUTO_7414 ) ( VISIBLE_FROM ?AUTO_7414 ?AUTO_7408 ) ( not ( = ?AUTO_7405 ?AUTO_7414 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7409 ?AUTO_7413 ?AUTO_7414 ?AUTO_7408 )
      ( GET_IMAGE_DATA ?AUTO_7405 ?AUTO_7406 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7405 ?AUTO_7406 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7443 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7446 - LANDER
      ?AUTO_7447 - WAYPOINT
      ?AUTO_7444 - ROVER
      ?AUTO_7448 - STORE
      ?AUTO_7445 - WAYPOINT
      ?AUTO_7449 - WAYPOINT
      ?AUTO_7450 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7446 ?AUTO_7443 ) ( VISIBLE ?AUTO_7447 ?AUTO_7443 ) ( AVAILABLE ?AUTO_7444 ) ( CHANNEL_FREE ?AUTO_7446 ) ( not ( = ?AUTO_7443 ?AUTO_7447 ) ) ( CAN_TRAVERSE ?AUTO_7444 ?AUTO_7443 ?AUTO_7447 ) ( VISIBLE ?AUTO_7443 ?AUTO_7447 ) ( AT_SOIL_SAMPLE ?AUTO_7443 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7444 ) ( STORE_OF ?AUTO_7448 ?AUTO_7444 ) ( EMPTY ?AUTO_7448 ) ( CAN_TRAVERSE ?AUTO_7444 ?AUTO_7445 ?AUTO_7443 ) ( VISIBLE ?AUTO_7445 ?AUTO_7443 ) ( not ( = ?AUTO_7443 ?AUTO_7445 ) ) ( not ( = ?AUTO_7447 ?AUTO_7445 ) ) ( CAN_TRAVERSE ?AUTO_7444 ?AUTO_7449 ?AUTO_7445 ) ( VISIBLE ?AUTO_7449 ?AUTO_7445 ) ( not ( = ?AUTO_7443 ?AUTO_7449 ) ) ( not ( = ?AUTO_7447 ?AUTO_7449 ) ) ( not ( = ?AUTO_7445 ?AUTO_7449 ) ) ( CAN_TRAVERSE ?AUTO_7444 ?AUTO_7450 ?AUTO_7449 ) ( AT ?AUTO_7444 ?AUTO_7450 ) ( VISIBLE ?AUTO_7450 ?AUTO_7449 ) ( not ( = ?AUTO_7443 ?AUTO_7450 ) ) ( not ( = ?AUTO_7447 ?AUTO_7450 ) ) ( not ( = ?AUTO_7445 ?AUTO_7450 ) ) ( not ( = ?AUTO_7449 ?AUTO_7450 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7444 ?AUTO_7450 ?AUTO_7449 )
      ( GET_SOIL_DATA ?AUTO_7443 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7443 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7504 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7505 - LANDER
      ?AUTO_7507 - WAYPOINT
      ?AUTO_7506 - WAYPOINT
      ?AUTO_7508 - ROVER
      ?AUTO_7509 - STORE
      ?AUTO_7510 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7505 ?AUTO_7507 ) ( VISIBLE ?AUTO_7506 ?AUTO_7507 ) ( AVAILABLE ?AUTO_7508 ) ( CHANNEL_FREE ?AUTO_7505 ) ( not ( = ?AUTO_7504 ?AUTO_7506 ) ) ( not ( = ?AUTO_7504 ?AUTO_7507 ) ) ( not ( = ?AUTO_7506 ?AUTO_7507 ) ) ( CAN_TRAVERSE ?AUTO_7508 ?AUTO_7504 ?AUTO_7506 ) ( VISIBLE ?AUTO_7504 ?AUTO_7506 ) ( AT_ROCK_SAMPLE ?AUTO_7504 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7508 ) ( STORE_OF ?AUTO_7509 ?AUTO_7508 ) ( CAN_TRAVERSE ?AUTO_7508 ?AUTO_7510 ?AUTO_7504 ) ( AT ?AUTO_7508 ?AUTO_7510 ) ( VISIBLE ?AUTO_7510 ?AUTO_7504 ) ( not ( = ?AUTO_7504 ?AUTO_7510 ) ) ( not ( = ?AUTO_7507 ?AUTO_7510 ) ) ( not ( = ?AUTO_7506 ?AUTO_7510 ) ) ( AT_ROCK_SAMPLE ?AUTO_7510 ) ( EMPTY ?AUTO_7509 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7508 ?AUTO_7509 ?AUTO_7510 )
      ( GET_ROCK_DATA ?AUTO_7504 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7504 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7512 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7513 - LANDER
      ?AUTO_7515 - WAYPOINT
      ?AUTO_7516 - WAYPOINT
      ?AUTO_7518 - ROVER
      ?AUTO_7517 - STORE
      ?AUTO_7514 - WAYPOINT
      ?AUTO_7519 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7513 ?AUTO_7515 ) ( VISIBLE ?AUTO_7516 ?AUTO_7515 ) ( AVAILABLE ?AUTO_7518 ) ( CHANNEL_FREE ?AUTO_7513 ) ( not ( = ?AUTO_7512 ?AUTO_7516 ) ) ( not ( = ?AUTO_7512 ?AUTO_7515 ) ) ( not ( = ?AUTO_7516 ?AUTO_7515 ) ) ( CAN_TRAVERSE ?AUTO_7518 ?AUTO_7512 ?AUTO_7516 ) ( VISIBLE ?AUTO_7512 ?AUTO_7516 ) ( AT_ROCK_SAMPLE ?AUTO_7512 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7518 ) ( STORE_OF ?AUTO_7517 ?AUTO_7518 ) ( FULL ?AUTO_7517 ) ( CAN_TRAVERSE ?AUTO_7518 ?AUTO_7514 ?AUTO_7512 ) ( VISIBLE ?AUTO_7514 ?AUTO_7512 ) ( not ( = ?AUTO_7512 ?AUTO_7514 ) ) ( not ( = ?AUTO_7515 ?AUTO_7514 ) ) ( not ( = ?AUTO_7516 ?AUTO_7514 ) ) ( CAN_TRAVERSE ?AUTO_7518 ?AUTO_7519 ?AUTO_7514 ) ( AT ?AUTO_7518 ?AUTO_7519 ) ( VISIBLE ?AUTO_7519 ?AUTO_7514 ) ( not ( = ?AUTO_7512 ?AUTO_7519 ) ) ( not ( = ?AUTO_7515 ?AUTO_7519 ) ) ( not ( = ?AUTO_7516 ?AUTO_7519 ) ) ( not ( = ?AUTO_7514 ?AUTO_7519 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7518 ?AUTO_7519 ?AUTO_7514 )
      ( GET_ROCK_DATA ?AUTO_7512 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7512 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7520 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7522 - LANDER
      ?AUTO_7526 - WAYPOINT
      ?AUTO_7525 - WAYPOINT
      ?AUTO_7521 - ROVER
      ?AUTO_7524 - STORE
      ?AUTO_7523 - WAYPOINT
      ?AUTO_7527 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7522 ?AUTO_7526 ) ( VISIBLE ?AUTO_7525 ?AUTO_7526 ) ( AVAILABLE ?AUTO_7521 ) ( CHANNEL_FREE ?AUTO_7522 ) ( not ( = ?AUTO_7520 ?AUTO_7525 ) ) ( not ( = ?AUTO_7520 ?AUTO_7526 ) ) ( not ( = ?AUTO_7525 ?AUTO_7526 ) ) ( CAN_TRAVERSE ?AUTO_7521 ?AUTO_7520 ?AUTO_7525 ) ( VISIBLE ?AUTO_7520 ?AUTO_7525 ) ( AT_ROCK_SAMPLE ?AUTO_7520 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7521 ) ( STORE_OF ?AUTO_7524 ?AUTO_7521 ) ( CAN_TRAVERSE ?AUTO_7521 ?AUTO_7523 ?AUTO_7520 ) ( VISIBLE ?AUTO_7523 ?AUTO_7520 ) ( not ( = ?AUTO_7520 ?AUTO_7523 ) ) ( not ( = ?AUTO_7526 ?AUTO_7523 ) ) ( not ( = ?AUTO_7525 ?AUTO_7523 ) ) ( CAN_TRAVERSE ?AUTO_7521 ?AUTO_7527 ?AUTO_7523 ) ( AT ?AUTO_7521 ?AUTO_7527 ) ( VISIBLE ?AUTO_7527 ?AUTO_7523 ) ( not ( = ?AUTO_7520 ?AUTO_7527 ) ) ( not ( = ?AUTO_7526 ?AUTO_7527 ) ) ( not ( = ?AUTO_7525 ?AUTO_7527 ) ) ( not ( = ?AUTO_7523 ?AUTO_7527 ) ) ( AT_ROCK_SAMPLE ?AUTO_7527 ) ( EMPTY ?AUTO_7524 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7521 ?AUTO_7524 ?AUTO_7527 )
      ( GET_ROCK_DATA ?AUTO_7520 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7520 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10621 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10627 - LANDER
      ?AUTO_10625 - WAYPOINT
      ?AUTO_10626 - WAYPOINT
      ?AUTO_10622 - ROVER
      ?AUTO_10624 - STORE
      ?AUTO_10623 - WAYPOINT
      ?AUTO_10628 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10627 ?AUTO_10625 ) ( VISIBLE ?AUTO_10626 ?AUTO_10625 ) ( AVAILABLE ?AUTO_10622 ) ( CHANNEL_FREE ?AUTO_10627 ) ( not ( = ?AUTO_10621 ?AUTO_10626 ) ) ( not ( = ?AUTO_10621 ?AUTO_10625 ) ) ( not ( = ?AUTO_10626 ?AUTO_10625 ) ) ( CAN_TRAVERSE ?AUTO_10622 ?AUTO_10621 ?AUTO_10626 ) ( VISIBLE ?AUTO_10621 ?AUTO_10626 ) ( AT_ROCK_SAMPLE ?AUTO_10621 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10622 ) ( STORE_OF ?AUTO_10624 ?AUTO_10622 ) ( EMPTY ?AUTO_10624 ) ( CAN_TRAVERSE ?AUTO_10622 ?AUTO_10623 ?AUTO_10621 ) ( VISIBLE ?AUTO_10623 ?AUTO_10621 ) ( not ( = ?AUTO_10621 ?AUTO_10623 ) ) ( not ( = ?AUTO_10625 ?AUTO_10623 ) ) ( not ( = ?AUTO_10626 ?AUTO_10623 ) ) ( CAN_TRAVERSE ?AUTO_10622 ?AUTO_10628 ?AUTO_10623 ) ( VISIBLE ?AUTO_10628 ?AUTO_10623 ) ( not ( = ?AUTO_10621 ?AUTO_10628 ) ) ( not ( = ?AUTO_10625 ?AUTO_10628 ) ) ( not ( = ?AUTO_10626 ?AUTO_10628 ) ) ( not ( = ?AUTO_10623 ?AUTO_10628 ) ) ( CAN_TRAVERSE ?AUTO_10622 ?AUTO_10626 ?AUTO_10628 ) ( AT ?AUTO_10622 ?AUTO_10626 ) ( VISIBLE ?AUTO_10626 ?AUTO_10628 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10622 ?AUTO_10626 ?AUTO_10628 )
      ( GET_ROCK_DATA ?AUTO_10621 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10621 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7541 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7542 - LANDER
      ?AUTO_7545 - WAYPOINT
      ?AUTO_7547 - WAYPOINT
      ?AUTO_7544 - ROVER
      ?AUTO_7546 - STORE
      ?AUTO_7543 - WAYPOINT
      ?AUTO_7548 - WAYPOINT
      ?AUTO_7549 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7542 ?AUTO_7545 ) ( VISIBLE ?AUTO_7547 ?AUTO_7545 ) ( AVAILABLE ?AUTO_7544 ) ( CHANNEL_FREE ?AUTO_7542 ) ( not ( = ?AUTO_7541 ?AUTO_7547 ) ) ( not ( = ?AUTO_7541 ?AUTO_7545 ) ) ( not ( = ?AUTO_7547 ?AUTO_7545 ) ) ( CAN_TRAVERSE ?AUTO_7544 ?AUTO_7541 ?AUTO_7547 ) ( VISIBLE ?AUTO_7541 ?AUTO_7547 ) ( AT_ROCK_SAMPLE ?AUTO_7541 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7544 ) ( STORE_OF ?AUTO_7546 ?AUTO_7544 ) ( CAN_TRAVERSE ?AUTO_7544 ?AUTO_7543 ?AUTO_7541 ) ( VISIBLE ?AUTO_7543 ?AUTO_7541 ) ( not ( = ?AUTO_7541 ?AUTO_7543 ) ) ( not ( = ?AUTO_7545 ?AUTO_7543 ) ) ( not ( = ?AUTO_7547 ?AUTO_7543 ) ) ( CAN_TRAVERSE ?AUTO_7544 ?AUTO_7548 ?AUTO_7543 ) ( VISIBLE ?AUTO_7548 ?AUTO_7543 ) ( not ( = ?AUTO_7541 ?AUTO_7548 ) ) ( not ( = ?AUTO_7545 ?AUTO_7548 ) ) ( not ( = ?AUTO_7547 ?AUTO_7548 ) ) ( not ( = ?AUTO_7543 ?AUTO_7548 ) ) ( AT_ROCK_SAMPLE ?AUTO_7548 ) ( EMPTY ?AUTO_7546 ) ( CAN_TRAVERSE ?AUTO_7544 ?AUTO_7547 ?AUTO_7548 ) ( VISIBLE ?AUTO_7547 ?AUTO_7548 ) ( CAN_TRAVERSE ?AUTO_7544 ?AUTO_7549 ?AUTO_7547 ) ( AT ?AUTO_7544 ?AUTO_7549 ) ( VISIBLE ?AUTO_7549 ?AUTO_7547 ) ( not ( = ?AUTO_7541 ?AUTO_7549 ) ) ( not ( = ?AUTO_7545 ?AUTO_7549 ) ) ( not ( = ?AUTO_7547 ?AUTO_7549 ) ) ( not ( = ?AUTO_7543 ?AUTO_7549 ) ) ( not ( = ?AUTO_7548 ?AUTO_7549 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7544 ?AUTO_7549 ?AUTO_7547 )
      ( GET_ROCK_DATA ?AUTO_7541 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7541 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10574 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10577 - LANDER
      ?AUTO_10579 - WAYPOINT
      ?AUTO_10575 - WAYPOINT
      ?AUTO_10578 - ROVER
      ?AUTO_10576 - STORE
      ?AUTO_10580 - WAYPOINT
      ?AUTO_10581 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10577 ?AUTO_10579 ) ( VISIBLE ?AUTO_10575 ?AUTO_10579 ) ( AVAILABLE ?AUTO_10578 ) ( CHANNEL_FREE ?AUTO_10577 ) ( not ( = ?AUTO_10574 ?AUTO_10575 ) ) ( not ( = ?AUTO_10574 ?AUTO_10579 ) ) ( not ( = ?AUTO_10575 ?AUTO_10579 ) ) ( CAN_TRAVERSE ?AUTO_10578 ?AUTO_10574 ?AUTO_10575 ) ( VISIBLE ?AUTO_10574 ?AUTO_10575 ) ( AT_ROCK_SAMPLE ?AUTO_10574 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10578 ) ( STORE_OF ?AUTO_10576 ?AUTO_10578 ) ( EMPTY ?AUTO_10576 ) ( CAN_TRAVERSE ?AUTO_10578 ?AUTO_10580 ?AUTO_10574 ) ( VISIBLE ?AUTO_10580 ?AUTO_10574 ) ( not ( = ?AUTO_10574 ?AUTO_10580 ) ) ( not ( = ?AUTO_10579 ?AUTO_10580 ) ) ( not ( = ?AUTO_10575 ?AUTO_10580 ) ) ( CAN_TRAVERSE ?AUTO_10578 ?AUTO_10575 ?AUTO_10580 ) ( VISIBLE ?AUTO_10575 ?AUTO_10580 ) ( CAN_TRAVERSE ?AUTO_10578 ?AUTO_10581 ?AUTO_10575 ) ( AT ?AUTO_10578 ?AUTO_10581 ) ( VISIBLE ?AUTO_10581 ?AUTO_10575 ) ( not ( = ?AUTO_10574 ?AUTO_10581 ) ) ( not ( = ?AUTO_10579 ?AUTO_10581 ) ) ( not ( = ?AUTO_10575 ?AUTO_10581 ) ) ( not ( = ?AUTO_10580 ?AUTO_10581 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10578 ?AUTO_10581 ?AUTO_10575 )
      ( GET_ROCK_DATA ?AUTO_10574 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10574 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7779 - OBJECTIVE
      ?AUTO_7780 - MODE
    )
    :vars
    (
      ?AUTO_7781 - LANDER
      ?AUTO_7783 - WAYPOINT
      ?AUTO_7786 - WAYPOINT
      ?AUTO_7785 - ROVER
      ?AUTO_7784 - CAMERA
      ?AUTO_7782 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7781 ?AUTO_7783 ) ( VISIBLE ?AUTO_7786 ?AUTO_7783 ) ( AVAILABLE ?AUTO_7785 ) ( CHANNEL_FREE ?AUTO_7781 ) ( not ( = ?AUTO_7786 ?AUTO_7783 ) ) ( CAN_TRAVERSE ?AUTO_7785 ?AUTO_7783 ?AUTO_7786 ) ( VISIBLE ?AUTO_7783 ?AUTO_7786 ) ( ON_BOARD ?AUTO_7784 ?AUTO_7785 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7785 ) ( SUPPORTS ?AUTO_7784 ?AUTO_7780 ) ( VISIBLE_FROM ?AUTO_7779 ?AUTO_7783 ) ( CALIBRATION_TARGET ?AUTO_7784 ?AUTO_7779 ) ( CAN_TRAVERSE ?AUTO_7785 ?AUTO_7782 ?AUTO_7783 ) ( VISIBLE ?AUTO_7782 ?AUTO_7783 ) ( not ( = ?AUTO_7783 ?AUTO_7782 ) ) ( not ( = ?AUTO_7786 ?AUTO_7782 ) ) ( CAN_TRAVERSE ?AUTO_7785 ?AUTO_7786 ?AUTO_7782 ) ( AT ?AUTO_7785 ?AUTO_7786 ) ( VISIBLE ?AUTO_7786 ?AUTO_7782 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7785 ?AUTO_7786 ?AUTO_7782 )
      ( GET_IMAGE_DATA ?AUTO_7779 ?AUTO_7780 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7779 ?AUTO_7780 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7841 - OBJECTIVE
      ?AUTO_7842 - MODE
    )
    :vars
    (
      ?AUTO_7845 - LANDER
      ?AUTO_7849 - WAYPOINT
      ?AUTO_7844 - WAYPOINT
      ?AUTO_7848 - ROVER
      ?AUTO_7846 - CAMERA
      ?AUTO_7843 - OBJECTIVE
      ?AUTO_7847 - WAYPOINT
      ?AUTO_7850 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7845 ?AUTO_7849 ) ( VISIBLE ?AUTO_7844 ?AUTO_7849 ) ( AVAILABLE ?AUTO_7848 ) ( CHANNEL_FREE ?AUTO_7845 ) ( not ( = ?AUTO_7844 ?AUTO_7849 ) ) ( CAN_TRAVERSE ?AUTO_7848 ?AUTO_7849 ?AUTO_7844 ) ( VISIBLE ?AUTO_7849 ?AUTO_7844 ) ( ON_BOARD ?AUTO_7846 ?AUTO_7848 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7848 ) ( SUPPORTS ?AUTO_7846 ?AUTO_7842 ) ( VISIBLE_FROM ?AUTO_7841 ?AUTO_7849 ) ( CALIBRATION_TARGET ?AUTO_7846 ?AUTO_7843 ) ( VISIBLE_FROM ?AUTO_7843 ?AUTO_7849 ) ( not ( = ?AUTO_7841 ?AUTO_7843 ) ) ( CAN_TRAVERSE ?AUTO_7848 ?AUTO_7847 ?AUTO_7849 ) ( VISIBLE ?AUTO_7847 ?AUTO_7849 ) ( not ( = ?AUTO_7849 ?AUTO_7847 ) ) ( not ( = ?AUTO_7844 ?AUTO_7847 ) ) ( CAN_TRAVERSE ?AUTO_7848 ?AUTO_7850 ?AUTO_7847 ) ( AT ?AUTO_7848 ?AUTO_7850 ) ( VISIBLE ?AUTO_7850 ?AUTO_7847 ) ( not ( = ?AUTO_7849 ?AUTO_7850 ) ) ( not ( = ?AUTO_7844 ?AUTO_7850 ) ) ( not ( = ?AUTO_7847 ?AUTO_7850 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7848 ?AUTO_7850 ?AUTO_7847 )
      ( GET_IMAGE_DATA ?AUTO_7841 ?AUTO_7842 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7841 ?AUTO_7842 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7879 - OBJECTIVE
      ?AUTO_7880 - MODE
    )
    :vars
    (
      ?AUTO_7885 - LANDER
      ?AUTO_7882 - WAYPOINT
      ?AUTO_7883 - WAYPOINT
      ?AUTO_7887 - ROVER
      ?AUTO_7881 - CAMERA
      ?AUTO_7884 - OBJECTIVE
      ?AUTO_7886 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7885 ?AUTO_7882 ) ( VISIBLE ?AUTO_7883 ?AUTO_7882 ) ( AVAILABLE ?AUTO_7887 ) ( CHANNEL_FREE ?AUTO_7885 ) ( not ( = ?AUTO_7883 ?AUTO_7882 ) ) ( CAN_TRAVERSE ?AUTO_7887 ?AUTO_7882 ?AUTO_7883 ) ( VISIBLE ?AUTO_7882 ?AUTO_7883 ) ( ON_BOARD ?AUTO_7881 ?AUTO_7887 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7887 ) ( SUPPORTS ?AUTO_7881 ?AUTO_7880 ) ( VISIBLE_FROM ?AUTO_7879 ?AUTO_7882 ) ( CALIBRATION_TARGET ?AUTO_7881 ?AUTO_7884 ) ( VISIBLE_FROM ?AUTO_7884 ?AUTO_7882 ) ( not ( = ?AUTO_7879 ?AUTO_7884 ) ) ( CAN_TRAVERSE ?AUTO_7887 ?AUTO_7886 ?AUTO_7882 ) ( VISIBLE ?AUTO_7886 ?AUTO_7882 ) ( not ( = ?AUTO_7882 ?AUTO_7886 ) ) ( not ( = ?AUTO_7883 ?AUTO_7886 ) ) ( CAN_TRAVERSE ?AUTO_7887 ?AUTO_7883 ?AUTO_7886 ) ( AT ?AUTO_7887 ?AUTO_7883 ) ( VISIBLE ?AUTO_7883 ?AUTO_7886 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7887 ?AUTO_7883 ?AUTO_7886 )
      ( GET_IMAGE_DATA ?AUTO_7879 ?AUTO_7880 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7879 ?AUTO_7880 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8122 - OBJECTIVE
      ?AUTO_8123 - MODE
    )
    :vars
    (
      ?AUTO_8128 - LANDER
      ?AUTO_8126 - WAYPOINT
      ?AUTO_8125 - WAYPOINT
      ?AUTO_8124 - ROVER
      ?AUTO_8129 - CAMERA
      ?AUTO_8130 - WAYPOINT
      ?AUTO_8127 - WAYPOINT
      ?AUTO_8131 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8128 ?AUTO_8126 ) ( VISIBLE ?AUTO_8125 ?AUTO_8126 ) ( AVAILABLE ?AUTO_8124 ) ( CHANNEL_FREE ?AUTO_8128 ) ( not ( = ?AUTO_8125 ?AUTO_8126 ) ) ( ON_BOARD ?AUTO_8129 ?AUTO_8124 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8124 ) ( SUPPORTS ?AUTO_8129 ?AUTO_8123 ) ( VISIBLE_FROM ?AUTO_8122 ?AUTO_8125 ) ( CAN_TRAVERSE ?AUTO_8124 ?AUTO_8130 ?AUTO_8125 ) ( VISIBLE ?AUTO_8130 ?AUTO_8125 ) ( not ( = ?AUTO_8126 ?AUTO_8130 ) ) ( not ( = ?AUTO_8125 ?AUTO_8130 ) ) ( CAN_TRAVERSE ?AUTO_8124 ?AUTO_8127 ?AUTO_8130 ) ( VISIBLE ?AUTO_8127 ?AUTO_8130 ) ( not ( = ?AUTO_8126 ?AUTO_8127 ) ) ( not ( = ?AUTO_8125 ?AUTO_8127 ) ) ( not ( = ?AUTO_8130 ?AUTO_8127 ) ) ( CALIBRATION_TARGET ?AUTO_8129 ?AUTO_8131 ) ( VISIBLE_FROM ?AUTO_8131 ?AUTO_8127 ) ( not ( = ?AUTO_8122 ?AUTO_8131 ) ) ( CAN_TRAVERSE ?AUTO_8124 ?AUTO_8126 ?AUTO_8127 ) ( AT ?AUTO_8124 ?AUTO_8126 ) ( VISIBLE ?AUTO_8126 ?AUTO_8127 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8124 ?AUTO_8126 ?AUTO_8127 )
      ( GET_IMAGE_DATA ?AUTO_8122 ?AUTO_8123 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8122 ?AUTO_8123 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8241 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8245 - LANDER
      ?AUTO_8246 - WAYPOINT
      ?AUTO_8248 - WAYPOINT
      ?AUTO_8247 - ROVER
      ?AUTO_8242 - WAYPOINT
      ?AUTO_8244 - STORE
      ?AUTO_8243 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8245 ?AUTO_8246 ) ( VISIBLE ?AUTO_8248 ?AUTO_8246 ) ( AVAILABLE ?AUTO_8247 ) ( CHANNEL_FREE ?AUTO_8245 ) ( not ( = ?AUTO_8241 ?AUTO_8248 ) ) ( not ( = ?AUTO_8241 ?AUTO_8246 ) ) ( not ( = ?AUTO_8248 ?AUTO_8246 ) ) ( CAN_TRAVERSE ?AUTO_8247 ?AUTO_8242 ?AUTO_8248 ) ( VISIBLE ?AUTO_8242 ?AUTO_8248 ) ( not ( = ?AUTO_8241 ?AUTO_8242 ) ) ( not ( = ?AUTO_8246 ?AUTO_8242 ) ) ( not ( = ?AUTO_8248 ?AUTO_8242 ) ) ( CAN_TRAVERSE ?AUTO_8247 ?AUTO_8241 ?AUTO_8242 ) ( VISIBLE ?AUTO_8241 ?AUTO_8242 ) ( AT_ROCK_SAMPLE ?AUTO_8241 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8247 ) ( STORE_OF ?AUTO_8244 ?AUTO_8247 ) ( CAN_TRAVERSE ?AUTO_8247 ?AUTO_8243 ?AUTO_8241 ) ( AT ?AUTO_8247 ?AUTO_8243 ) ( VISIBLE ?AUTO_8243 ?AUTO_8241 ) ( not ( = ?AUTO_8241 ?AUTO_8243 ) ) ( not ( = ?AUTO_8246 ?AUTO_8243 ) ) ( not ( = ?AUTO_8248 ?AUTO_8243 ) ) ( not ( = ?AUTO_8242 ?AUTO_8243 ) ) ( FULL ?AUTO_8244 ) )
    :subtasks
    ( ( !DROP ?AUTO_8247 ?AUTO_8244 )
      ( GET_ROCK_DATA ?AUTO_8241 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8241 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8258 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8260 - LANDER
      ?AUTO_8265 - WAYPOINT
      ?AUTO_8263 - WAYPOINT
      ?AUTO_8262 - ROVER
      ?AUTO_8261 - WAYPOINT
      ?AUTO_8264 - STORE
      ?AUTO_8259 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8260 ?AUTO_8265 ) ( VISIBLE ?AUTO_8263 ?AUTO_8265 ) ( AVAILABLE ?AUTO_8262 ) ( CHANNEL_FREE ?AUTO_8260 ) ( not ( = ?AUTO_8258 ?AUTO_8263 ) ) ( not ( = ?AUTO_8258 ?AUTO_8265 ) ) ( not ( = ?AUTO_8263 ?AUTO_8265 ) ) ( CAN_TRAVERSE ?AUTO_8262 ?AUTO_8261 ?AUTO_8263 ) ( VISIBLE ?AUTO_8261 ?AUTO_8263 ) ( not ( = ?AUTO_8258 ?AUTO_8261 ) ) ( not ( = ?AUTO_8265 ?AUTO_8261 ) ) ( not ( = ?AUTO_8263 ?AUTO_8261 ) ) ( CAN_TRAVERSE ?AUTO_8262 ?AUTO_8258 ?AUTO_8261 ) ( VISIBLE ?AUTO_8258 ?AUTO_8261 ) ( AT_ROCK_SAMPLE ?AUTO_8258 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8262 ) ( STORE_OF ?AUTO_8264 ?AUTO_8262 ) ( EMPTY ?AUTO_8264 ) ( CAN_TRAVERSE ?AUTO_8262 ?AUTO_8259 ?AUTO_8258 ) ( VISIBLE ?AUTO_8259 ?AUTO_8258 ) ( not ( = ?AUTO_8258 ?AUTO_8259 ) ) ( not ( = ?AUTO_8265 ?AUTO_8259 ) ) ( not ( = ?AUTO_8263 ?AUTO_8259 ) ) ( not ( = ?AUTO_8261 ?AUTO_8259 ) ) ( CAN_TRAVERSE ?AUTO_8262 ?AUTO_8263 ?AUTO_8259 ) ( AT ?AUTO_8262 ?AUTO_8263 ) ( VISIBLE ?AUTO_8263 ?AUTO_8259 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8262 ?AUTO_8263 ?AUTO_8259 )
      ( GET_ROCK_DATA ?AUTO_8258 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8258 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8312 - OBJECTIVE
      ?AUTO_8311 - MODE
    )
    :vars
    (
      ?AUTO_8316 - LANDER
      ?AUTO_8319 - WAYPOINT
      ?AUTO_8315 - WAYPOINT
      ?AUTO_8320 - ROVER
      ?AUTO_8317 - CAMERA
      ?AUTO_8318 - WAYPOINT
      ?AUTO_8313 - WAYPOINT
      ?AUTO_8314 - WAYPOINT
      ?AUTO_8321 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8316 ?AUTO_8319 ) ( VISIBLE ?AUTO_8315 ?AUTO_8319 ) ( AVAILABLE ?AUTO_8320 ) ( CHANNEL_FREE ?AUTO_8316 ) ( not ( = ?AUTO_8315 ?AUTO_8319 ) ) ( CALIBRATED ?AUTO_8317 ?AUTO_8320 ) ( ON_BOARD ?AUTO_8317 ?AUTO_8320 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8320 ) ( SUPPORTS ?AUTO_8317 ?AUTO_8311 ) ( VISIBLE_FROM ?AUTO_8312 ?AUTO_8315 ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8318 ?AUTO_8315 ) ( VISIBLE ?AUTO_8318 ?AUTO_8315 ) ( not ( = ?AUTO_8319 ?AUTO_8318 ) ) ( not ( = ?AUTO_8315 ?AUTO_8318 ) ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8313 ?AUTO_8318 ) ( VISIBLE ?AUTO_8313 ?AUTO_8318 ) ( not ( = ?AUTO_8319 ?AUTO_8313 ) ) ( not ( = ?AUTO_8315 ?AUTO_8313 ) ) ( not ( = ?AUTO_8318 ?AUTO_8313 ) ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8314 ?AUTO_8313 ) ( VISIBLE ?AUTO_8314 ?AUTO_8313 ) ( not ( = ?AUTO_8319 ?AUTO_8314 ) ) ( not ( = ?AUTO_8315 ?AUTO_8314 ) ) ( not ( = ?AUTO_8318 ?AUTO_8314 ) ) ( not ( = ?AUTO_8313 ?AUTO_8314 ) ) ( CAN_TRAVERSE ?AUTO_8320 ?AUTO_8321 ?AUTO_8314 ) ( AT ?AUTO_8320 ?AUTO_8321 ) ( VISIBLE ?AUTO_8321 ?AUTO_8314 ) ( not ( = ?AUTO_8319 ?AUTO_8321 ) ) ( not ( = ?AUTO_8315 ?AUTO_8321 ) ) ( not ( = ?AUTO_8318 ?AUTO_8321 ) ) ( not ( = ?AUTO_8313 ?AUTO_8321 ) ) ( not ( = ?AUTO_8314 ?AUTO_8321 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8320 ?AUTO_8321 ?AUTO_8314 )
      ( GET_IMAGE_DATA ?AUTO_8312 ?AUTO_8311 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8312 ?AUTO_8311 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8323 - OBJECTIVE
      ?AUTO_8322 - MODE
    )
    :vars
    (
      ?AUTO_8326 - LANDER
      ?AUTO_8330 - WAYPOINT
      ?AUTO_8324 - WAYPOINT
      ?AUTO_8327 - ROVER
      ?AUTO_8325 - CAMERA
      ?AUTO_8331 - WAYPOINT
      ?AUTO_8332 - WAYPOINT
      ?AUTO_8329 - WAYPOINT
      ?AUTO_8328 - WAYPOINT
      ?AUTO_8333 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8326 ?AUTO_8330 ) ( VISIBLE ?AUTO_8324 ?AUTO_8330 ) ( AVAILABLE ?AUTO_8327 ) ( CHANNEL_FREE ?AUTO_8326 ) ( not ( = ?AUTO_8324 ?AUTO_8330 ) ) ( ON_BOARD ?AUTO_8325 ?AUTO_8327 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8327 ) ( SUPPORTS ?AUTO_8325 ?AUTO_8322 ) ( VISIBLE_FROM ?AUTO_8323 ?AUTO_8324 ) ( CAN_TRAVERSE ?AUTO_8327 ?AUTO_8331 ?AUTO_8324 ) ( VISIBLE ?AUTO_8331 ?AUTO_8324 ) ( not ( = ?AUTO_8330 ?AUTO_8331 ) ) ( not ( = ?AUTO_8324 ?AUTO_8331 ) ) ( CAN_TRAVERSE ?AUTO_8327 ?AUTO_8332 ?AUTO_8331 ) ( VISIBLE ?AUTO_8332 ?AUTO_8331 ) ( not ( = ?AUTO_8330 ?AUTO_8332 ) ) ( not ( = ?AUTO_8324 ?AUTO_8332 ) ) ( not ( = ?AUTO_8331 ?AUTO_8332 ) ) ( CAN_TRAVERSE ?AUTO_8327 ?AUTO_8329 ?AUTO_8332 ) ( VISIBLE ?AUTO_8329 ?AUTO_8332 ) ( not ( = ?AUTO_8330 ?AUTO_8329 ) ) ( not ( = ?AUTO_8324 ?AUTO_8329 ) ) ( not ( = ?AUTO_8331 ?AUTO_8329 ) ) ( not ( = ?AUTO_8332 ?AUTO_8329 ) ) ( CAN_TRAVERSE ?AUTO_8327 ?AUTO_8328 ?AUTO_8329 ) ( AT ?AUTO_8327 ?AUTO_8328 ) ( VISIBLE ?AUTO_8328 ?AUTO_8329 ) ( not ( = ?AUTO_8330 ?AUTO_8328 ) ) ( not ( = ?AUTO_8324 ?AUTO_8328 ) ) ( not ( = ?AUTO_8331 ?AUTO_8328 ) ) ( not ( = ?AUTO_8332 ?AUTO_8328 ) ) ( not ( = ?AUTO_8329 ?AUTO_8328 ) ) ( CALIBRATION_TARGET ?AUTO_8325 ?AUTO_8333 ) ( VISIBLE_FROM ?AUTO_8333 ?AUTO_8328 ) ( not ( = ?AUTO_8323 ?AUTO_8333 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8327 ?AUTO_8325 ?AUTO_8333 ?AUTO_8328 )
      ( GET_IMAGE_DATA ?AUTO_8323 ?AUTO_8322 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8323 ?AUTO_8322 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8335 - OBJECTIVE
      ?AUTO_8334 - MODE
    )
    :vars
    (
      ?AUTO_8336 - LANDER
      ?AUTO_8337 - WAYPOINT
      ?AUTO_8343 - WAYPOINT
      ?AUTO_8342 - ROVER
      ?AUTO_8340 - CAMERA
      ?AUTO_8338 - WAYPOINT
      ?AUTO_8339 - WAYPOINT
      ?AUTO_8344 - WAYPOINT
      ?AUTO_8345 - WAYPOINT
      ?AUTO_8341 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8336 ?AUTO_8337 ) ( VISIBLE ?AUTO_8343 ?AUTO_8337 ) ( AVAILABLE ?AUTO_8342 ) ( CHANNEL_FREE ?AUTO_8336 ) ( not ( = ?AUTO_8343 ?AUTO_8337 ) ) ( ON_BOARD ?AUTO_8340 ?AUTO_8342 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8342 ) ( SUPPORTS ?AUTO_8340 ?AUTO_8334 ) ( VISIBLE_FROM ?AUTO_8335 ?AUTO_8343 ) ( CAN_TRAVERSE ?AUTO_8342 ?AUTO_8338 ?AUTO_8343 ) ( VISIBLE ?AUTO_8338 ?AUTO_8343 ) ( not ( = ?AUTO_8337 ?AUTO_8338 ) ) ( not ( = ?AUTO_8343 ?AUTO_8338 ) ) ( CAN_TRAVERSE ?AUTO_8342 ?AUTO_8339 ?AUTO_8338 ) ( VISIBLE ?AUTO_8339 ?AUTO_8338 ) ( not ( = ?AUTO_8337 ?AUTO_8339 ) ) ( not ( = ?AUTO_8343 ?AUTO_8339 ) ) ( not ( = ?AUTO_8338 ?AUTO_8339 ) ) ( CAN_TRAVERSE ?AUTO_8342 ?AUTO_8344 ?AUTO_8339 ) ( VISIBLE ?AUTO_8344 ?AUTO_8339 ) ( not ( = ?AUTO_8337 ?AUTO_8344 ) ) ( not ( = ?AUTO_8343 ?AUTO_8344 ) ) ( not ( = ?AUTO_8338 ?AUTO_8344 ) ) ( not ( = ?AUTO_8339 ?AUTO_8344 ) ) ( CAN_TRAVERSE ?AUTO_8342 ?AUTO_8345 ?AUTO_8344 ) ( VISIBLE ?AUTO_8345 ?AUTO_8344 ) ( not ( = ?AUTO_8337 ?AUTO_8345 ) ) ( not ( = ?AUTO_8343 ?AUTO_8345 ) ) ( not ( = ?AUTO_8338 ?AUTO_8345 ) ) ( not ( = ?AUTO_8339 ?AUTO_8345 ) ) ( not ( = ?AUTO_8344 ?AUTO_8345 ) ) ( CALIBRATION_TARGET ?AUTO_8340 ?AUTO_8341 ) ( VISIBLE_FROM ?AUTO_8341 ?AUTO_8345 ) ( not ( = ?AUTO_8335 ?AUTO_8341 ) ) ( CAN_TRAVERSE ?AUTO_8342 ?AUTO_8338 ?AUTO_8345 ) ( AT ?AUTO_8342 ?AUTO_8338 ) ( VISIBLE ?AUTO_8338 ?AUTO_8345 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8342 ?AUTO_8338 ?AUTO_8345 )
      ( GET_IMAGE_DATA ?AUTO_8335 ?AUTO_8334 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8335 ?AUTO_8334 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8349 - OBJECTIVE
      ?AUTO_8348 - MODE
    )
    :vars
    (
      ?AUTO_8352 - LANDER
      ?AUTO_8357 - WAYPOINT
      ?AUTO_8351 - WAYPOINT
      ?AUTO_8354 - ROVER
      ?AUTO_8350 - CAMERA
      ?AUTO_8359 - WAYPOINT
      ?AUTO_8355 - WAYPOINT
      ?AUTO_8353 - WAYPOINT
      ?AUTO_8358 - WAYPOINT
      ?AUTO_8356 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8352 ?AUTO_8357 ) ( VISIBLE ?AUTO_8351 ?AUTO_8357 ) ( AVAILABLE ?AUTO_8354 ) ( CHANNEL_FREE ?AUTO_8352 ) ( not ( = ?AUTO_8351 ?AUTO_8357 ) ) ( ON_BOARD ?AUTO_8350 ?AUTO_8354 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8354 ) ( SUPPORTS ?AUTO_8350 ?AUTO_8348 ) ( VISIBLE_FROM ?AUTO_8349 ?AUTO_8351 ) ( CAN_TRAVERSE ?AUTO_8354 ?AUTO_8359 ?AUTO_8351 ) ( VISIBLE ?AUTO_8359 ?AUTO_8351 ) ( not ( = ?AUTO_8357 ?AUTO_8359 ) ) ( not ( = ?AUTO_8351 ?AUTO_8359 ) ) ( CAN_TRAVERSE ?AUTO_8354 ?AUTO_8355 ?AUTO_8359 ) ( VISIBLE ?AUTO_8355 ?AUTO_8359 ) ( not ( = ?AUTO_8357 ?AUTO_8355 ) ) ( not ( = ?AUTO_8351 ?AUTO_8355 ) ) ( not ( = ?AUTO_8359 ?AUTO_8355 ) ) ( CAN_TRAVERSE ?AUTO_8354 ?AUTO_8353 ?AUTO_8355 ) ( VISIBLE ?AUTO_8353 ?AUTO_8355 ) ( not ( = ?AUTO_8357 ?AUTO_8353 ) ) ( not ( = ?AUTO_8351 ?AUTO_8353 ) ) ( not ( = ?AUTO_8359 ?AUTO_8353 ) ) ( not ( = ?AUTO_8355 ?AUTO_8353 ) ) ( CAN_TRAVERSE ?AUTO_8354 ?AUTO_8358 ?AUTO_8353 ) ( VISIBLE ?AUTO_8358 ?AUTO_8353 ) ( not ( = ?AUTO_8357 ?AUTO_8358 ) ) ( not ( = ?AUTO_8351 ?AUTO_8358 ) ) ( not ( = ?AUTO_8359 ?AUTO_8358 ) ) ( not ( = ?AUTO_8355 ?AUTO_8358 ) ) ( not ( = ?AUTO_8353 ?AUTO_8358 ) ) ( CALIBRATION_TARGET ?AUTO_8350 ?AUTO_8356 ) ( VISIBLE_FROM ?AUTO_8356 ?AUTO_8358 ) ( not ( = ?AUTO_8349 ?AUTO_8356 ) ) ( CAN_TRAVERSE ?AUTO_8354 ?AUTO_8359 ?AUTO_8358 ) ( VISIBLE ?AUTO_8359 ?AUTO_8358 ) ( AT ?AUTO_8354 ?AUTO_8355 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8354 ?AUTO_8355 ?AUTO_8359 )
      ( GET_IMAGE_DATA ?AUTO_8349 ?AUTO_8348 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8349 ?AUTO_8348 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8381 - OBJECTIVE
      ?AUTO_8380 - MODE
    )
    :vars
    (
      ?AUTO_8386 - LANDER
      ?AUTO_8385 - WAYPOINT
      ?AUTO_8390 - WAYPOINT
      ?AUTO_8389 - ROVER
      ?AUTO_8384 - CAMERA
      ?AUTO_8387 - WAYPOINT
      ?AUTO_8382 - WAYPOINT
      ?AUTO_8388 - WAYPOINT
      ?AUTO_8391 - WAYPOINT
      ?AUTO_8383 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8386 ?AUTO_8385 ) ( VISIBLE ?AUTO_8390 ?AUTO_8385 ) ( AVAILABLE ?AUTO_8389 ) ( CHANNEL_FREE ?AUTO_8386 ) ( not ( = ?AUTO_8390 ?AUTO_8385 ) ) ( ON_BOARD ?AUTO_8384 ?AUTO_8389 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8389 ) ( SUPPORTS ?AUTO_8384 ?AUTO_8380 ) ( VISIBLE_FROM ?AUTO_8381 ?AUTO_8390 ) ( CAN_TRAVERSE ?AUTO_8389 ?AUTO_8387 ?AUTO_8390 ) ( VISIBLE ?AUTO_8387 ?AUTO_8390 ) ( not ( = ?AUTO_8385 ?AUTO_8387 ) ) ( not ( = ?AUTO_8390 ?AUTO_8387 ) ) ( CAN_TRAVERSE ?AUTO_8389 ?AUTO_8382 ?AUTO_8387 ) ( VISIBLE ?AUTO_8382 ?AUTO_8387 ) ( not ( = ?AUTO_8385 ?AUTO_8382 ) ) ( not ( = ?AUTO_8390 ?AUTO_8382 ) ) ( not ( = ?AUTO_8387 ?AUTO_8382 ) ) ( CAN_TRAVERSE ?AUTO_8389 ?AUTO_8388 ?AUTO_8382 ) ( VISIBLE ?AUTO_8388 ?AUTO_8382 ) ( not ( = ?AUTO_8385 ?AUTO_8388 ) ) ( not ( = ?AUTO_8390 ?AUTO_8388 ) ) ( not ( = ?AUTO_8387 ?AUTO_8388 ) ) ( not ( = ?AUTO_8382 ?AUTO_8388 ) ) ( CAN_TRAVERSE ?AUTO_8389 ?AUTO_8391 ?AUTO_8388 ) ( VISIBLE ?AUTO_8391 ?AUTO_8388 ) ( not ( = ?AUTO_8385 ?AUTO_8391 ) ) ( not ( = ?AUTO_8390 ?AUTO_8391 ) ) ( not ( = ?AUTO_8387 ?AUTO_8391 ) ) ( not ( = ?AUTO_8382 ?AUTO_8391 ) ) ( not ( = ?AUTO_8388 ?AUTO_8391 ) ) ( CALIBRATION_TARGET ?AUTO_8384 ?AUTO_8383 ) ( VISIBLE_FROM ?AUTO_8383 ?AUTO_8391 ) ( not ( = ?AUTO_8381 ?AUTO_8383 ) ) ( CAN_TRAVERSE ?AUTO_8389 ?AUTO_8387 ?AUTO_8391 ) ( VISIBLE ?AUTO_8387 ?AUTO_8391 ) ( AT ?AUTO_8389 ?AUTO_8388 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8389 ?AUTO_8388 ?AUTO_8382 )
      ( GET_IMAGE_DATA ?AUTO_8381 ?AUTO_8380 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8381 ?AUTO_8380 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8393 - OBJECTIVE
      ?AUTO_8392 - MODE
    )
    :vars
    (
      ?AUTO_8401 - LANDER
      ?AUTO_8398 - WAYPOINT
      ?AUTO_8396 - WAYPOINT
      ?AUTO_8394 - ROVER
      ?AUTO_8403 - CAMERA
      ?AUTO_8402 - WAYPOINT
      ?AUTO_8399 - WAYPOINT
      ?AUTO_8395 - WAYPOINT
      ?AUTO_8397 - WAYPOINT
      ?AUTO_8400 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8401 ?AUTO_8398 ) ( VISIBLE ?AUTO_8396 ?AUTO_8398 ) ( AVAILABLE ?AUTO_8394 ) ( CHANNEL_FREE ?AUTO_8401 ) ( not ( = ?AUTO_8396 ?AUTO_8398 ) ) ( ON_BOARD ?AUTO_8403 ?AUTO_8394 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8394 ) ( SUPPORTS ?AUTO_8403 ?AUTO_8392 ) ( VISIBLE_FROM ?AUTO_8393 ?AUTO_8396 ) ( CAN_TRAVERSE ?AUTO_8394 ?AUTO_8402 ?AUTO_8396 ) ( VISIBLE ?AUTO_8402 ?AUTO_8396 ) ( not ( = ?AUTO_8398 ?AUTO_8402 ) ) ( not ( = ?AUTO_8396 ?AUTO_8402 ) ) ( CAN_TRAVERSE ?AUTO_8394 ?AUTO_8399 ?AUTO_8402 ) ( VISIBLE ?AUTO_8399 ?AUTO_8402 ) ( not ( = ?AUTO_8398 ?AUTO_8399 ) ) ( not ( = ?AUTO_8396 ?AUTO_8399 ) ) ( not ( = ?AUTO_8402 ?AUTO_8399 ) ) ( CAN_TRAVERSE ?AUTO_8394 ?AUTO_8395 ?AUTO_8399 ) ( VISIBLE ?AUTO_8395 ?AUTO_8399 ) ( not ( = ?AUTO_8398 ?AUTO_8395 ) ) ( not ( = ?AUTO_8396 ?AUTO_8395 ) ) ( not ( = ?AUTO_8402 ?AUTO_8395 ) ) ( not ( = ?AUTO_8399 ?AUTO_8395 ) ) ( CAN_TRAVERSE ?AUTO_8394 ?AUTO_8397 ?AUTO_8395 ) ( VISIBLE ?AUTO_8397 ?AUTO_8395 ) ( not ( = ?AUTO_8398 ?AUTO_8397 ) ) ( not ( = ?AUTO_8396 ?AUTO_8397 ) ) ( not ( = ?AUTO_8402 ?AUTO_8397 ) ) ( not ( = ?AUTO_8399 ?AUTO_8397 ) ) ( not ( = ?AUTO_8395 ?AUTO_8397 ) ) ( CALIBRATION_TARGET ?AUTO_8403 ?AUTO_8400 ) ( VISIBLE_FROM ?AUTO_8400 ?AUTO_8397 ) ( not ( = ?AUTO_8393 ?AUTO_8400 ) ) ( CAN_TRAVERSE ?AUTO_8394 ?AUTO_8402 ?AUTO_8397 ) ( VISIBLE ?AUTO_8402 ?AUTO_8397 ) ( CAN_TRAVERSE ?AUTO_8394 ?AUTO_8396 ?AUTO_8395 ) ( AT ?AUTO_8394 ?AUTO_8396 ) ( VISIBLE ?AUTO_8396 ?AUTO_8395 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8394 ?AUTO_8396 ?AUTO_8395 )
      ( GET_IMAGE_DATA ?AUTO_8393 ?AUTO_8392 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8393 ?AUTO_8392 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8461 - OBJECTIVE
      ?AUTO_8462 - MODE
    )
    :vars
    (
      ?AUTO_8466 - LANDER
      ?AUTO_8463 - WAYPOINT
      ?AUTO_8465 - WAYPOINT
      ?AUTO_8464 - ROVER
      ?AUTO_8467 - CAMERA
      ?AUTO_8468 - WAYPOINT
      ?AUTO_8469 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8466 ?AUTO_8463 ) ( VISIBLE ?AUTO_8465 ?AUTO_8463 ) ( AVAILABLE ?AUTO_8464 ) ( CHANNEL_FREE ?AUTO_8466 ) ( not ( = ?AUTO_8465 ?AUTO_8463 ) ) ( CAN_TRAVERSE ?AUTO_8464 ?AUTO_8463 ?AUTO_8465 ) ( VISIBLE ?AUTO_8463 ?AUTO_8465 ) ( CALIBRATED ?AUTO_8467 ?AUTO_8464 ) ( ON_BOARD ?AUTO_8467 ?AUTO_8464 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8464 ) ( SUPPORTS ?AUTO_8467 ?AUTO_8462 ) ( VISIBLE_FROM ?AUTO_8461 ?AUTO_8463 ) ( CAN_TRAVERSE ?AUTO_8464 ?AUTO_8468 ?AUTO_8463 ) ( VISIBLE ?AUTO_8468 ?AUTO_8463 ) ( not ( = ?AUTO_8463 ?AUTO_8468 ) ) ( not ( = ?AUTO_8465 ?AUTO_8468 ) ) ( CAN_TRAVERSE ?AUTO_8464 ?AUTO_8469 ?AUTO_8468 ) ( VISIBLE ?AUTO_8469 ?AUTO_8468 ) ( not ( = ?AUTO_8463 ?AUTO_8469 ) ) ( not ( = ?AUTO_8465 ?AUTO_8469 ) ) ( not ( = ?AUTO_8468 ?AUTO_8469 ) ) ( CAN_TRAVERSE ?AUTO_8464 ?AUTO_8465 ?AUTO_8469 ) ( AT ?AUTO_8464 ?AUTO_8465 ) ( VISIBLE ?AUTO_8465 ?AUTO_8469 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8464 ?AUTO_8465 ?AUTO_8469 )
      ( GET_IMAGE_DATA ?AUTO_8461 ?AUTO_8462 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8461 ?AUTO_8462 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8476 - OBJECTIVE
      ?AUTO_8477 - MODE
    )
    :vars
    (
      ?AUTO_8484 - LANDER
      ?AUTO_8480 - WAYPOINT
      ?AUTO_8481 - WAYPOINT
      ?AUTO_8479 - ROVER
      ?AUTO_8483 - CAMERA
      ?AUTO_8482 - WAYPOINT
      ?AUTO_8478 - WAYPOINT
      ?AUTO_8485 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8484 ?AUTO_8480 ) ( VISIBLE ?AUTO_8481 ?AUTO_8480 ) ( AVAILABLE ?AUTO_8479 ) ( CHANNEL_FREE ?AUTO_8484 ) ( not ( = ?AUTO_8481 ?AUTO_8480 ) ) ( CAN_TRAVERSE ?AUTO_8479 ?AUTO_8480 ?AUTO_8481 ) ( VISIBLE ?AUTO_8480 ?AUTO_8481 ) ( ON_BOARD ?AUTO_8483 ?AUTO_8479 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8479 ) ( SUPPORTS ?AUTO_8483 ?AUTO_8477 ) ( VISIBLE_FROM ?AUTO_8476 ?AUTO_8480 ) ( CAN_TRAVERSE ?AUTO_8479 ?AUTO_8482 ?AUTO_8480 ) ( VISIBLE ?AUTO_8482 ?AUTO_8480 ) ( not ( = ?AUTO_8480 ?AUTO_8482 ) ) ( not ( = ?AUTO_8481 ?AUTO_8482 ) ) ( CAN_TRAVERSE ?AUTO_8479 ?AUTO_8478 ?AUTO_8482 ) ( VISIBLE ?AUTO_8478 ?AUTO_8482 ) ( not ( = ?AUTO_8480 ?AUTO_8478 ) ) ( not ( = ?AUTO_8481 ?AUTO_8478 ) ) ( not ( = ?AUTO_8482 ?AUTO_8478 ) ) ( CAN_TRAVERSE ?AUTO_8479 ?AUTO_8481 ?AUTO_8478 ) ( AT ?AUTO_8479 ?AUTO_8481 ) ( VISIBLE ?AUTO_8481 ?AUTO_8478 ) ( CALIBRATION_TARGET ?AUTO_8483 ?AUTO_8485 ) ( VISIBLE_FROM ?AUTO_8485 ?AUTO_8481 ) ( not ( = ?AUTO_8476 ?AUTO_8485 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8479 ?AUTO_8483 ?AUTO_8485 ?AUTO_8481 )
      ( GET_IMAGE_DATA ?AUTO_8476 ?AUTO_8477 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8476 ?AUTO_8477 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8529 - OBJECTIVE
      ?AUTO_8530 - MODE
    )
    :vars
    (
      ?AUTO_8534 - LANDER
      ?AUTO_8533 - WAYPOINT
      ?AUTO_8535 - WAYPOINT
      ?AUTO_8536 - ROVER
      ?AUTO_8532 - CAMERA
      ?AUTO_8531 - WAYPOINT
      ?AUTO_8537 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8534 ?AUTO_8533 ) ( VISIBLE ?AUTO_8535 ?AUTO_8533 ) ( AVAILABLE ?AUTO_8536 ) ( CHANNEL_FREE ?AUTO_8534 ) ( not ( = ?AUTO_8535 ?AUTO_8533 ) ) ( CAN_TRAVERSE ?AUTO_8536 ?AUTO_8533 ?AUTO_8535 ) ( VISIBLE ?AUTO_8533 ?AUTO_8535 ) ( ON_BOARD ?AUTO_8532 ?AUTO_8536 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8536 ) ( SUPPORTS ?AUTO_8532 ?AUTO_8530 ) ( VISIBLE_FROM ?AUTO_8529 ?AUTO_8533 ) ( CALIBRATION_TARGET ?AUTO_8532 ?AUTO_8529 ) ( CAN_TRAVERSE ?AUTO_8536 ?AUTO_8535 ?AUTO_8533 ) ( CAN_TRAVERSE ?AUTO_8536 ?AUTO_8531 ?AUTO_8535 ) ( VISIBLE ?AUTO_8531 ?AUTO_8535 ) ( not ( = ?AUTO_8533 ?AUTO_8531 ) ) ( not ( = ?AUTO_8535 ?AUTO_8531 ) ) ( CAN_TRAVERSE ?AUTO_8536 ?AUTO_8537 ?AUTO_8531 ) ( AT ?AUTO_8536 ?AUTO_8537 ) ( VISIBLE ?AUTO_8537 ?AUTO_8531 ) ( not ( = ?AUTO_8533 ?AUTO_8537 ) ) ( not ( = ?AUTO_8535 ?AUTO_8537 ) ) ( not ( = ?AUTO_8531 ?AUTO_8537 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8536 ?AUTO_8537 ?AUTO_8531 )
      ( GET_IMAGE_DATA ?AUTO_8529 ?AUTO_8530 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8529 ?AUTO_8530 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8538 - OBJECTIVE
      ?AUTO_8539 - MODE
    )
    :vars
    (
      ?AUTO_8542 - LANDER
      ?AUTO_8543 - WAYPOINT
      ?AUTO_8546 - WAYPOINT
      ?AUTO_8540 - ROVER
      ?AUTO_8545 - CAMERA
      ?AUTO_8541 - WAYPOINT
      ?AUTO_8544 - WAYPOINT
      ?AUTO_8547 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8542 ?AUTO_8543 ) ( VISIBLE ?AUTO_8546 ?AUTO_8543 ) ( AVAILABLE ?AUTO_8540 ) ( CHANNEL_FREE ?AUTO_8542 ) ( not ( = ?AUTO_8546 ?AUTO_8543 ) ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8543 ?AUTO_8546 ) ( VISIBLE ?AUTO_8543 ?AUTO_8546 ) ( ON_BOARD ?AUTO_8545 ?AUTO_8540 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8540 ) ( SUPPORTS ?AUTO_8545 ?AUTO_8539 ) ( VISIBLE_FROM ?AUTO_8538 ?AUTO_8543 ) ( CALIBRATION_TARGET ?AUTO_8545 ?AUTO_8538 ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8546 ?AUTO_8543 ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8541 ?AUTO_8546 ) ( VISIBLE ?AUTO_8541 ?AUTO_8546 ) ( not ( = ?AUTO_8543 ?AUTO_8541 ) ) ( not ( = ?AUTO_8546 ?AUTO_8541 ) ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8544 ?AUTO_8541 ) ( VISIBLE ?AUTO_8544 ?AUTO_8541 ) ( not ( = ?AUTO_8543 ?AUTO_8544 ) ) ( not ( = ?AUTO_8546 ?AUTO_8544 ) ) ( not ( = ?AUTO_8541 ?AUTO_8544 ) ) ( CAN_TRAVERSE ?AUTO_8540 ?AUTO_8547 ?AUTO_8544 ) ( AT ?AUTO_8540 ?AUTO_8547 ) ( VISIBLE ?AUTO_8547 ?AUTO_8544 ) ( not ( = ?AUTO_8543 ?AUTO_8547 ) ) ( not ( = ?AUTO_8546 ?AUTO_8547 ) ) ( not ( = ?AUTO_8541 ?AUTO_8547 ) ) ( not ( = ?AUTO_8544 ?AUTO_8547 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8540 ?AUTO_8547 ?AUTO_8544 )
      ( GET_IMAGE_DATA ?AUTO_8538 ?AUTO_8539 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8538 ?AUTO_8539 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8600 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8605 - LANDER
      ?AUTO_8601 - WAYPOINT
      ?AUTO_8602 - ROVER
      ?AUTO_8604 - WAYPOINT
      ?AUTO_8603 - WAYPOINT
      ?AUTO_8606 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8605 ?AUTO_8601 ) ( HAVE_SOIL_ANALYSIS ?AUTO_8602 ?AUTO_8600 ) ( VISIBLE ?AUTO_8604 ?AUTO_8601 ) ( AVAILABLE ?AUTO_8602 ) ( CHANNEL_FREE ?AUTO_8605 ) ( not ( = ?AUTO_8600 ?AUTO_8604 ) ) ( not ( = ?AUTO_8600 ?AUTO_8601 ) ) ( not ( = ?AUTO_8604 ?AUTO_8601 ) ) ( CAN_TRAVERSE ?AUTO_8602 ?AUTO_8603 ?AUTO_8604 ) ( VISIBLE ?AUTO_8603 ?AUTO_8604 ) ( not ( = ?AUTO_8600 ?AUTO_8603 ) ) ( not ( = ?AUTO_8601 ?AUTO_8603 ) ) ( not ( = ?AUTO_8604 ?AUTO_8603 ) ) ( CAN_TRAVERSE ?AUTO_8602 ?AUTO_8606 ?AUTO_8603 ) ( AT ?AUTO_8602 ?AUTO_8606 ) ( VISIBLE ?AUTO_8606 ?AUTO_8603 ) ( not ( = ?AUTO_8600 ?AUTO_8606 ) ) ( not ( = ?AUTO_8601 ?AUTO_8606 ) ) ( not ( = ?AUTO_8604 ?AUTO_8606 ) ) ( not ( = ?AUTO_8603 ?AUTO_8606 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8602 ?AUTO_8606 ?AUTO_8603 )
      ( GET_SOIL_DATA ?AUTO_8600 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8600 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8607 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8610 - LANDER
      ?AUTO_8608 - WAYPOINT
      ?AUTO_8609 - ROVER
      ?AUTO_8611 - WAYPOINT
      ?AUTO_8612 - WAYPOINT
      ?AUTO_8613 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8610 ?AUTO_8608 ) ( HAVE_SOIL_ANALYSIS ?AUTO_8609 ?AUTO_8607 ) ( VISIBLE ?AUTO_8611 ?AUTO_8608 ) ( AVAILABLE ?AUTO_8609 ) ( CHANNEL_FREE ?AUTO_8610 ) ( not ( = ?AUTO_8607 ?AUTO_8611 ) ) ( not ( = ?AUTO_8607 ?AUTO_8608 ) ) ( not ( = ?AUTO_8611 ?AUTO_8608 ) ) ( CAN_TRAVERSE ?AUTO_8609 ?AUTO_8612 ?AUTO_8611 ) ( VISIBLE ?AUTO_8612 ?AUTO_8611 ) ( not ( = ?AUTO_8607 ?AUTO_8612 ) ) ( not ( = ?AUTO_8608 ?AUTO_8612 ) ) ( not ( = ?AUTO_8611 ?AUTO_8612 ) ) ( CAN_TRAVERSE ?AUTO_8609 ?AUTO_8613 ?AUTO_8612 ) ( VISIBLE ?AUTO_8613 ?AUTO_8612 ) ( not ( = ?AUTO_8607 ?AUTO_8613 ) ) ( not ( = ?AUTO_8608 ?AUTO_8613 ) ) ( not ( = ?AUTO_8611 ?AUTO_8613 ) ) ( not ( = ?AUTO_8612 ?AUTO_8613 ) ) ( CAN_TRAVERSE ?AUTO_8609 ?AUTO_8607 ?AUTO_8613 ) ( AT ?AUTO_8609 ?AUTO_8607 ) ( VISIBLE ?AUTO_8607 ?AUTO_8613 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8609 ?AUTO_8607 ?AUTO_8613 )
      ( GET_SOIL_DATA ?AUTO_8607 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8607 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8614 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8619 - LANDER
      ?AUTO_8615 - WAYPOINT
      ?AUTO_8620 - WAYPOINT
      ?AUTO_8616 - ROVER
      ?AUTO_8618 - WAYPOINT
      ?AUTO_8617 - WAYPOINT
      ?AUTO_8621 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8619 ?AUTO_8615 ) ( VISIBLE ?AUTO_8620 ?AUTO_8615 ) ( AVAILABLE ?AUTO_8616 ) ( CHANNEL_FREE ?AUTO_8619 ) ( not ( = ?AUTO_8614 ?AUTO_8620 ) ) ( not ( = ?AUTO_8614 ?AUTO_8615 ) ) ( not ( = ?AUTO_8620 ?AUTO_8615 ) ) ( CAN_TRAVERSE ?AUTO_8616 ?AUTO_8618 ?AUTO_8620 ) ( VISIBLE ?AUTO_8618 ?AUTO_8620 ) ( not ( = ?AUTO_8614 ?AUTO_8618 ) ) ( not ( = ?AUTO_8615 ?AUTO_8618 ) ) ( not ( = ?AUTO_8620 ?AUTO_8618 ) ) ( CAN_TRAVERSE ?AUTO_8616 ?AUTO_8617 ?AUTO_8618 ) ( VISIBLE ?AUTO_8617 ?AUTO_8618 ) ( not ( = ?AUTO_8614 ?AUTO_8617 ) ) ( not ( = ?AUTO_8615 ?AUTO_8617 ) ) ( not ( = ?AUTO_8620 ?AUTO_8617 ) ) ( not ( = ?AUTO_8618 ?AUTO_8617 ) ) ( CAN_TRAVERSE ?AUTO_8616 ?AUTO_8614 ?AUTO_8617 ) ( AT ?AUTO_8616 ?AUTO_8614 ) ( VISIBLE ?AUTO_8614 ?AUTO_8617 ) ( AT_SOIL_SAMPLE ?AUTO_8614 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8616 ) ( STORE_OF ?AUTO_8621 ?AUTO_8616 ) ( EMPTY ?AUTO_8621 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_8616 ?AUTO_8621 ?AUTO_8614 )
      ( GET_SOIL_DATA ?AUTO_8614 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8614 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8622 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8626 - LANDER
      ?AUTO_8623 - WAYPOINT
      ?AUTO_8625 - WAYPOINT
      ?AUTO_8624 - ROVER
      ?AUTO_8627 - WAYPOINT
      ?AUTO_8629 - WAYPOINT
      ?AUTO_8628 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8626 ?AUTO_8623 ) ( VISIBLE ?AUTO_8625 ?AUTO_8623 ) ( AVAILABLE ?AUTO_8624 ) ( CHANNEL_FREE ?AUTO_8626 ) ( not ( = ?AUTO_8622 ?AUTO_8625 ) ) ( not ( = ?AUTO_8622 ?AUTO_8623 ) ) ( not ( = ?AUTO_8625 ?AUTO_8623 ) ) ( CAN_TRAVERSE ?AUTO_8624 ?AUTO_8627 ?AUTO_8625 ) ( VISIBLE ?AUTO_8627 ?AUTO_8625 ) ( not ( = ?AUTO_8622 ?AUTO_8627 ) ) ( not ( = ?AUTO_8623 ?AUTO_8627 ) ) ( not ( = ?AUTO_8625 ?AUTO_8627 ) ) ( CAN_TRAVERSE ?AUTO_8624 ?AUTO_8629 ?AUTO_8627 ) ( VISIBLE ?AUTO_8629 ?AUTO_8627 ) ( not ( = ?AUTO_8622 ?AUTO_8629 ) ) ( not ( = ?AUTO_8623 ?AUTO_8629 ) ) ( not ( = ?AUTO_8625 ?AUTO_8629 ) ) ( not ( = ?AUTO_8627 ?AUTO_8629 ) ) ( CAN_TRAVERSE ?AUTO_8624 ?AUTO_8622 ?AUTO_8629 ) ( VISIBLE ?AUTO_8622 ?AUTO_8629 ) ( AT_SOIL_SAMPLE ?AUTO_8622 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8624 ) ( STORE_OF ?AUTO_8628 ?AUTO_8624 ) ( EMPTY ?AUTO_8628 ) ( CAN_TRAVERSE ?AUTO_8624 ?AUTO_8627 ?AUTO_8622 ) ( AT ?AUTO_8624 ?AUTO_8627 ) ( VISIBLE ?AUTO_8627 ?AUTO_8622 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8624 ?AUTO_8627 ?AUTO_8622 )
      ( GET_SOIL_DATA ?AUTO_8622 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8622 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8630 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8635 - LANDER
      ?AUTO_8634 - WAYPOINT
      ?AUTO_8637 - WAYPOINT
      ?AUTO_8633 - ROVER
      ?AUTO_8636 - WAYPOINT
      ?AUTO_8632 - WAYPOINT
      ?AUTO_8631 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8635 ?AUTO_8634 ) ( VISIBLE ?AUTO_8637 ?AUTO_8634 ) ( AVAILABLE ?AUTO_8633 ) ( CHANNEL_FREE ?AUTO_8635 ) ( not ( = ?AUTO_8630 ?AUTO_8637 ) ) ( not ( = ?AUTO_8630 ?AUTO_8634 ) ) ( not ( = ?AUTO_8637 ?AUTO_8634 ) ) ( CAN_TRAVERSE ?AUTO_8633 ?AUTO_8636 ?AUTO_8637 ) ( VISIBLE ?AUTO_8636 ?AUTO_8637 ) ( not ( = ?AUTO_8630 ?AUTO_8636 ) ) ( not ( = ?AUTO_8634 ?AUTO_8636 ) ) ( not ( = ?AUTO_8637 ?AUTO_8636 ) ) ( CAN_TRAVERSE ?AUTO_8633 ?AUTO_8632 ?AUTO_8636 ) ( VISIBLE ?AUTO_8632 ?AUTO_8636 ) ( not ( = ?AUTO_8630 ?AUTO_8632 ) ) ( not ( = ?AUTO_8634 ?AUTO_8632 ) ) ( not ( = ?AUTO_8637 ?AUTO_8632 ) ) ( not ( = ?AUTO_8636 ?AUTO_8632 ) ) ( CAN_TRAVERSE ?AUTO_8633 ?AUTO_8630 ?AUTO_8632 ) ( VISIBLE ?AUTO_8630 ?AUTO_8632 ) ( AT_SOIL_SAMPLE ?AUTO_8630 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8633 ) ( STORE_OF ?AUTO_8631 ?AUTO_8633 ) ( EMPTY ?AUTO_8631 ) ( CAN_TRAVERSE ?AUTO_8633 ?AUTO_8636 ?AUTO_8630 ) ( VISIBLE ?AUTO_8636 ?AUTO_8630 ) ( CAN_TRAVERSE ?AUTO_8633 ?AUTO_8637 ?AUTO_8636 ) ( AT ?AUTO_8633 ?AUTO_8637 ) ( VISIBLE ?AUTO_8637 ?AUTO_8636 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8633 ?AUTO_8637 ?AUTO_8636 )
      ( GET_SOIL_DATA ?AUTO_8630 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8630 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8638 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8644 - LANDER
      ?AUTO_8641 - WAYPOINT
      ?AUTO_8639 - WAYPOINT
      ?AUTO_8643 - ROVER
      ?AUTO_8645 - WAYPOINT
      ?AUTO_8640 - WAYPOINT
      ?AUTO_8642 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8644 ?AUTO_8641 ) ( VISIBLE ?AUTO_8639 ?AUTO_8641 ) ( AVAILABLE ?AUTO_8643 ) ( CHANNEL_FREE ?AUTO_8644 ) ( not ( = ?AUTO_8638 ?AUTO_8639 ) ) ( not ( = ?AUTO_8638 ?AUTO_8641 ) ) ( not ( = ?AUTO_8639 ?AUTO_8641 ) ) ( CAN_TRAVERSE ?AUTO_8643 ?AUTO_8645 ?AUTO_8639 ) ( VISIBLE ?AUTO_8645 ?AUTO_8639 ) ( not ( = ?AUTO_8638 ?AUTO_8645 ) ) ( not ( = ?AUTO_8641 ?AUTO_8645 ) ) ( not ( = ?AUTO_8639 ?AUTO_8645 ) ) ( CAN_TRAVERSE ?AUTO_8643 ?AUTO_8640 ?AUTO_8645 ) ( VISIBLE ?AUTO_8640 ?AUTO_8645 ) ( not ( = ?AUTO_8638 ?AUTO_8640 ) ) ( not ( = ?AUTO_8641 ?AUTO_8640 ) ) ( not ( = ?AUTO_8639 ?AUTO_8640 ) ) ( not ( = ?AUTO_8645 ?AUTO_8640 ) ) ( CAN_TRAVERSE ?AUTO_8643 ?AUTO_8638 ?AUTO_8640 ) ( VISIBLE ?AUTO_8638 ?AUTO_8640 ) ( AT_SOIL_SAMPLE ?AUTO_8638 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8643 ) ( STORE_OF ?AUTO_8642 ?AUTO_8643 ) ( CAN_TRAVERSE ?AUTO_8643 ?AUTO_8645 ?AUTO_8638 ) ( VISIBLE ?AUTO_8645 ?AUTO_8638 ) ( CAN_TRAVERSE ?AUTO_8643 ?AUTO_8639 ?AUTO_8645 ) ( AT ?AUTO_8643 ?AUTO_8639 ) ( VISIBLE ?AUTO_8639 ?AUTO_8645 ) ( FULL ?AUTO_8642 ) )
    :subtasks
    ( ( !DROP ?AUTO_8643 ?AUTO_8642 )
      ( GET_SOIL_DATA ?AUTO_8638 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8638 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8649 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8651 - LANDER
      ?AUTO_8654 - WAYPOINT
      ?AUTO_8652 - WAYPOINT
      ?AUTO_8655 - ROVER
      ?AUTO_8650 - WAYPOINT
      ?AUTO_8653 - WAYPOINT
      ?AUTO_8656 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8651 ?AUTO_8654 ) ( VISIBLE ?AUTO_8652 ?AUTO_8654 ) ( AVAILABLE ?AUTO_8655 ) ( CHANNEL_FREE ?AUTO_8651 ) ( not ( = ?AUTO_8649 ?AUTO_8652 ) ) ( not ( = ?AUTO_8649 ?AUTO_8654 ) ) ( not ( = ?AUTO_8652 ?AUTO_8654 ) ) ( CAN_TRAVERSE ?AUTO_8655 ?AUTO_8650 ?AUTO_8652 ) ( VISIBLE ?AUTO_8650 ?AUTO_8652 ) ( not ( = ?AUTO_8649 ?AUTO_8650 ) ) ( not ( = ?AUTO_8654 ?AUTO_8650 ) ) ( not ( = ?AUTO_8652 ?AUTO_8650 ) ) ( CAN_TRAVERSE ?AUTO_8655 ?AUTO_8653 ?AUTO_8650 ) ( VISIBLE ?AUTO_8653 ?AUTO_8650 ) ( not ( = ?AUTO_8649 ?AUTO_8653 ) ) ( not ( = ?AUTO_8654 ?AUTO_8653 ) ) ( not ( = ?AUTO_8652 ?AUTO_8653 ) ) ( not ( = ?AUTO_8650 ?AUTO_8653 ) ) ( CAN_TRAVERSE ?AUTO_8655 ?AUTO_8649 ?AUTO_8653 ) ( VISIBLE ?AUTO_8649 ?AUTO_8653 ) ( AT_SOIL_SAMPLE ?AUTO_8649 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8655 ) ( STORE_OF ?AUTO_8656 ?AUTO_8655 ) ( EMPTY ?AUTO_8656 ) ( CAN_TRAVERSE ?AUTO_8655 ?AUTO_8650 ?AUTO_8649 ) ( VISIBLE ?AUTO_8650 ?AUTO_8649 ) ( CAN_TRAVERSE ?AUTO_8655 ?AUTO_8652 ?AUTO_8650 ) ( VISIBLE ?AUTO_8652 ?AUTO_8650 ) ( CAN_TRAVERSE ?AUTO_8655 ?AUTO_8654 ?AUTO_8652 ) ( AT ?AUTO_8655 ?AUTO_8654 ) ( VISIBLE ?AUTO_8654 ?AUTO_8652 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8655 ?AUTO_8654 ?AUTO_8652 )
      ( GET_SOIL_DATA ?AUTO_8649 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8649 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8661 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8667 - LANDER
      ?AUTO_8664 - WAYPOINT
      ?AUTO_8665 - WAYPOINT
      ?AUTO_8663 - ROVER
      ?AUTO_8662 - WAYPOINT
      ?AUTO_8666 - WAYPOINT
      ?AUTO_8668 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8667 ?AUTO_8664 ) ( VISIBLE ?AUTO_8665 ?AUTO_8664 ) ( AVAILABLE ?AUTO_8663 ) ( CHANNEL_FREE ?AUTO_8667 ) ( not ( = ?AUTO_8661 ?AUTO_8665 ) ) ( not ( = ?AUTO_8661 ?AUTO_8664 ) ) ( not ( = ?AUTO_8665 ?AUTO_8664 ) ) ( CAN_TRAVERSE ?AUTO_8663 ?AUTO_8662 ?AUTO_8665 ) ( VISIBLE ?AUTO_8662 ?AUTO_8665 ) ( not ( = ?AUTO_8661 ?AUTO_8662 ) ) ( not ( = ?AUTO_8664 ?AUTO_8662 ) ) ( not ( = ?AUTO_8665 ?AUTO_8662 ) ) ( CAN_TRAVERSE ?AUTO_8663 ?AUTO_8666 ?AUTO_8662 ) ( VISIBLE ?AUTO_8666 ?AUTO_8662 ) ( not ( = ?AUTO_8661 ?AUTO_8666 ) ) ( not ( = ?AUTO_8664 ?AUTO_8666 ) ) ( not ( = ?AUTO_8665 ?AUTO_8666 ) ) ( not ( = ?AUTO_8662 ?AUTO_8666 ) ) ( CAN_TRAVERSE ?AUTO_8663 ?AUTO_8661 ?AUTO_8666 ) ( VISIBLE ?AUTO_8661 ?AUTO_8666 ) ( AT_SOIL_SAMPLE ?AUTO_8661 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8663 ) ( STORE_OF ?AUTO_8668 ?AUTO_8663 ) ( EMPTY ?AUTO_8668 ) ( CAN_TRAVERSE ?AUTO_8663 ?AUTO_8662 ?AUTO_8661 ) ( VISIBLE ?AUTO_8662 ?AUTO_8661 ) ( AT ?AUTO_8663 ?AUTO_8666 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8663 ?AUTO_8666 ?AUTO_8662 )
      ( GET_SOIL_DATA ?AUTO_8661 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8661 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8721 - OBJECTIVE
      ?AUTO_8722 - MODE
    )
    :vars
    (
      ?AUTO_8724 - LANDER
      ?AUTO_8728 - WAYPOINT
      ?AUTO_8725 - WAYPOINT
      ?AUTO_8727 - ROVER
      ?AUTO_8723 - WAYPOINT
      ?AUTO_8726 - WAYPOINT
      ?AUTO_8729 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8724 ?AUTO_8728 ) ( VISIBLE ?AUTO_8725 ?AUTO_8728 ) ( AVAILABLE ?AUTO_8727 ) ( CHANNEL_FREE ?AUTO_8724 ) ( not ( = ?AUTO_8725 ?AUTO_8728 ) ) ( CAN_TRAVERSE ?AUTO_8727 ?AUTO_8723 ?AUTO_8725 ) ( VISIBLE ?AUTO_8723 ?AUTO_8725 ) ( not ( = ?AUTO_8728 ?AUTO_8723 ) ) ( not ( = ?AUTO_8725 ?AUTO_8723 ) ) ( CAN_TRAVERSE ?AUTO_8727 ?AUTO_8726 ?AUTO_8723 ) ( VISIBLE ?AUTO_8726 ?AUTO_8723 ) ( not ( = ?AUTO_8728 ?AUTO_8726 ) ) ( not ( = ?AUTO_8725 ?AUTO_8726 ) ) ( not ( = ?AUTO_8723 ?AUTO_8726 ) ) ( ON_BOARD ?AUTO_8729 ?AUTO_8727 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8727 ) ( SUPPORTS ?AUTO_8729 ?AUTO_8722 ) ( VISIBLE_FROM ?AUTO_8721 ?AUTO_8726 ) ( CALIBRATION_TARGET ?AUTO_8729 ?AUTO_8721 ) ( CAN_TRAVERSE ?AUTO_8727 ?AUTO_8725 ?AUTO_8726 ) ( AT ?AUTO_8727 ?AUTO_8725 ) ( VISIBLE ?AUTO_8725 ?AUTO_8726 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8727 ?AUTO_8725 ?AUTO_8726 )
      ( GET_IMAGE_DATA ?AUTO_8721 ?AUTO_8722 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8721 ?AUTO_8722 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8734 - OBJECTIVE
      ?AUTO_8735 - MODE
    )
    :vars
    (
      ?AUTO_8739 - LANDER
      ?AUTO_8742 - WAYPOINT
      ?AUTO_8741 - WAYPOINT
      ?AUTO_8737 - ROVER
      ?AUTO_8736 - WAYPOINT
      ?AUTO_8738 - WAYPOINT
      ?AUTO_8740 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8739 ?AUTO_8742 ) ( VISIBLE ?AUTO_8741 ?AUTO_8742 ) ( AVAILABLE ?AUTO_8737 ) ( CHANNEL_FREE ?AUTO_8739 ) ( not ( = ?AUTO_8741 ?AUTO_8742 ) ) ( CAN_TRAVERSE ?AUTO_8737 ?AUTO_8736 ?AUTO_8741 ) ( VISIBLE ?AUTO_8736 ?AUTO_8741 ) ( not ( = ?AUTO_8742 ?AUTO_8736 ) ) ( not ( = ?AUTO_8741 ?AUTO_8736 ) ) ( CAN_TRAVERSE ?AUTO_8737 ?AUTO_8738 ?AUTO_8736 ) ( VISIBLE ?AUTO_8738 ?AUTO_8736 ) ( not ( = ?AUTO_8742 ?AUTO_8738 ) ) ( not ( = ?AUTO_8741 ?AUTO_8738 ) ) ( not ( = ?AUTO_8736 ?AUTO_8738 ) ) ( ON_BOARD ?AUTO_8740 ?AUTO_8737 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8737 ) ( SUPPORTS ?AUTO_8740 ?AUTO_8735 ) ( VISIBLE_FROM ?AUTO_8734 ?AUTO_8738 ) ( CALIBRATION_TARGET ?AUTO_8740 ?AUTO_8734 ) ( CAN_TRAVERSE ?AUTO_8737 ?AUTO_8741 ?AUTO_8738 ) ( VISIBLE ?AUTO_8741 ?AUTO_8738 ) ( CAN_TRAVERSE ?AUTO_8737 ?AUTO_8742 ?AUTO_8741 ) ( AT ?AUTO_8737 ?AUTO_8742 ) ( VISIBLE ?AUTO_8742 ?AUTO_8741 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8737 ?AUTO_8742 ?AUTO_8741 )
      ( GET_IMAGE_DATA ?AUTO_8734 ?AUTO_8735 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8734 ?AUTO_8735 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8961 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8962 - LANDER
      ?AUTO_8965 - WAYPOINT
      ?AUTO_8964 - WAYPOINT
      ?AUTO_8967 - ROVER
      ?AUTO_8966 - WAYPOINT
      ?AUTO_8968 - WAYPOINT
      ?AUTO_8963 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8962 ?AUTO_8965 ) ( VISIBLE ?AUTO_8964 ?AUTO_8965 ) ( AVAILABLE ?AUTO_8967 ) ( CHANNEL_FREE ?AUTO_8962 ) ( not ( = ?AUTO_8961 ?AUTO_8964 ) ) ( not ( = ?AUTO_8961 ?AUTO_8965 ) ) ( not ( = ?AUTO_8964 ?AUTO_8965 ) ) ( CAN_TRAVERSE ?AUTO_8967 ?AUTO_8966 ?AUTO_8964 ) ( VISIBLE ?AUTO_8966 ?AUTO_8964 ) ( not ( = ?AUTO_8961 ?AUTO_8966 ) ) ( not ( = ?AUTO_8965 ?AUTO_8966 ) ) ( not ( = ?AUTO_8964 ?AUTO_8966 ) ) ( CAN_TRAVERSE ?AUTO_8967 ?AUTO_8968 ?AUTO_8966 ) ( VISIBLE ?AUTO_8968 ?AUTO_8966 ) ( not ( = ?AUTO_8961 ?AUTO_8968 ) ) ( not ( = ?AUTO_8965 ?AUTO_8968 ) ) ( not ( = ?AUTO_8964 ?AUTO_8968 ) ) ( not ( = ?AUTO_8966 ?AUTO_8968 ) ) ( CAN_TRAVERSE ?AUTO_8967 ?AUTO_8961 ?AUTO_8968 ) ( VISIBLE ?AUTO_8961 ?AUTO_8968 ) ( AT_SOIL_SAMPLE ?AUTO_8961 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8967 ) ( STORE_OF ?AUTO_8963 ?AUTO_8967 ) ( CAN_TRAVERSE ?AUTO_8967 ?AUTO_8966 ?AUTO_8961 ) ( AT ?AUTO_8967 ?AUTO_8966 ) ( VISIBLE ?AUTO_8966 ?AUTO_8961 ) ( FULL ?AUTO_8963 ) )
    :subtasks
    ( ( !DROP ?AUTO_8967 ?AUTO_8963 )
      ( GET_SOIL_DATA ?AUTO_8961 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8961 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9017 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9020 - LANDER
      ?AUTO_9021 - WAYPOINT
      ?AUTO_9019 - WAYPOINT
      ?AUTO_9018 - ROVER
      ?AUTO_9022 - WAYPOINT
      ?AUTO_9023 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9020 ?AUTO_9021 ) ( VISIBLE ?AUTO_9019 ?AUTO_9021 ) ( AVAILABLE ?AUTO_9018 ) ( CHANNEL_FREE ?AUTO_9020 ) ( not ( = ?AUTO_9017 ?AUTO_9019 ) ) ( not ( = ?AUTO_9017 ?AUTO_9021 ) ) ( not ( = ?AUTO_9019 ?AUTO_9021 ) ) ( CAN_TRAVERSE ?AUTO_9018 ?AUTO_9022 ?AUTO_9019 ) ( VISIBLE ?AUTO_9022 ?AUTO_9019 ) ( not ( = ?AUTO_9017 ?AUTO_9022 ) ) ( not ( = ?AUTO_9021 ?AUTO_9022 ) ) ( not ( = ?AUTO_9019 ?AUTO_9022 ) ) ( CAN_TRAVERSE ?AUTO_9018 ?AUTO_9017 ?AUTO_9022 ) ( AT ?AUTO_9018 ?AUTO_9017 ) ( VISIBLE ?AUTO_9017 ?AUTO_9022 ) ( AT_ROCK_SAMPLE ?AUTO_9017 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9018 ) ( STORE_OF ?AUTO_9023 ?AUTO_9018 ) ( FULL ?AUTO_9023 ) )
    :subtasks
    ( ( !DROP ?AUTO_9018 ?AUTO_9023 )
      ( GET_ROCK_DATA ?AUTO_9017 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9017 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9024 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9029 - LANDER
      ?AUTO_9030 - WAYPOINT
      ?AUTO_9027 - WAYPOINT
      ?AUTO_9028 - ROVER
      ?AUTO_9026 - WAYPOINT
      ?AUTO_9025 - STORE
      ?AUTO_9031 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9029 ?AUTO_9030 ) ( VISIBLE ?AUTO_9027 ?AUTO_9030 ) ( AVAILABLE ?AUTO_9028 ) ( CHANNEL_FREE ?AUTO_9029 ) ( not ( = ?AUTO_9024 ?AUTO_9027 ) ) ( not ( = ?AUTO_9024 ?AUTO_9030 ) ) ( not ( = ?AUTO_9027 ?AUTO_9030 ) ) ( CAN_TRAVERSE ?AUTO_9028 ?AUTO_9026 ?AUTO_9027 ) ( VISIBLE ?AUTO_9026 ?AUTO_9027 ) ( not ( = ?AUTO_9024 ?AUTO_9026 ) ) ( not ( = ?AUTO_9030 ?AUTO_9026 ) ) ( not ( = ?AUTO_9027 ?AUTO_9026 ) ) ( CAN_TRAVERSE ?AUTO_9028 ?AUTO_9024 ?AUTO_9026 ) ( VISIBLE ?AUTO_9024 ?AUTO_9026 ) ( AT_ROCK_SAMPLE ?AUTO_9024 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9028 ) ( STORE_OF ?AUTO_9025 ?AUTO_9028 ) ( FULL ?AUTO_9025 ) ( CAN_TRAVERSE ?AUTO_9028 ?AUTO_9031 ?AUTO_9024 ) ( AT ?AUTO_9028 ?AUTO_9031 ) ( VISIBLE ?AUTO_9031 ?AUTO_9024 ) ( not ( = ?AUTO_9024 ?AUTO_9031 ) ) ( not ( = ?AUTO_9030 ?AUTO_9031 ) ) ( not ( = ?AUTO_9027 ?AUTO_9031 ) ) ( not ( = ?AUTO_9026 ?AUTO_9031 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9028 ?AUTO_9031 ?AUTO_9024 )
      ( GET_ROCK_DATA ?AUTO_9024 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9024 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9032 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9035 - LANDER
      ?AUTO_9037 - WAYPOINT
      ?AUTO_9038 - WAYPOINT
      ?AUTO_9036 - ROVER
      ?AUTO_9033 - WAYPOINT
      ?AUTO_9034 - STORE
      ?AUTO_9039 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9035 ?AUTO_9037 ) ( VISIBLE ?AUTO_9038 ?AUTO_9037 ) ( AVAILABLE ?AUTO_9036 ) ( CHANNEL_FREE ?AUTO_9035 ) ( not ( = ?AUTO_9032 ?AUTO_9038 ) ) ( not ( = ?AUTO_9032 ?AUTO_9037 ) ) ( not ( = ?AUTO_9038 ?AUTO_9037 ) ) ( CAN_TRAVERSE ?AUTO_9036 ?AUTO_9033 ?AUTO_9038 ) ( VISIBLE ?AUTO_9033 ?AUTO_9038 ) ( not ( = ?AUTO_9032 ?AUTO_9033 ) ) ( not ( = ?AUTO_9037 ?AUTO_9033 ) ) ( not ( = ?AUTO_9038 ?AUTO_9033 ) ) ( CAN_TRAVERSE ?AUTO_9036 ?AUTO_9032 ?AUTO_9033 ) ( VISIBLE ?AUTO_9032 ?AUTO_9033 ) ( AT_ROCK_SAMPLE ?AUTO_9032 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9036 ) ( STORE_OF ?AUTO_9034 ?AUTO_9036 ) ( CAN_TRAVERSE ?AUTO_9036 ?AUTO_9039 ?AUTO_9032 ) ( AT ?AUTO_9036 ?AUTO_9039 ) ( VISIBLE ?AUTO_9039 ?AUTO_9032 ) ( not ( = ?AUTO_9032 ?AUTO_9039 ) ) ( not ( = ?AUTO_9037 ?AUTO_9039 ) ) ( not ( = ?AUTO_9038 ?AUTO_9039 ) ) ( not ( = ?AUTO_9033 ?AUTO_9039 ) ) ( AT_ROCK_SAMPLE ?AUTO_9039 ) ( EMPTY ?AUTO_9034 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_9036 ?AUTO_9034 ?AUTO_9039 )
      ( GET_ROCK_DATA ?AUTO_9032 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9032 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9042 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9045 - LANDER
      ?AUTO_9049 - WAYPOINT
      ?AUTO_9043 - WAYPOINT
      ?AUTO_9048 - ROVER
      ?AUTO_9047 - WAYPOINT
      ?AUTO_9046 - STORE
      ?AUTO_9044 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9045 ?AUTO_9049 ) ( VISIBLE ?AUTO_9043 ?AUTO_9049 ) ( AVAILABLE ?AUTO_9048 ) ( CHANNEL_FREE ?AUTO_9045 ) ( not ( = ?AUTO_9042 ?AUTO_9043 ) ) ( not ( = ?AUTO_9042 ?AUTO_9049 ) ) ( not ( = ?AUTO_9043 ?AUTO_9049 ) ) ( CAN_TRAVERSE ?AUTO_9048 ?AUTO_9047 ?AUTO_9043 ) ( VISIBLE ?AUTO_9047 ?AUTO_9043 ) ( not ( = ?AUTO_9042 ?AUTO_9047 ) ) ( not ( = ?AUTO_9049 ?AUTO_9047 ) ) ( not ( = ?AUTO_9043 ?AUTO_9047 ) ) ( CAN_TRAVERSE ?AUTO_9048 ?AUTO_9042 ?AUTO_9047 ) ( VISIBLE ?AUTO_9042 ?AUTO_9047 ) ( AT_ROCK_SAMPLE ?AUTO_9042 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9048 ) ( STORE_OF ?AUTO_9046 ?AUTO_9048 ) ( CAN_TRAVERSE ?AUTO_9048 ?AUTO_9044 ?AUTO_9042 ) ( VISIBLE ?AUTO_9044 ?AUTO_9042 ) ( not ( = ?AUTO_9042 ?AUTO_9044 ) ) ( not ( = ?AUTO_9049 ?AUTO_9044 ) ) ( not ( = ?AUTO_9043 ?AUTO_9044 ) ) ( not ( = ?AUTO_9047 ?AUTO_9044 ) ) ( AT_ROCK_SAMPLE ?AUTO_9044 ) ( EMPTY ?AUTO_9046 ) ( CAN_TRAVERSE ?AUTO_9048 ?AUTO_9047 ?AUTO_9044 ) ( AT ?AUTO_9048 ?AUTO_9047 ) ( VISIBLE ?AUTO_9047 ?AUTO_9044 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9048 ?AUTO_9047 ?AUTO_9044 )
      ( GET_ROCK_DATA ?AUTO_9042 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9042 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9050 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9056 - LANDER
      ?AUTO_9057 - WAYPOINT
      ?AUTO_9054 - WAYPOINT
      ?AUTO_9051 - ROVER
      ?AUTO_9053 - WAYPOINT
      ?AUTO_9055 - STORE
      ?AUTO_9052 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9056 ?AUTO_9057 ) ( VISIBLE ?AUTO_9054 ?AUTO_9057 ) ( AVAILABLE ?AUTO_9051 ) ( CHANNEL_FREE ?AUTO_9056 ) ( not ( = ?AUTO_9050 ?AUTO_9054 ) ) ( not ( = ?AUTO_9050 ?AUTO_9057 ) ) ( not ( = ?AUTO_9054 ?AUTO_9057 ) ) ( CAN_TRAVERSE ?AUTO_9051 ?AUTO_9053 ?AUTO_9054 ) ( VISIBLE ?AUTO_9053 ?AUTO_9054 ) ( not ( = ?AUTO_9050 ?AUTO_9053 ) ) ( not ( = ?AUTO_9057 ?AUTO_9053 ) ) ( not ( = ?AUTO_9054 ?AUTO_9053 ) ) ( CAN_TRAVERSE ?AUTO_9051 ?AUTO_9050 ?AUTO_9053 ) ( VISIBLE ?AUTO_9050 ?AUTO_9053 ) ( AT_ROCK_SAMPLE ?AUTO_9050 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9051 ) ( STORE_OF ?AUTO_9055 ?AUTO_9051 ) ( CAN_TRAVERSE ?AUTO_9051 ?AUTO_9052 ?AUTO_9050 ) ( VISIBLE ?AUTO_9052 ?AUTO_9050 ) ( not ( = ?AUTO_9050 ?AUTO_9052 ) ) ( not ( = ?AUTO_9057 ?AUTO_9052 ) ) ( not ( = ?AUTO_9054 ?AUTO_9052 ) ) ( not ( = ?AUTO_9053 ?AUTO_9052 ) ) ( AT_ROCK_SAMPLE ?AUTO_9052 ) ( EMPTY ?AUTO_9055 ) ( CAN_TRAVERSE ?AUTO_9051 ?AUTO_9053 ?AUTO_9052 ) ( VISIBLE ?AUTO_9053 ?AUTO_9052 ) ( CAN_TRAVERSE ?AUTO_9051 ?AUTO_9054 ?AUTO_9053 ) ( AT ?AUTO_9051 ?AUTO_9054 ) ( VISIBLE ?AUTO_9054 ?AUTO_9053 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9051 ?AUTO_9054 ?AUTO_9053 )
      ( GET_ROCK_DATA ?AUTO_9050 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9050 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9060 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9061 - LANDER
      ?AUTO_9066 - WAYPOINT
      ?AUTO_9067 - WAYPOINT
      ?AUTO_9063 - ROVER
      ?AUTO_9062 - WAYPOINT
      ?AUTO_9064 - STORE
      ?AUTO_9065 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9061 ?AUTO_9066 ) ( VISIBLE ?AUTO_9067 ?AUTO_9066 ) ( AVAILABLE ?AUTO_9063 ) ( CHANNEL_FREE ?AUTO_9061 ) ( not ( = ?AUTO_9060 ?AUTO_9067 ) ) ( not ( = ?AUTO_9060 ?AUTO_9066 ) ) ( not ( = ?AUTO_9067 ?AUTO_9066 ) ) ( CAN_TRAVERSE ?AUTO_9063 ?AUTO_9062 ?AUTO_9067 ) ( VISIBLE ?AUTO_9062 ?AUTO_9067 ) ( not ( = ?AUTO_9060 ?AUTO_9062 ) ) ( not ( = ?AUTO_9066 ?AUTO_9062 ) ) ( not ( = ?AUTO_9067 ?AUTO_9062 ) ) ( CAN_TRAVERSE ?AUTO_9063 ?AUTO_9060 ?AUTO_9062 ) ( VISIBLE ?AUTO_9060 ?AUTO_9062 ) ( AT_ROCK_SAMPLE ?AUTO_9060 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9063 ) ( STORE_OF ?AUTO_9064 ?AUTO_9063 ) ( CAN_TRAVERSE ?AUTO_9063 ?AUTO_9065 ?AUTO_9060 ) ( VISIBLE ?AUTO_9065 ?AUTO_9060 ) ( not ( = ?AUTO_9060 ?AUTO_9065 ) ) ( not ( = ?AUTO_9066 ?AUTO_9065 ) ) ( not ( = ?AUTO_9067 ?AUTO_9065 ) ) ( not ( = ?AUTO_9062 ?AUTO_9065 ) ) ( AT_ROCK_SAMPLE ?AUTO_9065 ) ( CAN_TRAVERSE ?AUTO_9063 ?AUTO_9062 ?AUTO_9065 ) ( AT ?AUTO_9063 ?AUTO_9062 ) ( VISIBLE ?AUTO_9062 ?AUTO_9065 ) ( FULL ?AUTO_9064 ) )
    :subtasks
    ( ( !DROP ?AUTO_9063 ?AUTO_9064 )
      ( GET_ROCK_DATA ?AUTO_9060 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9060 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9075 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9079 - LANDER
      ?AUTO_9078 - WAYPOINT
      ?AUTO_9082 - WAYPOINT
      ?AUTO_9081 - ROVER
      ?AUTO_9076 - WAYPOINT
      ?AUTO_9077 - STORE
      ?AUTO_9080 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9079 ?AUTO_9078 ) ( VISIBLE ?AUTO_9082 ?AUTO_9078 ) ( AVAILABLE ?AUTO_9081 ) ( CHANNEL_FREE ?AUTO_9079 ) ( not ( = ?AUTO_9075 ?AUTO_9082 ) ) ( not ( = ?AUTO_9075 ?AUTO_9078 ) ) ( not ( = ?AUTO_9082 ?AUTO_9078 ) ) ( CAN_TRAVERSE ?AUTO_9081 ?AUTO_9076 ?AUTO_9082 ) ( VISIBLE ?AUTO_9076 ?AUTO_9082 ) ( not ( = ?AUTO_9075 ?AUTO_9076 ) ) ( not ( = ?AUTO_9078 ?AUTO_9076 ) ) ( not ( = ?AUTO_9082 ?AUTO_9076 ) ) ( CAN_TRAVERSE ?AUTO_9081 ?AUTO_9075 ?AUTO_9076 ) ( VISIBLE ?AUTO_9075 ?AUTO_9076 ) ( AT_ROCK_SAMPLE ?AUTO_9075 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9081 ) ( STORE_OF ?AUTO_9077 ?AUTO_9081 ) ( CAN_TRAVERSE ?AUTO_9081 ?AUTO_9080 ?AUTO_9075 ) ( VISIBLE ?AUTO_9080 ?AUTO_9075 ) ( not ( = ?AUTO_9075 ?AUTO_9080 ) ) ( not ( = ?AUTO_9078 ?AUTO_9080 ) ) ( not ( = ?AUTO_9082 ?AUTO_9080 ) ) ( not ( = ?AUTO_9076 ?AUTO_9080 ) ) ( AT_ROCK_SAMPLE ?AUTO_9080 ) ( CAN_TRAVERSE ?AUTO_9081 ?AUTO_9076 ?AUTO_9080 ) ( VISIBLE ?AUTO_9076 ?AUTO_9080 ) ( CAN_TRAVERSE ?AUTO_9081 ?AUTO_9082 ?AUTO_9076 ) ( AT ?AUTO_9081 ?AUTO_9082 ) ( VISIBLE ?AUTO_9082 ?AUTO_9076 ) ( FULL ?AUTO_9077 ) )
    :subtasks
    ( ( !DROP ?AUTO_9081 ?AUTO_9077 )
      ( GET_ROCK_DATA ?AUTO_9075 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9075 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9099 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9102 - LANDER
      ?AUTO_9101 - WAYPOINT
      ?AUTO_9104 - ROVER
      ?AUTO_9103 - WAYPOINT
      ?AUTO_9100 - WAYPOINT
      ?AUTO_9105 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9102 ?AUTO_9101 ) ( HAVE_ROCK_ANALYSIS ?AUTO_9104 ?AUTO_9099 ) ( VISIBLE ?AUTO_9103 ?AUTO_9101 ) ( AVAILABLE ?AUTO_9104 ) ( CHANNEL_FREE ?AUTO_9102 ) ( not ( = ?AUTO_9099 ?AUTO_9103 ) ) ( not ( = ?AUTO_9099 ?AUTO_9101 ) ) ( not ( = ?AUTO_9103 ?AUTO_9101 ) ) ( CAN_TRAVERSE ?AUTO_9104 ?AUTO_9100 ?AUTO_9103 ) ( VISIBLE ?AUTO_9100 ?AUTO_9103 ) ( not ( = ?AUTO_9099 ?AUTO_9100 ) ) ( not ( = ?AUTO_9101 ?AUTO_9100 ) ) ( not ( = ?AUTO_9103 ?AUTO_9100 ) ) ( CAN_TRAVERSE ?AUTO_9104 ?AUTO_9105 ?AUTO_9100 ) ( AT ?AUTO_9104 ?AUTO_9105 ) ( VISIBLE ?AUTO_9105 ?AUTO_9100 ) ( not ( = ?AUTO_9099 ?AUTO_9105 ) ) ( not ( = ?AUTO_9101 ?AUTO_9105 ) ) ( not ( = ?AUTO_9103 ?AUTO_9105 ) ) ( not ( = ?AUTO_9100 ?AUTO_9105 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9104 ?AUTO_9105 ?AUTO_9100 )
      ( GET_ROCK_DATA ?AUTO_9099 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9099 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9128 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9134 - LANDER
      ?AUTO_9129 - WAYPOINT
      ?AUTO_9133 - WAYPOINT
      ?AUTO_9131 - ROVER
      ?AUTO_9130 - WAYPOINT
      ?AUTO_9132 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9134 ?AUTO_9129 ) ( VISIBLE ?AUTO_9133 ?AUTO_9129 ) ( AVAILABLE ?AUTO_9131 ) ( CHANNEL_FREE ?AUTO_9134 ) ( not ( = ?AUTO_9128 ?AUTO_9133 ) ) ( not ( = ?AUTO_9128 ?AUTO_9129 ) ) ( not ( = ?AUTO_9133 ?AUTO_9129 ) ) ( CAN_TRAVERSE ?AUTO_9131 ?AUTO_9130 ?AUTO_9133 ) ( VISIBLE ?AUTO_9130 ?AUTO_9133 ) ( not ( = ?AUTO_9128 ?AUTO_9130 ) ) ( not ( = ?AUTO_9129 ?AUTO_9130 ) ) ( not ( = ?AUTO_9133 ?AUTO_9130 ) ) ( CAN_TRAVERSE ?AUTO_9131 ?AUTO_9128 ?AUTO_9130 ) ( VISIBLE ?AUTO_9128 ?AUTO_9130 ) ( AT_ROCK_SAMPLE ?AUTO_9128 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9131 ) ( STORE_OF ?AUTO_9132 ?AUTO_9131 ) ( CAN_TRAVERSE ?AUTO_9131 ?AUTO_9130 ?AUTO_9128 ) ( AT ?AUTO_9131 ?AUTO_9130 ) ( VISIBLE ?AUTO_9130 ?AUTO_9128 ) ( FULL ?AUTO_9132 ) )
    :subtasks
    ( ( !DROP ?AUTO_9131 ?AUTO_9132 )
      ( GET_ROCK_DATA ?AUTO_9128 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9128 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9281 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9288 - LANDER
      ?AUTO_9283 - WAYPOINT
      ?AUTO_9287 - WAYPOINT
      ?AUTO_9285 - ROVER
      ?AUTO_9284 - STORE
      ?AUTO_9282 - WAYPOINT
      ?AUTO_9286 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9288 ?AUTO_9283 ) ( VISIBLE ?AUTO_9287 ?AUTO_9283 ) ( AVAILABLE ?AUTO_9285 ) ( CHANNEL_FREE ?AUTO_9288 ) ( not ( = ?AUTO_9281 ?AUTO_9287 ) ) ( not ( = ?AUTO_9281 ?AUTO_9283 ) ) ( not ( = ?AUTO_9287 ?AUTO_9283 ) ) ( CAN_TRAVERSE ?AUTO_9285 ?AUTO_9281 ?AUTO_9287 ) ( VISIBLE ?AUTO_9281 ?AUTO_9287 ) ( AT_SOIL_SAMPLE ?AUTO_9281 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9285 ) ( STORE_OF ?AUTO_9284 ?AUTO_9285 ) ( CAN_TRAVERSE ?AUTO_9285 ?AUTO_9282 ?AUTO_9281 ) ( VISIBLE ?AUTO_9282 ?AUTO_9281 ) ( not ( = ?AUTO_9281 ?AUTO_9282 ) ) ( not ( = ?AUTO_9283 ?AUTO_9282 ) ) ( not ( = ?AUTO_9287 ?AUTO_9282 ) ) ( CAN_TRAVERSE ?AUTO_9285 ?AUTO_9286 ?AUTO_9282 ) ( AT ?AUTO_9285 ?AUTO_9286 ) ( VISIBLE ?AUTO_9286 ?AUTO_9282 ) ( not ( = ?AUTO_9281 ?AUTO_9286 ) ) ( not ( = ?AUTO_9283 ?AUTO_9286 ) ) ( not ( = ?AUTO_9287 ?AUTO_9286 ) ) ( not ( = ?AUTO_9282 ?AUTO_9286 ) ) ( FULL ?AUTO_9284 ) )
    :subtasks
    ( ( !DROP ?AUTO_9285 ?AUTO_9284 )
      ( GET_SOIL_DATA ?AUTO_9281 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9281 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9292 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9297 - LANDER
      ?AUTO_9296 - WAYPOINT
      ?AUTO_9299 - WAYPOINT
      ?AUTO_9298 - ROVER
      ?AUTO_9294 - STORE
      ?AUTO_9293 - WAYPOINT
      ?AUTO_9295 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9297 ?AUTO_9296 ) ( VISIBLE ?AUTO_9299 ?AUTO_9296 ) ( AVAILABLE ?AUTO_9298 ) ( CHANNEL_FREE ?AUTO_9297 ) ( not ( = ?AUTO_9292 ?AUTO_9299 ) ) ( not ( = ?AUTO_9292 ?AUTO_9296 ) ) ( not ( = ?AUTO_9299 ?AUTO_9296 ) ) ( CAN_TRAVERSE ?AUTO_9298 ?AUTO_9292 ?AUTO_9299 ) ( VISIBLE ?AUTO_9292 ?AUTO_9299 ) ( AT_SOIL_SAMPLE ?AUTO_9292 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9298 ) ( STORE_OF ?AUTO_9294 ?AUTO_9298 ) ( CAN_TRAVERSE ?AUTO_9298 ?AUTO_9293 ?AUTO_9292 ) ( VISIBLE ?AUTO_9293 ?AUTO_9292 ) ( not ( = ?AUTO_9292 ?AUTO_9293 ) ) ( not ( = ?AUTO_9296 ?AUTO_9293 ) ) ( not ( = ?AUTO_9299 ?AUTO_9293 ) ) ( CAN_TRAVERSE ?AUTO_9298 ?AUTO_9295 ?AUTO_9293 ) ( VISIBLE ?AUTO_9295 ?AUTO_9293 ) ( not ( = ?AUTO_9292 ?AUTO_9295 ) ) ( not ( = ?AUTO_9296 ?AUTO_9295 ) ) ( not ( = ?AUTO_9299 ?AUTO_9295 ) ) ( not ( = ?AUTO_9293 ?AUTO_9295 ) ) ( FULL ?AUTO_9294 ) ( CAN_TRAVERSE ?AUTO_9298 ?AUTO_9299 ?AUTO_9295 ) ( AT ?AUTO_9298 ?AUTO_9299 ) ( VISIBLE ?AUTO_9299 ?AUTO_9295 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9298 ?AUTO_9299 ?AUTO_9295 )
      ( GET_SOIL_DATA ?AUTO_9292 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9292 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9301 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9306 - LANDER
      ?AUTO_9307 - WAYPOINT
      ?AUTO_9303 - WAYPOINT
      ?AUTO_9305 - ROVER
      ?AUTO_9304 - STORE
      ?AUTO_9308 - WAYPOINT
      ?AUTO_9302 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9306 ?AUTO_9307 ) ( VISIBLE ?AUTO_9303 ?AUTO_9307 ) ( AVAILABLE ?AUTO_9305 ) ( CHANNEL_FREE ?AUTO_9306 ) ( not ( = ?AUTO_9301 ?AUTO_9303 ) ) ( not ( = ?AUTO_9301 ?AUTO_9307 ) ) ( not ( = ?AUTO_9303 ?AUTO_9307 ) ) ( CAN_TRAVERSE ?AUTO_9305 ?AUTO_9301 ?AUTO_9303 ) ( VISIBLE ?AUTO_9301 ?AUTO_9303 ) ( AT_SOIL_SAMPLE ?AUTO_9301 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9305 ) ( STORE_OF ?AUTO_9304 ?AUTO_9305 ) ( CAN_TRAVERSE ?AUTO_9305 ?AUTO_9308 ?AUTO_9301 ) ( VISIBLE ?AUTO_9308 ?AUTO_9301 ) ( not ( = ?AUTO_9301 ?AUTO_9308 ) ) ( not ( = ?AUTO_9307 ?AUTO_9308 ) ) ( not ( = ?AUTO_9303 ?AUTO_9308 ) ) ( CAN_TRAVERSE ?AUTO_9305 ?AUTO_9302 ?AUTO_9308 ) ( VISIBLE ?AUTO_9302 ?AUTO_9308 ) ( not ( = ?AUTO_9301 ?AUTO_9302 ) ) ( not ( = ?AUTO_9307 ?AUTO_9302 ) ) ( not ( = ?AUTO_9303 ?AUTO_9302 ) ) ( not ( = ?AUTO_9308 ?AUTO_9302 ) ) ( CAN_TRAVERSE ?AUTO_9305 ?AUTO_9303 ?AUTO_9302 ) ( AT ?AUTO_9305 ?AUTO_9303 ) ( VISIBLE ?AUTO_9303 ?AUTO_9302 ) ( AT_ROCK_SAMPLE ?AUTO_9303 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9305 ) ( EMPTY ?AUTO_9304 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_9305 ?AUTO_9304 ?AUTO_9303 )
      ( GET_SOIL_DATA ?AUTO_9301 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9301 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9344 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9346 - LANDER
      ?AUTO_9349 - WAYPOINT
      ?AUTO_9345 - WAYPOINT
      ?AUTO_9350 - ROVER
      ?AUTO_9347 - WAYPOINT
      ?AUTO_9348 - STORE
      ?AUTO_9351 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9346 ?AUTO_9349 ) ( VISIBLE ?AUTO_9345 ?AUTO_9349 ) ( AVAILABLE ?AUTO_9350 ) ( CHANNEL_FREE ?AUTO_9346 ) ( not ( = ?AUTO_9344 ?AUTO_9345 ) ) ( not ( = ?AUTO_9344 ?AUTO_9349 ) ) ( not ( = ?AUTO_9345 ?AUTO_9349 ) ) ( CAN_TRAVERSE ?AUTO_9350 ?AUTO_9347 ?AUTO_9345 ) ( VISIBLE ?AUTO_9347 ?AUTO_9345 ) ( not ( = ?AUTO_9344 ?AUTO_9347 ) ) ( not ( = ?AUTO_9349 ?AUTO_9347 ) ) ( not ( = ?AUTO_9345 ?AUTO_9347 ) ) ( CAN_TRAVERSE ?AUTO_9350 ?AUTO_9344 ?AUTO_9347 ) ( VISIBLE ?AUTO_9344 ?AUTO_9347 ) ( AT_SOIL_SAMPLE ?AUTO_9344 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9350 ) ( STORE_OF ?AUTO_9348 ?AUTO_9350 ) ( EMPTY ?AUTO_9348 ) ( CAN_TRAVERSE ?AUTO_9350 ?AUTO_9351 ?AUTO_9344 ) ( AT ?AUTO_9350 ?AUTO_9351 ) ( VISIBLE ?AUTO_9351 ?AUTO_9344 ) ( not ( = ?AUTO_9344 ?AUTO_9351 ) ) ( not ( = ?AUTO_9349 ?AUTO_9351 ) ) ( not ( = ?AUTO_9345 ?AUTO_9351 ) ) ( not ( = ?AUTO_9347 ?AUTO_9351 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9350 ?AUTO_9351 ?AUTO_9344 )
      ( GET_SOIL_DATA ?AUTO_9344 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9344 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9352 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9357 - LANDER
      ?AUTO_9355 - WAYPOINT
      ?AUTO_9356 - WAYPOINT
      ?AUTO_9353 - ROVER
      ?AUTO_9354 - WAYPOINT
      ?AUTO_9358 - STORE
      ?AUTO_9359 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9357 ?AUTO_9355 ) ( VISIBLE ?AUTO_9356 ?AUTO_9355 ) ( AVAILABLE ?AUTO_9353 ) ( CHANNEL_FREE ?AUTO_9357 ) ( not ( = ?AUTO_9352 ?AUTO_9356 ) ) ( not ( = ?AUTO_9352 ?AUTO_9355 ) ) ( not ( = ?AUTO_9356 ?AUTO_9355 ) ) ( CAN_TRAVERSE ?AUTO_9353 ?AUTO_9354 ?AUTO_9356 ) ( VISIBLE ?AUTO_9354 ?AUTO_9356 ) ( not ( = ?AUTO_9352 ?AUTO_9354 ) ) ( not ( = ?AUTO_9355 ?AUTO_9354 ) ) ( not ( = ?AUTO_9356 ?AUTO_9354 ) ) ( CAN_TRAVERSE ?AUTO_9353 ?AUTO_9352 ?AUTO_9354 ) ( VISIBLE ?AUTO_9352 ?AUTO_9354 ) ( AT_SOIL_SAMPLE ?AUTO_9352 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9353 ) ( STORE_OF ?AUTO_9358 ?AUTO_9353 ) ( CAN_TRAVERSE ?AUTO_9353 ?AUTO_9359 ?AUTO_9352 ) ( AT ?AUTO_9353 ?AUTO_9359 ) ( VISIBLE ?AUTO_9359 ?AUTO_9352 ) ( not ( = ?AUTO_9352 ?AUTO_9359 ) ) ( not ( = ?AUTO_9355 ?AUTO_9359 ) ) ( not ( = ?AUTO_9356 ?AUTO_9359 ) ) ( not ( = ?AUTO_9354 ?AUTO_9359 ) ) ( FULL ?AUTO_9358 ) )
    :subtasks
    ( ( !DROP ?AUTO_9353 ?AUTO_9358 )
      ( GET_SOIL_DATA ?AUTO_9352 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9352 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9363 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9370 - LANDER
      ?AUTO_9366 - WAYPOINT
      ?AUTO_9365 - WAYPOINT
      ?AUTO_9367 - ROVER
      ?AUTO_9364 - WAYPOINT
      ?AUTO_9368 - STORE
      ?AUTO_9369 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9370 ?AUTO_9366 ) ( VISIBLE ?AUTO_9365 ?AUTO_9366 ) ( AVAILABLE ?AUTO_9367 ) ( CHANNEL_FREE ?AUTO_9370 ) ( not ( = ?AUTO_9363 ?AUTO_9365 ) ) ( not ( = ?AUTO_9363 ?AUTO_9366 ) ) ( not ( = ?AUTO_9365 ?AUTO_9366 ) ) ( CAN_TRAVERSE ?AUTO_9367 ?AUTO_9364 ?AUTO_9365 ) ( VISIBLE ?AUTO_9364 ?AUTO_9365 ) ( not ( = ?AUTO_9363 ?AUTO_9364 ) ) ( not ( = ?AUTO_9366 ?AUTO_9364 ) ) ( not ( = ?AUTO_9365 ?AUTO_9364 ) ) ( CAN_TRAVERSE ?AUTO_9367 ?AUTO_9363 ?AUTO_9364 ) ( VISIBLE ?AUTO_9363 ?AUTO_9364 ) ( AT_SOIL_SAMPLE ?AUTO_9363 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9367 ) ( STORE_OF ?AUTO_9368 ?AUTO_9367 ) ( CAN_TRAVERSE ?AUTO_9367 ?AUTO_9369 ?AUTO_9363 ) ( VISIBLE ?AUTO_9369 ?AUTO_9363 ) ( not ( = ?AUTO_9363 ?AUTO_9369 ) ) ( not ( = ?AUTO_9366 ?AUTO_9369 ) ) ( not ( = ?AUTO_9365 ?AUTO_9369 ) ) ( not ( = ?AUTO_9364 ?AUTO_9369 ) ) ( FULL ?AUTO_9368 ) ( CAN_TRAVERSE ?AUTO_9367 ?AUTO_9365 ?AUTO_9369 ) ( AT ?AUTO_9367 ?AUTO_9365 ) ( VISIBLE ?AUTO_9365 ?AUTO_9369 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9367 ?AUTO_9365 ?AUTO_9369 )
      ( GET_SOIL_DATA ?AUTO_9363 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9363 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9372 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9376 - LANDER
      ?AUTO_9379 - WAYPOINT
      ?AUTO_9373 - WAYPOINT
      ?AUTO_9374 - ROVER
      ?AUTO_9377 - WAYPOINT
      ?AUTO_9378 - STORE
      ?AUTO_9375 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9376 ?AUTO_9379 ) ( VISIBLE ?AUTO_9373 ?AUTO_9379 ) ( AVAILABLE ?AUTO_9374 ) ( CHANNEL_FREE ?AUTO_9376 ) ( not ( = ?AUTO_9372 ?AUTO_9373 ) ) ( not ( = ?AUTO_9372 ?AUTO_9379 ) ) ( not ( = ?AUTO_9373 ?AUTO_9379 ) ) ( CAN_TRAVERSE ?AUTO_9374 ?AUTO_9377 ?AUTO_9373 ) ( VISIBLE ?AUTO_9377 ?AUTO_9373 ) ( not ( = ?AUTO_9372 ?AUTO_9377 ) ) ( not ( = ?AUTO_9379 ?AUTO_9377 ) ) ( not ( = ?AUTO_9373 ?AUTO_9377 ) ) ( CAN_TRAVERSE ?AUTO_9374 ?AUTO_9372 ?AUTO_9377 ) ( VISIBLE ?AUTO_9372 ?AUTO_9377 ) ( AT_SOIL_SAMPLE ?AUTO_9372 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9374 ) ( STORE_OF ?AUTO_9378 ?AUTO_9374 ) ( CAN_TRAVERSE ?AUTO_9374 ?AUTO_9375 ?AUTO_9372 ) ( VISIBLE ?AUTO_9375 ?AUTO_9372 ) ( not ( = ?AUTO_9372 ?AUTO_9375 ) ) ( not ( = ?AUTO_9379 ?AUTO_9375 ) ) ( not ( = ?AUTO_9373 ?AUTO_9375 ) ) ( not ( = ?AUTO_9377 ?AUTO_9375 ) ) ( CAN_TRAVERSE ?AUTO_9374 ?AUTO_9373 ?AUTO_9375 ) ( AT ?AUTO_9374 ?AUTO_9373 ) ( VISIBLE ?AUTO_9373 ?AUTO_9375 ) ( AT_ROCK_SAMPLE ?AUTO_9373 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9374 ) ( EMPTY ?AUTO_9378 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_9374 ?AUTO_9378 ?AUTO_9373 )
      ( GET_SOIL_DATA ?AUTO_9372 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9372 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9471 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9472 - LANDER
      ?AUTO_9473 - WAYPOINT
      ?AUTO_9474 - ROVER
      ?AUTO_9478 - STORE
      ?AUTO_9477 - WAYPOINT
      ?AUTO_9476 - WAYPOINT
      ?AUTO_9475 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9472 ?AUTO_9471 ) ( VISIBLE ?AUTO_9473 ?AUTO_9471 ) ( AVAILABLE ?AUTO_9474 ) ( CHANNEL_FREE ?AUTO_9472 ) ( not ( = ?AUTO_9471 ?AUTO_9473 ) ) ( CAN_TRAVERSE ?AUTO_9474 ?AUTO_9471 ?AUTO_9473 ) ( VISIBLE ?AUTO_9471 ?AUTO_9473 ) ( AT_SOIL_SAMPLE ?AUTO_9471 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9474 ) ( STORE_OF ?AUTO_9478 ?AUTO_9474 ) ( CAN_TRAVERSE ?AUTO_9474 ?AUTO_9477 ?AUTO_9471 ) ( VISIBLE ?AUTO_9477 ?AUTO_9471 ) ( not ( = ?AUTO_9471 ?AUTO_9477 ) ) ( not ( = ?AUTO_9473 ?AUTO_9477 ) ) ( CAN_TRAVERSE ?AUTO_9474 ?AUTO_9476 ?AUTO_9477 ) ( VISIBLE ?AUTO_9476 ?AUTO_9477 ) ( not ( = ?AUTO_9471 ?AUTO_9476 ) ) ( not ( = ?AUTO_9473 ?AUTO_9476 ) ) ( not ( = ?AUTO_9477 ?AUTO_9476 ) ) ( CAN_TRAVERSE ?AUTO_9474 ?AUTO_9475 ?AUTO_9476 ) ( AT ?AUTO_9474 ?AUTO_9475 ) ( VISIBLE ?AUTO_9475 ?AUTO_9476 ) ( not ( = ?AUTO_9471 ?AUTO_9475 ) ) ( not ( = ?AUTO_9473 ?AUTO_9475 ) ) ( not ( = ?AUTO_9477 ?AUTO_9475 ) ) ( not ( = ?AUTO_9476 ?AUTO_9475 ) ) ( FULL ?AUTO_9478 ) )
    :subtasks
    ( ( !DROP ?AUTO_9474 ?AUTO_9478 )
      ( GET_SOIL_DATA ?AUTO_9471 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9471 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9480 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9487 - LANDER
      ?AUTO_9481 - WAYPOINT
      ?AUTO_9486 - ROVER
      ?AUTO_9482 - STORE
      ?AUTO_9485 - WAYPOINT
      ?AUTO_9484 - WAYPOINT
      ?AUTO_9483 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9487 ?AUTO_9480 ) ( VISIBLE ?AUTO_9481 ?AUTO_9480 ) ( AVAILABLE ?AUTO_9486 ) ( CHANNEL_FREE ?AUTO_9487 ) ( not ( = ?AUTO_9480 ?AUTO_9481 ) ) ( CAN_TRAVERSE ?AUTO_9486 ?AUTO_9480 ?AUTO_9481 ) ( VISIBLE ?AUTO_9480 ?AUTO_9481 ) ( AT_SOIL_SAMPLE ?AUTO_9480 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9486 ) ( STORE_OF ?AUTO_9482 ?AUTO_9486 ) ( EMPTY ?AUTO_9482 ) ( CAN_TRAVERSE ?AUTO_9486 ?AUTO_9485 ?AUTO_9480 ) ( VISIBLE ?AUTO_9485 ?AUTO_9480 ) ( not ( = ?AUTO_9480 ?AUTO_9485 ) ) ( not ( = ?AUTO_9481 ?AUTO_9485 ) ) ( CAN_TRAVERSE ?AUTO_9486 ?AUTO_9484 ?AUTO_9485 ) ( VISIBLE ?AUTO_9484 ?AUTO_9485 ) ( not ( = ?AUTO_9480 ?AUTO_9484 ) ) ( not ( = ?AUTO_9481 ?AUTO_9484 ) ) ( not ( = ?AUTO_9485 ?AUTO_9484 ) ) ( CAN_TRAVERSE ?AUTO_9486 ?AUTO_9483 ?AUTO_9484 ) ( VISIBLE ?AUTO_9483 ?AUTO_9484 ) ( not ( = ?AUTO_9480 ?AUTO_9483 ) ) ( not ( = ?AUTO_9481 ?AUTO_9483 ) ) ( not ( = ?AUTO_9485 ?AUTO_9483 ) ) ( not ( = ?AUTO_9484 ?AUTO_9483 ) ) ( CAN_TRAVERSE ?AUTO_9486 ?AUTO_9481 ?AUTO_9483 ) ( AT ?AUTO_9486 ?AUTO_9481 ) ( VISIBLE ?AUTO_9481 ?AUTO_9483 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9486 ?AUTO_9481 ?AUTO_9483 )
      ( GET_SOIL_DATA ?AUTO_9480 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9480 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9488 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9492 - LANDER
      ?AUTO_9489 - WAYPOINT
      ?AUTO_9493 - ROVER
      ?AUTO_9490 - STORE
      ?AUTO_9494 - WAYPOINT
      ?AUTO_9495 - WAYPOINT
      ?AUTO_9491 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9492 ?AUTO_9488 ) ( VISIBLE ?AUTO_9489 ?AUTO_9488 ) ( AVAILABLE ?AUTO_9493 ) ( CHANNEL_FREE ?AUTO_9492 ) ( not ( = ?AUTO_9488 ?AUTO_9489 ) ) ( CAN_TRAVERSE ?AUTO_9493 ?AUTO_9488 ?AUTO_9489 ) ( VISIBLE ?AUTO_9488 ?AUTO_9489 ) ( AT_SOIL_SAMPLE ?AUTO_9488 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9493 ) ( STORE_OF ?AUTO_9490 ?AUTO_9493 ) ( CAN_TRAVERSE ?AUTO_9493 ?AUTO_9494 ?AUTO_9488 ) ( VISIBLE ?AUTO_9494 ?AUTO_9488 ) ( not ( = ?AUTO_9488 ?AUTO_9494 ) ) ( not ( = ?AUTO_9489 ?AUTO_9494 ) ) ( CAN_TRAVERSE ?AUTO_9493 ?AUTO_9495 ?AUTO_9494 ) ( VISIBLE ?AUTO_9495 ?AUTO_9494 ) ( not ( = ?AUTO_9488 ?AUTO_9495 ) ) ( not ( = ?AUTO_9489 ?AUTO_9495 ) ) ( not ( = ?AUTO_9494 ?AUTO_9495 ) ) ( CAN_TRAVERSE ?AUTO_9493 ?AUTO_9491 ?AUTO_9495 ) ( VISIBLE ?AUTO_9491 ?AUTO_9495 ) ( not ( = ?AUTO_9488 ?AUTO_9491 ) ) ( not ( = ?AUTO_9489 ?AUTO_9491 ) ) ( not ( = ?AUTO_9494 ?AUTO_9491 ) ) ( not ( = ?AUTO_9495 ?AUTO_9491 ) ) ( CAN_TRAVERSE ?AUTO_9493 ?AUTO_9489 ?AUTO_9491 ) ( AT ?AUTO_9493 ?AUTO_9489 ) ( VISIBLE ?AUTO_9489 ?AUTO_9491 ) ( FULL ?AUTO_9490 ) )
    :subtasks
    ( ( !DROP ?AUTO_9493 ?AUTO_9490 )
      ( GET_SOIL_DATA ?AUTO_9488 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9488 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9536 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9538 - LANDER
      ?AUTO_9537 - WAYPOINT
      ?AUTO_9541 - WAYPOINT
      ?AUTO_9540 - ROVER
      ?AUTO_9539 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9538 ?AUTO_9537 ) ( VISIBLE ?AUTO_9541 ?AUTO_9537 ) ( AVAILABLE ?AUTO_9540 ) ( CHANNEL_FREE ?AUTO_9538 ) ( not ( = ?AUTO_9536 ?AUTO_9541 ) ) ( not ( = ?AUTO_9536 ?AUTO_9537 ) ) ( not ( = ?AUTO_9541 ?AUTO_9537 ) ) ( CAN_TRAVERSE ?AUTO_9540 ?AUTO_9536 ?AUTO_9541 ) ( VISIBLE ?AUTO_9536 ?AUTO_9541 ) ( AT_ROCK_SAMPLE ?AUTO_9536 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9540 ) ( STORE_OF ?AUTO_9539 ?AUTO_9540 ) ( CAN_TRAVERSE ?AUTO_9540 ?AUTO_9541 ?AUTO_9536 ) ( VISIBLE ?AUTO_9541 ?AUTO_9536 ) ( FULL ?AUTO_9539 ) ( CAN_TRAVERSE ?AUTO_9540 ?AUTO_9537 ?AUTO_9541 ) ( AT ?AUTO_9540 ?AUTO_9537 ) ( VISIBLE ?AUTO_9537 ?AUTO_9541 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9540 ?AUTO_9537 ?AUTO_9541 )
      ( GET_ROCK_DATA ?AUTO_9536 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9536 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9542 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9545 - LANDER
      ?AUTO_9544 - WAYPOINT
      ?AUTO_9547 - WAYPOINT
      ?AUTO_9543 - ROVER
      ?AUTO_9546 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9545 ?AUTO_9544 ) ( VISIBLE ?AUTO_9547 ?AUTO_9544 ) ( AVAILABLE ?AUTO_9543 ) ( CHANNEL_FREE ?AUTO_9545 ) ( not ( = ?AUTO_9542 ?AUTO_9547 ) ) ( not ( = ?AUTO_9542 ?AUTO_9544 ) ) ( not ( = ?AUTO_9547 ?AUTO_9544 ) ) ( CAN_TRAVERSE ?AUTO_9543 ?AUTO_9542 ?AUTO_9547 ) ( VISIBLE ?AUTO_9542 ?AUTO_9547 ) ( AT_ROCK_SAMPLE ?AUTO_9542 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9543 ) ( STORE_OF ?AUTO_9546 ?AUTO_9543 ) ( CAN_TRAVERSE ?AUTO_9543 ?AUTO_9547 ?AUTO_9542 ) ( VISIBLE ?AUTO_9547 ?AUTO_9542 ) ( CAN_TRAVERSE ?AUTO_9543 ?AUTO_9544 ?AUTO_9547 ) ( AT ?AUTO_9543 ?AUTO_9544 ) ( VISIBLE ?AUTO_9544 ?AUTO_9547 ) ( AT_SOIL_SAMPLE ?AUTO_9544 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9543 ) ( EMPTY ?AUTO_9546 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9543 ?AUTO_9546 ?AUTO_9544 )
      ( GET_ROCK_DATA ?AUTO_9542 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9542 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9630 - OBJECTIVE
      ?AUTO_9631 - MODE
    )
    :vars
    (
      ?AUTO_9638 - LANDER
      ?AUTO_9633 - WAYPOINT
      ?AUTO_9632 - WAYPOINT
      ?AUTO_9636 - ROVER
      ?AUTO_9637 - WAYPOINT
      ?AUTO_9635 - WAYPOINT
      ?AUTO_9634 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9638 ?AUTO_9633 ) ( VISIBLE ?AUTO_9632 ?AUTO_9633 ) ( AVAILABLE ?AUTO_9636 ) ( CHANNEL_FREE ?AUTO_9638 ) ( not ( = ?AUTO_9632 ?AUTO_9633 ) ) ( CAN_TRAVERSE ?AUTO_9636 ?AUTO_9637 ?AUTO_9632 ) ( VISIBLE ?AUTO_9637 ?AUTO_9632 ) ( not ( = ?AUTO_9633 ?AUTO_9637 ) ) ( not ( = ?AUTO_9632 ?AUTO_9637 ) ) ( CAN_TRAVERSE ?AUTO_9636 ?AUTO_9635 ?AUTO_9637 ) ( VISIBLE ?AUTO_9635 ?AUTO_9637 ) ( not ( = ?AUTO_9633 ?AUTO_9635 ) ) ( not ( = ?AUTO_9632 ?AUTO_9635 ) ) ( not ( = ?AUTO_9637 ?AUTO_9635 ) ) ( CALIBRATED ?AUTO_9634 ?AUTO_9636 ) ( ON_BOARD ?AUTO_9634 ?AUTO_9636 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9636 ) ( SUPPORTS ?AUTO_9634 ?AUTO_9631 ) ( VISIBLE_FROM ?AUTO_9630 ?AUTO_9635 ) ( CAN_TRAVERSE ?AUTO_9636 ?AUTO_9637 ?AUTO_9635 ) ( VISIBLE ?AUTO_9637 ?AUTO_9635 ) ( CAN_TRAVERSE ?AUTO_9636 ?AUTO_9632 ?AUTO_9637 ) ( AT ?AUTO_9636 ?AUTO_9632 ) ( VISIBLE ?AUTO_9632 ?AUTO_9637 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9636 ?AUTO_9632 ?AUTO_9637 )
      ( GET_IMAGE_DATA ?AUTO_9630 ?AUTO_9631 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9630 ?AUTO_9631 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9643 - OBJECTIVE
      ?AUTO_9644 - MODE
    )
    :vars
    (
      ?AUTO_9647 - LANDER
      ?AUTO_9651 - WAYPOINT
      ?AUTO_9650 - WAYPOINT
      ?AUTO_9649 - ROVER
      ?AUTO_9646 - WAYPOINT
      ?AUTO_9645 - WAYPOINT
      ?AUTO_9648 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9647 ?AUTO_9651 ) ( VISIBLE ?AUTO_9650 ?AUTO_9651 ) ( AVAILABLE ?AUTO_9649 ) ( CHANNEL_FREE ?AUTO_9647 ) ( not ( = ?AUTO_9650 ?AUTO_9651 ) ) ( CAN_TRAVERSE ?AUTO_9649 ?AUTO_9646 ?AUTO_9650 ) ( VISIBLE ?AUTO_9646 ?AUTO_9650 ) ( not ( = ?AUTO_9651 ?AUTO_9646 ) ) ( not ( = ?AUTO_9650 ?AUTO_9646 ) ) ( CAN_TRAVERSE ?AUTO_9649 ?AUTO_9645 ?AUTO_9646 ) ( VISIBLE ?AUTO_9645 ?AUTO_9646 ) ( not ( = ?AUTO_9651 ?AUTO_9645 ) ) ( not ( = ?AUTO_9650 ?AUTO_9645 ) ) ( not ( = ?AUTO_9646 ?AUTO_9645 ) ) ( CALIBRATED ?AUTO_9648 ?AUTO_9649 ) ( ON_BOARD ?AUTO_9648 ?AUTO_9649 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9649 ) ( SUPPORTS ?AUTO_9648 ?AUTO_9644 ) ( VISIBLE_FROM ?AUTO_9643 ?AUTO_9645 ) ( CAN_TRAVERSE ?AUTO_9649 ?AUTO_9646 ?AUTO_9645 ) ( VISIBLE ?AUTO_9646 ?AUTO_9645 ) ( CAN_TRAVERSE ?AUTO_9649 ?AUTO_9650 ?AUTO_9646 ) ( VISIBLE ?AUTO_9650 ?AUTO_9646 ) ( CAN_TRAVERSE ?AUTO_9649 ?AUTO_9651 ?AUTO_9650 ) ( AT ?AUTO_9649 ?AUTO_9651 ) ( VISIBLE ?AUTO_9651 ?AUTO_9650 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9649 ?AUTO_9651 ?AUTO_9650 )
      ( GET_IMAGE_DATA ?AUTO_9643 ?AUTO_9644 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9643 ?AUTO_9644 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9654 - OBJECTIVE
      ?AUTO_9655 - MODE
    )
    :vars
    (
      ?AUTO_9656 - LANDER
      ?AUTO_9660 - WAYPOINT
      ?AUTO_9661 - WAYPOINT
      ?AUTO_9657 - ROVER
      ?AUTO_9658 - WAYPOINT
      ?AUTO_9662 - WAYPOINT
      ?AUTO_9659 - CAMERA
      ?AUTO_9663 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9656 ?AUTO_9660 ) ( VISIBLE ?AUTO_9661 ?AUTO_9660 ) ( AVAILABLE ?AUTO_9657 ) ( CHANNEL_FREE ?AUTO_9656 ) ( not ( = ?AUTO_9661 ?AUTO_9660 ) ) ( CAN_TRAVERSE ?AUTO_9657 ?AUTO_9658 ?AUTO_9661 ) ( VISIBLE ?AUTO_9658 ?AUTO_9661 ) ( not ( = ?AUTO_9660 ?AUTO_9658 ) ) ( not ( = ?AUTO_9661 ?AUTO_9658 ) ) ( CAN_TRAVERSE ?AUTO_9657 ?AUTO_9662 ?AUTO_9658 ) ( VISIBLE ?AUTO_9662 ?AUTO_9658 ) ( not ( = ?AUTO_9660 ?AUTO_9662 ) ) ( not ( = ?AUTO_9661 ?AUTO_9662 ) ) ( not ( = ?AUTO_9658 ?AUTO_9662 ) ) ( ON_BOARD ?AUTO_9659 ?AUTO_9657 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9657 ) ( SUPPORTS ?AUTO_9659 ?AUTO_9655 ) ( VISIBLE_FROM ?AUTO_9654 ?AUTO_9662 ) ( CAN_TRAVERSE ?AUTO_9657 ?AUTO_9658 ?AUTO_9662 ) ( VISIBLE ?AUTO_9658 ?AUTO_9662 ) ( CAN_TRAVERSE ?AUTO_9657 ?AUTO_9661 ?AUTO_9658 ) ( VISIBLE ?AUTO_9661 ?AUTO_9658 ) ( CAN_TRAVERSE ?AUTO_9657 ?AUTO_9660 ?AUTO_9661 ) ( AT ?AUTO_9657 ?AUTO_9660 ) ( VISIBLE ?AUTO_9660 ?AUTO_9661 ) ( CALIBRATION_TARGET ?AUTO_9659 ?AUTO_9663 ) ( VISIBLE_FROM ?AUTO_9663 ?AUTO_9660 ) ( not ( = ?AUTO_9654 ?AUTO_9663 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9657 ?AUTO_9659 ?AUTO_9663 ?AUTO_9660 )
      ( GET_IMAGE_DATA ?AUTO_9654 ?AUTO_9655 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9654 ?AUTO_9655 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9664 - OBJECTIVE
      ?AUTO_9665 - MODE
    )
    :vars
    (
      ?AUTO_9667 - LANDER
      ?AUTO_9673 - WAYPOINT
      ?AUTO_9669 - WAYPOINT
      ?AUTO_9666 - ROVER
      ?AUTO_9671 - WAYPOINT
      ?AUTO_9668 - WAYPOINT
      ?AUTO_9670 - CAMERA
      ?AUTO_9672 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9667 ?AUTO_9673 ) ( VISIBLE ?AUTO_9669 ?AUTO_9673 ) ( AVAILABLE ?AUTO_9666 ) ( CHANNEL_FREE ?AUTO_9667 ) ( not ( = ?AUTO_9669 ?AUTO_9673 ) ) ( CAN_TRAVERSE ?AUTO_9666 ?AUTO_9671 ?AUTO_9669 ) ( VISIBLE ?AUTO_9671 ?AUTO_9669 ) ( not ( = ?AUTO_9673 ?AUTO_9671 ) ) ( not ( = ?AUTO_9669 ?AUTO_9671 ) ) ( CAN_TRAVERSE ?AUTO_9666 ?AUTO_9668 ?AUTO_9671 ) ( VISIBLE ?AUTO_9668 ?AUTO_9671 ) ( not ( = ?AUTO_9673 ?AUTO_9668 ) ) ( not ( = ?AUTO_9669 ?AUTO_9668 ) ) ( not ( = ?AUTO_9671 ?AUTO_9668 ) ) ( ON_BOARD ?AUTO_9670 ?AUTO_9666 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9666 ) ( SUPPORTS ?AUTO_9670 ?AUTO_9665 ) ( VISIBLE_FROM ?AUTO_9664 ?AUTO_9668 ) ( CAN_TRAVERSE ?AUTO_9666 ?AUTO_9671 ?AUTO_9668 ) ( VISIBLE ?AUTO_9671 ?AUTO_9668 ) ( CAN_TRAVERSE ?AUTO_9666 ?AUTO_9669 ?AUTO_9671 ) ( VISIBLE ?AUTO_9669 ?AUTO_9671 ) ( CAN_TRAVERSE ?AUTO_9666 ?AUTO_9673 ?AUTO_9669 ) ( VISIBLE ?AUTO_9673 ?AUTO_9669 ) ( CALIBRATION_TARGET ?AUTO_9670 ?AUTO_9672 ) ( VISIBLE_FROM ?AUTO_9672 ?AUTO_9673 ) ( not ( = ?AUTO_9664 ?AUTO_9672 ) ) ( CAN_TRAVERSE ?AUTO_9666 ?AUTO_9669 ?AUTO_9673 ) ( AT ?AUTO_9666 ?AUTO_9669 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9666 ?AUTO_9669 ?AUTO_9673 )
      ( GET_IMAGE_DATA ?AUTO_9664 ?AUTO_9665 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9664 ?AUTO_9665 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9676 - OBJECTIVE
      ?AUTO_9677 - MODE
    )
    :vars
    (
      ?AUTO_9685 - LANDER
      ?AUTO_9680 - WAYPOINT
      ?AUTO_9683 - WAYPOINT
      ?AUTO_9682 - ROVER
      ?AUTO_9681 - WAYPOINT
      ?AUTO_9679 - WAYPOINT
      ?AUTO_9678 - CAMERA
      ?AUTO_9684 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9685 ?AUTO_9680 ) ( VISIBLE ?AUTO_9683 ?AUTO_9680 ) ( AVAILABLE ?AUTO_9682 ) ( CHANNEL_FREE ?AUTO_9685 ) ( not ( = ?AUTO_9683 ?AUTO_9680 ) ) ( CAN_TRAVERSE ?AUTO_9682 ?AUTO_9681 ?AUTO_9683 ) ( VISIBLE ?AUTO_9681 ?AUTO_9683 ) ( not ( = ?AUTO_9680 ?AUTO_9681 ) ) ( not ( = ?AUTO_9683 ?AUTO_9681 ) ) ( CAN_TRAVERSE ?AUTO_9682 ?AUTO_9679 ?AUTO_9681 ) ( VISIBLE ?AUTO_9679 ?AUTO_9681 ) ( not ( = ?AUTO_9680 ?AUTO_9679 ) ) ( not ( = ?AUTO_9683 ?AUTO_9679 ) ) ( not ( = ?AUTO_9681 ?AUTO_9679 ) ) ( ON_BOARD ?AUTO_9678 ?AUTO_9682 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9682 ) ( SUPPORTS ?AUTO_9678 ?AUTO_9677 ) ( VISIBLE_FROM ?AUTO_9676 ?AUTO_9679 ) ( CAN_TRAVERSE ?AUTO_9682 ?AUTO_9681 ?AUTO_9679 ) ( VISIBLE ?AUTO_9681 ?AUTO_9679 ) ( CAN_TRAVERSE ?AUTO_9682 ?AUTO_9683 ?AUTO_9681 ) ( VISIBLE ?AUTO_9683 ?AUTO_9681 ) ( CAN_TRAVERSE ?AUTO_9682 ?AUTO_9680 ?AUTO_9683 ) ( VISIBLE ?AUTO_9680 ?AUTO_9683 ) ( CALIBRATION_TARGET ?AUTO_9678 ?AUTO_9684 ) ( VISIBLE_FROM ?AUTO_9684 ?AUTO_9680 ) ( not ( = ?AUTO_9676 ?AUTO_9684 ) ) ( CAN_TRAVERSE ?AUTO_9682 ?AUTO_9683 ?AUTO_9680 ) ( AT ?AUTO_9682 ?AUTO_9681 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9682 ?AUTO_9681 ?AUTO_9683 )
      ( GET_IMAGE_DATA ?AUTO_9676 ?AUTO_9677 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9676 ?AUTO_9677 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9686 - OBJECTIVE
      ?AUTO_9687 - MODE
    )
    :vars
    (
      ?AUTO_9693 - LANDER
      ?AUTO_9694 - WAYPOINT
      ?AUTO_9695 - WAYPOINT
      ?AUTO_9692 - ROVER
      ?AUTO_9691 - WAYPOINT
      ?AUTO_9690 - WAYPOINT
      ?AUTO_9689 - CAMERA
      ?AUTO_9688 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9693 ?AUTO_9694 ) ( VISIBLE ?AUTO_9695 ?AUTO_9694 ) ( AVAILABLE ?AUTO_9692 ) ( CHANNEL_FREE ?AUTO_9693 ) ( not ( = ?AUTO_9695 ?AUTO_9694 ) ) ( CAN_TRAVERSE ?AUTO_9692 ?AUTO_9691 ?AUTO_9695 ) ( VISIBLE ?AUTO_9691 ?AUTO_9695 ) ( not ( = ?AUTO_9694 ?AUTO_9691 ) ) ( not ( = ?AUTO_9695 ?AUTO_9691 ) ) ( CAN_TRAVERSE ?AUTO_9692 ?AUTO_9690 ?AUTO_9691 ) ( VISIBLE ?AUTO_9690 ?AUTO_9691 ) ( not ( = ?AUTO_9694 ?AUTO_9690 ) ) ( not ( = ?AUTO_9695 ?AUTO_9690 ) ) ( not ( = ?AUTO_9691 ?AUTO_9690 ) ) ( ON_BOARD ?AUTO_9689 ?AUTO_9692 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9692 ) ( SUPPORTS ?AUTO_9689 ?AUTO_9687 ) ( VISIBLE_FROM ?AUTO_9686 ?AUTO_9690 ) ( CAN_TRAVERSE ?AUTO_9692 ?AUTO_9691 ?AUTO_9690 ) ( VISIBLE ?AUTO_9691 ?AUTO_9690 ) ( CAN_TRAVERSE ?AUTO_9692 ?AUTO_9695 ?AUTO_9691 ) ( VISIBLE ?AUTO_9695 ?AUTO_9691 ) ( CAN_TRAVERSE ?AUTO_9692 ?AUTO_9694 ?AUTO_9695 ) ( VISIBLE ?AUTO_9694 ?AUTO_9695 ) ( CALIBRATION_TARGET ?AUTO_9689 ?AUTO_9688 ) ( VISIBLE_FROM ?AUTO_9688 ?AUTO_9694 ) ( not ( = ?AUTO_9686 ?AUTO_9688 ) ) ( CAN_TRAVERSE ?AUTO_9692 ?AUTO_9695 ?AUTO_9694 ) ( AT ?AUTO_9692 ?AUTO_9690 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9692 ?AUTO_9690 ?AUTO_9691 )
      ( GET_IMAGE_DATA ?AUTO_9686 ?AUTO_9687 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9686 ?AUTO_9687 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9700 - OBJECTIVE
      ?AUTO_9701 - MODE
    )
    :vars
    (
      ?AUTO_9703 - LANDER
      ?AUTO_9705 - WAYPOINT
      ?AUTO_9707 - WAYPOINT
      ?AUTO_9706 - ROVER
      ?AUTO_9709 - WAYPOINT
      ?AUTO_9702 - WAYPOINT
      ?AUTO_9704 - CAMERA
      ?AUTO_9708 - OBJECTIVE
      ?AUTO_9710 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9703 ?AUTO_9705 ) ( VISIBLE ?AUTO_9707 ?AUTO_9705 ) ( AVAILABLE ?AUTO_9706 ) ( CHANNEL_FREE ?AUTO_9703 ) ( not ( = ?AUTO_9707 ?AUTO_9705 ) ) ( CAN_TRAVERSE ?AUTO_9706 ?AUTO_9709 ?AUTO_9707 ) ( VISIBLE ?AUTO_9709 ?AUTO_9707 ) ( not ( = ?AUTO_9705 ?AUTO_9709 ) ) ( not ( = ?AUTO_9707 ?AUTO_9709 ) ) ( CAN_TRAVERSE ?AUTO_9706 ?AUTO_9702 ?AUTO_9709 ) ( VISIBLE ?AUTO_9702 ?AUTO_9709 ) ( not ( = ?AUTO_9705 ?AUTO_9702 ) ) ( not ( = ?AUTO_9707 ?AUTO_9702 ) ) ( not ( = ?AUTO_9709 ?AUTO_9702 ) ) ( ON_BOARD ?AUTO_9704 ?AUTO_9706 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9706 ) ( SUPPORTS ?AUTO_9704 ?AUTO_9701 ) ( VISIBLE_FROM ?AUTO_9700 ?AUTO_9702 ) ( CAN_TRAVERSE ?AUTO_9706 ?AUTO_9709 ?AUTO_9702 ) ( VISIBLE ?AUTO_9709 ?AUTO_9702 ) ( CAN_TRAVERSE ?AUTO_9706 ?AUTO_9707 ?AUTO_9709 ) ( VISIBLE ?AUTO_9707 ?AUTO_9709 ) ( CAN_TRAVERSE ?AUTO_9706 ?AUTO_9705 ?AUTO_9707 ) ( VISIBLE ?AUTO_9705 ?AUTO_9707 ) ( CALIBRATION_TARGET ?AUTO_9704 ?AUTO_9708 ) ( VISIBLE_FROM ?AUTO_9708 ?AUTO_9705 ) ( not ( = ?AUTO_9700 ?AUTO_9708 ) ) ( CAN_TRAVERSE ?AUTO_9706 ?AUTO_9707 ?AUTO_9705 ) ( CAN_TRAVERSE ?AUTO_9706 ?AUTO_9710 ?AUTO_9702 ) ( AT ?AUTO_9706 ?AUTO_9710 ) ( VISIBLE ?AUTO_9710 ?AUTO_9702 ) ( not ( = ?AUTO_9705 ?AUTO_9710 ) ) ( not ( = ?AUTO_9707 ?AUTO_9710 ) ) ( not ( = ?AUTO_9709 ?AUTO_9710 ) ) ( not ( = ?AUTO_9702 ?AUTO_9710 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9706 ?AUTO_9710 ?AUTO_9702 )
      ( GET_IMAGE_DATA ?AUTO_9700 ?AUTO_9701 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9700 ?AUTO_9701 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9781 - OBJECTIVE
      ?AUTO_9782 - MODE
    )
    :vars
    (
      ?AUTO_9785 - LANDER
      ?AUTO_9784 - WAYPOINT
      ?AUTO_9787 - WAYPOINT
      ?AUTO_9788 - ROVER
      ?AUTO_9783 - WAYPOINT
      ?AUTO_9786 - CAMERA
      ?AUTO_9789 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9785 ?AUTO_9784 ) ( VISIBLE ?AUTO_9787 ?AUTO_9784 ) ( AVAILABLE ?AUTO_9788 ) ( CHANNEL_FREE ?AUTO_9785 ) ( not ( = ?AUTO_9787 ?AUTO_9784 ) ) ( CAN_TRAVERSE ?AUTO_9788 ?AUTO_9783 ?AUTO_9787 ) ( VISIBLE ?AUTO_9783 ?AUTO_9787 ) ( not ( = ?AUTO_9784 ?AUTO_9783 ) ) ( not ( = ?AUTO_9787 ?AUTO_9783 ) ) ( ON_BOARD ?AUTO_9786 ?AUTO_9788 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9788 ) ( SUPPORTS ?AUTO_9786 ?AUTO_9782 ) ( VISIBLE_FROM ?AUTO_9781 ?AUTO_9783 ) ( CAN_TRAVERSE ?AUTO_9788 ?AUTO_9787 ?AUTO_9783 ) ( AT ?AUTO_9788 ?AUTO_9787 ) ( VISIBLE ?AUTO_9787 ?AUTO_9783 ) ( CALIBRATION_TARGET ?AUTO_9786 ?AUTO_9789 ) ( VISIBLE_FROM ?AUTO_9789 ?AUTO_9787 ) ( not ( = ?AUTO_9781 ?AUTO_9789 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9788 ?AUTO_9786 ?AUTO_9789 ?AUTO_9787 )
      ( GET_IMAGE_DATA ?AUTO_9781 ?AUTO_9782 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9781 ?AUTO_9782 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9790 - OBJECTIVE
      ?AUTO_9791 - MODE
    )
    :vars
    (
      ?AUTO_9794 - LANDER
      ?AUTO_9798 - WAYPOINT
      ?AUTO_9793 - WAYPOINT
      ?AUTO_9792 - ROVER
      ?AUTO_9795 - WAYPOINT
      ?AUTO_9796 - CAMERA
      ?AUTO_9797 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9794 ?AUTO_9798 ) ( VISIBLE ?AUTO_9793 ?AUTO_9798 ) ( AVAILABLE ?AUTO_9792 ) ( CHANNEL_FREE ?AUTO_9794 ) ( not ( = ?AUTO_9793 ?AUTO_9798 ) ) ( CAN_TRAVERSE ?AUTO_9792 ?AUTO_9795 ?AUTO_9793 ) ( VISIBLE ?AUTO_9795 ?AUTO_9793 ) ( not ( = ?AUTO_9798 ?AUTO_9795 ) ) ( not ( = ?AUTO_9793 ?AUTO_9795 ) ) ( ON_BOARD ?AUTO_9796 ?AUTO_9792 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9792 ) ( SUPPORTS ?AUTO_9796 ?AUTO_9791 ) ( VISIBLE_FROM ?AUTO_9790 ?AUTO_9795 ) ( CAN_TRAVERSE ?AUTO_9792 ?AUTO_9793 ?AUTO_9795 ) ( VISIBLE ?AUTO_9793 ?AUTO_9795 ) ( CALIBRATION_TARGET ?AUTO_9796 ?AUTO_9797 ) ( VISIBLE_FROM ?AUTO_9797 ?AUTO_9793 ) ( not ( = ?AUTO_9790 ?AUTO_9797 ) ) ( AT ?AUTO_9792 ?AUTO_9795 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9792 ?AUTO_9795 ?AUTO_9793 )
      ( GET_IMAGE_DATA ?AUTO_9790 ?AUTO_9791 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9790 ?AUTO_9791 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9801 - OBJECTIVE
      ?AUTO_9802 - MODE
    )
    :vars
    (
      ?AUTO_9809 - LANDER
      ?AUTO_9806 - WAYPOINT
      ?AUTO_9808 - WAYPOINT
      ?AUTO_9807 - ROVER
      ?AUTO_9803 - WAYPOINT
      ?AUTO_9805 - CAMERA
      ?AUTO_9804 - OBJECTIVE
      ?AUTO_9810 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9809 ?AUTO_9806 ) ( VISIBLE ?AUTO_9808 ?AUTO_9806 ) ( AVAILABLE ?AUTO_9807 ) ( CHANNEL_FREE ?AUTO_9809 ) ( not ( = ?AUTO_9808 ?AUTO_9806 ) ) ( CAN_TRAVERSE ?AUTO_9807 ?AUTO_9803 ?AUTO_9808 ) ( VISIBLE ?AUTO_9803 ?AUTO_9808 ) ( not ( = ?AUTO_9806 ?AUTO_9803 ) ) ( not ( = ?AUTO_9808 ?AUTO_9803 ) ) ( ON_BOARD ?AUTO_9805 ?AUTO_9807 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9807 ) ( SUPPORTS ?AUTO_9805 ?AUTO_9802 ) ( VISIBLE_FROM ?AUTO_9801 ?AUTO_9803 ) ( CAN_TRAVERSE ?AUTO_9807 ?AUTO_9808 ?AUTO_9803 ) ( VISIBLE ?AUTO_9808 ?AUTO_9803 ) ( CALIBRATION_TARGET ?AUTO_9805 ?AUTO_9804 ) ( VISIBLE_FROM ?AUTO_9804 ?AUTO_9808 ) ( not ( = ?AUTO_9801 ?AUTO_9804 ) ) ( CAN_TRAVERSE ?AUTO_9807 ?AUTO_9810 ?AUTO_9803 ) ( AT ?AUTO_9807 ?AUTO_9810 ) ( VISIBLE ?AUTO_9810 ?AUTO_9803 ) ( not ( = ?AUTO_9806 ?AUTO_9810 ) ) ( not ( = ?AUTO_9808 ?AUTO_9810 ) ) ( not ( = ?AUTO_9803 ?AUTO_9810 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9807 ?AUTO_9810 ?AUTO_9803 )
      ( GET_IMAGE_DATA ?AUTO_9801 ?AUTO_9802 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9801 ?AUTO_9802 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9815 - OBJECTIVE
      ?AUTO_9816 - MODE
    )
    :vars
    (
      ?AUTO_9822 - LANDER
      ?AUTO_9824 - WAYPOINT
      ?AUTO_9821 - WAYPOINT
      ?AUTO_9818 - ROVER
      ?AUTO_9820 - WAYPOINT
      ?AUTO_9823 - CAMERA
      ?AUTO_9817 - OBJECTIVE
      ?AUTO_9819 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9822 ?AUTO_9824 ) ( VISIBLE ?AUTO_9821 ?AUTO_9824 ) ( AVAILABLE ?AUTO_9818 ) ( CHANNEL_FREE ?AUTO_9822 ) ( not ( = ?AUTO_9821 ?AUTO_9824 ) ) ( CAN_TRAVERSE ?AUTO_9818 ?AUTO_9820 ?AUTO_9821 ) ( VISIBLE ?AUTO_9820 ?AUTO_9821 ) ( not ( = ?AUTO_9824 ?AUTO_9820 ) ) ( not ( = ?AUTO_9821 ?AUTO_9820 ) ) ( ON_BOARD ?AUTO_9823 ?AUTO_9818 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9818 ) ( SUPPORTS ?AUTO_9823 ?AUTO_9816 ) ( VISIBLE_FROM ?AUTO_9815 ?AUTO_9820 ) ( CAN_TRAVERSE ?AUTO_9818 ?AUTO_9821 ?AUTO_9820 ) ( VISIBLE ?AUTO_9821 ?AUTO_9820 ) ( CALIBRATION_TARGET ?AUTO_9823 ?AUTO_9817 ) ( VISIBLE_FROM ?AUTO_9817 ?AUTO_9821 ) ( not ( = ?AUTO_9815 ?AUTO_9817 ) ) ( CAN_TRAVERSE ?AUTO_9818 ?AUTO_9819 ?AUTO_9820 ) ( VISIBLE ?AUTO_9819 ?AUTO_9820 ) ( not ( = ?AUTO_9824 ?AUTO_9819 ) ) ( not ( = ?AUTO_9821 ?AUTO_9819 ) ) ( not ( = ?AUTO_9820 ?AUTO_9819 ) ) ( CAN_TRAVERSE ?AUTO_9818 ?AUTO_9824 ?AUTO_9819 ) ( AT ?AUTO_9818 ?AUTO_9824 ) ( VISIBLE ?AUTO_9824 ?AUTO_9819 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9818 ?AUTO_9824 ?AUTO_9819 )
      ( GET_IMAGE_DATA ?AUTO_9815 ?AUTO_9816 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9815 ?AUTO_9816 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9978 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9979 - LANDER
      ?AUTO_9981 - WAYPOINT
      ?AUTO_9983 - WAYPOINT
      ?AUTO_9982 - ROVER
      ?AUTO_9980 - STORE
      ?AUTO_9984 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9979 ?AUTO_9981 ) ( VISIBLE ?AUTO_9983 ?AUTO_9981 ) ( AVAILABLE ?AUTO_9982 ) ( CHANNEL_FREE ?AUTO_9979 ) ( not ( = ?AUTO_9978 ?AUTO_9983 ) ) ( not ( = ?AUTO_9978 ?AUTO_9981 ) ) ( not ( = ?AUTO_9983 ?AUTO_9981 ) ) ( CAN_TRAVERSE ?AUTO_9982 ?AUTO_9978 ?AUTO_9983 ) ( VISIBLE ?AUTO_9978 ?AUTO_9983 ) ( AT_ROCK_SAMPLE ?AUTO_9978 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9982 ) ( STORE_OF ?AUTO_9980 ?AUTO_9982 ) ( CAN_TRAVERSE ?AUTO_9982 ?AUTO_9983 ?AUTO_9978 ) ( VISIBLE ?AUTO_9983 ?AUTO_9978 ) ( CAN_TRAVERSE ?AUTO_9982 ?AUTO_9981 ?AUTO_9983 ) ( VISIBLE ?AUTO_9981 ?AUTO_9983 ) ( CAN_TRAVERSE ?AUTO_9982 ?AUTO_9984 ?AUTO_9981 ) ( AT ?AUTO_9982 ?AUTO_9984 ) ( VISIBLE ?AUTO_9984 ?AUTO_9981 ) ( not ( = ?AUTO_9978 ?AUTO_9984 ) ) ( not ( = ?AUTO_9981 ?AUTO_9984 ) ) ( not ( = ?AUTO_9983 ?AUTO_9984 ) ) ( FULL ?AUTO_9980 ) )
    :subtasks
    ( ( !DROP ?AUTO_9982 ?AUTO_9980 )
      ( GET_ROCK_DATA ?AUTO_9978 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9978 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10033 - OBJECTIVE
      ?AUTO_10034 - MODE
    )
    :vars
    (
      ?AUTO_10038 - LANDER
      ?AUTO_10041 - WAYPOINT
      ?AUTO_10035 - WAYPOINT
      ?AUTO_10037 - ROVER
      ?AUTO_10036 - WAYPOINT
      ?AUTO_10039 - CAMERA
      ?AUTO_10040 - WAYPOINT
      ?AUTO_10042 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10038 ?AUTO_10041 ) ( VISIBLE ?AUTO_10035 ?AUTO_10041 ) ( AVAILABLE ?AUTO_10037 ) ( CHANNEL_FREE ?AUTO_10038 ) ( not ( = ?AUTO_10035 ?AUTO_10041 ) ) ( CAN_TRAVERSE ?AUTO_10037 ?AUTO_10036 ?AUTO_10035 ) ( VISIBLE ?AUTO_10036 ?AUTO_10035 ) ( not ( = ?AUTO_10041 ?AUTO_10036 ) ) ( not ( = ?AUTO_10035 ?AUTO_10036 ) ) ( ON_BOARD ?AUTO_10039 ?AUTO_10037 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10037 ) ( SUPPORTS ?AUTO_10039 ?AUTO_10034 ) ( VISIBLE_FROM ?AUTO_10033 ?AUTO_10036 ) ( CALIBRATION_TARGET ?AUTO_10039 ?AUTO_10033 ) ( CAN_TRAVERSE ?AUTO_10037 ?AUTO_10035 ?AUTO_10036 ) ( VISIBLE ?AUTO_10035 ?AUTO_10036 ) ( CAN_TRAVERSE ?AUTO_10037 ?AUTO_10040 ?AUTO_10035 ) ( VISIBLE ?AUTO_10040 ?AUTO_10035 ) ( not ( = ?AUTO_10041 ?AUTO_10040 ) ) ( not ( = ?AUTO_10035 ?AUTO_10040 ) ) ( not ( = ?AUTO_10036 ?AUTO_10040 ) ) ( CAN_TRAVERSE ?AUTO_10037 ?AUTO_10042 ?AUTO_10040 ) ( AT ?AUTO_10037 ?AUTO_10042 ) ( VISIBLE ?AUTO_10042 ?AUTO_10040 ) ( not ( = ?AUTO_10041 ?AUTO_10042 ) ) ( not ( = ?AUTO_10035 ?AUTO_10042 ) ) ( not ( = ?AUTO_10036 ?AUTO_10042 ) ) ( not ( = ?AUTO_10040 ?AUTO_10042 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10037 ?AUTO_10042 ?AUTO_10040 )
      ( GET_IMAGE_DATA ?AUTO_10033 ?AUTO_10034 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10033 ?AUTO_10034 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10118 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10119 - LANDER
      ?AUTO_10121 - WAYPOINT
      ?AUTO_10124 - WAYPOINT
      ?AUTO_10122 - ROVER
      ?AUTO_10120 - STORE
      ?AUTO_10123 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10119 ?AUTO_10121 ) ( VISIBLE ?AUTO_10124 ?AUTO_10121 ) ( AVAILABLE ?AUTO_10122 ) ( CHANNEL_FREE ?AUTO_10119 ) ( not ( = ?AUTO_10118 ?AUTO_10124 ) ) ( not ( = ?AUTO_10118 ?AUTO_10121 ) ) ( not ( = ?AUTO_10124 ?AUTO_10121 ) ) ( CAN_TRAVERSE ?AUTO_10122 ?AUTO_10118 ?AUTO_10124 ) ( VISIBLE ?AUTO_10118 ?AUTO_10124 ) ( AT_SOIL_SAMPLE ?AUTO_10118 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10122 ) ( STORE_OF ?AUTO_10120 ?AUTO_10122 ) ( CAN_TRAVERSE ?AUTO_10122 ?AUTO_10124 ?AUTO_10118 ) ( VISIBLE ?AUTO_10124 ?AUTO_10118 ) ( CAN_TRAVERSE ?AUTO_10122 ?AUTO_10123 ?AUTO_10124 ) ( VISIBLE ?AUTO_10123 ?AUTO_10124 ) ( not ( = ?AUTO_10118 ?AUTO_10123 ) ) ( not ( = ?AUTO_10121 ?AUTO_10123 ) ) ( not ( = ?AUTO_10124 ?AUTO_10123 ) ) ( AT_SOIL_SAMPLE ?AUTO_10123 ) ( EMPTY ?AUTO_10120 ) ( CAN_TRAVERSE ?AUTO_10122 ?AUTO_10121 ?AUTO_10123 ) ( AT ?AUTO_10122 ?AUTO_10121 ) ( VISIBLE ?AUTO_10121 ?AUTO_10123 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10122 ?AUTO_10121 ?AUTO_10123 )
      ( GET_SOIL_DATA ?AUTO_10118 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10118 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10167 - OBJECTIVE
      ?AUTO_10168 - MODE
    )
    :vars
    (
      ?AUTO_10171 - LANDER
      ?AUTO_10169 - WAYPOINT
      ?AUTO_10170 - WAYPOINT
      ?AUTO_10173 - ROVER
      ?AUTO_10172 - CAMERA
      ?AUTO_10174 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10171 ?AUTO_10169 ) ( VISIBLE ?AUTO_10170 ?AUTO_10169 ) ( AVAILABLE ?AUTO_10173 ) ( CHANNEL_FREE ?AUTO_10171 ) ( not ( = ?AUTO_10170 ?AUTO_10169 ) ) ( CAN_TRAVERSE ?AUTO_10173 ?AUTO_10169 ?AUTO_10170 ) ( VISIBLE ?AUTO_10169 ?AUTO_10170 ) ( CALIBRATED ?AUTO_10172 ?AUTO_10173 ) ( ON_BOARD ?AUTO_10172 ?AUTO_10173 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10173 ) ( SUPPORTS ?AUTO_10172 ?AUTO_10168 ) ( VISIBLE_FROM ?AUTO_10167 ?AUTO_10169 ) ( CAN_TRAVERSE ?AUTO_10173 ?AUTO_10170 ?AUTO_10169 ) ( CAN_TRAVERSE ?AUTO_10173 ?AUTO_10174 ?AUTO_10170 ) ( AT ?AUTO_10173 ?AUTO_10174 ) ( VISIBLE ?AUTO_10174 ?AUTO_10170 ) ( not ( = ?AUTO_10169 ?AUTO_10174 ) ) ( not ( = ?AUTO_10170 ?AUTO_10174 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10173 ?AUTO_10174 ?AUTO_10170 )
      ( GET_IMAGE_DATA ?AUTO_10167 ?AUTO_10168 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10167 ?AUTO_10168 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10175 - OBJECTIVE
      ?AUTO_10176 - MODE
    )
    :vars
    (
      ?AUTO_10177 - LANDER
      ?AUTO_10182 - WAYPOINT
      ?AUTO_10178 - WAYPOINT
      ?AUTO_10179 - ROVER
      ?AUTO_10181 - CAMERA
      ?AUTO_10180 - WAYPOINT
      ?AUTO_10183 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10177 ?AUTO_10182 ) ( VISIBLE ?AUTO_10178 ?AUTO_10182 ) ( AVAILABLE ?AUTO_10179 ) ( CHANNEL_FREE ?AUTO_10177 ) ( not ( = ?AUTO_10178 ?AUTO_10182 ) ) ( CAN_TRAVERSE ?AUTO_10179 ?AUTO_10182 ?AUTO_10178 ) ( VISIBLE ?AUTO_10182 ?AUTO_10178 ) ( ON_BOARD ?AUTO_10181 ?AUTO_10179 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10179 ) ( SUPPORTS ?AUTO_10181 ?AUTO_10176 ) ( VISIBLE_FROM ?AUTO_10175 ?AUTO_10182 ) ( CAN_TRAVERSE ?AUTO_10179 ?AUTO_10178 ?AUTO_10182 ) ( CAN_TRAVERSE ?AUTO_10179 ?AUTO_10180 ?AUTO_10178 ) ( AT ?AUTO_10179 ?AUTO_10180 ) ( VISIBLE ?AUTO_10180 ?AUTO_10178 ) ( not ( = ?AUTO_10182 ?AUTO_10180 ) ) ( not ( = ?AUTO_10178 ?AUTO_10180 ) ) ( CALIBRATION_TARGET ?AUTO_10181 ?AUTO_10183 ) ( VISIBLE_FROM ?AUTO_10183 ?AUTO_10180 ) ( not ( = ?AUTO_10175 ?AUTO_10183 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10179 ?AUTO_10181 ?AUTO_10183 ?AUTO_10180 )
      ( GET_IMAGE_DATA ?AUTO_10175 ?AUTO_10176 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10175 ?AUTO_10176 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10184 - OBJECTIVE
      ?AUTO_10185 - MODE
    )
    :vars
    (
      ?AUTO_10186 - LANDER
      ?AUTO_10190 - WAYPOINT
      ?AUTO_10189 - WAYPOINT
      ?AUTO_10187 - ROVER
      ?AUTO_10191 - CAMERA
      ?AUTO_10192 - WAYPOINT
      ?AUTO_10188 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10186 ?AUTO_10190 ) ( VISIBLE ?AUTO_10189 ?AUTO_10190 ) ( AVAILABLE ?AUTO_10187 ) ( CHANNEL_FREE ?AUTO_10186 ) ( not ( = ?AUTO_10189 ?AUTO_10190 ) ) ( CAN_TRAVERSE ?AUTO_10187 ?AUTO_10190 ?AUTO_10189 ) ( VISIBLE ?AUTO_10190 ?AUTO_10189 ) ( ON_BOARD ?AUTO_10191 ?AUTO_10187 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10187 ) ( SUPPORTS ?AUTO_10191 ?AUTO_10185 ) ( VISIBLE_FROM ?AUTO_10184 ?AUTO_10190 ) ( CAN_TRAVERSE ?AUTO_10187 ?AUTO_10189 ?AUTO_10190 ) ( CAN_TRAVERSE ?AUTO_10187 ?AUTO_10192 ?AUTO_10189 ) ( VISIBLE ?AUTO_10192 ?AUTO_10189 ) ( not ( = ?AUTO_10190 ?AUTO_10192 ) ) ( not ( = ?AUTO_10189 ?AUTO_10192 ) ) ( CALIBRATION_TARGET ?AUTO_10191 ?AUTO_10188 ) ( VISIBLE_FROM ?AUTO_10188 ?AUTO_10192 ) ( not ( = ?AUTO_10184 ?AUTO_10188 ) ) ( CAN_TRAVERSE ?AUTO_10187 ?AUTO_10189 ?AUTO_10192 ) ( AT ?AUTO_10187 ?AUTO_10189 ) ( VISIBLE ?AUTO_10189 ?AUTO_10192 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10187 ?AUTO_10189 ?AUTO_10192 )
      ( GET_IMAGE_DATA ?AUTO_10184 ?AUTO_10185 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10184 ?AUTO_10185 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10242 - OBJECTIVE
      ?AUTO_10243 - MODE
    )
    :vars
    (
      ?AUTO_10247 - LANDER
      ?AUTO_10248 - WAYPOINT
      ?AUTO_10245 - WAYPOINT
      ?AUTO_10246 - ROVER
      ?AUTO_10250 - CAMERA
      ?AUTO_10244 - WAYPOINT
      ?AUTO_10249 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10247 ?AUTO_10248 ) ( VISIBLE ?AUTO_10245 ?AUTO_10248 ) ( AVAILABLE ?AUTO_10246 ) ( CHANNEL_FREE ?AUTO_10247 ) ( not ( = ?AUTO_10245 ?AUTO_10248 ) ) ( ON_BOARD ?AUTO_10250 ?AUTO_10246 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10246 ) ( SUPPORTS ?AUTO_10250 ?AUTO_10243 ) ( VISIBLE_FROM ?AUTO_10242 ?AUTO_10245 ) ( CAN_TRAVERSE ?AUTO_10246 ?AUTO_10244 ?AUTO_10245 ) ( VISIBLE ?AUTO_10244 ?AUTO_10245 ) ( not ( = ?AUTO_10248 ?AUTO_10244 ) ) ( not ( = ?AUTO_10245 ?AUTO_10244 ) ) ( CALIBRATION_TARGET ?AUTO_10250 ?AUTO_10249 ) ( VISIBLE_FROM ?AUTO_10249 ?AUTO_10244 ) ( not ( = ?AUTO_10242 ?AUTO_10249 ) ) ( CAN_TRAVERSE ?AUTO_10246 ?AUTO_10245 ?AUTO_10244 ) ( VISIBLE ?AUTO_10245 ?AUTO_10244 ) ( CAN_TRAVERSE ?AUTO_10246 ?AUTO_10248 ?AUTO_10245 ) ( AT ?AUTO_10246 ?AUTO_10248 ) ( VISIBLE ?AUTO_10248 ?AUTO_10245 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10246 ?AUTO_10248 ?AUTO_10245 )
      ( GET_IMAGE_DATA ?AUTO_10242 ?AUTO_10243 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10242 ?AUTO_10243 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10356 - OBJECTIVE
      ?AUTO_10357 - MODE
    )
    :vars
    (
      ?AUTO_10361 - LANDER
      ?AUTO_10358 - WAYPOINT
      ?AUTO_10362 - WAYPOINT
      ?AUTO_10359 - ROVER
      ?AUTO_10360 - CAMERA
      ?AUTO_10363 - WAYPOINT
      ?AUTO_10364 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10361 ?AUTO_10358 ) ( VISIBLE ?AUTO_10362 ?AUTO_10358 ) ( AVAILABLE ?AUTO_10359 ) ( CHANNEL_FREE ?AUTO_10361 ) ( not ( = ?AUTO_10362 ?AUTO_10358 ) ) ( CAN_TRAVERSE ?AUTO_10359 ?AUTO_10358 ?AUTO_10362 ) ( VISIBLE ?AUTO_10358 ?AUTO_10362 ) ( CALIBRATED ?AUTO_10360 ?AUTO_10359 ) ( ON_BOARD ?AUTO_10360 ?AUTO_10359 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10359 ) ( SUPPORTS ?AUTO_10360 ?AUTO_10357 ) ( VISIBLE_FROM ?AUTO_10356 ?AUTO_10358 ) ( CAN_TRAVERSE ?AUTO_10359 ?AUTO_10362 ?AUTO_10358 ) ( CAN_TRAVERSE ?AUTO_10359 ?AUTO_10363 ?AUTO_10362 ) ( VISIBLE ?AUTO_10363 ?AUTO_10362 ) ( not ( = ?AUTO_10358 ?AUTO_10363 ) ) ( not ( = ?AUTO_10362 ?AUTO_10363 ) ) ( CAN_TRAVERSE ?AUTO_10359 ?AUTO_10364 ?AUTO_10363 ) ( AT ?AUTO_10359 ?AUTO_10364 ) ( VISIBLE ?AUTO_10364 ?AUTO_10363 ) ( not ( = ?AUTO_10358 ?AUTO_10364 ) ) ( not ( = ?AUTO_10362 ?AUTO_10364 ) ) ( not ( = ?AUTO_10363 ?AUTO_10364 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10359 ?AUTO_10364 ?AUTO_10363 )
      ( GET_IMAGE_DATA ?AUTO_10356 ?AUTO_10357 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10356 ?AUTO_10357 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10365 - OBJECTIVE
      ?AUTO_10366 - MODE
    )
    :vars
    (
      ?AUTO_10372 - LANDER
      ?AUTO_10373 - WAYPOINT
      ?AUTO_10369 - WAYPOINT
      ?AUTO_10371 - ROVER
      ?AUTO_10370 - CAMERA
      ?AUTO_10367 - WAYPOINT
      ?AUTO_10368 - WAYPOINT
      ?AUTO_10374 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10372 ?AUTO_10373 ) ( VISIBLE ?AUTO_10369 ?AUTO_10373 ) ( AVAILABLE ?AUTO_10371 ) ( CHANNEL_FREE ?AUTO_10372 ) ( not ( = ?AUTO_10369 ?AUTO_10373 ) ) ( CAN_TRAVERSE ?AUTO_10371 ?AUTO_10373 ?AUTO_10369 ) ( VISIBLE ?AUTO_10373 ?AUTO_10369 ) ( ON_BOARD ?AUTO_10370 ?AUTO_10371 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10371 ) ( SUPPORTS ?AUTO_10370 ?AUTO_10366 ) ( VISIBLE_FROM ?AUTO_10365 ?AUTO_10373 ) ( CAN_TRAVERSE ?AUTO_10371 ?AUTO_10369 ?AUTO_10373 ) ( CAN_TRAVERSE ?AUTO_10371 ?AUTO_10367 ?AUTO_10369 ) ( VISIBLE ?AUTO_10367 ?AUTO_10369 ) ( not ( = ?AUTO_10373 ?AUTO_10367 ) ) ( not ( = ?AUTO_10369 ?AUTO_10367 ) ) ( CAN_TRAVERSE ?AUTO_10371 ?AUTO_10368 ?AUTO_10367 ) ( AT ?AUTO_10371 ?AUTO_10368 ) ( VISIBLE ?AUTO_10368 ?AUTO_10367 ) ( not ( = ?AUTO_10373 ?AUTO_10368 ) ) ( not ( = ?AUTO_10369 ?AUTO_10368 ) ) ( not ( = ?AUTO_10367 ?AUTO_10368 ) ) ( CALIBRATION_TARGET ?AUTO_10370 ?AUTO_10374 ) ( VISIBLE_FROM ?AUTO_10374 ?AUTO_10368 ) ( not ( = ?AUTO_10365 ?AUTO_10374 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10371 ?AUTO_10370 ?AUTO_10374 ?AUTO_10368 )
      ( GET_IMAGE_DATA ?AUTO_10365 ?AUTO_10366 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10365 ?AUTO_10366 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10375 - OBJECTIVE
      ?AUTO_10376 - MODE
    )
    :vars
    (
      ?AUTO_10378 - LANDER
      ?AUTO_10377 - WAYPOINT
      ?AUTO_10379 - WAYPOINT
      ?AUTO_10383 - ROVER
      ?AUTO_10380 - CAMERA
      ?AUTO_10381 - WAYPOINT
      ?AUTO_10382 - WAYPOINT
      ?AUTO_10384 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10378 ?AUTO_10377 ) ( VISIBLE ?AUTO_10379 ?AUTO_10377 ) ( AVAILABLE ?AUTO_10383 ) ( CHANNEL_FREE ?AUTO_10378 ) ( not ( = ?AUTO_10379 ?AUTO_10377 ) ) ( CAN_TRAVERSE ?AUTO_10383 ?AUTO_10377 ?AUTO_10379 ) ( VISIBLE ?AUTO_10377 ?AUTO_10379 ) ( ON_BOARD ?AUTO_10380 ?AUTO_10383 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10383 ) ( SUPPORTS ?AUTO_10380 ?AUTO_10376 ) ( VISIBLE_FROM ?AUTO_10375 ?AUTO_10377 ) ( CAN_TRAVERSE ?AUTO_10383 ?AUTO_10379 ?AUTO_10377 ) ( CAN_TRAVERSE ?AUTO_10383 ?AUTO_10381 ?AUTO_10379 ) ( VISIBLE ?AUTO_10381 ?AUTO_10379 ) ( not ( = ?AUTO_10377 ?AUTO_10381 ) ) ( not ( = ?AUTO_10379 ?AUTO_10381 ) ) ( CAN_TRAVERSE ?AUTO_10383 ?AUTO_10382 ?AUTO_10381 ) ( VISIBLE ?AUTO_10382 ?AUTO_10381 ) ( not ( = ?AUTO_10377 ?AUTO_10382 ) ) ( not ( = ?AUTO_10379 ?AUTO_10382 ) ) ( not ( = ?AUTO_10381 ?AUTO_10382 ) ) ( CALIBRATION_TARGET ?AUTO_10380 ?AUTO_10384 ) ( VISIBLE_FROM ?AUTO_10384 ?AUTO_10382 ) ( not ( = ?AUTO_10375 ?AUTO_10384 ) ) ( CAN_TRAVERSE ?AUTO_10383 ?AUTO_10379 ?AUTO_10382 ) ( AT ?AUTO_10383 ?AUTO_10379 ) ( VISIBLE ?AUTO_10379 ?AUTO_10382 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10383 ?AUTO_10379 ?AUTO_10382 )
      ( GET_IMAGE_DATA ?AUTO_10375 ?AUTO_10376 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10375 ?AUTO_10376 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10393 - OBJECTIVE
      ?AUTO_10394 - MODE
    )
    :vars
    (
      ?AUTO_10400 - LANDER
      ?AUTO_10401 - WAYPOINT
      ?AUTO_10397 - WAYPOINT
      ?AUTO_10399 - ROVER
      ?AUTO_10402 - CAMERA
      ?AUTO_10395 - WAYPOINT
      ?AUTO_10398 - WAYPOINT
      ?AUTO_10396 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10400 ?AUTO_10401 ) ( VISIBLE ?AUTO_10397 ?AUTO_10401 ) ( AVAILABLE ?AUTO_10399 ) ( CHANNEL_FREE ?AUTO_10400 ) ( not ( = ?AUTO_10397 ?AUTO_10401 ) ) ( CAN_TRAVERSE ?AUTO_10399 ?AUTO_10401 ?AUTO_10397 ) ( VISIBLE ?AUTO_10401 ?AUTO_10397 ) ( ON_BOARD ?AUTO_10402 ?AUTO_10399 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10399 ) ( SUPPORTS ?AUTO_10402 ?AUTO_10394 ) ( VISIBLE_FROM ?AUTO_10393 ?AUTO_10401 ) ( CAN_TRAVERSE ?AUTO_10399 ?AUTO_10397 ?AUTO_10401 ) ( CAN_TRAVERSE ?AUTO_10399 ?AUTO_10395 ?AUTO_10397 ) ( VISIBLE ?AUTO_10395 ?AUTO_10397 ) ( not ( = ?AUTO_10401 ?AUTO_10395 ) ) ( not ( = ?AUTO_10397 ?AUTO_10395 ) ) ( CAN_TRAVERSE ?AUTO_10399 ?AUTO_10398 ?AUTO_10395 ) ( VISIBLE ?AUTO_10398 ?AUTO_10395 ) ( not ( = ?AUTO_10401 ?AUTO_10398 ) ) ( not ( = ?AUTO_10397 ?AUTO_10398 ) ) ( not ( = ?AUTO_10395 ?AUTO_10398 ) ) ( CALIBRATION_TARGET ?AUTO_10402 ?AUTO_10396 ) ( VISIBLE_FROM ?AUTO_10396 ?AUTO_10398 ) ( not ( = ?AUTO_10393 ?AUTO_10396 ) ) ( CAN_TRAVERSE ?AUTO_10399 ?AUTO_10397 ?AUTO_10398 ) ( VISIBLE ?AUTO_10397 ?AUTO_10398 ) ( AT ?AUTO_10399 ?AUTO_10395 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10399 ?AUTO_10395 ?AUTO_10397 )
      ( GET_IMAGE_DATA ?AUTO_10393 ?AUTO_10394 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10393 ?AUTO_10394 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10413 - OBJECTIVE
      ?AUTO_10414 - MODE
    )
    :vars
    (
      ?AUTO_10419 - LANDER
      ?AUTO_10420 - WAYPOINT
      ?AUTO_10416 - WAYPOINT
      ?AUTO_10418 - ROVER
      ?AUTO_10422 - CAMERA
      ?AUTO_10417 - WAYPOINT
      ?AUTO_10421 - WAYPOINT
      ?AUTO_10415 - OBJECTIVE
      ?AUTO_10423 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10419 ?AUTO_10420 ) ( VISIBLE ?AUTO_10416 ?AUTO_10420 ) ( AVAILABLE ?AUTO_10418 ) ( CHANNEL_FREE ?AUTO_10419 ) ( not ( = ?AUTO_10416 ?AUTO_10420 ) ) ( CAN_TRAVERSE ?AUTO_10418 ?AUTO_10420 ?AUTO_10416 ) ( VISIBLE ?AUTO_10420 ?AUTO_10416 ) ( ON_BOARD ?AUTO_10422 ?AUTO_10418 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10418 ) ( SUPPORTS ?AUTO_10422 ?AUTO_10414 ) ( VISIBLE_FROM ?AUTO_10413 ?AUTO_10420 ) ( CAN_TRAVERSE ?AUTO_10418 ?AUTO_10416 ?AUTO_10420 ) ( CAN_TRAVERSE ?AUTO_10418 ?AUTO_10417 ?AUTO_10416 ) ( VISIBLE ?AUTO_10417 ?AUTO_10416 ) ( not ( = ?AUTO_10420 ?AUTO_10417 ) ) ( not ( = ?AUTO_10416 ?AUTO_10417 ) ) ( CAN_TRAVERSE ?AUTO_10418 ?AUTO_10421 ?AUTO_10417 ) ( VISIBLE ?AUTO_10421 ?AUTO_10417 ) ( not ( = ?AUTO_10420 ?AUTO_10421 ) ) ( not ( = ?AUTO_10416 ?AUTO_10421 ) ) ( not ( = ?AUTO_10417 ?AUTO_10421 ) ) ( CALIBRATION_TARGET ?AUTO_10422 ?AUTO_10415 ) ( VISIBLE_FROM ?AUTO_10415 ?AUTO_10421 ) ( not ( = ?AUTO_10413 ?AUTO_10415 ) ) ( CAN_TRAVERSE ?AUTO_10418 ?AUTO_10416 ?AUTO_10421 ) ( VISIBLE ?AUTO_10416 ?AUTO_10421 ) ( CAN_TRAVERSE ?AUTO_10418 ?AUTO_10423 ?AUTO_10417 ) ( AT ?AUTO_10418 ?AUTO_10423 ) ( VISIBLE ?AUTO_10423 ?AUTO_10417 ) ( not ( = ?AUTO_10420 ?AUTO_10423 ) ) ( not ( = ?AUTO_10416 ?AUTO_10423 ) ) ( not ( = ?AUTO_10417 ?AUTO_10423 ) ) ( not ( = ?AUTO_10421 ?AUTO_10423 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10418 ?AUTO_10423 ?AUTO_10417 )
      ( GET_IMAGE_DATA ?AUTO_10413 ?AUTO_10414 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10413 ?AUTO_10414 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10460 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10463 - LANDER
      ?AUTO_10465 - WAYPOINT
      ?AUTO_10466 - WAYPOINT
      ?AUTO_10461 - ROVER
      ?AUTO_10464 - STORE
      ?AUTO_10462 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10463 ?AUTO_10465 ) ( VISIBLE ?AUTO_10466 ?AUTO_10465 ) ( AVAILABLE ?AUTO_10461 ) ( CHANNEL_FREE ?AUTO_10463 ) ( not ( = ?AUTO_10460 ?AUTO_10466 ) ) ( not ( = ?AUTO_10460 ?AUTO_10465 ) ) ( not ( = ?AUTO_10466 ?AUTO_10465 ) ) ( CAN_TRAVERSE ?AUTO_10461 ?AUTO_10460 ?AUTO_10466 ) ( VISIBLE ?AUTO_10460 ?AUTO_10466 ) ( AT_SOIL_SAMPLE ?AUTO_10460 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10461 ) ( STORE_OF ?AUTO_10464 ?AUTO_10461 ) ( EMPTY ?AUTO_10464 ) ( CAN_TRAVERSE ?AUTO_10461 ?AUTO_10462 ?AUTO_10460 ) ( VISIBLE ?AUTO_10462 ?AUTO_10460 ) ( not ( = ?AUTO_10460 ?AUTO_10462 ) ) ( not ( = ?AUTO_10465 ?AUTO_10462 ) ) ( not ( = ?AUTO_10466 ?AUTO_10462 ) ) ( CAN_TRAVERSE ?AUTO_10461 ?AUTO_10466 ?AUTO_10462 ) ( AT ?AUTO_10461 ?AUTO_10466 ) ( VISIBLE ?AUTO_10466 ?AUTO_10462 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10461 ?AUTO_10466 ?AUTO_10462 )
      ( GET_SOIL_DATA ?AUTO_10460 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10460 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10492 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10498 - LANDER
      ?AUTO_10494 - WAYPOINT
      ?AUTO_10496 - WAYPOINT
      ?AUTO_10495 - ROVER
      ?AUTO_10493 - STORE
      ?AUTO_10497 - WAYPOINT
      ?AUTO_10499 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10498 ?AUTO_10494 ) ( VISIBLE ?AUTO_10496 ?AUTO_10494 ) ( AVAILABLE ?AUTO_10495 ) ( CHANNEL_FREE ?AUTO_10498 ) ( not ( = ?AUTO_10492 ?AUTO_10496 ) ) ( not ( = ?AUTO_10492 ?AUTO_10494 ) ) ( not ( = ?AUTO_10496 ?AUTO_10494 ) ) ( CAN_TRAVERSE ?AUTO_10495 ?AUTO_10492 ?AUTO_10496 ) ( VISIBLE ?AUTO_10492 ?AUTO_10496 ) ( AT_SOIL_SAMPLE ?AUTO_10492 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10495 ) ( STORE_OF ?AUTO_10493 ?AUTO_10495 ) ( EMPTY ?AUTO_10493 ) ( CAN_TRAVERSE ?AUTO_10495 ?AUTO_10497 ?AUTO_10492 ) ( VISIBLE ?AUTO_10497 ?AUTO_10492 ) ( not ( = ?AUTO_10492 ?AUTO_10497 ) ) ( not ( = ?AUTO_10494 ?AUTO_10497 ) ) ( not ( = ?AUTO_10496 ?AUTO_10497 ) ) ( CAN_TRAVERSE ?AUTO_10495 ?AUTO_10496 ?AUTO_10497 ) ( VISIBLE ?AUTO_10496 ?AUTO_10497 ) ( CAN_TRAVERSE ?AUTO_10495 ?AUTO_10499 ?AUTO_10496 ) ( AT ?AUTO_10495 ?AUTO_10499 ) ( VISIBLE ?AUTO_10499 ?AUTO_10496 ) ( not ( = ?AUTO_10492 ?AUTO_10499 ) ) ( not ( = ?AUTO_10494 ?AUTO_10499 ) ) ( not ( = ?AUTO_10496 ?AUTO_10499 ) ) ( not ( = ?AUTO_10497 ?AUTO_10499 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10495 ?AUTO_10499 ?AUTO_10496 )
      ( GET_SOIL_DATA ?AUTO_10492 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10492 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10533 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10537 - LANDER
      ?AUTO_10536 - WAYPOINT
      ?AUTO_10534 - WAYPOINT
      ?AUTO_10539 - ROVER
      ?AUTO_10538 - STORE
      ?AUTO_10535 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10537 ?AUTO_10536 ) ( VISIBLE ?AUTO_10534 ?AUTO_10536 ) ( AVAILABLE ?AUTO_10539 ) ( CHANNEL_FREE ?AUTO_10537 ) ( not ( = ?AUTO_10533 ?AUTO_10534 ) ) ( not ( = ?AUTO_10533 ?AUTO_10536 ) ) ( not ( = ?AUTO_10534 ?AUTO_10536 ) ) ( CAN_TRAVERSE ?AUTO_10539 ?AUTO_10533 ?AUTO_10534 ) ( VISIBLE ?AUTO_10533 ?AUTO_10534 ) ( AT_ROCK_SAMPLE ?AUTO_10533 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10539 ) ( STORE_OF ?AUTO_10538 ?AUTO_10539 ) ( EMPTY ?AUTO_10538 ) ( CAN_TRAVERSE ?AUTO_10539 ?AUTO_10535 ?AUTO_10533 ) ( VISIBLE ?AUTO_10535 ?AUTO_10533 ) ( not ( = ?AUTO_10533 ?AUTO_10535 ) ) ( not ( = ?AUTO_10536 ?AUTO_10535 ) ) ( not ( = ?AUTO_10534 ?AUTO_10535 ) ) ( CAN_TRAVERSE ?AUTO_10539 ?AUTO_10536 ?AUTO_10535 ) ( AT ?AUTO_10539 ?AUTO_10536 ) ( VISIBLE ?AUTO_10536 ?AUTO_10535 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10539 ?AUTO_10536 ?AUTO_10535 )
      ( GET_ROCK_DATA ?AUTO_10533 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10533 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10562 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10566 - LANDER
      ?AUTO_10564 - WAYPOINT
      ?AUTO_10563 - WAYPOINT
      ?AUTO_10565 - ROVER
      ?AUTO_10567 - STORE
      ?AUTO_10568 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10566 ?AUTO_10564 ) ( VISIBLE ?AUTO_10563 ?AUTO_10564 ) ( AVAILABLE ?AUTO_10565 ) ( CHANNEL_FREE ?AUTO_10566 ) ( not ( = ?AUTO_10562 ?AUTO_10563 ) ) ( not ( = ?AUTO_10562 ?AUTO_10564 ) ) ( not ( = ?AUTO_10563 ?AUTO_10564 ) ) ( CAN_TRAVERSE ?AUTO_10565 ?AUTO_10562 ?AUTO_10563 ) ( VISIBLE ?AUTO_10562 ?AUTO_10563 ) ( AT_ROCK_SAMPLE ?AUTO_10562 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10565 ) ( STORE_OF ?AUTO_10567 ?AUTO_10565 ) ( CAN_TRAVERSE ?AUTO_10565 ?AUTO_10568 ?AUTO_10562 ) ( VISIBLE ?AUTO_10568 ?AUTO_10562 ) ( not ( = ?AUTO_10562 ?AUTO_10568 ) ) ( not ( = ?AUTO_10564 ?AUTO_10568 ) ) ( not ( = ?AUTO_10563 ?AUTO_10568 ) ) ( FULL ?AUTO_10567 ) ( CAN_TRAVERSE ?AUTO_10565 ?AUTO_10563 ?AUTO_10568 ) ( AT ?AUTO_10565 ?AUTO_10563 ) ( VISIBLE ?AUTO_10563 ?AUTO_10568 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10565 ?AUTO_10563 ?AUTO_10568 )
      ( GET_ROCK_DATA ?AUTO_10562 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10562 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10690 - OBJECTIVE
      ?AUTO_10691 - MODE
    )
    :vars
    (
      ?AUTO_10693 - LANDER
      ?AUTO_10699 - WAYPOINT
      ?AUTO_10698 - WAYPOINT
      ?AUTO_10692 - ROVER
      ?AUTO_10694 - WAYPOINT
      ?AUTO_10695 - WAYPOINT
      ?AUTO_10697 - CAMERA
      ?AUTO_10696 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10693 ?AUTO_10699 ) ( VISIBLE ?AUTO_10698 ?AUTO_10699 ) ( AVAILABLE ?AUTO_10692 ) ( CHANNEL_FREE ?AUTO_10693 ) ( not ( = ?AUTO_10698 ?AUTO_10699 ) ) ( CAN_TRAVERSE ?AUTO_10692 ?AUTO_10694 ?AUTO_10698 ) ( VISIBLE ?AUTO_10694 ?AUTO_10698 ) ( not ( = ?AUTO_10699 ?AUTO_10694 ) ) ( not ( = ?AUTO_10698 ?AUTO_10694 ) ) ( CAN_TRAVERSE ?AUTO_10692 ?AUTO_10695 ?AUTO_10694 ) ( VISIBLE ?AUTO_10695 ?AUTO_10694 ) ( not ( = ?AUTO_10699 ?AUTO_10695 ) ) ( not ( = ?AUTO_10698 ?AUTO_10695 ) ) ( not ( = ?AUTO_10694 ?AUTO_10695 ) ) ( ON_BOARD ?AUTO_10697 ?AUTO_10692 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10692 ) ( SUPPORTS ?AUTO_10697 ?AUTO_10691 ) ( VISIBLE_FROM ?AUTO_10690 ?AUTO_10695 ) ( CAN_TRAVERSE ?AUTO_10692 ?AUTO_10694 ?AUTO_10695 ) ( VISIBLE ?AUTO_10694 ?AUTO_10695 ) ( CALIBRATION_TARGET ?AUTO_10697 ?AUTO_10696 ) ( VISIBLE_FROM ?AUTO_10696 ?AUTO_10694 ) ( not ( = ?AUTO_10690 ?AUTO_10696 ) ) ( AT ?AUTO_10692 ?AUTO_10695 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10692 ?AUTO_10695 ?AUTO_10694 )
      ( GET_IMAGE_DATA ?AUTO_10690 ?AUTO_10691 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10690 ?AUTO_10691 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10700 - OBJECTIVE
      ?AUTO_10701 - MODE
    )
    :vars
    (
      ?AUTO_10703 - LANDER
      ?AUTO_10704 - WAYPOINT
      ?AUTO_10707 - WAYPOINT
      ?AUTO_10702 - ROVER
      ?AUTO_10709 - WAYPOINT
      ?AUTO_10708 - WAYPOINT
      ?AUTO_10706 - CAMERA
      ?AUTO_10705 - OBJECTIVE
      ?AUTO_10710 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10703 ?AUTO_10704 ) ( VISIBLE ?AUTO_10707 ?AUTO_10704 ) ( AVAILABLE ?AUTO_10702 ) ( CHANNEL_FREE ?AUTO_10703 ) ( not ( = ?AUTO_10707 ?AUTO_10704 ) ) ( CAN_TRAVERSE ?AUTO_10702 ?AUTO_10709 ?AUTO_10707 ) ( VISIBLE ?AUTO_10709 ?AUTO_10707 ) ( not ( = ?AUTO_10704 ?AUTO_10709 ) ) ( not ( = ?AUTO_10707 ?AUTO_10709 ) ) ( CAN_TRAVERSE ?AUTO_10702 ?AUTO_10708 ?AUTO_10709 ) ( VISIBLE ?AUTO_10708 ?AUTO_10709 ) ( not ( = ?AUTO_10704 ?AUTO_10708 ) ) ( not ( = ?AUTO_10707 ?AUTO_10708 ) ) ( not ( = ?AUTO_10709 ?AUTO_10708 ) ) ( ON_BOARD ?AUTO_10706 ?AUTO_10702 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10702 ) ( SUPPORTS ?AUTO_10706 ?AUTO_10701 ) ( VISIBLE_FROM ?AUTO_10700 ?AUTO_10708 ) ( CAN_TRAVERSE ?AUTO_10702 ?AUTO_10709 ?AUTO_10708 ) ( VISIBLE ?AUTO_10709 ?AUTO_10708 ) ( CALIBRATION_TARGET ?AUTO_10706 ?AUTO_10705 ) ( VISIBLE_FROM ?AUTO_10705 ?AUTO_10709 ) ( not ( = ?AUTO_10700 ?AUTO_10705 ) ) ( CAN_TRAVERSE ?AUTO_10702 ?AUTO_10710 ?AUTO_10708 ) ( AT ?AUTO_10702 ?AUTO_10710 ) ( VISIBLE ?AUTO_10710 ?AUTO_10708 ) ( not ( = ?AUTO_10704 ?AUTO_10710 ) ) ( not ( = ?AUTO_10707 ?AUTO_10710 ) ) ( not ( = ?AUTO_10709 ?AUTO_10710 ) ) ( not ( = ?AUTO_10708 ?AUTO_10710 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10702 ?AUTO_10710 ?AUTO_10708 )
      ( GET_IMAGE_DATA ?AUTO_10700 ?AUTO_10701 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10700 ?AUTO_10701 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10711 - OBJECTIVE
      ?AUTO_10712 - MODE
    )
    :vars
    (
      ?AUTO_10713 - LANDER
      ?AUTO_10719 - WAYPOINT
      ?AUTO_10715 - WAYPOINT
      ?AUTO_10716 - ROVER
      ?AUTO_10717 - WAYPOINT
      ?AUTO_10721 - WAYPOINT
      ?AUTO_10714 - CAMERA
      ?AUTO_10720 - OBJECTIVE
      ?AUTO_10718 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10713 ?AUTO_10719 ) ( VISIBLE ?AUTO_10715 ?AUTO_10719 ) ( AVAILABLE ?AUTO_10716 ) ( CHANNEL_FREE ?AUTO_10713 ) ( not ( = ?AUTO_10715 ?AUTO_10719 ) ) ( CAN_TRAVERSE ?AUTO_10716 ?AUTO_10717 ?AUTO_10715 ) ( VISIBLE ?AUTO_10717 ?AUTO_10715 ) ( not ( = ?AUTO_10719 ?AUTO_10717 ) ) ( not ( = ?AUTO_10715 ?AUTO_10717 ) ) ( CAN_TRAVERSE ?AUTO_10716 ?AUTO_10721 ?AUTO_10717 ) ( VISIBLE ?AUTO_10721 ?AUTO_10717 ) ( not ( = ?AUTO_10719 ?AUTO_10721 ) ) ( not ( = ?AUTO_10715 ?AUTO_10721 ) ) ( not ( = ?AUTO_10717 ?AUTO_10721 ) ) ( ON_BOARD ?AUTO_10714 ?AUTO_10716 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10716 ) ( SUPPORTS ?AUTO_10714 ?AUTO_10712 ) ( VISIBLE_FROM ?AUTO_10711 ?AUTO_10721 ) ( CAN_TRAVERSE ?AUTO_10716 ?AUTO_10717 ?AUTO_10721 ) ( VISIBLE ?AUTO_10717 ?AUTO_10721 ) ( CALIBRATION_TARGET ?AUTO_10714 ?AUTO_10720 ) ( VISIBLE_FROM ?AUTO_10720 ?AUTO_10717 ) ( not ( = ?AUTO_10711 ?AUTO_10720 ) ) ( CAN_TRAVERSE ?AUTO_10716 ?AUTO_10718 ?AUTO_10721 ) ( VISIBLE ?AUTO_10718 ?AUTO_10721 ) ( not ( = ?AUTO_10719 ?AUTO_10718 ) ) ( not ( = ?AUTO_10715 ?AUTO_10718 ) ) ( not ( = ?AUTO_10717 ?AUTO_10718 ) ) ( not ( = ?AUTO_10721 ?AUTO_10718 ) ) ( CAN_TRAVERSE ?AUTO_10716 ?AUTO_10715 ?AUTO_10718 ) ( AT ?AUTO_10716 ?AUTO_10715 ) ( VISIBLE ?AUTO_10715 ?AUTO_10718 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10716 ?AUTO_10715 ?AUTO_10718 )
      ( GET_IMAGE_DATA ?AUTO_10711 ?AUTO_10712 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10711 ?AUTO_10712 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10783 - OBJECTIVE
      ?AUTO_10784 - MODE
    )
    :vars
    (
      ?AUTO_10789 - LANDER
      ?AUTO_10791 - WAYPOINT
      ?AUTO_10787 - WAYPOINT
      ?AUTO_10786 - ROVER
      ?AUTO_10792 - WAYPOINT
      ?AUTO_10785 - CAMERA
      ?AUTO_10788 - WAYPOINT
      ?AUTO_10790 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10789 ?AUTO_10791 ) ( VISIBLE ?AUTO_10787 ?AUTO_10791 ) ( AVAILABLE ?AUTO_10786 ) ( CHANNEL_FREE ?AUTO_10789 ) ( not ( = ?AUTO_10787 ?AUTO_10791 ) ) ( CAN_TRAVERSE ?AUTO_10786 ?AUTO_10792 ?AUTO_10787 ) ( VISIBLE ?AUTO_10792 ?AUTO_10787 ) ( not ( = ?AUTO_10791 ?AUTO_10792 ) ) ( not ( = ?AUTO_10787 ?AUTO_10792 ) ) ( ON_BOARD ?AUTO_10785 ?AUTO_10786 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10786 ) ( SUPPORTS ?AUTO_10785 ?AUTO_10784 ) ( VISIBLE_FROM ?AUTO_10783 ?AUTO_10792 ) ( CALIBRATION_TARGET ?AUTO_10785 ?AUTO_10783 ) ( CAN_TRAVERSE ?AUTO_10786 ?AUTO_10788 ?AUTO_10792 ) ( VISIBLE ?AUTO_10788 ?AUTO_10792 ) ( not ( = ?AUTO_10791 ?AUTO_10788 ) ) ( not ( = ?AUTO_10787 ?AUTO_10788 ) ) ( not ( = ?AUTO_10792 ?AUTO_10788 ) ) ( CAN_TRAVERSE ?AUTO_10786 ?AUTO_10790 ?AUTO_10788 ) ( VISIBLE ?AUTO_10790 ?AUTO_10788 ) ( not ( = ?AUTO_10791 ?AUTO_10790 ) ) ( not ( = ?AUTO_10787 ?AUTO_10790 ) ) ( not ( = ?AUTO_10792 ?AUTO_10790 ) ) ( not ( = ?AUTO_10788 ?AUTO_10790 ) ) ( CAN_TRAVERSE ?AUTO_10786 ?AUTO_10787 ?AUTO_10790 ) ( AT ?AUTO_10786 ?AUTO_10787 ) ( VISIBLE ?AUTO_10787 ?AUTO_10790 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10786 ?AUTO_10787 ?AUTO_10790 )
      ( GET_IMAGE_DATA ?AUTO_10783 ?AUTO_10784 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10783 ?AUTO_10784 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10934 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10937 - LANDER
      ?AUTO_10935 - WAYPOINT
      ?AUTO_10936 - ROVER
      ?AUTO_10938 - STORE
      ?AUTO_10939 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10937 ?AUTO_10934 ) ( VISIBLE ?AUTO_10935 ?AUTO_10934 ) ( AVAILABLE ?AUTO_10936 ) ( CHANNEL_FREE ?AUTO_10937 ) ( not ( = ?AUTO_10934 ?AUTO_10935 ) ) ( CAN_TRAVERSE ?AUTO_10936 ?AUTO_10934 ?AUTO_10935 ) ( VISIBLE ?AUTO_10934 ?AUTO_10935 ) ( AT_ROCK_SAMPLE ?AUTO_10934 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10936 ) ( STORE_OF ?AUTO_10938 ?AUTO_10936 ) ( CAN_TRAVERSE ?AUTO_10936 ?AUTO_10935 ?AUTO_10934 ) ( CAN_TRAVERSE ?AUTO_10936 ?AUTO_10939 ?AUTO_10935 ) ( AT ?AUTO_10936 ?AUTO_10939 ) ( VISIBLE ?AUTO_10939 ?AUTO_10935 ) ( not ( = ?AUTO_10934 ?AUTO_10939 ) ) ( not ( = ?AUTO_10935 ?AUTO_10939 ) ) ( FULL ?AUTO_10938 ) )
    :subtasks
    ( ( !DROP ?AUTO_10936 ?AUTO_10938 )
      ( GET_ROCK_DATA ?AUTO_10934 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10934 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10941 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10942 - LANDER
      ?AUTO_10944 - WAYPOINT
      ?AUTO_10945 - ROVER
      ?AUTO_10946 - STORE
      ?AUTO_10943 - WAYPOINT
      ?AUTO_10947 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10942 ?AUTO_10941 ) ( VISIBLE ?AUTO_10944 ?AUTO_10941 ) ( AVAILABLE ?AUTO_10945 ) ( CHANNEL_FREE ?AUTO_10942 ) ( not ( = ?AUTO_10941 ?AUTO_10944 ) ) ( CAN_TRAVERSE ?AUTO_10945 ?AUTO_10941 ?AUTO_10944 ) ( VISIBLE ?AUTO_10941 ?AUTO_10944 ) ( AT_ROCK_SAMPLE ?AUTO_10941 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10945 ) ( STORE_OF ?AUTO_10946 ?AUTO_10945 ) ( EMPTY ?AUTO_10946 ) ( CAN_TRAVERSE ?AUTO_10945 ?AUTO_10944 ?AUTO_10941 ) ( CAN_TRAVERSE ?AUTO_10945 ?AUTO_10943 ?AUTO_10944 ) ( VISIBLE ?AUTO_10943 ?AUTO_10944 ) ( not ( = ?AUTO_10941 ?AUTO_10943 ) ) ( not ( = ?AUTO_10944 ?AUTO_10943 ) ) ( CAN_TRAVERSE ?AUTO_10945 ?AUTO_10947 ?AUTO_10943 ) ( AT ?AUTO_10945 ?AUTO_10947 ) ( VISIBLE ?AUTO_10947 ?AUTO_10943 ) ( not ( = ?AUTO_10941 ?AUTO_10947 ) ) ( not ( = ?AUTO_10944 ?AUTO_10947 ) ) ( not ( = ?AUTO_10943 ?AUTO_10947 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10945 ?AUTO_10947 ?AUTO_10943 )
      ( GET_ROCK_DATA ?AUTO_10941 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10941 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10954 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10956 - LANDER
      ?AUTO_10957 - WAYPOINT
      ?AUTO_10958 - ROVER
      ?AUTO_10960 - STORE
      ?AUTO_10955 - WAYPOINT
      ?AUTO_10959 - WAYPOINT
      ?AUTO_10961 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10956 ?AUTO_10954 ) ( VISIBLE ?AUTO_10957 ?AUTO_10954 ) ( AVAILABLE ?AUTO_10958 ) ( CHANNEL_FREE ?AUTO_10956 ) ( not ( = ?AUTO_10954 ?AUTO_10957 ) ) ( CAN_TRAVERSE ?AUTO_10958 ?AUTO_10954 ?AUTO_10957 ) ( VISIBLE ?AUTO_10954 ?AUTO_10957 ) ( AT_ROCK_SAMPLE ?AUTO_10954 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10958 ) ( STORE_OF ?AUTO_10960 ?AUTO_10958 ) ( EMPTY ?AUTO_10960 ) ( CAN_TRAVERSE ?AUTO_10958 ?AUTO_10957 ?AUTO_10954 ) ( CAN_TRAVERSE ?AUTO_10958 ?AUTO_10955 ?AUTO_10957 ) ( VISIBLE ?AUTO_10955 ?AUTO_10957 ) ( not ( = ?AUTO_10954 ?AUTO_10955 ) ) ( not ( = ?AUTO_10957 ?AUTO_10955 ) ) ( CAN_TRAVERSE ?AUTO_10958 ?AUTO_10959 ?AUTO_10955 ) ( VISIBLE ?AUTO_10959 ?AUTO_10955 ) ( not ( = ?AUTO_10954 ?AUTO_10959 ) ) ( not ( = ?AUTO_10957 ?AUTO_10959 ) ) ( not ( = ?AUTO_10955 ?AUTO_10959 ) ) ( CAN_TRAVERSE ?AUTO_10958 ?AUTO_10961 ?AUTO_10959 ) ( AT ?AUTO_10958 ?AUTO_10961 ) ( VISIBLE ?AUTO_10961 ?AUTO_10959 ) ( not ( = ?AUTO_10954 ?AUTO_10961 ) ) ( not ( = ?AUTO_10957 ?AUTO_10961 ) ) ( not ( = ?AUTO_10955 ?AUTO_10961 ) ) ( not ( = ?AUTO_10959 ?AUTO_10961 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10958 ?AUTO_10961 ?AUTO_10959 )
      ( GET_ROCK_DATA ?AUTO_10954 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10954 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11073 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11075 - LANDER
      ?AUTO_11077 - WAYPOINT
      ?AUTO_11074 - WAYPOINT
      ?AUTO_11078 - ROVER
      ?AUTO_11076 - STORE
      ?AUTO_11079 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11075 ?AUTO_11077 ) ( VISIBLE ?AUTO_11074 ?AUTO_11077 ) ( AVAILABLE ?AUTO_11078 ) ( CHANNEL_FREE ?AUTO_11075 ) ( not ( = ?AUTO_11073 ?AUTO_11074 ) ) ( not ( = ?AUTO_11073 ?AUTO_11077 ) ) ( not ( = ?AUTO_11074 ?AUTO_11077 ) ) ( CAN_TRAVERSE ?AUTO_11078 ?AUTO_11073 ?AUTO_11074 ) ( VISIBLE ?AUTO_11073 ?AUTO_11074 ) ( AT_SOIL_SAMPLE ?AUTO_11073 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11078 ) ( STORE_OF ?AUTO_11076 ?AUTO_11078 ) ( EMPTY ?AUTO_11076 ) ( CAN_TRAVERSE ?AUTO_11078 ?AUTO_11074 ?AUTO_11073 ) ( VISIBLE ?AUTO_11074 ?AUTO_11073 ) ( CAN_TRAVERSE ?AUTO_11078 ?AUTO_11077 ?AUTO_11074 ) ( VISIBLE ?AUTO_11077 ?AUTO_11074 ) ( CAN_TRAVERSE ?AUTO_11078 ?AUTO_11079 ?AUTO_11077 ) ( AT ?AUTO_11078 ?AUTO_11079 ) ( VISIBLE ?AUTO_11079 ?AUTO_11077 ) ( not ( = ?AUTO_11073 ?AUTO_11079 ) ) ( not ( = ?AUTO_11077 ?AUTO_11079 ) ) ( not ( = ?AUTO_11074 ?AUTO_11079 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11078 ?AUTO_11079 ?AUTO_11077 )
      ( GET_SOIL_DATA ?AUTO_11073 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11073 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11104 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11107 - LANDER
      ?AUTO_11110 - WAYPOINT
      ?AUTO_11109 - ROVER
      ?AUTO_11105 - STORE
      ?AUTO_11106 - WAYPOINT
      ?AUTO_11108 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11107 ?AUTO_11110 ) ( VISIBLE ?AUTO_11104 ?AUTO_11110 ) ( AVAILABLE ?AUTO_11109 ) ( CHANNEL_FREE ?AUTO_11107 ) ( not ( = ?AUTO_11104 ?AUTO_11110 ) ) ( AT_SOIL_SAMPLE ?AUTO_11104 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11109 ) ( STORE_OF ?AUTO_11105 ?AUTO_11109 ) ( CAN_TRAVERSE ?AUTO_11109 ?AUTO_11106 ?AUTO_11104 ) ( VISIBLE ?AUTO_11106 ?AUTO_11104 ) ( not ( = ?AUTO_11104 ?AUTO_11106 ) ) ( not ( = ?AUTO_11110 ?AUTO_11106 ) ) ( CAN_TRAVERSE ?AUTO_11109 ?AUTO_11108 ?AUTO_11106 ) ( AT ?AUTO_11109 ?AUTO_11108 ) ( VISIBLE ?AUTO_11108 ?AUTO_11106 ) ( not ( = ?AUTO_11104 ?AUTO_11108 ) ) ( not ( = ?AUTO_11110 ?AUTO_11108 ) ) ( not ( = ?AUTO_11106 ?AUTO_11108 ) ) ( FULL ?AUTO_11105 ) )
    :subtasks
    ( ( !DROP ?AUTO_11109 ?AUTO_11105 )
      ( GET_SOIL_DATA ?AUTO_11104 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11104 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11189 - OBJECTIVE
      ?AUTO_11190 - MODE
    )
    :vars
    (
      ?AUTO_11194 - LANDER
      ?AUTO_11195 - WAYPOINT
      ?AUTO_11193 - WAYPOINT
      ?AUTO_11191 - ROVER
      ?AUTO_11196 - WAYPOINT
      ?AUTO_11192 - CAMERA
      ?AUTO_11197 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11194 ?AUTO_11195 ) ( VISIBLE ?AUTO_11193 ?AUTO_11195 ) ( AVAILABLE ?AUTO_11191 ) ( CHANNEL_FREE ?AUTO_11194 ) ( not ( = ?AUTO_11193 ?AUTO_11195 ) ) ( CAN_TRAVERSE ?AUTO_11191 ?AUTO_11196 ?AUTO_11193 ) ( VISIBLE ?AUTO_11196 ?AUTO_11193 ) ( not ( = ?AUTO_11195 ?AUTO_11196 ) ) ( not ( = ?AUTO_11193 ?AUTO_11196 ) ) ( CALIBRATED ?AUTO_11192 ?AUTO_11191 ) ( ON_BOARD ?AUTO_11192 ?AUTO_11191 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11191 ) ( SUPPORTS ?AUTO_11192 ?AUTO_11190 ) ( VISIBLE_FROM ?AUTO_11189 ?AUTO_11196 ) ( CAN_TRAVERSE ?AUTO_11191 ?AUTO_11193 ?AUTO_11196 ) ( VISIBLE ?AUTO_11193 ?AUTO_11196 ) ( CAN_TRAVERSE ?AUTO_11191 ?AUTO_11195 ?AUTO_11193 ) ( VISIBLE ?AUTO_11195 ?AUTO_11193 ) ( CAN_TRAVERSE ?AUTO_11191 ?AUTO_11197 ?AUTO_11195 ) ( AT ?AUTO_11191 ?AUTO_11197 ) ( VISIBLE ?AUTO_11197 ?AUTO_11195 ) ( not ( = ?AUTO_11195 ?AUTO_11197 ) ) ( not ( = ?AUTO_11193 ?AUTO_11197 ) ) ( not ( = ?AUTO_11196 ?AUTO_11197 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11191 ?AUTO_11197 ?AUTO_11195 )
      ( GET_IMAGE_DATA ?AUTO_11189 ?AUTO_11190 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11189 ?AUTO_11190 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11208 - OBJECTIVE
      ?AUTO_11209 - MODE
    )
    :vars
    (
      ?AUTO_11215 - LANDER
      ?AUTO_11214 - WAYPOINT
      ?AUTO_11216 - WAYPOINT
      ?AUTO_11212 - ROVER
      ?AUTO_11210 - WAYPOINT
      ?AUTO_11211 - CAMERA
      ?AUTO_11213 - WAYPOINT
      ?AUTO_11217 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11215 ?AUTO_11214 ) ( VISIBLE ?AUTO_11216 ?AUTO_11214 ) ( AVAILABLE ?AUTO_11212 ) ( CHANNEL_FREE ?AUTO_11215 ) ( not ( = ?AUTO_11216 ?AUTO_11214 ) ) ( CAN_TRAVERSE ?AUTO_11212 ?AUTO_11210 ?AUTO_11216 ) ( VISIBLE ?AUTO_11210 ?AUTO_11216 ) ( not ( = ?AUTO_11214 ?AUTO_11210 ) ) ( not ( = ?AUTO_11216 ?AUTO_11210 ) ) ( ON_BOARD ?AUTO_11211 ?AUTO_11212 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11212 ) ( SUPPORTS ?AUTO_11211 ?AUTO_11209 ) ( VISIBLE_FROM ?AUTO_11208 ?AUTO_11210 ) ( CAN_TRAVERSE ?AUTO_11212 ?AUTO_11216 ?AUTO_11210 ) ( VISIBLE ?AUTO_11216 ?AUTO_11210 ) ( CAN_TRAVERSE ?AUTO_11212 ?AUTO_11214 ?AUTO_11216 ) ( VISIBLE ?AUTO_11214 ?AUTO_11216 ) ( CAN_TRAVERSE ?AUTO_11212 ?AUTO_11213 ?AUTO_11214 ) ( AT ?AUTO_11212 ?AUTO_11213 ) ( VISIBLE ?AUTO_11213 ?AUTO_11214 ) ( not ( = ?AUTO_11214 ?AUTO_11213 ) ) ( not ( = ?AUTO_11216 ?AUTO_11213 ) ) ( not ( = ?AUTO_11210 ?AUTO_11213 ) ) ( CALIBRATION_TARGET ?AUTO_11211 ?AUTO_11217 ) ( VISIBLE_FROM ?AUTO_11217 ?AUTO_11213 ) ( not ( = ?AUTO_11208 ?AUTO_11217 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_11212 ?AUTO_11211 ?AUTO_11217 ?AUTO_11213 )
      ( GET_IMAGE_DATA ?AUTO_11208 ?AUTO_11209 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11208 ?AUTO_11209 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11218 - OBJECTIVE
      ?AUTO_11219 - MODE
    )
    :vars
    (
      ?AUTO_11224 - LANDER
      ?AUTO_11227 - WAYPOINT
      ?AUTO_11226 - WAYPOINT
      ?AUTO_11225 - ROVER
      ?AUTO_11220 - WAYPOINT
      ?AUTO_11222 - CAMERA
      ?AUTO_11223 - WAYPOINT
      ?AUTO_11221 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11224 ?AUTO_11227 ) ( VISIBLE ?AUTO_11226 ?AUTO_11227 ) ( AVAILABLE ?AUTO_11225 ) ( CHANNEL_FREE ?AUTO_11224 ) ( not ( = ?AUTO_11226 ?AUTO_11227 ) ) ( CAN_TRAVERSE ?AUTO_11225 ?AUTO_11220 ?AUTO_11226 ) ( VISIBLE ?AUTO_11220 ?AUTO_11226 ) ( not ( = ?AUTO_11227 ?AUTO_11220 ) ) ( not ( = ?AUTO_11226 ?AUTO_11220 ) ) ( ON_BOARD ?AUTO_11222 ?AUTO_11225 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11225 ) ( SUPPORTS ?AUTO_11222 ?AUTO_11219 ) ( VISIBLE_FROM ?AUTO_11218 ?AUTO_11220 ) ( CAN_TRAVERSE ?AUTO_11225 ?AUTO_11226 ?AUTO_11220 ) ( VISIBLE ?AUTO_11226 ?AUTO_11220 ) ( CAN_TRAVERSE ?AUTO_11225 ?AUTO_11227 ?AUTO_11226 ) ( VISIBLE ?AUTO_11227 ?AUTO_11226 ) ( CAN_TRAVERSE ?AUTO_11225 ?AUTO_11223 ?AUTO_11227 ) ( VISIBLE ?AUTO_11223 ?AUTO_11227 ) ( not ( = ?AUTO_11227 ?AUTO_11223 ) ) ( not ( = ?AUTO_11226 ?AUTO_11223 ) ) ( not ( = ?AUTO_11220 ?AUTO_11223 ) ) ( CALIBRATION_TARGET ?AUTO_11222 ?AUTO_11221 ) ( VISIBLE_FROM ?AUTO_11221 ?AUTO_11223 ) ( not ( = ?AUTO_11218 ?AUTO_11221 ) ) ( CAN_TRAVERSE ?AUTO_11225 ?AUTO_11227 ?AUTO_11223 ) ( AT ?AUTO_11225 ?AUTO_11227 ) ( VISIBLE ?AUTO_11227 ?AUTO_11223 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11225 ?AUTO_11227 ?AUTO_11223 )
      ( GET_IMAGE_DATA ?AUTO_11218 ?AUTO_11219 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11218 ?AUTO_11219 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11292 - OBJECTIVE
      ?AUTO_11293 - MODE
    )
    :vars
    (
      ?AUTO_11300 - LANDER
      ?AUTO_11295 - WAYPOINT
      ?AUTO_11298 - WAYPOINT
      ?AUTO_11299 - ROVER
      ?AUTO_11297 - WAYPOINT
      ?AUTO_11296 - CAMERA
      ?AUTO_11301 - OBJECTIVE
      ?AUTO_11294 - WAYPOINT
      ?AUTO_11302 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11300 ?AUTO_11295 ) ( VISIBLE ?AUTO_11298 ?AUTO_11295 ) ( AVAILABLE ?AUTO_11299 ) ( CHANNEL_FREE ?AUTO_11300 ) ( not ( = ?AUTO_11298 ?AUTO_11295 ) ) ( CAN_TRAVERSE ?AUTO_11299 ?AUTO_11297 ?AUTO_11298 ) ( VISIBLE ?AUTO_11297 ?AUTO_11298 ) ( not ( = ?AUTO_11295 ?AUTO_11297 ) ) ( not ( = ?AUTO_11298 ?AUTO_11297 ) ) ( ON_BOARD ?AUTO_11296 ?AUTO_11299 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11299 ) ( SUPPORTS ?AUTO_11296 ?AUTO_11293 ) ( VISIBLE_FROM ?AUTO_11292 ?AUTO_11297 ) ( CALIBRATION_TARGET ?AUTO_11296 ?AUTO_11301 ) ( VISIBLE_FROM ?AUTO_11301 ?AUTO_11297 ) ( not ( = ?AUTO_11292 ?AUTO_11301 ) ) ( CAN_TRAVERSE ?AUTO_11299 ?AUTO_11294 ?AUTO_11297 ) ( VISIBLE ?AUTO_11294 ?AUTO_11297 ) ( not ( = ?AUTO_11295 ?AUTO_11294 ) ) ( not ( = ?AUTO_11298 ?AUTO_11294 ) ) ( not ( = ?AUTO_11297 ?AUTO_11294 ) ) ( CAN_TRAVERSE ?AUTO_11299 ?AUTO_11302 ?AUTO_11294 ) ( AT ?AUTO_11299 ?AUTO_11302 ) ( VISIBLE ?AUTO_11302 ?AUTO_11294 ) ( not ( = ?AUTO_11295 ?AUTO_11302 ) ) ( not ( = ?AUTO_11298 ?AUTO_11302 ) ) ( not ( = ?AUTO_11297 ?AUTO_11302 ) ) ( not ( = ?AUTO_11294 ?AUTO_11302 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11299 ?AUTO_11302 ?AUTO_11294 )
      ( GET_IMAGE_DATA ?AUTO_11292 ?AUTO_11293 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11292 ?AUTO_11293 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11309 - OBJECTIVE
      ?AUTO_11310 - MODE
    )
    :vars
    (
      ?AUTO_11319 - LANDER
      ?AUTO_11318 - WAYPOINT
      ?AUTO_11317 - WAYPOINT
      ?AUTO_11313 - ROVER
      ?AUTO_11315 - WAYPOINT
      ?AUTO_11311 - CAMERA
      ?AUTO_11314 - OBJECTIVE
      ?AUTO_11312 - WAYPOINT
      ?AUTO_11316 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11319 ?AUTO_11318 ) ( VISIBLE ?AUTO_11317 ?AUTO_11318 ) ( AVAILABLE ?AUTO_11313 ) ( CHANNEL_FREE ?AUTO_11319 ) ( not ( = ?AUTO_11317 ?AUTO_11318 ) ) ( CAN_TRAVERSE ?AUTO_11313 ?AUTO_11315 ?AUTO_11317 ) ( VISIBLE ?AUTO_11315 ?AUTO_11317 ) ( not ( = ?AUTO_11318 ?AUTO_11315 ) ) ( not ( = ?AUTO_11317 ?AUTO_11315 ) ) ( ON_BOARD ?AUTO_11311 ?AUTO_11313 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11313 ) ( SUPPORTS ?AUTO_11311 ?AUTO_11310 ) ( VISIBLE_FROM ?AUTO_11309 ?AUTO_11315 ) ( CALIBRATION_TARGET ?AUTO_11311 ?AUTO_11314 ) ( VISIBLE_FROM ?AUTO_11314 ?AUTO_11315 ) ( not ( = ?AUTO_11309 ?AUTO_11314 ) ) ( CAN_TRAVERSE ?AUTO_11313 ?AUTO_11312 ?AUTO_11315 ) ( VISIBLE ?AUTO_11312 ?AUTO_11315 ) ( not ( = ?AUTO_11318 ?AUTO_11312 ) ) ( not ( = ?AUTO_11317 ?AUTO_11312 ) ) ( not ( = ?AUTO_11315 ?AUTO_11312 ) ) ( CAN_TRAVERSE ?AUTO_11313 ?AUTO_11316 ?AUTO_11312 ) ( VISIBLE ?AUTO_11316 ?AUTO_11312 ) ( not ( = ?AUTO_11318 ?AUTO_11316 ) ) ( not ( = ?AUTO_11317 ?AUTO_11316 ) ) ( not ( = ?AUTO_11315 ?AUTO_11316 ) ) ( not ( = ?AUTO_11312 ?AUTO_11316 ) ) ( CAN_TRAVERSE ?AUTO_11313 ?AUTO_11318 ?AUTO_11316 ) ( AT ?AUTO_11313 ?AUTO_11318 ) ( VISIBLE ?AUTO_11318 ?AUTO_11316 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11313 ?AUTO_11318 ?AUTO_11316 )
      ( GET_IMAGE_DATA ?AUTO_11309 ?AUTO_11310 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11309 ?AUTO_11310 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11385 - OBJECTIVE
      ?AUTO_11386 - MODE
    )
    :vars
    (
      ?AUTO_11390 - LANDER
      ?AUTO_11391 - WAYPOINT
      ?AUTO_11388 - WAYPOINT
      ?AUTO_11394 - ROVER
      ?AUTO_11393 - WAYPOINT
      ?AUTO_11387 - CAMERA
      ?AUTO_11392 - WAYPOINT
      ?AUTO_11389 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11390 ?AUTO_11391 ) ( VISIBLE ?AUTO_11388 ?AUTO_11391 ) ( AVAILABLE ?AUTO_11394 ) ( CHANNEL_FREE ?AUTO_11390 ) ( not ( = ?AUTO_11388 ?AUTO_11391 ) ) ( CAN_TRAVERSE ?AUTO_11394 ?AUTO_11393 ?AUTO_11388 ) ( VISIBLE ?AUTO_11393 ?AUTO_11388 ) ( not ( = ?AUTO_11391 ?AUTO_11393 ) ) ( not ( = ?AUTO_11388 ?AUTO_11393 ) ) ( ON_BOARD ?AUTO_11387 ?AUTO_11394 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11394 ) ( SUPPORTS ?AUTO_11387 ?AUTO_11386 ) ( VISIBLE_FROM ?AUTO_11385 ?AUTO_11393 ) ( CALIBRATION_TARGET ?AUTO_11387 ?AUTO_11385 ) ( CAN_TRAVERSE ?AUTO_11394 ?AUTO_11392 ?AUTO_11393 ) ( VISIBLE ?AUTO_11392 ?AUTO_11393 ) ( not ( = ?AUTO_11391 ?AUTO_11392 ) ) ( not ( = ?AUTO_11388 ?AUTO_11392 ) ) ( not ( = ?AUTO_11393 ?AUTO_11392 ) ) ( CAN_TRAVERSE ?AUTO_11394 ?AUTO_11389 ?AUTO_11392 ) ( VISIBLE ?AUTO_11389 ?AUTO_11392 ) ( not ( = ?AUTO_11391 ?AUTO_11389 ) ) ( not ( = ?AUTO_11388 ?AUTO_11389 ) ) ( not ( = ?AUTO_11393 ?AUTO_11389 ) ) ( not ( = ?AUTO_11392 ?AUTO_11389 ) ) ( CAN_TRAVERSE ?AUTO_11394 ?AUTO_11391 ?AUTO_11389 ) ( AT ?AUTO_11394 ?AUTO_11391 ) ( VISIBLE ?AUTO_11391 ?AUTO_11389 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11394 ?AUTO_11391 ?AUTO_11389 )
      ( GET_IMAGE_DATA ?AUTO_11385 ?AUTO_11386 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11385 ?AUTO_11386 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11569 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11570 - LANDER
      ?AUTO_11572 - WAYPOINT
      ?AUTO_11573 - ROVER
      ?AUTO_11571 - STORE
      ?AUTO_11574 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11570 ?AUTO_11569 ) ( VISIBLE ?AUTO_11572 ?AUTO_11569 ) ( AVAILABLE ?AUTO_11573 ) ( CHANNEL_FREE ?AUTO_11570 ) ( not ( = ?AUTO_11569 ?AUTO_11572 ) ) ( CAN_TRAVERSE ?AUTO_11573 ?AUTO_11569 ?AUTO_11572 ) ( VISIBLE ?AUTO_11569 ?AUTO_11572 ) ( AT_SOIL_SAMPLE ?AUTO_11569 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11573 ) ( STORE_OF ?AUTO_11571 ?AUTO_11573 ) ( CAN_TRAVERSE ?AUTO_11573 ?AUTO_11572 ?AUTO_11569 ) ( CAN_TRAVERSE ?AUTO_11573 ?AUTO_11574 ?AUTO_11572 ) ( AT ?AUTO_11573 ?AUTO_11574 ) ( VISIBLE ?AUTO_11574 ?AUTO_11572 ) ( not ( = ?AUTO_11569 ?AUTO_11574 ) ) ( not ( = ?AUTO_11572 ?AUTO_11574 ) ) ( FULL ?AUTO_11571 ) )
    :subtasks
    ( ( !DROP ?AUTO_11573 ?AUTO_11571 )
      ( GET_SOIL_DATA ?AUTO_11569 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11569 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11614 - OBJECTIVE
      ?AUTO_11615 - MODE
    )
    :vars
    (
      ?AUTO_11618 - LANDER
      ?AUTO_11620 - WAYPOINT
      ?AUTO_11616 - ROVER
      ?AUTO_11617 - WAYPOINT
      ?AUTO_11619 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11618 ?AUTO_11620 ) ( HAVE_IMAGE ?AUTO_11616 ?AUTO_11614 ?AUTO_11615 ) ( VISIBLE ?AUTO_11617 ?AUTO_11620 ) ( AVAILABLE ?AUTO_11616 ) ( CHANNEL_FREE ?AUTO_11618 ) ( not ( = ?AUTO_11617 ?AUTO_11620 ) ) ( CAN_TRAVERSE ?AUTO_11616 ?AUTO_11619 ?AUTO_11617 ) ( VISIBLE ?AUTO_11619 ?AUTO_11617 ) ( not ( = ?AUTO_11620 ?AUTO_11619 ) ) ( not ( = ?AUTO_11617 ?AUTO_11619 ) ) ( CAN_TRAVERSE ?AUTO_11616 ?AUTO_11620 ?AUTO_11619 ) ( AT ?AUTO_11616 ?AUTO_11620 ) ( VISIBLE ?AUTO_11620 ?AUTO_11619 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11616 ?AUTO_11620 ?AUTO_11619 )
      ( GET_IMAGE_DATA ?AUTO_11614 ?AUTO_11615 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11614 ?AUTO_11615 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11621 - OBJECTIVE
      ?AUTO_11622 - MODE
    )
    :vars
    (
      ?AUTO_11624 - LANDER
      ?AUTO_11625 - WAYPOINT
      ?AUTO_11623 - WAYPOINT
      ?AUTO_11626 - ROVER
      ?AUTO_11627 - WAYPOINT
      ?AUTO_11628 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11624 ?AUTO_11625 ) ( VISIBLE ?AUTO_11623 ?AUTO_11625 ) ( AVAILABLE ?AUTO_11626 ) ( CHANNEL_FREE ?AUTO_11624 ) ( not ( = ?AUTO_11623 ?AUTO_11625 ) ) ( CAN_TRAVERSE ?AUTO_11626 ?AUTO_11627 ?AUTO_11623 ) ( VISIBLE ?AUTO_11627 ?AUTO_11623 ) ( not ( = ?AUTO_11625 ?AUTO_11627 ) ) ( not ( = ?AUTO_11623 ?AUTO_11627 ) ) ( CAN_TRAVERSE ?AUTO_11626 ?AUTO_11625 ?AUTO_11627 ) ( AT ?AUTO_11626 ?AUTO_11625 ) ( VISIBLE ?AUTO_11625 ?AUTO_11627 ) ( CALIBRATED ?AUTO_11628 ?AUTO_11626 ) ( ON_BOARD ?AUTO_11628 ?AUTO_11626 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11626 ) ( SUPPORTS ?AUTO_11628 ?AUTO_11622 ) ( VISIBLE_FROM ?AUTO_11621 ?AUTO_11625 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_11626 ?AUTO_11625 ?AUTO_11621 ?AUTO_11628 ?AUTO_11622 )
      ( GET_IMAGE_DATA ?AUTO_11621 ?AUTO_11622 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11621 ?AUTO_11622 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11629 - OBJECTIVE
      ?AUTO_11630 - MODE
    )
    :vars
    (
      ?AUTO_11633 - LANDER
      ?AUTO_11635 - WAYPOINT
      ?AUTO_11632 - WAYPOINT
      ?AUTO_11636 - ROVER
      ?AUTO_11634 - WAYPOINT
      ?AUTO_11631 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11633 ?AUTO_11635 ) ( VISIBLE ?AUTO_11632 ?AUTO_11635 ) ( AVAILABLE ?AUTO_11636 ) ( CHANNEL_FREE ?AUTO_11633 ) ( not ( = ?AUTO_11632 ?AUTO_11635 ) ) ( CAN_TRAVERSE ?AUTO_11636 ?AUTO_11634 ?AUTO_11632 ) ( VISIBLE ?AUTO_11634 ?AUTO_11632 ) ( not ( = ?AUTO_11635 ?AUTO_11634 ) ) ( not ( = ?AUTO_11632 ?AUTO_11634 ) ) ( CAN_TRAVERSE ?AUTO_11636 ?AUTO_11635 ?AUTO_11634 ) ( VISIBLE ?AUTO_11635 ?AUTO_11634 ) ( CALIBRATED ?AUTO_11631 ?AUTO_11636 ) ( ON_BOARD ?AUTO_11631 ?AUTO_11636 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11636 ) ( SUPPORTS ?AUTO_11631 ?AUTO_11630 ) ( VISIBLE_FROM ?AUTO_11629 ?AUTO_11635 ) ( CAN_TRAVERSE ?AUTO_11636 ?AUTO_11632 ?AUTO_11635 ) ( AT ?AUTO_11636 ?AUTO_11632 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11636 ?AUTO_11632 ?AUTO_11635 )
      ( GET_IMAGE_DATA ?AUTO_11629 ?AUTO_11630 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11629 ?AUTO_11630 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11667 - OBJECTIVE
      ?AUTO_11668 - MODE
    )
    :vars
    (
      ?AUTO_11671 - LANDER
      ?AUTO_11669 - WAYPOINT
      ?AUTO_11674 - WAYPOINT
      ?AUTO_11673 - ROVER
      ?AUTO_11670 - WAYPOINT
      ?AUTO_11672 - CAMERA
      ?AUTO_11675 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11671 ?AUTO_11669 ) ( VISIBLE ?AUTO_11674 ?AUTO_11669 ) ( AVAILABLE ?AUTO_11673 ) ( CHANNEL_FREE ?AUTO_11671 ) ( not ( = ?AUTO_11674 ?AUTO_11669 ) ) ( CAN_TRAVERSE ?AUTO_11673 ?AUTO_11670 ?AUTO_11674 ) ( VISIBLE ?AUTO_11670 ?AUTO_11674 ) ( not ( = ?AUTO_11669 ?AUTO_11670 ) ) ( not ( = ?AUTO_11674 ?AUTO_11670 ) ) ( CAN_TRAVERSE ?AUTO_11673 ?AUTO_11669 ?AUTO_11670 ) ( VISIBLE ?AUTO_11669 ?AUTO_11670 ) ( CALIBRATED ?AUTO_11672 ?AUTO_11673 ) ( ON_BOARD ?AUTO_11672 ?AUTO_11673 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11673 ) ( SUPPORTS ?AUTO_11672 ?AUTO_11668 ) ( VISIBLE_FROM ?AUTO_11667 ?AUTO_11669 ) ( CAN_TRAVERSE ?AUTO_11673 ?AUTO_11674 ?AUTO_11669 ) ( CAN_TRAVERSE ?AUTO_11673 ?AUTO_11675 ?AUTO_11674 ) ( AT ?AUTO_11673 ?AUTO_11675 ) ( VISIBLE ?AUTO_11675 ?AUTO_11674 ) ( not ( = ?AUTO_11669 ?AUTO_11675 ) ) ( not ( = ?AUTO_11674 ?AUTO_11675 ) ) ( not ( = ?AUTO_11670 ?AUTO_11675 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11673 ?AUTO_11675 ?AUTO_11674 )
      ( GET_IMAGE_DATA ?AUTO_11667 ?AUTO_11668 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11667 ?AUTO_11668 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11676 - OBJECTIVE
      ?AUTO_11677 - MODE
    )
    :vars
    (
      ?AUTO_11682 - LANDER
      ?AUTO_11680 - WAYPOINT
      ?AUTO_11678 - WAYPOINT
      ?AUTO_11684 - ROVER
      ?AUTO_11679 - WAYPOINT
      ?AUTO_11681 - CAMERA
      ?AUTO_11683 - WAYPOINT
      ?AUTO_11685 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11682 ?AUTO_11680 ) ( VISIBLE ?AUTO_11678 ?AUTO_11680 ) ( AVAILABLE ?AUTO_11684 ) ( CHANNEL_FREE ?AUTO_11682 ) ( not ( = ?AUTO_11678 ?AUTO_11680 ) ) ( CAN_TRAVERSE ?AUTO_11684 ?AUTO_11679 ?AUTO_11678 ) ( VISIBLE ?AUTO_11679 ?AUTO_11678 ) ( not ( = ?AUTO_11680 ?AUTO_11679 ) ) ( not ( = ?AUTO_11678 ?AUTO_11679 ) ) ( CAN_TRAVERSE ?AUTO_11684 ?AUTO_11680 ?AUTO_11679 ) ( VISIBLE ?AUTO_11680 ?AUTO_11679 ) ( ON_BOARD ?AUTO_11681 ?AUTO_11684 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11684 ) ( SUPPORTS ?AUTO_11681 ?AUTO_11677 ) ( VISIBLE_FROM ?AUTO_11676 ?AUTO_11680 ) ( CAN_TRAVERSE ?AUTO_11684 ?AUTO_11678 ?AUTO_11680 ) ( CAN_TRAVERSE ?AUTO_11684 ?AUTO_11683 ?AUTO_11678 ) ( AT ?AUTO_11684 ?AUTO_11683 ) ( VISIBLE ?AUTO_11683 ?AUTO_11678 ) ( not ( = ?AUTO_11680 ?AUTO_11683 ) ) ( not ( = ?AUTO_11678 ?AUTO_11683 ) ) ( not ( = ?AUTO_11679 ?AUTO_11683 ) ) ( CALIBRATION_TARGET ?AUTO_11681 ?AUTO_11685 ) ( VISIBLE_FROM ?AUTO_11685 ?AUTO_11683 ) ( not ( = ?AUTO_11676 ?AUTO_11685 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_11684 ?AUTO_11681 ?AUTO_11685 ?AUTO_11683 )
      ( GET_IMAGE_DATA ?AUTO_11676 ?AUTO_11677 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11676 ?AUTO_11677 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11694 - OBJECTIVE
      ?AUTO_11695 - MODE
    )
    :vars
    (
      ?AUTO_11701 - LANDER
      ?AUTO_11703 - WAYPOINT
      ?AUTO_11700 - WAYPOINT
      ?AUTO_11699 - ROVER
      ?AUTO_11697 - WAYPOINT
      ?AUTO_11696 - CAMERA
      ?AUTO_11702 - WAYPOINT
      ?AUTO_11698 - OBJECTIVE
      ?AUTO_11704 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11701 ?AUTO_11703 ) ( VISIBLE ?AUTO_11700 ?AUTO_11703 ) ( AVAILABLE ?AUTO_11699 ) ( CHANNEL_FREE ?AUTO_11701 ) ( not ( = ?AUTO_11700 ?AUTO_11703 ) ) ( CAN_TRAVERSE ?AUTO_11699 ?AUTO_11697 ?AUTO_11700 ) ( VISIBLE ?AUTO_11697 ?AUTO_11700 ) ( not ( = ?AUTO_11703 ?AUTO_11697 ) ) ( not ( = ?AUTO_11700 ?AUTO_11697 ) ) ( CAN_TRAVERSE ?AUTO_11699 ?AUTO_11703 ?AUTO_11697 ) ( VISIBLE ?AUTO_11703 ?AUTO_11697 ) ( ON_BOARD ?AUTO_11696 ?AUTO_11699 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11699 ) ( SUPPORTS ?AUTO_11696 ?AUTO_11695 ) ( VISIBLE_FROM ?AUTO_11694 ?AUTO_11703 ) ( CAN_TRAVERSE ?AUTO_11699 ?AUTO_11700 ?AUTO_11703 ) ( CAN_TRAVERSE ?AUTO_11699 ?AUTO_11702 ?AUTO_11700 ) ( VISIBLE ?AUTO_11702 ?AUTO_11700 ) ( not ( = ?AUTO_11703 ?AUTO_11702 ) ) ( not ( = ?AUTO_11700 ?AUTO_11702 ) ) ( not ( = ?AUTO_11697 ?AUTO_11702 ) ) ( CALIBRATION_TARGET ?AUTO_11696 ?AUTO_11698 ) ( VISIBLE_FROM ?AUTO_11698 ?AUTO_11702 ) ( not ( = ?AUTO_11694 ?AUTO_11698 ) ) ( CAN_TRAVERSE ?AUTO_11699 ?AUTO_11704 ?AUTO_11702 ) ( AT ?AUTO_11699 ?AUTO_11704 ) ( VISIBLE ?AUTO_11704 ?AUTO_11702 ) ( not ( = ?AUTO_11703 ?AUTO_11704 ) ) ( not ( = ?AUTO_11700 ?AUTO_11704 ) ) ( not ( = ?AUTO_11697 ?AUTO_11704 ) ) ( not ( = ?AUTO_11702 ?AUTO_11704 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11699 ?AUTO_11704 ?AUTO_11702 )
      ( GET_IMAGE_DATA ?AUTO_11694 ?AUTO_11695 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11694 ?AUTO_11695 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11705 - OBJECTIVE
      ?AUTO_11706 - MODE
    )
    :vars
    (
      ?AUTO_11715 - LANDER
      ?AUTO_11711 - WAYPOINT
      ?AUTO_11714 - WAYPOINT
      ?AUTO_11709 - ROVER
      ?AUTO_11712 - WAYPOINT
      ?AUTO_11710 - CAMERA
      ?AUTO_11713 - WAYPOINT
      ?AUTO_11708 - OBJECTIVE
      ?AUTO_11707 - WAYPOINT
      ?AUTO_11716 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11715 ?AUTO_11711 ) ( VISIBLE ?AUTO_11714 ?AUTO_11711 ) ( AVAILABLE ?AUTO_11709 ) ( CHANNEL_FREE ?AUTO_11715 ) ( not ( = ?AUTO_11714 ?AUTO_11711 ) ) ( CAN_TRAVERSE ?AUTO_11709 ?AUTO_11712 ?AUTO_11714 ) ( VISIBLE ?AUTO_11712 ?AUTO_11714 ) ( not ( = ?AUTO_11711 ?AUTO_11712 ) ) ( not ( = ?AUTO_11714 ?AUTO_11712 ) ) ( CAN_TRAVERSE ?AUTO_11709 ?AUTO_11711 ?AUTO_11712 ) ( VISIBLE ?AUTO_11711 ?AUTO_11712 ) ( ON_BOARD ?AUTO_11710 ?AUTO_11709 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11709 ) ( SUPPORTS ?AUTO_11710 ?AUTO_11706 ) ( VISIBLE_FROM ?AUTO_11705 ?AUTO_11711 ) ( CAN_TRAVERSE ?AUTO_11709 ?AUTO_11714 ?AUTO_11711 ) ( CAN_TRAVERSE ?AUTO_11709 ?AUTO_11713 ?AUTO_11714 ) ( VISIBLE ?AUTO_11713 ?AUTO_11714 ) ( not ( = ?AUTO_11711 ?AUTO_11713 ) ) ( not ( = ?AUTO_11714 ?AUTO_11713 ) ) ( not ( = ?AUTO_11712 ?AUTO_11713 ) ) ( CALIBRATION_TARGET ?AUTO_11710 ?AUTO_11708 ) ( VISIBLE_FROM ?AUTO_11708 ?AUTO_11713 ) ( not ( = ?AUTO_11705 ?AUTO_11708 ) ) ( CAN_TRAVERSE ?AUTO_11709 ?AUTO_11707 ?AUTO_11713 ) ( VISIBLE ?AUTO_11707 ?AUTO_11713 ) ( not ( = ?AUTO_11711 ?AUTO_11707 ) ) ( not ( = ?AUTO_11714 ?AUTO_11707 ) ) ( not ( = ?AUTO_11712 ?AUTO_11707 ) ) ( not ( = ?AUTO_11713 ?AUTO_11707 ) ) ( CAN_TRAVERSE ?AUTO_11709 ?AUTO_11716 ?AUTO_11707 ) ( AT ?AUTO_11709 ?AUTO_11716 ) ( VISIBLE ?AUTO_11716 ?AUTO_11707 ) ( not ( = ?AUTO_11711 ?AUTO_11716 ) ) ( not ( = ?AUTO_11714 ?AUTO_11716 ) ) ( not ( = ?AUTO_11712 ?AUTO_11716 ) ) ( not ( = ?AUTO_11713 ?AUTO_11716 ) ) ( not ( = ?AUTO_11707 ?AUTO_11716 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11709 ?AUTO_11716 ?AUTO_11707 )
      ( GET_IMAGE_DATA ?AUTO_11705 ?AUTO_11706 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11705 ?AUTO_11706 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11723 - OBJECTIVE
      ?AUTO_11724 - MODE
    )
    :vars
    (
      ?AUTO_11732 - LANDER
      ?AUTO_11729 - WAYPOINT
      ?AUTO_11728 - WAYPOINT
      ?AUTO_11734 - ROVER
      ?AUTO_11726 - WAYPOINT
      ?AUTO_11727 - CAMERA
      ?AUTO_11730 - WAYPOINT
      ?AUTO_11733 - OBJECTIVE
      ?AUTO_11725 - WAYPOINT
      ?AUTO_11731 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11732 ?AUTO_11729 ) ( VISIBLE ?AUTO_11728 ?AUTO_11729 ) ( AVAILABLE ?AUTO_11734 ) ( CHANNEL_FREE ?AUTO_11732 ) ( not ( = ?AUTO_11728 ?AUTO_11729 ) ) ( CAN_TRAVERSE ?AUTO_11734 ?AUTO_11726 ?AUTO_11728 ) ( VISIBLE ?AUTO_11726 ?AUTO_11728 ) ( not ( = ?AUTO_11729 ?AUTO_11726 ) ) ( not ( = ?AUTO_11728 ?AUTO_11726 ) ) ( CAN_TRAVERSE ?AUTO_11734 ?AUTO_11729 ?AUTO_11726 ) ( VISIBLE ?AUTO_11729 ?AUTO_11726 ) ( ON_BOARD ?AUTO_11727 ?AUTO_11734 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11734 ) ( SUPPORTS ?AUTO_11727 ?AUTO_11724 ) ( VISIBLE_FROM ?AUTO_11723 ?AUTO_11729 ) ( CAN_TRAVERSE ?AUTO_11734 ?AUTO_11728 ?AUTO_11729 ) ( CAN_TRAVERSE ?AUTO_11734 ?AUTO_11730 ?AUTO_11728 ) ( VISIBLE ?AUTO_11730 ?AUTO_11728 ) ( not ( = ?AUTO_11729 ?AUTO_11730 ) ) ( not ( = ?AUTO_11728 ?AUTO_11730 ) ) ( not ( = ?AUTO_11726 ?AUTO_11730 ) ) ( CALIBRATION_TARGET ?AUTO_11727 ?AUTO_11733 ) ( VISIBLE_FROM ?AUTO_11733 ?AUTO_11730 ) ( not ( = ?AUTO_11723 ?AUTO_11733 ) ) ( CAN_TRAVERSE ?AUTO_11734 ?AUTO_11725 ?AUTO_11730 ) ( VISIBLE ?AUTO_11725 ?AUTO_11730 ) ( not ( = ?AUTO_11729 ?AUTO_11725 ) ) ( not ( = ?AUTO_11728 ?AUTO_11725 ) ) ( not ( = ?AUTO_11726 ?AUTO_11725 ) ) ( not ( = ?AUTO_11730 ?AUTO_11725 ) ) ( CAN_TRAVERSE ?AUTO_11734 ?AUTO_11731 ?AUTO_11725 ) ( VISIBLE ?AUTO_11731 ?AUTO_11725 ) ( not ( = ?AUTO_11729 ?AUTO_11731 ) ) ( not ( = ?AUTO_11728 ?AUTO_11731 ) ) ( not ( = ?AUTO_11726 ?AUTO_11731 ) ) ( not ( = ?AUTO_11730 ?AUTO_11731 ) ) ( not ( = ?AUTO_11725 ?AUTO_11731 ) ) ( CAN_TRAVERSE ?AUTO_11734 ?AUTO_11729 ?AUTO_11731 ) ( AT ?AUTO_11734 ?AUTO_11729 ) ( VISIBLE ?AUTO_11729 ?AUTO_11731 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11734 ?AUTO_11729 ?AUTO_11731 )
      ( GET_IMAGE_DATA ?AUTO_11723 ?AUTO_11724 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11723 ?AUTO_11724 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11802 - OBJECTIVE
      ?AUTO_11803 - MODE
    )
    :vars
    (
      ?AUTO_11806 - LANDER
      ?AUTO_11811 - WAYPOINT
      ?AUTO_11808 - WAYPOINT
      ?AUTO_11810 - ROVER
      ?AUTO_11807 - CAMERA
      ?AUTO_11809 - WAYPOINT
      ?AUTO_11804 - WAYPOINT
      ?AUTO_11805 - OBJECTIVE
      ?AUTO_11812 - WAYPOINT
      ?AUTO_11813 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11806 ?AUTO_11811 ) ( VISIBLE ?AUTO_11808 ?AUTO_11811 ) ( AVAILABLE ?AUTO_11810 ) ( CHANNEL_FREE ?AUTO_11806 ) ( not ( = ?AUTO_11808 ?AUTO_11811 ) ) ( CAN_TRAVERSE ?AUTO_11810 ?AUTO_11811 ?AUTO_11808 ) ( VISIBLE ?AUTO_11811 ?AUTO_11808 ) ( ON_BOARD ?AUTO_11807 ?AUTO_11810 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11810 ) ( SUPPORTS ?AUTO_11807 ?AUTO_11803 ) ( VISIBLE_FROM ?AUTO_11802 ?AUTO_11811 ) ( CAN_TRAVERSE ?AUTO_11810 ?AUTO_11809 ?AUTO_11811 ) ( VISIBLE ?AUTO_11809 ?AUTO_11811 ) ( not ( = ?AUTO_11811 ?AUTO_11809 ) ) ( not ( = ?AUTO_11808 ?AUTO_11809 ) ) ( CAN_TRAVERSE ?AUTO_11810 ?AUTO_11804 ?AUTO_11809 ) ( VISIBLE ?AUTO_11804 ?AUTO_11809 ) ( not ( = ?AUTO_11811 ?AUTO_11804 ) ) ( not ( = ?AUTO_11808 ?AUTO_11804 ) ) ( not ( = ?AUTO_11809 ?AUTO_11804 ) ) ( CALIBRATION_TARGET ?AUTO_11807 ?AUTO_11805 ) ( VISIBLE_FROM ?AUTO_11805 ?AUTO_11804 ) ( not ( = ?AUTO_11802 ?AUTO_11805 ) ) ( CAN_TRAVERSE ?AUTO_11810 ?AUTO_11812 ?AUTO_11804 ) ( VISIBLE ?AUTO_11812 ?AUTO_11804 ) ( not ( = ?AUTO_11811 ?AUTO_11812 ) ) ( not ( = ?AUTO_11808 ?AUTO_11812 ) ) ( not ( = ?AUTO_11809 ?AUTO_11812 ) ) ( not ( = ?AUTO_11804 ?AUTO_11812 ) ) ( CAN_TRAVERSE ?AUTO_11810 ?AUTO_11813 ?AUTO_11812 ) ( AT ?AUTO_11810 ?AUTO_11813 ) ( VISIBLE ?AUTO_11813 ?AUTO_11812 ) ( not ( = ?AUTO_11811 ?AUTO_11813 ) ) ( not ( = ?AUTO_11808 ?AUTO_11813 ) ) ( not ( = ?AUTO_11809 ?AUTO_11813 ) ) ( not ( = ?AUTO_11804 ?AUTO_11813 ) ) ( not ( = ?AUTO_11812 ?AUTO_11813 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11810 ?AUTO_11813 ?AUTO_11812 )
      ( GET_IMAGE_DATA ?AUTO_11802 ?AUTO_11803 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11802 ?AUTO_11803 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11814 - OBJECTIVE
      ?AUTO_11815 - MODE
    )
    :vars
    (
      ?AUTO_11822 - LANDER
      ?AUTO_11819 - WAYPOINT
      ?AUTO_11821 - WAYPOINT
      ?AUTO_11824 - ROVER
      ?AUTO_11818 - CAMERA
      ?AUTO_11823 - WAYPOINT
      ?AUTO_11820 - WAYPOINT
      ?AUTO_11816 - OBJECTIVE
      ?AUTO_11817 - WAYPOINT
      ?AUTO_11825 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11822 ?AUTO_11819 ) ( VISIBLE ?AUTO_11821 ?AUTO_11819 ) ( AVAILABLE ?AUTO_11824 ) ( CHANNEL_FREE ?AUTO_11822 ) ( not ( = ?AUTO_11821 ?AUTO_11819 ) ) ( CAN_TRAVERSE ?AUTO_11824 ?AUTO_11819 ?AUTO_11821 ) ( VISIBLE ?AUTO_11819 ?AUTO_11821 ) ( ON_BOARD ?AUTO_11818 ?AUTO_11824 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11824 ) ( SUPPORTS ?AUTO_11818 ?AUTO_11815 ) ( VISIBLE_FROM ?AUTO_11814 ?AUTO_11819 ) ( CAN_TRAVERSE ?AUTO_11824 ?AUTO_11823 ?AUTO_11819 ) ( VISIBLE ?AUTO_11823 ?AUTO_11819 ) ( not ( = ?AUTO_11819 ?AUTO_11823 ) ) ( not ( = ?AUTO_11821 ?AUTO_11823 ) ) ( CAN_TRAVERSE ?AUTO_11824 ?AUTO_11820 ?AUTO_11823 ) ( VISIBLE ?AUTO_11820 ?AUTO_11823 ) ( not ( = ?AUTO_11819 ?AUTO_11820 ) ) ( not ( = ?AUTO_11821 ?AUTO_11820 ) ) ( not ( = ?AUTO_11823 ?AUTO_11820 ) ) ( CALIBRATION_TARGET ?AUTO_11818 ?AUTO_11816 ) ( VISIBLE_FROM ?AUTO_11816 ?AUTO_11820 ) ( not ( = ?AUTO_11814 ?AUTO_11816 ) ) ( CAN_TRAVERSE ?AUTO_11824 ?AUTO_11817 ?AUTO_11820 ) ( VISIBLE ?AUTO_11817 ?AUTO_11820 ) ( not ( = ?AUTO_11819 ?AUTO_11817 ) ) ( not ( = ?AUTO_11821 ?AUTO_11817 ) ) ( not ( = ?AUTO_11823 ?AUTO_11817 ) ) ( not ( = ?AUTO_11820 ?AUTO_11817 ) ) ( CAN_TRAVERSE ?AUTO_11824 ?AUTO_11825 ?AUTO_11817 ) ( VISIBLE ?AUTO_11825 ?AUTO_11817 ) ( not ( = ?AUTO_11819 ?AUTO_11825 ) ) ( not ( = ?AUTO_11821 ?AUTO_11825 ) ) ( not ( = ?AUTO_11823 ?AUTO_11825 ) ) ( not ( = ?AUTO_11820 ?AUTO_11825 ) ) ( not ( = ?AUTO_11817 ?AUTO_11825 ) ) ( CAN_TRAVERSE ?AUTO_11824 ?AUTO_11819 ?AUTO_11825 ) ( AT ?AUTO_11824 ?AUTO_11819 ) ( VISIBLE ?AUTO_11819 ?AUTO_11825 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11824 ?AUTO_11819 ?AUTO_11825 )
      ( GET_IMAGE_DATA ?AUTO_11814 ?AUTO_11815 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11814 ?AUTO_11815 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11898 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11902 - LANDER
      ?AUTO_11900 - WAYPOINT
      ?AUTO_11899 - ROVER
      ?AUTO_11901 - WAYPOINT
      ?AUTO_11903 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11902 ?AUTO_11900 ) ( HAVE_SOIL_ANALYSIS ?AUTO_11899 ?AUTO_11898 ) ( VISIBLE ?AUTO_11901 ?AUTO_11900 ) ( AVAILABLE ?AUTO_11899 ) ( CHANNEL_FREE ?AUTO_11902 ) ( not ( = ?AUTO_11898 ?AUTO_11901 ) ) ( not ( = ?AUTO_11898 ?AUTO_11900 ) ) ( not ( = ?AUTO_11901 ?AUTO_11900 ) ) ( CAN_TRAVERSE ?AUTO_11899 ?AUTO_11898 ?AUTO_11901 ) ( VISIBLE ?AUTO_11898 ?AUTO_11901 ) ( CAN_TRAVERSE ?AUTO_11899 ?AUTO_11903 ?AUTO_11898 ) ( AT ?AUTO_11899 ?AUTO_11903 ) ( VISIBLE ?AUTO_11903 ?AUTO_11898 ) ( not ( = ?AUTO_11898 ?AUTO_11903 ) ) ( not ( = ?AUTO_11900 ?AUTO_11903 ) ) ( not ( = ?AUTO_11901 ?AUTO_11903 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11899 ?AUTO_11903 ?AUTO_11898 )
      ( GET_SOIL_DATA ?AUTO_11898 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11898 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12128 - OBJECTIVE
      ?AUTO_12129 - MODE
    )
    :vars
    (
      ?AUTO_12131 - LANDER
      ?AUTO_12132 - WAYPOINT
      ?AUTO_12136 - WAYPOINT
      ?AUTO_12137 - ROVER
      ?AUTO_12135 - WAYPOINT
      ?AUTO_12130 - WAYPOINT
      ?AUTO_12134 - CAMERA
      ?AUTO_12133 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12131 ?AUTO_12132 ) ( VISIBLE ?AUTO_12136 ?AUTO_12132 ) ( AVAILABLE ?AUTO_12137 ) ( CHANNEL_FREE ?AUTO_12131 ) ( not ( = ?AUTO_12136 ?AUTO_12132 ) ) ( CAN_TRAVERSE ?AUTO_12137 ?AUTO_12135 ?AUTO_12136 ) ( VISIBLE ?AUTO_12135 ?AUTO_12136 ) ( not ( = ?AUTO_12132 ?AUTO_12135 ) ) ( not ( = ?AUTO_12136 ?AUTO_12135 ) ) ( CAN_TRAVERSE ?AUTO_12137 ?AUTO_12130 ?AUTO_12135 ) ( VISIBLE ?AUTO_12130 ?AUTO_12135 ) ( not ( = ?AUTO_12132 ?AUTO_12130 ) ) ( not ( = ?AUTO_12136 ?AUTO_12130 ) ) ( not ( = ?AUTO_12135 ?AUTO_12130 ) ) ( ON_BOARD ?AUTO_12134 ?AUTO_12137 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12137 ) ( SUPPORTS ?AUTO_12134 ?AUTO_12129 ) ( VISIBLE_FROM ?AUTO_12128 ?AUTO_12130 ) ( CAN_TRAVERSE ?AUTO_12137 ?AUTO_12135 ?AUTO_12130 ) ( VISIBLE ?AUTO_12135 ?AUTO_12130 ) ( CALIBRATION_TARGET ?AUTO_12134 ?AUTO_12133 ) ( VISIBLE_FROM ?AUTO_12133 ?AUTO_12135 ) ( not ( = ?AUTO_12128 ?AUTO_12133 ) ) ( CAN_TRAVERSE ?AUTO_12137 ?AUTO_12136 ?AUTO_12135 ) ( AT ?AUTO_12137 ?AUTO_12136 ) ( VISIBLE ?AUTO_12136 ?AUTO_12135 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12137 ?AUTO_12136 ?AUTO_12135 )
      ( GET_IMAGE_DATA ?AUTO_12128 ?AUTO_12129 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12128 ?AUTO_12129 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12156 - OBJECTIVE
      ?AUTO_12157 - MODE
    )
    :vars
    (
      ?AUTO_12163 - LANDER
      ?AUTO_12162 - WAYPOINT
      ?AUTO_12164 - WAYPOINT
      ?AUTO_12160 - ROVER
      ?AUTO_12158 - WAYPOINT
      ?AUTO_12161 - WAYPOINT
      ?AUTO_12159 - CAMERA
      ?AUTO_12165 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12163 ?AUTO_12162 ) ( VISIBLE ?AUTO_12164 ?AUTO_12162 ) ( AVAILABLE ?AUTO_12160 ) ( CHANNEL_FREE ?AUTO_12163 ) ( not ( = ?AUTO_12164 ?AUTO_12162 ) ) ( CAN_TRAVERSE ?AUTO_12160 ?AUTO_12158 ?AUTO_12164 ) ( VISIBLE ?AUTO_12158 ?AUTO_12164 ) ( not ( = ?AUTO_12162 ?AUTO_12158 ) ) ( not ( = ?AUTO_12164 ?AUTO_12158 ) ) ( CAN_TRAVERSE ?AUTO_12160 ?AUTO_12161 ?AUTO_12158 ) ( VISIBLE ?AUTO_12161 ?AUTO_12158 ) ( not ( = ?AUTO_12162 ?AUTO_12161 ) ) ( not ( = ?AUTO_12164 ?AUTO_12161 ) ) ( not ( = ?AUTO_12158 ?AUTO_12161 ) ) ( ON_BOARD ?AUTO_12159 ?AUTO_12160 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12160 ) ( SUPPORTS ?AUTO_12159 ?AUTO_12157 ) ( VISIBLE_FROM ?AUTO_12156 ?AUTO_12161 ) ( CAN_TRAVERSE ?AUTO_12160 ?AUTO_12158 ?AUTO_12161 ) ( VISIBLE ?AUTO_12158 ?AUTO_12161 ) ( CALIBRATION_TARGET ?AUTO_12159 ?AUTO_12165 ) ( VISIBLE_FROM ?AUTO_12165 ?AUTO_12158 ) ( not ( = ?AUTO_12156 ?AUTO_12165 ) ) ( CAN_TRAVERSE ?AUTO_12160 ?AUTO_12164 ?AUTO_12158 ) ( VISIBLE ?AUTO_12164 ?AUTO_12158 ) ( CAN_TRAVERSE ?AUTO_12160 ?AUTO_12162 ?AUTO_12164 ) ( AT ?AUTO_12160 ?AUTO_12162 ) ( VISIBLE ?AUTO_12162 ?AUTO_12164 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12160 ?AUTO_12162 ?AUTO_12164 )
      ( GET_IMAGE_DATA ?AUTO_12156 ?AUTO_12157 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12156 ?AUTO_12157 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12232 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12234 - LANDER
      ?AUTO_12237 - WAYPOINT
      ?AUTO_12236 - WAYPOINT
      ?AUTO_12235 - ROVER
      ?AUTO_12233 - STORE
      ?AUTO_12238 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12234 ?AUTO_12237 ) ( VISIBLE ?AUTO_12236 ?AUTO_12237 ) ( AVAILABLE ?AUTO_12235 ) ( CHANNEL_FREE ?AUTO_12234 ) ( not ( = ?AUTO_12232 ?AUTO_12236 ) ) ( not ( = ?AUTO_12232 ?AUTO_12237 ) ) ( not ( = ?AUTO_12236 ?AUTO_12237 ) ) ( CAN_TRAVERSE ?AUTO_12235 ?AUTO_12232 ?AUTO_12236 ) ( VISIBLE ?AUTO_12232 ?AUTO_12236 ) ( AT_SOIL_SAMPLE ?AUTO_12232 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12235 ) ( STORE_OF ?AUTO_12233 ?AUTO_12235 ) ( CAN_TRAVERSE ?AUTO_12235 ?AUTO_12238 ?AUTO_12232 ) ( AT ?AUTO_12235 ?AUTO_12238 ) ( VISIBLE ?AUTO_12238 ?AUTO_12232 ) ( not ( = ?AUTO_12232 ?AUTO_12238 ) ) ( not ( = ?AUTO_12237 ?AUTO_12238 ) ) ( not ( = ?AUTO_12236 ?AUTO_12238 ) ) ( AT_ROCK_SAMPLE ?AUTO_12238 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12235 ) ( EMPTY ?AUTO_12233 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_12235 ?AUTO_12233 ?AUTO_12238 )
      ( GET_SOIL_DATA ?AUTO_12232 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12232 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12246 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12247 - LANDER
      ?AUTO_12249 - WAYPOINT
      ?AUTO_12250 - WAYPOINT
      ?AUTO_12252 - ROVER
      ?AUTO_12251 - STORE
      ?AUTO_12248 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12247 ?AUTO_12249 ) ( VISIBLE ?AUTO_12250 ?AUTO_12249 ) ( AVAILABLE ?AUTO_12252 ) ( CHANNEL_FREE ?AUTO_12247 ) ( not ( = ?AUTO_12246 ?AUTO_12250 ) ) ( not ( = ?AUTO_12246 ?AUTO_12249 ) ) ( not ( = ?AUTO_12250 ?AUTO_12249 ) ) ( CAN_TRAVERSE ?AUTO_12252 ?AUTO_12246 ?AUTO_12250 ) ( VISIBLE ?AUTO_12246 ?AUTO_12250 ) ( AT_SOIL_SAMPLE ?AUTO_12246 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12252 ) ( STORE_OF ?AUTO_12251 ?AUTO_12252 ) ( CAN_TRAVERSE ?AUTO_12252 ?AUTO_12248 ?AUTO_12246 ) ( VISIBLE ?AUTO_12248 ?AUTO_12246 ) ( not ( = ?AUTO_12246 ?AUTO_12248 ) ) ( not ( = ?AUTO_12249 ?AUTO_12248 ) ) ( not ( = ?AUTO_12250 ?AUTO_12248 ) ) ( AT_ROCK_SAMPLE ?AUTO_12248 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12252 ) ( CAN_TRAVERSE ?AUTO_12252 ?AUTO_12250 ?AUTO_12248 ) ( AT ?AUTO_12252 ?AUTO_12250 ) ( VISIBLE ?AUTO_12250 ?AUTO_12248 ) ( FULL ?AUTO_12251 ) )
    :subtasks
    ( ( !DROP ?AUTO_12252 ?AUTO_12251 )
      ( GET_SOIL_DATA ?AUTO_12246 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12246 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12287 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12289 - LANDER
      ?AUTO_12292 - WAYPOINT
      ?AUTO_12291 - WAYPOINT
      ?AUTO_12290 - ROVER
      ?AUTO_12288 - WAYPOINT
      ?AUTO_12293 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12289 ?AUTO_12292 ) ( VISIBLE ?AUTO_12291 ?AUTO_12292 ) ( AVAILABLE ?AUTO_12290 ) ( CHANNEL_FREE ?AUTO_12289 ) ( not ( = ?AUTO_12287 ?AUTO_12291 ) ) ( not ( = ?AUTO_12287 ?AUTO_12292 ) ) ( not ( = ?AUTO_12291 ?AUTO_12292 ) ) ( CAN_TRAVERSE ?AUTO_12290 ?AUTO_12288 ?AUTO_12291 ) ( VISIBLE ?AUTO_12288 ?AUTO_12291 ) ( not ( = ?AUTO_12287 ?AUTO_12288 ) ) ( not ( = ?AUTO_12292 ?AUTO_12288 ) ) ( not ( = ?AUTO_12291 ?AUTO_12288 ) ) ( CAN_TRAVERSE ?AUTO_12290 ?AUTO_12287 ?AUTO_12288 ) ( VISIBLE ?AUTO_12287 ?AUTO_12288 ) ( AT_ROCK_SAMPLE ?AUTO_12287 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12290 ) ( STORE_OF ?AUTO_12293 ?AUTO_12290 ) ( EMPTY ?AUTO_12293 ) ( CAN_TRAVERSE ?AUTO_12290 ?AUTO_12291 ?AUTO_12287 ) ( AT ?AUTO_12290 ?AUTO_12291 ) ( VISIBLE ?AUTO_12291 ?AUTO_12287 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12290 ?AUTO_12291 ?AUTO_12287 )
      ( GET_ROCK_DATA ?AUTO_12287 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12287 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12294 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12295 - LANDER
      ?AUTO_12299 - WAYPOINT
      ?AUTO_12296 - WAYPOINT
      ?AUTO_12297 - ROVER
      ?AUTO_12298 - WAYPOINT
      ?AUTO_12300 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12295 ?AUTO_12299 ) ( VISIBLE ?AUTO_12296 ?AUTO_12299 ) ( AVAILABLE ?AUTO_12297 ) ( CHANNEL_FREE ?AUTO_12295 ) ( not ( = ?AUTO_12294 ?AUTO_12296 ) ) ( not ( = ?AUTO_12294 ?AUTO_12299 ) ) ( not ( = ?AUTO_12296 ?AUTO_12299 ) ) ( CAN_TRAVERSE ?AUTO_12297 ?AUTO_12298 ?AUTO_12296 ) ( VISIBLE ?AUTO_12298 ?AUTO_12296 ) ( not ( = ?AUTO_12294 ?AUTO_12298 ) ) ( not ( = ?AUTO_12299 ?AUTO_12298 ) ) ( not ( = ?AUTO_12296 ?AUTO_12298 ) ) ( CAN_TRAVERSE ?AUTO_12297 ?AUTO_12294 ?AUTO_12298 ) ( VISIBLE ?AUTO_12294 ?AUTO_12298 ) ( AT_ROCK_SAMPLE ?AUTO_12294 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12297 ) ( STORE_OF ?AUTO_12300 ?AUTO_12297 ) ( CAN_TRAVERSE ?AUTO_12297 ?AUTO_12296 ?AUTO_12294 ) ( AT ?AUTO_12297 ?AUTO_12296 ) ( VISIBLE ?AUTO_12296 ?AUTO_12294 ) ( FULL ?AUTO_12300 ) )
    :subtasks
    ( ( !DROP ?AUTO_12297 ?AUTO_12300 )
      ( GET_ROCK_DATA ?AUTO_12294 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12294 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12340 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12346 - LANDER
      ?AUTO_12345 - WAYPOINT
      ?AUTO_12341 - WAYPOINT
      ?AUTO_12344 - ROVER
      ?AUTO_12342 - WAYPOINT
      ?AUTO_12343 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12346 ?AUTO_12345 ) ( VISIBLE ?AUTO_12341 ?AUTO_12345 ) ( AVAILABLE ?AUTO_12344 ) ( CHANNEL_FREE ?AUTO_12346 ) ( not ( = ?AUTO_12340 ?AUTO_12341 ) ) ( not ( = ?AUTO_12340 ?AUTO_12345 ) ) ( not ( = ?AUTO_12341 ?AUTO_12345 ) ) ( CAN_TRAVERSE ?AUTO_12344 ?AUTO_12342 ?AUTO_12341 ) ( VISIBLE ?AUTO_12342 ?AUTO_12341 ) ( not ( = ?AUTO_12340 ?AUTO_12342 ) ) ( not ( = ?AUTO_12345 ?AUTO_12342 ) ) ( not ( = ?AUTO_12341 ?AUTO_12342 ) ) ( CAN_TRAVERSE ?AUTO_12344 ?AUTO_12340 ?AUTO_12342 ) ( VISIBLE ?AUTO_12340 ?AUTO_12342 ) ( AT_ROCK_SAMPLE ?AUTO_12340 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12344 ) ( STORE_OF ?AUTO_12343 ?AUTO_12344 ) ( EMPTY ?AUTO_12343 ) ( CAN_TRAVERSE ?AUTO_12344 ?AUTO_12341 ?AUTO_12340 ) ( VISIBLE ?AUTO_12341 ?AUTO_12340 ) ( AT ?AUTO_12344 ?AUTO_12342 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12344 ?AUTO_12342 ?AUTO_12341 )
      ( GET_ROCK_DATA ?AUTO_12340 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12340 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12347 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12349 - LANDER
      ?AUTO_12353 - WAYPOINT
      ?AUTO_12348 - WAYPOINT
      ?AUTO_12351 - ROVER
      ?AUTO_12352 - WAYPOINT
      ?AUTO_12350 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12349 ?AUTO_12353 ) ( VISIBLE ?AUTO_12348 ?AUTO_12353 ) ( AVAILABLE ?AUTO_12351 ) ( CHANNEL_FREE ?AUTO_12349 ) ( not ( = ?AUTO_12347 ?AUTO_12348 ) ) ( not ( = ?AUTO_12347 ?AUTO_12353 ) ) ( not ( = ?AUTO_12348 ?AUTO_12353 ) ) ( CAN_TRAVERSE ?AUTO_12351 ?AUTO_12352 ?AUTO_12348 ) ( VISIBLE ?AUTO_12352 ?AUTO_12348 ) ( not ( = ?AUTO_12347 ?AUTO_12352 ) ) ( not ( = ?AUTO_12353 ?AUTO_12352 ) ) ( not ( = ?AUTO_12348 ?AUTO_12352 ) ) ( CAN_TRAVERSE ?AUTO_12351 ?AUTO_12347 ?AUTO_12352 ) ( VISIBLE ?AUTO_12347 ?AUTO_12352 ) ( AT_ROCK_SAMPLE ?AUTO_12347 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12351 ) ( STORE_OF ?AUTO_12350 ?AUTO_12351 ) ( CAN_TRAVERSE ?AUTO_12351 ?AUTO_12348 ?AUTO_12347 ) ( VISIBLE ?AUTO_12348 ?AUTO_12347 ) ( AT ?AUTO_12351 ?AUTO_12352 ) ( FULL ?AUTO_12350 ) )
    :subtasks
    ( ( !DROP ?AUTO_12351 ?AUTO_12350 )
      ( GET_ROCK_DATA ?AUTO_12347 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12347 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12356 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12362 - LANDER
      ?AUTO_12361 - WAYPOINT
      ?AUTO_12360 - WAYPOINT
      ?AUTO_12358 - ROVER
      ?AUTO_12359 - WAYPOINT
      ?AUTO_12357 - STORE
      ?AUTO_12363 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12362 ?AUTO_12361 ) ( VISIBLE ?AUTO_12360 ?AUTO_12361 ) ( AVAILABLE ?AUTO_12358 ) ( CHANNEL_FREE ?AUTO_12362 ) ( not ( = ?AUTO_12356 ?AUTO_12360 ) ) ( not ( = ?AUTO_12356 ?AUTO_12361 ) ) ( not ( = ?AUTO_12360 ?AUTO_12361 ) ) ( CAN_TRAVERSE ?AUTO_12358 ?AUTO_12359 ?AUTO_12360 ) ( VISIBLE ?AUTO_12359 ?AUTO_12360 ) ( not ( = ?AUTO_12356 ?AUTO_12359 ) ) ( not ( = ?AUTO_12361 ?AUTO_12359 ) ) ( not ( = ?AUTO_12360 ?AUTO_12359 ) ) ( CAN_TRAVERSE ?AUTO_12358 ?AUTO_12356 ?AUTO_12359 ) ( VISIBLE ?AUTO_12356 ?AUTO_12359 ) ( AT_ROCK_SAMPLE ?AUTO_12356 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12358 ) ( STORE_OF ?AUTO_12357 ?AUTO_12358 ) ( CAN_TRAVERSE ?AUTO_12358 ?AUTO_12360 ?AUTO_12356 ) ( VISIBLE ?AUTO_12360 ?AUTO_12356 ) ( FULL ?AUTO_12357 ) ( CAN_TRAVERSE ?AUTO_12358 ?AUTO_12363 ?AUTO_12359 ) ( AT ?AUTO_12358 ?AUTO_12363 ) ( VISIBLE ?AUTO_12363 ?AUTO_12359 ) ( not ( = ?AUTO_12356 ?AUTO_12363 ) ) ( not ( = ?AUTO_12361 ?AUTO_12363 ) ) ( not ( = ?AUTO_12360 ?AUTO_12363 ) ) ( not ( = ?AUTO_12359 ?AUTO_12363 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12358 ?AUTO_12363 ?AUTO_12359 )
      ( GET_ROCK_DATA ?AUTO_12356 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12356 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12364 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12366 - LANDER
      ?AUTO_12369 - WAYPOINT
      ?AUTO_12370 - WAYPOINT
      ?AUTO_12365 - ROVER
      ?AUTO_12371 - WAYPOINT
      ?AUTO_12367 - STORE
      ?AUTO_12368 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12366 ?AUTO_12369 ) ( VISIBLE ?AUTO_12370 ?AUTO_12369 ) ( AVAILABLE ?AUTO_12365 ) ( CHANNEL_FREE ?AUTO_12366 ) ( not ( = ?AUTO_12364 ?AUTO_12370 ) ) ( not ( = ?AUTO_12364 ?AUTO_12369 ) ) ( not ( = ?AUTO_12370 ?AUTO_12369 ) ) ( CAN_TRAVERSE ?AUTO_12365 ?AUTO_12371 ?AUTO_12370 ) ( VISIBLE ?AUTO_12371 ?AUTO_12370 ) ( not ( = ?AUTO_12364 ?AUTO_12371 ) ) ( not ( = ?AUTO_12369 ?AUTO_12371 ) ) ( not ( = ?AUTO_12370 ?AUTO_12371 ) ) ( CAN_TRAVERSE ?AUTO_12365 ?AUTO_12364 ?AUTO_12371 ) ( VISIBLE ?AUTO_12364 ?AUTO_12371 ) ( AT_ROCK_SAMPLE ?AUTO_12364 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12365 ) ( STORE_OF ?AUTO_12367 ?AUTO_12365 ) ( CAN_TRAVERSE ?AUTO_12365 ?AUTO_12370 ?AUTO_12364 ) ( VISIBLE ?AUTO_12370 ?AUTO_12364 ) ( CAN_TRAVERSE ?AUTO_12365 ?AUTO_12368 ?AUTO_12371 ) ( AT ?AUTO_12365 ?AUTO_12368 ) ( VISIBLE ?AUTO_12368 ?AUTO_12371 ) ( not ( = ?AUTO_12364 ?AUTO_12368 ) ) ( not ( = ?AUTO_12369 ?AUTO_12368 ) ) ( not ( = ?AUTO_12370 ?AUTO_12368 ) ) ( not ( = ?AUTO_12371 ?AUTO_12368 ) ) ( AT_ROCK_SAMPLE ?AUTO_12368 ) ( EMPTY ?AUTO_12367 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_12365 ?AUTO_12367 ?AUTO_12368 )
      ( GET_ROCK_DATA ?AUTO_12364 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12364 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12427 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12431 - LANDER
      ?AUTO_12429 - WAYPOINT
      ?AUTO_12428 - ROVER
      ?AUTO_12432 - STORE
      ?AUTO_12430 - WAYPOINT
      ?AUTO_12433 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12431 ?AUTO_12429 ) ( VISIBLE ?AUTO_12427 ?AUTO_12429 ) ( AVAILABLE ?AUTO_12428 ) ( CHANNEL_FREE ?AUTO_12431 ) ( not ( = ?AUTO_12427 ?AUTO_12429 ) ) ( AT_ROCK_SAMPLE ?AUTO_12427 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12428 ) ( STORE_OF ?AUTO_12432 ?AUTO_12428 ) ( CAN_TRAVERSE ?AUTO_12428 ?AUTO_12429 ?AUTO_12427 ) ( VISIBLE ?AUTO_12429 ?AUTO_12427 ) ( CAN_TRAVERSE ?AUTO_12428 ?AUTO_12430 ?AUTO_12429 ) ( VISIBLE ?AUTO_12430 ?AUTO_12429 ) ( not ( = ?AUTO_12427 ?AUTO_12430 ) ) ( not ( = ?AUTO_12429 ?AUTO_12430 ) ) ( CAN_TRAVERSE ?AUTO_12428 ?AUTO_12433 ?AUTO_12430 ) ( AT ?AUTO_12428 ?AUTO_12433 ) ( VISIBLE ?AUTO_12433 ?AUTO_12430 ) ( not ( = ?AUTO_12427 ?AUTO_12433 ) ) ( not ( = ?AUTO_12429 ?AUTO_12433 ) ) ( not ( = ?AUTO_12430 ?AUTO_12433 ) ) ( FULL ?AUTO_12432 ) )
    :subtasks
    ( ( !DROP ?AUTO_12428 ?AUTO_12432 )
      ( GET_ROCK_DATA ?AUTO_12427 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12427 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12522 - OBJECTIVE
      ?AUTO_12523 - MODE
    )
    :vars
    (
      ?AUTO_12526 - LANDER
      ?AUTO_12524 - WAYPOINT
      ?AUTO_12527 - WAYPOINT
      ?AUTO_12528 - ROVER
      ?AUTO_12529 - WAYPOINT
      ?AUTO_12525 - CAMERA
      ?AUTO_12530 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12526 ?AUTO_12524 ) ( VISIBLE ?AUTO_12527 ?AUTO_12524 ) ( AVAILABLE ?AUTO_12528 ) ( CHANNEL_FREE ?AUTO_12526 ) ( not ( = ?AUTO_12527 ?AUTO_12524 ) ) ( CAN_TRAVERSE ?AUTO_12528 ?AUTO_12529 ?AUTO_12527 ) ( VISIBLE ?AUTO_12529 ?AUTO_12527 ) ( not ( = ?AUTO_12524 ?AUTO_12529 ) ) ( not ( = ?AUTO_12527 ?AUTO_12529 ) ) ( CALIBRATED ?AUTO_12525 ?AUTO_12528 ) ( ON_BOARD ?AUTO_12525 ?AUTO_12528 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12528 ) ( SUPPORTS ?AUTO_12525 ?AUTO_12523 ) ( VISIBLE_FROM ?AUTO_12522 ?AUTO_12529 ) ( CAN_TRAVERSE ?AUTO_12528 ?AUTO_12530 ?AUTO_12529 ) ( VISIBLE ?AUTO_12530 ?AUTO_12529 ) ( not ( = ?AUTO_12524 ?AUTO_12530 ) ) ( not ( = ?AUTO_12527 ?AUTO_12530 ) ) ( not ( = ?AUTO_12529 ?AUTO_12530 ) ) ( CAN_TRAVERSE ?AUTO_12528 ?AUTO_12524 ?AUTO_12530 ) ( AT ?AUTO_12528 ?AUTO_12524 ) ( VISIBLE ?AUTO_12524 ?AUTO_12530 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12528 ?AUTO_12524 ?AUTO_12530 )
      ( GET_IMAGE_DATA ?AUTO_12522 ?AUTO_12523 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12522 ?AUTO_12523 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12531 - OBJECTIVE
      ?AUTO_12532 - MODE
    )
    :vars
    (
      ?AUTO_12539 - LANDER
      ?AUTO_12533 - WAYPOINT
      ?AUTO_12538 - WAYPOINT
      ?AUTO_12537 - ROVER
      ?AUTO_12535 - WAYPOINT
      ?AUTO_12536 - CAMERA
      ?AUTO_12534 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12539 ?AUTO_12533 ) ( VISIBLE ?AUTO_12538 ?AUTO_12533 ) ( AVAILABLE ?AUTO_12537 ) ( CHANNEL_FREE ?AUTO_12539 ) ( not ( = ?AUTO_12538 ?AUTO_12533 ) ) ( CAN_TRAVERSE ?AUTO_12537 ?AUTO_12535 ?AUTO_12538 ) ( VISIBLE ?AUTO_12535 ?AUTO_12538 ) ( not ( = ?AUTO_12533 ?AUTO_12535 ) ) ( not ( = ?AUTO_12538 ?AUTO_12535 ) ) ( CALIBRATED ?AUTO_12536 ?AUTO_12537 ) ( ON_BOARD ?AUTO_12536 ?AUTO_12537 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12537 ) ( SUPPORTS ?AUTO_12536 ?AUTO_12532 ) ( VISIBLE_FROM ?AUTO_12531 ?AUTO_12535 ) ( CAN_TRAVERSE ?AUTO_12537 ?AUTO_12534 ?AUTO_12535 ) ( VISIBLE ?AUTO_12534 ?AUTO_12535 ) ( not ( = ?AUTO_12533 ?AUTO_12534 ) ) ( not ( = ?AUTO_12538 ?AUTO_12534 ) ) ( not ( = ?AUTO_12535 ?AUTO_12534 ) ) ( CAN_TRAVERSE ?AUTO_12537 ?AUTO_12533 ?AUTO_12534 ) ( VISIBLE ?AUTO_12533 ?AUTO_12534 ) ( CAN_TRAVERSE ?AUTO_12537 ?AUTO_12538 ?AUTO_12533 ) ( AT ?AUTO_12537 ?AUTO_12538 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12537 ?AUTO_12538 ?AUTO_12533 )
      ( GET_IMAGE_DATA ?AUTO_12531 ?AUTO_12532 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12531 ?AUTO_12532 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12540 - OBJECTIVE
      ?AUTO_12541 - MODE
    )
    :vars
    (
      ?AUTO_12546 - LANDER
      ?AUTO_12545 - WAYPOINT
      ?AUTO_12543 - WAYPOINT
      ?AUTO_12547 - ROVER
      ?AUTO_12544 - WAYPOINT
      ?AUTO_12548 - CAMERA
      ?AUTO_12542 - WAYPOINT
      ?AUTO_12549 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12546 ?AUTO_12545 ) ( VISIBLE ?AUTO_12543 ?AUTO_12545 ) ( AVAILABLE ?AUTO_12547 ) ( CHANNEL_FREE ?AUTO_12546 ) ( not ( = ?AUTO_12543 ?AUTO_12545 ) ) ( CAN_TRAVERSE ?AUTO_12547 ?AUTO_12544 ?AUTO_12543 ) ( VISIBLE ?AUTO_12544 ?AUTO_12543 ) ( not ( = ?AUTO_12545 ?AUTO_12544 ) ) ( not ( = ?AUTO_12543 ?AUTO_12544 ) ) ( ON_BOARD ?AUTO_12548 ?AUTO_12547 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12547 ) ( SUPPORTS ?AUTO_12548 ?AUTO_12541 ) ( VISIBLE_FROM ?AUTO_12540 ?AUTO_12544 ) ( CAN_TRAVERSE ?AUTO_12547 ?AUTO_12542 ?AUTO_12544 ) ( VISIBLE ?AUTO_12542 ?AUTO_12544 ) ( not ( = ?AUTO_12545 ?AUTO_12542 ) ) ( not ( = ?AUTO_12543 ?AUTO_12542 ) ) ( not ( = ?AUTO_12544 ?AUTO_12542 ) ) ( CAN_TRAVERSE ?AUTO_12547 ?AUTO_12545 ?AUTO_12542 ) ( VISIBLE ?AUTO_12545 ?AUTO_12542 ) ( CAN_TRAVERSE ?AUTO_12547 ?AUTO_12543 ?AUTO_12545 ) ( AT ?AUTO_12547 ?AUTO_12543 ) ( CALIBRATION_TARGET ?AUTO_12548 ?AUTO_12549 ) ( VISIBLE_FROM ?AUTO_12549 ?AUTO_12543 ) ( not ( = ?AUTO_12540 ?AUTO_12549 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_12547 ?AUTO_12548 ?AUTO_12549 ?AUTO_12543 )
      ( GET_IMAGE_DATA ?AUTO_12540 ?AUTO_12541 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12540 ?AUTO_12541 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12550 - OBJECTIVE
      ?AUTO_12551 - MODE
    )
    :vars
    (
      ?AUTO_12558 - LANDER
      ?AUTO_12554 - WAYPOINT
      ?AUTO_12552 - WAYPOINT
      ?AUTO_12557 - ROVER
      ?AUTO_12559 - WAYPOINT
      ?AUTO_12553 - CAMERA
      ?AUTO_12555 - WAYPOINT
      ?AUTO_12556 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12558 ?AUTO_12554 ) ( VISIBLE ?AUTO_12552 ?AUTO_12554 ) ( AVAILABLE ?AUTO_12557 ) ( CHANNEL_FREE ?AUTO_12558 ) ( not ( = ?AUTO_12552 ?AUTO_12554 ) ) ( CAN_TRAVERSE ?AUTO_12557 ?AUTO_12559 ?AUTO_12552 ) ( VISIBLE ?AUTO_12559 ?AUTO_12552 ) ( not ( = ?AUTO_12554 ?AUTO_12559 ) ) ( not ( = ?AUTO_12552 ?AUTO_12559 ) ) ( ON_BOARD ?AUTO_12553 ?AUTO_12557 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12557 ) ( SUPPORTS ?AUTO_12553 ?AUTO_12551 ) ( VISIBLE_FROM ?AUTO_12550 ?AUTO_12559 ) ( CAN_TRAVERSE ?AUTO_12557 ?AUTO_12555 ?AUTO_12559 ) ( VISIBLE ?AUTO_12555 ?AUTO_12559 ) ( not ( = ?AUTO_12554 ?AUTO_12555 ) ) ( not ( = ?AUTO_12552 ?AUTO_12555 ) ) ( not ( = ?AUTO_12559 ?AUTO_12555 ) ) ( CAN_TRAVERSE ?AUTO_12557 ?AUTO_12554 ?AUTO_12555 ) ( VISIBLE ?AUTO_12554 ?AUTO_12555 ) ( CAN_TRAVERSE ?AUTO_12557 ?AUTO_12552 ?AUTO_12554 ) ( CALIBRATION_TARGET ?AUTO_12553 ?AUTO_12556 ) ( VISIBLE_FROM ?AUTO_12556 ?AUTO_12552 ) ( not ( = ?AUTO_12550 ?AUTO_12556 ) ) ( CAN_TRAVERSE ?AUTO_12557 ?AUTO_12555 ?AUTO_12552 ) ( AT ?AUTO_12557 ?AUTO_12555 ) ( VISIBLE ?AUTO_12555 ?AUTO_12552 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12557 ?AUTO_12555 ?AUTO_12552 )
      ( GET_IMAGE_DATA ?AUTO_12550 ?AUTO_12551 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12550 ?AUTO_12551 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12586 - OBJECTIVE
      ?AUTO_12587 - MODE
    )
    :vars
    (
      ?AUTO_12593 - LANDER
      ?AUTO_12590 - WAYPOINT
      ?AUTO_12592 - WAYPOINT
      ?AUTO_12595 - ROVER
      ?AUTO_12589 - WAYPOINT
      ?AUTO_12591 - CAMERA
      ?AUTO_12594 - WAYPOINT
      ?AUTO_12588 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12593 ?AUTO_12590 ) ( VISIBLE ?AUTO_12592 ?AUTO_12590 ) ( AVAILABLE ?AUTO_12595 ) ( CHANNEL_FREE ?AUTO_12593 ) ( not ( = ?AUTO_12592 ?AUTO_12590 ) ) ( CAN_TRAVERSE ?AUTO_12595 ?AUTO_12589 ?AUTO_12592 ) ( VISIBLE ?AUTO_12589 ?AUTO_12592 ) ( not ( = ?AUTO_12590 ?AUTO_12589 ) ) ( not ( = ?AUTO_12592 ?AUTO_12589 ) ) ( ON_BOARD ?AUTO_12591 ?AUTO_12595 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12595 ) ( SUPPORTS ?AUTO_12591 ?AUTO_12587 ) ( VISIBLE_FROM ?AUTO_12586 ?AUTO_12589 ) ( CAN_TRAVERSE ?AUTO_12595 ?AUTO_12594 ?AUTO_12589 ) ( VISIBLE ?AUTO_12594 ?AUTO_12589 ) ( not ( = ?AUTO_12590 ?AUTO_12594 ) ) ( not ( = ?AUTO_12592 ?AUTO_12594 ) ) ( not ( = ?AUTO_12589 ?AUTO_12594 ) ) ( CAN_TRAVERSE ?AUTO_12595 ?AUTO_12590 ?AUTO_12594 ) ( VISIBLE ?AUTO_12590 ?AUTO_12594 ) ( CAN_TRAVERSE ?AUTO_12595 ?AUTO_12592 ?AUTO_12590 ) ( CALIBRATION_TARGET ?AUTO_12591 ?AUTO_12588 ) ( VISIBLE_FROM ?AUTO_12588 ?AUTO_12592 ) ( not ( = ?AUTO_12586 ?AUTO_12588 ) ) ( CAN_TRAVERSE ?AUTO_12595 ?AUTO_12594 ?AUTO_12592 ) ( VISIBLE ?AUTO_12594 ?AUTO_12592 ) ( AT ?AUTO_12595 ?AUTO_12590 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12595 ?AUTO_12590 ?AUTO_12594 )
      ( GET_IMAGE_DATA ?AUTO_12586 ?AUTO_12587 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12586 ?AUTO_12587 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12658 - OBJECTIVE
      ?AUTO_12659 - MODE
    )
    :vars
    (
      ?AUTO_12665 - LANDER
      ?AUTO_12662 - WAYPOINT
      ?AUTO_12661 - WAYPOINT
      ?AUTO_12660 - ROVER
      ?AUTO_12663 - WAYPOINT
      ?AUTO_12666 - CAMERA
      ?AUTO_12667 - WAYPOINT
      ?AUTO_12664 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12665 ?AUTO_12662 ) ( VISIBLE ?AUTO_12661 ?AUTO_12662 ) ( AVAILABLE ?AUTO_12660 ) ( CHANNEL_FREE ?AUTO_12665 ) ( not ( = ?AUTO_12661 ?AUTO_12662 ) ) ( CAN_TRAVERSE ?AUTO_12660 ?AUTO_12663 ?AUTO_12661 ) ( VISIBLE ?AUTO_12663 ?AUTO_12661 ) ( not ( = ?AUTO_12662 ?AUTO_12663 ) ) ( not ( = ?AUTO_12661 ?AUTO_12663 ) ) ( ON_BOARD ?AUTO_12666 ?AUTO_12660 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12660 ) ( SUPPORTS ?AUTO_12666 ?AUTO_12659 ) ( VISIBLE_FROM ?AUTO_12658 ?AUTO_12663 ) ( CAN_TRAVERSE ?AUTO_12660 ?AUTO_12661 ?AUTO_12663 ) ( VISIBLE ?AUTO_12661 ?AUTO_12663 ) ( CAN_TRAVERSE ?AUTO_12660 ?AUTO_12662 ?AUTO_12661 ) ( VISIBLE ?AUTO_12662 ?AUTO_12661 ) ( CAN_TRAVERSE ?AUTO_12660 ?AUTO_12667 ?AUTO_12662 ) ( VISIBLE ?AUTO_12667 ?AUTO_12662 ) ( not ( = ?AUTO_12662 ?AUTO_12667 ) ) ( not ( = ?AUTO_12661 ?AUTO_12667 ) ) ( not ( = ?AUTO_12663 ?AUTO_12667 ) ) ( CALIBRATION_TARGET ?AUTO_12666 ?AUTO_12664 ) ( VISIBLE_FROM ?AUTO_12664 ?AUTO_12667 ) ( not ( = ?AUTO_12658 ?AUTO_12664 ) ) ( CAN_TRAVERSE ?AUTO_12660 ?AUTO_12663 ?AUTO_12667 ) ( AT ?AUTO_12660 ?AUTO_12663 ) ( VISIBLE ?AUTO_12663 ?AUTO_12667 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12660 ?AUTO_12663 ?AUTO_12667 )
      ( GET_IMAGE_DATA ?AUTO_12658 ?AUTO_12659 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12658 ?AUTO_12659 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12727 - OBJECTIVE
      ?AUTO_12728 - MODE
    )
    :vars
    (
      ?AUTO_12729 - LANDER
      ?AUTO_12732 - WAYPOINT
      ?AUTO_12731 - WAYPOINT
      ?AUTO_12735 - ROVER
      ?AUTO_12730 - CAMERA
      ?AUTO_12733 - WAYPOINT
      ?AUTO_12736 - WAYPOINT
      ?AUTO_12734 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12729 ?AUTO_12732 ) ( VISIBLE ?AUTO_12731 ?AUTO_12732 ) ( AVAILABLE ?AUTO_12735 ) ( CHANNEL_FREE ?AUTO_12729 ) ( not ( = ?AUTO_12731 ?AUTO_12732 ) ) ( CAN_TRAVERSE ?AUTO_12735 ?AUTO_12732 ?AUTO_12731 ) ( VISIBLE ?AUTO_12732 ?AUTO_12731 ) ( ON_BOARD ?AUTO_12730 ?AUTO_12735 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12735 ) ( SUPPORTS ?AUTO_12730 ?AUTO_12728 ) ( VISIBLE_FROM ?AUTO_12727 ?AUTO_12732 ) ( CAN_TRAVERSE ?AUTO_12735 ?AUTO_12731 ?AUTO_12732 ) ( CAN_TRAVERSE ?AUTO_12735 ?AUTO_12733 ?AUTO_12731 ) ( VISIBLE ?AUTO_12733 ?AUTO_12731 ) ( not ( = ?AUTO_12732 ?AUTO_12733 ) ) ( not ( = ?AUTO_12731 ?AUTO_12733 ) ) ( CAN_TRAVERSE ?AUTO_12735 ?AUTO_12736 ?AUTO_12733 ) ( VISIBLE ?AUTO_12736 ?AUTO_12733 ) ( not ( = ?AUTO_12732 ?AUTO_12736 ) ) ( not ( = ?AUTO_12731 ?AUTO_12736 ) ) ( not ( = ?AUTO_12733 ?AUTO_12736 ) ) ( CALIBRATION_TARGET ?AUTO_12730 ?AUTO_12734 ) ( VISIBLE_FROM ?AUTO_12734 ?AUTO_12736 ) ( not ( = ?AUTO_12727 ?AUTO_12734 ) ) ( CAN_TRAVERSE ?AUTO_12735 ?AUTO_12733 ?AUTO_12736 ) ( AT ?AUTO_12735 ?AUTO_12733 ) ( VISIBLE ?AUTO_12733 ?AUTO_12736 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12735 ?AUTO_12733 ?AUTO_12736 )
      ( GET_IMAGE_DATA ?AUTO_12727 ?AUTO_12728 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12727 ?AUTO_12728 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12769 - OBJECTIVE
      ?AUTO_12770 - MODE
    )
    :vars
    (
      ?AUTO_12775 - LANDER
      ?AUTO_12771 - WAYPOINT
      ?AUTO_12774 - WAYPOINT
      ?AUTO_12773 - ROVER
      ?AUTO_12772 - CAMERA
      ?AUTO_12777 - WAYPOINT
      ?AUTO_12776 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12775 ?AUTO_12771 ) ( VISIBLE ?AUTO_12774 ?AUTO_12771 ) ( AVAILABLE ?AUTO_12773 ) ( CHANNEL_FREE ?AUTO_12775 ) ( not ( = ?AUTO_12774 ?AUTO_12771 ) ) ( ON_BOARD ?AUTO_12772 ?AUTO_12773 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12773 ) ( SUPPORTS ?AUTO_12772 ?AUTO_12770 ) ( VISIBLE_FROM ?AUTO_12769 ?AUTO_12774 ) ( CAN_TRAVERSE ?AUTO_12773 ?AUTO_12777 ?AUTO_12774 ) ( VISIBLE ?AUTO_12777 ?AUTO_12774 ) ( not ( = ?AUTO_12771 ?AUTO_12777 ) ) ( not ( = ?AUTO_12774 ?AUTO_12777 ) ) ( CALIBRATION_TARGET ?AUTO_12772 ?AUTO_12776 ) ( VISIBLE_FROM ?AUTO_12776 ?AUTO_12777 ) ( not ( = ?AUTO_12769 ?AUTO_12776 ) ) ( CAN_TRAVERSE ?AUTO_12773 ?AUTO_12771 ?AUTO_12777 ) ( AT ?AUTO_12773 ?AUTO_12771 ) ( VISIBLE ?AUTO_12771 ?AUTO_12777 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12773 ?AUTO_12771 ?AUTO_12777 )
      ( GET_IMAGE_DATA ?AUTO_12769 ?AUTO_12770 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12769 ?AUTO_12770 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12828 - OBJECTIVE
      ?AUTO_12829 - MODE
    )
    :vars
    (
      ?AUTO_12830 - LANDER
      ?AUTO_12834 - WAYPOINT
      ?AUTO_12832 - WAYPOINT
      ?AUTO_12831 - ROVER
      ?AUTO_12836 - WAYPOINT
      ?AUTO_12835 - WAYPOINT
      ?AUTO_12833 - CAMERA
      ?AUTO_12837 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12830 ?AUTO_12834 ) ( VISIBLE ?AUTO_12832 ?AUTO_12834 ) ( AVAILABLE ?AUTO_12831 ) ( CHANNEL_FREE ?AUTO_12830 ) ( not ( = ?AUTO_12832 ?AUTO_12834 ) ) ( CAN_TRAVERSE ?AUTO_12831 ?AUTO_12836 ?AUTO_12832 ) ( VISIBLE ?AUTO_12836 ?AUTO_12832 ) ( not ( = ?AUTO_12834 ?AUTO_12836 ) ) ( not ( = ?AUTO_12832 ?AUTO_12836 ) ) ( CAN_TRAVERSE ?AUTO_12831 ?AUTO_12835 ?AUTO_12836 ) ( VISIBLE ?AUTO_12835 ?AUTO_12836 ) ( not ( = ?AUTO_12834 ?AUTO_12835 ) ) ( not ( = ?AUTO_12832 ?AUTO_12835 ) ) ( not ( = ?AUTO_12836 ?AUTO_12835 ) ) ( ON_BOARD ?AUTO_12833 ?AUTO_12831 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12831 ) ( SUPPORTS ?AUTO_12833 ?AUTO_12829 ) ( VISIBLE_FROM ?AUTO_12828 ?AUTO_12835 ) ( CAN_TRAVERSE ?AUTO_12831 ?AUTO_12836 ?AUTO_12835 ) ( VISIBLE ?AUTO_12836 ?AUTO_12835 ) ( CAN_TRAVERSE ?AUTO_12831 ?AUTO_12832 ?AUTO_12836 ) ( AT ?AUTO_12831 ?AUTO_12832 ) ( VISIBLE ?AUTO_12832 ?AUTO_12836 ) ( CALIBRATION_TARGET ?AUTO_12833 ?AUTO_12837 ) ( VISIBLE_FROM ?AUTO_12837 ?AUTO_12832 ) ( not ( = ?AUTO_12828 ?AUTO_12837 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_12831 ?AUTO_12833 ?AUTO_12837 ?AUTO_12832 )
      ( GET_IMAGE_DATA ?AUTO_12828 ?AUTO_12829 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12828 ?AUTO_12829 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12838 - OBJECTIVE
      ?AUTO_12839 - MODE
    )
    :vars
    (
      ?AUTO_12844 - LANDER
      ?AUTO_12843 - WAYPOINT
      ?AUTO_12846 - WAYPOINT
      ?AUTO_12841 - ROVER
      ?AUTO_12840 - WAYPOINT
      ?AUTO_12845 - WAYPOINT
      ?AUTO_12842 - CAMERA
      ?AUTO_12847 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12844 ?AUTO_12843 ) ( VISIBLE ?AUTO_12846 ?AUTO_12843 ) ( AVAILABLE ?AUTO_12841 ) ( CHANNEL_FREE ?AUTO_12844 ) ( not ( = ?AUTO_12846 ?AUTO_12843 ) ) ( CAN_TRAVERSE ?AUTO_12841 ?AUTO_12840 ?AUTO_12846 ) ( VISIBLE ?AUTO_12840 ?AUTO_12846 ) ( not ( = ?AUTO_12843 ?AUTO_12840 ) ) ( not ( = ?AUTO_12846 ?AUTO_12840 ) ) ( CAN_TRAVERSE ?AUTO_12841 ?AUTO_12845 ?AUTO_12840 ) ( VISIBLE ?AUTO_12845 ?AUTO_12840 ) ( not ( = ?AUTO_12843 ?AUTO_12845 ) ) ( not ( = ?AUTO_12846 ?AUTO_12845 ) ) ( not ( = ?AUTO_12840 ?AUTO_12845 ) ) ( ON_BOARD ?AUTO_12842 ?AUTO_12841 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12841 ) ( SUPPORTS ?AUTO_12842 ?AUTO_12839 ) ( VISIBLE_FROM ?AUTO_12838 ?AUTO_12845 ) ( CAN_TRAVERSE ?AUTO_12841 ?AUTO_12840 ?AUTO_12845 ) ( VISIBLE ?AUTO_12840 ?AUTO_12845 ) ( CAN_TRAVERSE ?AUTO_12841 ?AUTO_12846 ?AUTO_12840 ) ( VISIBLE ?AUTO_12846 ?AUTO_12840 ) ( CALIBRATION_TARGET ?AUTO_12842 ?AUTO_12847 ) ( VISIBLE_FROM ?AUTO_12847 ?AUTO_12846 ) ( not ( = ?AUTO_12838 ?AUTO_12847 ) ) ( AT ?AUTO_12841 ?AUTO_12840 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12841 ?AUTO_12840 ?AUTO_12846 )
      ( GET_IMAGE_DATA ?AUTO_12838 ?AUTO_12839 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12838 ?AUTO_12839 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12922 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12924 - LANDER
      ?AUTO_12927 - WAYPOINT
      ?AUTO_12928 - ROVER
      ?AUTO_12923 - STORE
      ?AUTO_12925 - WAYPOINT
      ?AUTO_12926 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12924 ?AUTO_12927 ) ( VISIBLE ?AUTO_12922 ?AUTO_12927 ) ( AVAILABLE ?AUTO_12928 ) ( CHANNEL_FREE ?AUTO_12924 ) ( not ( = ?AUTO_12922 ?AUTO_12927 ) ) ( AT_ROCK_SAMPLE ?AUTO_12922 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12928 ) ( STORE_OF ?AUTO_12923 ?AUTO_12928 ) ( EMPTY ?AUTO_12923 ) ( CAN_TRAVERSE ?AUTO_12928 ?AUTO_12925 ?AUTO_12922 ) ( VISIBLE ?AUTO_12925 ?AUTO_12922 ) ( not ( = ?AUTO_12922 ?AUTO_12925 ) ) ( not ( = ?AUTO_12927 ?AUTO_12925 ) ) ( CAN_TRAVERSE ?AUTO_12928 ?AUTO_12926 ?AUTO_12925 ) ( VISIBLE ?AUTO_12926 ?AUTO_12925 ) ( not ( = ?AUTO_12922 ?AUTO_12926 ) ) ( not ( = ?AUTO_12927 ?AUTO_12926 ) ) ( not ( = ?AUTO_12925 ?AUTO_12926 ) ) ( CAN_TRAVERSE ?AUTO_12928 ?AUTO_12927 ?AUTO_12926 ) ( AT ?AUTO_12928 ?AUTO_12927 ) ( VISIBLE ?AUTO_12927 ?AUTO_12926 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12928 ?AUTO_12927 ?AUTO_12926 )
      ( GET_ROCK_DATA ?AUTO_12922 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12922 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_12961 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12964 - LANDER
      ?AUTO_12965 - WAYPOINT
      ?AUTO_12967 - WAYPOINT
      ?AUTO_12966 - ROVER
      ?AUTO_12962 - STORE
      ?AUTO_12963 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12964 ?AUTO_12965 ) ( VISIBLE ?AUTO_12967 ?AUTO_12965 ) ( AVAILABLE ?AUTO_12966 ) ( CHANNEL_FREE ?AUTO_12964 ) ( not ( = ?AUTO_12961 ?AUTO_12967 ) ) ( not ( = ?AUTO_12961 ?AUTO_12965 ) ) ( not ( = ?AUTO_12967 ?AUTO_12965 ) ) ( CAN_TRAVERSE ?AUTO_12966 ?AUTO_12961 ?AUTO_12967 ) ( VISIBLE ?AUTO_12961 ?AUTO_12967 ) ( AT_SOIL_SAMPLE ?AUTO_12961 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12966 ) ( STORE_OF ?AUTO_12962 ?AUTO_12966 ) ( EMPTY ?AUTO_12962 ) ( CAN_TRAVERSE ?AUTO_12966 ?AUTO_12963 ?AUTO_12961 ) ( VISIBLE ?AUTO_12963 ?AUTO_12961 ) ( not ( = ?AUTO_12961 ?AUTO_12963 ) ) ( not ( = ?AUTO_12965 ?AUTO_12963 ) ) ( not ( = ?AUTO_12967 ?AUTO_12963 ) ) ( CAN_TRAVERSE ?AUTO_12966 ?AUTO_12965 ?AUTO_12963 ) ( VISIBLE ?AUTO_12965 ?AUTO_12963 ) ( CAN_TRAVERSE ?AUTO_12966 ?AUTO_12967 ?AUTO_12965 ) ( AT ?AUTO_12966 ?AUTO_12967 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12966 ?AUTO_12967 ?AUTO_12965 )
      ( GET_SOIL_DATA ?AUTO_12961 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_12961 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13000 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13001 - LANDER
      ?AUTO_13005 - WAYPOINT
      ?AUTO_13004 - WAYPOINT
      ?AUTO_13002 - ROVER
      ?AUTO_13003 - STORE
      ?AUTO_13006 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13001 ?AUTO_13005 ) ( VISIBLE ?AUTO_13004 ?AUTO_13005 ) ( AVAILABLE ?AUTO_13002 ) ( CHANNEL_FREE ?AUTO_13001 ) ( not ( = ?AUTO_13000 ?AUTO_13004 ) ) ( not ( = ?AUTO_13000 ?AUTO_13005 ) ) ( not ( = ?AUTO_13004 ?AUTO_13005 ) ) ( CAN_TRAVERSE ?AUTO_13002 ?AUTO_13000 ?AUTO_13004 ) ( VISIBLE ?AUTO_13000 ?AUTO_13004 ) ( AT_SOIL_SAMPLE ?AUTO_13000 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13002 ) ( STORE_OF ?AUTO_13003 ?AUTO_13002 ) ( EMPTY ?AUTO_13003 ) ( CAN_TRAVERSE ?AUTO_13002 ?AUTO_13004 ?AUTO_13000 ) ( VISIBLE ?AUTO_13004 ?AUTO_13000 ) ( CAN_TRAVERSE ?AUTO_13002 ?AUTO_13006 ?AUTO_13004 ) ( AT ?AUTO_13002 ?AUTO_13006 ) ( VISIBLE ?AUTO_13006 ?AUTO_13004 ) ( not ( = ?AUTO_13000 ?AUTO_13006 ) ) ( not ( = ?AUTO_13005 ?AUTO_13006 ) ) ( not ( = ?AUTO_13004 ?AUTO_13006 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13002 ?AUTO_13006 ?AUTO_13004 )
      ( GET_SOIL_DATA ?AUTO_13000 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13000 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13007 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13009 - LANDER
      ?AUTO_13012 - WAYPOINT
      ?AUTO_13013 - WAYPOINT
      ?AUTO_13008 - ROVER
      ?AUTO_13011 - STORE
      ?AUTO_13010 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13009 ?AUTO_13012 ) ( VISIBLE ?AUTO_13013 ?AUTO_13012 ) ( AVAILABLE ?AUTO_13008 ) ( CHANNEL_FREE ?AUTO_13009 ) ( not ( = ?AUTO_13007 ?AUTO_13013 ) ) ( not ( = ?AUTO_13007 ?AUTO_13012 ) ) ( not ( = ?AUTO_13013 ?AUTO_13012 ) ) ( CAN_TRAVERSE ?AUTO_13008 ?AUTO_13007 ?AUTO_13013 ) ( VISIBLE ?AUTO_13007 ?AUTO_13013 ) ( AT_SOIL_SAMPLE ?AUTO_13007 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13008 ) ( STORE_OF ?AUTO_13011 ?AUTO_13008 ) ( CAN_TRAVERSE ?AUTO_13008 ?AUTO_13013 ?AUTO_13007 ) ( VISIBLE ?AUTO_13013 ?AUTO_13007 ) ( CAN_TRAVERSE ?AUTO_13008 ?AUTO_13010 ?AUTO_13013 ) ( AT ?AUTO_13008 ?AUTO_13010 ) ( VISIBLE ?AUTO_13010 ?AUTO_13013 ) ( not ( = ?AUTO_13007 ?AUTO_13010 ) ) ( not ( = ?AUTO_13012 ?AUTO_13010 ) ) ( not ( = ?AUTO_13013 ?AUTO_13010 ) ) ( FULL ?AUTO_13011 ) )
    :subtasks
    ( ( !DROP ?AUTO_13008 ?AUTO_13011 )
      ( GET_SOIL_DATA ?AUTO_13007 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13007 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13015 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13016 - LANDER
      ?AUTO_13019 - WAYPOINT
      ?AUTO_13021 - WAYPOINT
      ?AUTO_13018 - ROVER
      ?AUTO_13017 - STORE
      ?AUTO_13020 - WAYPOINT
      ?AUTO_13022 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13016 ?AUTO_13019 ) ( VISIBLE ?AUTO_13021 ?AUTO_13019 ) ( AVAILABLE ?AUTO_13018 ) ( CHANNEL_FREE ?AUTO_13016 ) ( not ( = ?AUTO_13015 ?AUTO_13021 ) ) ( not ( = ?AUTO_13015 ?AUTO_13019 ) ) ( not ( = ?AUTO_13021 ?AUTO_13019 ) ) ( CAN_TRAVERSE ?AUTO_13018 ?AUTO_13015 ?AUTO_13021 ) ( VISIBLE ?AUTO_13015 ?AUTO_13021 ) ( AT_SOIL_SAMPLE ?AUTO_13015 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13018 ) ( STORE_OF ?AUTO_13017 ?AUTO_13018 ) ( EMPTY ?AUTO_13017 ) ( CAN_TRAVERSE ?AUTO_13018 ?AUTO_13021 ?AUTO_13015 ) ( VISIBLE ?AUTO_13021 ?AUTO_13015 ) ( CAN_TRAVERSE ?AUTO_13018 ?AUTO_13020 ?AUTO_13021 ) ( VISIBLE ?AUTO_13020 ?AUTO_13021 ) ( not ( = ?AUTO_13015 ?AUTO_13020 ) ) ( not ( = ?AUTO_13019 ?AUTO_13020 ) ) ( not ( = ?AUTO_13021 ?AUTO_13020 ) ) ( CAN_TRAVERSE ?AUTO_13018 ?AUTO_13022 ?AUTO_13020 ) ( AT ?AUTO_13018 ?AUTO_13022 ) ( VISIBLE ?AUTO_13022 ?AUTO_13020 ) ( not ( = ?AUTO_13015 ?AUTO_13022 ) ) ( not ( = ?AUTO_13019 ?AUTO_13022 ) ) ( not ( = ?AUTO_13021 ?AUTO_13022 ) ) ( not ( = ?AUTO_13020 ?AUTO_13022 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13018 ?AUTO_13022 ?AUTO_13020 )
      ( GET_SOIL_DATA ?AUTO_13015 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13015 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13090 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13095 - LANDER
      ?AUTO_13094 - WAYPOINT
      ?AUTO_13092 - WAYPOINT
      ?AUTO_13096 - ROVER
      ?AUTO_13091 - STORE
      ?AUTO_13093 - WAYPOINT
      ?AUTO_13097 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13095 ?AUTO_13094 ) ( VISIBLE ?AUTO_13092 ?AUTO_13094 ) ( AVAILABLE ?AUTO_13096 ) ( CHANNEL_FREE ?AUTO_13095 ) ( not ( = ?AUTO_13090 ?AUTO_13092 ) ) ( not ( = ?AUTO_13090 ?AUTO_13094 ) ) ( not ( = ?AUTO_13092 ?AUTO_13094 ) ) ( CAN_TRAVERSE ?AUTO_13096 ?AUTO_13090 ?AUTO_13092 ) ( VISIBLE ?AUTO_13090 ?AUTO_13092 ) ( AT_SOIL_SAMPLE ?AUTO_13090 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13096 ) ( STORE_OF ?AUTO_13091 ?AUTO_13096 ) ( CAN_TRAVERSE ?AUTO_13096 ?AUTO_13093 ?AUTO_13090 ) ( VISIBLE ?AUTO_13093 ?AUTO_13090 ) ( not ( = ?AUTO_13090 ?AUTO_13093 ) ) ( not ( = ?AUTO_13094 ?AUTO_13093 ) ) ( not ( = ?AUTO_13092 ?AUTO_13093 ) ) ( CAN_TRAVERSE ?AUTO_13096 ?AUTO_13097 ?AUTO_13093 ) ( AT ?AUTO_13096 ?AUTO_13097 ) ( VISIBLE ?AUTO_13097 ?AUTO_13093 ) ( not ( = ?AUTO_13090 ?AUTO_13097 ) ) ( not ( = ?AUTO_13094 ?AUTO_13097 ) ) ( not ( = ?AUTO_13092 ?AUTO_13097 ) ) ( not ( = ?AUTO_13093 ?AUTO_13097 ) ) ( AT_SOIL_SAMPLE ?AUTO_13097 ) ( EMPTY ?AUTO_13091 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_13096 ?AUTO_13091 ?AUTO_13097 )
      ( GET_SOIL_DATA ?AUTO_13090 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13090 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13138 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13142 - LANDER
      ?AUTO_13140 - WAYPOINT
      ?AUTO_13143 - WAYPOINT
      ?AUTO_13144 - ROVER
      ?AUTO_13139 - WAYPOINT
      ?AUTO_13141 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13142 ?AUTO_13140 ) ( VISIBLE ?AUTO_13143 ?AUTO_13140 ) ( AVAILABLE ?AUTO_13144 ) ( CHANNEL_FREE ?AUTO_13142 ) ( not ( = ?AUTO_13138 ?AUTO_13143 ) ) ( not ( = ?AUTO_13138 ?AUTO_13140 ) ) ( not ( = ?AUTO_13143 ?AUTO_13140 ) ) ( CAN_TRAVERSE ?AUTO_13144 ?AUTO_13139 ?AUTO_13143 ) ( VISIBLE ?AUTO_13139 ?AUTO_13143 ) ( not ( = ?AUTO_13138 ?AUTO_13139 ) ) ( not ( = ?AUTO_13140 ?AUTO_13139 ) ) ( not ( = ?AUTO_13143 ?AUTO_13139 ) ) ( CAN_TRAVERSE ?AUTO_13144 ?AUTO_13138 ?AUTO_13139 ) ( AT ?AUTO_13144 ?AUTO_13138 ) ( VISIBLE ?AUTO_13138 ?AUTO_13139 ) ( AT_SOIL_SAMPLE ?AUTO_13138 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13144 ) ( STORE_OF ?AUTO_13141 ?AUTO_13144 ) ( FULL ?AUTO_13141 ) )
    :subtasks
    ( ( !DROP ?AUTO_13144 ?AUTO_13141 )
      ( GET_SOIL_DATA ?AUTO_13138 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13138 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13145 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13148 - LANDER
      ?AUTO_13146 - WAYPOINT
      ?AUTO_13149 - WAYPOINT
      ?AUTO_13147 - ROVER
      ?AUTO_13151 - WAYPOINT
      ?AUTO_13150 - STORE
      ?AUTO_13152 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13148 ?AUTO_13146 ) ( VISIBLE ?AUTO_13149 ?AUTO_13146 ) ( AVAILABLE ?AUTO_13147 ) ( CHANNEL_FREE ?AUTO_13148 ) ( not ( = ?AUTO_13145 ?AUTO_13149 ) ) ( not ( = ?AUTO_13145 ?AUTO_13146 ) ) ( not ( = ?AUTO_13149 ?AUTO_13146 ) ) ( CAN_TRAVERSE ?AUTO_13147 ?AUTO_13151 ?AUTO_13149 ) ( VISIBLE ?AUTO_13151 ?AUTO_13149 ) ( not ( = ?AUTO_13145 ?AUTO_13151 ) ) ( not ( = ?AUTO_13146 ?AUTO_13151 ) ) ( not ( = ?AUTO_13149 ?AUTO_13151 ) ) ( CAN_TRAVERSE ?AUTO_13147 ?AUTO_13145 ?AUTO_13151 ) ( VISIBLE ?AUTO_13145 ?AUTO_13151 ) ( AT_SOIL_SAMPLE ?AUTO_13145 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13147 ) ( STORE_OF ?AUTO_13150 ?AUTO_13147 ) ( FULL ?AUTO_13150 ) ( CAN_TRAVERSE ?AUTO_13147 ?AUTO_13152 ?AUTO_13145 ) ( AT ?AUTO_13147 ?AUTO_13152 ) ( VISIBLE ?AUTO_13152 ?AUTO_13145 ) ( not ( = ?AUTO_13145 ?AUTO_13152 ) ) ( not ( = ?AUTO_13146 ?AUTO_13152 ) ) ( not ( = ?AUTO_13149 ?AUTO_13152 ) ) ( not ( = ?AUTO_13151 ?AUTO_13152 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13147 ?AUTO_13152 ?AUTO_13145 )
      ( GET_SOIL_DATA ?AUTO_13145 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13145 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13153 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13160 - LANDER
      ?AUTO_13158 - WAYPOINT
      ?AUTO_13156 - WAYPOINT
      ?AUTO_13159 - ROVER
      ?AUTO_13155 - WAYPOINT
      ?AUTO_13157 - STORE
      ?AUTO_13154 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13160 ?AUTO_13158 ) ( VISIBLE ?AUTO_13156 ?AUTO_13158 ) ( AVAILABLE ?AUTO_13159 ) ( CHANNEL_FREE ?AUTO_13160 ) ( not ( = ?AUTO_13153 ?AUTO_13156 ) ) ( not ( = ?AUTO_13153 ?AUTO_13158 ) ) ( not ( = ?AUTO_13156 ?AUTO_13158 ) ) ( CAN_TRAVERSE ?AUTO_13159 ?AUTO_13155 ?AUTO_13156 ) ( VISIBLE ?AUTO_13155 ?AUTO_13156 ) ( not ( = ?AUTO_13153 ?AUTO_13155 ) ) ( not ( = ?AUTO_13158 ?AUTO_13155 ) ) ( not ( = ?AUTO_13156 ?AUTO_13155 ) ) ( CAN_TRAVERSE ?AUTO_13159 ?AUTO_13153 ?AUTO_13155 ) ( VISIBLE ?AUTO_13153 ?AUTO_13155 ) ( AT_SOIL_SAMPLE ?AUTO_13153 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13159 ) ( STORE_OF ?AUTO_13157 ?AUTO_13159 ) ( CAN_TRAVERSE ?AUTO_13159 ?AUTO_13154 ?AUTO_13153 ) ( AT ?AUTO_13159 ?AUTO_13154 ) ( VISIBLE ?AUTO_13154 ?AUTO_13153 ) ( not ( = ?AUTO_13153 ?AUTO_13154 ) ) ( not ( = ?AUTO_13158 ?AUTO_13154 ) ) ( not ( = ?AUTO_13156 ?AUTO_13154 ) ) ( not ( = ?AUTO_13155 ?AUTO_13154 ) ) ( AT_SOIL_SAMPLE ?AUTO_13154 ) ( EMPTY ?AUTO_13157 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_13159 ?AUTO_13157 ?AUTO_13154 )
      ( GET_SOIL_DATA ?AUTO_13153 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13153 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13161 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13162 - LANDER
      ?AUTO_13165 - WAYPOINT
      ?AUTO_13166 - WAYPOINT
      ?AUTO_13168 - ROVER
      ?AUTO_13163 - WAYPOINT
      ?AUTO_13167 - STORE
      ?AUTO_13164 - WAYPOINT
      ?AUTO_13169 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13162 ?AUTO_13165 ) ( VISIBLE ?AUTO_13166 ?AUTO_13165 ) ( AVAILABLE ?AUTO_13168 ) ( CHANNEL_FREE ?AUTO_13162 ) ( not ( = ?AUTO_13161 ?AUTO_13166 ) ) ( not ( = ?AUTO_13161 ?AUTO_13165 ) ) ( not ( = ?AUTO_13166 ?AUTO_13165 ) ) ( CAN_TRAVERSE ?AUTO_13168 ?AUTO_13163 ?AUTO_13166 ) ( VISIBLE ?AUTO_13163 ?AUTO_13166 ) ( not ( = ?AUTO_13161 ?AUTO_13163 ) ) ( not ( = ?AUTO_13165 ?AUTO_13163 ) ) ( not ( = ?AUTO_13166 ?AUTO_13163 ) ) ( CAN_TRAVERSE ?AUTO_13168 ?AUTO_13161 ?AUTO_13163 ) ( VISIBLE ?AUTO_13161 ?AUTO_13163 ) ( AT_SOIL_SAMPLE ?AUTO_13161 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13168 ) ( STORE_OF ?AUTO_13167 ?AUTO_13168 ) ( CAN_TRAVERSE ?AUTO_13168 ?AUTO_13164 ?AUTO_13161 ) ( VISIBLE ?AUTO_13164 ?AUTO_13161 ) ( not ( = ?AUTO_13161 ?AUTO_13164 ) ) ( not ( = ?AUTO_13165 ?AUTO_13164 ) ) ( not ( = ?AUTO_13166 ?AUTO_13164 ) ) ( not ( = ?AUTO_13163 ?AUTO_13164 ) ) ( AT_SOIL_SAMPLE ?AUTO_13164 ) ( EMPTY ?AUTO_13167 ) ( CAN_TRAVERSE ?AUTO_13168 ?AUTO_13169 ?AUTO_13164 ) ( AT ?AUTO_13168 ?AUTO_13169 ) ( VISIBLE ?AUTO_13169 ?AUTO_13164 ) ( not ( = ?AUTO_13161 ?AUTO_13169 ) ) ( not ( = ?AUTO_13165 ?AUTO_13169 ) ) ( not ( = ?AUTO_13166 ?AUTO_13169 ) ) ( not ( = ?AUTO_13163 ?AUTO_13169 ) ) ( not ( = ?AUTO_13164 ?AUTO_13169 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13168 ?AUTO_13169 ?AUTO_13164 )
      ( GET_SOIL_DATA ?AUTO_13161 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13161 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13174 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13176 - LANDER
      ?AUTO_13177 - WAYPOINT
      ?AUTO_13178 - WAYPOINT
      ?AUTO_13175 - ROVER
      ?AUTO_13181 - WAYPOINT
      ?AUTO_13182 - STORE
      ?AUTO_13180 - WAYPOINT
      ?AUTO_13179 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13176 ?AUTO_13177 ) ( VISIBLE ?AUTO_13178 ?AUTO_13177 ) ( AVAILABLE ?AUTO_13175 ) ( CHANNEL_FREE ?AUTO_13176 ) ( not ( = ?AUTO_13174 ?AUTO_13178 ) ) ( not ( = ?AUTO_13174 ?AUTO_13177 ) ) ( not ( = ?AUTO_13178 ?AUTO_13177 ) ) ( CAN_TRAVERSE ?AUTO_13175 ?AUTO_13181 ?AUTO_13178 ) ( VISIBLE ?AUTO_13181 ?AUTO_13178 ) ( not ( = ?AUTO_13174 ?AUTO_13181 ) ) ( not ( = ?AUTO_13177 ?AUTO_13181 ) ) ( not ( = ?AUTO_13178 ?AUTO_13181 ) ) ( CAN_TRAVERSE ?AUTO_13175 ?AUTO_13174 ?AUTO_13181 ) ( VISIBLE ?AUTO_13174 ?AUTO_13181 ) ( AT_SOIL_SAMPLE ?AUTO_13174 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13175 ) ( STORE_OF ?AUTO_13182 ?AUTO_13175 ) ( CAN_TRAVERSE ?AUTO_13175 ?AUTO_13180 ?AUTO_13174 ) ( VISIBLE ?AUTO_13180 ?AUTO_13174 ) ( not ( = ?AUTO_13174 ?AUTO_13180 ) ) ( not ( = ?AUTO_13177 ?AUTO_13180 ) ) ( not ( = ?AUTO_13178 ?AUTO_13180 ) ) ( not ( = ?AUTO_13181 ?AUTO_13180 ) ) ( AT_SOIL_SAMPLE ?AUTO_13180 ) ( EMPTY ?AUTO_13182 ) ( CAN_TRAVERSE ?AUTO_13175 ?AUTO_13179 ?AUTO_13180 ) ( VISIBLE ?AUTO_13179 ?AUTO_13180 ) ( not ( = ?AUTO_13174 ?AUTO_13179 ) ) ( not ( = ?AUTO_13177 ?AUTO_13179 ) ) ( not ( = ?AUTO_13178 ?AUTO_13179 ) ) ( not ( = ?AUTO_13181 ?AUTO_13179 ) ) ( not ( = ?AUTO_13180 ?AUTO_13179 ) ) ( CAN_TRAVERSE ?AUTO_13175 ?AUTO_13177 ?AUTO_13179 ) ( AT ?AUTO_13175 ?AUTO_13177 ) ( VISIBLE ?AUTO_13177 ?AUTO_13179 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13175 ?AUTO_13177 ?AUTO_13179 )
      ( GET_SOIL_DATA ?AUTO_13174 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13174 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13234 - OBJECTIVE
      ?AUTO_13235 - MODE
    )
    :vars
    (
      ?AUTO_13240 - LANDER
      ?AUTO_13237 - WAYPOINT
      ?AUTO_13236 - ROVER
      ?AUTO_13238 - WAYPOINT
      ?AUTO_13241 - WAYPOINT
      ?AUTO_13239 - WAYPOINT
      ?AUTO_13242 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13240 ?AUTO_13237 ) ( HAVE_IMAGE ?AUTO_13236 ?AUTO_13234 ?AUTO_13235 ) ( VISIBLE ?AUTO_13238 ?AUTO_13237 ) ( AVAILABLE ?AUTO_13236 ) ( CHANNEL_FREE ?AUTO_13240 ) ( not ( = ?AUTO_13238 ?AUTO_13237 ) ) ( CAN_TRAVERSE ?AUTO_13236 ?AUTO_13241 ?AUTO_13238 ) ( VISIBLE ?AUTO_13241 ?AUTO_13238 ) ( not ( = ?AUTO_13237 ?AUTO_13241 ) ) ( not ( = ?AUTO_13238 ?AUTO_13241 ) ) ( CAN_TRAVERSE ?AUTO_13236 ?AUTO_13239 ?AUTO_13241 ) ( VISIBLE ?AUTO_13239 ?AUTO_13241 ) ( not ( = ?AUTO_13237 ?AUTO_13239 ) ) ( not ( = ?AUTO_13238 ?AUTO_13239 ) ) ( not ( = ?AUTO_13241 ?AUTO_13239 ) ) ( CAN_TRAVERSE ?AUTO_13236 ?AUTO_13242 ?AUTO_13239 ) ( AT ?AUTO_13236 ?AUTO_13242 ) ( VISIBLE ?AUTO_13242 ?AUTO_13239 ) ( not ( = ?AUTO_13237 ?AUTO_13242 ) ) ( not ( = ?AUTO_13238 ?AUTO_13242 ) ) ( not ( = ?AUTO_13241 ?AUTO_13242 ) ) ( not ( = ?AUTO_13239 ?AUTO_13242 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13236 ?AUTO_13242 ?AUTO_13239 )
      ( GET_IMAGE_DATA ?AUTO_13234 ?AUTO_13235 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13234 ?AUTO_13235 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13243 - OBJECTIVE
      ?AUTO_13244 - MODE
    )
    :vars
    (
      ?AUTO_13245 - LANDER
      ?AUTO_13248 - WAYPOINT
      ?AUTO_13249 - WAYPOINT
      ?AUTO_13247 - ROVER
      ?AUTO_13250 - WAYPOINT
      ?AUTO_13246 - WAYPOINT
      ?AUTO_13251 - WAYPOINT
      ?AUTO_13252 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13245 ?AUTO_13248 ) ( VISIBLE ?AUTO_13249 ?AUTO_13248 ) ( AVAILABLE ?AUTO_13247 ) ( CHANNEL_FREE ?AUTO_13245 ) ( not ( = ?AUTO_13249 ?AUTO_13248 ) ) ( CAN_TRAVERSE ?AUTO_13247 ?AUTO_13250 ?AUTO_13249 ) ( VISIBLE ?AUTO_13250 ?AUTO_13249 ) ( not ( = ?AUTO_13248 ?AUTO_13250 ) ) ( not ( = ?AUTO_13249 ?AUTO_13250 ) ) ( CAN_TRAVERSE ?AUTO_13247 ?AUTO_13246 ?AUTO_13250 ) ( VISIBLE ?AUTO_13246 ?AUTO_13250 ) ( not ( = ?AUTO_13248 ?AUTO_13246 ) ) ( not ( = ?AUTO_13249 ?AUTO_13246 ) ) ( not ( = ?AUTO_13250 ?AUTO_13246 ) ) ( CAN_TRAVERSE ?AUTO_13247 ?AUTO_13251 ?AUTO_13246 ) ( AT ?AUTO_13247 ?AUTO_13251 ) ( VISIBLE ?AUTO_13251 ?AUTO_13246 ) ( not ( = ?AUTO_13248 ?AUTO_13251 ) ) ( not ( = ?AUTO_13249 ?AUTO_13251 ) ) ( not ( = ?AUTO_13250 ?AUTO_13251 ) ) ( not ( = ?AUTO_13246 ?AUTO_13251 ) ) ( CALIBRATED ?AUTO_13252 ?AUTO_13247 ) ( ON_BOARD ?AUTO_13252 ?AUTO_13247 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13247 ) ( SUPPORTS ?AUTO_13252 ?AUTO_13244 ) ( VISIBLE_FROM ?AUTO_13243 ?AUTO_13251 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_13247 ?AUTO_13251 ?AUTO_13243 ?AUTO_13252 ?AUTO_13244 )
      ( GET_IMAGE_DATA ?AUTO_13243 ?AUTO_13244 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13243 ?AUTO_13244 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13253 - OBJECTIVE
      ?AUTO_13254 - MODE
    )
    :vars
    (
      ?AUTO_13256 - LANDER
      ?AUTO_13261 - WAYPOINT
      ?AUTO_13258 - WAYPOINT
      ?AUTO_13257 - ROVER
      ?AUTO_13255 - WAYPOINT
      ?AUTO_13260 - WAYPOINT
      ?AUTO_13259 - WAYPOINT
      ?AUTO_13262 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13256 ?AUTO_13261 ) ( VISIBLE ?AUTO_13258 ?AUTO_13261 ) ( AVAILABLE ?AUTO_13257 ) ( CHANNEL_FREE ?AUTO_13256 ) ( not ( = ?AUTO_13258 ?AUTO_13261 ) ) ( CAN_TRAVERSE ?AUTO_13257 ?AUTO_13255 ?AUTO_13258 ) ( VISIBLE ?AUTO_13255 ?AUTO_13258 ) ( not ( = ?AUTO_13261 ?AUTO_13255 ) ) ( not ( = ?AUTO_13258 ?AUTO_13255 ) ) ( CAN_TRAVERSE ?AUTO_13257 ?AUTO_13260 ?AUTO_13255 ) ( VISIBLE ?AUTO_13260 ?AUTO_13255 ) ( not ( = ?AUTO_13261 ?AUTO_13260 ) ) ( not ( = ?AUTO_13258 ?AUTO_13260 ) ) ( not ( = ?AUTO_13255 ?AUTO_13260 ) ) ( CAN_TRAVERSE ?AUTO_13257 ?AUTO_13259 ?AUTO_13260 ) ( AT ?AUTO_13257 ?AUTO_13259 ) ( VISIBLE ?AUTO_13259 ?AUTO_13260 ) ( not ( = ?AUTO_13261 ?AUTO_13259 ) ) ( not ( = ?AUTO_13258 ?AUTO_13259 ) ) ( not ( = ?AUTO_13255 ?AUTO_13259 ) ) ( not ( = ?AUTO_13260 ?AUTO_13259 ) ) ( ON_BOARD ?AUTO_13262 ?AUTO_13257 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13257 ) ( SUPPORTS ?AUTO_13262 ?AUTO_13254 ) ( VISIBLE_FROM ?AUTO_13253 ?AUTO_13259 ) ( CALIBRATION_TARGET ?AUTO_13262 ?AUTO_13253 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_13257 ?AUTO_13262 ?AUTO_13253 ?AUTO_13259 )
      ( GET_IMAGE_DATA ?AUTO_13253 ?AUTO_13254 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13253 ?AUTO_13254 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13263 - OBJECTIVE
      ?AUTO_13264 - MODE
    )
    :vars
    (
      ?AUTO_13268 - LANDER
      ?AUTO_13265 - WAYPOINT
      ?AUTO_13271 - WAYPOINT
      ?AUTO_13272 - ROVER
      ?AUTO_13267 - WAYPOINT
      ?AUTO_13269 - WAYPOINT
      ?AUTO_13270 - WAYPOINT
      ?AUTO_13266 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13268 ?AUTO_13265 ) ( VISIBLE ?AUTO_13271 ?AUTO_13265 ) ( AVAILABLE ?AUTO_13272 ) ( CHANNEL_FREE ?AUTO_13268 ) ( not ( = ?AUTO_13271 ?AUTO_13265 ) ) ( CAN_TRAVERSE ?AUTO_13272 ?AUTO_13267 ?AUTO_13271 ) ( VISIBLE ?AUTO_13267 ?AUTO_13271 ) ( not ( = ?AUTO_13265 ?AUTO_13267 ) ) ( not ( = ?AUTO_13271 ?AUTO_13267 ) ) ( CAN_TRAVERSE ?AUTO_13272 ?AUTO_13269 ?AUTO_13267 ) ( VISIBLE ?AUTO_13269 ?AUTO_13267 ) ( not ( = ?AUTO_13265 ?AUTO_13269 ) ) ( not ( = ?AUTO_13271 ?AUTO_13269 ) ) ( not ( = ?AUTO_13267 ?AUTO_13269 ) ) ( CAN_TRAVERSE ?AUTO_13272 ?AUTO_13270 ?AUTO_13269 ) ( VISIBLE ?AUTO_13270 ?AUTO_13269 ) ( not ( = ?AUTO_13265 ?AUTO_13270 ) ) ( not ( = ?AUTO_13271 ?AUTO_13270 ) ) ( not ( = ?AUTO_13267 ?AUTO_13270 ) ) ( not ( = ?AUTO_13269 ?AUTO_13270 ) ) ( ON_BOARD ?AUTO_13266 ?AUTO_13272 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13272 ) ( SUPPORTS ?AUTO_13266 ?AUTO_13264 ) ( VISIBLE_FROM ?AUTO_13263 ?AUTO_13270 ) ( CALIBRATION_TARGET ?AUTO_13266 ?AUTO_13263 ) ( CAN_TRAVERSE ?AUTO_13272 ?AUTO_13269 ?AUTO_13270 ) ( AT ?AUTO_13272 ?AUTO_13269 ) ( VISIBLE ?AUTO_13269 ?AUTO_13270 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13272 ?AUTO_13269 ?AUTO_13270 )
      ( GET_IMAGE_DATA ?AUTO_13263 ?AUTO_13264 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13263 ?AUTO_13264 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13273 - OBJECTIVE
      ?AUTO_13274 - MODE
    )
    :vars
    (
      ?AUTO_13279 - LANDER
      ?AUTO_13280 - WAYPOINT
      ?AUTO_13281 - WAYPOINT
      ?AUTO_13276 - ROVER
      ?AUTO_13282 - WAYPOINT
      ?AUTO_13278 - WAYPOINT
      ?AUTO_13275 - WAYPOINT
      ?AUTO_13277 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13279 ?AUTO_13280 ) ( VISIBLE ?AUTO_13281 ?AUTO_13280 ) ( AVAILABLE ?AUTO_13276 ) ( CHANNEL_FREE ?AUTO_13279 ) ( not ( = ?AUTO_13281 ?AUTO_13280 ) ) ( CAN_TRAVERSE ?AUTO_13276 ?AUTO_13282 ?AUTO_13281 ) ( VISIBLE ?AUTO_13282 ?AUTO_13281 ) ( not ( = ?AUTO_13280 ?AUTO_13282 ) ) ( not ( = ?AUTO_13281 ?AUTO_13282 ) ) ( CAN_TRAVERSE ?AUTO_13276 ?AUTO_13278 ?AUTO_13282 ) ( VISIBLE ?AUTO_13278 ?AUTO_13282 ) ( not ( = ?AUTO_13280 ?AUTO_13278 ) ) ( not ( = ?AUTO_13281 ?AUTO_13278 ) ) ( not ( = ?AUTO_13282 ?AUTO_13278 ) ) ( CAN_TRAVERSE ?AUTO_13276 ?AUTO_13275 ?AUTO_13278 ) ( VISIBLE ?AUTO_13275 ?AUTO_13278 ) ( not ( = ?AUTO_13280 ?AUTO_13275 ) ) ( not ( = ?AUTO_13281 ?AUTO_13275 ) ) ( not ( = ?AUTO_13282 ?AUTO_13275 ) ) ( not ( = ?AUTO_13278 ?AUTO_13275 ) ) ( ON_BOARD ?AUTO_13277 ?AUTO_13276 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13276 ) ( SUPPORTS ?AUTO_13277 ?AUTO_13274 ) ( VISIBLE_FROM ?AUTO_13273 ?AUTO_13275 ) ( CALIBRATION_TARGET ?AUTO_13277 ?AUTO_13273 ) ( CAN_TRAVERSE ?AUTO_13276 ?AUTO_13278 ?AUTO_13275 ) ( VISIBLE ?AUTO_13278 ?AUTO_13275 ) ( CAN_TRAVERSE ?AUTO_13276 ?AUTO_13281 ?AUTO_13278 ) ( AT ?AUTO_13276 ?AUTO_13281 ) ( VISIBLE ?AUTO_13281 ?AUTO_13278 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13276 ?AUTO_13281 ?AUTO_13278 )
      ( GET_IMAGE_DATA ?AUTO_13273 ?AUTO_13274 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13273 ?AUTO_13274 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13311 - OBJECTIVE
      ?AUTO_13312 - MODE
    )
    :vars
    (
      ?AUTO_13313 - LANDER
      ?AUTO_13315 - WAYPOINT
      ?AUTO_13316 - WAYPOINT
      ?AUTO_13317 - ROVER
      ?AUTO_13318 - WAYPOINT
      ?AUTO_13319 - WAYPOINT
      ?AUTO_13314 - WAYPOINT
      ?AUTO_13320 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13313 ?AUTO_13315 ) ( VISIBLE ?AUTO_13316 ?AUTO_13315 ) ( AVAILABLE ?AUTO_13317 ) ( CHANNEL_FREE ?AUTO_13313 ) ( not ( = ?AUTO_13316 ?AUTO_13315 ) ) ( CAN_TRAVERSE ?AUTO_13317 ?AUTO_13318 ?AUTO_13316 ) ( VISIBLE ?AUTO_13318 ?AUTO_13316 ) ( not ( = ?AUTO_13315 ?AUTO_13318 ) ) ( not ( = ?AUTO_13316 ?AUTO_13318 ) ) ( CAN_TRAVERSE ?AUTO_13317 ?AUTO_13319 ?AUTO_13318 ) ( VISIBLE ?AUTO_13319 ?AUTO_13318 ) ( not ( = ?AUTO_13315 ?AUTO_13319 ) ) ( not ( = ?AUTO_13316 ?AUTO_13319 ) ) ( not ( = ?AUTO_13318 ?AUTO_13319 ) ) ( CAN_TRAVERSE ?AUTO_13317 ?AUTO_13314 ?AUTO_13319 ) ( VISIBLE ?AUTO_13314 ?AUTO_13319 ) ( not ( = ?AUTO_13315 ?AUTO_13314 ) ) ( not ( = ?AUTO_13316 ?AUTO_13314 ) ) ( not ( = ?AUTO_13318 ?AUTO_13314 ) ) ( not ( = ?AUTO_13319 ?AUTO_13314 ) ) ( ON_BOARD ?AUTO_13320 ?AUTO_13317 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13317 ) ( SUPPORTS ?AUTO_13320 ?AUTO_13312 ) ( VISIBLE_FROM ?AUTO_13311 ?AUTO_13314 ) ( CALIBRATION_TARGET ?AUTO_13320 ?AUTO_13311 ) ( CAN_TRAVERSE ?AUTO_13317 ?AUTO_13319 ?AUTO_13314 ) ( VISIBLE ?AUTO_13319 ?AUTO_13314 ) ( CAN_TRAVERSE ?AUTO_13317 ?AUTO_13316 ?AUTO_13319 ) ( VISIBLE ?AUTO_13316 ?AUTO_13319 ) ( AT ?AUTO_13317 ?AUTO_13318 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13317 ?AUTO_13318 ?AUTO_13316 )
      ( GET_IMAGE_DATA ?AUTO_13311 ?AUTO_13312 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13311 ?AUTO_13312 ) )
  )

)

