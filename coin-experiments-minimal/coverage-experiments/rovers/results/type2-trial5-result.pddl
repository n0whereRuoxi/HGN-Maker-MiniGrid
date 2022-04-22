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

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2 - OBJECTIVE
      ?AUTO_3 - MODE
    )
    :vars
    (
      ?AUTO_4 - ROVER
      ?AUTO_7 - WAYPOINT
      ?AUTO_6 - LANDER
      ?AUTO_5 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_4 ?AUTO_7 ) ( AT_LANDER ?AUTO_6 ?AUTO_5 ) ( HAVE_IMAGE ?AUTO_4 ?AUTO_2 ?AUTO_3 ) ( VISIBLE ?AUTO_7 ?AUTO_5 ) ( AVAILABLE ?AUTO_4 ) ( CHANNEL_FREE ?AUTO_6 ) ( not ( = ?AUTO_7 ?AUTO_5 ) ) )
    :subtasks
    ( ( !COMMUNICATE_IMAGE_DATA ?AUTO_4 ?AUTO_6 ?AUTO_2 ?AUTO_3 ?AUTO_7 ?AUTO_5 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8 - OBJECTIVE
      ?AUTO_9 - MODE
    )
    :vars
    (
      ?AUTO_10 - ROVER
      ?AUTO_13 - WAYPOINT
      ?AUTO_12 - LANDER
      ?AUTO_11 - WAYPOINT
      ?AUTO_14 - CAMERA
    )
    :precondition
    ( and ( AT ?AUTO_10 ?AUTO_13 ) ( AT_LANDER ?AUTO_12 ?AUTO_11 ) ( VISIBLE ?AUTO_13 ?AUTO_11 ) ( AVAILABLE ?AUTO_10 ) ( CHANNEL_FREE ?AUTO_12 ) ( not ( = ?AUTO_13 ?AUTO_11 ) ) ( CALIBRATED ?AUTO_14 ?AUTO_10 ) ( ON_BOARD ?AUTO_14 ?AUTO_10 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10 ) ( SUPPORTS ?AUTO_14 ?AUTO_9 ) ( VISIBLE_FROM ?AUTO_8 ?AUTO_13 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_10 ?AUTO_13 ?AUTO_8 ?AUTO_14 ?AUTO_9 )
      ( GET_IMAGE_DATA ?AUTO_8 ?AUTO_9 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8 ?AUTO_9 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_15 - OBJECTIVE
      ?AUTO_16 - MODE
    )
    :vars
    (
      ?AUTO_20 - ROVER
      ?AUTO_19 - WAYPOINT
      ?AUTO_18 - LANDER
      ?AUTO_17 - WAYPOINT
      ?AUTO_21 - CAMERA
    )
    :precondition
    ( and ( AT ?AUTO_20 ?AUTO_19 ) ( AT_LANDER ?AUTO_18 ?AUTO_17 ) ( VISIBLE ?AUTO_19 ?AUTO_17 ) ( AVAILABLE ?AUTO_20 ) ( CHANNEL_FREE ?AUTO_18 ) ( not ( = ?AUTO_19 ?AUTO_17 ) ) ( ON_BOARD ?AUTO_21 ?AUTO_20 ) ( EQUIPPED_FOR_IMAGING ?AUTO_20 ) ( SUPPORTS ?AUTO_21 ?AUTO_16 ) ( VISIBLE_FROM ?AUTO_15 ?AUTO_19 ) ( CALIBRATION_TARGET ?AUTO_21 ?AUTO_15 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_20 ?AUTO_21 ?AUTO_15 ?AUTO_19 )
      ( GET_IMAGE_DATA ?AUTO_15 ?AUTO_16 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_15 ?AUTO_16 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_22 - OBJECTIVE
      ?AUTO_23 - MODE
    )
    :vars
    (
      ?AUTO_24 - LANDER
      ?AUTO_25 - WAYPOINT
      ?AUTO_28 - WAYPOINT
      ?AUTO_27 - ROVER
      ?AUTO_26 - CAMERA
      ?AUTO_29 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_24 ?AUTO_25 ) ( VISIBLE ?AUTO_28 ?AUTO_25 ) ( AVAILABLE ?AUTO_27 ) ( CHANNEL_FREE ?AUTO_24 ) ( not ( = ?AUTO_28 ?AUTO_25 ) ) ( ON_BOARD ?AUTO_26 ?AUTO_27 ) ( EQUIPPED_FOR_IMAGING ?AUTO_27 ) ( SUPPORTS ?AUTO_26 ?AUTO_23 ) ( VISIBLE_FROM ?AUTO_22 ?AUTO_28 ) ( CALIBRATION_TARGET ?AUTO_26 ?AUTO_22 ) ( CAN_TRAVERSE ?AUTO_27 ?AUTO_29 ?AUTO_28 ) ( AT ?AUTO_27 ?AUTO_29 ) ( VISIBLE ?AUTO_29 ?AUTO_28 ) ( not ( = ?AUTO_25 ?AUTO_29 ) ) ( not ( = ?AUTO_28 ?AUTO_29 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_27 ?AUTO_29 ?AUTO_28 )
      ( GET_IMAGE_DATA ?AUTO_22 ?AUTO_23 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_22 ?AUTO_23 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_30 - OBJECTIVE
      ?AUTO_31 - MODE
    )
    :vars
    (
      ?AUTO_36 - LANDER
      ?AUTO_32 - WAYPOINT
      ?AUTO_35 - WAYPOINT
      ?AUTO_34 - ROVER
      ?AUTO_33 - CAMERA
      ?AUTO_37 - WAYPOINT
      ?AUTO_38 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_36 ?AUTO_32 ) ( VISIBLE ?AUTO_35 ?AUTO_32 ) ( AVAILABLE ?AUTO_34 ) ( CHANNEL_FREE ?AUTO_36 ) ( not ( = ?AUTO_35 ?AUTO_32 ) ) ( ON_BOARD ?AUTO_33 ?AUTO_34 ) ( EQUIPPED_FOR_IMAGING ?AUTO_34 ) ( SUPPORTS ?AUTO_33 ?AUTO_31 ) ( VISIBLE_FROM ?AUTO_30 ?AUTO_35 ) ( CALIBRATION_TARGET ?AUTO_33 ?AUTO_30 ) ( CAN_TRAVERSE ?AUTO_34 ?AUTO_37 ?AUTO_35 ) ( VISIBLE ?AUTO_37 ?AUTO_35 ) ( not ( = ?AUTO_32 ?AUTO_37 ) ) ( not ( = ?AUTO_35 ?AUTO_37 ) ) ( CAN_TRAVERSE ?AUTO_34 ?AUTO_38 ?AUTO_37 ) ( AT ?AUTO_34 ?AUTO_38 ) ( VISIBLE ?AUTO_38 ?AUTO_37 ) ( not ( = ?AUTO_32 ?AUTO_38 ) ) ( not ( = ?AUTO_35 ?AUTO_38 ) ) ( not ( = ?AUTO_37 ?AUTO_38 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_34 ?AUTO_38 ?AUTO_37 )
      ( GET_IMAGE_DATA ?AUTO_30 ?AUTO_31 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_39 - OBJECTIVE
      ?AUTO_40 - MODE
    )
    :vars
    (
      ?AUTO_44 - LANDER
      ?AUTO_46 - WAYPOINT
      ?AUTO_42 - WAYPOINT
      ?AUTO_43 - ROVER
      ?AUTO_41 - CAMERA
      ?AUTO_45 - WAYPOINT
      ?AUTO_47 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_44 ?AUTO_46 ) ( VISIBLE ?AUTO_42 ?AUTO_46 ) ( AVAILABLE ?AUTO_43 ) ( CHANNEL_FREE ?AUTO_44 ) ( not ( = ?AUTO_42 ?AUTO_46 ) ) ( ON_BOARD ?AUTO_41 ?AUTO_43 ) ( EQUIPPED_FOR_IMAGING ?AUTO_43 ) ( SUPPORTS ?AUTO_41 ?AUTO_40 ) ( VISIBLE_FROM ?AUTO_39 ?AUTO_42 ) ( CALIBRATION_TARGET ?AUTO_41 ?AUTO_39 ) ( CAN_TRAVERSE ?AUTO_43 ?AUTO_45 ?AUTO_42 ) ( VISIBLE ?AUTO_45 ?AUTO_42 ) ( not ( = ?AUTO_46 ?AUTO_45 ) ) ( not ( = ?AUTO_42 ?AUTO_45 ) ) ( CAN_TRAVERSE ?AUTO_43 ?AUTO_47 ?AUTO_45 ) ( VISIBLE ?AUTO_47 ?AUTO_45 ) ( not ( = ?AUTO_46 ?AUTO_47 ) ) ( not ( = ?AUTO_42 ?AUTO_47 ) ) ( not ( = ?AUTO_45 ?AUTO_47 ) ) ( CAN_TRAVERSE ?AUTO_43 ?AUTO_46 ?AUTO_47 ) ( AT ?AUTO_43 ?AUTO_46 ) ( VISIBLE ?AUTO_46 ?AUTO_47 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_43 ?AUTO_46 ?AUTO_47 )
      ( GET_IMAGE_DATA ?AUTO_39 ?AUTO_40 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_49 - WAYPOINT
    )
    :vars
    (
      ?AUTO_50 - ROVER
      ?AUTO_52 - LANDER
      ?AUTO_51 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_50 ?AUTO_49 ) ( AT_LANDER ?AUTO_52 ?AUTO_51 ) ( HAVE_SOIL_ANALYSIS ?AUTO_50 ?AUTO_49 ) ( VISIBLE ?AUTO_49 ?AUTO_51 ) ( AVAILABLE ?AUTO_50 ) ( CHANNEL_FREE ?AUTO_52 ) ( not ( = ?AUTO_49 ?AUTO_51 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_50 ?AUTO_52 ?AUTO_49 ?AUTO_49 ?AUTO_51 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_49 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_53 - WAYPOINT
    )
    :vars
    (
      ?AUTO_55 - ROVER
      ?AUTO_56 - LANDER
      ?AUTO_54 - WAYPOINT
      ?AUTO_57 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_55 ?AUTO_53 ) ( AT_LANDER ?AUTO_56 ?AUTO_54 ) ( VISIBLE ?AUTO_53 ?AUTO_54 ) ( AVAILABLE ?AUTO_55 ) ( CHANNEL_FREE ?AUTO_56 ) ( not ( = ?AUTO_53 ?AUTO_54 ) ) ( AT_SOIL_SAMPLE ?AUTO_53 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_55 ) ( STORE_OF ?AUTO_57 ?AUTO_55 ) ( EMPTY ?AUTO_57 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_55 ?AUTO_57 ?AUTO_53 )
      ( GET_SOIL_DATA ?AUTO_53 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_53 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_74 - WAYPOINT
    )
    :vars
    (
      ?AUTO_75 - ROVER
      ?AUTO_76 - LANDER
      ?AUTO_77 - WAYPOINT
      ?AUTO_78 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_75 ?AUTO_74 ) ( AT_LANDER ?AUTO_76 ?AUTO_77 ) ( VISIBLE ?AUTO_74 ?AUTO_77 ) ( AVAILABLE ?AUTO_75 ) ( CHANNEL_FREE ?AUTO_76 ) ( not ( = ?AUTO_74 ?AUTO_77 ) ) ( AT_SOIL_SAMPLE ?AUTO_74 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_75 ) ( STORE_OF ?AUTO_78 ?AUTO_75 ) ( FULL ?AUTO_78 ) )
    :subtasks
    ( ( !DROP ?AUTO_75 ?AUTO_78 )
      ( GET_SOIL_DATA ?AUTO_74 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_74 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_79 - WAYPOINT
    )
    :vars
    (
      ?AUTO_81 - LANDER
      ?AUTO_82 - WAYPOINT
      ?AUTO_80 - ROVER
      ?AUTO_83 - STORE
      ?AUTO_84 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_81 ?AUTO_82 ) ( VISIBLE ?AUTO_79 ?AUTO_82 ) ( AVAILABLE ?AUTO_80 ) ( CHANNEL_FREE ?AUTO_81 ) ( not ( = ?AUTO_79 ?AUTO_82 ) ) ( AT_SOIL_SAMPLE ?AUTO_79 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_80 ) ( STORE_OF ?AUTO_83 ?AUTO_80 ) ( FULL ?AUTO_83 ) ( CAN_TRAVERSE ?AUTO_80 ?AUTO_84 ?AUTO_79 ) ( AT ?AUTO_80 ?AUTO_84 ) ( VISIBLE ?AUTO_84 ?AUTO_79 ) ( not ( = ?AUTO_79 ?AUTO_84 ) ) ( not ( = ?AUTO_82 ?AUTO_84 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_80 ?AUTO_84 ?AUTO_79 )
      ( GET_SOIL_DATA ?AUTO_79 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_79 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_86 - WAYPOINT
    )
    :vars
    (
      ?AUTO_91 - LANDER
      ?AUTO_88 - WAYPOINT
      ?AUTO_87 - ROVER
      ?AUTO_90 - STORE
      ?AUTO_89 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_91 ?AUTO_88 ) ( VISIBLE ?AUTO_86 ?AUTO_88 ) ( AVAILABLE ?AUTO_87 ) ( CHANNEL_FREE ?AUTO_91 ) ( not ( = ?AUTO_86 ?AUTO_88 ) ) ( AT_SOIL_SAMPLE ?AUTO_86 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_87 ) ( STORE_OF ?AUTO_90 ?AUTO_87 ) ( CAN_TRAVERSE ?AUTO_87 ?AUTO_89 ?AUTO_86 ) ( AT ?AUTO_87 ?AUTO_89 ) ( VISIBLE ?AUTO_89 ?AUTO_86 ) ( not ( = ?AUTO_86 ?AUTO_89 ) ) ( not ( = ?AUTO_88 ?AUTO_89 ) ) ( AT_SOIL_SAMPLE ?AUTO_89 ) ( EMPTY ?AUTO_90 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_87 ?AUTO_90 ?AUTO_89 )
      ( GET_SOIL_DATA ?AUTO_86 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_86 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_99 - WAYPOINT
    )
    :vars
    (
      ?AUTO_100 - ROVER
      ?AUTO_102 - LANDER
      ?AUTO_101 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_100 ?AUTO_99 ) ( AT_LANDER ?AUTO_102 ?AUTO_101 ) ( HAVE_ROCK_ANALYSIS ?AUTO_100 ?AUTO_99 ) ( VISIBLE ?AUTO_99 ?AUTO_101 ) ( AVAILABLE ?AUTO_100 ) ( CHANNEL_FREE ?AUTO_102 ) ( not ( = ?AUTO_99 ?AUTO_101 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_100 ?AUTO_102 ?AUTO_99 ?AUTO_99 ?AUTO_101 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_99 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_103 - WAYPOINT
    )
    :vars
    (
      ?AUTO_104 - ROVER
      ?AUTO_106 - LANDER
      ?AUTO_105 - WAYPOINT
      ?AUTO_107 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_104 ?AUTO_103 ) ( AT_LANDER ?AUTO_106 ?AUTO_105 ) ( VISIBLE ?AUTO_103 ?AUTO_105 ) ( AVAILABLE ?AUTO_104 ) ( CHANNEL_FREE ?AUTO_106 ) ( not ( = ?AUTO_103 ?AUTO_105 ) ) ( AT_ROCK_SAMPLE ?AUTO_103 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_104 ) ( STORE_OF ?AUTO_107 ?AUTO_104 ) ( EMPTY ?AUTO_107 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_104 ?AUTO_107 ?AUTO_103 )
      ( GET_ROCK_DATA ?AUTO_103 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_103 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_108 - WAYPOINT
    )
    :vars
    (
      ?AUTO_109 - ROVER
      ?AUTO_110 - LANDER
      ?AUTO_111 - WAYPOINT
      ?AUTO_112 - STORE
    )
    :precondition
    ( and ( AT ?AUTO_109 ?AUTO_108 ) ( AT_LANDER ?AUTO_110 ?AUTO_111 ) ( VISIBLE ?AUTO_108 ?AUTO_111 ) ( AVAILABLE ?AUTO_109 ) ( CHANNEL_FREE ?AUTO_110 ) ( not ( = ?AUTO_108 ?AUTO_111 ) ) ( AT_ROCK_SAMPLE ?AUTO_108 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_109 ) ( STORE_OF ?AUTO_112 ?AUTO_109 ) ( FULL ?AUTO_112 ) )
    :subtasks
    ( ( !DROP ?AUTO_109 ?AUTO_112 )
      ( GET_ROCK_DATA ?AUTO_108 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_108 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_113 - WAYPOINT
    )
    :vars
    (
      ?AUTO_115 - LANDER
      ?AUTO_116 - WAYPOINT
      ?AUTO_114 - ROVER
      ?AUTO_117 - STORE
      ?AUTO_118 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_115 ?AUTO_116 ) ( VISIBLE ?AUTO_113 ?AUTO_116 ) ( AVAILABLE ?AUTO_114 ) ( CHANNEL_FREE ?AUTO_115 ) ( not ( = ?AUTO_113 ?AUTO_116 ) ) ( AT_ROCK_SAMPLE ?AUTO_113 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_114 ) ( STORE_OF ?AUTO_117 ?AUTO_114 ) ( FULL ?AUTO_117 ) ( CAN_TRAVERSE ?AUTO_114 ?AUTO_118 ?AUTO_113 ) ( AT ?AUTO_114 ?AUTO_118 ) ( VISIBLE ?AUTO_118 ?AUTO_113 ) ( not ( = ?AUTO_113 ?AUTO_118 ) ) ( not ( = ?AUTO_116 ?AUTO_118 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_114 ?AUTO_118 ?AUTO_113 )
      ( GET_ROCK_DATA ?AUTO_113 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_113 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_120 - WAYPOINT
    )
    :vars
    (
      ?AUTO_123 - LANDER
      ?AUTO_125 - WAYPOINT
      ?AUTO_122 - ROVER
      ?AUTO_124 - STORE
      ?AUTO_121 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_123 ?AUTO_125 ) ( VISIBLE ?AUTO_120 ?AUTO_125 ) ( AVAILABLE ?AUTO_122 ) ( CHANNEL_FREE ?AUTO_123 ) ( not ( = ?AUTO_120 ?AUTO_125 ) ) ( AT_ROCK_SAMPLE ?AUTO_120 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_122 ) ( STORE_OF ?AUTO_124 ?AUTO_122 ) ( CAN_TRAVERSE ?AUTO_122 ?AUTO_121 ?AUTO_120 ) ( AT ?AUTO_122 ?AUTO_121 ) ( VISIBLE ?AUTO_121 ?AUTO_120 ) ( not ( = ?AUTO_120 ?AUTO_121 ) ) ( not ( = ?AUTO_125 ?AUTO_121 ) ) ( AT_SOIL_SAMPLE ?AUTO_121 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_122 ) ( EMPTY ?AUTO_124 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_122 ?AUTO_124 ?AUTO_121 )
      ( GET_ROCK_DATA ?AUTO_120 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_120 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_127 - WAYPOINT
    )
    :vars
    (
      ?AUTO_128 - ROVER
      ?AUTO_130 - WAYPOINT
      ?AUTO_129 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_128 ?AUTO_130 ) ( AT_LANDER ?AUTO_129 ?AUTO_127 ) ( HAVE_ROCK_ANALYSIS ?AUTO_128 ?AUTO_127 ) ( VISIBLE ?AUTO_130 ?AUTO_127 ) ( AVAILABLE ?AUTO_128 ) ( CHANNEL_FREE ?AUTO_129 ) ( not ( = ?AUTO_127 ?AUTO_130 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_128 ?AUTO_129 ?AUTO_127 ?AUTO_130 ?AUTO_127 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_127 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_132 - WAYPOINT
    )
    :vars
    (
      ?AUTO_135 - LANDER
      ?AUTO_133 - ROVER
      ?AUTO_134 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_135 ?AUTO_132 ) ( HAVE_ROCK_ANALYSIS ?AUTO_133 ?AUTO_132 ) ( VISIBLE ?AUTO_134 ?AUTO_132 ) ( AVAILABLE ?AUTO_133 ) ( CHANNEL_FREE ?AUTO_135 ) ( not ( = ?AUTO_132 ?AUTO_134 ) ) ( CAN_TRAVERSE ?AUTO_133 ?AUTO_132 ?AUTO_134 ) ( AT ?AUTO_133 ?AUTO_132 ) ( VISIBLE ?AUTO_132 ?AUTO_134 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_133 ?AUTO_132 ?AUTO_134 )
      ( GET_ROCK_DATA ?AUTO_132 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_132 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_136 - WAYPOINT
    )
    :vars
    (
      ?AUTO_139 - LANDER
      ?AUTO_138 - WAYPOINT
      ?AUTO_137 - ROVER
      ?AUTO_140 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_139 ?AUTO_136 ) ( VISIBLE ?AUTO_138 ?AUTO_136 ) ( AVAILABLE ?AUTO_137 ) ( CHANNEL_FREE ?AUTO_139 ) ( not ( = ?AUTO_136 ?AUTO_138 ) ) ( CAN_TRAVERSE ?AUTO_137 ?AUTO_136 ?AUTO_138 ) ( AT ?AUTO_137 ?AUTO_136 ) ( VISIBLE ?AUTO_136 ?AUTO_138 ) ( AT_ROCK_SAMPLE ?AUTO_136 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_137 ) ( STORE_OF ?AUTO_140 ?AUTO_137 ) ( EMPTY ?AUTO_140 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_137 ?AUTO_140 ?AUTO_136 )
      ( GET_ROCK_DATA ?AUTO_136 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_136 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_165 - OBJECTIVE
      ?AUTO_166 - MODE
    )
    :vars
    (
      ?AUTO_170 - LANDER
      ?AUTO_168 - WAYPOINT
      ?AUTO_167 - WAYPOINT
      ?AUTO_171 - ROVER
      ?AUTO_169 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_170 ?AUTO_168 ) ( VISIBLE ?AUTO_167 ?AUTO_168 ) ( AVAILABLE ?AUTO_171 ) ( CHANNEL_FREE ?AUTO_170 ) ( not ( = ?AUTO_167 ?AUTO_168 ) ) ( ON_BOARD ?AUTO_169 ?AUTO_171 ) ( EQUIPPED_FOR_IMAGING ?AUTO_171 ) ( SUPPORTS ?AUTO_169 ?AUTO_166 ) ( VISIBLE_FROM ?AUTO_165 ?AUTO_167 ) ( CALIBRATION_TARGET ?AUTO_169 ?AUTO_165 ) ( CAN_TRAVERSE ?AUTO_171 ?AUTO_168 ?AUTO_167 ) ( AT ?AUTO_171 ?AUTO_168 ) ( VISIBLE ?AUTO_168 ?AUTO_167 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_171 ?AUTO_168 ?AUTO_167 )
      ( GET_IMAGE_DATA ?AUTO_165 ?AUTO_166 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_165 ?AUTO_166 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_202 - OBJECTIVE
      ?AUTO_203 - MODE
    )
    :vars
    (
      ?AUTO_209 - LANDER
      ?AUTO_206 - WAYPOINT
      ?AUTO_208 - WAYPOINT
      ?AUTO_205 - ROVER
      ?AUTO_204 - CAMERA
      ?AUTO_207 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_209 ?AUTO_206 ) ( VISIBLE ?AUTO_208 ?AUTO_206 ) ( AVAILABLE ?AUTO_205 ) ( CHANNEL_FREE ?AUTO_209 ) ( not ( = ?AUTO_208 ?AUTO_206 ) ) ( ON_BOARD ?AUTO_204 ?AUTO_205 ) ( EQUIPPED_FOR_IMAGING ?AUTO_205 ) ( SUPPORTS ?AUTO_204 ?AUTO_203 ) ( VISIBLE_FROM ?AUTO_202 ?AUTO_208 ) ( CALIBRATION_TARGET ?AUTO_204 ?AUTO_202 ) ( CAN_TRAVERSE ?AUTO_205 ?AUTO_207 ?AUTO_208 ) ( VISIBLE ?AUTO_207 ?AUTO_208 ) ( not ( = ?AUTO_206 ?AUTO_207 ) ) ( not ( = ?AUTO_208 ?AUTO_207 ) ) ( CAN_TRAVERSE ?AUTO_205 ?AUTO_206 ?AUTO_207 ) ( AT ?AUTO_205 ?AUTO_206 ) ( VISIBLE ?AUTO_206 ?AUTO_207 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_205 ?AUTO_206 ?AUTO_207 )
      ( GET_IMAGE_DATA ?AUTO_202 ?AUTO_203 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_202 ?AUTO_203 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_210 - OBJECTIVE
      ?AUTO_211 - MODE
    )
    :vars
    (
      ?AUTO_212 - LANDER
      ?AUTO_215 - WAYPOINT
      ?AUTO_214 - WAYPOINT
      ?AUTO_216 - ROVER
      ?AUTO_213 - CAMERA
      ?AUTO_217 - WAYPOINT
      ?AUTO_218 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_212 ?AUTO_215 ) ( VISIBLE ?AUTO_214 ?AUTO_215 ) ( AVAILABLE ?AUTO_216 ) ( CHANNEL_FREE ?AUTO_212 ) ( not ( = ?AUTO_214 ?AUTO_215 ) ) ( ON_BOARD ?AUTO_213 ?AUTO_216 ) ( EQUIPPED_FOR_IMAGING ?AUTO_216 ) ( SUPPORTS ?AUTO_213 ?AUTO_211 ) ( VISIBLE_FROM ?AUTO_210 ?AUTO_214 ) ( CALIBRATION_TARGET ?AUTO_213 ?AUTO_210 ) ( CAN_TRAVERSE ?AUTO_216 ?AUTO_217 ?AUTO_214 ) ( VISIBLE ?AUTO_217 ?AUTO_214 ) ( not ( = ?AUTO_215 ?AUTO_217 ) ) ( not ( = ?AUTO_214 ?AUTO_217 ) ) ( CAN_TRAVERSE ?AUTO_216 ?AUTO_215 ?AUTO_217 ) ( VISIBLE ?AUTO_215 ?AUTO_217 ) ( CAN_TRAVERSE ?AUTO_216 ?AUTO_218 ?AUTO_215 ) ( AT ?AUTO_216 ?AUTO_218 ) ( VISIBLE ?AUTO_218 ?AUTO_215 ) ( not ( = ?AUTO_215 ?AUTO_218 ) ) ( not ( = ?AUTO_214 ?AUTO_218 ) ) ( not ( = ?AUTO_217 ?AUTO_218 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_216 ?AUTO_218 ?AUTO_215 )
      ( GET_IMAGE_DATA ?AUTO_210 ?AUTO_211 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_210 ?AUTO_211 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_232 - WAYPOINT
    )
    :vars
    (
      ?AUTO_234 - LANDER
      ?AUTO_233 - WAYPOINT
      ?AUTO_235 - ROVER
      ?AUTO_236 - STORE
      ?AUTO_237 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_234 ?AUTO_233 ) ( VISIBLE ?AUTO_232 ?AUTO_233 ) ( AVAILABLE ?AUTO_235 ) ( CHANNEL_FREE ?AUTO_234 ) ( not ( = ?AUTO_232 ?AUTO_233 ) ) ( AT_SOIL_SAMPLE ?AUTO_232 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_235 ) ( STORE_OF ?AUTO_236 ?AUTO_235 ) ( EMPTY ?AUTO_236 ) ( CAN_TRAVERSE ?AUTO_235 ?AUTO_237 ?AUTO_232 ) ( AT ?AUTO_235 ?AUTO_237 ) ( VISIBLE ?AUTO_237 ?AUTO_232 ) ( not ( = ?AUTO_232 ?AUTO_237 ) ) ( not ( = ?AUTO_233 ?AUTO_237 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_235 ?AUTO_237 ?AUTO_232 )
      ( GET_SOIL_DATA ?AUTO_232 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_232 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_238 - WAYPOINT
    )
    :vars
    (
      ?AUTO_241 - LANDER
      ?AUTO_240 - WAYPOINT
      ?AUTO_239 - ROVER
      ?AUTO_242 - STORE
      ?AUTO_243 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_241 ?AUTO_240 ) ( VISIBLE ?AUTO_238 ?AUTO_240 ) ( AVAILABLE ?AUTO_239 ) ( CHANNEL_FREE ?AUTO_241 ) ( not ( = ?AUTO_238 ?AUTO_240 ) ) ( AT_SOIL_SAMPLE ?AUTO_238 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_239 ) ( STORE_OF ?AUTO_242 ?AUTO_239 ) ( EMPTY ?AUTO_242 ) ( CAN_TRAVERSE ?AUTO_239 ?AUTO_243 ?AUTO_238 ) ( VISIBLE ?AUTO_243 ?AUTO_238 ) ( not ( = ?AUTO_238 ?AUTO_243 ) ) ( not ( = ?AUTO_240 ?AUTO_243 ) ) ( CAN_TRAVERSE ?AUTO_239 ?AUTO_240 ?AUTO_243 ) ( AT ?AUTO_239 ?AUTO_240 ) ( VISIBLE ?AUTO_240 ?AUTO_243 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_239 ?AUTO_240 ?AUTO_243 )
      ( GET_SOIL_DATA ?AUTO_238 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_238 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_244 - WAYPOINT
    )
    :vars
    (
      ?AUTO_249 - LANDER
      ?AUTO_245 - WAYPOINT
      ?AUTO_246 - ROVER
      ?AUTO_248 - STORE
      ?AUTO_247 - WAYPOINT
      ?AUTO_250 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_249 ?AUTO_245 ) ( VISIBLE ?AUTO_244 ?AUTO_245 ) ( AVAILABLE ?AUTO_246 ) ( CHANNEL_FREE ?AUTO_249 ) ( not ( = ?AUTO_244 ?AUTO_245 ) ) ( AT_SOIL_SAMPLE ?AUTO_244 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_246 ) ( STORE_OF ?AUTO_248 ?AUTO_246 ) ( EMPTY ?AUTO_248 ) ( CAN_TRAVERSE ?AUTO_246 ?AUTO_247 ?AUTO_244 ) ( VISIBLE ?AUTO_247 ?AUTO_244 ) ( not ( = ?AUTO_244 ?AUTO_247 ) ) ( not ( = ?AUTO_245 ?AUTO_247 ) ) ( CAN_TRAVERSE ?AUTO_246 ?AUTO_245 ?AUTO_247 ) ( VISIBLE ?AUTO_245 ?AUTO_247 ) ( CAN_TRAVERSE ?AUTO_246 ?AUTO_250 ?AUTO_245 ) ( AT ?AUTO_246 ?AUTO_250 ) ( VISIBLE ?AUTO_250 ?AUTO_245 ) ( not ( = ?AUTO_244 ?AUTO_250 ) ) ( not ( = ?AUTO_245 ?AUTO_250 ) ) ( not ( = ?AUTO_247 ?AUTO_250 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_246 ?AUTO_250 ?AUTO_245 )
      ( GET_SOIL_DATA ?AUTO_244 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_244 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_283 - WAYPOINT
    )
    :vars
    (
      ?AUTO_287 - LANDER
      ?AUTO_286 - WAYPOINT
      ?AUTO_285 - ROVER
      ?AUTO_284 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_287 ?AUTO_286 ) ( VISIBLE ?AUTO_283 ?AUTO_286 ) ( AVAILABLE ?AUTO_285 ) ( CHANNEL_FREE ?AUTO_287 ) ( not ( = ?AUTO_283 ?AUTO_286 ) ) ( AT_SOIL_SAMPLE ?AUTO_283 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_285 ) ( STORE_OF ?AUTO_284 ?AUTO_285 ) ( EMPTY ?AUTO_284 ) ( CAN_TRAVERSE ?AUTO_285 ?AUTO_286 ?AUTO_283 ) ( AT ?AUTO_285 ?AUTO_286 ) ( VISIBLE ?AUTO_286 ?AUTO_283 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_285 ?AUTO_286 ?AUTO_283 )
      ( GET_SOIL_DATA ?AUTO_283 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_283 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_288 - WAYPOINT
    )
    :vars
    (
      ?AUTO_289 - LANDER
      ?AUTO_291 - WAYPOINT
      ?AUTO_290 - ROVER
      ?AUTO_292 - STORE
      ?AUTO_293 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_289 ?AUTO_291 ) ( VISIBLE ?AUTO_288 ?AUTO_291 ) ( AVAILABLE ?AUTO_290 ) ( CHANNEL_FREE ?AUTO_289 ) ( not ( = ?AUTO_288 ?AUTO_291 ) ) ( AT_SOIL_SAMPLE ?AUTO_288 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_290 ) ( STORE_OF ?AUTO_292 ?AUTO_290 ) ( EMPTY ?AUTO_292 ) ( CAN_TRAVERSE ?AUTO_290 ?AUTO_291 ?AUTO_288 ) ( VISIBLE ?AUTO_291 ?AUTO_288 ) ( CAN_TRAVERSE ?AUTO_290 ?AUTO_293 ?AUTO_291 ) ( AT ?AUTO_290 ?AUTO_293 ) ( VISIBLE ?AUTO_293 ?AUTO_291 ) ( not ( = ?AUTO_288 ?AUTO_293 ) ) ( not ( = ?AUTO_291 ?AUTO_293 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_290 ?AUTO_293 ?AUTO_291 )
      ( GET_SOIL_DATA ?AUTO_288 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_288 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_329 - WAYPOINT
    )
    :vars
    (
      ?AUTO_333 - LANDER
      ?AUTO_331 - WAYPOINT
      ?AUTO_330 - ROVER
      ?AUTO_332 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_333 ?AUTO_331 ) ( VISIBLE ?AUTO_329 ?AUTO_331 ) ( AVAILABLE ?AUTO_330 ) ( CHANNEL_FREE ?AUTO_333 ) ( not ( = ?AUTO_329 ?AUTO_331 ) ) ( AT_ROCK_SAMPLE ?AUTO_329 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_330 ) ( STORE_OF ?AUTO_332 ?AUTO_330 ) ( EMPTY ?AUTO_332 ) ( CAN_TRAVERSE ?AUTO_330 ?AUTO_331 ?AUTO_329 ) ( AT ?AUTO_330 ?AUTO_331 ) ( VISIBLE ?AUTO_331 ?AUTO_329 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_330 ?AUTO_331 ?AUTO_329 )
      ( GET_ROCK_DATA ?AUTO_329 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_329 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_334 - WAYPOINT
    )
    :vars
    (
      ?AUTO_335 - LANDER
      ?AUTO_338 - WAYPOINT
      ?AUTO_336 - ROVER
      ?AUTO_337 - STORE
      ?AUTO_339 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_335 ?AUTO_338 ) ( VISIBLE ?AUTO_334 ?AUTO_338 ) ( AVAILABLE ?AUTO_336 ) ( CHANNEL_FREE ?AUTO_335 ) ( not ( = ?AUTO_334 ?AUTO_338 ) ) ( AT_ROCK_SAMPLE ?AUTO_334 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_336 ) ( STORE_OF ?AUTO_337 ?AUTO_336 ) ( EMPTY ?AUTO_337 ) ( CAN_TRAVERSE ?AUTO_336 ?AUTO_338 ?AUTO_334 ) ( VISIBLE ?AUTO_338 ?AUTO_334 ) ( CAN_TRAVERSE ?AUTO_336 ?AUTO_339 ?AUTO_338 ) ( AT ?AUTO_336 ?AUTO_339 ) ( VISIBLE ?AUTO_339 ?AUTO_338 ) ( not ( = ?AUTO_334 ?AUTO_339 ) ) ( not ( = ?AUTO_338 ?AUTO_339 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_336 ?AUTO_339 ?AUTO_338 )
      ( GET_ROCK_DATA ?AUTO_334 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_334 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_369 - OBJECTIVE
      ?AUTO_370 - MODE
    )
    :vars
    (
      ?AUTO_374 - LANDER
      ?AUTO_373 - WAYPOINT
      ?AUTO_371 - WAYPOINT
      ?AUTO_375 - ROVER
      ?AUTO_372 - CAMERA
      ?AUTO_376 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_374 ?AUTO_373 ) ( VISIBLE ?AUTO_371 ?AUTO_373 ) ( AVAILABLE ?AUTO_375 ) ( CHANNEL_FREE ?AUTO_374 ) ( not ( = ?AUTO_371 ?AUTO_373 ) ) ( ON_BOARD ?AUTO_372 ?AUTO_375 ) ( EQUIPPED_FOR_IMAGING ?AUTO_375 ) ( SUPPORTS ?AUTO_372 ?AUTO_370 ) ( VISIBLE_FROM ?AUTO_369 ?AUTO_371 ) ( CALIBRATION_TARGET ?AUTO_372 ?AUTO_369 ) ( CAN_TRAVERSE ?AUTO_375 ?AUTO_373 ?AUTO_371 ) ( VISIBLE ?AUTO_373 ?AUTO_371 ) ( CAN_TRAVERSE ?AUTO_375 ?AUTO_376 ?AUTO_373 ) ( AT ?AUTO_375 ?AUTO_376 ) ( VISIBLE ?AUTO_376 ?AUTO_373 ) ( not ( = ?AUTO_373 ?AUTO_376 ) ) ( not ( = ?AUTO_371 ?AUTO_376 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_375 ?AUTO_376 ?AUTO_373 )
      ( GET_IMAGE_DATA ?AUTO_369 ?AUTO_370 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_369 ?AUTO_370 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_411 - WAYPOINT
    )
    :vars
    (
      ?AUTO_412 - LANDER
      ?AUTO_414 - WAYPOINT
      ?AUTO_415 - ROVER
      ?AUTO_413 - STORE
      ?AUTO_416 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_412 ?AUTO_414 ) ( VISIBLE ?AUTO_411 ?AUTO_414 ) ( AVAILABLE ?AUTO_415 ) ( CHANNEL_FREE ?AUTO_412 ) ( not ( = ?AUTO_411 ?AUTO_414 ) ) ( AT_ROCK_SAMPLE ?AUTO_411 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_415 ) ( STORE_OF ?AUTO_413 ?AUTO_415 ) ( EMPTY ?AUTO_413 ) ( CAN_TRAVERSE ?AUTO_415 ?AUTO_416 ?AUTO_411 ) ( AT ?AUTO_415 ?AUTO_416 ) ( VISIBLE ?AUTO_416 ?AUTO_411 ) ( not ( = ?AUTO_411 ?AUTO_416 ) ) ( not ( = ?AUTO_414 ?AUTO_416 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_415 ?AUTO_416 ?AUTO_411 )
      ( GET_ROCK_DATA ?AUTO_411 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_411 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_417 - WAYPOINT
    )
    :vars
    (
      ?AUTO_421 - LANDER
      ?AUTO_418 - WAYPOINT
      ?AUTO_419 - ROVER
      ?AUTO_420 - STORE
      ?AUTO_422 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_421 ?AUTO_418 ) ( VISIBLE ?AUTO_417 ?AUTO_418 ) ( AVAILABLE ?AUTO_419 ) ( CHANNEL_FREE ?AUTO_421 ) ( not ( = ?AUTO_417 ?AUTO_418 ) ) ( AT_ROCK_SAMPLE ?AUTO_417 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_419 ) ( STORE_OF ?AUTO_420 ?AUTO_419 ) ( CAN_TRAVERSE ?AUTO_419 ?AUTO_422 ?AUTO_417 ) ( AT ?AUTO_419 ?AUTO_422 ) ( VISIBLE ?AUTO_422 ?AUTO_417 ) ( not ( = ?AUTO_417 ?AUTO_422 ) ) ( not ( = ?AUTO_418 ?AUTO_422 ) ) ( FULL ?AUTO_420 ) )
    :subtasks
    ( ( !DROP ?AUTO_419 ?AUTO_420 )
      ( GET_ROCK_DATA ?AUTO_417 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_417 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_428 - WAYPOINT
    )
    :vars
    (
      ?AUTO_432 - LANDER
      ?AUTO_430 - WAYPOINT
      ?AUTO_429 - ROVER
      ?AUTO_431 - STORE
      ?AUTO_433 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_432 ?AUTO_430 ) ( VISIBLE ?AUTO_428 ?AUTO_430 ) ( AVAILABLE ?AUTO_429 ) ( CHANNEL_FREE ?AUTO_432 ) ( not ( = ?AUTO_428 ?AUTO_430 ) ) ( AT_ROCK_SAMPLE ?AUTO_428 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_429 ) ( STORE_OF ?AUTO_431 ?AUTO_429 ) ( EMPTY ?AUTO_431 ) ( CAN_TRAVERSE ?AUTO_429 ?AUTO_433 ?AUTO_428 ) ( VISIBLE ?AUTO_433 ?AUTO_428 ) ( not ( = ?AUTO_428 ?AUTO_433 ) ) ( not ( = ?AUTO_430 ?AUTO_433 ) ) ( CAN_TRAVERSE ?AUTO_429 ?AUTO_430 ?AUTO_433 ) ( AT ?AUTO_429 ?AUTO_430 ) ( VISIBLE ?AUTO_430 ?AUTO_433 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_429 ?AUTO_430 ?AUTO_433 )
      ( GET_ROCK_DATA ?AUTO_428 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_428 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_449 - WAYPOINT
    )
    :vars
    (
      ?AUTO_451 - LANDER
      ?AUTO_450 - WAYPOINT
      ?AUTO_453 - ROVER
      ?AUTO_452 - STORE
      ?AUTO_454 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_451 ?AUTO_449 ) ( VISIBLE ?AUTO_450 ?AUTO_449 ) ( AVAILABLE ?AUTO_453 ) ( CHANNEL_FREE ?AUTO_451 ) ( not ( = ?AUTO_449 ?AUTO_450 ) ) ( CAN_TRAVERSE ?AUTO_453 ?AUTO_449 ?AUTO_450 ) ( VISIBLE ?AUTO_449 ?AUTO_450 ) ( AT_ROCK_SAMPLE ?AUTO_449 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_453 ) ( STORE_OF ?AUTO_452 ?AUTO_453 ) ( EMPTY ?AUTO_452 ) ( CAN_TRAVERSE ?AUTO_453 ?AUTO_454 ?AUTO_449 ) ( AT ?AUTO_453 ?AUTO_454 ) ( VISIBLE ?AUTO_454 ?AUTO_449 ) ( not ( = ?AUTO_449 ?AUTO_454 ) ) ( not ( = ?AUTO_450 ?AUTO_454 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_453 ?AUTO_454 ?AUTO_449 )
      ( GET_ROCK_DATA ?AUTO_449 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_449 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_455 - WAYPOINT
    )
    :vars
    (
      ?AUTO_457 - LANDER
      ?AUTO_460 - WAYPOINT
      ?AUTO_459 - ROVER
      ?AUTO_458 - STORE
      ?AUTO_456 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_457 ?AUTO_455 ) ( VISIBLE ?AUTO_460 ?AUTO_455 ) ( AVAILABLE ?AUTO_459 ) ( CHANNEL_FREE ?AUTO_457 ) ( not ( = ?AUTO_455 ?AUTO_460 ) ) ( CAN_TRAVERSE ?AUTO_459 ?AUTO_455 ?AUTO_460 ) ( VISIBLE ?AUTO_455 ?AUTO_460 ) ( AT_ROCK_SAMPLE ?AUTO_455 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_459 ) ( STORE_OF ?AUTO_458 ?AUTO_459 ) ( CAN_TRAVERSE ?AUTO_459 ?AUTO_456 ?AUTO_455 ) ( AT ?AUTO_459 ?AUTO_456 ) ( VISIBLE ?AUTO_456 ?AUTO_455 ) ( not ( = ?AUTO_455 ?AUTO_456 ) ) ( not ( = ?AUTO_460 ?AUTO_456 ) ) ( FULL ?AUTO_458 ) )
    :subtasks
    ( ( !DROP ?AUTO_459 ?AUTO_458 )
      ( GET_ROCK_DATA ?AUTO_455 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_455 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_461 - WAYPOINT
    )
    :vars
    (
      ?AUTO_464 - LANDER
      ?AUTO_463 - WAYPOINT
      ?AUTO_466 - ROVER
      ?AUTO_465 - STORE
      ?AUTO_462 - WAYPOINT
      ?AUTO_467 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_464 ?AUTO_461 ) ( VISIBLE ?AUTO_463 ?AUTO_461 ) ( AVAILABLE ?AUTO_466 ) ( CHANNEL_FREE ?AUTO_464 ) ( not ( = ?AUTO_461 ?AUTO_463 ) ) ( CAN_TRAVERSE ?AUTO_466 ?AUTO_461 ?AUTO_463 ) ( VISIBLE ?AUTO_461 ?AUTO_463 ) ( AT_ROCK_SAMPLE ?AUTO_461 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_466 ) ( STORE_OF ?AUTO_465 ?AUTO_466 ) ( CAN_TRAVERSE ?AUTO_466 ?AUTO_462 ?AUTO_461 ) ( VISIBLE ?AUTO_462 ?AUTO_461 ) ( not ( = ?AUTO_461 ?AUTO_462 ) ) ( not ( = ?AUTO_463 ?AUTO_462 ) ) ( FULL ?AUTO_465 ) ( CAN_TRAVERSE ?AUTO_466 ?AUTO_467 ?AUTO_462 ) ( AT ?AUTO_466 ?AUTO_467 ) ( VISIBLE ?AUTO_467 ?AUTO_462 ) ( not ( = ?AUTO_461 ?AUTO_467 ) ) ( not ( = ?AUTO_463 ?AUTO_467 ) ) ( not ( = ?AUTO_462 ?AUTO_467 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_466 ?AUTO_467 ?AUTO_462 )
      ( GET_ROCK_DATA ?AUTO_461 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_461 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_469 - WAYPOINT
    )
    :vars
    (
      ?AUTO_473 - LANDER
      ?AUTO_475 - WAYPOINT
      ?AUTO_472 - ROVER
      ?AUTO_470 - STORE
      ?AUTO_474 - WAYPOINT
      ?AUTO_471 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_473 ?AUTO_469 ) ( VISIBLE ?AUTO_475 ?AUTO_469 ) ( AVAILABLE ?AUTO_472 ) ( CHANNEL_FREE ?AUTO_473 ) ( not ( = ?AUTO_469 ?AUTO_475 ) ) ( CAN_TRAVERSE ?AUTO_472 ?AUTO_469 ?AUTO_475 ) ( VISIBLE ?AUTO_469 ?AUTO_475 ) ( AT_ROCK_SAMPLE ?AUTO_469 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_472 ) ( STORE_OF ?AUTO_470 ?AUTO_472 ) ( CAN_TRAVERSE ?AUTO_472 ?AUTO_474 ?AUTO_469 ) ( VISIBLE ?AUTO_474 ?AUTO_469 ) ( not ( = ?AUTO_469 ?AUTO_474 ) ) ( not ( = ?AUTO_475 ?AUTO_474 ) ) ( CAN_TRAVERSE ?AUTO_472 ?AUTO_471 ?AUTO_474 ) ( AT ?AUTO_472 ?AUTO_471 ) ( VISIBLE ?AUTO_471 ?AUTO_474 ) ( not ( = ?AUTO_469 ?AUTO_471 ) ) ( not ( = ?AUTO_475 ?AUTO_471 ) ) ( not ( = ?AUTO_474 ?AUTO_471 ) ) ( AT_ROCK_SAMPLE ?AUTO_471 ) ( EMPTY ?AUTO_470 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_472 ?AUTO_470 ?AUTO_471 )
      ( GET_ROCK_DATA ?AUTO_469 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_469 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_525 - WAYPOINT
    )
    :vars
    (
      ?AUTO_529 - LANDER
      ?AUTO_526 - WAYPOINT
      ?AUTO_528 - ROVER
      ?AUTO_530 - STORE
      ?AUTO_527 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_529 ?AUTO_526 ) ( VISIBLE ?AUTO_525 ?AUTO_526 ) ( AVAILABLE ?AUTO_528 ) ( CHANNEL_FREE ?AUTO_529 ) ( not ( = ?AUTO_525 ?AUTO_526 ) ) ( AT_SOIL_SAMPLE ?AUTO_525 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_528 ) ( STORE_OF ?AUTO_530 ?AUTO_528 ) ( CAN_TRAVERSE ?AUTO_528 ?AUTO_527 ?AUTO_525 ) ( AT ?AUTO_528 ?AUTO_527 ) ( VISIBLE ?AUTO_527 ?AUTO_525 ) ( not ( = ?AUTO_525 ?AUTO_527 ) ) ( not ( = ?AUTO_526 ?AUTO_527 ) ) ( AT_ROCK_SAMPLE ?AUTO_527 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_528 ) ( EMPTY ?AUTO_530 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_528 ?AUTO_530 ?AUTO_527 )
      ( GET_SOIL_DATA ?AUTO_525 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_525 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_549 - OBJECTIVE
      ?AUTO_550 - MODE
    )
    :vars
    (
      ?AUTO_552 - LANDER
      ?AUTO_551 - WAYPOINT
      ?AUTO_553 - WAYPOINT
      ?AUTO_554 - ROVER
      ?AUTO_555 - CAMERA
      ?AUTO_556 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_552 ?AUTO_551 ) ( VISIBLE ?AUTO_553 ?AUTO_551 ) ( AVAILABLE ?AUTO_554 ) ( CHANNEL_FREE ?AUTO_552 ) ( not ( = ?AUTO_553 ?AUTO_551 ) ) ( CALIBRATED ?AUTO_555 ?AUTO_554 ) ( ON_BOARD ?AUTO_555 ?AUTO_554 ) ( EQUIPPED_FOR_IMAGING ?AUTO_554 ) ( SUPPORTS ?AUTO_555 ?AUTO_550 ) ( VISIBLE_FROM ?AUTO_549 ?AUTO_553 ) ( CAN_TRAVERSE ?AUTO_554 ?AUTO_556 ?AUTO_553 ) ( AT ?AUTO_554 ?AUTO_556 ) ( VISIBLE ?AUTO_556 ?AUTO_553 ) ( not ( = ?AUTO_551 ?AUTO_556 ) ) ( not ( = ?AUTO_553 ?AUTO_556 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_554 ?AUTO_556 ?AUTO_553 )
      ( GET_IMAGE_DATA ?AUTO_549 ?AUTO_550 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_549 ?AUTO_550 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_557 - OBJECTIVE
      ?AUTO_558 - MODE
    )
    :vars
    (
      ?AUTO_559 - LANDER
      ?AUTO_561 - WAYPOINT
      ?AUTO_563 - WAYPOINT
      ?AUTO_562 - ROVER
      ?AUTO_564 - CAMERA
      ?AUTO_560 - WAYPOINT
      ?AUTO_565 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_559 ?AUTO_561 ) ( VISIBLE ?AUTO_563 ?AUTO_561 ) ( AVAILABLE ?AUTO_562 ) ( CHANNEL_FREE ?AUTO_559 ) ( not ( = ?AUTO_563 ?AUTO_561 ) ) ( ON_BOARD ?AUTO_564 ?AUTO_562 ) ( EQUIPPED_FOR_IMAGING ?AUTO_562 ) ( SUPPORTS ?AUTO_564 ?AUTO_558 ) ( VISIBLE_FROM ?AUTO_557 ?AUTO_563 ) ( CAN_TRAVERSE ?AUTO_562 ?AUTO_560 ?AUTO_563 ) ( AT ?AUTO_562 ?AUTO_560 ) ( VISIBLE ?AUTO_560 ?AUTO_563 ) ( not ( = ?AUTO_561 ?AUTO_560 ) ) ( not ( = ?AUTO_563 ?AUTO_560 ) ) ( CALIBRATION_TARGET ?AUTO_564 ?AUTO_565 ) ( VISIBLE_FROM ?AUTO_565 ?AUTO_560 ) ( not ( = ?AUTO_557 ?AUTO_565 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_562 ?AUTO_564 ?AUTO_565 ?AUTO_560 )
      ( GET_IMAGE_DATA ?AUTO_557 ?AUTO_558 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_557 ?AUTO_558 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_566 - OBJECTIVE
      ?AUTO_567 - MODE
    )
    :vars
    (
      ?AUTO_573 - LANDER
      ?AUTO_568 - WAYPOINT
      ?AUTO_572 - WAYPOINT
      ?AUTO_571 - ROVER
      ?AUTO_570 - CAMERA
      ?AUTO_569 - WAYPOINT
      ?AUTO_574 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_573 ?AUTO_568 ) ( VISIBLE ?AUTO_572 ?AUTO_568 ) ( AVAILABLE ?AUTO_571 ) ( CHANNEL_FREE ?AUTO_573 ) ( not ( = ?AUTO_572 ?AUTO_568 ) ) ( ON_BOARD ?AUTO_570 ?AUTO_571 ) ( EQUIPPED_FOR_IMAGING ?AUTO_571 ) ( SUPPORTS ?AUTO_570 ?AUTO_567 ) ( VISIBLE_FROM ?AUTO_566 ?AUTO_572 ) ( CAN_TRAVERSE ?AUTO_571 ?AUTO_569 ?AUTO_572 ) ( VISIBLE ?AUTO_569 ?AUTO_572 ) ( not ( = ?AUTO_568 ?AUTO_569 ) ) ( not ( = ?AUTO_572 ?AUTO_569 ) ) ( CALIBRATION_TARGET ?AUTO_570 ?AUTO_574 ) ( VISIBLE_FROM ?AUTO_574 ?AUTO_569 ) ( not ( = ?AUTO_566 ?AUTO_574 ) ) ( CAN_TRAVERSE ?AUTO_571 ?AUTO_572 ?AUTO_569 ) ( AT ?AUTO_571 ?AUTO_572 ) ( VISIBLE ?AUTO_572 ?AUTO_569 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_571 ?AUTO_572 ?AUTO_569 )
      ( GET_IMAGE_DATA ?AUTO_566 ?AUTO_567 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_566 ?AUTO_567 ) )
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
      ?AUTO_588 - WAYPOINT
      ?AUTO_586 - WAYPOINT
      ?AUTO_583 - ROVER
      ?AUTO_589 - CAMERA
      ?AUTO_587 - WAYPOINT
      ?AUTO_584 - OBJECTIVE
      ?AUTO_590 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_585 ?AUTO_588 ) ( VISIBLE ?AUTO_586 ?AUTO_588 ) ( AVAILABLE ?AUTO_583 ) ( CHANNEL_FREE ?AUTO_585 ) ( not ( = ?AUTO_586 ?AUTO_588 ) ) ( ON_BOARD ?AUTO_589 ?AUTO_583 ) ( EQUIPPED_FOR_IMAGING ?AUTO_583 ) ( SUPPORTS ?AUTO_589 ?AUTO_582 ) ( VISIBLE_FROM ?AUTO_581 ?AUTO_586 ) ( CAN_TRAVERSE ?AUTO_583 ?AUTO_587 ?AUTO_586 ) ( VISIBLE ?AUTO_587 ?AUTO_586 ) ( not ( = ?AUTO_588 ?AUTO_587 ) ) ( not ( = ?AUTO_586 ?AUTO_587 ) ) ( CALIBRATION_TARGET ?AUTO_589 ?AUTO_584 ) ( VISIBLE_FROM ?AUTO_584 ?AUTO_587 ) ( not ( = ?AUTO_581 ?AUTO_584 ) ) ( CAN_TRAVERSE ?AUTO_583 ?AUTO_586 ?AUTO_587 ) ( VISIBLE ?AUTO_586 ?AUTO_587 ) ( CAN_TRAVERSE ?AUTO_583 ?AUTO_590 ?AUTO_586 ) ( AT ?AUTO_583 ?AUTO_590 ) ( VISIBLE ?AUTO_590 ?AUTO_586 ) ( not ( = ?AUTO_588 ?AUTO_590 ) ) ( not ( = ?AUTO_586 ?AUTO_590 ) ) ( not ( = ?AUTO_587 ?AUTO_590 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_583 ?AUTO_590 ?AUTO_586 )
      ( GET_IMAGE_DATA ?AUTO_581 ?AUTO_582 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_581 ?AUTO_582 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_599 - OBJECTIVE
      ?AUTO_600 - MODE
    )
    :vars
    (
      ?AUTO_603 - LANDER
      ?AUTO_602 - WAYPOINT
      ?AUTO_601 - ROVER
      ?AUTO_604 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_603 ?AUTO_602 ) ( HAVE_IMAGE ?AUTO_601 ?AUTO_599 ?AUTO_600 ) ( VISIBLE ?AUTO_604 ?AUTO_602 ) ( AVAILABLE ?AUTO_601 ) ( CHANNEL_FREE ?AUTO_603 ) ( not ( = ?AUTO_604 ?AUTO_602 ) ) ( CAN_TRAVERSE ?AUTO_601 ?AUTO_602 ?AUTO_604 ) ( AT ?AUTO_601 ?AUTO_602 ) ( VISIBLE ?AUTO_602 ?AUTO_604 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_601 ?AUTO_602 ?AUTO_604 )
      ( GET_IMAGE_DATA ?AUTO_599 ?AUTO_600 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_599 ?AUTO_600 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_605 - OBJECTIVE
      ?AUTO_606 - MODE
    )
    :vars
    (
      ?AUTO_610 - LANDER
      ?AUTO_607 - WAYPOINT
      ?AUTO_609 - WAYPOINT
      ?AUTO_608 - ROVER
      ?AUTO_611 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_610 ?AUTO_607 ) ( VISIBLE ?AUTO_609 ?AUTO_607 ) ( AVAILABLE ?AUTO_608 ) ( CHANNEL_FREE ?AUTO_610 ) ( not ( = ?AUTO_609 ?AUTO_607 ) ) ( CAN_TRAVERSE ?AUTO_608 ?AUTO_607 ?AUTO_609 ) ( AT ?AUTO_608 ?AUTO_607 ) ( VISIBLE ?AUTO_607 ?AUTO_609 ) ( CALIBRATED ?AUTO_611 ?AUTO_608 ) ( ON_BOARD ?AUTO_611 ?AUTO_608 ) ( EQUIPPED_FOR_IMAGING ?AUTO_608 ) ( SUPPORTS ?AUTO_611 ?AUTO_606 ) ( VISIBLE_FROM ?AUTO_605 ?AUTO_607 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_608 ?AUTO_607 ?AUTO_605 ?AUTO_611 ?AUTO_606 )
      ( GET_IMAGE_DATA ?AUTO_605 ?AUTO_606 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_605 ?AUTO_606 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_612 - OBJECTIVE
      ?AUTO_613 - MODE
    )
    :vars
    (
      ?AUTO_617 - LANDER
      ?AUTO_615 - WAYPOINT
      ?AUTO_616 - WAYPOINT
      ?AUTO_614 - ROVER
      ?AUTO_618 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_617 ?AUTO_615 ) ( VISIBLE ?AUTO_616 ?AUTO_615 ) ( AVAILABLE ?AUTO_614 ) ( CHANNEL_FREE ?AUTO_617 ) ( not ( = ?AUTO_616 ?AUTO_615 ) ) ( CAN_TRAVERSE ?AUTO_614 ?AUTO_615 ?AUTO_616 ) ( AT ?AUTO_614 ?AUTO_615 ) ( VISIBLE ?AUTO_615 ?AUTO_616 ) ( ON_BOARD ?AUTO_618 ?AUTO_614 ) ( EQUIPPED_FOR_IMAGING ?AUTO_614 ) ( SUPPORTS ?AUTO_618 ?AUTO_613 ) ( VISIBLE_FROM ?AUTO_612 ?AUTO_615 ) ( CALIBRATION_TARGET ?AUTO_618 ?AUTO_612 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_614 ?AUTO_618 ?AUTO_612 ?AUTO_615 )
      ( GET_IMAGE_DATA ?AUTO_612 ?AUTO_613 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_612 ?AUTO_613 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_619 - OBJECTIVE
      ?AUTO_620 - MODE
    )
    :vars
    (
      ?AUTO_624 - LANDER
      ?AUTO_622 - WAYPOINT
      ?AUTO_623 - WAYPOINT
      ?AUTO_621 - ROVER
      ?AUTO_625 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_624 ?AUTO_622 ) ( VISIBLE ?AUTO_623 ?AUTO_622 ) ( AVAILABLE ?AUTO_621 ) ( CHANNEL_FREE ?AUTO_624 ) ( not ( = ?AUTO_623 ?AUTO_622 ) ) ( CAN_TRAVERSE ?AUTO_621 ?AUTO_622 ?AUTO_623 ) ( VISIBLE ?AUTO_622 ?AUTO_623 ) ( ON_BOARD ?AUTO_625 ?AUTO_621 ) ( EQUIPPED_FOR_IMAGING ?AUTO_621 ) ( SUPPORTS ?AUTO_625 ?AUTO_620 ) ( VISIBLE_FROM ?AUTO_619 ?AUTO_622 ) ( CALIBRATION_TARGET ?AUTO_625 ?AUTO_619 ) ( CAN_TRAVERSE ?AUTO_621 ?AUTO_623 ?AUTO_622 ) ( AT ?AUTO_621 ?AUTO_623 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_621 ?AUTO_623 ?AUTO_622 )
      ( GET_IMAGE_DATA ?AUTO_619 ?AUTO_620 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_619 ?AUTO_620 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_626 - OBJECTIVE
      ?AUTO_627 - MODE
    )
    :vars
    (
      ?AUTO_630 - LANDER
      ?AUTO_629 - WAYPOINT
      ?AUTO_631 - WAYPOINT
      ?AUTO_628 - ROVER
      ?AUTO_632 - CAMERA
      ?AUTO_633 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_630 ?AUTO_629 ) ( VISIBLE ?AUTO_631 ?AUTO_629 ) ( AVAILABLE ?AUTO_628 ) ( CHANNEL_FREE ?AUTO_630 ) ( not ( = ?AUTO_631 ?AUTO_629 ) ) ( CAN_TRAVERSE ?AUTO_628 ?AUTO_629 ?AUTO_631 ) ( VISIBLE ?AUTO_629 ?AUTO_631 ) ( ON_BOARD ?AUTO_632 ?AUTO_628 ) ( EQUIPPED_FOR_IMAGING ?AUTO_628 ) ( SUPPORTS ?AUTO_632 ?AUTO_627 ) ( VISIBLE_FROM ?AUTO_626 ?AUTO_629 ) ( CALIBRATION_TARGET ?AUTO_632 ?AUTO_626 ) ( CAN_TRAVERSE ?AUTO_628 ?AUTO_631 ?AUTO_629 ) ( CAN_TRAVERSE ?AUTO_628 ?AUTO_633 ?AUTO_631 ) ( AT ?AUTO_628 ?AUTO_633 ) ( VISIBLE ?AUTO_633 ?AUTO_631 ) ( not ( = ?AUTO_629 ?AUTO_633 ) ) ( not ( = ?AUTO_631 ?AUTO_633 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_628 ?AUTO_633 ?AUTO_631 )
      ( GET_IMAGE_DATA ?AUTO_626 ?AUTO_627 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_626 ?AUTO_627 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_634 - OBJECTIVE
      ?AUTO_635 - MODE
    )
    :vars
    (
      ?AUTO_641 - LANDER
      ?AUTO_638 - WAYPOINT
      ?AUTO_637 - WAYPOINT
      ?AUTO_639 - ROVER
      ?AUTO_636 - CAMERA
      ?AUTO_640 - WAYPOINT
      ?AUTO_642 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_641 ?AUTO_638 ) ( VISIBLE ?AUTO_637 ?AUTO_638 ) ( AVAILABLE ?AUTO_639 ) ( CHANNEL_FREE ?AUTO_641 ) ( not ( = ?AUTO_637 ?AUTO_638 ) ) ( CAN_TRAVERSE ?AUTO_639 ?AUTO_638 ?AUTO_637 ) ( VISIBLE ?AUTO_638 ?AUTO_637 ) ( ON_BOARD ?AUTO_636 ?AUTO_639 ) ( EQUIPPED_FOR_IMAGING ?AUTO_639 ) ( SUPPORTS ?AUTO_636 ?AUTO_635 ) ( VISIBLE_FROM ?AUTO_634 ?AUTO_638 ) ( CALIBRATION_TARGET ?AUTO_636 ?AUTO_634 ) ( CAN_TRAVERSE ?AUTO_639 ?AUTO_637 ?AUTO_638 ) ( CAN_TRAVERSE ?AUTO_639 ?AUTO_640 ?AUTO_637 ) ( VISIBLE ?AUTO_640 ?AUTO_637 ) ( not ( = ?AUTO_638 ?AUTO_640 ) ) ( not ( = ?AUTO_637 ?AUTO_640 ) ) ( CAN_TRAVERSE ?AUTO_639 ?AUTO_642 ?AUTO_640 ) ( AT ?AUTO_639 ?AUTO_642 ) ( VISIBLE ?AUTO_642 ?AUTO_640 ) ( not ( = ?AUTO_638 ?AUTO_642 ) ) ( not ( = ?AUTO_637 ?AUTO_642 ) ) ( not ( = ?AUTO_640 ?AUTO_642 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_639 ?AUTO_642 ?AUTO_640 )
      ( GET_IMAGE_DATA ?AUTO_634 ?AUTO_635 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_634 ?AUTO_635 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_643 - OBJECTIVE
      ?AUTO_644 - MODE
    )
    :vars
    (
      ?AUTO_651 - LANDER
      ?AUTO_647 - WAYPOINT
      ?AUTO_649 - WAYPOINT
      ?AUTO_645 - ROVER
      ?AUTO_648 - CAMERA
      ?AUTO_646 - WAYPOINT
      ?AUTO_650 - WAYPOINT
      ?AUTO_652 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_651 ?AUTO_647 ) ( VISIBLE ?AUTO_649 ?AUTO_647 ) ( AVAILABLE ?AUTO_645 ) ( CHANNEL_FREE ?AUTO_651 ) ( not ( = ?AUTO_649 ?AUTO_647 ) ) ( CAN_TRAVERSE ?AUTO_645 ?AUTO_647 ?AUTO_649 ) ( VISIBLE ?AUTO_647 ?AUTO_649 ) ( ON_BOARD ?AUTO_648 ?AUTO_645 ) ( EQUIPPED_FOR_IMAGING ?AUTO_645 ) ( SUPPORTS ?AUTO_648 ?AUTO_644 ) ( VISIBLE_FROM ?AUTO_643 ?AUTO_647 ) ( CALIBRATION_TARGET ?AUTO_648 ?AUTO_643 ) ( CAN_TRAVERSE ?AUTO_645 ?AUTO_649 ?AUTO_647 ) ( CAN_TRAVERSE ?AUTO_645 ?AUTO_646 ?AUTO_649 ) ( VISIBLE ?AUTO_646 ?AUTO_649 ) ( not ( = ?AUTO_647 ?AUTO_646 ) ) ( not ( = ?AUTO_649 ?AUTO_646 ) ) ( CAN_TRAVERSE ?AUTO_645 ?AUTO_650 ?AUTO_646 ) ( VISIBLE ?AUTO_650 ?AUTO_646 ) ( not ( = ?AUTO_647 ?AUTO_650 ) ) ( not ( = ?AUTO_649 ?AUTO_650 ) ) ( not ( = ?AUTO_646 ?AUTO_650 ) ) ( CAN_TRAVERSE ?AUTO_645 ?AUTO_652 ?AUTO_650 ) ( AT ?AUTO_645 ?AUTO_652 ) ( VISIBLE ?AUTO_652 ?AUTO_650 ) ( not ( = ?AUTO_647 ?AUTO_652 ) ) ( not ( = ?AUTO_649 ?AUTO_652 ) ) ( not ( = ?AUTO_646 ?AUTO_652 ) ) ( not ( = ?AUTO_650 ?AUTO_652 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_645 ?AUTO_652 ?AUTO_650 )
      ( GET_IMAGE_DATA ?AUTO_643 ?AUTO_644 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_643 ?AUTO_644 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_678 - WAYPOINT
    )
    :vars
    (
      ?AUTO_680 - LANDER
      ?AUTO_682 - WAYPOINT
      ?AUTO_679 - ROVER
      ?AUTO_681 - STORE
      ?AUTO_683 - WAYPOINT
      ?AUTO_684 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_680 ?AUTO_682 ) ( VISIBLE ?AUTO_678 ?AUTO_682 ) ( AVAILABLE ?AUTO_679 ) ( CHANNEL_FREE ?AUTO_680 ) ( not ( = ?AUTO_678 ?AUTO_682 ) ) ( AT_ROCK_SAMPLE ?AUTO_678 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_679 ) ( STORE_OF ?AUTO_681 ?AUTO_679 ) ( EMPTY ?AUTO_681 ) ( CAN_TRAVERSE ?AUTO_679 ?AUTO_683 ?AUTO_678 ) ( VISIBLE ?AUTO_683 ?AUTO_678 ) ( not ( = ?AUTO_678 ?AUTO_683 ) ) ( not ( = ?AUTO_682 ?AUTO_683 ) ) ( CAN_TRAVERSE ?AUTO_679 ?AUTO_684 ?AUTO_683 ) ( AT ?AUTO_679 ?AUTO_684 ) ( VISIBLE ?AUTO_684 ?AUTO_683 ) ( not ( = ?AUTO_678 ?AUTO_684 ) ) ( not ( = ?AUTO_682 ?AUTO_684 ) ) ( not ( = ?AUTO_683 ?AUTO_684 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_679 ?AUTO_684 ?AUTO_683 )
      ( GET_ROCK_DATA ?AUTO_678 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_678 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_685 - WAYPOINT
    )
    :vars
    (
      ?AUTO_686 - LANDER
      ?AUTO_688 - WAYPOINT
      ?AUTO_687 - ROVER
      ?AUTO_689 - STORE
      ?AUTO_690 - WAYPOINT
      ?AUTO_691 - WAYPOINT
      ?AUTO_692 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_686 ?AUTO_688 ) ( VISIBLE ?AUTO_685 ?AUTO_688 ) ( AVAILABLE ?AUTO_687 ) ( CHANNEL_FREE ?AUTO_686 ) ( not ( = ?AUTO_685 ?AUTO_688 ) ) ( AT_ROCK_SAMPLE ?AUTO_685 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_687 ) ( STORE_OF ?AUTO_689 ?AUTO_687 ) ( EMPTY ?AUTO_689 ) ( CAN_TRAVERSE ?AUTO_687 ?AUTO_690 ?AUTO_685 ) ( VISIBLE ?AUTO_690 ?AUTO_685 ) ( not ( = ?AUTO_685 ?AUTO_690 ) ) ( not ( = ?AUTO_688 ?AUTO_690 ) ) ( CAN_TRAVERSE ?AUTO_687 ?AUTO_691 ?AUTO_690 ) ( VISIBLE ?AUTO_691 ?AUTO_690 ) ( not ( = ?AUTO_685 ?AUTO_691 ) ) ( not ( = ?AUTO_688 ?AUTO_691 ) ) ( not ( = ?AUTO_690 ?AUTO_691 ) ) ( CAN_TRAVERSE ?AUTO_687 ?AUTO_692 ?AUTO_691 ) ( AT ?AUTO_687 ?AUTO_692 ) ( VISIBLE ?AUTO_692 ?AUTO_691 ) ( not ( = ?AUTO_685 ?AUTO_692 ) ) ( not ( = ?AUTO_688 ?AUTO_692 ) ) ( not ( = ?AUTO_690 ?AUTO_692 ) ) ( not ( = ?AUTO_691 ?AUTO_692 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_687 ?AUTO_692 ?AUTO_691 )
      ( GET_ROCK_DATA ?AUTO_685 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_685 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_694 - WAYPOINT
    )
    :vars
    (
      ?AUTO_695 - ROVER
      ?AUTO_698 - WAYPOINT
      ?AUTO_697 - LANDER
      ?AUTO_696 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_695 ?AUTO_698 ) ( AT_LANDER ?AUTO_697 ?AUTO_696 ) ( HAVE_SOIL_ANALYSIS ?AUTO_695 ?AUTO_694 ) ( VISIBLE ?AUTO_698 ?AUTO_696 ) ( AVAILABLE ?AUTO_695 ) ( CHANNEL_FREE ?AUTO_697 ) ( not ( = ?AUTO_694 ?AUTO_698 ) ) ( not ( = ?AUTO_694 ?AUTO_696 ) ) ( not ( = ?AUTO_698 ?AUTO_696 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_695 ?AUTO_697 ?AUTO_694 ?AUTO_698 ?AUTO_696 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_694 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_699 - WAYPOINT
    )
    :vars
    (
      ?AUTO_701 - LANDER
      ?AUTO_702 - WAYPOINT
      ?AUTO_700 - ROVER
      ?AUTO_703 - WAYPOINT
      ?AUTO_704 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_701 ?AUTO_702 ) ( HAVE_SOIL_ANALYSIS ?AUTO_700 ?AUTO_699 ) ( VISIBLE ?AUTO_703 ?AUTO_702 ) ( AVAILABLE ?AUTO_700 ) ( CHANNEL_FREE ?AUTO_701 ) ( not ( = ?AUTO_699 ?AUTO_703 ) ) ( not ( = ?AUTO_699 ?AUTO_702 ) ) ( not ( = ?AUTO_703 ?AUTO_702 ) ) ( CAN_TRAVERSE ?AUTO_700 ?AUTO_704 ?AUTO_703 ) ( AT ?AUTO_700 ?AUTO_704 ) ( VISIBLE ?AUTO_704 ?AUTO_703 ) ( not ( = ?AUTO_699 ?AUTO_704 ) ) ( not ( = ?AUTO_702 ?AUTO_704 ) ) ( not ( = ?AUTO_703 ?AUTO_704 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_700 ?AUTO_704 ?AUTO_703 )
      ( GET_SOIL_DATA ?AUTO_699 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_699 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_705 - WAYPOINT
    )
    :vars
    (
      ?AUTO_706 - LANDER
      ?AUTO_710 - WAYPOINT
      ?AUTO_707 - ROVER
      ?AUTO_709 - WAYPOINT
      ?AUTO_708 - WAYPOINT
      ?AUTO_711 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_706 ?AUTO_710 ) ( HAVE_SOIL_ANALYSIS ?AUTO_707 ?AUTO_705 ) ( VISIBLE ?AUTO_709 ?AUTO_710 ) ( AVAILABLE ?AUTO_707 ) ( CHANNEL_FREE ?AUTO_706 ) ( not ( = ?AUTO_705 ?AUTO_709 ) ) ( not ( = ?AUTO_705 ?AUTO_710 ) ) ( not ( = ?AUTO_709 ?AUTO_710 ) ) ( CAN_TRAVERSE ?AUTO_707 ?AUTO_708 ?AUTO_709 ) ( VISIBLE ?AUTO_708 ?AUTO_709 ) ( not ( = ?AUTO_705 ?AUTO_708 ) ) ( not ( = ?AUTO_710 ?AUTO_708 ) ) ( not ( = ?AUTO_709 ?AUTO_708 ) ) ( CAN_TRAVERSE ?AUTO_707 ?AUTO_711 ?AUTO_708 ) ( AT ?AUTO_707 ?AUTO_711 ) ( VISIBLE ?AUTO_711 ?AUTO_708 ) ( not ( = ?AUTO_705 ?AUTO_711 ) ) ( not ( = ?AUTO_710 ?AUTO_711 ) ) ( not ( = ?AUTO_709 ?AUTO_711 ) ) ( not ( = ?AUTO_708 ?AUTO_711 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_707 ?AUTO_711 ?AUTO_708 )
      ( GET_SOIL_DATA ?AUTO_705 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_705 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_712 - WAYPOINT
    )
    :vars
    (
      ?AUTO_715 - LANDER
      ?AUTO_714 - WAYPOINT
      ?AUTO_713 - ROVER
      ?AUTO_716 - WAYPOINT
      ?AUTO_718 - WAYPOINT
      ?AUTO_717 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_715 ?AUTO_714 ) ( HAVE_SOIL_ANALYSIS ?AUTO_713 ?AUTO_712 ) ( VISIBLE ?AUTO_716 ?AUTO_714 ) ( AVAILABLE ?AUTO_713 ) ( CHANNEL_FREE ?AUTO_715 ) ( not ( = ?AUTO_712 ?AUTO_716 ) ) ( not ( = ?AUTO_712 ?AUTO_714 ) ) ( not ( = ?AUTO_716 ?AUTO_714 ) ) ( CAN_TRAVERSE ?AUTO_713 ?AUTO_718 ?AUTO_716 ) ( VISIBLE ?AUTO_718 ?AUTO_716 ) ( not ( = ?AUTO_712 ?AUTO_718 ) ) ( not ( = ?AUTO_714 ?AUTO_718 ) ) ( not ( = ?AUTO_716 ?AUTO_718 ) ) ( CAN_TRAVERSE ?AUTO_713 ?AUTO_717 ?AUTO_718 ) ( VISIBLE ?AUTO_717 ?AUTO_718 ) ( not ( = ?AUTO_712 ?AUTO_717 ) ) ( not ( = ?AUTO_714 ?AUTO_717 ) ) ( not ( = ?AUTO_716 ?AUTO_717 ) ) ( not ( = ?AUTO_718 ?AUTO_717 ) ) ( CAN_TRAVERSE ?AUTO_713 ?AUTO_712 ?AUTO_717 ) ( AT ?AUTO_713 ?AUTO_712 ) ( VISIBLE ?AUTO_712 ?AUTO_717 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_713 ?AUTO_712 ?AUTO_717 )
      ( GET_SOIL_DATA ?AUTO_712 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_712 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_719 - WAYPOINT
    )
    :vars
    (
      ?AUTO_724 - LANDER
      ?AUTO_722 - WAYPOINT
      ?AUTO_725 - WAYPOINT
      ?AUTO_720 - ROVER
      ?AUTO_723 - WAYPOINT
      ?AUTO_721 - WAYPOINT
      ?AUTO_726 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_724 ?AUTO_722 ) ( VISIBLE ?AUTO_725 ?AUTO_722 ) ( AVAILABLE ?AUTO_720 ) ( CHANNEL_FREE ?AUTO_724 ) ( not ( = ?AUTO_719 ?AUTO_725 ) ) ( not ( = ?AUTO_719 ?AUTO_722 ) ) ( not ( = ?AUTO_725 ?AUTO_722 ) ) ( CAN_TRAVERSE ?AUTO_720 ?AUTO_723 ?AUTO_725 ) ( VISIBLE ?AUTO_723 ?AUTO_725 ) ( not ( = ?AUTO_719 ?AUTO_723 ) ) ( not ( = ?AUTO_722 ?AUTO_723 ) ) ( not ( = ?AUTO_725 ?AUTO_723 ) ) ( CAN_TRAVERSE ?AUTO_720 ?AUTO_721 ?AUTO_723 ) ( VISIBLE ?AUTO_721 ?AUTO_723 ) ( not ( = ?AUTO_719 ?AUTO_721 ) ) ( not ( = ?AUTO_722 ?AUTO_721 ) ) ( not ( = ?AUTO_725 ?AUTO_721 ) ) ( not ( = ?AUTO_723 ?AUTO_721 ) ) ( CAN_TRAVERSE ?AUTO_720 ?AUTO_719 ?AUTO_721 ) ( AT ?AUTO_720 ?AUTO_719 ) ( VISIBLE ?AUTO_719 ?AUTO_721 ) ( AT_SOIL_SAMPLE ?AUTO_719 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_720 ) ( STORE_OF ?AUTO_726 ?AUTO_720 ) ( EMPTY ?AUTO_726 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_720 ?AUTO_726 ?AUTO_719 )
      ( GET_SOIL_DATA ?AUTO_719 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_719 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_727 - WAYPOINT
    )
    :vars
    (
      ?AUTO_728 - LANDER
      ?AUTO_734 - WAYPOINT
      ?AUTO_731 - WAYPOINT
      ?AUTO_730 - ROVER
      ?AUTO_732 - WAYPOINT
      ?AUTO_729 - WAYPOINT
      ?AUTO_733 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_728 ?AUTO_734 ) ( VISIBLE ?AUTO_731 ?AUTO_734 ) ( AVAILABLE ?AUTO_730 ) ( CHANNEL_FREE ?AUTO_728 ) ( not ( = ?AUTO_727 ?AUTO_731 ) ) ( not ( = ?AUTO_727 ?AUTO_734 ) ) ( not ( = ?AUTO_731 ?AUTO_734 ) ) ( CAN_TRAVERSE ?AUTO_730 ?AUTO_732 ?AUTO_731 ) ( VISIBLE ?AUTO_732 ?AUTO_731 ) ( not ( = ?AUTO_727 ?AUTO_732 ) ) ( not ( = ?AUTO_734 ?AUTO_732 ) ) ( not ( = ?AUTO_731 ?AUTO_732 ) ) ( CAN_TRAVERSE ?AUTO_730 ?AUTO_729 ?AUTO_732 ) ( VISIBLE ?AUTO_729 ?AUTO_732 ) ( not ( = ?AUTO_727 ?AUTO_729 ) ) ( not ( = ?AUTO_734 ?AUTO_729 ) ) ( not ( = ?AUTO_731 ?AUTO_729 ) ) ( not ( = ?AUTO_732 ?AUTO_729 ) ) ( CAN_TRAVERSE ?AUTO_730 ?AUTO_727 ?AUTO_729 ) ( VISIBLE ?AUTO_727 ?AUTO_729 ) ( AT_SOIL_SAMPLE ?AUTO_727 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_730 ) ( STORE_OF ?AUTO_733 ?AUTO_730 ) ( EMPTY ?AUTO_733 ) ( CAN_TRAVERSE ?AUTO_730 ?AUTO_732 ?AUTO_727 ) ( AT ?AUTO_730 ?AUTO_732 ) ( VISIBLE ?AUTO_732 ?AUTO_727 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_730 ?AUTO_732 ?AUTO_727 )
      ( GET_SOIL_DATA ?AUTO_727 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_727 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_735 - WAYPOINT
    )
    :vars
    (
      ?AUTO_736 - LANDER
      ?AUTO_738 - WAYPOINT
      ?AUTO_739 - WAYPOINT
      ?AUTO_742 - ROVER
      ?AUTO_741 - WAYPOINT
      ?AUTO_737 - WAYPOINT
      ?AUTO_740 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_736 ?AUTO_738 ) ( VISIBLE ?AUTO_739 ?AUTO_738 ) ( AVAILABLE ?AUTO_742 ) ( CHANNEL_FREE ?AUTO_736 ) ( not ( = ?AUTO_735 ?AUTO_739 ) ) ( not ( = ?AUTO_735 ?AUTO_738 ) ) ( not ( = ?AUTO_739 ?AUTO_738 ) ) ( CAN_TRAVERSE ?AUTO_742 ?AUTO_741 ?AUTO_739 ) ( VISIBLE ?AUTO_741 ?AUTO_739 ) ( not ( = ?AUTO_735 ?AUTO_741 ) ) ( not ( = ?AUTO_738 ?AUTO_741 ) ) ( not ( = ?AUTO_739 ?AUTO_741 ) ) ( CAN_TRAVERSE ?AUTO_742 ?AUTO_737 ?AUTO_741 ) ( VISIBLE ?AUTO_737 ?AUTO_741 ) ( not ( = ?AUTO_735 ?AUTO_737 ) ) ( not ( = ?AUTO_738 ?AUTO_737 ) ) ( not ( = ?AUTO_739 ?AUTO_737 ) ) ( not ( = ?AUTO_741 ?AUTO_737 ) ) ( CAN_TRAVERSE ?AUTO_742 ?AUTO_735 ?AUTO_737 ) ( VISIBLE ?AUTO_735 ?AUTO_737 ) ( AT_SOIL_SAMPLE ?AUTO_735 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_742 ) ( STORE_OF ?AUTO_740 ?AUTO_742 ) ( EMPTY ?AUTO_740 ) ( CAN_TRAVERSE ?AUTO_742 ?AUTO_741 ?AUTO_735 ) ( VISIBLE ?AUTO_741 ?AUTO_735 ) ( CAN_TRAVERSE ?AUTO_742 ?AUTO_739 ?AUTO_741 ) ( AT ?AUTO_742 ?AUTO_739 ) ( VISIBLE ?AUTO_739 ?AUTO_741 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_742 ?AUTO_739 ?AUTO_741 )
      ( GET_SOIL_DATA ?AUTO_735 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_735 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_743 - WAYPOINT
    )
    :vars
    (
      ?AUTO_746 - LANDER
      ?AUTO_747 - WAYPOINT
      ?AUTO_750 - WAYPOINT
      ?AUTO_744 - ROVER
      ?AUTO_748 - WAYPOINT
      ?AUTO_745 - WAYPOINT
      ?AUTO_749 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_746 ?AUTO_747 ) ( VISIBLE ?AUTO_750 ?AUTO_747 ) ( AVAILABLE ?AUTO_744 ) ( CHANNEL_FREE ?AUTO_746 ) ( not ( = ?AUTO_743 ?AUTO_750 ) ) ( not ( = ?AUTO_743 ?AUTO_747 ) ) ( not ( = ?AUTO_750 ?AUTO_747 ) ) ( CAN_TRAVERSE ?AUTO_744 ?AUTO_748 ?AUTO_750 ) ( VISIBLE ?AUTO_748 ?AUTO_750 ) ( not ( = ?AUTO_743 ?AUTO_748 ) ) ( not ( = ?AUTO_747 ?AUTO_748 ) ) ( not ( = ?AUTO_750 ?AUTO_748 ) ) ( CAN_TRAVERSE ?AUTO_744 ?AUTO_745 ?AUTO_748 ) ( VISIBLE ?AUTO_745 ?AUTO_748 ) ( not ( = ?AUTO_743 ?AUTO_745 ) ) ( not ( = ?AUTO_747 ?AUTO_745 ) ) ( not ( = ?AUTO_750 ?AUTO_745 ) ) ( not ( = ?AUTO_748 ?AUTO_745 ) ) ( CAN_TRAVERSE ?AUTO_744 ?AUTO_743 ?AUTO_745 ) ( VISIBLE ?AUTO_743 ?AUTO_745 ) ( AT_SOIL_SAMPLE ?AUTO_743 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_744 ) ( STORE_OF ?AUTO_749 ?AUTO_744 ) ( CAN_TRAVERSE ?AUTO_744 ?AUTO_748 ?AUTO_743 ) ( VISIBLE ?AUTO_748 ?AUTO_743 ) ( CAN_TRAVERSE ?AUTO_744 ?AUTO_750 ?AUTO_748 ) ( AT ?AUTO_744 ?AUTO_750 ) ( VISIBLE ?AUTO_750 ?AUTO_748 ) ( FULL ?AUTO_749 ) )
    :subtasks
    ( ( !DROP ?AUTO_744 ?AUTO_749 )
      ( GET_SOIL_DATA ?AUTO_743 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_743 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_754 - WAYPOINT
    )
    :vars
    (
      ?AUTO_758 - LANDER
      ?AUTO_756 - WAYPOINT
      ?AUTO_760 - WAYPOINT
      ?AUTO_759 - ROVER
      ?AUTO_755 - WAYPOINT
      ?AUTO_757 - WAYPOINT
      ?AUTO_761 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_758 ?AUTO_756 ) ( VISIBLE ?AUTO_760 ?AUTO_756 ) ( AVAILABLE ?AUTO_759 ) ( CHANNEL_FREE ?AUTO_758 ) ( not ( = ?AUTO_754 ?AUTO_760 ) ) ( not ( = ?AUTO_754 ?AUTO_756 ) ) ( not ( = ?AUTO_760 ?AUTO_756 ) ) ( CAN_TRAVERSE ?AUTO_759 ?AUTO_755 ?AUTO_760 ) ( VISIBLE ?AUTO_755 ?AUTO_760 ) ( not ( = ?AUTO_754 ?AUTO_755 ) ) ( not ( = ?AUTO_756 ?AUTO_755 ) ) ( not ( = ?AUTO_760 ?AUTO_755 ) ) ( CAN_TRAVERSE ?AUTO_759 ?AUTO_757 ?AUTO_755 ) ( VISIBLE ?AUTO_757 ?AUTO_755 ) ( not ( = ?AUTO_754 ?AUTO_757 ) ) ( not ( = ?AUTO_756 ?AUTO_757 ) ) ( not ( = ?AUTO_760 ?AUTO_757 ) ) ( not ( = ?AUTO_755 ?AUTO_757 ) ) ( CAN_TRAVERSE ?AUTO_759 ?AUTO_754 ?AUTO_757 ) ( VISIBLE ?AUTO_754 ?AUTO_757 ) ( AT_SOIL_SAMPLE ?AUTO_754 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_759 ) ( STORE_OF ?AUTO_761 ?AUTO_759 ) ( EMPTY ?AUTO_761 ) ( CAN_TRAVERSE ?AUTO_759 ?AUTO_755 ?AUTO_754 ) ( VISIBLE ?AUTO_755 ?AUTO_754 ) ( CAN_TRAVERSE ?AUTO_759 ?AUTO_760 ?AUTO_755 ) ( VISIBLE ?AUTO_760 ?AUTO_755 ) ( CAN_TRAVERSE ?AUTO_759 ?AUTO_756 ?AUTO_760 ) ( AT ?AUTO_759 ?AUTO_756 ) ( VISIBLE ?AUTO_756 ?AUTO_760 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_759 ?AUTO_756 ?AUTO_760 )
      ( GET_SOIL_DATA ?AUTO_754 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_754 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_766 - WAYPOINT
    )
    :vars
    (
      ?AUTO_771 - LANDER
      ?AUTO_772 - WAYPOINT
      ?AUTO_773 - WAYPOINT
      ?AUTO_768 - ROVER
      ?AUTO_767 - WAYPOINT
      ?AUTO_769 - WAYPOINT
      ?AUTO_770 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_771 ?AUTO_772 ) ( VISIBLE ?AUTO_773 ?AUTO_772 ) ( AVAILABLE ?AUTO_768 ) ( CHANNEL_FREE ?AUTO_771 ) ( not ( = ?AUTO_766 ?AUTO_773 ) ) ( not ( = ?AUTO_766 ?AUTO_772 ) ) ( not ( = ?AUTO_773 ?AUTO_772 ) ) ( CAN_TRAVERSE ?AUTO_768 ?AUTO_767 ?AUTO_773 ) ( VISIBLE ?AUTO_767 ?AUTO_773 ) ( not ( = ?AUTO_766 ?AUTO_767 ) ) ( not ( = ?AUTO_772 ?AUTO_767 ) ) ( not ( = ?AUTO_773 ?AUTO_767 ) ) ( CAN_TRAVERSE ?AUTO_768 ?AUTO_769 ?AUTO_767 ) ( VISIBLE ?AUTO_769 ?AUTO_767 ) ( not ( = ?AUTO_766 ?AUTO_769 ) ) ( not ( = ?AUTO_772 ?AUTO_769 ) ) ( not ( = ?AUTO_773 ?AUTO_769 ) ) ( not ( = ?AUTO_767 ?AUTO_769 ) ) ( CAN_TRAVERSE ?AUTO_768 ?AUTO_766 ?AUTO_769 ) ( VISIBLE ?AUTO_766 ?AUTO_769 ) ( AT_SOIL_SAMPLE ?AUTO_766 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_768 ) ( STORE_OF ?AUTO_770 ?AUTO_768 ) ( EMPTY ?AUTO_770 ) ( CAN_TRAVERSE ?AUTO_768 ?AUTO_767 ?AUTO_766 ) ( VISIBLE ?AUTO_767 ?AUTO_766 ) ( AT ?AUTO_768 ?AUTO_769 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_768 ?AUTO_769 ?AUTO_767 )
      ( GET_SOIL_DATA ?AUTO_766 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_766 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_795 - OBJECTIVE
      ?AUTO_796 - MODE
    )
    :vars
    (
      ?AUTO_800 - LANDER
      ?AUTO_799 - WAYPOINT
      ?AUTO_798 - WAYPOINT
      ?AUTO_797 - ROVER
      ?AUTO_801 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_800 ?AUTO_799 ) ( VISIBLE ?AUTO_798 ?AUTO_799 ) ( AVAILABLE ?AUTO_797 ) ( CHANNEL_FREE ?AUTO_800 ) ( not ( = ?AUTO_798 ?AUTO_799 ) ) ( CAN_TRAVERSE ?AUTO_797 ?AUTO_799 ?AUTO_798 ) ( VISIBLE ?AUTO_799 ?AUTO_798 ) ( CALIBRATED ?AUTO_801 ?AUTO_797 ) ( ON_BOARD ?AUTO_801 ?AUTO_797 ) ( EQUIPPED_FOR_IMAGING ?AUTO_797 ) ( SUPPORTS ?AUTO_801 ?AUTO_796 ) ( VISIBLE_FROM ?AUTO_795 ?AUTO_799 ) ( CAN_TRAVERSE ?AUTO_797 ?AUTO_798 ?AUTO_799 ) ( AT ?AUTO_797 ?AUTO_798 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_797 ?AUTO_798 ?AUTO_799 )
      ( GET_IMAGE_DATA ?AUTO_795 ?AUTO_796 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_795 ?AUTO_796 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_802 - OBJECTIVE
      ?AUTO_803 - MODE
    )
    :vars
    (
      ?AUTO_807 - LANDER
      ?AUTO_808 - WAYPOINT
      ?AUTO_804 - WAYPOINT
      ?AUTO_805 - ROVER
      ?AUTO_806 - CAMERA
      ?AUTO_809 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_807 ?AUTO_808 ) ( VISIBLE ?AUTO_804 ?AUTO_808 ) ( AVAILABLE ?AUTO_805 ) ( CHANNEL_FREE ?AUTO_807 ) ( not ( = ?AUTO_804 ?AUTO_808 ) ) ( CAN_TRAVERSE ?AUTO_805 ?AUTO_808 ?AUTO_804 ) ( VISIBLE ?AUTO_808 ?AUTO_804 ) ( ON_BOARD ?AUTO_806 ?AUTO_805 ) ( EQUIPPED_FOR_IMAGING ?AUTO_805 ) ( SUPPORTS ?AUTO_806 ?AUTO_803 ) ( VISIBLE_FROM ?AUTO_802 ?AUTO_808 ) ( CAN_TRAVERSE ?AUTO_805 ?AUTO_804 ?AUTO_808 ) ( AT ?AUTO_805 ?AUTO_804 ) ( CALIBRATION_TARGET ?AUTO_806 ?AUTO_809 ) ( VISIBLE_FROM ?AUTO_809 ?AUTO_804 ) ( not ( = ?AUTO_802 ?AUTO_809 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_805 ?AUTO_806 ?AUTO_809 ?AUTO_804 )
      ( GET_IMAGE_DATA ?AUTO_802 ?AUTO_803 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_802 ?AUTO_803 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_844 - WAYPOINT
    )
    :vars
    (
      ?AUTO_846 - LANDER
      ?AUTO_848 - WAYPOINT
      ?AUTO_845 - ROVER
      ?AUTO_847 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_846 ?AUTO_848 ) ( VISIBLE ?AUTO_844 ?AUTO_848 ) ( AVAILABLE ?AUTO_845 ) ( CHANNEL_FREE ?AUTO_846 ) ( not ( = ?AUTO_844 ?AUTO_848 ) ) ( AT_ROCK_SAMPLE ?AUTO_844 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_845 ) ( STORE_OF ?AUTO_847 ?AUTO_845 ) ( CAN_TRAVERSE ?AUTO_845 ?AUTO_848 ?AUTO_844 ) ( AT ?AUTO_845 ?AUTO_848 ) ( VISIBLE ?AUTO_848 ?AUTO_844 ) ( FULL ?AUTO_847 ) )
    :subtasks
    ( ( !DROP ?AUTO_845 ?AUTO_847 )
      ( GET_ROCK_DATA ?AUTO_844 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_844 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_849 - WAYPOINT
    )
    :vars
    (
      ?AUTO_852 - LANDER
      ?AUTO_851 - WAYPOINT
      ?AUTO_850 - ROVER
      ?AUTO_853 - STORE
      ?AUTO_854 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_852 ?AUTO_851 ) ( VISIBLE ?AUTO_849 ?AUTO_851 ) ( AVAILABLE ?AUTO_850 ) ( CHANNEL_FREE ?AUTO_852 ) ( not ( = ?AUTO_849 ?AUTO_851 ) ) ( AT_ROCK_SAMPLE ?AUTO_849 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_850 ) ( STORE_OF ?AUTO_853 ?AUTO_850 ) ( CAN_TRAVERSE ?AUTO_850 ?AUTO_851 ?AUTO_849 ) ( VISIBLE ?AUTO_851 ?AUTO_849 ) ( FULL ?AUTO_853 ) ( CAN_TRAVERSE ?AUTO_850 ?AUTO_854 ?AUTO_851 ) ( AT ?AUTO_850 ?AUTO_854 ) ( VISIBLE ?AUTO_854 ?AUTO_851 ) ( not ( = ?AUTO_849 ?AUTO_854 ) ) ( not ( = ?AUTO_851 ?AUTO_854 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_850 ?AUTO_854 ?AUTO_851 )
      ( GET_ROCK_DATA ?AUTO_849 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_849 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_856 - WAYPOINT
    )
    :vars
    (
      ?AUTO_858 - LANDER
      ?AUTO_860 - WAYPOINT
      ?AUTO_861 - ROVER
      ?AUTO_859 - STORE
      ?AUTO_857 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_858 ?AUTO_860 ) ( VISIBLE ?AUTO_856 ?AUTO_860 ) ( AVAILABLE ?AUTO_861 ) ( CHANNEL_FREE ?AUTO_858 ) ( not ( = ?AUTO_856 ?AUTO_860 ) ) ( AT_ROCK_SAMPLE ?AUTO_856 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_861 ) ( STORE_OF ?AUTO_859 ?AUTO_861 ) ( CAN_TRAVERSE ?AUTO_861 ?AUTO_860 ?AUTO_856 ) ( VISIBLE ?AUTO_860 ?AUTO_856 ) ( CAN_TRAVERSE ?AUTO_861 ?AUTO_857 ?AUTO_860 ) ( AT ?AUTO_861 ?AUTO_857 ) ( VISIBLE ?AUTO_857 ?AUTO_860 ) ( not ( = ?AUTO_856 ?AUTO_857 ) ) ( not ( = ?AUTO_860 ?AUTO_857 ) ) ( AT_SOIL_SAMPLE ?AUTO_857 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_861 ) ( EMPTY ?AUTO_859 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_861 ?AUTO_859 ?AUTO_857 )
      ( GET_ROCK_DATA ?AUTO_856 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_856 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_877 - OBJECTIVE
      ?AUTO_878 - MODE
    )
    :vars
    (
      ?AUTO_880 - LANDER
      ?AUTO_879 - WAYPOINT
      ?AUTO_881 - WAYPOINT
      ?AUTO_882 - ROVER
      ?AUTO_883 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_880 ?AUTO_879 ) ( VISIBLE ?AUTO_881 ?AUTO_879 ) ( AVAILABLE ?AUTO_882 ) ( CHANNEL_FREE ?AUTO_880 ) ( not ( = ?AUTO_881 ?AUTO_879 ) ) ( CALIBRATED ?AUTO_883 ?AUTO_882 ) ( ON_BOARD ?AUTO_883 ?AUTO_882 ) ( EQUIPPED_FOR_IMAGING ?AUTO_882 ) ( SUPPORTS ?AUTO_883 ?AUTO_878 ) ( VISIBLE_FROM ?AUTO_877 ?AUTO_881 ) ( CAN_TRAVERSE ?AUTO_882 ?AUTO_879 ?AUTO_881 ) ( AT ?AUTO_882 ?AUTO_879 ) ( VISIBLE ?AUTO_879 ?AUTO_881 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_882 ?AUTO_879 ?AUTO_881 )
      ( GET_IMAGE_DATA ?AUTO_877 ?AUTO_878 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_877 ?AUTO_878 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_884 - OBJECTIVE
      ?AUTO_885 - MODE
    )
    :vars
    (
      ?AUTO_887 - LANDER
      ?AUTO_886 - WAYPOINT
      ?AUTO_889 - WAYPOINT
      ?AUTO_888 - ROVER
      ?AUTO_890 - CAMERA
      ?AUTO_891 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_887 ?AUTO_886 ) ( VISIBLE ?AUTO_889 ?AUTO_886 ) ( AVAILABLE ?AUTO_888 ) ( CHANNEL_FREE ?AUTO_887 ) ( not ( = ?AUTO_889 ?AUTO_886 ) ) ( ON_BOARD ?AUTO_890 ?AUTO_888 ) ( EQUIPPED_FOR_IMAGING ?AUTO_888 ) ( SUPPORTS ?AUTO_890 ?AUTO_885 ) ( VISIBLE_FROM ?AUTO_884 ?AUTO_889 ) ( CAN_TRAVERSE ?AUTO_888 ?AUTO_886 ?AUTO_889 ) ( AT ?AUTO_888 ?AUTO_886 ) ( VISIBLE ?AUTO_886 ?AUTO_889 ) ( CALIBRATION_TARGET ?AUTO_890 ?AUTO_891 ) ( VISIBLE_FROM ?AUTO_891 ?AUTO_886 ) ( not ( = ?AUTO_884 ?AUTO_891 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_888 ?AUTO_890 ?AUTO_891 ?AUTO_886 )
      ( GET_IMAGE_DATA ?AUTO_884 ?AUTO_885 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_884 ?AUTO_885 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_894 - OBJECTIVE
      ?AUTO_895 - MODE
    )
    :vars
    (
      ?AUTO_898 - LANDER
      ?AUTO_901 - WAYPOINT
      ?AUTO_900 - WAYPOINT
      ?AUTO_896 - ROVER
      ?AUTO_899 - CAMERA
      ?AUTO_897 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_898 ?AUTO_901 ) ( VISIBLE ?AUTO_900 ?AUTO_901 ) ( AVAILABLE ?AUTO_896 ) ( CHANNEL_FREE ?AUTO_898 ) ( not ( = ?AUTO_900 ?AUTO_901 ) ) ( ON_BOARD ?AUTO_899 ?AUTO_896 ) ( EQUIPPED_FOR_IMAGING ?AUTO_896 ) ( SUPPORTS ?AUTO_899 ?AUTO_895 ) ( VISIBLE_FROM ?AUTO_894 ?AUTO_900 ) ( CAN_TRAVERSE ?AUTO_896 ?AUTO_901 ?AUTO_900 ) ( VISIBLE ?AUTO_901 ?AUTO_900 ) ( CALIBRATION_TARGET ?AUTO_899 ?AUTO_897 ) ( VISIBLE_FROM ?AUTO_897 ?AUTO_901 ) ( not ( = ?AUTO_894 ?AUTO_897 ) ) ( CAN_TRAVERSE ?AUTO_896 ?AUTO_900 ?AUTO_901 ) ( AT ?AUTO_896 ?AUTO_900 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_896 ?AUTO_900 ?AUTO_901 )
      ( GET_IMAGE_DATA ?AUTO_894 ?AUTO_895 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_894 ?AUTO_895 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_924 - OBJECTIVE
      ?AUTO_925 - MODE
    )
    :vars
    (
      ?AUTO_926 - LANDER
      ?AUTO_928 - WAYPOINT
      ?AUTO_927 - WAYPOINT
      ?AUTO_929 - ROVER
      ?AUTO_930 - CAMERA
      ?AUTO_931 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_926 ?AUTO_928 ) ( VISIBLE ?AUTO_927 ?AUTO_928 ) ( AVAILABLE ?AUTO_929 ) ( CHANNEL_FREE ?AUTO_926 ) ( not ( = ?AUTO_927 ?AUTO_928 ) ) ( CALIBRATED ?AUTO_930 ?AUTO_929 ) ( ON_BOARD ?AUTO_930 ?AUTO_929 ) ( EQUIPPED_FOR_IMAGING ?AUTO_929 ) ( SUPPORTS ?AUTO_930 ?AUTO_925 ) ( VISIBLE_FROM ?AUTO_924 ?AUTO_927 ) ( CAN_TRAVERSE ?AUTO_929 ?AUTO_928 ?AUTO_927 ) ( VISIBLE ?AUTO_928 ?AUTO_927 ) ( CAN_TRAVERSE ?AUTO_929 ?AUTO_931 ?AUTO_928 ) ( AT ?AUTO_929 ?AUTO_931 ) ( VISIBLE ?AUTO_931 ?AUTO_928 ) ( not ( = ?AUTO_928 ?AUTO_931 ) ) ( not ( = ?AUTO_927 ?AUTO_931 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_929 ?AUTO_931 ?AUTO_928 )
      ( GET_IMAGE_DATA ?AUTO_924 ?AUTO_925 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_924 ?AUTO_925 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_984 - WAYPOINT
    )
    :vars
    (
      ?AUTO_985 - ROVER
      ?AUTO_987 - WAYPOINT
      ?AUTO_986 - LANDER
    )
    :precondition
    ( and ( AT ?AUTO_985 ?AUTO_987 ) ( AT_LANDER ?AUTO_986 ?AUTO_984 ) ( HAVE_SOIL_ANALYSIS ?AUTO_985 ?AUTO_984 ) ( VISIBLE ?AUTO_987 ?AUTO_984 ) ( AVAILABLE ?AUTO_985 ) ( CHANNEL_FREE ?AUTO_986 ) ( not ( = ?AUTO_984 ?AUTO_987 ) ) )
    :subtasks
    ( ( !COMMUNICATE_SOIL_DATA ?AUTO_985 ?AUTO_986 ?AUTO_984 ?AUTO_987 ?AUTO_984 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_984 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_988 - WAYPOINT
    )
    :vars
    (
      ?AUTO_989 - LANDER
      ?AUTO_991 - ROVER
      ?AUTO_990 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_989 ?AUTO_988 ) ( HAVE_SOIL_ANALYSIS ?AUTO_991 ?AUTO_988 ) ( VISIBLE ?AUTO_990 ?AUTO_988 ) ( AVAILABLE ?AUTO_991 ) ( CHANNEL_FREE ?AUTO_989 ) ( not ( = ?AUTO_988 ?AUTO_990 ) ) ( CAN_TRAVERSE ?AUTO_991 ?AUTO_988 ?AUTO_990 ) ( AT ?AUTO_991 ?AUTO_988 ) ( VISIBLE ?AUTO_988 ?AUTO_990 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_991 ?AUTO_988 ?AUTO_990 )
      ( GET_SOIL_DATA ?AUTO_988 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_988 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_993 - WAYPOINT
    )
    :vars
    (
      ?AUTO_994 - LANDER
      ?AUTO_995 - WAYPOINT
      ?AUTO_996 - ROVER
      ?AUTO_997 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_994 ?AUTO_993 ) ( VISIBLE ?AUTO_995 ?AUTO_993 ) ( AVAILABLE ?AUTO_996 ) ( CHANNEL_FREE ?AUTO_994 ) ( not ( = ?AUTO_993 ?AUTO_995 ) ) ( CAN_TRAVERSE ?AUTO_996 ?AUTO_993 ?AUTO_995 ) ( AT ?AUTO_996 ?AUTO_993 ) ( VISIBLE ?AUTO_993 ?AUTO_995 ) ( AT_SOIL_SAMPLE ?AUTO_993 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_996 ) ( STORE_OF ?AUTO_997 ?AUTO_996 ) ( EMPTY ?AUTO_997 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_996 ?AUTO_997 ?AUTO_993 )
      ( GET_SOIL_DATA ?AUTO_993 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_993 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1004 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1008 - LANDER
      ?AUTO_1005 - WAYPOINT
      ?AUTO_1007 - ROVER
      ?AUTO_1006 - STORE
      ?AUTO_1009 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1008 ?AUTO_1004 ) ( VISIBLE ?AUTO_1005 ?AUTO_1004 ) ( AVAILABLE ?AUTO_1007 ) ( CHANNEL_FREE ?AUTO_1008 ) ( not ( = ?AUTO_1004 ?AUTO_1005 ) ) ( CAN_TRAVERSE ?AUTO_1007 ?AUTO_1004 ?AUTO_1005 ) ( VISIBLE ?AUTO_1004 ?AUTO_1005 ) ( AT_SOIL_SAMPLE ?AUTO_1004 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1007 ) ( STORE_OF ?AUTO_1006 ?AUTO_1007 ) ( EMPTY ?AUTO_1006 ) ( CAN_TRAVERSE ?AUTO_1007 ?AUTO_1009 ?AUTO_1004 ) ( AT ?AUTO_1007 ?AUTO_1009 ) ( VISIBLE ?AUTO_1009 ?AUTO_1004 ) ( not ( = ?AUTO_1004 ?AUTO_1009 ) ) ( not ( = ?AUTO_1005 ?AUTO_1009 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1007 ?AUTO_1009 ?AUTO_1004 )
      ( GET_SOIL_DATA ?AUTO_1004 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1004 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1027 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1031 - LANDER
      ?AUTO_1029 - WAYPOINT
      ?AUTO_1028 - ROVER
      ?AUTO_1030 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1031 ?AUTO_1029 ) ( VISIBLE ?AUTO_1027 ?AUTO_1029 ) ( AVAILABLE ?AUTO_1028 ) ( CHANNEL_FREE ?AUTO_1031 ) ( not ( = ?AUTO_1027 ?AUTO_1029 ) ) ( AT_SOIL_SAMPLE ?AUTO_1027 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1028 ) ( STORE_OF ?AUTO_1030 ?AUTO_1028 ) ( CAN_TRAVERSE ?AUTO_1028 ?AUTO_1029 ?AUTO_1027 ) ( AT ?AUTO_1028 ?AUTO_1029 ) ( VISIBLE ?AUTO_1029 ?AUTO_1027 ) ( FULL ?AUTO_1030 ) )
    :subtasks
    ( ( !DROP ?AUTO_1028 ?AUTO_1030 )
      ( GET_SOIL_DATA ?AUTO_1027 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1027 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1092 - OBJECTIVE
      ?AUTO_1093 - MODE
    )
    :vars
    (
      ?AUTO_1097 - ROVER
      ?AUTO_1098 - WAYPOINT
      ?AUTO_1094 - LANDER
      ?AUTO_1096 - WAYPOINT
      ?AUTO_1095 - CAMERA
      ?AUTO_1099 - OBJECTIVE
    )
    :precondition
    ( and ( AT ?AUTO_1097 ?AUTO_1098 ) ( AT_LANDER ?AUTO_1094 ?AUTO_1096 ) ( VISIBLE ?AUTO_1098 ?AUTO_1096 ) ( AVAILABLE ?AUTO_1097 ) ( CHANNEL_FREE ?AUTO_1094 ) ( not ( = ?AUTO_1098 ?AUTO_1096 ) ) ( ON_BOARD ?AUTO_1095 ?AUTO_1097 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1097 ) ( SUPPORTS ?AUTO_1095 ?AUTO_1093 ) ( VISIBLE_FROM ?AUTO_1092 ?AUTO_1098 ) ( CALIBRATION_TARGET ?AUTO_1095 ?AUTO_1099 ) ( VISIBLE_FROM ?AUTO_1099 ?AUTO_1098 ) ( not ( = ?AUTO_1092 ?AUTO_1099 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1097 ?AUTO_1095 ?AUTO_1099 ?AUTO_1098 )
      ( GET_IMAGE_DATA ?AUTO_1092 ?AUTO_1093 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1092 ?AUTO_1093 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1100 - OBJECTIVE
      ?AUTO_1101 - MODE
    )
    :vars
    (
      ?AUTO_1105 - LANDER
      ?AUTO_1106 - WAYPOINT
      ?AUTO_1103 - WAYPOINT
      ?AUTO_1102 - ROVER
      ?AUTO_1104 - CAMERA
      ?AUTO_1107 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1105 ?AUTO_1106 ) ( VISIBLE ?AUTO_1103 ?AUTO_1106 ) ( AVAILABLE ?AUTO_1102 ) ( CHANNEL_FREE ?AUTO_1105 ) ( not ( = ?AUTO_1103 ?AUTO_1106 ) ) ( ON_BOARD ?AUTO_1104 ?AUTO_1102 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1102 ) ( SUPPORTS ?AUTO_1104 ?AUTO_1101 ) ( VISIBLE_FROM ?AUTO_1100 ?AUTO_1103 ) ( CALIBRATION_TARGET ?AUTO_1104 ?AUTO_1107 ) ( VISIBLE_FROM ?AUTO_1107 ?AUTO_1103 ) ( not ( = ?AUTO_1100 ?AUTO_1107 ) ) ( CAN_TRAVERSE ?AUTO_1102 ?AUTO_1106 ?AUTO_1103 ) ( AT ?AUTO_1102 ?AUTO_1106 ) ( VISIBLE ?AUTO_1106 ?AUTO_1103 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1102 ?AUTO_1106 ?AUTO_1103 )
      ( GET_IMAGE_DATA ?AUTO_1100 ?AUTO_1101 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1100 ?AUTO_1101 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1153 - OBJECTIVE
      ?AUTO_1154 - MODE
    )
    :vars
    (
      ?AUTO_1158 - LANDER
      ?AUTO_1156 - WAYPOINT
      ?AUTO_1159 - WAYPOINT
      ?AUTO_1155 - ROVER
      ?AUTO_1157 - CAMERA
      ?AUTO_1160 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1158 ?AUTO_1156 ) ( VISIBLE ?AUTO_1159 ?AUTO_1156 ) ( AVAILABLE ?AUTO_1155 ) ( CHANNEL_FREE ?AUTO_1158 ) ( not ( = ?AUTO_1159 ?AUTO_1156 ) ) ( CAN_TRAVERSE ?AUTO_1155 ?AUTO_1156 ?AUTO_1159 ) ( VISIBLE ?AUTO_1156 ?AUTO_1159 ) ( CALIBRATED ?AUTO_1157 ?AUTO_1155 ) ( ON_BOARD ?AUTO_1157 ?AUTO_1155 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1155 ) ( SUPPORTS ?AUTO_1157 ?AUTO_1154 ) ( VISIBLE_FROM ?AUTO_1153 ?AUTO_1156 ) ( CAN_TRAVERSE ?AUTO_1155 ?AUTO_1160 ?AUTO_1156 ) ( AT ?AUTO_1155 ?AUTO_1160 ) ( VISIBLE ?AUTO_1160 ?AUTO_1156 ) ( not ( = ?AUTO_1156 ?AUTO_1160 ) ) ( not ( = ?AUTO_1159 ?AUTO_1160 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1155 ?AUTO_1160 ?AUTO_1156 )
      ( GET_IMAGE_DATA ?AUTO_1153 ?AUTO_1154 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1153 ?AUTO_1154 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1161 - OBJECTIVE
      ?AUTO_1162 - MODE
    )
    :vars
    (
      ?AUTO_1165 - LANDER
      ?AUTO_1163 - WAYPOINT
      ?AUTO_1164 - WAYPOINT
      ?AUTO_1167 - ROVER
      ?AUTO_1166 - CAMERA
      ?AUTO_1168 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1165 ?AUTO_1163 ) ( VISIBLE ?AUTO_1164 ?AUTO_1163 ) ( AVAILABLE ?AUTO_1167 ) ( CHANNEL_FREE ?AUTO_1165 ) ( not ( = ?AUTO_1164 ?AUTO_1163 ) ) ( CAN_TRAVERSE ?AUTO_1167 ?AUTO_1163 ?AUTO_1164 ) ( VISIBLE ?AUTO_1163 ?AUTO_1164 ) ( CALIBRATED ?AUTO_1166 ?AUTO_1167 ) ( ON_BOARD ?AUTO_1166 ?AUTO_1167 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1167 ) ( SUPPORTS ?AUTO_1166 ?AUTO_1162 ) ( VISIBLE_FROM ?AUTO_1161 ?AUTO_1163 ) ( CAN_TRAVERSE ?AUTO_1167 ?AUTO_1168 ?AUTO_1163 ) ( VISIBLE ?AUTO_1168 ?AUTO_1163 ) ( not ( = ?AUTO_1163 ?AUTO_1168 ) ) ( not ( = ?AUTO_1164 ?AUTO_1168 ) ) ( CAN_TRAVERSE ?AUTO_1167 ?AUTO_1164 ?AUTO_1168 ) ( AT ?AUTO_1167 ?AUTO_1164 ) ( VISIBLE ?AUTO_1164 ?AUTO_1168 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1167 ?AUTO_1164 ?AUTO_1168 )
      ( GET_IMAGE_DATA ?AUTO_1161 ?AUTO_1162 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1161 ?AUTO_1162 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1173 - OBJECTIVE
      ?AUTO_1174 - MODE
    )
    :vars
    (
      ?AUTO_1176 - LANDER
      ?AUTO_1175 - WAYPOINT
      ?AUTO_1177 - WAYPOINT
      ?AUTO_1179 - ROVER
      ?AUTO_1178 - CAMERA
      ?AUTO_1180 - WAYPOINT
      ?AUTO_1181 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1176 ?AUTO_1175 ) ( VISIBLE ?AUTO_1177 ?AUTO_1175 ) ( AVAILABLE ?AUTO_1179 ) ( CHANNEL_FREE ?AUTO_1176 ) ( not ( = ?AUTO_1177 ?AUTO_1175 ) ) ( CAN_TRAVERSE ?AUTO_1179 ?AUTO_1175 ?AUTO_1177 ) ( VISIBLE ?AUTO_1175 ?AUTO_1177 ) ( ON_BOARD ?AUTO_1178 ?AUTO_1179 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1179 ) ( SUPPORTS ?AUTO_1178 ?AUTO_1174 ) ( VISIBLE_FROM ?AUTO_1173 ?AUTO_1175 ) ( CAN_TRAVERSE ?AUTO_1179 ?AUTO_1180 ?AUTO_1175 ) ( VISIBLE ?AUTO_1180 ?AUTO_1175 ) ( not ( = ?AUTO_1175 ?AUTO_1180 ) ) ( not ( = ?AUTO_1177 ?AUTO_1180 ) ) ( CAN_TRAVERSE ?AUTO_1179 ?AUTO_1177 ?AUTO_1180 ) ( AT ?AUTO_1179 ?AUTO_1177 ) ( VISIBLE ?AUTO_1177 ?AUTO_1180 ) ( CALIBRATION_TARGET ?AUTO_1178 ?AUTO_1181 ) ( VISIBLE_FROM ?AUTO_1181 ?AUTO_1177 ) ( not ( = ?AUTO_1173 ?AUTO_1181 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1179 ?AUTO_1178 ?AUTO_1181 ?AUTO_1177 )
      ( GET_IMAGE_DATA ?AUTO_1173 ?AUTO_1174 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1173 ?AUTO_1174 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1182 - OBJECTIVE
      ?AUTO_1183 - MODE
    )
    :vars
    (
      ?AUTO_1186 - LANDER
      ?AUTO_1184 - WAYPOINT
      ?AUTO_1189 - WAYPOINT
      ?AUTO_1190 - ROVER
      ?AUTO_1185 - CAMERA
      ?AUTO_1188 - WAYPOINT
      ?AUTO_1187 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1186 ?AUTO_1184 ) ( VISIBLE ?AUTO_1189 ?AUTO_1184 ) ( AVAILABLE ?AUTO_1190 ) ( CHANNEL_FREE ?AUTO_1186 ) ( not ( = ?AUTO_1189 ?AUTO_1184 ) ) ( CAN_TRAVERSE ?AUTO_1190 ?AUTO_1184 ?AUTO_1189 ) ( VISIBLE ?AUTO_1184 ?AUTO_1189 ) ( ON_BOARD ?AUTO_1185 ?AUTO_1190 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1190 ) ( SUPPORTS ?AUTO_1185 ?AUTO_1183 ) ( VISIBLE_FROM ?AUTO_1182 ?AUTO_1184 ) ( CAN_TRAVERSE ?AUTO_1190 ?AUTO_1188 ?AUTO_1184 ) ( VISIBLE ?AUTO_1188 ?AUTO_1184 ) ( not ( = ?AUTO_1184 ?AUTO_1188 ) ) ( not ( = ?AUTO_1189 ?AUTO_1188 ) ) ( CAN_TRAVERSE ?AUTO_1190 ?AUTO_1189 ?AUTO_1188 ) ( VISIBLE ?AUTO_1189 ?AUTO_1188 ) ( CALIBRATION_TARGET ?AUTO_1185 ?AUTO_1187 ) ( VISIBLE_FROM ?AUTO_1187 ?AUTO_1189 ) ( not ( = ?AUTO_1182 ?AUTO_1187 ) ) ( AT ?AUTO_1190 ?AUTO_1184 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1190 ?AUTO_1184 ?AUTO_1189 )
      ( GET_IMAGE_DATA ?AUTO_1182 ?AUTO_1183 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1182 ?AUTO_1183 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1191 - OBJECTIVE
      ?AUTO_1192 - MODE
    )
    :vars
    (
      ?AUTO_1196 - LANDER
      ?AUTO_1194 - WAYPOINT
      ?AUTO_1198 - WAYPOINT
      ?AUTO_1195 - ROVER
      ?AUTO_1193 - CAMERA
      ?AUTO_1199 - WAYPOINT
      ?AUTO_1197 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1196 ?AUTO_1194 ) ( VISIBLE ?AUTO_1198 ?AUTO_1194 ) ( AVAILABLE ?AUTO_1195 ) ( CHANNEL_FREE ?AUTO_1196 ) ( not ( = ?AUTO_1198 ?AUTO_1194 ) ) ( CAN_TRAVERSE ?AUTO_1195 ?AUTO_1194 ?AUTO_1198 ) ( VISIBLE ?AUTO_1194 ?AUTO_1198 ) ( ON_BOARD ?AUTO_1193 ?AUTO_1195 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1195 ) ( SUPPORTS ?AUTO_1193 ?AUTO_1192 ) ( VISIBLE_FROM ?AUTO_1191 ?AUTO_1194 ) ( CAN_TRAVERSE ?AUTO_1195 ?AUTO_1199 ?AUTO_1194 ) ( VISIBLE ?AUTO_1199 ?AUTO_1194 ) ( not ( = ?AUTO_1194 ?AUTO_1199 ) ) ( not ( = ?AUTO_1198 ?AUTO_1199 ) ) ( CAN_TRAVERSE ?AUTO_1195 ?AUTO_1198 ?AUTO_1199 ) ( VISIBLE ?AUTO_1198 ?AUTO_1199 ) ( CALIBRATION_TARGET ?AUTO_1193 ?AUTO_1197 ) ( VISIBLE_FROM ?AUTO_1197 ?AUTO_1198 ) ( not ( = ?AUTO_1191 ?AUTO_1197 ) ) ( AT ?AUTO_1195 ?AUTO_1199 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1195 ?AUTO_1199 ?AUTO_1194 )
      ( GET_IMAGE_DATA ?AUTO_1191 ?AUTO_1192 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1191 ?AUTO_1192 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1271 - OBJECTIVE
      ?AUTO_1272 - MODE
    )
    :vars
    (
      ?AUTO_1277 - LANDER
      ?AUTO_1274 - WAYPOINT
      ?AUTO_1275 - WAYPOINT
      ?AUTO_1278 - ROVER
      ?AUTO_1273 - CAMERA
      ?AUTO_1276 - WAYPOINT
      ?AUTO_1279 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1277 ?AUTO_1274 ) ( VISIBLE ?AUTO_1275 ?AUTO_1274 ) ( AVAILABLE ?AUTO_1278 ) ( CHANNEL_FREE ?AUTO_1277 ) ( not ( = ?AUTO_1275 ?AUTO_1274 ) ) ( ON_BOARD ?AUTO_1273 ?AUTO_1278 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1278 ) ( SUPPORTS ?AUTO_1273 ?AUTO_1272 ) ( VISIBLE_FROM ?AUTO_1271 ?AUTO_1275 ) ( CAN_TRAVERSE ?AUTO_1278 ?AUTO_1274 ?AUTO_1275 ) ( VISIBLE ?AUTO_1274 ?AUTO_1275 ) ( CAN_TRAVERSE ?AUTO_1278 ?AUTO_1276 ?AUTO_1274 ) ( AT ?AUTO_1278 ?AUTO_1276 ) ( VISIBLE ?AUTO_1276 ?AUTO_1274 ) ( not ( = ?AUTO_1274 ?AUTO_1276 ) ) ( not ( = ?AUTO_1275 ?AUTO_1276 ) ) ( CALIBRATION_TARGET ?AUTO_1273 ?AUTO_1279 ) ( VISIBLE_FROM ?AUTO_1279 ?AUTO_1276 ) ( not ( = ?AUTO_1271 ?AUTO_1279 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1278 ?AUTO_1273 ?AUTO_1279 ?AUTO_1276 )
      ( GET_IMAGE_DATA ?AUTO_1271 ?AUTO_1272 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1271 ?AUTO_1272 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1304 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1305 - LANDER
      ?AUTO_1307 - WAYPOINT
      ?AUTO_1306 - ROVER
      ?AUTO_1308 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1305 ?AUTO_1304 ) ( VISIBLE ?AUTO_1307 ?AUTO_1304 ) ( AVAILABLE ?AUTO_1306 ) ( CHANNEL_FREE ?AUTO_1305 ) ( not ( = ?AUTO_1304 ?AUTO_1307 ) ) ( CAN_TRAVERSE ?AUTO_1306 ?AUTO_1304 ?AUTO_1307 ) ( VISIBLE ?AUTO_1304 ?AUTO_1307 ) ( AT_SOIL_SAMPLE ?AUTO_1304 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1306 ) ( STORE_OF ?AUTO_1308 ?AUTO_1306 ) ( EMPTY ?AUTO_1308 ) ( CAN_TRAVERSE ?AUTO_1306 ?AUTO_1307 ?AUTO_1304 ) ( AT ?AUTO_1306 ?AUTO_1307 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1306 ?AUTO_1307 ?AUTO_1304 )
      ( GET_SOIL_DATA ?AUTO_1304 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1304 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1334 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1336 - LANDER
      ?AUTO_1337 - WAYPOINT
      ?AUTO_1335 - ROVER
      ?AUTO_1338 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1336 ?AUTO_1334 ) ( VISIBLE ?AUTO_1337 ?AUTO_1334 ) ( AVAILABLE ?AUTO_1335 ) ( CHANNEL_FREE ?AUTO_1336 ) ( not ( = ?AUTO_1334 ?AUTO_1337 ) ) ( CAN_TRAVERSE ?AUTO_1335 ?AUTO_1334 ?AUTO_1337 ) ( AT ?AUTO_1335 ?AUTO_1334 ) ( VISIBLE ?AUTO_1334 ?AUTO_1337 ) ( AT_ROCK_SAMPLE ?AUTO_1334 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1335 ) ( STORE_OF ?AUTO_1338 ?AUTO_1335 ) ( FULL ?AUTO_1338 ) )
    :subtasks
    ( ( !DROP ?AUTO_1335 ?AUTO_1338 )
      ( GET_ROCK_DATA ?AUTO_1334 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1334 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1340 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1341 - LANDER
      ?AUTO_1342 - WAYPOINT
      ?AUTO_1344 - ROVER
      ?AUTO_1343 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1341 ?AUTO_1340 ) ( VISIBLE ?AUTO_1342 ?AUTO_1340 ) ( AVAILABLE ?AUTO_1344 ) ( CHANNEL_FREE ?AUTO_1341 ) ( not ( = ?AUTO_1340 ?AUTO_1342 ) ) ( CAN_TRAVERSE ?AUTO_1344 ?AUTO_1340 ?AUTO_1342 ) ( VISIBLE ?AUTO_1340 ?AUTO_1342 ) ( AT_ROCK_SAMPLE ?AUTO_1340 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1344 ) ( STORE_OF ?AUTO_1343 ?AUTO_1344 ) ( EMPTY ?AUTO_1343 ) ( CAN_TRAVERSE ?AUTO_1344 ?AUTO_1342 ?AUTO_1340 ) ( AT ?AUTO_1344 ?AUTO_1342 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1344 ?AUTO_1342 ?AUTO_1340 )
      ( GET_ROCK_DATA ?AUTO_1340 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1340 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1400 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1404 - LANDER
      ?AUTO_1402 - WAYPOINT
      ?AUTO_1403 - ROVER
      ?AUTO_1401 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1404 ?AUTO_1402 ) ( HAVE_SOIL_ANALYSIS ?AUTO_1403 ?AUTO_1400 ) ( VISIBLE ?AUTO_1401 ?AUTO_1402 ) ( AVAILABLE ?AUTO_1403 ) ( CHANNEL_FREE ?AUTO_1404 ) ( not ( = ?AUTO_1400 ?AUTO_1401 ) ) ( not ( = ?AUTO_1400 ?AUTO_1402 ) ) ( not ( = ?AUTO_1401 ?AUTO_1402 ) ) ( CAN_TRAVERSE ?AUTO_1403 ?AUTO_1400 ?AUTO_1401 ) ( AT ?AUTO_1403 ?AUTO_1400 ) ( VISIBLE ?AUTO_1400 ?AUTO_1401 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1403 ?AUTO_1400 ?AUTO_1401 )
      ( GET_SOIL_DATA ?AUTO_1400 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1400 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1406 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1409 - LANDER
      ?AUTO_1410 - WAYPOINT
      ?AUTO_1407 - WAYPOINT
      ?AUTO_1408 - ROVER
      ?AUTO_1411 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1409 ?AUTO_1410 ) ( VISIBLE ?AUTO_1407 ?AUTO_1410 ) ( AVAILABLE ?AUTO_1408 ) ( CHANNEL_FREE ?AUTO_1409 ) ( not ( = ?AUTO_1406 ?AUTO_1407 ) ) ( not ( = ?AUTO_1406 ?AUTO_1410 ) ) ( not ( = ?AUTO_1407 ?AUTO_1410 ) ) ( CAN_TRAVERSE ?AUTO_1408 ?AUTO_1406 ?AUTO_1407 ) ( AT ?AUTO_1408 ?AUTO_1406 ) ( VISIBLE ?AUTO_1406 ?AUTO_1407 ) ( AT_SOIL_SAMPLE ?AUTO_1406 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1408 ) ( STORE_OF ?AUTO_1411 ?AUTO_1408 ) ( EMPTY ?AUTO_1411 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_1408 ?AUTO_1411 ?AUTO_1406 )
      ( GET_SOIL_DATA ?AUTO_1406 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1406 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1412 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1413 - LANDER
      ?AUTO_1416 - WAYPOINT
      ?AUTO_1415 - WAYPOINT
      ?AUTO_1414 - ROVER
      ?AUTO_1417 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1413 ?AUTO_1416 ) ( VISIBLE ?AUTO_1415 ?AUTO_1416 ) ( AVAILABLE ?AUTO_1414 ) ( CHANNEL_FREE ?AUTO_1413 ) ( not ( = ?AUTO_1412 ?AUTO_1415 ) ) ( not ( = ?AUTO_1412 ?AUTO_1416 ) ) ( not ( = ?AUTO_1415 ?AUTO_1416 ) ) ( CAN_TRAVERSE ?AUTO_1414 ?AUTO_1412 ?AUTO_1415 ) ( VISIBLE ?AUTO_1412 ?AUTO_1415 ) ( AT_SOIL_SAMPLE ?AUTO_1412 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1414 ) ( STORE_OF ?AUTO_1417 ?AUTO_1414 ) ( EMPTY ?AUTO_1417 ) ( CAN_TRAVERSE ?AUTO_1414 ?AUTO_1415 ?AUTO_1412 ) ( AT ?AUTO_1414 ?AUTO_1415 ) ( VISIBLE ?AUTO_1415 ?AUTO_1412 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1414 ?AUTO_1415 ?AUTO_1412 )
      ( GET_SOIL_DATA ?AUTO_1412 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1412 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1418 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1419 - LANDER
      ?AUTO_1421 - WAYPOINT
      ?AUTO_1423 - WAYPOINT
      ?AUTO_1422 - ROVER
      ?AUTO_1420 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1419 ?AUTO_1421 ) ( VISIBLE ?AUTO_1423 ?AUTO_1421 ) ( AVAILABLE ?AUTO_1422 ) ( CHANNEL_FREE ?AUTO_1419 ) ( not ( = ?AUTO_1418 ?AUTO_1423 ) ) ( not ( = ?AUTO_1418 ?AUTO_1421 ) ) ( not ( = ?AUTO_1423 ?AUTO_1421 ) ) ( CAN_TRAVERSE ?AUTO_1422 ?AUTO_1418 ?AUTO_1423 ) ( VISIBLE ?AUTO_1418 ?AUTO_1423 ) ( AT_SOIL_SAMPLE ?AUTO_1418 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1422 ) ( STORE_OF ?AUTO_1420 ?AUTO_1422 ) ( CAN_TRAVERSE ?AUTO_1422 ?AUTO_1423 ?AUTO_1418 ) ( AT ?AUTO_1422 ?AUTO_1423 ) ( VISIBLE ?AUTO_1423 ?AUTO_1418 ) ( FULL ?AUTO_1420 ) )
    :subtasks
    ( ( !DROP ?AUTO_1422 ?AUTO_1420 )
      ( GET_SOIL_DATA ?AUTO_1418 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1418 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1429 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1433 - LANDER
      ?AUTO_1432 - WAYPOINT
      ?AUTO_1430 - WAYPOINT
      ?AUTO_1431 - ROVER
      ?AUTO_1434 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1433 ?AUTO_1432 ) ( VISIBLE ?AUTO_1430 ?AUTO_1432 ) ( AVAILABLE ?AUTO_1431 ) ( CHANNEL_FREE ?AUTO_1433 ) ( not ( = ?AUTO_1429 ?AUTO_1430 ) ) ( not ( = ?AUTO_1429 ?AUTO_1432 ) ) ( not ( = ?AUTO_1430 ?AUTO_1432 ) ) ( CAN_TRAVERSE ?AUTO_1431 ?AUTO_1429 ?AUTO_1430 ) ( VISIBLE ?AUTO_1429 ?AUTO_1430 ) ( AT_SOIL_SAMPLE ?AUTO_1429 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1431 ) ( STORE_OF ?AUTO_1434 ?AUTO_1431 ) ( EMPTY ?AUTO_1434 ) ( CAN_TRAVERSE ?AUTO_1431 ?AUTO_1430 ?AUTO_1429 ) ( VISIBLE ?AUTO_1430 ?AUTO_1429 ) ( CAN_TRAVERSE ?AUTO_1431 ?AUTO_1432 ?AUTO_1430 ) ( AT ?AUTO_1431 ?AUTO_1432 ) ( VISIBLE ?AUTO_1432 ?AUTO_1430 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1431 ?AUTO_1432 ?AUTO_1430 )
      ( GET_SOIL_DATA ?AUTO_1429 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1429 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1457 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1460 - LANDER
      ?AUTO_1461 - WAYPOINT
      ?AUTO_1462 - ROVER
      ?AUTO_1458 - STORE
      ?AUTO_1459 - WAYPOINT
      ?AUTO_1463 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1460 ?AUTO_1461 ) ( VISIBLE ?AUTO_1457 ?AUTO_1461 ) ( AVAILABLE ?AUTO_1462 ) ( CHANNEL_FREE ?AUTO_1460 ) ( not ( = ?AUTO_1457 ?AUTO_1461 ) ) ( AT_SOIL_SAMPLE ?AUTO_1457 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1462 ) ( STORE_OF ?AUTO_1458 ?AUTO_1462 ) ( EMPTY ?AUTO_1458 ) ( CAN_TRAVERSE ?AUTO_1462 ?AUTO_1461 ?AUTO_1457 ) ( VISIBLE ?AUTO_1461 ?AUTO_1457 ) ( CAN_TRAVERSE ?AUTO_1462 ?AUTO_1459 ?AUTO_1461 ) ( VISIBLE ?AUTO_1459 ?AUTO_1461 ) ( not ( = ?AUTO_1457 ?AUTO_1459 ) ) ( not ( = ?AUTO_1461 ?AUTO_1459 ) ) ( CAN_TRAVERSE ?AUTO_1462 ?AUTO_1463 ?AUTO_1459 ) ( AT ?AUTO_1462 ?AUTO_1463 ) ( VISIBLE ?AUTO_1463 ?AUTO_1459 ) ( not ( = ?AUTO_1457 ?AUTO_1463 ) ) ( not ( = ?AUTO_1461 ?AUTO_1463 ) ) ( not ( = ?AUTO_1459 ?AUTO_1463 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1462 ?AUTO_1463 ?AUTO_1459 )
      ( GET_SOIL_DATA ?AUTO_1457 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1457 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1464 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1469 - LANDER
      ?AUTO_1467 - WAYPOINT
      ?AUTO_1465 - ROVER
      ?AUTO_1466 - STORE
      ?AUTO_1468 - WAYPOINT
      ?AUTO_1470 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1469 ?AUTO_1467 ) ( VISIBLE ?AUTO_1464 ?AUTO_1467 ) ( AVAILABLE ?AUTO_1465 ) ( CHANNEL_FREE ?AUTO_1469 ) ( not ( = ?AUTO_1464 ?AUTO_1467 ) ) ( AT_SOIL_SAMPLE ?AUTO_1464 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1465 ) ( STORE_OF ?AUTO_1466 ?AUTO_1465 ) ( CAN_TRAVERSE ?AUTO_1465 ?AUTO_1467 ?AUTO_1464 ) ( VISIBLE ?AUTO_1467 ?AUTO_1464 ) ( CAN_TRAVERSE ?AUTO_1465 ?AUTO_1468 ?AUTO_1467 ) ( VISIBLE ?AUTO_1468 ?AUTO_1467 ) ( not ( = ?AUTO_1464 ?AUTO_1468 ) ) ( not ( = ?AUTO_1467 ?AUTO_1468 ) ) ( CAN_TRAVERSE ?AUTO_1465 ?AUTO_1470 ?AUTO_1468 ) ( AT ?AUTO_1465 ?AUTO_1470 ) ( VISIBLE ?AUTO_1470 ?AUTO_1468 ) ( not ( = ?AUTO_1464 ?AUTO_1470 ) ) ( not ( = ?AUTO_1467 ?AUTO_1470 ) ) ( not ( = ?AUTO_1468 ?AUTO_1470 ) ) ( FULL ?AUTO_1466 ) )
    :subtasks
    ( ( !DROP ?AUTO_1465 ?AUTO_1466 )
      ( GET_SOIL_DATA ?AUTO_1464 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1464 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1521 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1524 - LANDER
      ?AUTO_1526 - WAYPOINT
      ?AUTO_1522 - ROVER
      ?AUTO_1523 - STORE
      ?AUTO_1525 - WAYPOINT
      ?AUTO_1527 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1524 ?AUTO_1526 ) ( VISIBLE ?AUTO_1521 ?AUTO_1526 ) ( AVAILABLE ?AUTO_1522 ) ( CHANNEL_FREE ?AUTO_1524 ) ( not ( = ?AUTO_1521 ?AUTO_1526 ) ) ( AT_ROCK_SAMPLE ?AUTO_1521 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1522 ) ( STORE_OF ?AUTO_1523 ?AUTO_1522 ) ( EMPTY ?AUTO_1523 ) ( CAN_TRAVERSE ?AUTO_1522 ?AUTO_1526 ?AUTO_1521 ) ( VISIBLE ?AUTO_1526 ?AUTO_1521 ) ( CAN_TRAVERSE ?AUTO_1522 ?AUTO_1525 ?AUTO_1526 ) ( VISIBLE ?AUTO_1525 ?AUTO_1526 ) ( not ( = ?AUTO_1521 ?AUTO_1525 ) ) ( not ( = ?AUTO_1526 ?AUTO_1525 ) ) ( CAN_TRAVERSE ?AUTO_1522 ?AUTO_1527 ?AUTO_1525 ) ( AT ?AUTO_1522 ?AUTO_1527 ) ( VISIBLE ?AUTO_1527 ?AUTO_1525 ) ( not ( = ?AUTO_1521 ?AUTO_1527 ) ) ( not ( = ?AUTO_1526 ?AUTO_1527 ) ) ( not ( = ?AUTO_1525 ?AUTO_1527 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1522 ?AUTO_1527 ?AUTO_1525 )
      ( GET_ROCK_DATA ?AUTO_1521 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1521 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1528 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1529 - LANDER
      ?AUTO_1531 - WAYPOINT
      ?AUTO_1534 - ROVER
      ?AUTO_1533 - STORE
      ?AUTO_1530 - WAYPOINT
      ?AUTO_1532 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1529 ?AUTO_1531 ) ( VISIBLE ?AUTO_1528 ?AUTO_1531 ) ( AVAILABLE ?AUTO_1534 ) ( CHANNEL_FREE ?AUTO_1529 ) ( not ( = ?AUTO_1528 ?AUTO_1531 ) ) ( AT_ROCK_SAMPLE ?AUTO_1528 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1534 ) ( STORE_OF ?AUTO_1533 ?AUTO_1534 ) ( CAN_TRAVERSE ?AUTO_1534 ?AUTO_1531 ?AUTO_1528 ) ( VISIBLE ?AUTO_1531 ?AUTO_1528 ) ( CAN_TRAVERSE ?AUTO_1534 ?AUTO_1530 ?AUTO_1531 ) ( VISIBLE ?AUTO_1530 ?AUTO_1531 ) ( not ( = ?AUTO_1528 ?AUTO_1530 ) ) ( not ( = ?AUTO_1531 ?AUTO_1530 ) ) ( CAN_TRAVERSE ?AUTO_1534 ?AUTO_1532 ?AUTO_1530 ) ( AT ?AUTO_1534 ?AUTO_1532 ) ( VISIBLE ?AUTO_1532 ?AUTO_1530 ) ( not ( = ?AUTO_1528 ?AUTO_1532 ) ) ( not ( = ?AUTO_1531 ?AUTO_1532 ) ) ( not ( = ?AUTO_1530 ?AUTO_1532 ) ) ( FULL ?AUTO_1533 ) )
    :subtasks
    ( ( !DROP ?AUTO_1534 ?AUTO_1533 )
      ( GET_ROCK_DATA ?AUTO_1528 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1528 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1543 - OBJECTIVE
      ?AUTO_1544 - MODE
    )
    :vars
    (
      ?AUTO_1547 - LANDER
      ?AUTO_1546 - WAYPOINT
      ?AUTO_1545 - ROVER
      ?AUTO_1548 - WAYPOINT
      ?AUTO_1549 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1547 ?AUTO_1546 ) ( HAVE_IMAGE ?AUTO_1545 ?AUTO_1543 ?AUTO_1544 ) ( VISIBLE ?AUTO_1548 ?AUTO_1546 ) ( AVAILABLE ?AUTO_1545 ) ( CHANNEL_FREE ?AUTO_1547 ) ( not ( = ?AUTO_1548 ?AUTO_1546 ) ) ( CAN_TRAVERSE ?AUTO_1545 ?AUTO_1549 ?AUTO_1548 ) ( AT ?AUTO_1545 ?AUTO_1549 ) ( VISIBLE ?AUTO_1549 ?AUTO_1548 ) ( not ( = ?AUTO_1546 ?AUTO_1549 ) ) ( not ( = ?AUTO_1548 ?AUTO_1549 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1545 ?AUTO_1549 ?AUTO_1548 )
      ( GET_IMAGE_DATA ?AUTO_1543 ?AUTO_1544 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1543 ?AUTO_1544 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1550 - OBJECTIVE
      ?AUTO_1551 - MODE
    )
    :vars
    (
      ?AUTO_1555 - LANDER
      ?AUTO_1552 - WAYPOINT
      ?AUTO_1554 - WAYPOINT
      ?AUTO_1553 - ROVER
      ?AUTO_1556 - WAYPOINT
      ?AUTO_1557 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1555 ?AUTO_1552 ) ( VISIBLE ?AUTO_1554 ?AUTO_1552 ) ( AVAILABLE ?AUTO_1553 ) ( CHANNEL_FREE ?AUTO_1555 ) ( not ( = ?AUTO_1554 ?AUTO_1552 ) ) ( CAN_TRAVERSE ?AUTO_1553 ?AUTO_1556 ?AUTO_1554 ) ( AT ?AUTO_1553 ?AUTO_1556 ) ( VISIBLE ?AUTO_1556 ?AUTO_1554 ) ( not ( = ?AUTO_1552 ?AUTO_1556 ) ) ( not ( = ?AUTO_1554 ?AUTO_1556 ) ) ( CALIBRATED ?AUTO_1557 ?AUTO_1553 ) ( ON_BOARD ?AUTO_1557 ?AUTO_1553 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1553 ) ( SUPPORTS ?AUTO_1557 ?AUTO_1551 ) ( VISIBLE_FROM ?AUTO_1550 ?AUTO_1556 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_1553 ?AUTO_1556 ?AUTO_1550 ?AUTO_1557 ?AUTO_1551 )
      ( GET_IMAGE_DATA ?AUTO_1550 ?AUTO_1551 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1550 ?AUTO_1551 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1558 - OBJECTIVE
      ?AUTO_1559 - MODE
    )
    :vars
    (
      ?AUTO_1562 - LANDER
      ?AUTO_1560 - WAYPOINT
      ?AUTO_1564 - WAYPOINT
      ?AUTO_1561 - ROVER
      ?AUTO_1563 - WAYPOINT
      ?AUTO_1565 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1562 ?AUTO_1560 ) ( VISIBLE ?AUTO_1564 ?AUTO_1560 ) ( AVAILABLE ?AUTO_1561 ) ( CHANNEL_FREE ?AUTO_1562 ) ( not ( = ?AUTO_1564 ?AUTO_1560 ) ) ( CAN_TRAVERSE ?AUTO_1561 ?AUTO_1563 ?AUTO_1564 ) ( AT ?AUTO_1561 ?AUTO_1563 ) ( VISIBLE ?AUTO_1563 ?AUTO_1564 ) ( not ( = ?AUTO_1560 ?AUTO_1563 ) ) ( not ( = ?AUTO_1564 ?AUTO_1563 ) ) ( ON_BOARD ?AUTO_1565 ?AUTO_1561 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1561 ) ( SUPPORTS ?AUTO_1565 ?AUTO_1559 ) ( VISIBLE_FROM ?AUTO_1558 ?AUTO_1563 ) ( CALIBRATION_TARGET ?AUTO_1565 ?AUTO_1558 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1561 ?AUTO_1565 ?AUTO_1558 ?AUTO_1563 )
      ( GET_IMAGE_DATA ?AUTO_1558 ?AUTO_1559 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1558 ?AUTO_1559 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1566 - OBJECTIVE
      ?AUTO_1567 - MODE
    )
    :vars
    (
      ?AUTO_1569 - LANDER
      ?AUTO_1572 - WAYPOINT
      ?AUTO_1571 - WAYPOINT
      ?AUTO_1568 - ROVER
      ?AUTO_1570 - WAYPOINT
      ?AUTO_1573 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1569 ?AUTO_1572 ) ( VISIBLE ?AUTO_1571 ?AUTO_1572 ) ( AVAILABLE ?AUTO_1568 ) ( CHANNEL_FREE ?AUTO_1569 ) ( not ( = ?AUTO_1571 ?AUTO_1572 ) ) ( CAN_TRAVERSE ?AUTO_1568 ?AUTO_1570 ?AUTO_1571 ) ( VISIBLE ?AUTO_1570 ?AUTO_1571 ) ( not ( = ?AUTO_1572 ?AUTO_1570 ) ) ( not ( = ?AUTO_1571 ?AUTO_1570 ) ) ( ON_BOARD ?AUTO_1573 ?AUTO_1568 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1568 ) ( SUPPORTS ?AUTO_1573 ?AUTO_1567 ) ( VISIBLE_FROM ?AUTO_1566 ?AUTO_1570 ) ( CALIBRATION_TARGET ?AUTO_1573 ?AUTO_1566 ) ( CAN_TRAVERSE ?AUTO_1568 ?AUTO_1571 ?AUTO_1570 ) ( AT ?AUTO_1568 ?AUTO_1571 ) ( VISIBLE ?AUTO_1571 ?AUTO_1570 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1568 ?AUTO_1571 ?AUTO_1570 )
      ( GET_IMAGE_DATA ?AUTO_1566 ?AUTO_1567 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1566 ?AUTO_1567 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1667 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1671 - LANDER
      ?AUTO_1669 - WAYPOINT
      ?AUTO_1668 - WAYPOINT
      ?AUTO_1670 - ROVER
      ?AUTO_1672 - STORE
      ?AUTO_1673 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1671 ?AUTO_1669 ) ( VISIBLE ?AUTO_1668 ?AUTO_1669 ) ( AVAILABLE ?AUTO_1670 ) ( CHANNEL_FREE ?AUTO_1671 ) ( not ( = ?AUTO_1667 ?AUTO_1668 ) ) ( not ( = ?AUTO_1667 ?AUTO_1669 ) ) ( not ( = ?AUTO_1668 ?AUTO_1669 ) ) ( CAN_TRAVERSE ?AUTO_1670 ?AUTO_1667 ?AUTO_1668 ) ( VISIBLE ?AUTO_1667 ?AUTO_1668 ) ( AT_SOIL_SAMPLE ?AUTO_1667 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1670 ) ( STORE_OF ?AUTO_1672 ?AUTO_1670 ) ( EMPTY ?AUTO_1672 ) ( CAN_TRAVERSE ?AUTO_1670 ?AUTO_1673 ?AUTO_1667 ) ( AT ?AUTO_1670 ?AUTO_1673 ) ( VISIBLE ?AUTO_1673 ?AUTO_1667 ) ( not ( = ?AUTO_1667 ?AUTO_1673 ) ) ( not ( = ?AUTO_1669 ?AUTO_1673 ) ) ( not ( = ?AUTO_1668 ?AUTO_1673 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1670 ?AUTO_1673 ?AUTO_1667 )
      ( GET_SOIL_DATA ?AUTO_1667 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1667 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1681 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1686 - LANDER
      ?AUTO_1684 - WAYPOINT
      ?AUTO_1683 - WAYPOINT
      ?AUTO_1682 - ROVER
      ?AUTO_1687 - STORE
      ?AUTO_1685 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1686 ?AUTO_1684 ) ( VISIBLE ?AUTO_1683 ?AUTO_1684 ) ( AVAILABLE ?AUTO_1682 ) ( CHANNEL_FREE ?AUTO_1686 ) ( not ( = ?AUTO_1681 ?AUTO_1683 ) ) ( not ( = ?AUTO_1681 ?AUTO_1684 ) ) ( not ( = ?AUTO_1683 ?AUTO_1684 ) ) ( CAN_TRAVERSE ?AUTO_1682 ?AUTO_1681 ?AUTO_1683 ) ( VISIBLE ?AUTO_1681 ?AUTO_1683 ) ( AT_SOIL_SAMPLE ?AUTO_1681 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1682 ) ( STORE_OF ?AUTO_1687 ?AUTO_1682 ) ( CAN_TRAVERSE ?AUTO_1682 ?AUTO_1685 ?AUTO_1681 ) ( AT ?AUTO_1682 ?AUTO_1685 ) ( VISIBLE ?AUTO_1685 ?AUTO_1681 ) ( not ( = ?AUTO_1681 ?AUTO_1685 ) ) ( not ( = ?AUTO_1684 ?AUTO_1685 ) ) ( not ( = ?AUTO_1683 ?AUTO_1685 ) ) ( FULL ?AUTO_1687 ) )
    :subtasks
    ( ( !DROP ?AUTO_1682 ?AUTO_1687 )
      ( GET_SOIL_DATA ?AUTO_1681 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1681 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1691 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1697 - LANDER
      ?AUTO_1695 - WAYPOINT
      ?AUTO_1693 - WAYPOINT
      ?AUTO_1694 - ROVER
      ?AUTO_1692 - STORE
      ?AUTO_1696 - WAYPOINT
      ?AUTO_1698 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1697 ?AUTO_1695 ) ( VISIBLE ?AUTO_1693 ?AUTO_1695 ) ( AVAILABLE ?AUTO_1694 ) ( CHANNEL_FREE ?AUTO_1697 ) ( not ( = ?AUTO_1691 ?AUTO_1693 ) ) ( not ( = ?AUTO_1691 ?AUTO_1695 ) ) ( not ( = ?AUTO_1693 ?AUTO_1695 ) ) ( CAN_TRAVERSE ?AUTO_1694 ?AUTO_1691 ?AUTO_1693 ) ( VISIBLE ?AUTO_1691 ?AUTO_1693 ) ( AT_SOIL_SAMPLE ?AUTO_1691 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1694 ) ( STORE_OF ?AUTO_1692 ?AUTO_1694 ) ( EMPTY ?AUTO_1692 ) ( CAN_TRAVERSE ?AUTO_1694 ?AUTO_1696 ?AUTO_1691 ) ( VISIBLE ?AUTO_1696 ?AUTO_1691 ) ( not ( = ?AUTO_1691 ?AUTO_1696 ) ) ( not ( = ?AUTO_1695 ?AUTO_1696 ) ) ( not ( = ?AUTO_1693 ?AUTO_1696 ) ) ( CAN_TRAVERSE ?AUTO_1694 ?AUTO_1698 ?AUTO_1696 ) ( AT ?AUTO_1694 ?AUTO_1698 ) ( VISIBLE ?AUTO_1698 ?AUTO_1696 ) ( not ( = ?AUTO_1691 ?AUTO_1698 ) ) ( not ( = ?AUTO_1695 ?AUTO_1698 ) ) ( not ( = ?AUTO_1693 ?AUTO_1698 ) ) ( not ( = ?AUTO_1696 ?AUTO_1698 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1694 ?AUTO_1698 ?AUTO_1696 )
      ( GET_SOIL_DATA ?AUTO_1691 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1691 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1703 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1704 - ROVER
      ?AUTO_1707 - WAYPOINT
      ?AUTO_1706 - LANDER
      ?AUTO_1705 - WAYPOINT
    )
    :precondition
    ( and ( AT ?AUTO_1704 ?AUTO_1707 ) ( AT_LANDER ?AUTO_1706 ?AUTO_1705 ) ( HAVE_ROCK_ANALYSIS ?AUTO_1704 ?AUTO_1703 ) ( VISIBLE ?AUTO_1707 ?AUTO_1705 ) ( AVAILABLE ?AUTO_1704 ) ( CHANNEL_FREE ?AUTO_1706 ) ( not ( = ?AUTO_1703 ?AUTO_1707 ) ) ( not ( = ?AUTO_1703 ?AUTO_1705 ) ) ( not ( = ?AUTO_1707 ?AUTO_1705 ) ) )
    :subtasks
    ( ( !COMMUNICATE_ROCK_DATA ?AUTO_1704 ?AUTO_1706 ?AUTO_1703 ?AUTO_1707 ?AUTO_1705 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1703 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1708 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1711 - LANDER
      ?AUTO_1710 - WAYPOINT
      ?AUTO_1709 - ROVER
      ?AUTO_1712 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1711 ?AUTO_1710 ) ( HAVE_ROCK_ANALYSIS ?AUTO_1709 ?AUTO_1708 ) ( VISIBLE ?AUTO_1712 ?AUTO_1710 ) ( AVAILABLE ?AUTO_1709 ) ( CHANNEL_FREE ?AUTO_1711 ) ( not ( = ?AUTO_1708 ?AUTO_1712 ) ) ( not ( = ?AUTO_1708 ?AUTO_1710 ) ) ( not ( = ?AUTO_1712 ?AUTO_1710 ) ) ( CAN_TRAVERSE ?AUTO_1709 ?AUTO_1708 ?AUTO_1712 ) ( AT ?AUTO_1709 ?AUTO_1708 ) ( VISIBLE ?AUTO_1708 ?AUTO_1712 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1709 ?AUTO_1708 ?AUTO_1712 )
      ( GET_ROCK_DATA ?AUTO_1708 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1708 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1714 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1717 - LANDER
      ?AUTO_1715 - WAYPOINT
      ?AUTO_1716 - WAYPOINT
      ?AUTO_1718 - ROVER
      ?AUTO_1719 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1717 ?AUTO_1715 ) ( VISIBLE ?AUTO_1716 ?AUTO_1715 ) ( AVAILABLE ?AUTO_1718 ) ( CHANNEL_FREE ?AUTO_1717 ) ( not ( = ?AUTO_1714 ?AUTO_1716 ) ) ( not ( = ?AUTO_1714 ?AUTO_1715 ) ) ( not ( = ?AUTO_1716 ?AUTO_1715 ) ) ( CAN_TRAVERSE ?AUTO_1718 ?AUTO_1714 ?AUTO_1716 ) ( AT ?AUTO_1718 ?AUTO_1714 ) ( VISIBLE ?AUTO_1714 ?AUTO_1716 ) ( AT_ROCK_SAMPLE ?AUTO_1714 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1718 ) ( STORE_OF ?AUTO_1719 ?AUTO_1718 ) ( EMPTY ?AUTO_1719 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_1718 ?AUTO_1719 ?AUTO_1714 )
      ( GET_ROCK_DATA ?AUTO_1714 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1714 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1722 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1727 - LANDER
      ?AUTO_1724 - WAYPOINT
      ?AUTO_1725 - WAYPOINT
      ?AUTO_1723 - ROVER
      ?AUTO_1726 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1727 ?AUTO_1724 ) ( VISIBLE ?AUTO_1725 ?AUTO_1724 ) ( AVAILABLE ?AUTO_1723 ) ( CHANNEL_FREE ?AUTO_1727 ) ( not ( = ?AUTO_1722 ?AUTO_1725 ) ) ( not ( = ?AUTO_1722 ?AUTO_1724 ) ) ( not ( = ?AUTO_1725 ?AUTO_1724 ) ) ( CAN_TRAVERSE ?AUTO_1723 ?AUTO_1722 ?AUTO_1725 ) ( VISIBLE ?AUTO_1722 ?AUTO_1725 ) ( AT_ROCK_SAMPLE ?AUTO_1722 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1723 ) ( STORE_OF ?AUTO_1726 ?AUTO_1723 ) ( EMPTY ?AUTO_1726 ) ( CAN_TRAVERSE ?AUTO_1723 ?AUTO_1725 ?AUTO_1722 ) ( AT ?AUTO_1723 ?AUTO_1725 ) ( VISIBLE ?AUTO_1725 ?AUTO_1722 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1723 ?AUTO_1725 ?AUTO_1722 )
      ( GET_ROCK_DATA ?AUTO_1722 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1722 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1732 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1735 - LANDER
      ?AUTO_1733 - WAYPOINT
      ?AUTO_1737 - WAYPOINT
      ?AUTO_1736 - ROVER
      ?AUTO_1734 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1735 ?AUTO_1733 ) ( VISIBLE ?AUTO_1737 ?AUTO_1733 ) ( AVAILABLE ?AUTO_1736 ) ( CHANNEL_FREE ?AUTO_1735 ) ( not ( = ?AUTO_1732 ?AUTO_1737 ) ) ( not ( = ?AUTO_1732 ?AUTO_1733 ) ) ( not ( = ?AUTO_1737 ?AUTO_1733 ) ) ( CAN_TRAVERSE ?AUTO_1736 ?AUTO_1732 ?AUTO_1737 ) ( VISIBLE ?AUTO_1732 ?AUTO_1737 ) ( AT_ROCK_SAMPLE ?AUTO_1732 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1736 ) ( STORE_OF ?AUTO_1734 ?AUTO_1736 ) ( EMPTY ?AUTO_1734 ) ( CAN_TRAVERSE ?AUTO_1736 ?AUTO_1737 ?AUTO_1732 ) ( VISIBLE ?AUTO_1737 ?AUTO_1732 ) ( CAN_TRAVERSE ?AUTO_1736 ?AUTO_1733 ?AUTO_1737 ) ( AT ?AUTO_1736 ?AUTO_1733 ) ( VISIBLE ?AUTO_1733 ?AUTO_1737 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1736 ?AUTO_1733 ?AUTO_1737 )
      ( GET_ROCK_DATA ?AUTO_1732 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1732 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1738 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1742 - LANDER
      ?AUTO_1739 - WAYPOINT
      ?AUTO_1741 - WAYPOINT
      ?AUTO_1743 - ROVER
      ?AUTO_1740 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1742 ?AUTO_1739 ) ( VISIBLE ?AUTO_1741 ?AUTO_1739 ) ( AVAILABLE ?AUTO_1743 ) ( CHANNEL_FREE ?AUTO_1742 ) ( not ( = ?AUTO_1738 ?AUTO_1741 ) ) ( not ( = ?AUTO_1738 ?AUTO_1739 ) ) ( not ( = ?AUTO_1741 ?AUTO_1739 ) ) ( CAN_TRAVERSE ?AUTO_1743 ?AUTO_1738 ?AUTO_1741 ) ( VISIBLE ?AUTO_1738 ?AUTO_1741 ) ( AT_ROCK_SAMPLE ?AUTO_1738 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1743 ) ( STORE_OF ?AUTO_1740 ?AUTO_1743 ) ( CAN_TRAVERSE ?AUTO_1743 ?AUTO_1741 ?AUTO_1738 ) ( VISIBLE ?AUTO_1741 ?AUTO_1738 ) ( CAN_TRAVERSE ?AUTO_1743 ?AUTO_1739 ?AUTO_1741 ) ( AT ?AUTO_1743 ?AUTO_1739 ) ( VISIBLE ?AUTO_1739 ?AUTO_1741 ) ( FULL ?AUTO_1740 ) )
    :subtasks
    ( ( !DROP ?AUTO_1743 ?AUTO_1740 )
      ( GET_ROCK_DATA ?AUTO_1738 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1738 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1781 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1784 - LANDER
      ?AUTO_1786 - WAYPOINT
      ?AUTO_1783 - WAYPOINT
      ?AUTO_1785 - ROVER
      ?AUTO_1782 - STORE
      ?AUTO_1787 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1784 ?AUTO_1786 ) ( VISIBLE ?AUTO_1783 ?AUTO_1786 ) ( AVAILABLE ?AUTO_1785 ) ( CHANNEL_FREE ?AUTO_1784 ) ( not ( = ?AUTO_1781 ?AUTO_1783 ) ) ( not ( = ?AUTO_1781 ?AUTO_1786 ) ) ( not ( = ?AUTO_1783 ?AUTO_1786 ) ) ( CAN_TRAVERSE ?AUTO_1785 ?AUTO_1781 ?AUTO_1783 ) ( VISIBLE ?AUTO_1781 ?AUTO_1783 ) ( AT_SOIL_SAMPLE ?AUTO_1781 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1785 ) ( STORE_OF ?AUTO_1782 ?AUTO_1785 ) ( EMPTY ?AUTO_1782 ) ( CAN_TRAVERSE ?AUTO_1785 ?AUTO_1783 ?AUTO_1781 ) ( VISIBLE ?AUTO_1783 ?AUTO_1781 ) ( CAN_TRAVERSE ?AUTO_1785 ?AUTO_1787 ?AUTO_1783 ) ( AT ?AUTO_1785 ?AUTO_1787 ) ( VISIBLE ?AUTO_1787 ?AUTO_1783 ) ( not ( = ?AUTO_1781 ?AUTO_1787 ) ) ( not ( = ?AUTO_1786 ?AUTO_1787 ) ) ( not ( = ?AUTO_1783 ?AUTO_1787 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1785 ?AUTO_1787 ?AUTO_1783 )
      ( GET_SOIL_DATA ?AUTO_1781 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1781 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_1788 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1793 - LANDER
      ?AUTO_1790 - WAYPOINT
      ?AUTO_1792 - WAYPOINT
      ?AUTO_1794 - ROVER
      ?AUTO_1791 - STORE
      ?AUTO_1789 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1793 ?AUTO_1790 ) ( VISIBLE ?AUTO_1792 ?AUTO_1790 ) ( AVAILABLE ?AUTO_1794 ) ( CHANNEL_FREE ?AUTO_1793 ) ( not ( = ?AUTO_1788 ?AUTO_1792 ) ) ( not ( = ?AUTO_1788 ?AUTO_1790 ) ) ( not ( = ?AUTO_1792 ?AUTO_1790 ) ) ( CAN_TRAVERSE ?AUTO_1794 ?AUTO_1788 ?AUTO_1792 ) ( VISIBLE ?AUTO_1788 ?AUTO_1792 ) ( AT_SOIL_SAMPLE ?AUTO_1788 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_1794 ) ( STORE_OF ?AUTO_1791 ?AUTO_1794 ) ( CAN_TRAVERSE ?AUTO_1794 ?AUTO_1792 ?AUTO_1788 ) ( VISIBLE ?AUTO_1792 ?AUTO_1788 ) ( CAN_TRAVERSE ?AUTO_1794 ?AUTO_1789 ?AUTO_1792 ) ( AT ?AUTO_1794 ?AUTO_1789 ) ( VISIBLE ?AUTO_1789 ?AUTO_1792 ) ( not ( = ?AUTO_1788 ?AUTO_1789 ) ) ( not ( = ?AUTO_1790 ?AUTO_1789 ) ) ( not ( = ?AUTO_1792 ?AUTO_1789 ) ) ( FULL ?AUTO_1791 ) )
    :subtasks
    ( ( !DROP ?AUTO_1794 ?AUTO_1791 )
      ( GET_SOIL_DATA ?AUTO_1788 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_1788 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1839 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1844 - LANDER
      ?AUTO_1843 - WAYPOINT
      ?AUTO_1840 - WAYPOINT
      ?AUTO_1842 - ROVER
      ?AUTO_1841 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1844 ?AUTO_1843 ) ( VISIBLE ?AUTO_1840 ?AUTO_1843 ) ( AVAILABLE ?AUTO_1842 ) ( CHANNEL_FREE ?AUTO_1844 ) ( not ( = ?AUTO_1839 ?AUTO_1840 ) ) ( not ( = ?AUTO_1839 ?AUTO_1843 ) ) ( not ( = ?AUTO_1840 ?AUTO_1843 ) ) ( CAN_TRAVERSE ?AUTO_1842 ?AUTO_1839 ?AUTO_1840 ) ( AT ?AUTO_1842 ?AUTO_1839 ) ( VISIBLE ?AUTO_1839 ?AUTO_1840 ) ( AT_ROCK_SAMPLE ?AUTO_1839 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1842 ) ( STORE_OF ?AUTO_1841 ?AUTO_1842 ) ( FULL ?AUTO_1841 ) )
    :subtasks
    ( ( !DROP ?AUTO_1842 ?AUTO_1841 )
      ( GET_ROCK_DATA ?AUTO_1839 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1839 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1853 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1857 - LANDER
      ?AUTO_1858 - WAYPOINT
      ?AUTO_1854 - WAYPOINT
      ?AUTO_1856 - ROVER
      ?AUTO_1855 - STORE
      ?AUTO_1859 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1857 ?AUTO_1858 ) ( VISIBLE ?AUTO_1854 ?AUTO_1858 ) ( AVAILABLE ?AUTO_1856 ) ( CHANNEL_FREE ?AUTO_1857 ) ( not ( = ?AUTO_1853 ?AUTO_1854 ) ) ( not ( = ?AUTO_1853 ?AUTO_1858 ) ) ( not ( = ?AUTO_1854 ?AUTO_1858 ) ) ( CAN_TRAVERSE ?AUTO_1856 ?AUTO_1853 ?AUTO_1854 ) ( VISIBLE ?AUTO_1853 ?AUTO_1854 ) ( AT_ROCK_SAMPLE ?AUTO_1853 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1856 ) ( STORE_OF ?AUTO_1855 ?AUTO_1856 ) ( EMPTY ?AUTO_1855 ) ( CAN_TRAVERSE ?AUTO_1856 ?AUTO_1854 ?AUTO_1853 ) ( VISIBLE ?AUTO_1854 ?AUTO_1853 ) ( CAN_TRAVERSE ?AUTO_1856 ?AUTO_1859 ?AUTO_1854 ) ( AT ?AUTO_1856 ?AUTO_1859 ) ( VISIBLE ?AUTO_1859 ?AUTO_1854 ) ( not ( = ?AUTO_1853 ?AUTO_1859 ) ) ( not ( = ?AUTO_1858 ?AUTO_1859 ) ) ( not ( = ?AUTO_1854 ?AUTO_1859 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_1856 ?AUTO_1859 ?AUTO_1854 )
      ( GET_ROCK_DATA ?AUTO_1853 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1853 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1860 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1862 - LANDER
      ?AUTO_1864 - WAYPOINT
      ?AUTO_1866 - WAYPOINT
      ?AUTO_1863 - ROVER
      ?AUTO_1861 - STORE
      ?AUTO_1865 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1862 ?AUTO_1864 ) ( VISIBLE ?AUTO_1866 ?AUTO_1864 ) ( AVAILABLE ?AUTO_1863 ) ( CHANNEL_FREE ?AUTO_1862 ) ( not ( = ?AUTO_1860 ?AUTO_1866 ) ) ( not ( = ?AUTO_1860 ?AUTO_1864 ) ) ( not ( = ?AUTO_1866 ?AUTO_1864 ) ) ( CAN_TRAVERSE ?AUTO_1863 ?AUTO_1860 ?AUTO_1866 ) ( VISIBLE ?AUTO_1860 ?AUTO_1866 ) ( AT_ROCK_SAMPLE ?AUTO_1860 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1863 ) ( STORE_OF ?AUTO_1861 ?AUTO_1863 ) ( CAN_TRAVERSE ?AUTO_1863 ?AUTO_1866 ?AUTO_1860 ) ( VISIBLE ?AUTO_1866 ?AUTO_1860 ) ( CAN_TRAVERSE ?AUTO_1863 ?AUTO_1865 ?AUTO_1866 ) ( AT ?AUTO_1863 ?AUTO_1865 ) ( VISIBLE ?AUTO_1865 ?AUTO_1866 ) ( not ( = ?AUTO_1860 ?AUTO_1865 ) ) ( not ( = ?AUTO_1864 ?AUTO_1865 ) ) ( not ( = ?AUTO_1866 ?AUTO_1865 ) ) ( FULL ?AUTO_1861 ) )
    :subtasks
    ( ( !DROP ?AUTO_1863 ?AUTO_1861 )
      ( GET_ROCK_DATA ?AUTO_1860 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1860 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_1888 - OBJECTIVE
      ?AUTO_1889 - MODE
    )
    :vars
    (
      ?AUTO_1892 - LANDER
      ?AUTO_1890 - WAYPOINT
      ?AUTO_1893 - WAYPOINT
      ?AUTO_1894 - ROVER
      ?AUTO_1891 - CAMERA
      ?AUTO_1895 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1892 ?AUTO_1890 ) ( VISIBLE ?AUTO_1893 ?AUTO_1890 ) ( AVAILABLE ?AUTO_1894 ) ( CHANNEL_FREE ?AUTO_1892 ) ( not ( = ?AUTO_1893 ?AUTO_1890 ) ) ( CAN_TRAVERSE ?AUTO_1894 ?AUTO_1890 ?AUTO_1893 ) ( AT ?AUTO_1894 ?AUTO_1890 ) ( VISIBLE ?AUTO_1890 ?AUTO_1893 ) ( ON_BOARD ?AUTO_1891 ?AUTO_1894 ) ( EQUIPPED_FOR_IMAGING ?AUTO_1894 ) ( SUPPORTS ?AUTO_1891 ?AUTO_1889 ) ( VISIBLE_FROM ?AUTO_1888 ?AUTO_1890 ) ( CALIBRATION_TARGET ?AUTO_1891 ?AUTO_1895 ) ( VISIBLE_FROM ?AUTO_1895 ?AUTO_1890 ) ( not ( = ?AUTO_1888 ?AUTO_1895 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_1894 ?AUTO_1891 ?AUTO_1895 ?AUTO_1890 )
      ( GET_IMAGE_DATA ?AUTO_1888 ?AUTO_1889 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_1888 ?AUTO_1889 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1938 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1939 - LANDER
      ?AUTO_1941 - WAYPOINT
      ?AUTO_1943 - WAYPOINT
      ?AUTO_1940 - ROVER
      ?AUTO_1942 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1939 ?AUTO_1941 ) ( VISIBLE ?AUTO_1943 ?AUTO_1941 ) ( AVAILABLE ?AUTO_1940 ) ( CHANNEL_FREE ?AUTO_1939 ) ( not ( = ?AUTO_1938 ?AUTO_1943 ) ) ( not ( = ?AUTO_1938 ?AUTO_1941 ) ) ( not ( = ?AUTO_1943 ?AUTO_1941 ) ) ( CAN_TRAVERSE ?AUTO_1940 ?AUTO_1938 ?AUTO_1943 ) ( VISIBLE ?AUTO_1938 ?AUTO_1943 ) ( AT_ROCK_SAMPLE ?AUTO_1938 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1940 ) ( STORE_OF ?AUTO_1942 ?AUTO_1940 ) ( CAN_TRAVERSE ?AUTO_1940 ?AUTO_1943 ?AUTO_1938 ) ( AT ?AUTO_1940 ?AUTO_1943 ) ( VISIBLE ?AUTO_1943 ?AUTO_1938 ) ( FULL ?AUTO_1942 ) )
    :subtasks
    ( ( !DROP ?AUTO_1940 ?AUTO_1942 )
      ( GET_ROCK_DATA ?AUTO_1938 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1938 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_1993 - WAYPOINT
    )
    :vars
    (
      ?AUTO_1996 - LANDER
      ?AUTO_1994 - WAYPOINT
      ?AUTO_1997 - ROVER
      ?AUTO_1995 - STORE
      ?AUTO_1998 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_1996 ?AUTO_1994 ) ( VISIBLE ?AUTO_1993 ?AUTO_1994 ) ( AVAILABLE ?AUTO_1997 ) ( CHANNEL_FREE ?AUTO_1996 ) ( not ( = ?AUTO_1993 ?AUTO_1994 ) ) ( AT_ROCK_SAMPLE ?AUTO_1993 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_1997 ) ( STORE_OF ?AUTO_1995 ?AUTO_1997 ) ( CAN_TRAVERSE ?AUTO_1997 ?AUTO_1994 ?AUTO_1993 ) ( VISIBLE ?AUTO_1994 ?AUTO_1993 ) ( CAN_TRAVERSE ?AUTO_1997 ?AUTO_1998 ?AUTO_1994 ) ( AT ?AUTO_1997 ?AUTO_1998 ) ( VISIBLE ?AUTO_1998 ?AUTO_1994 ) ( not ( = ?AUTO_1993 ?AUTO_1998 ) ) ( not ( = ?AUTO_1994 ?AUTO_1998 ) ) ( FULL ?AUTO_1995 ) )
    :subtasks
    ( ( !DROP ?AUTO_1997 ?AUTO_1995 )
      ( GET_ROCK_DATA ?AUTO_1993 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_1993 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2036 - OBJECTIVE
      ?AUTO_2037 - MODE
    )
    :vars
    (
      ?AUTO_2040 - LANDER
      ?AUTO_2041 - WAYPOINT
      ?AUTO_2043 - WAYPOINT
      ?AUTO_2042 - ROVER
      ?AUTO_2039 - CAMERA
      ?AUTO_2038 - OBJECTIVE
      ?AUTO_2044 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2040 ?AUTO_2041 ) ( VISIBLE ?AUTO_2043 ?AUTO_2041 ) ( AVAILABLE ?AUTO_2042 ) ( CHANNEL_FREE ?AUTO_2040 ) ( not ( = ?AUTO_2043 ?AUTO_2041 ) ) ( ON_BOARD ?AUTO_2039 ?AUTO_2042 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2042 ) ( SUPPORTS ?AUTO_2039 ?AUTO_2037 ) ( VISIBLE_FROM ?AUTO_2036 ?AUTO_2043 ) ( CALIBRATION_TARGET ?AUTO_2039 ?AUTO_2038 ) ( VISIBLE_FROM ?AUTO_2038 ?AUTO_2043 ) ( not ( = ?AUTO_2036 ?AUTO_2038 ) ) ( CAN_TRAVERSE ?AUTO_2042 ?AUTO_2041 ?AUTO_2043 ) ( VISIBLE ?AUTO_2041 ?AUTO_2043 ) ( CAN_TRAVERSE ?AUTO_2042 ?AUTO_2044 ?AUTO_2041 ) ( AT ?AUTO_2042 ?AUTO_2044 ) ( VISIBLE ?AUTO_2044 ?AUTO_2041 ) ( not ( = ?AUTO_2041 ?AUTO_2044 ) ) ( not ( = ?AUTO_2043 ?AUTO_2044 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2042 ?AUTO_2044 ?AUTO_2041 )
      ( GET_IMAGE_DATA ?AUTO_2036 ?AUTO_2037 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2036 ?AUTO_2037 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2070 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2074 - LANDER
      ?AUTO_2071 - WAYPOINT
      ?AUTO_2072 - ROVER
      ?AUTO_2073 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2074 ?AUTO_2070 ) ( VISIBLE ?AUTO_2071 ?AUTO_2070 ) ( AVAILABLE ?AUTO_2072 ) ( CHANNEL_FREE ?AUTO_2074 ) ( not ( = ?AUTO_2070 ?AUTO_2071 ) ) ( CAN_TRAVERSE ?AUTO_2072 ?AUTO_2070 ?AUTO_2071 ) ( AT ?AUTO_2072 ?AUTO_2070 ) ( VISIBLE ?AUTO_2070 ?AUTO_2071 ) ( AT_SOIL_SAMPLE ?AUTO_2070 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2072 ) ( STORE_OF ?AUTO_2073 ?AUTO_2072 ) ( FULL ?AUTO_2073 ) )
    :subtasks
    ( ( !DROP ?AUTO_2072 ?AUTO_2073 )
      ( GET_SOIL_DATA ?AUTO_2070 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2070 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2075 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2077 - LANDER
      ?AUTO_2076 - WAYPOINT
      ?AUTO_2079 - ROVER
      ?AUTO_2078 - STORE
      ?AUTO_2080 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2077 ?AUTO_2075 ) ( VISIBLE ?AUTO_2076 ?AUTO_2075 ) ( AVAILABLE ?AUTO_2079 ) ( CHANNEL_FREE ?AUTO_2077 ) ( not ( = ?AUTO_2075 ?AUTO_2076 ) ) ( CAN_TRAVERSE ?AUTO_2079 ?AUTO_2075 ?AUTO_2076 ) ( VISIBLE ?AUTO_2075 ?AUTO_2076 ) ( AT_SOIL_SAMPLE ?AUTO_2075 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2079 ) ( STORE_OF ?AUTO_2078 ?AUTO_2079 ) ( FULL ?AUTO_2078 ) ( CAN_TRAVERSE ?AUTO_2079 ?AUTO_2080 ?AUTO_2075 ) ( AT ?AUTO_2079 ?AUTO_2080 ) ( VISIBLE ?AUTO_2080 ?AUTO_2075 ) ( not ( = ?AUTO_2075 ?AUTO_2080 ) ) ( not ( = ?AUTO_2076 ?AUTO_2080 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2079 ?AUTO_2080 ?AUTO_2075 )
      ( GET_SOIL_DATA ?AUTO_2075 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2075 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2081 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2082 - LANDER
      ?AUTO_2084 - WAYPOINT
      ?AUTO_2085 - ROVER
      ?AUTO_2083 - STORE
      ?AUTO_2086 - WAYPOINT
      ?AUTO_2087 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2082 ?AUTO_2081 ) ( VISIBLE ?AUTO_2084 ?AUTO_2081 ) ( AVAILABLE ?AUTO_2085 ) ( CHANNEL_FREE ?AUTO_2082 ) ( not ( = ?AUTO_2081 ?AUTO_2084 ) ) ( CAN_TRAVERSE ?AUTO_2085 ?AUTO_2081 ?AUTO_2084 ) ( VISIBLE ?AUTO_2081 ?AUTO_2084 ) ( AT_SOIL_SAMPLE ?AUTO_2081 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2085 ) ( STORE_OF ?AUTO_2083 ?AUTO_2085 ) ( FULL ?AUTO_2083 ) ( CAN_TRAVERSE ?AUTO_2085 ?AUTO_2086 ?AUTO_2081 ) ( VISIBLE ?AUTO_2086 ?AUTO_2081 ) ( not ( = ?AUTO_2081 ?AUTO_2086 ) ) ( not ( = ?AUTO_2084 ?AUTO_2086 ) ) ( CAN_TRAVERSE ?AUTO_2085 ?AUTO_2087 ?AUTO_2086 ) ( AT ?AUTO_2085 ?AUTO_2087 ) ( VISIBLE ?AUTO_2087 ?AUTO_2086 ) ( not ( = ?AUTO_2081 ?AUTO_2087 ) ) ( not ( = ?AUTO_2084 ?AUTO_2087 ) ) ( not ( = ?AUTO_2086 ?AUTO_2087 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2085 ?AUTO_2087 ?AUTO_2086 )
      ( GET_SOIL_DATA ?AUTO_2081 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2081 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2089 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2093 - LANDER
      ?AUTO_2094 - WAYPOINT
      ?AUTO_2090 - ROVER
      ?AUTO_2095 - STORE
      ?AUTO_2091 - WAYPOINT
      ?AUTO_2092 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2093 ?AUTO_2089 ) ( VISIBLE ?AUTO_2094 ?AUTO_2089 ) ( AVAILABLE ?AUTO_2090 ) ( CHANNEL_FREE ?AUTO_2093 ) ( not ( = ?AUTO_2089 ?AUTO_2094 ) ) ( CAN_TRAVERSE ?AUTO_2090 ?AUTO_2089 ?AUTO_2094 ) ( VISIBLE ?AUTO_2089 ?AUTO_2094 ) ( AT_SOIL_SAMPLE ?AUTO_2089 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2090 ) ( STORE_OF ?AUTO_2095 ?AUTO_2090 ) ( CAN_TRAVERSE ?AUTO_2090 ?AUTO_2091 ?AUTO_2089 ) ( VISIBLE ?AUTO_2091 ?AUTO_2089 ) ( not ( = ?AUTO_2089 ?AUTO_2091 ) ) ( not ( = ?AUTO_2094 ?AUTO_2091 ) ) ( CAN_TRAVERSE ?AUTO_2090 ?AUTO_2092 ?AUTO_2091 ) ( AT ?AUTO_2090 ?AUTO_2092 ) ( VISIBLE ?AUTO_2092 ?AUTO_2091 ) ( not ( = ?AUTO_2089 ?AUTO_2092 ) ) ( not ( = ?AUTO_2094 ?AUTO_2092 ) ) ( not ( = ?AUTO_2091 ?AUTO_2092 ) ) ( AT_ROCK_SAMPLE ?AUTO_2092 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2090 ) ( EMPTY ?AUTO_2095 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2090 ?AUTO_2095 ?AUTO_2092 )
      ( GET_SOIL_DATA ?AUTO_2089 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2089 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2125 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2127 - LANDER
      ?AUTO_2126 - WAYPOINT
      ?AUTO_2129 - ROVER
      ?AUTO_2128 - STORE
      ?AUTO_2130 - WAYPOINT
      ?AUTO_2131 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2127 ?AUTO_2126 ) ( VISIBLE ?AUTO_2125 ?AUTO_2126 ) ( AVAILABLE ?AUTO_2129 ) ( CHANNEL_FREE ?AUTO_2127 ) ( not ( = ?AUTO_2125 ?AUTO_2126 ) ) ( AT_ROCK_SAMPLE ?AUTO_2125 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2129 ) ( STORE_OF ?AUTO_2128 ?AUTO_2129 ) ( CAN_TRAVERSE ?AUTO_2129 ?AUTO_2126 ?AUTO_2125 ) ( VISIBLE ?AUTO_2126 ?AUTO_2125 ) ( FULL ?AUTO_2128 ) ( CAN_TRAVERSE ?AUTO_2129 ?AUTO_2130 ?AUTO_2126 ) ( VISIBLE ?AUTO_2130 ?AUTO_2126 ) ( not ( = ?AUTO_2125 ?AUTO_2130 ) ) ( not ( = ?AUTO_2126 ?AUTO_2130 ) ) ( CAN_TRAVERSE ?AUTO_2129 ?AUTO_2131 ?AUTO_2130 ) ( AT ?AUTO_2129 ?AUTO_2131 ) ( VISIBLE ?AUTO_2131 ?AUTO_2130 ) ( not ( = ?AUTO_2125 ?AUTO_2131 ) ) ( not ( = ?AUTO_2126 ?AUTO_2131 ) ) ( not ( = ?AUTO_2130 ?AUTO_2131 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2129 ?AUTO_2131 ?AUTO_2130 )
      ( GET_ROCK_DATA ?AUTO_2125 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2125 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2133 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2134 - LANDER
      ?AUTO_2138 - WAYPOINT
      ?AUTO_2135 - ROVER
      ?AUTO_2137 - STORE
      ?AUTO_2136 - WAYPOINT
      ?AUTO_2139 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2134 ?AUTO_2138 ) ( VISIBLE ?AUTO_2133 ?AUTO_2138 ) ( AVAILABLE ?AUTO_2135 ) ( CHANNEL_FREE ?AUTO_2134 ) ( not ( = ?AUTO_2133 ?AUTO_2138 ) ) ( AT_ROCK_SAMPLE ?AUTO_2133 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2135 ) ( STORE_OF ?AUTO_2137 ?AUTO_2135 ) ( CAN_TRAVERSE ?AUTO_2135 ?AUTO_2138 ?AUTO_2133 ) ( VISIBLE ?AUTO_2138 ?AUTO_2133 ) ( CAN_TRAVERSE ?AUTO_2135 ?AUTO_2136 ?AUTO_2138 ) ( VISIBLE ?AUTO_2136 ?AUTO_2138 ) ( not ( = ?AUTO_2133 ?AUTO_2136 ) ) ( not ( = ?AUTO_2138 ?AUTO_2136 ) ) ( CAN_TRAVERSE ?AUTO_2135 ?AUTO_2139 ?AUTO_2136 ) ( AT ?AUTO_2135 ?AUTO_2139 ) ( VISIBLE ?AUTO_2139 ?AUTO_2136 ) ( not ( = ?AUTO_2133 ?AUTO_2139 ) ) ( not ( = ?AUTO_2138 ?AUTO_2139 ) ) ( not ( = ?AUTO_2136 ?AUTO_2139 ) ) ( AT_ROCK_SAMPLE ?AUTO_2139 ) ( EMPTY ?AUTO_2137 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2135 ?AUTO_2137 ?AUTO_2139 )
      ( GET_ROCK_DATA ?AUTO_2133 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2133 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2163 - OBJECTIVE
      ?AUTO_2164 - MODE
    )
    :vars
    (
      ?AUTO_2167 - LANDER
      ?AUTO_2165 - WAYPOINT
      ?AUTO_2169 - WAYPOINT
      ?AUTO_2168 - ROVER
      ?AUTO_2170 - WAYPOINT
      ?AUTO_2166 - CAMERA
      ?AUTO_2171 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2167 ?AUTO_2165 ) ( VISIBLE ?AUTO_2169 ?AUTO_2165 ) ( AVAILABLE ?AUTO_2168 ) ( CHANNEL_FREE ?AUTO_2167 ) ( not ( = ?AUTO_2169 ?AUTO_2165 ) ) ( CAN_TRAVERSE ?AUTO_2168 ?AUTO_2170 ?AUTO_2169 ) ( AT ?AUTO_2168 ?AUTO_2170 ) ( VISIBLE ?AUTO_2170 ?AUTO_2169 ) ( not ( = ?AUTO_2165 ?AUTO_2170 ) ) ( not ( = ?AUTO_2169 ?AUTO_2170 ) ) ( ON_BOARD ?AUTO_2166 ?AUTO_2168 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2168 ) ( SUPPORTS ?AUTO_2166 ?AUTO_2164 ) ( VISIBLE_FROM ?AUTO_2163 ?AUTO_2170 ) ( CALIBRATION_TARGET ?AUTO_2166 ?AUTO_2171 ) ( VISIBLE_FROM ?AUTO_2171 ?AUTO_2170 ) ( not ( = ?AUTO_2163 ?AUTO_2171 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_2168 ?AUTO_2166 ?AUTO_2171 ?AUTO_2170 )
      ( GET_IMAGE_DATA ?AUTO_2163 ?AUTO_2164 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2163 ?AUTO_2164 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2172 - OBJECTIVE
      ?AUTO_2173 - MODE
    )
    :vars
    (
      ?AUTO_2180 - LANDER
      ?AUTO_2176 - WAYPOINT
      ?AUTO_2178 - WAYPOINT
      ?AUTO_2179 - ROVER
      ?AUTO_2177 - WAYPOINT
      ?AUTO_2174 - CAMERA
      ?AUTO_2175 - OBJECTIVE
      ?AUTO_2181 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2180 ?AUTO_2176 ) ( VISIBLE ?AUTO_2178 ?AUTO_2176 ) ( AVAILABLE ?AUTO_2179 ) ( CHANNEL_FREE ?AUTO_2180 ) ( not ( = ?AUTO_2178 ?AUTO_2176 ) ) ( CAN_TRAVERSE ?AUTO_2179 ?AUTO_2177 ?AUTO_2178 ) ( VISIBLE ?AUTO_2177 ?AUTO_2178 ) ( not ( = ?AUTO_2176 ?AUTO_2177 ) ) ( not ( = ?AUTO_2178 ?AUTO_2177 ) ) ( ON_BOARD ?AUTO_2174 ?AUTO_2179 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2179 ) ( SUPPORTS ?AUTO_2174 ?AUTO_2173 ) ( VISIBLE_FROM ?AUTO_2172 ?AUTO_2177 ) ( CALIBRATION_TARGET ?AUTO_2174 ?AUTO_2175 ) ( VISIBLE_FROM ?AUTO_2175 ?AUTO_2177 ) ( not ( = ?AUTO_2172 ?AUTO_2175 ) ) ( CAN_TRAVERSE ?AUTO_2179 ?AUTO_2181 ?AUTO_2177 ) ( AT ?AUTO_2179 ?AUTO_2181 ) ( VISIBLE ?AUTO_2181 ?AUTO_2177 ) ( not ( = ?AUTO_2176 ?AUTO_2181 ) ) ( not ( = ?AUTO_2178 ?AUTO_2181 ) ) ( not ( = ?AUTO_2177 ?AUTO_2181 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2179 ?AUTO_2181 ?AUTO_2177 )
      ( GET_IMAGE_DATA ?AUTO_2172 ?AUTO_2173 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2172 ?AUTO_2173 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2188 - OBJECTIVE
      ?AUTO_2189 - MODE
    )
    :vars
    (
      ?AUTO_2193 - LANDER
      ?AUTO_2196 - WAYPOINT
      ?AUTO_2190 - WAYPOINT
      ?AUTO_2194 - ROVER
      ?AUTO_2197 - WAYPOINT
      ?AUTO_2191 - CAMERA
      ?AUTO_2192 - OBJECTIVE
      ?AUTO_2195 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2193 ?AUTO_2196 ) ( VISIBLE ?AUTO_2190 ?AUTO_2196 ) ( AVAILABLE ?AUTO_2194 ) ( CHANNEL_FREE ?AUTO_2193 ) ( not ( = ?AUTO_2190 ?AUTO_2196 ) ) ( CAN_TRAVERSE ?AUTO_2194 ?AUTO_2197 ?AUTO_2190 ) ( VISIBLE ?AUTO_2197 ?AUTO_2190 ) ( not ( = ?AUTO_2196 ?AUTO_2197 ) ) ( not ( = ?AUTO_2190 ?AUTO_2197 ) ) ( ON_BOARD ?AUTO_2191 ?AUTO_2194 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2194 ) ( SUPPORTS ?AUTO_2191 ?AUTO_2189 ) ( VISIBLE_FROM ?AUTO_2188 ?AUTO_2197 ) ( CALIBRATION_TARGET ?AUTO_2191 ?AUTO_2192 ) ( VISIBLE_FROM ?AUTO_2192 ?AUTO_2197 ) ( not ( = ?AUTO_2188 ?AUTO_2192 ) ) ( CAN_TRAVERSE ?AUTO_2194 ?AUTO_2195 ?AUTO_2197 ) ( VISIBLE ?AUTO_2195 ?AUTO_2197 ) ( not ( = ?AUTO_2196 ?AUTO_2195 ) ) ( not ( = ?AUTO_2190 ?AUTO_2195 ) ) ( not ( = ?AUTO_2197 ?AUTO_2195 ) ) ( CAN_TRAVERSE ?AUTO_2194 ?AUTO_2196 ?AUTO_2195 ) ( AT ?AUTO_2194 ?AUTO_2196 ) ( VISIBLE ?AUTO_2196 ?AUTO_2195 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2194 ?AUTO_2196 ?AUTO_2195 )
      ( GET_IMAGE_DATA ?AUTO_2188 ?AUTO_2189 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2188 ?AUTO_2189 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2204 - OBJECTIVE
      ?AUTO_2205 - MODE
    )
    :vars
    (
      ?AUTO_2211 - LANDER
      ?AUTO_2207 - WAYPOINT
      ?AUTO_2213 - WAYPOINT
      ?AUTO_2209 - ROVER
      ?AUTO_2212 - WAYPOINT
      ?AUTO_2208 - CAMERA
      ?AUTO_2206 - OBJECTIVE
      ?AUTO_2210 - WAYPOINT
      ?AUTO_2214 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2211 ?AUTO_2207 ) ( VISIBLE ?AUTO_2213 ?AUTO_2207 ) ( AVAILABLE ?AUTO_2209 ) ( CHANNEL_FREE ?AUTO_2211 ) ( not ( = ?AUTO_2213 ?AUTO_2207 ) ) ( CAN_TRAVERSE ?AUTO_2209 ?AUTO_2212 ?AUTO_2213 ) ( VISIBLE ?AUTO_2212 ?AUTO_2213 ) ( not ( = ?AUTO_2207 ?AUTO_2212 ) ) ( not ( = ?AUTO_2213 ?AUTO_2212 ) ) ( ON_BOARD ?AUTO_2208 ?AUTO_2209 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2209 ) ( SUPPORTS ?AUTO_2208 ?AUTO_2205 ) ( VISIBLE_FROM ?AUTO_2204 ?AUTO_2212 ) ( CALIBRATION_TARGET ?AUTO_2208 ?AUTO_2206 ) ( VISIBLE_FROM ?AUTO_2206 ?AUTO_2212 ) ( not ( = ?AUTO_2204 ?AUTO_2206 ) ) ( CAN_TRAVERSE ?AUTO_2209 ?AUTO_2210 ?AUTO_2212 ) ( VISIBLE ?AUTO_2210 ?AUTO_2212 ) ( not ( = ?AUTO_2207 ?AUTO_2210 ) ) ( not ( = ?AUTO_2213 ?AUTO_2210 ) ) ( not ( = ?AUTO_2212 ?AUTO_2210 ) ) ( CAN_TRAVERSE ?AUTO_2209 ?AUTO_2207 ?AUTO_2210 ) ( VISIBLE ?AUTO_2207 ?AUTO_2210 ) ( CAN_TRAVERSE ?AUTO_2209 ?AUTO_2214 ?AUTO_2207 ) ( AT ?AUTO_2209 ?AUTO_2214 ) ( VISIBLE ?AUTO_2214 ?AUTO_2207 ) ( not ( = ?AUTO_2207 ?AUTO_2214 ) ) ( not ( = ?AUTO_2213 ?AUTO_2214 ) ) ( not ( = ?AUTO_2212 ?AUTO_2214 ) ) ( not ( = ?AUTO_2210 ?AUTO_2214 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2209 ?AUTO_2214 ?AUTO_2207 )
      ( GET_IMAGE_DATA ?AUTO_2204 ?AUTO_2205 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2204 ?AUTO_2205 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2215 - OBJECTIVE
      ?AUTO_2216 - MODE
    )
    :vars
    (
      ?AUTO_2221 - LANDER
      ?AUTO_2217 - WAYPOINT
      ?AUTO_2224 - WAYPOINT
      ?AUTO_2220 - ROVER
      ?AUTO_2225 - WAYPOINT
      ?AUTO_2218 - CAMERA
      ?AUTO_2219 - OBJECTIVE
      ?AUTO_2223 - WAYPOINT
      ?AUTO_2222 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2221 ?AUTO_2217 ) ( VISIBLE ?AUTO_2224 ?AUTO_2217 ) ( AVAILABLE ?AUTO_2220 ) ( CHANNEL_FREE ?AUTO_2221 ) ( not ( = ?AUTO_2224 ?AUTO_2217 ) ) ( CAN_TRAVERSE ?AUTO_2220 ?AUTO_2225 ?AUTO_2224 ) ( VISIBLE ?AUTO_2225 ?AUTO_2224 ) ( not ( = ?AUTO_2217 ?AUTO_2225 ) ) ( not ( = ?AUTO_2224 ?AUTO_2225 ) ) ( ON_BOARD ?AUTO_2218 ?AUTO_2220 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2220 ) ( SUPPORTS ?AUTO_2218 ?AUTO_2216 ) ( VISIBLE_FROM ?AUTO_2215 ?AUTO_2225 ) ( CALIBRATION_TARGET ?AUTO_2218 ?AUTO_2219 ) ( VISIBLE_FROM ?AUTO_2219 ?AUTO_2225 ) ( not ( = ?AUTO_2215 ?AUTO_2219 ) ) ( CAN_TRAVERSE ?AUTO_2220 ?AUTO_2223 ?AUTO_2225 ) ( VISIBLE ?AUTO_2223 ?AUTO_2225 ) ( not ( = ?AUTO_2217 ?AUTO_2223 ) ) ( not ( = ?AUTO_2224 ?AUTO_2223 ) ) ( not ( = ?AUTO_2225 ?AUTO_2223 ) ) ( CAN_TRAVERSE ?AUTO_2220 ?AUTO_2217 ?AUTO_2223 ) ( VISIBLE ?AUTO_2217 ?AUTO_2223 ) ( CAN_TRAVERSE ?AUTO_2220 ?AUTO_2222 ?AUTO_2217 ) ( VISIBLE ?AUTO_2222 ?AUTO_2217 ) ( not ( = ?AUTO_2217 ?AUTO_2222 ) ) ( not ( = ?AUTO_2224 ?AUTO_2222 ) ) ( not ( = ?AUTO_2225 ?AUTO_2222 ) ) ( not ( = ?AUTO_2223 ?AUTO_2222 ) ) ( CAN_TRAVERSE ?AUTO_2220 ?AUTO_2224 ?AUTO_2222 ) ( AT ?AUTO_2220 ?AUTO_2224 ) ( VISIBLE ?AUTO_2224 ?AUTO_2222 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2220 ?AUTO_2224 ?AUTO_2222 )
      ( GET_IMAGE_DATA ?AUTO_2215 ?AUTO_2216 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2215 ?AUTO_2216 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2258 - OBJECTIVE
      ?AUTO_2259 - MODE
    )
    :vars
    (
      ?AUTO_2261 - LANDER
      ?AUTO_2263 - WAYPOINT
      ?AUTO_2262 - WAYPOINT
      ?AUTO_2265 - ROVER
      ?AUTO_2264 - CAMERA
      ?AUTO_2260 - WAYPOINT
      ?AUTO_2266 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2261 ?AUTO_2263 ) ( VISIBLE ?AUTO_2262 ?AUTO_2263 ) ( AVAILABLE ?AUTO_2265 ) ( CHANNEL_FREE ?AUTO_2261 ) ( not ( = ?AUTO_2262 ?AUTO_2263 ) ) ( ON_BOARD ?AUTO_2264 ?AUTO_2265 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2265 ) ( SUPPORTS ?AUTO_2264 ?AUTO_2259 ) ( VISIBLE_FROM ?AUTO_2258 ?AUTO_2262 ) ( CAN_TRAVERSE ?AUTO_2265 ?AUTO_2260 ?AUTO_2262 ) ( VISIBLE ?AUTO_2260 ?AUTO_2262 ) ( not ( = ?AUTO_2263 ?AUTO_2260 ) ) ( not ( = ?AUTO_2262 ?AUTO_2260 ) ) ( CALIBRATION_TARGET ?AUTO_2264 ?AUTO_2266 ) ( VISIBLE_FROM ?AUTO_2266 ?AUTO_2260 ) ( not ( = ?AUTO_2258 ?AUTO_2266 ) ) ( CAN_TRAVERSE ?AUTO_2265 ?AUTO_2263 ?AUTO_2260 ) ( AT ?AUTO_2265 ?AUTO_2263 ) ( VISIBLE ?AUTO_2263 ?AUTO_2260 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2265 ?AUTO_2263 ?AUTO_2260 )
      ( GET_IMAGE_DATA ?AUTO_2258 ?AUTO_2259 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2258 ?AUTO_2259 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2438 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2442 - LANDER
      ?AUTO_2441 - WAYPOINT
      ?AUTO_2439 - WAYPOINT
      ?AUTO_2440 - ROVER
      ?AUTO_2443 - STORE
      ?AUTO_2444 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2442 ?AUTO_2441 ) ( VISIBLE ?AUTO_2439 ?AUTO_2441 ) ( AVAILABLE ?AUTO_2440 ) ( CHANNEL_FREE ?AUTO_2442 ) ( not ( = ?AUTO_2438 ?AUTO_2439 ) ) ( not ( = ?AUTO_2438 ?AUTO_2441 ) ) ( not ( = ?AUTO_2439 ?AUTO_2441 ) ) ( CAN_TRAVERSE ?AUTO_2440 ?AUTO_2438 ?AUTO_2439 ) ( VISIBLE ?AUTO_2438 ?AUTO_2439 ) ( AT_ROCK_SAMPLE ?AUTO_2438 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2440 ) ( STORE_OF ?AUTO_2443 ?AUTO_2440 ) ( EMPTY ?AUTO_2443 ) ( CAN_TRAVERSE ?AUTO_2440 ?AUTO_2444 ?AUTO_2438 ) ( AT ?AUTO_2440 ?AUTO_2444 ) ( VISIBLE ?AUTO_2444 ?AUTO_2438 ) ( not ( = ?AUTO_2438 ?AUTO_2444 ) ) ( not ( = ?AUTO_2441 ?AUTO_2444 ) ) ( not ( = ?AUTO_2439 ?AUTO_2444 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2440 ?AUTO_2444 ?AUTO_2438 )
      ( GET_ROCK_DATA ?AUTO_2438 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2438 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2479 - OBJECTIVE
      ?AUTO_2480 - MODE
    )
    :vars
    (
      ?AUTO_2481 - LANDER
      ?AUTO_2484 - WAYPOINT
      ?AUTO_2483 - WAYPOINT
      ?AUTO_2485 - ROVER
      ?AUTO_2482 - CAMERA
      ?AUTO_2486 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2481 ?AUTO_2484 ) ( VISIBLE ?AUTO_2483 ?AUTO_2484 ) ( AVAILABLE ?AUTO_2485 ) ( CHANNEL_FREE ?AUTO_2481 ) ( not ( = ?AUTO_2483 ?AUTO_2484 ) ) ( CAN_TRAVERSE ?AUTO_2485 ?AUTO_2484 ?AUTO_2483 ) ( VISIBLE ?AUTO_2484 ?AUTO_2483 ) ( ON_BOARD ?AUTO_2482 ?AUTO_2485 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2485 ) ( SUPPORTS ?AUTO_2482 ?AUTO_2480 ) ( VISIBLE_FROM ?AUTO_2479 ?AUTO_2484 ) ( CALIBRATION_TARGET ?AUTO_2482 ?AUTO_2479 ) ( CAN_TRAVERSE ?AUTO_2485 ?AUTO_2486 ?AUTO_2484 ) ( AT ?AUTO_2485 ?AUTO_2486 ) ( VISIBLE ?AUTO_2486 ?AUTO_2484 ) ( not ( = ?AUTO_2484 ?AUTO_2486 ) ) ( not ( = ?AUTO_2483 ?AUTO_2486 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2485 ?AUTO_2486 ?AUTO_2484 )
      ( GET_IMAGE_DATA ?AUTO_2479 ?AUTO_2480 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2479 ?AUTO_2480 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2567 - OBJECTIVE
      ?AUTO_2568 - MODE
    )
    :vars
    (
      ?AUTO_2569 - LANDER
      ?AUTO_2572 - WAYPOINT
      ?AUTO_2570 - WAYPOINT
      ?AUTO_2574 - ROVER
      ?AUTO_2571 - CAMERA
      ?AUTO_2573 - OBJECTIVE
      ?AUTO_2575 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2569 ?AUTO_2572 ) ( VISIBLE ?AUTO_2570 ?AUTO_2572 ) ( AVAILABLE ?AUTO_2574 ) ( CHANNEL_FREE ?AUTO_2569 ) ( not ( = ?AUTO_2570 ?AUTO_2572 ) ) ( ON_BOARD ?AUTO_2571 ?AUTO_2574 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2574 ) ( SUPPORTS ?AUTO_2571 ?AUTO_2568 ) ( VISIBLE_FROM ?AUTO_2567 ?AUTO_2570 ) ( CAN_TRAVERSE ?AUTO_2574 ?AUTO_2572 ?AUTO_2570 ) ( VISIBLE ?AUTO_2572 ?AUTO_2570 ) ( CALIBRATION_TARGET ?AUTO_2571 ?AUTO_2573 ) ( VISIBLE_FROM ?AUTO_2573 ?AUTO_2572 ) ( not ( = ?AUTO_2567 ?AUTO_2573 ) ) ( CAN_TRAVERSE ?AUTO_2574 ?AUTO_2575 ?AUTO_2572 ) ( AT ?AUTO_2574 ?AUTO_2575 ) ( VISIBLE ?AUTO_2575 ?AUTO_2572 ) ( not ( = ?AUTO_2572 ?AUTO_2575 ) ) ( not ( = ?AUTO_2570 ?AUTO_2575 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2574 ?AUTO_2575 ?AUTO_2572 )
      ( GET_IMAGE_DATA ?AUTO_2567 ?AUTO_2568 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2567 ?AUTO_2568 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2615 - OBJECTIVE
      ?AUTO_2616 - MODE
    )
    :vars
    (
      ?AUTO_2620 - LANDER
      ?AUTO_2618 - WAYPOINT
      ?AUTO_2621 - WAYPOINT
      ?AUTO_2617 - ROVER
      ?AUTO_2622 - WAYPOINT
      ?AUTO_2619 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2620 ?AUTO_2618 ) ( VISIBLE ?AUTO_2621 ?AUTO_2618 ) ( AVAILABLE ?AUTO_2617 ) ( CHANNEL_FREE ?AUTO_2620 ) ( not ( = ?AUTO_2621 ?AUTO_2618 ) ) ( CAN_TRAVERSE ?AUTO_2617 ?AUTO_2622 ?AUTO_2621 ) ( VISIBLE ?AUTO_2622 ?AUTO_2621 ) ( not ( = ?AUTO_2618 ?AUTO_2622 ) ) ( not ( = ?AUTO_2621 ?AUTO_2622 ) ) ( ON_BOARD ?AUTO_2619 ?AUTO_2617 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2617 ) ( SUPPORTS ?AUTO_2619 ?AUTO_2616 ) ( VISIBLE_FROM ?AUTO_2615 ?AUTO_2622 ) ( CALIBRATION_TARGET ?AUTO_2619 ?AUTO_2615 ) ( CAN_TRAVERSE ?AUTO_2617 ?AUTO_2621 ?AUTO_2622 ) ( VISIBLE ?AUTO_2621 ?AUTO_2622 ) ( CAN_TRAVERSE ?AUTO_2617 ?AUTO_2618 ?AUTO_2621 ) ( AT ?AUTO_2617 ?AUTO_2618 ) ( VISIBLE ?AUTO_2618 ?AUTO_2621 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2617 ?AUTO_2618 ?AUTO_2621 )
      ( GET_IMAGE_DATA ?AUTO_2615 ?AUTO_2616 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2615 ?AUTO_2616 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_2623 - OBJECTIVE
      ?AUTO_2624 - MODE
    )
    :vars
    (
      ?AUTO_2627 - LANDER
      ?AUTO_2625 - WAYPOINT
      ?AUTO_2628 - WAYPOINT
      ?AUTO_2629 - ROVER
      ?AUTO_2630 - WAYPOINT
      ?AUTO_2626 - CAMERA
      ?AUTO_2631 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2627 ?AUTO_2625 ) ( VISIBLE ?AUTO_2628 ?AUTO_2625 ) ( AVAILABLE ?AUTO_2629 ) ( CHANNEL_FREE ?AUTO_2627 ) ( not ( = ?AUTO_2628 ?AUTO_2625 ) ) ( CAN_TRAVERSE ?AUTO_2629 ?AUTO_2630 ?AUTO_2628 ) ( VISIBLE ?AUTO_2630 ?AUTO_2628 ) ( not ( = ?AUTO_2625 ?AUTO_2630 ) ) ( not ( = ?AUTO_2628 ?AUTO_2630 ) ) ( ON_BOARD ?AUTO_2626 ?AUTO_2629 ) ( EQUIPPED_FOR_IMAGING ?AUTO_2629 ) ( SUPPORTS ?AUTO_2626 ?AUTO_2624 ) ( VISIBLE_FROM ?AUTO_2623 ?AUTO_2630 ) ( CALIBRATION_TARGET ?AUTO_2626 ?AUTO_2623 ) ( CAN_TRAVERSE ?AUTO_2629 ?AUTO_2628 ?AUTO_2630 ) ( VISIBLE ?AUTO_2628 ?AUTO_2630 ) ( CAN_TRAVERSE ?AUTO_2629 ?AUTO_2625 ?AUTO_2628 ) ( VISIBLE ?AUTO_2625 ?AUTO_2628 ) ( CAN_TRAVERSE ?AUTO_2629 ?AUTO_2631 ?AUTO_2625 ) ( AT ?AUTO_2629 ?AUTO_2631 ) ( VISIBLE ?AUTO_2631 ?AUTO_2625 ) ( not ( = ?AUTO_2625 ?AUTO_2631 ) ) ( not ( = ?AUTO_2628 ?AUTO_2631 ) ) ( not ( = ?AUTO_2630 ?AUTO_2631 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2629 ?AUTO_2631 ?AUTO_2625 )
      ( GET_IMAGE_DATA ?AUTO_2623 ?AUTO_2624 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_2623 ?AUTO_2624 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2684 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2687 - LANDER
      ?AUTO_2686 - WAYPOINT
      ?AUTO_2685 - WAYPOINT
      ?AUTO_2688 - ROVER
      ?AUTO_2689 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2687 ?AUTO_2686 ) ( VISIBLE ?AUTO_2685 ?AUTO_2686 ) ( AVAILABLE ?AUTO_2688 ) ( CHANNEL_FREE ?AUTO_2687 ) ( not ( = ?AUTO_2684 ?AUTO_2685 ) ) ( not ( = ?AUTO_2684 ?AUTO_2686 ) ) ( not ( = ?AUTO_2685 ?AUTO_2686 ) ) ( CAN_TRAVERSE ?AUTO_2688 ?AUTO_2684 ?AUTO_2685 ) ( VISIBLE ?AUTO_2684 ?AUTO_2685 ) ( AT_SOIL_SAMPLE ?AUTO_2684 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2688 ) ( STORE_OF ?AUTO_2689 ?AUTO_2688 ) ( CAN_TRAVERSE ?AUTO_2688 ?AUTO_2685 ?AUTO_2684 ) ( VISIBLE ?AUTO_2685 ?AUTO_2684 ) ( CAN_TRAVERSE ?AUTO_2688 ?AUTO_2686 ?AUTO_2685 ) ( AT ?AUTO_2688 ?AUTO_2686 ) ( VISIBLE ?AUTO_2686 ?AUTO_2685 ) ( FULL ?AUTO_2689 ) )
    :subtasks
    ( ( !DROP ?AUTO_2688 ?AUTO_2689 )
      ( GET_SOIL_DATA ?AUTO_2684 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2684 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2743 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2745 - LANDER
      ?AUTO_2746 - WAYPOINT
      ?AUTO_2744 - ROVER
      ?AUTO_2747 - STORE
      ?AUTO_2748 - WAYPOINT
      ?AUTO_2749 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2745 ?AUTO_2743 ) ( VISIBLE ?AUTO_2746 ?AUTO_2743 ) ( AVAILABLE ?AUTO_2744 ) ( CHANNEL_FREE ?AUTO_2745 ) ( not ( = ?AUTO_2743 ?AUTO_2746 ) ) ( CAN_TRAVERSE ?AUTO_2744 ?AUTO_2743 ?AUTO_2746 ) ( VISIBLE ?AUTO_2743 ?AUTO_2746 ) ( AT_SOIL_SAMPLE ?AUTO_2743 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2744 ) ( STORE_OF ?AUTO_2747 ?AUTO_2744 ) ( EMPTY ?AUTO_2747 ) ( CAN_TRAVERSE ?AUTO_2744 ?AUTO_2748 ?AUTO_2743 ) ( VISIBLE ?AUTO_2748 ?AUTO_2743 ) ( not ( = ?AUTO_2743 ?AUTO_2748 ) ) ( not ( = ?AUTO_2746 ?AUTO_2748 ) ) ( CAN_TRAVERSE ?AUTO_2744 ?AUTO_2749 ?AUTO_2748 ) ( AT ?AUTO_2744 ?AUTO_2749 ) ( VISIBLE ?AUTO_2749 ?AUTO_2748 ) ( not ( = ?AUTO_2743 ?AUTO_2749 ) ) ( not ( = ?AUTO_2746 ?AUTO_2749 ) ) ( not ( = ?AUTO_2748 ?AUTO_2749 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2744 ?AUTO_2749 ?AUTO_2748 )
      ( GET_SOIL_DATA ?AUTO_2743 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2743 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2751 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2755 - LANDER
      ?AUTO_2757 - WAYPOINT
      ?AUTO_2754 - ROVER
      ?AUTO_2753 - STORE
      ?AUTO_2756 - WAYPOINT
      ?AUTO_2752 - WAYPOINT
      ?AUTO_2758 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2755 ?AUTO_2751 ) ( VISIBLE ?AUTO_2757 ?AUTO_2751 ) ( AVAILABLE ?AUTO_2754 ) ( CHANNEL_FREE ?AUTO_2755 ) ( not ( = ?AUTO_2751 ?AUTO_2757 ) ) ( CAN_TRAVERSE ?AUTO_2754 ?AUTO_2751 ?AUTO_2757 ) ( VISIBLE ?AUTO_2751 ?AUTO_2757 ) ( AT_SOIL_SAMPLE ?AUTO_2751 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2754 ) ( STORE_OF ?AUTO_2753 ?AUTO_2754 ) ( EMPTY ?AUTO_2753 ) ( CAN_TRAVERSE ?AUTO_2754 ?AUTO_2756 ?AUTO_2751 ) ( VISIBLE ?AUTO_2756 ?AUTO_2751 ) ( not ( = ?AUTO_2751 ?AUTO_2756 ) ) ( not ( = ?AUTO_2757 ?AUTO_2756 ) ) ( CAN_TRAVERSE ?AUTO_2754 ?AUTO_2752 ?AUTO_2756 ) ( VISIBLE ?AUTO_2752 ?AUTO_2756 ) ( not ( = ?AUTO_2751 ?AUTO_2752 ) ) ( not ( = ?AUTO_2757 ?AUTO_2752 ) ) ( not ( = ?AUTO_2756 ?AUTO_2752 ) ) ( CAN_TRAVERSE ?AUTO_2754 ?AUTO_2758 ?AUTO_2752 ) ( AT ?AUTO_2754 ?AUTO_2758 ) ( VISIBLE ?AUTO_2758 ?AUTO_2752 ) ( not ( = ?AUTO_2751 ?AUTO_2758 ) ) ( not ( = ?AUTO_2757 ?AUTO_2758 ) ) ( not ( = ?AUTO_2756 ?AUTO_2758 ) ) ( not ( = ?AUTO_2752 ?AUTO_2758 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2754 ?AUTO_2758 ?AUTO_2752 )
      ( GET_SOIL_DATA ?AUTO_2751 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2751 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2788 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2793 - LANDER
      ?AUTO_2791 - WAYPOINT
      ?AUTO_2792 - ROVER
      ?AUTO_2789 - STORE
      ?AUTO_2790 - WAYPOINT
      ?AUTO_2794 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2793 ?AUTO_2788 ) ( VISIBLE ?AUTO_2791 ?AUTO_2788 ) ( AVAILABLE ?AUTO_2792 ) ( CHANNEL_FREE ?AUTO_2793 ) ( not ( = ?AUTO_2788 ?AUTO_2791 ) ) ( CAN_TRAVERSE ?AUTO_2792 ?AUTO_2788 ?AUTO_2791 ) ( VISIBLE ?AUTO_2788 ?AUTO_2791 ) ( AT_ROCK_SAMPLE ?AUTO_2788 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2792 ) ( STORE_OF ?AUTO_2789 ?AUTO_2792 ) ( EMPTY ?AUTO_2789 ) ( CAN_TRAVERSE ?AUTO_2792 ?AUTO_2790 ?AUTO_2788 ) ( VISIBLE ?AUTO_2790 ?AUTO_2788 ) ( not ( = ?AUTO_2788 ?AUTO_2790 ) ) ( not ( = ?AUTO_2791 ?AUTO_2790 ) ) ( CAN_TRAVERSE ?AUTO_2792 ?AUTO_2794 ?AUTO_2790 ) ( AT ?AUTO_2792 ?AUTO_2794 ) ( VISIBLE ?AUTO_2794 ?AUTO_2790 ) ( not ( = ?AUTO_2788 ?AUTO_2794 ) ) ( not ( = ?AUTO_2791 ?AUTO_2794 ) ) ( not ( = ?AUTO_2790 ?AUTO_2794 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2792 ?AUTO_2794 ?AUTO_2790 )
      ( GET_ROCK_DATA ?AUTO_2788 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2788 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2796 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2797 - LANDER
      ?AUTO_2801 - WAYPOINT
      ?AUTO_2798 - ROVER
      ?AUTO_2799 - STORE
      ?AUTO_2802 - WAYPOINT
      ?AUTO_2800 - WAYPOINT
      ?AUTO_2803 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2797 ?AUTO_2796 ) ( VISIBLE ?AUTO_2801 ?AUTO_2796 ) ( AVAILABLE ?AUTO_2798 ) ( CHANNEL_FREE ?AUTO_2797 ) ( not ( = ?AUTO_2796 ?AUTO_2801 ) ) ( CAN_TRAVERSE ?AUTO_2798 ?AUTO_2796 ?AUTO_2801 ) ( VISIBLE ?AUTO_2796 ?AUTO_2801 ) ( AT_ROCK_SAMPLE ?AUTO_2796 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2798 ) ( STORE_OF ?AUTO_2799 ?AUTO_2798 ) ( EMPTY ?AUTO_2799 ) ( CAN_TRAVERSE ?AUTO_2798 ?AUTO_2802 ?AUTO_2796 ) ( VISIBLE ?AUTO_2802 ?AUTO_2796 ) ( not ( = ?AUTO_2796 ?AUTO_2802 ) ) ( not ( = ?AUTO_2801 ?AUTO_2802 ) ) ( CAN_TRAVERSE ?AUTO_2798 ?AUTO_2800 ?AUTO_2802 ) ( VISIBLE ?AUTO_2800 ?AUTO_2802 ) ( not ( = ?AUTO_2796 ?AUTO_2800 ) ) ( not ( = ?AUTO_2801 ?AUTO_2800 ) ) ( not ( = ?AUTO_2802 ?AUTO_2800 ) ) ( CAN_TRAVERSE ?AUTO_2798 ?AUTO_2803 ?AUTO_2800 ) ( AT ?AUTO_2798 ?AUTO_2803 ) ( VISIBLE ?AUTO_2803 ?AUTO_2800 ) ( not ( = ?AUTO_2796 ?AUTO_2803 ) ) ( not ( = ?AUTO_2801 ?AUTO_2803 ) ) ( not ( = ?AUTO_2802 ?AUTO_2803 ) ) ( not ( = ?AUTO_2800 ?AUTO_2803 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2798 ?AUTO_2803 ?AUTO_2800 )
      ( GET_ROCK_DATA ?AUTO_2796 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2796 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2823 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2825 - LANDER
      ?AUTO_2826 - WAYPOINT
      ?AUTO_2824 - ROVER
      ?AUTO_2827 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2825 ?AUTO_2826 ) ( VISIBLE ?AUTO_2823 ?AUTO_2826 ) ( AVAILABLE ?AUTO_2824 ) ( CHANNEL_FREE ?AUTO_2825 ) ( not ( = ?AUTO_2823 ?AUTO_2826 ) ) ( AT_ROCK_SAMPLE ?AUTO_2823 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2824 ) ( STORE_OF ?AUTO_2827 ?AUTO_2824 ) ( FULL ?AUTO_2827 ) ( CAN_TRAVERSE ?AUTO_2824 ?AUTO_2826 ?AUTO_2823 ) ( AT ?AUTO_2824 ?AUTO_2826 ) ( VISIBLE ?AUTO_2826 ?AUTO_2823 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2824 ?AUTO_2826 ?AUTO_2823 )
      ( GET_ROCK_DATA ?AUTO_2823 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2823 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2828 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2829 - LANDER
      ?AUTO_2832 - WAYPOINT
      ?AUTO_2830 - ROVER
      ?AUTO_2831 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2829 ?AUTO_2832 ) ( VISIBLE ?AUTO_2828 ?AUTO_2832 ) ( AVAILABLE ?AUTO_2830 ) ( CHANNEL_FREE ?AUTO_2829 ) ( not ( = ?AUTO_2828 ?AUTO_2832 ) ) ( AT_ROCK_SAMPLE ?AUTO_2828 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2830 ) ( STORE_OF ?AUTO_2831 ?AUTO_2830 ) ( CAN_TRAVERSE ?AUTO_2830 ?AUTO_2832 ?AUTO_2828 ) ( AT ?AUTO_2830 ?AUTO_2832 ) ( VISIBLE ?AUTO_2832 ?AUTO_2828 ) ( AT_ROCK_SAMPLE ?AUTO_2832 ) ( EMPTY ?AUTO_2831 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2830 ?AUTO_2831 ?AUTO_2832 )
      ( GET_ROCK_DATA ?AUTO_2828 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2828 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2875 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2877 - LANDER
      ?AUTO_2876 - WAYPOINT
      ?AUTO_2879 - WAYPOINT
      ?AUTO_2880 - ROVER
      ?AUTO_2878 - STORE
      ?AUTO_2881 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2877 ?AUTO_2876 ) ( VISIBLE ?AUTO_2879 ?AUTO_2876 ) ( AVAILABLE ?AUTO_2880 ) ( CHANNEL_FREE ?AUTO_2877 ) ( not ( = ?AUTO_2875 ?AUTO_2879 ) ) ( not ( = ?AUTO_2875 ?AUTO_2876 ) ) ( not ( = ?AUTO_2879 ?AUTO_2876 ) ) ( CAN_TRAVERSE ?AUTO_2880 ?AUTO_2875 ?AUTO_2879 ) ( VISIBLE ?AUTO_2875 ?AUTO_2879 ) ( AT_ROCK_SAMPLE ?AUTO_2875 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2880 ) ( STORE_OF ?AUTO_2878 ?AUTO_2880 ) ( CAN_TRAVERSE ?AUTO_2880 ?AUTO_2881 ?AUTO_2875 ) ( AT ?AUTO_2880 ?AUTO_2881 ) ( VISIBLE ?AUTO_2881 ?AUTO_2875 ) ( not ( = ?AUTO_2875 ?AUTO_2881 ) ) ( not ( = ?AUTO_2876 ?AUTO_2881 ) ) ( not ( = ?AUTO_2879 ?AUTO_2881 ) ) ( FULL ?AUTO_2878 ) )
    :subtasks
    ( ( !DROP ?AUTO_2880 ?AUTO_2878 )
      ( GET_ROCK_DATA ?AUTO_2875 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2875 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2882 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2884 - LANDER
      ?AUTO_2887 - WAYPOINT
      ?AUTO_2888 - WAYPOINT
      ?AUTO_2883 - ROVER
      ?AUTO_2885 - STORE
      ?AUTO_2886 - WAYPOINT
      ?AUTO_2889 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2884 ?AUTO_2887 ) ( VISIBLE ?AUTO_2888 ?AUTO_2887 ) ( AVAILABLE ?AUTO_2883 ) ( CHANNEL_FREE ?AUTO_2884 ) ( not ( = ?AUTO_2882 ?AUTO_2888 ) ) ( not ( = ?AUTO_2882 ?AUTO_2887 ) ) ( not ( = ?AUTO_2888 ?AUTO_2887 ) ) ( CAN_TRAVERSE ?AUTO_2883 ?AUTO_2882 ?AUTO_2888 ) ( VISIBLE ?AUTO_2882 ?AUTO_2888 ) ( AT_ROCK_SAMPLE ?AUTO_2882 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2883 ) ( STORE_OF ?AUTO_2885 ?AUTO_2883 ) ( CAN_TRAVERSE ?AUTO_2883 ?AUTO_2886 ?AUTO_2882 ) ( VISIBLE ?AUTO_2886 ?AUTO_2882 ) ( not ( = ?AUTO_2882 ?AUTO_2886 ) ) ( not ( = ?AUTO_2887 ?AUTO_2886 ) ) ( not ( = ?AUTO_2888 ?AUTO_2886 ) ) ( FULL ?AUTO_2885 ) ( CAN_TRAVERSE ?AUTO_2883 ?AUTO_2889 ?AUTO_2886 ) ( AT ?AUTO_2883 ?AUTO_2889 ) ( VISIBLE ?AUTO_2889 ?AUTO_2886 ) ( not ( = ?AUTO_2882 ?AUTO_2889 ) ) ( not ( = ?AUTO_2887 ?AUTO_2889 ) ) ( not ( = ?AUTO_2888 ?AUTO_2889 ) ) ( not ( = ?AUTO_2886 ?AUTO_2889 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2883 ?AUTO_2889 ?AUTO_2886 )
      ( GET_ROCK_DATA ?AUTO_2882 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2882 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2891 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2895 - LANDER
      ?AUTO_2896 - WAYPOINT
      ?AUTO_2897 - WAYPOINT
      ?AUTO_2898 - ROVER
      ?AUTO_2894 - STORE
      ?AUTO_2893 - WAYPOINT
      ?AUTO_2892 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2895 ?AUTO_2896 ) ( VISIBLE ?AUTO_2897 ?AUTO_2896 ) ( AVAILABLE ?AUTO_2898 ) ( CHANNEL_FREE ?AUTO_2895 ) ( not ( = ?AUTO_2891 ?AUTO_2897 ) ) ( not ( = ?AUTO_2891 ?AUTO_2896 ) ) ( not ( = ?AUTO_2897 ?AUTO_2896 ) ) ( CAN_TRAVERSE ?AUTO_2898 ?AUTO_2891 ?AUTO_2897 ) ( VISIBLE ?AUTO_2891 ?AUTO_2897 ) ( AT_ROCK_SAMPLE ?AUTO_2891 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2898 ) ( STORE_OF ?AUTO_2894 ?AUTO_2898 ) ( CAN_TRAVERSE ?AUTO_2898 ?AUTO_2893 ?AUTO_2891 ) ( VISIBLE ?AUTO_2893 ?AUTO_2891 ) ( not ( = ?AUTO_2891 ?AUTO_2893 ) ) ( not ( = ?AUTO_2896 ?AUTO_2893 ) ) ( not ( = ?AUTO_2897 ?AUTO_2893 ) ) ( CAN_TRAVERSE ?AUTO_2898 ?AUTO_2892 ?AUTO_2893 ) ( AT ?AUTO_2898 ?AUTO_2892 ) ( VISIBLE ?AUTO_2892 ?AUTO_2893 ) ( not ( = ?AUTO_2891 ?AUTO_2892 ) ) ( not ( = ?AUTO_2896 ?AUTO_2892 ) ) ( not ( = ?AUTO_2897 ?AUTO_2892 ) ) ( not ( = ?AUTO_2893 ?AUTO_2892 ) ) ( AT_ROCK_SAMPLE ?AUTO_2892 ) ( EMPTY ?AUTO_2894 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2898 ?AUTO_2894 ?AUTO_2892 )
      ( GET_ROCK_DATA ?AUTO_2891 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2891 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2902 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2905 - LANDER
      ?AUTO_2909 - WAYPOINT
      ?AUTO_2906 - WAYPOINT
      ?AUTO_2904 - ROVER
      ?AUTO_2903 - STORE
      ?AUTO_2907 - WAYPOINT
      ?AUTO_2908 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2905 ?AUTO_2909 ) ( VISIBLE ?AUTO_2906 ?AUTO_2909 ) ( AVAILABLE ?AUTO_2904 ) ( CHANNEL_FREE ?AUTO_2905 ) ( not ( = ?AUTO_2902 ?AUTO_2906 ) ) ( not ( = ?AUTO_2902 ?AUTO_2909 ) ) ( not ( = ?AUTO_2906 ?AUTO_2909 ) ) ( CAN_TRAVERSE ?AUTO_2904 ?AUTO_2902 ?AUTO_2906 ) ( VISIBLE ?AUTO_2902 ?AUTO_2906 ) ( AT_ROCK_SAMPLE ?AUTO_2902 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2904 ) ( STORE_OF ?AUTO_2903 ?AUTO_2904 ) ( CAN_TRAVERSE ?AUTO_2904 ?AUTO_2907 ?AUTO_2902 ) ( VISIBLE ?AUTO_2907 ?AUTO_2902 ) ( not ( = ?AUTO_2902 ?AUTO_2907 ) ) ( not ( = ?AUTO_2909 ?AUTO_2907 ) ) ( not ( = ?AUTO_2906 ?AUTO_2907 ) ) ( FULL ?AUTO_2903 ) ( CAN_TRAVERSE ?AUTO_2904 ?AUTO_2908 ?AUTO_2907 ) ( VISIBLE ?AUTO_2908 ?AUTO_2907 ) ( not ( = ?AUTO_2902 ?AUTO_2908 ) ) ( not ( = ?AUTO_2909 ?AUTO_2908 ) ) ( not ( = ?AUTO_2906 ?AUTO_2908 ) ) ( not ( = ?AUTO_2907 ?AUTO_2908 ) ) ( CAN_TRAVERSE ?AUTO_2904 ?AUTO_2909 ?AUTO_2908 ) ( AT ?AUTO_2904 ?AUTO_2909 ) ( VISIBLE ?AUTO_2909 ?AUTO_2908 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2904 ?AUTO_2909 ?AUTO_2908 )
      ( GET_ROCK_DATA ?AUTO_2902 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2902 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2910 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2916 - LANDER
      ?AUTO_2912 - WAYPOINT
      ?AUTO_2911 - WAYPOINT
      ?AUTO_2914 - ROVER
      ?AUTO_2915 - STORE
      ?AUTO_2917 - WAYPOINT
      ?AUTO_2913 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2916 ?AUTO_2912 ) ( VISIBLE ?AUTO_2911 ?AUTO_2912 ) ( AVAILABLE ?AUTO_2914 ) ( CHANNEL_FREE ?AUTO_2916 ) ( not ( = ?AUTO_2910 ?AUTO_2911 ) ) ( not ( = ?AUTO_2910 ?AUTO_2912 ) ) ( not ( = ?AUTO_2911 ?AUTO_2912 ) ) ( CAN_TRAVERSE ?AUTO_2914 ?AUTO_2910 ?AUTO_2911 ) ( VISIBLE ?AUTO_2910 ?AUTO_2911 ) ( AT_ROCK_SAMPLE ?AUTO_2910 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2914 ) ( STORE_OF ?AUTO_2915 ?AUTO_2914 ) ( CAN_TRAVERSE ?AUTO_2914 ?AUTO_2917 ?AUTO_2910 ) ( VISIBLE ?AUTO_2917 ?AUTO_2910 ) ( not ( = ?AUTO_2910 ?AUTO_2917 ) ) ( not ( = ?AUTO_2912 ?AUTO_2917 ) ) ( not ( = ?AUTO_2911 ?AUTO_2917 ) ) ( CAN_TRAVERSE ?AUTO_2914 ?AUTO_2913 ?AUTO_2917 ) ( VISIBLE ?AUTO_2913 ?AUTO_2917 ) ( not ( = ?AUTO_2910 ?AUTO_2913 ) ) ( not ( = ?AUTO_2912 ?AUTO_2913 ) ) ( not ( = ?AUTO_2911 ?AUTO_2913 ) ) ( not ( = ?AUTO_2917 ?AUTO_2913 ) ) ( CAN_TRAVERSE ?AUTO_2914 ?AUTO_2912 ?AUTO_2913 ) ( AT ?AUTO_2914 ?AUTO_2912 ) ( VISIBLE ?AUTO_2912 ?AUTO_2913 ) ( AT_ROCK_SAMPLE ?AUTO_2912 ) ( EMPTY ?AUTO_2915 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_2914 ?AUTO_2915 ?AUTO_2912 )
      ( GET_ROCK_DATA ?AUTO_2910 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2910 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_2920 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2921 - LANDER
      ?AUTO_2924 - WAYPOINT
      ?AUTO_2925 - WAYPOINT
      ?AUTO_2923 - ROVER
      ?AUTO_2927 - STORE
      ?AUTO_2922 - WAYPOINT
      ?AUTO_2926 - WAYPOINT
      ?AUTO_2928 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2921 ?AUTO_2924 ) ( VISIBLE ?AUTO_2925 ?AUTO_2924 ) ( AVAILABLE ?AUTO_2923 ) ( CHANNEL_FREE ?AUTO_2921 ) ( not ( = ?AUTO_2920 ?AUTO_2925 ) ) ( not ( = ?AUTO_2920 ?AUTO_2924 ) ) ( not ( = ?AUTO_2925 ?AUTO_2924 ) ) ( CAN_TRAVERSE ?AUTO_2923 ?AUTO_2920 ?AUTO_2925 ) ( VISIBLE ?AUTO_2920 ?AUTO_2925 ) ( AT_ROCK_SAMPLE ?AUTO_2920 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_2923 ) ( STORE_OF ?AUTO_2927 ?AUTO_2923 ) ( CAN_TRAVERSE ?AUTO_2923 ?AUTO_2922 ?AUTO_2920 ) ( VISIBLE ?AUTO_2922 ?AUTO_2920 ) ( not ( = ?AUTO_2920 ?AUTO_2922 ) ) ( not ( = ?AUTO_2924 ?AUTO_2922 ) ) ( not ( = ?AUTO_2925 ?AUTO_2922 ) ) ( CAN_TRAVERSE ?AUTO_2923 ?AUTO_2926 ?AUTO_2922 ) ( VISIBLE ?AUTO_2926 ?AUTO_2922 ) ( not ( = ?AUTO_2920 ?AUTO_2926 ) ) ( not ( = ?AUTO_2924 ?AUTO_2926 ) ) ( not ( = ?AUTO_2925 ?AUTO_2926 ) ) ( not ( = ?AUTO_2922 ?AUTO_2926 ) ) ( CAN_TRAVERSE ?AUTO_2923 ?AUTO_2924 ?AUTO_2926 ) ( VISIBLE ?AUTO_2924 ?AUTO_2926 ) ( AT_ROCK_SAMPLE ?AUTO_2924 ) ( EMPTY ?AUTO_2927 ) ( CAN_TRAVERSE ?AUTO_2923 ?AUTO_2928 ?AUTO_2924 ) ( AT ?AUTO_2923 ?AUTO_2928 ) ( VISIBLE ?AUTO_2928 ?AUTO_2924 ) ( not ( = ?AUTO_2920 ?AUTO_2928 ) ) ( not ( = ?AUTO_2924 ?AUTO_2928 ) ) ( not ( = ?AUTO_2925 ?AUTO_2928 ) ) ( not ( = ?AUTO_2922 ?AUTO_2928 ) ) ( not ( = ?AUTO_2926 ?AUTO_2928 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2923 ?AUTO_2928 ?AUTO_2924 )
      ( GET_ROCK_DATA ?AUTO_2920 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_2920 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2983 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2985 - LANDER
      ?AUTO_2986 - WAYPOINT
      ?AUTO_2984 - ROVER
      ?AUTO_2987 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2985 ?AUTO_2986 ) ( VISIBLE ?AUTO_2983 ?AUTO_2986 ) ( AVAILABLE ?AUTO_2984 ) ( CHANNEL_FREE ?AUTO_2985 ) ( not ( = ?AUTO_2983 ?AUTO_2986 ) ) ( AT_SOIL_SAMPLE ?AUTO_2983 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2984 ) ( STORE_OF ?AUTO_2987 ?AUTO_2984 ) ( FULL ?AUTO_2987 ) ( CAN_TRAVERSE ?AUTO_2984 ?AUTO_2986 ?AUTO_2983 ) ( AT ?AUTO_2984 ?AUTO_2986 ) ( VISIBLE ?AUTO_2986 ?AUTO_2983 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2984 ?AUTO_2986 ?AUTO_2983 )
      ( GET_SOIL_DATA ?AUTO_2983 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2983 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2988 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2990 - LANDER
      ?AUTO_2991 - WAYPOINT
      ?AUTO_2992 - ROVER
      ?AUTO_2989 - STORE
      ?AUTO_2993 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2990 ?AUTO_2991 ) ( VISIBLE ?AUTO_2988 ?AUTO_2991 ) ( AVAILABLE ?AUTO_2992 ) ( CHANNEL_FREE ?AUTO_2990 ) ( not ( = ?AUTO_2988 ?AUTO_2991 ) ) ( AT_SOIL_SAMPLE ?AUTO_2988 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2992 ) ( STORE_OF ?AUTO_2989 ?AUTO_2992 ) ( FULL ?AUTO_2989 ) ( CAN_TRAVERSE ?AUTO_2992 ?AUTO_2991 ?AUTO_2988 ) ( VISIBLE ?AUTO_2991 ?AUTO_2988 ) ( CAN_TRAVERSE ?AUTO_2992 ?AUTO_2993 ?AUTO_2991 ) ( AT ?AUTO_2992 ?AUTO_2993 ) ( VISIBLE ?AUTO_2993 ?AUTO_2991 ) ( not ( = ?AUTO_2988 ?AUTO_2993 ) ) ( not ( = ?AUTO_2991 ?AUTO_2993 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_2992 ?AUTO_2993 ?AUTO_2991 )
      ( GET_SOIL_DATA ?AUTO_2988 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2988 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_2995 - WAYPOINT
    )
    :vars
    (
      ?AUTO_2999 - LANDER
      ?AUTO_2998 - WAYPOINT
      ?AUTO_2997 - ROVER
      ?AUTO_3000 - STORE
      ?AUTO_2996 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_2999 ?AUTO_2998 ) ( VISIBLE ?AUTO_2995 ?AUTO_2998 ) ( AVAILABLE ?AUTO_2997 ) ( CHANNEL_FREE ?AUTO_2999 ) ( not ( = ?AUTO_2995 ?AUTO_2998 ) ) ( AT_SOIL_SAMPLE ?AUTO_2995 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_2997 ) ( STORE_OF ?AUTO_3000 ?AUTO_2997 ) ( CAN_TRAVERSE ?AUTO_2997 ?AUTO_2998 ?AUTO_2995 ) ( VISIBLE ?AUTO_2998 ?AUTO_2995 ) ( CAN_TRAVERSE ?AUTO_2997 ?AUTO_2996 ?AUTO_2998 ) ( AT ?AUTO_2997 ?AUTO_2996 ) ( VISIBLE ?AUTO_2996 ?AUTO_2998 ) ( not ( = ?AUTO_2995 ?AUTO_2996 ) ) ( not ( = ?AUTO_2998 ?AUTO_2996 ) ) ( AT_SOIL_SAMPLE ?AUTO_2996 ) ( EMPTY ?AUTO_3000 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_2997 ?AUTO_3000 ?AUTO_2996 )
      ( GET_SOIL_DATA ?AUTO_2995 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_2995 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3071 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3074 - LANDER
      ?AUTO_3072 - WAYPOINT
      ?AUTO_3076 - ROVER
      ?AUTO_3073 - STORE
      ?AUTO_3075 - WAYPOINT
      ?AUTO_3077 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3074 ?AUTO_3072 ) ( VISIBLE ?AUTO_3071 ?AUTO_3072 ) ( AVAILABLE ?AUTO_3076 ) ( CHANNEL_FREE ?AUTO_3074 ) ( not ( = ?AUTO_3071 ?AUTO_3072 ) ) ( AT_SOIL_SAMPLE ?AUTO_3071 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3076 ) ( STORE_OF ?AUTO_3073 ?AUTO_3076 ) ( FULL ?AUTO_3073 ) ( CAN_TRAVERSE ?AUTO_3076 ?AUTO_3075 ?AUTO_3071 ) ( VISIBLE ?AUTO_3075 ?AUTO_3071 ) ( not ( = ?AUTO_3071 ?AUTO_3075 ) ) ( not ( = ?AUTO_3072 ?AUTO_3075 ) ) ( CAN_TRAVERSE ?AUTO_3076 ?AUTO_3077 ?AUTO_3075 ) ( AT ?AUTO_3076 ?AUTO_3077 ) ( VISIBLE ?AUTO_3077 ?AUTO_3075 ) ( not ( = ?AUTO_3071 ?AUTO_3077 ) ) ( not ( = ?AUTO_3072 ?AUTO_3077 ) ) ( not ( = ?AUTO_3075 ?AUTO_3077 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3076 ?AUTO_3077 ?AUTO_3075 )
      ( GET_SOIL_DATA ?AUTO_3071 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3071 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3079 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3080 - LANDER
      ?AUTO_3084 - WAYPOINT
      ?AUTO_3085 - ROVER
      ?AUTO_3081 - STORE
      ?AUTO_3083 - WAYPOINT
      ?AUTO_3082 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3080 ?AUTO_3084 ) ( VISIBLE ?AUTO_3079 ?AUTO_3084 ) ( AVAILABLE ?AUTO_3085 ) ( CHANNEL_FREE ?AUTO_3080 ) ( not ( = ?AUTO_3079 ?AUTO_3084 ) ) ( AT_SOIL_SAMPLE ?AUTO_3079 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3085 ) ( STORE_OF ?AUTO_3081 ?AUTO_3085 ) ( CAN_TRAVERSE ?AUTO_3085 ?AUTO_3083 ?AUTO_3079 ) ( VISIBLE ?AUTO_3083 ?AUTO_3079 ) ( not ( = ?AUTO_3079 ?AUTO_3083 ) ) ( not ( = ?AUTO_3084 ?AUTO_3083 ) ) ( CAN_TRAVERSE ?AUTO_3085 ?AUTO_3082 ?AUTO_3083 ) ( AT ?AUTO_3085 ?AUTO_3082 ) ( VISIBLE ?AUTO_3082 ?AUTO_3083 ) ( not ( = ?AUTO_3079 ?AUTO_3082 ) ) ( not ( = ?AUTO_3084 ?AUTO_3082 ) ) ( not ( = ?AUTO_3083 ?AUTO_3082 ) ) ( AT_SOIL_SAMPLE ?AUTO_3082 ) ( EMPTY ?AUTO_3081 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_3085 ?AUTO_3081 ?AUTO_3082 )
      ( GET_SOIL_DATA ?AUTO_3079 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3079 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3148 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3150 - LANDER
      ?AUTO_3153 - WAYPOINT
      ?AUTO_3149 - ROVER
      ?AUTO_3152 - STORE
      ?AUTO_3151 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3150 ?AUTO_3153 ) ( VISIBLE ?AUTO_3148 ?AUTO_3153 ) ( AVAILABLE ?AUTO_3149 ) ( CHANNEL_FREE ?AUTO_3150 ) ( not ( = ?AUTO_3148 ?AUTO_3153 ) ) ( AT_SOIL_SAMPLE ?AUTO_3148 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3149 ) ( STORE_OF ?AUTO_3152 ?AUTO_3149 ) ( CAN_TRAVERSE ?AUTO_3149 ?AUTO_3151 ?AUTO_3148 ) ( AT ?AUTO_3149 ?AUTO_3151 ) ( VISIBLE ?AUTO_3151 ?AUTO_3148 ) ( not ( = ?AUTO_3148 ?AUTO_3151 ) ) ( not ( = ?AUTO_3153 ?AUTO_3151 ) ) ( FULL ?AUTO_3152 ) )
    :subtasks
    ( ( !DROP ?AUTO_3149 ?AUTO_3152 )
      ( GET_SOIL_DATA ?AUTO_3148 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3148 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3184 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3188 - LANDER
      ?AUTO_3187 - WAYPOINT
      ?AUTO_3185 - ROVER
      ?AUTO_3186 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3188 ?AUTO_3184 ) ( VISIBLE ?AUTO_3187 ?AUTO_3184 ) ( AVAILABLE ?AUTO_3185 ) ( CHANNEL_FREE ?AUTO_3188 ) ( not ( = ?AUTO_3184 ?AUTO_3187 ) ) ( CAN_TRAVERSE ?AUTO_3185 ?AUTO_3184 ?AUTO_3187 ) ( VISIBLE ?AUTO_3184 ?AUTO_3187 ) ( AT_ROCK_SAMPLE ?AUTO_3184 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3185 ) ( STORE_OF ?AUTO_3186 ?AUTO_3185 ) ( CAN_TRAVERSE ?AUTO_3185 ?AUTO_3187 ?AUTO_3184 ) ( AT ?AUTO_3185 ?AUTO_3187 ) ( FULL ?AUTO_3186 ) )
    :subtasks
    ( ( !DROP ?AUTO_3185 ?AUTO_3186 )
      ( GET_ROCK_DATA ?AUTO_3184 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3184 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3189 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3191 - LANDER
      ?AUTO_3192 - WAYPOINT
      ?AUTO_3193 - ROVER
      ?AUTO_3190 - STORE
      ?AUTO_3194 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3191 ?AUTO_3189 ) ( VISIBLE ?AUTO_3192 ?AUTO_3189 ) ( AVAILABLE ?AUTO_3193 ) ( CHANNEL_FREE ?AUTO_3191 ) ( not ( = ?AUTO_3189 ?AUTO_3192 ) ) ( CAN_TRAVERSE ?AUTO_3193 ?AUTO_3189 ?AUTO_3192 ) ( VISIBLE ?AUTO_3189 ?AUTO_3192 ) ( AT_ROCK_SAMPLE ?AUTO_3189 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3193 ) ( STORE_OF ?AUTO_3190 ?AUTO_3193 ) ( CAN_TRAVERSE ?AUTO_3193 ?AUTO_3192 ?AUTO_3189 ) ( FULL ?AUTO_3190 ) ( CAN_TRAVERSE ?AUTO_3193 ?AUTO_3194 ?AUTO_3192 ) ( AT ?AUTO_3193 ?AUTO_3194 ) ( VISIBLE ?AUTO_3194 ?AUTO_3192 ) ( not ( = ?AUTO_3189 ?AUTO_3194 ) ) ( not ( = ?AUTO_3192 ?AUTO_3194 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3193 ?AUTO_3194 ?AUTO_3192 )
      ( GET_ROCK_DATA ?AUTO_3189 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3189 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3196 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3200 - LANDER
      ?AUTO_3197 - WAYPOINT
      ?AUTO_3201 - ROVER
      ?AUTO_3199 - STORE
      ?AUTO_3198 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3200 ?AUTO_3196 ) ( VISIBLE ?AUTO_3197 ?AUTO_3196 ) ( AVAILABLE ?AUTO_3201 ) ( CHANNEL_FREE ?AUTO_3200 ) ( not ( = ?AUTO_3196 ?AUTO_3197 ) ) ( CAN_TRAVERSE ?AUTO_3201 ?AUTO_3196 ?AUTO_3197 ) ( VISIBLE ?AUTO_3196 ?AUTO_3197 ) ( AT_ROCK_SAMPLE ?AUTO_3196 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3201 ) ( STORE_OF ?AUTO_3199 ?AUTO_3201 ) ( CAN_TRAVERSE ?AUTO_3201 ?AUTO_3197 ?AUTO_3196 ) ( CAN_TRAVERSE ?AUTO_3201 ?AUTO_3198 ?AUTO_3197 ) ( AT ?AUTO_3201 ?AUTO_3198 ) ( VISIBLE ?AUTO_3198 ?AUTO_3197 ) ( not ( = ?AUTO_3196 ?AUTO_3198 ) ) ( not ( = ?AUTO_3197 ?AUTO_3198 ) ) ( AT_SOIL_SAMPLE ?AUTO_3198 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3201 ) ( EMPTY ?AUTO_3199 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_3201 ?AUTO_3199 ?AUTO_3198 )
      ( GET_ROCK_DATA ?AUTO_3196 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3196 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3217 - OBJECTIVE
      ?AUTO_3218 - MODE
    )
    :vars
    (
      ?AUTO_3223 - LANDER
      ?AUTO_3220 - WAYPOINT
      ?AUTO_3221 - ROVER
      ?AUTO_3222 - WAYPOINT
      ?AUTO_3219 - WAYPOINT
      ?AUTO_3224 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3223 ?AUTO_3220 ) ( HAVE_IMAGE ?AUTO_3221 ?AUTO_3217 ?AUTO_3218 ) ( VISIBLE ?AUTO_3222 ?AUTO_3220 ) ( AVAILABLE ?AUTO_3221 ) ( CHANNEL_FREE ?AUTO_3223 ) ( not ( = ?AUTO_3222 ?AUTO_3220 ) ) ( CAN_TRAVERSE ?AUTO_3221 ?AUTO_3219 ?AUTO_3222 ) ( VISIBLE ?AUTO_3219 ?AUTO_3222 ) ( not ( = ?AUTO_3220 ?AUTO_3219 ) ) ( not ( = ?AUTO_3222 ?AUTO_3219 ) ) ( CAN_TRAVERSE ?AUTO_3221 ?AUTO_3224 ?AUTO_3219 ) ( AT ?AUTO_3221 ?AUTO_3224 ) ( VISIBLE ?AUTO_3224 ?AUTO_3219 ) ( not ( = ?AUTO_3220 ?AUTO_3224 ) ) ( not ( = ?AUTO_3222 ?AUTO_3224 ) ) ( not ( = ?AUTO_3219 ?AUTO_3224 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3221 ?AUTO_3224 ?AUTO_3219 )
      ( GET_IMAGE_DATA ?AUTO_3217 ?AUTO_3218 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3217 ?AUTO_3218 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3225 - OBJECTIVE
      ?AUTO_3226 - MODE
    )
    :vars
    (
      ?AUTO_3232 - LANDER
      ?AUTO_3229 - WAYPOINT
      ?AUTO_3231 - WAYPOINT
      ?AUTO_3230 - ROVER
      ?AUTO_3228 - WAYPOINT
      ?AUTO_3227 - WAYPOINT
      ?AUTO_3233 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3232 ?AUTO_3229 ) ( VISIBLE ?AUTO_3231 ?AUTO_3229 ) ( AVAILABLE ?AUTO_3230 ) ( CHANNEL_FREE ?AUTO_3232 ) ( not ( = ?AUTO_3231 ?AUTO_3229 ) ) ( CAN_TRAVERSE ?AUTO_3230 ?AUTO_3228 ?AUTO_3231 ) ( VISIBLE ?AUTO_3228 ?AUTO_3231 ) ( not ( = ?AUTO_3229 ?AUTO_3228 ) ) ( not ( = ?AUTO_3231 ?AUTO_3228 ) ) ( CAN_TRAVERSE ?AUTO_3230 ?AUTO_3227 ?AUTO_3228 ) ( AT ?AUTO_3230 ?AUTO_3227 ) ( VISIBLE ?AUTO_3227 ?AUTO_3228 ) ( not ( = ?AUTO_3229 ?AUTO_3227 ) ) ( not ( = ?AUTO_3231 ?AUTO_3227 ) ) ( not ( = ?AUTO_3228 ?AUTO_3227 ) ) ( CALIBRATED ?AUTO_3233 ?AUTO_3230 ) ( ON_BOARD ?AUTO_3233 ?AUTO_3230 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3230 ) ( SUPPORTS ?AUTO_3233 ?AUTO_3226 ) ( VISIBLE_FROM ?AUTO_3225 ?AUTO_3227 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_3230 ?AUTO_3227 ?AUTO_3225 ?AUTO_3233 ?AUTO_3226 )
      ( GET_IMAGE_DATA ?AUTO_3225 ?AUTO_3226 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3225 ?AUTO_3226 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3234 - OBJECTIVE
      ?AUTO_3235 - MODE
    )
    :vars
    (
      ?AUTO_3237 - LANDER
      ?AUTO_3238 - WAYPOINT
      ?AUTO_3239 - WAYPOINT
      ?AUTO_3241 - ROVER
      ?AUTO_3236 - WAYPOINT
      ?AUTO_3240 - WAYPOINT
      ?AUTO_3242 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3237 ?AUTO_3238 ) ( VISIBLE ?AUTO_3239 ?AUTO_3238 ) ( AVAILABLE ?AUTO_3241 ) ( CHANNEL_FREE ?AUTO_3237 ) ( not ( = ?AUTO_3239 ?AUTO_3238 ) ) ( CAN_TRAVERSE ?AUTO_3241 ?AUTO_3236 ?AUTO_3239 ) ( VISIBLE ?AUTO_3236 ?AUTO_3239 ) ( not ( = ?AUTO_3238 ?AUTO_3236 ) ) ( not ( = ?AUTO_3239 ?AUTO_3236 ) ) ( CAN_TRAVERSE ?AUTO_3241 ?AUTO_3240 ?AUTO_3236 ) ( AT ?AUTO_3241 ?AUTO_3240 ) ( VISIBLE ?AUTO_3240 ?AUTO_3236 ) ( not ( = ?AUTO_3238 ?AUTO_3240 ) ) ( not ( = ?AUTO_3239 ?AUTO_3240 ) ) ( not ( = ?AUTO_3236 ?AUTO_3240 ) ) ( ON_BOARD ?AUTO_3242 ?AUTO_3241 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3241 ) ( SUPPORTS ?AUTO_3242 ?AUTO_3235 ) ( VISIBLE_FROM ?AUTO_3234 ?AUTO_3240 ) ( CALIBRATION_TARGET ?AUTO_3242 ?AUTO_3234 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3241 ?AUTO_3242 ?AUTO_3234 ?AUTO_3240 )
      ( GET_IMAGE_DATA ?AUTO_3234 ?AUTO_3235 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3234 ?AUTO_3235 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3266 - OBJECTIVE
      ?AUTO_3267 - MODE
    )
    :vars
    (
      ?AUTO_3270 - LANDER
      ?AUTO_3269 - WAYPOINT
      ?AUTO_3271 - WAYPOINT
      ?AUTO_3272 - ROVER
      ?AUTO_3268 - WAYPOINT
      ?AUTO_3273 - CAMERA
      ?AUTO_3274 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3270 ?AUTO_3269 ) ( VISIBLE ?AUTO_3271 ?AUTO_3269 ) ( AVAILABLE ?AUTO_3272 ) ( CHANNEL_FREE ?AUTO_3270 ) ( not ( = ?AUTO_3271 ?AUTO_3269 ) ) ( CAN_TRAVERSE ?AUTO_3272 ?AUTO_3268 ?AUTO_3271 ) ( VISIBLE ?AUTO_3268 ?AUTO_3271 ) ( not ( = ?AUTO_3269 ?AUTO_3268 ) ) ( not ( = ?AUTO_3271 ?AUTO_3268 ) ) ( CALIBRATED ?AUTO_3273 ?AUTO_3272 ) ( ON_BOARD ?AUTO_3273 ?AUTO_3272 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3272 ) ( SUPPORTS ?AUTO_3273 ?AUTO_3267 ) ( VISIBLE_FROM ?AUTO_3266 ?AUTO_3268 ) ( CAN_TRAVERSE ?AUTO_3272 ?AUTO_3274 ?AUTO_3268 ) ( AT ?AUTO_3272 ?AUTO_3274 ) ( VISIBLE ?AUTO_3274 ?AUTO_3268 ) ( not ( = ?AUTO_3269 ?AUTO_3274 ) ) ( not ( = ?AUTO_3271 ?AUTO_3274 ) ) ( not ( = ?AUTO_3268 ?AUTO_3274 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3272 ?AUTO_3274 ?AUTO_3268 )
      ( GET_IMAGE_DATA ?AUTO_3266 ?AUTO_3267 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3266 ?AUTO_3267 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3275 - OBJECTIVE
      ?AUTO_3276 - MODE
    )
    :vars
    (
      ?AUTO_3277 - LANDER
      ?AUTO_3281 - WAYPOINT
      ?AUTO_3278 - WAYPOINT
      ?AUTO_3282 - ROVER
      ?AUTO_3280 - WAYPOINT
      ?AUTO_3283 - CAMERA
      ?AUTO_3279 - WAYPOINT
      ?AUTO_3284 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3277 ?AUTO_3281 ) ( VISIBLE ?AUTO_3278 ?AUTO_3281 ) ( AVAILABLE ?AUTO_3282 ) ( CHANNEL_FREE ?AUTO_3277 ) ( not ( = ?AUTO_3278 ?AUTO_3281 ) ) ( CAN_TRAVERSE ?AUTO_3282 ?AUTO_3280 ?AUTO_3278 ) ( VISIBLE ?AUTO_3280 ?AUTO_3278 ) ( not ( = ?AUTO_3281 ?AUTO_3280 ) ) ( not ( = ?AUTO_3278 ?AUTO_3280 ) ) ( ON_BOARD ?AUTO_3283 ?AUTO_3282 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3282 ) ( SUPPORTS ?AUTO_3283 ?AUTO_3276 ) ( VISIBLE_FROM ?AUTO_3275 ?AUTO_3280 ) ( CAN_TRAVERSE ?AUTO_3282 ?AUTO_3279 ?AUTO_3280 ) ( AT ?AUTO_3282 ?AUTO_3279 ) ( VISIBLE ?AUTO_3279 ?AUTO_3280 ) ( not ( = ?AUTO_3281 ?AUTO_3279 ) ) ( not ( = ?AUTO_3278 ?AUTO_3279 ) ) ( not ( = ?AUTO_3280 ?AUTO_3279 ) ) ( CALIBRATION_TARGET ?AUTO_3283 ?AUTO_3284 ) ( VISIBLE_FROM ?AUTO_3284 ?AUTO_3279 ) ( not ( = ?AUTO_3275 ?AUTO_3284 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3282 ?AUTO_3283 ?AUTO_3284 ?AUTO_3279 )
      ( GET_IMAGE_DATA ?AUTO_3275 ?AUTO_3276 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3275 ?AUTO_3276 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3285 - OBJECTIVE
      ?AUTO_3286 - MODE
    )
    :vars
    (
      ?AUTO_3288 - LANDER
      ?AUTO_3294 - WAYPOINT
      ?AUTO_3289 - WAYPOINT
      ?AUTO_3287 - ROVER
      ?AUTO_3293 - WAYPOINT
      ?AUTO_3290 - CAMERA
      ?AUTO_3292 - WAYPOINT
      ?AUTO_3291 - OBJECTIVE
      ?AUTO_3295 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3288 ?AUTO_3294 ) ( VISIBLE ?AUTO_3289 ?AUTO_3294 ) ( AVAILABLE ?AUTO_3287 ) ( CHANNEL_FREE ?AUTO_3288 ) ( not ( = ?AUTO_3289 ?AUTO_3294 ) ) ( CAN_TRAVERSE ?AUTO_3287 ?AUTO_3293 ?AUTO_3289 ) ( VISIBLE ?AUTO_3293 ?AUTO_3289 ) ( not ( = ?AUTO_3294 ?AUTO_3293 ) ) ( not ( = ?AUTO_3289 ?AUTO_3293 ) ) ( ON_BOARD ?AUTO_3290 ?AUTO_3287 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3287 ) ( SUPPORTS ?AUTO_3290 ?AUTO_3286 ) ( VISIBLE_FROM ?AUTO_3285 ?AUTO_3293 ) ( CAN_TRAVERSE ?AUTO_3287 ?AUTO_3292 ?AUTO_3293 ) ( VISIBLE ?AUTO_3292 ?AUTO_3293 ) ( not ( = ?AUTO_3294 ?AUTO_3292 ) ) ( not ( = ?AUTO_3289 ?AUTO_3292 ) ) ( not ( = ?AUTO_3293 ?AUTO_3292 ) ) ( CALIBRATION_TARGET ?AUTO_3290 ?AUTO_3291 ) ( VISIBLE_FROM ?AUTO_3291 ?AUTO_3292 ) ( not ( = ?AUTO_3285 ?AUTO_3291 ) ) ( CAN_TRAVERSE ?AUTO_3287 ?AUTO_3295 ?AUTO_3292 ) ( AT ?AUTO_3287 ?AUTO_3295 ) ( VISIBLE ?AUTO_3295 ?AUTO_3292 ) ( not ( = ?AUTO_3294 ?AUTO_3295 ) ) ( not ( = ?AUTO_3289 ?AUTO_3295 ) ) ( not ( = ?AUTO_3293 ?AUTO_3295 ) ) ( not ( = ?AUTO_3292 ?AUTO_3295 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3287 ?AUTO_3295 ?AUTO_3292 )
      ( GET_IMAGE_DATA ?AUTO_3285 ?AUTO_3286 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3285 ?AUTO_3286 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3408 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3411 - LANDER
      ?AUTO_3410 - WAYPOINT
      ?AUTO_3409 - ROVER
      ?AUTO_3412 - STORE
      ?AUTO_3414 - WAYPOINT
      ?AUTO_3413 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3411 ?AUTO_3408 ) ( VISIBLE ?AUTO_3410 ?AUTO_3408 ) ( AVAILABLE ?AUTO_3409 ) ( CHANNEL_FREE ?AUTO_3411 ) ( not ( = ?AUTO_3408 ?AUTO_3410 ) ) ( CAN_TRAVERSE ?AUTO_3409 ?AUTO_3408 ?AUTO_3410 ) ( VISIBLE ?AUTO_3408 ?AUTO_3410 ) ( AT_ROCK_SAMPLE ?AUTO_3408 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3409 ) ( STORE_OF ?AUTO_3412 ?AUTO_3409 ) ( CAN_TRAVERSE ?AUTO_3409 ?AUTO_3414 ?AUTO_3408 ) ( VISIBLE ?AUTO_3414 ?AUTO_3408 ) ( not ( = ?AUTO_3408 ?AUTO_3414 ) ) ( not ( = ?AUTO_3410 ?AUTO_3414 ) ) ( CAN_TRAVERSE ?AUTO_3409 ?AUTO_3413 ?AUTO_3414 ) ( AT ?AUTO_3409 ?AUTO_3413 ) ( VISIBLE ?AUTO_3413 ?AUTO_3414 ) ( not ( = ?AUTO_3408 ?AUTO_3413 ) ) ( not ( = ?AUTO_3410 ?AUTO_3413 ) ) ( not ( = ?AUTO_3414 ?AUTO_3413 ) ) ( AT_SOIL_SAMPLE ?AUTO_3413 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3409 ) ( EMPTY ?AUTO_3412 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_3409 ?AUTO_3412 ?AUTO_3413 )
      ( GET_ROCK_DATA ?AUTO_3408 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3408 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3431 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3438 - LANDER
      ?AUTO_3432 - WAYPOINT
      ?AUTO_3435 - ROVER
      ?AUTO_3436 - STORE
      ?AUTO_3437 - WAYPOINT
      ?AUTO_3433 - WAYPOINT
      ?AUTO_3434 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3438 ?AUTO_3431 ) ( VISIBLE ?AUTO_3432 ?AUTO_3431 ) ( AVAILABLE ?AUTO_3435 ) ( CHANNEL_FREE ?AUTO_3438 ) ( not ( = ?AUTO_3431 ?AUTO_3432 ) ) ( CAN_TRAVERSE ?AUTO_3435 ?AUTO_3431 ?AUTO_3432 ) ( VISIBLE ?AUTO_3431 ?AUTO_3432 ) ( AT_ROCK_SAMPLE ?AUTO_3431 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3435 ) ( STORE_OF ?AUTO_3436 ?AUTO_3435 ) ( CAN_TRAVERSE ?AUTO_3435 ?AUTO_3437 ?AUTO_3431 ) ( VISIBLE ?AUTO_3437 ?AUTO_3431 ) ( not ( = ?AUTO_3431 ?AUTO_3437 ) ) ( not ( = ?AUTO_3432 ?AUTO_3437 ) ) ( CAN_TRAVERSE ?AUTO_3435 ?AUTO_3433 ?AUTO_3437 ) ( VISIBLE ?AUTO_3433 ?AUTO_3437 ) ( not ( = ?AUTO_3431 ?AUTO_3433 ) ) ( not ( = ?AUTO_3432 ?AUTO_3433 ) ) ( not ( = ?AUTO_3437 ?AUTO_3433 ) ) ( AT_SOIL_SAMPLE ?AUTO_3433 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3435 ) ( EMPTY ?AUTO_3436 ) ( CAN_TRAVERSE ?AUTO_3435 ?AUTO_3434 ?AUTO_3433 ) ( VISIBLE ?AUTO_3434 ?AUTO_3433 ) ( not ( = ?AUTO_3431 ?AUTO_3434 ) ) ( not ( = ?AUTO_3432 ?AUTO_3434 ) ) ( not ( = ?AUTO_3437 ?AUTO_3434 ) ) ( not ( = ?AUTO_3433 ?AUTO_3434 ) ) ( CAN_TRAVERSE ?AUTO_3435 ?AUTO_3432 ?AUTO_3434 ) ( AT ?AUTO_3435 ?AUTO_3432 ) ( VISIBLE ?AUTO_3432 ?AUTO_3434 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3435 ?AUTO_3432 ?AUTO_3434 )
      ( GET_ROCK_DATA ?AUTO_3431 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3431 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3467 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3469 - LANDER
      ?AUTO_3470 - WAYPOINT
      ?AUTO_3472 - ROVER
      ?AUTO_3468 - STORE
      ?AUTO_3471 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3469 ?AUTO_3470 ) ( VISIBLE ?AUTO_3467 ?AUTO_3470 ) ( AVAILABLE ?AUTO_3472 ) ( CHANNEL_FREE ?AUTO_3469 ) ( not ( = ?AUTO_3467 ?AUTO_3470 ) ) ( AT_SOIL_SAMPLE ?AUTO_3467 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3472 ) ( STORE_OF ?AUTO_3468 ?AUTO_3472 ) ( CAN_TRAVERSE ?AUTO_3472 ?AUTO_3470 ?AUTO_3467 ) ( VISIBLE ?AUTO_3470 ?AUTO_3467 ) ( CAN_TRAVERSE ?AUTO_3472 ?AUTO_3471 ?AUTO_3470 ) ( AT ?AUTO_3472 ?AUTO_3471 ) ( VISIBLE ?AUTO_3471 ?AUTO_3470 ) ( not ( = ?AUTO_3467 ?AUTO_3471 ) ) ( not ( = ?AUTO_3470 ?AUTO_3471 ) ) ( FULL ?AUTO_3468 ) )
    :subtasks
    ( ( !DROP ?AUTO_3472 ?AUTO_3468 )
      ( GET_SOIL_DATA ?AUTO_3467 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3467 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3474 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3476 - LANDER
      ?AUTO_3477 - WAYPOINT
      ?AUTO_3478 - ROVER
      ?AUTO_3479 - STORE
      ?AUTO_3475 - WAYPOINT
      ?AUTO_3480 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3476 ?AUTO_3477 ) ( VISIBLE ?AUTO_3474 ?AUTO_3477 ) ( AVAILABLE ?AUTO_3478 ) ( CHANNEL_FREE ?AUTO_3476 ) ( not ( = ?AUTO_3474 ?AUTO_3477 ) ) ( AT_SOIL_SAMPLE ?AUTO_3474 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3478 ) ( STORE_OF ?AUTO_3479 ?AUTO_3478 ) ( CAN_TRAVERSE ?AUTO_3478 ?AUTO_3477 ?AUTO_3474 ) ( VISIBLE ?AUTO_3477 ?AUTO_3474 ) ( CAN_TRAVERSE ?AUTO_3478 ?AUTO_3475 ?AUTO_3477 ) ( VISIBLE ?AUTO_3475 ?AUTO_3477 ) ( not ( = ?AUTO_3474 ?AUTO_3475 ) ) ( not ( = ?AUTO_3477 ?AUTO_3475 ) ) ( FULL ?AUTO_3479 ) ( CAN_TRAVERSE ?AUTO_3478 ?AUTO_3480 ?AUTO_3475 ) ( AT ?AUTO_3478 ?AUTO_3480 ) ( VISIBLE ?AUTO_3480 ?AUTO_3475 ) ( not ( = ?AUTO_3474 ?AUTO_3480 ) ) ( not ( = ?AUTO_3477 ?AUTO_3480 ) ) ( not ( = ?AUTO_3475 ?AUTO_3480 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3478 ?AUTO_3480 ?AUTO_3475 )
      ( GET_SOIL_DATA ?AUTO_3474 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3474 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3481 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3486 - LANDER
      ?AUTO_3482 - WAYPOINT
      ?AUTO_3487 - ROVER
      ?AUTO_3485 - STORE
      ?AUTO_3483 - WAYPOINT
      ?AUTO_3484 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3486 ?AUTO_3482 ) ( VISIBLE ?AUTO_3481 ?AUTO_3482 ) ( AVAILABLE ?AUTO_3487 ) ( CHANNEL_FREE ?AUTO_3486 ) ( not ( = ?AUTO_3481 ?AUTO_3482 ) ) ( AT_SOIL_SAMPLE ?AUTO_3481 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3487 ) ( STORE_OF ?AUTO_3485 ?AUTO_3487 ) ( CAN_TRAVERSE ?AUTO_3487 ?AUTO_3482 ?AUTO_3481 ) ( VISIBLE ?AUTO_3482 ?AUTO_3481 ) ( CAN_TRAVERSE ?AUTO_3487 ?AUTO_3483 ?AUTO_3482 ) ( VISIBLE ?AUTO_3483 ?AUTO_3482 ) ( not ( = ?AUTO_3481 ?AUTO_3483 ) ) ( not ( = ?AUTO_3482 ?AUTO_3483 ) ) ( CAN_TRAVERSE ?AUTO_3487 ?AUTO_3484 ?AUTO_3483 ) ( AT ?AUTO_3487 ?AUTO_3484 ) ( VISIBLE ?AUTO_3484 ?AUTO_3483 ) ( not ( = ?AUTO_3481 ?AUTO_3484 ) ) ( not ( = ?AUTO_3482 ?AUTO_3484 ) ) ( not ( = ?AUTO_3483 ?AUTO_3484 ) ) ( AT_SOIL_SAMPLE ?AUTO_3484 ) ( EMPTY ?AUTO_3485 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_3487 ?AUTO_3485 ?AUTO_3484 )
      ( GET_SOIL_DATA ?AUTO_3481 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3481 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3579 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3584 - LANDER
      ?AUTO_3582 - WAYPOINT
      ?AUTO_3581 - ROVER
      ?AUTO_3583 - WAYPOINT
      ?AUTO_3580 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3584 ?AUTO_3582 ) ( HAVE_SOIL_ANALYSIS ?AUTO_3581 ?AUTO_3579 ) ( VISIBLE ?AUTO_3583 ?AUTO_3582 ) ( AVAILABLE ?AUTO_3581 ) ( CHANNEL_FREE ?AUTO_3584 ) ( not ( = ?AUTO_3579 ?AUTO_3583 ) ) ( not ( = ?AUTO_3579 ?AUTO_3582 ) ) ( not ( = ?AUTO_3583 ?AUTO_3582 ) ) ( CAN_TRAVERSE ?AUTO_3581 ?AUTO_3580 ?AUTO_3583 ) ( VISIBLE ?AUTO_3580 ?AUTO_3583 ) ( not ( = ?AUTO_3579 ?AUTO_3580 ) ) ( not ( = ?AUTO_3582 ?AUTO_3580 ) ) ( not ( = ?AUTO_3583 ?AUTO_3580 ) ) ( CAN_TRAVERSE ?AUTO_3581 ?AUTO_3579 ?AUTO_3580 ) ( AT ?AUTO_3581 ?AUTO_3579 ) ( VISIBLE ?AUTO_3579 ?AUTO_3580 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3581 ?AUTO_3579 ?AUTO_3580 )
      ( GET_SOIL_DATA ?AUTO_3579 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3579 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3587 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3592 - LANDER
      ?AUTO_3588 - WAYPOINT
      ?AUTO_3591 - WAYPOINT
      ?AUTO_3589 - ROVER
      ?AUTO_3590 - WAYPOINT
      ?AUTO_3593 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3592 ?AUTO_3588 ) ( VISIBLE ?AUTO_3591 ?AUTO_3588 ) ( AVAILABLE ?AUTO_3589 ) ( CHANNEL_FREE ?AUTO_3592 ) ( not ( = ?AUTO_3587 ?AUTO_3591 ) ) ( not ( = ?AUTO_3587 ?AUTO_3588 ) ) ( not ( = ?AUTO_3591 ?AUTO_3588 ) ) ( CAN_TRAVERSE ?AUTO_3589 ?AUTO_3590 ?AUTO_3591 ) ( VISIBLE ?AUTO_3590 ?AUTO_3591 ) ( not ( = ?AUTO_3587 ?AUTO_3590 ) ) ( not ( = ?AUTO_3588 ?AUTO_3590 ) ) ( not ( = ?AUTO_3591 ?AUTO_3590 ) ) ( CAN_TRAVERSE ?AUTO_3589 ?AUTO_3587 ?AUTO_3590 ) ( AT ?AUTO_3589 ?AUTO_3587 ) ( VISIBLE ?AUTO_3587 ?AUTO_3590 ) ( AT_SOIL_SAMPLE ?AUTO_3587 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3589 ) ( STORE_OF ?AUTO_3593 ?AUTO_3589 ) ( EMPTY ?AUTO_3593 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_3589 ?AUTO_3593 ?AUTO_3587 )
      ( GET_SOIL_DATA ?AUTO_3587 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3587 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3594 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3595 - LANDER
      ?AUTO_3598 - WAYPOINT
      ?AUTO_3596 - WAYPOINT
      ?AUTO_3597 - ROVER
      ?AUTO_3599 - WAYPOINT
      ?AUTO_3600 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3595 ?AUTO_3598 ) ( VISIBLE ?AUTO_3596 ?AUTO_3598 ) ( AVAILABLE ?AUTO_3597 ) ( CHANNEL_FREE ?AUTO_3595 ) ( not ( = ?AUTO_3594 ?AUTO_3596 ) ) ( not ( = ?AUTO_3594 ?AUTO_3598 ) ) ( not ( = ?AUTO_3596 ?AUTO_3598 ) ) ( CAN_TRAVERSE ?AUTO_3597 ?AUTO_3599 ?AUTO_3596 ) ( VISIBLE ?AUTO_3599 ?AUTO_3596 ) ( not ( = ?AUTO_3594 ?AUTO_3599 ) ) ( not ( = ?AUTO_3598 ?AUTO_3599 ) ) ( not ( = ?AUTO_3596 ?AUTO_3599 ) ) ( CAN_TRAVERSE ?AUTO_3597 ?AUTO_3594 ?AUTO_3599 ) ( VISIBLE ?AUTO_3594 ?AUTO_3599 ) ( AT_SOIL_SAMPLE ?AUTO_3594 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3597 ) ( STORE_OF ?AUTO_3600 ?AUTO_3597 ) ( EMPTY ?AUTO_3600 ) ( CAN_TRAVERSE ?AUTO_3597 ?AUTO_3599 ?AUTO_3594 ) ( AT ?AUTO_3597 ?AUTO_3599 ) ( VISIBLE ?AUTO_3599 ?AUTO_3594 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3597 ?AUTO_3599 ?AUTO_3594 )
      ( GET_SOIL_DATA ?AUTO_3594 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3594 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_3611 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3614 - LANDER
      ?AUTO_3615 - WAYPOINT
      ?AUTO_3617 - WAYPOINT
      ?AUTO_3612 - ROVER
      ?AUTO_3613 - WAYPOINT
      ?AUTO_3616 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3614 ?AUTO_3615 ) ( VISIBLE ?AUTO_3617 ?AUTO_3615 ) ( AVAILABLE ?AUTO_3612 ) ( CHANNEL_FREE ?AUTO_3614 ) ( not ( = ?AUTO_3611 ?AUTO_3617 ) ) ( not ( = ?AUTO_3611 ?AUTO_3615 ) ) ( not ( = ?AUTO_3617 ?AUTO_3615 ) ) ( CAN_TRAVERSE ?AUTO_3612 ?AUTO_3613 ?AUTO_3617 ) ( VISIBLE ?AUTO_3613 ?AUTO_3617 ) ( not ( = ?AUTO_3611 ?AUTO_3613 ) ) ( not ( = ?AUTO_3615 ?AUTO_3613 ) ) ( not ( = ?AUTO_3617 ?AUTO_3613 ) ) ( CAN_TRAVERSE ?AUTO_3612 ?AUTO_3611 ?AUTO_3613 ) ( VISIBLE ?AUTO_3611 ?AUTO_3613 ) ( AT_SOIL_SAMPLE ?AUTO_3611 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_3612 ) ( STORE_OF ?AUTO_3616 ?AUTO_3612 ) ( EMPTY ?AUTO_3616 ) ( CAN_TRAVERSE ?AUTO_3612 ?AUTO_3613 ?AUTO_3611 ) ( VISIBLE ?AUTO_3613 ?AUTO_3611 ) ( CAN_TRAVERSE ?AUTO_3612 ?AUTO_3617 ?AUTO_3613 ) ( AT ?AUTO_3612 ?AUTO_3617 ) ( VISIBLE ?AUTO_3617 ?AUTO_3613 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3612 ?AUTO_3617 ?AUTO_3613 )
      ( GET_SOIL_DATA ?AUTO_3611 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_3611 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3625 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3627 - LANDER
      ?AUTO_3626 - WAYPOINT
      ?AUTO_3628 - ROVER
      ?AUTO_3629 - WAYPOINT
      ?AUTO_3630 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3627 ?AUTO_3626 ) ( HAVE_ROCK_ANALYSIS ?AUTO_3628 ?AUTO_3625 ) ( VISIBLE ?AUTO_3629 ?AUTO_3626 ) ( AVAILABLE ?AUTO_3628 ) ( CHANNEL_FREE ?AUTO_3627 ) ( not ( = ?AUTO_3625 ?AUTO_3629 ) ) ( not ( = ?AUTO_3625 ?AUTO_3626 ) ) ( not ( = ?AUTO_3629 ?AUTO_3626 ) ) ( CAN_TRAVERSE ?AUTO_3628 ?AUTO_3630 ?AUTO_3629 ) ( AT ?AUTO_3628 ?AUTO_3630 ) ( VISIBLE ?AUTO_3630 ?AUTO_3629 ) ( not ( = ?AUTO_3625 ?AUTO_3630 ) ) ( not ( = ?AUTO_3626 ?AUTO_3630 ) ) ( not ( = ?AUTO_3629 ?AUTO_3630 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3628 ?AUTO_3630 ?AUTO_3629 )
      ( GET_ROCK_DATA ?AUTO_3625 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3625 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3631 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3634 - LANDER
      ?AUTO_3632 - WAYPOINT
      ?AUTO_3635 - ROVER
      ?AUTO_3633 - WAYPOINT
      ?AUTO_3636 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3634 ?AUTO_3632 ) ( HAVE_ROCK_ANALYSIS ?AUTO_3635 ?AUTO_3631 ) ( VISIBLE ?AUTO_3633 ?AUTO_3632 ) ( AVAILABLE ?AUTO_3635 ) ( CHANNEL_FREE ?AUTO_3634 ) ( not ( = ?AUTO_3631 ?AUTO_3633 ) ) ( not ( = ?AUTO_3631 ?AUTO_3632 ) ) ( not ( = ?AUTO_3633 ?AUTO_3632 ) ) ( CAN_TRAVERSE ?AUTO_3635 ?AUTO_3636 ?AUTO_3633 ) ( VISIBLE ?AUTO_3636 ?AUTO_3633 ) ( not ( = ?AUTO_3631 ?AUTO_3636 ) ) ( not ( = ?AUTO_3632 ?AUTO_3636 ) ) ( not ( = ?AUTO_3633 ?AUTO_3636 ) ) ( CAN_TRAVERSE ?AUTO_3635 ?AUTO_3631 ?AUTO_3636 ) ( AT ?AUTO_3635 ?AUTO_3631 ) ( VISIBLE ?AUTO_3631 ?AUTO_3636 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3635 ?AUTO_3631 ?AUTO_3636 )
      ( GET_ROCK_DATA ?AUTO_3631 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3631 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3637 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3642 - LANDER
      ?AUTO_3638 - WAYPOINT
      ?AUTO_3639 - WAYPOINT
      ?AUTO_3640 - ROVER
      ?AUTO_3641 - WAYPOINT
      ?AUTO_3643 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3642 ?AUTO_3638 ) ( VISIBLE ?AUTO_3639 ?AUTO_3638 ) ( AVAILABLE ?AUTO_3640 ) ( CHANNEL_FREE ?AUTO_3642 ) ( not ( = ?AUTO_3637 ?AUTO_3639 ) ) ( not ( = ?AUTO_3637 ?AUTO_3638 ) ) ( not ( = ?AUTO_3639 ?AUTO_3638 ) ) ( CAN_TRAVERSE ?AUTO_3640 ?AUTO_3641 ?AUTO_3639 ) ( VISIBLE ?AUTO_3641 ?AUTO_3639 ) ( not ( = ?AUTO_3637 ?AUTO_3641 ) ) ( not ( = ?AUTO_3638 ?AUTO_3641 ) ) ( not ( = ?AUTO_3639 ?AUTO_3641 ) ) ( CAN_TRAVERSE ?AUTO_3640 ?AUTO_3637 ?AUTO_3641 ) ( AT ?AUTO_3640 ?AUTO_3637 ) ( VISIBLE ?AUTO_3637 ?AUTO_3641 ) ( AT_ROCK_SAMPLE ?AUTO_3637 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3640 ) ( STORE_OF ?AUTO_3643 ?AUTO_3640 ) ( EMPTY ?AUTO_3643 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_3640 ?AUTO_3643 ?AUTO_3637 )
      ( GET_ROCK_DATA ?AUTO_3637 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3637 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3644 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3645 - LANDER
      ?AUTO_3647 - WAYPOINT
      ?AUTO_3646 - WAYPOINT
      ?AUTO_3649 - ROVER
      ?AUTO_3648 - WAYPOINT
      ?AUTO_3650 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3645 ?AUTO_3647 ) ( VISIBLE ?AUTO_3646 ?AUTO_3647 ) ( AVAILABLE ?AUTO_3649 ) ( CHANNEL_FREE ?AUTO_3645 ) ( not ( = ?AUTO_3644 ?AUTO_3646 ) ) ( not ( = ?AUTO_3644 ?AUTO_3647 ) ) ( not ( = ?AUTO_3646 ?AUTO_3647 ) ) ( CAN_TRAVERSE ?AUTO_3649 ?AUTO_3648 ?AUTO_3646 ) ( VISIBLE ?AUTO_3648 ?AUTO_3646 ) ( not ( = ?AUTO_3644 ?AUTO_3648 ) ) ( not ( = ?AUTO_3647 ?AUTO_3648 ) ) ( not ( = ?AUTO_3646 ?AUTO_3648 ) ) ( CAN_TRAVERSE ?AUTO_3649 ?AUTO_3644 ?AUTO_3648 ) ( AT ?AUTO_3649 ?AUTO_3644 ) ( VISIBLE ?AUTO_3644 ?AUTO_3648 ) ( AT_ROCK_SAMPLE ?AUTO_3644 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3649 ) ( STORE_OF ?AUTO_3650 ?AUTO_3649 ) ( FULL ?AUTO_3650 ) )
    :subtasks
    ( ( !DROP ?AUTO_3649 ?AUTO_3650 )
      ( GET_ROCK_DATA ?AUTO_3644 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3644 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_3652 - WAYPOINT
    )
    :vars
    (
      ?AUTO_3657 - LANDER
      ?AUTO_3656 - WAYPOINT
      ?AUTO_3658 - WAYPOINT
      ?AUTO_3655 - ROVER
      ?AUTO_3654 - WAYPOINT
      ?AUTO_3653 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3657 ?AUTO_3656 ) ( VISIBLE ?AUTO_3658 ?AUTO_3656 ) ( AVAILABLE ?AUTO_3655 ) ( CHANNEL_FREE ?AUTO_3657 ) ( not ( = ?AUTO_3652 ?AUTO_3658 ) ) ( not ( = ?AUTO_3652 ?AUTO_3656 ) ) ( not ( = ?AUTO_3658 ?AUTO_3656 ) ) ( CAN_TRAVERSE ?AUTO_3655 ?AUTO_3654 ?AUTO_3658 ) ( VISIBLE ?AUTO_3654 ?AUTO_3658 ) ( not ( = ?AUTO_3652 ?AUTO_3654 ) ) ( not ( = ?AUTO_3656 ?AUTO_3654 ) ) ( not ( = ?AUTO_3658 ?AUTO_3654 ) ) ( CAN_TRAVERSE ?AUTO_3655 ?AUTO_3652 ?AUTO_3654 ) ( VISIBLE ?AUTO_3652 ?AUTO_3654 ) ( AT_ROCK_SAMPLE ?AUTO_3652 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_3655 ) ( STORE_OF ?AUTO_3653 ?AUTO_3655 ) ( EMPTY ?AUTO_3653 ) ( CAN_TRAVERSE ?AUTO_3655 ?AUTO_3654 ?AUTO_3652 ) ( AT ?AUTO_3655 ?AUTO_3654 ) ( VISIBLE ?AUTO_3654 ?AUTO_3652 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3655 ?AUTO_3654 ?AUTO_3652 )
      ( GET_ROCK_DATA ?AUTO_3652 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_3652 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3697 - OBJECTIVE
      ?AUTO_3698 - MODE
    )
    :vars
    (
      ?AUTO_3700 - LANDER
      ?AUTO_3702 - WAYPOINT
      ?AUTO_3703 - WAYPOINT
      ?AUTO_3701 - ROVER
      ?AUTO_3704 - CAMERA
      ?AUTO_3699 - OBJECTIVE
      ?AUTO_3705 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3700 ?AUTO_3702 ) ( VISIBLE ?AUTO_3703 ?AUTO_3702 ) ( AVAILABLE ?AUTO_3701 ) ( CHANNEL_FREE ?AUTO_3700 ) ( not ( = ?AUTO_3703 ?AUTO_3702 ) ) ( ON_BOARD ?AUTO_3704 ?AUTO_3701 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3701 ) ( SUPPORTS ?AUTO_3704 ?AUTO_3698 ) ( VISIBLE_FROM ?AUTO_3697 ?AUTO_3703 ) ( CAN_TRAVERSE ?AUTO_3701 ?AUTO_3702 ?AUTO_3703 ) ( VISIBLE ?AUTO_3702 ?AUTO_3703 ) ( CALIBRATION_TARGET ?AUTO_3704 ?AUTO_3699 ) ( VISIBLE_FROM ?AUTO_3699 ?AUTO_3702 ) ( not ( = ?AUTO_3697 ?AUTO_3699 ) ) ( CAN_TRAVERSE ?AUTO_3701 ?AUTO_3703 ?AUTO_3702 ) ( CAN_TRAVERSE ?AUTO_3701 ?AUTO_3705 ?AUTO_3703 ) ( AT ?AUTO_3701 ?AUTO_3705 ) ( VISIBLE ?AUTO_3705 ?AUTO_3703 ) ( not ( = ?AUTO_3702 ?AUTO_3705 ) ) ( not ( = ?AUTO_3703 ?AUTO_3705 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3701 ?AUTO_3705 ?AUTO_3703 )
      ( GET_IMAGE_DATA ?AUTO_3697 ?AUTO_3698 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3697 ?AUTO_3698 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3706 - OBJECTIVE
      ?AUTO_3707 - MODE
    )
    :vars
    (
      ?AUTO_3712 - LANDER
      ?AUTO_3714 - WAYPOINT
      ?AUTO_3713 - WAYPOINT
      ?AUTO_3709 - ROVER
      ?AUTO_3708 - CAMERA
      ?AUTO_3710 - OBJECTIVE
      ?AUTO_3711 - WAYPOINT
      ?AUTO_3715 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3712 ?AUTO_3714 ) ( VISIBLE ?AUTO_3713 ?AUTO_3714 ) ( AVAILABLE ?AUTO_3709 ) ( CHANNEL_FREE ?AUTO_3712 ) ( not ( = ?AUTO_3713 ?AUTO_3714 ) ) ( ON_BOARD ?AUTO_3708 ?AUTO_3709 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3709 ) ( SUPPORTS ?AUTO_3708 ?AUTO_3707 ) ( VISIBLE_FROM ?AUTO_3706 ?AUTO_3713 ) ( CAN_TRAVERSE ?AUTO_3709 ?AUTO_3714 ?AUTO_3713 ) ( VISIBLE ?AUTO_3714 ?AUTO_3713 ) ( CALIBRATION_TARGET ?AUTO_3708 ?AUTO_3710 ) ( VISIBLE_FROM ?AUTO_3710 ?AUTO_3714 ) ( not ( = ?AUTO_3706 ?AUTO_3710 ) ) ( CAN_TRAVERSE ?AUTO_3709 ?AUTO_3713 ?AUTO_3714 ) ( CAN_TRAVERSE ?AUTO_3709 ?AUTO_3711 ?AUTO_3713 ) ( VISIBLE ?AUTO_3711 ?AUTO_3713 ) ( not ( = ?AUTO_3714 ?AUTO_3711 ) ) ( not ( = ?AUTO_3713 ?AUTO_3711 ) ) ( CAN_TRAVERSE ?AUTO_3709 ?AUTO_3715 ?AUTO_3711 ) ( AT ?AUTO_3709 ?AUTO_3715 ) ( VISIBLE ?AUTO_3715 ?AUTO_3711 ) ( not ( = ?AUTO_3714 ?AUTO_3715 ) ) ( not ( = ?AUTO_3713 ?AUTO_3715 ) ) ( not ( = ?AUTO_3711 ?AUTO_3715 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3709 ?AUTO_3715 ?AUTO_3711 )
      ( GET_IMAGE_DATA ?AUTO_3706 ?AUTO_3707 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3706 ?AUTO_3707 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5149 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5152 - LANDER
      ?AUTO_5154 - WAYPOINT
      ?AUTO_5153 - ROVER
      ?AUTO_5150 - STORE
      ?AUTO_5151 - WAYPOINT
      ?AUTO_5155 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5152 ?AUTO_5154 ) ( VISIBLE ?AUTO_5149 ?AUTO_5154 ) ( AVAILABLE ?AUTO_5153 ) ( CHANNEL_FREE ?AUTO_5152 ) ( not ( = ?AUTO_5149 ?AUTO_5154 ) ) ( AT_SOIL_SAMPLE ?AUTO_5149 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5153 ) ( STORE_OF ?AUTO_5150 ?AUTO_5153 ) ( EMPTY ?AUTO_5150 ) ( CAN_TRAVERSE ?AUTO_5153 ?AUTO_5151 ?AUTO_5149 ) ( VISIBLE ?AUTO_5151 ?AUTO_5149 ) ( not ( = ?AUTO_5149 ?AUTO_5151 ) ) ( not ( = ?AUTO_5154 ?AUTO_5151 ) ) ( CAN_TRAVERSE ?AUTO_5153 ?AUTO_5155 ?AUTO_5151 ) ( AT ?AUTO_5153 ?AUTO_5155 ) ( VISIBLE ?AUTO_5155 ?AUTO_5151 ) ( not ( = ?AUTO_5149 ?AUTO_5155 ) ) ( not ( = ?AUTO_5154 ?AUTO_5155 ) ) ( not ( = ?AUTO_5151 ?AUTO_5155 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5153 ?AUTO_5155 ?AUTO_5151 )
      ( GET_SOIL_DATA ?AUTO_5149 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5149 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3853 - OBJECTIVE
      ?AUTO_3854 - MODE
    )
    :vars
    (
      ?AUTO_3855 - LANDER
      ?AUTO_3857 - WAYPOINT
      ?AUTO_3858 - WAYPOINT
      ?AUTO_3860 - ROVER
      ?AUTO_3859 - CAMERA
      ?AUTO_3856 - WAYPOINT
      ?AUTO_3861 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3855 ?AUTO_3857 ) ( VISIBLE ?AUTO_3858 ?AUTO_3857 ) ( AVAILABLE ?AUTO_3860 ) ( CHANNEL_FREE ?AUTO_3855 ) ( not ( = ?AUTO_3858 ?AUTO_3857 ) ) ( CAN_TRAVERSE ?AUTO_3860 ?AUTO_3857 ?AUTO_3858 ) ( VISIBLE ?AUTO_3857 ?AUTO_3858 ) ( CALIBRATED ?AUTO_3859 ?AUTO_3860 ) ( ON_BOARD ?AUTO_3859 ?AUTO_3860 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3860 ) ( SUPPORTS ?AUTO_3859 ?AUTO_3854 ) ( VISIBLE_FROM ?AUTO_3853 ?AUTO_3857 ) ( CAN_TRAVERSE ?AUTO_3860 ?AUTO_3856 ?AUTO_3857 ) ( VISIBLE ?AUTO_3856 ?AUTO_3857 ) ( not ( = ?AUTO_3857 ?AUTO_3856 ) ) ( not ( = ?AUTO_3858 ?AUTO_3856 ) ) ( CAN_TRAVERSE ?AUTO_3860 ?AUTO_3861 ?AUTO_3856 ) ( AT ?AUTO_3860 ?AUTO_3861 ) ( VISIBLE ?AUTO_3861 ?AUTO_3856 ) ( not ( = ?AUTO_3857 ?AUTO_3861 ) ) ( not ( = ?AUTO_3858 ?AUTO_3861 ) ) ( not ( = ?AUTO_3856 ?AUTO_3861 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3860 ?AUTO_3861 ?AUTO_3856 )
      ( GET_IMAGE_DATA ?AUTO_3853 ?AUTO_3854 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3853 ?AUTO_3854 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3862 - OBJECTIVE
      ?AUTO_3863 - MODE
    )
    :vars
    (
      ?AUTO_3870 - LANDER
      ?AUTO_3868 - WAYPOINT
      ?AUTO_3866 - WAYPOINT
      ?AUTO_3864 - ROVER
      ?AUTO_3865 - CAMERA
      ?AUTO_3867 - WAYPOINT
      ?AUTO_3869 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3870 ?AUTO_3868 ) ( VISIBLE ?AUTO_3866 ?AUTO_3868 ) ( AVAILABLE ?AUTO_3864 ) ( CHANNEL_FREE ?AUTO_3870 ) ( not ( = ?AUTO_3866 ?AUTO_3868 ) ) ( CAN_TRAVERSE ?AUTO_3864 ?AUTO_3868 ?AUTO_3866 ) ( VISIBLE ?AUTO_3868 ?AUTO_3866 ) ( CALIBRATED ?AUTO_3865 ?AUTO_3864 ) ( ON_BOARD ?AUTO_3865 ?AUTO_3864 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3864 ) ( SUPPORTS ?AUTO_3865 ?AUTO_3863 ) ( VISIBLE_FROM ?AUTO_3862 ?AUTO_3868 ) ( CAN_TRAVERSE ?AUTO_3864 ?AUTO_3867 ?AUTO_3868 ) ( VISIBLE ?AUTO_3867 ?AUTO_3868 ) ( not ( = ?AUTO_3868 ?AUTO_3867 ) ) ( not ( = ?AUTO_3866 ?AUTO_3867 ) ) ( CAN_TRAVERSE ?AUTO_3864 ?AUTO_3869 ?AUTO_3867 ) ( VISIBLE ?AUTO_3869 ?AUTO_3867 ) ( not ( = ?AUTO_3868 ?AUTO_3869 ) ) ( not ( = ?AUTO_3866 ?AUTO_3869 ) ) ( not ( = ?AUTO_3867 ?AUTO_3869 ) ) ( CAN_TRAVERSE ?AUTO_3864 ?AUTO_3866 ?AUTO_3869 ) ( AT ?AUTO_3864 ?AUTO_3866 ) ( VISIBLE ?AUTO_3866 ?AUTO_3869 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3864 ?AUTO_3866 ?AUTO_3869 )
      ( GET_IMAGE_DATA ?AUTO_3862 ?AUTO_3863 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3862 ?AUTO_3863 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3877 - OBJECTIVE
      ?AUTO_3878 - MODE
    )
    :vars
    (
      ?AUTO_3882 - LANDER
      ?AUTO_3883 - WAYPOINT
      ?AUTO_3880 - WAYPOINT
      ?AUTO_3881 - ROVER
      ?AUTO_3885 - CAMERA
      ?AUTO_3879 - WAYPOINT
      ?AUTO_3884 - WAYPOINT
      ?AUTO_3886 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3882 ?AUTO_3883 ) ( VISIBLE ?AUTO_3880 ?AUTO_3883 ) ( AVAILABLE ?AUTO_3881 ) ( CHANNEL_FREE ?AUTO_3882 ) ( not ( = ?AUTO_3880 ?AUTO_3883 ) ) ( CAN_TRAVERSE ?AUTO_3881 ?AUTO_3883 ?AUTO_3880 ) ( VISIBLE ?AUTO_3883 ?AUTO_3880 ) ( ON_BOARD ?AUTO_3885 ?AUTO_3881 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3881 ) ( SUPPORTS ?AUTO_3885 ?AUTO_3878 ) ( VISIBLE_FROM ?AUTO_3877 ?AUTO_3883 ) ( CAN_TRAVERSE ?AUTO_3881 ?AUTO_3879 ?AUTO_3883 ) ( VISIBLE ?AUTO_3879 ?AUTO_3883 ) ( not ( = ?AUTO_3883 ?AUTO_3879 ) ) ( not ( = ?AUTO_3880 ?AUTO_3879 ) ) ( CAN_TRAVERSE ?AUTO_3881 ?AUTO_3884 ?AUTO_3879 ) ( VISIBLE ?AUTO_3884 ?AUTO_3879 ) ( not ( = ?AUTO_3883 ?AUTO_3884 ) ) ( not ( = ?AUTO_3880 ?AUTO_3884 ) ) ( not ( = ?AUTO_3879 ?AUTO_3884 ) ) ( CAN_TRAVERSE ?AUTO_3881 ?AUTO_3880 ?AUTO_3884 ) ( AT ?AUTO_3881 ?AUTO_3880 ) ( VISIBLE ?AUTO_3880 ?AUTO_3884 ) ( CALIBRATION_TARGET ?AUTO_3885 ?AUTO_3886 ) ( VISIBLE_FROM ?AUTO_3886 ?AUTO_3880 ) ( not ( = ?AUTO_3877 ?AUTO_3886 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_3881 ?AUTO_3885 ?AUTO_3886 ?AUTO_3880 )
      ( GET_IMAGE_DATA ?AUTO_3877 ?AUTO_3878 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3877 ?AUTO_3878 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3928 - OBJECTIVE
      ?AUTO_3929 - MODE
    )
    :vars
    (
      ?AUTO_3932 - LANDER
      ?AUTO_3934 - WAYPOINT
      ?AUTO_3931 - WAYPOINT
      ?AUTO_3933 - ROVER
      ?AUTO_3930 - CAMERA
      ?AUTO_3935 - WAYPOINT
      ?AUTO_3936 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_3932 ?AUTO_3934 ) ( VISIBLE ?AUTO_3931 ?AUTO_3934 ) ( AVAILABLE ?AUTO_3933 ) ( CHANNEL_FREE ?AUTO_3932 ) ( not ( = ?AUTO_3931 ?AUTO_3934 ) ) ( ON_BOARD ?AUTO_3930 ?AUTO_3933 ) ( EQUIPPED_FOR_IMAGING ?AUTO_3933 ) ( SUPPORTS ?AUTO_3930 ?AUTO_3929 ) ( VISIBLE_FROM ?AUTO_3928 ?AUTO_3931 ) ( CALIBRATION_TARGET ?AUTO_3930 ?AUTO_3928 ) ( CAN_TRAVERSE ?AUTO_3933 ?AUTO_3934 ?AUTO_3931 ) ( VISIBLE ?AUTO_3934 ?AUTO_3931 ) ( CAN_TRAVERSE ?AUTO_3933 ?AUTO_3935 ?AUTO_3934 ) ( VISIBLE ?AUTO_3935 ?AUTO_3934 ) ( not ( = ?AUTO_3934 ?AUTO_3935 ) ) ( not ( = ?AUTO_3931 ?AUTO_3935 ) ) ( CAN_TRAVERSE ?AUTO_3933 ?AUTO_3936 ?AUTO_3935 ) ( AT ?AUTO_3933 ?AUTO_3936 ) ( VISIBLE ?AUTO_3936 ?AUTO_3935 ) ( not ( = ?AUTO_3934 ?AUTO_3936 ) ) ( not ( = ?AUTO_3931 ?AUTO_3936 ) ) ( not ( = ?AUTO_3935 ?AUTO_3936 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_3933 ?AUTO_3936 ?AUTO_3935 )
      ( GET_IMAGE_DATA ?AUTO_3928 ?AUTO_3929 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3928 ?AUTO_3929 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_3997 - OBJECTIVE
      ?AUTO_3998 - MODE
    )
    :vars
    (
      ?AUTO_4001 - LANDER
      ?AUTO_4000 - WAYPOINT
      ?AUTO_4002 - WAYPOINT
      ?AUTO_4003 - ROVER
      ?AUTO_3999 - WAYPOINT
      ?AUTO_4004 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4001 ?AUTO_4000 ) ( VISIBLE ?AUTO_4002 ?AUTO_4000 ) ( AVAILABLE ?AUTO_4003 ) ( CHANNEL_FREE ?AUTO_4001 ) ( not ( = ?AUTO_4002 ?AUTO_4000 ) ) ( CAN_TRAVERSE ?AUTO_4003 ?AUTO_3999 ?AUTO_4002 ) ( VISIBLE ?AUTO_3999 ?AUTO_4002 ) ( not ( = ?AUTO_4000 ?AUTO_3999 ) ) ( not ( = ?AUTO_4002 ?AUTO_3999 ) ) ( CALIBRATED ?AUTO_4004 ?AUTO_4003 ) ( ON_BOARD ?AUTO_4004 ?AUTO_4003 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4003 ) ( SUPPORTS ?AUTO_4004 ?AUTO_3998 ) ( VISIBLE_FROM ?AUTO_3997 ?AUTO_3999 ) ( CAN_TRAVERSE ?AUTO_4003 ?AUTO_4002 ?AUTO_3999 ) ( AT ?AUTO_4003 ?AUTO_4002 ) ( VISIBLE ?AUTO_4002 ?AUTO_3999 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4003 ?AUTO_4002 ?AUTO_3999 )
      ( GET_IMAGE_DATA ?AUTO_3997 ?AUTO_3998 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_3997 ?AUTO_3998 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4007 - OBJECTIVE
      ?AUTO_4008 - MODE
    )
    :vars
    (
      ?AUTO_4010 - LANDER
      ?AUTO_4009 - WAYPOINT
      ?AUTO_4013 - WAYPOINT
      ?AUTO_4011 - ROVER
      ?AUTO_4012 - WAYPOINT
      ?AUTO_4014 - CAMERA
      ?AUTO_4015 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4010 ?AUTO_4009 ) ( VISIBLE ?AUTO_4013 ?AUTO_4009 ) ( AVAILABLE ?AUTO_4011 ) ( CHANNEL_FREE ?AUTO_4010 ) ( not ( = ?AUTO_4013 ?AUTO_4009 ) ) ( CAN_TRAVERSE ?AUTO_4011 ?AUTO_4012 ?AUTO_4013 ) ( VISIBLE ?AUTO_4012 ?AUTO_4013 ) ( not ( = ?AUTO_4009 ?AUTO_4012 ) ) ( not ( = ?AUTO_4013 ?AUTO_4012 ) ) ( ON_BOARD ?AUTO_4014 ?AUTO_4011 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4011 ) ( SUPPORTS ?AUTO_4014 ?AUTO_4008 ) ( VISIBLE_FROM ?AUTO_4007 ?AUTO_4012 ) ( CAN_TRAVERSE ?AUTO_4011 ?AUTO_4013 ?AUTO_4012 ) ( AT ?AUTO_4011 ?AUTO_4013 ) ( VISIBLE ?AUTO_4013 ?AUTO_4012 ) ( CALIBRATION_TARGET ?AUTO_4014 ?AUTO_4015 ) ( VISIBLE_FROM ?AUTO_4015 ?AUTO_4013 ) ( not ( = ?AUTO_4007 ?AUTO_4015 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4011 ?AUTO_4014 ?AUTO_4015 ?AUTO_4013 )
      ( GET_IMAGE_DATA ?AUTO_4007 ?AUTO_4008 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4007 ?AUTO_4008 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4016 - OBJECTIVE
      ?AUTO_4017 - MODE
    )
    :vars
    (
      ?AUTO_4021 - LANDER
      ?AUTO_4019 - WAYPOINT
      ?AUTO_4024 - WAYPOINT
      ?AUTO_4022 - ROVER
      ?AUTO_4023 - WAYPOINT
      ?AUTO_4020 - CAMERA
      ?AUTO_4018 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4021 ?AUTO_4019 ) ( VISIBLE ?AUTO_4024 ?AUTO_4019 ) ( AVAILABLE ?AUTO_4022 ) ( CHANNEL_FREE ?AUTO_4021 ) ( not ( = ?AUTO_4024 ?AUTO_4019 ) ) ( CAN_TRAVERSE ?AUTO_4022 ?AUTO_4023 ?AUTO_4024 ) ( VISIBLE ?AUTO_4023 ?AUTO_4024 ) ( not ( = ?AUTO_4019 ?AUTO_4023 ) ) ( not ( = ?AUTO_4024 ?AUTO_4023 ) ) ( ON_BOARD ?AUTO_4020 ?AUTO_4022 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4022 ) ( SUPPORTS ?AUTO_4020 ?AUTO_4017 ) ( VISIBLE_FROM ?AUTO_4016 ?AUTO_4023 ) ( CAN_TRAVERSE ?AUTO_4022 ?AUTO_4024 ?AUTO_4023 ) ( VISIBLE ?AUTO_4024 ?AUTO_4023 ) ( CALIBRATION_TARGET ?AUTO_4020 ?AUTO_4018 ) ( VISIBLE_FROM ?AUTO_4018 ?AUTO_4024 ) ( not ( = ?AUTO_4016 ?AUTO_4018 ) ) ( AT ?AUTO_4022 ?AUTO_4023 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4022 ?AUTO_4023 ?AUTO_4024 )
      ( GET_IMAGE_DATA ?AUTO_4016 ?AUTO_4017 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4016 ?AUTO_4017 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4027 - OBJECTIVE
      ?AUTO_4028 - MODE
    )
    :vars
    (
      ?AUTO_4034 - LANDER
      ?AUTO_4033 - WAYPOINT
      ?AUTO_4035 - WAYPOINT
      ?AUTO_4032 - ROVER
      ?AUTO_4030 - WAYPOINT
      ?AUTO_4031 - CAMERA
      ?AUTO_4029 - OBJECTIVE
      ?AUTO_4036 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4034 ?AUTO_4033 ) ( VISIBLE ?AUTO_4035 ?AUTO_4033 ) ( AVAILABLE ?AUTO_4032 ) ( CHANNEL_FREE ?AUTO_4034 ) ( not ( = ?AUTO_4035 ?AUTO_4033 ) ) ( CAN_TRAVERSE ?AUTO_4032 ?AUTO_4030 ?AUTO_4035 ) ( VISIBLE ?AUTO_4030 ?AUTO_4035 ) ( not ( = ?AUTO_4033 ?AUTO_4030 ) ) ( not ( = ?AUTO_4035 ?AUTO_4030 ) ) ( ON_BOARD ?AUTO_4031 ?AUTO_4032 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4032 ) ( SUPPORTS ?AUTO_4031 ?AUTO_4028 ) ( VISIBLE_FROM ?AUTO_4027 ?AUTO_4030 ) ( CAN_TRAVERSE ?AUTO_4032 ?AUTO_4035 ?AUTO_4030 ) ( VISIBLE ?AUTO_4035 ?AUTO_4030 ) ( CALIBRATION_TARGET ?AUTO_4031 ?AUTO_4029 ) ( VISIBLE_FROM ?AUTO_4029 ?AUTO_4035 ) ( not ( = ?AUTO_4027 ?AUTO_4029 ) ) ( CAN_TRAVERSE ?AUTO_4032 ?AUTO_4036 ?AUTO_4030 ) ( AT ?AUTO_4032 ?AUTO_4036 ) ( VISIBLE ?AUTO_4036 ?AUTO_4030 ) ( not ( = ?AUTO_4033 ?AUTO_4036 ) ) ( not ( = ?AUTO_4035 ?AUTO_4036 ) ) ( not ( = ?AUTO_4030 ?AUTO_4036 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4032 ?AUTO_4036 ?AUTO_4030 )
      ( GET_IMAGE_DATA ?AUTO_4027 ?AUTO_4028 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4027 ?AUTO_4028 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4041 - OBJECTIVE
      ?AUTO_4042 - MODE
    )
    :vars
    (
      ?AUTO_4044 - LANDER
      ?AUTO_4046 - WAYPOINT
      ?AUTO_4048 - WAYPOINT
      ?AUTO_4043 - ROVER
      ?AUTO_4045 - WAYPOINT
      ?AUTO_4049 - CAMERA
      ?AUTO_4047 - OBJECTIVE
      ?AUTO_4050 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4044 ?AUTO_4046 ) ( VISIBLE ?AUTO_4048 ?AUTO_4046 ) ( AVAILABLE ?AUTO_4043 ) ( CHANNEL_FREE ?AUTO_4044 ) ( not ( = ?AUTO_4048 ?AUTO_4046 ) ) ( CAN_TRAVERSE ?AUTO_4043 ?AUTO_4045 ?AUTO_4048 ) ( VISIBLE ?AUTO_4045 ?AUTO_4048 ) ( not ( = ?AUTO_4046 ?AUTO_4045 ) ) ( not ( = ?AUTO_4048 ?AUTO_4045 ) ) ( ON_BOARD ?AUTO_4049 ?AUTO_4043 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4043 ) ( SUPPORTS ?AUTO_4049 ?AUTO_4042 ) ( VISIBLE_FROM ?AUTO_4041 ?AUTO_4045 ) ( CAN_TRAVERSE ?AUTO_4043 ?AUTO_4048 ?AUTO_4045 ) ( VISIBLE ?AUTO_4048 ?AUTO_4045 ) ( CALIBRATION_TARGET ?AUTO_4049 ?AUTO_4047 ) ( VISIBLE_FROM ?AUTO_4047 ?AUTO_4048 ) ( not ( = ?AUTO_4041 ?AUTO_4047 ) ) ( CAN_TRAVERSE ?AUTO_4043 ?AUTO_4050 ?AUTO_4045 ) ( VISIBLE ?AUTO_4050 ?AUTO_4045 ) ( not ( = ?AUTO_4046 ?AUTO_4050 ) ) ( not ( = ?AUTO_4048 ?AUTO_4050 ) ) ( not ( = ?AUTO_4045 ?AUTO_4050 ) ) ( CAN_TRAVERSE ?AUTO_4043 ?AUTO_4046 ?AUTO_4050 ) ( AT ?AUTO_4043 ?AUTO_4046 ) ( VISIBLE ?AUTO_4046 ?AUTO_4050 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4043 ?AUTO_4046 ?AUTO_4050 )
      ( GET_IMAGE_DATA ?AUTO_4041 ?AUTO_4042 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4041 ?AUTO_4042 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4120 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4124 - LANDER
      ?AUTO_4122 - WAYPOINT
      ?AUTO_4121 - ROVER
      ?AUTO_4123 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4124 ?AUTO_4120 ) ( VISIBLE ?AUTO_4122 ?AUTO_4120 ) ( AVAILABLE ?AUTO_4121 ) ( CHANNEL_FREE ?AUTO_4124 ) ( not ( = ?AUTO_4120 ?AUTO_4122 ) ) ( CAN_TRAVERSE ?AUTO_4121 ?AUTO_4120 ?AUTO_4122 ) ( VISIBLE ?AUTO_4120 ?AUTO_4122 ) ( AT_SOIL_SAMPLE ?AUTO_4120 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4121 ) ( STORE_OF ?AUTO_4123 ?AUTO_4121 ) ( CAN_TRAVERSE ?AUTO_4121 ?AUTO_4122 ?AUTO_4120 ) ( AT ?AUTO_4121 ?AUTO_4122 ) ( FULL ?AUTO_4123 ) )
    :subtasks
    ( ( !DROP ?AUTO_4121 ?AUTO_4123 )
      ( GET_SOIL_DATA ?AUTO_4120 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4120 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4130 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4133 - LANDER
      ?AUTO_4132 - WAYPOINT
      ?AUTO_4134 - ROVER
      ?AUTO_4131 - STORE
      ?AUTO_4135 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4133 ?AUTO_4130 ) ( VISIBLE ?AUTO_4132 ?AUTO_4130 ) ( AVAILABLE ?AUTO_4134 ) ( CHANNEL_FREE ?AUTO_4133 ) ( not ( = ?AUTO_4130 ?AUTO_4132 ) ) ( CAN_TRAVERSE ?AUTO_4134 ?AUTO_4130 ?AUTO_4132 ) ( VISIBLE ?AUTO_4130 ?AUTO_4132 ) ( AT_SOIL_SAMPLE ?AUTO_4130 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4134 ) ( STORE_OF ?AUTO_4131 ?AUTO_4134 ) ( EMPTY ?AUTO_4131 ) ( CAN_TRAVERSE ?AUTO_4134 ?AUTO_4132 ?AUTO_4130 ) ( CAN_TRAVERSE ?AUTO_4134 ?AUTO_4135 ?AUTO_4132 ) ( AT ?AUTO_4134 ?AUTO_4135 ) ( VISIBLE ?AUTO_4135 ?AUTO_4132 ) ( not ( = ?AUTO_4130 ?AUTO_4135 ) ) ( not ( = ?AUTO_4132 ?AUTO_4135 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4134 ?AUTO_4135 ?AUTO_4132 )
      ( GET_SOIL_DATA ?AUTO_4130 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4130 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4201 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4204 - LANDER
      ?AUTO_4205 - WAYPOINT
      ?AUTO_4206 - WAYPOINT
      ?AUTO_4202 - ROVER
      ?AUTO_4203 - WAYPOINT
      ?AUTO_4207 - STORE
      ?AUTO_4208 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4204 ?AUTO_4205 ) ( VISIBLE ?AUTO_4206 ?AUTO_4205 ) ( AVAILABLE ?AUTO_4202 ) ( CHANNEL_FREE ?AUTO_4204 ) ( not ( = ?AUTO_4201 ?AUTO_4206 ) ) ( not ( = ?AUTO_4201 ?AUTO_4205 ) ) ( not ( = ?AUTO_4206 ?AUTO_4205 ) ) ( CAN_TRAVERSE ?AUTO_4202 ?AUTO_4203 ?AUTO_4206 ) ( VISIBLE ?AUTO_4203 ?AUTO_4206 ) ( not ( = ?AUTO_4201 ?AUTO_4203 ) ) ( not ( = ?AUTO_4205 ?AUTO_4203 ) ) ( not ( = ?AUTO_4206 ?AUTO_4203 ) ) ( CAN_TRAVERSE ?AUTO_4202 ?AUTO_4201 ?AUTO_4203 ) ( VISIBLE ?AUTO_4201 ?AUTO_4203 ) ( AT_SOIL_SAMPLE ?AUTO_4201 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4202 ) ( STORE_OF ?AUTO_4207 ?AUTO_4202 ) ( EMPTY ?AUTO_4207 ) ( CAN_TRAVERSE ?AUTO_4202 ?AUTO_4208 ?AUTO_4201 ) ( AT ?AUTO_4202 ?AUTO_4208 ) ( VISIBLE ?AUTO_4208 ?AUTO_4201 ) ( not ( = ?AUTO_4201 ?AUTO_4208 ) ) ( not ( = ?AUTO_4205 ?AUTO_4208 ) ) ( not ( = ?AUTO_4206 ?AUTO_4208 ) ) ( not ( = ?AUTO_4203 ?AUTO_4208 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4202 ?AUTO_4208 ?AUTO_4201 )
      ( GET_SOIL_DATA ?AUTO_4201 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4201 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4211 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4212 - LANDER
      ?AUTO_4215 - WAYPOINT
      ?AUTO_4214 - WAYPOINT
      ?AUTO_4213 - ROVER
      ?AUTO_4218 - WAYPOINT
      ?AUTO_4217 - STORE
      ?AUTO_4216 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4212 ?AUTO_4215 ) ( VISIBLE ?AUTO_4214 ?AUTO_4215 ) ( AVAILABLE ?AUTO_4213 ) ( CHANNEL_FREE ?AUTO_4212 ) ( not ( = ?AUTO_4211 ?AUTO_4214 ) ) ( not ( = ?AUTO_4211 ?AUTO_4215 ) ) ( not ( = ?AUTO_4214 ?AUTO_4215 ) ) ( CAN_TRAVERSE ?AUTO_4213 ?AUTO_4218 ?AUTO_4214 ) ( VISIBLE ?AUTO_4218 ?AUTO_4214 ) ( not ( = ?AUTO_4211 ?AUTO_4218 ) ) ( not ( = ?AUTO_4215 ?AUTO_4218 ) ) ( not ( = ?AUTO_4214 ?AUTO_4218 ) ) ( CAN_TRAVERSE ?AUTO_4213 ?AUTO_4211 ?AUTO_4218 ) ( VISIBLE ?AUTO_4211 ?AUTO_4218 ) ( AT_SOIL_SAMPLE ?AUTO_4211 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4213 ) ( STORE_OF ?AUTO_4217 ?AUTO_4213 ) ( EMPTY ?AUTO_4217 ) ( CAN_TRAVERSE ?AUTO_4213 ?AUTO_4216 ?AUTO_4211 ) ( VISIBLE ?AUTO_4216 ?AUTO_4211 ) ( not ( = ?AUTO_4211 ?AUTO_4216 ) ) ( not ( = ?AUTO_4215 ?AUTO_4216 ) ) ( not ( = ?AUTO_4214 ?AUTO_4216 ) ) ( not ( = ?AUTO_4218 ?AUTO_4216 ) ) ( CAN_TRAVERSE ?AUTO_4213 ?AUTO_4215 ?AUTO_4216 ) ( AT ?AUTO_4213 ?AUTO_4215 ) ( VISIBLE ?AUTO_4215 ?AUTO_4216 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4213 ?AUTO_4215 ?AUTO_4216 )
      ( GET_SOIL_DATA ?AUTO_4211 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4211 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4220 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4224 - LANDER
      ?AUTO_4227 - WAYPOINT
      ?AUTO_4221 - WAYPOINT
      ?AUTO_4225 - ROVER
      ?AUTO_4223 - WAYPOINT
      ?AUTO_4226 - STORE
      ?AUTO_4222 - WAYPOINT
      ?AUTO_4228 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4224 ?AUTO_4227 ) ( VISIBLE ?AUTO_4221 ?AUTO_4227 ) ( AVAILABLE ?AUTO_4225 ) ( CHANNEL_FREE ?AUTO_4224 ) ( not ( = ?AUTO_4220 ?AUTO_4221 ) ) ( not ( = ?AUTO_4220 ?AUTO_4227 ) ) ( not ( = ?AUTO_4221 ?AUTO_4227 ) ) ( CAN_TRAVERSE ?AUTO_4225 ?AUTO_4223 ?AUTO_4221 ) ( VISIBLE ?AUTO_4223 ?AUTO_4221 ) ( not ( = ?AUTO_4220 ?AUTO_4223 ) ) ( not ( = ?AUTO_4227 ?AUTO_4223 ) ) ( not ( = ?AUTO_4221 ?AUTO_4223 ) ) ( CAN_TRAVERSE ?AUTO_4225 ?AUTO_4220 ?AUTO_4223 ) ( VISIBLE ?AUTO_4220 ?AUTO_4223 ) ( AT_SOIL_SAMPLE ?AUTO_4220 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4225 ) ( STORE_OF ?AUTO_4226 ?AUTO_4225 ) ( EMPTY ?AUTO_4226 ) ( CAN_TRAVERSE ?AUTO_4225 ?AUTO_4222 ?AUTO_4220 ) ( VISIBLE ?AUTO_4222 ?AUTO_4220 ) ( not ( = ?AUTO_4220 ?AUTO_4222 ) ) ( not ( = ?AUTO_4227 ?AUTO_4222 ) ) ( not ( = ?AUTO_4221 ?AUTO_4222 ) ) ( not ( = ?AUTO_4223 ?AUTO_4222 ) ) ( CAN_TRAVERSE ?AUTO_4225 ?AUTO_4227 ?AUTO_4222 ) ( VISIBLE ?AUTO_4227 ?AUTO_4222 ) ( CAN_TRAVERSE ?AUTO_4225 ?AUTO_4228 ?AUTO_4227 ) ( AT ?AUTO_4225 ?AUTO_4228 ) ( VISIBLE ?AUTO_4228 ?AUTO_4227 ) ( not ( = ?AUTO_4220 ?AUTO_4228 ) ) ( not ( = ?AUTO_4227 ?AUTO_4228 ) ) ( not ( = ?AUTO_4221 ?AUTO_4228 ) ) ( not ( = ?AUTO_4223 ?AUTO_4228 ) ) ( not ( = ?AUTO_4222 ?AUTO_4228 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4225 ?AUTO_4228 ?AUTO_4227 )
      ( GET_SOIL_DATA ?AUTO_4220 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4220 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4252 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4256 - LANDER
      ?AUTO_4257 - WAYPOINT
      ?AUTO_4254 - ROVER
      ?AUTO_4255 - STORE
      ?AUTO_4253 - WAYPOINT
      ?AUTO_4258 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4256 ?AUTO_4257 ) ( VISIBLE ?AUTO_4252 ?AUTO_4257 ) ( AVAILABLE ?AUTO_4254 ) ( CHANNEL_FREE ?AUTO_4256 ) ( not ( = ?AUTO_4252 ?AUTO_4257 ) ) ( AT_ROCK_SAMPLE ?AUTO_4252 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4254 ) ( STORE_OF ?AUTO_4255 ?AUTO_4254 ) ( CAN_TRAVERSE ?AUTO_4254 ?AUTO_4253 ?AUTO_4252 ) ( VISIBLE ?AUTO_4253 ?AUTO_4252 ) ( not ( = ?AUTO_4252 ?AUTO_4253 ) ) ( not ( = ?AUTO_4257 ?AUTO_4253 ) ) ( FULL ?AUTO_4255 ) ( CAN_TRAVERSE ?AUTO_4254 ?AUTO_4258 ?AUTO_4253 ) ( AT ?AUTO_4254 ?AUTO_4258 ) ( VISIBLE ?AUTO_4258 ?AUTO_4253 ) ( not ( = ?AUTO_4252 ?AUTO_4258 ) ) ( not ( = ?AUTO_4257 ?AUTO_4258 ) ) ( not ( = ?AUTO_4253 ?AUTO_4258 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4254 ?AUTO_4258 ?AUTO_4253 )
      ( GET_ROCK_DATA ?AUTO_4252 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4252 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4259 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4260 - LANDER
      ?AUTO_4261 - WAYPOINT
      ?AUTO_4263 - ROVER
      ?AUTO_4265 - STORE
      ?AUTO_4264 - WAYPOINT
      ?AUTO_4262 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4260 ?AUTO_4261 ) ( VISIBLE ?AUTO_4259 ?AUTO_4261 ) ( AVAILABLE ?AUTO_4263 ) ( CHANNEL_FREE ?AUTO_4260 ) ( not ( = ?AUTO_4259 ?AUTO_4261 ) ) ( AT_ROCK_SAMPLE ?AUTO_4259 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4263 ) ( STORE_OF ?AUTO_4265 ?AUTO_4263 ) ( CAN_TRAVERSE ?AUTO_4263 ?AUTO_4264 ?AUTO_4259 ) ( VISIBLE ?AUTO_4264 ?AUTO_4259 ) ( not ( = ?AUTO_4259 ?AUTO_4264 ) ) ( not ( = ?AUTO_4261 ?AUTO_4264 ) ) ( CAN_TRAVERSE ?AUTO_4263 ?AUTO_4262 ?AUTO_4264 ) ( AT ?AUTO_4263 ?AUTO_4262 ) ( VISIBLE ?AUTO_4262 ?AUTO_4264 ) ( not ( = ?AUTO_4259 ?AUTO_4262 ) ) ( not ( = ?AUTO_4261 ?AUTO_4262 ) ) ( not ( = ?AUTO_4264 ?AUTO_4262 ) ) ( AT_SOIL_SAMPLE ?AUTO_4262 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4263 ) ( EMPTY ?AUTO_4265 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4263 ?AUTO_4265 ?AUTO_4262 )
      ( GET_ROCK_DATA ?AUTO_4259 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4259 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5156 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5160 - LANDER
      ?AUTO_5162 - WAYPOINT
      ?AUTO_5159 - ROVER
      ?AUTO_5157 - STORE
      ?AUTO_5161 - WAYPOINT
      ?AUTO_5158 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5160 ?AUTO_5162 ) ( VISIBLE ?AUTO_5156 ?AUTO_5162 ) ( AVAILABLE ?AUTO_5159 ) ( CHANNEL_FREE ?AUTO_5160 ) ( not ( = ?AUTO_5156 ?AUTO_5162 ) ) ( AT_SOIL_SAMPLE ?AUTO_5156 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5159 ) ( STORE_OF ?AUTO_5157 ?AUTO_5159 ) ( CAN_TRAVERSE ?AUTO_5159 ?AUTO_5161 ?AUTO_5156 ) ( VISIBLE ?AUTO_5161 ?AUTO_5156 ) ( not ( = ?AUTO_5156 ?AUTO_5161 ) ) ( not ( = ?AUTO_5162 ?AUTO_5161 ) ) ( CAN_TRAVERSE ?AUTO_5159 ?AUTO_5158 ?AUTO_5161 ) ( AT ?AUTO_5159 ?AUTO_5158 ) ( VISIBLE ?AUTO_5158 ?AUTO_5161 ) ( not ( = ?AUTO_5156 ?AUTO_5158 ) ) ( not ( = ?AUTO_5162 ?AUTO_5158 ) ) ( not ( = ?AUTO_5161 ?AUTO_5158 ) ) ( FULL ?AUTO_5157 ) )
    :subtasks
    ( ( !DROP ?AUTO_5159 ?AUTO_5157 )
      ( GET_SOIL_DATA ?AUTO_5156 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5156 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4320 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4325 - LANDER
      ?AUTO_4326 - WAYPOINT
      ?AUTO_4322 - ROVER
      ?AUTO_4321 - STORE
      ?AUTO_4324 - WAYPOINT
      ?AUTO_4323 - WAYPOINT
      ?AUTO_4327 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4325 ?AUTO_4326 ) ( VISIBLE ?AUTO_4320 ?AUTO_4326 ) ( AVAILABLE ?AUTO_4322 ) ( CHANNEL_FREE ?AUTO_4325 ) ( not ( = ?AUTO_4320 ?AUTO_4326 ) ) ( AT_SOIL_SAMPLE ?AUTO_4320 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4322 ) ( STORE_OF ?AUTO_4321 ?AUTO_4322 ) ( CAN_TRAVERSE ?AUTO_4322 ?AUTO_4324 ?AUTO_4320 ) ( VISIBLE ?AUTO_4324 ?AUTO_4320 ) ( not ( = ?AUTO_4320 ?AUTO_4324 ) ) ( not ( = ?AUTO_4326 ?AUTO_4324 ) ) ( AT_ROCK_SAMPLE ?AUTO_4324 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4322 ) ( CAN_TRAVERSE ?AUTO_4322 ?AUTO_4323 ?AUTO_4324 ) ( VISIBLE ?AUTO_4323 ?AUTO_4324 ) ( not ( = ?AUTO_4320 ?AUTO_4323 ) ) ( not ( = ?AUTO_4326 ?AUTO_4323 ) ) ( not ( = ?AUTO_4324 ?AUTO_4323 ) ) ( FULL ?AUTO_4321 ) ( CAN_TRAVERSE ?AUTO_4322 ?AUTO_4327 ?AUTO_4323 ) ( AT ?AUTO_4322 ?AUTO_4327 ) ( VISIBLE ?AUTO_4327 ?AUTO_4323 ) ( not ( = ?AUTO_4320 ?AUTO_4327 ) ) ( not ( = ?AUTO_4326 ?AUTO_4327 ) ) ( not ( = ?AUTO_4324 ?AUTO_4327 ) ) ( not ( = ?AUTO_4323 ?AUTO_4327 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4322 ?AUTO_4327 ?AUTO_4323 )
      ( GET_SOIL_DATA ?AUTO_4320 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4320 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4328 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4335 - LANDER
      ?AUTO_4332 - WAYPOINT
      ?AUTO_4329 - ROVER
      ?AUTO_4330 - STORE
      ?AUTO_4331 - WAYPOINT
      ?AUTO_4333 - WAYPOINT
      ?AUTO_4334 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4335 ?AUTO_4332 ) ( VISIBLE ?AUTO_4328 ?AUTO_4332 ) ( AVAILABLE ?AUTO_4329 ) ( CHANNEL_FREE ?AUTO_4335 ) ( not ( = ?AUTO_4328 ?AUTO_4332 ) ) ( AT_SOIL_SAMPLE ?AUTO_4328 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4329 ) ( STORE_OF ?AUTO_4330 ?AUTO_4329 ) ( CAN_TRAVERSE ?AUTO_4329 ?AUTO_4331 ?AUTO_4328 ) ( VISIBLE ?AUTO_4331 ?AUTO_4328 ) ( not ( = ?AUTO_4328 ?AUTO_4331 ) ) ( not ( = ?AUTO_4332 ?AUTO_4331 ) ) ( AT_ROCK_SAMPLE ?AUTO_4331 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4329 ) ( CAN_TRAVERSE ?AUTO_4329 ?AUTO_4333 ?AUTO_4331 ) ( VISIBLE ?AUTO_4333 ?AUTO_4331 ) ( not ( = ?AUTO_4328 ?AUTO_4333 ) ) ( not ( = ?AUTO_4332 ?AUTO_4333 ) ) ( not ( = ?AUTO_4331 ?AUTO_4333 ) ) ( CAN_TRAVERSE ?AUTO_4329 ?AUTO_4334 ?AUTO_4333 ) ( AT ?AUTO_4329 ?AUTO_4334 ) ( VISIBLE ?AUTO_4334 ?AUTO_4333 ) ( not ( = ?AUTO_4328 ?AUTO_4334 ) ) ( not ( = ?AUTO_4332 ?AUTO_4334 ) ) ( not ( = ?AUTO_4331 ?AUTO_4334 ) ) ( not ( = ?AUTO_4333 ?AUTO_4334 ) ) ( AT_SOIL_SAMPLE ?AUTO_4334 ) ( EMPTY ?AUTO_4330 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4329 ?AUTO_4330 ?AUTO_4334 )
      ( GET_SOIL_DATA ?AUTO_4328 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4328 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4339 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4345 - LANDER
      ?AUTO_4344 - WAYPOINT
      ?AUTO_4343 - ROVER
      ?AUTO_4342 - STORE
      ?AUTO_4341 - WAYPOINT
      ?AUTO_4340 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4345 ?AUTO_4344 ) ( VISIBLE ?AUTO_4339 ?AUTO_4344 ) ( AVAILABLE ?AUTO_4343 ) ( CHANNEL_FREE ?AUTO_4345 ) ( not ( = ?AUTO_4339 ?AUTO_4344 ) ) ( AT_SOIL_SAMPLE ?AUTO_4339 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4343 ) ( STORE_OF ?AUTO_4342 ?AUTO_4343 ) ( CAN_TRAVERSE ?AUTO_4343 ?AUTO_4341 ?AUTO_4339 ) ( VISIBLE ?AUTO_4341 ?AUTO_4339 ) ( not ( = ?AUTO_4339 ?AUTO_4341 ) ) ( not ( = ?AUTO_4344 ?AUTO_4341 ) ) ( AT_ROCK_SAMPLE ?AUTO_4341 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4343 ) ( EMPTY ?AUTO_4342 ) ( CAN_TRAVERSE ?AUTO_4343 ?AUTO_4340 ?AUTO_4341 ) ( VISIBLE ?AUTO_4340 ?AUTO_4341 ) ( not ( = ?AUTO_4339 ?AUTO_4340 ) ) ( not ( = ?AUTO_4344 ?AUTO_4340 ) ) ( not ( = ?AUTO_4341 ?AUTO_4340 ) ) ( CAN_TRAVERSE ?AUTO_4343 ?AUTO_4344 ?AUTO_4340 ) ( AT ?AUTO_4343 ?AUTO_4344 ) ( VISIBLE ?AUTO_4344 ?AUTO_4340 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4343 ?AUTO_4344 ?AUTO_4340 )
      ( GET_SOIL_DATA ?AUTO_4339 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4339 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4370 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4371 - LANDER
      ?AUTO_4373 - WAYPOINT
      ?AUTO_4372 - ROVER
      ?AUTO_4374 - STORE
      ?AUTO_4375 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4371 ?AUTO_4370 ) ( VISIBLE ?AUTO_4373 ?AUTO_4370 ) ( AVAILABLE ?AUTO_4372 ) ( CHANNEL_FREE ?AUTO_4371 ) ( not ( = ?AUTO_4370 ?AUTO_4373 ) ) ( CAN_TRAVERSE ?AUTO_4372 ?AUTO_4370 ?AUTO_4373 ) ( VISIBLE ?AUTO_4370 ?AUTO_4373 ) ( AT_SOIL_SAMPLE ?AUTO_4370 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4372 ) ( STORE_OF ?AUTO_4374 ?AUTO_4372 ) ( CAN_TRAVERSE ?AUTO_4372 ?AUTO_4375 ?AUTO_4370 ) ( AT ?AUTO_4372 ?AUTO_4375 ) ( VISIBLE ?AUTO_4375 ?AUTO_4370 ) ( not ( = ?AUTO_4370 ?AUTO_4375 ) ) ( not ( = ?AUTO_4373 ?AUTO_4375 ) ) ( FULL ?AUTO_4374 ) )
    :subtasks
    ( ( !DROP ?AUTO_4372 ?AUTO_4374 )
      ( GET_SOIL_DATA ?AUTO_4370 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4370 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5705 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5710 - LANDER
      ?AUTO_5708 - WAYPOINT
      ?AUTO_5709 - ROVER
      ?AUTO_5706 - STORE
      ?AUTO_5711 - WAYPOINT
      ?AUTO_5712 - WAYPOINT
      ?AUTO_5707 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5710 ?AUTO_5705 ) ( VISIBLE ?AUTO_5708 ?AUTO_5705 ) ( AVAILABLE ?AUTO_5709 ) ( CHANNEL_FREE ?AUTO_5710 ) ( not ( = ?AUTO_5705 ?AUTO_5708 ) ) ( CAN_TRAVERSE ?AUTO_5709 ?AUTO_5705 ?AUTO_5708 ) ( VISIBLE ?AUTO_5705 ?AUTO_5708 ) ( AT_SOIL_SAMPLE ?AUTO_5705 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5709 ) ( STORE_OF ?AUTO_5706 ?AUTO_5709 ) ( CAN_TRAVERSE ?AUTO_5709 ?AUTO_5711 ?AUTO_5705 ) ( VISIBLE ?AUTO_5711 ?AUTO_5705 ) ( not ( = ?AUTO_5705 ?AUTO_5711 ) ) ( not ( = ?AUTO_5708 ?AUTO_5711 ) ) ( CAN_TRAVERSE ?AUTO_5709 ?AUTO_5712 ?AUTO_5711 ) ( VISIBLE ?AUTO_5712 ?AUTO_5711 ) ( not ( = ?AUTO_5705 ?AUTO_5712 ) ) ( not ( = ?AUTO_5708 ?AUTO_5712 ) ) ( not ( = ?AUTO_5711 ?AUTO_5712 ) ) ( CAN_TRAVERSE ?AUTO_5709 ?AUTO_5707 ?AUTO_5712 ) ( AT ?AUTO_5709 ?AUTO_5707 ) ( VISIBLE ?AUTO_5707 ?AUTO_5712 ) ( not ( = ?AUTO_5705 ?AUTO_5707 ) ) ( not ( = ?AUTO_5708 ?AUTO_5707 ) ) ( not ( = ?AUTO_5711 ?AUTO_5707 ) ) ( not ( = ?AUTO_5712 ?AUTO_5707 ) ) ( FULL ?AUTO_5706 ) )
    :subtasks
    ( ( !DROP ?AUTO_5709 ?AUTO_5706 )
      ( GET_SOIL_DATA ?AUTO_5705 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5705 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4411 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4418 - LANDER
      ?AUTO_4414 - WAYPOINT
      ?AUTO_4412 - ROVER
      ?AUTO_4416 - STORE
      ?AUTO_4413 - WAYPOINT
      ?AUTO_4415 - WAYPOINT
      ?AUTO_4417 - WAYPOINT
      ?AUTO_4419 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4418 ?AUTO_4411 ) ( VISIBLE ?AUTO_4414 ?AUTO_4411 ) ( AVAILABLE ?AUTO_4412 ) ( CHANNEL_FREE ?AUTO_4418 ) ( not ( = ?AUTO_4411 ?AUTO_4414 ) ) ( CAN_TRAVERSE ?AUTO_4412 ?AUTO_4411 ?AUTO_4414 ) ( VISIBLE ?AUTO_4411 ?AUTO_4414 ) ( AT_SOIL_SAMPLE ?AUTO_4411 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4412 ) ( STORE_OF ?AUTO_4416 ?AUTO_4412 ) ( CAN_TRAVERSE ?AUTO_4412 ?AUTO_4413 ?AUTO_4411 ) ( VISIBLE ?AUTO_4413 ?AUTO_4411 ) ( not ( = ?AUTO_4411 ?AUTO_4413 ) ) ( not ( = ?AUTO_4414 ?AUTO_4413 ) ) ( CAN_TRAVERSE ?AUTO_4412 ?AUTO_4415 ?AUTO_4413 ) ( VISIBLE ?AUTO_4415 ?AUTO_4413 ) ( not ( = ?AUTO_4411 ?AUTO_4415 ) ) ( not ( = ?AUTO_4414 ?AUTO_4415 ) ) ( not ( = ?AUTO_4413 ?AUTO_4415 ) ) ( AT_ROCK_SAMPLE ?AUTO_4415 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4412 ) ( CAN_TRAVERSE ?AUTO_4412 ?AUTO_4417 ?AUTO_4415 ) ( VISIBLE ?AUTO_4417 ?AUTO_4415 ) ( not ( = ?AUTO_4411 ?AUTO_4417 ) ) ( not ( = ?AUTO_4414 ?AUTO_4417 ) ) ( not ( = ?AUTO_4413 ?AUTO_4417 ) ) ( not ( = ?AUTO_4415 ?AUTO_4417 ) ) ( FULL ?AUTO_4416 ) ( CAN_TRAVERSE ?AUTO_4412 ?AUTO_4419 ?AUTO_4417 ) ( AT ?AUTO_4412 ?AUTO_4419 ) ( VISIBLE ?AUTO_4419 ?AUTO_4417 ) ( not ( = ?AUTO_4411 ?AUTO_4419 ) ) ( not ( = ?AUTO_4414 ?AUTO_4419 ) ) ( not ( = ?AUTO_4413 ?AUTO_4419 ) ) ( not ( = ?AUTO_4415 ?AUTO_4419 ) ) ( not ( = ?AUTO_4417 ?AUTO_4419 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4412 ?AUTO_4419 ?AUTO_4417 )
      ( GET_SOIL_DATA ?AUTO_4411 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4411 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4420 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4422 - LANDER
      ?AUTO_4426 - WAYPOINT
      ?AUTO_4425 - ROVER
      ?AUTO_4423 - STORE
      ?AUTO_4421 - WAYPOINT
      ?AUTO_4428 - WAYPOINT
      ?AUTO_4424 - WAYPOINT
      ?AUTO_4427 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4422 ?AUTO_4420 ) ( VISIBLE ?AUTO_4426 ?AUTO_4420 ) ( AVAILABLE ?AUTO_4425 ) ( CHANNEL_FREE ?AUTO_4422 ) ( not ( = ?AUTO_4420 ?AUTO_4426 ) ) ( CAN_TRAVERSE ?AUTO_4425 ?AUTO_4420 ?AUTO_4426 ) ( VISIBLE ?AUTO_4420 ?AUTO_4426 ) ( AT_SOIL_SAMPLE ?AUTO_4420 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4425 ) ( STORE_OF ?AUTO_4423 ?AUTO_4425 ) ( CAN_TRAVERSE ?AUTO_4425 ?AUTO_4421 ?AUTO_4420 ) ( VISIBLE ?AUTO_4421 ?AUTO_4420 ) ( not ( = ?AUTO_4420 ?AUTO_4421 ) ) ( not ( = ?AUTO_4426 ?AUTO_4421 ) ) ( CAN_TRAVERSE ?AUTO_4425 ?AUTO_4428 ?AUTO_4421 ) ( VISIBLE ?AUTO_4428 ?AUTO_4421 ) ( not ( = ?AUTO_4420 ?AUTO_4428 ) ) ( not ( = ?AUTO_4426 ?AUTO_4428 ) ) ( not ( = ?AUTO_4421 ?AUTO_4428 ) ) ( AT_ROCK_SAMPLE ?AUTO_4428 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4425 ) ( CAN_TRAVERSE ?AUTO_4425 ?AUTO_4424 ?AUTO_4428 ) ( VISIBLE ?AUTO_4424 ?AUTO_4428 ) ( not ( = ?AUTO_4420 ?AUTO_4424 ) ) ( not ( = ?AUTO_4426 ?AUTO_4424 ) ) ( not ( = ?AUTO_4421 ?AUTO_4424 ) ) ( not ( = ?AUTO_4428 ?AUTO_4424 ) ) ( CAN_TRAVERSE ?AUTO_4425 ?AUTO_4427 ?AUTO_4424 ) ( AT ?AUTO_4425 ?AUTO_4427 ) ( VISIBLE ?AUTO_4427 ?AUTO_4424 ) ( not ( = ?AUTO_4420 ?AUTO_4427 ) ) ( not ( = ?AUTO_4426 ?AUTO_4427 ) ) ( not ( = ?AUTO_4421 ?AUTO_4427 ) ) ( not ( = ?AUTO_4428 ?AUTO_4427 ) ) ( not ( = ?AUTO_4424 ?AUTO_4427 ) ) ( AT_SOIL_SAMPLE ?AUTO_4427 ) ( EMPTY ?AUTO_4423 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4425 ?AUTO_4423 ?AUTO_4427 )
      ( GET_SOIL_DATA ?AUTO_4420 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4420 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4429 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4431 - LANDER
      ?AUTO_4430 - WAYPOINT
      ?AUTO_4435 - ROVER
      ?AUTO_4436 - STORE
      ?AUTO_4437 - WAYPOINT
      ?AUTO_4433 - WAYPOINT
      ?AUTO_4432 - WAYPOINT
      ?AUTO_4434 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4431 ?AUTO_4429 ) ( VISIBLE ?AUTO_4430 ?AUTO_4429 ) ( AVAILABLE ?AUTO_4435 ) ( CHANNEL_FREE ?AUTO_4431 ) ( not ( = ?AUTO_4429 ?AUTO_4430 ) ) ( CAN_TRAVERSE ?AUTO_4435 ?AUTO_4429 ?AUTO_4430 ) ( VISIBLE ?AUTO_4429 ?AUTO_4430 ) ( AT_SOIL_SAMPLE ?AUTO_4429 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4435 ) ( STORE_OF ?AUTO_4436 ?AUTO_4435 ) ( CAN_TRAVERSE ?AUTO_4435 ?AUTO_4437 ?AUTO_4429 ) ( VISIBLE ?AUTO_4437 ?AUTO_4429 ) ( not ( = ?AUTO_4429 ?AUTO_4437 ) ) ( not ( = ?AUTO_4430 ?AUTO_4437 ) ) ( CAN_TRAVERSE ?AUTO_4435 ?AUTO_4433 ?AUTO_4437 ) ( VISIBLE ?AUTO_4433 ?AUTO_4437 ) ( not ( = ?AUTO_4429 ?AUTO_4433 ) ) ( not ( = ?AUTO_4430 ?AUTO_4433 ) ) ( not ( = ?AUTO_4437 ?AUTO_4433 ) ) ( AT_ROCK_SAMPLE ?AUTO_4433 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4435 ) ( CAN_TRAVERSE ?AUTO_4435 ?AUTO_4432 ?AUTO_4433 ) ( VISIBLE ?AUTO_4432 ?AUTO_4433 ) ( not ( = ?AUTO_4429 ?AUTO_4432 ) ) ( not ( = ?AUTO_4430 ?AUTO_4432 ) ) ( not ( = ?AUTO_4437 ?AUTO_4432 ) ) ( not ( = ?AUTO_4433 ?AUTO_4432 ) ) ( CAN_TRAVERSE ?AUTO_4435 ?AUTO_4434 ?AUTO_4432 ) ( VISIBLE ?AUTO_4434 ?AUTO_4432 ) ( not ( = ?AUTO_4429 ?AUTO_4434 ) ) ( not ( = ?AUTO_4430 ?AUTO_4434 ) ) ( not ( = ?AUTO_4437 ?AUTO_4434 ) ) ( not ( = ?AUTO_4433 ?AUTO_4434 ) ) ( not ( = ?AUTO_4432 ?AUTO_4434 ) ) ( AT_SOIL_SAMPLE ?AUTO_4434 ) ( EMPTY ?AUTO_4436 ) ( CAN_TRAVERSE ?AUTO_4435 ?AUTO_4430 ?AUTO_4434 ) ( AT ?AUTO_4435 ?AUTO_4430 ) ( VISIBLE ?AUTO_4430 ?AUTO_4434 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4435 ?AUTO_4430 ?AUTO_4434 )
      ( GET_SOIL_DATA ?AUTO_4429 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4429 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4503 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4505 - LANDER
      ?AUTO_4507 - WAYPOINT
      ?AUTO_4506 - ROVER
      ?AUTO_4509 - STORE
      ?AUTO_4508 - WAYPOINT
      ?AUTO_4504 - WAYPOINT
      ?AUTO_4510 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4505 ?AUTO_4503 ) ( VISIBLE ?AUTO_4507 ?AUTO_4503 ) ( AVAILABLE ?AUTO_4506 ) ( CHANNEL_FREE ?AUTO_4505 ) ( not ( = ?AUTO_4503 ?AUTO_4507 ) ) ( CAN_TRAVERSE ?AUTO_4506 ?AUTO_4503 ?AUTO_4507 ) ( VISIBLE ?AUTO_4503 ?AUTO_4507 ) ( AT_ROCK_SAMPLE ?AUTO_4503 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4506 ) ( STORE_OF ?AUTO_4509 ?AUTO_4506 ) ( CAN_TRAVERSE ?AUTO_4506 ?AUTO_4508 ?AUTO_4503 ) ( VISIBLE ?AUTO_4508 ?AUTO_4503 ) ( not ( = ?AUTO_4503 ?AUTO_4508 ) ) ( not ( = ?AUTO_4507 ?AUTO_4508 ) ) ( CAN_TRAVERSE ?AUTO_4506 ?AUTO_4504 ?AUTO_4508 ) ( VISIBLE ?AUTO_4504 ?AUTO_4508 ) ( not ( = ?AUTO_4503 ?AUTO_4504 ) ) ( not ( = ?AUTO_4507 ?AUTO_4504 ) ) ( not ( = ?AUTO_4508 ?AUTO_4504 ) ) ( AT_ROCK_SAMPLE ?AUTO_4504 ) ( CAN_TRAVERSE ?AUTO_4506 ?AUTO_4510 ?AUTO_4504 ) ( AT ?AUTO_4506 ?AUTO_4510 ) ( VISIBLE ?AUTO_4510 ?AUTO_4504 ) ( not ( = ?AUTO_4503 ?AUTO_4510 ) ) ( not ( = ?AUTO_4507 ?AUTO_4510 ) ) ( not ( = ?AUTO_4508 ?AUTO_4510 ) ) ( not ( = ?AUTO_4504 ?AUTO_4510 ) ) ( FULL ?AUTO_4509 ) )
    :subtasks
    ( ( !DROP ?AUTO_4506 ?AUTO_4509 )
      ( GET_ROCK_DATA ?AUTO_4503 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4503 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4511 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4516 - LANDER
      ?AUTO_4518 - WAYPOINT
      ?AUTO_4512 - ROVER
      ?AUTO_4517 - STORE
      ?AUTO_4515 - WAYPOINT
      ?AUTO_4513 - WAYPOINT
      ?AUTO_4514 - WAYPOINT
      ?AUTO_4519 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4516 ?AUTO_4511 ) ( VISIBLE ?AUTO_4518 ?AUTO_4511 ) ( AVAILABLE ?AUTO_4512 ) ( CHANNEL_FREE ?AUTO_4516 ) ( not ( = ?AUTO_4511 ?AUTO_4518 ) ) ( CAN_TRAVERSE ?AUTO_4512 ?AUTO_4511 ?AUTO_4518 ) ( VISIBLE ?AUTO_4511 ?AUTO_4518 ) ( AT_ROCK_SAMPLE ?AUTO_4511 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4512 ) ( STORE_OF ?AUTO_4517 ?AUTO_4512 ) ( CAN_TRAVERSE ?AUTO_4512 ?AUTO_4515 ?AUTO_4511 ) ( VISIBLE ?AUTO_4515 ?AUTO_4511 ) ( not ( = ?AUTO_4511 ?AUTO_4515 ) ) ( not ( = ?AUTO_4518 ?AUTO_4515 ) ) ( CAN_TRAVERSE ?AUTO_4512 ?AUTO_4513 ?AUTO_4515 ) ( VISIBLE ?AUTO_4513 ?AUTO_4515 ) ( not ( = ?AUTO_4511 ?AUTO_4513 ) ) ( not ( = ?AUTO_4518 ?AUTO_4513 ) ) ( not ( = ?AUTO_4515 ?AUTO_4513 ) ) ( AT_ROCK_SAMPLE ?AUTO_4513 ) ( CAN_TRAVERSE ?AUTO_4512 ?AUTO_4514 ?AUTO_4513 ) ( VISIBLE ?AUTO_4514 ?AUTO_4513 ) ( not ( = ?AUTO_4511 ?AUTO_4514 ) ) ( not ( = ?AUTO_4518 ?AUTO_4514 ) ) ( not ( = ?AUTO_4515 ?AUTO_4514 ) ) ( not ( = ?AUTO_4513 ?AUTO_4514 ) ) ( FULL ?AUTO_4517 ) ( CAN_TRAVERSE ?AUTO_4512 ?AUTO_4519 ?AUTO_4514 ) ( AT ?AUTO_4512 ?AUTO_4519 ) ( VISIBLE ?AUTO_4519 ?AUTO_4514 ) ( not ( = ?AUTO_4511 ?AUTO_4519 ) ) ( not ( = ?AUTO_4518 ?AUTO_4519 ) ) ( not ( = ?AUTO_4515 ?AUTO_4519 ) ) ( not ( = ?AUTO_4513 ?AUTO_4519 ) ) ( not ( = ?AUTO_4514 ?AUTO_4519 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4512 ?AUTO_4519 ?AUTO_4514 )
      ( GET_ROCK_DATA ?AUTO_4511 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4511 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4520 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4527 - LANDER
      ?AUTO_4524 - WAYPOINT
      ?AUTO_4522 - ROVER
      ?AUTO_4521 - STORE
      ?AUTO_4523 - WAYPOINT
      ?AUTO_4525 - WAYPOINT
      ?AUTO_4528 - WAYPOINT
      ?AUTO_4526 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4527 ?AUTO_4520 ) ( VISIBLE ?AUTO_4524 ?AUTO_4520 ) ( AVAILABLE ?AUTO_4522 ) ( CHANNEL_FREE ?AUTO_4527 ) ( not ( = ?AUTO_4520 ?AUTO_4524 ) ) ( CAN_TRAVERSE ?AUTO_4522 ?AUTO_4520 ?AUTO_4524 ) ( VISIBLE ?AUTO_4520 ?AUTO_4524 ) ( AT_ROCK_SAMPLE ?AUTO_4520 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4522 ) ( STORE_OF ?AUTO_4521 ?AUTO_4522 ) ( CAN_TRAVERSE ?AUTO_4522 ?AUTO_4523 ?AUTO_4520 ) ( VISIBLE ?AUTO_4523 ?AUTO_4520 ) ( not ( = ?AUTO_4520 ?AUTO_4523 ) ) ( not ( = ?AUTO_4524 ?AUTO_4523 ) ) ( CAN_TRAVERSE ?AUTO_4522 ?AUTO_4525 ?AUTO_4523 ) ( VISIBLE ?AUTO_4525 ?AUTO_4523 ) ( not ( = ?AUTO_4520 ?AUTO_4525 ) ) ( not ( = ?AUTO_4524 ?AUTO_4525 ) ) ( not ( = ?AUTO_4523 ?AUTO_4525 ) ) ( AT_ROCK_SAMPLE ?AUTO_4525 ) ( CAN_TRAVERSE ?AUTO_4522 ?AUTO_4528 ?AUTO_4525 ) ( VISIBLE ?AUTO_4528 ?AUTO_4525 ) ( not ( = ?AUTO_4520 ?AUTO_4528 ) ) ( not ( = ?AUTO_4524 ?AUTO_4528 ) ) ( not ( = ?AUTO_4523 ?AUTO_4528 ) ) ( not ( = ?AUTO_4525 ?AUTO_4528 ) ) ( CAN_TRAVERSE ?AUTO_4522 ?AUTO_4526 ?AUTO_4528 ) ( AT ?AUTO_4522 ?AUTO_4526 ) ( VISIBLE ?AUTO_4526 ?AUTO_4528 ) ( not ( = ?AUTO_4520 ?AUTO_4526 ) ) ( not ( = ?AUTO_4524 ?AUTO_4526 ) ) ( not ( = ?AUTO_4523 ?AUTO_4526 ) ) ( not ( = ?AUTO_4525 ?AUTO_4526 ) ) ( not ( = ?AUTO_4528 ?AUTO_4526 ) ) ( AT_SOIL_SAMPLE ?AUTO_4526 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4522 ) ( EMPTY ?AUTO_4521 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_4522 ?AUTO_4521 ?AUTO_4526 )
      ( GET_ROCK_DATA ?AUTO_4520 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4520 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4529 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4531 - LANDER
      ?AUTO_4537 - WAYPOINT
      ?AUTO_4532 - ROVER
      ?AUTO_4533 - STORE
      ?AUTO_4534 - WAYPOINT
      ?AUTO_4535 - WAYPOINT
      ?AUTO_4530 - WAYPOINT
      ?AUTO_4536 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4531 ?AUTO_4529 ) ( VISIBLE ?AUTO_4537 ?AUTO_4529 ) ( AVAILABLE ?AUTO_4532 ) ( CHANNEL_FREE ?AUTO_4531 ) ( not ( = ?AUTO_4529 ?AUTO_4537 ) ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4529 ?AUTO_4537 ) ( VISIBLE ?AUTO_4529 ?AUTO_4537 ) ( AT_ROCK_SAMPLE ?AUTO_4529 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4532 ) ( STORE_OF ?AUTO_4533 ?AUTO_4532 ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4534 ?AUTO_4529 ) ( VISIBLE ?AUTO_4534 ?AUTO_4529 ) ( not ( = ?AUTO_4529 ?AUTO_4534 ) ) ( not ( = ?AUTO_4537 ?AUTO_4534 ) ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4535 ?AUTO_4534 ) ( VISIBLE ?AUTO_4535 ?AUTO_4534 ) ( not ( = ?AUTO_4529 ?AUTO_4535 ) ) ( not ( = ?AUTO_4537 ?AUTO_4535 ) ) ( not ( = ?AUTO_4534 ?AUTO_4535 ) ) ( AT_ROCK_SAMPLE ?AUTO_4535 ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4530 ?AUTO_4535 ) ( VISIBLE ?AUTO_4530 ?AUTO_4535 ) ( not ( = ?AUTO_4529 ?AUTO_4530 ) ) ( not ( = ?AUTO_4537 ?AUTO_4530 ) ) ( not ( = ?AUTO_4534 ?AUTO_4530 ) ) ( not ( = ?AUTO_4535 ?AUTO_4530 ) ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4536 ?AUTO_4530 ) ( VISIBLE ?AUTO_4536 ?AUTO_4530 ) ( not ( = ?AUTO_4529 ?AUTO_4536 ) ) ( not ( = ?AUTO_4537 ?AUTO_4536 ) ) ( not ( = ?AUTO_4534 ?AUTO_4536 ) ) ( not ( = ?AUTO_4535 ?AUTO_4536 ) ) ( not ( = ?AUTO_4530 ?AUTO_4536 ) ) ( AT_SOIL_SAMPLE ?AUTO_4536 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4532 ) ( EMPTY ?AUTO_4533 ) ( CAN_TRAVERSE ?AUTO_4532 ?AUTO_4537 ?AUTO_4536 ) ( AT ?AUTO_4532 ?AUTO_4537 ) ( VISIBLE ?AUTO_4537 ?AUTO_4536 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4532 ?AUTO_4537 ?AUTO_4536 )
      ( GET_ROCK_DATA ?AUTO_4529 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4529 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4561 - OBJECTIVE
      ?AUTO_4562 - MODE
    )
    :vars
    (
      ?AUTO_4563 - LANDER
      ?AUTO_4566 - WAYPOINT
      ?AUTO_4567 - WAYPOINT
      ?AUTO_4565 - ROVER
      ?AUTO_4568 - CAMERA
      ?AUTO_4564 - WAYPOINT
      ?AUTO_4569 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4563 ?AUTO_4566 ) ( VISIBLE ?AUTO_4567 ?AUTO_4566 ) ( AVAILABLE ?AUTO_4565 ) ( CHANNEL_FREE ?AUTO_4563 ) ( not ( = ?AUTO_4567 ?AUTO_4566 ) ) ( CALIBRATED ?AUTO_4568 ?AUTO_4565 ) ( ON_BOARD ?AUTO_4568 ?AUTO_4565 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4565 ) ( SUPPORTS ?AUTO_4568 ?AUTO_4562 ) ( VISIBLE_FROM ?AUTO_4561 ?AUTO_4567 ) ( CAN_TRAVERSE ?AUTO_4565 ?AUTO_4564 ?AUTO_4567 ) ( VISIBLE ?AUTO_4564 ?AUTO_4567 ) ( not ( = ?AUTO_4566 ?AUTO_4564 ) ) ( not ( = ?AUTO_4567 ?AUTO_4564 ) ) ( CAN_TRAVERSE ?AUTO_4565 ?AUTO_4569 ?AUTO_4564 ) ( AT ?AUTO_4565 ?AUTO_4569 ) ( VISIBLE ?AUTO_4569 ?AUTO_4564 ) ( not ( = ?AUTO_4566 ?AUTO_4569 ) ) ( not ( = ?AUTO_4567 ?AUTO_4569 ) ) ( not ( = ?AUTO_4564 ?AUTO_4569 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4565 ?AUTO_4569 ?AUTO_4564 )
      ( GET_IMAGE_DATA ?AUTO_4561 ?AUTO_4562 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4561 ?AUTO_4562 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4572 - OBJECTIVE
      ?AUTO_4573 - MODE
    )
    :vars
    (
      ?AUTO_4577 - LANDER
      ?AUTO_4576 - WAYPOINT
      ?AUTO_4580 - WAYPOINT
      ?AUTO_4574 - ROVER
      ?AUTO_4575 - CAMERA
      ?AUTO_4578 - WAYPOINT
      ?AUTO_4579 - WAYPOINT
      ?AUTO_4581 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4577 ?AUTO_4576 ) ( VISIBLE ?AUTO_4580 ?AUTO_4576 ) ( AVAILABLE ?AUTO_4574 ) ( CHANNEL_FREE ?AUTO_4577 ) ( not ( = ?AUTO_4580 ?AUTO_4576 ) ) ( ON_BOARD ?AUTO_4575 ?AUTO_4574 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4574 ) ( SUPPORTS ?AUTO_4575 ?AUTO_4573 ) ( VISIBLE_FROM ?AUTO_4572 ?AUTO_4580 ) ( CAN_TRAVERSE ?AUTO_4574 ?AUTO_4578 ?AUTO_4580 ) ( VISIBLE ?AUTO_4578 ?AUTO_4580 ) ( not ( = ?AUTO_4576 ?AUTO_4578 ) ) ( not ( = ?AUTO_4580 ?AUTO_4578 ) ) ( CAN_TRAVERSE ?AUTO_4574 ?AUTO_4579 ?AUTO_4578 ) ( AT ?AUTO_4574 ?AUTO_4579 ) ( VISIBLE ?AUTO_4579 ?AUTO_4578 ) ( not ( = ?AUTO_4576 ?AUTO_4579 ) ) ( not ( = ?AUTO_4580 ?AUTO_4579 ) ) ( not ( = ?AUTO_4578 ?AUTO_4579 ) ) ( CALIBRATION_TARGET ?AUTO_4575 ?AUTO_4581 ) ( VISIBLE_FROM ?AUTO_4581 ?AUTO_4579 ) ( not ( = ?AUTO_4572 ?AUTO_4581 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_4574 ?AUTO_4575 ?AUTO_4581 ?AUTO_4579 )
      ( GET_IMAGE_DATA ?AUTO_4572 ?AUTO_4573 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4572 ?AUTO_4573 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4766 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4769 - LANDER
      ?AUTO_4767 - WAYPOINT
      ?AUTO_4770 - ROVER
      ?AUTO_4771 - STORE
      ?AUTO_4768 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4769 ?AUTO_4766 ) ( VISIBLE ?AUTO_4767 ?AUTO_4766 ) ( AVAILABLE ?AUTO_4770 ) ( CHANNEL_FREE ?AUTO_4769 ) ( not ( = ?AUTO_4766 ?AUTO_4767 ) ) ( CAN_TRAVERSE ?AUTO_4770 ?AUTO_4766 ?AUTO_4767 ) ( VISIBLE ?AUTO_4766 ?AUTO_4767 ) ( AT_SOIL_SAMPLE ?AUTO_4766 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4770 ) ( STORE_OF ?AUTO_4771 ?AUTO_4770 ) ( CAN_TRAVERSE ?AUTO_4770 ?AUTO_4768 ?AUTO_4766 ) ( AT ?AUTO_4770 ?AUTO_4768 ) ( VISIBLE ?AUTO_4768 ?AUTO_4766 ) ( not ( = ?AUTO_4766 ?AUTO_4768 ) ) ( not ( = ?AUTO_4767 ?AUTO_4768 ) ) ( AT_ROCK_SAMPLE ?AUTO_4768 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4770 ) ( EMPTY ?AUTO_4771 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_4770 ?AUTO_4771 ?AUTO_4768 )
      ( GET_SOIL_DATA ?AUTO_4766 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4766 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8135 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8136 - LANDER
      ?AUTO_8137 - WAYPOINT
      ?AUTO_8140 - ROVER
      ?AUTO_8139 - STORE
      ?AUTO_8138 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8136 ?AUTO_8135 ) ( VISIBLE ?AUTO_8137 ?AUTO_8135 ) ( AVAILABLE ?AUTO_8140 ) ( CHANNEL_FREE ?AUTO_8136 ) ( not ( = ?AUTO_8135 ?AUTO_8137 ) ) ( CAN_TRAVERSE ?AUTO_8140 ?AUTO_8135 ?AUTO_8137 ) ( VISIBLE ?AUTO_8135 ?AUTO_8137 ) ( AT_SOIL_SAMPLE ?AUTO_8135 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8140 ) ( STORE_OF ?AUTO_8139 ?AUTO_8140 ) ( EMPTY ?AUTO_8139 ) ( CAN_TRAVERSE ?AUTO_8140 ?AUTO_8138 ?AUTO_8135 ) ( VISIBLE ?AUTO_8138 ?AUTO_8135 ) ( not ( = ?AUTO_8135 ?AUTO_8138 ) ) ( not ( = ?AUTO_8137 ?AUTO_8138 ) ) ( CAN_TRAVERSE ?AUTO_8140 ?AUTO_8137 ?AUTO_8138 ) ( AT ?AUTO_8140 ?AUTO_8137 ) ( VISIBLE ?AUTO_8137 ?AUTO_8138 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8140 ?AUTO_8137 ?AUTO_8138 )
      ( GET_SOIL_DATA ?AUTO_8135 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8135 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_4788 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4793 - LANDER
      ?AUTO_4791 - WAYPOINT
      ?AUTO_4789 - ROVER
      ?AUTO_4792 - STORE
      ?AUTO_4790 - WAYPOINT
      ?AUTO_4794 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4793 ?AUTO_4788 ) ( VISIBLE ?AUTO_4791 ?AUTO_4788 ) ( AVAILABLE ?AUTO_4789 ) ( CHANNEL_FREE ?AUTO_4793 ) ( not ( = ?AUTO_4788 ?AUTO_4791 ) ) ( CAN_TRAVERSE ?AUTO_4789 ?AUTO_4788 ?AUTO_4791 ) ( VISIBLE ?AUTO_4788 ?AUTO_4791 ) ( AT_SOIL_SAMPLE ?AUTO_4788 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_4789 ) ( STORE_OF ?AUTO_4792 ?AUTO_4789 ) ( CAN_TRAVERSE ?AUTO_4789 ?AUTO_4790 ?AUTO_4788 ) ( VISIBLE ?AUTO_4790 ?AUTO_4788 ) ( not ( = ?AUTO_4788 ?AUTO_4790 ) ) ( not ( = ?AUTO_4791 ?AUTO_4790 ) ) ( AT_ROCK_SAMPLE ?AUTO_4790 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4789 ) ( EMPTY ?AUTO_4792 ) ( CAN_TRAVERSE ?AUTO_4789 ?AUTO_4791 ?AUTO_4790 ) ( VISIBLE ?AUTO_4791 ?AUTO_4790 ) ( CAN_TRAVERSE ?AUTO_4789 ?AUTO_4794 ?AUTO_4791 ) ( AT ?AUTO_4789 ?AUTO_4794 ) ( VISIBLE ?AUTO_4794 ?AUTO_4791 ) ( not ( = ?AUTO_4788 ?AUTO_4794 ) ) ( not ( = ?AUTO_4791 ?AUTO_4794 ) ) ( not ( = ?AUTO_4790 ?AUTO_4794 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4789 ?AUTO_4794 ?AUTO_4791 )
      ( GET_SOIL_DATA ?AUTO_4788 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_4788 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_4827 - WAYPOINT
    )
    :vars
    (
      ?AUTO_4829 - LANDER
      ?AUTO_4832 - WAYPOINT
      ?AUTO_4828 - ROVER
      ?AUTO_4831 - STORE
      ?AUTO_4830 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4829 ?AUTO_4832 ) ( VISIBLE ?AUTO_4827 ?AUTO_4832 ) ( AVAILABLE ?AUTO_4828 ) ( CHANNEL_FREE ?AUTO_4829 ) ( not ( = ?AUTO_4827 ?AUTO_4832 ) ) ( AT_ROCK_SAMPLE ?AUTO_4827 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_4828 ) ( STORE_OF ?AUTO_4831 ?AUTO_4828 ) ( CAN_TRAVERSE ?AUTO_4828 ?AUTO_4832 ?AUTO_4827 ) ( VISIBLE ?AUTO_4832 ?AUTO_4827 ) ( CAN_TRAVERSE ?AUTO_4828 ?AUTO_4830 ?AUTO_4832 ) ( AT ?AUTO_4828 ?AUTO_4830 ) ( VISIBLE ?AUTO_4830 ?AUTO_4832 ) ( not ( = ?AUTO_4827 ?AUTO_4830 ) ) ( not ( = ?AUTO_4832 ?AUTO_4830 ) ) ( AT_ROCK_SAMPLE ?AUTO_4830 ) ( EMPTY ?AUTO_4831 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_4828 ?AUTO_4831 ?AUTO_4830 )
      ( GET_ROCK_DATA ?AUTO_4827 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_4827 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4882 - OBJECTIVE
      ?AUTO_4883 - MODE
    )
    :vars
    (
      ?AUTO_4890 - LANDER
      ?AUTO_4889 - WAYPOINT
      ?AUTO_4885 - WAYPOINT
      ?AUTO_4884 - ROVER
      ?AUTO_4886 - WAYPOINT
      ?AUTO_4888 - CAMERA
      ?AUTO_4887 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4890 ?AUTO_4889 ) ( VISIBLE ?AUTO_4885 ?AUTO_4889 ) ( AVAILABLE ?AUTO_4884 ) ( CHANNEL_FREE ?AUTO_4890 ) ( not ( = ?AUTO_4885 ?AUTO_4889 ) ) ( CAN_TRAVERSE ?AUTO_4884 ?AUTO_4886 ?AUTO_4885 ) ( VISIBLE ?AUTO_4886 ?AUTO_4885 ) ( not ( = ?AUTO_4889 ?AUTO_4886 ) ) ( not ( = ?AUTO_4885 ?AUTO_4886 ) ) ( ON_BOARD ?AUTO_4888 ?AUTO_4884 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4884 ) ( SUPPORTS ?AUTO_4888 ?AUTO_4883 ) ( VISIBLE_FROM ?AUTO_4882 ?AUTO_4886 ) ( CALIBRATION_TARGET ?AUTO_4888 ?AUTO_4887 ) ( VISIBLE_FROM ?AUTO_4887 ?AUTO_4886 ) ( not ( = ?AUTO_4882 ?AUTO_4887 ) ) ( CAN_TRAVERSE ?AUTO_4884 ?AUTO_4885 ?AUTO_4886 ) ( AT ?AUTO_4884 ?AUTO_4885 ) ( VISIBLE ?AUTO_4885 ?AUTO_4886 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4884 ?AUTO_4885 ?AUTO_4886 )
      ( GET_IMAGE_DATA ?AUTO_4882 ?AUTO_4883 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4882 ?AUTO_4883 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_4893 - OBJECTIVE
      ?AUTO_4894 - MODE
    )
    :vars
    (
      ?AUTO_4899 - LANDER
      ?AUTO_4897 - WAYPOINT
      ?AUTO_4901 - WAYPOINT
      ?AUTO_4898 - ROVER
      ?AUTO_4896 - WAYPOINT
      ?AUTO_4895 - CAMERA
      ?AUTO_4900 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_4899 ?AUTO_4897 ) ( VISIBLE ?AUTO_4901 ?AUTO_4897 ) ( AVAILABLE ?AUTO_4898 ) ( CHANNEL_FREE ?AUTO_4899 ) ( not ( = ?AUTO_4901 ?AUTO_4897 ) ) ( CAN_TRAVERSE ?AUTO_4898 ?AUTO_4896 ?AUTO_4901 ) ( VISIBLE ?AUTO_4896 ?AUTO_4901 ) ( not ( = ?AUTO_4897 ?AUTO_4896 ) ) ( not ( = ?AUTO_4901 ?AUTO_4896 ) ) ( ON_BOARD ?AUTO_4895 ?AUTO_4898 ) ( EQUIPPED_FOR_IMAGING ?AUTO_4898 ) ( SUPPORTS ?AUTO_4895 ?AUTO_4894 ) ( VISIBLE_FROM ?AUTO_4893 ?AUTO_4896 ) ( CALIBRATION_TARGET ?AUTO_4895 ?AUTO_4900 ) ( VISIBLE_FROM ?AUTO_4900 ?AUTO_4896 ) ( not ( = ?AUTO_4893 ?AUTO_4900 ) ) ( CAN_TRAVERSE ?AUTO_4898 ?AUTO_4901 ?AUTO_4896 ) ( VISIBLE ?AUTO_4901 ?AUTO_4896 ) ( CAN_TRAVERSE ?AUTO_4898 ?AUTO_4897 ?AUTO_4901 ) ( AT ?AUTO_4898 ?AUTO_4897 ) ( VISIBLE ?AUTO_4897 ?AUTO_4901 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_4898 ?AUTO_4897 ?AUTO_4901 )
      ( GET_IMAGE_DATA ?AUTO_4893 ?AUTO_4894 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_4893 ?AUTO_4894 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5104 - OBJECTIVE
      ?AUTO_5105 - MODE
    )
    :vars
    (
      ?AUTO_5107 - LANDER
      ?AUTO_5112 - WAYPOINT
      ?AUTO_5109 - WAYPOINT
      ?AUTO_5110 - ROVER
      ?AUTO_5106 - CAMERA
      ?AUTO_5111 - WAYPOINT
      ?AUTO_5113 - WAYPOINT
      ?AUTO_5108 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5107 ?AUTO_5112 ) ( VISIBLE ?AUTO_5109 ?AUTO_5112 ) ( AVAILABLE ?AUTO_5110 ) ( CHANNEL_FREE ?AUTO_5107 ) ( not ( = ?AUTO_5109 ?AUTO_5112 ) ) ( ON_BOARD ?AUTO_5106 ?AUTO_5110 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5110 ) ( SUPPORTS ?AUTO_5106 ?AUTO_5105 ) ( VISIBLE_FROM ?AUTO_5104 ?AUTO_5109 ) ( CAN_TRAVERSE ?AUTO_5110 ?AUTO_5111 ?AUTO_5109 ) ( VISIBLE ?AUTO_5111 ?AUTO_5109 ) ( not ( = ?AUTO_5112 ?AUTO_5111 ) ) ( not ( = ?AUTO_5109 ?AUTO_5111 ) ) ( CAN_TRAVERSE ?AUTO_5110 ?AUTO_5113 ?AUTO_5111 ) ( VISIBLE ?AUTO_5113 ?AUTO_5111 ) ( not ( = ?AUTO_5112 ?AUTO_5113 ) ) ( not ( = ?AUTO_5109 ?AUTO_5113 ) ) ( not ( = ?AUTO_5111 ?AUTO_5113 ) ) ( CALIBRATION_TARGET ?AUTO_5106 ?AUTO_5108 ) ( VISIBLE_FROM ?AUTO_5108 ?AUTO_5113 ) ( not ( = ?AUTO_5104 ?AUTO_5108 ) ) ( CAN_TRAVERSE ?AUTO_5110 ?AUTO_5111 ?AUTO_5113 ) ( AT ?AUTO_5110 ?AUTO_5111 ) ( VISIBLE ?AUTO_5111 ?AUTO_5113 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5110 ?AUTO_5111 ?AUTO_5113 )
      ( GET_IMAGE_DATA ?AUTO_5104 ?AUTO_5105 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5104 ?AUTO_5105 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5116 - OBJECTIVE
      ?AUTO_5117 - MODE
    )
    :vars
    (
      ?AUTO_5123 - LANDER
      ?AUTO_5118 - WAYPOINT
      ?AUTO_5121 - WAYPOINT
      ?AUTO_5124 - ROVER
      ?AUTO_5122 - CAMERA
      ?AUTO_5119 - WAYPOINT
      ?AUTO_5120 - WAYPOINT
      ?AUTO_5125 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5123 ?AUTO_5118 ) ( VISIBLE ?AUTO_5121 ?AUTO_5118 ) ( AVAILABLE ?AUTO_5124 ) ( CHANNEL_FREE ?AUTO_5123 ) ( not ( = ?AUTO_5121 ?AUTO_5118 ) ) ( ON_BOARD ?AUTO_5122 ?AUTO_5124 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5124 ) ( SUPPORTS ?AUTO_5122 ?AUTO_5117 ) ( VISIBLE_FROM ?AUTO_5116 ?AUTO_5121 ) ( CAN_TRAVERSE ?AUTO_5124 ?AUTO_5119 ?AUTO_5121 ) ( VISIBLE ?AUTO_5119 ?AUTO_5121 ) ( not ( = ?AUTO_5118 ?AUTO_5119 ) ) ( not ( = ?AUTO_5121 ?AUTO_5119 ) ) ( CAN_TRAVERSE ?AUTO_5124 ?AUTO_5120 ?AUTO_5119 ) ( VISIBLE ?AUTO_5120 ?AUTO_5119 ) ( not ( = ?AUTO_5118 ?AUTO_5120 ) ) ( not ( = ?AUTO_5121 ?AUTO_5120 ) ) ( not ( = ?AUTO_5119 ?AUTO_5120 ) ) ( CALIBRATION_TARGET ?AUTO_5122 ?AUTO_5125 ) ( VISIBLE_FROM ?AUTO_5125 ?AUTO_5120 ) ( not ( = ?AUTO_5116 ?AUTO_5125 ) ) ( CAN_TRAVERSE ?AUTO_5124 ?AUTO_5119 ?AUTO_5120 ) ( VISIBLE ?AUTO_5119 ?AUTO_5120 ) ( CAN_TRAVERSE ?AUTO_5124 ?AUTO_5118 ?AUTO_5119 ) ( AT ?AUTO_5124 ?AUTO_5118 ) ( VISIBLE ?AUTO_5118 ?AUTO_5119 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5124 ?AUTO_5118 ?AUTO_5119 )
      ( GET_IMAGE_DATA ?AUTO_5116 ?AUTO_5117 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5116 ?AUTO_5117 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5189 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5194 - LANDER
      ?AUTO_5191 - WAYPOINT
      ?AUTO_5193 - ROVER
      ?AUTO_5192 - STORE
      ?AUTO_5190 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5194 ?AUTO_5191 ) ( VISIBLE ?AUTO_5189 ?AUTO_5191 ) ( AVAILABLE ?AUTO_5193 ) ( CHANNEL_FREE ?AUTO_5194 ) ( not ( = ?AUTO_5189 ?AUTO_5191 ) ) ( AT_SOIL_SAMPLE ?AUTO_5189 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5193 ) ( STORE_OF ?AUTO_5192 ?AUTO_5193 ) ( CAN_TRAVERSE ?AUTO_5193 ?AUTO_5190 ?AUTO_5189 ) ( VISIBLE ?AUTO_5190 ?AUTO_5189 ) ( not ( = ?AUTO_5189 ?AUTO_5190 ) ) ( not ( = ?AUTO_5191 ?AUTO_5190 ) ) ( CAN_TRAVERSE ?AUTO_5193 ?AUTO_5191 ?AUTO_5190 ) ( AT ?AUTO_5193 ?AUTO_5191 ) ( VISIBLE ?AUTO_5191 ?AUTO_5190 ) ( FULL ?AUTO_5192 ) )
    :subtasks
    ( ( !DROP ?AUTO_5193 ?AUTO_5192 )
      ( GET_SOIL_DATA ?AUTO_5189 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5189 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8849 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8856 - LANDER
      ?AUTO_8850 - WAYPOINT
      ?AUTO_8855 - ROVER
      ?AUTO_8853 - STORE
      ?AUTO_8854 - WAYPOINT
      ?AUTO_8852 - WAYPOINT
      ?AUTO_8851 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8856 ?AUTO_8850 ) ( VISIBLE ?AUTO_8849 ?AUTO_8850 ) ( AVAILABLE ?AUTO_8855 ) ( CHANNEL_FREE ?AUTO_8856 ) ( not ( = ?AUTO_8849 ?AUTO_8850 ) ) ( AT_ROCK_SAMPLE ?AUTO_8849 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8855 ) ( STORE_OF ?AUTO_8853 ?AUTO_8855 ) ( CAN_TRAVERSE ?AUTO_8855 ?AUTO_8854 ?AUTO_8849 ) ( VISIBLE ?AUTO_8854 ?AUTO_8849 ) ( not ( = ?AUTO_8849 ?AUTO_8854 ) ) ( not ( = ?AUTO_8850 ?AUTO_8854 ) ) ( CAN_TRAVERSE ?AUTO_8855 ?AUTO_8852 ?AUTO_8854 ) ( VISIBLE ?AUTO_8852 ?AUTO_8854 ) ( not ( = ?AUTO_8849 ?AUTO_8852 ) ) ( not ( = ?AUTO_8850 ?AUTO_8852 ) ) ( not ( = ?AUTO_8854 ?AUTO_8852 ) ) ( CAN_TRAVERSE ?AUTO_8855 ?AUTO_8851 ?AUTO_8852 ) ( AT ?AUTO_8855 ?AUTO_8851 ) ( VISIBLE ?AUTO_8851 ?AUTO_8852 ) ( not ( = ?AUTO_8849 ?AUTO_8851 ) ) ( not ( = ?AUTO_8850 ?AUTO_8851 ) ) ( not ( = ?AUTO_8854 ?AUTO_8851 ) ) ( not ( = ?AUTO_8852 ?AUTO_8851 ) ) ( FULL ?AUTO_8853 ) )
    :subtasks
    ( ( !DROP ?AUTO_8855 ?AUTO_8853 )
      ( GET_ROCK_DATA ?AUTO_8849 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8849 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7197 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7200 - LANDER
      ?AUTO_7201 - WAYPOINT
      ?AUTO_7198 - ROVER
      ?AUTO_7202 - STORE
      ?AUTO_7199 - WAYPOINT
      ?AUTO_7203 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7200 ?AUTO_7201 ) ( VISIBLE ?AUTO_7197 ?AUTO_7201 ) ( AVAILABLE ?AUTO_7198 ) ( CHANNEL_FREE ?AUTO_7200 ) ( not ( = ?AUTO_7197 ?AUTO_7201 ) ) ( AT_ROCK_SAMPLE ?AUTO_7197 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7198 ) ( STORE_OF ?AUTO_7202 ?AUTO_7198 ) ( CAN_TRAVERSE ?AUTO_7198 ?AUTO_7199 ?AUTO_7197 ) ( VISIBLE ?AUTO_7199 ?AUTO_7197 ) ( not ( = ?AUTO_7197 ?AUTO_7199 ) ) ( not ( = ?AUTO_7201 ?AUTO_7199 ) ) ( CAN_TRAVERSE ?AUTO_7198 ?AUTO_7203 ?AUTO_7199 ) ( AT ?AUTO_7198 ?AUTO_7203 ) ( VISIBLE ?AUTO_7203 ?AUTO_7199 ) ( not ( = ?AUTO_7197 ?AUTO_7203 ) ) ( not ( = ?AUTO_7201 ?AUTO_7203 ) ) ( not ( = ?AUTO_7199 ?AUTO_7203 ) ) ( FULL ?AUTO_7202 ) )
    :subtasks
    ( ( !DROP ?AUTO_7198 ?AUTO_7202 )
      ( GET_ROCK_DATA ?AUTO_7197 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7197 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5307 - OBJECTIVE
      ?AUTO_5308 - MODE
    )
    :vars
    (
      ?AUTO_5310 - LANDER
      ?AUTO_5314 - WAYPOINT
      ?AUTO_5312 - WAYPOINT
      ?AUTO_5313 - ROVER
      ?AUTO_5311 - WAYPOINT
      ?AUTO_5309 - CAMERA
      ?AUTO_5315 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5310 ?AUTO_5314 ) ( VISIBLE ?AUTO_5312 ?AUTO_5314 ) ( AVAILABLE ?AUTO_5313 ) ( CHANNEL_FREE ?AUTO_5310 ) ( not ( = ?AUTO_5312 ?AUTO_5314 ) ) ( CAN_TRAVERSE ?AUTO_5313 ?AUTO_5311 ?AUTO_5312 ) ( VISIBLE ?AUTO_5311 ?AUTO_5312 ) ( not ( = ?AUTO_5314 ?AUTO_5311 ) ) ( not ( = ?AUTO_5312 ?AUTO_5311 ) ) ( ON_BOARD ?AUTO_5309 ?AUTO_5313 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5313 ) ( SUPPORTS ?AUTO_5309 ?AUTO_5308 ) ( VISIBLE_FROM ?AUTO_5307 ?AUTO_5311 ) ( CALIBRATION_TARGET ?AUTO_5309 ?AUTO_5307 ) ( CAN_TRAVERSE ?AUTO_5313 ?AUTO_5315 ?AUTO_5311 ) ( AT ?AUTO_5313 ?AUTO_5315 ) ( VISIBLE ?AUTO_5315 ?AUTO_5311 ) ( not ( = ?AUTO_5314 ?AUTO_5315 ) ) ( not ( = ?AUTO_5312 ?AUTO_5315 ) ) ( not ( = ?AUTO_5311 ?AUTO_5315 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5313 ?AUTO_5315 ?AUTO_5311 )
      ( GET_IMAGE_DATA ?AUTO_5307 ?AUTO_5308 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5307 ?AUTO_5308 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5316 - OBJECTIVE
      ?AUTO_5317 - MODE
    )
    :vars
    (
      ?AUTO_5319 - LANDER
      ?AUTO_5321 - WAYPOINT
      ?AUTO_5323 - WAYPOINT
      ?AUTO_5318 - ROVER
      ?AUTO_5322 - WAYPOINT
      ?AUTO_5320 - CAMERA
      ?AUTO_5324 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5319 ?AUTO_5321 ) ( VISIBLE ?AUTO_5323 ?AUTO_5321 ) ( AVAILABLE ?AUTO_5318 ) ( CHANNEL_FREE ?AUTO_5319 ) ( not ( = ?AUTO_5323 ?AUTO_5321 ) ) ( CAN_TRAVERSE ?AUTO_5318 ?AUTO_5322 ?AUTO_5323 ) ( VISIBLE ?AUTO_5322 ?AUTO_5323 ) ( not ( = ?AUTO_5321 ?AUTO_5322 ) ) ( not ( = ?AUTO_5323 ?AUTO_5322 ) ) ( ON_BOARD ?AUTO_5320 ?AUTO_5318 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5318 ) ( SUPPORTS ?AUTO_5320 ?AUTO_5317 ) ( VISIBLE_FROM ?AUTO_5316 ?AUTO_5322 ) ( CALIBRATION_TARGET ?AUTO_5320 ?AUTO_5316 ) ( CAN_TRAVERSE ?AUTO_5318 ?AUTO_5324 ?AUTO_5322 ) ( VISIBLE ?AUTO_5324 ?AUTO_5322 ) ( not ( = ?AUTO_5321 ?AUTO_5324 ) ) ( not ( = ?AUTO_5323 ?AUTO_5324 ) ) ( not ( = ?AUTO_5322 ?AUTO_5324 ) ) ( CAN_TRAVERSE ?AUTO_5318 ?AUTO_5321 ?AUTO_5324 ) ( AT ?AUTO_5318 ?AUTO_5321 ) ( VISIBLE ?AUTO_5321 ?AUTO_5324 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5318 ?AUTO_5321 ?AUTO_5324 )
      ( GET_IMAGE_DATA ?AUTO_5316 ?AUTO_5317 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5316 ?AUTO_5317 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5325 - OBJECTIVE
      ?AUTO_5326 - MODE
    )
    :vars
    (
      ?AUTO_5327 - LANDER
      ?AUTO_5332 - WAYPOINT
      ?AUTO_5328 - WAYPOINT
      ?AUTO_5329 - ROVER
      ?AUTO_5333 - WAYPOINT
      ?AUTO_5331 - CAMERA
      ?AUTO_5330 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5327 ?AUTO_5332 ) ( VISIBLE ?AUTO_5328 ?AUTO_5332 ) ( AVAILABLE ?AUTO_5329 ) ( CHANNEL_FREE ?AUTO_5327 ) ( not ( = ?AUTO_5328 ?AUTO_5332 ) ) ( CAN_TRAVERSE ?AUTO_5329 ?AUTO_5333 ?AUTO_5328 ) ( VISIBLE ?AUTO_5333 ?AUTO_5328 ) ( not ( = ?AUTO_5332 ?AUTO_5333 ) ) ( not ( = ?AUTO_5328 ?AUTO_5333 ) ) ( ON_BOARD ?AUTO_5331 ?AUTO_5329 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5329 ) ( SUPPORTS ?AUTO_5331 ?AUTO_5326 ) ( VISIBLE_FROM ?AUTO_5325 ?AUTO_5333 ) ( CALIBRATION_TARGET ?AUTO_5331 ?AUTO_5325 ) ( CAN_TRAVERSE ?AUTO_5329 ?AUTO_5330 ?AUTO_5333 ) ( VISIBLE ?AUTO_5330 ?AUTO_5333 ) ( not ( = ?AUTO_5332 ?AUTO_5330 ) ) ( not ( = ?AUTO_5328 ?AUTO_5330 ) ) ( not ( = ?AUTO_5333 ?AUTO_5330 ) ) ( CAN_TRAVERSE ?AUTO_5329 ?AUTO_5332 ?AUTO_5330 ) ( VISIBLE ?AUTO_5332 ?AUTO_5330 ) ( CAN_TRAVERSE ?AUTO_5329 ?AUTO_5328 ?AUTO_5332 ) ( AT ?AUTO_5329 ?AUTO_5328 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5329 ?AUTO_5328 ?AUTO_5332 )
      ( GET_IMAGE_DATA ?AUTO_5325 ?AUTO_5326 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5325 ?AUTO_5326 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5390 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5395 - LANDER
      ?AUTO_5393 - WAYPOINT
      ?AUTO_5392 - ROVER
      ?AUTO_5396 - STORE
      ?AUTO_5394 - WAYPOINT
      ?AUTO_5391 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5395 ?AUTO_5393 ) ( VISIBLE ?AUTO_5390 ?AUTO_5393 ) ( AVAILABLE ?AUTO_5392 ) ( CHANNEL_FREE ?AUTO_5395 ) ( not ( = ?AUTO_5390 ?AUTO_5393 ) ) ( AT_ROCK_SAMPLE ?AUTO_5390 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5392 ) ( STORE_OF ?AUTO_5396 ?AUTO_5392 ) ( CAN_TRAVERSE ?AUTO_5392 ?AUTO_5394 ?AUTO_5390 ) ( VISIBLE ?AUTO_5394 ?AUTO_5390 ) ( not ( = ?AUTO_5390 ?AUTO_5394 ) ) ( not ( = ?AUTO_5393 ?AUTO_5394 ) ) ( CAN_TRAVERSE ?AUTO_5392 ?AUTO_5391 ?AUTO_5394 ) ( AT ?AUTO_5392 ?AUTO_5391 ) ( VISIBLE ?AUTO_5391 ?AUTO_5394 ) ( not ( = ?AUTO_5390 ?AUTO_5391 ) ) ( not ( = ?AUTO_5393 ?AUTO_5391 ) ) ( not ( = ?AUTO_5394 ?AUTO_5391 ) ) ( AT_ROCK_SAMPLE ?AUTO_5391 ) ( EMPTY ?AUTO_5396 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5392 ?AUTO_5396 ?AUTO_5391 )
      ( GET_ROCK_DATA ?AUTO_5390 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5390 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5496 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5500 - LANDER
      ?AUTO_5501 - WAYPOINT
      ?AUTO_5497 - ROVER
      ?AUTO_5498 - STORE
      ?AUTO_5499 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5500 ?AUTO_5501 ) ( VISIBLE ?AUTO_5496 ?AUTO_5501 ) ( AVAILABLE ?AUTO_5497 ) ( CHANNEL_FREE ?AUTO_5500 ) ( not ( = ?AUTO_5496 ?AUTO_5501 ) ) ( AT_SOIL_SAMPLE ?AUTO_5496 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5497 ) ( STORE_OF ?AUTO_5498 ?AUTO_5497 ) ( CAN_TRAVERSE ?AUTO_5497 ?AUTO_5501 ?AUTO_5496 ) ( VISIBLE ?AUTO_5501 ?AUTO_5496 ) ( CAN_TRAVERSE ?AUTO_5497 ?AUTO_5499 ?AUTO_5501 ) ( AT ?AUTO_5497 ?AUTO_5499 ) ( VISIBLE ?AUTO_5499 ?AUTO_5501 ) ( not ( = ?AUTO_5496 ?AUTO_5499 ) ) ( not ( = ?AUTO_5501 ?AUTO_5499 ) ) ( AT_ROCK_SAMPLE ?AUTO_5499 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5497 ) ( EMPTY ?AUTO_5498 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_5497 ?AUTO_5498 ?AUTO_5499 )
      ( GET_SOIL_DATA ?AUTO_5496 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5496 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8086 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8087 - LANDER
      ?AUTO_8088 - WAYPOINT
      ?AUTO_8090 - ROVER
      ?AUTO_8091 - STORE
      ?AUTO_8089 - WAYPOINT
      ?AUTO_8092 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8087 ?AUTO_8088 ) ( VISIBLE ?AUTO_8086 ?AUTO_8088 ) ( AVAILABLE ?AUTO_8090 ) ( CHANNEL_FREE ?AUTO_8087 ) ( not ( = ?AUTO_8086 ?AUTO_8088 ) ) ( AT_SOIL_SAMPLE ?AUTO_8086 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8090 ) ( STORE_OF ?AUTO_8091 ?AUTO_8090 ) ( CAN_TRAVERSE ?AUTO_8090 ?AUTO_8089 ?AUTO_8086 ) ( VISIBLE ?AUTO_8089 ?AUTO_8086 ) ( not ( = ?AUTO_8086 ?AUTO_8089 ) ) ( not ( = ?AUTO_8088 ?AUTO_8089 ) ) ( CAN_TRAVERSE ?AUTO_8090 ?AUTO_8088 ?AUTO_8089 ) ( VISIBLE ?AUTO_8088 ?AUTO_8089 ) ( FULL ?AUTO_8091 ) ( CAN_TRAVERSE ?AUTO_8090 ?AUTO_8092 ?AUTO_8088 ) ( AT ?AUTO_8090 ?AUTO_8092 ) ( VISIBLE ?AUTO_8092 ?AUTO_8088 ) ( not ( = ?AUTO_8086 ?AUTO_8092 ) ) ( not ( = ?AUTO_8088 ?AUTO_8092 ) ) ( not ( = ?AUTO_8089 ?AUTO_8092 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8090 ?AUTO_8092 ?AUTO_8088 )
      ( GET_SOIL_DATA ?AUTO_8086 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8086 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8094 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8095 - LANDER
      ?AUTO_8096 - WAYPOINT
      ?AUTO_8098 - ROVER
      ?AUTO_8100 - STORE
      ?AUTO_8099 - WAYPOINT
      ?AUTO_8097 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8095 ?AUTO_8096 ) ( VISIBLE ?AUTO_8094 ?AUTO_8096 ) ( AVAILABLE ?AUTO_8098 ) ( CHANNEL_FREE ?AUTO_8095 ) ( not ( = ?AUTO_8094 ?AUTO_8096 ) ) ( AT_SOIL_SAMPLE ?AUTO_8094 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8098 ) ( STORE_OF ?AUTO_8100 ?AUTO_8098 ) ( CAN_TRAVERSE ?AUTO_8098 ?AUTO_8099 ?AUTO_8094 ) ( VISIBLE ?AUTO_8099 ?AUTO_8094 ) ( not ( = ?AUTO_8094 ?AUTO_8099 ) ) ( not ( = ?AUTO_8096 ?AUTO_8099 ) ) ( CAN_TRAVERSE ?AUTO_8098 ?AUTO_8096 ?AUTO_8099 ) ( VISIBLE ?AUTO_8096 ?AUTO_8099 ) ( CAN_TRAVERSE ?AUTO_8098 ?AUTO_8097 ?AUTO_8096 ) ( AT ?AUTO_8098 ?AUTO_8097 ) ( VISIBLE ?AUTO_8097 ?AUTO_8096 ) ( not ( = ?AUTO_8094 ?AUTO_8097 ) ) ( not ( = ?AUTO_8096 ?AUTO_8097 ) ) ( not ( = ?AUTO_8099 ?AUTO_8097 ) ) ( AT_ROCK_SAMPLE ?AUTO_8097 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8098 ) ( EMPTY ?AUTO_8100 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_8098 ?AUTO_8100 ?AUTO_8097 )
      ( GET_SOIL_DATA ?AUTO_8094 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8094 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5650 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5651 - LANDER
      ?AUTO_5656 - WAYPOINT
      ?AUTO_5652 - WAYPOINT
      ?AUTO_5653 - ROVER
      ?AUTO_5655 - WAYPOINT
      ?AUTO_5654 - STORE
      ?AUTO_5657 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5651 ?AUTO_5656 ) ( VISIBLE ?AUTO_5652 ?AUTO_5656 ) ( AVAILABLE ?AUTO_5653 ) ( CHANNEL_FREE ?AUTO_5651 ) ( not ( = ?AUTO_5650 ?AUTO_5652 ) ) ( not ( = ?AUTO_5650 ?AUTO_5656 ) ) ( not ( = ?AUTO_5652 ?AUTO_5656 ) ) ( CAN_TRAVERSE ?AUTO_5653 ?AUTO_5655 ?AUTO_5652 ) ( VISIBLE ?AUTO_5655 ?AUTO_5652 ) ( not ( = ?AUTO_5650 ?AUTO_5655 ) ) ( not ( = ?AUTO_5656 ?AUTO_5655 ) ) ( not ( = ?AUTO_5652 ?AUTO_5655 ) ) ( CAN_TRAVERSE ?AUTO_5653 ?AUTO_5650 ?AUTO_5655 ) ( VISIBLE ?AUTO_5650 ?AUTO_5655 ) ( AT_ROCK_SAMPLE ?AUTO_5650 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5653 ) ( STORE_OF ?AUTO_5654 ?AUTO_5653 ) ( EMPTY ?AUTO_5654 ) ( CAN_TRAVERSE ?AUTO_5653 ?AUTO_5657 ?AUTO_5650 ) ( AT ?AUTO_5653 ?AUTO_5657 ) ( VISIBLE ?AUTO_5657 ?AUTO_5650 ) ( not ( = ?AUTO_5650 ?AUTO_5657 ) ) ( not ( = ?AUTO_5656 ?AUTO_5657 ) ) ( not ( = ?AUTO_5652 ?AUTO_5657 ) ) ( not ( = ?AUTO_5655 ?AUTO_5657 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5653 ?AUTO_5657 ?AUTO_5650 )
      ( GET_ROCK_DATA ?AUTO_5650 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5650 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5658 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5659 - LANDER
      ?AUTO_5663 - WAYPOINT
      ?AUTO_5660 - WAYPOINT
      ?AUTO_5664 - ROVER
      ?AUTO_5662 - WAYPOINT
      ?AUTO_5665 - STORE
      ?AUTO_5661 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5659 ?AUTO_5663 ) ( VISIBLE ?AUTO_5660 ?AUTO_5663 ) ( AVAILABLE ?AUTO_5664 ) ( CHANNEL_FREE ?AUTO_5659 ) ( not ( = ?AUTO_5658 ?AUTO_5660 ) ) ( not ( = ?AUTO_5658 ?AUTO_5663 ) ) ( not ( = ?AUTO_5660 ?AUTO_5663 ) ) ( CAN_TRAVERSE ?AUTO_5664 ?AUTO_5662 ?AUTO_5660 ) ( VISIBLE ?AUTO_5662 ?AUTO_5660 ) ( not ( = ?AUTO_5658 ?AUTO_5662 ) ) ( not ( = ?AUTO_5663 ?AUTO_5662 ) ) ( not ( = ?AUTO_5660 ?AUTO_5662 ) ) ( CAN_TRAVERSE ?AUTO_5664 ?AUTO_5658 ?AUTO_5662 ) ( VISIBLE ?AUTO_5658 ?AUTO_5662 ) ( AT_ROCK_SAMPLE ?AUTO_5658 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5664 ) ( STORE_OF ?AUTO_5665 ?AUTO_5664 ) ( CAN_TRAVERSE ?AUTO_5664 ?AUTO_5661 ?AUTO_5658 ) ( AT ?AUTO_5664 ?AUTO_5661 ) ( VISIBLE ?AUTO_5661 ?AUTO_5658 ) ( not ( = ?AUTO_5658 ?AUTO_5661 ) ) ( not ( = ?AUTO_5663 ?AUTO_5661 ) ) ( not ( = ?AUTO_5660 ?AUTO_5661 ) ) ( not ( = ?AUTO_5662 ?AUTO_5661 ) ) ( FULL ?AUTO_5665 ) )
    :subtasks
    ( ( !DROP ?AUTO_5664 ?AUTO_5665 )
      ( GET_ROCK_DATA ?AUTO_5658 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5658 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5714 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5720 - LANDER
      ?AUTO_5716 - WAYPOINT
      ?AUTO_5717 - ROVER
      ?AUTO_5719 - STORE
      ?AUTO_5718 - WAYPOINT
      ?AUTO_5715 - WAYPOINT
      ?AUTO_5721 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5720 ?AUTO_5714 ) ( VISIBLE ?AUTO_5716 ?AUTO_5714 ) ( AVAILABLE ?AUTO_5717 ) ( CHANNEL_FREE ?AUTO_5720 ) ( not ( = ?AUTO_5714 ?AUTO_5716 ) ) ( CAN_TRAVERSE ?AUTO_5717 ?AUTO_5714 ?AUTO_5716 ) ( VISIBLE ?AUTO_5714 ?AUTO_5716 ) ( AT_SOIL_SAMPLE ?AUTO_5714 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5717 ) ( STORE_OF ?AUTO_5719 ?AUTO_5717 ) ( EMPTY ?AUTO_5719 ) ( CAN_TRAVERSE ?AUTO_5717 ?AUTO_5718 ?AUTO_5714 ) ( VISIBLE ?AUTO_5718 ?AUTO_5714 ) ( not ( = ?AUTO_5714 ?AUTO_5718 ) ) ( not ( = ?AUTO_5716 ?AUTO_5718 ) ) ( CAN_TRAVERSE ?AUTO_5717 ?AUTO_5715 ?AUTO_5718 ) ( VISIBLE ?AUTO_5715 ?AUTO_5718 ) ( not ( = ?AUTO_5714 ?AUTO_5715 ) ) ( not ( = ?AUTO_5716 ?AUTO_5715 ) ) ( not ( = ?AUTO_5718 ?AUTO_5715 ) ) ( CAN_TRAVERSE ?AUTO_5717 ?AUTO_5721 ?AUTO_5715 ) ( VISIBLE ?AUTO_5721 ?AUTO_5715 ) ( not ( = ?AUTO_5714 ?AUTO_5721 ) ) ( not ( = ?AUTO_5716 ?AUTO_5721 ) ) ( not ( = ?AUTO_5718 ?AUTO_5721 ) ) ( not ( = ?AUTO_5715 ?AUTO_5721 ) ) ( CAN_TRAVERSE ?AUTO_5717 ?AUTO_5716 ?AUTO_5721 ) ( AT ?AUTO_5717 ?AUTO_5716 ) ( VISIBLE ?AUTO_5716 ?AUTO_5721 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5717 ?AUTO_5716 ?AUTO_5721 )
      ( GET_SOIL_DATA ?AUTO_5714 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5714 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_5722 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5723 - LANDER
      ?AUTO_5725 - WAYPOINT
      ?AUTO_5724 - ROVER
      ?AUTO_5729 - STORE
      ?AUTO_5728 - WAYPOINT
      ?AUTO_5726 - WAYPOINT
      ?AUTO_5727 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5723 ?AUTO_5722 ) ( VISIBLE ?AUTO_5725 ?AUTO_5722 ) ( AVAILABLE ?AUTO_5724 ) ( CHANNEL_FREE ?AUTO_5723 ) ( not ( = ?AUTO_5722 ?AUTO_5725 ) ) ( CAN_TRAVERSE ?AUTO_5724 ?AUTO_5722 ?AUTO_5725 ) ( VISIBLE ?AUTO_5722 ?AUTO_5725 ) ( AT_SOIL_SAMPLE ?AUTO_5722 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5724 ) ( STORE_OF ?AUTO_5729 ?AUTO_5724 ) ( CAN_TRAVERSE ?AUTO_5724 ?AUTO_5728 ?AUTO_5722 ) ( VISIBLE ?AUTO_5728 ?AUTO_5722 ) ( not ( = ?AUTO_5722 ?AUTO_5728 ) ) ( not ( = ?AUTO_5725 ?AUTO_5728 ) ) ( CAN_TRAVERSE ?AUTO_5724 ?AUTO_5726 ?AUTO_5728 ) ( VISIBLE ?AUTO_5726 ?AUTO_5728 ) ( not ( = ?AUTO_5722 ?AUTO_5726 ) ) ( not ( = ?AUTO_5725 ?AUTO_5726 ) ) ( not ( = ?AUTO_5728 ?AUTO_5726 ) ) ( CAN_TRAVERSE ?AUTO_5724 ?AUTO_5727 ?AUTO_5726 ) ( VISIBLE ?AUTO_5727 ?AUTO_5726 ) ( not ( = ?AUTO_5722 ?AUTO_5727 ) ) ( not ( = ?AUTO_5725 ?AUTO_5727 ) ) ( not ( = ?AUTO_5728 ?AUTO_5727 ) ) ( not ( = ?AUTO_5726 ?AUTO_5727 ) ) ( CAN_TRAVERSE ?AUTO_5724 ?AUTO_5725 ?AUTO_5727 ) ( AT ?AUTO_5724 ?AUTO_5725 ) ( VISIBLE ?AUTO_5725 ?AUTO_5727 ) ( FULL ?AUTO_5729 ) )
    :subtasks
    ( ( !DROP ?AUTO_5724 ?AUTO_5729 )
      ( GET_SOIL_DATA ?AUTO_5722 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_5722 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5743 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5747 - LANDER
      ?AUTO_5745 - WAYPOINT
      ?AUTO_5744 - ROVER
      ?AUTO_5746 - WAYPOINT
      ?AUTO_5748 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5747 ?AUTO_5745 ) ( HAVE_ROCK_ANALYSIS ?AUTO_5744 ?AUTO_5743 ) ( VISIBLE ?AUTO_5746 ?AUTO_5745 ) ( AVAILABLE ?AUTO_5744 ) ( CHANNEL_FREE ?AUTO_5747 ) ( not ( = ?AUTO_5743 ?AUTO_5746 ) ) ( not ( = ?AUTO_5743 ?AUTO_5745 ) ) ( not ( = ?AUTO_5746 ?AUTO_5745 ) ) ( CAN_TRAVERSE ?AUTO_5744 ?AUTO_5743 ?AUTO_5746 ) ( VISIBLE ?AUTO_5743 ?AUTO_5746 ) ( CAN_TRAVERSE ?AUTO_5744 ?AUTO_5748 ?AUTO_5743 ) ( AT ?AUTO_5744 ?AUTO_5748 ) ( VISIBLE ?AUTO_5748 ?AUTO_5743 ) ( not ( = ?AUTO_5743 ?AUTO_5748 ) ) ( not ( = ?AUTO_5745 ?AUTO_5748 ) ) ( not ( = ?AUTO_5746 ?AUTO_5748 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5744 ?AUTO_5748 ?AUTO_5743 )
      ( GET_ROCK_DATA ?AUTO_5743 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5743 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5770 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5772 - LANDER
      ?AUTO_5774 - WAYPOINT
      ?AUTO_5773 - WAYPOINT
      ?AUTO_5771 - ROVER
      ?AUTO_5775 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5772 ?AUTO_5774 ) ( VISIBLE ?AUTO_5773 ?AUTO_5774 ) ( AVAILABLE ?AUTO_5771 ) ( CHANNEL_FREE ?AUTO_5772 ) ( not ( = ?AUTO_5770 ?AUTO_5773 ) ) ( not ( = ?AUTO_5770 ?AUTO_5774 ) ) ( not ( = ?AUTO_5773 ?AUTO_5774 ) ) ( CAN_TRAVERSE ?AUTO_5771 ?AUTO_5770 ?AUTO_5773 ) ( VISIBLE ?AUTO_5770 ?AUTO_5773 ) ( AT_ROCK_SAMPLE ?AUTO_5770 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5771 ) ( STORE_OF ?AUTO_5775 ?AUTO_5771 ) ( CAN_TRAVERSE ?AUTO_5771 ?AUTO_5773 ?AUTO_5770 ) ( VISIBLE ?AUTO_5773 ?AUTO_5770 ) ( FULL ?AUTO_5775 ) ( CAN_TRAVERSE ?AUTO_5771 ?AUTO_5774 ?AUTO_5773 ) ( AT ?AUTO_5771 ?AUTO_5774 ) ( VISIBLE ?AUTO_5774 ?AUTO_5773 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5771 ?AUTO_5774 ?AUTO_5773 )
      ( GET_ROCK_DATA ?AUTO_5770 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5770 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5776 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5779 - LANDER
      ?AUTO_5781 - WAYPOINT
      ?AUTO_5777 - WAYPOINT
      ?AUTO_5778 - ROVER
      ?AUTO_5780 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5779 ?AUTO_5781 ) ( VISIBLE ?AUTO_5777 ?AUTO_5781 ) ( AVAILABLE ?AUTO_5778 ) ( CHANNEL_FREE ?AUTO_5779 ) ( not ( = ?AUTO_5776 ?AUTO_5777 ) ) ( not ( = ?AUTO_5776 ?AUTO_5781 ) ) ( not ( = ?AUTO_5777 ?AUTO_5781 ) ) ( CAN_TRAVERSE ?AUTO_5778 ?AUTO_5776 ?AUTO_5777 ) ( VISIBLE ?AUTO_5776 ?AUTO_5777 ) ( AT_ROCK_SAMPLE ?AUTO_5776 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5778 ) ( STORE_OF ?AUTO_5780 ?AUTO_5778 ) ( CAN_TRAVERSE ?AUTO_5778 ?AUTO_5777 ?AUTO_5776 ) ( VISIBLE ?AUTO_5777 ?AUTO_5776 ) ( CAN_TRAVERSE ?AUTO_5778 ?AUTO_5781 ?AUTO_5777 ) ( AT ?AUTO_5778 ?AUTO_5781 ) ( VISIBLE ?AUTO_5781 ?AUTO_5777 ) ( AT_SOIL_SAMPLE ?AUTO_5781 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_5778 ) ( EMPTY ?AUTO_5780 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_5778 ?AUTO_5780 ?AUTO_5781 )
      ( GET_ROCK_DATA ?AUTO_5776 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5776 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5801 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5806 - LANDER
      ?AUTO_5803 - WAYPOINT
      ?AUTO_5805 - WAYPOINT
      ?AUTO_5807 - ROVER
      ?AUTO_5804 - STORE
      ?AUTO_5802 - WAYPOINT
      ?AUTO_5808 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5806 ?AUTO_5803 ) ( VISIBLE ?AUTO_5805 ?AUTO_5803 ) ( AVAILABLE ?AUTO_5807 ) ( CHANNEL_FREE ?AUTO_5806 ) ( not ( = ?AUTO_5801 ?AUTO_5805 ) ) ( not ( = ?AUTO_5801 ?AUTO_5803 ) ) ( not ( = ?AUTO_5805 ?AUTO_5803 ) ) ( CAN_TRAVERSE ?AUTO_5807 ?AUTO_5801 ?AUTO_5805 ) ( VISIBLE ?AUTO_5801 ?AUTO_5805 ) ( AT_ROCK_SAMPLE ?AUTO_5801 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5807 ) ( STORE_OF ?AUTO_5804 ?AUTO_5807 ) ( EMPTY ?AUTO_5804 ) ( CAN_TRAVERSE ?AUTO_5807 ?AUTO_5802 ?AUTO_5801 ) ( VISIBLE ?AUTO_5802 ?AUTO_5801 ) ( not ( = ?AUTO_5801 ?AUTO_5802 ) ) ( not ( = ?AUTO_5803 ?AUTO_5802 ) ) ( not ( = ?AUTO_5805 ?AUTO_5802 ) ) ( CAN_TRAVERSE ?AUTO_5807 ?AUTO_5808 ?AUTO_5802 ) ( AT ?AUTO_5807 ?AUTO_5808 ) ( VISIBLE ?AUTO_5808 ?AUTO_5802 ) ( not ( = ?AUTO_5801 ?AUTO_5808 ) ) ( not ( = ?AUTO_5803 ?AUTO_5808 ) ) ( not ( = ?AUTO_5805 ?AUTO_5808 ) ) ( not ( = ?AUTO_5802 ?AUTO_5808 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5807 ?AUTO_5808 ?AUTO_5802 )
      ( GET_ROCK_DATA ?AUTO_5801 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5801 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_5809 - WAYPOINT
    )
    :vars
    (
      ?AUTO_5815 - LANDER
      ?AUTO_5811 - WAYPOINT
      ?AUTO_5812 - WAYPOINT
      ?AUTO_5813 - ROVER
      ?AUTO_5816 - STORE
      ?AUTO_5814 - WAYPOINT
      ?AUTO_5810 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5815 ?AUTO_5811 ) ( VISIBLE ?AUTO_5812 ?AUTO_5811 ) ( AVAILABLE ?AUTO_5813 ) ( CHANNEL_FREE ?AUTO_5815 ) ( not ( = ?AUTO_5809 ?AUTO_5812 ) ) ( not ( = ?AUTO_5809 ?AUTO_5811 ) ) ( not ( = ?AUTO_5812 ?AUTO_5811 ) ) ( CAN_TRAVERSE ?AUTO_5813 ?AUTO_5809 ?AUTO_5812 ) ( VISIBLE ?AUTO_5809 ?AUTO_5812 ) ( AT_ROCK_SAMPLE ?AUTO_5809 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_5813 ) ( STORE_OF ?AUTO_5816 ?AUTO_5813 ) ( CAN_TRAVERSE ?AUTO_5813 ?AUTO_5814 ?AUTO_5809 ) ( VISIBLE ?AUTO_5814 ?AUTO_5809 ) ( not ( = ?AUTO_5809 ?AUTO_5814 ) ) ( not ( = ?AUTO_5811 ?AUTO_5814 ) ) ( not ( = ?AUTO_5812 ?AUTO_5814 ) ) ( CAN_TRAVERSE ?AUTO_5813 ?AUTO_5810 ?AUTO_5814 ) ( AT ?AUTO_5813 ?AUTO_5810 ) ( VISIBLE ?AUTO_5810 ?AUTO_5814 ) ( not ( = ?AUTO_5809 ?AUTO_5810 ) ) ( not ( = ?AUTO_5811 ?AUTO_5810 ) ) ( not ( = ?AUTO_5812 ?AUTO_5810 ) ) ( not ( = ?AUTO_5814 ?AUTO_5810 ) ) ( FULL ?AUTO_5816 ) )
    :subtasks
    ( ( !DROP ?AUTO_5813 ?AUTO_5816 )
      ( GET_ROCK_DATA ?AUTO_5809 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_5809 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5853 - OBJECTIVE
      ?AUTO_5854 - MODE
    )
    :vars
    (
      ?AUTO_5855 - LANDER
      ?AUTO_5860 - WAYPOINT
      ?AUTO_5857 - WAYPOINT
      ?AUTO_5859 - ROVER
      ?AUTO_5858 - WAYPOINT
      ?AUTO_5856 - WAYPOINT
      ?AUTO_5861 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5855 ?AUTO_5860 ) ( VISIBLE ?AUTO_5857 ?AUTO_5860 ) ( AVAILABLE ?AUTO_5859 ) ( CHANNEL_FREE ?AUTO_5855 ) ( not ( = ?AUTO_5857 ?AUTO_5860 ) ) ( CAN_TRAVERSE ?AUTO_5859 ?AUTO_5858 ?AUTO_5857 ) ( VISIBLE ?AUTO_5858 ?AUTO_5857 ) ( not ( = ?AUTO_5860 ?AUTO_5858 ) ) ( not ( = ?AUTO_5857 ?AUTO_5858 ) ) ( CAN_TRAVERSE ?AUTO_5859 ?AUTO_5856 ?AUTO_5858 ) ( VISIBLE ?AUTO_5856 ?AUTO_5858 ) ( not ( = ?AUTO_5860 ?AUTO_5856 ) ) ( not ( = ?AUTO_5857 ?AUTO_5856 ) ) ( not ( = ?AUTO_5858 ?AUTO_5856 ) ) ( CALIBRATED ?AUTO_5861 ?AUTO_5859 ) ( ON_BOARD ?AUTO_5861 ?AUTO_5859 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5859 ) ( SUPPORTS ?AUTO_5861 ?AUTO_5854 ) ( VISIBLE_FROM ?AUTO_5853 ?AUTO_5856 ) ( CAN_TRAVERSE ?AUTO_5859 ?AUTO_5858 ?AUTO_5856 ) ( AT ?AUTO_5859 ?AUTO_5858 ) ( VISIBLE ?AUTO_5858 ?AUTO_5856 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5859 ?AUTO_5858 ?AUTO_5856 )
      ( GET_IMAGE_DATA ?AUTO_5853 ?AUTO_5854 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5853 ?AUTO_5854 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5864 - OBJECTIVE
      ?AUTO_5865 - MODE
    )
    :vars
    (
      ?AUTO_5866 - LANDER
      ?AUTO_5871 - WAYPOINT
      ?AUTO_5869 - WAYPOINT
      ?AUTO_5872 - ROVER
      ?AUTO_5867 - WAYPOINT
      ?AUTO_5868 - WAYPOINT
      ?AUTO_5870 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5866 ?AUTO_5871 ) ( VISIBLE ?AUTO_5869 ?AUTO_5871 ) ( AVAILABLE ?AUTO_5872 ) ( CHANNEL_FREE ?AUTO_5866 ) ( not ( = ?AUTO_5869 ?AUTO_5871 ) ) ( CAN_TRAVERSE ?AUTO_5872 ?AUTO_5867 ?AUTO_5869 ) ( VISIBLE ?AUTO_5867 ?AUTO_5869 ) ( not ( = ?AUTO_5871 ?AUTO_5867 ) ) ( not ( = ?AUTO_5869 ?AUTO_5867 ) ) ( CAN_TRAVERSE ?AUTO_5872 ?AUTO_5868 ?AUTO_5867 ) ( VISIBLE ?AUTO_5868 ?AUTO_5867 ) ( not ( = ?AUTO_5871 ?AUTO_5868 ) ) ( not ( = ?AUTO_5869 ?AUTO_5868 ) ) ( not ( = ?AUTO_5867 ?AUTO_5868 ) ) ( CALIBRATED ?AUTO_5870 ?AUTO_5872 ) ( ON_BOARD ?AUTO_5870 ?AUTO_5872 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5872 ) ( SUPPORTS ?AUTO_5870 ?AUTO_5865 ) ( VISIBLE_FROM ?AUTO_5864 ?AUTO_5868 ) ( CAN_TRAVERSE ?AUTO_5872 ?AUTO_5867 ?AUTO_5868 ) ( VISIBLE ?AUTO_5867 ?AUTO_5868 ) ( CAN_TRAVERSE ?AUTO_5872 ?AUTO_5869 ?AUTO_5867 ) ( AT ?AUTO_5872 ?AUTO_5869 ) ( VISIBLE ?AUTO_5869 ?AUTO_5867 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5872 ?AUTO_5869 ?AUTO_5867 )
      ( GET_IMAGE_DATA ?AUTO_5864 ?AUTO_5865 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5864 ?AUTO_5865 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5877 - OBJECTIVE
      ?AUTO_5878 - MODE
    )
    :vars
    (
      ?AUTO_5883 - LANDER
      ?AUTO_5884 - WAYPOINT
      ?AUTO_5882 - WAYPOINT
      ?AUTO_5885 - ROVER
      ?AUTO_5881 - WAYPOINT
      ?AUTO_5880 - WAYPOINT
      ?AUTO_5879 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5883 ?AUTO_5884 ) ( VISIBLE ?AUTO_5882 ?AUTO_5884 ) ( AVAILABLE ?AUTO_5885 ) ( CHANNEL_FREE ?AUTO_5883 ) ( not ( = ?AUTO_5882 ?AUTO_5884 ) ) ( CAN_TRAVERSE ?AUTO_5885 ?AUTO_5881 ?AUTO_5882 ) ( VISIBLE ?AUTO_5881 ?AUTO_5882 ) ( not ( = ?AUTO_5884 ?AUTO_5881 ) ) ( not ( = ?AUTO_5882 ?AUTO_5881 ) ) ( CAN_TRAVERSE ?AUTO_5885 ?AUTO_5880 ?AUTO_5881 ) ( VISIBLE ?AUTO_5880 ?AUTO_5881 ) ( not ( = ?AUTO_5884 ?AUTO_5880 ) ) ( not ( = ?AUTO_5882 ?AUTO_5880 ) ) ( not ( = ?AUTO_5881 ?AUTO_5880 ) ) ( CALIBRATED ?AUTO_5879 ?AUTO_5885 ) ( ON_BOARD ?AUTO_5879 ?AUTO_5885 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5885 ) ( SUPPORTS ?AUTO_5879 ?AUTO_5878 ) ( VISIBLE_FROM ?AUTO_5877 ?AUTO_5880 ) ( CAN_TRAVERSE ?AUTO_5885 ?AUTO_5881 ?AUTO_5880 ) ( VISIBLE ?AUTO_5881 ?AUTO_5880 ) ( CAN_TRAVERSE ?AUTO_5885 ?AUTO_5882 ?AUTO_5881 ) ( VISIBLE ?AUTO_5882 ?AUTO_5881 ) ( CAN_TRAVERSE ?AUTO_5885 ?AUTO_5884 ?AUTO_5882 ) ( AT ?AUTO_5885 ?AUTO_5884 ) ( VISIBLE ?AUTO_5884 ?AUTO_5882 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5885 ?AUTO_5884 ?AUTO_5882 )
      ( GET_IMAGE_DATA ?AUTO_5877 ?AUTO_5878 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5877 ?AUTO_5878 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5888 - OBJECTIVE
      ?AUTO_5889 - MODE
    )
    :vars
    (
      ?AUTO_5893 - LANDER
      ?AUTO_5895 - WAYPOINT
      ?AUTO_5891 - WAYPOINT
      ?AUTO_5890 - ROVER
      ?AUTO_5894 - WAYPOINT
      ?AUTO_5896 - WAYPOINT
      ?AUTO_5892 - CAMERA
      ?AUTO_5897 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5893 ?AUTO_5895 ) ( VISIBLE ?AUTO_5891 ?AUTO_5895 ) ( AVAILABLE ?AUTO_5890 ) ( CHANNEL_FREE ?AUTO_5893 ) ( not ( = ?AUTO_5891 ?AUTO_5895 ) ) ( CAN_TRAVERSE ?AUTO_5890 ?AUTO_5894 ?AUTO_5891 ) ( VISIBLE ?AUTO_5894 ?AUTO_5891 ) ( not ( = ?AUTO_5895 ?AUTO_5894 ) ) ( not ( = ?AUTO_5891 ?AUTO_5894 ) ) ( CAN_TRAVERSE ?AUTO_5890 ?AUTO_5896 ?AUTO_5894 ) ( VISIBLE ?AUTO_5896 ?AUTO_5894 ) ( not ( = ?AUTO_5895 ?AUTO_5896 ) ) ( not ( = ?AUTO_5891 ?AUTO_5896 ) ) ( not ( = ?AUTO_5894 ?AUTO_5896 ) ) ( ON_BOARD ?AUTO_5892 ?AUTO_5890 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5890 ) ( SUPPORTS ?AUTO_5892 ?AUTO_5889 ) ( VISIBLE_FROM ?AUTO_5888 ?AUTO_5896 ) ( CAN_TRAVERSE ?AUTO_5890 ?AUTO_5894 ?AUTO_5896 ) ( VISIBLE ?AUTO_5894 ?AUTO_5896 ) ( CAN_TRAVERSE ?AUTO_5890 ?AUTO_5891 ?AUTO_5894 ) ( VISIBLE ?AUTO_5891 ?AUTO_5894 ) ( CAN_TRAVERSE ?AUTO_5890 ?AUTO_5895 ?AUTO_5891 ) ( AT ?AUTO_5890 ?AUTO_5895 ) ( VISIBLE ?AUTO_5895 ?AUTO_5891 ) ( CALIBRATION_TARGET ?AUTO_5892 ?AUTO_5897 ) ( VISIBLE_FROM ?AUTO_5897 ?AUTO_5895 ) ( not ( = ?AUTO_5888 ?AUTO_5897 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_5890 ?AUTO_5892 ?AUTO_5897 ?AUTO_5895 )
      ( GET_IMAGE_DATA ?AUTO_5888 ?AUTO_5889 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5888 ?AUTO_5889 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5898 - OBJECTIVE
      ?AUTO_5899 - MODE
    )
    :vars
    (
      ?AUTO_5905 - LANDER
      ?AUTO_5904 - WAYPOINT
      ?AUTO_5903 - WAYPOINT
      ?AUTO_5901 - ROVER
      ?AUTO_5907 - WAYPOINT
      ?AUTO_5900 - WAYPOINT
      ?AUTO_5906 - CAMERA
      ?AUTO_5902 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5905 ?AUTO_5904 ) ( VISIBLE ?AUTO_5903 ?AUTO_5904 ) ( AVAILABLE ?AUTO_5901 ) ( CHANNEL_FREE ?AUTO_5905 ) ( not ( = ?AUTO_5903 ?AUTO_5904 ) ) ( CAN_TRAVERSE ?AUTO_5901 ?AUTO_5907 ?AUTO_5903 ) ( VISIBLE ?AUTO_5907 ?AUTO_5903 ) ( not ( = ?AUTO_5904 ?AUTO_5907 ) ) ( not ( = ?AUTO_5903 ?AUTO_5907 ) ) ( CAN_TRAVERSE ?AUTO_5901 ?AUTO_5900 ?AUTO_5907 ) ( VISIBLE ?AUTO_5900 ?AUTO_5907 ) ( not ( = ?AUTO_5904 ?AUTO_5900 ) ) ( not ( = ?AUTO_5903 ?AUTO_5900 ) ) ( not ( = ?AUTO_5907 ?AUTO_5900 ) ) ( ON_BOARD ?AUTO_5906 ?AUTO_5901 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5901 ) ( SUPPORTS ?AUTO_5906 ?AUTO_5899 ) ( VISIBLE_FROM ?AUTO_5898 ?AUTO_5900 ) ( CAN_TRAVERSE ?AUTO_5901 ?AUTO_5907 ?AUTO_5900 ) ( VISIBLE ?AUTO_5907 ?AUTO_5900 ) ( CAN_TRAVERSE ?AUTO_5901 ?AUTO_5903 ?AUTO_5907 ) ( VISIBLE ?AUTO_5903 ?AUTO_5907 ) ( CAN_TRAVERSE ?AUTO_5901 ?AUTO_5904 ?AUTO_5903 ) ( VISIBLE ?AUTO_5904 ?AUTO_5903 ) ( CALIBRATION_TARGET ?AUTO_5906 ?AUTO_5902 ) ( VISIBLE_FROM ?AUTO_5902 ?AUTO_5904 ) ( not ( = ?AUTO_5898 ?AUTO_5902 ) ) ( CAN_TRAVERSE ?AUTO_5901 ?AUTO_5903 ?AUTO_5904 ) ( AT ?AUTO_5901 ?AUTO_5903 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5901 ?AUTO_5903 ?AUTO_5904 )
      ( GET_IMAGE_DATA ?AUTO_5898 ?AUTO_5899 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5898 ?AUTO_5899 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5910 - OBJECTIVE
      ?AUTO_5911 - MODE
    )
    :vars
    (
      ?AUTO_5919 - LANDER
      ?AUTO_5915 - WAYPOINT
      ?AUTO_5918 - WAYPOINT
      ?AUTO_5916 - ROVER
      ?AUTO_5917 - WAYPOINT
      ?AUTO_5914 - WAYPOINT
      ?AUTO_5913 - CAMERA
      ?AUTO_5912 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5919 ?AUTO_5915 ) ( VISIBLE ?AUTO_5918 ?AUTO_5915 ) ( AVAILABLE ?AUTO_5916 ) ( CHANNEL_FREE ?AUTO_5919 ) ( not ( = ?AUTO_5918 ?AUTO_5915 ) ) ( CAN_TRAVERSE ?AUTO_5916 ?AUTO_5917 ?AUTO_5918 ) ( VISIBLE ?AUTO_5917 ?AUTO_5918 ) ( not ( = ?AUTO_5915 ?AUTO_5917 ) ) ( not ( = ?AUTO_5918 ?AUTO_5917 ) ) ( CAN_TRAVERSE ?AUTO_5916 ?AUTO_5914 ?AUTO_5917 ) ( VISIBLE ?AUTO_5914 ?AUTO_5917 ) ( not ( = ?AUTO_5915 ?AUTO_5914 ) ) ( not ( = ?AUTO_5918 ?AUTO_5914 ) ) ( not ( = ?AUTO_5917 ?AUTO_5914 ) ) ( ON_BOARD ?AUTO_5913 ?AUTO_5916 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5916 ) ( SUPPORTS ?AUTO_5913 ?AUTO_5911 ) ( VISIBLE_FROM ?AUTO_5910 ?AUTO_5914 ) ( CAN_TRAVERSE ?AUTO_5916 ?AUTO_5917 ?AUTO_5914 ) ( VISIBLE ?AUTO_5917 ?AUTO_5914 ) ( CAN_TRAVERSE ?AUTO_5916 ?AUTO_5918 ?AUTO_5917 ) ( VISIBLE ?AUTO_5918 ?AUTO_5917 ) ( CAN_TRAVERSE ?AUTO_5916 ?AUTO_5915 ?AUTO_5918 ) ( VISIBLE ?AUTO_5915 ?AUTO_5918 ) ( CALIBRATION_TARGET ?AUTO_5913 ?AUTO_5912 ) ( VISIBLE_FROM ?AUTO_5912 ?AUTO_5915 ) ( not ( = ?AUTO_5910 ?AUTO_5912 ) ) ( CAN_TRAVERSE ?AUTO_5916 ?AUTO_5918 ?AUTO_5915 ) ( AT ?AUTO_5916 ?AUTO_5917 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5916 ?AUTO_5917 ?AUTO_5918 )
      ( GET_IMAGE_DATA ?AUTO_5910 ?AUTO_5911 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5910 ?AUTO_5911 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5920 - OBJECTIVE
      ?AUTO_5921 - MODE
    )
    :vars
    (
      ?AUTO_5927 - LANDER
      ?AUTO_5929 - WAYPOINT
      ?AUTO_5925 - WAYPOINT
      ?AUTO_5924 - ROVER
      ?AUTO_5926 - WAYPOINT
      ?AUTO_5928 - WAYPOINT
      ?AUTO_5923 - CAMERA
      ?AUTO_5922 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5927 ?AUTO_5929 ) ( VISIBLE ?AUTO_5925 ?AUTO_5929 ) ( AVAILABLE ?AUTO_5924 ) ( CHANNEL_FREE ?AUTO_5927 ) ( not ( = ?AUTO_5925 ?AUTO_5929 ) ) ( CAN_TRAVERSE ?AUTO_5924 ?AUTO_5926 ?AUTO_5925 ) ( VISIBLE ?AUTO_5926 ?AUTO_5925 ) ( not ( = ?AUTO_5929 ?AUTO_5926 ) ) ( not ( = ?AUTO_5925 ?AUTO_5926 ) ) ( CAN_TRAVERSE ?AUTO_5924 ?AUTO_5928 ?AUTO_5926 ) ( VISIBLE ?AUTO_5928 ?AUTO_5926 ) ( not ( = ?AUTO_5929 ?AUTO_5928 ) ) ( not ( = ?AUTO_5925 ?AUTO_5928 ) ) ( not ( = ?AUTO_5926 ?AUTO_5928 ) ) ( ON_BOARD ?AUTO_5923 ?AUTO_5924 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5924 ) ( SUPPORTS ?AUTO_5923 ?AUTO_5921 ) ( VISIBLE_FROM ?AUTO_5920 ?AUTO_5928 ) ( CAN_TRAVERSE ?AUTO_5924 ?AUTO_5926 ?AUTO_5928 ) ( VISIBLE ?AUTO_5926 ?AUTO_5928 ) ( CAN_TRAVERSE ?AUTO_5924 ?AUTO_5925 ?AUTO_5926 ) ( VISIBLE ?AUTO_5925 ?AUTO_5926 ) ( CAN_TRAVERSE ?AUTO_5924 ?AUTO_5929 ?AUTO_5925 ) ( VISIBLE ?AUTO_5929 ?AUTO_5925 ) ( CALIBRATION_TARGET ?AUTO_5923 ?AUTO_5922 ) ( VISIBLE_FROM ?AUTO_5922 ?AUTO_5929 ) ( not ( = ?AUTO_5920 ?AUTO_5922 ) ) ( CAN_TRAVERSE ?AUTO_5924 ?AUTO_5925 ?AUTO_5929 ) ( AT ?AUTO_5924 ?AUTO_5928 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5924 ?AUTO_5928 ?AUTO_5926 )
      ( GET_IMAGE_DATA ?AUTO_5920 ?AUTO_5921 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5920 ?AUTO_5921 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_5934 - OBJECTIVE
      ?AUTO_5935 - MODE
    )
    :vars
    (
      ?AUTO_5937 - LANDER
      ?AUTO_5938 - WAYPOINT
      ?AUTO_5939 - WAYPOINT
      ?AUTO_5943 - ROVER
      ?AUTO_5941 - WAYPOINT
      ?AUTO_5940 - WAYPOINT
      ?AUTO_5936 - CAMERA
      ?AUTO_5942 - OBJECTIVE
      ?AUTO_5944 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_5937 ?AUTO_5938 ) ( VISIBLE ?AUTO_5939 ?AUTO_5938 ) ( AVAILABLE ?AUTO_5943 ) ( CHANNEL_FREE ?AUTO_5937 ) ( not ( = ?AUTO_5939 ?AUTO_5938 ) ) ( CAN_TRAVERSE ?AUTO_5943 ?AUTO_5941 ?AUTO_5939 ) ( VISIBLE ?AUTO_5941 ?AUTO_5939 ) ( not ( = ?AUTO_5938 ?AUTO_5941 ) ) ( not ( = ?AUTO_5939 ?AUTO_5941 ) ) ( CAN_TRAVERSE ?AUTO_5943 ?AUTO_5940 ?AUTO_5941 ) ( VISIBLE ?AUTO_5940 ?AUTO_5941 ) ( not ( = ?AUTO_5938 ?AUTO_5940 ) ) ( not ( = ?AUTO_5939 ?AUTO_5940 ) ) ( not ( = ?AUTO_5941 ?AUTO_5940 ) ) ( ON_BOARD ?AUTO_5936 ?AUTO_5943 ) ( EQUIPPED_FOR_IMAGING ?AUTO_5943 ) ( SUPPORTS ?AUTO_5936 ?AUTO_5935 ) ( VISIBLE_FROM ?AUTO_5934 ?AUTO_5940 ) ( CAN_TRAVERSE ?AUTO_5943 ?AUTO_5941 ?AUTO_5940 ) ( VISIBLE ?AUTO_5941 ?AUTO_5940 ) ( CAN_TRAVERSE ?AUTO_5943 ?AUTO_5939 ?AUTO_5941 ) ( VISIBLE ?AUTO_5939 ?AUTO_5941 ) ( CAN_TRAVERSE ?AUTO_5943 ?AUTO_5938 ?AUTO_5939 ) ( VISIBLE ?AUTO_5938 ?AUTO_5939 ) ( CALIBRATION_TARGET ?AUTO_5936 ?AUTO_5942 ) ( VISIBLE_FROM ?AUTO_5942 ?AUTO_5938 ) ( not ( = ?AUTO_5934 ?AUTO_5942 ) ) ( CAN_TRAVERSE ?AUTO_5943 ?AUTO_5939 ?AUTO_5938 ) ( CAN_TRAVERSE ?AUTO_5943 ?AUTO_5944 ?AUTO_5940 ) ( AT ?AUTO_5943 ?AUTO_5944 ) ( VISIBLE ?AUTO_5944 ?AUTO_5940 ) ( not ( = ?AUTO_5938 ?AUTO_5944 ) ) ( not ( = ?AUTO_5939 ?AUTO_5944 ) ) ( not ( = ?AUTO_5941 ?AUTO_5944 ) ) ( not ( = ?AUTO_5940 ?AUTO_5944 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_5943 ?AUTO_5944 ?AUTO_5940 )
      ( GET_IMAGE_DATA ?AUTO_5934 ?AUTO_5935 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_5934 ?AUTO_5935 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6076 - OBJECTIVE
      ?AUTO_6077 - MODE
    )
    :vars
    (
      ?AUTO_6082 - LANDER
      ?AUTO_6084 - WAYPOINT
      ?AUTO_6080 - WAYPOINT
      ?AUTO_6079 - ROVER
      ?AUTO_6083 - CAMERA
      ?AUTO_6078 - WAYPOINT
      ?AUTO_6081 - WAYPOINT
      ?AUTO_6085 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6082 ?AUTO_6084 ) ( VISIBLE ?AUTO_6080 ?AUTO_6084 ) ( AVAILABLE ?AUTO_6079 ) ( CHANNEL_FREE ?AUTO_6082 ) ( not ( = ?AUTO_6080 ?AUTO_6084 ) ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6084 ?AUTO_6080 ) ( VISIBLE ?AUTO_6084 ?AUTO_6080 ) ( ON_BOARD ?AUTO_6083 ?AUTO_6079 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6079 ) ( SUPPORTS ?AUTO_6083 ?AUTO_6077 ) ( VISIBLE_FROM ?AUTO_6076 ?AUTO_6084 ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6078 ?AUTO_6084 ) ( VISIBLE ?AUTO_6078 ?AUTO_6084 ) ( not ( = ?AUTO_6084 ?AUTO_6078 ) ) ( not ( = ?AUTO_6080 ?AUTO_6078 ) ) ( CAN_TRAVERSE ?AUTO_6079 ?AUTO_6081 ?AUTO_6078 ) ( AT ?AUTO_6079 ?AUTO_6081 ) ( VISIBLE ?AUTO_6081 ?AUTO_6078 ) ( not ( = ?AUTO_6084 ?AUTO_6081 ) ) ( not ( = ?AUTO_6080 ?AUTO_6081 ) ) ( not ( = ?AUTO_6078 ?AUTO_6081 ) ) ( CALIBRATION_TARGET ?AUTO_6083 ?AUTO_6085 ) ( VISIBLE_FROM ?AUTO_6085 ?AUTO_6081 ) ( not ( = ?AUTO_6076 ?AUTO_6085 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6079 ?AUTO_6083 ?AUTO_6085 ?AUTO_6081 )
      ( GET_IMAGE_DATA ?AUTO_6076 ?AUTO_6077 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6076 ?AUTO_6077 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6094 - OBJECTIVE
      ?AUTO_6095 - MODE
    )
    :vars
    (
      ?AUTO_6103 - LANDER
      ?AUTO_6097 - WAYPOINT
      ?AUTO_6098 - WAYPOINT
      ?AUTO_6096 - ROVER
      ?AUTO_6099 - CAMERA
      ?AUTO_6102 - WAYPOINT
      ?AUTO_6101 - WAYPOINT
      ?AUTO_6100 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6103 ?AUTO_6097 ) ( VISIBLE ?AUTO_6098 ?AUTO_6097 ) ( AVAILABLE ?AUTO_6096 ) ( CHANNEL_FREE ?AUTO_6103 ) ( not ( = ?AUTO_6098 ?AUTO_6097 ) ) ( CAN_TRAVERSE ?AUTO_6096 ?AUTO_6097 ?AUTO_6098 ) ( VISIBLE ?AUTO_6097 ?AUTO_6098 ) ( ON_BOARD ?AUTO_6099 ?AUTO_6096 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6096 ) ( SUPPORTS ?AUTO_6099 ?AUTO_6095 ) ( VISIBLE_FROM ?AUTO_6094 ?AUTO_6097 ) ( CAN_TRAVERSE ?AUTO_6096 ?AUTO_6102 ?AUTO_6097 ) ( VISIBLE ?AUTO_6102 ?AUTO_6097 ) ( not ( = ?AUTO_6097 ?AUTO_6102 ) ) ( not ( = ?AUTO_6098 ?AUTO_6102 ) ) ( CAN_TRAVERSE ?AUTO_6096 ?AUTO_6101 ?AUTO_6102 ) ( VISIBLE ?AUTO_6101 ?AUTO_6102 ) ( not ( = ?AUTO_6097 ?AUTO_6101 ) ) ( not ( = ?AUTO_6098 ?AUTO_6101 ) ) ( not ( = ?AUTO_6102 ?AUTO_6101 ) ) ( CALIBRATION_TARGET ?AUTO_6099 ?AUTO_6100 ) ( VISIBLE_FROM ?AUTO_6100 ?AUTO_6101 ) ( not ( = ?AUTO_6094 ?AUTO_6100 ) ) ( CAN_TRAVERSE ?AUTO_6096 ?AUTO_6102 ?AUTO_6101 ) ( AT ?AUTO_6096 ?AUTO_6102 ) ( VISIBLE ?AUTO_6102 ?AUTO_6101 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6096 ?AUTO_6102 ?AUTO_6101 )
      ( GET_IMAGE_DATA ?AUTO_6094 ?AUTO_6095 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6094 ?AUTO_6095 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6174 - OBJECTIVE
      ?AUTO_6175 - MODE
    )
    :vars
    (
      ?AUTO_6181 - LANDER
      ?AUTO_6176 - WAYPOINT
      ?AUTO_6177 - WAYPOINT
      ?AUTO_6180 - ROVER
      ?AUTO_6179 - CAMERA
      ?AUTO_6178 - WAYPOINT
      ?AUTO_6182 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6181 ?AUTO_6176 ) ( VISIBLE ?AUTO_6177 ?AUTO_6176 ) ( AVAILABLE ?AUTO_6180 ) ( CHANNEL_FREE ?AUTO_6181 ) ( not ( = ?AUTO_6177 ?AUTO_6176 ) ) ( CAN_TRAVERSE ?AUTO_6180 ?AUTO_6176 ?AUTO_6177 ) ( VISIBLE ?AUTO_6176 ?AUTO_6177 ) ( ON_BOARD ?AUTO_6179 ?AUTO_6180 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6180 ) ( SUPPORTS ?AUTO_6179 ?AUTO_6175 ) ( VISIBLE_FROM ?AUTO_6174 ?AUTO_6176 ) ( CAN_TRAVERSE ?AUTO_6180 ?AUTO_6178 ?AUTO_6176 ) ( AT ?AUTO_6180 ?AUTO_6178 ) ( VISIBLE ?AUTO_6178 ?AUTO_6176 ) ( not ( = ?AUTO_6176 ?AUTO_6178 ) ) ( not ( = ?AUTO_6177 ?AUTO_6178 ) ) ( CALIBRATION_TARGET ?AUTO_6179 ?AUTO_6182 ) ( VISIBLE_FROM ?AUTO_6182 ?AUTO_6178 ) ( not ( = ?AUTO_6174 ?AUTO_6182 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_6180 ?AUTO_6179 ?AUTO_6182 ?AUTO_6178 )
      ( GET_IMAGE_DATA ?AUTO_6174 ?AUTO_6175 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6174 ?AUTO_6175 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6249 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6251 - LANDER
      ?AUTO_6255 - WAYPOINT
      ?AUTO_6254 - WAYPOINT
      ?AUTO_6252 - ROVER
      ?AUTO_6256 - STORE
      ?AUTO_6250 - WAYPOINT
      ?AUTO_6253 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6251 ?AUTO_6255 ) ( VISIBLE ?AUTO_6254 ?AUTO_6255 ) ( AVAILABLE ?AUTO_6252 ) ( CHANNEL_FREE ?AUTO_6251 ) ( not ( = ?AUTO_6249 ?AUTO_6254 ) ) ( not ( = ?AUTO_6249 ?AUTO_6255 ) ) ( not ( = ?AUTO_6254 ?AUTO_6255 ) ) ( CAN_TRAVERSE ?AUTO_6252 ?AUTO_6249 ?AUTO_6254 ) ( VISIBLE ?AUTO_6249 ?AUTO_6254 ) ( AT_SOIL_SAMPLE ?AUTO_6249 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6252 ) ( STORE_OF ?AUTO_6256 ?AUTO_6252 ) ( EMPTY ?AUTO_6256 ) ( CAN_TRAVERSE ?AUTO_6252 ?AUTO_6250 ?AUTO_6249 ) ( VISIBLE ?AUTO_6250 ?AUTO_6249 ) ( not ( = ?AUTO_6249 ?AUTO_6250 ) ) ( not ( = ?AUTO_6255 ?AUTO_6250 ) ) ( not ( = ?AUTO_6254 ?AUTO_6250 ) ) ( CAN_TRAVERSE ?AUTO_6252 ?AUTO_6253 ?AUTO_6250 ) ( VISIBLE ?AUTO_6253 ?AUTO_6250 ) ( not ( = ?AUTO_6249 ?AUTO_6253 ) ) ( not ( = ?AUTO_6255 ?AUTO_6253 ) ) ( not ( = ?AUTO_6254 ?AUTO_6253 ) ) ( not ( = ?AUTO_6250 ?AUTO_6253 ) ) ( CAN_TRAVERSE ?AUTO_6252 ?AUTO_6255 ?AUTO_6253 ) ( AT ?AUTO_6252 ?AUTO_6255 ) ( VISIBLE ?AUTO_6255 ?AUTO_6253 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6252 ?AUTO_6255 ?AUTO_6253 )
      ( GET_SOIL_DATA ?AUTO_6249 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6249 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6257 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6262 - LANDER
      ?AUTO_6264 - WAYPOINT
      ?AUTO_6258 - WAYPOINT
      ?AUTO_6263 - ROVER
      ?AUTO_6260 - STORE
      ?AUTO_6259 - WAYPOINT
      ?AUTO_6261 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6262 ?AUTO_6264 ) ( VISIBLE ?AUTO_6258 ?AUTO_6264 ) ( AVAILABLE ?AUTO_6263 ) ( CHANNEL_FREE ?AUTO_6262 ) ( not ( = ?AUTO_6257 ?AUTO_6258 ) ) ( not ( = ?AUTO_6257 ?AUTO_6264 ) ) ( not ( = ?AUTO_6258 ?AUTO_6264 ) ) ( CAN_TRAVERSE ?AUTO_6263 ?AUTO_6257 ?AUTO_6258 ) ( VISIBLE ?AUTO_6257 ?AUTO_6258 ) ( AT_SOIL_SAMPLE ?AUTO_6257 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6263 ) ( STORE_OF ?AUTO_6260 ?AUTO_6263 ) ( CAN_TRAVERSE ?AUTO_6263 ?AUTO_6259 ?AUTO_6257 ) ( VISIBLE ?AUTO_6259 ?AUTO_6257 ) ( not ( = ?AUTO_6257 ?AUTO_6259 ) ) ( not ( = ?AUTO_6264 ?AUTO_6259 ) ) ( not ( = ?AUTO_6258 ?AUTO_6259 ) ) ( CAN_TRAVERSE ?AUTO_6263 ?AUTO_6261 ?AUTO_6259 ) ( VISIBLE ?AUTO_6261 ?AUTO_6259 ) ( not ( = ?AUTO_6257 ?AUTO_6261 ) ) ( not ( = ?AUTO_6264 ?AUTO_6261 ) ) ( not ( = ?AUTO_6258 ?AUTO_6261 ) ) ( not ( = ?AUTO_6259 ?AUTO_6261 ) ) ( CAN_TRAVERSE ?AUTO_6263 ?AUTO_6264 ?AUTO_6261 ) ( AT ?AUTO_6263 ?AUTO_6264 ) ( VISIBLE ?AUTO_6264 ?AUTO_6261 ) ( FULL ?AUTO_6260 ) )
    :subtasks
    ( ( !DROP ?AUTO_6263 ?AUTO_6260 )
      ( GET_SOIL_DATA ?AUTO_6257 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6257 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6380 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6385 - LANDER
      ?AUTO_6384 - WAYPOINT
      ?AUTO_6381 - ROVER
      ?AUTO_6382 - STORE
      ?AUTO_6383 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6385 ?AUTO_6380 ) ( VISIBLE ?AUTO_6384 ?AUTO_6380 ) ( AVAILABLE ?AUTO_6381 ) ( CHANNEL_FREE ?AUTO_6385 ) ( not ( = ?AUTO_6380 ?AUTO_6384 ) ) ( CAN_TRAVERSE ?AUTO_6381 ?AUTO_6380 ?AUTO_6384 ) ( VISIBLE ?AUTO_6380 ?AUTO_6384 ) ( AT_SOIL_SAMPLE ?AUTO_6380 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6381 ) ( STORE_OF ?AUTO_6382 ?AUTO_6381 ) ( CAN_TRAVERSE ?AUTO_6381 ?AUTO_6384 ?AUTO_6380 ) ( CAN_TRAVERSE ?AUTO_6381 ?AUTO_6383 ?AUTO_6384 ) ( AT ?AUTO_6381 ?AUTO_6383 ) ( VISIBLE ?AUTO_6383 ?AUTO_6384 ) ( not ( = ?AUTO_6380 ?AUTO_6383 ) ) ( not ( = ?AUTO_6384 ?AUTO_6383 ) ) ( FULL ?AUTO_6382 ) )
    :subtasks
    ( ( !DROP ?AUTO_6381 ?AUTO_6382 )
      ( GET_SOIL_DATA ?AUTO_6380 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6380 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6429 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6431 - LANDER
      ?AUTO_6433 - WAYPOINT
      ?AUTO_6432 - ROVER
      ?AUTO_6430 - STORE
      ?AUTO_6434 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6431 ?AUTO_6429 ) ( VISIBLE ?AUTO_6433 ?AUTO_6429 ) ( AVAILABLE ?AUTO_6432 ) ( CHANNEL_FREE ?AUTO_6431 ) ( not ( = ?AUTO_6429 ?AUTO_6433 ) ) ( CAN_TRAVERSE ?AUTO_6432 ?AUTO_6429 ?AUTO_6433 ) ( VISIBLE ?AUTO_6429 ?AUTO_6433 ) ( AT_ROCK_SAMPLE ?AUTO_6429 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6432 ) ( STORE_OF ?AUTO_6430 ?AUTO_6432 ) ( EMPTY ?AUTO_6430 ) ( CAN_TRAVERSE ?AUTO_6432 ?AUTO_6433 ?AUTO_6429 ) ( CAN_TRAVERSE ?AUTO_6432 ?AUTO_6434 ?AUTO_6433 ) ( AT ?AUTO_6432 ?AUTO_6434 ) ( VISIBLE ?AUTO_6434 ?AUTO_6433 ) ( not ( = ?AUTO_6429 ?AUTO_6434 ) ) ( not ( = ?AUTO_6433 ?AUTO_6434 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6432 ?AUTO_6434 ?AUTO_6433 )
      ( GET_ROCK_DATA ?AUTO_6429 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6429 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6435 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6437 - LANDER
      ?AUTO_6438 - WAYPOINT
      ?AUTO_6436 - ROVER
      ?AUTO_6439 - STORE
      ?AUTO_6440 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6437 ?AUTO_6435 ) ( VISIBLE ?AUTO_6438 ?AUTO_6435 ) ( AVAILABLE ?AUTO_6436 ) ( CHANNEL_FREE ?AUTO_6437 ) ( not ( = ?AUTO_6435 ?AUTO_6438 ) ) ( CAN_TRAVERSE ?AUTO_6436 ?AUTO_6435 ?AUTO_6438 ) ( VISIBLE ?AUTO_6435 ?AUTO_6438 ) ( AT_ROCK_SAMPLE ?AUTO_6435 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6436 ) ( STORE_OF ?AUTO_6439 ?AUTO_6436 ) ( CAN_TRAVERSE ?AUTO_6436 ?AUTO_6438 ?AUTO_6435 ) ( CAN_TRAVERSE ?AUTO_6436 ?AUTO_6440 ?AUTO_6438 ) ( AT ?AUTO_6436 ?AUTO_6440 ) ( VISIBLE ?AUTO_6440 ?AUTO_6438 ) ( not ( = ?AUTO_6435 ?AUTO_6440 ) ) ( not ( = ?AUTO_6438 ?AUTO_6440 ) ) ( FULL ?AUTO_6439 ) )
    :subtasks
    ( ( !DROP ?AUTO_6436 ?AUTO_6439 )
      ( GET_ROCK_DATA ?AUTO_6435 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6435 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6494 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6496 - LANDER
      ?AUTO_6498 - WAYPOINT
      ?AUTO_6495 - WAYPOINT
      ?AUTO_6500 - ROVER
      ?AUTO_6499 - WAYPOINT
      ?AUTO_6497 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6496 ?AUTO_6498 ) ( VISIBLE ?AUTO_6495 ?AUTO_6498 ) ( AVAILABLE ?AUTO_6500 ) ( CHANNEL_FREE ?AUTO_6496 ) ( not ( = ?AUTO_6494 ?AUTO_6495 ) ) ( not ( = ?AUTO_6494 ?AUTO_6498 ) ) ( not ( = ?AUTO_6495 ?AUTO_6498 ) ) ( CAN_TRAVERSE ?AUTO_6500 ?AUTO_6499 ?AUTO_6495 ) ( VISIBLE ?AUTO_6499 ?AUTO_6495 ) ( not ( = ?AUTO_6494 ?AUTO_6499 ) ) ( not ( = ?AUTO_6498 ?AUTO_6499 ) ) ( not ( = ?AUTO_6495 ?AUTO_6499 ) ) ( CAN_TRAVERSE ?AUTO_6500 ?AUTO_6494 ?AUTO_6499 ) ( VISIBLE ?AUTO_6494 ?AUTO_6499 ) ( AT_SOIL_SAMPLE ?AUTO_6494 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6500 ) ( STORE_OF ?AUTO_6497 ?AUTO_6500 ) ( EMPTY ?AUTO_6497 ) ( CAN_TRAVERSE ?AUTO_6500 ?AUTO_6499 ?AUTO_6494 ) ( VISIBLE ?AUTO_6499 ?AUTO_6494 ) ( CAN_TRAVERSE ?AUTO_6500 ?AUTO_6495 ?AUTO_6499 ) ( VISIBLE ?AUTO_6495 ?AUTO_6499 ) ( CAN_TRAVERSE ?AUTO_6500 ?AUTO_6498 ?AUTO_6495 ) ( AT ?AUTO_6500 ?AUTO_6498 ) ( VISIBLE ?AUTO_6498 ?AUTO_6495 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6500 ?AUTO_6498 ?AUTO_6495 )
      ( GET_SOIL_DATA ?AUTO_6494 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6494 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6501 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6503 - LANDER
      ?AUTO_6507 - WAYPOINT
      ?AUTO_6502 - WAYPOINT
      ?AUTO_6506 - ROVER
      ?AUTO_6505 - WAYPOINT
      ?AUTO_6504 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6503 ?AUTO_6507 ) ( VISIBLE ?AUTO_6502 ?AUTO_6507 ) ( AVAILABLE ?AUTO_6506 ) ( CHANNEL_FREE ?AUTO_6503 ) ( not ( = ?AUTO_6501 ?AUTO_6502 ) ) ( not ( = ?AUTO_6501 ?AUTO_6507 ) ) ( not ( = ?AUTO_6502 ?AUTO_6507 ) ) ( CAN_TRAVERSE ?AUTO_6506 ?AUTO_6505 ?AUTO_6502 ) ( VISIBLE ?AUTO_6505 ?AUTO_6502 ) ( not ( = ?AUTO_6501 ?AUTO_6505 ) ) ( not ( = ?AUTO_6507 ?AUTO_6505 ) ) ( not ( = ?AUTO_6502 ?AUTO_6505 ) ) ( CAN_TRAVERSE ?AUTO_6506 ?AUTO_6501 ?AUTO_6505 ) ( VISIBLE ?AUTO_6501 ?AUTO_6505 ) ( AT_SOIL_SAMPLE ?AUTO_6501 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6506 ) ( STORE_OF ?AUTO_6504 ?AUTO_6506 ) ( CAN_TRAVERSE ?AUTO_6506 ?AUTO_6505 ?AUTO_6501 ) ( VISIBLE ?AUTO_6505 ?AUTO_6501 ) ( CAN_TRAVERSE ?AUTO_6506 ?AUTO_6502 ?AUTO_6505 ) ( VISIBLE ?AUTO_6502 ?AUTO_6505 ) ( CAN_TRAVERSE ?AUTO_6506 ?AUTO_6507 ?AUTO_6502 ) ( AT ?AUTO_6506 ?AUTO_6507 ) ( VISIBLE ?AUTO_6507 ?AUTO_6502 ) ( FULL ?AUTO_6504 ) )
    :subtasks
    ( ( !DROP ?AUTO_6506 ?AUTO_6504 )
      ( GET_SOIL_DATA ?AUTO_6501 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6501 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6517 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6519 - LANDER
      ?AUTO_6520 - WAYPOINT
      ?AUTO_6518 - WAYPOINT
      ?AUTO_6521 - ROVER
      ?AUTO_6522 - WAYPOINT
      ?AUTO_6523 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6519 ?AUTO_6520 ) ( VISIBLE ?AUTO_6518 ?AUTO_6520 ) ( AVAILABLE ?AUTO_6521 ) ( CHANNEL_FREE ?AUTO_6519 ) ( not ( = ?AUTO_6517 ?AUTO_6518 ) ) ( not ( = ?AUTO_6517 ?AUTO_6520 ) ) ( not ( = ?AUTO_6518 ?AUTO_6520 ) ) ( CAN_TRAVERSE ?AUTO_6521 ?AUTO_6522 ?AUTO_6518 ) ( VISIBLE ?AUTO_6522 ?AUTO_6518 ) ( not ( = ?AUTO_6517 ?AUTO_6522 ) ) ( not ( = ?AUTO_6520 ?AUTO_6522 ) ) ( not ( = ?AUTO_6518 ?AUTO_6522 ) ) ( CAN_TRAVERSE ?AUTO_6521 ?AUTO_6517 ?AUTO_6522 ) ( VISIBLE ?AUTO_6517 ?AUTO_6522 ) ( AT_SOIL_SAMPLE ?AUTO_6517 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6521 ) ( STORE_OF ?AUTO_6523 ?AUTO_6521 ) ( CAN_TRAVERSE ?AUTO_6521 ?AUTO_6522 ?AUTO_6517 ) ( AT ?AUTO_6521 ?AUTO_6522 ) ( VISIBLE ?AUTO_6522 ?AUTO_6517 ) ( FULL ?AUTO_6523 ) )
    :subtasks
    ( ( !DROP ?AUTO_6521 ?AUTO_6523 )
      ( GET_SOIL_DATA ?AUTO_6517 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6517 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_6526 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6528 - LANDER
      ?AUTO_6531 - WAYPOINT
      ?AUTO_6527 - WAYPOINT
      ?AUTO_6529 - ROVER
      ?AUTO_6532 - WAYPOINT
      ?AUTO_6530 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6528 ?AUTO_6531 ) ( VISIBLE ?AUTO_6527 ?AUTO_6531 ) ( AVAILABLE ?AUTO_6529 ) ( CHANNEL_FREE ?AUTO_6528 ) ( not ( = ?AUTO_6526 ?AUTO_6527 ) ) ( not ( = ?AUTO_6526 ?AUTO_6531 ) ) ( not ( = ?AUTO_6527 ?AUTO_6531 ) ) ( CAN_TRAVERSE ?AUTO_6529 ?AUTO_6532 ?AUTO_6527 ) ( VISIBLE ?AUTO_6532 ?AUTO_6527 ) ( not ( = ?AUTO_6526 ?AUTO_6532 ) ) ( not ( = ?AUTO_6531 ?AUTO_6532 ) ) ( not ( = ?AUTO_6527 ?AUTO_6532 ) ) ( CAN_TRAVERSE ?AUTO_6529 ?AUTO_6526 ?AUTO_6532 ) ( VISIBLE ?AUTO_6526 ?AUTO_6532 ) ( AT_SOIL_SAMPLE ?AUTO_6526 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_6529 ) ( STORE_OF ?AUTO_6530 ?AUTO_6529 ) ( CAN_TRAVERSE ?AUTO_6529 ?AUTO_6532 ?AUTO_6526 ) ( VISIBLE ?AUTO_6532 ?AUTO_6526 ) ( CAN_TRAVERSE ?AUTO_6529 ?AUTO_6527 ?AUTO_6532 ) ( AT ?AUTO_6529 ?AUTO_6527 ) ( VISIBLE ?AUTO_6527 ?AUTO_6532 ) ( FULL ?AUTO_6530 ) )
    :subtasks
    ( ( !DROP ?AUTO_6529 ?AUTO_6530 )
      ( GET_SOIL_DATA ?AUTO_6526 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_6526 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6579 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6581 - LANDER
      ?AUTO_6583 - WAYPOINT
      ?AUTO_6582 - WAYPOINT
      ?AUTO_6584 - ROVER
      ?AUTO_6580 - STORE
      ?AUTO_6585 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6581 ?AUTO_6583 ) ( VISIBLE ?AUTO_6582 ?AUTO_6583 ) ( AVAILABLE ?AUTO_6584 ) ( CHANNEL_FREE ?AUTO_6581 ) ( not ( = ?AUTO_6579 ?AUTO_6582 ) ) ( not ( = ?AUTO_6579 ?AUTO_6583 ) ) ( not ( = ?AUTO_6582 ?AUTO_6583 ) ) ( CAN_TRAVERSE ?AUTO_6584 ?AUTO_6579 ?AUTO_6582 ) ( VISIBLE ?AUTO_6579 ?AUTO_6582 ) ( AT_ROCK_SAMPLE ?AUTO_6579 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6584 ) ( STORE_OF ?AUTO_6580 ?AUTO_6584 ) ( FULL ?AUTO_6580 ) ( CAN_TRAVERSE ?AUTO_6584 ?AUTO_6585 ?AUTO_6579 ) ( AT ?AUTO_6584 ?AUTO_6585 ) ( VISIBLE ?AUTO_6585 ?AUTO_6579 ) ( not ( = ?AUTO_6579 ?AUTO_6585 ) ) ( not ( = ?AUTO_6583 ?AUTO_6585 ) ) ( not ( = ?AUTO_6582 ?AUTO_6585 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6584 ?AUTO_6585 ?AUTO_6579 )
      ( GET_ROCK_DATA ?AUTO_6579 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6579 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6586 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6588 - LANDER
      ?AUTO_6591 - WAYPOINT
      ?AUTO_6587 - WAYPOINT
      ?AUTO_6589 - ROVER
      ?AUTO_6590 - STORE
      ?AUTO_6592 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6588 ?AUTO_6591 ) ( VISIBLE ?AUTO_6587 ?AUTO_6591 ) ( AVAILABLE ?AUTO_6589 ) ( CHANNEL_FREE ?AUTO_6588 ) ( not ( = ?AUTO_6586 ?AUTO_6587 ) ) ( not ( = ?AUTO_6586 ?AUTO_6591 ) ) ( not ( = ?AUTO_6587 ?AUTO_6591 ) ) ( CAN_TRAVERSE ?AUTO_6589 ?AUTO_6586 ?AUTO_6587 ) ( VISIBLE ?AUTO_6586 ?AUTO_6587 ) ( AT_ROCK_SAMPLE ?AUTO_6586 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6589 ) ( STORE_OF ?AUTO_6590 ?AUTO_6589 ) ( CAN_TRAVERSE ?AUTO_6589 ?AUTO_6592 ?AUTO_6586 ) ( AT ?AUTO_6589 ?AUTO_6592 ) ( VISIBLE ?AUTO_6592 ?AUTO_6586 ) ( not ( = ?AUTO_6586 ?AUTO_6592 ) ) ( not ( = ?AUTO_6591 ?AUTO_6592 ) ) ( not ( = ?AUTO_6587 ?AUTO_6592 ) ) ( AT_ROCK_SAMPLE ?AUTO_6592 ) ( EMPTY ?AUTO_6590 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_6589 ?AUTO_6590 ?AUTO_6592 )
      ( GET_ROCK_DATA ?AUTO_6586 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6586 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10892 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10894 - LANDER
      ?AUTO_10893 - WAYPOINT
      ?AUTO_10897 - WAYPOINT
      ?AUTO_10896 - ROVER
      ?AUTO_10895 - STORE
      ?AUTO_10898 - WAYPOINT
      ?AUTO_10899 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10894 ?AUTO_10893 ) ( VISIBLE ?AUTO_10897 ?AUTO_10893 ) ( AVAILABLE ?AUTO_10896 ) ( CHANNEL_FREE ?AUTO_10894 ) ( not ( = ?AUTO_10892 ?AUTO_10897 ) ) ( not ( = ?AUTO_10892 ?AUTO_10893 ) ) ( not ( = ?AUTO_10897 ?AUTO_10893 ) ) ( CAN_TRAVERSE ?AUTO_10896 ?AUTO_10892 ?AUTO_10897 ) ( VISIBLE ?AUTO_10892 ?AUTO_10897 ) ( AT_ROCK_SAMPLE ?AUTO_10892 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10896 ) ( STORE_OF ?AUTO_10895 ?AUTO_10896 ) ( EMPTY ?AUTO_10895 ) ( CAN_TRAVERSE ?AUTO_10896 ?AUTO_10898 ?AUTO_10892 ) ( VISIBLE ?AUTO_10898 ?AUTO_10892 ) ( not ( = ?AUTO_10892 ?AUTO_10898 ) ) ( not ( = ?AUTO_10893 ?AUTO_10898 ) ) ( not ( = ?AUTO_10897 ?AUTO_10898 ) ) ( CAN_TRAVERSE ?AUTO_10896 ?AUTO_10899 ?AUTO_10898 ) ( VISIBLE ?AUTO_10899 ?AUTO_10898 ) ( not ( = ?AUTO_10892 ?AUTO_10899 ) ) ( not ( = ?AUTO_10893 ?AUTO_10899 ) ) ( not ( = ?AUTO_10897 ?AUTO_10899 ) ) ( not ( = ?AUTO_10898 ?AUTO_10899 ) ) ( CAN_TRAVERSE ?AUTO_10896 ?AUTO_10897 ?AUTO_10899 ) ( AT ?AUTO_10896 ?AUTO_10897 ) ( VISIBLE ?AUTO_10897 ?AUTO_10899 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10896 ?AUTO_10897 ?AUTO_10899 )
      ( GET_ROCK_DATA ?AUTO_10892 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10892 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6623 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6625 - LANDER
      ?AUTO_6624 - WAYPOINT
      ?AUTO_6630 - WAYPOINT
      ?AUTO_6628 - ROVER
      ?AUTO_6629 - STORE
      ?AUTO_6627 - WAYPOINT
      ?AUTO_6626 - WAYPOINT
      ?AUTO_6631 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6625 ?AUTO_6624 ) ( VISIBLE ?AUTO_6630 ?AUTO_6624 ) ( AVAILABLE ?AUTO_6628 ) ( CHANNEL_FREE ?AUTO_6625 ) ( not ( = ?AUTO_6623 ?AUTO_6630 ) ) ( not ( = ?AUTO_6623 ?AUTO_6624 ) ) ( not ( = ?AUTO_6630 ?AUTO_6624 ) ) ( CAN_TRAVERSE ?AUTO_6628 ?AUTO_6623 ?AUTO_6630 ) ( VISIBLE ?AUTO_6623 ?AUTO_6630 ) ( AT_ROCK_SAMPLE ?AUTO_6623 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6628 ) ( STORE_OF ?AUTO_6629 ?AUTO_6628 ) ( CAN_TRAVERSE ?AUTO_6628 ?AUTO_6627 ?AUTO_6623 ) ( VISIBLE ?AUTO_6627 ?AUTO_6623 ) ( not ( = ?AUTO_6623 ?AUTO_6627 ) ) ( not ( = ?AUTO_6624 ?AUTO_6627 ) ) ( not ( = ?AUTO_6630 ?AUTO_6627 ) ) ( CAN_TRAVERSE ?AUTO_6628 ?AUTO_6626 ?AUTO_6627 ) ( VISIBLE ?AUTO_6626 ?AUTO_6627 ) ( not ( = ?AUTO_6623 ?AUTO_6626 ) ) ( not ( = ?AUTO_6624 ?AUTO_6626 ) ) ( not ( = ?AUTO_6630 ?AUTO_6626 ) ) ( not ( = ?AUTO_6627 ?AUTO_6626 ) ) ( AT_ROCK_SAMPLE ?AUTO_6626 ) ( EMPTY ?AUTO_6629 ) ( CAN_TRAVERSE ?AUTO_6628 ?AUTO_6630 ?AUTO_6626 ) ( VISIBLE ?AUTO_6630 ?AUTO_6626 ) ( CAN_TRAVERSE ?AUTO_6628 ?AUTO_6631 ?AUTO_6630 ) ( AT ?AUTO_6628 ?AUTO_6631 ) ( VISIBLE ?AUTO_6631 ?AUTO_6630 ) ( not ( = ?AUTO_6623 ?AUTO_6631 ) ) ( not ( = ?AUTO_6624 ?AUTO_6631 ) ) ( not ( = ?AUTO_6630 ?AUTO_6631 ) ) ( not ( = ?AUTO_6627 ?AUTO_6631 ) ) ( not ( = ?AUTO_6626 ?AUTO_6631 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6628 ?AUTO_6631 ?AUTO_6630 )
      ( GET_ROCK_DATA ?AUTO_6623 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6623 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6657 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6661 - LANDER
      ?AUTO_6658 - WAYPOINT
      ?AUTO_6660 - WAYPOINT
      ?AUTO_6662 - ROVER
      ?AUTO_6659 - STORE
      ?AUTO_6663 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6661 ?AUTO_6658 ) ( VISIBLE ?AUTO_6660 ?AUTO_6658 ) ( AVAILABLE ?AUTO_6662 ) ( CHANNEL_FREE ?AUTO_6661 ) ( not ( = ?AUTO_6657 ?AUTO_6660 ) ) ( not ( = ?AUTO_6657 ?AUTO_6658 ) ) ( not ( = ?AUTO_6660 ?AUTO_6658 ) ) ( CAN_TRAVERSE ?AUTO_6662 ?AUTO_6657 ?AUTO_6660 ) ( VISIBLE ?AUTO_6657 ?AUTO_6660 ) ( AT_ROCK_SAMPLE ?AUTO_6657 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6662 ) ( STORE_OF ?AUTO_6659 ?AUTO_6662 ) ( CAN_TRAVERSE ?AUTO_6662 ?AUTO_6663 ?AUTO_6657 ) ( VISIBLE ?AUTO_6663 ?AUTO_6657 ) ( not ( = ?AUTO_6657 ?AUTO_6663 ) ) ( not ( = ?AUTO_6658 ?AUTO_6663 ) ) ( not ( = ?AUTO_6660 ?AUTO_6663 ) ) ( AT_ROCK_SAMPLE ?AUTO_6663 ) ( EMPTY ?AUTO_6659 ) ( CAN_TRAVERSE ?AUTO_6662 ?AUTO_6660 ?AUTO_6663 ) ( AT ?AUTO_6662 ?AUTO_6660 ) ( VISIBLE ?AUTO_6660 ?AUTO_6663 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6662 ?AUTO_6660 ?AUTO_6663 )
      ( GET_ROCK_DATA ?AUTO_6657 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6657 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6665 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6669 - LANDER
      ?AUTO_6666 - WAYPOINT
      ?AUTO_6671 - WAYPOINT
      ?AUTO_6668 - ROVER
      ?AUTO_6670 - STORE
      ?AUTO_6667 - WAYPOINT
      ?AUTO_6672 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6669 ?AUTO_6666 ) ( VISIBLE ?AUTO_6671 ?AUTO_6666 ) ( AVAILABLE ?AUTO_6668 ) ( CHANNEL_FREE ?AUTO_6669 ) ( not ( = ?AUTO_6665 ?AUTO_6671 ) ) ( not ( = ?AUTO_6665 ?AUTO_6666 ) ) ( not ( = ?AUTO_6671 ?AUTO_6666 ) ) ( CAN_TRAVERSE ?AUTO_6668 ?AUTO_6665 ?AUTO_6671 ) ( VISIBLE ?AUTO_6665 ?AUTO_6671 ) ( AT_ROCK_SAMPLE ?AUTO_6665 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6668 ) ( STORE_OF ?AUTO_6670 ?AUTO_6668 ) ( CAN_TRAVERSE ?AUTO_6668 ?AUTO_6667 ?AUTO_6665 ) ( VISIBLE ?AUTO_6667 ?AUTO_6665 ) ( not ( = ?AUTO_6665 ?AUTO_6667 ) ) ( not ( = ?AUTO_6666 ?AUTO_6667 ) ) ( not ( = ?AUTO_6671 ?AUTO_6667 ) ) ( AT_ROCK_SAMPLE ?AUTO_6667 ) ( EMPTY ?AUTO_6670 ) ( CAN_TRAVERSE ?AUTO_6668 ?AUTO_6671 ?AUTO_6667 ) ( VISIBLE ?AUTO_6671 ?AUTO_6667 ) ( CAN_TRAVERSE ?AUTO_6668 ?AUTO_6672 ?AUTO_6671 ) ( AT ?AUTO_6668 ?AUTO_6672 ) ( VISIBLE ?AUTO_6672 ?AUTO_6671 ) ( not ( = ?AUTO_6665 ?AUTO_6672 ) ) ( not ( = ?AUTO_6666 ?AUTO_6672 ) ) ( not ( = ?AUTO_6671 ?AUTO_6672 ) ) ( not ( = ?AUTO_6667 ?AUTO_6672 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6668 ?AUTO_6672 ?AUTO_6671 )
      ( GET_ROCK_DATA ?AUTO_6665 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6665 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6744 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6748 - LANDER
      ?AUTO_6747 - WAYPOINT
      ?AUTO_6746 - ROVER
      ?AUTO_6745 - STORE
      ?AUTO_6749 - WAYPOINT
      ?AUTO_6750 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6748 ?AUTO_6744 ) ( VISIBLE ?AUTO_6747 ?AUTO_6744 ) ( AVAILABLE ?AUTO_6746 ) ( CHANNEL_FREE ?AUTO_6748 ) ( not ( = ?AUTO_6744 ?AUTO_6747 ) ) ( CAN_TRAVERSE ?AUTO_6746 ?AUTO_6744 ?AUTO_6747 ) ( VISIBLE ?AUTO_6744 ?AUTO_6747 ) ( AT_ROCK_SAMPLE ?AUTO_6744 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6746 ) ( STORE_OF ?AUTO_6745 ?AUTO_6746 ) ( CAN_TRAVERSE ?AUTO_6746 ?AUTO_6749 ?AUTO_6744 ) ( VISIBLE ?AUTO_6749 ?AUTO_6744 ) ( not ( = ?AUTO_6744 ?AUTO_6749 ) ) ( not ( = ?AUTO_6747 ?AUTO_6749 ) ) ( CAN_TRAVERSE ?AUTO_6746 ?AUTO_6750 ?AUTO_6749 ) ( AT ?AUTO_6746 ?AUTO_6750 ) ( VISIBLE ?AUTO_6750 ?AUTO_6749 ) ( not ( = ?AUTO_6744 ?AUTO_6750 ) ) ( not ( = ?AUTO_6747 ?AUTO_6750 ) ) ( not ( = ?AUTO_6749 ?AUTO_6750 ) ) ( FULL ?AUTO_6745 ) )
    :subtasks
    ( ( !DROP ?AUTO_6746 ?AUTO_6745 )
      ( GET_ROCK_DATA ?AUTO_6744 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6744 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_6764 - WAYPOINT
    )
    :vars
    (
      ?AUTO_6767 - LANDER
      ?AUTO_6768 - WAYPOINT
      ?AUTO_6766 - ROVER
      ?AUTO_6765 - STORE
      ?AUTO_6769 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6767 ?AUTO_6764 ) ( VISIBLE ?AUTO_6768 ?AUTO_6764 ) ( AVAILABLE ?AUTO_6766 ) ( CHANNEL_FREE ?AUTO_6767 ) ( not ( = ?AUTO_6764 ?AUTO_6768 ) ) ( CAN_TRAVERSE ?AUTO_6766 ?AUTO_6764 ?AUTO_6768 ) ( VISIBLE ?AUTO_6764 ?AUTO_6768 ) ( AT_ROCK_SAMPLE ?AUTO_6764 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_6766 ) ( STORE_OF ?AUTO_6765 ?AUTO_6766 ) ( EMPTY ?AUTO_6765 ) ( CAN_TRAVERSE ?AUTO_6766 ?AUTO_6769 ?AUTO_6764 ) ( VISIBLE ?AUTO_6769 ?AUTO_6764 ) ( not ( = ?AUTO_6764 ?AUTO_6769 ) ) ( not ( = ?AUTO_6768 ?AUTO_6769 ) ) ( CAN_TRAVERSE ?AUTO_6766 ?AUTO_6768 ?AUTO_6769 ) ( AT ?AUTO_6766 ?AUTO_6768 ) ( VISIBLE ?AUTO_6768 ?AUTO_6769 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6766 ?AUTO_6768 ?AUTO_6769 )
      ( GET_ROCK_DATA ?AUTO_6764 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_6764 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6824 - OBJECTIVE
      ?AUTO_6825 - MODE
    )
    :vars
    (
      ?AUTO_6826 - LANDER
      ?AUTO_6831 - WAYPOINT
      ?AUTO_6830 - WAYPOINT
      ?AUTO_6827 - ROVER
      ?AUTO_6828 - CAMERA
      ?AUTO_6829 - WAYPOINT
      ?AUTO_6832 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6826 ?AUTO_6831 ) ( VISIBLE ?AUTO_6830 ?AUTO_6831 ) ( AVAILABLE ?AUTO_6827 ) ( CHANNEL_FREE ?AUTO_6826 ) ( not ( = ?AUTO_6830 ?AUTO_6831 ) ) ( CAN_TRAVERSE ?AUTO_6827 ?AUTO_6831 ?AUTO_6830 ) ( VISIBLE ?AUTO_6831 ?AUTO_6830 ) ( ON_BOARD ?AUTO_6828 ?AUTO_6827 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6827 ) ( SUPPORTS ?AUTO_6828 ?AUTO_6825 ) ( VISIBLE_FROM ?AUTO_6824 ?AUTO_6831 ) ( CALIBRATION_TARGET ?AUTO_6828 ?AUTO_6824 ) ( CAN_TRAVERSE ?AUTO_6827 ?AUTO_6829 ?AUTO_6831 ) ( VISIBLE ?AUTO_6829 ?AUTO_6831 ) ( not ( = ?AUTO_6831 ?AUTO_6829 ) ) ( not ( = ?AUTO_6830 ?AUTO_6829 ) ) ( CAN_TRAVERSE ?AUTO_6827 ?AUTO_6832 ?AUTO_6829 ) ( AT ?AUTO_6827 ?AUTO_6832 ) ( VISIBLE ?AUTO_6832 ?AUTO_6829 ) ( not ( = ?AUTO_6831 ?AUTO_6832 ) ) ( not ( = ?AUTO_6830 ?AUTO_6832 ) ) ( not ( = ?AUTO_6829 ?AUTO_6832 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6827 ?AUTO_6832 ?AUTO_6829 )
      ( GET_IMAGE_DATA ?AUTO_6824 ?AUTO_6825 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6824 ?AUTO_6825 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6861 - OBJECTIVE
      ?AUTO_6862 - MODE
    )
    :vars
    (
      ?AUTO_6868 - LANDER
      ?AUTO_6864 - WAYPOINT
      ?AUTO_6865 - WAYPOINT
      ?AUTO_6867 - ROVER
      ?AUTO_6866 - CAMERA
      ?AUTO_6863 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6868 ?AUTO_6864 ) ( VISIBLE ?AUTO_6865 ?AUTO_6864 ) ( AVAILABLE ?AUTO_6867 ) ( CHANNEL_FREE ?AUTO_6868 ) ( not ( = ?AUTO_6865 ?AUTO_6864 ) ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6864 ?AUTO_6865 ) ( VISIBLE ?AUTO_6864 ?AUTO_6865 ) ( ON_BOARD ?AUTO_6866 ?AUTO_6867 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6867 ) ( SUPPORTS ?AUTO_6866 ?AUTO_6862 ) ( VISIBLE_FROM ?AUTO_6861 ?AUTO_6864 ) ( CALIBRATION_TARGET ?AUTO_6866 ?AUTO_6861 ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6863 ?AUTO_6864 ) ( VISIBLE ?AUTO_6863 ?AUTO_6864 ) ( not ( = ?AUTO_6864 ?AUTO_6863 ) ) ( not ( = ?AUTO_6865 ?AUTO_6863 ) ) ( CAN_TRAVERSE ?AUTO_6867 ?AUTO_6865 ?AUTO_6863 ) ( AT ?AUTO_6867 ?AUTO_6865 ) ( VISIBLE ?AUTO_6865 ?AUTO_6863 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6867 ?AUTO_6865 ?AUTO_6863 )
      ( GET_IMAGE_DATA ?AUTO_6861 ?AUTO_6862 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6861 ?AUTO_6862 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6908 - OBJECTIVE
      ?AUTO_6909 - MODE
    )
    :vars
    (
      ?AUTO_6911 - LANDER
      ?AUTO_6913 - WAYPOINT
      ?AUTO_6914 - WAYPOINT
      ?AUTO_6912 - ROVER
      ?AUTO_6910 - CAMERA
      ?AUTO_6915 - OBJECTIVE
      ?AUTO_6916 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6911 ?AUTO_6913 ) ( VISIBLE ?AUTO_6914 ?AUTO_6913 ) ( AVAILABLE ?AUTO_6912 ) ( CHANNEL_FREE ?AUTO_6911 ) ( not ( = ?AUTO_6914 ?AUTO_6913 ) ) ( CAN_TRAVERSE ?AUTO_6912 ?AUTO_6913 ?AUTO_6914 ) ( VISIBLE ?AUTO_6913 ?AUTO_6914 ) ( ON_BOARD ?AUTO_6910 ?AUTO_6912 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6912 ) ( SUPPORTS ?AUTO_6910 ?AUTO_6909 ) ( VISIBLE_FROM ?AUTO_6908 ?AUTO_6913 ) ( CALIBRATION_TARGET ?AUTO_6910 ?AUTO_6915 ) ( VISIBLE_FROM ?AUTO_6915 ?AUTO_6913 ) ( not ( = ?AUTO_6908 ?AUTO_6915 ) ) ( CAN_TRAVERSE ?AUTO_6912 ?AUTO_6916 ?AUTO_6913 ) ( AT ?AUTO_6912 ?AUTO_6916 ) ( VISIBLE ?AUTO_6916 ?AUTO_6913 ) ( not ( = ?AUTO_6913 ?AUTO_6916 ) ) ( not ( = ?AUTO_6914 ?AUTO_6916 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6912 ?AUTO_6916 ?AUTO_6913 )
      ( GET_IMAGE_DATA ?AUTO_6908 ?AUTO_6909 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6908 ?AUTO_6909 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6923 - OBJECTIVE
      ?AUTO_6924 - MODE
    )
    :vars
    (
      ?AUTO_6925 - LANDER
      ?AUTO_6926 - WAYPOINT
      ?AUTO_6930 - WAYPOINT
      ?AUTO_6929 - ROVER
      ?AUTO_6927 - CAMERA
      ?AUTO_6931 - OBJECTIVE
      ?AUTO_6928 - WAYPOINT
      ?AUTO_6932 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6925 ?AUTO_6926 ) ( VISIBLE ?AUTO_6930 ?AUTO_6926 ) ( AVAILABLE ?AUTO_6929 ) ( CHANNEL_FREE ?AUTO_6925 ) ( not ( = ?AUTO_6930 ?AUTO_6926 ) ) ( CAN_TRAVERSE ?AUTO_6929 ?AUTO_6926 ?AUTO_6930 ) ( VISIBLE ?AUTO_6926 ?AUTO_6930 ) ( ON_BOARD ?AUTO_6927 ?AUTO_6929 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6929 ) ( SUPPORTS ?AUTO_6927 ?AUTO_6924 ) ( VISIBLE_FROM ?AUTO_6923 ?AUTO_6926 ) ( CALIBRATION_TARGET ?AUTO_6927 ?AUTO_6931 ) ( VISIBLE_FROM ?AUTO_6931 ?AUTO_6926 ) ( not ( = ?AUTO_6923 ?AUTO_6931 ) ) ( CAN_TRAVERSE ?AUTO_6929 ?AUTO_6928 ?AUTO_6926 ) ( VISIBLE ?AUTO_6928 ?AUTO_6926 ) ( not ( = ?AUTO_6926 ?AUTO_6928 ) ) ( not ( = ?AUTO_6930 ?AUTO_6928 ) ) ( CAN_TRAVERSE ?AUTO_6929 ?AUTO_6932 ?AUTO_6928 ) ( AT ?AUTO_6929 ?AUTO_6932 ) ( VISIBLE ?AUTO_6932 ?AUTO_6928 ) ( not ( = ?AUTO_6926 ?AUTO_6932 ) ) ( not ( = ?AUTO_6930 ?AUTO_6932 ) ) ( not ( = ?AUTO_6928 ?AUTO_6932 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6929 ?AUTO_6932 ?AUTO_6928 )
      ( GET_IMAGE_DATA ?AUTO_6923 ?AUTO_6924 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6923 ?AUTO_6924 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_6961 - OBJECTIVE
      ?AUTO_6962 - MODE
    )
    :vars
    (
      ?AUTO_6969 - LANDER
      ?AUTO_6968 - WAYPOINT
      ?AUTO_6964 - WAYPOINT
      ?AUTO_6966 - ROVER
      ?AUTO_6965 - CAMERA
      ?AUTO_6967 - OBJECTIVE
      ?AUTO_6963 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_6969 ?AUTO_6968 ) ( VISIBLE ?AUTO_6964 ?AUTO_6968 ) ( AVAILABLE ?AUTO_6966 ) ( CHANNEL_FREE ?AUTO_6969 ) ( not ( = ?AUTO_6964 ?AUTO_6968 ) ) ( CAN_TRAVERSE ?AUTO_6966 ?AUTO_6968 ?AUTO_6964 ) ( VISIBLE ?AUTO_6968 ?AUTO_6964 ) ( ON_BOARD ?AUTO_6965 ?AUTO_6966 ) ( EQUIPPED_FOR_IMAGING ?AUTO_6966 ) ( SUPPORTS ?AUTO_6965 ?AUTO_6962 ) ( VISIBLE_FROM ?AUTO_6961 ?AUTO_6968 ) ( CALIBRATION_TARGET ?AUTO_6965 ?AUTO_6967 ) ( VISIBLE_FROM ?AUTO_6967 ?AUTO_6968 ) ( not ( = ?AUTO_6961 ?AUTO_6967 ) ) ( CAN_TRAVERSE ?AUTO_6966 ?AUTO_6963 ?AUTO_6968 ) ( VISIBLE ?AUTO_6963 ?AUTO_6968 ) ( not ( = ?AUTO_6968 ?AUTO_6963 ) ) ( not ( = ?AUTO_6964 ?AUTO_6963 ) ) ( CAN_TRAVERSE ?AUTO_6966 ?AUTO_6964 ?AUTO_6963 ) ( AT ?AUTO_6966 ?AUTO_6964 ) ( VISIBLE ?AUTO_6964 ?AUTO_6963 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_6966 ?AUTO_6964 ?AUTO_6963 )
      ( GET_IMAGE_DATA ?AUTO_6961 ?AUTO_6962 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_6961 ?AUTO_6962 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7011 - OBJECTIVE
      ?AUTO_7012 - MODE
    )
    :vars
    (
      ?AUTO_7015 - LANDER
      ?AUTO_7013 - WAYPOINT
      ?AUTO_7018 - WAYPOINT
      ?AUTO_7017 - ROVER
      ?AUTO_7016 - WAYPOINT
      ?AUTO_7014 - WAYPOINT
      ?AUTO_7019 - CAMERA
      ?AUTO_7020 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7015 ?AUTO_7013 ) ( VISIBLE ?AUTO_7018 ?AUTO_7013 ) ( AVAILABLE ?AUTO_7017 ) ( CHANNEL_FREE ?AUTO_7015 ) ( not ( = ?AUTO_7018 ?AUTO_7013 ) ) ( CAN_TRAVERSE ?AUTO_7017 ?AUTO_7016 ?AUTO_7018 ) ( VISIBLE ?AUTO_7016 ?AUTO_7018 ) ( not ( = ?AUTO_7013 ?AUTO_7016 ) ) ( not ( = ?AUTO_7018 ?AUTO_7016 ) ) ( CAN_TRAVERSE ?AUTO_7017 ?AUTO_7014 ?AUTO_7016 ) ( VISIBLE ?AUTO_7014 ?AUTO_7016 ) ( not ( = ?AUTO_7013 ?AUTO_7014 ) ) ( not ( = ?AUTO_7018 ?AUTO_7014 ) ) ( not ( = ?AUTO_7016 ?AUTO_7014 ) ) ( ON_BOARD ?AUTO_7019 ?AUTO_7017 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7017 ) ( SUPPORTS ?AUTO_7019 ?AUTO_7012 ) ( VISIBLE_FROM ?AUTO_7011 ?AUTO_7014 ) ( CAN_TRAVERSE ?AUTO_7017 ?AUTO_7016 ?AUTO_7014 ) ( AT ?AUTO_7017 ?AUTO_7016 ) ( VISIBLE ?AUTO_7016 ?AUTO_7014 ) ( CALIBRATION_TARGET ?AUTO_7019 ?AUTO_7020 ) ( VISIBLE_FROM ?AUTO_7020 ?AUTO_7016 ) ( not ( = ?AUTO_7011 ?AUTO_7020 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7017 ?AUTO_7019 ?AUTO_7020 ?AUTO_7016 )
      ( GET_IMAGE_DATA ?AUTO_7011 ?AUTO_7012 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7011 ?AUTO_7012 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7025 - OBJECTIVE
      ?AUTO_7026 - MODE
    )
    :vars
    (
      ?AUTO_7030 - LANDER
      ?AUTO_7031 - WAYPOINT
      ?AUTO_7028 - WAYPOINT
      ?AUTO_7034 - ROVER
      ?AUTO_7029 - WAYPOINT
      ?AUTO_7033 - WAYPOINT
      ?AUTO_7027 - CAMERA
      ?AUTO_7032 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7030 ?AUTO_7031 ) ( VISIBLE ?AUTO_7028 ?AUTO_7031 ) ( AVAILABLE ?AUTO_7034 ) ( CHANNEL_FREE ?AUTO_7030 ) ( not ( = ?AUTO_7028 ?AUTO_7031 ) ) ( CAN_TRAVERSE ?AUTO_7034 ?AUTO_7029 ?AUTO_7028 ) ( VISIBLE ?AUTO_7029 ?AUTO_7028 ) ( not ( = ?AUTO_7031 ?AUTO_7029 ) ) ( not ( = ?AUTO_7028 ?AUTO_7029 ) ) ( CAN_TRAVERSE ?AUTO_7034 ?AUTO_7033 ?AUTO_7029 ) ( VISIBLE ?AUTO_7033 ?AUTO_7029 ) ( not ( = ?AUTO_7031 ?AUTO_7033 ) ) ( not ( = ?AUTO_7028 ?AUTO_7033 ) ) ( not ( = ?AUTO_7029 ?AUTO_7033 ) ) ( ON_BOARD ?AUTO_7027 ?AUTO_7034 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7034 ) ( SUPPORTS ?AUTO_7027 ?AUTO_7026 ) ( VISIBLE_FROM ?AUTO_7025 ?AUTO_7033 ) ( CAN_TRAVERSE ?AUTO_7034 ?AUTO_7029 ?AUTO_7033 ) ( VISIBLE ?AUTO_7029 ?AUTO_7033 ) ( CALIBRATION_TARGET ?AUTO_7027 ?AUTO_7032 ) ( VISIBLE_FROM ?AUTO_7032 ?AUTO_7029 ) ( not ( = ?AUTO_7025 ?AUTO_7032 ) ) ( AT ?AUTO_7034 ?AUTO_7033 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7034 ?AUTO_7033 ?AUTO_7029 )
      ( GET_IMAGE_DATA ?AUTO_7025 ?AUTO_7026 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7025 ?AUTO_7026 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7066 - OBJECTIVE
      ?AUTO_7067 - MODE
    )
    :vars
    (
      ?AUTO_7071 - LANDER
      ?AUTO_7072 - WAYPOINT
      ?AUTO_7069 - WAYPOINT
      ?AUTO_7074 - ROVER
      ?AUTO_7073 - WAYPOINT
      ?AUTO_7068 - WAYPOINT
      ?AUTO_7070 - CAMERA
      ?AUTO_7075 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7071 ?AUTO_7072 ) ( VISIBLE ?AUTO_7069 ?AUTO_7072 ) ( AVAILABLE ?AUTO_7074 ) ( CHANNEL_FREE ?AUTO_7071 ) ( not ( = ?AUTO_7069 ?AUTO_7072 ) ) ( CAN_TRAVERSE ?AUTO_7074 ?AUTO_7073 ?AUTO_7069 ) ( VISIBLE ?AUTO_7073 ?AUTO_7069 ) ( not ( = ?AUTO_7072 ?AUTO_7073 ) ) ( not ( = ?AUTO_7069 ?AUTO_7073 ) ) ( CAN_TRAVERSE ?AUTO_7074 ?AUTO_7068 ?AUTO_7073 ) ( VISIBLE ?AUTO_7068 ?AUTO_7073 ) ( not ( = ?AUTO_7072 ?AUTO_7068 ) ) ( not ( = ?AUTO_7069 ?AUTO_7068 ) ) ( not ( = ?AUTO_7073 ?AUTO_7068 ) ) ( ON_BOARD ?AUTO_7070 ?AUTO_7074 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7074 ) ( SUPPORTS ?AUTO_7070 ?AUTO_7067 ) ( VISIBLE_FROM ?AUTO_7066 ?AUTO_7068 ) ( CALIBRATION_TARGET ?AUTO_7070 ?AUTO_7066 ) ( CAN_TRAVERSE ?AUTO_7074 ?AUTO_7075 ?AUTO_7068 ) ( AT ?AUTO_7074 ?AUTO_7075 ) ( VISIBLE ?AUTO_7075 ?AUTO_7068 ) ( not ( = ?AUTO_7072 ?AUTO_7075 ) ) ( not ( = ?AUTO_7069 ?AUTO_7075 ) ) ( not ( = ?AUTO_7073 ?AUTO_7075 ) ) ( not ( = ?AUTO_7068 ?AUTO_7075 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7074 ?AUTO_7075 ?AUTO_7068 )
      ( GET_IMAGE_DATA ?AUTO_7066 ?AUTO_7067 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7066 ?AUTO_7067 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7152 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7158 - LANDER
      ?AUTO_7155 - WAYPOINT
      ?AUTO_7157 - ROVER
      ?AUTO_7154 - STORE
      ?AUTO_7156 - WAYPOINT
      ?AUTO_7153 - WAYPOINT
      ?AUTO_7159 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7158 ?AUTO_7155 ) ( VISIBLE ?AUTO_7152 ?AUTO_7155 ) ( AVAILABLE ?AUTO_7157 ) ( CHANNEL_FREE ?AUTO_7158 ) ( not ( = ?AUTO_7152 ?AUTO_7155 ) ) ( AT_SOIL_SAMPLE ?AUTO_7152 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7157 ) ( STORE_OF ?AUTO_7154 ?AUTO_7157 ) ( EMPTY ?AUTO_7154 ) ( CAN_TRAVERSE ?AUTO_7157 ?AUTO_7156 ?AUTO_7152 ) ( VISIBLE ?AUTO_7156 ?AUTO_7152 ) ( not ( = ?AUTO_7152 ?AUTO_7156 ) ) ( not ( = ?AUTO_7155 ?AUTO_7156 ) ) ( CAN_TRAVERSE ?AUTO_7157 ?AUTO_7153 ?AUTO_7156 ) ( VISIBLE ?AUTO_7153 ?AUTO_7156 ) ( not ( = ?AUTO_7152 ?AUTO_7153 ) ) ( not ( = ?AUTO_7155 ?AUTO_7153 ) ) ( not ( = ?AUTO_7156 ?AUTO_7153 ) ) ( CAN_TRAVERSE ?AUTO_7157 ?AUTO_7159 ?AUTO_7153 ) ( AT ?AUTO_7157 ?AUTO_7159 ) ( VISIBLE ?AUTO_7159 ?AUTO_7153 ) ( not ( = ?AUTO_7152 ?AUTO_7159 ) ) ( not ( = ?AUTO_7155 ?AUTO_7159 ) ) ( not ( = ?AUTO_7156 ?AUTO_7159 ) ) ( not ( = ?AUTO_7153 ?AUTO_7159 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7157 ?AUTO_7159 ?AUTO_7153 )
      ( GET_SOIL_DATA ?AUTO_7152 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7152 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7274 - OBJECTIVE
      ?AUTO_7275 - MODE
    )
    :vars
    (
      ?AUTO_7277 - LANDER
      ?AUTO_7281 - WAYPOINT
      ?AUTO_7279 - WAYPOINT
      ?AUTO_7280 - ROVER
      ?AUTO_7276 - WAYPOINT
      ?AUTO_7278 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7277 ?AUTO_7281 ) ( VISIBLE ?AUTO_7279 ?AUTO_7281 ) ( AVAILABLE ?AUTO_7280 ) ( CHANNEL_FREE ?AUTO_7277 ) ( not ( = ?AUTO_7279 ?AUTO_7281 ) ) ( CAN_TRAVERSE ?AUTO_7280 ?AUTO_7276 ?AUTO_7279 ) ( VISIBLE ?AUTO_7276 ?AUTO_7279 ) ( not ( = ?AUTO_7281 ?AUTO_7276 ) ) ( not ( = ?AUTO_7279 ?AUTO_7276 ) ) ( CALIBRATED ?AUTO_7278 ?AUTO_7280 ) ( ON_BOARD ?AUTO_7278 ?AUTO_7280 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7280 ) ( SUPPORTS ?AUTO_7278 ?AUTO_7275 ) ( VISIBLE_FROM ?AUTO_7274 ?AUTO_7276 ) ( CAN_TRAVERSE ?AUTO_7280 ?AUTO_7279 ?AUTO_7276 ) ( VISIBLE ?AUTO_7279 ?AUTO_7276 ) ( CAN_TRAVERSE ?AUTO_7280 ?AUTO_7281 ?AUTO_7279 ) ( AT ?AUTO_7280 ?AUTO_7281 ) ( VISIBLE ?AUTO_7281 ?AUTO_7279 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7280 ?AUTO_7281 ?AUTO_7279 )
      ( GET_IMAGE_DATA ?AUTO_7274 ?AUTO_7275 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7274 ?AUTO_7275 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7282 - OBJECTIVE
      ?AUTO_7283 - MODE
    )
    :vars
    (
      ?AUTO_7286 - LANDER
      ?AUTO_7287 - WAYPOINT
      ?AUTO_7284 - WAYPOINT
      ?AUTO_7289 - ROVER
      ?AUTO_7285 - WAYPOINT
      ?AUTO_7288 - CAMERA
      ?AUTO_7290 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7286 ?AUTO_7287 ) ( VISIBLE ?AUTO_7284 ?AUTO_7287 ) ( AVAILABLE ?AUTO_7289 ) ( CHANNEL_FREE ?AUTO_7286 ) ( not ( = ?AUTO_7284 ?AUTO_7287 ) ) ( CAN_TRAVERSE ?AUTO_7289 ?AUTO_7285 ?AUTO_7284 ) ( VISIBLE ?AUTO_7285 ?AUTO_7284 ) ( not ( = ?AUTO_7287 ?AUTO_7285 ) ) ( not ( = ?AUTO_7284 ?AUTO_7285 ) ) ( CALIBRATED ?AUTO_7288 ?AUTO_7289 ) ( ON_BOARD ?AUTO_7288 ?AUTO_7289 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7289 ) ( SUPPORTS ?AUTO_7288 ?AUTO_7283 ) ( VISIBLE_FROM ?AUTO_7282 ?AUTO_7285 ) ( CAN_TRAVERSE ?AUTO_7289 ?AUTO_7284 ?AUTO_7285 ) ( VISIBLE ?AUTO_7284 ?AUTO_7285 ) ( CAN_TRAVERSE ?AUTO_7289 ?AUTO_7287 ?AUTO_7284 ) ( VISIBLE ?AUTO_7287 ?AUTO_7284 ) ( CAN_TRAVERSE ?AUTO_7289 ?AUTO_7290 ?AUTO_7287 ) ( AT ?AUTO_7289 ?AUTO_7290 ) ( VISIBLE ?AUTO_7290 ?AUTO_7287 ) ( not ( = ?AUTO_7287 ?AUTO_7290 ) ) ( not ( = ?AUTO_7284 ?AUTO_7290 ) ) ( not ( = ?AUTO_7285 ?AUTO_7290 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7289 ?AUTO_7290 ?AUTO_7287 )
      ( GET_IMAGE_DATA ?AUTO_7282 ?AUTO_7283 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7282 ?AUTO_7283 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7301 - OBJECTIVE
      ?AUTO_7302 - MODE
    )
    :vars
    (
      ?AUTO_7309 - LANDER
      ?AUTO_7303 - WAYPOINT
      ?AUTO_7304 - WAYPOINT
      ?AUTO_7305 - ROVER
      ?AUTO_7307 - WAYPOINT
      ?AUTO_7308 - CAMERA
      ?AUTO_7306 - WAYPOINT
      ?AUTO_7310 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7309 ?AUTO_7303 ) ( VISIBLE ?AUTO_7304 ?AUTO_7303 ) ( AVAILABLE ?AUTO_7305 ) ( CHANNEL_FREE ?AUTO_7309 ) ( not ( = ?AUTO_7304 ?AUTO_7303 ) ) ( CAN_TRAVERSE ?AUTO_7305 ?AUTO_7307 ?AUTO_7304 ) ( VISIBLE ?AUTO_7307 ?AUTO_7304 ) ( not ( = ?AUTO_7303 ?AUTO_7307 ) ) ( not ( = ?AUTO_7304 ?AUTO_7307 ) ) ( ON_BOARD ?AUTO_7308 ?AUTO_7305 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7305 ) ( SUPPORTS ?AUTO_7308 ?AUTO_7302 ) ( VISIBLE_FROM ?AUTO_7301 ?AUTO_7307 ) ( CAN_TRAVERSE ?AUTO_7305 ?AUTO_7304 ?AUTO_7307 ) ( VISIBLE ?AUTO_7304 ?AUTO_7307 ) ( CAN_TRAVERSE ?AUTO_7305 ?AUTO_7303 ?AUTO_7304 ) ( VISIBLE ?AUTO_7303 ?AUTO_7304 ) ( CAN_TRAVERSE ?AUTO_7305 ?AUTO_7306 ?AUTO_7303 ) ( AT ?AUTO_7305 ?AUTO_7306 ) ( VISIBLE ?AUTO_7306 ?AUTO_7303 ) ( not ( = ?AUTO_7303 ?AUTO_7306 ) ) ( not ( = ?AUTO_7304 ?AUTO_7306 ) ) ( not ( = ?AUTO_7307 ?AUTO_7306 ) ) ( CALIBRATION_TARGET ?AUTO_7308 ?AUTO_7310 ) ( VISIBLE_FROM ?AUTO_7310 ?AUTO_7306 ) ( not ( = ?AUTO_7301 ?AUTO_7310 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7305 ?AUTO_7308 ?AUTO_7310 ?AUTO_7306 )
      ( GET_IMAGE_DATA ?AUTO_7301 ?AUTO_7302 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7301 ?AUTO_7302 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7311 - OBJECTIVE
      ?AUTO_7312 - MODE
    )
    :vars
    (
      ?AUTO_7320 - LANDER
      ?AUTO_7313 - WAYPOINT
      ?AUTO_7314 - WAYPOINT
      ?AUTO_7315 - ROVER
      ?AUTO_7318 - WAYPOINT
      ?AUTO_7319 - CAMERA
      ?AUTO_7317 - WAYPOINT
      ?AUTO_7316 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7320 ?AUTO_7313 ) ( VISIBLE ?AUTO_7314 ?AUTO_7313 ) ( AVAILABLE ?AUTO_7315 ) ( CHANNEL_FREE ?AUTO_7320 ) ( not ( = ?AUTO_7314 ?AUTO_7313 ) ) ( CAN_TRAVERSE ?AUTO_7315 ?AUTO_7318 ?AUTO_7314 ) ( VISIBLE ?AUTO_7318 ?AUTO_7314 ) ( not ( = ?AUTO_7313 ?AUTO_7318 ) ) ( not ( = ?AUTO_7314 ?AUTO_7318 ) ) ( ON_BOARD ?AUTO_7319 ?AUTO_7315 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7315 ) ( SUPPORTS ?AUTO_7319 ?AUTO_7312 ) ( VISIBLE_FROM ?AUTO_7311 ?AUTO_7318 ) ( CAN_TRAVERSE ?AUTO_7315 ?AUTO_7314 ?AUTO_7318 ) ( VISIBLE ?AUTO_7314 ?AUTO_7318 ) ( CAN_TRAVERSE ?AUTO_7315 ?AUTO_7313 ?AUTO_7314 ) ( VISIBLE ?AUTO_7313 ?AUTO_7314 ) ( CAN_TRAVERSE ?AUTO_7315 ?AUTO_7317 ?AUTO_7313 ) ( VISIBLE ?AUTO_7317 ?AUTO_7313 ) ( not ( = ?AUTO_7313 ?AUTO_7317 ) ) ( not ( = ?AUTO_7314 ?AUTO_7317 ) ) ( not ( = ?AUTO_7318 ?AUTO_7317 ) ) ( CALIBRATION_TARGET ?AUTO_7319 ?AUTO_7316 ) ( VISIBLE_FROM ?AUTO_7316 ?AUTO_7317 ) ( not ( = ?AUTO_7311 ?AUTO_7316 ) ) ( CAN_TRAVERSE ?AUTO_7315 ?AUTO_7313 ?AUTO_7317 ) ( AT ?AUTO_7315 ?AUTO_7313 ) ( VISIBLE ?AUTO_7313 ?AUTO_7317 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7315 ?AUTO_7313 ?AUTO_7317 )
      ( GET_IMAGE_DATA ?AUTO_7311 ?AUTO_7312 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7311 ?AUTO_7312 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7421 - OBJECTIVE
      ?AUTO_7422 - MODE
    )
    :vars
    (
      ?AUTO_7428 - LANDER
      ?AUTO_7429 - WAYPOINT
      ?AUTO_7426 - WAYPOINT
      ?AUTO_7427 - ROVER
      ?AUTO_7424 - CAMERA
      ?AUTO_7425 - WAYPOINT
      ?AUTO_7423 - WAYPOINT
      ?AUTO_7430 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7428 ?AUTO_7429 ) ( VISIBLE ?AUTO_7426 ?AUTO_7429 ) ( AVAILABLE ?AUTO_7427 ) ( CHANNEL_FREE ?AUTO_7428 ) ( not ( = ?AUTO_7426 ?AUTO_7429 ) ) ( ON_BOARD ?AUTO_7424 ?AUTO_7427 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7427 ) ( SUPPORTS ?AUTO_7424 ?AUTO_7422 ) ( VISIBLE_FROM ?AUTO_7421 ?AUTO_7426 ) ( CAN_TRAVERSE ?AUTO_7427 ?AUTO_7425 ?AUTO_7426 ) ( VISIBLE ?AUTO_7425 ?AUTO_7426 ) ( not ( = ?AUTO_7429 ?AUTO_7425 ) ) ( not ( = ?AUTO_7426 ?AUTO_7425 ) ) ( CAN_TRAVERSE ?AUTO_7427 ?AUTO_7423 ?AUTO_7425 ) ( VISIBLE ?AUTO_7423 ?AUTO_7425 ) ( not ( = ?AUTO_7429 ?AUTO_7423 ) ) ( not ( = ?AUTO_7426 ?AUTO_7423 ) ) ( not ( = ?AUTO_7425 ?AUTO_7423 ) ) ( CALIBRATION_TARGET ?AUTO_7424 ?AUTO_7430 ) ( VISIBLE_FROM ?AUTO_7430 ?AUTO_7423 ) ( not ( = ?AUTO_7421 ?AUTO_7430 ) ) ( CAN_TRAVERSE ?AUTO_7427 ?AUTO_7426 ?AUTO_7423 ) ( AT ?AUTO_7427 ?AUTO_7426 ) ( VISIBLE ?AUTO_7426 ?AUTO_7423 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7427 ?AUTO_7426 ?AUTO_7423 )
      ( GET_IMAGE_DATA ?AUTO_7421 ?AUTO_7422 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7421 ?AUTO_7422 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7439 - OBJECTIVE
      ?AUTO_7440 - MODE
    )
    :vars
    (
      ?AUTO_7442 - LANDER
      ?AUTO_7441 - WAYPOINT
      ?AUTO_7445 - WAYPOINT
      ?AUTO_7448 - ROVER
      ?AUTO_7447 - CAMERA
      ?AUTO_7444 - WAYPOINT
      ?AUTO_7446 - WAYPOINT
      ?AUTO_7443 - OBJECTIVE
      ?AUTO_7449 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7442 ?AUTO_7441 ) ( VISIBLE ?AUTO_7445 ?AUTO_7441 ) ( AVAILABLE ?AUTO_7448 ) ( CHANNEL_FREE ?AUTO_7442 ) ( not ( = ?AUTO_7445 ?AUTO_7441 ) ) ( ON_BOARD ?AUTO_7447 ?AUTO_7448 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7448 ) ( SUPPORTS ?AUTO_7447 ?AUTO_7440 ) ( VISIBLE_FROM ?AUTO_7439 ?AUTO_7445 ) ( CAN_TRAVERSE ?AUTO_7448 ?AUTO_7444 ?AUTO_7445 ) ( VISIBLE ?AUTO_7444 ?AUTO_7445 ) ( not ( = ?AUTO_7441 ?AUTO_7444 ) ) ( not ( = ?AUTO_7445 ?AUTO_7444 ) ) ( CAN_TRAVERSE ?AUTO_7448 ?AUTO_7446 ?AUTO_7444 ) ( VISIBLE ?AUTO_7446 ?AUTO_7444 ) ( not ( = ?AUTO_7441 ?AUTO_7446 ) ) ( not ( = ?AUTO_7445 ?AUTO_7446 ) ) ( not ( = ?AUTO_7444 ?AUTO_7446 ) ) ( CALIBRATION_TARGET ?AUTO_7447 ?AUTO_7443 ) ( VISIBLE_FROM ?AUTO_7443 ?AUTO_7446 ) ( not ( = ?AUTO_7439 ?AUTO_7443 ) ) ( CAN_TRAVERSE ?AUTO_7448 ?AUTO_7445 ?AUTO_7446 ) ( VISIBLE ?AUTO_7445 ?AUTO_7446 ) ( CAN_TRAVERSE ?AUTO_7448 ?AUTO_7449 ?AUTO_7445 ) ( AT ?AUTO_7448 ?AUTO_7449 ) ( VISIBLE ?AUTO_7449 ?AUTO_7445 ) ( not ( = ?AUTO_7441 ?AUTO_7449 ) ) ( not ( = ?AUTO_7445 ?AUTO_7449 ) ) ( not ( = ?AUTO_7444 ?AUTO_7449 ) ) ( not ( = ?AUTO_7446 ?AUTO_7449 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7448 ?AUTO_7449 ?AUTO_7445 )
      ( GET_IMAGE_DATA ?AUTO_7439 ?AUTO_7440 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7439 ?AUTO_7440 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7456 - OBJECTIVE
      ?AUTO_7457 - MODE
    )
    :vars
    (
      ?AUTO_7460 - LANDER
      ?AUTO_7458 - WAYPOINT
      ?AUTO_7459 - WAYPOINT
      ?AUTO_7464 - ROVER
      ?AUTO_7466 - CAMERA
      ?AUTO_7462 - WAYPOINT
      ?AUTO_7463 - WAYPOINT
      ?AUTO_7465 - OBJECTIVE
      ?AUTO_7461 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7460 ?AUTO_7458 ) ( VISIBLE ?AUTO_7459 ?AUTO_7458 ) ( AVAILABLE ?AUTO_7464 ) ( CHANNEL_FREE ?AUTO_7460 ) ( not ( = ?AUTO_7459 ?AUTO_7458 ) ) ( ON_BOARD ?AUTO_7466 ?AUTO_7464 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7464 ) ( SUPPORTS ?AUTO_7466 ?AUTO_7457 ) ( VISIBLE_FROM ?AUTO_7456 ?AUTO_7459 ) ( CAN_TRAVERSE ?AUTO_7464 ?AUTO_7462 ?AUTO_7459 ) ( VISIBLE ?AUTO_7462 ?AUTO_7459 ) ( not ( = ?AUTO_7458 ?AUTO_7462 ) ) ( not ( = ?AUTO_7459 ?AUTO_7462 ) ) ( CAN_TRAVERSE ?AUTO_7464 ?AUTO_7463 ?AUTO_7462 ) ( VISIBLE ?AUTO_7463 ?AUTO_7462 ) ( not ( = ?AUTO_7458 ?AUTO_7463 ) ) ( not ( = ?AUTO_7459 ?AUTO_7463 ) ) ( not ( = ?AUTO_7462 ?AUTO_7463 ) ) ( CALIBRATION_TARGET ?AUTO_7466 ?AUTO_7465 ) ( VISIBLE_FROM ?AUTO_7465 ?AUTO_7463 ) ( not ( = ?AUTO_7456 ?AUTO_7465 ) ) ( CAN_TRAVERSE ?AUTO_7464 ?AUTO_7459 ?AUTO_7463 ) ( VISIBLE ?AUTO_7459 ?AUTO_7463 ) ( CAN_TRAVERSE ?AUTO_7464 ?AUTO_7461 ?AUTO_7459 ) ( VISIBLE ?AUTO_7461 ?AUTO_7459 ) ( not ( = ?AUTO_7458 ?AUTO_7461 ) ) ( not ( = ?AUTO_7459 ?AUTO_7461 ) ) ( not ( = ?AUTO_7462 ?AUTO_7461 ) ) ( not ( = ?AUTO_7463 ?AUTO_7461 ) ) ( CAN_TRAVERSE ?AUTO_7464 ?AUTO_7458 ?AUTO_7461 ) ( AT ?AUTO_7464 ?AUTO_7458 ) ( VISIBLE ?AUTO_7458 ?AUTO_7461 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7464 ?AUTO_7458 ?AUTO_7461 )
      ( GET_IMAGE_DATA ?AUTO_7456 ?AUTO_7457 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7456 ?AUTO_7457 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7516 - OBJECTIVE
      ?AUTO_7517 - MODE
    )
    :vars
    (
      ?AUTO_7521 - LANDER
      ?AUTO_7522 - WAYPOINT
      ?AUTO_7520 - WAYPOINT
      ?AUTO_7518 - ROVER
      ?AUTO_7523 - CAMERA
      ?AUTO_7519 - WAYPOINT
      ?AUTO_7524 - WAYPOINT
      ?AUTO_7525 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7521 ?AUTO_7522 ) ( VISIBLE ?AUTO_7520 ?AUTO_7522 ) ( AVAILABLE ?AUTO_7518 ) ( CHANNEL_FREE ?AUTO_7521 ) ( not ( = ?AUTO_7520 ?AUTO_7522 ) ) ( ON_BOARD ?AUTO_7523 ?AUTO_7518 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7518 ) ( SUPPORTS ?AUTO_7523 ?AUTO_7517 ) ( VISIBLE_FROM ?AUTO_7516 ?AUTO_7520 ) ( CALIBRATION_TARGET ?AUTO_7523 ?AUTO_7516 ) ( CAN_TRAVERSE ?AUTO_7518 ?AUTO_7519 ?AUTO_7520 ) ( VISIBLE ?AUTO_7519 ?AUTO_7520 ) ( not ( = ?AUTO_7522 ?AUTO_7519 ) ) ( not ( = ?AUTO_7520 ?AUTO_7519 ) ) ( CAN_TRAVERSE ?AUTO_7518 ?AUTO_7522 ?AUTO_7519 ) ( VISIBLE ?AUTO_7522 ?AUTO_7519 ) ( CAN_TRAVERSE ?AUTO_7518 ?AUTO_7524 ?AUTO_7522 ) ( VISIBLE ?AUTO_7524 ?AUTO_7522 ) ( not ( = ?AUTO_7522 ?AUTO_7524 ) ) ( not ( = ?AUTO_7520 ?AUTO_7524 ) ) ( not ( = ?AUTO_7519 ?AUTO_7524 ) ) ( CAN_TRAVERSE ?AUTO_7518 ?AUTO_7525 ?AUTO_7524 ) ( AT ?AUTO_7518 ?AUTO_7525 ) ( VISIBLE ?AUTO_7525 ?AUTO_7524 ) ( not ( = ?AUTO_7522 ?AUTO_7525 ) ) ( not ( = ?AUTO_7520 ?AUTO_7525 ) ) ( not ( = ?AUTO_7519 ?AUTO_7525 ) ) ( not ( = ?AUTO_7524 ?AUTO_7525 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7518 ?AUTO_7525 ?AUTO_7524 )
      ( GET_IMAGE_DATA ?AUTO_7516 ?AUTO_7517 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7516 ?AUTO_7517 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7528 - OBJECTIVE
      ?AUTO_7529 - MODE
    )
    :vars
    (
      ?AUTO_7531 - LANDER
      ?AUTO_7530 - WAYPOINT
      ?AUTO_7534 - WAYPOINT
      ?AUTO_7536 - ROVER
      ?AUTO_7537 - CAMERA
      ?AUTO_7532 - WAYPOINT
      ?AUTO_7535 - WAYPOINT
      ?AUTO_7533 - WAYPOINT
      ?AUTO_7538 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7531 ?AUTO_7530 ) ( VISIBLE ?AUTO_7534 ?AUTO_7530 ) ( AVAILABLE ?AUTO_7536 ) ( CHANNEL_FREE ?AUTO_7531 ) ( not ( = ?AUTO_7534 ?AUTO_7530 ) ) ( ON_BOARD ?AUTO_7537 ?AUTO_7536 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7536 ) ( SUPPORTS ?AUTO_7537 ?AUTO_7529 ) ( VISIBLE_FROM ?AUTO_7528 ?AUTO_7534 ) ( CALIBRATION_TARGET ?AUTO_7537 ?AUTO_7528 ) ( CAN_TRAVERSE ?AUTO_7536 ?AUTO_7532 ?AUTO_7534 ) ( VISIBLE ?AUTO_7532 ?AUTO_7534 ) ( not ( = ?AUTO_7530 ?AUTO_7532 ) ) ( not ( = ?AUTO_7534 ?AUTO_7532 ) ) ( CAN_TRAVERSE ?AUTO_7536 ?AUTO_7530 ?AUTO_7532 ) ( VISIBLE ?AUTO_7530 ?AUTO_7532 ) ( CAN_TRAVERSE ?AUTO_7536 ?AUTO_7535 ?AUTO_7530 ) ( VISIBLE ?AUTO_7535 ?AUTO_7530 ) ( not ( = ?AUTO_7530 ?AUTO_7535 ) ) ( not ( = ?AUTO_7534 ?AUTO_7535 ) ) ( not ( = ?AUTO_7532 ?AUTO_7535 ) ) ( CAN_TRAVERSE ?AUTO_7536 ?AUTO_7533 ?AUTO_7535 ) ( VISIBLE ?AUTO_7533 ?AUTO_7535 ) ( not ( = ?AUTO_7530 ?AUTO_7533 ) ) ( not ( = ?AUTO_7534 ?AUTO_7533 ) ) ( not ( = ?AUTO_7532 ?AUTO_7533 ) ) ( not ( = ?AUTO_7535 ?AUTO_7533 ) ) ( CAN_TRAVERSE ?AUTO_7536 ?AUTO_7538 ?AUTO_7533 ) ( AT ?AUTO_7536 ?AUTO_7538 ) ( VISIBLE ?AUTO_7538 ?AUTO_7533 ) ( not ( = ?AUTO_7530 ?AUTO_7538 ) ) ( not ( = ?AUTO_7534 ?AUTO_7538 ) ) ( not ( = ?AUTO_7532 ?AUTO_7538 ) ) ( not ( = ?AUTO_7535 ?AUTO_7538 ) ) ( not ( = ?AUTO_7533 ?AUTO_7538 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7536 ?AUTO_7538 ?AUTO_7533 )
      ( GET_IMAGE_DATA ?AUTO_7528 ?AUTO_7529 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7528 ?AUTO_7529 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7592 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7597 - LANDER
      ?AUTO_7595 - WAYPOINT
      ?AUTO_7593 - ROVER
      ?AUTO_7594 - STORE
      ?AUTO_7596 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7597 ?AUTO_7595 ) ( VISIBLE ?AUTO_7592 ?AUTO_7595 ) ( AVAILABLE ?AUTO_7593 ) ( CHANNEL_FREE ?AUTO_7597 ) ( not ( = ?AUTO_7592 ?AUTO_7595 ) ) ( AT_ROCK_SAMPLE ?AUTO_7592 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7593 ) ( STORE_OF ?AUTO_7594 ?AUTO_7593 ) ( CAN_TRAVERSE ?AUTO_7593 ?AUTO_7596 ?AUTO_7592 ) ( AT ?AUTO_7593 ?AUTO_7596 ) ( VISIBLE ?AUTO_7596 ?AUTO_7592 ) ( not ( = ?AUTO_7592 ?AUTO_7596 ) ) ( not ( = ?AUTO_7595 ?AUTO_7596 ) ) ( AT_ROCK_SAMPLE ?AUTO_7596 ) ( EMPTY ?AUTO_7594 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7593 ?AUTO_7594 ?AUTO_7596 )
      ( GET_ROCK_DATA ?AUTO_7592 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7592 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7651 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7652 - LANDER
      ?AUTO_7654 - WAYPOINT
      ?AUTO_7655 - WAYPOINT
      ?AUTO_7653 - ROVER
      ?AUTO_7656 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7652 ?AUTO_7654 ) ( VISIBLE ?AUTO_7655 ?AUTO_7654 ) ( AVAILABLE ?AUTO_7653 ) ( CHANNEL_FREE ?AUTO_7652 ) ( not ( = ?AUTO_7651 ?AUTO_7655 ) ) ( not ( = ?AUTO_7651 ?AUTO_7654 ) ) ( not ( = ?AUTO_7655 ?AUTO_7654 ) ) ( CAN_TRAVERSE ?AUTO_7653 ?AUTO_7651 ?AUTO_7655 ) ( AT ?AUTO_7653 ?AUTO_7651 ) ( VISIBLE ?AUTO_7651 ?AUTO_7655 ) ( AT_SOIL_SAMPLE ?AUTO_7651 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7653 ) ( STORE_OF ?AUTO_7656 ?AUTO_7653 ) ( FULL ?AUTO_7656 ) )
    :subtasks
    ( ( !DROP ?AUTO_7653 ?AUTO_7656 )
      ( GET_SOIL_DATA ?AUTO_7651 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7651 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7657 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7658 - LANDER
      ?AUTO_7660 - WAYPOINT
      ?AUTO_7659 - WAYPOINT
      ?AUTO_7662 - ROVER
      ?AUTO_7661 - STORE
      ?AUTO_7663 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7658 ?AUTO_7660 ) ( VISIBLE ?AUTO_7659 ?AUTO_7660 ) ( AVAILABLE ?AUTO_7662 ) ( CHANNEL_FREE ?AUTO_7658 ) ( not ( = ?AUTO_7657 ?AUTO_7659 ) ) ( not ( = ?AUTO_7657 ?AUTO_7660 ) ) ( not ( = ?AUTO_7659 ?AUTO_7660 ) ) ( CAN_TRAVERSE ?AUTO_7662 ?AUTO_7657 ?AUTO_7659 ) ( VISIBLE ?AUTO_7657 ?AUTO_7659 ) ( AT_SOIL_SAMPLE ?AUTO_7657 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7662 ) ( STORE_OF ?AUTO_7661 ?AUTO_7662 ) ( FULL ?AUTO_7661 ) ( CAN_TRAVERSE ?AUTO_7662 ?AUTO_7663 ?AUTO_7657 ) ( AT ?AUTO_7662 ?AUTO_7663 ) ( VISIBLE ?AUTO_7663 ?AUTO_7657 ) ( not ( = ?AUTO_7657 ?AUTO_7663 ) ) ( not ( = ?AUTO_7660 ?AUTO_7663 ) ) ( not ( = ?AUTO_7659 ?AUTO_7663 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7662 ?AUTO_7663 ?AUTO_7657 )
      ( GET_SOIL_DATA ?AUTO_7657 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7657 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7664 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7666 - LANDER
      ?AUTO_7668 - WAYPOINT
      ?AUTO_7667 - WAYPOINT
      ?AUTO_7669 - ROVER
      ?AUTO_7670 - STORE
      ?AUTO_7665 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7666 ?AUTO_7668 ) ( VISIBLE ?AUTO_7667 ?AUTO_7668 ) ( AVAILABLE ?AUTO_7669 ) ( CHANNEL_FREE ?AUTO_7666 ) ( not ( = ?AUTO_7664 ?AUTO_7667 ) ) ( not ( = ?AUTO_7664 ?AUTO_7668 ) ) ( not ( = ?AUTO_7667 ?AUTO_7668 ) ) ( CAN_TRAVERSE ?AUTO_7669 ?AUTO_7664 ?AUTO_7667 ) ( VISIBLE ?AUTO_7664 ?AUTO_7667 ) ( AT_SOIL_SAMPLE ?AUTO_7664 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7669 ) ( STORE_OF ?AUTO_7670 ?AUTO_7669 ) ( CAN_TRAVERSE ?AUTO_7669 ?AUTO_7665 ?AUTO_7664 ) ( AT ?AUTO_7669 ?AUTO_7665 ) ( VISIBLE ?AUTO_7665 ?AUTO_7664 ) ( not ( = ?AUTO_7664 ?AUTO_7665 ) ) ( not ( = ?AUTO_7668 ?AUTO_7665 ) ) ( not ( = ?AUTO_7667 ?AUTO_7665 ) ) ( AT_ROCK_SAMPLE ?AUTO_7665 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7669 ) ( EMPTY ?AUTO_7670 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7669 ?AUTO_7670 ?AUTO_7665 )
      ( GET_SOIL_DATA ?AUTO_7664 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7664 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7671 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7673 - LANDER
      ?AUTO_7675 - WAYPOINT
      ?AUTO_7674 - WAYPOINT
      ?AUTO_7677 - ROVER
      ?AUTO_7676 - STORE
      ?AUTO_7672 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7673 ?AUTO_7675 ) ( VISIBLE ?AUTO_7674 ?AUTO_7675 ) ( AVAILABLE ?AUTO_7677 ) ( CHANNEL_FREE ?AUTO_7673 ) ( not ( = ?AUTO_7671 ?AUTO_7674 ) ) ( not ( = ?AUTO_7671 ?AUTO_7675 ) ) ( not ( = ?AUTO_7674 ?AUTO_7675 ) ) ( CAN_TRAVERSE ?AUTO_7677 ?AUTO_7671 ?AUTO_7674 ) ( VISIBLE ?AUTO_7671 ?AUTO_7674 ) ( AT_SOIL_SAMPLE ?AUTO_7671 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7677 ) ( STORE_OF ?AUTO_7676 ?AUTO_7677 ) ( CAN_TRAVERSE ?AUTO_7677 ?AUTO_7672 ?AUTO_7671 ) ( VISIBLE ?AUTO_7672 ?AUTO_7671 ) ( not ( = ?AUTO_7671 ?AUTO_7672 ) ) ( not ( = ?AUTO_7675 ?AUTO_7672 ) ) ( not ( = ?AUTO_7674 ?AUTO_7672 ) ) ( AT_ROCK_SAMPLE ?AUTO_7672 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7677 ) ( EMPTY ?AUTO_7676 ) ( CAN_TRAVERSE ?AUTO_7677 ?AUTO_7674 ?AUTO_7672 ) ( AT ?AUTO_7677 ?AUTO_7674 ) ( VISIBLE ?AUTO_7674 ?AUTO_7672 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7677 ?AUTO_7674 ?AUTO_7672 )
      ( GET_SOIL_DATA ?AUTO_7671 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7671 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_7678 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7682 - LANDER
      ?AUTO_7683 - WAYPOINT
      ?AUTO_7684 - WAYPOINT
      ?AUTO_7679 - ROVER
      ?AUTO_7681 - STORE
      ?AUTO_7680 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7682 ?AUTO_7683 ) ( VISIBLE ?AUTO_7684 ?AUTO_7683 ) ( AVAILABLE ?AUTO_7679 ) ( CHANNEL_FREE ?AUTO_7682 ) ( not ( = ?AUTO_7678 ?AUTO_7684 ) ) ( not ( = ?AUTO_7678 ?AUTO_7683 ) ) ( not ( = ?AUTO_7684 ?AUTO_7683 ) ) ( CAN_TRAVERSE ?AUTO_7679 ?AUTO_7678 ?AUTO_7684 ) ( VISIBLE ?AUTO_7678 ?AUTO_7684 ) ( AT_SOIL_SAMPLE ?AUTO_7678 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_7679 ) ( STORE_OF ?AUTO_7681 ?AUTO_7679 ) ( CAN_TRAVERSE ?AUTO_7679 ?AUTO_7680 ?AUTO_7678 ) ( VISIBLE ?AUTO_7680 ?AUTO_7678 ) ( not ( = ?AUTO_7678 ?AUTO_7680 ) ) ( not ( = ?AUTO_7683 ?AUTO_7680 ) ) ( not ( = ?AUTO_7684 ?AUTO_7680 ) ) ( AT_ROCK_SAMPLE ?AUTO_7680 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7679 ) ( CAN_TRAVERSE ?AUTO_7679 ?AUTO_7684 ?AUTO_7680 ) ( AT ?AUTO_7679 ?AUTO_7684 ) ( VISIBLE ?AUTO_7684 ?AUTO_7680 ) ( FULL ?AUTO_7681 ) )
    :subtasks
    ( ( !DROP ?AUTO_7679 ?AUTO_7681 )
      ( GET_SOIL_DATA ?AUTO_7678 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_7678 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7719 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7720 - LANDER
      ?AUTO_7723 - WAYPOINT
      ?AUTO_7724 - WAYPOINT
      ?AUTO_7721 - ROVER
      ?AUTO_7722 - WAYPOINT
      ?AUTO_7725 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7720 ?AUTO_7723 ) ( VISIBLE ?AUTO_7724 ?AUTO_7723 ) ( AVAILABLE ?AUTO_7721 ) ( CHANNEL_FREE ?AUTO_7720 ) ( not ( = ?AUTO_7719 ?AUTO_7724 ) ) ( not ( = ?AUTO_7719 ?AUTO_7723 ) ) ( not ( = ?AUTO_7724 ?AUTO_7723 ) ) ( CAN_TRAVERSE ?AUTO_7721 ?AUTO_7722 ?AUTO_7724 ) ( VISIBLE ?AUTO_7722 ?AUTO_7724 ) ( not ( = ?AUTO_7719 ?AUTO_7722 ) ) ( not ( = ?AUTO_7723 ?AUTO_7722 ) ) ( not ( = ?AUTO_7724 ?AUTO_7722 ) ) ( CAN_TRAVERSE ?AUTO_7721 ?AUTO_7719 ?AUTO_7722 ) ( VISIBLE ?AUTO_7719 ?AUTO_7722 ) ( AT_ROCK_SAMPLE ?AUTO_7719 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7721 ) ( STORE_OF ?AUTO_7725 ?AUTO_7721 ) ( EMPTY ?AUTO_7725 ) ( CAN_TRAVERSE ?AUTO_7721 ?AUTO_7724 ?AUTO_7719 ) ( AT ?AUTO_7721 ?AUTO_7724 ) ( VISIBLE ?AUTO_7724 ?AUTO_7719 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7721 ?AUTO_7724 ?AUTO_7719 )
      ( GET_ROCK_DATA ?AUTO_7719 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7719 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7726 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7729 - LANDER
      ?AUTO_7728 - WAYPOINT
      ?AUTO_7727 - WAYPOINT
      ?AUTO_7732 - ROVER
      ?AUTO_7731 - WAYPOINT
      ?AUTO_7730 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7729 ?AUTO_7728 ) ( VISIBLE ?AUTO_7727 ?AUTO_7728 ) ( AVAILABLE ?AUTO_7732 ) ( CHANNEL_FREE ?AUTO_7729 ) ( not ( = ?AUTO_7726 ?AUTO_7727 ) ) ( not ( = ?AUTO_7726 ?AUTO_7728 ) ) ( not ( = ?AUTO_7727 ?AUTO_7728 ) ) ( CAN_TRAVERSE ?AUTO_7732 ?AUTO_7731 ?AUTO_7727 ) ( VISIBLE ?AUTO_7731 ?AUTO_7727 ) ( not ( = ?AUTO_7726 ?AUTO_7731 ) ) ( not ( = ?AUTO_7728 ?AUTO_7731 ) ) ( not ( = ?AUTO_7727 ?AUTO_7731 ) ) ( CAN_TRAVERSE ?AUTO_7732 ?AUTO_7726 ?AUTO_7731 ) ( VISIBLE ?AUTO_7726 ?AUTO_7731 ) ( AT_ROCK_SAMPLE ?AUTO_7726 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7732 ) ( STORE_OF ?AUTO_7730 ?AUTO_7732 ) ( CAN_TRAVERSE ?AUTO_7732 ?AUTO_7727 ?AUTO_7726 ) ( AT ?AUTO_7732 ?AUTO_7727 ) ( VISIBLE ?AUTO_7727 ?AUTO_7726 ) ( FULL ?AUTO_7730 ) )
    :subtasks
    ( ( !DROP ?AUTO_7732 ?AUTO_7730 )
      ( GET_ROCK_DATA ?AUTO_7726 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7726 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7772 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7775 - LANDER
      ?AUTO_7777 - WAYPOINT
      ?AUTO_7774 - WAYPOINT
      ?AUTO_7778 - ROVER
      ?AUTO_7773 - WAYPOINT
      ?AUTO_7776 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7775 ?AUTO_7777 ) ( VISIBLE ?AUTO_7774 ?AUTO_7777 ) ( AVAILABLE ?AUTO_7778 ) ( CHANNEL_FREE ?AUTO_7775 ) ( not ( = ?AUTO_7772 ?AUTO_7774 ) ) ( not ( = ?AUTO_7772 ?AUTO_7777 ) ) ( not ( = ?AUTO_7774 ?AUTO_7777 ) ) ( CAN_TRAVERSE ?AUTO_7778 ?AUTO_7773 ?AUTO_7774 ) ( VISIBLE ?AUTO_7773 ?AUTO_7774 ) ( not ( = ?AUTO_7772 ?AUTO_7773 ) ) ( not ( = ?AUTO_7777 ?AUTO_7773 ) ) ( not ( = ?AUTO_7774 ?AUTO_7773 ) ) ( CAN_TRAVERSE ?AUTO_7778 ?AUTO_7772 ?AUTO_7773 ) ( VISIBLE ?AUTO_7772 ?AUTO_7773 ) ( AT_ROCK_SAMPLE ?AUTO_7772 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7778 ) ( STORE_OF ?AUTO_7776 ?AUTO_7778 ) ( EMPTY ?AUTO_7776 ) ( CAN_TRAVERSE ?AUTO_7778 ?AUTO_7774 ?AUTO_7772 ) ( VISIBLE ?AUTO_7774 ?AUTO_7772 ) ( AT ?AUTO_7778 ?AUTO_7773 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7778 ?AUTO_7773 ?AUTO_7774 )
      ( GET_ROCK_DATA ?AUTO_7772 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7772 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7779 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7785 - LANDER
      ?AUTO_7784 - WAYPOINT
      ?AUTO_7782 - WAYPOINT
      ?AUTO_7781 - ROVER
      ?AUTO_7780 - WAYPOINT
      ?AUTO_7783 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7785 ?AUTO_7784 ) ( VISIBLE ?AUTO_7782 ?AUTO_7784 ) ( AVAILABLE ?AUTO_7781 ) ( CHANNEL_FREE ?AUTO_7785 ) ( not ( = ?AUTO_7779 ?AUTO_7782 ) ) ( not ( = ?AUTO_7779 ?AUTO_7784 ) ) ( not ( = ?AUTO_7782 ?AUTO_7784 ) ) ( CAN_TRAVERSE ?AUTO_7781 ?AUTO_7780 ?AUTO_7782 ) ( VISIBLE ?AUTO_7780 ?AUTO_7782 ) ( not ( = ?AUTO_7779 ?AUTO_7780 ) ) ( not ( = ?AUTO_7784 ?AUTO_7780 ) ) ( not ( = ?AUTO_7782 ?AUTO_7780 ) ) ( CAN_TRAVERSE ?AUTO_7781 ?AUTO_7779 ?AUTO_7780 ) ( VISIBLE ?AUTO_7779 ?AUTO_7780 ) ( AT_ROCK_SAMPLE ?AUTO_7779 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7781 ) ( STORE_OF ?AUTO_7783 ?AUTO_7781 ) ( CAN_TRAVERSE ?AUTO_7781 ?AUTO_7782 ?AUTO_7779 ) ( VISIBLE ?AUTO_7782 ?AUTO_7779 ) ( AT ?AUTO_7781 ?AUTO_7780 ) ( FULL ?AUTO_7783 ) )
    :subtasks
    ( ( !DROP ?AUTO_7781 ?AUTO_7783 )
      ( GET_ROCK_DATA ?AUTO_7779 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7779 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7788 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7793 - LANDER
      ?AUTO_7791 - WAYPOINT
      ?AUTO_7789 - WAYPOINT
      ?AUTO_7794 - ROVER
      ?AUTO_7792 - WAYPOINT
      ?AUTO_7790 - STORE
      ?AUTO_7795 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7793 ?AUTO_7791 ) ( VISIBLE ?AUTO_7789 ?AUTO_7791 ) ( AVAILABLE ?AUTO_7794 ) ( CHANNEL_FREE ?AUTO_7793 ) ( not ( = ?AUTO_7788 ?AUTO_7789 ) ) ( not ( = ?AUTO_7788 ?AUTO_7791 ) ) ( not ( = ?AUTO_7789 ?AUTO_7791 ) ) ( CAN_TRAVERSE ?AUTO_7794 ?AUTO_7792 ?AUTO_7789 ) ( VISIBLE ?AUTO_7792 ?AUTO_7789 ) ( not ( = ?AUTO_7788 ?AUTO_7792 ) ) ( not ( = ?AUTO_7791 ?AUTO_7792 ) ) ( not ( = ?AUTO_7789 ?AUTO_7792 ) ) ( CAN_TRAVERSE ?AUTO_7794 ?AUTO_7788 ?AUTO_7792 ) ( VISIBLE ?AUTO_7788 ?AUTO_7792 ) ( AT_ROCK_SAMPLE ?AUTO_7788 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7794 ) ( STORE_OF ?AUTO_7790 ?AUTO_7794 ) ( CAN_TRAVERSE ?AUTO_7794 ?AUTO_7789 ?AUTO_7788 ) ( VISIBLE ?AUTO_7789 ?AUTO_7788 ) ( FULL ?AUTO_7790 ) ( CAN_TRAVERSE ?AUTO_7794 ?AUTO_7795 ?AUTO_7792 ) ( AT ?AUTO_7794 ?AUTO_7795 ) ( VISIBLE ?AUTO_7795 ?AUTO_7792 ) ( not ( = ?AUTO_7788 ?AUTO_7795 ) ) ( not ( = ?AUTO_7791 ?AUTO_7795 ) ) ( not ( = ?AUTO_7789 ?AUTO_7795 ) ) ( not ( = ?AUTO_7792 ?AUTO_7795 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7794 ?AUTO_7795 ?AUTO_7792 )
      ( GET_ROCK_DATA ?AUTO_7788 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7788 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_7796 - WAYPOINT
    )
    :vars
    (
      ?AUTO_7801 - LANDER
      ?AUTO_7803 - WAYPOINT
      ?AUTO_7799 - WAYPOINT
      ?AUTO_7798 - ROVER
      ?AUTO_7802 - WAYPOINT
      ?AUTO_7797 - STORE
      ?AUTO_7800 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7801 ?AUTO_7803 ) ( VISIBLE ?AUTO_7799 ?AUTO_7803 ) ( AVAILABLE ?AUTO_7798 ) ( CHANNEL_FREE ?AUTO_7801 ) ( not ( = ?AUTO_7796 ?AUTO_7799 ) ) ( not ( = ?AUTO_7796 ?AUTO_7803 ) ) ( not ( = ?AUTO_7799 ?AUTO_7803 ) ) ( CAN_TRAVERSE ?AUTO_7798 ?AUTO_7802 ?AUTO_7799 ) ( VISIBLE ?AUTO_7802 ?AUTO_7799 ) ( not ( = ?AUTO_7796 ?AUTO_7802 ) ) ( not ( = ?AUTO_7803 ?AUTO_7802 ) ) ( not ( = ?AUTO_7799 ?AUTO_7802 ) ) ( CAN_TRAVERSE ?AUTO_7798 ?AUTO_7796 ?AUTO_7802 ) ( VISIBLE ?AUTO_7796 ?AUTO_7802 ) ( AT_ROCK_SAMPLE ?AUTO_7796 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_7798 ) ( STORE_OF ?AUTO_7797 ?AUTO_7798 ) ( CAN_TRAVERSE ?AUTO_7798 ?AUTO_7799 ?AUTO_7796 ) ( VISIBLE ?AUTO_7799 ?AUTO_7796 ) ( CAN_TRAVERSE ?AUTO_7798 ?AUTO_7800 ?AUTO_7802 ) ( AT ?AUTO_7798 ?AUTO_7800 ) ( VISIBLE ?AUTO_7800 ?AUTO_7802 ) ( not ( = ?AUTO_7796 ?AUTO_7800 ) ) ( not ( = ?AUTO_7803 ?AUTO_7800 ) ) ( not ( = ?AUTO_7799 ?AUTO_7800 ) ) ( not ( = ?AUTO_7802 ?AUTO_7800 ) ) ( AT_ROCK_SAMPLE ?AUTO_7800 ) ( EMPTY ?AUTO_7797 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_7798 ?AUTO_7797 ?AUTO_7800 )
      ( GET_ROCK_DATA ?AUTO_7796 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_7796 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7880 - OBJECTIVE
      ?AUTO_7879 - MODE
    )
    :vars
    (
      ?AUTO_7881 - LANDER
      ?AUTO_7887 - WAYPOINT
      ?AUTO_7884 - WAYPOINT
      ?AUTO_7885 - ROVER
      ?AUTO_7883 - WAYPOINT
      ?AUTO_7882 - CAMERA
      ?AUTO_7886 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7881 ?AUTO_7887 ) ( VISIBLE ?AUTO_7884 ?AUTO_7887 ) ( AVAILABLE ?AUTO_7885 ) ( CHANNEL_FREE ?AUTO_7881 ) ( not ( = ?AUTO_7884 ?AUTO_7887 ) ) ( CAN_TRAVERSE ?AUTO_7885 ?AUTO_7883 ?AUTO_7884 ) ( VISIBLE ?AUTO_7883 ?AUTO_7884 ) ( not ( = ?AUTO_7887 ?AUTO_7883 ) ) ( not ( = ?AUTO_7884 ?AUTO_7883 ) ) ( CALIBRATED ?AUTO_7882 ?AUTO_7885 ) ( ON_BOARD ?AUTO_7882 ?AUTO_7885 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7885 ) ( SUPPORTS ?AUTO_7882 ?AUTO_7879 ) ( VISIBLE_FROM ?AUTO_7880 ?AUTO_7883 ) ( CAN_TRAVERSE ?AUTO_7885 ?AUTO_7886 ?AUTO_7883 ) ( VISIBLE ?AUTO_7886 ?AUTO_7883 ) ( not ( = ?AUTO_7887 ?AUTO_7886 ) ) ( not ( = ?AUTO_7884 ?AUTO_7886 ) ) ( not ( = ?AUTO_7883 ?AUTO_7886 ) ) ( CAN_TRAVERSE ?AUTO_7885 ?AUTO_7884 ?AUTO_7886 ) ( AT ?AUTO_7885 ?AUTO_7884 ) ( VISIBLE ?AUTO_7884 ?AUTO_7886 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7885 ?AUTO_7884 ?AUTO_7886 )
      ( GET_IMAGE_DATA ?AUTO_7880 ?AUTO_7879 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7880 ?AUTO_7879 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7889 - OBJECTIVE
      ?AUTO_7888 - MODE
    )
    :vars
    (
      ?AUTO_7895 - LANDER
      ?AUTO_7890 - WAYPOINT
      ?AUTO_7891 - WAYPOINT
      ?AUTO_7894 - ROVER
      ?AUTO_7893 - WAYPOINT
      ?AUTO_7896 - CAMERA
      ?AUTO_7892 - WAYPOINT
      ?AUTO_7897 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7895 ?AUTO_7890 ) ( VISIBLE ?AUTO_7891 ?AUTO_7890 ) ( AVAILABLE ?AUTO_7894 ) ( CHANNEL_FREE ?AUTO_7895 ) ( not ( = ?AUTO_7891 ?AUTO_7890 ) ) ( CAN_TRAVERSE ?AUTO_7894 ?AUTO_7893 ?AUTO_7891 ) ( VISIBLE ?AUTO_7893 ?AUTO_7891 ) ( not ( = ?AUTO_7890 ?AUTO_7893 ) ) ( not ( = ?AUTO_7891 ?AUTO_7893 ) ) ( ON_BOARD ?AUTO_7896 ?AUTO_7894 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7894 ) ( SUPPORTS ?AUTO_7896 ?AUTO_7888 ) ( VISIBLE_FROM ?AUTO_7889 ?AUTO_7893 ) ( CAN_TRAVERSE ?AUTO_7894 ?AUTO_7892 ?AUTO_7893 ) ( VISIBLE ?AUTO_7892 ?AUTO_7893 ) ( not ( = ?AUTO_7890 ?AUTO_7892 ) ) ( not ( = ?AUTO_7891 ?AUTO_7892 ) ) ( not ( = ?AUTO_7893 ?AUTO_7892 ) ) ( CAN_TRAVERSE ?AUTO_7894 ?AUTO_7891 ?AUTO_7892 ) ( AT ?AUTO_7894 ?AUTO_7891 ) ( VISIBLE ?AUTO_7891 ?AUTO_7892 ) ( CALIBRATION_TARGET ?AUTO_7896 ?AUTO_7897 ) ( VISIBLE_FROM ?AUTO_7897 ?AUTO_7891 ) ( not ( = ?AUTO_7889 ?AUTO_7897 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_7894 ?AUTO_7896 ?AUTO_7897 ?AUTO_7891 )
      ( GET_IMAGE_DATA ?AUTO_7889 ?AUTO_7888 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7889 ?AUTO_7888 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_7948 - OBJECTIVE
      ?AUTO_7947 - MODE
    )
    :vars
    (
      ?AUTO_7955 - LANDER
      ?AUTO_7954 - WAYPOINT
      ?AUTO_7951 - WAYPOINT
      ?AUTO_7950 - ROVER
      ?AUTO_7953 - WAYPOINT
      ?AUTO_7949 - CAMERA
      ?AUTO_7952 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_7955 ?AUTO_7954 ) ( VISIBLE ?AUTO_7951 ?AUTO_7954 ) ( AVAILABLE ?AUTO_7950 ) ( CHANNEL_FREE ?AUTO_7955 ) ( not ( = ?AUTO_7951 ?AUTO_7954 ) ) ( CAN_TRAVERSE ?AUTO_7950 ?AUTO_7953 ?AUTO_7951 ) ( VISIBLE ?AUTO_7953 ?AUTO_7951 ) ( not ( = ?AUTO_7954 ?AUTO_7953 ) ) ( not ( = ?AUTO_7951 ?AUTO_7953 ) ) ( ON_BOARD ?AUTO_7949 ?AUTO_7950 ) ( EQUIPPED_FOR_IMAGING ?AUTO_7950 ) ( SUPPORTS ?AUTO_7949 ?AUTO_7947 ) ( VISIBLE_FROM ?AUTO_7948 ?AUTO_7953 ) ( CALIBRATION_TARGET ?AUTO_7949 ?AUTO_7948 ) ( CAN_TRAVERSE ?AUTO_7950 ?AUTO_7952 ?AUTO_7953 ) ( VISIBLE ?AUTO_7952 ?AUTO_7953 ) ( not ( = ?AUTO_7954 ?AUTO_7952 ) ) ( not ( = ?AUTO_7951 ?AUTO_7952 ) ) ( not ( = ?AUTO_7953 ?AUTO_7952 ) ) ( CAN_TRAVERSE ?AUTO_7950 ?AUTO_7951 ?AUTO_7952 ) ( AT ?AUTO_7950 ?AUTO_7951 ) ( VISIBLE ?AUTO_7951 ?AUTO_7952 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_7950 ?AUTO_7951 ?AUTO_7952 )
      ( GET_IMAGE_DATA ?AUTO_7948 ?AUTO_7947 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_7948 ?AUTO_7947 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8017 - OBJECTIVE
      ?AUTO_8018 - MODE
    )
    :vars
    (
      ?AUTO_8021 - LANDER
      ?AUTO_8020 - WAYPOINT
      ?AUTO_8023 - WAYPOINT
      ?AUTO_8022 - ROVER
      ?AUTO_8024 - CAMERA
      ?AUTO_8019 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8021 ?AUTO_8020 ) ( VISIBLE ?AUTO_8023 ?AUTO_8020 ) ( AVAILABLE ?AUTO_8022 ) ( CHANNEL_FREE ?AUTO_8021 ) ( not ( = ?AUTO_8023 ?AUTO_8020 ) ) ( CALIBRATED ?AUTO_8024 ?AUTO_8022 ) ( ON_BOARD ?AUTO_8024 ?AUTO_8022 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8022 ) ( SUPPORTS ?AUTO_8024 ?AUTO_8018 ) ( VISIBLE_FROM ?AUTO_8017 ?AUTO_8023 ) ( CAN_TRAVERSE ?AUTO_8022 ?AUTO_8019 ?AUTO_8023 ) ( VISIBLE ?AUTO_8019 ?AUTO_8023 ) ( not ( = ?AUTO_8020 ?AUTO_8019 ) ) ( not ( = ?AUTO_8023 ?AUTO_8019 ) ) ( CAN_TRAVERSE ?AUTO_8022 ?AUTO_8020 ?AUTO_8019 ) ( AT ?AUTO_8022 ?AUTO_8020 ) ( VISIBLE ?AUTO_8020 ?AUTO_8019 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8022 ?AUTO_8020 ?AUTO_8019 )
      ( GET_IMAGE_DATA ?AUTO_8017 ?AUTO_8018 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8017 ?AUTO_8018 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8027 - OBJECTIVE
      ?AUTO_8028 - MODE
    )
    :vars
    (
      ?AUTO_8029 - LANDER
      ?AUTO_8032 - WAYPOINT
      ?AUTO_8031 - WAYPOINT
      ?AUTO_8033 - ROVER
      ?AUTO_8030 - CAMERA
      ?AUTO_8034 - WAYPOINT
      ?AUTO_8035 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8029 ?AUTO_8032 ) ( VISIBLE ?AUTO_8031 ?AUTO_8032 ) ( AVAILABLE ?AUTO_8033 ) ( CHANNEL_FREE ?AUTO_8029 ) ( not ( = ?AUTO_8031 ?AUTO_8032 ) ) ( CALIBRATED ?AUTO_8030 ?AUTO_8033 ) ( ON_BOARD ?AUTO_8030 ?AUTO_8033 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8033 ) ( SUPPORTS ?AUTO_8030 ?AUTO_8028 ) ( VISIBLE_FROM ?AUTO_8027 ?AUTO_8031 ) ( CAN_TRAVERSE ?AUTO_8033 ?AUTO_8034 ?AUTO_8031 ) ( VISIBLE ?AUTO_8034 ?AUTO_8031 ) ( not ( = ?AUTO_8032 ?AUTO_8034 ) ) ( not ( = ?AUTO_8031 ?AUTO_8034 ) ) ( CAN_TRAVERSE ?AUTO_8033 ?AUTO_8032 ?AUTO_8034 ) ( VISIBLE ?AUTO_8032 ?AUTO_8034 ) ( CAN_TRAVERSE ?AUTO_8033 ?AUTO_8035 ?AUTO_8032 ) ( AT ?AUTO_8033 ?AUTO_8035 ) ( VISIBLE ?AUTO_8035 ?AUTO_8032 ) ( not ( = ?AUTO_8032 ?AUTO_8035 ) ) ( not ( = ?AUTO_8031 ?AUTO_8035 ) ) ( not ( = ?AUTO_8034 ?AUTO_8035 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8033 ?AUTO_8035 ?AUTO_8032 )
      ( GET_IMAGE_DATA ?AUTO_8027 ?AUTO_8028 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8027 ?AUTO_8028 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8042 - OBJECTIVE
      ?AUTO_8043 - MODE
    )
    :vars
    (
      ?AUTO_8046 - LANDER
      ?AUTO_8048 - WAYPOINT
      ?AUTO_8049 - WAYPOINT
      ?AUTO_8047 - ROVER
      ?AUTO_8045 - CAMERA
      ?AUTO_8050 - WAYPOINT
      ?AUTO_8044 - WAYPOINT
      ?AUTO_8051 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8046 ?AUTO_8048 ) ( VISIBLE ?AUTO_8049 ?AUTO_8048 ) ( AVAILABLE ?AUTO_8047 ) ( CHANNEL_FREE ?AUTO_8046 ) ( not ( = ?AUTO_8049 ?AUTO_8048 ) ) ( ON_BOARD ?AUTO_8045 ?AUTO_8047 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8047 ) ( SUPPORTS ?AUTO_8045 ?AUTO_8043 ) ( VISIBLE_FROM ?AUTO_8042 ?AUTO_8049 ) ( CAN_TRAVERSE ?AUTO_8047 ?AUTO_8050 ?AUTO_8049 ) ( VISIBLE ?AUTO_8050 ?AUTO_8049 ) ( not ( = ?AUTO_8048 ?AUTO_8050 ) ) ( not ( = ?AUTO_8049 ?AUTO_8050 ) ) ( CAN_TRAVERSE ?AUTO_8047 ?AUTO_8048 ?AUTO_8050 ) ( VISIBLE ?AUTO_8048 ?AUTO_8050 ) ( CAN_TRAVERSE ?AUTO_8047 ?AUTO_8044 ?AUTO_8048 ) ( AT ?AUTO_8047 ?AUTO_8044 ) ( VISIBLE ?AUTO_8044 ?AUTO_8048 ) ( not ( = ?AUTO_8048 ?AUTO_8044 ) ) ( not ( = ?AUTO_8049 ?AUTO_8044 ) ) ( not ( = ?AUTO_8050 ?AUTO_8044 ) ) ( CALIBRATION_TARGET ?AUTO_8045 ?AUTO_8051 ) ( VISIBLE_FROM ?AUTO_8051 ?AUTO_8044 ) ( not ( = ?AUTO_8042 ?AUTO_8051 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8047 ?AUTO_8045 ?AUTO_8051 ?AUTO_8044 )
      ( GET_IMAGE_DATA ?AUTO_8042 ?AUTO_8043 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8042 ?AUTO_8043 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8235 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8240 - LANDER
      ?AUTO_8236 - WAYPOINT
      ?AUTO_8239 - ROVER
      ?AUTO_8238 - STORE
      ?AUTO_8237 - WAYPOINT
      ?AUTO_8241 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8240 ?AUTO_8235 ) ( VISIBLE ?AUTO_8236 ?AUTO_8235 ) ( AVAILABLE ?AUTO_8239 ) ( CHANNEL_FREE ?AUTO_8240 ) ( not ( = ?AUTO_8235 ?AUTO_8236 ) ) ( CAN_TRAVERSE ?AUTO_8239 ?AUTO_8235 ?AUTO_8236 ) ( VISIBLE ?AUTO_8235 ?AUTO_8236 ) ( AT_ROCK_SAMPLE ?AUTO_8235 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8239 ) ( STORE_OF ?AUTO_8238 ?AUTO_8239 ) ( EMPTY ?AUTO_8238 ) ( CAN_TRAVERSE ?AUTO_8239 ?AUTO_8236 ?AUTO_8235 ) ( CAN_TRAVERSE ?AUTO_8239 ?AUTO_8237 ?AUTO_8236 ) ( VISIBLE ?AUTO_8237 ?AUTO_8236 ) ( not ( = ?AUTO_8235 ?AUTO_8237 ) ) ( not ( = ?AUTO_8236 ?AUTO_8237 ) ) ( CAN_TRAVERSE ?AUTO_8239 ?AUTO_8241 ?AUTO_8237 ) ( AT ?AUTO_8239 ?AUTO_8241 ) ( VISIBLE ?AUTO_8241 ?AUTO_8237 ) ( not ( = ?AUTO_8235 ?AUTO_8241 ) ) ( not ( = ?AUTO_8236 ?AUTO_8241 ) ) ( not ( = ?AUTO_8237 ?AUTO_8241 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8239 ?AUTO_8241 ?AUTO_8237 )
      ( GET_ROCK_DATA ?AUTO_8235 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8235 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8242 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8248 - LANDER
      ?AUTO_8244 - WAYPOINT
      ?AUTO_8246 - ROVER
      ?AUTO_8247 - STORE
      ?AUTO_8243 - WAYPOINT
      ?AUTO_8245 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8248 ?AUTO_8242 ) ( VISIBLE ?AUTO_8244 ?AUTO_8242 ) ( AVAILABLE ?AUTO_8246 ) ( CHANNEL_FREE ?AUTO_8248 ) ( not ( = ?AUTO_8242 ?AUTO_8244 ) ) ( CAN_TRAVERSE ?AUTO_8246 ?AUTO_8242 ?AUTO_8244 ) ( VISIBLE ?AUTO_8242 ?AUTO_8244 ) ( AT_ROCK_SAMPLE ?AUTO_8242 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8246 ) ( STORE_OF ?AUTO_8247 ?AUTO_8246 ) ( CAN_TRAVERSE ?AUTO_8246 ?AUTO_8244 ?AUTO_8242 ) ( CAN_TRAVERSE ?AUTO_8246 ?AUTO_8243 ?AUTO_8244 ) ( VISIBLE ?AUTO_8243 ?AUTO_8244 ) ( not ( = ?AUTO_8242 ?AUTO_8243 ) ) ( not ( = ?AUTO_8244 ?AUTO_8243 ) ) ( CAN_TRAVERSE ?AUTO_8246 ?AUTO_8245 ?AUTO_8243 ) ( AT ?AUTO_8246 ?AUTO_8245 ) ( VISIBLE ?AUTO_8245 ?AUTO_8243 ) ( not ( = ?AUTO_8242 ?AUTO_8245 ) ) ( not ( = ?AUTO_8244 ?AUTO_8245 ) ) ( not ( = ?AUTO_8243 ?AUTO_8245 ) ) ( FULL ?AUTO_8247 ) )
    :subtasks
    ( ( !DROP ?AUTO_8246 ?AUTO_8247 )
      ( GET_ROCK_DATA ?AUTO_8242 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8242 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8313 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8314 - LANDER
      ?AUTO_8317 - WAYPOINT
      ?AUTO_8315 - ROVER
      ?AUTO_8316 - STORE
      ?AUTO_8318 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8314 ?AUTO_8313 ) ( VISIBLE ?AUTO_8317 ?AUTO_8313 ) ( AVAILABLE ?AUTO_8315 ) ( CHANNEL_FREE ?AUTO_8314 ) ( not ( = ?AUTO_8313 ?AUTO_8317 ) ) ( CAN_TRAVERSE ?AUTO_8315 ?AUTO_8313 ?AUTO_8317 ) ( VISIBLE ?AUTO_8313 ?AUTO_8317 ) ( AT_SOIL_SAMPLE ?AUTO_8313 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8315 ) ( STORE_OF ?AUTO_8316 ?AUTO_8315 ) ( CAN_TRAVERSE ?AUTO_8315 ?AUTO_8317 ?AUTO_8313 ) ( FULL ?AUTO_8316 ) ( CAN_TRAVERSE ?AUTO_8315 ?AUTO_8318 ?AUTO_8317 ) ( AT ?AUTO_8315 ?AUTO_8318 ) ( VISIBLE ?AUTO_8318 ?AUTO_8317 ) ( not ( = ?AUTO_8313 ?AUTO_8318 ) ) ( not ( = ?AUTO_8317 ?AUTO_8318 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8315 ?AUTO_8318 ?AUTO_8317 )
      ( GET_SOIL_DATA ?AUTO_8313 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8313 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8320 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8325 - LANDER
      ?AUTO_8321 - WAYPOINT
      ?AUTO_8323 - ROVER
      ?AUTO_8322 - STORE
      ?AUTO_8324 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8325 ?AUTO_8320 ) ( VISIBLE ?AUTO_8321 ?AUTO_8320 ) ( AVAILABLE ?AUTO_8323 ) ( CHANNEL_FREE ?AUTO_8325 ) ( not ( = ?AUTO_8320 ?AUTO_8321 ) ) ( CAN_TRAVERSE ?AUTO_8323 ?AUTO_8320 ?AUTO_8321 ) ( VISIBLE ?AUTO_8320 ?AUTO_8321 ) ( AT_SOIL_SAMPLE ?AUTO_8320 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8323 ) ( STORE_OF ?AUTO_8322 ?AUTO_8323 ) ( CAN_TRAVERSE ?AUTO_8323 ?AUTO_8321 ?AUTO_8320 ) ( CAN_TRAVERSE ?AUTO_8323 ?AUTO_8324 ?AUTO_8321 ) ( AT ?AUTO_8323 ?AUTO_8324 ) ( VISIBLE ?AUTO_8324 ?AUTO_8321 ) ( not ( = ?AUTO_8320 ?AUTO_8324 ) ) ( not ( = ?AUTO_8321 ?AUTO_8324 ) ) ( AT_SOIL_SAMPLE ?AUTO_8324 ) ( EMPTY ?AUTO_8322 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_8323 ?AUTO_8322 ?AUTO_8324 )
      ( GET_SOIL_DATA ?AUTO_8320 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8320 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8327 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8330 - LANDER
      ?AUTO_8331 - WAYPOINT
      ?AUTO_8332 - ROVER
      ?AUTO_8329 - STORE
      ?AUTO_8328 - WAYPOINT
      ?AUTO_8333 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8330 ?AUTO_8327 ) ( VISIBLE ?AUTO_8331 ?AUTO_8327 ) ( AVAILABLE ?AUTO_8332 ) ( CHANNEL_FREE ?AUTO_8330 ) ( not ( = ?AUTO_8327 ?AUTO_8331 ) ) ( CAN_TRAVERSE ?AUTO_8332 ?AUTO_8327 ?AUTO_8331 ) ( VISIBLE ?AUTO_8327 ?AUTO_8331 ) ( AT_SOIL_SAMPLE ?AUTO_8327 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8332 ) ( STORE_OF ?AUTO_8329 ?AUTO_8332 ) ( CAN_TRAVERSE ?AUTO_8332 ?AUTO_8331 ?AUTO_8327 ) ( FULL ?AUTO_8329 ) ( CAN_TRAVERSE ?AUTO_8332 ?AUTO_8328 ?AUTO_8331 ) ( VISIBLE ?AUTO_8328 ?AUTO_8331 ) ( not ( = ?AUTO_8327 ?AUTO_8328 ) ) ( not ( = ?AUTO_8331 ?AUTO_8328 ) ) ( CAN_TRAVERSE ?AUTO_8332 ?AUTO_8333 ?AUTO_8328 ) ( AT ?AUTO_8332 ?AUTO_8333 ) ( VISIBLE ?AUTO_8333 ?AUTO_8328 ) ( not ( = ?AUTO_8327 ?AUTO_8333 ) ) ( not ( = ?AUTO_8331 ?AUTO_8333 ) ) ( not ( = ?AUTO_8328 ?AUTO_8333 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8332 ?AUTO_8333 ?AUTO_8328 )
      ( GET_SOIL_DATA ?AUTO_8327 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8327 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8335 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8336 - LANDER
      ?AUTO_8338 - WAYPOINT
      ?AUTO_8340 - ROVER
      ?AUTO_8337 - STORE
      ?AUTO_8341 - WAYPOINT
      ?AUTO_8339 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8336 ?AUTO_8335 ) ( VISIBLE ?AUTO_8338 ?AUTO_8335 ) ( AVAILABLE ?AUTO_8340 ) ( CHANNEL_FREE ?AUTO_8336 ) ( not ( = ?AUTO_8335 ?AUTO_8338 ) ) ( CAN_TRAVERSE ?AUTO_8340 ?AUTO_8335 ?AUTO_8338 ) ( VISIBLE ?AUTO_8335 ?AUTO_8338 ) ( AT_SOIL_SAMPLE ?AUTO_8335 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8340 ) ( STORE_OF ?AUTO_8337 ?AUTO_8340 ) ( CAN_TRAVERSE ?AUTO_8340 ?AUTO_8338 ?AUTO_8335 ) ( CAN_TRAVERSE ?AUTO_8340 ?AUTO_8341 ?AUTO_8338 ) ( VISIBLE ?AUTO_8341 ?AUTO_8338 ) ( not ( = ?AUTO_8335 ?AUTO_8341 ) ) ( not ( = ?AUTO_8338 ?AUTO_8341 ) ) ( CAN_TRAVERSE ?AUTO_8340 ?AUTO_8339 ?AUTO_8341 ) ( AT ?AUTO_8340 ?AUTO_8339 ) ( VISIBLE ?AUTO_8339 ?AUTO_8341 ) ( not ( = ?AUTO_8335 ?AUTO_8339 ) ) ( not ( = ?AUTO_8338 ?AUTO_8339 ) ) ( not ( = ?AUTO_8341 ?AUTO_8339 ) ) ( AT_ROCK_SAMPLE ?AUTO_8339 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8340 ) ( EMPTY ?AUTO_8337 ) )
    :subtasks
    ( ( !SAMPLE_ROCK ?AUTO_8340 ?AUTO_8337 ?AUTO_8339 )
      ( GET_SOIL_DATA ?AUTO_8335 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8335 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8384 - OBJECTIVE
      ?AUTO_8385 - MODE
    )
    :vars
    (
      ?AUTO_8387 - LANDER
      ?AUTO_8390 - WAYPOINT
      ?AUTO_8386 - WAYPOINT
      ?AUTO_8389 - ROVER
      ?AUTO_8388 - CAMERA
      ?AUTO_8391 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8387 ?AUTO_8390 ) ( VISIBLE ?AUTO_8386 ?AUTO_8390 ) ( AVAILABLE ?AUTO_8389 ) ( CHANNEL_FREE ?AUTO_8387 ) ( not ( = ?AUTO_8386 ?AUTO_8390 ) ) ( CAN_TRAVERSE ?AUTO_8389 ?AUTO_8390 ?AUTO_8386 ) ( VISIBLE ?AUTO_8390 ?AUTO_8386 ) ( CALIBRATED ?AUTO_8388 ?AUTO_8389 ) ( ON_BOARD ?AUTO_8388 ?AUTO_8389 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8389 ) ( SUPPORTS ?AUTO_8388 ?AUTO_8385 ) ( VISIBLE_FROM ?AUTO_8384 ?AUTO_8390 ) ( CAN_TRAVERSE ?AUTO_8389 ?AUTO_8386 ?AUTO_8390 ) ( CAN_TRAVERSE ?AUTO_8389 ?AUTO_8391 ?AUTO_8386 ) ( AT ?AUTO_8389 ?AUTO_8391 ) ( VISIBLE ?AUTO_8391 ?AUTO_8386 ) ( not ( = ?AUTO_8390 ?AUTO_8391 ) ) ( not ( = ?AUTO_8386 ?AUTO_8391 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8389 ?AUTO_8391 ?AUTO_8386 )
      ( GET_IMAGE_DATA ?AUTO_8384 ?AUTO_8385 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8384 ?AUTO_8385 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8392 - OBJECTIVE
      ?AUTO_8393 - MODE
    )
    :vars
    (
      ?AUTO_8394 - LANDER
      ?AUTO_8397 - WAYPOINT
      ?AUTO_8395 - WAYPOINT
      ?AUTO_8399 - ROVER
      ?AUTO_8398 - CAMERA
      ?AUTO_8396 - WAYPOINT
      ?AUTO_8400 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8394 ?AUTO_8397 ) ( VISIBLE ?AUTO_8395 ?AUTO_8397 ) ( AVAILABLE ?AUTO_8399 ) ( CHANNEL_FREE ?AUTO_8394 ) ( not ( = ?AUTO_8395 ?AUTO_8397 ) ) ( CAN_TRAVERSE ?AUTO_8399 ?AUTO_8397 ?AUTO_8395 ) ( VISIBLE ?AUTO_8397 ?AUTO_8395 ) ( ON_BOARD ?AUTO_8398 ?AUTO_8399 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8399 ) ( SUPPORTS ?AUTO_8398 ?AUTO_8393 ) ( VISIBLE_FROM ?AUTO_8392 ?AUTO_8397 ) ( CAN_TRAVERSE ?AUTO_8399 ?AUTO_8395 ?AUTO_8397 ) ( CAN_TRAVERSE ?AUTO_8399 ?AUTO_8396 ?AUTO_8395 ) ( AT ?AUTO_8399 ?AUTO_8396 ) ( VISIBLE ?AUTO_8396 ?AUTO_8395 ) ( not ( = ?AUTO_8397 ?AUTO_8396 ) ) ( not ( = ?AUTO_8395 ?AUTO_8396 ) ) ( CALIBRATION_TARGET ?AUTO_8398 ?AUTO_8400 ) ( VISIBLE_FROM ?AUTO_8400 ?AUTO_8396 ) ( not ( = ?AUTO_8392 ?AUTO_8400 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8399 ?AUTO_8398 ?AUTO_8400 ?AUTO_8396 )
      ( GET_IMAGE_DATA ?AUTO_8392 ?AUTO_8393 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8392 ?AUTO_8393 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8401 - OBJECTIVE
      ?AUTO_8402 - MODE
    )
    :vars
    (
      ?AUTO_8404 - LANDER
      ?AUTO_8406 - WAYPOINT
      ?AUTO_8403 - WAYPOINT
      ?AUTO_8409 - ROVER
      ?AUTO_8407 - CAMERA
      ?AUTO_8408 - WAYPOINT
      ?AUTO_8405 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8404 ?AUTO_8406 ) ( VISIBLE ?AUTO_8403 ?AUTO_8406 ) ( AVAILABLE ?AUTO_8409 ) ( CHANNEL_FREE ?AUTO_8404 ) ( not ( = ?AUTO_8403 ?AUTO_8406 ) ) ( CAN_TRAVERSE ?AUTO_8409 ?AUTO_8406 ?AUTO_8403 ) ( VISIBLE ?AUTO_8406 ?AUTO_8403 ) ( ON_BOARD ?AUTO_8407 ?AUTO_8409 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8409 ) ( SUPPORTS ?AUTO_8407 ?AUTO_8402 ) ( VISIBLE_FROM ?AUTO_8401 ?AUTO_8406 ) ( CAN_TRAVERSE ?AUTO_8409 ?AUTO_8403 ?AUTO_8406 ) ( CAN_TRAVERSE ?AUTO_8409 ?AUTO_8408 ?AUTO_8403 ) ( VISIBLE ?AUTO_8408 ?AUTO_8403 ) ( not ( = ?AUTO_8406 ?AUTO_8408 ) ) ( not ( = ?AUTO_8403 ?AUTO_8408 ) ) ( CALIBRATION_TARGET ?AUTO_8407 ?AUTO_8405 ) ( VISIBLE_FROM ?AUTO_8405 ?AUTO_8408 ) ( not ( = ?AUTO_8401 ?AUTO_8405 ) ) ( CAN_TRAVERSE ?AUTO_8409 ?AUTO_8403 ?AUTO_8408 ) ( AT ?AUTO_8409 ?AUTO_8403 ) ( VISIBLE ?AUTO_8403 ?AUTO_8408 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8409 ?AUTO_8403 ?AUTO_8408 )
      ( GET_IMAGE_DATA ?AUTO_8401 ?AUTO_8402 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8401 ?AUTO_8402 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8459 - OBJECTIVE
      ?AUTO_8460 - MODE
    )
    :vars
    (
      ?AUTO_8467 - LANDER
      ?AUTO_8461 - WAYPOINT
      ?AUTO_8464 - WAYPOINT
      ?AUTO_8462 - ROVER
      ?AUTO_8463 - CAMERA
      ?AUTO_8465 - WAYPOINT
      ?AUTO_8466 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8467 ?AUTO_8461 ) ( VISIBLE ?AUTO_8464 ?AUTO_8461 ) ( AVAILABLE ?AUTO_8462 ) ( CHANNEL_FREE ?AUTO_8467 ) ( not ( = ?AUTO_8464 ?AUTO_8461 ) ) ( ON_BOARD ?AUTO_8463 ?AUTO_8462 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8462 ) ( SUPPORTS ?AUTO_8463 ?AUTO_8460 ) ( VISIBLE_FROM ?AUTO_8459 ?AUTO_8464 ) ( CAN_TRAVERSE ?AUTO_8462 ?AUTO_8465 ?AUTO_8464 ) ( VISIBLE ?AUTO_8465 ?AUTO_8464 ) ( not ( = ?AUTO_8461 ?AUTO_8465 ) ) ( not ( = ?AUTO_8464 ?AUTO_8465 ) ) ( CALIBRATION_TARGET ?AUTO_8463 ?AUTO_8466 ) ( VISIBLE_FROM ?AUTO_8466 ?AUTO_8465 ) ( not ( = ?AUTO_8459 ?AUTO_8466 ) ) ( CAN_TRAVERSE ?AUTO_8462 ?AUTO_8464 ?AUTO_8465 ) ( VISIBLE ?AUTO_8464 ?AUTO_8465 ) ( CAN_TRAVERSE ?AUTO_8462 ?AUTO_8461 ?AUTO_8464 ) ( AT ?AUTO_8462 ?AUTO_8461 ) ( VISIBLE ?AUTO_8461 ?AUTO_8464 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8462 ?AUTO_8461 ?AUTO_8464 )
      ( GET_IMAGE_DATA ?AUTO_8459 ?AUTO_8460 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8459 ?AUTO_8460 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8508 - OBJECTIVE
      ?AUTO_8509 - MODE
    )
    :vars
    (
      ?AUTO_8513 - LANDER
      ?AUTO_8510 - WAYPOINT
      ?AUTO_8511 - WAYPOINT
      ?AUTO_8514 - ROVER
      ?AUTO_8515 - CAMERA
      ?AUTO_8512 - WAYPOINT
      ?AUTO_8516 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8513 ?AUTO_8510 ) ( VISIBLE ?AUTO_8511 ?AUTO_8510 ) ( AVAILABLE ?AUTO_8514 ) ( CHANNEL_FREE ?AUTO_8513 ) ( not ( = ?AUTO_8511 ?AUTO_8510 ) ) ( CAN_TRAVERSE ?AUTO_8514 ?AUTO_8510 ?AUTO_8511 ) ( VISIBLE ?AUTO_8510 ?AUTO_8511 ) ( CALIBRATED ?AUTO_8515 ?AUTO_8514 ) ( ON_BOARD ?AUTO_8515 ?AUTO_8514 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8514 ) ( SUPPORTS ?AUTO_8515 ?AUTO_8509 ) ( VISIBLE_FROM ?AUTO_8508 ?AUTO_8510 ) ( CAN_TRAVERSE ?AUTO_8514 ?AUTO_8511 ?AUTO_8510 ) ( CAN_TRAVERSE ?AUTO_8514 ?AUTO_8512 ?AUTO_8511 ) ( VISIBLE ?AUTO_8512 ?AUTO_8511 ) ( not ( = ?AUTO_8510 ?AUTO_8512 ) ) ( not ( = ?AUTO_8511 ?AUTO_8512 ) ) ( CAN_TRAVERSE ?AUTO_8514 ?AUTO_8516 ?AUTO_8512 ) ( AT ?AUTO_8514 ?AUTO_8516 ) ( VISIBLE ?AUTO_8516 ?AUTO_8512 ) ( not ( = ?AUTO_8510 ?AUTO_8516 ) ) ( not ( = ?AUTO_8511 ?AUTO_8516 ) ) ( not ( = ?AUTO_8512 ?AUTO_8516 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8514 ?AUTO_8516 ?AUTO_8512 )
      ( GET_IMAGE_DATA ?AUTO_8508 ?AUTO_8509 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8508 ?AUTO_8509 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8517 - OBJECTIVE
      ?AUTO_8518 - MODE
    )
    :vars
    (
      ?AUTO_8520 - LANDER
      ?AUTO_8519 - WAYPOINT
      ?AUTO_8523 - WAYPOINT
      ?AUTO_8524 - ROVER
      ?AUTO_8525 - CAMERA
      ?AUTO_8521 - WAYPOINT
      ?AUTO_8522 - WAYPOINT
      ?AUTO_8526 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8520 ?AUTO_8519 ) ( VISIBLE ?AUTO_8523 ?AUTO_8519 ) ( AVAILABLE ?AUTO_8524 ) ( CHANNEL_FREE ?AUTO_8520 ) ( not ( = ?AUTO_8523 ?AUTO_8519 ) ) ( CAN_TRAVERSE ?AUTO_8524 ?AUTO_8519 ?AUTO_8523 ) ( VISIBLE ?AUTO_8519 ?AUTO_8523 ) ( ON_BOARD ?AUTO_8525 ?AUTO_8524 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8524 ) ( SUPPORTS ?AUTO_8525 ?AUTO_8518 ) ( VISIBLE_FROM ?AUTO_8517 ?AUTO_8519 ) ( CAN_TRAVERSE ?AUTO_8524 ?AUTO_8523 ?AUTO_8519 ) ( CAN_TRAVERSE ?AUTO_8524 ?AUTO_8521 ?AUTO_8523 ) ( VISIBLE ?AUTO_8521 ?AUTO_8523 ) ( not ( = ?AUTO_8519 ?AUTO_8521 ) ) ( not ( = ?AUTO_8523 ?AUTO_8521 ) ) ( CAN_TRAVERSE ?AUTO_8524 ?AUTO_8522 ?AUTO_8521 ) ( AT ?AUTO_8524 ?AUTO_8522 ) ( VISIBLE ?AUTO_8522 ?AUTO_8521 ) ( not ( = ?AUTO_8519 ?AUTO_8522 ) ) ( not ( = ?AUTO_8523 ?AUTO_8522 ) ) ( not ( = ?AUTO_8521 ?AUTO_8522 ) ) ( CALIBRATION_TARGET ?AUTO_8525 ?AUTO_8526 ) ( VISIBLE_FROM ?AUTO_8526 ?AUTO_8522 ) ( not ( = ?AUTO_8517 ?AUTO_8526 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_8524 ?AUTO_8525 ?AUTO_8526 ?AUTO_8522 )
      ( GET_IMAGE_DATA ?AUTO_8517 ?AUTO_8518 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8517 ?AUTO_8518 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8527 - OBJECTIVE
      ?AUTO_8528 - MODE
    )
    :vars
    (
      ?AUTO_8532 - LANDER
      ?AUTO_8533 - WAYPOINT
      ?AUTO_8530 - WAYPOINT
      ?AUTO_8531 - ROVER
      ?AUTO_8535 - CAMERA
      ?AUTO_8534 - WAYPOINT
      ?AUTO_8529 - WAYPOINT
      ?AUTO_8536 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8532 ?AUTO_8533 ) ( VISIBLE ?AUTO_8530 ?AUTO_8533 ) ( AVAILABLE ?AUTO_8531 ) ( CHANNEL_FREE ?AUTO_8532 ) ( not ( = ?AUTO_8530 ?AUTO_8533 ) ) ( CAN_TRAVERSE ?AUTO_8531 ?AUTO_8533 ?AUTO_8530 ) ( VISIBLE ?AUTO_8533 ?AUTO_8530 ) ( ON_BOARD ?AUTO_8535 ?AUTO_8531 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8531 ) ( SUPPORTS ?AUTO_8535 ?AUTO_8528 ) ( VISIBLE_FROM ?AUTO_8527 ?AUTO_8533 ) ( CAN_TRAVERSE ?AUTO_8531 ?AUTO_8530 ?AUTO_8533 ) ( CAN_TRAVERSE ?AUTO_8531 ?AUTO_8534 ?AUTO_8530 ) ( VISIBLE ?AUTO_8534 ?AUTO_8530 ) ( not ( = ?AUTO_8533 ?AUTO_8534 ) ) ( not ( = ?AUTO_8530 ?AUTO_8534 ) ) ( CAN_TRAVERSE ?AUTO_8531 ?AUTO_8529 ?AUTO_8534 ) ( VISIBLE ?AUTO_8529 ?AUTO_8534 ) ( not ( = ?AUTO_8533 ?AUTO_8529 ) ) ( not ( = ?AUTO_8530 ?AUTO_8529 ) ) ( not ( = ?AUTO_8534 ?AUTO_8529 ) ) ( CALIBRATION_TARGET ?AUTO_8535 ?AUTO_8536 ) ( VISIBLE_FROM ?AUTO_8536 ?AUTO_8529 ) ( not ( = ?AUTO_8527 ?AUTO_8536 ) ) ( CAN_TRAVERSE ?AUTO_8531 ?AUTO_8534 ?AUTO_8529 ) ( AT ?AUTO_8531 ?AUTO_8534 ) ( VISIBLE ?AUTO_8534 ?AUTO_8529 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8531 ?AUTO_8534 ?AUTO_8529 )
      ( GET_IMAGE_DATA ?AUTO_8527 ?AUTO_8528 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8527 ?AUTO_8528 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8767 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8771 - LANDER
      ?AUTO_8769 - WAYPOINT
      ?AUTO_8772 - WAYPOINT
      ?AUTO_8768 - ROVER
      ?AUTO_8773 - STORE
      ?AUTO_8770 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8771 ?AUTO_8769 ) ( VISIBLE ?AUTO_8772 ?AUTO_8769 ) ( AVAILABLE ?AUTO_8768 ) ( CHANNEL_FREE ?AUTO_8771 ) ( not ( = ?AUTO_8767 ?AUTO_8772 ) ) ( not ( = ?AUTO_8767 ?AUTO_8769 ) ) ( not ( = ?AUTO_8772 ?AUTO_8769 ) ) ( CAN_TRAVERSE ?AUTO_8768 ?AUTO_8767 ?AUTO_8772 ) ( VISIBLE ?AUTO_8767 ?AUTO_8772 ) ( AT_SOIL_SAMPLE ?AUTO_8767 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8768 ) ( STORE_OF ?AUTO_8773 ?AUTO_8768 ) ( CAN_TRAVERSE ?AUTO_8768 ?AUTO_8770 ?AUTO_8767 ) ( VISIBLE ?AUTO_8770 ?AUTO_8767 ) ( not ( = ?AUTO_8767 ?AUTO_8770 ) ) ( not ( = ?AUTO_8769 ?AUTO_8770 ) ) ( not ( = ?AUTO_8772 ?AUTO_8770 ) ) ( FULL ?AUTO_8773 ) ( CAN_TRAVERSE ?AUTO_8768 ?AUTO_8772 ?AUTO_8770 ) ( AT ?AUTO_8768 ?AUTO_8772 ) ( VISIBLE ?AUTO_8772 ?AUTO_8770 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8768 ?AUTO_8772 ?AUTO_8770 )
      ( GET_SOIL_DATA ?AUTO_8767 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8767 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8775 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8780 - LANDER
      ?AUTO_8776 - WAYPOINT
      ?AUTO_8777 - WAYPOINT
      ?AUTO_8781 - ROVER
      ?AUTO_8779 - STORE
      ?AUTO_8778 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8780 ?AUTO_8776 ) ( VISIBLE ?AUTO_8777 ?AUTO_8776 ) ( AVAILABLE ?AUTO_8781 ) ( CHANNEL_FREE ?AUTO_8780 ) ( not ( = ?AUTO_8775 ?AUTO_8777 ) ) ( not ( = ?AUTO_8775 ?AUTO_8776 ) ) ( not ( = ?AUTO_8777 ?AUTO_8776 ) ) ( CAN_TRAVERSE ?AUTO_8781 ?AUTO_8775 ?AUTO_8777 ) ( VISIBLE ?AUTO_8775 ?AUTO_8777 ) ( AT_SOIL_SAMPLE ?AUTO_8775 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8781 ) ( STORE_OF ?AUTO_8779 ?AUTO_8781 ) ( CAN_TRAVERSE ?AUTO_8781 ?AUTO_8778 ?AUTO_8775 ) ( VISIBLE ?AUTO_8778 ?AUTO_8775 ) ( not ( = ?AUTO_8775 ?AUTO_8778 ) ) ( not ( = ?AUTO_8776 ?AUTO_8778 ) ) ( not ( = ?AUTO_8777 ?AUTO_8778 ) ) ( FULL ?AUTO_8779 ) ( CAN_TRAVERSE ?AUTO_8781 ?AUTO_8777 ?AUTO_8778 ) ( VISIBLE ?AUTO_8777 ?AUTO_8778 ) ( CAN_TRAVERSE ?AUTO_8781 ?AUTO_8776 ?AUTO_8777 ) ( AT ?AUTO_8781 ?AUTO_8776 ) ( VISIBLE ?AUTO_8776 ?AUTO_8777 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8781 ?AUTO_8776 ?AUTO_8777 )
      ( GET_SOIL_DATA ?AUTO_8775 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8775 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8782 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8783 - LANDER
      ?AUTO_8788 - WAYPOINT
      ?AUTO_8787 - WAYPOINT
      ?AUTO_8785 - ROVER
      ?AUTO_8784 - STORE
      ?AUTO_8786 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8783 ?AUTO_8788 ) ( VISIBLE ?AUTO_8787 ?AUTO_8788 ) ( AVAILABLE ?AUTO_8785 ) ( CHANNEL_FREE ?AUTO_8783 ) ( not ( = ?AUTO_8782 ?AUTO_8787 ) ) ( not ( = ?AUTO_8782 ?AUTO_8788 ) ) ( not ( = ?AUTO_8787 ?AUTO_8788 ) ) ( CAN_TRAVERSE ?AUTO_8785 ?AUTO_8782 ?AUTO_8787 ) ( VISIBLE ?AUTO_8782 ?AUTO_8787 ) ( AT_SOIL_SAMPLE ?AUTO_8782 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8785 ) ( STORE_OF ?AUTO_8784 ?AUTO_8785 ) ( CAN_TRAVERSE ?AUTO_8785 ?AUTO_8786 ?AUTO_8782 ) ( VISIBLE ?AUTO_8786 ?AUTO_8782 ) ( not ( = ?AUTO_8782 ?AUTO_8786 ) ) ( not ( = ?AUTO_8788 ?AUTO_8786 ) ) ( not ( = ?AUTO_8787 ?AUTO_8786 ) ) ( CAN_TRAVERSE ?AUTO_8785 ?AUTO_8787 ?AUTO_8786 ) ( VISIBLE ?AUTO_8787 ?AUTO_8786 ) ( CAN_TRAVERSE ?AUTO_8785 ?AUTO_8788 ?AUTO_8787 ) ( AT ?AUTO_8785 ?AUTO_8788 ) ( VISIBLE ?AUTO_8788 ?AUTO_8787 ) ( AT_SOIL_SAMPLE ?AUTO_8788 ) ( EMPTY ?AUTO_8784 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_8785 ?AUTO_8784 ?AUTO_8788 )
      ( GET_SOIL_DATA ?AUTO_8782 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8782 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8789 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8792 - LANDER
      ?AUTO_8790 - WAYPOINT
      ?AUTO_8795 - WAYPOINT
      ?AUTO_8794 - ROVER
      ?AUTO_8793 - STORE
      ?AUTO_8791 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8792 ?AUTO_8790 ) ( VISIBLE ?AUTO_8795 ?AUTO_8790 ) ( AVAILABLE ?AUTO_8794 ) ( CHANNEL_FREE ?AUTO_8792 ) ( not ( = ?AUTO_8789 ?AUTO_8795 ) ) ( not ( = ?AUTO_8789 ?AUTO_8790 ) ) ( not ( = ?AUTO_8795 ?AUTO_8790 ) ) ( CAN_TRAVERSE ?AUTO_8794 ?AUTO_8789 ?AUTO_8795 ) ( VISIBLE ?AUTO_8789 ?AUTO_8795 ) ( AT_SOIL_SAMPLE ?AUTO_8789 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8794 ) ( STORE_OF ?AUTO_8793 ?AUTO_8794 ) ( CAN_TRAVERSE ?AUTO_8794 ?AUTO_8791 ?AUTO_8789 ) ( VISIBLE ?AUTO_8791 ?AUTO_8789 ) ( not ( = ?AUTO_8789 ?AUTO_8791 ) ) ( not ( = ?AUTO_8790 ?AUTO_8791 ) ) ( not ( = ?AUTO_8795 ?AUTO_8791 ) ) ( CAN_TRAVERSE ?AUTO_8794 ?AUTO_8795 ?AUTO_8791 ) ( VISIBLE ?AUTO_8795 ?AUTO_8791 ) ( CAN_TRAVERSE ?AUTO_8794 ?AUTO_8790 ?AUTO_8795 ) ( VISIBLE ?AUTO_8790 ?AUTO_8795 ) ( AT_SOIL_SAMPLE ?AUTO_8790 ) ( EMPTY ?AUTO_8793 ) ( CAN_TRAVERSE ?AUTO_8794 ?AUTO_8795 ?AUTO_8790 ) ( AT ?AUTO_8794 ?AUTO_8795 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8794 ?AUTO_8795 ?AUTO_8790 )
      ( GET_SOIL_DATA ?AUTO_8789 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8789 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_8809 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8812 - LANDER
      ?AUTO_8813 - WAYPOINT
      ?AUTO_8814 - WAYPOINT
      ?AUTO_8811 - ROVER
      ?AUTO_8810 - STORE
      ?AUTO_8815 - WAYPOINT
      ?AUTO_8816 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8812 ?AUTO_8813 ) ( VISIBLE ?AUTO_8814 ?AUTO_8813 ) ( AVAILABLE ?AUTO_8811 ) ( CHANNEL_FREE ?AUTO_8812 ) ( not ( = ?AUTO_8809 ?AUTO_8814 ) ) ( not ( = ?AUTO_8809 ?AUTO_8813 ) ) ( not ( = ?AUTO_8814 ?AUTO_8813 ) ) ( CAN_TRAVERSE ?AUTO_8811 ?AUTO_8809 ?AUTO_8814 ) ( VISIBLE ?AUTO_8809 ?AUTO_8814 ) ( AT_SOIL_SAMPLE ?AUTO_8809 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8811 ) ( STORE_OF ?AUTO_8810 ?AUTO_8811 ) ( CAN_TRAVERSE ?AUTO_8811 ?AUTO_8815 ?AUTO_8809 ) ( VISIBLE ?AUTO_8815 ?AUTO_8809 ) ( not ( = ?AUTO_8809 ?AUTO_8815 ) ) ( not ( = ?AUTO_8813 ?AUTO_8815 ) ) ( not ( = ?AUTO_8814 ?AUTO_8815 ) ) ( CAN_TRAVERSE ?AUTO_8811 ?AUTO_8814 ?AUTO_8815 ) ( VISIBLE ?AUTO_8814 ?AUTO_8815 ) ( CAN_TRAVERSE ?AUTO_8811 ?AUTO_8813 ?AUTO_8814 ) ( VISIBLE ?AUTO_8813 ?AUTO_8814 ) ( AT_SOIL_SAMPLE ?AUTO_8813 ) ( EMPTY ?AUTO_8810 ) ( CAN_TRAVERSE ?AUTO_8811 ?AUTO_8816 ?AUTO_8813 ) ( AT ?AUTO_8811 ?AUTO_8816 ) ( VISIBLE ?AUTO_8816 ?AUTO_8813 ) ( not ( = ?AUTO_8809 ?AUTO_8816 ) ) ( not ( = ?AUTO_8813 ?AUTO_8816 ) ) ( not ( = ?AUTO_8814 ?AUTO_8816 ) ) ( not ( = ?AUTO_8815 ?AUTO_8816 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8811 ?AUTO_8816 ?AUTO_8813 )
      ( GET_SOIL_DATA ?AUTO_8809 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_8809 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8873 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8874 - LANDER
      ?AUTO_8878 - WAYPOINT
      ?AUTO_8876 - ROVER
      ?AUTO_8875 - STORE
      ?AUTO_8877 - WAYPOINT
      ?AUTO_8879 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8874 ?AUTO_8878 ) ( VISIBLE ?AUTO_8873 ?AUTO_8878 ) ( AVAILABLE ?AUTO_8876 ) ( CHANNEL_FREE ?AUTO_8874 ) ( not ( = ?AUTO_8873 ?AUTO_8878 ) ) ( AT_ROCK_SAMPLE ?AUTO_8873 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8876 ) ( STORE_OF ?AUTO_8875 ?AUTO_8876 ) ( CAN_TRAVERSE ?AUTO_8876 ?AUTO_8877 ?AUTO_8873 ) ( VISIBLE ?AUTO_8877 ?AUTO_8873 ) ( not ( = ?AUTO_8873 ?AUTO_8877 ) ) ( not ( = ?AUTO_8878 ?AUTO_8877 ) ) ( FULL ?AUTO_8875 ) ( CAN_TRAVERSE ?AUTO_8876 ?AUTO_8879 ?AUTO_8877 ) ( VISIBLE ?AUTO_8879 ?AUTO_8877 ) ( not ( = ?AUTO_8873 ?AUTO_8879 ) ) ( not ( = ?AUTO_8878 ?AUTO_8879 ) ) ( not ( = ?AUTO_8877 ?AUTO_8879 ) ) ( CAN_TRAVERSE ?AUTO_8876 ?AUTO_8878 ?AUTO_8879 ) ( AT ?AUTO_8876 ?AUTO_8878 ) ( VISIBLE ?AUTO_8878 ?AUTO_8879 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8876 ?AUTO_8878 ?AUTO_8879 )
      ( GET_ROCK_DATA ?AUTO_8873 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8873 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8880 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8883 - LANDER
      ?AUTO_8884 - WAYPOINT
      ?AUTO_8886 - ROVER
      ?AUTO_8885 - STORE
      ?AUTO_8882 - WAYPOINT
      ?AUTO_8881 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8883 ?AUTO_8884 ) ( VISIBLE ?AUTO_8880 ?AUTO_8884 ) ( AVAILABLE ?AUTO_8886 ) ( CHANNEL_FREE ?AUTO_8883 ) ( not ( = ?AUTO_8880 ?AUTO_8884 ) ) ( AT_ROCK_SAMPLE ?AUTO_8880 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8886 ) ( STORE_OF ?AUTO_8885 ?AUTO_8886 ) ( CAN_TRAVERSE ?AUTO_8886 ?AUTO_8882 ?AUTO_8880 ) ( VISIBLE ?AUTO_8882 ?AUTO_8880 ) ( not ( = ?AUTO_8880 ?AUTO_8882 ) ) ( not ( = ?AUTO_8884 ?AUTO_8882 ) ) ( CAN_TRAVERSE ?AUTO_8886 ?AUTO_8881 ?AUTO_8882 ) ( VISIBLE ?AUTO_8881 ?AUTO_8882 ) ( not ( = ?AUTO_8880 ?AUTO_8881 ) ) ( not ( = ?AUTO_8884 ?AUTO_8881 ) ) ( not ( = ?AUTO_8882 ?AUTO_8881 ) ) ( CAN_TRAVERSE ?AUTO_8886 ?AUTO_8884 ?AUTO_8881 ) ( AT ?AUTO_8886 ?AUTO_8884 ) ( VISIBLE ?AUTO_8884 ?AUTO_8881 ) ( AT_SOIL_SAMPLE ?AUTO_8884 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8886 ) ( EMPTY ?AUTO_8885 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_8886 ?AUTO_8885 ?AUTO_8884 )
      ( GET_ROCK_DATA ?AUTO_8880 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8880 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_8901 - WAYPOINT
    )
    :vars
    (
      ?AUTO_8907 - LANDER
      ?AUTO_8905 - WAYPOINT
      ?AUTO_8902 - ROVER
      ?AUTO_8903 - STORE
      ?AUTO_8904 - WAYPOINT
      ?AUTO_8906 - WAYPOINT
      ?AUTO_8908 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8907 ?AUTO_8905 ) ( VISIBLE ?AUTO_8901 ?AUTO_8905 ) ( AVAILABLE ?AUTO_8902 ) ( CHANNEL_FREE ?AUTO_8907 ) ( not ( = ?AUTO_8901 ?AUTO_8905 ) ) ( AT_ROCK_SAMPLE ?AUTO_8901 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_8902 ) ( STORE_OF ?AUTO_8903 ?AUTO_8902 ) ( CAN_TRAVERSE ?AUTO_8902 ?AUTO_8904 ?AUTO_8901 ) ( VISIBLE ?AUTO_8904 ?AUTO_8901 ) ( not ( = ?AUTO_8901 ?AUTO_8904 ) ) ( not ( = ?AUTO_8905 ?AUTO_8904 ) ) ( CAN_TRAVERSE ?AUTO_8902 ?AUTO_8906 ?AUTO_8904 ) ( VISIBLE ?AUTO_8906 ?AUTO_8904 ) ( not ( = ?AUTO_8901 ?AUTO_8906 ) ) ( not ( = ?AUTO_8905 ?AUTO_8906 ) ) ( not ( = ?AUTO_8904 ?AUTO_8906 ) ) ( CAN_TRAVERSE ?AUTO_8902 ?AUTO_8905 ?AUTO_8906 ) ( VISIBLE ?AUTO_8905 ?AUTO_8906 ) ( AT_SOIL_SAMPLE ?AUTO_8905 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_8902 ) ( EMPTY ?AUTO_8903 ) ( CAN_TRAVERSE ?AUTO_8902 ?AUTO_8908 ?AUTO_8905 ) ( AT ?AUTO_8902 ?AUTO_8908 ) ( VISIBLE ?AUTO_8908 ?AUTO_8905 ) ( not ( = ?AUTO_8901 ?AUTO_8908 ) ) ( not ( = ?AUTO_8905 ?AUTO_8908 ) ) ( not ( = ?AUTO_8904 ?AUTO_8908 ) ) ( not ( = ?AUTO_8906 ?AUTO_8908 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8902 ?AUTO_8908 ?AUTO_8905 )
      ( GET_ROCK_DATA ?AUTO_8901 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_8901 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_8948 - OBJECTIVE
      ?AUTO_8949 - MODE
    )
    :vars
    (
      ?AUTO_8954 - LANDER
      ?AUTO_8955 - WAYPOINT
      ?AUTO_8952 - WAYPOINT
      ?AUTO_8956 - ROVER
      ?AUTO_8953 - CAMERA
      ?AUTO_8950 - WAYPOINT
      ?AUTO_8951 - WAYPOINT
      ?AUTO_8957 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_8954 ?AUTO_8955 ) ( VISIBLE ?AUTO_8952 ?AUTO_8955 ) ( AVAILABLE ?AUTO_8956 ) ( CHANNEL_FREE ?AUTO_8954 ) ( not ( = ?AUTO_8952 ?AUTO_8955 ) ) ( ON_BOARD ?AUTO_8953 ?AUTO_8956 ) ( EQUIPPED_FOR_IMAGING ?AUTO_8956 ) ( SUPPORTS ?AUTO_8953 ?AUTO_8949 ) ( VISIBLE_FROM ?AUTO_8948 ?AUTO_8952 ) ( CALIBRATION_TARGET ?AUTO_8953 ?AUTO_8948 ) ( CAN_TRAVERSE ?AUTO_8956 ?AUTO_8950 ?AUTO_8952 ) ( VISIBLE ?AUTO_8950 ?AUTO_8952 ) ( not ( = ?AUTO_8955 ?AUTO_8950 ) ) ( not ( = ?AUTO_8952 ?AUTO_8950 ) ) ( CAN_TRAVERSE ?AUTO_8956 ?AUTO_8951 ?AUTO_8950 ) ( VISIBLE ?AUTO_8951 ?AUTO_8950 ) ( not ( = ?AUTO_8955 ?AUTO_8951 ) ) ( not ( = ?AUTO_8952 ?AUTO_8951 ) ) ( not ( = ?AUTO_8950 ?AUTO_8951 ) ) ( CAN_TRAVERSE ?AUTO_8956 ?AUTO_8957 ?AUTO_8951 ) ( AT ?AUTO_8956 ?AUTO_8957 ) ( VISIBLE ?AUTO_8957 ?AUTO_8951 ) ( not ( = ?AUTO_8955 ?AUTO_8957 ) ) ( not ( = ?AUTO_8952 ?AUTO_8957 ) ) ( not ( = ?AUTO_8950 ?AUTO_8957 ) ) ( not ( = ?AUTO_8951 ?AUTO_8957 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_8956 ?AUTO_8957 ?AUTO_8951 )
      ( GET_IMAGE_DATA ?AUTO_8948 ?AUTO_8949 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_8948 ?AUTO_8949 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9094 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9096 - LANDER
      ?AUTO_9098 - WAYPOINT
      ?AUTO_9095 - WAYPOINT
      ?AUTO_9099 - ROVER
      ?AUTO_9100 - WAYPOINT
      ?AUTO_9097 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9096 ?AUTO_9098 ) ( VISIBLE ?AUTO_9095 ?AUTO_9098 ) ( AVAILABLE ?AUTO_9099 ) ( CHANNEL_FREE ?AUTO_9096 ) ( not ( = ?AUTO_9094 ?AUTO_9095 ) ) ( not ( = ?AUTO_9094 ?AUTO_9098 ) ) ( not ( = ?AUTO_9095 ?AUTO_9098 ) ) ( CAN_TRAVERSE ?AUTO_9099 ?AUTO_9100 ?AUTO_9095 ) ( VISIBLE ?AUTO_9100 ?AUTO_9095 ) ( not ( = ?AUTO_9094 ?AUTO_9100 ) ) ( not ( = ?AUTO_9098 ?AUTO_9100 ) ) ( not ( = ?AUTO_9095 ?AUTO_9100 ) ) ( CAN_TRAVERSE ?AUTO_9099 ?AUTO_9094 ?AUTO_9100 ) ( VISIBLE ?AUTO_9094 ?AUTO_9100 ) ( AT_SOIL_SAMPLE ?AUTO_9094 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9099 ) ( STORE_OF ?AUTO_9097 ?AUTO_9099 ) ( CAN_TRAVERSE ?AUTO_9099 ?AUTO_9100 ?AUTO_9094 ) ( VISIBLE ?AUTO_9100 ?AUTO_9094 ) ( CAN_TRAVERSE ?AUTO_9099 ?AUTO_9095 ?AUTO_9100 ) ( VISIBLE ?AUTO_9095 ?AUTO_9100 ) ( FULL ?AUTO_9097 ) ( CAN_TRAVERSE ?AUTO_9099 ?AUTO_9098 ?AUTO_9095 ) ( AT ?AUTO_9099 ?AUTO_9098 ) ( VISIBLE ?AUTO_9098 ?AUTO_9095 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9099 ?AUTO_9098 ?AUTO_9095 )
      ( GET_SOIL_DATA ?AUTO_9094 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9094 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9101 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9105 - LANDER
      ?AUTO_9107 - WAYPOINT
      ?AUTO_9106 - WAYPOINT
      ?AUTO_9103 - ROVER
      ?AUTO_9102 - WAYPOINT
      ?AUTO_9104 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9105 ?AUTO_9107 ) ( VISIBLE ?AUTO_9106 ?AUTO_9107 ) ( AVAILABLE ?AUTO_9103 ) ( CHANNEL_FREE ?AUTO_9105 ) ( not ( = ?AUTO_9101 ?AUTO_9106 ) ) ( not ( = ?AUTO_9101 ?AUTO_9107 ) ) ( not ( = ?AUTO_9106 ?AUTO_9107 ) ) ( CAN_TRAVERSE ?AUTO_9103 ?AUTO_9102 ?AUTO_9106 ) ( VISIBLE ?AUTO_9102 ?AUTO_9106 ) ( not ( = ?AUTO_9101 ?AUTO_9102 ) ) ( not ( = ?AUTO_9107 ?AUTO_9102 ) ) ( not ( = ?AUTO_9106 ?AUTO_9102 ) ) ( CAN_TRAVERSE ?AUTO_9103 ?AUTO_9101 ?AUTO_9102 ) ( VISIBLE ?AUTO_9101 ?AUTO_9102 ) ( AT_SOIL_SAMPLE ?AUTO_9101 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9103 ) ( STORE_OF ?AUTO_9104 ?AUTO_9103 ) ( CAN_TRAVERSE ?AUTO_9103 ?AUTO_9102 ?AUTO_9101 ) ( VISIBLE ?AUTO_9102 ?AUTO_9101 ) ( CAN_TRAVERSE ?AUTO_9103 ?AUTO_9106 ?AUTO_9102 ) ( VISIBLE ?AUTO_9106 ?AUTO_9102 ) ( CAN_TRAVERSE ?AUTO_9103 ?AUTO_9107 ?AUTO_9106 ) ( AT ?AUTO_9103 ?AUTO_9107 ) ( VISIBLE ?AUTO_9107 ?AUTO_9106 ) ( AT_SOIL_SAMPLE ?AUTO_9107 ) ( EMPTY ?AUTO_9104 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9103 ?AUTO_9104 ?AUTO_9107 )
      ( GET_SOIL_DATA ?AUTO_9101 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9101 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9108 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9111 - LANDER
      ?AUTO_9110 - WAYPOINT
      ?AUTO_9114 - WAYPOINT
      ?AUTO_9112 - ROVER
      ?AUTO_9109 - WAYPOINT
      ?AUTO_9113 - STORE
      ?AUTO_9115 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9111 ?AUTO_9110 ) ( VISIBLE ?AUTO_9114 ?AUTO_9110 ) ( AVAILABLE ?AUTO_9112 ) ( CHANNEL_FREE ?AUTO_9111 ) ( not ( = ?AUTO_9108 ?AUTO_9114 ) ) ( not ( = ?AUTO_9108 ?AUTO_9110 ) ) ( not ( = ?AUTO_9114 ?AUTO_9110 ) ) ( CAN_TRAVERSE ?AUTO_9112 ?AUTO_9109 ?AUTO_9114 ) ( VISIBLE ?AUTO_9109 ?AUTO_9114 ) ( not ( = ?AUTO_9108 ?AUTO_9109 ) ) ( not ( = ?AUTO_9110 ?AUTO_9109 ) ) ( not ( = ?AUTO_9114 ?AUTO_9109 ) ) ( CAN_TRAVERSE ?AUTO_9112 ?AUTO_9108 ?AUTO_9109 ) ( VISIBLE ?AUTO_9108 ?AUTO_9109 ) ( AT_SOIL_SAMPLE ?AUTO_9108 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9112 ) ( STORE_OF ?AUTO_9113 ?AUTO_9112 ) ( CAN_TRAVERSE ?AUTO_9112 ?AUTO_9109 ?AUTO_9108 ) ( VISIBLE ?AUTO_9109 ?AUTO_9108 ) ( CAN_TRAVERSE ?AUTO_9112 ?AUTO_9114 ?AUTO_9109 ) ( VISIBLE ?AUTO_9114 ?AUTO_9109 ) ( CAN_TRAVERSE ?AUTO_9112 ?AUTO_9110 ?AUTO_9114 ) ( VISIBLE ?AUTO_9110 ?AUTO_9114 ) ( AT_SOIL_SAMPLE ?AUTO_9110 ) ( EMPTY ?AUTO_9113 ) ( CAN_TRAVERSE ?AUTO_9112 ?AUTO_9115 ?AUTO_9110 ) ( AT ?AUTO_9112 ?AUTO_9115 ) ( VISIBLE ?AUTO_9115 ?AUTO_9110 ) ( not ( = ?AUTO_9108 ?AUTO_9115 ) ) ( not ( = ?AUTO_9110 ?AUTO_9115 ) ) ( not ( = ?AUTO_9114 ?AUTO_9115 ) ) ( not ( = ?AUTO_9109 ?AUTO_9115 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9112 ?AUTO_9115 ?AUTO_9110 )
      ( GET_SOIL_DATA ?AUTO_9108 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9108 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9116 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9123 - LANDER
      ?AUTO_9117 - WAYPOINT
      ?AUTO_9120 - WAYPOINT
      ?AUTO_9121 - ROVER
      ?AUTO_9119 - WAYPOINT
      ?AUTO_9118 - STORE
      ?AUTO_9122 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9123 ?AUTO_9117 ) ( VISIBLE ?AUTO_9120 ?AUTO_9117 ) ( AVAILABLE ?AUTO_9121 ) ( CHANNEL_FREE ?AUTO_9123 ) ( not ( = ?AUTO_9116 ?AUTO_9120 ) ) ( not ( = ?AUTO_9116 ?AUTO_9117 ) ) ( not ( = ?AUTO_9120 ?AUTO_9117 ) ) ( CAN_TRAVERSE ?AUTO_9121 ?AUTO_9119 ?AUTO_9120 ) ( VISIBLE ?AUTO_9119 ?AUTO_9120 ) ( not ( = ?AUTO_9116 ?AUTO_9119 ) ) ( not ( = ?AUTO_9117 ?AUTO_9119 ) ) ( not ( = ?AUTO_9120 ?AUTO_9119 ) ) ( CAN_TRAVERSE ?AUTO_9121 ?AUTO_9116 ?AUTO_9119 ) ( VISIBLE ?AUTO_9116 ?AUTO_9119 ) ( AT_SOIL_SAMPLE ?AUTO_9116 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9121 ) ( STORE_OF ?AUTO_9118 ?AUTO_9121 ) ( CAN_TRAVERSE ?AUTO_9121 ?AUTO_9119 ?AUTO_9116 ) ( VISIBLE ?AUTO_9119 ?AUTO_9116 ) ( CAN_TRAVERSE ?AUTO_9121 ?AUTO_9120 ?AUTO_9119 ) ( VISIBLE ?AUTO_9120 ?AUTO_9119 ) ( CAN_TRAVERSE ?AUTO_9121 ?AUTO_9117 ?AUTO_9120 ) ( VISIBLE ?AUTO_9117 ?AUTO_9120 ) ( AT_SOIL_SAMPLE ?AUTO_9117 ) ( CAN_TRAVERSE ?AUTO_9121 ?AUTO_9122 ?AUTO_9117 ) ( AT ?AUTO_9121 ?AUTO_9122 ) ( VISIBLE ?AUTO_9122 ?AUTO_9117 ) ( not ( = ?AUTO_9116 ?AUTO_9122 ) ) ( not ( = ?AUTO_9117 ?AUTO_9122 ) ) ( not ( = ?AUTO_9120 ?AUTO_9122 ) ) ( not ( = ?AUTO_9119 ?AUTO_9122 ) ) ( FULL ?AUTO_9118 ) )
    :subtasks
    ( ( !DROP ?AUTO_9121 ?AUTO_9118 )
      ( GET_SOIL_DATA ?AUTO_9116 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9116 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9126 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9129 - LANDER
      ?AUTO_9128 - WAYPOINT
      ?AUTO_9131 - WAYPOINT
      ?AUTO_9132 - ROVER
      ?AUTO_9133 - WAYPOINT
      ?AUTO_9127 - STORE
      ?AUTO_9130 - WAYPOINT
      ?AUTO_9134 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9129 ?AUTO_9128 ) ( VISIBLE ?AUTO_9131 ?AUTO_9128 ) ( AVAILABLE ?AUTO_9132 ) ( CHANNEL_FREE ?AUTO_9129 ) ( not ( = ?AUTO_9126 ?AUTO_9131 ) ) ( not ( = ?AUTO_9126 ?AUTO_9128 ) ) ( not ( = ?AUTO_9131 ?AUTO_9128 ) ) ( CAN_TRAVERSE ?AUTO_9132 ?AUTO_9133 ?AUTO_9131 ) ( VISIBLE ?AUTO_9133 ?AUTO_9131 ) ( not ( = ?AUTO_9126 ?AUTO_9133 ) ) ( not ( = ?AUTO_9128 ?AUTO_9133 ) ) ( not ( = ?AUTO_9131 ?AUTO_9133 ) ) ( CAN_TRAVERSE ?AUTO_9132 ?AUTO_9126 ?AUTO_9133 ) ( VISIBLE ?AUTO_9126 ?AUTO_9133 ) ( AT_SOIL_SAMPLE ?AUTO_9126 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9132 ) ( STORE_OF ?AUTO_9127 ?AUTO_9132 ) ( CAN_TRAVERSE ?AUTO_9132 ?AUTO_9133 ?AUTO_9126 ) ( VISIBLE ?AUTO_9133 ?AUTO_9126 ) ( CAN_TRAVERSE ?AUTO_9132 ?AUTO_9131 ?AUTO_9133 ) ( VISIBLE ?AUTO_9131 ?AUTO_9133 ) ( CAN_TRAVERSE ?AUTO_9132 ?AUTO_9128 ?AUTO_9131 ) ( VISIBLE ?AUTO_9128 ?AUTO_9131 ) ( AT_SOIL_SAMPLE ?AUTO_9128 ) ( EMPTY ?AUTO_9127 ) ( CAN_TRAVERSE ?AUTO_9132 ?AUTO_9130 ?AUTO_9128 ) ( VISIBLE ?AUTO_9130 ?AUTO_9128 ) ( not ( = ?AUTO_9126 ?AUTO_9130 ) ) ( not ( = ?AUTO_9128 ?AUTO_9130 ) ) ( not ( = ?AUTO_9131 ?AUTO_9130 ) ) ( not ( = ?AUTO_9133 ?AUTO_9130 ) ) ( CAN_TRAVERSE ?AUTO_9132 ?AUTO_9134 ?AUTO_9130 ) ( AT ?AUTO_9132 ?AUTO_9134 ) ( VISIBLE ?AUTO_9134 ?AUTO_9130 ) ( not ( = ?AUTO_9126 ?AUTO_9134 ) ) ( not ( = ?AUTO_9128 ?AUTO_9134 ) ) ( not ( = ?AUTO_9131 ?AUTO_9134 ) ) ( not ( = ?AUTO_9133 ?AUTO_9134 ) ) ( not ( = ?AUTO_9130 ?AUTO_9134 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9132 ?AUTO_9134 ?AUTO_9130 )
      ( GET_SOIL_DATA ?AUTO_9126 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9126 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9157 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9161 - LANDER
      ?AUTO_9159 - WAYPOINT
      ?AUTO_9158 - ROVER
      ?AUTO_9160 - WAYPOINT
      ?AUTO_9162 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9161 ?AUTO_9159 ) ( HAVE_SOIL_ANALYSIS ?AUTO_9158 ?AUTO_9157 ) ( VISIBLE ?AUTO_9160 ?AUTO_9159 ) ( AVAILABLE ?AUTO_9158 ) ( CHANNEL_FREE ?AUTO_9161 ) ( not ( = ?AUTO_9157 ?AUTO_9160 ) ) ( not ( = ?AUTO_9157 ?AUTO_9159 ) ) ( not ( = ?AUTO_9160 ?AUTO_9159 ) ) ( CAN_TRAVERSE ?AUTO_9158 ?AUTO_9157 ?AUTO_9160 ) ( VISIBLE ?AUTO_9157 ?AUTO_9160 ) ( CAN_TRAVERSE ?AUTO_9158 ?AUTO_9162 ?AUTO_9157 ) ( AT ?AUTO_9158 ?AUTO_9162 ) ( VISIBLE ?AUTO_9162 ?AUTO_9157 ) ( not ( = ?AUTO_9157 ?AUTO_9162 ) ) ( not ( = ?AUTO_9159 ?AUTO_9162 ) ) ( not ( = ?AUTO_9160 ?AUTO_9162 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9158 ?AUTO_9162 ?AUTO_9157 )
      ( GET_SOIL_DATA ?AUTO_9157 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9157 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9185 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9189 - LANDER
      ?AUTO_9187 - WAYPOINT
      ?AUTO_9188 - WAYPOINT
      ?AUTO_9186 - ROVER
      ?AUTO_9190 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9189 ?AUTO_9187 ) ( VISIBLE ?AUTO_9188 ?AUTO_9187 ) ( AVAILABLE ?AUTO_9186 ) ( CHANNEL_FREE ?AUTO_9189 ) ( not ( = ?AUTO_9185 ?AUTO_9188 ) ) ( not ( = ?AUTO_9185 ?AUTO_9187 ) ) ( not ( = ?AUTO_9188 ?AUTO_9187 ) ) ( CAN_TRAVERSE ?AUTO_9186 ?AUTO_9185 ?AUTO_9188 ) ( VISIBLE ?AUTO_9185 ?AUTO_9188 ) ( AT_SOIL_SAMPLE ?AUTO_9185 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9186 ) ( STORE_OF ?AUTO_9190 ?AUTO_9186 ) ( CAN_TRAVERSE ?AUTO_9186 ?AUTO_9188 ?AUTO_9185 ) ( VISIBLE ?AUTO_9188 ?AUTO_9185 ) ( FULL ?AUTO_9190 ) ( CAN_TRAVERSE ?AUTO_9186 ?AUTO_9187 ?AUTO_9188 ) ( AT ?AUTO_9186 ?AUTO_9187 ) ( VISIBLE ?AUTO_9187 ?AUTO_9188 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9186 ?AUTO_9187 ?AUTO_9188 )
      ( GET_SOIL_DATA ?AUTO_9185 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9185 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9191 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9192 - LANDER
      ?AUTO_9196 - WAYPOINT
      ?AUTO_9195 - WAYPOINT
      ?AUTO_9193 - ROVER
      ?AUTO_9194 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9192 ?AUTO_9196 ) ( VISIBLE ?AUTO_9195 ?AUTO_9196 ) ( AVAILABLE ?AUTO_9193 ) ( CHANNEL_FREE ?AUTO_9192 ) ( not ( = ?AUTO_9191 ?AUTO_9195 ) ) ( not ( = ?AUTO_9191 ?AUTO_9196 ) ) ( not ( = ?AUTO_9195 ?AUTO_9196 ) ) ( CAN_TRAVERSE ?AUTO_9193 ?AUTO_9191 ?AUTO_9195 ) ( VISIBLE ?AUTO_9191 ?AUTO_9195 ) ( AT_SOIL_SAMPLE ?AUTO_9191 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9193 ) ( STORE_OF ?AUTO_9194 ?AUTO_9193 ) ( CAN_TRAVERSE ?AUTO_9193 ?AUTO_9195 ?AUTO_9191 ) ( VISIBLE ?AUTO_9195 ?AUTO_9191 ) ( CAN_TRAVERSE ?AUTO_9193 ?AUTO_9196 ?AUTO_9195 ) ( AT ?AUTO_9193 ?AUTO_9196 ) ( VISIBLE ?AUTO_9196 ?AUTO_9195 ) ( AT_SOIL_SAMPLE ?AUTO_9196 ) ( EMPTY ?AUTO_9194 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9193 ?AUTO_9194 ?AUTO_9196 )
      ( GET_SOIL_DATA ?AUTO_9191 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9191 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11028 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11032 - LANDER
      ?AUTO_11030 - WAYPOINT
      ?AUTO_11029 - WAYPOINT
      ?AUTO_11031 - ROVER
      ?AUTO_11033 - STORE
      ?AUTO_11034 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11032 ?AUTO_11030 ) ( VISIBLE ?AUTO_11029 ?AUTO_11030 ) ( AVAILABLE ?AUTO_11031 ) ( CHANNEL_FREE ?AUTO_11032 ) ( not ( = ?AUTO_11028 ?AUTO_11029 ) ) ( not ( = ?AUTO_11028 ?AUTO_11030 ) ) ( not ( = ?AUTO_11029 ?AUTO_11030 ) ) ( CAN_TRAVERSE ?AUTO_11031 ?AUTO_11028 ?AUTO_11029 ) ( VISIBLE ?AUTO_11028 ?AUTO_11029 ) ( AT_SOIL_SAMPLE ?AUTO_11028 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11031 ) ( STORE_OF ?AUTO_11033 ?AUTO_11031 ) ( EMPTY ?AUTO_11033 ) ( CAN_TRAVERSE ?AUTO_11031 ?AUTO_11029 ?AUTO_11028 ) ( VISIBLE ?AUTO_11029 ?AUTO_11028 ) ( CAN_TRAVERSE ?AUTO_11031 ?AUTO_11030 ?AUTO_11029 ) ( VISIBLE ?AUTO_11030 ?AUTO_11029 ) ( CAN_TRAVERSE ?AUTO_11031 ?AUTO_11034 ?AUTO_11030 ) ( AT ?AUTO_11031 ?AUTO_11034 ) ( VISIBLE ?AUTO_11034 ?AUTO_11030 ) ( not ( = ?AUTO_11028 ?AUTO_11034 ) ) ( not ( = ?AUTO_11030 ?AUTO_11034 ) ) ( not ( = ?AUTO_11029 ?AUTO_11034 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11031 ?AUTO_11034 ?AUTO_11030 )
      ( GET_SOIL_DATA ?AUTO_11028 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11028 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9204 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9206 - LANDER
      ?AUTO_9207 - WAYPOINT
      ?AUTO_9209 - WAYPOINT
      ?AUTO_9210 - ROVER
      ?AUTO_9205 - STORE
      ?AUTO_9208 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9206 ?AUTO_9207 ) ( VISIBLE ?AUTO_9209 ?AUTO_9207 ) ( AVAILABLE ?AUTO_9210 ) ( CHANNEL_FREE ?AUTO_9206 ) ( not ( = ?AUTO_9204 ?AUTO_9209 ) ) ( not ( = ?AUTO_9204 ?AUTO_9207 ) ) ( not ( = ?AUTO_9209 ?AUTO_9207 ) ) ( CAN_TRAVERSE ?AUTO_9210 ?AUTO_9204 ?AUTO_9209 ) ( VISIBLE ?AUTO_9204 ?AUTO_9209 ) ( AT_SOIL_SAMPLE ?AUTO_9204 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9210 ) ( STORE_OF ?AUTO_9205 ?AUTO_9210 ) ( CAN_TRAVERSE ?AUTO_9210 ?AUTO_9209 ?AUTO_9204 ) ( VISIBLE ?AUTO_9209 ?AUTO_9204 ) ( CAN_TRAVERSE ?AUTO_9210 ?AUTO_9207 ?AUTO_9209 ) ( VISIBLE ?AUTO_9207 ?AUTO_9209 ) ( AT_SOIL_SAMPLE ?AUTO_9207 ) ( CAN_TRAVERSE ?AUTO_9210 ?AUTO_9208 ?AUTO_9207 ) ( AT ?AUTO_9210 ?AUTO_9208 ) ( VISIBLE ?AUTO_9208 ?AUTO_9207 ) ( not ( = ?AUTO_9204 ?AUTO_9208 ) ) ( not ( = ?AUTO_9207 ?AUTO_9208 ) ) ( not ( = ?AUTO_9209 ?AUTO_9208 ) ) ( FULL ?AUTO_9205 ) )
    :subtasks
    ( ( !DROP ?AUTO_9210 ?AUTO_9205 )
      ( GET_SOIL_DATA ?AUTO_9204 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9204 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9213 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9215 - LANDER
      ?AUTO_9217 - WAYPOINT
      ?AUTO_9219 - WAYPOINT
      ?AUTO_9214 - ROVER
      ?AUTO_9218 - STORE
      ?AUTO_9216 - WAYPOINT
      ?AUTO_9220 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9215 ?AUTO_9217 ) ( VISIBLE ?AUTO_9219 ?AUTO_9217 ) ( AVAILABLE ?AUTO_9214 ) ( CHANNEL_FREE ?AUTO_9215 ) ( not ( = ?AUTO_9213 ?AUTO_9219 ) ) ( not ( = ?AUTO_9213 ?AUTO_9217 ) ) ( not ( = ?AUTO_9219 ?AUTO_9217 ) ) ( CAN_TRAVERSE ?AUTO_9214 ?AUTO_9213 ?AUTO_9219 ) ( VISIBLE ?AUTO_9213 ?AUTO_9219 ) ( AT_SOIL_SAMPLE ?AUTO_9213 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9214 ) ( STORE_OF ?AUTO_9218 ?AUTO_9214 ) ( CAN_TRAVERSE ?AUTO_9214 ?AUTO_9219 ?AUTO_9213 ) ( VISIBLE ?AUTO_9219 ?AUTO_9213 ) ( CAN_TRAVERSE ?AUTO_9214 ?AUTO_9217 ?AUTO_9219 ) ( VISIBLE ?AUTO_9217 ?AUTO_9219 ) ( AT_SOIL_SAMPLE ?AUTO_9217 ) ( EMPTY ?AUTO_9218 ) ( CAN_TRAVERSE ?AUTO_9214 ?AUTO_9216 ?AUTO_9217 ) ( VISIBLE ?AUTO_9216 ?AUTO_9217 ) ( not ( = ?AUTO_9213 ?AUTO_9216 ) ) ( not ( = ?AUTO_9217 ?AUTO_9216 ) ) ( not ( = ?AUTO_9219 ?AUTO_9216 ) ) ( CAN_TRAVERSE ?AUTO_9214 ?AUTO_9220 ?AUTO_9216 ) ( AT ?AUTO_9214 ?AUTO_9220 ) ( VISIBLE ?AUTO_9220 ?AUTO_9216 ) ( not ( = ?AUTO_9213 ?AUTO_9220 ) ) ( not ( = ?AUTO_9217 ?AUTO_9220 ) ) ( not ( = ?AUTO_9219 ?AUTO_9220 ) ) ( not ( = ?AUTO_9216 ?AUTO_9220 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9214 ?AUTO_9220 ?AUTO_9216 )
      ( GET_SOIL_DATA ?AUTO_9213 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9213 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9345 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9349 - LANDER
      ?AUTO_9351 - WAYPOINT
      ?AUTO_9346 - WAYPOINT
      ?AUTO_9350 - ROVER
      ?AUTO_9348 - WAYPOINT
      ?AUTO_9347 - STORE
      ?AUTO_9352 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9349 ?AUTO_9351 ) ( VISIBLE ?AUTO_9346 ?AUTO_9351 ) ( AVAILABLE ?AUTO_9350 ) ( CHANNEL_FREE ?AUTO_9349 ) ( not ( = ?AUTO_9345 ?AUTO_9346 ) ) ( not ( = ?AUTO_9345 ?AUTO_9351 ) ) ( not ( = ?AUTO_9346 ?AUTO_9351 ) ) ( CAN_TRAVERSE ?AUTO_9350 ?AUTO_9348 ?AUTO_9346 ) ( VISIBLE ?AUTO_9348 ?AUTO_9346 ) ( not ( = ?AUTO_9345 ?AUTO_9348 ) ) ( not ( = ?AUTO_9351 ?AUTO_9348 ) ) ( not ( = ?AUTO_9346 ?AUTO_9348 ) ) ( CAN_TRAVERSE ?AUTO_9350 ?AUTO_9345 ?AUTO_9348 ) ( VISIBLE ?AUTO_9345 ?AUTO_9348 ) ( AT_ROCK_SAMPLE ?AUTO_9345 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9350 ) ( STORE_OF ?AUTO_9347 ?AUTO_9350 ) ( EMPTY ?AUTO_9347 ) ( CAN_TRAVERSE ?AUTO_9350 ?AUTO_9346 ?AUTO_9345 ) ( VISIBLE ?AUTO_9346 ?AUTO_9345 ) ( CAN_TRAVERSE ?AUTO_9350 ?AUTO_9352 ?AUTO_9348 ) ( AT ?AUTO_9350 ?AUTO_9352 ) ( VISIBLE ?AUTO_9352 ?AUTO_9348 ) ( not ( = ?AUTO_9345 ?AUTO_9352 ) ) ( not ( = ?AUTO_9351 ?AUTO_9352 ) ) ( not ( = ?AUTO_9346 ?AUTO_9352 ) ) ( not ( = ?AUTO_9348 ?AUTO_9352 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9350 ?AUTO_9352 ?AUTO_9348 )
      ( GET_ROCK_DATA ?AUTO_9345 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9345 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9414 - OBJECTIVE
      ?AUTO_9413 - MODE
    )
    :vars
    (
      ?AUTO_9418 - LANDER
      ?AUTO_9417 - WAYPOINT
      ?AUTO_9415 - WAYPOINT
      ?AUTO_9420 - ROVER
      ?AUTO_9419 - CAMERA
      ?AUTO_9416 - WAYPOINT
      ?AUTO_9421 - WAYPOINT
      ?AUTO_9422 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9418 ?AUTO_9417 ) ( VISIBLE ?AUTO_9415 ?AUTO_9417 ) ( AVAILABLE ?AUTO_9420 ) ( CHANNEL_FREE ?AUTO_9418 ) ( not ( = ?AUTO_9415 ?AUTO_9417 ) ) ( CALIBRATED ?AUTO_9419 ?AUTO_9420 ) ( ON_BOARD ?AUTO_9419 ?AUTO_9420 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9420 ) ( SUPPORTS ?AUTO_9419 ?AUTO_9413 ) ( VISIBLE_FROM ?AUTO_9414 ?AUTO_9415 ) ( CAN_TRAVERSE ?AUTO_9420 ?AUTO_9416 ?AUTO_9415 ) ( VISIBLE ?AUTO_9416 ?AUTO_9415 ) ( not ( = ?AUTO_9417 ?AUTO_9416 ) ) ( not ( = ?AUTO_9415 ?AUTO_9416 ) ) ( CAN_TRAVERSE ?AUTO_9420 ?AUTO_9421 ?AUTO_9416 ) ( VISIBLE ?AUTO_9421 ?AUTO_9416 ) ( not ( = ?AUTO_9417 ?AUTO_9421 ) ) ( not ( = ?AUTO_9415 ?AUTO_9421 ) ) ( not ( = ?AUTO_9416 ?AUTO_9421 ) ) ( CAN_TRAVERSE ?AUTO_9420 ?AUTO_9422 ?AUTO_9421 ) ( AT ?AUTO_9420 ?AUTO_9422 ) ( VISIBLE ?AUTO_9422 ?AUTO_9421 ) ( not ( = ?AUTO_9417 ?AUTO_9422 ) ) ( not ( = ?AUTO_9415 ?AUTO_9422 ) ) ( not ( = ?AUTO_9416 ?AUTO_9422 ) ) ( not ( = ?AUTO_9421 ?AUTO_9422 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9420 ?AUTO_9422 ?AUTO_9421 )
      ( GET_IMAGE_DATA ?AUTO_9414 ?AUTO_9413 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9414 ?AUTO_9413 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9424 - OBJECTIVE
      ?AUTO_9423 - MODE
    )
    :vars
    (
      ?AUTO_9428 - LANDER
      ?AUTO_9427 - WAYPOINT
      ?AUTO_9431 - WAYPOINT
      ?AUTO_9426 - ROVER
      ?AUTO_9429 - CAMERA
      ?AUTO_9425 - WAYPOINT
      ?AUTO_9430 - WAYPOINT
      ?AUTO_9432 - WAYPOINT
      ?AUTO_9433 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9428 ?AUTO_9427 ) ( VISIBLE ?AUTO_9431 ?AUTO_9427 ) ( AVAILABLE ?AUTO_9426 ) ( CHANNEL_FREE ?AUTO_9428 ) ( not ( = ?AUTO_9431 ?AUTO_9427 ) ) ( ON_BOARD ?AUTO_9429 ?AUTO_9426 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9426 ) ( SUPPORTS ?AUTO_9429 ?AUTO_9423 ) ( VISIBLE_FROM ?AUTO_9424 ?AUTO_9431 ) ( CAN_TRAVERSE ?AUTO_9426 ?AUTO_9425 ?AUTO_9431 ) ( VISIBLE ?AUTO_9425 ?AUTO_9431 ) ( not ( = ?AUTO_9427 ?AUTO_9425 ) ) ( not ( = ?AUTO_9431 ?AUTO_9425 ) ) ( CAN_TRAVERSE ?AUTO_9426 ?AUTO_9430 ?AUTO_9425 ) ( VISIBLE ?AUTO_9430 ?AUTO_9425 ) ( not ( = ?AUTO_9427 ?AUTO_9430 ) ) ( not ( = ?AUTO_9431 ?AUTO_9430 ) ) ( not ( = ?AUTO_9425 ?AUTO_9430 ) ) ( CAN_TRAVERSE ?AUTO_9426 ?AUTO_9432 ?AUTO_9430 ) ( AT ?AUTO_9426 ?AUTO_9432 ) ( VISIBLE ?AUTO_9432 ?AUTO_9430 ) ( not ( = ?AUTO_9427 ?AUTO_9432 ) ) ( not ( = ?AUTO_9431 ?AUTO_9432 ) ) ( not ( = ?AUTO_9425 ?AUTO_9432 ) ) ( not ( = ?AUTO_9430 ?AUTO_9432 ) ) ( CALIBRATION_TARGET ?AUTO_9429 ?AUTO_9433 ) ( VISIBLE_FROM ?AUTO_9433 ?AUTO_9432 ) ( not ( = ?AUTO_9424 ?AUTO_9433 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9426 ?AUTO_9429 ?AUTO_9433 ?AUTO_9432 )
      ( GET_IMAGE_DATA ?AUTO_9424 ?AUTO_9423 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9424 ?AUTO_9423 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9435 - OBJECTIVE
      ?AUTO_9434 - MODE
    )
    :vars
    (
      ?AUTO_9441 - LANDER
      ?AUTO_9437 - WAYPOINT
      ?AUTO_9442 - WAYPOINT
      ?AUTO_9443 - ROVER
      ?AUTO_9436 - CAMERA
      ?AUTO_9438 - WAYPOINT
      ?AUTO_9440 - WAYPOINT
      ?AUTO_9439 - WAYPOINT
      ?AUTO_9444 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9441 ?AUTO_9437 ) ( VISIBLE ?AUTO_9442 ?AUTO_9437 ) ( AVAILABLE ?AUTO_9443 ) ( CHANNEL_FREE ?AUTO_9441 ) ( not ( = ?AUTO_9442 ?AUTO_9437 ) ) ( ON_BOARD ?AUTO_9436 ?AUTO_9443 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9443 ) ( SUPPORTS ?AUTO_9436 ?AUTO_9434 ) ( VISIBLE_FROM ?AUTO_9435 ?AUTO_9442 ) ( CAN_TRAVERSE ?AUTO_9443 ?AUTO_9438 ?AUTO_9442 ) ( VISIBLE ?AUTO_9438 ?AUTO_9442 ) ( not ( = ?AUTO_9437 ?AUTO_9438 ) ) ( not ( = ?AUTO_9442 ?AUTO_9438 ) ) ( CAN_TRAVERSE ?AUTO_9443 ?AUTO_9440 ?AUTO_9438 ) ( VISIBLE ?AUTO_9440 ?AUTO_9438 ) ( not ( = ?AUTO_9437 ?AUTO_9440 ) ) ( not ( = ?AUTO_9442 ?AUTO_9440 ) ) ( not ( = ?AUTO_9438 ?AUTO_9440 ) ) ( CAN_TRAVERSE ?AUTO_9443 ?AUTO_9439 ?AUTO_9440 ) ( VISIBLE ?AUTO_9439 ?AUTO_9440 ) ( not ( = ?AUTO_9437 ?AUTO_9439 ) ) ( not ( = ?AUTO_9442 ?AUTO_9439 ) ) ( not ( = ?AUTO_9438 ?AUTO_9439 ) ) ( not ( = ?AUTO_9440 ?AUTO_9439 ) ) ( CALIBRATION_TARGET ?AUTO_9436 ?AUTO_9444 ) ( VISIBLE_FROM ?AUTO_9444 ?AUTO_9439 ) ( not ( = ?AUTO_9435 ?AUTO_9444 ) ) ( CAN_TRAVERSE ?AUTO_9443 ?AUTO_9438 ?AUTO_9439 ) ( AT ?AUTO_9443 ?AUTO_9438 ) ( VISIBLE ?AUTO_9438 ?AUTO_9439 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9443 ?AUTO_9438 ?AUTO_9439 )
      ( GET_IMAGE_DATA ?AUTO_9435 ?AUTO_9434 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9435 ?AUTO_9434 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9456 - OBJECTIVE
      ?AUTO_9455 - MODE
    )
    :vars
    (
      ?AUTO_9465 - LANDER
      ?AUTO_9457 - WAYPOINT
      ?AUTO_9463 - WAYPOINT
      ?AUTO_9461 - ROVER
      ?AUTO_9464 - CAMERA
      ?AUTO_9460 - WAYPOINT
      ?AUTO_9459 - WAYPOINT
      ?AUTO_9458 - WAYPOINT
      ?AUTO_9462 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9465 ?AUTO_9457 ) ( VISIBLE ?AUTO_9463 ?AUTO_9457 ) ( AVAILABLE ?AUTO_9461 ) ( CHANNEL_FREE ?AUTO_9465 ) ( not ( = ?AUTO_9463 ?AUTO_9457 ) ) ( ON_BOARD ?AUTO_9464 ?AUTO_9461 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9461 ) ( SUPPORTS ?AUTO_9464 ?AUTO_9455 ) ( VISIBLE_FROM ?AUTO_9456 ?AUTO_9463 ) ( CAN_TRAVERSE ?AUTO_9461 ?AUTO_9460 ?AUTO_9463 ) ( VISIBLE ?AUTO_9460 ?AUTO_9463 ) ( not ( = ?AUTO_9457 ?AUTO_9460 ) ) ( not ( = ?AUTO_9463 ?AUTO_9460 ) ) ( CAN_TRAVERSE ?AUTO_9461 ?AUTO_9459 ?AUTO_9460 ) ( VISIBLE ?AUTO_9459 ?AUTO_9460 ) ( not ( = ?AUTO_9457 ?AUTO_9459 ) ) ( not ( = ?AUTO_9463 ?AUTO_9459 ) ) ( not ( = ?AUTO_9460 ?AUTO_9459 ) ) ( CAN_TRAVERSE ?AUTO_9461 ?AUTO_9458 ?AUTO_9459 ) ( VISIBLE ?AUTO_9458 ?AUTO_9459 ) ( not ( = ?AUTO_9457 ?AUTO_9458 ) ) ( not ( = ?AUTO_9463 ?AUTO_9458 ) ) ( not ( = ?AUTO_9460 ?AUTO_9458 ) ) ( not ( = ?AUTO_9459 ?AUTO_9458 ) ) ( CALIBRATION_TARGET ?AUTO_9464 ?AUTO_9462 ) ( VISIBLE_FROM ?AUTO_9462 ?AUTO_9458 ) ( not ( = ?AUTO_9456 ?AUTO_9462 ) ) ( CAN_TRAVERSE ?AUTO_9461 ?AUTO_9460 ?AUTO_9458 ) ( VISIBLE ?AUTO_9460 ?AUTO_9458 ) ( CAN_TRAVERSE ?AUTO_9461 ?AUTO_9463 ?AUTO_9460 ) ( AT ?AUTO_9461 ?AUTO_9463 ) ( VISIBLE ?AUTO_9463 ?AUTO_9460 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9461 ?AUTO_9463 ?AUTO_9460 )
      ( GET_IMAGE_DATA ?AUTO_9456 ?AUTO_9455 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9456 ?AUTO_9455 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9549 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9552 - LANDER
      ?AUTO_9554 - WAYPOINT
      ?AUTO_9553 - WAYPOINT
      ?AUTO_9551 - ROVER
      ?AUTO_9550 - STORE
      ?AUTO_9555 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9552 ?AUTO_9554 ) ( VISIBLE ?AUTO_9553 ?AUTO_9554 ) ( AVAILABLE ?AUTO_9551 ) ( CHANNEL_FREE ?AUTO_9552 ) ( not ( = ?AUTO_9549 ?AUTO_9553 ) ) ( not ( = ?AUTO_9549 ?AUTO_9554 ) ) ( not ( = ?AUTO_9553 ?AUTO_9554 ) ) ( CAN_TRAVERSE ?AUTO_9551 ?AUTO_9549 ?AUTO_9553 ) ( VISIBLE ?AUTO_9549 ?AUTO_9553 ) ( AT_SOIL_SAMPLE ?AUTO_9549 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9551 ) ( STORE_OF ?AUTO_9550 ?AUTO_9551 ) ( CAN_TRAVERSE ?AUTO_9551 ?AUTO_9553 ?AUTO_9549 ) ( VISIBLE ?AUTO_9553 ?AUTO_9549 ) ( FULL ?AUTO_9550 ) ( CAN_TRAVERSE ?AUTO_9551 ?AUTO_9555 ?AUTO_9553 ) ( AT ?AUTO_9551 ?AUTO_9555 ) ( VISIBLE ?AUTO_9555 ?AUTO_9553 ) ( not ( = ?AUTO_9549 ?AUTO_9555 ) ) ( not ( = ?AUTO_9554 ?AUTO_9555 ) ) ( not ( = ?AUTO_9553 ?AUTO_9555 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9551 ?AUTO_9555 ?AUTO_9553 )
      ( GET_SOIL_DATA ?AUTO_9549 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9549 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9565 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9570 - LANDER
      ?AUTO_9568 - WAYPOINT
      ?AUTO_9567 - WAYPOINT
      ?AUTO_9571 - ROVER
      ?AUTO_9569 - STORE
      ?AUTO_9566 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9570 ?AUTO_9568 ) ( VISIBLE ?AUTO_9567 ?AUTO_9568 ) ( AVAILABLE ?AUTO_9571 ) ( CHANNEL_FREE ?AUTO_9570 ) ( not ( = ?AUTO_9565 ?AUTO_9567 ) ) ( not ( = ?AUTO_9565 ?AUTO_9568 ) ) ( not ( = ?AUTO_9567 ?AUTO_9568 ) ) ( CAN_TRAVERSE ?AUTO_9571 ?AUTO_9565 ?AUTO_9567 ) ( VISIBLE ?AUTO_9565 ?AUTO_9567 ) ( AT_SOIL_SAMPLE ?AUTO_9565 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9571 ) ( STORE_OF ?AUTO_9569 ?AUTO_9571 ) ( CAN_TRAVERSE ?AUTO_9571 ?AUTO_9567 ?AUTO_9565 ) ( VISIBLE ?AUTO_9567 ?AUTO_9565 ) ( CAN_TRAVERSE ?AUTO_9571 ?AUTO_9566 ?AUTO_9567 ) ( AT ?AUTO_9571 ?AUTO_9566 ) ( VISIBLE ?AUTO_9566 ?AUTO_9567 ) ( not ( = ?AUTO_9565 ?AUTO_9566 ) ) ( not ( = ?AUTO_9568 ?AUTO_9566 ) ) ( not ( = ?AUTO_9567 ?AUTO_9566 ) ) ( AT_SOIL_SAMPLE ?AUTO_9566 ) ( EMPTY ?AUTO_9569 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9571 ?AUTO_9569 ?AUTO_9566 )
      ( GET_SOIL_DATA ?AUTO_9565 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9565 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9614 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9618 - LANDER
      ?AUTO_9615 - WAYPOINT
      ?AUTO_9617 - WAYPOINT
      ?AUTO_9616 - ROVER
      ?AUTO_9619 - STORE
      ?AUTO_9620 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9618 ?AUTO_9615 ) ( VISIBLE ?AUTO_9617 ?AUTO_9615 ) ( AVAILABLE ?AUTO_9616 ) ( CHANNEL_FREE ?AUTO_9618 ) ( not ( = ?AUTO_9614 ?AUTO_9617 ) ) ( not ( = ?AUTO_9614 ?AUTO_9615 ) ) ( not ( = ?AUTO_9617 ?AUTO_9615 ) ) ( CAN_TRAVERSE ?AUTO_9616 ?AUTO_9614 ?AUTO_9617 ) ( VISIBLE ?AUTO_9614 ?AUTO_9617 ) ( AT_ROCK_SAMPLE ?AUTO_9614 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9616 ) ( STORE_OF ?AUTO_9619 ?AUTO_9616 ) ( CAN_TRAVERSE ?AUTO_9616 ?AUTO_9617 ?AUTO_9614 ) ( VISIBLE ?AUTO_9617 ?AUTO_9614 ) ( FULL ?AUTO_9619 ) ( CAN_TRAVERSE ?AUTO_9616 ?AUTO_9620 ?AUTO_9617 ) ( AT ?AUTO_9616 ?AUTO_9620 ) ( VISIBLE ?AUTO_9620 ?AUTO_9617 ) ( not ( = ?AUTO_9614 ?AUTO_9620 ) ) ( not ( = ?AUTO_9615 ?AUTO_9620 ) ) ( not ( = ?AUTO_9617 ?AUTO_9620 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9616 ?AUTO_9620 ?AUTO_9617 )
      ( GET_ROCK_DATA ?AUTO_9614 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9614 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9630 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9631 - LANDER
      ?AUTO_9634 - WAYPOINT
      ?AUTO_9633 - WAYPOINT
      ?AUTO_9635 - ROVER
      ?AUTO_9632 - STORE
      ?AUTO_9636 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9631 ?AUTO_9634 ) ( VISIBLE ?AUTO_9633 ?AUTO_9634 ) ( AVAILABLE ?AUTO_9635 ) ( CHANNEL_FREE ?AUTO_9631 ) ( not ( = ?AUTO_9630 ?AUTO_9633 ) ) ( not ( = ?AUTO_9630 ?AUTO_9634 ) ) ( not ( = ?AUTO_9633 ?AUTO_9634 ) ) ( CAN_TRAVERSE ?AUTO_9635 ?AUTO_9630 ?AUTO_9633 ) ( VISIBLE ?AUTO_9630 ?AUTO_9633 ) ( AT_ROCK_SAMPLE ?AUTO_9630 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9635 ) ( STORE_OF ?AUTO_9632 ?AUTO_9635 ) ( CAN_TRAVERSE ?AUTO_9635 ?AUTO_9633 ?AUTO_9630 ) ( VISIBLE ?AUTO_9633 ?AUTO_9630 ) ( CAN_TRAVERSE ?AUTO_9635 ?AUTO_9636 ?AUTO_9633 ) ( AT ?AUTO_9635 ?AUTO_9636 ) ( VISIBLE ?AUTO_9636 ?AUTO_9633 ) ( not ( = ?AUTO_9630 ?AUTO_9636 ) ) ( not ( = ?AUTO_9634 ?AUTO_9636 ) ) ( not ( = ?AUTO_9633 ?AUTO_9636 ) ) ( AT_SOIL_SAMPLE ?AUTO_9636 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9635 ) ( EMPTY ?AUTO_9632 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_9635 ?AUTO_9632 ?AUTO_9636 )
      ( GET_ROCK_DATA ?AUTO_9630 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9630 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9711 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9715 - LANDER
      ?AUTO_9712 - WAYPOINT
      ?AUTO_9716 - ROVER
      ?AUTO_9713 - STORE
      ?AUTO_9714 - WAYPOINT
      ?AUTO_9717 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9715 ?AUTO_9712 ) ( VISIBLE ?AUTO_9711 ?AUTO_9712 ) ( AVAILABLE ?AUTO_9716 ) ( CHANNEL_FREE ?AUTO_9715 ) ( not ( = ?AUTO_9711 ?AUTO_9712 ) ) ( AT_ROCK_SAMPLE ?AUTO_9711 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9716 ) ( STORE_OF ?AUTO_9713 ?AUTO_9716 ) ( EMPTY ?AUTO_9713 ) ( CAN_TRAVERSE ?AUTO_9716 ?AUTO_9714 ?AUTO_9711 ) ( VISIBLE ?AUTO_9714 ?AUTO_9711 ) ( not ( = ?AUTO_9711 ?AUTO_9714 ) ) ( not ( = ?AUTO_9712 ?AUTO_9714 ) ) ( CAN_TRAVERSE ?AUTO_9716 ?AUTO_9717 ?AUTO_9714 ) ( VISIBLE ?AUTO_9717 ?AUTO_9714 ) ( not ( = ?AUTO_9711 ?AUTO_9717 ) ) ( not ( = ?AUTO_9712 ?AUTO_9717 ) ) ( not ( = ?AUTO_9714 ?AUTO_9717 ) ) ( CAN_TRAVERSE ?AUTO_9716 ?AUTO_9712 ?AUTO_9717 ) ( AT ?AUTO_9716 ?AUTO_9712 ) ( VISIBLE ?AUTO_9712 ?AUTO_9717 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9716 ?AUTO_9712 ?AUTO_9717 )
      ( GET_ROCK_DATA ?AUTO_9711 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9711 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9743 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9744 - LANDER
      ?AUTO_9747 - WAYPOINT
      ?AUTO_9749 - WAYPOINT
      ?AUTO_9745 - ROVER
      ?AUTO_9748 - STORE
      ?AUTO_9746 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9744 ?AUTO_9747 ) ( VISIBLE ?AUTO_9749 ?AUTO_9747 ) ( AVAILABLE ?AUTO_9745 ) ( CHANNEL_FREE ?AUTO_9744 ) ( not ( = ?AUTO_9743 ?AUTO_9749 ) ) ( not ( = ?AUTO_9743 ?AUTO_9747 ) ) ( not ( = ?AUTO_9749 ?AUTO_9747 ) ) ( CAN_TRAVERSE ?AUTO_9745 ?AUTO_9743 ?AUTO_9749 ) ( VISIBLE ?AUTO_9743 ?AUTO_9749 ) ( AT_SOIL_SAMPLE ?AUTO_9743 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9745 ) ( STORE_OF ?AUTO_9748 ?AUTO_9745 ) ( EMPTY ?AUTO_9748 ) ( CAN_TRAVERSE ?AUTO_9745 ?AUTO_9746 ?AUTO_9743 ) ( VISIBLE ?AUTO_9746 ?AUTO_9743 ) ( not ( = ?AUTO_9743 ?AUTO_9746 ) ) ( not ( = ?AUTO_9747 ?AUTO_9746 ) ) ( not ( = ?AUTO_9749 ?AUTO_9746 ) ) ( CAN_TRAVERSE ?AUTO_9745 ?AUTO_9747 ?AUTO_9746 ) ( AT ?AUTO_9745 ?AUTO_9747 ) ( VISIBLE ?AUTO_9747 ?AUTO_9746 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9745 ?AUTO_9747 ?AUTO_9746 )
      ( GET_SOIL_DATA ?AUTO_9743 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9743 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9750 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9755 - LANDER
      ?AUTO_9753 - WAYPOINT
      ?AUTO_9752 - WAYPOINT
      ?AUTO_9754 - ROVER
      ?AUTO_9751 - STORE
      ?AUTO_9756 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9755 ?AUTO_9753 ) ( VISIBLE ?AUTO_9752 ?AUTO_9753 ) ( AVAILABLE ?AUTO_9754 ) ( CHANNEL_FREE ?AUTO_9755 ) ( not ( = ?AUTO_9750 ?AUTO_9752 ) ) ( not ( = ?AUTO_9750 ?AUTO_9753 ) ) ( not ( = ?AUTO_9752 ?AUTO_9753 ) ) ( CAN_TRAVERSE ?AUTO_9754 ?AUTO_9750 ?AUTO_9752 ) ( VISIBLE ?AUTO_9750 ?AUTO_9752 ) ( AT_SOIL_SAMPLE ?AUTO_9750 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9754 ) ( STORE_OF ?AUTO_9751 ?AUTO_9754 ) ( EMPTY ?AUTO_9751 ) ( CAN_TRAVERSE ?AUTO_9754 ?AUTO_9756 ?AUTO_9750 ) ( VISIBLE ?AUTO_9756 ?AUTO_9750 ) ( not ( = ?AUTO_9750 ?AUTO_9756 ) ) ( not ( = ?AUTO_9753 ?AUTO_9756 ) ) ( not ( = ?AUTO_9752 ?AUTO_9756 ) ) ( CAN_TRAVERSE ?AUTO_9754 ?AUTO_9753 ?AUTO_9756 ) ( VISIBLE ?AUTO_9753 ?AUTO_9756 ) ( CAN_TRAVERSE ?AUTO_9754 ?AUTO_9752 ?AUTO_9753 ) ( AT ?AUTO_9754 ?AUTO_9752 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9754 ?AUTO_9752 ?AUTO_9753 )
      ( GET_SOIL_DATA ?AUTO_9750 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9750 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9804 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9807 - LANDER
      ?AUTO_9810 - WAYPOINT
      ?AUTO_9808 - WAYPOINT
      ?AUTO_9809 - ROVER
      ?AUTO_9806 - STORE
      ?AUTO_9805 - WAYPOINT
      ?AUTO_9811 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9807 ?AUTO_9810 ) ( VISIBLE ?AUTO_9808 ?AUTO_9810 ) ( AVAILABLE ?AUTO_9809 ) ( CHANNEL_FREE ?AUTO_9807 ) ( not ( = ?AUTO_9804 ?AUTO_9808 ) ) ( not ( = ?AUTO_9804 ?AUTO_9810 ) ) ( not ( = ?AUTO_9808 ?AUTO_9810 ) ) ( CAN_TRAVERSE ?AUTO_9809 ?AUTO_9804 ?AUTO_9808 ) ( VISIBLE ?AUTO_9804 ?AUTO_9808 ) ( AT_SOIL_SAMPLE ?AUTO_9804 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9809 ) ( STORE_OF ?AUTO_9806 ?AUTO_9809 ) ( EMPTY ?AUTO_9806 ) ( CAN_TRAVERSE ?AUTO_9809 ?AUTO_9808 ?AUTO_9804 ) ( VISIBLE ?AUTO_9808 ?AUTO_9804 ) ( CAN_TRAVERSE ?AUTO_9809 ?AUTO_9805 ?AUTO_9808 ) ( VISIBLE ?AUTO_9805 ?AUTO_9808 ) ( not ( = ?AUTO_9804 ?AUTO_9805 ) ) ( not ( = ?AUTO_9810 ?AUTO_9805 ) ) ( not ( = ?AUTO_9808 ?AUTO_9805 ) ) ( CAN_TRAVERSE ?AUTO_9809 ?AUTO_9811 ?AUTO_9805 ) ( AT ?AUTO_9809 ?AUTO_9811 ) ( VISIBLE ?AUTO_9811 ?AUTO_9805 ) ( not ( = ?AUTO_9804 ?AUTO_9811 ) ) ( not ( = ?AUTO_9810 ?AUTO_9811 ) ) ( not ( = ?AUTO_9808 ?AUTO_9811 ) ) ( not ( = ?AUTO_9805 ?AUTO_9811 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9809 ?AUTO_9811 ?AUTO_9805 )
      ( GET_SOIL_DATA ?AUTO_9804 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9804 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_9812 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9819 - LANDER
      ?AUTO_9813 - WAYPOINT
      ?AUTO_9815 - WAYPOINT
      ?AUTO_9816 - ROVER
      ?AUTO_9814 - STORE
      ?AUTO_9818 - WAYPOINT
      ?AUTO_9817 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9819 ?AUTO_9813 ) ( VISIBLE ?AUTO_9815 ?AUTO_9813 ) ( AVAILABLE ?AUTO_9816 ) ( CHANNEL_FREE ?AUTO_9819 ) ( not ( = ?AUTO_9812 ?AUTO_9815 ) ) ( not ( = ?AUTO_9812 ?AUTO_9813 ) ) ( not ( = ?AUTO_9815 ?AUTO_9813 ) ) ( CAN_TRAVERSE ?AUTO_9816 ?AUTO_9812 ?AUTO_9815 ) ( VISIBLE ?AUTO_9812 ?AUTO_9815 ) ( AT_SOIL_SAMPLE ?AUTO_9812 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_9816 ) ( STORE_OF ?AUTO_9814 ?AUTO_9816 ) ( EMPTY ?AUTO_9814 ) ( CAN_TRAVERSE ?AUTO_9816 ?AUTO_9815 ?AUTO_9812 ) ( VISIBLE ?AUTO_9815 ?AUTO_9812 ) ( CAN_TRAVERSE ?AUTO_9816 ?AUTO_9818 ?AUTO_9815 ) ( VISIBLE ?AUTO_9818 ?AUTO_9815 ) ( not ( = ?AUTO_9812 ?AUTO_9818 ) ) ( not ( = ?AUTO_9813 ?AUTO_9818 ) ) ( not ( = ?AUTO_9815 ?AUTO_9818 ) ) ( CAN_TRAVERSE ?AUTO_9816 ?AUTO_9817 ?AUTO_9818 ) ( VISIBLE ?AUTO_9817 ?AUTO_9818 ) ( not ( = ?AUTO_9812 ?AUTO_9817 ) ) ( not ( = ?AUTO_9813 ?AUTO_9817 ) ) ( not ( = ?AUTO_9815 ?AUTO_9817 ) ) ( not ( = ?AUTO_9818 ?AUTO_9817 ) ) ( CAN_TRAVERSE ?AUTO_9816 ?AUTO_9813 ?AUTO_9817 ) ( AT ?AUTO_9816 ?AUTO_9813 ) ( VISIBLE ?AUTO_9813 ?AUTO_9817 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9816 ?AUTO_9813 ?AUTO_9817 )
      ( GET_SOIL_DATA ?AUTO_9812 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_9812 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9852 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9857 - LANDER
      ?AUTO_9855 - WAYPOINT
      ?AUTO_9856 - WAYPOINT
      ?AUTO_9854 - ROVER
      ?AUTO_9853 - STORE
      ?AUTO_9858 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9857 ?AUTO_9855 ) ( VISIBLE ?AUTO_9856 ?AUTO_9855 ) ( AVAILABLE ?AUTO_9854 ) ( CHANNEL_FREE ?AUTO_9857 ) ( not ( = ?AUTO_9852 ?AUTO_9856 ) ) ( not ( = ?AUTO_9852 ?AUTO_9855 ) ) ( not ( = ?AUTO_9856 ?AUTO_9855 ) ) ( CAN_TRAVERSE ?AUTO_9854 ?AUTO_9852 ?AUTO_9856 ) ( VISIBLE ?AUTO_9852 ?AUTO_9856 ) ( AT_ROCK_SAMPLE ?AUTO_9852 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9854 ) ( STORE_OF ?AUTO_9853 ?AUTO_9854 ) ( EMPTY ?AUTO_9853 ) ( CAN_TRAVERSE ?AUTO_9854 ?AUTO_9856 ?AUTO_9852 ) ( VISIBLE ?AUTO_9856 ?AUTO_9852 ) ( CAN_TRAVERSE ?AUTO_9854 ?AUTO_9855 ?AUTO_9856 ) ( VISIBLE ?AUTO_9855 ?AUTO_9856 ) ( CAN_TRAVERSE ?AUTO_9854 ?AUTO_9858 ?AUTO_9855 ) ( AT ?AUTO_9854 ?AUTO_9858 ) ( VISIBLE ?AUTO_9858 ?AUTO_9855 ) ( not ( = ?AUTO_9852 ?AUTO_9858 ) ) ( not ( = ?AUTO_9855 ?AUTO_9858 ) ) ( not ( = ?AUTO_9856 ?AUTO_9858 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9854 ?AUTO_9858 ?AUTO_9855 )
      ( GET_ROCK_DATA ?AUTO_9852 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9852 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_9859 - WAYPOINT
    )
    :vars
    (
      ?AUTO_9863 - LANDER
      ?AUTO_9862 - WAYPOINT
      ?AUTO_9861 - WAYPOINT
      ?AUTO_9864 - ROVER
      ?AUTO_9865 - STORE
      ?AUTO_9860 - WAYPOINT
      ?AUTO_9866 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9863 ?AUTO_9862 ) ( VISIBLE ?AUTO_9861 ?AUTO_9862 ) ( AVAILABLE ?AUTO_9864 ) ( CHANNEL_FREE ?AUTO_9863 ) ( not ( = ?AUTO_9859 ?AUTO_9861 ) ) ( not ( = ?AUTO_9859 ?AUTO_9862 ) ) ( not ( = ?AUTO_9861 ?AUTO_9862 ) ) ( CAN_TRAVERSE ?AUTO_9864 ?AUTO_9859 ?AUTO_9861 ) ( VISIBLE ?AUTO_9859 ?AUTO_9861 ) ( AT_ROCK_SAMPLE ?AUTO_9859 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_9864 ) ( STORE_OF ?AUTO_9865 ?AUTO_9864 ) ( EMPTY ?AUTO_9865 ) ( CAN_TRAVERSE ?AUTO_9864 ?AUTO_9861 ?AUTO_9859 ) ( VISIBLE ?AUTO_9861 ?AUTO_9859 ) ( CAN_TRAVERSE ?AUTO_9864 ?AUTO_9862 ?AUTO_9861 ) ( VISIBLE ?AUTO_9862 ?AUTO_9861 ) ( CAN_TRAVERSE ?AUTO_9864 ?AUTO_9860 ?AUTO_9862 ) ( VISIBLE ?AUTO_9860 ?AUTO_9862 ) ( not ( = ?AUTO_9859 ?AUTO_9860 ) ) ( not ( = ?AUTO_9862 ?AUTO_9860 ) ) ( not ( = ?AUTO_9861 ?AUTO_9860 ) ) ( CAN_TRAVERSE ?AUTO_9864 ?AUTO_9866 ?AUTO_9860 ) ( AT ?AUTO_9864 ?AUTO_9866 ) ( VISIBLE ?AUTO_9866 ?AUTO_9860 ) ( not ( = ?AUTO_9859 ?AUTO_9866 ) ) ( not ( = ?AUTO_9862 ?AUTO_9866 ) ) ( not ( = ?AUTO_9861 ?AUTO_9866 ) ) ( not ( = ?AUTO_9860 ?AUTO_9866 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9864 ?AUTO_9866 ?AUTO_9860 )
      ( GET_ROCK_DATA ?AUTO_9859 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_9859 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9912 - OBJECTIVE
      ?AUTO_9913 - MODE
    )
    :vars
    (
      ?AUTO_9914 - LANDER
      ?AUTO_9919 - WAYPOINT
      ?AUTO_9917 - WAYPOINT
      ?AUTO_9916 - ROVER
      ?AUTO_9915 - WAYPOINT
      ?AUTO_9918 - CAMERA
      ?AUTO_9920 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9914 ?AUTO_9919 ) ( VISIBLE ?AUTO_9917 ?AUTO_9919 ) ( AVAILABLE ?AUTO_9916 ) ( CHANNEL_FREE ?AUTO_9914 ) ( not ( = ?AUTO_9917 ?AUTO_9919 ) ) ( CAN_TRAVERSE ?AUTO_9916 ?AUTO_9915 ?AUTO_9917 ) ( VISIBLE ?AUTO_9915 ?AUTO_9917 ) ( not ( = ?AUTO_9919 ?AUTO_9915 ) ) ( not ( = ?AUTO_9917 ?AUTO_9915 ) ) ( ON_BOARD ?AUTO_9918 ?AUTO_9916 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9916 ) ( SUPPORTS ?AUTO_9918 ?AUTO_9913 ) ( VISIBLE_FROM ?AUTO_9912 ?AUTO_9915 ) ( CAN_TRAVERSE ?AUTO_9916 ?AUTO_9917 ?AUTO_9915 ) ( VISIBLE ?AUTO_9917 ?AUTO_9915 ) ( CAN_TRAVERSE ?AUTO_9916 ?AUTO_9919 ?AUTO_9917 ) ( AT ?AUTO_9916 ?AUTO_9919 ) ( VISIBLE ?AUTO_9919 ?AUTO_9917 ) ( CALIBRATION_TARGET ?AUTO_9918 ?AUTO_9920 ) ( VISIBLE_FROM ?AUTO_9920 ?AUTO_9919 ) ( not ( = ?AUTO_9912 ?AUTO_9920 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_9916 ?AUTO_9918 ?AUTO_9920 ?AUTO_9919 )
      ( GET_IMAGE_DATA ?AUTO_9912 ?AUTO_9913 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9912 ?AUTO_9913 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9921 - OBJECTIVE
      ?AUTO_9922 - MODE
    )
    :vars
    (
      ?AUTO_9923 - LANDER
      ?AUTO_9924 - WAYPOINT
      ?AUTO_9928 - WAYPOINT
      ?AUTO_9925 - ROVER
      ?AUTO_9926 - WAYPOINT
      ?AUTO_9927 - CAMERA
      ?AUTO_9929 - OBJECTIVE
      ?AUTO_9930 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9923 ?AUTO_9924 ) ( VISIBLE ?AUTO_9928 ?AUTO_9924 ) ( AVAILABLE ?AUTO_9925 ) ( CHANNEL_FREE ?AUTO_9923 ) ( not ( = ?AUTO_9928 ?AUTO_9924 ) ) ( CAN_TRAVERSE ?AUTO_9925 ?AUTO_9926 ?AUTO_9928 ) ( VISIBLE ?AUTO_9926 ?AUTO_9928 ) ( not ( = ?AUTO_9924 ?AUTO_9926 ) ) ( not ( = ?AUTO_9928 ?AUTO_9926 ) ) ( ON_BOARD ?AUTO_9927 ?AUTO_9925 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9925 ) ( SUPPORTS ?AUTO_9927 ?AUTO_9922 ) ( VISIBLE_FROM ?AUTO_9921 ?AUTO_9926 ) ( CAN_TRAVERSE ?AUTO_9925 ?AUTO_9928 ?AUTO_9926 ) ( VISIBLE ?AUTO_9928 ?AUTO_9926 ) ( CAN_TRAVERSE ?AUTO_9925 ?AUTO_9924 ?AUTO_9928 ) ( VISIBLE ?AUTO_9924 ?AUTO_9928 ) ( CALIBRATION_TARGET ?AUTO_9927 ?AUTO_9929 ) ( VISIBLE_FROM ?AUTO_9929 ?AUTO_9924 ) ( not ( = ?AUTO_9921 ?AUTO_9929 ) ) ( CAN_TRAVERSE ?AUTO_9925 ?AUTO_9930 ?AUTO_9924 ) ( AT ?AUTO_9925 ?AUTO_9930 ) ( VISIBLE ?AUTO_9930 ?AUTO_9924 ) ( not ( = ?AUTO_9924 ?AUTO_9930 ) ) ( not ( = ?AUTO_9928 ?AUTO_9930 ) ) ( not ( = ?AUTO_9926 ?AUTO_9930 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9925 ?AUTO_9930 ?AUTO_9924 )
      ( GET_IMAGE_DATA ?AUTO_9921 ?AUTO_9922 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9921 ?AUTO_9922 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_9931 - OBJECTIVE
      ?AUTO_9932 - MODE
    )
    :vars
    (
      ?AUTO_9933 - LANDER
      ?AUTO_9934 - WAYPOINT
      ?AUTO_9940 - WAYPOINT
      ?AUTO_9936 - ROVER
      ?AUTO_9937 - WAYPOINT
      ?AUTO_9939 - CAMERA
      ?AUTO_9935 - OBJECTIVE
      ?AUTO_9938 - WAYPOINT
      ?AUTO_9941 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_9933 ?AUTO_9934 ) ( VISIBLE ?AUTO_9940 ?AUTO_9934 ) ( AVAILABLE ?AUTO_9936 ) ( CHANNEL_FREE ?AUTO_9933 ) ( not ( = ?AUTO_9940 ?AUTO_9934 ) ) ( CAN_TRAVERSE ?AUTO_9936 ?AUTO_9937 ?AUTO_9940 ) ( VISIBLE ?AUTO_9937 ?AUTO_9940 ) ( not ( = ?AUTO_9934 ?AUTO_9937 ) ) ( not ( = ?AUTO_9940 ?AUTO_9937 ) ) ( ON_BOARD ?AUTO_9939 ?AUTO_9936 ) ( EQUIPPED_FOR_IMAGING ?AUTO_9936 ) ( SUPPORTS ?AUTO_9939 ?AUTO_9932 ) ( VISIBLE_FROM ?AUTO_9931 ?AUTO_9937 ) ( CAN_TRAVERSE ?AUTO_9936 ?AUTO_9940 ?AUTO_9937 ) ( VISIBLE ?AUTO_9940 ?AUTO_9937 ) ( CAN_TRAVERSE ?AUTO_9936 ?AUTO_9934 ?AUTO_9940 ) ( VISIBLE ?AUTO_9934 ?AUTO_9940 ) ( CALIBRATION_TARGET ?AUTO_9939 ?AUTO_9935 ) ( VISIBLE_FROM ?AUTO_9935 ?AUTO_9934 ) ( not ( = ?AUTO_9931 ?AUTO_9935 ) ) ( CAN_TRAVERSE ?AUTO_9936 ?AUTO_9938 ?AUTO_9934 ) ( VISIBLE ?AUTO_9938 ?AUTO_9934 ) ( not ( = ?AUTO_9934 ?AUTO_9938 ) ) ( not ( = ?AUTO_9940 ?AUTO_9938 ) ) ( not ( = ?AUTO_9937 ?AUTO_9938 ) ) ( CAN_TRAVERSE ?AUTO_9936 ?AUTO_9941 ?AUTO_9938 ) ( AT ?AUTO_9936 ?AUTO_9941 ) ( VISIBLE ?AUTO_9941 ?AUTO_9938 ) ( not ( = ?AUTO_9934 ?AUTO_9941 ) ) ( not ( = ?AUTO_9940 ?AUTO_9941 ) ) ( not ( = ?AUTO_9937 ?AUTO_9941 ) ) ( not ( = ?AUTO_9938 ?AUTO_9941 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_9936 ?AUTO_9941 ?AUTO_9938 )
      ( GET_IMAGE_DATA ?AUTO_9931 ?AUTO_9932 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_9931 ?AUTO_9932 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10021 - OBJECTIVE
      ?AUTO_10022 - MODE
    )
    :vars
    (
      ?AUTO_10026 - LANDER
      ?AUTO_10028 - WAYPOINT
      ?AUTO_10023 - WAYPOINT
      ?AUTO_10024 - ROVER
      ?AUTO_10029 - CAMERA
      ?AUTO_10027 - WAYPOINT
      ?AUTO_10025 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10026 ?AUTO_10028 ) ( VISIBLE ?AUTO_10023 ?AUTO_10028 ) ( AVAILABLE ?AUTO_10024 ) ( CHANNEL_FREE ?AUTO_10026 ) ( not ( = ?AUTO_10023 ?AUTO_10028 ) ) ( CALIBRATED ?AUTO_10029 ?AUTO_10024 ) ( ON_BOARD ?AUTO_10029 ?AUTO_10024 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10024 ) ( SUPPORTS ?AUTO_10029 ?AUTO_10022 ) ( VISIBLE_FROM ?AUTO_10021 ?AUTO_10023 ) ( CAN_TRAVERSE ?AUTO_10024 ?AUTO_10027 ?AUTO_10023 ) ( VISIBLE ?AUTO_10027 ?AUTO_10023 ) ( not ( = ?AUTO_10028 ?AUTO_10027 ) ) ( not ( = ?AUTO_10023 ?AUTO_10027 ) ) ( CAN_TRAVERSE ?AUTO_10024 ?AUTO_10025 ?AUTO_10027 ) ( VISIBLE ?AUTO_10025 ?AUTO_10027 ) ( not ( = ?AUTO_10028 ?AUTO_10025 ) ) ( not ( = ?AUTO_10023 ?AUTO_10025 ) ) ( not ( = ?AUTO_10027 ?AUTO_10025 ) ) ( CAN_TRAVERSE ?AUTO_10024 ?AUTO_10028 ?AUTO_10025 ) ( AT ?AUTO_10024 ?AUTO_10028 ) ( VISIBLE ?AUTO_10028 ?AUTO_10025 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10024 ?AUTO_10028 ?AUTO_10025 )
      ( GET_IMAGE_DATA ?AUTO_10021 ?AUTO_10022 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10021 ?AUTO_10022 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10030 - OBJECTIVE
      ?AUTO_10031 - MODE
    )
    :vars
    (
      ?AUTO_10035 - LANDER
      ?AUTO_10032 - WAYPOINT
      ?AUTO_10038 - WAYPOINT
      ?AUTO_10037 - ROVER
      ?AUTO_10033 - CAMERA
      ?AUTO_10034 - WAYPOINT
      ?AUTO_10036 - WAYPOINT
      ?AUTO_10039 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10035 ?AUTO_10032 ) ( VISIBLE ?AUTO_10038 ?AUTO_10032 ) ( AVAILABLE ?AUTO_10037 ) ( CHANNEL_FREE ?AUTO_10035 ) ( not ( = ?AUTO_10038 ?AUTO_10032 ) ) ( ON_BOARD ?AUTO_10033 ?AUTO_10037 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10037 ) ( SUPPORTS ?AUTO_10033 ?AUTO_10031 ) ( VISIBLE_FROM ?AUTO_10030 ?AUTO_10038 ) ( CAN_TRAVERSE ?AUTO_10037 ?AUTO_10034 ?AUTO_10038 ) ( VISIBLE ?AUTO_10034 ?AUTO_10038 ) ( not ( = ?AUTO_10032 ?AUTO_10034 ) ) ( not ( = ?AUTO_10038 ?AUTO_10034 ) ) ( CAN_TRAVERSE ?AUTO_10037 ?AUTO_10036 ?AUTO_10034 ) ( VISIBLE ?AUTO_10036 ?AUTO_10034 ) ( not ( = ?AUTO_10032 ?AUTO_10036 ) ) ( not ( = ?AUTO_10038 ?AUTO_10036 ) ) ( not ( = ?AUTO_10034 ?AUTO_10036 ) ) ( CAN_TRAVERSE ?AUTO_10037 ?AUTO_10032 ?AUTO_10036 ) ( AT ?AUTO_10037 ?AUTO_10032 ) ( VISIBLE ?AUTO_10032 ?AUTO_10036 ) ( CALIBRATION_TARGET ?AUTO_10033 ?AUTO_10039 ) ( VISIBLE_FROM ?AUTO_10039 ?AUTO_10032 ) ( not ( = ?AUTO_10030 ?AUTO_10039 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10037 ?AUTO_10033 ?AUTO_10039 ?AUTO_10032 )
      ( GET_IMAGE_DATA ?AUTO_10030 ?AUTO_10031 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10030 ?AUTO_10031 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10040 - OBJECTIVE
      ?AUTO_10041 - MODE
    )
    :vars
    (
      ?AUTO_10042 - LANDER
      ?AUTO_10044 - WAYPOINT
      ?AUTO_10045 - WAYPOINT
      ?AUTO_10047 - ROVER
      ?AUTO_10046 - CAMERA
      ?AUTO_10043 - WAYPOINT
      ?AUTO_10048 - WAYPOINT
      ?AUTO_10049 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10042 ?AUTO_10044 ) ( VISIBLE ?AUTO_10045 ?AUTO_10044 ) ( AVAILABLE ?AUTO_10047 ) ( CHANNEL_FREE ?AUTO_10042 ) ( not ( = ?AUTO_10045 ?AUTO_10044 ) ) ( ON_BOARD ?AUTO_10046 ?AUTO_10047 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10047 ) ( SUPPORTS ?AUTO_10046 ?AUTO_10041 ) ( VISIBLE_FROM ?AUTO_10040 ?AUTO_10045 ) ( CAN_TRAVERSE ?AUTO_10047 ?AUTO_10043 ?AUTO_10045 ) ( VISIBLE ?AUTO_10043 ?AUTO_10045 ) ( not ( = ?AUTO_10044 ?AUTO_10043 ) ) ( not ( = ?AUTO_10045 ?AUTO_10043 ) ) ( CAN_TRAVERSE ?AUTO_10047 ?AUTO_10048 ?AUTO_10043 ) ( VISIBLE ?AUTO_10048 ?AUTO_10043 ) ( not ( = ?AUTO_10044 ?AUTO_10048 ) ) ( not ( = ?AUTO_10045 ?AUTO_10048 ) ) ( not ( = ?AUTO_10043 ?AUTO_10048 ) ) ( CAN_TRAVERSE ?AUTO_10047 ?AUTO_10044 ?AUTO_10048 ) ( VISIBLE ?AUTO_10044 ?AUTO_10048 ) ( CALIBRATION_TARGET ?AUTO_10046 ?AUTO_10049 ) ( VISIBLE_FROM ?AUTO_10049 ?AUTO_10044 ) ( not ( = ?AUTO_10040 ?AUTO_10049 ) ) ( CAN_TRAVERSE ?AUTO_10047 ?AUTO_10045 ?AUTO_10044 ) ( AT ?AUTO_10047 ?AUTO_10045 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10047 ?AUTO_10045 ?AUTO_10044 )
      ( GET_IMAGE_DATA ?AUTO_10040 ?AUTO_10041 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10040 ?AUTO_10041 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10100 - OBJECTIVE
      ?AUTO_10101 - MODE
    )
    :vars
    (
      ?AUTO_10105 - LANDER
      ?AUTO_10102 - WAYPOINT
      ?AUTO_10108 - WAYPOINT
      ?AUTO_10106 - ROVER
      ?AUTO_10104 - WAYPOINT
      ?AUTO_10103 - WAYPOINT
      ?AUTO_10107 - CAMERA
      ?AUTO_10109 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10105 ?AUTO_10102 ) ( VISIBLE ?AUTO_10108 ?AUTO_10102 ) ( AVAILABLE ?AUTO_10106 ) ( CHANNEL_FREE ?AUTO_10105 ) ( not ( = ?AUTO_10108 ?AUTO_10102 ) ) ( CAN_TRAVERSE ?AUTO_10106 ?AUTO_10104 ?AUTO_10108 ) ( VISIBLE ?AUTO_10104 ?AUTO_10108 ) ( not ( = ?AUTO_10102 ?AUTO_10104 ) ) ( not ( = ?AUTO_10108 ?AUTO_10104 ) ) ( CAN_TRAVERSE ?AUTO_10106 ?AUTO_10103 ?AUTO_10104 ) ( VISIBLE ?AUTO_10103 ?AUTO_10104 ) ( not ( = ?AUTO_10102 ?AUTO_10103 ) ) ( not ( = ?AUTO_10108 ?AUTO_10103 ) ) ( not ( = ?AUTO_10104 ?AUTO_10103 ) ) ( ON_BOARD ?AUTO_10107 ?AUTO_10106 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10106 ) ( SUPPORTS ?AUTO_10107 ?AUTO_10101 ) ( VISIBLE_FROM ?AUTO_10100 ?AUTO_10103 ) ( CAN_TRAVERSE ?AUTO_10106 ?AUTO_10104 ?AUTO_10103 ) ( VISIBLE ?AUTO_10104 ?AUTO_10103 ) ( CAN_TRAVERSE ?AUTO_10106 ?AUTO_10108 ?AUTO_10104 ) ( AT ?AUTO_10106 ?AUTO_10108 ) ( VISIBLE ?AUTO_10108 ?AUTO_10104 ) ( CALIBRATION_TARGET ?AUTO_10107 ?AUTO_10109 ) ( VISIBLE_FROM ?AUTO_10109 ?AUTO_10108 ) ( not ( = ?AUTO_10100 ?AUTO_10109 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10106 ?AUTO_10107 ?AUTO_10109 ?AUTO_10108 )
      ( GET_IMAGE_DATA ?AUTO_10100 ?AUTO_10101 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10100 ?AUTO_10101 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10110 - OBJECTIVE
      ?AUTO_10111 - MODE
    )
    :vars
    (
      ?AUTO_10112 - LANDER
      ?AUTO_10116 - WAYPOINT
      ?AUTO_10115 - WAYPOINT
      ?AUTO_10118 - ROVER
      ?AUTO_10119 - WAYPOINT
      ?AUTO_10113 - WAYPOINT
      ?AUTO_10114 - CAMERA
      ?AUTO_10117 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10112 ?AUTO_10116 ) ( VISIBLE ?AUTO_10115 ?AUTO_10116 ) ( AVAILABLE ?AUTO_10118 ) ( CHANNEL_FREE ?AUTO_10112 ) ( not ( = ?AUTO_10115 ?AUTO_10116 ) ) ( CAN_TRAVERSE ?AUTO_10118 ?AUTO_10119 ?AUTO_10115 ) ( VISIBLE ?AUTO_10119 ?AUTO_10115 ) ( not ( = ?AUTO_10116 ?AUTO_10119 ) ) ( not ( = ?AUTO_10115 ?AUTO_10119 ) ) ( CAN_TRAVERSE ?AUTO_10118 ?AUTO_10113 ?AUTO_10119 ) ( VISIBLE ?AUTO_10113 ?AUTO_10119 ) ( not ( = ?AUTO_10116 ?AUTO_10113 ) ) ( not ( = ?AUTO_10115 ?AUTO_10113 ) ) ( not ( = ?AUTO_10119 ?AUTO_10113 ) ) ( ON_BOARD ?AUTO_10114 ?AUTO_10118 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10118 ) ( SUPPORTS ?AUTO_10114 ?AUTO_10111 ) ( VISIBLE_FROM ?AUTO_10110 ?AUTO_10113 ) ( CAN_TRAVERSE ?AUTO_10118 ?AUTO_10119 ?AUTO_10113 ) ( VISIBLE ?AUTO_10119 ?AUTO_10113 ) ( CAN_TRAVERSE ?AUTO_10118 ?AUTO_10115 ?AUTO_10119 ) ( VISIBLE ?AUTO_10115 ?AUTO_10119 ) ( CALIBRATION_TARGET ?AUTO_10114 ?AUTO_10117 ) ( VISIBLE_FROM ?AUTO_10117 ?AUTO_10115 ) ( not ( = ?AUTO_10110 ?AUTO_10117 ) ) ( AT ?AUTO_10118 ?AUTO_10119 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10118 ?AUTO_10119 ?AUTO_10115 )
      ( GET_IMAGE_DATA ?AUTO_10110 ?AUTO_10111 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10110 ?AUTO_10111 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10171 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10174 - LANDER
      ?AUTO_10172 - WAYPOINT
      ?AUTO_10177 - WAYPOINT
      ?AUTO_10175 - ROVER
      ?AUTO_10173 - STORE
      ?AUTO_10176 - WAYPOINT
      ?AUTO_10178 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10174 ?AUTO_10172 ) ( VISIBLE ?AUTO_10177 ?AUTO_10172 ) ( AVAILABLE ?AUTO_10175 ) ( CHANNEL_FREE ?AUTO_10174 ) ( not ( = ?AUTO_10171 ?AUTO_10177 ) ) ( not ( = ?AUTO_10171 ?AUTO_10172 ) ) ( not ( = ?AUTO_10177 ?AUTO_10172 ) ) ( CAN_TRAVERSE ?AUTO_10175 ?AUTO_10171 ?AUTO_10177 ) ( VISIBLE ?AUTO_10171 ?AUTO_10177 ) ( AT_SOIL_SAMPLE ?AUTO_10171 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10175 ) ( STORE_OF ?AUTO_10173 ?AUTO_10175 ) ( CAN_TRAVERSE ?AUTO_10175 ?AUTO_10176 ?AUTO_10171 ) ( VISIBLE ?AUTO_10176 ?AUTO_10171 ) ( not ( = ?AUTO_10171 ?AUTO_10176 ) ) ( not ( = ?AUTO_10172 ?AUTO_10176 ) ) ( not ( = ?AUTO_10177 ?AUTO_10176 ) ) ( FULL ?AUTO_10173 ) ( CAN_TRAVERSE ?AUTO_10175 ?AUTO_10178 ?AUTO_10176 ) ( AT ?AUTO_10175 ?AUTO_10178 ) ( VISIBLE ?AUTO_10178 ?AUTO_10176 ) ( not ( = ?AUTO_10171 ?AUTO_10178 ) ) ( not ( = ?AUTO_10172 ?AUTO_10178 ) ) ( not ( = ?AUTO_10177 ?AUTO_10178 ) ) ( not ( = ?AUTO_10176 ?AUTO_10178 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10175 ?AUTO_10178 ?AUTO_10176 )
      ( GET_SOIL_DATA ?AUTO_10171 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10171 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10179 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10184 - LANDER
      ?AUTO_10180 - WAYPOINT
      ?AUTO_10182 - WAYPOINT
      ?AUTO_10185 - ROVER
      ?AUTO_10183 - STORE
      ?AUTO_10181 - WAYPOINT
      ?AUTO_10186 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10184 ?AUTO_10180 ) ( VISIBLE ?AUTO_10182 ?AUTO_10180 ) ( AVAILABLE ?AUTO_10185 ) ( CHANNEL_FREE ?AUTO_10184 ) ( not ( = ?AUTO_10179 ?AUTO_10182 ) ) ( not ( = ?AUTO_10179 ?AUTO_10180 ) ) ( not ( = ?AUTO_10182 ?AUTO_10180 ) ) ( CAN_TRAVERSE ?AUTO_10185 ?AUTO_10179 ?AUTO_10182 ) ( VISIBLE ?AUTO_10179 ?AUTO_10182 ) ( AT_SOIL_SAMPLE ?AUTO_10179 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10185 ) ( STORE_OF ?AUTO_10183 ?AUTO_10185 ) ( CAN_TRAVERSE ?AUTO_10185 ?AUTO_10181 ?AUTO_10179 ) ( VISIBLE ?AUTO_10181 ?AUTO_10179 ) ( not ( = ?AUTO_10179 ?AUTO_10181 ) ) ( not ( = ?AUTO_10180 ?AUTO_10181 ) ) ( not ( = ?AUTO_10182 ?AUTO_10181 ) ) ( CAN_TRAVERSE ?AUTO_10185 ?AUTO_10186 ?AUTO_10181 ) ( AT ?AUTO_10185 ?AUTO_10186 ) ( VISIBLE ?AUTO_10186 ?AUTO_10181 ) ( not ( = ?AUTO_10179 ?AUTO_10186 ) ) ( not ( = ?AUTO_10180 ?AUTO_10186 ) ) ( not ( = ?AUTO_10182 ?AUTO_10186 ) ) ( not ( = ?AUTO_10181 ?AUTO_10186 ) ) ( AT_SOIL_SAMPLE ?AUTO_10186 ) ( EMPTY ?AUTO_10183 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_10185 ?AUTO_10183 ?AUTO_10186 )
      ( GET_SOIL_DATA ?AUTO_10179 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10179 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10227 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10228 - LANDER
      ?AUTO_10231 - WAYPOINT
      ?AUTO_10233 - WAYPOINT
      ?AUTO_10230 - ROVER
      ?AUTO_10232 - WAYPOINT
      ?AUTO_10229 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10228 ?AUTO_10231 ) ( VISIBLE ?AUTO_10233 ?AUTO_10231 ) ( AVAILABLE ?AUTO_10230 ) ( CHANNEL_FREE ?AUTO_10228 ) ( not ( = ?AUTO_10227 ?AUTO_10233 ) ) ( not ( = ?AUTO_10227 ?AUTO_10231 ) ) ( not ( = ?AUTO_10233 ?AUTO_10231 ) ) ( CAN_TRAVERSE ?AUTO_10230 ?AUTO_10232 ?AUTO_10233 ) ( VISIBLE ?AUTO_10232 ?AUTO_10233 ) ( not ( = ?AUTO_10227 ?AUTO_10232 ) ) ( not ( = ?AUTO_10231 ?AUTO_10232 ) ) ( not ( = ?AUTO_10233 ?AUTO_10232 ) ) ( CAN_TRAVERSE ?AUTO_10230 ?AUTO_10227 ?AUTO_10232 ) ( AT ?AUTO_10230 ?AUTO_10227 ) ( VISIBLE ?AUTO_10227 ?AUTO_10232 ) ( AT_SOIL_SAMPLE ?AUTO_10227 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10230 ) ( STORE_OF ?AUTO_10229 ?AUTO_10230 ) ( FULL ?AUTO_10229 ) )
    :subtasks
    ( ( !DROP ?AUTO_10230 ?AUTO_10229 )
      ( GET_SOIL_DATA ?AUTO_10227 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10227 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10234 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10235 - LANDER
      ?AUTO_10237 - WAYPOINT
      ?AUTO_10239 - WAYPOINT
      ?AUTO_10238 - ROVER
      ?AUTO_10236 - WAYPOINT
      ?AUTO_10240 - STORE
      ?AUTO_10241 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10235 ?AUTO_10237 ) ( VISIBLE ?AUTO_10239 ?AUTO_10237 ) ( AVAILABLE ?AUTO_10238 ) ( CHANNEL_FREE ?AUTO_10235 ) ( not ( = ?AUTO_10234 ?AUTO_10239 ) ) ( not ( = ?AUTO_10234 ?AUTO_10237 ) ) ( not ( = ?AUTO_10239 ?AUTO_10237 ) ) ( CAN_TRAVERSE ?AUTO_10238 ?AUTO_10236 ?AUTO_10239 ) ( VISIBLE ?AUTO_10236 ?AUTO_10239 ) ( not ( = ?AUTO_10234 ?AUTO_10236 ) ) ( not ( = ?AUTO_10237 ?AUTO_10236 ) ) ( not ( = ?AUTO_10239 ?AUTO_10236 ) ) ( CAN_TRAVERSE ?AUTO_10238 ?AUTO_10234 ?AUTO_10236 ) ( VISIBLE ?AUTO_10234 ?AUTO_10236 ) ( AT_SOIL_SAMPLE ?AUTO_10234 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10238 ) ( STORE_OF ?AUTO_10240 ?AUTO_10238 ) ( FULL ?AUTO_10240 ) ( CAN_TRAVERSE ?AUTO_10238 ?AUTO_10241 ?AUTO_10234 ) ( AT ?AUTO_10238 ?AUTO_10241 ) ( VISIBLE ?AUTO_10241 ?AUTO_10234 ) ( not ( = ?AUTO_10234 ?AUTO_10241 ) ) ( not ( = ?AUTO_10237 ?AUTO_10241 ) ) ( not ( = ?AUTO_10239 ?AUTO_10241 ) ) ( not ( = ?AUTO_10236 ?AUTO_10241 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10238 ?AUTO_10241 ?AUTO_10234 )
      ( GET_SOIL_DATA ?AUTO_10234 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10234 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10242 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10244 - LANDER
      ?AUTO_10249 - WAYPOINT
      ?AUTO_10246 - WAYPOINT
      ?AUTO_10245 - ROVER
      ?AUTO_10248 - WAYPOINT
      ?AUTO_10247 - STORE
      ?AUTO_10243 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10244 ?AUTO_10249 ) ( VISIBLE ?AUTO_10246 ?AUTO_10249 ) ( AVAILABLE ?AUTO_10245 ) ( CHANNEL_FREE ?AUTO_10244 ) ( not ( = ?AUTO_10242 ?AUTO_10246 ) ) ( not ( = ?AUTO_10242 ?AUTO_10249 ) ) ( not ( = ?AUTO_10246 ?AUTO_10249 ) ) ( CAN_TRAVERSE ?AUTO_10245 ?AUTO_10248 ?AUTO_10246 ) ( VISIBLE ?AUTO_10248 ?AUTO_10246 ) ( not ( = ?AUTO_10242 ?AUTO_10248 ) ) ( not ( = ?AUTO_10249 ?AUTO_10248 ) ) ( not ( = ?AUTO_10246 ?AUTO_10248 ) ) ( CAN_TRAVERSE ?AUTO_10245 ?AUTO_10242 ?AUTO_10248 ) ( VISIBLE ?AUTO_10242 ?AUTO_10248 ) ( AT_SOIL_SAMPLE ?AUTO_10242 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10245 ) ( STORE_OF ?AUTO_10247 ?AUTO_10245 ) ( CAN_TRAVERSE ?AUTO_10245 ?AUTO_10243 ?AUTO_10242 ) ( AT ?AUTO_10245 ?AUTO_10243 ) ( VISIBLE ?AUTO_10243 ?AUTO_10242 ) ( not ( = ?AUTO_10242 ?AUTO_10243 ) ) ( not ( = ?AUTO_10249 ?AUTO_10243 ) ) ( not ( = ?AUTO_10246 ?AUTO_10243 ) ) ( not ( = ?AUTO_10248 ?AUTO_10243 ) ) ( AT_SOIL_SAMPLE ?AUTO_10243 ) ( EMPTY ?AUTO_10247 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_10245 ?AUTO_10247 ?AUTO_10243 )
      ( GET_SOIL_DATA ?AUTO_10242 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10242 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10250 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10252 - LANDER
      ?AUTO_10251 - WAYPOINT
      ?AUTO_10257 - WAYPOINT
      ?AUTO_10255 - ROVER
      ?AUTO_10256 - WAYPOINT
      ?AUTO_10254 - STORE
      ?AUTO_10253 - WAYPOINT
      ?AUTO_10258 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10252 ?AUTO_10251 ) ( VISIBLE ?AUTO_10257 ?AUTO_10251 ) ( AVAILABLE ?AUTO_10255 ) ( CHANNEL_FREE ?AUTO_10252 ) ( not ( = ?AUTO_10250 ?AUTO_10257 ) ) ( not ( = ?AUTO_10250 ?AUTO_10251 ) ) ( not ( = ?AUTO_10257 ?AUTO_10251 ) ) ( CAN_TRAVERSE ?AUTO_10255 ?AUTO_10256 ?AUTO_10257 ) ( VISIBLE ?AUTO_10256 ?AUTO_10257 ) ( not ( = ?AUTO_10250 ?AUTO_10256 ) ) ( not ( = ?AUTO_10251 ?AUTO_10256 ) ) ( not ( = ?AUTO_10257 ?AUTO_10256 ) ) ( CAN_TRAVERSE ?AUTO_10255 ?AUTO_10250 ?AUTO_10256 ) ( VISIBLE ?AUTO_10250 ?AUTO_10256 ) ( AT_SOIL_SAMPLE ?AUTO_10250 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10255 ) ( STORE_OF ?AUTO_10254 ?AUTO_10255 ) ( CAN_TRAVERSE ?AUTO_10255 ?AUTO_10253 ?AUTO_10250 ) ( VISIBLE ?AUTO_10253 ?AUTO_10250 ) ( not ( = ?AUTO_10250 ?AUTO_10253 ) ) ( not ( = ?AUTO_10251 ?AUTO_10253 ) ) ( not ( = ?AUTO_10257 ?AUTO_10253 ) ) ( not ( = ?AUTO_10256 ?AUTO_10253 ) ) ( AT_SOIL_SAMPLE ?AUTO_10253 ) ( EMPTY ?AUTO_10254 ) ( CAN_TRAVERSE ?AUTO_10255 ?AUTO_10258 ?AUTO_10253 ) ( AT ?AUTO_10255 ?AUTO_10258 ) ( VISIBLE ?AUTO_10258 ?AUTO_10253 ) ( not ( = ?AUTO_10250 ?AUTO_10258 ) ) ( not ( = ?AUTO_10251 ?AUTO_10258 ) ) ( not ( = ?AUTO_10257 ?AUTO_10258 ) ) ( not ( = ?AUTO_10256 ?AUTO_10258 ) ) ( not ( = ?AUTO_10253 ?AUTO_10258 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10255 ?AUTO_10258 ?AUTO_10253 )
      ( GET_SOIL_DATA ?AUTO_10250 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10250 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10263 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10269 - LANDER
      ?AUTO_10271 - WAYPOINT
      ?AUTO_10270 - WAYPOINT
      ?AUTO_10264 - ROVER
      ?AUTO_10268 - WAYPOINT
      ?AUTO_10265 - STORE
      ?AUTO_10267 - WAYPOINT
      ?AUTO_10266 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10269 ?AUTO_10271 ) ( VISIBLE ?AUTO_10270 ?AUTO_10271 ) ( AVAILABLE ?AUTO_10264 ) ( CHANNEL_FREE ?AUTO_10269 ) ( not ( = ?AUTO_10263 ?AUTO_10270 ) ) ( not ( = ?AUTO_10263 ?AUTO_10271 ) ) ( not ( = ?AUTO_10270 ?AUTO_10271 ) ) ( CAN_TRAVERSE ?AUTO_10264 ?AUTO_10268 ?AUTO_10270 ) ( VISIBLE ?AUTO_10268 ?AUTO_10270 ) ( not ( = ?AUTO_10263 ?AUTO_10268 ) ) ( not ( = ?AUTO_10271 ?AUTO_10268 ) ) ( not ( = ?AUTO_10270 ?AUTO_10268 ) ) ( CAN_TRAVERSE ?AUTO_10264 ?AUTO_10263 ?AUTO_10268 ) ( VISIBLE ?AUTO_10263 ?AUTO_10268 ) ( AT_SOIL_SAMPLE ?AUTO_10263 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10264 ) ( STORE_OF ?AUTO_10265 ?AUTO_10264 ) ( CAN_TRAVERSE ?AUTO_10264 ?AUTO_10267 ?AUTO_10263 ) ( VISIBLE ?AUTO_10267 ?AUTO_10263 ) ( not ( = ?AUTO_10263 ?AUTO_10267 ) ) ( not ( = ?AUTO_10271 ?AUTO_10267 ) ) ( not ( = ?AUTO_10270 ?AUTO_10267 ) ) ( not ( = ?AUTO_10268 ?AUTO_10267 ) ) ( AT_SOIL_SAMPLE ?AUTO_10267 ) ( EMPTY ?AUTO_10265 ) ( CAN_TRAVERSE ?AUTO_10264 ?AUTO_10266 ?AUTO_10267 ) ( VISIBLE ?AUTO_10266 ?AUTO_10267 ) ( not ( = ?AUTO_10263 ?AUTO_10266 ) ) ( not ( = ?AUTO_10271 ?AUTO_10266 ) ) ( not ( = ?AUTO_10270 ?AUTO_10266 ) ) ( not ( = ?AUTO_10268 ?AUTO_10266 ) ) ( not ( = ?AUTO_10267 ?AUTO_10266 ) ) ( CAN_TRAVERSE ?AUTO_10264 ?AUTO_10271 ?AUTO_10266 ) ( AT ?AUTO_10264 ?AUTO_10271 ) ( VISIBLE ?AUTO_10271 ?AUTO_10266 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10264 ?AUTO_10271 ?AUTO_10266 )
      ( GET_SOIL_DATA ?AUTO_10263 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10263 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10323 - OBJECTIVE
      ?AUTO_10324 - MODE
    )
    :vars
    (
      ?AUTO_10329 - LANDER
      ?AUTO_10326 - WAYPOINT
      ?AUTO_10325 - ROVER
      ?AUTO_10327 - WAYPOINT
      ?AUTO_10330 - WAYPOINT
      ?AUTO_10328 - WAYPOINT
      ?AUTO_10331 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10329 ?AUTO_10326 ) ( HAVE_IMAGE ?AUTO_10325 ?AUTO_10323 ?AUTO_10324 ) ( VISIBLE ?AUTO_10327 ?AUTO_10326 ) ( AVAILABLE ?AUTO_10325 ) ( CHANNEL_FREE ?AUTO_10329 ) ( not ( = ?AUTO_10327 ?AUTO_10326 ) ) ( CAN_TRAVERSE ?AUTO_10325 ?AUTO_10330 ?AUTO_10327 ) ( VISIBLE ?AUTO_10330 ?AUTO_10327 ) ( not ( = ?AUTO_10326 ?AUTO_10330 ) ) ( not ( = ?AUTO_10327 ?AUTO_10330 ) ) ( CAN_TRAVERSE ?AUTO_10325 ?AUTO_10328 ?AUTO_10330 ) ( VISIBLE ?AUTO_10328 ?AUTO_10330 ) ( not ( = ?AUTO_10326 ?AUTO_10328 ) ) ( not ( = ?AUTO_10327 ?AUTO_10328 ) ) ( not ( = ?AUTO_10330 ?AUTO_10328 ) ) ( CAN_TRAVERSE ?AUTO_10325 ?AUTO_10331 ?AUTO_10328 ) ( AT ?AUTO_10325 ?AUTO_10331 ) ( VISIBLE ?AUTO_10331 ?AUTO_10328 ) ( not ( = ?AUTO_10326 ?AUTO_10331 ) ) ( not ( = ?AUTO_10327 ?AUTO_10331 ) ) ( not ( = ?AUTO_10330 ?AUTO_10331 ) ) ( not ( = ?AUTO_10328 ?AUTO_10331 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10325 ?AUTO_10331 ?AUTO_10328 )
      ( GET_IMAGE_DATA ?AUTO_10323 ?AUTO_10324 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10323 ?AUTO_10324 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10332 - OBJECTIVE
      ?AUTO_10333 - MODE
    )
    :vars
    (
      ?AUTO_10338 - LANDER
      ?AUTO_10336 - WAYPOINT
      ?AUTO_10334 - WAYPOINT
      ?AUTO_10339 - ROVER
      ?AUTO_10335 - WAYPOINT
      ?AUTO_10337 - WAYPOINT
      ?AUTO_10340 - WAYPOINT
      ?AUTO_10341 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10338 ?AUTO_10336 ) ( VISIBLE ?AUTO_10334 ?AUTO_10336 ) ( AVAILABLE ?AUTO_10339 ) ( CHANNEL_FREE ?AUTO_10338 ) ( not ( = ?AUTO_10334 ?AUTO_10336 ) ) ( CAN_TRAVERSE ?AUTO_10339 ?AUTO_10335 ?AUTO_10334 ) ( VISIBLE ?AUTO_10335 ?AUTO_10334 ) ( not ( = ?AUTO_10336 ?AUTO_10335 ) ) ( not ( = ?AUTO_10334 ?AUTO_10335 ) ) ( CAN_TRAVERSE ?AUTO_10339 ?AUTO_10337 ?AUTO_10335 ) ( VISIBLE ?AUTO_10337 ?AUTO_10335 ) ( not ( = ?AUTO_10336 ?AUTO_10337 ) ) ( not ( = ?AUTO_10334 ?AUTO_10337 ) ) ( not ( = ?AUTO_10335 ?AUTO_10337 ) ) ( CAN_TRAVERSE ?AUTO_10339 ?AUTO_10340 ?AUTO_10337 ) ( AT ?AUTO_10339 ?AUTO_10340 ) ( VISIBLE ?AUTO_10340 ?AUTO_10337 ) ( not ( = ?AUTO_10336 ?AUTO_10340 ) ) ( not ( = ?AUTO_10334 ?AUTO_10340 ) ) ( not ( = ?AUTO_10335 ?AUTO_10340 ) ) ( not ( = ?AUTO_10337 ?AUTO_10340 ) ) ( CALIBRATED ?AUTO_10341 ?AUTO_10339 ) ( ON_BOARD ?AUTO_10341 ?AUTO_10339 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10339 ) ( SUPPORTS ?AUTO_10341 ?AUTO_10333 ) ( VISIBLE_FROM ?AUTO_10332 ?AUTO_10340 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_10339 ?AUTO_10340 ?AUTO_10332 ?AUTO_10341 ?AUTO_10333 )
      ( GET_IMAGE_DATA ?AUTO_10332 ?AUTO_10333 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10332 ?AUTO_10333 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10342 - OBJECTIVE
      ?AUTO_10343 - MODE
    )
    :vars
    (
      ?AUTO_10349 - LANDER
      ?AUTO_10351 - WAYPOINT
      ?AUTO_10348 - WAYPOINT
      ?AUTO_10347 - ROVER
      ?AUTO_10345 - WAYPOINT
      ?AUTO_10346 - WAYPOINT
      ?AUTO_10344 - WAYPOINT
      ?AUTO_10350 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10349 ?AUTO_10351 ) ( VISIBLE ?AUTO_10348 ?AUTO_10351 ) ( AVAILABLE ?AUTO_10347 ) ( CHANNEL_FREE ?AUTO_10349 ) ( not ( = ?AUTO_10348 ?AUTO_10351 ) ) ( CAN_TRAVERSE ?AUTO_10347 ?AUTO_10345 ?AUTO_10348 ) ( VISIBLE ?AUTO_10345 ?AUTO_10348 ) ( not ( = ?AUTO_10351 ?AUTO_10345 ) ) ( not ( = ?AUTO_10348 ?AUTO_10345 ) ) ( CAN_TRAVERSE ?AUTO_10347 ?AUTO_10346 ?AUTO_10345 ) ( VISIBLE ?AUTO_10346 ?AUTO_10345 ) ( not ( = ?AUTO_10351 ?AUTO_10346 ) ) ( not ( = ?AUTO_10348 ?AUTO_10346 ) ) ( not ( = ?AUTO_10345 ?AUTO_10346 ) ) ( CAN_TRAVERSE ?AUTO_10347 ?AUTO_10344 ?AUTO_10346 ) ( AT ?AUTO_10347 ?AUTO_10344 ) ( VISIBLE ?AUTO_10344 ?AUTO_10346 ) ( not ( = ?AUTO_10351 ?AUTO_10344 ) ) ( not ( = ?AUTO_10348 ?AUTO_10344 ) ) ( not ( = ?AUTO_10345 ?AUTO_10344 ) ) ( not ( = ?AUTO_10346 ?AUTO_10344 ) ) ( ON_BOARD ?AUTO_10350 ?AUTO_10347 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10347 ) ( SUPPORTS ?AUTO_10350 ?AUTO_10343 ) ( VISIBLE_FROM ?AUTO_10342 ?AUTO_10344 ) ( CALIBRATION_TARGET ?AUTO_10350 ?AUTO_10342 ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_10347 ?AUTO_10350 ?AUTO_10342 ?AUTO_10344 )
      ( GET_IMAGE_DATA ?AUTO_10342 ?AUTO_10343 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10342 ?AUTO_10343 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10352 - OBJECTIVE
      ?AUTO_10353 - MODE
    )
    :vars
    (
      ?AUTO_10358 - LANDER
      ?AUTO_10355 - WAYPOINT
      ?AUTO_10360 - WAYPOINT
      ?AUTO_10359 - ROVER
      ?AUTO_10356 - WAYPOINT
      ?AUTO_10361 - WAYPOINT
      ?AUTO_10354 - WAYPOINT
      ?AUTO_10357 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10358 ?AUTO_10355 ) ( VISIBLE ?AUTO_10360 ?AUTO_10355 ) ( AVAILABLE ?AUTO_10359 ) ( CHANNEL_FREE ?AUTO_10358 ) ( not ( = ?AUTO_10360 ?AUTO_10355 ) ) ( CAN_TRAVERSE ?AUTO_10359 ?AUTO_10356 ?AUTO_10360 ) ( VISIBLE ?AUTO_10356 ?AUTO_10360 ) ( not ( = ?AUTO_10355 ?AUTO_10356 ) ) ( not ( = ?AUTO_10360 ?AUTO_10356 ) ) ( CAN_TRAVERSE ?AUTO_10359 ?AUTO_10361 ?AUTO_10356 ) ( VISIBLE ?AUTO_10361 ?AUTO_10356 ) ( not ( = ?AUTO_10355 ?AUTO_10361 ) ) ( not ( = ?AUTO_10360 ?AUTO_10361 ) ) ( not ( = ?AUTO_10356 ?AUTO_10361 ) ) ( CAN_TRAVERSE ?AUTO_10359 ?AUTO_10354 ?AUTO_10361 ) ( VISIBLE ?AUTO_10354 ?AUTO_10361 ) ( not ( = ?AUTO_10355 ?AUTO_10354 ) ) ( not ( = ?AUTO_10360 ?AUTO_10354 ) ) ( not ( = ?AUTO_10356 ?AUTO_10354 ) ) ( not ( = ?AUTO_10361 ?AUTO_10354 ) ) ( ON_BOARD ?AUTO_10357 ?AUTO_10359 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10359 ) ( SUPPORTS ?AUTO_10357 ?AUTO_10353 ) ( VISIBLE_FROM ?AUTO_10352 ?AUTO_10354 ) ( CALIBRATION_TARGET ?AUTO_10357 ?AUTO_10352 ) ( CAN_TRAVERSE ?AUTO_10359 ?AUTO_10361 ?AUTO_10354 ) ( AT ?AUTO_10359 ?AUTO_10361 ) ( VISIBLE ?AUTO_10361 ?AUTO_10354 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10359 ?AUTO_10361 ?AUTO_10354 )
      ( GET_IMAGE_DATA ?AUTO_10352 ?AUTO_10353 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10352 ?AUTO_10353 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10362 - OBJECTIVE
      ?AUTO_10363 - MODE
    )
    :vars
    (
      ?AUTO_10365 - LANDER
      ?AUTO_10367 - WAYPOINT
      ?AUTO_10369 - WAYPOINT
      ?AUTO_10364 - ROVER
      ?AUTO_10371 - WAYPOINT
      ?AUTO_10368 - WAYPOINT
      ?AUTO_10370 - WAYPOINT
      ?AUTO_10366 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10365 ?AUTO_10367 ) ( VISIBLE ?AUTO_10369 ?AUTO_10367 ) ( AVAILABLE ?AUTO_10364 ) ( CHANNEL_FREE ?AUTO_10365 ) ( not ( = ?AUTO_10369 ?AUTO_10367 ) ) ( CAN_TRAVERSE ?AUTO_10364 ?AUTO_10371 ?AUTO_10369 ) ( VISIBLE ?AUTO_10371 ?AUTO_10369 ) ( not ( = ?AUTO_10367 ?AUTO_10371 ) ) ( not ( = ?AUTO_10369 ?AUTO_10371 ) ) ( CAN_TRAVERSE ?AUTO_10364 ?AUTO_10368 ?AUTO_10371 ) ( VISIBLE ?AUTO_10368 ?AUTO_10371 ) ( not ( = ?AUTO_10367 ?AUTO_10368 ) ) ( not ( = ?AUTO_10369 ?AUTO_10368 ) ) ( not ( = ?AUTO_10371 ?AUTO_10368 ) ) ( CAN_TRAVERSE ?AUTO_10364 ?AUTO_10370 ?AUTO_10368 ) ( VISIBLE ?AUTO_10370 ?AUTO_10368 ) ( not ( = ?AUTO_10367 ?AUTO_10370 ) ) ( not ( = ?AUTO_10369 ?AUTO_10370 ) ) ( not ( = ?AUTO_10371 ?AUTO_10370 ) ) ( not ( = ?AUTO_10368 ?AUTO_10370 ) ) ( ON_BOARD ?AUTO_10366 ?AUTO_10364 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10364 ) ( SUPPORTS ?AUTO_10366 ?AUTO_10363 ) ( VISIBLE_FROM ?AUTO_10362 ?AUTO_10370 ) ( CALIBRATION_TARGET ?AUTO_10366 ?AUTO_10362 ) ( CAN_TRAVERSE ?AUTO_10364 ?AUTO_10368 ?AUTO_10370 ) ( VISIBLE ?AUTO_10368 ?AUTO_10370 ) ( CAN_TRAVERSE ?AUTO_10364 ?AUTO_10369 ?AUTO_10368 ) ( AT ?AUTO_10364 ?AUTO_10369 ) ( VISIBLE ?AUTO_10369 ?AUTO_10368 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10364 ?AUTO_10369 ?AUTO_10368 )
      ( GET_IMAGE_DATA ?AUTO_10362 ?AUTO_10363 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10362 ?AUTO_10363 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10400 - OBJECTIVE
      ?AUTO_10401 - MODE
    )
    :vars
    (
      ?AUTO_10405 - LANDER
      ?AUTO_10408 - WAYPOINT
      ?AUTO_10406 - WAYPOINT
      ?AUTO_10409 - ROVER
      ?AUTO_10404 - WAYPOINT
      ?AUTO_10403 - WAYPOINT
      ?AUTO_10407 - WAYPOINT
      ?AUTO_10402 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10405 ?AUTO_10408 ) ( VISIBLE ?AUTO_10406 ?AUTO_10408 ) ( AVAILABLE ?AUTO_10409 ) ( CHANNEL_FREE ?AUTO_10405 ) ( not ( = ?AUTO_10406 ?AUTO_10408 ) ) ( CAN_TRAVERSE ?AUTO_10409 ?AUTO_10404 ?AUTO_10406 ) ( VISIBLE ?AUTO_10404 ?AUTO_10406 ) ( not ( = ?AUTO_10408 ?AUTO_10404 ) ) ( not ( = ?AUTO_10406 ?AUTO_10404 ) ) ( CAN_TRAVERSE ?AUTO_10409 ?AUTO_10403 ?AUTO_10404 ) ( VISIBLE ?AUTO_10403 ?AUTO_10404 ) ( not ( = ?AUTO_10408 ?AUTO_10403 ) ) ( not ( = ?AUTO_10406 ?AUTO_10403 ) ) ( not ( = ?AUTO_10404 ?AUTO_10403 ) ) ( CAN_TRAVERSE ?AUTO_10409 ?AUTO_10407 ?AUTO_10403 ) ( VISIBLE ?AUTO_10407 ?AUTO_10403 ) ( not ( = ?AUTO_10408 ?AUTO_10407 ) ) ( not ( = ?AUTO_10406 ?AUTO_10407 ) ) ( not ( = ?AUTO_10404 ?AUTO_10407 ) ) ( not ( = ?AUTO_10403 ?AUTO_10407 ) ) ( ON_BOARD ?AUTO_10402 ?AUTO_10409 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10409 ) ( SUPPORTS ?AUTO_10402 ?AUTO_10401 ) ( VISIBLE_FROM ?AUTO_10400 ?AUTO_10407 ) ( CALIBRATION_TARGET ?AUTO_10402 ?AUTO_10400 ) ( CAN_TRAVERSE ?AUTO_10409 ?AUTO_10403 ?AUTO_10407 ) ( VISIBLE ?AUTO_10403 ?AUTO_10407 ) ( CAN_TRAVERSE ?AUTO_10409 ?AUTO_10406 ?AUTO_10403 ) ( VISIBLE ?AUTO_10406 ?AUTO_10403 ) ( AT ?AUTO_10409 ?AUTO_10404 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10409 ?AUTO_10404 ?AUTO_10406 )
      ( GET_IMAGE_DATA ?AUTO_10400 ?AUTO_10401 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10400 ?AUTO_10401 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10523 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10527 - LANDER
      ?AUTO_10525 - WAYPOINT
      ?AUTO_10528 - ROVER
      ?AUTO_10526 - STORE
      ?AUTO_10524 - WAYPOINT
      ?AUTO_10529 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10527 ?AUTO_10523 ) ( VISIBLE ?AUTO_10525 ?AUTO_10523 ) ( AVAILABLE ?AUTO_10528 ) ( CHANNEL_FREE ?AUTO_10527 ) ( not ( = ?AUTO_10523 ?AUTO_10525 ) ) ( CAN_TRAVERSE ?AUTO_10528 ?AUTO_10523 ?AUTO_10525 ) ( VISIBLE ?AUTO_10523 ?AUTO_10525 ) ( AT_SOIL_SAMPLE ?AUTO_10523 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10528 ) ( STORE_OF ?AUTO_10526 ?AUTO_10528 ) ( EMPTY ?AUTO_10526 ) ( CAN_TRAVERSE ?AUTO_10528 ?AUTO_10525 ?AUTO_10523 ) ( CAN_TRAVERSE ?AUTO_10528 ?AUTO_10524 ?AUTO_10525 ) ( VISIBLE ?AUTO_10524 ?AUTO_10525 ) ( not ( = ?AUTO_10523 ?AUTO_10524 ) ) ( not ( = ?AUTO_10525 ?AUTO_10524 ) ) ( CAN_TRAVERSE ?AUTO_10528 ?AUTO_10529 ?AUTO_10524 ) ( AT ?AUTO_10528 ?AUTO_10529 ) ( VISIBLE ?AUTO_10529 ?AUTO_10524 ) ( not ( = ?AUTO_10523 ?AUTO_10529 ) ) ( not ( = ?AUTO_10525 ?AUTO_10529 ) ) ( not ( = ?AUTO_10524 ?AUTO_10529 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10528 ?AUTO_10529 ?AUTO_10524 )
      ( GET_SOIL_DATA ?AUTO_10523 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10523 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_10572 - OBJECTIVE
      ?AUTO_10573 - MODE
    )
    :vars
    (
      ?AUTO_10575 - LANDER
      ?AUTO_10574 - WAYPOINT
      ?AUTO_10579 - WAYPOINT
      ?AUTO_10576 - ROVER
      ?AUTO_10580 - WAYPOINT
      ?AUTO_10581 - CAMERA
      ?AUTO_10577 - WAYPOINT
      ?AUTO_10578 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10575 ?AUTO_10574 ) ( VISIBLE ?AUTO_10579 ?AUTO_10574 ) ( AVAILABLE ?AUTO_10576 ) ( CHANNEL_FREE ?AUTO_10575 ) ( not ( = ?AUTO_10579 ?AUTO_10574 ) ) ( CAN_TRAVERSE ?AUTO_10576 ?AUTO_10580 ?AUTO_10579 ) ( VISIBLE ?AUTO_10580 ?AUTO_10579 ) ( not ( = ?AUTO_10574 ?AUTO_10580 ) ) ( not ( = ?AUTO_10579 ?AUTO_10580 ) ) ( ON_BOARD ?AUTO_10581 ?AUTO_10576 ) ( EQUIPPED_FOR_IMAGING ?AUTO_10576 ) ( SUPPORTS ?AUTO_10581 ?AUTO_10573 ) ( VISIBLE_FROM ?AUTO_10572 ?AUTO_10580 ) ( CAN_TRAVERSE ?AUTO_10576 ?AUTO_10577 ?AUTO_10580 ) ( VISIBLE ?AUTO_10577 ?AUTO_10580 ) ( not ( = ?AUTO_10574 ?AUTO_10577 ) ) ( not ( = ?AUTO_10579 ?AUTO_10577 ) ) ( not ( = ?AUTO_10580 ?AUTO_10577 ) ) ( CALIBRATION_TARGET ?AUTO_10581 ?AUTO_10578 ) ( VISIBLE_FROM ?AUTO_10578 ?AUTO_10577 ) ( not ( = ?AUTO_10572 ?AUTO_10578 ) ) ( CAN_TRAVERSE ?AUTO_10576 ?AUTO_10580 ?AUTO_10577 ) ( AT ?AUTO_10576 ?AUTO_10580 ) ( VISIBLE ?AUTO_10580 ?AUTO_10577 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10576 ?AUTO_10580 ?AUTO_10577 )
      ( GET_IMAGE_DATA ?AUTO_10572 ?AUTO_10573 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_10572 ?AUTO_10573 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10793 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10797 - LANDER
      ?AUTO_10796 - WAYPOINT
      ?AUTO_10799 - WAYPOINT
      ?AUTO_10795 - ROVER
      ?AUTO_10794 - STORE
      ?AUTO_10800 - WAYPOINT
      ?AUTO_10798 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10797 ?AUTO_10796 ) ( VISIBLE ?AUTO_10799 ?AUTO_10796 ) ( AVAILABLE ?AUTO_10795 ) ( CHANNEL_FREE ?AUTO_10797 ) ( not ( = ?AUTO_10793 ?AUTO_10799 ) ) ( not ( = ?AUTO_10793 ?AUTO_10796 ) ) ( not ( = ?AUTO_10799 ?AUTO_10796 ) ) ( CAN_TRAVERSE ?AUTO_10795 ?AUTO_10793 ?AUTO_10799 ) ( VISIBLE ?AUTO_10793 ?AUTO_10799 ) ( AT_SOIL_SAMPLE ?AUTO_10793 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10795 ) ( STORE_OF ?AUTO_10794 ?AUTO_10795 ) ( EMPTY ?AUTO_10794 ) ( CAN_TRAVERSE ?AUTO_10795 ?AUTO_10800 ?AUTO_10793 ) ( VISIBLE ?AUTO_10800 ?AUTO_10793 ) ( not ( = ?AUTO_10793 ?AUTO_10800 ) ) ( not ( = ?AUTO_10796 ?AUTO_10800 ) ) ( not ( = ?AUTO_10799 ?AUTO_10800 ) ) ( CAN_TRAVERSE ?AUTO_10795 ?AUTO_10798 ?AUTO_10800 ) ( VISIBLE ?AUTO_10798 ?AUTO_10800 ) ( not ( = ?AUTO_10793 ?AUTO_10798 ) ) ( not ( = ?AUTO_10796 ?AUTO_10798 ) ) ( not ( = ?AUTO_10799 ?AUTO_10798 ) ) ( not ( = ?AUTO_10800 ?AUTO_10798 ) ) ( CAN_TRAVERSE ?AUTO_10795 ?AUTO_10799 ?AUTO_10798 ) ( AT ?AUTO_10795 ?AUTO_10799 ) ( VISIBLE ?AUTO_10799 ?AUTO_10798 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10795 ?AUTO_10799 ?AUTO_10798 )
      ( GET_SOIL_DATA ?AUTO_10793 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10793 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10802 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10806 - LANDER
      ?AUTO_10808 - WAYPOINT
      ?AUTO_10807 - WAYPOINT
      ?AUTO_10804 - ROVER
      ?AUTO_10809 - STORE
      ?AUTO_10805 - WAYPOINT
      ?AUTO_10803 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10806 ?AUTO_10808 ) ( VISIBLE ?AUTO_10807 ?AUTO_10808 ) ( AVAILABLE ?AUTO_10804 ) ( CHANNEL_FREE ?AUTO_10806 ) ( not ( = ?AUTO_10802 ?AUTO_10807 ) ) ( not ( = ?AUTO_10802 ?AUTO_10808 ) ) ( not ( = ?AUTO_10807 ?AUTO_10808 ) ) ( CAN_TRAVERSE ?AUTO_10804 ?AUTO_10802 ?AUTO_10807 ) ( VISIBLE ?AUTO_10802 ?AUTO_10807 ) ( AT_SOIL_SAMPLE ?AUTO_10802 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10804 ) ( STORE_OF ?AUTO_10809 ?AUTO_10804 ) ( EMPTY ?AUTO_10809 ) ( CAN_TRAVERSE ?AUTO_10804 ?AUTO_10805 ?AUTO_10802 ) ( VISIBLE ?AUTO_10805 ?AUTO_10802 ) ( not ( = ?AUTO_10802 ?AUTO_10805 ) ) ( not ( = ?AUTO_10808 ?AUTO_10805 ) ) ( not ( = ?AUTO_10807 ?AUTO_10805 ) ) ( CAN_TRAVERSE ?AUTO_10804 ?AUTO_10803 ?AUTO_10805 ) ( VISIBLE ?AUTO_10803 ?AUTO_10805 ) ( not ( = ?AUTO_10802 ?AUTO_10803 ) ) ( not ( = ?AUTO_10808 ?AUTO_10803 ) ) ( not ( = ?AUTO_10807 ?AUTO_10803 ) ) ( not ( = ?AUTO_10805 ?AUTO_10803 ) ) ( CAN_TRAVERSE ?AUTO_10804 ?AUTO_10807 ?AUTO_10803 ) ( VISIBLE ?AUTO_10807 ?AUTO_10803 ) ( CAN_TRAVERSE ?AUTO_10804 ?AUTO_10808 ?AUTO_10807 ) ( AT ?AUTO_10804 ?AUTO_10808 ) ( VISIBLE ?AUTO_10808 ?AUTO_10807 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10804 ?AUTO_10808 ?AUTO_10807 )
      ( GET_SOIL_DATA ?AUTO_10802 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10802 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10810 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10817 - LANDER
      ?AUTO_10811 - WAYPOINT
      ?AUTO_10813 - WAYPOINT
      ?AUTO_10815 - ROVER
      ?AUTO_10812 - STORE
      ?AUTO_10814 - WAYPOINT
      ?AUTO_10816 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10817 ?AUTO_10811 ) ( VISIBLE ?AUTO_10813 ?AUTO_10811 ) ( AVAILABLE ?AUTO_10815 ) ( CHANNEL_FREE ?AUTO_10817 ) ( not ( = ?AUTO_10810 ?AUTO_10813 ) ) ( not ( = ?AUTO_10810 ?AUTO_10811 ) ) ( not ( = ?AUTO_10813 ?AUTO_10811 ) ) ( CAN_TRAVERSE ?AUTO_10815 ?AUTO_10810 ?AUTO_10813 ) ( VISIBLE ?AUTO_10810 ?AUTO_10813 ) ( AT_SOIL_SAMPLE ?AUTO_10810 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10815 ) ( STORE_OF ?AUTO_10812 ?AUTO_10815 ) ( CAN_TRAVERSE ?AUTO_10815 ?AUTO_10814 ?AUTO_10810 ) ( VISIBLE ?AUTO_10814 ?AUTO_10810 ) ( not ( = ?AUTO_10810 ?AUTO_10814 ) ) ( not ( = ?AUTO_10811 ?AUTO_10814 ) ) ( not ( = ?AUTO_10813 ?AUTO_10814 ) ) ( CAN_TRAVERSE ?AUTO_10815 ?AUTO_10816 ?AUTO_10814 ) ( VISIBLE ?AUTO_10816 ?AUTO_10814 ) ( not ( = ?AUTO_10810 ?AUTO_10816 ) ) ( not ( = ?AUTO_10811 ?AUTO_10816 ) ) ( not ( = ?AUTO_10813 ?AUTO_10816 ) ) ( not ( = ?AUTO_10814 ?AUTO_10816 ) ) ( CAN_TRAVERSE ?AUTO_10815 ?AUTO_10813 ?AUTO_10816 ) ( VISIBLE ?AUTO_10813 ?AUTO_10816 ) ( CAN_TRAVERSE ?AUTO_10815 ?AUTO_10811 ?AUTO_10813 ) ( AT ?AUTO_10815 ?AUTO_10811 ) ( VISIBLE ?AUTO_10811 ?AUTO_10813 ) ( FULL ?AUTO_10812 ) )
    :subtasks
    ( ( !DROP ?AUTO_10815 ?AUTO_10812 )
      ( GET_SOIL_DATA ?AUTO_10810 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10810 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_10822 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10828 - LANDER
      ?AUTO_10823 - WAYPOINT
      ?AUTO_10829 - WAYPOINT
      ?AUTO_10826 - ROVER
      ?AUTO_10825 - STORE
      ?AUTO_10827 - WAYPOINT
      ?AUTO_10824 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10828 ?AUTO_10823 ) ( VISIBLE ?AUTO_10829 ?AUTO_10823 ) ( AVAILABLE ?AUTO_10826 ) ( CHANNEL_FREE ?AUTO_10828 ) ( not ( = ?AUTO_10822 ?AUTO_10829 ) ) ( not ( = ?AUTO_10822 ?AUTO_10823 ) ) ( not ( = ?AUTO_10829 ?AUTO_10823 ) ) ( CAN_TRAVERSE ?AUTO_10826 ?AUTO_10822 ?AUTO_10829 ) ( VISIBLE ?AUTO_10822 ?AUTO_10829 ) ( AT_SOIL_SAMPLE ?AUTO_10822 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_10826 ) ( STORE_OF ?AUTO_10825 ?AUTO_10826 ) ( CAN_TRAVERSE ?AUTO_10826 ?AUTO_10827 ?AUTO_10822 ) ( VISIBLE ?AUTO_10827 ?AUTO_10822 ) ( not ( = ?AUTO_10822 ?AUTO_10827 ) ) ( not ( = ?AUTO_10823 ?AUTO_10827 ) ) ( not ( = ?AUTO_10829 ?AUTO_10827 ) ) ( CAN_TRAVERSE ?AUTO_10826 ?AUTO_10824 ?AUTO_10827 ) ( AT ?AUTO_10826 ?AUTO_10824 ) ( VISIBLE ?AUTO_10824 ?AUTO_10827 ) ( not ( = ?AUTO_10822 ?AUTO_10824 ) ) ( not ( = ?AUTO_10823 ?AUTO_10824 ) ) ( not ( = ?AUTO_10829 ?AUTO_10824 ) ) ( not ( = ?AUTO_10827 ?AUTO_10824 ) ) ( FULL ?AUTO_10825 ) )
    :subtasks
    ( ( !DROP ?AUTO_10826 ?AUTO_10825 )
      ( GET_SOIL_DATA ?AUTO_10822 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_10822 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10901 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10902 - LANDER
      ?AUTO_10904 - WAYPOINT
      ?AUTO_10908 - WAYPOINT
      ?AUTO_10903 - ROVER
      ?AUTO_10905 - STORE
      ?AUTO_10906 - WAYPOINT
      ?AUTO_10907 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10902 ?AUTO_10904 ) ( VISIBLE ?AUTO_10908 ?AUTO_10904 ) ( AVAILABLE ?AUTO_10903 ) ( CHANNEL_FREE ?AUTO_10902 ) ( not ( = ?AUTO_10901 ?AUTO_10908 ) ) ( not ( = ?AUTO_10901 ?AUTO_10904 ) ) ( not ( = ?AUTO_10908 ?AUTO_10904 ) ) ( CAN_TRAVERSE ?AUTO_10903 ?AUTO_10901 ?AUTO_10908 ) ( VISIBLE ?AUTO_10901 ?AUTO_10908 ) ( AT_ROCK_SAMPLE ?AUTO_10901 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10903 ) ( STORE_OF ?AUTO_10905 ?AUTO_10903 ) ( EMPTY ?AUTO_10905 ) ( CAN_TRAVERSE ?AUTO_10903 ?AUTO_10906 ?AUTO_10901 ) ( VISIBLE ?AUTO_10906 ?AUTO_10901 ) ( not ( = ?AUTO_10901 ?AUTO_10906 ) ) ( not ( = ?AUTO_10904 ?AUTO_10906 ) ) ( not ( = ?AUTO_10908 ?AUTO_10906 ) ) ( CAN_TRAVERSE ?AUTO_10903 ?AUTO_10907 ?AUTO_10906 ) ( VISIBLE ?AUTO_10907 ?AUTO_10906 ) ( not ( = ?AUTO_10901 ?AUTO_10907 ) ) ( not ( = ?AUTO_10904 ?AUTO_10907 ) ) ( not ( = ?AUTO_10908 ?AUTO_10907 ) ) ( not ( = ?AUTO_10906 ?AUTO_10907 ) ) ( CAN_TRAVERSE ?AUTO_10903 ?AUTO_10908 ?AUTO_10907 ) ( VISIBLE ?AUTO_10908 ?AUTO_10907 ) ( CAN_TRAVERSE ?AUTO_10903 ?AUTO_10904 ?AUTO_10908 ) ( AT ?AUTO_10903 ?AUTO_10904 ) ( VISIBLE ?AUTO_10904 ?AUTO_10908 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_10903 ?AUTO_10904 ?AUTO_10908 )
      ( GET_ROCK_DATA ?AUTO_10901 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10901 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_10909 - WAYPOINT
    )
    :vars
    (
      ?AUTO_10911 - LANDER
      ?AUTO_10915 - WAYPOINT
      ?AUTO_10914 - WAYPOINT
      ?AUTO_10912 - ROVER
      ?AUTO_10916 - STORE
      ?AUTO_10913 - WAYPOINT
      ?AUTO_10910 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_10911 ?AUTO_10915 ) ( VISIBLE ?AUTO_10914 ?AUTO_10915 ) ( AVAILABLE ?AUTO_10912 ) ( CHANNEL_FREE ?AUTO_10911 ) ( not ( = ?AUTO_10909 ?AUTO_10914 ) ) ( not ( = ?AUTO_10909 ?AUTO_10915 ) ) ( not ( = ?AUTO_10914 ?AUTO_10915 ) ) ( CAN_TRAVERSE ?AUTO_10912 ?AUTO_10909 ?AUTO_10914 ) ( VISIBLE ?AUTO_10909 ?AUTO_10914 ) ( AT_ROCK_SAMPLE ?AUTO_10909 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_10912 ) ( STORE_OF ?AUTO_10916 ?AUTO_10912 ) ( CAN_TRAVERSE ?AUTO_10912 ?AUTO_10913 ?AUTO_10909 ) ( VISIBLE ?AUTO_10913 ?AUTO_10909 ) ( not ( = ?AUTO_10909 ?AUTO_10913 ) ) ( not ( = ?AUTO_10915 ?AUTO_10913 ) ) ( not ( = ?AUTO_10914 ?AUTO_10913 ) ) ( CAN_TRAVERSE ?AUTO_10912 ?AUTO_10910 ?AUTO_10913 ) ( VISIBLE ?AUTO_10910 ?AUTO_10913 ) ( not ( = ?AUTO_10909 ?AUTO_10910 ) ) ( not ( = ?AUTO_10915 ?AUTO_10910 ) ) ( not ( = ?AUTO_10914 ?AUTO_10910 ) ) ( not ( = ?AUTO_10913 ?AUTO_10910 ) ) ( CAN_TRAVERSE ?AUTO_10912 ?AUTO_10914 ?AUTO_10910 ) ( VISIBLE ?AUTO_10914 ?AUTO_10910 ) ( CAN_TRAVERSE ?AUTO_10912 ?AUTO_10915 ?AUTO_10914 ) ( AT ?AUTO_10912 ?AUTO_10915 ) ( VISIBLE ?AUTO_10915 ?AUTO_10914 ) ( FULL ?AUTO_10916 ) )
    :subtasks
    ( ( !DROP ?AUTO_10912 ?AUTO_10916 )
      ( GET_ROCK_DATA ?AUTO_10909 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_10909 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11099 - OBJECTIVE
      ?AUTO_11100 - MODE
    )
    :vars
    (
      ?AUTO_11101 - LANDER
      ?AUTO_11104 - WAYPOINT
      ?AUTO_11107 - WAYPOINT
      ?AUTO_11108 - ROVER
      ?AUTO_11102 - WAYPOINT
      ?AUTO_11103 - CAMERA
      ?AUTO_11105 - OBJECTIVE
      ?AUTO_11106 - WAYPOINT
      ?AUTO_11109 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11101 ?AUTO_11104 ) ( VISIBLE ?AUTO_11107 ?AUTO_11104 ) ( AVAILABLE ?AUTO_11108 ) ( CHANNEL_FREE ?AUTO_11101 ) ( not ( = ?AUTO_11107 ?AUTO_11104 ) ) ( CAN_TRAVERSE ?AUTO_11108 ?AUTO_11102 ?AUTO_11107 ) ( VISIBLE ?AUTO_11102 ?AUTO_11107 ) ( not ( = ?AUTO_11104 ?AUTO_11102 ) ) ( not ( = ?AUTO_11107 ?AUTO_11102 ) ) ( ON_BOARD ?AUTO_11103 ?AUTO_11108 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11108 ) ( SUPPORTS ?AUTO_11103 ?AUTO_11100 ) ( VISIBLE_FROM ?AUTO_11099 ?AUTO_11102 ) ( CALIBRATION_TARGET ?AUTO_11103 ?AUTO_11105 ) ( VISIBLE_FROM ?AUTO_11105 ?AUTO_11102 ) ( not ( = ?AUTO_11099 ?AUTO_11105 ) ) ( CAN_TRAVERSE ?AUTO_11108 ?AUTO_11106 ?AUTO_11102 ) ( VISIBLE ?AUTO_11106 ?AUTO_11102 ) ( not ( = ?AUTO_11104 ?AUTO_11106 ) ) ( not ( = ?AUTO_11107 ?AUTO_11106 ) ) ( not ( = ?AUTO_11102 ?AUTO_11106 ) ) ( CAN_TRAVERSE ?AUTO_11108 ?AUTO_11109 ?AUTO_11106 ) ( AT ?AUTO_11108 ?AUTO_11109 ) ( VISIBLE ?AUTO_11109 ?AUTO_11106 ) ( not ( = ?AUTO_11104 ?AUTO_11109 ) ) ( not ( = ?AUTO_11107 ?AUTO_11109 ) ) ( not ( = ?AUTO_11102 ?AUTO_11109 ) ) ( not ( = ?AUTO_11106 ?AUTO_11109 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11108 ?AUTO_11109 ?AUTO_11106 )
      ( GET_IMAGE_DATA ?AUTO_11099 ?AUTO_11100 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11099 ?AUTO_11100 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11116 - OBJECTIVE
      ?AUTO_11117 - MODE
    )
    :vars
    (
      ?AUTO_11122 - LANDER
      ?AUTO_11125 - WAYPOINT
      ?AUTO_11126 - WAYPOINT
      ?AUTO_11121 - ROVER
      ?AUTO_11123 - WAYPOINT
      ?AUTO_11119 - CAMERA
      ?AUTO_11120 - OBJECTIVE
      ?AUTO_11118 - WAYPOINT
      ?AUTO_11124 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11122 ?AUTO_11125 ) ( VISIBLE ?AUTO_11126 ?AUTO_11125 ) ( AVAILABLE ?AUTO_11121 ) ( CHANNEL_FREE ?AUTO_11122 ) ( not ( = ?AUTO_11126 ?AUTO_11125 ) ) ( CAN_TRAVERSE ?AUTO_11121 ?AUTO_11123 ?AUTO_11126 ) ( VISIBLE ?AUTO_11123 ?AUTO_11126 ) ( not ( = ?AUTO_11125 ?AUTO_11123 ) ) ( not ( = ?AUTO_11126 ?AUTO_11123 ) ) ( ON_BOARD ?AUTO_11119 ?AUTO_11121 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11121 ) ( SUPPORTS ?AUTO_11119 ?AUTO_11117 ) ( VISIBLE_FROM ?AUTO_11116 ?AUTO_11123 ) ( CALIBRATION_TARGET ?AUTO_11119 ?AUTO_11120 ) ( VISIBLE_FROM ?AUTO_11120 ?AUTO_11123 ) ( not ( = ?AUTO_11116 ?AUTO_11120 ) ) ( CAN_TRAVERSE ?AUTO_11121 ?AUTO_11118 ?AUTO_11123 ) ( VISIBLE ?AUTO_11118 ?AUTO_11123 ) ( not ( = ?AUTO_11125 ?AUTO_11118 ) ) ( not ( = ?AUTO_11126 ?AUTO_11118 ) ) ( not ( = ?AUTO_11123 ?AUTO_11118 ) ) ( CAN_TRAVERSE ?AUTO_11121 ?AUTO_11124 ?AUTO_11118 ) ( VISIBLE ?AUTO_11124 ?AUTO_11118 ) ( not ( = ?AUTO_11125 ?AUTO_11124 ) ) ( not ( = ?AUTO_11126 ?AUTO_11124 ) ) ( not ( = ?AUTO_11123 ?AUTO_11124 ) ) ( not ( = ?AUTO_11118 ?AUTO_11124 ) ) ( CAN_TRAVERSE ?AUTO_11121 ?AUTO_11125 ?AUTO_11124 ) ( AT ?AUTO_11121 ?AUTO_11125 ) ( VISIBLE ?AUTO_11125 ?AUTO_11124 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11121 ?AUTO_11125 ?AUTO_11124 )
      ( GET_IMAGE_DATA ?AUTO_11116 ?AUTO_11117 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11116 ?AUTO_11117 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11176 - OBJECTIVE
      ?AUTO_11177 - MODE
    )
    :vars
    (
      ?AUTO_11181 - LANDER
      ?AUTO_11182 - WAYPOINT
      ?AUTO_11179 - WAYPOINT
      ?AUTO_11184 - ROVER
      ?AUTO_11183 - WAYPOINT
      ?AUTO_11178 - CAMERA
      ?AUTO_11180 - WAYPOINT
      ?AUTO_11185 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11181 ?AUTO_11182 ) ( VISIBLE ?AUTO_11179 ?AUTO_11182 ) ( AVAILABLE ?AUTO_11184 ) ( CHANNEL_FREE ?AUTO_11181 ) ( not ( = ?AUTO_11179 ?AUTO_11182 ) ) ( CAN_TRAVERSE ?AUTO_11184 ?AUTO_11183 ?AUTO_11179 ) ( VISIBLE ?AUTO_11183 ?AUTO_11179 ) ( not ( = ?AUTO_11182 ?AUTO_11183 ) ) ( not ( = ?AUTO_11179 ?AUTO_11183 ) ) ( ON_BOARD ?AUTO_11178 ?AUTO_11184 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11184 ) ( SUPPORTS ?AUTO_11178 ?AUTO_11177 ) ( VISIBLE_FROM ?AUTO_11176 ?AUTO_11183 ) ( CALIBRATION_TARGET ?AUTO_11178 ?AUTO_11176 ) ( CAN_TRAVERSE ?AUTO_11184 ?AUTO_11180 ?AUTO_11183 ) ( VISIBLE ?AUTO_11180 ?AUTO_11183 ) ( not ( = ?AUTO_11182 ?AUTO_11180 ) ) ( not ( = ?AUTO_11179 ?AUTO_11180 ) ) ( not ( = ?AUTO_11183 ?AUTO_11180 ) ) ( CAN_TRAVERSE ?AUTO_11184 ?AUTO_11185 ?AUTO_11180 ) ( AT ?AUTO_11184 ?AUTO_11185 ) ( VISIBLE ?AUTO_11185 ?AUTO_11180 ) ( not ( = ?AUTO_11182 ?AUTO_11185 ) ) ( not ( = ?AUTO_11179 ?AUTO_11185 ) ) ( not ( = ?AUTO_11183 ?AUTO_11185 ) ) ( not ( = ?AUTO_11180 ?AUTO_11185 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11184 ?AUTO_11185 ?AUTO_11180 )
      ( GET_IMAGE_DATA ?AUTO_11176 ?AUTO_11177 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11176 ?AUTO_11177 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11192 - OBJECTIVE
      ?AUTO_11193 - MODE
    )
    :vars
    (
      ?AUTO_11200 - LANDER
      ?AUTO_11199 - WAYPOINT
      ?AUTO_11196 - WAYPOINT
      ?AUTO_11195 - ROVER
      ?AUTO_11194 - WAYPOINT
      ?AUTO_11198 - CAMERA
      ?AUTO_11197 - WAYPOINT
      ?AUTO_11201 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11200 ?AUTO_11199 ) ( VISIBLE ?AUTO_11196 ?AUTO_11199 ) ( AVAILABLE ?AUTO_11195 ) ( CHANNEL_FREE ?AUTO_11200 ) ( not ( = ?AUTO_11196 ?AUTO_11199 ) ) ( CAN_TRAVERSE ?AUTO_11195 ?AUTO_11194 ?AUTO_11196 ) ( VISIBLE ?AUTO_11194 ?AUTO_11196 ) ( not ( = ?AUTO_11199 ?AUTO_11194 ) ) ( not ( = ?AUTO_11196 ?AUTO_11194 ) ) ( ON_BOARD ?AUTO_11198 ?AUTO_11195 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11195 ) ( SUPPORTS ?AUTO_11198 ?AUTO_11193 ) ( VISIBLE_FROM ?AUTO_11192 ?AUTO_11194 ) ( CALIBRATION_TARGET ?AUTO_11198 ?AUTO_11192 ) ( CAN_TRAVERSE ?AUTO_11195 ?AUTO_11197 ?AUTO_11194 ) ( VISIBLE ?AUTO_11197 ?AUTO_11194 ) ( not ( = ?AUTO_11199 ?AUTO_11197 ) ) ( not ( = ?AUTO_11196 ?AUTO_11197 ) ) ( not ( = ?AUTO_11194 ?AUTO_11197 ) ) ( CAN_TRAVERSE ?AUTO_11195 ?AUTO_11201 ?AUTO_11197 ) ( VISIBLE ?AUTO_11201 ?AUTO_11197 ) ( not ( = ?AUTO_11199 ?AUTO_11201 ) ) ( not ( = ?AUTO_11196 ?AUTO_11201 ) ) ( not ( = ?AUTO_11194 ?AUTO_11201 ) ) ( not ( = ?AUTO_11197 ?AUTO_11201 ) ) ( CAN_TRAVERSE ?AUTO_11195 ?AUTO_11199 ?AUTO_11201 ) ( AT ?AUTO_11195 ?AUTO_11199 ) ( VISIBLE ?AUTO_11199 ?AUTO_11201 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11195 ?AUTO_11199 ?AUTO_11201 )
      ( GET_IMAGE_DATA ?AUTO_11192 ?AUTO_11193 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11192 ?AUTO_11193 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11421 - OBJECTIVE
      ?AUTO_11422 - MODE
    )
    :vars
    (
      ?AUTO_11425 - LANDER
      ?AUTO_11427 - WAYPOINT
      ?AUTO_11424 - ROVER
      ?AUTO_11423 - WAYPOINT
      ?AUTO_11426 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11425 ?AUTO_11427 ) ( HAVE_IMAGE ?AUTO_11424 ?AUTO_11421 ?AUTO_11422 ) ( VISIBLE ?AUTO_11423 ?AUTO_11427 ) ( AVAILABLE ?AUTO_11424 ) ( CHANNEL_FREE ?AUTO_11425 ) ( not ( = ?AUTO_11423 ?AUTO_11427 ) ) ( CAN_TRAVERSE ?AUTO_11424 ?AUTO_11426 ?AUTO_11423 ) ( VISIBLE ?AUTO_11426 ?AUTO_11423 ) ( not ( = ?AUTO_11427 ?AUTO_11426 ) ) ( not ( = ?AUTO_11423 ?AUTO_11426 ) ) ( CAN_TRAVERSE ?AUTO_11424 ?AUTO_11427 ?AUTO_11426 ) ( AT ?AUTO_11424 ?AUTO_11427 ) ( VISIBLE ?AUTO_11427 ?AUTO_11426 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11424 ?AUTO_11427 ?AUTO_11426 )
      ( GET_IMAGE_DATA ?AUTO_11421 ?AUTO_11422 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11421 ?AUTO_11422 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11428 - OBJECTIVE
      ?AUTO_11429 - MODE
    )
    :vars
    (
      ?AUTO_11431 - LANDER
      ?AUTO_11432 - WAYPOINT
      ?AUTO_11433 - WAYPOINT
      ?AUTO_11430 - ROVER
      ?AUTO_11434 - WAYPOINT
      ?AUTO_11435 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11431 ?AUTO_11432 ) ( VISIBLE ?AUTO_11433 ?AUTO_11432 ) ( AVAILABLE ?AUTO_11430 ) ( CHANNEL_FREE ?AUTO_11431 ) ( not ( = ?AUTO_11433 ?AUTO_11432 ) ) ( CAN_TRAVERSE ?AUTO_11430 ?AUTO_11434 ?AUTO_11433 ) ( VISIBLE ?AUTO_11434 ?AUTO_11433 ) ( not ( = ?AUTO_11432 ?AUTO_11434 ) ) ( not ( = ?AUTO_11433 ?AUTO_11434 ) ) ( CAN_TRAVERSE ?AUTO_11430 ?AUTO_11432 ?AUTO_11434 ) ( AT ?AUTO_11430 ?AUTO_11432 ) ( VISIBLE ?AUTO_11432 ?AUTO_11434 ) ( CALIBRATED ?AUTO_11435 ?AUTO_11430 ) ( ON_BOARD ?AUTO_11435 ?AUTO_11430 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11430 ) ( SUPPORTS ?AUTO_11435 ?AUTO_11429 ) ( VISIBLE_FROM ?AUTO_11428 ?AUTO_11432 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?AUTO_11430 ?AUTO_11432 ?AUTO_11428 ?AUTO_11435 ?AUTO_11429 )
      ( GET_IMAGE_DATA ?AUTO_11428 ?AUTO_11429 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11428 ?AUTO_11429 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11436 - OBJECTIVE
      ?AUTO_11437 - MODE
    )
    :vars
    (
      ?AUTO_11439 - LANDER
      ?AUTO_11440 - WAYPOINT
      ?AUTO_11441 - WAYPOINT
      ?AUTO_11438 - ROVER
      ?AUTO_11442 - WAYPOINT
      ?AUTO_11443 - CAMERA
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11439 ?AUTO_11440 ) ( VISIBLE ?AUTO_11441 ?AUTO_11440 ) ( AVAILABLE ?AUTO_11438 ) ( CHANNEL_FREE ?AUTO_11439 ) ( not ( = ?AUTO_11441 ?AUTO_11440 ) ) ( CAN_TRAVERSE ?AUTO_11438 ?AUTO_11442 ?AUTO_11441 ) ( VISIBLE ?AUTO_11442 ?AUTO_11441 ) ( not ( = ?AUTO_11440 ?AUTO_11442 ) ) ( not ( = ?AUTO_11441 ?AUTO_11442 ) ) ( CAN_TRAVERSE ?AUTO_11438 ?AUTO_11440 ?AUTO_11442 ) ( VISIBLE ?AUTO_11440 ?AUTO_11442 ) ( CALIBRATED ?AUTO_11443 ?AUTO_11438 ) ( ON_BOARD ?AUTO_11443 ?AUTO_11438 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11438 ) ( SUPPORTS ?AUTO_11443 ?AUTO_11437 ) ( VISIBLE_FROM ?AUTO_11436 ?AUTO_11440 ) ( CAN_TRAVERSE ?AUTO_11438 ?AUTO_11441 ?AUTO_11440 ) ( AT ?AUTO_11438 ?AUTO_11441 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11438 ?AUTO_11441 ?AUTO_11440 )
      ( GET_IMAGE_DATA ?AUTO_11436 ?AUTO_11437 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11436 ?AUTO_11437 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11474 - OBJECTIVE
      ?AUTO_11475 - MODE
    )
    :vars
    (
      ?AUTO_11478 - LANDER
      ?AUTO_11481 - WAYPOINT
      ?AUTO_11477 - WAYPOINT
      ?AUTO_11479 - ROVER
      ?AUTO_11480 - WAYPOINT
      ?AUTO_11476 - CAMERA
      ?AUTO_11482 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11478 ?AUTO_11481 ) ( VISIBLE ?AUTO_11477 ?AUTO_11481 ) ( AVAILABLE ?AUTO_11479 ) ( CHANNEL_FREE ?AUTO_11478 ) ( not ( = ?AUTO_11477 ?AUTO_11481 ) ) ( CAN_TRAVERSE ?AUTO_11479 ?AUTO_11480 ?AUTO_11477 ) ( VISIBLE ?AUTO_11480 ?AUTO_11477 ) ( not ( = ?AUTO_11481 ?AUTO_11480 ) ) ( not ( = ?AUTO_11477 ?AUTO_11480 ) ) ( CAN_TRAVERSE ?AUTO_11479 ?AUTO_11481 ?AUTO_11480 ) ( VISIBLE ?AUTO_11481 ?AUTO_11480 ) ( CALIBRATED ?AUTO_11476 ?AUTO_11479 ) ( ON_BOARD ?AUTO_11476 ?AUTO_11479 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11479 ) ( SUPPORTS ?AUTO_11476 ?AUTO_11475 ) ( VISIBLE_FROM ?AUTO_11474 ?AUTO_11481 ) ( CAN_TRAVERSE ?AUTO_11479 ?AUTO_11477 ?AUTO_11481 ) ( CAN_TRAVERSE ?AUTO_11479 ?AUTO_11482 ?AUTO_11477 ) ( AT ?AUTO_11479 ?AUTO_11482 ) ( VISIBLE ?AUTO_11482 ?AUTO_11477 ) ( not ( = ?AUTO_11481 ?AUTO_11482 ) ) ( not ( = ?AUTO_11477 ?AUTO_11482 ) ) ( not ( = ?AUTO_11480 ?AUTO_11482 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11479 ?AUTO_11482 ?AUTO_11477 )
      ( GET_IMAGE_DATA ?AUTO_11474 ?AUTO_11475 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11474 ?AUTO_11475 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11483 - OBJECTIVE
      ?AUTO_11484 - MODE
    )
    :vars
    (
      ?AUTO_11489 - LANDER
      ?AUTO_11485 - WAYPOINT
      ?AUTO_11486 - WAYPOINT
      ?AUTO_11488 - ROVER
      ?AUTO_11490 - WAYPOINT
      ?AUTO_11487 - CAMERA
      ?AUTO_11491 - WAYPOINT
      ?AUTO_11492 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11489 ?AUTO_11485 ) ( VISIBLE ?AUTO_11486 ?AUTO_11485 ) ( AVAILABLE ?AUTO_11488 ) ( CHANNEL_FREE ?AUTO_11489 ) ( not ( = ?AUTO_11486 ?AUTO_11485 ) ) ( CAN_TRAVERSE ?AUTO_11488 ?AUTO_11490 ?AUTO_11486 ) ( VISIBLE ?AUTO_11490 ?AUTO_11486 ) ( not ( = ?AUTO_11485 ?AUTO_11490 ) ) ( not ( = ?AUTO_11486 ?AUTO_11490 ) ) ( CAN_TRAVERSE ?AUTO_11488 ?AUTO_11485 ?AUTO_11490 ) ( VISIBLE ?AUTO_11485 ?AUTO_11490 ) ( ON_BOARD ?AUTO_11487 ?AUTO_11488 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11488 ) ( SUPPORTS ?AUTO_11487 ?AUTO_11484 ) ( VISIBLE_FROM ?AUTO_11483 ?AUTO_11485 ) ( CAN_TRAVERSE ?AUTO_11488 ?AUTO_11486 ?AUTO_11485 ) ( CAN_TRAVERSE ?AUTO_11488 ?AUTO_11491 ?AUTO_11486 ) ( AT ?AUTO_11488 ?AUTO_11491 ) ( VISIBLE ?AUTO_11491 ?AUTO_11486 ) ( not ( = ?AUTO_11485 ?AUTO_11491 ) ) ( not ( = ?AUTO_11486 ?AUTO_11491 ) ) ( not ( = ?AUTO_11490 ?AUTO_11491 ) ) ( CALIBRATION_TARGET ?AUTO_11487 ?AUTO_11492 ) ( VISIBLE_FROM ?AUTO_11492 ?AUTO_11491 ) ( not ( = ?AUTO_11483 ?AUTO_11492 ) ) )
    :subtasks
    ( ( !CALIBRATE ?AUTO_11488 ?AUTO_11487 ?AUTO_11492 ?AUTO_11491 )
      ( GET_IMAGE_DATA ?AUTO_11483 ?AUTO_11484 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11483 ?AUTO_11484 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11501 - OBJECTIVE
      ?AUTO_11502 - MODE
    )
    :vars
    (
      ?AUTO_11505 - LANDER
      ?AUTO_11509 - WAYPOINT
      ?AUTO_11510 - WAYPOINT
      ?AUTO_11503 - ROVER
      ?AUTO_11508 - WAYPOINT
      ?AUTO_11504 - CAMERA
      ?AUTO_11506 - WAYPOINT
      ?AUTO_11507 - OBJECTIVE
      ?AUTO_11511 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11505 ?AUTO_11509 ) ( VISIBLE ?AUTO_11510 ?AUTO_11509 ) ( AVAILABLE ?AUTO_11503 ) ( CHANNEL_FREE ?AUTO_11505 ) ( not ( = ?AUTO_11510 ?AUTO_11509 ) ) ( CAN_TRAVERSE ?AUTO_11503 ?AUTO_11508 ?AUTO_11510 ) ( VISIBLE ?AUTO_11508 ?AUTO_11510 ) ( not ( = ?AUTO_11509 ?AUTO_11508 ) ) ( not ( = ?AUTO_11510 ?AUTO_11508 ) ) ( CAN_TRAVERSE ?AUTO_11503 ?AUTO_11509 ?AUTO_11508 ) ( VISIBLE ?AUTO_11509 ?AUTO_11508 ) ( ON_BOARD ?AUTO_11504 ?AUTO_11503 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11503 ) ( SUPPORTS ?AUTO_11504 ?AUTO_11502 ) ( VISIBLE_FROM ?AUTO_11501 ?AUTO_11509 ) ( CAN_TRAVERSE ?AUTO_11503 ?AUTO_11510 ?AUTO_11509 ) ( CAN_TRAVERSE ?AUTO_11503 ?AUTO_11506 ?AUTO_11510 ) ( VISIBLE ?AUTO_11506 ?AUTO_11510 ) ( not ( = ?AUTO_11509 ?AUTO_11506 ) ) ( not ( = ?AUTO_11510 ?AUTO_11506 ) ) ( not ( = ?AUTO_11508 ?AUTO_11506 ) ) ( CALIBRATION_TARGET ?AUTO_11504 ?AUTO_11507 ) ( VISIBLE_FROM ?AUTO_11507 ?AUTO_11506 ) ( not ( = ?AUTO_11501 ?AUTO_11507 ) ) ( CAN_TRAVERSE ?AUTO_11503 ?AUTO_11511 ?AUTO_11506 ) ( AT ?AUTO_11503 ?AUTO_11511 ) ( VISIBLE ?AUTO_11511 ?AUTO_11506 ) ( not ( = ?AUTO_11509 ?AUTO_11511 ) ) ( not ( = ?AUTO_11510 ?AUTO_11511 ) ) ( not ( = ?AUTO_11508 ?AUTO_11511 ) ) ( not ( = ?AUTO_11506 ?AUTO_11511 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11503 ?AUTO_11511 ?AUTO_11506 )
      ( GET_IMAGE_DATA ?AUTO_11501 ?AUTO_11502 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11501 ?AUTO_11502 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11512 - OBJECTIVE
      ?AUTO_11513 - MODE
    )
    :vars
    (
      ?AUTO_11520 - LANDER
      ?AUTO_11519 - WAYPOINT
      ?AUTO_11515 - WAYPOINT
      ?AUTO_11516 - ROVER
      ?AUTO_11521 - WAYPOINT
      ?AUTO_11518 - CAMERA
      ?AUTO_11514 - WAYPOINT
      ?AUTO_11517 - OBJECTIVE
      ?AUTO_11522 - WAYPOINT
      ?AUTO_11523 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11520 ?AUTO_11519 ) ( VISIBLE ?AUTO_11515 ?AUTO_11519 ) ( AVAILABLE ?AUTO_11516 ) ( CHANNEL_FREE ?AUTO_11520 ) ( not ( = ?AUTO_11515 ?AUTO_11519 ) ) ( CAN_TRAVERSE ?AUTO_11516 ?AUTO_11521 ?AUTO_11515 ) ( VISIBLE ?AUTO_11521 ?AUTO_11515 ) ( not ( = ?AUTO_11519 ?AUTO_11521 ) ) ( not ( = ?AUTO_11515 ?AUTO_11521 ) ) ( CAN_TRAVERSE ?AUTO_11516 ?AUTO_11519 ?AUTO_11521 ) ( VISIBLE ?AUTO_11519 ?AUTO_11521 ) ( ON_BOARD ?AUTO_11518 ?AUTO_11516 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11516 ) ( SUPPORTS ?AUTO_11518 ?AUTO_11513 ) ( VISIBLE_FROM ?AUTO_11512 ?AUTO_11519 ) ( CAN_TRAVERSE ?AUTO_11516 ?AUTO_11515 ?AUTO_11519 ) ( CAN_TRAVERSE ?AUTO_11516 ?AUTO_11514 ?AUTO_11515 ) ( VISIBLE ?AUTO_11514 ?AUTO_11515 ) ( not ( = ?AUTO_11519 ?AUTO_11514 ) ) ( not ( = ?AUTO_11515 ?AUTO_11514 ) ) ( not ( = ?AUTO_11521 ?AUTO_11514 ) ) ( CALIBRATION_TARGET ?AUTO_11518 ?AUTO_11517 ) ( VISIBLE_FROM ?AUTO_11517 ?AUTO_11514 ) ( not ( = ?AUTO_11512 ?AUTO_11517 ) ) ( CAN_TRAVERSE ?AUTO_11516 ?AUTO_11522 ?AUTO_11514 ) ( VISIBLE ?AUTO_11522 ?AUTO_11514 ) ( not ( = ?AUTO_11519 ?AUTO_11522 ) ) ( not ( = ?AUTO_11515 ?AUTO_11522 ) ) ( not ( = ?AUTO_11521 ?AUTO_11522 ) ) ( not ( = ?AUTO_11514 ?AUTO_11522 ) ) ( CAN_TRAVERSE ?AUTO_11516 ?AUTO_11523 ?AUTO_11522 ) ( AT ?AUTO_11516 ?AUTO_11523 ) ( VISIBLE ?AUTO_11523 ?AUTO_11522 ) ( not ( = ?AUTO_11519 ?AUTO_11523 ) ) ( not ( = ?AUTO_11515 ?AUTO_11523 ) ) ( not ( = ?AUTO_11521 ?AUTO_11523 ) ) ( not ( = ?AUTO_11514 ?AUTO_11523 ) ) ( not ( = ?AUTO_11522 ?AUTO_11523 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11516 ?AUTO_11523 ?AUTO_11522 )
      ( GET_IMAGE_DATA ?AUTO_11512 ?AUTO_11513 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11512 ?AUTO_11513 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11530 - OBJECTIVE
      ?AUTO_11531 - MODE
    )
    :vars
    (
      ?AUTO_11541 - LANDER
      ?AUTO_11534 - WAYPOINT
      ?AUTO_11540 - WAYPOINT
      ?AUTO_11539 - ROVER
      ?AUTO_11532 - WAYPOINT
      ?AUTO_11533 - CAMERA
      ?AUTO_11535 - WAYPOINT
      ?AUTO_11538 - OBJECTIVE
      ?AUTO_11537 - WAYPOINT
      ?AUTO_11536 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11541 ?AUTO_11534 ) ( VISIBLE ?AUTO_11540 ?AUTO_11534 ) ( AVAILABLE ?AUTO_11539 ) ( CHANNEL_FREE ?AUTO_11541 ) ( not ( = ?AUTO_11540 ?AUTO_11534 ) ) ( CAN_TRAVERSE ?AUTO_11539 ?AUTO_11532 ?AUTO_11540 ) ( VISIBLE ?AUTO_11532 ?AUTO_11540 ) ( not ( = ?AUTO_11534 ?AUTO_11532 ) ) ( not ( = ?AUTO_11540 ?AUTO_11532 ) ) ( CAN_TRAVERSE ?AUTO_11539 ?AUTO_11534 ?AUTO_11532 ) ( VISIBLE ?AUTO_11534 ?AUTO_11532 ) ( ON_BOARD ?AUTO_11533 ?AUTO_11539 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11539 ) ( SUPPORTS ?AUTO_11533 ?AUTO_11531 ) ( VISIBLE_FROM ?AUTO_11530 ?AUTO_11534 ) ( CAN_TRAVERSE ?AUTO_11539 ?AUTO_11540 ?AUTO_11534 ) ( CAN_TRAVERSE ?AUTO_11539 ?AUTO_11535 ?AUTO_11540 ) ( VISIBLE ?AUTO_11535 ?AUTO_11540 ) ( not ( = ?AUTO_11534 ?AUTO_11535 ) ) ( not ( = ?AUTO_11540 ?AUTO_11535 ) ) ( not ( = ?AUTO_11532 ?AUTO_11535 ) ) ( CALIBRATION_TARGET ?AUTO_11533 ?AUTO_11538 ) ( VISIBLE_FROM ?AUTO_11538 ?AUTO_11535 ) ( not ( = ?AUTO_11530 ?AUTO_11538 ) ) ( CAN_TRAVERSE ?AUTO_11539 ?AUTO_11537 ?AUTO_11535 ) ( VISIBLE ?AUTO_11537 ?AUTO_11535 ) ( not ( = ?AUTO_11534 ?AUTO_11537 ) ) ( not ( = ?AUTO_11540 ?AUTO_11537 ) ) ( not ( = ?AUTO_11532 ?AUTO_11537 ) ) ( not ( = ?AUTO_11535 ?AUTO_11537 ) ) ( CAN_TRAVERSE ?AUTO_11539 ?AUTO_11536 ?AUTO_11537 ) ( VISIBLE ?AUTO_11536 ?AUTO_11537 ) ( not ( = ?AUTO_11534 ?AUTO_11536 ) ) ( not ( = ?AUTO_11540 ?AUTO_11536 ) ) ( not ( = ?AUTO_11532 ?AUTO_11536 ) ) ( not ( = ?AUTO_11535 ?AUTO_11536 ) ) ( not ( = ?AUTO_11537 ?AUTO_11536 ) ) ( CAN_TRAVERSE ?AUTO_11539 ?AUTO_11534 ?AUTO_11536 ) ( AT ?AUTO_11539 ?AUTO_11534 ) ( VISIBLE ?AUTO_11534 ?AUTO_11536 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11539 ?AUTO_11534 ?AUTO_11536 )
      ( GET_IMAGE_DATA ?AUTO_11530 ?AUTO_11531 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11530 ?AUTO_11531 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11598 - OBJECTIVE
      ?AUTO_11599 - MODE
    )
    :vars
    (
      ?AUTO_11601 - LANDER
      ?AUTO_11602 - WAYPOINT
      ?AUTO_11607 - WAYPOINT
      ?AUTO_11604 - ROVER
      ?AUTO_11605 - CAMERA
      ?AUTO_11606 - WAYPOINT
      ?AUTO_11603 - WAYPOINT
      ?AUTO_11600 - OBJECTIVE
      ?AUTO_11608 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11601 ?AUTO_11602 ) ( VISIBLE ?AUTO_11607 ?AUTO_11602 ) ( AVAILABLE ?AUTO_11604 ) ( CHANNEL_FREE ?AUTO_11601 ) ( not ( = ?AUTO_11607 ?AUTO_11602 ) ) ( CAN_TRAVERSE ?AUTO_11604 ?AUTO_11602 ?AUTO_11607 ) ( VISIBLE ?AUTO_11602 ?AUTO_11607 ) ( ON_BOARD ?AUTO_11605 ?AUTO_11604 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11604 ) ( SUPPORTS ?AUTO_11605 ?AUTO_11599 ) ( VISIBLE_FROM ?AUTO_11598 ?AUTO_11602 ) ( CAN_TRAVERSE ?AUTO_11604 ?AUTO_11606 ?AUTO_11602 ) ( VISIBLE ?AUTO_11606 ?AUTO_11602 ) ( not ( = ?AUTO_11602 ?AUTO_11606 ) ) ( not ( = ?AUTO_11607 ?AUTO_11606 ) ) ( CAN_TRAVERSE ?AUTO_11604 ?AUTO_11603 ?AUTO_11606 ) ( VISIBLE ?AUTO_11603 ?AUTO_11606 ) ( not ( = ?AUTO_11602 ?AUTO_11603 ) ) ( not ( = ?AUTO_11607 ?AUTO_11603 ) ) ( not ( = ?AUTO_11606 ?AUTO_11603 ) ) ( CALIBRATION_TARGET ?AUTO_11605 ?AUTO_11600 ) ( VISIBLE_FROM ?AUTO_11600 ?AUTO_11603 ) ( not ( = ?AUTO_11598 ?AUTO_11600 ) ) ( CAN_TRAVERSE ?AUTO_11604 ?AUTO_11608 ?AUTO_11603 ) ( AT ?AUTO_11604 ?AUTO_11608 ) ( VISIBLE ?AUTO_11608 ?AUTO_11603 ) ( not ( = ?AUTO_11602 ?AUTO_11608 ) ) ( not ( = ?AUTO_11607 ?AUTO_11608 ) ) ( not ( = ?AUTO_11606 ?AUTO_11608 ) ) ( not ( = ?AUTO_11603 ?AUTO_11608 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11604 ?AUTO_11608 ?AUTO_11603 )
      ( GET_IMAGE_DATA ?AUTO_11598 ?AUTO_11599 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11598 ?AUTO_11599 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11609 - OBJECTIVE
      ?AUTO_11610 - MODE
    )
    :vars
    (
      ?AUTO_11618 - LANDER
      ?AUTO_11619 - WAYPOINT
      ?AUTO_11611 - WAYPOINT
      ?AUTO_11612 - ROVER
      ?AUTO_11616 - CAMERA
      ?AUTO_11615 - WAYPOINT
      ?AUTO_11614 - WAYPOINT
      ?AUTO_11613 - OBJECTIVE
      ?AUTO_11617 - WAYPOINT
      ?AUTO_11620 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11618 ?AUTO_11619 ) ( VISIBLE ?AUTO_11611 ?AUTO_11619 ) ( AVAILABLE ?AUTO_11612 ) ( CHANNEL_FREE ?AUTO_11618 ) ( not ( = ?AUTO_11611 ?AUTO_11619 ) ) ( CAN_TRAVERSE ?AUTO_11612 ?AUTO_11619 ?AUTO_11611 ) ( VISIBLE ?AUTO_11619 ?AUTO_11611 ) ( ON_BOARD ?AUTO_11616 ?AUTO_11612 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11612 ) ( SUPPORTS ?AUTO_11616 ?AUTO_11610 ) ( VISIBLE_FROM ?AUTO_11609 ?AUTO_11619 ) ( CAN_TRAVERSE ?AUTO_11612 ?AUTO_11615 ?AUTO_11619 ) ( VISIBLE ?AUTO_11615 ?AUTO_11619 ) ( not ( = ?AUTO_11619 ?AUTO_11615 ) ) ( not ( = ?AUTO_11611 ?AUTO_11615 ) ) ( CAN_TRAVERSE ?AUTO_11612 ?AUTO_11614 ?AUTO_11615 ) ( VISIBLE ?AUTO_11614 ?AUTO_11615 ) ( not ( = ?AUTO_11619 ?AUTO_11614 ) ) ( not ( = ?AUTO_11611 ?AUTO_11614 ) ) ( not ( = ?AUTO_11615 ?AUTO_11614 ) ) ( CALIBRATION_TARGET ?AUTO_11616 ?AUTO_11613 ) ( VISIBLE_FROM ?AUTO_11613 ?AUTO_11614 ) ( not ( = ?AUTO_11609 ?AUTO_11613 ) ) ( CAN_TRAVERSE ?AUTO_11612 ?AUTO_11617 ?AUTO_11614 ) ( VISIBLE ?AUTO_11617 ?AUTO_11614 ) ( not ( = ?AUTO_11619 ?AUTO_11617 ) ) ( not ( = ?AUTO_11611 ?AUTO_11617 ) ) ( not ( = ?AUTO_11615 ?AUTO_11617 ) ) ( not ( = ?AUTO_11614 ?AUTO_11617 ) ) ( CAN_TRAVERSE ?AUTO_11612 ?AUTO_11620 ?AUTO_11617 ) ( AT ?AUTO_11612 ?AUTO_11620 ) ( VISIBLE ?AUTO_11620 ?AUTO_11617 ) ( not ( = ?AUTO_11619 ?AUTO_11620 ) ) ( not ( = ?AUTO_11611 ?AUTO_11620 ) ) ( not ( = ?AUTO_11615 ?AUTO_11620 ) ) ( not ( = ?AUTO_11614 ?AUTO_11620 ) ) ( not ( = ?AUTO_11617 ?AUTO_11620 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11612 ?AUTO_11620 ?AUTO_11617 )
      ( GET_IMAGE_DATA ?AUTO_11609 ?AUTO_11610 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11609 ?AUTO_11610 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11621 - OBJECTIVE
      ?AUTO_11622 - MODE
    )
    :vars
    (
      ?AUTO_11623 - LANDER
      ?AUTO_11626 - WAYPOINT
      ?AUTO_11625 - WAYPOINT
      ?AUTO_11624 - ROVER
      ?AUTO_11628 - CAMERA
      ?AUTO_11630 - WAYPOINT
      ?AUTO_11629 - WAYPOINT
      ?AUTO_11631 - OBJECTIVE
      ?AUTO_11627 - WAYPOINT
      ?AUTO_11632 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11623 ?AUTO_11626 ) ( VISIBLE ?AUTO_11625 ?AUTO_11626 ) ( AVAILABLE ?AUTO_11624 ) ( CHANNEL_FREE ?AUTO_11623 ) ( not ( = ?AUTO_11625 ?AUTO_11626 ) ) ( CAN_TRAVERSE ?AUTO_11624 ?AUTO_11626 ?AUTO_11625 ) ( VISIBLE ?AUTO_11626 ?AUTO_11625 ) ( ON_BOARD ?AUTO_11628 ?AUTO_11624 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11624 ) ( SUPPORTS ?AUTO_11628 ?AUTO_11622 ) ( VISIBLE_FROM ?AUTO_11621 ?AUTO_11626 ) ( CAN_TRAVERSE ?AUTO_11624 ?AUTO_11630 ?AUTO_11626 ) ( VISIBLE ?AUTO_11630 ?AUTO_11626 ) ( not ( = ?AUTO_11626 ?AUTO_11630 ) ) ( not ( = ?AUTO_11625 ?AUTO_11630 ) ) ( CAN_TRAVERSE ?AUTO_11624 ?AUTO_11629 ?AUTO_11630 ) ( VISIBLE ?AUTO_11629 ?AUTO_11630 ) ( not ( = ?AUTO_11626 ?AUTO_11629 ) ) ( not ( = ?AUTO_11625 ?AUTO_11629 ) ) ( not ( = ?AUTO_11630 ?AUTO_11629 ) ) ( CALIBRATION_TARGET ?AUTO_11628 ?AUTO_11631 ) ( VISIBLE_FROM ?AUTO_11631 ?AUTO_11629 ) ( not ( = ?AUTO_11621 ?AUTO_11631 ) ) ( CAN_TRAVERSE ?AUTO_11624 ?AUTO_11627 ?AUTO_11629 ) ( VISIBLE ?AUTO_11627 ?AUTO_11629 ) ( not ( = ?AUTO_11626 ?AUTO_11627 ) ) ( not ( = ?AUTO_11625 ?AUTO_11627 ) ) ( not ( = ?AUTO_11630 ?AUTO_11627 ) ) ( not ( = ?AUTO_11629 ?AUTO_11627 ) ) ( CAN_TRAVERSE ?AUTO_11624 ?AUTO_11632 ?AUTO_11627 ) ( VISIBLE ?AUTO_11632 ?AUTO_11627 ) ( not ( = ?AUTO_11626 ?AUTO_11632 ) ) ( not ( = ?AUTO_11625 ?AUTO_11632 ) ) ( not ( = ?AUTO_11630 ?AUTO_11632 ) ) ( not ( = ?AUTO_11629 ?AUTO_11632 ) ) ( not ( = ?AUTO_11627 ?AUTO_11632 ) ) ( CAN_TRAVERSE ?AUTO_11624 ?AUTO_11626 ?AUTO_11632 ) ( AT ?AUTO_11624 ?AUTO_11626 ) ( VISIBLE ?AUTO_11626 ?AUTO_11632 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11624 ?AUTO_11626 ?AUTO_11632 )
      ( GET_IMAGE_DATA ?AUTO_11621 ?AUTO_11622 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11621 ?AUTO_11622 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_11687 - OBJECTIVE
      ?AUTO_11688 - MODE
    )
    :vars
    (
      ?AUTO_11695 - LANDER
      ?AUTO_11694 - WAYPOINT
      ?AUTO_11691 - WAYPOINT
      ?AUTO_11693 - ROVER
      ?AUTO_11689 - CAMERA
      ?AUTO_11690 - OBJECTIVE
      ?AUTO_11692 - WAYPOINT
      ?AUTO_11696 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11695 ?AUTO_11694 ) ( VISIBLE ?AUTO_11691 ?AUTO_11694 ) ( AVAILABLE ?AUTO_11693 ) ( CHANNEL_FREE ?AUTO_11695 ) ( not ( = ?AUTO_11691 ?AUTO_11694 ) ) ( ON_BOARD ?AUTO_11689 ?AUTO_11693 ) ( EQUIPPED_FOR_IMAGING ?AUTO_11693 ) ( SUPPORTS ?AUTO_11689 ?AUTO_11688 ) ( VISIBLE_FROM ?AUTO_11687 ?AUTO_11691 ) ( CAN_TRAVERSE ?AUTO_11693 ?AUTO_11694 ?AUTO_11691 ) ( VISIBLE ?AUTO_11694 ?AUTO_11691 ) ( CALIBRATION_TARGET ?AUTO_11689 ?AUTO_11690 ) ( VISIBLE_FROM ?AUTO_11690 ?AUTO_11694 ) ( not ( = ?AUTO_11687 ?AUTO_11690 ) ) ( CAN_TRAVERSE ?AUTO_11693 ?AUTO_11692 ?AUTO_11694 ) ( VISIBLE ?AUTO_11692 ?AUTO_11694 ) ( not ( = ?AUTO_11694 ?AUTO_11692 ) ) ( not ( = ?AUTO_11691 ?AUTO_11692 ) ) ( CAN_TRAVERSE ?AUTO_11693 ?AUTO_11696 ?AUTO_11692 ) ( AT ?AUTO_11693 ?AUTO_11696 ) ( VISIBLE ?AUTO_11696 ?AUTO_11692 ) ( not ( = ?AUTO_11694 ?AUTO_11696 ) ) ( not ( = ?AUTO_11691 ?AUTO_11696 ) ) ( not ( = ?AUTO_11692 ?AUTO_11696 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11693 ?AUTO_11696 ?AUTO_11692 )
      ( GET_IMAGE_DATA ?AUTO_11687 ?AUTO_11688 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_11687 ?AUTO_11688 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11731 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11736 - LANDER
      ?AUTO_11733 - WAYPOINT
      ?AUTO_11732 - ROVER
      ?AUTO_11735 - STORE
      ?AUTO_11737 - WAYPOINT
      ?AUTO_11734 - WAYPOINT
      ?AUTO_11738 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11736 ?AUTO_11733 ) ( VISIBLE ?AUTO_11731 ?AUTO_11733 ) ( AVAILABLE ?AUTO_11732 ) ( CHANNEL_FREE ?AUTO_11736 ) ( not ( = ?AUTO_11731 ?AUTO_11733 ) ) ( AT_SOIL_SAMPLE ?AUTO_11731 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11732 ) ( STORE_OF ?AUTO_11735 ?AUTO_11732 ) ( EMPTY ?AUTO_11735 ) ( CAN_TRAVERSE ?AUTO_11732 ?AUTO_11737 ?AUTO_11731 ) ( VISIBLE ?AUTO_11737 ?AUTO_11731 ) ( not ( = ?AUTO_11731 ?AUTO_11737 ) ) ( not ( = ?AUTO_11733 ?AUTO_11737 ) ) ( CAN_TRAVERSE ?AUTO_11732 ?AUTO_11733 ?AUTO_11737 ) ( VISIBLE ?AUTO_11733 ?AUTO_11737 ) ( CAN_TRAVERSE ?AUTO_11732 ?AUTO_11734 ?AUTO_11733 ) ( VISIBLE ?AUTO_11734 ?AUTO_11733 ) ( not ( = ?AUTO_11731 ?AUTO_11734 ) ) ( not ( = ?AUTO_11733 ?AUTO_11734 ) ) ( not ( = ?AUTO_11737 ?AUTO_11734 ) ) ( CAN_TRAVERSE ?AUTO_11732 ?AUTO_11738 ?AUTO_11734 ) ( AT ?AUTO_11732 ?AUTO_11738 ) ( VISIBLE ?AUTO_11738 ?AUTO_11734 ) ( not ( = ?AUTO_11731 ?AUTO_11738 ) ) ( not ( = ?AUTO_11733 ?AUTO_11738 ) ) ( not ( = ?AUTO_11737 ?AUTO_11738 ) ) ( not ( = ?AUTO_11734 ?AUTO_11738 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11732 ?AUTO_11738 ?AUTO_11734 )
      ( GET_SOIL_DATA ?AUTO_11731 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11731 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11830 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11832 - LANDER
      ?AUTO_11837 - WAYPOINT
      ?AUTO_11834 - ROVER
      ?AUTO_11835 - STORE
      ?AUTO_11836 - WAYPOINT
      ?AUTO_11831 - WAYPOINT
      ?AUTO_11833 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11832 ?AUTO_11837 ) ( VISIBLE ?AUTO_11830 ?AUTO_11837 ) ( AVAILABLE ?AUTO_11834 ) ( CHANNEL_FREE ?AUTO_11832 ) ( not ( = ?AUTO_11830 ?AUTO_11837 ) ) ( AT_ROCK_SAMPLE ?AUTO_11830 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11834 ) ( STORE_OF ?AUTO_11835 ?AUTO_11834 ) ( CAN_TRAVERSE ?AUTO_11834 ?AUTO_11836 ?AUTO_11830 ) ( VISIBLE ?AUTO_11836 ?AUTO_11830 ) ( not ( = ?AUTO_11830 ?AUTO_11836 ) ) ( not ( = ?AUTO_11837 ?AUTO_11836 ) ) ( CAN_TRAVERSE ?AUTO_11834 ?AUTO_11831 ?AUTO_11836 ) ( VISIBLE ?AUTO_11831 ?AUTO_11836 ) ( not ( = ?AUTO_11830 ?AUTO_11831 ) ) ( not ( = ?AUTO_11837 ?AUTO_11831 ) ) ( not ( = ?AUTO_11836 ?AUTO_11831 ) ) ( AT_SOIL_SAMPLE ?AUTO_11831 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11834 ) ( EMPTY ?AUTO_11835 ) ( CAN_TRAVERSE ?AUTO_11834 ?AUTO_11833 ?AUTO_11831 ) ( VISIBLE ?AUTO_11833 ?AUTO_11831 ) ( not ( = ?AUTO_11830 ?AUTO_11833 ) ) ( not ( = ?AUTO_11837 ?AUTO_11833 ) ) ( not ( = ?AUTO_11836 ?AUTO_11833 ) ) ( not ( = ?AUTO_11831 ?AUTO_11833 ) ) ( CAN_TRAVERSE ?AUTO_11834 ?AUTO_11837 ?AUTO_11833 ) ( AT ?AUTO_11834 ?AUTO_11837 ) ( VISIBLE ?AUTO_11837 ?AUTO_11833 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11834 ?AUTO_11837 ?AUTO_11833 )
      ( GET_ROCK_DATA ?AUTO_11830 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11830 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_11842 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11848 - LANDER
      ?AUTO_11843 - WAYPOINT
      ?AUTO_11845 - ROVER
      ?AUTO_11846 - STORE
      ?AUTO_11844 - WAYPOINT
      ?AUTO_11847 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11848 ?AUTO_11843 ) ( VISIBLE ?AUTO_11842 ?AUTO_11843 ) ( AVAILABLE ?AUTO_11845 ) ( CHANNEL_FREE ?AUTO_11848 ) ( not ( = ?AUTO_11842 ?AUTO_11843 ) ) ( AT_ROCK_SAMPLE ?AUTO_11842 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_11845 ) ( STORE_OF ?AUTO_11846 ?AUTO_11845 ) ( CAN_TRAVERSE ?AUTO_11845 ?AUTO_11844 ?AUTO_11842 ) ( VISIBLE ?AUTO_11844 ?AUTO_11842 ) ( not ( = ?AUTO_11842 ?AUTO_11844 ) ) ( not ( = ?AUTO_11843 ?AUTO_11844 ) ) ( CAN_TRAVERSE ?AUTO_11845 ?AUTO_11847 ?AUTO_11844 ) ( VISIBLE ?AUTO_11847 ?AUTO_11844 ) ( not ( = ?AUTO_11842 ?AUTO_11847 ) ) ( not ( = ?AUTO_11843 ?AUTO_11847 ) ) ( not ( = ?AUTO_11844 ?AUTO_11847 ) ) ( AT_SOIL_SAMPLE ?AUTO_11847 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11845 ) ( EMPTY ?AUTO_11846 ) ( CAN_TRAVERSE ?AUTO_11845 ?AUTO_11844 ?AUTO_11847 ) ( AT ?AUTO_11845 ?AUTO_11844 ) ( VISIBLE ?AUTO_11844 ?AUTO_11847 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11845 ?AUTO_11844 ?AUTO_11847 )
      ( GET_ROCK_DATA ?AUTO_11842 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_11842 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11898 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11901 - LANDER
      ?AUTO_11903 - WAYPOINT
      ?AUTO_11904 - ROVER
      ?AUTO_11900 - STORE
      ?AUTO_11902 - WAYPOINT
      ?AUTO_11899 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11901 ?AUTO_11898 ) ( VISIBLE ?AUTO_11903 ?AUTO_11898 ) ( AVAILABLE ?AUTO_11904 ) ( CHANNEL_FREE ?AUTO_11901 ) ( not ( = ?AUTO_11898 ?AUTO_11903 ) ) ( CAN_TRAVERSE ?AUTO_11904 ?AUTO_11898 ?AUTO_11903 ) ( VISIBLE ?AUTO_11898 ?AUTO_11903 ) ( AT_SOIL_SAMPLE ?AUTO_11898 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11904 ) ( STORE_OF ?AUTO_11900 ?AUTO_11904 ) ( CAN_TRAVERSE ?AUTO_11904 ?AUTO_11903 ?AUTO_11898 ) ( CAN_TRAVERSE ?AUTO_11904 ?AUTO_11902 ?AUTO_11903 ) ( VISIBLE ?AUTO_11902 ?AUTO_11903 ) ( not ( = ?AUTO_11898 ?AUTO_11902 ) ) ( not ( = ?AUTO_11903 ?AUTO_11902 ) ) ( CAN_TRAVERSE ?AUTO_11904 ?AUTO_11899 ?AUTO_11902 ) ( AT ?AUTO_11904 ?AUTO_11899 ) ( VISIBLE ?AUTO_11899 ?AUTO_11902 ) ( not ( = ?AUTO_11898 ?AUTO_11899 ) ) ( not ( = ?AUTO_11903 ?AUTO_11899 ) ) ( not ( = ?AUTO_11902 ?AUTO_11899 ) ) ( AT_SOIL_SAMPLE ?AUTO_11899 ) ( EMPTY ?AUTO_11900 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_11904 ?AUTO_11900 ?AUTO_11899 )
      ( GET_SOIL_DATA ?AUTO_11898 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11898 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_11913 - WAYPOINT
    )
    :vars
    (
      ?AUTO_11919 - LANDER
      ?AUTO_11914 - WAYPOINT
      ?AUTO_11916 - ROVER
      ?AUTO_11915 - STORE
      ?AUTO_11917 - WAYPOINT
      ?AUTO_11918 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_11919 ?AUTO_11913 ) ( VISIBLE ?AUTO_11914 ?AUTO_11913 ) ( AVAILABLE ?AUTO_11916 ) ( CHANNEL_FREE ?AUTO_11919 ) ( not ( = ?AUTO_11913 ?AUTO_11914 ) ) ( CAN_TRAVERSE ?AUTO_11916 ?AUTO_11913 ?AUTO_11914 ) ( VISIBLE ?AUTO_11913 ?AUTO_11914 ) ( AT_SOIL_SAMPLE ?AUTO_11913 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_11916 ) ( STORE_OF ?AUTO_11915 ?AUTO_11916 ) ( CAN_TRAVERSE ?AUTO_11916 ?AUTO_11914 ?AUTO_11913 ) ( CAN_TRAVERSE ?AUTO_11916 ?AUTO_11917 ?AUTO_11914 ) ( VISIBLE ?AUTO_11917 ?AUTO_11914 ) ( not ( = ?AUTO_11913 ?AUTO_11917 ) ) ( not ( = ?AUTO_11914 ?AUTO_11917 ) ) ( CAN_TRAVERSE ?AUTO_11916 ?AUTO_11918 ?AUTO_11917 ) ( VISIBLE ?AUTO_11918 ?AUTO_11917 ) ( not ( = ?AUTO_11913 ?AUTO_11918 ) ) ( not ( = ?AUTO_11914 ?AUTO_11918 ) ) ( not ( = ?AUTO_11917 ?AUTO_11918 ) ) ( AT_SOIL_SAMPLE ?AUTO_11918 ) ( EMPTY ?AUTO_11915 ) ( CAN_TRAVERSE ?AUTO_11916 ?AUTO_11917 ?AUTO_11918 ) ( AT ?AUTO_11916 ?AUTO_11917 ) ( VISIBLE ?AUTO_11917 ?AUTO_11918 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_11916 ?AUTO_11917 ?AUTO_11918 )
      ( GET_SOIL_DATA ?AUTO_11913 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_11913 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12061 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12066 - LANDER
      ?AUTO_12062 - WAYPOINT
      ?AUTO_12064 - WAYPOINT
      ?AUTO_12067 - ROVER
      ?AUTO_12063 - WAYPOINT
      ?AUTO_12065 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12066 ?AUTO_12062 ) ( VISIBLE ?AUTO_12064 ?AUTO_12062 ) ( AVAILABLE ?AUTO_12067 ) ( CHANNEL_FREE ?AUTO_12066 ) ( not ( = ?AUTO_12061 ?AUTO_12064 ) ) ( not ( = ?AUTO_12061 ?AUTO_12062 ) ) ( not ( = ?AUTO_12064 ?AUTO_12062 ) ) ( CAN_TRAVERSE ?AUTO_12067 ?AUTO_12063 ?AUTO_12064 ) ( VISIBLE ?AUTO_12063 ?AUTO_12064 ) ( not ( = ?AUTO_12061 ?AUTO_12063 ) ) ( not ( = ?AUTO_12062 ?AUTO_12063 ) ) ( not ( = ?AUTO_12064 ?AUTO_12063 ) ) ( CAN_TRAVERSE ?AUTO_12067 ?AUTO_12061 ?AUTO_12063 ) ( VISIBLE ?AUTO_12061 ?AUTO_12063 ) ( AT_ROCK_SAMPLE ?AUTO_12061 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12067 ) ( STORE_OF ?AUTO_12065 ?AUTO_12067 ) ( CAN_TRAVERSE ?AUTO_12067 ?AUTO_12063 ?AUTO_12061 ) ( AT ?AUTO_12067 ?AUTO_12063 ) ( VISIBLE ?AUTO_12063 ?AUTO_12061 ) ( FULL ?AUTO_12065 ) )
    :subtasks
    ( ( !DROP ?AUTO_12067 ?AUTO_12065 )
      ( GET_ROCK_DATA ?AUTO_12061 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12061 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12222 - OBJECTIVE
      ?AUTO_12223 - MODE
    )
    :vars
    (
      ?AUTO_12224 - LANDER
      ?AUTO_12225 - WAYPOINT
      ?AUTO_12231 - WAYPOINT
      ?AUTO_12226 - ROVER
      ?AUTO_12228 - WAYPOINT
      ?AUTO_12230 - WAYPOINT
      ?AUTO_12227 - CAMERA
      ?AUTO_12229 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12224 ?AUTO_12225 ) ( VISIBLE ?AUTO_12231 ?AUTO_12225 ) ( AVAILABLE ?AUTO_12226 ) ( CHANNEL_FREE ?AUTO_12224 ) ( not ( = ?AUTO_12231 ?AUTO_12225 ) ) ( CAN_TRAVERSE ?AUTO_12226 ?AUTO_12228 ?AUTO_12231 ) ( VISIBLE ?AUTO_12228 ?AUTO_12231 ) ( not ( = ?AUTO_12225 ?AUTO_12228 ) ) ( not ( = ?AUTO_12231 ?AUTO_12228 ) ) ( CAN_TRAVERSE ?AUTO_12226 ?AUTO_12230 ?AUTO_12228 ) ( VISIBLE ?AUTO_12230 ?AUTO_12228 ) ( not ( = ?AUTO_12225 ?AUTO_12230 ) ) ( not ( = ?AUTO_12231 ?AUTO_12230 ) ) ( not ( = ?AUTO_12228 ?AUTO_12230 ) ) ( ON_BOARD ?AUTO_12227 ?AUTO_12226 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12226 ) ( SUPPORTS ?AUTO_12227 ?AUTO_12223 ) ( VISIBLE_FROM ?AUTO_12222 ?AUTO_12230 ) ( CAN_TRAVERSE ?AUTO_12226 ?AUTO_12228 ?AUTO_12230 ) ( VISIBLE ?AUTO_12228 ?AUTO_12230 ) ( CALIBRATION_TARGET ?AUTO_12227 ?AUTO_12229 ) ( VISIBLE_FROM ?AUTO_12229 ?AUTO_12228 ) ( not ( = ?AUTO_12222 ?AUTO_12229 ) ) ( CAN_TRAVERSE ?AUTO_12226 ?AUTO_12231 ?AUTO_12228 ) ( AT ?AUTO_12226 ?AUTO_12231 ) ( VISIBLE ?AUTO_12231 ?AUTO_12228 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12226 ?AUTO_12231 ?AUTO_12228 )
      ( GET_IMAGE_DATA ?AUTO_12222 ?AUTO_12223 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12222 ?AUTO_12223 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12250 - OBJECTIVE
      ?AUTO_12251 - MODE
    )
    :vars
    (
      ?AUTO_12257 - LANDER
      ?AUTO_12256 - WAYPOINT
      ?AUTO_12259 - WAYPOINT
      ?AUTO_12254 - ROVER
      ?AUTO_12255 - WAYPOINT
      ?AUTO_12253 - WAYPOINT
      ?AUTO_12258 - CAMERA
      ?AUTO_12252 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12257 ?AUTO_12256 ) ( VISIBLE ?AUTO_12259 ?AUTO_12256 ) ( AVAILABLE ?AUTO_12254 ) ( CHANNEL_FREE ?AUTO_12257 ) ( not ( = ?AUTO_12259 ?AUTO_12256 ) ) ( CAN_TRAVERSE ?AUTO_12254 ?AUTO_12255 ?AUTO_12259 ) ( VISIBLE ?AUTO_12255 ?AUTO_12259 ) ( not ( = ?AUTO_12256 ?AUTO_12255 ) ) ( not ( = ?AUTO_12259 ?AUTO_12255 ) ) ( CAN_TRAVERSE ?AUTO_12254 ?AUTO_12253 ?AUTO_12255 ) ( VISIBLE ?AUTO_12253 ?AUTO_12255 ) ( not ( = ?AUTO_12256 ?AUTO_12253 ) ) ( not ( = ?AUTO_12259 ?AUTO_12253 ) ) ( not ( = ?AUTO_12255 ?AUTO_12253 ) ) ( ON_BOARD ?AUTO_12258 ?AUTO_12254 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12254 ) ( SUPPORTS ?AUTO_12258 ?AUTO_12251 ) ( VISIBLE_FROM ?AUTO_12250 ?AUTO_12253 ) ( CAN_TRAVERSE ?AUTO_12254 ?AUTO_12255 ?AUTO_12253 ) ( VISIBLE ?AUTO_12255 ?AUTO_12253 ) ( CALIBRATION_TARGET ?AUTO_12258 ?AUTO_12252 ) ( VISIBLE_FROM ?AUTO_12252 ?AUTO_12255 ) ( not ( = ?AUTO_12250 ?AUTO_12252 ) ) ( CAN_TRAVERSE ?AUTO_12254 ?AUTO_12259 ?AUTO_12255 ) ( VISIBLE ?AUTO_12259 ?AUTO_12255 ) ( CAN_TRAVERSE ?AUTO_12254 ?AUTO_12256 ?AUTO_12259 ) ( AT ?AUTO_12254 ?AUTO_12256 ) ( VISIBLE ?AUTO_12256 ?AUTO_12259 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12254 ?AUTO_12256 ?AUTO_12259 )
      ( GET_IMAGE_DATA ?AUTO_12250 ?AUTO_12251 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12250 ?AUTO_12251 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12313 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12316 - LANDER
      ?AUTO_12317 - WAYPOINT
      ?AUTO_12314 - ROVER
      ?AUTO_12318 - STORE
      ?AUTO_12315 - WAYPOINT
      ?AUTO_12319 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12316 ?AUTO_12317 ) ( VISIBLE ?AUTO_12313 ?AUTO_12317 ) ( AVAILABLE ?AUTO_12314 ) ( CHANNEL_FREE ?AUTO_12316 ) ( not ( = ?AUTO_12313 ?AUTO_12317 ) ) ( AT_ROCK_SAMPLE ?AUTO_12313 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12314 ) ( STORE_OF ?AUTO_12318 ?AUTO_12314 ) ( EMPTY ?AUTO_12318 ) ( CAN_TRAVERSE ?AUTO_12314 ?AUTO_12315 ?AUTO_12313 ) ( VISIBLE ?AUTO_12315 ?AUTO_12313 ) ( not ( = ?AUTO_12313 ?AUTO_12315 ) ) ( not ( = ?AUTO_12317 ?AUTO_12315 ) ) ( CAN_TRAVERSE ?AUTO_12314 ?AUTO_12317 ?AUTO_12315 ) ( VISIBLE ?AUTO_12317 ?AUTO_12315 ) ( CAN_TRAVERSE ?AUTO_12314 ?AUTO_12319 ?AUTO_12317 ) ( AT ?AUTO_12314 ?AUTO_12319 ) ( VISIBLE ?AUTO_12319 ?AUTO_12317 ) ( not ( = ?AUTO_12313 ?AUTO_12319 ) ) ( not ( = ?AUTO_12317 ?AUTO_12319 ) ) ( not ( = ?AUTO_12315 ?AUTO_12319 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12314 ?AUTO_12319 ?AUTO_12317 )
      ( GET_ROCK_DATA ?AUTO_12313 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12313 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12320 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12325 - LANDER
      ?AUTO_12324 - WAYPOINT
      ?AUTO_12321 - ROVER
      ?AUTO_12323 - STORE
      ?AUTO_12322 - WAYPOINT
      ?AUTO_12326 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12325 ?AUTO_12324 ) ( VISIBLE ?AUTO_12320 ?AUTO_12324 ) ( AVAILABLE ?AUTO_12321 ) ( CHANNEL_FREE ?AUTO_12325 ) ( not ( = ?AUTO_12320 ?AUTO_12324 ) ) ( AT_ROCK_SAMPLE ?AUTO_12320 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12321 ) ( STORE_OF ?AUTO_12323 ?AUTO_12321 ) ( CAN_TRAVERSE ?AUTO_12321 ?AUTO_12322 ?AUTO_12320 ) ( VISIBLE ?AUTO_12322 ?AUTO_12320 ) ( not ( = ?AUTO_12320 ?AUTO_12322 ) ) ( not ( = ?AUTO_12324 ?AUTO_12322 ) ) ( CAN_TRAVERSE ?AUTO_12321 ?AUTO_12324 ?AUTO_12322 ) ( VISIBLE ?AUTO_12324 ?AUTO_12322 ) ( CAN_TRAVERSE ?AUTO_12321 ?AUTO_12326 ?AUTO_12324 ) ( AT ?AUTO_12321 ?AUTO_12326 ) ( VISIBLE ?AUTO_12326 ?AUTO_12324 ) ( not ( = ?AUTO_12320 ?AUTO_12326 ) ) ( not ( = ?AUTO_12324 ?AUTO_12326 ) ) ( not ( = ?AUTO_12322 ?AUTO_12326 ) ) ( FULL ?AUTO_12323 ) )
    :subtasks
    ( ( !DROP ?AUTO_12321 ?AUTO_12323 )
      ( GET_ROCK_DATA ?AUTO_12320 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12320 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12399 - OBJECTIVE
      ?AUTO_12400 - MODE
    )
    :vars
    (
      ?AUTO_12404 - LANDER
      ?AUTO_12409 - WAYPOINT
      ?AUTO_12405 - WAYPOINT
      ?AUTO_12401 - ROVER
      ?AUTO_12408 - CAMERA
      ?AUTO_12406 - WAYPOINT
      ?AUTO_12407 - WAYPOINT
      ?AUTO_12403 - OBJECTIVE
      ?AUTO_12402 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12404 ?AUTO_12409 ) ( VISIBLE ?AUTO_12405 ?AUTO_12409 ) ( AVAILABLE ?AUTO_12401 ) ( CHANNEL_FREE ?AUTO_12404 ) ( not ( = ?AUTO_12405 ?AUTO_12409 ) ) ( CAN_TRAVERSE ?AUTO_12401 ?AUTO_12409 ?AUTO_12405 ) ( VISIBLE ?AUTO_12409 ?AUTO_12405 ) ( ON_BOARD ?AUTO_12408 ?AUTO_12401 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12401 ) ( SUPPORTS ?AUTO_12408 ?AUTO_12400 ) ( VISIBLE_FROM ?AUTO_12399 ?AUTO_12409 ) ( CAN_TRAVERSE ?AUTO_12401 ?AUTO_12406 ?AUTO_12409 ) ( VISIBLE ?AUTO_12406 ?AUTO_12409 ) ( not ( = ?AUTO_12409 ?AUTO_12406 ) ) ( not ( = ?AUTO_12405 ?AUTO_12406 ) ) ( CAN_TRAVERSE ?AUTO_12401 ?AUTO_12407 ?AUTO_12406 ) ( VISIBLE ?AUTO_12407 ?AUTO_12406 ) ( not ( = ?AUTO_12409 ?AUTO_12407 ) ) ( not ( = ?AUTO_12405 ?AUTO_12407 ) ) ( not ( = ?AUTO_12406 ?AUTO_12407 ) ) ( CALIBRATION_TARGET ?AUTO_12408 ?AUTO_12403 ) ( VISIBLE_FROM ?AUTO_12403 ?AUTO_12407 ) ( not ( = ?AUTO_12399 ?AUTO_12403 ) ) ( CAN_TRAVERSE ?AUTO_12401 ?AUTO_12402 ?AUTO_12407 ) ( VISIBLE ?AUTO_12402 ?AUTO_12407 ) ( not ( = ?AUTO_12409 ?AUTO_12402 ) ) ( not ( = ?AUTO_12405 ?AUTO_12402 ) ) ( not ( = ?AUTO_12406 ?AUTO_12402 ) ) ( not ( = ?AUTO_12407 ?AUTO_12402 ) ) ( CAN_TRAVERSE ?AUTO_12401 ?AUTO_12409 ?AUTO_12402 ) ( AT ?AUTO_12401 ?AUTO_12409 ) ( VISIBLE ?AUTO_12409 ?AUTO_12402 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12401 ?AUTO_12409 ?AUTO_12402 )
      ( GET_IMAGE_DATA ?AUTO_12399 ?AUTO_12400 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12399 ?AUTO_12400 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12410 - OBJECTIVE
      ?AUTO_12411 - MODE
    )
    :vars
    (
      ?AUTO_12417 - LANDER
      ?AUTO_12416 - WAYPOINT
      ?AUTO_12420 - WAYPOINT
      ?AUTO_12419 - ROVER
      ?AUTO_12413 - CAMERA
      ?AUTO_12412 - WAYPOINT
      ?AUTO_12414 - WAYPOINT
      ?AUTO_12418 - OBJECTIVE
      ?AUTO_12415 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12417 ?AUTO_12416 ) ( VISIBLE ?AUTO_12420 ?AUTO_12416 ) ( AVAILABLE ?AUTO_12419 ) ( CHANNEL_FREE ?AUTO_12417 ) ( not ( = ?AUTO_12420 ?AUTO_12416 ) ) ( CAN_TRAVERSE ?AUTO_12419 ?AUTO_12416 ?AUTO_12420 ) ( VISIBLE ?AUTO_12416 ?AUTO_12420 ) ( ON_BOARD ?AUTO_12413 ?AUTO_12419 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12419 ) ( SUPPORTS ?AUTO_12413 ?AUTO_12411 ) ( VISIBLE_FROM ?AUTO_12410 ?AUTO_12416 ) ( CAN_TRAVERSE ?AUTO_12419 ?AUTO_12412 ?AUTO_12416 ) ( VISIBLE ?AUTO_12412 ?AUTO_12416 ) ( not ( = ?AUTO_12416 ?AUTO_12412 ) ) ( not ( = ?AUTO_12420 ?AUTO_12412 ) ) ( CAN_TRAVERSE ?AUTO_12419 ?AUTO_12414 ?AUTO_12412 ) ( VISIBLE ?AUTO_12414 ?AUTO_12412 ) ( not ( = ?AUTO_12416 ?AUTO_12414 ) ) ( not ( = ?AUTO_12420 ?AUTO_12414 ) ) ( not ( = ?AUTO_12412 ?AUTO_12414 ) ) ( CALIBRATION_TARGET ?AUTO_12413 ?AUTO_12418 ) ( VISIBLE_FROM ?AUTO_12418 ?AUTO_12414 ) ( not ( = ?AUTO_12410 ?AUTO_12418 ) ) ( CAN_TRAVERSE ?AUTO_12419 ?AUTO_12415 ?AUTO_12414 ) ( VISIBLE ?AUTO_12415 ?AUTO_12414 ) ( not ( = ?AUTO_12416 ?AUTO_12415 ) ) ( not ( = ?AUTO_12420 ?AUTO_12415 ) ) ( not ( = ?AUTO_12412 ?AUTO_12415 ) ) ( not ( = ?AUTO_12414 ?AUTO_12415 ) ) ( CAN_TRAVERSE ?AUTO_12419 ?AUTO_12416 ?AUTO_12415 ) ( VISIBLE ?AUTO_12416 ?AUTO_12415 ) ( AT ?AUTO_12419 ?AUTO_12412 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12419 ?AUTO_12412 ?AUTO_12416 )
      ( GET_IMAGE_DATA ?AUTO_12410 ?AUTO_12411 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12410 ?AUTO_12411 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12499 - OBJECTIVE
      ?AUTO_12500 - MODE
    )
    :vars
    (
      ?AUTO_12501 - LANDER
      ?AUTO_12502 - WAYPOINT
      ?AUTO_12506 - WAYPOINT
      ?AUTO_12504 - ROVER
      ?AUTO_12505 - CAMERA
      ?AUTO_12507 - WAYPOINT
      ?AUTO_12503 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12501 ?AUTO_12502 ) ( VISIBLE ?AUTO_12506 ?AUTO_12502 ) ( AVAILABLE ?AUTO_12504 ) ( CHANNEL_FREE ?AUTO_12501 ) ( not ( = ?AUTO_12506 ?AUTO_12502 ) ) ( ON_BOARD ?AUTO_12505 ?AUTO_12504 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12504 ) ( SUPPORTS ?AUTO_12505 ?AUTO_12500 ) ( VISIBLE_FROM ?AUTO_12499 ?AUTO_12506 ) ( CAN_TRAVERSE ?AUTO_12504 ?AUTO_12502 ?AUTO_12506 ) ( VISIBLE ?AUTO_12502 ?AUTO_12506 ) ( CAN_TRAVERSE ?AUTO_12504 ?AUTO_12507 ?AUTO_12502 ) ( VISIBLE ?AUTO_12507 ?AUTO_12502 ) ( not ( = ?AUTO_12502 ?AUTO_12507 ) ) ( not ( = ?AUTO_12506 ?AUTO_12507 ) ) ( CALIBRATION_TARGET ?AUTO_12505 ?AUTO_12503 ) ( VISIBLE_FROM ?AUTO_12503 ?AUTO_12507 ) ( not ( = ?AUTO_12499 ?AUTO_12503 ) ) ( CAN_TRAVERSE ?AUTO_12504 ?AUTO_12506 ?AUTO_12507 ) ( AT ?AUTO_12504 ?AUTO_12506 ) ( VISIBLE ?AUTO_12506 ?AUTO_12507 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12504 ?AUTO_12506 ?AUTO_12507 )
      ( GET_IMAGE_DATA ?AUTO_12499 ?AUTO_12500 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12499 ?AUTO_12500 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12572 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12574 - LANDER
      ?AUTO_12576 - WAYPOINT
      ?AUTO_12573 - ROVER
      ?AUTO_12577 - STORE
      ?AUTO_12575 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12574 ?AUTO_12576 ) ( VISIBLE ?AUTO_12572 ?AUTO_12576 ) ( AVAILABLE ?AUTO_12573 ) ( CHANNEL_FREE ?AUTO_12574 ) ( not ( = ?AUTO_12572 ?AUTO_12576 ) ) ( AT_ROCK_SAMPLE ?AUTO_12572 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12573 ) ( STORE_OF ?AUTO_12577 ?AUTO_12573 ) ( CAN_TRAVERSE ?AUTO_12573 ?AUTO_12575 ?AUTO_12572 ) ( VISIBLE ?AUTO_12575 ?AUTO_12572 ) ( not ( = ?AUTO_12572 ?AUTO_12575 ) ) ( not ( = ?AUTO_12576 ?AUTO_12575 ) ) ( CAN_TRAVERSE ?AUTO_12573 ?AUTO_12576 ?AUTO_12575 ) ( AT ?AUTO_12573 ?AUTO_12576 ) ( VISIBLE ?AUTO_12576 ?AUTO_12575 ) ( FULL ?AUTO_12577 ) )
    :subtasks
    ( ( !DROP ?AUTO_12573 ?AUTO_12577 )
      ( GET_ROCK_DATA ?AUTO_12572 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12572 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12578 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12580 - LANDER
      ?AUTO_12583 - WAYPOINT
      ?AUTO_12579 - ROVER
      ?AUTO_12581 - STORE
      ?AUTO_12582 - WAYPOINT
      ?AUTO_12584 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12580 ?AUTO_12583 ) ( VISIBLE ?AUTO_12578 ?AUTO_12583 ) ( AVAILABLE ?AUTO_12579 ) ( CHANNEL_FREE ?AUTO_12580 ) ( not ( = ?AUTO_12578 ?AUTO_12583 ) ) ( AT_ROCK_SAMPLE ?AUTO_12578 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12579 ) ( STORE_OF ?AUTO_12581 ?AUTO_12579 ) ( CAN_TRAVERSE ?AUTO_12579 ?AUTO_12582 ?AUTO_12578 ) ( VISIBLE ?AUTO_12582 ?AUTO_12578 ) ( not ( = ?AUTO_12578 ?AUTO_12582 ) ) ( not ( = ?AUTO_12583 ?AUTO_12582 ) ) ( CAN_TRAVERSE ?AUTO_12579 ?AUTO_12583 ?AUTO_12582 ) ( VISIBLE ?AUTO_12583 ?AUTO_12582 ) ( FULL ?AUTO_12581 ) ( CAN_TRAVERSE ?AUTO_12579 ?AUTO_12584 ?AUTO_12583 ) ( AT ?AUTO_12579 ?AUTO_12584 ) ( VISIBLE ?AUTO_12584 ?AUTO_12583 ) ( not ( = ?AUTO_12578 ?AUTO_12584 ) ) ( not ( = ?AUTO_12583 ?AUTO_12584 ) ) ( not ( = ?AUTO_12582 ?AUTO_12584 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12579 ?AUTO_12584 ?AUTO_12583 )
      ( GET_ROCK_DATA ?AUTO_12578 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12578 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_12586 - WAYPOINT
    )
    :vars
    (
      ?AUTO_12592 - LANDER
      ?AUTO_12587 - WAYPOINT
      ?AUTO_12589 - ROVER
      ?AUTO_12588 - STORE
      ?AUTO_12591 - WAYPOINT
      ?AUTO_12590 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12592 ?AUTO_12587 ) ( VISIBLE ?AUTO_12586 ?AUTO_12587 ) ( AVAILABLE ?AUTO_12589 ) ( CHANNEL_FREE ?AUTO_12592 ) ( not ( = ?AUTO_12586 ?AUTO_12587 ) ) ( AT_ROCK_SAMPLE ?AUTO_12586 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_12589 ) ( STORE_OF ?AUTO_12588 ?AUTO_12589 ) ( CAN_TRAVERSE ?AUTO_12589 ?AUTO_12591 ?AUTO_12586 ) ( VISIBLE ?AUTO_12591 ?AUTO_12586 ) ( not ( = ?AUTO_12586 ?AUTO_12591 ) ) ( not ( = ?AUTO_12587 ?AUTO_12591 ) ) ( CAN_TRAVERSE ?AUTO_12589 ?AUTO_12587 ?AUTO_12591 ) ( VISIBLE ?AUTO_12587 ?AUTO_12591 ) ( CAN_TRAVERSE ?AUTO_12589 ?AUTO_12590 ?AUTO_12587 ) ( AT ?AUTO_12589 ?AUTO_12590 ) ( VISIBLE ?AUTO_12590 ?AUTO_12587 ) ( not ( = ?AUTO_12586 ?AUTO_12590 ) ) ( not ( = ?AUTO_12587 ?AUTO_12590 ) ) ( not ( = ?AUTO_12591 ?AUTO_12590 ) ) ( AT_SOIL_SAMPLE ?AUTO_12590 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_12589 ) ( EMPTY ?AUTO_12588 ) )
    :subtasks
    ( ( !SAMPLE_SOIL ?AUTO_12589 ?AUTO_12588 ?AUTO_12590 )
      ( GET_ROCK_DATA ?AUTO_12586 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_12586 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12768 - OBJECTIVE
      ?AUTO_12769 - MODE
    )
    :vars
    (
      ?AUTO_12776 - LANDER
      ?AUTO_12774 - WAYPOINT
      ?AUTO_12773 - WAYPOINT
      ?AUTO_12770 - ROVER
      ?AUTO_12772 - CAMERA
      ?AUTO_12771 - WAYPOINT
      ?AUTO_12775 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12776 ?AUTO_12774 ) ( VISIBLE ?AUTO_12773 ?AUTO_12774 ) ( AVAILABLE ?AUTO_12770 ) ( CHANNEL_FREE ?AUTO_12776 ) ( not ( = ?AUTO_12773 ?AUTO_12774 ) ) ( ON_BOARD ?AUTO_12772 ?AUTO_12770 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12770 ) ( SUPPORTS ?AUTO_12772 ?AUTO_12769 ) ( VISIBLE_FROM ?AUTO_12768 ?AUTO_12773 ) ( CAN_TRAVERSE ?AUTO_12770 ?AUTO_12774 ?AUTO_12773 ) ( VISIBLE ?AUTO_12774 ?AUTO_12773 ) ( CAN_TRAVERSE ?AUTO_12770 ?AUTO_12771 ?AUTO_12774 ) ( VISIBLE ?AUTO_12771 ?AUTO_12774 ) ( not ( = ?AUTO_12774 ?AUTO_12771 ) ) ( not ( = ?AUTO_12773 ?AUTO_12771 ) ) ( CALIBRATION_TARGET ?AUTO_12772 ?AUTO_12775 ) ( VISIBLE_FROM ?AUTO_12775 ?AUTO_12771 ) ( not ( = ?AUTO_12768 ?AUTO_12775 ) ) ( CAN_TRAVERSE ?AUTO_12770 ?AUTO_12774 ?AUTO_12771 ) ( AT ?AUTO_12770 ?AUTO_12774 ) ( VISIBLE ?AUTO_12774 ?AUTO_12771 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12770 ?AUTO_12774 ?AUTO_12771 )
      ( GET_IMAGE_DATA ?AUTO_12768 ?AUTO_12769 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12768 ?AUTO_12769 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_12825 - OBJECTIVE
      ?AUTO_12826 - MODE
    )
    :vars
    (
      ?AUTO_12827 - LANDER
      ?AUTO_12830 - WAYPOINT
      ?AUTO_12829 - WAYPOINT
      ?AUTO_12828 - ROVER
      ?AUTO_12832 - CAMERA
      ?AUTO_12833 - WAYPOINT
      ?AUTO_12831 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_12827 ?AUTO_12830 ) ( VISIBLE ?AUTO_12829 ?AUTO_12830 ) ( AVAILABLE ?AUTO_12828 ) ( CHANNEL_FREE ?AUTO_12827 ) ( not ( = ?AUTO_12829 ?AUTO_12830 ) ) ( ON_BOARD ?AUTO_12832 ?AUTO_12828 ) ( EQUIPPED_FOR_IMAGING ?AUTO_12828 ) ( SUPPORTS ?AUTO_12832 ?AUTO_12826 ) ( VISIBLE_FROM ?AUTO_12825 ?AUTO_12829 ) ( CAN_TRAVERSE ?AUTO_12828 ?AUTO_12830 ?AUTO_12829 ) ( VISIBLE ?AUTO_12830 ?AUTO_12829 ) ( CAN_TRAVERSE ?AUTO_12828 ?AUTO_12833 ?AUTO_12830 ) ( VISIBLE ?AUTO_12833 ?AUTO_12830 ) ( not ( = ?AUTO_12830 ?AUTO_12833 ) ) ( not ( = ?AUTO_12829 ?AUTO_12833 ) ) ( CALIBRATION_TARGET ?AUTO_12832 ?AUTO_12831 ) ( VISIBLE_FROM ?AUTO_12831 ?AUTO_12833 ) ( not ( = ?AUTO_12825 ?AUTO_12831 ) ) ( CAN_TRAVERSE ?AUTO_12828 ?AUTO_12830 ?AUTO_12833 ) ( VISIBLE ?AUTO_12830 ?AUTO_12833 ) ( CAN_TRAVERSE ?AUTO_12828 ?AUTO_12829 ?AUTO_12830 ) ( AT ?AUTO_12828 ?AUTO_12829 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_12828 ?AUTO_12829 ?AUTO_12830 )
      ( GET_IMAGE_DATA ?AUTO_12825 ?AUTO_12826 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_12825 ?AUTO_12826 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_13025 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13026 - LANDER
      ?AUTO_13030 - WAYPOINT
      ?AUTO_13029 - WAYPOINT
      ?AUTO_13031 - ROVER
      ?AUTO_13027 - WAYPOINT
      ?AUTO_13028 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13026 ?AUTO_13030 ) ( VISIBLE ?AUTO_13029 ?AUTO_13030 ) ( AVAILABLE ?AUTO_13031 ) ( CHANNEL_FREE ?AUTO_13026 ) ( not ( = ?AUTO_13025 ?AUTO_13029 ) ) ( not ( = ?AUTO_13025 ?AUTO_13030 ) ) ( not ( = ?AUTO_13029 ?AUTO_13030 ) ) ( CAN_TRAVERSE ?AUTO_13031 ?AUTO_13027 ?AUTO_13029 ) ( VISIBLE ?AUTO_13027 ?AUTO_13029 ) ( not ( = ?AUTO_13025 ?AUTO_13027 ) ) ( not ( = ?AUTO_13030 ?AUTO_13027 ) ) ( not ( = ?AUTO_13029 ?AUTO_13027 ) ) ( CAN_TRAVERSE ?AUTO_13031 ?AUTO_13025 ?AUTO_13027 ) ( VISIBLE ?AUTO_13025 ?AUTO_13027 ) ( AT_ROCK_SAMPLE ?AUTO_13025 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_13031 ) ( STORE_OF ?AUTO_13028 ?AUTO_13031 ) ( EMPTY ?AUTO_13028 ) ( CAN_TRAVERSE ?AUTO_13031 ?AUTO_13027 ?AUTO_13025 ) ( VISIBLE ?AUTO_13027 ?AUTO_13025 ) ( CAN_TRAVERSE ?AUTO_13031 ?AUTO_13029 ?AUTO_13027 ) ( AT ?AUTO_13031 ?AUTO_13029 ) ( VISIBLE ?AUTO_13029 ?AUTO_13027 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13031 ?AUTO_13029 ?AUTO_13027 )
      ( GET_ROCK_DATA ?AUTO_13025 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_13025 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_13032 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13035 - LANDER
      ?AUTO_13038 - WAYPOINT
      ?AUTO_13036 - WAYPOINT
      ?AUTO_13034 - ROVER
      ?AUTO_13033 - WAYPOINT
      ?AUTO_13037 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13035 ?AUTO_13038 ) ( VISIBLE ?AUTO_13036 ?AUTO_13038 ) ( AVAILABLE ?AUTO_13034 ) ( CHANNEL_FREE ?AUTO_13035 ) ( not ( = ?AUTO_13032 ?AUTO_13036 ) ) ( not ( = ?AUTO_13032 ?AUTO_13038 ) ) ( not ( = ?AUTO_13036 ?AUTO_13038 ) ) ( CAN_TRAVERSE ?AUTO_13034 ?AUTO_13033 ?AUTO_13036 ) ( VISIBLE ?AUTO_13033 ?AUTO_13036 ) ( not ( = ?AUTO_13032 ?AUTO_13033 ) ) ( not ( = ?AUTO_13038 ?AUTO_13033 ) ) ( not ( = ?AUTO_13036 ?AUTO_13033 ) ) ( CAN_TRAVERSE ?AUTO_13034 ?AUTO_13032 ?AUTO_13033 ) ( VISIBLE ?AUTO_13032 ?AUTO_13033 ) ( AT_ROCK_SAMPLE ?AUTO_13032 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_13034 ) ( STORE_OF ?AUTO_13037 ?AUTO_13034 ) ( CAN_TRAVERSE ?AUTO_13034 ?AUTO_13033 ?AUTO_13032 ) ( VISIBLE ?AUTO_13033 ?AUTO_13032 ) ( CAN_TRAVERSE ?AUTO_13034 ?AUTO_13036 ?AUTO_13033 ) ( AT ?AUTO_13034 ?AUTO_13036 ) ( VISIBLE ?AUTO_13036 ?AUTO_13033 ) ( FULL ?AUTO_13037 ) )
    :subtasks
    ( ( !DROP ?AUTO_13034 ?AUTO_13037 )
      ( GET_ROCK_DATA ?AUTO_13032 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_13032 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_13053 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13057 - LANDER
      ?AUTO_13059 - WAYPOINT
      ?AUTO_13056 - WAYPOINT
      ?AUTO_13058 - ROVER
      ?AUTO_13055 - WAYPOINT
      ?AUTO_13054 - STORE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13057 ?AUTO_13059 ) ( VISIBLE ?AUTO_13056 ?AUTO_13059 ) ( AVAILABLE ?AUTO_13058 ) ( CHANNEL_FREE ?AUTO_13057 ) ( not ( = ?AUTO_13053 ?AUTO_13056 ) ) ( not ( = ?AUTO_13053 ?AUTO_13059 ) ) ( not ( = ?AUTO_13056 ?AUTO_13059 ) ) ( CAN_TRAVERSE ?AUTO_13058 ?AUTO_13055 ?AUTO_13056 ) ( VISIBLE ?AUTO_13055 ?AUTO_13056 ) ( not ( = ?AUTO_13053 ?AUTO_13055 ) ) ( not ( = ?AUTO_13059 ?AUTO_13055 ) ) ( not ( = ?AUTO_13056 ?AUTO_13055 ) ) ( CAN_TRAVERSE ?AUTO_13058 ?AUTO_13053 ?AUTO_13055 ) ( VISIBLE ?AUTO_13053 ?AUTO_13055 ) ( AT_ROCK_SAMPLE ?AUTO_13053 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_13058 ) ( STORE_OF ?AUTO_13054 ?AUTO_13058 ) ( EMPTY ?AUTO_13054 ) ( CAN_TRAVERSE ?AUTO_13058 ?AUTO_13055 ?AUTO_13053 ) ( VISIBLE ?AUTO_13055 ?AUTO_13053 ) ( CAN_TRAVERSE ?AUTO_13058 ?AUTO_13056 ?AUTO_13055 ) ( VISIBLE ?AUTO_13056 ?AUTO_13055 ) ( CAN_TRAVERSE ?AUTO_13058 ?AUTO_13059 ?AUTO_13056 ) ( AT ?AUTO_13058 ?AUTO_13059 ) ( VISIBLE ?AUTO_13059 ?AUTO_13056 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13058 ?AUTO_13059 ?AUTO_13056 )
      ( GET_ROCK_DATA ?AUTO_13053 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_13053 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13099 - OBJECTIVE
      ?AUTO_13100 - MODE
    )
    :vars
    (
      ?AUTO_13101 - LANDER
      ?AUTO_13104 - WAYPOINT
      ?AUTO_13102 - WAYPOINT
      ?AUTO_13103 - ROVER
      ?AUTO_13105 - CAMERA
      ?AUTO_13106 - OBJECTIVE
      ?AUTO_13107 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13101 ?AUTO_13104 ) ( VISIBLE ?AUTO_13102 ?AUTO_13104 ) ( AVAILABLE ?AUTO_13103 ) ( CHANNEL_FREE ?AUTO_13101 ) ( not ( = ?AUTO_13102 ?AUTO_13104 ) ) ( ON_BOARD ?AUTO_13105 ?AUTO_13103 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13103 ) ( SUPPORTS ?AUTO_13105 ?AUTO_13100 ) ( VISIBLE_FROM ?AUTO_13099 ?AUTO_13102 ) ( CAN_TRAVERSE ?AUTO_13103 ?AUTO_13104 ?AUTO_13102 ) ( VISIBLE ?AUTO_13104 ?AUTO_13102 ) ( CALIBRATION_TARGET ?AUTO_13105 ?AUTO_13106 ) ( VISIBLE_FROM ?AUTO_13106 ?AUTO_13104 ) ( not ( = ?AUTO_13099 ?AUTO_13106 ) ) ( CAN_TRAVERSE ?AUTO_13103 ?AUTO_13107 ?AUTO_13104 ) ( VISIBLE ?AUTO_13107 ?AUTO_13104 ) ( not ( = ?AUTO_13104 ?AUTO_13107 ) ) ( not ( = ?AUTO_13102 ?AUTO_13107 ) ) ( CAN_TRAVERSE ?AUTO_13103 ?AUTO_13102 ?AUTO_13107 ) ( AT ?AUTO_13103 ?AUTO_13102 ) ( VISIBLE ?AUTO_13102 ?AUTO_13107 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13103 ?AUTO_13102 ?AUTO_13107 )
      ( GET_IMAGE_DATA ?AUTO_13099 ?AUTO_13100 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13099 ?AUTO_13100 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_13149 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13154 - LANDER
      ?AUTO_13153 - WAYPOINT
      ?AUTO_13150 - WAYPOINT
      ?AUTO_13155 - ROVER
      ?AUTO_13152 - WAYPOINT
      ?AUTO_13151 - STORE
      ?AUTO_13156 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13154 ?AUTO_13153 ) ( VISIBLE ?AUTO_13150 ?AUTO_13153 ) ( AVAILABLE ?AUTO_13155 ) ( CHANNEL_FREE ?AUTO_13154 ) ( not ( = ?AUTO_13149 ?AUTO_13150 ) ) ( not ( = ?AUTO_13149 ?AUTO_13153 ) ) ( not ( = ?AUTO_13150 ?AUTO_13153 ) ) ( CAN_TRAVERSE ?AUTO_13155 ?AUTO_13152 ?AUTO_13150 ) ( VISIBLE ?AUTO_13152 ?AUTO_13150 ) ( not ( = ?AUTO_13149 ?AUTO_13152 ) ) ( not ( = ?AUTO_13153 ?AUTO_13152 ) ) ( not ( = ?AUTO_13150 ?AUTO_13152 ) ) ( CAN_TRAVERSE ?AUTO_13155 ?AUTO_13149 ?AUTO_13152 ) ( VISIBLE ?AUTO_13149 ?AUTO_13152 ) ( AT_ROCK_SAMPLE ?AUTO_13149 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_13155 ) ( STORE_OF ?AUTO_13151 ?AUTO_13155 ) ( EMPTY ?AUTO_13151 ) ( CAN_TRAVERSE ?AUTO_13155 ?AUTO_13152 ?AUTO_13149 ) ( VISIBLE ?AUTO_13152 ?AUTO_13149 ) ( CAN_TRAVERSE ?AUTO_13155 ?AUTO_13150 ?AUTO_13152 ) ( VISIBLE ?AUTO_13150 ?AUTO_13152 ) ( CAN_TRAVERSE ?AUTO_13155 ?AUTO_13156 ?AUTO_13150 ) ( AT ?AUTO_13155 ?AUTO_13156 ) ( VISIBLE ?AUTO_13156 ?AUTO_13150 ) ( not ( = ?AUTO_13149 ?AUTO_13156 ) ) ( not ( = ?AUTO_13153 ?AUTO_13156 ) ) ( not ( = ?AUTO_13150 ?AUTO_13156 ) ) ( not ( = ?AUTO_13152 ?AUTO_13156 ) ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13155 ?AUTO_13156 ?AUTO_13150 )
      ( GET_ROCK_DATA ?AUTO_13149 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_13149 ) )
  )

  ( :method GET_ROCK_DATA
    :parameters
    (
      ?AUTO_13159 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13161 - LANDER
      ?AUTO_13162 - WAYPOINT
      ?AUTO_13164 - WAYPOINT
      ?AUTO_13160 - ROVER
      ?AUTO_13163 - WAYPOINT
      ?AUTO_13165 - STORE
      ?AUTO_13166 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13161 ?AUTO_13162 ) ( VISIBLE ?AUTO_13164 ?AUTO_13162 ) ( AVAILABLE ?AUTO_13160 ) ( CHANNEL_FREE ?AUTO_13161 ) ( not ( = ?AUTO_13159 ?AUTO_13164 ) ) ( not ( = ?AUTO_13159 ?AUTO_13162 ) ) ( not ( = ?AUTO_13164 ?AUTO_13162 ) ) ( CAN_TRAVERSE ?AUTO_13160 ?AUTO_13163 ?AUTO_13164 ) ( VISIBLE ?AUTO_13163 ?AUTO_13164 ) ( not ( = ?AUTO_13159 ?AUTO_13163 ) ) ( not ( = ?AUTO_13162 ?AUTO_13163 ) ) ( not ( = ?AUTO_13164 ?AUTO_13163 ) ) ( CAN_TRAVERSE ?AUTO_13160 ?AUTO_13159 ?AUTO_13163 ) ( VISIBLE ?AUTO_13159 ?AUTO_13163 ) ( AT_ROCK_SAMPLE ?AUTO_13159 ) ( EQUIPPED_FOR_ROCK_ANALYSIS ?AUTO_13160 ) ( STORE_OF ?AUTO_13165 ?AUTO_13160 ) ( EMPTY ?AUTO_13165 ) ( CAN_TRAVERSE ?AUTO_13160 ?AUTO_13163 ?AUTO_13159 ) ( VISIBLE ?AUTO_13163 ?AUTO_13159 ) ( CAN_TRAVERSE ?AUTO_13160 ?AUTO_13164 ?AUTO_13163 ) ( VISIBLE ?AUTO_13164 ?AUTO_13163 ) ( CAN_TRAVERSE ?AUTO_13160 ?AUTO_13166 ?AUTO_13164 ) ( VISIBLE ?AUTO_13166 ?AUTO_13164 ) ( not ( = ?AUTO_13159 ?AUTO_13166 ) ) ( not ( = ?AUTO_13162 ?AUTO_13166 ) ) ( not ( = ?AUTO_13164 ?AUTO_13166 ) ) ( not ( = ?AUTO_13163 ?AUTO_13166 ) ) ( CAN_TRAVERSE ?AUTO_13160 ?AUTO_13162 ?AUTO_13166 ) ( AT ?AUTO_13160 ?AUTO_13162 ) ( VISIBLE ?AUTO_13162 ?AUTO_13166 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13160 ?AUTO_13162 ?AUTO_13166 )
      ( GET_ROCK_DATA ?AUTO_13159 )
      ( GET_ROCK_DATA-VERIFY ?AUTO_13159 ) )
  )

  ( :method GET_SOIL_DATA
    :parameters
    (
      ?AUTO_13288 - WAYPOINT
    )
    :vars
    (
      ?AUTO_13293 - LANDER
      ?AUTO_13291 - WAYPOINT
      ?AUTO_13294 - WAYPOINT
      ?AUTO_13290 - ROVER
      ?AUTO_13289 - STORE
      ?AUTO_13292 - WAYPOINT
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13293 ?AUTO_13291 ) ( VISIBLE ?AUTO_13294 ?AUTO_13291 ) ( AVAILABLE ?AUTO_13290 ) ( CHANNEL_FREE ?AUTO_13293 ) ( not ( = ?AUTO_13288 ?AUTO_13294 ) ) ( not ( = ?AUTO_13288 ?AUTO_13291 ) ) ( not ( = ?AUTO_13294 ?AUTO_13291 ) ) ( CAN_TRAVERSE ?AUTO_13290 ?AUTO_13288 ?AUTO_13294 ) ( VISIBLE ?AUTO_13288 ?AUTO_13294 ) ( AT_SOIL_SAMPLE ?AUTO_13288 ) ( EQUIPPED_FOR_SOIL_ANALYSIS ?AUTO_13290 ) ( STORE_OF ?AUTO_13289 ?AUTO_13290 ) ( CAN_TRAVERSE ?AUTO_13290 ?AUTO_13292 ?AUTO_13288 ) ( VISIBLE ?AUTO_13292 ?AUTO_13288 ) ( not ( = ?AUTO_13288 ?AUTO_13292 ) ) ( not ( = ?AUTO_13291 ?AUTO_13292 ) ) ( not ( = ?AUTO_13294 ?AUTO_13292 ) ) ( CAN_TRAVERSE ?AUTO_13290 ?AUTO_13291 ?AUTO_13292 ) ( AT ?AUTO_13290 ?AUTO_13291 ) ( VISIBLE ?AUTO_13291 ?AUTO_13292 ) ( FULL ?AUTO_13289 ) )
    :subtasks
    ( ( !DROP ?AUTO_13290 ?AUTO_13289 )
      ( GET_SOIL_DATA ?AUTO_13288 )
      ( GET_SOIL_DATA-VERIFY ?AUTO_13288 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13347 - OBJECTIVE
      ?AUTO_13348 - MODE
    )
    :vars
    (
      ?AUTO_13351 - LANDER
      ?AUTO_13353 - WAYPOINT
      ?AUTO_13350 - WAYPOINT
      ?AUTO_13354 - ROVER
      ?AUTO_13349 - CAMERA
      ?AUTO_13352 - WAYPOINT
      ?AUTO_13355 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13351 ?AUTO_13353 ) ( VISIBLE ?AUTO_13350 ?AUTO_13353 ) ( AVAILABLE ?AUTO_13354 ) ( CHANNEL_FREE ?AUTO_13351 ) ( not ( = ?AUTO_13350 ?AUTO_13353 ) ) ( CAN_TRAVERSE ?AUTO_13354 ?AUTO_13353 ?AUTO_13350 ) ( VISIBLE ?AUTO_13353 ?AUTO_13350 ) ( ON_BOARD ?AUTO_13349 ?AUTO_13354 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13354 ) ( SUPPORTS ?AUTO_13349 ?AUTO_13348 ) ( VISIBLE_FROM ?AUTO_13347 ?AUTO_13353 ) ( CAN_TRAVERSE ?AUTO_13354 ?AUTO_13352 ?AUTO_13353 ) ( VISIBLE ?AUTO_13352 ?AUTO_13353 ) ( not ( = ?AUTO_13353 ?AUTO_13352 ) ) ( not ( = ?AUTO_13350 ?AUTO_13352 ) ) ( CALIBRATION_TARGET ?AUTO_13349 ?AUTO_13355 ) ( VISIBLE_FROM ?AUTO_13355 ?AUTO_13352 ) ( not ( = ?AUTO_13347 ?AUTO_13355 ) ) ( CAN_TRAVERSE ?AUTO_13354 ?AUTO_13350 ?AUTO_13352 ) ( AT ?AUTO_13354 ?AUTO_13350 ) ( VISIBLE ?AUTO_13350 ?AUTO_13352 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13354 ?AUTO_13350 ?AUTO_13352 )
      ( GET_IMAGE_DATA ?AUTO_13347 ?AUTO_13348 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13347 ?AUTO_13348 ) )
  )

  ( :method GET_IMAGE_DATA
    :parameters
    (
      ?AUTO_13368 - OBJECTIVE
      ?AUTO_13369 - MODE
    )
    :vars
    (
      ?AUTO_13376 - LANDER
      ?AUTO_13370 - WAYPOINT
      ?AUTO_13371 - WAYPOINT
      ?AUTO_13372 - ROVER
      ?AUTO_13375 - CAMERA
      ?AUTO_13374 - WAYPOINT
      ?AUTO_13373 - OBJECTIVE
    )
    :precondition
    ( and ( AT_LANDER ?AUTO_13376 ?AUTO_13370 ) ( VISIBLE ?AUTO_13371 ?AUTO_13370 ) ( AVAILABLE ?AUTO_13372 ) ( CHANNEL_FREE ?AUTO_13376 ) ( not ( = ?AUTO_13371 ?AUTO_13370 ) ) ( CAN_TRAVERSE ?AUTO_13372 ?AUTO_13370 ?AUTO_13371 ) ( VISIBLE ?AUTO_13370 ?AUTO_13371 ) ( ON_BOARD ?AUTO_13375 ?AUTO_13372 ) ( EQUIPPED_FOR_IMAGING ?AUTO_13372 ) ( SUPPORTS ?AUTO_13375 ?AUTO_13369 ) ( VISIBLE_FROM ?AUTO_13368 ?AUTO_13370 ) ( CAN_TRAVERSE ?AUTO_13372 ?AUTO_13374 ?AUTO_13370 ) ( VISIBLE ?AUTO_13374 ?AUTO_13370 ) ( not ( = ?AUTO_13370 ?AUTO_13374 ) ) ( not ( = ?AUTO_13371 ?AUTO_13374 ) ) ( CALIBRATION_TARGET ?AUTO_13375 ?AUTO_13373 ) ( VISIBLE_FROM ?AUTO_13373 ?AUTO_13374 ) ( not ( = ?AUTO_13368 ?AUTO_13373 ) ) ( CAN_TRAVERSE ?AUTO_13372 ?AUTO_13371 ?AUTO_13374 ) ( VISIBLE ?AUTO_13371 ?AUTO_13374 ) ( AT ?AUTO_13372 ?AUTO_13370 ) )
    :subtasks
    ( ( !NAVIGATE ?AUTO_13372 ?AUTO_13370 ?AUTO_13371 )
      ( GET_IMAGE_DATA ?AUTO_13368 ?AUTO_13369 )
      ( GET_IMAGE_DATA-VERIFY ?AUTO_13368 ?AUTO_13369 ) )
  )

)

