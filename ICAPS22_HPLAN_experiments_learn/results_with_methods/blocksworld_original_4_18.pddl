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
      ?auto_16794 - BLOCK
      ?auto_16795 - BLOCK
      ?auto_16796 - BLOCK
      ?auto_16797 - BLOCK
    )
    :vars
    (
      ?auto_16798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16798 ?auto_16797 ) ( CLEAR ?auto_16798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16794 ) ( ON ?auto_16795 ?auto_16794 ) ( ON ?auto_16796 ?auto_16795 ) ( ON ?auto_16797 ?auto_16796 ) ( not ( = ?auto_16794 ?auto_16795 ) ) ( not ( = ?auto_16794 ?auto_16796 ) ) ( not ( = ?auto_16794 ?auto_16797 ) ) ( not ( = ?auto_16794 ?auto_16798 ) ) ( not ( = ?auto_16795 ?auto_16796 ) ) ( not ( = ?auto_16795 ?auto_16797 ) ) ( not ( = ?auto_16795 ?auto_16798 ) ) ( not ( = ?auto_16796 ?auto_16797 ) ) ( not ( = ?auto_16796 ?auto_16798 ) ) ( not ( = ?auto_16797 ?auto_16798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16798 ?auto_16797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16800 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16800 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16800 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16801 - BLOCK
    )
    :vars
    (
      ?auto_16802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16801 ?auto_16802 ) ( CLEAR ?auto_16801 ) ( HAND-EMPTY ) ( not ( = ?auto_16801 ?auto_16802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16801 ?auto_16802 )
      ( MAKE-1PILE ?auto_16801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16806 - BLOCK
      ?auto_16807 - BLOCK
      ?auto_16808 - BLOCK
    )
    :vars
    (
      ?auto_16809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16809 ?auto_16808 ) ( CLEAR ?auto_16809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16806 ) ( ON ?auto_16807 ?auto_16806 ) ( ON ?auto_16808 ?auto_16807 ) ( not ( = ?auto_16806 ?auto_16807 ) ) ( not ( = ?auto_16806 ?auto_16808 ) ) ( not ( = ?auto_16806 ?auto_16809 ) ) ( not ( = ?auto_16807 ?auto_16808 ) ) ( not ( = ?auto_16807 ?auto_16809 ) ) ( not ( = ?auto_16808 ?auto_16809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16809 ?auto_16808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16810 - BLOCK
      ?auto_16811 - BLOCK
      ?auto_16812 - BLOCK
    )
    :vars
    (
      ?auto_16813 - BLOCK
      ?auto_16814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16813 ?auto_16812 ) ( CLEAR ?auto_16813 ) ( ON-TABLE ?auto_16810 ) ( ON ?auto_16811 ?auto_16810 ) ( ON ?auto_16812 ?auto_16811 ) ( not ( = ?auto_16810 ?auto_16811 ) ) ( not ( = ?auto_16810 ?auto_16812 ) ) ( not ( = ?auto_16810 ?auto_16813 ) ) ( not ( = ?auto_16811 ?auto_16812 ) ) ( not ( = ?auto_16811 ?auto_16813 ) ) ( not ( = ?auto_16812 ?auto_16813 ) ) ( HOLDING ?auto_16814 ) ( not ( = ?auto_16810 ?auto_16814 ) ) ( not ( = ?auto_16811 ?auto_16814 ) ) ( not ( = ?auto_16812 ?auto_16814 ) ) ( not ( = ?auto_16813 ?auto_16814 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16814 )
      ( MAKE-3PILE ?auto_16810 ?auto_16811 ?auto_16812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16815 - BLOCK
      ?auto_16816 - BLOCK
      ?auto_16817 - BLOCK
    )
    :vars
    (
      ?auto_16818 - BLOCK
      ?auto_16819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16818 ?auto_16817 ) ( ON-TABLE ?auto_16815 ) ( ON ?auto_16816 ?auto_16815 ) ( ON ?auto_16817 ?auto_16816 ) ( not ( = ?auto_16815 ?auto_16816 ) ) ( not ( = ?auto_16815 ?auto_16817 ) ) ( not ( = ?auto_16815 ?auto_16818 ) ) ( not ( = ?auto_16816 ?auto_16817 ) ) ( not ( = ?auto_16816 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16815 ?auto_16819 ) ) ( not ( = ?auto_16816 ?auto_16819 ) ) ( not ( = ?auto_16817 ?auto_16819 ) ) ( not ( = ?auto_16818 ?auto_16819 ) ) ( ON ?auto_16819 ?auto_16818 ) ( CLEAR ?auto_16819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16815 ?auto_16816 ?auto_16817 ?auto_16818 )
      ( MAKE-3PILE ?auto_16815 ?auto_16816 ?auto_16817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16822 - BLOCK
      ?auto_16823 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16823 ) ( CLEAR ?auto_16822 ) ( ON-TABLE ?auto_16822 ) ( not ( = ?auto_16822 ?auto_16823 ) ) )
    :subtasks
    ( ( !STACK ?auto_16823 ?auto_16822 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16824 - BLOCK
      ?auto_16825 - BLOCK
    )
    :vars
    (
      ?auto_16826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16824 ) ( ON-TABLE ?auto_16824 ) ( not ( = ?auto_16824 ?auto_16825 ) ) ( ON ?auto_16825 ?auto_16826 ) ( CLEAR ?auto_16825 ) ( HAND-EMPTY ) ( not ( = ?auto_16824 ?auto_16826 ) ) ( not ( = ?auto_16825 ?auto_16826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16825 ?auto_16826 )
      ( MAKE-2PILE ?auto_16824 ?auto_16825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16827 - BLOCK
      ?auto_16828 - BLOCK
    )
    :vars
    (
      ?auto_16829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16827 ?auto_16828 ) ) ( ON ?auto_16828 ?auto_16829 ) ( CLEAR ?auto_16828 ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( not ( = ?auto_16828 ?auto_16829 ) ) ( HOLDING ?auto_16827 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16827 )
      ( MAKE-2PILE ?auto_16827 ?auto_16828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16830 - BLOCK
      ?auto_16831 - BLOCK
    )
    :vars
    (
      ?auto_16832 - BLOCK
      ?auto_16833 - BLOCK
      ?auto_16834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16830 ?auto_16831 ) ) ( ON ?auto_16831 ?auto_16832 ) ( not ( = ?auto_16830 ?auto_16832 ) ) ( not ( = ?auto_16831 ?auto_16832 ) ) ( ON ?auto_16830 ?auto_16831 ) ( CLEAR ?auto_16830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16833 ) ( ON ?auto_16834 ?auto_16833 ) ( ON ?auto_16832 ?auto_16834 ) ( not ( = ?auto_16833 ?auto_16834 ) ) ( not ( = ?auto_16833 ?auto_16832 ) ) ( not ( = ?auto_16833 ?auto_16831 ) ) ( not ( = ?auto_16833 ?auto_16830 ) ) ( not ( = ?auto_16834 ?auto_16832 ) ) ( not ( = ?auto_16834 ?auto_16831 ) ) ( not ( = ?auto_16834 ?auto_16830 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16833 ?auto_16834 ?auto_16832 ?auto_16831 )
      ( MAKE-2PILE ?auto_16830 ?auto_16831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16837 - BLOCK
      ?auto_16838 - BLOCK
    )
    :vars
    (
      ?auto_16839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16839 ?auto_16838 ) ( CLEAR ?auto_16839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16837 ) ( ON ?auto_16838 ?auto_16837 ) ( not ( = ?auto_16837 ?auto_16838 ) ) ( not ( = ?auto_16837 ?auto_16839 ) ) ( not ( = ?auto_16838 ?auto_16839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16839 ?auto_16838 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16840 - BLOCK
      ?auto_16841 - BLOCK
    )
    :vars
    (
      ?auto_16842 - BLOCK
      ?auto_16843 - BLOCK
      ?auto_16844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16842 ?auto_16841 ) ( CLEAR ?auto_16842 ) ( ON-TABLE ?auto_16840 ) ( ON ?auto_16841 ?auto_16840 ) ( not ( = ?auto_16840 ?auto_16841 ) ) ( not ( = ?auto_16840 ?auto_16842 ) ) ( not ( = ?auto_16841 ?auto_16842 ) ) ( HOLDING ?auto_16843 ) ( CLEAR ?auto_16844 ) ( not ( = ?auto_16840 ?auto_16843 ) ) ( not ( = ?auto_16840 ?auto_16844 ) ) ( not ( = ?auto_16841 ?auto_16843 ) ) ( not ( = ?auto_16841 ?auto_16844 ) ) ( not ( = ?auto_16842 ?auto_16843 ) ) ( not ( = ?auto_16842 ?auto_16844 ) ) ( not ( = ?auto_16843 ?auto_16844 ) ) )
    :subtasks
    ( ( !STACK ?auto_16843 ?auto_16844 )
      ( MAKE-2PILE ?auto_16840 ?auto_16841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16845 - BLOCK
      ?auto_16846 - BLOCK
    )
    :vars
    (
      ?auto_16847 - BLOCK
      ?auto_16849 - BLOCK
      ?auto_16848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16847 ?auto_16846 ) ( ON-TABLE ?auto_16845 ) ( ON ?auto_16846 ?auto_16845 ) ( not ( = ?auto_16845 ?auto_16846 ) ) ( not ( = ?auto_16845 ?auto_16847 ) ) ( not ( = ?auto_16846 ?auto_16847 ) ) ( CLEAR ?auto_16849 ) ( not ( = ?auto_16845 ?auto_16848 ) ) ( not ( = ?auto_16845 ?auto_16849 ) ) ( not ( = ?auto_16846 ?auto_16848 ) ) ( not ( = ?auto_16846 ?auto_16849 ) ) ( not ( = ?auto_16847 ?auto_16848 ) ) ( not ( = ?auto_16847 ?auto_16849 ) ) ( not ( = ?auto_16848 ?auto_16849 ) ) ( ON ?auto_16848 ?auto_16847 ) ( CLEAR ?auto_16848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16845 ?auto_16846 ?auto_16847 )
      ( MAKE-2PILE ?auto_16845 ?auto_16846 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16850 - BLOCK
      ?auto_16851 - BLOCK
    )
    :vars
    (
      ?auto_16853 - BLOCK
      ?auto_16852 - BLOCK
      ?auto_16854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16853 ?auto_16851 ) ( ON-TABLE ?auto_16850 ) ( ON ?auto_16851 ?auto_16850 ) ( not ( = ?auto_16850 ?auto_16851 ) ) ( not ( = ?auto_16850 ?auto_16853 ) ) ( not ( = ?auto_16851 ?auto_16853 ) ) ( not ( = ?auto_16850 ?auto_16852 ) ) ( not ( = ?auto_16850 ?auto_16854 ) ) ( not ( = ?auto_16851 ?auto_16852 ) ) ( not ( = ?auto_16851 ?auto_16854 ) ) ( not ( = ?auto_16853 ?auto_16852 ) ) ( not ( = ?auto_16853 ?auto_16854 ) ) ( not ( = ?auto_16852 ?auto_16854 ) ) ( ON ?auto_16852 ?auto_16853 ) ( CLEAR ?auto_16852 ) ( HOLDING ?auto_16854 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16854 )
      ( MAKE-2PILE ?auto_16850 ?auto_16851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16855 - BLOCK
      ?auto_16856 - BLOCK
    )
    :vars
    (
      ?auto_16859 - BLOCK
      ?auto_16858 - BLOCK
      ?auto_16857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16859 ?auto_16856 ) ( ON-TABLE ?auto_16855 ) ( ON ?auto_16856 ?auto_16855 ) ( not ( = ?auto_16855 ?auto_16856 ) ) ( not ( = ?auto_16855 ?auto_16859 ) ) ( not ( = ?auto_16856 ?auto_16859 ) ) ( not ( = ?auto_16855 ?auto_16858 ) ) ( not ( = ?auto_16855 ?auto_16857 ) ) ( not ( = ?auto_16856 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16857 ) ) ( not ( = ?auto_16859 ?auto_16858 ) ) ( not ( = ?auto_16859 ?auto_16857 ) ) ( not ( = ?auto_16858 ?auto_16857 ) ) ( ON ?auto_16858 ?auto_16859 ) ( ON ?auto_16857 ?auto_16858 ) ( CLEAR ?auto_16857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16855 ?auto_16856 ?auto_16859 ?auto_16858 )
      ( MAKE-2PILE ?auto_16855 ?auto_16856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16863 - BLOCK
      ?auto_16864 - BLOCK
      ?auto_16865 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16865 ) ( CLEAR ?auto_16864 ) ( ON-TABLE ?auto_16863 ) ( ON ?auto_16864 ?auto_16863 ) ( not ( = ?auto_16863 ?auto_16864 ) ) ( not ( = ?auto_16863 ?auto_16865 ) ) ( not ( = ?auto_16864 ?auto_16865 ) ) )
    :subtasks
    ( ( !STACK ?auto_16865 ?auto_16864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16866 - BLOCK
      ?auto_16867 - BLOCK
      ?auto_16868 - BLOCK
    )
    :vars
    (
      ?auto_16869 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16867 ) ( ON-TABLE ?auto_16866 ) ( ON ?auto_16867 ?auto_16866 ) ( not ( = ?auto_16866 ?auto_16867 ) ) ( not ( = ?auto_16866 ?auto_16868 ) ) ( not ( = ?auto_16867 ?auto_16868 ) ) ( ON ?auto_16868 ?auto_16869 ) ( CLEAR ?auto_16868 ) ( HAND-EMPTY ) ( not ( = ?auto_16866 ?auto_16869 ) ) ( not ( = ?auto_16867 ?auto_16869 ) ) ( not ( = ?auto_16868 ?auto_16869 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16868 ?auto_16869 )
      ( MAKE-3PILE ?auto_16866 ?auto_16867 ?auto_16868 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16870 - BLOCK
      ?auto_16871 - BLOCK
      ?auto_16872 - BLOCK
    )
    :vars
    (
      ?auto_16873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16870 ) ( not ( = ?auto_16870 ?auto_16871 ) ) ( not ( = ?auto_16870 ?auto_16872 ) ) ( not ( = ?auto_16871 ?auto_16872 ) ) ( ON ?auto_16872 ?auto_16873 ) ( CLEAR ?auto_16872 ) ( not ( = ?auto_16870 ?auto_16873 ) ) ( not ( = ?auto_16871 ?auto_16873 ) ) ( not ( = ?auto_16872 ?auto_16873 ) ) ( HOLDING ?auto_16871 ) ( CLEAR ?auto_16870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16870 ?auto_16871 )
      ( MAKE-3PILE ?auto_16870 ?auto_16871 ?auto_16872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16874 - BLOCK
      ?auto_16875 - BLOCK
      ?auto_16876 - BLOCK
    )
    :vars
    (
      ?auto_16877 - BLOCK
      ?auto_16878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16874 ) ( not ( = ?auto_16874 ?auto_16875 ) ) ( not ( = ?auto_16874 ?auto_16876 ) ) ( not ( = ?auto_16875 ?auto_16876 ) ) ( ON ?auto_16876 ?auto_16877 ) ( not ( = ?auto_16874 ?auto_16877 ) ) ( not ( = ?auto_16875 ?auto_16877 ) ) ( not ( = ?auto_16876 ?auto_16877 ) ) ( CLEAR ?auto_16874 ) ( ON ?auto_16875 ?auto_16876 ) ( CLEAR ?auto_16875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16878 ) ( ON ?auto_16877 ?auto_16878 ) ( not ( = ?auto_16878 ?auto_16877 ) ) ( not ( = ?auto_16878 ?auto_16876 ) ) ( not ( = ?auto_16878 ?auto_16875 ) ) ( not ( = ?auto_16874 ?auto_16878 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16878 ?auto_16877 ?auto_16876 )
      ( MAKE-3PILE ?auto_16874 ?auto_16875 ?auto_16876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16879 - BLOCK
      ?auto_16880 - BLOCK
      ?auto_16881 - BLOCK
    )
    :vars
    (
      ?auto_16882 - BLOCK
      ?auto_16883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16879 ?auto_16880 ) ) ( not ( = ?auto_16879 ?auto_16881 ) ) ( not ( = ?auto_16880 ?auto_16881 ) ) ( ON ?auto_16881 ?auto_16882 ) ( not ( = ?auto_16879 ?auto_16882 ) ) ( not ( = ?auto_16880 ?auto_16882 ) ) ( not ( = ?auto_16881 ?auto_16882 ) ) ( ON ?auto_16880 ?auto_16881 ) ( CLEAR ?auto_16880 ) ( ON-TABLE ?auto_16883 ) ( ON ?auto_16882 ?auto_16883 ) ( not ( = ?auto_16883 ?auto_16882 ) ) ( not ( = ?auto_16883 ?auto_16881 ) ) ( not ( = ?auto_16883 ?auto_16880 ) ) ( not ( = ?auto_16879 ?auto_16883 ) ) ( HOLDING ?auto_16879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16879 )
      ( MAKE-3PILE ?auto_16879 ?auto_16880 ?auto_16881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16884 - BLOCK
      ?auto_16885 - BLOCK
      ?auto_16886 - BLOCK
    )
    :vars
    (
      ?auto_16888 - BLOCK
      ?auto_16887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16884 ?auto_16885 ) ) ( not ( = ?auto_16884 ?auto_16886 ) ) ( not ( = ?auto_16885 ?auto_16886 ) ) ( ON ?auto_16886 ?auto_16888 ) ( not ( = ?auto_16884 ?auto_16888 ) ) ( not ( = ?auto_16885 ?auto_16888 ) ) ( not ( = ?auto_16886 ?auto_16888 ) ) ( ON ?auto_16885 ?auto_16886 ) ( ON-TABLE ?auto_16887 ) ( ON ?auto_16888 ?auto_16887 ) ( not ( = ?auto_16887 ?auto_16888 ) ) ( not ( = ?auto_16887 ?auto_16886 ) ) ( not ( = ?auto_16887 ?auto_16885 ) ) ( not ( = ?auto_16884 ?auto_16887 ) ) ( ON ?auto_16884 ?auto_16885 ) ( CLEAR ?auto_16884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16887 ?auto_16888 ?auto_16886 ?auto_16885 )
      ( MAKE-3PILE ?auto_16884 ?auto_16885 ?auto_16886 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16890 - BLOCK
    )
    :vars
    (
      ?auto_16891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16891 ?auto_16890 ) ( CLEAR ?auto_16891 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16890 ) ( not ( = ?auto_16890 ?auto_16891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16891 ?auto_16890 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16892 - BLOCK
    )
    :vars
    (
      ?auto_16893 - BLOCK
      ?auto_16894 - BLOCK
      ?auto_16895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16893 ?auto_16892 ) ( CLEAR ?auto_16893 ) ( ON-TABLE ?auto_16892 ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( HOLDING ?auto_16894 ) ( CLEAR ?auto_16895 ) ( not ( = ?auto_16892 ?auto_16894 ) ) ( not ( = ?auto_16892 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16894 ?auto_16895 ) ) )
    :subtasks
    ( ( !STACK ?auto_16894 ?auto_16895 )
      ( MAKE-1PILE ?auto_16892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16896 - BLOCK
    )
    :vars
    (
      ?auto_16899 - BLOCK
      ?auto_16898 - BLOCK
      ?auto_16897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16899 ?auto_16896 ) ( ON-TABLE ?auto_16896 ) ( not ( = ?auto_16896 ?auto_16899 ) ) ( CLEAR ?auto_16898 ) ( not ( = ?auto_16896 ?auto_16897 ) ) ( not ( = ?auto_16896 ?auto_16898 ) ) ( not ( = ?auto_16899 ?auto_16897 ) ) ( not ( = ?auto_16899 ?auto_16898 ) ) ( not ( = ?auto_16897 ?auto_16898 ) ) ( ON ?auto_16897 ?auto_16899 ) ( CLEAR ?auto_16897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16896 ?auto_16899 )
      ( MAKE-1PILE ?auto_16896 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16900 - BLOCK
    )
    :vars
    (
      ?auto_16903 - BLOCK
      ?auto_16901 - BLOCK
      ?auto_16902 - BLOCK
      ?auto_16904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16903 ?auto_16900 ) ( ON-TABLE ?auto_16900 ) ( not ( = ?auto_16900 ?auto_16903 ) ) ( not ( = ?auto_16900 ?auto_16901 ) ) ( not ( = ?auto_16900 ?auto_16902 ) ) ( not ( = ?auto_16903 ?auto_16901 ) ) ( not ( = ?auto_16903 ?auto_16902 ) ) ( not ( = ?auto_16901 ?auto_16902 ) ) ( ON ?auto_16901 ?auto_16903 ) ( CLEAR ?auto_16901 ) ( HOLDING ?auto_16902 ) ( CLEAR ?auto_16904 ) ( ON-TABLE ?auto_16904 ) ( not ( = ?auto_16904 ?auto_16902 ) ) ( not ( = ?auto_16900 ?auto_16904 ) ) ( not ( = ?auto_16903 ?auto_16904 ) ) ( not ( = ?auto_16901 ?auto_16904 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16904 ?auto_16902 )
      ( MAKE-1PILE ?auto_16900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16905 - BLOCK
    )
    :vars
    (
      ?auto_16906 - BLOCK
      ?auto_16907 - BLOCK
      ?auto_16909 - BLOCK
      ?auto_16908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16906 ?auto_16905 ) ( ON-TABLE ?auto_16905 ) ( not ( = ?auto_16905 ?auto_16906 ) ) ( not ( = ?auto_16905 ?auto_16907 ) ) ( not ( = ?auto_16905 ?auto_16909 ) ) ( not ( = ?auto_16906 ?auto_16907 ) ) ( not ( = ?auto_16906 ?auto_16909 ) ) ( not ( = ?auto_16907 ?auto_16909 ) ) ( ON ?auto_16907 ?auto_16906 ) ( CLEAR ?auto_16908 ) ( ON-TABLE ?auto_16908 ) ( not ( = ?auto_16908 ?auto_16909 ) ) ( not ( = ?auto_16905 ?auto_16908 ) ) ( not ( = ?auto_16906 ?auto_16908 ) ) ( not ( = ?auto_16907 ?auto_16908 ) ) ( ON ?auto_16909 ?auto_16907 ) ( CLEAR ?auto_16909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16905 ?auto_16906 ?auto_16907 )
      ( MAKE-1PILE ?auto_16905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16910 - BLOCK
    )
    :vars
    (
      ?auto_16914 - BLOCK
      ?auto_16912 - BLOCK
      ?auto_16911 - BLOCK
      ?auto_16913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16914 ?auto_16910 ) ( ON-TABLE ?auto_16910 ) ( not ( = ?auto_16910 ?auto_16914 ) ) ( not ( = ?auto_16910 ?auto_16912 ) ) ( not ( = ?auto_16910 ?auto_16911 ) ) ( not ( = ?auto_16914 ?auto_16912 ) ) ( not ( = ?auto_16914 ?auto_16911 ) ) ( not ( = ?auto_16912 ?auto_16911 ) ) ( ON ?auto_16912 ?auto_16914 ) ( not ( = ?auto_16913 ?auto_16911 ) ) ( not ( = ?auto_16910 ?auto_16913 ) ) ( not ( = ?auto_16914 ?auto_16913 ) ) ( not ( = ?auto_16912 ?auto_16913 ) ) ( ON ?auto_16911 ?auto_16912 ) ( CLEAR ?auto_16911 ) ( HOLDING ?auto_16913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16913 )
      ( MAKE-1PILE ?auto_16910 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16915 - BLOCK
    )
    :vars
    (
      ?auto_16917 - BLOCK
      ?auto_16919 - BLOCK
      ?auto_16918 - BLOCK
      ?auto_16916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16917 ?auto_16915 ) ( ON-TABLE ?auto_16915 ) ( not ( = ?auto_16915 ?auto_16917 ) ) ( not ( = ?auto_16915 ?auto_16919 ) ) ( not ( = ?auto_16915 ?auto_16918 ) ) ( not ( = ?auto_16917 ?auto_16919 ) ) ( not ( = ?auto_16917 ?auto_16918 ) ) ( not ( = ?auto_16919 ?auto_16918 ) ) ( ON ?auto_16919 ?auto_16917 ) ( not ( = ?auto_16916 ?auto_16918 ) ) ( not ( = ?auto_16915 ?auto_16916 ) ) ( not ( = ?auto_16917 ?auto_16916 ) ) ( not ( = ?auto_16919 ?auto_16916 ) ) ( ON ?auto_16918 ?auto_16919 ) ( ON ?auto_16916 ?auto_16918 ) ( CLEAR ?auto_16916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16915 ?auto_16917 ?auto_16919 ?auto_16918 )
      ( MAKE-1PILE ?auto_16915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16924 - BLOCK
      ?auto_16925 - BLOCK
      ?auto_16926 - BLOCK
      ?auto_16927 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16927 ) ( CLEAR ?auto_16926 ) ( ON-TABLE ?auto_16924 ) ( ON ?auto_16925 ?auto_16924 ) ( ON ?auto_16926 ?auto_16925 ) ( not ( = ?auto_16924 ?auto_16925 ) ) ( not ( = ?auto_16924 ?auto_16926 ) ) ( not ( = ?auto_16924 ?auto_16927 ) ) ( not ( = ?auto_16925 ?auto_16926 ) ) ( not ( = ?auto_16925 ?auto_16927 ) ) ( not ( = ?auto_16926 ?auto_16927 ) ) )
    :subtasks
    ( ( !STACK ?auto_16927 ?auto_16926 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16928 - BLOCK
      ?auto_16929 - BLOCK
      ?auto_16930 - BLOCK
      ?auto_16931 - BLOCK
    )
    :vars
    (
      ?auto_16932 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16930 ) ( ON-TABLE ?auto_16928 ) ( ON ?auto_16929 ?auto_16928 ) ( ON ?auto_16930 ?auto_16929 ) ( not ( = ?auto_16928 ?auto_16929 ) ) ( not ( = ?auto_16928 ?auto_16930 ) ) ( not ( = ?auto_16928 ?auto_16931 ) ) ( not ( = ?auto_16929 ?auto_16930 ) ) ( not ( = ?auto_16929 ?auto_16931 ) ) ( not ( = ?auto_16930 ?auto_16931 ) ) ( ON ?auto_16931 ?auto_16932 ) ( CLEAR ?auto_16931 ) ( HAND-EMPTY ) ( not ( = ?auto_16928 ?auto_16932 ) ) ( not ( = ?auto_16929 ?auto_16932 ) ) ( not ( = ?auto_16930 ?auto_16932 ) ) ( not ( = ?auto_16931 ?auto_16932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16931 ?auto_16932 )
      ( MAKE-4PILE ?auto_16928 ?auto_16929 ?auto_16930 ?auto_16931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16933 - BLOCK
      ?auto_16934 - BLOCK
      ?auto_16935 - BLOCK
      ?auto_16936 - BLOCK
    )
    :vars
    (
      ?auto_16937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16933 ) ( ON ?auto_16934 ?auto_16933 ) ( not ( = ?auto_16933 ?auto_16934 ) ) ( not ( = ?auto_16933 ?auto_16935 ) ) ( not ( = ?auto_16933 ?auto_16936 ) ) ( not ( = ?auto_16934 ?auto_16935 ) ) ( not ( = ?auto_16934 ?auto_16936 ) ) ( not ( = ?auto_16935 ?auto_16936 ) ) ( ON ?auto_16936 ?auto_16937 ) ( CLEAR ?auto_16936 ) ( not ( = ?auto_16933 ?auto_16937 ) ) ( not ( = ?auto_16934 ?auto_16937 ) ) ( not ( = ?auto_16935 ?auto_16937 ) ) ( not ( = ?auto_16936 ?auto_16937 ) ) ( HOLDING ?auto_16935 ) ( CLEAR ?auto_16934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16933 ?auto_16934 ?auto_16935 )
      ( MAKE-4PILE ?auto_16933 ?auto_16934 ?auto_16935 ?auto_16936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16938 - BLOCK
      ?auto_16939 - BLOCK
      ?auto_16940 - BLOCK
      ?auto_16941 - BLOCK
    )
    :vars
    (
      ?auto_16942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16938 ) ( ON ?auto_16939 ?auto_16938 ) ( not ( = ?auto_16938 ?auto_16939 ) ) ( not ( = ?auto_16938 ?auto_16940 ) ) ( not ( = ?auto_16938 ?auto_16941 ) ) ( not ( = ?auto_16939 ?auto_16940 ) ) ( not ( = ?auto_16939 ?auto_16941 ) ) ( not ( = ?auto_16940 ?auto_16941 ) ) ( ON ?auto_16941 ?auto_16942 ) ( not ( = ?auto_16938 ?auto_16942 ) ) ( not ( = ?auto_16939 ?auto_16942 ) ) ( not ( = ?auto_16940 ?auto_16942 ) ) ( not ( = ?auto_16941 ?auto_16942 ) ) ( CLEAR ?auto_16939 ) ( ON ?auto_16940 ?auto_16941 ) ( CLEAR ?auto_16940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16942 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16942 ?auto_16941 )
      ( MAKE-4PILE ?auto_16938 ?auto_16939 ?auto_16940 ?auto_16941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16943 - BLOCK
      ?auto_16944 - BLOCK
      ?auto_16945 - BLOCK
      ?auto_16946 - BLOCK
    )
    :vars
    (
      ?auto_16947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16943 ) ( not ( = ?auto_16943 ?auto_16944 ) ) ( not ( = ?auto_16943 ?auto_16945 ) ) ( not ( = ?auto_16943 ?auto_16946 ) ) ( not ( = ?auto_16944 ?auto_16945 ) ) ( not ( = ?auto_16944 ?auto_16946 ) ) ( not ( = ?auto_16945 ?auto_16946 ) ) ( ON ?auto_16946 ?auto_16947 ) ( not ( = ?auto_16943 ?auto_16947 ) ) ( not ( = ?auto_16944 ?auto_16947 ) ) ( not ( = ?auto_16945 ?auto_16947 ) ) ( not ( = ?auto_16946 ?auto_16947 ) ) ( ON ?auto_16945 ?auto_16946 ) ( CLEAR ?auto_16945 ) ( ON-TABLE ?auto_16947 ) ( HOLDING ?auto_16944 ) ( CLEAR ?auto_16943 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16943 ?auto_16944 )
      ( MAKE-4PILE ?auto_16943 ?auto_16944 ?auto_16945 ?auto_16946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16948 - BLOCK
      ?auto_16949 - BLOCK
      ?auto_16950 - BLOCK
      ?auto_16951 - BLOCK
    )
    :vars
    (
      ?auto_16952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16948 ) ( not ( = ?auto_16948 ?auto_16949 ) ) ( not ( = ?auto_16948 ?auto_16950 ) ) ( not ( = ?auto_16948 ?auto_16951 ) ) ( not ( = ?auto_16949 ?auto_16950 ) ) ( not ( = ?auto_16949 ?auto_16951 ) ) ( not ( = ?auto_16950 ?auto_16951 ) ) ( ON ?auto_16951 ?auto_16952 ) ( not ( = ?auto_16948 ?auto_16952 ) ) ( not ( = ?auto_16949 ?auto_16952 ) ) ( not ( = ?auto_16950 ?auto_16952 ) ) ( not ( = ?auto_16951 ?auto_16952 ) ) ( ON ?auto_16950 ?auto_16951 ) ( ON-TABLE ?auto_16952 ) ( CLEAR ?auto_16948 ) ( ON ?auto_16949 ?auto_16950 ) ( CLEAR ?auto_16949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16952 ?auto_16951 ?auto_16950 )
      ( MAKE-4PILE ?auto_16948 ?auto_16949 ?auto_16950 ?auto_16951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16953 - BLOCK
      ?auto_16954 - BLOCK
      ?auto_16955 - BLOCK
      ?auto_16956 - BLOCK
    )
    :vars
    (
      ?auto_16957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16953 ?auto_16954 ) ) ( not ( = ?auto_16953 ?auto_16955 ) ) ( not ( = ?auto_16953 ?auto_16956 ) ) ( not ( = ?auto_16954 ?auto_16955 ) ) ( not ( = ?auto_16954 ?auto_16956 ) ) ( not ( = ?auto_16955 ?auto_16956 ) ) ( ON ?auto_16956 ?auto_16957 ) ( not ( = ?auto_16953 ?auto_16957 ) ) ( not ( = ?auto_16954 ?auto_16957 ) ) ( not ( = ?auto_16955 ?auto_16957 ) ) ( not ( = ?auto_16956 ?auto_16957 ) ) ( ON ?auto_16955 ?auto_16956 ) ( ON-TABLE ?auto_16957 ) ( ON ?auto_16954 ?auto_16955 ) ( CLEAR ?auto_16954 ) ( HOLDING ?auto_16953 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16953 )
      ( MAKE-4PILE ?auto_16953 ?auto_16954 ?auto_16955 ?auto_16956 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16958 - BLOCK
      ?auto_16959 - BLOCK
      ?auto_16960 - BLOCK
      ?auto_16961 - BLOCK
    )
    :vars
    (
      ?auto_16962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16958 ?auto_16959 ) ) ( not ( = ?auto_16958 ?auto_16960 ) ) ( not ( = ?auto_16958 ?auto_16961 ) ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( not ( = ?auto_16959 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16961 ) ) ( ON ?auto_16961 ?auto_16962 ) ( not ( = ?auto_16958 ?auto_16962 ) ) ( not ( = ?auto_16959 ?auto_16962 ) ) ( not ( = ?auto_16960 ?auto_16962 ) ) ( not ( = ?auto_16961 ?auto_16962 ) ) ( ON ?auto_16960 ?auto_16961 ) ( ON-TABLE ?auto_16962 ) ( ON ?auto_16959 ?auto_16960 ) ( ON ?auto_16958 ?auto_16959 ) ( CLEAR ?auto_16958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16962 ?auto_16961 ?auto_16960 ?auto_16959 )
      ( MAKE-4PILE ?auto_16958 ?auto_16959 ?auto_16960 ?auto_16961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16966 - BLOCK
      ?auto_16967 - BLOCK
      ?auto_16968 - BLOCK
    )
    :vars
    (
      ?auto_16969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16969 ?auto_16968 ) ( CLEAR ?auto_16969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16966 ) ( ON ?auto_16967 ?auto_16966 ) ( ON ?auto_16968 ?auto_16967 ) ( not ( = ?auto_16966 ?auto_16967 ) ) ( not ( = ?auto_16966 ?auto_16968 ) ) ( not ( = ?auto_16966 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16968 ?auto_16969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16969 ?auto_16968 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16979 - BLOCK
      ?auto_16980 - BLOCK
      ?auto_16981 - BLOCK
    )
    :vars
    (
      ?auto_16982 - BLOCK
      ?auto_16983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16979 ) ( ON ?auto_16980 ?auto_16979 ) ( not ( = ?auto_16979 ?auto_16980 ) ) ( not ( = ?auto_16979 ?auto_16981 ) ) ( not ( = ?auto_16979 ?auto_16982 ) ) ( not ( = ?auto_16980 ?auto_16981 ) ) ( not ( = ?auto_16980 ?auto_16982 ) ) ( not ( = ?auto_16981 ?auto_16982 ) ) ( ON ?auto_16982 ?auto_16983 ) ( CLEAR ?auto_16982 ) ( not ( = ?auto_16979 ?auto_16983 ) ) ( not ( = ?auto_16980 ?auto_16983 ) ) ( not ( = ?auto_16981 ?auto_16983 ) ) ( not ( = ?auto_16982 ?auto_16983 ) ) ( HOLDING ?auto_16981 ) ( CLEAR ?auto_16980 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16979 ?auto_16980 ?auto_16981 ?auto_16982 )
      ( MAKE-3PILE ?auto_16979 ?auto_16980 ?auto_16981 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16984 - BLOCK
      ?auto_16985 - BLOCK
      ?auto_16986 - BLOCK
    )
    :vars
    (
      ?auto_16988 - BLOCK
      ?auto_16987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16984 ) ( ON ?auto_16985 ?auto_16984 ) ( not ( = ?auto_16984 ?auto_16985 ) ) ( not ( = ?auto_16984 ?auto_16986 ) ) ( not ( = ?auto_16984 ?auto_16988 ) ) ( not ( = ?auto_16985 ?auto_16986 ) ) ( not ( = ?auto_16985 ?auto_16988 ) ) ( not ( = ?auto_16986 ?auto_16988 ) ) ( ON ?auto_16988 ?auto_16987 ) ( not ( = ?auto_16984 ?auto_16987 ) ) ( not ( = ?auto_16985 ?auto_16987 ) ) ( not ( = ?auto_16986 ?auto_16987 ) ) ( not ( = ?auto_16988 ?auto_16987 ) ) ( CLEAR ?auto_16985 ) ( ON ?auto_16986 ?auto_16988 ) ( CLEAR ?auto_16986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16987 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16987 ?auto_16988 )
      ( MAKE-3PILE ?auto_16984 ?auto_16985 ?auto_16986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16989 - BLOCK
      ?auto_16990 - BLOCK
      ?auto_16991 - BLOCK
    )
    :vars
    (
      ?auto_16993 - BLOCK
      ?auto_16992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16989 ) ( not ( = ?auto_16989 ?auto_16990 ) ) ( not ( = ?auto_16989 ?auto_16991 ) ) ( not ( = ?auto_16989 ?auto_16993 ) ) ( not ( = ?auto_16990 ?auto_16991 ) ) ( not ( = ?auto_16990 ?auto_16993 ) ) ( not ( = ?auto_16991 ?auto_16993 ) ) ( ON ?auto_16993 ?auto_16992 ) ( not ( = ?auto_16989 ?auto_16992 ) ) ( not ( = ?auto_16990 ?auto_16992 ) ) ( not ( = ?auto_16991 ?auto_16992 ) ) ( not ( = ?auto_16993 ?auto_16992 ) ) ( ON ?auto_16991 ?auto_16993 ) ( CLEAR ?auto_16991 ) ( ON-TABLE ?auto_16992 ) ( HOLDING ?auto_16990 ) ( CLEAR ?auto_16989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16989 ?auto_16990 )
      ( MAKE-3PILE ?auto_16989 ?auto_16990 ?auto_16991 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16994 - BLOCK
      ?auto_16995 - BLOCK
      ?auto_16996 - BLOCK
    )
    :vars
    (
      ?auto_16998 - BLOCK
      ?auto_16997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16994 ) ( not ( = ?auto_16994 ?auto_16995 ) ) ( not ( = ?auto_16994 ?auto_16996 ) ) ( not ( = ?auto_16994 ?auto_16998 ) ) ( not ( = ?auto_16995 ?auto_16996 ) ) ( not ( = ?auto_16995 ?auto_16998 ) ) ( not ( = ?auto_16996 ?auto_16998 ) ) ( ON ?auto_16998 ?auto_16997 ) ( not ( = ?auto_16994 ?auto_16997 ) ) ( not ( = ?auto_16995 ?auto_16997 ) ) ( not ( = ?auto_16996 ?auto_16997 ) ) ( not ( = ?auto_16998 ?auto_16997 ) ) ( ON ?auto_16996 ?auto_16998 ) ( ON-TABLE ?auto_16997 ) ( CLEAR ?auto_16994 ) ( ON ?auto_16995 ?auto_16996 ) ( CLEAR ?auto_16995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16997 ?auto_16998 ?auto_16996 )
      ( MAKE-3PILE ?auto_16994 ?auto_16995 ?auto_16996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16999 - BLOCK
      ?auto_17000 - BLOCK
      ?auto_17001 - BLOCK
    )
    :vars
    (
      ?auto_17002 - BLOCK
      ?auto_17003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16999 ?auto_17000 ) ) ( not ( = ?auto_16999 ?auto_17001 ) ) ( not ( = ?auto_16999 ?auto_17002 ) ) ( not ( = ?auto_17000 ?auto_17001 ) ) ( not ( = ?auto_17000 ?auto_17002 ) ) ( not ( = ?auto_17001 ?auto_17002 ) ) ( ON ?auto_17002 ?auto_17003 ) ( not ( = ?auto_16999 ?auto_17003 ) ) ( not ( = ?auto_17000 ?auto_17003 ) ) ( not ( = ?auto_17001 ?auto_17003 ) ) ( not ( = ?auto_17002 ?auto_17003 ) ) ( ON ?auto_17001 ?auto_17002 ) ( ON-TABLE ?auto_17003 ) ( ON ?auto_17000 ?auto_17001 ) ( CLEAR ?auto_17000 ) ( HOLDING ?auto_16999 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16999 )
      ( MAKE-3PILE ?auto_16999 ?auto_17000 ?auto_17001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17004 - BLOCK
      ?auto_17005 - BLOCK
      ?auto_17006 - BLOCK
    )
    :vars
    (
      ?auto_17007 - BLOCK
      ?auto_17008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17004 ?auto_17005 ) ) ( not ( = ?auto_17004 ?auto_17006 ) ) ( not ( = ?auto_17004 ?auto_17007 ) ) ( not ( = ?auto_17005 ?auto_17006 ) ) ( not ( = ?auto_17005 ?auto_17007 ) ) ( not ( = ?auto_17006 ?auto_17007 ) ) ( ON ?auto_17007 ?auto_17008 ) ( not ( = ?auto_17004 ?auto_17008 ) ) ( not ( = ?auto_17005 ?auto_17008 ) ) ( not ( = ?auto_17006 ?auto_17008 ) ) ( not ( = ?auto_17007 ?auto_17008 ) ) ( ON ?auto_17006 ?auto_17007 ) ( ON-TABLE ?auto_17008 ) ( ON ?auto_17005 ?auto_17006 ) ( ON ?auto_17004 ?auto_17005 ) ( CLEAR ?auto_17004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17008 ?auto_17007 ?auto_17006 ?auto_17005 )
      ( MAKE-3PILE ?auto_17004 ?auto_17005 ?auto_17006 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17010 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17010 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17010 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17011 - BLOCK
    )
    :vars
    (
      ?auto_17012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17011 ?auto_17012 ) ( CLEAR ?auto_17011 ) ( HAND-EMPTY ) ( not ( = ?auto_17011 ?auto_17012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17011 ?auto_17012 )
      ( MAKE-1PILE ?auto_17011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17013 - BLOCK
    )
    :vars
    (
      ?auto_17014 - BLOCK
      ?auto_17015 - BLOCK
      ?auto_17016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17013 ?auto_17014 ) ) ( HOLDING ?auto_17013 ) ( CLEAR ?auto_17014 ) ( ON-TABLE ?auto_17015 ) ( ON ?auto_17016 ?auto_17015 ) ( ON ?auto_17014 ?auto_17016 ) ( not ( = ?auto_17015 ?auto_17016 ) ) ( not ( = ?auto_17015 ?auto_17014 ) ) ( not ( = ?auto_17015 ?auto_17013 ) ) ( not ( = ?auto_17016 ?auto_17014 ) ) ( not ( = ?auto_17016 ?auto_17013 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17015 ?auto_17016 ?auto_17014 ?auto_17013 )
      ( MAKE-1PILE ?auto_17013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17017 - BLOCK
    )
    :vars
    (
      ?auto_17019 - BLOCK
      ?auto_17020 - BLOCK
      ?auto_17018 - BLOCK
      ?auto_17021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17017 ?auto_17019 ) ) ( CLEAR ?auto_17019 ) ( ON-TABLE ?auto_17020 ) ( ON ?auto_17018 ?auto_17020 ) ( ON ?auto_17019 ?auto_17018 ) ( not ( = ?auto_17020 ?auto_17018 ) ) ( not ( = ?auto_17020 ?auto_17019 ) ) ( not ( = ?auto_17020 ?auto_17017 ) ) ( not ( = ?auto_17018 ?auto_17019 ) ) ( not ( = ?auto_17018 ?auto_17017 ) ) ( ON ?auto_17017 ?auto_17021 ) ( CLEAR ?auto_17017 ) ( HAND-EMPTY ) ( not ( = ?auto_17017 ?auto_17021 ) ) ( not ( = ?auto_17019 ?auto_17021 ) ) ( not ( = ?auto_17020 ?auto_17021 ) ) ( not ( = ?auto_17018 ?auto_17021 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17017 ?auto_17021 )
      ( MAKE-1PILE ?auto_17017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17022 - BLOCK
    )
    :vars
    (
      ?auto_17025 - BLOCK
      ?auto_17024 - BLOCK
      ?auto_17026 - BLOCK
      ?auto_17023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17022 ?auto_17025 ) ) ( ON-TABLE ?auto_17024 ) ( ON ?auto_17026 ?auto_17024 ) ( not ( = ?auto_17024 ?auto_17026 ) ) ( not ( = ?auto_17024 ?auto_17025 ) ) ( not ( = ?auto_17024 ?auto_17022 ) ) ( not ( = ?auto_17026 ?auto_17025 ) ) ( not ( = ?auto_17026 ?auto_17022 ) ) ( ON ?auto_17022 ?auto_17023 ) ( CLEAR ?auto_17022 ) ( not ( = ?auto_17022 ?auto_17023 ) ) ( not ( = ?auto_17025 ?auto_17023 ) ) ( not ( = ?auto_17024 ?auto_17023 ) ) ( not ( = ?auto_17026 ?auto_17023 ) ) ( HOLDING ?auto_17025 ) ( CLEAR ?auto_17026 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17024 ?auto_17026 ?auto_17025 )
      ( MAKE-1PILE ?auto_17022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17027 - BLOCK
    )
    :vars
    (
      ?auto_17031 - BLOCK
      ?auto_17028 - BLOCK
      ?auto_17029 - BLOCK
      ?auto_17030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17027 ?auto_17031 ) ) ( ON-TABLE ?auto_17028 ) ( ON ?auto_17029 ?auto_17028 ) ( not ( = ?auto_17028 ?auto_17029 ) ) ( not ( = ?auto_17028 ?auto_17031 ) ) ( not ( = ?auto_17028 ?auto_17027 ) ) ( not ( = ?auto_17029 ?auto_17031 ) ) ( not ( = ?auto_17029 ?auto_17027 ) ) ( ON ?auto_17027 ?auto_17030 ) ( not ( = ?auto_17027 ?auto_17030 ) ) ( not ( = ?auto_17031 ?auto_17030 ) ) ( not ( = ?auto_17028 ?auto_17030 ) ) ( not ( = ?auto_17029 ?auto_17030 ) ) ( CLEAR ?auto_17029 ) ( ON ?auto_17031 ?auto_17027 ) ( CLEAR ?auto_17031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17030 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17030 ?auto_17027 )
      ( MAKE-1PILE ?auto_17027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17032 - BLOCK
    )
    :vars
    (
      ?auto_17036 - BLOCK
      ?auto_17033 - BLOCK
      ?auto_17035 - BLOCK
      ?auto_17034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17032 ?auto_17036 ) ) ( ON-TABLE ?auto_17033 ) ( not ( = ?auto_17033 ?auto_17035 ) ) ( not ( = ?auto_17033 ?auto_17036 ) ) ( not ( = ?auto_17033 ?auto_17032 ) ) ( not ( = ?auto_17035 ?auto_17036 ) ) ( not ( = ?auto_17035 ?auto_17032 ) ) ( ON ?auto_17032 ?auto_17034 ) ( not ( = ?auto_17032 ?auto_17034 ) ) ( not ( = ?auto_17036 ?auto_17034 ) ) ( not ( = ?auto_17033 ?auto_17034 ) ) ( not ( = ?auto_17035 ?auto_17034 ) ) ( ON ?auto_17036 ?auto_17032 ) ( CLEAR ?auto_17036 ) ( ON-TABLE ?auto_17034 ) ( HOLDING ?auto_17035 ) ( CLEAR ?auto_17033 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17033 ?auto_17035 )
      ( MAKE-1PILE ?auto_17032 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17037 - BLOCK
    )
    :vars
    (
      ?auto_17039 - BLOCK
      ?auto_17038 - BLOCK
      ?auto_17041 - BLOCK
      ?auto_17040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17037 ?auto_17039 ) ) ( ON-TABLE ?auto_17038 ) ( not ( = ?auto_17038 ?auto_17041 ) ) ( not ( = ?auto_17038 ?auto_17039 ) ) ( not ( = ?auto_17038 ?auto_17037 ) ) ( not ( = ?auto_17041 ?auto_17039 ) ) ( not ( = ?auto_17041 ?auto_17037 ) ) ( ON ?auto_17037 ?auto_17040 ) ( not ( = ?auto_17037 ?auto_17040 ) ) ( not ( = ?auto_17039 ?auto_17040 ) ) ( not ( = ?auto_17038 ?auto_17040 ) ) ( not ( = ?auto_17041 ?auto_17040 ) ) ( ON ?auto_17039 ?auto_17037 ) ( ON-TABLE ?auto_17040 ) ( CLEAR ?auto_17038 ) ( ON ?auto_17041 ?auto_17039 ) ( CLEAR ?auto_17041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17040 ?auto_17037 ?auto_17039 )
      ( MAKE-1PILE ?auto_17037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17042 - BLOCK
    )
    :vars
    (
      ?auto_17045 - BLOCK
      ?auto_17046 - BLOCK
      ?auto_17043 - BLOCK
      ?auto_17044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17042 ?auto_17045 ) ) ( not ( = ?auto_17046 ?auto_17043 ) ) ( not ( = ?auto_17046 ?auto_17045 ) ) ( not ( = ?auto_17046 ?auto_17042 ) ) ( not ( = ?auto_17043 ?auto_17045 ) ) ( not ( = ?auto_17043 ?auto_17042 ) ) ( ON ?auto_17042 ?auto_17044 ) ( not ( = ?auto_17042 ?auto_17044 ) ) ( not ( = ?auto_17045 ?auto_17044 ) ) ( not ( = ?auto_17046 ?auto_17044 ) ) ( not ( = ?auto_17043 ?auto_17044 ) ) ( ON ?auto_17045 ?auto_17042 ) ( ON-TABLE ?auto_17044 ) ( ON ?auto_17043 ?auto_17045 ) ( CLEAR ?auto_17043 ) ( HOLDING ?auto_17046 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17046 )
      ( MAKE-1PILE ?auto_17042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17047 - BLOCK
    )
    :vars
    (
      ?auto_17050 - BLOCK
      ?auto_17049 - BLOCK
      ?auto_17051 - BLOCK
      ?auto_17048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17047 ?auto_17050 ) ) ( not ( = ?auto_17049 ?auto_17051 ) ) ( not ( = ?auto_17049 ?auto_17050 ) ) ( not ( = ?auto_17049 ?auto_17047 ) ) ( not ( = ?auto_17051 ?auto_17050 ) ) ( not ( = ?auto_17051 ?auto_17047 ) ) ( ON ?auto_17047 ?auto_17048 ) ( not ( = ?auto_17047 ?auto_17048 ) ) ( not ( = ?auto_17050 ?auto_17048 ) ) ( not ( = ?auto_17049 ?auto_17048 ) ) ( not ( = ?auto_17051 ?auto_17048 ) ) ( ON ?auto_17050 ?auto_17047 ) ( ON-TABLE ?auto_17048 ) ( ON ?auto_17051 ?auto_17050 ) ( ON ?auto_17049 ?auto_17051 ) ( CLEAR ?auto_17049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17048 ?auto_17047 ?auto_17050 ?auto_17051 )
      ( MAKE-1PILE ?auto_17047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17054 - BLOCK
      ?auto_17055 - BLOCK
    )
    :vars
    (
      ?auto_17056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17056 ?auto_17055 ) ( CLEAR ?auto_17056 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17054 ) ( ON ?auto_17055 ?auto_17054 ) ( not ( = ?auto_17054 ?auto_17055 ) ) ( not ( = ?auto_17054 ?auto_17056 ) ) ( not ( = ?auto_17055 ?auto_17056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17056 ?auto_17055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17057 - BLOCK
      ?auto_17058 - BLOCK
    )
    :vars
    (
      ?auto_17059 - BLOCK
      ?auto_17060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17059 ?auto_17058 ) ( CLEAR ?auto_17059 ) ( ON-TABLE ?auto_17057 ) ( ON ?auto_17058 ?auto_17057 ) ( not ( = ?auto_17057 ?auto_17058 ) ) ( not ( = ?auto_17057 ?auto_17059 ) ) ( not ( = ?auto_17058 ?auto_17059 ) ) ( HOLDING ?auto_17060 ) ( not ( = ?auto_17057 ?auto_17060 ) ) ( not ( = ?auto_17058 ?auto_17060 ) ) ( not ( = ?auto_17059 ?auto_17060 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17060 )
      ( MAKE-2PILE ?auto_17057 ?auto_17058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17061 - BLOCK
      ?auto_17062 - BLOCK
    )
    :vars
    (
      ?auto_17063 - BLOCK
      ?auto_17064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17063 ?auto_17062 ) ( ON-TABLE ?auto_17061 ) ( ON ?auto_17062 ?auto_17061 ) ( not ( = ?auto_17061 ?auto_17062 ) ) ( not ( = ?auto_17061 ?auto_17063 ) ) ( not ( = ?auto_17062 ?auto_17063 ) ) ( not ( = ?auto_17061 ?auto_17064 ) ) ( not ( = ?auto_17062 ?auto_17064 ) ) ( not ( = ?auto_17063 ?auto_17064 ) ) ( ON ?auto_17064 ?auto_17063 ) ( CLEAR ?auto_17064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17061 ?auto_17062 ?auto_17063 )
      ( MAKE-2PILE ?auto_17061 ?auto_17062 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17065 - BLOCK
      ?auto_17066 - BLOCK
    )
    :vars
    (
      ?auto_17068 - BLOCK
      ?auto_17067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17068 ?auto_17066 ) ( ON-TABLE ?auto_17065 ) ( ON ?auto_17066 ?auto_17065 ) ( not ( = ?auto_17065 ?auto_17066 ) ) ( not ( = ?auto_17065 ?auto_17068 ) ) ( not ( = ?auto_17066 ?auto_17068 ) ) ( not ( = ?auto_17065 ?auto_17067 ) ) ( not ( = ?auto_17066 ?auto_17067 ) ) ( not ( = ?auto_17068 ?auto_17067 ) ) ( HOLDING ?auto_17067 ) ( CLEAR ?auto_17068 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17065 ?auto_17066 ?auto_17068 ?auto_17067 )
      ( MAKE-2PILE ?auto_17065 ?auto_17066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17069 - BLOCK
      ?auto_17070 - BLOCK
    )
    :vars
    (
      ?auto_17071 - BLOCK
      ?auto_17072 - BLOCK
      ?auto_17073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17071 ?auto_17070 ) ( ON-TABLE ?auto_17069 ) ( ON ?auto_17070 ?auto_17069 ) ( not ( = ?auto_17069 ?auto_17070 ) ) ( not ( = ?auto_17069 ?auto_17071 ) ) ( not ( = ?auto_17070 ?auto_17071 ) ) ( not ( = ?auto_17069 ?auto_17072 ) ) ( not ( = ?auto_17070 ?auto_17072 ) ) ( not ( = ?auto_17071 ?auto_17072 ) ) ( CLEAR ?auto_17071 ) ( ON ?auto_17072 ?auto_17073 ) ( CLEAR ?auto_17072 ) ( HAND-EMPTY ) ( not ( = ?auto_17069 ?auto_17073 ) ) ( not ( = ?auto_17070 ?auto_17073 ) ) ( not ( = ?auto_17071 ?auto_17073 ) ) ( not ( = ?auto_17072 ?auto_17073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17072 ?auto_17073 )
      ( MAKE-2PILE ?auto_17069 ?auto_17070 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17084 - BLOCK
      ?auto_17085 - BLOCK
    )
    :vars
    (
      ?auto_17086 - BLOCK
      ?auto_17088 - BLOCK
      ?auto_17087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17084 ) ( not ( = ?auto_17084 ?auto_17085 ) ) ( not ( = ?auto_17084 ?auto_17086 ) ) ( not ( = ?auto_17085 ?auto_17086 ) ) ( not ( = ?auto_17084 ?auto_17088 ) ) ( not ( = ?auto_17085 ?auto_17088 ) ) ( not ( = ?auto_17086 ?auto_17088 ) ) ( ON ?auto_17088 ?auto_17087 ) ( not ( = ?auto_17084 ?auto_17087 ) ) ( not ( = ?auto_17085 ?auto_17087 ) ) ( not ( = ?auto_17086 ?auto_17087 ) ) ( not ( = ?auto_17088 ?auto_17087 ) ) ( ON ?auto_17086 ?auto_17088 ) ( CLEAR ?auto_17086 ) ( HOLDING ?auto_17085 ) ( CLEAR ?auto_17084 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17084 ?auto_17085 ?auto_17086 )
      ( MAKE-2PILE ?auto_17084 ?auto_17085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17089 - BLOCK
      ?auto_17090 - BLOCK
    )
    :vars
    (
      ?auto_17093 - BLOCK
      ?auto_17092 - BLOCK
      ?auto_17091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17089 ) ( not ( = ?auto_17089 ?auto_17090 ) ) ( not ( = ?auto_17089 ?auto_17093 ) ) ( not ( = ?auto_17090 ?auto_17093 ) ) ( not ( = ?auto_17089 ?auto_17092 ) ) ( not ( = ?auto_17090 ?auto_17092 ) ) ( not ( = ?auto_17093 ?auto_17092 ) ) ( ON ?auto_17092 ?auto_17091 ) ( not ( = ?auto_17089 ?auto_17091 ) ) ( not ( = ?auto_17090 ?auto_17091 ) ) ( not ( = ?auto_17093 ?auto_17091 ) ) ( not ( = ?auto_17092 ?auto_17091 ) ) ( ON ?auto_17093 ?auto_17092 ) ( CLEAR ?auto_17089 ) ( ON ?auto_17090 ?auto_17093 ) ( CLEAR ?auto_17090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17091 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17091 ?auto_17092 ?auto_17093 )
      ( MAKE-2PILE ?auto_17089 ?auto_17090 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17094 - BLOCK
      ?auto_17095 - BLOCK
    )
    :vars
    (
      ?auto_17098 - BLOCK
      ?auto_17096 - BLOCK
      ?auto_17097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17094 ?auto_17095 ) ) ( not ( = ?auto_17094 ?auto_17098 ) ) ( not ( = ?auto_17095 ?auto_17098 ) ) ( not ( = ?auto_17094 ?auto_17096 ) ) ( not ( = ?auto_17095 ?auto_17096 ) ) ( not ( = ?auto_17098 ?auto_17096 ) ) ( ON ?auto_17096 ?auto_17097 ) ( not ( = ?auto_17094 ?auto_17097 ) ) ( not ( = ?auto_17095 ?auto_17097 ) ) ( not ( = ?auto_17098 ?auto_17097 ) ) ( not ( = ?auto_17096 ?auto_17097 ) ) ( ON ?auto_17098 ?auto_17096 ) ( ON ?auto_17095 ?auto_17098 ) ( CLEAR ?auto_17095 ) ( ON-TABLE ?auto_17097 ) ( HOLDING ?auto_17094 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17094 )
      ( MAKE-2PILE ?auto_17094 ?auto_17095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17099 - BLOCK
      ?auto_17100 - BLOCK
    )
    :vars
    (
      ?auto_17102 - BLOCK
      ?auto_17103 - BLOCK
      ?auto_17101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17099 ?auto_17100 ) ) ( not ( = ?auto_17099 ?auto_17102 ) ) ( not ( = ?auto_17100 ?auto_17102 ) ) ( not ( = ?auto_17099 ?auto_17103 ) ) ( not ( = ?auto_17100 ?auto_17103 ) ) ( not ( = ?auto_17102 ?auto_17103 ) ) ( ON ?auto_17103 ?auto_17101 ) ( not ( = ?auto_17099 ?auto_17101 ) ) ( not ( = ?auto_17100 ?auto_17101 ) ) ( not ( = ?auto_17102 ?auto_17101 ) ) ( not ( = ?auto_17103 ?auto_17101 ) ) ( ON ?auto_17102 ?auto_17103 ) ( ON ?auto_17100 ?auto_17102 ) ( ON-TABLE ?auto_17101 ) ( ON ?auto_17099 ?auto_17100 ) ( CLEAR ?auto_17099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17101 ?auto_17103 ?auto_17102 ?auto_17100 )
      ( MAKE-2PILE ?auto_17099 ?auto_17100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17106 - BLOCK
      ?auto_17107 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17107 ) ( CLEAR ?auto_17106 ) ( ON-TABLE ?auto_17106 ) ( not ( = ?auto_17106 ?auto_17107 ) ) )
    :subtasks
    ( ( !STACK ?auto_17107 ?auto_17106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17108 - BLOCK
      ?auto_17109 - BLOCK
    )
    :vars
    (
      ?auto_17110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17108 ) ( ON-TABLE ?auto_17108 ) ( not ( = ?auto_17108 ?auto_17109 ) ) ( ON ?auto_17109 ?auto_17110 ) ( CLEAR ?auto_17109 ) ( HAND-EMPTY ) ( not ( = ?auto_17108 ?auto_17110 ) ) ( not ( = ?auto_17109 ?auto_17110 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17109 ?auto_17110 )
      ( MAKE-2PILE ?auto_17108 ?auto_17109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17111 - BLOCK
      ?auto_17112 - BLOCK
    )
    :vars
    (
      ?auto_17113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17111 ?auto_17112 ) ) ( ON ?auto_17112 ?auto_17113 ) ( CLEAR ?auto_17112 ) ( not ( = ?auto_17111 ?auto_17113 ) ) ( not ( = ?auto_17112 ?auto_17113 ) ) ( HOLDING ?auto_17111 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17111 )
      ( MAKE-2PILE ?auto_17111 ?auto_17112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17114 - BLOCK
      ?auto_17115 - BLOCK
    )
    :vars
    (
      ?auto_17116 - BLOCK
      ?auto_17117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17114 ?auto_17115 ) ) ( ON ?auto_17115 ?auto_17116 ) ( not ( = ?auto_17114 ?auto_17116 ) ) ( not ( = ?auto_17115 ?auto_17116 ) ) ( ON ?auto_17114 ?auto_17115 ) ( CLEAR ?auto_17114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17117 ) ( ON ?auto_17116 ?auto_17117 ) ( not ( = ?auto_17117 ?auto_17116 ) ) ( not ( = ?auto_17117 ?auto_17115 ) ) ( not ( = ?auto_17117 ?auto_17114 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17117 ?auto_17116 ?auto_17115 )
      ( MAKE-2PILE ?auto_17114 ?auto_17115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17118 - BLOCK
      ?auto_17119 - BLOCK
    )
    :vars
    (
      ?auto_17120 - BLOCK
      ?auto_17121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17118 ?auto_17119 ) ) ( ON ?auto_17119 ?auto_17120 ) ( not ( = ?auto_17118 ?auto_17120 ) ) ( not ( = ?auto_17119 ?auto_17120 ) ) ( ON-TABLE ?auto_17121 ) ( ON ?auto_17120 ?auto_17121 ) ( not ( = ?auto_17121 ?auto_17120 ) ) ( not ( = ?auto_17121 ?auto_17119 ) ) ( not ( = ?auto_17121 ?auto_17118 ) ) ( HOLDING ?auto_17118 ) ( CLEAR ?auto_17119 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17121 ?auto_17120 ?auto_17119 ?auto_17118 )
      ( MAKE-2PILE ?auto_17118 ?auto_17119 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17122 - BLOCK
      ?auto_17123 - BLOCK
    )
    :vars
    (
      ?auto_17125 - BLOCK
      ?auto_17124 - BLOCK
      ?auto_17126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17122 ?auto_17123 ) ) ( ON ?auto_17123 ?auto_17125 ) ( not ( = ?auto_17122 ?auto_17125 ) ) ( not ( = ?auto_17123 ?auto_17125 ) ) ( ON-TABLE ?auto_17124 ) ( ON ?auto_17125 ?auto_17124 ) ( not ( = ?auto_17124 ?auto_17125 ) ) ( not ( = ?auto_17124 ?auto_17123 ) ) ( not ( = ?auto_17124 ?auto_17122 ) ) ( CLEAR ?auto_17123 ) ( ON ?auto_17122 ?auto_17126 ) ( CLEAR ?auto_17122 ) ( HAND-EMPTY ) ( not ( = ?auto_17122 ?auto_17126 ) ) ( not ( = ?auto_17123 ?auto_17126 ) ) ( not ( = ?auto_17125 ?auto_17126 ) ) ( not ( = ?auto_17124 ?auto_17126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17122 ?auto_17126 )
      ( MAKE-2PILE ?auto_17122 ?auto_17123 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17127 - BLOCK
      ?auto_17128 - BLOCK
    )
    :vars
    (
      ?auto_17130 - BLOCK
      ?auto_17131 - BLOCK
      ?auto_17129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17127 ?auto_17128 ) ) ( not ( = ?auto_17127 ?auto_17130 ) ) ( not ( = ?auto_17128 ?auto_17130 ) ) ( ON-TABLE ?auto_17131 ) ( ON ?auto_17130 ?auto_17131 ) ( not ( = ?auto_17131 ?auto_17130 ) ) ( not ( = ?auto_17131 ?auto_17128 ) ) ( not ( = ?auto_17131 ?auto_17127 ) ) ( ON ?auto_17127 ?auto_17129 ) ( CLEAR ?auto_17127 ) ( not ( = ?auto_17127 ?auto_17129 ) ) ( not ( = ?auto_17128 ?auto_17129 ) ) ( not ( = ?auto_17130 ?auto_17129 ) ) ( not ( = ?auto_17131 ?auto_17129 ) ) ( HOLDING ?auto_17128 ) ( CLEAR ?auto_17130 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17131 ?auto_17130 ?auto_17128 )
      ( MAKE-2PILE ?auto_17127 ?auto_17128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17132 - BLOCK
      ?auto_17133 - BLOCK
    )
    :vars
    (
      ?auto_17136 - BLOCK
      ?auto_17134 - BLOCK
      ?auto_17135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17132 ?auto_17133 ) ) ( not ( = ?auto_17132 ?auto_17136 ) ) ( not ( = ?auto_17133 ?auto_17136 ) ) ( ON-TABLE ?auto_17134 ) ( ON ?auto_17136 ?auto_17134 ) ( not ( = ?auto_17134 ?auto_17136 ) ) ( not ( = ?auto_17134 ?auto_17133 ) ) ( not ( = ?auto_17134 ?auto_17132 ) ) ( ON ?auto_17132 ?auto_17135 ) ( not ( = ?auto_17132 ?auto_17135 ) ) ( not ( = ?auto_17133 ?auto_17135 ) ) ( not ( = ?auto_17136 ?auto_17135 ) ) ( not ( = ?auto_17134 ?auto_17135 ) ) ( CLEAR ?auto_17136 ) ( ON ?auto_17133 ?auto_17132 ) ( CLEAR ?auto_17133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17135 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17135 ?auto_17132 )
      ( MAKE-2PILE ?auto_17132 ?auto_17133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17137 - BLOCK
      ?auto_17138 - BLOCK
    )
    :vars
    (
      ?auto_17139 - BLOCK
      ?auto_17141 - BLOCK
      ?auto_17140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17137 ?auto_17138 ) ) ( not ( = ?auto_17137 ?auto_17139 ) ) ( not ( = ?auto_17138 ?auto_17139 ) ) ( ON-TABLE ?auto_17141 ) ( not ( = ?auto_17141 ?auto_17139 ) ) ( not ( = ?auto_17141 ?auto_17138 ) ) ( not ( = ?auto_17141 ?auto_17137 ) ) ( ON ?auto_17137 ?auto_17140 ) ( not ( = ?auto_17137 ?auto_17140 ) ) ( not ( = ?auto_17138 ?auto_17140 ) ) ( not ( = ?auto_17139 ?auto_17140 ) ) ( not ( = ?auto_17141 ?auto_17140 ) ) ( ON ?auto_17138 ?auto_17137 ) ( CLEAR ?auto_17138 ) ( ON-TABLE ?auto_17140 ) ( HOLDING ?auto_17139 ) ( CLEAR ?auto_17141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17141 ?auto_17139 )
      ( MAKE-2PILE ?auto_17137 ?auto_17138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17142 - BLOCK
      ?auto_17143 - BLOCK
    )
    :vars
    (
      ?auto_17146 - BLOCK
      ?auto_17144 - BLOCK
      ?auto_17145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17142 ?auto_17143 ) ) ( not ( = ?auto_17142 ?auto_17146 ) ) ( not ( = ?auto_17143 ?auto_17146 ) ) ( ON-TABLE ?auto_17144 ) ( not ( = ?auto_17144 ?auto_17146 ) ) ( not ( = ?auto_17144 ?auto_17143 ) ) ( not ( = ?auto_17144 ?auto_17142 ) ) ( ON ?auto_17142 ?auto_17145 ) ( not ( = ?auto_17142 ?auto_17145 ) ) ( not ( = ?auto_17143 ?auto_17145 ) ) ( not ( = ?auto_17146 ?auto_17145 ) ) ( not ( = ?auto_17144 ?auto_17145 ) ) ( ON ?auto_17143 ?auto_17142 ) ( ON-TABLE ?auto_17145 ) ( CLEAR ?auto_17144 ) ( ON ?auto_17146 ?auto_17143 ) ( CLEAR ?auto_17146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17145 ?auto_17142 ?auto_17143 )
      ( MAKE-2PILE ?auto_17142 ?auto_17143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17147 - BLOCK
      ?auto_17148 - BLOCK
    )
    :vars
    (
      ?auto_17150 - BLOCK
      ?auto_17149 - BLOCK
      ?auto_17151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17147 ?auto_17148 ) ) ( not ( = ?auto_17147 ?auto_17150 ) ) ( not ( = ?auto_17148 ?auto_17150 ) ) ( not ( = ?auto_17149 ?auto_17150 ) ) ( not ( = ?auto_17149 ?auto_17148 ) ) ( not ( = ?auto_17149 ?auto_17147 ) ) ( ON ?auto_17147 ?auto_17151 ) ( not ( = ?auto_17147 ?auto_17151 ) ) ( not ( = ?auto_17148 ?auto_17151 ) ) ( not ( = ?auto_17150 ?auto_17151 ) ) ( not ( = ?auto_17149 ?auto_17151 ) ) ( ON ?auto_17148 ?auto_17147 ) ( ON-TABLE ?auto_17151 ) ( ON ?auto_17150 ?auto_17148 ) ( CLEAR ?auto_17150 ) ( HOLDING ?auto_17149 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17149 )
      ( MAKE-2PILE ?auto_17147 ?auto_17148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17152 - BLOCK
      ?auto_17153 - BLOCK
    )
    :vars
    (
      ?auto_17155 - BLOCK
      ?auto_17156 - BLOCK
      ?auto_17154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17152 ?auto_17153 ) ) ( not ( = ?auto_17152 ?auto_17155 ) ) ( not ( = ?auto_17153 ?auto_17155 ) ) ( not ( = ?auto_17156 ?auto_17155 ) ) ( not ( = ?auto_17156 ?auto_17153 ) ) ( not ( = ?auto_17156 ?auto_17152 ) ) ( ON ?auto_17152 ?auto_17154 ) ( not ( = ?auto_17152 ?auto_17154 ) ) ( not ( = ?auto_17153 ?auto_17154 ) ) ( not ( = ?auto_17155 ?auto_17154 ) ) ( not ( = ?auto_17156 ?auto_17154 ) ) ( ON ?auto_17153 ?auto_17152 ) ( ON-TABLE ?auto_17154 ) ( ON ?auto_17155 ?auto_17153 ) ( ON ?auto_17156 ?auto_17155 ) ( CLEAR ?auto_17156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17154 ?auto_17152 ?auto_17153 ?auto_17155 )
      ( MAKE-2PILE ?auto_17152 ?auto_17153 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17158 - BLOCK
    )
    :vars
    (
      ?auto_17159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17159 ?auto_17158 ) ( CLEAR ?auto_17159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17158 ) ( not ( = ?auto_17158 ?auto_17159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17159 ?auto_17158 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17160 - BLOCK
    )
    :vars
    (
      ?auto_17161 - BLOCK
      ?auto_17162 - BLOCK
      ?auto_17163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17161 ?auto_17160 ) ( CLEAR ?auto_17161 ) ( ON-TABLE ?auto_17160 ) ( not ( = ?auto_17160 ?auto_17161 ) ) ( HOLDING ?auto_17162 ) ( CLEAR ?auto_17163 ) ( not ( = ?auto_17160 ?auto_17162 ) ) ( not ( = ?auto_17160 ?auto_17163 ) ) ( not ( = ?auto_17161 ?auto_17162 ) ) ( not ( = ?auto_17161 ?auto_17163 ) ) ( not ( = ?auto_17162 ?auto_17163 ) ) )
    :subtasks
    ( ( !STACK ?auto_17162 ?auto_17163 )
      ( MAKE-1PILE ?auto_17160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17164 - BLOCK
    )
    :vars
    (
      ?auto_17165 - BLOCK
      ?auto_17166 - BLOCK
      ?auto_17167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17165 ?auto_17164 ) ( ON-TABLE ?auto_17164 ) ( not ( = ?auto_17164 ?auto_17165 ) ) ( CLEAR ?auto_17166 ) ( not ( = ?auto_17164 ?auto_17167 ) ) ( not ( = ?auto_17164 ?auto_17166 ) ) ( not ( = ?auto_17165 ?auto_17167 ) ) ( not ( = ?auto_17165 ?auto_17166 ) ) ( not ( = ?auto_17167 ?auto_17166 ) ) ( ON ?auto_17167 ?auto_17165 ) ( CLEAR ?auto_17167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17164 ?auto_17165 )
      ( MAKE-1PILE ?auto_17164 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17168 - BLOCK
    )
    :vars
    (
      ?auto_17171 - BLOCK
      ?auto_17169 - BLOCK
      ?auto_17170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17171 ?auto_17168 ) ( ON-TABLE ?auto_17168 ) ( not ( = ?auto_17168 ?auto_17171 ) ) ( not ( = ?auto_17168 ?auto_17169 ) ) ( not ( = ?auto_17168 ?auto_17170 ) ) ( not ( = ?auto_17171 ?auto_17169 ) ) ( not ( = ?auto_17171 ?auto_17170 ) ) ( not ( = ?auto_17169 ?auto_17170 ) ) ( ON ?auto_17169 ?auto_17171 ) ( CLEAR ?auto_17169 ) ( HOLDING ?auto_17170 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17170 )
      ( MAKE-1PILE ?auto_17168 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17172 - BLOCK
    )
    :vars
    (
      ?auto_17174 - BLOCK
      ?auto_17175 - BLOCK
      ?auto_17173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17174 ?auto_17172 ) ( ON-TABLE ?auto_17172 ) ( not ( = ?auto_17172 ?auto_17174 ) ) ( not ( = ?auto_17172 ?auto_17175 ) ) ( not ( = ?auto_17172 ?auto_17173 ) ) ( not ( = ?auto_17174 ?auto_17175 ) ) ( not ( = ?auto_17174 ?auto_17173 ) ) ( not ( = ?auto_17175 ?auto_17173 ) ) ( ON ?auto_17175 ?auto_17174 ) ( ON ?auto_17173 ?auto_17175 ) ( CLEAR ?auto_17173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17172 ?auto_17174 ?auto_17175 )
      ( MAKE-1PILE ?auto_17172 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17176 - BLOCK
    )
    :vars
    (
      ?auto_17179 - BLOCK
      ?auto_17177 - BLOCK
      ?auto_17178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17179 ?auto_17176 ) ( ON-TABLE ?auto_17176 ) ( not ( = ?auto_17176 ?auto_17179 ) ) ( not ( = ?auto_17176 ?auto_17177 ) ) ( not ( = ?auto_17176 ?auto_17178 ) ) ( not ( = ?auto_17179 ?auto_17177 ) ) ( not ( = ?auto_17179 ?auto_17178 ) ) ( not ( = ?auto_17177 ?auto_17178 ) ) ( ON ?auto_17177 ?auto_17179 ) ( HOLDING ?auto_17178 ) ( CLEAR ?auto_17177 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17176 ?auto_17179 ?auto_17177 ?auto_17178 )
      ( MAKE-1PILE ?auto_17176 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17180 - BLOCK
    )
    :vars
    (
      ?auto_17182 - BLOCK
      ?auto_17183 - BLOCK
      ?auto_17181 - BLOCK
      ?auto_17184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17182 ?auto_17180 ) ( ON-TABLE ?auto_17180 ) ( not ( = ?auto_17180 ?auto_17182 ) ) ( not ( = ?auto_17180 ?auto_17183 ) ) ( not ( = ?auto_17180 ?auto_17181 ) ) ( not ( = ?auto_17182 ?auto_17183 ) ) ( not ( = ?auto_17182 ?auto_17181 ) ) ( not ( = ?auto_17183 ?auto_17181 ) ) ( ON ?auto_17183 ?auto_17182 ) ( CLEAR ?auto_17183 ) ( ON ?auto_17181 ?auto_17184 ) ( CLEAR ?auto_17181 ) ( HAND-EMPTY ) ( not ( = ?auto_17180 ?auto_17184 ) ) ( not ( = ?auto_17182 ?auto_17184 ) ) ( not ( = ?auto_17183 ?auto_17184 ) ) ( not ( = ?auto_17181 ?auto_17184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17181 ?auto_17184 )
      ( MAKE-1PILE ?auto_17180 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17185 - BLOCK
    )
    :vars
    (
      ?auto_17187 - BLOCK
      ?auto_17189 - BLOCK
      ?auto_17188 - BLOCK
      ?auto_17186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17187 ?auto_17185 ) ( ON-TABLE ?auto_17185 ) ( not ( = ?auto_17185 ?auto_17187 ) ) ( not ( = ?auto_17185 ?auto_17189 ) ) ( not ( = ?auto_17185 ?auto_17188 ) ) ( not ( = ?auto_17187 ?auto_17189 ) ) ( not ( = ?auto_17187 ?auto_17188 ) ) ( not ( = ?auto_17189 ?auto_17188 ) ) ( ON ?auto_17188 ?auto_17186 ) ( CLEAR ?auto_17188 ) ( not ( = ?auto_17185 ?auto_17186 ) ) ( not ( = ?auto_17187 ?auto_17186 ) ) ( not ( = ?auto_17189 ?auto_17186 ) ) ( not ( = ?auto_17188 ?auto_17186 ) ) ( HOLDING ?auto_17189 ) ( CLEAR ?auto_17187 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17185 ?auto_17187 ?auto_17189 )
      ( MAKE-1PILE ?auto_17185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17190 - BLOCK
    )
    :vars
    (
      ?auto_17192 - BLOCK
      ?auto_17191 - BLOCK
      ?auto_17193 - BLOCK
      ?auto_17194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17192 ?auto_17190 ) ( ON-TABLE ?auto_17190 ) ( not ( = ?auto_17190 ?auto_17192 ) ) ( not ( = ?auto_17190 ?auto_17191 ) ) ( not ( = ?auto_17190 ?auto_17193 ) ) ( not ( = ?auto_17192 ?auto_17191 ) ) ( not ( = ?auto_17192 ?auto_17193 ) ) ( not ( = ?auto_17191 ?auto_17193 ) ) ( ON ?auto_17193 ?auto_17194 ) ( not ( = ?auto_17190 ?auto_17194 ) ) ( not ( = ?auto_17192 ?auto_17194 ) ) ( not ( = ?auto_17191 ?auto_17194 ) ) ( not ( = ?auto_17193 ?auto_17194 ) ) ( CLEAR ?auto_17192 ) ( ON ?auto_17191 ?auto_17193 ) ( CLEAR ?auto_17191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17194 ?auto_17193 )
      ( MAKE-1PILE ?auto_17190 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17205 - BLOCK
    )
    :vars
    (
      ?auto_17206 - BLOCK
      ?auto_17209 - BLOCK
      ?auto_17208 - BLOCK
      ?auto_17207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17205 ?auto_17206 ) ) ( not ( = ?auto_17205 ?auto_17209 ) ) ( not ( = ?auto_17205 ?auto_17208 ) ) ( not ( = ?auto_17206 ?auto_17209 ) ) ( not ( = ?auto_17206 ?auto_17208 ) ) ( not ( = ?auto_17209 ?auto_17208 ) ) ( ON ?auto_17208 ?auto_17207 ) ( not ( = ?auto_17205 ?auto_17207 ) ) ( not ( = ?auto_17206 ?auto_17207 ) ) ( not ( = ?auto_17209 ?auto_17207 ) ) ( not ( = ?auto_17208 ?auto_17207 ) ) ( ON ?auto_17209 ?auto_17208 ) ( ON-TABLE ?auto_17207 ) ( ON ?auto_17206 ?auto_17209 ) ( CLEAR ?auto_17206 ) ( HOLDING ?auto_17205 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17205 ?auto_17206 )
      ( MAKE-1PILE ?auto_17205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17210 - BLOCK
    )
    :vars
    (
      ?auto_17211 - BLOCK
      ?auto_17212 - BLOCK
      ?auto_17214 - BLOCK
      ?auto_17213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17210 ?auto_17211 ) ) ( not ( = ?auto_17210 ?auto_17212 ) ) ( not ( = ?auto_17210 ?auto_17214 ) ) ( not ( = ?auto_17211 ?auto_17212 ) ) ( not ( = ?auto_17211 ?auto_17214 ) ) ( not ( = ?auto_17212 ?auto_17214 ) ) ( ON ?auto_17214 ?auto_17213 ) ( not ( = ?auto_17210 ?auto_17213 ) ) ( not ( = ?auto_17211 ?auto_17213 ) ) ( not ( = ?auto_17212 ?auto_17213 ) ) ( not ( = ?auto_17214 ?auto_17213 ) ) ( ON ?auto_17212 ?auto_17214 ) ( ON-TABLE ?auto_17213 ) ( ON ?auto_17211 ?auto_17212 ) ( ON ?auto_17210 ?auto_17211 ) ( CLEAR ?auto_17210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17213 ?auto_17214 ?auto_17212 ?auto_17211 )
      ( MAKE-1PILE ?auto_17210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17218 - BLOCK
      ?auto_17219 - BLOCK
      ?auto_17220 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17220 ) ( CLEAR ?auto_17219 ) ( ON-TABLE ?auto_17218 ) ( ON ?auto_17219 ?auto_17218 ) ( not ( = ?auto_17218 ?auto_17219 ) ) ( not ( = ?auto_17218 ?auto_17220 ) ) ( not ( = ?auto_17219 ?auto_17220 ) ) )
    :subtasks
    ( ( !STACK ?auto_17220 ?auto_17219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17221 - BLOCK
      ?auto_17222 - BLOCK
      ?auto_17223 - BLOCK
    )
    :vars
    (
      ?auto_17224 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17222 ) ( ON-TABLE ?auto_17221 ) ( ON ?auto_17222 ?auto_17221 ) ( not ( = ?auto_17221 ?auto_17222 ) ) ( not ( = ?auto_17221 ?auto_17223 ) ) ( not ( = ?auto_17222 ?auto_17223 ) ) ( ON ?auto_17223 ?auto_17224 ) ( CLEAR ?auto_17223 ) ( HAND-EMPTY ) ( not ( = ?auto_17221 ?auto_17224 ) ) ( not ( = ?auto_17222 ?auto_17224 ) ) ( not ( = ?auto_17223 ?auto_17224 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17223 ?auto_17224 )
      ( MAKE-3PILE ?auto_17221 ?auto_17222 ?auto_17223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17225 - BLOCK
      ?auto_17226 - BLOCK
      ?auto_17227 - BLOCK
    )
    :vars
    (
      ?auto_17228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17225 ) ( not ( = ?auto_17225 ?auto_17226 ) ) ( not ( = ?auto_17225 ?auto_17227 ) ) ( not ( = ?auto_17226 ?auto_17227 ) ) ( ON ?auto_17227 ?auto_17228 ) ( CLEAR ?auto_17227 ) ( not ( = ?auto_17225 ?auto_17228 ) ) ( not ( = ?auto_17226 ?auto_17228 ) ) ( not ( = ?auto_17227 ?auto_17228 ) ) ( HOLDING ?auto_17226 ) ( CLEAR ?auto_17225 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17225 ?auto_17226 )
      ( MAKE-3PILE ?auto_17225 ?auto_17226 ?auto_17227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17229 - BLOCK
      ?auto_17230 - BLOCK
      ?auto_17231 - BLOCK
    )
    :vars
    (
      ?auto_17232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17229 ) ( not ( = ?auto_17229 ?auto_17230 ) ) ( not ( = ?auto_17229 ?auto_17231 ) ) ( not ( = ?auto_17230 ?auto_17231 ) ) ( ON ?auto_17231 ?auto_17232 ) ( not ( = ?auto_17229 ?auto_17232 ) ) ( not ( = ?auto_17230 ?auto_17232 ) ) ( not ( = ?auto_17231 ?auto_17232 ) ) ( CLEAR ?auto_17229 ) ( ON ?auto_17230 ?auto_17231 ) ( CLEAR ?auto_17230 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17232 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17232 ?auto_17231 )
      ( MAKE-3PILE ?auto_17229 ?auto_17230 ?auto_17231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17233 - BLOCK
      ?auto_17234 - BLOCK
      ?auto_17235 - BLOCK
    )
    :vars
    (
      ?auto_17236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17233 ?auto_17234 ) ) ( not ( = ?auto_17233 ?auto_17235 ) ) ( not ( = ?auto_17234 ?auto_17235 ) ) ( ON ?auto_17235 ?auto_17236 ) ( not ( = ?auto_17233 ?auto_17236 ) ) ( not ( = ?auto_17234 ?auto_17236 ) ) ( not ( = ?auto_17235 ?auto_17236 ) ) ( ON ?auto_17234 ?auto_17235 ) ( CLEAR ?auto_17234 ) ( ON-TABLE ?auto_17236 ) ( HOLDING ?auto_17233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17233 )
      ( MAKE-3PILE ?auto_17233 ?auto_17234 ?auto_17235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17237 - BLOCK
      ?auto_17238 - BLOCK
      ?auto_17239 - BLOCK
    )
    :vars
    (
      ?auto_17240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17237 ?auto_17238 ) ) ( not ( = ?auto_17237 ?auto_17239 ) ) ( not ( = ?auto_17238 ?auto_17239 ) ) ( ON ?auto_17239 ?auto_17240 ) ( not ( = ?auto_17237 ?auto_17240 ) ) ( not ( = ?auto_17238 ?auto_17240 ) ) ( not ( = ?auto_17239 ?auto_17240 ) ) ( ON ?auto_17238 ?auto_17239 ) ( ON-TABLE ?auto_17240 ) ( ON ?auto_17237 ?auto_17238 ) ( CLEAR ?auto_17237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17240 ?auto_17239 ?auto_17238 )
      ( MAKE-3PILE ?auto_17237 ?auto_17238 ?auto_17239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17241 - BLOCK
      ?auto_17242 - BLOCK
      ?auto_17243 - BLOCK
    )
    :vars
    (
      ?auto_17244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17241 ?auto_17242 ) ) ( not ( = ?auto_17241 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( ON ?auto_17243 ?auto_17244 ) ( not ( = ?auto_17241 ?auto_17244 ) ) ( not ( = ?auto_17242 ?auto_17244 ) ) ( not ( = ?auto_17243 ?auto_17244 ) ) ( ON ?auto_17242 ?auto_17243 ) ( ON-TABLE ?auto_17244 ) ( HOLDING ?auto_17241 ) ( CLEAR ?auto_17242 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17244 ?auto_17243 ?auto_17242 ?auto_17241 )
      ( MAKE-3PILE ?auto_17241 ?auto_17242 ?auto_17243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17245 - BLOCK
      ?auto_17246 - BLOCK
      ?auto_17247 - BLOCK
    )
    :vars
    (
      ?auto_17248 - BLOCK
      ?auto_17249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17245 ?auto_17246 ) ) ( not ( = ?auto_17245 ?auto_17247 ) ) ( not ( = ?auto_17246 ?auto_17247 ) ) ( ON ?auto_17247 ?auto_17248 ) ( not ( = ?auto_17245 ?auto_17248 ) ) ( not ( = ?auto_17246 ?auto_17248 ) ) ( not ( = ?auto_17247 ?auto_17248 ) ) ( ON ?auto_17246 ?auto_17247 ) ( ON-TABLE ?auto_17248 ) ( CLEAR ?auto_17246 ) ( ON ?auto_17245 ?auto_17249 ) ( CLEAR ?auto_17245 ) ( HAND-EMPTY ) ( not ( = ?auto_17245 ?auto_17249 ) ) ( not ( = ?auto_17246 ?auto_17249 ) ) ( not ( = ?auto_17247 ?auto_17249 ) ) ( not ( = ?auto_17248 ?auto_17249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17245 ?auto_17249 )
      ( MAKE-3PILE ?auto_17245 ?auto_17246 ?auto_17247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17250 - BLOCK
      ?auto_17251 - BLOCK
      ?auto_17252 - BLOCK
    )
    :vars
    (
      ?auto_17254 - BLOCK
      ?auto_17253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17250 ?auto_17251 ) ) ( not ( = ?auto_17250 ?auto_17252 ) ) ( not ( = ?auto_17251 ?auto_17252 ) ) ( ON ?auto_17252 ?auto_17254 ) ( not ( = ?auto_17250 ?auto_17254 ) ) ( not ( = ?auto_17251 ?auto_17254 ) ) ( not ( = ?auto_17252 ?auto_17254 ) ) ( ON-TABLE ?auto_17254 ) ( ON ?auto_17250 ?auto_17253 ) ( CLEAR ?auto_17250 ) ( not ( = ?auto_17250 ?auto_17253 ) ) ( not ( = ?auto_17251 ?auto_17253 ) ) ( not ( = ?auto_17252 ?auto_17253 ) ) ( not ( = ?auto_17254 ?auto_17253 ) ) ( HOLDING ?auto_17251 ) ( CLEAR ?auto_17252 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17254 ?auto_17252 ?auto_17251 )
      ( MAKE-3PILE ?auto_17250 ?auto_17251 ?auto_17252 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17255 - BLOCK
      ?auto_17256 - BLOCK
      ?auto_17257 - BLOCK
    )
    :vars
    (
      ?auto_17258 - BLOCK
      ?auto_17259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17255 ?auto_17256 ) ) ( not ( = ?auto_17255 ?auto_17257 ) ) ( not ( = ?auto_17256 ?auto_17257 ) ) ( ON ?auto_17257 ?auto_17258 ) ( not ( = ?auto_17255 ?auto_17258 ) ) ( not ( = ?auto_17256 ?auto_17258 ) ) ( not ( = ?auto_17257 ?auto_17258 ) ) ( ON-TABLE ?auto_17258 ) ( ON ?auto_17255 ?auto_17259 ) ( not ( = ?auto_17255 ?auto_17259 ) ) ( not ( = ?auto_17256 ?auto_17259 ) ) ( not ( = ?auto_17257 ?auto_17259 ) ) ( not ( = ?auto_17258 ?auto_17259 ) ) ( CLEAR ?auto_17257 ) ( ON ?auto_17256 ?auto_17255 ) ( CLEAR ?auto_17256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17259 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17259 ?auto_17255 )
      ( MAKE-3PILE ?auto_17255 ?auto_17256 ?auto_17257 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17260 - BLOCK
      ?auto_17261 - BLOCK
      ?auto_17262 - BLOCK
    )
    :vars
    (
      ?auto_17263 - BLOCK
      ?auto_17264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17260 ?auto_17261 ) ) ( not ( = ?auto_17260 ?auto_17262 ) ) ( not ( = ?auto_17261 ?auto_17262 ) ) ( not ( = ?auto_17260 ?auto_17263 ) ) ( not ( = ?auto_17261 ?auto_17263 ) ) ( not ( = ?auto_17262 ?auto_17263 ) ) ( ON-TABLE ?auto_17263 ) ( ON ?auto_17260 ?auto_17264 ) ( not ( = ?auto_17260 ?auto_17264 ) ) ( not ( = ?auto_17261 ?auto_17264 ) ) ( not ( = ?auto_17262 ?auto_17264 ) ) ( not ( = ?auto_17263 ?auto_17264 ) ) ( ON ?auto_17261 ?auto_17260 ) ( CLEAR ?auto_17261 ) ( ON-TABLE ?auto_17264 ) ( HOLDING ?auto_17262 ) ( CLEAR ?auto_17263 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17263 ?auto_17262 )
      ( MAKE-3PILE ?auto_17260 ?auto_17261 ?auto_17262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17265 - BLOCK
      ?auto_17266 - BLOCK
      ?auto_17267 - BLOCK
    )
    :vars
    (
      ?auto_17269 - BLOCK
      ?auto_17268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17265 ?auto_17266 ) ) ( not ( = ?auto_17265 ?auto_17267 ) ) ( not ( = ?auto_17266 ?auto_17267 ) ) ( not ( = ?auto_17265 ?auto_17269 ) ) ( not ( = ?auto_17266 ?auto_17269 ) ) ( not ( = ?auto_17267 ?auto_17269 ) ) ( ON-TABLE ?auto_17269 ) ( ON ?auto_17265 ?auto_17268 ) ( not ( = ?auto_17265 ?auto_17268 ) ) ( not ( = ?auto_17266 ?auto_17268 ) ) ( not ( = ?auto_17267 ?auto_17268 ) ) ( not ( = ?auto_17269 ?auto_17268 ) ) ( ON ?auto_17266 ?auto_17265 ) ( ON-TABLE ?auto_17268 ) ( CLEAR ?auto_17269 ) ( ON ?auto_17267 ?auto_17266 ) ( CLEAR ?auto_17267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17268 ?auto_17265 ?auto_17266 )
      ( MAKE-3PILE ?auto_17265 ?auto_17266 ?auto_17267 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17270 - BLOCK
      ?auto_17271 - BLOCK
      ?auto_17272 - BLOCK
    )
    :vars
    (
      ?auto_17274 - BLOCK
      ?auto_17273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17270 ?auto_17271 ) ) ( not ( = ?auto_17270 ?auto_17272 ) ) ( not ( = ?auto_17271 ?auto_17272 ) ) ( not ( = ?auto_17270 ?auto_17274 ) ) ( not ( = ?auto_17271 ?auto_17274 ) ) ( not ( = ?auto_17272 ?auto_17274 ) ) ( ON ?auto_17270 ?auto_17273 ) ( not ( = ?auto_17270 ?auto_17273 ) ) ( not ( = ?auto_17271 ?auto_17273 ) ) ( not ( = ?auto_17272 ?auto_17273 ) ) ( not ( = ?auto_17274 ?auto_17273 ) ) ( ON ?auto_17271 ?auto_17270 ) ( ON-TABLE ?auto_17273 ) ( ON ?auto_17272 ?auto_17271 ) ( CLEAR ?auto_17272 ) ( HOLDING ?auto_17274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17274 )
      ( MAKE-3PILE ?auto_17270 ?auto_17271 ?auto_17272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17275 - BLOCK
      ?auto_17276 - BLOCK
      ?auto_17277 - BLOCK
    )
    :vars
    (
      ?auto_17279 - BLOCK
      ?auto_17278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17275 ?auto_17276 ) ) ( not ( = ?auto_17275 ?auto_17277 ) ) ( not ( = ?auto_17276 ?auto_17277 ) ) ( not ( = ?auto_17275 ?auto_17279 ) ) ( not ( = ?auto_17276 ?auto_17279 ) ) ( not ( = ?auto_17277 ?auto_17279 ) ) ( ON ?auto_17275 ?auto_17278 ) ( not ( = ?auto_17275 ?auto_17278 ) ) ( not ( = ?auto_17276 ?auto_17278 ) ) ( not ( = ?auto_17277 ?auto_17278 ) ) ( not ( = ?auto_17279 ?auto_17278 ) ) ( ON ?auto_17276 ?auto_17275 ) ( ON-TABLE ?auto_17278 ) ( ON ?auto_17277 ?auto_17276 ) ( ON ?auto_17279 ?auto_17277 ) ( CLEAR ?auto_17279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17278 ?auto_17275 ?auto_17276 ?auto_17277 )
      ( MAKE-3PILE ?auto_17275 ?auto_17276 ?auto_17277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17284 - BLOCK
      ?auto_17285 - BLOCK
      ?auto_17286 - BLOCK
      ?auto_17287 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_17287 ) ( CLEAR ?auto_17286 ) ( ON-TABLE ?auto_17284 ) ( ON ?auto_17285 ?auto_17284 ) ( ON ?auto_17286 ?auto_17285 ) ( not ( = ?auto_17284 ?auto_17285 ) ) ( not ( = ?auto_17284 ?auto_17286 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( not ( = ?auto_17285 ?auto_17286 ) ) ( not ( = ?auto_17285 ?auto_17287 ) ) ( not ( = ?auto_17286 ?auto_17287 ) ) )
    :subtasks
    ( ( !STACK ?auto_17287 ?auto_17286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17288 - BLOCK
      ?auto_17289 - BLOCK
      ?auto_17290 - BLOCK
      ?auto_17291 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17290 ) ( ON-TABLE ?auto_17288 ) ( ON ?auto_17289 ?auto_17288 ) ( ON ?auto_17290 ?auto_17289 ) ( not ( = ?auto_17288 ?auto_17289 ) ) ( not ( = ?auto_17288 ?auto_17290 ) ) ( not ( = ?auto_17288 ?auto_17291 ) ) ( not ( = ?auto_17289 ?auto_17290 ) ) ( not ( = ?auto_17289 ?auto_17291 ) ) ( not ( = ?auto_17290 ?auto_17291 ) ) ( ON-TABLE ?auto_17291 ) ( CLEAR ?auto_17291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_17291 )
      ( MAKE-4PILE ?auto_17288 ?auto_17289 ?auto_17290 ?auto_17291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17292 - BLOCK
      ?auto_17293 - BLOCK
      ?auto_17294 - BLOCK
      ?auto_17295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17292 ) ( ON ?auto_17293 ?auto_17292 ) ( not ( = ?auto_17292 ?auto_17293 ) ) ( not ( = ?auto_17292 ?auto_17294 ) ) ( not ( = ?auto_17292 ?auto_17295 ) ) ( not ( = ?auto_17293 ?auto_17294 ) ) ( not ( = ?auto_17293 ?auto_17295 ) ) ( not ( = ?auto_17294 ?auto_17295 ) ) ( ON-TABLE ?auto_17295 ) ( CLEAR ?auto_17295 ) ( HOLDING ?auto_17294 ) ( CLEAR ?auto_17293 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17292 ?auto_17293 ?auto_17294 )
      ( MAKE-4PILE ?auto_17292 ?auto_17293 ?auto_17294 ?auto_17295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17296 - BLOCK
      ?auto_17297 - BLOCK
      ?auto_17298 - BLOCK
      ?auto_17299 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17296 ) ( ON ?auto_17297 ?auto_17296 ) ( not ( = ?auto_17296 ?auto_17297 ) ) ( not ( = ?auto_17296 ?auto_17298 ) ) ( not ( = ?auto_17296 ?auto_17299 ) ) ( not ( = ?auto_17297 ?auto_17298 ) ) ( not ( = ?auto_17297 ?auto_17299 ) ) ( not ( = ?auto_17298 ?auto_17299 ) ) ( ON-TABLE ?auto_17299 ) ( CLEAR ?auto_17297 ) ( ON ?auto_17298 ?auto_17299 ) ( CLEAR ?auto_17298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17299 )
      ( MAKE-4PILE ?auto_17296 ?auto_17297 ?auto_17298 ?auto_17299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17300 - BLOCK
      ?auto_17301 - BLOCK
      ?auto_17302 - BLOCK
      ?auto_17303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17300 ) ( not ( = ?auto_17300 ?auto_17301 ) ) ( not ( = ?auto_17300 ?auto_17302 ) ) ( not ( = ?auto_17300 ?auto_17303 ) ) ( not ( = ?auto_17301 ?auto_17302 ) ) ( not ( = ?auto_17301 ?auto_17303 ) ) ( not ( = ?auto_17302 ?auto_17303 ) ) ( ON-TABLE ?auto_17303 ) ( ON ?auto_17302 ?auto_17303 ) ( CLEAR ?auto_17302 ) ( HOLDING ?auto_17301 ) ( CLEAR ?auto_17300 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17300 ?auto_17301 )
      ( MAKE-4PILE ?auto_17300 ?auto_17301 ?auto_17302 ?auto_17303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17304 - BLOCK
      ?auto_17305 - BLOCK
      ?auto_17306 - BLOCK
      ?auto_17307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17304 ) ( not ( = ?auto_17304 ?auto_17305 ) ) ( not ( = ?auto_17304 ?auto_17306 ) ) ( not ( = ?auto_17304 ?auto_17307 ) ) ( not ( = ?auto_17305 ?auto_17306 ) ) ( not ( = ?auto_17305 ?auto_17307 ) ) ( not ( = ?auto_17306 ?auto_17307 ) ) ( ON-TABLE ?auto_17307 ) ( ON ?auto_17306 ?auto_17307 ) ( CLEAR ?auto_17304 ) ( ON ?auto_17305 ?auto_17306 ) ( CLEAR ?auto_17305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17307 ?auto_17306 )
      ( MAKE-4PILE ?auto_17304 ?auto_17305 ?auto_17306 ?auto_17307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17308 - BLOCK
      ?auto_17309 - BLOCK
      ?auto_17310 - BLOCK
      ?auto_17311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17308 ?auto_17309 ) ) ( not ( = ?auto_17308 ?auto_17310 ) ) ( not ( = ?auto_17308 ?auto_17311 ) ) ( not ( = ?auto_17309 ?auto_17310 ) ) ( not ( = ?auto_17309 ?auto_17311 ) ) ( not ( = ?auto_17310 ?auto_17311 ) ) ( ON-TABLE ?auto_17311 ) ( ON ?auto_17310 ?auto_17311 ) ( ON ?auto_17309 ?auto_17310 ) ( CLEAR ?auto_17309 ) ( HOLDING ?auto_17308 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17308 )
      ( MAKE-4PILE ?auto_17308 ?auto_17309 ?auto_17310 ?auto_17311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17312 - BLOCK
      ?auto_17313 - BLOCK
      ?auto_17314 - BLOCK
      ?auto_17315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17312 ?auto_17313 ) ) ( not ( = ?auto_17312 ?auto_17314 ) ) ( not ( = ?auto_17312 ?auto_17315 ) ) ( not ( = ?auto_17313 ?auto_17314 ) ) ( not ( = ?auto_17313 ?auto_17315 ) ) ( not ( = ?auto_17314 ?auto_17315 ) ) ( ON-TABLE ?auto_17315 ) ( ON ?auto_17314 ?auto_17315 ) ( ON ?auto_17313 ?auto_17314 ) ( ON ?auto_17312 ?auto_17313 ) ( CLEAR ?auto_17312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17315 ?auto_17314 ?auto_17313 )
      ( MAKE-4PILE ?auto_17312 ?auto_17313 ?auto_17314 ?auto_17315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17316 - BLOCK
      ?auto_17317 - BLOCK
      ?auto_17318 - BLOCK
      ?auto_17319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17316 ?auto_17317 ) ) ( not ( = ?auto_17316 ?auto_17318 ) ) ( not ( = ?auto_17316 ?auto_17319 ) ) ( not ( = ?auto_17317 ?auto_17318 ) ) ( not ( = ?auto_17317 ?auto_17319 ) ) ( not ( = ?auto_17318 ?auto_17319 ) ) ( ON-TABLE ?auto_17319 ) ( ON ?auto_17318 ?auto_17319 ) ( ON ?auto_17317 ?auto_17318 ) ( HOLDING ?auto_17316 ) ( CLEAR ?auto_17317 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17319 ?auto_17318 ?auto_17317 ?auto_17316 )
      ( MAKE-4PILE ?auto_17316 ?auto_17317 ?auto_17318 ?auto_17319 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17320 - BLOCK
      ?auto_17321 - BLOCK
      ?auto_17322 - BLOCK
      ?auto_17323 - BLOCK
    )
    :vars
    (
      ?auto_17324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17320 ?auto_17321 ) ) ( not ( = ?auto_17320 ?auto_17322 ) ) ( not ( = ?auto_17320 ?auto_17323 ) ) ( not ( = ?auto_17321 ?auto_17322 ) ) ( not ( = ?auto_17321 ?auto_17323 ) ) ( not ( = ?auto_17322 ?auto_17323 ) ) ( ON-TABLE ?auto_17323 ) ( ON ?auto_17322 ?auto_17323 ) ( ON ?auto_17321 ?auto_17322 ) ( CLEAR ?auto_17321 ) ( ON ?auto_17320 ?auto_17324 ) ( CLEAR ?auto_17320 ) ( HAND-EMPTY ) ( not ( = ?auto_17320 ?auto_17324 ) ) ( not ( = ?auto_17321 ?auto_17324 ) ) ( not ( = ?auto_17322 ?auto_17324 ) ) ( not ( = ?auto_17323 ?auto_17324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17320 ?auto_17324 )
      ( MAKE-4PILE ?auto_17320 ?auto_17321 ?auto_17322 ?auto_17323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17325 - BLOCK
      ?auto_17326 - BLOCK
      ?auto_17327 - BLOCK
      ?auto_17328 - BLOCK
    )
    :vars
    (
      ?auto_17329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17325 ?auto_17326 ) ) ( not ( = ?auto_17325 ?auto_17327 ) ) ( not ( = ?auto_17325 ?auto_17328 ) ) ( not ( = ?auto_17326 ?auto_17327 ) ) ( not ( = ?auto_17326 ?auto_17328 ) ) ( not ( = ?auto_17327 ?auto_17328 ) ) ( ON-TABLE ?auto_17328 ) ( ON ?auto_17327 ?auto_17328 ) ( ON ?auto_17325 ?auto_17329 ) ( CLEAR ?auto_17325 ) ( not ( = ?auto_17325 ?auto_17329 ) ) ( not ( = ?auto_17326 ?auto_17329 ) ) ( not ( = ?auto_17327 ?auto_17329 ) ) ( not ( = ?auto_17328 ?auto_17329 ) ) ( HOLDING ?auto_17326 ) ( CLEAR ?auto_17327 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17328 ?auto_17327 ?auto_17326 )
      ( MAKE-4PILE ?auto_17325 ?auto_17326 ?auto_17327 ?auto_17328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17330 - BLOCK
      ?auto_17331 - BLOCK
      ?auto_17332 - BLOCK
      ?auto_17333 - BLOCK
    )
    :vars
    (
      ?auto_17334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17330 ?auto_17331 ) ) ( not ( = ?auto_17330 ?auto_17332 ) ) ( not ( = ?auto_17330 ?auto_17333 ) ) ( not ( = ?auto_17331 ?auto_17332 ) ) ( not ( = ?auto_17331 ?auto_17333 ) ) ( not ( = ?auto_17332 ?auto_17333 ) ) ( ON-TABLE ?auto_17333 ) ( ON ?auto_17332 ?auto_17333 ) ( ON ?auto_17330 ?auto_17334 ) ( not ( = ?auto_17330 ?auto_17334 ) ) ( not ( = ?auto_17331 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17333 ?auto_17334 ) ) ( CLEAR ?auto_17332 ) ( ON ?auto_17331 ?auto_17330 ) ( CLEAR ?auto_17331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17334 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17334 ?auto_17330 )
      ( MAKE-4PILE ?auto_17330 ?auto_17331 ?auto_17332 ?auto_17333 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17335 - BLOCK
      ?auto_17336 - BLOCK
      ?auto_17337 - BLOCK
      ?auto_17338 - BLOCK
    )
    :vars
    (
      ?auto_17339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17335 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17337 ) ) ( not ( = ?auto_17335 ?auto_17338 ) ) ( not ( = ?auto_17336 ?auto_17337 ) ) ( not ( = ?auto_17336 ?auto_17338 ) ) ( not ( = ?auto_17337 ?auto_17338 ) ) ( ON-TABLE ?auto_17338 ) ( ON ?auto_17335 ?auto_17339 ) ( not ( = ?auto_17335 ?auto_17339 ) ) ( not ( = ?auto_17336 ?auto_17339 ) ) ( not ( = ?auto_17337 ?auto_17339 ) ) ( not ( = ?auto_17338 ?auto_17339 ) ) ( ON ?auto_17336 ?auto_17335 ) ( CLEAR ?auto_17336 ) ( ON-TABLE ?auto_17339 ) ( HOLDING ?auto_17337 ) ( CLEAR ?auto_17338 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17338 ?auto_17337 )
      ( MAKE-4PILE ?auto_17335 ?auto_17336 ?auto_17337 ?auto_17338 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17340 - BLOCK
      ?auto_17341 - BLOCK
      ?auto_17342 - BLOCK
      ?auto_17343 - BLOCK
    )
    :vars
    (
      ?auto_17344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17340 ?auto_17341 ) ) ( not ( = ?auto_17340 ?auto_17342 ) ) ( not ( = ?auto_17340 ?auto_17343 ) ) ( not ( = ?auto_17341 ?auto_17342 ) ) ( not ( = ?auto_17341 ?auto_17343 ) ) ( not ( = ?auto_17342 ?auto_17343 ) ) ( ON-TABLE ?auto_17343 ) ( ON ?auto_17340 ?auto_17344 ) ( not ( = ?auto_17340 ?auto_17344 ) ) ( not ( = ?auto_17341 ?auto_17344 ) ) ( not ( = ?auto_17342 ?auto_17344 ) ) ( not ( = ?auto_17343 ?auto_17344 ) ) ( ON ?auto_17341 ?auto_17340 ) ( ON-TABLE ?auto_17344 ) ( CLEAR ?auto_17343 ) ( ON ?auto_17342 ?auto_17341 ) ( CLEAR ?auto_17342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17344 ?auto_17340 ?auto_17341 )
      ( MAKE-4PILE ?auto_17340 ?auto_17341 ?auto_17342 ?auto_17343 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17345 - BLOCK
      ?auto_17346 - BLOCK
      ?auto_17347 - BLOCK
      ?auto_17348 - BLOCK
    )
    :vars
    (
      ?auto_17349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17345 ?auto_17346 ) ) ( not ( = ?auto_17345 ?auto_17347 ) ) ( not ( = ?auto_17345 ?auto_17348 ) ) ( not ( = ?auto_17346 ?auto_17347 ) ) ( not ( = ?auto_17346 ?auto_17348 ) ) ( not ( = ?auto_17347 ?auto_17348 ) ) ( ON ?auto_17345 ?auto_17349 ) ( not ( = ?auto_17345 ?auto_17349 ) ) ( not ( = ?auto_17346 ?auto_17349 ) ) ( not ( = ?auto_17347 ?auto_17349 ) ) ( not ( = ?auto_17348 ?auto_17349 ) ) ( ON ?auto_17346 ?auto_17345 ) ( ON-TABLE ?auto_17349 ) ( ON ?auto_17347 ?auto_17346 ) ( CLEAR ?auto_17347 ) ( HOLDING ?auto_17348 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17348 )
      ( MAKE-4PILE ?auto_17345 ?auto_17346 ?auto_17347 ?auto_17348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17350 - BLOCK
      ?auto_17351 - BLOCK
      ?auto_17352 - BLOCK
      ?auto_17353 - BLOCK
    )
    :vars
    (
      ?auto_17354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17350 ?auto_17351 ) ) ( not ( = ?auto_17350 ?auto_17352 ) ) ( not ( = ?auto_17350 ?auto_17353 ) ) ( not ( = ?auto_17351 ?auto_17352 ) ) ( not ( = ?auto_17351 ?auto_17353 ) ) ( not ( = ?auto_17352 ?auto_17353 ) ) ( ON ?auto_17350 ?auto_17354 ) ( not ( = ?auto_17350 ?auto_17354 ) ) ( not ( = ?auto_17351 ?auto_17354 ) ) ( not ( = ?auto_17352 ?auto_17354 ) ) ( not ( = ?auto_17353 ?auto_17354 ) ) ( ON ?auto_17351 ?auto_17350 ) ( ON-TABLE ?auto_17354 ) ( ON ?auto_17352 ?auto_17351 ) ( ON ?auto_17353 ?auto_17352 ) ( CLEAR ?auto_17353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17354 ?auto_17350 ?auto_17351 ?auto_17352 )
      ( MAKE-4PILE ?auto_17350 ?auto_17351 ?auto_17352 ?auto_17353 ) )
  )

)

