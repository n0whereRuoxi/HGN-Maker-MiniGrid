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
      ?auto_13796 - BLOCK
      ?auto_13797 - BLOCK
      ?auto_13798 - BLOCK
      ?auto_13799 - BLOCK
    )
    :vars
    (
      ?auto_13800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13800 ?auto_13799 ) ( CLEAR ?auto_13800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13796 ) ( ON ?auto_13797 ?auto_13796 ) ( ON ?auto_13798 ?auto_13797 ) ( ON ?auto_13799 ?auto_13798 ) ( not ( = ?auto_13796 ?auto_13797 ) ) ( not ( = ?auto_13796 ?auto_13798 ) ) ( not ( = ?auto_13796 ?auto_13799 ) ) ( not ( = ?auto_13796 ?auto_13800 ) ) ( not ( = ?auto_13797 ?auto_13798 ) ) ( not ( = ?auto_13797 ?auto_13799 ) ) ( not ( = ?auto_13797 ?auto_13800 ) ) ( not ( = ?auto_13798 ?auto_13799 ) ) ( not ( = ?auto_13798 ?auto_13800 ) ) ( not ( = ?auto_13799 ?auto_13800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13800 ?auto_13799 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13802 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13802 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13802 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13803 - BLOCK
    )
    :vars
    (
      ?auto_13804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13803 ?auto_13804 ) ( CLEAR ?auto_13803 ) ( HAND-EMPTY ) ( not ( = ?auto_13803 ?auto_13804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13803 ?auto_13804 )
      ( MAKE-1PILE ?auto_13803 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13808 - BLOCK
      ?auto_13809 - BLOCK
      ?auto_13810 - BLOCK
    )
    :vars
    (
      ?auto_13811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13811 ?auto_13810 ) ( CLEAR ?auto_13811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13808 ) ( ON ?auto_13809 ?auto_13808 ) ( ON ?auto_13810 ?auto_13809 ) ( not ( = ?auto_13808 ?auto_13809 ) ) ( not ( = ?auto_13808 ?auto_13810 ) ) ( not ( = ?auto_13808 ?auto_13811 ) ) ( not ( = ?auto_13809 ?auto_13810 ) ) ( not ( = ?auto_13809 ?auto_13811 ) ) ( not ( = ?auto_13810 ?auto_13811 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13811 ?auto_13810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13812 - BLOCK
      ?auto_13813 - BLOCK
      ?auto_13814 - BLOCK
    )
    :vars
    (
      ?auto_13815 - BLOCK
      ?auto_13816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13815 ?auto_13814 ) ( CLEAR ?auto_13815 ) ( ON-TABLE ?auto_13812 ) ( ON ?auto_13813 ?auto_13812 ) ( ON ?auto_13814 ?auto_13813 ) ( not ( = ?auto_13812 ?auto_13813 ) ) ( not ( = ?auto_13812 ?auto_13814 ) ) ( not ( = ?auto_13812 ?auto_13815 ) ) ( not ( = ?auto_13813 ?auto_13814 ) ) ( not ( = ?auto_13813 ?auto_13815 ) ) ( not ( = ?auto_13814 ?auto_13815 ) ) ( HOLDING ?auto_13816 ) ( not ( = ?auto_13812 ?auto_13816 ) ) ( not ( = ?auto_13813 ?auto_13816 ) ) ( not ( = ?auto_13814 ?auto_13816 ) ) ( not ( = ?auto_13815 ?auto_13816 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13816 )
      ( MAKE-3PILE ?auto_13812 ?auto_13813 ?auto_13814 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13817 - BLOCK
      ?auto_13818 - BLOCK
      ?auto_13819 - BLOCK
    )
    :vars
    (
      ?auto_13821 - BLOCK
      ?auto_13820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13821 ?auto_13819 ) ( ON-TABLE ?auto_13817 ) ( ON ?auto_13818 ?auto_13817 ) ( ON ?auto_13819 ?auto_13818 ) ( not ( = ?auto_13817 ?auto_13818 ) ) ( not ( = ?auto_13817 ?auto_13819 ) ) ( not ( = ?auto_13817 ?auto_13821 ) ) ( not ( = ?auto_13818 ?auto_13819 ) ) ( not ( = ?auto_13818 ?auto_13821 ) ) ( not ( = ?auto_13819 ?auto_13821 ) ) ( not ( = ?auto_13817 ?auto_13820 ) ) ( not ( = ?auto_13818 ?auto_13820 ) ) ( not ( = ?auto_13819 ?auto_13820 ) ) ( not ( = ?auto_13821 ?auto_13820 ) ) ( ON ?auto_13820 ?auto_13821 ) ( CLEAR ?auto_13820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13817 ?auto_13818 ?auto_13819 ?auto_13821 )
      ( MAKE-3PILE ?auto_13817 ?auto_13818 ?auto_13819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13824 - BLOCK
      ?auto_13825 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13825 ) ( CLEAR ?auto_13824 ) ( ON-TABLE ?auto_13824 ) ( not ( = ?auto_13824 ?auto_13825 ) ) )
    :subtasks
    ( ( !STACK ?auto_13825 ?auto_13824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13826 - BLOCK
      ?auto_13827 - BLOCK
    )
    :vars
    (
      ?auto_13828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13826 ) ( ON-TABLE ?auto_13826 ) ( not ( = ?auto_13826 ?auto_13827 ) ) ( ON ?auto_13827 ?auto_13828 ) ( CLEAR ?auto_13827 ) ( HAND-EMPTY ) ( not ( = ?auto_13826 ?auto_13828 ) ) ( not ( = ?auto_13827 ?auto_13828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13827 ?auto_13828 )
      ( MAKE-2PILE ?auto_13826 ?auto_13827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13829 - BLOCK
      ?auto_13830 - BLOCK
    )
    :vars
    (
      ?auto_13831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13829 ?auto_13830 ) ) ( ON ?auto_13830 ?auto_13831 ) ( CLEAR ?auto_13830 ) ( not ( = ?auto_13829 ?auto_13831 ) ) ( not ( = ?auto_13830 ?auto_13831 ) ) ( HOLDING ?auto_13829 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13829 )
      ( MAKE-2PILE ?auto_13829 ?auto_13830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13832 - BLOCK
      ?auto_13833 - BLOCK
    )
    :vars
    (
      ?auto_13834 - BLOCK
      ?auto_13835 - BLOCK
      ?auto_13836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13832 ?auto_13833 ) ) ( ON ?auto_13833 ?auto_13834 ) ( not ( = ?auto_13832 ?auto_13834 ) ) ( not ( = ?auto_13833 ?auto_13834 ) ) ( ON ?auto_13832 ?auto_13833 ) ( CLEAR ?auto_13832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13835 ) ( ON ?auto_13836 ?auto_13835 ) ( ON ?auto_13834 ?auto_13836 ) ( not ( = ?auto_13835 ?auto_13836 ) ) ( not ( = ?auto_13835 ?auto_13834 ) ) ( not ( = ?auto_13835 ?auto_13833 ) ) ( not ( = ?auto_13835 ?auto_13832 ) ) ( not ( = ?auto_13836 ?auto_13834 ) ) ( not ( = ?auto_13836 ?auto_13833 ) ) ( not ( = ?auto_13836 ?auto_13832 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13835 ?auto_13836 ?auto_13834 ?auto_13833 )
      ( MAKE-2PILE ?auto_13832 ?auto_13833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13839 - BLOCK
      ?auto_13840 - BLOCK
    )
    :vars
    (
      ?auto_13841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13841 ?auto_13840 ) ( CLEAR ?auto_13841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13839 ) ( ON ?auto_13840 ?auto_13839 ) ( not ( = ?auto_13839 ?auto_13840 ) ) ( not ( = ?auto_13839 ?auto_13841 ) ) ( not ( = ?auto_13840 ?auto_13841 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13841 ?auto_13840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13842 - BLOCK
      ?auto_13843 - BLOCK
    )
    :vars
    (
      ?auto_13844 - BLOCK
      ?auto_13845 - BLOCK
      ?auto_13846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13844 ?auto_13843 ) ( CLEAR ?auto_13844 ) ( ON-TABLE ?auto_13842 ) ( ON ?auto_13843 ?auto_13842 ) ( not ( = ?auto_13842 ?auto_13843 ) ) ( not ( = ?auto_13842 ?auto_13844 ) ) ( not ( = ?auto_13843 ?auto_13844 ) ) ( HOLDING ?auto_13845 ) ( CLEAR ?auto_13846 ) ( not ( = ?auto_13842 ?auto_13845 ) ) ( not ( = ?auto_13842 ?auto_13846 ) ) ( not ( = ?auto_13843 ?auto_13845 ) ) ( not ( = ?auto_13843 ?auto_13846 ) ) ( not ( = ?auto_13844 ?auto_13845 ) ) ( not ( = ?auto_13844 ?auto_13846 ) ) ( not ( = ?auto_13845 ?auto_13846 ) ) )
    :subtasks
    ( ( !STACK ?auto_13845 ?auto_13846 )
      ( MAKE-2PILE ?auto_13842 ?auto_13843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14042 - BLOCK
      ?auto_14043 - BLOCK
    )
    :vars
    (
      ?auto_14044 - BLOCK
      ?auto_14045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14044 ?auto_14043 ) ( ON-TABLE ?auto_14042 ) ( ON ?auto_14043 ?auto_14042 ) ( not ( = ?auto_14042 ?auto_14043 ) ) ( not ( = ?auto_14042 ?auto_14044 ) ) ( not ( = ?auto_14043 ?auto_14044 ) ) ( not ( = ?auto_14042 ?auto_14045 ) ) ( not ( = ?auto_14043 ?auto_14045 ) ) ( not ( = ?auto_14044 ?auto_14045 ) ) ( ON ?auto_14045 ?auto_14044 ) ( CLEAR ?auto_14045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14042 ?auto_14043 ?auto_14044 )
      ( MAKE-2PILE ?auto_14042 ?auto_14043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13852 - BLOCK
      ?auto_13853 - BLOCK
    )
    :vars
    (
      ?auto_13854 - BLOCK
      ?auto_13856 - BLOCK
      ?auto_13855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13854 ?auto_13853 ) ( ON-TABLE ?auto_13852 ) ( ON ?auto_13853 ?auto_13852 ) ( not ( = ?auto_13852 ?auto_13853 ) ) ( not ( = ?auto_13852 ?auto_13854 ) ) ( not ( = ?auto_13853 ?auto_13854 ) ) ( not ( = ?auto_13852 ?auto_13856 ) ) ( not ( = ?auto_13852 ?auto_13855 ) ) ( not ( = ?auto_13853 ?auto_13856 ) ) ( not ( = ?auto_13853 ?auto_13855 ) ) ( not ( = ?auto_13854 ?auto_13856 ) ) ( not ( = ?auto_13854 ?auto_13855 ) ) ( not ( = ?auto_13856 ?auto_13855 ) ) ( ON ?auto_13856 ?auto_13854 ) ( CLEAR ?auto_13856 ) ( HOLDING ?auto_13855 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13855 )
      ( MAKE-2PILE ?auto_13852 ?auto_13853 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13857 - BLOCK
      ?auto_13858 - BLOCK
    )
    :vars
    (
      ?auto_13860 - BLOCK
      ?auto_13861 - BLOCK
      ?auto_13859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13860 ?auto_13858 ) ( ON-TABLE ?auto_13857 ) ( ON ?auto_13858 ?auto_13857 ) ( not ( = ?auto_13857 ?auto_13858 ) ) ( not ( = ?auto_13857 ?auto_13860 ) ) ( not ( = ?auto_13858 ?auto_13860 ) ) ( not ( = ?auto_13857 ?auto_13861 ) ) ( not ( = ?auto_13857 ?auto_13859 ) ) ( not ( = ?auto_13858 ?auto_13861 ) ) ( not ( = ?auto_13858 ?auto_13859 ) ) ( not ( = ?auto_13860 ?auto_13861 ) ) ( not ( = ?auto_13860 ?auto_13859 ) ) ( not ( = ?auto_13861 ?auto_13859 ) ) ( ON ?auto_13861 ?auto_13860 ) ( ON ?auto_13859 ?auto_13861 ) ( CLEAR ?auto_13859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13857 ?auto_13858 ?auto_13860 ?auto_13861 )
      ( MAKE-2PILE ?auto_13857 ?auto_13858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13865 - BLOCK
      ?auto_13866 - BLOCK
      ?auto_13867 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13867 ) ( CLEAR ?auto_13866 ) ( ON-TABLE ?auto_13865 ) ( ON ?auto_13866 ?auto_13865 ) ( not ( = ?auto_13865 ?auto_13866 ) ) ( not ( = ?auto_13865 ?auto_13867 ) ) ( not ( = ?auto_13866 ?auto_13867 ) ) )
    :subtasks
    ( ( !STACK ?auto_13867 ?auto_13866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13868 - BLOCK
      ?auto_13869 - BLOCK
      ?auto_13870 - BLOCK
    )
    :vars
    (
      ?auto_13871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13869 ) ( ON-TABLE ?auto_13868 ) ( ON ?auto_13869 ?auto_13868 ) ( not ( = ?auto_13868 ?auto_13869 ) ) ( not ( = ?auto_13868 ?auto_13870 ) ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( ON ?auto_13870 ?auto_13871 ) ( CLEAR ?auto_13870 ) ( HAND-EMPTY ) ( not ( = ?auto_13868 ?auto_13871 ) ) ( not ( = ?auto_13869 ?auto_13871 ) ) ( not ( = ?auto_13870 ?auto_13871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13870 ?auto_13871 )
      ( MAKE-3PILE ?auto_13868 ?auto_13869 ?auto_13870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13872 - BLOCK
      ?auto_13873 - BLOCK
      ?auto_13874 - BLOCK
    )
    :vars
    (
      ?auto_13875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13872 ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( not ( = ?auto_13872 ?auto_13874 ) ) ( not ( = ?auto_13873 ?auto_13874 ) ) ( ON ?auto_13874 ?auto_13875 ) ( CLEAR ?auto_13874 ) ( not ( = ?auto_13872 ?auto_13875 ) ) ( not ( = ?auto_13873 ?auto_13875 ) ) ( not ( = ?auto_13874 ?auto_13875 ) ) ( HOLDING ?auto_13873 ) ( CLEAR ?auto_13872 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13872 ?auto_13873 )
      ( MAKE-3PILE ?auto_13872 ?auto_13873 ?auto_13874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13876 - BLOCK
      ?auto_13877 - BLOCK
      ?auto_13878 - BLOCK
    )
    :vars
    (
      ?auto_13879 - BLOCK
      ?auto_13880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13876 ) ( not ( = ?auto_13876 ?auto_13877 ) ) ( not ( = ?auto_13876 ?auto_13878 ) ) ( not ( = ?auto_13877 ?auto_13878 ) ) ( ON ?auto_13878 ?auto_13879 ) ( not ( = ?auto_13876 ?auto_13879 ) ) ( not ( = ?auto_13877 ?auto_13879 ) ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( CLEAR ?auto_13876 ) ( ON ?auto_13877 ?auto_13878 ) ( CLEAR ?auto_13877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13880 ) ( ON ?auto_13879 ?auto_13880 ) ( not ( = ?auto_13880 ?auto_13879 ) ) ( not ( = ?auto_13880 ?auto_13878 ) ) ( not ( = ?auto_13880 ?auto_13877 ) ) ( not ( = ?auto_13876 ?auto_13880 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13880 ?auto_13879 ?auto_13878 )
      ( MAKE-3PILE ?auto_13876 ?auto_13877 ?auto_13878 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13881 - BLOCK
      ?auto_13882 - BLOCK
      ?auto_13883 - BLOCK
    )
    :vars
    (
      ?auto_13884 - BLOCK
      ?auto_13885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13881 ?auto_13882 ) ) ( not ( = ?auto_13881 ?auto_13883 ) ) ( not ( = ?auto_13882 ?auto_13883 ) ) ( ON ?auto_13883 ?auto_13884 ) ( not ( = ?auto_13881 ?auto_13884 ) ) ( not ( = ?auto_13882 ?auto_13884 ) ) ( not ( = ?auto_13883 ?auto_13884 ) ) ( ON ?auto_13882 ?auto_13883 ) ( CLEAR ?auto_13882 ) ( ON-TABLE ?auto_13885 ) ( ON ?auto_13884 ?auto_13885 ) ( not ( = ?auto_13885 ?auto_13884 ) ) ( not ( = ?auto_13885 ?auto_13883 ) ) ( not ( = ?auto_13885 ?auto_13882 ) ) ( not ( = ?auto_13881 ?auto_13885 ) ) ( HOLDING ?auto_13881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13881 )
      ( MAKE-3PILE ?auto_13881 ?auto_13882 ?auto_13883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13886 - BLOCK
      ?auto_13887 - BLOCK
      ?auto_13888 - BLOCK
    )
    :vars
    (
      ?auto_13890 - BLOCK
      ?auto_13889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13886 ?auto_13887 ) ) ( not ( = ?auto_13886 ?auto_13888 ) ) ( not ( = ?auto_13887 ?auto_13888 ) ) ( ON ?auto_13888 ?auto_13890 ) ( not ( = ?auto_13886 ?auto_13890 ) ) ( not ( = ?auto_13887 ?auto_13890 ) ) ( not ( = ?auto_13888 ?auto_13890 ) ) ( ON ?auto_13887 ?auto_13888 ) ( ON-TABLE ?auto_13889 ) ( ON ?auto_13890 ?auto_13889 ) ( not ( = ?auto_13889 ?auto_13890 ) ) ( not ( = ?auto_13889 ?auto_13888 ) ) ( not ( = ?auto_13889 ?auto_13887 ) ) ( not ( = ?auto_13886 ?auto_13889 ) ) ( ON ?auto_13886 ?auto_13887 ) ( CLEAR ?auto_13886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13889 ?auto_13890 ?auto_13888 ?auto_13887 )
      ( MAKE-3PILE ?auto_13886 ?auto_13887 ?auto_13888 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13892 - BLOCK
    )
    :vars
    (
      ?auto_13893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13893 ?auto_13892 ) ( CLEAR ?auto_13893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13892 ) ( not ( = ?auto_13892 ?auto_13893 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13893 ?auto_13892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13894 - BLOCK
    )
    :vars
    (
      ?auto_13895 - BLOCK
      ?auto_13896 - BLOCK
      ?auto_13897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13895 ?auto_13894 ) ( CLEAR ?auto_13895 ) ( ON-TABLE ?auto_13894 ) ( not ( = ?auto_13894 ?auto_13895 ) ) ( HOLDING ?auto_13896 ) ( CLEAR ?auto_13897 ) ( not ( = ?auto_13894 ?auto_13896 ) ) ( not ( = ?auto_13894 ?auto_13897 ) ) ( not ( = ?auto_13895 ?auto_13896 ) ) ( not ( = ?auto_13895 ?auto_13897 ) ) ( not ( = ?auto_13896 ?auto_13897 ) ) )
    :subtasks
    ( ( !STACK ?auto_13896 ?auto_13897 )
      ( MAKE-1PILE ?auto_13894 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13898 - BLOCK
    )
    :vars
    (
      ?auto_13900 - BLOCK
      ?auto_13899 - BLOCK
      ?auto_13901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13900 ?auto_13898 ) ( ON-TABLE ?auto_13898 ) ( not ( = ?auto_13898 ?auto_13900 ) ) ( CLEAR ?auto_13899 ) ( not ( = ?auto_13898 ?auto_13901 ) ) ( not ( = ?auto_13898 ?auto_13899 ) ) ( not ( = ?auto_13900 ?auto_13901 ) ) ( not ( = ?auto_13900 ?auto_13899 ) ) ( not ( = ?auto_13901 ?auto_13899 ) ) ( ON ?auto_13901 ?auto_13900 ) ( CLEAR ?auto_13901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13898 ?auto_13900 )
      ( MAKE-1PILE ?auto_13898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13902 - BLOCK
    )
    :vars
    (
      ?auto_13904 - BLOCK
      ?auto_13905 - BLOCK
      ?auto_13903 - BLOCK
      ?auto_13906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13904 ?auto_13902 ) ( ON-TABLE ?auto_13902 ) ( not ( = ?auto_13902 ?auto_13904 ) ) ( not ( = ?auto_13902 ?auto_13905 ) ) ( not ( = ?auto_13902 ?auto_13903 ) ) ( not ( = ?auto_13904 ?auto_13905 ) ) ( not ( = ?auto_13904 ?auto_13903 ) ) ( not ( = ?auto_13905 ?auto_13903 ) ) ( ON ?auto_13905 ?auto_13904 ) ( CLEAR ?auto_13905 ) ( HOLDING ?auto_13903 ) ( CLEAR ?auto_13906 ) ( ON-TABLE ?auto_13906 ) ( not ( = ?auto_13906 ?auto_13903 ) ) ( not ( = ?auto_13902 ?auto_13906 ) ) ( not ( = ?auto_13904 ?auto_13906 ) ) ( not ( = ?auto_13905 ?auto_13906 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13906 ?auto_13903 )
      ( MAKE-1PILE ?auto_13902 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14130 - BLOCK
    )
    :vars
    (
      ?auto_14132 - BLOCK
      ?auto_14131 - BLOCK
      ?auto_14133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14132 ?auto_14130 ) ( ON-TABLE ?auto_14130 ) ( not ( = ?auto_14130 ?auto_14132 ) ) ( not ( = ?auto_14130 ?auto_14131 ) ) ( not ( = ?auto_14130 ?auto_14133 ) ) ( not ( = ?auto_14132 ?auto_14131 ) ) ( not ( = ?auto_14132 ?auto_14133 ) ) ( not ( = ?auto_14131 ?auto_14133 ) ) ( ON ?auto_14131 ?auto_14132 ) ( ON ?auto_14133 ?auto_14131 ) ( CLEAR ?auto_14133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14130 ?auto_14132 ?auto_14131 )
      ( MAKE-1PILE ?auto_14130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13912 - BLOCK
    )
    :vars
    (
      ?auto_13915 - BLOCK
      ?auto_13914 - BLOCK
      ?auto_13916 - BLOCK
      ?auto_13913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13915 ?auto_13912 ) ( ON-TABLE ?auto_13912 ) ( not ( = ?auto_13912 ?auto_13915 ) ) ( not ( = ?auto_13912 ?auto_13914 ) ) ( not ( = ?auto_13912 ?auto_13916 ) ) ( not ( = ?auto_13915 ?auto_13914 ) ) ( not ( = ?auto_13915 ?auto_13916 ) ) ( not ( = ?auto_13914 ?auto_13916 ) ) ( ON ?auto_13914 ?auto_13915 ) ( not ( = ?auto_13913 ?auto_13916 ) ) ( not ( = ?auto_13912 ?auto_13913 ) ) ( not ( = ?auto_13915 ?auto_13913 ) ) ( not ( = ?auto_13914 ?auto_13913 ) ) ( ON ?auto_13916 ?auto_13914 ) ( CLEAR ?auto_13916 ) ( HOLDING ?auto_13913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13913 )
      ( MAKE-1PILE ?auto_13912 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13917 - BLOCK
    )
    :vars
    (
      ?auto_13920 - BLOCK
      ?auto_13919 - BLOCK
      ?auto_13918 - BLOCK
      ?auto_13921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13920 ?auto_13917 ) ( ON-TABLE ?auto_13917 ) ( not ( = ?auto_13917 ?auto_13920 ) ) ( not ( = ?auto_13917 ?auto_13919 ) ) ( not ( = ?auto_13917 ?auto_13918 ) ) ( not ( = ?auto_13920 ?auto_13919 ) ) ( not ( = ?auto_13920 ?auto_13918 ) ) ( not ( = ?auto_13919 ?auto_13918 ) ) ( ON ?auto_13919 ?auto_13920 ) ( not ( = ?auto_13921 ?auto_13918 ) ) ( not ( = ?auto_13917 ?auto_13921 ) ) ( not ( = ?auto_13920 ?auto_13921 ) ) ( not ( = ?auto_13919 ?auto_13921 ) ) ( ON ?auto_13918 ?auto_13919 ) ( ON ?auto_13921 ?auto_13918 ) ( CLEAR ?auto_13921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13917 ?auto_13920 ?auto_13919 ?auto_13918 )
      ( MAKE-1PILE ?auto_13917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13926 - BLOCK
      ?auto_13927 - BLOCK
      ?auto_13928 - BLOCK
      ?auto_13929 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13929 ) ( CLEAR ?auto_13928 ) ( ON-TABLE ?auto_13926 ) ( ON ?auto_13927 ?auto_13926 ) ( ON ?auto_13928 ?auto_13927 ) ( not ( = ?auto_13926 ?auto_13927 ) ) ( not ( = ?auto_13926 ?auto_13928 ) ) ( not ( = ?auto_13926 ?auto_13929 ) ) ( not ( = ?auto_13927 ?auto_13928 ) ) ( not ( = ?auto_13927 ?auto_13929 ) ) ( not ( = ?auto_13928 ?auto_13929 ) ) )
    :subtasks
    ( ( !STACK ?auto_13929 ?auto_13928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13930 - BLOCK
      ?auto_13931 - BLOCK
      ?auto_13932 - BLOCK
      ?auto_13933 - BLOCK
    )
    :vars
    (
      ?auto_13934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13932 ) ( ON-TABLE ?auto_13930 ) ( ON ?auto_13931 ?auto_13930 ) ( ON ?auto_13932 ?auto_13931 ) ( not ( = ?auto_13930 ?auto_13931 ) ) ( not ( = ?auto_13930 ?auto_13932 ) ) ( not ( = ?auto_13930 ?auto_13933 ) ) ( not ( = ?auto_13931 ?auto_13932 ) ) ( not ( = ?auto_13931 ?auto_13933 ) ) ( not ( = ?auto_13932 ?auto_13933 ) ) ( ON ?auto_13933 ?auto_13934 ) ( CLEAR ?auto_13933 ) ( HAND-EMPTY ) ( not ( = ?auto_13930 ?auto_13934 ) ) ( not ( = ?auto_13931 ?auto_13934 ) ) ( not ( = ?auto_13932 ?auto_13934 ) ) ( not ( = ?auto_13933 ?auto_13934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13933 ?auto_13934 )
      ( MAKE-4PILE ?auto_13930 ?auto_13931 ?auto_13932 ?auto_13933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13935 - BLOCK
      ?auto_13936 - BLOCK
      ?auto_13937 - BLOCK
      ?auto_13938 - BLOCK
    )
    :vars
    (
      ?auto_13939 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13935 ) ( ON ?auto_13936 ?auto_13935 ) ( not ( = ?auto_13935 ?auto_13936 ) ) ( not ( = ?auto_13935 ?auto_13937 ) ) ( not ( = ?auto_13935 ?auto_13938 ) ) ( not ( = ?auto_13936 ?auto_13937 ) ) ( not ( = ?auto_13936 ?auto_13938 ) ) ( not ( = ?auto_13937 ?auto_13938 ) ) ( ON ?auto_13938 ?auto_13939 ) ( CLEAR ?auto_13938 ) ( not ( = ?auto_13935 ?auto_13939 ) ) ( not ( = ?auto_13936 ?auto_13939 ) ) ( not ( = ?auto_13937 ?auto_13939 ) ) ( not ( = ?auto_13938 ?auto_13939 ) ) ( HOLDING ?auto_13937 ) ( CLEAR ?auto_13936 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13935 ?auto_13936 ?auto_13937 )
      ( MAKE-4PILE ?auto_13935 ?auto_13936 ?auto_13937 ?auto_13938 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13940 - BLOCK
      ?auto_13941 - BLOCK
      ?auto_13942 - BLOCK
      ?auto_13943 - BLOCK
    )
    :vars
    (
      ?auto_13944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13940 ) ( ON ?auto_13941 ?auto_13940 ) ( not ( = ?auto_13940 ?auto_13941 ) ) ( not ( = ?auto_13940 ?auto_13942 ) ) ( not ( = ?auto_13940 ?auto_13943 ) ) ( not ( = ?auto_13941 ?auto_13942 ) ) ( not ( = ?auto_13941 ?auto_13943 ) ) ( not ( = ?auto_13942 ?auto_13943 ) ) ( ON ?auto_13943 ?auto_13944 ) ( not ( = ?auto_13940 ?auto_13944 ) ) ( not ( = ?auto_13941 ?auto_13944 ) ) ( not ( = ?auto_13942 ?auto_13944 ) ) ( not ( = ?auto_13943 ?auto_13944 ) ) ( CLEAR ?auto_13941 ) ( ON ?auto_13942 ?auto_13943 ) ( CLEAR ?auto_13942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13944 ?auto_13943 )
      ( MAKE-4PILE ?auto_13940 ?auto_13941 ?auto_13942 ?auto_13943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13945 - BLOCK
      ?auto_13946 - BLOCK
      ?auto_13947 - BLOCK
      ?auto_13948 - BLOCK
    )
    :vars
    (
      ?auto_13949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13945 ) ( not ( = ?auto_13945 ?auto_13946 ) ) ( not ( = ?auto_13945 ?auto_13947 ) ) ( not ( = ?auto_13945 ?auto_13948 ) ) ( not ( = ?auto_13946 ?auto_13947 ) ) ( not ( = ?auto_13946 ?auto_13948 ) ) ( not ( = ?auto_13947 ?auto_13948 ) ) ( ON ?auto_13948 ?auto_13949 ) ( not ( = ?auto_13945 ?auto_13949 ) ) ( not ( = ?auto_13946 ?auto_13949 ) ) ( not ( = ?auto_13947 ?auto_13949 ) ) ( not ( = ?auto_13948 ?auto_13949 ) ) ( ON ?auto_13947 ?auto_13948 ) ( CLEAR ?auto_13947 ) ( ON-TABLE ?auto_13949 ) ( HOLDING ?auto_13946 ) ( CLEAR ?auto_13945 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13945 ?auto_13946 )
      ( MAKE-4PILE ?auto_13945 ?auto_13946 ?auto_13947 ?auto_13948 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13950 - BLOCK
      ?auto_13951 - BLOCK
      ?auto_13952 - BLOCK
      ?auto_13953 - BLOCK
    )
    :vars
    (
      ?auto_13954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13950 ) ( not ( = ?auto_13950 ?auto_13951 ) ) ( not ( = ?auto_13950 ?auto_13952 ) ) ( not ( = ?auto_13950 ?auto_13953 ) ) ( not ( = ?auto_13951 ?auto_13952 ) ) ( not ( = ?auto_13951 ?auto_13953 ) ) ( not ( = ?auto_13952 ?auto_13953 ) ) ( ON ?auto_13953 ?auto_13954 ) ( not ( = ?auto_13950 ?auto_13954 ) ) ( not ( = ?auto_13951 ?auto_13954 ) ) ( not ( = ?auto_13952 ?auto_13954 ) ) ( not ( = ?auto_13953 ?auto_13954 ) ) ( ON ?auto_13952 ?auto_13953 ) ( ON-TABLE ?auto_13954 ) ( CLEAR ?auto_13950 ) ( ON ?auto_13951 ?auto_13952 ) ( CLEAR ?auto_13951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13954 ?auto_13953 ?auto_13952 )
      ( MAKE-4PILE ?auto_13950 ?auto_13951 ?auto_13952 ?auto_13953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13955 - BLOCK
      ?auto_13956 - BLOCK
      ?auto_13957 - BLOCK
      ?auto_13958 - BLOCK
    )
    :vars
    (
      ?auto_13959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13955 ?auto_13956 ) ) ( not ( = ?auto_13955 ?auto_13957 ) ) ( not ( = ?auto_13955 ?auto_13958 ) ) ( not ( = ?auto_13956 ?auto_13957 ) ) ( not ( = ?auto_13956 ?auto_13958 ) ) ( not ( = ?auto_13957 ?auto_13958 ) ) ( ON ?auto_13958 ?auto_13959 ) ( not ( = ?auto_13955 ?auto_13959 ) ) ( not ( = ?auto_13956 ?auto_13959 ) ) ( not ( = ?auto_13957 ?auto_13959 ) ) ( not ( = ?auto_13958 ?auto_13959 ) ) ( ON ?auto_13957 ?auto_13958 ) ( ON-TABLE ?auto_13959 ) ( ON ?auto_13956 ?auto_13957 ) ( CLEAR ?auto_13956 ) ( HOLDING ?auto_13955 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13955 )
      ( MAKE-4PILE ?auto_13955 ?auto_13956 ?auto_13957 ?auto_13958 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13960 - BLOCK
      ?auto_13961 - BLOCK
      ?auto_13962 - BLOCK
      ?auto_13963 - BLOCK
    )
    :vars
    (
      ?auto_13964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13960 ?auto_13961 ) ) ( not ( = ?auto_13960 ?auto_13962 ) ) ( not ( = ?auto_13960 ?auto_13963 ) ) ( not ( = ?auto_13961 ?auto_13962 ) ) ( not ( = ?auto_13961 ?auto_13963 ) ) ( not ( = ?auto_13962 ?auto_13963 ) ) ( ON ?auto_13963 ?auto_13964 ) ( not ( = ?auto_13960 ?auto_13964 ) ) ( not ( = ?auto_13961 ?auto_13964 ) ) ( not ( = ?auto_13962 ?auto_13964 ) ) ( not ( = ?auto_13963 ?auto_13964 ) ) ( ON ?auto_13962 ?auto_13963 ) ( ON-TABLE ?auto_13964 ) ( ON ?auto_13961 ?auto_13962 ) ( ON ?auto_13960 ?auto_13961 ) ( CLEAR ?auto_13960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13964 ?auto_13963 ?auto_13962 ?auto_13961 )
      ( MAKE-4PILE ?auto_13960 ?auto_13961 ?auto_13962 ?auto_13963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14005 - BLOCK
    )
    :vars
    (
      ?auto_14006 - BLOCK
      ?auto_14007 - BLOCK
      ?auto_14008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14005 ?auto_14006 ) ( CLEAR ?auto_14005 ) ( not ( = ?auto_14005 ?auto_14006 ) ) ( HOLDING ?auto_14007 ) ( CLEAR ?auto_14008 ) ( not ( = ?auto_14005 ?auto_14007 ) ) ( not ( = ?auto_14005 ?auto_14008 ) ) ( not ( = ?auto_14006 ?auto_14007 ) ) ( not ( = ?auto_14006 ?auto_14008 ) ) ( not ( = ?auto_14007 ?auto_14008 ) ) )
    :subtasks
    ( ( !STACK ?auto_14007 ?auto_14008 )
      ( MAKE-1PILE ?auto_14005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14009 - BLOCK
    )
    :vars
    (
      ?auto_14011 - BLOCK
      ?auto_14012 - BLOCK
      ?auto_14010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14009 ?auto_14011 ) ( not ( = ?auto_14009 ?auto_14011 ) ) ( CLEAR ?auto_14012 ) ( not ( = ?auto_14009 ?auto_14010 ) ) ( not ( = ?auto_14009 ?auto_14012 ) ) ( not ( = ?auto_14011 ?auto_14010 ) ) ( not ( = ?auto_14011 ?auto_14012 ) ) ( not ( = ?auto_14010 ?auto_14012 ) ) ( ON ?auto_14010 ?auto_14009 ) ( CLEAR ?auto_14010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14011 ?auto_14009 )
      ( MAKE-1PILE ?auto_14009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14013 - BLOCK
    )
    :vars
    (
      ?auto_14016 - BLOCK
      ?auto_14014 - BLOCK
      ?auto_14015 - BLOCK
      ?auto_14017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14013 ?auto_14016 ) ( not ( = ?auto_14013 ?auto_14016 ) ) ( not ( = ?auto_14013 ?auto_14014 ) ) ( not ( = ?auto_14013 ?auto_14015 ) ) ( not ( = ?auto_14016 ?auto_14014 ) ) ( not ( = ?auto_14016 ?auto_14015 ) ) ( not ( = ?auto_14014 ?auto_14015 ) ) ( ON ?auto_14014 ?auto_14013 ) ( CLEAR ?auto_14014 ) ( ON-TABLE ?auto_14016 ) ( HOLDING ?auto_14015 ) ( CLEAR ?auto_14017 ) ( ON-TABLE ?auto_14017 ) ( not ( = ?auto_14017 ?auto_14015 ) ) ( not ( = ?auto_14013 ?auto_14017 ) ) ( not ( = ?auto_14016 ?auto_14017 ) ) ( not ( = ?auto_14014 ?auto_14017 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14017 ?auto_14015 )
      ( MAKE-1PILE ?auto_14013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14018 - BLOCK
    )
    :vars
    (
      ?auto_14019 - BLOCK
      ?auto_14020 - BLOCK
      ?auto_14022 - BLOCK
      ?auto_14021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14018 ?auto_14019 ) ( not ( = ?auto_14018 ?auto_14019 ) ) ( not ( = ?auto_14018 ?auto_14020 ) ) ( not ( = ?auto_14018 ?auto_14022 ) ) ( not ( = ?auto_14019 ?auto_14020 ) ) ( not ( = ?auto_14019 ?auto_14022 ) ) ( not ( = ?auto_14020 ?auto_14022 ) ) ( ON ?auto_14020 ?auto_14018 ) ( ON-TABLE ?auto_14019 ) ( CLEAR ?auto_14021 ) ( ON-TABLE ?auto_14021 ) ( not ( = ?auto_14021 ?auto_14022 ) ) ( not ( = ?auto_14018 ?auto_14021 ) ) ( not ( = ?auto_14019 ?auto_14021 ) ) ( not ( = ?auto_14020 ?auto_14021 ) ) ( ON ?auto_14022 ?auto_14020 ) ( CLEAR ?auto_14022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14019 ?auto_14018 ?auto_14020 )
      ( MAKE-1PILE ?auto_14018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14023 - BLOCK
    )
    :vars
    (
      ?auto_14024 - BLOCK
      ?auto_14025 - BLOCK
      ?auto_14027 - BLOCK
      ?auto_14026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14023 ?auto_14024 ) ( not ( = ?auto_14023 ?auto_14024 ) ) ( not ( = ?auto_14023 ?auto_14025 ) ) ( not ( = ?auto_14023 ?auto_14027 ) ) ( not ( = ?auto_14024 ?auto_14025 ) ) ( not ( = ?auto_14024 ?auto_14027 ) ) ( not ( = ?auto_14025 ?auto_14027 ) ) ( ON ?auto_14025 ?auto_14023 ) ( ON-TABLE ?auto_14024 ) ( not ( = ?auto_14026 ?auto_14027 ) ) ( not ( = ?auto_14023 ?auto_14026 ) ) ( not ( = ?auto_14024 ?auto_14026 ) ) ( not ( = ?auto_14025 ?auto_14026 ) ) ( ON ?auto_14027 ?auto_14025 ) ( CLEAR ?auto_14027 ) ( HOLDING ?auto_14026 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14026 )
      ( MAKE-1PILE ?auto_14023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14028 - BLOCK
    )
    :vars
    (
      ?auto_14032 - BLOCK
      ?auto_14029 - BLOCK
      ?auto_14030 - BLOCK
      ?auto_14031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14028 ?auto_14032 ) ( not ( = ?auto_14028 ?auto_14032 ) ) ( not ( = ?auto_14028 ?auto_14029 ) ) ( not ( = ?auto_14028 ?auto_14030 ) ) ( not ( = ?auto_14032 ?auto_14029 ) ) ( not ( = ?auto_14032 ?auto_14030 ) ) ( not ( = ?auto_14029 ?auto_14030 ) ) ( ON ?auto_14029 ?auto_14028 ) ( ON-TABLE ?auto_14032 ) ( not ( = ?auto_14031 ?auto_14030 ) ) ( not ( = ?auto_14028 ?auto_14031 ) ) ( not ( = ?auto_14032 ?auto_14031 ) ) ( not ( = ?auto_14029 ?auto_14031 ) ) ( ON ?auto_14030 ?auto_14029 ) ( ON ?auto_14031 ?auto_14030 ) ( CLEAR ?auto_14031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14032 ?auto_14028 ?auto_14029 ?auto_14030 )
      ( MAKE-1PILE ?auto_14028 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14038 - BLOCK
      ?auto_14039 - BLOCK
    )
    :vars
    (
      ?auto_14040 - BLOCK
      ?auto_14041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14040 ?auto_14039 ) ( CLEAR ?auto_14040 ) ( ON-TABLE ?auto_14038 ) ( ON ?auto_14039 ?auto_14038 ) ( not ( = ?auto_14038 ?auto_14039 ) ) ( not ( = ?auto_14038 ?auto_14040 ) ) ( not ( = ?auto_14039 ?auto_14040 ) ) ( HOLDING ?auto_14041 ) ( not ( = ?auto_14038 ?auto_14041 ) ) ( not ( = ?auto_14039 ?auto_14041 ) ) ( not ( = ?auto_14040 ?auto_14041 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14041 )
      ( MAKE-2PILE ?auto_14038 ?auto_14039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14075 - BLOCK
      ?auto_14076 - BLOCK
    )
    :vars
    (
      ?auto_14077 - BLOCK
      ?auto_14078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14075 ?auto_14076 ) ) ( ON ?auto_14076 ?auto_14077 ) ( not ( = ?auto_14075 ?auto_14077 ) ) ( not ( = ?auto_14076 ?auto_14077 ) ) ( ON ?auto_14075 ?auto_14076 ) ( CLEAR ?auto_14075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14078 ) ( ON ?auto_14077 ?auto_14078 ) ( not ( = ?auto_14078 ?auto_14077 ) ) ( not ( = ?auto_14078 ?auto_14076 ) ) ( not ( = ?auto_14078 ?auto_14075 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14078 ?auto_14077 ?auto_14076 )
      ( MAKE-2PILE ?auto_14075 ?auto_14076 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14081 - BLOCK
      ?auto_14082 - BLOCK
    )
    :vars
    (
      ?auto_14083 - BLOCK
      ?auto_14084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14081 ?auto_14082 ) ) ( ON ?auto_14082 ?auto_14083 ) ( CLEAR ?auto_14082 ) ( not ( = ?auto_14081 ?auto_14083 ) ) ( not ( = ?auto_14082 ?auto_14083 ) ) ( ON ?auto_14081 ?auto_14084 ) ( CLEAR ?auto_14081 ) ( HAND-EMPTY ) ( not ( = ?auto_14081 ?auto_14084 ) ) ( not ( = ?auto_14082 ?auto_14084 ) ) ( not ( = ?auto_14083 ?auto_14084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14081 ?auto_14084 )
      ( MAKE-2PILE ?auto_14081 ?auto_14082 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14085 - BLOCK
      ?auto_14086 - BLOCK
    )
    :vars
    (
      ?auto_14087 - BLOCK
      ?auto_14088 - BLOCK
      ?auto_14089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14085 ?auto_14086 ) ) ( not ( = ?auto_14085 ?auto_14087 ) ) ( not ( = ?auto_14086 ?auto_14087 ) ) ( ON ?auto_14085 ?auto_14088 ) ( CLEAR ?auto_14085 ) ( not ( = ?auto_14085 ?auto_14088 ) ) ( not ( = ?auto_14086 ?auto_14088 ) ) ( not ( = ?auto_14087 ?auto_14088 ) ) ( HOLDING ?auto_14086 ) ( CLEAR ?auto_14087 ) ( ON-TABLE ?auto_14089 ) ( ON ?auto_14087 ?auto_14089 ) ( not ( = ?auto_14089 ?auto_14087 ) ) ( not ( = ?auto_14089 ?auto_14086 ) ) ( not ( = ?auto_14085 ?auto_14089 ) ) ( not ( = ?auto_14088 ?auto_14089 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14089 ?auto_14087 ?auto_14086 )
      ( MAKE-2PILE ?auto_14085 ?auto_14086 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14090 - BLOCK
      ?auto_14091 - BLOCK
    )
    :vars
    (
      ?auto_14093 - BLOCK
      ?auto_14094 - BLOCK
      ?auto_14092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14090 ?auto_14091 ) ) ( not ( = ?auto_14090 ?auto_14093 ) ) ( not ( = ?auto_14091 ?auto_14093 ) ) ( ON ?auto_14090 ?auto_14094 ) ( not ( = ?auto_14090 ?auto_14094 ) ) ( not ( = ?auto_14091 ?auto_14094 ) ) ( not ( = ?auto_14093 ?auto_14094 ) ) ( CLEAR ?auto_14093 ) ( ON-TABLE ?auto_14092 ) ( ON ?auto_14093 ?auto_14092 ) ( not ( = ?auto_14092 ?auto_14093 ) ) ( not ( = ?auto_14092 ?auto_14091 ) ) ( not ( = ?auto_14090 ?auto_14092 ) ) ( not ( = ?auto_14094 ?auto_14092 ) ) ( ON ?auto_14091 ?auto_14090 ) ( CLEAR ?auto_14091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14094 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14094 ?auto_14090 )
      ( MAKE-2PILE ?auto_14090 ?auto_14091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14095 - BLOCK
      ?auto_14096 - BLOCK
    )
    :vars
    (
      ?auto_14098 - BLOCK
      ?auto_14099 - BLOCK
      ?auto_14097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14095 ?auto_14096 ) ) ( not ( = ?auto_14095 ?auto_14098 ) ) ( not ( = ?auto_14096 ?auto_14098 ) ) ( ON ?auto_14095 ?auto_14099 ) ( not ( = ?auto_14095 ?auto_14099 ) ) ( not ( = ?auto_14096 ?auto_14099 ) ) ( not ( = ?auto_14098 ?auto_14099 ) ) ( ON-TABLE ?auto_14097 ) ( not ( = ?auto_14097 ?auto_14098 ) ) ( not ( = ?auto_14097 ?auto_14096 ) ) ( not ( = ?auto_14095 ?auto_14097 ) ) ( not ( = ?auto_14099 ?auto_14097 ) ) ( ON ?auto_14096 ?auto_14095 ) ( CLEAR ?auto_14096 ) ( ON-TABLE ?auto_14099 ) ( HOLDING ?auto_14098 ) ( CLEAR ?auto_14097 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14097 ?auto_14098 )
      ( MAKE-2PILE ?auto_14095 ?auto_14096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14100 - BLOCK
      ?auto_14101 - BLOCK
    )
    :vars
    (
      ?auto_14104 - BLOCK
      ?auto_14103 - BLOCK
      ?auto_14102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14100 ?auto_14101 ) ) ( not ( = ?auto_14100 ?auto_14104 ) ) ( not ( = ?auto_14101 ?auto_14104 ) ) ( ON ?auto_14100 ?auto_14103 ) ( not ( = ?auto_14100 ?auto_14103 ) ) ( not ( = ?auto_14101 ?auto_14103 ) ) ( not ( = ?auto_14104 ?auto_14103 ) ) ( ON-TABLE ?auto_14102 ) ( not ( = ?auto_14102 ?auto_14104 ) ) ( not ( = ?auto_14102 ?auto_14101 ) ) ( not ( = ?auto_14100 ?auto_14102 ) ) ( not ( = ?auto_14103 ?auto_14102 ) ) ( ON ?auto_14101 ?auto_14100 ) ( ON-TABLE ?auto_14103 ) ( CLEAR ?auto_14102 ) ( ON ?auto_14104 ?auto_14101 ) ( CLEAR ?auto_14104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14103 ?auto_14100 ?auto_14101 )
      ( MAKE-2PILE ?auto_14100 ?auto_14101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14105 - BLOCK
      ?auto_14106 - BLOCK
    )
    :vars
    (
      ?auto_14107 - BLOCK
      ?auto_14109 - BLOCK
      ?auto_14108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14105 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14107 ) ) ( not ( = ?auto_14106 ?auto_14107 ) ) ( ON ?auto_14105 ?auto_14109 ) ( not ( = ?auto_14105 ?auto_14109 ) ) ( not ( = ?auto_14106 ?auto_14109 ) ) ( not ( = ?auto_14107 ?auto_14109 ) ) ( not ( = ?auto_14108 ?auto_14107 ) ) ( not ( = ?auto_14108 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14108 ) ) ( not ( = ?auto_14109 ?auto_14108 ) ) ( ON ?auto_14106 ?auto_14105 ) ( ON-TABLE ?auto_14109 ) ( ON ?auto_14107 ?auto_14106 ) ( CLEAR ?auto_14107 ) ( HOLDING ?auto_14108 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14108 )
      ( MAKE-2PILE ?auto_14105 ?auto_14106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14110 - BLOCK
      ?auto_14111 - BLOCK
    )
    :vars
    (
      ?auto_14114 - BLOCK
      ?auto_14112 - BLOCK
      ?auto_14113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14110 ?auto_14111 ) ) ( not ( = ?auto_14110 ?auto_14114 ) ) ( not ( = ?auto_14111 ?auto_14114 ) ) ( ON ?auto_14110 ?auto_14112 ) ( not ( = ?auto_14110 ?auto_14112 ) ) ( not ( = ?auto_14111 ?auto_14112 ) ) ( not ( = ?auto_14114 ?auto_14112 ) ) ( not ( = ?auto_14113 ?auto_14114 ) ) ( not ( = ?auto_14113 ?auto_14111 ) ) ( not ( = ?auto_14110 ?auto_14113 ) ) ( not ( = ?auto_14112 ?auto_14113 ) ) ( ON ?auto_14111 ?auto_14110 ) ( ON-TABLE ?auto_14112 ) ( ON ?auto_14114 ?auto_14111 ) ( ON ?auto_14113 ?auto_14114 ) ( CLEAR ?auto_14113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14112 ?auto_14110 ?auto_14111 ?auto_14114 )
      ( MAKE-2PILE ?auto_14110 ?auto_14111 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14126 - BLOCK
    )
    :vars
    (
      ?auto_14127 - BLOCK
      ?auto_14129 - BLOCK
      ?auto_14128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14127 ?auto_14126 ) ( ON-TABLE ?auto_14126 ) ( not ( = ?auto_14126 ?auto_14127 ) ) ( not ( = ?auto_14126 ?auto_14129 ) ) ( not ( = ?auto_14126 ?auto_14128 ) ) ( not ( = ?auto_14127 ?auto_14129 ) ) ( not ( = ?auto_14127 ?auto_14128 ) ) ( not ( = ?auto_14129 ?auto_14128 ) ) ( ON ?auto_14129 ?auto_14127 ) ( CLEAR ?auto_14129 ) ( HOLDING ?auto_14128 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14128 )
      ( MAKE-1PILE ?auto_14126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14159 - BLOCK
      ?auto_14160 - BLOCK
      ?auto_14161 - BLOCK
    )
    :vars
    (
      ?auto_14162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14159 ) ( not ( = ?auto_14159 ?auto_14160 ) ) ( not ( = ?auto_14159 ?auto_14161 ) ) ( not ( = ?auto_14160 ?auto_14161 ) ) ( ON ?auto_14161 ?auto_14162 ) ( not ( = ?auto_14159 ?auto_14162 ) ) ( not ( = ?auto_14160 ?auto_14162 ) ) ( not ( = ?auto_14161 ?auto_14162 ) ) ( CLEAR ?auto_14159 ) ( ON ?auto_14160 ?auto_14161 ) ( CLEAR ?auto_14160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14162 ?auto_14161 )
      ( MAKE-3PILE ?auto_14159 ?auto_14160 ?auto_14161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14163 - BLOCK
      ?auto_14164 - BLOCK
      ?auto_14165 - BLOCK
    )
    :vars
    (
      ?auto_14166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14163 ?auto_14164 ) ) ( not ( = ?auto_14163 ?auto_14165 ) ) ( not ( = ?auto_14164 ?auto_14165 ) ) ( ON ?auto_14165 ?auto_14166 ) ( not ( = ?auto_14163 ?auto_14166 ) ) ( not ( = ?auto_14164 ?auto_14166 ) ) ( not ( = ?auto_14165 ?auto_14166 ) ) ( ON ?auto_14164 ?auto_14165 ) ( CLEAR ?auto_14164 ) ( ON-TABLE ?auto_14166 ) ( HOLDING ?auto_14163 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14163 )
      ( MAKE-3PILE ?auto_14163 ?auto_14164 ?auto_14165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14167 - BLOCK
      ?auto_14168 - BLOCK
      ?auto_14169 - BLOCK
    )
    :vars
    (
      ?auto_14170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14167 ?auto_14168 ) ) ( not ( = ?auto_14167 ?auto_14169 ) ) ( not ( = ?auto_14168 ?auto_14169 ) ) ( ON ?auto_14169 ?auto_14170 ) ( not ( = ?auto_14167 ?auto_14170 ) ) ( not ( = ?auto_14168 ?auto_14170 ) ) ( not ( = ?auto_14169 ?auto_14170 ) ) ( ON ?auto_14168 ?auto_14169 ) ( ON-TABLE ?auto_14170 ) ( ON ?auto_14167 ?auto_14168 ) ( CLEAR ?auto_14167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14170 ?auto_14169 ?auto_14168 )
      ( MAKE-3PILE ?auto_14167 ?auto_14168 ?auto_14169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14174 - BLOCK
      ?auto_14175 - BLOCK
      ?auto_14176 - BLOCK
    )
    :vars
    (
      ?auto_14177 - BLOCK
      ?auto_14178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14174 ?auto_14175 ) ) ( not ( = ?auto_14174 ?auto_14176 ) ) ( not ( = ?auto_14175 ?auto_14176 ) ) ( ON ?auto_14176 ?auto_14177 ) ( not ( = ?auto_14174 ?auto_14177 ) ) ( not ( = ?auto_14175 ?auto_14177 ) ) ( not ( = ?auto_14176 ?auto_14177 ) ) ( ON ?auto_14175 ?auto_14176 ) ( CLEAR ?auto_14175 ) ( ON-TABLE ?auto_14177 ) ( ON ?auto_14174 ?auto_14178 ) ( CLEAR ?auto_14174 ) ( HAND-EMPTY ) ( not ( = ?auto_14174 ?auto_14178 ) ) ( not ( = ?auto_14175 ?auto_14178 ) ) ( not ( = ?auto_14176 ?auto_14178 ) ) ( not ( = ?auto_14177 ?auto_14178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14174 ?auto_14178 )
      ( MAKE-3PILE ?auto_14174 ?auto_14175 ?auto_14176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14179 - BLOCK
      ?auto_14180 - BLOCK
      ?auto_14181 - BLOCK
    )
    :vars
    (
      ?auto_14183 - BLOCK
      ?auto_14182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14179 ?auto_14180 ) ) ( not ( = ?auto_14179 ?auto_14181 ) ) ( not ( = ?auto_14180 ?auto_14181 ) ) ( ON ?auto_14181 ?auto_14183 ) ( not ( = ?auto_14179 ?auto_14183 ) ) ( not ( = ?auto_14180 ?auto_14183 ) ) ( not ( = ?auto_14181 ?auto_14183 ) ) ( ON-TABLE ?auto_14183 ) ( ON ?auto_14179 ?auto_14182 ) ( CLEAR ?auto_14179 ) ( not ( = ?auto_14179 ?auto_14182 ) ) ( not ( = ?auto_14180 ?auto_14182 ) ) ( not ( = ?auto_14181 ?auto_14182 ) ) ( not ( = ?auto_14183 ?auto_14182 ) ) ( HOLDING ?auto_14180 ) ( CLEAR ?auto_14181 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14183 ?auto_14181 ?auto_14180 )
      ( MAKE-3PILE ?auto_14179 ?auto_14180 ?auto_14181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14184 - BLOCK
      ?auto_14185 - BLOCK
      ?auto_14186 - BLOCK
    )
    :vars
    (
      ?auto_14188 - BLOCK
      ?auto_14187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14184 ?auto_14185 ) ) ( not ( = ?auto_14184 ?auto_14186 ) ) ( not ( = ?auto_14185 ?auto_14186 ) ) ( ON ?auto_14186 ?auto_14188 ) ( not ( = ?auto_14184 ?auto_14188 ) ) ( not ( = ?auto_14185 ?auto_14188 ) ) ( not ( = ?auto_14186 ?auto_14188 ) ) ( ON-TABLE ?auto_14188 ) ( ON ?auto_14184 ?auto_14187 ) ( not ( = ?auto_14184 ?auto_14187 ) ) ( not ( = ?auto_14185 ?auto_14187 ) ) ( not ( = ?auto_14186 ?auto_14187 ) ) ( not ( = ?auto_14188 ?auto_14187 ) ) ( CLEAR ?auto_14186 ) ( ON ?auto_14185 ?auto_14184 ) ( CLEAR ?auto_14185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14187 ?auto_14184 )
      ( MAKE-3PILE ?auto_14184 ?auto_14185 ?auto_14186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14189 - BLOCK
      ?auto_14190 - BLOCK
      ?auto_14191 - BLOCK
    )
    :vars
    (
      ?auto_14192 - BLOCK
      ?auto_14193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14189 ?auto_14190 ) ) ( not ( = ?auto_14189 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( not ( = ?auto_14189 ?auto_14192 ) ) ( not ( = ?auto_14190 ?auto_14192 ) ) ( not ( = ?auto_14191 ?auto_14192 ) ) ( ON-TABLE ?auto_14192 ) ( ON ?auto_14189 ?auto_14193 ) ( not ( = ?auto_14189 ?auto_14193 ) ) ( not ( = ?auto_14190 ?auto_14193 ) ) ( not ( = ?auto_14191 ?auto_14193 ) ) ( not ( = ?auto_14192 ?auto_14193 ) ) ( ON ?auto_14190 ?auto_14189 ) ( CLEAR ?auto_14190 ) ( ON-TABLE ?auto_14193 ) ( HOLDING ?auto_14191 ) ( CLEAR ?auto_14192 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14192 ?auto_14191 )
      ( MAKE-3PILE ?auto_14189 ?auto_14190 ?auto_14191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14194 - BLOCK
      ?auto_14195 - BLOCK
      ?auto_14196 - BLOCK
    )
    :vars
    (
      ?auto_14197 - BLOCK
      ?auto_14198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14194 ?auto_14195 ) ) ( not ( = ?auto_14194 ?auto_14196 ) ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14194 ?auto_14197 ) ) ( not ( = ?auto_14195 ?auto_14197 ) ) ( not ( = ?auto_14196 ?auto_14197 ) ) ( ON-TABLE ?auto_14197 ) ( ON ?auto_14194 ?auto_14198 ) ( not ( = ?auto_14194 ?auto_14198 ) ) ( not ( = ?auto_14195 ?auto_14198 ) ) ( not ( = ?auto_14196 ?auto_14198 ) ) ( not ( = ?auto_14197 ?auto_14198 ) ) ( ON ?auto_14195 ?auto_14194 ) ( ON-TABLE ?auto_14198 ) ( CLEAR ?auto_14197 ) ( ON ?auto_14196 ?auto_14195 ) ( CLEAR ?auto_14196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14198 ?auto_14194 ?auto_14195 )
      ( MAKE-3PILE ?auto_14194 ?auto_14195 ?auto_14196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14199 - BLOCK
      ?auto_14200 - BLOCK
      ?auto_14201 - BLOCK
    )
    :vars
    (
      ?auto_14202 - BLOCK
      ?auto_14203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14199 ?auto_14200 ) ) ( not ( = ?auto_14199 ?auto_14201 ) ) ( not ( = ?auto_14200 ?auto_14201 ) ) ( not ( = ?auto_14199 ?auto_14202 ) ) ( not ( = ?auto_14200 ?auto_14202 ) ) ( not ( = ?auto_14201 ?auto_14202 ) ) ( ON ?auto_14199 ?auto_14203 ) ( not ( = ?auto_14199 ?auto_14203 ) ) ( not ( = ?auto_14200 ?auto_14203 ) ) ( not ( = ?auto_14201 ?auto_14203 ) ) ( not ( = ?auto_14202 ?auto_14203 ) ) ( ON ?auto_14200 ?auto_14199 ) ( ON-TABLE ?auto_14203 ) ( ON ?auto_14201 ?auto_14200 ) ( CLEAR ?auto_14201 ) ( HOLDING ?auto_14202 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14202 )
      ( MAKE-3PILE ?auto_14199 ?auto_14200 ?auto_14201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14204 - BLOCK
      ?auto_14205 - BLOCK
      ?auto_14206 - BLOCK
    )
    :vars
    (
      ?auto_14207 - BLOCK
      ?auto_14208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14204 ?auto_14205 ) ) ( not ( = ?auto_14204 ?auto_14206 ) ) ( not ( = ?auto_14205 ?auto_14206 ) ) ( not ( = ?auto_14204 ?auto_14207 ) ) ( not ( = ?auto_14205 ?auto_14207 ) ) ( not ( = ?auto_14206 ?auto_14207 ) ) ( ON ?auto_14204 ?auto_14208 ) ( not ( = ?auto_14204 ?auto_14208 ) ) ( not ( = ?auto_14205 ?auto_14208 ) ) ( not ( = ?auto_14206 ?auto_14208 ) ) ( not ( = ?auto_14207 ?auto_14208 ) ) ( ON ?auto_14205 ?auto_14204 ) ( ON-TABLE ?auto_14208 ) ( ON ?auto_14206 ?auto_14205 ) ( ON ?auto_14207 ?auto_14206 ) ( CLEAR ?auto_14207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14208 ?auto_14204 ?auto_14205 ?auto_14206 )
      ( MAKE-3PILE ?auto_14204 ?auto_14205 ?auto_14206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14217 - BLOCK
      ?auto_14218 - BLOCK
      ?auto_14219 - BLOCK
      ?auto_14220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14219 ) ( ON-TABLE ?auto_14217 ) ( ON ?auto_14218 ?auto_14217 ) ( ON ?auto_14219 ?auto_14218 ) ( not ( = ?auto_14217 ?auto_14218 ) ) ( not ( = ?auto_14217 ?auto_14219 ) ) ( not ( = ?auto_14217 ?auto_14220 ) ) ( not ( = ?auto_14218 ?auto_14219 ) ) ( not ( = ?auto_14218 ?auto_14220 ) ) ( not ( = ?auto_14219 ?auto_14220 ) ) ( ON-TABLE ?auto_14220 ) ( CLEAR ?auto_14220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_14220 )
      ( MAKE-4PILE ?auto_14217 ?auto_14218 ?auto_14219 ?auto_14220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14221 - BLOCK
      ?auto_14222 - BLOCK
      ?auto_14223 - BLOCK
      ?auto_14224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14221 ) ( ON ?auto_14222 ?auto_14221 ) ( not ( = ?auto_14221 ?auto_14222 ) ) ( not ( = ?auto_14221 ?auto_14223 ) ) ( not ( = ?auto_14221 ?auto_14224 ) ) ( not ( = ?auto_14222 ?auto_14223 ) ) ( not ( = ?auto_14222 ?auto_14224 ) ) ( not ( = ?auto_14223 ?auto_14224 ) ) ( ON-TABLE ?auto_14224 ) ( CLEAR ?auto_14224 ) ( HOLDING ?auto_14223 ) ( CLEAR ?auto_14222 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14221 ?auto_14222 ?auto_14223 )
      ( MAKE-4PILE ?auto_14221 ?auto_14222 ?auto_14223 ?auto_14224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14225 - BLOCK
      ?auto_14226 - BLOCK
      ?auto_14227 - BLOCK
      ?auto_14228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14225 ) ( ON ?auto_14226 ?auto_14225 ) ( not ( = ?auto_14225 ?auto_14226 ) ) ( not ( = ?auto_14225 ?auto_14227 ) ) ( not ( = ?auto_14225 ?auto_14228 ) ) ( not ( = ?auto_14226 ?auto_14227 ) ) ( not ( = ?auto_14226 ?auto_14228 ) ) ( not ( = ?auto_14227 ?auto_14228 ) ) ( ON-TABLE ?auto_14228 ) ( CLEAR ?auto_14226 ) ( ON ?auto_14227 ?auto_14228 ) ( CLEAR ?auto_14227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14228 )
      ( MAKE-4PILE ?auto_14225 ?auto_14226 ?auto_14227 ?auto_14228 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14229 - BLOCK
      ?auto_14230 - BLOCK
      ?auto_14231 - BLOCK
      ?auto_14232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14229 ) ( not ( = ?auto_14229 ?auto_14230 ) ) ( not ( = ?auto_14229 ?auto_14231 ) ) ( not ( = ?auto_14229 ?auto_14232 ) ) ( not ( = ?auto_14230 ?auto_14231 ) ) ( not ( = ?auto_14230 ?auto_14232 ) ) ( not ( = ?auto_14231 ?auto_14232 ) ) ( ON-TABLE ?auto_14232 ) ( ON ?auto_14231 ?auto_14232 ) ( CLEAR ?auto_14231 ) ( HOLDING ?auto_14230 ) ( CLEAR ?auto_14229 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14229 ?auto_14230 )
      ( MAKE-4PILE ?auto_14229 ?auto_14230 ?auto_14231 ?auto_14232 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14233 - BLOCK
      ?auto_14234 - BLOCK
      ?auto_14235 - BLOCK
      ?auto_14236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14233 ) ( not ( = ?auto_14233 ?auto_14234 ) ) ( not ( = ?auto_14233 ?auto_14235 ) ) ( not ( = ?auto_14233 ?auto_14236 ) ) ( not ( = ?auto_14234 ?auto_14235 ) ) ( not ( = ?auto_14234 ?auto_14236 ) ) ( not ( = ?auto_14235 ?auto_14236 ) ) ( ON-TABLE ?auto_14236 ) ( ON ?auto_14235 ?auto_14236 ) ( CLEAR ?auto_14233 ) ( ON ?auto_14234 ?auto_14235 ) ( CLEAR ?auto_14234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14236 ?auto_14235 )
      ( MAKE-4PILE ?auto_14233 ?auto_14234 ?auto_14235 ?auto_14236 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14237 - BLOCK
      ?auto_14238 - BLOCK
      ?auto_14239 - BLOCK
      ?auto_14240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14237 ?auto_14238 ) ) ( not ( = ?auto_14237 ?auto_14239 ) ) ( not ( = ?auto_14237 ?auto_14240 ) ) ( not ( = ?auto_14238 ?auto_14239 ) ) ( not ( = ?auto_14238 ?auto_14240 ) ) ( not ( = ?auto_14239 ?auto_14240 ) ) ( ON-TABLE ?auto_14240 ) ( ON ?auto_14239 ?auto_14240 ) ( ON ?auto_14238 ?auto_14239 ) ( CLEAR ?auto_14238 ) ( HOLDING ?auto_14237 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14237 )
      ( MAKE-4PILE ?auto_14237 ?auto_14238 ?auto_14239 ?auto_14240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14241 - BLOCK
      ?auto_14242 - BLOCK
      ?auto_14243 - BLOCK
      ?auto_14244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14241 ?auto_14242 ) ) ( not ( = ?auto_14241 ?auto_14243 ) ) ( not ( = ?auto_14241 ?auto_14244 ) ) ( not ( = ?auto_14242 ?auto_14243 ) ) ( not ( = ?auto_14242 ?auto_14244 ) ) ( not ( = ?auto_14243 ?auto_14244 ) ) ( ON-TABLE ?auto_14244 ) ( ON ?auto_14243 ?auto_14244 ) ( ON ?auto_14242 ?auto_14243 ) ( ON ?auto_14241 ?auto_14242 ) ( CLEAR ?auto_14241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14244 ?auto_14243 ?auto_14242 )
      ( MAKE-4PILE ?auto_14241 ?auto_14242 ?auto_14243 ?auto_14244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14249 - BLOCK
      ?auto_14250 - BLOCK
      ?auto_14251 - BLOCK
      ?auto_14252 - BLOCK
    )
    :vars
    (
      ?auto_14253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14249 ?auto_14250 ) ) ( not ( = ?auto_14249 ?auto_14251 ) ) ( not ( = ?auto_14249 ?auto_14252 ) ) ( not ( = ?auto_14250 ?auto_14251 ) ) ( not ( = ?auto_14250 ?auto_14252 ) ) ( not ( = ?auto_14251 ?auto_14252 ) ) ( ON-TABLE ?auto_14252 ) ( ON ?auto_14251 ?auto_14252 ) ( ON ?auto_14250 ?auto_14251 ) ( CLEAR ?auto_14250 ) ( ON ?auto_14249 ?auto_14253 ) ( CLEAR ?auto_14249 ) ( HAND-EMPTY ) ( not ( = ?auto_14249 ?auto_14253 ) ) ( not ( = ?auto_14250 ?auto_14253 ) ) ( not ( = ?auto_14251 ?auto_14253 ) ) ( not ( = ?auto_14252 ?auto_14253 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14249 ?auto_14253 )
      ( MAKE-4PILE ?auto_14249 ?auto_14250 ?auto_14251 ?auto_14252 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14254 - BLOCK
      ?auto_14255 - BLOCK
      ?auto_14256 - BLOCK
      ?auto_14257 - BLOCK
    )
    :vars
    (
      ?auto_14258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14254 ?auto_14255 ) ) ( not ( = ?auto_14254 ?auto_14256 ) ) ( not ( = ?auto_14254 ?auto_14257 ) ) ( not ( = ?auto_14255 ?auto_14256 ) ) ( not ( = ?auto_14255 ?auto_14257 ) ) ( not ( = ?auto_14256 ?auto_14257 ) ) ( ON-TABLE ?auto_14257 ) ( ON ?auto_14256 ?auto_14257 ) ( ON ?auto_14254 ?auto_14258 ) ( CLEAR ?auto_14254 ) ( not ( = ?auto_14254 ?auto_14258 ) ) ( not ( = ?auto_14255 ?auto_14258 ) ) ( not ( = ?auto_14256 ?auto_14258 ) ) ( not ( = ?auto_14257 ?auto_14258 ) ) ( HOLDING ?auto_14255 ) ( CLEAR ?auto_14256 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14257 ?auto_14256 ?auto_14255 )
      ( MAKE-4PILE ?auto_14254 ?auto_14255 ?auto_14256 ?auto_14257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14259 - BLOCK
      ?auto_14260 - BLOCK
      ?auto_14261 - BLOCK
      ?auto_14262 - BLOCK
    )
    :vars
    (
      ?auto_14263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14259 ?auto_14260 ) ) ( not ( = ?auto_14259 ?auto_14261 ) ) ( not ( = ?auto_14259 ?auto_14262 ) ) ( not ( = ?auto_14260 ?auto_14261 ) ) ( not ( = ?auto_14260 ?auto_14262 ) ) ( not ( = ?auto_14261 ?auto_14262 ) ) ( ON-TABLE ?auto_14262 ) ( ON ?auto_14261 ?auto_14262 ) ( ON ?auto_14259 ?auto_14263 ) ( not ( = ?auto_14259 ?auto_14263 ) ) ( not ( = ?auto_14260 ?auto_14263 ) ) ( not ( = ?auto_14261 ?auto_14263 ) ) ( not ( = ?auto_14262 ?auto_14263 ) ) ( CLEAR ?auto_14261 ) ( ON ?auto_14260 ?auto_14259 ) ( CLEAR ?auto_14260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14263 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14263 ?auto_14259 )
      ( MAKE-4PILE ?auto_14259 ?auto_14260 ?auto_14261 ?auto_14262 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14264 - BLOCK
      ?auto_14265 - BLOCK
      ?auto_14266 - BLOCK
      ?auto_14267 - BLOCK
    )
    :vars
    (
      ?auto_14268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14264 ?auto_14265 ) ) ( not ( = ?auto_14264 ?auto_14266 ) ) ( not ( = ?auto_14264 ?auto_14267 ) ) ( not ( = ?auto_14265 ?auto_14266 ) ) ( not ( = ?auto_14265 ?auto_14267 ) ) ( not ( = ?auto_14266 ?auto_14267 ) ) ( ON-TABLE ?auto_14267 ) ( ON ?auto_14264 ?auto_14268 ) ( not ( = ?auto_14264 ?auto_14268 ) ) ( not ( = ?auto_14265 ?auto_14268 ) ) ( not ( = ?auto_14266 ?auto_14268 ) ) ( not ( = ?auto_14267 ?auto_14268 ) ) ( ON ?auto_14265 ?auto_14264 ) ( CLEAR ?auto_14265 ) ( ON-TABLE ?auto_14268 ) ( HOLDING ?auto_14266 ) ( CLEAR ?auto_14267 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14267 ?auto_14266 )
      ( MAKE-4PILE ?auto_14264 ?auto_14265 ?auto_14266 ?auto_14267 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14269 - BLOCK
      ?auto_14270 - BLOCK
      ?auto_14271 - BLOCK
      ?auto_14272 - BLOCK
    )
    :vars
    (
      ?auto_14273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14269 ?auto_14270 ) ) ( not ( = ?auto_14269 ?auto_14271 ) ) ( not ( = ?auto_14269 ?auto_14272 ) ) ( not ( = ?auto_14270 ?auto_14271 ) ) ( not ( = ?auto_14270 ?auto_14272 ) ) ( not ( = ?auto_14271 ?auto_14272 ) ) ( ON-TABLE ?auto_14272 ) ( ON ?auto_14269 ?auto_14273 ) ( not ( = ?auto_14269 ?auto_14273 ) ) ( not ( = ?auto_14270 ?auto_14273 ) ) ( not ( = ?auto_14271 ?auto_14273 ) ) ( not ( = ?auto_14272 ?auto_14273 ) ) ( ON ?auto_14270 ?auto_14269 ) ( ON-TABLE ?auto_14273 ) ( CLEAR ?auto_14272 ) ( ON ?auto_14271 ?auto_14270 ) ( CLEAR ?auto_14271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14273 ?auto_14269 ?auto_14270 )
      ( MAKE-4PILE ?auto_14269 ?auto_14270 ?auto_14271 ?auto_14272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14274 - BLOCK
      ?auto_14275 - BLOCK
      ?auto_14276 - BLOCK
      ?auto_14277 - BLOCK
    )
    :vars
    (
      ?auto_14278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14274 ?auto_14275 ) ) ( not ( = ?auto_14274 ?auto_14276 ) ) ( not ( = ?auto_14274 ?auto_14277 ) ) ( not ( = ?auto_14275 ?auto_14276 ) ) ( not ( = ?auto_14275 ?auto_14277 ) ) ( not ( = ?auto_14276 ?auto_14277 ) ) ( ON ?auto_14274 ?auto_14278 ) ( not ( = ?auto_14274 ?auto_14278 ) ) ( not ( = ?auto_14275 ?auto_14278 ) ) ( not ( = ?auto_14276 ?auto_14278 ) ) ( not ( = ?auto_14277 ?auto_14278 ) ) ( ON ?auto_14275 ?auto_14274 ) ( ON-TABLE ?auto_14278 ) ( ON ?auto_14276 ?auto_14275 ) ( CLEAR ?auto_14276 ) ( HOLDING ?auto_14277 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14277 )
      ( MAKE-4PILE ?auto_14274 ?auto_14275 ?auto_14276 ?auto_14277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14279 - BLOCK
      ?auto_14280 - BLOCK
      ?auto_14281 - BLOCK
      ?auto_14282 - BLOCK
    )
    :vars
    (
      ?auto_14283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14279 ?auto_14280 ) ) ( not ( = ?auto_14279 ?auto_14281 ) ) ( not ( = ?auto_14279 ?auto_14282 ) ) ( not ( = ?auto_14280 ?auto_14281 ) ) ( not ( = ?auto_14280 ?auto_14282 ) ) ( not ( = ?auto_14281 ?auto_14282 ) ) ( ON ?auto_14279 ?auto_14283 ) ( not ( = ?auto_14279 ?auto_14283 ) ) ( not ( = ?auto_14280 ?auto_14283 ) ) ( not ( = ?auto_14281 ?auto_14283 ) ) ( not ( = ?auto_14282 ?auto_14283 ) ) ( ON ?auto_14280 ?auto_14279 ) ( ON-TABLE ?auto_14283 ) ( ON ?auto_14281 ?auto_14280 ) ( ON ?auto_14282 ?auto_14281 ) ( CLEAR ?auto_14282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14283 ?auto_14279 ?auto_14280 ?auto_14281 )
      ( MAKE-4PILE ?auto_14279 ?auto_14280 ?auto_14281 ?auto_14282 ) )
  )

)

