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
      ?auto_7754 - BLOCK
      ?auto_7755 - BLOCK
      ?auto_7756 - BLOCK
      ?auto_7757 - BLOCK
    )
    :vars
    (
      ?auto_7758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7758 ?auto_7757 ) ( CLEAR ?auto_7758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7754 ) ( ON ?auto_7755 ?auto_7754 ) ( ON ?auto_7756 ?auto_7755 ) ( ON ?auto_7757 ?auto_7756 ) ( not ( = ?auto_7754 ?auto_7755 ) ) ( not ( = ?auto_7754 ?auto_7756 ) ) ( not ( = ?auto_7754 ?auto_7757 ) ) ( not ( = ?auto_7754 ?auto_7758 ) ) ( not ( = ?auto_7755 ?auto_7756 ) ) ( not ( = ?auto_7755 ?auto_7757 ) ) ( not ( = ?auto_7755 ?auto_7758 ) ) ( not ( = ?auto_7756 ?auto_7757 ) ) ( not ( = ?auto_7756 ?auto_7758 ) ) ( not ( = ?auto_7757 ?auto_7758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7758 ?auto_7757 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7760 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7760 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7761 - BLOCK
    )
    :vars
    (
      ?auto_7762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7761 ?auto_7762 ) ( CLEAR ?auto_7761 ) ( HAND-EMPTY ) ( not ( = ?auto_7761 ?auto_7762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7761 ?auto_7762 )
      ( MAKE-1PILE ?auto_7761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7766 - BLOCK
      ?auto_7767 - BLOCK
      ?auto_7768 - BLOCK
    )
    :vars
    (
      ?auto_7769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7769 ?auto_7768 ) ( CLEAR ?auto_7769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7766 ) ( ON ?auto_7767 ?auto_7766 ) ( ON ?auto_7768 ?auto_7767 ) ( not ( = ?auto_7766 ?auto_7767 ) ) ( not ( = ?auto_7766 ?auto_7768 ) ) ( not ( = ?auto_7766 ?auto_7769 ) ) ( not ( = ?auto_7767 ?auto_7768 ) ) ( not ( = ?auto_7767 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7769 ?auto_7768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7770 - BLOCK
      ?auto_7771 - BLOCK
      ?auto_7772 - BLOCK
    )
    :vars
    (
      ?auto_7773 - BLOCK
      ?auto_7774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7773 ?auto_7772 ) ( CLEAR ?auto_7773 ) ( ON-TABLE ?auto_7770 ) ( ON ?auto_7771 ?auto_7770 ) ( ON ?auto_7772 ?auto_7771 ) ( not ( = ?auto_7770 ?auto_7771 ) ) ( not ( = ?auto_7770 ?auto_7772 ) ) ( not ( = ?auto_7770 ?auto_7773 ) ) ( not ( = ?auto_7771 ?auto_7772 ) ) ( not ( = ?auto_7771 ?auto_7773 ) ) ( not ( = ?auto_7772 ?auto_7773 ) ) ( HOLDING ?auto_7774 ) ( not ( = ?auto_7770 ?auto_7774 ) ) ( not ( = ?auto_7771 ?auto_7774 ) ) ( not ( = ?auto_7772 ?auto_7774 ) ) ( not ( = ?auto_7773 ?auto_7774 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7774 )
      ( MAKE-3PILE ?auto_7770 ?auto_7771 ?auto_7772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7775 - BLOCK
      ?auto_7776 - BLOCK
      ?auto_7777 - BLOCK
    )
    :vars
    (
      ?auto_7778 - BLOCK
      ?auto_7779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7778 ?auto_7777 ) ( ON-TABLE ?auto_7775 ) ( ON ?auto_7776 ?auto_7775 ) ( ON ?auto_7777 ?auto_7776 ) ( not ( = ?auto_7775 ?auto_7776 ) ) ( not ( = ?auto_7775 ?auto_7777 ) ) ( not ( = ?auto_7775 ?auto_7778 ) ) ( not ( = ?auto_7776 ?auto_7777 ) ) ( not ( = ?auto_7776 ?auto_7778 ) ) ( not ( = ?auto_7777 ?auto_7778 ) ) ( not ( = ?auto_7775 ?auto_7779 ) ) ( not ( = ?auto_7776 ?auto_7779 ) ) ( not ( = ?auto_7777 ?auto_7779 ) ) ( not ( = ?auto_7778 ?auto_7779 ) ) ( ON ?auto_7779 ?auto_7778 ) ( CLEAR ?auto_7779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7775 ?auto_7776 ?auto_7777 ?auto_7778 )
      ( MAKE-3PILE ?auto_7775 ?auto_7776 ?auto_7777 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7782 - BLOCK
      ?auto_7783 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7783 ) ( CLEAR ?auto_7782 ) ( ON-TABLE ?auto_7782 ) ( not ( = ?auto_7782 ?auto_7783 ) ) )
    :subtasks
    ( ( !STACK ?auto_7783 ?auto_7782 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7784 - BLOCK
      ?auto_7785 - BLOCK
    )
    :vars
    (
      ?auto_7786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7784 ) ( ON-TABLE ?auto_7784 ) ( not ( = ?auto_7784 ?auto_7785 ) ) ( ON ?auto_7785 ?auto_7786 ) ( CLEAR ?auto_7785 ) ( HAND-EMPTY ) ( not ( = ?auto_7784 ?auto_7786 ) ) ( not ( = ?auto_7785 ?auto_7786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7785 ?auto_7786 )
      ( MAKE-2PILE ?auto_7784 ?auto_7785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7787 - BLOCK
      ?auto_7788 - BLOCK
    )
    :vars
    (
      ?auto_7789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7787 ?auto_7788 ) ) ( ON ?auto_7788 ?auto_7789 ) ( CLEAR ?auto_7788 ) ( not ( = ?auto_7787 ?auto_7789 ) ) ( not ( = ?auto_7788 ?auto_7789 ) ) ( HOLDING ?auto_7787 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7787 )
      ( MAKE-2PILE ?auto_7787 ?auto_7788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7790 - BLOCK
      ?auto_7791 - BLOCK
    )
    :vars
    (
      ?auto_7792 - BLOCK
      ?auto_7793 - BLOCK
      ?auto_7794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7790 ?auto_7791 ) ) ( ON ?auto_7791 ?auto_7792 ) ( not ( = ?auto_7790 ?auto_7792 ) ) ( not ( = ?auto_7791 ?auto_7792 ) ) ( ON ?auto_7790 ?auto_7791 ) ( CLEAR ?auto_7790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7793 ) ( ON ?auto_7794 ?auto_7793 ) ( ON ?auto_7792 ?auto_7794 ) ( not ( = ?auto_7793 ?auto_7794 ) ) ( not ( = ?auto_7793 ?auto_7792 ) ) ( not ( = ?auto_7793 ?auto_7791 ) ) ( not ( = ?auto_7793 ?auto_7790 ) ) ( not ( = ?auto_7794 ?auto_7792 ) ) ( not ( = ?auto_7794 ?auto_7791 ) ) ( not ( = ?auto_7794 ?auto_7790 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7793 ?auto_7794 ?auto_7792 ?auto_7791 )
      ( MAKE-2PILE ?auto_7790 ?auto_7791 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7797 - BLOCK
      ?auto_7798 - BLOCK
    )
    :vars
    (
      ?auto_7799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7799 ?auto_7798 ) ( CLEAR ?auto_7799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7797 ) ( ON ?auto_7798 ?auto_7797 ) ( not ( = ?auto_7797 ?auto_7798 ) ) ( not ( = ?auto_7797 ?auto_7799 ) ) ( not ( = ?auto_7798 ?auto_7799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7799 ?auto_7798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7800 - BLOCK
      ?auto_7801 - BLOCK
    )
    :vars
    (
      ?auto_7802 - BLOCK
      ?auto_7803 - BLOCK
      ?auto_7804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7802 ?auto_7801 ) ( CLEAR ?auto_7802 ) ( ON-TABLE ?auto_7800 ) ( ON ?auto_7801 ?auto_7800 ) ( not ( = ?auto_7800 ?auto_7801 ) ) ( not ( = ?auto_7800 ?auto_7802 ) ) ( not ( = ?auto_7801 ?auto_7802 ) ) ( HOLDING ?auto_7803 ) ( CLEAR ?auto_7804 ) ( not ( = ?auto_7800 ?auto_7803 ) ) ( not ( = ?auto_7800 ?auto_7804 ) ) ( not ( = ?auto_7801 ?auto_7803 ) ) ( not ( = ?auto_7801 ?auto_7804 ) ) ( not ( = ?auto_7802 ?auto_7803 ) ) ( not ( = ?auto_7802 ?auto_7804 ) ) ( not ( = ?auto_7803 ?auto_7804 ) ) )
    :subtasks
    ( ( !STACK ?auto_7803 ?auto_7804 )
      ( MAKE-2PILE ?auto_7800 ?auto_7801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7805 - BLOCK
      ?auto_7806 - BLOCK
    )
    :vars
    (
      ?auto_7808 - BLOCK
      ?auto_7809 - BLOCK
      ?auto_7807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7808 ?auto_7806 ) ( ON-TABLE ?auto_7805 ) ( ON ?auto_7806 ?auto_7805 ) ( not ( = ?auto_7805 ?auto_7806 ) ) ( not ( = ?auto_7805 ?auto_7808 ) ) ( not ( = ?auto_7806 ?auto_7808 ) ) ( CLEAR ?auto_7809 ) ( not ( = ?auto_7805 ?auto_7807 ) ) ( not ( = ?auto_7805 ?auto_7809 ) ) ( not ( = ?auto_7806 ?auto_7807 ) ) ( not ( = ?auto_7806 ?auto_7809 ) ) ( not ( = ?auto_7808 ?auto_7807 ) ) ( not ( = ?auto_7808 ?auto_7809 ) ) ( not ( = ?auto_7807 ?auto_7809 ) ) ( ON ?auto_7807 ?auto_7808 ) ( CLEAR ?auto_7807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7805 ?auto_7806 ?auto_7808 )
      ( MAKE-2PILE ?auto_7805 ?auto_7806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7810 - BLOCK
      ?auto_7811 - BLOCK
    )
    :vars
    (
      ?auto_7812 - BLOCK
      ?auto_7814 - BLOCK
      ?auto_7813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7812 ?auto_7811 ) ( ON-TABLE ?auto_7810 ) ( ON ?auto_7811 ?auto_7810 ) ( not ( = ?auto_7810 ?auto_7811 ) ) ( not ( = ?auto_7810 ?auto_7812 ) ) ( not ( = ?auto_7811 ?auto_7812 ) ) ( not ( = ?auto_7810 ?auto_7814 ) ) ( not ( = ?auto_7810 ?auto_7813 ) ) ( not ( = ?auto_7811 ?auto_7814 ) ) ( not ( = ?auto_7811 ?auto_7813 ) ) ( not ( = ?auto_7812 ?auto_7814 ) ) ( not ( = ?auto_7812 ?auto_7813 ) ) ( not ( = ?auto_7814 ?auto_7813 ) ) ( ON ?auto_7814 ?auto_7812 ) ( CLEAR ?auto_7814 ) ( HOLDING ?auto_7813 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7813 )
      ( MAKE-2PILE ?auto_7810 ?auto_7811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7815 - BLOCK
      ?auto_7816 - BLOCK
    )
    :vars
    (
      ?auto_7818 - BLOCK
      ?auto_7819 - BLOCK
      ?auto_7817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7818 ?auto_7816 ) ( ON-TABLE ?auto_7815 ) ( ON ?auto_7816 ?auto_7815 ) ( not ( = ?auto_7815 ?auto_7816 ) ) ( not ( = ?auto_7815 ?auto_7818 ) ) ( not ( = ?auto_7816 ?auto_7818 ) ) ( not ( = ?auto_7815 ?auto_7819 ) ) ( not ( = ?auto_7815 ?auto_7817 ) ) ( not ( = ?auto_7816 ?auto_7819 ) ) ( not ( = ?auto_7816 ?auto_7817 ) ) ( not ( = ?auto_7818 ?auto_7819 ) ) ( not ( = ?auto_7818 ?auto_7817 ) ) ( not ( = ?auto_7819 ?auto_7817 ) ) ( ON ?auto_7819 ?auto_7818 ) ( ON ?auto_7817 ?auto_7819 ) ( CLEAR ?auto_7817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7815 ?auto_7816 ?auto_7818 ?auto_7819 )
      ( MAKE-2PILE ?auto_7815 ?auto_7816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7823 - BLOCK
      ?auto_7824 - BLOCK
      ?auto_7825 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7825 ) ( CLEAR ?auto_7824 ) ( ON-TABLE ?auto_7823 ) ( ON ?auto_7824 ?auto_7823 ) ( not ( = ?auto_7823 ?auto_7824 ) ) ( not ( = ?auto_7823 ?auto_7825 ) ) ( not ( = ?auto_7824 ?auto_7825 ) ) )
    :subtasks
    ( ( !STACK ?auto_7825 ?auto_7824 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7826 - BLOCK
      ?auto_7827 - BLOCK
      ?auto_7828 - BLOCK
    )
    :vars
    (
      ?auto_7829 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7827 ) ( ON-TABLE ?auto_7826 ) ( ON ?auto_7827 ?auto_7826 ) ( not ( = ?auto_7826 ?auto_7827 ) ) ( not ( = ?auto_7826 ?auto_7828 ) ) ( not ( = ?auto_7827 ?auto_7828 ) ) ( ON ?auto_7828 ?auto_7829 ) ( CLEAR ?auto_7828 ) ( HAND-EMPTY ) ( not ( = ?auto_7826 ?auto_7829 ) ) ( not ( = ?auto_7827 ?auto_7829 ) ) ( not ( = ?auto_7828 ?auto_7829 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7828 ?auto_7829 )
      ( MAKE-3PILE ?auto_7826 ?auto_7827 ?auto_7828 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7830 - BLOCK
      ?auto_7831 - BLOCK
      ?auto_7832 - BLOCK
    )
    :vars
    (
      ?auto_7833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7830 ) ( not ( = ?auto_7830 ?auto_7831 ) ) ( not ( = ?auto_7830 ?auto_7832 ) ) ( not ( = ?auto_7831 ?auto_7832 ) ) ( ON ?auto_7832 ?auto_7833 ) ( CLEAR ?auto_7832 ) ( not ( = ?auto_7830 ?auto_7833 ) ) ( not ( = ?auto_7831 ?auto_7833 ) ) ( not ( = ?auto_7832 ?auto_7833 ) ) ( HOLDING ?auto_7831 ) ( CLEAR ?auto_7830 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7830 ?auto_7831 )
      ( MAKE-3PILE ?auto_7830 ?auto_7831 ?auto_7832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7834 - BLOCK
      ?auto_7835 - BLOCK
      ?auto_7836 - BLOCK
    )
    :vars
    (
      ?auto_7837 - BLOCK
      ?auto_7838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7834 ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( not ( = ?auto_7835 ?auto_7836 ) ) ( ON ?auto_7836 ?auto_7837 ) ( not ( = ?auto_7834 ?auto_7837 ) ) ( not ( = ?auto_7835 ?auto_7837 ) ) ( not ( = ?auto_7836 ?auto_7837 ) ) ( CLEAR ?auto_7834 ) ( ON ?auto_7835 ?auto_7836 ) ( CLEAR ?auto_7835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7838 ) ( ON ?auto_7837 ?auto_7838 ) ( not ( = ?auto_7838 ?auto_7837 ) ) ( not ( = ?auto_7838 ?auto_7836 ) ) ( not ( = ?auto_7838 ?auto_7835 ) ) ( not ( = ?auto_7834 ?auto_7838 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7838 ?auto_7837 ?auto_7836 )
      ( MAKE-3PILE ?auto_7834 ?auto_7835 ?auto_7836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7839 - BLOCK
      ?auto_7840 - BLOCK
      ?auto_7841 - BLOCK
    )
    :vars
    (
      ?auto_7843 - BLOCK
      ?auto_7842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7839 ?auto_7840 ) ) ( not ( = ?auto_7839 ?auto_7841 ) ) ( not ( = ?auto_7840 ?auto_7841 ) ) ( ON ?auto_7841 ?auto_7843 ) ( not ( = ?auto_7839 ?auto_7843 ) ) ( not ( = ?auto_7840 ?auto_7843 ) ) ( not ( = ?auto_7841 ?auto_7843 ) ) ( ON ?auto_7840 ?auto_7841 ) ( CLEAR ?auto_7840 ) ( ON-TABLE ?auto_7842 ) ( ON ?auto_7843 ?auto_7842 ) ( not ( = ?auto_7842 ?auto_7843 ) ) ( not ( = ?auto_7842 ?auto_7841 ) ) ( not ( = ?auto_7842 ?auto_7840 ) ) ( not ( = ?auto_7839 ?auto_7842 ) ) ( HOLDING ?auto_7839 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7839 )
      ( MAKE-3PILE ?auto_7839 ?auto_7840 ?auto_7841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7844 - BLOCK
      ?auto_7845 - BLOCK
      ?auto_7846 - BLOCK
    )
    :vars
    (
      ?auto_7847 - BLOCK
      ?auto_7848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7844 ?auto_7845 ) ) ( not ( = ?auto_7844 ?auto_7846 ) ) ( not ( = ?auto_7845 ?auto_7846 ) ) ( ON ?auto_7846 ?auto_7847 ) ( not ( = ?auto_7844 ?auto_7847 ) ) ( not ( = ?auto_7845 ?auto_7847 ) ) ( not ( = ?auto_7846 ?auto_7847 ) ) ( ON ?auto_7845 ?auto_7846 ) ( ON-TABLE ?auto_7848 ) ( ON ?auto_7847 ?auto_7848 ) ( not ( = ?auto_7848 ?auto_7847 ) ) ( not ( = ?auto_7848 ?auto_7846 ) ) ( not ( = ?auto_7848 ?auto_7845 ) ) ( not ( = ?auto_7844 ?auto_7848 ) ) ( ON ?auto_7844 ?auto_7845 ) ( CLEAR ?auto_7844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7848 ?auto_7847 ?auto_7846 ?auto_7845 )
      ( MAKE-3PILE ?auto_7844 ?auto_7845 ?auto_7846 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7850 - BLOCK
    )
    :vars
    (
      ?auto_7851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7851 ?auto_7850 ) ( CLEAR ?auto_7851 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7850 ) ( not ( = ?auto_7850 ?auto_7851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7851 ?auto_7850 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7852 - BLOCK
    )
    :vars
    (
      ?auto_7853 - BLOCK
      ?auto_7854 - BLOCK
      ?auto_7855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7853 ?auto_7852 ) ( CLEAR ?auto_7853 ) ( ON-TABLE ?auto_7852 ) ( not ( = ?auto_7852 ?auto_7853 ) ) ( HOLDING ?auto_7854 ) ( CLEAR ?auto_7855 ) ( not ( = ?auto_7852 ?auto_7854 ) ) ( not ( = ?auto_7852 ?auto_7855 ) ) ( not ( = ?auto_7853 ?auto_7854 ) ) ( not ( = ?auto_7853 ?auto_7855 ) ) ( not ( = ?auto_7854 ?auto_7855 ) ) )
    :subtasks
    ( ( !STACK ?auto_7854 ?auto_7855 )
      ( MAKE-1PILE ?auto_7852 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7856 - BLOCK
    )
    :vars
    (
      ?auto_7859 - BLOCK
      ?auto_7857 - BLOCK
      ?auto_7858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7859 ?auto_7856 ) ( ON-TABLE ?auto_7856 ) ( not ( = ?auto_7856 ?auto_7859 ) ) ( CLEAR ?auto_7857 ) ( not ( = ?auto_7856 ?auto_7858 ) ) ( not ( = ?auto_7856 ?auto_7857 ) ) ( not ( = ?auto_7859 ?auto_7858 ) ) ( not ( = ?auto_7859 ?auto_7857 ) ) ( not ( = ?auto_7858 ?auto_7857 ) ) ( ON ?auto_7858 ?auto_7859 ) ( CLEAR ?auto_7858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7856 ?auto_7859 )
      ( MAKE-1PILE ?auto_7856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7860 - BLOCK
    )
    :vars
    (
      ?auto_7863 - BLOCK
      ?auto_7862 - BLOCK
      ?auto_7861 - BLOCK
      ?auto_7864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7863 ?auto_7860 ) ( ON-TABLE ?auto_7860 ) ( not ( = ?auto_7860 ?auto_7863 ) ) ( not ( = ?auto_7860 ?auto_7862 ) ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( not ( = ?auto_7863 ?auto_7862 ) ) ( not ( = ?auto_7863 ?auto_7861 ) ) ( not ( = ?auto_7862 ?auto_7861 ) ) ( ON ?auto_7862 ?auto_7863 ) ( CLEAR ?auto_7862 ) ( HOLDING ?auto_7861 ) ( CLEAR ?auto_7864 ) ( ON-TABLE ?auto_7864 ) ( not ( = ?auto_7864 ?auto_7861 ) ) ( not ( = ?auto_7860 ?auto_7864 ) ) ( not ( = ?auto_7863 ?auto_7864 ) ) ( not ( = ?auto_7862 ?auto_7864 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7864 ?auto_7861 )
      ( MAKE-1PILE ?auto_7860 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7865 - BLOCK
    )
    :vars
    (
      ?auto_7869 - BLOCK
      ?auto_7867 - BLOCK
      ?auto_7868 - BLOCK
      ?auto_7866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7869 ?auto_7865 ) ( ON-TABLE ?auto_7865 ) ( not ( = ?auto_7865 ?auto_7869 ) ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( not ( = ?auto_7865 ?auto_7868 ) ) ( not ( = ?auto_7869 ?auto_7867 ) ) ( not ( = ?auto_7869 ?auto_7868 ) ) ( not ( = ?auto_7867 ?auto_7868 ) ) ( ON ?auto_7867 ?auto_7869 ) ( CLEAR ?auto_7866 ) ( ON-TABLE ?auto_7866 ) ( not ( = ?auto_7866 ?auto_7868 ) ) ( not ( = ?auto_7865 ?auto_7866 ) ) ( not ( = ?auto_7869 ?auto_7866 ) ) ( not ( = ?auto_7867 ?auto_7866 ) ) ( ON ?auto_7868 ?auto_7867 ) ( CLEAR ?auto_7868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7865 ?auto_7869 ?auto_7867 )
      ( MAKE-1PILE ?auto_7865 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7870 - BLOCK
    )
    :vars
    (
      ?auto_7872 - BLOCK
      ?auto_7874 - BLOCK
      ?auto_7871 - BLOCK
      ?auto_7873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7872 ?auto_7870 ) ( ON-TABLE ?auto_7870 ) ( not ( = ?auto_7870 ?auto_7872 ) ) ( not ( = ?auto_7870 ?auto_7874 ) ) ( not ( = ?auto_7870 ?auto_7871 ) ) ( not ( = ?auto_7872 ?auto_7874 ) ) ( not ( = ?auto_7872 ?auto_7871 ) ) ( not ( = ?auto_7874 ?auto_7871 ) ) ( ON ?auto_7874 ?auto_7872 ) ( not ( = ?auto_7873 ?auto_7871 ) ) ( not ( = ?auto_7870 ?auto_7873 ) ) ( not ( = ?auto_7872 ?auto_7873 ) ) ( not ( = ?auto_7874 ?auto_7873 ) ) ( ON ?auto_7871 ?auto_7874 ) ( CLEAR ?auto_7871 ) ( HOLDING ?auto_7873 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7873 )
      ( MAKE-1PILE ?auto_7870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7875 - BLOCK
    )
    :vars
    (
      ?auto_7876 - BLOCK
      ?auto_7877 - BLOCK
      ?auto_7878 - BLOCK
      ?auto_7879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7876 ?auto_7875 ) ( ON-TABLE ?auto_7875 ) ( not ( = ?auto_7875 ?auto_7876 ) ) ( not ( = ?auto_7875 ?auto_7877 ) ) ( not ( = ?auto_7875 ?auto_7878 ) ) ( not ( = ?auto_7876 ?auto_7877 ) ) ( not ( = ?auto_7876 ?auto_7878 ) ) ( not ( = ?auto_7877 ?auto_7878 ) ) ( ON ?auto_7877 ?auto_7876 ) ( not ( = ?auto_7879 ?auto_7878 ) ) ( not ( = ?auto_7875 ?auto_7879 ) ) ( not ( = ?auto_7876 ?auto_7879 ) ) ( not ( = ?auto_7877 ?auto_7879 ) ) ( ON ?auto_7878 ?auto_7877 ) ( ON ?auto_7879 ?auto_7878 ) ( CLEAR ?auto_7879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7875 ?auto_7876 ?auto_7877 ?auto_7878 )
      ( MAKE-1PILE ?auto_7875 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7884 - BLOCK
      ?auto_7885 - BLOCK
      ?auto_7886 - BLOCK
      ?auto_7887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7887 ) ( CLEAR ?auto_7886 ) ( ON-TABLE ?auto_7884 ) ( ON ?auto_7885 ?auto_7884 ) ( ON ?auto_7886 ?auto_7885 ) ( not ( = ?auto_7884 ?auto_7885 ) ) ( not ( = ?auto_7884 ?auto_7886 ) ) ( not ( = ?auto_7884 ?auto_7887 ) ) ( not ( = ?auto_7885 ?auto_7886 ) ) ( not ( = ?auto_7885 ?auto_7887 ) ) ( not ( = ?auto_7886 ?auto_7887 ) ) )
    :subtasks
    ( ( !STACK ?auto_7887 ?auto_7886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7888 - BLOCK
      ?auto_7889 - BLOCK
      ?auto_7890 - BLOCK
      ?auto_7891 - BLOCK
    )
    :vars
    (
      ?auto_7892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7890 ) ( ON-TABLE ?auto_7888 ) ( ON ?auto_7889 ?auto_7888 ) ( ON ?auto_7890 ?auto_7889 ) ( not ( = ?auto_7888 ?auto_7889 ) ) ( not ( = ?auto_7888 ?auto_7890 ) ) ( not ( = ?auto_7888 ?auto_7891 ) ) ( not ( = ?auto_7889 ?auto_7890 ) ) ( not ( = ?auto_7889 ?auto_7891 ) ) ( not ( = ?auto_7890 ?auto_7891 ) ) ( ON ?auto_7891 ?auto_7892 ) ( CLEAR ?auto_7891 ) ( HAND-EMPTY ) ( not ( = ?auto_7888 ?auto_7892 ) ) ( not ( = ?auto_7889 ?auto_7892 ) ) ( not ( = ?auto_7890 ?auto_7892 ) ) ( not ( = ?auto_7891 ?auto_7892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7891 ?auto_7892 )
      ( MAKE-4PILE ?auto_7888 ?auto_7889 ?auto_7890 ?auto_7891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7893 - BLOCK
      ?auto_7894 - BLOCK
      ?auto_7895 - BLOCK
      ?auto_7896 - BLOCK
    )
    :vars
    (
      ?auto_7897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7893 ) ( ON ?auto_7894 ?auto_7893 ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( not ( = ?auto_7893 ?auto_7895 ) ) ( not ( = ?auto_7893 ?auto_7896 ) ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( not ( = ?auto_7894 ?auto_7896 ) ) ( not ( = ?auto_7895 ?auto_7896 ) ) ( ON ?auto_7896 ?auto_7897 ) ( CLEAR ?auto_7896 ) ( not ( = ?auto_7893 ?auto_7897 ) ) ( not ( = ?auto_7894 ?auto_7897 ) ) ( not ( = ?auto_7895 ?auto_7897 ) ) ( not ( = ?auto_7896 ?auto_7897 ) ) ( HOLDING ?auto_7895 ) ( CLEAR ?auto_7894 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7893 ?auto_7894 ?auto_7895 )
      ( MAKE-4PILE ?auto_7893 ?auto_7894 ?auto_7895 ?auto_7896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7898 - BLOCK
      ?auto_7899 - BLOCK
      ?auto_7900 - BLOCK
      ?auto_7901 - BLOCK
    )
    :vars
    (
      ?auto_7902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7898 ) ( ON ?auto_7899 ?auto_7898 ) ( not ( = ?auto_7898 ?auto_7899 ) ) ( not ( = ?auto_7898 ?auto_7900 ) ) ( not ( = ?auto_7898 ?auto_7901 ) ) ( not ( = ?auto_7899 ?auto_7900 ) ) ( not ( = ?auto_7899 ?auto_7901 ) ) ( not ( = ?auto_7900 ?auto_7901 ) ) ( ON ?auto_7901 ?auto_7902 ) ( not ( = ?auto_7898 ?auto_7902 ) ) ( not ( = ?auto_7899 ?auto_7902 ) ) ( not ( = ?auto_7900 ?auto_7902 ) ) ( not ( = ?auto_7901 ?auto_7902 ) ) ( CLEAR ?auto_7899 ) ( ON ?auto_7900 ?auto_7901 ) ( CLEAR ?auto_7900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7902 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7902 ?auto_7901 )
      ( MAKE-4PILE ?auto_7898 ?auto_7899 ?auto_7900 ?auto_7901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7903 - BLOCK
      ?auto_7904 - BLOCK
      ?auto_7905 - BLOCK
      ?auto_7906 - BLOCK
    )
    :vars
    (
      ?auto_7907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7903 ) ( not ( = ?auto_7903 ?auto_7904 ) ) ( not ( = ?auto_7903 ?auto_7905 ) ) ( not ( = ?auto_7903 ?auto_7906 ) ) ( not ( = ?auto_7904 ?auto_7905 ) ) ( not ( = ?auto_7904 ?auto_7906 ) ) ( not ( = ?auto_7905 ?auto_7906 ) ) ( ON ?auto_7906 ?auto_7907 ) ( not ( = ?auto_7903 ?auto_7907 ) ) ( not ( = ?auto_7904 ?auto_7907 ) ) ( not ( = ?auto_7905 ?auto_7907 ) ) ( not ( = ?auto_7906 ?auto_7907 ) ) ( ON ?auto_7905 ?auto_7906 ) ( CLEAR ?auto_7905 ) ( ON-TABLE ?auto_7907 ) ( HOLDING ?auto_7904 ) ( CLEAR ?auto_7903 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7903 ?auto_7904 )
      ( MAKE-4PILE ?auto_7903 ?auto_7904 ?auto_7905 ?auto_7906 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7908 - BLOCK
      ?auto_7909 - BLOCK
      ?auto_7910 - BLOCK
      ?auto_7911 - BLOCK
    )
    :vars
    (
      ?auto_7912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7908 ) ( not ( = ?auto_7908 ?auto_7909 ) ) ( not ( = ?auto_7908 ?auto_7910 ) ) ( not ( = ?auto_7908 ?auto_7911 ) ) ( not ( = ?auto_7909 ?auto_7910 ) ) ( not ( = ?auto_7909 ?auto_7911 ) ) ( not ( = ?auto_7910 ?auto_7911 ) ) ( ON ?auto_7911 ?auto_7912 ) ( not ( = ?auto_7908 ?auto_7912 ) ) ( not ( = ?auto_7909 ?auto_7912 ) ) ( not ( = ?auto_7910 ?auto_7912 ) ) ( not ( = ?auto_7911 ?auto_7912 ) ) ( ON ?auto_7910 ?auto_7911 ) ( ON-TABLE ?auto_7912 ) ( CLEAR ?auto_7908 ) ( ON ?auto_7909 ?auto_7910 ) ( CLEAR ?auto_7909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7912 ?auto_7911 ?auto_7910 )
      ( MAKE-4PILE ?auto_7908 ?auto_7909 ?auto_7910 ?auto_7911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7913 - BLOCK
      ?auto_7914 - BLOCK
      ?auto_7915 - BLOCK
      ?auto_7916 - BLOCK
    )
    :vars
    (
      ?auto_7917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7913 ?auto_7914 ) ) ( not ( = ?auto_7913 ?auto_7915 ) ) ( not ( = ?auto_7913 ?auto_7916 ) ) ( not ( = ?auto_7914 ?auto_7915 ) ) ( not ( = ?auto_7914 ?auto_7916 ) ) ( not ( = ?auto_7915 ?auto_7916 ) ) ( ON ?auto_7916 ?auto_7917 ) ( not ( = ?auto_7913 ?auto_7917 ) ) ( not ( = ?auto_7914 ?auto_7917 ) ) ( not ( = ?auto_7915 ?auto_7917 ) ) ( not ( = ?auto_7916 ?auto_7917 ) ) ( ON ?auto_7915 ?auto_7916 ) ( ON-TABLE ?auto_7917 ) ( ON ?auto_7914 ?auto_7915 ) ( CLEAR ?auto_7914 ) ( HOLDING ?auto_7913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7913 )
      ( MAKE-4PILE ?auto_7913 ?auto_7914 ?auto_7915 ?auto_7916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7918 - BLOCK
      ?auto_7919 - BLOCK
      ?auto_7920 - BLOCK
      ?auto_7921 - BLOCK
    )
    :vars
    (
      ?auto_7922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7918 ?auto_7919 ) ) ( not ( = ?auto_7918 ?auto_7920 ) ) ( not ( = ?auto_7918 ?auto_7921 ) ) ( not ( = ?auto_7919 ?auto_7920 ) ) ( not ( = ?auto_7919 ?auto_7921 ) ) ( not ( = ?auto_7920 ?auto_7921 ) ) ( ON ?auto_7921 ?auto_7922 ) ( not ( = ?auto_7918 ?auto_7922 ) ) ( not ( = ?auto_7919 ?auto_7922 ) ) ( not ( = ?auto_7920 ?auto_7922 ) ) ( not ( = ?auto_7921 ?auto_7922 ) ) ( ON ?auto_7920 ?auto_7921 ) ( ON-TABLE ?auto_7922 ) ( ON ?auto_7919 ?auto_7920 ) ( ON ?auto_7918 ?auto_7919 ) ( CLEAR ?auto_7918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7922 ?auto_7921 ?auto_7920 ?auto_7919 )
      ( MAKE-4PILE ?auto_7918 ?auto_7919 ?auto_7920 ?auto_7921 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7926 - BLOCK
      ?auto_7927 - BLOCK
      ?auto_7928 - BLOCK
    )
    :vars
    (
      ?auto_7929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7929 ?auto_7928 ) ( CLEAR ?auto_7929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7926 ) ( ON ?auto_7927 ?auto_7926 ) ( ON ?auto_7928 ?auto_7927 ) ( not ( = ?auto_7926 ?auto_7927 ) ) ( not ( = ?auto_7926 ?auto_7928 ) ) ( not ( = ?auto_7926 ?auto_7929 ) ) ( not ( = ?auto_7927 ?auto_7928 ) ) ( not ( = ?auto_7927 ?auto_7929 ) ) ( not ( = ?auto_7928 ?auto_7929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7929 ?auto_7928 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7939 - BLOCK
      ?auto_7940 - BLOCK
      ?auto_7941 - BLOCK
    )
    :vars
    (
      ?auto_7942 - BLOCK
      ?auto_7943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7939 ) ( ON ?auto_7940 ?auto_7939 ) ( not ( = ?auto_7939 ?auto_7940 ) ) ( not ( = ?auto_7939 ?auto_7941 ) ) ( not ( = ?auto_7939 ?auto_7942 ) ) ( not ( = ?auto_7940 ?auto_7941 ) ) ( not ( = ?auto_7940 ?auto_7942 ) ) ( not ( = ?auto_7941 ?auto_7942 ) ) ( ON ?auto_7942 ?auto_7943 ) ( CLEAR ?auto_7942 ) ( not ( = ?auto_7939 ?auto_7943 ) ) ( not ( = ?auto_7940 ?auto_7943 ) ) ( not ( = ?auto_7941 ?auto_7943 ) ) ( not ( = ?auto_7942 ?auto_7943 ) ) ( HOLDING ?auto_7941 ) ( CLEAR ?auto_7940 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7939 ?auto_7940 ?auto_7941 ?auto_7942 )
      ( MAKE-3PILE ?auto_7939 ?auto_7940 ?auto_7941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7944 - BLOCK
      ?auto_7945 - BLOCK
      ?auto_7946 - BLOCK
    )
    :vars
    (
      ?auto_7948 - BLOCK
      ?auto_7947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7944 ) ( ON ?auto_7945 ?auto_7944 ) ( not ( = ?auto_7944 ?auto_7945 ) ) ( not ( = ?auto_7944 ?auto_7946 ) ) ( not ( = ?auto_7944 ?auto_7948 ) ) ( not ( = ?auto_7945 ?auto_7946 ) ) ( not ( = ?auto_7945 ?auto_7948 ) ) ( not ( = ?auto_7946 ?auto_7948 ) ) ( ON ?auto_7948 ?auto_7947 ) ( not ( = ?auto_7944 ?auto_7947 ) ) ( not ( = ?auto_7945 ?auto_7947 ) ) ( not ( = ?auto_7946 ?auto_7947 ) ) ( not ( = ?auto_7948 ?auto_7947 ) ) ( CLEAR ?auto_7945 ) ( ON ?auto_7946 ?auto_7948 ) ( CLEAR ?auto_7946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7947 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7947 ?auto_7948 )
      ( MAKE-3PILE ?auto_7944 ?auto_7945 ?auto_7946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7949 - BLOCK
      ?auto_7950 - BLOCK
      ?auto_7951 - BLOCK
    )
    :vars
    (
      ?auto_7952 - BLOCK
      ?auto_7953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7949 ) ( not ( = ?auto_7949 ?auto_7950 ) ) ( not ( = ?auto_7949 ?auto_7951 ) ) ( not ( = ?auto_7949 ?auto_7952 ) ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( not ( = ?auto_7950 ?auto_7952 ) ) ( not ( = ?auto_7951 ?auto_7952 ) ) ( ON ?auto_7952 ?auto_7953 ) ( not ( = ?auto_7949 ?auto_7953 ) ) ( not ( = ?auto_7950 ?auto_7953 ) ) ( not ( = ?auto_7951 ?auto_7953 ) ) ( not ( = ?auto_7952 ?auto_7953 ) ) ( ON ?auto_7951 ?auto_7952 ) ( CLEAR ?auto_7951 ) ( ON-TABLE ?auto_7953 ) ( HOLDING ?auto_7950 ) ( CLEAR ?auto_7949 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7949 ?auto_7950 )
      ( MAKE-3PILE ?auto_7949 ?auto_7950 ?auto_7951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7954 - BLOCK
      ?auto_7955 - BLOCK
      ?auto_7956 - BLOCK
    )
    :vars
    (
      ?auto_7958 - BLOCK
      ?auto_7957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7954 ) ( not ( = ?auto_7954 ?auto_7955 ) ) ( not ( = ?auto_7954 ?auto_7956 ) ) ( not ( = ?auto_7954 ?auto_7958 ) ) ( not ( = ?auto_7955 ?auto_7956 ) ) ( not ( = ?auto_7955 ?auto_7958 ) ) ( not ( = ?auto_7956 ?auto_7958 ) ) ( ON ?auto_7958 ?auto_7957 ) ( not ( = ?auto_7954 ?auto_7957 ) ) ( not ( = ?auto_7955 ?auto_7957 ) ) ( not ( = ?auto_7956 ?auto_7957 ) ) ( not ( = ?auto_7958 ?auto_7957 ) ) ( ON ?auto_7956 ?auto_7958 ) ( ON-TABLE ?auto_7957 ) ( CLEAR ?auto_7954 ) ( ON ?auto_7955 ?auto_7956 ) ( CLEAR ?auto_7955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7957 ?auto_7958 ?auto_7956 )
      ( MAKE-3PILE ?auto_7954 ?auto_7955 ?auto_7956 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7959 - BLOCK
      ?auto_7960 - BLOCK
      ?auto_7961 - BLOCK
    )
    :vars
    (
      ?auto_7963 - BLOCK
      ?auto_7962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7959 ?auto_7960 ) ) ( not ( = ?auto_7959 ?auto_7961 ) ) ( not ( = ?auto_7959 ?auto_7963 ) ) ( not ( = ?auto_7960 ?auto_7961 ) ) ( not ( = ?auto_7960 ?auto_7963 ) ) ( not ( = ?auto_7961 ?auto_7963 ) ) ( ON ?auto_7963 ?auto_7962 ) ( not ( = ?auto_7959 ?auto_7962 ) ) ( not ( = ?auto_7960 ?auto_7962 ) ) ( not ( = ?auto_7961 ?auto_7962 ) ) ( not ( = ?auto_7963 ?auto_7962 ) ) ( ON ?auto_7961 ?auto_7963 ) ( ON-TABLE ?auto_7962 ) ( ON ?auto_7960 ?auto_7961 ) ( CLEAR ?auto_7960 ) ( HOLDING ?auto_7959 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7959 )
      ( MAKE-3PILE ?auto_7959 ?auto_7960 ?auto_7961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7964 - BLOCK
      ?auto_7965 - BLOCK
      ?auto_7966 - BLOCK
    )
    :vars
    (
      ?auto_7967 - BLOCK
      ?auto_7968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7964 ?auto_7965 ) ) ( not ( = ?auto_7964 ?auto_7966 ) ) ( not ( = ?auto_7964 ?auto_7967 ) ) ( not ( = ?auto_7965 ?auto_7966 ) ) ( not ( = ?auto_7965 ?auto_7967 ) ) ( not ( = ?auto_7966 ?auto_7967 ) ) ( ON ?auto_7967 ?auto_7968 ) ( not ( = ?auto_7964 ?auto_7968 ) ) ( not ( = ?auto_7965 ?auto_7968 ) ) ( not ( = ?auto_7966 ?auto_7968 ) ) ( not ( = ?auto_7967 ?auto_7968 ) ) ( ON ?auto_7966 ?auto_7967 ) ( ON-TABLE ?auto_7968 ) ( ON ?auto_7965 ?auto_7966 ) ( ON ?auto_7964 ?auto_7965 ) ( CLEAR ?auto_7964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7968 ?auto_7967 ?auto_7966 ?auto_7965 )
      ( MAKE-3PILE ?auto_7964 ?auto_7965 ?auto_7966 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7970 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_7970 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_7970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7971 - BLOCK
    )
    :vars
    (
      ?auto_7972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7971 ?auto_7972 ) ( CLEAR ?auto_7971 ) ( HAND-EMPTY ) ( not ( = ?auto_7971 ?auto_7972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7971 ?auto_7972 )
      ( MAKE-1PILE ?auto_7971 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7973 - BLOCK
    )
    :vars
    (
      ?auto_7974 - BLOCK
      ?auto_7976 - BLOCK
      ?auto_7975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7973 ?auto_7974 ) ) ( HOLDING ?auto_7973 ) ( CLEAR ?auto_7974 ) ( ON-TABLE ?auto_7976 ) ( ON ?auto_7975 ?auto_7976 ) ( ON ?auto_7974 ?auto_7975 ) ( not ( = ?auto_7976 ?auto_7975 ) ) ( not ( = ?auto_7976 ?auto_7974 ) ) ( not ( = ?auto_7976 ?auto_7973 ) ) ( not ( = ?auto_7975 ?auto_7974 ) ) ( not ( = ?auto_7975 ?auto_7973 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7976 ?auto_7975 ?auto_7974 ?auto_7973 )
      ( MAKE-1PILE ?auto_7973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7977 - BLOCK
    )
    :vars
    (
      ?auto_7978 - BLOCK
      ?auto_7980 - BLOCK
      ?auto_7979 - BLOCK
      ?auto_7981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7977 ?auto_7978 ) ) ( CLEAR ?auto_7978 ) ( ON-TABLE ?auto_7980 ) ( ON ?auto_7979 ?auto_7980 ) ( ON ?auto_7978 ?auto_7979 ) ( not ( = ?auto_7980 ?auto_7979 ) ) ( not ( = ?auto_7980 ?auto_7978 ) ) ( not ( = ?auto_7980 ?auto_7977 ) ) ( not ( = ?auto_7979 ?auto_7978 ) ) ( not ( = ?auto_7979 ?auto_7977 ) ) ( ON ?auto_7977 ?auto_7981 ) ( CLEAR ?auto_7977 ) ( HAND-EMPTY ) ( not ( = ?auto_7977 ?auto_7981 ) ) ( not ( = ?auto_7978 ?auto_7981 ) ) ( not ( = ?auto_7980 ?auto_7981 ) ) ( not ( = ?auto_7979 ?auto_7981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7977 ?auto_7981 )
      ( MAKE-1PILE ?auto_7977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7982 - BLOCK
    )
    :vars
    (
      ?auto_7985 - BLOCK
      ?auto_7984 - BLOCK
      ?auto_7986 - BLOCK
      ?auto_7983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7982 ?auto_7985 ) ) ( ON-TABLE ?auto_7984 ) ( ON ?auto_7986 ?auto_7984 ) ( not ( = ?auto_7984 ?auto_7986 ) ) ( not ( = ?auto_7984 ?auto_7985 ) ) ( not ( = ?auto_7984 ?auto_7982 ) ) ( not ( = ?auto_7986 ?auto_7985 ) ) ( not ( = ?auto_7986 ?auto_7982 ) ) ( ON ?auto_7982 ?auto_7983 ) ( CLEAR ?auto_7982 ) ( not ( = ?auto_7982 ?auto_7983 ) ) ( not ( = ?auto_7985 ?auto_7983 ) ) ( not ( = ?auto_7984 ?auto_7983 ) ) ( not ( = ?auto_7986 ?auto_7983 ) ) ( HOLDING ?auto_7985 ) ( CLEAR ?auto_7986 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7984 ?auto_7986 ?auto_7985 )
      ( MAKE-1PILE ?auto_7982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7987 - BLOCK
    )
    :vars
    (
      ?auto_7990 - BLOCK
      ?auto_7991 - BLOCK
      ?auto_7988 - BLOCK
      ?auto_7989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7987 ?auto_7990 ) ) ( ON-TABLE ?auto_7991 ) ( ON ?auto_7988 ?auto_7991 ) ( not ( = ?auto_7991 ?auto_7988 ) ) ( not ( = ?auto_7991 ?auto_7990 ) ) ( not ( = ?auto_7991 ?auto_7987 ) ) ( not ( = ?auto_7988 ?auto_7990 ) ) ( not ( = ?auto_7988 ?auto_7987 ) ) ( ON ?auto_7987 ?auto_7989 ) ( not ( = ?auto_7987 ?auto_7989 ) ) ( not ( = ?auto_7990 ?auto_7989 ) ) ( not ( = ?auto_7991 ?auto_7989 ) ) ( not ( = ?auto_7988 ?auto_7989 ) ) ( CLEAR ?auto_7988 ) ( ON ?auto_7990 ?auto_7987 ) ( CLEAR ?auto_7990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7989 ?auto_7987 )
      ( MAKE-1PILE ?auto_7987 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7992 - BLOCK
    )
    :vars
    (
      ?auto_7994 - BLOCK
      ?auto_7995 - BLOCK
      ?auto_7993 - BLOCK
      ?auto_7996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7992 ?auto_7994 ) ) ( ON-TABLE ?auto_7995 ) ( not ( = ?auto_7995 ?auto_7993 ) ) ( not ( = ?auto_7995 ?auto_7994 ) ) ( not ( = ?auto_7995 ?auto_7992 ) ) ( not ( = ?auto_7993 ?auto_7994 ) ) ( not ( = ?auto_7993 ?auto_7992 ) ) ( ON ?auto_7992 ?auto_7996 ) ( not ( = ?auto_7992 ?auto_7996 ) ) ( not ( = ?auto_7994 ?auto_7996 ) ) ( not ( = ?auto_7995 ?auto_7996 ) ) ( not ( = ?auto_7993 ?auto_7996 ) ) ( ON ?auto_7994 ?auto_7992 ) ( CLEAR ?auto_7994 ) ( ON-TABLE ?auto_7996 ) ( HOLDING ?auto_7993 ) ( CLEAR ?auto_7995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7995 ?auto_7993 )
      ( MAKE-1PILE ?auto_7992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7997 - BLOCK
    )
    :vars
    (
      ?auto_8000 - BLOCK
      ?auto_7999 - BLOCK
      ?auto_8001 - BLOCK
      ?auto_7998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7997 ?auto_8000 ) ) ( ON-TABLE ?auto_7999 ) ( not ( = ?auto_7999 ?auto_8001 ) ) ( not ( = ?auto_7999 ?auto_8000 ) ) ( not ( = ?auto_7999 ?auto_7997 ) ) ( not ( = ?auto_8001 ?auto_8000 ) ) ( not ( = ?auto_8001 ?auto_7997 ) ) ( ON ?auto_7997 ?auto_7998 ) ( not ( = ?auto_7997 ?auto_7998 ) ) ( not ( = ?auto_8000 ?auto_7998 ) ) ( not ( = ?auto_7999 ?auto_7998 ) ) ( not ( = ?auto_8001 ?auto_7998 ) ) ( ON ?auto_8000 ?auto_7997 ) ( ON-TABLE ?auto_7998 ) ( CLEAR ?auto_7999 ) ( ON ?auto_8001 ?auto_8000 ) ( CLEAR ?auto_8001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7998 ?auto_7997 ?auto_8000 )
      ( MAKE-1PILE ?auto_7997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8002 - BLOCK
    )
    :vars
    (
      ?auto_8005 - BLOCK
      ?auto_8003 - BLOCK
      ?auto_8004 - BLOCK
      ?auto_8006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8002 ?auto_8005 ) ) ( not ( = ?auto_8003 ?auto_8004 ) ) ( not ( = ?auto_8003 ?auto_8005 ) ) ( not ( = ?auto_8003 ?auto_8002 ) ) ( not ( = ?auto_8004 ?auto_8005 ) ) ( not ( = ?auto_8004 ?auto_8002 ) ) ( ON ?auto_8002 ?auto_8006 ) ( not ( = ?auto_8002 ?auto_8006 ) ) ( not ( = ?auto_8005 ?auto_8006 ) ) ( not ( = ?auto_8003 ?auto_8006 ) ) ( not ( = ?auto_8004 ?auto_8006 ) ) ( ON ?auto_8005 ?auto_8002 ) ( ON-TABLE ?auto_8006 ) ( ON ?auto_8004 ?auto_8005 ) ( CLEAR ?auto_8004 ) ( HOLDING ?auto_8003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8003 )
      ( MAKE-1PILE ?auto_8002 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8007 - BLOCK
    )
    :vars
    (
      ?auto_8008 - BLOCK
      ?auto_8010 - BLOCK
      ?auto_8011 - BLOCK
      ?auto_8009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8007 ?auto_8008 ) ) ( not ( = ?auto_8010 ?auto_8011 ) ) ( not ( = ?auto_8010 ?auto_8008 ) ) ( not ( = ?auto_8010 ?auto_8007 ) ) ( not ( = ?auto_8011 ?auto_8008 ) ) ( not ( = ?auto_8011 ?auto_8007 ) ) ( ON ?auto_8007 ?auto_8009 ) ( not ( = ?auto_8007 ?auto_8009 ) ) ( not ( = ?auto_8008 ?auto_8009 ) ) ( not ( = ?auto_8010 ?auto_8009 ) ) ( not ( = ?auto_8011 ?auto_8009 ) ) ( ON ?auto_8008 ?auto_8007 ) ( ON-TABLE ?auto_8009 ) ( ON ?auto_8011 ?auto_8008 ) ( ON ?auto_8010 ?auto_8011 ) ( CLEAR ?auto_8010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8009 ?auto_8007 ?auto_8008 ?auto_8011 )
      ( MAKE-1PILE ?auto_8007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8014 - BLOCK
      ?auto_8015 - BLOCK
    )
    :vars
    (
      ?auto_8016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8016 ?auto_8015 ) ( CLEAR ?auto_8016 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8014 ) ( ON ?auto_8015 ?auto_8014 ) ( not ( = ?auto_8014 ?auto_8015 ) ) ( not ( = ?auto_8014 ?auto_8016 ) ) ( not ( = ?auto_8015 ?auto_8016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8016 ?auto_8015 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8017 - BLOCK
      ?auto_8018 - BLOCK
    )
    :vars
    (
      ?auto_8019 - BLOCK
      ?auto_8020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8019 ?auto_8018 ) ( CLEAR ?auto_8019 ) ( ON-TABLE ?auto_8017 ) ( ON ?auto_8018 ?auto_8017 ) ( not ( = ?auto_8017 ?auto_8018 ) ) ( not ( = ?auto_8017 ?auto_8019 ) ) ( not ( = ?auto_8018 ?auto_8019 ) ) ( HOLDING ?auto_8020 ) ( not ( = ?auto_8017 ?auto_8020 ) ) ( not ( = ?auto_8018 ?auto_8020 ) ) ( not ( = ?auto_8019 ?auto_8020 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_8020 )
      ( MAKE-2PILE ?auto_8017 ?auto_8018 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8021 - BLOCK
      ?auto_8022 - BLOCK
    )
    :vars
    (
      ?auto_8023 - BLOCK
      ?auto_8024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8023 ?auto_8022 ) ( ON-TABLE ?auto_8021 ) ( ON ?auto_8022 ?auto_8021 ) ( not ( = ?auto_8021 ?auto_8022 ) ) ( not ( = ?auto_8021 ?auto_8023 ) ) ( not ( = ?auto_8022 ?auto_8023 ) ) ( not ( = ?auto_8021 ?auto_8024 ) ) ( not ( = ?auto_8022 ?auto_8024 ) ) ( not ( = ?auto_8023 ?auto_8024 ) ) ( ON ?auto_8024 ?auto_8023 ) ( CLEAR ?auto_8024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8021 ?auto_8022 ?auto_8023 )
      ( MAKE-2PILE ?auto_8021 ?auto_8022 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8025 - BLOCK
      ?auto_8026 - BLOCK
    )
    :vars
    (
      ?auto_8028 - BLOCK
      ?auto_8027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8028 ?auto_8026 ) ( ON-TABLE ?auto_8025 ) ( ON ?auto_8026 ?auto_8025 ) ( not ( = ?auto_8025 ?auto_8026 ) ) ( not ( = ?auto_8025 ?auto_8028 ) ) ( not ( = ?auto_8026 ?auto_8028 ) ) ( not ( = ?auto_8025 ?auto_8027 ) ) ( not ( = ?auto_8026 ?auto_8027 ) ) ( not ( = ?auto_8028 ?auto_8027 ) ) ( HOLDING ?auto_8027 ) ( CLEAR ?auto_8028 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8025 ?auto_8026 ?auto_8028 ?auto_8027 )
      ( MAKE-2PILE ?auto_8025 ?auto_8026 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8029 - BLOCK
      ?auto_8030 - BLOCK
    )
    :vars
    (
      ?auto_8032 - BLOCK
      ?auto_8031 - BLOCK
      ?auto_8033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8032 ?auto_8030 ) ( ON-TABLE ?auto_8029 ) ( ON ?auto_8030 ?auto_8029 ) ( not ( = ?auto_8029 ?auto_8030 ) ) ( not ( = ?auto_8029 ?auto_8032 ) ) ( not ( = ?auto_8030 ?auto_8032 ) ) ( not ( = ?auto_8029 ?auto_8031 ) ) ( not ( = ?auto_8030 ?auto_8031 ) ) ( not ( = ?auto_8032 ?auto_8031 ) ) ( CLEAR ?auto_8032 ) ( ON ?auto_8031 ?auto_8033 ) ( CLEAR ?auto_8031 ) ( HAND-EMPTY ) ( not ( = ?auto_8029 ?auto_8033 ) ) ( not ( = ?auto_8030 ?auto_8033 ) ) ( not ( = ?auto_8032 ?auto_8033 ) ) ( not ( = ?auto_8031 ?auto_8033 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8031 ?auto_8033 )
      ( MAKE-2PILE ?auto_8029 ?auto_8030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8044 - BLOCK
      ?auto_8045 - BLOCK
    )
    :vars
    (
      ?auto_8046 - BLOCK
      ?auto_8047 - BLOCK
      ?auto_8048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8044 ) ( not ( = ?auto_8044 ?auto_8045 ) ) ( not ( = ?auto_8044 ?auto_8046 ) ) ( not ( = ?auto_8045 ?auto_8046 ) ) ( not ( = ?auto_8044 ?auto_8047 ) ) ( not ( = ?auto_8045 ?auto_8047 ) ) ( not ( = ?auto_8046 ?auto_8047 ) ) ( ON ?auto_8047 ?auto_8048 ) ( not ( = ?auto_8044 ?auto_8048 ) ) ( not ( = ?auto_8045 ?auto_8048 ) ) ( not ( = ?auto_8046 ?auto_8048 ) ) ( not ( = ?auto_8047 ?auto_8048 ) ) ( ON ?auto_8046 ?auto_8047 ) ( CLEAR ?auto_8046 ) ( HOLDING ?auto_8045 ) ( CLEAR ?auto_8044 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8044 ?auto_8045 ?auto_8046 )
      ( MAKE-2PILE ?auto_8044 ?auto_8045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8049 - BLOCK
      ?auto_8050 - BLOCK
    )
    :vars
    (
      ?auto_8051 - BLOCK
      ?auto_8053 - BLOCK
      ?auto_8052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8049 ) ( not ( = ?auto_8049 ?auto_8050 ) ) ( not ( = ?auto_8049 ?auto_8051 ) ) ( not ( = ?auto_8050 ?auto_8051 ) ) ( not ( = ?auto_8049 ?auto_8053 ) ) ( not ( = ?auto_8050 ?auto_8053 ) ) ( not ( = ?auto_8051 ?auto_8053 ) ) ( ON ?auto_8053 ?auto_8052 ) ( not ( = ?auto_8049 ?auto_8052 ) ) ( not ( = ?auto_8050 ?auto_8052 ) ) ( not ( = ?auto_8051 ?auto_8052 ) ) ( not ( = ?auto_8053 ?auto_8052 ) ) ( ON ?auto_8051 ?auto_8053 ) ( CLEAR ?auto_8049 ) ( ON ?auto_8050 ?auto_8051 ) ( CLEAR ?auto_8050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8052 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8052 ?auto_8053 ?auto_8051 )
      ( MAKE-2PILE ?auto_8049 ?auto_8050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8054 - BLOCK
      ?auto_8055 - BLOCK
    )
    :vars
    (
      ?auto_8058 - BLOCK
      ?auto_8056 - BLOCK
      ?auto_8057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8054 ?auto_8055 ) ) ( not ( = ?auto_8054 ?auto_8058 ) ) ( not ( = ?auto_8055 ?auto_8058 ) ) ( not ( = ?auto_8054 ?auto_8056 ) ) ( not ( = ?auto_8055 ?auto_8056 ) ) ( not ( = ?auto_8058 ?auto_8056 ) ) ( ON ?auto_8056 ?auto_8057 ) ( not ( = ?auto_8054 ?auto_8057 ) ) ( not ( = ?auto_8055 ?auto_8057 ) ) ( not ( = ?auto_8058 ?auto_8057 ) ) ( not ( = ?auto_8056 ?auto_8057 ) ) ( ON ?auto_8058 ?auto_8056 ) ( ON ?auto_8055 ?auto_8058 ) ( CLEAR ?auto_8055 ) ( ON-TABLE ?auto_8057 ) ( HOLDING ?auto_8054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8054 )
      ( MAKE-2PILE ?auto_8054 ?auto_8055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8059 - BLOCK
      ?auto_8060 - BLOCK
    )
    :vars
    (
      ?auto_8063 - BLOCK
      ?auto_8062 - BLOCK
      ?auto_8061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8059 ?auto_8060 ) ) ( not ( = ?auto_8059 ?auto_8063 ) ) ( not ( = ?auto_8060 ?auto_8063 ) ) ( not ( = ?auto_8059 ?auto_8062 ) ) ( not ( = ?auto_8060 ?auto_8062 ) ) ( not ( = ?auto_8063 ?auto_8062 ) ) ( ON ?auto_8062 ?auto_8061 ) ( not ( = ?auto_8059 ?auto_8061 ) ) ( not ( = ?auto_8060 ?auto_8061 ) ) ( not ( = ?auto_8063 ?auto_8061 ) ) ( not ( = ?auto_8062 ?auto_8061 ) ) ( ON ?auto_8063 ?auto_8062 ) ( ON ?auto_8060 ?auto_8063 ) ( ON-TABLE ?auto_8061 ) ( ON ?auto_8059 ?auto_8060 ) ( CLEAR ?auto_8059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8061 ?auto_8062 ?auto_8063 ?auto_8060 )
      ( MAKE-2PILE ?auto_8059 ?auto_8060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8066 - BLOCK
      ?auto_8067 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8067 ) ( CLEAR ?auto_8066 ) ( ON-TABLE ?auto_8066 ) ( not ( = ?auto_8066 ?auto_8067 ) ) )
    :subtasks
    ( ( !STACK ?auto_8067 ?auto_8066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8068 - BLOCK
      ?auto_8069 - BLOCK
    )
    :vars
    (
      ?auto_8070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8068 ) ( ON-TABLE ?auto_8068 ) ( not ( = ?auto_8068 ?auto_8069 ) ) ( ON ?auto_8069 ?auto_8070 ) ( CLEAR ?auto_8069 ) ( HAND-EMPTY ) ( not ( = ?auto_8068 ?auto_8070 ) ) ( not ( = ?auto_8069 ?auto_8070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8069 ?auto_8070 )
      ( MAKE-2PILE ?auto_8068 ?auto_8069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8071 - BLOCK
      ?auto_8072 - BLOCK
    )
    :vars
    (
      ?auto_8073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8071 ?auto_8072 ) ) ( ON ?auto_8072 ?auto_8073 ) ( CLEAR ?auto_8072 ) ( not ( = ?auto_8071 ?auto_8073 ) ) ( not ( = ?auto_8072 ?auto_8073 ) ) ( HOLDING ?auto_8071 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8071 )
      ( MAKE-2PILE ?auto_8071 ?auto_8072 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8074 - BLOCK
      ?auto_8075 - BLOCK
    )
    :vars
    (
      ?auto_8076 - BLOCK
      ?auto_8077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8074 ?auto_8075 ) ) ( ON ?auto_8075 ?auto_8076 ) ( not ( = ?auto_8074 ?auto_8076 ) ) ( not ( = ?auto_8075 ?auto_8076 ) ) ( ON ?auto_8074 ?auto_8075 ) ( CLEAR ?auto_8074 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8077 ) ( ON ?auto_8076 ?auto_8077 ) ( not ( = ?auto_8077 ?auto_8076 ) ) ( not ( = ?auto_8077 ?auto_8075 ) ) ( not ( = ?auto_8077 ?auto_8074 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8077 ?auto_8076 ?auto_8075 )
      ( MAKE-2PILE ?auto_8074 ?auto_8075 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8078 - BLOCK
      ?auto_8079 - BLOCK
    )
    :vars
    (
      ?auto_8080 - BLOCK
      ?auto_8081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8078 ?auto_8079 ) ) ( ON ?auto_8079 ?auto_8080 ) ( not ( = ?auto_8078 ?auto_8080 ) ) ( not ( = ?auto_8079 ?auto_8080 ) ) ( ON-TABLE ?auto_8081 ) ( ON ?auto_8080 ?auto_8081 ) ( not ( = ?auto_8081 ?auto_8080 ) ) ( not ( = ?auto_8081 ?auto_8079 ) ) ( not ( = ?auto_8081 ?auto_8078 ) ) ( HOLDING ?auto_8078 ) ( CLEAR ?auto_8079 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8081 ?auto_8080 ?auto_8079 ?auto_8078 )
      ( MAKE-2PILE ?auto_8078 ?auto_8079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8082 - BLOCK
      ?auto_8083 - BLOCK
    )
    :vars
    (
      ?auto_8085 - BLOCK
      ?auto_8084 - BLOCK
      ?auto_8086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8082 ?auto_8083 ) ) ( ON ?auto_8083 ?auto_8085 ) ( not ( = ?auto_8082 ?auto_8085 ) ) ( not ( = ?auto_8083 ?auto_8085 ) ) ( ON-TABLE ?auto_8084 ) ( ON ?auto_8085 ?auto_8084 ) ( not ( = ?auto_8084 ?auto_8085 ) ) ( not ( = ?auto_8084 ?auto_8083 ) ) ( not ( = ?auto_8084 ?auto_8082 ) ) ( CLEAR ?auto_8083 ) ( ON ?auto_8082 ?auto_8086 ) ( CLEAR ?auto_8082 ) ( HAND-EMPTY ) ( not ( = ?auto_8082 ?auto_8086 ) ) ( not ( = ?auto_8083 ?auto_8086 ) ) ( not ( = ?auto_8085 ?auto_8086 ) ) ( not ( = ?auto_8084 ?auto_8086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8082 ?auto_8086 )
      ( MAKE-2PILE ?auto_8082 ?auto_8083 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8087 - BLOCK
      ?auto_8088 - BLOCK
    )
    :vars
    (
      ?auto_8089 - BLOCK
      ?auto_8090 - BLOCK
      ?auto_8091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8087 ?auto_8088 ) ) ( not ( = ?auto_8087 ?auto_8089 ) ) ( not ( = ?auto_8088 ?auto_8089 ) ) ( ON-TABLE ?auto_8090 ) ( ON ?auto_8089 ?auto_8090 ) ( not ( = ?auto_8090 ?auto_8089 ) ) ( not ( = ?auto_8090 ?auto_8088 ) ) ( not ( = ?auto_8090 ?auto_8087 ) ) ( ON ?auto_8087 ?auto_8091 ) ( CLEAR ?auto_8087 ) ( not ( = ?auto_8087 ?auto_8091 ) ) ( not ( = ?auto_8088 ?auto_8091 ) ) ( not ( = ?auto_8089 ?auto_8091 ) ) ( not ( = ?auto_8090 ?auto_8091 ) ) ( HOLDING ?auto_8088 ) ( CLEAR ?auto_8089 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8090 ?auto_8089 ?auto_8088 )
      ( MAKE-2PILE ?auto_8087 ?auto_8088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8092 - BLOCK
      ?auto_8093 - BLOCK
    )
    :vars
    (
      ?auto_8095 - BLOCK
      ?auto_8096 - BLOCK
      ?auto_8094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8092 ?auto_8093 ) ) ( not ( = ?auto_8092 ?auto_8095 ) ) ( not ( = ?auto_8093 ?auto_8095 ) ) ( ON-TABLE ?auto_8096 ) ( ON ?auto_8095 ?auto_8096 ) ( not ( = ?auto_8096 ?auto_8095 ) ) ( not ( = ?auto_8096 ?auto_8093 ) ) ( not ( = ?auto_8096 ?auto_8092 ) ) ( ON ?auto_8092 ?auto_8094 ) ( not ( = ?auto_8092 ?auto_8094 ) ) ( not ( = ?auto_8093 ?auto_8094 ) ) ( not ( = ?auto_8095 ?auto_8094 ) ) ( not ( = ?auto_8096 ?auto_8094 ) ) ( CLEAR ?auto_8095 ) ( ON ?auto_8093 ?auto_8092 ) ( CLEAR ?auto_8093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8094 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8094 ?auto_8092 )
      ( MAKE-2PILE ?auto_8092 ?auto_8093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8097 - BLOCK
      ?auto_8098 - BLOCK
    )
    :vars
    (
      ?auto_8100 - BLOCK
      ?auto_8101 - BLOCK
      ?auto_8099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8097 ?auto_8098 ) ) ( not ( = ?auto_8097 ?auto_8100 ) ) ( not ( = ?auto_8098 ?auto_8100 ) ) ( ON-TABLE ?auto_8101 ) ( not ( = ?auto_8101 ?auto_8100 ) ) ( not ( = ?auto_8101 ?auto_8098 ) ) ( not ( = ?auto_8101 ?auto_8097 ) ) ( ON ?auto_8097 ?auto_8099 ) ( not ( = ?auto_8097 ?auto_8099 ) ) ( not ( = ?auto_8098 ?auto_8099 ) ) ( not ( = ?auto_8100 ?auto_8099 ) ) ( not ( = ?auto_8101 ?auto_8099 ) ) ( ON ?auto_8098 ?auto_8097 ) ( CLEAR ?auto_8098 ) ( ON-TABLE ?auto_8099 ) ( HOLDING ?auto_8100 ) ( CLEAR ?auto_8101 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8101 ?auto_8100 )
      ( MAKE-2PILE ?auto_8097 ?auto_8098 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8102 - BLOCK
      ?auto_8103 - BLOCK
    )
    :vars
    (
      ?auto_8105 - BLOCK
      ?auto_8106 - BLOCK
      ?auto_8104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8102 ?auto_8103 ) ) ( not ( = ?auto_8102 ?auto_8105 ) ) ( not ( = ?auto_8103 ?auto_8105 ) ) ( ON-TABLE ?auto_8106 ) ( not ( = ?auto_8106 ?auto_8105 ) ) ( not ( = ?auto_8106 ?auto_8103 ) ) ( not ( = ?auto_8106 ?auto_8102 ) ) ( ON ?auto_8102 ?auto_8104 ) ( not ( = ?auto_8102 ?auto_8104 ) ) ( not ( = ?auto_8103 ?auto_8104 ) ) ( not ( = ?auto_8105 ?auto_8104 ) ) ( not ( = ?auto_8106 ?auto_8104 ) ) ( ON ?auto_8103 ?auto_8102 ) ( ON-TABLE ?auto_8104 ) ( CLEAR ?auto_8106 ) ( ON ?auto_8105 ?auto_8103 ) ( CLEAR ?auto_8105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8104 ?auto_8102 ?auto_8103 )
      ( MAKE-2PILE ?auto_8102 ?auto_8103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8107 - BLOCK
      ?auto_8108 - BLOCK
    )
    :vars
    (
      ?auto_8109 - BLOCK
      ?auto_8111 - BLOCK
      ?auto_8110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8107 ?auto_8108 ) ) ( not ( = ?auto_8107 ?auto_8109 ) ) ( not ( = ?auto_8108 ?auto_8109 ) ) ( not ( = ?auto_8111 ?auto_8109 ) ) ( not ( = ?auto_8111 ?auto_8108 ) ) ( not ( = ?auto_8111 ?auto_8107 ) ) ( ON ?auto_8107 ?auto_8110 ) ( not ( = ?auto_8107 ?auto_8110 ) ) ( not ( = ?auto_8108 ?auto_8110 ) ) ( not ( = ?auto_8109 ?auto_8110 ) ) ( not ( = ?auto_8111 ?auto_8110 ) ) ( ON ?auto_8108 ?auto_8107 ) ( ON-TABLE ?auto_8110 ) ( ON ?auto_8109 ?auto_8108 ) ( CLEAR ?auto_8109 ) ( HOLDING ?auto_8111 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8111 )
      ( MAKE-2PILE ?auto_8107 ?auto_8108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8112 - BLOCK
      ?auto_8113 - BLOCK
    )
    :vars
    (
      ?auto_8115 - BLOCK
      ?auto_8116 - BLOCK
      ?auto_8114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8112 ?auto_8113 ) ) ( not ( = ?auto_8112 ?auto_8115 ) ) ( not ( = ?auto_8113 ?auto_8115 ) ) ( not ( = ?auto_8116 ?auto_8115 ) ) ( not ( = ?auto_8116 ?auto_8113 ) ) ( not ( = ?auto_8116 ?auto_8112 ) ) ( ON ?auto_8112 ?auto_8114 ) ( not ( = ?auto_8112 ?auto_8114 ) ) ( not ( = ?auto_8113 ?auto_8114 ) ) ( not ( = ?auto_8115 ?auto_8114 ) ) ( not ( = ?auto_8116 ?auto_8114 ) ) ( ON ?auto_8113 ?auto_8112 ) ( ON-TABLE ?auto_8114 ) ( ON ?auto_8115 ?auto_8113 ) ( ON ?auto_8116 ?auto_8115 ) ( CLEAR ?auto_8116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8114 ?auto_8112 ?auto_8113 ?auto_8115 )
      ( MAKE-2PILE ?auto_8112 ?auto_8113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8118 - BLOCK
    )
    :vars
    (
      ?auto_8119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8119 ?auto_8118 ) ( CLEAR ?auto_8119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8118 ) ( not ( = ?auto_8118 ?auto_8119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8119 ?auto_8118 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8120 - BLOCK
    )
    :vars
    (
      ?auto_8121 - BLOCK
      ?auto_8122 - BLOCK
      ?auto_8123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8121 ?auto_8120 ) ( CLEAR ?auto_8121 ) ( ON-TABLE ?auto_8120 ) ( not ( = ?auto_8120 ?auto_8121 ) ) ( HOLDING ?auto_8122 ) ( CLEAR ?auto_8123 ) ( not ( = ?auto_8120 ?auto_8122 ) ) ( not ( = ?auto_8120 ?auto_8123 ) ) ( not ( = ?auto_8121 ?auto_8122 ) ) ( not ( = ?auto_8121 ?auto_8123 ) ) ( not ( = ?auto_8122 ?auto_8123 ) ) )
    :subtasks
    ( ( !STACK ?auto_8122 ?auto_8123 )
      ( MAKE-1PILE ?auto_8120 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8124 - BLOCK
    )
    :vars
    (
      ?auto_8126 - BLOCK
      ?auto_8125 - BLOCK
      ?auto_8127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8126 ?auto_8124 ) ( ON-TABLE ?auto_8124 ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( CLEAR ?auto_8125 ) ( not ( = ?auto_8124 ?auto_8127 ) ) ( not ( = ?auto_8124 ?auto_8125 ) ) ( not ( = ?auto_8126 ?auto_8127 ) ) ( not ( = ?auto_8126 ?auto_8125 ) ) ( not ( = ?auto_8127 ?auto_8125 ) ) ( ON ?auto_8127 ?auto_8126 ) ( CLEAR ?auto_8127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8124 ?auto_8126 )
      ( MAKE-1PILE ?auto_8124 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8128 - BLOCK
    )
    :vars
    (
      ?auto_8129 - BLOCK
      ?auto_8130 - BLOCK
      ?auto_8131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8129 ?auto_8128 ) ( ON-TABLE ?auto_8128 ) ( not ( = ?auto_8128 ?auto_8129 ) ) ( not ( = ?auto_8128 ?auto_8130 ) ) ( not ( = ?auto_8128 ?auto_8131 ) ) ( not ( = ?auto_8129 ?auto_8130 ) ) ( not ( = ?auto_8129 ?auto_8131 ) ) ( not ( = ?auto_8130 ?auto_8131 ) ) ( ON ?auto_8130 ?auto_8129 ) ( CLEAR ?auto_8130 ) ( HOLDING ?auto_8131 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8131 )
      ( MAKE-1PILE ?auto_8128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8132 - BLOCK
    )
    :vars
    (
      ?auto_8135 - BLOCK
      ?auto_8133 - BLOCK
      ?auto_8134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8135 ?auto_8132 ) ( ON-TABLE ?auto_8132 ) ( not ( = ?auto_8132 ?auto_8135 ) ) ( not ( = ?auto_8132 ?auto_8133 ) ) ( not ( = ?auto_8132 ?auto_8134 ) ) ( not ( = ?auto_8135 ?auto_8133 ) ) ( not ( = ?auto_8135 ?auto_8134 ) ) ( not ( = ?auto_8133 ?auto_8134 ) ) ( ON ?auto_8133 ?auto_8135 ) ( ON ?auto_8134 ?auto_8133 ) ( CLEAR ?auto_8134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8132 ?auto_8135 ?auto_8133 )
      ( MAKE-1PILE ?auto_8132 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8136 - BLOCK
    )
    :vars
    (
      ?auto_8138 - BLOCK
      ?auto_8139 - BLOCK
      ?auto_8137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8138 ?auto_8136 ) ( ON-TABLE ?auto_8136 ) ( not ( = ?auto_8136 ?auto_8138 ) ) ( not ( = ?auto_8136 ?auto_8139 ) ) ( not ( = ?auto_8136 ?auto_8137 ) ) ( not ( = ?auto_8138 ?auto_8139 ) ) ( not ( = ?auto_8138 ?auto_8137 ) ) ( not ( = ?auto_8139 ?auto_8137 ) ) ( ON ?auto_8139 ?auto_8138 ) ( HOLDING ?auto_8137 ) ( CLEAR ?auto_8139 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8136 ?auto_8138 ?auto_8139 ?auto_8137 )
      ( MAKE-1PILE ?auto_8136 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8140 - BLOCK
    )
    :vars
    (
      ?auto_8142 - BLOCK
      ?auto_8141 - BLOCK
      ?auto_8143 - BLOCK
      ?auto_8144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8142 ?auto_8140 ) ( ON-TABLE ?auto_8140 ) ( not ( = ?auto_8140 ?auto_8142 ) ) ( not ( = ?auto_8140 ?auto_8141 ) ) ( not ( = ?auto_8140 ?auto_8143 ) ) ( not ( = ?auto_8142 ?auto_8141 ) ) ( not ( = ?auto_8142 ?auto_8143 ) ) ( not ( = ?auto_8141 ?auto_8143 ) ) ( ON ?auto_8141 ?auto_8142 ) ( CLEAR ?auto_8141 ) ( ON ?auto_8143 ?auto_8144 ) ( CLEAR ?auto_8143 ) ( HAND-EMPTY ) ( not ( = ?auto_8140 ?auto_8144 ) ) ( not ( = ?auto_8142 ?auto_8144 ) ) ( not ( = ?auto_8141 ?auto_8144 ) ) ( not ( = ?auto_8143 ?auto_8144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8143 ?auto_8144 )
      ( MAKE-1PILE ?auto_8140 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8145 - BLOCK
    )
    :vars
    (
      ?auto_8146 - BLOCK
      ?auto_8149 - BLOCK
      ?auto_8147 - BLOCK
      ?auto_8148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8146 ?auto_8145 ) ( ON-TABLE ?auto_8145 ) ( not ( = ?auto_8145 ?auto_8146 ) ) ( not ( = ?auto_8145 ?auto_8149 ) ) ( not ( = ?auto_8145 ?auto_8147 ) ) ( not ( = ?auto_8146 ?auto_8149 ) ) ( not ( = ?auto_8146 ?auto_8147 ) ) ( not ( = ?auto_8149 ?auto_8147 ) ) ( ON ?auto_8147 ?auto_8148 ) ( CLEAR ?auto_8147 ) ( not ( = ?auto_8145 ?auto_8148 ) ) ( not ( = ?auto_8146 ?auto_8148 ) ) ( not ( = ?auto_8149 ?auto_8148 ) ) ( not ( = ?auto_8147 ?auto_8148 ) ) ( HOLDING ?auto_8149 ) ( CLEAR ?auto_8146 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8145 ?auto_8146 ?auto_8149 )
      ( MAKE-1PILE ?auto_8145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8150 - BLOCK
    )
    :vars
    (
      ?auto_8154 - BLOCK
      ?auto_8153 - BLOCK
      ?auto_8152 - BLOCK
      ?auto_8151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8154 ?auto_8150 ) ( ON-TABLE ?auto_8150 ) ( not ( = ?auto_8150 ?auto_8154 ) ) ( not ( = ?auto_8150 ?auto_8153 ) ) ( not ( = ?auto_8150 ?auto_8152 ) ) ( not ( = ?auto_8154 ?auto_8153 ) ) ( not ( = ?auto_8154 ?auto_8152 ) ) ( not ( = ?auto_8153 ?auto_8152 ) ) ( ON ?auto_8152 ?auto_8151 ) ( not ( = ?auto_8150 ?auto_8151 ) ) ( not ( = ?auto_8154 ?auto_8151 ) ) ( not ( = ?auto_8153 ?auto_8151 ) ) ( not ( = ?auto_8152 ?auto_8151 ) ) ( CLEAR ?auto_8154 ) ( ON ?auto_8153 ?auto_8152 ) ( CLEAR ?auto_8153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8151 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8151 ?auto_8152 )
      ( MAKE-1PILE ?auto_8150 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8165 - BLOCK
    )
    :vars
    (
      ?auto_8167 - BLOCK
      ?auto_8168 - BLOCK
      ?auto_8166 - BLOCK
      ?auto_8169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8165 ?auto_8167 ) ) ( not ( = ?auto_8165 ?auto_8168 ) ) ( not ( = ?auto_8165 ?auto_8166 ) ) ( not ( = ?auto_8167 ?auto_8168 ) ) ( not ( = ?auto_8167 ?auto_8166 ) ) ( not ( = ?auto_8168 ?auto_8166 ) ) ( ON ?auto_8166 ?auto_8169 ) ( not ( = ?auto_8165 ?auto_8169 ) ) ( not ( = ?auto_8167 ?auto_8169 ) ) ( not ( = ?auto_8168 ?auto_8169 ) ) ( not ( = ?auto_8166 ?auto_8169 ) ) ( ON ?auto_8168 ?auto_8166 ) ( ON-TABLE ?auto_8169 ) ( ON ?auto_8167 ?auto_8168 ) ( CLEAR ?auto_8167 ) ( HOLDING ?auto_8165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8165 ?auto_8167 )
      ( MAKE-1PILE ?auto_8165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_8170 - BLOCK
    )
    :vars
    (
      ?auto_8172 - BLOCK
      ?auto_8174 - BLOCK
      ?auto_8173 - BLOCK
      ?auto_8171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8170 ?auto_8172 ) ) ( not ( = ?auto_8170 ?auto_8174 ) ) ( not ( = ?auto_8170 ?auto_8173 ) ) ( not ( = ?auto_8172 ?auto_8174 ) ) ( not ( = ?auto_8172 ?auto_8173 ) ) ( not ( = ?auto_8174 ?auto_8173 ) ) ( ON ?auto_8173 ?auto_8171 ) ( not ( = ?auto_8170 ?auto_8171 ) ) ( not ( = ?auto_8172 ?auto_8171 ) ) ( not ( = ?auto_8174 ?auto_8171 ) ) ( not ( = ?auto_8173 ?auto_8171 ) ) ( ON ?auto_8174 ?auto_8173 ) ( ON-TABLE ?auto_8171 ) ( ON ?auto_8172 ?auto_8174 ) ( ON ?auto_8170 ?auto_8172 ) ( CLEAR ?auto_8170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8171 ?auto_8173 ?auto_8174 ?auto_8172 )
      ( MAKE-1PILE ?auto_8170 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8178 - BLOCK
      ?auto_8179 - BLOCK
      ?auto_8180 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8180 ) ( CLEAR ?auto_8179 ) ( ON-TABLE ?auto_8178 ) ( ON ?auto_8179 ?auto_8178 ) ( not ( = ?auto_8178 ?auto_8179 ) ) ( not ( = ?auto_8178 ?auto_8180 ) ) ( not ( = ?auto_8179 ?auto_8180 ) ) )
    :subtasks
    ( ( !STACK ?auto_8180 ?auto_8179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8181 - BLOCK
      ?auto_8182 - BLOCK
      ?auto_8183 - BLOCK
    )
    :vars
    (
      ?auto_8184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8182 ) ( ON-TABLE ?auto_8181 ) ( ON ?auto_8182 ?auto_8181 ) ( not ( = ?auto_8181 ?auto_8182 ) ) ( not ( = ?auto_8181 ?auto_8183 ) ) ( not ( = ?auto_8182 ?auto_8183 ) ) ( ON ?auto_8183 ?auto_8184 ) ( CLEAR ?auto_8183 ) ( HAND-EMPTY ) ( not ( = ?auto_8181 ?auto_8184 ) ) ( not ( = ?auto_8182 ?auto_8184 ) ) ( not ( = ?auto_8183 ?auto_8184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8183 ?auto_8184 )
      ( MAKE-3PILE ?auto_8181 ?auto_8182 ?auto_8183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8185 - BLOCK
      ?auto_8186 - BLOCK
      ?auto_8187 - BLOCK
    )
    :vars
    (
      ?auto_8188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8185 ) ( not ( = ?auto_8185 ?auto_8186 ) ) ( not ( = ?auto_8185 ?auto_8187 ) ) ( not ( = ?auto_8186 ?auto_8187 ) ) ( ON ?auto_8187 ?auto_8188 ) ( CLEAR ?auto_8187 ) ( not ( = ?auto_8185 ?auto_8188 ) ) ( not ( = ?auto_8186 ?auto_8188 ) ) ( not ( = ?auto_8187 ?auto_8188 ) ) ( HOLDING ?auto_8186 ) ( CLEAR ?auto_8185 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8185 ?auto_8186 )
      ( MAKE-3PILE ?auto_8185 ?auto_8186 ?auto_8187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8189 - BLOCK
      ?auto_8190 - BLOCK
      ?auto_8191 - BLOCK
    )
    :vars
    (
      ?auto_8192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8189 ) ( not ( = ?auto_8189 ?auto_8190 ) ) ( not ( = ?auto_8189 ?auto_8191 ) ) ( not ( = ?auto_8190 ?auto_8191 ) ) ( ON ?auto_8191 ?auto_8192 ) ( not ( = ?auto_8189 ?auto_8192 ) ) ( not ( = ?auto_8190 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8192 ) ) ( CLEAR ?auto_8189 ) ( ON ?auto_8190 ?auto_8191 ) ( CLEAR ?auto_8190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8192 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8192 ?auto_8191 )
      ( MAKE-3PILE ?auto_8189 ?auto_8190 ?auto_8191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8193 - BLOCK
      ?auto_8194 - BLOCK
      ?auto_8195 - BLOCK
    )
    :vars
    (
      ?auto_8196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8193 ?auto_8194 ) ) ( not ( = ?auto_8193 ?auto_8195 ) ) ( not ( = ?auto_8194 ?auto_8195 ) ) ( ON ?auto_8195 ?auto_8196 ) ( not ( = ?auto_8193 ?auto_8196 ) ) ( not ( = ?auto_8194 ?auto_8196 ) ) ( not ( = ?auto_8195 ?auto_8196 ) ) ( ON ?auto_8194 ?auto_8195 ) ( CLEAR ?auto_8194 ) ( ON-TABLE ?auto_8196 ) ( HOLDING ?auto_8193 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8193 )
      ( MAKE-3PILE ?auto_8193 ?auto_8194 ?auto_8195 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8197 - BLOCK
      ?auto_8198 - BLOCK
      ?auto_8199 - BLOCK
    )
    :vars
    (
      ?auto_8200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8197 ?auto_8198 ) ) ( not ( = ?auto_8197 ?auto_8199 ) ) ( not ( = ?auto_8198 ?auto_8199 ) ) ( ON ?auto_8199 ?auto_8200 ) ( not ( = ?auto_8197 ?auto_8200 ) ) ( not ( = ?auto_8198 ?auto_8200 ) ) ( not ( = ?auto_8199 ?auto_8200 ) ) ( ON ?auto_8198 ?auto_8199 ) ( ON-TABLE ?auto_8200 ) ( ON ?auto_8197 ?auto_8198 ) ( CLEAR ?auto_8197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8200 ?auto_8199 ?auto_8198 )
      ( MAKE-3PILE ?auto_8197 ?auto_8198 ?auto_8199 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8201 - BLOCK
      ?auto_8202 - BLOCK
      ?auto_8203 - BLOCK
    )
    :vars
    (
      ?auto_8204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8201 ?auto_8202 ) ) ( not ( = ?auto_8201 ?auto_8203 ) ) ( not ( = ?auto_8202 ?auto_8203 ) ) ( ON ?auto_8203 ?auto_8204 ) ( not ( = ?auto_8201 ?auto_8204 ) ) ( not ( = ?auto_8202 ?auto_8204 ) ) ( not ( = ?auto_8203 ?auto_8204 ) ) ( ON ?auto_8202 ?auto_8203 ) ( ON-TABLE ?auto_8204 ) ( HOLDING ?auto_8201 ) ( CLEAR ?auto_8202 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8204 ?auto_8203 ?auto_8202 ?auto_8201 )
      ( MAKE-3PILE ?auto_8201 ?auto_8202 ?auto_8203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8205 - BLOCK
      ?auto_8206 - BLOCK
      ?auto_8207 - BLOCK
    )
    :vars
    (
      ?auto_8208 - BLOCK
      ?auto_8209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8205 ?auto_8206 ) ) ( not ( = ?auto_8205 ?auto_8207 ) ) ( not ( = ?auto_8206 ?auto_8207 ) ) ( ON ?auto_8207 ?auto_8208 ) ( not ( = ?auto_8205 ?auto_8208 ) ) ( not ( = ?auto_8206 ?auto_8208 ) ) ( not ( = ?auto_8207 ?auto_8208 ) ) ( ON ?auto_8206 ?auto_8207 ) ( ON-TABLE ?auto_8208 ) ( CLEAR ?auto_8206 ) ( ON ?auto_8205 ?auto_8209 ) ( CLEAR ?auto_8205 ) ( HAND-EMPTY ) ( not ( = ?auto_8205 ?auto_8209 ) ) ( not ( = ?auto_8206 ?auto_8209 ) ) ( not ( = ?auto_8207 ?auto_8209 ) ) ( not ( = ?auto_8208 ?auto_8209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8205 ?auto_8209 )
      ( MAKE-3PILE ?auto_8205 ?auto_8206 ?auto_8207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8210 - BLOCK
      ?auto_8211 - BLOCK
      ?auto_8212 - BLOCK
    )
    :vars
    (
      ?auto_8214 - BLOCK
      ?auto_8213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8210 ?auto_8211 ) ) ( not ( = ?auto_8210 ?auto_8212 ) ) ( not ( = ?auto_8211 ?auto_8212 ) ) ( ON ?auto_8212 ?auto_8214 ) ( not ( = ?auto_8210 ?auto_8214 ) ) ( not ( = ?auto_8211 ?auto_8214 ) ) ( not ( = ?auto_8212 ?auto_8214 ) ) ( ON-TABLE ?auto_8214 ) ( ON ?auto_8210 ?auto_8213 ) ( CLEAR ?auto_8210 ) ( not ( = ?auto_8210 ?auto_8213 ) ) ( not ( = ?auto_8211 ?auto_8213 ) ) ( not ( = ?auto_8212 ?auto_8213 ) ) ( not ( = ?auto_8214 ?auto_8213 ) ) ( HOLDING ?auto_8211 ) ( CLEAR ?auto_8212 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8214 ?auto_8212 ?auto_8211 )
      ( MAKE-3PILE ?auto_8210 ?auto_8211 ?auto_8212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8215 - BLOCK
      ?auto_8216 - BLOCK
      ?auto_8217 - BLOCK
    )
    :vars
    (
      ?auto_8218 - BLOCK
      ?auto_8219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8215 ?auto_8216 ) ) ( not ( = ?auto_8215 ?auto_8217 ) ) ( not ( = ?auto_8216 ?auto_8217 ) ) ( ON ?auto_8217 ?auto_8218 ) ( not ( = ?auto_8215 ?auto_8218 ) ) ( not ( = ?auto_8216 ?auto_8218 ) ) ( not ( = ?auto_8217 ?auto_8218 ) ) ( ON-TABLE ?auto_8218 ) ( ON ?auto_8215 ?auto_8219 ) ( not ( = ?auto_8215 ?auto_8219 ) ) ( not ( = ?auto_8216 ?auto_8219 ) ) ( not ( = ?auto_8217 ?auto_8219 ) ) ( not ( = ?auto_8218 ?auto_8219 ) ) ( CLEAR ?auto_8217 ) ( ON ?auto_8216 ?auto_8215 ) ( CLEAR ?auto_8216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8219 ?auto_8215 )
      ( MAKE-3PILE ?auto_8215 ?auto_8216 ?auto_8217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8220 - BLOCK
      ?auto_8221 - BLOCK
      ?auto_8222 - BLOCK
    )
    :vars
    (
      ?auto_8223 - BLOCK
      ?auto_8224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8220 ?auto_8221 ) ) ( not ( = ?auto_8220 ?auto_8222 ) ) ( not ( = ?auto_8221 ?auto_8222 ) ) ( not ( = ?auto_8220 ?auto_8223 ) ) ( not ( = ?auto_8221 ?auto_8223 ) ) ( not ( = ?auto_8222 ?auto_8223 ) ) ( ON-TABLE ?auto_8223 ) ( ON ?auto_8220 ?auto_8224 ) ( not ( = ?auto_8220 ?auto_8224 ) ) ( not ( = ?auto_8221 ?auto_8224 ) ) ( not ( = ?auto_8222 ?auto_8224 ) ) ( not ( = ?auto_8223 ?auto_8224 ) ) ( ON ?auto_8221 ?auto_8220 ) ( CLEAR ?auto_8221 ) ( ON-TABLE ?auto_8224 ) ( HOLDING ?auto_8222 ) ( CLEAR ?auto_8223 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8223 ?auto_8222 )
      ( MAKE-3PILE ?auto_8220 ?auto_8221 ?auto_8222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8225 - BLOCK
      ?auto_8226 - BLOCK
      ?auto_8227 - BLOCK
    )
    :vars
    (
      ?auto_8229 - BLOCK
      ?auto_8228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8225 ?auto_8226 ) ) ( not ( = ?auto_8225 ?auto_8227 ) ) ( not ( = ?auto_8226 ?auto_8227 ) ) ( not ( = ?auto_8225 ?auto_8229 ) ) ( not ( = ?auto_8226 ?auto_8229 ) ) ( not ( = ?auto_8227 ?auto_8229 ) ) ( ON-TABLE ?auto_8229 ) ( ON ?auto_8225 ?auto_8228 ) ( not ( = ?auto_8225 ?auto_8228 ) ) ( not ( = ?auto_8226 ?auto_8228 ) ) ( not ( = ?auto_8227 ?auto_8228 ) ) ( not ( = ?auto_8229 ?auto_8228 ) ) ( ON ?auto_8226 ?auto_8225 ) ( ON-TABLE ?auto_8228 ) ( CLEAR ?auto_8229 ) ( ON ?auto_8227 ?auto_8226 ) ( CLEAR ?auto_8227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8228 ?auto_8225 ?auto_8226 )
      ( MAKE-3PILE ?auto_8225 ?auto_8226 ?auto_8227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8230 - BLOCK
      ?auto_8231 - BLOCK
      ?auto_8232 - BLOCK
    )
    :vars
    (
      ?auto_8233 - BLOCK
      ?auto_8234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8230 ?auto_8231 ) ) ( not ( = ?auto_8230 ?auto_8232 ) ) ( not ( = ?auto_8231 ?auto_8232 ) ) ( not ( = ?auto_8230 ?auto_8233 ) ) ( not ( = ?auto_8231 ?auto_8233 ) ) ( not ( = ?auto_8232 ?auto_8233 ) ) ( ON ?auto_8230 ?auto_8234 ) ( not ( = ?auto_8230 ?auto_8234 ) ) ( not ( = ?auto_8231 ?auto_8234 ) ) ( not ( = ?auto_8232 ?auto_8234 ) ) ( not ( = ?auto_8233 ?auto_8234 ) ) ( ON ?auto_8231 ?auto_8230 ) ( ON-TABLE ?auto_8234 ) ( ON ?auto_8232 ?auto_8231 ) ( CLEAR ?auto_8232 ) ( HOLDING ?auto_8233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8233 )
      ( MAKE-3PILE ?auto_8230 ?auto_8231 ?auto_8232 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8235 - BLOCK
      ?auto_8236 - BLOCK
      ?auto_8237 - BLOCK
    )
    :vars
    (
      ?auto_8238 - BLOCK
      ?auto_8239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8235 ?auto_8236 ) ) ( not ( = ?auto_8235 ?auto_8237 ) ) ( not ( = ?auto_8236 ?auto_8237 ) ) ( not ( = ?auto_8235 ?auto_8238 ) ) ( not ( = ?auto_8236 ?auto_8238 ) ) ( not ( = ?auto_8237 ?auto_8238 ) ) ( ON ?auto_8235 ?auto_8239 ) ( not ( = ?auto_8235 ?auto_8239 ) ) ( not ( = ?auto_8236 ?auto_8239 ) ) ( not ( = ?auto_8237 ?auto_8239 ) ) ( not ( = ?auto_8238 ?auto_8239 ) ) ( ON ?auto_8236 ?auto_8235 ) ( ON-TABLE ?auto_8239 ) ( ON ?auto_8237 ?auto_8236 ) ( ON ?auto_8238 ?auto_8237 ) ( CLEAR ?auto_8238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8239 ?auto_8235 ?auto_8236 ?auto_8237 )
      ( MAKE-3PILE ?auto_8235 ?auto_8236 ?auto_8237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8244 - BLOCK
      ?auto_8245 - BLOCK
      ?auto_8246 - BLOCK
      ?auto_8247 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_8247 ) ( CLEAR ?auto_8246 ) ( ON-TABLE ?auto_8244 ) ( ON ?auto_8245 ?auto_8244 ) ( ON ?auto_8246 ?auto_8245 ) ( not ( = ?auto_8244 ?auto_8245 ) ) ( not ( = ?auto_8244 ?auto_8246 ) ) ( not ( = ?auto_8244 ?auto_8247 ) ) ( not ( = ?auto_8245 ?auto_8246 ) ) ( not ( = ?auto_8245 ?auto_8247 ) ) ( not ( = ?auto_8246 ?auto_8247 ) ) )
    :subtasks
    ( ( !STACK ?auto_8247 ?auto_8246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8248 - BLOCK
      ?auto_8249 - BLOCK
      ?auto_8250 - BLOCK
      ?auto_8251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8250 ) ( ON-TABLE ?auto_8248 ) ( ON ?auto_8249 ?auto_8248 ) ( ON ?auto_8250 ?auto_8249 ) ( not ( = ?auto_8248 ?auto_8249 ) ) ( not ( = ?auto_8248 ?auto_8250 ) ) ( not ( = ?auto_8248 ?auto_8251 ) ) ( not ( = ?auto_8249 ?auto_8250 ) ) ( not ( = ?auto_8249 ?auto_8251 ) ) ( not ( = ?auto_8250 ?auto_8251 ) ) ( ON-TABLE ?auto_8251 ) ( CLEAR ?auto_8251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_8251 )
      ( MAKE-4PILE ?auto_8248 ?auto_8249 ?auto_8250 ?auto_8251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8252 - BLOCK
      ?auto_8253 - BLOCK
      ?auto_8254 - BLOCK
      ?auto_8255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8252 ) ( ON ?auto_8253 ?auto_8252 ) ( not ( = ?auto_8252 ?auto_8253 ) ) ( not ( = ?auto_8252 ?auto_8254 ) ) ( not ( = ?auto_8252 ?auto_8255 ) ) ( not ( = ?auto_8253 ?auto_8254 ) ) ( not ( = ?auto_8253 ?auto_8255 ) ) ( not ( = ?auto_8254 ?auto_8255 ) ) ( ON-TABLE ?auto_8255 ) ( CLEAR ?auto_8255 ) ( HOLDING ?auto_8254 ) ( CLEAR ?auto_8253 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8252 ?auto_8253 ?auto_8254 )
      ( MAKE-4PILE ?auto_8252 ?auto_8253 ?auto_8254 ?auto_8255 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8256 - BLOCK
      ?auto_8257 - BLOCK
      ?auto_8258 - BLOCK
      ?auto_8259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8256 ) ( ON ?auto_8257 ?auto_8256 ) ( not ( = ?auto_8256 ?auto_8257 ) ) ( not ( = ?auto_8256 ?auto_8258 ) ) ( not ( = ?auto_8256 ?auto_8259 ) ) ( not ( = ?auto_8257 ?auto_8258 ) ) ( not ( = ?auto_8257 ?auto_8259 ) ) ( not ( = ?auto_8258 ?auto_8259 ) ) ( ON-TABLE ?auto_8259 ) ( CLEAR ?auto_8257 ) ( ON ?auto_8258 ?auto_8259 ) ( CLEAR ?auto_8258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8259 )
      ( MAKE-4PILE ?auto_8256 ?auto_8257 ?auto_8258 ?auto_8259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8260 - BLOCK
      ?auto_8261 - BLOCK
      ?auto_8262 - BLOCK
      ?auto_8263 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8260 ) ( not ( = ?auto_8260 ?auto_8261 ) ) ( not ( = ?auto_8260 ?auto_8262 ) ) ( not ( = ?auto_8260 ?auto_8263 ) ) ( not ( = ?auto_8261 ?auto_8262 ) ) ( not ( = ?auto_8261 ?auto_8263 ) ) ( not ( = ?auto_8262 ?auto_8263 ) ) ( ON-TABLE ?auto_8263 ) ( ON ?auto_8262 ?auto_8263 ) ( CLEAR ?auto_8262 ) ( HOLDING ?auto_8261 ) ( CLEAR ?auto_8260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8260 ?auto_8261 )
      ( MAKE-4PILE ?auto_8260 ?auto_8261 ?auto_8262 ?auto_8263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8264 - BLOCK
      ?auto_8265 - BLOCK
      ?auto_8266 - BLOCK
      ?auto_8267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8264 ) ( not ( = ?auto_8264 ?auto_8265 ) ) ( not ( = ?auto_8264 ?auto_8266 ) ) ( not ( = ?auto_8264 ?auto_8267 ) ) ( not ( = ?auto_8265 ?auto_8266 ) ) ( not ( = ?auto_8265 ?auto_8267 ) ) ( not ( = ?auto_8266 ?auto_8267 ) ) ( ON-TABLE ?auto_8267 ) ( ON ?auto_8266 ?auto_8267 ) ( CLEAR ?auto_8264 ) ( ON ?auto_8265 ?auto_8266 ) ( CLEAR ?auto_8265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8267 ?auto_8266 )
      ( MAKE-4PILE ?auto_8264 ?auto_8265 ?auto_8266 ?auto_8267 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8268 - BLOCK
      ?auto_8269 - BLOCK
      ?auto_8270 - BLOCK
      ?auto_8271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8268 ?auto_8269 ) ) ( not ( = ?auto_8268 ?auto_8270 ) ) ( not ( = ?auto_8268 ?auto_8271 ) ) ( not ( = ?auto_8269 ?auto_8270 ) ) ( not ( = ?auto_8269 ?auto_8271 ) ) ( not ( = ?auto_8270 ?auto_8271 ) ) ( ON-TABLE ?auto_8271 ) ( ON ?auto_8270 ?auto_8271 ) ( ON ?auto_8269 ?auto_8270 ) ( CLEAR ?auto_8269 ) ( HOLDING ?auto_8268 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8268 )
      ( MAKE-4PILE ?auto_8268 ?auto_8269 ?auto_8270 ?auto_8271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8272 - BLOCK
      ?auto_8273 - BLOCK
      ?auto_8274 - BLOCK
      ?auto_8275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8272 ?auto_8273 ) ) ( not ( = ?auto_8272 ?auto_8274 ) ) ( not ( = ?auto_8272 ?auto_8275 ) ) ( not ( = ?auto_8273 ?auto_8274 ) ) ( not ( = ?auto_8273 ?auto_8275 ) ) ( not ( = ?auto_8274 ?auto_8275 ) ) ( ON-TABLE ?auto_8275 ) ( ON ?auto_8274 ?auto_8275 ) ( ON ?auto_8273 ?auto_8274 ) ( ON ?auto_8272 ?auto_8273 ) ( CLEAR ?auto_8272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8275 ?auto_8274 ?auto_8273 )
      ( MAKE-4PILE ?auto_8272 ?auto_8273 ?auto_8274 ?auto_8275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8276 - BLOCK
      ?auto_8277 - BLOCK
      ?auto_8278 - BLOCK
      ?auto_8279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8276 ?auto_8277 ) ) ( not ( = ?auto_8276 ?auto_8278 ) ) ( not ( = ?auto_8276 ?auto_8279 ) ) ( not ( = ?auto_8277 ?auto_8278 ) ) ( not ( = ?auto_8277 ?auto_8279 ) ) ( not ( = ?auto_8278 ?auto_8279 ) ) ( ON-TABLE ?auto_8279 ) ( ON ?auto_8278 ?auto_8279 ) ( ON ?auto_8277 ?auto_8278 ) ( HOLDING ?auto_8276 ) ( CLEAR ?auto_8277 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8279 ?auto_8278 ?auto_8277 ?auto_8276 )
      ( MAKE-4PILE ?auto_8276 ?auto_8277 ?auto_8278 ?auto_8279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8280 - BLOCK
      ?auto_8281 - BLOCK
      ?auto_8282 - BLOCK
      ?auto_8283 - BLOCK
    )
    :vars
    (
      ?auto_8284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8280 ?auto_8281 ) ) ( not ( = ?auto_8280 ?auto_8282 ) ) ( not ( = ?auto_8280 ?auto_8283 ) ) ( not ( = ?auto_8281 ?auto_8282 ) ) ( not ( = ?auto_8281 ?auto_8283 ) ) ( not ( = ?auto_8282 ?auto_8283 ) ) ( ON-TABLE ?auto_8283 ) ( ON ?auto_8282 ?auto_8283 ) ( ON ?auto_8281 ?auto_8282 ) ( CLEAR ?auto_8281 ) ( ON ?auto_8280 ?auto_8284 ) ( CLEAR ?auto_8280 ) ( HAND-EMPTY ) ( not ( = ?auto_8280 ?auto_8284 ) ) ( not ( = ?auto_8281 ?auto_8284 ) ) ( not ( = ?auto_8282 ?auto_8284 ) ) ( not ( = ?auto_8283 ?auto_8284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8280 ?auto_8284 )
      ( MAKE-4PILE ?auto_8280 ?auto_8281 ?auto_8282 ?auto_8283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8285 - BLOCK
      ?auto_8286 - BLOCK
      ?auto_8287 - BLOCK
      ?auto_8288 - BLOCK
    )
    :vars
    (
      ?auto_8289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8285 ?auto_8286 ) ) ( not ( = ?auto_8285 ?auto_8287 ) ) ( not ( = ?auto_8285 ?auto_8288 ) ) ( not ( = ?auto_8286 ?auto_8287 ) ) ( not ( = ?auto_8286 ?auto_8288 ) ) ( not ( = ?auto_8287 ?auto_8288 ) ) ( ON-TABLE ?auto_8288 ) ( ON ?auto_8287 ?auto_8288 ) ( ON ?auto_8285 ?auto_8289 ) ( CLEAR ?auto_8285 ) ( not ( = ?auto_8285 ?auto_8289 ) ) ( not ( = ?auto_8286 ?auto_8289 ) ) ( not ( = ?auto_8287 ?auto_8289 ) ) ( not ( = ?auto_8288 ?auto_8289 ) ) ( HOLDING ?auto_8286 ) ( CLEAR ?auto_8287 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8288 ?auto_8287 ?auto_8286 )
      ( MAKE-4PILE ?auto_8285 ?auto_8286 ?auto_8287 ?auto_8288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8290 - BLOCK
      ?auto_8291 - BLOCK
      ?auto_8292 - BLOCK
      ?auto_8293 - BLOCK
    )
    :vars
    (
      ?auto_8294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8290 ?auto_8291 ) ) ( not ( = ?auto_8290 ?auto_8292 ) ) ( not ( = ?auto_8290 ?auto_8293 ) ) ( not ( = ?auto_8291 ?auto_8292 ) ) ( not ( = ?auto_8291 ?auto_8293 ) ) ( not ( = ?auto_8292 ?auto_8293 ) ) ( ON-TABLE ?auto_8293 ) ( ON ?auto_8292 ?auto_8293 ) ( ON ?auto_8290 ?auto_8294 ) ( not ( = ?auto_8290 ?auto_8294 ) ) ( not ( = ?auto_8291 ?auto_8294 ) ) ( not ( = ?auto_8292 ?auto_8294 ) ) ( not ( = ?auto_8293 ?auto_8294 ) ) ( CLEAR ?auto_8292 ) ( ON ?auto_8291 ?auto_8290 ) ( CLEAR ?auto_8291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8294 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8294 ?auto_8290 )
      ( MAKE-4PILE ?auto_8290 ?auto_8291 ?auto_8292 ?auto_8293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8295 - BLOCK
      ?auto_8296 - BLOCK
      ?auto_8297 - BLOCK
      ?auto_8298 - BLOCK
    )
    :vars
    (
      ?auto_8299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8295 ?auto_8296 ) ) ( not ( = ?auto_8295 ?auto_8297 ) ) ( not ( = ?auto_8295 ?auto_8298 ) ) ( not ( = ?auto_8296 ?auto_8297 ) ) ( not ( = ?auto_8296 ?auto_8298 ) ) ( not ( = ?auto_8297 ?auto_8298 ) ) ( ON-TABLE ?auto_8298 ) ( ON ?auto_8295 ?auto_8299 ) ( not ( = ?auto_8295 ?auto_8299 ) ) ( not ( = ?auto_8296 ?auto_8299 ) ) ( not ( = ?auto_8297 ?auto_8299 ) ) ( not ( = ?auto_8298 ?auto_8299 ) ) ( ON ?auto_8296 ?auto_8295 ) ( CLEAR ?auto_8296 ) ( ON-TABLE ?auto_8299 ) ( HOLDING ?auto_8297 ) ( CLEAR ?auto_8298 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8298 ?auto_8297 )
      ( MAKE-4PILE ?auto_8295 ?auto_8296 ?auto_8297 ?auto_8298 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8300 - BLOCK
      ?auto_8301 - BLOCK
      ?auto_8302 - BLOCK
      ?auto_8303 - BLOCK
    )
    :vars
    (
      ?auto_8304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8300 ?auto_8301 ) ) ( not ( = ?auto_8300 ?auto_8302 ) ) ( not ( = ?auto_8300 ?auto_8303 ) ) ( not ( = ?auto_8301 ?auto_8302 ) ) ( not ( = ?auto_8301 ?auto_8303 ) ) ( not ( = ?auto_8302 ?auto_8303 ) ) ( ON-TABLE ?auto_8303 ) ( ON ?auto_8300 ?auto_8304 ) ( not ( = ?auto_8300 ?auto_8304 ) ) ( not ( = ?auto_8301 ?auto_8304 ) ) ( not ( = ?auto_8302 ?auto_8304 ) ) ( not ( = ?auto_8303 ?auto_8304 ) ) ( ON ?auto_8301 ?auto_8300 ) ( ON-TABLE ?auto_8304 ) ( CLEAR ?auto_8303 ) ( ON ?auto_8302 ?auto_8301 ) ( CLEAR ?auto_8302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8304 ?auto_8300 ?auto_8301 )
      ( MAKE-4PILE ?auto_8300 ?auto_8301 ?auto_8302 ?auto_8303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8305 - BLOCK
      ?auto_8306 - BLOCK
      ?auto_8307 - BLOCK
      ?auto_8308 - BLOCK
    )
    :vars
    (
      ?auto_8309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8305 ?auto_8306 ) ) ( not ( = ?auto_8305 ?auto_8307 ) ) ( not ( = ?auto_8305 ?auto_8308 ) ) ( not ( = ?auto_8306 ?auto_8307 ) ) ( not ( = ?auto_8306 ?auto_8308 ) ) ( not ( = ?auto_8307 ?auto_8308 ) ) ( ON ?auto_8305 ?auto_8309 ) ( not ( = ?auto_8305 ?auto_8309 ) ) ( not ( = ?auto_8306 ?auto_8309 ) ) ( not ( = ?auto_8307 ?auto_8309 ) ) ( not ( = ?auto_8308 ?auto_8309 ) ) ( ON ?auto_8306 ?auto_8305 ) ( ON-TABLE ?auto_8309 ) ( ON ?auto_8307 ?auto_8306 ) ( CLEAR ?auto_8307 ) ( HOLDING ?auto_8308 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8308 )
      ( MAKE-4PILE ?auto_8305 ?auto_8306 ?auto_8307 ?auto_8308 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8310 - BLOCK
      ?auto_8311 - BLOCK
      ?auto_8312 - BLOCK
      ?auto_8313 - BLOCK
    )
    :vars
    (
      ?auto_8314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8310 ?auto_8311 ) ) ( not ( = ?auto_8310 ?auto_8312 ) ) ( not ( = ?auto_8310 ?auto_8313 ) ) ( not ( = ?auto_8311 ?auto_8312 ) ) ( not ( = ?auto_8311 ?auto_8313 ) ) ( not ( = ?auto_8312 ?auto_8313 ) ) ( ON ?auto_8310 ?auto_8314 ) ( not ( = ?auto_8310 ?auto_8314 ) ) ( not ( = ?auto_8311 ?auto_8314 ) ) ( not ( = ?auto_8312 ?auto_8314 ) ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( ON ?auto_8311 ?auto_8310 ) ( ON-TABLE ?auto_8314 ) ( ON ?auto_8312 ?auto_8311 ) ( ON ?auto_8313 ?auto_8312 ) ( CLEAR ?auto_8313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8314 ?auto_8310 ?auto_8311 ?auto_8312 )
      ( MAKE-4PILE ?auto_8310 ?auto_8311 ?auto_8312 ?auto_8313 ) )
  )

)

