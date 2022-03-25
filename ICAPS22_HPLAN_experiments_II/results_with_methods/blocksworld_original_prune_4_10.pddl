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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10844 - BLOCK
      ?auto_10845 - BLOCK
      ?auto_10846 - BLOCK
      ?auto_10847 - BLOCK
    )
    :vars
    (
      ?auto_10848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10848 ?auto_10847 ) ( CLEAR ?auto_10848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10844 ) ( ON ?auto_10845 ?auto_10844 ) ( ON ?auto_10846 ?auto_10845 ) ( ON ?auto_10847 ?auto_10846 ) ( not ( = ?auto_10844 ?auto_10845 ) ) ( not ( = ?auto_10844 ?auto_10846 ) ) ( not ( = ?auto_10844 ?auto_10847 ) ) ( not ( = ?auto_10844 ?auto_10848 ) ) ( not ( = ?auto_10845 ?auto_10846 ) ) ( not ( = ?auto_10845 ?auto_10847 ) ) ( not ( = ?auto_10845 ?auto_10848 ) ) ( not ( = ?auto_10846 ?auto_10847 ) ) ( not ( = ?auto_10846 ?auto_10848 ) ) ( not ( = ?auto_10847 ?auto_10848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10848 ?auto_10847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10850 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10850 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10850 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10851 - BLOCK
    )
    :vars
    (
      ?auto_10852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10851 ?auto_10852 ) ( CLEAR ?auto_10851 ) ( HAND-EMPTY ) ( not ( = ?auto_10851 ?auto_10852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10851 ?auto_10852 )
      ( MAKE-1PILE ?auto_10851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10856 - BLOCK
      ?auto_10857 - BLOCK
      ?auto_10858 - BLOCK
    )
    :vars
    (
      ?auto_10859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10859 ?auto_10858 ) ( CLEAR ?auto_10859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10856 ) ( ON ?auto_10857 ?auto_10856 ) ( ON ?auto_10858 ?auto_10857 ) ( not ( = ?auto_10856 ?auto_10857 ) ) ( not ( = ?auto_10856 ?auto_10858 ) ) ( not ( = ?auto_10856 ?auto_10859 ) ) ( not ( = ?auto_10857 ?auto_10858 ) ) ( not ( = ?auto_10857 ?auto_10859 ) ) ( not ( = ?auto_10858 ?auto_10859 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10859 ?auto_10858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10860 - BLOCK
      ?auto_10861 - BLOCK
      ?auto_10862 - BLOCK
    )
    :vars
    (
      ?auto_10863 - BLOCK
      ?auto_10864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10863 ?auto_10862 ) ( CLEAR ?auto_10863 ) ( ON-TABLE ?auto_10860 ) ( ON ?auto_10861 ?auto_10860 ) ( ON ?auto_10862 ?auto_10861 ) ( not ( = ?auto_10860 ?auto_10861 ) ) ( not ( = ?auto_10860 ?auto_10862 ) ) ( not ( = ?auto_10860 ?auto_10863 ) ) ( not ( = ?auto_10861 ?auto_10862 ) ) ( not ( = ?auto_10861 ?auto_10863 ) ) ( not ( = ?auto_10862 ?auto_10863 ) ) ( HOLDING ?auto_10864 ) ( not ( = ?auto_10860 ?auto_10864 ) ) ( not ( = ?auto_10861 ?auto_10864 ) ) ( not ( = ?auto_10862 ?auto_10864 ) ) ( not ( = ?auto_10863 ?auto_10864 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_10864 )
      ( MAKE-3PILE ?auto_10860 ?auto_10861 ?auto_10862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10865 - BLOCK
      ?auto_10866 - BLOCK
      ?auto_10867 - BLOCK
    )
    :vars
    (
      ?auto_10869 - BLOCK
      ?auto_10868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10869 ?auto_10867 ) ( ON-TABLE ?auto_10865 ) ( ON ?auto_10866 ?auto_10865 ) ( ON ?auto_10867 ?auto_10866 ) ( not ( = ?auto_10865 ?auto_10866 ) ) ( not ( = ?auto_10865 ?auto_10867 ) ) ( not ( = ?auto_10865 ?auto_10869 ) ) ( not ( = ?auto_10866 ?auto_10867 ) ) ( not ( = ?auto_10866 ?auto_10869 ) ) ( not ( = ?auto_10867 ?auto_10869 ) ) ( not ( = ?auto_10865 ?auto_10868 ) ) ( not ( = ?auto_10866 ?auto_10868 ) ) ( not ( = ?auto_10867 ?auto_10868 ) ) ( not ( = ?auto_10869 ?auto_10868 ) ) ( ON ?auto_10868 ?auto_10869 ) ( CLEAR ?auto_10868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10865 ?auto_10866 ?auto_10867 ?auto_10869 )
      ( MAKE-3PILE ?auto_10865 ?auto_10866 ?auto_10867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10872 - BLOCK
      ?auto_10873 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10873 ) ( CLEAR ?auto_10872 ) ( ON-TABLE ?auto_10872 ) ( not ( = ?auto_10872 ?auto_10873 ) ) )
    :subtasks
    ( ( !STACK ?auto_10873 ?auto_10872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10874 - BLOCK
      ?auto_10875 - BLOCK
    )
    :vars
    (
      ?auto_10876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10874 ) ( ON-TABLE ?auto_10874 ) ( not ( = ?auto_10874 ?auto_10875 ) ) ( ON ?auto_10875 ?auto_10876 ) ( CLEAR ?auto_10875 ) ( HAND-EMPTY ) ( not ( = ?auto_10874 ?auto_10876 ) ) ( not ( = ?auto_10875 ?auto_10876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10875 ?auto_10876 )
      ( MAKE-2PILE ?auto_10874 ?auto_10875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10877 - BLOCK
      ?auto_10878 - BLOCK
    )
    :vars
    (
      ?auto_10879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10877 ?auto_10878 ) ) ( ON ?auto_10878 ?auto_10879 ) ( CLEAR ?auto_10878 ) ( not ( = ?auto_10877 ?auto_10879 ) ) ( not ( = ?auto_10878 ?auto_10879 ) ) ( HOLDING ?auto_10877 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10877 )
      ( MAKE-2PILE ?auto_10877 ?auto_10878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10880 - BLOCK
      ?auto_10881 - BLOCK
    )
    :vars
    (
      ?auto_10882 - BLOCK
      ?auto_10883 - BLOCK
      ?auto_10884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10880 ?auto_10881 ) ) ( ON ?auto_10881 ?auto_10882 ) ( not ( = ?auto_10880 ?auto_10882 ) ) ( not ( = ?auto_10881 ?auto_10882 ) ) ( ON ?auto_10880 ?auto_10881 ) ( CLEAR ?auto_10880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10883 ) ( ON ?auto_10884 ?auto_10883 ) ( ON ?auto_10882 ?auto_10884 ) ( not ( = ?auto_10883 ?auto_10884 ) ) ( not ( = ?auto_10883 ?auto_10882 ) ) ( not ( = ?auto_10883 ?auto_10881 ) ) ( not ( = ?auto_10883 ?auto_10880 ) ) ( not ( = ?auto_10884 ?auto_10882 ) ) ( not ( = ?auto_10884 ?auto_10881 ) ) ( not ( = ?auto_10884 ?auto_10880 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10883 ?auto_10884 ?auto_10882 ?auto_10881 )
      ( MAKE-2PILE ?auto_10880 ?auto_10881 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10887 - BLOCK
      ?auto_10888 - BLOCK
    )
    :vars
    (
      ?auto_10889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10889 ?auto_10888 ) ( CLEAR ?auto_10889 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10887 ) ( ON ?auto_10888 ?auto_10887 ) ( not ( = ?auto_10887 ?auto_10888 ) ) ( not ( = ?auto_10887 ?auto_10889 ) ) ( not ( = ?auto_10888 ?auto_10889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10889 ?auto_10888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10890 - BLOCK
      ?auto_10891 - BLOCK
    )
    :vars
    (
      ?auto_10892 - BLOCK
      ?auto_10893 - BLOCK
      ?auto_10894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10892 ?auto_10891 ) ( CLEAR ?auto_10892 ) ( ON-TABLE ?auto_10890 ) ( ON ?auto_10891 ?auto_10890 ) ( not ( = ?auto_10890 ?auto_10891 ) ) ( not ( = ?auto_10890 ?auto_10892 ) ) ( not ( = ?auto_10891 ?auto_10892 ) ) ( HOLDING ?auto_10893 ) ( CLEAR ?auto_10894 ) ( not ( = ?auto_10890 ?auto_10893 ) ) ( not ( = ?auto_10890 ?auto_10894 ) ) ( not ( = ?auto_10891 ?auto_10893 ) ) ( not ( = ?auto_10891 ?auto_10894 ) ) ( not ( = ?auto_10892 ?auto_10893 ) ) ( not ( = ?auto_10892 ?auto_10894 ) ) ( not ( = ?auto_10893 ?auto_10894 ) ) )
    :subtasks
    ( ( !STACK ?auto_10893 ?auto_10894 )
      ( MAKE-2PILE ?auto_10890 ?auto_10891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11090 - BLOCK
      ?auto_11091 - BLOCK
    )
    :vars
    (
      ?auto_11092 - BLOCK
      ?auto_11093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11092 ?auto_11091 ) ( ON-TABLE ?auto_11090 ) ( ON ?auto_11091 ?auto_11090 ) ( not ( = ?auto_11090 ?auto_11091 ) ) ( not ( = ?auto_11090 ?auto_11092 ) ) ( not ( = ?auto_11091 ?auto_11092 ) ) ( not ( = ?auto_11090 ?auto_11093 ) ) ( not ( = ?auto_11091 ?auto_11093 ) ) ( not ( = ?auto_11092 ?auto_11093 ) ) ( ON ?auto_11093 ?auto_11092 ) ( CLEAR ?auto_11093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11090 ?auto_11091 ?auto_11092 )
      ( MAKE-2PILE ?auto_11090 ?auto_11091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10900 - BLOCK
      ?auto_10901 - BLOCK
    )
    :vars
    (
      ?auto_10902 - BLOCK
      ?auto_10903 - BLOCK
      ?auto_10904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10902 ?auto_10901 ) ( ON-TABLE ?auto_10900 ) ( ON ?auto_10901 ?auto_10900 ) ( not ( = ?auto_10900 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10902 ) ) ( not ( = ?auto_10901 ?auto_10902 ) ) ( not ( = ?auto_10900 ?auto_10903 ) ) ( not ( = ?auto_10900 ?auto_10904 ) ) ( not ( = ?auto_10901 ?auto_10903 ) ) ( not ( = ?auto_10901 ?auto_10904 ) ) ( not ( = ?auto_10902 ?auto_10903 ) ) ( not ( = ?auto_10902 ?auto_10904 ) ) ( not ( = ?auto_10903 ?auto_10904 ) ) ( ON ?auto_10903 ?auto_10902 ) ( CLEAR ?auto_10903 ) ( HOLDING ?auto_10904 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10904 )
      ( MAKE-2PILE ?auto_10900 ?auto_10901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10905 - BLOCK
      ?auto_10906 - BLOCK
    )
    :vars
    (
      ?auto_10908 - BLOCK
      ?auto_10907 - BLOCK
      ?auto_10909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10908 ?auto_10906 ) ( ON-TABLE ?auto_10905 ) ( ON ?auto_10906 ?auto_10905 ) ( not ( = ?auto_10905 ?auto_10906 ) ) ( not ( = ?auto_10905 ?auto_10908 ) ) ( not ( = ?auto_10906 ?auto_10908 ) ) ( not ( = ?auto_10905 ?auto_10907 ) ) ( not ( = ?auto_10905 ?auto_10909 ) ) ( not ( = ?auto_10906 ?auto_10907 ) ) ( not ( = ?auto_10906 ?auto_10909 ) ) ( not ( = ?auto_10908 ?auto_10907 ) ) ( not ( = ?auto_10908 ?auto_10909 ) ) ( not ( = ?auto_10907 ?auto_10909 ) ) ( ON ?auto_10907 ?auto_10908 ) ( ON ?auto_10909 ?auto_10907 ) ( CLEAR ?auto_10909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10905 ?auto_10906 ?auto_10908 ?auto_10907 )
      ( MAKE-2PILE ?auto_10905 ?auto_10906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10913 - BLOCK
      ?auto_10914 - BLOCK
      ?auto_10915 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10915 ) ( CLEAR ?auto_10914 ) ( ON-TABLE ?auto_10913 ) ( ON ?auto_10914 ?auto_10913 ) ( not ( = ?auto_10913 ?auto_10914 ) ) ( not ( = ?auto_10913 ?auto_10915 ) ) ( not ( = ?auto_10914 ?auto_10915 ) ) )
    :subtasks
    ( ( !STACK ?auto_10915 ?auto_10914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10916 - BLOCK
      ?auto_10917 - BLOCK
      ?auto_10918 - BLOCK
    )
    :vars
    (
      ?auto_10919 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10917 ) ( ON-TABLE ?auto_10916 ) ( ON ?auto_10917 ?auto_10916 ) ( not ( = ?auto_10916 ?auto_10917 ) ) ( not ( = ?auto_10916 ?auto_10918 ) ) ( not ( = ?auto_10917 ?auto_10918 ) ) ( ON ?auto_10918 ?auto_10919 ) ( CLEAR ?auto_10918 ) ( HAND-EMPTY ) ( not ( = ?auto_10916 ?auto_10919 ) ) ( not ( = ?auto_10917 ?auto_10919 ) ) ( not ( = ?auto_10918 ?auto_10919 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10918 ?auto_10919 )
      ( MAKE-3PILE ?auto_10916 ?auto_10917 ?auto_10918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10920 - BLOCK
      ?auto_10921 - BLOCK
      ?auto_10922 - BLOCK
    )
    :vars
    (
      ?auto_10923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10920 ) ( not ( = ?auto_10920 ?auto_10921 ) ) ( not ( = ?auto_10920 ?auto_10922 ) ) ( not ( = ?auto_10921 ?auto_10922 ) ) ( ON ?auto_10922 ?auto_10923 ) ( CLEAR ?auto_10922 ) ( not ( = ?auto_10920 ?auto_10923 ) ) ( not ( = ?auto_10921 ?auto_10923 ) ) ( not ( = ?auto_10922 ?auto_10923 ) ) ( HOLDING ?auto_10921 ) ( CLEAR ?auto_10920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10920 ?auto_10921 )
      ( MAKE-3PILE ?auto_10920 ?auto_10921 ?auto_10922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10924 - BLOCK
      ?auto_10925 - BLOCK
      ?auto_10926 - BLOCK
    )
    :vars
    (
      ?auto_10927 - BLOCK
      ?auto_10928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10924 ) ( not ( = ?auto_10924 ?auto_10925 ) ) ( not ( = ?auto_10924 ?auto_10926 ) ) ( not ( = ?auto_10925 ?auto_10926 ) ) ( ON ?auto_10926 ?auto_10927 ) ( not ( = ?auto_10924 ?auto_10927 ) ) ( not ( = ?auto_10925 ?auto_10927 ) ) ( not ( = ?auto_10926 ?auto_10927 ) ) ( CLEAR ?auto_10924 ) ( ON ?auto_10925 ?auto_10926 ) ( CLEAR ?auto_10925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10928 ) ( ON ?auto_10927 ?auto_10928 ) ( not ( = ?auto_10928 ?auto_10927 ) ) ( not ( = ?auto_10928 ?auto_10926 ) ) ( not ( = ?auto_10928 ?auto_10925 ) ) ( not ( = ?auto_10924 ?auto_10928 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10928 ?auto_10927 ?auto_10926 )
      ( MAKE-3PILE ?auto_10924 ?auto_10925 ?auto_10926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10929 - BLOCK
      ?auto_10930 - BLOCK
      ?auto_10931 - BLOCK
    )
    :vars
    (
      ?auto_10932 - BLOCK
      ?auto_10933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10929 ?auto_10930 ) ) ( not ( = ?auto_10929 ?auto_10931 ) ) ( not ( = ?auto_10930 ?auto_10931 ) ) ( ON ?auto_10931 ?auto_10932 ) ( not ( = ?auto_10929 ?auto_10932 ) ) ( not ( = ?auto_10930 ?auto_10932 ) ) ( not ( = ?auto_10931 ?auto_10932 ) ) ( ON ?auto_10930 ?auto_10931 ) ( CLEAR ?auto_10930 ) ( ON-TABLE ?auto_10933 ) ( ON ?auto_10932 ?auto_10933 ) ( not ( = ?auto_10933 ?auto_10932 ) ) ( not ( = ?auto_10933 ?auto_10931 ) ) ( not ( = ?auto_10933 ?auto_10930 ) ) ( not ( = ?auto_10929 ?auto_10933 ) ) ( HOLDING ?auto_10929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10929 )
      ( MAKE-3PILE ?auto_10929 ?auto_10930 ?auto_10931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10934 - BLOCK
      ?auto_10935 - BLOCK
      ?auto_10936 - BLOCK
    )
    :vars
    (
      ?auto_10937 - BLOCK
      ?auto_10938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10936 ) ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( ON ?auto_10936 ?auto_10937 ) ( not ( = ?auto_10934 ?auto_10937 ) ) ( not ( = ?auto_10935 ?auto_10937 ) ) ( not ( = ?auto_10936 ?auto_10937 ) ) ( ON ?auto_10935 ?auto_10936 ) ( ON-TABLE ?auto_10938 ) ( ON ?auto_10937 ?auto_10938 ) ( not ( = ?auto_10938 ?auto_10937 ) ) ( not ( = ?auto_10938 ?auto_10936 ) ) ( not ( = ?auto_10938 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10938 ) ) ( ON ?auto_10934 ?auto_10935 ) ( CLEAR ?auto_10934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10938 ?auto_10937 ?auto_10936 ?auto_10935 )
      ( MAKE-3PILE ?auto_10934 ?auto_10935 ?auto_10936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10940 - BLOCK
    )
    :vars
    (
      ?auto_10941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10941 ?auto_10940 ) ( CLEAR ?auto_10941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10940 ) ( not ( = ?auto_10940 ?auto_10941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10941 ?auto_10940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10942 - BLOCK
    )
    :vars
    (
      ?auto_10943 - BLOCK
      ?auto_10944 - BLOCK
      ?auto_10945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10943 ?auto_10942 ) ( CLEAR ?auto_10943 ) ( ON-TABLE ?auto_10942 ) ( not ( = ?auto_10942 ?auto_10943 ) ) ( HOLDING ?auto_10944 ) ( CLEAR ?auto_10945 ) ( not ( = ?auto_10942 ?auto_10944 ) ) ( not ( = ?auto_10942 ?auto_10945 ) ) ( not ( = ?auto_10943 ?auto_10944 ) ) ( not ( = ?auto_10943 ?auto_10945 ) ) ( not ( = ?auto_10944 ?auto_10945 ) ) )
    :subtasks
    ( ( !STACK ?auto_10944 ?auto_10945 )
      ( MAKE-1PILE ?auto_10942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10946 - BLOCK
    )
    :vars
    (
      ?auto_10947 - BLOCK
      ?auto_10948 - BLOCK
      ?auto_10949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10947 ?auto_10946 ) ( ON-TABLE ?auto_10946 ) ( not ( = ?auto_10946 ?auto_10947 ) ) ( CLEAR ?auto_10948 ) ( not ( = ?auto_10946 ?auto_10949 ) ) ( not ( = ?auto_10946 ?auto_10948 ) ) ( not ( = ?auto_10947 ?auto_10949 ) ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( not ( = ?auto_10949 ?auto_10948 ) ) ( ON ?auto_10949 ?auto_10947 ) ( CLEAR ?auto_10949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10946 ?auto_10947 )
      ( MAKE-1PILE ?auto_10946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10950 - BLOCK
    )
    :vars
    (
      ?auto_10951 - BLOCK
      ?auto_10953 - BLOCK
      ?auto_10952 - BLOCK
      ?auto_10954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10951 ?auto_10950 ) ( ON-TABLE ?auto_10950 ) ( not ( = ?auto_10950 ?auto_10951 ) ) ( not ( = ?auto_10950 ?auto_10953 ) ) ( not ( = ?auto_10950 ?auto_10952 ) ) ( not ( = ?auto_10951 ?auto_10953 ) ) ( not ( = ?auto_10951 ?auto_10952 ) ) ( not ( = ?auto_10953 ?auto_10952 ) ) ( ON ?auto_10953 ?auto_10951 ) ( CLEAR ?auto_10953 ) ( HOLDING ?auto_10952 ) ( CLEAR ?auto_10954 ) ( ON-TABLE ?auto_10954 ) ( not ( = ?auto_10954 ?auto_10952 ) ) ( not ( = ?auto_10950 ?auto_10954 ) ) ( not ( = ?auto_10951 ?auto_10954 ) ) ( not ( = ?auto_10953 ?auto_10954 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10954 ?auto_10952 )
      ( MAKE-1PILE ?auto_10950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11178 - BLOCK
    )
    :vars
    (
      ?auto_11180 - BLOCK
      ?auto_11179 - BLOCK
      ?auto_11181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11180 ?auto_11178 ) ( ON-TABLE ?auto_11178 ) ( not ( = ?auto_11178 ?auto_11180 ) ) ( not ( = ?auto_11178 ?auto_11179 ) ) ( not ( = ?auto_11178 ?auto_11181 ) ) ( not ( = ?auto_11180 ?auto_11179 ) ) ( not ( = ?auto_11180 ?auto_11181 ) ) ( not ( = ?auto_11179 ?auto_11181 ) ) ( ON ?auto_11179 ?auto_11180 ) ( ON ?auto_11181 ?auto_11179 ) ( CLEAR ?auto_11181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11178 ?auto_11180 ?auto_11179 )
      ( MAKE-1PILE ?auto_11178 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10960 - BLOCK
    )
    :vars
    (
      ?auto_10964 - BLOCK
      ?auto_10961 - BLOCK
      ?auto_10963 - BLOCK
      ?auto_10962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10964 ?auto_10960 ) ( ON-TABLE ?auto_10960 ) ( not ( = ?auto_10960 ?auto_10964 ) ) ( not ( = ?auto_10960 ?auto_10961 ) ) ( not ( = ?auto_10960 ?auto_10963 ) ) ( not ( = ?auto_10964 ?auto_10961 ) ) ( not ( = ?auto_10964 ?auto_10963 ) ) ( not ( = ?auto_10961 ?auto_10963 ) ) ( ON ?auto_10961 ?auto_10964 ) ( not ( = ?auto_10962 ?auto_10963 ) ) ( not ( = ?auto_10960 ?auto_10962 ) ) ( not ( = ?auto_10964 ?auto_10962 ) ) ( not ( = ?auto_10961 ?auto_10962 ) ) ( ON ?auto_10963 ?auto_10961 ) ( CLEAR ?auto_10963 ) ( HOLDING ?auto_10962 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10962 )
      ( MAKE-1PILE ?auto_10960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10965 - BLOCK
    )
    :vars
    (
      ?auto_10969 - BLOCK
      ?auto_10966 - BLOCK
      ?auto_10967 - BLOCK
      ?auto_10968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10969 ?auto_10965 ) ( ON-TABLE ?auto_10965 ) ( not ( = ?auto_10965 ?auto_10969 ) ) ( not ( = ?auto_10965 ?auto_10966 ) ) ( not ( = ?auto_10965 ?auto_10967 ) ) ( not ( = ?auto_10969 ?auto_10966 ) ) ( not ( = ?auto_10969 ?auto_10967 ) ) ( not ( = ?auto_10966 ?auto_10967 ) ) ( ON ?auto_10966 ?auto_10969 ) ( not ( = ?auto_10968 ?auto_10967 ) ) ( not ( = ?auto_10965 ?auto_10968 ) ) ( not ( = ?auto_10969 ?auto_10968 ) ) ( not ( = ?auto_10966 ?auto_10968 ) ) ( ON ?auto_10967 ?auto_10966 ) ( ON ?auto_10968 ?auto_10967 ) ( CLEAR ?auto_10968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10965 ?auto_10969 ?auto_10966 ?auto_10967 )
      ( MAKE-1PILE ?auto_10965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10974 - BLOCK
      ?auto_10975 - BLOCK
      ?auto_10976 - BLOCK
      ?auto_10977 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_10977 ) ( CLEAR ?auto_10976 ) ( ON-TABLE ?auto_10974 ) ( ON ?auto_10975 ?auto_10974 ) ( ON ?auto_10976 ?auto_10975 ) ( not ( = ?auto_10974 ?auto_10975 ) ) ( not ( = ?auto_10974 ?auto_10976 ) ) ( not ( = ?auto_10974 ?auto_10977 ) ) ( not ( = ?auto_10975 ?auto_10976 ) ) ( not ( = ?auto_10975 ?auto_10977 ) ) ( not ( = ?auto_10976 ?auto_10977 ) ) )
    :subtasks
    ( ( !STACK ?auto_10977 ?auto_10976 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10978 - BLOCK
      ?auto_10979 - BLOCK
      ?auto_10980 - BLOCK
      ?auto_10981 - BLOCK
    )
    :vars
    (
      ?auto_10982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10980 ) ( ON-TABLE ?auto_10978 ) ( ON ?auto_10979 ?auto_10978 ) ( ON ?auto_10980 ?auto_10979 ) ( not ( = ?auto_10978 ?auto_10979 ) ) ( not ( = ?auto_10978 ?auto_10980 ) ) ( not ( = ?auto_10978 ?auto_10981 ) ) ( not ( = ?auto_10979 ?auto_10980 ) ) ( not ( = ?auto_10979 ?auto_10981 ) ) ( not ( = ?auto_10980 ?auto_10981 ) ) ( ON ?auto_10981 ?auto_10982 ) ( CLEAR ?auto_10981 ) ( HAND-EMPTY ) ( not ( = ?auto_10978 ?auto_10982 ) ) ( not ( = ?auto_10979 ?auto_10982 ) ) ( not ( = ?auto_10980 ?auto_10982 ) ) ( not ( = ?auto_10981 ?auto_10982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10981 ?auto_10982 )
      ( MAKE-4PILE ?auto_10978 ?auto_10979 ?auto_10980 ?auto_10981 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10983 - BLOCK
      ?auto_10984 - BLOCK
      ?auto_10985 - BLOCK
      ?auto_10986 - BLOCK
    )
    :vars
    (
      ?auto_10987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10983 ) ( ON ?auto_10984 ?auto_10983 ) ( not ( = ?auto_10983 ?auto_10984 ) ) ( not ( = ?auto_10983 ?auto_10985 ) ) ( not ( = ?auto_10983 ?auto_10986 ) ) ( not ( = ?auto_10984 ?auto_10985 ) ) ( not ( = ?auto_10984 ?auto_10986 ) ) ( not ( = ?auto_10985 ?auto_10986 ) ) ( ON ?auto_10986 ?auto_10987 ) ( CLEAR ?auto_10986 ) ( not ( = ?auto_10983 ?auto_10987 ) ) ( not ( = ?auto_10984 ?auto_10987 ) ) ( not ( = ?auto_10985 ?auto_10987 ) ) ( not ( = ?auto_10986 ?auto_10987 ) ) ( HOLDING ?auto_10985 ) ( CLEAR ?auto_10984 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10983 ?auto_10984 ?auto_10985 )
      ( MAKE-4PILE ?auto_10983 ?auto_10984 ?auto_10985 ?auto_10986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10988 - BLOCK
      ?auto_10989 - BLOCK
      ?auto_10990 - BLOCK
      ?auto_10991 - BLOCK
    )
    :vars
    (
      ?auto_10992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10988 ) ( ON ?auto_10989 ?auto_10988 ) ( not ( = ?auto_10988 ?auto_10989 ) ) ( not ( = ?auto_10988 ?auto_10990 ) ) ( not ( = ?auto_10988 ?auto_10991 ) ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10989 ?auto_10991 ) ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( ON ?auto_10991 ?auto_10992 ) ( not ( = ?auto_10988 ?auto_10992 ) ) ( not ( = ?auto_10989 ?auto_10992 ) ) ( not ( = ?auto_10990 ?auto_10992 ) ) ( not ( = ?auto_10991 ?auto_10992 ) ) ( CLEAR ?auto_10989 ) ( ON ?auto_10990 ?auto_10991 ) ( CLEAR ?auto_10990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10992 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10992 ?auto_10991 )
      ( MAKE-4PILE ?auto_10988 ?auto_10989 ?auto_10990 ?auto_10991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10993 - BLOCK
      ?auto_10994 - BLOCK
      ?auto_10995 - BLOCK
      ?auto_10996 - BLOCK
    )
    :vars
    (
      ?auto_10997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10993 ) ( not ( = ?auto_10993 ?auto_10994 ) ) ( not ( = ?auto_10993 ?auto_10995 ) ) ( not ( = ?auto_10993 ?auto_10996 ) ) ( not ( = ?auto_10994 ?auto_10995 ) ) ( not ( = ?auto_10994 ?auto_10996 ) ) ( not ( = ?auto_10995 ?auto_10996 ) ) ( ON ?auto_10996 ?auto_10997 ) ( not ( = ?auto_10993 ?auto_10997 ) ) ( not ( = ?auto_10994 ?auto_10997 ) ) ( not ( = ?auto_10995 ?auto_10997 ) ) ( not ( = ?auto_10996 ?auto_10997 ) ) ( ON ?auto_10995 ?auto_10996 ) ( CLEAR ?auto_10995 ) ( ON-TABLE ?auto_10997 ) ( HOLDING ?auto_10994 ) ( CLEAR ?auto_10993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10993 ?auto_10994 )
      ( MAKE-4PILE ?auto_10993 ?auto_10994 ?auto_10995 ?auto_10996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10998 - BLOCK
      ?auto_10999 - BLOCK
      ?auto_11000 - BLOCK
      ?auto_11001 - BLOCK
    )
    :vars
    (
      ?auto_11002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_10998 ) ( not ( = ?auto_10998 ?auto_10999 ) ) ( not ( = ?auto_10998 ?auto_11000 ) ) ( not ( = ?auto_10998 ?auto_11001 ) ) ( not ( = ?auto_10999 ?auto_11000 ) ) ( not ( = ?auto_10999 ?auto_11001 ) ) ( not ( = ?auto_11000 ?auto_11001 ) ) ( ON ?auto_11001 ?auto_11002 ) ( not ( = ?auto_10998 ?auto_11002 ) ) ( not ( = ?auto_10999 ?auto_11002 ) ) ( not ( = ?auto_11000 ?auto_11002 ) ) ( not ( = ?auto_11001 ?auto_11002 ) ) ( ON ?auto_11000 ?auto_11001 ) ( ON-TABLE ?auto_11002 ) ( CLEAR ?auto_10998 ) ( ON ?auto_10999 ?auto_11000 ) ( CLEAR ?auto_10999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11002 ?auto_11001 ?auto_11000 )
      ( MAKE-4PILE ?auto_10998 ?auto_10999 ?auto_11000 ?auto_11001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11003 - BLOCK
      ?auto_11004 - BLOCK
      ?auto_11005 - BLOCK
      ?auto_11006 - BLOCK
    )
    :vars
    (
      ?auto_11007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11003 ?auto_11004 ) ) ( not ( = ?auto_11003 ?auto_11005 ) ) ( not ( = ?auto_11003 ?auto_11006 ) ) ( not ( = ?auto_11004 ?auto_11005 ) ) ( not ( = ?auto_11004 ?auto_11006 ) ) ( not ( = ?auto_11005 ?auto_11006 ) ) ( ON ?auto_11006 ?auto_11007 ) ( not ( = ?auto_11003 ?auto_11007 ) ) ( not ( = ?auto_11004 ?auto_11007 ) ) ( not ( = ?auto_11005 ?auto_11007 ) ) ( not ( = ?auto_11006 ?auto_11007 ) ) ( ON ?auto_11005 ?auto_11006 ) ( ON-TABLE ?auto_11007 ) ( ON ?auto_11004 ?auto_11005 ) ( CLEAR ?auto_11004 ) ( HOLDING ?auto_11003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11003 )
      ( MAKE-4PILE ?auto_11003 ?auto_11004 ?auto_11005 ?auto_11006 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11008 - BLOCK
      ?auto_11009 - BLOCK
      ?auto_11010 - BLOCK
      ?auto_11011 - BLOCK
    )
    :vars
    (
      ?auto_11012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11008 ?auto_11009 ) ) ( not ( = ?auto_11008 ?auto_11010 ) ) ( not ( = ?auto_11008 ?auto_11011 ) ) ( not ( = ?auto_11009 ?auto_11010 ) ) ( not ( = ?auto_11009 ?auto_11011 ) ) ( not ( = ?auto_11010 ?auto_11011 ) ) ( ON ?auto_11011 ?auto_11012 ) ( not ( = ?auto_11008 ?auto_11012 ) ) ( not ( = ?auto_11009 ?auto_11012 ) ) ( not ( = ?auto_11010 ?auto_11012 ) ) ( not ( = ?auto_11011 ?auto_11012 ) ) ( ON ?auto_11010 ?auto_11011 ) ( ON-TABLE ?auto_11012 ) ( ON ?auto_11009 ?auto_11010 ) ( ON ?auto_11008 ?auto_11009 ) ( CLEAR ?auto_11008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11012 ?auto_11011 ?auto_11010 ?auto_11009 )
      ( MAKE-4PILE ?auto_11008 ?auto_11009 ?auto_11010 ?auto_11011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11053 - BLOCK
    )
    :vars
    (
      ?auto_11054 - BLOCK
      ?auto_11055 - BLOCK
      ?auto_11056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11053 ?auto_11054 ) ( CLEAR ?auto_11053 ) ( not ( = ?auto_11053 ?auto_11054 ) ) ( HOLDING ?auto_11055 ) ( CLEAR ?auto_11056 ) ( not ( = ?auto_11053 ?auto_11055 ) ) ( not ( = ?auto_11053 ?auto_11056 ) ) ( not ( = ?auto_11054 ?auto_11055 ) ) ( not ( = ?auto_11054 ?auto_11056 ) ) ( not ( = ?auto_11055 ?auto_11056 ) ) )
    :subtasks
    ( ( !STACK ?auto_11055 ?auto_11056 )
      ( MAKE-1PILE ?auto_11053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11057 - BLOCK
    )
    :vars
    (
      ?auto_11059 - BLOCK
      ?auto_11058 - BLOCK
      ?auto_11060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11057 ?auto_11059 ) ( not ( = ?auto_11057 ?auto_11059 ) ) ( CLEAR ?auto_11058 ) ( not ( = ?auto_11057 ?auto_11060 ) ) ( not ( = ?auto_11057 ?auto_11058 ) ) ( not ( = ?auto_11059 ?auto_11060 ) ) ( not ( = ?auto_11059 ?auto_11058 ) ) ( not ( = ?auto_11060 ?auto_11058 ) ) ( ON ?auto_11060 ?auto_11057 ) ( CLEAR ?auto_11060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11059 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11059 ?auto_11057 )
      ( MAKE-1PILE ?auto_11057 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11061 - BLOCK
    )
    :vars
    (
      ?auto_11063 - BLOCK
      ?auto_11062 - BLOCK
      ?auto_11064 - BLOCK
      ?auto_11065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11061 ?auto_11063 ) ( not ( = ?auto_11061 ?auto_11063 ) ) ( not ( = ?auto_11061 ?auto_11062 ) ) ( not ( = ?auto_11061 ?auto_11064 ) ) ( not ( = ?auto_11063 ?auto_11062 ) ) ( not ( = ?auto_11063 ?auto_11064 ) ) ( not ( = ?auto_11062 ?auto_11064 ) ) ( ON ?auto_11062 ?auto_11061 ) ( CLEAR ?auto_11062 ) ( ON-TABLE ?auto_11063 ) ( HOLDING ?auto_11064 ) ( CLEAR ?auto_11065 ) ( ON-TABLE ?auto_11065 ) ( not ( = ?auto_11065 ?auto_11064 ) ) ( not ( = ?auto_11061 ?auto_11065 ) ) ( not ( = ?auto_11063 ?auto_11065 ) ) ( not ( = ?auto_11062 ?auto_11065 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11065 ?auto_11064 )
      ( MAKE-1PILE ?auto_11061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11066 - BLOCK
    )
    :vars
    (
      ?auto_11067 - BLOCK
      ?auto_11069 - BLOCK
      ?auto_11068 - BLOCK
      ?auto_11070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11066 ?auto_11067 ) ( not ( = ?auto_11066 ?auto_11067 ) ) ( not ( = ?auto_11066 ?auto_11069 ) ) ( not ( = ?auto_11066 ?auto_11068 ) ) ( not ( = ?auto_11067 ?auto_11069 ) ) ( not ( = ?auto_11067 ?auto_11068 ) ) ( not ( = ?auto_11069 ?auto_11068 ) ) ( ON ?auto_11069 ?auto_11066 ) ( ON-TABLE ?auto_11067 ) ( CLEAR ?auto_11070 ) ( ON-TABLE ?auto_11070 ) ( not ( = ?auto_11070 ?auto_11068 ) ) ( not ( = ?auto_11066 ?auto_11070 ) ) ( not ( = ?auto_11067 ?auto_11070 ) ) ( not ( = ?auto_11069 ?auto_11070 ) ) ( ON ?auto_11068 ?auto_11069 ) ( CLEAR ?auto_11068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11067 ?auto_11066 ?auto_11069 )
      ( MAKE-1PILE ?auto_11066 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11071 - BLOCK
    )
    :vars
    (
      ?auto_11072 - BLOCK
      ?auto_11074 - BLOCK
      ?auto_11073 - BLOCK
      ?auto_11075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11071 ?auto_11072 ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11074 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( not ( = ?auto_11072 ?auto_11074 ) ) ( not ( = ?auto_11072 ?auto_11073 ) ) ( not ( = ?auto_11074 ?auto_11073 ) ) ( ON ?auto_11074 ?auto_11071 ) ( ON-TABLE ?auto_11072 ) ( not ( = ?auto_11075 ?auto_11073 ) ) ( not ( = ?auto_11071 ?auto_11075 ) ) ( not ( = ?auto_11072 ?auto_11075 ) ) ( not ( = ?auto_11074 ?auto_11075 ) ) ( ON ?auto_11073 ?auto_11074 ) ( CLEAR ?auto_11073 ) ( HOLDING ?auto_11075 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11075 )
      ( MAKE-1PILE ?auto_11071 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11076 - BLOCK
    )
    :vars
    (
      ?auto_11080 - BLOCK
      ?auto_11077 - BLOCK
      ?auto_11078 - BLOCK
      ?auto_11079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11076 ?auto_11080 ) ( not ( = ?auto_11076 ?auto_11080 ) ) ( not ( = ?auto_11076 ?auto_11077 ) ) ( not ( = ?auto_11076 ?auto_11078 ) ) ( not ( = ?auto_11080 ?auto_11077 ) ) ( not ( = ?auto_11080 ?auto_11078 ) ) ( not ( = ?auto_11077 ?auto_11078 ) ) ( ON ?auto_11077 ?auto_11076 ) ( ON-TABLE ?auto_11080 ) ( not ( = ?auto_11079 ?auto_11078 ) ) ( not ( = ?auto_11076 ?auto_11079 ) ) ( not ( = ?auto_11080 ?auto_11079 ) ) ( not ( = ?auto_11077 ?auto_11079 ) ) ( ON ?auto_11078 ?auto_11077 ) ( ON ?auto_11079 ?auto_11078 ) ( CLEAR ?auto_11079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11080 ?auto_11076 ?auto_11077 ?auto_11078 )
      ( MAKE-1PILE ?auto_11076 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11086 - BLOCK
      ?auto_11087 - BLOCK
    )
    :vars
    (
      ?auto_11088 - BLOCK
      ?auto_11089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11088 ?auto_11087 ) ( CLEAR ?auto_11088 ) ( ON-TABLE ?auto_11086 ) ( ON ?auto_11087 ?auto_11086 ) ( not ( = ?auto_11086 ?auto_11087 ) ) ( not ( = ?auto_11086 ?auto_11088 ) ) ( not ( = ?auto_11087 ?auto_11088 ) ) ( HOLDING ?auto_11089 ) ( not ( = ?auto_11086 ?auto_11089 ) ) ( not ( = ?auto_11087 ?auto_11089 ) ) ( not ( = ?auto_11088 ?auto_11089 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11089 )
      ( MAKE-2PILE ?auto_11086 ?auto_11087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11123 - BLOCK
      ?auto_11124 - BLOCK
    )
    :vars
    (
      ?auto_11125 - BLOCK
      ?auto_11126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11123 ?auto_11124 ) ) ( ON ?auto_11124 ?auto_11125 ) ( not ( = ?auto_11123 ?auto_11125 ) ) ( not ( = ?auto_11124 ?auto_11125 ) ) ( ON ?auto_11123 ?auto_11124 ) ( CLEAR ?auto_11123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11126 ) ( ON ?auto_11125 ?auto_11126 ) ( not ( = ?auto_11126 ?auto_11125 ) ) ( not ( = ?auto_11126 ?auto_11124 ) ) ( not ( = ?auto_11126 ?auto_11123 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11126 ?auto_11125 ?auto_11124 )
      ( MAKE-2PILE ?auto_11123 ?auto_11124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11129 - BLOCK
      ?auto_11130 - BLOCK
    )
    :vars
    (
      ?auto_11131 - BLOCK
      ?auto_11132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11129 ?auto_11130 ) ) ( ON ?auto_11130 ?auto_11131 ) ( CLEAR ?auto_11130 ) ( not ( = ?auto_11129 ?auto_11131 ) ) ( not ( = ?auto_11130 ?auto_11131 ) ) ( ON ?auto_11129 ?auto_11132 ) ( CLEAR ?auto_11129 ) ( HAND-EMPTY ) ( not ( = ?auto_11129 ?auto_11132 ) ) ( not ( = ?auto_11130 ?auto_11132 ) ) ( not ( = ?auto_11131 ?auto_11132 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11129 ?auto_11132 )
      ( MAKE-2PILE ?auto_11129 ?auto_11130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11133 - BLOCK
      ?auto_11134 - BLOCK
    )
    :vars
    (
      ?auto_11135 - BLOCK
      ?auto_11136 - BLOCK
      ?auto_11137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11133 ?auto_11134 ) ) ( not ( = ?auto_11133 ?auto_11135 ) ) ( not ( = ?auto_11134 ?auto_11135 ) ) ( ON ?auto_11133 ?auto_11136 ) ( CLEAR ?auto_11133 ) ( not ( = ?auto_11133 ?auto_11136 ) ) ( not ( = ?auto_11134 ?auto_11136 ) ) ( not ( = ?auto_11135 ?auto_11136 ) ) ( HOLDING ?auto_11134 ) ( CLEAR ?auto_11135 ) ( ON-TABLE ?auto_11137 ) ( ON ?auto_11135 ?auto_11137 ) ( not ( = ?auto_11137 ?auto_11135 ) ) ( not ( = ?auto_11137 ?auto_11134 ) ) ( not ( = ?auto_11133 ?auto_11137 ) ) ( not ( = ?auto_11136 ?auto_11137 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11137 ?auto_11135 ?auto_11134 )
      ( MAKE-2PILE ?auto_11133 ?auto_11134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11138 - BLOCK
      ?auto_11139 - BLOCK
    )
    :vars
    (
      ?auto_11142 - BLOCK
      ?auto_11140 - BLOCK
      ?auto_11141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11138 ?auto_11139 ) ) ( not ( = ?auto_11138 ?auto_11142 ) ) ( not ( = ?auto_11139 ?auto_11142 ) ) ( ON ?auto_11138 ?auto_11140 ) ( not ( = ?auto_11138 ?auto_11140 ) ) ( not ( = ?auto_11139 ?auto_11140 ) ) ( not ( = ?auto_11142 ?auto_11140 ) ) ( CLEAR ?auto_11142 ) ( ON-TABLE ?auto_11141 ) ( ON ?auto_11142 ?auto_11141 ) ( not ( = ?auto_11141 ?auto_11142 ) ) ( not ( = ?auto_11141 ?auto_11139 ) ) ( not ( = ?auto_11138 ?auto_11141 ) ) ( not ( = ?auto_11140 ?auto_11141 ) ) ( ON ?auto_11139 ?auto_11138 ) ( CLEAR ?auto_11139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11140 ?auto_11138 )
      ( MAKE-2PILE ?auto_11138 ?auto_11139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11143 - BLOCK
      ?auto_11144 - BLOCK
    )
    :vars
    (
      ?auto_11145 - BLOCK
      ?auto_11146 - BLOCK
      ?auto_11147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11143 ?auto_11144 ) ) ( not ( = ?auto_11143 ?auto_11145 ) ) ( not ( = ?auto_11144 ?auto_11145 ) ) ( ON ?auto_11143 ?auto_11146 ) ( not ( = ?auto_11143 ?auto_11146 ) ) ( not ( = ?auto_11144 ?auto_11146 ) ) ( not ( = ?auto_11145 ?auto_11146 ) ) ( ON-TABLE ?auto_11147 ) ( not ( = ?auto_11147 ?auto_11145 ) ) ( not ( = ?auto_11147 ?auto_11144 ) ) ( not ( = ?auto_11143 ?auto_11147 ) ) ( not ( = ?auto_11146 ?auto_11147 ) ) ( ON ?auto_11144 ?auto_11143 ) ( CLEAR ?auto_11144 ) ( ON-TABLE ?auto_11146 ) ( HOLDING ?auto_11145 ) ( CLEAR ?auto_11147 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11147 ?auto_11145 )
      ( MAKE-2PILE ?auto_11143 ?auto_11144 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11148 - BLOCK
      ?auto_11149 - BLOCK
    )
    :vars
    (
      ?auto_11150 - BLOCK
      ?auto_11151 - BLOCK
      ?auto_11152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11148 ?auto_11149 ) ) ( not ( = ?auto_11148 ?auto_11150 ) ) ( not ( = ?auto_11149 ?auto_11150 ) ) ( ON ?auto_11148 ?auto_11151 ) ( not ( = ?auto_11148 ?auto_11151 ) ) ( not ( = ?auto_11149 ?auto_11151 ) ) ( not ( = ?auto_11150 ?auto_11151 ) ) ( ON-TABLE ?auto_11152 ) ( not ( = ?auto_11152 ?auto_11150 ) ) ( not ( = ?auto_11152 ?auto_11149 ) ) ( not ( = ?auto_11148 ?auto_11152 ) ) ( not ( = ?auto_11151 ?auto_11152 ) ) ( ON ?auto_11149 ?auto_11148 ) ( ON-TABLE ?auto_11151 ) ( CLEAR ?auto_11152 ) ( ON ?auto_11150 ?auto_11149 ) ( CLEAR ?auto_11150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11151 ?auto_11148 ?auto_11149 )
      ( MAKE-2PILE ?auto_11148 ?auto_11149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11153 - BLOCK
      ?auto_11154 - BLOCK
    )
    :vars
    (
      ?auto_11155 - BLOCK
      ?auto_11156 - BLOCK
      ?auto_11157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11153 ?auto_11154 ) ) ( not ( = ?auto_11153 ?auto_11155 ) ) ( not ( = ?auto_11154 ?auto_11155 ) ) ( ON ?auto_11153 ?auto_11156 ) ( not ( = ?auto_11153 ?auto_11156 ) ) ( not ( = ?auto_11154 ?auto_11156 ) ) ( not ( = ?auto_11155 ?auto_11156 ) ) ( not ( = ?auto_11157 ?auto_11155 ) ) ( not ( = ?auto_11157 ?auto_11154 ) ) ( not ( = ?auto_11153 ?auto_11157 ) ) ( not ( = ?auto_11156 ?auto_11157 ) ) ( ON ?auto_11154 ?auto_11153 ) ( ON-TABLE ?auto_11156 ) ( ON ?auto_11155 ?auto_11154 ) ( CLEAR ?auto_11155 ) ( HOLDING ?auto_11157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11157 )
      ( MAKE-2PILE ?auto_11153 ?auto_11154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11158 - BLOCK
      ?auto_11159 - BLOCK
    )
    :vars
    (
      ?auto_11161 - BLOCK
      ?auto_11160 - BLOCK
      ?auto_11162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11158 ?auto_11159 ) ) ( not ( = ?auto_11158 ?auto_11161 ) ) ( not ( = ?auto_11159 ?auto_11161 ) ) ( ON ?auto_11158 ?auto_11160 ) ( not ( = ?auto_11158 ?auto_11160 ) ) ( not ( = ?auto_11159 ?auto_11160 ) ) ( not ( = ?auto_11161 ?auto_11160 ) ) ( not ( = ?auto_11162 ?auto_11161 ) ) ( not ( = ?auto_11162 ?auto_11159 ) ) ( not ( = ?auto_11158 ?auto_11162 ) ) ( not ( = ?auto_11160 ?auto_11162 ) ) ( ON ?auto_11159 ?auto_11158 ) ( ON-TABLE ?auto_11160 ) ( ON ?auto_11161 ?auto_11159 ) ( ON ?auto_11162 ?auto_11161 ) ( CLEAR ?auto_11162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11160 ?auto_11158 ?auto_11159 ?auto_11161 )
      ( MAKE-2PILE ?auto_11158 ?auto_11159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11174 - BLOCK
    )
    :vars
    (
      ?auto_11175 - BLOCK
      ?auto_11177 - BLOCK
      ?auto_11176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11175 ?auto_11174 ) ( ON-TABLE ?auto_11174 ) ( not ( = ?auto_11174 ?auto_11175 ) ) ( not ( = ?auto_11174 ?auto_11177 ) ) ( not ( = ?auto_11174 ?auto_11176 ) ) ( not ( = ?auto_11175 ?auto_11177 ) ) ( not ( = ?auto_11175 ?auto_11176 ) ) ( not ( = ?auto_11177 ?auto_11176 ) ) ( ON ?auto_11177 ?auto_11175 ) ( CLEAR ?auto_11177 ) ( HOLDING ?auto_11176 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11176 )
      ( MAKE-1PILE ?auto_11174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11207 - BLOCK
      ?auto_11208 - BLOCK
      ?auto_11209 - BLOCK
    )
    :vars
    (
      ?auto_11210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11207 ) ( not ( = ?auto_11207 ?auto_11208 ) ) ( not ( = ?auto_11207 ?auto_11209 ) ) ( not ( = ?auto_11208 ?auto_11209 ) ) ( ON ?auto_11209 ?auto_11210 ) ( not ( = ?auto_11207 ?auto_11210 ) ) ( not ( = ?auto_11208 ?auto_11210 ) ) ( not ( = ?auto_11209 ?auto_11210 ) ) ( CLEAR ?auto_11207 ) ( ON ?auto_11208 ?auto_11209 ) ( CLEAR ?auto_11208 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11210 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11210 ?auto_11209 )
      ( MAKE-3PILE ?auto_11207 ?auto_11208 ?auto_11209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11211 - BLOCK
      ?auto_11212 - BLOCK
      ?auto_11213 - BLOCK
    )
    :vars
    (
      ?auto_11214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11211 ?auto_11212 ) ) ( not ( = ?auto_11211 ?auto_11213 ) ) ( not ( = ?auto_11212 ?auto_11213 ) ) ( ON ?auto_11213 ?auto_11214 ) ( not ( = ?auto_11211 ?auto_11214 ) ) ( not ( = ?auto_11212 ?auto_11214 ) ) ( not ( = ?auto_11213 ?auto_11214 ) ) ( ON ?auto_11212 ?auto_11213 ) ( CLEAR ?auto_11212 ) ( ON-TABLE ?auto_11214 ) ( HOLDING ?auto_11211 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11211 )
      ( MAKE-3PILE ?auto_11211 ?auto_11212 ?auto_11213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11215 - BLOCK
      ?auto_11216 - BLOCK
      ?auto_11217 - BLOCK
    )
    :vars
    (
      ?auto_11218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11215 ?auto_11216 ) ) ( not ( = ?auto_11215 ?auto_11217 ) ) ( not ( = ?auto_11216 ?auto_11217 ) ) ( ON ?auto_11217 ?auto_11218 ) ( not ( = ?auto_11215 ?auto_11218 ) ) ( not ( = ?auto_11216 ?auto_11218 ) ) ( not ( = ?auto_11217 ?auto_11218 ) ) ( ON ?auto_11216 ?auto_11217 ) ( ON-TABLE ?auto_11218 ) ( ON ?auto_11215 ?auto_11216 ) ( CLEAR ?auto_11215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11218 ?auto_11217 ?auto_11216 )
      ( MAKE-3PILE ?auto_11215 ?auto_11216 ?auto_11217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11222 - BLOCK
      ?auto_11223 - BLOCK
      ?auto_11224 - BLOCK
    )
    :vars
    (
      ?auto_11225 - BLOCK
      ?auto_11226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11222 ?auto_11223 ) ) ( not ( = ?auto_11222 ?auto_11224 ) ) ( not ( = ?auto_11223 ?auto_11224 ) ) ( ON ?auto_11224 ?auto_11225 ) ( not ( = ?auto_11222 ?auto_11225 ) ) ( not ( = ?auto_11223 ?auto_11225 ) ) ( not ( = ?auto_11224 ?auto_11225 ) ) ( ON ?auto_11223 ?auto_11224 ) ( CLEAR ?auto_11223 ) ( ON-TABLE ?auto_11225 ) ( ON ?auto_11222 ?auto_11226 ) ( CLEAR ?auto_11222 ) ( HAND-EMPTY ) ( not ( = ?auto_11222 ?auto_11226 ) ) ( not ( = ?auto_11223 ?auto_11226 ) ) ( not ( = ?auto_11224 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11222 ?auto_11226 )
      ( MAKE-3PILE ?auto_11222 ?auto_11223 ?auto_11224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11227 - BLOCK
      ?auto_11228 - BLOCK
      ?auto_11229 - BLOCK
    )
    :vars
    (
      ?auto_11231 - BLOCK
      ?auto_11230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11227 ?auto_11228 ) ) ( not ( = ?auto_11227 ?auto_11229 ) ) ( not ( = ?auto_11228 ?auto_11229 ) ) ( ON ?auto_11229 ?auto_11231 ) ( not ( = ?auto_11227 ?auto_11231 ) ) ( not ( = ?auto_11228 ?auto_11231 ) ) ( not ( = ?auto_11229 ?auto_11231 ) ) ( ON-TABLE ?auto_11231 ) ( ON ?auto_11227 ?auto_11230 ) ( CLEAR ?auto_11227 ) ( not ( = ?auto_11227 ?auto_11230 ) ) ( not ( = ?auto_11228 ?auto_11230 ) ) ( not ( = ?auto_11229 ?auto_11230 ) ) ( not ( = ?auto_11231 ?auto_11230 ) ) ( HOLDING ?auto_11228 ) ( CLEAR ?auto_11229 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11231 ?auto_11229 ?auto_11228 )
      ( MAKE-3PILE ?auto_11227 ?auto_11228 ?auto_11229 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11232 - BLOCK
      ?auto_11233 - BLOCK
      ?auto_11234 - BLOCK
    )
    :vars
    (
      ?auto_11236 - BLOCK
      ?auto_11235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11232 ?auto_11233 ) ) ( not ( = ?auto_11232 ?auto_11234 ) ) ( not ( = ?auto_11233 ?auto_11234 ) ) ( ON ?auto_11234 ?auto_11236 ) ( not ( = ?auto_11232 ?auto_11236 ) ) ( not ( = ?auto_11233 ?auto_11236 ) ) ( not ( = ?auto_11234 ?auto_11236 ) ) ( ON-TABLE ?auto_11236 ) ( ON ?auto_11232 ?auto_11235 ) ( not ( = ?auto_11232 ?auto_11235 ) ) ( not ( = ?auto_11233 ?auto_11235 ) ) ( not ( = ?auto_11234 ?auto_11235 ) ) ( not ( = ?auto_11236 ?auto_11235 ) ) ( CLEAR ?auto_11234 ) ( ON ?auto_11233 ?auto_11232 ) ( CLEAR ?auto_11233 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11235 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11235 ?auto_11232 )
      ( MAKE-3PILE ?auto_11232 ?auto_11233 ?auto_11234 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11237 - BLOCK
      ?auto_11238 - BLOCK
      ?auto_11239 - BLOCK
    )
    :vars
    (
      ?auto_11240 - BLOCK
      ?auto_11241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11237 ?auto_11238 ) ) ( not ( = ?auto_11237 ?auto_11239 ) ) ( not ( = ?auto_11238 ?auto_11239 ) ) ( not ( = ?auto_11237 ?auto_11240 ) ) ( not ( = ?auto_11238 ?auto_11240 ) ) ( not ( = ?auto_11239 ?auto_11240 ) ) ( ON-TABLE ?auto_11240 ) ( ON ?auto_11237 ?auto_11241 ) ( not ( = ?auto_11237 ?auto_11241 ) ) ( not ( = ?auto_11238 ?auto_11241 ) ) ( not ( = ?auto_11239 ?auto_11241 ) ) ( not ( = ?auto_11240 ?auto_11241 ) ) ( ON ?auto_11238 ?auto_11237 ) ( CLEAR ?auto_11238 ) ( ON-TABLE ?auto_11241 ) ( HOLDING ?auto_11239 ) ( CLEAR ?auto_11240 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11240 ?auto_11239 )
      ( MAKE-3PILE ?auto_11237 ?auto_11238 ?auto_11239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11242 - BLOCK
      ?auto_11243 - BLOCK
      ?auto_11244 - BLOCK
    )
    :vars
    (
      ?auto_11245 - BLOCK
      ?auto_11246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11242 ?auto_11243 ) ) ( not ( = ?auto_11242 ?auto_11244 ) ) ( not ( = ?auto_11243 ?auto_11244 ) ) ( not ( = ?auto_11242 ?auto_11245 ) ) ( not ( = ?auto_11243 ?auto_11245 ) ) ( not ( = ?auto_11244 ?auto_11245 ) ) ( ON-TABLE ?auto_11245 ) ( ON ?auto_11242 ?auto_11246 ) ( not ( = ?auto_11242 ?auto_11246 ) ) ( not ( = ?auto_11243 ?auto_11246 ) ) ( not ( = ?auto_11244 ?auto_11246 ) ) ( not ( = ?auto_11245 ?auto_11246 ) ) ( ON ?auto_11243 ?auto_11242 ) ( ON-TABLE ?auto_11246 ) ( CLEAR ?auto_11245 ) ( ON ?auto_11244 ?auto_11243 ) ( CLEAR ?auto_11244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11246 ?auto_11242 ?auto_11243 )
      ( MAKE-3PILE ?auto_11242 ?auto_11243 ?auto_11244 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11247 - BLOCK
      ?auto_11248 - BLOCK
      ?auto_11249 - BLOCK
    )
    :vars
    (
      ?auto_11250 - BLOCK
      ?auto_11251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11247 ?auto_11249 ) ) ( not ( = ?auto_11248 ?auto_11249 ) ) ( not ( = ?auto_11247 ?auto_11250 ) ) ( not ( = ?auto_11248 ?auto_11250 ) ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( ON ?auto_11247 ?auto_11251 ) ( not ( = ?auto_11247 ?auto_11251 ) ) ( not ( = ?auto_11248 ?auto_11251 ) ) ( not ( = ?auto_11249 ?auto_11251 ) ) ( not ( = ?auto_11250 ?auto_11251 ) ) ( ON ?auto_11248 ?auto_11247 ) ( ON-TABLE ?auto_11251 ) ( ON ?auto_11249 ?auto_11248 ) ( CLEAR ?auto_11249 ) ( HOLDING ?auto_11250 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11250 )
      ( MAKE-3PILE ?auto_11247 ?auto_11248 ?auto_11249 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11252 - BLOCK
      ?auto_11253 - BLOCK
      ?auto_11254 - BLOCK
    )
    :vars
    (
      ?auto_11255 - BLOCK
      ?auto_11256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11252 ?auto_11253 ) ) ( not ( = ?auto_11252 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11252 ?auto_11255 ) ) ( not ( = ?auto_11253 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11255 ) ) ( ON ?auto_11252 ?auto_11256 ) ( not ( = ?auto_11252 ?auto_11256 ) ) ( not ( = ?auto_11253 ?auto_11256 ) ) ( not ( = ?auto_11254 ?auto_11256 ) ) ( not ( = ?auto_11255 ?auto_11256 ) ) ( ON ?auto_11253 ?auto_11252 ) ( ON-TABLE ?auto_11256 ) ( ON ?auto_11254 ?auto_11253 ) ( ON ?auto_11255 ?auto_11254 ) ( CLEAR ?auto_11255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11256 ?auto_11252 ?auto_11253 ?auto_11254 )
      ( MAKE-3PILE ?auto_11252 ?auto_11253 ?auto_11254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11265 - BLOCK
      ?auto_11266 - BLOCK
      ?auto_11267 - BLOCK
      ?auto_11268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11267 ) ( ON-TABLE ?auto_11265 ) ( ON ?auto_11266 ?auto_11265 ) ( ON ?auto_11267 ?auto_11266 ) ( not ( = ?auto_11265 ?auto_11266 ) ) ( not ( = ?auto_11265 ?auto_11267 ) ) ( not ( = ?auto_11265 ?auto_11268 ) ) ( not ( = ?auto_11266 ?auto_11267 ) ) ( not ( = ?auto_11266 ?auto_11268 ) ) ( not ( = ?auto_11267 ?auto_11268 ) ) ( ON-TABLE ?auto_11268 ) ( CLEAR ?auto_11268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_11268 )
      ( MAKE-4PILE ?auto_11265 ?auto_11266 ?auto_11267 ?auto_11268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11269 - BLOCK
      ?auto_11270 - BLOCK
      ?auto_11271 - BLOCK
      ?auto_11272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11269 ) ( ON ?auto_11270 ?auto_11269 ) ( not ( = ?auto_11269 ?auto_11270 ) ) ( not ( = ?auto_11269 ?auto_11271 ) ) ( not ( = ?auto_11269 ?auto_11272 ) ) ( not ( = ?auto_11270 ?auto_11271 ) ) ( not ( = ?auto_11270 ?auto_11272 ) ) ( not ( = ?auto_11271 ?auto_11272 ) ) ( ON-TABLE ?auto_11272 ) ( CLEAR ?auto_11272 ) ( HOLDING ?auto_11271 ) ( CLEAR ?auto_11270 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11269 ?auto_11270 ?auto_11271 )
      ( MAKE-4PILE ?auto_11269 ?auto_11270 ?auto_11271 ?auto_11272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11273 - BLOCK
      ?auto_11274 - BLOCK
      ?auto_11275 - BLOCK
      ?auto_11276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11273 ) ( ON ?auto_11274 ?auto_11273 ) ( not ( = ?auto_11273 ?auto_11274 ) ) ( not ( = ?auto_11273 ?auto_11275 ) ) ( not ( = ?auto_11273 ?auto_11276 ) ) ( not ( = ?auto_11274 ?auto_11275 ) ) ( not ( = ?auto_11274 ?auto_11276 ) ) ( not ( = ?auto_11275 ?auto_11276 ) ) ( ON-TABLE ?auto_11276 ) ( CLEAR ?auto_11274 ) ( ON ?auto_11275 ?auto_11276 ) ( CLEAR ?auto_11275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11276 )
      ( MAKE-4PILE ?auto_11273 ?auto_11274 ?auto_11275 ?auto_11276 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11277 - BLOCK
      ?auto_11278 - BLOCK
      ?auto_11279 - BLOCK
      ?auto_11280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11277 ) ( not ( = ?auto_11277 ?auto_11278 ) ) ( not ( = ?auto_11277 ?auto_11279 ) ) ( not ( = ?auto_11277 ?auto_11280 ) ) ( not ( = ?auto_11278 ?auto_11279 ) ) ( not ( = ?auto_11278 ?auto_11280 ) ) ( not ( = ?auto_11279 ?auto_11280 ) ) ( ON-TABLE ?auto_11280 ) ( ON ?auto_11279 ?auto_11280 ) ( CLEAR ?auto_11279 ) ( HOLDING ?auto_11278 ) ( CLEAR ?auto_11277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11277 ?auto_11278 )
      ( MAKE-4PILE ?auto_11277 ?auto_11278 ?auto_11279 ?auto_11280 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11281 - BLOCK
      ?auto_11282 - BLOCK
      ?auto_11283 - BLOCK
      ?auto_11284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11281 ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11281 ?auto_11283 ) ) ( not ( = ?auto_11281 ?auto_11284 ) ) ( not ( = ?auto_11282 ?auto_11283 ) ) ( not ( = ?auto_11282 ?auto_11284 ) ) ( not ( = ?auto_11283 ?auto_11284 ) ) ( ON-TABLE ?auto_11284 ) ( ON ?auto_11283 ?auto_11284 ) ( CLEAR ?auto_11281 ) ( ON ?auto_11282 ?auto_11283 ) ( CLEAR ?auto_11282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11284 ?auto_11283 )
      ( MAKE-4PILE ?auto_11281 ?auto_11282 ?auto_11283 ?auto_11284 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11285 - BLOCK
      ?auto_11286 - BLOCK
      ?auto_11287 - BLOCK
      ?auto_11288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11285 ?auto_11286 ) ) ( not ( = ?auto_11285 ?auto_11287 ) ) ( not ( = ?auto_11285 ?auto_11288 ) ) ( not ( = ?auto_11286 ?auto_11287 ) ) ( not ( = ?auto_11286 ?auto_11288 ) ) ( not ( = ?auto_11287 ?auto_11288 ) ) ( ON-TABLE ?auto_11288 ) ( ON ?auto_11287 ?auto_11288 ) ( ON ?auto_11286 ?auto_11287 ) ( CLEAR ?auto_11286 ) ( HOLDING ?auto_11285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11285 )
      ( MAKE-4PILE ?auto_11285 ?auto_11286 ?auto_11287 ?auto_11288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11289 - BLOCK
      ?auto_11290 - BLOCK
      ?auto_11291 - BLOCK
      ?auto_11292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11289 ?auto_11290 ) ) ( not ( = ?auto_11289 ?auto_11291 ) ) ( not ( = ?auto_11289 ?auto_11292 ) ) ( not ( = ?auto_11290 ?auto_11291 ) ) ( not ( = ?auto_11290 ?auto_11292 ) ) ( not ( = ?auto_11291 ?auto_11292 ) ) ( ON-TABLE ?auto_11292 ) ( ON ?auto_11291 ?auto_11292 ) ( ON ?auto_11290 ?auto_11291 ) ( ON ?auto_11289 ?auto_11290 ) ( CLEAR ?auto_11289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11292 ?auto_11291 ?auto_11290 )
      ( MAKE-4PILE ?auto_11289 ?auto_11290 ?auto_11291 ?auto_11292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11297 - BLOCK
      ?auto_11298 - BLOCK
      ?auto_11299 - BLOCK
      ?auto_11300 - BLOCK
    )
    :vars
    (
      ?auto_11301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11297 ?auto_11298 ) ) ( not ( = ?auto_11297 ?auto_11299 ) ) ( not ( = ?auto_11297 ?auto_11300 ) ) ( not ( = ?auto_11298 ?auto_11299 ) ) ( not ( = ?auto_11298 ?auto_11300 ) ) ( not ( = ?auto_11299 ?auto_11300 ) ) ( ON-TABLE ?auto_11300 ) ( ON ?auto_11299 ?auto_11300 ) ( ON ?auto_11298 ?auto_11299 ) ( CLEAR ?auto_11298 ) ( ON ?auto_11297 ?auto_11301 ) ( CLEAR ?auto_11297 ) ( HAND-EMPTY ) ( not ( = ?auto_11297 ?auto_11301 ) ) ( not ( = ?auto_11298 ?auto_11301 ) ) ( not ( = ?auto_11299 ?auto_11301 ) ) ( not ( = ?auto_11300 ?auto_11301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11297 ?auto_11301 )
      ( MAKE-4PILE ?auto_11297 ?auto_11298 ?auto_11299 ?auto_11300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11302 - BLOCK
      ?auto_11303 - BLOCK
      ?auto_11304 - BLOCK
      ?auto_11305 - BLOCK
    )
    :vars
    (
      ?auto_11306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11302 ?auto_11303 ) ) ( not ( = ?auto_11302 ?auto_11304 ) ) ( not ( = ?auto_11302 ?auto_11305 ) ) ( not ( = ?auto_11303 ?auto_11304 ) ) ( not ( = ?auto_11303 ?auto_11305 ) ) ( not ( = ?auto_11304 ?auto_11305 ) ) ( ON-TABLE ?auto_11305 ) ( ON ?auto_11304 ?auto_11305 ) ( ON ?auto_11302 ?auto_11306 ) ( CLEAR ?auto_11302 ) ( not ( = ?auto_11302 ?auto_11306 ) ) ( not ( = ?auto_11303 ?auto_11306 ) ) ( not ( = ?auto_11304 ?auto_11306 ) ) ( not ( = ?auto_11305 ?auto_11306 ) ) ( HOLDING ?auto_11303 ) ( CLEAR ?auto_11304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11305 ?auto_11304 ?auto_11303 )
      ( MAKE-4PILE ?auto_11302 ?auto_11303 ?auto_11304 ?auto_11305 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11307 - BLOCK
      ?auto_11308 - BLOCK
      ?auto_11309 - BLOCK
      ?auto_11310 - BLOCK
    )
    :vars
    (
      ?auto_11311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11307 ?auto_11308 ) ) ( not ( = ?auto_11307 ?auto_11309 ) ) ( not ( = ?auto_11307 ?auto_11310 ) ) ( not ( = ?auto_11308 ?auto_11309 ) ) ( not ( = ?auto_11308 ?auto_11310 ) ) ( not ( = ?auto_11309 ?auto_11310 ) ) ( ON-TABLE ?auto_11310 ) ( ON ?auto_11309 ?auto_11310 ) ( ON ?auto_11307 ?auto_11311 ) ( not ( = ?auto_11307 ?auto_11311 ) ) ( not ( = ?auto_11308 ?auto_11311 ) ) ( not ( = ?auto_11309 ?auto_11311 ) ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( CLEAR ?auto_11309 ) ( ON ?auto_11308 ?auto_11307 ) ( CLEAR ?auto_11308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11311 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11311 ?auto_11307 )
      ( MAKE-4PILE ?auto_11307 ?auto_11308 ?auto_11309 ?auto_11310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11312 - BLOCK
      ?auto_11313 - BLOCK
      ?auto_11314 - BLOCK
      ?auto_11315 - BLOCK
    )
    :vars
    (
      ?auto_11316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11312 ?auto_11313 ) ) ( not ( = ?auto_11312 ?auto_11314 ) ) ( not ( = ?auto_11312 ?auto_11315 ) ) ( not ( = ?auto_11313 ?auto_11314 ) ) ( not ( = ?auto_11313 ?auto_11315 ) ) ( not ( = ?auto_11314 ?auto_11315 ) ) ( ON-TABLE ?auto_11315 ) ( ON ?auto_11312 ?auto_11316 ) ( not ( = ?auto_11312 ?auto_11316 ) ) ( not ( = ?auto_11313 ?auto_11316 ) ) ( not ( = ?auto_11314 ?auto_11316 ) ) ( not ( = ?auto_11315 ?auto_11316 ) ) ( ON ?auto_11313 ?auto_11312 ) ( CLEAR ?auto_11313 ) ( ON-TABLE ?auto_11316 ) ( HOLDING ?auto_11314 ) ( CLEAR ?auto_11315 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11315 ?auto_11314 )
      ( MAKE-4PILE ?auto_11312 ?auto_11313 ?auto_11314 ?auto_11315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11317 - BLOCK
      ?auto_11318 - BLOCK
      ?auto_11319 - BLOCK
      ?auto_11320 - BLOCK
    )
    :vars
    (
      ?auto_11321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11317 ?auto_11318 ) ) ( not ( = ?auto_11317 ?auto_11319 ) ) ( not ( = ?auto_11317 ?auto_11320 ) ) ( not ( = ?auto_11318 ?auto_11319 ) ) ( not ( = ?auto_11318 ?auto_11320 ) ) ( not ( = ?auto_11319 ?auto_11320 ) ) ( ON-TABLE ?auto_11320 ) ( ON ?auto_11317 ?auto_11321 ) ( not ( = ?auto_11317 ?auto_11321 ) ) ( not ( = ?auto_11318 ?auto_11321 ) ) ( not ( = ?auto_11319 ?auto_11321 ) ) ( not ( = ?auto_11320 ?auto_11321 ) ) ( ON ?auto_11318 ?auto_11317 ) ( ON-TABLE ?auto_11321 ) ( CLEAR ?auto_11320 ) ( ON ?auto_11319 ?auto_11318 ) ( CLEAR ?auto_11319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11321 ?auto_11317 ?auto_11318 )
      ( MAKE-4PILE ?auto_11317 ?auto_11318 ?auto_11319 ?auto_11320 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11322 - BLOCK
      ?auto_11323 - BLOCK
      ?auto_11324 - BLOCK
      ?auto_11325 - BLOCK
    )
    :vars
    (
      ?auto_11326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11322 ?auto_11323 ) ) ( not ( = ?auto_11322 ?auto_11324 ) ) ( not ( = ?auto_11322 ?auto_11325 ) ) ( not ( = ?auto_11323 ?auto_11324 ) ) ( not ( = ?auto_11323 ?auto_11325 ) ) ( not ( = ?auto_11324 ?auto_11325 ) ) ( ON ?auto_11322 ?auto_11326 ) ( not ( = ?auto_11322 ?auto_11326 ) ) ( not ( = ?auto_11323 ?auto_11326 ) ) ( not ( = ?auto_11324 ?auto_11326 ) ) ( not ( = ?auto_11325 ?auto_11326 ) ) ( ON ?auto_11323 ?auto_11322 ) ( ON-TABLE ?auto_11326 ) ( ON ?auto_11324 ?auto_11323 ) ( CLEAR ?auto_11324 ) ( HOLDING ?auto_11325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11325 )
      ( MAKE-4PILE ?auto_11322 ?auto_11323 ?auto_11324 ?auto_11325 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11327 - BLOCK
      ?auto_11328 - BLOCK
      ?auto_11329 - BLOCK
      ?auto_11330 - BLOCK
    )
    :vars
    (
      ?auto_11331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11327 ?auto_11328 ) ) ( not ( = ?auto_11327 ?auto_11329 ) ) ( not ( = ?auto_11327 ?auto_11330 ) ) ( not ( = ?auto_11328 ?auto_11329 ) ) ( not ( = ?auto_11328 ?auto_11330 ) ) ( not ( = ?auto_11329 ?auto_11330 ) ) ( ON ?auto_11327 ?auto_11331 ) ( not ( = ?auto_11327 ?auto_11331 ) ) ( not ( = ?auto_11328 ?auto_11331 ) ) ( not ( = ?auto_11329 ?auto_11331 ) ) ( not ( = ?auto_11330 ?auto_11331 ) ) ( ON ?auto_11328 ?auto_11327 ) ( ON-TABLE ?auto_11331 ) ( ON ?auto_11329 ?auto_11328 ) ( ON ?auto_11330 ?auto_11329 ) ( CLEAR ?auto_11330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11331 ?auto_11327 ?auto_11328 ?auto_11329 )
      ( MAKE-4PILE ?auto_11327 ?auto_11328 ?auto_11329 ?auto_11330 ) )
  )

)

