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
      ?auto_317771 - BLOCK
    )
    :vars
    (
      ?auto_317772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317771 ?auto_317772 ) ( CLEAR ?auto_317771 ) ( HAND-EMPTY ) ( not ( = ?auto_317771 ?auto_317772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317771 ?auto_317772 )
      ( !PUTDOWN ?auto_317771 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_317774 - BLOCK
    )
    :vars
    (
      ?auto_317775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317774 ?auto_317775 ) ( CLEAR ?auto_317774 ) ( HAND-EMPTY ) ( not ( = ?auto_317774 ?auto_317775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317774 ?auto_317775 )
      ( !PUTDOWN ?auto_317774 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_317778 - BLOCK
      ?auto_317779 - BLOCK
    )
    :vars
    (
      ?auto_317780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_317778 ) ( ON ?auto_317779 ?auto_317780 ) ( CLEAR ?auto_317779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_317778 ) ( not ( = ?auto_317778 ?auto_317779 ) ) ( not ( = ?auto_317778 ?auto_317780 ) ) ( not ( = ?auto_317779 ?auto_317780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317779 ?auto_317780 )
      ( !STACK ?auto_317779 ?auto_317778 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_317783 - BLOCK
      ?auto_317784 - BLOCK
    )
    :vars
    (
      ?auto_317785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_317783 ) ( ON ?auto_317784 ?auto_317785 ) ( CLEAR ?auto_317784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_317783 ) ( not ( = ?auto_317783 ?auto_317784 ) ) ( not ( = ?auto_317783 ?auto_317785 ) ) ( not ( = ?auto_317784 ?auto_317785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317784 ?auto_317785 )
      ( !STACK ?auto_317784 ?auto_317783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_317788 - BLOCK
      ?auto_317789 - BLOCK
    )
    :vars
    (
      ?auto_317790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317789 ?auto_317790 ) ( not ( = ?auto_317788 ?auto_317789 ) ) ( not ( = ?auto_317788 ?auto_317790 ) ) ( not ( = ?auto_317789 ?auto_317790 ) ) ( ON ?auto_317788 ?auto_317789 ) ( CLEAR ?auto_317788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_317788 )
      ( MAKE-2PILE ?auto_317788 ?auto_317789 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_317793 - BLOCK
      ?auto_317794 - BLOCK
    )
    :vars
    (
      ?auto_317795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317794 ?auto_317795 ) ( not ( = ?auto_317793 ?auto_317794 ) ) ( not ( = ?auto_317793 ?auto_317795 ) ) ( not ( = ?auto_317794 ?auto_317795 ) ) ( ON ?auto_317793 ?auto_317794 ) ( CLEAR ?auto_317793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_317793 )
      ( MAKE-2PILE ?auto_317793 ?auto_317794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_317799 - BLOCK
      ?auto_317800 - BLOCK
      ?auto_317801 - BLOCK
    )
    :vars
    (
      ?auto_317802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_317800 ) ( ON ?auto_317801 ?auto_317802 ) ( CLEAR ?auto_317801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_317799 ) ( ON ?auto_317800 ?auto_317799 ) ( not ( = ?auto_317799 ?auto_317800 ) ) ( not ( = ?auto_317799 ?auto_317801 ) ) ( not ( = ?auto_317799 ?auto_317802 ) ) ( not ( = ?auto_317800 ?auto_317801 ) ) ( not ( = ?auto_317800 ?auto_317802 ) ) ( not ( = ?auto_317801 ?auto_317802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317801 ?auto_317802 )
      ( !STACK ?auto_317801 ?auto_317800 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_317806 - BLOCK
      ?auto_317807 - BLOCK
      ?auto_317808 - BLOCK
    )
    :vars
    (
      ?auto_317809 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_317807 ) ( ON ?auto_317808 ?auto_317809 ) ( CLEAR ?auto_317808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_317806 ) ( ON ?auto_317807 ?auto_317806 ) ( not ( = ?auto_317806 ?auto_317807 ) ) ( not ( = ?auto_317806 ?auto_317808 ) ) ( not ( = ?auto_317806 ?auto_317809 ) ) ( not ( = ?auto_317807 ?auto_317808 ) ) ( not ( = ?auto_317807 ?auto_317809 ) ) ( not ( = ?auto_317808 ?auto_317809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317808 ?auto_317809 )
      ( !STACK ?auto_317808 ?auto_317807 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_317813 - BLOCK
      ?auto_317814 - BLOCK
      ?auto_317815 - BLOCK
    )
    :vars
    (
      ?auto_317816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317815 ?auto_317816 ) ( ON-TABLE ?auto_317813 ) ( not ( = ?auto_317813 ?auto_317814 ) ) ( not ( = ?auto_317813 ?auto_317815 ) ) ( not ( = ?auto_317813 ?auto_317816 ) ) ( not ( = ?auto_317814 ?auto_317815 ) ) ( not ( = ?auto_317814 ?auto_317816 ) ) ( not ( = ?auto_317815 ?auto_317816 ) ) ( CLEAR ?auto_317813 ) ( ON ?auto_317814 ?auto_317815 ) ( CLEAR ?auto_317814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317813 ?auto_317814 )
      ( MAKE-3PILE ?auto_317813 ?auto_317814 ?auto_317815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_317820 - BLOCK
      ?auto_317821 - BLOCK
      ?auto_317822 - BLOCK
    )
    :vars
    (
      ?auto_317823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317822 ?auto_317823 ) ( ON-TABLE ?auto_317820 ) ( not ( = ?auto_317820 ?auto_317821 ) ) ( not ( = ?auto_317820 ?auto_317822 ) ) ( not ( = ?auto_317820 ?auto_317823 ) ) ( not ( = ?auto_317821 ?auto_317822 ) ) ( not ( = ?auto_317821 ?auto_317823 ) ) ( not ( = ?auto_317822 ?auto_317823 ) ) ( CLEAR ?auto_317820 ) ( ON ?auto_317821 ?auto_317822 ) ( CLEAR ?auto_317821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317820 ?auto_317821 )
      ( MAKE-3PILE ?auto_317820 ?auto_317821 ?auto_317822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_317827 - BLOCK
      ?auto_317828 - BLOCK
      ?auto_317829 - BLOCK
    )
    :vars
    (
      ?auto_317830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317829 ?auto_317830 ) ( not ( = ?auto_317827 ?auto_317828 ) ) ( not ( = ?auto_317827 ?auto_317829 ) ) ( not ( = ?auto_317827 ?auto_317830 ) ) ( not ( = ?auto_317828 ?auto_317829 ) ) ( not ( = ?auto_317828 ?auto_317830 ) ) ( not ( = ?auto_317829 ?auto_317830 ) ) ( ON ?auto_317828 ?auto_317829 ) ( ON ?auto_317827 ?auto_317828 ) ( CLEAR ?auto_317827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_317827 )
      ( MAKE-3PILE ?auto_317827 ?auto_317828 ?auto_317829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_317834 - BLOCK
      ?auto_317835 - BLOCK
      ?auto_317836 - BLOCK
    )
    :vars
    (
      ?auto_317837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317836 ?auto_317837 ) ( not ( = ?auto_317834 ?auto_317835 ) ) ( not ( = ?auto_317834 ?auto_317836 ) ) ( not ( = ?auto_317834 ?auto_317837 ) ) ( not ( = ?auto_317835 ?auto_317836 ) ) ( not ( = ?auto_317835 ?auto_317837 ) ) ( not ( = ?auto_317836 ?auto_317837 ) ) ( ON ?auto_317835 ?auto_317836 ) ( ON ?auto_317834 ?auto_317835 ) ( CLEAR ?auto_317834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_317834 )
      ( MAKE-3PILE ?auto_317834 ?auto_317835 ?auto_317836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_317842 - BLOCK
      ?auto_317843 - BLOCK
      ?auto_317844 - BLOCK
      ?auto_317845 - BLOCK
    )
    :vars
    (
      ?auto_317846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_317844 ) ( ON ?auto_317845 ?auto_317846 ) ( CLEAR ?auto_317845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_317842 ) ( ON ?auto_317843 ?auto_317842 ) ( ON ?auto_317844 ?auto_317843 ) ( not ( = ?auto_317842 ?auto_317843 ) ) ( not ( = ?auto_317842 ?auto_317844 ) ) ( not ( = ?auto_317842 ?auto_317845 ) ) ( not ( = ?auto_317842 ?auto_317846 ) ) ( not ( = ?auto_317843 ?auto_317844 ) ) ( not ( = ?auto_317843 ?auto_317845 ) ) ( not ( = ?auto_317843 ?auto_317846 ) ) ( not ( = ?auto_317844 ?auto_317845 ) ) ( not ( = ?auto_317844 ?auto_317846 ) ) ( not ( = ?auto_317845 ?auto_317846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317845 ?auto_317846 )
      ( !STACK ?auto_317845 ?auto_317844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_317851 - BLOCK
      ?auto_317852 - BLOCK
      ?auto_317853 - BLOCK
      ?auto_317854 - BLOCK
    )
    :vars
    (
      ?auto_317855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_317853 ) ( ON ?auto_317854 ?auto_317855 ) ( CLEAR ?auto_317854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_317851 ) ( ON ?auto_317852 ?auto_317851 ) ( ON ?auto_317853 ?auto_317852 ) ( not ( = ?auto_317851 ?auto_317852 ) ) ( not ( = ?auto_317851 ?auto_317853 ) ) ( not ( = ?auto_317851 ?auto_317854 ) ) ( not ( = ?auto_317851 ?auto_317855 ) ) ( not ( = ?auto_317852 ?auto_317853 ) ) ( not ( = ?auto_317852 ?auto_317854 ) ) ( not ( = ?auto_317852 ?auto_317855 ) ) ( not ( = ?auto_317853 ?auto_317854 ) ) ( not ( = ?auto_317853 ?auto_317855 ) ) ( not ( = ?auto_317854 ?auto_317855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317854 ?auto_317855 )
      ( !STACK ?auto_317854 ?auto_317853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_317860 - BLOCK
      ?auto_317861 - BLOCK
      ?auto_317862 - BLOCK
      ?auto_317863 - BLOCK
    )
    :vars
    (
      ?auto_317864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317863 ?auto_317864 ) ( ON-TABLE ?auto_317860 ) ( ON ?auto_317861 ?auto_317860 ) ( not ( = ?auto_317860 ?auto_317861 ) ) ( not ( = ?auto_317860 ?auto_317862 ) ) ( not ( = ?auto_317860 ?auto_317863 ) ) ( not ( = ?auto_317860 ?auto_317864 ) ) ( not ( = ?auto_317861 ?auto_317862 ) ) ( not ( = ?auto_317861 ?auto_317863 ) ) ( not ( = ?auto_317861 ?auto_317864 ) ) ( not ( = ?auto_317862 ?auto_317863 ) ) ( not ( = ?auto_317862 ?auto_317864 ) ) ( not ( = ?auto_317863 ?auto_317864 ) ) ( CLEAR ?auto_317861 ) ( ON ?auto_317862 ?auto_317863 ) ( CLEAR ?auto_317862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_317860 ?auto_317861 ?auto_317862 )
      ( MAKE-4PILE ?auto_317860 ?auto_317861 ?auto_317862 ?auto_317863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_317869 - BLOCK
      ?auto_317870 - BLOCK
      ?auto_317871 - BLOCK
      ?auto_317872 - BLOCK
    )
    :vars
    (
      ?auto_317873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317872 ?auto_317873 ) ( ON-TABLE ?auto_317869 ) ( ON ?auto_317870 ?auto_317869 ) ( not ( = ?auto_317869 ?auto_317870 ) ) ( not ( = ?auto_317869 ?auto_317871 ) ) ( not ( = ?auto_317869 ?auto_317872 ) ) ( not ( = ?auto_317869 ?auto_317873 ) ) ( not ( = ?auto_317870 ?auto_317871 ) ) ( not ( = ?auto_317870 ?auto_317872 ) ) ( not ( = ?auto_317870 ?auto_317873 ) ) ( not ( = ?auto_317871 ?auto_317872 ) ) ( not ( = ?auto_317871 ?auto_317873 ) ) ( not ( = ?auto_317872 ?auto_317873 ) ) ( CLEAR ?auto_317870 ) ( ON ?auto_317871 ?auto_317872 ) ( CLEAR ?auto_317871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_317869 ?auto_317870 ?auto_317871 )
      ( MAKE-4PILE ?auto_317869 ?auto_317870 ?auto_317871 ?auto_317872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_317878 - BLOCK
      ?auto_317879 - BLOCK
      ?auto_317880 - BLOCK
      ?auto_317881 - BLOCK
    )
    :vars
    (
      ?auto_317882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317881 ?auto_317882 ) ( ON-TABLE ?auto_317878 ) ( not ( = ?auto_317878 ?auto_317879 ) ) ( not ( = ?auto_317878 ?auto_317880 ) ) ( not ( = ?auto_317878 ?auto_317881 ) ) ( not ( = ?auto_317878 ?auto_317882 ) ) ( not ( = ?auto_317879 ?auto_317880 ) ) ( not ( = ?auto_317879 ?auto_317881 ) ) ( not ( = ?auto_317879 ?auto_317882 ) ) ( not ( = ?auto_317880 ?auto_317881 ) ) ( not ( = ?auto_317880 ?auto_317882 ) ) ( not ( = ?auto_317881 ?auto_317882 ) ) ( ON ?auto_317880 ?auto_317881 ) ( CLEAR ?auto_317878 ) ( ON ?auto_317879 ?auto_317880 ) ( CLEAR ?auto_317879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317878 ?auto_317879 )
      ( MAKE-4PILE ?auto_317878 ?auto_317879 ?auto_317880 ?auto_317881 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_317887 - BLOCK
      ?auto_317888 - BLOCK
      ?auto_317889 - BLOCK
      ?auto_317890 - BLOCK
    )
    :vars
    (
      ?auto_317891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317890 ?auto_317891 ) ( ON-TABLE ?auto_317887 ) ( not ( = ?auto_317887 ?auto_317888 ) ) ( not ( = ?auto_317887 ?auto_317889 ) ) ( not ( = ?auto_317887 ?auto_317890 ) ) ( not ( = ?auto_317887 ?auto_317891 ) ) ( not ( = ?auto_317888 ?auto_317889 ) ) ( not ( = ?auto_317888 ?auto_317890 ) ) ( not ( = ?auto_317888 ?auto_317891 ) ) ( not ( = ?auto_317889 ?auto_317890 ) ) ( not ( = ?auto_317889 ?auto_317891 ) ) ( not ( = ?auto_317890 ?auto_317891 ) ) ( ON ?auto_317889 ?auto_317890 ) ( CLEAR ?auto_317887 ) ( ON ?auto_317888 ?auto_317889 ) ( CLEAR ?auto_317888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317887 ?auto_317888 )
      ( MAKE-4PILE ?auto_317887 ?auto_317888 ?auto_317889 ?auto_317890 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_317896 - BLOCK
      ?auto_317897 - BLOCK
      ?auto_317898 - BLOCK
      ?auto_317899 - BLOCK
    )
    :vars
    (
      ?auto_317900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317899 ?auto_317900 ) ( not ( = ?auto_317896 ?auto_317897 ) ) ( not ( = ?auto_317896 ?auto_317898 ) ) ( not ( = ?auto_317896 ?auto_317899 ) ) ( not ( = ?auto_317896 ?auto_317900 ) ) ( not ( = ?auto_317897 ?auto_317898 ) ) ( not ( = ?auto_317897 ?auto_317899 ) ) ( not ( = ?auto_317897 ?auto_317900 ) ) ( not ( = ?auto_317898 ?auto_317899 ) ) ( not ( = ?auto_317898 ?auto_317900 ) ) ( not ( = ?auto_317899 ?auto_317900 ) ) ( ON ?auto_317898 ?auto_317899 ) ( ON ?auto_317897 ?auto_317898 ) ( ON ?auto_317896 ?auto_317897 ) ( CLEAR ?auto_317896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_317896 )
      ( MAKE-4PILE ?auto_317896 ?auto_317897 ?auto_317898 ?auto_317899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_317905 - BLOCK
      ?auto_317906 - BLOCK
      ?auto_317907 - BLOCK
      ?auto_317908 - BLOCK
    )
    :vars
    (
      ?auto_317909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317908 ?auto_317909 ) ( not ( = ?auto_317905 ?auto_317906 ) ) ( not ( = ?auto_317905 ?auto_317907 ) ) ( not ( = ?auto_317905 ?auto_317908 ) ) ( not ( = ?auto_317905 ?auto_317909 ) ) ( not ( = ?auto_317906 ?auto_317907 ) ) ( not ( = ?auto_317906 ?auto_317908 ) ) ( not ( = ?auto_317906 ?auto_317909 ) ) ( not ( = ?auto_317907 ?auto_317908 ) ) ( not ( = ?auto_317907 ?auto_317909 ) ) ( not ( = ?auto_317908 ?auto_317909 ) ) ( ON ?auto_317907 ?auto_317908 ) ( ON ?auto_317906 ?auto_317907 ) ( ON ?auto_317905 ?auto_317906 ) ( CLEAR ?auto_317905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_317905 )
      ( MAKE-4PILE ?auto_317905 ?auto_317906 ?auto_317907 ?auto_317908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_317915 - BLOCK
      ?auto_317916 - BLOCK
      ?auto_317917 - BLOCK
      ?auto_317918 - BLOCK
      ?auto_317919 - BLOCK
    )
    :vars
    (
      ?auto_317920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_317918 ) ( ON ?auto_317919 ?auto_317920 ) ( CLEAR ?auto_317919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_317915 ) ( ON ?auto_317916 ?auto_317915 ) ( ON ?auto_317917 ?auto_317916 ) ( ON ?auto_317918 ?auto_317917 ) ( not ( = ?auto_317915 ?auto_317916 ) ) ( not ( = ?auto_317915 ?auto_317917 ) ) ( not ( = ?auto_317915 ?auto_317918 ) ) ( not ( = ?auto_317915 ?auto_317919 ) ) ( not ( = ?auto_317915 ?auto_317920 ) ) ( not ( = ?auto_317916 ?auto_317917 ) ) ( not ( = ?auto_317916 ?auto_317918 ) ) ( not ( = ?auto_317916 ?auto_317919 ) ) ( not ( = ?auto_317916 ?auto_317920 ) ) ( not ( = ?auto_317917 ?auto_317918 ) ) ( not ( = ?auto_317917 ?auto_317919 ) ) ( not ( = ?auto_317917 ?auto_317920 ) ) ( not ( = ?auto_317918 ?auto_317919 ) ) ( not ( = ?auto_317918 ?auto_317920 ) ) ( not ( = ?auto_317919 ?auto_317920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317919 ?auto_317920 )
      ( !STACK ?auto_317919 ?auto_317918 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_317926 - BLOCK
      ?auto_317927 - BLOCK
      ?auto_317928 - BLOCK
      ?auto_317929 - BLOCK
      ?auto_317930 - BLOCK
    )
    :vars
    (
      ?auto_317931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_317929 ) ( ON ?auto_317930 ?auto_317931 ) ( CLEAR ?auto_317930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_317926 ) ( ON ?auto_317927 ?auto_317926 ) ( ON ?auto_317928 ?auto_317927 ) ( ON ?auto_317929 ?auto_317928 ) ( not ( = ?auto_317926 ?auto_317927 ) ) ( not ( = ?auto_317926 ?auto_317928 ) ) ( not ( = ?auto_317926 ?auto_317929 ) ) ( not ( = ?auto_317926 ?auto_317930 ) ) ( not ( = ?auto_317926 ?auto_317931 ) ) ( not ( = ?auto_317927 ?auto_317928 ) ) ( not ( = ?auto_317927 ?auto_317929 ) ) ( not ( = ?auto_317927 ?auto_317930 ) ) ( not ( = ?auto_317927 ?auto_317931 ) ) ( not ( = ?auto_317928 ?auto_317929 ) ) ( not ( = ?auto_317928 ?auto_317930 ) ) ( not ( = ?auto_317928 ?auto_317931 ) ) ( not ( = ?auto_317929 ?auto_317930 ) ) ( not ( = ?auto_317929 ?auto_317931 ) ) ( not ( = ?auto_317930 ?auto_317931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_317930 ?auto_317931 )
      ( !STACK ?auto_317930 ?auto_317929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_317937 - BLOCK
      ?auto_317938 - BLOCK
      ?auto_317939 - BLOCK
      ?auto_317940 - BLOCK
      ?auto_317941 - BLOCK
    )
    :vars
    (
      ?auto_317942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317941 ?auto_317942 ) ( ON-TABLE ?auto_317937 ) ( ON ?auto_317938 ?auto_317937 ) ( ON ?auto_317939 ?auto_317938 ) ( not ( = ?auto_317937 ?auto_317938 ) ) ( not ( = ?auto_317937 ?auto_317939 ) ) ( not ( = ?auto_317937 ?auto_317940 ) ) ( not ( = ?auto_317937 ?auto_317941 ) ) ( not ( = ?auto_317937 ?auto_317942 ) ) ( not ( = ?auto_317938 ?auto_317939 ) ) ( not ( = ?auto_317938 ?auto_317940 ) ) ( not ( = ?auto_317938 ?auto_317941 ) ) ( not ( = ?auto_317938 ?auto_317942 ) ) ( not ( = ?auto_317939 ?auto_317940 ) ) ( not ( = ?auto_317939 ?auto_317941 ) ) ( not ( = ?auto_317939 ?auto_317942 ) ) ( not ( = ?auto_317940 ?auto_317941 ) ) ( not ( = ?auto_317940 ?auto_317942 ) ) ( not ( = ?auto_317941 ?auto_317942 ) ) ( CLEAR ?auto_317939 ) ( ON ?auto_317940 ?auto_317941 ) ( CLEAR ?auto_317940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_317937 ?auto_317938 ?auto_317939 ?auto_317940 )
      ( MAKE-5PILE ?auto_317937 ?auto_317938 ?auto_317939 ?auto_317940 ?auto_317941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_317948 - BLOCK
      ?auto_317949 - BLOCK
      ?auto_317950 - BLOCK
      ?auto_317951 - BLOCK
      ?auto_317952 - BLOCK
    )
    :vars
    (
      ?auto_317953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317952 ?auto_317953 ) ( ON-TABLE ?auto_317948 ) ( ON ?auto_317949 ?auto_317948 ) ( ON ?auto_317950 ?auto_317949 ) ( not ( = ?auto_317948 ?auto_317949 ) ) ( not ( = ?auto_317948 ?auto_317950 ) ) ( not ( = ?auto_317948 ?auto_317951 ) ) ( not ( = ?auto_317948 ?auto_317952 ) ) ( not ( = ?auto_317948 ?auto_317953 ) ) ( not ( = ?auto_317949 ?auto_317950 ) ) ( not ( = ?auto_317949 ?auto_317951 ) ) ( not ( = ?auto_317949 ?auto_317952 ) ) ( not ( = ?auto_317949 ?auto_317953 ) ) ( not ( = ?auto_317950 ?auto_317951 ) ) ( not ( = ?auto_317950 ?auto_317952 ) ) ( not ( = ?auto_317950 ?auto_317953 ) ) ( not ( = ?auto_317951 ?auto_317952 ) ) ( not ( = ?auto_317951 ?auto_317953 ) ) ( not ( = ?auto_317952 ?auto_317953 ) ) ( CLEAR ?auto_317950 ) ( ON ?auto_317951 ?auto_317952 ) ( CLEAR ?auto_317951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_317948 ?auto_317949 ?auto_317950 ?auto_317951 )
      ( MAKE-5PILE ?auto_317948 ?auto_317949 ?auto_317950 ?auto_317951 ?auto_317952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_317959 - BLOCK
      ?auto_317960 - BLOCK
      ?auto_317961 - BLOCK
      ?auto_317962 - BLOCK
      ?auto_317963 - BLOCK
    )
    :vars
    (
      ?auto_317964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317963 ?auto_317964 ) ( ON-TABLE ?auto_317959 ) ( ON ?auto_317960 ?auto_317959 ) ( not ( = ?auto_317959 ?auto_317960 ) ) ( not ( = ?auto_317959 ?auto_317961 ) ) ( not ( = ?auto_317959 ?auto_317962 ) ) ( not ( = ?auto_317959 ?auto_317963 ) ) ( not ( = ?auto_317959 ?auto_317964 ) ) ( not ( = ?auto_317960 ?auto_317961 ) ) ( not ( = ?auto_317960 ?auto_317962 ) ) ( not ( = ?auto_317960 ?auto_317963 ) ) ( not ( = ?auto_317960 ?auto_317964 ) ) ( not ( = ?auto_317961 ?auto_317962 ) ) ( not ( = ?auto_317961 ?auto_317963 ) ) ( not ( = ?auto_317961 ?auto_317964 ) ) ( not ( = ?auto_317962 ?auto_317963 ) ) ( not ( = ?auto_317962 ?auto_317964 ) ) ( not ( = ?auto_317963 ?auto_317964 ) ) ( ON ?auto_317962 ?auto_317963 ) ( CLEAR ?auto_317960 ) ( ON ?auto_317961 ?auto_317962 ) ( CLEAR ?auto_317961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_317959 ?auto_317960 ?auto_317961 )
      ( MAKE-5PILE ?auto_317959 ?auto_317960 ?auto_317961 ?auto_317962 ?auto_317963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_317970 - BLOCK
      ?auto_317971 - BLOCK
      ?auto_317972 - BLOCK
      ?auto_317973 - BLOCK
      ?auto_317974 - BLOCK
    )
    :vars
    (
      ?auto_317975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317974 ?auto_317975 ) ( ON-TABLE ?auto_317970 ) ( ON ?auto_317971 ?auto_317970 ) ( not ( = ?auto_317970 ?auto_317971 ) ) ( not ( = ?auto_317970 ?auto_317972 ) ) ( not ( = ?auto_317970 ?auto_317973 ) ) ( not ( = ?auto_317970 ?auto_317974 ) ) ( not ( = ?auto_317970 ?auto_317975 ) ) ( not ( = ?auto_317971 ?auto_317972 ) ) ( not ( = ?auto_317971 ?auto_317973 ) ) ( not ( = ?auto_317971 ?auto_317974 ) ) ( not ( = ?auto_317971 ?auto_317975 ) ) ( not ( = ?auto_317972 ?auto_317973 ) ) ( not ( = ?auto_317972 ?auto_317974 ) ) ( not ( = ?auto_317972 ?auto_317975 ) ) ( not ( = ?auto_317973 ?auto_317974 ) ) ( not ( = ?auto_317973 ?auto_317975 ) ) ( not ( = ?auto_317974 ?auto_317975 ) ) ( ON ?auto_317973 ?auto_317974 ) ( CLEAR ?auto_317971 ) ( ON ?auto_317972 ?auto_317973 ) ( CLEAR ?auto_317972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_317970 ?auto_317971 ?auto_317972 )
      ( MAKE-5PILE ?auto_317970 ?auto_317971 ?auto_317972 ?auto_317973 ?auto_317974 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_317981 - BLOCK
      ?auto_317982 - BLOCK
      ?auto_317983 - BLOCK
      ?auto_317984 - BLOCK
      ?auto_317985 - BLOCK
    )
    :vars
    (
      ?auto_317986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317985 ?auto_317986 ) ( ON-TABLE ?auto_317981 ) ( not ( = ?auto_317981 ?auto_317982 ) ) ( not ( = ?auto_317981 ?auto_317983 ) ) ( not ( = ?auto_317981 ?auto_317984 ) ) ( not ( = ?auto_317981 ?auto_317985 ) ) ( not ( = ?auto_317981 ?auto_317986 ) ) ( not ( = ?auto_317982 ?auto_317983 ) ) ( not ( = ?auto_317982 ?auto_317984 ) ) ( not ( = ?auto_317982 ?auto_317985 ) ) ( not ( = ?auto_317982 ?auto_317986 ) ) ( not ( = ?auto_317983 ?auto_317984 ) ) ( not ( = ?auto_317983 ?auto_317985 ) ) ( not ( = ?auto_317983 ?auto_317986 ) ) ( not ( = ?auto_317984 ?auto_317985 ) ) ( not ( = ?auto_317984 ?auto_317986 ) ) ( not ( = ?auto_317985 ?auto_317986 ) ) ( ON ?auto_317984 ?auto_317985 ) ( ON ?auto_317983 ?auto_317984 ) ( CLEAR ?auto_317981 ) ( ON ?auto_317982 ?auto_317983 ) ( CLEAR ?auto_317982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317981 ?auto_317982 )
      ( MAKE-5PILE ?auto_317981 ?auto_317982 ?auto_317983 ?auto_317984 ?auto_317985 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_317992 - BLOCK
      ?auto_317993 - BLOCK
      ?auto_317994 - BLOCK
      ?auto_317995 - BLOCK
      ?auto_317996 - BLOCK
    )
    :vars
    (
      ?auto_317997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_317996 ?auto_317997 ) ( ON-TABLE ?auto_317992 ) ( not ( = ?auto_317992 ?auto_317993 ) ) ( not ( = ?auto_317992 ?auto_317994 ) ) ( not ( = ?auto_317992 ?auto_317995 ) ) ( not ( = ?auto_317992 ?auto_317996 ) ) ( not ( = ?auto_317992 ?auto_317997 ) ) ( not ( = ?auto_317993 ?auto_317994 ) ) ( not ( = ?auto_317993 ?auto_317995 ) ) ( not ( = ?auto_317993 ?auto_317996 ) ) ( not ( = ?auto_317993 ?auto_317997 ) ) ( not ( = ?auto_317994 ?auto_317995 ) ) ( not ( = ?auto_317994 ?auto_317996 ) ) ( not ( = ?auto_317994 ?auto_317997 ) ) ( not ( = ?auto_317995 ?auto_317996 ) ) ( not ( = ?auto_317995 ?auto_317997 ) ) ( not ( = ?auto_317996 ?auto_317997 ) ) ( ON ?auto_317995 ?auto_317996 ) ( ON ?auto_317994 ?auto_317995 ) ( CLEAR ?auto_317992 ) ( ON ?auto_317993 ?auto_317994 ) ( CLEAR ?auto_317993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_317992 ?auto_317993 )
      ( MAKE-5PILE ?auto_317992 ?auto_317993 ?auto_317994 ?auto_317995 ?auto_317996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_318003 - BLOCK
      ?auto_318004 - BLOCK
      ?auto_318005 - BLOCK
      ?auto_318006 - BLOCK
      ?auto_318007 - BLOCK
    )
    :vars
    (
      ?auto_318008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318007 ?auto_318008 ) ( not ( = ?auto_318003 ?auto_318004 ) ) ( not ( = ?auto_318003 ?auto_318005 ) ) ( not ( = ?auto_318003 ?auto_318006 ) ) ( not ( = ?auto_318003 ?auto_318007 ) ) ( not ( = ?auto_318003 ?auto_318008 ) ) ( not ( = ?auto_318004 ?auto_318005 ) ) ( not ( = ?auto_318004 ?auto_318006 ) ) ( not ( = ?auto_318004 ?auto_318007 ) ) ( not ( = ?auto_318004 ?auto_318008 ) ) ( not ( = ?auto_318005 ?auto_318006 ) ) ( not ( = ?auto_318005 ?auto_318007 ) ) ( not ( = ?auto_318005 ?auto_318008 ) ) ( not ( = ?auto_318006 ?auto_318007 ) ) ( not ( = ?auto_318006 ?auto_318008 ) ) ( not ( = ?auto_318007 ?auto_318008 ) ) ( ON ?auto_318006 ?auto_318007 ) ( ON ?auto_318005 ?auto_318006 ) ( ON ?auto_318004 ?auto_318005 ) ( ON ?auto_318003 ?auto_318004 ) ( CLEAR ?auto_318003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318003 )
      ( MAKE-5PILE ?auto_318003 ?auto_318004 ?auto_318005 ?auto_318006 ?auto_318007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_318014 - BLOCK
      ?auto_318015 - BLOCK
      ?auto_318016 - BLOCK
      ?auto_318017 - BLOCK
      ?auto_318018 - BLOCK
    )
    :vars
    (
      ?auto_318019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318018 ?auto_318019 ) ( not ( = ?auto_318014 ?auto_318015 ) ) ( not ( = ?auto_318014 ?auto_318016 ) ) ( not ( = ?auto_318014 ?auto_318017 ) ) ( not ( = ?auto_318014 ?auto_318018 ) ) ( not ( = ?auto_318014 ?auto_318019 ) ) ( not ( = ?auto_318015 ?auto_318016 ) ) ( not ( = ?auto_318015 ?auto_318017 ) ) ( not ( = ?auto_318015 ?auto_318018 ) ) ( not ( = ?auto_318015 ?auto_318019 ) ) ( not ( = ?auto_318016 ?auto_318017 ) ) ( not ( = ?auto_318016 ?auto_318018 ) ) ( not ( = ?auto_318016 ?auto_318019 ) ) ( not ( = ?auto_318017 ?auto_318018 ) ) ( not ( = ?auto_318017 ?auto_318019 ) ) ( not ( = ?auto_318018 ?auto_318019 ) ) ( ON ?auto_318017 ?auto_318018 ) ( ON ?auto_318016 ?auto_318017 ) ( ON ?auto_318015 ?auto_318016 ) ( ON ?auto_318014 ?auto_318015 ) ( CLEAR ?auto_318014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318014 )
      ( MAKE-5PILE ?auto_318014 ?auto_318015 ?auto_318016 ?auto_318017 ?auto_318018 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318026 - BLOCK
      ?auto_318027 - BLOCK
      ?auto_318028 - BLOCK
      ?auto_318029 - BLOCK
      ?auto_318030 - BLOCK
      ?auto_318031 - BLOCK
    )
    :vars
    (
      ?auto_318032 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318030 ) ( ON ?auto_318031 ?auto_318032 ) ( CLEAR ?auto_318031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_318026 ) ( ON ?auto_318027 ?auto_318026 ) ( ON ?auto_318028 ?auto_318027 ) ( ON ?auto_318029 ?auto_318028 ) ( ON ?auto_318030 ?auto_318029 ) ( not ( = ?auto_318026 ?auto_318027 ) ) ( not ( = ?auto_318026 ?auto_318028 ) ) ( not ( = ?auto_318026 ?auto_318029 ) ) ( not ( = ?auto_318026 ?auto_318030 ) ) ( not ( = ?auto_318026 ?auto_318031 ) ) ( not ( = ?auto_318026 ?auto_318032 ) ) ( not ( = ?auto_318027 ?auto_318028 ) ) ( not ( = ?auto_318027 ?auto_318029 ) ) ( not ( = ?auto_318027 ?auto_318030 ) ) ( not ( = ?auto_318027 ?auto_318031 ) ) ( not ( = ?auto_318027 ?auto_318032 ) ) ( not ( = ?auto_318028 ?auto_318029 ) ) ( not ( = ?auto_318028 ?auto_318030 ) ) ( not ( = ?auto_318028 ?auto_318031 ) ) ( not ( = ?auto_318028 ?auto_318032 ) ) ( not ( = ?auto_318029 ?auto_318030 ) ) ( not ( = ?auto_318029 ?auto_318031 ) ) ( not ( = ?auto_318029 ?auto_318032 ) ) ( not ( = ?auto_318030 ?auto_318031 ) ) ( not ( = ?auto_318030 ?auto_318032 ) ) ( not ( = ?auto_318031 ?auto_318032 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_318031 ?auto_318032 )
      ( !STACK ?auto_318031 ?auto_318030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318039 - BLOCK
      ?auto_318040 - BLOCK
      ?auto_318041 - BLOCK
      ?auto_318042 - BLOCK
      ?auto_318043 - BLOCK
      ?auto_318044 - BLOCK
    )
    :vars
    (
      ?auto_318045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318043 ) ( ON ?auto_318044 ?auto_318045 ) ( CLEAR ?auto_318044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_318039 ) ( ON ?auto_318040 ?auto_318039 ) ( ON ?auto_318041 ?auto_318040 ) ( ON ?auto_318042 ?auto_318041 ) ( ON ?auto_318043 ?auto_318042 ) ( not ( = ?auto_318039 ?auto_318040 ) ) ( not ( = ?auto_318039 ?auto_318041 ) ) ( not ( = ?auto_318039 ?auto_318042 ) ) ( not ( = ?auto_318039 ?auto_318043 ) ) ( not ( = ?auto_318039 ?auto_318044 ) ) ( not ( = ?auto_318039 ?auto_318045 ) ) ( not ( = ?auto_318040 ?auto_318041 ) ) ( not ( = ?auto_318040 ?auto_318042 ) ) ( not ( = ?auto_318040 ?auto_318043 ) ) ( not ( = ?auto_318040 ?auto_318044 ) ) ( not ( = ?auto_318040 ?auto_318045 ) ) ( not ( = ?auto_318041 ?auto_318042 ) ) ( not ( = ?auto_318041 ?auto_318043 ) ) ( not ( = ?auto_318041 ?auto_318044 ) ) ( not ( = ?auto_318041 ?auto_318045 ) ) ( not ( = ?auto_318042 ?auto_318043 ) ) ( not ( = ?auto_318042 ?auto_318044 ) ) ( not ( = ?auto_318042 ?auto_318045 ) ) ( not ( = ?auto_318043 ?auto_318044 ) ) ( not ( = ?auto_318043 ?auto_318045 ) ) ( not ( = ?auto_318044 ?auto_318045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_318044 ?auto_318045 )
      ( !STACK ?auto_318044 ?auto_318043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318052 - BLOCK
      ?auto_318053 - BLOCK
      ?auto_318054 - BLOCK
      ?auto_318055 - BLOCK
      ?auto_318056 - BLOCK
      ?auto_318057 - BLOCK
    )
    :vars
    (
      ?auto_318058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318057 ?auto_318058 ) ( ON-TABLE ?auto_318052 ) ( ON ?auto_318053 ?auto_318052 ) ( ON ?auto_318054 ?auto_318053 ) ( ON ?auto_318055 ?auto_318054 ) ( not ( = ?auto_318052 ?auto_318053 ) ) ( not ( = ?auto_318052 ?auto_318054 ) ) ( not ( = ?auto_318052 ?auto_318055 ) ) ( not ( = ?auto_318052 ?auto_318056 ) ) ( not ( = ?auto_318052 ?auto_318057 ) ) ( not ( = ?auto_318052 ?auto_318058 ) ) ( not ( = ?auto_318053 ?auto_318054 ) ) ( not ( = ?auto_318053 ?auto_318055 ) ) ( not ( = ?auto_318053 ?auto_318056 ) ) ( not ( = ?auto_318053 ?auto_318057 ) ) ( not ( = ?auto_318053 ?auto_318058 ) ) ( not ( = ?auto_318054 ?auto_318055 ) ) ( not ( = ?auto_318054 ?auto_318056 ) ) ( not ( = ?auto_318054 ?auto_318057 ) ) ( not ( = ?auto_318054 ?auto_318058 ) ) ( not ( = ?auto_318055 ?auto_318056 ) ) ( not ( = ?auto_318055 ?auto_318057 ) ) ( not ( = ?auto_318055 ?auto_318058 ) ) ( not ( = ?auto_318056 ?auto_318057 ) ) ( not ( = ?auto_318056 ?auto_318058 ) ) ( not ( = ?auto_318057 ?auto_318058 ) ) ( CLEAR ?auto_318055 ) ( ON ?auto_318056 ?auto_318057 ) ( CLEAR ?auto_318056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_318052 ?auto_318053 ?auto_318054 ?auto_318055 ?auto_318056 )
      ( MAKE-6PILE ?auto_318052 ?auto_318053 ?auto_318054 ?auto_318055 ?auto_318056 ?auto_318057 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318065 - BLOCK
      ?auto_318066 - BLOCK
      ?auto_318067 - BLOCK
      ?auto_318068 - BLOCK
      ?auto_318069 - BLOCK
      ?auto_318070 - BLOCK
    )
    :vars
    (
      ?auto_318071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318070 ?auto_318071 ) ( ON-TABLE ?auto_318065 ) ( ON ?auto_318066 ?auto_318065 ) ( ON ?auto_318067 ?auto_318066 ) ( ON ?auto_318068 ?auto_318067 ) ( not ( = ?auto_318065 ?auto_318066 ) ) ( not ( = ?auto_318065 ?auto_318067 ) ) ( not ( = ?auto_318065 ?auto_318068 ) ) ( not ( = ?auto_318065 ?auto_318069 ) ) ( not ( = ?auto_318065 ?auto_318070 ) ) ( not ( = ?auto_318065 ?auto_318071 ) ) ( not ( = ?auto_318066 ?auto_318067 ) ) ( not ( = ?auto_318066 ?auto_318068 ) ) ( not ( = ?auto_318066 ?auto_318069 ) ) ( not ( = ?auto_318066 ?auto_318070 ) ) ( not ( = ?auto_318066 ?auto_318071 ) ) ( not ( = ?auto_318067 ?auto_318068 ) ) ( not ( = ?auto_318067 ?auto_318069 ) ) ( not ( = ?auto_318067 ?auto_318070 ) ) ( not ( = ?auto_318067 ?auto_318071 ) ) ( not ( = ?auto_318068 ?auto_318069 ) ) ( not ( = ?auto_318068 ?auto_318070 ) ) ( not ( = ?auto_318068 ?auto_318071 ) ) ( not ( = ?auto_318069 ?auto_318070 ) ) ( not ( = ?auto_318069 ?auto_318071 ) ) ( not ( = ?auto_318070 ?auto_318071 ) ) ( CLEAR ?auto_318068 ) ( ON ?auto_318069 ?auto_318070 ) ( CLEAR ?auto_318069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_318065 ?auto_318066 ?auto_318067 ?auto_318068 ?auto_318069 )
      ( MAKE-6PILE ?auto_318065 ?auto_318066 ?auto_318067 ?auto_318068 ?auto_318069 ?auto_318070 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318078 - BLOCK
      ?auto_318079 - BLOCK
      ?auto_318080 - BLOCK
      ?auto_318081 - BLOCK
      ?auto_318082 - BLOCK
      ?auto_318083 - BLOCK
    )
    :vars
    (
      ?auto_318084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318083 ?auto_318084 ) ( ON-TABLE ?auto_318078 ) ( ON ?auto_318079 ?auto_318078 ) ( ON ?auto_318080 ?auto_318079 ) ( not ( = ?auto_318078 ?auto_318079 ) ) ( not ( = ?auto_318078 ?auto_318080 ) ) ( not ( = ?auto_318078 ?auto_318081 ) ) ( not ( = ?auto_318078 ?auto_318082 ) ) ( not ( = ?auto_318078 ?auto_318083 ) ) ( not ( = ?auto_318078 ?auto_318084 ) ) ( not ( = ?auto_318079 ?auto_318080 ) ) ( not ( = ?auto_318079 ?auto_318081 ) ) ( not ( = ?auto_318079 ?auto_318082 ) ) ( not ( = ?auto_318079 ?auto_318083 ) ) ( not ( = ?auto_318079 ?auto_318084 ) ) ( not ( = ?auto_318080 ?auto_318081 ) ) ( not ( = ?auto_318080 ?auto_318082 ) ) ( not ( = ?auto_318080 ?auto_318083 ) ) ( not ( = ?auto_318080 ?auto_318084 ) ) ( not ( = ?auto_318081 ?auto_318082 ) ) ( not ( = ?auto_318081 ?auto_318083 ) ) ( not ( = ?auto_318081 ?auto_318084 ) ) ( not ( = ?auto_318082 ?auto_318083 ) ) ( not ( = ?auto_318082 ?auto_318084 ) ) ( not ( = ?auto_318083 ?auto_318084 ) ) ( ON ?auto_318082 ?auto_318083 ) ( CLEAR ?auto_318080 ) ( ON ?auto_318081 ?auto_318082 ) ( CLEAR ?auto_318081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_318078 ?auto_318079 ?auto_318080 ?auto_318081 )
      ( MAKE-6PILE ?auto_318078 ?auto_318079 ?auto_318080 ?auto_318081 ?auto_318082 ?auto_318083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318091 - BLOCK
      ?auto_318092 - BLOCK
      ?auto_318093 - BLOCK
      ?auto_318094 - BLOCK
      ?auto_318095 - BLOCK
      ?auto_318096 - BLOCK
    )
    :vars
    (
      ?auto_318097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318096 ?auto_318097 ) ( ON-TABLE ?auto_318091 ) ( ON ?auto_318092 ?auto_318091 ) ( ON ?auto_318093 ?auto_318092 ) ( not ( = ?auto_318091 ?auto_318092 ) ) ( not ( = ?auto_318091 ?auto_318093 ) ) ( not ( = ?auto_318091 ?auto_318094 ) ) ( not ( = ?auto_318091 ?auto_318095 ) ) ( not ( = ?auto_318091 ?auto_318096 ) ) ( not ( = ?auto_318091 ?auto_318097 ) ) ( not ( = ?auto_318092 ?auto_318093 ) ) ( not ( = ?auto_318092 ?auto_318094 ) ) ( not ( = ?auto_318092 ?auto_318095 ) ) ( not ( = ?auto_318092 ?auto_318096 ) ) ( not ( = ?auto_318092 ?auto_318097 ) ) ( not ( = ?auto_318093 ?auto_318094 ) ) ( not ( = ?auto_318093 ?auto_318095 ) ) ( not ( = ?auto_318093 ?auto_318096 ) ) ( not ( = ?auto_318093 ?auto_318097 ) ) ( not ( = ?auto_318094 ?auto_318095 ) ) ( not ( = ?auto_318094 ?auto_318096 ) ) ( not ( = ?auto_318094 ?auto_318097 ) ) ( not ( = ?auto_318095 ?auto_318096 ) ) ( not ( = ?auto_318095 ?auto_318097 ) ) ( not ( = ?auto_318096 ?auto_318097 ) ) ( ON ?auto_318095 ?auto_318096 ) ( CLEAR ?auto_318093 ) ( ON ?auto_318094 ?auto_318095 ) ( CLEAR ?auto_318094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_318091 ?auto_318092 ?auto_318093 ?auto_318094 )
      ( MAKE-6PILE ?auto_318091 ?auto_318092 ?auto_318093 ?auto_318094 ?auto_318095 ?auto_318096 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318104 - BLOCK
      ?auto_318105 - BLOCK
      ?auto_318106 - BLOCK
      ?auto_318107 - BLOCK
      ?auto_318108 - BLOCK
      ?auto_318109 - BLOCK
    )
    :vars
    (
      ?auto_318110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318109 ?auto_318110 ) ( ON-TABLE ?auto_318104 ) ( ON ?auto_318105 ?auto_318104 ) ( not ( = ?auto_318104 ?auto_318105 ) ) ( not ( = ?auto_318104 ?auto_318106 ) ) ( not ( = ?auto_318104 ?auto_318107 ) ) ( not ( = ?auto_318104 ?auto_318108 ) ) ( not ( = ?auto_318104 ?auto_318109 ) ) ( not ( = ?auto_318104 ?auto_318110 ) ) ( not ( = ?auto_318105 ?auto_318106 ) ) ( not ( = ?auto_318105 ?auto_318107 ) ) ( not ( = ?auto_318105 ?auto_318108 ) ) ( not ( = ?auto_318105 ?auto_318109 ) ) ( not ( = ?auto_318105 ?auto_318110 ) ) ( not ( = ?auto_318106 ?auto_318107 ) ) ( not ( = ?auto_318106 ?auto_318108 ) ) ( not ( = ?auto_318106 ?auto_318109 ) ) ( not ( = ?auto_318106 ?auto_318110 ) ) ( not ( = ?auto_318107 ?auto_318108 ) ) ( not ( = ?auto_318107 ?auto_318109 ) ) ( not ( = ?auto_318107 ?auto_318110 ) ) ( not ( = ?auto_318108 ?auto_318109 ) ) ( not ( = ?auto_318108 ?auto_318110 ) ) ( not ( = ?auto_318109 ?auto_318110 ) ) ( ON ?auto_318108 ?auto_318109 ) ( ON ?auto_318107 ?auto_318108 ) ( CLEAR ?auto_318105 ) ( ON ?auto_318106 ?auto_318107 ) ( CLEAR ?auto_318106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_318104 ?auto_318105 ?auto_318106 )
      ( MAKE-6PILE ?auto_318104 ?auto_318105 ?auto_318106 ?auto_318107 ?auto_318108 ?auto_318109 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318117 - BLOCK
      ?auto_318118 - BLOCK
      ?auto_318119 - BLOCK
      ?auto_318120 - BLOCK
      ?auto_318121 - BLOCK
      ?auto_318122 - BLOCK
    )
    :vars
    (
      ?auto_318123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318122 ?auto_318123 ) ( ON-TABLE ?auto_318117 ) ( ON ?auto_318118 ?auto_318117 ) ( not ( = ?auto_318117 ?auto_318118 ) ) ( not ( = ?auto_318117 ?auto_318119 ) ) ( not ( = ?auto_318117 ?auto_318120 ) ) ( not ( = ?auto_318117 ?auto_318121 ) ) ( not ( = ?auto_318117 ?auto_318122 ) ) ( not ( = ?auto_318117 ?auto_318123 ) ) ( not ( = ?auto_318118 ?auto_318119 ) ) ( not ( = ?auto_318118 ?auto_318120 ) ) ( not ( = ?auto_318118 ?auto_318121 ) ) ( not ( = ?auto_318118 ?auto_318122 ) ) ( not ( = ?auto_318118 ?auto_318123 ) ) ( not ( = ?auto_318119 ?auto_318120 ) ) ( not ( = ?auto_318119 ?auto_318121 ) ) ( not ( = ?auto_318119 ?auto_318122 ) ) ( not ( = ?auto_318119 ?auto_318123 ) ) ( not ( = ?auto_318120 ?auto_318121 ) ) ( not ( = ?auto_318120 ?auto_318122 ) ) ( not ( = ?auto_318120 ?auto_318123 ) ) ( not ( = ?auto_318121 ?auto_318122 ) ) ( not ( = ?auto_318121 ?auto_318123 ) ) ( not ( = ?auto_318122 ?auto_318123 ) ) ( ON ?auto_318121 ?auto_318122 ) ( ON ?auto_318120 ?auto_318121 ) ( CLEAR ?auto_318118 ) ( ON ?auto_318119 ?auto_318120 ) ( CLEAR ?auto_318119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_318117 ?auto_318118 ?auto_318119 )
      ( MAKE-6PILE ?auto_318117 ?auto_318118 ?auto_318119 ?auto_318120 ?auto_318121 ?auto_318122 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318130 - BLOCK
      ?auto_318131 - BLOCK
      ?auto_318132 - BLOCK
      ?auto_318133 - BLOCK
      ?auto_318134 - BLOCK
      ?auto_318135 - BLOCK
    )
    :vars
    (
      ?auto_318136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318135 ?auto_318136 ) ( ON-TABLE ?auto_318130 ) ( not ( = ?auto_318130 ?auto_318131 ) ) ( not ( = ?auto_318130 ?auto_318132 ) ) ( not ( = ?auto_318130 ?auto_318133 ) ) ( not ( = ?auto_318130 ?auto_318134 ) ) ( not ( = ?auto_318130 ?auto_318135 ) ) ( not ( = ?auto_318130 ?auto_318136 ) ) ( not ( = ?auto_318131 ?auto_318132 ) ) ( not ( = ?auto_318131 ?auto_318133 ) ) ( not ( = ?auto_318131 ?auto_318134 ) ) ( not ( = ?auto_318131 ?auto_318135 ) ) ( not ( = ?auto_318131 ?auto_318136 ) ) ( not ( = ?auto_318132 ?auto_318133 ) ) ( not ( = ?auto_318132 ?auto_318134 ) ) ( not ( = ?auto_318132 ?auto_318135 ) ) ( not ( = ?auto_318132 ?auto_318136 ) ) ( not ( = ?auto_318133 ?auto_318134 ) ) ( not ( = ?auto_318133 ?auto_318135 ) ) ( not ( = ?auto_318133 ?auto_318136 ) ) ( not ( = ?auto_318134 ?auto_318135 ) ) ( not ( = ?auto_318134 ?auto_318136 ) ) ( not ( = ?auto_318135 ?auto_318136 ) ) ( ON ?auto_318134 ?auto_318135 ) ( ON ?auto_318133 ?auto_318134 ) ( ON ?auto_318132 ?auto_318133 ) ( CLEAR ?auto_318130 ) ( ON ?auto_318131 ?auto_318132 ) ( CLEAR ?auto_318131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_318130 ?auto_318131 )
      ( MAKE-6PILE ?auto_318130 ?auto_318131 ?auto_318132 ?auto_318133 ?auto_318134 ?auto_318135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318143 - BLOCK
      ?auto_318144 - BLOCK
      ?auto_318145 - BLOCK
      ?auto_318146 - BLOCK
      ?auto_318147 - BLOCK
      ?auto_318148 - BLOCK
    )
    :vars
    (
      ?auto_318149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318148 ?auto_318149 ) ( ON-TABLE ?auto_318143 ) ( not ( = ?auto_318143 ?auto_318144 ) ) ( not ( = ?auto_318143 ?auto_318145 ) ) ( not ( = ?auto_318143 ?auto_318146 ) ) ( not ( = ?auto_318143 ?auto_318147 ) ) ( not ( = ?auto_318143 ?auto_318148 ) ) ( not ( = ?auto_318143 ?auto_318149 ) ) ( not ( = ?auto_318144 ?auto_318145 ) ) ( not ( = ?auto_318144 ?auto_318146 ) ) ( not ( = ?auto_318144 ?auto_318147 ) ) ( not ( = ?auto_318144 ?auto_318148 ) ) ( not ( = ?auto_318144 ?auto_318149 ) ) ( not ( = ?auto_318145 ?auto_318146 ) ) ( not ( = ?auto_318145 ?auto_318147 ) ) ( not ( = ?auto_318145 ?auto_318148 ) ) ( not ( = ?auto_318145 ?auto_318149 ) ) ( not ( = ?auto_318146 ?auto_318147 ) ) ( not ( = ?auto_318146 ?auto_318148 ) ) ( not ( = ?auto_318146 ?auto_318149 ) ) ( not ( = ?auto_318147 ?auto_318148 ) ) ( not ( = ?auto_318147 ?auto_318149 ) ) ( not ( = ?auto_318148 ?auto_318149 ) ) ( ON ?auto_318147 ?auto_318148 ) ( ON ?auto_318146 ?auto_318147 ) ( ON ?auto_318145 ?auto_318146 ) ( CLEAR ?auto_318143 ) ( ON ?auto_318144 ?auto_318145 ) ( CLEAR ?auto_318144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_318143 ?auto_318144 )
      ( MAKE-6PILE ?auto_318143 ?auto_318144 ?auto_318145 ?auto_318146 ?auto_318147 ?auto_318148 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318156 - BLOCK
      ?auto_318157 - BLOCK
      ?auto_318158 - BLOCK
      ?auto_318159 - BLOCK
      ?auto_318160 - BLOCK
      ?auto_318161 - BLOCK
    )
    :vars
    (
      ?auto_318162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318161 ?auto_318162 ) ( not ( = ?auto_318156 ?auto_318157 ) ) ( not ( = ?auto_318156 ?auto_318158 ) ) ( not ( = ?auto_318156 ?auto_318159 ) ) ( not ( = ?auto_318156 ?auto_318160 ) ) ( not ( = ?auto_318156 ?auto_318161 ) ) ( not ( = ?auto_318156 ?auto_318162 ) ) ( not ( = ?auto_318157 ?auto_318158 ) ) ( not ( = ?auto_318157 ?auto_318159 ) ) ( not ( = ?auto_318157 ?auto_318160 ) ) ( not ( = ?auto_318157 ?auto_318161 ) ) ( not ( = ?auto_318157 ?auto_318162 ) ) ( not ( = ?auto_318158 ?auto_318159 ) ) ( not ( = ?auto_318158 ?auto_318160 ) ) ( not ( = ?auto_318158 ?auto_318161 ) ) ( not ( = ?auto_318158 ?auto_318162 ) ) ( not ( = ?auto_318159 ?auto_318160 ) ) ( not ( = ?auto_318159 ?auto_318161 ) ) ( not ( = ?auto_318159 ?auto_318162 ) ) ( not ( = ?auto_318160 ?auto_318161 ) ) ( not ( = ?auto_318160 ?auto_318162 ) ) ( not ( = ?auto_318161 ?auto_318162 ) ) ( ON ?auto_318160 ?auto_318161 ) ( ON ?auto_318159 ?auto_318160 ) ( ON ?auto_318158 ?auto_318159 ) ( ON ?auto_318157 ?auto_318158 ) ( ON ?auto_318156 ?auto_318157 ) ( CLEAR ?auto_318156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318156 )
      ( MAKE-6PILE ?auto_318156 ?auto_318157 ?auto_318158 ?auto_318159 ?auto_318160 ?auto_318161 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_318169 - BLOCK
      ?auto_318170 - BLOCK
      ?auto_318171 - BLOCK
      ?auto_318172 - BLOCK
      ?auto_318173 - BLOCK
      ?auto_318174 - BLOCK
    )
    :vars
    (
      ?auto_318175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318174 ?auto_318175 ) ( not ( = ?auto_318169 ?auto_318170 ) ) ( not ( = ?auto_318169 ?auto_318171 ) ) ( not ( = ?auto_318169 ?auto_318172 ) ) ( not ( = ?auto_318169 ?auto_318173 ) ) ( not ( = ?auto_318169 ?auto_318174 ) ) ( not ( = ?auto_318169 ?auto_318175 ) ) ( not ( = ?auto_318170 ?auto_318171 ) ) ( not ( = ?auto_318170 ?auto_318172 ) ) ( not ( = ?auto_318170 ?auto_318173 ) ) ( not ( = ?auto_318170 ?auto_318174 ) ) ( not ( = ?auto_318170 ?auto_318175 ) ) ( not ( = ?auto_318171 ?auto_318172 ) ) ( not ( = ?auto_318171 ?auto_318173 ) ) ( not ( = ?auto_318171 ?auto_318174 ) ) ( not ( = ?auto_318171 ?auto_318175 ) ) ( not ( = ?auto_318172 ?auto_318173 ) ) ( not ( = ?auto_318172 ?auto_318174 ) ) ( not ( = ?auto_318172 ?auto_318175 ) ) ( not ( = ?auto_318173 ?auto_318174 ) ) ( not ( = ?auto_318173 ?auto_318175 ) ) ( not ( = ?auto_318174 ?auto_318175 ) ) ( ON ?auto_318173 ?auto_318174 ) ( ON ?auto_318172 ?auto_318173 ) ( ON ?auto_318171 ?auto_318172 ) ( ON ?auto_318170 ?auto_318171 ) ( ON ?auto_318169 ?auto_318170 ) ( CLEAR ?auto_318169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318169 )
      ( MAKE-6PILE ?auto_318169 ?auto_318170 ?auto_318171 ?auto_318172 ?auto_318173 ?auto_318174 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318183 - BLOCK
      ?auto_318184 - BLOCK
      ?auto_318185 - BLOCK
      ?auto_318186 - BLOCK
      ?auto_318187 - BLOCK
      ?auto_318188 - BLOCK
      ?auto_318189 - BLOCK
    )
    :vars
    (
      ?auto_318190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318188 ) ( ON ?auto_318189 ?auto_318190 ) ( CLEAR ?auto_318189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_318183 ) ( ON ?auto_318184 ?auto_318183 ) ( ON ?auto_318185 ?auto_318184 ) ( ON ?auto_318186 ?auto_318185 ) ( ON ?auto_318187 ?auto_318186 ) ( ON ?auto_318188 ?auto_318187 ) ( not ( = ?auto_318183 ?auto_318184 ) ) ( not ( = ?auto_318183 ?auto_318185 ) ) ( not ( = ?auto_318183 ?auto_318186 ) ) ( not ( = ?auto_318183 ?auto_318187 ) ) ( not ( = ?auto_318183 ?auto_318188 ) ) ( not ( = ?auto_318183 ?auto_318189 ) ) ( not ( = ?auto_318183 ?auto_318190 ) ) ( not ( = ?auto_318184 ?auto_318185 ) ) ( not ( = ?auto_318184 ?auto_318186 ) ) ( not ( = ?auto_318184 ?auto_318187 ) ) ( not ( = ?auto_318184 ?auto_318188 ) ) ( not ( = ?auto_318184 ?auto_318189 ) ) ( not ( = ?auto_318184 ?auto_318190 ) ) ( not ( = ?auto_318185 ?auto_318186 ) ) ( not ( = ?auto_318185 ?auto_318187 ) ) ( not ( = ?auto_318185 ?auto_318188 ) ) ( not ( = ?auto_318185 ?auto_318189 ) ) ( not ( = ?auto_318185 ?auto_318190 ) ) ( not ( = ?auto_318186 ?auto_318187 ) ) ( not ( = ?auto_318186 ?auto_318188 ) ) ( not ( = ?auto_318186 ?auto_318189 ) ) ( not ( = ?auto_318186 ?auto_318190 ) ) ( not ( = ?auto_318187 ?auto_318188 ) ) ( not ( = ?auto_318187 ?auto_318189 ) ) ( not ( = ?auto_318187 ?auto_318190 ) ) ( not ( = ?auto_318188 ?auto_318189 ) ) ( not ( = ?auto_318188 ?auto_318190 ) ) ( not ( = ?auto_318189 ?auto_318190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_318189 ?auto_318190 )
      ( !STACK ?auto_318189 ?auto_318188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318198 - BLOCK
      ?auto_318199 - BLOCK
      ?auto_318200 - BLOCK
      ?auto_318201 - BLOCK
      ?auto_318202 - BLOCK
      ?auto_318203 - BLOCK
      ?auto_318204 - BLOCK
    )
    :vars
    (
      ?auto_318205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318203 ) ( ON ?auto_318204 ?auto_318205 ) ( CLEAR ?auto_318204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_318198 ) ( ON ?auto_318199 ?auto_318198 ) ( ON ?auto_318200 ?auto_318199 ) ( ON ?auto_318201 ?auto_318200 ) ( ON ?auto_318202 ?auto_318201 ) ( ON ?auto_318203 ?auto_318202 ) ( not ( = ?auto_318198 ?auto_318199 ) ) ( not ( = ?auto_318198 ?auto_318200 ) ) ( not ( = ?auto_318198 ?auto_318201 ) ) ( not ( = ?auto_318198 ?auto_318202 ) ) ( not ( = ?auto_318198 ?auto_318203 ) ) ( not ( = ?auto_318198 ?auto_318204 ) ) ( not ( = ?auto_318198 ?auto_318205 ) ) ( not ( = ?auto_318199 ?auto_318200 ) ) ( not ( = ?auto_318199 ?auto_318201 ) ) ( not ( = ?auto_318199 ?auto_318202 ) ) ( not ( = ?auto_318199 ?auto_318203 ) ) ( not ( = ?auto_318199 ?auto_318204 ) ) ( not ( = ?auto_318199 ?auto_318205 ) ) ( not ( = ?auto_318200 ?auto_318201 ) ) ( not ( = ?auto_318200 ?auto_318202 ) ) ( not ( = ?auto_318200 ?auto_318203 ) ) ( not ( = ?auto_318200 ?auto_318204 ) ) ( not ( = ?auto_318200 ?auto_318205 ) ) ( not ( = ?auto_318201 ?auto_318202 ) ) ( not ( = ?auto_318201 ?auto_318203 ) ) ( not ( = ?auto_318201 ?auto_318204 ) ) ( not ( = ?auto_318201 ?auto_318205 ) ) ( not ( = ?auto_318202 ?auto_318203 ) ) ( not ( = ?auto_318202 ?auto_318204 ) ) ( not ( = ?auto_318202 ?auto_318205 ) ) ( not ( = ?auto_318203 ?auto_318204 ) ) ( not ( = ?auto_318203 ?auto_318205 ) ) ( not ( = ?auto_318204 ?auto_318205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_318204 ?auto_318205 )
      ( !STACK ?auto_318204 ?auto_318203 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318213 - BLOCK
      ?auto_318214 - BLOCK
      ?auto_318215 - BLOCK
      ?auto_318216 - BLOCK
      ?auto_318217 - BLOCK
      ?auto_318218 - BLOCK
      ?auto_318219 - BLOCK
    )
    :vars
    (
      ?auto_318220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318219 ?auto_318220 ) ( ON-TABLE ?auto_318213 ) ( ON ?auto_318214 ?auto_318213 ) ( ON ?auto_318215 ?auto_318214 ) ( ON ?auto_318216 ?auto_318215 ) ( ON ?auto_318217 ?auto_318216 ) ( not ( = ?auto_318213 ?auto_318214 ) ) ( not ( = ?auto_318213 ?auto_318215 ) ) ( not ( = ?auto_318213 ?auto_318216 ) ) ( not ( = ?auto_318213 ?auto_318217 ) ) ( not ( = ?auto_318213 ?auto_318218 ) ) ( not ( = ?auto_318213 ?auto_318219 ) ) ( not ( = ?auto_318213 ?auto_318220 ) ) ( not ( = ?auto_318214 ?auto_318215 ) ) ( not ( = ?auto_318214 ?auto_318216 ) ) ( not ( = ?auto_318214 ?auto_318217 ) ) ( not ( = ?auto_318214 ?auto_318218 ) ) ( not ( = ?auto_318214 ?auto_318219 ) ) ( not ( = ?auto_318214 ?auto_318220 ) ) ( not ( = ?auto_318215 ?auto_318216 ) ) ( not ( = ?auto_318215 ?auto_318217 ) ) ( not ( = ?auto_318215 ?auto_318218 ) ) ( not ( = ?auto_318215 ?auto_318219 ) ) ( not ( = ?auto_318215 ?auto_318220 ) ) ( not ( = ?auto_318216 ?auto_318217 ) ) ( not ( = ?auto_318216 ?auto_318218 ) ) ( not ( = ?auto_318216 ?auto_318219 ) ) ( not ( = ?auto_318216 ?auto_318220 ) ) ( not ( = ?auto_318217 ?auto_318218 ) ) ( not ( = ?auto_318217 ?auto_318219 ) ) ( not ( = ?auto_318217 ?auto_318220 ) ) ( not ( = ?auto_318218 ?auto_318219 ) ) ( not ( = ?auto_318218 ?auto_318220 ) ) ( not ( = ?auto_318219 ?auto_318220 ) ) ( CLEAR ?auto_318217 ) ( ON ?auto_318218 ?auto_318219 ) ( CLEAR ?auto_318218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_318213 ?auto_318214 ?auto_318215 ?auto_318216 ?auto_318217 ?auto_318218 )
      ( MAKE-7PILE ?auto_318213 ?auto_318214 ?auto_318215 ?auto_318216 ?auto_318217 ?auto_318218 ?auto_318219 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318228 - BLOCK
      ?auto_318229 - BLOCK
      ?auto_318230 - BLOCK
      ?auto_318231 - BLOCK
      ?auto_318232 - BLOCK
      ?auto_318233 - BLOCK
      ?auto_318234 - BLOCK
    )
    :vars
    (
      ?auto_318235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318234 ?auto_318235 ) ( ON-TABLE ?auto_318228 ) ( ON ?auto_318229 ?auto_318228 ) ( ON ?auto_318230 ?auto_318229 ) ( ON ?auto_318231 ?auto_318230 ) ( ON ?auto_318232 ?auto_318231 ) ( not ( = ?auto_318228 ?auto_318229 ) ) ( not ( = ?auto_318228 ?auto_318230 ) ) ( not ( = ?auto_318228 ?auto_318231 ) ) ( not ( = ?auto_318228 ?auto_318232 ) ) ( not ( = ?auto_318228 ?auto_318233 ) ) ( not ( = ?auto_318228 ?auto_318234 ) ) ( not ( = ?auto_318228 ?auto_318235 ) ) ( not ( = ?auto_318229 ?auto_318230 ) ) ( not ( = ?auto_318229 ?auto_318231 ) ) ( not ( = ?auto_318229 ?auto_318232 ) ) ( not ( = ?auto_318229 ?auto_318233 ) ) ( not ( = ?auto_318229 ?auto_318234 ) ) ( not ( = ?auto_318229 ?auto_318235 ) ) ( not ( = ?auto_318230 ?auto_318231 ) ) ( not ( = ?auto_318230 ?auto_318232 ) ) ( not ( = ?auto_318230 ?auto_318233 ) ) ( not ( = ?auto_318230 ?auto_318234 ) ) ( not ( = ?auto_318230 ?auto_318235 ) ) ( not ( = ?auto_318231 ?auto_318232 ) ) ( not ( = ?auto_318231 ?auto_318233 ) ) ( not ( = ?auto_318231 ?auto_318234 ) ) ( not ( = ?auto_318231 ?auto_318235 ) ) ( not ( = ?auto_318232 ?auto_318233 ) ) ( not ( = ?auto_318232 ?auto_318234 ) ) ( not ( = ?auto_318232 ?auto_318235 ) ) ( not ( = ?auto_318233 ?auto_318234 ) ) ( not ( = ?auto_318233 ?auto_318235 ) ) ( not ( = ?auto_318234 ?auto_318235 ) ) ( CLEAR ?auto_318232 ) ( ON ?auto_318233 ?auto_318234 ) ( CLEAR ?auto_318233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_318228 ?auto_318229 ?auto_318230 ?auto_318231 ?auto_318232 ?auto_318233 )
      ( MAKE-7PILE ?auto_318228 ?auto_318229 ?auto_318230 ?auto_318231 ?auto_318232 ?auto_318233 ?auto_318234 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318243 - BLOCK
      ?auto_318244 - BLOCK
      ?auto_318245 - BLOCK
      ?auto_318246 - BLOCK
      ?auto_318247 - BLOCK
      ?auto_318248 - BLOCK
      ?auto_318249 - BLOCK
    )
    :vars
    (
      ?auto_318250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318249 ?auto_318250 ) ( ON-TABLE ?auto_318243 ) ( ON ?auto_318244 ?auto_318243 ) ( ON ?auto_318245 ?auto_318244 ) ( ON ?auto_318246 ?auto_318245 ) ( not ( = ?auto_318243 ?auto_318244 ) ) ( not ( = ?auto_318243 ?auto_318245 ) ) ( not ( = ?auto_318243 ?auto_318246 ) ) ( not ( = ?auto_318243 ?auto_318247 ) ) ( not ( = ?auto_318243 ?auto_318248 ) ) ( not ( = ?auto_318243 ?auto_318249 ) ) ( not ( = ?auto_318243 ?auto_318250 ) ) ( not ( = ?auto_318244 ?auto_318245 ) ) ( not ( = ?auto_318244 ?auto_318246 ) ) ( not ( = ?auto_318244 ?auto_318247 ) ) ( not ( = ?auto_318244 ?auto_318248 ) ) ( not ( = ?auto_318244 ?auto_318249 ) ) ( not ( = ?auto_318244 ?auto_318250 ) ) ( not ( = ?auto_318245 ?auto_318246 ) ) ( not ( = ?auto_318245 ?auto_318247 ) ) ( not ( = ?auto_318245 ?auto_318248 ) ) ( not ( = ?auto_318245 ?auto_318249 ) ) ( not ( = ?auto_318245 ?auto_318250 ) ) ( not ( = ?auto_318246 ?auto_318247 ) ) ( not ( = ?auto_318246 ?auto_318248 ) ) ( not ( = ?auto_318246 ?auto_318249 ) ) ( not ( = ?auto_318246 ?auto_318250 ) ) ( not ( = ?auto_318247 ?auto_318248 ) ) ( not ( = ?auto_318247 ?auto_318249 ) ) ( not ( = ?auto_318247 ?auto_318250 ) ) ( not ( = ?auto_318248 ?auto_318249 ) ) ( not ( = ?auto_318248 ?auto_318250 ) ) ( not ( = ?auto_318249 ?auto_318250 ) ) ( ON ?auto_318248 ?auto_318249 ) ( CLEAR ?auto_318246 ) ( ON ?auto_318247 ?auto_318248 ) ( CLEAR ?auto_318247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_318243 ?auto_318244 ?auto_318245 ?auto_318246 ?auto_318247 )
      ( MAKE-7PILE ?auto_318243 ?auto_318244 ?auto_318245 ?auto_318246 ?auto_318247 ?auto_318248 ?auto_318249 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318258 - BLOCK
      ?auto_318259 - BLOCK
      ?auto_318260 - BLOCK
      ?auto_318261 - BLOCK
      ?auto_318262 - BLOCK
      ?auto_318263 - BLOCK
      ?auto_318264 - BLOCK
    )
    :vars
    (
      ?auto_318265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318264 ?auto_318265 ) ( ON-TABLE ?auto_318258 ) ( ON ?auto_318259 ?auto_318258 ) ( ON ?auto_318260 ?auto_318259 ) ( ON ?auto_318261 ?auto_318260 ) ( not ( = ?auto_318258 ?auto_318259 ) ) ( not ( = ?auto_318258 ?auto_318260 ) ) ( not ( = ?auto_318258 ?auto_318261 ) ) ( not ( = ?auto_318258 ?auto_318262 ) ) ( not ( = ?auto_318258 ?auto_318263 ) ) ( not ( = ?auto_318258 ?auto_318264 ) ) ( not ( = ?auto_318258 ?auto_318265 ) ) ( not ( = ?auto_318259 ?auto_318260 ) ) ( not ( = ?auto_318259 ?auto_318261 ) ) ( not ( = ?auto_318259 ?auto_318262 ) ) ( not ( = ?auto_318259 ?auto_318263 ) ) ( not ( = ?auto_318259 ?auto_318264 ) ) ( not ( = ?auto_318259 ?auto_318265 ) ) ( not ( = ?auto_318260 ?auto_318261 ) ) ( not ( = ?auto_318260 ?auto_318262 ) ) ( not ( = ?auto_318260 ?auto_318263 ) ) ( not ( = ?auto_318260 ?auto_318264 ) ) ( not ( = ?auto_318260 ?auto_318265 ) ) ( not ( = ?auto_318261 ?auto_318262 ) ) ( not ( = ?auto_318261 ?auto_318263 ) ) ( not ( = ?auto_318261 ?auto_318264 ) ) ( not ( = ?auto_318261 ?auto_318265 ) ) ( not ( = ?auto_318262 ?auto_318263 ) ) ( not ( = ?auto_318262 ?auto_318264 ) ) ( not ( = ?auto_318262 ?auto_318265 ) ) ( not ( = ?auto_318263 ?auto_318264 ) ) ( not ( = ?auto_318263 ?auto_318265 ) ) ( not ( = ?auto_318264 ?auto_318265 ) ) ( ON ?auto_318263 ?auto_318264 ) ( CLEAR ?auto_318261 ) ( ON ?auto_318262 ?auto_318263 ) ( CLEAR ?auto_318262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_318258 ?auto_318259 ?auto_318260 ?auto_318261 ?auto_318262 )
      ( MAKE-7PILE ?auto_318258 ?auto_318259 ?auto_318260 ?auto_318261 ?auto_318262 ?auto_318263 ?auto_318264 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318273 - BLOCK
      ?auto_318274 - BLOCK
      ?auto_318275 - BLOCK
      ?auto_318276 - BLOCK
      ?auto_318277 - BLOCK
      ?auto_318278 - BLOCK
      ?auto_318279 - BLOCK
    )
    :vars
    (
      ?auto_318280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318279 ?auto_318280 ) ( ON-TABLE ?auto_318273 ) ( ON ?auto_318274 ?auto_318273 ) ( ON ?auto_318275 ?auto_318274 ) ( not ( = ?auto_318273 ?auto_318274 ) ) ( not ( = ?auto_318273 ?auto_318275 ) ) ( not ( = ?auto_318273 ?auto_318276 ) ) ( not ( = ?auto_318273 ?auto_318277 ) ) ( not ( = ?auto_318273 ?auto_318278 ) ) ( not ( = ?auto_318273 ?auto_318279 ) ) ( not ( = ?auto_318273 ?auto_318280 ) ) ( not ( = ?auto_318274 ?auto_318275 ) ) ( not ( = ?auto_318274 ?auto_318276 ) ) ( not ( = ?auto_318274 ?auto_318277 ) ) ( not ( = ?auto_318274 ?auto_318278 ) ) ( not ( = ?auto_318274 ?auto_318279 ) ) ( not ( = ?auto_318274 ?auto_318280 ) ) ( not ( = ?auto_318275 ?auto_318276 ) ) ( not ( = ?auto_318275 ?auto_318277 ) ) ( not ( = ?auto_318275 ?auto_318278 ) ) ( not ( = ?auto_318275 ?auto_318279 ) ) ( not ( = ?auto_318275 ?auto_318280 ) ) ( not ( = ?auto_318276 ?auto_318277 ) ) ( not ( = ?auto_318276 ?auto_318278 ) ) ( not ( = ?auto_318276 ?auto_318279 ) ) ( not ( = ?auto_318276 ?auto_318280 ) ) ( not ( = ?auto_318277 ?auto_318278 ) ) ( not ( = ?auto_318277 ?auto_318279 ) ) ( not ( = ?auto_318277 ?auto_318280 ) ) ( not ( = ?auto_318278 ?auto_318279 ) ) ( not ( = ?auto_318278 ?auto_318280 ) ) ( not ( = ?auto_318279 ?auto_318280 ) ) ( ON ?auto_318278 ?auto_318279 ) ( ON ?auto_318277 ?auto_318278 ) ( CLEAR ?auto_318275 ) ( ON ?auto_318276 ?auto_318277 ) ( CLEAR ?auto_318276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_318273 ?auto_318274 ?auto_318275 ?auto_318276 )
      ( MAKE-7PILE ?auto_318273 ?auto_318274 ?auto_318275 ?auto_318276 ?auto_318277 ?auto_318278 ?auto_318279 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318288 - BLOCK
      ?auto_318289 - BLOCK
      ?auto_318290 - BLOCK
      ?auto_318291 - BLOCK
      ?auto_318292 - BLOCK
      ?auto_318293 - BLOCK
      ?auto_318294 - BLOCK
    )
    :vars
    (
      ?auto_318295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318294 ?auto_318295 ) ( ON-TABLE ?auto_318288 ) ( ON ?auto_318289 ?auto_318288 ) ( ON ?auto_318290 ?auto_318289 ) ( not ( = ?auto_318288 ?auto_318289 ) ) ( not ( = ?auto_318288 ?auto_318290 ) ) ( not ( = ?auto_318288 ?auto_318291 ) ) ( not ( = ?auto_318288 ?auto_318292 ) ) ( not ( = ?auto_318288 ?auto_318293 ) ) ( not ( = ?auto_318288 ?auto_318294 ) ) ( not ( = ?auto_318288 ?auto_318295 ) ) ( not ( = ?auto_318289 ?auto_318290 ) ) ( not ( = ?auto_318289 ?auto_318291 ) ) ( not ( = ?auto_318289 ?auto_318292 ) ) ( not ( = ?auto_318289 ?auto_318293 ) ) ( not ( = ?auto_318289 ?auto_318294 ) ) ( not ( = ?auto_318289 ?auto_318295 ) ) ( not ( = ?auto_318290 ?auto_318291 ) ) ( not ( = ?auto_318290 ?auto_318292 ) ) ( not ( = ?auto_318290 ?auto_318293 ) ) ( not ( = ?auto_318290 ?auto_318294 ) ) ( not ( = ?auto_318290 ?auto_318295 ) ) ( not ( = ?auto_318291 ?auto_318292 ) ) ( not ( = ?auto_318291 ?auto_318293 ) ) ( not ( = ?auto_318291 ?auto_318294 ) ) ( not ( = ?auto_318291 ?auto_318295 ) ) ( not ( = ?auto_318292 ?auto_318293 ) ) ( not ( = ?auto_318292 ?auto_318294 ) ) ( not ( = ?auto_318292 ?auto_318295 ) ) ( not ( = ?auto_318293 ?auto_318294 ) ) ( not ( = ?auto_318293 ?auto_318295 ) ) ( not ( = ?auto_318294 ?auto_318295 ) ) ( ON ?auto_318293 ?auto_318294 ) ( ON ?auto_318292 ?auto_318293 ) ( CLEAR ?auto_318290 ) ( ON ?auto_318291 ?auto_318292 ) ( CLEAR ?auto_318291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_318288 ?auto_318289 ?auto_318290 ?auto_318291 )
      ( MAKE-7PILE ?auto_318288 ?auto_318289 ?auto_318290 ?auto_318291 ?auto_318292 ?auto_318293 ?auto_318294 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318303 - BLOCK
      ?auto_318304 - BLOCK
      ?auto_318305 - BLOCK
      ?auto_318306 - BLOCK
      ?auto_318307 - BLOCK
      ?auto_318308 - BLOCK
      ?auto_318309 - BLOCK
    )
    :vars
    (
      ?auto_318310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318309 ?auto_318310 ) ( ON-TABLE ?auto_318303 ) ( ON ?auto_318304 ?auto_318303 ) ( not ( = ?auto_318303 ?auto_318304 ) ) ( not ( = ?auto_318303 ?auto_318305 ) ) ( not ( = ?auto_318303 ?auto_318306 ) ) ( not ( = ?auto_318303 ?auto_318307 ) ) ( not ( = ?auto_318303 ?auto_318308 ) ) ( not ( = ?auto_318303 ?auto_318309 ) ) ( not ( = ?auto_318303 ?auto_318310 ) ) ( not ( = ?auto_318304 ?auto_318305 ) ) ( not ( = ?auto_318304 ?auto_318306 ) ) ( not ( = ?auto_318304 ?auto_318307 ) ) ( not ( = ?auto_318304 ?auto_318308 ) ) ( not ( = ?auto_318304 ?auto_318309 ) ) ( not ( = ?auto_318304 ?auto_318310 ) ) ( not ( = ?auto_318305 ?auto_318306 ) ) ( not ( = ?auto_318305 ?auto_318307 ) ) ( not ( = ?auto_318305 ?auto_318308 ) ) ( not ( = ?auto_318305 ?auto_318309 ) ) ( not ( = ?auto_318305 ?auto_318310 ) ) ( not ( = ?auto_318306 ?auto_318307 ) ) ( not ( = ?auto_318306 ?auto_318308 ) ) ( not ( = ?auto_318306 ?auto_318309 ) ) ( not ( = ?auto_318306 ?auto_318310 ) ) ( not ( = ?auto_318307 ?auto_318308 ) ) ( not ( = ?auto_318307 ?auto_318309 ) ) ( not ( = ?auto_318307 ?auto_318310 ) ) ( not ( = ?auto_318308 ?auto_318309 ) ) ( not ( = ?auto_318308 ?auto_318310 ) ) ( not ( = ?auto_318309 ?auto_318310 ) ) ( ON ?auto_318308 ?auto_318309 ) ( ON ?auto_318307 ?auto_318308 ) ( ON ?auto_318306 ?auto_318307 ) ( CLEAR ?auto_318304 ) ( ON ?auto_318305 ?auto_318306 ) ( CLEAR ?auto_318305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_318303 ?auto_318304 ?auto_318305 )
      ( MAKE-7PILE ?auto_318303 ?auto_318304 ?auto_318305 ?auto_318306 ?auto_318307 ?auto_318308 ?auto_318309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318318 - BLOCK
      ?auto_318319 - BLOCK
      ?auto_318320 - BLOCK
      ?auto_318321 - BLOCK
      ?auto_318322 - BLOCK
      ?auto_318323 - BLOCK
      ?auto_318324 - BLOCK
    )
    :vars
    (
      ?auto_318325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318324 ?auto_318325 ) ( ON-TABLE ?auto_318318 ) ( ON ?auto_318319 ?auto_318318 ) ( not ( = ?auto_318318 ?auto_318319 ) ) ( not ( = ?auto_318318 ?auto_318320 ) ) ( not ( = ?auto_318318 ?auto_318321 ) ) ( not ( = ?auto_318318 ?auto_318322 ) ) ( not ( = ?auto_318318 ?auto_318323 ) ) ( not ( = ?auto_318318 ?auto_318324 ) ) ( not ( = ?auto_318318 ?auto_318325 ) ) ( not ( = ?auto_318319 ?auto_318320 ) ) ( not ( = ?auto_318319 ?auto_318321 ) ) ( not ( = ?auto_318319 ?auto_318322 ) ) ( not ( = ?auto_318319 ?auto_318323 ) ) ( not ( = ?auto_318319 ?auto_318324 ) ) ( not ( = ?auto_318319 ?auto_318325 ) ) ( not ( = ?auto_318320 ?auto_318321 ) ) ( not ( = ?auto_318320 ?auto_318322 ) ) ( not ( = ?auto_318320 ?auto_318323 ) ) ( not ( = ?auto_318320 ?auto_318324 ) ) ( not ( = ?auto_318320 ?auto_318325 ) ) ( not ( = ?auto_318321 ?auto_318322 ) ) ( not ( = ?auto_318321 ?auto_318323 ) ) ( not ( = ?auto_318321 ?auto_318324 ) ) ( not ( = ?auto_318321 ?auto_318325 ) ) ( not ( = ?auto_318322 ?auto_318323 ) ) ( not ( = ?auto_318322 ?auto_318324 ) ) ( not ( = ?auto_318322 ?auto_318325 ) ) ( not ( = ?auto_318323 ?auto_318324 ) ) ( not ( = ?auto_318323 ?auto_318325 ) ) ( not ( = ?auto_318324 ?auto_318325 ) ) ( ON ?auto_318323 ?auto_318324 ) ( ON ?auto_318322 ?auto_318323 ) ( ON ?auto_318321 ?auto_318322 ) ( CLEAR ?auto_318319 ) ( ON ?auto_318320 ?auto_318321 ) ( CLEAR ?auto_318320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_318318 ?auto_318319 ?auto_318320 )
      ( MAKE-7PILE ?auto_318318 ?auto_318319 ?auto_318320 ?auto_318321 ?auto_318322 ?auto_318323 ?auto_318324 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318333 - BLOCK
      ?auto_318334 - BLOCK
      ?auto_318335 - BLOCK
      ?auto_318336 - BLOCK
      ?auto_318337 - BLOCK
      ?auto_318338 - BLOCK
      ?auto_318339 - BLOCK
    )
    :vars
    (
      ?auto_318340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318339 ?auto_318340 ) ( ON-TABLE ?auto_318333 ) ( not ( = ?auto_318333 ?auto_318334 ) ) ( not ( = ?auto_318333 ?auto_318335 ) ) ( not ( = ?auto_318333 ?auto_318336 ) ) ( not ( = ?auto_318333 ?auto_318337 ) ) ( not ( = ?auto_318333 ?auto_318338 ) ) ( not ( = ?auto_318333 ?auto_318339 ) ) ( not ( = ?auto_318333 ?auto_318340 ) ) ( not ( = ?auto_318334 ?auto_318335 ) ) ( not ( = ?auto_318334 ?auto_318336 ) ) ( not ( = ?auto_318334 ?auto_318337 ) ) ( not ( = ?auto_318334 ?auto_318338 ) ) ( not ( = ?auto_318334 ?auto_318339 ) ) ( not ( = ?auto_318334 ?auto_318340 ) ) ( not ( = ?auto_318335 ?auto_318336 ) ) ( not ( = ?auto_318335 ?auto_318337 ) ) ( not ( = ?auto_318335 ?auto_318338 ) ) ( not ( = ?auto_318335 ?auto_318339 ) ) ( not ( = ?auto_318335 ?auto_318340 ) ) ( not ( = ?auto_318336 ?auto_318337 ) ) ( not ( = ?auto_318336 ?auto_318338 ) ) ( not ( = ?auto_318336 ?auto_318339 ) ) ( not ( = ?auto_318336 ?auto_318340 ) ) ( not ( = ?auto_318337 ?auto_318338 ) ) ( not ( = ?auto_318337 ?auto_318339 ) ) ( not ( = ?auto_318337 ?auto_318340 ) ) ( not ( = ?auto_318338 ?auto_318339 ) ) ( not ( = ?auto_318338 ?auto_318340 ) ) ( not ( = ?auto_318339 ?auto_318340 ) ) ( ON ?auto_318338 ?auto_318339 ) ( ON ?auto_318337 ?auto_318338 ) ( ON ?auto_318336 ?auto_318337 ) ( ON ?auto_318335 ?auto_318336 ) ( CLEAR ?auto_318333 ) ( ON ?auto_318334 ?auto_318335 ) ( CLEAR ?auto_318334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_318333 ?auto_318334 )
      ( MAKE-7PILE ?auto_318333 ?auto_318334 ?auto_318335 ?auto_318336 ?auto_318337 ?auto_318338 ?auto_318339 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318348 - BLOCK
      ?auto_318349 - BLOCK
      ?auto_318350 - BLOCK
      ?auto_318351 - BLOCK
      ?auto_318352 - BLOCK
      ?auto_318353 - BLOCK
      ?auto_318354 - BLOCK
    )
    :vars
    (
      ?auto_318355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318354 ?auto_318355 ) ( ON-TABLE ?auto_318348 ) ( not ( = ?auto_318348 ?auto_318349 ) ) ( not ( = ?auto_318348 ?auto_318350 ) ) ( not ( = ?auto_318348 ?auto_318351 ) ) ( not ( = ?auto_318348 ?auto_318352 ) ) ( not ( = ?auto_318348 ?auto_318353 ) ) ( not ( = ?auto_318348 ?auto_318354 ) ) ( not ( = ?auto_318348 ?auto_318355 ) ) ( not ( = ?auto_318349 ?auto_318350 ) ) ( not ( = ?auto_318349 ?auto_318351 ) ) ( not ( = ?auto_318349 ?auto_318352 ) ) ( not ( = ?auto_318349 ?auto_318353 ) ) ( not ( = ?auto_318349 ?auto_318354 ) ) ( not ( = ?auto_318349 ?auto_318355 ) ) ( not ( = ?auto_318350 ?auto_318351 ) ) ( not ( = ?auto_318350 ?auto_318352 ) ) ( not ( = ?auto_318350 ?auto_318353 ) ) ( not ( = ?auto_318350 ?auto_318354 ) ) ( not ( = ?auto_318350 ?auto_318355 ) ) ( not ( = ?auto_318351 ?auto_318352 ) ) ( not ( = ?auto_318351 ?auto_318353 ) ) ( not ( = ?auto_318351 ?auto_318354 ) ) ( not ( = ?auto_318351 ?auto_318355 ) ) ( not ( = ?auto_318352 ?auto_318353 ) ) ( not ( = ?auto_318352 ?auto_318354 ) ) ( not ( = ?auto_318352 ?auto_318355 ) ) ( not ( = ?auto_318353 ?auto_318354 ) ) ( not ( = ?auto_318353 ?auto_318355 ) ) ( not ( = ?auto_318354 ?auto_318355 ) ) ( ON ?auto_318353 ?auto_318354 ) ( ON ?auto_318352 ?auto_318353 ) ( ON ?auto_318351 ?auto_318352 ) ( ON ?auto_318350 ?auto_318351 ) ( CLEAR ?auto_318348 ) ( ON ?auto_318349 ?auto_318350 ) ( CLEAR ?auto_318349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_318348 ?auto_318349 )
      ( MAKE-7PILE ?auto_318348 ?auto_318349 ?auto_318350 ?auto_318351 ?auto_318352 ?auto_318353 ?auto_318354 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318363 - BLOCK
      ?auto_318364 - BLOCK
      ?auto_318365 - BLOCK
      ?auto_318366 - BLOCK
      ?auto_318367 - BLOCK
      ?auto_318368 - BLOCK
      ?auto_318369 - BLOCK
    )
    :vars
    (
      ?auto_318370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318369 ?auto_318370 ) ( not ( = ?auto_318363 ?auto_318364 ) ) ( not ( = ?auto_318363 ?auto_318365 ) ) ( not ( = ?auto_318363 ?auto_318366 ) ) ( not ( = ?auto_318363 ?auto_318367 ) ) ( not ( = ?auto_318363 ?auto_318368 ) ) ( not ( = ?auto_318363 ?auto_318369 ) ) ( not ( = ?auto_318363 ?auto_318370 ) ) ( not ( = ?auto_318364 ?auto_318365 ) ) ( not ( = ?auto_318364 ?auto_318366 ) ) ( not ( = ?auto_318364 ?auto_318367 ) ) ( not ( = ?auto_318364 ?auto_318368 ) ) ( not ( = ?auto_318364 ?auto_318369 ) ) ( not ( = ?auto_318364 ?auto_318370 ) ) ( not ( = ?auto_318365 ?auto_318366 ) ) ( not ( = ?auto_318365 ?auto_318367 ) ) ( not ( = ?auto_318365 ?auto_318368 ) ) ( not ( = ?auto_318365 ?auto_318369 ) ) ( not ( = ?auto_318365 ?auto_318370 ) ) ( not ( = ?auto_318366 ?auto_318367 ) ) ( not ( = ?auto_318366 ?auto_318368 ) ) ( not ( = ?auto_318366 ?auto_318369 ) ) ( not ( = ?auto_318366 ?auto_318370 ) ) ( not ( = ?auto_318367 ?auto_318368 ) ) ( not ( = ?auto_318367 ?auto_318369 ) ) ( not ( = ?auto_318367 ?auto_318370 ) ) ( not ( = ?auto_318368 ?auto_318369 ) ) ( not ( = ?auto_318368 ?auto_318370 ) ) ( not ( = ?auto_318369 ?auto_318370 ) ) ( ON ?auto_318368 ?auto_318369 ) ( ON ?auto_318367 ?auto_318368 ) ( ON ?auto_318366 ?auto_318367 ) ( ON ?auto_318365 ?auto_318366 ) ( ON ?auto_318364 ?auto_318365 ) ( ON ?auto_318363 ?auto_318364 ) ( CLEAR ?auto_318363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318363 )
      ( MAKE-7PILE ?auto_318363 ?auto_318364 ?auto_318365 ?auto_318366 ?auto_318367 ?auto_318368 ?auto_318369 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_318378 - BLOCK
      ?auto_318379 - BLOCK
      ?auto_318380 - BLOCK
      ?auto_318381 - BLOCK
      ?auto_318382 - BLOCK
      ?auto_318383 - BLOCK
      ?auto_318384 - BLOCK
    )
    :vars
    (
      ?auto_318385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318384 ?auto_318385 ) ( not ( = ?auto_318378 ?auto_318379 ) ) ( not ( = ?auto_318378 ?auto_318380 ) ) ( not ( = ?auto_318378 ?auto_318381 ) ) ( not ( = ?auto_318378 ?auto_318382 ) ) ( not ( = ?auto_318378 ?auto_318383 ) ) ( not ( = ?auto_318378 ?auto_318384 ) ) ( not ( = ?auto_318378 ?auto_318385 ) ) ( not ( = ?auto_318379 ?auto_318380 ) ) ( not ( = ?auto_318379 ?auto_318381 ) ) ( not ( = ?auto_318379 ?auto_318382 ) ) ( not ( = ?auto_318379 ?auto_318383 ) ) ( not ( = ?auto_318379 ?auto_318384 ) ) ( not ( = ?auto_318379 ?auto_318385 ) ) ( not ( = ?auto_318380 ?auto_318381 ) ) ( not ( = ?auto_318380 ?auto_318382 ) ) ( not ( = ?auto_318380 ?auto_318383 ) ) ( not ( = ?auto_318380 ?auto_318384 ) ) ( not ( = ?auto_318380 ?auto_318385 ) ) ( not ( = ?auto_318381 ?auto_318382 ) ) ( not ( = ?auto_318381 ?auto_318383 ) ) ( not ( = ?auto_318381 ?auto_318384 ) ) ( not ( = ?auto_318381 ?auto_318385 ) ) ( not ( = ?auto_318382 ?auto_318383 ) ) ( not ( = ?auto_318382 ?auto_318384 ) ) ( not ( = ?auto_318382 ?auto_318385 ) ) ( not ( = ?auto_318383 ?auto_318384 ) ) ( not ( = ?auto_318383 ?auto_318385 ) ) ( not ( = ?auto_318384 ?auto_318385 ) ) ( ON ?auto_318383 ?auto_318384 ) ( ON ?auto_318382 ?auto_318383 ) ( ON ?auto_318381 ?auto_318382 ) ( ON ?auto_318380 ?auto_318381 ) ( ON ?auto_318379 ?auto_318380 ) ( ON ?auto_318378 ?auto_318379 ) ( CLEAR ?auto_318378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318378 )
      ( MAKE-7PILE ?auto_318378 ?auto_318379 ?auto_318380 ?auto_318381 ?auto_318382 ?auto_318383 ?auto_318384 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318394 - BLOCK
      ?auto_318395 - BLOCK
      ?auto_318396 - BLOCK
      ?auto_318397 - BLOCK
      ?auto_318398 - BLOCK
      ?auto_318399 - BLOCK
      ?auto_318400 - BLOCK
      ?auto_318401 - BLOCK
    )
    :vars
    (
      ?auto_318402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318400 ) ( ON ?auto_318401 ?auto_318402 ) ( CLEAR ?auto_318401 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_318394 ) ( ON ?auto_318395 ?auto_318394 ) ( ON ?auto_318396 ?auto_318395 ) ( ON ?auto_318397 ?auto_318396 ) ( ON ?auto_318398 ?auto_318397 ) ( ON ?auto_318399 ?auto_318398 ) ( ON ?auto_318400 ?auto_318399 ) ( not ( = ?auto_318394 ?auto_318395 ) ) ( not ( = ?auto_318394 ?auto_318396 ) ) ( not ( = ?auto_318394 ?auto_318397 ) ) ( not ( = ?auto_318394 ?auto_318398 ) ) ( not ( = ?auto_318394 ?auto_318399 ) ) ( not ( = ?auto_318394 ?auto_318400 ) ) ( not ( = ?auto_318394 ?auto_318401 ) ) ( not ( = ?auto_318394 ?auto_318402 ) ) ( not ( = ?auto_318395 ?auto_318396 ) ) ( not ( = ?auto_318395 ?auto_318397 ) ) ( not ( = ?auto_318395 ?auto_318398 ) ) ( not ( = ?auto_318395 ?auto_318399 ) ) ( not ( = ?auto_318395 ?auto_318400 ) ) ( not ( = ?auto_318395 ?auto_318401 ) ) ( not ( = ?auto_318395 ?auto_318402 ) ) ( not ( = ?auto_318396 ?auto_318397 ) ) ( not ( = ?auto_318396 ?auto_318398 ) ) ( not ( = ?auto_318396 ?auto_318399 ) ) ( not ( = ?auto_318396 ?auto_318400 ) ) ( not ( = ?auto_318396 ?auto_318401 ) ) ( not ( = ?auto_318396 ?auto_318402 ) ) ( not ( = ?auto_318397 ?auto_318398 ) ) ( not ( = ?auto_318397 ?auto_318399 ) ) ( not ( = ?auto_318397 ?auto_318400 ) ) ( not ( = ?auto_318397 ?auto_318401 ) ) ( not ( = ?auto_318397 ?auto_318402 ) ) ( not ( = ?auto_318398 ?auto_318399 ) ) ( not ( = ?auto_318398 ?auto_318400 ) ) ( not ( = ?auto_318398 ?auto_318401 ) ) ( not ( = ?auto_318398 ?auto_318402 ) ) ( not ( = ?auto_318399 ?auto_318400 ) ) ( not ( = ?auto_318399 ?auto_318401 ) ) ( not ( = ?auto_318399 ?auto_318402 ) ) ( not ( = ?auto_318400 ?auto_318401 ) ) ( not ( = ?auto_318400 ?auto_318402 ) ) ( not ( = ?auto_318401 ?auto_318402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_318401 ?auto_318402 )
      ( !STACK ?auto_318401 ?auto_318400 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318411 - BLOCK
      ?auto_318412 - BLOCK
      ?auto_318413 - BLOCK
      ?auto_318414 - BLOCK
      ?auto_318415 - BLOCK
      ?auto_318416 - BLOCK
      ?auto_318417 - BLOCK
      ?auto_318418 - BLOCK
    )
    :vars
    (
      ?auto_318419 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318417 ) ( ON ?auto_318418 ?auto_318419 ) ( CLEAR ?auto_318418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_318411 ) ( ON ?auto_318412 ?auto_318411 ) ( ON ?auto_318413 ?auto_318412 ) ( ON ?auto_318414 ?auto_318413 ) ( ON ?auto_318415 ?auto_318414 ) ( ON ?auto_318416 ?auto_318415 ) ( ON ?auto_318417 ?auto_318416 ) ( not ( = ?auto_318411 ?auto_318412 ) ) ( not ( = ?auto_318411 ?auto_318413 ) ) ( not ( = ?auto_318411 ?auto_318414 ) ) ( not ( = ?auto_318411 ?auto_318415 ) ) ( not ( = ?auto_318411 ?auto_318416 ) ) ( not ( = ?auto_318411 ?auto_318417 ) ) ( not ( = ?auto_318411 ?auto_318418 ) ) ( not ( = ?auto_318411 ?auto_318419 ) ) ( not ( = ?auto_318412 ?auto_318413 ) ) ( not ( = ?auto_318412 ?auto_318414 ) ) ( not ( = ?auto_318412 ?auto_318415 ) ) ( not ( = ?auto_318412 ?auto_318416 ) ) ( not ( = ?auto_318412 ?auto_318417 ) ) ( not ( = ?auto_318412 ?auto_318418 ) ) ( not ( = ?auto_318412 ?auto_318419 ) ) ( not ( = ?auto_318413 ?auto_318414 ) ) ( not ( = ?auto_318413 ?auto_318415 ) ) ( not ( = ?auto_318413 ?auto_318416 ) ) ( not ( = ?auto_318413 ?auto_318417 ) ) ( not ( = ?auto_318413 ?auto_318418 ) ) ( not ( = ?auto_318413 ?auto_318419 ) ) ( not ( = ?auto_318414 ?auto_318415 ) ) ( not ( = ?auto_318414 ?auto_318416 ) ) ( not ( = ?auto_318414 ?auto_318417 ) ) ( not ( = ?auto_318414 ?auto_318418 ) ) ( not ( = ?auto_318414 ?auto_318419 ) ) ( not ( = ?auto_318415 ?auto_318416 ) ) ( not ( = ?auto_318415 ?auto_318417 ) ) ( not ( = ?auto_318415 ?auto_318418 ) ) ( not ( = ?auto_318415 ?auto_318419 ) ) ( not ( = ?auto_318416 ?auto_318417 ) ) ( not ( = ?auto_318416 ?auto_318418 ) ) ( not ( = ?auto_318416 ?auto_318419 ) ) ( not ( = ?auto_318417 ?auto_318418 ) ) ( not ( = ?auto_318417 ?auto_318419 ) ) ( not ( = ?auto_318418 ?auto_318419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_318418 ?auto_318419 )
      ( !STACK ?auto_318418 ?auto_318417 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318428 - BLOCK
      ?auto_318429 - BLOCK
      ?auto_318430 - BLOCK
      ?auto_318431 - BLOCK
      ?auto_318432 - BLOCK
      ?auto_318433 - BLOCK
      ?auto_318434 - BLOCK
      ?auto_318435 - BLOCK
    )
    :vars
    (
      ?auto_318436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318435 ?auto_318436 ) ( ON-TABLE ?auto_318428 ) ( ON ?auto_318429 ?auto_318428 ) ( ON ?auto_318430 ?auto_318429 ) ( ON ?auto_318431 ?auto_318430 ) ( ON ?auto_318432 ?auto_318431 ) ( ON ?auto_318433 ?auto_318432 ) ( not ( = ?auto_318428 ?auto_318429 ) ) ( not ( = ?auto_318428 ?auto_318430 ) ) ( not ( = ?auto_318428 ?auto_318431 ) ) ( not ( = ?auto_318428 ?auto_318432 ) ) ( not ( = ?auto_318428 ?auto_318433 ) ) ( not ( = ?auto_318428 ?auto_318434 ) ) ( not ( = ?auto_318428 ?auto_318435 ) ) ( not ( = ?auto_318428 ?auto_318436 ) ) ( not ( = ?auto_318429 ?auto_318430 ) ) ( not ( = ?auto_318429 ?auto_318431 ) ) ( not ( = ?auto_318429 ?auto_318432 ) ) ( not ( = ?auto_318429 ?auto_318433 ) ) ( not ( = ?auto_318429 ?auto_318434 ) ) ( not ( = ?auto_318429 ?auto_318435 ) ) ( not ( = ?auto_318429 ?auto_318436 ) ) ( not ( = ?auto_318430 ?auto_318431 ) ) ( not ( = ?auto_318430 ?auto_318432 ) ) ( not ( = ?auto_318430 ?auto_318433 ) ) ( not ( = ?auto_318430 ?auto_318434 ) ) ( not ( = ?auto_318430 ?auto_318435 ) ) ( not ( = ?auto_318430 ?auto_318436 ) ) ( not ( = ?auto_318431 ?auto_318432 ) ) ( not ( = ?auto_318431 ?auto_318433 ) ) ( not ( = ?auto_318431 ?auto_318434 ) ) ( not ( = ?auto_318431 ?auto_318435 ) ) ( not ( = ?auto_318431 ?auto_318436 ) ) ( not ( = ?auto_318432 ?auto_318433 ) ) ( not ( = ?auto_318432 ?auto_318434 ) ) ( not ( = ?auto_318432 ?auto_318435 ) ) ( not ( = ?auto_318432 ?auto_318436 ) ) ( not ( = ?auto_318433 ?auto_318434 ) ) ( not ( = ?auto_318433 ?auto_318435 ) ) ( not ( = ?auto_318433 ?auto_318436 ) ) ( not ( = ?auto_318434 ?auto_318435 ) ) ( not ( = ?auto_318434 ?auto_318436 ) ) ( not ( = ?auto_318435 ?auto_318436 ) ) ( CLEAR ?auto_318433 ) ( ON ?auto_318434 ?auto_318435 ) ( CLEAR ?auto_318434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_318428 ?auto_318429 ?auto_318430 ?auto_318431 ?auto_318432 ?auto_318433 ?auto_318434 )
      ( MAKE-8PILE ?auto_318428 ?auto_318429 ?auto_318430 ?auto_318431 ?auto_318432 ?auto_318433 ?auto_318434 ?auto_318435 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318445 - BLOCK
      ?auto_318446 - BLOCK
      ?auto_318447 - BLOCK
      ?auto_318448 - BLOCK
      ?auto_318449 - BLOCK
      ?auto_318450 - BLOCK
      ?auto_318451 - BLOCK
      ?auto_318452 - BLOCK
    )
    :vars
    (
      ?auto_318453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318452 ?auto_318453 ) ( ON-TABLE ?auto_318445 ) ( ON ?auto_318446 ?auto_318445 ) ( ON ?auto_318447 ?auto_318446 ) ( ON ?auto_318448 ?auto_318447 ) ( ON ?auto_318449 ?auto_318448 ) ( ON ?auto_318450 ?auto_318449 ) ( not ( = ?auto_318445 ?auto_318446 ) ) ( not ( = ?auto_318445 ?auto_318447 ) ) ( not ( = ?auto_318445 ?auto_318448 ) ) ( not ( = ?auto_318445 ?auto_318449 ) ) ( not ( = ?auto_318445 ?auto_318450 ) ) ( not ( = ?auto_318445 ?auto_318451 ) ) ( not ( = ?auto_318445 ?auto_318452 ) ) ( not ( = ?auto_318445 ?auto_318453 ) ) ( not ( = ?auto_318446 ?auto_318447 ) ) ( not ( = ?auto_318446 ?auto_318448 ) ) ( not ( = ?auto_318446 ?auto_318449 ) ) ( not ( = ?auto_318446 ?auto_318450 ) ) ( not ( = ?auto_318446 ?auto_318451 ) ) ( not ( = ?auto_318446 ?auto_318452 ) ) ( not ( = ?auto_318446 ?auto_318453 ) ) ( not ( = ?auto_318447 ?auto_318448 ) ) ( not ( = ?auto_318447 ?auto_318449 ) ) ( not ( = ?auto_318447 ?auto_318450 ) ) ( not ( = ?auto_318447 ?auto_318451 ) ) ( not ( = ?auto_318447 ?auto_318452 ) ) ( not ( = ?auto_318447 ?auto_318453 ) ) ( not ( = ?auto_318448 ?auto_318449 ) ) ( not ( = ?auto_318448 ?auto_318450 ) ) ( not ( = ?auto_318448 ?auto_318451 ) ) ( not ( = ?auto_318448 ?auto_318452 ) ) ( not ( = ?auto_318448 ?auto_318453 ) ) ( not ( = ?auto_318449 ?auto_318450 ) ) ( not ( = ?auto_318449 ?auto_318451 ) ) ( not ( = ?auto_318449 ?auto_318452 ) ) ( not ( = ?auto_318449 ?auto_318453 ) ) ( not ( = ?auto_318450 ?auto_318451 ) ) ( not ( = ?auto_318450 ?auto_318452 ) ) ( not ( = ?auto_318450 ?auto_318453 ) ) ( not ( = ?auto_318451 ?auto_318452 ) ) ( not ( = ?auto_318451 ?auto_318453 ) ) ( not ( = ?auto_318452 ?auto_318453 ) ) ( CLEAR ?auto_318450 ) ( ON ?auto_318451 ?auto_318452 ) ( CLEAR ?auto_318451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_318445 ?auto_318446 ?auto_318447 ?auto_318448 ?auto_318449 ?auto_318450 ?auto_318451 )
      ( MAKE-8PILE ?auto_318445 ?auto_318446 ?auto_318447 ?auto_318448 ?auto_318449 ?auto_318450 ?auto_318451 ?auto_318452 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318462 - BLOCK
      ?auto_318463 - BLOCK
      ?auto_318464 - BLOCK
      ?auto_318465 - BLOCK
      ?auto_318466 - BLOCK
      ?auto_318467 - BLOCK
      ?auto_318468 - BLOCK
      ?auto_318469 - BLOCK
    )
    :vars
    (
      ?auto_318470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318469 ?auto_318470 ) ( ON-TABLE ?auto_318462 ) ( ON ?auto_318463 ?auto_318462 ) ( ON ?auto_318464 ?auto_318463 ) ( ON ?auto_318465 ?auto_318464 ) ( ON ?auto_318466 ?auto_318465 ) ( not ( = ?auto_318462 ?auto_318463 ) ) ( not ( = ?auto_318462 ?auto_318464 ) ) ( not ( = ?auto_318462 ?auto_318465 ) ) ( not ( = ?auto_318462 ?auto_318466 ) ) ( not ( = ?auto_318462 ?auto_318467 ) ) ( not ( = ?auto_318462 ?auto_318468 ) ) ( not ( = ?auto_318462 ?auto_318469 ) ) ( not ( = ?auto_318462 ?auto_318470 ) ) ( not ( = ?auto_318463 ?auto_318464 ) ) ( not ( = ?auto_318463 ?auto_318465 ) ) ( not ( = ?auto_318463 ?auto_318466 ) ) ( not ( = ?auto_318463 ?auto_318467 ) ) ( not ( = ?auto_318463 ?auto_318468 ) ) ( not ( = ?auto_318463 ?auto_318469 ) ) ( not ( = ?auto_318463 ?auto_318470 ) ) ( not ( = ?auto_318464 ?auto_318465 ) ) ( not ( = ?auto_318464 ?auto_318466 ) ) ( not ( = ?auto_318464 ?auto_318467 ) ) ( not ( = ?auto_318464 ?auto_318468 ) ) ( not ( = ?auto_318464 ?auto_318469 ) ) ( not ( = ?auto_318464 ?auto_318470 ) ) ( not ( = ?auto_318465 ?auto_318466 ) ) ( not ( = ?auto_318465 ?auto_318467 ) ) ( not ( = ?auto_318465 ?auto_318468 ) ) ( not ( = ?auto_318465 ?auto_318469 ) ) ( not ( = ?auto_318465 ?auto_318470 ) ) ( not ( = ?auto_318466 ?auto_318467 ) ) ( not ( = ?auto_318466 ?auto_318468 ) ) ( not ( = ?auto_318466 ?auto_318469 ) ) ( not ( = ?auto_318466 ?auto_318470 ) ) ( not ( = ?auto_318467 ?auto_318468 ) ) ( not ( = ?auto_318467 ?auto_318469 ) ) ( not ( = ?auto_318467 ?auto_318470 ) ) ( not ( = ?auto_318468 ?auto_318469 ) ) ( not ( = ?auto_318468 ?auto_318470 ) ) ( not ( = ?auto_318469 ?auto_318470 ) ) ( ON ?auto_318468 ?auto_318469 ) ( CLEAR ?auto_318466 ) ( ON ?auto_318467 ?auto_318468 ) ( CLEAR ?auto_318467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_318462 ?auto_318463 ?auto_318464 ?auto_318465 ?auto_318466 ?auto_318467 )
      ( MAKE-8PILE ?auto_318462 ?auto_318463 ?auto_318464 ?auto_318465 ?auto_318466 ?auto_318467 ?auto_318468 ?auto_318469 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318479 - BLOCK
      ?auto_318480 - BLOCK
      ?auto_318481 - BLOCK
      ?auto_318482 - BLOCK
      ?auto_318483 - BLOCK
      ?auto_318484 - BLOCK
      ?auto_318485 - BLOCK
      ?auto_318486 - BLOCK
    )
    :vars
    (
      ?auto_318487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318486 ?auto_318487 ) ( ON-TABLE ?auto_318479 ) ( ON ?auto_318480 ?auto_318479 ) ( ON ?auto_318481 ?auto_318480 ) ( ON ?auto_318482 ?auto_318481 ) ( ON ?auto_318483 ?auto_318482 ) ( not ( = ?auto_318479 ?auto_318480 ) ) ( not ( = ?auto_318479 ?auto_318481 ) ) ( not ( = ?auto_318479 ?auto_318482 ) ) ( not ( = ?auto_318479 ?auto_318483 ) ) ( not ( = ?auto_318479 ?auto_318484 ) ) ( not ( = ?auto_318479 ?auto_318485 ) ) ( not ( = ?auto_318479 ?auto_318486 ) ) ( not ( = ?auto_318479 ?auto_318487 ) ) ( not ( = ?auto_318480 ?auto_318481 ) ) ( not ( = ?auto_318480 ?auto_318482 ) ) ( not ( = ?auto_318480 ?auto_318483 ) ) ( not ( = ?auto_318480 ?auto_318484 ) ) ( not ( = ?auto_318480 ?auto_318485 ) ) ( not ( = ?auto_318480 ?auto_318486 ) ) ( not ( = ?auto_318480 ?auto_318487 ) ) ( not ( = ?auto_318481 ?auto_318482 ) ) ( not ( = ?auto_318481 ?auto_318483 ) ) ( not ( = ?auto_318481 ?auto_318484 ) ) ( not ( = ?auto_318481 ?auto_318485 ) ) ( not ( = ?auto_318481 ?auto_318486 ) ) ( not ( = ?auto_318481 ?auto_318487 ) ) ( not ( = ?auto_318482 ?auto_318483 ) ) ( not ( = ?auto_318482 ?auto_318484 ) ) ( not ( = ?auto_318482 ?auto_318485 ) ) ( not ( = ?auto_318482 ?auto_318486 ) ) ( not ( = ?auto_318482 ?auto_318487 ) ) ( not ( = ?auto_318483 ?auto_318484 ) ) ( not ( = ?auto_318483 ?auto_318485 ) ) ( not ( = ?auto_318483 ?auto_318486 ) ) ( not ( = ?auto_318483 ?auto_318487 ) ) ( not ( = ?auto_318484 ?auto_318485 ) ) ( not ( = ?auto_318484 ?auto_318486 ) ) ( not ( = ?auto_318484 ?auto_318487 ) ) ( not ( = ?auto_318485 ?auto_318486 ) ) ( not ( = ?auto_318485 ?auto_318487 ) ) ( not ( = ?auto_318486 ?auto_318487 ) ) ( ON ?auto_318485 ?auto_318486 ) ( CLEAR ?auto_318483 ) ( ON ?auto_318484 ?auto_318485 ) ( CLEAR ?auto_318484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_318479 ?auto_318480 ?auto_318481 ?auto_318482 ?auto_318483 ?auto_318484 )
      ( MAKE-8PILE ?auto_318479 ?auto_318480 ?auto_318481 ?auto_318482 ?auto_318483 ?auto_318484 ?auto_318485 ?auto_318486 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318496 - BLOCK
      ?auto_318497 - BLOCK
      ?auto_318498 - BLOCK
      ?auto_318499 - BLOCK
      ?auto_318500 - BLOCK
      ?auto_318501 - BLOCK
      ?auto_318502 - BLOCK
      ?auto_318503 - BLOCK
    )
    :vars
    (
      ?auto_318504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318503 ?auto_318504 ) ( ON-TABLE ?auto_318496 ) ( ON ?auto_318497 ?auto_318496 ) ( ON ?auto_318498 ?auto_318497 ) ( ON ?auto_318499 ?auto_318498 ) ( not ( = ?auto_318496 ?auto_318497 ) ) ( not ( = ?auto_318496 ?auto_318498 ) ) ( not ( = ?auto_318496 ?auto_318499 ) ) ( not ( = ?auto_318496 ?auto_318500 ) ) ( not ( = ?auto_318496 ?auto_318501 ) ) ( not ( = ?auto_318496 ?auto_318502 ) ) ( not ( = ?auto_318496 ?auto_318503 ) ) ( not ( = ?auto_318496 ?auto_318504 ) ) ( not ( = ?auto_318497 ?auto_318498 ) ) ( not ( = ?auto_318497 ?auto_318499 ) ) ( not ( = ?auto_318497 ?auto_318500 ) ) ( not ( = ?auto_318497 ?auto_318501 ) ) ( not ( = ?auto_318497 ?auto_318502 ) ) ( not ( = ?auto_318497 ?auto_318503 ) ) ( not ( = ?auto_318497 ?auto_318504 ) ) ( not ( = ?auto_318498 ?auto_318499 ) ) ( not ( = ?auto_318498 ?auto_318500 ) ) ( not ( = ?auto_318498 ?auto_318501 ) ) ( not ( = ?auto_318498 ?auto_318502 ) ) ( not ( = ?auto_318498 ?auto_318503 ) ) ( not ( = ?auto_318498 ?auto_318504 ) ) ( not ( = ?auto_318499 ?auto_318500 ) ) ( not ( = ?auto_318499 ?auto_318501 ) ) ( not ( = ?auto_318499 ?auto_318502 ) ) ( not ( = ?auto_318499 ?auto_318503 ) ) ( not ( = ?auto_318499 ?auto_318504 ) ) ( not ( = ?auto_318500 ?auto_318501 ) ) ( not ( = ?auto_318500 ?auto_318502 ) ) ( not ( = ?auto_318500 ?auto_318503 ) ) ( not ( = ?auto_318500 ?auto_318504 ) ) ( not ( = ?auto_318501 ?auto_318502 ) ) ( not ( = ?auto_318501 ?auto_318503 ) ) ( not ( = ?auto_318501 ?auto_318504 ) ) ( not ( = ?auto_318502 ?auto_318503 ) ) ( not ( = ?auto_318502 ?auto_318504 ) ) ( not ( = ?auto_318503 ?auto_318504 ) ) ( ON ?auto_318502 ?auto_318503 ) ( ON ?auto_318501 ?auto_318502 ) ( CLEAR ?auto_318499 ) ( ON ?auto_318500 ?auto_318501 ) ( CLEAR ?auto_318500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_318496 ?auto_318497 ?auto_318498 ?auto_318499 ?auto_318500 )
      ( MAKE-8PILE ?auto_318496 ?auto_318497 ?auto_318498 ?auto_318499 ?auto_318500 ?auto_318501 ?auto_318502 ?auto_318503 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318513 - BLOCK
      ?auto_318514 - BLOCK
      ?auto_318515 - BLOCK
      ?auto_318516 - BLOCK
      ?auto_318517 - BLOCK
      ?auto_318518 - BLOCK
      ?auto_318519 - BLOCK
      ?auto_318520 - BLOCK
    )
    :vars
    (
      ?auto_318521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318520 ?auto_318521 ) ( ON-TABLE ?auto_318513 ) ( ON ?auto_318514 ?auto_318513 ) ( ON ?auto_318515 ?auto_318514 ) ( ON ?auto_318516 ?auto_318515 ) ( not ( = ?auto_318513 ?auto_318514 ) ) ( not ( = ?auto_318513 ?auto_318515 ) ) ( not ( = ?auto_318513 ?auto_318516 ) ) ( not ( = ?auto_318513 ?auto_318517 ) ) ( not ( = ?auto_318513 ?auto_318518 ) ) ( not ( = ?auto_318513 ?auto_318519 ) ) ( not ( = ?auto_318513 ?auto_318520 ) ) ( not ( = ?auto_318513 ?auto_318521 ) ) ( not ( = ?auto_318514 ?auto_318515 ) ) ( not ( = ?auto_318514 ?auto_318516 ) ) ( not ( = ?auto_318514 ?auto_318517 ) ) ( not ( = ?auto_318514 ?auto_318518 ) ) ( not ( = ?auto_318514 ?auto_318519 ) ) ( not ( = ?auto_318514 ?auto_318520 ) ) ( not ( = ?auto_318514 ?auto_318521 ) ) ( not ( = ?auto_318515 ?auto_318516 ) ) ( not ( = ?auto_318515 ?auto_318517 ) ) ( not ( = ?auto_318515 ?auto_318518 ) ) ( not ( = ?auto_318515 ?auto_318519 ) ) ( not ( = ?auto_318515 ?auto_318520 ) ) ( not ( = ?auto_318515 ?auto_318521 ) ) ( not ( = ?auto_318516 ?auto_318517 ) ) ( not ( = ?auto_318516 ?auto_318518 ) ) ( not ( = ?auto_318516 ?auto_318519 ) ) ( not ( = ?auto_318516 ?auto_318520 ) ) ( not ( = ?auto_318516 ?auto_318521 ) ) ( not ( = ?auto_318517 ?auto_318518 ) ) ( not ( = ?auto_318517 ?auto_318519 ) ) ( not ( = ?auto_318517 ?auto_318520 ) ) ( not ( = ?auto_318517 ?auto_318521 ) ) ( not ( = ?auto_318518 ?auto_318519 ) ) ( not ( = ?auto_318518 ?auto_318520 ) ) ( not ( = ?auto_318518 ?auto_318521 ) ) ( not ( = ?auto_318519 ?auto_318520 ) ) ( not ( = ?auto_318519 ?auto_318521 ) ) ( not ( = ?auto_318520 ?auto_318521 ) ) ( ON ?auto_318519 ?auto_318520 ) ( ON ?auto_318518 ?auto_318519 ) ( CLEAR ?auto_318516 ) ( ON ?auto_318517 ?auto_318518 ) ( CLEAR ?auto_318517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_318513 ?auto_318514 ?auto_318515 ?auto_318516 ?auto_318517 )
      ( MAKE-8PILE ?auto_318513 ?auto_318514 ?auto_318515 ?auto_318516 ?auto_318517 ?auto_318518 ?auto_318519 ?auto_318520 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318530 - BLOCK
      ?auto_318531 - BLOCK
      ?auto_318532 - BLOCK
      ?auto_318533 - BLOCK
      ?auto_318534 - BLOCK
      ?auto_318535 - BLOCK
      ?auto_318536 - BLOCK
      ?auto_318537 - BLOCK
    )
    :vars
    (
      ?auto_318538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318537 ?auto_318538 ) ( ON-TABLE ?auto_318530 ) ( ON ?auto_318531 ?auto_318530 ) ( ON ?auto_318532 ?auto_318531 ) ( not ( = ?auto_318530 ?auto_318531 ) ) ( not ( = ?auto_318530 ?auto_318532 ) ) ( not ( = ?auto_318530 ?auto_318533 ) ) ( not ( = ?auto_318530 ?auto_318534 ) ) ( not ( = ?auto_318530 ?auto_318535 ) ) ( not ( = ?auto_318530 ?auto_318536 ) ) ( not ( = ?auto_318530 ?auto_318537 ) ) ( not ( = ?auto_318530 ?auto_318538 ) ) ( not ( = ?auto_318531 ?auto_318532 ) ) ( not ( = ?auto_318531 ?auto_318533 ) ) ( not ( = ?auto_318531 ?auto_318534 ) ) ( not ( = ?auto_318531 ?auto_318535 ) ) ( not ( = ?auto_318531 ?auto_318536 ) ) ( not ( = ?auto_318531 ?auto_318537 ) ) ( not ( = ?auto_318531 ?auto_318538 ) ) ( not ( = ?auto_318532 ?auto_318533 ) ) ( not ( = ?auto_318532 ?auto_318534 ) ) ( not ( = ?auto_318532 ?auto_318535 ) ) ( not ( = ?auto_318532 ?auto_318536 ) ) ( not ( = ?auto_318532 ?auto_318537 ) ) ( not ( = ?auto_318532 ?auto_318538 ) ) ( not ( = ?auto_318533 ?auto_318534 ) ) ( not ( = ?auto_318533 ?auto_318535 ) ) ( not ( = ?auto_318533 ?auto_318536 ) ) ( not ( = ?auto_318533 ?auto_318537 ) ) ( not ( = ?auto_318533 ?auto_318538 ) ) ( not ( = ?auto_318534 ?auto_318535 ) ) ( not ( = ?auto_318534 ?auto_318536 ) ) ( not ( = ?auto_318534 ?auto_318537 ) ) ( not ( = ?auto_318534 ?auto_318538 ) ) ( not ( = ?auto_318535 ?auto_318536 ) ) ( not ( = ?auto_318535 ?auto_318537 ) ) ( not ( = ?auto_318535 ?auto_318538 ) ) ( not ( = ?auto_318536 ?auto_318537 ) ) ( not ( = ?auto_318536 ?auto_318538 ) ) ( not ( = ?auto_318537 ?auto_318538 ) ) ( ON ?auto_318536 ?auto_318537 ) ( ON ?auto_318535 ?auto_318536 ) ( ON ?auto_318534 ?auto_318535 ) ( CLEAR ?auto_318532 ) ( ON ?auto_318533 ?auto_318534 ) ( CLEAR ?auto_318533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_318530 ?auto_318531 ?auto_318532 ?auto_318533 )
      ( MAKE-8PILE ?auto_318530 ?auto_318531 ?auto_318532 ?auto_318533 ?auto_318534 ?auto_318535 ?auto_318536 ?auto_318537 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318547 - BLOCK
      ?auto_318548 - BLOCK
      ?auto_318549 - BLOCK
      ?auto_318550 - BLOCK
      ?auto_318551 - BLOCK
      ?auto_318552 - BLOCK
      ?auto_318553 - BLOCK
      ?auto_318554 - BLOCK
    )
    :vars
    (
      ?auto_318555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318554 ?auto_318555 ) ( ON-TABLE ?auto_318547 ) ( ON ?auto_318548 ?auto_318547 ) ( ON ?auto_318549 ?auto_318548 ) ( not ( = ?auto_318547 ?auto_318548 ) ) ( not ( = ?auto_318547 ?auto_318549 ) ) ( not ( = ?auto_318547 ?auto_318550 ) ) ( not ( = ?auto_318547 ?auto_318551 ) ) ( not ( = ?auto_318547 ?auto_318552 ) ) ( not ( = ?auto_318547 ?auto_318553 ) ) ( not ( = ?auto_318547 ?auto_318554 ) ) ( not ( = ?auto_318547 ?auto_318555 ) ) ( not ( = ?auto_318548 ?auto_318549 ) ) ( not ( = ?auto_318548 ?auto_318550 ) ) ( not ( = ?auto_318548 ?auto_318551 ) ) ( not ( = ?auto_318548 ?auto_318552 ) ) ( not ( = ?auto_318548 ?auto_318553 ) ) ( not ( = ?auto_318548 ?auto_318554 ) ) ( not ( = ?auto_318548 ?auto_318555 ) ) ( not ( = ?auto_318549 ?auto_318550 ) ) ( not ( = ?auto_318549 ?auto_318551 ) ) ( not ( = ?auto_318549 ?auto_318552 ) ) ( not ( = ?auto_318549 ?auto_318553 ) ) ( not ( = ?auto_318549 ?auto_318554 ) ) ( not ( = ?auto_318549 ?auto_318555 ) ) ( not ( = ?auto_318550 ?auto_318551 ) ) ( not ( = ?auto_318550 ?auto_318552 ) ) ( not ( = ?auto_318550 ?auto_318553 ) ) ( not ( = ?auto_318550 ?auto_318554 ) ) ( not ( = ?auto_318550 ?auto_318555 ) ) ( not ( = ?auto_318551 ?auto_318552 ) ) ( not ( = ?auto_318551 ?auto_318553 ) ) ( not ( = ?auto_318551 ?auto_318554 ) ) ( not ( = ?auto_318551 ?auto_318555 ) ) ( not ( = ?auto_318552 ?auto_318553 ) ) ( not ( = ?auto_318552 ?auto_318554 ) ) ( not ( = ?auto_318552 ?auto_318555 ) ) ( not ( = ?auto_318553 ?auto_318554 ) ) ( not ( = ?auto_318553 ?auto_318555 ) ) ( not ( = ?auto_318554 ?auto_318555 ) ) ( ON ?auto_318553 ?auto_318554 ) ( ON ?auto_318552 ?auto_318553 ) ( ON ?auto_318551 ?auto_318552 ) ( CLEAR ?auto_318549 ) ( ON ?auto_318550 ?auto_318551 ) ( CLEAR ?auto_318550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_318547 ?auto_318548 ?auto_318549 ?auto_318550 )
      ( MAKE-8PILE ?auto_318547 ?auto_318548 ?auto_318549 ?auto_318550 ?auto_318551 ?auto_318552 ?auto_318553 ?auto_318554 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318564 - BLOCK
      ?auto_318565 - BLOCK
      ?auto_318566 - BLOCK
      ?auto_318567 - BLOCK
      ?auto_318568 - BLOCK
      ?auto_318569 - BLOCK
      ?auto_318570 - BLOCK
      ?auto_318571 - BLOCK
    )
    :vars
    (
      ?auto_318572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318571 ?auto_318572 ) ( ON-TABLE ?auto_318564 ) ( ON ?auto_318565 ?auto_318564 ) ( not ( = ?auto_318564 ?auto_318565 ) ) ( not ( = ?auto_318564 ?auto_318566 ) ) ( not ( = ?auto_318564 ?auto_318567 ) ) ( not ( = ?auto_318564 ?auto_318568 ) ) ( not ( = ?auto_318564 ?auto_318569 ) ) ( not ( = ?auto_318564 ?auto_318570 ) ) ( not ( = ?auto_318564 ?auto_318571 ) ) ( not ( = ?auto_318564 ?auto_318572 ) ) ( not ( = ?auto_318565 ?auto_318566 ) ) ( not ( = ?auto_318565 ?auto_318567 ) ) ( not ( = ?auto_318565 ?auto_318568 ) ) ( not ( = ?auto_318565 ?auto_318569 ) ) ( not ( = ?auto_318565 ?auto_318570 ) ) ( not ( = ?auto_318565 ?auto_318571 ) ) ( not ( = ?auto_318565 ?auto_318572 ) ) ( not ( = ?auto_318566 ?auto_318567 ) ) ( not ( = ?auto_318566 ?auto_318568 ) ) ( not ( = ?auto_318566 ?auto_318569 ) ) ( not ( = ?auto_318566 ?auto_318570 ) ) ( not ( = ?auto_318566 ?auto_318571 ) ) ( not ( = ?auto_318566 ?auto_318572 ) ) ( not ( = ?auto_318567 ?auto_318568 ) ) ( not ( = ?auto_318567 ?auto_318569 ) ) ( not ( = ?auto_318567 ?auto_318570 ) ) ( not ( = ?auto_318567 ?auto_318571 ) ) ( not ( = ?auto_318567 ?auto_318572 ) ) ( not ( = ?auto_318568 ?auto_318569 ) ) ( not ( = ?auto_318568 ?auto_318570 ) ) ( not ( = ?auto_318568 ?auto_318571 ) ) ( not ( = ?auto_318568 ?auto_318572 ) ) ( not ( = ?auto_318569 ?auto_318570 ) ) ( not ( = ?auto_318569 ?auto_318571 ) ) ( not ( = ?auto_318569 ?auto_318572 ) ) ( not ( = ?auto_318570 ?auto_318571 ) ) ( not ( = ?auto_318570 ?auto_318572 ) ) ( not ( = ?auto_318571 ?auto_318572 ) ) ( ON ?auto_318570 ?auto_318571 ) ( ON ?auto_318569 ?auto_318570 ) ( ON ?auto_318568 ?auto_318569 ) ( ON ?auto_318567 ?auto_318568 ) ( CLEAR ?auto_318565 ) ( ON ?auto_318566 ?auto_318567 ) ( CLEAR ?auto_318566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_318564 ?auto_318565 ?auto_318566 )
      ( MAKE-8PILE ?auto_318564 ?auto_318565 ?auto_318566 ?auto_318567 ?auto_318568 ?auto_318569 ?auto_318570 ?auto_318571 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318581 - BLOCK
      ?auto_318582 - BLOCK
      ?auto_318583 - BLOCK
      ?auto_318584 - BLOCK
      ?auto_318585 - BLOCK
      ?auto_318586 - BLOCK
      ?auto_318587 - BLOCK
      ?auto_318588 - BLOCK
    )
    :vars
    (
      ?auto_318589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318588 ?auto_318589 ) ( ON-TABLE ?auto_318581 ) ( ON ?auto_318582 ?auto_318581 ) ( not ( = ?auto_318581 ?auto_318582 ) ) ( not ( = ?auto_318581 ?auto_318583 ) ) ( not ( = ?auto_318581 ?auto_318584 ) ) ( not ( = ?auto_318581 ?auto_318585 ) ) ( not ( = ?auto_318581 ?auto_318586 ) ) ( not ( = ?auto_318581 ?auto_318587 ) ) ( not ( = ?auto_318581 ?auto_318588 ) ) ( not ( = ?auto_318581 ?auto_318589 ) ) ( not ( = ?auto_318582 ?auto_318583 ) ) ( not ( = ?auto_318582 ?auto_318584 ) ) ( not ( = ?auto_318582 ?auto_318585 ) ) ( not ( = ?auto_318582 ?auto_318586 ) ) ( not ( = ?auto_318582 ?auto_318587 ) ) ( not ( = ?auto_318582 ?auto_318588 ) ) ( not ( = ?auto_318582 ?auto_318589 ) ) ( not ( = ?auto_318583 ?auto_318584 ) ) ( not ( = ?auto_318583 ?auto_318585 ) ) ( not ( = ?auto_318583 ?auto_318586 ) ) ( not ( = ?auto_318583 ?auto_318587 ) ) ( not ( = ?auto_318583 ?auto_318588 ) ) ( not ( = ?auto_318583 ?auto_318589 ) ) ( not ( = ?auto_318584 ?auto_318585 ) ) ( not ( = ?auto_318584 ?auto_318586 ) ) ( not ( = ?auto_318584 ?auto_318587 ) ) ( not ( = ?auto_318584 ?auto_318588 ) ) ( not ( = ?auto_318584 ?auto_318589 ) ) ( not ( = ?auto_318585 ?auto_318586 ) ) ( not ( = ?auto_318585 ?auto_318587 ) ) ( not ( = ?auto_318585 ?auto_318588 ) ) ( not ( = ?auto_318585 ?auto_318589 ) ) ( not ( = ?auto_318586 ?auto_318587 ) ) ( not ( = ?auto_318586 ?auto_318588 ) ) ( not ( = ?auto_318586 ?auto_318589 ) ) ( not ( = ?auto_318587 ?auto_318588 ) ) ( not ( = ?auto_318587 ?auto_318589 ) ) ( not ( = ?auto_318588 ?auto_318589 ) ) ( ON ?auto_318587 ?auto_318588 ) ( ON ?auto_318586 ?auto_318587 ) ( ON ?auto_318585 ?auto_318586 ) ( ON ?auto_318584 ?auto_318585 ) ( CLEAR ?auto_318582 ) ( ON ?auto_318583 ?auto_318584 ) ( CLEAR ?auto_318583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_318581 ?auto_318582 ?auto_318583 )
      ( MAKE-8PILE ?auto_318581 ?auto_318582 ?auto_318583 ?auto_318584 ?auto_318585 ?auto_318586 ?auto_318587 ?auto_318588 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318598 - BLOCK
      ?auto_318599 - BLOCK
      ?auto_318600 - BLOCK
      ?auto_318601 - BLOCK
      ?auto_318602 - BLOCK
      ?auto_318603 - BLOCK
      ?auto_318604 - BLOCK
      ?auto_318605 - BLOCK
    )
    :vars
    (
      ?auto_318606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318605 ?auto_318606 ) ( ON-TABLE ?auto_318598 ) ( not ( = ?auto_318598 ?auto_318599 ) ) ( not ( = ?auto_318598 ?auto_318600 ) ) ( not ( = ?auto_318598 ?auto_318601 ) ) ( not ( = ?auto_318598 ?auto_318602 ) ) ( not ( = ?auto_318598 ?auto_318603 ) ) ( not ( = ?auto_318598 ?auto_318604 ) ) ( not ( = ?auto_318598 ?auto_318605 ) ) ( not ( = ?auto_318598 ?auto_318606 ) ) ( not ( = ?auto_318599 ?auto_318600 ) ) ( not ( = ?auto_318599 ?auto_318601 ) ) ( not ( = ?auto_318599 ?auto_318602 ) ) ( not ( = ?auto_318599 ?auto_318603 ) ) ( not ( = ?auto_318599 ?auto_318604 ) ) ( not ( = ?auto_318599 ?auto_318605 ) ) ( not ( = ?auto_318599 ?auto_318606 ) ) ( not ( = ?auto_318600 ?auto_318601 ) ) ( not ( = ?auto_318600 ?auto_318602 ) ) ( not ( = ?auto_318600 ?auto_318603 ) ) ( not ( = ?auto_318600 ?auto_318604 ) ) ( not ( = ?auto_318600 ?auto_318605 ) ) ( not ( = ?auto_318600 ?auto_318606 ) ) ( not ( = ?auto_318601 ?auto_318602 ) ) ( not ( = ?auto_318601 ?auto_318603 ) ) ( not ( = ?auto_318601 ?auto_318604 ) ) ( not ( = ?auto_318601 ?auto_318605 ) ) ( not ( = ?auto_318601 ?auto_318606 ) ) ( not ( = ?auto_318602 ?auto_318603 ) ) ( not ( = ?auto_318602 ?auto_318604 ) ) ( not ( = ?auto_318602 ?auto_318605 ) ) ( not ( = ?auto_318602 ?auto_318606 ) ) ( not ( = ?auto_318603 ?auto_318604 ) ) ( not ( = ?auto_318603 ?auto_318605 ) ) ( not ( = ?auto_318603 ?auto_318606 ) ) ( not ( = ?auto_318604 ?auto_318605 ) ) ( not ( = ?auto_318604 ?auto_318606 ) ) ( not ( = ?auto_318605 ?auto_318606 ) ) ( ON ?auto_318604 ?auto_318605 ) ( ON ?auto_318603 ?auto_318604 ) ( ON ?auto_318602 ?auto_318603 ) ( ON ?auto_318601 ?auto_318602 ) ( ON ?auto_318600 ?auto_318601 ) ( CLEAR ?auto_318598 ) ( ON ?auto_318599 ?auto_318600 ) ( CLEAR ?auto_318599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_318598 ?auto_318599 )
      ( MAKE-8PILE ?auto_318598 ?auto_318599 ?auto_318600 ?auto_318601 ?auto_318602 ?auto_318603 ?auto_318604 ?auto_318605 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318615 - BLOCK
      ?auto_318616 - BLOCK
      ?auto_318617 - BLOCK
      ?auto_318618 - BLOCK
      ?auto_318619 - BLOCK
      ?auto_318620 - BLOCK
      ?auto_318621 - BLOCK
      ?auto_318622 - BLOCK
    )
    :vars
    (
      ?auto_318623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318622 ?auto_318623 ) ( ON-TABLE ?auto_318615 ) ( not ( = ?auto_318615 ?auto_318616 ) ) ( not ( = ?auto_318615 ?auto_318617 ) ) ( not ( = ?auto_318615 ?auto_318618 ) ) ( not ( = ?auto_318615 ?auto_318619 ) ) ( not ( = ?auto_318615 ?auto_318620 ) ) ( not ( = ?auto_318615 ?auto_318621 ) ) ( not ( = ?auto_318615 ?auto_318622 ) ) ( not ( = ?auto_318615 ?auto_318623 ) ) ( not ( = ?auto_318616 ?auto_318617 ) ) ( not ( = ?auto_318616 ?auto_318618 ) ) ( not ( = ?auto_318616 ?auto_318619 ) ) ( not ( = ?auto_318616 ?auto_318620 ) ) ( not ( = ?auto_318616 ?auto_318621 ) ) ( not ( = ?auto_318616 ?auto_318622 ) ) ( not ( = ?auto_318616 ?auto_318623 ) ) ( not ( = ?auto_318617 ?auto_318618 ) ) ( not ( = ?auto_318617 ?auto_318619 ) ) ( not ( = ?auto_318617 ?auto_318620 ) ) ( not ( = ?auto_318617 ?auto_318621 ) ) ( not ( = ?auto_318617 ?auto_318622 ) ) ( not ( = ?auto_318617 ?auto_318623 ) ) ( not ( = ?auto_318618 ?auto_318619 ) ) ( not ( = ?auto_318618 ?auto_318620 ) ) ( not ( = ?auto_318618 ?auto_318621 ) ) ( not ( = ?auto_318618 ?auto_318622 ) ) ( not ( = ?auto_318618 ?auto_318623 ) ) ( not ( = ?auto_318619 ?auto_318620 ) ) ( not ( = ?auto_318619 ?auto_318621 ) ) ( not ( = ?auto_318619 ?auto_318622 ) ) ( not ( = ?auto_318619 ?auto_318623 ) ) ( not ( = ?auto_318620 ?auto_318621 ) ) ( not ( = ?auto_318620 ?auto_318622 ) ) ( not ( = ?auto_318620 ?auto_318623 ) ) ( not ( = ?auto_318621 ?auto_318622 ) ) ( not ( = ?auto_318621 ?auto_318623 ) ) ( not ( = ?auto_318622 ?auto_318623 ) ) ( ON ?auto_318621 ?auto_318622 ) ( ON ?auto_318620 ?auto_318621 ) ( ON ?auto_318619 ?auto_318620 ) ( ON ?auto_318618 ?auto_318619 ) ( ON ?auto_318617 ?auto_318618 ) ( CLEAR ?auto_318615 ) ( ON ?auto_318616 ?auto_318617 ) ( CLEAR ?auto_318616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_318615 ?auto_318616 )
      ( MAKE-8PILE ?auto_318615 ?auto_318616 ?auto_318617 ?auto_318618 ?auto_318619 ?auto_318620 ?auto_318621 ?auto_318622 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318632 - BLOCK
      ?auto_318633 - BLOCK
      ?auto_318634 - BLOCK
      ?auto_318635 - BLOCK
      ?auto_318636 - BLOCK
      ?auto_318637 - BLOCK
      ?auto_318638 - BLOCK
      ?auto_318639 - BLOCK
    )
    :vars
    (
      ?auto_318640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318639 ?auto_318640 ) ( not ( = ?auto_318632 ?auto_318633 ) ) ( not ( = ?auto_318632 ?auto_318634 ) ) ( not ( = ?auto_318632 ?auto_318635 ) ) ( not ( = ?auto_318632 ?auto_318636 ) ) ( not ( = ?auto_318632 ?auto_318637 ) ) ( not ( = ?auto_318632 ?auto_318638 ) ) ( not ( = ?auto_318632 ?auto_318639 ) ) ( not ( = ?auto_318632 ?auto_318640 ) ) ( not ( = ?auto_318633 ?auto_318634 ) ) ( not ( = ?auto_318633 ?auto_318635 ) ) ( not ( = ?auto_318633 ?auto_318636 ) ) ( not ( = ?auto_318633 ?auto_318637 ) ) ( not ( = ?auto_318633 ?auto_318638 ) ) ( not ( = ?auto_318633 ?auto_318639 ) ) ( not ( = ?auto_318633 ?auto_318640 ) ) ( not ( = ?auto_318634 ?auto_318635 ) ) ( not ( = ?auto_318634 ?auto_318636 ) ) ( not ( = ?auto_318634 ?auto_318637 ) ) ( not ( = ?auto_318634 ?auto_318638 ) ) ( not ( = ?auto_318634 ?auto_318639 ) ) ( not ( = ?auto_318634 ?auto_318640 ) ) ( not ( = ?auto_318635 ?auto_318636 ) ) ( not ( = ?auto_318635 ?auto_318637 ) ) ( not ( = ?auto_318635 ?auto_318638 ) ) ( not ( = ?auto_318635 ?auto_318639 ) ) ( not ( = ?auto_318635 ?auto_318640 ) ) ( not ( = ?auto_318636 ?auto_318637 ) ) ( not ( = ?auto_318636 ?auto_318638 ) ) ( not ( = ?auto_318636 ?auto_318639 ) ) ( not ( = ?auto_318636 ?auto_318640 ) ) ( not ( = ?auto_318637 ?auto_318638 ) ) ( not ( = ?auto_318637 ?auto_318639 ) ) ( not ( = ?auto_318637 ?auto_318640 ) ) ( not ( = ?auto_318638 ?auto_318639 ) ) ( not ( = ?auto_318638 ?auto_318640 ) ) ( not ( = ?auto_318639 ?auto_318640 ) ) ( ON ?auto_318638 ?auto_318639 ) ( ON ?auto_318637 ?auto_318638 ) ( ON ?auto_318636 ?auto_318637 ) ( ON ?auto_318635 ?auto_318636 ) ( ON ?auto_318634 ?auto_318635 ) ( ON ?auto_318633 ?auto_318634 ) ( ON ?auto_318632 ?auto_318633 ) ( CLEAR ?auto_318632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318632 )
      ( MAKE-8PILE ?auto_318632 ?auto_318633 ?auto_318634 ?auto_318635 ?auto_318636 ?auto_318637 ?auto_318638 ?auto_318639 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_318649 - BLOCK
      ?auto_318650 - BLOCK
      ?auto_318651 - BLOCK
      ?auto_318652 - BLOCK
      ?auto_318653 - BLOCK
      ?auto_318654 - BLOCK
      ?auto_318655 - BLOCK
      ?auto_318656 - BLOCK
    )
    :vars
    (
      ?auto_318657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318656 ?auto_318657 ) ( not ( = ?auto_318649 ?auto_318650 ) ) ( not ( = ?auto_318649 ?auto_318651 ) ) ( not ( = ?auto_318649 ?auto_318652 ) ) ( not ( = ?auto_318649 ?auto_318653 ) ) ( not ( = ?auto_318649 ?auto_318654 ) ) ( not ( = ?auto_318649 ?auto_318655 ) ) ( not ( = ?auto_318649 ?auto_318656 ) ) ( not ( = ?auto_318649 ?auto_318657 ) ) ( not ( = ?auto_318650 ?auto_318651 ) ) ( not ( = ?auto_318650 ?auto_318652 ) ) ( not ( = ?auto_318650 ?auto_318653 ) ) ( not ( = ?auto_318650 ?auto_318654 ) ) ( not ( = ?auto_318650 ?auto_318655 ) ) ( not ( = ?auto_318650 ?auto_318656 ) ) ( not ( = ?auto_318650 ?auto_318657 ) ) ( not ( = ?auto_318651 ?auto_318652 ) ) ( not ( = ?auto_318651 ?auto_318653 ) ) ( not ( = ?auto_318651 ?auto_318654 ) ) ( not ( = ?auto_318651 ?auto_318655 ) ) ( not ( = ?auto_318651 ?auto_318656 ) ) ( not ( = ?auto_318651 ?auto_318657 ) ) ( not ( = ?auto_318652 ?auto_318653 ) ) ( not ( = ?auto_318652 ?auto_318654 ) ) ( not ( = ?auto_318652 ?auto_318655 ) ) ( not ( = ?auto_318652 ?auto_318656 ) ) ( not ( = ?auto_318652 ?auto_318657 ) ) ( not ( = ?auto_318653 ?auto_318654 ) ) ( not ( = ?auto_318653 ?auto_318655 ) ) ( not ( = ?auto_318653 ?auto_318656 ) ) ( not ( = ?auto_318653 ?auto_318657 ) ) ( not ( = ?auto_318654 ?auto_318655 ) ) ( not ( = ?auto_318654 ?auto_318656 ) ) ( not ( = ?auto_318654 ?auto_318657 ) ) ( not ( = ?auto_318655 ?auto_318656 ) ) ( not ( = ?auto_318655 ?auto_318657 ) ) ( not ( = ?auto_318656 ?auto_318657 ) ) ( ON ?auto_318655 ?auto_318656 ) ( ON ?auto_318654 ?auto_318655 ) ( ON ?auto_318653 ?auto_318654 ) ( ON ?auto_318652 ?auto_318653 ) ( ON ?auto_318651 ?auto_318652 ) ( ON ?auto_318650 ?auto_318651 ) ( ON ?auto_318649 ?auto_318650 ) ( CLEAR ?auto_318649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318649 )
      ( MAKE-8PILE ?auto_318649 ?auto_318650 ?auto_318651 ?auto_318652 ?auto_318653 ?auto_318654 ?auto_318655 ?auto_318656 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318667 - BLOCK
      ?auto_318668 - BLOCK
      ?auto_318669 - BLOCK
      ?auto_318670 - BLOCK
      ?auto_318671 - BLOCK
      ?auto_318672 - BLOCK
      ?auto_318673 - BLOCK
      ?auto_318674 - BLOCK
      ?auto_318675 - BLOCK
    )
    :vars
    (
      ?auto_318676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318674 ) ( ON ?auto_318675 ?auto_318676 ) ( CLEAR ?auto_318675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_318667 ) ( ON ?auto_318668 ?auto_318667 ) ( ON ?auto_318669 ?auto_318668 ) ( ON ?auto_318670 ?auto_318669 ) ( ON ?auto_318671 ?auto_318670 ) ( ON ?auto_318672 ?auto_318671 ) ( ON ?auto_318673 ?auto_318672 ) ( ON ?auto_318674 ?auto_318673 ) ( not ( = ?auto_318667 ?auto_318668 ) ) ( not ( = ?auto_318667 ?auto_318669 ) ) ( not ( = ?auto_318667 ?auto_318670 ) ) ( not ( = ?auto_318667 ?auto_318671 ) ) ( not ( = ?auto_318667 ?auto_318672 ) ) ( not ( = ?auto_318667 ?auto_318673 ) ) ( not ( = ?auto_318667 ?auto_318674 ) ) ( not ( = ?auto_318667 ?auto_318675 ) ) ( not ( = ?auto_318667 ?auto_318676 ) ) ( not ( = ?auto_318668 ?auto_318669 ) ) ( not ( = ?auto_318668 ?auto_318670 ) ) ( not ( = ?auto_318668 ?auto_318671 ) ) ( not ( = ?auto_318668 ?auto_318672 ) ) ( not ( = ?auto_318668 ?auto_318673 ) ) ( not ( = ?auto_318668 ?auto_318674 ) ) ( not ( = ?auto_318668 ?auto_318675 ) ) ( not ( = ?auto_318668 ?auto_318676 ) ) ( not ( = ?auto_318669 ?auto_318670 ) ) ( not ( = ?auto_318669 ?auto_318671 ) ) ( not ( = ?auto_318669 ?auto_318672 ) ) ( not ( = ?auto_318669 ?auto_318673 ) ) ( not ( = ?auto_318669 ?auto_318674 ) ) ( not ( = ?auto_318669 ?auto_318675 ) ) ( not ( = ?auto_318669 ?auto_318676 ) ) ( not ( = ?auto_318670 ?auto_318671 ) ) ( not ( = ?auto_318670 ?auto_318672 ) ) ( not ( = ?auto_318670 ?auto_318673 ) ) ( not ( = ?auto_318670 ?auto_318674 ) ) ( not ( = ?auto_318670 ?auto_318675 ) ) ( not ( = ?auto_318670 ?auto_318676 ) ) ( not ( = ?auto_318671 ?auto_318672 ) ) ( not ( = ?auto_318671 ?auto_318673 ) ) ( not ( = ?auto_318671 ?auto_318674 ) ) ( not ( = ?auto_318671 ?auto_318675 ) ) ( not ( = ?auto_318671 ?auto_318676 ) ) ( not ( = ?auto_318672 ?auto_318673 ) ) ( not ( = ?auto_318672 ?auto_318674 ) ) ( not ( = ?auto_318672 ?auto_318675 ) ) ( not ( = ?auto_318672 ?auto_318676 ) ) ( not ( = ?auto_318673 ?auto_318674 ) ) ( not ( = ?auto_318673 ?auto_318675 ) ) ( not ( = ?auto_318673 ?auto_318676 ) ) ( not ( = ?auto_318674 ?auto_318675 ) ) ( not ( = ?auto_318674 ?auto_318676 ) ) ( not ( = ?auto_318675 ?auto_318676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_318675 ?auto_318676 )
      ( !STACK ?auto_318675 ?auto_318674 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318686 - BLOCK
      ?auto_318687 - BLOCK
      ?auto_318688 - BLOCK
      ?auto_318689 - BLOCK
      ?auto_318690 - BLOCK
      ?auto_318691 - BLOCK
      ?auto_318692 - BLOCK
      ?auto_318693 - BLOCK
      ?auto_318694 - BLOCK
    )
    :vars
    (
      ?auto_318695 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318693 ) ( ON ?auto_318694 ?auto_318695 ) ( CLEAR ?auto_318694 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_318686 ) ( ON ?auto_318687 ?auto_318686 ) ( ON ?auto_318688 ?auto_318687 ) ( ON ?auto_318689 ?auto_318688 ) ( ON ?auto_318690 ?auto_318689 ) ( ON ?auto_318691 ?auto_318690 ) ( ON ?auto_318692 ?auto_318691 ) ( ON ?auto_318693 ?auto_318692 ) ( not ( = ?auto_318686 ?auto_318687 ) ) ( not ( = ?auto_318686 ?auto_318688 ) ) ( not ( = ?auto_318686 ?auto_318689 ) ) ( not ( = ?auto_318686 ?auto_318690 ) ) ( not ( = ?auto_318686 ?auto_318691 ) ) ( not ( = ?auto_318686 ?auto_318692 ) ) ( not ( = ?auto_318686 ?auto_318693 ) ) ( not ( = ?auto_318686 ?auto_318694 ) ) ( not ( = ?auto_318686 ?auto_318695 ) ) ( not ( = ?auto_318687 ?auto_318688 ) ) ( not ( = ?auto_318687 ?auto_318689 ) ) ( not ( = ?auto_318687 ?auto_318690 ) ) ( not ( = ?auto_318687 ?auto_318691 ) ) ( not ( = ?auto_318687 ?auto_318692 ) ) ( not ( = ?auto_318687 ?auto_318693 ) ) ( not ( = ?auto_318687 ?auto_318694 ) ) ( not ( = ?auto_318687 ?auto_318695 ) ) ( not ( = ?auto_318688 ?auto_318689 ) ) ( not ( = ?auto_318688 ?auto_318690 ) ) ( not ( = ?auto_318688 ?auto_318691 ) ) ( not ( = ?auto_318688 ?auto_318692 ) ) ( not ( = ?auto_318688 ?auto_318693 ) ) ( not ( = ?auto_318688 ?auto_318694 ) ) ( not ( = ?auto_318688 ?auto_318695 ) ) ( not ( = ?auto_318689 ?auto_318690 ) ) ( not ( = ?auto_318689 ?auto_318691 ) ) ( not ( = ?auto_318689 ?auto_318692 ) ) ( not ( = ?auto_318689 ?auto_318693 ) ) ( not ( = ?auto_318689 ?auto_318694 ) ) ( not ( = ?auto_318689 ?auto_318695 ) ) ( not ( = ?auto_318690 ?auto_318691 ) ) ( not ( = ?auto_318690 ?auto_318692 ) ) ( not ( = ?auto_318690 ?auto_318693 ) ) ( not ( = ?auto_318690 ?auto_318694 ) ) ( not ( = ?auto_318690 ?auto_318695 ) ) ( not ( = ?auto_318691 ?auto_318692 ) ) ( not ( = ?auto_318691 ?auto_318693 ) ) ( not ( = ?auto_318691 ?auto_318694 ) ) ( not ( = ?auto_318691 ?auto_318695 ) ) ( not ( = ?auto_318692 ?auto_318693 ) ) ( not ( = ?auto_318692 ?auto_318694 ) ) ( not ( = ?auto_318692 ?auto_318695 ) ) ( not ( = ?auto_318693 ?auto_318694 ) ) ( not ( = ?auto_318693 ?auto_318695 ) ) ( not ( = ?auto_318694 ?auto_318695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_318694 ?auto_318695 )
      ( !STACK ?auto_318694 ?auto_318693 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318705 - BLOCK
      ?auto_318706 - BLOCK
      ?auto_318707 - BLOCK
      ?auto_318708 - BLOCK
      ?auto_318709 - BLOCK
      ?auto_318710 - BLOCK
      ?auto_318711 - BLOCK
      ?auto_318712 - BLOCK
      ?auto_318713 - BLOCK
    )
    :vars
    (
      ?auto_318714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318713 ?auto_318714 ) ( ON-TABLE ?auto_318705 ) ( ON ?auto_318706 ?auto_318705 ) ( ON ?auto_318707 ?auto_318706 ) ( ON ?auto_318708 ?auto_318707 ) ( ON ?auto_318709 ?auto_318708 ) ( ON ?auto_318710 ?auto_318709 ) ( ON ?auto_318711 ?auto_318710 ) ( not ( = ?auto_318705 ?auto_318706 ) ) ( not ( = ?auto_318705 ?auto_318707 ) ) ( not ( = ?auto_318705 ?auto_318708 ) ) ( not ( = ?auto_318705 ?auto_318709 ) ) ( not ( = ?auto_318705 ?auto_318710 ) ) ( not ( = ?auto_318705 ?auto_318711 ) ) ( not ( = ?auto_318705 ?auto_318712 ) ) ( not ( = ?auto_318705 ?auto_318713 ) ) ( not ( = ?auto_318705 ?auto_318714 ) ) ( not ( = ?auto_318706 ?auto_318707 ) ) ( not ( = ?auto_318706 ?auto_318708 ) ) ( not ( = ?auto_318706 ?auto_318709 ) ) ( not ( = ?auto_318706 ?auto_318710 ) ) ( not ( = ?auto_318706 ?auto_318711 ) ) ( not ( = ?auto_318706 ?auto_318712 ) ) ( not ( = ?auto_318706 ?auto_318713 ) ) ( not ( = ?auto_318706 ?auto_318714 ) ) ( not ( = ?auto_318707 ?auto_318708 ) ) ( not ( = ?auto_318707 ?auto_318709 ) ) ( not ( = ?auto_318707 ?auto_318710 ) ) ( not ( = ?auto_318707 ?auto_318711 ) ) ( not ( = ?auto_318707 ?auto_318712 ) ) ( not ( = ?auto_318707 ?auto_318713 ) ) ( not ( = ?auto_318707 ?auto_318714 ) ) ( not ( = ?auto_318708 ?auto_318709 ) ) ( not ( = ?auto_318708 ?auto_318710 ) ) ( not ( = ?auto_318708 ?auto_318711 ) ) ( not ( = ?auto_318708 ?auto_318712 ) ) ( not ( = ?auto_318708 ?auto_318713 ) ) ( not ( = ?auto_318708 ?auto_318714 ) ) ( not ( = ?auto_318709 ?auto_318710 ) ) ( not ( = ?auto_318709 ?auto_318711 ) ) ( not ( = ?auto_318709 ?auto_318712 ) ) ( not ( = ?auto_318709 ?auto_318713 ) ) ( not ( = ?auto_318709 ?auto_318714 ) ) ( not ( = ?auto_318710 ?auto_318711 ) ) ( not ( = ?auto_318710 ?auto_318712 ) ) ( not ( = ?auto_318710 ?auto_318713 ) ) ( not ( = ?auto_318710 ?auto_318714 ) ) ( not ( = ?auto_318711 ?auto_318712 ) ) ( not ( = ?auto_318711 ?auto_318713 ) ) ( not ( = ?auto_318711 ?auto_318714 ) ) ( not ( = ?auto_318712 ?auto_318713 ) ) ( not ( = ?auto_318712 ?auto_318714 ) ) ( not ( = ?auto_318713 ?auto_318714 ) ) ( CLEAR ?auto_318711 ) ( ON ?auto_318712 ?auto_318713 ) ( CLEAR ?auto_318712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_318705 ?auto_318706 ?auto_318707 ?auto_318708 ?auto_318709 ?auto_318710 ?auto_318711 ?auto_318712 )
      ( MAKE-9PILE ?auto_318705 ?auto_318706 ?auto_318707 ?auto_318708 ?auto_318709 ?auto_318710 ?auto_318711 ?auto_318712 ?auto_318713 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318724 - BLOCK
      ?auto_318725 - BLOCK
      ?auto_318726 - BLOCK
      ?auto_318727 - BLOCK
      ?auto_318728 - BLOCK
      ?auto_318729 - BLOCK
      ?auto_318730 - BLOCK
      ?auto_318731 - BLOCK
      ?auto_318732 - BLOCK
    )
    :vars
    (
      ?auto_318733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318732 ?auto_318733 ) ( ON-TABLE ?auto_318724 ) ( ON ?auto_318725 ?auto_318724 ) ( ON ?auto_318726 ?auto_318725 ) ( ON ?auto_318727 ?auto_318726 ) ( ON ?auto_318728 ?auto_318727 ) ( ON ?auto_318729 ?auto_318728 ) ( ON ?auto_318730 ?auto_318729 ) ( not ( = ?auto_318724 ?auto_318725 ) ) ( not ( = ?auto_318724 ?auto_318726 ) ) ( not ( = ?auto_318724 ?auto_318727 ) ) ( not ( = ?auto_318724 ?auto_318728 ) ) ( not ( = ?auto_318724 ?auto_318729 ) ) ( not ( = ?auto_318724 ?auto_318730 ) ) ( not ( = ?auto_318724 ?auto_318731 ) ) ( not ( = ?auto_318724 ?auto_318732 ) ) ( not ( = ?auto_318724 ?auto_318733 ) ) ( not ( = ?auto_318725 ?auto_318726 ) ) ( not ( = ?auto_318725 ?auto_318727 ) ) ( not ( = ?auto_318725 ?auto_318728 ) ) ( not ( = ?auto_318725 ?auto_318729 ) ) ( not ( = ?auto_318725 ?auto_318730 ) ) ( not ( = ?auto_318725 ?auto_318731 ) ) ( not ( = ?auto_318725 ?auto_318732 ) ) ( not ( = ?auto_318725 ?auto_318733 ) ) ( not ( = ?auto_318726 ?auto_318727 ) ) ( not ( = ?auto_318726 ?auto_318728 ) ) ( not ( = ?auto_318726 ?auto_318729 ) ) ( not ( = ?auto_318726 ?auto_318730 ) ) ( not ( = ?auto_318726 ?auto_318731 ) ) ( not ( = ?auto_318726 ?auto_318732 ) ) ( not ( = ?auto_318726 ?auto_318733 ) ) ( not ( = ?auto_318727 ?auto_318728 ) ) ( not ( = ?auto_318727 ?auto_318729 ) ) ( not ( = ?auto_318727 ?auto_318730 ) ) ( not ( = ?auto_318727 ?auto_318731 ) ) ( not ( = ?auto_318727 ?auto_318732 ) ) ( not ( = ?auto_318727 ?auto_318733 ) ) ( not ( = ?auto_318728 ?auto_318729 ) ) ( not ( = ?auto_318728 ?auto_318730 ) ) ( not ( = ?auto_318728 ?auto_318731 ) ) ( not ( = ?auto_318728 ?auto_318732 ) ) ( not ( = ?auto_318728 ?auto_318733 ) ) ( not ( = ?auto_318729 ?auto_318730 ) ) ( not ( = ?auto_318729 ?auto_318731 ) ) ( not ( = ?auto_318729 ?auto_318732 ) ) ( not ( = ?auto_318729 ?auto_318733 ) ) ( not ( = ?auto_318730 ?auto_318731 ) ) ( not ( = ?auto_318730 ?auto_318732 ) ) ( not ( = ?auto_318730 ?auto_318733 ) ) ( not ( = ?auto_318731 ?auto_318732 ) ) ( not ( = ?auto_318731 ?auto_318733 ) ) ( not ( = ?auto_318732 ?auto_318733 ) ) ( CLEAR ?auto_318730 ) ( ON ?auto_318731 ?auto_318732 ) ( CLEAR ?auto_318731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_318724 ?auto_318725 ?auto_318726 ?auto_318727 ?auto_318728 ?auto_318729 ?auto_318730 ?auto_318731 )
      ( MAKE-9PILE ?auto_318724 ?auto_318725 ?auto_318726 ?auto_318727 ?auto_318728 ?auto_318729 ?auto_318730 ?auto_318731 ?auto_318732 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318743 - BLOCK
      ?auto_318744 - BLOCK
      ?auto_318745 - BLOCK
      ?auto_318746 - BLOCK
      ?auto_318747 - BLOCK
      ?auto_318748 - BLOCK
      ?auto_318749 - BLOCK
      ?auto_318750 - BLOCK
      ?auto_318751 - BLOCK
    )
    :vars
    (
      ?auto_318752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318751 ?auto_318752 ) ( ON-TABLE ?auto_318743 ) ( ON ?auto_318744 ?auto_318743 ) ( ON ?auto_318745 ?auto_318744 ) ( ON ?auto_318746 ?auto_318745 ) ( ON ?auto_318747 ?auto_318746 ) ( ON ?auto_318748 ?auto_318747 ) ( not ( = ?auto_318743 ?auto_318744 ) ) ( not ( = ?auto_318743 ?auto_318745 ) ) ( not ( = ?auto_318743 ?auto_318746 ) ) ( not ( = ?auto_318743 ?auto_318747 ) ) ( not ( = ?auto_318743 ?auto_318748 ) ) ( not ( = ?auto_318743 ?auto_318749 ) ) ( not ( = ?auto_318743 ?auto_318750 ) ) ( not ( = ?auto_318743 ?auto_318751 ) ) ( not ( = ?auto_318743 ?auto_318752 ) ) ( not ( = ?auto_318744 ?auto_318745 ) ) ( not ( = ?auto_318744 ?auto_318746 ) ) ( not ( = ?auto_318744 ?auto_318747 ) ) ( not ( = ?auto_318744 ?auto_318748 ) ) ( not ( = ?auto_318744 ?auto_318749 ) ) ( not ( = ?auto_318744 ?auto_318750 ) ) ( not ( = ?auto_318744 ?auto_318751 ) ) ( not ( = ?auto_318744 ?auto_318752 ) ) ( not ( = ?auto_318745 ?auto_318746 ) ) ( not ( = ?auto_318745 ?auto_318747 ) ) ( not ( = ?auto_318745 ?auto_318748 ) ) ( not ( = ?auto_318745 ?auto_318749 ) ) ( not ( = ?auto_318745 ?auto_318750 ) ) ( not ( = ?auto_318745 ?auto_318751 ) ) ( not ( = ?auto_318745 ?auto_318752 ) ) ( not ( = ?auto_318746 ?auto_318747 ) ) ( not ( = ?auto_318746 ?auto_318748 ) ) ( not ( = ?auto_318746 ?auto_318749 ) ) ( not ( = ?auto_318746 ?auto_318750 ) ) ( not ( = ?auto_318746 ?auto_318751 ) ) ( not ( = ?auto_318746 ?auto_318752 ) ) ( not ( = ?auto_318747 ?auto_318748 ) ) ( not ( = ?auto_318747 ?auto_318749 ) ) ( not ( = ?auto_318747 ?auto_318750 ) ) ( not ( = ?auto_318747 ?auto_318751 ) ) ( not ( = ?auto_318747 ?auto_318752 ) ) ( not ( = ?auto_318748 ?auto_318749 ) ) ( not ( = ?auto_318748 ?auto_318750 ) ) ( not ( = ?auto_318748 ?auto_318751 ) ) ( not ( = ?auto_318748 ?auto_318752 ) ) ( not ( = ?auto_318749 ?auto_318750 ) ) ( not ( = ?auto_318749 ?auto_318751 ) ) ( not ( = ?auto_318749 ?auto_318752 ) ) ( not ( = ?auto_318750 ?auto_318751 ) ) ( not ( = ?auto_318750 ?auto_318752 ) ) ( not ( = ?auto_318751 ?auto_318752 ) ) ( ON ?auto_318750 ?auto_318751 ) ( CLEAR ?auto_318748 ) ( ON ?auto_318749 ?auto_318750 ) ( CLEAR ?auto_318749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_318743 ?auto_318744 ?auto_318745 ?auto_318746 ?auto_318747 ?auto_318748 ?auto_318749 )
      ( MAKE-9PILE ?auto_318743 ?auto_318744 ?auto_318745 ?auto_318746 ?auto_318747 ?auto_318748 ?auto_318749 ?auto_318750 ?auto_318751 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318762 - BLOCK
      ?auto_318763 - BLOCK
      ?auto_318764 - BLOCK
      ?auto_318765 - BLOCK
      ?auto_318766 - BLOCK
      ?auto_318767 - BLOCK
      ?auto_318768 - BLOCK
      ?auto_318769 - BLOCK
      ?auto_318770 - BLOCK
    )
    :vars
    (
      ?auto_318771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318770 ?auto_318771 ) ( ON-TABLE ?auto_318762 ) ( ON ?auto_318763 ?auto_318762 ) ( ON ?auto_318764 ?auto_318763 ) ( ON ?auto_318765 ?auto_318764 ) ( ON ?auto_318766 ?auto_318765 ) ( ON ?auto_318767 ?auto_318766 ) ( not ( = ?auto_318762 ?auto_318763 ) ) ( not ( = ?auto_318762 ?auto_318764 ) ) ( not ( = ?auto_318762 ?auto_318765 ) ) ( not ( = ?auto_318762 ?auto_318766 ) ) ( not ( = ?auto_318762 ?auto_318767 ) ) ( not ( = ?auto_318762 ?auto_318768 ) ) ( not ( = ?auto_318762 ?auto_318769 ) ) ( not ( = ?auto_318762 ?auto_318770 ) ) ( not ( = ?auto_318762 ?auto_318771 ) ) ( not ( = ?auto_318763 ?auto_318764 ) ) ( not ( = ?auto_318763 ?auto_318765 ) ) ( not ( = ?auto_318763 ?auto_318766 ) ) ( not ( = ?auto_318763 ?auto_318767 ) ) ( not ( = ?auto_318763 ?auto_318768 ) ) ( not ( = ?auto_318763 ?auto_318769 ) ) ( not ( = ?auto_318763 ?auto_318770 ) ) ( not ( = ?auto_318763 ?auto_318771 ) ) ( not ( = ?auto_318764 ?auto_318765 ) ) ( not ( = ?auto_318764 ?auto_318766 ) ) ( not ( = ?auto_318764 ?auto_318767 ) ) ( not ( = ?auto_318764 ?auto_318768 ) ) ( not ( = ?auto_318764 ?auto_318769 ) ) ( not ( = ?auto_318764 ?auto_318770 ) ) ( not ( = ?auto_318764 ?auto_318771 ) ) ( not ( = ?auto_318765 ?auto_318766 ) ) ( not ( = ?auto_318765 ?auto_318767 ) ) ( not ( = ?auto_318765 ?auto_318768 ) ) ( not ( = ?auto_318765 ?auto_318769 ) ) ( not ( = ?auto_318765 ?auto_318770 ) ) ( not ( = ?auto_318765 ?auto_318771 ) ) ( not ( = ?auto_318766 ?auto_318767 ) ) ( not ( = ?auto_318766 ?auto_318768 ) ) ( not ( = ?auto_318766 ?auto_318769 ) ) ( not ( = ?auto_318766 ?auto_318770 ) ) ( not ( = ?auto_318766 ?auto_318771 ) ) ( not ( = ?auto_318767 ?auto_318768 ) ) ( not ( = ?auto_318767 ?auto_318769 ) ) ( not ( = ?auto_318767 ?auto_318770 ) ) ( not ( = ?auto_318767 ?auto_318771 ) ) ( not ( = ?auto_318768 ?auto_318769 ) ) ( not ( = ?auto_318768 ?auto_318770 ) ) ( not ( = ?auto_318768 ?auto_318771 ) ) ( not ( = ?auto_318769 ?auto_318770 ) ) ( not ( = ?auto_318769 ?auto_318771 ) ) ( not ( = ?auto_318770 ?auto_318771 ) ) ( ON ?auto_318769 ?auto_318770 ) ( CLEAR ?auto_318767 ) ( ON ?auto_318768 ?auto_318769 ) ( CLEAR ?auto_318768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_318762 ?auto_318763 ?auto_318764 ?auto_318765 ?auto_318766 ?auto_318767 ?auto_318768 )
      ( MAKE-9PILE ?auto_318762 ?auto_318763 ?auto_318764 ?auto_318765 ?auto_318766 ?auto_318767 ?auto_318768 ?auto_318769 ?auto_318770 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318781 - BLOCK
      ?auto_318782 - BLOCK
      ?auto_318783 - BLOCK
      ?auto_318784 - BLOCK
      ?auto_318785 - BLOCK
      ?auto_318786 - BLOCK
      ?auto_318787 - BLOCK
      ?auto_318788 - BLOCK
      ?auto_318789 - BLOCK
    )
    :vars
    (
      ?auto_318790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318789 ?auto_318790 ) ( ON-TABLE ?auto_318781 ) ( ON ?auto_318782 ?auto_318781 ) ( ON ?auto_318783 ?auto_318782 ) ( ON ?auto_318784 ?auto_318783 ) ( ON ?auto_318785 ?auto_318784 ) ( not ( = ?auto_318781 ?auto_318782 ) ) ( not ( = ?auto_318781 ?auto_318783 ) ) ( not ( = ?auto_318781 ?auto_318784 ) ) ( not ( = ?auto_318781 ?auto_318785 ) ) ( not ( = ?auto_318781 ?auto_318786 ) ) ( not ( = ?auto_318781 ?auto_318787 ) ) ( not ( = ?auto_318781 ?auto_318788 ) ) ( not ( = ?auto_318781 ?auto_318789 ) ) ( not ( = ?auto_318781 ?auto_318790 ) ) ( not ( = ?auto_318782 ?auto_318783 ) ) ( not ( = ?auto_318782 ?auto_318784 ) ) ( not ( = ?auto_318782 ?auto_318785 ) ) ( not ( = ?auto_318782 ?auto_318786 ) ) ( not ( = ?auto_318782 ?auto_318787 ) ) ( not ( = ?auto_318782 ?auto_318788 ) ) ( not ( = ?auto_318782 ?auto_318789 ) ) ( not ( = ?auto_318782 ?auto_318790 ) ) ( not ( = ?auto_318783 ?auto_318784 ) ) ( not ( = ?auto_318783 ?auto_318785 ) ) ( not ( = ?auto_318783 ?auto_318786 ) ) ( not ( = ?auto_318783 ?auto_318787 ) ) ( not ( = ?auto_318783 ?auto_318788 ) ) ( not ( = ?auto_318783 ?auto_318789 ) ) ( not ( = ?auto_318783 ?auto_318790 ) ) ( not ( = ?auto_318784 ?auto_318785 ) ) ( not ( = ?auto_318784 ?auto_318786 ) ) ( not ( = ?auto_318784 ?auto_318787 ) ) ( not ( = ?auto_318784 ?auto_318788 ) ) ( not ( = ?auto_318784 ?auto_318789 ) ) ( not ( = ?auto_318784 ?auto_318790 ) ) ( not ( = ?auto_318785 ?auto_318786 ) ) ( not ( = ?auto_318785 ?auto_318787 ) ) ( not ( = ?auto_318785 ?auto_318788 ) ) ( not ( = ?auto_318785 ?auto_318789 ) ) ( not ( = ?auto_318785 ?auto_318790 ) ) ( not ( = ?auto_318786 ?auto_318787 ) ) ( not ( = ?auto_318786 ?auto_318788 ) ) ( not ( = ?auto_318786 ?auto_318789 ) ) ( not ( = ?auto_318786 ?auto_318790 ) ) ( not ( = ?auto_318787 ?auto_318788 ) ) ( not ( = ?auto_318787 ?auto_318789 ) ) ( not ( = ?auto_318787 ?auto_318790 ) ) ( not ( = ?auto_318788 ?auto_318789 ) ) ( not ( = ?auto_318788 ?auto_318790 ) ) ( not ( = ?auto_318789 ?auto_318790 ) ) ( ON ?auto_318788 ?auto_318789 ) ( ON ?auto_318787 ?auto_318788 ) ( CLEAR ?auto_318785 ) ( ON ?auto_318786 ?auto_318787 ) ( CLEAR ?auto_318786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_318781 ?auto_318782 ?auto_318783 ?auto_318784 ?auto_318785 ?auto_318786 )
      ( MAKE-9PILE ?auto_318781 ?auto_318782 ?auto_318783 ?auto_318784 ?auto_318785 ?auto_318786 ?auto_318787 ?auto_318788 ?auto_318789 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318800 - BLOCK
      ?auto_318801 - BLOCK
      ?auto_318802 - BLOCK
      ?auto_318803 - BLOCK
      ?auto_318804 - BLOCK
      ?auto_318805 - BLOCK
      ?auto_318806 - BLOCK
      ?auto_318807 - BLOCK
      ?auto_318808 - BLOCK
    )
    :vars
    (
      ?auto_318809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318808 ?auto_318809 ) ( ON-TABLE ?auto_318800 ) ( ON ?auto_318801 ?auto_318800 ) ( ON ?auto_318802 ?auto_318801 ) ( ON ?auto_318803 ?auto_318802 ) ( ON ?auto_318804 ?auto_318803 ) ( not ( = ?auto_318800 ?auto_318801 ) ) ( not ( = ?auto_318800 ?auto_318802 ) ) ( not ( = ?auto_318800 ?auto_318803 ) ) ( not ( = ?auto_318800 ?auto_318804 ) ) ( not ( = ?auto_318800 ?auto_318805 ) ) ( not ( = ?auto_318800 ?auto_318806 ) ) ( not ( = ?auto_318800 ?auto_318807 ) ) ( not ( = ?auto_318800 ?auto_318808 ) ) ( not ( = ?auto_318800 ?auto_318809 ) ) ( not ( = ?auto_318801 ?auto_318802 ) ) ( not ( = ?auto_318801 ?auto_318803 ) ) ( not ( = ?auto_318801 ?auto_318804 ) ) ( not ( = ?auto_318801 ?auto_318805 ) ) ( not ( = ?auto_318801 ?auto_318806 ) ) ( not ( = ?auto_318801 ?auto_318807 ) ) ( not ( = ?auto_318801 ?auto_318808 ) ) ( not ( = ?auto_318801 ?auto_318809 ) ) ( not ( = ?auto_318802 ?auto_318803 ) ) ( not ( = ?auto_318802 ?auto_318804 ) ) ( not ( = ?auto_318802 ?auto_318805 ) ) ( not ( = ?auto_318802 ?auto_318806 ) ) ( not ( = ?auto_318802 ?auto_318807 ) ) ( not ( = ?auto_318802 ?auto_318808 ) ) ( not ( = ?auto_318802 ?auto_318809 ) ) ( not ( = ?auto_318803 ?auto_318804 ) ) ( not ( = ?auto_318803 ?auto_318805 ) ) ( not ( = ?auto_318803 ?auto_318806 ) ) ( not ( = ?auto_318803 ?auto_318807 ) ) ( not ( = ?auto_318803 ?auto_318808 ) ) ( not ( = ?auto_318803 ?auto_318809 ) ) ( not ( = ?auto_318804 ?auto_318805 ) ) ( not ( = ?auto_318804 ?auto_318806 ) ) ( not ( = ?auto_318804 ?auto_318807 ) ) ( not ( = ?auto_318804 ?auto_318808 ) ) ( not ( = ?auto_318804 ?auto_318809 ) ) ( not ( = ?auto_318805 ?auto_318806 ) ) ( not ( = ?auto_318805 ?auto_318807 ) ) ( not ( = ?auto_318805 ?auto_318808 ) ) ( not ( = ?auto_318805 ?auto_318809 ) ) ( not ( = ?auto_318806 ?auto_318807 ) ) ( not ( = ?auto_318806 ?auto_318808 ) ) ( not ( = ?auto_318806 ?auto_318809 ) ) ( not ( = ?auto_318807 ?auto_318808 ) ) ( not ( = ?auto_318807 ?auto_318809 ) ) ( not ( = ?auto_318808 ?auto_318809 ) ) ( ON ?auto_318807 ?auto_318808 ) ( ON ?auto_318806 ?auto_318807 ) ( CLEAR ?auto_318804 ) ( ON ?auto_318805 ?auto_318806 ) ( CLEAR ?auto_318805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_318800 ?auto_318801 ?auto_318802 ?auto_318803 ?auto_318804 ?auto_318805 )
      ( MAKE-9PILE ?auto_318800 ?auto_318801 ?auto_318802 ?auto_318803 ?auto_318804 ?auto_318805 ?auto_318806 ?auto_318807 ?auto_318808 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318819 - BLOCK
      ?auto_318820 - BLOCK
      ?auto_318821 - BLOCK
      ?auto_318822 - BLOCK
      ?auto_318823 - BLOCK
      ?auto_318824 - BLOCK
      ?auto_318825 - BLOCK
      ?auto_318826 - BLOCK
      ?auto_318827 - BLOCK
    )
    :vars
    (
      ?auto_318828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318827 ?auto_318828 ) ( ON-TABLE ?auto_318819 ) ( ON ?auto_318820 ?auto_318819 ) ( ON ?auto_318821 ?auto_318820 ) ( ON ?auto_318822 ?auto_318821 ) ( not ( = ?auto_318819 ?auto_318820 ) ) ( not ( = ?auto_318819 ?auto_318821 ) ) ( not ( = ?auto_318819 ?auto_318822 ) ) ( not ( = ?auto_318819 ?auto_318823 ) ) ( not ( = ?auto_318819 ?auto_318824 ) ) ( not ( = ?auto_318819 ?auto_318825 ) ) ( not ( = ?auto_318819 ?auto_318826 ) ) ( not ( = ?auto_318819 ?auto_318827 ) ) ( not ( = ?auto_318819 ?auto_318828 ) ) ( not ( = ?auto_318820 ?auto_318821 ) ) ( not ( = ?auto_318820 ?auto_318822 ) ) ( not ( = ?auto_318820 ?auto_318823 ) ) ( not ( = ?auto_318820 ?auto_318824 ) ) ( not ( = ?auto_318820 ?auto_318825 ) ) ( not ( = ?auto_318820 ?auto_318826 ) ) ( not ( = ?auto_318820 ?auto_318827 ) ) ( not ( = ?auto_318820 ?auto_318828 ) ) ( not ( = ?auto_318821 ?auto_318822 ) ) ( not ( = ?auto_318821 ?auto_318823 ) ) ( not ( = ?auto_318821 ?auto_318824 ) ) ( not ( = ?auto_318821 ?auto_318825 ) ) ( not ( = ?auto_318821 ?auto_318826 ) ) ( not ( = ?auto_318821 ?auto_318827 ) ) ( not ( = ?auto_318821 ?auto_318828 ) ) ( not ( = ?auto_318822 ?auto_318823 ) ) ( not ( = ?auto_318822 ?auto_318824 ) ) ( not ( = ?auto_318822 ?auto_318825 ) ) ( not ( = ?auto_318822 ?auto_318826 ) ) ( not ( = ?auto_318822 ?auto_318827 ) ) ( not ( = ?auto_318822 ?auto_318828 ) ) ( not ( = ?auto_318823 ?auto_318824 ) ) ( not ( = ?auto_318823 ?auto_318825 ) ) ( not ( = ?auto_318823 ?auto_318826 ) ) ( not ( = ?auto_318823 ?auto_318827 ) ) ( not ( = ?auto_318823 ?auto_318828 ) ) ( not ( = ?auto_318824 ?auto_318825 ) ) ( not ( = ?auto_318824 ?auto_318826 ) ) ( not ( = ?auto_318824 ?auto_318827 ) ) ( not ( = ?auto_318824 ?auto_318828 ) ) ( not ( = ?auto_318825 ?auto_318826 ) ) ( not ( = ?auto_318825 ?auto_318827 ) ) ( not ( = ?auto_318825 ?auto_318828 ) ) ( not ( = ?auto_318826 ?auto_318827 ) ) ( not ( = ?auto_318826 ?auto_318828 ) ) ( not ( = ?auto_318827 ?auto_318828 ) ) ( ON ?auto_318826 ?auto_318827 ) ( ON ?auto_318825 ?auto_318826 ) ( ON ?auto_318824 ?auto_318825 ) ( CLEAR ?auto_318822 ) ( ON ?auto_318823 ?auto_318824 ) ( CLEAR ?auto_318823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_318819 ?auto_318820 ?auto_318821 ?auto_318822 ?auto_318823 )
      ( MAKE-9PILE ?auto_318819 ?auto_318820 ?auto_318821 ?auto_318822 ?auto_318823 ?auto_318824 ?auto_318825 ?auto_318826 ?auto_318827 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318838 - BLOCK
      ?auto_318839 - BLOCK
      ?auto_318840 - BLOCK
      ?auto_318841 - BLOCK
      ?auto_318842 - BLOCK
      ?auto_318843 - BLOCK
      ?auto_318844 - BLOCK
      ?auto_318845 - BLOCK
      ?auto_318846 - BLOCK
    )
    :vars
    (
      ?auto_318847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318846 ?auto_318847 ) ( ON-TABLE ?auto_318838 ) ( ON ?auto_318839 ?auto_318838 ) ( ON ?auto_318840 ?auto_318839 ) ( ON ?auto_318841 ?auto_318840 ) ( not ( = ?auto_318838 ?auto_318839 ) ) ( not ( = ?auto_318838 ?auto_318840 ) ) ( not ( = ?auto_318838 ?auto_318841 ) ) ( not ( = ?auto_318838 ?auto_318842 ) ) ( not ( = ?auto_318838 ?auto_318843 ) ) ( not ( = ?auto_318838 ?auto_318844 ) ) ( not ( = ?auto_318838 ?auto_318845 ) ) ( not ( = ?auto_318838 ?auto_318846 ) ) ( not ( = ?auto_318838 ?auto_318847 ) ) ( not ( = ?auto_318839 ?auto_318840 ) ) ( not ( = ?auto_318839 ?auto_318841 ) ) ( not ( = ?auto_318839 ?auto_318842 ) ) ( not ( = ?auto_318839 ?auto_318843 ) ) ( not ( = ?auto_318839 ?auto_318844 ) ) ( not ( = ?auto_318839 ?auto_318845 ) ) ( not ( = ?auto_318839 ?auto_318846 ) ) ( not ( = ?auto_318839 ?auto_318847 ) ) ( not ( = ?auto_318840 ?auto_318841 ) ) ( not ( = ?auto_318840 ?auto_318842 ) ) ( not ( = ?auto_318840 ?auto_318843 ) ) ( not ( = ?auto_318840 ?auto_318844 ) ) ( not ( = ?auto_318840 ?auto_318845 ) ) ( not ( = ?auto_318840 ?auto_318846 ) ) ( not ( = ?auto_318840 ?auto_318847 ) ) ( not ( = ?auto_318841 ?auto_318842 ) ) ( not ( = ?auto_318841 ?auto_318843 ) ) ( not ( = ?auto_318841 ?auto_318844 ) ) ( not ( = ?auto_318841 ?auto_318845 ) ) ( not ( = ?auto_318841 ?auto_318846 ) ) ( not ( = ?auto_318841 ?auto_318847 ) ) ( not ( = ?auto_318842 ?auto_318843 ) ) ( not ( = ?auto_318842 ?auto_318844 ) ) ( not ( = ?auto_318842 ?auto_318845 ) ) ( not ( = ?auto_318842 ?auto_318846 ) ) ( not ( = ?auto_318842 ?auto_318847 ) ) ( not ( = ?auto_318843 ?auto_318844 ) ) ( not ( = ?auto_318843 ?auto_318845 ) ) ( not ( = ?auto_318843 ?auto_318846 ) ) ( not ( = ?auto_318843 ?auto_318847 ) ) ( not ( = ?auto_318844 ?auto_318845 ) ) ( not ( = ?auto_318844 ?auto_318846 ) ) ( not ( = ?auto_318844 ?auto_318847 ) ) ( not ( = ?auto_318845 ?auto_318846 ) ) ( not ( = ?auto_318845 ?auto_318847 ) ) ( not ( = ?auto_318846 ?auto_318847 ) ) ( ON ?auto_318845 ?auto_318846 ) ( ON ?auto_318844 ?auto_318845 ) ( ON ?auto_318843 ?auto_318844 ) ( CLEAR ?auto_318841 ) ( ON ?auto_318842 ?auto_318843 ) ( CLEAR ?auto_318842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_318838 ?auto_318839 ?auto_318840 ?auto_318841 ?auto_318842 )
      ( MAKE-9PILE ?auto_318838 ?auto_318839 ?auto_318840 ?auto_318841 ?auto_318842 ?auto_318843 ?auto_318844 ?auto_318845 ?auto_318846 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318857 - BLOCK
      ?auto_318858 - BLOCK
      ?auto_318859 - BLOCK
      ?auto_318860 - BLOCK
      ?auto_318861 - BLOCK
      ?auto_318862 - BLOCK
      ?auto_318863 - BLOCK
      ?auto_318864 - BLOCK
      ?auto_318865 - BLOCK
    )
    :vars
    (
      ?auto_318866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318865 ?auto_318866 ) ( ON-TABLE ?auto_318857 ) ( ON ?auto_318858 ?auto_318857 ) ( ON ?auto_318859 ?auto_318858 ) ( not ( = ?auto_318857 ?auto_318858 ) ) ( not ( = ?auto_318857 ?auto_318859 ) ) ( not ( = ?auto_318857 ?auto_318860 ) ) ( not ( = ?auto_318857 ?auto_318861 ) ) ( not ( = ?auto_318857 ?auto_318862 ) ) ( not ( = ?auto_318857 ?auto_318863 ) ) ( not ( = ?auto_318857 ?auto_318864 ) ) ( not ( = ?auto_318857 ?auto_318865 ) ) ( not ( = ?auto_318857 ?auto_318866 ) ) ( not ( = ?auto_318858 ?auto_318859 ) ) ( not ( = ?auto_318858 ?auto_318860 ) ) ( not ( = ?auto_318858 ?auto_318861 ) ) ( not ( = ?auto_318858 ?auto_318862 ) ) ( not ( = ?auto_318858 ?auto_318863 ) ) ( not ( = ?auto_318858 ?auto_318864 ) ) ( not ( = ?auto_318858 ?auto_318865 ) ) ( not ( = ?auto_318858 ?auto_318866 ) ) ( not ( = ?auto_318859 ?auto_318860 ) ) ( not ( = ?auto_318859 ?auto_318861 ) ) ( not ( = ?auto_318859 ?auto_318862 ) ) ( not ( = ?auto_318859 ?auto_318863 ) ) ( not ( = ?auto_318859 ?auto_318864 ) ) ( not ( = ?auto_318859 ?auto_318865 ) ) ( not ( = ?auto_318859 ?auto_318866 ) ) ( not ( = ?auto_318860 ?auto_318861 ) ) ( not ( = ?auto_318860 ?auto_318862 ) ) ( not ( = ?auto_318860 ?auto_318863 ) ) ( not ( = ?auto_318860 ?auto_318864 ) ) ( not ( = ?auto_318860 ?auto_318865 ) ) ( not ( = ?auto_318860 ?auto_318866 ) ) ( not ( = ?auto_318861 ?auto_318862 ) ) ( not ( = ?auto_318861 ?auto_318863 ) ) ( not ( = ?auto_318861 ?auto_318864 ) ) ( not ( = ?auto_318861 ?auto_318865 ) ) ( not ( = ?auto_318861 ?auto_318866 ) ) ( not ( = ?auto_318862 ?auto_318863 ) ) ( not ( = ?auto_318862 ?auto_318864 ) ) ( not ( = ?auto_318862 ?auto_318865 ) ) ( not ( = ?auto_318862 ?auto_318866 ) ) ( not ( = ?auto_318863 ?auto_318864 ) ) ( not ( = ?auto_318863 ?auto_318865 ) ) ( not ( = ?auto_318863 ?auto_318866 ) ) ( not ( = ?auto_318864 ?auto_318865 ) ) ( not ( = ?auto_318864 ?auto_318866 ) ) ( not ( = ?auto_318865 ?auto_318866 ) ) ( ON ?auto_318864 ?auto_318865 ) ( ON ?auto_318863 ?auto_318864 ) ( ON ?auto_318862 ?auto_318863 ) ( ON ?auto_318861 ?auto_318862 ) ( CLEAR ?auto_318859 ) ( ON ?auto_318860 ?auto_318861 ) ( CLEAR ?auto_318860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_318857 ?auto_318858 ?auto_318859 ?auto_318860 )
      ( MAKE-9PILE ?auto_318857 ?auto_318858 ?auto_318859 ?auto_318860 ?auto_318861 ?auto_318862 ?auto_318863 ?auto_318864 ?auto_318865 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318876 - BLOCK
      ?auto_318877 - BLOCK
      ?auto_318878 - BLOCK
      ?auto_318879 - BLOCK
      ?auto_318880 - BLOCK
      ?auto_318881 - BLOCK
      ?auto_318882 - BLOCK
      ?auto_318883 - BLOCK
      ?auto_318884 - BLOCK
    )
    :vars
    (
      ?auto_318885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318884 ?auto_318885 ) ( ON-TABLE ?auto_318876 ) ( ON ?auto_318877 ?auto_318876 ) ( ON ?auto_318878 ?auto_318877 ) ( not ( = ?auto_318876 ?auto_318877 ) ) ( not ( = ?auto_318876 ?auto_318878 ) ) ( not ( = ?auto_318876 ?auto_318879 ) ) ( not ( = ?auto_318876 ?auto_318880 ) ) ( not ( = ?auto_318876 ?auto_318881 ) ) ( not ( = ?auto_318876 ?auto_318882 ) ) ( not ( = ?auto_318876 ?auto_318883 ) ) ( not ( = ?auto_318876 ?auto_318884 ) ) ( not ( = ?auto_318876 ?auto_318885 ) ) ( not ( = ?auto_318877 ?auto_318878 ) ) ( not ( = ?auto_318877 ?auto_318879 ) ) ( not ( = ?auto_318877 ?auto_318880 ) ) ( not ( = ?auto_318877 ?auto_318881 ) ) ( not ( = ?auto_318877 ?auto_318882 ) ) ( not ( = ?auto_318877 ?auto_318883 ) ) ( not ( = ?auto_318877 ?auto_318884 ) ) ( not ( = ?auto_318877 ?auto_318885 ) ) ( not ( = ?auto_318878 ?auto_318879 ) ) ( not ( = ?auto_318878 ?auto_318880 ) ) ( not ( = ?auto_318878 ?auto_318881 ) ) ( not ( = ?auto_318878 ?auto_318882 ) ) ( not ( = ?auto_318878 ?auto_318883 ) ) ( not ( = ?auto_318878 ?auto_318884 ) ) ( not ( = ?auto_318878 ?auto_318885 ) ) ( not ( = ?auto_318879 ?auto_318880 ) ) ( not ( = ?auto_318879 ?auto_318881 ) ) ( not ( = ?auto_318879 ?auto_318882 ) ) ( not ( = ?auto_318879 ?auto_318883 ) ) ( not ( = ?auto_318879 ?auto_318884 ) ) ( not ( = ?auto_318879 ?auto_318885 ) ) ( not ( = ?auto_318880 ?auto_318881 ) ) ( not ( = ?auto_318880 ?auto_318882 ) ) ( not ( = ?auto_318880 ?auto_318883 ) ) ( not ( = ?auto_318880 ?auto_318884 ) ) ( not ( = ?auto_318880 ?auto_318885 ) ) ( not ( = ?auto_318881 ?auto_318882 ) ) ( not ( = ?auto_318881 ?auto_318883 ) ) ( not ( = ?auto_318881 ?auto_318884 ) ) ( not ( = ?auto_318881 ?auto_318885 ) ) ( not ( = ?auto_318882 ?auto_318883 ) ) ( not ( = ?auto_318882 ?auto_318884 ) ) ( not ( = ?auto_318882 ?auto_318885 ) ) ( not ( = ?auto_318883 ?auto_318884 ) ) ( not ( = ?auto_318883 ?auto_318885 ) ) ( not ( = ?auto_318884 ?auto_318885 ) ) ( ON ?auto_318883 ?auto_318884 ) ( ON ?auto_318882 ?auto_318883 ) ( ON ?auto_318881 ?auto_318882 ) ( ON ?auto_318880 ?auto_318881 ) ( CLEAR ?auto_318878 ) ( ON ?auto_318879 ?auto_318880 ) ( CLEAR ?auto_318879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_318876 ?auto_318877 ?auto_318878 ?auto_318879 )
      ( MAKE-9PILE ?auto_318876 ?auto_318877 ?auto_318878 ?auto_318879 ?auto_318880 ?auto_318881 ?auto_318882 ?auto_318883 ?auto_318884 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318895 - BLOCK
      ?auto_318896 - BLOCK
      ?auto_318897 - BLOCK
      ?auto_318898 - BLOCK
      ?auto_318899 - BLOCK
      ?auto_318900 - BLOCK
      ?auto_318901 - BLOCK
      ?auto_318902 - BLOCK
      ?auto_318903 - BLOCK
    )
    :vars
    (
      ?auto_318904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318903 ?auto_318904 ) ( ON-TABLE ?auto_318895 ) ( ON ?auto_318896 ?auto_318895 ) ( not ( = ?auto_318895 ?auto_318896 ) ) ( not ( = ?auto_318895 ?auto_318897 ) ) ( not ( = ?auto_318895 ?auto_318898 ) ) ( not ( = ?auto_318895 ?auto_318899 ) ) ( not ( = ?auto_318895 ?auto_318900 ) ) ( not ( = ?auto_318895 ?auto_318901 ) ) ( not ( = ?auto_318895 ?auto_318902 ) ) ( not ( = ?auto_318895 ?auto_318903 ) ) ( not ( = ?auto_318895 ?auto_318904 ) ) ( not ( = ?auto_318896 ?auto_318897 ) ) ( not ( = ?auto_318896 ?auto_318898 ) ) ( not ( = ?auto_318896 ?auto_318899 ) ) ( not ( = ?auto_318896 ?auto_318900 ) ) ( not ( = ?auto_318896 ?auto_318901 ) ) ( not ( = ?auto_318896 ?auto_318902 ) ) ( not ( = ?auto_318896 ?auto_318903 ) ) ( not ( = ?auto_318896 ?auto_318904 ) ) ( not ( = ?auto_318897 ?auto_318898 ) ) ( not ( = ?auto_318897 ?auto_318899 ) ) ( not ( = ?auto_318897 ?auto_318900 ) ) ( not ( = ?auto_318897 ?auto_318901 ) ) ( not ( = ?auto_318897 ?auto_318902 ) ) ( not ( = ?auto_318897 ?auto_318903 ) ) ( not ( = ?auto_318897 ?auto_318904 ) ) ( not ( = ?auto_318898 ?auto_318899 ) ) ( not ( = ?auto_318898 ?auto_318900 ) ) ( not ( = ?auto_318898 ?auto_318901 ) ) ( not ( = ?auto_318898 ?auto_318902 ) ) ( not ( = ?auto_318898 ?auto_318903 ) ) ( not ( = ?auto_318898 ?auto_318904 ) ) ( not ( = ?auto_318899 ?auto_318900 ) ) ( not ( = ?auto_318899 ?auto_318901 ) ) ( not ( = ?auto_318899 ?auto_318902 ) ) ( not ( = ?auto_318899 ?auto_318903 ) ) ( not ( = ?auto_318899 ?auto_318904 ) ) ( not ( = ?auto_318900 ?auto_318901 ) ) ( not ( = ?auto_318900 ?auto_318902 ) ) ( not ( = ?auto_318900 ?auto_318903 ) ) ( not ( = ?auto_318900 ?auto_318904 ) ) ( not ( = ?auto_318901 ?auto_318902 ) ) ( not ( = ?auto_318901 ?auto_318903 ) ) ( not ( = ?auto_318901 ?auto_318904 ) ) ( not ( = ?auto_318902 ?auto_318903 ) ) ( not ( = ?auto_318902 ?auto_318904 ) ) ( not ( = ?auto_318903 ?auto_318904 ) ) ( ON ?auto_318902 ?auto_318903 ) ( ON ?auto_318901 ?auto_318902 ) ( ON ?auto_318900 ?auto_318901 ) ( ON ?auto_318899 ?auto_318900 ) ( ON ?auto_318898 ?auto_318899 ) ( CLEAR ?auto_318896 ) ( ON ?auto_318897 ?auto_318898 ) ( CLEAR ?auto_318897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_318895 ?auto_318896 ?auto_318897 )
      ( MAKE-9PILE ?auto_318895 ?auto_318896 ?auto_318897 ?auto_318898 ?auto_318899 ?auto_318900 ?auto_318901 ?auto_318902 ?auto_318903 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318914 - BLOCK
      ?auto_318915 - BLOCK
      ?auto_318916 - BLOCK
      ?auto_318917 - BLOCK
      ?auto_318918 - BLOCK
      ?auto_318919 - BLOCK
      ?auto_318920 - BLOCK
      ?auto_318921 - BLOCK
      ?auto_318922 - BLOCK
    )
    :vars
    (
      ?auto_318923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318922 ?auto_318923 ) ( ON-TABLE ?auto_318914 ) ( ON ?auto_318915 ?auto_318914 ) ( not ( = ?auto_318914 ?auto_318915 ) ) ( not ( = ?auto_318914 ?auto_318916 ) ) ( not ( = ?auto_318914 ?auto_318917 ) ) ( not ( = ?auto_318914 ?auto_318918 ) ) ( not ( = ?auto_318914 ?auto_318919 ) ) ( not ( = ?auto_318914 ?auto_318920 ) ) ( not ( = ?auto_318914 ?auto_318921 ) ) ( not ( = ?auto_318914 ?auto_318922 ) ) ( not ( = ?auto_318914 ?auto_318923 ) ) ( not ( = ?auto_318915 ?auto_318916 ) ) ( not ( = ?auto_318915 ?auto_318917 ) ) ( not ( = ?auto_318915 ?auto_318918 ) ) ( not ( = ?auto_318915 ?auto_318919 ) ) ( not ( = ?auto_318915 ?auto_318920 ) ) ( not ( = ?auto_318915 ?auto_318921 ) ) ( not ( = ?auto_318915 ?auto_318922 ) ) ( not ( = ?auto_318915 ?auto_318923 ) ) ( not ( = ?auto_318916 ?auto_318917 ) ) ( not ( = ?auto_318916 ?auto_318918 ) ) ( not ( = ?auto_318916 ?auto_318919 ) ) ( not ( = ?auto_318916 ?auto_318920 ) ) ( not ( = ?auto_318916 ?auto_318921 ) ) ( not ( = ?auto_318916 ?auto_318922 ) ) ( not ( = ?auto_318916 ?auto_318923 ) ) ( not ( = ?auto_318917 ?auto_318918 ) ) ( not ( = ?auto_318917 ?auto_318919 ) ) ( not ( = ?auto_318917 ?auto_318920 ) ) ( not ( = ?auto_318917 ?auto_318921 ) ) ( not ( = ?auto_318917 ?auto_318922 ) ) ( not ( = ?auto_318917 ?auto_318923 ) ) ( not ( = ?auto_318918 ?auto_318919 ) ) ( not ( = ?auto_318918 ?auto_318920 ) ) ( not ( = ?auto_318918 ?auto_318921 ) ) ( not ( = ?auto_318918 ?auto_318922 ) ) ( not ( = ?auto_318918 ?auto_318923 ) ) ( not ( = ?auto_318919 ?auto_318920 ) ) ( not ( = ?auto_318919 ?auto_318921 ) ) ( not ( = ?auto_318919 ?auto_318922 ) ) ( not ( = ?auto_318919 ?auto_318923 ) ) ( not ( = ?auto_318920 ?auto_318921 ) ) ( not ( = ?auto_318920 ?auto_318922 ) ) ( not ( = ?auto_318920 ?auto_318923 ) ) ( not ( = ?auto_318921 ?auto_318922 ) ) ( not ( = ?auto_318921 ?auto_318923 ) ) ( not ( = ?auto_318922 ?auto_318923 ) ) ( ON ?auto_318921 ?auto_318922 ) ( ON ?auto_318920 ?auto_318921 ) ( ON ?auto_318919 ?auto_318920 ) ( ON ?auto_318918 ?auto_318919 ) ( ON ?auto_318917 ?auto_318918 ) ( CLEAR ?auto_318915 ) ( ON ?auto_318916 ?auto_318917 ) ( CLEAR ?auto_318916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_318914 ?auto_318915 ?auto_318916 )
      ( MAKE-9PILE ?auto_318914 ?auto_318915 ?auto_318916 ?auto_318917 ?auto_318918 ?auto_318919 ?auto_318920 ?auto_318921 ?auto_318922 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318933 - BLOCK
      ?auto_318934 - BLOCK
      ?auto_318935 - BLOCK
      ?auto_318936 - BLOCK
      ?auto_318937 - BLOCK
      ?auto_318938 - BLOCK
      ?auto_318939 - BLOCK
      ?auto_318940 - BLOCK
      ?auto_318941 - BLOCK
    )
    :vars
    (
      ?auto_318942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318941 ?auto_318942 ) ( ON-TABLE ?auto_318933 ) ( not ( = ?auto_318933 ?auto_318934 ) ) ( not ( = ?auto_318933 ?auto_318935 ) ) ( not ( = ?auto_318933 ?auto_318936 ) ) ( not ( = ?auto_318933 ?auto_318937 ) ) ( not ( = ?auto_318933 ?auto_318938 ) ) ( not ( = ?auto_318933 ?auto_318939 ) ) ( not ( = ?auto_318933 ?auto_318940 ) ) ( not ( = ?auto_318933 ?auto_318941 ) ) ( not ( = ?auto_318933 ?auto_318942 ) ) ( not ( = ?auto_318934 ?auto_318935 ) ) ( not ( = ?auto_318934 ?auto_318936 ) ) ( not ( = ?auto_318934 ?auto_318937 ) ) ( not ( = ?auto_318934 ?auto_318938 ) ) ( not ( = ?auto_318934 ?auto_318939 ) ) ( not ( = ?auto_318934 ?auto_318940 ) ) ( not ( = ?auto_318934 ?auto_318941 ) ) ( not ( = ?auto_318934 ?auto_318942 ) ) ( not ( = ?auto_318935 ?auto_318936 ) ) ( not ( = ?auto_318935 ?auto_318937 ) ) ( not ( = ?auto_318935 ?auto_318938 ) ) ( not ( = ?auto_318935 ?auto_318939 ) ) ( not ( = ?auto_318935 ?auto_318940 ) ) ( not ( = ?auto_318935 ?auto_318941 ) ) ( not ( = ?auto_318935 ?auto_318942 ) ) ( not ( = ?auto_318936 ?auto_318937 ) ) ( not ( = ?auto_318936 ?auto_318938 ) ) ( not ( = ?auto_318936 ?auto_318939 ) ) ( not ( = ?auto_318936 ?auto_318940 ) ) ( not ( = ?auto_318936 ?auto_318941 ) ) ( not ( = ?auto_318936 ?auto_318942 ) ) ( not ( = ?auto_318937 ?auto_318938 ) ) ( not ( = ?auto_318937 ?auto_318939 ) ) ( not ( = ?auto_318937 ?auto_318940 ) ) ( not ( = ?auto_318937 ?auto_318941 ) ) ( not ( = ?auto_318937 ?auto_318942 ) ) ( not ( = ?auto_318938 ?auto_318939 ) ) ( not ( = ?auto_318938 ?auto_318940 ) ) ( not ( = ?auto_318938 ?auto_318941 ) ) ( not ( = ?auto_318938 ?auto_318942 ) ) ( not ( = ?auto_318939 ?auto_318940 ) ) ( not ( = ?auto_318939 ?auto_318941 ) ) ( not ( = ?auto_318939 ?auto_318942 ) ) ( not ( = ?auto_318940 ?auto_318941 ) ) ( not ( = ?auto_318940 ?auto_318942 ) ) ( not ( = ?auto_318941 ?auto_318942 ) ) ( ON ?auto_318940 ?auto_318941 ) ( ON ?auto_318939 ?auto_318940 ) ( ON ?auto_318938 ?auto_318939 ) ( ON ?auto_318937 ?auto_318938 ) ( ON ?auto_318936 ?auto_318937 ) ( ON ?auto_318935 ?auto_318936 ) ( CLEAR ?auto_318933 ) ( ON ?auto_318934 ?auto_318935 ) ( CLEAR ?auto_318934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_318933 ?auto_318934 )
      ( MAKE-9PILE ?auto_318933 ?auto_318934 ?auto_318935 ?auto_318936 ?auto_318937 ?auto_318938 ?auto_318939 ?auto_318940 ?auto_318941 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318952 - BLOCK
      ?auto_318953 - BLOCK
      ?auto_318954 - BLOCK
      ?auto_318955 - BLOCK
      ?auto_318956 - BLOCK
      ?auto_318957 - BLOCK
      ?auto_318958 - BLOCK
      ?auto_318959 - BLOCK
      ?auto_318960 - BLOCK
    )
    :vars
    (
      ?auto_318961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318960 ?auto_318961 ) ( ON-TABLE ?auto_318952 ) ( not ( = ?auto_318952 ?auto_318953 ) ) ( not ( = ?auto_318952 ?auto_318954 ) ) ( not ( = ?auto_318952 ?auto_318955 ) ) ( not ( = ?auto_318952 ?auto_318956 ) ) ( not ( = ?auto_318952 ?auto_318957 ) ) ( not ( = ?auto_318952 ?auto_318958 ) ) ( not ( = ?auto_318952 ?auto_318959 ) ) ( not ( = ?auto_318952 ?auto_318960 ) ) ( not ( = ?auto_318952 ?auto_318961 ) ) ( not ( = ?auto_318953 ?auto_318954 ) ) ( not ( = ?auto_318953 ?auto_318955 ) ) ( not ( = ?auto_318953 ?auto_318956 ) ) ( not ( = ?auto_318953 ?auto_318957 ) ) ( not ( = ?auto_318953 ?auto_318958 ) ) ( not ( = ?auto_318953 ?auto_318959 ) ) ( not ( = ?auto_318953 ?auto_318960 ) ) ( not ( = ?auto_318953 ?auto_318961 ) ) ( not ( = ?auto_318954 ?auto_318955 ) ) ( not ( = ?auto_318954 ?auto_318956 ) ) ( not ( = ?auto_318954 ?auto_318957 ) ) ( not ( = ?auto_318954 ?auto_318958 ) ) ( not ( = ?auto_318954 ?auto_318959 ) ) ( not ( = ?auto_318954 ?auto_318960 ) ) ( not ( = ?auto_318954 ?auto_318961 ) ) ( not ( = ?auto_318955 ?auto_318956 ) ) ( not ( = ?auto_318955 ?auto_318957 ) ) ( not ( = ?auto_318955 ?auto_318958 ) ) ( not ( = ?auto_318955 ?auto_318959 ) ) ( not ( = ?auto_318955 ?auto_318960 ) ) ( not ( = ?auto_318955 ?auto_318961 ) ) ( not ( = ?auto_318956 ?auto_318957 ) ) ( not ( = ?auto_318956 ?auto_318958 ) ) ( not ( = ?auto_318956 ?auto_318959 ) ) ( not ( = ?auto_318956 ?auto_318960 ) ) ( not ( = ?auto_318956 ?auto_318961 ) ) ( not ( = ?auto_318957 ?auto_318958 ) ) ( not ( = ?auto_318957 ?auto_318959 ) ) ( not ( = ?auto_318957 ?auto_318960 ) ) ( not ( = ?auto_318957 ?auto_318961 ) ) ( not ( = ?auto_318958 ?auto_318959 ) ) ( not ( = ?auto_318958 ?auto_318960 ) ) ( not ( = ?auto_318958 ?auto_318961 ) ) ( not ( = ?auto_318959 ?auto_318960 ) ) ( not ( = ?auto_318959 ?auto_318961 ) ) ( not ( = ?auto_318960 ?auto_318961 ) ) ( ON ?auto_318959 ?auto_318960 ) ( ON ?auto_318958 ?auto_318959 ) ( ON ?auto_318957 ?auto_318958 ) ( ON ?auto_318956 ?auto_318957 ) ( ON ?auto_318955 ?auto_318956 ) ( ON ?auto_318954 ?auto_318955 ) ( CLEAR ?auto_318952 ) ( ON ?auto_318953 ?auto_318954 ) ( CLEAR ?auto_318953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_318952 ?auto_318953 )
      ( MAKE-9PILE ?auto_318952 ?auto_318953 ?auto_318954 ?auto_318955 ?auto_318956 ?auto_318957 ?auto_318958 ?auto_318959 ?auto_318960 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318971 - BLOCK
      ?auto_318972 - BLOCK
      ?auto_318973 - BLOCK
      ?auto_318974 - BLOCK
      ?auto_318975 - BLOCK
      ?auto_318976 - BLOCK
      ?auto_318977 - BLOCK
      ?auto_318978 - BLOCK
      ?auto_318979 - BLOCK
    )
    :vars
    (
      ?auto_318980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318979 ?auto_318980 ) ( not ( = ?auto_318971 ?auto_318972 ) ) ( not ( = ?auto_318971 ?auto_318973 ) ) ( not ( = ?auto_318971 ?auto_318974 ) ) ( not ( = ?auto_318971 ?auto_318975 ) ) ( not ( = ?auto_318971 ?auto_318976 ) ) ( not ( = ?auto_318971 ?auto_318977 ) ) ( not ( = ?auto_318971 ?auto_318978 ) ) ( not ( = ?auto_318971 ?auto_318979 ) ) ( not ( = ?auto_318971 ?auto_318980 ) ) ( not ( = ?auto_318972 ?auto_318973 ) ) ( not ( = ?auto_318972 ?auto_318974 ) ) ( not ( = ?auto_318972 ?auto_318975 ) ) ( not ( = ?auto_318972 ?auto_318976 ) ) ( not ( = ?auto_318972 ?auto_318977 ) ) ( not ( = ?auto_318972 ?auto_318978 ) ) ( not ( = ?auto_318972 ?auto_318979 ) ) ( not ( = ?auto_318972 ?auto_318980 ) ) ( not ( = ?auto_318973 ?auto_318974 ) ) ( not ( = ?auto_318973 ?auto_318975 ) ) ( not ( = ?auto_318973 ?auto_318976 ) ) ( not ( = ?auto_318973 ?auto_318977 ) ) ( not ( = ?auto_318973 ?auto_318978 ) ) ( not ( = ?auto_318973 ?auto_318979 ) ) ( not ( = ?auto_318973 ?auto_318980 ) ) ( not ( = ?auto_318974 ?auto_318975 ) ) ( not ( = ?auto_318974 ?auto_318976 ) ) ( not ( = ?auto_318974 ?auto_318977 ) ) ( not ( = ?auto_318974 ?auto_318978 ) ) ( not ( = ?auto_318974 ?auto_318979 ) ) ( not ( = ?auto_318974 ?auto_318980 ) ) ( not ( = ?auto_318975 ?auto_318976 ) ) ( not ( = ?auto_318975 ?auto_318977 ) ) ( not ( = ?auto_318975 ?auto_318978 ) ) ( not ( = ?auto_318975 ?auto_318979 ) ) ( not ( = ?auto_318975 ?auto_318980 ) ) ( not ( = ?auto_318976 ?auto_318977 ) ) ( not ( = ?auto_318976 ?auto_318978 ) ) ( not ( = ?auto_318976 ?auto_318979 ) ) ( not ( = ?auto_318976 ?auto_318980 ) ) ( not ( = ?auto_318977 ?auto_318978 ) ) ( not ( = ?auto_318977 ?auto_318979 ) ) ( not ( = ?auto_318977 ?auto_318980 ) ) ( not ( = ?auto_318978 ?auto_318979 ) ) ( not ( = ?auto_318978 ?auto_318980 ) ) ( not ( = ?auto_318979 ?auto_318980 ) ) ( ON ?auto_318978 ?auto_318979 ) ( ON ?auto_318977 ?auto_318978 ) ( ON ?auto_318976 ?auto_318977 ) ( ON ?auto_318975 ?auto_318976 ) ( ON ?auto_318974 ?auto_318975 ) ( ON ?auto_318973 ?auto_318974 ) ( ON ?auto_318972 ?auto_318973 ) ( ON ?auto_318971 ?auto_318972 ) ( CLEAR ?auto_318971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318971 )
      ( MAKE-9PILE ?auto_318971 ?auto_318972 ?auto_318973 ?auto_318974 ?auto_318975 ?auto_318976 ?auto_318977 ?auto_318978 ?auto_318979 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_318990 - BLOCK
      ?auto_318991 - BLOCK
      ?auto_318992 - BLOCK
      ?auto_318993 - BLOCK
      ?auto_318994 - BLOCK
      ?auto_318995 - BLOCK
      ?auto_318996 - BLOCK
      ?auto_318997 - BLOCK
      ?auto_318998 - BLOCK
    )
    :vars
    (
      ?auto_318999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_318998 ?auto_318999 ) ( not ( = ?auto_318990 ?auto_318991 ) ) ( not ( = ?auto_318990 ?auto_318992 ) ) ( not ( = ?auto_318990 ?auto_318993 ) ) ( not ( = ?auto_318990 ?auto_318994 ) ) ( not ( = ?auto_318990 ?auto_318995 ) ) ( not ( = ?auto_318990 ?auto_318996 ) ) ( not ( = ?auto_318990 ?auto_318997 ) ) ( not ( = ?auto_318990 ?auto_318998 ) ) ( not ( = ?auto_318990 ?auto_318999 ) ) ( not ( = ?auto_318991 ?auto_318992 ) ) ( not ( = ?auto_318991 ?auto_318993 ) ) ( not ( = ?auto_318991 ?auto_318994 ) ) ( not ( = ?auto_318991 ?auto_318995 ) ) ( not ( = ?auto_318991 ?auto_318996 ) ) ( not ( = ?auto_318991 ?auto_318997 ) ) ( not ( = ?auto_318991 ?auto_318998 ) ) ( not ( = ?auto_318991 ?auto_318999 ) ) ( not ( = ?auto_318992 ?auto_318993 ) ) ( not ( = ?auto_318992 ?auto_318994 ) ) ( not ( = ?auto_318992 ?auto_318995 ) ) ( not ( = ?auto_318992 ?auto_318996 ) ) ( not ( = ?auto_318992 ?auto_318997 ) ) ( not ( = ?auto_318992 ?auto_318998 ) ) ( not ( = ?auto_318992 ?auto_318999 ) ) ( not ( = ?auto_318993 ?auto_318994 ) ) ( not ( = ?auto_318993 ?auto_318995 ) ) ( not ( = ?auto_318993 ?auto_318996 ) ) ( not ( = ?auto_318993 ?auto_318997 ) ) ( not ( = ?auto_318993 ?auto_318998 ) ) ( not ( = ?auto_318993 ?auto_318999 ) ) ( not ( = ?auto_318994 ?auto_318995 ) ) ( not ( = ?auto_318994 ?auto_318996 ) ) ( not ( = ?auto_318994 ?auto_318997 ) ) ( not ( = ?auto_318994 ?auto_318998 ) ) ( not ( = ?auto_318994 ?auto_318999 ) ) ( not ( = ?auto_318995 ?auto_318996 ) ) ( not ( = ?auto_318995 ?auto_318997 ) ) ( not ( = ?auto_318995 ?auto_318998 ) ) ( not ( = ?auto_318995 ?auto_318999 ) ) ( not ( = ?auto_318996 ?auto_318997 ) ) ( not ( = ?auto_318996 ?auto_318998 ) ) ( not ( = ?auto_318996 ?auto_318999 ) ) ( not ( = ?auto_318997 ?auto_318998 ) ) ( not ( = ?auto_318997 ?auto_318999 ) ) ( not ( = ?auto_318998 ?auto_318999 ) ) ( ON ?auto_318997 ?auto_318998 ) ( ON ?auto_318996 ?auto_318997 ) ( ON ?auto_318995 ?auto_318996 ) ( ON ?auto_318994 ?auto_318995 ) ( ON ?auto_318993 ?auto_318994 ) ( ON ?auto_318992 ?auto_318993 ) ( ON ?auto_318991 ?auto_318992 ) ( ON ?auto_318990 ?auto_318991 ) ( CLEAR ?auto_318990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_318990 )
      ( MAKE-9PILE ?auto_318990 ?auto_318991 ?auto_318992 ?auto_318993 ?auto_318994 ?auto_318995 ?auto_318996 ?auto_318997 ?auto_318998 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319010 - BLOCK
      ?auto_319011 - BLOCK
      ?auto_319012 - BLOCK
      ?auto_319013 - BLOCK
      ?auto_319014 - BLOCK
      ?auto_319015 - BLOCK
      ?auto_319016 - BLOCK
      ?auto_319017 - BLOCK
      ?auto_319018 - BLOCK
      ?auto_319019 - BLOCK
    )
    :vars
    (
      ?auto_319020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_319018 ) ( ON ?auto_319019 ?auto_319020 ) ( CLEAR ?auto_319019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_319010 ) ( ON ?auto_319011 ?auto_319010 ) ( ON ?auto_319012 ?auto_319011 ) ( ON ?auto_319013 ?auto_319012 ) ( ON ?auto_319014 ?auto_319013 ) ( ON ?auto_319015 ?auto_319014 ) ( ON ?auto_319016 ?auto_319015 ) ( ON ?auto_319017 ?auto_319016 ) ( ON ?auto_319018 ?auto_319017 ) ( not ( = ?auto_319010 ?auto_319011 ) ) ( not ( = ?auto_319010 ?auto_319012 ) ) ( not ( = ?auto_319010 ?auto_319013 ) ) ( not ( = ?auto_319010 ?auto_319014 ) ) ( not ( = ?auto_319010 ?auto_319015 ) ) ( not ( = ?auto_319010 ?auto_319016 ) ) ( not ( = ?auto_319010 ?auto_319017 ) ) ( not ( = ?auto_319010 ?auto_319018 ) ) ( not ( = ?auto_319010 ?auto_319019 ) ) ( not ( = ?auto_319010 ?auto_319020 ) ) ( not ( = ?auto_319011 ?auto_319012 ) ) ( not ( = ?auto_319011 ?auto_319013 ) ) ( not ( = ?auto_319011 ?auto_319014 ) ) ( not ( = ?auto_319011 ?auto_319015 ) ) ( not ( = ?auto_319011 ?auto_319016 ) ) ( not ( = ?auto_319011 ?auto_319017 ) ) ( not ( = ?auto_319011 ?auto_319018 ) ) ( not ( = ?auto_319011 ?auto_319019 ) ) ( not ( = ?auto_319011 ?auto_319020 ) ) ( not ( = ?auto_319012 ?auto_319013 ) ) ( not ( = ?auto_319012 ?auto_319014 ) ) ( not ( = ?auto_319012 ?auto_319015 ) ) ( not ( = ?auto_319012 ?auto_319016 ) ) ( not ( = ?auto_319012 ?auto_319017 ) ) ( not ( = ?auto_319012 ?auto_319018 ) ) ( not ( = ?auto_319012 ?auto_319019 ) ) ( not ( = ?auto_319012 ?auto_319020 ) ) ( not ( = ?auto_319013 ?auto_319014 ) ) ( not ( = ?auto_319013 ?auto_319015 ) ) ( not ( = ?auto_319013 ?auto_319016 ) ) ( not ( = ?auto_319013 ?auto_319017 ) ) ( not ( = ?auto_319013 ?auto_319018 ) ) ( not ( = ?auto_319013 ?auto_319019 ) ) ( not ( = ?auto_319013 ?auto_319020 ) ) ( not ( = ?auto_319014 ?auto_319015 ) ) ( not ( = ?auto_319014 ?auto_319016 ) ) ( not ( = ?auto_319014 ?auto_319017 ) ) ( not ( = ?auto_319014 ?auto_319018 ) ) ( not ( = ?auto_319014 ?auto_319019 ) ) ( not ( = ?auto_319014 ?auto_319020 ) ) ( not ( = ?auto_319015 ?auto_319016 ) ) ( not ( = ?auto_319015 ?auto_319017 ) ) ( not ( = ?auto_319015 ?auto_319018 ) ) ( not ( = ?auto_319015 ?auto_319019 ) ) ( not ( = ?auto_319015 ?auto_319020 ) ) ( not ( = ?auto_319016 ?auto_319017 ) ) ( not ( = ?auto_319016 ?auto_319018 ) ) ( not ( = ?auto_319016 ?auto_319019 ) ) ( not ( = ?auto_319016 ?auto_319020 ) ) ( not ( = ?auto_319017 ?auto_319018 ) ) ( not ( = ?auto_319017 ?auto_319019 ) ) ( not ( = ?auto_319017 ?auto_319020 ) ) ( not ( = ?auto_319018 ?auto_319019 ) ) ( not ( = ?auto_319018 ?auto_319020 ) ) ( not ( = ?auto_319019 ?auto_319020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_319019 ?auto_319020 )
      ( !STACK ?auto_319019 ?auto_319018 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319031 - BLOCK
      ?auto_319032 - BLOCK
      ?auto_319033 - BLOCK
      ?auto_319034 - BLOCK
      ?auto_319035 - BLOCK
      ?auto_319036 - BLOCK
      ?auto_319037 - BLOCK
      ?auto_319038 - BLOCK
      ?auto_319039 - BLOCK
      ?auto_319040 - BLOCK
    )
    :vars
    (
      ?auto_319041 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_319039 ) ( ON ?auto_319040 ?auto_319041 ) ( CLEAR ?auto_319040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_319031 ) ( ON ?auto_319032 ?auto_319031 ) ( ON ?auto_319033 ?auto_319032 ) ( ON ?auto_319034 ?auto_319033 ) ( ON ?auto_319035 ?auto_319034 ) ( ON ?auto_319036 ?auto_319035 ) ( ON ?auto_319037 ?auto_319036 ) ( ON ?auto_319038 ?auto_319037 ) ( ON ?auto_319039 ?auto_319038 ) ( not ( = ?auto_319031 ?auto_319032 ) ) ( not ( = ?auto_319031 ?auto_319033 ) ) ( not ( = ?auto_319031 ?auto_319034 ) ) ( not ( = ?auto_319031 ?auto_319035 ) ) ( not ( = ?auto_319031 ?auto_319036 ) ) ( not ( = ?auto_319031 ?auto_319037 ) ) ( not ( = ?auto_319031 ?auto_319038 ) ) ( not ( = ?auto_319031 ?auto_319039 ) ) ( not ( = ?auto_319031 ?auto_319040 ) ) ( not ( = ?auto_319031 ?auto_319041 ) ) ( not ( = ?auto_319032 ?auto_319033 ) ) ( not ( = ?auto_319032 ?auto_319034 ) ) ( not ( = ?auto_319032 ?auto_319035 ) ) ( not ( = ?auto_319032 ?auto_319036 ) ) ( not ( = ?auto_319032 ?auto_319037 ) ) ( not ( = ?auto_319032 ?auto_319038 ) ) ( not ( = ?auto_319032 ?auto_319039 ) ) ( not ( = ?auto_319032 ?auto_319040 ) ) ( not ( = ?auto_319032 ?auto_319041 ) ) ( not ( = ?auto_319033 ?auto_319034 ) ) ( not ( = ?auto_319033 ?auto_319035 ) ) ( not ( = ?auto_319033 ?auto_319036 ) ) ( not ( = ?auto_319033 ?auto_319037 ) ) ( not ( = ?auto_319033 ?auto_319038 ) ) ( not ( = ?auto_319033 ?auto_319039 ) ) ( not ( = ?auto_319033 ?auto_319040 ) ) ( not ( = ?auto_319033 ?auto_319041 ) ) ( not ( = ?auto_319034 ?auto_319035 ) ) ( not ( = ?auto_319034 ?auto_319036 ) ) ( not ( = ?auto_319034 ?auto_319037 ) ) ( not ( = ?auto_319034 ?auto_319038 ) ) ( not ( = ?auto_319034 ?auto_319039 ) ) ( not ( = ?auto_319034 ?auto_319040 ) ) ( not ( = ?auto_319034 ?auto_319041 ) ) ( not ( = ?auto_319035 ?auto_319036 ) ) ( not ( = ?auto_319035 ?auto_319037 ) ) ( not ( = ?auto_319035 ?auto_319038 ) ) ( not ( = ?auto_319035 ?auto_319039 ) ) ( not ( = ?auto_319035 ?auto_319040 ) ) ( not ( = ?auto_319035 ?auto_319041 ) ) ( not ( = ?auto_319036 ?auto_319037 ) ) ( not ( = ?auto_319036 ?auto_319038 ) ) ( not ( = ?auto_319036 ?auto_319039 ) ) ( not ( = ?auto_319036 ?auto_319040 ) ) ( not ( = ?auto_319036 ?auto_319041 ) ) ( not ( = ?auto_319037 ?auto_319038 ) ) ( not ( = ?auto_319037 ?auto_319039 ) ) ( not ( = ?auto_319037 ?auto_319040 ) ) ( not ( = ?auto_319037 ?auto_319041 ) ) ( not ( = ?auto_319038 ?auto_319039 ) ) ( not ( = ?auto_319038 ?auto_319040 ) ) ( not ( = ?auto_319038 ?auto_319041 ) ) ( not ( = ?auto_319039 ?auto_319040 ) ) ( not ( = ?auto_319039 ?auto_319041 ) ) ( not ( = ?auto_319040 ?auto_319041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_319040 ?auto_319041 )
      ( !STACK ?auto_319040 ?auto_319039 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319052 - BLOCK
      ?auto_319053 - BLOCK
      ?auto_319054 - BLOCK
      ?auto_319055 - BLOCK
      ?auto_319056 - BLOCK
      ?auto_319057 - BLOCK
      ?auto_319058 - BLOCK
      ?auto_319059 - BLOCK
      ?auto_319060 - BLOCK
      ?auto_319061 - BLOCK
    )
    :vars
    (
      ?auto_319062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319061 ?auto_319062 ) ( ON-TABLE ?auto_319052 ) ( ON ?auto_319053 ?auto_319052 ) ( ON ?auto_319054 ?auto_319053 ) ( ON ?auto_319055 ?auto_319054 ) ( ON ?auto_319056 ?auto_319055 ) ( ON ?auto_319057 ?auto_319056 ) ( ON ?auto_319058 ?auto_319057 ) ( ON ?auto_319059 ?auto_319058 ) ( not ( = ?auto_319052 ?auto_319053 ) ) ( not ( = ?auto_319052 ?auto_319054 ) ) ( not ( = ?auto_319052 ?auto_319055 ) ) ( not ( = ?auto_319052 ?auto_319056 ) ) ( not ( = ?auto_319052 ?auto_319057 ) ) ( not ( = ?auto_319052 ?auto_319058 ) ) ( not ( = ?auto_319052 ?auto_319059 ) ) ( not ( = ?auto_319052 ?auto_319060 ) ) ( not ( = ?auto_319052 ?auto_319061 ) ) ( not ( = ?auto_319052 ?auto_319062 ) ) ( not ( = ?auto_319053 ?auto_319054 ) ) ( not ( = ?auto_319053 ?auto_319055 ) ) ( not ( = ?auto_319053 ?auto_319056 ) ) ( not ( = ?auto_319053 ?auto_319057 ) ) ( not ( = ?auto_319053 ?auto_319058 ) ) ( not ( = ?auto_319053 ?auto_319059 ) ) ( not ( = ?auto_319053 ?auto_319060 ) ) ( not ( = ?auto_319053 ?auto_319061 ) ) ( not ( = ?auto_319053 ?auto_319062 ) ) ( not ( = ?auto_319054 ?auto_319055 ) ) ( not ( = ?auto_319054 ?auto_319056 ) ) ( not ( = ?auto_319054 ?auto_319057 ) ) ( not ( = ?auto_319054 ?auto_319058 ) ) ( not ( = ?auto_319054 ?auto_319059 ) ) ( not ( = ?auto_319054 ?auto_319060 ) ) ( not ( = ?auto_319054 ?auto_319061 ) ) ( not ( = ?auto_319054 ?auto_319062 ) ) ( not ( = ?auto_319055 ?auto_319056 ) ) ( not ( = ?auto_319055 ?auto_319057 ) ) ( not ( = ?auto_319055 ?auto_319058 ) ) ( not ( = ?auto_319055 ?auto_319059 ) ) ( not ( = ?auto_319055 ?auto_319060 ) ) ( not ( = ?auto_319055 ?auto_319061 ) ) ( not ( = ?auto_319055 ?auto_319062 ) ) ( not ( = ?auto_319056 ?auto_319057 ) ) ( not ( = ?auto_319056 ?auto_319058 ) ) ( not ( = ?auto_319056 ?auto_319059 ) ) ( not ( = ?auto_319056 ?auto_319060 ) ) ( not ( = ?auto_319056 ?auto_319061 ) ) ( not ( = ?auto_319056 ?auto_319062 ) ) ( not ( = ?auto_319057 ?auto_319058 ) ) ( not ( = ?auto_319057 ?auto_319059 ) ) ( not ( = ?auto_319057 ?auto_319060 ) ) ( not ( = ?auto_319057 ?auto_319061 ) ) ( not ( = ?auto_319057 ?auto_319062 ) ) ( not ( = ?auto_319058 ?auto_319059 ) ) ( not ( = ?auto_319058 ?auto_319060 ) ) ( not ( = ?auto_319058 ?auto_319061 ) ) ( not ( = ?auto_319058 ?auto_319062 ) ) ( not ( = ?auto_319059 ?auto_319060 ) ) ( not ( = ?auto_319059 ?auto_319061 ) ) ( not ( = ?auto_319059 ?auto_319062 ) ) ( not ( = ?auto_319060 ?auto_319061 ) ) ( not ( = ?auto_319060 ?auto_319062 ) ) ( not ( = ?auto_319061 ?auto_319062 ) ) ( CLEAR ?auto_319059 ) ( ON ?auto_319060 ?auto_319061 ) ( CLEAR ?auto_319060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_319052 ?auto_319053 ?auto_319054 ?auto_319055 ?auto_319056 ?auto_319057 ?auto_319058 ?auto_319059 ?auto_319060 )
      ( MAKE-10PILE ?auto_319052 ?auto_319053 ?auto_319054 ?auto_319055 ?auto_319056 ?auto_319057 ?auto_319058 ?auto_319059 ?auto_319060 ?auto_319061 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319073 - BLOCK
      ?auto_319074 - BLOCK
      ?auto_319075 - BLOCK
      ?auto_319076 - BLOCK
      ?auto_319077 - BLOCK
      ?auto_319078 - BLOCK
      ?auto_319079 - BLOCK
      ?auto_319080 - BLOCK
      ?auto_319081 - BLOCK
      ?auto_319082 - BLOCK
    )
    :vars
    (
      ?auto_319083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319082 ?auto_319083 ) ( ON-TABLE ?auto_319073 ) ( ON ?auto_319074 ?auto_319073 ) ( ON ?auto_319075 ?auto_319074 ) ( ON ?auto_319076 ?auto_319075 ) ( ON ?auto_319077 ?auto_319076 ) ( ON ?auto_319078 ?auto_319077 ) ( ON ?auto_319079 ?auto_319078 ) ( ON ?auto_319080 ?auto_319079 ) ( not ( = ?auto_319073 ?auto_319074 ) ) ( not ( = ?auto_319073 ?auto_319075 ) ) ( not ( = ?auto_319073 ?auto_319076 ) ) ( not ( = ?auto_319073 ?auto_319077 ) ) ( not ( = ?auto_319073 ?auto_319078 ) ) ( not ( = ?auto_319073 ?auto_319079 ) ) ( not ( = ?auto_319073 ?auto_319080 ) ) ( not ( = ?auto_319073 ?auto_319081 ) ) ( not ( = ?auto_319073 ?auto_319082 ) ) ( not ( = ?auto_319073 ?auto_319083 ) ) ( not ( = ?auto_319074 ?auto_319075 ) ) ( not ( = ?auto_319074 ?auto_319076 ) ) ( not ( = ?auto_319074 ?auto_319077 ) ) ( not ( = ?auto_319074 ?auto_319078 ) ) ( not ( = ?auto_319074 ?auto_319079 ) ) ( not ( = ?auto_319074 ?auto_319080 ) ) ( not ( = ?auto_319074 ?auto_319081 ) ) ( not ( = ?auto_319074 ?auto_319082 ) ) ( not ( = ?auto_319074 ?auto_319083 ) ) ( not ( = ?auto_319075 ?auto_319076 ) ) ( not ( = ?auto_319075 ?auto_319077 ) ) ( not ( = ?auto_319075 ?auto_319078 ) ) ( not ( = ?auto_319075 ?auto_319079 ) ) ( not ( = ?auto_319075 ?auto_319080 ) ) ( not ( = ?auto_319075 ?auto_319081 ) ) ( not ( = ?auto_319075 ?auto_319082 ) ) ( not ( = ?auto_319075 ?auto_319083 ) ) ( not ( = ?auto_319076 ?auto_319077 ) ) ( not ( = ?auto_319076 ?auto_319078 ) ) ( not ( = ?auto_319076 ?auto_319079 ) ) ( not ( = ?auto_319076 ?auto_319080 ) ) ( not ( = ?auto_319076 ?auto_319081 ) ) ( not ( = ?auto_319076 ?auto_319082 ) ) ( not ( = ?auto_319076 ?auto_319083 ) ) ( not ( = ?auto_319077 ?auto_319078 ) ) ( not ( = ?auto_319077 ?auto_319079 ) ) ( not ( = ?auto_319077 ?auto_319080 ) ) ( not ( = ?auto_319077 ?auto_319081 ) ) ( not ( = ?auto_319077 ?auto_319082 ) ) ( not ( = ?auto_319077 ?auto_319083 ) ) ( not ( = ?auto_319078 ?auto_319079 ) ) ( not ( = ?auto_319078 ?auto_319080 ) ) ( not ( = ?auto_319078 ?auto_319081 ) ) ( not ( = ?auto_319078 ?auto_319082 ) ) ( not ( = ?auto_319078 ?auto_319083 ) ) ( not ( = ?auto_319079 ?auto_319080 ) ) ( not ( = ?auto_319079 ?auto_319081 ) ) ( not ( = ?auto_319079 ?auto_319082 ) ) ( not ( = ?auto_319079 ?auto_319083 ) ) ( not ( = ?auto_319080 ?auto_319081 ) ) ( not ( = ?auto_319080 ?auto_319082 ) ) ( not ( = ?auto_319080 ?auto_319083 ) ) ( not ( = ?auto_319081 ?auto_319082 ) ) ( not ( = ?auto_319081 ?auto_319083 ) ) ( not ( = ?auto_319082 ?auto_319083 ) ) ( CLEAR ?auto_319080 ) ( ON ?auto_319081 ?auto_319082 ) ( CLEAR ?auto_319081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_319073 ?auto_319074 ?auto_319075 ?auto_319076 ?auto_319077 ?auto_319078 ?auto_319079 ?auto_319080 ?auto_319081 )
      ( MAKE-10PILE ?auto_319073 ?auto_319074 ?auto_319075 ?auto_319076 ?auto_319077 ?auto_319078 ?auto_319079 ?auto_319080 ?auto_319081 ?auto_319082 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319094 - BLOCK
      ?auto_319095 - BLOCK
      ?auto_319096 - BLOCK
      ?auto_319097 - BLOCK
      ?auto_319098 - BLOCK
      ?auto_319099 - BLOCK
      ?auto_319100 - BLOCK
      ?auto_319101 - BLOCK
      ?auto_319102 - BLOCK
      ?auto_319103 - BLOCK
    )
    :vars
    (
      ?auto_319104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319103 ?auto_319104 ) ( ON-TABLE ?auto_319094 ) ( ON ?auto_319095 ?auto_319094 ) ( ON ?auto_319096 ?auto_319095 ) ( ON ?auto_319097 ?auto_319096 ) ( ON ?auto_319098 ?auto_319097 ) ( ON ?auto_319099 ?auto_319098 ) ( ON ?auto_319100 ?auto_319099 ) ( not ( = ?auto_319094 ?auto_319095 ) ) ( not ( = ?auto_319094 ?auto_319096 ) ) ( not ( = ?auto_319094 ?auto_319097 ) ) ( not ( = ?auto_319094 ?auto_319098 ) ) ( not ( = ?auto_319094 ?auto_319099 ) ) ( not ( = ?auto_319094 ?auto_319100 ) ) ( not ( = ?auto_319094 ?auto_319101 ) ) ( not ( = ?auto_319094 ?auto_319102 ) ) ( not ( = ?auto_319094 ?auto_319103 ) ) ( not ( = ?auto_319094 ?auto_319104 ) ) ( not ( = ?auto_319095 ?auto_319096 ) ) ( not ( = ?auto_319095 ?auto_319097 ) ) ( not ( = ?auto_319095 ?auto_319098 ) ) ( not ( = ?auto_319095 ?auto_319099 ) ) ( not ( = ?auto_319095 ?auto_319100 ) ) ( not ( = ?auto_319095 ?auto_319101 ) ) ( not ( = ?auto_319095 ?auto_319102 ) ) ( not ( = ?auto_319095 ?auto_319103 ) ) ( not ( = ?auto_319095 ?auto_319104 ) ) ( not ( = ?auto_319096 ?auto_319097 ) ) ( not ( = ?auto_319096 ?auto_319098 ) ) ( not ( = ?auto_319096 ?auto_319099 ) ) ( not ( = ?auto_319096 ?auto_319100 ) ) ( not ( = ?auto_319096 ?auto_319101 ) ) ( not ( = ?auto_319096 ?auto_319102 ) ) ( not ( = ?auto_319096 ?auto_319103 ) ) ( not ( = ?auto_319096 ?auto_319104 ) ) ( not ( = ?auto_319097 ?auto_319098 ) ) ( not ( = ?auto_319097 ?auto_319099 ) ) ( not ( = ?auto_319097 ?auto_319100 ) ) ( not ( = ?auto_319097 ?auto_319101 ) ) ( not ( = ?auto_319097 ?auto_319102 ) ) ( not ( = ?auto_319097 ?auto_319103 ) ) ( not ( = ?auto_319097 ?auto_319104 ) ) ( not ( = ?auto_319098 ?auto_319099 ) ) ( not ( = ?auto_319098 ?auto_319100 ) ) ( not ( = ?auto_319098 ?auto_319101 ) ) ( not ( = ?auto_319098 ?auto_319102 ) ) ( not ( = ?auto_319098 ?auto_319103 ) ) ( not ( = ?auto_319098 ?auto_319104 ) ) ( not ( = ?auto_319099 ?auto_319100 ) ) ( not ( = ?auto_319099 ?auto_319101 ) ) ( not ( = ?auto_319099 ?auto_319102 ) ) ( not ( = ?auto_319099 ?auto_319103 ) ) ( not ( = ?auto_319099 ?auto_319104 ) ) ( not ( = ?auto_319100 ?auto_319101 ) ) ( not ( = ?auto_319100 ?auto_319102 ) ) ( not ( = ?auto_319100 ?auto_319103 ) ) ( not ( = ?auto_319100 ?auto_319104 ) ) ( not ( = ?auto_319101 ?auto_319102 ) ) ( not ( = ?auto_319101 ?auto_319103 ) ) ( not ( = ?auto_319101 ?auto_319104 ) ) ( not ( = ?auto_319102 ?auto_319103 ) ) ( not ( = ?auto_319102 ?auto_319104 ) ) ( not ( = ?auto_319103 ?auto_319104 ) ) ( ON ?auto_319102 ?auto_319103 ) ( CLEAR ?auto_319100 ) ( ON ?auto_319101 ?auto_319102 ) ( CLEAR ?auto_319101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_319094 ?auto_319095 ?auto_319096 ?auto_319097 ?auto_319098 ?auto_319099 ?auto_319100 ?auto_319101 )
      ( MAKE-10PILE ?auto_319094 ?auto_319095 ?auto_319096 ?auto_319097 ?auto_319098 ?auto_319099 ?auto_319100 ?auto_319101 ?auto_319102 ?auto_319103 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319115 - BLOCK
      ?auto_319116 - BLOCK
      ?auto_319117 - BLOCK
      ?auto_319118 - BLOCK
      ?auto_319119 - BLOCK
      ?auto_319120 - BLOCK
      ?auto_319121 - BLOCK
      ?auto_319122 - BLOCK
      ?auto_319123 - BLOCK
      ?auto_319124 - BLOCK
    )
    :vars
    (
      ?auto_319125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319124 ?auto_319125 ) ( ON-TABLE ?auto_319115 ) ( ON ?auto_319116 ?auto_319115 ) ( ON ?auto_319117 ?auto_319116 ) ( ON ?auto_319118 ?auto_319117 ) ( ON ?auto_319119 ?auto_319118 ) ( ON ?auto_319120 ?auto_319119 ) ( ON ?auto_319121 ?auto_319120 ) ( not ( = ?auto_319115 ?auto_319116 ) ) ( not ( = ?auto_319115 ?auto_319117 ) ) ( not ( = ?auto_319115 ?auto_319118 ) ) ( not ( = ?auto_319115 ?auto_319119 ) ) ( not ( = ?auto_319115 ?auto_319120 ) ) ( not ( = ?auto_319115 ?auto_319121 ) ) ( not ( = ?auto_319115 ?auto_319122 ) ) ( not ( = ?auto_319115 ?auto_319123 ) ) ( not ( = ?auto_319115 ?auto_319124 ) ) ( not ( = ?auto_319115 ?auto_319125 ) ) ( not ( = ?auto_319116 ?auto_319117 ) ) ( not ( = ?auto_319116 ?auto_319118 ) ) ( not ( = ?auto_319116 ?auto_319119 ) ) ( not ( = ?auto_319116 ?auto_319120 ) ) ( not ( = ?auto_319116 ?auto_319121 ) ) ( not ( = ?auto_319116 ?auto_319122 ) ) ( not ( = ?auto_319116 ?auto_319123 ) ) ( not ( = ?auto_319116 ?auto_319124 ) ) ( not ( = ?auto_319116 ?auto_319125 ) ) ( not ( = ?auto_319117 ?auto_319118 ) ) ( not ( = ?auto_319117 ?auto_319119 ) ) ( not ( = ?auto_319117 ?auto_319120 ) ) ( not ( = ?auto_319117 ?auto_319121 ) ) ( not ( = ?auto_319117 ?auto_319122 ) ) ( not ( = ?auto_319117 ?auto_319123 ) ) ( not ( = ?auto_319117 ?auto_319124 ) ) ( not ( = ?auto_319117 ?auto_319125 ) ) ( not ( = ?auto_319118 ?auto_319119 ) ) ( not ( = ?auto_319118 ?auto_319120 ) ) ( not ( = ?auto_319118 ?auto_319121 ) ) ( not ( = ?auto_319118 ?auto_319122 ) ) ( not ( = ?auto_319118 ?auto_319123 ) ) ( not ( = ?auto_319118 ?auto_319124 ) ) ( not ( = ?auto_319118 ?auto_319125 ) ) ( not ( = ?auto_319119 ?auto_319120 ) ) ( not ( = ?auto_319119 ?auto_319121 ) ) ( not ( = ?auto_319119 ?auto_319122 ) ) ( not ( = ?auto_319119 ?auto_319123 ) ) ( not ( = ?auto_319119 ?auto_319124 ) ) ( not ( = ?auto_319119 ?auto_319125 ) ) ( not ( = ?auto_319120 ?auto_319121 ) ) ( not ( = ?auto_319120 ?auto_319122 ) ) ( not ( = ?auto_319120 ?auto_319123 ) ) ( not ( = ?auto_319120 ?auto_319124 ) ) ( not ( = ?auto_319120 ?auto_319125 ) ) ( not ( = ?auto_319121 ?auto_319122 ) ) ( not ( = ?auto_319121 ?auto_319123 ) ) ( not ( = ?auto_319121 ?auto_319124 ) ) ( not ( = ?auto_319121 ?auto_319125 ) ) ( not ( = ?auto_319122 ?auto_319123 ) ) ( not ( = ?auto_319122 ?auto_319124 ) ) ( not ( = ?auto_319122 ?auto_319125 ) ) ( not ( = ?auto_319123 ?auto_319124 ) ) ( not ( = ?auto_319123 ?auto_319125 ) ) ( not ( = ?auto_319124 ?auto_319125 ) ) ( ON ?auto_319123 ?auto_319124 ) ( CLEAR ?auto_319121 ) ( ON ?auto_319122 ?auto_319123 ) ( CLEAR ?auto_319122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_319115 ?auto_319116 ?auto_319117 ?auto_319118 ?auto_319119 ?auto_319120 ?auto_319121 ?auto_319122 )
      ( MAKE-10PILE ?auto_319115 ?auto_319116 ?auto_319117 ?auto_319118 ?auto_319119 ?auto_319120 ?auto_319121 ?auto_319122 ?auto_319123 ?auto_319124 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319136 - BLOCK
      ?auto_319137 - BLOCK
      ?auto_319138 - BLOCK
      ?auto_319139 - BLOCK
      ?auto_319140 - BLOCK
      ?auto_319141 - BLOCK
      ?auto_319142 - BLOCK
      ?auto_319143 - BLOCK
      ?auto_319144 - BLOCK
      ?auto_319145 - BLOCK
    )
    :vars
    (
      ?auto_319146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319145 ?auto_319146 ) ( ON-TABLE ?auto_319136 ) ( ON ?auto_319137 ?auto_319136 ) ( ON ?auto_319138 ?auto_319137 ) ( ON ?auto_319139 ?auto_319138 ) ( ON ?auto_319140 ?auto_319139 ) ( ON ?auto_319141 ?auto_319140 ) ( not ( = ?auto_319136 ?auto_319137 ) ) ( not ( = ?auto_319136 ?auto_319138 ) ) ( not ( = ?auto_319136 ?auto_319139 ) ) ( not ( = ?auto_319136 ?auto_319140 ) ) ( not ( = ?auto_319136 ?auto_319141 ) ) ( not ( = ?auto_319136 ?auto_319142 ) ) ( not ( = ?auto_319136 ?auto_319143 ) ) ( not ( = ?auto_319136 ?auto_319144 ) ) ( not ( = ?auto_319136 ?auto_319145 ) ) ( not ( = ?auto_319136 ?auto_319146 ) ) ( not ( = ?auto_319137 ?auto_319138 ) ) ( not ( = ?auto_319137 ?auto_319139 ) ) ( not ( = ?auto_319137 ?auto_319140 ) ) ( not ( = ?auto_319137 ?auto_319141 ) ) ( not ( = ?auto_319137 ?auto_319142 ) ) ( not ( = ?auto_319137 ?auto_319143 ) ) ( not ( = ?auto_319137 ?auto_319144 ) ) ( not ( = ?auto_319137 ?auto_319145 ) ) ( not ( = ?auto_319137 ?auto_319146 ) ) ( not ( = ?auto_319138 ?auto_319139 ) ) ( not ( = ?auto_319138 ?auto_319140 ) ) ( not ( = ?auto_319138 ?auto_319141 ) ) ( not ( = ?auto_319138 ?auto_319142 ) ) ( not ( = ?auto_319138 ?auto_319143 ) ) ( not ( = ?auto_319138 ?auto_319144 ) ) ( not ( = ?auto_319138 ?auto_319145 ) ) ( not ( = ?auto_319138 ?auto_319146 ) ) ( not ( = ?auto_319139 ?auto_319140 ) ) ( not ( = ?auto_319139 ?auto_319141 ) ) ( not ( = ?auto_319139 ?auto_319142 ) ) ( not ( = ?auto_319139 ?auto_319143 ) ) ( not ( = ?auto_319139 ?auto_319144 ) ) ( not ( = ?auto_319139 ?auto_319145 ) ) ( not ( = ?auto_319139 ?auto_319146 ) ) ( not ( = ?auto_319140 ?auto_319141 ) ) ( not ( = ?auto_319140 ?auto_319142 ) ) ( not ( = ?auto_319140 ?auto_319143 ) ) ( not ( = ?auto_319140 ?auto_319144 ) ) ( not ( = ?auto_319140 ?auto_319145 ) ) ( not ( = ?auto_319140 ?auto_319146 ) ) ( not ( = ?auto_319141 ?auto_319142 ) ) ( not ( = ?auto_319141 ?auto_319143 ) ) ( not ( = ?auto_319141 ?auto_319144 ) ) ( not ( = ?auto_319141 ?auto_319145 ) ) ( not ( = ?auto_319141 ?auto_319146 ) ) ( not ( = ?auto_319142 ?auto_319143 ) ) ( not ( = ?auto_319142 ?auto_319144 ) ) ( not ( = ?auto_319142 ?auto_319145 ) ) ( not ( = ?auto_319142 ?auto_319146 ) ) ( not ( = ?auto_319143 ?auto_319144 ) ) ( not ( = ?auto_319143 ?auto_319145 ) ) ( not ( = ?auto_319143 ?auto_319146 ) ) ( not ( = ?auto_319144 ?auto_319145 ) ) ( not ( = ?auto_319144 ?auto_319146 ) ) ( not ( = ?auto_319145 ?auto_319146 ) ) ( ON ?auto_319144 ?auto_319145 ) ( ON ?auto_319143 ?auto_319144 ) ( CLEAR ?auto_319141 ) ( ON ?auto_319142 ?auto_319143 ) ( CLEAR ?auto_319142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_319136 ?auto_319137 ?auto_319138 ?auto_319139 ?auto_319140 ?auto_319141 ?auto_319142 )
      ( MAKE-10PILE ?auto_319136 ?auto_319137 ?auto_319138 ?auto_319139 ?auto_319140 ?auto_319141 ?auto_319142 ?auto_319143 ?auto_319144 ?auto_319145 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319157 - BLOCK
      ?auto_319158 - BLOCK
      ?auto_319159 - BLOCK
      ?auto_319160 - BLOCK
      ?auto_319161 - BLOCK
      ?auto_319162 - BLOCK
      ?auto_319163 - BLOCK
      ?auto_319164 - BLOCK
      ?auto_319165 - BLOCK
      ?auto_319166 - BLOCK
    )
    :vars
    (
      ?auto_319167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319166 ?auto_319167 ) ( ON-TABLE ?auto_319157 ) ( ON ?auto_319158 ?auto_319157 ) ( ON ?auto_319159 ?auto_319158 ) ( ON ?auto_319160 ?auto_319159 ) ( ON ?auto_319161 ?auto_319160 ) ( ON ?auto_319162 ?auto_319161 ) ( not ( = ?auto_319157 ?auto_319158 ) ) ( not ( = ?auto_319157 ?auto_319159 ) ) ( not ( = ?auto_319157 ?auto_319160 ) ) ( not ( = ?auto_319157 ?auto_319161 ) ) ( not ( = ?auto_319157 ?auto_319162 ) ) ( not ( = ?auto_319157 ?auto_319163 ) ) ( not ( = ?auto_319157 ?auto_319164 ) ) ( not ( = ?auto_319157 ?auto_319165 ) ) ( not ( = ?auto_319157 ?auto_319166 ) ) ( not ( = ?auto_319157 ?auto_319167 ) ) ( not ( = ?auto_319158 ?auto_319159 ) ) ( not ( = ?auto_319158 ?auto_319160 ) ) ( not ( = ?auto_319158 ?auto_319161 ) ) ( not ( = ?auto_319158 ?auto_319162 ) ) ( not ( = ?auto_319158 ?auto_319163 ) ) ( not ( = ?auto_319158 ?auto_319164 ) ) ( not ( = ?auto_319158 ?auto_319165 ) ) ( not ( = ?auto_319158 ?auto_319166 ) ) ( not ( = ?auto_319158 ?auto_319167 ) ) ( not ( = ?auto_319159 ?auto_319160 ) ) ( not ( = ?auto_319159 ?auto_319161 ) ) ( not ( = ?auto_319159 ?auto_319162 ) ) ( not ( = ?auto_319159 ?auto_319163 ) ) ( not ( = ?auto_319159 ?auto_319164 ) ) ( not ( = ?auto_319159 ?auto_319165 ) ) ( not ( = ?auto_319159 ?auto_319166 ) ) ( not ( = ?auto_319159 ?auto_319167 ) ) ( not ( = ?auto_319160 ?auto_319161 ) ) ( not ( = ?auto_319160 ?auto_319162 ) ) ( not ( = ?auto_319160 ?auto_319163 ) ) ( not ( = ?auto_319160 ?auto_319164 ) ) ( not ( = ?auto_319160 ?auto_319165 ) ) ( not ( = ?auto_319160 ?auto_319166 ) ) ( not ( = ?auto_319160 ?auto_319167 ) ) ( not ( = ?auto_319161 ?auto_319162 ) ) ( not ( = ?auto_319161 ?auto_319163 ) ) ( not ( = ?auto_319161 ?auto_319164 ) ) ( not ( = ?auto_319161 ?auto_319165 ) ) ( not ( = ?auto_319161 ?auto_319166 ) ) ( not ( = ?auto_319161 ?auto_319167 ) ) ( not ( = ?auto_319162 ?auto_319163 ) ) ( not ( = ?auto_319162 ?auto_319164 ) ) ( not ( = ?auto_319162 ?auto_319165 ) ) ( not ( = ?auto_319162 ?auto_319166 ) ) ( not ( = ?auto_319162 ?auto_319167 ) ) ( not ( = ?auto_319163 ?auto_319164 ) ) ( not ( = ?auto_319163 ?auto_319165 ) ) ( not ( = ?auto_319163 ?auto_319166 ) ) ( not ( = ?auto_319163 ?auto_319167 ) ) ( not ( = ?auto_319164 ?auto_319165 ) ) ( not ( = ?auto_319164 ?auto_319166 ) ) ( not ( = ?auto_319164 ?auto_319167 ) ) ( not ( = ?auto_319165 ?auto_319166 ) ) ( not ( = ?auto_319165 ?auto_319167 ) ) ( not ( = ?auto_319166 ?auto_319167 ) ) ( ON ?auto_319165 ?auto_319166 ) ( ON ?auto_319164 ?auto_319165 ) ( CLEAR ?auto_319162 ) ( ON ?auto_319163 ?auto_319164 ) ( CLEAR ?auto_319163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_319157 ?auto_319158 ?auto_319159 ?auto_319160 ?auto_319161 ?auto_319162 ?auto_319163 )
      ( MAKE-10PILE ?auto_319157 ?auto_319158 ?auto_319159 ?auto_319160 ?auto_319161 ?auto_319162 ?auto_319163 ?auto_319164 ?auto_319165 ?auto_319166 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319178 - BLOCK
      ?auto_319179 - BLOCK
      ?auto_319180 - BLOCK
      ?auto_319181 - BLOCK
      ?auto_319182 - BLOCK
      ?auto_319183 - BLOCK
      ?auto_319184 - BLOCK
      ?auto_319185 - BLOCK
      ?auto_319186 - BLOCK
      ?auto_319187 - BLOCK
    )
    :vars
    (
      ?auto_319188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319187 ?auto_319188 ) ( ON-TABLE ?auto_319178 ) ( ON ?auto_319179 ?auto_319178 ) ( ON ?auto_319180 ?auto_319179 ) ( ON ?auto_319181 ?auto_319180 ) ( ON ?auto_319182 ?auto_319181 ) ( not ( = ?auto_319178 ?auto_319179 ) ) ( not ( = ?auto_319178 ?auto_319180 ) ) ( not ( = ?auto_319178 ?auto_319181 ) ) ( not ( = ?auto_319178 ?auto_319182 ) ) ( not ( = ?auto_319178 ?auto_319183 ) ) ( not ( = ?auto_319178 ?auto_319184 ) ) ( not ( = ?auto_319178 ?auto_319185 ) ) ( not ( = ?auto_319178 ?auto_319186 ) ) ( not ( = ?auto_319178 ?auto_319187 ) ) ( not ( = ?auto_319178 ?auto_319188 ) ) ( not ( = ?auto_319179 ?auto_319180 ) ) ( not ( = ?auto_319179 ?auto_319181 ) ) ( not ( = ?auto_319179 ?auto_319182 ) ) ( not ( = ?auto_319179 ?auto_319183 ) ) ( not ( = ?auto_319179 ?auto_319184 ) ) ( not ( = ?auto_319179 ?auto_319185 ) ) ( not ( = ?auto_319179 ?auto_319186 ) ) ( not ( = ?auto_319179 ?auto_319187 ) ) ( not ( = ?auto_319179 ?auto_319188 ) ) ( not ( = ?auto_319180 ?auto_319181 ) ) ( not ( = ?auto_319180 ?auto_319182 ) ) ( not ( = ?auto_319180 ?auto_319183 ) ) ( not ( = ?auto_319180 ?auto_319184 ) ) ( not ( = ?auto_319180 ?auto_319185 ) ) ( not ( = ?auto_319180 ?auto_319186 ) ) ( not ( = ?auto_319180 ?auto_319187 ) ) ( not ( = ?auto_319180 ?auto_319188 ) ) ( not ( = ?auto_319181 ?auto_319182 ) ) ( not ( = ?auto_319181 ?auto_319183 ) ) ( not ( = ?auto_319181 ?auto_319184 ) ) ( not ( = ?auto_319181 ?auto_319185 ) ) ( not ( = ?auto_319181 ?auto_319186 ) ) ( not ( = ?auto_319181 ?auto_319187 ) ) ( not ( = ?auto_319181 ?auto_319188 ) ) ( not ( = ?auto_319182 ?auto_319183 ) ) ( not ( = ?auto_319182 ?auto_319184 ) ) ( not ( = ?auto_319182 ?auto_319185 ) ) ( not ( = ?auto_319182 ?auto_319186 ) ) ( not ( = ?auto_319182 ?auto_319187 ) ) ( not ( = ?auto_319182 ?auto_319188 ) ) ( not ( = ?auto_319183 ?auto_319184 ) ) ( not ( = ?auto_319183 ?auto_319185 ) ) ( not ( = ?auto_319183 ?auto_319186 ) ) ( not ( = ?auto_319183 ?auto_319187 ) ) ( not ( = ?auto_319183 ?auto_319188 ) ) ( not ( = ?auto_319184 ?auto_319185 ) ) ( not ( = ?auto_319184 ?auto_319186 ) ) ( not ( = ?auto_319184 ?auto_319187 ) ) ( not ( = ?auto_319184 ?auto_319188 ) ) ( not ( = ?auto_319185 ?auto_319186 ) ) ( not ( = ?auto_319185 ?auto_319187 ) ) ( not ( = ?auto_319185 ?auto_319188 ) ) ( not ( = ?auto_319186 ?auto_319187 ) ) ( not ( = ?auto_319186 ?auto_319188 ) ) ( not ( = ?auto_319187 ?auto_319188 ) ) ( ON ?auto_319186 ?auto_319187 ) ( ON ?auto_319185 ?auto_319186 ) ( ON ?auto_319184 ?auto_319185 ) ( CLEAR ?auto_319182 ) ( ON ?auto_319183 ?auto_319184 ) ( CLEAR ?auto_319183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_319178 ?auto_319179 ?auto_319180 ?auto_319181 ?auto_319182 ?auto_319183 )
      ( MAKE-10PILE ?auto_319178 ?auto_319179 ?auto_319180 ?auto_319181 ?auto_319182 ?auto_319183 ?auto_319184 ?auto_319185 ?auto_319186 ?auto_319187 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319199 - BLOCK
      ?auto_319200 - BLOCK
      ?auto_319201 - BLOCK
      ?auto_319202 - BLOCK
      ?auto_319203 - BLOCK
      ?auto_319204 - BLOCK
      ?auto_319205 - BLOCK
      ?auto_319206 - BLOCK
      ?auto_319207 - BLOCK
      ?auto_319208 - BLOCK
    )
    :vars
    (
      ?auto_319209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319208 ?auto_319209 ) ( ON-TABLE ?auto_319199 ) ( ON ?auto_319200 ?auto_319199 ) ( ON ?auto_319201 ?auto_319200 ) ( ON ?auto_319202 ?auto_319201 ) ( ON ?auto_319203 ?auto_319202 ) ( not ( = ?auto_319199 ?auto_319200 ) ) ( not ( = ?auto_319199 ?auto_319201 ) ) ( not ( = ?auto_319199 ?auto_319202 ) ) ( not ( = ?auto_319199 ?auto_319203 ) ) ( not ( = ?auto_319199 ?auto_319204 ) ) ( not ( = ?auto_319199 ?auto_319205 ) ) ( not ( = ?auto_319199 ?auto_319206 ) ) ( not ( = ?auto_319199 ?auto_319207 ) ) ( not ( = ?auto_319199 ?auto_319208 ) ) ( not ( = ?auto_319199 ?auto_319209 ) ) ( not ( = ?auto_319200 ?auto_319201 ) ) ( not ( = ?auto_319200 ?auto_319202 ) ) ( not ( = ?auto_319200 ?auto_319203 ) ) ( not ( = ?auto_319200 ?auto_319204 ) ) ( not ( = ?auto_319200 ?auto_319205 ) ) ( not ( = ?auto_319200 ?auto_319206 ) ) ( not ( = ?auto_319200 ?auto_319207 ) ) ( not ( = ?auto_319200 ?auto_319208 ) ) ( not ( = ?auto_319200 ?auto_319209 ) ) ( not ( = ?auto_319201 ?auto_319202 ) ) ( not ( = ?auto_319201 ?auto_319203 ) ) ( not ( = ?auto_319201 ?auto_319204 ) ) ( not ( = ?auto_319201 ?auto_319205 ) ) ( not ( = ?auto_319201 ?auto_319206 ) ) ( not ( = ?auto_319201 ?auto_319207 ) ) ( not ( = ?auto_319201 ?auto_319208 ) ) ( not ( = ?auto_319201 ?auto_319209 ) ) ( not ( = ?auto_319202 ?auto_319203 ) ) ( not ( = ?auto_319202 ?auto_319204 ) ) ( not ( = ?auto_319202 ?auto_319205 ) ) ( not ( = ?auto_319202 ?auto_319206 ) ) ( not ( = ?auto_319202 ?auto_319207 ) ) ( not ( = ?auto_319202 ?auto_319208 ) ) ( not ( = ?auto_319202 ?auto_319209 ) ) ( not ( = ?auto_319203 ?auto_319204 ) ) ( not ( = ?auto_319203 ?auto_319205 ) ) ( not ( = ?auto_319203 ?auto_319206 ) ) ( not ( = ?auto_319203 ?auto_319207 ) ) ( not ( = ?auto_319203 ?auto_319208 ) ) ( not ( = ?auto_319203 ?auto_319209 ) ) ( not ( = ?auto_319204 ?auto_319205 ) ) ( not ( = ?auto_319204 ?auto_319206 ) ) ( not ( = ?auto_319204 ?auto_319207 ) ) ( not ( = ?auto_319204 ?auto_319208 ) ) ( not ( = ?auto_319204 ?auto_319209 ) ) ( not ( = ?auto_319205 ?auto_319206 ) ) ( not ( = ?auto_319205 ?auto_319207 ) ) ( not ( = ?auto_319205 ?auto_319208 ) ) ( not ( = ?auto_319205 ?auto_319209 ) ) ( not ( = ?auto_319206 ?auto_319207 ) ) ( not ( = ?auto_319206 ?auto_319208 ) ) ( not ( = ?auto_319206 ?auto_319209 ) ) ( not ( = ?auto_319207 ?auto_319208 ) ) ( not ( = ?auto_319207 ?auto_319209 ) ) ( not ( = ?auto_319208 ?auto_319209 ) ) ( ON ?auto_319207 ?auto_319208 ) ( ON ?auto_319206 ?auto_319207 ) ( ON ?auto_319205 ?auto_319206 ) ( CLEAR ?auto_319203 ) ( ON ?auto_319204 ?auto_319205 ) ( CLEAR ?auto_319204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_319199 ?auto_319200 ?auto_319201 ?auto_319202 ?auto_319203 ?auto_319204 )
      ( MAKE-10PILE ?auto_319199 ?auto_319200 ?auto_319201 ?auto_319202 ?auto_319203 ?auto_319204 ?auto_319205 ?auto_319206 ?auto_319207 ?auto_319208 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319220 - BLOCK
      ?auto_319221 - BLOCK
      ?auto_319222 - BLOCK
      ?auto_319223 - BLOCK
      ?auto_319224 - BLOCK
      ?auto_319225 - BLOCK
      ?auto_319226 - BLOCK
      ?auto_319227 - BLOCK
      ?auto_319228 - BLOCK
      ?auto_319229 - BLOCK
    )
    :vars
    (
      ?auto_319230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319229 ?auto_319230 ) ( ON-TABLE ?auto_319220 ) ( ON ?auto_319221 ?auto_319220 ) ( ON ?auto_319222 ?auto_319221 ) ( ON ?auto_319223 ?auto_319222 ) ( not ( = ?auto_319220 ?auto_319221 ) ) ( not ( = ?auto_319220 ?auto_319222 ) ) ( not ( = ?auto_319220 ?auto_319223 ) ) ( not ( = ?auto_319220 ?auto_319224 ) ) ( not ( = ?auto_319220 ?auto_319225 ) ) ( not ( = ?auto_319220 ?auto_319226 ) ) ( not ( = ?auto_319220 ?auto_319227 ) ) ( not ( = ?auto_319220 ?auto_319228 ) ) ( not ( = ?auto_319220 ?auto_319229 ) ) ( not ( = ?auto_319220 ?auto_319230 ) ) ( not ( = ?auto_319221 ?auto_319222 ) ) ( not ( = ?auto_319221 ?auto_319223 ) ) ( not ( = ?auto_319221 ?auto_319224 ) ) ( not ( = ?auto_319221 ?auto_319225 ) ) ( not ( = ?auto_319221 ?auto_319226 ) ) ( not ( = ?auto_319221 ?auto_319227 ) ) ( not ( = ?auto_319221 ?auto_319228 ) ) ( not ( = ?auto_319221 ?auto_319229 ) ) ( not ( = ?auto_319221 ?auto_319230 ) ) ( not ( = ?auto_319222 ?auto_319223 ) ) ( not ( = ?auto_319222 ?auto_319224 ) ) ( not ( = ?auto_319222 ?auto_319225 ) ) ( not ( = ?auto_319222 ?auto_319226 ) ) ( not ( = ?auto_319222 ?auto_319227 ) ) ( not ( = ?auto_319222 ?auto_319228 ) ) ( not ( = ?auto_319222 ?auto_319229 ) ) ( not ( = ?auto_319222 ?auto_319230 ) ) ( not ( = ?auto_319223 ?auto_319224 ) ) ( not ( = ?auto_319223 ?auto_319225 ) ) ( not ( = ?auto_319223 ?auto_319226 ) ) ( not ( = ?auto_319223 ?auto_319227 ) ) ( not ( = ?auto_319223 ?auto_319228 ) ) ( not ( = ?auto_319223 ?auto_319229 ) ) ( not ( = ?auto_319223 ?auto_319230 ) ) ( not ( = ?auto_319224 ?auto_319225 ) ) ( not ( = ?auto_319224 ?auto_319226 ) ) ( not ( = ?auto_319224 ?auto_319227 ) ) ( not ( = ?auto_319224 ?auto_319228 ) ) ( not ( = ?auto_319224 ?auto_319229 ) ) ( not ( = ?auto_319224 ?auto_319230 ) ) ( not ( = ?auto_319225 ?auto_319226 ) ) ( not ( = ?auto_319225 ?auto_319227 ) ) ( not ( = ?auto_319225 ?auto_319228 ) ) ( not ( = ?auto_319225 ?auto_319229 ) ) ( not ( = ?auto_319225 ?auto_319230 ) ) ( not ( = ?auto_319226 ?auto_319227 ) ) ( not ( = ?auto_319226 ?auto_319228 ) ) ( not ( = ?auto_319226 ?auto_319229 ) ) ( not ( = ?auto_319226 ?auto_319230 ) ) ( not ( = ?auto_319227 ?auto_319228 ) ) ( not ( = ?auto_319227 ?auto_319229 ) ) ( not ( = ?auto_319227 ?auto_319230 ) ) ( not ( = ?auto_319228 ?auto_319229 ) ) ( not ( = ?auto_319228 ?auto_319230 ) ) ( not ( = ?auto_319229 ?auto_319230 ) ) ( ON ?auto_319228 ?auto_319229 ) ( ON ?auto_319227 ?auto_319228 ) ( ON ?auto_319226 ?auto_319227 ) ( ON ?auto_319225 ?auto_319226 ) ( CLEAR ?auto_319223 ) ( ON ?auto_319224 ?auto_319225 ) ( CLEAR ?auto_319224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_319220 ?auto_319221 ?auto_319222 ?auto_319223 ?auto_319224 )
      ( MAKE-10PILE ?auto_319220 ?auto_319221 ?auto_319222 ?auto_319223 ?auto_319224 ?auto_319225 ?auto_319226 ?auto_319227 ?auto_319228 ?auto_319229 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319241 - BLOCK
      ?auto_319242 - BLOCK
      ?auto_319243 - BLOCK
      ?auto_319244 - BLOCK
      ?auto_319245 - BLOCK
      ?auto_319246 - BLOCK
      ?auto_319247 - BLOCK
      ?auto_319248 - BLOCK
      ?auto_319249 - BLOCK
      ?auto_319250 - BLOCK
    )
    :vars
    (
      ?auto_319251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319250 ?auto_319251 ) ( ON-TABLE ?auto_319241 ) ( ON ?auto_319242 ?auto_319241 ) ( ON ?auto_319243 ?auto_319242 ) ( ON ?auto_319244 ?auto_319243 ) ( not ( = ?auto_319241 ?auto_319242 ) ) ( not ( = ?auto_319241 ?auto_319243 ) ) ( not ( = ?auto_319241 ?auto_319244 ) ) ( not ( = ?auto_319241 ?auto_319245 ) ) ( not ( = ?auto_319241 ?auto_319246 ) ) ( not ( = ?auto_319241 ?auto_319247 ) ) ( not ( = ?auto_319241 ?auto_319248 ) ) ( not ( = ?auto_319241 ?auto_319249 ) ) ( not ( = ?auto_319241 ?auto_319250 ) ) ( not ( = ?auto_319241 ?auto_319251 ) ) ( not ( = ?auto_319242 ?auto_319243 ) ) ( not ( = ?auto_319242 ?auto_319244 ) ) ( not ( = ?auto_319242 ?auto_319245 ) ) ( not ( = ?auto_319242 ?auto_319246 ) ) ( not ( = ?auto_319242 ?auto_319247 ) ) ( not ( = ?auto_319242 ?auto_319248 ) ) ( not ( = ?auto_319242 ?auto_319249 ) ) ( not ( = ?auto_319242 ?auto_319250 ) ) ( not ( = ?auto_319242 ?auto_319251 ) ) ( not ( = ?auto_319243 ?auto_319244 ) ) ( not ( = ?auto_319243 ?auto_319245 ) ) ( not ( = ?auto_319243 ?auto_319246 ) ) ( not ( = ?auto_319243 ?auto_319247 ) ) ( not ( = ?auto_319243 ?auto_319248 ) ) ( not ( = ?auto_319243 ?auto_319249 ) ) ( not ( = ?auto_319243 ?auto_319250 ) ) ( not ( = ?auto_319243 ?auto_319251 ) ) ( not ( = ?auto_319244 ?auto_319245 ) ) ( not ( = ?auto_319244 ?auto_319246 ) ) ( not ( = ?auto_319244 ?auto_319247 ) ) ( not ( = ?auto_319244 ?auto_319248 ) ) ( not ( = ?auto_319244 ?auto_319249 ) ) ( not ( = ?auto_319244 ?auto_319250 ) ) ( not ( = ?auto_319244 ?auto_319251 ) ) ( not ( = ?auto_319245 ?auto_319246 ) ) ( not ( = ?auto_319245 ?auto_319247 ) ) ( not ( = ?auto_319245 ?auto_319248 ) ) ( not ( = ?auto_319245 ?auto_319249 ) ) ( not ( = ?auto_319245 ?auto_319250 ) ) ( not ( = ?auto_319245 ?auto_319251 ) ) ( not ( = ?auto_319246 ?auto_319247 ) ) ( not ( = ?auto_319246 ?auto_319248 ) ) ( not ( = ?auto_319246 ?auto_319249 ) ) ( not ( = ?auto_319246 ?auto_319250 ) ) ( not ( = ?auto_319246 ?auto_319251 ) ) ( not ( = ?auto_319247 ?auto_319248 ) ) ( not ( = ?auto_319247 ?auto_319249 ) ) ( not ( = ?auto_319247 ?auto_319250 ) ) ( not ( = ?auto_319247 ?auto_319251 ) ) ( not ( = ?auto_319248 ?auto_319249 ) ) ( not ( = ?auto_319248 ?auto_319250 ) ) ( not ( = ?auto_319248 ?auto_319251 ) ) ( not ( = ?auto_319249 ?auto_319250 ) ) ( not ( = ?auto_319249 ?auto_319251 ) ) ( not ( = ?auto_319250 ?auto_319251 ) ) ( ON ?auto_319249 ?auto_319250 ) ( ON ?auto_319248 ?auto_319249 ) ( ON ?auto_319247 ?auto_319248 ) ( ON ?auto_319246 ?auto_319247 ) ( CLEAR ?auto_319244 ) ( ON ?auto_319245 ?auto_319246 ) ( CLEAR ?auto_319245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_319241 ?auto_319242 ?auto_319243 ?auto_319244 ?auto_319245 )
      ( MAKE-10PILE ?auto_319241 ?auto_319242 ?auto_319243 ?auto_319244 ?auto_319245 ?auto_319246 ?auto_319247 ?auto_319248 ?auto_319249 ?auto_319250 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319262 - BLOCK
      ?auto_319263 - BLOCK
      ?auto_319264 - BLOCK
      ?auto_319265 - BLOCK
      ?auto_319266 - BLOCK
      ?auto_319267 - BLOCK
      ?auto_319268 - BLOCK
      ?auto_319269 - BLOCK
      ?auto_319270 - BLOCK
      ?auto_319271 - BLOCK
    )
    :vars
    (
      ?auto_319272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319271 ?auto_319272 ) ( ON-TABLE ?auto_319262 ) ( ON ?auto_319263 ?auto_319262 ) ( ON ?auto_319264 ?auto_319263 ) ( not ( = ?auto_319262 ?auto_319263 ) ) ( not ( = ?auto_319262 ?auto_319264 ) ) ( not ( = ?auto_319262 ?auto_319265 ) ) ( not ( = ?auto_319262 ?auto_319266 ) ) ( not ( = ?auto_319262 ?auto_319267 ) ) ( not ( = ?auto_319262 ?auto_319268 ) ) ( not ( = ?auto_319262 ?auto_319269 ) ) ( not ( = ?auto_319262 ?auto_319270 ) ) ( not ( = ?auto_319262 ?auto_319271 ) ) ( not ( = ?auto_319262 ?auto_319272 ) ) ( not ( = ?auto_319263 ?auto_319264 ) ) ( not ( = ?auto_319263 ?auto_319265 ) ) ( not ( = ?auto_319263 ?auto_319266 ) ) ( not ( = ?auto_319263 ?auto_319267 ) ) ( not ( = ?auto_319263 ?auto_319268 ) ) ( not ( = ?auto_319263 ?auto_319269 ) ) ( not ( = ?auto_319263 ?auto_319270 ) ) ( not ( = ?auto_319263 ?auto_319271 ) ) ( not ( = ?auto_319263 ?auto_319272 ) ) ( not ( = ?auto_319264 ?auto_319265 ) ) ( not ( = ?auto_319264 ?auto_319266 ) ) ( not ( = ?auto_319264 ?auto_319267 ) ) ( not ( = ?auto_319264 ?auto_319268 ) ) ( not ( = ?auto_319264 ?auto_319269 ) ) ( not ( = ?auto_319264 ?auto_319270 ) ) ( not ( = ?auto_319264 ?auto_319271 ) ) ( not ( = ?auto_319264 ?auto_319272 ) ) ( not ( = ?auto_319265 ?auto_319266 ) ) ( not ( = ?auto_319265 ?auto_319267 ) ) ( not ( = ?auto_319265 ?auto_319268 ) ) ( not ( = ?auto_319265 ?auto_319269 ) ) ( not ( = ?auto_319265 ?auto_319270 ) ) ( not ( = ?auto_319265 ?auto_319271 ) ) ( not ( = ?auto_319265 ?auto_319272 ) ) ( not ( = ?auto_319266 ?auto_319267 ) ) ( not ( = ?auto_319266 ?auto_319268 ) ) ( not ( = ?auto_319266 ?auto_319269 ) ) ( not ( = ?auto_319266 ?auto_319270 ) ) ( not ( = ?auto_319266 ?auto_319271 ) ) ( not ( = ?auto_319266 ?auto_319272 ) ) ( not ( = ?auto_319267 ?auto_319268 ) ) ( not ( = ?auto_319267 ?auto_319269 ) ) ( not ( = ?auto_319267 ?auto_319270 ) ) ( not ( = ?auto_319267 ?auto_319271 ) ) ( not ( = ?auto_319267 ?auto_319272 ) ) ( not ( = ?auto_319268 ?auto_319269 ) ) ( not ( = ?auto_319268 ?auto_319270 ) ) ( not ( = ?auto_319268 ?auto_319271 ) ) ( not ( = ?auto_319268 ?auto_319272 ) ) ( not ( = ?auto_319269 ?auto_319270 ) ) ( not ( = ?auto_319269 ?auto_319271 ) ) ( not ( = ?auto_319269 ?auto_319272 ) ) ( not ( = ?auto_319270 ?auto_319271 ) ) ( not ( = ?auto_319270 ?auto_319272 ) ) ( not ( = ?auto_319271 ?auto_319272 ) ) ( ON ?auto_319270 ?auto_319271 ) ( ON ?auto_319269 ?auto_319270 ) ( ON ?auto_319268 ?auto_319269 ) ( ON ?auto_319267 ?auto_319268 ) ( ON ?auto_319266 ?auto_319267 ) ( CLEAR ?auto_319264 ) ( ON ?auto_319265 ?auto_319266 ) ( CLEAR ?auto_319265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_319262 ?auto_319263 ?auto_319264 ?auto_319265 )
      ( MAKE-10PILE ?auto_319262 ?auto_319263 ?auto_319264 ?auto_319265 ?auto_319266 ?auto_319267 ?auto_319268 ?auto_319269 ?auto_319270 ?auto_319271 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319283 - BLOCK
      ?auto_319284 - BLOCK
      ?auto_319285 - BLOCK
      ?auto_319286 - BLOCK
      ?auto_319287 - BLOCK
      ?auto_319288 - BLOCK
      ?auto_319289 - BLOCK
      ?auto_319290 - BLOCK
      ?auto_319291 - BLOCK
      ?auto_319292 - BLOCK
    )
    :vars
    (
      ?auto_319293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319292 ?auto_319293 ) ( ON-TABLE ?auto_319283 ) ( ON ?auto_319284 ?auto_319283 ) ( ON ?auto_319285 ?auto_319284 ) ( not ( = ?auto_319283 ?auto_319284 ) ) ( not ( = ?auto_319283 ?auto_319285 ) ) ( not ( = ?auto_319283 ?auto_319286 ) ) ( not ( = ?auto_319283 ?auto_319287 ) ) ( not ( = ?auto_319283 ?auto_319288 ) ) ( not ( = ?auto_319283 ?auto_319289 ) ) ( not ( = ?auto_319283 ?auto_319290 ) ) ( not ( = ?auto_319283 ?auto_319291 ) ) ( not ( = ?auto_319283 ?auto_319292 ) ) ( not ( = ?auto_319283 ?auto_319293 ) ) ( not ( = ?auto_319284 ?auto_319285 ) ) ( not ( = ?auto_319284 ?auto_319286 ) ) ( not ( = ?auto_319284 ?auto_319287 ) ) ( not ( = ?auto_319284 ?auto_319288 ) ) ( not ( = ?auto_319284 ?auto_319289 ) ) ( not ( = ?auto_319284 ?auto_319290 ) ) ( not ( = ?auto_319284 ?auto_319291 ) ) ( not ( = ?auto_319284 ?auto_319292 ) ) ( not ( = ?auto_319284 ?auto_319293 ) ) ( not ( = ?auto_319285 ?auto_319286 ) ) ( not ( = ?auto_319285 ?auto_319287 ) ) ( not ( = ?auto_319285 ?auto_319288 ) ) ( not ( = ?auto_319285 ?auto_319289 ) ) ( not ( = ?auto_319285 ?auto_319290 ) ) ( not ( = ?auto_319285 ?auto_319291 ) ) ( not ( = ?auto_319285 ?auto_319292 ) ) ( not ( = ?auto_319285 ?auto_319293 ) ) ( not ( = ?auto_319286 ?auto_319287 ) ) ( not ( = ?auto_319286 ?auto_319288 ) ) ( not ( = ?auto_319286 ?auto_319289 ) ) ( not ( = ?auto_319286 ?auto_319290 ) ) ( not ( = ?auto_319286 ?auto_319291 ) ) ( not ( = ?auto_319286 ?auto_319292 ) ) ( not ( = ?auto_319286 ?auto_319293 ) ) ( not ( = ?auto_319287 ?auto_319288 ) ) ( not ( = ?auto_319287 ?auto_319289 ) ) ( not ( = ?auto_319287 ?auto_319290 ) ) ( not ( = ?auto_319287 ?auto_319291 ) ) ( not ( = ?auto_319287 ?auto_319292 ) ) ( not ( = ?auto_319287 ?auto_319293 ) ) ( not ( = ?auto_319288 ?auto_319289 ) ) ( not ( = ?auto_319288 ?auto_319290 ) ) ( not ( = ?auto_319288 ?auto_319291 ) ) ( not ( = ?auto_319288 ?auto_319292 ) ) ( not ( = ?auto_319288 ?auto_319293 ) ) ( not ( = ?auto_319289 ?auto_319290 ) ) ( not ( = ?auto_319289 ?auto_319291 ) ) ( not ( = ?auto_319289 ?auto_319292 ) ) ( not ( = ?auto_319289 ?auto_319293 ) ) ( not ( = ?auto_319290 ?auto_319291 ) ) ( not ( = ?auto_319290 ?auto_319292 ) ) ( not ( = ?auto_319290 ?auto_319293 ) ) ( not ( = ?auto_319291 ?auto_319292 ) ) ( not ( = ?auto_319291 ?auto_319293 ) ) ( not ( = ?auto_319292 ?auto_319293 ) ) ( ON ?auto_319291 ?auto_319292 ) ( ON ?auto_319290 ?auto_319291 ) ( ON ?auto_319289 ?auto_319290 ) ( ON ?auto_319288 ?auto_319289 ) ( ON ?auto_319287 ?auto_319288 ) ( CLEAR ?auto_319285 ) ( ON ?auto_319286 ?auto_319287 ) ( CLEAR ?auto_319286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_319283 ?auto_319284 ?auto_319285 ?auto_319286 )
      ( MAKE-10PILE ?auto_319283 ?auto_319284 ?auto_319285 ?auto_319286 ?auto_319287 ?auto_319288 ?auto_319289 ?auto_319290 ?auto_319291 ?auto_319292 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319304 - BLOCK
      ?auto_319305 - BLOCK
      ?auto_319306 - BLOCK
      ?auto_319307 - BLOCK
      ?auto_319308 - BLOCK
      ?auto_319309 - BLOCK
      ?auto_319310 - BLOCK
      ?auto_319311 - BLOCK
      ?auto_319312 - BLOCK
      ?auto_319313 - BLOCK
    )
    :vars
    (
      ?auto_319314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319313 ?auto_319314 ) ( ON-TABLE ?auto_319304 ) ( ON ?auto_319305 ?auto_319304 ) ( not ( = ?auto_319304 ?auto_319305 ) ) ( not ( = ?auto_319304 ?auto_319306 ) ) ( not ( = ?auto_319304 ?auto_319307 ) ) ( not ( = ?auto_319304 ?auto_319308 ) ) ( not ( = ?auto_319304 ?auto_319309 ) ) ( not ( = ?auto_319304 ?auto_319310 ) ) ( not ( = ?auto_319304 ?auto_319311 ) ) ( not ( = ?auto_319304 ?auto_319312 ) ) ( not ( = ?auto_319304 ?auto_319313 ) ) ( not ( = ?auto_319304 ?auto_319314 ) ) ( not ( = ?auto_319305 ?auto_319306 ) ) ( not ( = ?auto_319305 ?auto_319307 ) ) ( not ( = ?auto_319305 ?auto_319308 ) ) ( not ( = ?auto_319305 ?auto_319309 ) ) ( not ( = ?auto_319305 ?auto_319310 ) ) ( not ( = ?auto_319305 ?auto_319311 ) ) ( not ( = ?auto_319305 ?auto_319312 ) ) ( not ( = ?auto_319305 ?auto_319313 ) ) ( not ( = ?auto_319305 ?auto_319314 ) ) ( not ( = ?auto_319306 ?auto_319307 ) ) ( not ( = ?auto_319306 ?auto_319308 ) ) ( not ( = ?auto_319306 ?auto_319309 ) ) ( not ( = ?auto_319306 ?auto_319310 ) ) ( not ( = ?auto_319306 ?auto_319311 ) ) ( not ( = ?auto_319306 ?auto_319312 ) ) ( not ( = ?auto_319306 ?auto_319313 ) ) ( not ( = ?auto_319306 ?auto_319314 ) ) ( not ( = ?auto_319307 ?auto_319308 ) ) ( not ( = ?auto_319307 ?auto_319309 ) ) ( not ( = ?auto_319307 ?auto_319310 ) ) ( not ( = ?auto_319307 ?auto_319311 ) ) ( not ( = ?auto_319307 ?auto_319312 ) ) ( not ( = ?auto_319307 ?auto_319313 ) ) ( not ( = ?auto_319307 ?auto_319314 ) ) ( not ( = ?auto_319308 ?auto_319309 ) ) ( not ( = ?auto_319308 ?auto_319310 ) ) ( not ( = ?auto_319308 ?auto_319311 ) ) ( not ( = ?auto_319308 ?auto_319312 ) ) ( not ( = ?auto_319308 ?auto_319313 ) ) ( not ( = ?auto_319308 ?auto_319314 ) ) ( not ( = ?auto_319309 ?auto_319310 ) ) ( not ( = ?auto_319309 ?auto_319311 ) ) ( not ( = ?auto_319309 ?auto_319312 ) ) ( not ( = ?auto_319309 ?auto_319313 ) ) ( not ( = ?auto_319309 ?auto_319314 ) ) ( not ( = ?auto_319310 ?auto_319311 ) ) ( not ( = ?auto_319310 ?auto_319312 ) ) ( not ( = ?auto_319310 ?auto_319313 ) ) ( not ( = ?auto_319310 ?auto_319314 ) ) ( not ( = ?auto_319311 ?auto_319312 ) ) ( not ( = ?auto_319311 ?auto_319313 ) ) ( not ( = ?auto_319311 ?auto_319314 ) ) ( not ( = ?auto_319312 ?auto_319313 ) ) ( not ( = ?auto_319312 ?auto_319314 ) ) ( not ( = ?auto_319313 ?auto_319314 ) ) ( ON ?auto_319312 ?auto_319313 ) ( ON ?auto_319311 ?auto_319312 ) ( ON ?auto_319310 ?auto_319311 ) ( ON ?auto_319309 ?auto_319310 ) ( ON ?auto_319308 ?auto_319309 ) ( ON ?auto_319307 ?auto_319308 ) ( CLEAR ?auto_319305 ) ( ON ?auto_319306 ?auto_319307 ) ( CLEAR ?auto_319306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_319304 ?auto_319305 ?auto_319306 )
      ( MAKE-10PILE ?auto_319304 ?auto_319305 ?auto_319306 ?auto_319307 ?auto_319308 ?auto_319309 ?auto_319310 ?auto_319311 ?auto_319312 ?auto_319313 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319325 - BLOCK
      ?auto_319326 - BLOCK
      ?auto_319327 - BLOCK
      ?auto_319328 - BLOCK
      ?auto_319329 - BLOCK
      ?auto_319330 - BLOCK
      ?auto_319331 - BLOCK
      ?auto_319332 - BLOCK
      ?auto_319333 - BLOCK
      ?auto_319334 - BLOCK
    )
    :vars
    (
      ?auto_319335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319334 ?auto_319335 ) ( ON-TABLE ?auto_319325 ) ( ON ?auto_319326 ?auto_319325 ) ( not ( = ?auto_319325 ?auto_319326 ) ) ( not ( = ?auto_319325 ?auto_319327 ) ) ( not ( = ?auto_319325 ?auto_319328 ) ) ( not ( = ?auto_319325 ?auto_319329 ) ) ( not ( = ?auto_319325 ?auto_319330 ) ) ( not ( = ?auto_319325 ?auto_319331 ) ) ( not ( = ?auto_319325 ?auto_319332 ) ) ( not ( = ?auto_319325 ?auto_319333 ) ) ( not ( = ?auto_319325 ?auto_319334 ) ) ( not ( = ?auto_319325 ?auto_319335 ) ) ( not ( = ?auto_319326 ?auto_319327 ) ) ( not ( = ?auto_319326 ?auto_319328 ) ) ( not ( = ?auto_319326 ?auto_319329 ) ) ( not ( = ?auto_319326 ?auto_319330 ) ) ( not ( = ?auto_319326 ?auto_319331 ) ) ( not ( = ?auto_319326 ?auto_319332 ) ) ( not ( = ?auto_319326 ?auto_319333 ) ) ( not ( = ?auto_319326 ?auto_319334 ) ) ( not ( = ?auto_319326 ?auto_319335 ) ) ( not ( = ?auto_319327 ?auto_319328 ) ) ( not ( = ?auto_319327 ?auto_319329 ) ) ( not ( = ?auto_319327 ?auto_319330 ) ) ( not ( = ?auto_319327 ?auto_319331 ) ) ( not ( = ?auto_319327 ?auto_319332 ) ) ( not ( = ?auto_319327 ?auto_319333 ) ) ( not ( = ?auto_319327 ?auto_319334 ) ) ( not ( = ?auto_319327 ?auto_319335 ) ) ( not ( = ?auto_319328 ?auto_319329 ) ) ( not ( = ?auto_319328 ?auto_319330 ) ) ( not ( = ?auto_319328 ?auto_319331 ) ) ( not ( = ?auto_319328 ?auto_319332 ) ) ( not ( = ?auto_319328 ?auto_319333 ) ) ( not ( = ?auto_319328 ?auto_319334 ) ) ( not ( = ?auto_319328 ?auto_319335 ) ) ( not ( = ?auto_319329 ?auto_319330 ) ) ( not ( = ?auto_319329 ?auto_319331 ) ) ( not ( = ?auto_319329 ?auto_319332 ) ) ( not ( = ?auto_319329 ?auto_319333 ) ) ( not ( = ?auto_319329 ?auto_319334 ) ) ( not ( = ?auto_319329 ?auto_319335 ) ) ( not ( = ?auto_319330 ?auto_319331 ) ) ( not ( = ?auto_319330 ?auto_319332 ) ) ( not ( = ?auto_319330 ?auto_319333 ) ) ( not ( = ?auto_319330 ?auto_319334 ) ) ( not ( = ?auto_319330 ?auto_319335 ) ) ( not ( = ?auto_319331 ?auto_319332 ) ) ( not ( = ?auto_319331 ?auto_319333 ) ) ( not ( = ?auto_319331 ?auto_319334 ) ) ( not ( = ?auto_319331 ?auto_319335 ) ) ( not ( = ?auto_319332 ?auto_319333 ) ) ( not ( = ?auto_319332 ?auto_319334 ) ) ( not ( = ?auto_319332 ?auto_319335 ) ) ( not ( = ?auto_319333 ?auto_319334 ) ) ( not ( = ?auto_319333 ?auto_319335 ) ) ( not ( = ?auto_319334 ?auto_319335 ) ) ( ON ?auto_319333 ?auto_319334 ) ( ON ?auto_319332 ?auto_319333 ) ( ON ?auto_319331 ?auto_319332 ) ( ON ?auto_319330 ?auto_319331 ) ( ON ?auto_319329 ?auto_319330 ) ( ON ?auto_319328 ?auto_319329 ) ( CLEAR ?auto_319326 ) ( ON ?auto_319327 ?auto_319328 ) ( CLEAR ?auto_319327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_319325 ?auto_319326 ?auto_319327 )
      ( MAKE-10PILE ?auto_319325 ?auto_319326 ?auto_319327 ?auto_319328 ?auto_319329 ?auto_319330 ?auto_319331 ?auto_319332 ?auto_319333 ?auto_319334 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319346 - BLOCK
      ?auto_319347 - BLOCK
      ?auto_319348 - BLOCK
      ?auto_319349 - BLOCK
      ?auto_319350 - BLOCK
      ?auto_319351 - BLOCK
      ?auto_319352 - BLOCK
      ?auto_319353 - BLOCK
      ?auto_319354 - BLOCK
      ?auto_319355 - BLOCK
    )
    :vars
    (
      ?auto_319356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319355 ?auto_319356 ) ( ON-TABLE ?auto_319346 ) ( not ( = ?auto_319346 ?auto_319347 ) ) ( not ( = ?auto_319346 ?auto_319348 ) ) ( not ( = ?auto_319346 ?auto_319349 ) ) ( not ( = ?auto_319346 ?auto_319350 ) ) ( not ( = ?auto_319346 ?auto_319351 ) ) ( not ( = ?auto_319346 ?auto_319352 ) ) ( not ( = ?auto_319346 ?auto_319353 ) ) ( not ( = ?auto_319346 ?auto_319354 ) ) ( not ( = ?auto_319346 ?auto_319355 ) ) ( not ( = ?auto_319346 ?auto_319356 ) ) ( not ( = ?auto_319347 ?auto_319348 ) ) ( not ( = ?auto_319347 ?auto_319349 ) ) ( not ( = ?auto_319347 ?auto_319350 ) ) ( not ( = ?auto_319347 ?auto_319351 ) ) ( not ( = ?auto_319347 ?auto_319352 ) ) ( not ( = ?auto_319347 ?auto_319353 ) ) ( not ( = ?auto_319347 ?auto_319354 ) ) ( not ( = ?auto_319347 ?auto_319355 ) ) ( not ( = ?auto_319347 ?auto_319356 ) ) ( not ( = ?auto_319348 ?auto_319349 ) ) ( not ( = ?auto_319348 ?auto_319350 ) ) ( not ( = ?auto_319348 ?auto_319351 ) ) ( not ( = ?auto_319348 ?auto_319352 ) ) ( not ( = ?auto_319348 ?auto_319353 ) ) ( not ( = ?auto_319348 ?auto_319354 ) ) ( not ( = ?auto_319348 ?auto_319355 ) ) ( not ( = ?auto_319348 ?auto_319356 ) ) ( not ( = ?auto_319349 ?auto_319350 ) ) ( not ( = ?auto_319349 ?auto_319351 ) ) ( not ( = ?auto_319349 ?auto_319352 ) ) ( not ( = ?auto_319349 ?auto_319353 ) ) ( not ( = ?auto_319349 ?auto_319354 ) ) ( not ( = ?auto_319349 ?auto_319355 ) ) ( not ( = ?auto_319349 ?auto_319356 ) ) ( not ( = ?auto_319350 ?auto_319351 ) ) ( not ( = ?auto_319350 ?auto_319352 ) ) ( not ( = ?auto_319350 ?auto_319353 ) ) ( not ( = ?auto_319350 ?auto_319354 ) ) ( not ( = ?auto_319350 ?auto_319355 ) ) ( not ( = ?auto_319350 ?auto_319356 ) ) ( not ( = ?auto_319351 ?auto_319352 ) ) ( not ( = ?auto_319351 ?auto_319353 ) ) ( not ( = ?auto_319351 ?auto_319354 ) ) ( not ( = ?auto_319351 ?auto_319355 ) ) ( not ( = ?auto_319351 ?auto_319356 ) ) ( not ( = ?auto_319352 ?auto_319353 ) ) ( not ( = ?auto_319352 ?auto_319354 ) ) ( not ( = ?auto_319352 ?auto_319355 ) ) ( not ( = ?auto_319352 ?auto_319356 ) ) ( not ( = ?auto_319353 ?auto_319354 ) ) ( not ( = ?auto_319353 ?auto_319355 ) ) ( not ( = ?auto_319353 ?auto_319356 ) ) ( not ( = ?auto_319354 ?auto_319355 ) ) ( not ( = ?auto_319354 ?auto_319356 ) ) ( not ( = ?auto_319355 ?auto_319356 ) ) ( ON ?auto_319354 ?auto_319355 ) ( ON ?auto_319353 ?auto_319354 ) ( ON ?auto_319352 ?auto_319353 ) ( ON ?auto_319351 ?auto_319352 ) ( ON ?auto_319350 ?auto_319351 ) ( ON ?auto_319349 ?auto_319350 ) ( ON ?auto_319348 ?auto_319349 ) ( CLEAR ?auto_319346 ) ( ON ?auto_319347 ?auto_319348 ) ( CLEAR ?auto_319347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_319346 ?auto_319347 )
      ( MAKE-10PILE ?auto_319346 ?auto_319347 ?auto_319348 ?auto_319349 ?auto_319350 ?auto_319351 ?auto_319352 ?auto_319353 ?auto_319354 ?auto_319355 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319367 - BLOCK
      ?auto_319368 - BLOCK
      ?auto_319369 - BLOCK
      ?auto_319370 - BLOCK
      ?auto_319371 - BLOCK
      ?auto_319372 - BLOCK
      ?auto_319373 - BLOCK
      ?auto_319374 - BLOCK
      ?auto_319375 - BLOCK
      ?auto_319376 - BLOCK
    )
    :vars
    (
      ?auto_319377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319376 ?auto_319377 ) ( ON-TABLE ?auto_319367 ) ( not ( = ?auto_319367 ?auto_319368 ) ) ( not ( = ?auto_319367 ?auto_319369 ) ) ( not ( = ?auto_319367 ?auto_319370 ) ) ( not ( = ?auto_319367 ?auto_319371 ) ) ( not ( = ?auto_319367 ?auto_319372 ) ) ( not ( = ?auto_319367 ?auto_319373 ) ) ( not ( = ?auto_319367 ?auto_319374 ) ) ( not ( = ?auto_319367 ?auto_319375 ) ) ( not ( = ?auto_319367 ?auto_319376 ) ) ( not ( = ?auto_319367 ?auto_319377 ) ) ( not ( = ?auto_319368 ?auto_319369 ) ) ( not ( = ?auto_319368 ?auto_319370 ) ) ( not ( = ?auto_319368 ?auto_319371 ) ) ( not ( = ?auto_319368 ?auto_319372 ) ) ( not ( = ?auto_319368 ?auto_319373 ) ) ( not ( = ?auto_319368 ?auto_319374 ) ) ( not ( = ?auto_319368 ?auto_319375 ) ) ( not ( = ?auto_319368 ?auto_319376 ) ) ( not ( = ?auto_319368 ?auto_319377 ) ) ( not ( = ?auto_319369 ?auto_319370 ) ) ( not ( = ?auto_319369 ?auto_319371 ) ) ( not ( = ?auto_319369 ?auto_319372 ) ) ( not ( = ?auto_319369 ?auto_319373 ) ) ( not ( = ?auto_319369 ?auto_319374 ) ) ( not ( = ?auto_319369 ?auto_319375 ) ) ( not ( = ?auto_319369 ?auto_319376 ) ) ( not ( = ?auto_319369 ?auto_319377 ) ) ( not ( = ?auto_319370 ?auto_319371 ) ) ( not ( = ?auto_319370 ?auto_319372 ) ) ( not ( = ?auto_319370 ?auto_319373 ) ) ( not ( = ?auto_319370 ?auto_319374 ) ) ( not ( = ?auto_319370 ?auto_319375 ) ) ( not ( = ?auto_319370 ?auto_319376 ) ) ( not ( = ?auto_319370 ?auto_319377 ) ) ( not ( = ?auto_319371 ?auto_319372 ) ) ( not ( = ?auto_319371 ?auto_319373 ) ) ( not ( = ?auto_319371 ?auto_319374 ) ) ( not ( = ?auto_319371 ?auto_319375 ) ) ( not ( = ?auto_319371 ?auto_319376 ) ) ( not ( = ?auto_319371 ?auto_319377 ) ) ( not ( = ?auto_319372 ?auto_319373 ) ) ( not ( = ?auto_319372 ?auto_319374 ) ) ( not ( = ?auto_319372 ?auto_319375 ) ) ( not ( = ?auto_319372 ?auto_319376 ) ) ( not ( = ?auto_319372 ?auto_319377 ) ) ( not ( = ?auto_319373 ?auto_319374 ) ) ( not ( = ?auto_319373 ?auto_319375 ) ) ( not ( = ?auto_319373 ?auto_319376 ) ) ( not ( = ?auto_319373 ?auto_319377 ) ) ( not ( = ?auto_319374 ?auto_319375 ) ) ( not ( = ?auto_319374 ?auto_319376 ) ) ( not ( = ?auto_319374 ?auto_319377 ) ) ( not ( = ?auto_319375 ?auto_319376 ) ) ( not ( = ?auto_319375 ?auto_319377 ) ) ( not ( = ?auto_319376 ?auto_319377 ) ) ( ON ?auto_319375 ?auto_319376 ) ( ON ?auto_319374 ?auto_319375 ) ( ON ?auto_319373 ?auto_319374 ) ( ON ?auto_319372 ?auto_319373 ) ( ON ?auto_319371 ?auto_319372 ) ( ON ?auto_319370 ?auto_319371 ) ( ON ?auto_319369 ?auto_319370 ) ( CLEAR ?auto_319367 ) ( ON ?auto_319368 ?auto_319369 ) ( CLEAR ?auto_319368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_319367 ?auto_319368 )
      ( MAKE-10PILE ?auto_319367 ?auto_319368 ?auto_319369 ?auto_319370 ?auto_319371 ?auto_319372 ?auto_319373 ?auto_319374 ?auto_319375 ?auto_319376 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319388 - BLOCK
      ?auto_319389 - BLOCK
      ?auto_319390 - BLOCK
      ?auto_319391 - BLOCK
      ?auto_319392 - BLOCK
      ?auto_319393 - BLOCK
      ?auto_319394 - BLOCK
      ?auto_319395 - BLOCK
      ?auto_319396 - BLOCK
      ?auto_319397 - BLOCK
    )
    :vars
    (
      ?auto_319398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319397 ?auto_319398 ) ( not ( = ?auto_319388 ?auto_319389 ) ) ( not ( = ?auto_319388 ?auto_319390 ) ) ( not ( = ?auto_319388 ?auto_319391 ) ) ( not ( = ?auto_319388 ?auto_319392 ) ) ( not ( = ?auto_319388 ?auto_319393 ) ) ( not ( = ?auto_319388 ?auto_319394 ) ) ( not ( = ?auto_319388 ?auto_319395 ) ) ( not ( = ?auto_319388 ?auto_319396 ) ) ( not ( = ?auto_319388 ?auto_319397 ) ) ( not ( = ?auto_319388 ?auto_319398 ) ) ( not ( = ?auto_319389 ?auto_319390 ) ) ( not ( = ?auto_319389 ?auto_319391 ) ) ( not ( = ?auto_319389 ?auto_319392 ) ) ( not ( = ?auto_319389 ?auto_319393 ) ) ( not ( = ?auto_319389 ?auto_319394 ) ) ( not ( = ?auto_319389 ?auto_319395 ) ) ( not ( = ?auto_319389 ?auto_319396 ) ) ( not ( = ?auto_319389 ?auto_319397 ) ) ( not ( = ?auto_319389 ?auto_319398 ) ) ( not ( = ?auto_319390 ?auto_319391 ) ) ( not ( = ?auto_319390 ?auto_319392 ) ) ( not ( = ?auto_319390 ?auto_319393 ) ) ( not ( = ?auto_319390 ?auto_319394 ) ) ( not ( = ?auto_319390 ?auto_319395 ) ) ( not ( = ?auto_319390 ?auto_319396 ) ) ( not ( = ?auto_319390 ?auto_319397 ) ) ( not ( = ?auto_319390 ?auto_319398 ) ) ( not ( = ?auto_319391 ?auto_319392 ) ) ( not ( = ?auto_319391 ?auto_319393 ) ) ( not ( = ?auto_319391 ?auto_319394 ) ) ( not ( = ?auto_319391 ?auto_319395 ) ) ( not ( = ?auto_319391 ?auto_319396 ) ) ( not ( = ?auto_319391 ?auto_319397 ) ) ( not ( = ?auto_319391 ?auto_319398 ) ) ( not ( = ?auto_319392 ?auto_319393 ) ) ( not ( = ?auto_319392 ?auto_319394 ) ) ( not ( = ?auto_319392 ?auto_319395 ) ) ( not ( = ?auto_319392 ?auto_319396 ) ) ( not ( = ?auto_319392 ?auto_319397 ) ) ( not ( = ?auto_319392 ?auto_319398 ) ) ( not ( = ?auto_319393 ?auto_319394 ) ) ( not ( = ?auto_319393 ?auto_319395 ) ) ( not ( = ?auto_319393 ?auto_319396 ) ) ( not ( = ?auto_319393 ?auto_319397 ) ) ( not ( = ?auto_319393 ?auto_319398 ) ) ( not ( = ?auto_319394 ?auto_319395 ) ) ( not ( = ?auto_319394 ?auto_319396 ) ) ( not ( = ?auto_319394 ?auto_319397 ) ) ( not ( = ?auto_319394 ?auto_319398 ) ) ( not ( = ?auto_319395 ?auto_319396 ) ) ( not ( = ?auto_319395 ?auto_319397 ) ) ( not ( = ?auto_319395 ?auto_319398 ) ) ( not ( = ?auto_319396 ?auto_319397 ) ) ( not ( = ?auto_319396 ?auto_319398 ) ) ( not ( = ?auto_319397 ?auto_319398 ) ) ( ON ?auto_319396 ?auto_319397 ) ( ON ?auto_319395 ?auto_319396 ) ( ON ?auto_319394 ?auto_319395 ) ( ON ?auto_319393 ?auto_319394 ) ( ON ?auto_319392 ?auto_319393 ) ( ON ?auto_319391 ?auto_319392 ) ( ON ?auto_319390 ?auto_319391 ) ( ON ?auto_319389 ?auto_319390 ) ( ON ?auto_319388 ?auto_319389 ) ( CLEAR ?auto_319388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_319388 )
      ( MAKE-10PILE ?auto_319388 ?auto_319389 ?auto_319390 ?auto_319391 ?auto_319392 ?auto_319393 ?auto_319394 ?auto_319395 ?auto_319396 ?auto_319397 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_319409 - BLOCK
      ?auto_319410 - BLOCK
      ?auto_319411 - BLOCK
      ?auto_319412 - BLOCK
      ?auto_319413 - BLOCK
      ?auto_319414 - BLOCK
      ?auto_319415 - BLOCK
      ?auto_319416 - BLOCK
      ?auto_319417 - BLOCK
      ?auto_319418 - BLOCK
    )
    :vars
    (
      ?auto_319419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319418 ?auto_319419 ) ( not ( = ?auto_319409 ?auto_319410 ) ) ( not ( = ?auto_319409 ?auto_319411 ) ) ( not ( = ?auto_319409 ?auto_319412 ) ) ( not ( = ?auto_319409 ?auto_319413 ) ) ( not ( = ?auto_319409 ?auto_319414 ) ) ( not ( = ?auto_319409 ?auto_319415 ) ) ( not ( = ?auto_319409 ?auto_319416 ) ) ( not ( = ?auto_319409 ?auto_319417 ) ) ( not ( = ?auto_319409 ?auto_319418 ) ) ( not ( = ?auto_319409 ?auto_319419 ) ) ( not ( = ?auto_319410 ?auto_319411 ) ) ( not ( = ?auto_319410 ?auto_319412 ) ) ( not ( = ?auto_319410 ?auto_319413 ) ) ( not ( = ?auto_319410 ?auto_319414 ) ) ( not ( = ?auto_319410 ?auto_319415 ) ) ( not ( = ?auto_319410 ?auto_319416 ) ) ( not ( = ?auto_319410 ?auto_319417 ) ) ( not ( = ?auto_319410 ?auto_319418 ) ) ( not ( = ?auto_319410 ?auto_319419 ) ) ( not ( = ?auto_319411 ?auto_319412 ) ) ( not ( = ?auto_319411 ?auto_319413 ) ) ( not ( = ?auto_319411 ?auto_319414 ) ) ( not ( = ?auto_319411 ?auto_319415 ) ) ( not ( = ?auto_319411 ?auto_319416 ) ) ( not ( = ?auto_319411 ?auto_319417 ) ) ( not ( = ?auto_319411 ?auto_319418 ) ) ( not ( = ?auto_319411 ?auto_319419 ) ) ( not ( = ?auto_319412 ?auto_319413 ) ) ( not ( = ?auto_319412 ?auto_319414 ) ) ( not ( = ?auto_319412 ?auto_319415 ) ) ( not ( = ?auto_319412 ?auto_319416 ) ) ( not ( = ?auto_319412 ?auto_319417 ) ) ( not ( = ?auto_319412 ?auto_319418 ) ) ( not ( = ?auto_319412 ?auto_319419 ) ) ( not ( = ?auto_319413 ?auto_319414 ) ) ( not ( = ?auto_319413 ?auto_319415 ) ) ( not ( = ?auto_319413 ?auto_319416 ) ) ( not ( = ?auto_319413 ?auto_319417 ) ) ( not ( = ?auto_319413 ?auto_319418 ) ) ( not ( = ?auto_319413 ?auto_319419 ) ) ( not ( = ?auto_319414 ?auto_319415 ) ) ( not ( = ?auto_319414 ?auto_319416 ) ) ( not ( = ?auto_319414 ?auto_319417 ) ) ( not ( = ?auto_319414 ?auto_319418 ) ) ( not ( = ?auto_319414 ?auto_319419 ) ) ( not ( = ?auto_319415 ?auto_319416 ) ) ( not ( = ?auto_319415 ?auto_319417 ) ) ( not ( = ?auto_319415 ?auto_319418 ) ) ( not ( = ?auto_319415 ?auto_319419 ) ) ( not ( = ?auto_319416 ?auto_319417 ) ) ( not ( = ?auto_319416 ?auto_319418 ) ) ( not ( = ?auto_319416 ?auto_319419 ) ) ( not ( = ?auto_319417 ?auto_319418 ) ) ( not ( = ?auto_319417 ?auto_319419 ) ) ( not ( = ?auto_319418 ?auto_319419 ) ) ( ON ?auto_319417 ?auto_319418 ) ( ON ?auto_319416 ?auto_319417 ) ( ON ?auto_319415 ?auto_319416 ) ( ON ?auto_319414 ?auto_319415 ) ( ON ?auto_319413 ?auto_319414 ) ( ON ?auto_319412 ?auto_319413 ) ( ON ?auto_319411 ?auto_319412 ) ( ON ?auto_319410 ?auto_319411 ) ( ON ?auto_319409 ?auto_319410 ) ( CLEAR ?auto_319409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_319409 )
      ( MAKE-10PILE ?auto_319409 ?auto_319410 ?auto_319411 ?auto_319412 ?auto_319413 ?auto_319414 ?auto_319415 ?auto_319416 ?auto_319417 ?auto_319418 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319431 - BLOCK
      ?auto_319432 - BLOCK
      ?auto_319433 - BLOCK
      ?auto_319434 - BLOCK
      ?auto_319435 - BLOCK
      ?auto_319436 - BLOCK
      ?auto_319437 - BLOCK
      ?auto_319438 - BLOCK
      ?auto_319439 - BLOCK
      ?auto_319440 - BLOCK
      ?auto_319441 - BLOCK
    )
    :vars
    (
      ?auto_319442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_319440 ) ( ON ?auto_319441 ?auto_319442 ) ( CLEAR ?auto_319441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_319431 ) ( ON ?auto_319432 ?auto_319431 ) ( ON ?auto_319433 ?auto_319432 ) ( ON ?auto_319434 ?auto_319433 ) ( ON ?auto_319435 ?auto_319434 ) ( ON ?auto_319436 ?auto_319435 ) ( ON ?auto_319437 ?auto_319436 ) ( ON ?auto_319438 ?auto_319437 ) ( ON ?auto_319439 ?auto_319438 ) ( ON ?auto_319440 ?auto_319439 ) ( not ( = ?auto_319431 ?auto_319432 ) ) ( not ( = ?auto_319431 ?auto_319433 ) ) ( not ( = ?auto_319431 ?auto_319434 ) ) ( not ( = ?auto_319431 ?auto_319435 ) ) ( not ( = ?auto_319431 ?auto_319436 ) ) ( not ( = ?auto_319431 ?auto_319437 ) ) ( not ( = ?auto_319431 ?auto_319438 ) ) ( not ( = ?auto_319431 ?auto_319439 ) ) ( not ( = ?auto_319431 ?auto_319440 ) ) ( not ( = ?auto_319431 ?auto_319441 ) ) ( not ( = ?auto_319431 ?auto_319442 ) ) ( not ( = ?auto_319432 ?auto_319433 ) ) ( not ( = ?auto_319432 ?auto_319434 ) ) ( not ( = ?auto_319432 ?auto_319435 ) ) ( not ( = ?auto_319432 ?auto_319436 ) ) ( not ( = ?auto_319432 ?auto_319437 ) ) ( not ( = ?auto_319432 ?auto_319438 ) ) ( not ( = ?auto_319432 ?auto_319439 ) ) ( not ( = ?auto_319432 ?auto_319440 ) ) ( not ( = ?auto_319432 ?auto_319441 ) ) ( not ( = ?auto_319432 ?auto_319442 ) ) ( not ( = ?auto_319433 ?auto_319434 ) ) ( not ( = ?auto_319433 ?auto_319435 ) ) ( not ( = ?auto_319433 ?auto_319436 ) ) ( not ( = ?auto_319433 ?auto_319437 ) ) ( not ( = ?auto_319433 ?auto_319438 ) ) ( not ( = ?auto_319433 ?auto_319439 ) ) ( not ( = ?auto_319433 ?auto_319440 ) ) ( not ( = ?auto_319433 ?auto_319441 ) ) ( not ( = ?auto_319433 ?auto_319442 ) ) ( not ( = ?auto_319434 ?auto_319435 ) ) ( not ( = ?auto_319434 ?auto_319436 ) ) ( not ( = ?auto_319434 ?auto_319437 ) ) ( not ( = ?auto_319434 ?auto_319438 ) ) ( not ( = ?auto_319434 ?auto_319439 ) ) ( not ( = ?auto_319434 ?auto_319440 ) ) ( not ( = ?auto_319434 ?auto_319441 ) ) ( not ( = ?auto_319434 ?auto_319442 ) ) ( not ( = ?auto_319435 ?auto_319436 ) ) ( not ( = ?auto_319435 ?auto_319437 ) ) ( not ( = ?auto_319435 ?auto_319438 ) ) ( not ( = ?auto_319435 ?auto_319439 ) ) ( not ( = ?auto_319435 ?auto_319440 ) ) ( not ( = ?auto_319435 ?auto_319441 ) ) ( not ( = ?auto_319435 ?auto_319442 ) ) ( not ( = ?auto_319436 ?auto_319437 ) ) ( not ( = ?auto_319436 ?auto_319438 ) ) ( not ( = ?auto_319436 ?auto_319439 ) ) ( not ( = ?auto_319436 ?auto_319440 ) ) ( not ( = ?auto_319436 ?auto_319441 ) ) ( not ( = ?auto_319436 ?auto_319442 ) ) ( not ( = ?auto_319437 ?auto_319438 ) ) ( not ( = ?auto_319437 ?auto_319439 ) ) ( not ( = ?auto_319437 ?auto_319440 ) ) ( not ( = ?auto_319437 ?auto_319441 ) ) ( not ( = ?auto_319437 ?auto_319442 ) ) ( not ( = ?auto_319438 ?auto_319439 ) ) ( not ( = ?auto_319438 ?auto_319440 ) ) ( not ( = ?auto_319438 ?auto_319441 ) ) ( not ( = ?auto_319438 ?auto_319442 ) ) ( not ( = ?auto_319439 ?auto_319440 ) ) ( not ( = ?auto_319439 ?auto_319441 ) ) ( not ( = ?auto_319439 ?auto_319442 ) ) ( not ( = ?auto_319440 ?auto_319441 ) ) ( not ( = ?auto_319440 ?auto_319442 ) ) ( not ( = ?auto_319441 ?auto_319442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_319441 ?auto_319442 )
      ( !STACK ?auto_319441 ?auto_319440 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319454 - BLOCK
      ?auto_319455 - BLOCK
      ?auto_319456 - BLOCK
      ?auto_319457 - BLOCK
      ?auto_319458 - BLOCK
      ?auto_319459 - BLOCK
      ?auto_319460 - BLOCK
      ?auto_319461 - BLOCK
      ?auto_319462 - BLOCK
      ?auto_319463 - BLOCK
      ?auto_319464 - BLOCK
    )
    :vars
    (
      ?auto_319465 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_319463 ) ( ON ?auto_319464 ?auto_319465 ) ( CLEAR ?auto_319464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_319454 ) ( ON ?auto_319455 ?auto_319454 ) ( ON ?auto_319456 ?auto_319455 ) ( ON ?auto_319457 ?auto_319456 ) ( ON ?auto_319458 ?auto_319457 ) ( ON ?auto_319459 ?auto_319458 ) ( ON ?auto_319460 ?auto_319459 ) ( ON ?auto_319461 ?auto_319460 ) ( ON ?auto_319462 ?auto_319461 ) ( ON ?auto_319463 ?auto_319462 ) ( not ( = ?auto_319454 ?auto_319455 ) ) ( not ( = ?auto_319454 ?auto_319456 ) ) ( not ( = ?auto_319454 ?auto_319457 ) ) ( not ( = ?auto_319454 ?auto_319458 ) ) ( not ( = ?auto_319454 ?auto_319459 ) ) ( not ( = ?auto_319454 ?auto_319460 ) ) ( not ( = ?auto_319454 ?auto_319461 ) ) ( not ( = ?auto_319454 ?auto_319462 ) ) ( not ( = ?auto_319454 ?auto_319463 ) ) ( not ( = ?auto_319454 ?auto_319464 ) ) ( not ( = ?auto_319454 ?auto_319465 ) ) ( not ( = ?auto_319455 ?auto_319456 ) ) ( not ( = ?auto_319455 ?auto_319457 ) ) ( not ( = ?auto_319455 ?auto_319458 ) ) ( not ( = ?auto_319455 ?auto_319459 ) ) ( not ( = ?auto_319455 ?auto_319460 ) ) ( not ( = ?auto_319455 ?auto_319461 ) ) ( not ( = ?auto_319455 ?auto_319462 ) ) ( not ( = ?auto_319455 ?auto_319463 ) ) ( not ( = ?auto_319455 ?auto_319464 ) ) ( not ( = ?auto_319455 ?auto_319465 ) ) ( not ( = ?auto_319456 ?auto_319457 ) ) ( not ( = ?auto_319456 ?auto_319458 ) ) ( not ( = ?auto_319456 ?auto_319459 ) ) ( not ( = ?auto_319456 ?auto_319460 ) ) ( not ( = ?auto_319456 ?auto_319461 ) ) ( not ( = ?auto_319456 ?auto_319462 ) ) ( not ( = ?auto_319456 ?auto_319463 ) ) ( not ( = ?auto_319456 ?auto_319464 ) ) ( not ( = ?auto_319456 ?auto_319465 ) ) ( not ( = ?auto_319457 ?auto_319458 ) ) ( not ( = ?auto_319457 ?auto_319459 ) ) ( not ( = ?auto_319457 ?auto_319460 ) ) ( not ( = ?auto_319457 ?auto_319461 ) ) ( not ( = ?auto_319457 ?auto_319462 ) ) ( not ( = ?auto_319457 ?auto_319463 ) ) ( not ( = ?auto_319457 ?auto_319464 ) ) ( not ( = ?auto_319457 ?auto_319465 ) ) ( not ( = ?auto_319458 ?auto_319459 ) ) ( not ( = ?auto_319458 ?auto_319460 ) ) ( not ( = ?auto_319458 ?auto_319461 ) ) ( not ( = ?auto_319458 ?auto_319462 ) ) ( not ( = ?auto_319458 ?auto_319463 ) ) ( not ( = ?auto_319458 ?auto_319464 ) ) ( not ( = ?auto_319458 ?auto_319465 ) ) ( not ( = ?auto_319459 ?auto_319460 ) ) ( not ( = ?auto_319459 ?auto_319461 ) ) ( not ( = ?auto_319459 ?auto_319462 ) ) ( not ( = ?auto_319459 ?auto_319463 ) ) ( not ( = ?auto_319459 ?auto_319464 ) ) ( not ( = ?auto_319459 ?auto_319465 ) ) ( not ( = ?auto_319460 ?auto_319461 ) ) ( not ( = ?auto_319460 ?auto_319462 ) ) ( not ( = ?auto_319460 ?auto_319463 ) ) ( not ( = ?auto_319460 ?auto_319464 ) ) ( not ( = ?auto_319460 ?auto_319465 ) ) ( not ( = ?auto_319461 ?auto_319462 ) ) ( not ( = ?auto_319461 ?auto_319463 ) ) ( not ( = ?auto_319461 ?auto_319464 ) ) ( not ( = ?auto_319461 ?auto_319465 ) ) ( not ( = ?auto_319462 ?auto_319463 ) ) ( not ( = ?auto_319462 ?auto_319464 ) ) ( not ( = ?auto_319462 ?auto_319465 ) ) ( not ( = ?auto_319463 ?auto_319464 ) ) ( not ( = ?auto_319463 ?auto_319465 ) ) ( not ( = ?auto_319464 ?auto_319465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_319464 ?auto_319465 )
      ( !STACK ?auto_319464 ?auto_319463 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319477 - BLOCK
      ?auto_319478 - BLOCK
      ?auto_319479 - BLOCK
      ?auto_319480 - BLOCK
      ?auto_319481 - BLOCK
      ?auto_319482 - BLOCK
      ?auto_319483 - BLOCK
      ?auto_319484 - BLOCK
      ?auto_319485 - BLOCK
      ?auto_319486 - BLOCK
      ?auto_319487 - BLOCK
    )
    :vars
    (
      ?auto_319488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319487 ?auto_319488 ) ( ON-TABLE ?auto_319477 ) ( ON ?auto_319478 ?auto_319477 ) ( ON ?auto_319479 ?auto_319478 ) ( ON ?auto_319480 ?auto_319479 ) ( ON ?auto_319481 ?auto_319480 ) ( ON ?auto_319482 ?auto_319481 ) ( ON ?auto_319483 ?auto_319482 ) ( ON ?auto_319484 ?auto_319483 ) ( ON ?auto_319485 ?auto_319484 ) ( not ( = ?auto_319477 ?auto_319478 ) ) ( not ( = ?auto_319477 ?auto_319479 ) ) ( not ( = ?auto_319477 ?auto_319480 ) ) ( not ( = ?auto_319477 ?auto_319481 ) ) ( not ( = ?auto_319477 ?auto_319482 ) ) ( not ( = ?auto_319477 ?auto_319483 ) ) ( not ( = ?auto_319477 ?auto_319484 ) ) ( not ( = ?auto_319477 ?auto_319485 ) ) ( not ( = ?auto_319477 ?auto_319486 ) ) ( not ( = ?auto_319477 ?auto_319487 ) ) ( not ( = ?auto_319477 ?auto_319488 ) ) ( not ( = ?auto_319478 ?auto_319479 ) ) ( not ( = ?auto_319478 ?auto_319480 ) ) ( not ( = ?auto_319478 ?auto_319481 ) ) ( not ( = ?auto_319478 ?auto_319482 ) ) ( not ( = ?auto_319478 ?auto_319483 ) ) ( not ( = ?auto_319478 ?auto_319484 ) ) ( not ( = ?auto_319478 ?auto_319485 ) ) ( not ( = ?auto_319478 ?auto_319486 ) ) ( not ( = ?auto_319478 ?auto_319487 ) ) ( not ( = ?auto_319478 ?auto_319488 ) ) ( not ( = ?auto_319479 ?auto_319480 ) ) ( not ( = ?auto_319479 ?auto_319481 ) ) ( not ( = ?auto_319479 ?auto_319482 ) ) ( not ( = ?auto_319479 ?auto_319483 ) ) ( not ( = ?auto_319479 ?auto_319484 ) ) ( not ( = ?auto_319479 ?auto_319485 ) ) ( not ( = ?auto_319479 ?auto_319486 ) ) ( not ( = ?auto_319479 ?auto_319487 ) ) ( not ( = ?auto_319479 ?auto_319488 ) ) ( not ( = ?auto_319480 ?auto_319481 ) ) ( not ( = ?auto_319480 ?auto_319482 ) ) ( not ( = ?auto_319480 ?auto_319483 ) ) ( not ( = ?auto_319480 ?auto_319484 ) ) ( not ( = ?auto_319480 ?auto_319485 ) ) ( not ( = ?auto_319480 ?auto_319486 ) ) ( not ( = ?auto_319480 ?auto_319487 ) ) ( not ( = ?auto_319480 ?auto_319488 ) ) ( not ( = ?auto_319481 ?auto_319482 ) ) ( not ( = ?auto_319481 ?auto_319483 ) ) ( not ( = ?auto_319481 ?auto_319484 ) ) ( not ( = ?auto_319481 ?auto_319485 ) ) ( not ( = ?auto_319481 ?auto_319486 ) ) ( not ( = ?auto_319481 ?auto_319487 ) ) ( not ( = ?auto_319481 ?auto_319488 ) ) ( not ( = ?auto_319482 ?auto_319483 ) ) ( not ( = ?auto_319482 ?auto_319484 ) ) ( not ( = ?auto_319482 ?auto_319485 ) ) ( not ( = ?auto_319482 ?auto_319486 ) ) ( not ( = ?auto_319482 ?auto_319487 ) ) ( not ( = ?auto_319482 ?auto_319488 ) ) ( not ( = ?auto_319483 ?auto_319484 ) ) ( not ( = ?auto_319483 ?auto_319485 ) ) ( not ( = ?auto_319483 ?auto_319486 ) ) ( not ( = ?auto_319483 ?auto_319487 ) ) ( not ( = ?auto_319483 ?auto_319488 ) ) ( not ( = ?auto_319484 ?auto_319485 ) ) ( not ( = ?auto_319484 ?auto_319486 ) ) ( not ( = ?auto_319484 ?auto_319487 ) ) ( not ( = ?auto_319484 ?auto_319488 ) ) ( not ( = ?auto_319485 ?auto_319486 ) ) ( not ( = ?auto_319485 ?auto_319487 ) ) ( not ( = ?auto_319485 ?auto_319488 ) ) ( not ( = ?auto_319486 ?auto_319487 ) ) ( not ( = ?auto_319486 ?auto_319488 ) ) ( not ( = ?auto_319487 ?auto_319488 ) ) ( CLEAR ?auto_319485 ) ( ON ?auto_319486 ?auto_319487 ) ( CLEAR ?auto_319486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_319477 ?auto_319478 ?auto_319479 ?auto_319480 ?auto_319481 ?auto_319482 ?auto_319483 ?auto_319484 ?auto_319485 ?auto_319486 )
      ( MAKE-11PILE ?auto_319477 ?auto_319478 ?auto_319479 ?auto_319480 ?auto_319481 ?auto_319482 ?auto_319483 ?auto_319484 ?auto_319485 ?auto_319486 ?auto_319487 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319500 - BLOCK
      ?auto_319501 - BLOCK
      ?auto_319502 - BLOCK
      ?auto_319503 - BLOCK
      ?auto_319504 - BLOCK
      ?auto_319505 - BLOCK
      ?auto_319506 - BLOCK
      ?auto_319507 - BLOCK
      ?auto_319508 - BLOCK
      ?auto_319509 - BLOCK
      ?auto_319510 - BLOCK
    )
    :vars
    (
      ?auto_319511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319510 ?auto_319511 ) ( ON-TABLE ?auto_319500 ) ( ON ?auto_319501 ?auto_319500 ) ( ON ?auto_319502 ?auto_319501 ) ( ON ?auto_319503 ?auto_319502 ) ( ON ?auto_319504 ?auto_319503 ) ( ON ?auto_319505 ?auto_319504 ) ( ON ?auto_319506 ?auto_319505 ) ( ON ?auto_319507 ?auto_319506 ) ( ON ?auto_319508 ?auto_319507 ) ( not ( = ?auto_319500 ?auto_319501 ) ) ( not ( = ?auto_319500 ?auto_319502 ) ) ( not ( = ?auto_319500 ?auto_319503 ) ) ( not ( = ?auto_319500 ?auto_319504 ) ) ( not ( = ?auto_319500 ?auto_319505 ) ) ( not ( = ?auto_319500 ?auto_319506 ) ) ( not ( = ?auto_319500 ?auto_319507 ) ) ( not ( = ?auto_319500 ?auto_319508 ) ) ( not ( = ?auto_319500 ?auto_319509 ) ) ( not ( = ?auto_319500 ?auto_319510 ) ) ( not ( = ?auto_319500 ?auto_319511 ) ) ( not ( = ?auto_319501 ?auto_319502 ) ) ( not ( = ?auto_319501 ?auto_319503 ) ) ( not ( = ?auto_319501 ?auto_319504 ) ) ( not ( = ?auto_319501 ?auto_319505 ) ) ( not ( = ?auto_319501 ?auto_319506 ) ) ( not ( = ?auto_319501 ?auto_319507 ) ) ( not ( = ?auto_319501 ?auto_319508 ) ) ( not ( = ?auto_319501 ?auto_319509 ) ) ( not ( = ?auto_319501 ?auto_319510 ) ) ( not ( = ?auto_319501 ?auto_319511 ) ) ( not ( = ?auto_319502 ?auto_319503 ) ) ( not ( = ?auto_319502 ?auto_319504 ) ) ( not ( = ?auto_319502 ?auto_319505 ) ) ( not ( = ?auto_319502 ?auto_319506 ) ) ( not ( = ?auto_319502 ?auto_319507 ) ) ( not ( = ?auto_319502 ?auto_319508 ) ) ( not ( = ?auto_319502 ?auto_319509 ) ) ( not ( = ?auto_319502 ?auto_319510 ) ) ( not ( = ?auto_319502 ?auto_319511 ) ) ( not ( = ?auto_319503 ?auto_319504 ) ) ( not ( = ?auto_319503 ?auto_319505 ) ) ( not ( = ?auto_319503 ?auto_319506 ) ) ( not ( = ?auto_319503 ?auto_319507 ) ) ( not ( = ?auto_319503 ?auto_319508 ) ) ( not ( = ?auto_319503 ?auto_319509 ) ) ( not ( = ?auto_319503 ?auto_319510 ) ) ( not ( = ?auto_319503 ?auto_319511 ) ) ( not ( = ?auto_319504 ?auto_319505 ) ) ( not ( = ?auto_319504 ?auto_319506 ) ) ( not ( = ?auto_319504 ?auto_319507 ) ) ( not ( = ?auto_319504 ?auto_319508 ) ) ( not ( = ?auto_319504 ?auto_319509 ) ) ( not ( = ?auto_319504 ?auto_319510 ) ) ( not ( = ?auto_319504 ?auto_319511 ) ) ( not ( = ?auto_319505 ?auto_319506 ) ) ( not ( = ?auto_319505 ?auto_319507 ) ) ( not ( = ?auto_319505 ?auto_319508 ) ) ( not ( = ?auto_319505 ?auto_319509 ) ) ( not ( = ?auto_319505 ?auto_319510 ) ) ( not ( = ?auto_319505 ?auto_319511 ) ) ( not ( = ?auto_319506 ?auto_319507 ) ) ( not ( = ?auto_319506 ?auto_319508 ) ) ( not ( = ?auto_319506 ?auto_319509 ) ) ( not ( = ?auto_319506 ?auto_319510 ) ) ( not ( = ?auto_319506 ?auto_319511 ) ) ( not ( = ?auto_319507 ?auto_319508 ) ) ( not ( = ?auto_319507 ?auto_319509 ) ) ( not ( = ?auto_319507 ?auto_319510 ) ) ( not ( = ?auto_319507 ?auto_319511 ) ) ( not ( = ?auto_319508 ?auto_319509 ) ) ( not ( = ?auto_319508 ?auto_319510 ) ) ( not ( = ?auto_319508 ?auto_319511 ) ) ( not ( = ?auto_319509 ?auto_319510 ) ) ( not ( = ?auto_319509 ?auto_319511 ) ) ( not ( = ?auto_319510 ?auto_319511 ) ) ( CLEAR ?auto_319508 ) ( ON ?auto_319509 ?auto_319510 ) ( CLEAR ?auto_319509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_319500 ?auto_319501 ?auto_319502 ?auto_319503 ?auto_319504 ?auto_319505 ?auto_319506 ?auto_319507 ?auto_319508 ?auto_319509 )
      ( MAKE-11PILE ?auto_319500 ?auto_319501 ?auto_319502 ?auto_319503 ?auto_319504 ?auto_319505 ?auto_319506 ?auto_319507 ?auto_319508 ?auto_319509 ?auto_319510 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319523 - BLOCK
      ?auto_319524 - BLOCK
      ?auto_319525 - BLOCK
      ?auto_319526 - BLOCK
      ?auto_319527 - BLOCK
      ?auto_319528 - BLOCK
      ?auto_319529 - BLOCK
      ?auto_319530 - BLOCK
      ?auto_319531 - BLOCK
      ?auto_319532 - BLOCK
      ?auto_319533 - BLOCK
    )
    :vars
    (
      ?auto_319534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319533 ?auto_319534 ) ( ON-TABLE ?auto_319523 ) ( ON ?auto_319524 ?auto_319523 ) ( ON ?auto_319525 ?auto_319524 ) ( ON ?auto_319526 ?auto_319525 ) ( ON ?auto_319527 ?auto_319526 ) ( ON ?auto_319528 ?auto_319527 ) ( ON ?auto_319529 ?auto_319528 ) ( ON ?auto_319530 ?auto_319529 ) ( not ( = ?auto_319523 ?auto_319524 ) ) ( not ( = ?auto_319523 ?auto_319525 ) ) ( not ( = ?auto_319523 ?auto_319526 ) ) ( not ( = ?auto_319523 ?auto_319527 ) ) ( not ( = ?auto_319523 ?auto_319528 ) ) ( not ( = ?auto_319523 ?auto_319529 ) ) ( not ( = ?auto_319523 ?auto_319530 ) ) ( not ( = ?auto_319523 ?auto_319531 ) ) ( not ( = ?auto_319523 ?auto_319532 ) ) ( not ( = ?auto_319523 ?auto_319533 ) ) ( not ( = ?auto_319523 ?auto_319534 ) ) ( not ( = ?auto_319524 ?auto_319525 ) ) ( not ( = ?auto_319524 ?auto_319526 ) ) ( not ( = ?auto_319524 ?auto_319527 ) ) ( not ( = ?auto_319524 ?auto_319528 ) ) ( not ( = ?auto_319524 ?auto_319529 ) ) ( not ( = ?auto_319524 ?auto_319530 ) ) ( not ( = ?auto_319524 ?auto_319531 ) ) ( not ( = ?auto_319524 ?auto_319532 ) ) ( not ( = ?auto_319524 ?auto_319533 ) ) ( not ( = ?auto_319524 ?auto_319534 ) ) ( not ( = ?auto_319525 ?auto_319526 ) ) ( not ( = ?auto_319525 ?auto_319527 ) ) ( not ( = ?auto_319525 ?auto_319528 ) ) ( not ( = ?auto_319525 ?auto_319529 ) ) ( not ( = ?auto_319525 ?auto_319530 ) ) ( not ( = ?auto_319525 ?auto_319531 ) ) ( not ( = ?auto_319525 ?auto_319532 ) ) ( not ( = ?auto_319525 ?auto_319533 ) ) ( not ( = ?auto_319525 ?auto_319534 ) ) ( not ( = ?auto_319526 ?auto_319527 ) ) ( not ( = ?auto_319526 ?auto_319528 ) ) ( not ( = ?auto_319526 ?auto_319529 ) ) ( not ( = ?auto_319526 ?auto_319530 ) ) ( not ( = ?auto_319526 ?auto_319531 ) ) ( not ( = ?auto_319526 ?auto_319532 ) ) ( not ( = ?auto_319526 ?auto_319533 ) ) ( not ( = ?auto_319526 ?auto_319534 ) ) ( not ( = ?auto_319527 ?auto_319528 ) ) ( not ( = ?auto_319527 ?auto_319529 ) ) ( not ( = ?auto_319527 ?auto_319530 ) ) ( not ( = ?auto_319527 ?auto_319531 ) ) ( not ( = ?auto_319527 ?auto_319532 ) ) ( not ( = ?auto_319527 ?auto_319533 ) ) ( not ( = ?auto_319527 ?auto_319534 ) ) ( not ( = ?auto_319528 ?auto_319529 ) ) ( not ( = ?auto_319528 ?auto_319530 ) ) ( not ( = ?auto_319528 ?auto_319531 ) ) ( not ( = ?auto_319528 ?auto_319532 ) ) ( not ( = ?auto_319528 ?auto_319533 ) ) ( not ( = ?auto_319528 ?auto_319534 ) ) ( not ( = ?auto_319529 ?auto_319530 ) ) ( not ( = ?auto_319529 ?auto_319531 ) ) ( not ( = ?auto_319529 ?auto_319532 ) ) ( not ( = ?auto_319529 ?auto_319533 ) ) ( not ( = ?auto_319529 ?auto_319534 ) ) ( not ( = ?auto_319530 ?auto_319531 ) ) ( not ( = ?auto_319530 ?auto_319532 ) ) ( not ( = ?auto_319530 ?auto_319533 ) ) ( not ( = ?auto_319530 ?auto_319534 ) ) ( not ( = ?auto_319531 ?auto_319532 ) ) ( not ( = ?auto_319531 ?auto_319533 ) ) ( not ( = ?auto_319531 ?auto_319534 ) ) ( not ( = ?auto_319532 ?auto_319533 ) ) ( not ( = ?auto_319532 ?auto_319534 ) ) ( not ( = ?auto_319533 ?auto_319534 ) ) ( ON ?auto_319532 ?auto_319533 ) ( CLEAR ?auto_319530 ) ( ON ?auto_319531 ?auto_319532 ) ( CLEAR ?auto_319531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_319523 ?auto_319524 ?auto_319525 ?auto_319526 ?auto_319527 ?auto_319528 ?auto_319529 ?auto_319530 ?auto_319531 )
      ( MAKE-11PILE ?auto_319523 ?auto_319524 ?auto_319525 ?auto_319526 ?auto_319527 ?auto_319528 ?auto_319529 ?auto_319530 ?auto_319531 ?auto_319532 ?auto_319533 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319546 - BLOCK
      ?auto_319547 - BLOCK
      ?auto_319548 - BLOCK
      ?auto_319549 - BLOCK
      ?auto_319550 - BLOCK
      ?auto_319551 - BLOCK
      ?auto_319552 - BLOCK
      ?auto_319553 - BLOCK
      ?auto_319554 - BLOCK
      ?auto_319555 - BLOCK
      ?auto_319556 - BLOCK
    )
    :vars
    (
      ?auto_319557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319556 ?auto_319557 ) ( ON-TABLE ?auto_319546 ) ( ON ?auto_319547 ?auto_319546 ) ( ON ?auto_319548 ?auto_319547 ) ( ON ?auto_319549 ?auto_319548 ) ( ON ?auto_319550 ?auto_319549 ) ( ON ?auto_319551 ?auto_319550 ) ( ON ?auto_319552 ?auto_319551 ) ( ON ?auto_319553 ?auto_319552 ) ( not ( = ?auto_319546 ?auto_319547 ) ) ( not ( = ?auto_319546 ?auto_319548 ) ) ( not ( = ?auto_319546 ?auto_319549 ) ) ( not ( = ?auto_319546 ?auto_319550 ) ) ( not ( = ?auto_319546 ?auto_319551 ) ) ( not ( = ?auto_319546 ?auto_319552 ) ) ( not ( = ?auto_319546 ?auto_319553 ) ) ( not ( = ?auto_319546 ?auto_319554 ) ) ( not ( = ?auto_319546 ?auto_319555 ) ) ( not ( = ?auto_319546 ?auto_319556 ) ) ( not ( = ?auto_319546 ?auto_319557 ) ) ( not ( = ?auto_319547 ?auto_319548 ) ) ( not ( = ?auto_319547 ?auto_319549 ) ) ( not ( = ?auto_319547 ?auto_319550 ) ) ( not ( = ?auto_319547 ?auto_319551 ) ) ( not ( = ?auto_319547 ?auto_319552 ) ) ( not ( = ?auto_319547 ?auto_319553 ) ) ( not ( = ?auto_319547 ?auto_319554 ) ) ( not ( = ?auto_319547 ?auto_319555 ) ) ( not ( = ?auto_319547 ?auto_319556 ) ) ( not ( = ?auto_319547 ?auto_319557 ) ) ( not ( = ?auto_319548 ?auto_319549 ) ) ( not ( = ?auto_319548 ?auto_319550 ) ) ( not ( = ?auto_319548 ?auto_319551 ) ) ( not ( = ?auto_319548 ?auto_319552 ) ) ( not ( = ?auto_319548 ?auto_319553 ) ) ( not ( = ?auto_319548 ?auto_319554 ) ) ( not ( = ?auto_319548 ?auto_319555 ) ) ( not ( = ?auto_319548 ?auto_319556 ) ) ( not ( = ?auto_319548 ?auto_319557 ) ) ( not ( = ?auto_319549 ?auto_319550 ) ) ( not ( = ?auto_319549 ?auto_319551 ) ) ( not ( = ?auto_319549 ?auto_319552 ) ) ( not ( = ?auto_319549 ?auto_319553 ) ) ( not ( = ?auto_319549 ?auto_319554 ) ) ( not ( = ?auto_319549 ?auto_319555 ) ) ( not ( = ?auto_319549 ?auto_319556 ) ) ( not ( = ?auto_319549 ?auto_319557 ) ) ( not ( = ?auto_319550 ?auto_319551 ) ) ( not ( = ?auto_319550 ?auto_319552 ) ) ( not ( = ?auto_319550 ?auto_319553 ) ) ( not ( = ?auto_319550 ?auto_319554 ) ) ( not ( = ?auto_319550 ?auto_319555 ) ) ( not ( = ?auto_319550 ?auto_319556 ) ) ( not ( = ?auto_319550 ?auto_319557 ) ) ( not ( = ?auto_319551 ?auto_319552 ) ) ( not ( = ?auto_319551 ?auto_319553 ) ) ( not ( = ?auto_319551 ?auto_319554 ) ) ( not ( = ?auto_319551 ?auto_319555 ) ) ( not ( = ?auto_319551 ?auto_319556 ) ) ( not ( = ?auto_319551 ?auto_319557 ) ) ( not ( = ?auto_319552 ?auto_319553 ) ) ( not ( = ?auto_319552 ?auto_319554 ) ) ( not ( = ?auto_319552 ?auto_319555 ) ) ( not ( = ?auto_319552 ?auto_319556 ) ) ( not ( = ?auto_319552 ?auto_319557 ) ) ( not ( = ?auto_319553 ?auto_319554 ) ) ( not ( = ?auto_319553 ?auto_319555 ) ) ( not ( = ?auto_319553 ?auto_319556 ) ) ( not ( = ?auto_319553 ?auto_319557 ) ) ( not ( = ?auto_319554 ?auto_319555 ) ) ( not ( = ?auto_319554 ?auto_319556 ) ) ( not ( = ?auto_319554 ?auto_319557 ) ) ( not ( = ?auto_319555 ?auto_319556 ) ) ( not ( = ?auto_319555 ?auto_319557 ) ) ( not ( = ?auto_319556 ?auto_319557 ) ) ( ON ?auto_319555 ?auto_319556 ) ( CLEAR ?auto_319553 ) ( ON ?auto_319554 ?auto_319555 ) ( CLEAR ?auto_319554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_319546 ?auto_319547 ?auto_319548 ?auto_319549 ?auto_319550 ?auto_319551 ?auto_319552 ?auto_319553 ?auto_319554 )
      ( MAKE-11PILE ?auto_319546 ?auto_319547 ?auto_319548 ?auto_319549 ?auto_319550 ?auto_319551 ?auto_319552 ?auto_319553 ?auto_319554 ?auto_319555 ?auto_319556 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319569 - BLOCK
      ?auto_319570 - BLOCK
      ?auto_319571 - BLOCK
      ?auto_319572 - BLOCK
      ?auto_319573 - BLOCK
      ?auto_319574 - BLOCK
      ?auto_319575 - BLOCK
      ?auto_319576 - BLOCK
      ?auto_319577 - BLOCK
      ?auto_319578 - BLOCK
      ?auto_319579 - BLOCK
    )
    :vars
    (
      ?auto_319580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319579 ?auto_319580 ) ( ON-TABLE ?auto_319569 ) ( ON ?auto_319570 ?auto_319569 ) ( ON ?auto_319571 ?auto_319570 ) ( ON ?auto_319572 ?auto_319571 ) ( ON ?auto_319573 ?auto_319572 ) ( ON ?auto_319574 ?auto_319573 ) ( ON ?auto_319575 ?auto_319574 ) ( not ( = ?auto_319569 ?auto_319570 ) ) ( not ( = ?auto_319569 ?auto_319571 ) ) ( not ( = ?auto_319569 ?auto_319572 ) ) ( not ( = ?auto_319569 ?auto_319573 ) ) ( not ( = ?auto_319569 ?auto_319574 ) ) ( not ( = ?auto_319569 ?auto_319575 ) ) ( not ( = ?auto_319569 ?auto_319576 ) ) ( not ( = ?auto_319569 ?auto_319577 ) ) ( not ( = ?auto_319569 ?auto_319578 ) ) ( not ( = ?auto_319569 ?auto_319579 ) ) ( not ( = ?auto_319569 ?auto_319580 ) ) ( not ( = ?auto_319570 ?auto_319571 ) ) ( not ( = ?auto_319570 ?auto_319572 ) ) ( not ( = ?auto_319570 ?auto_319573 ) ) ( not ( = ?auto_319570 ?auto_319574 ) ) ( not ( = ?auto_319570 ?auto_319575 ) ) ( not ( = ?auto_319570 ?auto_319576 ) ) ( not ( = ?auto_319570 ?auto_319577 ) ) ( not ( = ?auto_319570 ?auto_319578 ) ) ( not ( = ?auto_319570 ?auto_319579 ) ) ( not ( = ?auto_319570 ?auto_319580 ) ) ( not ( = ?auto_319571 ?auto_319572 ) ) ( not ( = ?auto_319571 ?auto_319573 ) ) ( not ( = ?auto_319571 ?auto_319574 ) ) ( not ( = ?auto_319571 ?auto_319575 ) ) ( not ( = ?auto_319571 ?auto_319576 ) ) ( not ( = ?auto_319571 ?auto_319577 ) ) ( not ( = ?auto_319571 ?auto_319578 ) ) ( not ( = ?auto_319571 ?auto_319579 ) ) ( not ( = ?auto_319571 ?auto_319580 ) ) ( not ( = ?auto_319572 ?auto_319573 ) ) ( not ( = ?auto_319572 ?auto_319574 ) ) ( not ( = ?auto_319572 ?auto_319575 ) ) ( not ( = ?auto_319572 ?auto_319576 ) ) ( not ( = ?auto_319572 ?auto_319577 ) ) ( not ( = ?auto_319572 ?auto_319578 ) ) ( not ( = ?auto_319572 ?auto_319579 ) ) ( not ( = ?auto_319572 ?auto_319580 ) ) ( not ( = ?auto_319573 ?auto_319574 ) ) ( not ( = ?auto_319573 ?auto_319575 ) ) ( not ( = ?auto_319573 ?auto_319576 ) ) ( not ( = ?auto_319573 ?auto_319577 ) ) ( not ( = ?auto_319573 ?auto_319578 ) ) ( not ( = ?auto_319573 ?auto_319579 ) ) ( not ( = ?auto_319573 ?auto_319580 ) ) ( not ( = ?auto_319574 ?auto_319575 ) ) ( not ( = ?auto_319574 ?auto_319576 ) ) ( not ( = ?auto_319574 ?auto_319577 ) ) ( not ( = ?auto_319574 ?auto_319578 ) ) ( not ( = ?auto_319574 ?auto_319579 ) ) ( not ( = ?auto_319574 ?auto_319580 ) ) ( not ( = ?auto_319575 ?auto_319576 ) ) ( not ( = ?auto_319575 ?auto_319577 ) ) ( not ( = ?auto_319575 ?auto_319578 ) ) ( not ( = ?auto_319575 ?auto_319579 ) ) ( not ( = ?auto_319575 ?auto_319580 ) ) ( not ( = ?auto_319576 ?auto_319577 ) ) ( not ( = ?auto_319576 ?auto_319578 ) ) ( not ( = ?auto_319576 ?auto_319579 ) ) ( not ( = ?auto_319576 ?auto_319580 ) ) ( not ( = ?auto_319577 ?auto_319578 ) ) ( not ( = ?auto_319577 ?auto_319579 ) ) ( not ( = ?auto_319577 ?auto_319580 ) ) ( not ( = ?auto_319578 ?auto_319579 ) ) ( not ( = ?auto_319578 ?auto_319580 ) ) ( not ( = ?auto_319579 ?auto_319580 ) ) ( ON ?auto_319578 ?auto_319579 ) ( ON ?auto_319577 ?auto_319578 ) ( CLEAR ?auto_319575 ) ( ON ?auto_319576 ?auto_319577 ) ( CLEAR ?auto_319576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_319569 ?auto_319570 ?auto_319571 ?auto_319572 ?auto_319573 ?auto_319574 ?auto_319575 ?auto_319576 )
      ( MAKE-11PILE ?auto_319569 ?auto_319570 ?auto_319571 ?auto_319572 ?auto_319573 ?auto_319574 ?auto_319575 ?auto_319576 ?auto_319577 ?auto_319578 ?auto_319579 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319592 - BLOCK
      ?auto_319593 - BLOCK
      ?auto_319594 - BLOCK
      ?auto_319595 - BLOCK
      ?auto_319596 - BLOCK
      ?auto_319597 - BLOCK
      ?auto_319598 - BLOCK
      ?auto_319599 - BLOCK
      ?auto_319600 - BLOCK
      ?auto_319601 - BLOCK
      ?auto_319602 - BLOCK
    )
    :vars
    (
      ?auto_319603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319602 ?auto_319603 ) ( ON-TABLE ?auto_319592 ) ( ON ?auto_319593 ?auto_319592 ) ( ON ?auto_319594 ?auto_319593 ) ( ON ?auto_319595 ?auto_319594 ) ( ON ?auto_319596 ?auto_319595 ) ( ON ?auto_319597 ?auto_319596 ) ( ON ?auto_319598 ?auto_319597 ) ( not ( = ?auto_319592 ?auto_319593 ) ) ( not ( = ?auto_319592 ?auto_319594 ) ) ( not ( = ?auto_319592 ?auto_319595 ) ) ( not ( = ?auto_319592 ?auto_319596 ) ) ( not ( = ?auto_319592 ?auto_319597 ) ) ( not ( = ?auto_319592 ?auto_319598 ) ) ( not ( = ?auto_319592 ?auto_319599 ) ) ( not ( = ?auto_319592 ?auto_319600 ) ) ( not ( = ?auto_319592 ?auto_319601 ) ) ( not ( = ?auto_319592 ?auto_319602 ) ) ( not ( = ?auto_319592 ?auto_319603 ) ) ( not ( = ?auto_319593 ?auto_319594 ) ) ( not ( = ?auto_319593 ?auto_319595 ) ) ( not ( = ?auto_319593 ?auto_319596 ) ) ( not ( = ?auto_319593 ?auto_319597 ) ) ( not ( = ?auto_319593 ?auto_319598 ) ) ( not ( = ?auto_319593 ?auto_319599 ) ) ( not ( = ?auto_319593 ?auto_319600 ) ) ( not ( = ?auto_319593 ?auto_319601 ) ) ( not ( = ?auto_319593 ?auto_319602 ) ) ( not ( = ?auto_319593 ?auto_319603 ) ) ( not ( = ?auto_319594 ?auto_319595 ) ) ( not ( = ?auto_319594 ?auto_319596 ) ) ( not ( = ?auto_319594 ?auto_319597 ) ) ( not ( = ?auto_319594 ?auto_319598 ) ) ( not ( = ?auto_319594 ?auto_319599 ) ) ( not ( = ?auto_319594 ?auto_319600 ) ) ( not ( = ?auto_319594 ?auto_319601 ) ) ( not ( = ?auto_319594 ?auto_319602 ) ) ( not ( = ?auto_319594 ?auto_319603 ) ) ( not ( = ?auto_319595 ?auto_319596 ) ) ( not ( = ?auto_319595 ?auto_319597 ) ) ( not ( = ?auto_319595 ?auto_319598 ) ) ( not ( = ?auto_319595 ?auto_319599 ) ) ( not ( = ?auto_319595 ?auto_319600 ) ) ( not ( = ?auto_319595 ?auto_319601 ) ) ( not ( = ?auto_319595 ?auto_319602 ) ) ( not ( = ?auto_319595 ?auto_319603 ) ) ( not ( = ?auto_319596 ?auto_319597 ) ) ( not ( = ?auto_319596 ?auto_319598 ) ) ( not ( = ?auto_319596 ?auto_319599 ) ) ( not ( = ?auto_319596 ?auto_319600 ) ) ( not ( = ?auto_319596 ?auto_319601 ) ) ( not ( = ?auto_319596 ?auto_319602 ) ) ( not ( = ?auto_319596 ?auto_319603 ) ) ( not ( = ?auto_319597 ?auto_319598 ) ) ( not ( = ?auto_319597 ?auto_319599 ) ) ( not ( = ?auto_319597 ?auto_319600 ) ) ( not ( = ?auto_319597 ?auto_319601 ) ) ( not ( = ?auto_319597 ?auto_319602 ) ) ( not ( = ?auto_319597 ?auto_319603 ) ) ( not ( = ?auto_319598 ?auto_319599 ) ) ( not ( = ?auto_319598 ?auto_319600 ) ) ( not ( = ?auto_319598 ?auto_319601 ) ) ( not ( = ?auto_319598 ?auto_319602 ) ) ( not ( = ?auto_319598 ?auto_319603 ) ) ( not ( = ?auto_319599 ?auto_319600 ) ) ( not ( = ?auto_319599 ?auto_319601 ) ) ( not ( = ?auto_319599 ?auto_319602 ) ) ( not ( = ?auto_319599 ?auto_319603 ) ) ( not ( = ?auto_319600 ?auto_319601 ) ) ( not ( = ?auto_319600 ?auto_319602 ) ) ( not ( = ?auto_319600 ?auto_319603 ) ) ( not ( = ?auto_319601 ?auto_319602 ) ) ( not ( = ?auto_319601 ?auto_319603 ) ) ( not ( = ?auto_319602 ?auto_319603 ) ) ( ON ?auto_319601 ?auto_319602 ) ( ON ?auto_319600 ?auto_319601 ) ( CLEAR ?auto_319598 ) ( ON ?auto_319599 ?auto_319600 ) ( CLEAR ?auto_319599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_319592 ?auto_319593 ?auto_319594 ?auto_319595 ?auto_319596 ?auto_319597 ?auto_319598 ?auto_319599 )
      ( MAKE-11PILE ?auto_319592 ?auto_319593 ?auto_319594 ?auto_319595 ?auto_319596 ?auto_319597 ?auto_319598 ?auto_319599 ?auto_319600 ?auto_319601 ?auto_319602 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319615 - BLOCK
      ?auto_319616 - BLOCK
      ?auto_319617 - BLOCK
      ?auto_319618 - BLOCK
      ?auto_319619 - BLOCK
      ?auto_319620 - BLOCK
      ?auto_319621 - BLOCK
      ?auto_319622 - BLOCK
      ?auto_319623 - BLOCK
      ?auto_319624 - BLOCK
      ?auto_319625 - BLOCK
    )
    :vars
    (
      ?auto_319626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319625 ?auto_319626 ) ( ON-TABLE ?auto_319615 ) ( ON ?auto_319616 ?auto_319615 ) ( ON ?auto_319617 ?auto_319616 ) ( ON ?auto_319618 ?auto_319617 ) ( ON ?auto_319619 ?auto_319618 ) ( ON ?auto_319620 ?auto_319619 ) ( not ( = ?auto_319615 ?auto_319616 ) ) ( not ( = ?auto_319615 ?auto_319617 ) ) ( not ( = ?auto_319615 ?auto_319618 ) ) ( not ( = ?auto_319615 ?auto_319619 ) ) ( not ( = ?auto_319615 ?auto_319620 ) ) ( not ( = ?auto_319615 ?auto_319621 ) ) ( not ( = ?auto_319615 ?auto_319622 ) ) ( not ( = ?auto_319615 ?auto_319623 ) ) ( not ( = ?auto_319615 ?auto_319624 ) ) ( not ( = ?auto_319615 ?auto_319625 ) ) ( not ( = ?auto_319615 ?auto_319626 ) ) ( not ( = ?auto_319616 ?auto_319617 ) ) ( not ( = ?auto_319616 ?auto_319618 ) ) ( not ( = ?auto_319616 ?auto_319619 ) ) ( not ( = ?auto_319616 ?auto_319620 ) ) ( not ( = ?auto_319616 ?auto_319621 ) ) ( not ( = ?auto_319616 ?auto_319622 ) ) ( not ( = ?auto_319616 ?auto_319623 ) ) ( not ( = ?auto_319616 ?auto_319624 ) ) ( not ( = ?auto_319616 ?auto_319625 ) ) ( not ( = ?auto_319616 ?auto_319626 ) ) ( not ( = ?auto_319617 ?auto_319618 ) ) ( not ( = ?auto_319617 ?auto_319619 ) ) ( not ( = ?auto_319617 ?auto_319620 ) ) ( not ( = ?auto_319617 ?auto_319621 ) ) ( not ( = ?auto_319617 ?auto_319622 ) ) ( not ( = ?auto_319617 ?auto_319623 ) ) ( not ( = ?auto_319617 ?auto_319624 ) ) ( not ( = ?auto_319617 ?auto_319625 ) ) ( not ( = ?auto_319617 ?auto_319626 ) ) ( not ( = ?auto_319618 ?auto_319619 ) ) ( not ( = ?auto_319618 ?auto_319620 ) ) ( not ( = ?auto_319618 ?auto_319621 ) ) ( not ( = ?auto_319618 ?auto_319622 ) ) ( not ( = ?auto_319618 ?auto_319623 ) ) ( not ( = ?auto_319618 ?auto_319624 ) ) ( not ( = ?auto_319618 ?auto_319625 ) ) ( not ( = ?auto_319618 ?auto_319626 ) ) ( not ( = ?auto_319619 ?auto_319620 ) ) ( not ( = ?auto_319619 ?auto_319621 ) ) ( not ( = ?auto_319619 ?auto_319622 ) ) ( not ( = ?auto_319619 ?auto_319623 ) ) ( not ( = ?auto_319619 ?auto_319624 ) ) ( not ( = ?auto_319619 ?auto_319625 ) ) ( not ( = ?auto_319619 ?auto_319626 ) ) ( not ( = ?auto_319620 ?auto_319621 ) ) ( not ( = ?auto_319620 ?auto_319622 ) ) ( not ( = ?auto_319620 ?auto_319623 ) ) ( not ( = ?auto_319620 ?auto_319624 ) ) ( not ( = ?auto_319620 ?auto_319625 ) ) ( not ( = ?auto_319620 ?auto_319626 ) ) ( not ( = ?auto_319621 ?auto_319622 ) ) ( not ( = ?auto_319621 ?auto_319623 ) ) ( not ( = ?auto_319621 ?auto_319624 ) ) ( not ( = ?auto_319621 ?auto_319625 ) ) ( not ( = ?auto_319621 ?auto_319626 ) ) ( not ( = ?auto_319622 ?auto_319623 ) ) ( not ( = ?auto_319622 ?auto_319624 ) ) ( not ( = ?auto_319622 ?auto_319625 ) ) ( not ( = ?auto_319622 ?auto_319626 ) ) ( not ( = ?auto_319623 ?auto_319624 ) ) ( not ( = ?auto_319623 ?auto_319625 ) ) ( not ( = ?auto_319623 ?auto_319626 ) ) ( not ( = ?auto_319624 ?auto_319625 ) ) ( not ( = ?auto_319624 ?auto_319626 ) ) ( not ( = ?auto_319625 ?auto_319626 ) ) ( ON ?auto_319624 ?auto_319625 ) ( ON ?auto_319623 ?auto_319624 ) ( ON ?auto_319622 ?auto_319623 ) ( CLEAR ?auto_319620 ) ( ON ?auto_319621 ?auto_319622 ) ( CLEAR ?auto_319621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_319615 ?auto_319616 ?auto_319617 ?auto_319618 ?auto_319619 ?auto_319620 ?auto_319621 )
      ( MAKE-11PILE ?auto_319615 ?auto_319616 ?auto_319617 ?auto_319618 ?auto_319619 ?auto_319620 ?auto_319621 ?auto_319622 ?auto_319623 ?auto_319624 ?auto_319625 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319638 - BLOCK
      ?auto_319639 - BLOCK
      ?auto_319640 - BLOCK
      ?auto_319641 - BLOCK
      ?auto_319642 - BLOCK
      ?auto_319643 - BLOCK
      ?auto_319644 - BLOCK
      ?auto_319645 - BLOCK
      ?auto_319646 - BLOCK
      ?auto_319647 - BLOCK
      ?auto_319648 - BLOCK
    )
    :vars
    (
      ?auto_319649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319648 ?auto_319649 ) ( ON-TABLE ?auto_319638 ) ( ON ?auto_319639 ?auto_319638 ) ( ON ?auto_319640 ?auto_319639 ) ( ON ?auto_319641 ?auto_319640 ) ( ON ?auto_319642 ?auto_319641 ) ( ON ?auto_319643 ?auto_319642 ) ( not ( = ?auto_319638 ?auto_319639 ) ) ( not ( = ?auto_319638 ?auto_319640 ) ) ( not ( = ?auto_319638 ?auto_319641 ) ) ( not ( = ?auto_319638 ?auto_319642 ) ) ( not ( = ?auto_319638 ?auto_319643 ) ) ( not ( = ?auto_319638 ?auto_319644 ) ) ( not ( = ?auto_319638 ?auto_319645 ) ) ( not ( = ?auto_319638 ?auto_319646 ) ) ( not ( = ?auto_319638 ?auto_319647 ) ) ( not ( = ?auto_319638 ?auto_319648 ) ) ( not ( = ?auto_319638 ?auto_319649 ) ) ( not ( = ?auto_319639 ?auto_319640 ) ) ( not ( = ?auto_319639 ?auto_319641 ) ) ( not ( = ?auto_319639 ?auto_319642 ) ) ( not ( = ?auto_319639 ?auto_319643 ) ) ( not ( = ?auto_319639 ?auto_319644 ) ) ( not ( = ?auto_319639 ?auto_319645 ) ) ( not ( = ?auto_319639 ?auto_319646 ) ) ( not ( = ?auto_319639 ?auto_319647 ) ) ( not ( = ?auto_319639 ?auto_319648 ) ) ( not ( = ?auto_319639 ?auto_319649 ) ) ( not ( = ?auto_319640 ?auto_319641 ) ) ( not ( = ?auto_319640 ?auto_319642 ) ) ( not ( = ?auto_319640 ?auto_319643 ) ) ( not ( = ?auto_319640 ?auto_319644 ) ) ( not ( = ?auto_319640 ?auto_319645 ) ) ( not ( = ?auto_319640 ?auto_319646 ) ) ( not ( = ?auto_319640 ?auto_319647 ) ) ( not ( = ?auto_319640 ?auto_319648 ) ) ( not ( = ?auto_319640 ?auto_319649 ) ) ( not ( = ?auto_319641 ?auto_319642 ) ) ( not ( = ?auto_319641 ?auto_319643 ) ) ( not ( = ?auto_319641 ?auto_319644 ) ) ( not ( = ?auto_319641 ?auto_319645 ) ) ( not ( = ?auto_319641 ?auto_319646 ) ) ( not ( = ?auto_319641 ?auto_319647 ) ) ( not ( = ?auto_319641 ?auto_319648 ) ) ( not ( = ?auto_319641 ?auto_319649 ) ) ( not ( = ?auto_319642 ?auto_319643 ) ) ( not ( = ?auto_319642 ?auto_319644 ) ) ( not ( = ?auto_319642 ?auto_319645 ) ) ( not ( = ?auto_319642 ?auto_319646 ) ) ( not ( = ?auto_319642 ?auto_319647 ) ) ( not ( = ?auto_319642 ?auto_319648 ) ) ( not ( = ?auto_319642 ?auto_319649 ) ) ( not ( = ?auto_319643 ?auto_319644 ) ) ( not ( = ?auto_319643 ?auto_319645 ) ) ( not ( = ?auto_319643 ?auto_319646 ) ) ( not ( = ?auto_319643 ?auto_319647 ) ) ( not ( = ?auto_319643 ?auto_319648 ) ) ( not ( = ?auto_319643 ?auto_319649 ) ) ( not ( = ?auto_319644 ?auto_319645 ) ) ( not ( = ?auto_319644 ?auto_319646 ) ) ( not ( = ?auto_319644 ?auto_319647 ) ) ( not ( = ?auto_319644 ?auto_319648 ) ) ( not ( = ?auto_319644 ?auto_319649 ) ) ( not ( = ?auto_319645 ?auto_319646 ) ) ( not ( = ?auto_319645 ?auto_319647 ) ) ( not ( = ?auto_319645 ?auto_319648 ) ) ( not ( = ?auto_319645 ?auto_319649 ) ) ( not ( = ?auto_319646 ?auto_319647 ) ) ( not ( = ?auto_319646 ?auto_319648 ) ) ( not ( = ?auto_319646 ?auto_319649 ) ) ( not ( = ?auto_319647 ?auto_319648 ) ) ( not ( = ?auto_319647 ?auto_319649 ) ) ( not ( = ?auto_319648 ?auto_319649 ) ) ( ON ?auto_319647 ?auto_319648 ) ( ON ?auto_319646 ?auto_319647 ) ( ON ?auto_319645 ?auto_319646 ) ( CLEAR ?auto_319643 ) ( ON ?auto_319644 ?auto_319645 ) ( CLEAR ?auto_319644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_319638 ?auto_319639 ?auto_319640 ?auto_319641 ?auto_319642 ?auto_319643 ?auto_319644 )
      ( MAKE-11PILE ?auto_319638 ?auto_319639 ?auto_319640 ?auto_319641 ?auto_319642 ?auto_319643 ?auto_319644 ?auto_319645 ?auto_319646 ?auto_319647 ?auto_319648 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319661 - BLOCK
      ?auto_319662 - BLOCK
      ?auto_319663 - BLOCK
      ?auto_319664 - BLOCK
      ?auto_319665 - BLOCK
      ?auto_319666 - BLOCK
      ?auto_319667 - BLOCK
      ?auto_319668 - BLOCK
      ?auto_319669 - BLOCK
      ?auto_319670 - BLOCK
      ?auto_319671 - BLOCK
    )
    :vars
    (
      ?auto_319672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319671 ?auto_319672 ) ( ON-TABLE ?auto_319661 ) ( ON ?auto_319662 ?auto_319661 ) ( ON ?auto_319663 ?auto_319662 ) ( ON ?auto_319664 ?auto_319663 ) ( ON ?auto_319665 ?auto_319664 ) ( not ( = ?auto_319661 ?auto_319662 ) ) ( not ( = ?auto_319661 ?auto_319663 ) ) ( not ( = ?auto_319661 ?auto_319664 ) ) ( not ( = ?auto_319661 ?auto_319665 ) ) ( not ( = ?auto_319661 ?auto_319666 ) ) ( not ( = ?auto_319661 ?auto_319667 ) ) ( not ( = ?auto_319661 ?auto_319668 ) ) ( not ( = ?auto_319661 ?auto_319669 ) ) ( not ( = ?auto_319661 ?auto_319670 ) ) ( not ( = ?auto_319661 ?auto_319671 ) ) ( not ( = ?auto_319661 ?auto_319672 ) ) ( not ( = ?auto_319662 ?auto_319663 ) ) ( not ( = ?auto_319662 ?auto_319664 ) ) ( not ( = ?auto_319662 ?auto_319665 ) ) ( not ( = ?auto_319662 ?auto_319666 ) ) ( not ( = ?auto_319662 ?auto_319667 ) ) ( not ( = ?auto_319662 ?auto_319668 ) ) ( not ( = ?auto_319662 ?auto_319669 ) ) ( not ( = ?auto_319662 ?auto_319670 ) ) ( not ( = ?auto_319662 ?auto_319671 ) ) ( not ( = ?auto_319662 ?auto_319672 ) ) ( not ( = ?auto_319663 ?auto_319664 ) ) ( not ( = ?auto_319663 ?auto_319665 ) ) ( not ( = ?auto_319663 ?auto_319666 ) ) ( not ( = ?auto_319663 ?auto_319667 ) ) ( not ( = ?auto_319663 ?auto_319668 ) ) ( not ( = ?auto_319663 ?auto_319669 ) ) ( not ( = ?auto_319663 ?auto_319670 ) ) ( not ( = ?auto_319663 ?auto_319671 ) ) ( not ( = ?auto_319663 ?auto_319672 ) ) ( not ( = ?auto_319664 ?auto_319665 ) ) ( not ( = ?auto_319664 ?auto_319666 ) ) ( not ( = ?auto_319664 ?auto_319667 ) ) ( not ( = ?auto_319664 ?auto_319668 ) ) ( not ( = ?auto_319664 ?auto_319669 ) ) ( not ( = ?auto_319664 ?auto_319670 ) ) ( not ( = ?auto_319664 ?auto_319671 ) ) ( not ( = ?auto_319664 ?auto_319672 ) ) ( not ( = ?auto_319665 ?auto_319666 ) ) ( not ( = ?auto_319665 ?auto_319667 ) ) ( not ( = ?auto_319665 ?auto_319668 ) ) ( not ( = ?auto_319665 ?auto_319669 ) ) ( not ( = ?auto_319665 ?auto_319670 ) ) ( not ( = ?auto_319665 ?auto_319671 ) ) ( not ( = ?auto_319665 ?auto_319672 ) ) ( not ( = ?auto_319666 ?auto_319667 ) ) ( not ( = ?auto_319666 ?auto_319668 ) ) ( not ( = ?auto_319666 ?auto_319669 ) ) ( not ( = ?auto_319666 ?auto_319670 ) ) ( not ( = ?auto_319666 ?auto_319671 ) ) ( not ( = ?auto_319666 ?auto_319672 ) ) ( not ( = ?auto_319667 ?auto_319668 ) ) ( not ( = ?auto_319667 ?auto_319669 ) ) ( not ( = ?auto_319667 ?auto_319670 ) ) ( not ( = ?auto_319667 ?auto_319671 ) ) ( not ( = ?auto_319667 ?auto_319672 ) ) ( not ( = ?auto_319668 ?auto_319669 ) ) ( not ( = ?auto_319668 ?auto_319670 ) ) ( not ( = ?auto_319668 ?auto_319671 ) ) ( not ( = ?auto_319668 ?auto_319672 ) ) ( not ( = ?auto_319669 ?auto_319670 ) ) ( not ( = ?auto_319669 ?auto_319671 ) ) ( not ( = ?auto_319669 ?auto_319672 ) ) ( not ( = ?auto_319670 ?auto_319671 ) ) ( not ( = ?auto_319670 ?auto_319672 ) ) ( not ( = ?auto_319671 ?auto_319672 ) ) ( ON ?auto_319670 ?auto_319671 ) ( ON ?auto_319669 ?auto_319670 ) ( ON ?auto_319668 ?auto_319669 ) ( ON ?auto_319667 ?auto_319668 ) ( CLEAR ?auto_319665 ) ( ON ?auto_319666 ?auto_319667 ) ( CLEAR ?auto_319666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_319661 ?auto_319662 ?auto_319663 ?auto_319664 ?auto_319665 ?auto_319666 )
      ( MAKE-11PILE ?auto_319661 ?auto_319662 ?auto_319663 ?auto_319664 ?auto_319665 ?auto_319666 ?auto_319667 ?auto_319668 ?auto_319669 ?auto_319670 ?auto_319671 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319684 - BLOCK
      ?auto_319685 - BLOCK
      ?auto_319686 - BLOCK
      ?auto_319687 - BLOCK
      ?auto_319688 - BLOCK
      ?auto_319689 - BLOCK
      ?auto_319690 - BLOCK
      ?auto_319691 - BLOCK
      ?auto_319692 - BLOCK
      ?auto_319693 - BLOCK
      ?auto_319694 - BLOCK
    )
    :vars
    (
      ?auto_319695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319694 ?auto_319695 ) ( ON-TABLE ?auto_319684 ) ( ON ?auto_319685 ?auto_319684 ) ( ON ?auto_319686 ?auto_319685 ) ( ON ?auto_319687 ?auto_319686 ) ( ON ?auto_319688 ?auto_319687 ) ( not ( = ?auto_319684 ?auto_319685 ) ) ( not ( = ?auto_319684 ?auto_319686 ) ) ( not ( = ?auto_319684 ?auto_319687 ) ) ( not ( = ?auto_319684 ?auto_319688 ) ) ( not ( = ?auto_319684 ?auto_319689 ) ) ( not ( = ?auto_319684 ?auto_319690 ) ) ( not ( = ?auto_319684 ?auto_319691 ) ) ( not ( = ?auto_319684 ?auto_319692 ) ) ( not ( = ?auto_319684 ?auto_319693 ) ) ( not ( = ?auto_319684 ?auto_319694 ) ) ( not ( = ?auto_319684 ?auto_319695 ) ) ( not ( = ?auto_319685 ?auto_319686 ) ) ( not ( = ?auto_319685 ?auto_319687 ) ) ( not ( = ?auto_319685 ?auto_319688 ) ) ( not ( = ?auto_319685 ?auto_319689 ) ) ( not ( = ?auto_319685 ?auto_319690 ) ) ( not ( = ?auto_319685 ?auto_319691 ) ) ( not ( = ?auto_319685 ?auto_319692 ) ) ( not ( = ?auto_319685 ?auto_319693 ) ) ( not ( = ?auto_319685 ?auto_319694 ) ) ( not ( = ?auto_319685 ?auto_319695 ) ) ( not ( = ?auto_319686 ?auto_319687 ) ) ( not ( = ?auto_319686 ?auto_319688 ) ) ( not ( = ?auto_319686 ?auto_319689 ) ) ( not ( = ?auto_319686 ?auto_319690 ) ) ( not ( = ?auto_319686 ?auto_319691 ) ) ( not ( = ?auto_319686 ?auto_319692 ) ) ( not ( = ?auto_319686 ?auto_319693 ) ) ( not ( = ?auto_319686 ?auto_319694 ) ) ( not ( = ?auto_319686 ?auto_319695 ) ) ( not ( = ?auto_319687 ?auto_319688 ) ) ( not ( = ?auto_319687 ?auto_319689 ) ) ( not ( = ?auto_319687 ?auto_319690 ) ) ( not ( = ?auto_319687 ?auto_319691 ) ) ( not ( = ?auto_319687 ?auto_319692 ) ) ( not ( = ?auto_319687 ?auto_319693 ) ) ( not ( = ?auto_319687 ?auto_319694 ) ) ( not ( = ?auto_319687 ?auto_319695 ) ) ( not ( = ?auto_319688 ?auto_319689 ) ) ( not ( = ?auto_319688 ?auto_319690 ) ) ( not ( = ?auto_319688 ?auto_319691 ) ) ( not ( = ?auto_319688 ?auto_319692 ) ) ( not ( = ?auto_319688 ?auto_319693 ) ) ( not ( = ?auto_319688 ?auto_319694 ) ) ( not ( = ?auto_319688 ?auto_319695 ) ) ( not ( = ?auto_319689 ?auto_319690 ) ) ( not ( = ?auto_319689 ?auto_319691 ) ) ( not ( = ?auto_319689 ?auto_319692 ) ) ( not ( = ?auto_319689 ?auto_319693 ) ) ( not ( = ?auto_319689 ?auto_319694 ) ) ( not ( = ?auto_319689 ?auto_319695 ) ) ( not ( = ?auto_319690 ?auto_319691 ) ) ( not ( = ?auto_319690 ?auto_319692 ) ) ( not ( = ?auto_319690 ?auto_319693 ) ) ( not ( = ?auto_319690 ?auto_319694 ) ) ( not ( = ?auto_319690 ?auto_319695 ) ) ( not ( = ?auto_319691 ?auto_319692 ) ) ( not ( = ?auto_319691 ?auto_319693 ) ) ( not ( = ?auto_319691 ?auto_319694 ) ) ( not ( = ?auto_319691 ?auto_319695 ) ) ( not ( = ?auto_319692 ?auto_319693 ) ) ( not ( = ?auto_319692 ?auto_319694 ) ) ( not ( = ?auto_319692 ?auto_319695 ) ) ( not ( = ?auto_319693 ?auto_319694 ) ) ( not ( = ?auto_319693 ?auto_319695 ) ) ( not ( = ?auto_319694 ?auto_319695 ) ) ( ON ?auto_319693 ?auto_319694 ) ( ON ?auto_319692 ?auto_319693 ) ( ON ?auto_319691 ?auto_319692 ) ( ON ?auto_319690 ?auto_319691 ) ( CLEAR ?auto_319688 ) ( ON ?auto_319689 ?auto_319690 ) ( CLEAR ?auto_319689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_319684 ?auto_319685 ?auto_319686 ?auto_319687 ?auto_319688 ?auto_319689 )
      ( MAKE-11PILE ?auto_319684 ?auto_319685 ?auto_319686 ?auto_319687 ?auto_319688 ?auto_319689 ?auto_319690 ?auto_319691 ?auto_319692 ?auto_319693 ?auto_319694 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319707 - BLOCK
      ?auto_319708 - BLOCK
      ?auto_319709 - BLOCK
      ?auto_319710 - BLOCK
      ?auto_319711 - BLOCK
      ?auto_319712 - BLOCK
      ?auto_319713 - BLOCK
      ?auto_319714 - BLOCK
      ?auto_319715 - BLOCK
      ?auto_319716 - BLOCK
      ?auto_319717 - BLOCK
    )
    :vars
    (
      ?auto_319718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319717 ?auto_319718 ) ( ON-TABLE ?auto_319707 ) ( ON ?auto_319708 ?auto_319707 ) ( ON ?auto_319709 ?auto_319708 ) ( ON ?auto_319710 ?auto_319709 ) ( not ( = ?auto_319707 ?auto_319708 ) ) ( not ( = ?auto_319707 ?auto_319709 ) ) ( not ( = ?auto_319707 ?auto_319710 ) ) ( not ( = ?auto_319707 ?auto_319711 ) ) ( not ( = ?auto_319707 ?auto_319712 ) ) ( not ( = ?auto_319707 ?auto_319713 ) ) ( not ( = ?auto_319707 ?auto_319714 ) ) ( not ( = ?auto_319707 ?auto_319715 ) ) ( not ( = ?auto_319707 ?auto_319716 ) ) ( not ( = ?auto_319707 ?auto_319717 ) ) ( not ( = ?auto_319707 ?auto_319718 ) ) ( not ( = ?auto_319708 ?auto_319709 ) ) ( not ( = ?auto_319708 ?auto_319710 ) ) ( not ( = ?auto_319708 ?auto_319711 ) ) ( not ( = ?auto_319708 ?auto_319712 ) ) ( not ( = ?auto_319708 ?auto_319713 ) ) ( not ( = ?auto_319708 ?auto_319714 ) ) ( not ( = ?auto_319708 ?auto_319715 ) ) ( not ( = ?auto_319708 ?auto_319716 ) ) ( not ( = ?auto_319708 ?auto_319717 ) ) ( not ( = ?auto_319708 ?auto_319718 ) ) ( not ( = ?auto_319709 ?auto_319710 ) ) ( not ( = ?auto_319709 ?auto_319711 ) ) ( not ( = ?auto_319709 ?auto_319712 ) ) ( not ( = ?auto_319709 ?auto_319713 ) ) ( not ( = ?auto_319709 ?auto_319714 ) ) ( not ( = ?auto_319709 ?auto_319715 ) ) ( not ( = ?auto_319709 ?auto_319716 ) ) ( not ( = ?auto_319709 ?auto_319717 ) ) ( not ( = ?auto_319709 ?auto_319718 ) ) ( not ( = ?auto_319710 ?auto_319711 ) ) ( not ( = ?auto_319710 ?auto_319712 ) ) ( not ( = ?auto_319710 ?auto_319713 ) ) ( not ( = ?auto_319710 ?auto_319714 ) ) ( not ( = ?auto_319710 ?auto_319715 ) ) ( not ( = ?auto_319710 ?auto_319716 ) ) ( not ( = ?auto_319710 ?auto_319717 ) ) ( not ( = ?auto_319710 ?auto_319718 ) ) ( not ( = ?auto_319711 ?auto_319712 ) ) ( not ( = ?auto_319711 ?auto_319713 ) ) ( not ( = ?auto_319711 ?auto_319714 ) ) ( not ( = ?auto_319711 ?auto_319715 ) ) ( not ( = ?auto_319711 ?auto_319716 ) ) ( not ( = ?auto_319711 ?auto_319717 ) ) ( not ( = ?auto_319711 ?auto_319718 ) ) ( not ( = ?auto_319712 ?auto_319713 ) ) ( not ( = ?auto_319712 ?auto_319714 ) ) ( not ( = ?auto_319712 ?auto_319715 ) ) ( not ( = ?auto_319712 ?auto_319716 ) ) ( not ( = ?auto_319712 ?auto_319717 ) ) ( not ( = ?auto_319712 ?auto_319718 ) ) ( not ( = ?auto_319713 ?auto_319714 ) ) ( not ( = ?auto_319713 ?auto_319715 ) ) ( not ( = ?auto_319713 ?auto_319716 ) ) ( not ( = ?auto_319713 ?auto_319717 ) ) ( not ( = ?auto_319713 ?auto_319718 ) ) ( not ( = ?auto_319714 ?auto_319715 ) ) ( not ( = ?auto_319714 ?auto_319716 ) ) ( not ( = ?auto_319714 ?auto_319717 ) ) ( not ( = ?auto_319714 ?auto_319718 ) ) ( not ( = ?auto_319715 ?auto_319716 ) ) ( not ( = ?auto_319715 ?auto_319717 ) ) ( not ( = ?auto_319715 ?auto_319718 ) ) ( not ( = ?auto_319716 ?auto_319717 ) ) ( not ( = ?auto_319716 ?auto_319718 ) ) ( not ( = ?auto_319717 ?auto_319718 ) ) ( ON ?auto_319716 ?auto_319717 ) ( ON ?auto_319715 ?auto_319716 ) ( ON ?auto_319714 ?auto_319715 ) ( ON ?auto_319713 ?auto_319714 ) ( ON ?auto_319712 ?auto_319713 ) ( CLEAR ?auto_319710 ) ( ON ?auto_319711 ?auto_319712 ) ( CLEAR ?auto_319711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_319707 ?auto_319708 ?auto_319709 ?auto_319710 ?auto_319711 )
      ( MAKE-11PILE ?auto_319707 ?auto_319708 ?auto_319709 ?auto_319710 ?auto_319711 ?auto_319712 ?auto_319713 ?auto_319714 ?auto_319715 ?auto_319716 ?auto_319717 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319730 - BLOCK
      ?auto_319731 - BLOCK
      ?auto_319732 - BLOCK
      ?auto_319733 - BLOCK
      ?auto_319734 - BLOCK
      ?auto_319735 - BLOCK
      ?auto_319736 - BLOCK
      ?auto_319737 - BLOCK
      ?auto_319738 - BLOCK
      ?auto_319739 - BLOCK
      ?auto_319740 - BLOCK
    )
    :vars
    (
      ?auto_319741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319740 ?auto_319741 ) ( ON-TABLE ?auto_319730 ) ( ON ?auto_319731 ?auto_319730 ) ( ON ?auto_319732 ?auto_319731 ) ( ON ?auto_319733 ?auto_319732 ) ( not ( = ?auto_319730 ?auto_319731 ) ) ( not ( = ?auto_319730 ?auto_319732 ) ) ( not ( = ?auto_319730 ?auto_319733 ) ) ( not ( = ?auto_319730 ?auto_319734 ) ) ( not ( = ?auto_319730 ?auto_319735 ) ) ( not ( = ?auto_319730 ?auto_319736 ) ) ( not ( = ?auto_319730 ?auto_319737 ) ) ( not ( = ?auto_319730 ?auto_319738 ) ) ( not ( = ?auto_319730 ?auto_319739 ) ) ( not ( = ?auto_319730 ?auto_319740 ) ) ( not ( = ?auto_319730 ?auto_319741 ) ) ( not ( = ?auto_319731 ?auto_319732 ) ) ( not ( = ?auto_319731 ?auto_319733 ) ) ( not ( = ?auto_319731 ?auto_319734 ) ) ( not ( = ?auto_319731 ?auto_319735 ) ) ( not ( = ?auto_319731 ?auto_319736 ) ) ( not ( = ?auto_319731 ?auto_319737 ) ) ( not ( = ?auto_319731 ?auto_319738 ) ) ( not ( = ?auto_319731 ?auto_319739 ) ) ( not ( = ?auto_319731 ?auto_319740 ) ) ( not ( = ?auto_319731 ?auto_319741 ) ) ( not ( = ?auto_319732 ?auto_319733 ) ) ( not ( = ?auto_319732 ?auto_319734 ) ) ( not ( = ?auto_319732 ?auto_319735 ) ) ( not ( = ?auto_319732 ?auto_319736 ) ) ( not ( = ?auto_319732 ?auto_319737 ) ) ( not ( = ?auto_319732 ?auto_319738 ) ) ( not ( = ?auto_319732 ?auto_319739 ) ) ( not ( = ?auto_319732 ?auto_319740 ) ) ( not ( = ?auto_319732 ?auto_319741 ) ) ( not ( = ?auto_319733 ?auto_319734 ) ) ( not ( = ?auto_319733 ?auto_319735 ) ) ( not ( = ?auto_319733 ?auto_319736 ) ) ( not ( = ?auto_319733 ?auto_319737 ) ) ( not ( = ?auto_319733 ?auto_319738 ) ) ( not ( = ?auto_319733 ?auto_319739 ) ) ( not ( = ?auto_319733 ?auto_319740 ) ) ( not ( = ?auto_319733 ?auto_319741 ) ) ( not ( = ?auto_319734 ?auto_319735 ) ) ( not ( = ?auto_319734 ?auto_319736 ) ) ( not ( = ?auto_319734 ?auto_319737 ) ) ( not ( = ?auto_319734 ?auto_319738 ) ) ( not ( = ?auto_319734 ?auto_319739 ) ) ( not ( = ?auto_319734 ?auto_319740 ) ) ( not ( = ?auto_319734 ?auto_319741 ) ) ( not ( = ?auto_319735 ?auto_319736 ) ) ( not ( = ?auto_319735 ?auto_319737 ) ) ( not ( = ?auto_319735 ?auto_319738 ) ) ( not ( = ?auto_319735 ?auto_319739 ) ) ( not ( = ?auto_319735 ?auto_319740 ) ) ( not ( = ?auto_319735 ?auto_319741 ) ) ( not ( = ?auto_319736 ?auto_319737 ) ) ( not ( = ?auto_319736 ?auto_319738 ) ) ( not ( = ?auto_319736 ?auto_319739 ) ) ( not ( = ?auto_319736 ?auto_319740 ) ) ( not ( = ?auto_319736 ?auto_319741 ) ) ( not ( = ?auto_319737 ?auto_319738 ) ) ( not ( = ?auto_319737 ?auto_319739 ) ) ( not ( = ?auto_319737 ?auto_319740 ) ) ( not ( = ?auto_319737 ?auto_319741 ) ) ( not ( = ?auto_319738 ?auto_319739 ) ) ( not ( = ?auto_319738 ?auto_319740 ) ) ( not ( = ?auto_319738 ?auto_319741 ) ) ( not ( = ?auto_319739 ?auto_319740 ) ) ( not ( = ?auto_319739 ?auto_319741 ) ) ( not ( = ?auto_319740 ?auto_319741 ) ) ( ON ?auto_319739 ?auto_319740 ) ( ON ?auto_319738 ?auto_319739 ) ( ON ?auto_319737 ?auto_319738 ) ( ON ?auto_319736 ?auto_319737 ) ( ON ?auto_319735 ?auto_319736 ) ( CLEAR ?auto_319733 ) ( ON ?auto_319734 ?auto_319735 ) ( CLEAR ?auto_319734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_319730 ?auto_319731 ?auto_319732 ?auto_319733 ?auto_319734 )
      ( MAKE-11PILE ?auto_319730 ?auto_319731 ?auto_319732 ?auto_319733 ?auto_319734 ?auto_319735 ?auto_319736 ?auto_319737 ?auto_319738 ?auto_319739 ?auto_319740 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319753 - BLOCK
      ?auto_319754 - BLOCK
      ?auto_319755 - BLOCK
      ?auto_319756 - BLOCK
      ?auto_319757 - BLOCK
      ?auto_319758 - BLOCK
      ?auto_319759 - BLOCK
      ?auto_319760 - BLOCK
      ?auto_319761 - BLOCK
      ?auto_319762 - BLOCK
      ?auto_319763 - BLOCK
    )
    :vars
    (
      ?auto_319764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319763 ?auto_319764 ) ( ON-TABLE ?auto_319753 ) ( ON ?auto_319754 ?auto_319753 ) ( ON ?auto_319755 ?auto_319754 ) ( not ( = ?auto_319753 ?auto_319754 ) ) ( not ( = ?auto_319753 ?auto_319755 ) ) ( not ( = ?auto_319753 ?auto_319756 ) ) ( not ( = ?auto_319753 ?auto_319757 ) ) ( not ( = ?auto_319753 ?auto_319758 ) ) ( not ( = ?auto_319753 ?auto_319759 ) ) ( not ( = ?auto_319753 ?auto_319760 ) ) ( not ( = ?auto_319753 ?auto_319761 ) ) ( not ( = ?auto_319753 ?auto_319762 ) ) ( not ( = ?auto_319753 ?auto_319763 ) ) ( not ( = ?auto_319753 ?auto_319764 ) ) ( not ( = ?auto_319754 ?auto_319755 ) ) ( not ( = ?auto_319754 ?auto_319756 ) ) ( not ( = ?auto_319754 ?auto_319757 ) ) ( not ( = ?auto_319754 ?auto_319758 ) ) ( not ( = ?auto_319754 ?auto_319759 ) ) ( not ( = ?auto_319754 ?auto_319760 ) ) ( not ( = ?auto_319754 ?auto_319761 ) ) ( not ( = ?auto_319754 ?auto_319762 ) ) ( not ( = ?auto_319754 ?auto_319763 ) ) ( not ( = ?auto_319754 ?auto_319764 ) ) ( not ( = ?auto_319755 ?auto_319756 ) ) ( not ( = ?auto_319755 ?auto_319757 ) ) ( not ( = ?auto_319755 ?auto_319758 ) ) ( not ( = ?auto_319755 ?auto_319759 ) ) ( not ( = ?auto_319755 ?auto_319760 ) ) ( not ( = ?auto_319755 ?auto_319761 ) ) ( not ( = ?auto_319755 ?auto_319762 ) ) ( not ( = ?auto_319755 ?auto_319763 ) ) ( not ( = ?auto_319755 ?auto_319764 ) ) ( not ( = ?auto_319756 ?auto_319757 ) ) ( not ( = ?auto_319756 ?auto_319758 ) ) ( not ( = ?auto_319756 ?auto_319759 ) ) ( not ( = ?auto_319756 ?auto_319760 ) ) ( not ( = ?auto_319756 ?auto_319761 ) ) ( not ( = ?auto_319756 ?auto_319762 ) ) ( not ( = ?auto_319756 ?auto_319763 ) ) ( not ( = ?auto_319756 ?auto_319764 ) ) ( not ( = ?auto_319757 ?auto_319758 ) ) ( not ( = ?auto_319757 ?auto_319759 ) ) ( not ( = ?auto_319757 ?auto_319760 ) ) ( not ( = ?auto_319757 ?auto_319761 ) ) ( not ( = ?auto_319757 ?auto_319762 ) ) ( not ( = ?auto_319757 ?auto_319763 ) ) ( not ( = ?auto_319757 ?auto_319764 ) ) ( not ( = ?auto_319758 ?auto_319759 ) ) ( not ( = ?auto_319758 ?auto_319760 ) ) ( not ( = ?auto_319758 ?auto_319761 ) ) ( not ( = ?auto_319758 ?auto_319762 ) ) ( not ( = ?auto_319758 ?auto_319763 ) ) ( not ( = ?auto_319758 ?auto_319764 ) ) ( not ( = ?auto_319759 ?auto_319760 ) ) ( not ( = ?auto_319759 ?auto_319761 ) ) ( not ( = ?auto_319759 ?auto_319762 ) ) ( not ( = ?auto_319759 ?auto_319763 ) ) ( not ( = ?auto_319759 ?auto_319764 ) ) ( not ( = ?auto_319760 ?auto_319761 ) ) ( not ( = ?auto_319760 ?auto_319762 ) ) ( not ( = ?auto_319760 ?auto_319763 ) ) ( not ( = ?auto_319760 ?auto_319764 ) ) ( not ( = ?auto_319761 ?auto_319762 ) ) ( not ( = ?auto_319761 ?auto_319763 ) ) ( not ( = ?auto_319761 ?auto_319764 ) ) ( not ( = ?auto_319762 ?auto_319763 ) ) ( not ( = ?auto_319762 ?auto_319764 ) ) ( not ( = ?auto_319763 ?auto_319764 ) ) ( ON ?auto_319762 ?auto_319763 ) ( ON ?auto_319761 ?auto_319762 ) ( ON ?auto_319760 ?auto_319761 ) ( ON ?auto_319759 ?auto_319760 ) ( ON ?auto_319758 ?auto_319759 ) ( ON ?auto_319757 ?auto_319758 ) ( CLEAR ?auto_319755 ) ( ON ?auto_319756 ?auto_319757 ) ( CLEAR ?auto_319756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_319753 ?auto_319754 ?auto_319755 ?auto_319756 )
      ( MAKE-11PILE ?auto_319753 ?auto_319754 ?auto_319755 ?auto_319756 ?auto_319757 ?auto_319758 ?auto_319759 ?auto_319760 ?auto_319761 ?auto_319762 ?auto_319763 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319776 - BLOCK
      ?auto_319777 - BLOCK
      ?auto_319778 - BLOCK
      ?auto_319779 - BLOCK
      ?auto_319780 - BLOCK
      ?auto_319781 - BLOCK
      ?auto_319782 - BLOCK
      ?auto_319783 - BLOCK
      ?auto_319784 - BLOCK
      ?auto_319785 - BLOCK
      ?auto_319786 - BLOCK
    )
    :vars
    (
      ?auto_319787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319786 ?auto_319787 ) ( ON-TABLE ?auto_319776 ) ( ON ?auto_319777 ?auto_319776 ) ( ON ?auto_319778 ?auto_319777 ) ( not ( = ?auto_319776 ?auto_319777 ) ) ( not ( = ?auto_319776 ?auto_319778 ) ) ( not ( = ?auto_319776 ?auto_319779 ) ) ( not ( = ?auto_319776 ?auto_319780 ) ) ( not ( = ?auto_319776 ?auto_319781 ) ) ( not ( = ?auto_319776 ?auto_319782 ) ) ( not ( = ?auto_319776 ?auto_319783 ) ) ( not ( = ?auto_319776 ?auto_319784 ) ) ( not ( = ?auto_319776 ?auto_319785 ) ) ( not ( = ?auto_319776 ?auto_319786 ) ) ( not ( = ?auto_319776 ?auto_319787 ) ) ( not ( = ?auto_319777 ?auto_319778 ) ) ( not ( = ?auto_319777 ?auto_319779 ) ) ( not ( = ?auto_319777 ?auto_319780 ) ) ( not ( = ?auto_319777 ?auto_319781 ) ) ( not ( = ?auto_319777 ?auto_319782 ) ) ( not ( = ?auto_319777 ?auto_319783 ) ) ( not ( = ?auto_319777 ?auto_319784 ) ) ( not ( = ?auto_319777 ?auto_319785 ) ) ( not ( = ?auto_319777 ?auto_319786 ) ) ( not ( = ?auto_319777 ?auto_319787 ) ) ( not ( = ?auto_319778 ?auto_319779 ) ) ( not ( = ?auto_319778 ?auto_319780 ) ) ( not ( = ?auto_319778 ?auto_319781 ) ) ( not ( = ?auto_319778 ?auto_319782 ) ) ( not ( = ?auto_319778 ?auto_319783 ) ) ( not ( = ?auto_319778 ?auto_319784 ) ) ( not ( = ?auto_319778 ?auto_319785 ) ) ( not ( = ?auto_319778 ?auto_319786 ) ) ( not ( = ?auto_319778 ?auto_319787 ) ) ( not ( = ?auto_319779 ?auto_319780 ) ) ( not ( = ?auto_319779 ?auto_319781 ) ) ( not ( = ?auto_319779 ?auto_319782 ) ) ( not ( = ?auto_319779 ?auto_319783 ) ) ( not ( = ?auto_319779 ?auto_319784 ) ) ( not ( = ?auto_319779 ?auto_319785 ) ) ( not ( = ?auto_319779 ?auto_319786 ) ) ( not ( = ?auto_319779 ?auto_319787 ) ) ( not ( = ?auto_319780 ?auto_319781 ) ) ( not ( = ?auto_319780 ?auto_319782 ) ) ( not ( = ?auto_319780 ?auto_319783 ) ) ( not ( = ?auto_319780 ?auto_319784 ) ) ( not ( = ?auto_319780 ?auto_319785 ) ) ( not ( = ?auto_319780 ?auto_319786 ) ) ( not ( = ?auto_319780 ?auto_319787 ) ) ( not ( = ?auto_319781 ?auto_319782 ) ) ( not ( = ?auto_319781 ?auto_319783 ) ) ( not ( = ?auto_319781 ?auto_319784 ) ) ( not ( = ?auto_319781 ?auto_319785 ) ) ( not ( = ?auto_319781 ?auto_319786 ) ) ( not ( = ?auto_319781 ?auto_319787 ) ) ( not ( = ?auto_319782 ?auto_319783 ) ) ( not ( = ?auto_319782 ?auto_319784 ) ) ( not ( = ?auto_319782 ?auto_319785 ) ) ( not ( = ?auto_319782 ?auto_319786 ) ) ( not ( = ?auto_319782 ?auto_319787 ) ) ( not ( = ?auto_319783 ?auto_319784 ) ) ( not ( = ?auto_319783 ?auto_319785 ) ) ( not ( = ?auto_319783 ?auto_319786 ) ) ( not ( = ?auto_319783 ?auto_319787 ) ) ( not ( = ?auto_319784 ?auto_319785 ) ) ( not ( = ?auto_319784 ?auto_319786 ) ) ( not ( = ?auto_319784 ?auto_319787 ) ) ( not ( = ?auto_319785 ?auto_319786 ) ) ( not ( = ?auto_319785 ?auto_319787 ) ) ( not ( = ?auto_319786 ?auto_319787 ) ) ( ON ?auto_319785 ?auto_319786 ) ( ON ?auto_319784 ?auto_319785 ) ( ON ?auto_319783 ?auto_319784 ) ( ON ?auto_319782 ?auto_319783 ) ( ON ?auto_319781 ?auto_319782 ) ( ON ?auto_319780 ?auto_319781 ) ( CLEAR ?auto_319778 ) ( ON ?auto_319779 ?auto_319780 ) ( CLEAR ?auto_319779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_319776 ?auto_319777 ?auto_319778 ?auto_319779 )
      ( MAKE-11PILE ?auto_319776 ?auto_319777 ?auto_319778 ?auto_319779 ?auto_319780 ?auto_319781 ?auto_319782 ?auto_319783 ?auto_319784 ?auto_319785 ?auto_319786 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319799 - BLOCK
      ?auto_319800 - BLOCK
      ?auto_319801 - BLOCK
      ?auto_319802 - BLOCK
      ?auto_319803 - BLOCK
      ?auto_319804 - BLOCK
      ?auto_319805 - BLOCK
      ?auto_319806 - BLOCK
      ?auto_319807 - BLOCK
      ?auto_319808 - BLOCK
      ?auto_319809 - BLOCK
    )
    :vars
    (
      ?auto_319810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319809 ?auto_319810 ) ( ON-TABLE ?auto_319799 ) ( ON ?auto_319800 ?auto_319799 ) ( not ( = ?auto_319799 ?auto_319800 ) ) ( not ( = ?auto_319799 ?auto_319801 ) ) ( not ( = ?auto_319799 ?auto_319802 ) ) ( not ( = ?auto_319799 ?auto_319803 ) ) ( not ( = ?auto_319799 ?auto_319804 ) ) ( not ( = ?auto_319799 ?auto_319805 ) ) ( not ( = ?auto_319799 ?auto_319806 ) ) ( not ( = ?auto_319799 ?auto_319807 ) ) ( not ( = ?auto_319799 ?auto_319808 ) ) ( not ( = ?auto_319799 ?auto_319809 ) ) ( not ( = ?auto_319799 ?auto_319810 ) ) ( not ( = ?auto_319800 ?auto_319801 ) ) ( not ( = ?auto_319800 ?auto_319802 ) ) ( not ( = ?auto_319800 ?auto_319803 ) ) ( not ( = ?auto_319800 ?auto_319804 ) ) ( not ( = ?auto_319800 ?auto_319805 ) ) ( not ( = ?auto_319800 ?auto_319806 ) ) ( not ( = ?auto_319800 ?auto_319807 ) ) ( not ( = ?auto_319800 ?auto_319808 ) ) ( not ( = ?auto_319800 ?auto_319809 ) ) ( not ( = ?auto_319800 ?auto_319810 ) ) ( not ( = ?auto_319801 ?auto_319802 ) ) ( not ( = ?auto_319801 ?auto_319803 ) ) ( not ( = ?auto_319801 ?auto_319804 ) ) ( not ( = ?auto_319801 ?auto_319805 ) ) ( not ( = ?auto_319801 ?auto_319806 ) ) ( not ( = ?auto_319801 ?auto_319807 ) ) ( not ( = ?auto_319801 ?auto_319808 ) ) ( not ( = ?auto_319801 ?auto_319809 ) ) ( not ( = ?auto_319801 ?auto_319810 ) ) ( not ( = ?auto_319802 ?auto_319803 ) ) ( not ( = ?auto_319802 ?auto_319804 ) ) ( not ( = ?auto_319802 ?auto_319805 ) ) ( not ( = ?auto_319802 ?auto_319806 ) ) ( not ( = ?auto_319802 ?auto_319807 ) ) ( not ( = ?auto_319802 ?auto_319808 ) ) ( not ( = ?auto_319802 ?auto_319809 ) ) ( not ( = ?auto_319802 ?auto_319810 ) ) ( not ( = ?auto_319803 ?auto_319804 ) ) ( not ( = ?auto_319803 ?auto_319805 ) ) ( not ( = ?auto_319803 ?auto_319806 ) ) ( not ( = ?auto_319803 ?auto_319807 ) ) ( not ( = ?auto_319803 ?auto_319808 ) ) ( not ( = ?auto_319803 ?auto_319809 ) ) ( not ( = ?auto_319803 ?auto_319810 ) ) ( not ( = ?auto_319804 ?auto_319805 ) ) ( not ( = ?auto_319804 ?auto_319806 ) ) ( not ( = ?auto_319804 ?auto_319807 ) ) ( not ( = ?auto_319804 ?auto_319808 ) ) ( not ( = ?auto_319804 ?auto_319809 ) ) ( not ( = ?auto_319804 ?auto_319810 ) ) ( not ( = ?auto_319805 ?auto_319806 ) ) ( not ( = ?auto_319805 ?auto_319807 ) ) ( not ( = ?auto_319805 ?auto_319808 ) ) ( not ( = ?auto_319805 ?auto_319809 ) ) ( not ( = ?auto_319805 ?auto_319810 ) ) ( not ( = ?auto_319806 ?auto_319807 ) ) ( not ( = ?auto_319806 ?auto_319808 ) ) ( not ( = ?auto_319806 ?auto_319809 ) ) ( not ( = ?auto_319806 ?auto_319810 ) ) ( not ( = ?auto_319807 ?auto_319808 ) ) ( not ( = ?auto_319807 ?auto_319809 ) ) ( not ( = ?auto_319807 ?auto_319810 ) ) ( not ( = ?auto_319808 ?auto_319809 ) ) ( not ( = ?auto_319808 ?auto_319810 ) ) ( not ( = ?auto_319809 ?auto_319810 ) ) ( ON ?auto_319808 ?auto_319809 ) ( ON ?auto_319807 ?auto_319808 ) ( ON ?auto_319806 ?auto_319807 ) ( ON ?auto_319805 ?auto_319806 ) ( ON ?auto_319804 ?auto_319805 ) ( ON ?auto_319803 ?auto_319804 ) ( ON ?auto_319802 ?auto_319803 ) ( CLEAR ?auto_319800 ) ( ON ?auto_319801 ?auto_319802 ) ( CLEAR ?auto_319801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_319799 ?auto_319800 ?auto_319801 )
      ( MAKE-11PILE ?auto_319799 ?auto_319800 ?auto_319801 ?auto_319802 ?auto_319803 ?auto_319804 ?auto_319805 ?auto_319806 ?auto_319807 ?auto_319808 ?auto_319809 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319822 - BLOCK
      ?auto_319823 - BLOCK
      ?auto_319824 - BLOCK
      ?auto_319825 - BLOCK
      ?auto_319826 - BLOCK
      ?auto_319827 - BLOCK
      ?auto_319828 - BLOCK
      ?auto_319829 - BLOCK
      ?auto_319830 - BLOCK
      ?auto_319831 - BLOCK
      ?auto_319832 - BLOCK
    )
    :vars
    (
      ?auto_319833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319832 ?auto_319833 ) ( ON-TABLE ?auto_319822 ) ( ON ?auto_319823 ?auto_319822 ) ( not ( = ?auto_319822 ?auto_319823 ) ) ( not ( = ?auto_319822 ?auto_319824 ) ) ( not ( = ?auto_319822 ?auto_319825 ) ) ( not ( = ?auto_319822 ?auto_319826 ) ) ( not ( = ?auto_319822 ?auto_319827 ) ) ( not ( = ?auto_319822 ?auto_319828 ) ) ( not ( = ?auto_319822 ?auto_319829 ) ) ( not ( = ?auto_319822 ?auto_319830 ) ) ( not ( = ?auto_319822 ?auto_319831 ) ) ( not ( = ?auto_319822 ?auto_319832 ) ) ( not ( = ?auto_319822 ?auto_319833 ) ) ( not ( = ?auto_319823 ?auto_319824 ) ) ( not ( = ?auto_319823 ?auto_319825 ) ) ( not ( = ?auto_319823 ?auto_319826 ) ) ( not ( = ?auto_319823 ?auto_319827 ) ) ( not ( = ?auto_319823 ?auto_319828 ) ) ( not ( = ?auto_319823 ?auto_319829 ) ) ( not ( = ?auto_319823 ?auto_319830 ) ) ( not ( = ?auto_319823 ?auto_319831 ) ) ( not ( = ?auto_319823 ?auto_319832 ) ) ( not ( = ?auto_319823 ?auto_319833 ) ) ( not ( = ?auto_319824 ?auto_319825 ) ) ( not ( = ?auto_319824 ?auto_319826 ) ) ( not ( = ?auto_319824 ?auto_319827 ) ) ( not ( = ?auto_319824 ?auto_319828 ) ) ( not ( = ?auto_319824 ?auto_319829 ) ) ( not ( = ?auto_319824 ?auto_319830 ) ) ( not ( = ?auto_319824 ?auto_319831 ) ) ( not ( = ?auto_319824 ?auto_319832 ) ) ( not ( = ?auto_319824 ?auto_319833 ) ) ( not ( = ?auto_319825 ?auto_319826 ) ) ( not ( = ?auto_319825 ?auto_319827 ) ) ( not ( = ?auto_319825 ?auto_319828 ) ) ( not ( = ?auto_319825 ?auto_319829 ) ) ( not ( = ?auto_319825 ?auto_319830 ) ) ( not ( = ?auto_319825 ?auto_319831 ) ) ( not ( = ?auto_319825 ?auto_319832 ) ) ( not ( = ?auto_319825 ?auto_319833 ) ) ( not ( = ?auto_319826 ?auto_319827 ) ) ( not ( = ?auto_319826 ?auto_319828 ) ) ( not ( = ?auto_319826 ?auto_319829 ) ) ( not ( = ?auto_319826 ?auto_319830 ) ) ( not ( = ?auto_319826 ?auto_319831 ) ) ( not ( = ?auto_319826 ?auto_319832 ) ) ( not ( = ?auto_319826 ?auto_319833 ) ) ( not ( = ?auto_319827 ?auto_319828 ) ) ( not ( = ?auto_319827 ?auto_319829 ) ) ( not ( = ?auto_319827 ?auto_319830 ) ) ( not ( = ?auto_319827 ?auto_319831 ) ) ( not ( = ?auto_319827 ?auto_319832 ) ) ( not ( = ?auto_319827 ?auto_319833 ) ) ( not ( = ?auto_319828 ?auto_319829 ) ) ( not ( = ?auto_319828 ?auto_319830 ) ) ( not ( = ?auto_319828 ?auto_319831 ) ) ( not ( = ?auto_319828 ?auto_319832 ) ) ( not ( = ?auto_319828 ?auto_319833 ) ) ( not ( = ?auto_319829 ?auto_319830 ) ) ( not ( = ?auto_319829 ?auto_319831 ) ) ( not ( = ?auto_319829 ?auto_319832 ) ) ( not ( = ?auto_319829 ?auto_319833 ) ) ( not ( = ?auto_319830 ?auto_319831 ) ) ( not ( = ?auto_319830 ?auto_319832 ) ) ( not ( = ?auto_319830 ?auto_319833 ) ) ( not ( = ?auto_319831 ?auto_319832 ) ) ( not ( = ?auto_319831 ?auto_319833 ) ) ( not ( = ?auto_319832 ?auto_319833 ) ) ( ON ?auto_319831 ?auto_319832 ) ( ON ?auto_319830 ?auto_319831 ) ( ON ?auto_319829 ?auto_319830 ) ( ON ?auto_319828 ?auto_319829 ) ( ON ?auto_319827 ?auto_319828 ) ( ON ?auto_319826 ?auto_319827 ) ( ON ?auto_319825 ?auto_319826 ) ( CLEAR ?auto_319823 ) ( ON ?auto_319824 ?auto_319825 ) ( CLEAR ?auto_319824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_319822 ?auto_319823 ?auto_319824 )
      ( MAKE-11PILE ?auto_319822 ?auto_319823 ?auto_319824 ?auto_319825 ?auto_319826 ?auto_319827 ?auto_319828 ?auto_319829 ?auto_319830 ?auto_319831 ?auto_319832 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319845 - BLOCK
      ?auto_319846 - BLOCK
      ?auto_319847 - BLOCK
      ?auto_319848 - BLOCK
      ?auto_319849 - BLOCK
      ?auto_319850 - BLOCK
      ?auto_319851 - BLOCK
      ?auto_319852 - BLOCK
      ?auto_319853 - BLOCK
      ?auto_319854 - BLOCK
      ?auto_319855 - BLOCK
    )
    :vars
    (
      ?auto_319856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319855 ?auto_319856 ) ( ON-TABLE ?auto_319845 ) ( not ( = ?auto_319845 ?auto_319846 ) ) ( not ( = ?auto_319845 ?auto_319847 ) ) ( not ( = ?auto_319845 ?auto_319848 ) ) ( not ( = ?auto_319845 ?auto_319849 ) ) ( not ( = ?auto_319845 ?auto_319850 ) ) ( not ( = ?auto_319845 ?auto_319851 ) ) ( not ( = ?auto_319845 ?auto_319852 ) ) ( not ( = ?auto_319845 ?auto_319853 ) ) ( not ( = ?auto_319845 ?auto_319854 ) ) ( not ( = ?auto_319845 ?auto_319855 ) ) ( not ( = ?auto_319845 ?auto_319856 ) ) ( not ( = ?auto_319846 ?auto_319847 ) ) ( not ( = ?auto_319846 ?auto_319848 ) ) ( not ( = ?auto_319846 ?auto_319849 ) ) ( not ( = ?auto_319846 ?auto_319850 ) ) ( not ( = ?auto_319846 ?auto_319851 ) ) ( not ( = ?auto_319846 ?auto_319852 ) ) ( not ( = ?auto_319846 ?auto_319853 ) ) ( not ( = ?auto_319846 ?auto_319854 ) ) ( not ( = ?auto_319846 ?auto_319855 ) ) ( not ( = ?auto_319846 ?auto_319856 ) ) ( not ( = ?auto_319847 ?auto_319848 ) ) ( not ( = ?auto_319847 ?auto_319849 ) ) ( not ( = ?auto_319847 ?auto_319850 ) ) ( not ( = ?auto_319847 ?auto_319851 ) ) ( not ( = ?auto_319847 ?auto_319852 ) ) ( not ( = ?auto_319847 ?auto_319853 ) ) ( not ( = ?auto_319847 ?auto_319854 ) ) ( not ( = ?auto_319847 ?auto_319855 ) ) ( not ( = ?auto_319847 ?auto_319856 ) ) ( not ( = ?auto_319848 ?auto_319849 ) ) ( not ( = ?auto_319848 ?auto_319850 ) ) ( not ( = ?auto_319848 ?auto_319851 ) ) ( not ( = ?auto_319848 ?auto_319852 ) ) ( not ( = ?auto_319848 ?auto_319853 ) ) ( not ( = ?auto_319848 ?auto_319854 ) ) ( not ( = ?auto_319848 ?auto_319855 ) ) ( not ( = ?auto_319848 ?auto_319856 ) ) ( not ( = ?auto_319849 ?auto_319850 ) ) ( not ( = ?auto_319849 ?auto_319851 ) ) ( not ( = ?auto_319849 ?auto_319852 ) ) ( not ( = ?auto_319849 ?auto_319853 ) ) ( not ( = ?auto_319849 ?auto_319854 ) ) ( not ( = ?auto_319849 ?auto_319855 ) ) ( not ( = ?auto_319849 ?auto_319856 ) ) ( not ( = ?auto_319850 ?auto_319851 ) ) ( not ( = ?auto_319850 ?auto_319852 ) ) ( not ( = ?auto_319850 ?auto_319853 ) ) ( not ( = ?auto_319850 ?auto_319854 ) ) ( not ( = ?auto_319850 ?auto_319855 ) ) ( not ( = ?auto_319850 ?auto_319856 ) ) ( not ( = ?auto_319851 ?auto_319852 ) ) ( not ( = ?auto_319851 ?auto_319853 ) ) ( not ( = ?auto_319851 ?auto_319854 ) ) ( not ( = ?auto_319851 ?auto_319855 ) ) ( not ( = ?auto_319851 ?auto_319856 ) ) ( not ( = ?auto_319852 ?auto_319853 ) ) ( not ( = ?auto_319852 ?auto_319854 ) ) ( not ( = ?auto_319852 ?auto_319855 ) ) ( not ( = ?auto_319852 ?auto_319856 ) ) ( not ( = ?auto_319853 ?auto_319854 ) ) ( not ( = ?auto_319853 ?auto_319855 ) ) ( not ( = ?auto_319853 ?auto_319856 ) ) ( not ( = ?auto_319854 ?auto_319855 ) ) ( not ( = ?auto_319854 ?auto_319856 ) ) ( not ( = ?auto_319855 ?auto_319856 ) ) ( ON ?auto_319854 ?auto_319855 ) ( ON ?auto_319853 ?auto_319854 ) ( ON ?auto_319852 ?auto_319853 ) ( ON ?auto_319851 ?auto_319852 ) ( ON ?auto_319850 ?auto_319851 ) ( ON ?auto_319849 ?auto_319850 ) ( ON ?auto_319848 ?auto_319849 ) ( ON ?auto_319847 ?auto_319848 ) ( CLEAR ?auto_319845 ) ( ON ?auto_319846 ?auto_319847 ) ( CLEAR ?auto_319846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_319845 ?auto_319846 )
      ( MAKE-11PILE ?auto_319845 ?auto_319846 ?auto_319847 ?auto_319848 ?auto_319849 ?auto_319850 ?auto_319851 ?auto_319852 ?auto_319853 ?auto_319854 ?auto_319855 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319868 - BLOCK
      ?auto_319869 - BLOCK
      ?auto_319870 - BLOCK
      ?auto_319871 - BLOCK
      ?auto_319872 - BLOCK
      ?auto_319873 - BLOCK
      ?auto_319874 - BLOCK
      ?auto_319875 - BLOCK
      ?auto_319876 - BLOCK
      ?auto_319877 - BLOCK
      ?auto_319878 - BLOCK
    )
    :vars
    (
      ?auto_319879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319878 ?auto_319879 ) ( ON-TABLE ?auto_319868 ) ( not ( = ?auto_319868 ?auto_319869 ) ) ( not ( = ?auto_319868 ?auto_319870 ) ) ( not ( = ?auto_319868 ?auto_319871 ) ) ( not ( = ?auto_319868 ?auto_319872 ) ) ( not ( = ?auto_319868 ?auto_319873 ) ) ( not ( = ?auto_319868 ?auto_319874 ) ) ( not ( = ?auto_319868 ?auto_319875 ) ) ( not ( = ?auto_319868 ?auto_319876 ) ) ( not ( = ?auto_319868 ?auto_319877 ) ) ( not ( = ?auto_319868 ?auto_319878 ) ) ( not ( = ?auto_319868 ?auto_319879 ) ) ( not ( = ?auto_319869 ?auto_319870 ) ) ( not ( = ?auto_319869 ?auto_319871 ) ) ( not ( = ?auto_319869 ?auto_319872 ) ) ( not ( = ?auto_319869 ?auto_319873 ) ) ( not ( = ?auto_319869 ?auto_319874 ) ) ( not ( = ?auto_319869 ?auto_319875 ) ) ( not ( = ?auto_319869 ?auto_319876 ) ) ( not ( = ?auto_319869 ?auto_319877 ) ) ( not ( = ?auto_319869 ?auto_319878 ) ) ( not ( = ?auto_319869 ?auto_319879 ) ) ( not ( = ?auto_319870 ?auto_319871 ) ) ( not ( = ?auto_319870 ?auto_319872 ) ) ( not ( = ?auto_319870 ?auto_319873 ) ) ( not ( = ?auto_319870 ?auto_319874 ) ) ( not ( = ?auto_319870 ?auto_319875 ) ) ( not ( = ?auto_319870 ?auto_319876 ) ) ( not ( = ?auto_319870 ?auto_319877 ) ) ( not ( = ?auto_319870 ?auto_319878 ) ) ( not ( = ?auto_319870 ?auto_319879 ) ) ( not ( = ?auto_319871 ?auto_319872 ) ) ( not ( = ?auto_319871 ?auto_319873 ) ) ( not ( = ?auto_319871 ?auto_319874 ) ) ( not ( = ?auto_319871 ?auto_319875 ) ) ( not ( = ?auto_319871 ?auto_319876 ) ) ( not ( = ?auto_319871 ?auto_319877 ) ) ( not ( = ?auto_319871 ?auto_319878 ) ) ( not ( = ?auto_319871 ?auto_319879 ) ) ( not ( = ?auto_319872 ?auto_319873 ) ) ( not ( = ?auto_319872 ?auto_319874 ) ) ( not ( = ?auto_319872 ?auto_319875 ) ) ( not ( = ?auto_319872 ?auto_319876 ) ) ( not ( = ?auto_319872 ?auto_319877 ) ) ( not ( = ?auto_319872 ?auto_319878 ) ) ( not ( = ?auto_319872 ?auto_319879 ) ) ( not ( = ?auto_319873 ?auto_319874 ) ) ( not ( = ?auto_319873 ?auto_319875 ) ) ( not ( = ?auto_319873 ?auto_319876 ) ) ( not ( = ?auto_319873 ?auto_319877 ) ) ( not ( = ?auto_319873 ?auto_319878 ) ) ( not ( = ?auto_319873 ?auto_319879 ) ) ( not ( = ?auto_319874 ?auto_319875 ) ) ( not ( = ?auto_319874 ?auto_319876 ) ) ( not ( = ?auto_319874 ?auto_319877 ) ) ( not ( = ?auto_319874 ?auto_319878 ) ) ( not ( = ?auto_319874 ?auto_319879 ) ) ( not ( = ?auto_319875 ?auto_319876 ) ) ( not ( = ?auto_319875 ?auto_319877 ) ) ( not ( = ?auto_319875 ?auto_319878 ) ) ( not ( = ?auto_319875 ?auto_319879 ) ) ( not ( = ?auto_319876 ?auto_319877 ) ) ( not ( = ?auto_319876 ?auto_319878 ) ) ( not ( = ?auto_319876 ?auto_319879 ) ) ( not ( = ?auto_319877 ?auto_319878 ) ) ( not ( = ?auto_319877 ?auto_319879 ) ) ( not ( = ?auto_319878 ?auto_319879 ) ) ( ON ?auto_319877 ?auto_319878 ) ( ON ?auto_319876 ?auto_319877 ) ( ON ?auto_319875 ?auto_319876 ) ( ON ?auto_319874 ?auto_319875 ) ( ON ?auto_319873 ?auto_319874 ) ( ON ?auto_319872 ?auto_319873 ) ( ON ?auto_319871 ?auto_319872 ) ( ON ?auto_319870 ?auto_319871 ) ( CLEAR ?auto_319868 ) ( ON ?auto_319869 ?auto_319870 ) ( CLEAR ?auto_319869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_319868 ?auto_319869 )
      ( MAKE-11PILE ?auto_319868 ?auto_319869 ?auto_319870 ?auto_319871 ?auto_319872 ?auto_319873 ?auto_319874 ?auto_319875 ?auto_319876 ?auto_319877 ?auto_319878 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319891 - BLOCK
      ?auto_319892 - BLOCK
      ?auto_319893 - BLOCK
      ?auto_319894 - BLOCK
      ?auto_319895 - BLOCK
      ?auto_319896 - BLOCK
      ?auto_319897 - BLOCK
      ?auto_319898 - BLOCK
      ?auto_319899 - BLOCK
      ?auto_319900 - BLOCK
      ?auto_319901 - BLOCK
    )
    :vars
    (
      ?auto_319902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319901 ?auto_319902 ) ( not ( = ?auto_319891 ?auto_319892 ) ) ( not ( = ?auto_319891 ?auto_319893 ) ) ( not ( = ?auto_319891 ?auto_319894 ) ) ( not ( = ?auto_319891 ?auto_319895 ) ) ( not ( = ?auto_319891 ?auto_319896 ) ) ( not ( = ?auto_319891 ?auto_319897 ) ) ( not ( = ?auto_319891 ?auto_319898 ) ) ( not ( = ?auto_319891 ?auto_319899 ) ) ( not ( = ?auto_319891 ?auto_319900 ) ) ( not ( = ?auto_319891 ?auto_319901 ) ) ( not ( = ?auto_319891 ?auto_319902 ) ) ( not ( = ?auto_319892 ?auto_319893 ) ) ( not ( = ?auto_319892 ?auto_319894 ) ) ( not ( = ?auto_319892 ?auto_319895 ) ) ( not ( = ?auto_319892 ?auto_319896 ) ) ( not ( = ?auto_319892 ?auto_319897 ) ) ( not ( = ?auto_319892 ?auto_319898 ) ) ( not ( = ?auto_319892 ?auto_319899 ) ) ( not ( = ?auto_319892 ?auto_319900 ) ) ( not ( = ?auto_319892 ?auto_319901 ) ) ( not ( = ?auto_319892 ?auto_319902 ) ) ( not ( = ?auto_319893 ?auto_319894 ) ) ( not ( = ?auto_319893 ?auto_319895 ) ) ( not ( = ?auto_319893 ?auto_319896 ) ) ( not ( = ?auto_319893 ?auto_319897 ) ) ( not ( = ?auto_319893 ?auto_319898 ) ) ( not ( = ?auto_319893 ?auto_319899 ) ) ( not ( = ?auto_319893 ?auto_319900 ) ) ( not ( = ?auto_319893 ?auto_319901 ) ) ( not ( = ?auto_319893 ?auto_319902 ) ) ( not ( = ?auto_319894 ?auto_319895 ) ) ( not ( = ?auto_319894 ?auto_319896 ) ) ( not ( = ?auto_319894 ?auto_319897 ) ) ( not ( = ?auto_319894 ?auto_319898 ) ) ( not ( = ?auto_319894 ?auto_319899 ) ) ( not ( = ?auto_319894 ?auto_319900 ) ) ( not ( = ?auto_319894 ?auto_319901 ) ) ( not ( = ?auto_319894 ?auto_319902 ) ) ( not ( = ?auto_319895 ?auto_319896 ) ) ( not ( = ?auto_319895 ?auto_319897 ) ) ( not ( = ?auto_319895 ?auto_319898 ) ) ( not ( = ?auto_319895 ?auto_319899 ) ) ( not ( = ?auto_319895 ?auto_319900 ) ) ( not ( = ?auto_319895 ?auto_319901 ) ) ( not ( = ?auto_319895 ?auto_319902 ) ) ( not ( = ?auto_319896 ?auto_319897 ) ) ( not ( = ?auto_319896 ?auto_319898 ) ) ( not ( = ?auto_319896 ?auto_319899 ) ) ( not ( = ?auto_319896 ?auto_319900 ) ) ( not ( = ?auto_319896 ?auto_319901 ) ) ( not ( = ?auto_319896 ?auto_319902 ) ) ( not ( = ?auto_319897 ?auto_319898 ) ) ( not ( = ?auto_319897 ?auto_319899 ) ) ( not ( = ?auto_319897 ?auto_319900 ) ) ( not ( = ?auto_319897 ?auto_319901 ) ) ( not ( = ?auto_319897 ?auto_319902 ) ) ( not ( = ?auto_319898 ?auto_319899 ) ) ( not ( = ?auto_319898 ?auto_319900 ) ) ( not ( = ?auto_319898 ?auto_319901 ) ) ( not ( = ?auto_319898 ?auto_319902 ) ) ( not ( = ?auto_319899 ?auto_319900 ) ) ( not ( = ?auto_319899 ?auto_319901 ) ) ( not ( = ?auto_319899 ?auto_319902 ) ) ( not ( = ?auto_319900 ?auto_319901 ) ) ( not ( = ?auto_319900 ?auto_319902 ) ) ( not ( = ?auto_319901 ?auto_319902 ) ) ( ON ?auto_319900 ?auto_319901 ) ( ON ?auto_319899 ?auto_319900 ) ( ON ?auto_319898 ?auto_319899 ) ( ON ?auto_319897 ?auto_319898 ) ( ON ?auto_319896 ?auto_319897 ) ( ON ?auto_319895 ?auto_319896 ) ( ON ?auto_319894 ?auto_319895 ) ( ON ?auto_319893 ?auto_319894 ) ( ON ?auto_319892 ?auto_319893 ) ( ON ?auto_319891 ?auto_319892 ) ( CLEAR ?auto_319891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_319891 )
      ( MAKE-11PILE ?auto_319891 ?auto_319892 ?auto_319893 ?auto_319894 ?auto_319895 ?auto_319896 ?auto_319897 ?auto_319898 ?auto_319899 ?auto_319900 ?auto_319901 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_319914 - BLOCK
      ?auto_319915 - BLOCK
      ?auto_319916 - BLOCK
      ?auto_319917 - BLOCK
      ?auto_319918 - BLOCK
      ?auto_319919 - BLOCK
      ?auto_319920 - BLOCK
      ?auto_319921 - BLOCK
      ?auto_319922 - BLOCK
      ?auto_319923 - BLOCK
      ?auto_319924 - BLOCK
    )
    :vars
    (
      ?auto_319925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319924 ?auto_319925 ) ( not ( = ?auto_319914 ?auto_319915 ) ) ( not ( = ?auto_319914 ?auto_319916 ) ) ( not ( = ?auto_319914 ?auto_319917 ) ) ( not ( = ?auto_319914 ?auto_319918 ) ) ( not ( = ?auto_319914 ?auto_319919 ) ) ( not ( = ?auto_319914 ?auto_319920 ) ) ( not ( = ?auto_319914 ?auto_319921 ) ) ( not ( = ?auto_319914 ?auto_319922 ) ) ( not ( = ?auto_319914 ?auto_319923 ) ) ( not ( = ?auto_319914 ?auto_319924 ) ) ( not ( = ?auto_319914 ?auto_319925 ) ) ( not ( = ?auto_319915 ?auto_319916 ) ) ( not ( = ?auto_319915 ?auto_319917 ) ) ( not ( = ?auto_319915 ?auto_319918 ) ) ( not ( = ?auto_319915 ?auto_319919 ) ) ( not ( = ?auto_319915 ?auto_319920 ) ) ( not ( = ?auto_319915 ?auto_319921 ) ) ( not ( = ?auto_319915 ?auto_319922 ) ) ( not ( = ?auto_319915 ?auto_319923 ) ) ( not ( = ?auto_319915 ?auto_319924 ) ) ( not ( = ?auto_319915 ?auto_319925 ) ) ( not ( = ?auto_319916 ?auto_319917 ) ) ( not ( = ?auto_319916 ?auto_319918 ) ) ( not ( = ?auto_319916 ?auto_319919 ) ) ( not ( = ?auto_319916 ?auto_319920 ) ) ( not ( = ?auto_319916 ?auto_319921 ) ) ( not ( = ?auto_319916 ?auto_319922 ) ) ( not ( = ?auto_319916 ?auto_319923 ) ) ( not ( = ?auto_319916 ?auto_319924 ) ) ( not ( = ?auto_319916 ?auto_319925 ) ) ( not ( = ?auto_319917 ?auto_319918 ) ) ( not ( = ?auto_319917 ?auto_319919 ) ) ( not ( = ?auto_319917 ?auto_319920 ) ) ( not ( = ?auto_319917 ?auto_319921 ) ) ( not ( = ?auto_319917 ?auto_319922 ) ) ( not ( = ?auto_319917 ?auto_319923 ) ) ( not ( = ?auto_319917 ?auto_319924 ) ) ( not ( = ?auto_319917 ?auto_319925 ) ) ( not ( = ?auto_319918 ?auto_319919 ) ) ( not ( = ?auto_319918 ?auto_319920 ) ) ( not ( = ?auto_319918 ?auto_319921 ) ) ( not ( = ?auto_319918 ?auto_319922 ) ) ( not ( = ?auto_319918 ?auto_319923 ) ) ( not ( = ?auto_319918 ?auto_319924 ) ) ( not ( = ?auto_319918 ?auto_319925 ) ) ( not ( = ?auto_319919 ?auto_319920 ) ) ( not ( = ?auto_319919 ?auto_319921 ) ) ( not ( = ?auto_319919 ?auto_319922 ) ) ( not ( = ?auto_319919 ?auto_319923 ) ) ( not ( = ?auto_319919 ?auto_319924 ) ) ( not ( = ?auto_319919 ?auto_319925 ) ) ( not ( = ?auto_319920 ?auto_319921 ) ) ( not ( = ?auto_319920 ?auto_319922 ) ) ( not ( = ?auto_319920 ?auto_319923 ) ) ( not ( = ?auto_319920 ?auto_319924 ) ) ( not ( = ?auto_319920 ?auto_319925 ) ) ( not ( = ?auto_319921 ?auto_319922 ) ) ( not ( = ?auto_319921 ?auto_319923 ) ) ( not ( = ?auto_319921 ?auto_319924 ) ) ( not ( = ?auto_319921 ?auto_319925 ) ) ( not ( = ?auto_319922 ?auto_319923 ) ) ( not ( = ?auto_319922 ?auto_319924 ) ) ( not ( = ?auto_319922 ?auto_319925 ) ) ( not ( = ?auto_319923 ?auto_319924 ) ) ( not ( = ?auto_319923 ?auto_319925 ) ) ( not ( = ?auto_319924 ?auto_319925 ) ) ( ON ?auto_319923 ?auto_319924 ) ( ON ?auto_319922 ?auto_319923 ) ( ON ?auto_319921 ?auto_319922 ) ( ON ?auto_319920 ?auto_319921 ) ( ON ?auto_319919 ?auto_319920 ) ( ON ?auto_319918 ?auto_319919 ) ( ON ?auto_319917 ?auto_319918 ) ( ON ?auto_319916 ?auto_319917 ) ( ON ?auto_319915 ?auto_319916 ) ( ON ?auto_319914 ?auto_319915 ) ( CLEAR ?auto_319914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_319914 )
      ( MAKE-11PILE ?auto_319914 ?auto_319915 ?auto_319916 ?auto_319917 ?auto_319918 ?auto_319919 ?auto_319920 ?auto_319921 ?auto_319922 ?auto_319923 ?auto_319924 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_319938 - BLOCK
      ?auto_319939 - BLOCK
      ?auto_319940 - BLOCK
      ?auto_319941 - BLOCK
      ?auto_319942 - BLOCK
      ?auto_319943 - BLOCK
      ?auto_319944 - BLOCK
      ?auto_319945 - BLOCK
      ?auto_319946 - BLOCK
      ?auto_319947 - BLOCK
      ?auto_319948 - BLOCK
      ?auto_319949 - BLOCK
    )
    :vars
    (
      ?auto_319950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_319948 ) ( ON ?auto_319949 ?auto_319950 ) ( CLEAR ?auto_319949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_319938 ) ( ON ?auto_319939 ?auto_319938 ) ( ON ?auto_319940 ?auto_319939 ) ( ON ?auto_319941 ?auto_319940 ) ( ON ?auto_319942 ?auto_319941 ) ( ON ?auto_319943 ?auto_319942 ) ( ON ?auto_319944 ?auto_319943 ) ( ON ?auto_319945 ?auto_319944 ) ( ON ?auto_319946 ?auto_319945 ) ( ON ?auto_319947 ?auto_319946 ) ( ON ?auto_319948 ?auto_319947 ) ( not ( = ?auto_319938 ?auto_319939 ) ) ( not ( = ?auto_319938 ?auto_319940 ) ) ( not ( = ?auto_319938 ?auto_319941 ) ) ( not ( = ?auto_319938 ?auto_319942 ) ) ( not ( = ?auto_319938 ?auto_319943 ) ) ( not ( = ?auto_319938 ?auto_319944 ) ) ( not ( = ?auto_319938 ?auto_319945 ) ) ( not ( = ?auto_319938 ?auto_319946 ) ) ( not ( = ?auto_319938 ?auto_319947 ) ) ( not ( = ?auto_319938 ?auto_319948 ) ) ( not ( = ?auto_319938 ?auto_319949 ) ) ( not ( = ?auto_319938 ?auto_319950 ) ) ( not ( = ?auto_319939 ?auto_319940 ) ) ( not ( = ?auto_319939 ?auto_319941 ) ) ( not ( = ?auto_319939 ?auto_319942 ) ) ( not ( = ?auto_319939 ?auto_319943 ) ) ( not ( = ?auto_319939 ?auto_319944 ) ) ( not ( = ?auto_319939 ?auto_319945 ) ) ( not ( = ?auto_319939 ?auto_319946 ) ) ( not ( = ?auto_319939 ?auto_319947 ) ) ( not ( = ?auto_319939 ?auto_319948 ) ) ( not ( = ?auto_319939 ?auto_319949 ) ) ( not ( = ?auto_319939 ?auto_319950 ) ) ( not ( = ?auto_319940 ?auto_319941 ) ) ( not ( = ?auto_319940 ?auto_319942 ) ) ( not ( = ?auto_319940 ?auto_319943 ) ) ( not ( = ?auto_319940 ?auto_319944 ) ) ( not ( = ?auto_319940 ?auto_319945 ) ) ( not ( = ?auto_319940 ?auto_319946 ) ) ( not ( = ?auto_319940 ?auto_319947 ) ) ( not ( = ?auto_319940 ?auto_319948 ) ) ( not ( = ?auto_319940 ?auto_319949 ) ) ( not ( = ?auto_319940 ?auto_319950 ) ) ( not ( = ?auto_319941 ?auto_319942 ) ) ( not ( = ?auto_319941 ?auto_319943 ) ) ( not ( = ?auto_319941 ?auto_319944 ) ) ( not ( = ?auto_319941 ?auto_319945 ) ) ( not ( = ?auto_319941 ?auto_319946 ) ) ( not ( = ?auto_319941 ?auto_319947 ) ) ( not ( = ?auto_319941 ?auto_319948 ) ) ( not ( = ?auto_319941 ?auto_319949 ) ) ( not ( = ?auto_319941 ?auto_319950 ) ) ( not ( = ?auto_319942 ?auto_319943 ) ) ( not ( = ?auto_319942 ?auto_319944 ) ) ( not ( = ?auto_319942 ?auto_319945 ) ) ( not ( = ?auto_319942 ?auto_319946 ) ) ( not ( = ?auto_319942 ?auto_319947 ) ) ( not ( = ?auto_319942 ?auto_319948 ) ) ( not ( = ?auto_319942 ?auto_319949 ) ) ( not ( = ?auto_319942 ?auto_319950 ) ) ( not ( = ?auto_319943 ?auto_319944 ) ) ( not ( = ?auto_319943 ?auto_319945 ) ) ( not ( = ?auto_319943 ?auto_319946 ) ) ( not ( = ?auto_319943 ?auto_319947 ) ) ( not ( = ?auto_319943 ?auto_319948 ) ) ( not ( = ?auto_319943 ?auto_319949 ) ) ( not ( = ?auto_319943 ?auto_319950 ) ) ( not ( = ?auto_319944 ?auto_319945 ) ) ( not ( = ?auto_319944 ?auto_319946 ) ) ( not ( = ?auto_319944 ?auto_319947 ) ) ( not ( = ?auto_319944 ?auto_319948 ) ) ( not ( = ?auto_319944 ?auto_319949 ) ) ( not ( = ?auto_319944 ?auto_319950 ) ) ( not ( = ?auto_319945 ?auto_319946 ) ) ( not ( = ?auto_319945 ?auto_319947 ) ) ( not ( = ?auto_319945 ?auto_319948 ) ) ( not ( = ?auto_319945 ?auto_319949 ) ) ( not ( = ?auto_319945 ?auto_319950 ) ) ( not ( = ?auto_319946 ?auto_319947 ) ) ( not ( = ?auto_319946 ?auto_319948 ) ) ( not ( = ?auto_319946 ?auto_319949 ) ) ( not ( = ?auto_319946 ?auto_319950 ) ) ( not ( = ?auto_319947 ?auto_319948 ) ) ( not ( = ?auto_319947 ?auto_319949 ) ) ( not ( = ?auto_319947 ?auto_319950 ) ) ( not ( = ?auto_319948 ?auto_319949 ) ) ( not ( = ?auto_319948 ?auto_319950 ) ) ( not ( = ?auto_319949 ?auto_319950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_319949 ?auto_319950 )
      ( !STACK ?auto_319949 ?auto_319948 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_319963 - BLOCK
      ?auto_319964 - BLOCK
      ?auto_319965 - BLOCK
      ?auto_319966 - BLOCK
      ?auto_319967 - BLOCK
      ?auto_319968 - BLOCK
      ?auto_319969 - BLOCK
      ?auto_319970 - BLOCK
      ?auto_319971 - BLOCK
      ?auto_319972 - BLOCK
      ?auto_319973 - BLOCK
      ?auto_319974 - BLOCK
    )
    :vars
    (
      ?auto_319975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_319973 ) ( ON ?auto_319974 ?auto_319975 ) ( CLEAR ?auto_319974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_319963 ) ( ON ?auto_319964 ?auto_319963 ) ( ON ?auto_319965 ?auto_319964 ) ( ON ?auto_319966 ?auto_319965 ) ( ON ?auto_319967 ?auto_319966 ) ( ON ?auto_319968 ?auto_319967 ) ( ON ?auto_319969 ?auto_319968 ) ( ON ?auto_319970 ?auto_319969 ) ( ON ?auto_319971 ?auto_319970 ) ( ON ?auto_319972 ?auto_319971 ) ( ON ?auto_319973 ?auto_319972 ) ( not ( = ?auto_319963 ?auto_319964 ) ) ( not ( = ?auto_319963 ?auto_319965 ) ) ( not ( = ?auto_319963 ?auto_319966 ) ) ( not ( = ?auto_319963 ?auto_319967 ) ) ( not ( = ?auto_319963 ?auto_319968 ) ) ( not ( = ?auto_319963 ?auto_319969 ) ) ( not ( = ?auto_319963 ?auto_319970 ) ) ( not ( = ?auto_319963 ?auto_319971 ) ) ( not ( = ?auto_319963 ?auto_319972 ) ) ( not ( = ?auto_319963 ?auto_319973 ) ) ( not ( = ?auto_319963 ?auto_319974 ) ) ( not ( = ?auto_319963 ?auto_319975 ) ) ( not ( = ?auto_319964 ?auto_319965 ) ) ( not ( = ?auto_319964 ?auto_319966 ) ) ( not ( = ?auto_319964 ?auto_319967 ) ) ( not ( = ?auto_319964 ?auto_319968 ) ) ( not ( = ?auto_319964 ?auto_319969 ) ) ( not ( = ?auto_319964 ?auto_319970 ) ) ( not ( = ?auto_319964 ?auto_319971 ) ) ( not ( = ?auto_319964 ?auto_319972 ) ) ( not ( = ?auto_319964 ?auto_319973 ) ) ( not ( = ?auto_319964 ?auto_319974 ) ) ( not ( = ?auto_319964 ?auto_319975 ) ) ( not ( = ?auto_319965 ?auto_319966 ) ) ( not ( = ?auto_319965 ?auto_319967 ) ) ( not ( = ?auto_319965 ?auto_319968 ) ) ( not ( = ?auto_319965 ?auto_319969 ) ) ( not ( = ?auto_319965 ?auto_319970 ) ) ( not ( = ?auto_319965 ?auto_319971 ) ) ( not ( = ?auto_319965 ?auto_319972 ) ) ( not ( = ?auto_319965 ?auto_319973 ) ) ( not ( = ?auto_319965 ?auto_319974 ) ) ( not ( = ?auto_319965 ?auto_319975 ) ) ( not ( = ?auto_319966 ?auto_319967 ) ) ( not ( = ?auto_319966 ?auto_319968 ) ) ( not ( = ?auto_319966 ?auto_319969 ) ) ( not ( = ?auto_319966 ?auto_319970 ) ) ( not ( = ?auto_319966 ?auto_319971 ) ) ( not ( = ?auto_319966 ?auto_319972 ) ) ( not ( = ?auto_319966 ?auto_319973 ) ) ( not ( = ?auto_319966 ?auto_319974 ) ) ( not ( = ?auto_319966 ?auto_319975 ) ) ( not ( = ?auto_319967 ?auto_319968 ) ) ( not ( = ?auto_319967 ?auto_319969 ) ) ( not ( = ?auto_319967 ?auto_319970 ) ) ( not ( = ?auto_319967 ?auto_319971 ) ) ( not ( = ?auto_319967 ?auto_319972 ) ) ( not ( = ?auto_319967 ?auto_319973 ) ) ( not ( = ?auto_319967 ?auto_319974 ) ) ( not ( = ?auto_319967 ?auto_319975 ) ) ( not ( = ?auto_319968 ?auto_319969 ) ) ( not ( = ?auto_319968 ?auto_319970 ) ) ( not ( = ?auto_319968 ?auto_319971 ) ) ( not ( = ?auto_319968 ?auto_319972 ) ) ( not ( = ?auto_319968 ?auto_319973 ) ) ( not ( = ?auto_319968 ?auto_319974 ) ) ( not ( = ?auto_319968 ?auto_319975 ) ) ( not ( = ?auto_319969 ?auto_319970 ) ) ( not ( = ?auto_319969 ?auto_319971 ) ) ( not ( = ?auto_319969 ?auto_319972 ) ) ( not ( = ?auto_319969 ?auto_319973 ) ) ( not ( = ?auto_319969 ?auto_319974 ) ) ( not ( = ?auto_319969 ?auto_319975 ) ) ( not ( = ?auto_319970 ?auto_319971 ) ) ( not ( = ?auto_319970 ?auto_319972 ) ) ( not ( = ?auto_319970 ?auto_319973 ) ) ( not ( = ?auto_319970 ?auto_319974 ) ) ( not ( = ?auto_319970 ?auto_319975 ) ) ( not ( = ?auto_319971 ?auto_319972 ) ) ( not ( = ?auto_319971 ?auto_319973 ) ) ( not ( = ?auto_319971 ?auto_319974 ) ) ( not ( = ?auto_319971 ?auto_319975 ) ) ( not ( = ?auto_319972 ?auto_319973 ) ) ( not ( = ?auto_319972 ?auto_319974 ) ) ( not ( = ?auto_319972 ?auto_319975 ) ) ( not ( = ?auto_319973 ?auto_319974 ) ) ( not ( = ?auto_319973 ?auto_319975 ) ) ( not ( = ?auto_319974 ?auto_319975 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_319974 ?auto_319975 )
      ( !STACK ?auto_319974 ?auto_319973 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_319988 - BLOCK
      ?auto_319989 - BLOCK
      ?auto_319990 - BLOCK
      ?auto_319991 - BLOCK
      ?auto_319992 - BLOCK
      ?auto_319993 - BLOCK
      ?auto_319994 - BLOCK
      ?auto_319995 - BLOCK
      ?auto_319996 - BLOCK
      ?auto_319997 - BLOCK
      ?auto_319998 - BLOCK
      ?auto_319999 - BLOCK
    )
    :vars
    (
      ?auto_320000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_319999 ?auto_320000 ) ( ON-TABLE ?auto_319988 ) ( ON ?auto_319989 ?auto_319988 ) ( ON ?auto_319990 ?auto_319989 ) ( ON ?auto_319991 ?auto_319990 ) ( ON ?auto_319992 ?auto_319991 ) ( ON ?auto_319993 ?auto_319992 ) ( ON ?auto_319994 ?auto_319993 ) ( ON ?auto_319995 ?auto_319994 ) ( ON ?auto_319996 ?auto_319995 ) ( ON ?auto_319997 ?auto_319996 ) ( not ( = ?auto_319988 ?auto_319989 ) ) ( not ( = ?auto_319988 ?auto_319990 ) ) ( not ( = ?auto_319988 ?auto_319991 ) ) ( not ( = ?auto_319988 ?auto_319992 ) ) ( not ( = ?auto_319988 ?auto_319993 ) ) ( not ( = ?auto_319988 ?auto_319994 ) ) ( not ( = ?auto_319988 ?auto_319995 ) ) ( not ( = ?auto_319988 ?auto_319996 ) ) ( not ( = ?auto_319988 ?auto_319997 ) ) ( not ( = ?auto_319988 ?auto_319998 ) ) ( not ( = ?auto_319988 ?auto_319999 ) ) ( not ( = ?auto_319988 ?auto_320000 ) ) ( not ( = ?auto_319989 ?auto_319990 ) ) ( not ( = ?auto_319989 ?auto_319991 ) ) ( not ( = ?auto_319989 ?auto_319992 ) ) ( not ( = ?auto_319989 ?auto_319993 ) ) ( not ( = ?auto_319989 ?auto_319994 ) ) ( not ( = ?auto_319989 ?auto_319995 ) ) ( not ( = ?auto_319989 ?auto_319996 ) ) ( not ( = ?auto_319989 ?auto_319997 ) ) ( not ( = ?auto_319989 ?auto_319998 ) ) ( not ( = ?auto_319989 ?auto_319999 ) ) ( not ( = ?auto_319989 ?auto_320000 ) ) ( not ( = ?auto_319990 ?auto_319991 ) ) ( not ( = ?auto_319990 ?auto_319992 ) ) ( not ( = ?auto_319990 ?auto_319993 ) ) ( not ( = ?auto_319990 ?auto_319994 ) ) ( not ( = ?auto_319990 ?auto_319995 ) ) ( not ( = ?auto_319990 ?auto_319996 ) ) ( not ( = ?auto_319990 ?auto_319997 ) ) ( not ( = ?auto_319990 ?auto_319998 ) ) ( not ( = ?auto_319990 ?auto_319999 ) ) ( not ( = ?auto_319990 ?auto_320000 ) ) ( not ( = ?auto_319991 ?auto_319992 ) ) ( not ( = ?auto_319991 ?auto_319993 ) ) ( not ( = ?auto_319991 ?auto_319994 ) ) ( not ( = ?auto_319991 ?auto_319995 ) ) ( not ( = ?auto_319991 ?auto_319996 ) ) ( not ( = ?auto_319991 ?auto_319997 ) ) ( not ( = ?auto_319991 ?auto_319998 ) ) ( not ( = ?auto_319991 ?auto_319999 ) ) ( not ( = ?auto_319991 ?auto_320000 ) ) ( not ( = ?auto_319992 ?auto_319993 ) ) ( not ( = ?auto_319992 ?auto_319994 ) ) ( not ( = ?auto_319992 ?auto_319995 ) ) ( not ( = ?auto_319992 ?auto_319996 ) ) ( not ( = ?auto_319992 ?auto_319997 ) ) ( not ( = ?auto_319992 ?auto_319998 ) ) ( not ( = ?auto_319992 ?auto_319999 ) ) ( not ( = ?auto_319992 ?auto_320000 ) ) ( not ( = ?auto_319993 ?auto_319994 ) ) ( not ( = ?auto_319993 ?auto_319995 ) ) ( not ( = ?auto_319993 ?auto_319996 ) ) ( not ( = ?auto_319993 ?auto_319997 ) ) ( not ( = ?auto_319993 ?auto_319998 ) ) ( not ( = ?auto_319993 ?auto_319999 ) ) ( not ( = ?auto_319993 ?auto_320000 ) ) ( not ( = ?auto_319994 ?auto_319995 ) ) ( not ( = ?auto_319994 ?auto_319996 ) ) ( not ( = ?auto_319994 ?auto_319997 ) ) ( not ( = ?auto_319994 ?auto_319998 ) ) ( not ( = ?auto_319994 ?auto_319999 ) ) ( not ( = ?auto_319994 ?auto_320000 ) ) ( not ( = ?auto_319995 ?auto_319996 ) ) ( not ( = ?auto_319995 ?auto_319997 ) ) ( not ( = ?auto_319995 ?auto_319998 ) ) ( not ( = ?auto_319995 ?auto_319999 ) ) ( not ( = ?auto_319995 ?auto_320000 ) ) ( not ( = ?auto_319996 ?auto_319997 ) ) ( not ( = ?auto_319996 ?auto_319998 ) ) ( not ( = ?auto_319996 ?auto_319999 ) ) ( not ( = ?auto_319996 ?auto_320000 ) ) ( not ( = ?auto_319997 ?auto_319998 ) ) ( not ( = ?auto_319997 ?auto_319999 ) ) ( not ( = ?auto_319997 ?auto_320000 ) ) ( not ( = ?auto_319998 ?auto_319999 ) ) ( not ( = ?auto_319998 ?auto_320000 ) ) ( not ( = ?auto_319999 ?auto_320000 ) ) ( CLEAR ?auto_319997 ) ( ON ?auto_319998 ?auto_319999 ) ( CLEAR ?auto_319998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_319988 ?auto_319989 ?auto_319990 ?auto_319991 ?auto_319992 ?auto_319993 ?auto_319994 ?auto_319995 ?auto_319996 ?auto_319997 ?auto_319998 )
      ( MAKE-12PILE ?auto_319988 ?auto_319989 ?auto_319990 ?auto_319991 ?auto_319992 ?auto_319993 ?auto_319994 ?auto_319995 ?auto_319996 ?auto_319997 ?auto_319998 ?auto_319999 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320013 - BLOCK
      ?auto_320014 - BLOCK
      ?auto_320015 - BLOCK
      ?auto_320016 - BLOCK
      ?auto_320017 - BLOCK
      ?auto_320018 - BLOCK
      ?auto_320019 - BLOCK
      ?auto_320020 - BLOCK
      ?auto_320021 - BLOCK
      ?auto_320022 - BLOCK
      ?auto_320023 - BLOCK
      ?auto_320024 - BLOCK
    )
    :vars
    (
      ?auto_320025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320024 ?auto_320025 ) ( ON-TABLE ?auto_320013 ) ( ON ?auto_320014 ?auto_320013 ) ( ON ?auto_320015 ?auto_320014 ) ( ON ?auto_320016 ?auto_320015 ) ( ON ?auto_320017 ?auto_320016 ) ( ON ?auto_320018 ?auto_320017 ) ( ON ?auto_320019 ?auto_320018 ) ( ON ?auto_320020 ?auto_320019 ) ( ON ?auto_320021 ?auto_320020 ) ( ON ?auto_320022 ?auto_320021 ) ( not ( = ?auto_320013 ?auto_320014 ) ) ( not ( = ?auto_320013 ?auto_320015 ) ) ( not ( = ?auto_320013 ?auto_320016 ) ) ( not ( = ?auto_320013 ?auto_320017 ) ) ( not ( = ?auto_320013 ?auto_320018 ) ) ( not ( = ?auto_320013 ?auto_320019 ) ) ( not ( = ?auto_320013 ?auto_320020 ) ) ( not ( = ?auto_320013 ?auto_320021 ) ) ( not ( = ?auto_320013 ?auto_320022 ) ) ( not ( = ?auto_320013 ?auto_320023 ) ) ( not ( = ?auto_320013 ?auto_320024 ) ) ( not ( = ?auto_320013 ?auto_320025 ) ) ( not ( = ?auto_320014 ?auto_320015 ) ) ( not ( = ?auto_320014 ?auto_320016 ) ) ( not ( = ?auto_320014 ?auto_320017 ) ) ( not ( = ?auto_320014 ?auto_320018 ) ) ( not ( = ?auto_320014 ?auto_320019 ) ) ( not ( = ?auto_320014 ?auto_320020 ) ) ( not ( = ?auto_320014 ?auto_320021 ) ) ( not ( = ?auto_320014 ?auto_320022 ) ) ( not ( = ?auto_320014 ?auto_320023 ) ) ( not ( = ?auto_320014 ?auto_320024 ) ) ( not ( = ?auto_320014 ?auto_320025 ) ) ( not ( = ?auto_320015 ?auto_320016 ) ) ( not ( = ?auto_320015 ?auto_320017 ) ) ( not ( = ?auto_320015 ?auto_320018 ) ) ( not ( = ?auto_320015 ?auto_320019 ) ) ( not ( = ?auto_320015 ?auto_320020 ) ) ( not ( = ?auto_320015 ?auto_320021 ) ) ( not ( = ?auto_320015 ?auto_320022 ) ) ( not ( = ?auto_320015 ?auto_320023 ) ) ( not ( = ?auto_320015 ?auto_320024 ) ) ( not ( = ?auto_320015 ?auto_320025 ) ) ( not ( = ?auto_320016 ?auto_320017 ) ) ( not ( = ?auto_320016 ?auto_320018 ) ) ( not ( = ?auto_320016 ?auto_320019 ) ) ( not ( = ?auto_320016 ?auto_320020 ) ) ( not ( = ?auto_320016 ?auto_320021 ) ) ( not ( = ?auto_320016 ?auto_320022 ) ) ( not ( = ?auto_320016 ?auto_320023 ) ) ( not ( = ?auto_320016 ?auto_320024 ) ) ( not ( = ?auto_320016 ?auto_320025 ) ) ( not ( = ?auto_320017 ?auto_320018 ) ) ( not ( = ?auto_320017 ?auto_320019 ) ) ( not ( = ?auto_320017 ?auto_320020 ) ) ( not ( = ?auto_320017 ?auto_320021 ) ) ( not ( = ?auto_320017 ?auto_320022 ) ) ( not ( = ?auto_320017 ?auto_320023 ) ) ( not ( = ?auto_320017 ?auto_320024 ) ) ( not ( = ?auto_320017 ?auto_320025 ) ) ( not ( = ?auto_320018 ?auto_320019 ) ) ( not ( = ?auto_320018 ?auto_320020 ) ) ( not ( = ?auto_320018 ?auto_320021 ) ) ( not ( = ?auto_320018 ?auto_320022 ) ) ( not ( = ?auto_320018 ?auto_320023 ) ) ( not ( = ?auto_320018 ?auto_320024 ) ) ( not ( = ?auto_320018 ?auto_320025 ) ) ( not ( = ?auto_320019 ?auto_320020 ) ) ( not ( = ?auto_320019 ?auto_320021 ) ) ( not ( = ?auto_320019 ?auto_320022 ) ) ( not ( = ?auto_320019 ?auto_320023 ) ) ( not ( = ?auto_320019 ?auto_320024 ) ) ( not ( = ?auto_320019 ?auto_320025 ) ) ( not ( = ?auto_320020 ?auto_320021 ) ) ( not ( = ?auto_320020 ?auto_320022 ) ) ( not ( = ?auto_320020 ?auto_320023 ) ) ( not ( = ?auto_320020 ?auto_320024 ) ) ( not ( = ?auto_320020 ?auto_320025 ) ) ( not ( = ?auto_320021 ?auto_320022 ) ) ( not ( = ?auto_320021 ?auto_320023 ) ) ( not ( = ?auto_320021 ?auto_320024 ) ) ( not ( = ?auto_320021 ?auto_320025 ) ) ( not ( = ?auto_320022 ?auto_320023 ) ) ( not ( = ?auto_320022 ?auto_320024 ) ) ( not ( = ?auto_320022 ?auto_320025 ) ) ( not ( = ?auto_320023 ?auto_320024 ) ) ( not ( = ?auto_320023 ?auto_320025 ) ) ( not ( = ?auto_320024 ?auto_320025 ) ) ( CLEAR ?auto_320022 ) ( ON ?auto_320023 ?auto_320024 ) ( CLEAR ?auto_320023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_320013 ?auto_320014 ?auto_320015 ?auto_320016 ?auto_320017 ?auto_320018 ?auto_320019 ?auto_320020 ?auto_320021 ?auto_320022 ?auto_320023 )
      ( MAKE-12PILE ?auto_320013 ?auto_320014 ?auto_320015 ?auto_320016 ?auto_320017 ?auto_320018 ?auto_320019 ?auto_320020 ?auto_320021 ?auto_320022 ?auto_320023 ?auto_320024 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320038 - BLOCK
      ?auto_320039 - BLOCK
      ?auto_320040 - BLOCK
      ?auto_320041 - BLOCK
      ?auto_320042 - BLOCK
      ?auto_320043 - BLOCK
      ?auto_320044 - BLOCK
      ?auto_320045 - BLOCK
      ?auto_320046 - BLOCK
      ?auto_320047 - BLOCK
      ?auto_320048 - BLOCK
      ?auto_320049 - BLOCK
    )
    :vars
    (
      ?auto_320050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320049 ?auto_320050 ) ( ON-TABLE ?auto_320038 ) ( ON ?auto_320039 ?auto_320038 ) ( ON ?auto_320040 ?auto_320039 ) ( ON ?auto_320041 ?auto_320040 ) ( ON ?auto_320042 ?auto_320041 ) ( ON ?auto_320043 ?auto_320042 ) ( ON ?auto_320044 ?auto_320043 ) ( ON ?auto_320045 ?auto_320044 ) ( ON ?auto_320046 ?auto_320045 ) ( not ( = ?auto_320038 ?auto_320039 ) ) ( not ( = ?auto_320038 ?auto_320040 ) ) ( not ( = ?auto_320038 ?auto_320041 ) ) ( not ( = ?auto_320038 ?auto_320042 ) ) ( not ( = ?auto_320038 ?auto_320043 ) ) ( not ( = ?auto_320038 ?auto_320044 ) ) ( not ( = ?auto_320038 ?auto_320045 ) ) ( not ( = ?auto_320038 ?auto_320046 ) ) ( not ( = ?auto_320038 ?auto_320047 ) ) ( not ( = ?auto_320038 ?auto_320048 ) ) ( not ( = ?auto_320038 ?auto_320049 ) ) ( not ( = ?auto_320038 ?auto_320050 ) ) ( not ( = ?auto_320039 ?auto_320040 ) ) ( not ( = ?auto_320039 ?auto_320041 ) ) ( not ( = ?auto_320039 ?auto_320042 ) ) ( not ( = ?auto_320039 ?auto_320043 ) ) ( not ( = ?auto_320039 ?auto_320044 ) ) ( not ( = ?auto_320039 ?auto_320045 ) ) ( not ( = ?auto_320039 ?auto_320046 ) ) ( not ( = ?auto_320039 ?auto_320047 ) ) ( not ( = ?auto_320039 ?auto_320048 ) ) ( not ( = ?auto_320039 ?auto_320049 ) ) ( not ( = ?auto_320039 ?auto_320050 ) ) ( not ( = ?auto_320040 ?auto_320041 ) ) ( not ( = ?auto_320040 ?auto_320042 ) ) ( not ( = ?auto_320040 ?auto_320043 ) ) ( not ( = ?auto_320040 ?auto_320044 ) ) ( not ( = ?auto_320040 ?auto_320045 ) ) ( not ( = ?auto_320040 ?auto_320046 ) ) ( not ( = ?auto_320040 ?auto_320047 ) ) ( not ( = ?auto_320040 ?auto_320048 ) ) ( not ( = ?auto_320040 ?auto_320049 ) ) ( not ( = ?auto_320040 ?auto_320050 ) ) ( not ( = ?auto_320041 ?auto_320042 ) ) ( not ( = ?auto_320041 ?auto_320043 ) ) ( not ( = ?auto_320041 ?auto_320044 ) ) ( not ( = ?auto_320041 ?auto_320045 ) ) ( not ( = ?auto_320041 ?auto_320046 ) ) ( not ( = ?auto_320041 ?auto_320047 ) ) ( not ( = ?auto_320041 ?auto_320048 ) ) ( not ( = ?auto_320041 ?auto_320049 ) ) ( not ( = ?auto_320041 ?auto_320050 ) ) ( not ( = ?auto_320042 ?auto_320043 ) ) ( not ( = ?auto_320042 ?auto_320044 ) ) ( not ( = ?auto_320042 ?auto_320045 ) ) ( not ( = ?auto_320042 ?auto_320046 ) ) ( not ( = ?auto_320042 ?auto_320047 ) ) ( not ( = ?auto_320042 ?auto_320048 ) ) ( not ( = ?auto_320042 ?auto_320049 ) ) ( not ( = ?auto_320042 ?auto_320050 ) ) ( not ( = ?auto_320043 ?auto_320044 ) ) ( not ( = ?auto_320043 ?auto_320045 ) ) ( not ( = ?auto_320043 ?auto_320046 ) ) ( not ( = ?auto_320043 ?auto_320047 ) ) ( not ( = ?auto_320043 ?auto_320048 ) ) ( not ( = ?auto_320043 ?auto_320049 ) ) ( not ( = ?auto_320043 ?auto_320050 ) ) ( not ( = ?auto_320044 ?auto_320045 ) ) ( not ( = ?auto_320044 ?auto_320046 ) ) ( not ( = ?auto_320044 ?auto_320047 ) ) ( not ( = ?auto_320044 ?auto_320048 ) ) ( not ( = ?auto_320044 ?auto_320049 ) ) ( not ( = ?auto_320044 ?auto_320050 ) ) ( not ( = ?auto_320045 ?auto_320046 ) ) ( not ( = ?auto_320045 ?auto_320047 ) ) ( not ( = ?auto_320045 ?auto_320048 ) ) ( not ( = ?auto_320045 ?auto_320049 ) ) ( not ( = ?auto_320045 ?auto_320050 ) ) ( not ( = ?auto_320046 ?auto_320047 ) ) ( not ( = ?auto_320046 ?auto_320048 ) ) ( not ( = ?auto_320046 ?auto_320049 ) ) ( not ( = ?auto_320046 ?auto_320050 ) ) ( not ( = ?auto_320047 ?auto_320048 ) ) ( not ( = ?auto_320047 ?auto_320049 ) ) ( not ( = ?auto_320047 ?auto_320050 ) ) ( not ( = ?auto_320048 ?auto_320049 ) ) ( not ( = ?auto_320048 ?auto_320050 ) ) ( not ( = ?auto_320049 ?auto_320050 ) ) ( ON ?auto_320048 ?auto_320049 ) ( CLEAR ?auto_320046 ) ( ON ?auto_320047 ?auto_320048 ) ( CLEAR ?auto_320047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_320038 ?auto_320039 ?auto_320040 ?auto_320041 ?auto_320042 ?auto_320043 ?auto_320044 ?auto_320045 ?auto_320046 ?auto_320047 )
      ( MAKE-12PILE ?auto_320038 ?auto_320039 ?auto_320040 ?auto_320041 ?auto_320042 ?auto_320043 ?auto_320044 ?auto_320045 ?auto_320046 ?auto_320047 ?auto_320048 ?auto_320049 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320063 - BLOCK
      ?auto_320064 - BLOCK
      ?auto_320065 - BLOCK
      ?auto_320066 - BLOCK
      ?auto_320067 - BLOCK
      ?auto_320068 - BLOCK
      ?auto_320069 - BLOCK
      ?auto_320070 - BLOCK
      ?auto_320071 - BLOCK
      ?auto_320072 - BLOCK
      ?auto_320073 - BLOCK
      ?auto_320074 - BLOCK
    )
    :vars
    (
      ?auto_320075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320074 ?auto_320075 ) ( ON-TABLE ?auto_320063 ) ( ON ?auto_320064 ?auto_320063 ) ( ON ?auto_320065 ?auto_320064 ) ( ON ?auto_320066 ?auto_320065 ) ( ON ?auto_320067 ?auto_320066 ) ( ON ?auto_320068 ?auto_320067 ) ( ON ?auto_320069 ?auto_320068 ) ( ON ?auto_320070 ?auto_320069 ) ( ON ?auto_320071 ?auto_320070 ) ( not ( = ?auto_320063 ?auto_320064 ) ) ( not ( = ?auto_320063 ?auto_320065 ) ) ( not ( = ?auto_320063 ?auto_320066 ) ) ( not ( = ?auto_320063 ?auto_320067 ) ) ( not ( = ?auto_320063 ?auto_320068 ) ) ( not ( = ?auto_320063 ?auto_320069 ) ) ( not ( = ?auto_320063 ?auto_320070 ) ) ( not ( = ?auto_320063 ?auto_320071 ) ) ( not ( = ?auto_320063 ?auto_320072 ) ) ( not ( = ?auto_320063 ?auto_320073 ) ) ( not ( = ?auto_320063 ?auto_320074 ) ) ( not ( = ?auto_320063 ?auto_320075 ) ) ( not ( = ?auto_320064 ?auto_320065 ) ) ( not ( = ?auto_320064 ?auto_320066 ) ) ( not ( = ?auto_320064 ?auto_320067 ) ) ( not ( = ?auto_320064 ?auto_320068 ) ) ( not ( = ?auto_320064 ?auto_320069 ) ) ( not ( = ?auto_320064 ?auto_320070 ) ) ( not ( = ?auto_320064 ?auto_320071 ) ) ( not ( = ?auto_320064 ?auto_320072 ) ) ( not ( = ?auto_320064 ?auto_320073 ) ) ( not ( = ?auto_320064 ?auto_320074 ) ) ( not ( = ?auto_320064 ?auto_320075 ) ) ( not ( = ?auto_320065 ?auto_320066 ) ) ( not ( = ?auto_320065 ?auto_320067 ) ) ( not ( = ?auto_320065 ?auto_320068 ) ) ( not ( = ?auto_320065 ?auto_320069 ) ) ( not ( = ?auto_320065 ?auto_320070 ) ) ( not ( = ?auto_320065 ?auto_320071 ) ) ( not ( = ?auto_320065 ?auto_320072 ) ) ( not ( = ?auto_320065 ?auto_320073 ) ) ( not ( = ?auto_320065 ?auto_320074 ) ) ( not ( = ?auto_320065 ?auto_320075 ) ) ( not ( = ?auto_320066 ?auto_320067 ) ) ( not ( = ?auto_320066 ?auto_320068 ) ) ( not ( = ?auto_320066 ?auto_320069 ) ) ( not ( = ?auto_320066 ?auto_320070 ) ) ( not ( = ?auto_320066 ?auto_320071 ) ) ( not ( = ?auto_320066 ?auto_320072 ) ) ( not ( = ?auto_320066 ?auto_320073 ) ) ( not ( = ?auto_320066 ?auto_320074 ) ) ( not ( = ?auto_320066 ?auto_320075 ) ) ( not ( = ?auto_320067 ?auto_320068 ) ) ( not ( = ?auto_320067 ?auto_320069 ) ) ( not ( = ?auto_320067 ?auto_320070 ) ) ( not ( = ?auto_320067 ?auto_320071 ) ) ( not ( = ?auto_320067 ?auto_320072 ) ) ( not ( = ?auto_320067 ?auto_320073 ) ) ( not ( = ?auto_320067 ?auto_320074 ) ) ( not ( = ?auto_320067 ?auto_320075 ) ) ( not ( = ?auto_320068 ?auto_320069 ) ) ( not ( = ?auto_320068 ?auto_320070 ) ) ( not ( = ?auto_320068 ?auto_320071 ) ) ( not ( = ?auto_320068 ?auto_320072 ) ) ( not ( = ?auto_320068 ?auto_320073 ) ) ( not ( = ?auto_320068 ?auto_320074 ) ) ( not ( = ?auto_320068 ?auto_320075 ) ) ( not ( = ?auto_320069 ?auto_320070 ) ) ( not ( = ?auto_320069 ?auto_320071 ) ) ( not ( = ?auto_320069 ?auto_320072 ) ) ( not ( = ?auto_320069 ?auto_320073 ) ) ( not ( = ?auto_320069 ?auto_320074 ) ) ( not ( = ?auto_320069 ?auto_320075 ) ) ( not ( = ?auto_320070 ?auto_320071 ) ) ( not ( = ?auto_320070 ?auto_320072 ) ) ( not ( = ?auto_320070 ?auto_320073 ) ) ( not ( = ?auto_320070 ?auto_320074 ) ) ( not ( = ?auto_320070 ?auto_320075 ) ) ( not ( = ?auto_320071 ?auto_320072 ) ) ( not ( = ?auto_320071 ?auto_320073 ) ) ( not ( = ?auto_320071 ?auto_320074 ) ) ( not ( = ?auto_320071 ?auto_320075 ) ) ( not ( = ?auto_320072 ?auto_320073 ) ) ( not ( = ?auto_320072 ?auto_320074 ) ) ( not ( = ?auto_320072 ?auto_320075 ) ) ( not ( = ?auto_320073 ?auto_320074 ) ) ( not ( = ?auto_320073 ?auto_320075 ) ) ( not ( = ?auto_320074 ?auto_320075 ) ) ( ON ?auto_320073 ?auto_320074 ) ( CLEAR ?auto_320071 ) ( ON ?auto_320072 ?auto_320073 ) ( CLEAR ?auto_320072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_320063 ?auto_320064 ?auto_320065 ?auto_320066 ?auto_320067 ?auto_320068 ?auto_320069 ?auto_320070 ?auto_320071 ?auto_320072 )
      ( MAKE-12PILE ?auto_320063 ?auto_320064 ?auto_320065 ?auto_320066 ?auto_320067 ?auto_320068 ?auto_320069 ?auto_320070 ?auto_320071 ?auto_320072 ?auto_320073 ?auto_320074 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320088 - BLOCK
      ?auto_320089 - BLOCK
      ?auto_320090 - BLOCK
      ?auto_320091 - BLOCK
      ?auto_320092 - BLOCK
      ?auto_320093 - BLOCK
      ?auto_320094 - BLOCK
      ?auto_320095 - BLOCK
      ?auto_320096 - BLOCK
      ?auto_320097 - BLOCK
      ?auto_320098 - BLOCK
      ?auto_320099 - BLOCK
    )
    :vars
    (
      ?auto_320100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320099 ?auto_320100 ) ( ON-TABLE ?auto_320088 ) ( ON ?auto_320089 ?auto_320088 ) ( ON ?auto_320090 ?auto_320089 ) ( ON ?auto_320091 ?auto_320090 ) ( ON ?auto_320092 ?auto_320091 ) ( ON ?auto_320093 ?auto_320092 ) ( ON ?auto_320094 ?auto_320093 ) ( ON ?auto_320095 ?auto_320094 ) ( not ( = ?auto_320088 ?auto_320089 ) ) ( not ( = ?auto_320088 ?auto_320090 ) ) ( not ( = ?auto_320088 ?auto_320091 ) ) ( not ( = ?auto_320088 ?auto_320092 ) ) ( not ( = ?auto_320088 ?auto_320093 ) ) ( not ( = ?auto_320088 ?auto_320094 ) ) ( not ( = ?auto_320088 ?auto_320095 ) ) ( not ( = ?auto_320088 ?auto_320096 ) ) ( not ( = ?auto_320088 ?auto_320097 ) ) ( not ( = ?auto_320088 ?auto_320098 ) ) ( not ( = ?auto_320088 ?auto_320099 ) ) ( not ( = ?auto_320088 ?auto_320100 ) ) ( not ( = ?auto_320089 ?auto_320090 ) ) ( not ( = ?auto_320089 ?auto_320091 ) ) ( not ( = ?auto_320089 ?auto_320092 ) ) ( not ( = ?auto_320089 ?auto_320093 ) ) ( not ( = ?auto_320089 ?auto_320094 ) ) ( not ( = ?auto_320089 ?auto_320095 ) ) ( not ( = ?auto_320089 ?auto_320096 ) ) ( not ( = ?auto_320089 ?auto_320097 ) ) ( not ( = ?auto_320089 ?auto_320098 ) ) ( not ( = ?auto_320089 ?auto_320099 ) ) ( not ( = ?auto_320089 ?auto_320100 ) ) ( not ( = ?auto_320090 ?auto_320091 ) ) ( not ( = ?auto_320090 ?auto_320092 ) ) ( not ( = ?auto_320090 ?auto_320093 ) ) ( not ( = ?auto_320090 ?auto_320094 ) ) ( not ( = ?auto_320090 ?auto_320095 ) ) ( not ( = ?auto_320090 ?auto_320096 ) ) ( not ( = ?auto_320090 ?auto_320097 ) ) ( not ( = ?auto_320090 ?auto_320098 ) ) ( not ( = ?auto_320090 ?auto_320099 ) ) ( not ( = ?auto_320090 ?auto_320100 ) ) ( not ( = ?auto_320091 ?auto_320092 ) ) ( not ( = ?auto_320091 ?auto_320093 ) ) ( not ( = ?auto_320091 ?auto_320094 ) ) ( not ( = ?auto_320091 ?auto_320095 ) ) ( not ( = ?auto_320091 ?auto_320096 ) ) ( not ( = ?auto_320091 ?auto_320097 ) ) ( not ( = ?auto_320091 ?auto_320098 ) ) ( not ( = ?auto_320091 ?auto_320099 ) ) ( not ( = ?auto_320091 ?auto_320100 ) ) ( not ( = ?auto_320092 ?auto_320093 ) ) ( not ( = ?auto_320092 ?auto_320094 ) ) ( not ( = ?auto_320092 ?auto_320095 ) ) ( not ( = ?auto_320092 ?auto_320096 ) ) ( not ( = ?auto_320092 ?auto_320097 ) ) ( not ( = ?auto_320092 ?auto_320098 ) ) ( not ( = ?auto_320092 ?auto_320099 ) ) ( not ( = ?auto_320092 ?auto_320100 ) ) ( not ( = ?auto_320093 ?auto_320094 ) ) ( not ( = ?auto_320093 ?auto_320095 ) ) ( not ( = ?auto_320093 ?auto_320096 ) ) ( not ( = ?auto_320093 ?auto_320097 ) ) ( not ( = ?auto_320093 ?auto_320098 ) ) ( not ( = ?auto_320093 ?auto_320099 ) ) ( not ( = ?auto_320093 ?auto_320100 ) ) ( not ( = ?auto_320094 ?auto_320095 ) ) ( not ( = ?auto_320094 ?auto_320096 ) ) ( not ( = ?auto_320094 ?auto_320097 ) ) ( not ( = ?auto_320094 ?auto_320098 ) ) ( not ( = ?auto_320094 ?auto_320099 ) ) ( not ( = ?auto_320094 ?auto_320100 ) ) ( not ( = ?auto_320095 ?auto_320096 ) ) ( not ( = ?auto_320095 ?auto_320097 ) ) ( not ( = ?auto_320095 ?auto_320098 ) ) ( not ( = ?auto_320095 ?auto_320099 ) ) ( not ( = ?auto_320095 ?auto_320100 ) ) ( not ( = ?auto_320096 ?auto_320097 ) ) ( not ( = ?auto_320096 ?auto_320098 ) ) ( not ( = ?auto_320096 ?auto_320099 ) ) ( not ( = ?auto_320096 ?auto_320100 ) ) ( not ( = ?auto_320097 ?auto_320098 ) ) ( not ( = ?auto_320097 ?auto_320099 ) ) ( not ( = ?auto_320097 ?auto_320100 ) ) ( not ( = ?auto_320098 ?auto_320099 ) ) ( not ( = ?auto_320098 ?auto_320100 ) ) ( not ( = ?auto_320099 ?auto_320100 ) ) ( ON ?auto_320098 ?auto_320099 ) ( ON ?auto_320097 ?auto_320098 ) ( CLEAR ?auto_320095 ) ( ON ?auto_320096 ?auto_320097 ) ( CLEAR ?auto_320096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_320088 ?auto_320089 ?auto_320090 ?auto_320091 ?auto_320092 ?auto_320093 ?auto_320094 ?auto_320095 ?auto_320096 )
      ( MAKE-12PILE ?auto_320088 ?auto_320089 ?auto_320090 ?auto_320091 ?auto_320092 ?auto_320093 ?auto_320094 ?auto_320095 ?auto_320096 ?auto_320097 ?auto_320098 ?auto_320099 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320113 - BLOCK
      ?auto_320114 - BLOCK
      ?auto_320115 - BLOCK
      ?auto_320116 - BLOCK
      ?auto_320117 - BLOCK
      ?auto_320118 - BLOCK
      ?auto_320119 - BLOCK
      ?auto_320120 - BLOCK
      ?auto_320121 - BLOCK
      ?auto_320122 - BLOCK
      ?auto_320123 - BLOCK
      ?auto_320124 - BLOCK
    )
    :vars
    (
      ?auto_320125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320124 ?auto_320125 ) ( ON-TABLE ?auto_320113 ) ( ON ?auto_320114 ?auto_320113 ) ( ON ?auto_320115 ?auto_320114 ) ( ON ?auto_320116 ?auto_320115 ) ( ON ?auto_320117 ?auto_320116 ) ( ON ?auto_320118 ?auto_320117 ) ( ON ?auto_320119 ?auto_320118 ) ( ON ?auto_320120 ?auto_320119 ) ( not ( = ?auto_320113 ?auto_320114 ) ) ( not ( = ?auto_320113 ?auto_320115 ) ) ( not ( = ?auto_320113 ?auto_320116 ) ) ( not ( = ?auto_320113 ?auto_320117 ) ) ( not ( = ?auto_320113 ?auto_320118 ) ) ( not ( = ?auto_320113 ?auto_320119 ) ) ( not ( = ?auto_320113 ?auto_320120 ) ) ( not ( = ?auto_320113 ?auto_320121 ) ) ( not ( = ?auto_320113 ?auto_320122 ) ) ( not ( = ?auto_320113 ?auto_320123 ) ) ( not ( = ?auto_320113 ?auto_320124 ) ) ( not ( = ?auto_320113 ?auto_320125 ) ) ( not ( = ?auto_320114 ?auto_320115 ) ) ( not ( = ?auto_320114 ?auto_320116 ) ) ( not ( = ?auto_320114 ?auto_320117 ) ) ( not ( = ?auto_320114 ?auto_320118 ) ) ( not ( = ?auto_320114 ?auto_320119 ) ) ( not ( = ?auto_320114 ?auto_320120 ) ) ( not ( = ?auto_320114 ?auto_320121 ) ) ( not ( = ?auto_320114 ?auto_320122 ) ) ( not ( = ?auto_320114 ?auto_320123 ) ) ( not ( = ?auto_320114 ?auto_320124 ) ) ( not ( = ?auto_320114 ?auto_320125 ) ) ( not ( = ?auto_320115 ?auto_320116 ) ) ( not ( = ?auto_320115 ?auto_320117 ) ) ( not ( = ?auto_320115 ?auto_320118 ) ) ( not ( = ?auto_320115 ?auto_320119 ) ) ( not ( = ?auto_320115 ?auto_320120 ) ) ( not ( = ?auto_320115 ?auto_320121 ) ) ( not ( = ?auto_320115 ?auto_320122 ) ) ( not ( = ?auto_320115 ?auto_320123 ) ) ( not ( = ?auto_320115 ?auto_320124 ) ) ( not ( = ?auto_320115 ?auto_320125 ) ) ( not ( = ?auto_320116 ?auto_320117 ) ) ( not ( = ?auto_320116 ?auto_320118 ) ) ( not ( = ?auto_320116 ?auto_320119 ) ) ( not ( = ?auto_320116 ?auto_320120 ) ) ( not ( = ?auto_320116 ?auto_320121 ) ) ( not ( = ?auto_320116 ?auto_320122 ) ) ( not ( = ?auto_320116 ?auto_320123 ) ) ( not ( = ?auto_320116 ?auto_320124 ) ) ( not ( = ?auto_320116 ?auto_320125 ) ) ( not ( = ?auto_320117 ?auto_320118 ) ) ( not ( = ?auto_320117 ?auto_320119 ) ) ( not ( = ?auto_320117 ?auto_320120 ) ) ( not ( = ?auto_320117 ?auto_320121 ) ) ( not ( = ?auto_320117 ?auto_320122 ) ) ( not ( = ?auto_320117 ?auto_320123 ) ) ( not ( = ?auto_320117 ?auto_320124 ) ) ( not ( = ?auto_320117 ?auto_320125 ) ) ( not ( = ?auto_320118 ?auto_320119 ) ) ( not ( = ?auto_320118 ?auto_320120 ) ) ( not ( = ?auto_320118 ?auto_320121 ) ) ( not ( = ?auto_320118 ?auto_320122 ) ) ( not ( = ?auto_320118 ?auto_320123 ) ) ( not ( = ?auto_320118 ?auto_320124 ) ) ( not ( = ?auto_320118 ?auto_320125 ) ) ( not ( = ?auto_320119 ?auto_320120 ) ) ( not ( = ?auto_320119 ?auto_320121 ) ) ( not ( = ?auto_320119 ?auto_320122 ) ) ( not ( = ?auto_320119 ?auto_320123 ) ) ( not ( = ?auto_320119 ?auto_320124 ) ) ( not ( = ?auto_320119 ?auto_320125 ) ) ( not ( = ?auto_320120 ?auto_320121 ) ) ( not ( = ?auto_320120 ?auto_320122 ) ) ( not ( = ?auto_320120 ?auto_320123 ) ) ( not ( = ?auto_320120 ?auto_320124 ) ) ( not ( = ?auto_320120 ?auto_320125 ) ) ( not ( = ?auto_320121 ?auto_320122 ) ) ( not ( = ?auto_320121 ?auto_320123 ) ) ( not ( = ?auto_320121 ?auto_320124 ) ) ( not ( = ?auto_320121 ?auto_320125 ) ) ( not ( = ?auto_320122 ?auto_320123 ) ) ( not ( = ?auto_320122 ?auto_320124 ) ) ( not ( = ?auto_320122 ?auto_320125 ) ) ( not ( = ?auto_320123 ?auto_320124 ) ) ( not ( = ?auto_320123 ?auto_320125 ) ) ( not ( = ?auto_320124 ?auto_320125 ) ) ( ON ?auto_320123 ?auto_320124 ) ( ON ?auto_320122 ?auto_320123 ) ( CLEAR ?auto_320120 ) ( ON ?auto_320121 ?auto_320122 ) ( CLEAR ?auto_320121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_320113 ?auto_320114 ?auto_320115 ?auto_320116 ?auto_320117 ?auto_320118 ?auto_320119 ?auto_320120 ?auto_320121 )
      ( MAKE-12PILE ?auto_320113 ?auto_320114 ?auto_320115 ?auto_320116 ?auto_320117 ?auto_320118 ?auto_320119 ?auto_320120 ?auto_320121 ?auto_320122 ?auto_320123 ?auto_320124 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320138 - BLOCK
      ?auto_320139 - BLOCK
      ?auto_320140 - BLOCK
      ?auto_320141 - BLOCK
      ?auto_320142 - BLOCK
      ?auto_320143 - BLOCK
      ?auto_320144 - BLOCK
      ?auto_320145 - BLOCK
      ?auto_320146 - BLOCK
      ?auto_320147 - BLOCK
      ?auto_320148 - BLOCK
      ?auto_320149 - BLOCK
    )
    :vars
    (
      ?auto_320150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320149 ?auto_320150 ) ( ON-TABLE ?auto_320138 ) ( ON ?auto_320139 ?auto_320138 ) ( ON ?auto_320140 ?auto_320139 ) ( ON ?auto_320141 ?auto_320140 ) ( ON ?auto_320142 ?auto_320141 ) ( ON ?auto_320143 ?auto_320142 ) ( ON ?auto_320144 ?auto_320143 ) ( not ( = ?auto_320138 ?auto_320139 ) ) ( not ( = ?auto_320138 ?auto_320140 ) ) ( not ( = ?auto_320138 ?auto_320141 ) ) ( not ( = ?auto_320138 ?auto_320142 ) ) ( not ( = ?auto_320138 ?auto_320143 ) ) ( not ( = ?auto_320138 ?auto_320144 ) ) ( not ( = ?auto_320138 ?auto_320145 ) ) ( not ( = ?auto_320138 ?auto_320146 ) ) ( not ( = ?auto_320138 ?auto_320147 ) ) ( not ( = ?auto_320138 ?auto_320148 ) ) ( not ( = ?auto_320138 ?auto_320149 ) ) ( not ( = ?auto_320138 ?auto_320150 ) ) ( not ( = ?auto_320139 ?auto_320140 ) ) ( not ( = ?auto_320139 ?auto_320141 ) ) ( not ( = ?auto_320139 ?auto_320142 ) ) ( not ( = ?auto_320139 ?auto_320143 ) ) ( not ( = ?auto_320139 ?auto_320144 ) ) ( not ( = ?auto_320139 ?auto_320145 ) ) ( not ( = ?auto_320139 ?auto_320146 ) ) ( not ( = ?auto_320139 ?auto_320147 ) ) ( not ( = ?auto_320139 ?auto_320148 ) ) ( not ( = ?auto_320139 ?auto_320149 ) ) ( not ( = ?auto_320139 ?auto_320150 ) ) ( not ( = ?auto_320140 ?auto_320141 ) ) ( not ( = ?auto_320140 ?auto_320142 ) ) ( not ( = ?auto_320140 ?auto_320143 ) ) ( not ( = ?auto_320140 ?auto_320144 ) ) ( not ( = ?auto_320140 ?auto_320145 ) ) ( not ( = ?auto_320140 ?auto_320146 ) ) ( not ( = ?auto_320140 ?auto_320147 ) ) ( not ( = ?auto_320140 ?auto_320148 ) ) ( not ( = ?auto_320140 ?auto_320149 ) ) ( not ( = ?auto_320140 ?auto_320150 ) ) ( not ( = ?auto_320141 ?auto_320142 ) ) ( not ( = ?auto_320141 ?auto_320143 ) ) ( not ( = ?auto_320141 ?auto_320144 ) ) ( not ( = ?auto_320141 ?auto_320145 ) ) ( not ( = ?auto_320141 ?auto_320146 ) ) ( not ( = ?auto_320141 ?auto_320147 ) ) ( not ( = ?auto_320141 ?auto_320148 ) ) ( not ( = ?auto_320141 ?auto_320149 ) ) ( not ( = ?auto_320141 ?auto_320150 ) ) ( not ( = ?auto_320142 ?auto_320143 ) ) ( not ( = ?auto_320142 ?auto_320144 ) ) ( not ( = ?auto_320142 ?auto_320145 ) ) ( not ( = ?auto_320142 ?auto_320146 ) ) ( not ( = ?auto_320142 ?auto_320147 ) ) ( not ( = ?auto_320142 ?auto_320148 ) ) ( not ( = ?auto_320142 ?auto_320149 ) ) ( not ( = ?auto_320142 ?auto_320150 ) ) ( not ( = ?auto_320143 ?auto_320144 ) ) ( not ( = ?auto_320143 ?auto_320145 ) ) ( not ( = ?auto_320143 ?auto_320146 ) ) ( not ( = ?auto_320143 ?auto_320147 ) ) ( not ( = ?auto_320143 ?auto_320148 ) ) ( not ( = ?auto_320143 ?auto_320149 ) ) ( not ( = ?auto_320143 ?auto_320150 ) ) ( not ( = ?auto_320144 ?auto_320145 ) ) ( not ( = ?auto_320144 ?auto_320146 ) ) ( not ( = ?auto_320144 ?auto_320147 ) ) ( not ( = ?auto_320144 ?auto_320148 ) ) ( not ( = ?auto_320144 ?auto_320149 ) ) ( not ( = ?auto_320144 ?auto_320150 ) ) ( not ( = ?auto_320145 ?auto_320146 ) ) ( not ( = ?auto_320145 ?auto_320147 ) ) ( not ( = ?auto_320145 ?auto_320148 ) ) ( not ( = ?auto_320145 ?auto_320149 ) ) ( not ( = ?auto_320145 ?auto_320150 ) ) ( not ( = ?auto_320146 ?auto_320147 ) ) ( not ( = ?auto_320146 ?auto_320148 ) ) ( not ( = ?auto_320146 ?auto_320149 ) ) ( not ( = ?auto_320146 ?auto_320150 ) ) ( not ( = ?auto_320147 ?auto_320148 ) ) ( not ( = ?auto_320147 ?auto_320149 ) ) ( not ( = ?auto_320147 ?auto_320150 ) ) ( not ( = ?auto_320148 ?auto_320149 ) ) ( not ( = ?auto_320148 ?auto_320150 ) ) ( not ( = ?auto_320149 ?auto_320150 ) ) ( ON ?auto_320148 ?auto_320149 ) ( ON ?auto_320147 ?auto_320148 ) ( ON ?auto_320146 ?auto_320147 ) ( CLEAR ?auto_320144 ) ( ON ?auto_320145 ?auto_320146 ) ( CLEAR ?auto_320145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_320138 ?auto_320139 ?auto_320140 ?auto_320141 ?auto_320142 ?auto_320143 ?auto_320144 ?auto_320145 )
      ( MAKE-12PILE ?auto_320138 ?auto_320139 ?auto_320140 ?auto_320141 ?auto_320142 ?auto_320143 ?auto_320144 ?auto_320145 ?auto_320146 ?auto_320147 ?auto_320148 ?auto_320149 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320163 - BLOCK
      ?auto_320164 - BLOCK
      ?auto_320165 - BLOCK
      ?auto_320166 - BLOCK
      ?auto_320167 - BLOCK
      ?auto_320168 - BLOCK
      ?auto_320169 - BLOCK
      ?auto_320170 - BLOCK
      ?auto_320171 - BLOCK
      ?auto_320172 - BLOCK
      ?auto_320173 - BLOCK
      ?auto_320174 - BLOCK
    )
    :vars
    (
      ?auto_320175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320174 ?auto_320175 ) ( ON-TABLE ?auto_320163 ) ( ON ?auto_320164 ?auto_320163 ) ( ON ?auto_320165 ?auto_320164 ) ( ON ?auto_320166 ?auto_320165 ) ( ON ?auto_320167 ?auto_320166 ) ( ON ?auto_320168 ?auto_320167 ) ( ON ?auto_320169 ?auto_320168 ) ( not ( = ?auto_320163 ?auto_320164 ) ) ( not ( = ?auto_320163 ?auto_320165 ) ) ( not ( = ?auto_320163 ?auto_320166 ) ) ( not ( = ?auto_320163 ?auto_320167 ) ) ( not ( = ?auto_320163 ?auto_320168 ) ) ( not ( = ?auto_320163 ?auto_320169 ) ) ( not ( = ?auto_320163 ?auto_320170 ) ) ( not ( = ?auto_320163 ?auto_320171 ) ) ( not ( = ?auto_320163 ?auto_320172 ) ) ( not ( = ?auto_320163 ?auto_320173 ) ) ( not ( = ?auto_320163 ?auto_320174 ) ) ( not ( = ?auto_320163 ?auto_320175 ) ) ( not ( = ?auto_320164 ?auto_320165 ) ) ( not ( = ?auto_320164 ?auto_320166 ) ) ( not ( = ?auto_320164 ?auto_320167 ) ) ( not ( = ?auto_320164 ?auto_320168 ) ) ( not ( = ?auto_320164 ?auto_320169 ) ) ( not ( = ?auto_320164 ?auto_320170 ) ) ( not ( = ?auto_320164 ?auto_320171 ) ) ( not ( = ?auto_320164 ?auto_320172 ) ) ( not ( = ?auto_320164 ?auto_320173 ) ) ( not ( = ?auto_320164 ?auto_320174 ) ) ( not ( = ?auto_320164 ?auto_320175 ) ) ( not ( = ?auto_320165 ?auto_320166 ) ) ( not ( = ?auto_320165 ?auto_320167 ) ) ( not ( = ?auto_320165 ?auto_320168 ) ) ( not ( = ?auto_320165 ?auto_320169 ) ) ( not ( = ?auto_320165 ?auto_320170 ) ) ( not ( = ?auto_320165 ?auto_320171 ) ) ( not ( = ?auto_320165 ?auto_320172 ) ) ( not ( = ?auto_320165 ?auto_320173 ) ) ( not ( = ?auto_320165 ?auto_320174 ) ) ( not ( = ?auto_320165 ?auto_320175 ) ) ( not ( = ?auto_320166 ?auto_320167 ) ) ( not ( = ?auto_320166 ?auto_320168 ) ) ( not ( = ?auto_320166 ?auto_320169 ) ) ( not ( = ?auto_320166 ?auto_320170 ) ) ( not ( = ?auto_320166 ?auto_320171 ) ) ( not ( = ?auto_320166 ?auto_320172 ) ) ( not ( = ?auto_320166 ?auto_320173 ) ) ( not ( = ?auto_320166 ?auto_320174 ) ) ( not ( = ?auto_320166 ?auto_320175 ) ) ( not ( = ?auto_320167 ?auto_320168 ) ) ( not ( = ?auto_320167 ?auto_320169 ) ) ( not ( = ?auto_320167 ?auto_320170 ) ) ( not ( = ?auto_320167 ?auto_320171 ) ) ( not ( = ?auto_320167 ?auto_320172 ) ) ( not ( = ?auto_320167 ?auto_320173 ) ) ( not ( = ?auto_320167 ?auto_320174 ) ) ( not ( = ?auto_320167 ?auto_320175 ) ) ( not ( = ?auto_320168 ?auto_320169 ) ) ( not ( = ?auto_320168 ?auto_320170 ) ) ( not ( = ?auto_320168 ?auto_320171 ) ) ( not ( = ?auto_320168 ?auto_320172 ) ) ( not ( = ?auto_320168 ?auto_320173 ) ) ( not ( = ?auto_320168 ?auto_320174 ) ) ( not ( = ?auto_320168 ?auto_320175 ) ) ( not ( = ?auto_320169 ?auto_320170 ) ) ( not ( = ?auto_320169 ?auto_320171 ) ) ( not ( = ?auto_320169 ?auto_320172 ) ) ( not ( = ?auto_320169 ?auto_320173 ) ) ( not ( = ?auto_320169 ?auto_320174 ) ) ( not ( = ?auto_320169 ?auto_320175 ) ) ( not ( = ?auto_320170 ?auto_320171 ) ) ( not ( = ?auto_320170 ?auto_320172 ) ) ( not ( = ?auto_320170 ?auto_320173 ) ) ( not ( = ?auto_320170 ?auto_320174 ) ) ( not ( = ?auto_320170 ?auto_320175 ) ) ( not ( = ?auto_320171 ?auto_320172 ) ) ( not ( = ?auto_320171 ?auto_320173 ) ) ( not ( = ?auto_320171 ?auto_320174 ) ) ( not ( = ?auto_320171 ?auto_320175 ) ) ( not ( = ?auto_320172 ?auto_320173 ) ) ( not ( = ?auto_320172 ?auto_320174 ) ) ( not ( = ?auto_320172 ?auto_320175 ) ) ( not ( = ?auto_320173 ?auto_320174 ) ) ( not ( = ?auto_320173 ?auto_320175 ) ) ( not ( = ?auto_320174 ?auto_320175 ) ) ( ON ?auto_320173 ?auto_320174 ) ( ON ?auto_320172 ?auto_320173 ) ( ON ?auto_320171 ?auto_320172 ) ( CLEAR ?auto_320169 ) ( ON ?auto_320170 ?auto_320171 ) ( CLEAR ?auto_320170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_320163 ?auto_320164 ?auto_320165 ?auto_320166 ?auto_320167 ?auto_320168 ?auto_320169 ?auto_320170 )
      ( MAKE-12PILE ?auto_320163 ?auto_320164 ?auto_320165 ?auto_320166 ?auto_320167 ?auto_320168 ?auto_320169 ?auto_320170 ?auto_320171 ?auto_320172 ?auto_320173 ?auto_320174 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320188 - BLOCK
      ?auto_320189 - BLOCK
      ?auto_320190 - BLOCK
      ?auto_320191 - BLOCK
      ?auto_320192 - BLOCK
      ?auto_320193 - BLOCK
      ?auto_320194 - BLOCK
      ?auto_320195 - BLOCK
      ?auto_320196 - BLOCK
      ?auto_320197 - BLOCK
      ?auto_320198 - BLOCK
      ?auto_320199 - BLOCK
    )
    :vars
    (
      ?auto_320200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320199 ?auto_320200 ) ( ON-TABLE ?auto_320188 ) ( ON ?auto_320189 ?auto_320188 ) ( ON ?auto_320190 ?auto_320189 ) ( ON ?auto_320191 ?auto_320190 ) ( ON ?auto_320192 ?auto_320191 ) ( ON ?auto_320193 ?auto_320192 ) ( not ( = ?auto_320188 ?auto_320189 ) ) ( not ( = ?auto_320188 ?auto_320190 ) ) ( not ( = ?auto_320188 ?auto_320191 ) ) ( not ( = ?auto_320188 ?auto_320192 ) ) ( not ( = ?auto_320188 ?auto_320193 ) ) ( not ( = ?auto_320188 ?auto_320194 ) ) ( not ( = ?auto_320188 ?auto_320195 ) ) ( not ( = ?auto_320188 ?auto_320196 ) ) ( not ( = ?auto_320188 ?auto_320197 ) ) ( not ( = ?auto_320188 ?auto_320198 ) ) ( not ( = ?auto_320188 ?auto_320199 ) ) ( not ( = ?auto_320188 ?auto_320200 ) ) ( not ( = ?auto_320189 ?auto_320190 ) ) ( not ( = ?auto_320189 ?auto_320191 ) ) ( not ( = ?auto_320189 ?auto_320192 ) ) ( not ( = ?auto_320189 ?auto_320193 ) ) ( not ( = ?auto_320189 ?auto_320194 ) ) ( not ( = ?auto_320189 ?auto_320195 ) ) ( not ( = ?auto_320189 ?auto_320196 ) ) ( not ( = ?auto_320189 ?auto_320197 ) ) ( not ( = ?auto_320189 ?auto_320198 ) ) ( not ( = ?auto_320189 ?auto_320199 ) ) ( not ( = ?auto_320189 ?auto_320200 ) ) ( not ( = ?auto_320190 ?auto_320191 ) ) ( not ( = ?auto_320190 ?auto_320192 ) ) ( not ( = ?auto_320190 ?auto_320193 ) ) ( not ( = ?auto_320190 ?auto_320194 ) ) ( not ( = ?auto_320190 ?auto_320195 ) ) ( not ( = ?auto_320190 ?auto_320196 ) ) ( not ( = ?auto_320190 ?auto_320197 ) ) ( not ( = ?auto_320190 ?auto_320198 ) ) ( not ( = ?auto_320190 ?auto_320199 ) ) ( not ( = ?auto_320190 ?auto_320200 ) ) ( not ( = ?auto_320191 ?auto_320192 ) ) ( not ( = ?auto_320191 ?auto_320193 ) ) ( not ( = ?auto_320191 ?auto_320194 ) ) ( not ( = ?auto_320191 ?auto_320195 ) ) ( not ( = ?auto_320191 ?auto_320196 ) ) ( not ( = ?auto_320191 ?auto_320197 ) ) ( not ( = ?auto_320191 ?auto_320198 ) ) ( not ( = ?auto_320191 ?auto_320199 ) ) ( not ( = ?auto_320191 ?auto_320200 ) ) ( not ( = ?auto_320192 ?auto_320193 ) ) ( not ( = ?auto_320192 ?auto_320194 ) ) ( not ( = ?auto_320192 ?auto_320195 ) ) ( not ( = ?auto_320192 ?auto_320196 ) ) ( not ( = ?auto_320192 ?auto_320197 ) ) ( not ( = ?auto_320192 ?auto_320198 ) ) ( not ( = ?auto_320192 ?auto_320199 ) ) ( not ( = ?auto_320192 ?auto_320200 ) ) ( not ( = ?auto_320193 ?auto_320194 ) ) ( not ( = ?auto_320193 ?auto_320195 ) ) ( not ( = ?auto_320193 ?auto_320196 ) ) ( not ( = ?auto_320193 ?auto_320197 ) ) ( not ( = ?auto_320193 ?auto_320198 ) ) ( not ( = ?auto_320193 ?auto_320199 ) ) ( not ( = ?auto_320193 ?auto_320200 ) ) ( not ( = ?auto_320194 ?auto_320195 ) ) ( not ( = ?auto_320194 ?auto_320196 ) ) ( not ( = ?auto_320194 ?auto_320197 ) ) ( not ( = ?auto_320194 ?auto_320198 ) ) ( not ( = ?auto_320194 ?auto_320199 ) ) ( not ( = ?auto_320194 ?auto_320200 ) ) ( not ( = ?auto_320195 ?auto_320196 ) ) ( not ( = ?auto_320195 ?auto_320197 ) ) ( not ( = ?auto_320195 ?auto_320198 ) ) ( not ( = ?auto_320195 ?auto_320199 ) ) ( not ( = ?auto_320195 ?auto_320200 ) ) ( not ( = ?auto_320196 ?auto_320197 ) ) ( not ( = ?auto_320196 ?auto_320198 ) ) ( not ( = ?auto_320196 ?auto_320199 ) ) ( not ( = ?auto_320196 ?auto_320200 ) ) ( not ( = ?auto_320197 ?auto_320198 ) ) ( not ( = ?auto_320197 ?auto_320199 ) ) ( not ( = ?auto_320197 ?auto_320200 ) ) ( not ( = ?auto_320198 ?auto_320199 ) ) ( not ( = ?auto_320198 ?auto_320200 ) ) ( not ( = ?auto_320199 ?auto_320200 ) ) ( ON ?auto_320198 ?auto_320199 ) ( ON ?auto_320197 ?auto_320198 ) ( ON ?auto_320196 ?auto_320197 ) ( ON ?auto_320195 ?auto_320196 ) ( CLEAR ?auto_320193 ) ( ON ?auto_320194 ?auto_320195 ) ( CLEAR ?auto_320194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_320188 ?auto_320189 ?auto_320190 ?auto_320191 ?auto_320192 ?auto_320193 ?auto_320194 )
      ( MAKE-12PILE ?auto_320188 ?auto_320189 ?auto_320190 ?auto_320191 ?auto_320192 ?auto_320193 ?auto_320194 ?auto_320195 ?auto_320196 ?auto_320197 ?auto_320198 ?auto_320199 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320213 - BLOCK
      ?auto_320214 - BLOCK
      ?auto_320215 - BLOCK
      ?auto_320216 - BLOCK
      ?auto_320217 - BLOCK
      ?auto_320218 - BLOCK
      ?auto_320219 - BLOCK
      ?auto_320220 - BLOCK
      ?auto_320221 - BLOCK
      ?auto_320222 - BLOCK
      ?auto_320223 - BLOCK
      ?auto_320224 - BLOCK
    )
    :vars
    (
      ?auto_320225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320224 ?auto_320225 ) ( ON-TABLE ?auto_320213 ) ( ON ?auto_320214 ?auto_320213 ) ( ON ?auto_320215 ?auto_320214 ) ( ON ?auto_320216 ?auto_320215 ) ( ON ?auto_320217 ?auto_320216 ) ( ON ?auto_320218 ?auto_320217 ) ( not ( = ?auto_320213 ?auto_320214 ) ) ( not ( = ?auto_320213 ?auto_320215 ) ) ( not ( = ?auto_320213 ?auto_320216 ) ) ( not ( = ?auto_320213 ?auto_320217 ) ) ( not ( = ?auto_320213 ?auto_320218 ) ) ( not ( = ?auto_320213 ?auto_320219 ) ) ( not ( = ?auto_320213 ?auto_320220 ) ) ( not ( = ?auto_320213 ?auto_320221 ) ) ( not ( = ?auto_320213 ?auto_320222 ) ) ( not ( = ?auto_320213 ?auto_320223 ) ) ( not ( = ?auto_320213 ?auto_320224 ) ) ( not ( = ?auto_320213 ?auto_320225 ) ) ( not ( = ?auto_320214 ?auto_320215 ) ) ( not ( = ?auto_320214 ?auto_320216 ) ) ( not ( = ?auto_320214 ?auto_320217 ) ) ( not ( = ?auto_320214 ?auto_320218 ) ) ( not ( = ?auto_320214 ?auto_320219 ) ) ( not ( = ?auto_320214 ?auto_320220 ) ) ( not ( = ?auto_320214 ?auto_320221 ) ) ( not ( = ?auto_320214 ?auto_320222 ) ) ( not ( = ?auto_320214 ?auto_320223 ) ) ( not ( = ?auto_320214 ?auto_320224 ) ) ( not ( = ?auto_320214 ?auto_320225 ) ) ( not ( = ?auto_320215 ?auto_320216 ) ) ( not ( = ?auto_320215 ?auto_320217 ) ) ( not ( = ?auto_320215 ?auto_320218 ) ) ( not ( = ?auto_320215 ?auto_320219 ) ) ( not ( = ?auto_320215 ?auto_320220 ) ) ( not ( = ?auto_320215 ?auto_320221 ) ) ( not ( = ?auto_320215 ?auto_320222 ) ) ( not ( = ?auto_320215 ?auto_320223 ) ) ( not ( = ?auto_320215 ?auto_320224 ) ) ( not ( = ?auto_320215 ?auto_320225 ) ) ( not ( = ?auto_320216 ?auto_320217 ) ) ( not ( = ?auto_320216 ?auto_320218 ) ) ( not ( = ?auto_320216 ?auto_320219 ) ) ( not ( = ?auto_320216 ?auto_320220 ) ) ( not ( = ?auto_320216 ?auto_320221 ) ) ( not ( = ?auto_320216 ?auto_320222 ) ) ( not ( = ?auto_320216 ?auto_320223 ) ) ( not ( = ?auto_320216 ?auto_320224 ) ) ( not ( = ?auto_320216 ?auto_320225 ) ) ( not ( = ?auto_320217 ?auto_320218 ) ) ( not ( = ?auto_320217 ?auto_320219 ) ) ( not ( = ?auto_320217 ?auto_320220 ) ) ( not ( = ?auto_320217 ?auto_320221 ) ) ( not ( = ?auto_320217 ?auto_320222 ) ) ( not ( = ?auto_320217 ?auto_320223 ) ) ( not ( = ?auto_320217 ?auto_320224 ) ) ( not ( = ?auto_320217 ?auto_320225 ) ) ( not ( = ?auto_320218 ?auto_320219 ) ) ( not ( = ?auto_320218 ?auto_320220 ) ) ( not ( = ?auto_320218 ?auto_320221 ) ) ( not ( = ?auto_320218 ?auto_320222 ) ) ( not ( = ?auto_320218 ?auto_320223 ) ) ( not ( = ?auto_320218 ?auto_320224 ) ) ( not ( = ?auto_320218 ?auto_320225 ) ) ( not ( = ?auto_320219 ?auto_320220 ) ) ( not ( = ?auto_320219 ?auto_320221 ) ) ( not ( = ?auto_320219 ?auto_320222 ) ) ( not ( = ?auto_320219 ?auto_320223 ) ) ( not ( = ?auto_320219 ?auto_320224 ) ) ( not ( = ?auto_320219 ?auto_320225 ) ) ( not ( = ?auto_320220 ?auto_320221 ) ) ( not ( = ?auto_320220 ?auto_320222 ) ) ( not ( = ?auto_320220 ?auto_320223 ) ) ( not ( = ?auto_320220 ?auto_320224 ) ) ( not ( = ?auto_320220 ?auto_320225 ) ) ( not ( = ?auto_320221 ?auto_320222 ) ) ( not ( = ?auto_320221 ?auto_320223 ) ) ( not ( = ?auto_320221 ?auto_320224 ) ) ( not ( = ?auto_320221 ?auto_320225 ) ) ( not ( = ?auto_320222 ?auto_320223 ) ) ( not ( = ?auto_320222 ?auto_320224 ) ) ( not ( = ?auto_320222 ?auto_320225 ) ) ( not ( = ?auto_320223 ?auto_320224 ) ) ( not ( = ?auto_320223 ?auto_320225 ) ) ( not ( = ?auto_320224 ?auto_320225 ) ) ( ON ?auto_320223 ?auto_320224 ) ( ON ?auto_320222 ?auto_320223 ) ( ON ?auto_320221 ?auto_320222 ) ( ON ?auto_320220 ?auto_320221 ) ( CLEAR ?auto_320218 ) ( ON ?auto_320219 ?auto_320220 ) ( CLEAR ?auto_320219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_320213 ?auto_320214 ?auto_320215 ?auto_320216 ?auto_320217 ?auto_320218 ?auto_320219 )
      ( MAKE-12PILE ?auto_320213 ?auto_320214 ?auto_320215 ?auto_320216 ?auto_320217 ?auto_320218 ?auto_320219 ?auto_320220 ?auto_320221 ?auto_320222 ?auto_320223 ?auto_320224 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320238 - BLOCK
      ?auto_320239 - BLOCK
      ?auto_320240 - BLOCK
      ?auto_320241 - BLOCK
      ?auto_320242 - BLOCK
      ?auto_320243 - BLOCK
      ?auto_320244 - BLOCK
      ?auto_320245 - BLOCK
      ?auto_320246 - BLOCK
      ?auto_320247 - BLOCK
      ?auto_320248 - BLOCK
      ?auto_320249 - BLOCK
    )
    :vars
    (
      ?auto_320250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320249 ?auto_320250 ) ( ON-TABLE ?auto_320238 ) ( ON ?auto_320239 ?auto_320238 ) ( ON ?auto_320240 ?auto_320239 ) ( ON ?auto_320241 ?auto_320240 ) ( ON ?auto_320242 ?auto_320241 ) ( not ( = ?auto_320238 ?auto_320239 ) ) ( not ( = ?auto_320238 ?auto_320240 ) ) ( not ( = ?auto_320238 ?auto_320241 ) ) ( not ( = ?auto_320238 ?auto_320242 ) ) ( not ( = ?auto_320238 ?auto_320243 ) ) ( not ( = ?auto_320238 ?auto_320244 ) ) ( not ( = ?auto_320238 ?auto_320245 ) ) ( not ( = ?auto_320238 ?auto_320246 ) ) ( not ( = ?auto_320238 ?auto_320247 ) ) ( not ( = ?auto_320238 ?auto_320248 ) ) ( not ( = ?auto_320238 ?auto_320249 ) ) ( not ( = ?auto_320238 ?auto_320250 ) ) ( not ( = ?auto_320239 ?auto_320240 ) ) ( not ( = ?auto_320239 ?auto_320241 ) ) ( not ( = ?auto_320239 ?auto_320242 ) ) ( not ( = ?auto_320239 ?auto_320243 ) ) ( not ( = ?auto_320239 ?auto_320244 ) ) ( not ( = ?auto_320239 ?auto_320245 ) ) ( not ( = ?auto_320239 ?auto_320246 ) ) ( not ( = ?auto_320239 ?auto_320247 ) ) ( not ( = ?auto_320239 ?auto_320248 ) ) ( not ( = ?auto_320239 ?auto_320249 ) ) ( not ( = ?auto_320239 ?auto_320250 ) ) ( not ( = ?auto_320240 ?auto_320241 ) ) ( not ( = ?auto_320240 ?auto_320242 ) ) ( not ( = ?auto_320240 ?auto_320243 ) ) ( not ( = ?auto_320240 ?auto_320244 ) ) ( not ( = ?auto_320240 ?auto_320245 ) ) ( not ( = ?auto_320240 ?auto_320246 ) ) ( not ( = ?auto_320240 ?auto_320247 ) ) ( not ( = ?auto_320240 ?auto_320248 ) ) ( not ( = ?auto_320240 ?auto_320249 ) ) ( not ( = ?auto_320240 ?auto_320250 ) ) ( not ( = ?auto_320241 ?auto_320242 ) ) ( not ( = ?auto_320241 ?auto_320243 ) ) ( not ( = ?auto_320241 ?auto_320244 ) ) ( not ( = ?auto_320241 ?auto_320245 ) ) ( not ( = ?auto_320241 ?auto_320246 ) ) ( not ( = ?auto_320241 ?auto_320247 ) ) ( not ( = ?auto_320241 ?auto_320248 ) ) ( not ( = ?auto_320241 ?auto_320249 ) ) ( not ( = ?auto_320241 ?auto_320250 ) ) ( not ( = ?auto_320242 ?auto_320243 ) ) ( not ( = ?auto_320242 ?auto_320244 ) ) ( not ( = ?auto_320242 ?auto_320245 ) ) ( not ( = ?auto_320242 ?auto_320246 ) ) ( not ( = ?auto_320242 ?auto_320247 ) ) ( not ( = ?auto_320242 ?auto_320248 ) ) ( not ( = ?auto_320242 ?auto_320249 ) ) ( not ( = ?auto_320242 ?auto_320250 ) ) ( not ( = ?auto_320243 ?auto_320244 ) ) ( not ( = ?auto_320243 ?auto_320245 ) ) ( not ( = ?auto_320243 ?auto_320246 ) ) ( not ( = ?auto_320243 ?auto_320247 ) ) ( not ( = ?auto_320243 ?auto_320248 ) ) ( not ( = ?auto_320243 ?auto_320249 ) ) ( not ( = ?auto_320243 ?auto_320250 ) ) ( not ( = ?auto_320244 ?auto_320245 ) ) ( not ( = ?auto_320244 ?auto_320246 ) ) ( not ( = ?auto_320244 ?auto_320247 ) ) ( not ( = ?auto_320244 ?auto_320248 ) ) ( not ( = ?auto_320244 ?auto_320249 ) ) ( not ( = ?auto_320244 ?auto_320250 ) ) ( not ( = ?auto_320245 ?auto_320246 ) ) ( not ( = ?auto_320245 ?auto_320247 ) ) ( not ( = ?auto_320245 ?auto_320248 ) ) ( not ( = ?auto_320245 ?auto_320249 ) ) ( not ( = ?auto_320245 ?auto_320250 ) ) ( not ( = ?auto_320246 ?auto_320247 ) ) ( not ( = ?auto_320246 ?auto_320248 ) ) ( not ( = ?auto_320246 ?auto_320249 ) ) ( not ( = ?auto_320246 ?auto_320250 ) ) ( not ( = ?auto_320247 ?auto_320248 ) ) ( not ( = ?auto_320247 ?auto_320249 ) ) ( not ( = ?auto_320247 ?auto_320250 ) ) ( not ( = ?auto_320248 ?auto_320249 ) ) ( not ( = ?auto_320248 ?auto_320250 ) ) ( not ( = ?auto_320249 ?auto_320250 ) ) ( ON ?auto_320248 ?auto_320249 ) ( ON ?auto_320247 ?auto_320248 ) ( ON ?auto_320246 ?auto_320247 ) ( ON ?auto_320245 ?auto_320246 ) ( ON ?auto_320244 ?auto_320245 ) ( CLEAR ?auto_320242 ) ( ON ?auto_320243 ?auto_320244 ) ( CLEAR ?auto_320243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_320238 ?auto_320239 ?auto_320240 ?auto_320241 ?auto_320242 ?auto_320243 )
      ( MAKE-12PILE ?auto_320238 ?auto_320239 ?auto_320240 ?auto_320241 ?auto_320242 ?auto_320243 ?auto_320244 ?auto_320245 ?auto_320246 ?auto_320247 ?auto_320248 ?auto_320249 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320263 - BLOCK
      ?auto_320264 - BLOCK
      ?auto_320265 - BLOCK
      ?auto_320266 - BLOCK
      ?auto_320267 - BLOCK
      ?auto_320268 - BLOCK
      ?auto_320269 - BLOCK
      ?auto_320270 - BLOCK
      ?auto_320271 - BLOCK
      ?auto_320272 - BLOCK
      ?auto_320273 - BLOCK
      ?auto_320274 - BLOCK
    )
    :vars
    (
      ?auto_320275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320274 ?auto_320275 ) ( ON-TABLE ?auto_320263 ) ( ON ?auto_320264 ?auto_320263 ) ( ON ?auto_320265 ?auto_320264 ) ( ON ?auto_320266 ?auto_320265 ) ( ON ?auto_320267 ?auto_320266 ) ( not ( = ?auto_320263 ?auto_320264 ) ) ( not ( = ?auto_320263 ?auto_320265 ) ) ( not ( = ?auto_320263 ?auto_320266 ) ) ( not ( = ?auto_320263 ?auto_320267 ) ) ( not ( = ?auto_320263 ?auto_320268 ) ) ( not ( = ?auto_320263 ?auto_320269 ) ) ( not ( = ?auto_320263 ?auto_320270 ) ) ( not ( = ?auto_320263 ?auto_320271 ) ) ( not ( = ?auto_320263 ?auto_320272 ) ) ( not ( = ?auto_320263 ?auto_320273 ) ) ( not ( = ?auto_320263 ?auto_320274 ) ) ( not ( = ?auto_320263 ?auto_320275 ) ) ( not ( = ?auto_320264 ?auto_320265 ) ) ( not ( = ?auto_320264 ?auto_320266 ) ) ( not ( = ?auto_320264 ?auto_320267 ) ) ( not ( = ?auto_320264 ?auto_320268 ) ) ( not ( = ?auto_320264 ?auto_320269 ) ) ( not ( = ?auto_320264 ?auto_320270 ) ) ( not ( = ?auto_320264 ?auto_320271 ) ) ( not ( = ?auto_320264 ?auto_320272 ) ) ( not ( = ?auto_320264 ?auto_320273 ) ) ( not ( = ?auto_320264 ?auto_320274 ) ) ( not ( = ?auto_320264 ?auto_320275 ) ) ( not ( = ?auto_320265 ?auto_320266 ) ) ( not ( = ?auto_320265 ?auto_320267 ) ) ( not ( = ?auto_320265 ?auto_320268 ) ) ( not ( = ?auto_320265 ?auto_320269 ) ) ( not ( = ?auto_320265 ?auto_320270 ) ) ( not ( = ?auto_320265 ?auto_320271 ) ) ( not ( = ?auto_320265 ?auto_320272 ) ) ( not ( = ?auto_320265 ?auto_320273 ) ) ( not ( = ?auto_320265 ?auto_320274 ) ) ( not ( = ?auto_320265 ?auto_320275 ) ) ( not ( = ?auto_320266 ?auto_320267 ) ) ( not ( = ?auto_320266 ?auto_320268 ) ) ( not ( = ?auto_320266 ?auto_320269 ) ) ( not ( = ?auto_320266 ?auto_320270 ) ) ( not ( = ?auto_320266 ?auto_320271 ) ) ( not ( = ?auto_320266 ?auto_320272 ) ) ( not ( = ?auto_320266 ?auto_320273 ) ) ( not ( = ?auto_320266 ?auto_320274 ) ) ( not ( = ?auto_320266 ?auto_320275 ) ) ( not ( = ?auto_320267 ?auto_320268 ) ) ( not ( = ?auto_320267 ?auto_320269 ) ) ( not ( = ?auto_320267 ?auto_320270 ) ) ( not ( = ?auto_320267 ?auto_320271 ) ) ( not ( = ?auto_320267 ?auto_320272 ) ) ( not ( = ?auto_320267 ?auto_320273 ) ) ( not ( = ?auto_320267 ?auto_320274 ) ) ( not ( = ?auto_320267 ?auto_320275 ) ) ( not ( = ?auto_320268 ?auto_320269 ) ) ( not ( = ?auto_320268 ?auto_320270 ) ) ( not ( = ?auto_320268 ?auto_320271 ) ) ( not ( = ?auto_320268 ?auto_320272 ) ) ( not ( = ?auto_320268 ?auto_320273 ) ) ( not ( = ?auto_320268 ?auto_320274 ) ) ( not ( = ?auto_320268 ?auto_320275 ) ) ( not ( = ?auto_320269 ?auto_320270 ) ) ( not ( = ?auto_320269 ?auto_320271 ) ) ( not ( = ?auto_320269 ?auto_320272 ) ) ( not ( = ?auto_320269 ?auto_320273 ) ) ( not ( = ?auto_320269 ?auto_320274 ) ) ( not ( = ?auto_320269 ?auto_320275 ) ) ( not ( = ?auto_320270 ?auto_320271 ) ) ( not ( = ?auto_320270 ?auto_320272 ) ) ( not ( = ?auto_320270 ?auto_320273 ) ) ( not ( = ?auto_320270 ?auto_320274 ) ) ( not ( = ?auto_320270 ?auto_320275 ) ) ( not ( = ?auto_320271 ?auto_320272 ) ) ( not ( = ?auto_320271 ?auto_320273 ) ) ( not ( = ?auto_320271 ?auto_320274 ) ) ( not ( = ?auto_320271 ?auto_320275 ) ) ( not ( = ?auto_320272 ?auto_320273 ) ) ( not ( = ?auto_320272 ?auto_320274 ) ) ( not ( = ?auto_320272 ?auto_320275 ) ) ( not ( = ?auto_320273 ?auto_320274 ) ) ( not ( = ?auto_320273 ?auto_320275 ) ) ( not ( = ?auto_320274 ?auto_320275 ) ) ( ON ?auto_320273 ?auto_320274 ) ( ON ?auto_320272 ?auto_320273 ) ( ON ?auto_320271 ?auto_320272 ) ( ON ?auto_320270 ?auto_320271 ) ( ON ?auto_320269 ?auto_320270 ) ( CLEAR ?auto_320267 ) ( ON ?auto_320268 ?auto_320269 ) ( CLEAR ?auto_320268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_320263 ?auto_320264 ?auto_320265 ?auto_320266 ?auto_320267 ?auto_320268 )
      ( MAKE-12PILE ?auto_320263 ?auto_320264 ?auto_320265 ?auto_320266 ?auto_320267 ?auto_320268 ?auto_320269 ?auto_320270 ?auto_320271 ?auto_320272 ?auto_320273 ?auto_320274 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320288 - BLOCK
      ?auto_320289 - BLOCK
      ?auto_320290 - BLOCK
      ?auto_320291 - BLOCK
      ?auto_320292 - BLOCK
      ?auto_320293 - BLOCK
      ?auto_320294 - BLOCK
      ?auto_320295 - BLOCK
      ?auto_320296 - BLOCK
      ?auto_320297 - BLOCK
      ?auto_320298 - BLOCK
      ?auto_320299 - BLOCK
    )
    :vars
    (
      ?auto_320300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320299 ?auto_320300 ) ( ON-TABLE ?auto_320288 ) ( ON ?auto_320289 ?auto_320288 ) ( ON ?auto_320290 ?auto_320289 ) ( ON ?auto_320291 ?auto_320290 ) ( not ( = ?auto_320288 ?auto_320289 ) ) ( not ( = ?auto_320288 ?auto_320290 ) ) ( not ( = ?auto_320288 ?auto_320291 ) ) ( not ( = ?auto_320288 ?auto_320292 ) ) ( not ( = ?auto_320288 ?auto_320293 ) ) ( not ( = ?auto_320288 ?auto_320294 ) ) ( not ( = ?auto_320288 ?auto_320295 ) ) ( not ( = ?auto_320288 ?auto_320296 ) ) ( not ( = ?auto_320288 ?auto_320297 ) ) ( not ( = ?auto_320288 ?auto_320298 ) ) ( not ( = ?auto_320288 ?auto_320299 ) ) ( not ( = ?auto_320288 ?auto_320300 ) ) ( not ( = ?auto_320289 ?auto_320290 ) ) ( not ( = ?auto_320289 ?auto_320291 ) ) ( not ( = ?auto_320289 ?auto_320292 ) ) ( not ( = ?auto_320289 ?auto_320293 ) ) ( not ( = ?auto_320289 ?auto_320294 ) ) ( not ( = ?auto_320289 ?auto_320295 ) ) ( not ( = ?auto_320289 ?auto_320296 ) ) ( not ( = ?auto_320289 ?auto_320297 ) ) ( not ( = ?auto_320289 ?auto_320298 ) ) ( not ( = ?auto_320289 ?auto_320299 ) ) ( not ( = ?auto_320289 ?auto_320300 ) ) ( not ( = ?auto_320290 ?auto_320291 ) ) ( not ( = ?auto_320290 ?auto_320292 ) ) ( not ( = ?auto_320290 ?auto_320293 ) ) ( not ( = ?auto_320290 ?auto_320294 ) ) ( not ( = ?auto_320290 ?auto_320295 ) ) ( not ( = ?auto_320290 ?auto_320296 ) ) ( not ( = ?auto_320290 ?auto_320297 ) ) ( not ( = ?auto_320290 ?auto_320298 ) ) ( not ( = ?auto_320290 ?auto_320299 ) ) ( not ( = ?auto_320290 ?auto_320300 ) ) ( not ( = ?auto_320291 ?auto_320292 ) ) ( not ( = ?auto_320291 ?auto_320293 ) ) ( not ( = ?auto_320291 ?auto_320294 ) ) ( not ( = ?auto_320291 ?auto_320295 ) ) ( not ( = ?auto_320291 ?auto_320296 ) ) ( not ( = ?auto_320291 ?auto_320297 ) ) ( not ( = ?auto_320291 ?auto_320298 ) ) ( not ( = ?auto_320291 ?auto_320299 ) ) ( not ( = ?auto_320291 ?auto_320300 ) ) ( not ( = ?auto_320292 ?auto_320293 ) ) ( not ( = ?auto_320292 ?auto_320294 ) ) ( not ( = ?auto_320292 ?auto_320295 ) ) ( not ( = ?auto_320292 ?auto_320296 ) ) ( not ( = ?auto_320292 ?auto_320297 ) ) ( not ( = ?auto_320292 ?auto_320298 ) ) ( not ( = ?auto_320292 ?auto_320299 ) ) ( not ( = ?auto_320292 ?auto_320300 ) ) ( not ( = ?auto_320293 ?auto_320294 ) ) ( not ( = ?auto_320293 ?auto_320295 ) ) ( not ( = ?auto_320293 ?auto_320296 ) ) ( not ( = ?auto_320293 ?auto_320297 ) ) ( not ( = ?auto_320293 ?auto_320298 ) ) ( not ( = ?auto_320293 ?auto_320299 ) ) ( not ( = ?auto_320293 ?auto_320300 ) ) ( not ( = ?auto_320294 ?auto_320295 ) ) ( not ( = ?auto_320294 ?auto_320296 ) ) ( not ( = ?auto_320294 ?auto_320297 ) ) ( not ( = ?auto_320294 ?auto_320298 ) ) ( not ( = ?auto_320294 ?auto_320299 ) ) ( not ( = ?auto_320294 ?auto_320300 ) ) ( not ( = ?auto_320295 ?auto_320296 ) ) ( not ( = ?auto_320295 ?auto_320297 ) ) ( not ( = ?auto_320295 ?auto_320298 ) ) ( not ( = ?auto_320295 ?auto_320299 ) ) ( not ( = ?auto_320295 ?auto_320300 ) ) ( not ( = ?auto_320296 ?auto_320297 ) ) ( not ( = ?auto_320296 ?auto_320298 ) ) ( not ( = ?auto_320296 ?auto_320299 ) ) ( not ( = ?auto_320296 ?auto_320300 ) ) ( not ( = ?auto_320297 ?auto_320298 ) ) ( not ( = ?auto_320297 ?auto_320299 ) ) ( not ( = ?auto_320297 ?auto_320300 ) ) ( not ( = ?auto_320298 ?auto_320299 ) ) ( not ( = ?auto_320298 ?auto_320300 ) ) ( not ( = ?auto_320299 ?auto_320300 ) ) ( ON ?auto_320298 ?auto_320299 ) ( ON ?auto_320297 ?auto_320298 ) ( ON ?auto_320296 ?auto_320297 ) ( ON ?auto_320295 ?auto_320296 ) ( ON ?auto_320294 ?auto_320295 ) ( ON ?auto_320293 ?auto_320294 ) ( CLEAR ?auto_320291 ) ( ON ?auto_320292 ?auto_320293 ) ( CLEAR ?auto_320292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_320288 ?auto_320289 ?auto_320290 ?auto_320291 ?auto_320292 )
      ( MAKE-12PILE ?auto_320288 ?auto_320289 ?auto_320290 ?auto_320291 ?auto_320292 ?auto_320293 ?auto_320294 ?auto_320295 ?auto_320296 ?auto_320297 ?auto_320298 ?auto_320299 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320313 - BLOCK
      ?auto_320314 - BLOCK
      ?auto_320315 - BLOCK
      ?auto_320316 - BLOCK
      ?auto_320317 - BLOCK
      ?auto_320318 - BLOCK
      ?auto_320319 - BLOCK
      ?auto_320320 - BLOCK
      ?auto_320321 - BLOCK
      ?auto_320322 - BLOCK
      ?auto_320323 - BLOCK
      ?auto_320324 - BLOCK
    )
    :vars
    (
      ?auto_320325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320324 ?auto_320325 ) ( ON-TABLE ?auto_320313 ) ( ON ?auto_320314 ?auto_320313 ) ( ON ?auto_320315 ?auto_320314 ) ( ON ?auto_320316 ?auto_320315 ) ( not ( = ?auto_320313 ?auto_320314 ) ) ( not ( = ?auto_320313 ?auto_320315 ) ) ( not ( = ?auto_320313 ?auto_320316 ) ) ( not ( = ?auto_320313 ?auto_320317 ) ) ( not ( = ?auto_320313 ?auto_320318 ) ) ( not ( = ?auto_320313 ?auto_320319 ) ) ( not ( = ?auto_320313 ?auto_320320 ) ) ( not ( = ?auto_320313 ?auto_320321 ) ) ( not ( = ?auto_320313 ?auto_320322 ) ) ( not ( = ?auto_320313 ?auto_320323 ) ) ( not ( = ?auto_320313 ?auto_320324 ) ) ( not ( = ?auto_320313 ?auto_320325 ) ) ( not ( = ?auto_320314 ?auto_320315 ) ) ( not ( = ?auto_320314 ?auto_320316 ) ) ( not ( = ?auto_320314 ?auto_320317 ) ) ( not ( = ?auto_320314 ?auto_320318 ) ) ( not ( = ?auto_320314 ?auto_320319 ) ) ( not ( = ?auto_320314 ?auto_320320 ) ) ( not ( = ?auto_320314 ?auto_320321 ) ) ( not ( = ?auto_320314 ?auto_320322 ) ) ( not ( = ?auto_320314 ?auto_320323 ) ) ( not ( = ?auto_320314 ?auto_320324 ) ) ( not ( = ?auto_320314 ?auto_320325 ) ) ( not ( = ?auto_320315 ?auto_320316 ) ) ( not ( = ?auto_320315 ?auto_320317 ) ) ( not ( = ?auto_320315 ?auto_320318 ) ) ( not ( = ?auto_320315 ?auto_320319 ) ) ( not ( = ?auto_320315 ?auto_320320 ) ) ( not ( = ?auto_320315 ?auto_320321 ) ) ( not ( = ?auto_320315 ?auto_320322 ) ) ( not ( = ?auto_320315 ?auto_320323 ) ) ( not ( = ?auto_320315 ?auto_320324 ) ) ( not ( = ?auto_320315 ?auto_320325 ) ) ( not ( = ?auto_320316 ?auto_320317 ) ) ( not ( = ?auto_320316 ?auto_320318 ) ) ( not ( = ?auto_320316 ?auto_320319 ) ) ( not ( = ?auto_320316 ?auto_320320 ) ) ( not ( = ?auto_320316 ?auto_320321 ) ) ( not ( = ?auto_320316 ?auto_320322 ) ) ( not ( = ?auto_320316 ?auto_320323 ) ) ( not ( = ?auto_320316 ?auto_320324 ) ) ( not ( = ?auto_320316 ?auto_320325 ) ) ( not ( = ?auto_320317 ?auto_320318 ) ) ( not ( = ?auto_320317 ?auto_320319 ) ) ( not ( = ?auto_320317 ?auto_320320 ) ) ( not ( = ?auto_320317 ?auto_320321 ) ) ( not ( = ?auto_320317 ?auto_320322 ) ) ( not ( = ?auto_320317 ?auto_320323 ) ) ( not ( = ?auto_320317 ?auto_320324 ) ) ( not ( = ?auto_320317 ?auto_320325 ) ) ( not ( = ?auto_320318 ?auto_320319 ) ) ( not ( = ?auto_320318 ?auto_320320 ) ) ( not ( = ?auto_320318 ?auto_320321 ) ) ( not ( = ?auto_320318 ?auto_320322 ) ) ( not ( = ?auto_320318 ?auto_320323 ) ) ( not ( = ?auto_320318 ?auto_320324 ) ) ( not ( = ?auto_320318 ?auto_320325 ) ) ( not ( = ?auto_320319 ?auto_320320 ) ) ( not ( = ?auto_320319 ?auto_320321 ) ) ( not ( = ?auto_320319 ?auto_320322 ) ) ( not ( = ?auto_320319 ?auto_320323 ) ) ( not ( = ?auto_320319 ?auto_320324 ) ) ( not ( = ?auto_320319 ?auto_320325 ) ) ( not ( = ?auto_320320 ?auto_320321 ) ) ( not ( = ?auto_320320 ?auto_320322 ) ) ( not ( = ?auto_320320 ?auto_320323 ) ) ( not ( = ?auto_320320 ?auto_320324 ) ) ( not ( = ?auto_320320 ?auto_320325 ) ) ( not ( = ?auto_320321 ?auto_320322 ) ) ( not ( = ?auto_320321 ?auto_320323 ) ) ( not ( = ?auto_320321 ?auto_320324 ) ) ( not ( = ?auto_320321 ?auto_320325 ) ) ( not ( = ?auto_320322 ?auto_320323 ) ) ( not ( = ?auto_320322 ?auto_320324 ) ) ( not ( = ?auto_320322 ?auto_320325 ) ) ( not ( = ?auto_320323 ?auto_320324 ) ) ( not ( = ?auto_320323 ?auto_320325 ) ) ( not ( = ?auto_320324 ?auto_320325 ) ) ( ON ?auto_320323 ?auto_320324 ) ( ON ?auto_320322 ?auto_320323 ) ( ON ?auto_320321 ?auto_320322 ) ( ON ?auto_320320 ?auto_320321 ) ( ON ?auto_320319 ?auto_320320 ) ( ON ?auto_320318 ?auto_320319 ) ( CLEAR ?auto_320316 ) ( ON ?auto_320317 ?auto_320318 ) ( CLEAR ?auto_320317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_320313 ?auto_320314 ?auto_320315 ?auto_320316 ?auto_320317 )
      ( MAKE-12PILE ?auto_320313 ?auto_320314 ?auto_320315 ?auto_320316 ?auto_320317 ?auto_320318 ?auto_320319 ?auto_320320 ?auto_320321 ?auto_320322 ?auto_320323 ?auto_320324 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320338 - BLOCK
      ?auto_320339 - BLOCK
      ?auto_320340 - BLOCK
      ?auto_320341 - BLOCK
      ?auto_320342 - BLOCK
      ?auto_320343 - BLOCK
      ?auto_320344 - BLOCK
      ?auto_320345 - BLOCK
      ?auto_320346 - BLOCK
      ?auto_320347 - BLOCK
      ?auto_320348 - BLOCK
      ?auto_320349 - BLOCK
    )
    :vars
    (
      ?auto_320350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320349 ?auto_320350 ) ( ON-TABLE ?auto_320338 ) ( ON ?auto_320339 ?auto_320338 ) ( ON ?auto_320340 ?auto_320339 ) ( not ( = ?auto_320338 ?auto_320339 ) ) ( not ( = ?auto_320338 ?auto_320340 ) ) ( not ( = ?auto_320338 ?auto_320341 ) ) ( not ( = ?auto_320338 ?auto_320342 ) ) ( not ( = ?auto_320338 ?auto_320343 ) ) ( not ( = ?auto_320338 ?auto_320344 ) ) ( not ( = ?auto_320338 ?auto_320345 ) ) ( not ( = ?auto_320338 ?auto_320346 ) ) ( not ( = ?auto_320338 ?auto_320347 ) ) ( not ( = ?auto_320338 ?auto_320348 ) ) ( not ( = ?auto_320338 ?auto_320349 ) ) ( not ( = ?auto_320338 ?auto_320350 ) ) ( not ( = ?auto_320339 ?auto_320340 ) ) ( not ( = ?auto_320339 ?auto_320341 ) ) ( not ( = ?auto_320339 ?auto_320342 ) ) ( not ( = ?auto_320339 ?auto_320343 ) ) ( not ( = ?auto_320339 ?auto_320344 ) ) ( not ( = ?auto_320339 ?auto_320345 ) ) ( not ( = ?auto_320339 ?auto_320346 ) ) ( not ( = ?auto_320339 ?auto_320347 ) ) ( not ( = ?auto_320339 ?auto_320348 ) ) ( not ( = ?auto_320339 ?auto_320349 ) ) ( not ( = ?auto_320339 ?auto_320350 ) ) ( not ( = ?auto_320340 ?auto_320341 ) ) ( not ( = ?auto_320340 ?auto_320342 ) ) ( not ( = ?auto_320340 ?auto_320343 ) ) ( not ( = ?auto_320340 ?auto_320344 ) ) ( not ( = ?auto_320340 ?auto_320345 ) ) ( not ( = ?auto_320340 ?auto_320346 ) ) ( not ( = ?auto_320340 ?auto_320347 ) ) ( not ( = ?auto_320340 ?auto_320348 ) ) ( not ( = ?auto_320340 ?auto_320349 ) ) ( not ( = ?auto_320340 ?auto_320350 ) ) ( not ( = ?auto_320341 ?auto_320342 ) ) ( not ( = ?auto_320341 ?auto_320343 ) ) ( not ( = ?auto_320341 ?auto_320344 ) ) ( not ( = ?auto_320341 ?auto_320345 ) ) ( not ( = ?auto_320341 ?auto_320346 ) ) ( not ( = ?auto_320341 ?auto_320347 ) ) ( not ( = ?auto_320341 ?auto_320348 ) ) ( not ( = ?auto_320341 ?auto_320349 ) ) ( not ( = ?auto_320341 ?auto_320350 ) ) ( not ( = ?auto_320342 ?auto_320343 ) ) ( not ( = ?auto_320342 ?auto_320344 ) ) ( not ( = ?auto_320342 ?auto_320345 ) ) ( not ( = ?auto_320342 ?auto_320346 ) ) ( not ( = ?auto_320342 ?auto_320347 ) ) ( not ( = ?auto_320342 ?auto_320348 ) ) ( not ( = ?auto_320342 ?auto_320349 ) ) ( not ( = ?auto_320342 ?auto_320350 ) ) ( not ( = ?auto_320343 ?auto_320344 ) ) ( not ( = ?auto_320343 ?auto_320345 ) ) ( not ( = ?auto_320343 ?auto_320346 ) ) ( not ( = ?auto_320343 ?auto_320347 ) ) ( not ( = ?auto_320343 ?auto_320348 ) ) ( not ( = ?auto_320343 ?auto_320349 ) ) ( not ( = ?auto_320343 ?auto_320350 ) ) ( not ( = ?auto_320344 ?auto_320345 ) ) ( not ( = ?auto_320344 ?auto_320346 ) ) ( not ( = ?auto_320344 ?auto_320347 ) ) ( not ( = ?auto_320344 ?auto_320348 ) ) ( not ( = ?auto_320344 ?auto_320349 ) ) ( not ( = ?auto_320344 ?auto_320350 ) ) ( not ( = ?auto_320345 ?auto_320346 ) ) ( not ( = ?auto_320345 ?auto_320347 ) ) ( not ( = ?auto_320345 ?auto_320348 ) ) ( not ( = ?auto_320345 ?auto_320349 ) ) ( not ( = ?auto_320345 ?auto_320350 ) ) ( not ( = ?auto_320346 ?auto_320347 ) ) ( not ( = ?auto_320346 ?auto_320348 ) ) ( not ( = ?auto_320346 ?auto_320349 ) ) ( not ( = ?auto_320346 ?auto_320350 ) ) ( not ( = ?auto_320347 ?auto_320348 ) ) ( not ( = ?auto_320347 ?auto_320349 ) ) ( not ( = ?auto_320347 ?auto_320350 ) ) ( not ( = ?auto_320348 ?auto_320349 ) ) ( not ( = ?auto_320348 ?auto_320350 ) ) ( not ( = ?auto_320349 ?auto_320350 ) ) ( ON ?auto_320348 ?auto_320349 ) ( ON ?auto_320347 ?auto_320348 ) ( ON ?auto_320346 ?auto_320347 ) ( ON ?auto_320345 ?auto_320346 ) ( ON ?auto_320344 ?auto_320345 ) ( ON ?auto_320343 ?auto_320344 ) ( ON ?auto_320342 ?auto_320343 ) ( CLEAR ?auto_320340 ) ( ON ?auto_320341 ?auto_320342 ) ( CLEAR ?auto_320341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_320338 ?auto_320339 ?auto_320340 ?auto_320341 )
      ( MAKE-12PILE ?auto_320338 ?auto_320339 ?auto_320340 ?auto_320341 ?auto_320342 ?auto_320343 ?auto_320344 ?auto_320345 ?auto_320346 ?auto_320347 ?auto_320348 ?auto_320349 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320363 - BLOCK
      ?auto_320364 - BLOCK
      ?auto_320365 - BLOCK
      ?auto_320366 - BLOCK
      ?auto_320367 - BLOCK
      ?auto_320368 - BLOCK
      ?auto_320369 - BLOCK
      ?auto_320370 - BLOCK
      ?auto_320371 - BLOCK
      ?auto_320372 - BLOCK
      ?auto_320373 - BLOCK
      ?auto_320374 - BLOCK
    )
    :vars
    (
      ?auto_320375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320374 ?auto_320375 ) ( ON-TABLE ?auto_320363 ) ( ON ?auto_320364 ?auto_320363 ) ( ON ?auto_320365 ?auto_320364 ) ( not ( = ?auto_320363 ?auto_320364 ) ) ( not ( = ?auto_320363 ?auto_320365 ) ) ( not ( = ?auto_320363 ?auto_320366 ) ) ( not ( = ?auto_320363 ?auto_320367 ) ) ( not ( = ?auto_320363 ?auto_320368 ) ) ( not ( = ?auto_320363 ?auto_320369 ) ) ( not ( = ?auto_320363 ?auto_320370 ) ) ( not ( = ?auto_320363 ?auto_320371 ) ) ( not ( = ?auto_320363 ?auto_320372 ) ) ( not ( = ?auto_320363 ?auto_320373 ) ) ( not ( = ?auto_320363 ?auto_320374 ) ) ( not ( = ?auto_320363 ?auto_320375 ) ) ( not ( = ?auto_320364 ?auto_320365 ) ) ( not ( = ?auto_320364 ?auto_320366 ) ) ( not ( = ?auto_320364 ?auto_320367 ) ) ( not ( = ?auto_320364 ?auto_320368 ) ) ( not ( = ?auto_320364 ?auto_320369 ) ) ( not ( = ?auto_320364 ?auto_320370 ) ) ( not ( = ?auto_320364 ?auto_320371 ) ) ( not ( = ?auto_320364 ?auto_320372 ) ) ( not ( = ?auto_320364 ?auto_320373 ) ) ( not ( = ?auto_320364 ?auto_320374 ) ) ( not ( = ?auto_320364 ?auto_320375 ) ) ( not ( = ?auto_320365 ?auto_320366 ) ) ( not ( = ?auto_320365 ?auto_320367 ) ) ( not ( = ?auto_320365 ?auto_320368 ) ) ( not ( = ?auto_320365 ?auto_320369 ) ) ( not ( = ?auto_320365 ?auto_320370 ) ) ( not ( = ?auto_320365 ?auto_320371 ) ) ( not ( = ?auto_320365 ?auto_320372 ) ) ( not ( = ?auto_320365 ?auto_320373 ) ) ( not ( = ?auto_320365 ?auto_320374 ) ) ( not ( = ?auto_320365 ?auto_320375 ) ) ( not ( = ?auto_320366 ?auto_320367 ) ) ( not ( = ?auto_320366 ?auto_320368 ) ) ( not ( = ?auto_320366 ?auto_320369 ) ) ( not ( = ?auto_320366 ?auto_320370 ) ) ( not ( = ?auto_320366 ?auto_320371 ) ) ( not ( = ?auto_320366 ?auto_320372 ) ) ( not ( = ?auto_320366 ?auto_320373 ) ) ( not ( = ?auto_320366 ?auto_320374 ) ) ( not ( = ?auto_320366 ?auto_320375 ) ) ( not ( = ?auto_320367 ?auto_320368 ) ) ( not ( = ?auto_320367 ?auto_320369 ) ) ( not ( = ?auto_320367 ?auto_320370 ) ) ( not ( = ?auto_320367 ?auto_320371 ) ) ( not ( = ?auto_320367 ?auto_320372 ) ) ( not ( = ?auto_320367 ?auto_320373 ) ) ( not ( = ?auto_320367 ?auto_320374 ) ) ( not ( = ?auto_320367 ?auto_320375 ) ) ( not ( = ?auto_320368 ?auto_320369 ) ) ( not ( = ?auto_320368 ?auto_320370 ) ) ( not ( = ?auto_320368 ?auto_320371 ) ) ( not ( = ?auto_320368 ?auto_320372 ) ) ( not ( = ?auto_320368 ?auto_320373 ) ) ( not ( = ?auto_320368 ?auto_320374 ) ) ( not ( = ?auto_320368 ?auto_320375 ) ) ( not ( = ?auto_320369 ?auto_320370 ) ) ( not ( = ?auto_320369 ?auto_320371 ) ) ( not ( = ?auto_320369 ?auto_320372 ) ) ( not ( = ?auto_320369 ?auto_320373 ) ) ( not ( = ?auto_320369 ?auto_320374 ) ) ( not ( = ?auto_320369 ?auto_320375 ) ) ( not ( = ?auto_320370 ?auto_320371 ) ) ( not ( = ?auto_320370 ?auto_320372 ) ) ( not ( = ?auto_320370 ?auto_320373 ) ) ( not ( = ?auto_320370 ?auto_320374 ) ) ( not ( = ?auto_320370 ?auto_320375 ) ) ( not ( = ?auto_320371 ?auto_320372 ) ) ( not ( = ?auto_320371 ?auto_320373 ) ) ( not ( = ?auto_320371 ?auto_320374 ) ) ( not ( = ?auto_320371 ?auto_320375 ) ) ( not ( = ?auto_320372 ?auto_320373 ) ) ( not ( = ?auto_320372 ?auto_320374 ) ) ( not ( = ?auto_320372 ?auto_320375 ) ) ( not ( = ?auto_320373 ?auto_320374 ) ) ( not ( = ?auto_320373 ?auto_320375 ) ) ( not ( = ?auto_320374 ?auto_320375 ) ) ( ON ?auto_320373 ?auto_320374 ) ( ON ?auto_320372 ?auto_320373 ) ( ON ?auto_320371 ?auto_320372 ) ( ON ?auto_320370 ?auto_320371 ) ( ON ?auto_320369 ?auto_320370 ) ( ON ?auto_320368 ?auto_320369 ) ( ON ?auto_320367 ?auto_320368 ) ( CLEAR ?auto_320365 ) ( ON ?auto_320366 ?auto_320367 ) ( CLEAR ?auto_320366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_320363 ?auto_320364 ?auto_320365 ?auto_320366 )
      ( MAKE-12PILE ?auto_320363 ?auto_320364 ?auto_320365 ?auto_320366 ?auto_320367 ?auto_320368 ?auto_320369 ?auto_320370 ?auto_320371 ?auto_320372 ?auto_320373 ?auto_320374 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320388 - BLOCK
      ?auto_320389 - BLOCK
      ?auto_320390 - BLOCK
      ?auto_320391 - BLOCK
      ?auto_320392 - BLOCK
      ?auto_320393 - BLOCK
      ?auto_320394 - BLOCK
      ?auto_320395 - BLOCK
      ?auto_320396 - BLOCK
      ?auto_320397 - BLOCK
      ?auto_320398 - BLOCK
      ?auto_320399 - BLOCK
    )
    :vars
    (
      ?auto_320400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320399 ?auto_320400 ) ( ON-TABLE ?auto_320388 ) ( ON ?auto_320389 ?auto_320388 ) ( not ( = ?auto_320388 ?auto_320389 ) ) ( not ( = ?auto_320388 ?auto_320390 ) ) ( not ( = ?auto_320388 ?auto_320391 ) ) ( not ( = ?auto_320388 ?auto_320392 ) ) ( not ( = ?auto_320388 ?auto_320393 ) ) ( not ( = ?auto_320388 ?auto_320394 ) ) ( not ( = ?auto_320388 ?auto_320395 ) ) ( not ( = ?auto_320388 ?auto_320396 ) ) ( not ( = ?auto_320388 ?auto_320397 ) ) ( not ( = ?auto_320388 ?auto_320398 ) ) ( not ( = ?auto_320388 ?auto_320399 ) ) ( not ( = ?auto_320388 ?auto_320400 ) ) ( not ( = ?auto_320389 ?auto_320390 ) ) ( not ( = ?auto_320389 ?auto_320391 ) ) ( not ( = ?auto_320389 ?auto_320392 ) ) ( not ( = ?auto_320389 ?auto_320393 ) ) ( not ( = ?auto_320389 ?auto_320394 ) ) ( not ( = ?auto_320389 ?auto_320395 ) ) ( not ( = ?auto_320389 ?auto_320396 ) ) ( not ( = ?auto_320389 ?auto_320397 ) ) ( not ( = ?auto_320389 ?auto_320398 ) ) ( not ( = ?auto_320389 ?auto_320399 ) ) ( not ( = ?auto_320389 ?auto_320400 ) ) ( not ( = ?auto_320390 ?auto_320391 ) ) ( not ( = ?auto_320390 ?auto_320392 ) ) ( not ( = ?auto_320390 ?auto_320393 ) ) ( not ( = ?auto_320390 ?auto_320394 ) ) ( not ( = ?auto_320390 ?auto_320395 ) ) ( not ( = ?auto_320390 ?auto_320396 ) ) ( not ( = ?auto_320390 ?auto_320397 ) ) ( not ( = ?auto_320390 ?auto_320398 ) ) ( not ( = ?auto_320390 ?auto_320399 ) ) ( not ( = ?auto_320390 ?auto_320400 ) ) ( not ( = ?auto_320391 ?auto_320392 ) ) ( not ( = ?auto_320391 ?auto_320393 ) ) ( not ( = ?auto_320391 ?auto_320394 ) ) ( not ( = ?auto_320391 ?auto_320395 ) ) ( not ( = ?auto_320391 ?auto_320396 ) ) ( not ( = ?auto_320391 ?auto_320397 ) ) ( not ( = ?auto_320391 ?auto_320398 ) ) ( not ( = ?auto_320391 ?auto_320399 ) ) ( not ( = ?auto_320391 ?auto_320400 ) ) ( not ( = ?auto_320392 ?auto_320393 ) ) ( not ( = ?auto_320392 ?auto_320394 ) ) ( not ( = ?auto_320392 ?auto_320395 ) ) ( not ( = ?auto_320392 ?auto_320396 ) ) ( not ( = ?auto_320392 ?auto_320397 ) ) ( not ( = ?auto_320392 ?auto_320398 ) ) ( not ( = ?auto_320392 ?auto_320399 ) ) ( not ( = ?auto_320392 ?auto_320400 ) ) ( not ( = ?auto_320393 ?auto_320394 ) ) ( not ( = ?auto_320393 ?auto_320395 ) ) ( not ( = ?auto_320393 ?auto_320396 ) ) ( not ( = ?auto_320393 ?auto_320397 ) ) ( not ( = ?auto_320393 ?auto_320398 ) ) ( not ( = ?auto_320393 ?auto_320399 ) ) ( not ( = ?auto_320393 ?auto_320400 ) ) ( not ( = ?auto_320394 ?auto_320395 ) ) ( not ( = ?auto_320394 ?auto_320396 ) ) ( not ( = ?auto_320394 ?auto_320397 ) ) ( not ( = ?auto_320394 ?auto_320398 ) ) ( not ( = ?auto_320394 ?auto_320399 ) ) ( not ( = ?auto_320394 ?auto_320400 ) ) ( not ( = ?auto_320395 ?auto_320396 ) ) ( not ( = ?auto_320395 ?auto_320397 ) ) ( not ( = ?auto_320395 ?auto_320398 ) ) ( not ( = ?auto_320395 ?auto_320399 ) ) ( not ( = ?auto_320395 ?auto_320400 ) ) ( not ( = ?auto_320396 ?auto_320397 ) ) ( not ( = ?auto_320396 ?auto_320398 ) ) ( not ( = ?auto_320396 ?auto_320399 ) ) ( not ( = ?auto_320396 ?auto_320400 ) ) ( not ( = ?auto_320397 ?auto_320398 ) ) ( not ( = ?auto_320397 ?auto_320399 ) ) ( not ( = ?auto_320397 ?auto_320400 ) ) ( not ( = ?auto_320398 ?auto_320399 ) ) ( not ( = ?auto_320398 ?auto_320400 ) ) ( not ( = ?auto_320399 ?auto_320400 ) ) ( ON ?auto_320398 ?auto_320399 ) ( ON ?auto_320397 ?auto_320398 ) ( ON ?auto_320396 ?auto_320397 ) ( ON ?auto_320395 ?auto_320396 ) ( ON ?auto_320394 ?auto_320395 ) ( ON ?auto_320393 ?auto_320394 ) ( ON ?auto_320392 ?auto_320393 ) ( ON ?auto_320391 ?auto_320392 ) ( CLEAR ?auto_320389 ) ( ON ?auto_320390 ?auto_320391 ) ( CLEAR ?auto_320390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_320388 ?auto_320389 ?auto_320390 )
      ( MAKE-12PILE ?auto_320388 ?auto_320389 ?auto_320390 ?auto_320391 ?auto_320392 ?auto_320393 ?auto_320394 ?auto_320395 ?auto_320396 ?auto_320397 ?auto_320398 ?auto_320399 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320413 - BLOCK
      ?auto_320414 - BLOCK
      ?auto_320415 - BLOCK
      ?auto_320416 - BLOCK
      ?auto_320417 - BLOCK
      ?auto_320418 - BLOCK
      ?auto_320419 - BLOCK
      ?auto_320420 - BLOCK
      ?auto_320421 - BLOCK
      ?auto_320422 - BLOCK
      ?auto_320423 - BLOCK
      ?auto_320424 - BLOCK
    )
    :vars
    (
      ?auto_320425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320424 ?auto_320425 ) ( ON-TABLE ?auto_320413 ) ( ON ?auto_320414 ?auto_320413 ) ( not ( = ?auto_320413 ?auto_320414 ) ) ( not ( = ?auto_320413 ?auto_320415 ) ) ( not ( = ?auto_320413 ?auto_320416 ) ) ( not ( = ?auto_320413 ?auto_320417 ) ) ( not ( = ?auto_320413 ?auto_320418 ) ) ( not ( = ?auto_320413 ?auto_320419 ) ) ( not ( = ?auto_320413 ?auto_320420 ) ) ( not ( = ?auto_320413 ?auto_320421 ) ) ( not ( = ?auto_320413 ?auto_320422 ) ) ( not ( = ?auto_320413 ?auto_320423 ) ) ( not ( = ?auto_320413 ?auto_320424 ) ) ( not ( = ?auto_320413 ?auto_320425 ) ) ( not ( = ?auto_320414 ?auto_320415 ) ) ( not ( = ?auto_320414 ?auto_320416 ) ) ( not ( = ?auto_320414 ?auto_320417 ) ) ( not ( = ?auto_320414 ?auto_320418 ) ) ( not ( = ?auto_320414 ?auto_320419 ) ) ( not ( = ?auto_320414 ?auto_320420 ) ) ( not ( = ?auto_320414 ?auto_320421 ) ) ( not ( = ?auto_320414 ?auto_320422 ) ) ( not ( = ?auto_320414 ?auto_320423 ) ) ( not ( = ?auto_320414 ?auto_320424 ) ) ( not ( = ?auto_320414 ?auto_320425 ) ) ( not ( = ?auto_320415 ?auto_320416 ) ) ( not ( = ?auto_320415 ?auto_320417 ) ) ( not ( = ?auto_320415 ?auto_320418 ) ) ( not ( = ?auto_320415 ?auto_320419 ) ) ( not ( = ?auto_320415 ?auto_320420 ) ) ( not ( = ?auto_320415 ?auto_320421 ) ) ( not ( = ?auto_320415 ?auto_320422 ) ) ( not ( = ?auto_320415 ?auto_320423 ) ) ( not ( = ?auto_320415 ?auto_320424 ) ) ( not ( = ?auto_320415 ?auto_320425 ) ) ( not ( = ?auto_320416 ?auto_320417 ) ) ( not ( = ?auto_320416 ?auto_320418 ) ) ( not ( = ?auto_320416 ?auto_320419 ) ) ( not ( = ?auto_320416 ?auto_320420 ) ) ( not ( = ?auto_320416 ?auto_320421 ) ) ( not ( = ?auto_320416 ?auto_320422 ) ) ( not ( = ?auto_320416 ?auto_320423 ) ) ( not ( = ?auto_320416 ?auto_320424 ) ) ( not ( = ?auto_320416 ?auto_320425 ) ) ( not ( = ?auto_320417 ?auto_320418 ) ) ( not ( = ?auto_320417 ?auto_320419 ) ) ( not ( = ?auto_320417 ?auto_320420 ) ) ( not ( = ?auto_320417 ?auto_320421 ) ) ( not ( = ?auto_320417 ?auto_320422 ) ) ( not ( = ?auto_320417 ?auto_320423 ) ) ( not ( = ?auto_320417 ?auto_320424 ) ) ( not ( = ?auto_320417 ?auto_320425 ) ) ( not ( = ?auto_320418 ?auto_320419 ) ) ( not ( = ?auto_320418 ?auto_320420 ) ) ( not ( = ?auto_320418 ?auto_320421 ) ) ( not ( = ?auto_320418 ?auto_320422 ) ) ( not ( = ?auto_320418 ?auto_320423 ) ) ( not ( = ?auto_320418 ?auto_320424 ) ) ( not ( = ?auto_320418 ?auto_320425 ) ) ( not ( = ?auto_320419 ?auto_320420 ) ) ( not ( = ?auto_320419 ?auto_320421 ) ) ( not ( = ?auto_320419 ?auto_320422 ) ) ( not ( = ?auto_320419 ?auto_320423 ) ) ( not ( = ?auto_320419 ?auto_320424 ) ) ( not ( = ?auto_320419 ?auto_320425 ) ) ( not ( = ?auto_320420 ?auto_320421 ) ) ( not ( = ?auto_320420 ?auto_320422 ) ) ( not ( = ?auto_320420 ?auto_320423 ) ) ( not ( = ?auto_320420 ?auto_320424 ) ) ( not ( = ?auto_320420 ?auto_320425 ) ) ( not ( = ?auto_320421 ?auto_320422 ) ) ( not ( = ?auto_320421 ?auto_320423 ) ) ( not ( = ?auto_320421 ?auto_320424 ) ) ( not ( = ?auto_320421 ?auto_320425 ) ) ( not ( = ?auto_320422 ?auto_320423 ) ) ( not ( = ?auto_320422 ?auto_320424 ) ) ( not ( = ?auto_320422 ?auto_320425 ) ) ( not ( = ?auto_320423 ?auto_320424 ) ) ( not ( = ?auto_320423 ?auto_320425 ) ) ( not ( = ?auto_320424 ?auto_320425 ) ) ( ON ?auto_320423 ?auto_320424 ) ( ON ?auto_320422 ?auto_320423 ) ( ON ?auto_320421 ?auto_320422 ) ( ON ?auto_320420 ?auto_320421 ) ( ON ?auto_320419 ?auto_320420 ) ( ON ?auto_320418 ?auto_320419 ) ( ON ?auto_320417 ?auto_320418 ) ( ON ?auto_320416 ?auto_320417 ) ( CLEAR ?auto_320414 ) ( ON ?auto_320415 ?auto_320416 ) ( CLEAR ?auto_320415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_320413 ?auto_320414 ?auto_320415 )
      ( MAKE-12PILE ?auto_320413 ?auto_320414 ?auto_320415 ?auto_320416 ?auto_320417 ?auto_320418 ?auto_320419 ?auto_320420 ?auto_320421 ?auto_320422 ?auto_320423 ?auto_320424 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320438 - BLOCK
      ?auto_320439 - BLOCK
      ?auto_320440 - BLOCK
      ?auto_320441 - BLOCK
      ?auto_320442 - BLOCK
      ?auto_320443 - BLOCK
      ?auto_320444 - BLOCK
      ?auto_320445 - BLOCK
      ?auto_320446 - BLOCK
      ?auto_320447 - BLOCK
      ?auto_320448 - BLOCK
      ?auto_320449 - BLOCK
    )
    :vars
    (
      ?auto_320450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320449 ?auto_320450 ) ( ON-TABLE ?auto_320438 ) ( not ( = ?auto_320438 ?auto_320439 ) ) ( not ( = ?auto_320438 ?auto_320440 ) ) ( not ( = ?auto_320438 ?auto_320441 ) ) ( not ( = ?auto_320438 ?auto_320442 ) ) ( not ( = ?auto_320438 ?auto_320443 ) ) ( not ( = ?auto_320438 ?auto_320444 ) ) ( not ( = ?auto_320438 ?auto_320445 ) ) ( not ( = ?auto_320438 ?auto_320446 ) ) ( not ( = ?auto_320438 ?auto_320447 ) ) ( not ( = ?auto_320438 ?auto_320448 ) ) ( not ( = ?auto_320438 ?auto_320449 ) ) ( not ( = ?auto_320438 ?auto_320450 ) ) ( not ( = ?auto_320439 ?auto_320440 ) ) ( not ( = ?auto_320439 ?auto_320441 ) ) ( not ( = ?auto_320439 ?auto_320442 ) ) ( not ( = ?auto_320439 ?auto_320443 ) ) ( not ( = ?auto_320439 ?auto_320444 ) ) ( not ( = ?auto_320439 ?auto_320445 ) ) ( not ( = ?auto_320439 ?auto_320446 ) ) ( not ( = ?auto_320439 ?auto_320447 ) ) ( not ( = ?auto_320439 ?auto_320448 ) ) ( not ( = ?auto_320439 ?auto_320449 ) ) ( not ( = ?auto_320439 ?auto_320450 ) ) ( not ( = ?auto_320440 ?auto_320441 ) ) ( not ( = ?auto_320440 ?auto_320442 ) ) ( not ( = ?auto_320440 ?auto_320443 ) ) ( not ( = ?auto_320440 ?auto_320444 ) ) ( not ( = ?auto_320440 ?auto_320445 ) ) ( not ( = ?auto_320440 ?auto_320446 ) ) ( not ( = ?auto_320440 ?auto_320447 ) ) ( not ( = ?auto_320440 ?auto_320448 ) ) ( not ( = ?auto_320440 ?auto_320449 ) ) ( not ( = ?auto_320440 ?auto_320450 ) ) ( not ( = ?auto_320441 ?auto_320442 ) ) ( not ( = ?auto_320441 ?auto_320443 ) ) ( not ( = ?auto_320441 ?auto_320444 ) ) ( not ( = ?auto_320441 ?auto_320445 ) ) ( not ( = ?auto_320441 ?auto_320446 ) ) ( not ( = ?auto_320441 ?auto_320447 ) ) ( not ( = ?auto_320441 ?auto_320448 ) ) ( not ( = ?auto_320441 ?auto_320449 ) ) ( not ( = ?auto_320441 ?auto_320450 ) ) ( not ( = ?auto_320442 ?auto_320443 ) ) ( not ( = ?auto_320442 ?auto_320444 ) ) ( not ( = ?auto_320442 ?auto_320445 ) ) ( not ( = ?auto_320442 ?auto_320446 ) ) ( not ( = ?auto_320442 ?auto_320447 ) ) ( not ( = ?auto_320442 ?auto_320448 ) ) ( not ( = ?auto_320442 ?auto_320449 ) ) ( not ( = ?auto_320442 ?auto_320450 ) ) ( not ( = ?auto_320443 ?auto_320444 ) ) ( not ( = ?auto_320443 ?auto_320445 ) ) ( not ( = ?auto_320443 ?auto_320446 ) ) ( not ( = ?auto_320443 ?auto_320447 ) ) ( not ( = ?auto_320443 ?auto_320448 ) ) ( not ( = ?auto_320443 ?auto_320449 ) ) ( not ( = ?auto_320443 ?auto_320450 ) ) ( not ( = ?auto_320444 ?auto_320445 ) ) ( not ( = ?auto_320444 ?auto_320446 ) ) ( not ( = ?auto_320444 ?auto_320447 ) ) ( not ( = ?auto_320444 ?auto_320448 ) ) ( not ( = ?auto_320444 ?auto_320449 ) ) ( not ( = ?auto_320444 ?auto_320450 ) ) ( not ( = ?auto_320445 ?auto_320446 ) ) ( not ( = ?auto_320445 ?auto_320447 ) ) ( not ( = ?auto_320445 ?auto_320448 ) ) ( not ( = ?auto_320445 ?auto_320449 ) ) ( not ( = ?auto_320445 ?auto_320450 ) ) ( not ( = ?auto_320446 ?auto_320447 ) ) ( not ( = ?auto_320446 ?auto_320448 ) ) ( not ( = ?auto_320446 ?auto_320449 ) ) ( not ( = ?auto_320446 ?auto_320450 ) ) ( not ( = ?auto_320447 ?auto_320448 ) ) ( not ( = ?auto_320447 ?auto_320449 ) ) ( not ( = ?auto_320447 ?auto_320450 ) ) ( not ( = ?auto_320448 ?auto_320449 ) ) ( not ( = ?auto_320448 ?auto_320450 ) ) ( not ( = ?auto_320449 ?auto_320450 ) ) ( ON ?auto_320448 ?auto_320449 ) ( ON ?auto_320447 ?auto_320448 ) ( ON ?auto_320446 ?auto_320447 ) ( ON ?auto_320445 ?auto_320446 ) ( ON ?auto_320444 ?auto_320445 ) ( ON ?auto_320443 ?auto_320444 ) ( ON ?auto_320442 ?auto_320443 ) ( ON ?auto_320441 ?auto_320442 ) ( ON ?auto_320440 ?auto_320441 ) ( CLEAR ?auto_320438 ) ( ON ?auto_320439 ?auto_320440 ) ( CLEAR ?auto_320439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_320438 ?auto_320439 )
      ( MAKE-12PILE ?auto_320438 ?auto_320439 ?auto_320440 ?auto_320441 ?auto_320442 ?auto_320443 ?auto_320444 ?auto_320445 ?auto_320446 ?auto_320447 ?auto_320448 ?auto_320449 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320463 - BLOCK
      ?auto_320464 - BLOCK
      ?auto_320465 - BLOCK
      ?auto_320466 - BLOCK
      ?auto_320467 - BLOCK
      ?auto_320468 - BLOCK
      ?auto_320469 - BLOCK
      ?auto_320470 - BLOCK
      ?auto_320471 - BLOCK
      ?auto_320472 - BLOCK
      ?auto_320473 - BLOCK
      ?auto_320474 - BLOCK
    )
    :vars
    (
      ?auto_320475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320474 ?auto_320475 ) ( ON-TABLE ?auto_320463 ) ( not ( = ?auto_320463 ?auto_320464 ) ) ( not ( = ?auto_320463 ?auto_320465 ) ) ( not ( = ?auto_320463 ?auto_320466 ) ) ( not ( = ?auto_320463 ?auto_320467 ) ) ( not ( = ?auto_320463 ?auto_320468 ) ) ( not ( = ?auto_320463 ?auto_320469 ) ) ( not ( = ?auto_320463 ?auto_320470 ) ) ( not ( = ?auto_320463 ?auto_320471 ) ) ( not ( = ?auto_320463 ?auto_320472 ) ) ( not ( = ?auto_320463 ?auto_320473 ) ) ( not ( = ?auto_320463 ?auto_320474 ) ) ( not ( = ?auto_320463 ?auto_320475 ) ) ( not ( = ?auto_320464 ?auto_320465 ) ) ( not ( = ?auto_320464 ?auto_320466 ) ) ( not ( = ?auto_320464 ?auto_320467 ) ) ( not ( = ?auto_320464 ?auto_320468 ) ) ( not ( = ?auto_320464 ?auto_320469 ) ) ( not ( = ?auto_320464 ?auto_320470 ) ) ( not ( = ?auto_320464 ?auto_320471 ) ) ( not ( = ?auto_320464 ?auto_320472 ) ) ( not ( = ?auto_320464 ?auto_320473 ) ) ( not ( = ?auto_320464 ?auto_320474 ) ) ( not ( = ?auto_320464 ?auto_320475 ) ) ( not ( = ?auto_320465 ?auto_320466 ) ) ( not ( = ?auto_320465 ?auto_320467 ) ) ( not ( = ?auto_320465 ?auto_320468 ) ) ( not ( = ?auto_320465 ?auto_320469 ) ) ( not ( = ?auto_320465 ?auto_320470 ) ) ( not ( = ?auto_320465 ?auto_320471 ) ) ( not ( = ?auto_320465 ?auto_320472 ) ) ( not ( = ?auto_320465 ?auto_320473 ) ) ( not ( = ?auto_320465 ?auto_320474 ) ) ( not ( = ?auto_320465 ?auto_320475 ) ) ( not ( = ?auto_320466 ?auto_320467 ) ) ( not ( = ?auto_320466 ?auto_320468 ) ) ( not ( = ?auto_320466 ?auto_320469 ) ) ( not ( = ?auto_320466 ?auto_320470 ) ) ( not ( = ?auto_320466 ?auto_320471 ) ) ( not ( = ?auto_320466 ?auto_320472 ) ) ( not ( = ?auto_320466 ?auto_320473 ) ) ( not ( = ?auto_320466 ?auto_320474 ) ) ( not ( = ?auto_320466 ?auto_320475 ) ) ( not ( = ?auto_320467 ?auto_320468 ) ) ( not ( = ?auto_320467 ?auto_320469 ) ) ( not ( = ?auto_320467 ?auto_320470 ) ) ( not ( = ?auto_320467 ?auto_320471 ) ) ( not ( = ?auto_320467 ?auto_320472 ) ) ( not ( = ?auto_320467 ?auto_320473 ) ) ( not ( = ?auto_320467 ?auto_320474 ) ) ( not ( = ?auto_320467 ?auto_320475 ) ) ( not ( = ?auto_320468 ?auto_320469 ) ) ( not ( = ?auto_320468 ?auto_320470 ) ) ( not ( = ?auto_320468 ?auto_320471 ) ) ( not ( = ?auto_320468 ?auto_320472 ) ) ( not ( = ?auto_320468 ?auto_320473 ) ) ( not ( = ?auto_320468 ?auto_320474 ) ) ( not ( = ?auto_320468 ?auto_320475 ) ) ( not ( = ?auto_320469 ?auto_320470 ) ) ( not ( = ?auto_320469 ?auto_320471 ) ) ( not ( = ?auto_320469 ?auto_320472 ) ) ( not ( = ?auto_320469 ?auto_320473 ) ) ( not ( = ?auto_320469 ?auto_320474 ) ) ( not ( = ?auto_320469 ?auto_320475 ) ) ( not ( = ?auto_320470 ?auto_320471 ) ) ( not ( = ?auto_320470 ?auto_320472 ) ) ( not ( = ?auto_320470 ?auto_320473 ) ) ( not ( = ?auto_320470 ?auto_320474 ) ) ( not ( = ?auto_320470 ?auto_320475 ) ) ( not ( = ?auto_320471 ?auto_320472 ) ) ( not ( = ?auto_320471 ?auto_320473 ) ) ( not ( = ?auto_320471 ?auto_320474 ) ) ( not ( = ?auto_320471 ?auto_320475 ) ) ( not ( = ?auto_320472 ?auto_320473 ) ) ( not ( = ?auto_320472 ?auto_320474 ) ) ( not ( = ?auto_320472 ?auto_320475 ) ) ( not ( = ?auto_320473 ?auto_320474 ) ) ( not ( = ?auto_320473 ?auto_320475 ) ) ( not ( = ?auto_320474 ?auto_320475 ) ) ( ON ?auto_320473 ?auto_320474 ) ( ON ?auto_320472 ?auto_320473 ) ( ON ?auto_320471 ?auto_320472 ) ( ON ?auto_320470 ?auto_320471 ) ( ON ?auto_320469 ?auto_320470 ) ( ON ?auto_320468 ?auto_320469 ) ( ON ?auto_320467 ?auto_320468 ) ( ON ?auto_320466 ?auto_320467 ) ( ON ?auto_320465 ?auto_320466 ) ( CLEAR ?auto_320463 ) ( ON ?auto_320464 ?auto_320465 ) ( CLEAR ?auto_320464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_320463 ?auto_320464 )
      ( MAKE-12PILE ?auto_320463 ?auto_320464 ?auto_320465 ?auto_320466 ?auto_320467 ?auto_320468 ?auto_320469 ?auto_320470 ?auto_320471 ?auto_320472 ?auto_320473 ?auto_320474 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320488 - BLOCK
      ?auto_320489 - BLOCK
      ?auto_320490 - BLOCK
      ?auto_320491 - BLOCK
      ?auto_320492 - BLOCK
      ?auto_320493 - BLOCK
      ?auto_320494 - BLOCK
      ?auto_320495 - BLOCK
      ?auto_320496 - BLOCK
      ?auto_320497 - BLOCK
      ?auto_320498 - BLOCK
      ?auto_320499 - BLOCK
    )
    :vars
    (
      ?auto_320500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320499 ?auto_320500 ) ( not ( = ?auto_320488 ?auto_320489 ) ) ( not ( = ?auto_320488 ?auto_320490 ) ) ( not ( = ?auto_320488 ?auto_320491 ) ) ( not ( = ?auto_320488 ?auto_320492 ) ) ( not ( = ?auto_320488 ?auto_320493 ) ) ( not ( = ?auto_320488 ?auto_320494 ) ) ( not ( = ?auto_320488 ?auto_320495 ) ) ( not ( = ?auto_320488 ?auto_320496 ) ) ( not ( = ?auto_320488 ?auto_320497 ) ) ( not ( = ?auto_320488 ?auto_320498 ) ) ( not ( = ?auto_320488 ?auto_320499 ) ) ( not ( = ?auto_320488 ?auto_320500 ) ) ( not ( = ?auto_320489 ?auto_320490 ) ) ( not ( = ?auto_320489 ?auto_320491 ) ) ( not ( = ?auto_320489 ?auto_320492 ) ) ( not ( = ?auto_320489 ?auto_320493 ) ) ( not ( = ?auto_320489 ?auto_320494 ) ) ( not ( = ?auto_320489 ?auto_320495 ) ) ( not ( = ?auto_320489 ?auto_320496 ) ) ( not ( = ?auto_320489 ?auto_320497 ) ) ( not ( = ?auto_320489 ?auto_320498 ) ) ( not ( = ?auto_320489 ?auto_320499 ) ) ( not ( = ?auto_320489 ?auto_320500 ) ) ( not ( = ?auto_320490 ?auto_320491 ) ) ( not ( = ?auto_320490 ?auto_320492 ) ) ( not ( = ?auto_320490 ?auto_320493 ) ) ( not ( = ?auto_320490 ?auto_320494 ) ) ( not ( = ?auto_320490 ?auto_320495 ) ) ( not ( = ?auto_320490 ?auto_320496 ) ) ( not ( = ?auto_320490 ?auto_320497 ) ) ( not ( = ?auto_320490 ?auto_320498 ) ) ( not ( = ?auto_320490 ?auto_320499 ) ) ( not ( = ?auto_320490 ?auto_320500 ) ) ( not ( = ?auto_320491 ?auto_320492 ) ) ( not ( = ?auto_320491 ?auto_320493 ) ) ( not ( = ?auto_320491 ?auto_320494 ) ) ( not ( = ?auto_320491 ?auto_320495 ) ) ( not ( = ?auto_320491 ?auto_320496 ) ) ( not ( = ?auto_320491 ?auto_320497 ) ) ( not ( = ?auto_320491 ?auto_320498 ) ) ( not ( = ?auto_320491 ?auto_320499 ) ) ( not ( = ?auto_320491 ?auto_320500 ) ) ( not ( = ?auto_320492 ?auto_320493 ) ) ( not ( = ?auto_320492 ?auto_320494 ) ) ( not ( = ?auto_320492 ?auto_320495 ) ) ( not ( = ?auto_320492 ?auto_320496 ) ) ( not ( = ?auto_320492 ?auto_320497 ) ) ( not ( = ?auto_320492 ?auto_320498 ) ) ( not ( = ?auto_320492 ?auto_320499 ) ) ( not ( = ?auto_320492 ?auto_320500 ) ) ( not ( = ?auto_320493 ?auto_320494 ) ) ( not ( = ?auto_320493 ?auto_320495 ) ) ( not ( = ?auto_320493 ?auto_320496 ) ) ( not ( = ?auto_320493 ?auto_320497 ) ) ( not ( = ?auto_320493 ?auto_320498 ) ) ( not ( = ?auto_320493 ?auto_320499 ) ) ( not ( = ?auto_320493 ?auto_320500 ) ) ( not ( = ?auto_320494 ?auto_320495 ) ) ( not ( = ?auto_320494 ?auto_320496 ) ) ( not ( = ?auto_320494 ?auto_320497 ) ) ( not ( = ?auto_320494 ?auto_320498 ) ) ( not ( = ?auto_320494 ?auto_320499 ) ) ( not ( = ?auto_320494 ?auto_320500 ) ) ( not ( = ?auto_320495 ?auto_320496 ) ) ( not ( = ?auto_320495 ?auto_320497 ) ) ( not ( = ?auto_320495 ?auto_320498 ) ) ( not ( = ?auto_320495 ?auto_320499 ) ) ( not ( = ?auto_320495 ?auto_320500 ) ) ( not ( = ?auto_320496 ?auto_320497 ) ) ( not ( = ?auto_320496 ?auto_320498 ) ) ( not ( = ?auto_320496 ?auto_320499 ) ) ( not ( = ?auto_320496 ?auto_320500 ) ) ( not ( = ?auto_320497 ?auto_320498 ) ) ( not ( = ?auto_320497 ?auto_320499 ) ) ( not ( = ?auto_320497 ?auto_320500 ) ) ( not ( = ?auto_320498 ?auto_320499 ) ) ( not ( = ?auto_320498 ?auto_320500 ) ) ( not ( = ?auto_320499 ?auto_320500 ) ) ( ON ?auto_320498 ?auto_320499 ) ( ON ?auto_320497 ?auto_320498 ) ( ON ?auto_320496 ?auto_320497 ) ( ON ?auto_320495 ?auto_320496 ) ( ON ?auto_320494 ?auto_320495 ) ( ON ?auto_320493 ?auto_320494 ) ( ON ?auto_320492 ?auto_320493 ) ( ON ?auto_320491 ?auto_320492 ) ( ON ?auto_320490 ?auto_320491 ) ( ON ?auto_320489 ?auto_320490 ) ( ON ?auto_320488 ?auto_320489 ) ( CLEAR ?auto_320488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_320488 )
      ( MAKE-12PILE ?auto_320488 ?auto_320489 ?auto_320490 ?auto_320491 ?auto_320492 ?auto_320493 ?auto_320494 ?auto_320495 ?auto_320496 ?auto_320497 ?auto_320498 ?auto_320499 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_320513 - BLOCK
      ?auto_320514 - BLOCK
      ?auto_320515 - BLOCK
      ?auto_320516 - BLOCK
      ?auto_320517 - BLOCK
      ?auto_320518 - BLOCK
      ?auto_320519 - BLOCK
      ?auto_320520 - BLOCK
      ?auto_320521 - BLOCK
      ?auto_320522 - BLOCK
      ?auto_320523 - BLOCK
      ?auto_320524 - BLOCK
    )
    :vars
    (
      ?auto_320525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320524 ?auto_320525 ) ( not ( = ?auto_320513 ?auto_320514 ) ) ( not ( = ?auto_320513 ?auto_320515 ) ) ( not ( = ?auto_320513 ?auto_320516 ) ) ( not ( = ?auto_320513 ?auto_320517 ) ) ( not ( = ?auto_320513 ?auto_320518 ) ) ( not ( = ?auto_320513 ?auto_320519 ) ) ( not ( = ?auto_320513 ?auto_320520 ) ) ( not ( = ?auto_320513 ?auto_320521 ) ) ( not ( = ?auto_320513 ?auto_320522 ) ) ( not ( = ?auto_320513 ?auto_320523 ) ) ( not ( = ?auto_320513 ?auto_320524 ) ) ( not ( = ?auto_320513 ?auto_320525 ) ) ( not ( = ?auto_320514 ?auto_320515 ) ) ( not ( = ?auto_320514 ?auto_320516 ) ) ( not ( = ?auto_320514 ?auto_320517 ) ) ( not ( = ?auto_320514 ?auto_320518 ) ) ( not ( = ?auto_320514 ?auto_320519 ) ) ( not ( = ?auto_320514 ?auto_320520 ) ) ( not ( = ?auto_320514 ?auto_320521 ) ) ( not ( = ?auto_320514 ?auto_320522 ) ) ( not ( = ?auto_320514 ?auto_320523 ) ) ( not ( = ?auto_320514 ?auto_320524 ) ) ( not ( = ?auto_320514 ?auto_320525 ) ) ( not ( = ?auto_320515 ?auto_320516 ) ) ( not ( = ?auto_320515 ?auto_320517 ) ) ( not ( = ?auto_320515 ?auto_320518 ) ) ( not ( = ?auto_320515 ?auto_320519 ) ) ( not ( = ?auto_320515 ?auto_320520 ) ) ( not ( = ?auto_320515 ?auto_320521 ) ) ( not ( = ?auto_320515 ?auto_320522 ) ) ( not ( = ?auto_320515 ?auto_320523 ) ) ( not ( = ?auto_320515 ?auto_320524 ) ) ( not ( = ?auto_320515 ?auto_320525 ) ) ( not ( = ?auto_320516 ?auto_320517 ) ) ( not ( = ?auto_320516 ?auto_320518 ) ) ( not ( = ?auto_320516 ?auto_320519 ) ) ( not ( = ?auto_320516 ?auto_320520 ) ) ( not ( = ?auto_320516 ?auto_320521 ) ) ( not ( = ?auto_320516 ?auto_320522 ) ) ( not ( = ?auto_320516 ?auto_320523 ) ) ( not ( = ?auto_320516 ?auto_320524 ) ) ( not ( = ?auto_320516 ?auto_320525 ) ) ( not ( = ?auto_320517 ?auto_320518 ) ) ( not ( = ?auto_320517 ?auto_320519 ) ) ( not ( = ?auto_320517 ?auto_320520 ) ) ( not ( = ?auto_320517 ?auto_320521 ) ) ( not ( = ?auto_320517 ?auto_320522 ) ) ( not ( = ?auto_320517 ?auto_320523 ) ) ( not ( = ?auto_320517 ?auto_320524 ) ) ( not ( = ?auto_320517 ?auto_320525 ) ) ( not ( = ?auto_320518 ?auto_320519 ) ) ( not ( = ?auto_320518 ?auto_320520 ) ) ( not ( = ?auto_320518 ?auto_320521 ) ) ( not ( = ?auto_320518 ?auto_320522 ) ) ( not ( = ?auto_320518 ?auto_320523 ) ) ( not ( = ?auto_320518 ?auto_320524 ) ) ( not ( = ?auto_320518 ?auto_320525 ) ) ( not ( = ?auto_320519 ?auto_320520 ) ) ( not ( = ?auto_320519 ?auto_320521 ) ) ( not ( = ?auto_320519 ?auto_320522 ) ) ( not ( = ?auto_320519 ?auto_320523 ) ) ( not ( = ?auto_320519 ?auto_320524 ) ) ( not ( = ?auto_320519 ?auto_320525 ) ) ( not ( = ?auto_320520 ?auto_320521 ) ) ( not ( = ?auto_320520 ?auto_320522 ) ) ( not ( = ?auto_320520 ?auto_320523 ) ) ( not ( = ?auto_320520 ?auto_320524 ) ) ( not ( = ?auto_320520 ?auto_320525 ) ) ( not ( = ?auto_320521 ?auto_320522 ) ) ( not ( = ?auto_320521 ?auto_320523 ) ) ( not ( = ?auto_320521 ?auto_320524 ) ) ( not ( = ?auto_320521 ?auto_320525 ) ) ( not ( = ?auto_320522 ?auto_320523 ) ) ( not ( = ?auto_320522 ?auto_320524 ) ) ( not ( = ?auto_320522 ?auto_320525 ) ) ( not ( = ?auto_320523 ?auto_320524 ) ) ( not ( = ?auto_320523 ?auto_320525 ) ) ( not ( = ?auto_320524 ?auto_320525 ) ) ( ON ?auto_320523 ?auto_320524 ) ( ON ?auto_320522 ?auto_320523 ) ( ON ?auto_320521 ?auto_320522 ) ( ON ?auto_320520 ?auto_320521 ) ( ON ?auto_320519 ?auto_320520 ) ( ON ?auto_320518 ?auto_320519 ) ( ON ?auto_320517 ?auto_320518 ) ( ON ?auto_320516 ?auto_320517 ) ( ON ?auto_320515 ?auto_320516 ) ( ON ?auto_320514 ?auto_320515 ) ( ON ?auto_320513 ?auto_320514 ) ( CLEAR ?auto_320513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_320513 )
      ( MAKE-12PILE ?auto_320513 ?auto_320514 ?auto_320515 ?auto_320516 ?auto_320517 ?auto_320518 ?auto_320519 ?auto_320520 ?auto_320521 ?auto_320522 ?auto_320523 ?auto_320524 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320539 - BLOCK
      ?auto_320540 - BLOCK
      ?auto_320541 - BLOCK
      ?auto_320542 - BLOCK
      ?auto_320543 - BLOCK
      ?auto_320544 - BLOCK
      ?auto_320545 - BLOCK
      ?auto_320546 - BLOCK
      ?auto_320547 - BLOCK
      ?auto_320548 - BLOCK
      ?auto_320549 - BLOCK
      ?auto_320550 - BLOCK
      ?auto_320551 - BLOCK
    )
    :vars
    (
      ?auto_320552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_320550 ) ( ON ?auto_320551 ?auto_320552 ) ( CLEAR ?auto_320551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_320539 ) ( ON ?auto_320540 ?auto_320539 ) ( ON ?auto_320541 ?auto_320540 ) ( ON ?auto_320542 ?auto_320541 ) ( ON ?auto_320543 ?auto_320542 ) ( ON ?auto_320544 ?auto_320543 ) ( ON ?auto_320545 ?auto_320544 ) ( ON ?auto_320546 ?auto_320545 ) ( ON ?auto_320547 ?auto_320546 ) ( ON ?auto_320548 ?auto_320547 ) ( ON ?auto_320549 ?auto_320548 ) ( ON ?auto_320550 ?auto_320549 ) ( not ( = ?auto_320539 ?auto_320540 ) ) ( not ( = ?auto_320539 ?auto_320541 ) ) ( not ( = ?auto_320539 ?auto_320542 ) ) ( not ( = ?auto_320539 ?auto_320543 ) ) ( not ( = ?auto_320539 ?auto_320544 ) ) ( not ( = ?auto_320539 ?auto_320545 ) ) ( not ( = ?auto_320539 ?auto_320546 ) ) ( not ( = ?auto_320539 ?auto_320547 ) ) ( not ( = ?auto_320539 ?auto_320548 ) ) ( not ( = ?auto_320539 ?auto_320549 ) ) ( not ( = ?auto_320539 ?auto_320550 ) ) ( not ( = ?auto_320539 ?auto_320551 ) ) ( not ( = ?auto_320539 ?auto_320552 ) ) ( not ( = ?auto_320540 ?auto_320541 ) ) ( not ( = ?auto_320540 ?auto_320542 ) ) ( not ( = ?auto_320540 ?auto_320543 ) ) ( not ( = ?auto_320540 ?auto_320544 ) ) ( not ( = ?auto_320540 ?auto_320545 ) ) ( not ( = ?auto_320540 ?auto_320546 ) ) ( not ( = ?auto_320540 ?auto_320547 ) ) ( not ( = ?auto_320540 ?auto_320548 ) ) ( not ( = ?auto_320540 ?auto_320549 ) ) ( not ( = ?auto_320540 ?auto_320550 ) ) ( not ( = ?auto_320540 ?auto_320551 ) ) ( not ( = ?auto_320540 ?auto_320552 ) ) ( not ( = ?auto_320541 ?auto_320542 ) ) ( not ( = ?auto_320541 ?auto_320543 ) ) ( not ( = ?auto_320541 ?auto_320544 ) ) ( not ( = ?auto_320541 ?auto_320545 ) ) ( not ( = ?auto_320541 ?auto_320546 ) ) ( not ( = ?auto_320541 ?auto_320547 ) ) ( not ( = ?auto_320541 ?auto_320548 ) ) ( not ( = ?auto_320541 ?auto_320549 ) ) ( not ( = ?auto_320541 ?auto_320550 ) ) ( not ( = ?auto_320541 ?auto_320551 ) ) ( not ( = ?auto_320541 ?auto_320552 ) ) ( not ( = ?auto_320542 ?auto_320543 ) ) ( not ( = ?auto_320542 ?auto_320544 ) ) ( not ( = ?auto_320542 ?auto_320545 ) ) ( not ( = ?auto_320542 ?auto_320546 ) ) ( not ( = ?auto_320542 ?auto_320547 ) ) ( not ( = ?auto_320542 ?auto_320548 ) ) ( not ( = ?auto_320542 ?auto_320549 ) ) ( not ( = ?auto_320542 ?auto_320550 ) ) ( not ( = ?auto_320542 ?auto_320551 ) ) ( not ( = ?auto_320542 ?auto_320552 ) ) ( not ( = ?auto_320543 ?auto_320544 ) ) ( not ( = ?auto_320543 ?auto_320545 ) ) ( not ( = ?auto_320543 ?auto_320546 ) ) ( not ( = ?auto_320543 ?auto_320547 ) ) ( not ( = ?auto_320543 ?auto_320548 ) ) ( not ( = ?auto_320543 ?auto_320549 ) ) ( not ( = ?auto_320543 ?auto_320550 ) ) ( not ( = ?auto_320543 ?auto_320551 ) ) ( not ( = ?auto_320543 ?auto_320552 ) ) ( not ( = ?auto_320544 ?auto_320545 ) ) ( not ( = ?auto_320544 ?auto_320546 ) ) ( not ( = ?auto_320544 ?auto_320547 ) ) ( not ( = ?auto_320544 ?auto_320548 ) ) ( not ( = ?auto_320544 ?auto_320549 ) ) ( not ( = ?auto_320544 ?auto_320550 ) ) ( not ( = ?auto_320544 ?auto_320551 ) ) ( not ( = ?auto_320544 ?auto_320552 ) ) ( not ( = ?auto_320545 ?auto_320546 ) ) ( not ( = ?auto_320545 ?auto_320547 ) ) ( not ( = ?auto_320545 ?auto_320548 ) ) ( not ( = ?auto_320545 ?auto_320549 ) ) ( not ( = ?auto_320545 ?auto_320550 ) ) ( not ( = ?auto_320545 ?auto_320551 ) ) ( not ( = ?auto_320545 ?auto_320552 ) ) ( not ( = ?auto_320546 ?auto_320547 ) ) ( not ( = ?auto_320546 ?auto_320548 ) ) ( not ( = ?auto_320546 ?auto_320549 ) ) ( not ( = ?auto_320546 ?auto_320550 ) ) ( not ( = ?auto_320546 ?auto_320551 ) ) ( not ( = ?auto_320546 ?auto_320552 ) ) ( not ( = ?auto_320547 ?auto_320548 ) ) ( not ( = ?auto_320547 ?auto_320549 ) ) ( not ( = ?auto_320547 ?auto_320550 ) ) ( not ( = ?auto_320547 ?auto_320551 ) ) ( not ( = ?auto_320547 ?auto_320552 ) ) ( not ( = ?auto_320548 ?auto_320549 ) ) ( not ( = ?auto_320548 ?auto_320550 ) ) ( not ( = ?auto_320548 ?auto_320551 ) ) ( not ( = ?auto_320548 ?auto_320552 ) ) ( not ( = ?auto_320549 ?auto_320550 ) ) ( not ( = ?auto_320549 ?auto_320551 ) ) ( not ( = ?auto_320549 ?auto_320552 ) ) ( not ( = ?auto_320550 ?auto_320551 ) ) ( not ( = ?auto_320550 ?auto_320552 ) ) ( not ( = ?auto_320551 ?auto_320552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_320551 ?auto_320552 )
      ( !STACK ?auto_320551 ?auto_320550 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320566 - BLOCK
      ?auto_320567 - BLOCK
      ?auto_320568 - BLOCK
      ?auto_320569 - BLOCK
      ?auto_320570 - BLOCK
      ?auto_320571 - BLOCK
      ?auto_320572 - BLOCK
      ?auto_320573 - BLOCK
      ?auto_320574 - BLOCK
      ?auto_320575 - BLOCK
      ?auto_320576 - BLOCK
      ?auto_320577 - BLOCK
      ?auto_320578 - BLOCK
    )
    :vars
    (
      ?auto_320579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_320577 ) ( ON ?auto_320578 ?auto_320579 ) ( CLEAR ?auto_320578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_320566 ) ( ON ?auto_320567 ?auto_320566 ) ( ON ?auto_320568 ?auto_320567 ) ( ON ?auto_320569 ?auto_320568 ) ( ON ?auto_320570 ?auto_320569 ) ( ON ?auto_320571 ?auto_320570 ) ( ON ?auto_320572 ?auto_320571 ) ( ON ?auto_320573 ?auto_320572 ) ( ON ?auto_320574 ?auto_320573 ) ( ON ?auto_320575 ?auto_320574 ) ( ON ?auto_320576 ?auto_320575 ) ( ON ?auto_320577 ?auto_320576 ) ( not ( = ?auto_320566 ?auto_320567 ) ) ( not ( = ?auto_320566 ?auto_320568 ) ) ( not ( = ?auto_320566 ?auto_320569 ) ) ( not ( = ?auto_320566 ?auto_320570 ) ) ( not ( = ?auto_320566 ?auto_320571 ) ) ( not ( = ?auto_320566 ?auto_320572 ) ) ( not ( = ?auto_320566 ?auto_320573 ) ) ( not ( = ?auto_320566 ?auto_320574 ) ) ( not ( = ?auto_320566 ?auto_320575 ) ) ( not ( = ?auto_320566 ?auto_320576 ) ) ( not ( = ?auto_320566 ?auto_320577 ) ) ( not ( = ?auto_320566 ?auto_320578 ) ) ( not ( = ?auto_320566 ?auto_320579 ) ) ( not ( = ?auto_320567 ?auto_320568 ) ) ( not ( = ?auto_320567 ?auto_320569 ) ) ( not ( = ?auto_320567 ?auto_320570 ) ) ( not ( = ?auto_320567 ?auto_320571 ) ) ( not ( = ?auto_320567 ?auto_320572 ) ) ( not ( = ?auto_320567 ?auto_320573 ) ) ( not ( = ?auto_320567 ?auto_320574 ) ) ( not ( = ?auto_320567 ?auto_320575 ) ) ( not ( = ?auto_320567 ?auto_320576 ) ) ( not ( = ?auto_320567 ?auto_320577 ) ) ( not ( = ?auto_320567 ?auto_320578 ) ) ( not ( = ?auto_320567 ?auto_320579 ) ) ( not ( = ?auto_320568 ?auto_320569 ) ) ( not ( = ?auto_320568 ?auto_320570 ) ) ( not ( = ?auto_320568 ?auto_320571 ) ) ( not ( = ?auto_320568 ?auto_320572 ) ) ( not ( = ?auto_320568 ?auto_320573 ) ) ( not ( = ?auto_320568 ?auto_320574 ) ) ( not ( = ?auto_320568 ?auto_320575 ) ) ( not ( = ?auto_320568 ?auto_320576 ) ) ( not ( = ?auto_320568 ?auto_320577 ) ) ( not ( = ?auto_320568 ?auto_320578 ) ) ( not ( = ?auto_320568 ?auto_320579 ) ) ( not ( = ?auto_320569 ?auto_320570 ) ) ( not ( = ?auto_320569 ?auto_320571 ) ) ( not ( = ?auto_320569 ?auto_320572 ) ) ( not ( = ?auto_320569 ?auto_320573 ) ) ( not ( = ?auto_320569 ?auto_320574 ) ) ( not ( = ?auto_320569 ?auto_320575 ) ) ( not ( = ?auto_320569 ?auto_320576 ) ) ( not ( = ?auto_320569 ?auto_320577 ) ) ( not ( = ?auto_320569 ?auto_320578 ) ) ( not ( = ?auto_320569 ?auto_320579 ) ) ( not ( = ?auto_320570 ?auto_320571 ) ) ( not ( = ?auto_320570 ?auto_320572 ) ) ( not ( = ?auto_320570 ?auto_320573 ) ) ( not ( = ?auto_320570 ?auto_320574 ) ) ( not ( = ?auto_320570 ?auto_320575 ) ) ( not ( = ?auto_320570 ?auto_320576 ) ) ( not ( = ?auto_320570 ?auto_320577 ) ) ( not ( = ?auto_320570 ?auto_320578 ) ) ( not ( = ?auto_320570 ?auto_320579 ) ) ( not ( = ?auto_320571 ?auto_320572 ) ) ( not ( = ?auto_320571 ?auto_320573 ) ) ( not ( = ?auto_320571 ?auto_320574 ) ) ( not ( = ?auto_320571 ?auto_320575 ) ) ( not ( = ?auto_320571 ?auto_320576 ) ) ( not ( = ?auto_320571 ?auto_320577 ) ) ( not ( = ?auto_320571 ?auto_320578 ) ) ( not ( = ?auto_320571 ?auto_320579 ) ) ( not ( = ?auto_320572 ?auto_320573 ) ) ( not ( = ?auto_320572 ?auto_320574 ) ) ( not ( = ?auto_320572 ?auto_320575 ) ) ( not ( = ?auto_320572 ?auto_320576 ) ) ( not ( = ?auto_320572 ?auto_320577 ) ) ( not ( = ?auto_320572 ?auto_320578 ) ) ( not ( = ?auto_320572 ?auto_320579 ) ) ( not ( = ?auto_320573 ?auto_320574 ) ) ( not ( = ?auto_320573 ?auto_320575 ) ) ( not ( = ?auto_320573 ?auto_320576 ) ) ( not ( = ?auto_320573 ?auto_320577 ) ) ( not ( = ?auto_320573 ?auto_320578 ) ) ( not ( = ?auto_320573 ?auto_320579 ) ) ( not ( = ?auto_320574 ?auto_320575 ) ) ( not ( = ?auto_320574 ?auto_320576 ) ) ( not ( = ?auto_320574 ?auto_320577 ) ) ( not ( = ?auto_320574 ?auto_320578 ) ) ( not ( = ?auto_320574 ?auto_320579 ) ) ( not ( = ?auto_320575 ?auto_320576 ) ) ( not ( = ?auto_320575 ?auto_320577 ) ) ( not ( = ?auto_320575 ?auto_320578 ) ) ( not ( = ?auto_320575 ?auto_320579 ) ) ( not ( = ?auto_320576 ?auto_320577 ) ) ( not ( = ?auto_320576 ?auto_320578 ) ) ( not ( = ?auto_320576 ?auto_320579 ) ) ( not ( = ?auto_320577 ?auto_320578 ) ) ( not ( = ?auto_320577 ?auto_320579 ) ) ( not ( = ?auto_320578 ?auto_320579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_320578 ?auto_320579 )
      ( !STACK ?auto_320578 ?auto_320577 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320593 - BLOCK
      ?auto_320594 - BLOCK
      ?auto_320595 - BLOCK
      ?auto_320596 - BLOCK
      ?auto_320597 - BLOCK
      ?auto_320598 - BLOCK
      ?auto_320599 - BLOCK
      ?auto_320600 - BLOCK
      ?auto_320601 - BLOCK
      ?auto_320602 - BLOCK
      ?auto_320603 - BLOCK
      ?auto_320604 - BLOCK
      ?auto_320605 - BLOCK
    )
    :vars
    (
      ?auto_320606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320605 ?auto_320606 ) ( ON-TABLE ?auto_320593 ) ( ON ?auto_320594 ?auto_320593 ) ( ON ?auto_320595 ?auto_320594 ) ( ON ?auto_320596 ?auto_320595 ) ( ON ?auto_320597 ?auto_320596 ) ( ON ?auto_320598 ?auto_320597 ) ( ON ?auto_320599 ?auto_320598 ) ( ON ?auto_320600 ?auto_320599 ) ( ON ?auto_320601 ?auto_320600 ) ( ON ?auto_320602 ?auto_320601 ) ( ON ?auto_320603 ?auto_320602 ) ( not ( = ?auto_320593 ?auto_320594 ) ) ( not ( = ?auto_320593 ?auto_320595 ) ) ( not ( = ?auto_320593 ?auto_320596 ) ) ( not ( = ?auto_320593 ?auto_320597 ) ) ( not ( = ?auto_320593 ?auto_320598 ) ) ( not ( = ?auto_320593 ?auto_320599 ) ) ( not ( = ?auto_320593 ?auto_320600 ) ) ( not ( = ?auto_320593 ?auto_320601 ) ) ( not ( = ?auto_320593 ?auto_320602 ) ) ( not ( = ?auto_320593 ?auto_320603 ) ) ( not ( = ?auto_320593 ?auto_320604 ) ) ( not ( = ?auto_320593 ?auto_320605 ) ) ( not ( = ?auto_320593 ?auto_320606 ) ) ( not ( = ?auto_320594 ?auto_320595 ) ) ( not ( = ?auto_320594 ?auto_320596 ) ) ( not ( = ?auto_320594 ?auto_320597 ) ) ( not ( = ?auto_320594 ?auto_320598 ) ) ( not ( = ?auto_320594 ?auto_320599 ) ) ( not ( = ?auto_320594 ?auto_320600 ) ) ( not ( = ?auto_320594 ?auto_320601 ) ) ( not ( = ?auto_320594 ?auto_320602 ) ) ( not ( = ?auto_320594 ?auto_320603 ) ) ( not ( = ?auto_320594 ?auto_320604 ) ) ( not ( = ?auto_320594 ?auto_320605 ) ) ( not ( = ?auto_320594 ?auto_320606 ) ) ( not ( = ?auto_320595 ?auto_320596 ) ) ( not ( = ?auto_320595 ?auto_320597 ) ) ( not ( = ?auto_320595 ?auto_320598 ) ) ( not ( = ?auto_320595 ?auto_320599 ) ) ( not ( = ?auto_320595 ?auto_320600 ) ) ( not ( = ?auto_320595 ?auto_320601 ) ) ( not ( = ?auto_320595 ?auto_320602 ) ) ( not ( = ?auto_320595 ?auto_320603 ) ) ( not ( = ?auto_320595 ?auto_320604 ) ) ( not ( = ?auto_320595 ?auto_320605 ) ) ( not ( = ?auto_320595 ?auto_320606 ) ) ( not ( = ?auto_320596 ?auto_320597 ) ) ( not ( = ?auto_320596 ?auto_320598 ) ) ( not ( = ?auto_320596 ?auto_320599 ) ) ( not ( = ?auto_320596 ?auto_320600 ) ) ( not ( = ?auto_320596 ?auto_320601 ) ) ( not ( = ?auto_320596 ?auto_320602 ) ) ( not ( = ?auto_320596 ?auto_320603 ) ) ( not ( = ?auto_320596 ?auto_320604 ) ) ( not ( = ?auto_320596 ?auto_320605 ) ) ( not ( = ?auto_320596 ?auto_320606 ) ) ( not ( = ?auto_320597 ?auto_320598 ) ) ( not ( = ?auto_320597 ?auto_320599 ) ) ( not ( = ?auto_320597 ?auto_320600 ) ) ( not ( = ?auto_320597 ?auto_320601 ) ) ( not ( = ?auto_320597 ?auto_320602 ) ) ( not ( = ?auto_320597 ?auto_320603 ) ) ( not ( = ?auto_320597 ?auto_320604 ) ) ( not ( = ?auto_320597 ?auto_320605 ) ) ( not ( = ?auto_320597 ?auto_320606 ) ) ( not ( = ?auto_320598 ?auto_320599 ) ) ( not ( = ?auto_320598 ?auto_320600 ) ) ( not ( = ?auto_320598 ?auto_320601 ) ) ( not ( = ?auto_320598 ?auto_320602 ) ) ( not ( = ?auto_320598 ?auto_320603 ) ) ( not ( = ?auto_320598 ?auto_320604 ) ) ( not ( = ?auto_320598 ?auto_320605 ) ) ( not ( = ?auto_320598 ?auto_320606 ) ) ( not ( = ?auto_320599 ?auto_320600 ) ) ( not ( = ?auto_320599 ?auto_320601 ) ) ( not ( = ?auto_320599 ?auto_320602 ) ) ( not ( = ?auto_320599 ?auto_320603 ) ) ( not ( = ?auto_320599 ?auto_320604 ) ) ( not ( = ?auto_320599 ?auto_320605 ) ) ( not ( = ?auto_320599 ?auto_320606 ) ) ( not ( = ?auto_320600 ?auto_320601 ) ) ( not ( = ?auto_320600 ?auto_320602 ) ) ( not ( = ?auto_320600 ?auto_320603 ) ) ( not ( = ?auto_320600 ?auto_320604 ) ) ( not ( = ?auto_320600 ?auto_320605 ) ) ( not ( = ?auto_320600 ?auto_320606 ) ) ( not ( = ?auto_320601 ?auto_320602 ) ) ( not ( = ?auto_320601 ?auto_320603 ) ) ( not ( = ?auto_320601 ?auto_320604 ) ) ( not ( = ?auto_320601 ?auto_320605 ) ) ( not ( = ?auto_320601 ?auto_320606 ) ) ( not ( = ?auto_320602 ?auto_320603 ) ) ( not ( = ?auto_320602 ?auto_320604 ) ) ( not ( = ?auto_320602 ?auto_320605 ) ) ( not ( = ?auto_320602 ?auto_320606 ) ) ( not ( = ?auto_320603 ?auto_320604 ) ) ( not ( = ?auto_320603 ?auto_320605 ) ) ( not ( = ?auto_320603 ?auto_320606 ) ) ( not ( = ?auto_320604 ?auto_320605 ) ) ( not ( = ?auto_320604 ?auto_320606 ) ) ( not ( = ?auto_320605 ?auto_320606 ) ) ( CLEAR ?auto_320603 ) ( ON ?auto_320604 ?auto_320605 ) ( CLEAR ?auto_320604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_320593 ?auto_320594 ?auto_320595 ?auto_320596 ?auto_320597 ?auto_320598 ?auto_320599 ?auto_320600 ?auto_320601 ?auto_320602 ?auto_320603 ?auto_320604 )
      ( MAKE-13PILE ?auto_320593 ?auto_320594 ?auto_320595 ?auto_320596 ?auto_320597 ?auto_320598 ?auto_320599 ?auto_320600 ?auto_320601 ?auto_320602 ?auto_320603 ?auto_320604 ?auto_320605 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320620 - BLOCK
      ?auto_320621 - BLOCK
      ?auto_320622 - BLOCK
      ?auto_320623 - BLOCK
      ?auto_320624 - BLOCK
      ?auto_320625 - BLOCK
      ?auto_320626 - BLOCK
      ?auto_320627 - BLOCK
      ?auto_320628 - BLOCK
      ?auto_320629 - BLOCK
      ?auto_320630 - BLOCK
      ?auto_320631 - BLOCK
      ?auto_320632 - BLOCK
    )
    :vars
    (
      ?auto_320633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320632 ?auto_320633 ) ( ON-TABLE ?auto_320620 ) ( ON ?auto_320621 ?auto_320620 ) ( ON ?auto_320622 ?auto_320621 ) ( ON ?auto_320623 ?auto_320622 ) ( ON ?auto_320624 ?auto_320623 ) ( ON ?auto_320625 ?auto_320624 ) ( ON ?auto_320626 ?auto_320625 ) ( ON ?auto_320627 ?auto_320626 ) ( ON ?auto_320628 ?auto_320627 ) ( ON ?auto_320629 ?auto_320628 ) ( ON ?auto_320630 ?auto_320629 ) ( not ( = ?auto_320620 ?auto_320621 ) ) ( not ( = ?auto_320620 ?auto_320622 ) ) ( not ( = ?auto_320620 ?auto_320623 ) ) ( not ( = ?auto_320620 ?auto_320624 ) ) ( not ( = ?auto_320620 ?auto_320625 ) ) ( not ( = ?auto_320620 ?auto_320626 ) ) ( not ( = ?auto_320620 ?auto_320627 ) ) ( not ( = ?auto_320620 ?auto_320628 ) ) ( not ( = ?auto_320620 ?auto_320629 ) ) ( not ( = ?auto_320620 ?auto_320630 ) ) ( not ( = ?auto_320620 ?auto_320631 ) ) ( not ( = ?auto_320620 ?auto_320632 ) ) ( not ( = ?auto_320620 ?auto_320633 ) ) ( not ( = ?auto_320621 ?auto_320622 ) ) ( not ( = ?auto_320621 ?auto_320623 ) ) ( not ( = ?auto_320621 ?auto_320624 ) ) ( not ( = ?auto_320621 ?auto_320625 ) ) ( not ( = ?auto_320621 ?auto_320626 ) ) ( not ( = ?auto_320621 ?auto_320627 ) ) ( not ( = ?auto_320621 ?auto_320628 ) ) ( not ( = ?auto_320621 ?auto_320629 ) ) ( not ( = ?auto_320621 ?auto_320630 ) ) ( not ( = ?auto_320621 ?auto_320631 ) ) ( not ( = ?auto_320621 ?auto_320632 ) ) ( not ( = ?auto_320621 ?auto_320633 ) ) ( not ( = ?auto_320622 ?auto_320623 ) ) ( not ( = ?auto_320622 ?auto_320624 ) ) ( not ( = ?auto_320622 ?auto_320625 ) ) ( not ( = ?auto_320622 ?auto_320626 ) ) ( not ( = ?auto_320622 ?auto_320627 ) ) ( not ( = ?auto_320622 ?auto_320628 ) ) ( not ( = ?auto_320622 ?auto_320629 ) ) ( not ( = ?auto_320622 ?auto_320630 ) ) ( not ( = ?auto_320622 ?auto_320631 ) ) ( not ( = ?auto_320622 ?auto_320632 ) ) ( not ( = ?auto_320622 ?auto_320633 ) ) ( not ( = ?auto_320623 ?auto_320624 ) ) ( not ( = ?auto_320623 ?auto_320625 ) ) ( not ( = ?auto_320623 ?auto_320626 ) ) ( not ( = ?auto_320623 ?auto_320627 ) ) ( not ( = ?auto_320623 ?auto_320628 ) ) ( not ( = ?auto_320623 ?auto_320629 ) ) ( not ( = ?auto_320623 ?auto_320630 ) ) ( not ( = ?auto_320623 ?auto_320631 ) ) ( not ( = ?auto_320623 ?auto_320632 ) ) ( not ( = ?auto_320623 ?auto_320633 ) ) ( not ( = ?auto_320624 ?auto_320625 ) ) ( not ( = ?auto_320624 ?auto_320626 ) ) ( not ( = ?auto_320624 ?auto_320627 ) ) ( not ( = ?auto_320624 ?auto_320628 ) ) ( not ( = ?auto_320624 ?auto_320629 ) ) ( not ( = ?auto_320624 ?auto_320630 ) ) ( not ( = ?auto_320624 ?auto_320631 ) ) ( not ( = ?auto_320624 ?auto_320632 ) ) ( not ( = ?auto_320624 ?auto_320633 ) ) ( not ( = ?auto_320625 ?auto_320626 ) ) ( not ( = ?auto_320625 ?auto_320627 ) ) ( not ( = ?auto_320625 ?auto_320628 ) ) ( not ( = ?auto_320625 ?auto_320629 ) ) ( not ( = ?auto_320625 ?auto_320630 ) ) ( not ( = ?auto_320625 ?auto_320631 ) ) ( not ( = ?auto_320625 ?auto_320632 ) ) ( not ( = ?auto_320625 ?auto_320633 ) ) ( not ( = ?auto_320626 ?auto_320627 ) ) ( not ( = ?auto_320626 ?auto_320628 ) ) ( not ( = ?auto_320626 ?auto_320629 ) ) ( not ( = ?auto_320626 ?auto_320630 ) ) ( not ( = ?auto_320626 ?auto_320631 ) ) ( not ( = ?auto_320626 ?auto_320632 ) ) ( not ( = ?auto_320626 ?auto_320633 ) ) ( not ( = ?auto_320627 ?auto_320628 ) ) ( not ( = ?auto_320627 ?auto_320629 ) ) ( not ( = ?auto_320627 ?auto_320630 ) ) ( not ( = ?auto_320627 ?auto_320631 ) ) ( not ( = ?auto_320627 ?auto_320632 ) ) ( not ( = ?auto_320627 ?auto_320633 ) ) ( not ( = ?auto_320628 ?auto_320629 ) ) ( not ( = ?auto_320628 ?auto_320630 ) ) ( not ( = ?auto_320628 ?auto_320631 ) ) ( not ( = ?auto_320628 ?auto_320632 ) ) ( not ( = ?auto_320628 ?auto_320633 ) ) ( not ( = ?auto_320629 ?auto_320630 ) ) ( not ( = ?auto_320629 ?auto_320631 ) ) ( not ( = ?auto_320629 ?auto_320632 ) ) ( not ( = ?auto_320629 ?auto_320633 ) ) ( not ( = ?auto_320630 ?auto_320631 ) ) ( not ( = ?auto_320630 ?auto_320632 ) ) ( not ( = ?auto_320630 ?auto_320633 ) ) ( not ( = ?auto_320631 ?auto_320632 ) ) ( not ( = ?auto_320631 ?auto_320633 ) ) ( not ( = ?auto_320632 ?auto_320633 ) ) ( CLEAR ?auto_320630 ) ( ON ?auto_320631 ?auto_320632 ) ( CLEAR ?auto_320631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_320620 ?auto_320621 ?auto_320622 ?auto_320623 ?auto_320624 ?auto_320625 ?auto_320626 ?auto_320627 ?auto_320628 ?auto_320629 ?auto_320630 ?auto_320631 )
      ( MAKE-13PILE ?auto_320620 ?auto_320621 ?auto_320622 ?auto_320623 ?auto_320624 ?auto_320625 ?auto_320626 ?auto_320627 ?auto_320628 ?auto_320629 ?auto_320630 ?auto_320631 ?auto_320632 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320647 - BLOCK
      ?auto_320648 - BLOCK
      ?auto_320649 - BLOCK
      ?auto_320650 - BLOCK
      ?auto_320651 - BLOCK
      ?auto_320652 - BLOCK
      ?auto_320653 - BLOCK
      ?auto_320654 - BLOCK
      ?auto_320655 - BLOCK
      ?auto_320656 - BLOCK
      ?auto_320657 - BLOCK
      ?auto_320658 - BLOCK
      ?auto_320659 - BLOCK
    )
    :vars
    (
      ?auto_320660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320659 ?auto_320660 ) ( ON-TABLE ?auto_320647 ) ( ON ?auto_320648 ?auto_320647 ) ( ON ?auto_320649 ?auto_320648 ) ( ON ?auto_320650 ?auto_320649 ) ( ON ?auto_320651 ?auto_320650 ) ( ON ?auto_320652 ?auto_320651 ) ( ON ?auto_320653 ?auto_320652 ) ( ON ?auto_320654 ?auto_320653 ) ( ON ?auto_320655 ?auto_320654 ) ( ON ?auto_320656 ?auto_320655 ) ( not ( = ?auto_320647 ?auto_320648 ) ) ( not ( = ?auto_320647 ?auto_320649 ) ) ( not ( = ?auto_320647 ?auto_320650 ) ) ( not ( = ?auto_320647 ?auto_320651 ) ) ( not ( = ?auto_320647 ?auto_320652 ) ) ( not ( = ?auto_320647 ?auto_320653 ) ) ( not ( = ?auto_320647 ?auto_320654 ) ) ( not ( = ?auto_320647 ?auto_320655 ) ) ( not ( = ?auto_320647 ?auto_320656 ) ) ( not ( = ?auto_320647 ?auto_320657 ) ) ( not ( = ?auto_320647 ?auto_320658 ) ) ( not ( = ?auto_320647 ?auto_320659 ) ) ( not ( = ?auto_320647 ?auto_320660 ) ) ( not ( = ?auto_320648 ?auto_320649 ) ) ( not ( = ?auto_320648 ?auto_320650 ) ) ( not ( = ?auto_320648 ?auto_320651 ) ) ( not ( = ?auto_320648 ?auto_320652 ) ) ( not ( = ?auto_320648 ?auto_320653 ) ) ( not ( = ?auto_320648 ?auto_320654 ) ) ( not ( = ?auto_320648 ?auto_320655 ) ) ( not ( = ?auto_320648 ?auto_320656 ) ) ( not ( = ?auto_320648 ?auto_320657 ) ) ( not ( = ?auto_320648 ?auto_320658 ) ) ( not ( = ?auto_320648 ?auto_320659 ) ) ( not ( = ?auto_320648 ?auto_320660 ) ) ( not ( = ?auto_320649 ?auto_320650 ) ) ( not ( = ?auto_320649 ?auto_320651 ) ) ( not ( = ?auto_320649 ?auto_320652 ) ) ( not ( = ?auto_320649 ?auto_320653 ) ) ( not ( = ?auto_320649 ?auto_320654 ) ) ( not ( = ?auto_320649 ?auto_320655 ) ) ( not ( = ?auto_320649 ?auto_320656 ) ) ( not ( = ?auto_320649 ?auto_320657 ) ) ( not ( = ?auto_320649 ?auto_320658 ) ) ( not ( = ?auto_320649 ?auto_320659 ) ) ( not ( = ?auto_320649 ?auto_320660 ) ) ( not ( = ?auto_320650 ?auto_320651 ) ) ( not ( = ?auto_320650 ?auto_320652 ) ) ( not ( = ?auto_320650 ?auto_320653 ) ) ( not ( = ?auto_320650 ?auto_320654 ) ) ( not ( = ?auto_320650 ?auto_320655 ) ) ( not ( = ?auto_320650 ?auto_320656 ) ) ( not ( = ?auto_320650 ?auto_320657 ) ) ( not ( = ?auto_320650 ?auto_320658 ) ) ( not ( = ?auto_320650 ?auto_320659 ) ) ( not ( = ?auto_320650 ?auto_320660 ) ) ( not ( = ?auto_320651 ?auto_320652 ) ) ( not ( = ?auto_320651 ?auto_320653 ) ) ( not ( = ?auto_320651 ?auto_320654 ) ) ( not ( = ?auto_320651 ?auto_320655 ) ) ( not ( = ?auto_320651 ?auto_320656 ) ) ( not ( = ?auto_320651 ?auto_320657 ) ) ( not ( = ?auto_320651 ?auto_320658 ) ) ( not ( = ?auto_320651 ?auto_320659 ) ) ( not ( = ?auto_320651 ?auto_320660 ) ) ( not ( = ?auto_320652 ?auto_320653 ) ) ( not ( = ?auto_320652 ?auto_320654 ) ) ( not ( = ?auto_320652 ?auto_320655 ) ) ( not ( = ?auto_320652 ?auto_320656 ) ) ( not ( = ?auto_320652 ?auto_320657 ) ) ( not ( = ?auto_320652 ?auto_320658 ) ) ( not ( = ?auto_320652 ?auto_320659 ) ) ( not ( = ?auto_320652 ?auto_320660 ) ) ( not ( = ?auto_320653 ?auto_320654 ) ) ( not ( = ?auto_320653 ?auto_320655 ) ) ( not ( = ?auto_320653 ?auto_320656 ) ) ( not ( = ?auto_320653 ?auto_320657 ) ) ( not ( = ?auto_320653 ?auto_320658 ) ) ( not ( = ?auto_320653 ?auto_320659 ) ) ( not ( = ?auto_320653 ?auto_320660 ) ) ( not ( = ?auto_320654 ?auto_320655 ) ) ( not ( = ?auto_320654 ?auto_320656 ) ) ( not ( = ?auto_320654 ?auto_320657 ) ) ( not ( = ?auto_320654 ?auto_320658 ) ) ( not ( = ?auto_320654 ?auto_320659 ) ) ( not ( = ?auto_320654 ?auto_320660 ) ) ( not ( = ?auto_320655 ?auto_320656 ) ) ( not ( = ?auto_320655 ?auto_320657 ) ) ( not ( = ?auto_320655 ?auto_320658 ) ) ( not ( = ?auto_320655 ?auto_320659 ) ) ( not ( = ?auto_320655 ?auto_320660 ) ) ( not ( = ?auto_320656 ?auto_320657 ) ) ( not ( = ?auto_320656 ?auto_320658 ) ) ( not ( = ?auto_320656 ?auto_320659 ) ) ( not ( = ?auto_320656 ?auto_320660 ) ) ( not ( = ?auto_320657 ?auto_320658 ) ) ( not ( = ?auto_320657 ?auto_320659 ) ) ( not ( = ?auto_320657 ?auto_320660 ) ) ( not ( = ?auto_320658 ?auto_320659 ) ) ( not ( = ?auto_320658 ?auto_320660 ) ) ( not ( = ?auto_320659 ?auto_320660 ) ) ( ON ?auto_320658 ?auto_320659 ) ( CLEAR ?auto_320656 ) ( ON ?auto_320657 ?auto_320658 ) ( CLEAR ?auto_320657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_320647 ?auto_320648 ?auto_320649 ?auto_320650 ?auto_320651 ?auto_320652 ?auto_320653 ?auto_320654 ?auto_320655 ?auto_320656 ?auto_320657 )
      ( MAKE-13PILE ?auto_320647 ?auto_320648 ?auto_320649 ?auto_320650 ?auto_320651 ?auto_320652 ?auto_320653 ?auto_320654 ?auto_320655 ?auto_320656 ?auto_320657 ?auto_320658 ?auto_320659 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320674 - BLOCK
      ?auto_320675 - BLOCK
      ?auto_320676 - BLOCK
      ?auto_320677 - BLOCK
      ?auto_320678 - BLOCK
      ?auto_320679 - BLOCK
      ?auto_320680 - BLOCK
      ?auto_320681 - BLOCK
      ?auto_320682 - BLOCK
      ?auto_320683 - BLOCK
      ?auto_320684 - BLOCK
      ?auto_320685 - BLOCK
      ?auto_320686 - BLOCK
    )
    :vars
    (
      ?auto_320687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320686 ?auto_320687 ) ( ON-TABLE ?auto_320674 ) ( ON ?auto_320675 ?auto_320674 ) ( ON ?auto_320676 ?auto_320675 ) ( ON ?auto_320677 ?auto_320676 ) ( ON ?auto_320678 ?auto_320677 ) ( ON ?auto_320679 ?auto_320678 ) ( ON ?auto_320680 ?auto_320679 ) ( ON ?auto_320681 ?auto_320680 ) ( ON ?auto_320682 ?auto_320681 ) ( ON ?auto_320683 ?auto_320682 ) ( not ( = ?auto_320674 ?auto_320675 ) ) ( not ( = ?auto_320674 ?auto_320676 ) ) ( not ( = ?auto_320674 ?auto_320677 ) ) ( not ( = ?auto_320674 ?auto_320678 ) ) ( not ( = ?auto_320674 ?auto_320679 ) ) ( not ( = ?auto_320674 ?auto_320680 ) ) ( not ( = ?auto_320674 ?auto_320681 ) ) ( not ( = ?auto_320674 ?auto_320682 ) ) ( not ( = ?auto_320674 ?auto_320683 ) ) ( not ( = ?auto_320674 ?auto_320684 ) ) ( not ( = ?auto_320674 ?auto_320685 ) ) ( not ( = ?auto_320674 ?auto_320686 ) ) ( not ( = ?auto_320674 ?auto_320687 ) ) ( not ( = ?auto_320675 ?auto_320676 ) ) ( not ( = ?auto_320675 ?auto_320677 ) ) ( not ( = ?auto_320675 ?auto_320678 ) ) ( not ( = ?auto_320675 ?auto_320679 ) ) ( not ( = ?auto_320675 ?auto_320680 ) ) ( not ( = ?auto_320675 ?auto_320681 ) ) ( not ( = ?auto_320675 ?auto_320682 ) ) ( not ( = ?auto_320675 ?auto_320683 ) ) ( not ( = ?auto_320675 ?auto_320684 ) ) ( not ( = ?auto_320675 ?auto_320685 ) ) ( not ( = ?auto_320675 ?auto_320686 ) ) ( not ( = ?auto_320675 ?auto_320687 ) ) ( not ( = ?auto_320676 ?auto_320677 ) ) ( not ( = ?auto_320676 ?auto_320678 ) ) ( not ( = ?auto_320676 ?auto_320679 ) ) ( not ( = ?auto_320676 ?auto_320680 ) ) ( not ( = ?auto_320676 ?auto_320681 ) ) ( not ( = ?auto_320676 ?auto_320682 ) ) ( not ( = ?auto_320676 ?auto_320683 ) ) ( not ( = ?auto_320676 ?auto_320684 ) ) ( not ( = ?auto_320676 ?auto_320685 ) ) ( not ( = ?auto_320676 ?auto_320686 ) ) ( not ( = ?auto_320676 ?auto_320687 ) ) ( not ( = ?auto_320677 ?auto_320678 ) ) ( not ( = ?auto_320677 ?auto_320679 ) ) ( not ( = ?auto_320677 ?auto_320680 ) ) ( not ( = ?auto_320677 ?auto_320681 ) ) ( not ( = ?auto_320677 ?auto_320682 ) ) ( not ( = ?auto_320677 ?auto_320683 ) ) ( not ( = ?auto_320677 ?auto_320684 ) ) ( not ( = ?auto_320677 ?auto_320685 ) ) ( not ( = ?auto_320677 ?auto_320686 ) ) ( not ( = ?auto_320677 ?auto_320687 ) ) ( not ( = ?auto_320678 ?auto_320679 ) ) ( not ( = ?auto_320678 ?auto_320680 ) ) ( not ( = ?auto_320678 ?auto_320681 ) ) ( not ( = ?auto_320678 ?auto_320682 ) ) ( not ( = ?auto_320678 ?auto_320683 ) ) ( not ( = ?auto_320678 ?auto_320684 ) ) ( not ( = ?auto_320678 ?auto_320685 ) ) ( not ( = ?auto_320678 ?auto_320686 ) ) ( not ( = ?auto_320678 ?auto_320687 ) ) ( not ( = ?auto_320679 ?auto_320680 ) ) ( not ( = ?auto_320679 ?auto_320681 ) ) ( not ( = ?auto_320679 ?auto_320682 ) ) ( not ( = ?auto_320679 ?auto_320683 ) ) ( not ( = ?auto_320679 ?auto_320684 ) ) ( not ( = ?auto_320679 ?auto_320685 ) ) ( not ( = ?auto_320679 ?auto_320686 ) ) ( not ( = ?auto_320679 ?auto_320687 ) ) ( not ( = ?auto_320680 ?auto_320681 ) ) ( not ( = ?auto_320680 ?auto_320682 ) ) ( not ( = ?auto_320680 ?auto_320683 ) ) ( not ( = ?auto_320680 ?auto_320684 ) ) ( not ( = ?auto_320680 ?auto_320685 ) ) ( not ( = ?auto_320680 ?auto_320686 ) ) ( not ( = ?auto_320680 ?auto_320687 ) ) ( not ( = ?auto_320681 ?auto_320682 ) ) ( not ( = ?auto_320681 ?auto_320683 ) ) ( not ( = ?auto_320681 ?auto_320684 ) ) ( not ( = ?auto_320681 ?auto_320685 ) ) ( not ( = ?auto_320681 ?auto_320686 ) ) ( not ( = ?auto_320681 ?auto_320687 ) ) ( not ( = ?auto_320682 ?auto_320683 ) ) ( not ( = ?auto_320682 ?auto_320684 ) ) ( not ( = ?auto_320682 ?auto_320685 ) ) ( not ( = ?auto_320682 ?auto_320686 ) ) ( not ( = ?auto_320682 ?auto_320687 ) ) ( not ( = ?auto_320683 ?auto_320684 ) ) ( not ( = ?auto_320683 ?auto_320685 ) ) ( not ( = ?auto_320683 ?auto_320686 ) ) ( not ( = ?auto_320683 ?auto_320687 ) ) ( not ( = ?auto_320684 ?auto_320685 ) ) ( not ( = ?auto_320684 ?auto_320686 ) ) ( not ( = ?auto_320684 ?auto_320687 ) ) ( not ( = ?auto_320685 ?auto_320686 ) ) ( not ( = ?auto_320685 ?auto_320687 ) ) ( not ( = ?auto_320686 ?auto_320687 ) ) ( ON ?auto_320685 ?auto_320686 ) ( CLEAR ?auto_320683 ) ( ON ?auto_320684 ?auto_320685 ) ( CLEAR ?auto_320684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_320674 ?auto_320675 ?auto_320676 ?auto_320677 ?auto_320678 ?auto_320679 ?auto_320680 ?auto_320681 ?auto_320682 ?auto_320683 ?auto_320684 )
      ( MAKE-13PILE ?auto_320674 ?auto_320675 ?auto_320676 ?auto_320677 ?auto_320678 ?auto_320679 ?auto_320680 ?auto_320681 ?auto_320682 ?auto_320683 ?auto_320684 ?auto_320685 ?auto_320686 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320701 - BLOCK
      ?auto_320702 - BLOCK
      ?auto_320703 - BLOCK
      ?auto_320704 - BLOCK
      ?auto_320705 - BLOCK
      ?auto_320706 - BLOCK
      ?auto_320707 - BLOCK
      ?auto_320708 - BLOCK
      ?auto_320709 - BLOCK
      ?auto_320710 - BLOCK
      ?auto_320711 - BLOCK
      ?auto_320712 - BLOCK
      ?auto_320713 - BLOCK
    )
    :vars
    (
      ?auto_320714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320713 ?auto_320714 ) ( ON-TABLE ?auto_320701 ) ( ON ?auto_320702 ?auto_320701 ) ( ON ?auto_320703 ?auto_320702 ) ( ON ?auto_320704 ?auto_320703 ) ( ON ?auto_320705 ?auto_320704 ) ( ON ?auto_320706 ?auto_320705 ) ( ON ?auto_320707 ?auto_320706 ) ( ON ?auto_320708 ?auto_320707 ) ( ON ?auto_320709 ?auto_320708 ) ( not ( = ?auto_320701 ?auto_320702 ) ) ( not ( = ?auto_320701 ?auto_320703 ) ) ( not ( = ?auto_320701 ?auto_320704 ) ) ( not ( = ?auto_320701 ?auto_320705 ) ) ( not ( = ?auto_320701 ?auto_320706 ) ) ( not ( = ?auto_320701 ?auto_320707 ) ) ( not ( = ?auto_320701 ?auto_320708 ) ) ( not ( = ?auto_320701 ?auto_320709 ) ) ( not ( = ?auto_320701 ?auto_320710 ) ) ( not ( = ?auto_320701 ?auto_320711 ) ) ( not ( = ?auto_320701 ?auto_320712 ) ) ( not ( = ?auto_320701 ?auto_320713 ) ) ( not ( = ?auto_320701 ?auto_320714 ) ) ( not ( = ?auto_320702 ?auto_320703 ) ) ( not ( = ?auto_320702 ?auto_320704 ) ) ( not ( = ?auto_320702 ?auto_320705 ) ) ( not ( = ?auto_320702 ?auto_320706 ) ) ( not ( = ?auto_320702 ?auto_320707 ) ) ( not ( = ?auto_320702 ?auto_320708 ) ) ( not ( = ?auto_320702 ?auto_320709 ) ) ( not ( = ?auto_320702 ?auto_320710 ) ) ( not ( = ?auto_320702 ?auto_320711 ) ) ( not ( = ?auto_320702 ?auto_320712 ) ) ( not ( = ?auto_320702 ?auto_320713 ) ) ( not ( = ?auto_320702 ?auto_320714 ) ) ( not ( = ?auto_320703 ?auto_320704 ) ) ( not ( = ?auto_320703 ?auto_320705 ) ) ( not ( = ?auto_320703 ?auto_320706 ) ) ( not ( = ?auto_320703 ?auto_320707 ) ) ( not ( = ?auto_320703 ?auto_320708 ) ) ( not ( = ?auto_320703 ?auto_320709 ) ) ( not ( = ?auto_320703 ?auto_320710 ) ) ( not ( = ?auto_320703 ?auto_320711 ) ) ( not ( = ?auto_320703 ?auto_320712 ) ) ( not ( = ?auto_320703 ?auto_320713 ) ) ( not ( = ?auto_320703 ?auto_320714 ) ) ( not ( = ?auto_320704 ?auto_320705 ) ) ( not ( = ?auto_320704 ?auto_320706 ) ) ( not ( = ?auto_320704 ?auto_320707 ) ) ( not ( = ?auto_320704 ?auto_320708 ) ) ( not ( = ?auto_320704 ?auto_320709 ) ) ( not ( = ?auto_320704 ?auto_320710 ) ) ( not ( = ?auto_320704 ?auto_320711 ) ) ( not ( = ?auto_320704 ?auto_320712 ) ) ( not ( = ?auto_320704 ?auto_320713 ) ) ( not ( = ?auto_320704 ?auto_320714 ) ) ( not ( = ?auto_320705 ?auto_320706 ) ) ( not ( = ?auto_320705 ?auto_320707 ) ) ( not ( = ?auto_320705 ?auto_320708 ) ) ( not ( = ?auto_320705 ?auto_320709 ) ) ( not ( = ?auto_320705 ?auto_320710 ) ) ( not ( = ?auto_320705 ?auto_320711 ) ) ( not ( = ?auto_320705 ?auto_320712 ) ) ( not ( = ?auto_320705 ?auto_320713 ) ) ( not ( = ?auto_320705 ?auto_320714 ) ) ( not ( = ?auto_320706 ?auto_320707 ) ) ( not ( = ?auto_320706 ?auto_320708 ) ) ( not ( = ?auto_320706 ?auto_320709 ) ) ( not ( = ?auto_320706 ?auto_320710 ) ) ( not ( = ?auto_320706 ?auto_320711 ) ) ( not ( = ?auto_320706 ?auto_320712 ) ) ( not ( = ?auto_320706 ?auto_320713 ) ) ( not ( = ?auto_320706 ?auto_320714 ) ) ( not ( = ?auto_320707 ?auto_320708 ) ) ( not ( = ?auto_320707 ?auto_320709 ) ) ( not ( = ?auto_320707 ?auto_320710 ) ) ( not ( = ?auto_320707 ?auto_320711 ) ) ( not ( = ?auto_320707 ?auto_320712 ) ) ( not ( = ?auto_320707 ?auto_320713 ) ) ( not ( = ?auto_320707 ?auto_320714 ) ) ( not ( = ?auto_320708 ?auto_320709 ) ) ( not ( = ?auto_320708 ?auto_320710 ) ) ( not ( = ?auto_320708 ?auto_320711 ) ) ( not ( = ?auto_320708 ?auto_320712 ) ) ( not ( = ?auto_320708 ?auto_320713 ) ) ( not ( = ?auto_320708 ?auto_320714 ) ) ( not ( = ?auto_320709 ?auto_320710 ) ) ( not ( = ?auto_320709 ?auto_320711 ) ) ( not ( = ?auto_320709 ?auto_320712 ) ) ( not ( = ?auto_320709 ?auto_320713 ) ) ( not ( = ?auto_320709 ?auto_320714 ) ) ( not ( = ?auto_320710 ?auto_320711 ) ) ( not ( = ?auto_320710 ?auto_320712 ) ) ( not ( = ?auto_320710 ?auto_320713 ) ) ( not ( = ?auto_320710 ?auto_320714 ) ) ( not ( = ?auto_320711 ?auto_320712 ) ) ( not ( = ?auto_320711 ?auto_320713 ) ) ( not ( = ?auto_320711 ?auto_320714 ) ) ( not ( = ?auto_320712 ?auto_320713 ) ) ( not ( = ?auto_320712 ?auto_320714 ) ) ( not ( = ?auto_320713 ?auto_320714 ) ) ( ON ?auto_320712 ?auto_320713 ) ( ON ?auto_320711 ?auto_320712 ) ( CLEAR ?auto_320709 ) ( ON ?auto_320710 ?auto_320711 ) ( CLEAR ?auto_320710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_320701 ?auto_320702 ?auto_320703 ?auto_320704 ?auto_320705 ?auto_320706 ?auto_320707 ?auto_320708 ?auto_320709 ?auto_320710 )
      ( MAKE-13PILE ?auto_320701 ?auto_320702 ?auto_320703 ?auto_320704 ?auto_320705 ?auto_320706 ?auto_320707 ?auto_320708 ?auto_320709 ?auto_320710 ?auto_320711 ?auto_320712 ?auto_320713 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320728 - BLOCK
      ?auto_320729 - BLOCK
      ?auto_320730 - BLOCK
      ?auto_320731 - BLOCK
      ?auto_320732 - BLOCK
      ?auto_320733 - BLOCK
      ?auto_320734 - BLOCK
      ?auto_320735 - BLOCK
      ?auto_320736 - BLOCK
      ?auto_320737 - BLOCK
      ?auto_320738 - BLOCK
      ?auto_320739 - BLOCK
      ?auto_320740 - BLOCK
    )
    :vars
    (
      ?auto_320741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320740 ?auto_320741 ) ( ON-TABLE ?auto_320728 ) ( ON ?auto_320729 ?auto_320728 ) ( ON ?auto_320730 ?auto_320729 ) ( ON ?auto_320731 ?auto_320730 ) ( ON ?auto_320732 ?auto_320731 ) ( ON ?auto_320733 ?auto_320732 ) ( ON ?auto_320734 ?auto_320733 ) ( ON ?auto_320735 ?auto_320734 ) ( ON ?auto_320736 ?auto_320735 ) ( not ( = ?auto_320728 ?auto_320729 ) ) ( not ( = ?auto_320728 ?auto_320730 ) ) ( not ( = ?auto_320728 ?auto_320731 ) ) ( not ( = ?auto_320728 ?auto_320732 ) ) ( not ( = ?auto_320728 ?auto_320733 ) ) ( not ( = ?auto_320728 ?auto_320734 ) ) ( not ( = ?auto_320728 ?auto_320735 ) ) ( not ( = ?auto_320728 ?auto_320736 ) ) ( not ( = ?auto_320728 ?auto_320737 ) ) ( not ( = ?auto_320728 ?auto_320738 ) ) ( not ( = ?auto_320728 ?auto_320739 ) ) ( not ( = ?auto_320728 ?auto_320740 ) ) ( not ( = ?auto_320728 ?auto_320741 ) ) ( not ( = ?auto_320729 ?auto_320730 ) ) ( not ( = ?auto_320729 ?auto_320731 ) ) ( not ( = ?auto_320729 ?auto_320732 ) ) ( not ( = ?auto_320729 ?auto_320733 ) ) ( not ( = ?auto_320729 ?auto_320734 ) ) ( not ( = ?auto_320729 ?auto_320735 ) ) ( not ( = ?auto_320729 ?auto_320736 ) ) ( not ( = ?auto_320729 ?auto_320737 ) ) ( not ( = ?auto_320729 ?auto_320738 ) ) ( not ( = ?auto_320729 ?auto_320739 ) ) ( not ( = ?auto_320729 ?auto_320740 ) ) ( not ( = ?auto_320729 ?auto_320741 ) ) ( not ( = ?auto_320730 ?auto_320731 ) ) ( not ( = ?auto_320730 ?auto_320732 ) ) ( not ( = ?auto_320730 ?auto_320733 ) ) ( not ( = ?auto_320730 ?auto_320734 ) ) ( not ( = ?auto_320730 ?auto_320735 ) ) ( not ( = ?auto_320730 ?auto_320736 ) ) ( not ( = ?auto_320730 ?auto_320737 ) ) ( not ( = ?auto_320730 ?auto_320738 ) ) ( not ( = ?auto_320730 ?auto_320739 ) ) ( not ( = ?auto_320730 ?auto_320740 ) ) ( not ( = ?auto_320730 ?auto_320741 ) ) ( not ( = ?auto_320731 ?auto_320732 ) ) ( not ( = ?auto_320731 ?auto_320733 ) ) ( not ( = ?auto_320731 ?auto_320734 ) ) ( not ( = ?auto_320731 ?auto_320735 ) ) ( not ( = ?auto_320731 ?auto_320736 ) ) ( not ( = ?auto_320731 ?auto_320737 ) ) ( not ( = ?auto_320731 ?auto_320738 ) ) ( not ( = ?auto_320731 ?auto_320739 ) ) ( not ( = ?auto_320731 ?auto_320740 ) ) ( not ( = ?auto_320731 ?auto_320741 ) ) ( not ( = ?auto_320732 ?auto_320733 ) ) ( not ( = ?auto_320732 ?auto_320734 ) ) ( not ( = ?auto_320732 ?auto_320735 ) ) ( not ( = ?auto_320732 ?auto_320736 ) ) ( not ( = ?auto_320732 ?auto_320737 ) ) ( not ( = ?auto_320732 ?auto_320738 ) ) ( not ( = ?auto_320732 ?auto_320739 ) ) ( not ( = ?auto_320732 ?auto_320740 ) ) ( not ( = ?auto_320732 ?auto_320741 ) ) ( not ( = ?auto_320733 ?auto_320734 ) ) ( not ( = ?auto_320733 ?auto_320735 ) ) ( not ( = ?auto_320733 ?auto_320736 ) ) ( not ( = ?auto_320733 ?auto_320737 ) ) ( not ( = ?auto_320733 ?auto_320738 ) ) ( not ( = ?auto_320733 ?auto_320739 ) ) ( not ( = ?auto_320733 ?auto_320740 ) ) ( not ( = ?auto_320733 ?auto_320741 ) ) ( not ( = ?auto_320734 ?auto_320735 ) ) ( not ( = ?auto_320734 ?auto_320736 ) ) ( not ( = ?auto_320734 ?auto_320737 ) ) ( not ( = ?auto_320734 ?auto_320738 ) ) ( not ( = ?auto_320734 ?auto_320739 ) ) ( not ( = ?auto_320734 ?auto_320740 ) ) ( not ( = ?auto_320734 ?auto_320741 ) ) ( not ( = ?auto_320735 ?auto_320736 ) ) ( not ( = ?auto_320735 ?auto_320737 ) ) ( not ( = ?auto_320735 ?auto_320738 ) ) ( not ( = ?auto_320735 ?auto_320739 ) ) ( not ( = ?auto_320735 ?auto_320740 ) ) ( not ( = ?auto_320735 ?auto_320741 ) ) ( not ( = ?auto_320736 ?auto_320737 ) ) ( not ( = ?auto_320736 ?auto_320738 ) ) ( not ( = ?auto_320736 ?auto_320739 ) ) ( not ( = ?auto_320736 ?auto_320740 ) ) ( not ( = ?auto_320736 ?auto_320741 ) ) ( not ( = ?auto_320737 ?auto_320738 ) ) ( not ( = ?auto_320737 ?auto_320739 ) ) ( not ( = ?auto_320737 ?auto_320740 ) ) ( not ( = ?auto_320737 ?auto_320741 ) ) ( not ( = ?auto_320738 ?auto_320739 ) ) ( not ( = ?auto_320738 ?auto_320740 ) ) ( not ( = ?auto_320738 ?auto_320741 ) ) ( not ( = ?auto_320739 ?auto_320740 ) ) ( not ( = ?auto_320739 ?auto_320741 ) ) ( not ( = ?auto_320740 ?auto_320741 ) ) ( ON ?auto_320739 ?auto_320740 ) ( ON ?auto_320738 ?auto_320739 ) ( CLEAR ?auto_320736 ) ( ON ?auto_320737 ?auto_320738 ) ( CLEAR ?auto_320737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_320728 ?auto_320729 ?auto_320730 ?auto_320731 ?auto_320732 ?auto_320733 ?auto_320734 ?auto_320735 ?auto_320736 ?auto_320737 )
      ( MAKE-13PILE ?auto_320728 ?auto_320729 ?auto_320730 ?auto_320731 ?auto_320732 ?auto_320733 ?auto_320734 ?auto_320735 ?auto_320736 ?auto_320737 ?auto_320738 ?auto_320739 ?auto_320740 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320755 - BLOCK
      ?auto_320756 - BLOCK
      ?auto_320757 - BLOCK
      ?auto_320758 - BLOCK
      ?auto_320759 - BLOCK
      ?auto_320760 - BLOCK
      ?auto_320761 - BLOCK
      ?auto_320762 - BLOCK
      ?auto_320763 - BLOCK
      ?auto_320764 - BLOCK
      ?auto_320765 - BLOCK
      ?auto_320766 - BLOCK
      ?auto_320767 - BLOCK
    )
    :vars
    (
      ?auto_320768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320767 ?auto_320768 ) ( ON-TABLE ?auto_320755 ) ( ON ?auto_320756 ?auto_320755 ) ( ON ?auto_320757 ?auto_320756 ) ( ON ?auto_320758 ?auto_320757 ) ( ON ?auto_320759 ?auto_320758 ) ( ON ?auto_320760 ?auto_320759 ) ( ON ?auto_320761 ?auto_320760 ) ( ON ?auto_320762 ?auto_320761 ) ( not ( = ?auto_320755 ?auto_320756 ) ) ( not ( = ?auto_320755 ?auto_320757 ) ) ( not ( = ?auto_320755 ?auto_320758 ) ) ( not ( = ?auto_320755 ?auto_320759 ) ) ( not ( = ?auto_320755 ?auto_320760 ) ) ( not ( = ?auto_320755 ?auto_320761 ) ) ( not ( = ?auto_320755 ?auto_320762 ) ) ( not ( = ?auto_320755 ?auto_320763 ) ) ( not ( = ?auto_320755 ?auto_320764 ) ) ( not ( = ?auto_320755 ?auto_320765 ) ) ( not ( = ?auto_320755 ?auto_320766 ) ) ( not ( = ?auto_320755 ?auto_320767 ) ) ( not ( = ?auto_320755 ?auto_320768 ) ) ( not ( = ?auto_320756 ?auto_320757 ) ) ( not ( = ?auto_320756 ?auto_320758 ) ) ( not ( = ?auto_320756 ?auto_320759 ) ) ( not ( = ?auto_320756 ?auto_320760 ) ) ( not ( = ?auto_320756 ?auto_320761 ) ) ( not ( = ?auto_320756 ?auto_320762 ) ) ( not ( = ?auto_320756 ?auto_320763 ) ) ( not ( = ?auto_320756 ?auto_320764 ) ) ( not ( = ?auto_320756 ?auto_320765 ) ) ( not ( = ?auto_320756 ?auto_320766 ) ) ( not ( = ?auto_320756 ?auto_320767 ) ) ( not ( = ?auto_320756 ?auto_320768 ) ) ( not ( = ?auto_320757 ?auto_320758 ) ) ( not ( = ?auto_320757 ?auto_320759 ) ) ( not ( = ?auto_320757 ?auto_320760 ) ) ( not ( = ?auto_320757 ?auto_320761 ) ) ( not ( = ?auto_320757 ?auto_320762 ) ) ( not ( = ?auto_320757 ?auto_320763 ) ) ( not ( = ?auto_320757 ?auto_320764 ) ) ( not ( = ?auto_320757 ?auto_320765 ) ) ( not ( = ?auto_320757 ?auto_320766 ) ) ( not ( = ?auto_320757 ?auto_320767 ) ) ( not ( = ?auto_320757 ?auto_320768 ) ) ( not ( = ?auto_320758 ?auto_320759 ) ) ( not ( = ?auto_320758 ?auto_320760 ) ) ( not ( = ?auto_320758 ?auto_320761 ) ) ( not ( = ?auto_320758 ?auto_320762 ) ) ( not ( = ?auto_320758 ?auto_320763 ) ) ( not ( = ?auto_320758 ?auto_320764 ) ) ( not ( = ?auto_320758 ?auto_320765 ) ) ( not ( = ?auto_320758 ?auto_320766 ) ) ( not ( = ?auto_320758 ?auto_320767 ) ) ( not ( = ?auto_320758 ?auto_320768 ) ) ( not ( = ?auto_320759 ?auto_320760 ) ) ( not ( = ?auto_320759 ?auto_320761 ) ) ( not ( = ?auto_320759 ?auto_320762 ) ) ( not ( = ?auto_320759 ?auto_320763 ) ) ( not ( = ?auto_320759 ?auto_320764 ) ) ( not ( = ?auto_320759 ?auto_320765 ) ) ( not ( = ?auto_320759 ?auto_320766 ) ) ( not ( = ?auto_320759 ?auto_320767 ) ) ( not ( = ?auto_320759 ?auto_320768 ) ) ( not ( = ?auto_320760 ?auto_320761 ) ) ( not ( = ?auto_320760 ?auto_320762 ) ) ( not ( = ?auto_320760 ?auto_320763 ) ) ( not ( = ?auto_320760 ?auto_320764 ) ) ( not ( = ?auto_320760 ?auto_320765 ) ) ( not ( = ?auto_320760 ?auto_320766 ) ) ( not ( = ?auto_320760 ?auto_320767 ) ) ( not ( = ?auto_320760 ?auto_320768 ) ) ( not ( = ?auto_320761 ?auto_320762 ) ) ( not ( = ?auto_320761 ?auto_320763 ) ) ( not ( = ?auto_320761 ?auto_320764 ) ) ( not ( = ?auto_320761 ?auto_320765 ) ) ( not ( = ?auto_320761 ?auto_320766 ) ) ( not ( = ?auto_320761 ?auto_320767 ) ) ( not ( = ?auto_320761 ?auto_320768 ) ) ( not ( = ?auto_320762 ?auto_320763 ) ) ( not ( = ?auto_320762 ?auto_320764 ) ) ( not ( = ?auto_320762 ?auto_320765 ) ) ( not ( = ?auto_320762 ?auto_320766 ) ) ( not ( = ?auto_320762 ?auto_320767 ) ) ( not ( = ?auto_320762 ?auto_320768 ) ) ( not ( = ?auto_320763 ?auto_320764 ) ) ( not ( = ?auto_320763 ?auto_320765 ) ) ( not ( = ?auto_320763 ?auto_320766 ) ) ( not ( = ?auto_320763 ?auto_320767 ) ) ( not ( = ?auto_320763 ?auto_320768 ) ) ( not ( = ?auto_320764 ?auto_320765 ) ) ( not ( = ?auto_320764 ?auto_320766 ) ) ( not ( = ?auto_320764 ?auto_320767 ) ) ( not ( = ?auto_320764 ?auto_320768 ) ) ( not ( = ?auto_320765 ?auto_320766 ) ) ( not ( = ?auto_320765 ?auto_320767 ) ) ( not ( = ?auto_320765 ?auto_320768 ) ) ( not ( = ?auto_320766 ?auto_320767 ) ) ( not ( = ?auto_320766 ?auto_320768 ) ) ( not ( = ?auto_320767 ?auto_320768 ) ) ( ON ?auto_320766 ?auto_320767 ) ( ON ?auto_320765 ?auto_320766 ) ( ON ?auto_320764 ?auto_320765 ) ( CLEAR ?auto_320762 ) ( ON ?auto_320763 ?auto_320764 ) ( CLEAR ?auto_320763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_320755 ?auto_320756 ?auto_320757 ?auto_320758 ?auto_320759 ?auto_320760 ?auto_320761 ?auto_320762 ?auto_320763 )
      ( MAKE-13PILE ?auto_320755 ?auto_320756 ?auto_320757 ?auto_320758 ?auto_320759 ?auto_320760 ?auto_320761 ?auto_320762 ?auto_320763 ?auto_320764 ?auto_320765 ?auto_320766 ?auto_320767 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320782 - BLOCK
      ?auto_320783 - BLOCK
      ?auto_320784 - BLOCK
      ?auto_320785 - BLOCK
      ?auto_320786 - BLOCK
      ?auto_320787 - BLOCK
      ?auto_320788 - BLOCK
      ?auto_320789 - BLOCK
      ?auto_320790 - BLOCK
      ?auto_320791 - BLOCK
      ?auto_320792 - BLOCK
      ?auto_320793 - BLOCK
      ?auto_320794 - BLOCK
    )
    :vars
    (
      ?auto_320795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320794 ?auto_320795 ) ( ON-TABLE ?auto_320782 ) ( ON ?auto_320783 ?auto_320782 ) ( ON ?auto_320784 ?auto_320783 ) ( ON ?auto_320785 ?auto_320784 ) ( ON ?auto_320786 ?auto_320785 ) ( ON ?auto_320787 ?auto_320786 ) ( ON ?auto_320788 ?auto_320787 ) ( ON ?auto_320789 ?auto_320788 ) ( not ( = ?auto_320782 ?auto_320783 ) ) ( not ( = ?auto_320782 ?auto_320784 ) ) ( not ( = ?auto_320782 ?auto_320785 ) ) ( not ( = ?auto_320782 ?auto_320786 ) ) ( not ( = ?auto_320782 ?auto_320787 ) ) ( not ( = ?auto_320782 ?auto_320788 ) ) ( not ( = ?auto_320782 ?auto_320789 ) ) ( not ( = ?auto_320782 ?auto_320790 ) ) ( not ( = ?auto_320782 ?auto_320791 ) ) ( not ( = ?auto_320782 ?auto_320792 ) ) ( not ( = ?auto_320782 ?auto_320793 ) ) ( not ( = ?auto_320782 ?auto_320794 ) ) ( not ( = ?auto_320782 ?auto_320795 ) ) ( not ( = ?auto_320783 ?auto_320784 ) ) ( not ( = ?auto_320783 ?auto_320785 ) ) ( not ( = ?auto_320783 ?auto_320786 ) ) ( not ( = ?auto_320783 ?auto_320787 ) ) ( not ( = ?auto_320783 ?auto_320788 ) ) ( not ( = ?auto_320783 ?auto_320789 ) ) ( not ( = ?auto_320783 ?auto_320790 ) ) ( not ( = ?auto_320783 ?auto_320791 ) ) ( not ( = ?auto_320783 ?auto_320792 ) ) ( not ( = ?auto_320783 ?auto_320793 ) ) ( not ( = ?auto_320783 ?auto_320794 ) ) ( not ( = ?auto_320783 ?auto_320795 ) ) ( not ( = ?auto_320784 ?auto_320785 ) ) ( not ( = ?auto_320784 ?auto_320786 ) ) ( not ( = ?auto_320784 ?auto_320787 ) ) ( not ( = ?auto_320784 ?auto_320788 ) ) ( not ( = ?auto_320784 ?auto_320789 ) ) ( not ( = ?auto_320784 ?auto_320790 ) ) ( not ( = ?auto_320784 ?auto_320791 ) ) ( not ( = ?auto_320784 ?auto_320792 ) ) ( not ( = ?auto_320784 ?auto_320793 ) ) ( not ( = ?auto_320784 ?auto_320794 ) ) ( not ( = ?auto_320784 ?auto_320795 ) ) ( not ( = ?auto_320785 ?auto_320786 ) ) ( not ( = ?auto_320785 ?auto_320787 ) ) ( not ( = ?auto_320785 ?auto_320788 ) ) ( not ( = ?auto_320785 ?auto_320789 ) ) ( not ( = ?auto_320785 ?auto_320790 ) ) ( not ( = ?auto_320785 ?auto_320791 ) ) ( not ( = ?auto_320785 ?auto_320792 ) ) ( not ( = ?auto_320785 ?auto_320793 ) ) ( not ( = ?auto_320785 ?auto_320794 ) ) ( not ( = ?auto_320785 ?auto_320795 ) ) ( not ( = ?auto_320786 ?auto_320787 ) ) ( not ( = ?auto_320786 ?auto_320788 ) ) ( not ( = ?auto_320786 ?auto_320789 ) ) ( not ( = ?auto_320786 ?auto_320790 ) ) ( not ( = ?auto_320786 ?auto_320791 ) ) ( not ( = ?auto_320786 ?auto_320792 ) ) ( not ( = ?auto_320786 ?auto_320793 ) ) ( not ( = ?auto_320786 ?auto_320794 ) ) ( not ( = ?auto_320786 ?auto_320795 ) ) ( not ( = ?auto_320787 ?auto_320788 ) ) ( not ( = ?auto_320787 ?auto_320789 ) ) ( not ( = ?auto_320787 ?auto_320790 ) ) ( not ( = ?auto_320787 ?auto_320791 ) ) ( not ( = ?auto_320787 ?auto_320792 ) ) ( not ( = ?auto_320787 ?auto_320793 ) ) ( not ( = ?auto_320787 ?auto_320794 ) ) ( not ( = ?auto_320787 ?auto_320795 ) ) ( not ( = ?auto_320788 ?auto_320789 ) ) ( not ( = ?auto_320788 ?auto_320790 ) ) ( not ( = ?auto_320788 ?auto_320791 ) ) ( not ( = ?auto_320788 ?auto_320792 ) ) ( not ( = ?auto_320788 ?auto_320793 ) ) ( not ( = ?auto_320788 ?auto_320794 ) ) ( not ( = ?auto_320788 ?auto_320795 ) ) ( not ( = ?auto_320789 ?auto_320790 ) ) ( not ( = ?auto_320789 ?auto_320791 ) ) ( not ( = ?auto_320789 ?auto_320792 ) ) ( not ( = ?auto_320789 ?auto_320793 ) ) ( not ( = ?auto_320789 ?auto_320794 ) ) ( not ( = ?auto_320789 ?auto_320795 ) ) ( not ( = ?auto_320790 ?auto_320791 ) ) ( not ( = ?auto_320790 ?auto_320792 ) ) ( not ( = ?auto_320790 ?auto_320793 ) ) ( not ( = ?auto_320790 ?auto_320794 ) ) ( not ( = ?auto_320790 ?auto_320795 ) ) ( not ( = ?auto_320791 ?auto_320792 ) ) ( not ( = ?auto_320791 ?auto_320793 ) ) ( not ( = ?auto_320791 ?auto_320794 ) ) ( not ( = ?auto_320791 ?auto_320795 ) ) ( not ( = ?auto_320792 ?auto_320793 ) ) ( not ( = ?auto_320792 ?auto_320794 ) ) ( not ( = ?auto_320792 ?auto_320795 ) ) ( not ( = ?auto_320793 ?auto_320794 ) ) ( not ( = ?auto_320793 ?auto_320795 ) ) ( not ( = ?auto_320794 ?auto_320795 ) ) ( ON ?auto_320793 ?auto_320794 ) ( ON ?auto_320792 ?auto_320793 ) ( ON ?auto_320791 ?auto_320792 ) ( CLEAR ?auto_320789 ) ( ON ?auto_320790 ?auto_320791 ) ( CLEAR ?auto_320790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_320782 ?auto_320783 ?auto_320784 ?auto_320785 ?auto_320786 ?auto_320787 ?auto_320788 ?auto_320789 ?auto_320790 )
      ( MAKE-13PILE ?auto_320782 ?auto_320783 ?auto_320784 ?auto_320785 ?auto_320786 ?auto_320787 ?auto_320788 ?auto_320789 ?auto_320790 ?auto_320791 ?auto_320792 ?auto_320793 ?auto_320794 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320809 - BLOCK
      ?auto_320810 - BLOCK
      ?auto_320811 - BLOCK
      ?auto_320812 - BLOCK
      ?auto_320813 - BLOCK
      ?auto_320814 - BLOCK
      ?auto_320815 - BLOCK
      ?auto_320816 - BLOCK
      ?auto_320817 - BLOCK
      ?auto_320818 - BLOCK
      ?auto_320819 - BLOCK
      ?auto_320820 - BLOCK
      ?auto_320821 - BLOCK
    )
    :vars
    (
      ?auto_320822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320821 ?auto_320822 ) ( ON-TABLE ?auto_320809 ) ( ON ?auto_320810 ?auto_320809 ) ( ON ?auto_320811 ?auto_320810 ) ( ON ?auto_320812 ?auto_320811 ) ( ON ?auto_320813 ?auto_320812 ) ( ON ?auto_320814 ?auto_320813 ) ( ON ?auto_320815 ?auto_320814 ) ( not ( = ?auto_320809 ?auto_320810 ) ) ( not ( = ?auto_320809 ?auto_320811 ) ) ( not ( = ?auto_320809 ?auto_320812 ) ) ( not ( = ?auto_320809 ?auto_320813 ) ) ( not ( = ?auto_320809 ?auto_320814 ) ) ( not ( = ?auto_320809 ?auto_320815 ) ) ( not ( = ?auto_320809 ?auto_320816 ) ) ( not ( = ?auto_320809 ?auto_320817 ) ) ( not ( = ?auto_320809 ?auto_320818 ) ) ( not ( = ?auto_320809 ?auto_320819 ) ) ( not ( = ?auto_320809 ?auto_320820 ) ) ( not ( = ?auto_320809 ?auto_320821 ) ) ( not ( = ?auto_320809 ?auto_320822 ) ) ( not ( = ?auto_320810 ?auto_320811 ) ) ( not ( = ?auto_320810 ?auto_320812 ) ) ( not ( = ?auto_320810 ?auto_320813 ) ) ( not ( = ?auto_320810 ?auto_320814 ) ) ( not ( = ?auto_320810 ?auto_320815 ) ) ( not ( = ?auto_320810 ?auto_320816 ) ) ( not ( = ?auto_320810 ?auto_320817 ) ) ( not ( = ?auto_320810 ?auto_320818 ) ) ( not ( = ?auto_320810 ?auto_320819 ) ) ( not ( = ?auto_320810 ?auto_320820 ) ) ( not ( = ?auto_320810 ?auto_320821 ) ) ( not ( = ?auto_320810 ?auto_320822 ) ) ( not ( = ?auto_320811 ?auto_320812 ) ) ( not ( = ?auto_320811 ?auto_320813 ) ) ( not ( = ?auto_320811 ?auto_320814 ) ) ( not ( = ?auto_320811 ?auto_320815 ) ) ( not ( = ?auto_320811 ?auto_320816 ) ) ( not ( = ?auto_320811 ?auto_320817 ) ) ( not ( = ?auto_320811 ?auto_320818 ) ) ( not ( = ?auto_320811 ?auto_320819 ) ) ( not ( = ?auto_320811 ?auto_320820 ) ) ( not ( = ?auto_320811 ?auto_320821 ) ) ( not ( = ?auto_320811 ?auto_320822 ) ) ( not ( = ?auto_320812 ?auto_320813 ) ) ( not ( = ?auto_320812 ?auto_320814 ) ) ( not ( = ?auto_320812 ?auto_320815 ) ) ( not ( = ?auto_320812 ?auto_320816 ) ) ( not ( = ?auto_320812 ?auto_320817 ) ) ( not ( = ?auto_320812 ?auto_320818 ) ) ( not ( = ?auto_320812 ?auto_320819 ) ) ( not ( = ?auto_320812 ?auto_320820 ) ) ( not ( = ?auto_320812 ?auto_320821 ) ) ( not ( = ?auto_320812 ?auto_320822 ) ) ( not ( = ?auto_320813 ?auto_320814 ) ) ( not ( = ?auto_320813 ?auto_320815 ) ) ( not ( = ?auto_320813 ?auto_320816 ) ) ( not ( = ?auto_320813 ?auto_320817 ) ) ( not ( = ?auto_320813 ?auto_320818 ) ) ( not ( = ?auto_320813 ?auto_320819 ) ) ( not ( = ?auto_320813 ?auto_320820 ) ) ( not ( = ?auto_320813 ?auto_320821 ) ) ( not ( = ?auto_320813 ?auto_320822 ) ) ( not ( = ?auto_320814 ?auto_320815 ) ) ( not ( = ?auto_320814 ?auto_320816 ) ) ( not ( = ?auto_320814 ?auto_320817 ) ) ( not ( = ?auto_320814 ?auto_320818 ) ) ( not ( = ?auto_320814 ?auto_320819 ) ) ( not ( = ?auto_320814 ?auto_320820 ) ) ( not ( = ?auto_320814 ?auto_320821 ) ) ( not ( = ?auto_320814 ?auto_320822 ) ) ( not ( = ?auto_320815 ?auto_320816 ) ) ( not ( = ?auto_320815 ?auto_320817 ) ) ( not ( = ?auto_320815 ?auto_320818 ) ) ( not ( = ?auto_320815 ?auto_320819 ) ) ( not ( = ?auto_320815 ?auto_320820 ) ) ( not ( = ?auto_320815 ?auto_320821 ) ) ( not ( = ?auto_320815 ?auto_320822 ) ) ( not ( = ?auto_320816 ?auto_320817 ) ) ( not ( = ?auto_320816 ?auto_320818 ) ) ( not ( = ?auto_320816 ?auto_320819 ) ) ( not ( = ?auto_320816 ?auto_320820 ) ) ( not ( = ?auto_320816 ?auto_320821 ) ) ( not ( = ?auto_320816 ?auto_320822 ) ) ( not ( = ?auto_320817 ?auto_320818 ) ) ( not ( = ?auto_320817 ?auto_320819 ) ) ( not ( = ?auto_320817 ?auto_320820 ) ) ( not ( = ?auto_320817 ?auto_320821 ) ) ( not ( = ?auto_320817 ?auto_320822 ) ) ( not ( = ?auto_320818 ?auto_320819 ) ) ( not ( = ?auto_320818 ?auto_320820 ) ) ( not ( = ?auto_320818 ?auto_320821 ) ) ( not ( = ?auto_320818 ?auto_320822 ) ) ( not ( = ?auto_320819 ?auto_320820 ) ) ( not ( = ?auto_320819 ?auto_320821 ) ) ( not ( = ?auto_320819 ?auto_320822 ) ) ( not ( = ?auto_320820 ?auto_320821 ) ) ( not ( = ?auto_320820 ?auto_320822 ) ) ( not ( = ?auto_320821 ?auto_320822 ) ) ( ON ?auto_320820 ?auto_320821 ) ( ON ?auto_320819 ?auto_320820 ) ( ON ?auto_320818 ?auto_320819 ) ( ON ?auto_320817 ?auto_320818 ) ( CLEAR ?auto_320815 ) ( ON ?auto_320816 ?auto_320817 ) ( CLEAR ?auto_320816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_320809 ?auto_320810 ?auto_320811 ?auto_320812 ?auto_320813 ?auto_320814 ?auto_320815 ?auto_320816 )
      ( MAKE-13PILE ?auto_320809 ?auto_320810 ?auto_320811 ?auto_320812 ?auto_320813 ?auto_320814 ?auto_320815 ?auto_320816 ?auto_320817 ?auto_320818 ?auto_320819 ?auto_320820 ?auto_320821 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320836 - BLOCK
      ?auto_320837 - BLOCK
      ?auto_320838 - BLOCK
      ?auto_320839 - BLOCK
      ?auto_320840 - BLOCK
      ?auto_320841 - BLOCK
      ?auto_320842 - BLOCK
      ?auto_320843 - BLOCK
      ?auto_320844 - BLOCK
      ?auto_320845 - BLOCK
      ?auto_320846 - BLOCK
      ?auto_320847 - BLOCK
      ?auto_320848 - BLOCK
    )
    :vars
    (
      ?auto_320849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320848 ?auto_320849 ) ( ON-TABLE ?auto_320836 ) ( ON ?auto_320837 ?auto_320836 ) ( ON ?auto_320838 ?auto_320837 ) ( ON ?auto_320839 ?auto_320838 ) ( ON ?auto_320840 ?auto_320839 ) ( ON ?auto_320841 ?auto_320840 ) ( ON ?auto_320842 ?auto_320841 ) ( not ( = ?auto_320836 ?auto_320837 ) ) ( not ( = ?auto_320836 ?auto_320838 ) ) ( not ( = ?auto_320836 ?auto_320839 ) ) ( not ( = ?auto_320836 ?auto_320840 ) ) ( not ( = ?auto_320836 ?auto_320841 ) ) ( not ( = ?auto_320836 ?auto_320842 ) ) ( not ( = ?auto_320836 ?auto_320843 ) ) ( not ( = ?auto_320836 ?auto_320844 ) ) ( not ( = ?auto_320836 ?auto_320845 ) ) ( not ( = ?auto_320836 ?auto_320846 ) ) ( not ( = ?auto_320836 ?auto_320847 ) ) ( not ( = ?auto_320836 ?auto_320848 ) ) ( not ( = ?auto_320836 ?auto_320849 ) ) ( not ( = ?auto_320837 ?auto_320838 ) ) ( not ( = ?auto_320837 ?auto_320839 ) ) ( not ( = ?auto_320837 ?auto_320840 ) ) ( not ( = ?auto_320837 ?auto_320841 ) ) ( not ( = ?auto_320837 ?auto_320842 ) ) ( not ( = ?auto_320837 ?auto_320843 ) ) ( not ( = ?auto_320837 ?auto_320844 ) ) ( not ( = ?auto_320837 ?auto_320845 ) ) ( not ( = ?auto_320837 ?auto_320846 ) ) ( not ( = ?auto_320837 ?auto_320847 ) ) ( not ( = ?auto_320837 ?auto_320848 ) ) ( not ( = ?auto_320837 ?auto_320849 ) ) ( not ( = ?auto_320838 ?auto_320839 ) ) ( not ( = ?auto_320838 ?auto_320840 ) ) ( not ( = ?auto_320838 ?auto_320841 ) ) ( not ( = ?auto_320838 ?auto_320842 ) ) ( not ( = ?auto_320838 ?auto_320843 ) ) ( not ( = ?auto_320838 ?auto_320844 ) ) ( not ( = ?auto_320838 ?auto_320845 ) ) ( not ( = ?auto_320838 ?auto_320846 ) ) ( not ( = ?auto_320838 ?auto_320847 ) ) ( not ( = ?auto_320838 ?auto_320848 ) ) ( not ( = ?auto_320838 ?auto_320849 ) ) ( not ( = ?auto_320839 ?auto_320840 ) ) ( not ( = ?auto_320839 ?auto_320841 ) ) ( not ( = ?auto_320839 ?auto_320842 ) ) ( not ( = ?auto_320839 ?auto_320843 ) ) ( not ( = ?auto_320839 ?auto_320844 ) ) ( not ( = ?auto_320839 ?auto_320845 ) ) ( not ( = ?auto_320839 ?auto_320846 ) ) ( not ( = ?auto_320839 ?auto_320847 ) ) ( not ( = ?auto_320839 ?auto_320848 ) ) ( not ( = ?auto_320839 ?auto_320849 ) ) ( not ( = ?auto_320840 ?auto_320841 ) ) ( not ( = ?auto_320840 ?auto_320842 ) ) ( not ( = ?auto_320840 ?auto_320843 ) ) ( not ( = ?auto_320840 ?auto_320844 ) ) ( not ( = ?auto_320840 ?auto_320845 ) ) ( not ( = ?auto_320840 ?auto_320846 ) ) ( not ( = ?auto_320840 ?auto_320847 ) ) ( not ( = ?auto_320840 ?auto_320848 ) ) ( not ( = ?auto_320840 ?auto_320849 ) ) ( not ( = ?auto_320841 ?auto_320842 ) ) ( not ( = ?auto_320841 ?auto_320843 ) ) ( not ( = ?auto_320841 ?auto_320844 ) ) ( not ( = ?auto_320841 ?auto_320845 ) ) ( not ( = ?auto_320841 ?auto_320846 ) ) ( not ( = ?auto_320841 ?auto_320847 ) ) ( not ( = ?auto_320841 ?auto_320848 ) ) ( not ( = ?auto_320841 ?auto_320849 ) ) ( not ( = ?auto_320842 ?auto_320843 ) ) ( not ( = ?auto_320842 ?auto_320844 ) ) ( not ( = ?auto_320842 ?auto_320845 ) ) ( not ( = ?auto_320842 ?auto_320846 ) ) ( not ( = ?auto_320842 ?auto_320847 ) ) ( not ( = ?auto_320842 ?auto_320848 ) ) ( not ( = ?auto_320842 ?auto_320849 ) ) ( not ( = ?auto_320843 ?auto_320844 ) ) ( not ( = ?auto_320843 ?auto_320845 ) ) ( not ( = ?auto_320843 ?auto_320846 ) ) ( not ( = ?auto_320843 ?auto_320847 ) ) ( not ( = ?auto_320843 ?auto_320848 ) ) ( not ( = ?auto_320843 ?auto_320849 ) ) ( not ( = ?auto_320844 ?auto_320845 ) ) ( not ( = ?auto_320844 ?auto_320846 ) ) ( not ( = ?auto_320844 ?auto_320847 ) ) ( not ( = ?auto_320844 ?auto_320848 ) ) ( not ( = ?auto_320844 ?auto_320849 ) ) ( not ( = ?auto_320845 ?auto_320846 ) ) ( not ( = ?auto_320845 ?auto_320847 ) ) ( not ( = ?auto_320845 ?auto_320848 ) ) ( not ( = ?auto_320845 ?auto_320849 ) ) ( not ( = ?auto_320846 ?auto_320847 ) ) ( not ( = ?auto_320846 ?auto_320848 ) ) ( not ( = ?auto_320846 ?auto_320849 ) ) ( not ( = ?auto_320847 ?auto_320848 ) ) ( not ( = ?auto_320847 ?auto_320849 ) ) ( not ( = ?auto_320848 ?auto_320849 ) ) ( ON ?auto_320847 ?auto_320848 ) ( ON ?auto_320846 ?auto_320847 ) ( ON ?auto_320845 ?auto_320846 ) ( ON ?auto_320844 ?auto_320845 ) ( CLEAR ?auto_320842 ) ( ON ?auto_320843 ?auto_320844 ) ( CLEAR ?auto_320843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_320836 ?auto_320837 ?auto_320838 ?auto_320839 ?auto_320840 ?auto_320841 ?auto_320842 ?auto_320843 )
      ( MAKE-13PILE ?auto_320836 ?auto_320837 ?auto_320838 ?auto_320839 ?auto_320840 ?auto_320841 ?auto_320842 ?auto_320843 ?auto_320844 ?auto_320845 ?auto_320846 ?auto_320847 ?auto_320848 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320863 - BLOCK
      ?auto_320864 - BLOCK
      ?auto_320865 - BLOCK
      ?auto_320866 - BLOCK
      ?auto_320867 - BLOCK
      ?auto_320868 - BLOCK
      ?auto_320869 - BLOCK
      ?auto_320870 - BLOCK
      ?auto_320871 - BLOCK
      ?auto_320872 - BLOCK
      ?auto_320873 - BLOCK
      ?auto_320874 - BLOCK
      ?auto_320875 - BLOCK
    )
    :vars
    (
      ?auto_320876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320875 ?auto_320876 ) ( ON-TABLE ?auto_320863 ) ( ON ?auto_320864 ?auto_320863 ) ( ON ?auto_320865 ?auto_320864 ) ( ON ?auto_320866 ?auto_320865 ) ( ON ?auto_320867 ?auto_320866 ) ( ON ?auto_320868 ?auto_320867 ) ( not ( = ?auto_320863 ?auto_320864 ) ) ( not ( = ?auto_320863 ?auto_320865 ) ) ( not ( = ?auto_320863 ?auto_320866 ) ) ( not ( = ?auto_320863 ?auto_320867 ) ) ( not ( = ?auto_320863 ?auto_320868 ) ) ( not ( = ?auto_320863 ?auto_320869 ) ) ( not ( = ?auto_320863 ?auto_320870 ) ) ( not ( = ?auto_320863 ?auto_320871 ) ) ( not ( = ?auto_320863 ?auto_320872 ) ) ( not ( = ?auto_320863 ?auto_320873 ) ) ( not ( = ?auto_320863 ?auto_320874 ) ) ( not ( = ?auto_320863 ?auto_320875 ) ) ( not ( = ?auto_320863 ?auto_320876 ) ) ( not ( = ?auto_320864 ?auto_320865 ) ) ( not ( = ?auto_320864 ?auto_320866 ) ) ( not ( = ?auto_320864 ?auto_320867 ) ) ( not ( = ?auto_320864 ?auto_320868 ) ) ( not ( = ?auto_320864 ?auto_320869 ) ) ( not ( = ?auto_320864 ?auto_320870 ) ) ( not ( = ?auto_320864 ?auto_320871 ) ) ( not ( = ?auto_320864 ?auto_320872 ) ) ( not ( = ?auto_320864 ?auto_320873 ) ) ( not ( = ?auto_320864 ?auto_320874 ) ) ( not ( = ?auto_320864 ?auto_320875 ) ) ( not ( = ?auto_320864 ?auto_320876 ) ) ( not ( = ?auto_320865 ?auto_320866 ) ) ( not ( = ?auto_320865 ?auto_320867 ) ) ( not ( = ?auto_320865 ?auto_320868 ) ) ( not ( = ?auto_320865 ?auto_320869 ) ) ( not ( = ?auto_320865 ?auto_320870 ) ) ( not ( = ?auto_320865 ?auto_320871 ) ) ( not ( = ?auto_320865 ?auto_320872 ) ) ( not ( = ?auto_320865 ?auto_320873 ) ) ( not ( = ?auto_320865 ?auto_320874 ) ) ( not ( = ?auto_320865 ?auto_320875 ) ) ( not ( = ?auto_320865 ?auto_320876 ) ) ( not ( = ?auto_320866 ?auto_320867 ) ) ( not ( = ?auto_320866 ?auto_320868 ) ) ( not ( = ?auto_320866 ?auto_320869 ) ) ( not ( = ?auto_320866 ?auto_320870 ) ) ( not ( = ?auto_320866 ?auto_320871 ) ) ( not ( = ?auto_320866 ?auto_320872 ) ) ( not ( = ?auto_320866 ?auto_320873 ) ) ( not ( = ?auto_320866 ?auto_320874 ) ) ( not ( = ?auto_320866 ?auto_320875 ) ) ( not ( = ?auto_320866 ?auto_320876 ) ) ( not ( = ?auto_320867 ?auto_320868 ) ) ( not ( = ?auto_320867 ?auto_320869 ) ) ( not ( = ?auto_320867 ?auto_320870 ) ) ( not ( = ?auto_320867 ?auto_320871 ) ) ( not ( = ?auto_320867 ?auto_320872 ) ) ( not ( = ?auto_320867 ?auto_320873 ) ) ( not ( = ?auto_320867 ?auto_320874 ) ) ( not ( = ?auto_320867 ?auto_320875 ) ) ( not ( = ?auto_320867 ?auto_320876 ) ) ( not ( = ?auto_320868 ?auto_320869 ) ) ( not ( = ?auto_320868 ?auto_320870 ) ) ( not ( = ?auto_320868 ?auto_320871 ) ) ( not ( = ?auto_320868 ?auto_320872 ) ) ( not ( = ?auto_320868 ?auto_320873 ) ) ( not ( = ?auto_320868 ?auto_320874 ) ) ( not ( = ?auto_320868 ?auto_320875 ) ) ( not ( = ?auto_320868 ?auto_320876 ) ) ( not ( = ?auto_320869 ?auto_320870 ) ) ( not ( = ?auto_320869 ?auto_320871 ) ) ( not ( = ?auto_320869 ?auto_320872 ) ) ( not ( = ?auto_320869 ?auto_320873 ) ) ( not ( = ?auto_320869 ?auto_320874 ) ) ( not ( = ?auto_320869 ?auto_320875 ) ) ( not ( = ?auto_320869 ?auto_320876 ) ) ( not ( = ?auto_320870 ?auto_320871 ) ) ( not ( = ?auto_320870 ?auto_320872 ) ) ( not ( = ?auto_320870 ?auto_320873 ) ) ( not ( = ?auto_320870 ?auto_320874 ) ) ( not ( = ?auto_320870 ?auto_320875 ) ) ( not ( = ?auto_320870 ?auto_320876 ) ) ( not ( = ?auto_320871 ?auto_320872 ) ) ( not ( = ?auto_320871 ?auto_320873 ) ) ( not ( = ?auto_320871 ?auto_320874 ) ) ( not ( = ?auto_320871 ?auto_320875 ) ) ( not ( = ?auto_320871 ?auto_320876 ) ) ( not ( = ?auto_320872 ?auto_320873 ) ) ( not ( = ?auto_320872 ?auto_320874 ) ) ( not ( = ?auto_320872 ?auto_320875 ) ) ( not ( = ?auto_320872 ?auto_320876 ) ) ( not ( = ?auto_320873 ?auto_320874 ) ) ( not ( = ?auto_320873 ?auto_320875 ) ) ( not ( = ?auto_320873 ?auto_320876 ) ) ( not ( = ?auto_320874 ?auto_320875 ) ) ( not ( = ?auto_320874 ?auto_320876 ) ) ( not ( = ?auto_320875 ?auto_320876 ) ) ( ON ?auto_320874 ?auto_320875 ) ( ON ?auto_320873 ?auto_320874 ) ( ON ?auto_320872 ?auto_320873 ) ( ON ?auto_320871 ?auto_320872 ) ( ON ?auto_320870 ?auto_320871 ) ( CLEAR ?auto_320868 ) ( ON ?auto_320869 ?auto_320870 ) ( CLEAR ?auto_320869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_320863 ?auto_320864 ?auto_320865 ?auto_320866 ?auto_320867 ?auto_320868 ?auto_320869 )
      ( MAKE-13PILE ?auto_320863 ?auto_320864 ?auto_320865 ?auto_320866 ?auto_320867 ?auto_320868 ?auto_320869 ?auto_320870 ?auto_320871 ?auto_320872 ?auto_320873 ?auto_320874 ?auto_320875 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320890 - BLOCK
      ?auto_320891 - BLOCK
      ?auto_320892 - BLOCK
      ?auto_320893 - BLOCK
      ?auto_320894 - BLOCK
      ?auto_320895 - BLOCK
      ?auto_320896 - BLOCK
      ?auto_320897 - BLOCK
      ?auto_320898 - BLOCK
      ?auto_320899 - BLOCK
      ?auto_320900 - BLOCK
      ?auto_320901 - BLOCK
      ?auto_320902 - BLOCK
    )
    :vars
    (
      ?auto_320903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320902 ?auto_320903 ) ( ON-TABLE ?auto_320890 ) ( ON ?auto_320891 ?auto_320890 ) ( ON ?auto_320892 ?auto_320891 ) ( ON ?auto_320893 ?auto_320892 ) ( ON ?auto_320894 ?auto_320893 ) ( ON ?auto_320895 ?auto_320894 ) ( not ( = ?auto_320890 ?auto_320891 ) ) ( not ( = ?auto_320890 ?auto_320892 ) ) ( not ( = ?auto_320890 ?auto_320893 ) ) ( not ( = ?auto_320890 ?auto_320894 ) ) ( not ( = ?auto_320890 ?auto_320895 ) ) ( not ( = ?auto_320890 ?auto_320896 ) ) ( not ( = ?auto_320890 ?auto_320897 ) ) ( not ( = ?auto_320890 ?auto_320898 ) ) ( not ( = ?auto_320890 ?auto_320899 ) ) ( not ( = ?auto_320890 ?auto_320900 ) ) ( not ( = ?auto_320890 ?auto_320901 ) ) ( not ( = ?auto_320890 ?auto_320902 ) ) ( not ( = ?auto_320890 ?auto_320903 ) ) ( not ( = ?auto_320891 ?auto_320892 ) ) ( not ( = ?auto_320891 ?auto_320893 ) ) ( not ( = ?auto_320891 ?auto_320894 ) ) ( not ( = ?auto_320891 ?auto_320895 ) ) ( not ( = ?auto_320891 ?auto_320896 ) ) ( not ( = ?auto_320891 ?auto_320897 ) ) ( not ( = ?auto_320891 ?auto_320898 ) ) ( not ( = ?auto_320891 ?auto_320899 ) ) ( not ( = ?auto_320891 ?auto_320900 ) ) ( not ( = ?auto_320891 ?auto_320901 ) ) ( not ( = ?auto_320891 ?auto_320902 ) ) ( not ( = ?auto_320891 ?auto_320903 ) ) ( not ( = ?auto_320892 ?auto_320893 ) ) ( not ( = ?auto_320892 ?auto_320894 ) ) ( not ( = ?auto_320892 ?auto_320895 ) ) ( not ( = ?auto_320892 ?auto_320896 ) ) ( not ( = ?auto_320892 ?auto_320897 ) ) ( not ( = ?auto_320892 ?auto_320898 ) ) ( not ( = ?auto_320892 ?auto_320899 ) ) ( not ( = ?auto_320892 ?auto_320900 ) ) ( not ( = ?auto_320892 ?auto_320901 ) ) ( not ( = ?auto_320892 ?auto_320902 ) ) ( not ( = ?auto_320892 ?auto_320903 ) ) ( not ( = ?auto_320893 ?auto_320894 ) ) ( not ( = ?auto_320893 ?auto_320895 ) ) ( not ( = ?auto_320893 ?auto_320896 ) ) ( not ( = ?auto_320893 ?auto_320897 ) ) ( not ( = ?auto_320893 ?auto_320898 ) ) ( not ( = ?auto_320893 ?auto_320899 ) ) ( not ( = ?auto_320893 ?auto_320900 ) ) ( not ( = ?auto_320893 ?auto_320901 ) ) ( not ( = ?auto_320893 ?auto_320902 ) ) ( not ( = ?auto_320893 ?auto_320903 ) ) ( not ( = ?auto_320894 ?auto_320895 ) ) ( not ( = ?auto_320894 ?auto_320896 ) ) ( not ( = ?auto_320894 ?auto_320897 ) ) ( not ( = ?auto_320894 ?auto_320898 ) ) ( not ( = ?auto_320894 ?auto_320899 ) ) ( not ( = ?auto_320894 ?auto_320900 ) ) ( not ( = ?auto_320894 ?auto_320901 ) ) ( not ( = ?auto_320894 ?auto_320902 ) ) ( not ( = ?auto_320894 ?auto_320903 ) ) ( not ( = ?auto_320895 ?auto_320896 ) ) ( not ( = ?auto_320895 ?auto_320897 ) ) ( not ( = ?auto_320895 ?auto_320898 ) ) ( not ( = ?auto_320895 ?auto_320899 ) ) ( not ( = ?auto_320895 ?auto_320900 ) ) ( not ( = ?auto_320895 ?auto_320901 ) ) ( not ( = ?auto_320895 ?auto_320902 ) ) ( not ( = ?auto_320895 ?auto_320903 ) ) ( not ( = ?auto_320896 ?auto_320897 ) ) ( not ( = ?auto_320896 ?auto_320898 ) ) ( not ( = ?auto_320896 ?auto_320899 ) ) ( not ( = ?auto_320896 ?auto_320900 ) ) ( not ( = ?auto_320896 ?auto_320901 ) ) ( not ( = ?auto_320896 ?auto_320902 ) ) ( not ( = ?auto_320896 ?auto_320903 ) ) ( not ( = ?auto_320897 ?auto_320898 ) ) ( not ( = ?auto_320897 ?auto_320899 ) ) ( not ( = ?auto_320897 ?auto_320900 ) ) ( not ( = ?auto_320897 ?auto_320901 ) ) ( not ( = ?auto_320897 ?auto_320902 ) ) ( not ( = ?auto_320897 ?auto_320903 ) ) ( not ( = ?auto_320898 ?auto_320899 ) ) ( not ( = ?auto_320898 ?auto_320900 ) ) ( not ( = ?auto_320898 ?auto_320901 ) ) ( not ( = ?auto_320898 ?auto_320902 ) ) ( not ( = ?auto_320898 ?auto_320903 ) ) ( not ( = ?auto_320899 ?auto_320900 ) ) ( not ( = ?auto_320899 ?auto_320901 ) ) ( not ( = ?auto_320899 ?auto_320902 ) ) ( not ( = ?auto_320899 ?auto_320903 ) ) ( not ( = ?auto_320900 ?auto_320901 ) ) ( not ( = ?auto_320900 ?auto_320902 ) ) ( not ( = ?auto_320900 ?auto_320903 ) ) ( not ( = ?auto_320901 ?auto_320902 ) ) ( not ( = ?auto_320901 ?auto_320903 ) ) ( not ( = ?auto_320902 ?auto_320903 ) ) ( ON ?auto_320901 ?auto_320902 ) ( ON ?auto_320900 ?auto_320901 ) ( ON ?auto_320899 ?auto_320900 ) ( ON ?auto_320898 ?auto_320899 ) ( ON ?auto_320897 ?auto_320898 ) ( CLEAR ?auto_320895 ) ( ON ?auto_320896 ?auto_320897 ) ( CLEAR ?auto_320896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_320890 ?auto_320891 ?auto_320892 ?auto_320893 ?auto_320894 ?auto_320895 ?auto_320896 )
      ( MAKE-13PILE ?auto_320890 ?auto_320891 ?auto_320892 ?auto_320893 ?auto_320894 ?auto_320895 ?auto_320896 ?auto_320897 ?auto_320898 ?auto_320899 ?auto_320900 ?auto_320901 ?auto_320902 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320917 - BLOCK
      ?auto_320918 - BLOCK
      ?auto_320919 - BLOCK
      ?auto_320920 - BLOCK
      ?auto_320921 - BLOCK
      ?auto_320922 - BLOCK
      ?auto_320923 - BLOCK
      ?auto_320924 - BLOCK
      ?auto_320925 - BLOCK
      ?auto_320926 - BLOCK
      ?auto_320927 - BLOCK
      ?auto_320928 - BLOCK
      ?auto_320929 - BLOCK
    )
    :vars
    (
      ?auto_320930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320929 ?auto_320930 ) ( ON-TABLE ?auto_320917 ) ( ON ?auto_320918 ?auto_320917 ) ( ON ?auto_320919 ?auto_320918 ) ( ON ?auto_320920 ?auto_320919 ) ( ON ?auto_320921 ?auto_320920 ) ( not ( = ?auto_320917 ?auto_320918 ) ) ( not ( = ?auto_320917 ?auto_320919 ) ) ( not ( = ?auto_320917 ?auto_320920 ) ) ( not ( = ?auto_320917 ?auto_320921 ) ) ( not ( = ?auto_320917 ?auto_320922 ) ) ( not ( = ?auto_320917 ?auto_320923 ) ) ( not ( = ?auto_320917 ?auto_320924 ) ) ( not ( = ?auto_320917 ?auto_320925 ) ) ( not ( = ?auto_320917 ?auto_320926 ) ) ( not ( = ?auto_320917 ?auto_320927 ) ) ( not ( = ?auto_320917 ?auto_320928 ) ) ( not ( = ?auto_320917 ?auto_320929 ) ) ( not ( = ?auto_320917 ?auto_320930 ) ) ( not ( = ?auto_320918 ?auto_320919 ) ) ( not ( = ?auto_320918 ?auto_320920 ) ) ( not ( = ?auto_320918 ?auto_320921 ) ) ( not ( = ?auto_320918 ?auto_320922 ) ) ( not ( = ?auto_320918 ?auto_320923 ) ) ( not ( = ?auto_320918 ?auto_320924 ) ) ( not ( = ?auto_320918 ?auto_320925 ) ) ( not ( = ?auto_320918 ?auto_320926 ) ) ( not ( = ?auto_320918 ?auto_320927 ) ) ( not ( = ?auto_320918 ?auto_320928 ) ) ( not ( = ?auto_320918 ?auto_320929 ) ) ( not ( = ?auto_320918 ?auto_320930 ) ) ( not ( = ?auto_320919 ?auto_320920 ) ) ( not ( = ?auto_320919 ?auto_320921 ) ) ( not ( = ?auto_320919 ?auto_320922 ) ) ( not ( = ?auto_320919 ?auto_320923 ) ) ( not ( = ?auto_320919 ?auto_320924 ) ) ( not ( = ?auto_320919 ?auto_320925 ) ) ( not ( = ?auto_320919 ?auto_320926 ) ) ( not ( = ?auto_320919 ?auto_320927 ) ) ( not ( = ?auto_320919 ?auto_320928 ) ) ( not ( = ?auto_320919 ?auto_320929 ) ) ( not ( = ?auto_320919 ?auto_320930 ) ) ( not ( = ?auto_320920 ?auto_320921 ) ) ( not ( = ?auto_320920 ?auto_320922 ) ) ( not ( = ?auto_320920 ?auto_320923 ) ) ( not ( = ?auto_320920 ?auto_320924 ) ) ( not ( = ?auto_320920 ?auto_320925 ) ) ( not ( = ?auto_320920 ?auto_320926 ) ) ( not ( = ?auto_320920 ?auto_320927 ) ) ( not ( = ?auto_320920 ?auto_320928 ) ) ( not ( = ?auto_320920 ?auto_320929 ) ) ( not ( = ?auto_320920 ?auto_320930 ) ) ( not ( = ?auto_320921 ?auto_320922 ) ) ( not ( = ?auto_320921 ?auto_320923 ) ) ( not ( = ?auto_320921 ?auto_320924 ) ) ( not ( = ?auto_320921 ?auto_320925 ) ) ( not ( = ?auto_320921 ?auto_320926 ) ) ( not ( = ?auto_320921 ?auto_320927 ) ) ( not ( = ?auto_320921 ?auto_320928 ) ) ( not ( = ?auto_320921 ?auto_320929 ) ) ( not ( = ?auto_320921 ?auto_320930 ) ) ( not ( = ?auto_320922 ?auto_320923 ) ) ( not ( = ?auto_320922 ?auto_320924 ) ) ( not ( = ?auto_320922 ?auto_320925 ) ) ( not ( = ?auto_320922 ?auto_320926 ) ) ( not ( = ?auto_320922 ?auto_320927 ) ) ( not ( = ?auto_320922 ?auto_320928 ) ) ( not ( = ?auto_320922 ?auto_320929 ) ) ( not ( = ?auto_320922 ?auto_320930 ) ) ( not ( = ?auto_320923 ?auto_320924 ) ) ( not ( = ?auto_320923 ?auto_320925 ) ) ( not ( = ?auto_320923 ?auto_320926 ) ) ( not ( = ?auto_320923 ?auto_320927 ) ) ( not ( = ?auto_320923 ?auto_320928 ) ) ( not ( = ?auto_320923 ?auto_320929 ) ) ( not ( = ?auto_320923 ?auto_320930 ) ) ( not ( = ?auto_320924 ?auto_320925 ) ) ( not ( = ?auto_320924 ?auto_320926 ) ) ( not ( = ?auto_320924 ?auto_320927 ) ) ( not ( = ?auto_320924 ?auto_320928 ) ) ( not ( = ?auto_320924 ?auto_320929 ) ) ( not ( = ?auto_320924 ?auto_320930 ) ) ( not ( = ?auto_320925 ?auto_320926 ) ) ( not ( = ?auto_320925 ?auto_320927 ) ) ( not ( = ?auto_320925 ?auto_320928 ) ) ( not ( = ?auto_320925 ?auto_320929 ) ) ( not ( = ?auto_320925 ?auto_320930 ) ) ( not ( = ?auto_320926 ?auto_320927 ) ) ( not ( = ?auto_320926 ?auto_320928 ) ) ( not ( = ?auto_320926 ?auto_320929 ) ) ( not ( = ?auto_320926 ?auto_320930 ) ) ( not ( = ?auto_320927 ?auto_320928 ) ) ( not ( = ?auto_320927 ?auto_320929 ) ) ( not ( = ?auto_320927 ?auto_320930 ) ) ( not ( = ?auto_320928 ?auto_320929 ) ) ( not ( = ?auto_320928 ?auto_320930 ) ) ( not ( = ?auto_320929 ?auto_320930 ) ) ( ON ?auto_320928 ?auto_320929 ) ( ON ?auto_320927 ?auto_320928 ) ( ON ?auto_320926 ?auto_320927 ) ( ON ?auto_320925 ?auto_320926 ) ( ON ?auto_320924 ?auto_320925 ) ( ON ?auto_320923 ?auto_320924 ) ( CLEAR ?auto_320921 ) ( ON ?auto_320922 ?auto_320923 ) ( CLEAR ?auto_320922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_320917 ?auto_320918 ?auto_320919 ?auto_320920 ?auto_320921 ?auto_320922 )
      ( MAKE-13PILE ?auto_320917 ?auto_320918 ?auto_320919 ?auto_320920 ?auto_320921 ?auto_320922 ?auto_320923 ?auto_320924 ?auto_320925 ?auto_320926 ?auto_320927 ?auto_320928 ?auto_320929 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320944 - BLOCK
      ?auto_320945 - BLOCK
      ?auto_320946 - BLOCK
      ?auto_320947 - BLOCK
      ?auto_320948 - BLOCK
      ?auto_320949 - BLOCK
      ?auto_320950 - BLOCK
      ?auto_320951 - BLOCK
      ?auto_320952 - BLOCK
      ?auto_320953 - BLOCK
      ?auto_320954 - BLOCK
      ?auto_320955 - BLOCK
      ?auto_320956 - BLOCK
    )
    :vars
    (
      ?auto_320957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320956 ?auto_320957 ) ( ON-TABLE ?auto_320944 ) ( ON ?auto_320945 ?auto_320944 ) ( ON ?auto_320946 ?auto_320945 ) ( ON ?auto_320947 ?auto_320946 ) ( ON ?auto_320948 ?auto_320947 ) ( not ( = ?auto_320944 ?auto_320945 ) ) ( not ( = ?auto_320944 ?auto_320946 ) ) ( not ( = ?auto_320944 ?auto_320947 ) ) ( not ( = ?auto_320944 ?auto_320948 ) ) ( not ( = ?auto_320944 ?auto_320949 ) ) ( not ( = ?auto_320944 ?auto_320950 ) ) ( not ( = ?auto_320944 ?auto_320951 ) ) ( not ( = ?auto_320944 ?auto_320952 ) ) ( not ( = ?auto_320944 ?auto_320953 ) ) ( not ( = ?auto_320944 ?auto_320954 ) ) ( not ( = ?auto_320944 ?auto_320955 ) ) ( not ( = ?auto_320944 ?auto_320956 ) ) ( not ( = ?auto_320944 ?auto_320957 ) ) ( not ( = ?auto_320945 ?auto_320946 ) ) ( not ( = ?auto_320945 ?auto_320947 ) ) ( not ( = ?auto_320945 ?auto_320948 ) ) ( not ( = ?auto_320945 ?auto_320949 ) ) ( not ( = ?auto_320945 ?auto_320950 ) ) ( not ( = ?auto_320945 ?auto_320951 ) ) ( not ( = ?auto_320945 ?auto_320952 ) ) ( not ( = ?auto_320945 ?auto_320953 ) ) ( not ( = ?auto_320945 ?auto_320954 ) ) ( not ( = ?auto_320945 ?auto_320955 ) ) ( not ( = ?auto_320945 ?auto_320956 ) ) ( not ( = ?auto_320945 ?auto_320957 ) ) ( not ( = ?auto_320946 ?auto_320947 ) ) ( not ( = ?auto_320946 ?auto_320948 ) ) ( not ( = ?auto_320946 ?auto_320949 ) ) ( not ( = ?auto_320946 ?auto_320950 ) ) ( not ( = ?auto_320946 ?auto_320951 ) ) ( not ( = ?auto_320946 ?auto_320952 ) ) ( not ( = ?auto_320946 ?auto_320953 ) ) ( not ( = ?auto_320946 ?auto_320954 ) ) ( not ( = ?auto_320946 ?auto_320955 ) ) ( not ( = ?auto_320946 ?auto_320956 ) ) ( not ( = ?auto_320946 ?auto_320957 ) ) ( not ( = ?auto_320947 ?auto_320948 ) ) ( not ( = ?auto_320947 ?auto_320949 ) ) ( not ( = ?auto_320947 ?auto_320950 ) ) ( not ( = ?auto_320947 ?auto_320951 ) ) ( not ( = ?auto_320947 ?auto_320952 ) ) ( not ( = ?auto_320947 ?auto_320953 ) ) ( not ( = ?auto_320947 ?auto_320954 ) ) ( not ( = ?auto_320947 ?auto_320955 ) ) ( not ( = ?auto_320947 ?auto_320956 ) ) ( not ( = ?auto_320947 ?auto_320957 ) ) ( not ( = ?auto_320948 ?auto_320949 ) ) ( not ( = ?auto_320948 ?auto_320950 ) ) ( not ( = ?auto_320948 ?auto_320951 ) ) ( not ( = ?auto_320948 ?auto_320952 ) ) ( not ( = ?auto_320948 ?auto_320953 ) ) ( not ( = ?auto_320948 ?auto_320954 ) ) ( not ( = ?auto_320948 ?auto_320955 ) ) ( not ( = ?auto_320948 ?auto_320956 ) ) ( not ( = ?auto_320948 ?auto_320957 ) ) ( not ( = ?auto_320949 ?auto_320950 ) ) ( not ( = ?auto_320949 ?auto_320951 ) ) ( not ( = ?auto_320949 ?auto_320952 ) ) ( not ( = ?auto_320949 ?auto_320953 ) ) ( not ( = ?auto_320949 ?auto_320954 ) ) ( not ( = ?auto_320949 ?auto_320955 ) ) ( not ( = ?auto_320949 ?auto_320956 ) ) ( not ( = ?auto_320949 ?auto_320957 ) ) ( not ( = ?auto_320950 ?auto_320951 ) ) ( not ( = ?auto_320950 ?auto_320952 ) ) ( not ( = ?auto_320950 ?auto_320953 ) ) ( not ( = ?auto_320950 ?auto_320954 ) ) ( not ( = ?auto_320950 ?auto_320955 ) ) ( not ( = ?auto_320950 ?auto_320956 ) ) ( not ( = ?auto_320950 ?auto_320957 ) ) ( not ( = ?auto_320951 ?auto_320952 ) ) ( not ( = ?auto_320951 ?auto_320953 ) ) ( not ( = ?auto_320951 ?auto_320954 ) ) ( not ( = ?auto_320951 ?auto_320955 ) ) ( not ( = ?auto_320951 ?auto_320956 ) ) ( not ( = ?auto_320951 ?auto_320957 ) ) ( not ( = ?auto_320952 ?auto_320953 ) ) ( not ( = ?auto_320952 ?auto_320954 ) ) ( not ( = ?auto_320952 ?auto_320955 ) ) ( not ( = ?auto_320952 ?auto_320956 ) ) ( not ( = ?auto_320952 ?auto_320957 ) ) ( not ( = ?auto_320953 ?auto_320954 ) ) ( not ( = ?auto_320953 ?auto_320955 ) ) ( not ( = ?auto_320953 ?auto_320956 ) ) ( not ( = ?auto_320953 ?auto_320957 ) ) ( not ( = ?auto_320954 ?auto_320955 ) ) ( not ( = ?auto_320954 ?auto_320956 ) ) ( not ( = ?auto_320954 ?auto_320957 ) ) ( not ( = ?auto_320955 ?auto_320956 ) ) ( not ( = ?auto_320955 ?auto_320957 ) ) ( not ( = ?auto_320956 ?auto_320957 ) ) ( ON ?auto_320955 ?auto_320956 ) ( ON ?auto_320954 ?auto_320955 ) ( ON ?auto_320953 ?auto_320954 ) ( ON ?auto_320952 ?auto_320953 ) ( ON ?auto_320951 ?auto_320952 ) ( ON ?auto_320950 ?auto_320951 ) ( CLEAR ?auto_320948 ) ( ON ?auto_320949 ?auto_320950 ) ( CLEAR ?auto_320949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_320944 ?auto_320945 ?auto_320946 ?auto_320947 ?auto_320948 ?auto_320949 )
      ( MAKE-13PILE ?auto_320944 ?auto_320945 ?auto_320946 ?auto_320947 ?auto_320948 ?auto_320949 ?auto_320950 ?auto_320951 ?auto_320952 ?auto_320953 ?auto_320954 ?auto_320955 ?auto_320956 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320971 - BLOCK
      ?auto_320972 - BLOCK
      ?auto_320973 - BLOCK
      ?auto_320974 - BLOCK
      ?auto_320975 - BLOCK
      ?auto_320976 - BLOCK
      ?auto_320977 - BLOCK
      ?auto_320978 - BLOCK
      ?auto_320979 - BLOCK
      ?auto_320980 - BLOCK
      ?auto_320981 - BLOCK
      ?auto_320982 - BLOCK
      ?auto_320983 - BLOCK
    )
    :vars
    (
      ?auto_320984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_320983 ?auto_320984 ) ( ON-TABLE ?auto_320971 ) ( ON ?auto_320972 ?auto_320971 ) ( ON ?auto_320973 ?auto_320972 ) ( ON ?auto_320974 ?auto_320973 ) ( not ( = ?auto_320971 ?auto_320972 ) ) ( not ( = ?auto_320971 ?auto_320973 ) ) ( not ( = ?auto_320971 ?auto_320974 ) ) ( not ( = ?auto_320971 ?auto_320975 ) ) ( not ( = ?auto_320971 ?auto_320976 ) ) ( not ( = ?auto_320971 ?auto_320977 ) ) ( not ( = ?auto_320971 ?auto_320978 ) ) ( not ( = ?auto_320971 ?auto_320979 ) ) ( not ( = ?auto_320971 ?auto_320980 ) ) ( not ( = ?auto_320971 ?auto_320981 ) ) ( not ( = ?auto_320971 ?auto_320982 ) ) ( not ( = ?auto_320971 ?auto_320983 ) ) ( not ( = ?auto_320971 ?auto_320984 ) ) ( not ( = ?auto_320972 ?auto_320973 ) ) ( not ( = ?auto_320972 ?auto_320974 ) ) ( not ( = ?auto_320972 ?auto_320975 ) ) ( not ( = ?auto_320972 ?auto_320976 ) ) ( not ( = ?auto_320972 ?auto_320977 ) ) ( not ( = ?auto_320972 ?auto_320978 ) ) ( not ( = ?auto_320972 ?auto_320979 ) ) ( not ( = ?auto_320972 ?auto_320980 ) ) ( not ( = ?auto_320972 ?auto_320981 ) ) ( not ( = ?auto_320972 ?auto_320982 ) ) ( not ( = ?auto_320972 ?auto_320983 ) ) ( not ( = ?auto_320972 ?auto_320984 ) ) ( not ( = ?auto_320973 ?auto_320974 ) ) ( not ( = ?auto_320973 ?auto_320975 ) ) ( not ( = ?auto_320973 ?auto_320976 ) ) ( not ( = ?auto_320973 ?auto_320977 ) ) ( not ( = ?auto_320973 ?auto_320978 ) ) ( not ( = ?auto_320973 ?auto_320979 ) ) ( not ( = ?auto_320973 ?auto_320980 ) ) ( not ( = ?auto_320973 ?auto_320981 ) ) ( not ( = ?auto_320973 ?auto_320982 ) ) ( not ( = ?auto_320973 ?auto_320983 ) ) ( not ( = ?auto_320973 ?auto_320984 ) ) ( not ( = ?auto_320974 ?auto_320975 ) ) ( not ( = ?auto_320974 ?auto_320976 ) ) ( not ( = ?auto_320974 ?auto_320977 ) ) ( not ( = ?auto_320974 ?auto_320978 ) ) ( not ( = ?auto_320974 ?auto_320979 ) ) ( not ( = ?auto_320974 ?auto_320980 ) ) ( not ( = ?auto_320974 ?auto_320981 ) ) ( not ( = ?auto_320974 ?auto_320982 ) ) ( not ( = ?auto_320974 ?auto_320983 ) ) ( not ( = ?auto_320974 ?auto_320984 ) ) ( not ( = ?auto_320975 ?auto_320976 ) ) ( not ( = ?auto_320975 ?auto_320977 ) ) ( not ( = ?auto_320975 ?auto_320978 ) ) ( not ( = ?auto_320975 ?auto_320979 ) ) ( not ( = ?auto_320975 ?auto_320980 ) ) ( not ( = ?auto_320975 ?auto_320981 ) ) ( not ( = ?auto_320975 ?auto_320982 ) ) ( not ( = ?auto_320975 ?auto_320983 ) ) ( not ( = ?auto_320975 ?auto_320984 ) ) ( not ( = ?auto_320976 ?auto_320977 ) ) ( not ( = ?auto_320976 ?auto_320978 ) ) ( not ( = ?auto_320976 ?auto_320979 ) ) ( not ( = ?auto_320976 ?auto_320980 ) ) ( not ( = ?auto_320976 ?auto_320981 ) ) ( not ( = ?auto_320976 ?auto_320982 ) ) ( not ( = ?auto_320976 ?auto_320983 ) ) ( not ( = ?auto_320976 ?auto_320984 ) ) ( not ( = ?auto_320977 ?auto_320978 ) ) ( not ( = ?auto_320977 ?auto_320979 ) ) ( not ( = ?auto_320977 ?auto_320980 ) ) ( not ( = ?auto_320977 ?auto_320981 ) ) ( not ( = ?auto_320977 ?auto_320982 ) ) ( not ( = ?auto_320977 ?auto_320983 ) ) ( not ( = ?auto_320977 ?auto_320984 ) ) ( not ( = ?auto_320978 ?auto_320979 ) ) ( not ( = ?auto_320978 ?auto_320980 ) ) ( not ( = ?auto_320978 ?auto_320981 ) ) ( not ( = ?auto_320978 ?auto_320982 ) ) ( not ( = ?auto_320978 ?auto_320983 ) ) ( not ( = ?auto_320978 ?auto_320984 ) ) ( not ( = ?auto_320979 ?auto_320980 ) ) ( not ( = ?auto_320979 ?auto_320981 ) ) ( not ( = ?auto_320979 ?auto_320982 ) ) ( not ( = ?auto_320979 ?auto_320983 ) ) ( not ( = ?auto_320979 ?auto_320984 ) ) ( not ( = ?auto_320980 ?auto_320981 ) ) ( not ( = ?auto_320980 ?auto_320982 ) ) ( not ( = ?auto_320980 ?auto_320983 ) ) ( not ( = ?auto_320980 ?auto_320984 ) ) ( not ( = ?auto_320981 ?auto_320982 ) ) ( not ( = ?auto_320981 ?auto_320983 ) ) ( not ( = ?auto_320981 ?auto_320984 ) ) ( not ( = ?auto_320982 ?auto_320983 ) ) ( not ( = ?auto_320982 ?auto_320984 ) ) ( not ( = ?auto_320983 ?auto_320984 ) ) ( ON ?auto_320982 ?auto_320983 ) ( ON ?auto_320981 ?auto_320982 ) ( ON ?auto_320980 ?auto_320981 ) ( ON ?auto_320979 ?auto_320980 ) ( ON ?auto_320978 ?auto_320979 ) ( ON ?auto_320977 ?auto_320978 ) ( ON ?auto_320976 ?auto_320977 ) ( CLEAR ?auto_320974 ) ( ON ?auto_320975 ?auto_320976 ) ( CLEAR ?auto_320975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_320971 ?auto_320972 ?auto_320973 ?auto_320974 ?auto_320975 )
      ( MAKE-13PILE ?auto_320971 ?auto_320972 ?auto_320973 ?auto_320974 ?auto_320975 ?auto_320976 ?auto_320977 ?auto_320978 ?auto_320979 ?auto_320980 ?auto_320981 ?auto_320982 ?auto_320983 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_320998 - BLOCK
      ?auto_320999 - BLOCK
      ?auto_321000 - BLOCK
      ?auto_321001 - BLOCK
      ?auto_321002 - BLOCK
      ?auto_321003 - BLOCK
      ?auto_321004 - BLOCK
      ?auto_321005 - BLOCK
      ?auto_321006 - BLOCK
      ?auto_321007 - BLOCK
      ?auto_321008 - BLOCK
      ?auto_321009 - BLOCK
      ?auto_321010 - BLOCK
    )
    :vars
    (
      ?auto_321011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321010 ?auto_321011 ) ( ON-TABLE ?auto_320998 ) ( ON ?auto_320999 ?auto_320998 ) ( ON ?auto_321000 ?auto_320999 ) ( ON ?auto_321001 ?auto_321000 ) ( not ( = ?auto_320998 ?auto_320999 ) ) ( not ( = ?auto_320998 ?auto_321000 ) ) ( not ( = ?auto_320998 ?auto_321001 ) ) ( not ( = ?auto_320998 ?auto_321002 ) ) ( not ( = ?auto_320998 ?auto_321003 ) ) ( not ( = ?auto_320998 ?auto_321004 ) ) ( not ( = ?auto_320998 ?auto_321005 ) ) ( not ( = ?auto_320998 ?auto_321006 ) ) ( not ( = ?auto_320998 ?auto_321007 ) ) ( not ( = ?auto_320998 ?auto_321008 ) ) ( not ( = ?auto_320998 ?auto_321009 ) ) ( not ( = ?auto_320998 ?auto_321010 ) ) ( not ( = ?auto_320998 ?auto_321011 ) ) ( not ( = ?auto_320999 ?auto_321000 ) ) ( not ( = ?auto_320999 ?auto_321001 ) ) ( not ( = ?auto_320999 ?auto_321002 ) ) ( not ( = ?auto_320999 ?auto_321003 ) ) ( not ( = ?auto_320999 ?auto_321004 ) ) ( not ( = ?auto_320999 ?auto_321005 ) ) ( not ( = ?auto_320999 ?auto_321006 ) ) ( not ( = ?auto_320999 ?auto_321007 ) ) ( not ( = ?auto_320999 ?auto_321008 ) ) ( not ( = ?auto_320999 ?auto_321009 ) ) ( not ( = ?auto_320999 ?auto_321010 ) ) ( not ( = ?auto_320999 ?auto_321011 ) ) ( not ( = ?auto_321000 ?auto_321001 ) ) ( not ( = ?auto_321000 ?auto_321002 ) ) ( not ( = ?auto_321000 ?auto_321003 ) ) ( not ( = ?auto_321000 ?auto_321004 ) ) ( not ( = ?auto_321000 ?auto_321005 ) ) ( not ( = ?auto_321000 ?auto_321006 ) ) ( not ( = ?auto_321000 ?auto_321007 ) ) ( not ( = ?auto_321000 ?auto_321008 ) ) ( not ( = ?auto_321000 ?auto_321009 ) ) ( not ( = ?auto_321000 ?auto_321010 ) ) ( not ( = ?auto_321000 ?auto_321011 ) ) ( not ( = ?auto_321001 ?auto_321002 ) ) ( not ( = ?auto_321001 ?auto_321003 ) ) ( not ( = ?auto_321001 ?auto_321004 ) ) ( not ( = ?auto_321001 ?auto_321005 ) ) ( not ( = ?auto_321001 ?auto_321006 ) ) ( not ( = ?auto_321001 ?auto_321007 ) ) ( not ( = ?auto_321001 ?auto_321008 ) ) ( not ( = ?auto_321001 ?auto_321009 ) ) ( not ( = ?auto_321001 ?auto_321010 ) ) ( not ( = ?auto_321001 ?auto_321011 ) ) ( not ( = ?auto_321002 ?auto_321003 ) ) ( not ( = ?auto_321002 ?auto_321004 ) ) ( not ( = ?auto_321002 ?auto_321005 ) ) ( not ( = ?auto_321002 ?auto_321006 ) ) ( not ( = ?auto_321002 ?auto_321007 ) ) ( not ( = ?auto_321002 ?auto_321008 ) ) ( not ( = ?auto_321002 ?auto_321009 ) ) ( not ( = ?auto_321002 ?auto_321010 ) ) ( not ( = ?auto_321002 ?auto_321011 ) ) ( not ( = ?auto_321003 ?auto_321004 ) ) ( not ( = ?auto_321003 ?auto_321005 ) ) ( not ( = ?auto_321003 ?auto_321006 ) ) ( not ( = ?auto_321003 ?auto_321007 ) ) ( not ( = ?auto_321003 ?auto_321008 ) ) ( not ( = ?auto_321003 ?auto_321009 ) ) ( not ( = ?auto_321003 ?auto_321010 ) ) ( not ( = ?auto_321003 ?auto_321011 ) ) ( not ( = ?auto_321004 ?auto_321005 ) ) ( not ( = ?auto_321004 ?auto_321006 ) ) ( not ( = ?auto_321004 ?auto_321007 ) ) ( not ( = ?auto_321004 ?auto_321008 ) ) ( not ( = ?auto_321004 ?auto_321009 ) ) ( not ( = ?auto_321004 ?auto_321010 ) ) ( not ( = ?auto_321004 ?auto_321011 ) ) ( not ( = ?auto_321005 ?auto_321006 ) ) ( not ( = ?auto_321005 ?auto_321007 ) ) ( not ( = ?auto_321005 ?auto_321008 ) ) ( not ( = ?auto_321005 ?auto_321009 ) ) ( not ( = ?auto_321005 ?auto_321010 ) ) ( not ( = ?auto_321005 ?auto_321011 ) ) ( not ( = ?auto_321006 ?auto_321007 ) ) ( not ( = ?auto_321006 ?auto_321008 ) ) ( not ( = ?auto_321006 ?auto_321009 ) ) ( not ( = ?auto_321006 ?auto_321010 ) ) ( not ( = ?auto_321006 ?auto_321011 ) ) ( not ( = ?auto_321007 ?auto_321008 ) ) ( not ( = ?auto_321007 ?auto_321009 ) ) ( not ( = ?auto_321007 ?auto_321010 ) ) ( not ( = ?auto_321007 ?auto_321011 ) ) ( not ( = ?auto_321008 ?auto_321009 ) ) ( not ( = ?auto_321008 ?auto_321010 ) ) ( not ( = ?auto_321008 ?auto_321011 ) ) ( not ( = ?auto_321009 ?auto_321010 ) ) ( not ( = ?auto_321009 ?auto_321011 ) ) ( not ( = ?auto_321010 ?auto_321011 ) ) ( ON ?auto_321009 ?auto_321010 ) ( ON ?auto_321008 ?auto_321009 ) ( ON ?auto_321007 ?auto_321008 ) ( ON ?auto_321006 ?auto_321007 ) ( ON ?auto_321005 ?auto_321006 ) ( ON ?auto_321004 ?auto_321005 ) ( ON ?auto_321003 ?auto_321004 ) ( CLEAR ?auto_321001 ) ( ON ?auto_321002 ?auto_321003 ) ( CLEAR ?auto_321002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_320998 ?auto_320999 ?auto_321000 ?auto_321001 ?auto_321002 )
      ( MAKE-13PILE ?auto_320998 ?auto_320999 ?auto_321000 ?auto_321001 ?auto_321002 ?auto_321003 ?auto_321004 ?auto_321005 ?auto_321006 ?auto_321007 ?auto_321008 ?auto_321009 ?auto_321010 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_321025 - BLOCK
      ?auto_321026 - BLOCK
      ?auto_321027 - BLOCK
      ?auto_321028 - BLOCK
      ?auto_321029 - BLOCK
      ?auto_321030 - BLOCK
      ?auto_321031 - BLOCK
      ?auto_321032 - BLOCK
      ?auto_321033 - BLOCK
      ?auto_321034 - BLOCK
      ?auto_321035 - BLOCK
      ?auto_321036 - BLOCK
      ?auto_321037 - BLOCK
    )
    :vars
    (
      ?auto_321038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321037 ?auto_321038 ) ( ON-TABLE ?auto_321025 ) ( ON ?auto_321026 ?auto_321025 ) ( ON ?auto_321027 ?auto_321026 ) ( not ( = ?auto_321025 ?auto_321026 ) ) ( not ( = ?auto_321025 ?auto_321027 ) ) ( not ( = ?auto_321025 ?auto_321028 ) ) ( not ( = ?auto_321025 ?auto_321029 ) ) ( not ( = ?auto_321025 ?auto_321030 ) ) ( not ( = ?auto_321025 ?auto_321031 ) ) ( not ( = ?auto_321025 ?auto_321032 ) ) ( not ( = ?auto_321025 ?auto_321033 ) ) ( not ( = ?auto_321025 ?auto_321034 ) ) ( not ( = ?auto_321025 ?auto_321035 ) ) ( not ( = ?auto_321025 ?auto_321036 ) ) ( not ( = ?auto_321025 ?auto_321037 ) ) ( not ( = ?auto_321025 ?auto_321038 ) ) ( not ( = ?auto_321026 ?auto_321027 ) ) ( not ( = ?auto_321026 ?auto_321028 ) ) ( not ( = ?auto_321026 ?auto_321029 ) ) ( not ( = ?auto_321026 ?auto_321030 ) ) ( not ( = ?auto_321026 ?auto_321031 ) ) ( not ( = ?auto_321026 ?auto_321032 ) ) ( not ( = ?auto_321026 ?auto_321033 ) ) ( not ( = ?auto_321026 ?auto_321034 ) ) ( not ( = ?auto_321026 ?auto_321035 ) ) ( not ( = ?auto_321026 ?auto_321036 ) ) ( not ( = ?auto_321026 ?auto_321037 ) ) ( not ( = ?auto_321026 ?auto_321038 ) ) ( not ( = ?auto_321027 ?auto_321028 ) ) ( not ( = ?auto_321027 ?auto_321029 ) ) ( not ( = ?auto_321027 ?auto_321030 ) ) ( not ( = ?auto_321027 ?auto_321031 ) ) ( not ( = ?auto_321027 ?auto_321032 ) ) ( not ( = ?auto_321027 ?auto_321033 ) ) ( not ( = ?auto_321027 ?auto_321034 ) ) ( not ( = ?auto_321027 ?auto_321035 ) ) ( not ( = ?auto_321027 ?auto_321036 ) ) ( not ( = ?auto_321027 ?auto_321037 ) ) ( not ( = ?auto_321027 ?auto_321038 ) ) ( not ( = ?auto_321028 ?auto_321029 ) ) ( not ( = ?auto_321028 ?auto_321030 ) ) ( not ( = ?auto_321028 ?auto_321031 ) ) ( not ( = ?auto_321028 ?auto_321032 ) ) ( not ( = ?auto_321028 ?auto_321033 ) ) ( not ( = ?auto_321028 ?auto_321034 ) ) ( not ( = ?auto_321028 ?auto_321035 ) ) ( not ( = ?auto_321028 ?auto_321036 ) ) ( not ( = ?auto_321028 ?auto_321037 ) ) ( not ( = ?auto_321028 ?auto_321038 ) ) ( not ( = ?auto_321029 ?auto_321030 ) ) ( not ( = ?auto_321029 ?auto_321031 ) ) ( not ( = ?auto_321029 ?auto_321032 ) ) ( not ( = ?auto_321029 ?auto_321033 ) ) ( not ( = ?auto_321029 ?auto_321034 ) ) ( not ( = ?auto_321029 ?auto_321035 ) ) ( not ( = ?auto_321029 ?auto_321036 ) ) ( not ( = ?auto_321029 ?auto_321037 ) ) ( not ( = ?auto_321029 ?auto_321038 ) ) ( not ( = ?auto_321030 ?auto_321031 ) ) ( not ( = ?auto_321030 ?auto_321032 ) ) ( not ( = ?auto_321030 ?auto_321033 ) ) ( not ( = ?auto_321030 ?auto_321034 ) ) ( not ( = ?auto_321030 ?auto_321035 ) ) ( not ( = ?auto_321030 ?auto_321036 ) ) ( not ( = ?auto_321030 ?auto_321037 ) ) ( not ( = ?auto_321030 ?auto_321038 ) ) ( not ( = ?auto_321031 ?auto_321032 ) ) ( not ( = ?auto_321031 ?auto_321033 ) ) ( not ( = ?auto_321031 ?auto_321034 ) ) ( not ( = ?auto_321031 ?auto_321035 ) ) ( not ( = ?auto_321031 ?auto_321036 ) ) ( not ( = ?auto_321031 ?auto_321037 ) ) ( not ( = ?auto_321031 ?auto_321038 ) ) ( not ( = ?auto_321032 ?auto_321033 ) ) ( not ( = ?auto_321032 ?auto_321034 ) ) ( not ( = ?auto_321032 ?auto_321035 ) ) ( not ( = ?auto_321032 ?auto_321036 ) ) ( not ( = ?auto_321032 ?auto_321037 ) ) ( not ( = ?auto_321032 ?auto_321038 ) ) ( not ( = ?auto_321033 ?auto_321034 ) ) ( not ( = ?auto_321033 ?auto_321035 ) ) ( not ( = ?auto_321033 ?auto_321036 ) ) ( not ( = ?auto_321033 ?auto_321037 ) ) ( not ( = ?auto_321033 ?auto_321038 ) ) ( not ( = ?auto_321034 ?auto_321035 ) ) ( not ( = ?auto_321034 ?auto_321036 ) ) ( not ( = ?auto_321034 ?auto_321037 ) ) ( not ( = ?auto_321034 ?auto_321038 ) ) ( not ( = ?auto_321035 ?auto_321036 ) ) ( not ( = ?auto_321035 ?auto_321037 ) ) ( not ( = ?auto_321035 ?auto_321038 ) ) ( not ( = ?auto_321036 ?auto_321037 ) ) ( not ( = ?auto_321036 ?auto_321038 ) ) ( not ( = ?auto_321037 ?auto_321038 ) ) ( ON ?auto_321036 ?auto_321037 ) ( ON ?auto_321035 ?auto_321036 ) ( ON ?auto_321034 ?auto_321035 ) ( ON ?auto_321033 ?auto_321034 ) ( ON ?auto_321032 ?auto_321033 ) ( ON ?auto_321031 ?auto_321032 ) ( ON ?auto_321030 ?auto_321031 ) ( ON ?auto_321029 ?auto_321030 ) ( CLEAR ?auto_321027 ) ( ON ?auto_321028 ?auto_321029 ) ( CLEAR ?auto_321028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_321025 ?auto_321026 ?auto_321027 ?auto_321028 )
      ( MAKE-13PILE ?auto_321025 ?auto_321026 ?auto_321027 ?auto_321028 ?auto_321029 ?auto_321030 ?auto_321031 ?auto_321032 ?auto_321033 ?auto_321034 ?auto_321035 ?auto_321036 ?auto_321037 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_321052 - BLOCK
      ?auto_321053 - BLOCK
      ?auto_321054 - BLOCK
      ?auto_321055 - BLOCK
      ?auto_321056 - BLOCK
      ?auto_321057 - BLOCK
      ?auto_321058 - BLOCK
      ?auto_321059 - BLOCK
      ?auto_321060 - BLOCK
      ?auto_321061 - BLOCK
      ?auto_321062 - BLOCK
      ?auto_321063 - BLOCK
      ?auto_321064 - BLOCK
    )
    :vars
    (
      ?auto_321065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321064 ?auto_321065 ) ( ON-TABLE ?auto_321052 ) ( ON ?auto_321053 ?auto_321052 ) ( ON ?auto_321054 ?auto_321053 ) ( not ( = ?auto_321052 ?auto_321053 ) ) ( not ( = ?auto_321052 ?auto_321054 ) ) ( not ( = ?auto_321052 ?auto_321055 ) ) ( not ( = ?auto_321052 ?auto_321056 ) ) ( not ( = ?auto_321052 ?auto_321057 ) ) ( not ( = ?auto_321052 ?auto_321058 ) ) ( not ( = ?auto_321052 ?auto_321059 ) ) ( not ( = ?auto_321052 ?auto_321060 ) ) ( not ( = ?auto_321052 ?auto_321061 ) ) ( not ( = ?auto_321052 ?auto_321062 ) ) ( not ( = ?auto_321052 ?auto_321063 ) ) ( not ( = ?auto_321052 ?auto_321064 ) ) ( not ( = ?auto_321052 ?auto_321065 ) ) ( not ( = ?auto_321053 ?auto_321054 ) ) ( not ( = ?auto_321053 ?auto_321055 ) ) ( not ( = ?auto_321053 ?auto_321056 ) ) ( not ( = ?auto_321053 ?auto_321057 ) ) ( not ( = ?auto_321053 ?auto_321058 ) ) ( not ( = ?auto_321053 ?auto_321059 ) ) ( not ( = ?auto_321053 ?auto_321060 ) ) ( not ( = ?auto_321053 ?auto_321061 ) ) ( not ( = ?auto_321053 ?auto_321062 ) ) ( not ( = ?auto_321053 ?auto_321063 ) ) ( not ( = ?auto_321053 ?auto_321064 ) ) ( not ( = ?auto_321053 ?auto_321065 ) ) ( not ( = ?auto_321054 ?auto_321055 ) ) ( not ( = ?auto_321054 ?auto_321056 ) ) ( not ( = ?auto_321054 ?auto_321057 ) ) ( not ( = ?auto_321054 ?auto_321058 ) ) ( not ( = ?auto_321054 ?auto_321059 ) ) ( not ( = ?auto_321054 ?auto_321060 ) ) ( not ( = ?auto_321054 ?auto_321061 ) ) ( not ( = ?auto_321054 ?auto_321062 ) ) ( not ( = ?auto_321054 ?auto_321063 ) ) ( not ( = ?auto_321054 ?auto_321064 ) ) ( not ( = ?auto_321054 ?auto_321065 ) ) ( not ( = ?auto_321055 ?auto_321056 ) ) ( not ( = ?auto_321055 ?auto_321057 ) ) ( not ( = ?auto_321055 ?auto_321058 ) ) ( not ( = ?auto_321055 ?auto_321059 ) ) ( not ( = ?auto_321055 ?auto_321060 ) ) ( not ( = ?auto_321055 ?auto_321061 ) ) ( not ( = ?auto_321055 ?auto_321062 ) ) ( not ( = ?auto_321055 ?auto_321063 ) ) ( not ( = ?auto_321055 ?auto_321064 ) ) ( not ( = ?auto_321055 ?auto_321065 ) ) ( not ( = ?auto_321056 ?auto_321057 ) ) ( not ( = ?auto_321056 ?auto_321058 ) ) ( not ( = ?auto_321056 ?auto_321059 ) ) ( not ( = ?auto_321056 ?auto_321060 ) ) ( not ( = ?auto_321056 ?auto_321061 ) ) ( not ( = ?auto_321056 ?auto_321062 ) ) ( not ( = ?auto_321056 ?auto_321063 ) ) ( not ( = ?auto_321056 ?auto_321064 ) ) ( not ( = ?auto_321056 ?auto_321065 ) ) ( not ( = ?auto_321057 ?auto_321058 ) ) ( not ( = ?auto_321057 ?auto_321059 ) ) ( not ( = ?auto_321057 ?auto_321060 ) ) ( not ( = ?auto_321057 ?auto_321061 ) ) ( not ( = ?auto_321057 ?auto_321062 ) ) ( not ( = ?auto_321057 ?auto_321063 ) ) ( not ( = ?auto_321057 ?auto_321064 ) ) ( not ( = ?auto_321057 ?auto_321065 ) ) ( not ( = ?auto_321058 ?auto_321059 ) ) ( not ( = ?auto_321058 ?auto_321060 ) ) ( not ( = ?auto_321058 ?auto_321061 ) ) ( not ( = ?auto_321058 ?auto_321062 ) ) ( not ( = ?auto_321058 ?auto_321063 ) ) ( not ( = ?auto_321058 ?auto_321064 ) ) ( not ( = ?auto_321058 ?auto_321065 ) ) ( not ( = ?auto_321059 ?auto_321060 ) ) ( not ( = ?auto_321059 ?auto_321061 ) ) ( not ( = ?auto_321059 ?auto_321062 ) ) ( not ( = ?auto_321059 ?auto_321063 ) ) ( not ( = ?auto_321059 ?auto_321064 ) ) ( not ( = ?auto_321059 ?auto_321065 ) ) ( not ( = ?auto_321060 ?auto_321061 ) ) ( not ( = ?auto_321060 ?auto_321062 ) ) ( not ( = ?auto_321060 ?auto_321063 ) ) ( not ( = ?auto_321060 ?auto_321064 ) ) ( not ( = ?auto_321060 ?auto_321065 ) ) ( not ( = ?auto_321061 ?auto_321062 ) ) ( not ( = ?auto_321061 ?auto_321063 ) ) ( not ( = ?auto_321061 ?auto_321064 ) ) ( not ( = ?auto_321061 ?auto_321065 ) ) ( not ( = ?auto_321062 ?auto_321063 ) ) ( not ( = ?auto_321062 ?auto_321064 ) ) ( not ( = ?auto_321062 ?auto_321065 ) ) ( not ( = ?auto_321063 ?auto_321064 ) ) ( not ( = ?auto_321063 ?auto_321065 ) ) ( not ( = ?auto_321064 ?auto_321065 ) ) ( ON ?auto_321063 ?auto_321064 ) ( ON ?auto_321062 ?auto_321063 ) ( ON ?auto_321061 ?auto_321062 ) ( ON ?auto_321060 ?auto_321061 ) ( ON ?auto_321059 ?auto_321060 ) ( ON ?auto_321058 ?auto_321059 ) ( ON ?auto_321057 ?auto_321058 ) ( ON ?auto_321056 ?auto_321057 ) ( CLEAR ?auto_321054 ) ( ON ?auto_321055 ?auto_321056 ) ( CLEAR ?auto_321055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_321052 ?auto_321053 ?auto_321054 ?auto_321055 )
      ( MAKE-13PILE ?auto_321052 ?auto_321053 ?auto_321054 ?auto_321055 ?auto_321056 ?auto_321057 ?auto_321058 ?auto_321059 ?auto_321060 ?auto_321061 ?auto_321062 ?auto_321063 ?auto_321064 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_321079 - BLOCK
      ?auto_321080 - BLOCK
      ?auto_321081 - BLOCK
      ?auto_321082 - BLOCK
      ?auto_321083 - BLOCK
      ?auto_321084 - BLOCK
      ?auto_321085 - BLOCK
      ?auto_321086 - BLOCK
      ?auto_321087 - BLOCK
      ?auto_321088 - BLOCK
      ?auto_321089 - BLOCK
      ?auto_321090 - BLOCK
      ?auto_321091 - BLOCK
    )
    :vars
    (
      ?auto_321092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321091 ?auto_321092 ) ( ON-TABLE ?auto_321079 ) ( ON ?auto_321080 ?auto_321079 ) ( not ( = ?auto_321079 ?auto_321080 ) ) ( not ( = ?auto_321079 ?auto_321081 ) ) ( not ( = ?auto_321079 ?auto_321082 ) ) ( not ( = ?auto_321079 ?auto_321083 ) ) ( not ( = ?auto_321079 ?auto_321084 ) ) ( not ( = ?auto_321079 ?auto_321085 ) ) ( not ( = ?auto_321079 ?auto_321086 ) ) ( not ( = ?auto_321079 ?auto_321087 ) ) ( not ( = ?auto_321079 ?auto_321088 ) ) ( not ( = ?auto_321079 ?auto_321089 ) ) ( not ( = ?auto_321079 ?auto_321090 ) ) ( not ( = ?auto_321079 ?auto_321091 ) ) ( not ( = ?auto_321079 ?auto_321092 ) ) ( not ( = ?auto_321080 ?auto_321081 ) ) ( not ( = ?auto_321080 ?auto_321082 ) ) ( not ( = ?auto_321080 ?auto_321083 ) ) ( not ( = ?auto_321080 ?auto_321084 ) ) ( not ( = ?auto_321080 ?auto_321085 ) ) ( not ( = ?auto_321080 ?auto_321086 ) ) ( not ( = ?auto_321080 ?auto_321087 ) ) ( not ( = ?auto_321080 ?auto_321088 ) ) ( not ( = ?auto_321080 ?auto_321089 ) ) ( not ( = ?auto_321080 ?auto_321090 ) ) ( not ( = ?auto_321080 ?auto_321091 ) ) ( not ( = ?auto_321080 ?auto_321092 ) ) ( not ( = ?auto_321081 ?auto_321082 ) ) ( not ( = ?auto_321081 ?auto_321083 ) ) ( not ( = ?auto_321081 ?auto_321084 ) ) ( not ( = ?auto_321081 ?auto_321085 ) ) ( not ( = ?auto_321081 ?auto_321086 ) ) ( not ( = ?auto_321081 ?auto_321087 ) ) ( not ( = ?auto_321081 ?auto_321088 ) ) ( not ( = ?auto_321081 ?auto_321089 ) ) ( not ( = ?auto_321081 ?auto_321090 ) ) ( not ( = ?auto_321081 ?auto_321091 ) ) ( not ( = ?auto_321081 ?auto_321092 ) ) ( not ( = ?auto_321082 ?auto_321083 ) ) ( not ( = ?auto_321082 ?auto_321084 ) ) ( not ( = ?auto_321082 ?auto_321085 ) ) ( not ( = ?auto_321082 ?auto_321086 ) ) ( not ( = ?auto_321082 ?auto_321087 ) ) ( not ( = ?auto_321082 ?auto_321088 ) ) ( not ( = ?auto_321082 ?auto_321089 ) ) ( not ( = ?auto_321082 ?auto_321090 ) ) ( not ( = ?auto_321082 ?auto_321091 ) ) ( not ( = ?auto_321082 ?auto_321092 ) ) ( not ( = ?auto_321083 ?auto_321084 ) ) ( not ( = ?auto_321083 ?auto_321085 ) ) ( not ( = ?auto_321083 ?auto_321086 ) ) ( not ( = ?auto_321083 ?auto_321087 ) ) ( not ( = ?auto_321083 ?auto_321088 ) ) ( not ( = ?auto_321083 ?auto_321089 ) ) ( not ( = ?auto_321083 ?auto_321090 ) ) ( not ( = ?auto_321083 ?auto_321091 ) ) ( not ( = ?auto_321083 ?auto_321092 ) ) ( not ( = ?auto_321084 ?auto_321085 ) ) ( not ( = ?auto_321084 ?auto_321086 ) ) ( not ( = ?auto_321084 ?auto_321087 ) ) ( not ( = ?auto_321084 ?auto_321088 ) ) ( not ( = ?auto_321084 ?auto_321089 ) ) ( not ( = ?auto_321084 ?auto_321090 ) ) ( not ( = ?auto_321084 ?auto_321091 ) ) ( not ( = ?auto_321084 ?auto_321092 ) ) ( not ( = ?auto_321085 ?auto_321086 ) ) ( not ( = ?auto_321085 ?auto_321087 ) ) ( not ( = ?auto_321085 ?auto_321088 ) ) ( not ( = ?auto_321085 ?auto_321089 ) ) ( not ( = ?auto_321085 ?auto_321090 ) ) ( not ( = ?auto_321085 ?auto_321091 ) ) ( not ( = ?auto_321085 ?auto_321092 ) ) ( not ( = ?auto_321086 ?auto_321087 ) ) ( not ( = ?auto_321086 ?auto_321088 ) ) ( not ( = ?auto_321086 ?auto_321089 ) ) ( not ( = ?auto_321086 ?auto_321090 ) ) ( not ( = ?auto_321086 ?auto_321091 ) ) ( not ( = ?auto_321086 ?auto_321092 ) ) ( not ( = ?auto_321087 ?auto_321088 ) ) ( not ( = ?auto_321087 ?auto_321089 ) ) ( not ( = ?auto_321087 ?auto_321090 ) ) ( not ( = ?auto_321087 ?auto_321091 ) ) ( not ( = ?auto_321087 ?auto_321092 ) ) ( not ( = ?auto_321088 ?auto_321089 ) ) ( not ( = ?auto_321088 ?auto_321090 ) ) ( not ( = ?auto_321088 ?auto_321091 ) ) ( not ( = ?auto_321088 ?auto_321092 ) ) ( not ( = ?auto_321089 ?auto_321090 ) ) ( not ( = ?auto_321089 ?auto_321091 ) ) ( not ( = ?auto_321089 ?auto_321092 ) ) ( not ( = ?auto_321090 ?auto_321091 ) ) ( not ( = ?auto_321090 ?auto_321092 ) ) ( not ( = ?auto_321091 ?auto_321092 ) ) ( ON ?auto_321090 ?auto_321091 ) ( ON ?auto_321089 ?auto_321090 ) ( ON ?auto_321088 ?auto_321089 ) ( ON ?auto_321087 ?auto_321088 ) ( ON ?auto_321086 ?auto_321087 ) ( ON ?auto_321085 ?auto_321086 ) ( ON ?auto_321084 ?auto_321085 ) ( ON ?auto_321083 ?auto_321084 ) ( ON ?auto_321082 ?auto_321083 ) ( CLEAR ?auto_321080 ) ( ON ?auto_321081 ?auto_321082 ) ( CLEAR ?auto_321081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_321079 ?auto_321080 ?auto_321081 )
      ( MAKE-13PILE ?auto_321079 ?auto_321080 ?auto_321081 ?auto_321082 ?auto_321083 ?auto_321084 ?auto_321085 ?auto_321086 ?auto_321087 ?auto_321088 ?auto_321089 ?auto_321090 ?auto_321091 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_321106 - BLOCK
      ?auto_321107 - BLOCK
      ?auto_321108 - BLOCK
      ?auto_321109 - BLOCK
      ?auto_321110 - BLOCK
      ?auto_321111 - BLOCK
      ?auto_321112 - BLOCK
      ?auto_321113 - BLOCK
      ?auto_321114 - BLOCK
      ?auto_321115 - BLOCK
      ?auto_321116 - BLOCK
      ?auto_321117 - BLOCK
      ?auto_321118 - BLOCK
    )
    :vars
    (
      ?auto_321119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321118 ?auto_321119 ) ( ON-TABLE ?auto_321106 ) ( ON ?auto_321107 ?auto_321106 ) ( not ( = ?auto_321106 ?auto_321107 ) ) ( not ( = ?auto_321106 ?auto_321108 ) ) ( not ( = ?auto_321106 ?auto_321109 ) ) ( not ( = ?auto_321106 ?auto_321110 ) ) ( not ( = ?auto_321106 ?auto_321111 ) ) ( not ( = ?auto_321106 ?auto_321112 ) ) ( not ( = ?auto_321106 ?auto_321113 ) ) ( not ( = ?auto_321106 ?auto_321114 ) ) ( not ( = ?auto_321106 ?auto_321115 ) ) ( not ( = ?auto_321106 ?auto_321116 ) ) ( not ( = ?auto_321106 ?auto_321117 ) ) ( not ( = ?auto_321106 ?auto_321118 ) ) ( not ( = ?auto_321106 ?auto_321119 ) ) ( not ( = ?auto_321107 ?auto_321108 ) ) ( not ( = ?auto_321107 ?auto_321109 ) ) ( not ( = ?auto_321107 ?auto_321110 ) ) ( not ( = ?auto_321107 ?auto_321111 ) ) ( not ( = ?auto_321107 ?auto_321112 ) ) ( not ( = ?auto_321107 ?auto_321113 ) ) ( not ( = ?auto_321107 ?auto_321114 ) ) ( not ( = ?auto_321107 ?auto_321115 ) ) ( not ( = ?auto_321107 ?auto_321116 ) ) ( not ( = ?auto_321107 ?auto_321117 ) ) ( not ( = ?auto_321107 ?auto_321118 ) ) ( not ( = ?auto_321107 ?auto_321119 ) ) ( not ( = ?auto_321108 ?auto_321109 ) ) ( not ( = ?auto_321108 ?auto_321110 ) ) ( not ( = ?auto_321108 ?auto_321111 ) ) ( not ( = ?auto_321108 ?auto_321112 ) ) ( not ( = ?auto_321108 ?auto_321113 ) ) ( not ( = ?auto_321108 ?auto_321114 ) ) ( not ( = ?auto_321108 ?auto_321115 ) ) ( not ( = ?auto_321108 ?auto_321116 ) ) ( not ( = ?auto_321108 ?auto_321117 ) ) ( not ( = ?auto_321108 ?auto_321118 ) ) ( not ( = ?auto_321108 ?auto_321119 ) ) ( not ( = ?auto_321109 ?auto_321110 ) ) ( not ( = ?auto_321109 ?auto_321111 ) ) ( not ( = ?auto_321109 ?auto_321112 ) ) ( not ( = ?auto_321109 ?auto_321113 ) ) ( not ( = ?auto_321109 ?auto_321114 ) ) ( not ( = ?auto_321109 ?auto_321115 ) ) ( not ( = ?auto_321109 ?auto_321116 ) ) ( not ( = ?auto_321109 ?auto_321117 ) ) ( not ( = ?auto_321109 ?auto_321118 ) ) ( not ( = ?auto_321109 ?auto_321119 ) ) ( not ( = ?auto_321110 ?auto_321111 ) ) ( not ( = ?auto_321110 ?auto_321112 ) ) ( not ( = ?auto_321110 ?auto_321113 ) ) ( not ( = ?auto_321110 ?auto_321114 ) ) ( not ( = ?auto_321110 ?auto_321115 ) ) ( not ( = ?auto_321110 ?auto_321116 ) ) ( not ( = ?auto_321110 ?auto_321117 ) ) ( not ( = ?auto_321110 ?auto_321118 ) ) ( not ( = ?auto_321110 ?auto_321119 ) ) ( not ( = ?auto_321111 ?auto_321112 ) ) ( not ( = ?auto_321111 ?auto_321113 ) ) ( not ( = ?auto_321111 ?auto_321114 ) ) ( not ( = ?auto_321111 ?auto_321115 ) ) ( not ( = ?auto_321111 ?auto_321116 ) ) ( not ( = ?auto_321111 ?auto_321117 ) ) ( not ( = ?auto_321111 ?auto_321118 ) ) ( not ( = ?auto_321111 ?auto_321119 ) ) ( not ( = ?auto_321112 ?auto_321113 ) ) ( not ( = ?auto_321112 ?auto_321114 ) ) ( not ( = ?auto_321112 ?auto_321115 ) ) ( not ( = ?auto_321112 ?auto_321116 ) ) ( not ( = ?auto_321112 ?auto_321117 ) ) ( not ( = ?auto_321112 ?auto_321118 ) ) ( not ( = ?auto_321112 ?auto_321119 ) ) ( not ( = ?auto_321113 ?auto_321114 ) ) ( not ( = ?auto_321113 ?auto_321115 ) ) ( not ( = ?auto_321113 ?auto_321116 ) ) ( not ( = ?auto_321113 ?auto_321117 ) ) ( not ( = ?auto_321113 ?auto_321118 ) ) ( not ( = ?auto_321113 ?auto_321119 ) ) ( not ( = ?auto_321114 ?auto_321115 ) ) ( not ( = ?auto_321114 ?auto_321116 ) ) ( not ( = ?auto_321114 ?auto_321117 ) ) ( not ( = ?auto_321114 ?auto_321118 ) ) ( not ( = ?auto_321114 ?auto_321119 ) ) ( not ( = ?auto_321115 ?auto_321116 ) ) ( not ( = ?auto_321115 ?auto_321117 ) ) ( not ( = ?auto_321115 ?auto_321118 ) ) ( not ( = ?auto_321115 ?auto_321119 ) ) ( not ( = ?auto_321116 ?auto_321117 ) ) ( not ( = ?auto_321116 ?auto_321118 ) ) ( not ( = ?auto_321116 ?auto_321119 ) ) ( not ( = ?auto_321117 ?auto_321118 ) ) ( not ( = ?auto_321117 ?auto_321119 ) ) ( not ( = ?auto_321118 ?auto_321119 ) ) ( ON ?auto_321117 ?auto_321118 ) ( ON ?auto_321116 ?auto_321117 ) ( ON ?auto_321115 ?auto_321116 ) ( ON ?auto_321114 ?auto_321115 ) ( ON ?auto_321113 ?auto_321114 ) ( ON ?auto_321112 ?auto_321113 ) ( ON ?auto_321111 ?auto_321112 ) ( ON ?auto_321110 ?auto_321111 ) ( ON ?auto_321109 ?auto_321110 ) ( CLEAR ?auto_321107 ) ( ON ?auto_321108 ?auto_321109 ) ( CLEAR ?auto_321108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_321106 ?auto_321107 ?auto_321108 )
      ( MAKE-13PILE ?auto_321106 ?auto_321107 ?auto_321108 ?auto_321109 ?auto_321110 ?auto_321111 ?auto_321112 ?auto_321113 ?auto_321114 ?auto_321115 ?auto_321116 ?auto_321117 ?auto_321118 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_321133 - BLOCK
      ?auto_321134 - BLOCK
      ?auto_321135 - BLOCK
      ?auto_321136 - BLOCK
      ?auto_321137 - BLOCK
      ?auto_321138 - BLOCK
      ?auto_321139 - BLOCK
      ?auto_321140 - BLOCK
      ?auto_321141 - BLOCK
      ?auto_321142 - BLOCK
      ?auto_321143 - BLOCK
      ?auto_321144 - BLOCK
      ?auto_321145 - BLOCK
    )
    :vars
    (
      ?auto_321146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321145 ?auto_321146 ) ( ON-TABLE ?auto_321133 ) ( not ( = ?auto_321133 ?auto_321134 ) ) ( not ( = ?auto_321133 ?auto_321135 ) ) ( not ( = ?auto_321133 ?auto_321136 ) ) ( not ( = ?auto_321133 ?auto_321137 ) ) ( not ( = ?auto_321133 ?auto_321138 ) ) ( not ( = ?auto_321133 ?auto_321139 ) ) ( not ( = ?auto_321133 ?auto_321140 ) ) ( not ( = ?auto_321133 ?auto_321141 ) ) ( not ( = ?auto_321133 ?auto_321142 ) ) ( not ( = ?auto_321133 ?auto_321143 ) ) ( not ( = ?auto_321133 ?auto_321144 ) ) ( not ( = ?auto_321133 ?auto_321145 ) ) ( not ( = ?auto_321133 ?auto_321146 ) ) ( not ( = ?auto_321134 ?auto_321135 ) ) ( not ( = ?auto_321134 ?auto_321136 ) ) ( not ( = ?auto_321134 ?auto_321137 ) ) ( not ( = ?auto_321134 ?auto_321138 ) ) ( not ( = ?auto_321134 ?auto_321139 ) ) ( not ( = ?auto_321134 ?auto_321140 ) ) ( not ( = ?auto_321134 ?auto_321141 ) ) ( not ( = ?auto_321134 ?auto_321142 ) ) ( not ( = ?auto_321134 ?auto_321143 ) ) ( not ( = ?auto_321134 ?auto_321144 ) ) ( not ( = ?auto_321134 ?auto_321145 ) ) ( not ( = ?auto_321134 ?auto_321146 ) ) ( not ( = ?auto_321135 ?auto_321136 ) ) ( not ( = ?auto_321135 ?auto_321137 ) ) ( not ( = ?auto_321135 ?auto_321138 ) ) ( not ( = ?auto_321135 ?auto_321139 ) ) ( not ( = ?auto_321135 ?auto_321140 ) ) ( not ( = ?auto_321135 ?auto_321141 ) ) ( not ( = ?auto_321135 ?auto_321142 ) ) ( not ( = ?auto_321135 ?auto_321143 ) ) ( not ( = ?auto_321135 ?auto_321144 ) ) ( not ( = ?auto_321135 ?auto_321145 ) ) ( not ( = ?auto_321135 ?auto_321146 ) ) ( not ( = ?auto_321136 ?auto_321137 ) ) ( not ( = ?auto_321136 ?auto_321138 ) ) ( not ( = ?auto_321136 ?auto_321139 ) ) ( not ( = ?auto_321136 ?auto_321140 ) ) ( not ( = ?auto_321136 ?auto_321141 ) ) ( not ( = ?auto_321136 ?auto_321142 ) ) ( not ( = ?auto_321136 ?auto_321143 ) ) ( not ( = ?auto_321136 ?auto_321144 ) ) ( not ( = ?auto_321136 ?auto_321145 ) ) ( not ( = ?auto_321136 ?auto_321146 ) ) ( not ( = ?auto_321137 ?auto_321138 ) ) ( not ( = ?auto_321137 ?auto_321139 ) ) ( not ( = ?auto_321137 ?auto_321140 ) ) ( not ( = ?auto_321137 ?auto_321141 ) ) ( not ( = ?auto_321137 ?auto_321142 ) ) ( not ( = ?auto_321137 ?auto_321143 ) ) ( not ( = ?auto_321137 ?auto_321144 ) ) ( not ( = ?auto_321137 ?auto_321145 ) ) ( not ( = ?auto_321137 ?auto_321146 ) ) ( not ( = ?auto_321138 ?auto_321139 ) ) ( not ( = ?auto_321138 ?auto_321140 ) ) ( not ( = ?auto_321138 ?auto_321141 ) ) ( not ( = ?auto_321138 ?auto_321142 ) ) ( not ( = ?auto_321138 ?auto_321143 ) ) ( not ( = ?auto_321138 ?auto_321144 ) ) ( not ( = ?auto_321138 ?auto_321145 ) ) ( not ( = ?auto_321138 ?auto_321146 ) ) ( not ( = ?auto_321139 ?auto_321140 ) ) ( not ( = ?auto_321139 ?auto_321141 ) ) ( not ( = ?auto_321139 ?auto_321142 ) ) ( not ( = ?auto_321139 ?auto_321143 ) ) ( not ( = ?auto_321139 ?auto_321144 ) ) ( not ( = ?auto_321139 ?auto_321145 ) ) ( not ( = ?auto_321139 ?auto_321146 ) ) ( not ( = ?auto_321140 ?auto_321141 ) ) ( not ( = ?auto_321140 ?auto_321142 ) ) ( not ( = ?auto_321140 ?auto_321143 ) ) ( not ( = ?auto_321140 ?auto_321144 ) ) ( not ( = ?auto_321140 ?auto_321145 ) ) ( not ( = ?auto_321140 ?auto_321146 ) ) ( not ( = ?auto_321141 ?auto_321142 ) ) ( not ( = ?auto_321141 ?auto_321143 ) ) ( not ( = ?auto_321141 ?auto_321144 ) ) ( not ( = ?auto_321141 ?auto_321145 ) ) ( not ( = ?auto_321141 ?auto_321146 ) ) ( not ( = ?auto_321142 ?auto_321143 ) ) ( not ( = ?auto_321142 ?auto_321144 ) ) ( not ( = ?auto_321142 ?auto_321145 ) ) ( not ( = ?auto_321142 ?auto_321146 ) ) ( not ( = ?auto_321143 ?auto_321144 ) ) ( not ( = ?auto_321143 ?auto_321145 ) ) ( not ( = ?auto_321143 ?auto_321146 ) ) ( not ( = ?auto_321144 ?auto_321145 ) ) ( not ( = ?auto_321144 ?auto_321146 ) ) ( not ( = ?auto_321145 ?auto_321146 ) ) ( ON ?auto_321144 ?auto_321145 ) ( ON ?auto_321143 ?auto_321144 ) ( ON ?auto_321142 ?auto_321143 ) ( ON ?auto_321141 ?auto_321142 ) ( ON ?auto_321140 ?auto_321141 ) ( ON ?auto_321139 ?auto_321140 ) ( ON ?auto_321138 ?auto_321139 ) ( ON ?auto_321137 ?auto_321138 ) ( ON ?auto_321136 ?auto_321137 ) ( ON ?auto_321135 ?auto_321136 ) ( CLEAR ?auto_321133 ) ( ON ?auto_321134 ?auto_321135 ) ( CLEAR ?auto_321134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_321133 ?auto_321134 )
      ( MAKE-13PILE ?auto_321133 ?auto_321134 ?auto_321135 ?auto_321136 ?auto_321137 ?auto_321138 ?auto_321139 ?auto_321140 ?auto_321141 ?auto_321142 ?auto_321143 ?auto_321144 ?auto_321145 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_321160 - BLOCK
      ?auto_321161 - BLOCK
      ?auto_321162 - BLOCK
      ?auto_321163 - BLOCK
      ?auto_321164 - BLOCK
      ?auto_321165 - BLOCK
      ?auto_321166 - BLOCK
      ?auto_321167 - BLOCK
      ?auto_321168 - BLOCK
      ?auto_321169 - BLOCK
      ?auto_321170 - BLOCK
      ?auto_321171 - BLOCK
      ?auto_321172 - BLOCK
    )
    :vars
    (
      ?auto_321173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321172 ?auto_321173 ) ( ON-TABLE ?auto_321160 ) ( not ( = ?auto_321160 ?auto_321161 ) ) ( not ( = ?auto_321160 ?auto_321162 ) ) ( not ( = ?auto_321160 ?auto_321163 ) ) ( not ( = ?auto_321160 ?auto_321164 ) ) ( not ( = ?auto_321160 ?auto_321165 ) ) ( not ( = ?auto_321160 ?auto_321166 ) ) ( not ( = ?auto_321160 ?auto_321167 ) ) ( not ( = ?auto_321160 ?auto_321168 ) ) ( not ( = ?auto_321160 ?auto_321169 ) ) ( not ( = ?auto_321160 ?auto_321170 ) ) ( not ( = ?auto_321160 ?auto_321171 ) ) ( not ( = ?auto_321160 ?auto_321172 ) ) ( not ( = ?auto_321160 ?auto_321173 ) ) ( not ( = ?auto_321161 ?auto_321162 ) ) ( not ( = ?auto_321161 ?auto_321163 ) ) ( not ( = ?auto_321161 ?auto_321164 ) ) ( not ( = ?auto_321161 ?auto_321165 ) ) ( not ( = ?auto_321161 ?auto_321166 ) ) ( not ( = ?auto_321161 ?auto_321167 ) ) ( not ( = ?auto_321161 ?auto_321168 ) ) ( not ( = ?auto_321161 ?auto_321169 ) ) ( not ( = ?auto_321161 ?auto_321170 ) ) ( not ( = ?auto_321161 ?auto_321171 ) ) ( not ( = ?auto_321161 ?auto_321172 ) ) ( not ( = ?auto_321161 ?auto_321173 ) ) ( not ( = ?auto_321162 ?auto_321163 ) ) ( not ( = ?auto_321162 ?auto_321164 ) ) ( not ( = ?auto_321162 ?auto_321165 ) ) ( not ( = ?auto_321162 ?auto_321166 ) ) ( not ( = ?auto_321162 ?auto_321167 ) ) ( not ( = ?auto_321162 ?auto_321168 ) ) ( not ( = ?auto_321162 ?auto_321169 ) ) ( not ( = ?auto_321162 ?auto_321170 ) ) ( not ( = ?auto_321162 ?auto_321171 ) ) ( not ( = ?auto_321162 ?auto_321172 ) ) ( not ( = ?auto_321162 ?auto_321173 ) ) ( not ( = ?auto_321163 ?auto_321164 ) ) ( not ( = ?auto_321163 ?auto_321165 ) ) ( not ( = ?auto_321163 ?auto_321166 ) ) ( not ( = ?auto_321163 ?auto_321167 ) ) ( not ( = ?auto_321163 ?auto_321168 ) ) ( not ( = ?auto_321163 ?auto_321169 ) ) ( not ( = ?auto_321163 ?auto_321170 ) ) ( not ( = ?auto_321163 ?auto_321171 ) ) ( not ( = ?auto_321163 ?auto_321172 ) ) ( not ( = ?auto_321163 ?auto_321173 ) ) ( not ( = ?auto_321164 ?auto_321165 ) ) ( not ( = ?auto_321164 ?auto_321166 ) ) ( not ( = ?auto_321164 ?auto_321167 ) ) ( not ( = ?auto_321164 ?auto_321168 ) ) ( not ( = ?auto_321164 ?auto_321169 ) ) ( not ( = ?auto_321164 ?auto_321170 ) ) ( not ( = ?auto_321164 ?auto_321171 ) ) ( not ( = ?auto_321164 ?auto_321172 ) ) ( not ( = ?auto_321164 ?auto_321173 ) ) ( not ( = ?auto_321165 ?auto_321166 ) ) ( not ( = ?auto_321165 ?auto_321167 ) ) ( not ( = ?auto_321165 ?auto_321168 ) ) ( not ( = ?auto_321165 ?auto_321169 ) ) ( not ( = ?auto_321165 ?auto_321170 ) ) ( not ( = ?auto_321165 ?auto_321171 ) ) ( not ( = ?auto_321165 ?auto_321172 ) ) ( not ( = ?auto_321165 ?auto_321173 ) ) ( not ( = ?auto_321166 ?auto_321167 ) ) ( not ( = ?auto_321166 ?auto_321168 ) ) ( not ( = ?auto_321166 ?auto_321169 ) ) ( not ( = ?auto_321166 ?auto_321170 ) ) ( not ( = ?auto_321166 ?auto_321171 ) ) ( not ( = ?auto_321166 ?auto_321172 ) ) ( not ( = ?auto_321166 ?auto_321173 ) ) ( not ( = ?auto_321167 ?auto_321168 ) ) ( not ( = ?auto_321167 ?auto_321169 ) ) ( not ( = ?auto_321167 ?auto_321170 ) ) ( not ( = ?auto_321167 ?auto_321171 ) ) ( not ( = ?auto_321167 ?auto_321172 ) ) ( not ( = ?auto_321167 ?auto_321173 ) ) ( not ( = ?auto_321168 ?auto_321169 ) ) ( not ( = ?auto_321168 ?auto_321170 ) ) ( not ( = ?auto_321168 ?auto_321171 ) ) ( not ( = ?auto_321168 ?auto_321172 ) ) ( not ( = ?auto_321168 ?auto_321173 ) ) ( not ( = ?auto_321169 ?auto_321170 ) ) ( not ( = ?auto_321169 ?auto_321171 ) ) ( not ( = ?auto_321169 ?auto_321172 ) ) ( not ( = ?auto_321169 ?auto_321173 ) ) ( not ( = ?auto_321170 ?auto_321171 ) ) ( not ( = ?auto_321170 ?auto_321172 ) ) ( not ( = ?auto_321170 ?auto_321173 ) ) ( not ( = ?auto_321171 ?auto_321172 ) ) ( not ( = ?auto_321171 ?auto_321173 ) ) ( not ( = ?auto_321172 ?auto_321173 ) ) ( ON ?auto_321171 ?auto_321172 ) ( ON ?auto_321170 ?auto_321171 ) ( ON ?auto_321169 ?auto_321170 ) ( ON ?auto_321168 ?auto_321169 ) ( ON ?auto_321167 ?auto_321168 ) ( ON ?auto_321166 ?auto_321167 ) ( ON ?auto_321165 ?auto_321166 ) ( ON ?auto_321164 ?auto_321165 ) ( ON ?auto_321163 ?auto_321164 ) ( ON ?auto_321162 ?auto_321163 ) ( CLEAR ?auto_321160 ) ( ON ?auto_321161 ?auto_321162 ) ( CLEAR ?auto_321161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_321160 ?auto_321161 )
      ( MAKE-13PILE ?auto_321160 ?auto_321161 ?auto_321162 ?auto_321163 ?auto_321164 ?auto_321165 ?auto_321166 ?auto_321167 ?auto_321168 ?auto_321169 ?auto_321170 ?auto_321171 ?auto_321172 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_321187 - BLOCK
      ?auto_321188 - BLOCK
      ?auto_321189 - BLOCK
      ?auto_321190 - BLOCK
      ?auto_321191 - BLOCK
      ?auto_321192 - BLOCK
      ?auto_321193 - BLOCK
      ?auto_321194 - BLOCK
      ?auto_321195 - BLOCK
      ?auto_321196 - BLOCK
      ?auto_321197 - BLOCK
      ?auto_321198 - BLOCK
      ?auto_321199 - BLOCK
    )
    :vars
    (
      ?auto_321200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321199 ?auto_321200 ) ( not ( = ?auto_321187 ?auto_321188 ) ) ( not ( = ?auto_321187 ?auto_321189 ) ) ( not ( = ?auto_321187 ?auto_321190 ) ) ( not ( = ?auto_321187 ?auto_321191 ) ) ( not ( = ?auto_321187 ?auto_321192 ) ) ( not ( = ?auto_321187 ?auto_321193 ) ) ( not ( = ?auto_321187 ?auto_321194 ) ) ( not ( = ?auto_321187 ?auto_321195 ) ) ( not ( = ?auto_321187 ?auto_321196 ) ) ( not ( = ?auto_321187 ?auto_321197 ) ) ( not ( = ?auto_321187 ?auto_321198 ) ) ( not ( = ?auto_321187 ?auto_321199 ) ) ( not ( = ?auto_321187 ?auto_321200 ) ) ( not ( = ?auto_321188 ?auto_321189 ) ) ( not ( = ?auto_321188 ?auto_321190 ) ) ( not ( = ?auto_321188 ?auto_321191 ) ) ( not ( = ?auto_321188 ?auto_321192 ) ) ( not ( = ?auto_321188 ?auto_321193 ) ) ( not ( = ?auto_321188 ?auto_321194 ) ) ( not ( = ?auto_321188 ?auto_321195 ) ) ( not ( = ?auto_321188 ?auto_321196 ) ) ( not ( = ?auto_321188 ?auto_321197 ) ) ( not ( = ?auto_321188 ?auto_321198 ) ) ( not ( = ?auto_321188 ?auto_321199 ) ) ( not ( = ?auto_321188 ?auto_321200 ) ) ( not ( = ?auto_321189 ?auto_321190 ) ) ( not ( = ?auto_321189 ?auto_321191 ) ) ( not ( = ?auto_321189 ?auto_321192 ) ) ( not ( = ?auto_321189 ?auto_321193 ) ) ( not ( = ?auto_321189 ?auto_321194 ) ) ( not ( = ?auto_321189 ?auto_321195 ) ) ( not ( = ?auto_321189 ?auto_321196 ) ) ( not ( = ?auto_321189 ?auto_321197 ) ) ( not ( = ?auto_321189 ?auto_321198 ) ) ( not ( = ?auto_321189 ?auto_321199 ) ) ( not ( = ?auto_321189 ?auto_321200 ) ) ( not ( = ?auto_321190 ?auto_321191 ) ) ( not ( = ?auto_321190 ?auto_321192 ) ) ( not ( = ?auto_321190 ?auto_321193 ) ) ( not ( = ?auto_321190 ?auto_321194 ) ) ( not ( = ?auto_321190 ?auto_321195 ) ) ( not ( = ?auto_321190 ?auto_321196 ) ) ( not ( = ?auto_321190 ?auto_321197 ) ) ( not ( = ?auto_321190 ?auto_321198 ) ) ( not ( = ?auto_321190 ?auto_321199 ) ) ( not ( = ?auto_321190 ?auto_321200 ) ) ( not ( = ?auto_321191 ?auto_321192 ) ) ( not ( = ?auto_321191 ?auto_321193 ) ) ( not ( = ?auto_321191 ?auto_321194 ) ) ( not ( = ?auto_321191 ?auto_321195 ) ) ( not ( = ?auto_321191 ?auto_321196 ) ) ( not ( = ?auto_321191 ?auto_321197 ) ) ( not ( = ?auto_321191 ?auto_321198 ) ) ( not ( = ?auto_321191 ?auto_321199 ) ) ( not ( = ?auto_321191 ?auto_321200 ) ) ( not ( = ?auto_321192 ?auto_321193 ) ) ( not ( = ?auto_321192 ?auto_321194 ) ) ( not ( = ?auto_321192 ?auto_321195 ) ) ( not ( = ?auto_321192 ?auto_321196 ) ) ( not ( = ?auto_321192 ?auto_321197 ) ) ( not ( = ?auto_321192 ?auto_321198 ) ) ( not ( = ?auto_321192 ?auto_321199 ) ) ( not ( = ?auto_321192 ?auto_321200 ) ) ( not ( = ?auto_321193 ?auto_321194 ) ) ( not ( = ?auto_321193 ?auto_321195 ) ) ( not ( = ?auto_321193 ?auto_321196 ) ) ( not ( = ?auto_321193 ?auto_321197 ) ) ( not ( = ?auto_321193 ?auto_321198 ) ) ( not ( = ?auto_321193 ?auto_321199 ) ) ( not ( = ?auto_321193 ?auto_321200 ) ) ( not ( = ?auto_321194 ?auto_321195 ) ) ( not ( = ?auto_321194 ?auto_321196 ) ) ( not ( = ?auto_321194 ?auto_321197 ) ) ( not ( = ?auto_321194 ?auto_321198 ) ) ( not ( = ?auto_321194 ?auto_321199 ) ) ( not ( = ?auto_321194 ?auto_321200 ) ) ( not ( = ?auto_321195 ?auto_321196 ) ) ( not ( = ?auto_321195 ?auto_321197 ) ) ( not ( = ?auto_321195 ?auto_321198 ) ) ( not ( = ?auto_321195 ?auto_321199 ) ) ( not ( = ?auto_321195 ?auto_321200 ) ) ( not ( = ?auto_321196 ?auto_321197 ) ) ( not ( = ?auto_321196 ?auto_321198 ) ) ( not ( = ?auto_321196 ?auto_321199 ) ) ( not ( = ?auto_321196 ?auto_321200 ) ) ( not ( = ?auto_321197 ?auto_321198 ) ) ( not ( = ?auto_321197 ?auto_321199 ) ) ( not ( = ?auto_321197 ?auto_321200 ) ) ( not ( = ?auto_321198 ?auto_321199 ) ) ( not ( = ?auto_321198 ?auto_321200 ) ) ( not ( = ?auto_321199 ?auto_321200 ) ) ( ON ?auto_321198 ?auto_321199 ) ( ON ?auto_321197 ?auto_321198 ) ( ON ?auto_321196 ?auto_321197 ) ( ON ?auto_321195 ?auto_321196 ) ( ON ?auto_321194 ?auto_321195 ) ( ON ?auto_321193 ?auto_321194 ) ( ON ?auto_321192 ?auto_321193 ) ( ON ?auto_321191 ?auto_321192 ) ( ON ?auto_321190 ?auto_321191 ) ( ON ?auto_321189 ?auto_321190 ) ( ON ?auto_321188 ?auto_321189 ) ( ON ?auto_321187 ?auto_321188 ) ( CLEAR ?auto_321187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_321187 )
      ( MAKE-13PILE ?auto_321187 ?auto_321188 ?auto_321189 ?auto_321190 ?auto_321191 ?auto_321192 ?auto_321193 ?auto_321194 ?auto_321195 ?auto_321196 ?auto_321197 ?auto_321198 ?auto_321199 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_321214 - BLOCK
      ?auto_321215 - BLOCK
      ?auto_321216 - BLOCK
      ?auto_321217 - BLOCK
      ?auto_321218 - BLOCK
      ?auto_321219 - BLOCK
      ?auto_321220 - BLOCK
      ?auto_321221 - BLOCK
      ?auto_321222 - BLOCK
      ?auto_321223 - BLOCK
      ?auto_321224 - BLOCK
      ?auto_321225 - BLOCK
      ?auto_321226 - BLOCK
    )
    :vars
    (
      ?auto_321227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321226 ?auto_321227 ) ( not ( = ?auto_321214 ?auto_321215 ) ) ( not ( = ?auto_321214 ?auto_321216 ) ) ( not ( = ?auto_321214 ?auto_321217 ) ) ( not ( = ?auto_321214 ?auto_321218 ) ) ( not ( = ?auto_321214 ?auto_321219 ) ) ( not ( = ?auto_321214 ?auto_321220 ) ) ( not ( = ?auto_321214 ?auto_321221 ) ) ( not ( = ?auto_321214 ?auto_321222 ) ) ( not ( = ?auto_321214 ?auto_321223 ) ) ( not ( = ?auto_321214 ?auto_321224 ) ) ( not ( = ?auto_321214 ?auto_321225 ) ) ( not ( = ?auto_321214 ?auto_321226 ) ) ( not ( = ?auto_321214 ?auto_321227 ) ) ( not ( = ?auto_321215 ?auto_321216 ) ) ( not ( = ?auto_321215 ?auto_321217 ) ) ( not ( = ?auto_321215 ?auto_321218 ) ) ( not ( = ?auto_321215 ?auto_321219 ) ) ( not ( = ?auto_321215 ?auto_321220 ) ) ( not ( = ?auto_321215 ?auto_321221 ) ) ( not ( = ?auto_321215 ?auto_321222 ) ) ( not ( = ?auto_321215 ?auto_321223 ) ) ( not ( = ?auto_321215 ?auto_321224 ) ) ( not ( = ?auto_321215 ?auto_321225 ) ) ( not ( = ?auto_321215 ?auto_321226 ) ) ( not ( = ?auto_321215 ?auto_321227 ) ) ( not ( = ?auto_321216 ?auto_321217 ) ) ( not ( = ?auto_321216 ?auto_321218 ) ) ( not ( = ?auto_321216 ?auto_321219 ) ) ( not ( = ?auto_321216 ?auto_321220 ) ) ( not ( = ?auto_321216 ?auto_321221 ) ) ( not ( = ?auto_321216 ?auto_321222 ) ) ( not ( = ?auto_321216 ?auto_321223 ) ) ( not ( = ?auto_321216 ?auto_321224 ) ) ( not ( = ?auto_321216 ?auto_321225 ) ) ( not ( = ?auto_321216 ?auto_321226 ) ) ( not ( = ?auto_321216 ?auto_321227 ) ) ( not ( = ?auto_321217 ?auto_321218 ) ) ( not ( = ?auto_321217 ?auto_321219 ) ) ( not ( = ?auto_321217 ?auto_321220 ) ) ( not ( = ?auto_321217 ?auto_321221 ) ) ( not ( = ?auto_321217 ?auto_321222 ) ) ( not ( = ?auto_321217 ?auto_321223 ) ) ( not ( = ?auto_321217 ?auto_321224 ) ) ( not ( = ?auto_321217 ?auto_321225 ) ) ( not ( = ?auto_321217 ?auto_321226 ) ) ( not ( = ?auto_321217 ?auto_321227 ) ) ( not ( = ?auto_321218 ?auto_321219 ) ) ( not ( = ?auto_321218 ?auto_321220 ) ) ( not ( = ?auto_321218 ?auto_321221 ) ) ( not ( = ?auto_321218 ?auto_321222 ) ) ( not ( = ?auto_321218 ?auto_321223 ) ) ( not ( = ?auto_321218 ?auto_321224 ) ) ( not ( = ?auto_321218 ?auto_321225 ) ) ( not ( = ?auto_321218 ?auto_321226 ) ) ( not ( = ?auto_321218 ?auto_321227 ) ) ( not ( = ?auto_321219 ?auto_321220 ) ) ( not ( = ?auto_321219 ?auto_321221 ) ) ( not ( = ?auto_321219 ?auto_321222 ) ) ( not ( = ?auto_321219 ?auto_321223 ) ) ( not ( = ?auto_321219 ?auto_321224 ) ) ( not ( = ?auto_321219 ?auto_321225 ) ) ( not ( = ?auto_321219 ?auto_321226 ) ) ( not ( = ?auto_321219 ?auto_321227 ) ) ( not ( = ?auto_321220 ?auto_321221 ) ) ( not ( = ?auto_321220 ?auto_321222 ) ) ( not ( = ?auto_321220 ?auto_321223 ) ) ( not ( = ?auto_321220 ?auto_321224 ) ) ( not ( = ?auto_321220 ?auto_321225 ) ) ( not ( = ?auto_321220 ?auto_321226 ) ) ( not ( = ?auto_321220 ?auto_321227 ) ) ( not ( = ?auto_321221 ?auto_321222 ) ) ( not ( = ?auto_321221 ?auto_321223 ) ) ( not ( = ?auto_321221 ?auto_321224 ) ) ( not ( = ?auto_321221 ?auto_321225 ) ) ( not ( = ?auto_321221 ?auto_321226 ) ) ( not ( = ?auto_321221 ?auto_321227 ) ) ( not ( = ?auto_321222 ?auto_321223 ) ) ( not ( = ?auto_321222 ?auto_321224 ) ) ( not ( = ?auto_321222 ?auto_321225 ) ) ( not ( = ?auto_321222 ?auto_321226 ) ) ( not ( = ?auto_321222 ?auto_321227 ) ) ( not ( = ?auto_321223 ?auto_321224 ) ) ( not ( = ?auto_321223 ?auto_321225 ) ) ( not ( = ?auto_321223 ?auto_321226 ) ) ( not ( = ?auto_321223 ?auto_321227 ) ) ( not ( = ?auto_321224 ?auto_321225 ) ) ( not ( = ?auto_321224 ?auto_321226 ) ) ( not ( = ?auto_321224 ?auto_321227 ) ) ( not ( = ?auto_321225 ?auto_321226 ) ) ( not ( = ?auto_321225 ?auto_321227 ) ) ( not ( = ?auto_321226 ?auto_321227 ) ) ( ON ?auto_321225 ?auto_321226 ) ( ON ?auto_321224 ?auto_321225 ) ( ON ?auto_321223 ?auto_321224 ) ( ON ?auto_321222 ?auto_321223 ) ( ON ?auto_321221 ?auto_321222 ) ( ON ?auto_321220 ?auto_321221 ) ( ON ?auto_321219 ?auto_321220 ) ( ON ?auto_321218 ?auto_321219 ) ( ON ?auto_321217 ?auto_321218 ) ( ON ?auto_321216 ?auto_321217 ) ( ON ?auto_321215 ?auto_321216 ) ( ON ?auto_321214 ?auto_321215 ) ( CLEAR ?auto_321214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_321214 )
      ( MAKE-13PILE ?auto_321214 ?auto_321215 ?auto_321216 ?auto_321217 ?auto_321218 ?auto_321219 ?auto_321220 ?auto_321221 ?auto_321222 ?auto_321223 ?auto_321224 ?auto_321225 ?auto_321226 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321242 - BLOCK
      ?auto_321243 - BLOCK
      ?auto_321244 - BLOCK
      ?auto_321245 - BLOCK
      ?auto_321246 - BLOCK
      ?auto_321247 - BLOCK
      ?auto_321248 - BLOCK
      ?auto_321249 - BLOCK
      ?auto_321250 - BLOCK
      ?auto_321251 - BLOCK
      ?auto_321252 - BLOCK
      ?auto_321253 - BLOCK
      ?auto_321254 - BLOCK
      ?auto_321255 - BLOCK
    )
    :vars
    (
      ?auto_321256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_321254 ) ( ON ?auto_321255 ?auto_321256 ) ( CLEAR ?auto_321255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_321242 ) ( ON ?auto_321243 ?auto_321242 ) ( ON ?auto_321244 ?auto_321243 ) ( ON ?auto_321245 ?auto_321244 ) ( ON ?auto_321246 ?auto_321245 ) ( ON ?auto_321247 ?auto_321246 ) ( ON ?auto_321248 ?auto_321247 ) ( ON ?auto_321249 ?auto_321248 ) ( ON ?auto_321250 ?auto_321249 ) ( ON ?auto_321251 ?auto_321250 ) ( ON ?auto_321252 ?auto_321251 ) ( ON ?auto_321253 ?auto_321252 ) ( ON ?auto_321254 ?auto_321253 ) ( not ( = ?auto_321242 ?auto_321243 ) ) ( not ( = ?auto_321242 ?auto_321244 ) ) ( not ( = ?auto_321242 ?auto_321245 ) ) ( not ( = ?auto_321242 ?auto_321246 ) ) ( not ( = ?auto_321242 ?auto_321247 ) ) ( not ( = ?auto_321242 ?auto_321248 ) ) ( not ( = ?auto_321242 ?auto_321249 ) ) ( not ( = ?auto_321242 ?auto_321250 ) ) ( not ( = ?auto_321242 ?auto_321251 ) ) ( not ( = ?auto_321242 ?auto_321252 ) ) ( not ( = ?auto_321242 ?auto_321253 ) ) ( not ( = ?auto_321242 ?auto_321254 ) ) ( not ( = ?auto_321242 ?auto_321255 ) ) ( not ( = ?auto_321242 ?auto_321256 ) ) ( not ( = ?auto_321243 ?auto_321244 ) ) ( not ( = ?auto_321243 ?auto_321245 ) ) ( not ( = ?auto_321243 ?auto_321246 ) ) ( not ( = ?auto_321243 ?auto_321247 ) ) ( not ( = ?auto_321243 ?auto_321248 ) ) ( not ( = ?auto_321243 ?auto_321249 ) ) ( not ( = ?auto_321243 ?auto_321250 ) ) ( not ( = ?auto_321243 ?auto_321251 ) ) ( not ( = ?auto_321243 ?auto_321252 ) ) ( not ( = ?auto_321243 ?auto_321253 ) ) ( not ( = ?auto_321243 ?auto_321254 ) ) ( not ( = ?auto_321243 ?auto_321255 ) ) ( not ( = ?auto_321243 ?auto_321256 ) ) ( not ( = ?auto_321244 ?auto_321245 ) ) ( not ( = ?auto_321244 ?auto_321246 ) ) ( not ( = ?auto_321244 ?auto_321247 ) ) ( not ( = ?auto_321244 ?auto_321248 ) ) ( not ( = ?auto_321244 ?auto_321249 ) ) ( not ( = ?auto_321244 ?auto_321250 ) ) ( not ( = ?auto_321244 ?auto_321251 ) ) ( not ( = ?auto_321244 ?auto_321252 ) ) ( not ( = ?auto_321244 ?auto_321253 ) ) ( not ( = ?auto_321244 ?auto_321254 ) ) ( not ( = ?auto_321244 ?auto_321255 ) ) ( not ( = ?auto_321244 ?auto_321256 ) ) ( not ( = ?auto_321245 ?auto_321246 ) ) ( not ( = ?auto_321245 ?auto_321247 ) ) ( not ( = ?auto_321245 ?auto_321248 ) ) ( not ( = ?auto_321245 ?auto_321249 ) ) ( not ( = ?auto_321245 ?auto_321250 ) ) ( not ( = ?auto_321245 ?auto_321251 ) ) ( not ( = ?auto_321245 ?auto_321252 ) ) ( not ( = ?auto_321245 ?auto_321253 ) ) ( not ( = ?auto_321245 ?auto_321254 ) ) ( not ( = ?auto_321245 ?auto_321255 ) ) ( not ( = ?auto_321245 ?auto_321256 ) ) ( not ( = ?auto_321246 ?auto_321247 ) ) ( not ( = ?auto_321246 ?auto_321248 ) ) ( not ( = ?auto_321246 ?auto_321249 ) ) ( not ( = ?auto_321246 ?auto_321250 ) ) ( not ( = ?auto_321246 ?auto_321251 ) ) ( not ( = ?auto_321246 ?auto_321252 ) ) ( not ( = ?auto_321246 ?auto_321253 ) ) ( not ( = ?auto_321246 ?auto_321254 ) ) ( not ( = ?auto_321246 ?auto_321255 ) ) ( not ( = ?auto_321246 ?auto_321256 ) ) ( not ( = ?auto_321247 ?auto_321248 ) ) ( not ( = ?auto_321247 ?auto_321249 ) ) ( not ( = ?auto_321247 ?auto_321250 ) ) ( not ( = ?auto_321247 ?auto_321251 ) ) ( not ( = ?auto_321247 ?auto_321252 ) ) ( not ( = ?auto_321247 ?auto_321253 ) ) ( not ( = ?auto_321247 ?auto_321254 ) ) ( not ( = ?auto_321247 ?auto_321255 ) ) ( not ( = ?auto_321247 ?auto_321256 ) ) ( not ( = ?auto_321248 ?auto_321249 ) ) ( not ( = ?auto_321248 ?auto_321250 ) ) ( not ( = ?auto_321248 ?auto_321251 ) ) ( not ( = ?auto_321248 ?auto_321252 ) ) ( not ( = ?auto_321248 ?auto_321253 ) ) ( not ( = ?auto_321248 ?auto_321254 ) ) ( not ( = ?auto_321248 ?auto_321255 ) ) ( not ( = ?auto_321248 ?auto_321256 ) ) ( not ( = ?auto_321249 ?auto_321250 ) ) ( not ( = ?auto_321249 ?auto_321251 ) ) ( not ( = ?auto_321249 ?auto_321252 ) ) ( not ( = ?auto_321249 ?auto_321253 ) ) ( not ( = ?auto_321249 ?auto_321254 ) ) ( not ( = ?auto_321249 ?auto_321255 ) ) ( not ( = ?auto_321249 ?auto_321256 ) ) ( not ( = ?auto_321250 ?auto_321251 ) ) ( not ( = ?auto_321250 ?auto_321252 ) ) ( not ( = ?auto_321250 ?auto_321253 ) ) ( not ( = ?auto_321250 ?auto_321254 ) ) ( not ( = ?auto_321250 ?auto_321255 ) ) ( not ( = ?auto_321250 ?auto_321256 ) ) ( not ( = ?auto_321251 ?auto_321252 ) ) ( not ( = ?auto_321251 ?auto_321253 ) ) ( not ( = ?auto_321251 ?auto_321254 ) ) ( not ( = ?auto_321251 ?auto_321255 ) ) ( not ( = ?auto_321251 ?auto_321256 ) ) ( not ( = ?auto_321252 ?auto_321253 ) ) ( not ( = ?auto_321252 ?auto_321254 ) ) ( not ( = ?auto_321252 ?auto_321255 ) ) ( not ( = ?auto_321252 ?auto_321256 ) ) ( not ( = ?auto_321253 ?auto_321254 ) ) ( not ( = ?auto_321253 ?auto_321255 ) ) ( not ( = ?auto_321253 ?auto_321256 ) ) ( not ( = ?auto_321254 ?auto_321255 ) ) ( not ( = ?auto_321254 ?auto_321256 ) ) ( not ( = ?auto_321255 ?auto_321256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_321255 ?auto_321256 )
      ( !STACK ?auto_321255 ?auto_321254 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321271 - BLOCK
      ?auto_321272 - BLOCK
      ?auto_321273 - BLOCK
      ?auto_321274 - BLOCK
      ?auto_321275 - BLOCK
      ?auto_321276 - BLOCK
      ?auto_321277 - BLOCK
      ?auto_321278 - BLOCK
      ?auto_321279 - BLOCK
      ?auto_321280 - BLOCK
      ?auto_321281 - BLOCK
      ?auto_321282 - BLOCK
      ?auto_321283 - BLOCK
      ?auto_321284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_321283 ) ( ON-TABLE ?auto_321284 ) ( CLEAR ?auto_321284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_321271 ) ( ON ?auto_321272 ?auto_321271 ) ( ON ?auto_321273 ?auto_321272 ) ( ON ?auto_321274 ?auto_321273 ) ( ON ?auto_321275 ?auto_321274 ) ( ON ?auto_321276 ?auto_321275 ) ( ON ?auto_321277 ?auto_321276 ) ( ON ?auto_321278 ?auto_321277 ) ( ON ?auto_321279 ?auto_321278 ) ( ON ?auto_321280 ?auto_321279 ) ( ON ?auto_321281 ?auto_321280 ) ( ON ?auto_321282 ?auto_321281 ) ( ON ?auto_321283 ?auto_321282 ) ( not ( = ?auto_321271 ?auto_321272 ) ) ( not ( = ?auto_321271 ?auto_321273 ) ) ( not ( = ?auto_321271 ?auto_321274 ) ) ( not ( = ?auto_321271 ?auto_321275 ) ) ( not ( = ?auto_321271 ?auto_321276 ) ) ( not ( = ?auto_321271 ?auto_321277 ) ) ( not ( = ?auto_321271 ?auto_321278 ) ) ( not ( = ?auto_321271 ?auto_321279 ) ) ( not ( = ?auto_321271 ?auto_321280 ) ) ( not ( = ?auto_321271 ?auto_321281 ) ) ( not ( = ?auto_321271 ?auto_321282 ) ) ( not ( = ?auto_321271 ?auto_321283 ) ) ( not ( = ?auto_321271 ?auto_321284 ) ) ( not ( = ?auto_321272 ?auto_321273 ) ) ( not ( = ?auto_321272 ?auto_321274 ) ) ( not ( = ?auto_321272 ?auto_321275 ) ) ( not ( = ?auto_321272 ?auto_321276 ) ) ( not ( = ?auto_321272 ?auto_321277 ) ) ( not ( = ?auto_321272 ?auto_321278 ) ) ( not ( = ?auto_321272 ?auto_321279 ) ) ( not ( = ?auto_321272 ?auto_321280 ) ) ( not ( = ?auto_321272 ?auto_321281 ) ) ( not ( = ?auto_321272 ?auto_321282 ) ) ( not ( = ?auto_321272 ?auto_321283 ) ) ( not ( = ?auto_321272 ?auto_321284 ) ) ( not ( = ?auto_321273 ?auto_321274 ) ) ( not ( = ?auto_321273 ?auto_321275 ) ) ( not ( = ?auto_321273 ?auto_321276 ) ) ( not ( = ?auto_321273 ?auto_321277 ) ) ( not ( = ?auto_321273 ?auto_321278 ) ) ( not ( = ?auto_321273 ?auto_321279 ) ) ( not ( = ?auto_321273 ?auto_321280 ) ) ( not ( = ?auto_321273 ?auto_321281 ) ) ( not ( = ?auto_321273 ?auto_321282 ) ) ( not ( = ?auto_321273 ?auto_321283 ) ) ( not ( = ?auto_321273 ?auto_321284 ) ) ( not ( = ?auto_321274 ?auto_321275 ) ) ( not ( = ?auto_321274 ?auto_321276 ) ) ( not ( = ?auto_321274 ?auto_321277 ) ) ( not ( = ?auto_321274 ?auto_321278 ) ) ( not ( = ?auto_321274 ?auto_321279 ) ) ( not ( = ?auto_321274 ?auto_321280 ) ) ( not ( = ?auto_321274 ?auto_321281 ) ) ( not ( = ?auto_321274 ?auto_321282 ) ) ( not ( = ?auto_321274 ?auto_321283 ) ) ( not ( = ?auto_321274 ?auto_321284 ) ) ( not ( = ?auto_321275 ?auto_321276 ) ) ( not ( = ?auto_321275 ?auto_321277 ) ) ( not ( = ?auto_321275 ?auto_321278 ) ) ( not ( = ?auto_321275 ?auto_321279 ) ) ( not ( = ?auto_321275 ?auto_321280 ) ) ( not ( = ?auto_321275 ?auto_321281 ) ) ( not ( = ?auto_321275 ?auto_321282 ) ) ( not ( = ?auto_321275 ?auto_321283 ) ) ( not ( = ?auto_321275 ?auto_321284 ) ) ( not ( = ?auto_321276 ?auto_321277 ) ) ( not ( = ?auto_321276 ?auto_321278 ) ) ( not ( = ?auto_321276 ?auto_321279 ) ) ( not ( = ?auto_321276 ?auto_321280 ) ) ( not ( = ?auto_321276 ?auto_321281 ) ) ( not ( = ?auto_321276 ?auto_321282 ) ) ( not ( = ?auto_321276 ?auto_321283 ) ) ( not ( = ?auto_321276 ?auto_321284 ) ) ( not ( = ?auto_321277 ?auto_321278 ) ) ( not ( = ?auto_321277 ?auto_321279 ) ) ( not ( = ?auto_321277 ?auto_321280 ) ) ( not ( = ?auto_321277 ?auto_321281 ) ) ( not ( = ?auto_321277 ?auto_321282 ) ) ( not ( = ?auto_321277 ?auto_321283 ) ) ( not ( = ?auto_321277 ?auto_321284 ) ) ( not ( = ?auto_321278 ?auto_321279 ) ) ( not ( = ?auto_321278 ?auto_321280 ) ) ( not ( = ?auto_321278 ?auto_321281 ) ) ( not ( = ?auto_321278 ?auto_321282 ) ) ( not ( = ?auto_321278 ?auto_321283 ) ) ( not ( = ?auto_321278 ?auto_321284 ) ) ( not ( = ?auto_321279 ?auto_321280 ) ) ( not ( = ?auto_321279 ?auto_321281 ) ) ( not ( = ?auto_321279 ?auto_321282 ) ) ( not ( = ?auto_321279 ?auto_321283 ) ) ( not ( = ?auto_321279 ?auto_321284 ) ) ( not ( = ?auto_321280 ?auto_321281 ) ) ( not ( = ?auto_321280 ?auto_321282 ) ) ( not ( = ?auto_321280 ?auto_321283 ) ) ( not ( = ?auto_321280 ?auto_321284 ) ) ( not ( = ?auto_321281 ?auto_321282 ) ) ( not ( = ?auto_321281 ?auto_321283 ) ) ( not ( = ?auto_321281 ?auto_321284 ) ) ( not ( = ?auto_321282 ?auto_321283 ) ) ( not ( = ?auto_321282 ?auto_321284 ) ) ( not ( = ?auto_321283 ?auto_321284 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_321284 )
      ( !STACK ?auto_321284 ?auto_321283 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321299 - BLOCK
      ?auto_321300 - BLOCK
      ?auto_321301 - BLOCK
      ?auto_321302 - BLOCK
      ?auto_321303 - BLOCK
      ?auto_321304 - BLOCK
      ?auto_321305 - BLOCK
      ?auto_321306 - BLOCK
      ?auto_321307 - BLOCK
      ?auto_321308 - BLOCK
      ?auto_321309 - BLOCK
      ?auto_321310 - BLOCK
      ?auto_321311 - BLOCK
      ?auto_321312 - BLOCK
    )
    :vars
    (
      ?auto_321313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321312 ?auto_321313 ) ( ON-TABLE ?auto_321299 ) ( ON ?auto_321300 ?auto_321299 ) ( ON ?auto_321301 ?auto_321300 ) ( ON ?auto_321302 ?auto_321301 ) ( ON ?auto_321303 ?auto_321302 ) ( ON ?auto_321304 ?auto_321303 ) ( ON ?auto_321305 ?auto_321304 ) ( ON ?auto_321306 ?auto_321305 ) ( ON ?auto_321307 ?auto_321306 ) ( ON ?auto_321308 ?auto_321307 ) ( ON ?auto_321309 ?auto_321308 ) ( ON ?auto_321310 ?auto_321309 ) ( not ( = ?auto_321299 ?auto_321300 ) ) ( not ( = ?auto_321299 ?auto_321301 ) ) ( not ( = ?auto_321299 ?auto_321302 ) ) ( not ( = ?auto_321299 ?auto_321303 ) ) ( not ( = ?auto_321299 ?auto_321304 ) ) ( not ( = ?auto_321299 ?auto_321305 ) ) ( not ( = ?auto_321299 ?auto_321306 ) ) ( not ( = ?auto_321299 ?auto_321307 ) ) ( not ( = ?auto_321299 ?auto_321308 ) ) ( not ( = ?auto_321299 ?auto_321309 ) ) ( not ( = ?auto_321299 ?auto_321310 ) ) ( not ( = ?auto_321299 ?auto_321311 ) ) ( not ( = ?auto_321299 ?auto_321312 ) ) ( not ( = ?auto_321299 ?auto_321313 ) ) ( not ( = ?auto_321300 ?auto_321301 ) ) ( not ( = ?auto_321300 ?auto_321302 ) ) ( not ( = ?auto_321300 ?auto_321303 ) ) ( not ( = ?auto_321300 ?auto_321304 ) ) ( not ( = ?auto_321300 ?auto_321305 ) ) ( not ( = ?auto_321300 ?auto_321306 ) ) ( not ( = ?auto_321300 ?auto_321307 ) ) ( not ( = ?auto_321300 ?auto_321308 ) ) ( not ( = ?auto_321300 ?auto_321309 ) ) ( not ( = ?auto_321300 ?auto_321310 ) ) ( not ( = ?auto_321300 ?auto_321311 ) ) ( not ( = ?auto_321300 ?auto_321312 ) ) ( not ( = ?auto_321300 ?auto_321313 ) ) ( not ( = ?auto_321301 ?auto_321302 ) ) ( not ( = ?auto_321301 ?auto_321303 ) ) ( not ( = ?auto_321301 ?auto_321304 ) ) ( not ( = ?auto_321301 ?auto_321305 ) ) ( not ( = ?auto_321301 ?auto_321306 ) ) ( not ( = ?auto_321301 ?auto_321307 ) ) ( not ( = ?auto_321301 ?auto_321308 ) ) ( not ( = ?auto_321301 ?auto_321309 ) ) ( not ( = ?auto_321301 ?auto_321310 ) ) ( not ( = ?auto_321301 ?auto_321311 ) ) ( not ( = ?auto_321301 ?auto_321312 ) ) ( not ( = ?auto_321301 ?auto_321313 ) ) ( not ( = ?auto_321302 ?auto_321303 ) ) ( not ( = ?auto_321302 ?auto_321304 ) ) ( not ( = ?auto_321302 ?auto_321305 ) ) ( not ( = ?auto_321302 ?auto_321306 ) ) ( not ( = ?auto_321302 ?auto_321307 ) ) ( not ( = ?auto_321302 ?auto_321308 ) ) ( not ( = ?auto_321302 ?auto_321309 ) ) ( not ( = ?auto_321302 ?auto_321310 ) ) ( not ( = ?auto_321302 ?auto_321311 ) ) ( not ( = ?auto_321302 ?auto_321312 ) ) ( not ( = ?auto_321302 ?auto_321313 ) ) ( not ( = ?auto_321303 ?auto_321304 ) ) ( not ( = ?auto_321303 ?auto_321305 ) ) ( not ( = ?auto_321303 ?auto_321306 ) ) ( not ( = ?auto_321303 ?auto_321307 ) ) ( not ( = ?auto_321303 ?auto_321308 ) ) ( not ( = ?auto_321303 ?auto_321309 ) ) ( not ( = ?auto_321303 ?auto_321310 ) ) ( not ( = ?auto_321303 ?auto_321311 ) ) ( not ( = ?auto_321303 ?auto_321312 ) ) ( not ( = ?auto_321303 ?auto_321313 ) ) ( not ( = ?auto_321304 ?auto_321305 ) ) ( not ( = ?auto_321304 ?auto_321306 ) ) ( not ( = ?auto_321304 ?auto_321307 ) ) ( not ( = ?auto_321304 ?auto_321308 ) ) ( not ( = ?auto_321304 ?auto_321309 ) ) ( not ( = ?auto_321304 ?auto_321310 ) ) ( not ( = ?auto_321304 ?auto_321311 ) ) ( not ( = ?auto_321304 ?auto_321312 ) ) ( not ( = ?auto_321304 ?auto_321313 ) ) ( not ( = ?auto_321305 ?auto_321306 ) ) ( not ( = ?auto_321305 ?auto_321307 ) ) ( not ( = ?auto_321305 ?auto_321308 ) ) ( not ( = ?auto_321305 ?auto_321309 ) ) ( not ( = ?auto_321305 ?auto_321310 ) ) ( not ( = ?auto_321305 ?auto_321311 ) ) ( not ( = ?auto_321305 ?auto_321312 ) ) ( not ( = ?auto_321305 ?auto_321313 ) ) ( not ( = ?auto_321306 ?auto_321307 ) ) ( not ( = ?auto_321306 ?auto_321308 ) ) ( not ( = ?auto_321306 ?auto_321309 ) ) ( not ( = ?auto_321306 ?auto_321310 ) ) ( not ( = ?auto_321306 ?auto_321311 ) ) ( not ( = ?auto_321306 ?auto_321312 ) ) ( not ( = ?auto_321306 ?auto_321313 ) ) ( not ( = ?auto_321307 ?auto_321308 ) ) ( not ( = ?auto_321307 ?auto_321309 ) ) ( not ( = ?auto_321307 ?auto_321310 ) ) ( not ( = ?auto_321307 ?auto_321311 ) ) ( not ( = ?auto_321307 ?auto_321312 ) ) ( not ( = ?auto_321307 ?auto_321313 ) ) ( not ( = ?auto_321308 ?auto_321309 ) ) ( not ( = ?auto_321308 ?auto_321310 ) ) ( not ( = ?auto_321308 ?auto_321311 ) ) ( not ( = ?auto_321308 ?auto_321312 ) ) ( not ( = ?auto_321308 ?auto_321313 ) ) ( not ( = ?auto_321309 ?auto_321310 ) ) ( not ( = ?auto_321309 ?auto_321311 ) ) ( not ( = ?auto_321309 ?auto_321312 ) ) ( not ( = ?auto_321309 ?auto_321313 ) ) ( not ( = ?auto_321310 ?auto_321311 ) ) ( not ( = ?auto_321310 ?auto_321312 ) ) ( not ( = ?auto_321310 ?auto_321313 ) ) ( not ( = ?auto_321311 ?auto_321312 ) ) ( not ( = ?auto_321311 ?auto_321313 ) ) ( not ( = ?auto_321312 ?auto_321313 ) ) ( CLEAR ?auto_321310 ) ( ON ?auto_321311 ?auto_321312 ) ( CLEAR ?auto_321311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_321299 ?auto_321300 ?auto_321301 ?auto_321302 ?auto_321303 ?auto_321304 ?auto_321305 ?auto_321306 ?auto_321307 ?auto_321308 ?auto_321309 ?auto_321310 ?auto_321311 )
      ( MAKE-14PILE ?auto_321299 ?auto_321300 ?auto_321301 ?auto_321302 ?auto_321303 ?auto_321304 ?auto_321305 ?auto_321306 ?auto_321307 ?auto_321308 ?auto_321309 ?auto_321310 ?auto_321311 ?auto_321312 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321328 - BLOCK
      ?auto_321329 - BLOCK
      ?auto_321330 - BLOCK
      ?auto_321331 - BLOCK
      ?auto_321332 - BLOCK
      ?auto_321333 - BLOCK
      ?auto_321334 - BLOCK
      ?auto_321335 - BLOCK
      ?auto_321336 - BLOCK
      ?auto_321337 - BLOCK
      ?auto_321338 - BLOCK
      ?auto_321339 - BLOCK
      ?auto_321340 - BLOCK
      ?auto_321341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321341 ) ( ON-TABLE ?auto_321328 ) ( ON ?auto_321329 ?auto_321328 ) ( ON ?auto_321330 ?auto_321329 ) ( ON ?auto_321331 ?auto_321330 ) ( ON ?auto_321332 ?auto_321331 ) ( ON ?auto_321333 ?auto_321332 ) ( ON ?auto_321334 ?auto_321333 ) ( ON ?auto_321335 ?auto_321334 ) ( ON ?auto_321336 ?auto_321335 ) ( ON ?auto_321337 ?auto_321336 ) ( ON ?auto_321338 ?auto_321337 ) ( ON ?auto_321339 ?auto_321338 ) ( not ( = ?auto_321328 ?auto_321329 ) ) ( not ( = ?auto_321328 ?auto_321330 ) ) ( not ( = ?auto_321328 ?auto_321331 ) ) ( not ( = ?auto_321328 ?auto_321332 ) ) ( not ( = ?auto_321328 ?auto_321333 ) ) ( not ( = ?auto_321328 ?auto_321334 ) ) ( not ( = ?auto_321328 ?auto_321335 ) ) ( not ( = ?auto_321328 ?auto_321336 ) ) ( not ( = ?auto_321328 ?auto_321337 ) ) ( not ( = ?auto_321328 ?auto_321338 ) ) ( not ( = ?auto_321328 ?auto_321339 ) ) ( not ( = ?auto_321328 ?auto_321340 ) ) ( not ( = ?auto_321328 ?auto_321341 ) ) ( not ( = ?auto_321329 ?auto_321330 ) ) ( not ( = ?auto_321329 ?auto_321331 ) ) ( not ( = ?auto_321329 ?auto_321332 ) ) ( not ( = ?auto_321329 ?auto_321333 ) ) ( not ( = ?auto_321329 ?auto_321334 ) ) ( not ( = ?auto_321329 ?auto_321335 ) ) ( not ( = ?auto_321329 ?auto_321336 ) ) ( not ( = ?auto_321329 ?auto_321337 ) ) ( not ( = ?auto_321329 ?auto_321338 ) ) ( not ( = ?auto_321329 ?auto_321339 ) ) ( not ( = ?auto_321329 ?auto_321340 ) ) ( not ( = ?auto_321329 ?auto_321341 ) ) ( not ( = ?auto_321330 ?auto_321331 ) ) ( not ( = ?auto_321330 ?auto_321332 ) ) ( not ( = ?auto_321330 ?auto_321333 ) ) ( not ( = ?auto_321330 ?auto_321334 ) ) ( not ( = ?auto_321330 ?auto_321335 ) ) ( not ( = ?auto_321330 ?auto_321336 ) ) ( not ( = ?auto_321330 ?auto_321337 ) ) ( not ( = ?auto_321330 ?auto_321338 ) ) ( not ( = ?auto_321330 ?auto_321339 ) ) ( not ( = ?auto_321330 ?auto_321340 ) ) ( not ( = ?auto_321330 ?auto_321341 ) ) ( not ( = ?auto_321331 ?auto_321332 ) ) ( not ( = ?auto_321331 ?auto_321333 ) ) ( not ( = ?auto_321331 ?auto_321334 ) ) ( not ( = ?auto_321331 ?auto_321335 ) ) ( not ( = ?auto_321331 ?auto_321336 ) ) ( not ( = ?auto_321331 ?auto_321337 ) ) ( not ( = ?auto_321331 ?auto_321338 ) ) ( not ( = ?auto_321331 ?auto_321339 ) ) ( not ( = ?auto_321331 ?auto_321340 ) ) ( not ( = ?auto_321331 ?auto_321341 ) ) ( not ( = ?auto_321332 ?auto_321333 ) ) ( not ( = ?auto_321332 ?auto_321334 ) ) ( not ( = ?auto_321332 ?auto_321335 ) ) ( not ( = ?auto_321332 ?auto_321336 ) ) ( not ( = ?auto_321332 ?auto_321337 ) ) ( not ( = ?auto_321332 ?auto_321338 ) ) ( not ( = ?auto_321332 ?auto_321339 ) ) ( not ( = ?auto_321332 ?auto_321340 ) ) ( not ( = ?auto_321332 ?auto_321341 ) ) ( not ( = ?auto_321333 ?auto_321334 ) ) ( not ( = ?auto_321333 ?auto_321335 ) ) ( not ( = ?auto_321333 ?auto_321336 ) ) ( not ( = ?auto_321333 ?auto_321337 ) ) ( not ( = ?auto_321333 ?auto_321338 ) ) ( not ( = ?auto_321333 ?auto_321339 ) ) ( not ( = ?auto_321333 ?auto_321340 ) ) ( not ( = ?auto_321333 ?auto_321341 ) ) ( not ( = ?auto_321334 ?auto_321335 ) ) ( not ( = ?auto_321334 ?auto_321336 ) ) ( not ( = ?auto_321334 ?auto_321337 ) ) ( not ( = ?auto_321334 ?auto_321338 ) ) ( not ( = ?auto_321334 ?auto_321339 ) ) ( not ( = ?auto_321334 ?auto_321340 ) ) ( not ( = ?auto_321334 ?auto_321341 ) ) ( not ( = ?auto_321335 ?auto_321336 ) ) ( not ( = ?auto_321335 ?auto_321337 ) ) ( not ( = ?auto_321335 ?auto_321338 ) ) ( not ( = ?auto_321335 ?auto_321339 ) ) ( not ( = ?auto_321335 ?auto_321340 ) ) ( not ( = ?auto_321335 ?auto_321341 ) ) ( not ( = ?auto_321336 ?auto_321337 ) ) ( not ( = ?auto_321336 ?auto_321338 ) ) ( not ( = ?auto_321336 ?auto_321339 ) ) ( not ( = ?auto_321336 ?auto_321340 ) ) ( not ( = ?auto_321336 ?auto_321341 ) ) ( not ( = ?auto_321337 ?auto_321338 ) ) ( not ( = ?auto_321337 ?auto_321339 ) ) ( not ( = ?auto_321337 ?auto_321340 ) ) ( not ( = ?auto_321337 ?auto_321341 ) ) ( not ( = ?auto_321338 ?auto_321339 ) ) ( not ( = ?auto_321338 ?auto_321340 ) ) ( not ( = ?auto_321338 ?auto_321341 ) ) ( not ( = ?auto_321339 ?auto_321340 ) ) ( not ( = ?auto_321339 ?auto_321341 ) ) ( not ( = ?auto_321340 ?auto_321341 ) ) ( CLEAR ?auto_321339 ) ( ON ?auto_321340 ?auto_321341 ) ( CLEAR ?auto_321340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_321328 ?auto_321329 ?auto_321330 ?auto_321331 ?auto_321332 ?auto_321333 ?auto_321334 ?auto_321335 ?auto_321336 ?auto_321337 ?auto_321338 ?auto_321339 ?auto_321340 )
      ( MAKE-14PILE ?auto_321328 ?auto_321329 ?auto_321330 ?auto_321331 ?auto_321332 ?auto_321333 ?auto_321334 ?auto_321335 ?auto_321336 ?auto_321337 ?auto_321338 ?auto_321339 ?auto_321340 ?auto_321341 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321356 - BLOCK
      ?auto_321357 - BLOCK
      ?auto_321358 - BLOCK
      ?auto_321359 - BLOCK
      ?auto_321360 - BLOCK
      ?auto_321361 - BLOCK
      ?auto_321362 - BLOCK
      ?auto_321363 - BLOCK
      ?auto_321364 - BLOCK
      ?auto_321365 - BLOCK
      ?auto_321366 - BLOCK
      ?auto_321367 - BLOCK
      ?auto_321368 - BLOCK
      ?auto_321369 - BLOCK
    )
    :vars
    (
      ?auto_321370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321369 ?auto_321370 ) ( ON-TABLE ?auto_321356 ) ( ON ?auto_321357 ?auto_321356 ) ( ON ?auto_321358 ?auto_321357 ) ( ON ?auto_321359 ?auto_321358 ) ( ON ?auto_321360 ?auto_321359 ) ( ON ?auto_321361 ?auto_321360 ) ( ON ?auto_321362 ?auto_321361 ) ( ON ?auto_321363 ?auto_321362 ) ( ON ?auto_321364 ?auto_321363 ) ( ON ?auto_321365 ?auto_321364 ) ( ON ?auto_321366 ?auto_321365 ) ( not ( = ?auto_321356 ?auto_321357 ) ) ( not ( = ?auto_321356 ?auto_321358 ) ) ( not ( = ?auto_321356 ?auto_321359 ) ) ( not ( = ?auto_321356 ?auto_321360 ) ) ( not ( = ?auto_321356 ?auto_321361 ) ) ( not ( = ?auto_321356 ?auto_321362 ) ) ( not ( = ?auto_321356 ?auto_321363 ) ) ( not ( = ?auto_321356 ?auto_321364 ) ) ( not ( = ?auto_321356 ?auto_321365 ) ) ( not ( = ?auto_321356 ?auto_321366 ) ) ( not ( = ?auto_321356 ?auto_321367 ) ) ( not ( = ?auto_321356 ?auto_321368 ) ) ( not ( = ?auto_321356 ?auto_321369 ) ) ( not ( = ?auto_321356 ?auto_321370 ) ) ( not ( = ?auto_321357 ?auto_321358 ) ) ( not ( = ?auto_321357 ?auto_321359 ) ) ( not ( = ?auto_321357 ?auto_321360 ) ) ( not ( = ?auto_321357 ?auto_321361 ) ) ( not ( = ?auto_321357 ?auto_321362 ) ) ( not ( = ?auto_321357 ?auto_321363 ) ) ( not ( = ?auto_321357 ?auto_321364 ) ) ( not ( = ?auto_321357 ?auto_321365 ) ) ( not ( = ?auto_321357 ?auto_321366 ) ) ( not ( = ?auto_321357 ?auto_321367 ) ) ( not ( = ?auto_321357 ?auto_321368 ) ) ( not ( = ?auto_321357 ?auto_321369 ) ) ( not ( = ?auto_321357 ?auto_321370 ) ) ( not ( = ?auto_321358 ?auto_321359 ) ) ( not ( = ?auto_321358 ?auto_321360 ) ) ( not ( = ?auto_321358 ?auto_321361 ) ) ( not ( = ?auto_321358 ?auto_321362 ) ) ( not ( = ?auto_321358 ?auto_321363 ) ) ( not ( = ?auto_321358 ?auto_321364 ) ) ( not ( = ?auto_321358 ?auto_321365 ) ) ( not ( = ?auto_321358 ?auto_321366 ) ) ( not ( = ?auto_321358 ?auto_321367 ) ) ( not ( = ?auto_321358 ?auto_321368 ) ) ( not ( = ?auto_321358 ?auto_321369 ) ) ( not ( = ?auto_321358 ?auto_321370 ) ) ( not ( = ?auto_321359 ?auto_321360 ) ) ( not ( = ?auto_321359 ?auto_321361 ) ) ( not ( = ?auto_321359 ?auto_321362 ) ) ( not ( = ?auto_321359 ?auto_321363 ) ) ( not ( = ?auto_321359 ?auto_321364 ) ) ( not ( = ?auto_321359 ?auto_321365 ) ) ( not ( = ?auto_321359 ?auto_321366 ) ) ( not ( = ?auto_321359 ?auto_321367 ) ) ( not ( = ?auto_321359 ?auto_321368 ) ) ( not ( = ?auto_321359 ?auto_321369 ) ) ( not ( = ?auto_321359 ?auto_321370 ) ) ( not ( = ?auto_321360 ?auto_321361 ) ) ( not ( = ?auto_321360 ?auto_321362 ) ) ( not ( = ?auto_321360 ?auto_321363 ) ) ( not ( = ?auto_321360 ?auto_321364 ) ) ( not ( = ?auto_321360 ?auto_321365 ) ) ( not ( = ?auto_321360 ?auto_321366 ) ) ( not ( = ?auto_321360 ?auto_321367 ) ) ( not ( = ?auto_321360 ?auto_321368 ) ) ( not ( = ?auto_321360 ?auto_321369 ) ) ( not ( = ?auto_321360 ?auto_321370 ) ) ( not ( = ?auto_321361 ?auto_321362 ) ) ( not ( = ?auto_321361 ?auto_321363 ) ) ( not ( = ?auto_321361 ?auto_321364 ) ) ( not ( = ?auto_321361 ?auto_321365 ) ) ( not ( = ?auto_321361 ?auto_321366 ) ) ( not ( = ?auto_321361 ?auto_321367 ) ) ( not ( = ?auto_321361 ?auto_321368 ) ) ( not ( = ?auto_321361 ?auto_321369 ) ) ( not ( = ?auto_321361 ?auto_321370 ) ) ( not ( = ?auto_321362 ?auto_321363 ) ) ( not ( = ?auto_321362 ?auto_321364 ) ) ( not ( = ?auto_321362 ?auto_321365 ) ) ( not ( = ?auto_321362 ?auto_321366 ) ) ( not ( = ?auto_321362 ?auto_321367 ) ) ( not ( = ?auto_321362 ?auto_321368 ) ) ( not ( = ?auto_321362 ?auto_321369 ) ) ( not ( = ?auto_321362 ?auto_321370 ) ) ( not ( = ?auto_321363 ?auto_321364 ) ) ( not ( = ?auto_321363 ?auto_321365 ) ) ( not ( = ?auto_321363 ?auto_321366 ) ) ( not ( = ?auto_321363 ?auto_321367 ) ) ( not ( = ?auto_321363 ?auto_321368 ) ) ( not ( = ?auto_321363 ?auto_321369 ) ) ( not ( = ?auto_321363 ?auto_321370 ) ) ( not ( = ?auto_321364 ?auto_321365 ) ) ( not ( = ?auto_321364 ?auto_321366 ) ) ( not ( = ?auto_321364 ?auto_321367 ) ) ( not ( = ?auto_321364 ?auto_321368 ) ) ( not ( = ?auto_321364 ?auto_321369 ) ) ( not ( = ?auto_321364 ?auto_321370 ) ) ( not ( = ?auto_321365 ?auto_321366 ) ) ( not ( = ?auto_321365 ?auto_321367 ) ) ( not ( = ?auto_321365 ?auto_321368 ) ) ( not ( = ?auto_321365 ?auto_321369 ) ) ( not ( = ?auto_321365 ?auto_321370 ) ) ( not ( = ?auto_321366 ?auto_321367 ) ) ( not ( = ?auto_321366 ?auto_321368 ) ) ( not ( = ?auto_321366 ?auto_321369 ) ) ( not ( = ?auto_321366 ?auto_321370 ) ) ( not ( = ?auto_321367 ?auto_321368 ) ) ( not ( = ?auto_321367 ?auto_321369 ) ) ( not ( = ?auto_321367 ?auto_321370 ) ) ( not ( = ?auto_321368 ?auto_321369 ) ) ( not ( = ?auto_321368 ?auto_321370 ) ) ( not ( = ?auto_321369 ?auto_321370 ) ) ( ON ?auto_321368 ?auto_321369 ) ( CLEAR ?auto_321366 ) ( ON ?auto_321367 ?auto_321368 ) ( CLEAR ?auto_321367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_321356 ?auto_321357 ?auto_321358 ?auto_321359 ?auto_321360 ?auto_321361 ?auto_321362 ?auto_321363 ?auto_321364 ?auto_321365 ?auto_321366 ?auto_321367 )
      ( MAKE-14PILE ?auto_321356 ?auto_321357 ?auto_321358 ?auto_321359 ?auto_321360 ?auto_321361 ?auto_321362 ?auto_321363 ?auto_321364 ?auto_321365 ?auto_321366 ?auto_321367 ?auto_321368 ?auto_321369 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321385 - BLOCK
      ?auto_321386 - BLOCK
      ?auto_321387 - BLOCK
      ?auto_321388 - BLOCK
      ?auto_321389 - BLOCK
      ?auto_321390 - BLOCK
      ?auto_321391 - BLOCK
      ?auto_321392 - BLOCK
      ?auto_321393 - BLOCK
      ?auto_321394 - BLOCK
      ?auto_321395 - BLOCK
      ?auto_321396 - BLOCK
      ?auto_321397 - BLOCK
      ?auto_321398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321398 ) ( ON-TABLE ?auto_321385 ) ( ON ?auto_321386 ?auto_321385 ) ( ON ?auto_321387 ?auto_321386 ) ( ON ?auto_321388 ?auto_321387 ) ( ON ?auto_321389 ?auto_321388 ) ( ON ?auto_321390 ?auto_321389 ) ( ON ?auto_321391 ?auto_321390 ) ( ON ?auto_321392 ?auto_321391 ) ( ON ?auto_321393 ?auto_321392 ) ( ON ?auto_321394 ?auto_321393 ) ( ON ?auto_321395 ?auto_321394 ) ( not ( = ?auto_321385 ?auto_321386 ) ) ( not ( = ?auto_321385 ?auto_321387 ) ) ( not ( = ?auto_321385 ?auto_321388 ) ) ( not ( = ?auto_321385 ?auto_321389 ) ) ( not ( = ?auto_321385 ?auto_321390 ) ) ( not ( = ?auto_321385 ?auto_321391 ) ) ( not ( = ?auto_321385 ?auto_321392 ) ) ( not ( = ?auto_321385 ?auto_321393 ) ) ( not ( = ?auto_321385 ?auto_321394 ) ) ( not ( = ?auto_321385 ?auto_321395 ) ) ( not ( = ?auto_321385 ?auto_321396 ) ) ( not ( = ?auto_321385 ?auto_321397 ) ) ( not ( = ?auto_321385 ?auto_321398 ) ) ( not ( = ?auto_321386 ?auto_321387 ) ) ( not ( = ?auto_321386 ?auto_321388 ) ) ( not ( = ?auto_321386 ?auto_321389 ) ) ( not ( = ?auto_321386 ?auto_321390 ) ) ( not ( = ?auto_321386 ?auto_321391 ) ) ( not ( = ?auto_321386 ?auto_321392 ) ) ( not ( = ?auto_321386 ?auto_321393 ) ) ( not ( = ?auto_321386 ?auto_321394 ) ) ( not ( = ?auto_321386 ?auto_321395 ) ) ( not ( = ?auto_321386 ?auto_321396 ) ) ( not ( = ?auto_321386 ?auto_321397 ) ) ( not ( = ?auto_321386 ?auto_321398 ) ) ( not ( = ?auto_321387 ?auto_321388 ) ) ( not ( = ?auto_321387 ?auto_321389 ) ) ( not ( = ?auto_321387 ?auto_321390 ) ) ( not ( = ?auto_321387 ?auto_321391 ) ) ( not ( = ?auto_321387 ?auto_321392 ) ) ( not ( = ?auto_321387 ?auto_321393 ) ) ( not ( = ?auto_321387 ?auto_321394 ) ) ( not ( = ?auto_321387 ?auto_321395 ) ) ( not ( = ?auto_321387 ?auto_321396 ) ) ( not ( = ?auto_321387 ?auto_321397 ) ) ( not ( = ?auto_321387 ?auto_321398 ) ) ( not ( = ?auto_321388 ?auto_321389 ) ) ( not ( = ?auto_321388 ?auto_321390 ) ) ( not ( = ?auto_321388 ?auto_321391 ) ) ( not ( = ?auto_321388 ?auto_321392 ) ) ( not ( = ?auto_321388 ?auto_321393 ) ) ( not ( = ?auto_321388 ?auto_321394 ) ) ( not ( = ?auto_321388 ?auto_321395 ) ) ( not ( = ?auto_321388 ?auto_321396 ) ) ( not ( = ?auto_321388 ?auto_321397 ) ) ( not ( = ?auto_321388 ?auto_321398 ) ) ( not ( = ?auto_321389 ?auto_321390 ) ) ( not ( = ?auto_321389 ?auto_321391 ) ) ( not ( = ?auto_321389 ?auto_321392 ) ) ( not ( = ?auto_321389 ?auto_321393 ) ) ( not ( = ?auto_321389 ?auto_321394 ) ) ( not ( = ?auto_321389 ?auto_321395 ) ) ( not ( = ?auto_321389 ?auto_321396 ) ) ( not ( = ?auto_321389 ?auto_321397 ) ) ( not ( = ?auto_321389 ?auto_321398 ) ) ( not ( = ?auto_321390 ?auto_321391 ) ) ( not ( = ?auto_321390 ?auto_321392 ) ) ( not ( = ?auto_321390 ?auto_321393 ) ) ( not ( = ?auto_321390 ?auto_321394 ) ) ( not ( = ?auto_321390 ?auto_321395 ) ) ( not ( = ?auto_321390 ?auto_321396 ) ) ( not ( = ?auto_321390 ?auto_321397 ) ) ( not ( = ?auto_321390 ?auto_321398 ) ) ( not ( = ?auto_321391 ?auto_321392 ) ) ( not ( = ?auto_321391 ?auto_321393 ) ) ( not ( = ?auto_321391 ?auto_321394 ) ) ( not ( = ?auto_321391 ?auto_321395 ) ) ( not ( = ?auto_321391 ?auto_321396 ) ) ( not ( = ?auto_321391 ?auto_321397 ) ) ( not ( = ?auto_321391 ?auto_321398 ) ) ( not ( = ?auto_321392 ?auto_321393 ) ) ( not ( = ?auto_321392 ?auto_321394 ) ) ( not ( = ?auto_321392 ?auto_321395 ) ) ( not ( = ?auto_321392 ?auto_321396 ) ) ( not ( = ?auto_321392 ?auto_321397 ) ) ( not ( = ?auto_321392 ?auto_321398 ) ) ( not ( = ?auto_321393 ?auto_321394 ) ) ( not ( = ?auto_321393 ?auto_321395 ) ) ( not ( = ?auto_321393 ?auto_321396 ) ) ( not ( = ?auto_321393 ?auto_321397 ) ) ( not ( = ?auto_321393 ?auto_321398 ) ) ( not ( = ?auto_321394 ?auto_321395 ) ) ( not ( = ?auto_321394 ?auto_321396 ) ) ( not ( = ?auto_321394 ?auto_321397 ) ) ( not ( = ?auto_321394 ?auto_321398 ) ) ( not ( = ?auto_321395 ?auto_321396 ) ) ( not ( = ?auto_321395 ?auto_321397 ) ) ( not ( = ?auto_321395 ?auto_321398 ) ) ( not ( = ?auto_321396 ?auto_321397 ) ) ( not ( = ?auto_321396 ?auto_321398 ) ) ( not ( = ?auto_321397 ?auto_321398 ) ) ( ON ?auto_321397 ?auto_321398 ) ( CLEAR ?auto_321395 ) ( ON ?auto_321396 ?auto_321397 ) ( CLEAR ?auto_321396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_321385 ?auto_321386 ?auto_321387 ?auto_321388 ?auto_321389 ?auto_321390 ?auto_321391 ?auto_321392 ?auto_321393 ?auto_321394 ?auto_321395 ?auto_321396 )
      ( MAKE-14PILE ?auto_321385 ?auto_321386 ?auto_321387 ?auto_321388 ?auto_321389 ?auto_321390 ?auto_321391 ?auto_321392 ?auto_321393 ?auto_321394 ?auto_321395 ?auto_321396 ?auto_321397 ?auto_321398 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321413 - BLOCK
      ?auto_321414 - BLOCK
      ?auto_321415 - BLOCK
      ?auto_321416 - BLOCK
      ?auto_321417 - BLOCK
      ?auto_321418 - BLOCK
      ?auto_321419 - BLOCK
      ?auto_321420 - BLOCK
      ?auto_321421 - BLOCK
      ?auto_321422 - BLOCK
      ?auto_321423 - BLOCK
      ?auto_321424 - BLOCK
      ?auto_321425 - BLOCK
      ?auto_321426 - BLOCK
    )
    :vars
    (
      ?auto_321427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321426 ?auto_321427 ) ( ON-TABLE ?auto_321413 ) ( ON ?auto_321414 ?auto_321413 ) ( ON ?auto_321415 ?auto_321414 ) ( ON ?auto_321416 ?auto_321415 ) ( ON ?auto_321417 ?auto_321416 ) ( ON ?auto_321418 ?auto_321417 ) ( ON ?auto_321419 ?auto_321418 ) ( ON ?auto_321420 ?auto_321419 ) ( ON ?auto_321421 ?auto_321420 ) ( ON ?auto_321422 ?auto_321421 ) ( not ( = ?auto_321413 ?auto_321414 ) ) ( not ( = ?auto_321413 ?auto_321415 ) ) ( not ( = ?auto_321413 ?auto_321416 ) ) ( not ( = ?auto_321413 ?auto_321417 ) ) ( not ( = ?auto_321413 ?auto_321418 ) ) ( not ( = ?auto_321413 ?auto_321419 ) ) ( not ( = ?auto_321413 ?auto_321420 ) ) ( not ( = ?auto_321413 ?auto_321421 ) ) ( not ( = ?auto_321413 ?auto_321422 ) ) ( not ( = ?auto_321413 ?auto_321423 ) ) ( not ( = ?auto_321413 ?auto_321424 ) ) ( not ( = ?auto_321413 ?auto_321425 ) ) ( not ( = ?auto_321413 ?auto_321426 ) ) ( not ( = ?auto_321413 ?auto_321427 ) ) ( not ( = ?auto_321414 ?auto_321415 ) ) ( not ( = ?auto_321414 ?auto_321416 ) ) ( not ( = ?auto_321414 ?auto_321417 ) ) ( not ( = ?auto_321414 ?auto_321418 ) ) ( not ( = ?auto_321414 ?auto_321419 ) ) ( not ( = ?auto_321414 ?auto_321420 ) ) ( not ( = ?auto_321414 ?auto_321421 ) ) ( not ( = ?auto_321414 ?auto_321422 ) ) ( not ( = ?auto_321414 ?auto_321423 ) ) ( not ( = ?auto_321414 ?auto_321424 ) ) ( not ( = ?auto_321414 ?auto_321425 ) ) ( not ( = ?auto_321414 ?auto_321426 ) ) ( not ( = ?auto_321414 ?auto_321427 ) ) ( not ( = ?auto_321415 ?auto_321416 ) ) ( not ( = ?auto_321415 ?auto_321417 ) ) ( not ( = ?auto_321415 ?auto_321418 ) ) ( not ( = ?auto_321415 ?auto_321419 ) ) ( not ( = ?auto_321415 ?auto_321420 ) ) ( not ( = ?auto_321415 ?auto_321421 ) ) ( not ( = ?auto_321415 ?auto_321422 ) ) ( not ( = ?auto_321415 ?auto_321423 ) ) ( not ( = ?auto_321415 ?auto_321424 ) ) ( not ( = ?auto_321415 ?auto_321425 ) ) ( not ( = ?auto_321415 ?auto_321426 ) ) ( not ( = ?auto_321415 ?auto_321427 ) ) ( not ( = ?auto_321416 ?auto_321417 ) ) ( not ( = ?auto_321416 ?auto_321418 ) ) ( not ( = ?auto_321416 ?auto_321419 ) ) ( not ( = ?auto_321416 ?auto_321420 ) ) ( not ( = ?auto_321416 ?auto_321421 ) ) ( not ( = ?auto_321416 ?auto_321422 ) ) ( not ( = ?auto_321416 ?auto_321423 ) ) ( not ( = ?auto_321416 ?auto_321424 ) ) ( not ( = ?auto_321416 ?auto_321425 ) ) ( not ( = ?auto_321416 ?auto_321426 ) ) ( not ( = ?auto_321416 ?auto_321427 ) ) ( not ( = ?auto_321417 ?auto_321418 ) ) ( not ( = ?auto_321417 ?auto_321419 ) ) ( not ( = ?auto_321417 ?auto_321420 ) ) ( not ( = ?auto_321417 ?auto_321421 ) ) ( not ( = ?auto_321417 ?auto_321422 ) ) ( not ( = ?auto_321417 ?auto_321423 ) ) ( not ( = ?auto_321417 ?auto_321424 ) ) ( not ( = ?auto_321417 ?auto_321425 ) ) ( not ( = ?auto_321417 ?auto_321426 ) ) ( not ( = ?auto_321417 ?auto_321427 ) ) ( not ( = ?auto_321418 ?auto_321419 ) ) ( not ( = ?auto_321418 ?auto_321420 ) ) ( not ( = ?auto_321418 ?auto_321421 ) ) ( not ( = ?auto_321418 ?auto_321422 ) ) ( not ( = ?auto_321418 ?auto_321423 ) ) ( not ( = ?auto_321418 ?auto_321424 ) ) ( not ( = ?auto_321418 ?auto_321425 ) ) ( not ( = ?auto_321418 ?auto_321426 ) ) ( not ( = ?auto_321418 ?auto_321427 ) ) ( not ( = ?auto_321419 ?auto_321420 ) ) ( not ( = ?auto_321419 ?auto_321421 ) ) ( not ( = ?auto_321419 ?auto_321422 ) ) ( not ( = ?auto_321419 ?auto_321423 ) ) ( not ( = ?auto_321419 ?auto_321424 ) ) ( not ( = ?auto_321419 ?auto_321425 ) ) ( not ( = ?auto_321419 ?auto_321426 ) ) ( not ( = ?auto_321419 ?auto_321427 ) ) ( not ( = ?auto_321420 ?auto_321421 ) ) ( not ( = ?auto_321420 ?auto_321422 ) ) ( not ( = ?auto_321420 ?auto_321423 ) ) ( not ( = ?auto_321420 ?auto_321424 ) ) ( not ( = ?auto_321420 ?auto_321425 ) ) ( not ( = ?auto_321420 ?auto_321426 ) ) ( not ( = ?auto_321420 ?auto_321427 ) ) ( not ( = ?auto_321421 ?auto_321422 ) ) ( not ( = ?auto_321421 ?auto_321423 ) ) ( not ( = ?auto_321421 ?auto_321424 ) ) ( not ( = ?auto_321421 ?auto_321425 ) ) ( not ( = ?auto_321421 ?auto_321426 ) ) ( not ( = ?auto_321421 ?auto_321427 ) ) ( not ( = ?auto_321422 ?auto_321423 ) ) ( not ( = ?auto_321422 ?auto_321424 ) ) ( not ( = ?auto_321422 ?auto_321425 ) ) ( not ( = ?auto_321422 ?auto_321426 ) ) ( not ( = ?auto_321422 ?auto_321427 ) ) ( not ( = ?auto_321423 ?auto_321424 ) ) ( not ( = ?auto_321423 ?auto_321425 ) ) ( not ( = ?auto_321423 ?auto_321426 ) ) ( not ( = ?auto_321423 ?auto_321427 ) ) ( not ( = ?auto_321424 ?auto_321425 ) ) ( not ( = ?auto_321424 ?auto_321426 ) ) ( not ( = ?auto_321424 ?auto_321427 ) ) ( not ( = ?auto_321425 ?auto_321426 ) ) ( not ( = ?auto_321425 ?auto_321427 ) ) ( not ( = ?auto_321426 ?auto_321427 ) ) ( ON ?auto_321425 ?auto_321426 ) ( ON ?auto_321424 ?auto_321425 ) ( CLEAR ?auto_321422 ) ( ON ?auto_321423 ?auto_321424 ) ( CLEAR ?auto_321423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_321413 ?auto_321414 ?auto_321415 ?auto_321416 ?auto_321417 ?auto_321418 ?auto_321419 ?auto_321420 ?auto_321421 ?auto_321422 ?auto_321423 )
      ( MAKE-14PILE ?auto_321413 ?auto_321414 ?auto_321415 ?auto_321416 ?auto_321417 ?auto_321418 ?auto_321419 ?auto_321420 ?auto_321421 ?auto_321422 ?auto_321423 ?auto_321424 ?auto_321425 ?auto_321426 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321442 - BLOCK
      ?auto_321443 - BLOCK
      ?auto_321444 - BLOCK
      ?auto_321445 - BLOCK
      ?auto_321446 - BLOCK
      ?auto_321447 - BLOCK
      ?auto_321448 - BLOCK
      ?auto_321449 - BLOCK
      ?auto_321450 - BLOCK
      ?auto_321451 - BLOCK
      ?auto_321452 - BLOCK
      ?auto_321453 - BLOCK
      ?auto_321454 - BLOCK
      ?auto_321455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321455 ) ( ON-TABLE ?auto_321442 ) ( ON ?auto_321443 ?auto_321442 ) ( ON ?auto_321444 ?auto_321443 ) ( ON ?auto_321445 ?auto_321444 ) ( ON ?auto_321446 ?auto_321445 ) ( ON ?auto_321447 ?auto_321446 ) ( ON ?auto_321448 ?auto_321447 ) ( ON ?auto_321449 ?auto_321448 ) ( ON ?auto_321450 ?auto_321449 ) ( ON ?auto_321451 ?auto_321450 ) ( not ( = ?auto_321442 ?auto_321443 ) ) ( not ( = ?auto_321442 ?auto_321444 ) ) ( not ( = ?auto_321442 ?auto_321445 ) ) ( not ( = ?auto_321442 ?auto_321446 ) ) ( not ( = ?auto_321442 ?auto_321447 ) ) ( not ( = ?auto_321442 ?auto_321448 ) ) ( not ( = ?auto_321442 ?auto_321449 ) ) ( not ( = ?auto_321442 ?auto_321450 ) ) ( not ( = ?auto_321442 ?auto_321451 ) ) ( not ( = ?auto_321442 ?auto_321452 ) ) ( not ( = ?auto_321442 ?auto_321453 ) ) ( not ( = ?auto_321442 ?auto_321454 ) ) ( not ( = ?auto_321442 ?auto_321455 ) ) ( not ( = ?auto_321443 ?auto_321444 ) ) ( not ( = ?auto_321443 ?auto_321445 ) ) ( not ( = ?auto_321443 ?auto_321446 ) ) ( not ( = ?auto_321443 ?auto_321447 ) ) ( not ( = ?auto_321443 ?auto_321448 ) ) ( not ( = ?auto_321443 ?auto_321449 ) ) ( not ( = ?auto_321443 ?auto_321450 ) ) ( not ( = ?auto_321443 ?auto_321451 ) ) ( not ( = ?auto_321443 ?auto_321452 ) ) ( not ( = ?auto_321443 ?auto_321453 ) ) ( not ( = ?auto_321443 ?auto_321454 ) ) ( not ( = ?auto_321443 ?auto_321455 ) ) ( not ( = ?auto_321444 ?auto_321445 ) ) ( not ( = ?auto_321444 ?auto_321446 ) ) ( not ( = ?auto_321444 ?auto_321447 ) ) ( not ( = ?auto_321444 ?auto_321448 ) ) ( not ( = ?auto_321444 ?auto_321449 ) ) ( not ( = ?auto_321444 ?auto_321450 ) ) ( not ( = ?auto_321444 ?auto_321451 ) ) ( not ( = ?auto_321444 ?auto_321452 ) ) ( not ( = ?auto_321444 ?auto_321453 ) ) ( not ( = ?auto_321444 ?auto_321454 ) ) ( not ( = ?auto_321444 ?auto_321455 ) ) ( not ( = ?auto_321445 ?auto_321446 ) ) ( not ( = ?auto_321445 ?auto_321447 ) ) ( not ( = ?auto_321445 ?auto_321448 ) ) ( not ( = ?auto_321445 ?auto_321449 ) ) ( not ( = ?auto_321445 ?auto_321450 ) ) ( not ( = ?auto_321445 ?auto_321451 ) ) ( not ( = ?auto_321445 ?auto_321452 ) ) ( not ( = ?auto_321445 ?auto_321453 ) ) ( not ( = ?auto_321445 ?auto_321454 ) ) ( not ( = ?auto_321445 ?auto_321455 ) ) ( not ( = ?auto_321446 ?auto_321447 ) ) ( not ( = ?auto_321446 ?auto_321448 ) ) ( not ( = ?auto_321446 ?auto_321449 ) ) ( not ( = ?auto_321446 ?auto_321450 ) ) ( not ( = ?auto_321446 ?auto_321451 ) ) ( not ( = ?auto_321446 ?auto_321452 ) ) ( not ( = ?auto_321446 ?auto_321453 ) ) ( not ( = ?auto_321446 ?auto_321454 ) ) ( not ( = ?auto_321446 ?auto_321455 ) ) ( not ( = ?auto_321447 ?auto_321448 ) ) ( not ( = ?auto_321447 ?auto_321449 ) ) ( not ( = ?auto_321447 ?auto_321450 ) ) ( not ( = ?auto_321447 ?auto_321451 ) ) ( not ( = ?auto_321447 ?auto_321452 ) ) ( not ( = ?auto_321447 ?auto_321453 ) ) ( not ( = ?auto_321447 ?auto_321454 ) ) ( not ( = ?auto_321447 ?auto_321455 ) ) ( not ( = ?auto_321448 ?auto_321449 ) ) ( not ( = ?auto_321448 ?auto_321450 ) ) ( not ( = ?auto_321448 ?auto_321451 ) ) ( not ( = ?auto_321448 ?auto_321452 ) ) ( not ( = ?auto_321448 ?auto_321453 ) ) ( not ( = ?auto_321448 ?auto_321454 ) ) ( not ( = ?auto_321448 ?auto_321455 ) ) ( not ( = ?auto_321449 ?auto_321450 ) ) ( not ( = ?auto_321449 ?auto_321451 ) ) ( not ( = ?auto_321449 ?auto_321452 ) ) ( not ( = ?auto_321449 ?auto_321453 ) ) ( not ( = ?auto_321449 ?auto_321454 ) ) ( not ( = ?auto_321449 ?auto_321455 ) ) ( not ( = ?auto_321450 ?auto_321451 ) ) ( not ( = ?auto_321450 ?auto_321452 ) ) ( not ( = ?auto_321450 ?auto_321453 ) ) ( not ( = ?auto_321450 ?auto_321454 ) ) ( not ( = ?auto_321450 ?auto_321455 ) ) ( not ( = ?auto_321451 ?auto_321452 ) ) ( not ( = ?auto_321451 ?auto_321453 ) ) ( not ( = ?auto_321451 ?auto_321454 ) ) ( not ( = ?auto_321451 ?auto_321455 ) ) ( not ( = ?auto_321452 ?auto_321453 ) ) ( not ( = ?auto_321452 ?auto_321454 ) ) ( not ( = ?auto_321452 ?auto_321455 ) ) ( not ( = ?auto_321453 ?auto_321454 ) ) ( not ( = ?auto_321453 ?auto_321455 ) ) ( not ( = ?auto_321454 ?auto_321455 ) ) ( ON ?auto_321454 ?auto_321455 ) ( ON ?auto_321453 ?auto_321454 ) ( CLEAR ?auto_321451 ) ( ON ?auto_321452 ?auto_321453 ) ( CLEAR ?auto_321452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_321442 ?auto_321443 ?auto_321444 ?auto_321445 ?auto_321446 ?auto_321447 ?auto_321448 ?auto_321449 ?auto_321450 ?auto_321451 ?auto_321452 )
      ( MAKE-14PILE ?auto_321442 ?auto_321443 ?auto_321444 ?auto_321445 ?auto_321446 ?auto_321447 ?auto_321448 ?auto_321449 ?auto_321450 ?auto_321451 ?auto_321452 ?auto_321453 ?auto_321454 ?auto_321455 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321470 - BLOCK
      ?auto_321471 - BLOCK
      ?auto_321472 - BLOCK
      ?auto_321473 - BLOCK
      ?auto_321474 - BLOCK
      ?auto_321475 - BLOCK
      ?auto_321476 - BLOCK
      ?auto_321477 - BLOCK
      ?auto_321478 - BLOCK
      ?auto_321479 - BLOCK
      ?auto_321480 - BLOCK
      ?auto_321481 - BLOCK
      ?auto_321482 - BLOCK
      ?auto_321483 - BLOCK
    )
    :vars
    (
      ?auto_321484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321483 ?auto_321484 ) ( ON-TABLE ?auto_321470 ) ( ON ?auto_321471 ?auto_321470 ) ( ON ?auto_321472 ?auto_321471 ) ( ON ?auto_321473 ?auto_321472 ) ( ON ?auto_321474 ?auto_321473 ) ( ON ?auto_321475 ?auto_321474 ) ( ON ?auto_321476 ?auto_321475 ) ( ON ?auto_321477 ?auto_321476 ) ( ON ?auto_321478 ?auto_321477 ) ( not ( = ?auto_321470 ?auto_321471 ) ) ( not ( = ?auto_321470 ?auto_321472 ) ) ( not ( = ?auto_321470 ?auto_321473 ) ) ( not ( = ?auto_321470 ?auto_321474 ) ) ( not ( = ?auto_321470 ?auto_321475 ) ) ( not ( = ?auto_321470 ?auto_321476 ) ) ( not ( = ?auto_321470 ?auto_321477 ) ) ( not ( = ?auto_321470 ?auto_321478 ) ) ( not ( = ?auto_321470 ?auto_321479 ) ) ( not ( = ?auto_321470 ?auto_321480 ) ) ( not ( = ?auto_321470 ?auto_321481 ) ) ( not ( = ?auto_321470 ?auto_321482 ) ) ( not ( = ?auto_321470 ?auto_321483 ) ) ( not ( = ?auto_321470 ?auto_321484 ) ) ( not ( = ?auto_321471 ?auto_321472 ) ) ( not ( = ?auto_321471 ?auto_321473 ) ) ( not ( = ?auto_321471 ?auto_321474 ) ) ( not ( = ?auto_321471 ?auto_321475 ) ) ( not ( = ?auto_321471 ?auto_321476 ) ) ( not ( = ?auto_321471 ?auto_321477 ) ) ( not ( = ?auto_321471 ?auto_321478 ) ) ( not ( = ?auto_321471 ?auto_321479 ) ) ( not ( = ?auto_321471 ?auto_321480 ) ) ( not ( = ?auto_321471 ?auto_321481 ) ) ( not ( = ?auto_321471 ?auto_321482 ) ) ( not ( = ?auto_321471 ?auto_321483 ) ) ( not ( = ?auto_321471 ?auto_321484 ) ) ( not ( = ?auto_321472 ?auto_321473 ) ) ( not ( = ?auto_321472 ?auto_321474 ) ) ( not ( = ?auto_321472 ?auto_321475 ) ) ( not ( = ?auto_321472 ?auto_321476 ) ) ( not ( = ?auto_321472 ?auto_321477 ) ) ( not ( = ?auto_321472 ?auto_321478 ) ) ( not ( = ?auto_321472 ?auto_321479 ) ) ( not ( = ?auto_321472 ?auto_321480 ) ) ( not ( = ?auto_321472 ?auto_321481 ) ) ( not ( = ?auto_321472 ?auto_321482 ) ) ( not ( = ?auto_321472 ?auto_321483 ) ) ( not ( = ?auto_321472 ?auto_321484 ) ) ( not ( = ?auto_321473 ?auto_321474 ) ) ( not ( = ?auto_321473 ?auto_321475 ) ) ( not ( = ?auto_321473 ?auto_321476 ) ) ( not ( = ?auto_321473 ?auto_321477 ) ) ( not ( = ?auto_321473 ?auto_321478 ) ) ( not ( = ?auto_321473 ?auto_321479 ) ) ( not ( = ?auto_321473 ?auto_321480 ) ) ( not ( = ?auto_321473 ?auto_321481 ) ) ( not ( = ?auto_321473 ?auto_321482 ) ) ( not ( = ?auto_321473 ?auto_321483 ) ) ( not ( = ?auto_321473 ?auto_321484 ) ) ( not ( = ?auto_321474 ?auto_321475 ) ) ( not ( = ?auto_321474 ?auto_321476 ) ) ( not ( = ?auto_321474 ?auto_321477 ) ) ( not ( = ?auto_321474 ?auto_321478 ) ) ( not ( = ?auto_321474 ?auto_321479 ) ) ( not ( = ?auto_321474 ?auto_321480 ) ) ( not ( = ?auto_321474 ?auto_321481 ) ) ( not ( = ?auto_321474 ?auto_321482 ) ) ( not ( = ?auto_321474 ?auto_321483 ) ) ( not ( = ?auto_321474 ?auto_321484 ) ) ( not ( = ?auto_321475 ?auto_321476 ) ) ( not ( = ?auto_321475 ?auto_321477 ) ) ( not ( = ?auto_321475 ?auto_321478 ) ) ( not ( = ?auto_321475 ?auto_321479 ) ) ( not ( = ?auto_321475 ?auto_321480 ) ) ( not ( = ?auto_321475 ?auto_321481 ) ) ( not ( = ?auto_321475 ?auto_321482 ) ) ( not ( = ?auto_321475 ?auto_321483 ) ) ( not ( = ?auto_321475 ?auto_321484 ) ) ( not ( = ?auto_321476 ?auto_321477 ) ) ( not ( = ?auto_321476 ?auto_321478 ) ) ( not ( = ?auto_321476 ?auto_321479 ) ) ( not ( = ?auto_321476 ?auto_321480 ) ) ( not ( = ?auto_321476 ?auto_321481 ) ) ( not ( = ?auto_321476 ?auto_321482 ) ) ( not ( = ?auto_321476 ?auto_321483 ) ) ( not ( = ?auto_321476 ?auto_321484 ) ) ( not ( = ?auto_321477 ?auto_321478 ) ) ( not ( = ?auto_321477 ?auto_321479 ) ) ( not ( = ?auto_321477 ?auto_321480 ) ) ( not ( = ?auto_321477 ?auto_321481 ) ) ( not ( = ?auto_321477 ?auto_321482 ) ) ( not ( = ?auto_321477 ?auto_321483 ) ) ( not ( = ?auto_321477 ?auto_321484 ) ) ( not ( = ?auto_321478 ?auto_321479 ) ) ( not ( = ?auto_321478 ?auto_321480 ) ) ( not ( = ?auto_321478 ?auto_321481 ) ) ( not ( = ?auto_321478 ?auto_321482 ) ) ( not ( = ?auto_321478 ?auto_321483 ) ) ( not ( = ?auto_321478 ?auto_321484 ) ) ( not ( = ?auto_321479 ?auto_321480 ) ) ( not ( = ?auto_321479 ?auto_321481 ) ) ( not ( = ?auto_321479 ?auto_321482 ) ) ( not ( = ?auto_321479 ?auto_321483 ) ) ( not ( = ?auto_321479 ?auto_321484 ) ) ( not ( = ?auto_321480 ?auto_321481 ) ) ( not ( = ?auto_321480 ?auto_321482 ) ) ( not ( = ?auto_321480 ?auto_321483 ) ) ( not ( = ?auto_321480 ?auto_321484 ) ) ( not ( = ?auto_321481 ?auto_321482 ) ) ( not ( = ?auto_321481 ?auto_321483 ) ) ( not ( = ?auto_321481 ?auto_321484 ) ) ( not ( = ?auto_321482 ?auto_321483 ) ) ( not ( = ?auto_321482 ?auto_321484 ) ) ( not ( = ?auto_321483 ?auto_321484 ) ) ( ON ?auto_321482 ?auto_321483 ) ( ON ?auto_321481 ?auto_321482 ) ( ON ?auto_321480 ?auto_321481 ) ( CLEAR ?auto_321478 ) ( ON ?auto_321479 ?auto_321480 ) ( CLEAR ?auto_321479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_321470 ?auto_321471 ?auto_321472 ?auto_321473 ?auto_321474 ?auto_321475 ?auto_321476 ?auto_321477 ?auto_321478 ?auto_321479 )
      ( MAKE-14PILE ?auto_321470 ?auto_321471 ?auto_321472 ?auto_321473 ?auto_321474 ?auto_321475 ?auto_321476 ?auto_321477 ?auto_321478 ?auto_321479 ?auto_321480 ?auto_321481 ?auto_321482 ?auto_321483 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321499 - BLOCK
      ?auto_321500 - BLOCK
      ?auto_321501 - BLOCK
      ?auto_321502 - BLOCK
      ?auto_321503 - BLOCK
      ?auto_321504 - BLOCK
      ?auto_321505 - BLOCK
      ?auto_321506 - BLOCK
      ?auto_321507 - BLOCK
      ?auto_321508 - BLOCK
      ?auto_321509 - BLOCK
      ?auto_321510 - BLOCK
      ?auto_321511 - BLOCK
      ?auto_321512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321512 ) ( ON-TABLE ?auto_321499 ) ( ON ?auto_321500 ?auto_321499 ) ( ON ?auto_321501 ?auto_321500 ) ( ON ?auto_321502 ?auto_321501 ) ( ON ?auto_321503 ?auto_321502 ) ( ON ?auto_321504 ?auto_321503 ) ( ON ?auto_321505 ?auto_321504 ) ( ON ?auto_321506 ?auto_321505 ) ( ON ?auto_321507 ?auto_321506 ) ( not ( = ?auto_321499 ?auto_321500 ) ) ( not ( = ?auto_321499 ?auto_321501 ) ) ( not ( = ?auto_321499 ?auto_321502 ) ) ( not ( = ?auto_321499 ?auto_321503 ) ) ( not ( = ?auto_321499 ?auto_321504 ) ) ( not ( = ?auto_321499 ?auto_321505 ) ) ( not ( = ?auto_321499 ?auto_321506 ) ) ( not ( = ?auto_321499 ?auto_321507 ) ) ( not ( = ?auto_321499 ?auto_321508 ) ) ( not ( = ?auto_321499 ?auto_321509 ) ) ( not ( = ?auto_321499 ?auto_321510 ) ) ( not ( = ?auto_321499 ?auto_321511 ) ) ( not ( = ?auto_321499 ?auto_321512 ) ) ( not ( = ?auto_321500 ?auto_321501 ) ) ( not ( = ?auto_321500 ?auto_321502 ) ) ( not ( = ?auto_321500 ?auto_321503 ) ) ( not ( = ?auto_321500 ?auto_321504 ) ) ( not ( = ?auto_321500 ?auto_321505 ) ) ( not ( = ?auto_321500 ?auto_321506 ) ) ( not ( = ?auto_321500 ?auto_321507 ) ) ( not ( = ?auto_321500 ?auto_321508 ) ) ( not ( = ?auto_321500 ?auto_321509 ) ) ( not ( = ?auto_321500 ?auto_321510 ) ) ( not ( = ?auto_321500 ?auto_321511 ) ) ( not ( = ?auto_321500 ?auto_321512 ) ) ( not ( = ?auto_321501 ?auto_321502 ) ) ( not ( = ?auto_321501 ?auto_321503 ) ) ( not ( = ?auto_321501 ?auto_321504 ) ) ( not ( = ?auto_321501 ?auto_321505 ) ) ( not ( = ?auto_321501 ?auto_321506 ) ) ( not ( = ?auto_321501 ?auto_321507 ) ) ( not ( = ?auto_321501 ?auto_321508 ) ) ( not ( = ?auto_321501 ?auto_321509 ) ) ( not ( = ?auto_321501 ?auto_321510 ) ) ( not ( = ?auto_321501 ?auto_321511 ) ) ( not ( = ?auto_321501 ?auto_321512 ) ) ( not ( = ?auto_321502 ?auto_321503 ) ) ( not ( = ?auto_321502 ?auto_321504 ) ) ( not ( = ?auto_321502 ?auto_321505 ) ) ( not ( = ?auto_321502 ?auto_321506 ) ) ( not ( = ?auto_321502 ?auto_321507 ) ) ( not ( = ?auto_321502 ?auto_321508 ) ) ( not ( = ?auto_321502 ?auto_321509 ) ) ( not ( = ?auto_321502 ?auto_321510 ) ) ( not ( = ?auto_321502 ?auto_321511 ) ) ( not ( = ?auto_321502 ?auto_321512 ) ) ( not ( = ?auto_321503 ?auto_321504 ) ) ( not ( = ?auto_321503 ?auto_321505 ) ) ( not ( = ?auto_321503 ?auto_321506 ) ) ( not ( = ?auto_321503 ?auto_321507 ) ) ( not ( = ?auto_321503 ?auto_321508 ) ) ( not ( = ?auto_321503 ?auto_321509 ) ) ( not ( = ?auto_321503 ?auto_321510 ) ) ( not ( = ?auto_321503 ?auto_321511 ) ) ( not ( = ?auto_321503 ?auto_321512 ) ) ( not ( = ?auto_321504 ?auto_321505 ) ) ( not ( = ?auto_321504 ?auto_321506 ) ) ( not ( = ?auto_321504 ?auto_321507 ) ) ( not ( = ?auto_321504 ?auto_321508 ) ) ( not ( = ?auto_321504 ?auto_321509 ) ) ( not ( = ?auto_321504 ?auto_321510 ) ) ( not ( = ?auto_321504 ?auto_321511 ) ) ( not ( = ?auto_321504 ?auto_321512 ) ) ( not ( = ?auto_321505 ?auto_321506 ) ) ( not ( = ?auto_321505 ?auto_321507 ) ) ( not ( = ?auto_321505 ?auto_321508 ) ) ( not ( = ?auto_321505 ?auto_321509 ) ) ( not ( = ?auto_321505 ?auto_321510 ) ) ( not ( = ?auto_321505 ?auto_321511 ) ) ( not ( = ?auto_321505 ?auto_321512 ) ) ( not ( = ?auto_321506 ?auto_321507 ) ) ( not ( = ?auto_321506 ?auto_321508 ) ) ( not ( = ?auto_321506 ?auto_321509 ) ) ( not ( = ?auto_321506 ?auto_321510 ) ) ( not ( = ?auto_321506 ?auto_321511 ) ) ( not ( = ?auto_321506 ?auto_321512 ) ) ( not ( = ?auto_321507 ?auto_321508 ) ) ( not ( = ?auto_321507 ?auto_321509 ) ) ( not ( = ?auto_321507 ?auto_321510 ) ) ( not ( = ?auto_321507 ?auto_321511 ) ) ( not ( = ?auto_321507 ?auto_321512 ) ) ( not ( = ?auto_321508 ?auto_321509 ) ) ( not ( = ?auto_321508 ?auto_321510 ) ) ( not ( = ?auto_321508 ?auto_321511 ) ) ( not ( = ?auto_321508 ?auto_321512 ) ) ( not ( = ?auto_321509 ?auto_321510 ) ) ( not ( = ?auto_321509 ?auto_321511 ) ) ( not ( = ?auto_321509 ?auto_321512 ) ) ( not ( = ?auto_321510 ?auto_321511 ) ) ( not ( = ?auto_321510 ?auto_321512 ) ) ( not ( = ?auto_321511 ?auto_321512 ) ) ( ON ?auto_321511 ?auto_321512 ) ( ON ?auto_321510 ?auto_321511 ) ( ON ?auto_321509 ?auto_321510 ) ( CLEAR ?auto_321507 ) ( ON ?auto_321508 ?auto_321509 ) ( CLEAR ?auto_321508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_321499 ?auto_321500 ?auto_321501 ?auto_321502 ?auto_321503 ?auto_321504 ?auto_321505 ?auto_321506 ?auto_321507 ?auto_321508 )
      ( MAKE-14PILE ?auto_321499 ?auto_321500 ?auto_321501 ?auto_321502 ?auto_321503 ?auto_321504 ?auto_321505 ?auto_321506 ?auto_321507 ?auto_321508 ?auto_321509 ?auto_321510 ?auto_321511 ?auto_321512 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321527 - BLOCK
      ?auto_321528 - BLOCK
      ?auto_321529 - BLOCK
      ?auto_321530 - BLOCK
      ?auto_321531 - BLOCK
      ?auto_321532 - BLOCK
      ?auto_321533 - BLOCK
      ?auto_321534 - BLOCK
      ?auto_321535 - BLOCK
      ?auto_321536 - BLOCK
      ?auto_321537 - BLOCK
      ?auto_321538 - BLOCK
      ?auto_321539 - BLOCK
      ?auto_321540 - BLOCK
    )
    :vars
    (
      ?auto_321541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321540 ?auto_321541 ) ( ON-TABLE ?auto_321527 ) ( ON ?auto_321528 ?auto_321527 ) ( ON ?auto_321529 ?auto_321528 ) ( ON ?auto_321530 ?auto_321529 ) ( ON ?auto_321531 ?auto_321530 ) ( ON ?auto_321532 ?auto_321531 ) ( ON ?auto_321533 ?auto_321532 ) ( ON ?auto_321534 ?auto_321533 ) ( not ( = ?auto_321527 ?auto_321528 ) ) ( not ( = ?auto_321527 ?auto_321529 ) ) ( not ( = ?auto_321527 ?auto_321530 ) ) ( not ( = ?auto_321527 ?auto_321531 ) ) ( not ( = ?auto_321527 ?auto_321532 ) ) ( not ( = ?auto_321527 ?auto_321533 ) ) ( not ( = ?auto_321527 ?auto_321534 ) ) ( not ( = ?auto_321527 ?auto_321535 ) ) ( not ( = ?auto_321527 ?auto_321536 ) ) ( not ( = ?auto_321527 ?auto_321537 ) ) ( not ( = ?auto_321527 ?auto_321538 ) ) ( not ( = ?auto_321527 ?auto_321539 ) ) ( not ( = ?auto_321527 ?auto_321540 ) ) ( not ( = ?auto_321527 ?auto_321541 ) ) ( not ( = ?auto_321528 ?auto_321529 ) ) ( not ( = ?auto_321528 ?auto_321530 ) ) ( not ( = ?auto_321528 ?auto_321531 ) ) ( not ( = ?auto_321528 ?auto_321532 ) ) ( not ( = ?auto_321528 ?auto_321533 ) ) ( not ( = ?auto_321528 ?auto_321534 ) ) ( not ( = ?auto_321528 ?auto_321535 ) ) ( not ( = ?auto_321528 ?auto_321536 ) ) ( not ( = ?auto_321528 ?auto_321537 ) ) ( not ( = ?auto_321528 ?auto_321538 ) ) ( not ( = ?auto_321528 ?auto_321539 ) ) ( not ( = ?auto_321528 ?auto_321540 ) ) ( not ( = ?auto_321528 ?auto_321541 ) ) ( not ( = ?auto_321529 ?auto_321530 ) ) ( not ( = ?auto_321529 ?auto_321531 ) ) ( not ( = ?auto_321529 ?auto_321532 ) ) ( not ( = ?auto_321529 ?auto_321533 ) ) ( not ( = ?auto_321529 ?auto_321534 ) ) ( not ( = ?auto_321529 ?auto_321535 ) ) ( not ( = ?auto_321529 ?auto_321536 ) ) ( not ( = ?auto_321529 ?auto_321537 ) ) ( not ( = ?auto_321529 ?auto_321538 ) ) ( not ( = ?auto_321529 ?auto_321539 ) ) ( not ( = ?auto_321529 ?auto_321540 ) ) ( not ( = ?auto_321529 ?auto_321541 ) ) ( not ( = ?auto_321530 ?auto_321531 ) ) ( not ( = ?auto_321530 ?auto_321532 ) ) ( not ( = ?auto_321530 ?auto_321533 ) ) ( not ( = ?auto_321530 ?auto_321534 ) ) ( not ( = ?auto_321530 ?auto_321535 ) ) ( not ( = ?auto_321530 ?auto_321536 ) ) ( not ( = ?auto_321530 ?auto_321537 ) ) ( not ( = ?auto_321530 ?auto_321538 ) ) ( not ( = ?auto_321530 ?auto_321539 ) ) ( not ( = ?auto_321530 ?auto_321540 ) ) ( not ( = ?auto_321530 ?auto_321541 ) ) ( not ( = ?auto_321531 ?auto_321532 ) ) ( not ( = ?auto_321531 ?auto_321533 ) ) ( not ( = ?auto_321531 ?auto_321534 ) ) ( not ( = ?auto_321531 ?auto_321535 ) ) ( not ( = ?auto_321531 ?auto_321536 ) ) ( not ( = ?auto_321531 ?auto_321537 ) ) ( not ( = ?auto_321531 ?auto_321538 ) ) ( not ( = ?auto_321531 ?auto_321539 ) ) ( not ( = ?auto_321531 ?auto_321540 ) ) ( not ( = ?auto_321531 ?auto_321541 ) ) ( not ( = ?auto_321532 ?auto_321533 ) ) ( not ( = ?auto_321532 ?auto_321534 ) ) ( not ( = ?auto_321532 ?auto_321535 ) ) ( not ( = ?auto_321532 ?auto_321536 ) ) ( not ( = ?auto_321532 ?auto_321537 ) ) ( not ( = ?auto_321532 ?auto_321538 ) ) ( not ( = ?auto_321532 ?auto_321539 ) ) ( not ( = ?auto_321532 ?auto_321540 ) ) ( not ( = ?auto_321532 ?auto_321541 ) ) ( not ( = ?auto_321533 ?auto_321534 ) ) ( not ( = ?auto_321533 ?auto_321535 ) ) ( not ( = ?auto_321533 ?auto_321536 ) ) ( not ( = ?auto_321533 ?auto_321537 ) ) ( not ( = ?auto_321533 ?auto_321538 ) ) ( not ( = ?auto_321533 ?auto_321539 ) ) ( not ( = ?auto_321533 ?auto_321540 ) ) ( not ( = ?auto_321533 ?auto_321541 ) ) ( not ( = ?auto_321534 ?auto_321535 ) ) ( not ( = ?auto_321534 ?auto_321536 ) ) ( not ( = ?auto_321534 ?auto_321537 ) ) ( not ( = ?auto_321534 ?auto_321538 ) ) ( not ( = ?auto_321534 ?auto_321539 ) ) ( not ( = ?auto_321534 ?auto_321540 ) ) ( not ( = ?auto_321534 ?auto_321541 ) ) ( not ( = ?auto_321535 ?auto_321536 ) ) ( not ( = ?auto_321535 ?auto_321537 ) ) ( not ( = ?auto_321535 ?auto_321538 ) ) ( not ( = ?auto_321535 ?auto_321539 ) ) ( not ( = ?auto_321535 ?auto_321540 ) ) ( not ( = ?auto_321535 ?auto_321541 ) ) ( not ( = ?auto_321536 ?auto_321537 ) ) ( not ( = ?auto_321536 ?auto_321538 ) ) ( not ( = ?auto_321536 ?auto_321539 ) ) ( not ( = ?auto_321536 ?auto_321540 ) ) ( not ( = ?auto_321536 ?auto_321541 ) ) ( not ( = ?auto_321537 ?auto_321538 ) ) ( not ( = ?auto_321537 ?auto_321539 ) ) ( not ( = ?auto_321537 ?auto_321540 ) ) ( not ( = ?auto_321537 ?auto_321541 ) ) ( not ( = ?auto_321538 ?auto_321539 ) ) ( not ( = ?auto_321538 ?auto_321540 ) ) ( not ( = ?auto_321538 ?auto_321541 ) ) ( not ( = ?auto_321539 ?auto_321540 ) ) ( not ( = ?auto_321539 ?auto_321541 ) ) ( not ( = ?auto_321540 ?auto_321541 ) ) ( ON ?auto_321539 ?auto_321540 ) ( ON ?auto_321538 ?auto_321539 ) ( ON ?auto_321537 ?auto_321538 ) ( ON ?auto_321536 ?auto_321537 ) ( CLEAR ?auto_321534 ) ( ON ?auto_321535 ?auto_321536 ) ( CLEAR ?auto_321535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_321527 ?auto_321528 ?auto_321529 ?auto_321530 ?auto_321531 ?auto_321532 ?auto_321533 ?auto_321534 ?auto_321535 )
      ( MAKE-14PILE ?auto_321527 ?auto_321528 ?auto_321529 ?auto_321530 ?auto_321531 ?auto_321532 ?auto_321533 ?auto_321534 ?auto_321535 ?auto_321536 ?auto_321537 ?auto_321538 ?auto_321539 ?auto_321540 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321556 - BLOCK
      ?auto_321557 - BLOCK
      ?auto_321558 - BLOCK
      ?auto_321559 - BLOCK
      ?auto_321560 - BLOCK
      ?auto_321561 - BLOCK
      ?auto_321562 - BLOCK
      ?auto_321563 - BLOCK
      ?auto_321564 - BLOCK
      ?auto_321565 - BLOCK
      ?auto_321566 - BLOCK
      ?auto_321567 - BLOCK
      ?auto_321568 - BLOCK
      ?auto_321569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321569 ) ( ON-TABLE ?auto_321556 ) ( ON ?auto_321557 ?auto_321556 ) ( ON ?auto_321558 ?auto_321557 ) ( ON ?auto_321559 ?auto_321558 ) ( ON ?auto_321560 ?auto_321559 ) ( ON ?auto_321561 ?auto_321560 ) ( ON ?auto_321562 ?auto_321561 ) ( ON ?auto_321563 ?auto_321562 ) ( not ( = ?auto_321556 ?auto_321557 ) ) ( not ( = ?auto_321556 ?auto_321558 ) ) ( not ( = ?auto_321556 ?auto_321559 ) ) ( not ( = ?auto_321556 ?auto_321560 ) ) ( not ( = ?auto_321556 ?auto_321561 ) ) ( not ( = ?auto_321556 ?auto_321562 ) ) ( not ( = ?auto_321556 ?auto_321563 ) ) ( not ( = ?auto_321556 ?auto_321564 ) ) ( not ( = ?auto_321556 ?auto_321565 ) ) ( not ( = ?auto_321556 ?auto_321566 ) ) ( not ( = ?auto_321556 ?auto_321567 ) ) ( not ( = ?auto_321556 ?auto_321568 ) ) ( not ( = ?auto_321556 ?auto_321569 ) ) ( not ( = ?auto_321557 ?auto_321558 ) ) ( not ( = ?auto_321557 ?auto_321559 ) ) ( not ( = ?auto_321557 ?auto_321560 ) ) ( not ( = ?auto_321557 ?auto_321561 ) ) ( not ( = ?auto_321557 ?auto_321562 ) ) ( not ( = ?auto_321557 ?auto_321563 ) ) ( not ( = ?auto_321557 ?auto_321564 ) ) ( not ( = ?auto_321557 ?auto_321565 ) ) ( not ( = ?auto_321557 ?auto_321566 ) ) ( not ( = ?auto_321557 ?auto_321567 ) ) ( not ( = ?auto_321557 ?auto_321568 ) ) ( not ( = ?auto_321557 ?auto_321569 ) ) ( not ( = ?auto_321558 ?auto_321559 ) ) ( not ( = ?auto_321558 ?auto_321560 ) ) ( not ( = ?auto_321558 ?auto_321561 ) ) ( not ( = ?auto_321558 ?auto_321562 ) ) ( not ( = ?auto_321558 ?auto_321563 ) ) ( not ( = ?auto_321558 ?auto_321564 ) ) ( not ( = ?auto_321558 ?auto_321565 ) ) ( not ( = ?auto_321558 ?auto_321566 ) ) ( not ( = ?auto_321558 ?auto_321567 ) ) ( not ( = ?auto_321558 ?auto_321568 ) ) ( not ( = ?auto_321558 ?auto_321569 ) ) ( not ( = ?auto_321559 ?auto_321560 ) ) ( not ( = ?auto_321559 ?auto_321561 ) ) ( not ( = ?auto_321559 ?auto_321562 ) ) ( not ( = ?auto_321559 ?auto_321563 ) ) ( not ( = ?auto_321559 ?auto_321564 ) ) ( not ( = ?auto_321559 ?auto_321565 ) ) ( not ( = ?auto_321559 ?auto_321566 ) ) ( not ( = ?auto_321559 ?auto_321567 ) ) ( not ( = ?auto_321559 ?auto_321568 ) ) ( not ( = ?auto_321559 ?auto_321569 ) ) ( not ( = ?auto_321560 ?auto_321561 ) ) ( not ( = ?auto_321560 ?auto_321562 ) ) ( not ( = ?auto_321560 ?auto_321563 ) ) ( not ( = ?auto_321560 ?auto_321564 ) ) ( not ( = ?auto_321560 ?auto_321565 ) ) ( not ( = ?auto_321560 ?auto_321566 ) ) ( not ( = ?auto_321560 ?auto_321567 ) ) ( not ( = ?auto_321560 ?auto_321568 ) ) ( not ( = ?auto_321560 ?auto_321569 ) ) ( not ( = ?auto_321561 ?auto_321562 ) ) ( not ( = ?auto_321561 ?auto_321563 ) ) ( not ( = ?auto_321561 ?auto_321564 ) ) ( not ( = ?auto_321561 ?auto_321565 ) ) ( not ( = ?auto_321561 ?auto_321566 ) ) ( not ( = ?auto_321561 ?auto_321567 ) ) ( not ( = ?auto_321561 ?auto_321568 ) ) ( not ( = ?auto_321561 ?auto_321569 ) ) ( not ( = ?auto_321562 ?auto_321563 ) ) ( not ( = ?auto_321562 ?auto_321564 ) ) ( not ( = ?auto_321562 ?auto_321565 ) ) ( not ( = ?auto_321562 ?auto_321566 ) ) ( not ( = ?auto_321562 ?auto_321567 ) ) ( not ( = ?auto_321562 ?auto_321568 ) ) ( not ( = ?auto_321562 ?auto_321569 ) ) ( not ( = ?auto_321563 ?auto_321564 ) ) ( not ( = ?auto_321563 ?auto_321565 ) ) ( not ( = ?auto_321563 ?auto_321566 ) ) ( not ( = ?auto_321563 ?auto_321567 ) ) ( not ( = ?auto_321563 ?auto_321568 ) ) ( not ( = ?auto_321563 ?auto_321569 ) ) ( not ( = ?auto_321564 ?auto_321565 ) ) ( not ( = ?auto_321564 ?auto_321566 ) ) ( not ( = ?auto_321564 ?auto_321567 ) ) ( not ( = ?auto_321564 ?auto_321568 ) ) ( not ( = ?auto_321564 ?auto_321569 ) ) ( not ( = ?auto_321565 ?auto_321566 ) ) ( not ( = ?auto_321565 ?auto_321567 ) ) ( not ( = ?auto_321565 ?auto_321568 ) ) ( not ( = ?auto_321565 ?auto_321569 ) ) ( not ( = ?auto_321566 ?auto_321567 ) ) ( not ( = ?auto_321566 ?auto_321568 ) ) ( not ( = ?auto_321566 ?auto_321569 ) ) ( not ( = ?auto_321567 ?auto_321568 ) ) ( not ( = ?auto_321567 ?auto_321569 ) ) ( not ( = ?auto_321568 ?auto_321569 ) ) ( ON ?auto_321568 ?auto_321569 ) ( ON ?auto_321567 ?auto_321568 ) ( ON ?auto_321566 ?auto_321567 ) ( ON ?auto_321565 ?auto_321566 ) ( CLEAR ?auto_321563 ) ( ON ?auto_321564 ?auto_321565 ) ( CLEAR ?auto_321564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_321556 ?auto_321557 ?auto_321558 ?auto_321559 ?auto_321560 ?auto_321561 ?auto_321562 ?auto_321563 ?auto_321564 )
      ( MAKE-14PILE ?auto_321556 ?auto_321557 ?auto_321558 ?auto_321559 ?auto_321560 ?auto_321561 ?auto_321562 ?auto_321563 ?auto_321564 ?auto_321565 ?auto_321566 ?auto_321567 ?auto_321568 ?auto_321569 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321584 - BLOCK
      ?auto_321585 - BLOCK
      ?auto_321586 - BLOCK
      ?auto_321587 - BLOCK
      ?auto_321588 - BLOCK
      ?auto_321589 - BLOCK
      ?auto_321590 - BLOCK
      ?auto_321591 - BLOCK
      ?auto_321592 - BLOCK
      ?auto_321593 - BLOCK
      ?auto_321594 - BLOCK
      ?auto_321595 - BLOCK
      ?auto_321596 - BLOCK
      ?auto_321597 - BLOCK
    )
    :vars
    (
      ?auto_321598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321597 ?auto_321598 ) ( ON-TABLE ?auto_321584 ) ( ON ?auto_321585 ?auto_321584 ) ( ON ?auto_321586 ?auto_321585 ) ( ON ?auto_321587 ?auto_321586 ) ( ON ?auto_321588 ?auto_321587 ) ( ON ?auto_321589 ?auto_321588 ) ( ON ?auto_321590 ?auto_321589 ) ( not ( = ?auto_321584 ?auto_321585 ) ) ( not ( = ?auto_321584 ?auto_321586 ) ) ( not ( = ?auto_321584 ?auto_321587 ) ) ( not ( = ?auto_321584 ?auto_321588 ) ) ( not ( = ?auto_321584 ?auto_321589 ) ) ( not ( = ?auto_321584 ?auto_321590 ) ) ( not ( = ?auto_321584 ?auto_321591 ) ) ( not ( = ?auto_321584 ?auto_321592 ) ) ( not ( = ?auto_321584 ?auto_321593 ) ) ( not ( = ?auto_321584 ?auto_321594 ) ) ( not ( = ?auto_321584 ?auto_321595 ) ) ( not ( = ?auto_321584 ?auto_321596 ) ) ( not ( = ?auto_321584 ?auto_321597 ) ) ( not ( = ?auto_321584 ?auto_321598 ) ) ( not ( = ?auto_321585 ?auto_321586 ) ) ( not ( = ?auto_321585 ?auto_321587 ) ) ( not ( = ?auto_321585 ?auto_321588 ) ) ( not ( = ?auto_321585 ?auto_321589 ) ) ( not ( = ?auto_321585 ?auto_321590 ) ) ( not ( = ?auto_321585 ?auto_321591 ) ) ( not ( = ?auto_321585 ?auto_321592 ) ) ( not ( = ?auto_321585 ?auto_321593 ) ) ( not ( = ?auto_321585 ?auto_321594 ) ) ( not ( = ?auto_321585 ?auto_321595 ) ) ( not ( = ?auto_321585 ?auto_321596 ) ) ( not ( = ?auto_321585 ?auto_321597 ) ) ( not ( = ?auto_321585 ?auto_321598 ) ) ( not ( = ?auto_321586 ?auto_321587 ) ) ( not ( = ?auto_321586 ?auto_321588 ) ) ( not ( = ?auto_321586 ?auto_321589 ) ) ( not ( = ?auto_321586 ?auto_321590 ) ) ( not ( = ?auto_321586 ?auto_321591 ) ) ( not ( = ?auto_321586 ?auto_321592 ) ) ( not ( = ?auto_321586 ?auto_321593 ) ) ( not ( = ?auto_321586 ?auto_321594 ) ) ( not ( = ?auto_321586 ?auto_321595 ) ) ( not ( = ?auto_321586 ?auto_321596 ) ) ( not ( = ?auto_321586 ?auto_321597 ) ) ( not ( = ?auto_321586 ?auto_321598 ) ) ( not ( = ?auto_321587 ?auto_321588 ) ) ( not ( = ?auto_321587 ?auto_321589 ) ) ( not ( = ?auto_321587 ?auto_321590 ) ) ( not ( = ?auto_321587 ?auto_321591 ) ) ( not ( = ?auto_321587 ?auto_321592 ) ) ( not ( = ?auto_321587 ?auto_321593 ) ) ( not ( = ?auto_321587 ?auto_321594 ) ) ( not ( = ?auto_321587 ?auto_321595 ) ) ( not ( = ?auto_321587 ?auto_321596 ) ) ( not ( = ?auto_321587 ?auto_321597 ) ) ( not ( = ?auto_321587 ?auto_321598 ) ) ( not ( = ?auto_321588 ?auto_321589 ) ) ( not ( = ?auto_321588 ?auto_321590 ) ) ( not ( = ?auto_321588 ?auto_321591 ) ) ( not ( = ?auto_321588 ?auto_321592 ) ) ( not ( = ?auto_321588 ?auto_321593 ) ) ( not ( = ?auto_321588 ?auto_321594 ) ) ( not ( = ?auto_321588 ?auto_321595 ) ) ( not ( = ?auto_321588 ?auto_321596 ) ) ( not ( = ?auto_321588 ?auto_321597 ) ) ( not ( = ?auto_321588 ?auto_321598 ) ) ( not ( = ?auto_321589 ?auto_321590 ) ) ( not ( = ?auto_321589 ?auto_321591 ) ) ( not ( = ?auto_321589 ?auto_321592 ) ) ( not ( = ?auto_321589 ?auto_321593 ) ) ( not ( = ?auto_321589 ?auto_321594 ) ) ( not ( = ?auto_321589 ?auto_321595 ) ) ( not ( = ?auto_321589 ?auto_321596 ) ) ( not ( = ?auto_321589 ?auto_321597 ) ) ( not ( = ?auto_321589 ?auto_321598 ) ) ( not ( = ?auto_321590 ?auto_321591 ) ) ( not ( = ?auto_321590 ?auto_321592 ) ) ( not ( = ?auto_321590 ?auto_321593 ) ) ( not ( = ?auto_321590 ?auto_321594 ) ) ( not ( = ?auto_321590 ?auto_321595 ) ) ( not ( = ?auto_321590 ?auto_321596 ) ) ( not ( = ?auto_321590 ?auto_321597 ) ) ( not ( = ?auto_321590 ?auto_321598 ) ) ( not ( = ?auto_321591 ?auto_321592 ) ) ( not ( = ?auto_321591 ?auto_321593 ) ) ( not ( = ?auto_321591 ?auto_321594 ) ) ( not ( = ?auto_321591 ?auto_321595 ) ) ( not ( = ?auto_321591 ?auto_321596 ) ) ( not ( = ?auto_321591 ?auto_321597 ) ) ( not ( = ?auto_321591 ?auto_321598 ) ) ( not ( = ?auto_321592 ?auto_321593 ) ) ( not ( = ?auto_321592 ?auto_321594 ) ) ( not ( = ?auto_321592 ?auto_321595 ) ) ( not ( = ?auto_321592 ?auto_321596 ) ) ( not ( = ?auto_321592 ?auto_321597 ) ) ( not ( = ?auto_321592 ?auto_321598 ) ) ( not ( = ?auto_321593 ?auto_321594 ) ) ( not ( = ?auto_321593 ?auto_321595 ) ) ( not ( = ?auto_321593 ?auto_321596 ) ) ( not ( = ?auto_321593 ?auto_321597 ) ) ( not ( = ?auto_321593 ?auto_321598 ) ) ( not ( = ?auto_321594 ?auto_321595 ) ) ( not ( = ?auto_321594 ?auto_321596 ) ) ( not ( = ?auto_321594 ?auto_321597 ) ) ( not ( = ?auto_321594 ?auto_321598 ) ) ( not ( = ?auto_321595 ?auto_321596 ) ) ( not ( = ?auto_321595 ?auto_321597 ) ) ( not ( = ?auto_321595 ?auto_321598 ) ) ( not ( = ?auto_321596 ?auto_321597 ) ) ( not ( = ?auto_321596 ?auto_321598 ) ) ( not ( = ?auto_321597 ?auto_321598 ) ) ( ON ?auto_321596 ?auto_321597 ) ( ON ?auto_321595 ?auto_321596 ) ( ON ?auto_321594 ?auto_321595 ) ( ON ?auto_321593 ?auto_321594 ) ( ON ?auto_321592 ?auto_321593 ) ( CLEAR ?auto_321590 ) ( ON ?auto_321591 ?auto_321592 ) ( CLEAR ?auto_321591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_321584 ?auto_321585 ?auto_321586 ?auto_321587 ?auto_321588 ?auto_321589 ?auto_321590 ?auto_321591 )
      ( MAKE-14PILE ?auto_321584 ?auto_321585 ?auto_321586 ?auto_321587 ?auto_321588 ?auto_321589 ?auto_321590 ?auto_321591 ?auto_321592 ?auto_321593 ?auto_321594 ?auto_321595 ?auto_321596 ?auto_321597 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321613 - BLOCK
      ?auto_321614 - BLOCK
      ?auto_321615 - BLOCK
      ?auto_321616 - BLOCK
      ?auto_321617 - BLOCK
      ?auto_321618 - BLOCK
      ?auto_321619 - BLOCK
      ?auto_321620 - BLOCK
      ?auto_321621 - BLOCK
      ?auto_321622 - BLOCK
      ?auto_321623 - BLOCK
      ?auto_321624 - BLOCK
      ?auto_321625 - BLOCK
      ?auto_321626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321626 ) ( ON-TABLE ?auto_321613 ) ( ON ?auto_321614 ?auto_321613 ) ( ON ?auto_321615 ?auto_321614 ) ( ON ?auto_321616 ?auto_321615 ) ( ON ?auto_321617 ?auto_321616 ) ( ON ?auto_321618 ?auto_321617 ) ( ON ?auto_321619 ?auto_321618 ) ( not ( = ?auto_321613 ?auto_321614 ) ) ( not ( = ?auto_321613 ?auto_321615 ) ) ( not ( = ?auto_321613 ?auto_321616 ) ) ( not ( = ?auto_321613 ?auto_321617 ) ) ( not ( = ?auto_321613 ?auto_321618 ) ) ( not ( = ?auto_321613 ?auto_321619 ) ) ( not ( = ?auto_321613 ?auto_321620 ) ) ( not ( = ?auto_321613 ?auto_321621 ) ) ( not ( = ?auto_321613 ?auto_321622 ) ) ( not ( = ?auto_321613 ?auto_321623 ) ) ( not ( = ?auto_321613 ?auto_321624 ) ) ( not ( = ?auto_321613 ?auto_321625 ) ) ( not ( = ?auto_321613 ?auto_321626 ) ) ( not ( = ?auto_321614 ?auto_321615 ) ) ( not ( = ?auto_321614 ?auto_321616 ) ) ( not ( = ?auto_321614 ?auto_321617 ) ) ( not ( = ?auto_321614 ?auto_321618 ) ) ( not ( = ?auto_321614 ?auto_321619 ) ) ( not ( = ?auto_321614 ?auto_321620 ) ) ( not ( = ?auto_321614 ?auto_321621 ) ) ( not ( = ?auto_321614 ?auto_321622 ) ) ( not ( = ?auto_321614 ?auto_321623 ) ) ( not ( = ?auto_321614 ?auto_321624 ) ) ( not ( = ?auto_321614 ?auto_321625 ) ) ( not ( = ?auto_321614 ?auto_321626 ) ) ( not ( = ?auto_321615 ?auto_321616 ) ) ( not ( = ?auto_321615 ?auto_321617 ) ) ( not ( = ?auto_321615 ?auto_321618 ) ) ( not ( = ?auto_321615 ?auto_321619 ) ) ( not ( = ?auto_321615 ?auto_321620 ) ) ( not ( = ?auto_321615 ?auto_321621 ) ) ( not ( = ?auto_321615 ?auto_321622 ) ) ( not ( = ?auto_321615 ?auto_321623 ) ) ( not ( = ?auto_321615 ?auto_321624 ) ) ( not ( = ?auto_321615 ?auto_321625 ) ) ( not ( = ?auto_321615 ?auto_321626 ) ) ( not ( = ?auto_321616 ?auto_321617 ) ) ( not ( = ?auto_321616 ?auto_321618 ) ) ( not ( = ?auto_321616 ?auto_321619 ) ) ( not ( = ?auto_321616 ?auto_321620 ) ) ( not ( = ?auto_321616 ?auto_321621 ) ) ( not ( = ?auto_321616 ?auto_321622 ) ) ( not ( = ?auto_321616 ?auto_321623 ) ) ( not ( = ?auto_321616 ?auto_321624 ) ) ( not ( = ?auto_321616 ?auto_321625 ) ) ( not ( = ?auto_321616 ?auto_321626 ) ) ( not ( = ?auto_321617 ?auto_321618 ) ) ( not ( = ?auto_321617 ?auto_321619 ) ) ( not ( = ?auto_321617 ?auto_321620 ) ) ( not ( = ?auto_321617 ?auto_321621 ) ) ( not ( = ?auto_321617 ?auto_321622 ) ) ( not ( = ?auto_321617 ?auto_321623 ) ) ( not ( = ?auto_321617 ?auto_321624 ) ) ( not ( = ?auto_321617 ?auto_321625 ) ) ( not ( = ?auto_321617 ?auto_321626 ) ) ( not ( = ?auto_321618 ?auto_321619 ) ) ( not ( = ?auto_321618 ?auto_321620 ) ) ( not ( = ?auto_321618 ?auto_321621 ) ) ( not ( = ?auto_321618 ?auto_321622 ) ) ( not ( = ?auto_321618 ?auto_321623 ) ) ( not ( = ?auto_321618 ?auto_321624 ) ) ( not ( = ?auto_321618 ?auto_321625 ) ) ( not ( = ?auto_321618 ?auto_321626 ) ) ( not ( = ?auto_321619 ?auto_321620 ) ) ( not ( = ?auto_321619 ?auto_321621 ) ) ( not ( = ?auto_321619 ?auto_321622 ) ) ( not ( = ?auto_321619 ?auto_321623 ) ) ( not ( = ?auto_321619 ?auto_321624 ) ) ( not ( = ?auto_321619 ?auto_321625 ) ) ( not ( = ?auto_321619 ?auto_321626 ) ) ( not ( = ?auto_321620 ?auto_321621 ) ) ( not ( = ?auto_321620 ?auto_321622 ) ) ( not ( = ?auto_321620 ?auto_321623 ) ) ( not ( = ?auto_321620 ?auto_321624 ) ) ( not ( = ?auto_321620 ?auto_321625 ) ) ( not ( = ?auto_321620 ?auto_321626 ) ) ( not ( = ?auto_321621 ?auto_321622 ) ) ( not ( = ?auto_321621 ?auto_321623 ) ) ( not ( = ?auto_321621 ?auto_321624 ) ) ( not ( = ?auto_321621 ?auto_321625 ) ) ( not ( = ?auto_321621 ?auto_321626 ) ) ( not ( = ?auto_321622 ?auto_321623 ) ) ( not ( = ?auto_321622 ?auto_321624 ) ) ( not ( = ?auto_321622 ?auto_321625 ) ) ( not ( = ?auto_321622 ?auto_321626 ) ) ( not ( = ?auto_321623 ?auto_321624 ) ) ( not ( = ?auto_321623 ?auto_321625 ) ) ( not ( = ?auto_321623 ?auto_321626 ) ) ( not ( = ?auto_321624 ?auto_321625 ) ) ( not ( = ?auto_321624 ?auto_321626 ) ) ( not ( = ?auto_321625 ?auto_321626 ) ) ( ON ?auto_321625 ?auto_321626 ) ( ON ?auto_321624 ?auto_321625 ) ( ON ?auto_321623 ?auto_321624 ) ( ON ?auto_321622 ?auto_321623 ) ( ON ?auto_321621 ?auto_321622 ) ( CLEAR ?auto_321619 ) ( ON ?auto_321620 ?auto_321621 ) ( CLEAR ?auto_321620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_321613 ?auto_321614 ?auto_321615 ?auto_321616 ?auto_321617 ?auto_321618 ?auto_321619 ?auto_321620 )
      ( MAKE-14PILE ?auto_321613 ?auto_321614 ?auto_321615 ?auto_321616 ?auto_321617 ?auto_321618 ?auto_321619 ?auto_321620 ?auto_321621 ?auto_321622 ?auto_321623 ?auto_321624 ?auto_321625 ?auto_321626 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321641 - BLOCK
      ?auto_321642 - BLOCK
      ?auto_321643 - BLOCK
      ?auto_321644 - BLOCK
      ?auto_321645 - BLOCK
      ?auto_321646 - BLOCK
      ?auto_321647 - BLOCK
      ?auto_321648 - BLOCK
      ?auto_321649 - BLOCK
      ?auto_321650 - BLOCK
      ?auto_321651 - BLOCK
      ?auto_321652 - BLOCK
      ?auto_321653 - BLOCK
      ?auto_321654 - BLOCK
    )
    :vars
    (
      ?auto_321655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321654 ?auto_321655 ) ( ON-TABLE ?auto_321641 ) ( ON ?auto_321642 ?auto_321641 ) ( ON ?auto_321643 ?auto_321642 ) ( ON ?auto_321644 ?auto_321643 ) ( ON ?auto_321645 ?auto_321644 ) ( ON ?auto_321646 ?auto_321645 ) ( not ( = ?auto_321641 ?auto_321642 ) ) ( not ( = ?auto_321641 ?auto_321643 ) ) ( not ( = ?auto_321641 ?auto_321644 ) ) ( not ( = ?auto_321641 ?auto_321645 ) ) ( not ( = ?auto_321641 ?auto_321646 ) ) ( not ( = ?auto_321641 ?auto_321647 ) ) ( not ( = ?auto_321641 ?auto_321648 ) ) ( not ( = ?auto_321641 ?auto_321649 ) ) ( not ( = ?auto_321641 ?auto_321650 ) ) ( not ( = ?auto_321641 ?auto_321651 ) ) ( not ( = ?auto_321641 ?auto_321652 ) ) ( not ( = ?auto_321641 ?auto_321653 ) ) ( not ( = ?auto_321641 ?auto_321654 ) ) ( not ( = ?auto_321641 ?auto_321655 ) ) ( not ( = ?auto_321642 ?auto_321643 ) ) ( not ( = ?auto_321642 ?auto_321644 ) ) ( not ( = ?auto_321642 ?auto_321645 ) ) ( not ( = ?auto_321642 ?auto_321646 ) ) ( not ( = ?auto_321642 ?auto_321647 ) ) ( not ( = ?auto_321642 ?auto_321648 ) ) ( not ( = ?auto_321642 ?auto_321649 ) ) ( not ( = ?auto_321642 ?auto_321650 ) ) ( not ( = ?auto_321642 ?auto_321651 ) ) ( not ( = ?auto_321642 ?auto_321652 ) ) ( not ( = ?auto_321642 ?auto_321653 ) ) ( not ( = ?auto_321642 ?auto_321654 ) ) ( not ( = ?auto_321642 ?auto_321655 ) ) ( not ( = ?auto_321643 ?auto_321644 ) ) ( not ( = ?auto_321643 ?auto_321645 ) ) ( not ( = ?auto_321643 ?auto_321646 ) ) ( not ( = ?auto_321643 ?auto_321647 ) ) ( not ( = ?auto_321643 ?auto_321648 ) ) ( not ( = ?auto_321643 ?auto_321649 ) ) ( not ( = ?auto_321643 ?auto_321650 ) ) ( not ( = ?auto_321643 ?auto_321651 ) ) ( not ( = ?auto_321643 ?auto_321652 ) ) ( not ( = ?auto_321643 ?auto_321653 ) ) ( not ( = ?auto_321643 ?auto_321654 ) ) ( not ( = ?auto_321643 ?auto_321655 ) ) ( not ( = ?auto_321644 ?auto_321645 ) ) ( not ( = ?auto_321644 ?auto_321646 ) ) ( not ( = ?auto_321644 ?auto_321647 ) ) ( not ( = ?auto_321644 ?auto_321648 ) ) ( not ( = ?auto_321644 ?auto_321649 ) ) ( not ( = ?auto_321644 ?auto_321650 ) ) ( not ( = ?auto_321644 ?auto_321651 ) ) ( not ( = ?auto_321644 ?auto_321652 ) ) ( not ( = ?auto_321644 ?auto_321653 ) ) ( not ( = ?auto_321644 ?auto_321654 ) ) ( not ( = ?auto_321644 ?auto_321655 ) ) ( not ( = ?auto_321645 ?auto_321646 ) ) ( not ( = ?auto_321645 ?auto_321647 ) ) ( not ( = ?auto_321645 ?auto_321648 ) ) ( not ( = ?auto_321645 ?auto_321649 ) ) ( not ( = ?auto_321645 ?auto_321650 ) ) ( not ( = ?auto_321645 ?auto_321651 ) ) ( not ( = ?auto_321645 ?auto_321652 ) ) ( not ( = ?auto_321645 ?auto_321653 ) ) ( not ( = ?auto_321645 ?auto_321654 ) ) ( not ( = ?auto_321645 ?auto_321655 ) ) ( not ( = ?auto_321646 ?auto_321647 ) ) ( not ( = ?auto_321646 ?auto_321648 ) ) ( not ( = ?auto_321646 ?auto_321649 ) ) ( not ( = ?auto_321646 ?auto_321650 ) ) ( not ( = ?auto_321646 ?auto_321651 ) ) ( not ( = ?auto_321646 ?auto_321652 ) ) ( not ( = ?auto_321646 ?auto_321653 ) ) ( not ( = ?auto_321646 ?auto_321654 ) ) ( not ( = ?auto_321646 ?auto_321655 ) ) ( not ( = ?auto_321647 ?auto_321648 ) ) ( not ( = ?auto_321647 ?auto_321649 ) ) ( not ( = ?auto_321647 ?auto_321650 ) ) ( not ( = ?auto_321647 ?auto_321651 ) ) ( not ( = ?auto_321647 ?auto_321652 ) ) ( not ( = ?auto_321647 ?auto_321653 ) ) ( not ( = ?auto_321647 ?auto_321654 ) ) ( not ( = ?auto_321647 ?auto_321655 ) ) ( not ( = ?auto_321648 ?auto_321649 ) ) ( not ( = ?auto_321648 ?auto_321650 ) ) ( not ( = ?auto_321648 ?auto_321651 ) ) ( not ( = ?auto_321648 ?auto_321652 ) ) ( not ( = ?auto_321648 ?auto_321653 ) ) ( not ( = ?auto_321648 ?auto_321654 ) ) ( not ( = ?auto_321648 ?auto_321655 ) ) ( not ( = ?auto_321649 ?auto_321650 ) ) ( not ( = ?auto_321649 ?auto_321651 ) ) ( not ( = ?auto_321649 ?auto_321652 ) ) ( not ( = ?auto_321649 ?auto_321653 ) ) ( not ( = ?auto_321649 ?auto_321654 ) ) ( not ( = ?auto_321649 ?auto_321655 ) ) ( not ( = ?auto_321650 ?auto_321651 ) ) ( not ( = ?auto_321650 ?auto_321652 ) ) ( not ( = ?auto_321650 ?auto_321653 ) ) ( not ( = ?auto_321650 ?auto_321654 ) ) ( not ( = ?auto_321650 ?auto_321655 ) ) ( not ( = ?auto_321651 ?auto_321652 ) ) ( not ( = ?auto_321651 ?auto_321653 ) ) ( not ( = ?auto_321651 ?auto_321654 ) ) ( not ( = ?auto_321651 ?auto_321655 ) ) ( not ( = ?auto_321652 ?auto_321653 ) ) ( not ( = ?auto_321652 ?auto_321654 ) ) ( not ( = ?auto_321652 ?auto_321655 ) ) ( not ( = ?auto_321653 ?auto_321654 ) ) ( not ( = ?auto_321653 ?auto_321655 ) ) ( not ( = ?auto_321654 ?auto_321655 ) ) ( ON ?auto_321653 ?auto_321654 ) ( ON ?auto_321652 ?auto_321653 ) ( ON ?auto_321651 ?auto_321652 ) ( ON ?auto_321650 ?auto_321651 ) ( ON ?auto_321649 ?auto_321650 ) ( ON ?auto_321648 ?auto_321649 ) ( CLEAR ?auto_321646 ) ( ON ?auto_321647 ?auto_321648 ) ( CLEAR ?auto_321647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_321641 ?auto_321642 ?auto_321643 ?auto_321644 ?auto_321645 ?auto_321646 ?auto_321647 )
      ( MAKE-14PILE ?auto_321641 ?auto_321642 ?auto_321643 ?auto_321644 ?auto_321645 ?auto_321646 ?auto_321647 ?auto_321648 ?auto_321649 ?auto_321650 ?auto_321651 ?auto_321652 ?auto_321653 ?auto_321654 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321670 - BLOCK
      ?auto_321671 - BLOCK
      ?auto_321672 - BLOCK
      ?auto_321673 - BLOCK
      ?auto_321674 - BLOCK
      ?auto_321675 - BLOCK
      ?auto_321676 - BLOCK
      ?auto_321677 - BLOCK
      ?auto_321678 - BLOCK
      ?auto_321679 - BLOCK
      ?auto_321680 - BLOCK
      ?auto_321681 - BLOCK
      ?auto_321682 - BLOCK
      ?auto_321683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321683 ) ( ON-TABLE ?auto_321670 ) ( ON ?auto_321671 ?auto_321670 ) ( ON ?auto_321672 ?auto_321671 ) ( ON ?auto_321673 ?auto_321672 ) ( ON ?auto_321674 ?auto_321673 ) ( ON ?auto_321675 ?auto_321674 ) ( not ( = ?auto_321670 ?auto_321671 ) ) ( not ( = ?auto_321670 ?auto_321672 ) ) ( not ( = ?auto_321670 ?auto_321673 ) ) ( not ( = ?auto_321670 ?auto_321674 ) ) ( not ( = ?auto_321670 ?auto_321675 ) ) ( not ( = ?auto_321670 ?auto_321676 ) ) ( not ( = ?auto_321670 ?auto_321677 ) ) ( not ( = ?auto_321670 ?auto_321678 ) ) ( not ( = ?auto_321670 ?auto_321679 ) ) ( not ( = ?auto_321670 ?auto_321680 ) ) ( not ( = ?auto_321670 ?auto_321681 ) ) ( not ( = ?auto_321670 ?auto_321682 ) ) ( not ( = ?auto_321670 ?auto_321683 ) ) ( not ( = ?auto_321671 ?auto_321672 ) ) ( not ( = ?auto_321671 ?auto_321673 ) ) ( not ( = ?auto_321671 ?auto_321674 ) ) ( not ( = ?auto_321671 ?auto_321675 ) ) ( not ( = ?auto_321671 ?auto_321676 ) ) ( not ( = ?auto_321671 ?auto_321677 ) ) ( not ( = ?auto_321671 ?auto_321678 ) ) ( not ( = ?auto_321671 ?auto_321679 ) ) ( not ( = ?auto_321671 ?auto_321680 ) ) ( not ( = ?auto_321671 ?auto_321681 ) ) ( not ( = ?auto_321671 ?auto_321682 ) ) ( not ( = ?auto_321671 ?auto_321683 ) ) ( not ( = ?auto_321672 ?auto_321673 ) ) ( not ( = ?auto_321672 ?auto_321674 ) ) ( not ( = ?auto_321672 ?auto_321675 ) ) ( not ( = ?auto_321672 ?auto_321676 ) ) ( not ( = ?auto_321672 ?auto_321677 ) ) ( not ( = ?auto_321672 ?auto_321678 ) ) ( not ( = ?auto_321672 ?auto_321679 ) ) ( not ( = ?auto_321672 ?auto_321680 ) ) ( not ( = ?auto_321672 ?auto_321681 ) ) ( not ( = ?auto_321672 ?auto_321682 ) ) ( not ( = ?auto_321672 ?auto_321683 ) ) ( not ( = ?auto_321673 ?auto_321674 ) ) ( not ( = ?auto_321673 ?auto_321675 ) ) ( not ( = ?auto_321673 ?auto_321676 ) ) ( not ( = ?auto_321673 ?auto_321677 ) ) ( not ( = ?auto_321673 ?auto_321678 ) ) ( not ( = ?auto_321673 ?auto_321679 ) ) ( not ( = ?auto_321673 ?auto_321680 ) ) ( not ( = ?auto_321673 ?auto_321681 ) ) ( not ( = ?auto_321673 ?auto_321682 ) ) ( not ( = ?auto_321673 ?auto_321683 ) ) ( not ( = ?auto_321674 ?auto_321675 ) ) ( not ( = ?auto_321674 ?auto_321676 ) ) ( not ( = ?auto_321674 ?auto_321677 ) ) ( not ( = ?auto_321674 ?auto_321678 ) ) ( not ( = ?auto_321674 ?auto_321679 ) ) ( not ( = ?auto_321674 ?auto_321680 ) ) ( not ( = ?auto_321674 ?auto_321681 ) ) ( not ( = ?auto_321674 ?auto_321682 ) ) ( not ( = ?auto_321674 ?auto_321683 ) ) ( not ( = ?auto_321675 ?auto_321676 ) ) ( not ( = ?auto_321675 ?auto_321677 ) ) ( not ( = ?auto_321675 ?auto_321678 ) ) ( not ( = ?auto_321675 ?auto_321679 ) ) ( not ( = ?auto_321675 ?auto_321680 ) ) ( not ( = ?auto_321675 ?auto_321681 ) ) ( not ( = ?auto_321675 ?auto_321682 ) ) ( not ( = ?auto_321675 ?auto_321683 ) ) ( not ( = ?auto_321676 ?auto_321677 ) ) ( not ( = ?auto_321676 ?auto_321678 ) ) ( not ( = ?auto_321676 ?auto_321679 ) ) ( not ( = ?auto_321676 ?auto_321680 ) ) ( not ( = ?auto_321676 ?auto_321681 ) ) ( not ( = ?auto_321676 ?auto_321682 ) ) ( not ( = ?auto_321676 ?auto_321683 ) ) ( not ( = ?auto_321677 ?auto_321678 ) ) ( not ( = ?auto_321677 ?auto_321679 ) ) ( not ( = ?auto_321677 ?auto_321680 ) ) ( not ( = ?auto_321677 ?auto_321681 ) ) ( not ( = ?auto_321677 ?auto_321682 ) ) ( not ( = ?auto_321677 ?auto_321683 ) ) ( not ( = ?auto_321678 ?auto_321679 ) ) ( not ( = ?auto_321678 ?auto_321680 ) ) ( not ( = ?auto_321678 ?auto_321681 ) ) ( not ( = ?auto_321678 ?auto_321682 ) ) ( not ( = ?auto_321678 ?auto_321683 ) ) ( not ( = ?auto_321679 ?auto_321680 ) ) ( not ( = ?auto_321679 ?auto_321681 ) ) ( not ( = ?auto_321679 ?auto_321682 ) ) ( not ( = ?auto_321679 ?auto_321683 ) ) ( not ( = ?auto_321680 ?auto_321681 ) ) ( not ( = ?auto_321680 ?auto_321682 ) ) ( not ( = ?auto_321680 ?auto_321683 ) ) ( not ( = ?auto_321681 ?auto_321682 ) ) ( not ( = ?auto_321681 ?auto_321683 ) ) ( not ( = ?auto_321682 ?auto_321683 ) ) ( ON ?auto_321682 ?auto_321683 ) ( ON ?auto_321681 ?auto_321682 ) ( ON ?auto_321680 ?auto_321681 ) ( ON ?auto_321679 ?auto_321680 ) ( ON ?auto_321678 ?auto_321679 ) ( ON ?auto_321677 ?auto_321678 ) ( CLEAR ?auto_321675 ) ( ON ?auto_321676 ?auto_321677 ) ( CLEAR ?auto_321676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_321670 ?auto_321671 ?auto_321672 ?auto_321673 ?auto_321674 ?auto_321675 ?auto_321676 )
      ( MAKE-14PILE ?auto_321670 ?auto_321671 ?auto_321672 ?auto_321673 ?auto_321674 ?auto_321675 ?auto_321676 ?auto_321677 ?auto_321678 ?auto_321679 ?auto_321680 ?auto_321681 ?auto_321682 ?auto_321683 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321698 - BLOCK
      ?auto_321699 - BLOCK
      ?auto_321700 - BLOCK
      ?auto_321701 - BLOCK
      ?auto_321702 - BLOCK
      ?auto_321703 - BLOCK
      ?auto_321704 - BLOCK
      ?auto_321705 - BLOCK
      ?auto_321706 - BLOCK
      ?auto_321707 - BLOCK
      ?auto_321708 - BLOCK
      ?auto_321709 - BLOCK
      ?auto_321710 - BLOCK
      ?auto_321711 - BLOCK
    )
    :vars
    (
      ?auto_321712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321711 ?auto_321712 ) ( ON-TABLE ?auto_321698 ) ( ON ?auto_321699 ?auto_321698 ) ( ON ?auto_321700 ?auto_321699 ) ( ON ?auto_321701 ?auto_321700 ) ( ON ?auto_321702 ?auto_321701 ) ( not ( = ?auto_321698 ?auto_321699 ) ) ( not ( = ?auto_321698 ?auto_321700 ) ) ( not ( = ?auto_321698 ?auto_321701 ) ) ( not ( = ?auto_321698 ?auto_321702 ) ) ( not ( = ?auto_321698 ?auto_321703 ) ) ( not ( = ?auto_321698 ?auto_321704 ) ) ( not ( = ?auto_321698 ?auto_321705 ) ) ( not ( = ?auto_321698 ?auto_321706 ) ) ( not ( = ?auto_321698 ?auto_321707 ) ) ( not ( = ?auto_321698 ?auto_321708 ) ) ( not ( = ?auto_321698 ?auto_321709 ) ) ( not ( = ?auto_321698 ?auto_321710 ) ) ( not ( = ?auto_321698 ?auto_321711 ) ) ( not ( = ?auto_321698 ?auto_321712 ) ) ( not ( = ?auto_321699 ?auto_321700 ) ) ( not ( = ?auto_321699 ?auto_321701 ) ) ( not ( = ?auto_321699 ?auto_321702 ) ) ( not ( = ?auto_321699 ?auto_321703 ) ) ( not ( = ?auto_321699 ?auto_321704 ) ) ( not ( = ?auto_321699 ?auto_321705 ) ) ( not ( = ?auto_321699 ?auto_321706 ) ) ( not ( = ?auto_321699 ?auto_321707 ) ) ( not ( = ?auto_321699 ?auto_321708 ) ) ( not ( = ?auto_321699 ?auto_321709 ) ) ( not ( = ?auto_321699 ?auto_321710 ) ) ( not ( = ?auto_321699 ?auto_321711 ) ) ( not ( = ?auto_321699 ?auto_321712 ) ) ( not ( = ?auto_321700 ?auto_321701 ) ) ( not ( = ?auto_321700 ?auto_321702 ) ) ( not ( = ?auto_321700 ?auto_321703 ) ) ( not ( = ?auto_321700 ?auto_321704 ) ) ( not ( = ?auto_321700 ?auto_321705 ) ) ( not ( = ?auto_321700 ?auto_321706 ) ) ( not ( = ?auto_321700 ?auto_321707 ) ) ( not ( = ?auto_321700 ?auto_321708 ) ) ( not ( = ?auto_321700 ?auto_321709 ) ) ( not ( = ?auto_321700 ?auto_321710 ) ) ( not ( = ?auto_321700 ?auto_321711 ) ) ( not ( = ?auto_321700 ?auto_321712 ) ) ( not ( = ?auto_321701 ?auto_321702 ) ) ( not ( = ?auto_321701 ?auto_321703 ) ) ( not ( = ?auto_321701 ?auto_321704 ) ) ( not ( = ?auto_321701 ?auto_321705 ) ) ( not ( = ?auto_321701 ?auto_321706 ) ) ( not ( = ?auto_321701 ?auto_321707 ) ) ( not ( = ?auto_321701 ?auto_321708 ) ) ( not ( = ?auto_321701 ?auto_321709 ) ) ( not ( = ?auto_321701 ?auto_321710 ) ) ( not ( = ?auto_321701 ?auto_321711 ) ) ( not ( = ?auto_321701 ?auto_321712 ) ) ( not ( = ?auto_321702 ?auto_321703 ) ) ( not ( = ?auto_321702 ?auto_321704 ) ) ( not ( = ?auto_321702 ?auto_321705 ) ) ( not ( = ?auto_321702 ?auto_321706 ) ) ( not ( = ?auto_321702 ?auto_321707 ) ) ( not ( = ?auto_321702 ?auto_321708 ) ) ( not ( = ?auto_321702 ?auto_321709 ) ) ( not ( = ?auto_321702 ?auto_321710 ) ) ( not ( = ?auto_321702 ?auto_321711 ) ) ( not ( = ?auto_321702 ?auto_321712 ) ) ( not ( = ?auto_321703 ?auto_321704 ) ) ( not ( = ?auto_321703 ?auto_321705 ) ) ( not ( = ?auto_321703 ?auto_321706 ) ) ( not ( = ?auto_321703 ?auto_321707 ) ) ( not ( = ?auto_321703 ?auto_321708 ) ) ( not ( = ?auto_321703 ?auto_321709 ) ) ( not ( = ?auto_321703 ?auto_321710 ) ) ( not ( = ?auto_321703 ?auto_321711 ) ) ( not ( = ?auto_321703 ?auto_321712 ) ) ( not ( = ?auto_321704 ?auto_321705 ) ) ( not ( = ?auto_321704 ?auto_321706 ) ) ( not ( = ?auto_321704 ?auto_321707 ) ) ( not ( = ?auto_321704 ?auto_321708 ) ) ( not ( = ?auto_321704 ?auto_321709 ) ) ( not ( = ?auto_321704 ?auto_321710 ) ) ( not ( = ?auto_321704 ?auto_321711 ) ) ( not ( = ?auto_321704 ?auto_321712 ) ) ( not ( = ?auto_321705 ?auto_321706 ) ) ( not ( = ?auto_321705 ?auto_321707 ) ) ( not ( = ?auto_321705 ?auto_321708 ) ) ( not ( = ?auto_321705 ?auto_321709 ) ) ( not ( = ?auto_321705 ?auto_321710 ) ) ( not ( = ?auto_321705 ?auto_321711 ) ) ( not ( = ?auto_321705 ?auto_321712 ) ) ( not ( = ?auto_321706 ?auto_321707 ) ) ( not ( = ?auto_321706 ?auto_321708 ) ) ( not ( = ?auto_321706 ?auto_321709 ) ) ( not ( = ?auto_321706 ?auto_321710 ) ) ( not ( = ?auto_321706 ?auto_321711 ) ) ( not ( = ?auto_321706 ?auto_321712 ) ) ( not ( = ?auto_321707 ?auto_321708 ) ) ( not ( = ?auto_321707 ?auto_321709 ) ) ( not ( = ?auto_321707 ?auto_321710 ) ) ( not ( = ?auto_321707 ?auto_321711 ) ) ( not ( = ?auto_321707 ?auto_321712 ) ) ( not ( = ?auto_321708 ?auto_321709 ) ) ( not ( = ?auto_321708 ?auto_321710 ) ) ( not ( = ?auto_321708 ?auto_321711 ) ) ( not ( = ?auto_321708 ?auto_321712 ) ) ( not ( = ?auto_321709 ?auto_321710 ) ) ( not ( = ?auto_321709 ?auto_321711 ) ) ( not ( = ?auto_321709 ?auto_321712 ) ) ( not ( = ?auto_321710 ?auto_321711 ) ) ( not ( = ?auto_321710 ?auto_321712 ) ) ( not ( = ?auto_321711 ?auto_321712 ) ) ( ON ?auto_321710 ?auto_321711 ) ( ON ?auto_321709 ?auto_321710 ) ( ON ?auto_321708 ?auto_321709 ) ( ON ?auto_321707 ?auto_321708 ) ( ON ?auto_321706 ?auto_321707 ) ( ON ?auto_321705 ?auto_321706 ) ( ON ?auto_321704 ?auto_321705 ) ( CLEAR ?auto_321702 ) ( ON ?auto_321703 ?auto_321704 ) ( CLEAR ?auto_321703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_321698 ?auto_321699 ?auto_321700 ?auto_321701 ?auto_321702 ?auto_321703 )
      ( MAKE-14PILE ?auto_321698 ?auto_321699 ?auto_321700 ?auto_321701 ?auto_321702 ?auto_321703 ?auto_321704 ?auto_321705 ?auto_321706 ?auto_321707 ?auto_321708 ?auto_321709 ?auto_321710 ?auto_321711 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321727 - BLOCK
      ?auto_321728 - BLOCK
      ?auto_321729 - BLOCK
      ?auto_321730 - BLOCK
      ?auto_321731 - BLOCK
      ?auto_321732 - BLOCK
      ?auto_321733 - BLOCK
      ?auto_321734 - BLOCK
      ?auto_321735 - BLOCK
      ?auto_321736 - BLOCK
      ?auto_321737 - BLOCK
      ?auto_321738 - BLOCK
      ?auto_321739 - BLOCK
      ?auto_321740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321740 ) ( ON-TABLE ?auto_321727 ) ( ON ?auto_321728 ?auto_321727 ) ( ON ?auto_321729 ?auto_321728 ) ( ON ?auto_321730 ?auto_321729 ) ( ON ?auto_321731 ?auto_321730 ) ( not ( = ?auto_321727 ?auto_321728 ) ) ( not ( = ?auto_321727 ?auto_321729 ) ) ( not ( = ?auto_321727 ?auto_321730 ) ) ( not ( = ?auto_321727 ?auto_321731 ) ) ( not ( = ?auto_321727 ?auto_321732 ) ) ( not ( = ?auto_321727 ?auto_321733 ) ) ( not ( = ?auto_321727 ?auto_321734 ) ) ( not ( = ?auto_321727 ?auto_321735 ) ) ( not ( = ?auto_321727 ?auto_321736 ) ) ( not ( = ?auto_321727 ?auto_321737 ) ) ( not ( = ?auto_321727 ?auto_321738 ) ) ( not ( = ?auto_321727 ?auto_321739 ) ) ( not ( = ?auto_321727 ?auto_321740 ) ) ( not ( = ?auto_321728 ?auto_321729 ) ) ( not ( = ?auto_321728 ?auto_321730 ) ) ( not ( = ?auto_321728 ?auto_321731 ) ) ( not ( = ?auto_321728 ?auto_321732 ) ) ( not ( = ?auto_321728 ?auto_321733 ) ) ( not ( = ?auto_321728 ?auto_321734 ) ) ( not ( = ?auto_321728 ?auto_321735 ) ) ( not ( = ?auto_321728 ?auto_321736 ) ) ( not ( = ?auto_321728 ?auto_321737 ) ) ( not ( = ?auto_321728 ?auto_321738 ) ) ( not ( = ?auto_321728 ?auto_321739 ) ) ( not ( = ?auto_321728 ?auto_321740 ) ) ( not ( = ?auto_321729 ?auto_321730 ) ) ( not ( = ?auto_321729 ?auto_321731 ) ) ( not ( = ?auto_321729 ?auto_321732 ) ) ( not ( = ?auto_321729 ?auto_321733 ) ) ( not ( = ?auto_321729 ?auto_321734 ) ) ( not ( = ?auto_321729 ?auto_321735 ) ) ( not ( = ?auto_321729 ?auto_321736 ) ) ( not ( = ?auto_321729 ?auto_321737 ) ) ( not ( = ?auto_321729 ?auto_321738 ) ) ( not ( = ?auto_321729 ?auto_321739 ) ) ( not ( = ?auto_321729 ?auto_321740 ) ) ( not ( = ?auto_321730 ?auto_321731 ) ) ( not ( = ?auto_321730 ?auto_321732 ) ) ( not ( = ?auto_321730 ?auto_321733 ) ) ( not ( = ?auto_321730 ?auto_321734 ) ) ( not ( = ?auto_321730 ?auto_321735 ) ) ( not ( = ?auto_321730 ?auto_321736 ) ) ( not ( = ?auto_321730 ?auto_321737 ) ) ( not ( = ?auto_321730 ?auto_321738 ) ) ( not ( = ?auto_321730 ?auto_321739 ) ) ( not ( = ?auto_321730 ?auto_321740 ) ) ( not ( = ?auto_321731 ?auto_321732 ) ) ( not ( = ?auto_321731 ?auto_321733 ) ) ( not ( = ?auto_321731 ?auto_321734 ) ) ( not ( = ?auto_321731 ?auto_321735 ) ) ( not ( = ?auto_321731 ?auto_321736 ) ) ( not ( = ?auto_321731 ?auto_321737 ) ) ( not ( = ?auto_321731 ?auto_321738 ) ) ( not ( = ?auto_321731 ?auto_321739 ) ) ( not ( = ?auto_321731 ?auto_321740 ) ) ( not ( = ?auto_321732 ?auto_321733 ) ) ( not ( = ?auto_321732 ?auto_321734 ) ) ( not ( = ?auto_321732 ?auto_321735 ) ) ( not ( = ?auto_321732 ?auto_321736 ) ) ( not ( = ?auto_321732 ?auto_321737 ) ) ( not ( = ?auto_321732 ?auto_321738 ) ) ( not ( = ?auto_321732 ?auto_321739 ) ) ( not ( = ?auto_321732 ?auto_321740 ) ) ( not ( = ?auto_321733 ?auto_321734 ) ) ( not ( = ?auto_321733 ?auto_321735 ) ) ( not ( = ?auto_321733 ?auto_321736 ) ) ( not ( = ?auto_321733 ?auto_321737 ) ) ( not ( = ?auto_321733 ?auto_321738 ) ) ( not ( = ?auto_321733 ?auto_321739 ) ) ( not ( = ?auto_321733 ?auto_321740 ) ) ( not ( = ?auto_321734 ?auto_321735 ) ) ( not ( = ?auto_321734 ?auto_321736 ) ) ( not ( = ?auto_321734 ?auto_321737 ) ) ( not ( = ?auto_321734 ?auto_321738 ) ) ( not ( = ?auto_321734 ?auto_321739 ) ) ( not ( = ?auto_321734 ?auto_321740 ) ) ( not ( = ?auto_321735 ?auto_321736 ) ) ( not ( = ?auto_321735 ?auto_321737 ) ) ( not ( = ?auto_321735 ?auto_321738 ) ) ( not ( = ?auto_321735 ?auto_321739 ) ) ( not ( = ?auto_321735 ?auto_321740 ) ) ( not ( = ?auto_321736 ?auto_321737 ) ) ( not ( = ?auto_321736 ?auto_321738 ) ) ( not ( = ?auto_321736 ?auto_321739 ) ) ( not ( = ?auto_321736 ?auto_321740 ) ) ( not ( = ?auto_321737 ?auto_321738 ) ) ( not ( = ?auto_321737 ?auto_321739 ) ) ( not ( = ?auto_321737 ?auto_321740 ) ) ( not ( = ?auto_321738 ?auto_321739 ) ) ( not ( = ?auto_321738 ?auto_321740 ) ) ( not ( = ?auto_321739 ?auto_321740 ) ) ( ON ?auto_321739 ?auto_321740 ) ( ON ?auto_321738 ?auto_321739 ) ( ON ?auto_321737 ?auto_321738 ) ( ON ?auto_321736 ?auto_321737 ) ( ON ?auto_321735 ?auto_321736 ) ( ON ?auto_321734 ?auto_321735 ) ( ON ?auto_321733 ?auto_321734 ) ( CLEAR ?auto_321731 ) ( ON ?auto_321732 ?auto_321733 ) ( CLEAR ?auto_321732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_321727 ?auto_321728 ?auto_321729 ?auto_321730 ?auto_321731 ?auto_321732 )
      ( MAKE-14PILE ?auto_321727 ?auto_321728 ?auto_321729 ?auto_321730 ?auto_321731 ?auto_321732 ?auto_321733 ?auto_321734 ?auto_321735 ?auto_321736 ?auto_321737 ?auto_321738 ?auto_321739 ?auto_321740 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321755 - BLOCK
      ?auto_321756 - BLOCK
      ?auto_321757 - BLOCK
      ?auto_321758 - BLOCK
      ?auto_321759 - BLOCK
      ?auto_321760 - BLOCK
      ?auto_321761 - BLOCK
      ?auto_321762 - BLOCK
      ?auto_321763 - BLOCK
      ?auto_321764 - BLOCK
      ?auto_321765 - BLOCK
      ?auto_321766 - BLOCK
      ?auto_321767 - BLOCK
      ?auto_321768 - BLOCK
    )
    :vars
    (
      ?auto_321769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321768 ?auto_321769 ) ( ON-TABLE ?auto_321755 ) ( ON ?auto_321756 ?auto_321755 ) ( ON ?auto_321757 ?auto_321756 ) ( ON ?auto_321758 ?auto_321757 ) ( not ( = ?auto_321755 ?auto_321756 ) ) ( not ( = ?auto_321755 ?auto_321757 ) ) ( not ( = ?auto_321755 ?auto_321758 ) ) ( not ( = ?auto_321755 ?auto_321759 ) ) ( not ( = ?auto_321755 ?auto_321760 ) ) ( not ( = ?auto_321755 ?auto_321761 ) ) ( not ( = ?auto_321755 ?auto_321762 ) ) ( not ( = ?auto_321755 ?auto_321763 ) ) ( not ( = ?auto_321755 ?auto_321764 ) ) ( not ( = ?auto_321755 ?auto_321765 ) ) ( not ( = ?auto_321755 ?auto_321766 ) ) ( not ( = ?auto_321755 ?auto_321767 ) ) ( not ( = ?auto_321755 ?auto_321768 ) ) ( not ( = ?auto_321755 ?auto_321769 ) ) ( not ( = ?auto_321756 ?auto_321757 ) ) ( not ( = ?auto_321756 ?auto_321758 ) ) ( not ( = ?auto_321756 ?auto_321759 ) ) ( not ( = ?auto_321756 ?auto_321760 ) ) ( not ( = ?auto_321756 ?auto_321761 ) ) ( not ( = ?auto_321756 ?auto_321762 ) ) ( not ( = ?auto_321756 ?auto_321763 ) ) ( not ( = ?auto_321756 ?auto_321764 ) ) ( not ( = ?auto_321756 ?auto_321765 ) ) ( not ( = ?auto_321756 ?auto_321766 ) ) ( not ( = ?auto_321756 ?auto_321767 ) ) ( not ( = ?auto_321756 ?auto_321768 ) ) ( not ( = ?auto_321756 ?auto_321769 ) ) ( not ( = ?auto_321757 ?auto_321758 ) ) ( not ( = ?auto_321757 ?auto_321759 ) ) ( not ( = ?auto_321757 ?auto_321760 ) ) ( not ( = ?auto_321757 ?auto_321761 ) ) ( not ( = ?auto_321757 ?auto_321762 ) ) ( not ( = ?auto_321757 ?auto_321763 ) ) ( not ( = ?auto_321757 ?auto_321764 ) ) ( not ( = ?auto_321757 ?auto_321765 ) ) ( not ( = ?auto_321757 ?auto_321766 ) ) ( not ( = ?auto_321757 ?auto_321767 ) ) ( not ( = ?auto_321757 ?auto_321768 ) ) ( not ( = ?auto_321757 ?auto_321769 ) ) ( not ( = ?auto_321758 ?auto_321759 ) ) ( not ( = ?auto_321758 ?auto_321760 ) ) ( not ( = ?auto_321758 ?auto_321761 ) ) ( not ( = ?auto_321758 ?auto_321762 ) ) ( not ( = ?auto_321758 ?auto_321763 ) ) ( not ( = ?auto_321758 ?auto_321764 ) ) ( not ( = ?auto_321758 ?auto_321765 ) ) ( not ( = ?auto_321758 ?auto_321766 ) ) ( not ( = ?auto_321758 ?auto_321767 ) ) ( not ( = ?auto_321758 ?auto_321768 ) ) ( not ( = ?auto_321758 ?auto_321769 ) ) ( not ( = ?auto_321759 ?auto_321760 ) ) ( not ( = ?auto_321759 ?auto_321761 ) ) ( not ( = ?auto_321759 ?auto_321762 ) ) ( not ( = ?auto_321759 ?auto_321763 ) ) ( not ( = ?auto_321759 ?auto_321764 ) ) ( not ( = ?auto_321759 ?auto_321765 ) ) ( not ( = ?auto_321759 ?auto_321766 ) ) ( not ( = ?auto_321759 ?auto_321767 ) ) ( not ( = ?auto_321759 ?auto_321768 ) ) ( not ( = ?auto_321759 ?auto_321769 ) ) ( not ( = ?auto_321760 ?auto_321761 ) ) ( not ( = ?auto_321760 ?auto_321762 ) ) ( not ( = ?auto_321760 ?auto_321763 ) ) ( not ( = ?auto_321760 ?auto_321764 ) ) ( not ( = ?auto_321760 ?auto_321765 ) ) ( not ( = ?auto_321760 ?auto_321766 ) ) ( not ( = ?auto_321760 ?auto_321767 ) ) ( not ( = ?auto_321760 ?auto_321768 ) ) ( not ( = ?auto_321760 ?auto_321769 ) ) ( not ( = ?auto_321761 ?auto_321762 ) ) ( not ( = ?auto_321761 ?auto_321763 ) ) ( not ( = ?auto_321761 ?auto_321764 ) ) ( not ( = ?auto_321761 ?auto_321765 ) ) ( not ( = ?auto_321761 ?auto_321766 ) ) ( not ( = ?auto_321761 ?auto_321767 ) ) ( not ( = ?auto_321761 ?auto_321768 ) ) ( not ( = ?auto_321761 ?auto_321769 ) ) ( not ( = ?auto_321762 ?auto_321763 ) ) ( not ( = ?auto_321762 ?auto_321764 ) ) ( not ( = ?auto_321762 ?auto_321765 ) ) ( not ( = ?auto_321762 ?auto_321766 ) ) ( not ( = ?auto_321762 ?auto_321767 ) ) ( not ( = ?auto_321762 ?auto_321768 ) ) ( not ( = ?auto_321762 ?auto_321769 ) ) ( not ( = ?auto_321763 ?auto_321764 ) ) ( not ( = ?auto_321763 ?auto_321765 ) ) ( not ( = ?auto_321763 ?auto_321766 ) ) ( not ( = ?auto_321763 ?auto_321767 ) ) ( not ( = ?auto_321763 ?auto_321768 ) ) ( not ( = ?auto_321763 ?auto_321769 ) ) ( not ( = ?auto_321764 ?auto_321765 ) ) ( not ( = ?auto_321764 ?auto_321766 ) ) ( not ( = ?auto_321764 ?auto_321767 ) ) ( not ( = ?auto_321764 ?auto_321768 ) ) ( not ( = ?auto_321764 ?auto_321769 ) ) ( not ( = ?auto_321765 ?auto_321766 ) ) ( not ( = ?auto_321765 ?auto_321767 ) ) ( not ( = ?auto_321765 ?auto_321768 ) ) ( not ( = ?auto_321765 ?auto_321769 ) ) ( not ( = ?auto_321766 ?auto_321767 ) ) ( not ( = ?auto_321766 ?auto_321768 ) ) ( not ( = ?auto_321766 ?auto_321769 ) ) ( not ( = ?auto_321767 ?auto_321768 ) ) ( not ( = ?auto_321767 ?auto_321769 ) ) ( not ( = ?auto_321768 ?auto_321769 ) ) ( ON ?auto_321767 ?auto_321768 ) ( ON ?auto_321766 ?auto_321767 ) ( ON ?auto_321765 ?auto_321766 ) ( ON ?auto_321764 ?auto_321765 ) ( ON ?auto_321763 ?auto_321764 ) ( ON ?auto_321762 ?auto_321763 ) ( ON ?auto_321761 ?auto_321762 ) ( ON ?auto_321760 ?auto_321761 ) ( CLEAR ?auto_321758 ) ( ON ?auto_321759 ?auto_321760 ) ( CLEAR ?auto_321759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_321755 ?auto_321756 ?auto_321757 ?auto_321758 ?auto_321759 )
      ( MAKE-14PILE ?auto_321755 ?auto_321756 ?auto_321757 ?auto_321758 ?auto_321759 ?auto_321760 ?auto_321761 ?auto_321762 ?auto_321763 ?auto_321764 ?auto_321765 ?auto_321766 ?auto_321767 ?auto_321768 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321784 - BLOCK
      ?auto_321785 - BLOCK
      ?auto_321786 - BLOCK
      ?auto_321787 - BLOCK
      ?auto_321788 - BLOCK
      ?auto_321789 - BLOCK
      ?auto_321790 - BLOCK
      ?auto_321791 - BLOCK
      ?auto_321792 - BLOCK
      ?auto_321793 - BLOCK
      ?auto_321794 - BLOCK
      ?auto_321795 - BLOCK
      ?auto_321796 - BLOCK
      ?auto_321797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321797 ) ( ON-TABLE ?auto_321784 ) ( ON ?auto_321785 ?auto_321784 ) ( ON ?auto_321786 ?auto_321785 ) ( ON ?auto_321787 ?auto_321786 ) ( not ( = ?auto_321784 ?auto_321785 ) ) ( not ( = ?auto_321784 ?auto_321786 ) ) ( not ( = ?auto_321784 ?auto_321787 ) ) ( not ( = ?auto_321784 ?auto_321788 ) ) ( not ( = ?auto_321784 ?auto_321789 ) ) ( not ( = ?auto_321784 ?auto_321790 ) ) ( not ( = ?auto_321784 ?auto_321791 ) ) ( not ( = ?auto_321784 ?auto_321792 ) ) ( not ( = ?auto_321784 ?auto_321793 ) ) ( not ( = ?auto_321784 ?auto_321794 ) ) ( not ( = ?auto_321784 ?auto_321795 ) ) ( not ( = ?auto_321784 ?auto_321796 ) ) ( not ( = ?auto_321784 ?auto_321797 ) ) ( not ( = ?auto_321785 ?auto_321786 ) ) ( not ( = ?auto_321785 ?auto_321787 ) ) ( not ( = ?auto_321785 ?auto_321788 ) ) ( not ( = ?auto_321785 ?auto_321789 ) ) ( not ( = ?auto_321785 ?auto_321790 ) ) ( not ( = ?auto_321785 ?auto_321791 ) ) ( not ( = ?auto_321785 ?auto_321792 ) ) ( not ( = ?auto_321785 ?auto_321793 ) ) ( not ( = ?auto_321785 ?auto_321794 ) ) ( not ( = ?auto_321785 ?auto_321795 ) ) ( not ( = ?auto_321785 ?auto_321796 ) ) ( not ( = ?auto_321785 ?auto_321797 ) ) ( not ( = ?auto_321786 ?auto_321787 ) ) ( not ( = ?auto_321786 ?auto_321788 ) ) ( not ( = ?auto_321786 ?auto_321789 ) ) ( not ( = ?auto_321786 ?auto_321790 ) ) ( not ( = ?auto_321786 ?auto_321791 ) ) ( not ( = ?auto_321786 ?auto_321792 ) ) ( not ( = ?auto_321786 ?auto_321793 ) ) ( not ( = ?auto_321786 ?auto_321794 ) ) ( not ( = ?auto_321786 ?auto_321795 ) ) ( not ( = ?auto_321786 ?auto_321796 ) ) ( not ( = ?auto_321786 ?auto_321797 ) ) ( not ( = ?auto_321787 ?auto_321788 ) ) ( not ( = ?auto_321787 ?auto_321789 ) ) ( not ( = ?auto_321787 ?auto_321790 ) ) ( not ( = ?auto_321787 ?auto_321791 ) ) ( not ( = ?auto_321787 ?auto_321792 ) ) ( not ( = ?auto_321787 ?auto_321793 ) ) ( not ( = ?auto_321787 ?auto_321794 ) ) ( not ( = ?auto_321787 ?auto_321795 ) ) ( not ( = ?auto_321787 ?auto_321796 ) ) ( not ( = ?auto_321787 ?auto_321797 ) ) ( not ( = ?auto_321788 ?auto_321789 ) ) ( not ( = ?auto_321788 ?auto_321790 ) ) ( not ( = ?auto_321788 ?auto_321791 ) ) ( not ( = ?auto_321788 ?auto_321792 ) ) ( not ( = ?auto_321788 ?auto_321793 ) ) ( not ( = ?auto_321788 ?auto_321794 ) ) ( not ( = ?auto_321788 ?auto_321795 ) ) ( not ( = ?auto_321788 ?auto_321796 ) ) ( not ( = ?auto_321788 ?auto_321797 ) ) ( not ( = ?auto_321789 ?auto_321790 ) ) ( not ( = ?auto_321789 ?auto_321791 ) ) ( not ( = ?auto_321789 ?auto_321792 ) ) ( not ( = ?auto_321789 ?auto_321793 ) ) ( not ( = ?auto_321789 ?auto_321794 ) ) ( not ( = ?auto_321789 ?auto_321795 ) ) ( not ( = ?auto_321789 ?auto_321796 ) ) ( not ( = ?auto_321789 ?auto_321797 ) ) ( not ( = ?auto_321790 ?auto_321791 ) ) ( not ( = ?auto_321790 ?auto_321792 ) ) ( not ( = ?auto_321790 ?auto_321793 ) ) ( not ( = ?auto_321790 ?auto_321794 ) ) ( not ( = ?auto_321790 ?auto_321795 ) ) ( not ( = ?auto_321790 ?auto_321796 ) ) ( not ( = ?auto_321790 ?auto_321797 ) ) ( not ( = ?auto_321791 ?auto_321792 ) ) ( not ( = ?auto_321791 ?auto_321793 ) ) ( not ( = ?auto_321791 ?auto_321794 ) ) ( not ( = ?auto_321791 ?auto_321795 ) ) ( not ( = ?auto_321791 ?auto_321796 ) ) ( not ( = ?auto_321791 ?auto_321797 ) ) ( not ( = ?auto_321792 ?auto_321793 ) ) ( not ( = ?auto_321792 ?auto_321794 ) ) ( not ( = ?auto_321792 ?auto_321795 ) ) ( not ( = ?auto_321792 ?auto_321796 ) ) ( not ( = ?auto_321792 ?auto_321797 ) ) ( not ( = ?auto_321793 ?auto_321794 ) ) ( not ( = ?auto_321793 ?auto_321795 ) ) ( not ( = ?auto_321793 ?auto_321796 ) ) ( not ( = ?auto_321793 ?auto_321797 ) ) ( not ( = ?auto_321794 ?auto_321795 ) ) ( not ( = ?auto_321794 ?auto_321796 ) ) ( not ( = ?auto_321794 ?auto_321797 ) ) ( not ( = ?auto_321795 ?auto_321796 ) ) ( not ( = ?auto_321795 ?auto_321797 ) ) ( not ( = ?auto_321796 ?auto_321797 ) ) ( ON ?auto_321796 ?auto_321797 ) ( ON ?auto_321795 ?auto_321796 ) ( ON ?auto_321794 ?auto_321795 ) ( ON ?auto_321793 ?auto_321794 ) ( ON ?auto_321792 ?auto_321793 ) ( ON ?auto_321791 ?auto_321792 ) ( ON ?auto_321790 ?auto_321791 ) ( ON ?auto_321789 ?auto_321790 ) ( CLEAR ?auto_321787 ) ( ON ?auto_321788 ?auto_321789 ) ( CLEAR ?auto_321788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_321784 ?auto_321785 ?auto_321786 ?auto_321787 ?auto_321788 )
      ( MAKE-14PILE ?auto_321784 ?auto_321785 ?auto_321786 ?auto_321787 ?auto_321788 ?auto_321789 ?auto_321790 ?auto_321791 ?auto_321792 ?auto_321793 ?auto_321794 ?auto_321795 ?auto_321796 ?auto_321797 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321812 - BLOCK
      ?auto_321813 - BLOCK
      ?auto_321814 - BLOCK
      ?auto_321815 - BLOCK
      ?auto_321816 - BLOCK
      ?auto_321817 - BLOCK
      ?auto_321818 - BLOCK
      ?auto_321819 - BLOCK
      ?auto_321820 - BLOCK
      ?auto_321821 - BLOCK
      ?auto_321822 - BLOCK
      ?auto_321823 - BLOCK
      ?auto_321824 - BLOCK
      ?auto_321825 - BLOCK
    )
    :vars
    (
      ?auto_321826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321825 ?auto_321826 ) ( ON-TABLE ?auto_321812 ) ( ON ?auto_321813 ?auto_321812 ) ( ON ?auto_321814 ?auto_321813 ) ( not ( = ?auto_321812 ?auto_321813 ) ) ( not ( = ?auto_321812 ?auto_321814 ) ) ( not ( = ?auto_321812 ?auto_321815 ) ) ( not ( = ?auto_321812 ?auto_321816 ) ) ( not ( = ?auto_321812 ?auto_321817 ) ) ( not ( = ?auto_321812 ?auto_321818 ) ) ( not ( = ?auto_321812 ?auto_321819 ) ) ( not ( = ?auto_321812 ?auto_321820 ) ) ( not ( = ?auto_321812 ?auto_321821 ) ) ( not ( = ?auto_321812 ?auto_321822 ) ) ( not ( = ?auto_321812 ?auto_321823 ) ) ( not ( = ?auto_321812 ?auto_321824 ) ) ( not ( = ?auto_321812 ?auto_321825 ) ) ( not ( = ?auto_321812 ?auto_321826 ) ) ( not ( = ?auto_321813 ?auto_321814 ) ) ( not ( = ?auto_321813 ?auto_321815 ) ) ( not ( = ?auto_321813 ?auto_321816 ) ) ( not ( = ?auto_321813 ?auto_321817 ) ) ( not ( = ?auto_321813 ?auto_321818 ) ) ( not ( = ?auto_321813 ?auto_321819 ) ) ( not ( = ?auto_321813 ?auto_321820 ) ) ( not ( = ?auto_321813 ?auto_321821 ) ) ( not ( = ?auto_321813 ?auto_321822 ) ) ( not ( = ?auto_321813 ?auto_321823 ) ) ( not ( = ?auto_321813 ?auto_321824 ) ) ( not ( = ?auto_321813 ?auto_321825 ) ) ( not ( = ?auto_321813 ?auto_321826 ) ) ( not ( = ?auto_321814 ?auto_321815 ) ) ( not ( = ?auto_321814 ?auto_321816 ) ) ( not ( = ?auto_321814 ?auto_321817 ) ) ( not ( = ?auto_321814 ?auto_321818 ) ) ( not ( = ?auto_321814 ?auto_321819 ) ) ( not ( = ?auto_321814 ?auto_321820 ) ) ( not ( = ?auto_321814 ?auto_321821 ) ) ( not ( = ?auto_321814 ?auto_321822 ) ) ( not ( = ?auto_321814 ?auto_321823 ) ) ( not ( = ?auto_321814 ?auto_321824 ) ) ( not ( = ?auto_321814 ?auto_321825 ) ) ( not ( = ?auto_321814 ?auto_321826 ) ) ( not ( = ?auto_321815 ?auto_321816 ) ) ( not ( = ?auto_321815 ?auto_321817 ) ) ( not ( = ?auto_321815 ?auto_321818 ) ) ( not ( = ?auto_321815 ?auto_321819 ) ) ( not ( = ?auto_321815 ?auto_321820 ) ) ( not ( = ?auto_321815 ?auto_321821 ) ) ( not ( = ?auto_321815 ?auto_321822 ) ) ( not ( = ?auto_321815 ?auto_321823 ) ) ( not ( = ?auto_321815 ?auto_321824 ) ) ( not ( = ?auto_321815 ?auto_321825 ) ) ( not ( = ?auto_321815 ?auto_321826 ) ) ( not ( = ?auto_321816 ?auto_321817 ) ) ( not ( = ?auto_321816 ?auto_321818 ) ) ( not ( = ?auto_321816 ?auto_321819 ) ) ( not ( = ?auto_321816 ?auto_321820 ) ) ( not ( = ?auto_321816 ?auto_321821 ) ) ( not ( = ?auto_321816 ?auto_321822 ) ) ( not ( = ?auto_321816 ?auto_321823 ) ) ( not ( = ?auto_321816 ?auto_321824 ) ) ( not ( = ?auto_321816 ?auto_321825 ) ) ( not ( = ?auto_321816 ?auto_321826 ) ) ( not ( = ?auto_321817 ?auto_321818 ) ) ( not ( = ?auto_321817 ?auto_321819 ) ) ( not ( = ?auto_321817 ?auto_321820 ) ) ( not ( = ?auto_321817 ?auto_321821 ) ) ( not ( = ?auto_321817 ?auto_321822 ) ) ( not ( = ?auto_321817 ?auto_321823 ) ) ( not ( = ?auto_321817 ?auto_321824 ) ) ( not ( = ?auto_321817 ?auto_321825 ) ) ( not ( = ?auto_321817 ?auto_321826 ) ) ( not ( = ?auto_321818 ?auto_321819 ) ) ( not ( = ?auto_321818 ?auto_321820 ) ) ( not ( = ?auto_321818 ?auto_321821 ) ) ( not ( = ?auto_321818 ?auto_321822 ) ) ( not ( = ?auto_321818 ?auto_321823 ) ) ( not ( = ?auto_321818 ?auto_321824 ) ) ( not ( = ?auto_321818 ?auto_321825 ) ) ( not ( = ?auto_321818 ?auto_321826 ) ) ( not ( = ?auto_321819 ?auto_321820 ) ) ( not ( = ?auto_321819 ?auto_321821 ) ) ( not ( = ?auto_321819 ?auto_321822 ) ) ( not ( = ?auto_321819 ?auto_321823 ) ) ( not ( = ?auto_321819 ?auto_321824 ) ) ( not ( = ?auto_321819 ?auto_321825 ) ) ( not ( = ?auto_321819 ?auto_321826 ) ) ( not ( = ?auto_321820 ?auto_321821 ) ) ( not ( = ?auto_321820 ?auto_321822 ) ) ( not ( = ?auto_321820 ?auto_321823 ) ) ( not ( = ?auto_321820 ?auto_321824 ) ) ( not ( = ?auto_321820 ?auto_321825 ) ) ( not ( = ?auto_321820 ?auto_321826 ) ) ( not ( = ?auto_321821 ?auto_321822 ) ) ( not ( = ?auto_321821 ?auto_321823 ) ) ( not ( = ?auto_321821 ?auto_321824 ) ) ( not ( = ?auto_321821 ?auto_321825 ) ) ( not ( = ?auto_321821 ?auto_321826 ) ) ( not ( = ?auto_321822 ?auto_321823 ) ) ( not ( = ?auto_321822 ?auto_321824 ) ) ( not ( = ?auto_321822 ?auto_321825 ) ) ( not ( = ?auto_321822 ?auto_321826 ) ) ( not ( = ?auto_321823 ?auto_321824 ) ) ( not ( = ?auto_321823 ?auto_321825 ) ) ( not ( = ?auto_321823 ?auto_321826 ) ) ( not ( = ?auto_321824 ?auto_321825 ) ) ( not ( = ?auto_321824 ?auto_321826 ) ) ( not ( = ?auto_321825 ?auto_321826 ) ) ( ON ?auto_321824 ?auto_321825 ) ( ON ?auto_321823 ?auto_321824 ) ( ON ?auto_321822 ?auto_321823 ) ( ON ?auto_321821 ?auto_321822 ) ( ON ?auto_321820 ?auto_321821 ) ( ON ?auto_321819 ?auto_321820 ) ( ON ?auto_321818 ?auto_321819 ) ( ON ?auto_321817 ?auto_321818 ) ( ON ?auto_321816 ?auto_321817 ) ( CLEAR ?auto_321814 ) ( ON ?auto_321815 ?auto_321816 ) ( CLEAR ?auto_321815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_321812 ?auto_321813 ?auto_321814 ?auto_321815 )
      ( MAKE-14PILE ?auto_321812 ?auto_321813 ?auto_321814 ?auto_321815 ?auto_321816 ?auto_321817 ?auto_321818 ?auto_321819 ?auto_321820 ?auto_321821 ?auto_321822 ?auto_321823 ?auto_321824 ?auto_321825 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321841 - BLOCK
      ?auto_321842 - BLOCK
      ?auto_321843 - BLOCK
      ?auto_321844 - BLOCK
      ?auto_321845 - BLOCK
      ?auto_321846 - BLOCK
      ?auto_321847 - BLOCK
      ?auto_321848 - BLOCK
      ?auto_321849 - BLOCK
      ?auto_321850 - BLOCK
      ?auto_321851 - BLOCK
      ?auto_321852 - BLOCK
      ?auto_321853 - BLOCK
      ?auto_321854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321854 ) ( ON-TABLE ?auto_321841 ) ( ON ?auto_321842 ?auto_321841 ) ( ON ?auto_321843 ?auto_321842 ) ( not ( = ?auto_321841 ?auto_321842 ) ) ( not ( = ?auto_321841 ?auto_321843 ) ) ( not ( = ?auto_321841 ?auto_321844 ) ) ( not ( = ?auto_321841 ?auto_321845 ) ) ( not ( = ?auto_321841 ?auto_321846 ) ) ( not ( = ?auto_321841 ?auto_321847 ) ) ( not ( = ?auto_321841 ?auto_321848 ) ) ( not ( = ?auto_321841 ?auto_321849 ) ) ( not ( = ?auto_321841 ?auto_321850 ) ) ( not ( = ?auto_321841 ?auto_321851 ) ) ( not ( = ?auto_321841 ?auto_321852 ) ) ( not ( = ?auto_321841 ?auto_321853 ) ) ( not ( = ?auto_321841 ?auto_321854 ) ) ( not ( = ?auto_321842 ?auto_321843 ) ) ( not ( = ?auto_321842 ?auto_321844 ) ) ( not ( = ?auto_321842 ?auto_321845 ) ) ( not ( = ?auto_321842 ?auto_321846 ) ) ( not ( = ?auto_321842 ?auto_321847 ) ) ( not ( = ?auto_321842 ?auto_321848 ) ) ( not ( = ?auto_321842 ?auto_321849 ) ) ( not ( = ?auto_321842 ?auto_321850 ) ) ( not ( = ?auto_321842 ?auto_321851 ) ) ( not ( = ?auto_321842 ?auto_321852 ) ) ( not ( = ?auto_321842 ?auto_321853 ) ) ( not ( = ?auto_321842 ?auto_321854 ) ) ( not ( = ?auto_321843 ?auto_321844 ) ) ( not ( = ?auto_321843 ?auto_321845 ) ) ( not ( = ?auto_321843 ?auto_321846 ) ) ( not ( = ?auto_321843 ?auto_321847 ) ) ( not ( = ?auto_321843 ?auto_321848 ) ) ( not ( = ?auto_321843 ?auto_321849 ) ) ( not ( = ?auto_321843 ?auto_321850 ) ) ( not ( = ?auto_321843 ?auto_321851 ) ) ( not ( = ?auto_321843 ?auto_321852 ) ) ( not ( = ?auto_321843 ?auto_321853 ) ) ( not ( = ?auto_321843 ?auto_321854 ) ) ( not ( = ?auto_321844 ?auto_321845 ) ) ( not ( = ?auto_321844 ?auto_321846 ) ) ( not ( = ?auto_321844 ?auto_321847 ) ) ( not ( = ?auto_321844 ?auto_321848 ) ) ( not ( = ?auto_321844 ?auto_321849 ) ) ( not ( = ?auto_321844 ?auto_321850 ) ) ( not ( = ?auto_321844 ?auto_321851 ) ) ( not ( = ?auto_321844 ?auto_321852 ) ) ( not ( = ?auto_321844 ?auto_321853 ) ) ( not ( = ?auto_321844 ?auto_321854 ) ) ( not ( = ?auto_321845 ?auto_321846 ) ) ( not ( = ?auto_321845 ?auto_321847 ) ) ( not ( = ?auto_321845 ?auto_321848 ) ) ( not ( = ?auto_321845 ?auto_321849 ) ) ( not ( = ?auto_321845 ?auto_321850 ) ) ( not ( = ?auto_321845 ?auto_321851 ) ) ( not ( = ?auto_321845 ?auto_321852 ) ) ( not ( = ?auto_321845 ?auto_321853 ) ) ( not ( = ?auto_321845 ?auto_321854 ) ) ( not ( = ?auto_321846 ?auto_321847 ) ) ( not ( = ?auto_321846 ?auto_321848 ) ) ( not ( = ?auto_321846 ?auto_321849 ) ) ( not ( = ?auto_321846 ?auto_321850 ) ) ( not ( = ?auto_321846 ?auto_321851 ) ) ( not ( = ?auto_321846 ?auto_321852 ) ) ( not ( = ?auto_321846 ?auto_321853 ) ) ( not ( = ?auto_321846 ?auto_321854 ) ) ( not ( = ?auto_321847 ?auto_321848 ) ) ( not ( = ?auto_321847 ?auto_321849 ) ) ( not ( = ?auto_321847 ?auto_321850 ) ) ( not ( = ?auto_321847 ?auto_321851 ) ) ( not ( = ?auto_321847 ?auto_321852 ) ) ( not ( = ?auto_321847 ?auto_321853 ) ) ( not ( = ?auto_321847 ?auto_321854 ) ) ( not ( = ?auto_321848 ?auto_321849 ) ) ( not ( = ?auto_321848 ?auto_321850 ) ) ( not ( = ?auto_321848 ?auto_321851 ) ) ( not ( = ?auto_321848 ?auto_321852 ) ) ( not ( = ?auto_321848 ?auto_321853 ) ) ( not ( = ?auto_321848 ?auto_321854 ) ) ( not ( = ?auto_321849 ?auto_321850 ) ) ( not ( = ?auto_321849 ?auto_321851 ) ) ( not ( = ?auto_321849 ?auto_321852 ) ) ( not ( = ?auto_321849 ?auto_321853 ) ) ( not ( = ?auto_321849 ?auto_321854 ) ) ( not ( = ?auto_321850 ?auto_321851 ) ) ( not ( = ?auto_321850 ?auto_321852 ) ) ( not ( = ?auto_321850 ?auto_321853 ) ) ( not ( = ?auto_321850 ?auto_321854 ) ) ( not ( = ?auto_321851 ?auto_321852 ) ) ( not ( = ?auto_321851 ?auto_321853 ) ) ( not ( = ?auto_321851 ?auto_321854 ) ) ( not ( = ?auto_321852 ?auto_321853 ) ) ( not ( = ?auto_321852 ?auto_321854 ) ) ( not ( = ?auto_321853 ?auto_321854 ) ) ( ON ?auto_321853 ?auto_321854 ) ( ON ?auto_321852 ?auto_321853 ) ( ON ?auto_321851 ?auto_321852 ) ( ON ?auto_321850 ?auto_321851 ) ( ON ?auto_321849 ?auto_321850 ) ( ON ?auto_321848 ?auto_321849 ) ( ON ?auto_321847 ?auto_321848 ) ( ON ?auto_321846 ?auto_321847 ) ( ON ?auto_321845 ?auto_321846 ) ( CLEAR ?auto_321843 ) ( ON ?auto_321844 ?auto_321845 ) ( CLEAR ?auto_321844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_321841 ?auto_321842 ?auto_321843 ?auto_321844 )
      ( MAKE-14PILE ?auto_321841 ?auto_321842 ?auto_321843 ?auto_321844 ?auto_321845 ?auto_321846 ?auto_321847 ?auto_321848 ?auto_321849 ?auto_321850 ?auto_321851 ?auto_321852 ?auto_321853 ?auto_321854 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321869 - BLOCK
      ?auto_321870 - BLOCK
      ?auto_321871 - BLOCK
      ?auto_321872 - BLOCK
      ?auto_321873 - BLOCK
      ?auto_321874 - BLOCK
      ?auto_321875 - BLOCK
      ?auto_321876 - BLOCK
      ?auto_321877 - BLOCK
      ?auto_321878 - BLOCK
      ?auto_321879 - BLOCK
      ?auto_321880 - BLOCK
      ?auto_321881 - BLOCK
      ?auto_321882 - BLOCK
    )
    :vars
    (
      ?auto_321883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321882 ?auto_321883 ) ( ON-TABLE ?auto_321869 ) ( ON ?auto_321870 ?auto_321869 ) ( not ( = ?auto_321869 ?auto_321870 ) ) ( not ( = ?auto_321869 ?auto_321871 ) ) ( not ( = ?auto_321869 ?auto_321872 ) ) ( not ( = ?auto_321869 ?auto_321873 ) ) ( not ( = ?auto_321869 ?auto_321874 ) ) ( not ( = ?auto_321869 ?auto_321875 ) ) ( not ( = ?auto_321869 ?auto_321876 ) ) ( not ( = ?auto_321869 ?auto_321877 ) ) ( not ( = ?auto_321869 ?auto_321878 ) ) ( not ( = ?auto_321869 ?auto_321879 ) ) ( not ( = ?auto_321869 ?auto_321880 ) ) ( not ( = ?auto_321869 ?auto_321881 ) ) ( not ( = ?auto_321869 ?auto_321882 ) ) ( not ( = ?auto_321869 ?auto_321883 ) ) ( not ( = ?auto_321870 ?auto_321871 ) ) ( not ( = ?auto_321870 ?auto_321872 ) ) ( not ( = ?auto_321870 ?auto_321873 ) ) ( not ( = ?auto_321870 ?auto_321874 ) ) ( not ( = ?auto_321870 ?auto_321875 ) ) ( not ( = ?auto_321870 ?auto_321876 ) ) ( not ( = ?auto_321870 ?auto_321877 ) ) ( not ( = ?auto_321870 ?auto_321878 ) ) ( not ( = ?auto_321870 ?auto_321879 ) ) ( not ( = ?auto_321870 ?auto_321880 ) ) ( not ( = ?auto_321870 ?auto_321881 ) ) ( not ( = ?auto_321870 ?auto_321882 ) ) ( not ( = ?auto_321870 ?auto_321883 ) ) ( not ( = ?auto_321871 ?auto_321872 ) ) ( not ( = ?auto_321871 ?auto_321873 ) ) ( not ( = ?auto_321871 ?auto_321874 ) ) ( not ( = ?auto_321871 ?auto_321875 ) ) ( not ( = ?auto_321871 ?auto_321876 ) ) ( not ( = ?auto_321871 ?auto_321877 ) ) ( not ( = ?auto_321871 ?auto_321878 ) ) ( not ( = ?auto_321871 ?auto_321879 ) ) ( not ( = ?auto_321871 ?auto_321880 ) ) ( not ( = ?auto_321871 ?auto_321881 ) ) ( not ( = ?auto_321871 ?auto_321882 ) ) ( not ( = ?auto_321871 ?auto_321883 ) ) ( not ( = ?auto_321872 ?auto_321873 ) ) ( not ( = ?auto_321872 ?auto_321874 ) ) ( not ( = ?auto_321872 ?auto_321875 ) ) ( not ( = ?auto_321872 ?auto_321876 ) ) ( not ( = ?auto_321872 ?auto_321877 ) ) ( not ( = ?auto_321872 ?auto_321878 ) ) ( not ( = ?auto_321872 ?auto_321879 ) ) ( not ( = ?auto_321872 ?auto_321880 ) ) ( not ( = ?auto_321872 ?auto_321881 ) ) ( not ( = ?auto_321872 ?auto_321882 ) ) ( not ( = ?auto_321872 ?auto_321883 ) ) ( not ( = ?auto_321873 ?auto_321874 ) ) ( not ( = ?auto_321873 ?auto_321875 ) ) ( not ( = ?auto_321873 ?auto_321876 ) ) ( not ( = ?auto_321873 ?auto_321877 ) ) ( not ( = ?auto_321873 ?auto_321878 ) ) ( not ( = ?auto_321873 ?auto_321879 ) ) ( not ( = ?auto_321873 ?auto_321880 ) ) ( not ( = ?auto_321873 ?auto_321881 ) ) ( not ( = ?auto_321873 ?auto_321882 ) ) ( not ( = ?auto_321873 ?auto_321883 ) ) ( not ( = ?auto_321874 ?auto_321875 ) ) ( not ( = ?auto_321874 ?auto_321876 ) ) ( not ( = ?auto_321874 ?auto_321877 ) ) ( not ( = ?auto_321874 ?auto_321878 ) ) ( not ( = ?auto_321874 ?auto_321879 ) ) ( not ( = ?auto_321874 ?auto_321880 ) ) ( not ( = ?auto_321874 ?auto_321881 ) ) ( not ( = ?auto_321874 ?auto_321882 ) ) ( not ( = ?auto_321874 ?auto_321883 ) ) ( not ( = ?auto_321875 ?auto_321876 ) ) ( not ( = ?auto_321875 ?auto_321877 ) ) ( not ( = ?auto_321875 ?auto_321878 ) ) ( not ( = ?auto_321875 ?auto_321879 ) ) ( not ( = ?auto_321875 ?auto_321880 ) ) ( not ( = ?auto_321875 ?auto_321881 ) ) ( not ( = ?auto_321875 ?auto_321882 ) ) ( not ( = ?auto_321875 ?auto_321883 ) ) ( not ( = ?auto_321876 ?auto_321877 ) ) ( not ( = ?auto_321876 ?auto_321878 ) ) ( not ( = ?auto_321876 ?auto_321879 ) ) ( not ( = ?auto_321876 ?auto_321880 ) ) ( not ( = ?auto_321876 ?auto_321881 ) ) ( not ( = ?auto_321876 ?auto_321882 ) ) ( not ( = ?auto_321876 ?auto_321883 ) ) ( not ( = ?auto_321877 ?auto_321878 ) ) ( not ( = ?auto_321877 ?auto_321879 ) ) ( not ( = ?auto_321877 ?auto_321880 ) ) ( not ( = ?auto_321877 ?auto_321881 ) ) ( not ( = ?auto_321877 ?auto_321882 ) ) ( not ( = ?auto_321877 ?auto_321883 ) ) ( not ( = ?auto_321878 ?auto_321879 ) ) ( not ( = ?auto_321878 ?auto_321880 ) ) ( not ( = ?auto_321878 ?auto_321881 ) ) ( not ( = ?auto_321878 ?auto_321882 ) ) ( not ( = ?auto_321878 ?auto_321883 ) ) ( not ( = ?auto_321879 ?auto_321880 ) ) ( not ( = ?auto_321879 ?auto_321881 ) ) ( not ( = ?auto_321879 ?auto_321882 ) ) ( not ( = ?auto_321879 ?auto_321883 ) ) ( not ( = ?auto_321880 ?auto_321881 ) ) ( not ( = ?auto_321880 ?auto_321882 ) ) ( not ( = ?auto_321880 ?auto_321883 ) ) ( not ( = ?auto_321881 ?auto_321882 ) ) ( not ( = ?auto_321881 ?auto_321883 ) ) ( not ( = ?auto_321882 ?auto_321883 ) ) ( ON ?auto_321881 ?auto_321882 ) ( ON ?auto_321880 ?auto_321881 ) ( ON ?auto_321879 ?auto_321880 ) ( ON ?auto_321878 ?auto_321879 ) ( ON ?auto_321877 ?auto_321878 ) ( ON ?auto_321876 ?auto_321877 ) ( ON ?auto_321875 ?auto_321876 ) ( ON ?auto_321874 ?auto_321875 ) ( ON ?auto_321873 ?auto_321874 ) ( ON ?auto_321872 ?auto_321873 ) ( CLEAR ?auto_321870 ) ( ON ?auto_321871 ?auto_321872 ) ( CLEAR ?auto_321871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_321869 ?auto_321870 ?auto_321871 )
      ( MAKE-14PILE ?auto_321869 ?auto_321870 ?auto_321871 ?auto_321872 ?auto_321873 ?auto_321874 ?auto_321875 ?auto_321876 ?auto_321877 ?auto_321878 ?auto_321879 ?auto_321880 ?auto_321881 ?auto_321882 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321898 - BLOCK
      ?auto_321899 - BLOCK
      ?auto_321900 - BLOCK
      ?auto_321901 - BLOCK
      ?auto_321902 - BLOCK
      ?auto_321903 - BLOCK
      ?auto_321904 - BLOCK
      ?auto_321905 - BLOCK
      ?auto_321906 - BLOCK
      ?auto_321907 - BLOCK
      ?auto_321908 - BLOCK
      ?auto_321909 - BLOCK
      ?auto_321910 - BLOCK
      ?auto_321911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321911 ) ( ON-TABLE ?auto_321898 ) ( ON ?auto_321899 ?auto_321898 ) ( not ( = ?auto_321898 ?auto_321899 ) ) ( not ( = ?auto_321898 ?auto_321900 ) ) ( not ( = ?auto_321898 ?auto_321901 ) ) ( not ( = ?auto_321898 ?auto_321902 ) ) ( not ( = ?auto_321898 ?auto_321903 ) ) ( not ( = ?auto_321898 ?auto_321904 ) ) ( not ( = ?auto_321898 ?auto_321905 ) ) ( not ( = ?auto_321898 ?auto_321906 ) ) ( not ( = ?auto_321898 ?auto_321907 ) ) ( not ( = ?auto_321898 ?auto_321908 ) ) ( not ( = ?auto_321898 ?auto_321909 ) ) ( not ( = ?auto_321898 ?auto_321910 ) ) ( not ( = ?auto_321898 ?auto_321911 ) ) ( not ( = ?auto_321899 ?auto_321900 ) ) ( not ( = ?auto_321899 ?auto_321901 ) ) ( not ( = ?auto_321899 ?auto_321902 ) ) ( not ( = ?auto_321899 ?auto_321903 ) ) ( not ( = ?auto_321899 ?auto_321904 ) ) ( not ( = ?auto_321899 ?auto_321905 ) ) ( not ( = ?auto_321899 ?auto_321906 ) ) ( not ( = ?auto_321899 ?auto_321907 ) ) ( not ( = ?auto_321899 ?auto_321908 ) ) ( not ( = ?auto_321899 ?auto_321909 ) ) ( not ( = ?auto_321899 ?auto_321910 ) ) ( not ( = ?auto_321899 ?auto_321911 ) ) ( not ( = ?auto_321900 ?auto_321901 ) ) ( not ( = ?auto_321900 ?auto_321902 ) ) ( not ( = ?auto_321900 ?auto_321903 ) ) ( not ( = ?auto_321900 ?auto_321904 ) ) ( not ( = ?auto_321900 ?auto_321905 ) ) ( not ( = ?auto_321900 ?auto_321906 ) ) ( not ( = ?auto_321900 ?auto_321907 ) ) ( not ( = ?auto_321900 ?auto_321908 ) ) ( not ( = ?auto_321900 ?auto_321909 ) ) ( not ( = ?auto_321900 ?auto_321910 ) ) ( not ( = ?auto_321900 ?auto_321911 ) ) ( not ( = ?auto_321901 ?auto_321902 ) ) ( not ( = ?auto_321901 ?auto_321903 ) ) ( not ( = ?auto_321901 ?auto_321904 ) ) ( not ( = ?auto_321901 ?auto_321905 ) ) ( not ( = ?auto_321901 ?auto_321906 ) ) ( not ( = ?auto_321901 ?auto_321907 ) ) ( not ( = ?auto_321901 ?auto_321908 ) ) ( not ( = ?auto_321901 ?auto_321909 ) ) ( not ( = ?auto_321901 ?auto_321910 ) ) ( not ( = ?auto_321901 ?auto_321911 ) ) ( not ( = ?auto_321902 ?auto_321903 ) ) ( not ( = ?auto_321902 ?auto_321904 ) ) ( not ( = ?auto_321902 ?auto_321905 ) ) ( not ( = ?auto_321902 ?auto_321906 ) ) ( not ( = ?auto_321902 ?auto_321907 ) ) ( not ( = ?auto_321902 ?auto_321908 ) ) ( not ( = ?auto_321902 ?auto_321909 ) ) ( not ( = ?auto_321902 ?auto_321910 ) ) ( not ( = ?auto_321902 ?auto_321911 ) ) ( not ( = ?auto_321903 ?auto_321904 ) ) ( not ( = ?auto_321903 ?auto_321905 ) ) ( not ( = ?auto_321903 ?auto_321906 ) ) ( not ( = ?auto_321903 ?auto_321907 ) ) ( not ( = ?auto_321903 ?auto_321908 ) ) ( not ( = ?auto_321903 ?auto_321909 ) ) ( not ( = ?auto_321903 ?auto_321910 ) ) ( not ( = ?auto_321903 ?auto_321911 ) ) ( not ( = ?auto_321904 ?auto_321905 ) ) ( not ( = ?auto_321904 ?auto_321906 ) ) ( not ( = ?auto_321904 ?auto_321907 ) ) ( not ( = ?auto_321904 ?auto_321908 ) ) ( not ( = ?auto_321904 ?auto_321909 ) ) ( not ( = ?auto_321904 ?auto_321910 ) ) ( not ( = ?auto_321904 ?auto_321911 ) ) ( not ( = ?auto_321905 ?auto_321906 ) ) ( not ( = ?auto_321905 ?auto_321907 ) ) ( not ( = ?auto_321905 ?auto_321908 ) ) ( not ( = ?auto_321905 ?auto_321909 ) ) ( not ( = ?auto_321905 ?auto_321910 ) ) ( not ( = ?auto_321905 ?auto_321911 ) ) ( not ( = ?auto_321906 ?auto_321907 ) ) ( not ( = ?auto_321906 ?auto_321908 ) ) ( not ( = ?auto_321906 ?auto_321909 ) ) ( not ( = ?auto_321906 ?auto_321910 ) ) ( not ( = ?auto_321906 ?auto_321911 ) ) ( not ( = ?auto_321907 ?auto_321908 ) ) ( not ( = ?auto_321907 ?auto_321909 ) ) ( not ( = ?auto_321907 ?auto_321910 ) ) ( not ( = ?auto_321907 ?auto_321911 ) ) ( not ( = ?auto_321908 ?auto_321909 ) ) ( not ( = ?auto_321908 ?auto_321910 ) ) ( not ( = ?auto_321908 ?auto_321911 ) ) ( not ( = ?auto_321909 ?auto_321910 ) ) ( not ( = ?auto_321909 ?auto_321911 ) ) ( not ( = ?auto_321910 ?auto_321911 ) ) ( ON ?auto_321910 ?auto_321911 ) ( ON ?auto_321909 ?auto_321910 ) ( ON ?auto_321908 ?auto_321909 ) ( ON ?auto_321907 ?auto_321908 ) ( ON ?auto_321906 ?auto_321907 ) ( ON ?auto_321905 ?auto_321906 ) ( ON ?auto_321904 ?auto_321905 ) ( ON ?auto_321903 ?auto_321904 ) ( ON ?auto_321902 ?auto_321903 ) ( ON ?auto_321901 ?auto_321902 ) ( CLEAR ?auto_321899 ) ( ON ?auto_321900 ?auto_321901 ) ( CLEAR ?auto_321900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_321898 ?auto_321899 ?auto_321900 )
      ( MAKE-14PILE ?auto_321898 ?auto_321899 ?auto_321900 ?auto_321901 ?auto_321902 ?auto_321903 ?auto_321904 ?auto_321905 ?auto_321906 ?auto_321907 ?auto_321908 ?auto_321909 ?auto_321910 ?auto_321911 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321926 - BLOCK
      ?auto_321927 - BLOCK
      ?auto_321928 - BLOCK
      ?auto_321929 - BLOCK
      ?auto_321930 - BLOCK
      ?auto_321931 - BLOCK
      ?auto_321932 - BLOCK
      ?auto_321933 - BLOCK
      ?auto_321934 - BLOCK
      ?auto_321935 - BLOCK
      ?auto_321936 - BLOCK
      ?auto_321937 - BLOCK
      ?auto_321938 - BLOCK
      ?auto_321939 - BLOCK
    )
    :vars
    (
      ?auto_321940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321939 ?auto_321940 ) ( ON-TABLE ?auto_321926 ) ( not ( = ?auto_321926 ?auto_321927 ) ) ( not ( = ?auto_321926 ?auto_321928 ) ) ( not ( = ?auto_321926 ?auto_321929 ) ) ( not ( = ?auto_321926 ?auto_321930 ) ) ( not ( = ?auto_321926 ?auto_321931 ) ) ( not ( = ?auto_321926 ?auto_321932 ) ) ( not ( = ?auto_321926 ?auto_321933 ) ) ( not ( = ?auto_321926 ?auto_321934 ) ) ( not ( = ?auto_321926 ?auto_321935 ) ) ( not ( = ?auto_321926 ?auto_321936 ) ) ( not ( = ?auto_321926 ?auto_321937 ) ) ( not ( = ?auto_321926 ?auto_321938 ) ) ( not ( = ?auto_321926 ?auto_321939 ) ) ( not ( = ?auto_321926 ?auto_321940 ) ) ( not ( = ?auto_321927 ?auto_321928 ) ) ( not ( = ?auto_321927 ?auto_321929 ) ) ( not ( = ?auto_321927 ?auto_321930 ) ) ( not ( = ?auto_321927 ?auto_321931 ) ) ( not ( = ?auto_321927 ?auto_321932 ) ) ( not ( = ?auto_321927 ?auto_321933 ) ) ( not ( = ?auto_321927 ?auto_321934 ) ) ( not ( = ?auto_321927 ?auto_321935 ) ) ( not ( = ?auto_321927 ?auto_321936 ) ) ( not ( = ?auto_321927 ?auto_321937 ) ) ( not ( = ?auto_321927 ?auto_321938 ) ) ( not ( = ?auto_321927 ?auto_321939 ) ) ( not ( = ?auto_321927 ?auto_321940 ) ) ( not ( = ?auto_321928 ?auto_321929 ) ) ( not ( = ?auto_321928 ?auto_321930 ) ) ( not ( = ?auto_321928 ?auto_321931 ) ) ( not ( = ?auto_321928 ?auto_321932 ) ) ( not ( = ?auto_321928 ?auto_321933 ) ) ( not ( = ?auto_321928 ?auto_321934 ) ) ( not ( = ?auto_321928 ?auto_321935 ) ) ( not ( = ?auto_321928 ?auto_321936 ) ) ( not ( = ?auto_321928 ?auto_321937 ) ) ( not ( = ?auto_321928 ?auto_321938 ) ) ( not ( = ?auto_321928 ?auto_321939 ) ) ( not ( = ?auto_321928 ?auto_321940 ) ) ( not ( = ?auto_321929 ?auto_321930 ) ) ( not ( = ?auto_321929 ?auto_321931 ) ) ( not ( = ?auto_321929 ?auto_321932 ) ) ( not ( = ?auto_321929 ?auto_321933 ) ) ( not ( = ?auto_321929 ?auto_321934 ) ) ( not ( = ?auto_321929 ?auto_321935 ) ) ( not ( = ?auto_321929 ?auto_321936 ) ) ( not ( = ?auto_321929 ?auto_321937 ) ) ( not ( = ?auto_321929 ?auto_321938 ) ) ( not ( = ?auto_321929 ?auto_321939 ) ) ( not ( = ?auto_321929 ?auto_321940 ) ) ( not ( = ?auto_321930 ?auto_321931 ) ) ( not ( = ?auto_321930 ?auto_321932 ) ) ( not ( = ?auto_321930 ?auto_321933 ) ) ( not ( = ?auto_321930 ?auto_321934 ) ) ( not ( = ?auto_321930 ?auto_321935 ) ) ( not ( = ?auto_321930 ?auto_321936 ) ) ( not ( = ?auto_321930 ?auto_321937 ) ) ( not ( = ?auto_321930 ?auto_321938 ) ) ( not ( = ?auto_321930 ?auto_321939 ) ) ( not ( = ?auto_321930 ?auto_321940 ) ) ( not ( = ?auto_321931 ?auto_321932 ) ) ( not ( = ?auto_321931 ?auto_321933 ) ) ( not ( = ?auto_321931 ?auto_321934 ) ) ( not ( = ?auto_321931 ?auto_321935 ) ) ( not ( = ?auto_321931 ?auto_321936 ) ) ( not ( = ?auto_321931 ?auto_321937 ) ) ( not ( = ?auto_321931 ?auto_321938 ) ) ( not ( = ?auto_321931 ?auto_321939 ) ) ( not ( = ?auto_321931 ?auto_321940 ) ) ( not ( = ?auto_321932 ?auto_321933 ) ) ( not ( = ?auto_321932 ?auto_321934 ) ) ( not ( = ?auto_321932 ?auto_321935 ) ) ( not ( = ?auto_321932 ?auto_321936 ) ) ( not ( = ?auto_321932 ?auto_321937 ) ) ( not ( = ?auto_321932 ?auto_321938 ) ) ( not ( = ?auto_321932 ?auto_321939 ) ) ( not ( = ?auto_321932 ?auto_321940 ) ) ( not ( = ?auto_321933 ?auto_321934 ) ) ( not ( = ?auto_321933 ?auto_321935 ) ) ( not ( = ?auto_321933 ?auto_321936 ) ) ( not ( = ?auto_321933 ?auto_321937 ) ) ( not ( = ?auto_321933 ?auto_321938 ) ) ( not ( = ?auto_321933 ?auto_321939 ) ) ( not ( = ?auto_321933 ?auto_321940 ) ) ( not ( = ?auto_321934 ?auto_321935 ) ) ( not ( = ?auto_321934 ?auto_321936 ) ) ( not ( = ?auto_321934 ?auto_321937 ) ) ( not ( = ?auto_321934 ?auto_321938 ) ) ( not ( = ?auto_321934 ?auto_321939 ) ) ( not ( = ?auto_321934 ?auto_321940 ) ) ( not ( = ?auto_321935 ?auto_321936 ) ) ( not ( = ?auto_321935 ?auto_321937 ) ) ( not ( = ?auto_321935 ?auto_321938 ) ) ( not ( = ?auto_321935 ?auto_321939 ) ) ( not ( = ?auto_321935 ?auto_321940 ) ) ( not ( = ?auto_321936 ?auto_321937 ) ) ( not ( = ?auto_321936 ?auto_321938 ) ) ( not ( = ?auto_321936 ?auto_321939 ) ) ( not ( = ?auto_321936 ?auto_321940 ) ) ( not ( = ?auto_321937 ?auto_321938 ) ) ( not ( = ?auto_321937 ?auto_321939 ) ) ( not ( = ?auto_321937 ?auto_321940 ) ) ( not ( = ?auto_321938 ?auto_321939 ) ) ( not ( = ?auto_321938 ?auto_321940 ) ) ( not ( = ?auto_321939 ?auto_321940 ) ) ( ON ?auto_321938 ?auto_321939 ) ( ON ?auto_321937 ?auto_321938 ) ( ON ?auto_321936 ?auto_321937 ) ( ON ?auto_321935 ?auto_321936 ) ( ON ?auto_321934 ?auto_321935 ) ( ON ?auto_321933 ?auto_321934 ) ( ON ?auto_321932 ?auto_321933 ) ( ON ?auto_321931 ?auto_321932 ) ( ON ?auto_321930 ?auto_321931 ) ( ON ?auto_321929 ?auto_321930 ) ( ON ?auto_321928 ?auto_321929 ) ( CLEAR ?auto_321926 ) ( ON ?auto_321927 ?auto_321928 ) ( CLEAR ?auto_321927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_321926 ?auto_321927 )
      ( MAKE-14PILE ?auto_321926 ?auto_321927 ?auto_321928 ?auto_321929 ?auto_321930 ?auto_321931 ?auto_321932 ?auto_321933 ?auto_321934 ?auto_321935 ?auto_321936 ?auto_321937 ?auto_321938 ?auto_321939 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321955 - BLOCK
      ?auto_321956 - BLOCK
      ?auto_321957 - BLOCK
      ?auto_321958 - BLOCK
      ?auto_321959 - BLOCK
      ?auto_321960 - BLOCK
      ?auto_321961 - BLOCK
      ?auto_321962 - BLOCK
      ?auto_321963 - BLOCK
      ?auto_321964 - BLOCK
      ?auto_321965 - BLOCK
      ?auto_321966 - BLOCK
      ?auto_321967 - BLOCK
      ?auto_321968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_321968 ) ( ON-TABLE ?auto_321955 ) ( not ( = ?auto_321955 ?auto_321956 ) ) ( not ( = ?auto_321955 ?auto_321957 ) ) ( not ( = ?auto_321955 ?auto_321958 ) ) ( not ( = ?auto_321955 ?auto_321959 ) ) ( not ( = ?auto_321955 ?auto_321960 ) ) ( not ( = ?auto_321955 ?auto_321961 ) ) ( not ( = ?auto_321955 ?auto_321962 ) ) ( not ( = ?auto_321955 ?auto_321963 ) ) ( not ( = ?auto_321955 ?auto_321964 ) ) ( not ( = ?auto_321955 ?auto_321965 ) ) ( not ( = ?auto_321955 ?auto_321966 ) ) ( not ( = ?auto_321955 ?auto_321967 ) ) ( not ( = ?auto_321955 ?auto_321968 ) ) ( not ( = ?auto_321956 ?auto_321957 ) ) ( not ( = ?auto_321956 ?auto_321958 ) ) ( not ( = ?auto_321956 ?auto_321959 ) ) ( not ( = ?auto_321956 ?auto_321960 ) ) ( not ( = ?auto_321956 ?auto_321961 ) ) ( not ( = ?auto_321956 ?auto_321962 ) ) ( not ( = ?auto_321956 ?auto_321963 ) ) ( not ( = ?auto_321956 ?auto_321964 ) ) ( not ( = ?auto_321956 ?auto_321965 ) ) ( not ( = ?auto_321956 ?auto_321966 ) ) ( not ( = ?auto_321956 ?auto_321967 ) ) ( not ( = ?auto_321956 ?auto_321968 ) ) ( not ( = ?auto_321957 ?auto_321958 ) ) ( not ( = ?auto_321957 ?auto_321959 ) ) ( not ( = ?auto_321957 ?auto_321960 ) ) ( not ( = ?auto_321957 ?auto_321961 ) ) ( not ( = ?auto_321957 ?auto_321962 ) ) ( not ( = ?auto_321957 ?auto_321963 ) ) ( not ( = ?auto_321957 ?auto_321964 ) ) ( not ( = ?auto_321957 ?auto_321965 ) ) ( not ( = ?auto_321957 ?auto_321966 ) ) ( not ( = ?auto_321957 ?auto_321967 ) ) ( not ( = ?auto_321957 ?auto_321968 ) ) ( not ( = ?auto_321958 ?auto_321959 ) ) ( not ( = ?auto_321958 ?auto_321960 ) ) ( not ( = ?auto_321958 ?auto_321961 ) ) ( not ( = ?auto_321958 ?auto_321962 ) ) ( not ( = ?auto_321958 ?auto_321963 ) ) ( not ( = ?auto_321958 ?auto_321964 ) ) ( not ( = ?auto_321958 ?auto_321965 ) ) ( not ( = ?auto_321958 ?auto_321966 ) ) ( not ( = ?auto_321958 ?auto_321967 ) ) ( not ( = ?auto_321958 ?auto_321968 ) ) ( not ( = ?auto_321959 ?auto_321960 ) ) ( not ( = ?auto_321959 ?auto_321961 ) ) ( not ( = ?auto_321959 ?auto_321962 ) ) ( not ( = ?auto_321959 ?auto_321963 ) ) ( not ( = ?auto_321959 ?auto_321964 ) ) ( not ( = ?auto_321959 ?auto_321965 ) ) ( not ( = ?auto_321959 ?auto_321966 ) ) ( not ( = ?auto_321959 ?auto_321967 ) ) ( not ( = ?auto_321959 ?auto_321968 ) ) ( not ( = ?auto_321960 ?auto_321961 ) ) ( not ( = ?auto_321960 ?auto_321962 ) ) ( not ( = ?auto_321960 ?auto_321963 ) ) ( not ( = ?auto_321960 ?auto_321964 ) ) ( not ( = ?auto_321960 ?auto_321965 ) ) ( not ( = ?auto_321960 ?auto_321966 ) ) ( not ( = ?auto_321960 ?auto_321967 ) ) ( not ( = ?auto_321960 ?auto_321968 ) ) ( not ( = ?auto_321961 ?auto_321962 ) ) ( not ( = ?auto_321961 ?auto_321963 ) ) ( not ( = ?auto_321961 ?auto_321964 ) ) ( not ( = ?auto_321961 ?auto_321965 ) ) ( not ( = ?auto_321961 ?auto_321966 ) ) ( not ( = ?auto_321961 ?auto_321967 ) ) ( not ( = ?auto_321961 ?auto_321968 ) ) ( not ( = ?auto_321962 ?auto_321963 ) ) ( not ( = ?auto_321962 ?auto_321964 ) ) ( not ( = ?auto_321962 ?auto_321965 ) ) ( not ( = ?auto_321962 ?auto_321966 ) ) ( not ( = ?auto_321962 ?auto_321967 ) ) ( not ( = ?auto_321962 ?auto_321968 ) ) ( not ( = ?auto_321963 ?auto_321964 ) ) ( not ( = ?auto_321963 ?auto_321965 ) ) ( not ( = ?auto_321963 ?auto_321966 ) ) ( not ( = ?auto_321963 ?auto_321967 ) ) ( not ( = ?auto_321963 ?auto_321968 ) ) ( not ( = ?auto_321964 ?auto_321965 ) ) ( not ( = ?auto_321964 ?auto_321966 ) ) ( not ( = ?auto_321964 ?auto_321967 ) ) ( not ( = ?auto_321964 ?auto_321968 ) ) ( not ( = ?auto_321965 ?auto_321966 ) ) ( not ( = ?auto_321965 ?auto_321967 ) ) ( not ( = ?auto_321965 ?auto_321968 ) ) ( not ( = ?auto_321966 ?auto_321967 ) ) ( not ( = ?auto_321966 ?auto_321968 ) ) ( not ( = ?auto_321967 ?auto_321968 ) ) ( ON ?auto_321967 ?auto_321968 ) ( ON ?auto_321966 ?auto_321967 ) ( ON ?auto_321965 ?auto_321966 ) ( ON ?auto_321964 ?auto_321965 ) ( ON ?auto_321963 ?auto_321964 ) ( ON ?auto_321962 ?auto_321963 ) ( ON ?auto_321961 ?auto_321962 ) ( ON ?auto_321960 ?auto_321961 ) ( ON ?auto_321959 ?auto_321960 ) ( ON ?auto_321958 ?auto_321959 ) ( ON ?auto_321957 ?auto_321958 ) ( CLEAR ?auto_321955 ) ( ON ?auto_321956 ?auto_321957 ) ( CLEAR ?auto_321956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_321955 ?auto_321956 )
      ( MAKE-14PILE ?auto_321955 ?auto_321956 ?auto_321957 ?auto_321958 ?auto_321959 ?auto_321960 ?auto_321961 ?auto_321962 ?auto_321963 ?auto_321964 ?auto_321965 ?auto_321966 ?auto_321967 ?auto_321968 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_321983 - BLOCK
      ?auto_321984 - BLOCK
      ?auto_321985 - BLOCK
      ?auto_321986 - BLOCK
      ?auto_321987 - BLOCK
      ?auto_321988 - BLOCK
      ?auto_321989 - BLOCK
      ?auto_321990 - BLOCK
      ?auto_321991 - BLOCK
      ?auto_321992 - BLOCK
      ?auto_321993 - BLOCK
      ?auto_321994 - BLOCK
      ?auto_321995 - BLOCK
      ?auto_321996 - BLOCK
    )
    :vars
    (
      ?auto_321997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_321996 ?auto_321997 ) ( not ( = ?auto_321983 ?auto_321984 ) ) ( not ( = ?auto_321983 ?auto_321985 ) ) ( not ( = ?auto_321983 ?auto_321986 ) ) ( not ( = ?auto_321983 ?auto_321987 ) ) ( not ( = ?auto_321983 ?auto_321988 ) ) ( not ( = ?auto_321983 ?auto_321989 ) ) ( not ( = ?auto_321983 ?auto_321990 ) ) ( not ( = ?auto_321983 ?auto_321991 ) ) ( not ( = ?auto_321983 ?auto_321992 ) ) ( not ( = ?auto_321983 ?auto_321993 ) ) ( not ( = ?auto_321983 ?auto_321994 ) ) ( not ( = ?auto_321983 ?auto_321995 ) ) ( not ( = ?auto_321983 ?auto_321996 ) ) ( not ( = ?auto_321983 ?auto_321997 ) ) ( not ( = ?auto_321984 ?auto_321985 ) ) ( not ( = ?auto_321984 ?auto_321986 ) ) ( not ( = ?auto_321984 ?auto_321987 ) ) ( not ( = ?auto_321984 ?auto_321988 ) ) ( not ( = ?auto_321984 ?auto_321989 ) ) ( not ( = ?auto_321984 ?auto_321990 ) ) ( not ( = ?auto_321984 ?auto_321991 ) ) ( not ( = ?auto_321984 ?auto_321992 ) ) ( not ( = ?auto_321984 ?auto_321993 ) ) ( not ( = ?auto_321984 ?auto_321994 ) ) ( not ( = ?auto_321984 ?auto_321995 ) ) ( not ( = ?auto_321984 ?auto_321996 ) ) ( not ( = ?auto_321984 ?auto_321997 ) ) ( not ( = ?auto_321985 ?auto_321986 ) ) ( not ( = ?auto_321985 ?auto_321987 ) ) ( not ( = ?auto_321985 ?auto_321988 ) ) ( not ( = ?auto_321985 ?auto_321989 ) ) ( not ( = ?auto_321985 ?auto_321990 ) ) ( not ( = ?auto_321985 ?auto_321991 ) ) ( not ( = ?auto_321985 ?auto_321992 ) ) ( not ( = ?auto_321985 ?auto_321993 ) ) ( not ( = ?auto_321985 ?auto_321994 ) ) ( not ( = ?auto_321985 ?auto_321995 ) ) ( not ( = ?auto_321985 ?auto_321996 ) ) ( not ( = ?auto_321985 ?auto_321997 ) ) ( not ( = ?auto_321986 ?auto_321987 ) ) ( not ( = ?auto_321986 ?auto_321988 ) ) ( not ( = ?auto_321986 ?auto_321989 ) ) ( not ( = ?auto_321986 ?auto_321990 ) ) ( not ( = ?auto_321986 ?auto_321991 ) ) ( not ( = ?auto_321986 ?auto_321992 ) ) ( not ( = ?auto_321986 ?auto_321993 ) ) ( not ( = ?auto_321986 ?auto_321994 ) ) ( not ( = ?auto_321986 ?auto_321995 ) ) ( not ( = ?auto_321986 ?auto_321996 ) ) ( not ( = ?auto_321986 ?auto_321997 ) ) ( not ( = ?auto_321987 ?auto_321988 ) ) ( not ( = ?auto_321987 ?auto_321989 ) ) ( not ( = ?auto_321987 ?auto_321990 ) ) ( not ( = ?auto_321987 ?auto_321991 ) ) ( not ( = ?auto_321987 ?auto_321992 ) ) ( not ( = ?auto_321987 ?auto_321993 ) ) ( not ( = ?auto_321987 ?auto_321994 ) ) ( not ( = ?auto_321987 ?auto_321995 ) ) ( not ( = ?auto_321987 ?auto_321996 ) ) ( not ( = ?auto_321987 ?auto_321997 ) ) ( not ( = ?auto_321988 ?auto_321989 ) ) ( not ( = ?auto_321988 ?auto_321990 ) ) ( not ( = ?auto_321988 ?auto_321991 ) ) ( not ( = ?auto_321988 ?auto_321992 ) ) ( not ( = ?auto_321988 ?auto_321993 ) ) ( not ( = ?auto_321988 ?auto_321994 ) ) ( not ( = ?auto_321988 ?auto_321995 ) ) ( not ( = ?auto_321988 ?auto_321996 ) ) ( not ( = ?auto_321988 ?auto_321997 ) ) ( not ( = ?auto_321989 ?auto_321990 ) ) ( not ( = ?auto_321989 ?auto_321991 ) ) ( not ( = ?auto_321989 ?auto_321992 ) ) ( not ( = ?auto_321989 ?auto_321993 ) ) ( not ( = ?auto_321989 ?auto_321994 ) ) ( not ( = ?auto_321989 ?auto_321995 ) ) ( not ( = ?auto_321989 ?auto_321996 ) ) ( not ( = ?auto_321989 ?auto_321997 ) ) ( not ( = ?auto_321990 ?auto_321991 ) ) ( not ( = ?auto_321990 ?auto_321992 ) ) ( not ( = ?auto_321990 ?auto_321993 ) ) ( not ( = ?auto_321990 ?auto_321994 ) ) ( not ( = ?auto_321990 ?auto_321995 ) ) ( not ( = ?auto_321990 ?auto_321996 ) ) ( not ( = ?auto_321990 ?auto_321997 ) ) ( not ( = ?auto_321991 ?auto_321992 ) ) ( not ( = ?auto_321991 ?auto_321993 ) ) ( not ( = ?auto_321991 ?auto_321994 ) ) ( not ( = ?auto_321991 ?auto_321995 ) ) ( not ( = ?auto_321991 ?auto_321996 ) ) ( not ( = ?auto_321991 ?auto_321997 ) ) ( not ( = ?auto_321992 ?auto_321993 ) ) ( not ( = ?auto_321992 ?auto_321994 ) ) ( not ( = ?auto_321992 ?auto_321995 ) ) ( not ( = ?auto_321992 ?auto_321996 ) ) ( not ( = ?auto_321992 ?auto_321997 ) ) ( not ( = ?auto_321993 ?auto_321994 ) ) ( not ( = ?auto_321993 ?auto_321995 ) ) ( not ( = ?auto_321993 ?auto_321996 ) ) ( not ( = ?auto_321993 ?auto_321997 ) ) ( not ( = ?auto_321994 ?auto_321995 ) ) ( not ( = ?auto_321994 ?auto_321996 ) ) ( not ( = ?auto_321994 ?auto_321997 ) ) ( not ( = ?auto_321995 ?auto_321996 ) ) ( not ( = ?auto_321995 ?auto_321997 ) ) ( not ( = ?auto_321996 ?auto_321997 ) ) ( ON ?auto_321995 ?auto_321996 ) ( ON ?auto_321994 ?auto_321995 ) ( ON ?auto_321993 ?auto_321994 ) ( ON ?auto_321992 ?auto_321993 ) ( ON ?auto_321991 ?auto_321992 ) ( ON ?auto_321990 ?auto_321991 ) ( ON ?auto_321989 ?auto_321990 ) ( ON ?auto_321988 ?auto_321989 ) ( ON ?auto_321987 ?auto_321988 ) ( ON ?auto_321986 ?auto_321987 ) ( ON ?auto_321985 ?auto_321986 ) ( ON ?auto_321984 ?auto_321985 ) ( ON ?auto_321983 ?auto_321984 ) ( CLEAR ?auto_321983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_321983 )
      ( MAKE-14PILE ?auto_321983 ?auto_321984 ?auto_321985 ?auto_321986 ?auto_321987 ?auto_321988 ?auto_321989 ?auto_321990 ?auto_321991 ?auto_321992 ?auto_321993 ?auto_321994 ?auto_321995 ?auto_321996 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_322012 - BLOCK
      ?auto_322013 - BLOCK
      ?auto_322014 - BLOCK
      ?auto_322015 - BLOCK
      ?auto_322016 - BLOCK
      ?auto_322017 - BLOCK
      ?auto_322018 - BLOCK
      ?auto_322019 - BLOCK
      ?auto_322020 - BLOCK
      ?auto_322021 - BLOCK
      ?auto_322022 - BLOCK
      ?auto_322023 - BLOCK
      ?auto_322024 - BLOCK
      ?auto_322025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_322025 ) ( not ( = ?auto_322012 ?auto_322013 ) ) ( not ( = ?auto_322012 ?auto_322014 ) ) ( not ( = ?auto_322012 ?auto_322015 ) ) ( not ( = ?auto_322012 ?auto_322016 ) ) ( not ( = ?auto_322012 ?auto_322017 ) ) ( not ( = ?auto_322012 ?auto_322018 ) ) ( not ( = ?auto_322012 ?auto_322019 ) ) ( not ( = ?auto_322012 ?auto_322020 ) ) ( not ( = ?auto_322012 ?auto_322021 ) ) ( not ( = ?auto_322012 ?auto_322022 ) ) ( not ( = ?auto_322012 ?auto_322023 ) ) ( not ( = ?auto_322012 ?auto_322024 ) ) ( not ( = ?auto_322012 ?auto_322025 ) ) ( not ( = ?auto_322013 ?auto_322014 ) ) ( not ( = ?auto_322013 ?auto_322015 ) ) ( not ( = ?auto_322013 ?auto_322016 ) ) ( not ( = ?auto_322013 ?auto_322017 ) ) ( not ( = ?auto_322013 ?auto_322018 ) ) ( not ( = ?auto_322013 ?auto_322019 ) ) ( not ( = ?auto_322013 ?auto_322020 ) ) ( not ( = ?auto_322013 ?auto_322021 ) ) ( not ( = ?auto_322013 ?auto_322022 ) ) ( not ( = ?auto_322013 ?auto_322023 ) ) ( not ( = ?auto_322013 ?auto_322024 ) ) ( not ( = ?auto_322013 ?auto_322025 ) ) ( not ( = ?auto_322014 ?auto_322015 ) ) ( not ( = ?auto_322014 ?auto_322016 ) ) ( not ( = ?auto_322014 ?auto_322017 ) ) ( not ( = ?auto_322014 ?auto_322018 ) ) ( not ( = ?auto_322014 ?auto_322019 ) ) ( not ( = ?auto_322014 ?auto_322020 ) ) ( not ( = ?auto_322014 ?auto_322021 ) ) ( not ( = ?auto_322014 ?auto_322022 ) ) ( not ( = ?auto_322014 ?auto_322023 ) ) ( not ( = ?auto_322014 ?auto_322024 ) ) ( not ( = ?auto_322014 ?auto_322025 ) ) ( not ( = ?auto_322015 ?auto_322016 ) ) ( not ( = ?auto_322015 ?auto_322017 ) ) ( not ( = ?auto_322015 ?auto_322018 ) ) ( not ( = ?auto_322015 ?auto_322019 ) ) ( not ( = ?auto_322015 ?auto_322020 ) ) ( not ( = ?auto_322015 ?auto_322021 ) ) ( not ( = ?auto_322015 ?auto_322022 ) ) ( not ( = ?auto_322015 ?auto_322023 ) ) ( not ( = ?auto_322015 ?auto_322024 ) ) ( not ( = ?auto_322015 ?auto_322025 ) ) ( not ( = ?auto_322016 ?auto_322017 ) ) ( not ( = ?auto_322016 ?auto_322018 ) ) ( not ( = ?auto_322016 ?auto_322019 ) ) ( not ( = ?auto_322016 ?auto_322020 ) ) ( not ( = ?auto_322016 ?auto_322021 ) ) ( not ( = ?auto_322016 ?auto_322022 ) ) ( not ( = ?auto_322016 ?auto_322023 ) ) ( not ( = ?auto_322016 ?auto_322024 ) ) ( not ( = ?auto_322016 ?auto_322025 ) ) ( not ( = ?auto_322017 ?auto_322018 ) ) ( not ( = ?auto_322017 ?auto_322019 ) ) ( not ( = ?auto_322017 ?auto_322020 ) ) ( not ( = ?auto_322017 ?auto_322021 ) ) ( not ( = ?auto_322017 ?auto_322022 ) ) ( not ( = ?auto_322017 ?auto_322023 ) ) ( not ( = ?auto_322017 ?auto_322024 ) ) ( not ( = ?auto_322017 ?auto_322025 ) ) ( not ( = ?auto_322018 ?auto_322019 ) ) ( not ( = ?auto_322018 ?auto_322020 ) ) ( not ( = ?auto_322018 ?auto_322021 ) ) ( not ( = ?auto_322018 ?auto_322022 ) ) ( not ( = ?auto_322018 ?auto_322023 ) ) ( not ( = ?auto_322018 ?auto_322024 ) ) ( not ( = ?auto_322018 ?auto_322025 ) ) ( not ( = ?auto_322019 ?auto_322020 ) ) ( not ( = ?auto_322019 ?auto_322021 ) ) ( not ( = ?auto_322019 ?auto_322022 ) ) ( not ( = ?auto_322019 ?auto_322023 ) ) ( not ( = ?auto_322019 ?auto_322024 ) ) ( not ( = ?auto_322019 ?auto_322025 ) ) ( not ( = ?auto_322020 ?auto_322021 ) ) ( not ( = ?auto_322020 ?auto_322022 ) ) ( not ( = ?auto_322020 ?auto_322023 ) ) ( not ( = ?auto_322020 ?auto_322024 ) ) ( not ( = ?auto_322020 ?auto_322025 ) ) ( not ( = ?auto_322021 ?auto_322022 ) ) ( not ( = ?auto_322021 ?auto_322023 ) ) ( not ( = ?auto_322021 ?auto_322024 ) ) ( not ( = ?auto_322021 ?auto_322025 ) ) ( not ( = ?auto_322022 ?auto_322023 ) ) ( not ( = ?auto_322022 ?auto_322024 ) ) ( not ( = ?auto_322022 ?auto_322025 ) ) ( not ( = ?auto_322023 ?auto_322024 ) ) ( not ( = ?auto_322023 ?auto_322025 ) ) ( not ( = ?auto_322024 ?auto_322025 ) ) ( ON ?auto_322024 ?auto_322025 ) ( ON ?auto_322023 ?auto_322024 ) ( ON ?auto_322022 ?auto_322023 ) ( ON ?auto_322021 ?auto_322022 ) ( ON ?auto_322020 ?auto_322021 ) ( ON ?auto_322019 ?auto_322020 ) ( ON ?auto_322018 ?auto_322019 ) ( ON ?auto_322017 ?auto_322018 ) ( ON ?auto_322016 ?auto_322017 ) ( ON ?auto_322015 ?auto_322016 ) ( ON ?auto_322014 ?auto_322015 ) ( ON ?auto_322013 ?auto_322014 ) ( ON ?auto_322012 ?auto_322013 ) ( CLEAR ?auto_322012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_322012 )
      ( MAKE-14PILE ?auto_322012 ?auto_322013 ?auto_322014 ?auto_322015 ?auto_322016 ?auto_322017 ?auto_322018 ?auto_322019 ?auto_322020 ?auto_322021 ?auto_322022 ?auto_322023 ?auto_322024 ?auto_322025 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_322040 - BLOCK
      ?auto_322041 - BLOCK
      ?auto_322042 - BLOCK
      ?auto_322043 - BLOCK
      ?auto_322044 - BLOCK
      ?auto_322045 - BLOCK
      ?auto_322046 - BLOCK
      ?auto_322047 - BLOCK
      ?auto_322048 - BLOCK
      ?auto_322049 - BLOCK
      ?auto_322050 - BLOCK
      ?auto_322051 - BLOCK
      ?auto_322052 - BLOCK
      ?auto_322053 - BLOCK
    )
    :vars
    (
      ?auto_322054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_322040 ?auto_322041 ) ) ( not ( = ?auto_322040 ?auto_322042 ) ) ( not ( = ?auto_322040 ?auto_322043 ) ) ( not ( = ?auto_322040 ?auto_322044 ) ) ( not ( = ?auto_322040 ?auto_322045 ) ) ( not ( = ?auto_322040 ?auto_322046 ) ) ( not ( = ?auto_322040 ?auto_322047 ) ) ( not ( = ?auto_322040 ?auto_322048 ) ) ( not ( = ?auto_322040 ?auto_322049 ) ) ( not ( = ?auto_322040 ?auto_322050 ) ) ( not ( = ?auto_322040 ?auto_322051 ) ) ( not ( = ?auto_322040 ?auto_322052 ) ) ( not ( = ?auto_322040 ?auto_322053 ) ) ( not ( = ?auto_322041 ?auto_322042 ) ) ( not ( = ?auto_322041 ?auto_322043 ) ) ( not ( = ?auto_322041 ?auto_322044 ) ) ( not ( = ?auto_322041 ?auto_322045 ) ) ( not ( = ?auto_322041 ?auto_322046 ) ) ( not ( = ?auto_322041 ?auto_322047 ) ) ( not ( = ?auto_322041 ?auto_322048 ) ) ( not ( = ?auto_322041 ?auto_322049 ) ) ( not ( = ?auto_322041 ?auto_322050 ) ) ( not ( = ?auto_322041 ?auto_322051 ) ) ( not ( = ?auto_322041 ?auto_322052 ) ) ( not ( = ?auto_322041 ?auto_322053 ) ) ( not ( = ?auto_322042 ?auto_322043 ) ) ( not ( = ?auto_322042 ?auto_322044 ) ) ( not ( = ?auto_322042 ?auto_322045 ) ) ( not ( = ?auto_322042 ?auto_322046 ) ) ( not ( = ?auto_322042 ?auto_322047 ) ) ( not ( = ?auto_322042 ?auto_322048 ) ) ( not ( = ?auto_322042 ?auto_322049 ) ) ( not ( = ?auto_322042 ?auto_322050 ) ) ( not ( = ?auto_322042 ?auto_322051 ) ) ( not ( = ?auto_322042 ?auto_322052 ) ) ( not ( = ?auto_322042 ?auto_322053 ) ) ( not ( = ?auto_322043 ?auto_322044 ) ) ( not ( = ?auto_322043 ?auto_322045 ) ) ( not ( = ?auto_322043 ?auto_322046 ) ) ( not ( = ?auto_322043 ?auto_322047 ) ) ( not ( = ?auto_322043 ?auto_322048 ) ) ( not ( = ?auto_322043 ?auto_322049 ) ) ( not ( = ?auto_322043 ?auto_322050 ) ) ( not ( = ?auto_322043 ?auto_322051 ) ) ( not ( = ?auto_322043 ?auto_322052 ) ) ( not ( = ?auto_322043 ?auto_322053 ) ) ( not ( = ?auto_322044 ?auto_322045 ) ) ( not ( = ?auto_322044 ?auto_322046 ) ) ( not ( = ?auto_322044 ?auto_322047 ) ) ( not ( = ?auto_322044 ?auto_322048 ) ) ( not ( = ?auto_322044 ?auto_322049 ) ) ( not ( = ?auto_322044 ?auto_322050 ) ) ( not ( = ?auto_322044 ?auto_322051 ) ) ( not ( = ?auto_322044 ?auto_322052 ) ) ( not ( = ?auto_322044 ?auto_322053 ) ) ( not ( = ?auto_322045 ?auto_322046 ) ) ( not ( = ?auto_322045 ?auto_322047 ) ) ( not ( = ?auto_322045 ?auto_322048 ) ) ( not ( = ?auto_322045 ?auto_322049 ) ) ( not ( = ?auto_322045 ?auto_322050 ) ) ( not ( = ?auto_322045 ?auto_322051 ) ) ( not ( = ?auto_322045 ?auto_322052 ) ) ( not ( = ?auto_322045 ?auto_322053 ) ) ( not ( = ?auto_322046 ?auto_322047 ) ) ( not ( = ?auto_322046 ?auto_322048 ) ) ( not ( = ?auto_322046 ?auto_322049 ) ) ( not ( = ?auto_322046 ?auto_322050 ) ) ( not ( = ?auto_322046 ?auto_322051 ) ) ( not ( = ?auto_322046 ?auto_322052 ) ) ( not ( = ?auto_322046 ?auto_322053 ) ) ( not ( = ?auto_322047 ?auto_322048 ) ) ( not ( = ?auto_322047 ?auto_322049 ) ) ( not ( = ?auto_322047 ?auto_322050 ) ) ( not ( = ?auto_322047 ?auto_322051 ) ) ( not ( = ?auto_322047 ?auto_322052 ) ) ( not ( = ?auto_322047 ?auto_322053 ) ) ( not ( = ?auto_322048 ?auto_322049 ) ) ( not ( = ?auto_322048 ?auto_322050 ) ) ( not ( = ?auto_322048 ?auto_322051 ) ) ( not ( = ?auto_322048 ?auto_322052 ) ) ( not ( = ?auto_322048 ?auto_322053 ) ) ( not ( = ?auto_322049 ?auto_322050 ) ) ( not ( = ?auto_322049 ?auto_322051 ) ) ( not ( = ?auto_322049 ?auto_322052 ) ) ( not ( = ?auto_322049 ?auto_322053 ) ) ( not ( = ?auto_322050 ?auto_322051 ) ) ( not ( = ?auto_322050 ?auto_322052 ) ) ( not ( = ?auto_322050 ?auto_322053 ) ) ( not ( = ?auto_322051 ?auto_322052 ) ) ( not ( = ?auto_322051 ?auto_322053 ) ) ( not ( = ?auto_322052 ?auto_322053 ) ) ( ON ?auto_322040 ?auto_322054 ) ( not ( = ?auto_322053 ?auto_322054 ) ) ( not ( = ?auto_322052 ?auto_322054 ) ) ( not ( = ?auto_322051 ?auto_322054 ) ) ( not ( = ?auto_322050 ?auto_322054 ) ) ( not ( = ?auto_322049 ?auto_322054 ) ) ( not ( = ?auto_322048 ?auto_322054 ) ) ( not ( = ?auto_322047 ?auto_322054 ) ) ( not ( = ?auto_322046 ?auto_322054 ) ) ( not ( = ?auto_322045 ?auto_322054 ) ) ( not ( = ?auto_322044 ?auto_322054 ) ) ( not ( = ?auto_322043 ?auto_322054 ) ) ( not ( = ?auto_322042 ?auto_322054 ) ) ( not ( = ?auto_322041 ?auto_322054 ) ) ( not ( = ?auto_322040 ?auto_322054 ) ) ( ON ?auto_322041 ?auto_322040 ) ( ON ?auto_322042 ?auto_322041 ) ( ON ?auto_322043 ?auto_322042 ) ( ON ?auto_322044 ?auto_322043 ) ( ON ?auto_322045 ?auto_322044 ) ( ON ?auto_322046 ?auto_322045 ) ( ON ?auto_322047 ?auto_322046 ) ( ON ?auto_322048 ?auto_322047 ) ( ON ?auto_322049 ?auto_322048 ) ( ON ?auto_322050 ?auto_322049 ) ( ON ?auto_322051 ?auto_322050 ) ( ON ?auto_322052 ?auto_322051 ) ( ON ?auto_322053 ?auto_322052 ) ( CLEAR ?auto_322053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_322053 ?auto_322052 ?auto_322051 ?auto_322050 ?auto_322049 ?auto_322048 ?auto_322047 ?auto_322046 ?auto_322045 ?auto_322044 ?auto_322043 ?auto_322042 ?auto_322041 ?auto_322040 )
      ( MAKE-14PILE ?auto_322040 ?auto_322041 ?auto_322042 ?auto_322043 ?auto_322044 ?auto_322045 ?auto_322046 ?auto_322047 ?auto_322048 ?auto_322049 ?auto_322050 ?auto_322051 ?auto_322052 ?auto_322053 ) )
  )

)

